org $078000

;===================================================================================================

Link:
|078000| PHB
|078001| PHK
|078002| PLB

|078003| REP #$20

|078005| LDA.b $22
|078007| STA.w $0FC2

|07800A| LDA.b $20
|07800C| STA.w $0FC4

|07800F| SEP #$20

|078011| STZ.w $0FC1

|078014| LDA.w $02E4
|078017| BNE .no_control

|078019| JSR LinkControlHandler

.no_control
|07801C| JSR HandleSomariaAndGraves

|07801F| PLB

|078020| RTL

;===================================================================================================

PlayLinkSFX1Panned:
|078021| JSR GetLinkSFXPan
|078024| STA.w $012D

|078027| RTS

;===================================================================================================

PlayLinkSFX2Panned:
|078028| JSR GetLinkSFXPan
|07802B| STA.w $012E

|07802E| RTS

;===================================================================================================

PlayLinkSFX3Panned:
|07802F| JSR GetLinkSFXPan
|078032| STA.w $012F

|078035| RTS

;===================================================================================================

GetLinkSFXPan:
|078036| STA.w $0CF8

|078039| JSL CalculateLinkSFXPan
|07803D| ORA.w $0CF8

|078040| RTS

;===================================================================================================

pool LinkControlHandler

.vectors
|078041| dw LinkState_Default                  ; 0x00
|078043| dw LinkState_Pits                     ; 0x01
|078045| dw LinkState_Recoil                   ; 0x02
|078047| dw LinkState_SpinAttack               ; 0x03
|078049| dw LinkState_Swimming                 ; 0x04
|07804B| dw LinkState_OnIce                    ; 0x05
|07804D| dw LinkState_Recoil                   ; 0x06
|07804F| dw LinkState_Zapped                   ; 0x07
|078051| dw LinkState_UsingEther               ; 0x08
|078053| dw LinkState_UsingBombos              ; 0x09
|078055| dw LinkState_UsingQuake               ; 0x0A
|078057| dw LinkState_HoppingSouthOW           ; 0x0B
|078059| dw LinkState_HoppingHorizontallyOW    ; 0x0C
|07805B| dw LinkState_HoppingDiagonallyUpOW    ; 0x0D
|07805D| dw LinkState_HoppingDiagonallyDownOW  ; 0x0E
|07805F| dw LinkState_0F                       ; 0x0F
|078061| dw LinkState_0F                       ; 0x10
|078063| dw LinkState_Dashing                  ; 0x11
|078065| dw LinkState_ExitingDash              ; 0x12
|078067| dw LinkState_Hookshotting             ; 0x13
|078069| dw LinkState_CrossingWorlds           ; 0x14
|07806B| dw LinkState_ShowingOffItem           ; 0x15
|07806D| dw LinkState_Sleeping                 ; 0x16
|07806F| dw LinkState_Bunny                    ; 0x17
|078071| dw LinkState_HoldingBigRock           ; 0x18
|078073| dw LinkState_ReceivingEther           ; 0x19
|078075| dw LinkState_ReceivingBombos          ; 0x1A
|078077| dw LinkState_ReadingDesertTablet      ; 0x1B
|078079| dw LinkState_TemporaryBunny           ; 0x1C
|07807B| dw LinkState_TreePull                 ; 0x1D
|07807D| dw LinkState_SpinAttack               ; 0x1E

endpool

;---------------------------------------------------------------------------------------------------

LinkControlHandler:
|07807F| LDA.w $0373
|078082| BEQ .no_damage

|078084| LDA.b $55
|078086| BEQ .no_cape

|078088| STZ.w $0373

|07808B| STZ.b $4D
|07808D| STZ.b $46

|07808F| BRA .no_damage

.no_cape
|078091| LDA.w $037B
|078094| BNE .no_damage

|078096| LDA.w $0373
|078099| STA.b $00

|07809B| STZ.w $0373

|07809E| LDA.w $0C4A
|0780A1| CMP.b #$05 ; ANCILLA 05
|0780A3| BNE .dont_delete_boom

|0780A5| LDA.w $0300
|0780A8| BNE .dont_delete_boom

|0780AA| LDA.b $3D
|0780AC| BEQ .dont_delete_boom

|0780AE| STZ.w $0C4A
|0780B1| STZ.w $035F

.dont_delete_boom
|0780B4| LDA.w $031F
|0780B7| BNE .have_iframes

|0780B9| LDA.b #$3A
|0780BB| STA.w $031F

.have_iframes
|0780BE| LDA.b #$26 ; SFX2.26
|0780C0| JSR PlayLinkSFX2Panned

|0780C3| INC.w $0CFC

|0780C6| LDA.l $7EF36D
|0780CA| SEC
|0780CB| SBC.b $00

|0780CD| CMP.b #$00
|0780CF| BEQ .you_died

|0780D1| CMP.b #$A8
|0780D3| BCC .do_not_die

;---------------------------------------------------------------------------------------------------

.you_died
|0780D5| LDA.b $1C
|0780D7| STA.l $7EC211

|0780DB| LDA.b $1D
|0780DD| STA.l $7EC212

|0780E1| LDA.b $10
|0780E3| STA.w $010C

|0780E6| LDA.b #$12
|0780E8| STA.b $10

|0780EA| LDA.b #$01
|0780EC| STA.b $11

|0780EE| LDA.b #$00
|0780F0| STA.w $031F
|0780F3| STA.l $7EF372

;---------------------------------------------------------------------------------------------------

.do_not_die
|0780F7| STA.l $7EF36D

.no_damage
|0780FB| LDA.b $5D
|0780FD| BEQ .base_state

|0780FF| JSR HandleCapePassive

.base_state
|078102| LDA.b $5D
|078104| ASL A
|078105| TAX

|078106| JMP.w (.vectors,X)

;===================================================================================================

LinkState_Default:
|078109| JSR CacheCameraPropertiesIfOutdoors

|07810C| LDA.b $F5
|07810E| AND.b #$80
|078110| BEQ .stay_in_bounds_forever

|078112| LDA.w $037F
|078115| EOR.b #$01
|078117| STA.w $037F

.stay_in_bounds_forever
|07811A| JSR HandleBunnyTransformation
|07811D| BCC .no_bunny

|07811F| LDA.b $5D
|078121| CMP.b #$17 ; LINKSTATE 17
|078123| BNE .already_bunny

|078125| BRL LinkState_Bunny

.already_bunny
|078128| RTS

;---------------------------------------------------------------------------------------------------

.no_bunny
|078129| STZ.w $02CA

|07812C| LDA.b $4D
|07812E| BEQ .not_recoiling

;---------------------------------------------------------------------------------------------------

#HandleLinkFromState1D:
|078130| STZ.w $0301
|078133| STZ.w $037A

|078136| STZ.w $020B
|078139| STZ.w $0350

|07813C| STZ.w $030D
|07813F| STZ.w $030E

|078142| STZ.w $030A

|078145| STZ.b $3B

|078147| LDA.b $3A
|078149| AND.b #$BF
|07814B| STA.b $3A

|07814D| STZ.w $0308
|078150| STZ.w $0309

|078153| STZ.w $0376
|078156| STZ.b $48

|078158| JSL ResetSwimmingState

|07815C| LDA.b $50
|07815E| AND.b #$FE
|078160| STA.b $50

|078162| STZ.b $25

|078164| LDA.w $0360
|078167| BEQ .no_zapping

|078169| LDA.b $55
|07816B| BEQ .cape_is_off

|07816D| JSR ForciblyUnequipCape_quietly

;---------------------------------------------------------------------------------------------------

.cape_is_off
|078170| JSR ResetSwordAndItemUsage

|078173| LDA.b #$01
|078175| STA.w $037B

|078178| STZ.w $0300

|07817B| LDA.b #$02
|07817D| STA.b $3D

|07817F| STZ.b $2E

|078181| LDA.b $67
|078183| AND.b #$F0
|078185| STA.b $67

|078187| LDA.b #$2B ; SFX3.2B
|078189| JSR PlayLinkSFX3Panned

|07818C| LDA.b #$07 ; LINKSTATE 07
|07818E| STA.b $5D

|078190| BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.no_zapping
|078193| LDA.b $1B
|078195| BNE .pointless_branch

.pointless_branch
|078197| STZ.b $6B

|078199| LDA.b #$02 ; LINKSTATE 02
|07819B| STA.b $5D

|07819D| BRL LinkState_Recoil

;===================================================================================================

.not_recoiling
|0781A0| LDA.b #$FF
|0781A2| STA.b $24
|0781A4| STA.b $25
|0781A6| STA.b $29

|0781A8| STZ.w $02C6

|0781AB| JSR HandleTossing
|0781AE| BCS .continue_a

|0781B0| JSR HandleAPress

|0781B3| LDA.w $0308
|0781B6| ORA.w $0376
|0781B9| BNE .continue_a

|0781BB| LDA.w $0377
|0781BE| BNE .continue_a

; Spinspeed/item dash fix
|0781C0| LDA.b $5D
|0781C2| CMP.b #$11 ; LINKSTATE 11
|0781C4| BEQ .continue_a

|0781C6| JSR HandleYItem

|0781C9| LDA.l $7EF3C5
|0781CD| BEQ .continue_a

|0781CF| JSR HandleSwordCooldown

|0781D2| LDA.b $5D
|0781D4| CMP.b #$03 ; LINKSTATE 03
|0781D6| BNE .continue_a

|0781D8| STZ.b $30
|0781DA| STZ.b $31

|0781DC| BRL .dont_halt_link

;---------------------------------------------------------------------------------------------------

.continue_a
|0781DF| JSR HandleCapePassive_LiftCheck

|0781E2| LDA.b $46
|0781E4| BEQ .not_recoil_timering

|0781E6| LDA.b $6B
|0781E8| BEQ .dont_reset_slope

|0781EA| STZ.b $6B

.dont_reset_slope
|0781EC| STZ.w $030D
|0781EF| STZ.w $030E
|0781F2| STZ.w $030A

|0781F5| STZ.b $3B

|0781F7| STZ.w $0309
|0781FA| STZ.w $0308

|0781FD| STZ.w $0376

|078200| LDA.b $3A
|078202| AND.b #$80
|078204| BNE .dont_allow_turning

|078206| LDA.b $50
|078208| AND.b #$FE
|07820A| STA.b $50

.dont_allow_turning
|07820C| BRL HandleRecoilAndTimer

;---------------------------------------------------------------------------------------------------

.not_recoil_timering
|07820F| LDA.w $0377
|078212| BEQ .no_forced_pull_anim

|078214| STZ.b $67

|078216| BRA .proceed_to_finish_up

.no_forced_pull_anim
|078218| LDA.w $02E1
|07821B| BNE .proceed_to_finish_up

|07821D| LDA.w $0376
|078220| AND.b #$FD
|078222| BNE .proceed_to_finish_up

|078224| LDA.w $0308
|078227| AND.b #$7F
|078229| BNE .proceed_to_finish_up

|07822B| LDA.w $0308
|07822E| AND.b #$80
|078230| BEQ .not_carrying

|078232| LDA.w $0309
|078235| AND.b #$01
|078237| BNE .proceed_to_finish_up

.not_carrying
|078239| LDA.w $0301
|07823C| BNE .proceed_to_finish_up

|07823E| LDA.w $037A
|078241| BNE .proceed_to_finish_up

|078243| LDA.b $3C
|078245| CMP.b #$09
|078247| BCS .sword_out

|078249| LDA.b $3A
|07824B| AND.b #$20
|07824D| BNE .sword_out

|07824F| LDA.b $3A
|078251| AND.b #$80
|078253| BEQ .sword_out

;---------------------------------------------------------------------------------------------------

.proceed_to_finish_up
|078255| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.sword_out
|078257| LDA.w $034A
|07825A| BEQ .not_on_any_ice

|07825C| LDA.b #$01
|07825E| STA.w $0335
|078261| STA.w $0337

|078264| LDA.b #$80
|078266| STA.w $0334
|078269| STA.w $0336

|07826C| BRL HandleSwimMovement

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
|07826F| JSR ResetAllAcceleration

|078272| LDA.b $49
|078274| AND.b #$0F
|078276| BNE .am_moving

|078278| LDA.w $0376
|07827B| AND.b #$02
|07827D| BNE .finish_up

|07827F| LDA.b $F0
|078281| AND.b #$0F
|078283| BNE .am_moving

|078285| STA.b $30
|078287| STA.b $31

|078289| STA.b $67
|07828B| STA.b $26

|07828D| STZ.b $2E

|07828F| LDA.b $48
|078291| AND.b #$F0
|078293| STA.b $48

|078295| LDX.b #$20
|078297| STX.w $0371

|07829A| LDX.b #$13
|07829C| STX.w $0375

|07829F| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.am_moving
|0782A1| STA.b $67

|0782A3| CMP.b $26
|0782A5| BEQ .directions_matching

|0782A7| STZ.b $2A
|0782A9| STZ.b $2B
|0782AB| STZ.b $6B
|0782AD| STZ.b $48

|0782AF| LDX.b #$20
|0782B1| STX.w $0371

|0782B4| LDX.b #$13
|0782B6| STX.w $0375

.directions_matching
|0782B9| STA.b $26

;---------------------------------------------------------------------------------------------------

.finish_up
|0782BB| JSR HandleLinkDiagonalCollision
|0782BE| JSL HandleLinkVelocity
|0782C2| JSR HandleLinkCardinalCollision

|0782C5| JSL HandleLinkAnimation_FullLongEntry

|0782C9| LDA.w $0377
|0782CC| BEQ .dont_halt_link

|0782CE| STZ.b $30
|0782D0| STZ.b $31

.dont_halt_link
|0782D2| STZ.w $0302

|0782D5| JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

#EXIT_0782D8:
|0782D8| CLC

|0782D9| RTS

;===================================================================================================

HandleBunnyTransformation:
|0782DA| LDA.w $03F5
|0782DD| ORA.w $03F6
|0782E0| BEQ EXIT_0782D8

|0782E2| LDA.w $03F7
|0782E5| BNE .tick_timer

|0782E7| LDA.b $5D
|0782E9| CMP.b #$17 ; LINKSTATE 17
|0782EB| BEQ .exit_clear_timer

|0782ED| CMP.b #$1C ; LINKSTATE 1C
|0782EF| BEQ .exit_clear_timer

|0782F1| LDA.w $0309
|0782F4| AND.b #$02
|0782F6| BEQ .ignore_carry

|0782F8| STZ.w $0308

.ignore_carry
|0782FB| LDA.w $0308
|0782FE| AND.b #$80
|078300| PHA

|078301| JSL ResetLinkProperties_A

|078305| PLA
|078306| STA.w $0308

;---------------------------------------------------------------------------------------------------

|078309| LDX.b #$04

.next_ancilla
|07830B| LDA.w $0C4A,X
|07830E| CMP.b #$30 ; ANCILLA 30
|078310| BEQ .kill_ancilla

|078312| CMP.b #$31 ; ANCILLA 31
|078314| BNE .skip_ancilla

.kill_ancilla
|078316| STZ.w $0C4A,X

.skip_ancilla
|078319| DEX
|07831A| BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

|07831C| JSR CancelDash

|07831F| LDY.b #$04
|078321| LDA.b #$23 ; ANCILLA 23
|078323| JSL AncillaAdd_CapePoof

|078327| LDA.b #$14 ; SFX2.14
|078329| JSR PlayLinkSFX2Panned

|07832C| LDA.b #$14
|07832E| STA.w $02E2

|078331| LDA.b #$01
|078333| STA.w $037B
|078336| STA.w $03F7

|078339| LDA.b #$0C
|07833B| STA.b $4B

;---------------------------------------------------------------------------------------------------

.tick_timer
|07833D| DEC.w $02E2
|078340| BPL .dont_revert

|078342| LDA.b #$1C ; LINKSTATE 1C
|078344| STA.b $5D

|078346| LDA.b #$01
|078348| STA.w $02E0
|07834B| STA.b $56

|07834D| JSL RefreshEquipmentPalettes_bunny

|078351| STZ.b $4B
|078353| STZ.w $037B
|078356| STZ.w $03F7

|078359| BRA .dont_revert

;---------------------------------------------------------------------------------------------------

.exit_clear_timer
|07835B| STZ.w $03F5
|07835E| STZ.w $03F6

|078361| CLC

|078362| RTS

;---------------------------------------------------------------------------------------------------

.dont_revert
|078363| SEC

|078364| RTS

;===================================================================================================

LinkState_TemporaryBunny:
|078365| LDA.w $03F5
|078368| ORA.w $03F6
|07836B| BNE .delay_change_back

|07836D| LDY.b #$04
|07836F| LDA.b #$23 ; ANCILLA 23
|078371| JSL AncillaAdd_CapePoof

|078375| LDA.b #$15 ; SFX2.15
|078377| JSR PlayLinkSFX2Panned

|07837A| LDA.b #$20
|07837C| STA.w $02E2

|07837F| LDA.b #$00 ; LINKSTATE 00
|078381| STA.b $5D

|078383| JSL ResetLinkProperties_C

|078387| STZ.w $03F7

|07838A| STZ.b $56
|07838C| STZ.w $02E0

|07838F| JSL RefreshEquipmentPalettes_sword_and_mail

|078393| STZ.w $03F7

|078396| BRL LinkState_Default

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_078399:
|078399| RTS

;---------------------------------------------------------------------------------------------------

.delay_change_back
|07839A| REP #$20

|07839C| DEC.w $03F5

|07839F| SEP #$20

;===================================================================================================

LinkState_Bunny:
|0783A1| JSR CacheCameraPropertiesIfOutdoors

|0783A4| LDA.b $F5
|0783A6| AND.b #$80
|0783A8| BEQ .dont_toggle_oob

|0783AA| LDA.w $037F
|0783AD| EOR.b #$01
|0783AF| STA.w $037F

.dont_toggle_oob
|0783B2| STZ.w $02CA

|0783B5| LDA.w $0345
|0783B8| BNE LinkState_Bunny.recache

|0783BA| LDA.b $4D
|0783BC| BEQ .recoiling

|0783BE| LDA.l $7EF357
|0783C2| BEQ LinkState_Bunny.recache

|0783C4| STZ.w $02E0

;---------------------------------------------------------------------------------------------------

.recache
|0783C7| STZ.w $03F7
|0783CA| STZ.w $03F5
|0783CD| STZ.w $03F6

|0783D0| LDA.l $7EF357
|0783D4| BEQ .no_pearl_a

|0783D6| STZ.b $56
|0783D8| STZ.b $4D

;---------------------------------------------------------------------------------------------------

.no_pearl_a
|0783DA| STZ.b $2E
|0783DC| STZ.w $02E1
|0783DF| STZ.b $50

|0783E1| JSL ResetSwimmingState

|0783E5| LDA.b #$02 ; LINKSTATE 02
|0783E7| STA.b $5D

|0783E9| LDA.l $7EF357
|0783ED| BEQ .no_pearl_b

|0783EF| LDA.b #$00 ; LINKSTATE 00
|0783F1| STA.b $5D

|0783F3| JSL RefreshEquipmentPalettes_sword_and_mail

.no_pearl_b
|0783F7| BRL .exit

;---------------------------------------------------------------------------------------------------

.recoiling
|0783FA| LDA.b $46
|0783FC| BEQ .wait_maybe_not_recoiling

|0783FE| BRL HandleRecoilAndTimer

.wait_maybe_not_recoiling
|078401| LDA.b #$FF
|078403| STA.b $24
|078405| STA.b $25
|078407| STA.b $29

|078409| STZ.w $02C6

|07840C| LDA.w $034A
|07840F| BEQ .not_on_any_ice

|078411| LDA.b #$01
|078413| STA.w $0335
|078416| STA.w $0337

|078419| LDA.b #$80
|07841B| STA.w $0334
|07841E| STA.w $0336

|078421| BRL HandleSwimMovement

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
|078424| JSR ResetAllAcceleration
|078427| JSR HandleYItem

|07842A| LDA.b $49
|07842C| AND.b #$0F
|07842E| BNE .movement

|078430| LDA.b $F0
|078432| AND.b #$0F
|078434| BNE .movement

|078436| STA.b $30
|078438| STA.b $31

|07843A| STA.b $67
|07843C| STA.b $26

|07843E| STZ.b $2E

|078440| LDA.b $48
|078442| AND.b #$F6
|078444| STA.b $48

|078446| LDX.b #$20
|078448| STX.w $0371

|07844B| LDX.b #$13
|07844D| STX.w $0375
|078450| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.movement
|078452| STA.b $67

|078454| CMP.b $26
|078456| BEQ .directions_match

|078458| STZ.b $2A
|07845A| STZ.b $2B

|07845C| STZ.b $6B
|07845E| STZ.b $48

|078460| LDX.b #$20
|078462| STX.w $0371

|078465| LDX.b #$13
|078467| STX.w $0375

.directions_match
|07846A| STA.b $26

;---------------------------------------------------------------------------------------------------

.finish_up
|07846C| JSR HandleLinkDiagonalCollision
|07846F| JSL HandleLinkVelocity
|078473| JSR HandleLinkCardinalCollision
|078476| JSL HandleLinkAnimation_FullLongEntry

|07847A| STZ.w $0302

|07847D| JSR HandleIndoorCameraAndDoors

.exit
|078480| RTS

;===================================================================================================

LinkState_HoldingBigRock:
|078481| LDA.b $4D
|078483| BEQ .no_recoil

|078485| STZ.w $0301
|078488| STZ.w $037A

|07848B| STZ.w $020B

|07848E| STZ.w $0350
|078491| STZ.w $030D
|078494| STZ.w $030E
|078497| STZ.w $030A

|07849A| STZ.b $3B

|07849C| STZ.w $0308
|07849F| STZ.w $0309
|0784A2| STZ.w $0376

|0784A5| STZ.b $48

|0784A7| LDA.b $50
|0784A9| AND.b #$FE
|0784AB| STA.b $50

|0784AD| STZ.b $25

|0784AF| LDA.w $0360
|0784B2| BEQ .no_zapping

|0784B4| JSR ResetSwordAndItemUsage

|0784B7| LDA.b #$01
|0784B9| STA.w $037B

|0784BC| STZ.w $0300

|0784BF| LDA.b #$02
|0784C1| STA.b $3D

|0784C3| STZ.b $2E

|0784C5| LDA.b $67
|0784C7| AND.b #$F0
|0784C9| STA.b $67

|0784CB| LDA.b #$2B ; SFX3.2B
|0784CD| JSR PlayLinkSFX3Panned

|0784D0| LDA.b #$07 ; LINKSTATE 07
|0784D2| STA.b $5D

|0784D4| BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.no_zapping
|0784D7| LDA.b #$02 ; LINKSTATE 02
|0784D9| STA.b $5D

|0784DB| BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.no_recoil
|0784DE| LDA.b #$FF
|0784E0| STA.b $24
|0784E2| STA.b $25
|0784E4| STA.b $29

|0784E6| STZ.w $02C6

|0784E9| LDA.b $46
|0784EB| BEQ .definitely_no_recoil

|0784ED| STZ.w $030D
|0784F0| STZ.w $030E
|0784F3| STZ.w $030A

|0784F6| STZ.b $3B

|0784F8| STZ.w $0308
|0784FB| STZ.w $0309

|0784FE| STZ.w $0376

|078501| LDA.b $3A
|078503| AND.b #$80
|078505| BNE .dont_allow_turn

|078507| LDA.b $50
|078509| AND.b #$FE
|07850B| STA.b $50

.dont_allow_turn
|07850D| BRL HandleRecoilAndTimer

;---------------------------------------------------------------------------------------------------

.definitely_no_recoil
|078510| JSR HandleAPress

|078513| LDA.b $F0
|078515| AND.b #$0F
|078517| BNE .pressing_d_pad

|078519| STA.b $30
|07851B| STA.b $31

|07851D| STA.b $67

|07851F| STA.b $26
|078521| STZ.b $2E

|078523| LDA.b $48
|078525| AND.b #$F6
|078527| STA.b $48

|078529| LDX.b #$20
|07852B| STX.w $0371

|07852E| LDX.b #$13
|078530| STX.w $0375

|078533| BRA .handle_the_animation

;---------------------------------------------------------------------------------------------------

.pressing_d_pad
|078535| STA.b $67

|078537| CMP.b $26
|078539| BEQ .directions_do_match

|07853B| STZ.b $2A
|07853D| STZ.b $2B

|07853F| STZ.b $6B
|078541| STZ.b $48

|078543| LDX.b #$20
|078545| STX.w $0371

|078548| LDX.b #$13
|07854A| STX.w $0375

.directions_do_match
|07854D| STA.b $26

;---------------------------------------------------------------------------------------------------

.handle_the_animation
|07854F| JSL HandleLinkAnimation_FullLongEntry

|078553| STZ.w $0302

|078556| JSR HandleIndoorCameraAndDoors

|078559| RTS

;===================================================================================================

StartEtherTabletCutscene:
|07855A| REP #$20

|07855C| LDA.w #$00C0
|07855F| STA.b $3C

|078561| SEP #$20

|078563| LDA.b #$19 ; LINKSTATE 19
|078565| STA.b $5D

|078567| LDA.b #$01
|078569| STA.w $037B
|07856C| STA.w $0FFC

|07856F| RTL

;===================================================================================================

LinkState_ReceivingEther:
|078570| STZ.b $4D
|078572| STZ.b $46

|078574| STZ.w $0373

|078577| REP #$20

|078579| DEC.b $3C

|07857B| LDA.b $3C
|07857D| BMI .spinning
|07857F| BEQ .spawn_medallion

|078581| CMP.w #$00A0
|078584| BEQ .add_lightning

|078586| CMP.w #$00BF
|078589| BEQ .sword_up

|07858B| SEP #$20

|07858D| RTS

;---------------------------------------------------------------------------------------------------

.spinning
|07858E| SEP #$20

|078590| STZ.b $3C
|078592| STZ.b $3D

|078594| RTS

;---------------------------------------------------------------------------------------------------

.sword_up
|078595| SEP #$20

|078597| LDA.b #$01
|078599| STA.w $03EF

|07859C| RTS

;---------------------------------------------------------------------------------------------------

.spawn_medallion
|07859D| SEP #$20

|07859F| LDX.b #$00

|0785A1| LDY.b #$04
|0785A3| LDA.b #$29 ; ANCILLA 29
|0785A5| JSL AncillaAdd_FallingPrize

|0785A9| LDA.b #$01
|0785AB| STA.w $02E4

|0785AE| STZ.w $0FFC

|0785B1| RTS

;---------------------------------------------------------------------------------------------------

.add_lightning
|0785B2| SEP #$20

|0785B4| LDA.b $20
|0785B6| PHA

|0785B7| LDA.b $21
|0785B9| PHA

|0785BA| LDA.b $22
|0785BC| PHA

|0785BD| LDA.b $23
|0785BF| PHA

|0785C0| LDA.b #$37
|0785C2| STA.b $20

|0785C4| LDA.b #$00
|0785C6| STA.b $21

|0785C8| LDA.b #$B0
|0785CA| STA.b $22

|0785CC| LDA.b #$06
|0785CE| STA.b $23

|0785D0| LDY.b #$00
|0785D2| LDA.b #$18 ; ANCILLA 18
|0785D4| JSL AncillaAdd_EtherSpell

|0785D8| PLA
|0785D9| STA.b $23

|0785DB| PLA
|0785DC| STA.b $22

|0785DE| PLA
|0785DF| STA.b $21

|0785E1| PLA
|0785E2| STA.b $20

|0785E4| RTS

;===================================================================================================

StartBombosTabletCutscene:
|0785E5| REP #$20

|0785E7| LDA.w #$00E0
|0785EA| STA.b $3C

|0785EC| SEP #$20

|0785EE| LDA.b #$1A ; LINKSTATE 1A
|0785F0| STA.b $5D

|0785F2| LDA.b #$01
|0785F4| STA.w $037B
|0785F7| STA.w $0112

|0785FA| RTL

;===================================================================================================

LinkState_ReceivingBombos:
|0785FB| STZ.b $4D
|0785FD| STZ.b $46

|0785FF| STZ.w $0373

|078602| REP #$20

|078604| DEC.b $3C

|078606| LDA.b $3C
|078608| BMI .spinning
|07860A| BEQ .spawn_medallion

|07860C| CMP.w #$00A0
|07860F| BEQ .EXPLOSION

|078611| CMP.w #$00DF
|078614| BEQ .sword_up

|078616| SEP #$20

|078618| RTS

.sword_up
|078619| SEP #$20

|07861B| LDA.b #$01
|07861D| STA.w $03EF

|078620| RTS

;---------------------------------------------------------------------------------------------------

.spinning
|078621| SEP #$20

|078623| STZ.b $3C
|078625| STZ.b $3D

|078627| RTS

;---------------------------------------------------------------------------------------------------

.spawn_medallion
|078628| SEP #$20

|07862A| LDY.b #$04
|07862C| LDX.b #$05
|07862E| LDA.b #$29 ; ANCILLA 29
|078630| JSL AncillaAdd_FallingPrize

|078634| LDA.b #$01
|078636| STA.w $02E4

|078639| RTS

;---------------------------------------------------------------------------------------------------

.EXPLOSION
|07863A| SEP #$20

|07863C| LDA.b $20
|07863E| PHA

|07863F| LDA.b $21
|078641| PHA

|078642| LDA.b $22
|078644| PHA

|078645| LDA.b $23
|078647| PHA

|078648| LDA.b #$B0
|07864A| STA.b $20

|07864C| LDA.b #$0E
|07864E| STA.b $21

|078650| LDA.b #$78
|078652| STA.b $22

|078654| LDA.b #$03
|078656| STA.b $23

|078658| LDY.b #$00
|07865A| LDA.b #$19 ; ANCILLA 19
|07865C| JSL AncillaAdd_BombosSpell

|078660| PLA
|078661| STA.b $23

|078663| PLA
|078664| STA.b $22

|078666| PLA
|078667| STA.b $21

|078669| PLA
|07866A| STA.b $20

|07866C| RTS

;===================================================================================================

InitiateDesertCutscene:
|07866D| REP #$20

|07866F| LDA.w #$0001
|078672| STA.b $3C

|078674| SEP #$20

|078676| LDA.b #$1B ; LINKSTATE 1B
|078678| STA.b $5D

|07867A| RTL

;===================================================================================================

LinkState_ReadingDesertTablet:
|07867B| DEC.b $3C

|07867D| LDA.b $3C
|07867F| BNE .delay

|078681| LDA.b #$00 ; LINKSTATE 00
|078683| STA.b $5D

|078685| JSR PerformDesertPrayer

.delay
|078688| RTS

;===================================================================================================

HandleSomariaAndGraves:
|078689| LDA.b $1B
|07868B| BNE .ignore_graves

|07868D| LDA.w $03E9
|078690| BEQ .ignore_graves

;---------------------------------------------------------------------------------------------------

|078692| LDX.b #$04

.next_slot
|078694| LDA.w $0C4A,X
|078697| CMP.b #$24 ; ANCILLA 24
|078699| BNE .not_grave

|07869B| JSL Gravestone_Move

.not_grave
|07869F| DEX
|0786A0| BPL .next_slot

;---------------------------------------------------------------------------------------------------

.ignore_graves
|0786A2| LDX.b #$04

.next_slot_again
|0786A4| LDA.w $0C4A,X
|0786A7| CMP.b #$2C ; ANCILLA 2C
|0786A9| BNE .not_somaria

|0786AB| JSL SomariaBlock_HandlePlayerInteraction

|0786AF| BRA .done

.not_somaria
|0786B1| DEX
|0786B2| BPL .next_slot_again

.done
|0786B4| RTS

;===================================================================================================

LinkState_Recoil:
|0786B5| LDA.b $20
|0786B7| STA.b $3E

|0786B9| LDA.b $21
|0786BB| STA.b $40

|0786BD| LDA.b $22
|0786BF| STA.b $3F

|0786C1| LDA.b $23
|0786C3| STA.b $41

|0786C5| JSR HandleChangeInZVelocity

|0786C8| STZ.b $50

|0786CA| STZ.w $0351

|0786CD| LDA.b $24
|0786CF| BPL HandleRecoilAndTimer

|0786D1| LDA.b $29
|0786D3| BPL HandleRecoilAndTimer

|0786D5| LDY.b #$05
|0786D7| JSR TileDetect_MainHandler

|0786DA| LDA.w $0341
|0786DD| AND.b #$01
|0786DF| BEQ .no_deep_water_interaction

|0786E1| LDA.b #$04 ; LINKSTATE 04
|0786E3| STA.b $5D

|0786E5| JSR SetToDeepWater

|0786E8| JSR ResetSwordAndItemUsage

|0786EB| LDA.b #$15 ; ANCILLA 15
|0786ED| LDY.b #$00
|0786EF| JSL AncillaAdd_Splash

|0786F3| BRL CheckLayerForChange

;---------------------------------------------------------------------------------------------------

.no_deep_water_interaction
|0786F6| INC.w $02C6

|0786F9| LDA.w $02C6
|0786FC| CMP.b #$04
|0786FE| BEQ .done_bouncing

|078700| TAX

|078701| LDA.w $02C7

.shift
|078704| LSR A

|078705| DEX
|078706| BEQ .shift

|078708| STA.b $29
|07870A| BNE HandleRecoilAndTimer

.done_bouncing
|07870C| LDA.b #$03
|07870E| STA.w $02C6

;===================================================================================================

HandleRecoilAndTimer:
|078711| STZ.b $68
|078713| STZ.b $69
|078715| STZ.b $6A

|078717| JSR HandleLinkRecoiling

|07871A| DEC.b $46

|07871C| LDA.b $46
|07871E| BEQ .delay

.airborne
|078720| BRL HandleLinkRecoilVelocity

;---------------------------------------------------------------------------------------------------

.delay
|078723| INC A
|078724| STA.b $46

|078726| LDA.b $24
|078728| AND.b #$FE
|07872A| BEQ .no_height
|07872C| BPL .airborne

.no_height
|07872E| LDA.b $29
|078730| BPL .airborne

|078732| LDA.b $4D
|078734| BNE .not_special_recoil

|078736| BRL HandleLinkRecoilVelocity_and_reset

;---------------------------------------------------------------------------------------------------

.not_special_recoil
|078739| STZ.w $037B

|07873C| LDA.b $5D
|07873E| STA.b $72

|078740| LDA.b $5D
|078742| CMP.b #$06 ; LINKSTATE 06
|078744| BEQ .jumping

|078746| STZ.b $3C
|078748| STZ.b $3A
|07874A| STZ.b $3D

|07874C| STZ.b $79

.jumping
|07874E| JSR SplashUponLanding

|078751| LDA.w $02E0
|078754| BEQ .not_bunny

|078756| LDA.w $0345
|078759| BEQ .not_bunny

|07875B| BRL CheckLayerForChange.preserve_layer

;---------------------------------------------------------------------------------------------------

.not_bunny
|07875E| LDA.w $02F8
|078761| BEQ .no_guaranteed_thud

|078763| STZ.w $02F8

|078766| BRA .play_thud

;---------------------------------------------------------------------------------------------------

.no_guaranteed_thud
|078768| LDA.b $72
|07876A| CMP.b #$02 ; LINKSTATE 02
|07876C| BEQ .skip_thud_sfx

|07876E| LDA.b $5D
|078770| CMP.b #$04 ; LINKSTATE 04
|078772| BEQ .skip_thud_sfx

.play_thud
|078774| LDA.b #$21 ; SFX2.21
|078776| JSR PlayLinkSFX2Panned

.skip_thud_sfx
|078779| LDY.b $5D
|07877B| CPY.b #$04 ; LINKSTATE 04
|07877D| BNE .not_swimming

|07877F| JSR ForciblyUnequipCape_quietly

|078782| LDA.b $1B
|078784| BEQ .dont_swap_layers

|078786| LDA.b $72
|078788| CMP.b #$02 ; LINKSTATE 02
|07878A| BEQ .dont_swap_layers

|07878C| LDA.l $7EF356
|078790| BEQ .dont_swap_layers

|078792| LDA.b #$01
|078794| STA.b $EE

.dont_swap_layers
|078796| LDA.b #$15 ; ANCILLA 15
|078798| LDY.b #$00
|07879A| JSL AncillaAdd_Splash

;---------------------------------------------------------------------------------------------------

.not_swimming
|07879E| LDY.b #$00
|0787A0| JSR TileDetect_MainHandler

|0787A3| LDA.w $0357
|0787A6| AND.b #$01
|0787A8| BEQ .not_in_thick_grass

|0787AA| LDA.b #$1A ; SFX2.1A
|0787AC| JSR PlayLinkSFX2Panned

.not_in_thick_grass
|0787AF| LDA.w $0359
|0787B2| AND.b #$01
|0787B4| BEQ .skip_sploosh_sfx

|0787B6| LDA.w $012E
|0787B9| CMP.b #$24 ; SFX2.24
|0787BB| BEQ .skip_sploosh_sfx

|0787BD| LDA.b #$1C ; SFX2.1C
|0787BF| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.skip_sploosh_sfx
|0787C2| LDA.w $0341
|0787C5| AND.b #$01
|0787C7| BEQ CheckLayerForChange

|0787C9| LDA.b #$04 ; LINKSTATE 04
|0787CB| STA.b $5D

|0787CD| JSR SetToDeepWater
|0787D0| JSR ResetSwordAndItemUsage

|0787D3| LDA.b #$15 ; ANCILLA 15
|0787D5| LDY.b #$00
|0787D7| JSL AncillaAdd_Splash

;===================================================================================================

CheckLayerForChange:
|0787DB| LDA.b $EE
|0787DD| CMP.b #$02
|0787DF| BNE .dont_reset_layer

|0787E1| STZ.b $EE

.dont_reset_layer
|0787E3| LDA.w $047A
|0787E6| BEQ .preserve_layer

|0787E8| JSL HandleLayerChange

.preserve_layer
|0787EC| STZ.b $24
|0787EE| STZ.b $25

|0787F0| STZ.b $4D

|0787F2| STZ.b $5E
|0787F4| STZ.b $50

|0787F6| STZ.w $0301
|0787F9| STZ.w $037A

|0787FC| STZ.w $0300
|0787FF| STZ.w $037B
|078802| STZ.w $0360

|078805| STZ.b $27
|078807| STZ.b $28

;===================================================================================================

HandleLinkRecoilVelocity_and_reset:
|078809| STZ.b $2E
|07880B| STZ.b $46

;===================================================================================================

HandleLinkRecoilVelocity:
|07880D| LDA.b $5D
|07880F| CMP.b #$05 ; LINKSTATE 05
|078811| BEQ .icy_or_low_timer

|078813| LDA.b $46
|078815| CMP.b #$21
|078817| BCC .icy_or_low_timer

|078819| DEC.w $02C5
|07881C| BPL .delay_flagging

|07881E| LSR A
|07881F| LSR A
|078820| LSR A
|078821| LSR A
|078822| STA.w $02C5

.icy_or_low_timer
|078825| JSR FlagWalkDirections

|078828| LDA.b $5D
|07882A| CMP.b #$06 ; LINKSTATE 06
|07882C| BEQ .find_spot

|07882E| JSR HandleLinkDiagonalCollision

|078831| LDA.b $67
|078833| AND.b #$03
|078835| BNE .going_horizontally

|078837| STZ.b $28

.going_horizontally
|078839| LDA.b $67
|07883B| AND.b #$0C
|07883D| BNE .find_spot

|07883F| STZ.b $27

.find_spot
|078841| JSL FindArbitraryLandingSpot

;---------------------------------------------------------------------------------------------------

.delay_flagging
|078845| LDA.b $5D
|078847| CMP.b #$06 ; LINKSTATE 06
|078849| BEQ .jumping_out_of_water

|07884B| JSR HandleLinkCardinalCollision

|07884E| STZ.w $0302

.jumping_out_of_water
|078851| JSR HandleIndoorCameraAndDoors

|078854| LDA.b $24
|078856| BEQ .not_airborne

|078858| CMP.b #$E0
|07885A| BCC .skip_pit_detect

.not_airborne
|07885C| JSR TileDetect_BigArea

|07885F| LDA.b $59
|078861| AND.b #$0F
|078863| CMP.b #$0F
|078865| BNE .skip_pit_detect

|078867| LDA.b #$01 ; LINKSTATE 01
|078869| STA.b $5D

|07886B| LDA.b #$04
|07886D| STA.b $5E

.skip_pit_detect
|07886F| STZ.b $25

|078871| RTS

;===================================================================================================

LinkState_OnIce:
|078872| LDA.b $1B
|078874| BNE .indoors

|078876| BRL .overworld

;---------------------------------------------------------------------------------------------------

.indoors
|078879| LDX.b #$00

|07887B| LDA.b $EE
|07887D| BEQ .upper_layer_or_staircase

|07887F| STZ.b $EE

|078881| JSR TileDetect_UnusedIce

|078884| LDX.b #$00

|078886| LDA.b #$01
|078888| STA.b $EE

|07888A| LDA.w $034C
|07888D| AND.b #$03
|07888F| CMP.b #$03
|078891| BEQ .upper_layer_or_staircase

|078893| LDX.b #$01

.upper_layer_or_staircase
|078895| STX.w $034E

;---------------------------------------------------------------------------------------------------

.continue_from_ow_stuff
|078898| DEC.b $3D
|07889A| BPL .delay

|07889C| LDA.b #$03
|07889E| STA.b $3D

|0788A0| LDA.w $0300
|0788A3| EOR.b #$01
|0788A5| STA.w $0300

.delay
|0788A8| LDA.b $F0
|0788AA| AND.b #$0F
|0788AC| BNE .no_dpad

|0788AE| STA.b $30
|0788B0| STA.b $31

|0788B2| STA.b $67
|0788B4| STA.b $26

|0788B6| STZ.b $2E

|0788B8| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.no_dpad
|0788BA| STA.b $67

|0788BC| CMP.b $26
|0788BE| BEQ .matches

|0788C0| STZ.b $2A
|0788C2| STZ.b $2B
|0788C4| STZ.b $6B

.matches
|0788C6| STA.b $26

;---------------------------------------------------------------------------------------------------

.continue_b
|0788C8| LDX.b #$10

|0788CA| LDA.b $67
|0788CC| AND.b #$0F
|0788CE| BEQ .just_animate

|0788D0| AND.b #$0C
|0788D2| BEQ .moving_for_sure

|0788D4| LDA.b $67
|0788D6| AND.b #$03
|0788D8| BEQ .moving_for_sure

|0788DA| LDX.b #$0A

.moving_for_sure
|0788DC| STX.b $00

|0788DE| LDA.b $67
|0788E0| AND.b #$0C
|0788E2| BEQ .no_vertical_movement

|0788E4| AND.b #$08
|0788E6| BEQ .moving_on_down

|0788E8| TXA
|0788E9| EOR.b #$FF
|0788EB| INC A
|0788EC| TAX

.moving_on_down
|0788ED| STX.b $27

;---------------------------------------------------------------------------------------------------

.no_vertical_movement
|0788EF| LDX.b $00

|0788F1| LDA.b $67
|0788F3| AND.b #$03
|0788F5| BEQ .just_animate

|0788F7| AND.b #$02
|0788F9| BEQ .moving_on_right

|0788FB| TXA
|0788FC| EOR.b #$FF
|0788FE| INC A
|0788FF| TAX

.moving_on_right
|078900| STX.b $28

;---------------------------------------------------------------------------------------------------

.just_animate
|078902| JSL HandleLinkAnimation_FullLongEntry

|078906| BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.overworld
|078909| LDY.b #$00
|07890B| JSR TileDetect_MainHandler

|07890E| LDA.w $035B
|078911| AND.b #$01
|078913| BEQ .reset_layer

|078915| LDA.b #$02
|078917| STA.b $EE

|078919| BRA .layer_is_set

;---------------------------------------------------------------------------------------------------

.reset_layer
|07891B| STZ.w $00EE

.layer_is_set
|07891E| LDA.b #$01
|078920| STA.w $034E

|078923| BRL .continue_from_ow_stuff

;===================================================================================================

HandleChangeInZVelocity:
|078926| LDX.b #$02

|078928| LDA.b $5D
|07892A| CMP.b #$05 ; LINKSTATE 05
|07892C| BNE .not_weird_ice

|07892E| LDX.b #$01

.not_weird_ice
|078930| STX.b $00

.preset
|078932| LDA.b $29
|078934| BPL ApplyZSpeedChange

|078936| LDA.b $24
|078938| BEQ .exit
|07893A| BPL ApplyZSpeedChange

|07893C| LDA.b #$FF
|07893E| STA.b $24
|078940| STA.b $25
|078942| STA.b $29

|078944| BRA .exit

;===================================================================================================

#ApplyZSpeedChange:
|078946| LDA.b $29
|078948| SEC
|078949| SBC.b $00
|07894B| STA.b $29

.exit
|07894D| RTS

;===================================================================================================

LinkState_HoppingSouthOW:
|07894E| LDA.b #$01
|078950| STA.b $66

|078952| STZ.b $50

|078954| STZ.b $27
|078956| STZ.b $28

|078958| STZ.w $0351

|07895B| LDA.b $46
|07895D| BNE .continue

|07895F| LDA.w $0362
|078962| BNE .continue

|078964| LDA.b #$20 ; SFX2.20
|078966| JSR PlayLinkSFX2Panned

|078969| JSR FindTileToLandOnSouth

|07896C| LDA.b $1B
|07896E| BNE .continue

|078970| LDA.b #$02
|078972| STA.b $EE

;---------------------------------------------------------------------------------------------------

.continue
|078974| LDA.w $0362
|078977| STA.b $29

|078979| LDA.w $0363
|07897C| STA.w $02C7

|07897F| LDA.w $0364
|078982| STA.b $24

|078984| LDA.w $0365
|078987| STA.b $25

|078989| LDA.b #$02
|07898B| STA.b $00

|07898D| JSR ApplyZSpeedChange
|078990| JSL FindArbitraryLandingSpot

|078994| LDA.b $29
|078996| BPL .adjust_velocity

|078998| CMP.b #$A0
|07899A| BCS .not_maxed_out

|07899C| LDA.b #$A0
|07899E| STA.b $29

.not_maxed_out
|0789A0| REP #$20

|0789A2| LDA.b $24
|0789A4| CMP.w #$FFF0
|0789A7| BCC .adjust_velocity

|0789A9| STZ.b $24

|0789AB| SEP #$20

|0789AD| JSR SplashUponLanding

;---------------------------------------------------------------------------------------------------

|0789B0| LDA.b $5B
|0789B2| BEQ .not_near_pit

|0789B4| LDA.b #$01 ; LINKSTATE 01
|0789B6| STA.b $5D

.not_near_pit
|0789B8| LDA.b $5D
|0789BA| CMP.b #$04 ; LINKSTATE 04
|0789BC| BEQ .skip_sfx

|0789BE| CMP.b #$01 ; LINKSTATE 01
|0789C0| BEQ .skip_sfx

|0789C2| LDA.w $0345
|0789C5| BNE .skip_sfx

|0789C7| LDA.b #$21 ; SFX2.21
|0789C9| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.skip_sfx
|0789CC| STZ.w $037B

|0789CF| STZ.b $78
|0789D1| STZ.b $4D

|0789D3| LDA.b #$FF
|0789D5| STA.b $29
|0789D7| STA.b $24
|0789D9| STA.b $25

|0789DB| STZ.b $46

|0789DD| LDA.b $1B
|0789DF| BNE .no_layer_reset

|0789E1| STZ.b $EE

.no_layer_reset
|0789E3| BRA .finisher_up

;===================================================================================================

.adjust_velocity
|0789E5| SEP #$20

|0789E7| LDA.w $0364
|0789EA| SEC
|0789EB| SBC.b $24
|0789ED| STA.b $30

;---------------------------------------------------------------------------------------------------

.finisher_up
|0789EF| LDA.b $29
|0789F1| STA.w $0362

|0789F4| LDA.w $02C7
|0789F7| STA.w $0363

|0789FA| LDA.b $24
|0789FC| STA.w $0364

|0789FF| LDA.b $25
|078A01| STA.w $0365

|078A04| RTS

;===================================================================================================

LinkState_HandlingJump:
|078A05| LDA.w $0362
|078A08| STA.b $29

|078A0A| LDA.w $0363
|078A0D| STA.w $02C7

|078A10| LDA.w $0364
|078A13| STA.b $24

|078A15| LDA.b #$02
|078A17| STA.b $00

|078A19| JSR ApplyZSpeedChange
|078A1C| JSL FindArbitraryLandingSpot

|078A20| LDA.b $29
|078A22| BMI .negative_speed

|078A24| BRL .not_at_max_z

;---------------------------------------------------------------------------------------------------

.negative_speed
|078A27| CMP.b #$A0
|078A29| BCS .not_at_max_z_speed

|078A2B| LDA.b #$A0
|078A2D| STA.b $29

.not_at_max_z_speed
|078A2F| LDA.b $24
|078A31| CMP.b #$F0
|078A33| BCC .not_at_max_z

|078A35| STZ.b $24
|078A37| STZ.b $25

|078A39| LDA.b $5D
|078A3B| CMP.b #$0C ; LINKSTATE 0C
|078A3D| BEQ .left_or_right

|078A3F| CMP.b #$0E ; LINKSTATE 0E
|078A41| BNE .continue_a

;---------------------------------------------------------------------------------------------------

.left_or_right
|078A43| LDY.b #$00
|078A45| JSR TileDetect_MainHandler

|078A48| LDA.w $0341
|078A4B| AND.b #$01
|078A4D| BEQ .dont_become_swimming

|078A4F| LDA.b #$04 ; LINKSTATE 04
|078A51| STA.b $5D

|078A53| JSR SetToDeepWater
|078A56| JSR ResetSwordAndItemUsage

|078A59| LDA.b #$15 ; ANCILLA 15
|078A5B| LDY.b #$00
|078A5D| JSL AncillaAdd_Splash

|078A61| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.dont_become_swimming
|078A63| LDA.b $59
|078A65| AND.b #$01
|078A67| BEQ .continue_a

|078A69| LDA.b #$09
|078A6B| STA.b $5C

|078A6D| STZ.b $5A

|078A6F| LDA.b #$01
|078A71| STA.b $5B

|078A73| LDA.b #$01 ; LINKSTATE 01
|078A75| STA.b $5D

|078A77| BRA .check_if_swimming

;---------------------------------------------------------------------------------------------------

.continue_a
|078A79| JSR SplashUponLanding

|078A7C| LDA.b $5D
|078A7E| CMP.b #$04 ; LINKSTATE 04
|078A80| BEQ .check_if_swimming

|078A82| LDA.w $0345
|078A85| BNE .check_if_swimming

|078A87| LDA.b #$21 ; SFX2.21
|078A89| JSR PlayLinkSFX2Panned

.check_if_swimming
|078A8C| LDA.b $5D
|078A8E| CMP.b #$04 ; LINKSTATE 04
|078A90| BNE .not_swimming

|078A92| LDA.w $02E0
|078A95| BNE .am_bunny

.not_swimming
|078A97| STZ.w $037B

;---------------------------------------------------------------------------------------------------

.am_bunny
|078A9A| STZ.b $78
|078A9C| STZ.b $4D

|078A9E| LDA.b #$FF
|078AA0| STA.b $29

|078AA2| STA.b $24
|078AA4| STA.b $25

|078AA6| STZ.b $46

|078AA8| LDA.b $1B
|078AAA| BNE .dont_reset_layer

|078AAC| STZ.b $EE

.dont_reset_layer
|078AAE| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_at_max_z
|078AB0| LDA.w $0364
|078AB3| SEC
|078AB4| SBC.b $24
|078AB6| STA.b $30

.continue_b
|078AB8| LDA.b $29
|078ABA| STA.w $0362

|078ABD| LDA.w $02C7
|078AC0| STA.w $0363

|078AC3| LDA.b $24
|078AC5| STA.w $0364

|078AC8| RTS

;===================================================================================================

pool FindTileToLandOnSouth FindVerticalHopTile

.offset_x
|078AC9| dw  -8
|078ACB| dw   8

.offset_y
|078ACD| dw -16
|078ACF| dw  16

endpool

;---------------------------------------------------------------------------------------------------

FindTileToLandOnSouth:
|078AD1| LDA.b $21
|078AD3| STA.b $33

|078AD5| LDA.b $20
|078AD7| STA.b $32

|078AD9| SEC
|078ADA| SBC.b $3E
|078ADC| STA.b $30

.next_y
|078ADE| LDA.b $66
|078AE0| ASL A
|078AE1| TAY

|078AE2| REP #$20

|078AE4| LDA.w .offset_x,Y
|078AE7| CLC
|078AE8| ADC.b $20
|078AEA| STA.b $20

|078AEC| SEP #$20

|078AEE| JSR TileDetectOnMovement_Vertical

|078AF1| LDA.w $0343
|078AF4| ORA.b $59
|078AF6| ORA.w $035B
|078AF9| ORA.w $0357
|078AFC| ORA.w $0341
|078AFF| AND.b #$07
|078B01| CMP.b #$07
|078B03| BNE .next_y

;---------------------------------------------------------------------------------------------------

|078B05| LDA.w $0341
|078B08| AND.b #$07
|078B0A| BEQ .didnt_find_water

|078B0C| LDA.b #$01
|078B0E| STA.w $0345

|078B11| LDA.b $4D
|078B13| CMP.b #$04
|078B15| BEQ .leave_recoil_state

|078B17| LDA.b #$02
|078B19| STA.b $4D

.leave_recoil_state
|078B1B| LDA.w $0026
|078B1E| STA.w $0340

|078B21| JSL ResetSwimmingState

|078B25| STZ.w $0376
|078B28| STZ.b $5E

.didnt_find_water
|078B2A| LDA.b $59
|078B2C| AND.b #$07
|078B2E| BEQ .didnt_find_pit

|078B30| LDA.b #$09
|078B32| STA.b $5C

|078B34| STZ.b $5A

|078B36| LDA.b #$01
|078B38| STA.b $5B

.didnt_find_pit
|078B3A| LDA.b $66
|078B3C| ASL A
|078B3D| TAY

|078B3E| REP #$20

|078B40| LDA.w .offset_y,Y
|078B43| CLC
|078B44| ADC.b $20
|078B46| STA.b $20

|078B48| SEP #$20

|078B4A| LDA.b $20
|078B4C| STA.b $3E

|078B4E| LDA.b $21
|078B50| STA.b $40

|078B52| LDA.b #$01
|078B54| STA.b $46

|078B56| LDA.b $24
|078B58| CMP.b #$F0
|078B5A| BCC .z_coord_fine

|078B5C| LDA.b #$00

.z_coord_fine
|078B5E| STA.b $00
|078B60| STZ.b $01

|078B62| REP #$20

|078B64| LDA.b $20
|078B66| SEC
|078B67| SBC.b $32
|078B69| CLC
|078B6A| ADC.b $00
|078B6C| STA.w $0364
|078B6F| STA.b $24

|078B71| SEP #$20

|078B73| RTS

;===================================================================================================

LinkState_HoppingHorizontallyOW:
|078B74| LDX.b #$01

|078B76| LDA.b $28
|078B78| BPL .moving_right

|078B7A| LDX.b #$02

.moving_right
|078B7C| TXA
|078B7D| ORA.b #$04
|078B7F| STA.b $67

|078B81| STZ.b $50
|078B83| STZ.b $27

|078B85| STZ.w $0351

|078B88| BRL LinkState_HandlingJump

;===================================================================================================

pool FindVerticalHopTile

.speed_z
|078B8B| db $20, $20, $20, $28
|078B8F| db $30, $38, $40, $48

.speed_x
|078B93| db $10, $1C, $1C, $1C
|078B97| db $1C, $1C, $1C, $1C

endpool

;---------------------------------------------------------------------------------------------------

FindVerticalHopTile:
|078B9B| LDA.b $21
|078B9D| STA.b $33

|078B9F| LDA.b $20
|078BA1| STA.b $32

|078BA3| SEC
|078BA4| SBC.b $3E
|078BA6| STA.b $30

|078BA8| LDA.b $66
|078BAA| ASL A
|078BAB| TAY

|078BAC| REP #$20

|078BAE| LDA.w .offset_x,Y
|078BB1| CLC
|078BB2| ADC.b $20
|078BB4| STA.b $20

|078BB6| SEP #$20

|078BB8| JSR TileDetectOnMovement_Vertical

|078BBB| LDA.w $0343
|078BBE| ORA.w $035B
|078BC1| ORA.w $0357
|078BC4| ORA.w $0341
|078BC7| AND.b #$07
|078BC9| CMP.b #$07
|078BCB| BEQ .no_tiles_flagged

|078BCD| LDA.b $33
|078BCF| STA.b $21

|078BD1| LDA.b $32
|078BD3| STA.b $20

|078BD5| LDY.b #$00

|078BD7| LDA.b #$01
|078BD9| STA.b $46

|078BDB| LDA.b $28
|078BDD| BPL .x_speed_positive

|078BDF| LDY.b #$FF

|078BE1| EOR.b #$FF
|078BE3| INC A

.x_speed_positive
|078BE4| LSR A
|078BE5| LSR A
|078BE6| LSR A
|078BE7| LSR A
|078BE8| TAX

|078BE9| LDA.w .speed_z,X
|078BEC| STA.w $0362
|078BEF| STA.w $0363

|078BF2| LDA.w .speed_x,X
|078BF5| CPY.b #$FF
|078BF7| BNE .dont_invert_x_speed

|078BF9| EOR.b #$FF
|078BFB| INC A

.dont_invert_x_speed
|078BFC| STA.b $28

|078BFE| BRA .check_for_water

.no_tiles_flagged
|078C00| LDA.b $66
|078C02| ASL A
|078C03| TAY

|078C04| REP #$20

|078C06| LDA.w .offset_y,Y
|078C09| CLC
|078C0A| ADC.b $20
|078C0C| STA.b $20

|078C0E| SEP #$20

|078C10| LDA.b $20
|078C12| STA.b $3E

|078C14| LDA.b $21
|078C16| STA.b $40

|078C18| LDA.b #$01
|078C1A| STA.b $46

|078C1C| LDA.b $24
|078C1E| CMP.b #$FF
|078C20| BNE .dont_zero_z_coord

|078C22| LDA.b #$00

.dont_zero_z_coord
|078C24| STA.b $00
|078C26| STZ.b $01

|078C28| REP #$20

|078C2A| LDA.b $20
|078C2C| SEC
|078C2D| SBC.b $32
|078C2F| CLC
|078C30| ADC.b $00
|078C32| STA.w $0364
|078C35| STA.b $24

|078C37| SEP #$20

.check_for_water
|078C39| LDA.w $0341
|078C3C| AND.b #$07
|078C3E| BEQ .exit

|078C40| LDA.b #$02
|078C42| STA.b $4D

;===================================================================================================

#SetToDeepWater:
|078C44| LDA.b #$01
|078C46| STA.w $0345

|078C49| LDA.w $0026
|078C4C| STA.w $0340

|078C4F| JSL ResetSwimmingState

|078C53| STZ.w $0376
|078C56| STZ.b $5E

.exit
|078C58| RTS

;===================================================================================================

pool LinkState_0F

.offset_x
|078C59| dw $FFE8
|078C5B| dw $0018
|078C5D| dw $FFE8
|078C5F| dw $0018

.offset_y
|078C61| dw $0020
|078C63| dw $0050

.speed_x
|078C65| db $10
|078C66| db $18

.offset_z
|078C67| db $20
|078C68| db $50

endpool

;---------------------------------------------------------------------------------------------------

LinkState_0F:
|078C69| LDY.b #$03

|078C6B| LDA.b $28
|078C6D| BPL .x_speed_positive

|078C6F| LDY.b #$02

.x_speed_positive
|078C71| STY.b $66

|078C73| STZ.b $50
|078C75| STZ.b $27

|078C77| STZ.w $0351

|078C7A| LDA.b $46
|078C7C| BNE .proceed_to_jump

|078C7E| LDA.w $0362
|078C81| BNE .proceed_to_jump

|078C83| LDA.b $5D
|078C85| SEC
|078C86| SBC.b #$0F
|078C88| ASL A
|078C89| ASL A
|078C8A| STA.b $00

|078C8C| TYA
|078C8D| AND.b #$FD
|078C8F| ASL A
|078C90| CLC
|078C91| ADC.b $00
|078C93| TAX

|078C94| LDA.b $22
|078C96| PHA

|078C97| LDA.b $23
|078C99| PHA

|078C9A| REP #$20

|078C9C| LDA.b $22
|078C9E| CLC
|078C9F| ADC.w .offset_x,X
|078CA2| STA.b $22

|078CA4| SEP #$20

|078CA6| TXA
|078CA7| LSR A
|078CA8| LSR A
|078CA9| TAX

|078CAA| LDA.w .speed_x,X

|078CAD| CPY.b #$02
|078CAF| BNE .keep_speed_positive

|078CB1| EOR.b #$FF
|078CB3| INC A

.keep_speed_positive
|078CB4| STA.b $28

|078CB6| LDA.b $24
|078CB8| CMP.b #$FF
|078CBA| BNE .dont_zero_z

|078CBC| LDA.b #$00

.dont_zero_z
|078CBE| CLC
|078CBF| ADC.w .offset_z,X
|078CC2| STA.w $0364
|078CC5| STA.b $24

|078CC7| TXA
|078CC8| ASL A
|078CC9| TAX

|078CCA| REP #$20

|078CCC| LDA.w .offset_y,X
|078CCF| CLC
|078CD0| ADC.b $20
|078CD2| STA.b $20

;---------------------------------------------------------------------------------------------------

|078CD4| SEP #$20

|078CD6| LDA.b $20
|078CD8| STA.b $3E

|078CDA| LDA.b $21
|078CDC| STA.b $40

|078CDE| PLA
|078CDF| STA.b $23

|078CE1| PLA
|078CE2| STA.b $22

|078CE4| LDA.b $1B
|078CE6| BNE .proceed_to_jump

|078CE8| LDA.b #$02
|078CEA| STA.b $EE

.proceed_to_jump
|078CEC| BRL LinkState_HandlingJump

;===================================================================================================

pool FindHorizontalHopTile

.offset_x_a
|078CEF| dw  -8
|078CF1| dw   8

.offset_x_b
|078CF3| dw -32
|078CF5| dw  32

.offset_x_c
|078CF7| dw -16
|078CF9| dw  16

.speed_x
|078CFB| db $14, $14, $14, $18, $18, $18, $18, $1C
|078D03| db $1C, $24, $24, $24, $24, $24, $24, $26
|078D0B| db $26, $26, $26, $26, $26, $26, $28, $28

.speed_z
|078D13| db $14, $14, $14, $14, $14, $14, $14, $18
|078D1B| db $18, $20, $20, $20, $24, $24, $24, $26
|078D23| db $26, $26, $26, $26, $26, $26, $28, $28

endpool

;---------------------------------------------------------------------------------------------------

FindHorizontalHopTile:
|078D2B| LDA.b $23
|078D2D| STA.b $33

|078D2F| LDA.b $22
|078D31| STA.b $32

|078D33| LDX.b #$07

.find_next
|078D35| PHX
|078D36| PHY

|078D37| REP #$20

|078D39| LDA.w .offset_x_a,Y
|078D3C| CLC
|078D3D| ADC.b $22
|078D3F| STA.b $22

|078D41| SEP #$20

|078D43| LDA.b $66
|078D45| ASL A
|078D46| TAY

|078D47| JSR TileDetectOnMovement_Horizontal

|078D4A| PLY
|078D4B| PLX

|078D4C| LDA.w $0343
|078D4F| ORA.w $035B
|078D52| ORA.w $0357
|078D55| ORA.w $0341
|078D58| ORA.b $59
|078D5A| AND.b #$07
|078D5C| CMP.b #$07
|078D5E| BNE .doesnt_work

|078D60| LDA.w $0341
|078D63| AND.b #$07
|078D65| CMP.b #$07
|078D67| BNE .water_handled

|078D69| LDA.b #$01
|078D6B| STA.w $0345

|078D6E| INC A
|078D6F| STA.b $4D

|078D71| LDA.w $0026
|078D74| STA.w $0340

|078D77| STZ.w $02CB
|078D7A| STZ.b $5E
|078D7C| STZ.w $0376

|078D7F| JSR ResetAllAcceleration
|078D82| BRA .water_handled

.doesnt_work
|078D84| DEX
|078D85| BPL .find_next

;---------------------------------------------------------------------------------------------------

|078D87| REP #$20

|078D89| LDA.w .offset_x_b,Y
|078D8C| CLC
|078D8D| ADC.b $32
|078D8F| STA.b $22

|078D91| SEP #$20

.water_handled
|078D93| PHX

|078D94| REP #$20

|078D96| LDA.w .offset_x_c,Y
|078D99| CLC
|078D9A| ADC.b $22
|078D9C| STA.b $22

|078D9E| LDA.b $32
|078DA0| SEC
|078DA1| SBC.b $22
|078DA3| BPL .positive

|078DA5| EOR.w #$FFFF
|078DA8| INC A

.positive
|078DA9| LSR A
|078DAA| LSR A
|078DAB| LSR A
|078DAC| TAX

|078DAD| SEP #$20

|078DAF| LDA.w .speed_x,X

|078DB2| CPY.b #$02
|078DB4| BEQ .dont_invert

|078DB6| EOR.b #$FF
|078DB8| INC A

.dont_invert
|078DB9| STA.b $28

|078DBB| LDA.w .speed_z,X
|078DBE| STA.w $0362
|078DC1| STA.w $0363

|078DC4| PLX

|078DC5| RTS

;===================================================================================================

LinkState_HoppingDiagonallyUpOW:
|078DC6| STZ.w $0351

|078DC9| LDA.b #$02
|078DCB| STA.b $00

|078DCD| JSR HandleChangeInZVelocity.preset
|078DD0| JSL FindArbitraryLandingSpot

|078DD4| LDA.b $24
|078DD6| BPL .exit

;---------------------------------------------------------------------------------------------------

|078DD8| JSR SplashUponLanding

|078DDB| LDA.b $5D
|078DDD| CMP.b #$04 ; LINKSTATE 04
|078DDF| BEQ .no_sfx

|078DE1| LDA.w $0345
|078DE4| BNE .no_sfx

|078DE6| LDA.b #$21 ; SFX2.21
|078DE8| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.no_sfx
|078DEB| STZ.w $037B
|078DEE| STZ.b $4D

|078DF0| LDA.b #$FF
|078DF2| STA.b $29
|078DF4| STA.b $24
|078DF6| STA.b $25

|078DF8| STZ.b $46
|078DFA| STZ.b $50

.exit
|078DFC| RTS

;===================================================================================================

pool LinkState_HoppingDiagonallyDownOW

.speed_x
|078DFD| db $04, $04, $04, $0A, $0A, $0A, $0B, $12
|078E05| db $12, $12, $14, $14, $14, $14, $16, $16
|078E0D| db $1A, $1A, $1A, $1A, $1C, $1C, $1C, $1C

endpool

;---------------------------------------------------------------------------------------------------

LinkState_HoppingDiagonallyDownOW:
|078E15| LDY.b #$03

|078E17| LDA.b $28
|078E19| BPL .down_right

|078E1B| LDY.b #$02

.down_right
|078E1D| STY.b $66

|078E1F| STZ.b $50
|078E21| STZ.b $27

|078E23| STZ.w $0351

|078E26| LDA.b $46
|078E28| BNE .underworld

|078E2A| LDA.w $0362
|078E2D| BNE .underworld

|078E2F| LDA.b #$01
|078E31| STA.b $66

|078E33| PHY

|078E34| LDA.b $22
|078E36| PHA

|078E37| LDA.b $23
|078E39| PHA

|078E3A| LDA.b #$20 ; SFX2.20
|078E3C| JSR PlayLinkSFX2Panned

|078E3F| JSR FindLandingSpotDiagonallyDown

|078E42| PLA
|078E43| STA.b $23

|078E45| PLA
|078E46| STA.b $22

|078E48| PLX

|078E49| REP #$20

|078E4B| LDA.b $20
|078E4D| SEC
|078E4E| SBC.b $32

|078E50| LSR A
|078E51| LSR A
|078E52| LSR A

|078E53| TAY

|078E54| SEP #$20

|078E56| LDA.w .speed_x,Y

|078E59| CPX.b #$02
|078E5B| BNE .dont_invert

|078E5D| EOR.b #$FF
|078E5F| INC A

.dont_invert
|078E60| STA.b $28

|078E62| LDA.b $1B
|078E64| BNE .underworld

|078E66| LDA.b #$02
|078E68| STA.b $EE

.underworld
|078E6A| BRL LinkState_HandlingJump

;===================================================================================================

pool FindLandingSpotDiagonallyDown

.offset_x
|078E6D| dw $FFF8
|078E6F| dw $0008

.offset_y
|078E71| dw $FFF7
|078E73| dw $0009

.offset_y_2
|078E75| dw $FFE8
|078E77| dw $0018

.detection_masks
|078E79| db $06
|078E7A| db $03

endpool

;---------------------------------------------------------------------------------------------------

FindLandingSpotDiagonallyDown:
|078E7B| LDA.b $21
|078E7D| STA.b $33

|078E7F| LDA.b $20
|078E81| STA.b $32

|078E83| SEC
|078E84| SBC.b $3E
|078E86| STA.b $30

.check_next
|078E88| LDY.b #$00

|078E8A| LDA.b $28
|078E8C| BMI .positive_x_jump

|078E8E| LDY.b #$02

.positive_x_jump
|078E90| PHY

|078E91| REP #$20

|078E93| LDA.w .offset_x,Y
|078E96| CLC
|078E97| ADC.b $22
|078E99| STA.b $22

|078E9B| LDA.b $66
|078E9D| AND.w #$00FF
|078EA0| ASL A
|078EA1| TAY

|078EA2| LDA.w .offset_y,Y
|078EA5| CLC
|078EA6| ADC.b $20
|078EA8| STA.b $20

|078EAA| SEP #$20

|078EAC| JSR TileDetectOnMovement_Vertical

|078EAF| PLY

|078EB0| TYA
|078EB1| LSR A
|078EB2| TAY

|078EB3| LDA.w .detection_masks,Y
|078EB6| STA.b $72

|078EB8| LDA.w $0343
|078EBB| ORA.w $035B
|078EBE| ORA.w $0357
|078EC1| ORA.w $0341
|078EC4| AND.b $72
|078EC6| CMP.b $72
|078EC8| BNE .check_next

;---------------------------------------------------------------------------------------------------

|078ECA| LDA.w $0341
|078ECD| AND.b $72
|078ECF| BEQ .didnt_find_water

|078ED1| LDA.b #$01
|078ED3| STA.w $0345

|078ED6| LDA.b #$02
|078ED8| STA.b $4D

|078EDA| LDA.w $0026
|078EDD| STA.w $0340

|078EE0| JSL ResetSwimmingState

|078EE4| STZ.b $5E
|078EE6| STZ.w $0376

.didnt_find_water
|078EE9| LDA.b $66
|078EEB| ASL A
|078EEC| TAY

|078EED| REP #$20

|078EEF| LDA.w .offset_y_2,Y
|078EF2| CLC
|078EF3| ADC.b $20
|078EF5| STA.b $20

|078EF7| SEP #$20

|078EF9| LDA.b $20
|078EFB| STA.b $3E

|078EFD| LDA.b $21
|078EFF| STA.b $40

|078F01| LDA.b #$01
|078F03| STA.b $46

|078F05| LDA.b $24
|078F07| STA.b $00
|078F09| STZ.b $01

|078F0B| REP #$20

|078F0D| LDA.b $20
|078F0F| SEC
|078F10| SBC.b $32

|078F12| CLC
|078F13| ADC.b $00
|078F15| STA.w $0364
|078F18| STA.b $24

|078F1A| SEP #$20

|078F1C| RTS

;===================================================================================================

SplashUponLanding:
|078F1D| PHX
|078F1E| PHY

|078F1F| LDA.w $02E0
|078F22| BEQ .not_bunny

|078F24| LDA.w $0345
|078F27| BEQ .not_deep_water

|078F29| LDA.b #$15 ; ANCILLA 15
|078F2B| LDY.b #$00
|078F2D| JSL AncillaAdd_Splash

|078F31| PLY
|078F32| PLX

|078F33| BRL LinkState_Bunny.recache

.not_deep_water
|078F36| LDX.b #$17 ; LINKSTATE 17

|078F38| LDA.l $7EF357
|078F3C| BEQ .set_state

|078F3E| LDX.b #$1C ; LINKSTATE 1C
|078F40| BRA .set_state

;---------------------------------------------------------------------------------------------------

.not_bunny
|078F42| LDX.b #$00 ; LINKSTATE 00

|078F44| LDA.w $0345
|078F47| BEQ .set_state

|078F49| LDA.b $5D
|078F4B| CMP.b #$06 ; LINKSTATE 06
|078F4D| BEQ .not_recoiling

|078F4F| LDA.b #$15 ; ANCILLA 15
|078F51| LDY.b #$00
|078F53| JSL AncillaAdd_Splash

;---------------------------------------------------------------------------------------------------

.not_recoiling
|078F57| JSR ForciblyUnequipCape_quietly

|078F5A| LDX.b #$04 ; LINKSTATE 04

.set_state
|078F5C| STX.b $5D

|078F5E| PLY
|078F5F| PLX

|078F60| RTS

;===================================================================================================

WalkDirectionFlags:
|078F61| db $08
|078F62| db $04
|078F63| db $02
|078F64| db $01

;---------------------------------------------------------------------------------------------------

LinkDashSFXMasks:
|078F65| db $07, $0F, $0F

;---------------------------------------------------------------------------------------------------

FollowerReactionToDashing:
|078F68| db $FF ; 0x00 - No follower
|078F69| db $00 ; 0x01 - Zelda
|078F6A| db $02 ; 0x02 - Old man that stops following you
|078F6B| db $00 ; 0x03 - Unused old man
|078F6C| db $00 ; 0x04 - Normal old man
|078F6D| db $00 ; 0x05 - Zelda rescue telepathy
|078F6E| db $00 ; 0x06 - Blind maiden
|078F6F| db $00 ; 0x07 - Frogsmith
|078F70| db $00 ; 0x08 - Smithy
|078F71| db $00 ; 0x09 - Locksmith
|078F72| db $00 ; 0x0A - Kiki
|078F73| db $00 ; 0x0B - Unused old man
|078F74| db $00 ; 0x0C - Purple chest
|078F75| db $00 ; 0x0D - Super bomb
|078F76| db $00 ; 0x0E - Master Sword telepathy

;---------------------------------------------------------------------------------------------------

FollowerDashReplacement:
|078F77| db $FF ; 0x00 - No follower
|078F78| db $00 ; 0x01 - Zelda
|078F79| db $03 ; 0x02 - Old man that stops following you ⇒ FOLLOWER 03
|078F7A| db $00 ; 0x03 - Unused old man
|078F7B| db $00 ; 0x04 - Normal old man
|078F7C| db $00 ; 0x05 - Zelda rescue telepathy
|078F7D| db $00 ; 0x06 - Blind maiden
|078F7E| db $00 ; 0x07 - Frogsmith
|078F7F| db $00 ; 0x08 - Smithy
|078F80| db $00 ; 0x09 - Locksmith
|078F81| db $00 ; 0x0A - Kiki
|078F82| db $00 ; 0x0B - Unused old man
|078F83| db $00 ; 0x0C - Purple chest
|078F84| db $00 ; 0x0D - Super bomb
|078F85| db $00 ; 0x0E - Master Sword telepathy

;===================================================================================================

LinkState_Dashing:
|078F86| JSR CacheCameraPropertiesIfOutdoors

|078F89| JSR HandleBunnyTransformation
|078F8C| BCC .not_bunnifying

|078F8E| LDA.b $5D
|078F90| CMP.b #$17 ; LINKSTATE 17
|078F92| BNE .not_bunny

|078F94| BRL LinkState_Bunny

.not_bunny
|078F97| RTS

;---------------------------------------------------------------------------------------------------

.not_bunnifying
|078F98| LDA.w $0372
|078F9B| BNE .still_dashing

|078F9D| STZ.w $037B
|078FA0| STZ.w $0374
|078FA3| STZ.b $5E

|078FA5| LDA.b #$00 ; LINKSTATE 00
|078FA7| STA.b $5D

|078FA9| STZ.b $50

|078FAB| BRL .exit

;---------------------------------------------------------------------------------------------------

.still_dashing
|078FAE| BIT.b $3A
|078FB0| BPL .no_b_press

|078FB2| LDA.b $3C
|078FB4| CMP.b #$09
|078FB6| BCC .no_b_press

|078FB8| LDA.b #$09
|078FBA| STA.b $3C

.no_b_press
|078FBC| STZ.w $02CA

|078FBF| LDA.b $4D
|078FC1| BEQ .not_recoiling

|078FC3| STZ.w $037B
|078FC6| STZ.w $0374

|078FC9| STZ.b $5E
|078FCB| STZ.b $50

|078FCD| STZ.w $0372

|078FD0| STZ.b $48

|078FD2| LDA.w $0360
|078FD5| BEQ .bonking

;---------------------------------------------------------------------------------------------------

|078FD7| LDA.b $55
|078FD9| BEQ .no_cape

|078FDB| JSR ForciblyUnequipCape_quietly

.no_cape
|078FDE| JSR ResetSwordAndItemUsage

|078FE1| LDA.b #$01
|078FE3| STA.w $037B

|078FE6| STZ.w $0300

|078FE9| LDA.b #$02
|078FEB| STA.b $3D

|078FED| STZ.b $2E

|078FEF| LDA.b $67
|078FF1| AND.b #$F0
|078FF3| STA.b $67

|078FF5| LDA.b #$2B ; SFX3.2B
|078FF7| JSR PlayLinkSFX3Panned

|078FFA| LDA.b #$07 ; LINKSTATE 07
|078FFC| STA.b $5D

|078FFE| BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.bonking
|079001| LDA.b #$02 ; LINKSTATE 02
|079003| STA.b $5D

|079005| BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_recoiling
|079008| LDA.w $0374
|07900B| LSR A
|07900C| LSR A
|07900D| LSR A
|07900E| LSR A
|07900F| TAX

|079010| LDA.w $0374
|079013| BNE .dont_tick_dash_timer

|079015| LDA.b $4F

|079017| DEC.b $4F

.dont_tick_dash_timer
|079019| AND.w LinkDashSFXMasks,X
|07901C| BNE .no_sfx

|07901E| LDA.b #$23 ; SFX2.23
|079020| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.no_sfx
|079023| DEC.w $0374
|079026| BPL .skip_follower_logic

|079028| STZ.w $0374

|07902B| LDA.l $7EF3CC
|07902F| TAX

|079030| CMP.w FollowerReactionToDashing,X
|079033| BNE .dont_replace

|079035| LDA.w FollowerDashReplacement,X
|079038| STA.l $7EF3CC

.dont_replace
|07903C| BRL .continue_from_follower

;---------------------------------------------------------------------------------------------------

.skip_follower_logic
|07903F| LDA.b #$00
|079041| STA.b $4F

|079043| BIT.b $F2
|079045| BMI .holding_a

|079047| STZ.b $2E
|079049| STZ.w $0374
|07904C| STZ.b $5E

|07904E| LDA.b #$00 ; LINKSTATE 00
|079050| STA.b $5D

|079052| STZ.w $0372

|079055| BIT.b $3A
|079057| BMI .b_held

|079059| STZ.b $50

.b_held
|07905B| BRL .exit

;---------------------------------------------------------------------------------------------------

.holding_a
|07905E| LDY.b #$00
|079060| LDA.b #$1E ; ANCILLA 1E
|079062| JSL AncillaAdd_DashDust_charging

|079066| STZ.b $30
|079068| STZ.b $31

|07906A| LDA.b #$40
|07906C| STA.w $02F1

|07906F| LDA.b #$10
|079071| STA.b $5E

|079073| LDA.b $3A
|079075| AND.b #$80
|079077| BNE .cant_turn

|079079| LDA.b $6C
|07907B| BNE .cant_turn

|07907D| LDA.b $F0
|07907F| AND.b #$0F
|079081| BNE .dpad_held

.cant_turn
|079083| LDA.b $2F
|079085| LSR A
|079086| TAX

|079087| LDA.w WalkDirectionFlags,X

.dpad_held
|07908A| STA.b $26
|07908C| STA.b $67
|07908E| STA.w $0340

|079091| STZ.b $6B

;---------------------------------------------------------------------------------------------------

|079093| JSL HandleLinkAnimation_FullLongEntry

|079097| LDA.b $20
|079099| STA.b $00
|07909B| STA.b $3E

|07909D| LDA.b $22
|07909F| STA.b $01
|0790A1| STA.b $3F

|0790A3| LDA.b $21
|0790A5| STA.b $02
|0790A7| STA.b $40

|0790A9| LDA.b $23
|0790AB| STA.b $03
|0790AD| STA.b $41

|0790AF| JSR HandleLinkMovingFloor
|0790B2| JSR ApplyConveyorToLink

|0790B5| LDA.w $02F5
|0790B8| BEQ .not_on_somaria_platform

|0790BA| JSL HandleLinkVelocityAndSandDrag_long

.not_on_somaria_platform
|0790BE| LDA.b $20
|0790C0| SEC
|0790C1| SBC.b $3E
|0790C3| STA.b $30

|0790C5| LDA.b $22
|0790C7| SEC
|0790C8| SBC.b $3F
|0790CA| STA.b $31

|0790CC| JSR HandleLinkCardinalCollision
|0790CF| JSR HandleIndoorCameraAndDoors

|0790D2| BRL .exit

;---------------------------------------------------------------------------------------------------

.continue_from_follower
|0790D5| LDA.b $2E
|0790D7| CMP.b #$06
|0790D9| BCC .dont_reset_anim_step

|0790DB| STZ.b $2E

.dont_reset_anim_step
|0790DD| DEC.w $02F1

|0790E0| LDA.w $02F1
|0790E3| CMP.b #$20
|0790E5| BCS .dont_reset_anim_timer

|0790E7| LDA.b #$20
|0790E9| STA.w $02F1

.dont_reset_anim_timer
|0790EC| LDY.b #$00
|0790EE| LDA.b #$1E ; ANCILLA 1E
|0790F0| JSL AncillaAdd_DashDust

|0790F4| STZ.b $79

|0790F6| LDA.l $7EF359
|0790FA| INC A
|0790FB| AND.b #$FE
|0790FD| BEQ .no_sword

|0790FF| LDY.b #$07
|079101| JSR TileDetect_MainHandler

.no_sword
|079104| LDA.l $7EF3C5
|079108| BEQ .game_state_0

|07910A| LDA.b #$80
|07910C| TSB.b $3A

|07910E| LDA.b #$09
|079110| STA.b $3C

;---------------------------------------------------------------------------------------------------

.game_state_0
|079112| STZ.b $46

|079114| LDA.b $2F
|079116| LSR A
|079117| TAX

|079118| LDA.w WalkDirectionFlags,X
|07911B| STA.b $00

|07911D| LDA.b $F0
|07911F| AND.b #$0F
|079121| BEQ .no_direction_change

|079123| CMP.b $00
|079125| BEQ .no_direction_change

|079127| LDA.b #$12 ; LINKSTATE 12
|079129| STA.b $5D

|07912B| LDA.b $3A
|07912D| AND.b #$7F
|07912F| STA.b $3A

|079131| STZ.b $3C
|079133| STZ.b $3D

|079135| BRL LinkState_ExitingDash

;---------------------------------------------------------------------------------------------------

.no_direction_change
|079138| LDA.b $49
|07913A| AND.b #$0F
|07913C| BNE .dont_turn

|07913E| LDA.b $2F
|079140| LSR A
|079141| TAX

|079142| LDA.w WalkDirectionFlags,X

.dont_turn
|079145| STA.b $67
|079147| STA.b $26

|079149| JSR HandleLinkDiagonalCollision
|07914C| JSL HandleLinkVelocity

|079150| JSR HandleLinkCardinalCollision
|079153| JSL HandleLinkAnimation_FullLongEntry

|079157| STZ.w $0302

|07915A| JSR HandleIndoorCameraAndDoors

.exit
|07915D| RTS

;===================================================================================================

LinkState_ExitingDash:
|07915E| JSR CacheCameraPropertiesIfOutdoors

|079161| LDA.b $F0
|079163| AND.b #$0F
|079165| BNE .dpad_pressed

|079167| LDA.w $0374
|07916A| CMP.b #$10
|07916C| BCC .low_dash_timer

.dpad_pressed
|07916E| STZ.w $0374
|079171| STZ.b $5E

|079173| LDA.b #$00 ; LINKSTATE 00
|079175| STA.b $5D

|079177| STZ.w $0372
|07917A| STZ.w $032B

|07917D| LDA.b $3C
|07917F| CMP.b #$09
|079181| BCS .finish_up

|079183| STZ.b $50

|079185| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.low_dash_timer
|079187| LDA.w $0374
|07918A| CLC
|07918B| ADC.b #$01
|07918D| STA.w $0374

;---------------------------------------------------------------------------------------------------

.finish_up
|079190| JSL HandleLinkAnimation_FullLongEntry

|079194| RTS

;===================================================================================================

CancelDash:
|079195| LDA.w $0372
|079198| BEQ .exit

|07919A| PHX

|07919B| LDX.b #$04

.next_ancilla
|07919D| LDA.w $0C4A,X
|0791A0| CMP.b #$1E ; ANCILLA 1E
|0791A2| BNE .dont_delete

|0791A4| STZ.w $0C4A,X

.dont_delete
|0791A7| DEX
|0791A8| BPL .next_ancilla

|0791AA| PLX

|0791AB| STZ.w $0374
|0791AE| STZ.b $5E
|0791B0| STZ.w $0372
|0791B3| STZ.b $50
|0791B5| STZ.w $032B

.exit
|0791B8| RTS

;===================================================================================================

CancelDash_long:
|0791B9| JSR CancelDash

|0791BC| RTL

;===================================================================================================

RepelBonkSpeedY:
|0791BD| db $18, $E8, $00, $00

RepelBonkSpeedX:
|0791C1| db $00, $00, $18, $E8

TileReboundAFlaggingY:
|0791C5| db $01, $00, $00, $00

TileReboundAFlaggingX:
|0791C9| db $00, $00, $01, $00

;===================================================================================================

IceRepelAccelY:
|0791CD| dw $0180, $0180, $0000, $0000
|0791D5| dw $0100, $0100, $0000, $0000

IceRepelAccelX:
|0791DD| dw $0000, $0000, $0180, $0180
|0791E5| dw $0000, $0000, $0100, $0100

;===================================================================================================

RepelDirectionMasks:
|0791ED| db $08, $04, $02, $01

;---------------------------------------------------------------------------------------------------

RepelDash:
|0791F1| LDA.w $0372
|0791F4| BEQ .not_even_dashing

|0791F6| LDA.w $02F1
|0791F9| CMP.b #$40
|0791FB| BNE .continue

.not_even_dashing
|0791FD| BRL .exit

;---------------------------------------------------------------------------------------------------

.continue
|079200| JSL ResetSwimmingState

|079204| LDY.b #$01
|079206| LDA.b #$1D ; ANCILLA 1D
|079208| JSL AncillaAdd_DashTremor

|07920C| JSL LetsGetReadyToRumble

|079210| LDA.w $012F
|079213| AND.b #$3F
|079215| CMP.b #$1B ; SFX3.1B
|079217| BEQ LinkApplyTileRebound

|079219| CMP.b #$32 ; SFX3.32
|07921B| BEQ LinkApplyTileRebound

|07921D| LDA.b #$03 ; SFX3.03
|07921F| JSR PlayLinkSFX3Panned

;---------------------------------------------------------------------------------------------------

#LinkApplyTileRebound:
|079222| LDX.b $66

|079224| LDA.w RepelBonkSpeedY,X
|079227| STA.b $27

|079229| LDA.w RepelBonkSpeedX,X
|07922C| STA.b $28

|07922E| LDA.b #$18
|079230| STA.b $46

|079232| LDA.b #$24
|079234| STA.b $29
|079236| STA.w $02C7

|079239| LDA.w $034A
|07923C| BEQ .not_on_any_ice

;---------------------------------------------------------------------------------------------------

|07923E| LDA.w RepelDirectionMasks,X
|079241| STA.w $0340
|079244| STA.b $67

|079246| LDA.w TileReboundAFlaggingY,X
|079249| STA.w $0338

|07924C| LDA.w TileReboundAFlaggingX,X
|07924F| STA.w $033A

|079252| PHX

|079253| LDA.w $034A
|079256| DEC A
|079257| ASL A
|079258| ASL A
|079259| ASL A
|07925A| STA.b $08

|07925C| TXA
|07925D| ASL A
|07925E| CLC
|07925F| ADC.b $08
|079261| TAX

|079262| REP #$20

|079264| LDA.w IceRepelAccelY,X
|079267| STA.w $033C

|07926A| LDA.w IceRepelAccelX,X
|07926D| STA.w $033E

|079270| SEP #$20

|079272| PLX

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
|079273| LDA.b #$01
|079275| STA.b $4D
|079277| STA.w $02F8

|07927A| STZ.b $74
|07927C| STZ.w $0360

|07927F| STZ.b $5E
|079281| STZ.b $50
|079283| STZ.b $6B

|079285| TXA
|079286| AND.b #$02
|079288| BNE .dont_reset_x

|07928A| STZ.b $31

|07928C| BRA .exit

.dont_reset_x
|07928E| STZ.b $30

.exit
|079290| RTS

;===================================================================================================

RepelDash_long:
|079291| PHB
|079292| PHK
|079293| PLB

|079294| PHX

|079295| LDA.b $2F
|079297| LSR A
|079298| STA.b $66

|07929A| JSR RepelDash

|07929D| PLX

|07929E| PLB

|07929F| RTL

;===================================================================================================

FlagWalkDirections:
|0792A0| STZ.b $67

|0792A2| LDY.b #$00

|0792A4| LDA.b $27
|0792A6| BEQ .zero_y
|0792A8| BMI .negative_y

|0792AA| LDY.b #$01

.negative_y
|0792AC| JSR .flag_one

;---------------------------------------------------------------------------------------------------

.zero_y
|0792AF| LDY.b #$02

|0792B1| LDA.b $28
|0792B3| BEQ .exit
|0792B5| BMI .flag_one

|0792B7| LDY.b #$03

;---------------------------------------------------------------------------------------------------

.flag_one
|0792B9| LDA.w RepelDirectionMasks,Y
|0792BC| TSB.b $67

.exit
|0792BE| RTS

;===================================================================================================

PitFallAnimationFlags:
|0792BF| db $0A, $09, $06, $05, $08, $04, $02, $01

PitFallDirectionFlags:
|0792C7| db $05, $06, $09, $0A, $04, $08, $01, $02

PitFallDetectionFlags:
|0792CF| db $0C, $03, $0A, $05

;===================================================================================================

LinkState_Pits:
|0792D3| STZ.b $67

|0792D5| LDA.w $0302
|0792D8| BEQ .no_wall_touch

|0792DA| INC.w $02CA

|0792DD| LDA.w $02CA
|0792E0| CMP.b #$20
|0792E2| BNE .no_wall_touch

|0792E4| LDA.b #$1F
|0792E6| STA.w $02CA

|0792E9| BRA .check_for_pits

.no_wall_touch
|0792EB| LDA.w $0372
|0792EE| BEQ .not_dashing_a

|0792F0| LDA.w $0374
|0792F3| BEQ .not_charging_dash

|0792F5| BRL LinkState_Dashing

.not_charging_dash
|0792F8| LDA.b $F0
|0792FA| AND.b #$0F
|0792FC| BEQ .check_for_pits

|0792FE| AND.b $67
|079300| BNE .check_for_pits

|079302| JSR CancelDash

.not_dashing_a
|079305| LDA.b $4D
|079307| CMP.b #$01
|079309| BEQ .check_for_pits

|07930B| LDA.b $F0
|07930D| AND.b #$0F
|07930F| STA.b $67

;---------------------------------------------------------------------------------------------------

.check_for_pits
|079311| LDY.b #$04
|079313| JSR TileDetect_MainHandler

|079316| LDA.b $59
|079318| AND.b #$01
|07931A| BNE HandleLinkFallingInPit

|07931C| LDA.w $0372
|07931F| BEQ .not_dashing_b

|079321| BRL LinkState_Dashing

.not_dashing_b
|079324| STZ.b $5E

|079326| JSR CancelDash

|079329| LDA.b $3A
|07932B| AND.b #$80
|07932D| BNE .holding_b

|07932F| LDA.b $50
|079331| AND.b #$FE
|079333| STA.b $50

.holding_b
|079335| STZ.b $5B

|079337| LDY.b #$00 ; LINKSTATE 00

|079339| LDA.w $02E0
|07933C| BEQ .set_state_and_continue

|07933E| LDY.b #$17 ; LINKSTATE 17

|079340| LDA.l $7EF357
|079344| BEQ .set_state_and_continue

|079346| LDY.b #$1C ; LINKSTATE 1C

.set_state_and_continue
|079348| STY.b $5D

|07934A| CPY.b #$17 ; LINKSTATE 17
|07934C| BEQ .normal_bunny

|07934E| CPY.b #$1C ; LINKSTATE 1C
|079350| BEQ .temp_bunny

|079352| BRL LinkState_Default

.normal_bunny
|079355| BRL LinkState_Bunny

.temp_bunny
|079358| BRL LinkState_TemporaryBunny

;===================================================================================================

HandleLinkFallingInPit:
|07935B| JSR TileDetect_BigArea

|07935E| LDA.b #$04
|079360| STA.b $5E

|079362| LDA.b $59
|079364| AND.b #$0F
|079366| BNE .prepare_to_fall

|079368| STZ.b $5B
|07936A| STZ.b $5E

|07936C| LDY.b #$00 ; LINKSTATE 00

|07936E| LDA.w $02E0
|079371| BEQ .set_state

|079373| LDY.b #$17 ; LINKSTATE 17

|079375| LDA.l $7EF357
|079379| BEQ .set_state

|07937B| LDY.b #$1C ; LINKSTATE 1C

.set_state
|07937D| STY.b $5D

|07937F| JSR CancelDash

|079382| LDA.b $3A
|079384| AND.b #$80
|079386| BNE .sword_not_out

|079388| LDA.b $50
|07938A| AND.b #$FE
|07938C| STA.b $50

.sword_not_out
|07938E| BRL EXIT_079426

;---------------------------------------------------------------------------------------------------

.prepare_to_fall
|079391| CMP.b #$0F
|079393| BNE .dont_fall_just_yet

|079395| LDA.b $5B
|079397| CMP.b #$02
|079399| BEQ .already_falling

|07939B| LDA.l $7EF357
|07939F| BEQ .no_pearl

|0793A1| STZ.w $03F7

|0793A4| STZ.b $56

|0793A6| STZ.w $02E0

|0793A9| STZ.w $03F5
|0793AC| STZ.w $03F6

.no_pearl
|0793AF| STZ.b $67
|0793B1| STZ.b $00

|0793B3| LDA.b #$02
|0793B5| STA.b $5B

|0793B7| LDA.b #$01
|0793B9| STA.w $037B

|0793BC| STZ.b $3A
|0793BE| STZ.b $3C

|0793C0| STZ.w $0301
|0793C3| STZ.w $037A

|0793C6| STZ.b $46
|0793C8| STZ.b $4D

|0793CA| LDA.b #$1F ; SFX3.1F
|0793CC| JSR PlayLinkSFX3Panned

.already_falling
|0793CF| BRA DetermineConsequencesOfFalling

;---------------------------------------------------------------------------------------------------

.dont_fall_just_yet
|0793D1| LDX.b #$03

.check_next_flag
|0793D3| LDA.b $59
|0793D5| AND.b #$0F
|0793D7| CMP.w PitFallDetectionFlags,X
|0793DA| BNE .skip

|0793DC| TXA
|0793DD| CLC
|0793DE| ADC.b #$04
|0793E0| TAX

|0793E1| BRA .set_flag_index

.skip
|0793E3| DEX
|0793E4| BPL .check_next_flag

;---------------------------------------------------------------------------------------------------

|0793E6| LDX.b #$03

|0793E8| LDA.b $59

.shift
|0793EA| LSR A
|0793EB| BCS .set_flag_index

|0793ED| DEX
|0793EE| BPL .shift

.set_flag_index
|0793F0| STX.w $02C9

|0793F3| LDA.b $67
|0793F5| AND.w PitFallDirectionFlags,X
|0793F8| BEQ .not_very_slippery

|0793FA| LDA.b $67
|0793FC| STA.b $26

|0793FE| LDA.b #$06
|079400| STA.b $5E

|079402| BRA .continue

.not_very_slippery
|079404| LDA.b $67
|079406| STA.b $00

|079408| LDX.w $02C9

|07940B| LDA.w PitFallAnimationFlags,X
|07940E| TSB.b $67

|079410| LDA.b $00
|079412| BEQ .dont_animate

;---------------------------------------------------------------------------------------------------

.continue
|079414| JSL HandleLinkAnimation_FullLongEntry

.dont_animate
|079418| JSR HandleLinkDiagonalCollision
|07941B| JSL HandleLinkVelocity
|07941F| JSR HandleLinkCardinalCollision
|079422| JSL ApplyLinksMovementToCamera

;---------------------------------------------------------------------------------------------------

#EXIT_079426:
|079426| RTS

;===================================================================================================

DetermineConsequencesOfFalling:
|079427| STZ.b $50
|079429| STZ.b $46

|07942B| STZ.b $24
|07942D| STZ.b $25
|07942F| STZ.b $29

|079431| STZ.b $4D

|079433| STZ.w $0373
|079436| STZ.w $02E1

|079439| JSR ForciblyUnequipCape_quietly

|07943C| INC.w $037B

|07943F| DEC.b $5C
|079441| BPL EXIT_079426

|079443| INC.b $5A

|079445| LDX.b $5A

|079447| LDA.b #$09
|079449| STA.b $5C

|07944B| LDA.l $7EF3CC
|07944F| CMP.b #$0D ; FOLLOWER 0D
|079451| BEQ .no_hud_numbers

|079453| CPX.b #$01
|079455| BNE .no_hud_numbers

|079457| STX.w $02F9

;---------------------------------------------------------------------------------------------------

.no_hud_numbers
|07945A| CPX.b #$06
|07945C| BNE EXIT_079426

|07945E| JSR CancelDash

|079461| LDY.b #$07
|079463| STY.b $11

|079465| LDA.b #$06
|079467| STA.b $5A

|079469| LDA.b #$03
|07946B| STA.b $5B

|07946D| LDA.b #$0C
|07946F| STA.b $4B

|079471| LDA.b #$10
|079473| STA.b $57

|079475| LDA.b $20
|079477| SEC
|079478| SBC.b $E8
|07947A| STA.b $00

|07947C| STZ.b $01

|07947E| STZ.w $0308
|079481| STZ.w $0309
|079484| STZ.w $0376
|079487| STZ.w $030B

;---------------------------------------------------------------------------------------------------

|07948A| REP #$30

|07948C| LDA.b $1B
|07948E| AND.w #$00FF
|079491| BEQ .overworld_pit

|079493| LDA.b $00
|079495| PHA

|079496| SEP #$30

|079498| LDA.b $A0
|07949A| STA.b $A2

|07949C| JSL FullyUpdateRoomFlags

|0794A0| REP #$30

|0794A2| PLA
|0794A3| STA.b $00

|0794A5| LDX.w #$0070

|0794A8| LDA.b $A0

.check_next_room
|0794AA| CMP.l RoomsWithPitDamage,X
|0794AE| BEQ UnderworldPitDoDamage

|0794B0| DEX
|0794B1| DEX
|0794B2| BPL .check_next_room

;---------------------------------------------------------------------------------------------------

.overworld_pit
|0794B4| SEP #$20

|0794B6| LDA.b $A0
|0794B8| STA.b $A2

|0794BA| LDA.l $7EC000
|0794BE| STA.b $A0

|0794C0| REP #$20

|0794C2| LDA.w #$0010
|0794C5| CLC
|0794C6| ADC.b $00
|0794C8| STA.b $00

|0794CA| LDA.b $20
|0794CC| STA.b $51

|0794CE| SEC
|0794CF| SBC.b $00
|0794D1| STA.b $20

|0794D3| SEP #$30

|0794D5| LDA.b $1B
|0794D7| BNE HandleLayerOfDestination

|0794D9| LDA.b $8A
|0794DB| CMP.b #$05 ; OW 05
|0794DD| BNE .overworld_pit_transition

|0794DF| JSL TakeDamageFromPit

|0794E3| RTS

;---------------------------------------------------------------------------------------------------

.overworld_pit_transition
|0794E4| JSL GetPitEntranceDestination

|0794E8| LDA.b #$11
|0794EA| STA.b $10

|0794EC| STZ.b $11
|0794EE| STZ.b $B0

|0794F0| RTS

;===================================================================================================

HandleLayerOfDestination:
|0794F1| LDX.w $063C

|0794F4| LDA.l LayerOfDestination.for_0476,X
|0794F8| STA.w $0476

|0794FB| LDA.l LayerOfDestination.for_EE,X
|0794FF| STA.b $EE

|079501| RTS

;===================================================================================================

UnderworldPitDoDamage:
|079502| SEP #$30

|079504| LDA.b #$14
|079506| STA.b $11

|079508| LDA.l $7EF36D
|07950C| SEC
|07950D| SBC.b #$08
|07950F| STA.l $7EF36D

|079513| CMP.b #$A8
|079515| BCC .exit

|079517| LDA.b #$00
|079519| STA.l $7EF36D

.exit
|07951D| RTS

;===================================================================================================

UNREACHABLE_07951E:
|07951E| db $21, $24

;===================================================================================================

HandleUnderworldLandingFromPit:
|079520| PHB
|079521| PHK
|079522| PLB

|079523| JSL DrawLink

|079527| REP #$20

|079529| LDA.b $22
|07952B| STA.w $0FC2

|07952E| LDA.b $20
|079530| STA.w $0FC4

|079533| SEP #$20

|079535| LDA.b $11
|079537| CMP.b #$07
|079539| BNE .dont_make_link_visible

|07953B| STZ.b $4B

.dont_make_link_visible
|07953D| LDA.b $1A
|07953F| AND.b #$03
|079541| BNE .dont_update_pose

|079543| INC.b $5A

|079545| LDA.b $5A
|079547| CMP.b #$0A
|079549| BNE .dont_update_pose

|07954B| LDA.b #$06
|07954D| STA.b $5A

.dont_update_pose
|07954F| LDA.b #$04
|079551| STA.b $67

|079553| JSL HandleLinkVelocity

|079557| REP #$20

|079559| LDA.b $20
|07955B| BPL .compare_target_coord

|07955D| LDA.b $51
|07955F| BMI .compare_target_coord

|079561| LDA.b $20
|079563| EOR.w #$FFFF
|079566| INC A
|079567| CLC
|079568| ADC.b $51
|07956A| BMI .the_eagle_has_landed

|07956C| BRL .exit

.compare_target_coord
|07956F| LDA.b $51
|079571| CMP.b $20
|079573| BCC .the_eagle_has_landed

|079575| BRL .exit

;---------------------------------------------------------------------------------------------------

.the_eagle_has_landed
|079578| LDA.b $51
|07957A| STA.b $20

|07957C| SEP #$20

|07957E| STZ.b $2E

|079580| STZ.b $57

|079582| STZ.b $5A
|079584| STZ.b $5B

|079586| STZ.b $5E

|079588| STZ.b $B0
|07958A| STZ.b $11

|07958C| STZ.w $037B

|07958F| LDA.l $7EF3CC
|079593| BEQ .dont_reinitialize_follower

|079595| CMP.b #$03 ; FOLLOWER 03
|079597| BEQ .dont_reinitialize_follower

|079599| STZ.w $02F9

|07959C| CMP.b #$0D ; FOLLOWER 0D
|07959E| BNE .dont_delete_follower

|0795A0| LDA.b #$00
|0795A2| STA.l $7EF3CC
|0795A6| STA.w $04B4
|0795A9| STA.w $04B5
|0795AC| STA.l $7EF3D3

|0795B0| BRA .dont_reinitialize_follower

.dont_delete_follower
|0795B2| JSL InitializeFollower

;---------------------------------------------------------------------------------------------------

.dont_reinitialize_follower
|0795B6| LDY.b #$00

|0795B8| JSR TileDetect_MainHandler

|0795BB| LDA.w $0359
|0795BE| AND.b #$01
|0795C0| BEQ .not_shallow_water

|0795C2| LDA.b #$24 ; SFX2.24
|0795C4| JSR PlayLinkSFX2Panned

.not_shallow_water
|0795C7| JSR TileDetect_BigArea

|0795CA| LDA.w $012E
|0795CD| AND.b #$3F
|0795CF| CMP.b #$24 ; SFX2.24
|0795D1| BEQ .already_made_a_sound

|0795D3| LDA.b #$21 ; SFX2.21
|0795D5| JSR PlayLinkSFX2Panned

.already_made_a_sound
|0795D8| LDA.b $AD
|0795DA| CMP.b #$02
|0795DC| BNE .dont_flag_masks

|0795DE| LDA.w $034C
|0795E1| AND.b #$0F
|0795E3| BEQ .dont_flag_masks

|0795E5| LDA.b #$03
|0795E7| STA.w $0322

.dont_flag_masks
|0795EA| LDA.w $0341
|0795ED| AND.b #$0F
|0795EF| CMP.b #$0F
|0795F1| BNE .didnt_find_water

|0795F3| LDA.b #$01
|0795F5| STA.w $0345

|0795F8| LDA.b $26
|0795FA| STA.w $0340

|0795FD| JSL ResetSwimmingState

|079601| LDA.b #$01
|079603| STA.b $EE

|079605| LDA.b #$15 ; ANCILLA 15
|079607| LDY.b #$00
|079609| JSL AncillaAdd_Splash

|07960D| LDA.b #$04 ; LINKSTATE 04
|07960F| STA.b $5D

|079611| JSR ForciblyUnequipCape_quietly

|079614| STZ.w $0308
|079617| STZ.w $0309
|07961A| STZ.w $0376
|07961D| STZ.b $5E

|07961F| BRA .exit

.didnt_find_water
|079621| LDA.b $59
|079623| AND.b #$0F
|079625| BNE .pit

|079627| LDA.b #$00 ; LINKSTATE 00
|079629| STA.b $5D

|07962B| BRA .exit

.pit
|07962D| LDA.b #$01 ; LINKSTATE 01
|07962F| STA.b $5D

;---------------------------------------------------------------------------------------------------

.exit
|079631| SEP #$20

|079633| PLB

|079634| RTL

;===================================================================================================

LinkSwimming_anim_offset:
|079635| db $02, $00, $01, $00

;===================================================================================================

MaxSwimAcceleration:
|079639| dw $00F0

;===================================================================================================

LinkState_Swimming:
|07963B| LDA.b $4D
|07963D| BEQ .not_diving

|07963F| LDA.b #$02 ; LINKSTATE 02
|079641| STA.b $5D
|079643| STZ.b $25

|079645| JSR ResetAllAcceleration

|079648| STZ.w $032A
|07964B| STZ.w $034F

|07964E| LDA.b $50
|079650| AND.b #$FE
|079652| STA.b $50

|079654| BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_diving
|079657| STZ.b $3A
|079659| STZ.b $3C
|07965B| STZ.b $3D
|07965D| STZ.b $79

|07965F| STZ.w $0308
|079662| STZ.w $0309

; fake flippers fix
|079665| LDA.l $7EF356
|079669| BNE .have_flippers

|07966B| RTS

;---------------------------------------------------------------------------------------------------

.have_flippers
|07966C| LDA.w $033C
|07966F| ORA.w $033D
|079672| ORA.w $033E
|079675| ORA.w $033F
|079678| BNE .no_accel

|07967A| LDA.w $032B
|07967D| CMP.b #$02
|07967F| BEQ .dont_reset_collision

|079681| LDA.w $032D
|079684| CMP.b #$02
|079686| BEQ .dont_reset_collision

|079688| JSR ResetAllAcceleration

;---------------------------------------------------------------------------------------------------

.dont_reset_collision
|07968B| LDA.b $2E
|07968D| AND.b #$01
|07968F| STA.b $2E

|079691| INC.b $2D

|079693| LDA.b $2D
|079695| CMP.b #$10
|079697| BCC .continue

;---------------------------------------------------------------------------------------------------

|079699| STZ.b $2D
|07969B| STZ.w $02CC

|07969E| LDA.b $2E
|0796A0| AND.b #$01
|0796A2| EOR.b #$01
|0796A4| STA.b $2E

|0796A6| BRA .continue

;---------------------------------------------------------------------------------------------------

.no_accel
|0796A8| INC.b $2D

|0796AA| LDA.b $2D
|0796AC| CMP.b #$08
|0796AE| BCC .continue

|0796B0| STZ.b $2D

|0796B2| LDA.b $2E
|0796B4| INC A
|0796B5| AND.b #$03
|0796B7| STA.b $2E

|0796B9| TAX

|0796BA| LDA.w LinkSwimming_anim_offset,X
|0796BD| STA.w $02CC

;---------------------------------------------------------------------------------------------------

.continue
|0796C0| LDA.w $034F
|0796C3| BNE .not_stroking

|0796C5| LDA.w $033C
|0796C8| ORA.w $033D
|0796CB| ORA.w $033E
|0796CE| ORA.w $033F
|0796D1| BEQ HandleSwimMovement

|0796D3| LDA.b $F6
|0796D5| AND.b #$80
|0796D7| STA.b $00

|0796D9| LDA.b $F4
|0796DB| ORA.b $00
|0796DD| AND.b #$C0
|0796DF| BEQ HandleSwimMovement

|0796E1| STA.w $034F

|0796E4| LDA.b #$25 ; SFX2.25
|0796E6| JSR PlayLinkSFX2Panned

|0796E9| LDA.b #$01
|0796EB| STA.w $032A

|0796EE| LDA.b #$07
|0796F0| STA.w $02CB

|0796F3| JSR HandleSwimAccels

;---------------------------------------------------------------------------------------------------

.not_stroking
|0796F6| DEC.w $02CB
|0796F9| BPL HandleSwimMovement

|0796FB| LDA.b #$07
|0796FD| STA.w $02CB

|079700| INC.w $032A

|079703| LDA.w $032A
|079706| CMP.b #$05
|079708| BNE HandleSwimMovement

|07970A| STZ.w $032A

|07970D| LDA.w $034F
|079710| AND.b #$3F
|079712| STA.w $034F

;===================================================================================================

HandleSwimMovement:
|079715| LDA.b $49
|079717| AND.b #$0F
|079719| BNE .did_movement

|07971B| LDA.b $F0
|07971D| AND.b #$0F
|07971F| BNE .did_movement

|079721| STZ.b $30
|079723| STZ.b $31

|079725| JSR FlagMaxAccels

|079728| LDA.w $034A
|07972B| BEQ .check_if_swimming

|07972D| LDA.w $0372
|079730| BEQ .not_dashing

|079732| LDA.w $0340
|079735| BRA .did_movement

;---------------------------------------------------------------------------------------------------

.not_dashing
|079737| LDA.w $033C
|07973A| ORA.w $033D
|07973D| ORA.w $033E
|079740| ORA.w $033F
|079743| BNE .finish_up

|079745| STZ.b $48

|079747| JSL ResetSwimmingState

|07974B| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.check_if_swimming
|07974D| LDA.b $5D
|07974F| CMP.b #$04 ; LINKSTATE 04
|079751| BEQ .finish_up

|079753| STZ.b $2E

|079755| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.did_movement
|079757| CMP.w $0340
|07975A| BEQ .dont_reset

|07975C| STZ.b $2A
|07975E| STZ.b $2B
|079760| STZ.b $6B
|079762| STZ.b $48

.dont_reset
|079764| STA.w $0340

|079767| JSR SetIceMaxAccel
|07976A| JSR SetMomentum
|07976D| JSR SetMaxAccel

;---------------------------------------------------------------------------------------------------

.finish_up
|079770| JSR HandleLinkDiagonalCollision
|079773| JSL HandleLinkVelocity
|079777| JSR HandleLinkCardinalCollision
|07977A| JSL HandleLinkAnimation_FullLongEntry

|07977E| STZ.w $0302

|079781| JSR HandleIndoorCameraAndDoors

|079784| RTS

;===================================================================================================

FlagMaxAccels:
|079785| REP #$20

|079787| LDA.w $034A
|07978A| AND.w #$00FF
|07978D| BEQ .exit

|07978F| LDX.b #$02

.next
|079791| LDA.w $033C,X
|079794| BEQ .to_next

|079796| STA.w $0334,X

|079799| LDA.w #$0001
|07979C| STA.w $032B,X

.to_next
|07979F| DEX
|0797A0| DEX
|0797A1| BPL .next

.exit
|0797A3| SEP #$20

|0797A5| RTS

;===================================================================================================

SetIceMaxAccel:
|0797A6| REP #$20

|0797A8| LDA.w $034A
|0797AB| AND.w #$00FF
|0797AE| BEQ .exit

|0797B0| LDX.b #$02

.next
|0797B2| LDA.w #$0180
|0797B5| STA.w $0334,X

|0797B8| DEX
|0797B9| DEX
|0797BA| BPL .next

.exit
|0797BC| SEP #$20

|0797BE| RTS

;===================================================================================================

pool SetMomentum

.direction ; Unused
|0797BF| db $08, $04, $02, $01

.momentum
|0797C3| dw $0020
|0797C5| dw $0008

endpool

;---------------------------------------------------------------------------------------------------

SetMomentum:
|0797C7| SEP #$20

|0797C9| LDA.b $F0
|0797CB| AND.b #$0F
|0797CD| STA.b $00

|0797CF| STZ.b $01

|0797D1| REP #$30

|0797D3| LDA.w #$0003
|0797D6| STA.b $02

|0797D8| LDX.w #$0002
|0797DB| STX.b $04

;---------------------------------------------------------------------------------------------------

.next
|0797DD| LDY.w #$0000

|0797E0| LDA.b $00
|0797E2| AND.b $02
|0797E4| BEQ .skip

|0797E6| AND.b $04
|0797E8| BNE .pressed_left

|0797EA| LDY.w #$0001

.pressed_left
|0797ED| LDA.w #$0020
|0797F0| STA.w $0326,X

|0797F3| LDA.w $034A
|0797F6| AND.w #$00FF
|0797F9| BEQ .not_on_ice

|0797FB| PHY

|0797FC| DEC A
|0797FD| ASL A
|0797FE| TAY

|0797FF| LDA.w .momentum,Y
|079802| STA.w $0326,X

|079805| PLY

.not_on_ice
|079806| LDA.w $0340
|079809| ORA.b $67
|07980B| AND.b $02
|07980D| CMP.b $02
|07980F| BNE .did_a_left_press

|079811| LDA.w #$0002
|079814| STA.w $032B,X

|079817| BRA .continue

.did_a_left_press
|079819| TYA
|07981A| STA.w $0338,X

|07981D| STZ.w $032B,X

.continue
|079820| LDA.w $0334,X
|079823| BNE .skip

|079825| LDA.w MaxSwimAcceleration
|079828| STA.w $0334,X

.skip
|07982B| ASL.b $02
|07982D| ASL.b $02
|07982F| ASL.b $04
|079831| ASL.b $04

|079833| DEX
|079834| DEX
|079835| BPL .next

|079837| SEP #$30

|079839| RTS

;===================================================================================================

ResetSwimmingState:
|07983A| PHB
|07983B| PHK
|07983C| PLB

|07983D| STZ.w $02CB
|079840| STZ.w $034F
|079843| STZ.w $032A

|079846| JSR ResetAllAcceleration

|079849| PLB

|07984A| RTL

;===================================================================================================

ResetStateAfterDamagingPit:
|07984B| PHB
|07984C| PHK
|07984D| PLB

|07984E| JSL ResetSwimmingState

|079852| LDY.b #$00 ; LINKSTATE 00

|079854| LDA.b $56
|079856| BEQ .dont_bunny

|079858| LDA.l $7EF357
|07985C| BNE .dont_bunny

|07985E| LDY.b #$17 ; LINKSTATE 17

.dont_bunny
|079860| STY.b $5D

|079862| LDA.w $0340
|079865| STA.b $26

|079867| STZ.w $0345
|07986A| STZ.w $037B

|07986D| STZ.b $5A
|07986F| STZ.b $5B

|079871| PLB

|079872| RTL

;===================================================================================================

ResetAllAcceleration:
|079873| REP #$20

|079875| STZ.w $032F
|079878| STZ.w $0331

|07987B| STZ.w $0326
|07987E| STZ.w $0328

|079881| STZ.w $032B
|079884| STZ.w $032D

|079887| STZ.w $033C
|07988A| STZ.w $033E

|07988D| STZ.w $0334
|079890| STZ.w $0336

|079893| SEP #$20

|079895| RTS

;===================================================================================================

pool HandleSwimAccels

.max_speeds
|079896| dw $0080, $00A0, $00C0, $00E0
|07989E| dw $0100, $0120, $0140, $0160
|0798A6| dw $0180

endpool

;---------------------------------------------------------------------------------------------------

HandleSwimAccels:
|0798A8| REP #$30

|0798AA| LDX.w #$0002

|0798AD| LDA.w #$0003
|0798B0| STA.b $02

;---------------------------------------------------------------------------------------------------

.next
|0798B2| LDA.b $F0
|0798B4| AND.b $02
|0798B6| BEQ .next_axis

|0798B8| LDA.w $033C,X
|0798BB| BEQ .check_max

|0798BD| LDA.w $0334,X
|0798C0| CMP.w #$0180
|0798C3| BCC .check_max

|0798C5| LDY.w #$0000

.check_next
|0798C8| LDA.w .max_speeds,Y
|0798CB| CMP.w $033C,X
|0798CE| BCS .set

|0798D0| INY
|0798D1| INY
|0798D2| CPY.w #$0012
|0798D5| BNE .check_next

|0798D7| BRA .set

.check_max
|0798D9| LDA.w $0334,X
|0798DC| BEQ .no_max

|0798DE| CLC
|0798DF| ADC.w #$00A0
|0798E2| CMP.w #$0180
|0798E5| BCC .set

|0798E7| LDA.w #$0180
|0798EA| BRA .set

.no_max
|0798EC| LDA.w #$0001
|0798EF| STA.w $033C,X

|0798F2| LDA.w MaxSwimAcceleration

.set
|0798F5| STA.w $0334,X

.next_axis
|0798F8| ASL.b $02
|0798FA| ASL.b $02

|0798FC| DEX
|0798FD| DEX
|0798FE| BPL .next

|079900| SEP #$30

|079902| RTS

;===================================================================================================

SetMaxAccel:
|079903| REP #$30

|079905| LDA.w $034A
|079908| AND.w #$00FF
|07990B| BNE .exit

|07990D| LDA.w $034F
|079910| AND.w #$00FF
|079913| BNE .exit

;---------------------------------------------------------------------------------------------------

|079915| LDX.w #$0002

|079918| LDA.w #$0003
|07991B| STA.b $02

.next
|07991D| LDA.b $F0
|07991F| AND.b $02
|079921| BEQ .set

|079923| LDA.w $032B,X
|079926| CMP.w #$0002
|079929| BEQ .set

|07992B| LDA.w $032F,X
|07992E| BNE .reset

|079930| STZ.w $032F,X

|079933| LDA.w $033C,X
|079936| CMP.w MaxSwimAcceleration
|079939| BCC .to_next

|07993B| CMP.w $0334,X
|07993E| BEQ .reset
|079940| BCC .to_next

.reset
|079942| STZ.w $032B,X

|079945| LDA.w $033C,X
|079948| CMP.w MaxSwimAcceleration
|07994B| BCC .set

|07994D| LDA.w #$0001
|079950| STA.w $032B,X
|079953| STA.w $032F,X

|079956| BRA .to_next

.set
|079958| LDA.w MaxSwimAcceleration
|07995B| STA.w $0334,X
|07995E| STZ.w $032F,X

.to_next
|079961| ASL.b $02
|079963| ASL.b $02

|079965| DEX
|079966| DEX
|079967| BPL .next

.exit
|079969| SEP #$30

|07996B| RTS

;===================================================================================================

LinkState_Zapped:
|07996C| JSR CacheCameraPropertiesIfOutdoors
|07996F| JSL HandleZapMosaic

|079973| DEC.b $3D
|079975| BPL LinkState_ShowingOffItem

|079977| LDA.b #$02
|079979| STA.b $3D

|07997B| LDA.w $0300
|07997E| INC A
|07997F| STA.w $0300

|079982| AND.b #$01
|079984| BEQ .normal_palette

|079986| JSL RefreshEquipmentPalettes_zap
|07998A| BRA .continue

.normal_palette
|07998C| JSL RefreshEquipmentPalettes_sword_and_mail

.continue
|079990| LDA.w $0300
|079993| CMP.b #$08
|079995| BNE LinkState_ShowingOffItem

|079997| STZ.w $0300

|07999A| LDA.b #$00 ; LINKSTATE 00
|07999C| STA.b $5D

|07999E| STZ.w $037B
|0799A1| STZ.w $0360

|0799A4| STZ.b $4D

|0799A6| LDA.b #$00
|0799A8| JSL ResetZapMosaic

;===================================================================================================

LinkState_ShowingOffItem:
|0799AC| RTS

;===================================================================================================

GrantItemReceipt:
|0799AD| PHB
|0799AE| PHK
|0799AF| PLB

|0799B0| LDA.b $4D
|0799B2| BEQ .not_recoiling

|0799B4| STZ.b $4D
|0799B6| STZ.b $46

|0799B8| STZ.w $031F
|0799BB| STZ.w $0308

.not_recoiling
|0799BE| STY.w $02D8

|0799C1| CPY.b #$3E ; ITEMGET 3E
|0799C3| BNE .not_boss_heart

|0799C5| LDA.b #$2E ; SFX3.2E
|0799C7| JSR PlayLinkSFX3Panned

.not_boss_heart
|0799CA| LDA.b #$60
|0799CC| STA.w $02D9

|0799CF| LDA.w $02E9
|0799D2| BEQ .normal_pose

|0799D4| CMP.b #$03
|0799D6| BNE .not_cool_pose

;---------------------------------------------------------------------------------------------------

.normal_pose
|0799D8| STZ.w $0308

|0799DB| STZ.b $3A
|0799DD| STZ.b $3B
|0799DF| STZ.b $3C

|0799E1| STZ.b $5E
|0799E3| STZ.b $50

|0799E5| STZ.w $0301
|0799E8| STZ.w $037A

|0799EB| STZ.w $0300

|0799EE| LDA.b #$15 ; LINKSTATE 15
|0799F0| STA.b $5D

|0799F2| LDA.b #$01
|0799F4| STA.w $02DA
|0799F7| STA.w $037B

|0799FA| CPY.b #$20 ; ITEMGET 20
|0799FC| BNE .not_cool_pose

|0799FE| INC A
|0799FF| STA.w $02DA

;---------------------------------------------------------------------------------------------------

.not_cool_pose
|079A02| PHX

|079A03| LDY.b #$04
|079A05| LDA.b #$22 ; ANCILLA 22
|079A07| JSL AncillaAdd_ItemReceipt

|079A0B| LDA.w $02D8

|079A0E| CMP.b #$20 ; ITEMGET 20
|079A10| BEQ .skip_hud

|079A12| CMP.b #$37 ; ITEMGET 37
|079A14| BEQ .skip_hud

|079A16| CMP.b #$38 ; ITEMGET 38
|079A18| BEQ .skip_hud

|079A1A| CMP.b #$39 ; ITEMGET 39
|079A1C| BEQ .skip_hud

|079A1E| JSL RefreshItemIcon

.skip_hud
|079A22| JSR CancelDash

|079A25| PLX

|079A26| CLC

|079A27| PLB

|079A28| RTL

;===================================================================================================

UNREACHABLE_079A29:
|079A29| SEC

|079A2A| PLB

|079A2B| RTL

;===================================================================================================

TuckLinkIntoBed:
|079A2C| PHB
|079A2D| PHK
|079A2E| PLB

|079A2F| REP #$20

|079A31| LDA.w #$215A
|079A34| STA.b $20

|079A36| LDA.w #$0940
|079A39| STA.b $22

|079A3B| SEP #$20

|079A3D| LDA.b #$16 ; LINKSTATE 16
|079A3F| STA.b $5D

|079A41| STZ.w $037C
|079A44| STZ.w $037D

|079A47| LDA.b #$03
|079A49| STA.w $0374

|079A4C| LDA.b #$20 ; ANCILLA 20
|079A4E| JSL AncillaAdd_Blanket

|079A52| PLB

|079A53| RTL

;===================================================================================================

pool LinkState_Sleeping

.vectors
|079A54| dw SnoringInBed
|079A56| dw SittingUpInBed
|079A58| dw JumpingOutOfBed

endpool

;---------------------------------------------------------------------------------------------------

LinkState_Sleeping:
|079A5A| LDA.w $037C
|079A5D| ASL A
|079A5E| TAX

|079A5F| JMP.w (.vectors,X)

;===================================================================================================

SnoringInBed:
|079A62| LDA.b $1A
|079A64| AND.b #$1F
|079A66| BNE .exit

|079A68| LDY.b #$01
|079A6A| LDA.b #$21 ; ANCILLA 21
|079A6C| JSL AncillaAdd_Snoring

.exit
|079A70| RTS

;===================================================================================================

SittingUpInBed:
|079A71| LDA.b $11
|079A73| BNE .exit

|079A75| DEC.w $0374
|079A78| BPL .exit

|079A7A| STZ.w $0374

|079A7D| LDA.b $F4
|079A7F| AND.b #$E0
|079A81| STA.b $00

|079A83| LDA.b $F4

|079A85| ASL A
|079A86| ASL A
|079A87| ASL A
|079A88| ASL A

|079A89| ORA.b $00
|079A8B| ORA.b $F6

|079A8D| AND.b #$F0
|079A8F| BEQ .exit

|079A91| INC.w $037D

|079A94| LDA.b #$06
|079A96| STA.b $2F

|079A98| INC.w $037C

|079A9B| LDA.b #$04
|079A9D| STA.w $0374

.exit
|079AA0| RTS

;===================================================================================================

JumpingOutOfBed:
|079AA1| DEC.w $0374
|079AA4| BPL .exit

|079AA6| LDA.b #$04
|079AA8| STA.b $27

|079AAA| LDA.b #$15
|079AAC| STA.b $28

|079AAE| LDA.b #$18
|079AB0| STA.b $29
|079AB2| STA.w $02C7

|079AB5| LDA.b #$10
|079AB7| STA.b $46

|079AB9| LDA.b #$02
|079ABB| STA.b $4D

|079ABD| LDA.b #$06 ; LINKSTATE 06
|079ABF| STA.b $5D

.exit
|079AC1| RTS

;===================================================================================================

HandleSwordCooldown:
|079AC2| DEC.w $02E3
|079AC5| BPL EXIT_079AE5

|079AC7| STZ.w $02E3

|079ACA| LDA.w $0301
|079ACD| ORA.w $037A
|079AD0| BNE EXIT_079AE5

|079AD2| LDA.b $3C
|079AD4| CMP.b #$09
|079AD6| BCS .spin_attack

|079AD8| LDA.w $0372
|079ADB| BNE EXIT_079AE5

|079ADD| JSR CheckForSwordSwing
|079AE0| BRA EXIT_079AE5

.spin_attack
|079AE2| JSR HandleSwordControls

;---------------------------------------------------------------------------------------------------

#EXIT_079AE5:
|079AE5| RTS

;===================================================================================================

pool HandleYItem

.vectors
|079AE6| dw LinkItem_Bombs
|079AE8| dw LinkItem_Boomerang
|079AEA| dw LinkItem_Bow
|079AEC| dw LinkItem_Hammer

|079AEE| dw LinkItem_Rod
|079AF0| dw LinkItem_Rod
|079AF2| dw LinkItem_Net
|079AF4| dw LinkItem_ShovelAndFlute

|079AF6| dw LinkItem_Lamp
|079AF8| dw LinkItem_Powder
|079AFA| dw LinkItem_Bottle
|079AFC| dw LinkItem_Book

|079AFE| dw LinkItem_CaneOfByrna
|079B00| dw LinkItem_Hookshot
|079B02| dw LinkItem_Bombos
|079B04| dw LinkItem_Ether

|079B06| dw LinkItem_Quake
|079B08| dw LinkItem_CaneOfSomaria
|079B0A| dw LinkItem_Cape
|079B0C| dw LinkItem_Mirror

endpool

;---------------------------------------------------------------------------------------------------

HandleYItem:
|079B0E| LDA.b $3C
|079B10| BEQ .sword_not_out

|079B12| CMP.b #$09
|079B14| BCC EXIT_079AE5

.sword_not_out
|079B16| LDA.w $02E0
|079B19| BEQ .not_bunny

|079B1B| LDA.w $0303
|079B1E| CMP.b #$0B
|079B20| BEQ .not_bunny

|079B22| CMP.b #$14
|079B24| BEQ .not_bunny

|079B26| RTS

;---------------------------------------------------------------------------------------------------

.not_bunny
|079B27| LDY.w $03FC
|079B2A| BEQ .just_use_item_already

|079B2C| LDA.w $02E0
|079B2F| BNE .just_use_item_already

|079B31| CPY.b #$02
|079B33| BEQ .force_bow

|079B35| BRL LinkItem_Shovel

.force_bow
|079B38| BRL LinkItem_Bow

.just_use_item_already
|079B3B| LDY.w $0304
|079B3E| CPY.w $0303
|079B41| BEQ .dont_remove_cape

|079B43| LDA.w $0304
|079B46| CMP.b #$08
|079B48| BNE .cant_flute

|079B4A| LDA.l $7EF34C
|079B4E| AND.b #$02
|079B50| BEQ .cant_flute

|079B52| LDA.b $3A
|079B54| AND.b #$BF
|079B56| STA.b $3A

;---------------------------------------------------------------------------------------------------

.cant_flute
|079B58| LDA.w $0304
|079B5B| CMP.b #$13
|079B5D| BNE .dont_remove_cape

|079B5F| LDA.b $55
|079B61| BEQ .dont_remove_cape

|079B63| JSR ForciblyUnequipCape

.dont_remove_cape
|079B66| LDA.w $0301
|079B69| ORA.w $037A
|079B6C| BNE .dont_copy_item

|079B6E| LDY.w $0303
|079B71| STY.w $0304

.dont_copy_item
|079B74| BEQ .exit

;---------------------------------------------------------------------------------------------------

|079B76| CPY.b #$05
|079B78| BEQ .rod

|079B7A| CPY.b #$06
|079B7C| BNE .not_rod

.rod
|079B7E| LDA.w $0304
|079B81| SEC
|079B82| SBC.b #$05
|079B84| INC A
|079B85| STA.w $0307

;---------------------------------------------------------------------------------------------------

.not_rod
|079B88| DEY
|079B89| BMI .exit

|079B8B| TYA
|079B8C| ASL A
|079B8D| TAX

|079B8E| JMP.w (.vectors,X)

.exit
|079B91| RTS

;===================================================================================================

HandleDO_vectors:
|079B92| dw EXIT_07AAA1
|079B94| dw HandleDO_LiftCarryThrow
|079B96| dw EXIT_07B2ED
|079B98| dw HandleDO_PullObject
|079B9A| dw EXIT_07B527
|079B9C| dw EXIT_07B5BF
|079B9E| dw HandleDO_StatueDrag
|079BA0| dw EXIT_07B40C

;===================================================================================================

AbilityChecks:
|079BA2| db $E0 ; 11100000 - Lift, read, talk
|079BA3| db $40 ; 01000000 - Read
|079BA4| db $04 ; 00000100 - Run
|079BA5| db $E0 ; 11100000 - Lift, read, talk
|079BA6| db $E0 ; 11100000 - Lift, read, talk
|079BA7| db $E0 ; 11100000 - Lift, read, talk
|079BA8| db $E0 ; 11100000 - Lift, read, talk | used by statue drag
|079BA9| db $E0 ; 11100000 - Lift, read, talk | used by rupee pull

;===================================================================================================

HandleAPress:
|079BAA| STZ.w $02F4

|079BAD| LDA.w $0301
|079BB0| BNE .exit

|079BB2| LDA.w $037A
|079BB5| AND.b #$1F
|079BB7| BNE .exit

|079BB9| LDA.w $0379
|079BBC| BNE .exit

|079BBE| LDA.b $3C
|079BC0| CMP.b #$09
|079BC2| BCS .not_using_sword

|079BC4| LDA.b $3A
|079BC6| AND.b #$80
|079BC8| BEQ .not_using_sword

.exit
|079BCA| RTS

;---------------------------------------------------------------------------------------------------

.not_using_sword
|079BCB| LDX.w $036C

|079BCE| LDA.w $0308
|079BD1| ORA.w $0376
|079BD4| BNE .handle_toss_and_grab

;---------------------------------------------------------------------------------------------------

|079BD6| JSR TestAButton
|079BD9| BCC .no_a_press

|079BDB| LDA.w $03F8
|079BDE| BEQ .no_rupee_pull

|079BE0| LDA.b $2F
|079BE2| BNE .no_rupee_pull

|079BE4| LDX.b #$07
|079BE6| BRL .use_a_press

.no_rupee_pull
|079BE9| LDA.w $02FA
|079BEC| BEQ .not_statue

|079BEE| LDX.b #$06
|079BF0| BRL .use_a_press

;---------------------------------------------------------------------------------------------------

.not_statue
|079BF3| LDA.w $02EC
|079BF6| BNE .not_lifting

|079BF8| LDA.w $0314
|079BFB| BEQ .cant_lift_sprite

|079BFD| LDA.w $0314
|079C00| STA.w $02F4

.not_lifting
|079C03| LDA.b $3C
|079C05| BEQ .no_sword

|079C07| JSR ResetSwordAndItemUsage

.no_sword
|079C0A| LDA.w $0301
|079C0D| ORA.w $037A
|079C10| BEQ .no_boom

|079C12| STZ.w $0301
|079C15| STZ.w $037A

|079C18| JSR ResetBoomerangYStuff

|079C1B| STZ.w $035F

|079C1E| LDA.w $0C4A
|079C21| CMP.b #$05 ; ANCILLA 05
|079C23| BNE .no_boom

|079C25| STZ.w $0C4A

.no_boom
|079C28| LDX.b #$01
|079C2A| BRA .use_a_press

.cant_lift_sprite
|079C2C| JSR HandleLiftables

;---------------------------------------------------------------------------------------------------

.use_a_press
|079C2F| LDA.w AbilityChecks,X
|079C32| AND.l $7EF379
|079C36| BEQ .no_a_press

|079C38| STX.w $036C

|079C3B| TXA
|079C3C| ASL A
|079C3D| TAX

|079C3E| JSR .run_vector

;---------------------------------------------------------------------------------------------------

.handle_toss_and_grab
|079C41| LDA.w $036C
|079C44| STA.w $0306

|079C47| ASL A
|079C48| TAX

|079C49| JMP.w (HandleDO_vectors,X)

.no_a_press
|079C4C| STZ.b $3B

|079C4E| RTS

;---------------------------------------------------------------------------------------------------

.vectors
|079C4F| dw PerformDesertPrayer
|079C51| dw PerformThrow
|079C53| dw PerformDash
|079C55| dw PerformGrab
|079C57| dw PerformRead
|079C59| dw PerformOpenChest
|079C5B| dw PerformStatueDrag
|079C5D| dw PerformRupeePull

;---------------------------------------------------------------------------------------------------

.run_vector
|079C5F| JMP.w (.vectors,X)

;===================================================================================================

UNREACHABLE_079C62:
|079C62| RTS

;===================================================================================================

UNREACHABLE_079C63:
|079C63| db $00, $01, $01

;===================================================================================================

HandleSwordSFXAndBeam:
|079C66| LDA.b $67
|079C68| AND.b #$F0
|079C6A| STA.b $67

|079C6C| STZ.b $3C
|079C6E| STZ.b $79

|079C70| LDA.l $7EF36C
|079C74| SEC
|079C75| SBC.b #$04
|079C77| CMP.l $7EF36D
|079C7B| BCS .no_make_beam

|079C7D| LDA.l $7EF359
|079C81| INC A
|079C82| AND.b #$FE
|079C84| BEQ .no_make_beam

|079C86| LDA.l $7EF359
|079C8A| CMP.b #$02
|079C8C| BCC .no_make_beam

;---------------------------------------------------------------------------------------------------

|079C8E| LDX.b #$04

.next_slot
|079C90| LDA.w $0C4A,X
|079C93| CMP.b #$31 ; ANCILLA 31
|079C95| BEQ .no_make_beam

|079C97| DEX
|079C98| BPL .next_slot

;---------------------------------------------------------------------------------------------------

|079C9A| LDY.b #$00
|079C9C| JSL AncillaAdd_SwordBeam

.no_make_beam
|079CA0| JSL CalculateLinkSFXPan
|079CA4| PHA

|079CA5| LDA.l $7EF359
|079CA9| DEC A

|079CAA| TAX
|079CAB| PLA

|079CAC| CPX.b #$FE
|079CAE| BEQ .no_make_swing_sfx

|079CB0| CPX.b #$FF
|079CB2| BEQ .no_make_swing_sfx

|079CB4| ORA.w SwordSwingSFX,X
|079CB7| STA.w $012E

.no_make_swing_sfx
|079CBA| LDX.b #$01
|079CBC| STX.b $3D

;---------------------------------------------------------------------------------------------------

#EXIT_079CBE:
|079CBE| RTS

;===================================================================================================

SwordSwingTimers:
|079CBF| db $01, $00, $00, $00, $00, $03, $00, $00
|079CC7| db $01, $00, $03, $03, $03, $03, $04, $04
|079CCF| db $01, $05

;===================================================================================================

SwordSwingSFX:
|079CD1| db $01 ; SFX2.01
|079CD2| db $02 ; SFX2.02
|079CD3| db $03 ; SFX2.03
|079CD4| db $04 ; SFX2.04

;===================================================================================================

UNREACHABLE_079CD5:
|079CD5| db $00, $09, $12, $1B

;===================================================================================================

CheckForSwordSwing:
|079CD9| LDA.b $3B
|079CDB| AND.b #$10
|079CDD| BNE EXIT_079CBE

|079CDF| BIT.b $3A
|079CE1| BMI .pressing_b

|079CE3| BIT.b $F4
|079CE5| BPL EXIT_079CBE

|079CE7| LDX.b $6C
|079CE9| BEQ .not_in_door

|079CEB| JSR TileDetect_SwordSwingDeepInDoor

|079CEE| LDA.b $0E
|079CF0| AND.b #$30
|079CF2| EOR.b #$30
|079CF4| BEQ EXIT_079CBE

;---------------------------------------------------------------------------------------------------

.not_in_door
|079CF6| LDA.b #$80
|079CF8| TSB.b $3A

|079CFA| JSR HandleSwordSFXAndBeam

|079CFD| LDA.b #$01
|079CFF| TSB.b $50

|079D01| STZ.b $2E

;---------------------------------------------------------------------------------------------------

.pressing_b
|079D03| BIT.b $F0
|079D05| BMI .holding_b

|079D07| LDA.b #$01
|079D09| TSB.b $3A

.holding_b
|079D0B| JSR HaltLinkWhenUsingItems

|079D0E| LDA.b $67
|079D10| AND.b #$F0
|079D12| STA.b $67

|079D14| DEC.b $3D
|079D16| BPL .finish_up

;---------------------------------------------------------------------------------------------------

|079D18| INC.b $3C

|079D1A| LDA.b $3C
|079D1C| CMP.b #$09
|079D1E| BCS HandleSwordControls

|079D20| TAX

|079D21| LDA.w SwordSwingTimers,X
|079D24| STA.b $3D

|079D26| CPX.b #$05
|079D28| BNE .no_swing_sparkle

|079D2A| LDA.l $7EF359
|079D2E| BEQ .weak_or_no_sword

|079D30| CMP.b #$01
|079D32| BEQ .weak_or_no_sword

|079D34| CMP.b #$FF
|079D36| BEQ .weak_or_no_sword

|079D38| LDY.b #$04
|079D3A| LDA.b #$26 ; ANCILLA 26
|079D3C| JSL AncillaAdd_SwordSwingSparkle

;---------------------------------------------------------------------------------------------------

.weak_or_no_sword
|079D40| LDY.b #$01

|079D42| LDA.l $7EF359
|079D46| BEQ .finish_up

|079D48| CMP.b #$FF
|079D4A| BEQ .finish_up

|079D4C| CMP.b #$01
|079D4E| BEQ .fighter_sword

|079D50| LDY.b #$06

.fighter_sword
|079D52| JSR TileDetect_MainHandler

|079D55| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.no_swing_sparkle
|079D57| CPX.b #$04
|079D59| BCC .finish_up

|079D5B| LDA.b $3A
|079D5D| AND.b #$01
|079D5F| BEQ .finish_up

|079D61| BIT.b $F0
|079D63| BPL .finish_up

|079D65| LDA.b $3A
|079D67| AND.b #$FE
|079D69| STA.b $3A

|079D6B| BRL HandleSwordSFXAndBeam

;---------------------------------------------------------------------------------------------------

.finish_up
|079D6E| JSR CalculateSwordHitbox

|079D71| RTS

;===================================================================================================

HandleSwordControls:
|079D72| BIT.b $F0
|079D74| BMI .holding_b

|079D76| LDA.b $79
|079D78| CMP.b #$30
|079D7A| BCC ResetSwordAndItemUsage

|079D7C| JSR ResetSwordAndItemUsage

|079D7F| STZ.b $79

|079D81| BRL ActivateSpinAttack

;===================================================================================================

#ResetSwordAndItemUsage:
|079D84| STZ.b $5E

|079D86| LDA.b $48
|079D88| AND.b #$F6
|079D8A| STA.b $48

|079D8C| STZ.b $3D
|079D8E| STZ.b $3C

|079D90| LDA.b $3A
|079D92| AND.b #$7E
|079D94| STA.b $3A

|079D96| LDA.b $50
|079D98| AND.b #$FE
|079D9A| STA.b $50

|079D9C| BRL EXIT_079E62

;---------------------------------------------------------------------------------------------------

.holding_b
|079D9F| BIT.b $48
|079DA1| BMI .pushing_statue

|079DA3| LDA.b $48
|079DA5| AND.b #$09
|079DA7| BNE .pushing_possibly_against_a_door

.pushing_statue
|079DA9| LDA.b $47
|079DAB| BEQ .no_tink

|079DAD| CMP.b #$01
|079DAF| BEQ ResetSwordAndItemUsage

.pushing_possibly_against_a_door
|079DB1| LDA.b $3C
|079DB3| CMP.b #$09
|079DB5| BNE .not_in_strafe

|079DB7| LDX.b #$0A
|079DB9| STX.b $3C

|079DBB| LDA.w SwordSwingTimers,X
|079DBE| STA.b $3D

.not_in_strafe
|079DC0| DEC.b $3D
|079DC2| BPL .timer_running

|079DC4| LDA.b $3C
|079DC6| INC A
|079DC7| CMP.b #$0D
|079DC9| BNE .dont_tap_wall

|079DCB| LDA.l $7EF359
|079DCF| INC A
|079DD0| AND.b #$FE
|079DD2| BEQ .reset_poke_index

|079DD4| LDA.b $48
|079DD6| AND.b #$09
|079DD8| BEQ .reset_poke_index

|079DDA| LDY.b #$01
|079DDC| LDA.b #$1B ; ANCILLA 1B
|079DDE| JSL AncillaAdd_WallTapSpark

|079DE2| LDA.b $48
|079DE4| AND.b #$08
|079DE6| BNE .not_poking_door

|079DE8| LDA.b #$05 ; SFX2.05
|079DEA| JSR PlayLinkSFX2Panned

|079DED| BRA .detect_poked_tile

.not_poking_door
|079DEF| LDA.b #$06 ; SFX2.06
|079DF1| JSR PlayLinkSFX2Panned

.detect_poked_tile
|079DF4| LDY.b #$01
|079DF6| JSR TileDetect_MainHandler

.reset_poke_index
|079DF9| LDA.b #$0A

.dont_tap_wall
|079DFB| STA.b $3C

|079DFD| TAX

|079DFE| LDA.w SwordSwingTimers,X
|079E01| STA.b $3D

.timer_running
|079E03| BRA .do_hitbox

;---------------------------------------------------------------------------------------------------

.no_tink
|079E05| LDA.b #$09
|079E07| STA.b $3C

|079E09| LDA.b #$01
|079E0B| TSB.b $50

|079E0D| STZ.b $3D

|079E0F| LDA.b $5E
|079E11| CMP.b #$04
|079E13| BEQ .do_hitbox

|079E15| CMP.b #$10
|079E17| BEQ .do_hitbox

|079E19| LDA.b #$0C
|079E1B| STA.b $5E

|079E1D| LDA.l $7EF359
|079E21| INC A
|079E22| AND.b #$FE
|079E24| BEQ EXIT_079E62

;---------------------------------------------------------------------------------------------------

|079E26| LDX.b #$04

.look_for_byrna_spark
|079E28| LDA.w $0C4A,X
|079E2B| CMP.b #$30 ; ANCILLA 30
|079E2D| BEQ EXIT_079E62

|079E2F| CMP.b #$31 ; ANCILLA 31
|079E31| BEQ EXIT_079E62

|079E33| DEX
|079E34| BPL .look_for_byrna_spark

;---------------------------------------------------------------------------------------------------

|079E36| LDA.b $79
|079E38| CMP.b #$06
|079E3A| BCC .dont_add_charge_sparkle

|079E3C| LDA.b $1A
|079E3E| AND.b #$03
|079E40| BNE .dont_add_charge_sparkle

|079E42| JSL AncillaSpawn_SwordChargeSparkle

.dont_add_charge_sparkle
|079E46| LDA.b $79
|079E48| CMP.b #$40
|079E4A| BCS EXIT_079E62

|079E4C| INC.b $79

|079E4E| LDA.b $79
|079E50| CMP.b #$30
|079E52| BNE EXIT_079E62

|079E54| LDA.b #$37 ; SFX2.37
|079E56| JSR PlayLinkSFX2Panned

|079E59| JSL AncillaAdd_ChargedSpinAttackSparkle

|079E5D| BRA EXIT_079E62

.do_hitbox
|079E5F| JSR CalculateSwordHitbox

;---------------------------------------------------------------------------------------------------

#EXIT_079E62:
|079E62| RTS

;===================================================================================================

CalculateSwordHitbox:
|079E63| LDA.l $7EF359
|079E67| BEQ EXIT_079E62

|079E69| CMP.b #$FF
|079E6B| BEQ EXIT_079E62

|079E6D| CMP.b #$02
|079E6F| BCS .not_fighter_sword

;===================================================================================================

.set_sword_hitbox_offsets
|079E71| LDY.b #$27

|079E73| LDA.b $3C
|079E75| STA.b $02
|079E77| STZ.b $03

|079E79| CMP.b #$09
|079E7B| BEQ EXIT_079E62
|079E7D| BCC .slashing

|079E7F| LDA.b $02
|079E81| SEC
|079E82| SBC.b #$0A
|079E84| STA.b $02

|079E86| LDY.b #$03

;---------------------------------------------------------------------------------------------------

.slashing
|079E88| REP #$30

|079E8A| LDA.b $2F
|079E8C| AND.w #$00FF
|079E8F| TAX

|079E90| LDA.l LinkAnimationDirectionToTableOffset,X
|079E94| STA.b $04

|079E96| TYA
|079E97| AND.w #$00FF
|079E9A| ASL A
|079E9B| CLC
|079E9C| ADC.b $04
|079E9E| TAX

|079E9F| LDA.l LinkAnimationDataOffsets,X
|079EA3| CLC
|079EA4| ADC.b $02
|079EA6| TAX

|079EA7| SEP #$20

|079EA9| LDA.l AttackHitboxY,X
|079EAD| STA.b $44

|079EAF| LDA.l AttackHitboxX,X
|079EB3| STA.b $45

|079EB5| SEP #$10

|079EB7| RTS

;---------------------------------------------------------------------------------------------------

.not_fighter_sword
|079EB8| LDA.b $3C
|079EBA| CMP.b #$09
|079EBC| BCS .set_sword_hitbox_offsets

|079EBE| ASL A
|079EBF| STA.b $04

|079EC1| LDA.b $2F
|079EC3| LSR A
|079EC4| STA.b $0E

|079EC6| ASL A
|079EC7| ASL A
|079EC8| ASL A

|079EC9| CLC
|079ECA| ADC.b $0E

|079ECC| ASL A
|079ECD| CLC
|079ECE| ADC.b $04
|079ED0| TAX

|079ED1| LDA.l SwordSwingTipTile,X
|079ED5| CMP.b #$FF
|079ED7| BEQ .no_hitbox

|079ED9| TXA
|079EDA| LSR A
|079EDB| TAX

|079EDC| LDA.l SwordSwingTipOffsetY,X
|079EE0| STA.b $44

|079EE2| LDA.l SwordSwingTipOffsetX,X
|079EE6| STA.b $45

;---------------------------------------------------------------------------------------------------

#EXIT_079EE8:
|079EE8| RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
|079EE9| BRL .set_sword_hitbox_offsets

;===================================================================================================

RodAndCaneAnimationTimer:
|079EEC| db $03, $03, $05

;===================================================================================================

LinkItem_Rod:
|079EEF| BIT.b $3A
|079EF1| BVS .in_action

|079EF3| LDA.b $6C
|079EF5| BNE EXIT_079EE8

|079EF7| JSR TestYButton
|079EFA| BCC EXIT_079EE8

|079EFC| LDX.b #$00
|079EFE| JSR CheckMagicCost
|079F01| BCC .lacking_magic

|079F03| LDA.w $020B
|079F06| BNE .lacking_magic

|079F08| LDA.b #$01
|079F0A| STA.w $0350

|079F0D| JSR CreateRodShot

|079F10| LDA.w RodAndCaneAnimationTimer
|079F13| STA.b $3D

|079F15| STZ.b $2E

|079F17| STZ.w $0300
|079F1A| STZ.w $0301

|079F1D| LDA.b #$01
|079F1F| TSB.w $0301

;---------------------------------------------------------------------------------------------------

.in_action
|079F22| JSR HaltLinkWhenUsingItems

|079F25| LDA.b $67
|079F27| AND.b #$F0
|079F29| STA.b $67

|079F2B| DEC.b $3D
|079F2D| BPL EXIT_079F58

|079F2F| LDA.w $0300
|079F32| INC A
|079F33| STA.w $0300

|079F36| TAX

|079F37| LDA.w RodAndCaneAnimationTimer,X
|079F3A| STA.b $3D

|079F3C| CPX.b #$03
|079F3E| BNE EXIT_079F58

|079F40| STZ.b $5E
|079F42| STZ.w $0300
|079F45| STZ.b $3D
|079F47| STZ.w $0350

|079F4A| LDA.w $0301
|079F4D| AND.b #$FE
|079F4F| STA.w $0301

;---------------------------------------------------------------------------------------------------

.lacking_magic
|079F52| LDA.b $3A
|079F54| AND.b #$BF
|079F56| STA.b $3A

;---------------------------------------------------------------------------------------------------

#EXIT_079F58:
|079F58| RTS

;===================================================================================================

pool CreateRodShot

.vectors
|079F59| dw CreateFireShot
|079F5B| dw CreateIceShot

endpool

;---------------------------------------------------------------------------------------------------

CreateRodShot:
|079F5D| LDA.w $0307
|079F60| DEC A
|079F61| ASL A
|079F62| TAX

|079F63| JMP.w (.vectors,X)

;===================================================================================================

CreateIceShot:
|079F66| LDA.b #$0B ; ANCILLA 0B
|079F68| LDY.b #$01
|079F6A| JSL AncillaAdd_IceRodShot

|079F6E| RTS

;===================================================================================================

CreateFireShot:
|079F6F| LDA.b #$02 ; ANCILLA 02
|079F71| LDY.b #$01
|079F73| JSL AncillaAdd_FireRodShot

|079F77| RTS

;===================================================================================================

pool LinkItem_Hammer

.timers
|079F78| db  3,  3, 16

endpool

;---------------------------------------------------------------------------------------------------

LinkItem_Hammer:
|079F7B| LDA.w $0301
|079F7E| AND.b #$10
|079F80| BNE .bounce_to_exit

|079F82| BIT.b $3A
|079F84| BVS .in_action

|079F86| LDA.b $6C
|079F88| BNE .bounce_to_exit

|079F8A| JSR TestYButton_unfiltered
|079F8D| BCS .pressed_y

.bounce_to_exit
|079F8F| BRL EXIT_079F58

;---------------------------------------------------------------------------------------------------

.pressed_y
|079F92| LDA.w .timers
|079F95| STA.b $3D

|079F97| LDA.b #$01
|079F99| TSB.b $50

|079F9B| STZ.b $2E

|079F9D| LDA.w $0301
|079FA0| AND.b #$00
|079FA2| ORA.b #$02
|079FA4| STA.w $0301

|079FA7| STZ.w $0300

.in_action
|079FAA| JSR HaltLinkWhenUsingItems

|079FAD| LDA.b $67
|079FAF| AND.b #$F0
|079FB1| STA.b $67

|079FB3| DEC.b $3D
|079FB5| BPL EXIT_07A002

|079FB7| LDA.w $0300
|079FBA| INC A
|079FBB| STA.w $0300

|079FBE| TAX

|079FBF| LDA.w .timers,X
|079FC2| STA.b $3D

|079FC4| CPX.b #$01
|079FC6| BNE .no_impact_yet

;---------------------------------------------------------------------------------------------------

|079FC8| PHX

|079FC9| LDY.b #$03
|079FCB| JSR TileDetect_MainHandler

|079FCE| LDY.b #$00
|079FD0| LDA.b #$16 ; ANCILLA 16
|079FD2| JSL Ancilla_AddHitStars

|079FD6| PLX

|079FD7| LDA.w $012E
|079FDA| BNE .no_impact_yet

|079FDC| LDA.b #$10 ; SFX2.10
|079FDE| JSR PlayLinkSFX2Panned

|079FE1| JSL SpawnHammeredSplash

;---------------------------------------------------------------------------------------------------

.no_impact_yet
|079FE5| CPX.b #$03
|079FE7| BNE EXIT_07A002

|079FE9| STZ.w $0300
|079FEC| STZ.b $3D

|079FEE| LDA.b $3A
|079FF0| AND.b #$BF
|079FF2| STA.b $3A

|079FF4| LDA.b $50
|079FF6| AND.b #$FE
|079FF8| STA.b $50

|079FFA| LDA.w $0301
|079FFD| AND.b #$FD
|079FFF| STA.w $0301

;---------------------------------------------------------------------------------------------------

#EXIT_07A002:
|07A002| RTS

;===================================================================================================

pool LinkItem_Bow

.timer
|07A003| db $03, $03, $08

endpool

;---------------------------------------------------------------------------------------------------

LinkItem_Bow:
|07A006| BIT.b $3A
|07A008| BVS .in_action

|07A00A| LDA.b $6C
|07A00C| BNE EXIT_07A002

|07A00E| JSR TestYButton
|07A011| BCC EXIT_07A002

|07A013| LDA.b #$01
|07A015| TSB.b $50

|07A017| LDA.w .timer
|07A01A| STA.b $3D

|07A01C| STZ.b $2E
|07A01E| STZ.w $0300

|07A021| LDA.w $0301
|07A024| AND.b #$00
|07A026| ORA.b #$10
|07A028| STA.w $0301

;---------------------------------------------------------------------------------------------------

.in_action
|07A02B| JSR HaltLinkWhenUsingItems

|07A02E| LDA.b $67
|07A030| AND.b #$F0
|07A032| STA.b $67

|07A034| DEC.b $3D
|07A036| BPL EXIT_07A002

;---------------------------------------------------------------------------------------------------

|07A038| LDA.w $0300
|07A03B| INC A
|07A03C| STA.w $0300

|07A03F| TAX

|07A040| LDA.w .timer,X
|07A043| STA.b $3D

|07A045| CPX.b #$03
|07A047| BNE EXIT_07A0BA

|07A049| LDA.b $20
|07A04B| STA.b $72

|07A04D| LDA.b $21
|07A04F| STA.b $73

|07A051| LDA.b $22
|07A053| STA.b $74

|07A055| LDA.b $23
|07A057| STA.b $75

|07A059| LDX.b $2F

|07A05B| LDY.b #$02
|07A05D| LDA.b #$09 ; ANCILLA 09
|07A05F| JSL AncillaAdd_Arrow
|07A063| BCC .arrow_handled

;---------------------------------------------------------------------------------------------------

|07A065| LDA.w $0B99
|07A068| BEQ .not_using_credits

|07A06A| DEC.w $0B99

|07A06D| LDA.l $7EF377
|07A071| INC A
|07A072| INC A
|07A073| STA.l $7EF377

.not_using_credits
|07A077| LDA.w $0B9A
|07A07A| BNE .delete_arrow

|07A07C| LDA.l $7EF377
|07A080| BEQ .delete_arrow

|07A082| DEC A
|07A083| STA.l $7EF377
|07A087| BNE .arrow_handled

|07A089| JSL RefreshItemIcon

|07A08D| BRA .arrow_handled

;---------------------------------------------------------------------------------------------------

.delete_arrow
|07A08F| STZ.w $0C4A,X

|07A092| LDA.b #$3C ; SFX2.3C
|07A094| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.arrow_handled
|07A097| STZ.w $0300
|07A09A| STZ.b $3D

|07A09C| LDA.b $3A
|07A09E| AND.b #$BF
|07A0A0| STA.b $3A

|07A0A2| LDA.b $50
|07A0A4| AND.b #$FE
|07A0A6| STA.b $50

|07A0A8| LDA.w $0301
|07A0AB| AND.b #$EF
|07A0AD| STA.w $0301

|07A0B0| LDA.b $3C
|07A0B2| CMP.b #$09
|07A0B4| BCC EXIT_07A0BA

|07A0B6| LDA.b #$09
|07A0B8| STA.b $3C

;---------------------------------------------------------------------------------------------------

#EXIT_07A0BA:
|07A0BA| RTS

;===================================================================================================

LinkItem_Boomerang:
|07A0BB| BIT.b $3A
|07A0BD| BVS .in_action

|07A0BF| LDA.b $6C
|07A0C1| BNE EXIT_07A0BA

|07A0C3| JSR TestYButton
|07A0C6| BCC .exit

|07A0C8| LDA.w $035F
|07A0CB| BNE .exit

|07A0CD| STZ.b $2E

|07A0CF| LDA.w $0301
|07A0D2| AND.b #$00
|07A0D4| ORA.b #$80
|07A0D6| STA.w $0301

|07A0D9| STZ.w $0300

|07A0DC| LDA.b #$07
|07A0DE| STA.b $3D

|07A0E0| LDY.b #$00
|07A0E2| LDA.b #$05 ; ANCILLA 05
|07A0E4| JSL AncillaAdd_Boomerang

|07A0E8| LDA.b $3C
|07A0EA| CMP.b #$09
|07A0EC| BCS ResetBoomerangYStuff

|07A0EE| LDA.b $72
|07A0F0| BNE .in_action

|07A0F2| LDA.b $F0
|07A0F4| AND.b #$0F
|07A0F6| STA.b $26

|07A0F8| BRA .continue

;---------------------------------------------------------------------------------------------------

.in_action
|07A0FA| LDA.b #$01
|07A0FC| TSB.b $50

.continue
|07A0FE| LDA.w $0301
|07A101| BEQ ResetBoomerangYStuff

|07A103| JSR HaltLinkWhenUsingItems

|07A106| LDA.b $67
|07A108| AND.b #$F0
|07A10A| STA.b $67

|07A10C| DEC.b $3D
|07A10E| BPL .exit

|07A110| LDA.b #$05
|07A112| STA.b $3D

|07A114| LDA.w $0300
|07A117| INC A
|07A118| STA.w $0300

|07A11B| CMP.b #$02
|07A11D| BNE .exit

;===================================================================================================

#ResetBoomerangYStuff:
|07A11F| STZ.w $0301
|07A122| STZ.w $0300

|07A125| STZ.b $3D

|07A127| LDA.b $3A
|07A129| AND.b #$BF
|07A12B| STA.b $3A

|07A12D| AND.b #$80
|07A12F| BNE .exit

|07A131| LDA.b $50
|07A133| AND.b #$FE
|07A135| STA.b $50

.exit
|07A137| RTS

;===================================================================================================

LinkItem_Bombs:
|07A138| LDA.b $6C
|07A13A| BNE EXIT_07A15A

|07A13C| LDA.l $7EF3CC
|07A140| CMP.b #$0D ; FOLLOWER 0D
|07A142| BEQ EXIT_07A15A

|07A144| JSR TestYButton
|07A147| BCC EXIT_07A15A

|07A149| LDA.b $3A
|07A14B| AND.b #$BF
|07A14D| STA.b $3A

|07A14F| LDY.b #$01
|07A151| LDA.b #$07 ; ANCILLA 07
|07A153| JSL AncillaAdd_Bomb

|07A157| STZ.w $0301

;---------------------------------------------------------------------------------------------------

#EXIT_07A15A:
|07A15A| RTS

;===================================================================================================

LinkItem_Bottle:
|07A15B| JSR TestYButton
|07A15E| BCC EXIT_07A15A

|07A160| LDA.b $3A
|07A162| AND.b #$BF
|07A164| STA.b $3A

|07A166| LDA.l $7EF34F
|07A16A| DEC A
|07A16B| TAX

|07A16C| LDA.l $7EF35C,X
|07A170| BEQ EXIT_07A15A

|07A172| CMP.b #$03
|07A174| BCC LinkItem_UselessBottle

|07A176| CMP.b #$03
|07A178| BEQ LinkItem_RedPotion

|07A17A| CMP.b #$04
|07A17C| BEQ LinkItem_GreenPotion

|07A17E| CMP.b #$05
|07A180| BEQ LinkItem_BluePotion

|07A182| CMP.b #$06
|07A184| BEQ .fairy

|07A186| BRL LinkItem_BeeBottle

.fairy
|07A189| BRL LinkItem_FairyBottle

;===================================================================================================

LinkItem_RedPotion:
|07A18C| LDA.l $7EF36C
|07A190| CMP.l $7EF36D
|07A194| BNE .can_drink

;===================================================================================================

#LinkItem_UselessBottle:
|07A196| BRL LinkGoBeep

;===================================================================================================

.can_drink
|07A199| LDA.b #$02
|07A19B| STA.l $7EF35C,X

|07A19F| STZ.w $0301

|07A1A2| LDA.b #$04
|07A1A4| STA.b $11

|07A1A6| LDA.b $10
|07A1A8| STA.w $010C

|07A1AB| LDA.b #$0E
|07A1AD| STA.b $10

|07A1AF| LDA.b #$07
|07A1B1| STA.w $0208

|07A1B4| JSL RebuildHUD_long

|07A1B8| RTS

;===================================================================================================

LinkItem_GreenPotion:
|07A1B9| LDA.l $7EF36E
|07A1BD| CMP.b #$80
|07A1BF| BNE .can_drink

|07A1C1| BRL LinkGoBeep

.can_drink
|07A1C4| LDA.b #$02
|07A1C6| STA.l $7EF35C,X

|07A1CA| STZ.w $0301

|07A1CD| LDA.b #$08
|07A1CF| STA.b $11

|07A1D1| LDA.b $10
|07A1D3| STA.w $010C

|07A1D6| LDA.b #$0E
|07A1D8| STA.b $10

|07A1DA| LDA.b #$07
|07A1DC| STA.w $0208

|07A1DF| JSL RebuildHUD_long

|07A1E3| BRA EXIT_07A239

;===================================================================================================

LinkItem_BluePotion:
|07A1E5| LDA.l $7EF36C
|07A1E9| CMP.l $7EF36D
|07A1ED| BNE .can_drink

|07A1EF| LDA.l $7EF36E
|07A1F3| CMP.b #$80
|07A1F5| BNE .can_drink

|07A1F7| BRL LinkGoBeep

.can_drink
|07A1FA| LDA.b #$02
|07A1FC| STA.l $7EF35C,X

|07A200| STZ.w $0301

|07A203| LDA.b #$09
|07A205| STA.b $11

|07A207| LDA.b $10
|07A209| STA.w $010C

|07A20C| LDA.b #$0E
|07A20E| STA.b $10

|07A210| LDA.b #$07
|07A212| STA.w $0208

|07A215| JSL RebuildHUD_long

|07A219| BRA EXIT_07A239

;===================================================================================================

LinkItem_FairyBottle:
|07A21B| STZ.w $0301

|07A21E| JSL ReleaseFairy
|07A222| BPL .released

|07A224| BRL LinkGoBeep

.released
|07A227| LDA.b #$02
|07A229| STA.l $7EF35C,X

|07A22D| JSL RebuildHUD_long

|07A231| BRA EXIT_07A239

;===================================================================================================

LinkItem_BeeBottle:
|07A233| STZ.w $0301

|07A236| JSL ReleaseBeeFromBottle
|07A23A| BPL .released

|07A23C| BRL LinkGoBeep

.released
|07A23F| LDA.b #$02
|07A241| STA.l $7EF35C,X

|07A245| JSL RebuildHUD_long

;---------------------------------------------------------------------------------------------------

#EXIT_07A239:
|07A249| RTS

;===================================================================================================

UNREACHABLE_07A24A:
|07A24A| CLC
|07A24B| BPL LinkItem_Lamp

;===================================================================================================

LinkItem_Lamp:
|07A24D| LDA.b $6C
|07A24F| BNE EXIT_07A288

|07A251| JSR TestYButton
|07A254| BCC EXIT_07A288

|07A256| LDA.l $7EF34A
|07A25A| BEQ .no_magic

|07A25C| LDX.b #$06
|07A25E| JSR CheckMagicCost
|07A261| BCC .no_magic

|07A263| LDY.b #$00
|07A265| LDA.b #$1A ; ANCILLA 1A
|07A267| JSL AncillaAdd_MagicPowder

|07A26B| JSL LightTorch

|07A26F| LDY.b #$02
|07A271| LDA.b #$2F ; ANCILLA 2F
|07A273| JSL AncillaAdd_LampFlame

.no_magic
|07A277| STZ.w $0301
|07A27A| STZ.b $3A
|07A27C| STZ.b $3C
|07A27E| STZ.b $50

|07A280| LDA.b $3C
|07A282| CMP.b #$09
|07A284| BNE EXIT_07A288

|07A286| STZ.b $5E

;---------------------------------------------------------------------------------------------------

#EXIT_07A288:
|07A288| RTS

;===================================================================================================

pool LinkItem_Powder

.timer
|07A289| db $02, $01, $01, $03
|07A28D| db $02, $02, $02, $02
|07A291| db $06, $00

endpool

;---------------------------------------------------------------------------------------------------

LinkItem_Powder:
|07A293| BIT.b $3A
|07A295| BVS .in_use

|07A297| LDA.b $6C
|07A299| BNE EXIT_07A288

|07A29B| JSR TestYButton
|07A29E| BCC EXIT_07A312

|07A2A0| LDA.l $7EF344
|07A2A4| CMP.b #$02
|07A2A6| BEQ .is_powder

|07A2A8| LDA.b #$3C ; SFX2.3C
|07A2AA| JSR PlayLinkSFX2Panned

|07A2AD| BRA .no_tile_detect

;---------------------------------------------------------------------------------------------------

.is_powder
|07A2AF| LDX.b #$02
|07A2B1| JSR CheckMagicCost
|07A2B4| BCC .no_tile_detect

|07A2B6| LDA.w .timer
|07A2B9| STA.b $3D

|07A2BB| STZ.w $0300
|07A2BE| STZ.b $2E

|07A2C0| LDA.b $67
|07A2C2| AND.b #$F0
|07A2C4| STA.b $67

|07A2C6| STZ.w $0301

|07A2C9| LDA.b #$40
|07A2CB| TSB.w $0301

;---------------------------------------------------------------------------------------------------

.in_use
|07A2CE| STZ.b $30
|07A2D0| STZ.b $31

|07A2D2| STZ.b $67

|07A2D4| STZ.b $2A
|07A2D6| STZ.b $2B

|07A2D8| STZ.b $6B

|07A2DA| DEC.b $3D
|07A2DC| BPL EXIT_07A312

|07A2DE| LDA.w $0300
|07A2E1| INC A
|07A2E2| STA.w $0300

|07A2E5| TAX
|07A2E6| LDA.w .timer,X
|07A2E9| STA.b $3D

|07A2EB| CPX.b #$04
|07A2ED| BNE .dont_make_powder

|07A2EF| LDY.b #$00
|07A2F1| LDA.b #$1A ; ANCILLA 1A
|07A2F3| JSL AncillaAdd_MagicPowder

.dont_make_powder
|07A2F7| CPX.b #$09
|07A2F9| BNE EXIT_07A312

|07A2FB| LDA.b $11
|07A2FD| BNE .no_tile_detect

|07A2FF| LDY.b #$01
|07A301| JSR TileDetect_MainHandler
|07A304| BRA .no_tile_detect

.no_tile_detect
|07A306| STZ.w $0301
|07A309| STZ.w $0300

|07A30C| LDA.b $3A
|07A30E| AND.b #$BF
|07A310| STA.b $3A

;---------------------------------------------------------------------------------------------------

#EXIT_07A312:
|07A312| RTS

;===================================================================================================

LinkItem_ShovelAndFlute:
|07A313| LDA.l $7EF34C
|07A317| BEQ EXIT_07A312

|07A319| CMP.b #$01
|07A31B| BEQ LinkItem_Shovel

|07A31D| BRL LinkItem_Flute

;===================================================================================================

pool LinkItem_Shovel

.timer
|07A320| db   7,  18,  16
|07A323| db   7,  18,  16

.pose
|07A326| db $00, $01, $02
|07A329| db $00, $01, $02

endpool

;---------------------------------------------------------------------------------------------------

LinkItem_Shovel:
|07A32C| BIT.b $3A
|07A32E| BVS .in_use

|07A330| LDA.b $6C
|07A332| BNE EXIT_07A312

|07A334| JSR TestYButton
|07A337| BCC EXIT_07A312

|07A339| LDA.w .timer
|07A33C| STA.b $3D

|07A33E| STZ.w $030D
|07A341| STZ.w $0300

|07A344| LDA.b #$01
|07A346| STA.w $037A

|07A349| LDA.b #$01
|07A34B| TSB.b $50

|07A34D| STZ.b $2E

;===================================================================================================

.in_use
|07A34F| JSR HaltLinkWhenUsingItems

|07A352| LDA.b $67
|07A354| AND.b #$F0
|07A356| STA.b $67

|07A358| DEC.b $3D
|07A35A| BMI .continue

|07A35C| RTS

;---------------------------------------------------------------------------------------------------

.continue
|07A35D| LDX.w $030D
|07A360| INX
|07A361| STX.w $030D

|07A364| LDA.w .timer,X
|07A367| STA.b $3D

|07A369| LDA.w .pose,X
|07A36C| STA.w $0300

|07A36F| CMP.b #$01
|07A371| BNE .finish_up

;---------------------------------------------------------------------------------------------------

|07A373| LDY.b #$02

|07A375| PHX

|07A376| JSR TileDetect_MainHandler

|07A379| PLX

|07A37A| LDA.w $04B2
|07A37D| BEQ .not_flute_spot

|07A37F| LDA.b #$1B ; SFX3.1B
|07A381| JSR PlayLinkSFX3Panned

|07A384| PHX

|07A385| LDY.b #$00
|07A387| LDA.b #$36 ; ANCILLA 36
|07A389| JSL AncillaAdd_DugUpFlute

|07A38D| PLX

;---------------------------------------------------------------------------------------------------

.not_flute_spot
|07A38E| LDA.w $0357
|07A391| ORA.w $035B
|07A394| AND.b #$01
|07A396| BNE .dont_clink

|07A398| PHX

|07A399| LDY.b #$00
|07A39B| LDA.b #$16 ; ANCILLA 16
|07A39D| JSL Ancilla_AddHitStars

|07A3A1| PLX

|07A3A2| LDA.b #$05 ; SFX2.05
|07A3A4| JSR PlayLinkSFX2Panned

|07A3A7| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.dont_clink
|07A3A9| PHX

|07A3AA| LDY.b #$00
|07A3AC| LDA.b #$17 ; ANCILLA 17
|07A3AE| JSL AncillaAdd_ShovelDirt

|07A3B2| LDA.w $03FC
|07A3B5| BEQ .not_dig_game

|07A3B7| JSL SpawnDiggingGamePrize

.not_dig_game
|07A3BB| PLX

|07A3BC| LDA.b #$12 ; SFX2.12
|07A3BE| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.finish_up
|07A3C1| CPX.b #$03
|07A3C3| BNE EXIT_07A3DA

|07A3C5| STZ.w $030D
|07A3C8| STZ.w $0300

|07A3CB| LDA.b $3A
|07A3CD| AND.b #$80
|07A3CF| STA.b $3A

|07A3D1| STZ.w $037A

|07A3D4| LDA.b $50
|07A3D6| AND.b #$FE
|07A3D8| STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07A3DA:
|07A3DA| RTS

;===================================================================================================

LinkItem_Flute:
|07A3DB| BIT.b $3A
|07A3DD| BVC .can_use

|07A3DF| DEC.w $03F0

|07A3E2| LDA.w $03F0
|07A3E5| BNE EXIT_07A3DA

|07A3E7| LDA.b $3A
|07A3E9| AND.b #$BF
|07A3EB| STA.b $3A

;---------------------------------------------------------------------------------------------------

.can_use
|07A3ED| JSR TestYButton
|07A3F0| BCC EXIT_07A3DA

|07A3F2| LDA.b #$80
|07A3F4| STA.w $03F0

|07A3F7| LDA.b #$13 ; SFX2.13
|07A3F9| JSR PlayLinkSFX2Panned

|07A3FC| LDA.b $1B
|07A3FE| BNE EXIT_07A3DA

|07A400| LDA.b $8A
|07A402| AND.b #$40
|07A404| BNE EXIT_07A3DA

|07A406| LDA.b $10
|07A408| CMP.b #$0B
|07A40A| BEQ EXIT_07A3DA

;---------------------------------------------------------------------------------------------------

|07A40C| LDX.b #$04

.look_for_duck
|07A40E| LDA.w $0C4A,X
|07A411| CMP.b #$27 ; ANCILLA 27
|07A413| BEQ EXIT_07A3DA

|07A415| DEX
|07A416| BPL .look_for_duck

|07A418| LDA.l $7EF34C
|07A41C| CMP.b #$02
|07A41E| BNE .have_activated_flute

;---------------------------------------------------------------------------------------------------

|07A420| REP #$20

|07A422| LDA.b $8A
|07A424| CMP.w #$0018 ; OW 18
|07A427| BNE .dont_blow_up_weathervane

|07A429| LDA.b $20
|07A42B| CMP.w #$0760
|07A42E| BCC .dont_blow_up_weathervane

|07A430| CMP.w #$07E0
|07A433| BCS .dont_blow_up_weathervane

|07A435| LDA.b $22
|07A437| CMP.w #$01CF
|07A43A| BCC .dont_blow_up_weathervane

|07A43C| CMP.w #$0230
|07A43F| BCS .dont_blow_up_weathervane

|07A441| SEP #$20

|07A443| LDA.b #$2D
|07A445| STA.b $11

|07A447| LDY.b #$00
|07A449| LDA.b #$37 ; ANCILLA 37
|07A44B| JSL AncillaAdd_ExplodingWeatherVane

.dont_blow_up_weathervane
|07A44F| SEP #$20

|07A451| BRA EXIT_07A45E

;---------------------------------------------------------------------------------------------------

.have_activated_flute
|07A453| LDY.b #$04
|07A455| LDA.b #$27 ; ANCILLA 27
|07A457| JSL AncillaAdd_Duck_take_off

|07A45B| STZ.w $03F8

;---------------------------------------------------------------------------------------------------

#EXIT_07A45E:
|07A45E| RTS

;===================================================================================================

CallForDuckIndoors:
|07A45F| PHB
|07A460| PHK
|07A461| PLB

|07A462| LDA.b #$13 ; SFX2.13
|07A464| JSR PlayLinkSFX2Panned

|07A467| LDY.b #$04
|07A469| LDA.b #$27 ; ANCILLA 27
|07A46B| JSL AncillaAdd_Duck_take_off

|07A46F| PLB

|07A470| RTL

;===================================================================================================

LinkItem_Book:
|07A471| BIT.b $3A
|07A473| BVS .exit

|07A475| LDA.b $6C
|07A477| BNE EXIT_07A45E

|07A479| JSR TestYButton
|07A47C| BCC .exit

|07A47E| LDA.b $3A
|07A480| AND.b #$BF
|07A482| STA.b $3A

|07A484| LDA.w $02ED
|07A487| BNE .do_prayer

|07A489| LDA.b #$3C ; SFX2.3C
|07A48B| JSR PlayLinkSFX2Panned

|07A48E| BRA .exit

;---------------------------------------------------------------------------------------------------

.do_prayer
|07A490| BRL PerformDesertPrayer

.exit
|07A493| RTS

;===================================================================================================

LinkItem_Ether:
|07A494| JSR TestYButton
|07A497| BCC .exit

|07A499| LDA.b $3A
|07A49B| AND.b #$BF
|07A49D| STA.b $3A

|07A49F| LDA.b $6C
|07A4A1| BNE .cannot_ether

|07A4A3| LDA.w $0FFC
|07A4A6| BNE .cannot_ether

|07A4A8| LDA.w $0403
|07A4AB| AND.b #$80
|07A4AD| BNE .cannot_ether

|07A4AF| LDA.l $7EF359
|07A4B3| INC A
|07A4B4| AND.b #$FE
|07A4B6| BEQ .cannot_ether

|07A4B8| LDA.l $7EF3D3
|07A4BC| BEQ .allow_ether

|07A4BE| LDA.l $7EF3CC
|07A4C2| CMP.b #$0D ; FOLLOWER 0D
|07A4C4| BNE .allow_ether

.cannot_ether
|07A4C6| BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_ether
|07A4C9| LDA.w $0C4A
|07A4CC| ORA.w $0C4B
|07A4CF| ORA.w $0C4C
|07A4D2| BNE .exit

|07A4D4| LDX.b #$01
|07A4D6| JSR CheckMagicCost
|07A4D9| BCC .exit

|07A4DB| LDA.b #$08 ; LINKSTATE 08
|07A4DD| STA.b $5D

|07A4DF| LDA.b #$01
|07A4E1| TSB.b $50

|07A4E3| LDA.w .anim_timer
|07A4E6| STA.b $3D

|07A4E8| STZ.w $031C
|07A4EB| STZ.w $031D
|07A4EE| STZ.w $0324

|07A4F1| LDA.b #$23 ; SFX3.23
|07A4F3| JSR PlayLinkSFX3Panned

.exit
|07A4F6| RTS

;===================================================================================================

pool LinkItem_Ether LinkState_UsingEther

.anim_step
|07A4F7| db $00, $01, $02, $03
|07A4FB| db $00, $01, $02, $03
|07A4FF| db $04, $05, $06, $07

.anim_timer
|07A503| db   5,   5,   5,   5
|07A507| db   5,   5,   5,   5
|07A50B| db   7,   7,   3,   3

endpool

;---------------------------------------------------------------------------------------------------

LinkState_UsingEther:
|07A50F| INC.w $0FC1

|07A512| DEC.b $3D
|07A514| BPL .exit

|07A516| INC.w $031D

|07A519| LDX.w $031D

|07A51C| CPX.b #$0B
|07A51E| BNE .not_last_step

|07A520| LDX.b #$0B
|07A522| BRA .continue

;---------------------------------------------------------------------------------------------------

.not_last_step
|07A524| CPX.b #$04
|07A526| BNE .skip_swish_sfx

|07A528| PHX

|07A529| LDA.b #$23 ; SFX3.23
|07A52B| JSR PlayLinkSFX3Panned

|07A52E| PLX

.skip_swish_sfx
|07A52F| CPX.b #$09
|07A531| BNE .skip_ding_sfx

|07A533| LDA.b #$2C ; SFX2.2C
|07A535| JSR PlayLinkSFX2Panned

.skip_ding_sfx
|07A538| CPX.b #$0C
|07A53A| BNE .continue

|07A53C| LDA.b #$0A
|07A53E| STA.w $031D

|07A541| TAX

;---------------------------------------------------------------------------------------------------

.continue
|07A542| LDA.w .anim_timer,X
|07A545| STA.b $3D

|07A547| LDA.w .anim_step,X
|07A54A| STA.w $031C

|07A54D| LDA.w $0324
|07A550| BNE .exit

|07A552| CPX.b #$0A
|07A554| BNE .exit

|07A556| LDA.b #$01
|07A558| STA.w $0324

|07A55B| LDY.b #$00
|07A55D| LDA.b #$18 ; ANCILLA 18
|07A55F| JSL AncillaAdd_EtherSpell

|07A563| STZ.b $4D
|07A565| STZ.w $0046

.exit
|07A568| RTS

;===================================================================================================

LinkItem_Bombos:
|07A569| JSR TestYButton
|07A56C| BCC .exit

|07A56E| LDA.b $3A
|07A570| AND.b #$BF
|07A572| STA.b $3A

|07A574| LDA.b $6C
|07A576| BNE .cannot_bombos

|07A578| LDA.w $0FFC
|07A57B| BNE .cannot_bombos

|07A57D| LDA.w $0403
|07A580| AND.b #$80
|07A582| BNE .cannot_bombos

|07A584| LDA.l $7EF359
|07A588| INC A
|07A589| AND.b #$FE
|07A58B| BEQ .cannot_bombos

|07A58D| LDA.l $7EF3D3
|07A591| BEQ .allow_bombos

|07A593| LDA.l $7EF3CC
|07A597| CMP.b #$0D ; FOLLOWER 0D
|07A599| BNE .allow_bombos

.cannot_bombos
|07A59B| BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_bombos
|07A59E| LDA.w $0C4A
|07A5A1| ORA.w $0C4B
|07A5A4| ORA.w $0C4C
|07A5A7| BNE .exit

|07A5A9| LDX.b #$01
|07A5AB| JSR CheckMagicCost
|07A5AE| BCC .exit

|07A5B0| LDA.b #$09 ; LINKSTATE 09
|07A5B2| STA.b $5D

|07A5B4| LDA.b #$01
|07A5B6| TSB.b $50

|07A5B8| LDA.w .anim_timer
|07A5BB| STA.b $3D

|07A5BD| LDA.w .anim_step
|07A5C0| STA.w $031C
|07A5C3| STZ.w $031D

|07A5C6| STZ.w $0324

|07A5C9| LDA.b #$23 ; SFX3.23
|07A5CB| JSR PlayLinkSFX3Panned

.exit
|07A5CE| RTS

;===================================================================================================

pool LinkItem_Bombos LinkState_UsingBombos

.anim_step
|07A5CF| db $00, $01, $02, $03
|07A5D3| db $00, $01, $02, $03
|07A5D7| db $08, $09, $0A, $0B
|07A5DB| db $0C, $0A, $08, $0D
|07A5DF| db $0E, $0F, $10, $11

.anim_timer
|07A5E3| db   5,   5,   5,   5
|07A5E7| db   5,   5,   5,   5
|07A5EB| db   3,   3,   3,   3
|07A5EF| db   3,   7,   1,   1
|07A5F3| db   1,   1,   1,  13

endpool

;---------------------------------------------------------------------------------------------------

LinkState_UsingBombos:
|07A5F7| INC.w $0FC1

|07A5FA| DEC.b $3D
|07A5FC| BPL .exit

|07A5FE| INC.w $031D

|07A601| LDX.w $031D
|07A604| CPX.b #$04
|07A606| BNE .skip_swish_sfx

|07A608| PHX

|07A609| LDA.b #$23 ; SFX3.23
|07A60B| JSR PlayLinkSFX3Panned

|07A60E| PLX

.skip_swish_sfx
|07A60F| CPX.b #$0A
|07A611| BNE .skip_ping_sfx

|07A613| PHX

|07A614| LDA.b #$2C ; SFX2.2C
|07A616| JSR PlayLinkSFX2Panned

|07A619| PLX

;---------------------------------------------------------------------------------------------------

.skip_ping_sfx
|07A61A| CPX.b #$14
|07A61C| BNE .dont_reset_step

|07A61E| LDA.b #$13
|07A620| STA.w $031D

|07A623| TAX

.dont_reset_step
|07A624| LDA.w .anim_timer,X
|07A627| STA.b $3D

|07A629| LDA.w .anim_step,X
|07A62C| STA.w $031C

|07A62F| LDA.w $0324
|07A632| BNE .exit

|07A634| CPX.b #$13
|07A636| BNE .exit

|07A638| LDA.b #$01
|07A63A| STA.w $0324

|07A63D| LDY.b #$00
|07A63F| LDA.b #$19 ; ANCILLA 19
|07A641| JSL AncillaAdd_BombosSpell

|07A645| STZ.b $4D
|07A647| STZ.w $0046

.exit
|07A64A| RTS

;===================================================================================================

LinkItem_Quake:
|07A64B| JSR TestYButton
|07A64E| BCC .exit

|07A650| LDA.b $3A
|07A652| AND.b #$BF
|07A654| STA.b $3A

|07A656| LDA.b $6C
|07A658| BNE .cannot_quake

|07A65A| LDA.w $0FFC
|07A65D| BNE .cannot_quake

|07A65F| LDA.w $0403
|07A662| AND.b #$80
|07A664| BNE .cannot_quake

|07A666| LDA.l $7EF359
|07A66A| INC A
|07A66B| AND.b #$FE
|07A66D| BEQ .cannot_quake

|07A66F| LDA.l $7EF3D3
|07A673| BEQ .allow_quake

|07A675| LDA.l $7EF3CC
|07A679| CMP.b #$0D ; FOLLOWER 0D
|07A67B| BNE .allow_quake

.cannot_quake
|07A67D| BRL LinkGoBeep

;---------------------------------------------------------------------------------------------------

.allow_quake
|07A680| LDA.w $0C4A
|07A683| ORA.w $0C4B
|07A686| ORA.w $0C4C
|07A689| BNE .exit

|07A68B| LDX.b #$01
|07A68D| JSR CheckMagicCost
|07A690| BCC .exit

|07A692| LDA.b #$0A ; LINKSTATE 0A
|07A694| STA.b $5D

|07A696| LDA.b #$01
|07A698| TSB.b $50

|07A69A| LDA.w .anim_timer
|07A69D| STA.b $3D

|07A69F| LDA.w .anim_step
|07A6A2| STA.w $031C
|07A6A5| STZ.w $031D

|07A6A8| STZ.w $0324

|07A6AB| STZ.b $46

|07A6AD| LDA.b #$28
|07A6AF| STA.w $0362
|07A6B2| STA.w $0363
|07A6B5| STZ.w $0364

|07A6B8| LDA.b #$23 ; SFX3.23
|07A6BA| JSR PlayLinkSFX3Panned

.exit
|07A6BD| RTS

;===================================================================================================

pool LinkItem_Quake LinkState_UsingQuake

.anim_step
|07A6BE| db $00, $01, $02, $03
|07A6C2| db $00, $01, $02, $03
|07A6C6| db $12, $13, $14, $16

.anim_timer
|07A6CA| db   5,   5,   5,   5
|07A6CE| db   5,   5,   5,   5
|07A6D2| db   5,   5,   5,  19

endpool

;---------------------------------------------------------------------------------------------------

LinkState_UsingQuake:
|07A6D6| INC.w $0FC1

|07A6D9| STZ.b $27
|07A6DB| STZ.b $28

|07A6DD| LDA.w $031D
|07A6E0| CMP.b #$0A
|07A6E2| BNE .not_ascending

|07A6E4| LDA.w $0362
|07A6E7| STA.b $29

|07A6E9| LDA.w $0363
|07A6EC| STA.w $02C7

|07A6EF| LDA.w $0364
|07A6F2| STA.b $24

|07A6F4| LDA.b #$02
|07A6F6| STA.b $00
|07A6F8| STA.b $4D

|07A6FA| JSR HandleChangeInZVelocity.preset
|07A6FD| JSL FindArbitraryLandingSpot

|07A701| LDA.b $29
|07A703| STA.w $0362

|07A706| LDA.w $02C7
|07A709| STA.w $0363

|07A70C| LDA.b $24
|07A70E| STA.w $0364
|07A711| BMI .still_ascending

;---------------------------------------------------------------------------------------------------

|07A713| LDY.b #$14

|07A715| LDA.b $29
|07A717| BPL .done_ascending

|07A719| LDY.b #$15

.done_ascending
|07A71B| STY.w $031C

|07A71E| BRA .exit

.not_ascending
|07A720| DEC.b $3D
|07A722| BPL .exit

;---------------------------------------------------------------------------------------------------

.still_ascending
|07A724| INC.w $031D

|07A727| LDX.w $031D
|07A72A| CPX.b #$04
|07A72C| BNE .skip_swish_sfx

|07A72E| PHX

|07A72F| LDA.b #$23 ; SFX3.23
|07A731| JSR PlayLinkSFX3Panned

|07A734| PLX

.skip_swish_sfx
|07A735| CPX.b #$0A
|07A737| BNE .skip_ping_sfx

|07A739| PHX

|07A73A| LDA.b #$2C ; SFX2.2C
|07A73C| JSR PlayLinkSFX2Panned

|07A73F| PLX

.skip_ping_sfx
|07A740| CPX.b #$0B
|07A742| BNE .skip_boom_sfx

|07A744| LDA.b #$0C ; SFX2.0C
|07A746| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.skip_boom_sfx
|07A749| CPX.b #$0C
|07A74B| BNE .dont_reset_step

|07A74D| LDA.b #$0B
|07A74F| STA.w $031D

|07A752| TAX

.dont_reset_step
|07A753| LDA.w .anim_timer,X
|07A756| STA.b $3D

|07A758| LDA.w .anim_step,X
|07A75B| STA.w $031C

|07A75E| LDA.w $0324
|07A761| BNE .exit

|07A763| CPX.b #$0B
|07A765| BNE .exit

|07A767| LDA.b #$01
|07A769| STA.w $0324

|07A76C| LDY.b #$00
|07A76E| LDA.b #$1C ; ANCILLA 1C
|07A770| JSL AncillaAdd_QuakeSpell

|07A774| STZ.b $4D
|07A776| STZ.w $0046

.exit
|07A779| RTS

;===================================================================================================

ActivateSpinAttack:
|07A77A| LDY.b #$00
|07A77C| TYX

|07A77D| LDA.b #$2A ; ANCILLA 2A
|07A77F| JSL AncillaAdd_SpinAttackInitSpark

;===================================================================================================

AnimateVictorySpin:
|07A783| LDA.b #$03 ; LINKSTATE 03
|07A785| STA.b $5D

|07A787| LDA.b $2F
|07A789| LSR A
|07A78A| TAX

|07A78B| LDA.w SpinAttack.data_offset,X
|07A78E| STA.w $031E
|07A791| TAX

|07A792| LDA.w SpinAttack.anim_timer_a
|07A795| STA.b $3D

|07A797| LDA.w SpinAttack.anim_step,X
|07A79A| STA.w $031C
|07A79D| STZ.w $031D

|07A7A0| LDA.b #$90
|07A7A2| STA.b $3C

|07A7A4| LDA.b #$01
|07A7A6| TSB.b $50

|07A7A8| LDA.b #$80
|07A7AA| STA.b $3A

|07A7AC| BRL LinkState_SpinAttack

;===================================================================================================

UNREACHABLE_07A7AF:
|07A7AF| RTS

;===================================================================================================

AnimateVictorySpin_long:
|07A7B0| PHB
|07A7B1| PHK
|07A7B2| PLB

|07A7B3| JSR AnimateVictorySpin

|07A7B6| PLB

|07A7B7| RTL

;===================================================================================================

SpinAttack:

.anim_step
|07A7B8| db $0A, $0B, $0A, $06, $07, $08, $09, $02, $03, $04, $05, $0A ; up
|07A7C4| db $00, $01, $00, $02, $03, $04, $05, $06, $07, $08, $09, $00 ; down
|07A7D0| db $0C, $0D, $0C, $04, $05, $06, $07, $08, $09, $02, $03, $0C ; left
|07A7DC| db $0E, $0F, $0E, $08, $09, $02, $03, $04, $05, $06, $07, $0E ; right

.anim_timer_a
|07A7E8| db $03, $09, $03 ; up
|07A7EB| db $01, $01, $01 ; down
|07A7EE| db $01, $01, $01 ; left
|07A7F1| db $01, $01, $05 ; right

.anim_timer_b
|07A7F4| db $01, $05, $01 ; up
|07A7F7| db $01, $01, $01 ; down
|07A7FA| db $01, $01, $01 ; left
|07A7FD| db $01, $01, $05 ; right

.data_offset
|07A800| db $00 ; up
|07A801| db $0C ; down
|07A802| db $18 ; left
|07A803| db $24 ; right

;===================================================================================================

LinkState_SpinAttack:
|07A804| JSR CacheCameraPropertiesIfOutdoors

|07A807| LDA.b $4D
|07A809| BEQ .not_recoiling

;---------------------------------------------------------------------------------------------------

|07A80B| LDX.b #$04

.next_ancilla
|07A80D| LDA.w $0C4A,X
|07A810| CMP.b #$2A ; ANCILLA 2A
|07A812| BEQ .delete_ancilla

|07A814| CMP.b #$2B ; ANCILLA 2B
|07A816| BNE .skip_ancilla

.delete_ancilla
|07A818| STZ.w $0C4A,X

.skip_ancilla
|07A81B| DEX
|07A81C| BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

|07A81E| STZ.b $25

|07A820| LDA.b $50
|07A822| AND.b #$FE
|07A824| STA.b $50

|07A826| STZ.b $3D
|07A828| STZ.b $3C

|07A82A| STZ.b $3A
|07A82C| STZ.b $3B

|07A82E| STZ.w $031C
|07A831| STZ.w $031D

|07A834| STZ.b $5E

|07A836| LDA.b $1B
|07A838| BNE .useless_branch

.useless_branch
|07A83A| LDA.w $0360
|07A83D| BEQ .not_electrocuted

|07A83F| LDA.b $55
|07A841| BEQ .no_cape

|07A843| JSR ForciblyUnequipCape_quietly

;---------------------------------------------------------------------------------------------------

.no_cape
|07A846| JSR ResetSwordAndItemUsage

|07A849| LDA.b #$01
|07A84B| STA.w $037B

|07A84E| STZ.w $0300

|07A851| LDA.b #$02
|07A853| STA.b $3D

|07A855| STZ.b $2E

|07A857| LDA.b $67
|07A859| AND.b #$F0
|07A85B| STA.b $67

|07A85D| LDA.b #$2B ; SFX3.2B
|07A85F| JSR PlayLinkSFX3Panned

|07A862| LDA.b #$07 ; LINKSTATE 07
|07A864| STA.b $5D

|07A866| BRL LinkState_Zapped

;---------------------------------------------------------------------------------------------------

.not_electrocuted
|07A869| LDA.b #$02 ; LINKSTATE 02
|07A86B| STA.b $5D

|07A86D| BRL LinkState_Recoil

;---------------------------------------------------------------------------------------------------

.not_recoiling
|07A870| LDA.b $46
|07A872| BEQ .not_rebounding

|07A874| JSR HandleRecoilAndTimer
|07A877| BRA .done_rebound

.not_rebounding
|07A879| STZ.b $67

|07A87B| JSL HandleLinkVelocity

|07A87F| JSR HandleLinkCardinalCollision

|07A882| LDA.b #$03 ; LINKSTATE 03
|07A884| STA.b $5D

|07A886| STZ.w $0302

|07A889| JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

.done_rebound
|07A88C| DEC.b $3D
|07A88E| BPL EXIT_07A8EB

|07A890| LDA.w $031D
|07A893| INC A
|07A894| STA.w $031D

|07A897| CMP.b #$02
|07A899| BNE .skip_swoosh_sfx

|07A89B| LDA.b #$23 ; SFX3.23
|07A89D| JSR PlayLinkSFX3Panned

;---------------------------------------------------------------------------------------------------

.skip_swoosh_sfx
|07A8A0| LDA.w $031D
|07A8A3| CMP.b #$0C
|07A8A5| BNE .still_spinning

|07A8A7| LDA.b $50
|07A8A9| AND.b #$FE
|07A8AB| STA.b $50

|07A8AD| STZ.b $3D
|07A8AF| STZ.b $3C

|07A8B1| STZ.w $031C
|07A8B4| STZ.w $031D

|07A8B7| LDA.b $5D
|07A8B9| CMP.b #$1E ; LINKSTATE 1E
|07A8BB| BEQ .victory_spin

|07A8BD| LDX.b #$00

|07A8BF| LDA.b $3C
|07A8C1| BEQ .dont_preserve_b_button

|07A8C3| LDA.b $F0
|07A8C5| AND.b #$80
|07A8C7| TAX

.dont_preserve_b_button
|07A8C8| STX.b $3A

.victory_spin
|07A8CA| LDA.b #$00 ; LINKSTATE 00
|07A8CC| STA.b $5D

|07A8CE| BRA EXIT_07A8EB

;---------------------------------------------------------------------------------------------------

.still_spinning
|07A8D0| LDA.w $031D
|07A8D3| CLC
|07A8D4| ADC.w $031E
|07A8D7| TAX

|07A8D8| LDA.w SpinAttack.anim_step,X
|07A8DB| STA.w $031C

|07A8DE| LDX.w $031D

|07A8E1| LDY.w SpinAttack.anim_timer_b,X
|07A8E4| STY.b $3D

|07A8E6| LDY.b #$08
|07A8E8| JSR TileDetect_MainHandler

;---------------------------------------------------------------------------------------------------

#EXIT_07A8EB:
|07A8EB| RTS

;===================================================================================================

UNREACHABLE_07A8EC:
|07A8EC| LDY.b #$00
|07A8EE| LDX.b #$01
|07A8F0| LDA.b #$2A ; ANCILLA 2A
|07A8F2| JSL AncillaAdd_SpinAttackInitSpark

|07A8F6| LDA.b #$1E ; LINKSTATE 1E
|07A8F8| STA.b $5D

|07A8FA| LDA.b $2F
|07A8FC| LSR A
|07A8FD| TAX

|07A8FE| LDA.w SpinAttack.data_offset,X
|07A901| STA.w $031E

|07A904| TAX

|07A905| LDA.w SpinAttack.anim_timer_a
|07A908| STA.b $3D

|07A90A| LDA.w SpinAttack.anim_step,X
|07A90D| STA.w $031C
|07A910| STZ.w $031D

|07A913| LDA.b #$01
|07A915| TSB.b $50

|07A917| BRL LinkState_SpinAttack

;===================================================================================================

LinkItem_Mirror:
|07A91A| BIT.b $3A
|07A91C| BVS .continue

|07A91E| JSR TestYButton
|07A921| BCC EXIT_07A8EB

|07A923| LDA.l $7EF3CC
|07A927| CMP.b #$0A ; FOLLOWER 0A
|07A929| BNE .continue

;---------------------------------------------------------------------------------------------------

|07A92B| REP #$20

|07A92D| LDA.w #$0121 ; MESSAGE 0121
|07A930| STA.w $1CF0

|07A933| SEP #$20

|07A935| JSL PrepAndDisplayMessage
|07A939| BRL .exit

;---------------------------------------------------------------------------------------------------

.continue
|07A93C| LDA.b $3A
|07A93E| AND.b #$BF
|07A940| STA.b $3A

|07A942| LDA.b $6C
|07A944| BNE LinkGoBeep

|07A946| LDA.w $037F
|07A949| BNE AttemptMirrorWarp

|07A94B| LDA.b $1B
|07A94D| BNE AttemptMirrorWarp

|07A94F| LDA.b $8A
|07A951| AND.b #$40
|07A953| BNE AttemptMirrorWarp

;===================================================================================================

#LinkGoBeep:
|07A955| LDA.b #$3C ; SFX2.3C
|07A957| JSR PlayLinkSFX2Panned

|07A95A| BRA .exit

;===================================================================================================

#AttemptMirrorWarp:
|07A95C| LDA.b $1B
|07A95E| BEQ .overworld

|07A960| LDA.w $0FFC
|07A963| BNE .exit

|07A965| JSL MirrorAndSaveRoomFlags

|07A969| LDA.w $012E
|07A96C| CMP.b #$3C ; SFX2.3C
|07A96E| BEQ .exit

|07A970| STZ.w $05FC
|07A973| STZ.w $05FD

|07A976| BRA .exit

;---------------------------------------------------------------------------------------------------

.overworld
|07A978| LDA.b $10
|07A97A| CMP.b #$0B
|07A97C| BEQ .exit

|07A97E| LDA.b $8A
|07A980| AND.b #$40
|07A982| STA.b $7B

|07A984| BEQ .no_mirror_portal

|07A986| LDA.b $20
|07A988| STA.w $1ADF

|07A98B| LDA.b $21
|07A98D| STA.w $1AEF

|07A990| LDA.b $22
|07A992| STA.w $1ABF

|07A995| LDA.b $23
|07A997| STA.w $1ACF

.no_mirror_portal
|07A99A| LDA.b #$23

;---------------------------------------------------------------------------------------------------

#SetGameModeLikeMirror:
|07A99C| STA.b $11

|07A99E| STZ.w $03F8

|07A9A1| LDA.b #$01
|07A9A3| STA.w $02DB

|07A9A6| STZ.b $B0

|07A9A8| STZ.b $27
|07A9AA| STZ.b $28

|07A9AC| LDA.b #$14 ; LINKSTATE 14
|07A9AE| STA.b $5D

.exit
|07A9B0| RTS

;===================================================================================================

LinkState_CrossingWorlds:
|07A9B1| JSL ResetLinkProperties_B

|07A9B5| JSR TileCheckForMirrorBonk

|07A9B8| LDA.b $8A
|07A9BA| AND.b #$40
|07A9BC| CMP.b $7B
|07A9BE| BNE .worlds_dont_match

|07A9C0| BRL .dont_mirror_bonk

;---------------------------------------------------------------------------------------------------

.worlds_dont_match
|07A9C3| LDA.b $0C
|07A9C5| ORA.b $0E
|07A9C7| STA.b $00

|07A9C9| AND.b #$0C
|07A9CB| BEQ .dont_mirror_bonk

|07A9CD| LDA.b $00
|07A9CF| AND.b #$03
|07A9D1| BNE .mirror_bonk

|07A9D3| LDA.b $00
|07A9D5| AND.b #$0F
|07A9D7| BEQ .dont_mirror_bonk

;---------------------------------------------------------------------------------------------------

|07A9D9| LDX.b #$03
|07A9DB| LDY.b #$00

.next_shift_a
|07A9DD| LSR A
|07A9DE| BCC .no_bit_a

|07A9E0| INY

.no_bit_a
|07A9E1| DEX
|07A9E2| BPL .next_shift_a

|07A9E4| CPY.b #$02
|07A9E6| BCC .dont_mirror_bonk

.mirror_bonk
|07A9E8| LDA.b #$2C
|07A9EA| BRA SetGameModeLikeMirror

.dont_mirror_bonk
|07A9EC| LDY.b #$00
|07A9EE| LDX.b #$03

|07A9F0| LDA.w $0341

.next_shift_b
|07A9F3| LSR A
|07A9F4| BCC .no_bit_b

|07A9F6| INY

.no_bit_b
|07A9F7| DEX
|07A9F8| BPL .next_shift_b

|07A9FA| CPY.b #$02
|07A9FC| BCC .dont_reset_swim_or_cape

;---------------------------------------------------------------------------------------------------

|07A9FE| LDA.l $7EF356
|07AA02| BNE .have_flippers

|07AA04| LDA.b $8A
|07AA06| AND.b #$40
|07AA08| CMP.b $7B
|07AA0A| BNE .mirror_bonk

|07AA0C| JSL CheckAbilityToSwim

|07AA10| BRA .dont_reset_swim_or_cape

;---------------------------------------------------------------------------------------------------

.have_flippers
|07AA12| LDA.b #$01
|07AA14| STA.w $0345

|07AA17| LDA.b $26
|07AA19| STA.w $0340

|07AA1C| JSL ResetSwimmingState

|07AA20| LDA.b #$04 ; LINKSTATE 04
|07AA22| STA.b $5D

|07AA24| JSR ForciblyUnequipCape_quietly

|07AA27| STZ.b $5E

|07AA29| BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_reset_swim_or_cape
|07AA2B| LDA.w $0345
|07AA2E| BEQ .not_deep_water

|07AA30| STZ.w $0345

|07AA33| LDA.w $0340
|07AA36| STA.b $26

.not_deep_water
|07AA38| STZ.w $0374
|07AA3B| STZ.w $0372

|07AA3E| STZ.b $5E

|07AA40| STZ.b $3A
|07AA42| STZ.b $3C

|07AA44| STZ.b $50

|07AA46| STZ.w $032B

|07AA49| STZ.b $27

;---------------------------------------------------------------------------------------------------

|07AA4B| LDA.b $8A
|07AA4D| AND.b #$40
|07AA4F| CMP.b $7B
|07AA51| BEQ .worlds_match

|07AA53| STZ.w $04AC
|07AA56| STZ.w $04AD

.worlds_match
|07AA59| LDY.b #$00 ; LINKSTATE 00

|07AA5B| LDA.l $7EF357
|07AA5F| BNE .not_pearlless_in_darkworld

|07AA61| LDA.b $8A
|07AA63| AND.b #$40
|07AA65| BEQ .not_pearlless_in_darkworld

|07AA67| LDY.b #$17 ; LINKSTATE 17

.not_pearlless_in_darkworld
|07AA69| STY.b $5D

.exit
|07AA6B| RTS

;===================================================================================================

PerformDesertPrayer:
|07AA6C| LDA.b #$05
|07AA6E| STA.b $11

|07AA70| LDA.b $10
|07AA72| STA.w $010C

|07AA75| LDA.b #$0E
|07AA77| STA.b $10

|07AA79| LDA.b #$01
|07AA7B| STA.w $0FC1

|07AA7E| LDA.b #$16
|07AA80| STA.w $030B

|07AA83| STZ.w $030A

|07AA86| LDA.b #$02
|07AA88| STA.w $0308

|07AA8B| LDA.b #$01
|07AA8D| TSB.b $50

|07AA8F| STZ.b $2E

|07AA91| LDA.b $67
|07AA93| AND.b #$F0
|07AA95| STA.b $67

|07AA97| LDA.b #$11 ; SFX1.11
|07AA99| STA.w $012D

|07AA9C| LDA.b #$F2 ; SONG F2 - half volume
|07AA9E| STA.w $012C

;---------------------------------------------------------------------------------------------------

#EXIT_07AAA1:
|07AAA1| RTS

;===================================================================================================

HandleFollowersAfterMirroring:
|07AAA2| PHB
|07AAA3| PHK
|07AAA4| PLB

|07AAA5| LDY.b #$00
|07AAA7| JSR TileDetect_MainHandler

|07AAAA| STZ.b $2E

|07AAAC| LDA.l $7EF3CC
|07AAB0| CMP.b #$0C ; FOLLOWER 0C
|07AAB2| BEQ .have_purple_chest

|07AAB4| CMP.b #$0D ; FOLLOWER 0D
|07AAB6| BNE .dont_have_superbomb

|07AAB8| LDA.b #$FE
|07AABA| STA.w $04B4
|07AABD| STZ.w $04B5

;---------------------------------------------------------------------------------------------------

.have_purple_chest
|07AAC0| LDA.l $7EF3D3
|07AAC4| BEQ .check_for_pearl

|07AAC6| LDA.b #$00
|07AAC8| STA.l $7EF3D3

|07AACC| BRA .clear_follower

;---------------------------------------------------------------------------------------------------

.dont_have_superbomb
|07AACE| LDA.l $7EF3CC

|07AAD2| CMP.b #$09 ; FOLLOWER 09
|07AAD4| BEQ .clear_follower

|07AAD6| CMP.b #$0A ; FOLLOWER 0A
|07AAD8| BNE .not_kiki

.clear_follower
|07AADA| LDA.b #$00
|07AADC| STA.l $7EF3CC

|07AAE0| BRA .check_for_pearl

;---------------------------------------------------------------------------------------------------

.not_kiki
|07AAE2| LDY.b #$07 ; FOLLOWER 07

|07AAE4| LDA.l $7EF3CC
|07AAE8| CMP.b #$08 ; FOLLOWER 08
|07AAEA| BEQ .smithy

|07AAEC| LDY.b #$08 ; FOLLOWER 08

|07AAEE| CMP.b #$07 ; FOLLOWER 07
|07AAF0| BNE .check_for_pearl

;---------------------------------------------------------------------------------------------------

.smithy
|07AAF2| TYA
|07AAF3| STA.l $7EF3CC
|07AAF7| JSL LoadFollowerGraphics

|07AAFB| LDY.b #$04
|07AAFD| LDA.b #$40 ; ANCILLA 40
|07AAFF| JSL AncillaAdd_DwarfPoof

;---------------------------------------------------------------------------------------------------

.check_for_pearl
|07AB03| LDA.l $7EF357
|07AB07| BNE .have_pearl

|07AB09| LDY.b #$04
|07AB0B| LDA.b #$23 ; ANCILLA 23
|07AB0D| JSL AncillaAdd_BunnyPoof

|07AB11| JSR ForciblyUnequipCape_quietly

|07AB14| STZ.w $02E2

|07AB17| BRA .exit

.have_pearl
|07AB19| LDA.b $55
|07AB1B| BEQ .exit

|07AB1D| JSR ForciblyUnequipCape

|07AB20| STZ.w $02E2

.exit
|07AB23| PLB

|07AB24| RTL

;===================================================================================================

LinkItem_Hookshot:
|07AB25| LDA.b $3A
|07AB27| AND.b #$40
|07AB29| BNE EXIT_07AB6B

|07AB2B| LDA.b $6C
|07AB2D| BNE EXIT_07AB6B

|07AB2F| LDA.b $48
|07AB31| AND.b #$02
|07AB33| BNE EXIT_07AB6B

|07AB35| JSR TestYButton
|07AB38| BCC EXIT_07AB6B

;---------------------------------------------------------------------------------------------------

|07AB3A| JSR ResetAllAcceleration

|07AB3D| STZ.w $0300

|07AB40| LDA.b #$01
|07AB42| TSB.b $50

|07AB44| LDA.b #$07
|07AB46| STA.b $3D

|07AB48| STZ.b $2E

|07AB4A| LDA.b $67
|07AB4C| AND.b #$F0
|07AB4E| STA.b $67

|07AB50| LDA.w $037A
|07AB53| AND.b #$00
|07AB55| ORA.b #$04
|07AB57| STA.w $037A

|07AB5A| LDA.b #$13 ; LINKSTATE 13
|07AB5C| STA.b $5D

|07AB5E| LDA.b #$01
|07AB60| STA.w $037B

|07AB63| LDY.b #$03
|07AB65| LDA.b #$1F ; ANCILLA 1F
|07AB67| JSL AncillaAdd_Hookshot

;---------------------------------------------------------------------------------------------------

#EXIT_07AB6B:
|07AB6B| RTS

;===================================================================================================

Hookdrag:

.offset_y
|07AB6C| db $F8 ; up
|07AB6D| db $F0 ; down
|07AB6E| db $00 ; left
|07AB6F| db $00 ; right

.offset_x
|07AB70| db $00 ; up
|07AB71| db $00 ; down
|07AB72| db $04 ; left
|07AB73| db $F4 ; right

;---------------------------------------------------------------------------------------------------

.speed_y
|07AB74| db $C0 ; up
|07AB75| db $40 ; down
|07AB76| db $00 ; left
|07AB77| db $00 ; right

.speed_x
|07AB78| db $00 ; up
|07AB79| db $00 ; down
|07AB7A| db $C0 ; left
|07AB7B| db $40 ; right

;===================================================================================================

LinkState_Hookshotting:
|07AB7C| STZ.w $0373
|07AB7F| STZ.b $4D
|07AB81| STZ.b $46

|07AB83| LDX.b #$04

.next_ancilla_check
|07AB85| LDA.w $0C4A,X
|07AB88| CMP.b #$1F ; ANCILLA 1F
|07AB8A| BEQ .found_hookshot

|07AB8C| DEX
|07AB8D| BPL .next_ancilla_check

|07AB8F| DEC.b $3D

|07AB91| LDA.b $3D
|07AB93| BPL EXIT_07AB6B

;---------------------------------------------------------------------------------------------------

|07AB95| STZ.w $0300
|07AB98| STZ.w $037B

|07AB9B| LDA.b $3A
|07AB9D| AND.b #$BF
|07AB9F| STA.b $3A

|07ABA1| LDA.b $50
|07ABA3| AND.b #$FE
|07ABA5| STA.b $50

|07ABA7| LDA.w $037A
|07ABAA| AND.b #$FB
|07ABAC| STA.w $037A

|07ABAF| LDA.b #$00 ; LINKSTATE 00
|07ABB1| STA.b $5D

|07ABB3| LDA.b $3C
|07ABB5| CMP.b #$09
|07ABB7| BCC .exit

|07ABB9| LDA.b #$09
|07ABBB| STA.b $3C

.exit
|07ABBD| RTS

;---------------------------------------------------------------------------------------------------

.found_hookshot
|07ABBE| DEC.b $3D
|07ABC0| BPL .timer_going

|07ABC2| STZ.b $3D

.timer_going
|07ABC4| LDA.w $037E
|07ABC7| BNE .being_dragged

|07ABC9| LDA.b $20
|07ABCB| STA.b $3E

|07ABCD| LDA.b $22
|07ABCF| STA.b $3F

|07ABD1| STZ.b $30
|07ABD3| STZ.b $31

|07ABD5| BRL HandleLinkCardinalCollision

;---------------------------------------------------------------------------------------------------

.being_dragged
|07ABD8| STZ.w $02F5

|07ABDB| LDX.w $039D

|07ABDE| DEC.w $0C5E,X
|07ABE1| BPL .keep_hooking

|07ABE3| STZ.w $0C5E,X

|07ABE6| BRL DeleteHookshot

;---------------------------------------------------------------------------------------------------

.keep_hooking
|07ABE9| LDA.w $0BFA,X
|07ABEC| STA.b $00

|07ABEE| LDA.w $0C0E,X
|07ABF1| STA.b $01

|07ABF3| LDA.w $0C04,X
|07ABF6| STA.b $02

|07ABF8| LDA.w $0C18,X
|07ABFB| STA.b $03

|07ABFD| LDY.w $0C72,X

|07AC00| STZ.b $05

|07AC02| LDA.w Hookdrag.offset_y,Y
|07AC05| STA.b $04
|07AC07| BPL .positive_a

|07AC09| LDA.b #$FF
|07AC0B| STA.b $05

.positive_a
|07AC0D| STZ.b $07

|07AC0F| LDA.w Hookdrag.offset_x,Y
|07AC12| STA.b $06
|07AC14| BPL .positive_b

|07AC16| LDA.b #$FF
|07AC18| STA.b $07

.positive_b
|07AC1A| STZ.b $27
|07AC1C| STZ.b $28

|07AC1E| LDA.w Hookdrag.speed_y,Y
|07AC21| STA.b $08
|07AC23| STZ.b $09

|07AC25| LDA.w Hookdrag.speed_x,Y
|07AC28| STA.b $0A
|07AC2A| STZ.b $0B

;---------------------------------------------------------------------------------------------------

|07AC2C| REP #$20

|07AC2E| LDA.b $00
|07AC30| CLC
|07AC31| ADC.b $04
|07AC33| SEC
|07AC34| SBC.b $20
|07AC36| BPL .positive_y

|07AC38| EOR.w #$FFFF
|07AC3B| INC A

.positive_y
|07AC3C| CMP.w #$0002
|07AC3F| BCC .not_limited_y

|07AC41| LDA.b $27
|07AC43| AND.w #$FF00
|07AC46| ORA.b $08
|07AC48| STA.b $27

.not_limited_y
|07AC4A| LDA.b $02
|07AC4C| CLC
|07AC4D| ADC.b $06
|07AC4F| SEC
|07AC50| SBC.b $22
|07AC52| BPL .positive_x

|07AC54| EOR.w #$FFFF
|07AC57| INC A

.positive_x
|07AC58| CMP.w #$0002
|07AC5B| BCC .not_limited_x

|07AC5D| LDA.b $28
|07AC5F| AND.w #$FF00
|07AC62| ORA.b $0A
|07AC64| STA.b $28

.not_limited_x
|07AC66| SEP #$20

|07AC68| LDA.b $27
|07AC6A| ORA.b $28
|07AC6C| BEQ DeleteHookshot

|07AC6E| BRL DragLinkWithHookshot

;===================================================================================================

DeleteHookshot:
|07AC71| LDX.w $039D

|07AC74| STZ.w $0C4A,X

|07AC77| LDA.w $02D3
|07AC7A| STA.w $02D1

|07AC7D| LDA.b #$00 ; LINKSTATE 00
|07AC7F| STA.b $5D

|07AC81| STZ.w $0300
|07AC84| STZ.b $3D
|07AC86| STZ.w $037E

|07AC89| LDA.b $3A
|07AC8B| AND.b #$BF
|07AC8D| STA.b $3A

|07AC8F| LDA.b $50
|07AC91| AND.b #$FE
|07AC93| STA.b $50

|07AC95| LDA.w $037A
|07AC98| AND.b #$FB
|07AC9A| STA.w $037A

|07AC9D| STZ.w $037B

|07ACA0| LDA.w $03A4,X
|07ACA3| BEQ .no_layer_changing

|07ACA5| LDA.w $0476
|07ACA8| EOR.b #$01
|07ACAA| STA.w $0476

|07ACAD| DEC.b $A4

|07ACAF| LDA.w $044A
|07ACB2| BNE .dont_go_down_1_room

|07ACB4| LDA.b $A0
|07ACB6| STA.w $048E

|07ACB9| CLC
|07ACBA| ADC.b #$10
|07ACBC| STA.b $A0

.dont_go_down_1_room
|07ACBE| LDA.w $044A
|07ACC1| CMP.b #$02
|07ACC3| BEQ .dont_swap_layer

|07ACC5| LDA.b $EE
|07ACC7| EOR.b #$01
|07ACC9| STA.b $EE

.dont_swap_layer
|07ACCB| JSL FullyUpdateRoomFlags

;---------------------------------------------------------------------------------------------------

.no_layer_changing
|07ACCF| JSR TileDetect_BigArea

|07ACD2| LDA.w $0341
|07ACD5| AND.b #$0F
|07ACD7| BEQ .not_on_deep_water

|07ACD9| LDA.w $0345
|07ACDC| BNE .not_on_deep_water

;---------------------------------------------------------------------------------------------------

|07ACDE| LDA.b #$01
|07ACE0| STA.w $0345

|07ACE3| LDA.b $26
|07ACE5| STA.w $0340

|07ACE8| JSL ResetSwimmingState

|07ACEC| LDA.b #$15 ; ANCILLA 15
|07ACEE| LDY.b #$00
|07ACF0| JSL AncillaAdd_Splash

|07ACF4| LDA.b #$04 ; LINKSTATE 04
|07ACF6| STA.b $5D

|07ACF8| JSR ForciblyUnequipCape_quietly

|07ACFB| STZ.w $0308
|07ACFE| STZ.w $0309
|07AD01| STZ.w $0376
|07AD04| STZ.b $5E

|07AD06| LDA.b $1B
|07AD08| BEQ .dont_set_to_water_layer

|07AD0A| LDA.b #$01
|07AD0C| STA.b $EE

.dont_set_to_water_layer
|07AD0E| BRA .continue_after_tiles

;---------------------------------------------------------------------------------------------------

.not_on_deep_water
|07AD10| LDA.b $59
|07AD12| AND.b #$0F
|07AD14| BEQ .not_pit

|07AD16| LDA.b #$09
|07AD18| STA.b $5C

|07AD1A| STZ.b $5A

|07AD1C| LDA.b #$01
|07AD1E| STA.b $5B

|07AD20| LDA.b #$01 ; LINKSTATE 01
|07AD22| STA.b $5D

|07AD24| BRA .continue_after_tiles

;---------------------------------------------------------------------------------------------------

.not_pit
|07AD26| LDA.b $20
|07AD28| STA.b $3E

|07AD2A| LDA.b $22
|07AD2C| STA.b $3F

|07AD2E| LDA.b $21
|07AD30| STA.b $40

|07AD32| LDA.b $23
|07AD34| STA.b $41

|07AD36| JSR HandleLinkCardinalCollision

|07AD39| BRL DragLinkWithHookshot.go_backwards

;---------------------------------------------------------------------------------------------------

.continue_after_tiles
|07AD3C| LDA.b $3C
|07AD3E| CMP.b #$09
|07AD40| BCC .no_spin_charge

|07AD42| LDA.b #$09
|07AD44| STA.b $3C

.no_spin_charge
|07AD46| BRL EXIT_07ADBD

;===================================================================================================

DragLinkWithHookshot:
|07AD49| JSL FindArbitraryLandingSpot

|07AD4D| LDY.b #$05
|07AD4F| JSR TileDetect_MainHandler

|07AD52| LDA.b $1B
|07AD54| BEQ .dont_flag_layers

;---------------------------------------------------------------------------------------------------

|07AD56| LDA.w $036D

|07AD59| LSR A
|07AD5A| LSR A
|07AD5B| LSR A
|07AD5C| LSR A

|07AD5D| ORA.w $036D
|07AD60| ORA.w $036E

|07AD63| AND.b #$01
|07AD65| BEQ .dont_flag_layers

|07AD67| DEC.w $03F9
|07AD6A| BPL .dont_flag_layers

|07AD6C| LDA.b #$03
|07AD6E| STA.w $03F9

|07AD71| LDA.w $037E
|07AD74| EOR.b #$02
|07AD76| STA.w $037E

;---------------------------------------------------------------------------------------------------

.dont_flag_layers
|07AD79| STZ.w $0351

|07AD7C| LDA.w $037E
|07AD7F| AND.b #$02
|07AD81| BNE .go_backwards

|07AD83| LDA.w $0357
|07AD86| AND.b #$01
|07AD88| BEQ .not_thick_grass

|07AD8A| LDA.b #$02
|07AD8C| STA.w $0351

|07AD8F| JSR GetPermissionForSloshSounds
|07AD92| BCS .go_backwards

|07AD94| LDA.b #$1A ; SFX2.1A
|07AD96| JSR PlayLinkSFX2Panned

|07AD99| BRA .go_backwards

.not_thick_grass
|07AD9B| LDA.w $0359
|07AD9E| ORA.w $0341
|07ADA1| AND.b #$01
|07ADA3| BEQ .go_backwards

|07ADA5| INC.w $0351

|07ADA8| LDA.b $8A
|07ADAA| CMP.b #$70 ; OW 70
|07ADAC| BNE .not_mire

|07ADAE| LDA.b #$1B ; SFX2.1B
|07ADB0| JSR PlayLinkSFX2Panned

|07ADB3| BRA .go_backwards

.not_mire
|07ADB5| LDA.b #$1C ; SFX2.1C
|07ADB7| JSR PlayLinkSFX2Panned

.go_backwards
|07ADBA| JSR HandleIndoorCameraAndDoors

;---------------------------------------------------------------------------------------------------

#EXIT_07ADBD:
|07ADBD| RTS

;===================================================================================================

CapeSapTimers:
|07ADBE| db $04 ; normal
|07ADBF| db $08 ; 1/2 magic
|07ADC0| db $08 ; 1/4 magic

;===================================================================================================

LinkItem_Cape:
|07ADC1| LDA.b $55
|07ADC3| BNE .cape_active

|07ADC5| DEC.w $02E2
|07ADC8| BMI .delay_active

|07ADCA| LDA.b $67
|07ADCC| AND.b #$F0
|07ADCE| STA.b $67

|07ADD0| BRL HaltLinkWhenUsingItems

.delay_active
|07ADD3| STZ.w $02E2

|07ADD6| LDA.b $6C
|07ADD8| BNE EXIT_07ADBD

|07ADDA| JSR TestYButton
|07ADDD| BCC EXIT_07ADBD

;---------------------------------------------------------------------------------------------------

|07ADDF| LDA.b $3A
|07ADE1| AND.b #$BF
|07ADE3| STA.b $3A

|07ADE5| LDA.l $7EF36E
|07ADE9| BEQ CannotEquipCape

|07ADEB| STZ.w $0300

|07ADEE| LDA.b #$01
|07ADF0| STA.b $55

|07ADF2| LDA.l $7EF37B
|07ADF6| TAY

|07ADF7| LDA.w CapeSapTimers,Y
|07ADFA| STA.b $4C

|07ADFC| LDA.b #$14
|07ADFE| STA.w $02E2

|07AE01| LDY.b #$04
|07AE03| LDA.b #$23 ; ANCILLA 23
|07AE05| JSL AncillaAdd_CapePoof

|07AE09| LDA.b #$14 ; SFX2.14
|07AE0B| JSR PlayLinkSFX2Panned

|07AE0E| BRA .exit

;===================================================================================================

.cape_active
|07AE10| LDA.b #$01
|07AE12| STA.w $037B

|07AE15| JSR HaltLinkWhenUsingItems

|07AE18| LDA.b $67
|07AE1A| AND.b #$F0
|07AE1C| STA.b $67

|07AE1E| DEC.b $4C

|07AE20| LDA.b $4C
|07AE22| BNE .dont_sap

|07AE24| LDA.l $7EF37B
|07AE28| TAY

|07AE29| LDA.w CapeSapTimers,Y
|07AE2C| STA.b $4C

|07AE2E| LDA.l $7EF36E
|07AE32| DEC A
|07AE33| STA.l $7EF36E

|07AE37| BEQ ForciblyUnequipCape

.dont_sap
|07AE39| DEC.w $02E2
|07AE3C| BPL .exit

|07AE3E| STZ.w $02E2

|07AE41| LDA.b $F4
|07AE43| AND.b #$40
|07AE45| BEQ .exit

;===================================================================================================

#ForciblyUnequipCape:
|07AE47| LDY.b #$04
|07AE49| LDA.b #$23 ; ANCILLA 23
|07AE4B| JSL AncillaAdd_CapePoof

|07AE4F| LDA.b #$15 ; SFX2.15
|07AE51| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

#ForciblyUnequipCape_quietly:
|07AE54| LDA.b #$20
|07AE56| STA.w $02E2

|07AE59| STZ.w $037B
|07AE5C| STZ.b $55
|07AE5E| STZ.w $0360

.exit
|07AE61| RTS

;===================================================================================================

CannotEquipCape:
|07AE62| BRL DisplayNoMagicMessage

;===================================================================================================

HaltLinkWhenUsingItems:
|07AE65| LDA.b $AD
|07AE67| CMP.b #$02
|07AE69| BNE .skip

|07AE6B| LDA.w $0322
|07AE6E| AND.b #$03
|07AE70| CMP.b #$03
|07AE72| BNE .skip

|07AE74| STZ.b $30
|07AE76| STZ.b $31

|07AE78| STZ.b $67

|07AE7A| STZ.b $2A
|07AE7C| STZ.b $2B

|07AE7E| STZ.b $6B

.skip
|07AE80| LDA.w $02F5
|07AE83| BEQ EXIT_07AE87

|07AE85| STZ.b $67

;---------------------------------------------------------------------------------------------------

#EXIT_07AE87:
|07AE87| RTS

;===================================================================================================

HandleCapePassive_LiftCheck:
|07AE88| LDA.w $0308
|07AE8B| AND.b #$80
|07AE8D| BEQ EXIT_07AE87

;===================================================================================================

HandleCapePassive:
|07AE8F| LDA.b $55
|07AE91| BEQ EXIT_07AE87

|07AE93| LDA.w $0304
|07AE96| CMP.b #$13
|07AE98| BNE EXIT_07AE87

|07AE9A| CMP.w $0303
|07AE9D| BNE .unequip

|07AE9F| DEC.b $4C

|07AEA1| LDA.b $4C
|07AEA3| BNE .exit

|07AEA5| LDA.l $7EF37B
|07AEA9| TAY

|07AEAA| LDA.w CapeSapTimers,Y
|07AEAD| STA.b $4C

|07AEAF| LDA.l $7EF36E
|07AEB3| BEQ .exit

|07AEB5| DEC A
|07AEB6| STA.l $7EF36E
|07AEBA| BNE .exit

.unequip
|07AEBC| JSR ForciblyUnequipCape

.exit
|07AEBF| RTS

;===================================================================================================

LinkItem_CaneOfSomaria:
|07AEC0| BIT.b $3A
|07AEC2| BVS .in_action

|07AEC4| LDA.w $02F5
|07AEC7| BNE EXIT_07AE87

|07AEC9| LDA.b $6C
|07AECB| BNE EXIT_07AE87

|07AECD| JSR TestYButton
|07AED0| BCC EXIT_07AE87

;---------------------------------------------------------------------------------------------------

|07AED2| LDX.b #$04

.next_ancilla
|07AED4| LDA.w $0C4A,X
|07AED7| CMP.b #$2C ; ANCILLA 2C
|07AED9| BEQ .found_block

|07AEDB| DEX
|07AEDC| BPL .next_ancilla

|07AEDE| LDX.b #$04
|07AEE0| JSR CheckMagicCost
|07AEE3| BCC EXIT_07AE87

;---------------------------------------------------------------------------------------------------

.found_block
|07AEE5| LDA.b #$01
|07AEE7| STA.w $0350

|07AEEA| LDY.b #$01
|07AEEC| LDA.b #$2C ; ANCILLA 2C
|07AEEE| JSL AncillaAdd_SomariaBlock

|07AEF2| LDA.w RodAndCaneAnimationTimer
|07AEF5| STA.b $3D

|07AEF7| STZ.b $2E
|07AEF9| STZ.w $0300
|07AEFC| STZ.w $0301

|07AEFF| LDA.b #$08
|07AF01| TSB.w $037A

;---------------------------------------------------------------------------------------------------

.in_action
|07AF04| JSR HaltLinkWhenUsingItems

|07AF07| LDA.b $67
|07AF09| AND.b #$F0
|07AF0B| STA.b $67

|07AF0D| DEC.b $3D
|07AF0F| BPL EXIT_07AF3A

|07AF11| LDA.w $0300
|07AF14| INC A
|07AF15| STA.w $0300

|07AF18| TAX

|07AF19| LDA.w RodAndCaneAnimationTimer,X
|07AF1C| STA.b $3D

|07AF1E| CPX.b #$03
|07AF20| BNE EXIT_07AF3A

;---------------------------------------------------------------------------------------------------

|07AF22| STZ.b $5E
|07AF24| STZ.w $0300

|07AF27| STZ.b $3D
|07AF29| STZ.w $0350

|07AF2C| LDA.b $3A
|07AF2E| AND.b #$BF
|07AF30| STA.b $3A

|07AF32| LDA.w $037A
|07AF35| AND.b #$F7
|07AF37| STA.w $037A

;---------------------------------------------------------------------------------------------------

#EXIT_07AF3A:
|07AF3A| RTS

;===================================================================================================

ByrnaAnimationTimers:
|07AF3B| db 19
|07AF3C| db  7
|07AF3D| db 13

;===================================================================================================

LinkItem_CaneOfByrna:
|07AF3E| JSR SearchForByrnaSpark
|07AF41| BCS EXIT_07AF3A

|07AF43| BIT.b $3A
|07AF45| BVS .in_action

|07AF47| LDA.b $6C
|07AF49| BNE EXIT_07AF3A

|07AF4B| JSR TestYButton
|07AF4E| BCC EXIT_07AF3A

;---------------------------------------------------------------------------------------------------

|07AF50| LDX.b #$08
|07AF52| JSR CheckMagicCost
|07AF55| BCC .lack_magic

|07AF57| LDY.b #$00
|07AF59| LDA.b #$30 ; ANCILLA 30
|07AF5B| JSL AncillaAdd_CaneOfByrnaInitSpark

|07AF5F| STZ.b $79

|07AF61| LDA.w ByrnaAnimationTimers
|07AF64| STA.b $3D

|07AF66| STZ.w $030D
|07AF69| STZ.w $0300

|07AF6C| LDA.b #$08
|07AF6E| STA.w $037A

|07AF71| LDA.b #$01
|07AF73| TSB.b $50

|07AF75| STZ.b $2E

;---------------------------------------------------------------------------------------------------

.in_action
|07AF77| JSR HaltLinkWhenUsingItems

|07AF7A| LDA.b $67
|07AF7C| AND.b #$F0
|07AF7E| STA.b $67

|07AF80| DEC.b $3D
|07AF82| BPL EXIT_07AFB4

|07AF84| LDX.w $0300
|07AF87| INX
|07AF88| STX.w $0300

|07AF8B| LDA.w ByrnaAnimationTimers,X
|07AF8E| STA.b $3D

|07AF90| CPX.b #$01
|07AF92| BNE .skip_sfx

|07AF94| PHX

|07AF95| LDA.b #$2A ; SFX3.2A
|07AF97| JSR PlayLinkSFX3Panned

|07AF9A| PLX

.skip_sfx
|07AF9B| CPX.b #$03
|07AF9D| BNE EXIT_07AFB4

;---------------------------------------------------------------------------------------------------

.lack_magic
|07AF9F| STZ.w $030D
|07AFA2| STZ.w $0300

|07AFA5| LDA.b $3A
|07AFA7| AND.b #$80
|07AFA9| STA.b $3A

|07AFAB| STZ.w $037A

|07AFAE| LDA.b $50
|07AFB0| AND.b #$FE
|07AFB2| STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07AFB4:
|07AFB4| RTS

;===================================================================================================

SearchForByrnaSpark:
|07AFB5| LDA.w $037A
|07AFB8| AND.b #$08
|07AFBA| BNE .cane_not_equipped

|07AFBC| LDX.b #$04

.next
|07AFBE| LDA.w $0C4A,X
|07AFC1| CMP.b #$31 ; ANCILLA 31
|07AFC3| BEQ .found_spark

|07AFC5| DEX
|07AFC6| BPL .next

;---------------------------------------------------------------------------------------------------

.cane_not_equipped
|07AFC8| CLC

|07AFC9| RTS

.found_spark
|07AFCA| SEC

|07AFCB| RTS

;===================================================================================================

pool LinkItem_Net

.pose_id
|07AFCC| db $0B, $06, $07, $08, $01, $02, $03, $04, $05, $06 ; up
|07AFD6| db $01, $02, $03, $04, $05, $06, $07, $08, $01, $02 ; down
|07AFE0| db $09, $04, $05, $06, $07, $08, $01, $02, $03, $04 ; left
|07AFEA| db $0A, $08, $01, $02, $03, $04, $05, $06, $07, $08 ; right

.pose_offset
|07AFF4| db $00 ; up
|07AFF5| db $0A ; down
|07AFF6| db $14 ; left
|07AFF7| db $1E ; right

endpool

;===================================================================================================

LinkItem_Net:
|07AFF8| BIT.b $3A
|07AFFA| BVS .in_action

|07AFFC| LDA.b $6C
|07AFFE| BNE EXIT_07AFB4

|07B000| JSR TestYButton
|07B003| BCC EXIT_07AFB4

;---------------------------------------------------------------------------------------------------

|07B005| LDA.b $2F
|07B007| LSR A
|07B008| TAY

|07B009| LDX.w .pose_offset,Y
|07B00C| LDA.w .pose_id,X
|07B00F| STA.w $0300

|07B012| LDA.b #$03
|07B014| STA.b $3D

|07B016| STZ.w $030D

|07B019| LDA.b #$10
|07B01B| STA.w $037A

|07B01E| LDA.b #$01
|07B020| TSB.b $50

|07B022| STZ.b $2E

|07B024| LDA.b #$32 ; SFX2.32
|07B026| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.in_action
|07B029| JSR HaltLinkWhenUsingItems

|07B02C| LDA.b $67
|07B02E| AND.b #$F0
|07B030| STA.b $67

|07B032| DEC.b $3D
|07B034| BPL .exit

;---------------------------------------------------------------------------------------------------

|07B036| LDX.w $030D
|07B039| INX
|07B03A| STX.w $030D

|07B03D| LDA.b #$03
|07B03F| STA.b $3D

|07B041| LDA.b $2F
|07B043| LSR A
|07B044| TAY

|07B045| LDA.w .pose_offset,Y
|07B048| CLC
|07B049| ADC.w $030D
|07B04C| TAY

|07B04D| LDA.w .pose_id,Y
|07B050| STA.w $0300

|07B053| CPX.b #$0A
|07B055| BNE .exit

;---------------------------------------------------------------------------------------------------

|07B057| STZ.w $030D
|07B05A| STZ.w $0300

|07B05D| LDA.b $3A
|07B05F| AND.b #$80
|07B061| STA.b $3A

|07B063| STZ.w $037A

|07B066| LDA.b $50
|07B068| AND.b #$FE
|07B06A| STA.b $50

|07B06C| LDA.b #$80
|07B06E| STA.b $44
|07B070| STA.b $45

.exit
|07B072| RTS

;===================================================================================================

TestYButton:
|07B073| BIT.b $3A
|07B075| BVS .fail

|07B077| LDA.b $46
|07B079| BNE .fail

;===================================================================================================

#TestYButton_unfiltered:
|07B07B| LDA.b $F4
|07B07D| AND.b #$40
|07B07F| BEQ .fail

|07B081| TSB.b $3A

|07B083| SEC

|07B084| RTS

.fail
|07B085| CLC

|07B086| RTS

;===================================================================================================

ItemMagicCost:

.cost
|07B087| db $10, $08, $04 ; rod
|07B08A| db $20, $10, $08 ; medallion
|07B08D| db $08, $04, $02 ; powder
|07B090| db $08, $04, $02
|07B093| db $08, $04, $02 ; somaria
|07B096| db $10, $08, $04
|07B099| db $04, $02, $02 ; lamp
|07B09C| db $08, $04, $02
|07B09F| db $10, $08, $04 ; byrna

.offset
|07B0A2| db $00 ; rod
|07B0A3| db $03 ; medallion
|07B0A4| db $06 ; powder
|07B0A5| db $09
|07B0A6| db $0C ; somaria
|07B0A7| db $0F
|07B0A8| db $12 ; lamp
|07B0A9| db $15
|07B0AA| db $18 ; byrna

;===================================================================================================

CheckMagicCost:
|07B0AB| STX.b $02

|07B0AD| LDA.w ItemMagicCost.offset,X
|07B0B0| CLC
|07B0B1| ADC.l $7EF37B
|07B0B5| TAX

|07B0B6| LDA.w ItemMagicCost.cost,X
|07B0B9| STA.b $00

|07B0BB| LDA.l $7EF36E
|07B0BF| BEQ .not_enough_magic

|07B0C1| SEC
|07B0C2| SBC.b $00
|07B0C4| CMP.b #$80
|07B0C6| BCS .not_enough_magic

|07B0C8| STA.l $7EF36E

|07B0CC| SEC

|07B0CD| RTS

;---------------------------------------------------------------------------------------------------

.not_enough_magic
|07B0CE| LDA.b $02
|07B0D0| CMP.b #$03
|07B0D2| BEQ .fail

;---------------------------------------------------------------------------------------------------

#DisplayNoMagicMessage:
|07B0D4| LDA.b #$3C ; SFX2.3C
|07B0D6| JSR PlayLinkSFX2Panned

|07B0D9| REP #$20

|07B0DB| LDA.w #$007B ; MESSAGE 007B
|07B0DE| STA.w $1CF0

|07B0E1| SEP #$20

|07B0E3| JSL PrepAndDisplayMessage

.fail
|07B0E7| CLC

|07B0E8| RTS

;===================================================================================================

RefundMagic:
|07B0E9| PHB
|07B0EA| PHK
|07B0EB| PLB

|07B0EC| LDA.w ItemMagicCost.offset,X
|07B0EF| CLC
|07B0F0| ADC.l $7EF37B
|07B0F4| TAX

|07B0F5| LDA.w ItemMagicCost.cost,X
|07B0F8| STA.b $00

|07B0FA| LDA.l $7EF36E
|07B0FE| CLC
|07B0FF| ADC.b $00
|07B101| STA.l $7EF36E

|07B105| PLB

|07B106| RTL

;===================================================================================================

ResetBasicActions:
|07B107| STZ.w $030A

|07B10A| STZ.b $3B

|07B10C| STZ.w $0308
|07B10F| STZ.w $0309
|07B112| STZ.w $0376

|07B115| LDA.b $50
|07B117| AND.b #$FE
|07B119| STA.b $50

|07B11B| RTL

;===================================================================================================

PerformThrow:
|07B11C| LDA.w $0314
|07B11F| ORA.w $02EC
|07B122| BNE .actually_lifting

|07B124| JSR ResetSwordAndItemUsage

|07B127| STZ.b $3B

;---------------------------------------------------------------------------------------------------

|07B129| LDX.b #$0F

.next_sprite
|07B12B| LDA.w $0DD0,X
|07B12E| BEQ .free_spot

|07B130| DEX
|07B131| BPL .next_sprite

|07B133| BRA .bounce_to_exit

;---------------------------------------------------------------------------------------------------

.free_spot
|07B135| LDA.w $0368
|07B138| CMP.b #$05
|07B13A| BEQ .big_rock

|07B13C| CMP.b #$06
|07B13E| BNE .not_big_rock

.big_rock
|07B140| LDA.b #$01
|07B142| STA.w $0300

|07B145| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.not_big_rock
|07B147| LDA.b $1B
|07B149| BEQ .outdoors

|07B14B| JSL HandleUnderworldLiftables

|07B14F| BRA .continue_b

.outdoors
|07B151| JSL HandleOverworldLiftables

;---------------------------------------------------------------------------------------------------

.continue_b
|07B155| LDX.b #$08

.next_a
|07B157| CMP.w LinkToss.liftable_tiles,X
|07B15A| BEQ .matched

|07B15C| DEX
|07B15D| BPL .next_a

;---------------------------------------------------------------------------------------------------

.bounce_to_exit
|07B15F| BRL EXIT_07B280

;---------------------------------------------------------------------------------------------------

.matched
|07B162| LDA.b #$01
|07B164| STA.w $0314

|07B167| TXA
|07B168| JSL SpawnThrowableTerrain

|07B16C| ASL.b $F6
|07B16E| LSR.b $F6

.actually_lifting
|07B170| STZ.w $0300

.continue_a
|07B173| STZ.b $3A

|07B175| LDA.w LinkToss.timer_a
|07B178| STA.w $030B

|07B17B| LDA.b #$01
|07B17D| STA.w $0309

|07B180| LDA.b #$80
|07B182| STA.w $0308

|07B185| STZ.w $030A

|07B188| LDA.b #$0C
|07B18A| STA.b $5E

|07B18C| STZ.b $2E

|07B18E| LDA.b $67
|07B190| AND.b #$F0
|07B192| STA.b $67

|07B194| LDA.b #$01
|07B196| TSB.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07B198:
|07B198| RTS

;===================================================================================================

pool LinkToss

.timer_a
|07B199| db $06, $07, $07

.timer_b
|07B19C| db $05

|07B19D| dw $000A, $0017, $0012, $0012
|07B1A5| dw $0008, $0008, $FFFE, $0011

.liftable_tiles
|07B1AD| db $54, $52, $50, $FF
|07B1B1| db $51, $53, $55, $56
|07B1B5| db $57

.heavy_lift_animation_timers
|07B1B6| db   8,  24,   8,  24
|07B1BA| db   8,  32,   6,   8
|07B1BE| db  13,  13

.heavy_lift_animation_steps
|07B1C0| db $00, $01, $00, $01
|07B1C4| db $00, $01, $00, $01
|07B1C8| db $02, $03

endpool

;===================================================================================================

HandleDO_LiftCarryThrow:
|07B1CA| LDA.w $0308
|07B1CD| BEQ EXIT_07B198

|07B1CF| LDA.w $0309
|07B1D2| AND.b #$02
|07B1D4| BEQ .dont_toss

|07B1D6| LDA.w $030B
|07B1D9| CMP.b #$05
|07B1DB| BCC .dont_toss

|07B1DD| LDA.w LinkToss.timer_b
|07B1E0| STA.w $030B

.dont_toss
|07B1E3| LDA.w $0309
|07B1E6| BEQ .skip_collision

|07B1E8| JSR HaltLinkWhenUsingItems

.skip_collision
|07B1EB| LDA.w $0309
|07B1EE| AND.b #$01
|07B1F0| BEQ .dont_reset_anim

|07B1F2| STZ.b $2E
|07B1F4| STZ.b $2D

|07B1F6| LDA.b $67
|07B1F8| AND.b #$F0
|07B1FA| STA.b $67

.dont_reset_anim
|07B1FC| DEC.w $030B

|07B1FF| LDA.w $030B
|07B202| BNE EXIT_07B198

|07B204| LDA.w $0309
|07B207| AND.b #$02
|07B209| BEQ .dont_try_to_reset_strafe

|07B20B| STZ.w $0308
|07B20E| STZ.b $48
|07B210| STZ.b $5E

|07B212| LDA.b $5D
|07B214| CMP.b #$18 ; LINKSTATE 18
|07B216| BNE .reset_dirlock

|07B218| LDA.b #$00 ; LINKSTATE 00
|07B21A| STA.b $5D

|07B21C| BRL .reset_dirlock

.dont_try_to_reset_strafe
|07B21F| LDA.w $0300
|07B222| BEQ .not_doing_heavy_lift

|07B224| INC A
|07B225| CMP.b #$09
|07B227| BEQ .reset_dirlock

|07B229| STA.w $0300

|07B22C| TAX

|07B22D| LDA.w LinkToss.heavy_lift_animation_timers,X
|07B230| STA.w $030B

|07B233| LDA.w LinkToss.heavy_lift_animation_steps,X
|07B236| STA.w $030A

|07B239| CPX.b #$06
|07B23B| BNE EXIT_07B280

|07B23D| STZ.w $0B9C

|07B240| LDA.b $1B
|07B242| BEQ .throwing_out_doors

|07B244| JSL HandleUnderworldLiftables

|07B248| BRA .continue_indoors

.throwing_out_doors
|07B24A| JSL HandleOverworldLiftables

;---------------------------------------------------------------------------------------------------

.continue_indoors
|07B24E| AND.b #$0F
|07B250| INC A
|07B251| PHA

|07B252| LDA.b #$18 ; LINKSTATE 18
|07B254| STA.b $5D

|07B256| LDA.b #$01
|07B258| STA.w $0314

|07B25B| PLA
|07B25C| JSL SpawnThrowableTerrain

|07B260| ASL.b $F6
|07B262| LSR.b $F6

|07B264| BRA EXIT_07B280

;---------------------------------------------------------------------------------------------------

.not_doing_heavy_lift
|07B266| LDX.w $030A
|07B269| INX

|07B26A| LDA.w LinkToss.timer_a,X
|07B26D| STA.w $030B

|07B270| STX.w $030A

|07B273| CPX.b #$03
|07B275| BNE EXIT_07B280

;---------------------------------------------------------------------------------------------------

.reset_dirlock
|07B277| STZ.w $0309

|07B27A| LDA.b $50
|07B27C| AND.b #$FE
|07B27E| STA.b $50

;---------------------------------------------------------------------------------------------------

#EXIT_07B280:
|07B280| RTS

;===================================================================================================

PerformDash:
|07B281| LDA.w $02F5
|07B284| BNE EXIT_07B280

|07B286| LDA.w $0314
|07B289| ORA.w $02EC
|07B28C| BNE EXIT_07B280

|07B28E| BIT.w $0308
|07B291| BMI EXIT_07B280

|07B293| LDA.b $1B
|07B295| BNE .pointless_branch

.pointless_branch
|07B297| STZ.b $3B

|07B299| LDA.b #$1D
|07B29B| STA.w $0374

|07B29E| LDA.b #$40
|07B2A0| STA.w $02F1

|07B2A3| LDA.b #$11 ; LINKSTATE 11
|07B2A5| STA.b $5D

|07B2A7| LDA.b #$01
|07B2A9| STA.w $0372

|07B2AC| LDA.b $3A
|07B2AE| AND.b #$80
|07B2B0| STA.b $3A

|07B2B2| STZ.w $0308
|07B2B5| STZ.w $0301

|07B2B8| STZ.b $48
|07B2BA| STZ.b $6B

;---------------------------------------------------------------------------------------------------

|07B2BC| LDA.l $7EF3CC
|07B2C0| TAX

|07B2C1| CMP.w FollowerReactionToDashing,X
|07B2C4| BNE EXIT_07B2ED

|07B2C6| STZ.b $5E

|07B2C8| LDX.w $02CF

|07B2CB| LDA.w $1A00,X
|07B2CE| STA.w $7EF3CD

|07B2D1| LDA.w $1A14,X
|07B2D4| STA.w $7EF3CE

|07B2D7| LDA.w $1A28,X
|07B2DA| STA.w $7EF3CF

|07B2DD| LDA.w $1A3C,X
|07B2E0| STA.w $7EF3D0

|07B2E3| LDA.b $EE
|07B2E5| STA.w $7EF3D2

|07B2E8| LDA.b #$40
|07B2EA| STA.w $02D2

;---------------------------------------------------------------------------------------------------

#EXIT_07B2ED:
|07B2ED| RTS

;===================================================================================================

PerformGrab:
|07B2EE| LDA.b $3A
|07B2F0| AND.b #$80
|07B2F2| BEQ .no_press

|07B2F4| LDA.b $3C
|07B2F6| CMP.b #$09
|07B2F8| BCS EXIT_07B2ED

.no_press
|07B2FA| LDA.b #$01
|07B2FC| STA.w $0376

|07B2FF| TSB.b $50

|07B301| STZ.b $2E
|07B303| STZ.w $030A

|07B306| LDA.w LinkStrain.timer

|07B309| STA.w $030B
|07B30C| STZ.w $030D

|07B30F| RTS

;===================================================================================================

LinkPull_Directions:
|07B310| db $04
|07B311| db $08
|07B312| db $01
|07B313| db $02

;===================================================================================================

LinkStrain:
.timer
|07B314| db   0,   5,   5,  12,   5,   5,  12

.char
|07B31B| db $00, $01, $02, $03, $01, $02, $03

;===================================================================================================

HandleDO_PullObject:
|07B322| LDA.b $67
|07B324| AND.b #$F0
|07B326| STA.b $67

|07B328| LDA.b $2F
|07B32A| LSR A
|07B32B| TAX

|07B32C| LDA.b $F0
|07B32E| AND.b #$0F
|07B330| BEQ .no_dpad

|07B332| AND.w LinkPull_Directions,X
|07B335| BNE .tick_timer

.no_dpad
|07B337| LDX.b #$00
|07B339| BRA .set_strain_index

;---------------------------------------------------------------------------------------------------

.tick_timer
|07B33B| DEC.w $030B
|07B33E| BPL .timer_running

;---------------------------------------------------------------------------------------------------

|07B340| LDX.w $030D
|07B343| INX
|07B344| CPX.b #$07
|07B346| BNE .set_strain_index

|07B348| LDX.b #$01

.set_strain_index
|07B34A| STX.w $030D

|07B34D| LDA.w LinkStrain.char,X
|07B350| STA.w $030A

|07B353| LDA.w LinkStrain.timer,X
|07B356| STA.w $030B

;---------------------------------------------------------------------------------------------------

.timer_running
|07B359| LDA.b $F2
|07B35B| AND.b #$80
|07B35D| BNE .exit

|07B35F| STZ.w $030D
|07B362| STZ.w $030A

|07B365| STZ.w $0376

|07B368| STZ.b $3B

|07B36A| LDA.b $50
|07B36C| AND.b #$FE
|07B36E| STA.b $50

.exit
|07B370| RTS

;===================================================================================================

PerformStatueDrag:
|07B371| LDA.b #$02
|07B373| STA.w $0376

|07B376| LDA.b #$01
|07B378| TSB.b $50

|07B37A| STZ.b $2E
|07B37C| STZ.w $030A

|07B37F| LDA.w LinkStrain.timer
|07B382| STA.w $030B
|07B385| STZ.w $030D

|07B388| RTS

;===================================================================================================

HandleDO_StatueDrag:
|07B389| LDA.b #$14
|07B38B| STA.b $5E

|07B38D| LDA.b $2F
|07B38F| LSR A
|07B390| TAX

|07B391| LDA.b $F0
|07B393| AND.b #$0F
|07B395| BEQ .halted

|07B397| AND.w LinkPull_Directions,X
|07B39A| BNE .dragging

;---------------------------------------------------------------------------------------------------

.halted
|07B39C| STZ.b $67

|07B39E| STZ.b $30
|07B3A0| STZ.b $31
|07B3A2| STZ.b $2E

|07B3A4| LDX.b #$00
|07B3A6| BRA .set_strain_index

;---------------------------------------------------------------------------------------------------

.dragging
|07B3A8| STA.b $67

|07B3AA| DEC.w $030B
|07B3AD| BPL .delay

|07B3AF| LDX.w $030D
|07B3B2| INX
|07B3B3| CPX.b #$07
|07B3B5| BNE .set_strain_index

|07B3B7| LDX.b #$01

;---------------------------------------------------------------------------------------------------

.set_strain_index
|07B3B9| STX.w $030D

|07B3BC| LDA.w LinkStrain.char,X
|07B3BF| STA.w $030A

|07B3C2| LDA.w LinkStrain.timer,X
|07B3C5| STA.w $030B

;---------------------------------------------------------------------------------------------------

.delay
|07B3C8| LDA.b $F2
|07B3CA| AND.b #$80
|07B3CC| BNE .exit

|07B3CE| STZ.b $5E

|07B3D0| STZ.w $02FA

|07B3D3| STZ.w $030D
|07B3D6| STZ.w $030A

|07B3D9| STZ.w $0376

|07B3DC| STZ.b $3B

|07B3DE| LDA.b $50
|07B3E0| AND.b #$FE
|07B3E2| STA.b $50

.exit
|07B3E4| RTS

;===================================================================================================

PerformRupeePull:
|07B3E5| LDA.b $2F
|07B3E7| BNE EXIT_07B40C

|07B3E9| JSL ResetLinkProperties_A

|07B3ED| LDA.b #$02
|07B3EF| STA.w $0376

|07B3F2| TSB.b $50

|07B3F4| STZ.b $2E
|07B3F6| STZ.w $030A

|07B3F9| LDA.w LinkStrain.timer
|07B3FC| STA.w $030B

|07B3FF| STZ.w $030D

|07B402| LDA.b #$1D ; LINKSTATE 1D
|07B404| STA.b $5D

|07B406| STZ.b $27
|07B408| STZ.b $28
|07B40A| STZ.b $3A

;---------------------------------------------------------------------------------------------------

#EXIT_07B40C:
|07B40C| RTS

;===================================================================================================

pool LinkState_TreePull

.step
|07B40D| db $00, $01, $02, $03
|07B411| db $04, $00, $01, $02
|07B415| db $03

endpool

;---------------------------------------------------------------------------------------------------

LinkState_TreePull:
|07B416| JSR CacheCameraPropertiesIfOutdoors

|07B419| LDA.b $4D
|07B41B| BEQ .not_recoiling

|07B41D| BRL HandleLinkFromState1D

;---------------------------------------------------------------------------------------------------

.not_recoiling
|07B420| LDA.w $0376
|07B423| BEQ .strain_adjusted

|07B425| LDA.b $3A
|07B427| BNE .continue

|07B429| BIT.b $F2
|07B42B| BPL .no_a_press

|07B42D| LDA.b $F0
|07B42F| AND.b #$04
|07B431| BEQ .dont_adjust_strain

|07B433| STA.b $3A

|07B435| LDA.b #$22 ; SFX2.22
|07B437| JSR PlayLinkSFX2Panned

|07B43A| BRA .continue

;---------------------------------------------------------------------------------------------------

.no_a_press
|07B43C| STZ.w $0376
|07B43F| STZ.w $030D

|07B442| LDA.b #$02
|07B444| STA.w $030B
|07B447| STZ.w $030A

|07B44A| STZ.b $50

|07B44C| LDA.b #$00 ; LINKSTATE 00
|07B44E| STA.b $5D

|07B450| BRA .reset_state

;---------------------------------------------------------------------------------------------------

.continue
|07B452| DEC.w $030B
|07B455| BPL .dont_adjust_strain

|07B457| INC.w $030D

|07B45A| LDX.w $030D

|07B45D| LDA.w LinkStrain.char,X
|07B460| STA.w $030A

|07B463| LDA.w LinkStrain.timer,X
|07B466| STA.w $030B

|07B469| CPX.b #$07
|07B46B| BNE .dont_adjust_strain

;---------------------------------------------------------------------------------------------------

|07B46D| STZ.w $0376
|07B470| STZ.w $030D

|07B473| LDA.b #$02
|07B475| STA.w $030B
|07B478| STZ.w $030A

|07B47B| LDA.b #$01
|07B47D| STA.w $0308
|07B480| STZ.w $0309

|07B483| BRA .strain_adjusted

;---------------------------------------------------------------------------------------------------

.dont_adjust_strain
|07B485| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.strain_adjusted
|07B487| LDA.b $48
|07B489| AND.b #$09
|07B48B| BNE .reset_direction_and_state

|07B48D| LDA.w $030D
|07B490| CMP.b #$09
|07B492| BNE .add_dust

|07B494| LDA.b $F4
|07B496| AND.b #$0F
|07B498| BEQ .no_new_direction_press

;---------------------------------------------------------------------------------------------------

.reset_state
|07B49A| LDA.b #$00 ; LINKSTATE 00
|07B49C| STA.b $5D

|07B49E| BRL LinkState_Default

;---------------------------------------------------------------------------------------------------

.add_dust
|07B4A1| LDY.b #$00
|07B4A3| LDA.b #$1E ; ANCILLA 1E
|07B4A5| JSL AncillaAdd_DashDust_charging

|07B4A9| DEC.w $030B
|07B4AC| BPL .delay_reset

|07B4AE| INC.w $030D

|07B4B1| LDX.w $030D

|07B4B4| LDA.b #$02
|07B4B6| STA.w $030B

|07B4B9| LDA.w .step,X
|07B4BC| STA.w $030A

|07B4BF| LDA.b #$30
|07B4C1| STA.b $27

|07B4C3| CPX.b #$09

|07B4C5| BNE .delay_reset

;---------------------------------------------------------------------------------------------------

.reset_direction_and_state
|07B4C7| STZ.b $2F
|07B4C9| STZ.w $0308

|07B4CC| STZ.b $50

|07B4CE| LDA.b #$00 ; LINKSTATE 00
|07B4D0| STA.b $5D

|07B4D2| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_reset
|07B4D4| JSR FlagWalkDirections

|07B4D7| LDA.b $67
|07B4D9| AND.b #$03
|07B4DB| BNE .is_horizontal

|07B4DD| STZ.b $28

.is_horizontal
|07B4DF| LDA.b $67
|07B4E1| AND.b #$0C
|07B4E3| BNE .finish_up

|07B4E5| STZ.b $27

;---------------------------------------------------------------------------------------------------

.finish_up
|07B4E7| JSL FindArbitraryLandingSpot

.no_new_direction_press
|07B4EB| JSR HandleLinkCardinalCollision
|07B4EE| JSR HandleIndoorCameraAndDoors

.exit
|07B4F1| RTS

;===================================================================================================

PerformRead:
|07B4F2| REP #$30

|07B4F4| LDA.b $1B
|07B4F6| AND.w #$00FF
|07B4F9| BEQ .overworld

.underworld
|07B4FB| LDA.b $A0
|07B4FD| ASL A
|07B4FE| TAY

|07B4FF| LDA.w SignTextUnderworld,Y
|07B502| BRA .set_message

;---------------------------------------------------------------------------------------------------

.overworld
|07B504| LDA.l $7EF3C5
|07B508| AND.w #$00FF
|07B50B| CMP.w #$0002
|07B50E| BCS .rain_over

|07B510| LDA.w #$003A ; MESSAGE 003A
|07B513| BRA .set_message

;---------------------------------------------------------------------------------------------------

.rain_over
|07B515| LDA.b $8A
|07B517| ASL A
|07B518| TAY

|07B519| LDA.w SignTextOverworld,Y

.set_message
|07B51C| STA.w $1CF0

|07B51F| SEP #$30

|07B521| JSL PrepAndDisplayMessage

|07B525| STZ.b $3B

;---------------------------------------------------------------------------------------------------

#EXIT_07B527:
|07B527| RTS

;===================================================================================================

pool PerformOpenChest

.overflow_replacement
|07B528| db $FF ; FIGHTER SWORD
|07B529| db $FF ; MASTER SWORD
|07B52A| db $FF ; TEMPERED SWORD
|07B52B| db $FF ; BUTTER SWORD
|07B52C| db $FF ; FIGHTER SHIELD
|07B52D| db $FF ; FIRE SHIELD
|07B52E| db $FF ; MIRROR SHIELD
|07B52F| db $FF ; FIRE ROD
|07B530| db $FF ; ICE ROD
|07B531| db $FF ; HAMMER
|07B532| db $FF ; HOOKSHOT
|07B533| db $FF ; BOW
|07B534| db $44 ; BOOMERANG => 10 arrows (ITEMGET 44)
|07B535| db $FF ; POWDER
|07B536| db $FF ; BOTTLE REFILL (BEE)
|07B537| db $FF ; BOMBOS
|07B538| db $FF ; ETHER
|07B539| db $FF ; QUAKE
|07B53A| db $35 ; LAMP => Blue rupee (ITEMGET 35)
|07B53B| db $FF ; SHOVEL
|07B53C| db $FF ; FLUTE
|07B53D| db $FF ; SOMARIA
|07B53E| db $FF ; BOTTLE
|07B53F| db $FF ; HEART PIECE
|07B540| db $FF ; BYRNA
|07B541| db $FF ; CAPE
|07B542| db $FF ; MIRROR
|07B543| db $FF ; GLOVE
|07B544| db $FF ; MITTS
|07B545| db $FF ; BOOK
|07B546| db $FF ; FLIPPERS
|07B547| db $FF ; PEARL
|07B548| db $FF ; CRYSTAL
|07B549| db $FF ; NET
|07B54A| db $FF ; BLUE MAIL
|07B54B| db $FF ; RED MAIL
|07B54C| db $FF ; SMALL KEY
|07B54D| db $FF ; COMPASS
|07B54E| db $FF ; HEART CONTAINER FROM 4/4
|07B54F| db $FF ; BOMB
|07B550| db $FF ; 3 BOMBS
|07B551| db $FF ; MUSHROOM
|07B552| db $46 ; RED BOOMERANG => 300 rupees (ITEMGET 46)
|07B553| db $FF ; FULL BOTTLE (RED)
|07B554| db $FF ; FULL BOTTLE (GREEN)
|07B555| db $FF ; FULL BOTTLE (BLUE)
|07B556| db $FF ; POTION REFILL (RED)
|07B557| db $FF ; POTION REFILL (GREEN)
|07B558| db $FF ; POTION REFILL (BLUE)
|07B559| db $FF ; 10 BOMBS
|07B55A| db $FF ; BIG KEY
|07B55B| db $FF ; MAP
|07B55C| db $FF ; 1 RUPEE
|07B55D| db $FF ; 5 RUPEES
|07B55E| db $FF ; 20 RUPEES
|07B55F| db $FF ; GREEN PENDANT
|07B560| db $FF ; BLUE PENDANT
|07B561| db $FF ; RED PENDANT
|07B562| db $FF ; TOSSED BOW
|07B563| db $FF ; SILVERS
|07B564| db $FF ; FULL BOTTLE (BEE)
|07B565| db $FF ; FULL BOTTLE (FAIRY)
|07B566| db $FF ; BOSS HC
|07B567| db $FF ; SANC HC
|07B568| db $FF ; 100 RUPEES
|07B569| db $FF ; 50 RUPEES
|07B56A| db $FF ; HEART
|07B56B| db $FF ; ARROW
|07B56C| db $FF ; 10 ARROWS
|07B56D| db $FF ; SMALL MAGIC
|07B56E| db $FF ; 300 RUPEES
|07B56F| db $FF ; 20 RUPEES GREEN
|07B570| db $FF ; FULL BOTTLE (GOOD BEE)
|07B571| db $FF ; TOSSED FIGHTER SWORD
|07B572| db $FF ; FLUTE (ACTIVATED)
|07B573| db $FF ; BOOTS

endpool

;---------------------------------------------------------------------------------------------------

PerformOpenChest:
|07B574| LDA.b $2F
|07B576| BNE EXIT_07B5BF

|07B578| LDA.w $02E9
|07B57B| BNE EXIT_07B5BF

|07B57D| LDA.b $4D
|07B57F| BNE EXIT_07B5BF

|07B581| STZ.b $3B

|07B583| LDA.b $76
|07B585| JSL OpenChestForItem
|07B589| BCC .failed_to_open

|07B58B| LDA.b #$01
|07B58D| STA.w $02E9

|07B590| LDY.b $0C
|07B592| BMI .failed_to_open

|07B594| LDA.w .overflow_replacement,Y
|07B597| STA.b $03

|07B599| CMP.b #$FF
|07B59B| BEQ .no_replacement

|07B59D| TYA
|07B59E| ASL A
|07B59F| TAX

|07B5A0| LDA.l AncillaAdd_ItemReceipt.sram_write+0,X
|07B5A4| STA.b $00

|07B5A6| LDA.l AncillaAdd_ItemReceipt.sram_write+1,X
|07B5AA| STA.b $01

|07B5AC| LDA.b #$7E
|07B5AE| STA.b $02

|07B5B0| LDA.b [$00]
|07B5B2| BEQ .no_replacement

|07B5B4| LDY.b $03

.no_replacement
|07B5B6| JSL GrantItemReceipt

|07B5BA| BRA EXIT_07B5BF

.failed_to_open
|07B5BC| STZ.w $02E9

;---------------------------------------------------------------------------------------------------

#EXIT_07B5BF:
|07B5BF| RTS

;===================================================================================================

TestAButton:
|07B5C0| LDA.b $3B
|07B5C2| AND.b #$80
|07B5C4| BNE .fail

|07B5C6| LDA.b $46
|07B5C8| BNE .fail

|07B5CA| LDA.b $F6
|07B5CC| AND.b #$80
|07B5CE| BEQ .fail

|07B5D0| TSB.b $3B

|07B5D2| SEC

|07B5D3| RTS

.fail
|07B5D4| CLC

|07B5D5| RTS

;===================================================================================================

HandleTossing:
|07B5D6| LDA.b $3B
|07B5D8| AND.b #$80
|07B5DA| BEQ .unpressed

|07B5DC| LDA.b $F6
|07B5DE| AND.b #$80
|07B5E0| BEQ .unpressed

|07B5E2| LDA.w $0309
|07B5E5| AND.b #$01
|07B5E7| BNE .unpressed

|07B5E9| STZ.w $030D ; reset grab
|07B5EC| STZ.w $030E
|07B5EF| STZ.w $030A

|07B5F2| STZ.b $3B

|07B5F4| LDA.b $50
|07B5F6| AND.b #$FE
|07B5F8| STA.b $50

|07B5FA| LDA.w $0305
|07B5FD| CMP.b #$01
|07B5FF| BNE .leave_windows

|07B601| STZ.b $1E
|07B603| STZ.b $1F

.leave_windows
|07B605| SEC

|07B606| RTS

.unpressed
|07B607| CLC

|07B608| RTS

;===================================================================================================

UNREACHABLE_07B609:
|07B609| LDA.b $F2
|07B60B| AND.b #$10
|07B60D| BNE .r_held

|07B60F| STZ.b $3B

.r_held
|07B611| BIT.b $F0
|07B613| BMI .a_held

|07B615| LDA.b $3A
|07B617| AND.b #$DF
|07B619| STA.b $3A

.a_held
|07B61B| LDA.b $3B
|07B61D| AND.b #$10
|07B61F| STA.b $00

|07B621| LDA.b $3A
|07B623| AND.b #$A0
|07B625| ORA.b $00
|07B627| AND.b #$B0
|07B629| CMP.b #$30
|07B62B| BEQ .fail

|07B62D| CMP.b #$90
|07B62F| BEQ .fail

|07B631| LDA.b $F2
|07B633| AND.b #$10
|07B635| BEQ .fail

|07B637| STA.b $00

|07B639| LDA.b $F0
|07B63B| AND.b #$80
|07B63D| BEQ .fail

|07B63F| LSR A
|07B640| LSR A
|07B641| STA.b $3A

|07B643| LDA.b $00
|07B645| TSB.b $3B

|07B647| SEC

|07B648| RTS

.fail
|07B649| CLC

|07B64A| RTS

;===================================================================================================

StoppedFlags:
|07B64B| db $07
|07B64C| db $0B
|07B64D| db $0D
|07B64E| db $0E

;---------------------------------------------------------------------------------------------------

HandleLinkDiagonalCollision:
|07B64F| JSR CheckIfRoomNeedsDoubleLayerCheck
|07B652| BCC .no_layer_change

|07B654| JSR FlagObstructions
|07B657| JSR CreateVelocityFromMovingBackground

.no_layer_change
|07B65A| LDA.b $67
|07B65C| AND.b #$0F
|07B65E| STA.b $67

;===================================================================================================

FlagObstructions:
|07B660| LDA.b #$0F
|07B662| STA.b $42
|07B664| STA.b $43

|07B666| STZ.b $6A

|07B668| LDA.b $67
|07B66A| AND.b #$0C
|07B66C| BNE FlagObstructions_vertical_component

|07B66E| BRL UpdateDiagonalMovementFlags

;===================================================================================================

FlagObstructions_vertical_component:
|07B671| INC.b $6A

|07B673| LDY.b #$00

|07B675| AND.b #$08
|07B677| BNE .walking_up

|07B679| LDY.b #$02

.walking_up
|07B67B| TYA
|07B67C| LSR A
|07B67D| STA.b $66

|07B67F| JSR TileDetectOnMovement_VerticalSlopes

|07B682| LDA.b $0E
|07B684| AND.b #$30
|07B686| BEQ .no_obstruction

|07B688| LDA.b $62
|07B68A| AND.b #$02
|07B68C| BNE .no_obstruction

|07B68E| LDA.b $0E
|07B690| AND.b #$30
|07B692| LSR A
|07B693| LSR A
|07B694| LSR A
|07B695| LSR A
|07B696| AND.b $67
|07B698| BNE .no_obstruction

|07B69A| LDY.b #$02

|07B69C| LDA.b $67
|07B69E| AND.b #$03
|07B6A0| BEQ .no_obstruction

|07B6A2| AND.b #$02
|07B6A4| BNE .going_diagonal

|07B6A6| LDY.b #$03
|07B6A8| BRA .going_diagonal

.no_obstruction
|07B6AA| LDA.w $046C
|07B6AD| BEQ .no_layer_junk

|07B6AF| LDA.b $0E
|07B6B1| AND.b #$03
|07B6B3| BNE .dont_use_last_direction_yet
|07B6B5| BRA FlagObstructions_horizontal_component

.no_layer_junk
|07B6B7| LDA.b $4D
|07B6B9| BEQ .dont_use_last_direction_yet

|07B6BB| LDA.b $0C
|07B6BD| AND.b #$03
|07B6BF| BEQ .dont_use_last_direction_yet
|07B6C1| BRA .flag_based_on_last_direction

.dont_use_last_direction_yet
|07B6C3| LDA.b $0E
|07B6C5| AND.b #$03
|07B6C7| BEQ FlagObstructions_horizontal_component

|07B6C9| STZ.b $6B

|07B6CB| LDA.w $034A
|07B6CE| BEQ .flag_based_on_last_direction

|07B6D0| LDA.w $02E8
|07B6D3| AND.b #$03
|07B6D5| BNE .flag_based_on_last_direction

|07B6D7| LDA.b $67
|07B6D9| AND.b #$03
|07B6DB| BEQ .flag_based_on_last_direction

|07B6DD| STZ.w $033C
|07B6E0| STZ.w $033D
|07B6E3| STZ.w $032F
|07B6E6| STZ.w $0330
|07B6E9| STZ.w $032B
|07B6EC| STZ.w $032C
|07B6EF| STZ.w $0334
|07B6F2| STZ.w $0335

.flag_based_on_last_direction
|07B6F5| LDA.b #$01
|07B6F7| STA.w $0302

|07B6FA| LDY.b $66

.going_diagonal
|07B6FC| LDA.w StoppedFlags,Y
|07B6FF| STA.b $42

;===================================================================================================

FlagObstructions_horizontal_component:
|07B701| LDA.b $67
|07B703| AND.b #$03
|07B705| BNE .moving_horizontally

|07B707| BRL UpdateDiagonalMovementFlags

.moving_horizontally
|07B70A| INC.b $6A

|07B70C| LDY.b #$04
|07B70E| AND.b #$02
|07B710| BNE .moving_left

|07B712| LDY.b #$06

.moving_left
|07B714| TYA
|07B715| LSR A
|07B716| STA.b $66

|07B718| JSR TileDetectOnMovement_HorizontalSlopes

|07B71B| LDA.b $0E
|07B71D| AND.b #$30
|07B71F| BEQ .no_obstruction

|07B721| LDA.b $62
|07B723| AND.b #$02
|07B725| BEQ .no_obstruction

|07B727| LDA.b $0E
|07B729| AND.b #$30
|07B72B| LSR A
|07B72C| LSR A
|07B72D| AND.b $67
|07B72F| BNE .no_obstruction

|07B731| LDY.b #$00

|07B733| LDA.b $67
|07B735| AND.b #$0C
|07B737| BEQ .no_obstruction

|07B739| AND.b #$08
|07B73B| BNE .going_diagonal

|07B73D| LDY.b #$01
|07B73F| BRA .going_diagonal

.no_obstruction
|07B741| LDA.w $046C
|07B744| BEQ .no_layer_junk

|07B746| LDA.b $0E
|07B748| AND.b #$03
|07B74A| BNE .dont_use_last_direction_yet
|07B74C| BRA .adjust_move_flags_with_obstruction

.no_layer_junk
|07B74E| LDA.b $4D
|07B750| BEQ .dont_use_last_direction_yet

|07B752| LDA.b $0C
|07B754| AND.b #$03
|07B756| BEQ .dont_use_last_direction_yet
|07B758| BRA .flag_based_on_last_direction

.dont_use_last_direction_yet
|07B75A| LDA.b $0E
|07B75C| AND.b #$03
|07B75E| BEQ .adjust_move_flags_with_obstruction

|07B760| STZ.b $6B

|07B762| LDA.w $034A
|07B765| BEQ .flag_based_on_last_direction

|07B767| LDA.w $02E8
|07B76A| AND.b #$03
|07B76C| BNE .flag_based_on_last_direction

|07B76E| LDA.b $67
|07B770| AND.b #$0C
|07B772| BEQ .flag_based_on_last_direction

|07B774| STZ.w $033E
|07B777| STZ.w $033F
|07B77A| STZ.w $0331
|07B77D| STZ.w $0332
|07B780| STZ.w $032D
|07B783| STZ.w $032E
|07B786| STZ.w $0336
|07B789| STZ.w $0337

.flag_based_on_last_direction
|07B78C| LDA.b #$01
|07B78E| STA.w $0302

|07B791| LDY.b $66

.going_diagonal
|07B793| LDA.w StoppedFlags,Y
|07B796| STA.b $43

.adjust_move_flags_with_obstruction
|07B798| LDA.b $67
|07B79A| AND.b $42
|07B79C| AND.b $43
|07B79E| STA.b $67

;===================================================================================================

UpdateDiagonalMovementFlags:
|07B7A0| LDA.b $67
|07B7A2| AND.b #$0F
|07B7A4| BEQ .dont_update_direction

|07B7A6| LDA.b $6B
|07B7A8| AND.b #$0F
|07B7AA| BEQ .dont_update_direction

|07B7AC| STA.b $67

.dont_update_direction
|07B7AE| LDA.b $6A

|07B7B0| STZ.b $6A

|07B7B2| CMP.b #$02
|07B7B4| BNE .exit

|07B7B6| LDY.b #$01

|07B7B8| LDA.b $2F
|07B7BA| AND.b #$04
|07B7BC| BEQ .not_facing_left

|07B7BE| LDY.b #$02

.not_facing_left
|07B7C0| STY.b $6A

.exit
|07B7C2| RTS

;===================================================================================================

AutoMove49Directions:
|07B7C3| db $08
|07B7C4| db $04
|07B7C5| db $02
|07B7C6| db $01

;===================================================================================================

HandleLinkCardinalCollision:
|07B7C7| STZ.b $6E
|07B7C9| STZ.b $38

|07B7CB| LDA.b $6B
|07B7CD| AND.b #$30
|07B7CF| BNE .no_kickback

|07B7D1| JSR HandleLinkDiagonalKickback

|07B7D4| LDA.b $6D
|07B7D6| BEQ .no_kickback

|07B7D8| BRL CheckCollisionSingleLayerRun

;---------------------------------------------------------------------------------------------------

.no_kickback
|07B7DB| JSR CheckIfRoomNeedsDoubleLayerCheck
|07B7DE| BCC CheckCollisionSingleLayerRun

|07B7E0| LDA.w $046C
|07B7E3| CMP.b #$02
|07B7E5| BCC .run_vertical_first

|07B7E7| LDA.w $046C
|07B7EA| CMP.b #$03
|07B7EC| BEQ .run_vertical_first

|07B7EE| LDA.b #$02
|07B7F0| STA.w $0315

|07B7F3| REP #$20

|07B7F5| JSR TileDetect_BigArea

|07B7F8| SEP #$20

|07B7FA| LDA.b $0E
|07B7FC| STA.w $0316
|07B7FF| BEQ .run_vertical_first

|07B801| LDA.b $30
|07B803| STA.b $00

|07B805| CLC
|07B806| ADC.w $0310
|07B809| STA.b $30

|07B80B| LDA.b $31
|07B80D| STA.b $01

|07B80F| CLC
|07B810| ADC.w $0312
|07B813| STA.b $31

|07B815| LDA.b $0E
|07B817| CMP.b #$0C
|07B819| BEQ .run_vertical_first

|07B81B| CMP.b #$03
|07B81D| BEQ .run_vertical_first

|07B81F| CMP.b #$0A
|07B821| BEQ .run_horizontal_first

|07B823| CMP.b #$05
|07B825| BEQ .run_horizontal_first

|07B827| AND.b #$0C
|07B829| BNE .detected_on_axis

|07B82B| LDA.b $0E
|07B82D| AND.b #$03
|07B82F| BNE .detected_on_axis

|07B831| BRA .run_vertical_first

.detected_on_axis
|07B833| LDA.b $00
|07B835| BNE .run_horizontal_first

|07B837| LDA.b $01
|07B839| BEQ .run_vertical_first

|07B83B| LDA.w $0310
|07B83E| BPL .run_horizontal_first

.run_vertical_first
|07B840| JSR RunSlopeCollisionChecks_VerticalFirst
|07B843| BRA .continue

.run_horizontal_first
|07B845| JSR RunSlopeCollisionChecks_HorizontalFirst

.continue
|07B848| JSR CreateVelocityFromMovingBackground

;===================================================================================================

CheckCollisionSingleLayerRun:
|07B84B| LDA.w $046C
|07B84E| CMP.b #$02
|07B850| BEQ CheckCollisionWithMovingWallLayer

|07B852| CMP.b #$03
|07B854| BEQ FlagAndRunSlopeChecks_HorizontalFirst

|07B856| CMP.b #$04
|07B858| BEQ FlagAndRunSlopeChecks_VerticalFirst

|07B85A| LDA.b $30
|07B85C| ORA.b $31
|07B85E| BNE FlagAndRunSlopeChecks_VerticalFirst

|07B860| LDA.b $5D
|07B862| CMP.b #$13 ; LINKSTATE 13
|07B864| BEQ .skip_pit_stuff

|07B866| CMP.b #$08 ; LINKSTATE 08
|07B868| BEQ .skip_pit_stuff

|07B86A| CMP.b #$09 ; LINKSTATE 09
|07B86C| BEQ .skip_pit_stuff

|07B86E| CMP.b #$0A ; LINKSTATE 0A
|07B870| BEQ .skip_pit_stuff

|07B872| CMP.b #$03 ; LINKSTATE 03
|07B874| BEQ .skip_pit_stuff

|07B876| JSR TileDetect_BigArea

|07B879| LDA.b $59
|07B87B| AND.b #$0F
|07B87D| BEQ .skip_pit_stuff

|07B87F| LDA.b #$01 ; LINKSTATE 01
|07B881| STA.b $5D

|07B883| LDA.w $0372
|07B886| BNE .skip_pit_stuff

|07B888| LDA.b #$04
|07B88A| STA.b $5E

.skip_pit_stuff
|07B88C| BRL CalculateSaveFlagVelocity

;===================================================================================================

CheckCollisionWithMovingWallLayer:
|07B88F| JSR TileDetect_BigArea

|07B892| LDA.b $0E
|07B894| ORA.w $0316
|07B897| CMP.b #$0F
|07B899| BNE FlagAndRunSlopeChecks_VerticalFirst

|07B89B| LDA.w $031F
|07B89E| BNE .actively_blinking

|07B8A0| LDA.b #$3A
|07B8A2| STA.w $031F

.actively_blinking
|07B8A5| LDA.b $67
|07B8A7| BNE FlagAndRunSlopeChecks_VerticalFirst

|07B8A9| LDA.w $0310
|07B8AC| BEQ .no_moving_floor_y

|07B8AE| LDA.b $30
|07B8B0| EOR.b #$FF
|07B8B2| INC A
|07B8B3| STA.b $30

.no_moving_floor_y
|07B8B5| LDA.w $0312
|07B8B8| BEQ FlagAndRunSlopeChecks_VerticalFirst

|07B8BA| LDA.b $31
|07B8BC| EOR.b #$FF
|07B8BE| INC A
|07B8BF| STA.b $31

;===================================================================================================

FlagAndRunSlopeChecks_VerticalFirst:
|07B8C1| LDA.b #$01
|07B8C3| STA.w $0315

|07B8C6| JSR RunSlopeCollisionChecks_VerticalFirst

|07B8C9| BRA CalculateSaveFlagVelocity

;===================================================================================================

FlagAndRunSlopeChecks_HorizontalFirst:
|07B8CB| LDA.b #$01
|07B8CD| STA.w $0315

|07B8D0| JSR RunSlopeCollisionChecks_HorizontalFirst

;===================================================================================================

CalculateSaveFlagVelocity:
|07B8D3| LDY.b #$00
|07B8D5| JSR TileDetect_MainHandler

|07B8D8| LDA.b $6A
|07B8DA| BEQ .not_moving_diagonal

|07B8DC| STZ.b $6B

.not_moving_diagonal
|07B8DE| LDA.b $5D
|07B8E0| CMP.b #$0B ; LINKSTATE 0B
|07B8E2| BEQ .no_y_movement

|07B8E4| LDY.b #$08

|07B8E6| LDA.b $20
|07B8E8| SEC
|07B8E9| SBC.b $3E
|07B8EB| STA.b $30

|07B8ED| BEQ .no_y_movement
|07B8EF| BMI .negative_y_movement

|07B8F1| LDY.b #$04

.negative_y_movement
|07B8F3| LDA.b $67
|07B8F5| AND.b #$03
|07B8F7| STA.b $67

|07B8F9| TYA
|07B8FA| TSB.b $67

.no_y_movement
|07B8FC| LDY.b #$02

|07B8FE| LDA.b $22
|07B900| SEC
|07B901| SBC.b $3F
|07B903| STA.b $31

|07B905| BEQ .no_x_movement
|07B907| BMI .negative_x_movement

|07B909| LDY.b #$01

.negative_x_movement
|07B90B| LDA.b $67
|07B90D| AND.b #$0C
|07B90F| STA.b $67

|07B911| TYA
|07B912| TSB.b $67

.no_x_movement
|07B914| LDA.b $1B
|07B916| BEQ .exit

|07B918| LDA.w $046C
|07B91B| CMP.b #$04
|07B91D| BNE .exit

|07B91F| LDA.b $5D
|07B921| CMP.b #$04 ; LINKSTATE 04
|07B923| BNE .exit

|07B925| LDY.b #$F7

|07B927| LDA.w $0310
|07B92A| BEQ .no_floor_y_velocity
|07B92C| BMI .negative_floor_y_velocity

|07B92E| LDY.b #$FB

.negative_floor_y_velocity
|07B930| EOR.b #$FF
|07B932| INC A
|07B933| CLC
|07B934| ADC.b $30
|07B936| BNE .no_floor_y_velocity

|07B938| TYA
|07B939| AND.b $67
|07B93B| STA.b $67

.no_floor_y_velocity
|07B93D| LDY.b #$FD

|07B93F| LDA.w $0312
|07B942| BEQ .exit
|07B944| BMI .negative_floor_x_velocity

|07B946| LDY.b #$FE

.negative_floor_x_velocity
|07B948| EOR.b #$FF
|07B94A| INC A
|07B94B| CLC
|07B94C| ADC.b $31
|07B94E| BNE .exit

|07B950| TYA
|07B951| AND.b $67
|07B953| STA.b $67

.exit
|07B955| RTS

;===================================================================================================

RunSlopeCollisionChecks_VerticalFirst:
|07B956| LDA.b $6B
|07B958| AND.b #$20
|07B95A| BNE .moving_horizontally_into_slope

|07B95C| JSR StartMovementCollisionChecks_Vertical

.moving_horizontally_into_slope
|07B95F| LDA.b $6B
|07B961| AND.b #$10
|07B963| BNE .exit

|07B965| JSR StartMovementCollisionChecks_Horizontal

.exit
|07B968| RTS

;===================================================================================================

RunSlopeCollisionChecks_HorizontalFirst:
|07B969| LDA.b $6B
|07B96B| AND.b #$10
|07B96D| BNE .moving_vertically_into_slope

|07B96F| JSR StartMovementCollisionChecks_Horizontal

.moving_vertically_into_slope
|07B972| LDA.b $6B
|07B974| AND.b #$20
|07B976| BNE .exit

|07B978| JSR StartMovementCollisionChecks_Vertical

.exit
|07B97B| RTS

;===================================================================================================

CheckIfRoomNeedsDoubleLayerCheck:
|07B97C| LDA.w $046C
|07B97F| BEQ .no_layer_change

|07B981| CMP.b #$04
|07B983| BEQ .no_layer_change

|07B985| CMP.b #$02
|07B987| BCC .change_layer

|07B989| CMP.b #$03
|07B98B| BNE .useless

.useless
|07B98D| REP #$20

|07B98F| LDA.b $E6
|07B991| SEC
|07B992| SBC.b $E8

|07B994| CLC
|07B995| ADC.b $20
|07B997| STA.b $20
|07B999| STA.w $0318

|07B99C| LDA.b $E0
|07B99E| SEC
|07B99F| SBC.b $E2

|07B9A1| CLC
|07B9A2| ADC.b $22
|07B9A4| STA.b $22
|07B9A6| STA.w $031A

|07B9A9| SEP #$20

.change_layer
|07B9AB| LDA.b #$01
|07B9AD| STA.b $EE

|07B9AF| SEC

|07B9B0| RTS

.no_layer_change
|07B9B1| CLC

|07B9B2| RTS

;===================================================================================================

CreateVelocityFromMovingBackground:
|07B9B3| LDA.w $046C
|07B9B6| CMP.b #$01
|07B9B8| BEQ .reset_and_exit

|07B9BA| REP #$20

|07B9BC| LDA.b $20
|07B9BE| SEC
|07B9BF| SBC.w $0318
|07B9C2| STA.b $00

|07B9C4| LDA.b $22
|07B9C6| SEC
|07B9C7| SBC.w $031A
|07B9CA| STA.b $02

|07B9CC| LDA.b $E8
|07B9CE| SEC
|07B9CF| SBC.b $E6
|07B9D1| CLC
|07B9D2| ADC.b $20
|07B9D4| STA.b $20

|07B9D6| LDA.b $E2
|07B9D8| SEC
|07B9D9| SBC.b $E0
|07B9DB| CLC
|07B9DC| ADC.b $22
|07B9DE| STA.b $22

|07B9E0| SEP #$20

|07B9E2| LDA.b $67
|07B9E4| BEQ .reset_and_exit

|07B9E6| LDA.b $30
|07B9E8| CLC
|07B9E9| ADC.b $00
|07B9EB| STA.b $30

|07B9ED| LDA.b $31
|07B9EF| CLC
|07B9F0| ADC.b $02
|07B9F2| STA.b $31

.reset_and_exit
|07B9F4| STZ.b $EE

|07B9F6| RTS

;===================================================================================================

RupeeTileOffset_y:
|07B9F7| dw $0008, $0018, $0010, $0010

RupeeTileOffset_x:
|07B9FF| dw $0008, $0008, $0000, $000F

;===================================================================================================

SpikeDamageValues:
|07BA07| db $08 ; green
|07BA08| db $08 ; blue
|07BA09| db $08 ; red

;===================================================================================================

StartMovementCollisionChecks_Vertical:
|07BA0A| LDA.b $30
|07BA0C| BNE .moving_on_axis

|07BA0E| RTS

.moving_on_axis
|07BA0F| LDA.b $6C
|07BA11| CMP.b #$01
|07BA13| BNE .not_in_vertical_door

|07BA15| LDY.b #$00

|07BA17| LDA.b $20
|07BA19| CMP.b #$80
|07BA1B| BCC .negative_y
|07BA1D| BRA .continue_y

.not_in_vertical_door
|07BA1F| LDY.b #$00

|07BA21| LDA.b $30
|07BA23| BMI .negative_y

.continue_y
|07BA25| LDY.b #$02

.negative_y
|07BA27| TYA
|07BA28| LSR A
|07BA29| STA.b $66

|07BA2B| JSR TileDetectOnMovement_Vertical

|07BA2E| LDA.b $1B
|07BA30| BNE StartMovementCollisionChecks_Vertical_HandleIndoors

|07BA32| BRL StartMovementCollisionChecks_Vertical_HandleOutdoors

;===================================================================================================

StartMovementCollisionChecks_Vertical_HandleIndoors:
|07BA35| LDA.w $0308
|07BA38| BMI .carrying_something

|07BA3A| LDA.b $46
|07BA3C| BEQ .not_taking_damage

.carrying_something
|07BA3E| LDA.b $0E
|07BA40| LSR A
|07BA41| LSR A
|07BA42| LSR A
|07BA43| LSR A
|07BA44| TSB.b $0E

|07BA46| BRL ResetDoorPropsVertical_door_pre

;---------------------------------------------------------------------------------------------------

.not_taking_damage
|07BA49| LDA.b $6C
|07BA4B| CMP.b #$02
|07BA4D| BNE HandleAutoDoorFlagging_Vertical

|07BA4F| LDA.b $6A
|07BA51| BNE .not_moving_diagonally

|07BA53| LDA.w $046C
|07BA56| CMP.b #$03
|07BA58| BNE .no_moving_floor

|07BA5A| LDA.b $EE
|07BA5C| BEQ .no_moving_floor

|07BA5E| BRL CheckForMasksRupeesConveyors_Vertical

.no_moving_floor
|07BA61| JSR AddInLinksYVelocity
|07BA64| BRL ChangeAxisOfPerpendicularDoorMovement_Vertical

.not_moving_diagonally
|07BA67| LDA.b $62
|07BA69| BEQ HandleAutoDoorFlagging_Vertical

|07BA6B| JSR AddInLinksYVelocity

|07BA6E| BRA ResetDoorPropsVertical

;===================================================================================================

HandleAutoDoorFlagging_Vertical:
|07BA70| LDA.b $0E
|07BA72| AND.b #$70
|07BA74| BEQ ResetDoorPropsVertical_door_pre

|07BA76| STZ.b $05

|07BA78| LDA.b $0F
|07BA7A| AND.b #$07
|07BA7C| BEQ .no_auto_move

|07BA7E| LDY.b #$00

|07BA80| LDA.b $30
|07BA82| BMI .negative_y

|07BA84| LDY.b #$01

.negative_y
|07BA86| LDA.w AutoMove49Directions,Y
|07BA89| STA.b $49

;---------------------------------------------------------------------------------------------------

.no_auto_move
|07BA8B| LDA.b #$01
|07BA8D| STA.b $6C

|07BA8F| STZ.w $03F3

|07BA92| LDA.b $0E
|07BA94| AND.b #$70
|07BA96| CMP.b #$70
|07BA98| BEQ .dont_snap

|07BA9A| LDA.b $0E
|07BA9C| AND.b #$05
|07BA9E| BNE .handle_falling_too

|07BAA0| LDA.b $0E
|07BAA2| AND.b #$20
|07BAA4| BNE .dont_snap

|07BAA6| BRA ResetDoorPropsVertical_door_pre

.handle_falling_too
|07BAA8| STZ.b $6B

|07BAAA| JSR AddInLinksYVelocityFalling
|07BAAD| JSR CalculateSnapScratch_Vertical

|07BAB0| STZ.b $6C

|07BAB2| LDA.b $0E
|07BAB4| AND.b #$20
|07BAB6| BEQ .dont_snap

|07BAB8| LDA.b $0E
|07BABA| AND.b #$01
|07BABC| BNE .dont_snap

|07BABE| LDA.b $22
|07BAC0| AND.b #$07
|07BAC2| CMP.b #$01
|07BAC4| BNE .dont_snap

|07BAC6| LDA.b $22
|07BAC8| AND.b #$F8
|07BACA| STA.b $22

.dont_snap
|07BACC| LDA.w $0315
|07BACF| AND.b #$02
|07BAD1| BNE .exit

|07BAD3| LDA.b $50
|07BAD5| AND.b #$FD
|07BAD7| STA.b $50

.exit
|07BAD9| RTS

;===================================================================================================

ResetDoorPropsVertical_door_pre:
|07BADA| LDA.w $0315
|07BADD| AND.b #$02
|07BADF| BNE ResetDoorPropsVertical

|07BAE1| STZ.b $6C

;===================================================================================================

ResetDoorPropsVertical:
|07BAE3| LDA.w $0315
|07BAE6| AND.b #$02
|07BAE8| BNE CheckForMasksRupeesConveyors_Vertical

|07BAEA| LDA.b $50
|07BAEC| AND.b #$FD
|07BAEE| STA.b $50

|07BAF0| STZ.b $49
|07BAF2| STZ.b $EF

;===================================================================================================

CheckForMasksRupeesConveyors_Vertical:
|07BAF4| LDA.b $0E
|07BAF6| AND.b #$07
|07BAF8| BNE HandleMasksRupeesConveyors_Vertical

|07BAFA| LDA.b $0C
|07BAFC| AND.b #$05
|07BAFE| BEQ HandleMasksRupeesConveyors_Vertical

|07BB00| STZ.w $03F3

|07BB03| JSR FlagMovingIntoSlopes_Vertical

|07BB06| LDA.b $6B
|07BB08| AND.b #$0F
|07BB0A| BEQ HandleMasksRupeesConveyors_Vertical

|07BB0C| RTS

;===================================================================================================

HandleMasksRupeesConveyors_Vertical:
|07BB0D| STZ.b $6B

|07BB0F| LDA.w $02E7
|07BB12| AND.b #$20
|07BB14| BEQ .no_chest_above

|07BB16| LDA.b $0E
|07BB18| PHA

|07BB19| LDA.b $0F
|07BB1B| PHA

|07BB1C| LDA.w $02EA
|07BB1F| JSL OpenChestForItem

|07BB23| STZ.w $02EA

|07BB26| PLA
|07BB27| STA.b $0F

|07BB29| PLA
|07BB2A| STA.b $0E

;---------------------------------------------------------------------------------------------------

.no_chest_above
|07BB2C| LDA.b $EE
|07BB2E| BNE .lower_layer

|07BB30| LDA.w $034C
|07BB33| AND.b #$07
|07BB35| BEQ .no_mask1C

|07BB37| LDA.b #$01
|07BB39| TSB.w $0322

|07BB3C| BRA .check_for_rupee_tiles

;---------------------------------------------------------------------------------------------------

.no_mask1C
|07BB3E| LDA.w $02E8
|07BB41| AND.b #$07
|07BB43| BNE .check_for_rupee_tiles

|07BB45| LDA.b $0E
|07BB47| AND.b #$02
|07BB49| BNE .check_for_rupee_tiles

|07BB4B| LDA.w $0322
|07BB4E| AND.b #$FE
|07BB50| STA.w $0322

|07BB53| BRA .check_for_rupee_tiles

.lower_layer
|07BB55| LDA.w $0320
|07BB58| AND.b #$07
|07BB5A| BEQ .no_mask0C

|07BB5C| LDA.b #$02
|07BB5E| TSB.w $0322

|07BB61| BRA .check_for_rupee_tiles

.no_mask0C
|07BB63| LDA.w $0322
|07BB66| AND.b #$FD
|07BB68| STA.w $0322

;---------------------------------------------------------------------------------------------------

.check_for_rupee_tiles
|07BB6B| LDA.w $02F7
|07BB6E| AND.b #$22
|07BB70| BEQ .no_rupee_tiles

|07BB72| LDX.b #$00

|07BB74| AND.b #$20
|07BB76| BEQ .no_rupee_from_this_side

|07BB78| LDX.b #$08

.no_rupee_from_this_side
|07BB7A| STX.b $00

|07BB7C| STZ.b $01

|07BB7E| LDA.b $66
|07BB80| ASL A
|07BB81| TAY

|07BB82| REP #$20

|07BB84| LDA.l $7EF360
|07BB88| CLC
|07BB89| ADC.w #$0005
|07BB8C| STA.l $7EF360

|07BB90| LDA.b $20
|07BB92| CLC
|07BB93| ADC.w RupeeTileOffset_y,Y
|07BB96| SEC
|07BB97| SBC.b $00
|07BB99| STA.b $00

|07BB9B| LDA.b $22
|07BB9D| CLC
|07BB9E| ADC.w RupeeTileOffset_x,Y
|07BBA1| STA.b $02

|07BBA3| SEP #$20

|07BBA5| JSL DeleteRupeeTile

|07BBA9| LDA.b #$0A ; SFX3.0A
|07BBAB| JSR PlayLinkSFX3Panned

;---------------------------------------------------------------------------------------------------

.no_rupee_tiles
|07BBAE| LDY.b #$01 ; up

|07BBB0| LDA.w $03F1
|07BBB3| AND.b #$22
|07BBB5| BEQ .no_conveyor_ud

|07BBB7| AND.b #$20
|07BBB9| BEQ .up_conveyor

|07BBBB| LDY.b #$02 ; down

.up_conveyor
|07BBBD| STY.w $03F3

|07BBC0| BRA CheckForLedgeTile_Vertical

;---------------------------------------------------------------------------------------------------

.no_conveyor_ud
|07BBC2| LDY.b #$03 ; left

|07BBC4| LDA.w $03F2
|07BBC7| AND.b #$22
|07BBC9| BEQ .no_conveyor_lr

|07BBCB| AND.b #$20
|07BBCD| BEQ .left_conveyor

|07BBCF| LDY.b #$04 ; right

.left_conveyor
|07BBD1| STY.w $03F3

|07BBD4| BRA CheckForLedgeTile_Vertical

;---------------------------------------------------------------------------------------------------

.no_conveyor_lr
|07BBD6| LDA.w $02E8
|07BBD9| AND.b #$07
|07BBDB| BNE CheckForLedgeTile_Vertical

|07BBDD| LDA.b $0E
|07BBDF| AND.b #$02
|07BBE1| BNE CheckForLedgeTile_Vertical

|07BBE3| STZ.w $03F3

;===================================================================================================

CheckForLedgeTile_Vertical:
|07BBE6| LDA.w $036D
|07BBE9| AND.b #$07
|07BBEB| CMP.b #$07
|07BBED| BNE CheckForWaterTiles_Vertical

|07BBEF| JSR RunLedgeHopTimer
|07BBF2| BCC CheckForWaterTiles_Vertical

|07BBF4| JSR CancelDash

|07BBF7| INC.w $047A

|07BBFA| LDA.b #$01
|07BBFC| STA.w $037B

|07BBFF| LDA.b #$02
|07BC01| STA.b $4D

|07BC03| LDA.b #$20 ; SFX2.20
|07BC05| JSR PlayLinkSFX2Panned

|07BC08| BRA HandleUnderworldHopOntoWater_Vertical

;---------------------------------------------------------------------------------------------------

CheckForWaterTiles_Vertical:
|07BC0A| LDA.w $0341
|07BC0D| AND.b #$07
|07BC0F| CMP.b #$07
|07BC11| BNE .on_deep_water

|07BC13| LDA.w $0345
|07BC16| BNE .on_deep_water

|07BC18| JSR CancelDash

|07BC1B| LDA.b $1D
|07BC1D| BNE .no_layer_change

|07BC1F| JSL HandleLayerChange

|07BC23| BRA HandleUnderworldHopOntoWater_Vertical

;---------------------------------------------------------------------------------------------------

.no_layer_change
|07BC25| LDA.b #$01
|07BC27| STA.w $0345

|07BC2A| LDA.b $26
|07BC2C| STA.w $0340

|07BC2F| STZ.w $0308
|07BC32| STZ.w $0309
|07BC35| STZ.w $0376

|07BC38| STZ.b $5E

|07BC3A| JSL ResetSwimmingState

|07BC3E| LDA.b #$20 ; SFX2.20
|07BC40| JSR PlayLinkSFX2Panned

;===================================================================================================

#HandleUnderworldHopOntoWater_Vertical:
|07BC43| LDA.b #$01
|07BC45| STA.w $037B

|07BC48| JSR HopInOrOutOfWater_Vertical

|07BC4B| BRA .continue

;---------------------------------------------------------------------------------------------------

.on_deep_water
|07BC4D| LDA.w $0343
|07BC50| AND.b #$02
|07BC52| BEQ .continue

|07BC54| LDA.w $0345
|07BC57| BEQ .continue

|07BC59| LDA.b $4D
|07BC5B| BEQ .not_in_recoil

|07BC5D| LDA.b #$07
|07BC5F| STA.b $0E

|07BC61| BRA .continue

.not_in_recoil
|07BC63| JSR CancelDash

|07BC66| STZ.w $0345

|07BC69| LDA.w $0340
|07BC6C| STA.b $26

|07BC6E| LDA.b #$15 ; ANCILLA 15
|07BC70| LDY.b #$00
|07BC72| JSL AncillaAdd_Splash
|07BC76| BCC .splash_around

|07BC78| LDA.b #$01
|07BC7A| STA.w $0345

|07BC7D| LDA.b #$07
|07BC7F| STA.b $0E

|07BC81| BRA .continue

.splash_around
|07BC83| LDA.b #$01
|07BC85| STA.w $037B

|07BC88| JSR HopInOrOutOfWater_Vertical

;---------------------------------------------------------------------------------------------------

.continue
|07BC8B| LDA.b $58
|07BC8D| AND.b #$07
|07BC8F| CMP.b #$07
|07BC91| BNE HandleLinkStairDetection

|07BC93| LDA.b $46
|07BC95| BEQ .not_taking_damage

|07BC97| LDA.b $58
|07BC99| AND.b #$07
|07BC9B| STA.b $0E

|07BC9D| BRL HandlePushingBonkingSnaps_Vertical

.not_taking_damage
|07BCA0| LDA.w $02C0
|07BCA3| AND.b #$77
|07BCA5| BEQ .no_stairs

|07BCA7| LDY.b #$08
|07BCA9| AND.b #$70
|07BCAB| BEQ .merged_layer_stairs

|07BCAD| LDY.b #$10

.merged_layer_stairs
|07BCAF| STY.b $11

|07BCB1| LDA.b #$07
|07BCB3| STA.b $10

|07BCB5| JSR CancelDash

.no_stairs
|07BCB8| LDA.b $66
|07BCBA| AND.b #$02
|07BCBC| BNE HandleLinkStairDetection

|07BCBE| LDA.b #$02
|07BCC0| STA.b $5E

|07BCC2| LDA.b #$01
|07BCC4| STA.b $57

|07BCC6| RTS

;===================================================================================================

HandleLinkStairDetection:
|07BCC7| LDA.b $5E
|07BCC9| CMP.b #$02
|07BCCB| BNE .not_stair_speed

|07BCCD| LDX.b #$10

|07BCCF| LDA.w $0372
|07BCD2| BNE .dashing_speed

|07BCD4| LDX.b #$00

.dashing_speed
|07BCD6| STX.b $5E

.not_stair_speed
|07BCD8| LDA.b $57
|07BCDA| CMP.b #$01
|07BCDC| BNE HandleUnderworldPitSlip_Vertical

|07BCDE| LDX.b #$02
|07BCE0| STX.b $57

;===================================================================================================

HandleUnderworldPitSlip_Vertical:
|07BCE2| LDA.b $59
|07BCE4| AND.b #$05
|07BCE6| BEQ HandleUnderworldSpikeBlockCollision_Vertical

|07BCE8| LDA.b $0E
|07BCEA| AND.b #$02
|07BCEC| BNE HandleUnderworldSpikeBlockCollision_Vertical

|07BCEE| LDA.b $5D
|07BCF0| CMP.b #$05 ; LINKSTATE 05
|07BCF2| BEQ .exit

|07BCF4| CMP.b #$02 ; LINKSTATE 02
|07BCF6| BEQ .exit

|07BCF8| LDA.b #$09
|07BCFA| STA.b $5C

|07BCFC| STZ.b $5A

|07BCFE| LDA.b #$01
|07BD00| STA.b $5B

|07BD02| LDA.b #$01 ; LINKSTATE 01
|07BD04| STA.b $5D

.exit
|07BD06| RTS

;===================================================================================================

HandleUnderworldSpikeBlockCollision_Vertical:
|07BD07| STZ.b $5A

|07BD09| LDA.w $02E8
|07BD0C| AND.b #$07
|07BD0E| BEQ .check_collision_type

|07BD10| LDA.b $46
|07BD12| ORA.w $031F
|07BD15| ORA.b $55
|07BD17| BNE .no_spike_damage

|07BD19| LDA.b $20
|07BD1B| LDY.b $66
|07BD1D| BNE .didnt_move

|07BD1F| AND.b #$04
|07BD21| BEQ .not_on_4px_edge
|07BD23| BRA .check_collision_type

.didnt_move
|07BD25| AND.b #$04
|07BD27| BEQ .check_collision_type

.not_on_4px_edge
|07BD29| LDA.w $031F
|07BD2C| BNE .check_collision_type

|07BD2E| LDA.l $7EF35B
|07BD32| TAY

|07BD33| LDA.w SpikeDamageValues,Y
|07BD36| STA.w $0373

|07BD39| JSR CancelDash
|07BD3C| JSR ForciblyUnequipCape_quietly

|07BD3F| BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.no_spike_damage
|07BD42| LDA.w $02E8
|07BD45| AND.b #$07
|07BD47| STA.b $0E

.check_collision_type
|07BD49| LDA.w $046C
|07BD4C| BEQ .ignore_layer

|07BD4E| CMP.b #$04
|07BD50| BEQ .ignore_layer

|07BD52| LDA.b $EE
|07BD54| BNE HandlePushingBonkingSnaps_Vertical

.ignore_layer
|07BD56| LDA.b $5F
|07BD58| ORA.b $60
|07BD5A| BEQ .not_pushing_block

|07BD5C| LDA.b $6A
|07BD5E| BNE .not_pushing_block

|07BD60| LDA.b $5F
|07BD62| STA.w $02C2

|07BD65| DEC.b $61
|07BD67| BPL HandlePushingBonkingSnaps_Vertical

;---------------------------------------------------------------------------------------------------

|07BD69| REP #$20

|07BD6B| LDY.b #$0F

|07BD6D| LDA.b $5F

.check_next_block
|07BD6F| ASL A
|07BD70| BCC .skip_block

|07BD72| PHA
|07BD73| PHY

|07BD74| SEP #$20

|07BD76| JSR FindFreeMovingBlockSlot
|07BD79| BCS .no_free_slot

|07BD7B| STX.b $0E

|07BD7D| TYA
|07BD7E| ASL A
|07BD7F| TAX

|07BD80| JSR InitializePushBlock
|07BD83| BCS .no_free_slot

|07BD85| LDA.b $0E
|07BD87| ASL A
|07BD88| TAY

|07BD89| JSR DrawSinglePushBlock

|07BD8C| TYX

|07BD8D| LDY.b $66

|07BD8F| TYA
|07BD90| ASL A
|07BD91| STA.w $05F8,X
|07BD94| STA.w $0474

|07BD97| LDA.w $05F0,X

|07BD9A| CPY.b #$01
|07BD9C| BNE .not_pushing_down

|07BD9E| DEC A

.not_pushing_down
|07BD9F| AND.b #$0F
|07BDA1| STA.w $05E8,X

.no_free_slot
|07BDA4| REP #$20

|07BDA6| PLY
|07BDA7| PLA

.skip_block
|07BDA8| DEY
|07BDA9| BPL .check_next_block

;---------------------------------------------------------------------------------------------------

|07BDAB| SEP #$20

.not_pushing_block
|07BDAD| LDA.b #$15
|07BDAF| STA.b $61

;===================================================================================================

HandlePushingBonkingSnaps_Vertical:
|07BDB1| LDA.b $0E
|07BDB3| AND.b #$07
|07BDB5| BNE .check_for_swimming

|07BDB7| BRL RestartPushingTimer_UnflagDoors_Vertical

.check_for_swimming
|07BDBA| LDA.b $5D
|07BDBC| CMP.b #$04 ; LINKSTATE 04
|07BDBE| BNE .not_swimming_or_moving

|07BDC0| LDA.w $0310
|07BDC3| BNE .moving_floor_active

|07BDC5| JSR ResetAllAcceleration

.moving_floor_active
|07BDC8| LDA.b $6A
|07BDCA| BEQ .not_swimming_or_moving

|07BDCC| JSR AddInLinksYVelocityFalling
|07BDCF| BRA .check_for_bonk

.not_swimming_or_moving
|07BDD1| LDA.b $0E
|07BDD3| AND.b #$02
|07BDD5| BNE .do_a_bonk

|07BDD7| LDA.b $0E
|07BDD9| AND.b #$05
|07BDDB| CMP.b #$05
|07BDDD| BNE .no_bonk

.do_a_bonk
|07BDDF| LDA.b $0E
|07BDE1| PHA

|07BDE2| JSR BonkAndSmash
|07BDE5| JSR RepelDash

|07BDE8| PLA
|07BDE9| STA.b $0E

.no_bonk
|07BDEB| LDA.b #$01
|07BDED| STA.w $0302

|07BDF0| LDA.b $0E
|07BDF2| AND.b #$02
|07BDF4| CMP.b #$02
|07BDF6| BNE .check_diagonal_direction

|07BDF8| JSR AddInLinksYVelocityFalling
|07BDFB| BRA .check_for_bonk

.check_diagonal_direction
|07BDFD| LDA.b $6A
|07BDFF| CMP.b #$01
|07BE01| BNE .not_diagonal_facing_vetically

.diagonal_facing_horizontally
|07BE03| BRL RestartPushingTimer_Vertical

.not_diagonal_facing_vetically
|07BE06| JSR AddInLinksYVelocityFalling

|07BE09| LDA.b $6A
|07BE0B| CMP.b #$02
|07BE0D| BEQ .diagonal_facing_horizontally

;---------------------------------------------------------------------------------------------------

.check_for_bonk
|07BE0F| LDA.b $0E
|07BE11| AND.b #$05
|07BE13| CMP.b #$05
|07BE15| BEQ .definitely_bonk

|07BE17| AND.b #$04
|07BE19| BEQ .no_bonk_this_way

|07BE1B| LDY.b #$01

|07BE1D| LDA.b $30
|07BE1F| BMI .already_negative

|07BE21| EOR.b #$FF
|07BE23| INC A

.already_negative
|07BE24| BPL .extra_positive_check

|07BE26| LDY.b #$FF

.extra_positive_check
|07BE28| STY.b $00
|07BE2A| STZ.b $01

|07BE2C| LDA.b $0E
|07BE2E| AND.b #$02
|07BE30| BNE HandlePushingObstruction_Vertical

|07BE32| LDA.b $22
|07BE34| AND.b #$07
|07BE36| BNE .do_not_bonk

|07BE38| JSR BonkAndSmash
|07BE3B| JSR RepelDash

|07BE3E| BRA HandlePushingObstruction_Vertical

;---------------------------------------------------------------------------------------------------

.no_bonk_this_way
|07BE40| LDY.b #$01

|07BE42| LDA.b $30
|07BE44| BPL .already_positive

|07BE46| EOR.b #$FF
|07BE48| INC A

.already_positive
|07BE49| BPL .make_sure_not_negative

|07BE4B| LDY.b #$FF

.make_sure_not_negative
|07BE4D| STY.b $00
|07BE4F| STZ.b $01

|07BE51| LDA.b $0E
|07BE53| AND.b #$02
|07BE55| BNE HandlePushingObstruction_Vertical

|07BE57| LDA.b $22
|07BE59| AND.b #$07
|07BE5B| BNE .do_not_bonk

.definitely_bonk
|07BE5D| JSR BonkAndSmash
|07BE60| JSR RepelDash

|07BE63| BRA HandlePushingObstruction_Vertical

.do_not_bonk
|07BE65| JSR AddAbsoluteScratchToXCoord

|07BE68| JMP.w HandleNudging

;===================================================================================================

HandlePushingObstruction_Vertical:
|07BE6B| LDA.b $66
|07BE6D| ASL A
|07BE6E| CMP.b $2F
|07BE70| BNE RestartPushingTimer_Vertical

|07BE72| LDA.w $0315
|07BE75| AND.b #$01
|07BE77| ASL A
|07BE78| TSB.b $48

|07BE7A| LDA.b $3C
|07BE7C| BNE .dont_run_push_timer

|07BE7E| DEC.w $0371
|07BE81| BPL EXIT_07BEAE

.dont_run_push_timer
|07BE83| LDY.w $0315

|07BE86| LDA.w $02F6
|07BE89| AND.b #$20
|07BE8B| BEQ .not_a_flaggable_door

|07BE8D| LDA.w $0315
|07BE90| ASL A
|07BE91| ASL A
|07BE92| ASL A
|07BE93| TAY

.not_a_flaggable_door
|07BE94| TYA
|07BE95| TSB.b $48

|07BE97| BRA RestartPushingTimer_Vertical

;===================================================================================================

RestartPushingTimer_UnflagDoors_Vertical:
|07BE99| LDA.b $EE
|07BE9B| BNE EXIT_07BEAE

|07BE9D| LDA.b $48
|07BE9F| AND.b #$F6
|07BEA1| STA.b $48

;===================================================================================================

RestartPushingTimer_Vertical:
|07BEA3| LDA.b #$20
|07BEA5| STA.w $0371

|07BEA8| LDA.b $48
|07BEAA| AND.b #$FD
|07BEAC| STA.b $48

;---------------------------------------------------------------------------------------------------

#EXIT_07BEAE:
|07BEAE| RTS

;===================================================================================================

StartMovementCollisionChecks_Vertical_HandleOutdoors:
|07BEAF| LDA.b $5E
|07BEB1| CMP.b #$02
|07BEB3| BNE .not_stair_speed

|07BEB5| LDX.b #$10

|07BEB7| LDA.w $0372
|07BEBA| BNE .dashing

|07BEBC| LDX.b #$00

.dashing
|07BEBE| STX.b $5E

.not_stair_speed
|07BEC0| LDA.b $59
|07BEC2| AND.b #$05
|07BEC4| BEQ HandleLiftablesBeforeDeepWater_Vertical

|07BEC6| LDA.b $0E
|07BEC8| AND.b #$02
|07BECA| BNE HandleLiftablesBeforeDeepWater_Vertical

|07BECC| LDA.b $5D
|07BECE| CMP.b #$05 ; LINKSTATE 05
|07BED0| BEQ .exit

|07BED2| CMP.b #$02 ; LINKSTATE 02
|07BED4| BEQ .exit

|07BED6| LDA.b #$09
|07BED8| STA.b $5C

|07BEDA| STZ.b $5A

|07BEDC| LDA.b #$01
|07BEDE| STA.b $5B

|07BEE0| LDA.b #$01 ; LINKSTATE 01
|07BEE2| STA.b $5D

.exit
|07BEE4| RTS

;===================================================================================================

HandleLiftablesBeforeDeepWater_Vertical:
|07BEE5| LDA.w $0366
|07BEE8| AND.b #$02
|07BEEA| BEQ .not_touching_some_liftable

|07BEEC| LDA.w $036A
|07BEEF| LSR A
|07BEF0| STA.w $0368

|07BEF3| BRA .index_is_set

.not_touching_some_liftable
|07BEF5| STZ.w $0368

.index_is_set
|07BEF8| LDA.w $0341
|07BEFB| AND.b #$02
|07BEFD| BEQ HandleLinkEnteringWater_Vertical

|07BEFF| BRA TestWaterEntryVertical

;===================================================================================================

UNREACHABLE_07BF01:
|07BF01| LDA.w $0341
|07BF04| AND.b #$07
|07BF06| CMP.b #$07
|07BF08| BNE HandleLinkEnteringWater_Vertical

;===================================================================================================

TestWaterEntryVertical:
|07BF0A| LDA.w $0345
|07BF0D| BNE HandleLinkEnteringWater_Vertical

|07BF0F| LDA.b $4D
|07BF11| BNE HandleLinkEnteringWater_Vertical

|07BF13| JSR ResetSwordAndItemUsage
|07BF16| JSR CancelDash

|07BF19| LDA.b #$01
|07BF1B| STA.w $0345

|07BF1E| LDA.b $26
|07BF20| STA.w $0340

|07BF23| STZ.w $0376
|07BF26| STZ.b $5E

|07BF28| JSL ResetSwimmingState

|07BF2C| LDA.w $0351
|07BF2F| CMP.b #$01
|07BF31| BNE .jump_into_water

;---------------------------------------------------------------------------------------------------

|07BF33| JSR ForciblyUnequipCape_quietly

|07BF36| LDA.l $7EF356
|07BF3A| BEQ .jump_into_water

|07BF3C| LDA.w $02E0
|07BF3F| BNE HandleLinkEnteringWater_Vertical

|07BF41| LDA.b #$04 ; LINKSTATE 04
|07BF43| STA.b $5D

|07BF45| BRA HandleLinkEnteringWater_Vertical

.jump_into_water
|07BF47| LDA.b #$20 ; SFX2.20
|07BF49| JSR PlayLinkSFX2Panned

|07BF4C| LDA.b $3E
|07BF4E| STA.b $20

|07BF50| LDA.b $40
|07BF52| STA.b $21

|07BF54| LDA.b $3F
|07BF56| STA.b $22

|07BF58| LDA.b $41
|07BF5A| STA.b $23

|07BF5C| LDA.b #$01
|07BF5E| STA.w $037B

|07BF61| JSR HopInOrOutOfWater_Vertical

;===================================================================================================

HandleLinkEnteringWater_Vertical:
|07BF64| LDA.w $0345
|07BF67| BEQ .not_on_deep_water

|07BF69| LDA.w $036D
|07BF6C| AND.b #$07
|07BF6E| BEQ .no_ledge

|07BF70| STA.b $0E

|07BF72| BRL HandlePushingBonkingSnaps_Vertical

.no_ledge
|07BF75| LDA.b $58
|07BF77| AND.b #$07
|07BF79| CMP.b #$07
|07BF7B| BEQ .stairs_detected

|07BF7D| LDA.w $0343
|07BF80| AND.b #$07
|07BF82| CMP.b #$07
|07BF84| BNE .not_on_deep_water

.stairs_detected
|07BF86| JSR CancelDash

|07BF89| STZ.w $0345

|07BF8C| LDA.b $4D
|07BF8E| BNE .not_on_deep_water

|07BF90| LDA.w $0340
|07BF93| STA.b $26

|07BF95| LDA.b #$01
|07BF97| STA.w $037B

|07BF9A| LDA.b #$15 ; ANCILLA 15
|07BF9C| LDY.b #$00
|07BF9E| JSL AncillaAdd_Splash

|07BFA2| BRL HopInOrOutOfWater_Vertical

;---------------------------------------------------------------------------------------------------

.not_on_deep_water
|07BFA5| LDA.w $036E
|07BFA8| AND.b #$02
|07BFAA| BNE .horizontal_ledge_detected

|07BFAC| LDA.w $0370
|07BFAF| AND.b #$22
|07BFB1| BEQ .no_weird_ledges

.horizontal_ledge_detected
|07BFB3| LDA.b #$07
|07BFB5| STA.b $0E

|07BFB7| BRL HandlePushingBonkingSnaps_Vertical

.no_weird_ledges
|07BFBA| LDA.w $036D
|07BFBD| AND.b #$70
|07BFBF| BEQ CheckForNorthSouthLedges

|07BFC1| JSR RunLedgeHopTimer
|07BFC4| BCC CheckForNorthSouthLedges

|07BFC6| JSR CancelDash

|07BFC9| LDA.b #$01
|07BFCB| STA.w $037B
|07BFCE| STA.b $78

|07BFD0| LDA.b #$0B ; LINKSTATE 0B
|07BFD2| STA.b $5D

|07BFD4| STZ.b $46

|07BFD6| LDA.b #$FF
|07BFD8| STA.w $0364
|07BFDB| STA.w $0365

|07BFDE| STZ.b $48
|07BFE0| STZ.b $5E

|07BFE2| LDY.b #$02
|07BFE4| LDX.b #$14

|07BFE6| LDA.w $0345
|07BFE9| BEQ .jumping_into_water

|07BFEB| LDY.b #$04
|07BFED| LDX.b #$0E

.jumping_into_water
|07BFEF| STX.w $0362
|07BFF2| STX.w $0363

|07BFF5| STY.b $4D

|07BFF7| RTS

;===================================================================================================

CheckForNorthSouthLedges:
|07BFF8| LDA.w $036D
|07BFFB| AND.b #$07
|07BFFD| BEQ .dont_hop

|07BFFF| JSR RunLedgeHopTimer
|07C002| BCC .dont_hop

|07C004| LDA.b #$20 ; SFX2.20
|07C006| JSR PlayLinkSFX2Panned

|07C009| LDA.b #$01
|07C00B| STA.w $037B

|07C00E| JSR CancelDash

|07C011| STZ.b $48
|07C013| STZ.b $5E

|07C015| BRL FindValidLandingTile_North

.dont_hop
|07C018| LDA.w $0345
|07C01B| BEQ .not_in_water

|07C01D| BRL OverworldRecoverAndDoGraves

.not_in_water
|07C020| LDA.w $036F
|07C023| AND.b #$07
|07C025| BEQ CheckOverworldHopTiles_Vertical

|07C027| LDA.w $036D
|07C02A| AND.b #$77
|07C02C| BNE CheckOverworldHopTiles_Vertical

|07C02E| LDX.b #$04

|07C030| LDA.b $76
|07C032| CMP.b #$2F
|07C034| BEQ .check_north_east

|07C036| LDX.b #$01

.check_north_east
|07C038| TXA
|07C039| AND.w $036F
|07C03C| BEQ CheckOverworldHopTiles_Vertical

|07C03E| JSR RunLedgeHopTimer
|07C041| BCC CheckOverworldHopTiles_Vertical

|07C043| JSR CancelDash

|07C046| LDX.b #$10

|07C048| LDA.w $036F
|07C04B| AND.b #$04
|07C04D| BNE .dont_invert_recoil

|07C04F| TXA
|07C050| EOR.b #$FF
|07C052| INC A
|07C053| TAX

.dont_invert_recoil
|07C054| LDA.b #$01
|07C056| STA.w $037B

|07C059| STX.b $28

|07C05B| STZ.b $48
|07C05D| STZ.b $5E

|07C05F| LDA.b #$01
|07C061| STA.w $037B
|07C064| STA.b $78

|07C066| LDA.b #$02
|07C068| STA.b $4D

|07C06A| LDA.b #$14
|07C06C| STA.w $0362
|07C06F| STA.w $0363

|07C072| LDA.b #$FF
|07C074| STA.w $0364

|07C077| STZ.b $46

|07C079| LDA.b #$0E ; LINKSTATE 0E
|07C07B| STA.b $5D

|07C07D| RTS

;===================================================================================================

CheckOverworldHopTiles_Vertical:
|07C07E| LDA.w $036E
|07C081| AND.b #$70
|07C083| BEQ OverworldRecoverAndDoGraves

|07C085| LDA.w $036D
|07C088| AND.b #$77
|07C08A| BNE OverworldRecoverAndDoGraves

|07C08C| JSR RunLedgeHopTimer
|07C08F| BCC OverworldRecoverAndDoGraves

|07C091| JSR CancelDash

|07C094| LDA.b #$20 ; SFX2.20
|07C096| JSR PlayLinkSFX2Panned

|07C099| LDY.b #$03

|07C09B| LDA.w $036E
|07C09E| AND.b #$40
|07C0A0| BNE .diagonal_north_ledge

|07C0A2| LDY.b #$02

.diagonal_north_ledge
|07C0A4| STY.b $66

|07C0A6| LDA.b #$01
|07C0A8| STA.w $037B

|07C0AB| STZ.b $48
|07C0AD| STZ.b $5E

|07C0AF| BRL FindValidLandingTile_DiagonalNorth

;===================================================================================================

OverworldRecoverAndDoGraves:
|07C0B2| LDA.b $58
|07C0B4| AND.b #$07
|07C0B6| CMP.b #$07
|07C0B8| BNE OverworldHandleStairsAndPushGraves

|07C0BA| LDA.b $46
|07C0BC| BEQ .not_recoiling

|07C0BE| LDA.b $58
|07C0C0| AND.b #$07
|07C0C2| STA.b $0E

|07C0C4| BRL HandlePushingBonkingSnaps_Vertical

.not_recoiling
|07C0C7| LDA.b $66
|07C0C9| AND.b #$02
|07C0CB| BNE OverworldHandleStairsAndPushGraves

|07C0CD| LDA.b #$02
|07C0CF| STA.b $5E

|07C0D1| LDA.b #$01
|07C0D3| STA.b $57

|07C0D5| RTS

;===================================================================================================

OverworldHandleStairsAndPushGraves:
|07C0D6| LDA.b $5E
|07C0D8| CMP.b #$02
|07C0DA| BNE .not_stair_speed

|07C0DC| LDX.b #$10

|07C0DE| LDA.w $0372
|07C0E1| BNE .dashing

|07C0E3| LDX.b #$00

.dashing
|07C0E5| STX.b $5E

.not_stair_speed
|07C0E7| LDA.b $57
|07C0E9| CMP.b #$01
|07C0EB| BNE .not_slow_speed

|07C0ED| LDX.b #$02
|07C0EF| STX.b $57

.not_slow_speed
|07C0F1| LDA.b $0C
|07C0F3| AND.b #$05
|07C0F5| BEQ CheckForGravePush

|07C0F7| LDA.b $0E
|07C0F9| AND.b #$07
|07C0FB| BNE CheckForGravePush

|07C0FD| JSR FlagMovingIntoSlopes_Vertical

|07C100| LDA.b $6B
|07C102| AND.b #$0F
|07C104| BEQ CheckForGravePush

|07C106| RTS

;===================================================================================================

CheckForGravePush:
|07C107| STZ.b $6B

|07C109| LDA.w $02E7
|07C10C| AND.b #$02
|07C10E| BEQ .reset_push_timer

|07C110| LDA.b $66
|07C112| BNE .reset_push_timer

|07C114| LDA.w $0372
|07C117| BNE .dashing

|07C119| DEC.b $61
|07C11B| BPL CheckForSpikeTouch

.dashing
|07C11D| LDA.b $0E
|07C11F| PHA

|07C120| LDY.b #$04
|07C122| LDA.b #$24 ; ANCILLA 24
|07C124| JSL AncillaAdd_GraveStone

|07C128| PLA
|07C129| STA.b $0E

.reset_push_timer
|07C12B| LDA.b #$34
|07C12D| STA.b $61

;===================================================================================================

CheckForSpikeTouch:
|07C12F| LDA.w $02E8
|07C132| AND.b #$07
|07C134| BEQ .not_touching_spike

|07C136| LDA.b $46
|07C138| ORA.w $031F
|07C13B| ORA.b $55
|07C13D| BNE .invulnerable

|07C13F| LDA.b $20

|07C141| LDY.b $66
|07C143| BNE .didnt_move

|07C145| AND.b #$04
|07C147| BEQ .not_on_4px_edge

|07C149| BRA .not_touching_spike

.didnt_move
|07C14B| AND.b #$04
|07C14D| BEQ .not_touching_spike

.not_on_4px_edge
|07C14F| LDA.l $7EF35B
|07C153| TAY

|07C154| LDA.w SpikeDamageValues,Y
|07C157| STA.w $0373

|07C15A| JSR CancelDash
|07C15D| JSR ForciblyUnequipCape_quietly

|07C160| BRL LinkApplyTileRebound

.invulnerable
|07C163| LDA.w $02E8
|07C166| AND.b #$07
|07C168| STA.b $0E

.not_touching_spike
|07C16A| BRL HandlePushingBonkingSnaps_Vertical

;===================================================================================================

RunLedgeHopTimer:
|07C16D| LDA.b $4D
|07C16F| CMP.b #$01
|07C171| BEQ .restore_coordinates

|07C173| LDA.w $0372
|07C176| BNE .dashing

|07C178| DEC.w $0375
|07C17B| BPL .restore_coordinates

|07C17D| LDA.b #$13
|07C17F| STA.w $0375

|07C182| BRA .exit_and_set

.dashing
|07C184| JSR .restore_coordinates

.exit_and_set
|07C187| SEC

|07C188| RTS

;---------------------------------------------------------------------------------------------------

.restore_coordinates
|07C189| REP #$20

|07C18B| LDA.w $0FC4
|07C18E| STA.b $20

|07C190| LDA.w $0FC2
|07C193| STA.b $22

|07C195| SEP #$20

|07C197| STZ.b $2A
|07C199| STZ.b $2B

|07C19B| LDA.b $1B
|07C19D| BNE EXIT_AND_CLC

;---------------------------------------------------------------------------------------------------

#EXIT_AND_CLC:
|07C19F| CLC

|07C1A0| RTS

;===================================================================================================

BonkAndSmash:
|07C1A1| LDA.w $0372
|07C1A4| BEQ EXIT_AND_CLC

|07C1A6| LDA.w $02F1
|07C1A9| CMP.b #$40
|07C1AB| BEQ EXIT_AND_CLC

|07C1AD| LDA.w $02EF
|07C1B0| AND.b #$70
|07C1B2| BEQ EXIT_AND_CLC

|07C1B4| JSL SmashRockPileFromHere
|07C1B8| BCC .didnt_break_here

|07C1BA| JSR .break_pile

.didnt_break_here
|07C1BD| JSL SmashRockPileFromAbove
|07C1C1| BCC .exit

;---------------------------------------------------------------------------------------------------

.break_pile
|07C1C3| LDX.b #$08

.check_next
|07C1C5| CMP.w LinkToss.liftable_tiles,X
|07C1C8| BEQ .match

|07C1CA| DEX
|07C1CB| BPL .check_next

|07C1CD| BRA .exit

;---------------------------------------------------------------------------------------------------

.match
|07C1CF| CPX.b #$02
|07C1D1| BEQ .play_sfx

|07C1D3| CPX.b #$04
|07C1D5| BNE .skip_sfx

.play_sfx
|07C1D7| PHX

|07C1D8| LDA.b #$32 ; SFX3.32
|07C1DA| JSR PlayLinkSFX3Panned

|07C1DD| PLX

.skip_sfx
|07C1DE| TXA
|07C1DF| JSL SpawnImmediatelySmashedTerrain

.exit
|07C1E3| RTS

;===================================================================================================

AddInLinksYVelocityFalling:
|07C1E4| REP #$20

|07C1E6| LDA.b $51
|07C1E8| AND.w #$0007

|07C1EB| LDY.b $30
|07C1ED| BPL .positive

|07C1EF| SEC
|07C1F0| SBC.w #$0008

.positive
|07C1F3| EOR.w #$FFFF
|07C1F6| INC A

|07C1F7| CLC
|07C1F8| ADC.b $20
|07C1FA| STA.b $20

|07C1FC| SEP #$20

|07C1FE| RTS

;===================================================================================================

CalculateSnapScratch_Vertical:
|07C1FF| LDA.b $0E
|07C201| AND.b #$04
|07C203| BEQ .invert_first

|07C205| LDY.b #$01
|07C207| LDA.b $30
|07C209| BMI .negative_y_a

|07C20B| EOR.b #$FF
|07C20D| INC A

.negative_y_a
|07C20E| BPL .positive_y_a

|07C210| LDY.b #$FF

.positive_y_a
|07C212| STY.b $00
|07C214| STZ.b $01

|07C216| BRA AddAbsoluteScratchToXCoord

.invert_first
|07C218| LDY.b #$01

|07C21A| LDA.b $30
|07C21C| BPL .positive_y_b

|07C21E| EOR.b #$FF
|07C220| INC A

.positive_y_b
|07C221| BPL .positive_y_c

|07C223| LDY.b #$FF

.positive_y_c
|07C225| STY.b $00
|07C227| STZ.b $01

;===================================================================================================

AddAbsoluteScratchToXCoord:
|07C229| REP #$20

|07C22B| LDA.b $00
|07C22D| CMP.w #$0080
|07C230| BCC .positive

|07C232| ORA.w #$FF00

.positive
|07C235| CLC
|07C236| ADC.b $22
|07C238| STA.b $22

|07C23A| SEP #$20

|07C23C| RTS

;===================================================================================================

ChangeAxisOfPerpendicularDoorMovement_Vertical:
|07C23D| LDA.b #$02
|07C23F| TSB.b $50

|07C241| LDA.b $0E
|07C243| LSR A
|07C244| LSR A
|07C245| LSR A
|07C246| LSR A
|07C247| ORA.b $0E
|07C249| AND.b #$0F
|07C24B| STA.b $00

|07C24D| AND.b #$07
|07C24F| BNE .dont_clear_doorway

|07C251| STZ.b $6C

|07C253| BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_clear_doorway
|07C255| LDA.b $22
|07C257| CMP.b #$80
|07C259| BCC .x_low_positive

|07C25B| LDY.b #$01

|07C25D| LDA.b $30
|07C25F| BMI .keep_negative_x

|07C261| EOR.b #$FF
|07C263| INC A

.keep_negative_x
|07C264| BPL .keep_y1_positive

|07C266| LDY.b #$FF

.keep_y1_positive
|07C268| STY.b $00
|07C26A| STZ.b $01

|07C26C| LDY.b #$04
|07C26E| BRA .continue

;---------------------------------------------------------------------------------------------------

.x_low_positive
|07C270| LDY.b #$01

|07C272| LDA.b $30
|07C274| BPL .keep_positive_x

|07C276| EOR.b #$FF
|07C278| INC A

.keep_positive_x
|07C279| BPL .keep_y2_positive

|07C27B| LDY.b #$FF

.keep_y2_positive
|07C27D| STY.b $00
|07C27F| STZ.b $01

|07C281| LDY.b #$06

.continue
|07C283| LDA.b $50
|07C285| AND.b #$01
|07C287| BNE .cannot_turn

|07C289| STY.b $2F

.cannot_turn
|07C28B| REP #$20

|07C28D| LDA.b $00
|07C28F| CMP.w #$0080
|07C292| BCC .positive

|07C294| ORA.w #$FF00

.positive
|07C297| CLC
|07C298| ADC.b $22
|07C29A| STA.b $22

|07C29C| SEP #$20

.exit
|07C29E| RTS

;===================================================================================================

AddInLinksYVelocity:
|07C29F| REP #$20

|07C2A1| LDA.b $30
|07C2A3| AND.w #$00FF
|07C2A6| CMP.w #$0080
|07C2A9| BCC .positive

|07C2AB| ORA.w #$FF00

.positive
|07C2AE| EOR.w #$FFFF
|07C2B1| INC A
|07C2B2| CLC
|07C2B3| ADC.b $20
|07C2B5| STA.b $20

|07C2B7| SEP #$20

|07C2B9| RTS

;===================================================================================================

pool HopInOrOutOfWater_Vertical

.speed_y
|07C2BA| db 24, 16, 16

.speed_z
|07C2BD| db 36, 24, 24

.timer
|07C2C0| db 16, 16, 16

endpool

;---------------------------------------------------------------------------------------------------

HopInOrOutOfWater_Vertical:
|07C2C3| LDA.b $1B
|07C2C5| BNE .indoors

|07C2C7| LDX.b #$02
|07C2C9| BRA .continue

.indoors
|07C2CB| LDX.b $1D

|07C2CD| LDA.w $047A
|07C2D0| BEQ .continue

|07C2D2| LDX.b #$00

.continue
|07C2D4| STX.b $00

|07C2D6| LDA.w .speed_y,X
|07C2D9| TAX

|07C2DA| LDA.b $66
|07C2DC| BNE .dont_invert

|07C2DE| TXA
|07C2DF| EOR.b #$FF
|07C2E1| INC A
|07C2E2| TAX

.dont_invert
|07C2E3| STX.b $27
|07C2E5| STZ.b $28

|07C2E7| LDX.b $00

|07C2E9| LDA.w .speed_z,X
|07C2EC| STA.b $29
|07C2EE| STA.w $02C7

|07C2F1| STZ.b $24
|07C2F3| STZ.b $25

|07C2F5| LDA.w .timer,X
|07C2F8| STA.b $46

|07C2FA| LDA.b $4D
|07C2FC| CMP.b #$02
|07C2FE| BEQ .already_recoiling

|07C300| LDA.b #$01
|07C302| STA.b $4D

|07C304| STZ.w $0360

.already_recoiling
|07C307| LDA.b #$06 ; LINKSTATE 06
|07C309| STA.b $5D

|07C30B| RTS

;===================================================================================================

pool FindValidLandingTile_North

.recoil_y
|07C30C| db $10, $10, $14, $14, $18, $18, $1C, $1C
|07C314| db $20, $20, $24, $24, $28, $28, $2C, $2C
|07C31C| db $30, $30, $30, $30, $30, $30, $30, $30
|07C324| db $30, $30, $30, $30, $30, $30, $30, $30

.recoil_z
|07C32C| db $18, $18, $18, $18, $1C, $1C, $1C, $1C
|07C334| db $20, $20, $20, $20, $24, $24, $24, $24
|07C33C| db $28, $28, $28, $28, $2C, $2C, $2C, $2C
|07C344| db $30, $30, $30, $30, $34, $34, $34, $34

.timer
|07C34C| db $10, $10, $14, $14, $18, $18, $1C, $1C
|07C354| db $20, $20, $24, $24, $28, $28, $2C, $2C
|07C35C| db $30, $30, $30, $30, $30, $30, $30, $30
|07C364| db $30, $30, $30, $30, $30, $30, $30, $30

endpool

;---------------------------------------------------------------------------------------------------

FindValidLandingTile_North:
|07C36C| LDA.b $20
|07C36E| STA.b $32

|07C370| PHA

|07C371| LDA.b $21
|07C373| STA.b $33

|07C375| PHA

;---------------------------------------------------------------------------------------------------

.next
|07C376| REP #$20

|07C378| LDA.b $20
|07C37A| SEC
|07C37B| SBC.w #$0010
|07C37E| STA.b $20

|07C380| SEP #$20

|07C382| LDA.b $66
|07C384| ASL A
|07C385| TAY

|07C386| JSR TileDetectOnMovement_Vertical

|07C389| LDA.w $0343
|07C38C| ORA.w $035B
|07C38F| ORA.w $0357
|07C392| ORA.w $0341

|07C395| AND.b #$07
|07C397| CMP.b #$07
|07C399| BNE .next

;---------------------------------------------------------------------------------------------------

|07C39B| LDA.w $0341
|07C39E| AND.b #$07
|07C3A0| BEQ .didnt_find_water

|07C3A2| LDA.b #$01
|07C3A4| STA.b $4D

|07C3A6| STZ.w $0360

|07C3A9| LDA.b #$01
|07C3AB| STA.w $0345

|07C3AE| LDA.b $26
|07C3B0| STA.w $0340

|07C3B3| JSL ResetSwimmingState

|07C3B7| STZ.w $0376
|07C3BA| STZ.b $5E

;---------------------------------------------------------------------------------------------------

.didnt_find_water
|07C3BC| REP #$20

|07C3BE| LDA.b $20
|07C3C0| SEC
|07C3C1| SBC.w #$0010
|07C3C4| STA.b $20

|07C3C6| LDA.b $32
|07C3C8| SEC
|07C3C9| SBC.b $20
|07C3CB| STA.b $32

;---------------------------------------------------------------------------------------------------

|07C3CD| SEP #$20

|07C3CF| PLA
|07C3D0| STA.b $21

|07C3D2| PLA
|07C3D3| STA.b $20

|07C3D5| LDA.b $32
|07C3D7| LSR A
|07C3D8| LSR A
|07C3D9| LSR A
|07C3DA| TAY

|07C3DB| LDA.w .recoil_y,Y
|07C3DE| TAX

|07C3DF| LDA.b $66
|07C3E1| BNE .dont_flip

|07C3E3| TXA
|07C3E4| EOR.b #$FF
|07C3E6| INC A
|07C3E7| TAX

.dont_flip
|07C3E8| STX.b $27
|07C3EA| STZ.b $28

|07C3EC| LDA.w .recoil_z,Y
|07C3EF| STA.b $29
|07C3F1| STA.w $02C7

|07C3F4| STZ.b $24
|07C3F6| STZ.b $25

|07C3F8| LDA.w .timer,Y
|07C3FB| STA.b $46

|07C3FD| LDA.b #$02
|07C3FF| STA.b $4D

|07C401| STZ.w $0360

|07C404| LDA.b #$06 ; LINKSTATE 06
|07C406| STA.b $5D

|07C408| RTS

;===================================================================================================

pool FindValidLandingTile_DiagonalNorth

.recoil_y
|07C409| db $08, $08, $08, $08, $10, $10, $14, $14
|07C411| db $18, $18, $18, $18, $20, $20, $20, $20
|07C419| db $08, $14, $14, $14, $18, $18, $18, $18
|07C421| db $1C, $1C, $1C, $1C, $20, $20, $20, $20

.recoil_x
|07C429| db $08, $08, $08, $08, $10, $10, $10, $10
|07C431| db $18, $18, $18, $18, $10, $10, $10, $10
|07C439| db $08, $14, $14, $14, $18, $18, $18, $18
|07C441| db $1C, $1C, $1C, $1C, $20, $20, $20, $20

.recoil_z
|07C449| db $20, $20, $20, $20, $20, $20, $20, $20
|07C451| db $24, $24, $24, $24, $28, $28, $28, $28
|07C459| db $20, $28, $28, $28, $2C, $2C, $2C, $2C
|07C461| db $30, $30, $30, $30, $34, $34, $34, $34
|07C469| db $E0, $FF, $20, $00

endpool

;---------------------------------------------------------------------------------------------------

FindValidLandingTile_DiagonalNorth:
|07C46D| LDA.b $3E
|07C46F| PHA

|07C470| LDA.b $22
|07C472| PHA

|07C473| LDA.b $23
|07C475| PHA

|07C476| LDX.b $66
|07C478| PHX

|07C479| LDY.b #$01
|07C47B| CPX.b #$02
|07C47D| BNE .positive

|07C47F| LDY.b #$FF

.positive
|07C481| STY.b $28

|07C483| LDA.b #$00
|07C485| STA.b $66

|07C487| JSR FindLandingSpotDiagonallyDown

|07C48A| PLX

|07C48B| PLA
|07C48C| STA.b $23

|07C48E| PLA
|07C48F| STA.b $22

|07C491| PLA
|07C492| STA.b $3E

;---------------------------------------------------------------------------------------------------

|07C494| REP #$20

|07C496| LDA.b $32
|07C498| SEC
|07C499| SBC.b $20
|07C49B| LSR A
|07C49C| LSR A
|07C49D| LSR A
|07C49E| TAY

|07C49F| LDA.b $32
|07C4A1| STA.b $20

|07C4A3| SEP #$20

|07C4A5| LDA.w .recoil_y,Y
|07C4A8| EOR.b #$FF
|07C4AA| INC A
|07C4AB| STA.b $27

|07C4AD| LDA.w .recoil_x,Y
|07C4B0| CPX.b #$02
|07C4B2| BNE .dont_flip_sign

|07C4B4| EOR.b #$FF
|07C4B6| INC A

.dont_flip_sign
|07C4B7| STA.b $28

|07C4B9| LDA.w .recoil_z,Y
|07C4BC| STA.b $29
|07C4BE| STA.w $02C7

|07C4C1| STZ.b $24
|07C4C3| STZ.b $25
|07C4C5| STZ.w $0364

|07C4C8| LDA.b #$02
|07C4CA| STA.b $4D

|07C4CC| STZ.w $0360

|07C4CF| LDA.b #$0D ; LINKSTATE 0D
|07C4D1| STA.b $5D

|07C4D3| RTS

;===================================================================================================

StartMovementCollisionChecks_Horizontal:
|07C4D4| LDA.b $31
|07C4D6| BNE .moving_on_axis

|07C4D8| RTS

.moving_on_axis
|07C4D9| LDA.b $6C
|07C4DB| CMP.b #$02
|07C4DD| BNE .not_in_horizontal_door

|07C4DF| LDY.b #$04

|07C4E1| LDA.b $22
|07C4E3| CMP.b #$80
|07C4E5| BCC .negative_x
|07C4E7| BRA .continue_x

.not_in_horizontal_door
|07C4E9| LDY.b #$04
|07C4EB| LDA.b $31
|07C4ED| BMI .negative_x

.continue_x
|07C4EF| LDY.b #$06

.negative_x
|07C4F1| TYA
|07C4F2| LSR A
|07C4F3| STA.b $66

|07C4F5| JSR TileDetectOnMovement_Horizontal

|07C4F8| LDA.b $1B
|07C4FA| BNE StartMovementCollisionChecks_Horizontal_HandleIndoors

|07C4FC| BRL StartMovementCollisionChecks_Horizontal_HandleOutdoors

;===================================================================================================

StartMovementCollisionChecks_Horizontal_HandleIndoors:
|07C4FF| LDA.w $0308
|07C502| BMI .carrying_something

|07C504| LDA.b $46
|07C506| BEQ .not_taking_damage

.carrying_something
|07C508| LDA.b $0E
|07C50A| LSR A
|07C50B| LSR A
|07C50C| LSR A
|07C50D| LSR A
|07C50E| TSB.b $0E

|07C510| BRL ResetDoorPropsHorizontal

;---------------------------------------------------------------------------------------------------

.not_taking_damage
|07C513| LDA.b $6A
|07C515| BNE .not_moving_diagonally

|07C517| STZ.b $57

.not_moving_diagonally
|07C519| LDA.b $6C
|07C51B| CMP.b #$01
|07C51D| BNE HandleAutoDoorFlagging_Horizontal

|07C51F| LDA.b $6A
|07C521| BNE HandleAutoDoorFlagging_Horizontal

|07C523| LDA.w $046C
|07C526| CMP.b #$03
|07C528| BNE .no_moving_floor

|07C52A| LDA.b $EE
|07C52C| BEQ .no_moving_floor

|07C52E| BRL CheckForMasksRupeesConveyors_Horizontal

.no_moving_floor
|07C531| JSR SnapOnX
|07C534| JSR ChangeAxisOfPerpendicularDoorMovement_Horizontal
|07C537| BRL HandleNudgingInADoor

;===================================================================================================

HandleAutoDoorFlagging_Horizontal:
|07C53A| LDA.b $0E
|07C53C| AND.b #$70
|07C53E| BEQ ResetDoorPropsHorizontal

|07C540| STZ.b $05

|07C542| LDA.b $0F
|07C544| AND.b #$07
|07C546| BEQ .no_auto_move

|07C548| LDY.b #$02

|07C54A| LDA.b $31
|07C54C| BMI .negative_x

|07C54E| LDY.b #$03

.negative_x
|07C550| LDA.w AutoMove49Directions,Y
|07C553| STA.b $49

;---------------------------------------------------------------------------------------------------

.no_auto_move
|07C555| LDA.b #$02
|07C557| STA.b $6C

|07C559| STZ.w $03F3

|07C55C| LDA.b $0E
|07C55E| AND.b #$70
|07C560| CMP.b #$70
|07C562| BEQ .dont_snap

|07C564| LDA.b $0E
|07C566| AND.b #$07
|07C568| BNE .go_snap

|07C56A| LDA.b $0E
|07C56C| AND.b #$70
|07C56E| BNE .dont_snap

|07C570| BRA ResetDoorPropsHorizontal

.go_snap
|07C572| STZ.b $6B
|07C574| STZ.b $6C

|07C576| JSR SnapOnX

|07C579| JML CalculateSnapScratch_Horizontal

.dont_snap
|07C57D| LDA.w $0315
|07C580| AND.b #$02
|07C582| BNE .exit

|07C584| LDA.b $50
|07C586| AND.b #$FD
|07C588| STA.b $50

.exit
|07C58A| RTS

;===================================================================================================

ResetDoorPropsHorizontal:
|07C58B| LDA.w $0315
|07C58E| AND.b #$02
|07C590| BNE CheckForMasksRupeesConveyors_Horizontal

|07C592| LDA.b $50
|07C594| AND.b #$FD
|07C596| STA.b $50

|07C598| STZ.b $6C
|07C59A| STZ.b $EF
|07C59C| STZ.b $49

;===================================================================================================

CheckForMasksRupeesConveyors_Horizontal:
|07C59E| LDA.b $0E
|07C5A0| AND.b #$02
|07C5A2| BNE HandleMasksRupeesConveyors_Horizontal

|07C5A4| LDA.b $0C
|07C5A6| AND.b #$05
|07C5A8| BEQ HandleMasksRupeesConveyors_Horizontal

|07C5AA| STZ.w $03F3

|07C5AD| JSR FlagMovingIntoSlopes_Horizontal

|07C5B0| LDA.b $6B
|07C5B2| AND.b #$0F
|07C5B4| BEQ HandleMasksRupeesConveyors_Horizontal

|07C5B6| RTS

;===================================================================================================

HandleMasksRupeesConveyors_Horizontal:
|07C5B7| STZ.b $6B

|07C5B9| LDA.b $EE
|07C5BB| BNE .lower_layer

|07C5BD| LDA.w $034C
|07C5C0| AND.b #$07
|07C5C2| BEQ .no_mask_1C

|07C5C4| LDA.b #$01
|07C5C6| TSB.w $0322

|07C5C9| BRA .check_for_rupee_tiles

;---------------------------------------------------------------------------------------------------

.no_mask_1C
|07C5CB| LDA.w $02E8
|07C5CE| AND.b #$07
|07C5D0| BNE .check_for_rupee_tiles

|07C5D2| LDA.b $0E
|07C5D4| AND.b #$02
|07C5D6| BNE .check_for_rupee_tiles

|07C5D8| LDA.w $0322
|07C5DB| AND.b #$FE
|07C5DD| STA.w $0322
|07C5E0| BRA .check_for_rupee_tiles

.lower_layer
|07C5E2| LDA.w $0320
|07C5E5| AND.b #$07
|07C5E7| BEQ .no_mask0C

|07C5E9| LDA.b #$02
|07C5EB| TSB.w $0322

|07C5EE| BRA .check_for_rupee_tiles

.no_mask0C
|07C5F0| LDA.w $0322
|07C5F3| AND.b #$FD
|07C5F5| STA.w $0322

;---------------------------------------------------------------------------------------------------

.check_for_rupee_tiles
|07C5F8| LDA.w $02F7
|07C5FB| AND.b #$22
|07C5FD| BEQ .no_rupee_tiles

|07C5FF| LDX.b #$00
|07C601| AND.b #$20
|07C603| BEQ .no_rupee_from_this_side

|07C605| LDX.b #$08

.no_rupee_from_this_side
|07C607| STX.b $00

|07C609| STZ.b $01

|07C60B| LDA.b $66
|07C60D| ASL A
|07C60E| TAY

|07C60F| REP #$20

|07C611| LDA.l $7EF360
|07C615| CLC
|07C616| ADC.w #$0005
|07C619| STA.l $7EF360

|07C61D| LDA.b $20
|07C61F| CLC
|07C620| ADC.w RupeeTileOffset_y,Y
|07C623| SEC
|07C624| SBC.b $00
|07C626| STA.b $00

|07C628| LDA.b $22
|07C62A| CLC
|07C62B| ADC.w RupeeTileOffset_x,Y
|07C62E| STA.b $02

|07C630| SEP #$20

|07C632| JSL DeleteRupeeTile

|07C636| LDA.b #$0A ; SFX3.0A
|07C638| JSR PlayLinkSFX3Panned

;---------------------------------------------------------------------------------------------------

.no_rupee_tiles
|07C63B| LDY.b #$01 ; up

|07C63D| LDA.w $03F1
|07C640| AND.b #$22
|07C642| BEQ .no_conveyor_ud

|07C644| AND.b #$20
|07C646| BEQ .up_conveyor

|07C648| LDY.b #$02 ; down

.up_conveyor
|07C64A| STY.w $03F3

|07C64D| BRA CheckForLedgeTile_Horizontal

;---------------------------------------------------------------------------------------------------

.no_conveyor_ud
|07C64F| LDY.b #$03 ; left

|07C651| LDA.w $03F2
|07C654| AND.b #$22
|07C656| BEQ .no_conveyor_lr

|07C658| AND.b #$20
|07C65A| BEQ .left_conveyor

|07C65C| LDY.b #$04 ; right

.left_conveyor
|07C65E| STY.w $03F3

|07C661| BRA CheckForLedgeTile_Horizontal

;---------------------------------------------------------------------------------------------------

.no_conveyor_lr
|07C663| LDA.w $02E8
|07C666| AND.b #$07
|07C668| BNE CheckForLedgeTile_Horizontal

|07C66A| LDA.b $0E
|07C66C| AND.b #$02
|07C66E| BNE CheckForLedgeTile_Horizontal

|07C670| STZ.w $03F3

;===================================================================================================

CheckForLedgeTile_Horizontal:
|07C673| LDA.w $036E
|07C676| AND.b #$07
|07C678| CMP.b #$07
|07C67A| BNE CheckForWaterTiles_Horizontal

|07C67C| JSR RunLedgeHopTimer
|07C67F| BCC CheckForWaterTiles_Horizontal

|07C681| JSR CancelDash

|07C684| INC.w $047A

|07C687| LDA.b #$02
|07C689| STA.b $4D

|07C68B| BRA HandleUnderworldHopOntoWater_Horizontal

;===================================================================================================

CheckForWaterTiles_Horizontal:
|07C68D| LDA.w $0341
|07C690| AND.b #$07
|07C692| CMP.b #$07
|07C694| BNE .not_deep_water

|07C696| LDA.w $0345
|07C699| BNE .not_deep_water

|07C69B| LDA.b $5D
|07C69D| CMP.b #$06 ; LINKSTATE 06
|07C69F| BEQ .not_deep_water

|07C6A1| LDA.b $3E
|07C6A3| STA.b $20

|07C6A5| LDA.b $40
|07C6A7| STA.b $21

|07C6A9| LDA.b $3F
|07C6AB| STA.b $22

|07C6AD| LDA.b $41
|07C6AF| STA.b $23

|07C6B1| JSR CancelDash

|07C6B4| LDA.b $1D
|07C6B6| BNE .dont_change_layer

|07C6B8| JSL HandleLayerChange
|07C6BC| BRA HandleUnderworldHopOntoWater_Horizontal

.dont_change_layer
|07C6BE| LDA.b #$01
|07C6C0| STA.w $0345

|07C6C3| LDA.b $26
|07C6C5| STA.w $0340

|07C6C8| STZ.w $0308
|07C6CB| STZ.w $0309

|07C6CE| STZ.w $0376

|07C6D1| STZ.b $5E

|07C6D3| JSL ResetSwimmingState

;===================================================================================================

#HandleUnderworldHopOntoWater_Horizontal:
|07C6D7| LDA.b #$01
|07C6D9| STA.w $037B

|07C6DC| JSR HopInOrOutOfWater_Horizontal

|07C6DF| LDA.b #$20 ; SFX2.20
|07C6E1| JSR PlayLinkSFX2Panned

|07C6E4| BRA HandleUnderworldPitSlip_Horizontal

.not_deep_water
|07C6E6| LDA.w $0343
|07C6E9| AND.b #$07
|07C6EB| CMP.b #$07
|07C6ED| BNE HandleUnderworldPitSlip_Horizontal

|07C6EF| LDA.w $0345
|07C6F2| BEQ HandleUnderworldPitSlip_Horizontal

|07C6F4| LDA.b $4D
|07C6F6| BEQ .not_in_recoil

|07C6F8| LDA.b #$07
|07C6FA| STA.b $0E
|07C6FC| BRA HandleUnderworldPitSlip_Horizontal

.not_in_recoil
|07C6FE| JSR CancelDash

|07C701| LDA.b $4D
|07C703| BNE HandleUnderworldPitSlip_Horizontal

|07C705| LDA.w $0340
|07C708| STA.b $26

|07C70A| STZ.w $0345

|07C70D| LDA.b #$15 ; ANCILLA 15
|07C70F| LDY.b #$00
|07C711| JSL AncillaAdd_Splash

|07C715| LDA.b #$01
|07C717| STA.w $037B

|07C71A| JSR HopInOrOutOfWater_Horizontal

;===================================================================================================

HandleUnderworldPitSlip_Horizontal:
|07C71D| LDA.b $59
|07C71F| AND.b #$05
|07C721| BEQ HandleUnderworldSpikeBlockCollision_Horizontal

|07C723| LDA.b $0E
|07C725| AND.b #$02
|07C727| BNE HandleUnderworldSpikeBlockCollision_Horizontal

|07C729| LDA.b $5D
|07C72B| CMP.b #$05 ; LINKSTATE 05
|07C72D| BEQ .exit

|07C72F| CMP.b #$02 ; LINKSTATE 02
|07C731| BEQ .exit

|07C733| LDA.b #$09
|07C735| STA.b $5C

|07C737| STZ.b $5A

|07C739| LDA.b #$01
|07C73B| STA.b $5B

|07C73D| LDA.b #$01 ; LINKSTATE 01
|07C73F| STA.b $5D

.exit
|07C741| RTS

;===================================================================================================

HandleUnderworldSpikeBlockCollision_Horizontal:
|07C742| STZ.b $5B

|07C744| LDA.w $02E8
|07C747| AND.b #$07
|07C749| BEQ .check_collision_type

|07C74B| LDA.b $46
|07C74D| ORA.w $031F
|07C750| ORA.b $55
|07C752| BNE .no_spike_damage

|07C754| LDA.b $22

|07C756| LDY.b $66
|07C758| CPY.b #$02
|07C75A| BNE .didnt_move

|07C75C| AND.b #$04
|07C75E| BEQ .not_on_4px_edge
|07C760| BRA .check_collision_type

.didnt_move
|07C762| AND.b #$04
|07C764| BEQ .check_collision_type

.not_on_4px_edge
|07C766| LDA.w $031F
|07C769| BNE .check_collision_type

|07C76B| LDA.l $7EF35B
|07C76F| TAY

|07C770| LDA.w SpikeDamageValues,Y
|07C773| STA.w $0373

|07C776| JSR CancelDash
|07C779| JSR ForciblyUnequipCape_quietly

|07C77C| BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.no_spike_damage
|07C77F| LDA.w $02E8
|07C782| AND.b #$07
|07C784| STA.b $0E

.check_collision_type
|07C786| LDA.w $046C
|07C789| BEQ .ignore_layer

|07C78B| CMP.b #$04
|07C78D| BEQ .ignore_layer

|07C78F| LDA.b $EE
|07C791| BNE CancelStairDragWithHorizontals

.ignore_layer
|07C793| LDA.b $5F
|07C795| ORA.b $60
|07C797| BEQ .not_pushing_block

|07C799| LDA.b $6A
|07C79B| BNE .not_pushing_block

|07C79D| LDA.b $5F
|07C79F| STA.w $02C2

|07C7A2| DEC.b $61
|07C7A4| BPL CancelStairDragWithHorizontals

;---------------------------------------------------------------------------------------------------

|07C7A6| REP #$20

|07C7A8| LDY.b #$0F
|07C7AA| LDA.b $5F

.check_next_block
|07C7AC| ASL A
|07C7AD| BCC .skip_block

|07C7AF| PHA
|07C7B0| PHY

|07C7B1| SEP #$20

|07C7B3| JSR FindFreeMovingBlockSlot
|07C7B6| BCS .no_free_slot

|07C7B8| STX.b $0E

|07C7BA| TYA
|07C7BB| ASL A
|07C7BC| TAX

|07C7BD| JSR InitializePushBlock
|07C7C0| BCS .no_free_slot

|07C7C2| LDA.b $0E
|07C7C4| ASL A
|07C7C5| TAY

|07C7C6| JSR DrawSinglePushBlock

|07C7C9| TYX

|07C7CA| LDY.b $66

|07C7CC| TYA
|07C7CD| ASL A
|07C7CE| STA.w $05F8,X
|07C7D1| STA.w $0474

|07C7D4| LDA.w $05E4,X

|07C7D7| CPY.b #$02
|07C7D9| BEQ .not_pushing_left

|07C7DB| DEC A

.not_pushing_left
|07C7DC| AND.b #$0F
|07C7DE| STA.w $05E8,X

.no_free_slot
|07C7E1| REP #$20

|07C7E3| PLY
|07C7E4| PLA

.skip_block
|07C7E5| DEY
|07C7E6| BPL .check_next_block

;---------------------------------------------------------------------------------------------------

|07C7E8| SEP #$20

.not_pushing_block
|07C7EA| LDA.b #$15
|07C7EC| STA.b $61

;===================================================================================================

CancelStairDragWithHorizontals:
|07C7EE| LDA.b $6A
|07C7F0| BNE HandlePushingBonkingSnaps_Horizontal

|07C7F2| STZ.b $57

|07C7F4| LDA.b $5E
|07C7F6| CMP.b #$02
|07C7F8| BNE HandlePushingBonkingSnaps_Horizontal

|07C7FA| STZ.b $5E

;===================================================================================================

HandlePushingBonkingSnaps_Horizontal:
|07C7FC| LDA.b $0E
|07C7FE| AND.b #$07
|07C800| BNE .check_swimming

|07C802| BRL RestartPushingTimer_UnflagDoors_Horizontal

.check_swimming
|07C805| LDA.b $5D
|07C807| CMP.b #$04 ; LINKSTATE 04
|07C809| BNE .not_swimming_or_moving

|07C80B| LDA.w $0312
|07C80E| BNE .not_swimming_or_moving

|07C810| JSR ResetAllAcceleration

.not_swimming_or_moving
|07C813| LDA.b $0E
|07C815| AND.b #$02
|07C817| BEQ .do_no_bonk

|07C819| LDA.b $0E
|07C81B| PHA

|07C81C| JSR BonkAndSmash
|07C81F| JSR RepelDash

|07C822| PLA
|07C823| STA.b $0E

.do_no_bonk
|07C825| LDA.b #$01
|07C827| STA.w $0302

|07C82A| LDA.b $0E
|07C82C| AND.b #$07
|07C82E| CMP.b #$07
|07C830| BNE .no_x_snap

|07C832| JSR SnapOnX
|07C835| BRA .check_for_bonk

.no_x_snap
|07C837| LDA.b $6A
|07C839| CMP.b #$02
|07C83B| BNE .not_horizontally_facing_diagonal

.diagonal_facing_vertically
|07C83D| BRL RestartPushingTimer_Horizontal

.not_horizontally_facing_diagonal
|07C840| JSR SnapOnX

|07C843| LDA.b $6A
|07C845| CMP.b #$01
|07C847| BEQ .diagonal_facing_vertically

;---------------------------------------------------------------------------------------------------

.check_for_bonk
|07C849| LDA.b $0E
|07C84B| AND.b #$05
|07C84D| CMP.b #$05
|07C84F| BEQ .definitely_bonk

|07C851| AND.b #$04
|07C853| BEQ .no_bonk_this_way

|07C855| LDY.b #$01
|07C857| LDA.b $31
|07C859| BMI .already_negative

|07C85B| EOR.b #$FF
|07C85D| INC A

.already_negative
|07C85E| BPL .extra_positive_check

|07C860| LDY.b #$FF

.extra_positive_check
|07C862| STY.b $00
|07C864| STZ.b $01

|07C866| LDA.b $0E
|07C868| AND.b #$02
|07C86A| BNE HandlePushingObstruction_Horizontal

|07C86C| LDA.b $20
|07C86E| AND.b #$07
|07C870| BNE .do_not_bonk

|07C872| JSR BonkAndSmash
|07C875| JSR RepelDash

|07C878| BRA HandlePushingObstruction_Horizontal

;---------------------------------------------------------------------------------------------------

.no_bonk_this_way
|07C87A| LDY.b #$01

|07C87C| LDA.b $31
|07C87E| BPL .already_positive

|07C880| EOR.b #$FF
|07C882| INC A

.already_positive
|07C883| BPL .make_sure_not_negative

|07C885| LDY.b #$FF

.make_sure_not_negative
|07C887| STY.b $00
|07C889| STZ.b $01

|07C88B| LDA.b $0E
|07C88D| AND.b #$02
|07C88F| BNE HandlePushingObstruction_Horizontal

|07C891| LDA.b $20
|07C893| AND.b #$07
|07C895| BNE .do_not_bonk

.definitely_bonk
|07C897| JSR BonkAndSmash
|07C89A| JSR RepelDash

|07C89D| BRA HandlePushingObstruction_Horizontal

.do_not_bonk
|07C89F| JSR AddAbsoluteScratchToYCoord

|07C8A2| JMP.w HandleNudging

;===================================================================================================

HandlePushingObstruction_Horizontal:
|07C8A5| LDA.b $66
|07C8A7| ASL A
|07C8A8| CMP.b $2F
|07C8AA| BNE RestartPushingTimer_Horizontal

|07C8AC| LDA.w $0315
|07C8AF| AND.b #$01
|07C8B1| ASL A
|07C8B2| TSB.b $48

|07C8B4| LDA.b $3C
|07C8B6| BNE .dont_run_push_timer

|07C8B8| DEC.w $0371
|07C8BB| BPL EXIT_07C8E8

.dont_run_push_timer
|07C8BD| LDY.w $0315

|07C8C0| LDA.w $02F6
|07C8C3| AND.b #$20
|07C8C5| BEQ .not_a_flaggable_door

|07C8C7| LDA.w $0315
|07C8CA| ASL A
|07C8CB| ASL A
|07C8CC| ASL A
|07C8CD| TAY

.not_a_flaggable_door
|07C8CE| TYA
|07C8CF| TSB.b $48

|07C8D1| BRA RestartPushingTimer_Horizontal

;===================================================================================================

RestartPushingTimer_UnflagDoors_Horizontal:
|07C8D3| LDA.b $EE
|07C8D5| BNE EXIT_07C8E8

|07C8D7| LDA.b $48
|07C8D9| AND.b #$F6
|07C8DB| STA.b $48

;===================================================================================================

RestartPushingTimer_Horizontal:
|07C8DD| LDA.b #$20
|07C8DF| STA.w $0371

|07C8E2| LDA.b $48
|07C8E4| AND.b #$FD
|07C8E6| STA.b $48

;---------------------------------------------------------------------------------------------------

#EXIT_07C8E8:
|07C8E8| RTS

;===================================================================================================

StartMovementCollisionChecks_Horizontal_HandleOutdoors:
|07C8E9| LDA.b $6A
|07C8EB| BNE .no_speed_reset

|07C8ED| STZ.b $57

|07C8EF| LDA.b $5E
|07C8F1| CMP.b #$02
|07C8F3| BNE .no_speed_reset

|07C8F5| STZ.b $5E

.no_speed_reset
|07C8F7| LDA.b $59
|07C8F9| AND.b #$05
|07C8FB| BEQ HandleLiftablesBeforeDeepWater_Horizontal

|07C8FD| LDA.b $0E
|07C8FF| AND.b #$02
|07C901| BNE HandleLiftablesBeforeDeepWater_Horizontal

|07C903| LDA.b $5D
|07C905| CMP.b #$05 ; LINKSTATE 05
|07C907| BEQ .exit

|07C909| CMP.b #$02 ; LINKSTATE 02
|07C90B| BEQ .exit

|07C90D| LDA.b #$09
|07C90F| STA.b $5C

|07C911| STZ.b $5A

|07C913| LDA.b #$01
|07C915| STA.b $5B

|07C917| LDA.b #$01 ; LINKSTATE 01
|07C919| STA.b $5D

.exit
|07C91B| RTS

;---------------------------------------------------------------------------------------------------

HandleLiftablesBeforeDeepWater_Horizontal:
|07C91C| LDA.w $0366
|07C91F| AND.b #$02
|07C921| BEQ .not_touching_some_liftable

|07C923| LDA.w $036A
|07C926| LSR A
|07C927| STA.w $0369

|07C92A| BRA .index_is_set

.not_touching_some_liftable
|07C92C| STZ.w $0369

.index_is_set
|07C92F| LDA.w $0341
|07C932| AND.b #$04
|07C934| BEQ HandleLinkEnteringWater_Horizontal

|07C936| BRA TestWaterEntry_Horizontal

;===================================================================================================

UNREACHABLE_07C938:
|07C938| LDA.w $0341
|07C93B| AND.b #$07
|07C93D| CMP.b #$07
|07C93F| BNE HandleLinkEnteringWater_Horizontal

;===================================================================================================

TestWaterEntry_Horizontal:
|07C941| LDA.w $0345
|07C944| BNE HandleLinkEnteringWater_Horizontal

|07C946| LDA.b $4D
|07C948| BNE HandleLinkEnteringWater_Horizontal

|07C94A| JSR CancelDash
|07C94D| JSR ResetSwordAndItemUsage

|07C950| LDA.b #$01
|07C952| STA.w $0345

|07C955| LDA.b $26
|07C957| STA.w $0340

|07C95A| JSL ResetSwimmingState

|07C95E| STZ.w $0376
|07C961| STZ.b $5E

|07C963| LDA.w $0351
|07C966| CMP.b #$01
|07C968| BNE .jump_into_water

|07C96A| JSR ForciblyUnequipCape_quietly
|07C96D| LDA.l $7EF356
|07C971| BEQ .jump_into_water

|07C973| LDA.w $02E0
|07C976| BNE HandleLinkEnteringWater_Horizontal

|07C978| LDA.b #$04 ; LINKSTATE 04
|07C97A| STA.b $5D

|07C97C| BRA HandleLinkEnteringWater_Horizontal

;---------------------------------------------------------------------------------------------------

.jump_into_water
|07C97E| LDA.b $3E
|07C980| STA.b $20

|07C982| LDA.b $40
|07C984| STA.b $21

|07C986| LDA.b $3F
|07C988| STA.b $22

|07C98A| LDA.b $41
|07C98C| STA.b $23

|07C98E| LDA.b #$01
|07C990| STA.w $037B

|07C993| JSR HopInOrOutOfWater_Horizontal

|07C996| LDA.b #$20 ; SFX2.20
|07C998| JSR PlayLinkSFX2Panned

;===================================================================================================

HandleLinkEnteringWater_Horizontal:
|07C99B| LDA.w $0345
|07C99E| BEQ .not_on_deep_water

|07C9A0| LDA.w $036E
|07C9A3| AND.b #$07
|07C9A5| CMP.b #$07
|07C9A7| BEQ .no_horizontal_ledges
|07C9A9| BRA .no_vertical_ledges

.not_on_deep_water
|07C9AB| LDA.w $036D
|07C9AE| AND.b #$42
|07C9B0| BEQ .no_vertical_ledges

.no_horizontal_ledges
|07C9B2| LDA.b #$07
|07C9B4| STA.b $0E

|07C9B6| BRL HandlePushingBonkingSnaps_Horizontal

.no_vertical_ledges
|07C9B9| LDA.w $0343
|07C9BC| AND.b #$07
|07C9BE| CMP.b #$07
|07C9C0| BNE HandleLinkLedgeTile_Horizontal

|07C9C2| LDA.w $0345
|07C9C5| BEQ HandleLinkLedgeTile_Horizontal

|07C9C7| JSR CancelDash

|07C9CA| LDA.b $4D
|07C9CC| BNE HandleLinkLedgeTile_Horizontal

|07C9CE| LDA.w $0340
|07C9D1| STA.b $26

|07C9D3| STZ.w $0345

|07C9D6| LDA.b #$15 ; ANCILLA 15
|07C9D8| LDY.b #$00
|07C9DA| JSL AncillaAdd_Splash

|07C9DE| LDA.b #$01
|07C9E0| STA.w $037B

|07C9E3| BRL HopInOrOutOfWater_Horizontal

;===================================================================================================

HandleLinkLedgeTile_Horizontal:
|07C9E6| LDA.w $036E
|07C9E9| AND.b #$07
|07C9EB| BEQ CheckForWeirdLedges_Horizontal

|07C9ED| JSR RunLedgeHopTimer
|07C9F0| BCC CheckForWeirdLedges_Horizontal

|07C9F2| LDA.b #$20 ; SFX2.20
|07C9F4| JSR PlayLinkSFX2Panned

|07C9F7| LDX.b #$10

|07C9F9| LDA.b $66
|07C9FB| AND.b #$01
|07C9FD| BNE .positive

|07C9FF| TXA
|07CA00| EOR.b #$FF
|07CA02| INC A
|07CA03| TAX

.positive
|07CA04| STX.b $28

|07CA06| JSR CancelDash

|07CA09| LDA.b #$02
|07CA0B| STA.b $4D

|07CA0D| LDA.b #$14
|07CA0F| STA.w $0362
|07CA12| STA.w $0363

|07CA15| LDA.b #$FF
|07CA17| STA.w $0364

|07CA1A| LDA.b #$0C ; LINKSTATE 0C
|07CA1C| STA.b $5D

|07CA1E| LDA.b #$01
|07CA20| STA.w $037B
|07CA23| STA.b $78

|07CA25| STZ.b $48
|07CA27| STZ.b $5E

|07CA29| LDA.b $1B
|07CA2B| BNE .indoors

|07CA2D| LDA.b #$02
|07CA2F| STA.b $EE

.indoors
|07CA31| LDA.b $66
|07CA33| AND.b #$FD
|07CA35| ASL A
|07CA36| TAY

|07CA37| LDA.b $22
|07CA39| PHA

|07CA3A| LDA.b $23
|07CA3C| PHA

|07CA3D| JSR FindHorizontalHopTile

|07CA40| LDA.b #$01
|07CA42| STA.b $66

|07CA44| CPX.b #$FF
|07CA46| BEQ .find_south

|07CA48| JSR FindVerticalHopTile
|07CA4B| BRL .finish

.find_south
|07CA4E| JSR FindTileToLandOnSouth

.finish
|07CA51| PLA
|07CA52| STA.b $23

|07CA54| PLA
|07CA55| STA.b $22

|07CA57| RTS

;===================================================================================================

CheckForWeirdLedges_Horizontal:
|07CA58| LDA.w $0370
|07CA5B| AND.b #$77
|07CA5D| BEQ CheckLedgeTypes_Horizontal

|07CA5F| JSR RunLedgeHopTimer
|07CA62| BCC CheckLedgeTypes_Horizontal

|07CA64| LDA.b #$20 ; SFX2.20
|07CA66| JSR PlayLinkSFX2Panned

|07CA69| LDX.b #$0F ; LINKSTATE 0F

|07CA6B| AND.b #$07
|07CA6D| BNE .dumb_thing_has_sfx

|07CA6F| LDX.b #$10 ; LINKSTATE 10

.dumb_thing_has_sfx
|07CA71| STX.b $5D

|07CA73| LDX.b #$10

|07CA75| LDA.b $66
|07CA77| AND.b #$01
|07CA79| BNE .positive

|07CA7B| LDX.b #$F0

.positive
|07CA7D| STX.b $28

|07CA7F| JSR CancelDash

|07CA82| LDA.b #$02
|07CA84| STA.b $4D

|07CA86| LDA.b #$14
|07CA88| STA.w $0362
|07CA8B| STA.w $0363

|07CA8E| LDA.b #$FF
|07CA90| STA.w $0364

|07CA93| STZ.b $46

|07CA95| LDA.b #$01
|07CA97| STA.w $037B
|07CA9A| STA.b $78

|07CA9C| STZ.b $48
|07CA9E| STZ.b $5E

|07CAA0| RTS

;===================================================================================================

CheckLedgeTypes_Horizontal:
|07CAA1| LDA.w $036E
|07CAA4| AND.b #$70
|07CAA6| BEQ .dont_hop

|07CAA8| LDA.w $036E
|07CAAB| AND.b #$07
|07CAAD| BNE .dont_hop

|07CAAF| LDA.w $0370
|07CAB2| AND.b #$77
|07CAB4| BNE .dont_hop

|07CAB6| LDA.b $5D
|07CAB8| CMP.b #$0D ; LINKSTATE 0D
|07CABA| BEQ .dont_hop

|07CABC| JSR RunLedgeHopTimer
|07CABF| BCC .dont_hop

|07CAC1| LDA.b #$20 ; SFX2.20
|07CAC3| JSR PlayLinkSFX2Panned
|07CAC6| JSR CancelDash

|07CAC9| LDA.b #$01
|07CACB| STA.w $037B

|07CACE| STZ.b $48
|07CAD0| STZ.b $5E

|07CAD2| BRL FindValidLandingTile_DiagonalNorth

;---------------------------------------------------------------------------------------------------

.dont_hop
|07CAD5| LDA.w $036F
|07CAD8| AND.b #$07
|07CADA| BEQ .dont_quickhop

|07CADC| LDA.w $036E
|07CADF| AND.b #$07
|07CAE1| BNE .dont_quickhop

|07CAE3| LDA.w $0370
|07CAE6| AND.b #$77
|07CAE8| BNE .dont_quickhop

|07CAEA| JSR RunLedgeHopTimer
|07CAED| BCC .dont_quickhop

|07CAEF| LDX.b #$10

|07CAF1| LDA.b $66
|07CAF3| AND.b #$01
|07CAF5| BNE .dont_invert

|07CAF7| TXA
|07CAF8| EOR.b #$FF
|07CAFA| INC A
|07CAFB| TAX

.dont_invert
|07CAFC| STX.b $28

|07CAFE| JSR CancelDash

|07CB01| LDA.b #$02
|07CB03| STA.b $4D

|07CB05| LDA.b #$14
|07CB07| STA.w $0362
|07CB0A| STA.w $0363

|07CB0D| LDA.b #$FF
|07CB0F| STA.w $0364

|07CB12| LDA.b #$0E ; LINKSTATE 0E
|07CB14| STA.b $5D

|07CB16| STZ.b $46

|07CB18| LDA.b #$01
|07CB1A| STA.w $037B
|07CB1D| STA.b $78

|07CB1F| STZ.b $48
|07CB21| STZ.b $5E

|07CB23| RTS

;---------------------------------------------------------------------------------------------------

.dont_quickhop
|07CB24| LDA.b $0E
|07CB26| AND.b #$02
|07CB28| BNE .slope_reset

|07CB2A| LDA.b $0C
|07CB2C| AND.b #$05
|07CB2E| BEQ .slope_reset

|07CB30| LDA.w $0372
|07CB33| BEQ .not_dashing

|07CB35| LDA.b $2F
|07CB37| AND.b #$04
|07CB39| BEQ .slope_reset

.not_dashing
|07CB3B| JSR FlagMovingIntoSlopes_Horizontal

|07CB3E| LDA.b $6B
|07CB40| AND.b #$0F
|07CB42| BEQ .slope_reset

|07CB44| RTS

;---------------------------------------------------------------------------------------------------

.slope_reset
|07CB45| STZ.b $6B

|07CB47| LDA.w $02E8
|07CB4A| AND.b #$07
|07CB4C| BEQ .didnt_hit_spike

|07CB4E| LDA.b $46
|07CB50| ORA.w $031F
|07CB53| ORA.b $55
|07CB55| BNE .invulnerable

|07CB57| LDA.b $22

|07CB59| LDY.b $66
|07CB5B| CPY.b #$02
|07CB5D| BNE .invert_logic

|07CB5F| AND.b #$04
|07CB61| BEQ .take_damage
|07CB63| BRA .didnt_hit_spike

.invert_logic
|07CB65| AND.b #$04
|07CB67| BEQ .didnt_hit_spike

.take_damage
|07CB69| LDA.l $7EF35B
|07CB6D| TAY

|07CB6E| LDA.w SpikeDamageValues,Y
|07CB71| STA.w $0373

|07CB74| JSR CancelDash

|07CB77| BRL LinkApplyTileRebound

;---------------------------------------------------------------------------------------------------

.invulnerable
|07CB7A| LDA.w $02E8
|07CB7D| AND.b #$07
|07CB7F| STA.b $0E

.didnt_hit_spike
|07CB81| BRL HandlePushingBonkingSnaps_Horizontal

;===================================================================================================

SnapOnX:
|07CB84| REP #$20

|07CB86| LDA.b $22
|07CB88| AND.w #$0007

|07CB8B| LDY.b $31
|07CB8D| BPL .positive_x

|07CB8F| SEC
|07CB90| SBC.w #$0008

.positive_x
|07CB93| EOR.w #$FFFF
|07CB96| INC A

|07CB97| CLC
|07CB98| ADC.b $22
|07CB9A| STA.b $22

|07CB9C| SEP #$20

|07CB9E| RTS

;===================================================================================================

CalculateSnapScratch_Horizontal:
|07CB9F| LDA.b $0E
|07CBA1| AND.b #$04
|07CBA3| BEQ .invert_if_negative

.invert_if_positive
|07CBA5| LDY.b #$01

|07CBA7| LDA.b $31
|07CBA9| BMI .negative_x

|07CBAB| EOR.b #$FF
|07CBAD| INC A

.negative_x
|07CBAE| BPL .was_positive_a

|07CBB0| LDY.b #$FF

.was_positive_a
|07CBB2| STY.b $00
|07CBB4| STZ.b $01

|07CBB6| BRA AddAbsoluteScratchToYCoord

.invert_if_negative
|07CBB8| LDY.b #$01

|07CBBA| LDA.b $31
|07CBBC| BPL .positive_x

|07CBBE| EOR.b #$FF
|07CBC0| INC A

.positive_x
|07CBC1| BPL .was_positive_b

|07CBC3| LDY.b #$FF

.was_positive_b
|07CBC5| STY.b $00
|07CBC7| STZ.b $01

;===================================================================================================

AddAbsoluteScratchToYCoord:
|07CBC9| REP #$20

|07CBCB| LDA.b $00
|07CBCD| CMP.w #$0080
|07CBD0| BCC .positive

|07CBD2| ORA.w #$FF00

.positive
|07CBD5| CLC
|07CBD6| ADC.b $20
|07CBD8| STA.b $20

|07CBDA| SEP #$20

|07CBDC| RTS

;===================================================================================================

ChangeAxisOfPerpendicularDoorMovement_Horizontal:
|07CBDD| LDA.b #$02
|07CBDF| TSB.b $50

|07CBE1| LDA.b $0E
|07CBE3| LSR A
|07CBE4| LSR A
|07CBE5| LSR A
|07CBE6| LSR A
|07CBE7| ORA.b $0E
|07CBE9| AND.b #$0F
|07CBEB| STA.b $00

|07CBED| AND.b #$07
|07CBEF| BNE .dont_clear_doorway

|07CBF1| STZ.b $6C

|07CBF3| BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_clear_doorway
|07CBF5| LDA.b $20
|07CBF7| CMP.b #$80
|07CBF9| BCC .y_low_positive

|07CBFB| LDA.b $31
|07CBFD| BMI .keep_negative_x

|07CBFF| EOR.b #$FF
|07CC01| INC A

.keep_negative_x
|07CC02| STA.b $00
|07CC04| STZ.b $01

|07CC06| LDY.b #$00
|07CC08| BRA .continue

;---------------------------------------------------------------------------------------------------

.y_low_positive
|07CC0A| LDA.b $31
|07CC0C| BPL .keep_positive_x

|07CC0E| EOR.b #$FF
|07CC10| INC A

.keep_positive_x
|07CC11| STA.b $00
|07CC13| STZ.b $01

|07CC15| LDY.b #$02

;---------------------------------------------------------------------------------------------------

.continue
|07CC17| LDA.b $50
|07CC19| AND.b #$01
|07CC1B| BNE .cannot_turn

|07CC1D| STY.b $2F

.cannot_turn
|07CC1F| REP #$20

|07CC21| LDA.b $00
|07CC23| CMP.w #$0080
|07CC26| BCC .positive

|07CC28| ORA.w #$FF00

.positive
|07CC2B| CLC
|07CC2C| ADC.b $20
|07CC2E| STA.b $20

|07CC30| SEP #$20

.exit
|07CC32| RTS

;===================================================================================================

pool HopInOrOutOfWater_Horizontal

.speed_x
|07CC33| db 28, 24, 16

.speed_z
|07CC36| db 32, 24, 24

.timer
|07CC39| db 16, 16, 16

endpool

;---------------------------------------------------------------------------------------------------

HopInOrOutOfWater_Horizontal:
|07CC3C| LDA.b $1B
|07CC3E| BNE .indoors

|07CC40| LDX.b #$02
|07CC42| BRA .index_decided

.indoors
|07CC44| LDX.b $1D
|07CC46| LDA.w $047A
|07CC49| BEQ .index_decided

|07CC4B| LDX.b #$00

.index_decided
|07CC4D| STX.b $00

|07CC4F| LDA.w .speed_x,X
|07CC52| TAX

|07CC53| LDA.b $66
|07CC55| AND.b #$01
|07CC57| BNE .dont_invert

|07CC59| TXA
|07CC5A| EOR.b #$FF
|07CC5C| INC A
|07CC5D| TAX

.dont_invert
|07CC5E| STX.b $28

|07CC60| STZ.b $27

|07CC62| LDX.b $00

|07CC64| LDA.w .speed_z,X
|07CC67| STA.b $29
|07CC69| STA.w $02C7

|07CC6C| LDA.w .timer,X
|07CC6F| STA.b $46

|07CC71| LDA.b $4D
|07CC73| CMP.b #$02
|07CC75| BEQ .dont_set_recoil

|07CC77| LDA.b #$01
|07CC79| STA.b $4D

|07CC7B| STZ.w $0360

.dont_set_recoil
|07CC7E| LDA.b #$06 ; LINKSTATE 06
|07CC80| STA.b $5D

|07CC82| RTS

;===================================================================================================

DiagonalKickback:

.right
|07CC83| db   0,   1,   1,   1
|07CC87| db   2,   2,   2,   3
|07CC8B| db   3,   3

.left
|07CC8D| db   0,  -1,  -1,  -1
|07CC91| db  -2,  -2,  -2,  -3
|07CC95| db  -3,  -3

.down
|07CC97| db   0,   0,   0,   1
|07CC9B| db   1,   1,   2,   2
|07CC9F| db   2,   3

.up
|07CCA1| db   0,   1,   1,   2
|07CCA5| db   2,   2,   3,   3
|07CCA9| db   3,   3

;---------------------------------------------------------------------------------------------------

HandleLinkDiagonalKickback:
|07CCAB| LDA.b $30
|07CCAD| BEQ .no_y_velocity

|07CCAF| LDA.b $31
|07CCB1| BNE .have_x_velocity

.no_y_velocity
|07CCB3| BRL ResetSlopeIntoFlagAndFailCache

.have_x_velocity
|07CCB6| LDA.b $20
|07CCB8| STA.w $02DE

|07CCBB| LDA.b $21
|07CCBD| STA.w $02DF

|07CCC0| LDA.b $22
|07CCC2| STA.w $02DC

|07CCC5| LDA.b $23
|07CCC7| STA.w $02DD

|07CCCA| LDY.b #$04

|07CCCC| LDA.b $31
|07CCCE| BMI .x_velocity_negative_a

|07CCD0| LDY.b #$06

.x_velocity_negative_a
|07CCD2| JSR TileDetectOnMovement_Horizontal

|07CCD5| LDA.b $0C
|07CCD7| AND.b #$05
|07CCD9| BEQ .nothing_flagged_for_x

|07CCDB| JSR FlagMovingIntoSlopes_Horizontal

|07CCDE| LDA.b $6B
|07CCE0| AND.b #$0F
|07CCE2| BNE .not_flagged_as_into_slope

.nothing_flagged_for_x
|07CCE4| BRL ResetSlopeIntoFlagAndFailCache

;---------------------------------------------------------------------------------------------------

.not_flagged_as_into_slope
|07CCE7| REP #$20

|07CCE9| LDA.b $22
|07CCEB| SEC
|07CCEC| SBC.w $02DC
|07CCEF| STA.b $00

|07CCF1| LDA.w $02DC
|07CCF4| STA.b $22

|07CCF6| SEP #$20

|07CCF8| LDA.b $00
|07CCFA| STA.b $31

;---------------------------------------------------------------------------------------------------

|07CCFC| LDY.b #$00

|07CCFE| LDA.b $30
|07CD00| BMI .y_velocity_negative_a

|07CD02| LDY.b #$02

.y_velocity_negative_a
|07CD04| JSR TileDetectOnMovement_Vertical

|07CD07| LDA.b $0C
|07CD09| AND.b #$05
|07CD0B| BEQ ResetSlopeIntoFlagAndFailCache

|07CD0D| JSR FlagMovingIntoSlopes_Vertical

|07CD10| LDA.b $6B
|07CD12| AND.b #$0F
|07CD14| BEQ ResetSlopeIntoFlagAndFailCache

|07CD16| LDA.b $6B
|07CD18| STA.b $6D

|07CD1A| REP #$20

|07CD1C| LDA.b $20
|07CD1E| SEC
|07CD1F| SBC.w $02DE
|07CD22| STA.b $00

|07CD24| SEP #$20

|07CD26| LDA.b $00
|07CD28| STA.b $30

;---------------------------------------------------------------------------------------------------

|07CD2A| LDY.b $31
|07CD2C| BMI .x_velocity_negative_b

|07CD2E| LDA.w DiagonalKickback.right,Y

|07CD31| BRA .kickback_x_decided

.x_velocity_negative_b
|07CD33| TYA
|07CD34| EOR.b #$FF
|07CD36| INC A
|07CD37| TAY

|07CD38| LDA.w DiagonalKickback.left,Y

.kickback_x_decided
|07CD3B| REP #$20

|07CD3D| AND.w #$00FF
|07CD40| CMP.w #$0080
|07CD43| BCC .kickback_x_positive

|07CD45| ORA.w #$FF00

.kickback_x_positive
|07CD48| CLC
|07CD49| ADC.b $22
|07CD4B| STA.b $22

;---------------------------------------------------------------------------------------------------

|07CD4D| SEP #$20

|07CD4F| LDY.b $30
|07CD51| BMI .y_velocity_negative_b

|07CD53| LDA.w DiagonalKickback.down,Y

|07CD56| BRA .kickback_y_decided

.y_velocity_negative_b
|07CD58| TYA
|07CD59| EOR.b #$FF
|07CD5B| INC A
|07CD5C| TAY

|07CD5D| LDA.w DiagonalKickback.up,Y

.kickback_y_decided
|07CD60| REP #$20

|07CD62| AND.w #$00FF
|07CD65| CMP.w #$0080
|07CD68| BCC .kickback_y_positive

|07CD6A| ORA.w #$FF00

.kickback_y_positive
|07CD6D| CLC
|07CD6E| ADC.b $20
|07CD70| STA.b $20

|07CD72| SEP #$20

|07CD74| BRA ResetSlopeIntoFlag

;===================================================================================================

ResetSlopeIntoFlagAndFailCache:
|07CD76| STZ.b $6D

ResetSlopeIntoFlag:
|07CD78| STZ.b $6B

|07CD7A| RTS

;===================================================================================================

TileDetectOnMovement:

.offset_same_axis
|07CD7B| dw $0008, $0018, $0000, $000F

.offset_perpendicular_axis_1
|07CD83| dw $0000, $0000

.offset_pit_y
|07CD87| dw $0008

.unused_a
|07CD89| dw $0008

.offset_perpendicular_axis_2
|07CD8B| dw $0008, $0008, $0010, $0010

.offset_perpendicular_axis_3
|07CD93| dw $000F, $000F

.offset_pit_x
|07CD97| dw $0017

.unused_b
|07CD99| dw $0017, $0000, $0000, $001F, $001F

.offset_slope_same_axis
|07CDA3| dw $0007, $0018, $FFFF, $0010

.offset_slope_perpendicular_axis_1
|07CDAB| dw $0000, $0000, $0008, $0008

.offset_slope_perpendicular_axis_2
|07CDB3| dw $000F, $000F, $0017, $0017
|07CDBB| dw $0000, $0000, $0000, $000F
|07CDC3| dw $0000, $0000, $0012, $0012

;===================================================================================================

TileDetectOnMovement_Vertical:
|07CDCB| REP #$20

|07CDCD| JSR ResetTileDetect

|07CDD0| STZ.b $59

|07CDD2| LDA.b $20
|07CDD4| CLC
|07CDD5| ADC.w TileDetectOnMovement.offset_same_axis,Y
|07CDD8| STA.b $51

|07CDDA| AND.b $EC
|07CDDC| STA.b $00

|07CDDE| LDA.b $22
|07CDE0| CLC
|07CDE1| ADC.w TileDetectOnMovement.offset_perpendicular_axis_1,Y
|07CDE4| AND.b $EC

|07CDE6| LSR A
|07CDE7| LSR A
|07CDE8| LSR A
|07CDE9| STA.b $02

|07CDEB| LDA.b $22
|07CDED| CLC
|07CDEE| ADC.w TileDetectOnMovement.offset_perpendicular_axis_2,Y
|07CDF1| AND.b $EC

|07CDF3| LSR A
|07CDF4| LSR A
|07CDF5| LSR A
|07CDF6| STA.b $04

|07CDF8| LDA.b $22
|07CDFA| CLC
|07CDFB| ADC.w TileDetectOnMovement.offset_perpendicular_axis_3,Y
|07CDFE| AND.b $EC

|07CE00| LSR A
|07CE01| LSR A
|07CE02| LSR A
|07CE03| STA.b $74

|07CE05| REP #$10

|07CE07| LDA.w #$0001
|07CE0A| STA.b $0A

|07CE0C| JSR ExecuteTileDetection

|07CE0F| LDA.b $04
|07CE11| STA.b $02

|07CE13| LDA.w #$0002
|07CE16| STA.b $0A

|07CE18| JSR ExecuteTileDetection

|07CE1B| LDA.b $74
|07CE1D| STA.b $02

|07CE1F| LDA.w #$0004
|07CE22| STA.b $0A

|07CE24| JSR ExecuteTileDetection

|07CE27| SEP #$30

|07CE29| RTS

;===================================================================================================

TileDetectOnMovement_Horizontal:
|07CE2A| REP #$20

|07CE2C| JSR ResetTileDetect

|07CE2F| STZ.b $59

|07CE31| LDA.b $22
|07CE33| CLC
|07CE34| ADC.w TileDetectOnMovement.offset_same_axis,Y
|07CE37| AND.b $EC

|07CE39| LSR A
|07CE3A| LSR A
|07CE3B| LSR A
|07CE3C| STA.b $02

|07CE3E| LDA.b $20
|07CE40| CLC
|07CE41| ADC.w TileDetectOnMovement.offset_perpendicular_axis_1,Y
|07CE44| AND.b $EC
|07CE46| STA.b $00

|07CE48| LDA.b $20
|07CE4A| CLC
|07CE4B| ADC.w TileDetectOnMovement.offset_perpendicular_axis_2,Y
|07CE4E| STA.b $51

|07CE50| AND.b $EC
|07CE52| STA.b $04

|07CE54| LDA.b $20
|07CE56| CLC
|07CE57| ADC.w TileDetectOnMovement.offset_perpendicular_axis_3,Y
|07CE5A| STA.b $53

|07CE5C| AND.b $EC
|07CE5E| STA.b $08

|07CE60| REP #$10

|07CE62| LDA.w #$0001
|07CE65| STA.b $0A

|07CE67| JSR ExecuteTileDetection

|07CE6A| LDA.b $04
|07CE6C| STA.b $00

|07CE6E| LDA.w #$0002
|07CE71| STA.b $0A

|07CE73| JSR ExecuteTileDetection

|07CE76| LDA.b $08
|07CE78| STA.b $00

|07CE7A| LDA.w #$0004
|07CE7D| STA.b $0A

|07CE7F| JSR ExecuteTileDetection

|07CE82| SEP #$30

|07CE84| RTS

;===================================================================================================

TileDetectOnMovement_VerticalSlopes:
|07CE85| REP #$20

|07CE87| JSR ResetTileDetect

|07CE8A| STZ.b $59

|07CE8C| LDA.b $20
|07CE8E| CLC
|07CE8F| ADC.w TileDetectOnMovement.offset_slope_same_axis,Y
|07CE92| AND.b $EC
|07CE94| STA.b $00

|07CE96| LDA.b $22
|07CE98| CLC
|07CE99| ADC.w TileDetectOnMovement.offset_slope_perpendicular_axis_1,Y
|07CE9C| AND.b $EC

|07CE9E| LSR A
|07CE9F| LSR A
|07CEA0| LSR A
|07CEA1| STA.b $02

|07CEA3| LDA.b $22
|07CEA5| CLC
|07CEA6| ADC.w TileDetectOnMovement.offset_slope_perpendicular_axis_2,Y
|07CEA9| AND.b $EC

|07CEAB| LSR A
|07CEAC| LSR A
|07CEAD| LSR A
|07CEAE| STA.b $04

|07CEB0| REP #$10

|07CEB2| LDA.w #$0001
|07CEB5| STA.b $0A

|07CEB7| JSR ExecuteTileDetection

|07CEBA| LDA.b $04
|07CEBC| STA.b $02

|07CEBE| LDA.w #$0002
|07CEC1| STA.b $0A

|07CEC3| JSR ExecuteTileDetection

|07CEC6| SEP #$30

|07CEC8| RTS

;===================================================================================================

TileDetectOnMovement_HorizontalSlopes:
|07CEC9| REP #$20

|07CECB| JSR ResetTileDetect

|07CECE| STZ.b $59

|07CED0| LDA.b $22
|07CED2| CLC
|07CED3| ADC.w TileDetectOnMovement.offset_slope_same_axis,Y
|07CED6| AND.b $EC

|07CED8| LSR A
|07CED9| LSR A
|07CEDA| LSR A
|07CEDB| STA.b $02

|07CEDD| LDA.b $20
|07CEDF| CLC
|07CEE0| ADC.w TileDetectOnMovement.offset_slope_perpendicular_axis_1,Y
|07CEE3| AND.b $EC
|07CEE5| STA.b $00

|07CEE7| LDA.b $20
|07CEE9| CLC
|07CEEA| ADC.w TileDetectOnMovement.offset_slope_perpendicular_axis_2,Y
|07CEED| AND.b $EC
|07CEEF| STA.b $04

|07CEF1| REP #$10

|07CEF3| LDA.w #$0001
|07CEF6| STA.b $0A

|07CEF8| JSR ExecuteTileDetection

|07CEFB| LDA.b $04
|07CEFD| STA.b $00

|07CEFF| LDA.w #$0002
|07CF02| STA.b $0A

|07CF04| JSR ExecuteTileDetection

|07CF07| SEP #$30

|07CF09| RTS

;===================================================================================================

TileDetect_BigArea_long:
|07CF0A| PHB
|07CF0B| PHK
|07CF0C| PLB

|07CF0D| JSR TileDetect_BigArea

|07CF10| PLB

|07CF11| RTL

;===================================================================================================

TileDetect_BigArea:
|07CF12| STZ.b $59

|07CF14| REP #$20

|07CF16| JSR ResetTileDetect

|07CF19| LDA.b $22
|07CF1B| CLC
|07CF1C| ADC.w TileDetectOnMovement.offset_perpendicular_axis_1
|07CF1F| AND.b $EC
|07CF21| LSR A
|07CF22| LSR A
|07CF23| LSR A
|07CF24| STA.b $02

|07CF26| LDA.b $22
|07CF28| CLC
|07CF29| ADC.w TileDetectOnMovement.offset_perpendicular_axis_3
|07CF2C| AND.b $EC
|07CF2E| LSR A
|07CF2F| LSR A
|07CF30| LSR A
|07CF31| STA.b $04

|07CF33| LDA.b $20
|07CF35| CLC
|07CF36| ADC.w TileDetectOnMovement.offset_pit_y
|07CF39| AND.b $EC
|07CF3B| STA.b $00
|07CF3D| STA.b $74

|07CF3F| LDA.b $20
|07CF41| CLC
|07CF42| ADC.w TileDetectOnMovement.offset_pit_x
|07CF45| AND.b $EC
|07CF47| STA.b $08

;===================================================================================================

TileDetect_FromMirrorBonk:
|07CF49| REP #$10

|07CF4B| LDA.w #$0008
|07CF4E| STA.b $0A

|07CF50| JSR ExecuteTileDetection

|07CF53| LDA.b $08
|07CF55| STA.b $00

|07CF57| LDA.w #$0002
|07CF5A| STA.b $0A

|07CF5C| JSR ExecuteTileDetection

|07CF5F| LDA.b $74
|07CF61| STA.b $00

|07CF63| LDA.b $04
|07CF65| STA.b $02

|07CF67| LDA.w #$0004
|07CF6A| STA.b $0A

|07CF6C| JSR ExecuteTileDetection

|07CF6F| LDA.b $08
|07CF71| STA.b $00

|07CF73| LDA.w #$0001
|07CF76| STA.b $0A

|07CF78| JSR ExecuteTileDetection

|07CF7B| SEP #$30

|07CF7D| RTS

;===================================================================================================

TileDetect_UnusedIce:
|07CF7E| STZ.b $59

|07CF80| REP #$20

|07CF82| JSR ResetTileDetect

|07CF85| LDA.b $22
|07CF87| CLC
|07CF88| ADC.w #$0000

|07CF8B| AND.b $EC
|07CF8D| LSR A
|07CF8E| LSR A
|07CF8F| LSR A
|07CF90| STA.b $02

|07CF92| LDA.b $22
|07CF94| CLC
|07CF95| ADC.w #$0008

|07CF98| AND.b $EC
|07CF9A| LSR A
|07CF9B| LSR A
|07CF9C| LSR A
|07CF9D| STA.b $04

;---------------------------------------------------------------------------------------------------

|07CF9F| LDA.b $24
|07CFA1| AND.w #$00FF
|07CFA4| CMP.w #$00FF
|07CFA7| BNE .not_grounded

|07CFA9| LDA.w #$0000

.not_grounded
|07CFAC| CLC
|07CFAD| ADC.b $20
|07CFAF| AND.b $EC
|07CFB1| STA.b $00

;---------------------------------------------------------------------------------------------------

|07CFB3| REP #$10

|07CFB5| LDA.w #$0001
|07CFB8| STA.b $0A

|07CFBA| JSR ExecuteTileDetection

|07CFBD| LDA.b $04
|07CFBF| STA.b $02

|07CFC1| LDA.w #$0002
|07CFC4| STA.b $0A

|07CFC6| JSR ExecuteTileDetection

|07CFC9| SEP #$30

|07CFCB| RTS

;===================================================================================================

pool TileDetect_MainHandler

.offset_y
|07CFCC| dw  20,  20,  20,  20
|07CFD4| dw   4,  28,  16,  16
|07CFDC| dw  22,  22,  22,  22
|07CFE4| dw   4,  24,  16,  16
|07CFEC| dw  16,  16,  16,  16
|07CFF4| dw  20,  20,  23,  23
|07CFFC| dw  -4,  36,  16,  16
|07D004| dw   4,  28,  16,  16
|07D00C| dw   4,  28,  16,  16
|07D014| dw   4,   4,  28,  28

.offset_x
|07D01C| dw   8,   8,   8,   8
|07D024| dw   6,   8,  -1,  22
|07D02C| dw  19,  19,   0,  19
|07D034| dw   6,   8,  -1,  22
|07D03C| dw   8,   8,   8,   8
|07D044| dw   8,   8,   0,  15
|07D04C| dw   6,   8, -10,  29
|07D054| dw   6,   8,  -6,  22
|07D05C| dw   6,   8,  -4,  22
|07D064| dw  -4,  22,  -4,  22

;---------------------------------------------------------------------------------------------------

.spike_floor_damage
|07D06C| db $08 ; green
|07D06D| db $08 ; blue
|07D06E| db $08 ; red

;---------------------------------------------------------------------------------------------------

.index_offset
|07D06F| db $0A, $06, $0E, $02
|07D073| db $0C, $04, $08, $00

endpool

;---------------------------------------------------------------------------------------------------

TileDetect_MainHandler:
|07D077| STZ.b $59 ; clear pits

|07D079| REP #$20

|07D07B| JSR ResetTileDetect

|07D07E| STY.b $00

|07D080| CPY.b #$08
|07D082| BNE .direction_based

|07D084| LDA.w $031C
|07D087| AND.w #$00FF
|07D08A| DEC A
|07D08B| DEC A
|07D08C| BMI .dirty_exit

|07D08E| CMP.w #$0008
|07D091| BCS .dirty_exit

|07D093| PHY
|07D094| TAY

|07D095| LDA.w .index_offset,Y
|07D098| AND.w #$00FF
|07D09B| CLC
|07D09C| ADC.w #$0040
|07D09F| TAY

|07D0A0| BRA .calculate_offset

.direction_based
|07D0A2| PHY

|07D0A3| LDA.b $00
|07D0A5| AND.w #$00FF
|07D0A8| ASL A
|07D0A9| ASL A
|07D0AA| ASL A
|07D0AB| CLC
|07D0AC| ADC.b $2F
|07D0AE| TAY

;---------------------------------------------------------------------------------------------------

.calculate_offset
|07D0AF| LDA.b $22
|07D0B1| CLC
|07D0B2| ADC.w .offset_x,Y

|07D0B5| AND.b $EC
|07D0B7| LSR A
|07D0B8| LSR A
|07D0B9| LSR A
|07D0BA| STA.b $02

|07D0BC| LDA.b $20
|07D0BE| CLC
|07D0BF| ADC.w .offset_y,Y
|07D0C2| AND.b $EC
|07D0C4| STA.b $00

;---------------------------------------------------------------------------------------------------

|07D0C6| LDA.w #$0001
|07D0C9| STA.b $0A

|07D0CB| PLY

|07D0CC| REP #$10

|07D0CE| TYA
|07D0CF| CMP.w #$0001
|07D0D2| BEQ .detect_from_item

|07D0D4| CMP.w #$0002
|07D0D7| BEQ .detect_from_item

|07D0D9| CMP.w #$0003
|07D0DC| BEQ .detect_from_item

|07D0DE| CMP.w #$0006
|07D0E1| BEQ .detect_from_item

|07D0E3| CMP.w #$0007
|07D0E6| BEQ .detect_from_item

|07D0E8| CMP.w #$0008
|07D0EB| BEQ .detect_from_item

|07D0ED| PHY

|07D0EE| JSR ExecuteTileDetection

|07D0F1| PLY

|07D0F2| BRA .continue_from_detection

.detect_from_item
|07D0F4| SEP #$30

|07D0F6| JSR TileBehavior_HandleItemAndExecute

;---------------------------------------------------------------------------------------------------

.dirty_exit
|07D0F9| SEP #$30

.proceed_to_exit
|07D0FB| BRL .exit

;---------------------------------------------------------------------------------------------------

.continue_from_detection
|07D0FE| SEP #$30

|07D100| CPY.b #$05
|07D102| BEQ .proceed_to_exit

|07D104| LDA.w $0357
|07D107| AND.b #$10
|07D109| BEQ .no_warp_tile

|07D10B| LDA.b $20
|07D10D| CLC
|07D10E| ADC.b #$08
|07D110| AND.b #$0F
|07D112| CMP.b #$04
|07D114| BCC .check_warp_x

|07D116| CMP.b #$0B
|07D118| BCC .dont_attempt_to_warp

.check_warp_x
|07D11A| LDA.b $22
|07D11C| AND.b #$0F
|07D11E| CMP.b #$04
|07D120| BCC .okay_x_position

|07D122| CMP.b #$0C
|07D124| BCC .dont_attempt_to_warp

.okay_x_position
|07D126| LDA.w $031F
|07D129| BNE .dont_attempt_to_warp

|07D12B| LDA.b $4D
|07D12D| BNE .dont_attempt_to_warp

|07D12F| LDA.b $1B
|07D131| BEQ .try_overworld_warp

|07D133| JSL FullyUpdateRoomFlags

|07D137| LDA.b #$33 ; SFX2.33
|07D139| JSR PlayLinkSFX2Panned

|07D13C| STZ.b $5E

|07D13E| LDA.b #$15
|07D140| STA.b $11

|07D142| LDA.b $A0
|07D144| STA.b $A2

|07D146| LDA.l $7EC000
|07D14A| STA.b $A0

|07D14C| JSR HandleLayerOfDestination
|07D14F| BRA .dont_attempt_to_warp

;---------------------------------------------------------------------------------------------------

.try_overworld_warp
|07D151| LDA.w $02DB
|07D154| BNE .dont_attempt_to_warp

|07D156| JSR AttemptMirrorWarp

.dont_attempt_to_warp
|07D159| BRL .clear_tall_grass_flag

;---------------------------------------------------------------------------------------------------

.no_warp_tile
|07D15C| STZ.w $02DB

|07D15F| LDA.w $0357
|07D162| AND.b #$01
|07D164| BEQ .not_in_tall_grass

|07D166| LDA.b #$02
|07D168| STA.w $0351

|07D16B| JSR GetPermissionForSloshSounds
|07D16E| BCS .jump_to_exit

|07D170| LDA.b $4D
|07D172| BNE .jump_to_exit

|07D174| LDA.b #$1A ; SFX2.1A
|07D176| JSR PlayLinkSFX2Panned

.jump_to_exit
|07D179| BRL .exit

;---------------------------------------------------------------------------------------------------

.not_in_tall_grass
|07D17C| LDA.w $0359
|07D17F| AND.b #$01
|07D181| BEQ .not_in_shallow_water

|07D183| LDA.b #$01
|07D185| STA.w $0351

|07D188| LDA.b $1B
|07D18A| BNE .try_splash_noise

|07D18C| LDA.w $0345
|07D18F| BEQ .try_splash_noise

|07D191| LDA.w $02E0
|07D194| BNE .try_splash_noise

|07D196| LDA.l $7EF356
|07D19A| BEQ .jump_to_exit

|07D19C| STZ.w $0345

|07D19F| LDA.w $0340
|07D1A2| STA.b $26

|07D1A4| LDA.b #$00 ; LINKSTATE 00
|07D1A6| STA.b $5D

|07D1A8| BRL .exit

;---------------------------------------------------------------------------------------------------

.try_splash_noise
|07D1AB| JSR GetPermissionForSloshSounds
|07D1AE| BCS .no_sound_allowed

|07D1B0| LDA.b $8A
|07D1B2| CMP.b #$70 ; OW 70
|07D1B4| BNE .not_mire_splash

|07D1B6| LDA.b #$1B ; SFX2.1B
|07D1B8| JSR PlayLinkSFX2Panned

|07D1BB| BRA .no_sound_allowed

;---------------------------------------------------------------------------------------------------

.not_mire_splash
|07D1BD| LDA.b $4D
|07D1BF| BNE .no_sound_allowed

|07D1C1| LDA.b #$1C ; SFX2.1C
|07D1C3| JSR PlayLinkSFX2Panned

.no_sound_allowed
|07D1C6| BRL .exit

;---------------------------------------------------------------------------------------------------

.not_in_shallow_water
|07D1C9| LDA.b $1B
|07D1CB| BNE .clear_tall_grass_flag

|07D1CD| LDA.w $0345
|07D1D0| BNE .clear_tall_grass_flag

|07D1D2| LDA.w $0341
|07D1D5| AND.b #$01
|07D1D7| BEQ .clear_tall_grass_flag

|07D1D9| LDA.b #$01
|07D1DB| STA.w $0351

|07D1DE| JSR GetPermissionForSloshSounds
|07D1E1| BCS .no_sloshing_sounds

|07D1E3| LDA.b $8A
|07D1E5| CMP.b #$70 ; OW 70
|07D1E7| BNE .not_mire_again

|07D1E9| LDA.b #$1B ; SFX2.1B
|07D1EB| JSR PlayLinkSFX2Panned

|07D1EE| BRA .no_sloshing_sounds

;---------------------------------------------------------------------------------------------------

.not_mire_again
|07D1F0| LDA.b $4D
|07D1F2| BNE .no_sloshing_sounds

|07D1F4| LDA.b #$1C ; SFX2.1C
|07D1F6| JSR PlayLinkSFX2Panned

.no_sloshing_sounds
|07D1F9| BRL .exit

;---------------------------------------------------------------------------------------------------

.clear_tall_grass_flag
|07D1FC| STZ.w $0351

|07D1FF| LDA.w $02EE
|07D202| AND.b #$01
|07D204| BEQ .not_near_desert_trigger

|07D206| LDA.b #$01
|07D208| STA.w $02ED

|07D20B| BRL .exit

;---------------------------------------------------------------------------------------------------

.not_near_desert_trigger
|07D20E| STZ.w $02ED

|07D211| LDA.w $02EE
|07D214| AND.b #$10
|07D216| BEQ .not_touching_spikes

|07D218| STZ.w $0373

|07D21B| LDA.b $55
|07D21D| BNE .not_touching_spikes

|07D21F| JSR SearchForByrnaSpark
|07D222| BCS .not_touching_spikes

|07D224| LDA.w $031F
|07D227| BNE .not_touching_spikes

|07D229| STZ.w $03F7
|07D22C| STZ.w $03F5
|07D22F| STZ.w $03F6

|07D232| LDA.l $7EF357
|07D236| BEQ .no_moon_pearl

|07D238| STZ.b $56
|07D23A| STZ.w $02E0

.no_moon_pearl
|07D23D| LDA.l $7EF35B
|07D241| TAY

|07D242| LDA.w .spike_floor_damage,Y
|07D245| STA.w $0373

|07D248| BRL CancelDash

;---------------------------------------------------------------------------------------------------

.not_touching_spikes
|07D24B| LDA.w $0348
|07D24E| AND.b #$11
|07D250| BEQ .not_on_any_ice

|07D252| LDA.w $034A
|07D255| BEQ .not_gt_or_ip_ice

|07D257| LDA.b $6A
|07D259| BEQ .finish_up

|07D25B| LDA.w $0340
|07D25E| STA.b $26

|07D260| BRL .finish_up

;---------------------------------------------------------------------------------------------------

.not_gt_or_ip_ice
|07D263| LDA.b $67
|07D265| AND.b #$0C
|07D267| BEQ .velocity_not_up_or_down

|07D269| LDA.b #$01
|07D26B| STA.w $033D

|07D26E| LDA.b #$80
|07D270| STA.w $033C

.velocity_not_up_or_down
|07D273| LDA.b $67
|07D275| AND.b #$03
|07D277| BEQ .velocity_not_left_or_right

|07D279| LDA.b #$01
|07D27B| STA.w $033D

|07D27E| LDA.b #$80
|07D280| STA.w $033C

.velocity_not_left_or_right
|07D283| LDY.b #$01

|07D285| LDA.w $0348
|07D288| AND.b #$01
|07D28A| BNE .set_to_gt_ice

|07D28C| LDY.b #$02

.set_to_gt_ice
|07D28E| STY.w $034A

|07D291| LDA.b $26
|07D293| STA.w $0340

|07D296| JSL ResetSwimmingState
|07D29A| BRL .finish_up

;---------------------------------------------------------------------------------------------------

.not_on_any_ice
|07D29D| LDA.b $5D
|07D29F| CMP.b #$04 ; LINKSTATE 04
|07D2A1| BEQ .swimming

|07D2A3| LDA.w $034A
|07D2A6| BEQ .not_on_ice_yet

|07D2A8| LDA.w $0340
|07D2AB| STA.b $26

.not_on_ice_yet
|07D2AD| JSL ResetSwimmingState

.swimming
|07D2B1| STZ.w $034A

;---------------------------------------------------------------------------------------------------

.finish_up
|07D2B4| LDA.w $02E8
|07D2B7| AND.b #$10
|07D2B9| BEQ .exit

|07D2BB| LDA.w $031F
|07D2BE| BNE .exit

|07D2C0| LDA.b #$3A
|07D2C2| STA.w $031F

.exit
|07D2C5| RTS

;===================================================================================================

GetPermissionForSloshSounds:
|07D2C6| LDA.b $67
|07D2C8| AND.b #$0F
|07D2CA| BEQ .fail

|07D2CC| LDA.b $5D
|07D2CE| CMP.b #$11 ; LINKSTATE 11
|07D2D0| BEQ .dashing

|07D2D2| LDA.b $1A
|07D2D4| AND.b #$0F
|07D2D6| BEQ .succeed

|07D2D8| BRA .fail

.dashing
|07D2DA| LDA.b $1A
|07D2DC| AND.b #$07
|07D2DE| BNE .fail

.succeed
|07D2E0| CLC

|07D2E1| RTS

.fail
|07D2E2| SEC

|07D2E3| RTS

;===================================================================================================

pool AttemptToPushTheBlock

.target_offset_y_a
|07D2E4| dw $FFFC ; up
|07D2E6| dw $0014 ; down
|07D2E8| dw $0004 ; left
|07D2EA| dw $0004 ; right

.target_offset_y_b
|07D2EC| dw $FFFC ; up
|07D2EE| dw $0014 ; down
|07D2F0| dw $000C ; left
|07D2F2| dw $000C ; right

.target_offset_x_a
|07D2F4| dw $0004 ; up
|07D2F6| dw $0004 ; down
|07D2F8| dw $FFFC ; left
|07D2FA| dw $0014 ; right

.target_offset_x_b
|07D2FC| dw $000C ; up
|07D2FE| dw $000C ; down
|07D300| dw $FFFC ; left
|07D302| dw $0014 ; right

endpool

;---------------------------------------------------------------------------------------------------

AttemptToPushTheBlock:
|07D304| REP #$20

|07D306| TYA
|07D307| ASL A
|07D308| ASL A
|07D309| ASL A
|07D30A| STA.b $0A

|07D30C| LDA.b $66
|07D30E| ASL A
|07D30F| CLC
|07D310| ADC.b $0A
|07D312| TAY

|07D313| LDA.b $00
|07D315| STA.b $08

|07D317| LDA.b $02
|07D319| STA.b $04

|07D31B| LDA.b $08
|07D31D| CLC
|07D31E| ADC.w .target_offset_x_a,Y
|07D321| AND.b $EC

|07D323| LSR A
|07D324| LSR A
|07D325| LSR A
|07D326| STA.b $02

|07D328| LDA.b $04
|07D32A| CLC
|07D32B| ADC.w .target_offset_y_a,Y
|07D32E| AND.b $EC
|07D330| STA.b $00

|07D332| JSR PushBlock_GetGeneralizedTileInteractionOfTarget
|07D335| BEQ .no_blockage

|07D337| CPX.w #$0009 ; TILETYPE 09
|07D33A| BNE .cannot_push

.no_blockage
|07D33C| LDA.b $08
|07D33E| CLC
|07D33F| ADC.w .target_offset_x_b,Y
|07D342| AND.b $EC
|07D344| LSR A
|07D345| LSR A
|07D346| LSR A
|07D347| STA.b $02

|07D349| LDA.b $04
|07D34B| CLC
|07D34C| ADC.w .target_offset_y_b,Y
|07D34F| AND.b $EC
|07D351| STA.b $00

|07D353| JSR PushBlock_GetGeneralizedTileInteractionOfTarget
|07D356| BEQ .can_push

|07D358| CPX.w #$0009 ; TILETYPE 09
|07D35B| BNE .cannot_push

;---------------------------------------------------------------------------------------------------

.can_push
|07D35D| SEP #$30
|07D35F| CLC

|07D360| RTS

.cannot_push
|07D361| SEP #$30
|07D363| SEC

|07D364| RTS

;===================================================================================================

LiftableCheckOffset_Y:
|07D365| dw  6
|07D367| dw 24
|07D369| dw 12
|07D36B| dw 12

LiftableCheckOffset_X:
|07D36D| dw  7
|07D36F| dw  7
|07D371| dw -3
|07D373| dw 16

;===================================================================================================

LiftableGloveLevels:
|07D375| db $00 ; sign
|07D376| db $01 ; small gray rock
|07D377| db $00 ; bush
|07D378| db $00 ; dark bush
|07D379| db $02 ; small black rock
|07D37A| db $01 ; big gray rock
|07D37B| db $02 ; big black rock

LiftableTypeID:
|07D37C| db $02 ; sign
|07D37D| db $03 ; small gray rock
|07D37E| db $01 ; bush
|07D37F| db $04 ; dark bush
|07D380| db $00 ; small black rock
|07D381| db $05 ; big gray rock
|07D382| db $06 ; big black rock

;===================================================================================================

HandleLiftables:
|07D383| STZ.b $59

|07D385| REP #$20

|07D387| JSR ResetTileDetect

|07D38A| LDA.b $2F
|07D38C| TAY

|07D38D| LDA.b $20
|07D38F| CLC
|07D390| ADC.w LiftableCheckOffset_Y,Y
|07D393| AND.b $EC
|07D395| STA.b $00

|07D397| LDA.b $20
|07D399| CLC
|07D39A| ADC.w #$0014
|07D39D| AND.b $EC
|07D39F| STA.b $04

|07D3A1| LDA.b $22
|07D3A3| CLC
|07D3A4| ADC.w LiftableCheckOffset_X,Y
|07D3A7| AND.b $EC

|07D3A9| LSR A
|07D3AA| LSR A
|07D3AB| LSR A

|07D3AC| STA.b $02

|07D3AE| LDA.b $22
|07D3B0| CLC
|07D3B1| ADC.w #$0008
|07D3B4| AND.b $EC

|07D3B6| LSR A
|07D3B7| LSR A
|07D3B8| LSR A

|07D3B9| STA.b $08

;---------------------------------------------------------------------------------------------------

|07D3BB| LDA.w #$0001
|07D3BE| STA.b $0A

|07D3C0| REP #$10

|07D3C2| JSR ExecuteTileDetection

|07D3C5| LDA.b $04
|07D3C7| STA.b $00

|07D3C9| LDA.b $08
|07D3CB| STA.b $02

|07D3CD| LDA.w #$0002
|07D3D0| STA.b $0A

|07D3D2| JSR ExecuteTileDetection

|07D3D5| SEP #$30

|07D3D7| LDX.b #$02

|07D3D9| LDA.b $0E
|07D3DB| ORA.w $036D
|07D3DE| AND.b #$01
|07D3E0| BEQ .no_north_ledge

|07D3E2| LDX.b #$03

.no_north_ledge
|07D3E4| LDA.b $1B
|07D3E6| BEQ .outdoors

|07D3E8| PHX

|07D3E9| JSL TestAndIDLiftableObject
|07D3ED| BCC .not_liftable

|07D3EF| PLX

|07D3F0| AND.b #$0F
|07D3F2| TAY

|07D3F3| LDA.w LiftableTypeID,Y
|07D3F6| STA.w $0368

|07D3F9| TAY

|07D3FA| BRA .check_lift_level

;---------------------------------------------------------------------------------------------------

.not_liftable
|07D3FC| PLX

|07D3FD| LDA.w $0366
|07D400| AND.b #$01
|07D402| BEQ .move_on

|07D404| LDA.b $2F
|07D406| BNE .move_on

|07D408| LDA.w $036A
|07D40B| BNE .move_on

|07D40D| LDX.b #$04

.move_on
|07D40F| BRA .continue

;---------------------------------------------------------------------------------------------------

.outdoors
|07D411| LDA.w $0366
|07D414| AND.b #$01
|07D416| BEQ .continue

|07D418| LDA.b $2F
|07D41A| BNE .run_check

|07D41C| LDA.w $036A
|07D41F| BNE .run_check

|07D421| LDX.b #$04

|07D423| BRA .continue

;---------------------------------------------------------------------------------------------------

.run_check
|07D425| LDA.w $036A
|07D428| LSR A
|07D429| STA.w $0368

|07D42C| TAY

.check_lift_level
|07D42D| LDA.w LiftableGloveLevels,Y
|07D430| SEC
|07D431| SBC.l $7EF354
|07D435| BEQ .no_gloves
|07D437| BPL .continue

.no_gloves
|07D439| LDX.b #$01

;---------------------------------------------------------------------------------------------------

.continue
|07D43B| LDA.w $02E5
|07D43E| AND.b #$01
|07D440| BEQ .exit

|07D442| LDX.b #$05

.exit
|07D444| RTS

;===================================================================================================

pool HandleNudging

.offset_y_top
|07D445| dw $0008, $0008, $0017, $0017
|07D44D| dw $0008, $0017, $0008, $0017

.offset_x_top
|07D455| dw $0000, $000F, $0000, $000F
|07D45D| dw $0000, $0000, $000F, $000F

.offset_y_bottom
|07D465| dw $0017, $0017, $0008, $0008
|07D46D| dw $0008, $0017, $0008, $0017

.offset_x_bottom
|07D475| dw $0000, $000F, $0000, $000F
|07D47D| dw $000F, $000F, $0000, $0000

endpool

;---------------------------------------------------------------------------------------------------

HandleNudging:
|07D485| LDA.b $00
|07D487| PHA

|07D488| LDA.b $66
|07D48A| AND.b #$02
|07D48C| BNE .horizontal_last

|07D48E| LDX.b #$00

|07D490| LDA.b $66
|07D492| AND.b #$01
|07D494| BEQ .not_down_last

|07D496| LDX.b #$04

.not_down_last
|07D498| LDY.b #$00

|07D49A| LDA.b $0E
|07D49C| AND.b #$04
|07D49E| BNE .not_down

|07D4A0| LDY.b #$02

.not_down
|07D4A2| STY.b $00

|07D4A4| BRA .do_detection

;---------------------------------------------------------------------------------------------------

.horizontal_last
|07D4A6| LDX.b #$08

|07D4A8| LDA.b $66
|07D4AA| AND.b #$01
|07D4AC| BEQ .was_not_down_last

|07D4AE| LDX.b #$0C

.was_not_down_last
|07D4B0| LDY.b #$00

|07D4B2| LDA.b $0E
|07D4B4| AND.b #$04
|07D4B6| BNE .not_right

|07D4B8| LDY.b #$02

.not_right
|07D4BA| STY.b $00

;---------------------------------------------------------------------------------------------------

.do_detection
|07D4BC| TXA
|07D4BD| CLC
|07D4BE| ADC.b $00
|07D4C0| TAY

|07D4C1| STZ.b $59

|07D4C3| REP #$20

|07D4C5| JSR ResetTileDetect

|07D4C8| LDA.b $20
|07D4CA| CLC
|07D4CB| ADC.w .offset_y_top,Y
|07D4CE| AND.b $EC
|07D4D0| STA.b $00

|07D4D2| LDA.b $22
|07D4D4| CLC
|07D4D5| ADC.w .offset_x_top,Y
|07D4D8| AND.b $EC
|07D4DA| LSR A
|07D4DB| LSR A
|07D4DC| LSR A
|07D4DD| STA.b $02

|07D4DF| LDA.b $20
|07D4E1| CLC
|07D4E2| ADC.w .offset_y_bottom,Y
|07D4E5| AND.b $EC
|07D4E7| STA.b $04

|07D4E9| LDA.b $22
|07D4EB| CLC
|07D4EC| ADC.w .offset_x_bottom,Y
|07D4EF| AND.b $EC
|07D4F1| LSR A
|07D4F2| LSR A
|07D4F3| LSR A
|07D4F4| STA.b $08

|07D4F6| LDA.w #$0001
|07D4F9| STA.b $0A

|07D4FB| REP #$10

|07D4FD| JSR ExecuteTileDetection

|07D500| LDA.b $04
|07D502| STA.b $00

|07D504| LDA.b $08
|07D506| STA.b $02

|07D508| LDA.w #$0002
|07D50B| STA.b $0A

|07D50D| JSR ExecuteTileDetection

|07D510| SEP #$30

|07D512| PLA
|07D513| STA.b $00

|07D515| LDA.b $0E
|07D517| ORA.w $036E
|07D51A| AND.b #$03
|07D51C| BNE .horizontal_ledges_detected

|07D51E| LDA.w $036D
|07D521| ORA.w $0370
|07D524| AND.b #$33
|07D526| BEQ .exit

.horizontal_ledges_detected
|07D528| LDY.b #$00

|07D52A| LDA.b $00
|07D52C| EOR.b #$FF
|07D52E| INC A
|07D52F| STA.b $00

|07D531| CMP.b #$80
|07D533| BCC .positive_velocity

|07D535| LDY.b #$FF

.positive_velocity
|07D537| STY.b $01

|07D539| LDA.b $66
|07D53B| AND.b #$02
|07D53D| BEQ .add_on_x

|07D53F| REP #$20

|07D541| LDA.b $00
|07D543| CLC
|07D544| ADC.b $20
|07D546| STA.b $20

|07D548| BRA .exit

;---------------------------------------------------------------------------------------------------

.add_on_x
|07D54A| REP #$20

|07D54C| LDA.b $00
|07D54E| CLC
|07D54F| ADC.b $22
|07D551| STA.b $22

.exit
|07D553| SEP #$20

|07D555| RTS

;===================================================================================================

pool Hookshot_CheckTileCollision

.offsets_a
|07D556| dw   0,   0
|07D55A| dw   7,   7
|07D55E| dw   0,  15
|07D562| dw   0,  15

.offsets_b
|07D566| dw   0,  15
|07D56A| dw   0,  15
|07D56E| dw   0,   0
|07D572| dw   8,   8

endpool

;---------------------------------------------------------------------------------------------------

Hookshot_CheckTileCollision:
|07D576| PHB
|07D577| PHK
|07D578| PLB

|07D579| LDA.b $A0
|07D57B| PHA

|07D57C| LDA.b $EE
|07D57E| PHA

|07D57F| LDA.w $03A4,X
|07D582| BEQ .dont_swap_layers

|07D584| LDA.w $044A
|07D587| BNE .not_eg0

|07D589| LDA.b $A0
|07D58B| CLC
|07D58C| ADC.b #$10
|07D58E| STA.b $A0

.not_eg0
|07D590| LDA.b $EE
|07D592| EOR.b #$01
|07D594| STA.b $EE

;---------------------------------------------------------------------------------------------------

.dont_swap_layers
|07D596| LDA.w $0BFA,X
|07D599| STA.b $04

|07D59B| LDA.w $0C0E,X
|07D59E| STA.b $05

|07D5A0| LDA.w $0C04,X
|07D5A3| STA.b $08

|07D5A5| LDA.w $0C18,X
|07D5A8| STA.b $09

|07D5AA| LDA.w $0C72,X
|07D5AD| ASL A
|07D5AE| ASL A
|07D5AF| STA.b $73

;---------------------------------------------------------------------------------------------------

|07D5B1| PHX

|07D5B2| STZ.b $59

|07D5B4| REP #$20

|07D5B6| JSR ResetTileDetect

|07D5B9| SEP #$20

|07D5BB| LDA.w $046C
|07D5BE| CMP.b #$02
|07D5C0| BNE .only_1_layer

;---------------------------------------------------------------------------------------------------

|07D5C2| LDA.b $04
|07D5C4| PHA

|07D5C5| LDA.b $05
|07D5C7| PHA

|07D5C8| LDA.b $08
|07D5CA| PHA

|07D5CB| LDA.b $09
|07D5CD| PHA

|07D5CE| LDA.b #$01
|07D5D0| STA.b $EE

;---------------------------------------------------------------------------------------------------

|07D5D2| REP #$20

|07D5D4| LDA.b $E6
|07D5D6| SEC
|07D5D7| SBC.b $E8

|07D5D9| CLC
|07D5DA| ADC.b $04
|07D5DC| STA.b $04

|07D5DE| LDA.b $E0
|07D5E0| SEC
|07D5E1| SBC.b $E2

|07D5E3| CLC
|07D5E4| ADC.b $08
|07D5E6| STA.b $08

;---------------------------------------------------------------------------------------------------

|07D5E8| SEP #$20

|07D5EA| JSR Hookshot_CheckSingleLayerTileCollision

|07D5ED| PLA
|07D5EE| STA.b $09

|07D5F0| PLA
|07D5F1| STA.b $08

|07D5F3| PLA
|07D5F4| STA.b $05

|07D5F6| PLA
|07D5F7| STA.b $04

|07D5F9| STZ.b $EE

;---------------------------------------------------------------------------------------------------

.only_1_layer
|07D5FB| JSR Hookshot_CheckSingleLayerTileCollision

|07D5FE| PLX

|07D5FF| PLA
|07D600| STA.b $EE

|07D602| PLA
|07D603| STA.b $A0

|07D605| PLB

|07D606| RTL

;===================================================================================================

Hookshot_CheckSingleLayerTileCollision:
|07D607| REP #$20

|07D609| LDA.b $73
|07D60B| TAY

;---------------------------------------------------------------------------------------------------

|07D60C| LDA.b $04
|07D60E| CLC
|07D60F| ADC.w Hookshot_CheckTileCollision.offsets_a+0,Y
|07D612| AND.b $EC
|07D614| STA.b $00

|07D616| LDA.b $04
|07D618| CLC
|07D619| ADC.w Hookshot_CheckTileCollision.offsets_a+2,Y
|07D61C| AND.b $EC
|07D61E| STA.b $04

;---------------------------------------------------------------------------------------------------

|07D620| LDA.b $08
|07D622| CLC
|07D623| ADC.w Hookshot_CheckTileCollision.offsets_b+0,Y
|07D626| AND.b $EC

|07D628| LSR A
|07D629| LSR A
|07D62A| LSR A
|07D62B| STA.b $02


|07D62D| LDA.b $08
|07D62F| CLC
|07D630| ADC.w Hookshot_CheckTileCollision.offsets_b+2,Y
|07D633| AND.b $EC

|07D635| LSR A
|07D636| LSR A
|07D637| LSR A
|07D638| STA.b $08

;---------------------------------------------------------------------------------------------------

|07D63A| REP #$10

|07D63C| LDA.w #$0001
|07D63F| STA.b $0A

|07D641| JSR ExecuteTileDetection

|07D644| LDA.b $04
|07D646| STA.b $00

|07D648| LDA.b $08
|07D64A| STA.b $02

|07D64C| LDA.w #$0002
|07D64F| STA.b $0A

|07D651| JSR ExecuteTileDetection

|07D654| SEP #$30

|07D656| RTS

;===================================================================================================

pool HandleNudgingInADoor

.offset_y
|07D657| dw $0008, $0017, $0010, $0010

.offset_x
|07D65F| dw $0008, $0008, $0000, $000F

endpool

;---------------------------------------------------------------------------------------------------

HandleNudgingInADoor:
|07D667| LDA.b $00
|07D669| PHA

|07D66A| LDA.b $66
|07D66C| AND.b #$02
|07D66E| BEQ .not_horizontal_last

|07D670| LDY.b #$02

|07D672| LDA.b $20
|07D674| CMP.b #$80
|07D676| BCC .start_detect

|07D678| LDY.b #$00
|07D67A| BRA .start_detect

.not_horizontal_last
|07D67C| LDY.b #$06

|07D67E| LDA.b $22
|07D680| CMP.b #$80
|07D682| BCC .start_detect

|07D684| LDY.b #$04

.start_detect
|07D686| STZ.b $59

|07D688| REP #$20

|07D68A| JSR ResetTileDetect

|07D68D| LDA.b $20
|07D68F| CLC
|07D690| ADC.w .offset_y,Y
|07D693| AND.b $EC
|07D695| STA.b $00

|07D697| LDA.b $22
|07D699| CLC
|07D69A| ADC.w .offset_x,Y
|07D69D| AND.b $EC
|07D69F| LSR A
|07D6A0| LSR A
|07D6A1| LSR A
|07D6A2| STA.b $02

|07D6A4| LDA.w #$0001
|07D6A7| STA.b $0A

|07D6A9| REP #$10

|07D6AB| JSR ExecuteTileDetection

|07D6AE| SEP #$30

|07D6B0| PLA
|07D6B1| STA.b $00

|07D6B3| LDA.b $0E
|07D6B5| ORA.w $036E
|07D6B8| AND.b #$03
|07D6BA| BNE .horizontal_ledge_detected

|07D6BC| LDA.w $036D
|07D6BF| ORA.w $0370
|07D6C2| AND.b #$33
|07D6C4| BEQ .exit

.horizontal_ledge_detected
|07D6C6| LDY.b #$00

|07D6C8| LDA.b $00
|07D6CA| EOR.b #$FF
|07D6CC| INC A
|07D6CD| STA.b $00

|07D6CF| CMP.b #$80
|07D6D1| BCC .offset_positive

|07D6D3| LDY.b #$FF

.offset_positive
|07D6D5| STY.b $01

|07D6D7| LDA.b $66
|07D6D9| AND.b #$02
|07D6DB| BEQ .add_on_x

|07D6DD| REP #$20

|07D6DF| LDA.b $00
|07D6E1| CLC
|07D6E2| ADC.b $20
|07D6E4| STA.b $20

|07D6E6| BRA .exit

.add_on_x
|07D6E8| REP #$20

|07D6EA| LDA.b $00
|07D6EC| CLC
|07D6ED| ADC.b $22
|07D6EF| STA.b $22

.exit
|07D6F1| SEP #$20

|07D6F3| RTS

;===================================================================================================

TileCheckForMirrorBonk:
|07D6F4| STZ.b $59

|07D6F6| REP #$20

|07D6F8| JSR ResetTileDetect

|07D6FB| LDA.b $22
|07D6FD| CLC
|07D6FE| ADC.w #$0002
|07D701| AND.b $EC
|07D703| LSR A
|07D704| LSR A
|07D705| LSR A
|07D706| STA.b $02

|07D708| LDA.b $22
|07D70A| CLC
|07D70B| ADC.w #$000D
|07D70E| AND.b $EC
|07D710| LSR A
|07D711| LSR A
|07D712| LSR A
|07D713| STA.b $04

|07D715| LDA.b $20
|07D717| CLC
|07D718| ADC.w #$000A
|07D71B| AND.b $EC
|07D71D| STA.b $00
|07D71F| STA.b $74

|07D721| LDA.b $20
|07D723| CLC
|07D724| ADC.w #$0015
|07D727| AND.b $EC
|07D729| STA.b $08

|07D72B| BRL TileDetect_FromMirrorBonk

;===================================================================================================

pool TileDetect_SwordSwingDeepInDoor

.offset_y
|07D72E| dw $FFFF, $0018, $0010, $0010

.offset_x
|07D736| dw $0008, $0008, $FFFF, $0010

endpool

;---------------------------------------------------------------------------------------------------

TileDetect_SwordSwingDeepInDoor:
|07D73E| STZ.b $59

|07D740| REP #$20

|07D742| JSR ResetTileDetect

|07D745| TXA
|07D746| AND.w #$00FF
|07D749| DEC A

|07D74A| ASL A
|07D74B| ASL A
|07D74C| TAY

;---------------------------------------------------------------------------------------------------

|07D74D| LDA.b $22
|07D74F| CLC
|07D750| ADC.w .offset_x+0,Y
|07D753| AND.b $EC

|07D755| LSR A
|07D756| LSR A
|07D757| LSR A
|07D758| STA.b $02

|07D75A| LDA.b $22
|07D75C| CLC
|07D75D| ADC.w .offset_x+2,Y
|07D760| AND.b $EC

|07D762| LSR A
|07D763| LSR A
|07D764| LSR A
|07D765| STA.b $04

|07D767| LDA.b $20
|07D769| CLC
|07D76A| ADC.w .offset_y+0,Y
|07D76D| AND.b $EC
|07D76F| STA.b $00

|07D771| LDA.b $20
|07D773| CLC
|07D774| ADC.w .offset_y+2,Y
|07D777| AND.b $EC
|07D779| STA.b $08

;---------------------------------------------------------------------------------------------------

|07D77B| REP #$10

|07D77D| LDA.w #$0001
|07D780| STA.b $0A

|07D782| JSR ExecuteTileDetection

|07D785| LDA.b $04
|07D787| STA.b $02

|07D789| LDA.b $08
|07D78B| STA.b $00

|07D78D| LDA.w #$0002
|07D790| STA.b $0A

|07D792| JSR ExecuteTileDetection

|07D795| SEP #$30

|07D797| RTS

;===================================================================================================

ResetTileDetect:
|07D798| STZ.b $0C
|07D79A| STZ.b $0E

|07D79C| STZ.b $38
|07D79E| STZ.b $58

|07D7A0| STZ.w $02C0

|07D7A3| STZ.b $5F
|07D7A5| STZ.b $62

|07D7A7| STZ.w $0320

|07D7AA| STZ.w $0341
|07D7AD| STZ.w $0343

|07D7B0| STZ.w $0348
|07D7B3| STZ.w $034C

|07D7B6| STZ.w $0357
|07D7B9| STZ.w $0359
|07D7BC| STZ.w $035B

|07D7BF| STZ.w $0366

|07D7C2| STZ.w $036D
|07D7C5| STZ.w $036F

|07D7C8| STZ.w $02E5
|07D7CB| STZ.w $02E7
|07D7CE| STZ.w $02EE

|07D7D1| STZ.w $02F6

|07D7D4| STZ.w $03F1

|07D7D7| RTS

;===================================================================================================

pool ExecuteTileDetection_underworld

.vectors
|07D7D8| dw TileBehavior_Nothing                          ; 0x00 UW
|07D7DA| dw TileBehavior_StandardCollision                ; 0x01 UW
|07D7DC| dw TileBehavior_StandardCollision                ; 0x02 UW
|07D7DE| dw TileBehavior_StandardCollision                ; 0x03 UW
|07D7E0| dw TileBehavior_StandardCollision                ; 0x04 UW
|07D7E2| dw TileBehavior_Nothing                          ; 0x05 UW
|07D7E4| dw TileBehavior_Nothing                          ; 0x06 UW
|07D7E6| dw TileBehavior_Nothing                          ; 0x07 UW
|07D7E8| dw TileBehavior_DeepWater                        ; 0x08 UW
|07D7EA| dw TileBehavior_ShallowWater                     ; 0x09 UW
|07D7EC| dw TileBehavior_ShortWaterLadder                 ; 0x0A UW
|07D7EE| dw TileBehavior_StandardCollision                ; 0x0B UW
|07D7F0| dw TileBehavior_OverlayMask_0C                   ; 0x0C UW
|07D7F2| dw TileBehavior_SpikeFloor                       ; 0x0D UW
|07D7F4| dw TileBehavior_GanonIce                         ; 0x0E UW
|07D7F6| dw TileBehavior_PalaceIce                        ; 0x0F UW
|07D7F8| dw TileBehavior_Slope                            ; 0x10 UW
|07D7FA| dw TileBehavior_Slope                            ; 0x11 UW
|07D7FC| dw TileBehavior_Slope                            ; 0x12 UW
|07D7FE| dw TileBehavior_Slope                            ; 0x13 UW
|07D800| dw TileBehavior_Nothing                          ; 0x14 UW
|07D802| dw TileBehavior_Nothing                          ; 0x15 UW
|07D804| dw TileBehavior_Nothing                          ; 0x16 UW
|07D806| dw TileBehavior_Nothing                          ; 0x17 UW
|07D808| dw TileBehavior_SlopeOuter                       ; 0x18 UW
|07D80A| dw TileBehavior_SlopeOuter                       ; 0x19 UW
|07D80C| dw TileBehavior_SlopeOuter                       ; 0x1A UW
|07D80E| dw TileBehavior_SlopeOuter                       ; 0x1B UW
|07D810| dw TileBehavior_OverlayMask_1C                   ; 0x1C UW
|07D812| dw TileBehavior_NorthSingleLayerStairs           ; 0x1D UW
|07D814| dw TileBehavior_NorthSwapLayerStairs             ; 0x1E UW
|07D816| dw TileBehavior_NorthSwapLayerStairs             ; 0x1F UW
|07D818| dw TileBehavior_Pit                              ; 0x20 UW
|07D81A| dw TileBehavior_Nothing                          ; 0x21 UW
|07D81C| dw TileBehavior_ManualStairs                     ; 0x22 UW
|07D81E| dw TileBehavior_Nothing                          ; 0x23 UW
|07D820| dw TileBehavior_Nothing                          ; 0x24 UW
|07D822| dw TileBehavior_Nothing                          ; 0x25 UW
|07D824| dw TileBehavior_StandardCollision                ; 0x26 UW
|07D826| dw TileBehavior_Hookshottables                   ; 0x27 UW
|07D828| dw TileBehavior_Ledge_North                      ; 0x28 UW
|07D82A| dw TileBehavior_Ledge_South                      ; 0x29 UW
|07D82C| dw TileBehavior_Ledge_EastWest                   ; 0x2A UW
|07D82E| dw TileBehavior_Ledge_EastWest                   ; 0x2B UW
|07D830| dw TileBehavior_Ledge_NorthDiagonal              ; 0x2C UW
|07D832| dw TileBehavior_Ledge_SouthDiagonal              ; 0x2D UW
|07D834| dw TileBehavior_Ledge_NorthDiagonal              ; 0x2E UW
|07D836| dw TileBehavior_Ledge_SouthDiagonal              ; 0x2F UW
|07D838| dw TileBehavior_ManualStairs                     ; 0x30 UW
|07D83A| dw TileBehavior_ManualStairs                     ; 0x31 UW
|07D83C| dw TileBehavior_ManualStairs                     ; 0x32 UW
|07D83E| dw TileBehavior_ManualStairs                     ; 0x33 UW
|07D840| dw TileBehavior_ManualStairs                     ; 0x34 UW
|07D842| dw TileBehavior_ManualStairs                     ; 0x35 UW
|07D844| dw TileBehavior_ManualStairs                     ; 0x36 UW
|07D846| dw TileBehavior_ManualStairs                     ; 0x37 UW
|07D848| dw TileBehavior_Nothing                          ; 0x38 UW
|07D84A| dw TileBehavior_Nothing                          ; 0x39 UW
|07D84C| dw TileBehavior_Nothing                          ; 0x3A UW
|07D84E| dw TileBehavior_Nothing                          ; 0x3B UW
|07D850| dw TileBehavior_Nothing                          ; 0x3C UW
|07D852| dw TileBehavior_SouthSingleLayerStairs           ; 0x3D UW
|07D854| dw TileBehavior_SouthSwapLayerStairs             ; 0x3E UW
|07D856| dw TileBehavior_SouthSwapLayerStairs             ; 0x3F UW
|07D858| dw TileBehavior_ThickGrass                       ; 0x40 UW
|07D85A| dw TileBehavior_Nothing                          ; 0x41 UW
|07D85C| dw TileBehavior_Nothing                          ; 0x42 UW
|07D85E| dw TileBehavior_StandardCollision                ; 0x43 UW
|07D860| dw TileBehavior_Spike                            ; 0x44 UW
|07D862| dw TileBehavior_Nothing                          ; 0x45 UW
|07D864| dw TileBehavior_HylianPlaque                     ; 0x46 UW
|07D866| dw TileBehavior_Nothing                          ; 0x47 UW
|07D868| dw TileBehavior_DiggableGround                   ; 0x48 UW
|07D86A| dw TileBehavior_Nothing                          ; 0x49 UW
|07D86C| dw TileBehavior_DiggableGround                   ; 0x4A UW
|07D86E| dw TileBehavior_Warp                             ; 0x4B UW
|07D870| dw TileBehavior_Nothing                          ; 0x4C UW
|07D872| dw TileBehavior_Nothing                          ; 0x4D UW
|07D874| dw TileBehavior_Nothing                          ; 0x4E UW
|07D876| dw TileBehavior_Nothing                          ; 0x4F UW
|07D878| dw TileBehavior_Liftable                         ; 0x50 UW
|07D87A| dw TileBehavior_Liftable                         ; 0x51 UW
|07D87C| dw TileBehavior_Liftable                         ; 0x52 UW
|07D87E| dw TileBehavior_Liftable                         ; 0x53 UW
|07D880| dw TileBehavior_Liftable                         ; 0x54 UW
|07D882| dw TileBehavior_Liftable                         ; 0x55 UW
|07D884| dw TileBehavior_Liftable                         ; 0x56 UW
|07D886| dw TileBehavior_BonkRocks                        ; 0x57 UW
|07D888| dw TileBehavior_Chest                            ; 0x58 UW
|07D88A| dw TileBehavior_Chest                            ; 0x59 UW
|07D88C| dw TileBehavior_Chest                            ; 0x5A UW
|07D88E| dw TileBehavior_Chest                            ; 0x5B UW
|07D890| dw TileBehavior_Chest                            ; 0x5C UW
|07D892| dw TileBehavior_Chest                            ; 0x5D UW
|07D894| dw TileBehavior_Nothing                          ; 0x5E UW
|07D896| dw TileBehavior_Nothing                          ; 0x5F UW
|07D898| dw TileBehavior_RupeeTile                        ; 0x60 UW
|07D89A| dw TileBehavior_Nothing                          ; 0x61 UW
|07D89C| dw TileBehavior_Nothing                          ; 0x62 UW
|07D89E| dw TileBehavior_MinigameChest                    ; 0x63 UW
|07D8A0| dw TileBehavior_Nothing                          ; 0x64 UW
|07D8A2| dw TileBehavior_Nothing                          ; 0x65 UW
|07D8A4| dw TileBehavior_Nothing                          ; 0x66 UW
|07D8A6| dw TileBehavior_CrystalPeg_Up                    ; 0x67 UW
|07D8A8| dw TileBehavior_Conveyor_Upwards                 ; 0x68 UW
|07D8AA| dw TileBehavior_Conveyor_Downwards               ; 0x69 UW
|07D8AC| dw TileBehavior_Conveyor_Leftwards               ; 0x6A UW
|07D8AE| dw TileBehavior_Conveyor_Rightwards              ; 0x6B UW
|07D8B0| dw TileBehavior_StandardCollision                ; 0x6C UW
|07D8B2| dw TileBehavior_StandardCollision                ; 0x6D UW
|07D8B4| dw TileBehavior_StandardCollision                ; 0x6E UW
|07D8B6| dw TileBehavior_StandardCollision                ; 0x6F UW
|07D8B8| dw TileBehavior_ManipulablyReplaced              ; 0x70 UW
|07D8BA| dw TileBehavior_ManipulablyReplaced              ; 0x71 UW
|07D8BC| dw TileBehavior_ManipulablyReplaced              ; 0x72 UW
|07D8BE| dw TileBehavior_ManipulablyReplaced              ; 0x73 UW
|07D8C0| dw TileBehavior_ManipulablyReplaced              ; 0x74 UW
|07D8C2| dw TileBehavior_ManipulablyReplaced              ; 0x75 UW
|07D8C4| dw TileBehavior_ManipulablyReplaced              ; 0x76 UW
|07D8C6| dw TileBehavior_ManipulablyReplaced              ; 0x77 UW
|07D8C8| dw TileBehavior_ManipulablyReplaced              ; 0x78 UW
|07D8CA| dw TileBehavior_ManipulablyReplaced              ; 0x79 UW
|07D8CC| dw TileBehavior_ManipulablyReplaced              ; 0x7A UW
|07D8CE| dw TileBehavior_ManipulablyReplaced              ; 0x7B UW
|07D8D0| dw TileBehavior_ManipulablyReplaced              ; 0x7C UW
|07D8D2| dw TileBehavior_ManipulablyReplaced              ; 0x7D UW
|07D8D4| dw TileBehavior_ManipulablyReplaced              ; 0x7E UW
|07D8D6| dw TileBehavior_ManipulablyReplaced              ; 0x7F UW
|07D8D8| dw TileBehavior_Door                             ; 0x80 UW
|07D8DA| dw TileBehavior_Door                             ; 0x81 UW
|07D8DC| dw TileBehavior_ShutterDoor                      ; 0x82 UW
|07D8DE| dw TileBehavior_ShutterDoor                      ; 0x83 UW
|07D8E0| dw TileBehavior_Door                             ; 0x84 UW
|07D8E2| dw TileBehavior_Door                             ; 0x85 UW
|07D8E4| dw TileBehavior_Door                             ; 0x86 UW
|07D8E6| dw TileBehavior_Door                             ; 0x87 UW
|07D8E8| dw TileBehavior_Door                             ; 0x88 UW
|07D8EA| dw TileBehavior_Door                             ; 0x89 UW
|07D8EC| dw TileBehavior_Door                             ; 0x8A UW
|07D8EE| dw TileBehavior_Door                             ; 0x8B UW
|07D8F0| dw TileBehavior_Door                             ; 0x8C UW
|07D8F2| dw TileBehavior_Door                             ; 0x8D UW
|07D8F4| dw TileBehavior_Entrance                         ; 0x8E UW
|07D8F6| dw TileBehavior_Entrance                         ; 0x8F UW
|07D8F8| dw TileBehavior_LayerToggleShutterDoor           ; 0x90 UW
|07D8FA| dw TileBehavior_LayerToggleShutterDoor           ; 0x91 UW
|07D8FC| dw TileBehavior_LayerToggleShutterDoor           ; 0x92 UW
|07D8FE| dw TileBehavior_LayerToggleShutterDoor           ; 0x93 UW
|07D900| dw TileBehavior_LayerToggleShutterDoor           ; 0x94 UW
|07D902| dw TileBehavior_LayerToggleShutterDoor           ; 0x95 UW
|07D904| dw TileBehavior_LayerToggleShutterDoor           ; 0x96 UW
|07D906| dw TileBehavior_LayerToggleShutterDoor           ; 0x97 UW
|07D908| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x98 UW
|07D90A| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x99 UW
|07D90C| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9A UW
|07D90E| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9B UW
|07D910| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9C UW
|07D912| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9D UW
|07D914| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9E UW
|07D916| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9F UW
|07D918| dw TileBehavior_DungeonToggleManualDoor          ; 0xA0 UW
|07D91A| dw TileBehavior_DungeonToggleManualDoor          ; 0xA1 UW
|07D91C| dw TileBehavior_DungeonToggleShutterDoor         ; 0xA2 UW
|07D91E| dw TileBehavior_DungeonToggleShutterDoor         ; 0xA3 UW
|07D920| dw TileBehavior_DungeonToggleManualDoor          ; 0xA4 UW
|07D922| dw TileBehavior_DungeonToggleManualDoor          ; 0xA5 UW
|07D924| dw TileBehavior_Nothing                          ; 0xA6 UW
|07D926| dw TileBehavior_Nothing                          ; 0xA7 UW
|07D928| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA8 UW
|07D92A| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA9 UW
|07D92C| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAA UW
|07D92E| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAB UW
|07D930| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAC UW
|07D932| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAD UW
|07D934| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAE UW
|07D936| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAF UW
|07D938| dw TileBehavior_Pit                              ; 0xB0 UW
|07D93A| dw TileBehavior_Pit                              ; 0xB1 UW
|07D93C| dw TileBehavior_Pit                              ; 0xB2 UW
|07D93E| dw TileBehavior_Pit                              ; 0xB3 UW
|07D940| dw TileBehavior_Pit                              ; 0xB4 UW
|07D942| dw TileBehavior_Pit                              ; 0xB5 UW
|07D944| dw TileBehavior_Pit                              ; 0xB6 UW
|07D946| dw TileBehavior_Pit                              ; 0xB7 UW
|07D948| dw TileBehavior_Pit                              ; 0xB8 UW
|07D94A| dw TileBehavior_Pit                              ; 0xB9 UW
|07D94C| dw TileBehavior_Pit                              ; 0xBA UW
|07D94E| dw TileBehavior_Pit                              ; 0xBB UW
|07D950| dw TileBehavior_Pit                              ; 0xBC UW
|07D952| dw TileBehavior_Pit                              ; 0xBD UW
|07D954| dw TileBehavior_Nothing                          ; 0xBE UW
|07D956| dw TileBehavior_Nothing                          ; 0xBF UW
|07D958| dw TileBehavior_LightableTorch                   ; 0xC0 UW
|07D95A| dw TileBehavior_LightableTorch                   ; 0xC1 UW
|07D95C| dw TileBehavior_LightableTorch                   ; 0xC2 UW
|07D95E| dw TileBehavior_LightableTorch                   ; 0xC3 UW
|07D960| dw TileBehavior_LightableTorch                   ; 0xC4 UW
|07D962| dw TileBehavior_LightableTorch                   ; 0xC5 UW
|07D964| dw TileBehavior_LightableTorch                   ; 0xC6 UW
|07D966| dw TileBehavior_LightableTorch                   ; 0xC7 UW
|07D968| dw TileBehavior_LightableTorch                   ; 0xC8 UW
|07D96A| dw TileBehavior_LightableTorch                   ; 0xC9 UW
|07D96C| dw TileBehavior_LightableTorch                   ; 0xCA UW
|07D96E| dw TileBehavior_LightableTorch                   ; 0xCB UW
|07D970| dw TileBehavior_LightableTorch                   ; 0xCC UW
|07D972| dw TileBehavior_LightableTorch                   ; 0xCD UW
|07D974| dw TileBehavior_LightableTorch                   ; 0xCE UW
|07D976| dw TileBehavior_LightableTorch                   ; 0xCF UW
|07D978| dw TileBehavior_Nothing                          ; 0xD0 UW
|07D97A| dw TileBehavior_Nothing                          ; 0xD1 UW
|07D97C| dw TileBehavior_Nothing                          ; 0xD2 UW
|07D97E| dw TileBehavior_Nothing                          ; 0xD3 UW
|07D980| dw TileBehavior_Nothing                          ; 0xD4 UW
|07D982| dw TileBehavior_Nothing                          ; 0xD5 UW
|07D984| dw TileBehavior_Nothing                          ; 0xD6 UW
|07D986| dw TileBehavior_Nothing                          ; 0xD7 UW
|07D988| dw TileBehavior_Nothing                          ; 0xD8 UW
|07D98A| dw TileBehavior_Nothing                          ; 0xD9 UW
|07D98C| dw TileBehavior_Nothing                          ; 0xDA UW
|07D98E| dw TileBehavior_Nothing                          ; 0xDB UW
|07D990| dw TileBehavior_Nothing                          ; 0xDC UW
|07D992| dw TileBehavior_Nothing                          ; 0xDD UW
|07D994| dw TileBehavior_Nothing                          ; 0xDE UW
|07D996| dw TileBehavior_Nothing                          ; 0xDF UW
|07D998| dw TileBehavior_Nothing                          ; 0xE0 UW
|07D99A| dw TileBehavior_Nothing                          ; 0xE1 UW
|07D99C| dw TileBehavior_Nothing                          ; 0xE2 UW
|07D99E| dw TileBehavior_Nothing                          ; 0xE3 UW
|07D9A0| dw TileBehavior_Nothing                          ; 0xE4 UW
|07D9A2| dw TileBehavior_Nothing                          ; 0xE5 UW
|07D9A4| dw TileBehavior_Nothing                          ; 0xE6 UW
|07D9A6| dw TileBehavior_Nothing                          ; 0xE7 UW
|07D9A8| dw TileBehavior_Nothing                          ; 0xE8 UW
|07D9AA| dw TileBehavior_Nothing                          ; 0xE9 UW
|07D9AC| dw TileBehavior_Nothing                          ; 0xEA UW
|07D9AE| dw TileBehavior_Nothing                          ; 0xEB UW
|07D9B0| dw TileBehavior_Nothing                          ; 0xEC UW
|07D9B2| dw TileBehavior_Nothing                          ; 0xED UW
|07D9B4| dw TileBehavior_Nothing                          ; 0xEE UW
|07D9B6| dw TileBehavior_Nothing                          ; 0xEF UW
|07D9B8| dw TileBehavior_FlaggableDoor                    ; 0xF0 UW
|07D9BA| dw TileBehavior_FlaggableDoor                    ; 0xF1 UW
|07D9BC| dw TileBehavior_FlaggableDoor                    ; 0xF2 UW
|07D9BE| dw TileBehavior_FlaggableDoor                    ; 0xF3 UW
|07D9C0| dw TileBehavior_FlaggableDoor                    ; 0xF4 UW
|07D9C2| dw TileBehavior_FlaggableDoor                    ; 0xF5 UW
|07D9C4| dw TileBehavior_FlaggableDoor                    ; 0xF6 UW
|07D9C6| dw TileBehavior_FlaggableDoor                    ; 0xF7 UW
|07D9C8| dw TileBehavior_FlaggableDoor                    ; 0xF8 UW
|07D9CA| dw TileBehavior_FlaggableDoor                    ; 0xF9 UW
|07D9CC| dw TileBehavior_FlaggableDoor                    ; 0xFA UW
|07D9CE| dw TileBehavior_FlaggableDoor                    ; 0xFB UW
|07D9D0| dw TileBehavior_FlaggableDoor                    ; 0xFC UW
|07D9D2| dw TileBehavior_FlaggableDoor                    ; 0xFD UW
|07D9D4| dw TileBehavior_FlaggableDoor                    ; 0xFE UW
|07D9D6| dw TileBehavior_FlaggableDoor                    ; 0xFF UW

endpool

;===================================================================================================

ExecuteTileDetection:
|07D9D8| SEP #$30

|07D9DA| LDA.b $1B
|07D9DC| BNE ExecuteTileDetection_underworld

|07D9DE| BRL ExecuteTileDetection_overworld

;===================================================================================================

ExecuteTileDetection_underworld:
|07D9E1| REP #$20

|07D9E3| LDA.b $49
|07D9E5| AND.w #$00FF
|07D9E8| STA.b $49

|07D9EA| LDA.b $00
|07D9EC| AND.w #$FFF8
|07D9EF| ASL A
|07D9F0| ASL A
|07D9F1| ASL A
|07D9F2| STA.b $06

|07D9F4| LDA.b $02
|07D9F6| AND.w #$003F
|07D9F9| CLC
|07D9FA| ADC.b $06

|07D9FC| LDX.b $EE
|07D9FE| BEQ .upper_layer

|07DA00| CLC
|07DA01| ADC.w #$1000

.upper_layer
|07DA04| REP #$10

|07DA06| TAX

|07DA07| LDA.l $7F2000,X
|07DA0B| PHA

;---------------------------------------------------------------------------------------------------

|07DA0C| LDA.w $037F
|07DA0F| AND.w #$00FF
|07DA12| BEQ .not_oob

|07DA14| PLA
|07DA15| LDA.w #$0000
|07DA18| BRA .oob_mode

.not_oob
|07DA1A| PLA

.oob_mode
|07DA1B| AND.w #$00FF
|07DA1E| STA.b $06
|07DA20| STA.w $0114

|07DA23| STX.b $BD

|07DA25| ASL A
|07DA26| TAX

|07DA27| JMP.w (.vectors,X)

;===================================================================================================

pool ExecuteTileDetection_overworld

.vectors
|07DA2A| dw TileBehavior_NothingOW                        ; 0x00 OW
|07DA2C| dw TileBehavior_StandardCollision                ; 0x01 OW
|07DA2E| dw TileBehavior_StandardCollision                ; 0x02 OW
|07DA30| dw TileBehavior_StandardCollision                ; 0x03 OW
|07DA32| dw TileBehavior_ThickGrass                       ; 0x04 OW
|07DA34| dw TileBehavior_NothingOW                        ; 0x05 OW
|07DA36| dw TileBehavior_NothingOW                        ; 0x06 OW
|07DA38| dw TileBehavior_NothingOW                        ; 0x07 OW
|07DA3A| dw TileBehavior_DeepWater                        ; 0x08 OW
|07DA3C| dw TileBehavior_ShallowWater                     ; 0x09 OW
|07DA3E| dw TileBehavior_ShortWaterLadder                 ; 0x0A OW
|07DA40| dw TileBehavior_UnusedDeepWater                  ; 0x0B OW
|07DA42| dw TileBehavior_OverlayMask_0C                   ; 0x0C OW
|07DA44| dw TileBehavior_SpikeFloor                       ; 0x0D OW
|07DA46| dw TileBehavior_GanonIce                         ; 0x0E OW
|07DA48| dw TileBehavior_PalaceIce                        ; 0x0F OW
|07DA4A| dw TileBehavior_Slope                            ; 0x10 OW
|07DA4C| dw TileBehavior_Slope                            ; 0x11 OW
|07DA4E| dw TileBehavior_Slope                            ; 0x12 OW
|07DA50| dw TileBehavior_Slope                            ; 0x13 OW
|07DA52| dw TileBehavior_NothingOW                        ; 0x14 OW
|07DA54| dw TileBehavior_NothingOW                        ; 0x15 OW
|07DA56| dw TileBehavior_NothingOW                        ; 0x16 OW
|07DA58| dw TileBehavior_NothingOW                        ; 0x17 OW
|07DA5A| dw TileBehavior_SlopeOuter                       ; 0x18 OW
|07DA5C| dw TileBehavior_SlopeOuter                       ; 0x19 OW
|07DA5E| dw TileBehavior_SlopeOuter                       ; 0x1A OW
|07DA60| dw TileBehavior_SlopeOuter                       ; 0x1B OW
|07DA62| dw TileBehavior_OverlayMask_1C                   ; 0x1C OW
|07DA64| dw TileBehavior_NorthSingleLayerStairs           ; 0x1D OW
|07DA66| dw TileBehavior_NorthSwapLayerStairs             ; 0x1E OW
|07DA68| dw TileBehavior_NorthSwapLayerStairs             ; 0x1F OW
|07DA6A| dw TileBehavior_Pit                              ; 0x20 OW
|07DA6C| dw TileBehavior_NothingOW                        ; 0x21 OW
|07DA6E| dw TileBehavior_ManualStairs                     ; 0x22 OW
|07DA70| dw TileBehavior_NothingOW                        ; 0x23 OW
|07DA72| dw TileBehavior_NothingOW                        ; 0x24 OW
|07DA74| dw TileBehavior_NothingOW                        ; 0x25 OW
|07DA76| dw TileBehavior_StandardCollision                ; 0x26 OW
|07DA78| dw TileBehavior_Hookshottables                   ; 0x27 OW
|07DA7A| dw TileBehavior_Ledge_North                      ; 0x28 OW
|07DA7C| dw TileBehavior_Ledge_South                      ; 0x29 OW
|07DA7E| dw TileBehavior_Ledge_EastWest                   ; 0x2A OW
|07DA80| dw TileBehavior_Ledge_EastWest                   ; 0x2B OW
|07DA82| dw TileBehavior_Ledge_NorthDiagonal              ; 0x2C OW
|07DA84| dw TileBehavior_Ledge_SouthDiagonal              ; 0x2D OW
|07DA86| dw TileBehavior_Ledge_NorthDiagonal              ; 0x2E OW
|07DA88| dw TileBehavior_Ledge_SouthDiagonal              ; 0x2F OW
|07DA8A| dw TileBehavior_ManualStairs                     ; 0x30 OW
|07DA8C| dw TileBehavior_ManualStairs                     ; 0x31 OW
|07DA8E| dw TileBehavior_ManualStairs                     ; 0x32 OW
|07DA90| dw TileBehavior_ManualStairs                     ; 0x33 OW
|07DA92| dw TileBehavior_ManualStairs                     ; 0x34 OW
|07DA94| dw TileBehavior_ManualStairs                     ; 0x35 OW
|07DA96| dw TileBehavior_ManualStairs                     ; 0x36 OW
|07DA98| dw TileBehavior_ManualStairs                     ; 0x37 OW
|07DA9A| dw TileBehavior_NothingOW                        ; 0x38 OW
|07DA9C| dw TileBehavior_NothingOW                        ; 0x39 OW
|07DA9E| dw TileBehavior_NothingOW                        ; 0x3A OW
|07DAA0| dw TileBehavior_NothingOW                        ; 0x3B OW
|07DAA2| dw TileBehavior_NothingOW                        ; 0x3C OW
|07DAA4| dw TileBehavior_SouthSingleLayerStairs           ; 0x3D OW
|07DAA6| dw TileBehavior_SouthSwapLayerStairs             ; 0x3E OW
|07DAA8| dw TileBehavior_SouthSwapLayerStairs             ; 0x3F OW
|07DAAA| dw TileBehavior_ThickGrass                       ; 0x40 OW
|07DAAC| dw TileBehavior_NothingOW                        ; 0x41 OW
|07DAAE| dw TileBehavior_GraveStone                       ; 0x42 OW
|07DAB0| dw TileBehavior_StandardCollision                ; 0x43 OW
|07DAB2| dw TileBehavior_Spike                            ; 0x44 OW
|07DAB4| dw TileBehavior_NothingOW                        ; 0x45 OW
|07DAB6| dw TileBehavior_HylianPlaque                     ; 0x46 OW
|07DAB8| dw TileBehavior_NothingOW                        ; 0x47 OW
|07DABA| dw TileBehavior_DiggableGround                   ; 0x48 OW
|07DABC| dw TileBehavior_NothingOW                        ; 0x49 OW
|07DABE| dw TileBehavior_DiggableGround                   ; 0x4A OW
|07DAC0| dw TileBehavior_Warp                             ; 0x4B OW
|07DAC2| dw TileBehavior_UnusedCornerType                 ; 0x4C OW
|07DAC4| dw TileBehavior_UnusedCornerType                 ; 0x4D OW
|07DAC6| dw TileBehavior_EasternRuinsCorner               ; 0x4E OW
|07DAC8| dw TileBehavior_EasternRuinsCorner               ; 0x4F OW
|07DACA| dw TileBehavior_Liftable                         ; 0x50 OW
|07DACC| dw TileBehavior_Liftable                         ; 0x51 OW
|07DACE| dw TileBehavior_Liftable                         ; 0x52 OW
|07DAD0| dw TileBehavior_Liftable                         ; 0x53 OW
|07DAD2| dw TileBehavior_Liftable                         ; 0x54 OW
|07DAD4| dw TileBehavior_Liftable                         ; 0x55 OW
|07DAD6| dw TileBehavior_Liftable                         ; 0x56 OW
|07DAD8| dw TileBehavior_BonkRocks                        ; 0x57 OW
|07DADA| dw TileBehavior_Chest                            ; 0x58 OW
|07DADC| dw TileBehavior_Chest                            ; 0x59 OW
|07DADE| dw TileBehavior_Chest                            ; 0x5A OW
|07DAE0| dw TileBehavior_Chest                            ; 0x5B OW
|07DAE2| dw TileBehavior_Chest                            ; 0x5C OW
|07DAE4| dw TileBehavior_Chest                            ; 0x5D OW
|07DAE6| dw TileBehavior_NothingOW                        ; 0x5E OW
|07DAE8| dw TileBehavior_NothingOW                        ; 0x5F OW
|07DAEA| dw TileBehavior_NothingOW                        ; 0x60 OW
|07DAEC| dw TileBehavior_NothingOW                        ; 0x61 OW
|07DAEE| dw TileBehavior_NothingOW                        ; 0x62 OW
|07DAF0| dw TileBehavior_MinigameChest                    ; 0x63 OW
|07DAF2| dw TileBehavior_NothingOW                        ; 0x64 OW
|07DAF4| dw TileBehavior_NothingOW                        ; 0x65 OW
|07DAF6| dw TileBehavior_NothingOW                        ; 0x66 OW
|07DAF8| dw TileBehavior_CrystalPeg_Up                    ; 0x67 OW
|07DAFA| dw TileBehavior_Conveyor_Upwards                 ; 0x68 OW
|07DAFC| dw TileBehavior_Conveyor_Downwards               ; 0x69 OW
|07DAFE| dw TileBehavior_Conveyor_Leftwards               ; 0x6A OW
|07DB00| dw TileBehavior_Conveyor_Rightwards              ; 0x6B OW
|07DB02| dw TileBehavior_NothingOW                        ; 0x6C OW
|07DB04| dw TileBehavior_NothingOW                        ; 0x6D OW
|07DB06| dw TileBehavior_NothingOW                        ; 0x6E OW
|07DB08| dw TileBehavior_NothingOW                        ; 0x6F OW
|07DB0A| dw TileBehavior_ManipulablyReplaced              ; 0x70 OW
|07DB0C| dw TileBehavior_ManipulablyReplaced              ; 0x71 OW
|07DB0E| dw TileBehavior_ManipulablyReplaced              ; 0x72 OW
|07DB10| dw TileBehavior_ManipulablyReplaced              ; 0x73 OW
|07DB12| dw TileBehavior_ManipulablyReplaced              ; 0x74 OW
|07DB14| dw TileBehavior_ManipulablyReplaced              ; 0x75 OW
|07DB16| dw TileBehavior_ManipulablyReplaced              ; 0x76 OW
|07DB18| dw TileBehavior_ManipulablyReplaced              ; 0x77 OW
|07DB1A| dw TileBehavior_ManipulablyReplaced              ; 0x78 OW
|07DB1C| dw TileBehavior_ManipulablyReplaced              ; 0x79 OW
|07DB1E| dw TileBehavior_ManipulablyReplaced              ; 0x7A OW
|07DB20| dw TileBehavior_ManipulablyReplaced              ; 0x7B OW
|07DB22| dw TileBehavior_ManipulablyReplaced              ; 0x7C OW
|07DB24| dw TileBehavior_ManipulablyReplaced              ; 0x7D OW
|07DB26| dw TileBehavior_ManipulablyReplaced              ; 0x7E OW
|07DB28| dw TileBehavior_ManipulablyReplaced              ; 0x7F OW
|07DB2A| dw TileBehavior_Door                             ; 0x80 OW
|07DB2C| dw TileBehavior_Door                             ; 0x81 OW
|07DB2E| dw TileBehavior_ShutterDoor                      ; 0x82 OW
|07DB30| dw TileBehavior_ShutterDoor                      ; 0x83 OW
|07DB32| dw TileBehavior_Door                             ; 0x84 OW
|07DB34| dw TileBehavior_Door                             ; 0x85 OW
|07DB36| dw TileBehavior_Door                             ; 0x86 OW
|07DB38| dw TileBehavior_Door                             ; 0x87 OW
|07DB3A| dw TileBehavior_Door                             ; 0x88 OW
|07DB3C| dw TileBehavior_Door                             ; 0x89 OW
|07DB3E| dw TileBehavior_Door                             ; 0x8A OW
|07DB40| dw TileBehavior_Door                             ; 0x8B OW
|07DB42| dw TileBehavior_Door                             ; 0x8C OW
|07DB44| dw TileBehavior_Door                             ; 0x8D OW
|07DB46| dw TileBehavior_Entrance                         ; 0x8E OW
|07DB48| dw TileBehavior_Entrance                         ; 0x8F OW
|07DB4A| dw TileBehavior_LayerToggleShutterDoor           ; 0x90 OW
|07DB4C| dw TileBehavior_LayerToggleShutterDoor           ; 0x91 OW
|07DB4E| dw TileBehavior_LayerToggleShutterDoor           ; 0x92 OW
|07DB50| dw TileBehavior_LayerToggleShutterDoor           ; 0x93 OW
|07DB52| dw TileBehavior_LayerToggleShutterDoor           ; 0x94 OW
|07DB54| dw TileBehavior_LayerToggleShutterDoor           ; 0x95 OW
|07DB56| dw TileBehavior_LayerToggleShutterDoor           ; 0x96 OW
|07DB58| dw TileBehavior_LayerToggleShutterDoor           ; 0x97 OW
|07DB5A| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x98 OW
|07DB5C| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x99 OW
|07DB5E| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9A OW
|07DB60| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9B OW
|07DB62| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9C OW
|07DB64| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9D OW
|07DB66| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9E OW
|07DB68| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0x9F OW
|07DB6A| dw TileBehavior_DungeonToggleManualDoor          ; 0xA0 OW
|07DB6C| dw TileBehavior_DungeonToggleManualDoor          ; 0xA1 OW
|07DB6E| dw TileBehavior_DungeonToggleShutterDoor         ; 0xA2 OW
|07DB70| dw TileBehavior_DungeonToggleShutterDoor         ; 0xA3 OW
|07DB72| dw TileBehavior_DungeonToggleManualDoor          ; 0xA4 OW
|07DB74| dw TileBehavior_DungeonToggleManualDoor          ; 0xA5 OW
|07DB76| dw TileBehavior_NothingOW                        ; 0xA6 OW
|07DB78| dw TileBehavior_NothingOW                        ; 0xA7 OW
|07DB7A| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA8 OW
|07DB7C| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xA9 OW
|07DB7E| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAA OW
|07DB80| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAB OW
|07DB82| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAC OW
|07DB84| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAD OW
|07DB86| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAE OW
|07DB88| dw TileBehavior_LayerAndDungeonToggleShutterDoor ; 0xAF OW
|07DB8A| dw TileBehavior_Pit                              ; 0xB0 OW
|07DB8C| dw TileBehavior_Pit                              ; 0xB1 OW
|07DB8E| dw TileBehavior_Pit                              ; 0xB2 OW
|07DB90| dw TileBehavior_Pit                              ; 0xB3 OW
|07DB92| dw TileBehavior_Pit                              ; 0xB4 OW
|07DB94| dw TileBehavior_Pit                              ; 0xB5 OW
|07DB96| dw TileBehavior_Pit                              ; 0xB6 OW
|07DB98| dw TileBehavior_Pit                              ; 0xB7 OW
|07DB9A| dw TileBehavior_Pit                              ; 0xB8 OW
|07DB9C| dw TileBehavior_Pit                              ; 0xB9 OW
|07DB9E| dw TileBehavior_Pit                              ; 0xBA OW
|07DBA0| dw TileBehavior_Pit                              ; 0xBB OW
|07DBA2| dw TileBehavior_Pit                              ; 0xBC OW
|07DBA4| dw TileBehavior_Pit                              ; 0xBD OW
|07DBA6| dw TileBehavior_NothingOW                        ; 0xBE OW
|07DBA8| dw TileBehavior_NothingOW                        ; 0xBF OW
|07DBAA| dw TileBehavior_LightableTorch                   ; 0xC0 OW
|07DBAC| dw TileBehavior_LightableTorch                   ; 0xC1 OW
|07DBAE| dw TileBehavior_LightableTorch                   ; 0xC2 OW
|07DBB0| dw TileBehavior_LightableTorch                   ; 0xC3 OW
|07DBB2| dw TileBehavior_LightableTorch                   ; 0xC4 OW
|07DBB4| dw TileBehavior_LightableTorch                   ; 0xC5 OW
|07DBB6| dw TileBehavior_LightableTorch                   ; 0xC6 OW
|07DBB8| dw TileBehavior_LightableTorch                   ; 0xC7 OW
|07DBBA| dw TileBehavior_LightableTorch                   ; 0xC8 OW
|07DBBC| dw TileBehavior_LightableTorch                   ; 0xC9 OW
|07DBBE| dw TileBehavior_LightableTorch                   ; 0xCA OW
|07DBC0| dw TileBehavior_LightableTorch                   ; 0xCB OW
|07DBC2| dw TileBehavior_LightableTorch                   ; 0xCC OW
|07DBC4| dw TileBehavior_LightableTorch                   ; 0xCD OW
|07DBC6| dw TileBehavior_LightableTorch                   ; 0xCE OW
|07DBC8| dw TileBehavior_LightableTorch                   ; 0xCF OW
|07DBCA| dw TileBehavior_NothingOW                        ; 0xD0 OW
|07DBCC| dw TileBehavior_NothingOW                        ; 0xD1 OW
|07DBCE| dw TileBehavior_NothingOW                        ; 0xD2 OW
|07DBD0| dw TileBehavior_NothingOW                        ; 0xD3 OW
|07DBD2| dw TileBehavior_NothingOW                        ; 0xD4 OW
|07DBD4| dw TileBehavior_NothingOW                        ; 0xD5 OW
|07DBD6| dw TileBehavior_NothingOW                        ; 0xD6 OW
|07DBD8| dw TileBehavior_NothingOW                        ; 0xD7 OW
|07DBDA| dw TileBehavior_NothingOW                        ; 0xD8 OW
|07DBDC| dw TileBehavior_NothingOW                        ; 0xD9 OW
|07DBDE| dw TileBehavior_NothingOW                        ; 0xDA OW
|07DBE0| dw TileBehavior_NothingOW                        ; 0xDB OW
|07DBE2| dw TileBehavior_NothingOW                        ; 0xDC OW
|07DBE4| dw TileBehavior_NothingOW                        ; 0xDD OW
|07DBE6| dw TileBehavior_NothingOW                        ; 0xDE OW
|07DBE8| dw TileBehavior_NothingOW                        ; 0xDF OW
|07DBEA| dw TileBehavior_NothingOW                        ; 0xE0 OW
|07DBEC| dw TileBehavior_NothingOW                        ; 0xE1 OW
|07DBEE| dw TileBehavior_NothingOW                        ; 0xE2 OW
|07DBF0| dw TileBehavior_NothingOW                        ; 0xE3 OW
|07DBF2| dw TileBehavior_NothingOW                        ; 0xE4 OW
|07DBF4| dw TileBehavior_NothingOW                        ; 0xE5 OW
|07DBF6| dw TileBehavior_NothingOW                        ; 0xE6 OW
|07DBF8| dw TileBehavior_NothingOW                        ; 0xE7 OW
|07DBFA| dw TileBehavior_NothingOW                        ; 0xE8 OW
|07DBFC| dw TileBehavior_NothingOW                        ; 0xE9 OW
|07DBFE| dw TileBehavior_NothingOW                        ; 0xEA OW
|07DC00| dw TileBehavior_NothingOW                        ; 0xEB OW
|07DC02| dw TileBehavior_NothingOW                        ; 0xEC OW
|07DC04| dw TileBehavior_NothingOW                        ; 0xED OW
|07DC06| dw TileBehavior_NothingOW                        ; 0xEE OW
|07DC08| dw TileBehavior_NothingOW                        ; 0xEF OW
|07DC0A| dw TileBehavior_FlaggableDoor                    ; 0xF0 OW
|07DC0C| dw TileBehavior_FlaggableDoor                    ; 0xF1 OW
|07DC0E| dw TileBehavior_FlaggableDoor                    ; 0xF2 OW
|07DC10| dw TileBehavior_FlaggableDoor                    ; 0xF3 OW
|07DC12| dw TileBehavior_FlaggableDoor                    ; 0xF4 OW
|07DC14| dw TileBehavior_FlaggableDoor                    ; 0xF5 OW
|07DC16| dw TileBehavior_FlaggableDoor                    ; 0xF6 OW
|07DC18| dw TileBehavior_FlaggableDoor                    ; 0xF7 OW
|07DC1A| dw TileBehavior_FlaggableDoor                    ; 0xF8 OW
|07DC1C| dw TileBehavior_FlaggableDoor                    ; 0xF9 OW
|07DC1E| dw TileBehavior_FlaggableDoor                    ; 0xFA OW
|07DC20| dw TileBehavior_FlaggableDoor                    ; 0xFB OW
|07DC22| dw TileBehavior_FlaggableDoor                    ; 0xFC OW
|07DC24| dw TileBehavior_FlaggableDoor                    ; 0xFD OW
|07DC26| dw TileBehavior_FlaggableDoor                    ; 0xFE OW
|07DC28| dw TileBehavior_FlaggableDoor                    ; 0xFF OW

endpool

;---------------------------------------------------------------------------------------------------

ExecuteTileDetection_overworld:
|07DC2A| JSL GetOverworldTileType

.from_item
|07DC2E| REP #$30

|07DC30| PHA

|07DC31| LDA.w $037F
|07DC34| AND.w #$00FF
|07DC37| BEQ .not_oob

|07DC39| PLA
|07DC3A| LDA.w #$0000

|07DC3D| BRA .oob_mode

.not_oob
|07DC3F| PLA

.oob_mode
|07DC40| AND.w #$00FF
|07DC43| STA.b $06

|07DC45| ASL A
|07DC46| TAX

|07DC47| JMP.w (.vectors,X)

;===================================================================================================

#TileBehavior_HandleItemAndExecute:
|07DC4A| JSL HandleItemTileAction

|07DC4E| BRA .from_item

;===================================================================================================

TileBehavior_StandardCollision:
|07DC50| LDA.b $0A
|07DC52| TSB.b $0E

;===================================================================================================

TileBehavior_Nothing:
|07DC54| RTS

;===================================================================================================

TileBehavior_SlopeMasks:
|07DC55| dw $0004 ; 00000100
|07DC57| dw $0000 ; 00000000
|07DC59| dw $0006 ; 00000110
|07DC5B| dw $0002 ; 00000010

;===================================================================================================

TileBehavior_SlopeOuter:
|07DC5D| LDA.b $0A
|07DC5F| TSB.b $38

;===================================================================================================

TileBehavior_Slope:
|07DC61| LDA.b $0A
|07DC63| TSB.b $0C

|07DC65| LDA.b $06
|07DC67| AND.w #$0003
|07DC6A| ASL A
|07DC6B| TAY

|07DC6C| LDA.w TileBehavior_SlopeMasks,Y
|07DC6F| STA.b $6E

|07DC71| RTS

;===================================================================================================

TileBehavior_NorthSingleLayerStairs:
|07DC72| LDA.b $06
|07DC74| STA.b $76

|07DC76| LDA.b $0A
|07DC78| TSB.w $02C0

|07DC7B| BRA TileBehavior_ManualStairs

;===================================================================================================

TileBehavior_NorthSwapLayerStairs:
|07DC7D| LDA.b $06
|07DC7F| STA.b $76

|07DC81| LDA.b $0A
|07DC83| TSB.w $02C0

;===================================================================================================

TileBehavior_ManualStairs:
|07DC86| LDA.b $0A
|07DC88| TSB.b $58

|07DC8A| RTS

;===================================================================================================

TileBehavior_Pit:
|07DC8B| LDA.w $02F5
|07DC8E| AND.w #$00FF
|07DC91| BNE .exit

|07DC93| LDA.b $0A
|07DC95| TSB.b $59

.exit
|07DC97| RTS

;===================================================================================================

TileBehavior_OverlayMask_0C:
|07DC98| LDA.b $0A
|07DC9A| TSB.w $0320

|07DC9D| RTS

;===================================================================================================

TileBehavior_GanonIce:
|07DC9E| LDA.b $0A
|07DCA0| TSB.w $0348

|07DCA3| RTS

;===================================================================================================

TileBehavior_PalaceIce:
|07DCA4| LDA.b $0A

|07DCA6| ASL A
|07DCA7| ASL A
|07DCA8| ASL A
|07DCA9| ASL A

|07DCAA| TSB.w $0348

|07DCAD| RTS

;===================================================================================================

TileBehavior_LightableTorch:
|07DCAE| LDA.b $0A
|07DCB0| TSB.b $0E
|07DCB2| TSB.w $02F6

|07DCB5| RTS

;===================================================================================================

TileBehavior_DeepWater:
|07DCB6| LDA.b $0A
|07DCB8| TSB.w $0341

|07DCBB| RTS

;===================================================================================================

TileBehavior_ShortWaterLadder:
|07DCBC| LDA.b $0A
|07DCBE| TSB.w $0343

|07DCC1| RTS

;===================================================================================================

TileBehavior_OverlayMask_1C:
|07DCC2| LDA.b $0A
|07DCC4| TSB.w $034C

|07DCC7| RTS

;===================================================================================================

TileBehavior_LayerToggleShutterDoor:
|07DCC8| LDA.b $EF
|07DCCA| AND.w #$FF00
|07DCCD| ORA.w #$0001
|07DCD0| STA.b $EF

|07DCD2| BRA TileBehavior_ShutterDoor

;===================================================================================================

TileBehavior_LayerAndDungeonToggleShutterDoor:
|07DCD4| LDA.b $EF
|07DCD6| AND.w #$FF00
|07DCD9| ORA.w #$0003
|07DCDC| STA.b $EF

|07DCDE| BRA TileBehavior_ShutterDoor

;===================================================================================================

TileBehavior_DungeonToggleShutterDoor:
|07DCE0| LDA.b $EF
|07DCE2| AND.w #$FF00
|07DCE5| ORA.w #$0002
|07DCE8| STA.b $EF

;===================================================================================================

TileBehavior_ShutterDoor:
|07DCEA| LDA.b $0A
|07DCEC| ASL A
|07DCED| ASL A
|07DCEE| ASL A
|07DCEF| ASL A
|07DCF0| TSB.b $0E

|07DCF2| LDA.b $0A
|07DCF4| XBA
|07DCF5| TSB.b $0E

|07DCF7| LDA.b $06
|07DCF9| AND.w #$0001
|07DCFC| ASL A
|07DCFD| STA.b $62

|07DCFF| RTS

;===================================================================================================

TileBehavior_DungeonToggleManualDoor:
|07DD00| LDA.b $EF
|07DD02| AND.w #$FF00
|07DD05| ORA.w #$0002
|07DD08| STA.b $EF

;===================================================================================================

TileBehavior_Door:
|07DD0A| LDA.b $0A
|07DD0C| ASL A
|07DD0D| ASL A
|07DD0E| ASL A
|07DD0F| ASL A
|07DD10| TSB.b $0E

|07DD12| LDA.b $06
|07DD14| AND.w #$0001
|07DD17| ASL A
|07DD18| STA.b $62

|07DD1A| RTS

;===================================================================================================

TileBehavior_ShallowWater:
|07DD1B| LDA.b $0A
|07DD1D| TSB.w $0359

|07DD20| RTS

;===================================================================================================

pool TileBehavior_ManipulablyReplaced

.bitmask
|07DD21| dw $0001 ; 0000000000000001
|07DD23| dw $0002 ; 0000000000000010
|07DD25| dw $0004 ; 0000000000000100
|07DD27| dw $0008 ; 0000000000001000
|07DD29| dw $0010 ; 0000000000010000
|07DD2B| dw $0020 ; 0000000000100000
|07DD2D| dw $0040 ; 0000000001000000
|07DD2F| dw $0080 ; 0000000010000000
|07DD31| dw $0100 ; 0000000100000000
|07DD33| dw $0200 ; 0000001000000000
|07DD35| dw $0400 ; 0000010000000000
|07DD37| dw $0800 ; 0000100000000000
|07DD39| dw $1000 ; 0001000000000000
|07DD3B| dw $2000 ; 0010000000000000
|07DD3D| dw $4000 ; 0100000000000000
|07DD3F| dw $8000 ; 1000000000000000

endpool

;---------------------------------------------------------------------------------------------------

TileBehavior_ManipulablyReplaced:
|07DD41| LDA.b $0A
|07DD43| AND.w #$0002
|07DD46| BEQ .no_bitmask

|07DD48| LDA.b $06
|07DD4A| AND.w #$000F
|07DD4D| ASL A
|07DD4E| TAY

|07DD4F| LDA.w .bitmask,Y
|07DD52| TSB.b $5F

.no_bitmask
|07DD54| LDA.b $0A
|07DD56| TSB.b $0E

|07DD58| JSR TileBehavior_FlagManipulable

|07DD5B| RTS

;===================================================================================================

TileBehavior_UnusedDeepWater:
|07DD5C| LDA.b $06
|07DD5E| STA.b $76

|07DD60| LDA.b $0A
|07DD62| ASL A
|07DD63| ASL A
|07DD64| ASL A
|07DD65| ASL A
|07DD66| TSB.w $0341

|07DD69| RTS

;===================================================================================================

TileBehavior_Chest:
|07DD6A| JSR TileBehavior_FlagManipulable

|07DD6D| LDA.b $06
|07DD6F| STA.b $76

|07DD71| SEC
|07DD72| SBC.w #$0058
|07DD75| ASL A
|07DD76| TAX

|07DD77| LDA.w $06E0,X
|07DD7A| CMP.w #$8000
|07DD7D| BCC TileBehavior_FinishChest

|07DD7F| LDA.b $0A
|07DD81| TSB.b $0E
|07DD83| ASL A
|07DD84| ASL A
|07DD85| ASL A
|07DD86| ASL A
|07DD87| TSB.w $02E7
|07DD8A| AND.w #$0020
|07DD8D| BEQ .exit

|07DD8F| LDA.b $06
|07DD91| STA.w $02EA

.exit
|07DD94| RTS

;---------------------------------------------------------------------------------------------------

TileBehavior_FinishChest:
|07DD95| LDA.b $0A
|07DD97| TSB.w $02E5
|07DD9A| TSB.b $0E

|07DD9C| RTS

;===================================================================================================

TileBehavior_SouthSingleLayerStairs:
|07DD9D| LDA.b $06
|07DD9F| BRA TileBehavior_SouthAutoStairs

;===================================================================================================

TileBehavior_SouthSwapLayerStairs:
|07DDA1| LDA.b $06

;---------------------------------------------------------------------------------------------------

TileBehavior_SouthAutoStairs:
|07DDA3| STA.b $76

|07DDA5| LDA.b $0A
|07DDA7| TSB.b $58

|07DDA9| ASL A
|07DDAA| ASL A
|07DDAB| ASL A
|07DDAC| ASL A
|07DDAD| TSB.w $02C0

|07DDB0| RTS

;===================================================================================================

TileBehavior_Spike:
|07DDB1| LDA.w $0FFC
|07DDB4| BNE .no_damage

|07DDB6| LDA.w $0403
|07DDB9| AND.w #$0080
|07DDBC| BEQ .damage

.no_damage
|07DDBE| LDA.b $0A
|07DDC0| TSB.b $0E

|07DDC2| RTS

;---------------------------------------------------------------------------------------------------

.damage
|07DDC3| LDA.b $0A
|07DDC5| XBA
|07DDC6| TSB.w $02E7

|07DDC9| RTS

;===================================================================================================

TileBehavior_SpikeFloor:
|07DDCA| LDA.w $0FFC
|07DDCD| BNE .no_damage

|07DDCF| LDA.w $0403
|07DDD2| AND.w #$0080
|07DDD5| BNE .no_damage

|07DDD7| LDA.b $0A
|07DDD9| ASL A
|07DDDA| ASL A
|07DDDB| ASL A
|07DDDC| ASL A
|07DDDD| TSB.w $02EE

.no_damage
|07DDE0| RTS

;===================================================================================================

TileBehavior_Hookshottables:
|07DDE1| LDA.b $0A
|07DDE3| TSB.b $0E

;===================================================================================================

TileBehavior_FlagManipulable:
|07DDE5| LDA.b $0A
|07DDE7| TSB.w $02F6

|07DDEA| RTS

;===================================================================================================

TileBehavior_FlaggableDoor:
|07DDEB| LDA.b $0A
|07DDED| TSB.b $0E

|07DDEF| ASL A
|07DDF0| ASL A
|07DDF1| ASL A
|07DDF2| ASL A
|07DDF3| TSB.w $02F6

|07DDF6| RTS

;===================================================================================================

TileBehavior_RupeeTile:
|07DDF7| LDX.b $BD

|07DDF9| LDA.l $7F2040,X
|07DDFD| AND.w #$00FF
|07DE00| CMP.w #$0060 ; TILETYPE 60
|07DE03| BNE .no_rupees

|07DE05| LDA.b $0A
|07DE07| XBA
|07DE08| TSB.w $02F6

|07DE0B| RTS

;---------------------------------------------------------------------------------------------------

.no_rupees
|07DE0C| LDA.b $0A
|07DE0E| XBA

|07DE0F| ASL A
|07DE10| ASL A
|07DE11| ASL A
|07DE12| ASL A
|07DE13| TSB.w $02F6

|07DE16| RTS

;===================================================================================================

TileBehavior_CrystalPeg_Up:
|07DE17| LDA.b $0A
|07DE19| TSB.b $0E
|07DE1B| TSB.w $02F6

|07DE1E| LDA.b $0A
|07DE20| XBA

|07DE21| ASL A
|07DE22| ASL A
|07DE23| ASL A
|07DE24| ASL A

|07DE25| TSB.w $02E7

|07DE28| RTS

;===================================================================================================

TileBehavior_Conveyor_Upwards:
|07DE29| LDA.b $0A

|07DE2B| BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Downwards:
|07DE2D| LDA.b $0A
|07DE2F| ASL A
|07DE30| ASL A
|07DE31| ASL A
|07DE32| ASL A

|07DE33| BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Leftwards:
|07DE35| LDA.b $0A
|07DE37| XBA

|07DE38| BRA TileBehavior_Conveyor

;===================================================================================================

TileBehavior_Conveyor_Rightwards:
|07DE3A| LDA.b $0A
|07DE3C| XBA

|07DE3D| ASL A
|07DE3E| ASL A
|07DE3F| ASL A
|07DE40| ASL A

;===================================================================================================

TileBehavior_Conveyor:
|07DE41| TSB.w $03F1

|07DE44| RTS

;===================================================================================================

TileBehavior_MinigameChest:
|07DE45| JSR TileBehavior_FlagManipulable

|07DE48| LDA.b $06
|07DE4A| STA.b $76

|07DE4C| BRL TileBehavior_FinishChest

;===================================================================================================

TileBehavior_Entrance:
|07DE4F| JSR TileBehavior_Door

|07DE52| LDA.b $0A
|07DE54| XBA
|07DE55| TSB.w $02EE

|07DE58| STZ.b $62

|07DE5A| RTS

;===================================================================================================

TileBehavior_NothingOW:
|07DE5B| LDA.b $0A
|07DE5D| TSB.w $0343

|07DE60| RTS

;===================================================================================================

TileBehavior_ThickGrass:
|07DE61| LDA.b $0A
|07DE63| TSB.w $0357

|07DE66| RTS

;===================================================================================================

TileBehavior_DiggableGround:
|07DE67| LDA.b $0A
|07DE69| TSB.w $035B
|07DE6C| TSB.w $0343

|07DE6F| RTS

;===================================================================================================

pool TileBehavior_Liftable

.id_matcher
|07DE70| dw $0054 ; Hint tile/Sign
|07DE72| dw $0052 ; Gray rock
|07DE74| dw $0050 ; Green bush
|07DE76| dw $0051 ; Dark bush
|07DE78| dw $0053 ; Black rock
|07DE7A| dw $0055 ; Big gray rock
|07DE7C| dw $0056 ; Big black rock

endpool

;---------------------------------------------------------------------------------------------------

TileBehavior_Liftable:
|07DE7E| LDX.w #$000C

.check_next
|07DE81| LDA.b $06
|07DE83| CMP.w .id_matcher,X
|07DE86| BNE .not_match

;---------------------------------------------------------------------------------------------------

|07DE88| CMP.w #$0050
|07DE8B| BEQ .is_bush

|07DE8D| CMP.w #$0051
|07DE90| BNE .is_not_bush

.is_bush
|07DE92| LDA.b $0A
|07DE94| XBA

|07DE95| ASL A
|07DE96| ASL A
|07DE97| ASL A
|07DE98| ASL A
|07DE99| TSB.w $02EE

.is_not_bush
|07DE9C| LDA.b $0A
|07DE9E| TSB.w $0366

|07DEA1| STX.w $036A

|07DEA4| JSR TileBehavior_Hookshottables

|07DEA7| RTS

;---------------------------------------------------------------------------------------------------

.not_match
|07DEA8| DEX
|07DEA9| DEX
|07DEAA| BPL .check_next

|07DEAC| RTS

;===================================================================================================

TileBehavior_Ledge_South:
|07DEAD| LDA.b $06
|07DEAF| STA.b $76

|07DEB1| LDA.b $0A
|07DEB3| ASL A
|07DEB4| ASL A
|07DEB5| ASL A
|07DEB6| ASL A
|07DEB7| TSB.w $036D

|07DEBA| RTS

;===================================================================================================

TileBehavior_Ledge_North:
|07DEBB| LDA.b $06
|07DEBD| STA.b $76

|07DEBF| LDA.b $0A
|07DEC1| TSB.w $036D

|07DEC4| RTS

;===================================================================================================

TileBehavior_Ledge_EastWest:
|07DEC5| LDA.b $06
|07DEC7| STA.b $76

|07DEC9| LDA.b $0A
|07DECB| TSB.w $036E

|07DECE| RTS

;===================================================================================================

TileBehavior_Ledge_NorthDiagonal:
|07DECF| LDA.b $06
|07DED1| STA.b $76

|07DED3| LDA.b $0A
|07DED5| ASL A
|07DED6| ASL A
|07DED7| ASL A
|07DED8| ASL A
|07DED9| TSB.w $036E

|07DEDC| RTS

;===================================================================================================

TileBehavior_Ledge_SouthDiagonal:
|07DEDD| LDA.b $06
|07DEDF| STA.b $76

|07DEE1| LDA.b $0A
|07DEE3| TSB.w $036F

|07DEE6| RTS

;===================================================================================================

TileBehavior_UnusedCornerType:
|07DEE7| LDA.b $06
|07DEE9| STA.b $76

|07DEEB| LDA.b $0A
|07DEED| TSB.w $0370

|07DEF0| RTS

;===================================================================================================

TileBehavior_EasternRuinsCorner:
|07DEF1| LDA.b $06
|07DEF3| STA.b $76

|07DEF5| LDA.b $0A
|07DEF7| ASL A
|07DEF8| ASL A
|07DEF9| ASL A
|07DEFA| ASL A
|07DEFB| TSB.w $0370

|07DEFE| RTS

;===================================================================================================

TileBehavior_Warp:
|07DEFF| LDA.b $0A
|07DF01| ASL A
|07DF02| ASL A
|07DF03| ASL A
|07DF04| ASL A
|07DF05| TSB.w $0357

|07DF08| RTS

;===================================================================================================

TileBehavior_GraveStone:
|07DF09| LDA.b $0A
|07DF0B| TSB.w $02E7
|07DF0E| TSB.b $0E

|07DF10| RTS

;===================================================================================================

TileBehavior_HylianPlaque:
|07DF11| LDA.b $0A
|07DF13| TSB.w $02EE
|07DF16| TSB.b $0E

|07DF18| RTS

;===================================================================================================

TileBehavior_BonkRocks:
|07DF19| LDA.b $0A
|07DF1B| TSB.b $0E

|07DF1D| XBA
|07DF1E| ASL A
|07DF1F| ASL A
|07DF20| ASL A
|07DF21| ASL A
|07DF22| TSB.w $02EE

|07DF25| RTS

;===================================================================================================

pool PushBlock_GetGeneralizedTileInteractionOfTarget

.generic_type
|07DF26| db $00, $01, $02, $03, $02, $00, $00, $00
|07DF2E| db $00, $01, $00, $01, $00, $00, $00, $00
|07DF36| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF3E| db $01, $01, $01, $01, $00, $01, $01, $01
|07DF46| db $00, $01, $01, $00, $00, $00, $01, $01
|07DF4E| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF56| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF5E| db $01, $01, $00, $00, $01, $01, $01, $01
|07DF66| db $00, $01, $01, $01, $01, $01, $01, $01
|07DF6E| db $00, $01, $00, $01, $01, $01, $01, $01
|07DF76| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF7E| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF86| db $00, $00, $00, $01, $00, $01, $01, $01
|07DF8E| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF96| db $01, $01, $01, $01, $01, $01, $01, $01
|07DF9E| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFA6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFAE| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFB6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFBE| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFC6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFCE| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFD6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFDE| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFE6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFEE| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFF6| db $01, $01, $01, $01, $01, $01, $01, $01
|07DFFE| db $01, $01, $01, $01, $01, $01, $01, $01
|07E006| db $01, $01, $01, $01, $01, $01, $01, $01
|07E00E| db $01, $01, $01, $01, $01, $01, $01, $01
|07E016| db $01, $01, $01, $01, $01, $01, $01, $01
|07E01E| db $01, $01, $01, $01, $01, $01, $01, $01

endpool

;---------------------------------------------------------------------------------------------------

PushBlock_GetGeneralizedTileInteractionOfTarget:
|07E026| LDA.b $00
|07E028| AND.w #$FFF8

|07E02B| ASL A
|07E02C| ASL A
|07E02D| ASL A

|07E02E| STA.b $06

|07E030| LDA.b $02
|07E032| AND.w #$003F
|07E035| CLC
|07E036| ADC.b $06

|07E038| LDX.b $EE
|07E03A| BEQ .upper_layer

|07E03C| CLC
|07E03D| ADC.w #$1000

;---------------------------------------------------------------------------------------------------

.upper_layer
|07E040| REP #$10

|07E042| TAX

|07E043| LDA.l $7F2000,X
|07E047| AND.w #$00FF
|07E04A| TAX

|07E04B| LDA.w .generic_type,X
|07E04E| AND.w #$00FF

|07E051| RTS

;===================================================================================================

DifferenceFor6BLowNibble:
|07E052| db $00, $01, $02, $03, $04, $05, $06, $07 ; ◥
|07E05A| db $07, $06, $05, $04, $03, $02, $01, $00 ; ◤
|07E062| db $07, $06, $05, $04, $03, $02, $01, $00 ; ◢
|07E06A| db $00, $01, $02, $03, $04, $05, $06, $07 ; ◣

FlagFor6BLowNibble:
|07E072| db $08 ; ◥
|07E073| db $04 ; ◤
|07E074| db $02 ; ◢
|07E075| db $01 ; ◣

;===================================================================================================

FlagMovingIntoSlopes_Vertical:
|07E076| LDA.b $51
|07E078| AND.b #$07
|07E07A| STA.b $00

|07E07C| LDY.b $22

|07E07E| LDA.b $0C
|07E080| AND.b #$04
|07E082| BEQ .no_detection_on_north_east

|07E084| DEY

.no_detection_on_north_east
|07E085| LDA.b $6E
|07E087| ASL A
|07E088| ASL A
|07E089| STA.b $01

|07E08B| TYA
|07E08C| AND.b #$07
|07E08E| CLC
|07E08F| ADC.b $01
|07E091| TAX

|07E092| LDA.b $38
|07E094| AND.b #$05
|07E096| BEQ .no_detection_on_east

|07E098| LDA.b $51
|07E09A| AND.b #$07
|07E09C| STA.b $02

|07E09E| LDA.b $6E
|07E0A0| AND.b #$02
|07E0A2| BNE .detection_on_south_west

|07E0A4| LDA.b #$08
|07E0A6| SEC
|07E0A7| SBC.b $02

|07E0A9| BRA .continue

.detection_on_south_west
|07E0AB| LDA.b $02
|07E0AD| CLC
|07E0AE| ADC.b #$08

.continue
|07E0B0| STA.b $02

|07E0B2| LDA.w DifferenceFor6BLowNibble,X
|07E0B5| SEC
|07E0B6| SBC.b $02

|07E0B8| LDY.b $30
|07E0BA| BEQ .exit
|07E0BC| BPL .positive_y_velocity_a

|07E0BE| EOR.b #$FF
|07E0C0| INC A

.positive_y_velocity_a
|07E0C1| STA.b $00

|07E0C3| BRA .continue_from_negative_a

;---------------------------------------------------------------------------------------------------

.no_detection_on_east
|07E0C5| LDA.w DifferenceFor6BLowNibble,X
|07E0C8| SEC
|07E0C9| SBC.b $00
|07E0CB| STA.b $00

.continue_from_negative_a
|07E0CD| LDA.b $30
|07E0CF| BEQ .exit
|07E0D1| BPL .positive_y_velocity_b

|07E0D3| LDA.b $00
|07E0D5| BEQ .exit
|07E0D7| BMI .exit

|07E0D9| REP #$20

|07E0DB| AND.w #$00FF
|07E0DE| CLC
|07E0DF| ADC.b $20
|07E0E1| STA.b $20

|07E0E3| SEP #$20

|07E0E5| LDA.b #$08

|07E0E7| BRA .continue_from_negative_b

;---------------------------------------------------------------------------------------------------

.positive_y_velocity_b
|07E0E9| LDA.b $00
|07E0EB| BPL .exit

|07E0ED| REP #$20

|07E0EF| AND.w #$00FF
|07E0F2| ORA.w #$FF00
|07E0F5| CLC
|07E0F6| ADC.b $20
|07E0F8| STA.b $20

|07E0FA| SEP #$20

|07E0FC| LDA.b #$04

.continue_from_negative_b
|07E0FE| STA.b $6B

|07E100| LDY.b #$02

|07E102| LDA.b $0C
|07E104| AND.b #$04
|07E106| BNE .detection_on_north_east

|07E108| LDY.b #$03

.detection_on_north_east
|07E10A| LDA.w FlagFor6BLowNibble,Y
|07E10D| ORA.b #$10
|07E10F| TSB.b $6B

.exit
|07E111| RTS

;===================================================================================================

FlagMovingIntoSlopes_Horizontal:
|07E112| LDA.b $22

|07E114| LDY.b $6E
|07E116| CPY.b #$06
|07E118| BNE .strictly_ne_sw

|07E11A| DEC A

.strictly_ne_sw
|07E11B| AND.b #$07
|07E11D| STA.b $00

|07E11F| LDX.b #$00

|07E121| LDA.b $0C
|07E123| AND.b #$04
|07E125| BEQ .no_detection_on_north_east

|07E127| LDX.b #$02

.no_detection_on_north_east
|07E129| LDA.b $6E
|07E12B| ASL A
|07E12C| ASL A
|07E12D| STA.b $01

|07E12F| LDA.b $51,X
|07E131| AND.b #$07
|07E133| CLC
|07E134| ADC.b $01
|07E136| TAX

|07E137| LDA.b $38
|07E139| AND.b #$05
|07E13B| BEQ .no_detection_on_east

|07E13D| LDA.b $22
|07E13F| AND.b #$07

|07E141| LDY.b $6E
|07E143| CPY.b #$04
|07E145| BEQ .dont_adjust_index

|07E147| CPY.b #$06
|07E149| BEQ .dont_adjust_index

|07E14B| XBA
|07E14C| TXA
|07E14D| EOR.b #$07
|07E14F| TAX

|07E150| XBA
|07E151| EOR.b #$FF
|07E153| INC A

|07E154| BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_adjust_index
|07E156| SEC
|07E157| SBC.b #$08
|07E159| EOR.b #$FF
|07E15B| INC A
|07E15C| STA.b $02

|07E15E| LDA.w DifferenceFor6BLowNibble,X
|07E161| SEC
|07E162| SBC.b $02

.continue
|07E164| LDY.b $31
|07E166| BEQ .exit
|07E168| BPL .positive_x_velocity_a

|07E16A| EOR.b #$FF
|07E16C| INC A

.positive_x_velocity_a
|07E16D| STA.b $00

|07E16F| BRA .continue_from_negative_a

;---------------------------------------------------------------------------------------------------

.no_detection_on_east
|07E171| LDA.w DifferenceFor6BLowNibble,X
|07E174| SEC
|07E175| SBC.b $00
|07E177| STA.b $00

.continue_from_negative_a
|07E179| LDA.b $31
|07E17B| BEQ .exit
|07E17D| BPL .positive_x_velocity_b

|07E17F| LDA.b $00
|07E181| BEQ .exit
|07E183| BMI .exit

|07E185| REP #$20

|07E187| AND.w #$00FF
|07E18A| CLC
|07E18B| ADC.b $22
|07E18D| STA.b $22

|07E18F| SEP #$20

|07E191| LDA.b #$02
|07E193| BRA .continue_from_negative_b

;---------------------------------------------------------------------------------------------------

.positive_x_velocity_b
|07E195| LDA.b $00
|07E197| BPL .exit

|07E199| REP #$20

|07E19B| AND.w #$00FF
|07E19E| ORA.w #$FF00
|07E1A1| CLC
|07E1A2| ADC.b $22
|07E1A4| STA.b $22

|07E1A6| SEP #$20

|07E1A8| LDA.b #$01

.continue_from_negative_b
|07E1AA| STA.b $6B

|07E1AC| LDY.b #$00

|07E1AE| LDA.b $6E
|07E1B0| AND.b #$02
|07E1B2| BNE .detection_on_north_east

|07E1B4| LDY.b #$01

.detection_on_north_east
|07E1B6| LDA.w FlagFor6BLowNibble,Y
|07E1B9| ORA.b #$20
|07E1BB| TSB.b $6B

.exit
|07E1BD| RTS

;===================================================================================================

HandleLinkRecoiling:
|07E1BE| STZ.b $67

|07E1C0| LDY.b #$08

|07E1C2| LDA.b $27
|07E1C4| BEQ .no_vertical_recoil
|07E1C6| BMI .negative_vertical_recoil

|07E1C8| LDY.b #$04

.negative_vertical_recoil
|07E1CA| JSR .handle_axis

;---------------------------------------------------------------------------------------------------

.no_vertical_recoil
|07E1CD| LDY.b #$02

|07E1CF| LDA.b $28
|07E1D1| BEQ .no_horizontal_recoil
|07E1D3| BMI .handle_axis

|07E1D5| LDY.b #$01

.handle_axis
|07E1D7| TYA
|07E1D8| ORA.b $67
|07E1DA| STA.b $67
|07E1DC| STA.b $26

;---------------------------------------------------------------------------------------------------

.no_horizontal_recoil
|07E1DE| LDA.b $6B
|07E1E0| AND.b #$0C
|07E1E2| BEQ .dont_invert

|07E1E4| LDA.b $6B
|07E1E6| AND.b #$03
|07E1E8| BEQ .dont_invert

|07E1EA| LDA.b $5D
|07E1EC| CMP.b #$02 ; LINKSTATE 02
|07E1EE| BNE .dont_invert

|07E1F0| LDA.b $28
|07E1F2| EOR.b #$FF
|07E1F4| INC A
|07E1F5| STA.b $28

|07E1F7| LDA.b $27
|07E1F9| EOR.b #$FF
|07E1FB| INC A
|07E1FC| STA.b $27

;---------------------------------------------------------------------------------------------------

.dont_invert
|07E1FE| LDA.b $6C
|07E200| CMP.b #$01
|07E202| BNE .not_in_vertical_door

|07E204| LDA.b $26
|07E206| AND.b #$0C
|07E208| STA.b $26

|07E20A| LDA.b $67
|07E20C| AND.b #$0C
|07E20E| STA.b $67

|07E210| STZ.b $28

;---------------------------------------------------------------------------------------------------

.not_in_vertical_door
|07E212| LDA.b $6C
|07E214| CMP.b #$02
|07E216| BNE .exit

|07E218| LDA.b $26
|07E21A| AND.b #$03
|07E21C| STA.b $26

|07E21E| LDA.b $67
|07E220| AND.b #$03
|07E222| STA.b $67

|07E224| STZ.b $27

.exit
|07E226| RTS

;===================================================================================================

SubVelocityValues:
|07E227| db $18 ; 0x00 - walking on ground
|07E228| db $10 ; 0x01 - walking diagonally
|07E229| db $0A ; 0x02 - walking on stairs
|07E22A| db $18 ; 0x03 - walking on stairs diagonally, but it's impossible to reach
|07E22B| db $10 ; 0x04 - soft slipping
|07E22C| db $08 ; 0x05 - soft slipping diagonally
|07E22D| db $08 ; 0x06 - entering underworld/hard slipping
|07E22E| db $04 ; 0x07 - hard slipping diagonally
|07E22F| db $0C ; 0x08 - pushing statue
|07E230| db $10 ; 0x09 - pushing statue diagonally
|07E231| db $09 ; 0x0A - intraroom stairs
|07E232| db $19 ; 0x0B - 
|07E233| db $14 ; 0x0C - walking with sword out/carrying/sloshing
|07E234| db $0D ; 0x0D - walking with sword out/carrying/sloshing diagonally
|07E235| db $10 ; 0x0E - sword out/carry sloshing
|07E236| db $08 ; 0x0F - sword out/carry sloshing diagonally
|07E237| db $40 ; 0x10 - dashing
|07E238| db $2A ; 0x11 - dashing diagonally
|07E239| db $10 ; 0x12 - pushing block
|07E23A| db $08 ; 0x13 - pushing block diagonally
|07E23B| db $04 ; 0x14 - pulling statue/walking to triforce
|07E23C| db $02 ; 0x15 - pulling statue diagonally
|07E23D| db $30 ; 0x16 - slosh dashing
|07E23E| db $18 ; 0x17 - slosh dashing diagonally
|07E23F| db $20 ; 0x18 - dashing on ice
|07E240| db $15 ; 0x19 - dashing on ice diagonally
|07E241| db $F0 ; 0x1A - 
|07E242| db $00 ; 0x1B - 
|07E243| db $F0 ; 0x1C - 
|07E244| db $01 ; 0x1D - 

;===================================================================================================

HandleLinkVelocity:
|07E245| PHB
|07E246| PHK
|07E247| PLB

|07E248| LDA.b $11
|07E24A| CMP.b #$02
|07E24C| BNE .no_textbox

|07E24E| LDA.b $10
|07E250| CMP.b #$0E
|07E252| BEQ .yes_textbox

.no_textbox
|07E254| LDA.w $0B7B
|07E257| BEQ .can_move

.yes_textbox
|07E259| LDA.b $20
|07E25B| STA.b $00
|07E25D| STA.b $3E

|07E25F| LDA.b $22
|07E261| STA.b $01
|07E263| STA.b $3F

|07E265| LDA.b $21
|07E267| STA.b $02
|07E269| STA.b $40

|07E26B| LDA.b $23
|07E26D| STA.b $03
|07E26F| STA.b $41

|07E271| BRL HandleLinkVelocityAndSandDrag

;---------------------------------------------------------------------------------------------------

.can_move
|07E274| LDA.b $5D
|07E276| CMP.b #$04 ; LINKSTATE 04
|07E278| BEQ .swimming_or_not_dashing

|07E27A| LDA.w $034A
|07E27D| BEQ .not_ice

|07E27F| LDA.w $0372
|07E282| BEQ .swimming_or_not_dashing

|07E284| LDA.b #$18
|07E286| STA.b $00

|07E288| BRA .reset_recoils

;---------------------------------------------------------------------------------------------------

.swimming_or_not_dashing
|07E28A| BRL HandleSwimStrokeAndSubpixels

.not_ice
|07E28D| LDA.w $0372
|07E290| BEQ .no_dash_stuff

|07E292| STZ.b $57

|07E294| LDA.w $02F1
|07E297| CMP.b #$10
|07E299| BCS .no_dash_stuff

|07E29B| BRL DashInPlace

;---------------------------------------------------------------------------------------------------

.no_dash_stuff
|07E29E| LDA.w $0316
|07E2A1| ORA.w $0317
|07E2A4| CMP.b #$0F
|07E2A6| BNE .continue_check_speed

|07E2A8| BRL EXIT_07E402

;---------------------------------------------------------------------------------------------------

.continue_check_speed
|07E2AB| LDA.b $5E
|07E2AD| STA.b $00

|07E2AF| LDA.w $0351
|07E2B2| BEQ .reset_recoils

|07E2B4| LDA.b $5E
|07E2B6| CMP.b #$10
|07E2B8| BNE .not_dash_speed

|07E2BA| LDX.b #$16
|07E2BC| BRA .save_final_speed

;---------------------------------------------------------------------------------------------------

.not_dash_speed
|07E2BE| LDX.b #$0C

|07E2C0| LDA.b $5E
|07E2C2| CMP.b #$0C
|07E2C4| BNE .save_final_speed

|07E2C6| LDX.b #$0E

.save_final_speed
|07E2C8| STX.b $00

;---------------------------------------------------------------------------------------------------

.reset_recoils
|07E2CA| STZ.b $27
|07E2CC| STZ.b $28
|07E2CE| STZ.b $68
|07E2D0| STZ.b $69

|07E2D2| LDX.b #$00

|07E2D4| LDA.b $67
|07E2D6| TAY

|07E2D7| AND.b #$0C
|07E2D9| BEQ .add_nothing

|07E2DB| TYA
|07E2DC| AND.b #$03
|07E2DE| BEQ .add_nothing

|07E2E0| LDX.b #$01

.add_nothing
|07E2E2| TXA
|07E2E3| CLC
|07E2E4| ADC.b $00
|07E2E6| TAX

|07E2E7| LDA.b $5B
|07E2E9| BEQ .not_slipping

|07E2EB| CMP.b #$03
|07E2ED| BNE .load_subvel

|07E2EF| LDA.b $57
|07E2F1| CMP.b #$30
|07E2F3| BCS .stair_drag_too_high

|07E2F5| ADC.b #$08
|07E2F7| STA.b $57

|07E2F9| BRA .load_subvel

;---------------------------------------------------------------------------------------------------

.stair_drag_too_high
|07E2FB| LDA.b #$20
|07E2FD| STA.b $57

|07E2FF| BRA .load_subvel

;---------------------------------------------------------------------------------------------------

.not_slipping
|07E301| LDA.b $57
|07E303| BEQ .load_subvel

|07E305| LDX.b #$0A

|07E307| LDA.b $11
|07E309| CMP.b #$08
|07E30B| BEQ .overworld

|07E30D| CMP.b #$10
|07E30F| BEQ .overworld

|07E311| LDX.b #$02

.overworld
|07E313| LDA.b $67
|07E315| AND.b #$00
|07E317| BEQ .never_fails

|07E319| INX

.never_fails
|07E31A| LDA.b $57
|07E31C| CMP.b #$01
|07E31E| BEQ .load_subvel

|07E320| CMP.b #$10
|07E322| BCS .reset_speed

|07E324| ADC.b #$01
|07E326| STA.b $57

|07E328| LDA.b #$00
|07E32A| BRA .zero_subvelocity

.reset_speed
|07E32C| STZ.b $57
|07E32E| STZ.b $5E

;---------------------------------------------------------------------------------------------------

.load_subvel
|07E330| LDA.w SubVelocityValues,X

.zero_subvelocity
|07E333| CLC
|07E334| ADC.b $57
|07E336| STA.b $0A
|07E338| STA.b $0B

|07E33A| LDA.b #$03
|07E33C| STA.b $0C

|07E33E| LDA.b #$02
|07E340| STA.b $0D

;---------------------------------------------------------------------------------------------------

|07E342| LDX.b #$01

.do_next_axis
|07E344| LDA.b $67
|07E346| AND.b $0C
|07E348| BEQ .skip_because_zero

|07E34A| AND.b $0D
|07E34C| BEQ .dont_invert_it

|07E34E| LDA.b $0A,X
|07E350| EOR.b #$FF
|07E352| INC A
|07E353| STA.b $0A,X

.dont_invert_it
|07E355| LDA.b $0A,X
|07E357| STA.b $27,X

.skip_because_zero
|07E359| ASL.b $0C
|07E35B| ASL.b $0C
|07E35D| ASL.b $0D
|07E35F| ASL.b $0D

|07E361| DEX
|07E362| BPL .do_next_axis

;---------------------------------------------------------------------------------------------------

|07E364| LDA.b #$FF
|07E366| STA.b $29
|07E368| STA.b $24
|07E36A| STA.b $25

|07E36C| STZ.b $2C

|07E36E| BRA .cache_full_coords

;===================================================================================================

#FindArbitraryLandingSpot:
|07E370| PHB
|07E371| PHK
|07E372| PLB

;---------------------------------------------------------------------------------------------------

.cache_full_coords
|07E373| LDA.b $20
|07E375| STA.b $00
|07E377| STA.b $3E

|07E379| LDA.b $22
|07E37B| STA.b $01
|07E37D| STA.b $3F

|07E37F| LDA.b $21
|07E381| STA.b $02
|07E383| STA.b $40

|07E385| LDA.b $23
|07E387| STA.b $03
|07E389| STA.b $41

|07E38B| LDA.b $5D
|07E38D| CMP.b #$0A ; LINKSTATE 0A
|07E38F| BEQ .quaking

|07E391| LDA.w $02F5
|07E394| CMP.b #$02
|07E396| BEQ HandleLinkVelocityAndSandDrag

.quaking
|07E398| LDY.b #$02
|07E39A| LDX.b #$04

|07E39C| LDA.b $4D
|07E39E| BNE .next_direction

|07E3A0| LDY.b #$01
|07E3A2| LDX.b #$02

;---------------------------------------------------------------------------------------------------

.next_direction
|07E3A4| LDA.w $0027,Y

|07E3A7| ASL A
|07E3A8| ASL A
|07E3A9| ASL A
|07E3AA| ASL A

|07E3AB| CLC
|07E3AC| ADC.w $002A,Y
|07E3AF| STA.w $002A,Y

|07E3B2| PHY
|07E3B3| PHP

|07E3B4| LDA.w $0027,Y

|07E3B7| LSR A
|07E3B8| LSR A
|07E3B9| LSR A
|07E3BA| LSR A

|07E3BB| CMP.b #$08

|07E3BD| LDY.b #$00
|07E3BF| BCC .positive_velocity

|07E3C1| ORA.b #$F0
|07E3C3| LDY.b #$FF

.positive_velocity
|07E3C5| PLP
|07E3C6| ADC.b $20,X
|07E3C8| STA.b $20,X

|07E3CA| TYA
|07E3CB| ADC.b $21,X
|07E3CD| STA.b $21,X

|07E3CF| PLY
|07E3D0| DEY

|07E3D1| DEX
|07E3D2| DEX
|07E3D3| BPL .next_direction

;---------------------------------------------------------------------------------------------------

|07E3D5| JSR HandleLinkMovingFloor
|07E3D8| JSR ApplyConveyorToLink

|07E3DB| BRA HandleLinkVelocityAndSandDrag

;===================================================================================================

HandleLinkVelocityAndSandDrag_long:
|07E3DD| PHB
|07E3DE| PHK
|07E3DF| PLB

;===================================================================================================

HandleLinkVelocityAndSandDrag:
|07E3E0| REP #$20

|07E3E2| LDA.b $20
|07E3E4| CLC
|07E3E5| ADC.w $0B7E
|07E3E8| STA.b $20

|07E3EA| LDA.b $22
|07E3EC| CLC
|07E3ED| ADC.w $0B7C
|07E3F0| STA.b $22

|07E3F2| SEP #$20

|07E3F4| LDA.b $20
|07E3F6| SEC
|07E3F7| SBC.b $00
|07E3F9| STA.b $30

|07E3FB| LDA.b $22
|07E3FD| SEC
|07E3FE| SBC.b $01
|07E400| STA.b $31

;---------------------------------------------------------------------------------------------------

#EXIT_07E402:
|07E402| SEP #$20

|07E404| PLB

|07E405| RTL

;===================================================================================================

SwimmingAccelAndThrustChange:
|07E406| dw   8, -12,  -8, -16
|07E40E| dw   4,  -6, -12,  -6
|07E416| dw  10, -16, -12,  -6

SwimmingThrustDirectionMask:
|07E41E| db $F3
|07E41F| db $FF
|07E420| db $FC
|07E421| db $FF

SwimmingThrustDirectionBit:
|07E422| dw $0008
|07E424| dw $0004
|07E426| dw $0002
|07E428| dw $0001

;---------------------------------------------------------------------------------------------------

HandleSwimStrokeAndSubpixels:
|07E42A| STZ.b $27
|07E42C| STZ.b $28

|07E42E| REP #$20

|07E430| LDX.b #$02

.next_direction
|07E432| STZ.b $08,X

|07E434| DEC.w $0326,X
|07E437| BPL .positive_momentum

|07E439| LDA.w #$0001
|07E43C| STA.w $032B,X

|07E43F| STZ.w $0326,X

.positive_momentum
|07E442| LDA.w $032B,X
|07E445| ASL A
|07E446| TAY

|07E447| LDA.w $034A
|07E44A| AND.w #$00FF
|07E44D| BEQ .not_on_ice

|07E44F| ASL A
|07E450| ASL A
|07E451| ASL A
|07E452| STA.b $00

|07E454| TYA
|07E455| CLC
|07E456| ADC.b $00
|07E458| TAY

.not_on_ice
|07E459| LDA.w SwimmingAccelAndThrustChange,Y
|07E45C| CLC
|07E45D| ADC.w $033C,X
|07E460| BEQ .zero_thrust
|07E462| BPL .positive_thrust

.zero_thrust
|07E464| LDA.w SwimmingThrustDirectionMask,X
|07E467| AND.b $67
|07E469| STA.b $67
|07E46B| STA.b $26

|07E46D| LDA.w $032B,X
|07E470| CMP.w #$0002
|07E473| BNE .not_maxed

|07E475| STZ.w $032B,X

|07E478| LDA.w MaxSwimAcceleration
|07E47B| STA.w $0334,X

|07E47E| LDA.w #$0002

|07E481| BRA .set_accel_and_thrust

;---------------------------------------------------------------------------------------------------

.not_maxed
|07E483| LDA.w #$0000
|07E486| STA.w $0334,X
|07E489| STA.w $032B,X

|07E48C| BRA .set_accel_and_thrust

;---------------------------------------------------------------------------------------------------

.positive_thrust
|07E48E| PHA

|07E48F| TXA
|07E490| CLC
|07E491| ADC.w $0338,X
|07E494| ASL A
|07E495| TAY

|07E496| LDA.w SwimmingThrustDirectionBit,Y
|07E499| ORA.b $67
|07E49B| STA.b $67

|07E49D| PLA
|07E49E| CMP.w $0334,X
|07E4A1| BCC .set_accel_and_thrust

|07E4A3| LDA.w $0334,X

.set_accel_and_thrust
|07E4A6| STA.w $033C,X
|07E4A9| STA.b $08,X

|07E4AB| LDA.b $6A
|07E4AD| BEQ .not_pressing_diagonally

|07E4AF| LDA.b $08,X
|07E4B1| LSR A
|07E4B2| LSR A
|07E4B3| STA.b $00

|07E4B5| LDA.b $08,X
|07E4B7| SEC
|07E4B8| SBC.b $00
|07E4BA| STA.b $08,X

.not_pressing_diagonally
|07E4BC| LDA.w $0338,X
|07E4BF| AND.w #$00FF
|07E4C2| BNE .positive_subpixel_adjuster

|07E4C4| LDA.b $08,X
|07E4C6| EOR.w #$FFFF
|07E4C9| INC A
|07E4CA| STA.b $08,X

.positive_subpixel_adjuster
|07E4CC| DEX
|07E4CD| DEX
|07E4CE| BMI .continue

|07E4D0| BRL .next_direction

;---------------------------------------------------------------------------------------------------

.continue
|07E4D3| SEP #$20

|07E4D5| LDA.b $20
|07E4D7| STA.b $00
|07E4D9| STA.b $3E

|07E4DB| LDA.b $22
|07E4DD| STA.b $01
|07E4DF| STA.b $3F

|07E4E1| LDA.b $21
|07E4E3| STA.b $02
|07E4E5| STA.b $40

|07E4E7| LDA.b $23
|07E4E9| STA.b $03
|07E4EB| STA.b $41

;---------------------------------------------------------------------------------------------------

|07E4ED| LDY.b #$01
|07E4EF| LDX.b #$02

.next_subpixel
|07E4F1| LDA.b $08,X
|07E4F3| CLC
|07E4F4| ADC.w $002A,Y
|07E4F7| STA.w $002A,Y

|07E4FA| PHY
|07E4FB| PHP

|07E4FC| LDA.b $09,X
|07E4FE| CMP.b #$08

|07E500| LDY.b #$00
|07E502| BCC .positive_y_subpixeling

|07E504| ORA.b #$F0
|07E506| LDY.b #$FF

.positive_y_subpixeling
|07E508| PLP
|07E509| ADC.b $20,X
|07E50B| STA.b $20,X

|07E50D| TYA
|07E50E| ADC.b $21,X
|07E510| STA.b $21,X

|07E512| PLY

|07E513| LDA.b $08,X
|07E515| LSR A
|07E516| LSR A
|07E517| LSR A
|07E518| LSR A
|07E519| STA.b $08,X

|07E51B| LDA.b $09,X
|07E51D| BPL .positive_x_subpixeling

|07E51F| EOR.b #$FF
|07E521| INC A

.positive_x_subpixeling
|07E522| ASL A
|07E523| ASL A
|07E524| ASL A
|07E525| ASL A
|07E526| ORA.b $08,X
|07E528| STA.w $0027,Y

|07E52B| DEY

|07E52C| DEX
|07E52D| DEX
|07E52E| BPL .next_subpixel

;---------------------------------------------------------------------------------------------------

|07E530| LDA.w $046C
|07E533| CMP.b #$04
|07E535| BNE .no_moving_floor

|07E537| JSR ApplyMovingFloorToLink

.no_moving_floor
|07E53A| STZ.b $68
|07E53C| STZ.b $69

|07E53E| BRL HandleLinkVelocityAndSandDrag

;===================================================================================================

UNREACHABLE_07E541:
|07E541| dw $0040, $0010

;===================================================================================================

DashInPlace:
|07E545| STZ.b $00
|07E547| STZ.b $01

|07E549| LDA.b $F0
|07E54B| AND.b #$0F
|07E54D| BEQ .not_pressing_dpad

|07E54F| LDX.b #$80

|07E551| LDA.w $0351
|07E554| BEQ .not_sloshing

|07E556| LDX.b #$50

.not_sloshing
|07E558| STX.b $00

|07E55A| LDA.b #$01
|07E55C| STA.b $01

.not_pressing_dpad
|07E55E| STZ.b $27
|07E560| STZ.b $28

|07E562| STZ.b $08
|07E564| STZ.b $09

|07E566| STZ.b $0A
|07E568| STZ.b $0B

|07E56A| LDX.b #$03

|07E56C| LDA.b $67

.shift_more
|07E56E| LSR A
|07E56F| BCS .bit_found

|07E571| DEX
|07E572| BPL .shift_more

|07E574| PLB

|07E575| RTL

;---------------------------------------------------------------------------------------------------

.bit_found
|07E576| TXY

|07E577| REP #$20

|07E579| LDA.b $00
|07E57B| CPY.b #$00
|07E57D| BEQ .pressing_up

|07E57F| CPY.b #$02
|07E581| BNE .not_pressing_left

.pressing_up
|07E583| EOR.w #$FFFF
|07E586| INC A

.not_pressing_left
|07E587| PHA

|07E588| TYA
|07E589| AND.w #$0002
|07E58C| TAX

|07E58D| PLA
|07E58E| STA.b $08,X

|07E590| SEP #$20

|07E592| BRL HandleSwimStrokeAndSubpixels.continue

;===================================================================================================

HandleLinkMovingFloor:
|07E595| LDA.w $046C
|07E598| BEQ EXIT_07E5E3

|07E59A| LDA.b $24
|07E59C| BEQ .grounded

|07E59E| CMP.b #$FF
|07E5A0| BNE EXIT_07E5E3

.grounded
|07E5A2| LDA.w $0322
|07E5A5| AND.b #$03
|07E5A7| CMP.b #$03
|07E5A9| BNE EXIT_07E5E3

|07E5AB| LDA.b $5D
|07E5AD| CMP.b #$13 ; LINKSTATE 13
|07E5AF| BEQ EXIT_07E5E3

|07E5B1| LDY.b #$08

|07E5B3| LDA.w $0310
|07E5B6| BEQ .no_floor_y_velocity
|07E5B8| BMI .negative_floor_y_velocity

|07E5BA| LDY.b #$04

.negative_floor_y_velocity
|07E5BC| TYA
|07E5BD| TSB.b $67

.no_floor_y_velocity
|07E5BF| LDY.b #$02

|07E5C1| LDA.w $0312
|07E5C4| BEQ ApplyMovingFloorToLink
|07E5C6| BMI .negative_floor_x_velocity

|07E5C8| LDY.b #$01

.negative_floor_x_velocity
|07E5CA| TYA
|07E5CB| TSB.b $67

;===================================================================================================

ApplyMovingFloorToLink:
|07E5CD| STZ.b $6A

|07E5CF| REP #$20

|07E5D1| LDA.b $20
|07E5D3| CLC
|07E5D4| ADC.w $0310
|07E5D7| STA.b $20

|07E5D9| LDA.b $22
|07E5DB| CLC
|07E5DC| ADC.w $0312
|07E5DF| STA.b $22

|07E5E1| SEP #$20

;---------------------------------------------------------------------------------------------------

#EXIT_07E5E3:
|07E5E3| RTS

;===================================================================================================

pool ApplyConveyorToLink

.direction
|07E5E4| db $08 ; up
|07E5E5| db $04 ; down
|07E5E6| db $02 ; left
|07E5E7| db $01 ; right

.speed_y
|07E5E8| db  -8 ; up
|07E5E9| db   8 ; down
|07E5EA| db   0 ; left
|07E5EB| db   0 ; right

.speed_x
|07E5EC| db   0 ; up
|07E5ED| db   0 ; down
|07E5EE| db  -8 ; left
|07E5EF| db   8 ; right

endpool

;---------------------------------------------------------------------------------------------------

ApplyConveyorToLink:
|07E5F0| LDA.w $03F3
|07E5F3| BEQ EXIT_07E5E3

|07E5F5| LDA.b $24
|07E5F7| BEQ .grounded

|07E5F9| CMP.b #$FF
|07E5FB| BNE EXIT_07E5E3

;---------------------------------------------------------------------------------------------------

.grounded
|07E5FD| LDA.w $0376
|07E600| AND.b #$01
|07E602| BNE EXIT_07E5E3

|07E604| LDA.b $5D
|07E606| CMP.b #$13 ; LINKSTATE 13
|07E608| BEQ EXIT_07E5E3

|07E60A| LDA.b $4D
|07E60C| BNE EXIT_07E5E3

|07E60E| LDA.w $0372
|07E611| BEQ .run_conveyor

|07E613| LDA.w $02F1
|07E616| CMP.b #$20
|07E618| BNE .run_conveyor

|07E61A| LDY.w $03F3
|07E61D| DEY
|07E61E| LDA.w .direction,Y

|07E621| AND.b $67
|07E623| BNE EXIT_07E5E3

;---------------------------------------------------------------------------------------------------

.run_conveyor
|07E625| STZ.b $6A

|07E627| LDY.w $03F3
|07E62A| DEY

|07E62B| LDA.w .direction,Y
|07E62E| TSB.b $67

|07E630| LDA.w .speed_y,Y
|07E633| STA.b $72

|07E635| LDA.w .speed_x,Y
|07E638| STA.b $73

;---------------------------------------------------------------------------------------------------

|07E63A| LDX.b #$01
|07E63C| LDY.b #$02

.next_direction
|07E63E| PHX

|07E63F| LDA.b $72,X
|07E641| ASL A
|07E642| ASL A
|07E643| ASL A
|07E644| ASL A
|07E645| CLC
|07E646| ADC.w $041C,X
|07E649| STA.w $041C,X

|07E64C| LDA.b $72,X
|07E64E| PHP

|07E64F| LDX.b #$00

|07E651| LSR A
|07E652| LSR A
|07E653| LSR A
|07E654| LSR A

|07E655| PLP
|07E656| BPL .positive_speed

|07E658| ORA.b #$F0
|07E65A| DEX

.positive_speed
|07E65B| ADC.w $0020,Y
|07E65E| STA.w $0020,Y

|07E661| TXA
|07E662| ADC.w $0021,Y
|07E665| STA.w $0021,Y

|07E668| PLX

|07E669| DEY
|07E66A| DEY

|07E66B| DEX
|07E66C| BPL .next_direction

|07E66E| SEP #$20

|07E670| RTS

;===================================================================================================

DominantDiagonalDirection:
|07E671| db $08, $04, $02, $01

;===================================================================================================

WalkAnimationTimer_other:
|07E675| db $04 ; bunny/carry walk up
|07E676| db $04 ; bunny/carry walk down
|07E677| db $04 ; bunny/carry walk left
|07E678| db $04 ; bunny/carry walk right
|07E679| db $01 ; slipping with sword/carry up
|07E67A| db $01 ; slipping with sword/carry down
|07E67B| db $01 ; slipping with sword/carry left
|07E67C| db $01 ; slipping with sword/carry right
|07E67D| db $02
|07E67E| db $02
|07E67F| db $02
|07E680| db $02
|07E681| db $08 ; straight stair doors/pushing
|07E682| db $08
|07E683| db $08
|07E684| db $08

;===================================================================================================

WalkAnimationTimer:
|07E685| db $01, $02, $03, $02, $02, $02, $03, $02 ; walk
|07E68D| db $01 ; used both by walk and on ice, but not for entering underworld
|07E68E| db $01, $02, $01, $01, $01, $02, $01, $02 ; entering underworld/ice
|07E696| db $02, $03, $02, $02, $02, $03, $02      ; ice+underworld entrance - impossible?

;===================================================================================================

HandleLinkAnimation_SetFacingDown:
|07E69D| PHB
|07E69E| PHK
|07E69F| PLB

|07E6A0| LDA.b #$04
|07E6A2| STA.b $26

|07E6A4| BRA HandleLinkAnimation_MainEntry

;===================================================================================================

HandleLinkAnimation_FullLongEntry:
|07E6A6| PHB
|07E6A7| PHK
|07E6A8| PLB

;===================================================================================================

HandleLinkAnimation_MainEntry:
|07E6A9| LDA.b $5D
|07E6AB| CMP.b #$04 ; LINKSTATE 04
|07E6AD| BNE .not_swimming

|07E6AF| BRL HandleLinkAnimation_Swimming

;---------------------------------------------------------------------------------------------------

.not_swimming
|07E6B2| LDA.b $26
|07E6B4| BNE .not_moving

|07E6B6| BRL .exit

;---------------------------------------------------------------------------------------------------

.not_moving
|07E6B9| STA.b $00

|07E6BB| LDA.w $034A
|07E6BE| BEQ .not_on_ice_a

|07E6C0| LDA.w $0340
|07E6C3| STA.b $00

.not_on_ice_a
|07E6C5| LDA.b $50
|07E6C7| BNE .check_dashing

|07E6C9| LDA.b $6A
|07E6CB| BEQ .no_diagonal

|07E6CD| LDA.b $6C
|07E6CF| BEQ .not_in_door

|07E6D1| ASL A
|07E6D2| AND.b #$FC
|07E6D4| TAY

|07E6D5| BRA .door_or_not_pressing_vertical

;---------------------------------------------------------------------------------------------------

.not_in_door
|07E6D7| LDA.b $2F
|07E6D9| LSR A
|07E6DA| TAX

|07E6DB| LDA.b $00
|07E6DD| AND.w DominantDiagonalDirection,X
|07E6E0| BNE .check_dashing

.no_diagonal
|07E6E2| LDY.b #$04

|07E6E4| LDA.b $00
|07E6E6| AND.b #$0C
|07E6E8| BEQ .door_or_not_pressing_vertical

|07E6EA| LDY.b #$00

.door_or_not_pressing_vertical
|07E6EC| CPY.b #$04
|07E6EE| BEQ .was_pressing_a_vertical

|07E6F0| LDA.b $00
|07E6F2| AND.b #$04
|07E6F4| BNE .opposite_on_axis

|07E6F6| BRA .set_direction

;---------------------------------------------------------------------------------------------------

.was_pressing_a_vertical
|07E6F8| LDA.b $00
|07E6FA| AND.b #$01
|07E6FC| BEQ .set_direction

.opposite_on_axis
|07E6FE| INY
|07E6FF| INY

.set_direction
|07E700| STY.b $2F

|07E702| BRA .check_dashing

;===================================================================================================

#HandleLinkAnimation_StartWithDash:
|07E704| PHB
|07E705| PHK
|07E706| PLB

;---------------------------------------------------------------------------------------------------

.check_dashing
|07E707| LDA.w $0372
|07E70A| BEQ .not_dashing

|07E70C| BRL HandleLinkAnimation_Dash

;---------------------------------------------------------------------------------------------------

.not_dashing
|07E70F| LDA.b $2F
|07E711| LSR A
|07E712| TAX

|07E713| LDA.b $5E
|07E715| CMP.b #$06
|07E717| BNE .not_transitioning_to_uw_speed

|07E719| TXA
|07E71A| CLC
|07E71B| ADC.b #$04
|07E71D| TAX

|07E71E| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_transitioning_to_uw_speed
|07E720| LDA.w $034A
|07E723| BEQ .continue_b

|07E725| LDA.b $F0
|07E727| AND.b #$0F
|07E729| BEQ .no_dpad_press

|07E72B| TXA
|07E72C| CLC
|07E72D| ADC.b #$04
|07E72F| TAX

.continue_b
|07E730| LDA.b $5D
|07E732| CMP.b #$17 ; LINKSTATE 17
|07E734| BNE .not_bunny

|07E736| BRL HandleLinkAnimation_Bunny

;---------------------------------------------------------------------------------------------------

.not_bunny
|07E739| LDA.b $11

|07E73B| CMP.b #$0E
|07E73D| BEQ HandleLinkAnimation_General

|07E73F| CMP.b #$12
|07E741| BEQ .straight_interroom_stairs_door

|07E743| CMP.b #$13
|07E745| BNE .not_interroom_stairs_door

.straight_interroom_stairs_door
|07E747| LDX.b #$0C

|07E749| BRA HandleLinkAnimation_General

;---------------------------------------------------------------------------------------------------

.not_interroom_stairs_door
|07E74B| LDA.w $0308
|07E74E| AND.b #$80
|07E750| BNE HandleLinkAnimation_General

|07E752| LDA.b $48
|07E754| AND.b #$8D
|07E756| BEQ .not_grabbing

|07E758| LDX.b #$0C
|07E75A| BRA HandleLinkAnimation_General

;---------------------------------------------------------------------------------------------------

.not_grabbing
|07E75C| LDA.w $0351
|07E75F| BNE HandleLinkAnimation_General

|07E761| LDA.b $3C
|07E763| BEQ HandleLinkAnimation_SwordPrimed

;===================================================================================================

#HandleLinkAnimation_General:
|07E765| LDA.b $2E
|07E767| CMP.b #$06
|07E769| BCS .no_dpad_press

|07E76B| LDA.w $02F5
|07E76E| CMP.b #$02
|07E770| BEQ .no_dpad_press

|07E772| LDA.w WalkAnimationTimer_other,X
|07E775| STA.b $00

|07E777| LDA.b $2D
|07E779| CLC
|07E77A| ADC.b #$01
|07E77C| STA.b $2D

|07E77E| CMP.b $00
|07E780| BCC .exit

|07E782| STZ.b $2D

|07E784| LDA.b $2E
|07E786| INC A
|07E787| CMP.b #$06
|07E789| BNE .set_anim_step

.no_dpad_press
|07E78B| LDA.b #$00

.set_anim_step
|07E78D| STA.b $2E

.exit
|07E78F| PLB

|07E790| RTL

;===================================================================================================

HandleLinkAnimation_SwordPrimed:
|07E791| LDX.b $2E

|07E793| LDA.b $5E
|07E795| CMP.b #$06
|07E797| BNE .not_walking_into_dungeon

|07E799| TXA
|07E79A| CLC
|07E79B| ADC.b #$08
|07E79D| TAX

.not_walking_into_dungeon
|07E79E| LDA.w $034A
|07E7A1| BEQ .not_on_ice

|07E7A3| TXA
|07E7A4| CLC
|07E7A5| ADC.b #$08
|07E7A7| TAX

.not_on_ice
|07E7A8| LDA.w $02F5
|07E7AB| CMP.b #$02
|07E7AD| BEQ EXIT_07E7F8

|07E7AF| LDA.w WalkAnimationTimer,X
|07E7B2| STA.b $00

|07E7B4| LDA.b $2D
|07E7B6| CLC
|07E7B7| ADC.b #$01
|07E7B9| STA.b $2D

|07E7BB| CMP.b $00
|07E7BD| BCC .exit

|07E7BF| STZ.b $2D

|07E7C1| LDA.b $2E
|07E7C3| INC A
|07E7C4| CMP.b #$09
|07E7C6| BNE .dont_reset_step

|07E7C8| LDA.b #$01

.dont_reset_step
|07E7CA| STA.b $2E

.exit
|07E7CC| PLB

|07E7CD| RTL

;===================================================================================================

HandleLinkAnimation_Bunny:
|07E7CE| LDA.b $2E
|07E7D0| CMP.b #$04
|07E7D2| BCS .reset_step

|07E7D4| LDA.w $02F5
|07E7D7| CMP.b #$02
|07E7D9| BEQ .reset_step

|07E7DB| LDA.w WalkAnimationTimer_other,X
|07E7DE| STA.b $00

|07E7E0| LDA.b $2D
|07E7E2| CLC
|07E7E3| ADC.b #$01
|07E7E5| STA.b $2D

|07E7E7| CMP.b $00
|07E7E9| BCC EXIT_07E7F8

|07E7EB| STZ.b $2D

|07E7ED| LDA.b $2E
|07E7EF| INC A
|07E7F0| CMP.b #$04
|07E7F2| BNE .dont_reset_step

.reset_step
|07E7F4| LDA.b #$00

.dont_reset_step
|07E7F6| STA.b $2E

;---------------------------------------------------------------------------------------------------

#EXIT_07E7F8:
|07E7F8| PLB

|07E7F9| RTL

;===================================================================================================

HandleLinkAnimation_Swimming:
|07E7FA| LDA.w $0340
|07E7FD| BEQ .exit

|07E7FF| LDA.b $50
|07E801| BNE .exit

|07E803| LDA.b $6A
|07E805| BEQ .not_moving

|07E807| LDA.b $6C
|07E809| BEQ .not_in_door

|07E80B| ASL A
|07E80C| AND.b #$FC
|07E80E| TAY

|07E80F| BRA .continue

;---------------------------------------------------------------------------------------------------

.not_in_door
|07E811| LDA.b $2F
|07E813| LSR A
|07E814| TAX

|07E815| LDA.w $0340
|07E818| AND.w DominantDiagonalDirection,X
|07E81B| BNE .exit

.not_moving
|07E81D| LDY.b #$04

|07E81F| LDA.w $0340
|07E822| AND.b #$0C
|07E824| BEQ .continue

|07E826| LDY.b #$00

.continue
|07E828| CPY.b #$04
|07E82A| BEQ .going_horizontally

|07E82C| LDA.w $0340
|07E82F| AND.b #$04
|07E831| BNE .advance_direction

|07E833| BRA .set_direction

.going_horizontally
|07E835| LDA.w $0340
|07E838| AND.b #$01
|07E83A| BEQ .set_direction

.advance_direction
|07E83C| INY
|07E83D| INY

.set_direction
|07E83E| STY.b $2F

.exit
|07E840| PLB

|07E841| RTL

;===================================================================================================

pool HandleLinkAnimation_Dash

.timers_a_idk
|07E842| db $03, $03, $05, $03, $03, $03, $05, $03
|07E84A| db $02, $02, $04, $02, $02, $02, $04, $02
|07E852| db $02, $02, $03, $02, $02, $02, $03, $02
|07E85A| db $01, $01, $02, $01, $01, $01, $02, $01
|07E862| db $01, $01, $01, $01, $01, $01, $01, $01
|07E86A| db $00, $00, $01, $00, $00, $00, $01, $00
|07E872| db $00, $00, $00, $00, $00, $00, $00, $00

.timers_charge
|07E87A| db $01
|07E87B| db $02, $02, $02, $02, $02 ; water?
|07E880| db $02                     ; actual dashing

.thresholds
|07E881| db $30                               ; unused? is this a default?
|07E882| db $24, $18, $10, $0C, $08, $04
|07E888| db $04, $06, $08, $0A, $0C, $0E, $10 ; unused?

endpool

;---------------------------------------------------------------------------------------------------

HandleLinkAnimation_Dash:
|07E88F| LDX.b #$06

|07E891| LDA.w $0374
|07E894| BEQ .use_value

.next_timer_value
|07E896| LDA.w $0374
|07E899| CMP.w .thresholds,X
|07E89C| BCC .use_value

|07E89E| DEX
|07E89F| BPL .next_timer_value

|07E8A1| INX

;---------------------------------------------------------------------------------------------------

.use_value
|07E8A2| LDA.b $3C
|07E8A4| CMP.b #$09
|07E8A6| BCS .get_charge_timer

|07E8A8| LDA.w $0351
|07E8AB| BNE .get_charge_timer

|07E8AD| TXA
|07E8AE| ASL A
|07E8AF| ASL A
|07E8B0| ASL A
|07E8B1| TAX

|07E8B2| LDA.w .timers_a_idk,X
|07E8B5| STA.b $00

|07E8B7| LDA.b $2D
|07E8B9| CLC
|07E8BA| ADC.b #$01
|07E8BC| STA.b $2D

|07E8BE| CMP.b $00
|07E8C0| BCC .proceed_to_exit

|07E8C2| STZ.b $2D

|07E8C4| LDA.b $2E
|07E8C6| INC A
|07E8C7| CMP.b #$09
|07E8C9| BNE .dont_reset_step

|07E8CB| LDA.b #$01

.dont_reset_step
|07E8CD| BRA .set_anim_step

.proceed_to_exit
|07E8CF| BRA .exit

;---------------------------------------------------------------------------------------------------

.get_charge_timer
|07E8D1| LDA.w .timers_charge,X
|07E8D4| STA.b $00

|07E8D6| LDA.b $2D
|07E8D8| CLC
|07E8D9| ADC.b #$01
|07E8DB| STA.b $2D

|07E8DD| CMP.b $00
|07E8DF| BCC .exit

|07E8E1| STZ.b $2D

|07E8E3| LDA.b $2E
|07E8E5| INC A
|07E8E6| CMP.b #$06
|07E8E8| BCC .set_anim_step

|07E8EA| LDA.b #$00

.set_anim_step
|07E8EC| STA.b $2E

.exit
|07E8EE| PLB

|07E8EF| RTL

;===================================================================================================

HandleIndoorCameraAndDoors:
|07E8F0| LDA.b $1B
|07E8F2| BEQ .not_indoors

|07E8F4| LDA.b $6C
|07E8F6| BEQ .not_in_a_door

|07E8F8| JML HandleDoorTransitions

.not_in_a_door
|07E8FC| JSL ApplyLinksMovementToCamera

.not_indoors
|07E900| RTS

;===================================================================================================

HandleDoorTransitions:
|07E901| STZ.b $68
|07E903| STZ.b $69

|07E905| LDA.b $26
|07E907| AND.b #$0C
|07E909| BEQ .not_vertical

|07E90B| LDX.b $6C
|07E90D| CPX.b #$01
|07E90F| BNE .not_vertical

|07E911| AND.b #$04
|07E913| BEQ .going_up

|07E915| REP #$20

|07E917| LDA.b $20
|07E919| CLC
|07E91A| ADC.w #$001C
|07E91D| STA.b $00

|07E91F| AND.w #$00FC
|07E922| BNE .not_vertical

|07E924| SEP #$20

|07E926| LDA.b $01
|07E928| SEC
|07E929| SBC.b $40
|07E92B| STA.b $68

|07E92D| BRA .not_vertical

.going_up
|07E92F| REP #$20

|07E931| LDA.b $20
|07E933| SEC
|07E934| SBC.w #$0012
|07E937| STA.b $00

|07E939| SEP #$20

|07E93B| LDA.b $01
|07E93D| SEC
|07E93E| SBC.b $40
|07E940| STA.b $68

;---------------------------------------------------------------------------------------------------

.not_vertical
|07E942| SEP #$20

|07E944| LDA.b $26
|07E946| AND.b #$03
|07E948| BEQ .not_horizontal

|07E94A| LDX.b $6C
|07E94C| CPX.b #$02
|07E94E| BNE .not_horizontal

|07E950| AND.b #$01
|07E952| BEQ .going_left

|07E954| REP #$20

|07E956| LDA.b $22
|07E958| CLC
|07E959| ADC.w #$0015
|07E95C| STA.b $00

|07E95E| AND.w #$00FC
|07E961| BNE .not_horizontal

|07E963| SEP #$20

|07E965| LDA.b $01
|07E967| SEC
|07E968| SBC.b $41
|07E96A| STA.b $69

|07E96C| BRA .not_horizontal

.going_left
|07E96E| REP #$20

|07E970| LDA.b $22
|07E972| SEC
|07E973| SBC.w #$0008
|07E976| STA.b $00

|07E978| SEP #$20

|07E97A| LDA.b $01
|07E97C| SEC
|07E97D| SBC.b $41
|07E97F| STA.b $69

;---------------------------------------------------------------------------------------------------

.not_horizontal
|07E981| SEP #$20

|07E983| LDA.b $69
|07E985| BEQ .transitioning_vertically
|07E987| BMI .transitioning_west

|07E989| STZ.w $030B
|07E98C| STZ.w $0308
|07E98F| STZ.w $0309
|07E992| STZ.w $0376

|07E995| JSL HandleEdgeTransitionMovementEast_Right8

|07E999| RTS

;---------------------------------------------------------------------------------------------------

.transitioning_west
|07E99A| STZ.w $030B
|07E99D| STZ.w $0308
|07E9A0| STZ.w $0309
|07E9A3| STZ.w $0376

|07E9A6| JSL HandleEdgeTransitionMovementWest_Left8

|07E9AA| RTS

;---------------------------------------------------------------------------------------------------

.transitioning_vertically
|07E9AB| LDA.b $68
|07E9AD| BEQ .exit
|07E9AF| BPL .transitioning_south

|07E9B1| STZ.w $030B
|07E9B4| STZ.w $0308
|07E9B7| STZ.w $0309
|07E9BA| STZ.w $0376

|07E9BD| JSL HandleEdgeTransitionMovementNorth

|07E9C1| RTS

;---------------------------------------------------------------------------------------------------

.transitioning_south
|07E9C2| STZ.w $030B
|07E9C5| STZ.w $0308
|07E9C8| STZ.w $0309
|07E9CB| STZ.w $0376

|07E9CE| JSL HandleEdgeTransitionMovementSouth_Down16

.exit
|07E9D2| RTS

;===================================================================================================

ApplyLinksMovementToCamera:
|07E9D3| PHB
|07E9D4| PHK
|07E9D5| PLB

|07E9D6| LDA.b $21
|07E9D8| SEC
|07E9D9| SBC.b $40
|07E9DB| STA.b $68

|07E9DD| LDA.b $23
|07E9DF| SEC
|07E9E0| SBC.b $41
|07E9E2| STA.b $69

|07E9E4| LDA.b $69
|07E9E6| BEQ .check_y_movement

|07E9E8| BMI .moved_left

.moved_right
|07E9EA| JSL AdjustQuadrantAndCamera_right

|07E9EE| BRA .check_y_movement

.moved_left
|07E9F0| JSL AdjustQuadrantAndCamera_left

;---------------------------------------------------------------------------------------------------

.check_y_movement
|07E9F4| LDA.b $68
|07E9F6| BEQ .done

|07E9F8| BPL .moved_down

.moved_up
|07E9FA| JSL AdjustQuadrantAndCamera_up

|07E9FE| PLB

|07E9FF| RTL

.moved_down
|07EA00| JSL AdjustQuadrantAndCamera_down

.done
|07EA04| PLB

|07EA05| RTL

;===================================================================================================

InitializePrayerIris:
|07EA06| JSL CleanUpAndPrepDesertPrayerHDMA

|07EA0A| PHB
|07EA0B| PHK
|07EA0C| PLB

|07EA0D| REP #$20

|07EA0F| LDA.w #$0026
|07EA12| STA.w $067C

|07EA15| SEP #$20

|07EA17| STZ.w $067E

|07EA1A| JSL BuildPrayerHDMATable

|07EA1E| INC.b $B0

|07EA20| PLB

|07EA21| RTL

;===================================================================================================

DesertPrayerAnimationTimer:
|07EA22| db $16, $16, $16, $40, $01

;---------------------------------------------------------------------------------------------------

BuildPrayerHDMATable:
|07EA27| PHB
|07EA28| PHK
|07EA29| PLB

|07EA2A| REP #$30

|07EA2C| STZ.b $04

|07EA2E| LDA.b $20
|07EA30| SEC
|07EA31| SBC.b $E8
|07EA33| CLC
|07EA34| ADC.w #$000C
|07EA37| STA.b $0E

|07EA39| SEC
|07EA3A| SBC.w $067C
|07EA3D| STA.w $0674

|07EA40| BPL .link_not_too_high

|07EA42| STA.b $04

.link_not_too_high
|07EA44| CLC
|07EA45| ADC.w $067C

|07EA48| CLC
|07EA49| ADC.w $067C
|07EA4C| STA.w $0676

|07EA4F| LDA.b $22
|07EA51| SEC
|07EA52| SBC.b $E2

|07EA54| CLC
|07EA55| ADC.w #$0008
|07EA58| STA.w $0670

|07EA5B| LDA.w #$0001
|07EA5E| STA.w $067A

;===================================================================================================

NextDesertHDMALine:
|07EA61| LDA.w #$0100
|07EA64| STA.b $00
|07EA66| STA.b $02

|07EA68| LDA.w $0674
|07EA6B| BMI .link_too_high

|07EA6D| LDA.b $04
|07EA6F| CMP.w $0674
|07EA72| BCC .add_empty_table_entry

|07EA74| CMP.w $0676
|07EA77| BCS .add_empty_table_entry

.link_too_high
|07EA79| LDA.w $067C
|07EA7C| CMP.w $067A
|07EA7F| BCS .add_iris_table_entry

|07EA81| LDA.w #$0001
|07EA84| STA.w $067A

|07EA87| STZ.w $0674

|07EA8A| LDA.w $0676
|07EA8D| STA.b $04

|07EA8F| CMP.w #$00E1
|07EA92| BCC .add_empty_table_entry

|07EA94| BRL DesertHDMATableFinished

;---------------------------------------------------------------------------------------------------

.add_iris_table_entry
|07EA97| JSR DesertHDMACalculateIrisShapeLine

|07EA9A| LDA.b $06
|07EA9C| BNE .dont_turn_into_blank_line

|07EA9E| STZ.w $0674

|07EAA1| BRA .calculate_index

.dont_turn_into_blank_line
|07EAA3| LDA.b $08
|07EAA5| CLC
|07EAA6| ADC.w $0670
|07EAA9| STA.b $02

|07EAAB| LDA.w $0670
|07EAAE| SEC
|07EAAF| SBC.b $08
|07EAB1| STA.b $00

.calculate_index
|07EAB3| LDA.w $067A
|07EAB6| AND.w #$00FF
|07EAB9| STA.b $0A

|07EABB| LDA.b $0E
|07EABD| SEC
|07EABE| SBC.b $0A
|07EAC0| DEC A
|07EAC1| ASL A
|07EAC2| TAX

|07EAC3| BRA .add_from_iris

;---------------------------------------------------------------------------------------------------

.add_empty_table_entry
|07EAC5| LDA.b $04
|07EAC7| DEC A
|07EAC8| ASL A
|07EAC9| TAX

.add_from_iris
|07EACA| LDA.b $00
|07EACC| TAY
|07EACD| BMI .use_zero_a

|07EACF| AND.w #$FF00
|07EAD2| BEQ .not_zero_a

|07EAD4| CMP.w #$0100
|07EAD7| BNE .use_zero_a

|07EAD9| LDY.w #$00FF
|07EADC| BRA .not_zero_a

.use_zero_a
|07EADE| LDY.w #$0000

.not_zero_a
|07EAE1| TYA
|07EAE2| AND.w #$00FF
|07EAE5| STA.b $06

|07EAE7| LDA.b $02
|07EAE9| TAY

|07EAEA| AND.w #$FF00
|07EAED| BEQ .not_zero_b

|07EAEF| AND.w #$FF00
|07EAF2| BEQ .use_zero_b

|07EAF4| LDY.w #$00FF
|07EAF7| BRA .not_zero_b

.use_zero_b
|07EAF9| LDY.w #$0000

.not_zero_b
|07EAFC| TYA
|07EAFD| AND.w #$00FF
|07EB00| XBA
|07EB01| ORA.b $06
|07EB03| STA.b $06

|07EB05| CPX.w #$01C0
|07EB08| BCS .dont_add_line_a

|07EB0A| CMP.w #$FFFF
|07EB0D| BNE .add_as_is_a

|07EB0F| LDA.w #$00FF

.add_as_is_a
|07EB12| STA.w $1B00,X

.dont_add_line_a
|07EB15| LDA.w $0674
|07EB18| BMI .fine_to_try_to_draw

|07EB1A| LDA.b $04
|07EB1C| CMP.w $0674
|07EB1F| BCC .to_next

|07EB21| CMP.w $0676
|07EB24| BCS .to_next

.fine_to_try_to_draw
|07EB26| LDA.w $067A
|07EB29| AND.w #$00FF
|07EB2C| DEC A
|07EB2D| CLC
|07EB2E| ADC.b $0E
|07EB30| TAX

|07EB31| DEC A
|07EB32| ASL A
|07EB33| CMP.w #$01C0
|07EB36| BCS .dont_add_line_b

|07EB38| TAX

|07EB39| LDA.b $06
|07EB3B| CMP.w #$FFFF
|07EB3E| BNE .add_as_is_b

|07EB40| LDA.w #$00FF

.add_as_is_b
|07EB43| STA.w $1B00,X

.dont_add_line_b
|07EB46| INC.w $067A

;---------------------------------------------------------------------------------------------------

.to_next
|07EB49| INC.b $04

|07EB4B| LDA.b $04
|07EB4D| BMI .more_to_go

|07EB4F| CMP.w #$00E1
|07EB52| BCS DesertHDMATableFinished

.more_to_go
|07EB54| BRL NextDesertHDMALine

;===================================================================================================

DesertHDMATableFinished:
|07EB57| SEP #$30

|07EB59| LDA.b $B0
|07EB5B| CMP.b #$04
|07EB5D| BNE .exit

|07EB5F| LDA.w $067E
|07EB62| CMP.b #$01
|07EB64| BEQ .dont_advance

|07EB66| LDA.b $F4
|07EB68| ORA.b $F6
|07EB6A| AND.b #$C0
|07EB6C| BEQ .dont_advance

|07EB6E| LDA.b #$01
|07EB70| STA.w $067E

|07EB73| LSR.w $067C

.dont_advance
|07EB76| LDA.w $067E
|07EB79| BEQ .still_running_iris

|07EB7B| LDA.w $067C
|07EB7E| CLC
|07EB7F| ADC.b #$08
|07EB81| STA.w $067C

|07EB84| CMP.b #$C0
|07EB86| BCC .still_running_iris

|07EB88| LDA.w $02F0
|07EB8B| EOR.b #$01
|07EB8D| STA.w $02F0

|07EB90| LDA.b #$F3 ; SONG F3 - max volume
|07EB92| STA.w $012C

|07EB95| LDA.b #$00
|07EB97| STA.w $012D

|07EB9A| STZ.w $0FC1
|07EB9D| STZ.w $030A

|07EBA0| STZ.b $3A
|07EBA2| STZ.w $0308

|07EBA5| LDA.b $50
|07EBA7| AND.b #$FE
|07EBA9| STA.b $50

|07EBAB| STZ.b $B0
|07EBAD| STZ.b $11

|07EBAF| LDA.w $010C
|07EBB2| STA.b $10

|07EBB4| STZ.b $1E
|07EBB6| STZ.b $1F

|07EBB8| STZ.b $96
|07EBBA| STZ.b $97
|07EBBC| STZ.b $98

|07EBBE| JSL IrisSpotlight_ResetTable

|07EBC2| BRA .exit

;---------------------------------------------------------------------------------------------------

.still_running_iris
|07EBC4| DEC.b $3D
|07EBC6| BPL .exit

|07EBC8| LDX.w $030A
|07EBCB| INX
|07EBCC| CPX.b #$04
|07EBCE| BEQ .on_final_step

|07EBD0| STX.w $030A

.on_final_step
|07EBD3| LDA.w DesertPrayerAnimationTimer,X
|07EBD6| STA.b $3D

.exit
|07EBD8| PLB

|07EBD9| RTL

;===================================================================================================

pool DesertHDMACalculateIrisShapeLine

.multiplier_opening
|07EBDA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07EBE2| db $FF, $FF, $FF, $FF, $FE, $FE, $FE, $FE
|07EBEA| db $FD, $FD, $FD, $FD, $FC, $FC, $FC, $FB
|07EBF2| db $FB, $FB, $FA, $FA, $F9, $F9, $F8, $F8
|07EBFA| db $F7, $F7, $F6, $F6, $F5, $F5, $F4, $F3
|07EC02| db $F3, $F2, $F1, $F1, $F0, $EF, $EE, $EE
|07EC0A| db $ED, $EC, $EB, $EA, $E9, $E9, $E8, $E7
|07EC12| db $E6, $E5, $E4, $E3, $E2, $E1, $DF, $DE
|07EC1A| db $DD, $DC, $DB, $DA, $D8, $D7, $D6, $D5
|07EC22| db $D3, $D2, $D0, $CF, $CD, $CC, $CA, $C9
|07EC2A| db $C7, $C6, $C4, $C2, $C1, $BF, $BD, $BB
|07EC32| db $B9, $B7, $B6, $B4, $B1, $AF, $AD, $AB
|07EC3A| db $A9, $A7, $A4, $A2, $9F, $9D, $9A, $97
|07EC42| db $95, $92, $8F, $8C, $89, $86, $82, $7F
|07EC4A| db $7B, $78, $74, $70, $6C, $67, $63, $5E
|07EC52| db $59, $53, $4D, $46, $3F, $37, $2D, $1F
|07EC5A| db $00

.multiplier_closed
|07EC5B| db $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FE
|07EC63| db $FD, $FD, $FC, $FC, $FB, $FA, $F9, $F8
|07EC6B| db $F7, $F6, $F5, $F4, $F3, $F1, $F0, $EE
|07EC73| db $ED, $EB, $E9, $E8, $E6, $E4, $E2, $DF
|07EC7B| db $DD, $DB, $D8, $D6, $D3, $D0, $CD, $CA
|07EC83| db $C7, $C4, $C1, $BD, $B9, $B6, $B1, $AD
|07EC8B| db $A9, $A4, $9F, $9A, $95, $8F, $89, $82
|07EC93| db $7B, $74, $6C, $63, $59, $4D, $3F, $2D
|07EC9B| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECA3| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECAB| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECB3| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECBB| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECC3| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECCB| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECD3| db $00, $00, $00, $00, $00, $00, $00, $00
|07ECDB| db $00

endpool

;---------------------------------------------------------------------------------------------------

DesertHDMACalculateIrisShapeLine:
|07ECDC| SEP #$30

|07ECDE| LDA.w $067A
|07ECE1| STA.w WRDIVH
|07ECE4| STZ.w WRDIVL

|07ECE7| LDA.w $067C
|07ECEA| STA.w WRDIVB

|07ECED| NOP
|07ECEE| NOP
|07ECEF| NOP
|07ECF0| NOP
|07ECF1| NOP
|07ECF2| NOP

|07ECF3| REP #$20

|07ECF5| LDA.w RDDIV
|07ECF8| LSR A

|07ECF9| SEP #$20

|07ECFB| TAX

|07ECFC| LDY.w .multiplier_closed,X

|07ECFF| LDA.w $067E
|07ED02| BEQ .not_opening

|07ED04| LDY.w .multiplier_opening,X

.not_opening
|07ED07| STY.b $06
|07ED09| STY.w WRMPYA

|07ED0C| LDA.w $067C
|07ED0F| STA.w WRMPYB

|07ED12| NOP
|07ED13| NOP
|07ED14| NOP
|07ED15| NOP

|07ED16| LDA.w RDMPYH
|07ED19| STA.b $08

|07ED1B| STZ.b $09
|07ED1D| STZ.b $07

|07ED1F| REP #$30

|07ED21| LDA.w $067E
|07ED24| AND.w #$00FF
|07ED27| BEQ .exit

|07ED29| ASL.b $08

.exit
|07ED2B| RTS

;===================================================================================================

FindFreeMovingBlockSlot:
|07ED2C| LDX.b #$01

.next
|07ED2E| LDA.w $05FC,X
|07ED31| BNE .taken

|07ED33| TYA
|07ED34| INC A
|07ED35| STA.w $05FC,X

|07ED38| CLC

|07ED39| RTS

.taken
|07ED3A| DEX
|07ED3B| BPL .next

|07ED3D| SEC

|07ED3E| RTS

;===================================================================================================

InitializePushBlock:
|07ED3F| PHX

|07ED40| STX.b $72

|07ED42| LDA.b $0E
|07ED44| PHA

|07ED45| REP #$20

|07ED47| LDA.w $0540,X
|07ED4A| AND.w #$007E
|07ED4D| ASL A
|07ED4E| ASL A
|07ED4F| STA.b $00

|07ED51| LDA.w $0540,X
|07ED54| AND.w #$1F80
|07ED57| LSR A
|07ED58| LSR A
|07ED59| LSR A
|07ED5A| LSR A
|07ED5B| STA.b $02

|07ED5D| SEP #$20

|07ED5F| LDA.b $0E
|07ED61| ASL A
|07ED62| TAX

|07ED63| LDA.b $00
|07ED65| STA.w $05E4,X

|07ED68| LDA.b $01
|07ED6A| CLC
|07ED6B| ADC.w $062D
|07ED6E| STA.w $05E0,X
|07ED71| STA.b $01

|07ED73| LDA.b $02
|07ED75| STA.w $05F0,X

|07ED78| LDA.b $03
|07ED7A| CLC
|07ED7B| ADC.w $062F
|07ED7E| STA.w $05EC,X
|07ED81| STA.b $03

|07ED83| STZ.w $05E8,X
|07ED86| STZ.w $05F4,X

|07ED89| LDA.b $AE
|07ED8B| CMP.b #$26
|07ED8D| BEQ .dont_push

|07ED8F| LDX.b $72

|07ED91| LDA.w $0500,X
|07ED94| BNE .dont_push

|07ED96| LDY.b #$00
|07ED98| JSR AttemptToPushTheBlock
|07ED9B| BCC .do_the_push

.dont_push
|07ED9D| PLA
|07ED9E| TAX

|07ED9F| STZ.w $05FC,X

|07EDA2| PLX

|07EDA3| SEC

|07EDA4| RTS

;---------------------------------------------------------------------------------------------------

.do_the_push
|07EDA5| LDA.b #$22 ; SFX2.22
|07EDA7| JSR PlayLinkSFX2Panned

|07EDAA| PLA
|07EDAB| STA.b $0E

|07EDAD| PLX

|07EDAE| LDA.b #$01
|07EDB0| STA.w $0500,X

|07EDB3| CLC

|07EDB4| RTS

;===================================================================================================

PushBlock_Slide:
|07EDB5| SEP #$30

|07EDB7| PHB
|07EDB8| PHK
|07EDB9| PLB

|07EDBA| LDA.b $11
|07EDBC| BNE .exit

|07EDBE| STY.b $00

|07EDC0| LDX.b #$01

|07EDC2| LDA.w $05FC,X
|07EDC5| DEC A
|07EDC6| ASL A
|07EDC7| CMP.b $00
|07EDC9| BEQ .matched

|07EDCB| LDX.b #$00

.matched
|07EDCD| TXA
|07EDCE| ASL A
|07EDCF| TAY

|07EDD0| LDA.b #$09
|07EDD2| STA.w $02C4
|07EDD5| STZ.w $02C3

|07EDD8| JSR PushBlock_ApplyVelocity

|07EDDB| LDA.w $05F0,Y
|07EDDE| STA.b $72

|07EDE0| LDA.w $05EC,Y
|07EDE3| STA.b $73

|07EDE5| LDA.w $05E4,Y
|07EDE8| STA.b $74

|07EDEA| LDA.w $05E0,Y
|07EDED| STA.b $75

|07EDEF| JSR PushBlock_HandleCollision

.exit
|07EDF2| PLB

|07EDF3| RTL

;===================================================================================================

pool PushBlock_HandleFalling

.fall_timer
|07EDF4| db $09, $09, $09, $09, $09

endpool

;---------------------------------------------------------------------------------------------------

PushBlock_HandleFalling:
|07EDF9| SEP #$30

|07EDFB| PHB
|07EDFC| PHK
|07EDFD| PLB

|07EDFE| PHY

|07EDFF| STY.b $0E

|07EE01| DEC.w $02C4
|07EE04| BPL .exit

|07EE06| INC.w $02C3

|07EE09| LDX.w $02C3

|07EE0C| LDA.w .fall_timer,X
|07EE0F| STA.w $02C4

|07EE12| CPX.b #$04
|07EE14| BNE .exit

|07EE16| TYX

|07EE17| STZ.w $0500,X

|07EE1A| STZ.w $02C3

|07EE1D| LDX.b #$01

|07EE1F| LDA.w $05FC,X
|07EE22| DEC A
|07EE23| ASL A
|07EE24| CMP.b $0E
|07EE26| BEQ .matched

|07EE28| LDX.b #$00

.matched
|07EE2A| STZ.w $05FC,X

.exit
|07EE2D| PLY

|07EE2E| PLB

|07EE2F| RTL

;===================================================================================================

pool PushBlock_ApplyVelocity

.block_speed
|07EE30| db $0C

.direction_mask
|07EE31| db $08, $04, $02, $01

endpool

;---------------------------------------------------------------------------------------------------

PushBlock_ApplyVelocity:
|07EE35| STZ.b $27
|07EE37| STZ.b $28

|07EE39| LDA.w .block_speed
|07EE3C| STA.b $0A
|07EE3E| STA.b $0B

|07EE40| LDA.b #$03
|07EE42| STA.b $0C

|07EE44| LDA.b #$02
|07EE46| STA.b $0D

|07EE48| LDA.w $05F8,Y
|07EE4B| LSR A
|07EE4C| TAX

|07EE4D| LDA.w .direction_mask,X
|07EE50| STA.b $00

;---------------------------------------------------------------------------------------------------

|07EE52| LDX.b #$01

.next_direction_check
|07EE54| LDA.b $00
|07EE56| AND.b $0C
|07EE58| BEQ .skip_direction

|07EE5A| AND.b $0D
|07EE5C| BEQ .direction_positive

|07EE5E| LDA.b $0A,X
|07EE60| EOR.b #$FF
|07EE62| INC A
|07EE63| STA.b $0A,X

.direction_positive
|07EE65| LDA.b $0A,X
|07EE67| STA.b $27,X

|07EE69| BRA .direction_found

;---------------------------------------------------------------------------------------------------

.skip_direction
|07EE6B| ASL.b $0C
|07EE6D| ASL.b $0C

|07EE6F| ASL.b $0D
|07EE71| ASL.b $0D

|07EE73| DEX
|07EE74| BPL .next_direction_check

;---------------------------------------------------------------------------------------------------

.direction_found
|07EE76| LDA.b $27,X

|07EE78| ASL A
|07EE79| ASL A
|07EE7A| ASL A
|07EE7B| ASL A

|07EE7C| CLC
|07EE7D| ADC.w $05F4,Y
|07EE80| STA.w $05F4,Y

|07EE83| PHP

|07EE84| CPX.b #$01
|07EE86| BEQ .push_block_horizontally

|07EE88| LDX.b #$00

|07EE8A| LDA.b $27

|07EE8C| LSR A
|07EE8D| LSR A
|07EE8E| LSR A
|07EE8F| LSR A

|07EE90| CMP.b #$08
|07EE92| BCC .pushing_down

|07EE94| ORA.b #$F0
|07EE96| LDX.b #$FF

.pushing_down
|07EE98| PLP
|07EE99| ADC.w $05F0,Y
|07EE9C| STA.w $05F0,Y

|07EE9F| TXA
|07EEA0| ADC.w $05EC,Y
|07EEA3| STA.w $05EC,Y

|07EEA6| LDA.w $05F0,Y
|07EEA9| AND.b #$0F
|07EEAB| BRA .compare_to_target

;---------------------------------------------------------------------------------------------------

.push_block_horizontally
|07EEAD| LDX.b #$00

|07EEAF| LDA.b $28
|07EEB1| LSR A
|07EEB2| LSR A
|07EEB3| LSR A
|07EEB4| LSR A
|07EEB5| CMP.b #$08
|07EEB7| BCC .pushing_right

|07EEB9| ORA.b #$F0

|07EEBB| LDX.b #$FF

.pushing_right
|07EEBD| PLP
|07EEBE| ADC.w $05E4,Y
|07EEC1| STA.w $05E4,Y

|07EEC4| TXA
|07EEC5| ADC.w $05E0,Y
|07EEC8| STA.w $05E0,Y

|07EECB| LDA.w $05E4,Y
|07EECE| AND.b #$0F

;---------------------------------------------------------------------------------------------------

.compare_to_target
|07EED0| TYX

|07EED1| CMP.w $05E8,X
|07EED4| BNE .not_at_target

|07EED6| TXA
|07EED7| LSR A
|07EED8| TAX

|07EED9| LDA.w $05FC,X
|07EEDC| DEC A
|07EEDD| ASL A
|07EEDE| TAX

|07EEDF| INC.w $0500,X

|07EEE2| LDA.b $50
|07EEE4| AND.b #$FB
|07EEE6| STA.b $50

|07EEE8| LDA.b $48
|07EEEA| AND.b #$FB
|07EEEC| STA.b $48

;---------------------------------------------------------------------------------------------------

.not_at_target
|07EEEE| SEP #$20

|07EEF0| LDA.w $05E4,Y
|07EEF3| STA.b $00

|07EEF5| LDA.w $05E0,Y
|07EEF8| STA.b $01

|07EEFA| LDA.w $05F0,Y
|07EEFD| STA.b $02

|07EEFF| LDA.w $05EC,Y
|07EF02| STA.b $03

;---------------------------------------------------------------------------------------------------

|07EF04| PHX

|07EF05| LDX.b #$0F

.next_sprite
|07EF07| LDA.w $0DD0,X
|07EF0A| CMP.b #$09
|07EF0C| BCC .skip_sprite

|07EF0E| LDA.w $0D10,X
|07EF11| STA.b $04

|07EF13| LDA.w $0D30,X
|07EF16| STA.b $05

|07EF18| LDA.w $0D00,X
|07EF1B| STA.b $06

|07EF1D| LDA.w $0D20,X
|07EF20| STA.b $07

|07EF22| REP #$20

|07EF24| LDA.b $00
|07EF26| SEC
|07EF27| SBC.b $04
|07EF29| CLC
|07EF2A| ADC.w #$0010
|07EF2D| CMP.w #$0020
|07EF30| BCS .skip_sprite

|07EF32| LDA.b $02
|07EF34| SEC
|07EF35| SBC.b $06
|07EF37| CLC
|07EF38| ADC.w #$0010
|07EF3B| CMP.w #$0020
|07EF3E| BCS .skip_sprite

|07EF40| SEP #$20

|07EF42| LDA.b #$08
|07EF44| STA.w $0EA0,X

|07EF47| PHY

|07EF48| LDA.w $05F8,Y
|07EF4B| LSR A
|07EF4C| TAY

|07EF4D| LDA.w .recoil_x,Y
|07EF50| STA.w $0F40,X

|07EF53| LDA.w .recoil_y,Y
|07EF56| STA.w $0F30,X

|07EF59| PLY

.skip_sprite
|07EF5A| SEP #$20

|07EF5C| DEX
|07EF5D| BPL .next_sprite

|07EF5F| PLX

|07EF60| RTS

;---------------------------------------------------------------------------------------------------

.recoil_x
|07EF61| db   0 ; up
|07EF62| db   0 ; down
|07EF63| db -32 ; left
|07EF64| db  32 ; right

.recoil_y
|07EF65| db -32 ; up
|07EF66| db  32 ; down
|07EF67| db   0 ; left
|07EF68| db   0 ; right

;===================================================================================================

pool PushBlock_HandleCollision

.link_offset_on_axis
|07EF69| dw $0008 ; up
|07EF6B| dw $0018 ; down
|07EF6D| dw $0000 ; left
|07EF6F| dw $0010 ; right

.link_offset_perpendicular_bottom
|07EF71| dw $0000 ; up
|07EF73| dw $0000 ; down
|07EF75| dw $0008 ; left
|07EF77| dw $0008 ; right

.link_offset_perpendicular_top
|07EF79| dw $000F ; up
|07EF7B| dw $000F ; down
|07EF7D| dw $0017 ; left
|07EF7F| dw $0017 ; right

.block_offset_on_axis
|07EF81| dw $000F ; up
|07EF83| dw $0000 ; down
|07EF85| dw $000F ; left
|07EF87| dw $0000 ; right

.block_offset_perpendicular_bottom
|07EF89| dw $0000 ; up
|07EF8B| dw $0000 ; down
|07EF8D| dw $0000 ; left
|07EF8F| dw $0000 ; right

.block_offset_perpendicular_top
|07EF91| dw $000F ; up
|07EF93| dw $000F ; down
|07EF95| dw $000F ; left
|07EF97| dw $000F ; right

;---------------------------------------------------------------------------------------------------

.link_coord_address_on_axis
|07EF99| dw $0020 ; up
|07EF9B| dw $0020 ; down
|07EF9D| dw $0022 ; left
|07EF9F| dw $0022 ; right

.link_coord_address_perpendicular
|07EFA1| dw $0022 ; up
|07EFA3| dw $0022 ; down
|07EFA5| dw $0020 ; left
|07EFA7| dw $0020 ; right

;---------------------------------------------------------------------------------------------------

.block_coords_address_on_axis
|07EFA9| dw $0072 ; up
|07EFAB| dw $0072 ; down
|07EFAD| dw $0074 ; left
|07EFAF| dw $0074 ; right

.block_coords_address_perpendicular
|07EFB1| dw $0074 ; up
|07EFB3| dw $0074 ; down
|07EFB5| dw $0072 ; left
|07EFB7| dw $0072 ; right

endpool

;---------------------------------------------------------------------------------------------------

PushBlock_HandleCollision:
|07EFB9| PHY

|07EFBA| STY.b $0E
|07EFBC| STZ.b $0F

|07EFBE| LDA.b $21
|07EFC0| STA.b $40

|07EFC2| LDA.b $23
|07EFC4| STA.b $41

|07EFC6| REP #$20

|07EFC8| LDA.b $67
|07EFCA| AND.w #$000F

|07EFCD| LDY.b #$06

.check_next_bit
|07EFCF| LSR A
|07EFD0| BCS .direction_match

|07EFD2| DEY
|07EFD3| DEY
|07EFD4| BPL .check_next_bit

|07EFD6| BRL .no_pushback

;---------------------------------------------------------------------------------------------------

.direction_match
|07EFD9| LDA.b $0E
|07EFDB| PHA

|07EFDC| LDA.w .link_coord_address_perpendicular,Y
|07EFDF| STA.b $0C

|07EFE1| LDA.w .block_coords_address_perpendicular,Y
|07EFE4| STA.b $0E

|07EFE6| LDA.b ($0C)
|07EFE8| CLC
|07EFE9| ADC.w .link_offset_perpendicular_bottom,Y
|07EFEC| STA.b $00

|07EFEE| LDA.b ($0C)
|07EFF0| CLC
|07EFF1| ADC.w .link_offset_perpendicular_top,Y
|07EFF4| STA.b $02

|07EFF6| LDA.b ($0E)
|07EFF8| CLC
|07EFF9| ADC.w .block_offset_perpendicular_bottom,Y
|07EFFC| STA.b $04

|07EFFE| LDA.b ($0E)
|07F000| CLC
|07F001| ADC.w .block_offset_perpendicular_top,Y
|07F004| STA.b $06

;---------------------------------------------------------------------------------------------------

|07F006| LDA.w .link_coord_address_on_axis,Y
|07F009| STA.b $0C

|07F00B| LDA.w .block_coords_address_on_axis,Y
|07F00E| STA.b $0E

|07F010| LDA.b ($0C)
|07F012| CLC
|07F013| ADC.w .link_offset_on_axis,Y
|07F016| STA.b $08

|07F018| LDA.b ($0E)
|07F01A| CLC
|07F01B| ADC.w .block_offset_on_axis,Y
|07F01E| STA.b $0A

;---------------------------------------------------------------------------------------------------

|07F020| LDA.b $48
|07F022| AND.w #$FFFB
|07F025| STA.b $48

|07F027| PLA
|07F028| STA.b $0E

|07F02A| LDA.b $00
|07F02C| CMP.b $04
|07F02E| BCC .not_in_block_on_axis

|07F030| CMP.b $06
|07F032| BCC .in_block_on_axis

.not_in_block_on_axis
|07F034| LDA.b $02
|07F036| CMP.b $04
|07F038| BCC .no_pushback

|07F03A| CMP.b $06
|07F03C| BCS .no_pushback

;---------------------------------------------------------------------------------------------------

.in_block_on_axis
|07F03E| PHY
|07F03F| PHX

|07F040| LDX.b $0E

|07F042| LDA.b $2F
|07F044| AND.w #$00FF
|07F047| CMP.w $05F8,X
|07F04A| BNE .direction_mismatch

|07F04C| LDY.b #$01

|07F04E| TXA
|07F04F| LSR A
|07F050| TAX

|07F051| LDA.w $05FC,X
|07F054| BEQ .dont_flag_pushing_block

|07F056| LDY.b #$04

.dont_flag_pushing_block
|07F058| TYA
|07F059| AND.w #$00FF
|07F05C| TSB.b $48

;---------------------------------------------------------------------------------------------------

.direction_mismatch
|07F05E| PLX
|07F05F| PLY

|07F060| TYA
|07F061| AND.w #$0002
|07F064| BEQ .pushing_up_or_left

|07F066| LDA.b $08
|07F068| SEC
|07F069| SBC.b $0A
|07F06B| BCC .no_pushback

|07F06D| CMP.w #$0008
|07F070| BCS .no_pushback

|07F072| EOR.w #$FFFF
|07F075| INC A
|07F076| STA.b $00

|07F078| CLC
|07F079| ADC.b ($0C)
|07F07B| STA.b ($0C)

|07F07D| BRA .set_axis

;---------------------------------------------------------------------------------------------------

.pushing_up_or_left
|07F07F| LDA.b $08
|07F081| SEC
|07F082| SBC.b $0A
|07F084| CMP.w #$FFF8
|07F087| BCC .no_pushback

|07F089| EOR.w #$FFFF
|07F08C| INC A
|07F08D| STA.b $00

|07F08F| CLC
|07F090| ADC.b ($0C)
|07F092| STA.b ($0C)

;---------------------------------------------------------------------------------------------------

.set_axis
|07F094| SEP #$20

|07F096| LDX.b #$00

|07F098| TYA
|07F099| AND.b #$04
|07F09B| BEQ .vertical

|07F09D| INX

.vertical
|07F09E| LDA.b $30,X
|07F0A0| CLC
|07F0A1| ADC.b $00
|07F0A3| STA.b $30,X

;---------------------------------------------------------------------------------------------------

.no_pushback
|07F0A5| SEP #$20

|07F0A7| JSR HandleIndoorCameraAndDoors

|07F0AA| PLY

|07F0AB| RTS

;===================================================================================================

DrawAllPushBlocks:
|07F0AC| PHB
|07F0AD| PHK
|07F0AE| PLB

|07F0AF| LDA.w $05FC
|07F0B2| ORA.w $05FD
|07F0B5| BEQ .exit

|07F0B7| LDX.b #$01

.next
|07F0B9| LDA.w $05FC,X
|07F0BC| BEQ .skip

|07F0BE| TXA
|07F0BF| ASL A
|07F0C0| TAY

|07F0C1| PHX

|07F0C2| JSR DrawSinglePushBlock

|07F0C5| PLX

.skip
|07F0C6| DEX
|07F0C7| BPL .next

.exit
|07F0C9| PLB

|07F0CA| RTL

;===================================================================================================

pool DrawSinglePushBlock

.unreachable
|07F0CB| db $0C

.step
|07F0CC| db  12,  12,  12, $FF

.index
|07F0D0| db   0,   1,   2,   3
|07F0D4| db   4,   0,   0,   0
|07F0D8| db   0

endpool

;---------------------------------------------------------------------------------------------------

DrawSinglePushBlock:
|07F0D9| PHY

|07F0DA| LDA.b #$04
|07F0DC| JSL AllocateOAMInRegionB

|07F0E0| PLY

|07F0E1| LDA.w $05F0,Y
|07F0E4| STA.b $00

|07F0E6| LDA.w $05EC,Y
|07F0E9| STA.b $01

|07F0EB| LDA.w $05E4,Y
|07F0EE| STA.b $02

|07F0F0| LDA.w $05E0,Y
|07F0F3| STA.b $03

|07F0F5| REP #$20

|07F0F7| LDA.b $00
|07F0F9| SEC
|07F0FA| SBC.b $E8
|07F0FC| DEC A
|07F0FD| STA.b $00

|07F0FF| LDA.b $02
|07F101| SEC
|07F102| SBC.b $E2
|07F104| STA.b $02

|07F106| SEP #$20

|07F108| PHY

|07F109| LDY.w $02C3

|07F10C| LDA.w .index,Y
|07F10F| TAX

|07F110| LDY.b #$00

|07F112| LDA.w .step,X
|07F115| CMP.b #$FF
|07F117| BNE .draw

|07F119| BRA .exit

;---------------------------------------------------------------------------------------------------

.draw
|07F11B| XBA

|07F11C| LDA.b $02
|07F11E| STA.b ($90),Y

|07F120| INY
|07F121| LDA.b $00
|07F123| STA.b ($90),Y

|07F125| INY
|07F126| XBA
|07F127| STA.b ($90),Y

|07F129| INY
|07F12A| LDA.b #$20
|07F12C| STA.b ($90),Y

|07F12E| INY

|07F12F| TYA

|07F130| SEC
|07F131| SBC.b #$04

|07F133| LSR A
|07F134| LSR A

|07F135| TAY

|07F136| LDA.b #$02
|07F138| STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

.exit
|07F13A| PLY

|07F13B| RTS

;===================================================================================================

InitializeLink:
|07F13C| PHB
|07F13D| PHK
|07F13E| PLB

|07F13F| LDA.b #$02
|07F141| STA.b $2F

|07F143| STZ.b $26

|07F145| STZ.w $0301
|07F148| STZ.w $037A

|07F14B| STZ.w $020B

|07F14E| STZ.w $0350

|07F151| STZ.w $030D
|07F154| STZ.w $030E

|07F157| STZ.w $030A
|07F15A| STZ.w $02E1

|07F15D| STZ.b $3B

|07F15F| LDA.b $3A
|07F161| AND.b #$BF
|07F163| STA.b $3A

|07F165| STZ.w $0308
|07F168| STZ.w $0309
|07F16B| STZ.w $0376

|07F16E| JSL ResetSwimmingState

|07F172| LDA.b $50
|07F174| AND.b #$FE
|07F176| STA.b $50

|07F178| STZ.b $25
|07F17A| STZ.b $4D
|07F17C| STZ.b $46

|07F17E| STZ.w $031F
|07F181| STZ.w $0360
|07F184| STZ.w $02DA

|07F187| STZ.b $55

|07F189| JSR ForciblyUnequipCape_quietly
|07F18C| JSR ResetSwordAndItemUsage

|07F18F| STZ.w $037B
|07F192| STZ.w $0300

|07F195| LDA.b $67
|07F197| AND.b #$F0
|07F199| STA.b $67

|07F19B| STZ.w $02F5
|07F19E| STZ.w $0079

|07F1A1| PLB

|07F1A2| RTL

;===================================================================================================

ResetLinkProperties_A:
|07F1A3| STZ.b $26
|07F1A5| STZ.b $67

|07F1A7| STZ.w $031F
|07F1AA| STZ.w $034A

|07F1AD| JSL ResetSwimmingState

|07F1B1| STZ.w $02E1
|07F1B4| STZ.w $031F
|07F1B7| STZ.w $03DB
|07F1BA| STZ.w $02E0

|07F1BD| STZ.b $56

|07F1BF| STZ.w $03F5
|07F1C2| STZ.w $03F7
|07F1C5| STZ.w $03FC
|07F1C8| STZ.w $03F8
|07F1CB| STZ.w $03FA

|07F1CE| STZ.w $03E9
|07F1D1| STZ.w $0373
|07F1D4| STZ.w $031E

|07F1D7| STZ.w $02F2
|07F1DA| STZ.w $02F8

|07F1DD| STZ.w $02EA
|07F1E0| STZ.w $02E9

|07F1E3| STZ.w $02DB

;===================================================================================================

ResetLinkProperties_B:
|07F1E6| STZ.w $02F5

|07F1E9| STZ.w $0079
|07F1EC| STZ.w $0302
|07F1EF| STZ.w $02F4

|07F1F2| STZ.b $48

|07F1F4| STZ.b $5A
|07F1F6| STZ.b $5B
|07F1F8| STZ.b $5B

;===================================================================================================

ResetLinkProperties_C:
|07F1FA| STZ.w $036C

|07F1FD| STZ.w $031C
|07F200| STZ.w $031D

|07F203| STZ.w $0315
|07F206| STZ.w $03EF

|07F209| STZ.w $02E3
|07F20C| STZ.w $02F6

|07F20F| STZ.w $0301
|07F212| STZ.w $037A

|07F215| STZ.w $020B

|07F218| STZ.w $0350

|07F21B| STZ.w $030D
|07F21E| STZ.w $030E
|07F221| STZ.w $030A

|07F224| STZ.b $3B
|07F226| STZ.b $3A
|07F228| STZ.b $3C

|07F22A| STZ.w $0308
|07F22D| STZ.w $0309

|07F230| STZ.w $0376

|07F233| STZ.b $50
|07F235| STZ.b $4D
|07F237| STZ.b $46

|07F239| STZ.w $0360
|07F23C| STZ.w $02DA

|07F23F| STZ.b $55

|07F241| JSR ResetSwordAndItemUsage

|07F244| STZ.w $037B
|07F247| STZ.w $0300
|07F24A| STZ.w $037E

|07F24D| STZ.w $02EC

|07F250| STZ.w $0314
|07F253| STZ.w $03F8

|07F256| STZ.w $02FA

|07F259| RTL

;===================================================================================================

AnimateStairClimbAndSFX:
|07F25A| PHB
|07F25B| PHK
|07F25C| PLB

|07F25D| LDX.b #$09

.clear_sparkles
|07F25F| LDA.w $0C4A,X
|07F262| CMP.b #$0D ; ANCILLA 0D
|07F264| BNE .not_a_sparkle

|07F266| STZ.w $0C4A,X

.not_a_sparkle
|07F269| DEX
|07F26A| BPL .clear_sparkles

;---------------------------------------------------------------------------------------------------

|07F26C| LDA.b $2E
|07F26E| CMP.b #$05
|07F270| BCC .dont_reset_anim_step

|07F272| STZ.b $2E

.dont_reset_anim_step
|07F274| STZ.b $2A
|07F276| STZ.b $2B

|07F278| STZ.w $030A

|07F27B| LDA.b #$1C
|07F27D| STA.w $0371

|07F280| LDA.b #$20
|07F282| STA.w $0378

|07F285| LDA.b #$01
|07F287| STA.w $037B

;---------------------------------------------------------------------------------------------------

|07F28A| LDA.w $0462
|07F28D| AND.b #$04
|07F28F| BEQ .upwards_sfx

|07F291| LDA.b #$18 ; SFX2.18
|07F293| JSR PlayLinkSFX2Panned

|07F296| BRA .sfx_set

.upwards_sfx
|07F298| LDA.b #$16 ; SFX2.16
|07F29A| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.sfx_set
|07F29D| STZ.b $01

|07F29F| LDX.b #$10

|07F2A1| LDA.w $0462
|07F2A4| AND.b #$04
|07F2A6| BEQ .going_up

|07F2A8| LDX.b #$F1

|07F2AA| LDA.b #$FF
|07F2AC| STA.b $01

.going_up
|07F2AE| STX.b $00

|07F2B0| REP #$20

|07F2B2| LDA.b $22
|07F2B4| CLC
|07F2B5| ADC.b $00
|07F2B7| STA.b $53

|07F2B9| LDA.b $20
|07F2BB| STA.b $51

|07F2BD| SEP #$20

|07F2BF| PLB

|07F2C0| RTL

;===================================================================================================

HandleLinkOnSpiralStairs:
|07F2C1| REP #$20

|07F2C3| LDA.b $22
|07F2C5| STA.w $0FC2

|07F2C8| LDA.b $20
|07F2CA| STA.w $0FC4

|07F2CD| SEP #$20

|07F2CF| LDA.w $030A
|07F2D2| BEQ .please_continue

|07F2D4| RTL

;---------------------------------------------------------------------------------------------------

.please_continue
|07F2D5| STZ.w $0373

|07F2D8| STZ.b $46
|07F2DA| STZ.b $4D

|07F2DC| PHB
|07F2DD| PHK
|07F2DE| PLB

|07F2DF| LDA.w $0462
|07F2E2| AND.b #$04
|07F2E4| BEQ .going_up_a

;---------------------------------------------------------------------------------------------------

.going_down_a
|07F2E6| LDA.b #$FE
|07F2E8| STA.b $27

|07F2EA| DEC.w $0371
|07F2ED| BPL .down_dont_reset

|07F2EF| STZ.w $0371

|07F2F2| LDA.b #$00
|07F2F4| STA.b $27

|07F2F6| LDA.b #$FE
|07F2F8| STA.b $28

.down_dont_reset
|07F2FA| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.going_up_a
|07F2FC| LDA.b #$FE
|07F2FE| STA.b $27

|07F300| DEC.w $0371
|07F303| BPL .continue_a

|07F305| STZ.w $0371

|07F308| LDA.b #$FE
|07F30A| STA.b $27

|07F30C| LDA.b #$02
|07F30E| STA.b $28

;---------------------------------------------------------------------------------------------------

.continue_a
|07F310| JSL FindArbitraryLandingSpot
|07F314| JSL HandleLinkAnimation_StartWithDash

|07F318| LDA.w $0371
|07F31B| BNE .dont_reset_direction

|07F31D| DEC.w $0378
|07F320| BPL .dont_reset_direction

|07F322| STZ.w $0378

|07F325| LDX.b #$04

|07F327| LDA.w $0462
|07F32A| AND.b #$04
|07F32C| BNE .not_going_down_a

|07F32E| LDX.b #$06

.not_going_down_a
|07F330| STX.b $2F

;---------------------------------------------------------------------------------------------------

.dont_reset_direction
|07F332| LDA.b $22
|07F334| SEC
|07F335| SBC.b $53
|07F337| BPL .positive_x

|07F339| EOR.b #$FF
|07F33B| INC A

.positive_x
|07F33C| BNE .exit

|07F33E| REP #$20

|07F340| JSL RepositionAfterSpiralStairs

|07F344| SEP #$20

|07F346| LDA.l $7EF3CC
|07F34A| BEQ .no_follower

|07F34C| JSL InitializeFollower

.no_follower
|07F350| LDA.b #$F8
|07F352| STA.b $00

|07F354| LDA.b #$FF
|07F356| STA.b $01

|07F358| LDA.w $0462
|07F35B| AND.b #$04
|07F35D| BNE .not_going_down_b

|07F35F| LDA.b #$0C
|07F361| STA.b $00
|07F363| STZ.b $01

.not_going_down_b
|07F365| REP #$20

|07F367| LDA.b $22
|07F369| CLC
|07F36A| ADC.b $00
|07F36C| STA.b $53

;---------------------------------------------------------------------------------------------------

|07F36E| SEP #$20

|07F370| LDA.b #$01
|07F372| STA.w $030A

|07F375| LDA.b #$06
|07F377| STA.w $0378

|07F37A| LDA.w $0462
|07F37D| AND.b #$04
|07F37F| BNE .different_stair_sound

;---------------------------------------------------------------------------------------------------

|07F381| LDA.b #$17 ; SFX2.17
|07F383| JSR PlayLinkSFX2Panned

|07F386| BRA .exit

.different_stair_sound
|07F388| LDA.b #$19 ; SFX2.19
|07F38A| JSR PlayLinkSFX2Panned

;---------------------------------------------------------------------------------------------------

.exit
|07F38D| SEP #$20

|07F38F| PLB

|07F390| RTL

;===================================================================================================

FindSpiralStairsLandingSpot:
|07F391| PHB
|07F392| PHK
|07F393| PLB

|07F394| STZ.w $0373

|07F397| STZ.b $46
|07F399| STZ.b $4D

|07F39B| STZ.w $037B

|07F39E| REP #$20

|07F3A0| LDA.b $22
|07F3A2| STA.w $0FC2

|07F3A5| LDA.b $20
|07F3A7| STA.w $0FC4

|07F3AA| SEP #$20

|07F3AC| DEC.w $0378
|07F3AF| BPL .dont_change_direction

|07F3B1| STZ.w $0378

|07F3B4| LDA.b #$02
|07F3B6| STA.b $2F

.dont_change_direction
|07F3B8| LDA.b #$00
|07F3BA| STA.b $27

|07F3BC| LDA.b #$04
|07F3BE| STA.b $28

|07F3C0| LDA.w $0462
|07F3C3| AND.b #$04
|07F3C5| BEQ .going_up

|07F3C7| LDA.b #$02
|07F3C9| STA.b $27

|07F3CB| LDA.b #$FC
|07F3CD| STA.b $28

;---------------------------------------------------------------------------------------------------

.going_up
|07F3CF| LDA.w $030A
|07F3D2| CMP.b #$02
|07F3D4| BNE .dont_recoil

|07F3D6| LDA.b #$10
|07F3D8| STA.b $27
|07F3DA| STZ.b $28

.dont_recoil
|07F3DC| JSL FindArbitraryLandingSpot
|07F3E0| JSL HandleLinkAnimation_StartWithDash

|07F3E4| LDA.b $22
|07F3E6| CMP.b $53
|07F3E8| BNE .exit

|07F3EA| LDA.b #$02
|07F3EC| STA.w $030A

.exit
|07F3EF| SEP #$20

|07F3F1| PLB

|07F3F2| RTL

;===================================================================================================

ResetPushTimer:
|07F3F3| PHB
|07F3F4| PHK
|07F3F5| PLB

|07F3F6| LDA.b #$07
|07F3F8| STA.w $0371

|07F3FB| PLB

|07F3FC| RTL

;===================================================================================================

UNREACHABLE_07F3FD:
|07F3FD| PHB
|07F3FE| PHK
|07F3FF| PLB

|07F400| REP #$20

|07F402| LDA.b $22
|07F404| STA.w $0FC2

|07F407| LDA.b $20
|07F409| STA.w $0FC4

|07F40C| SEP #$20

|07F40E| STZ.b $28

;---------------------------------------------------------------------------------------------------

|07F410| LDY.b #$08

|07F412| LDA.b $11
|07F414| CMP.b #$12
|07F416| BNE .set_recoil

|07F418| LDY.b #$FE

|07F41A| LDA.w $0462
|07F41D| AND.b #$04
|07F41F| BEQ .set_recoil

|07F421| LDY.b #$FA

;---------------------------------------------------------------------------------------------------

.set_recoil
|07F423| STY.b $27

|07F425| JSL FindArbitraryLandingSpot
|07F429| JSL HandleLinkAnimation_StartWithDash

|07F42D| PLB

|07F42E| RTL

;===================================================================================================

HandleIndoorCameraAndDoors_long:
|07F42F| PHB
|07F430| PHK
|07F431| PLB

|07F432| PHX
|07F433| JSR HandleIndoorCameraAndDoors
|07F436| PLX

|07F437| PLB

|07F438| RTL

;===================================================================================================

CheckForEdgeScreenTransition:
|07F439| PHB
|07F43A| PHK
|07F43B| PLB

|07F43C| LDA.b $5D

|07F43E| CMP.b #$03 ; LINKSTATE 03
|07F440| BEQ .prevent_transition

|07F442| CMP.b #$08 ; LINKSTATE 08
|07F444| BEQ .prevent_transition

|07F446| CMP.b #$09 ; LINKSTATE 09
|07F448| BEQ .prevent_transition

|07F44A| CMP.b #$0A ; LINKSTATE 0A
|07F44C| BEQ .prevent_transition

|07F44E| LDA.b $46
|07F450| BEQ .allow

;---------------------------------------------------------------------------------------------------

.prevent_transition
|07F452| STZ.b $27
|07F454| STZ.b $28

|07F456| LDA.b #$03
|07F458| STA.w $02C6

|07F45B| REP #$20

|07F45D| LDA.w $0FC2
|07F460| STA.b $22

|07F462| LDA.w $0FC4
|07F465| STA.b $20

|07F467| SEP #$20
|07F469| SEC

|07F46A| PLB

|07F46B| RTL

;---------------------------------------------------------------------------------------------------

.allow
|07F46C| CLC

|07F46D| PLB

|07F46E| RTL

;===================================================================================================

ValidateAbilityToNag:
|07F46F| LDA.b $5D

|07F471| CMP.b #$00 ; LINKSTATE 00
|07F473| BEQ .do_check

|07F475| CMP.b #$04 ; LINKSTATE 04
|07F477| BEQ .do_check

|07F479| CMP.b #$11 ; LINKSTATE 11
|07F47B| BNE .fail

.do_check
|07F47D| LDA.b $3A
|07F47F| AND.b #$80
|07F481| ORA.w $0377
|07F484| ORA.w $0301
|07F487| ORA.w $037A
|07F48A| ORA.w $02EC
|07F48D| ORA.w $0314
|07F490| ORA.w $0308
|07F493| ORA.w $0376
|07F496| BNE .fail

.succeed
|07F498| SEC

|07F499| RTL

.fail
|07F49A| CLC

|07F49B| RTL

;===================================================================================================

ApproachTheTriforce:
|07F49C| PHB
|07F49D| PHK
|07F49E| PLB

|07F49F| LDA.b $20
|07F4A1| CMP.b #$98
|07F4A3| BCC .still_walking

|07F4A5| CMP.b #$A9
|07F4A7| BCS .keep_speed

|07F4A9| LDA.b #$14
|07F4AB| STA.b $5E

.keep_speed
|07F4AD| LDA.b #$08

|07F4AF| STA.b $67
|07F4B1| STA.b $26

|07F4B3| STZ.b $2F

|07F4B5| LDA.b #$40
|07F4B7| STA.b $3D

|07F4B9| BRA .exit

.still_walking
|07F4BB| STZ.b $2E
|07F4BD| STZ.b $67
|07F4BF| STZ.b $26

|07F4C1| DEC.b $3D

|07F4C3| LDA.b $3D
|07F4C5| BNE .exit

|07F4C7| LDA.b #$02
|07F4C9| STA.w $02DA

|07F4CC| INC.b $B0

.exit
|07F4CE| PLB

|07F4CF| RTL

;===================================================================================================

CheckIfLinkIsBusy:
|07F4D0| PHX

|07F4D1| LDA.b $4D
|07F4D3| ORA.w $02DA
|07F4D6| BNE .am_busy

|07F4D8| LDA.w $0308
|07F4DB| AND.b #$80
|07F4DD| BNE .am_busy

;---------------------------------------------------------------------------------------------------

|07F4DF| LDX.b #$04

.next_ancilla
|07F4E1| LDA.w $0C4A,X
|07F4E4| CMP.b #$27 ; ANCILLA 27
|07F4E6| BEQ .am_busy

|07F4E8| DEX
|07F4E9| BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

.am_free
|07F4EB| PLX

|07F4EC| CLC

|07F4ED| RTL

;---------------------------------------------------------------------------------------------------

.am_busy
|07F4EE| PLX

|07F4EF| SEC

|07F4F0| RTL

;===================================================================================================

ValidatePipeEntry:
|07F4F1| LDX.b #$04

.next_ancilla
|07F4F3| LDA.w $0C4A,X
|07F4F6| CMP.b #$31 ; ANCILLA 31
|07F4F8| BNE .skip_ancilla

|07F4FA| STZ.w $037A
|07F4FD| STZ.b $50

|07F4FF| STZ.w $0C4A,X

|07F502| BRA .continue

.skip_ancilla
|07F504| DEX
|07F505| BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

.continue
|07F507| LDA.w $0308
|07F50A| AND.b #$80
|07F50C| ORA.b $4D
|07F50E| BNE .fail

.succeed
|07F510| CLC

|07F511| RTL

.fail
|07F512| SEC

|07F513| RTL

;===================================================================================================

CacheCameraPropertiesIfOutdoors:
|07F514| LDA.b $1B
|07F516| BNE .indoors

|07F518| JSL CacheCameraProperties

.indoors
|07F51C| RTS

;===================================================================================================

SignTextOverworld:
|07F51D| dw $00A7, $00A7, $0048, $0040, $0040, $00A7, $00A7, $00A7
|07F52D| dw $00A7, $00A7, $003C, $0040, $0040, $00A7, $00A7, $003E
|07F53D| dw $003D, $0049, $0042, $0042, $00A7, $00A7, $003F, $00B0
|07F54D| dw $003B, $003B, $00A7, $003B, $003B, $0044, $00A7, $00A7
|07F55D| dw $003B, $003B, $00A7, $003B, $003B, $0045, $00A7, $00A7
|07F56D| dw $00A7, $00A7, $00A7, $00A7, $00A7, $0041, $00A7, $00A7
|07F57D| dw $00A7, $00A7, $00A7, $0042, $00A7, $0046, $0046, $00A7
|07F58D| dw $00A7, $00A7, $0047, $0043, $00A7, $0046, $0046, $00A7

|07F59D| dw $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
|07F5AD| dw $00A7, $00A7, $00A8, $00A7, $00A7, $00A7, $00A7, $00A9
|07F5BD| dw $00A7, $00AA, $00AB, $00A7, $00A7, $00A7, $00A7, $00B1
|07F5CD| dw $00AF, $00AF, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
|07F5DD| dw $00AF, $00AF, $00A7, $00A7, $00A7, $00AC, $00A7, $00A7
|07F5ED| dw $00A7, $00A7, $00A7, $00A7, $00A7, $00AD, $00A7, $00A7
|07F5FD| dw $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7, $00A7
|07F60D| dw $00A7, $00A7, $00A7, $00AE, $00A7, $00A7, $00A7, $00A7

;===================================================================================================

SignTextUnderworld:
|07F61D| dw $00B4, $00B4, $00B4, $00C7
|07F625| dw $00B4, $00B4, $00B4, $00B4
|07F62D| dw $00B4, $00B4, $00B4, $00B4
|07F635| dw $00B4, $00B4, $00C4, $00B4
|07F63D| dw $00BE, $00B4, $00B4, $00B4
|07F645| dw $00B4, $00B4, $00B4, $00B4
|07F64D| dw $00B4, $00B4, $00B4, $00B4
|07F655| dw $00B4, $00B4, $00B4, $00B4
|07F65D| dw $00B4, $00B4, $00B4, $00B4
|07F665| dw $00B4, $00B4, $00B4, $00B5
|07F66D| dw $00B9, $00B4, $00B4, $00B4
|07F675| dw $00B4, $00B4, $00B4, $00B4
|07F67D| dw $00B4, $00B4, $00B4, $00B4
|07F685| dw $00B4, $00B4, $00B4, $00B4
|07F68D| dw $00B4, $00B4, $00B4, $00B4
|07F695| dw $00B4, $00B4, $00C5, $00B4
|07F69D| dw $00B4, $00B4, $00B4, $00B4
|07F6A5| dw $00B4, $00B4, $00B4, $00B4
|07F6AD| dw $00B4, $00B4, $00B4, $00BF
|07F6B5| dw $00B4, $00B4, $00B4, $00B4
|07F6BD| dw $00B4, $00B4, $00B4, $00B4
|07F6C5| dw $00B4, $00B4, $00B9, $00B4
|07F6CD| dw $00B4, $00B4, $00B4, $00B4
|07F6D5| dw $00B4, $00B4, $00B4, $00B4
|07F6DD| dw $00B4, $00B4, $00B4, $00B4
|07F6E5| dw $00BA, $00B4, $00B4, $00B4
|07F6ED| dw $00B4, $00B4, $00BF, $00B4
|07F6F5| dw $00B4, $00B4, $00B4, $00B4
|07F6FD| dw $00B4, $00B4, $00B4, $00C0
|07F705| dw $00B4, $00B4, $00B4, $00C6
|07F70D| dw $00B4, $00B4, $00B4, $00B4
|07F715| dw $00C0, $00B4, $00C2, $00B4
|07F71D| dw $00B4, $00B4, $00B4, $00B4
|07F725| dw $00B4, $00B4, $00B4, $00B4
|07F72D| dw $00B4, $00B4, $00B4, $00B4
|07F735| dw $00B4, $00B4, $00B4, $00B4
|07F73D| dw $00B4, $00B4, $00B4, $00B4
|07F745| dw $00B4, $00B4, $00B4, $00BB
|07F74D| dw $00B4, $00B4, $00B4, $00B4
|07F755| dw $00B4, $00B4, $00B4, $00B4
|07F75D| dw $00B4, $00B4, $00B4, $00B4
|07F765| dw $00B4, $00B4, $00B4, $00B4
|07F76D| dw $00B4, $00B4, $00B4, $00B4
|07F775| dw $00B4, $00B4, $00B4, $00B4
|07F77D| dw $00C1, $00B4, $00B4, $00B4
|07F785| dw $00B4, $00B4, $00B4, $00B4
|07F78D| dw $00B4, $00B4, $00B4, $00B4
|07F795| dw $00B4, $00B4, $00B4, $00B4
|07F79D| dw $00B4, $00B4, $00B4, $00B4
|07F7A5| dw $00C3, $00B4, $00B4, $00B4
|07F7AD| dw $00B4, $00B4, $00B4, $00B4
|07F7B5| dw $00B4, $00B4, $00B4, $00B4
|07F7BD| dw $00B4, $00B4, $00B4, $00B4
|07F7C5| dw $00B4, $00B4, $00C3, $00B4
|07F7CD| dw $00B4, $00B4, $00B4, $00B4
|07F7D5| dw $00B4, $00B4, $00B4, $00B4
|07F7DD| dw $00B4, $00B4, $00B4, $00B4
|07F7E5| dw $00B4, $00B4, $00B4, $00B4
|07F7ED| dw $00B4, $00B4, $00B8, $00B4
|07F7F5| dw $00B4, $00B4, $00B4, $00B4
|07F7FD| dw $00B4, $00B4, $00B4, $00B4
|07F805| dw $00B4, $00B4, $00B4, $00B4
|07F80D| dw $00B4, $00B4, $00B4, $00B4
|07F815| dw $00B4, $00B4, $00B4, $00B4
|07F81D| dw $00B4, $00B4, $00B4, $00B4
|07F825| dw $00B4, $00B4, $00B4, $00B4
|07F82D| dw $00B4, $00B4, $00B4, $00B4
|07F835| dw $00B4, $00B5, $00B4, $00B4
|07F83D| dw $00B4, $00B4, $00B4, $00B4
|07F845| dw $00B4, $00B4, $00B4, $00B4
|07F84D| dw $00B4, $00B4, $00B4, $00B4
|07F855| dw $00B4, $00B4, $00B4, $00B4
|07F85D| dw $00B4, $00B4, $00B4, $00B4
|07F865| dw $00B4, $0179, $00B4, $00B4
|07F86D| dw $00B4, $00B4, $00B4, $00B4
|07F875| dw $00B4, $00B4, $00B4, $00B4
|07F87D| dw $00B4, $00B4, $00B4, $00B4
|07F885| dw $00B4, $00B4, $00B4, $00B4
|07F88D| dw $00B4, $00B4, $00B4, $00B4
|07F895| dw $00B4, $00B4, $00B4, $00B4

;===================================================================================================
; FREE ROM: 0x763
;===================================================================================================
NULL_07F89D:
|07F89D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8A5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8AD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8B5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8BD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8C5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8CD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8D5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8DD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8E5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8ED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8F5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F8FD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F905| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F90D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F915| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F91D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F925| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F92D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F935| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F93D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F945| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F94D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F955| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F95D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F965| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F96D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F975| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F97D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F985| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F98D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F995| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F99D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9A5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9AD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9B5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9BD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9C5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9CD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9D5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9DD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9E5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9ED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9F5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07F9FD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FA9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FABD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FACD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAD5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FADD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FAFD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FB9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBBD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBCD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBD5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBDD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FBFD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FC9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCBD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCCD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCD5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCDD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FCFD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FD9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDBD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDCD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDD5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDDD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FDFD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FE9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEBD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FECD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FED5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEDD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FEFD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF05| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF0D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF15| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF1D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF25| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF2D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF35| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF3D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF45| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF4D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF55| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF5D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF65| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF6D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF75| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF7D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF85| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF8D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF95| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FF9D| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFA5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFAD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFB5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFBD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFC5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFCD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFD5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFDD| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFE5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFED| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFF5| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|07FFFD| db $FF, $FF, $FF

;===================================================================================================
