org $1E8000

;===================================================================================================

HelmasaurKing_Initialize:
|1E8000| LDA.b #$30
|1E8002| STA.w $0B2F

|1E8005| LDA.b #$80
|1E8007| STA.w $0B2D

|1E800A| STZ.w $0B2E
|1E800D| STZ.w $0B30
|1E8010| STZ.w $0B33
|1E8013| STZ.w $0B31
|1E8016| STZ.w $0B32

;===================================================================================================

HelmasaurKing_Reinitialize:
|1E8019| PHB
|1E801A| PHK
|1E801B| PLB

|1E801C| PHX

|1E801D| LDA.w $0E80,X
|1E8020| STA.b $00

|1E8022| LDY.b #$03

.next_leg
|1E8024| LDA.b $00
|1E8026| CLC
|1E8027| ADC.w HelmasaurKingLeg_OffsetYBaseIndex,Y
|1E802A| AND.b #$1F
|1E802C| TAX

|1E802D| LDA.w HelmasaurKingLeg_Offset_Y,X
|1E8030| STA.w $0B08,Y

|1E8033| DEY
|1E8034| BPL .next_leg

|1E8036| PLX
|1E8037| PLB

|1E8038| RTL

;===================================================================================================

Sprite_92_HelmasaurKing:
|1E8039| LDA.w $0DB0,X
|1E803C| BPL HelmasaurKing_Main

;===================================================================================================

HelmasaurKing_MaskDebris:
|1E803E| LDA.w $0DF0,X
|1E8041| BEQ .stay_around

|1E8043| DEC A
|1E8044| BNE .stay_around

|1E8046| STZ.w $0DD0,X

.stay_around
|1E8049| JSL SpriteDraw_SingleLarge_long
|1E804D| JSR CheckIfActive_bank1E

|1E8050| LDA.b $1A
|1E8052| AND.b #$07
|1E8054| ORA.w $0E00,X
|1E8057| BNE .preserve_flip

|1E8059| LDA.w $0F50,X
|1E805C| EOR.b #$40
|1E805E| STA.w $0F50,X

.preserve_flip
|1E8061| JSR MoveSpriteXYZ_bank1E

|1E8064| DEC.w $0F80,X
|1E8067| DEC.w $0F80,X

|1E806A| LDA.w $0F70,X
|1E806D| BPL .exit

|1E806F| STZ.w $0F70,X

|1E8072| LDA.b #$0C
|1E8074| STA.w $0DF0,X

|1E8077| LDA.b #$18
|1E8079| STA.w $0F80,X

|1E807C| LDA.b #$06
|1E807E| STA.w $0DC0,X

.exit
|1E8081| RTS

;===================================================================================================

HelmasaurKing_Main:
|1E8082| CMP.b #$03
|1E8084| BCS .still_masked

|1E8086| LDA.w $0B89,X
|1E8089| AND.b #$F1
|1E808B| STA.w $0B89,X

|1E808E| LDA.b #$0A
|1E8090| STA.w $0B6B,X

|1E8093| BRA .continue

.still_masked
|1E8095| LDA.b #$1F
|1E8097| STA.w $0F60,X

|1E809A| LDA.b #$02
|1E809C| STA.w $0B6B,X

.continue
|1E809F| JSR SpriteDraw_KingHelmasaur

|1E80A2| LDA.w $0DD0,X
|1E80A5| CMP.b #$06
|1E80A7| BNE HelmasaurKing_Alive

|1E80A9| LDA.w $0DF0,X
|1E80AC| BNE .delay_explosions

|1E80AE| LDA.b #$04
|1E80B0| STA.w $0DD0,X

|1E80B3| STZ.w $0D90,X

|1E80B6| LDA.b #$E0
|1E80B8| STA.w $0DF0,X

|1E80BB| RTS

;---------------------------------------------------------------------------------------------------

.delay_explosions
|1E80BC| PHA

|1E80BD| ORA.b #$F0
|1E80BF| STA.w $0EF0,X

|1E80C2| PLA
|1E80C3| CMP.b #$80
|1E80C5| BCS .exit

|1E80C7| AND.b #$07
|1E80C9| BNE .exit

|1E80CB| LDY.w $0B33
|1E80CE| CPY.b #$10
|1E80D0| BEQ .exit

|1E80D2| INC.w $0B33

|1E80D5| STZ.b $00

|1E80D7| LDA.w $0B0D,Y
|1E80DA| BPL .positive_a

|1E80DC| DEC.b $00

.positive_a
|1E80DE| CLC
|1E80DF| ADC.w $0D10,X
|1E80E2| STA.w $0FD8

|1E80E5| LDA.w $0D30,X
|1E80E8| ADC.b $00
|1E80EA| STA.w $0FD9

|1E80ED| STZ.b $00

|1E80EF| LDA.w $0B1D,Y
|1E80F2| BPL .positive_b

|1E80F4| DEC.b $00

.positive_b
|1E80F6| CLC
|1E80F7| ADC.w $0D00,X
|1E80FA| STA.w $0FDA

|1E80FD| LDA.w $0D20,X
|1E8100| ADC.b $00
|1E8102| STA.w $0FDB

|1E8105| JSL MakeBossExplosion

.exit
|1E8109| RTS

;===================================================================================================

pool HelmasaurKing_Alive

.phase_hp
|1E810A| db $03, $03, $03, $03, $03, $03, $03, $03
|1E8112| db $02, $02, $01, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

HelmasaurKing_Alive:
|1E8117| JSR CheckIfActive_bank1E

|1E811A| LDA.w $0E50,X
|1E811D| LSR A
|1E811E| LSR A
|1E811F| TAY

|1E8120| LDA.w .phase_hp,Y
|1E8123| STA.w $0DB0,X

|1E8126| CMP.b #$03
|1E8128| BNE .not_phase3

|1E812A| CMP.w $0E90,X
|1E812D| BEQ .continue

|1E812F| STZ.w $0EF0,X

|1E8132| JSR HelmasaurKing_ExplodeMask
|1E8135| BRA .continue

.not_phase3
|1E8137| CMP.w $0E90,X
|1E813A| BEQ .continue

|1E813C| JSR HelmasaurKing_ChipAwayAtMask

.continue
|1E813F| LDA.w $0DB0,X
|1E8142| STA.w $0E90,X

|1E8145| JSL CheckDamageFromLink_long

|1E8149| JSR HelmasaurKing_SwingTail
|1E814C| JSR HelmasaurKing_AttemptDamage
|1E814F| JSR HelmasaurKing_CheckMaskDamageFromHammer

|1E8152| LDA.w $0E00,X
|1E8155| BEQ .might_fireball

|1E8157| CMP.b #$60
|1E8159| BEQ .no_fireball

|1E815B| RTS

;---------------------------------------------------------------------------------------------------

.might_fireball
|1E815C| LDA.w $0E10,X
|1E815F| BEQ .do_attack

|1E8161| CMP.b #$40
|1E8163| BNE .exit

|1E8165| JSR HelmasaurKing_SpitFireball

|1E8168| LDA.w $0DB0,X
|1E816B| CMP.b #$03
|1E816D| BCC .exit

.no_fireball
|1E816F| LDA.w $0EC0,X
|1E8172| BNE .exit

|1E8174| INC.w $0EC0,X

|1E8177| LDA.b #$20
|1E8179| STA.w $0EE0,X

.exit
|1E817C| RTS

;---------------------------------------------------------------------------------------------------

.do_attack
|1E817D| LDA.w $0D80,X
|1E8180| JSL JumpTableLocal
|1E8184| dw HelmasaurKing_DecisionHome
|1E8186| dw HelmasaurKing_WalkToLocation
|1E8188| dw HelmasaurKing_DecisionAway
|1E818A| dw HelmasaurKing_WalkBackHome

;===================================================================================================

pool HelmasaurKing_DecisionHome

.speed_x
|1E818C| db -12, -12,  -4,   0,   4,  12,  12,   0

.speed_y
|1E8194| db   0,   4,  12,  12,  12,   4,   0,  12

endpool

;---------------------------------------------------------------------------------------------------

HelmasaurKing_DecisionHome:
|1E819C| LDA.w $0EF0,X
|1E819F| BNE .delay

|1E81A1| LDA.w $0DF0,X
|1E81A4| BNE .exit

.delay
|1E81A6| JSR HelmasaurKing_MaybeAttack

|1E81A9| JSL GetRandomNumber
|1E81AD| AND.b #$07
|1E81AF| TAY

|1E81B0| LDA.w .speed_x,Y
|1E81B3| STA.w $0D50,X

|1E81B6| LDA.w .speed_y,Y
|1E81B9| STA.w $0D40,X

|1E81BC| LDA.b #$40
|1E81BE| STA.w $0DF0,X

|1E81C1| LDA.w $0DB0,X
|1E81C4| CMP.b #$03
|1E81C6| BCC .normal_speed

|1E81C8| ASL.w $0D50,X
|1E81CB| ASL.w $0D40,X
|1E81CE| LSR.w $0DF0,X

.normal_speed
|1E81D1| INC.w $0D80,X

.exit
|1E81D4| RTS

;===================================================================================================

HelmasaurKing_WalkToLocation:
|1E81D5| JSR HelmasaurKing_HandleMovement

|1E81D8| LDA.w $0DF0,X
|1E81DB| BNE .exit

|1E81DD| LDA.b #$20
|1E81DF| STA.w $0DF0,X

|1E81E2| INC.w $0D80,X

.exit
|1E81E5| RTS

;===================================================================================================

HelmasaurKing_HandleMovement:
|1E81E6| JSR HelmasaurKing_ShuffleLegs

|1E81E9| LDA.b $1A
|1E81EB| AND.b #$03
|1E81ED| BNE .no_extra_shuffle

|1E81EF| JSR HelmasaurKing_ShuffleLegs

.no_extra_shuffle
|1E81F2| LDA.w $0DB0,X
|1E81F5| CMP.b #$03
|1E81F7| BCC .no_double_extra_shuffle

|1E81F9| JSR HelmasaurKing_ShuffleLegs

.no_double_extra_shuffle
|1E81FC| JSR MoveSpriteXY_bank1E

|1E81FF| RTS

;===================================================================================================

HelmasaurKing_ShuffleLegs:
|1E8200| INC.w $0E80,X

|1E8203| LDA.w $0E80,X
|1E8206| AND.b #$0F
|1E8208| BNE .exit

|1E820A| LDA.b #$21 ; SFX2.21
|1E820C| STA.w $012E

.exit
|1E820F| RTS

;===================================================================================================

HelmasaurKing_DecisionAway:
|1E8210| LDA.w $0EF0,X
|1E8213| BNE .delay

|1E8215| LDA.w $0DF0,X
|1E8218| BNE .exit

.delay
|1E821A| JSR HelmasaurKing_MaybeAttack

|1E821D| LDA.b #$40
|1E821F| STA.w $0DF0,X

|1E8222| LDA.w $0E90,X
|1E8225| CMP.b #$03
|1E8227| BCC .dont_halve_timer

|1E8229| LSR.w $0DF0,X

.dont_halve_timer
|1E822C| LDA.w $0D50,X
|1E822F| EOR.b #$FF
|1E8231| INC A
|1E8232| STA.w $0D50,X

|1E8235| LDA.w $0D40,X
|1E8238| EOR.b #$FF
|1E823A| INC A
|1E823B| STA.w $0D40,X

|1E823E| INC.w $0D80,X

.exit
|1E8241| RTS

;===================================================================================================

HelmasaurKing_WalkBackHome:
|1E8242| JSR HelmasaurKing_HandleMovement

|1E8245| LDA.w $0DF0,X
|1E8248| BNE .exit

|1E824A| STZ.w $0D80,X

|1E824D| LDA.b #$40
|1E824F| STA.w $0DF0,X

.exit
|1E8252| RTS

;===================================================================================================

HelmasaurKing_MaybeAttack:
|1E8253| INC.w $0E30,X

|1E8256| LDA.w $0E30,X
|1E8259| CMP.b #$04
|1E825B| BNE .exit

|1E825D| PLA
|1E825E| PLA

|1E825F| STZ.w $0E30,X

|1E8262| JSL GetRandomNumber
|1E8266| AND.b #$01
|1E8268| BEQ .no_sfx

|1E826A| LDA.b #$7F
|1E826C| STA.w $0E10,X

|1E826F| LDA.b #$2A ; SFX3.2A
|1E8271| JSL QueueSpriteSFX3WithPan

|1E8275| RTS

.no_sfx
|1E8276| LDA.b #$A0
|1E8278| STA.w $0E00,X

.exit
|1E827B| RTS

;===================================================================================================

HelmasaurKingLeg_Offset_Y:
|1E827C| db $00, $01, $02, $03, $04, $05, $06, $07
|1E8284| db $08, $08, $08, $08, $08, $08, $08, $08
|1E828C| db $08, $08, $08, $08, $08, $08, $08, $08
|1E8294| db $08, $07, $06, $05, $04, $03, $02, $01

HelmasaurKingLeg_OffsetYBaseIndex:
|1E829C| db $00, $08, $10, $18

;===================================================================================================

HelmasaurKing_SwingTail:
|1E82A0| INC.w $0B0C

|1E82A3| JSL HelmasaurKing_Reinitialize

|1E82A7| LDA.b #$01
|1E82A9| LDY.w $0EC0,X
|1E82AC| BEQ .allow_failure

|1E82AE| LDA.b #$00

.allow_failure
|1E82B0| AND.b $1A
|1E82B2| BNE .bad_frame_parity

|1E82B4| LDA.w $0DE0,X
|1E82B7| AND.b #$01
|1E82B9| TAY

|1E82BA| LDA.w $0B30
|1E82BD| CLC
|1E82BE| ADC.w HelmasaurKing_TailSwingRotationDirection,Y
|1E82C1| STA.w $0B30

|1E82C4| CMP.w Sixteen_X,Y
|1E82C7| BNE .x_max

|1E82C9| INC.w $0DE0,X

.x_max
|1E82CC| LDY.b #$00

|1E82CE| LDA.w $0B30
|1E82D1| BPL .x_pos

|1E82D3| DEY

.x_pos
|1E82D4| CLC
|1E82D5| ADC.w $0B2D
|1E82D8| STA.w $0B2D

|1E82DB| TYA
|1E82DC| ADC.w $0B2E
|1E82DF| AND.b #$FF
|1E82E1| STA.w $0B2E

.bad_frame_parity
|1E82E4| LDA.w $0EC0,X
|1E82E7| BEQ .exit_a

|1E82E9| LDA.w $0B30
|1E82EC| BNE .skip_sfx

|1E82EE| LDA.b #$06 ; SFX3.06
|1E82F0| JSL QueueSpriteSFX3WithPan

;---------------------------------------------------------------------------------------------------

.skip_sfx
|1E82F4| LDA.w $0EC0,X
|1E82F7| CMP.b #$02
|1E82F9| BEQ .do_segment_a

|1E82FB| CMP.b #$03
|1E82FD| BEQ .do_segment_b

|1E82FF| LDA.w $0B30
|1E8302| ORA.w $0EE0,X
|1E8305| BNE .exit_b

|1E8307| LDA.w $0B2E
|1E830A| AND.b #$01
|1E830C| STA.w $0EB0,X

|1E830F| JSR GetXDisplacementFromLink_bank1E

|1E8312| TYA
|1E8313| EOR.b #$01
|1E8315| CMP.w $0EB0,X
|1E8318| BNE .exit_a

|1E831A| INC.w $0EC0,X

|1E831D| JSL CalculateSpriteSFXPan
|1E8321| ORA.b #$26 ; SFX3.26
|1E8323| STA.w $012F

.exit_a
|1E8326| RTS

;===================================================================================================

.offset_low
|1E8327| db    4,   -4

.offset_high
|1E8329| db    0,   -1

.limit
|1E832B| db  124, -124

;---------------------------------------------------------------------------------------------------

.do_segment_a
|1E832D| LDY.w $0EB0,X

|1E8330| LDA.w $0B31
|1E8333| CLC
|1E8334| ADC.w .offset_low,Y
|1E8337| STA.w $0B31

|1E833A| PHA

|1E833B| LDA.w $0B32
|1E833E| ADC.w .offset_high,Y
|1E8341| STA.w $0B32

|1E8344| PLA
|1E8345| CMP.w .limit,Y
|1E8348| BNE .a_fine

|1E834A| INC.w $0EC0,X

.a_fine
|1E834D| LDA.w $0B2F
|1E8350| CLC
|1E8351| ADC.b #$03
|1E8353| STA.w $0B2F

|1E8356| RTS

;---------------------------------------------------------------------------------------------------

.do_segment_b
|1E8357| LDA.w $0EB0,X
|1E835A| EOR.b #$01
|1E835C| TAY

|1E835D| LDA.w $0B31
|1E8360| CLC
|1E8361| ADC.w .offset_low,Y
|1E8364| STA.w $0B31

|1E8367| PHA

|1E8368| LDA.w $0B32
|1E836B| ADC.w .offset_high,Y
|1E836E| STA.w $0B32

|1E8371| PLA
|1E8372| CMP.b #$00
|1E8374| BNE .b_fine

|1E8376| STZ.w $0EC0,X

.b_fine
|1E8379| LDA.w $0B2F
|1E837C| SEC
|1E837D| SBC.b #$03
|1E837F| STA.w $0B2F

.exit_b
|1E8382| RTS

;===================================================================================================

HelmasaurKing_TailSwingRotationDirection:
|1E8383| db  1, -1

;===================================================================================================

HelmasaurKing_CheckMaskDamageFromHammer:
|1E8385| LDA.w $0DB0,X
|1E8388| CMP.b #$03
|1E838A| BCS .exit

|1E838C| LDA.w $0301
|1E838F| AND.b #$0A
|1E8391| BEQ .exit

|1E8393| LDA.b $44
|1E8395| CMP.b #$80
|1E8397| BEQ .exit

|1E8399| JSL SetupActionHitbox_long

|1E839D| LDA.w $0D00,X
|1E83A0| PHA

|1E83A1| CLC
|1E83A2| ADC.b #$08
|1E83A4| STA.w $0D00,X

|1E83A7| JSL SetupSpriteHitbox_long

|1E83AB| PLA
|1E83AC| STA.w $0D00,X

|1E83AF| JSL CheckIfHitboxesOverlap_long
|1E83B3| BCC .exit

|1E83B5| DEC.w $0E50,X

|1E83B8| LDA.b #$21 ; SFX3.21
|1E83BA| STA.w $012F

|1E83BD| LDA.b #$30
|1E83BF| JSL ProjectSpriteSpeedTowardsLink_long

|1E83C3| LDA.b $00
|1E83C5| STA.b $27

|1E83C7| LDA.b $01
|1E83C9| STA.b $28

|1E83CB| LDA.b #$08
|1E83CD| STA.w $0046

|1E83D0| LDA.w $0FAC
|1E83D3| BNE .no_spark

|1E83D5| LDA.b $00
|1E83D7| STA.w $0FAD

|1E83DA| LDA.b $01
|1E83DC| STA.w $0FAE

|1E83DF| LDA.b #$05
|1E83E1| STA.w $0FAC

.no_spark
|1E83E4| LDA.b #$05 ; SFX2.05
|1E83E6| JSL QueueSpriteSFX2WithPan

.exit
|1E83EA| RTS

;===================================================================================================

HelmasaurKing_AttemptDamage:
|1E83EB| LDA.b $1A
|1E83ED| AND.b #$07
|1E83EF| BNE .no_damage

|1E83F1| REP #$20

|1E83F3| LDA.b $22
|1E83F5| SEC
|1E83F6| SBC.w $0FD8
|1E83F9| CLC
|1E83FA| ADC.w #$0024

|1E83FD| CMP.w #$0048
|1E8400| BCS .no_damage

|1E8402| LDA.b $20
|1E8404| SEC
|1E8405| SBC.w $0FDA
|1E8408| CLC
|1E8409| ADC.w #$0028

|1E840C| CMP.w #$0040
|1E840F| BCS .no_damage

|1E8411| SEP #$20

|1E8413| JSL AttemptDamageToLinkPlusRecoil_long

.no_damage
|1E8417| SEP #$20

|1E8419| RTS

;===================================================================================================

pool HelmasaurKing_SpawnMaskDebris

.offset_y_low
|1E841A| db  24,  27,  24,  24,  27,  24,  27,  27,  24,  24

.offset_y_high
|1E8424| db   0,   0,   0,   0,   0,   0,   0,   0,   0,   0

.offset_x_low
|1E842E| db -16,   0,  16, -16,   0,  16,  -8,   8, -16,  16

.offset_x_high
|1E8438| db  -1,   0,   0,  -1,   0,   0,  -1,   0,  -1,   0

.initial_z
|1E8442| db  29,  32,  29,  13,  16,  13,   0,   0,  13,  13

.speed_x
|1E844C| db -16,  -4,  14, -12,   4,  18,  -2,   2, -12,  18

.speed_y
|1E8456| db  -8,  -4,  -6,   4,   2,   7,   6,   8,   4,   7

.speed_z
|1E8460| db  32,  40,  36,  37,  39,  34,  30,  33,  37,  34

.flip
|1E846A| db $00, $00, $40, $00, $00, $40, $00, $40, $00, $40

.starting_anim
|1E8474| db $00, $01, $00, $02, $03, $02, $04, $04, $05, $05

endpool

;===================================================================================================

HelmasaurKing_ChipAwayAtMask:
|1E847E| LDA.w $0DB0,X
|1E8481| CLC
|1E8482| ADC.b #$07
|1E8484| STA.w $0FB5

|1E8487| JSR HelmasaurKing_SpawnMaskDebris

|1E848A| BRA .make_sfx

;===================================================================================================

#HelmasaurKing_ExplodeMask:
|1E848C| LDY.b #$0F
|1E848E| LDA.b #$00

.next_sprite
|1E8490| STA.w $0DD0,Y

|1E8493| DEY
|1E8494| BNE .next_sprite

|1E8496| LDA.b #$07
|1E8498| STA.w $0FB5

.next_debris
|1E849B| JSR HelmasaurKing_SpawnMaskDebris

|1E849E| DEC.w $0FB5
|1E84A1| BPL .next_debris

.make_sfx
|1E84A3| LDA.b #$1F ; SFX2.1F
|1E84A5| JSL QueueSpriteSFX2WithPan

|1E84A9| RTS

;===================================================================================================

HelmasaurKing_SpawnMaskDebris:
|1E84AA| LDA.b #$92 ; SPRITE 92
|1E84AC| JSL SpawnSpriteDynamically
|1E84B0| BMI .no_space

|1E84B2| PHX

|1E84B3| LDX.w $0FB5

|1E84B6| LDA.b $00
|1E84B8| CLC
|1E84B9| ADC.w .offset_x_low,X
|1E84BC| STA.w $0D10,Y

|1E84BF| LDA.b $01
|1E84C1| ADC.w .offset_x_high,X
|1E84C4| STA.w $0D30,Y

|1E84C7| LDA.b $02
|1E84C9| CLC
|1E84CA| ADC.w .offset_y_low,X
|1E84CD| STA.w $0D00,Y

|1E84D0| LDA.b $03
|1E84D2| ADC.w .offset_y_high,X
|1E84D5| STA.w $0D20,Y

|1E84D8| LDA.w .initial_z,X
|1E84DB| STA.w $0F70,Y

|1E84DE| LDA.w .speed_x,X
|1E84E1| STA.w $0D50,Y

|1E84E4| LDA.w .speed_y,X
|1E84E7| STA.w $0D40,Y

|1E84EA| LDA.w .speed_z,X
|1E84ED| STA.w $0F80,Y

|1E84F0| LDA.w .flip,X
|1E84F3| ORA.b #$0D
|1E84F5| STA.w $0F50,Y

|1E84F8| LDA.w .starting_anim,X
|1E84FB| STA.w $0DC0,Y

|1E84FE| LDA.b #$80
|1E8500| STA.w $0DB0,Y

|1E8503| ASL A
|1E8504| STA.w $0E40,Y

|1E8507| LDA.b #$0C
|1E8509| STA.w $0E00,Y
|1E850C| STA.w $0BA0,Y

|1E850F| LDA.w $0FB5
|1E8512| STA.w $0E30,Y

|1E8515| PLX

.no_space
|1E8516| RTS

;===================================================================================================

HelmasaurKing_SpitFireball:
|1E8517| LDA.b #$70 ; SPRITE 70
|1E8519| JSL SpawnSpriteDynamically
|1E851D| BMI .no_space

|1E851F| JSL SetSpawnedSpriteCoordinates

|1E8523| LDA.b $02
|1E8525| CLC
|1E8526| ADC.b #$1C
|1E8528| STA.w $0D00,Y

|1E852B| LDA.b $03
|1E852D| ADC.b #$00
|1E852F| STA.w $0D20,Y

|1E8532| LDA.b #$20
|1E8534| STA.w $0DF0,Y
|1E8537| STA.w $0BA0,Y

.no_space
|1E853A| RTS

;===================================================================================================

SpriteDraw_KingHelmasaur:
|1E853B| REP #$20

|1E853D| LDA.w #$089C
|1E8540| STA.b $90

|1E8542| LDA.w #$0A47
|1E8545| STA.b $92

|1E8547| SEP #$20

|1E8549| JSR GetScreenCoordinates_bank1E

|1E854C| JSR KingHelmasaur_OperateTail
|1E854F| JSR SpriteDraw_KingHelmasaur_Eyes
|1E8552| JSR KingHelmasaurMask
|1E8555| JSR SpriteDraw_KingHelmasaur_Body
|1E8558| JSR SpriteDraw_KingHelmasaur_Legs
|1E855B| JSR SpriteDraw_KingHelmasaur_Mouth

|1E855E| RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Eyes

.offset_x
|1E855F| db  -3,  11

.char
|1E8561| db $CE, $CF, $DE, $DE, $DE, $DE, $CF, $CE

.prop
|1E8569| db $3B, $7B

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Eyes:
|1E856B| REP #$20

|1E856D| LDA.b $90
|1E856F| CLC
|1E8570| ADC.w #$0040
|1E8573| STA.b $90

|1E8575| LDA.b $92
|1E8577| CLC
|1E8578| ADC.w #$0010
|1E857B| STA.b $92

|1E857D| SEP #$20

|1E857F| PHX

|1E8580| LDY.b #$00
|1E8582| LDX.b #$01

.next_eye
|1E8584| PHX

|1E8585| LDA.b $00
|1E8587| CLC
|1E8588| ADC.w .offset_x,X
|1E858B| STA.b ($90),Y

|1E858D| LDA.b $02
|1E858F| CLC
|1E8590| ADC.b #$14
|1E8592| INY
|1E8593| STA.b ($90),Y

|1E8595| LDA.w $0B0C
|1E8598| LSR A
|1E8599| LSR A
|1E859A| AND.b #$07
|1E859C| TAX

|1E859D| LDA.w .char,X
|1E85A0| INY
|1E85A1| STA.b ($90),Y

|1E85A3| PLX

|1E85A4| LDA.w .prop,X
|1E85A7| INY
|1E85A8| STA.b ($90),Y

|1E85AA| PHY

|1E85AB| TYA
|1E85AC| LSR A
|1E85AD| LSR A
|1E85AE| TAY

|1E85AF| LDA.b #$00
|1E85B1| STA.b ($92),Y

|1E85B3| PLY
|1E85B4| INY

|1E85B5| DEX
|1E85B6| BPL .next_eye

;---------------------------------------------------------------------------------------------------

|1E85B8| PLX

|1E85B9| LDA.b $11
|1E85BB| BEQ .exit

|1E85BD| LDY.b #$00
|1E85BF| LDA.b #$01
|1E85C1| JSL CorrectOAMEntries_long

.exit
|1E85C5| RTS

;===================================================================================================

pool KingHelmasaurMask

.oam_groups
|1E85C6| dw -16,  -5 : db $AE, $0D, $00, $02
|1E85CE| dw   0,  -5 : db $C0, $0D, $00, $02
|1E85D6| dw  16,  -5 : db $AE, $4D, $00, $02
|1E85DE| dw -16,  11 : db $C2, $0D, $00, $02
|1E85E6| dw   0,  11 : db $C4, $0D, $00, $02
|1E85EE| dw  16,  11 : db $C2, $4D, $00, $02
|1E85F6| dw  -8,  27 : db $C6, $0D, $00, $02
|1E85FE| dw   8,  27 : db $C6, $4D, $00, $02

|1E8606| dw -16,  -5 : db $AE, $0D, $00, $02
|1E860E| dw   0,  -5 : db $C0, $0D, $00, $02
|1E8616| dw  16,  -5 : db $AE, $4D, $00, $02
|1E861E| dw -16,  11 : db $C8, $0D, $00, $02
|1E8626| dw   0,  11 : db $C4, $0D, $00, $02
|1E862E| dw  16,  11 : db $C2, $4D, $00, $02
|1E8636| dw  -8,  27 : db $C6, $0D, $00, $02
|1E863E| dw   8,  27 : db $C6, $4D, $00, $02

|1E8646| dw -16,  -5 : db $AE, $0D, $00, $02
|1E864E| dw   0,  -5 : db $C0, $0D, $00, $02
|1E8656| dw  16,  -5 : db $AE, $4D, $00, $02
|1E865E| dw -16,  11 : db $C8, $0D, $00, $02
|1E8666| dw   0,  11 : db $C4, $0D, $00, $02
|1E866E| dw  16,  11 : db $C8, $4D, $00, $02
|1E8676| dw  -8,  27 : db $C6, $0D, $00, $02
|1E867E| dw   8,  27 : db $C6, $4D, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

KingHelmasaurMask:
|1E8686| LDA.b #$00
|1E8688| XBA
|1E8689| LDA.w $0DB0,X

|1E868C| REP #$20

|1E868E| ASL A
|1E868F| ASL A
|1E8690| ASL A
|1E8691| ASL A
|1E8692| ASL A
|1E8693| ASL A

|1E8694| ADC.w #.oam_groups
|1E8697| STA.b $08

|1E8699| LDA.b $90
|1E869B| CLC
|1E869C| ADC.w #$0008
|1E869F| STA.b $90

|1E86A1| INC.b $92
|1E86A3| INC.b $92

|1E86A5| SEP #$20

|1E86A7| LDA.w $0DB0,X
|1E86AA| CMP.b #$03
|1E86AC| BCS .exit

|1E86AE| LDA.b #$08
|1E86B0| JSR TabulatedSpriteDraw_bank1E

|1E86B3| REP #$20

|1E86B5| LDA.b $90
|1E86B7| CLC
|1E86B8| ADC.w #$0020
|1E86BB| STA.b $90

|1E86BD| LDA.b $92
|1E86BF| CLC
|1E86C0| ADC.w #$0008
|1E86C3| STA.b $92

|1E86C5| SEP #$20

|1E86C7| LDA.w $0F10,X
|1E86CA| BEQ .search_for_bomb

.exit
|1E86CC| RTS

;---------------------------------------------------------------------------------------------------

.search_for_bomb
|1E86CD| LDY.b #$01

.next_slot
|1E86CF| LDA.w $0C4A,Y
|1E86D2| CMP.b #$07 ; ANCILLA 07
|1E86D4| BNE .to_next

|1E86D6| LDA.w $0C2C,Y
|1E86D9| ORA.w $0C22,Y
|1E86DC| BEQ .to_next

|1E86DE| JSR KingHelmasaur_CheckBombDamage

.to_next
|1E86E1| DEY
|1E86E2| BPL .next_slot

|1E86E4| RTS

;===================================================================================================

KingHelmasaur_CheckBombDamage:
|1E86E5| JSL SetupSpriteHitbox_long

|1E86E9| LDA.w $0C04,Y
|1E86EC| CLC
|1E86ED| ADC.b #$06
|1E86EF| STA.b $00

|1E86F1| LDA.w $0C18,Y
|1E86F4| ADC.b #$00
|1E86F6| STA.b $08

|1E86F8| LDA.w $0BFA,Y
|1E86FB| SEC
|1E86FC| SBC.w $029E,Y
|1E86FF| STA.b $01

|1E8701| LDA.w $0C0E,Y
|1E8704| SBC.b #$00
|1E8706| STA.b $09

|1E8708| LDA.b #$02
|1E870A| STA.b $02

|1E870C| LDA.b #$0F
|1E870E| STA.b $03

|1E8710| JSL CheckIfHitboxesOverlap_long
|1E8714| BCC .not_hit

|1E8716| LDA.w $0C2C,Y
|1E8719| EOR.b #$FF
|1E871B| INC A
|1E871C| STA.w $0C2C,Y

|1E871F| LDA.w $0C22,Y
|1E8722| EOR.b #$FF
|1E8724| INC A
|1E8725| STA.b $00

|1E8727| ASL.b $00
|1E8729| ROR A
|1E872A| STA.w $0C22,Y

|1E872D| LDA.b #$20
|1E872F| STA.w $0F10,X

|1E8732| LDA.b #$05
|1E8734| STA.w $0FAC

|1E8737| LDA.w $0C04,Y
|1E873A| STA.w $0FAD

|1E873D| LDA.w $0BFA,Y
|1E8740| SEC
|1E8741| SBC.w $029E,Y
|1E8744| STA.w $0FAE

|1E8747| LDA.b #$05 ; SFX2.05
|1E8749| STA.w $012E

.not_hit
|1E874C| RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Body

.oam_groups
|1E874D| dw -24, -32 : db $80, $0B, $00, $02
|1E8755| dw  -8, -32 : db $82, $0B, $00, $02
|1E875D| dw   8, -32 : db $82, $4B, $00, $02
|1E8765| dw  24, -32 : db $80, $4B, $00, $02
|1E876D| dw -24, -16 : db $84, $0B, $00, $02
|1E8775| dw  -8, -16 : db $86, $0B, $00, $02
|1E877D| dw   8, -16 : db $86, $4B, $00, $02
|1E8785| dw  24, -16 : db $84, $4B, $00, $02
|1E878D| dw -24,   0 : db $88, $0B, $00, $02
|1E8795| dw  -8,   0 : db $8A, $0B, $00, $02
|1E879D| dw   8,   0 : db $8A, $4B, $00, $02
|1E87A5| dw  24,   0 : db $88, $4B, $00, $02
|1E87AD| dw -24,  16 : db $8C, $0B, $00, $02
|1E87B5| dw  -8,  16 : db $8E, $0B, $00, $02
|1E87BD| dw   8,  16 : db $8E, $4B, $00, $02
|1E87C5| dw  24,  16 : db $8C, $4B, $00, $02
|1E87CD| dw  -8,  32 : db $A0, $0B, $00, $02
|1E87D5| dw   8,  32 : db $A0, $4B, $00, $02
|1E87DD| dw   0, -40 : db $AC, $0B, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Body:
|1E87E5| REP #$20

|1E87E7| LDA.w #.oam_groups
|1E87EA| STA.b $08

|1E87EC| SEP #$20

|1E87EE| LDA.b #$13

;===================================================================================================

TabulatedSpriteDraw_bank1E:
|1E87F0| JSL TabulatedSpriteDraw

|1E87F4| RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Legs

.offset_x
|1E87F5| db -28, -28,  28,  28

.offset_y
|1E87F9| db -28,   4, -28,   4

.char
|1E87FD| db $A2, $A6, $A2, $A6

.prop
|1E8801| db $0B, $0B, $4B, $4B

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Legs:
|1E8805| REP #$20

|1E8807| LDA.b $90
|1E8809| CLC
|1E880A| ADC.w #$004C
|1E880D| STA.b $90

|1E880F| LDA.b $92
|1E8811| CLC
|1E8812| ADC.w #$0013
|1E8815| STA.b $92

|1E8817| SEP #$20

|1E8819| PHX

|1E881A| LDY.b #$00
|1E881C| LDA.b #$03
|1E881E| STA.w $0FB5

.next_leg
|1E8821| LDX.w $0FB5

|1E8824| LDA.b $00
|1E8826| CLC
|1E8827| ADC.w .offset_x,X
|1E882A| STA.b ($90),Y

|1E882C| LDA.b $02
|1E882E| CLC
|1E882F| ADC.w .offset_y,X
|1E8832| CLC
|1E8833| ADC.w $0B08,X
|1E8836| INY
|1E8837| STA.b ($90),Y

|1E8839| LDA.w .char,X
|1E883C| INY
|1E883D| STA.b ($90),Y

|1E883F| LDA.w .prop,X
|1E8842| EOR.b $05
|1E8844| INY
|1E8845| STA.b ($90),Y

|1E8847| PHY

|1E8848| TYA
|1E8849| LSR A
|1E884A| LSR A
|1E884B| TAY

|1E884C| LDA.b #$02
|1E884E| STA.b ($92),Y

|1E8850| PLY
|1E8851| INY

|1E8852| LDA.b $00
|1E8854| CLC
|1E8855| ADC.w .offset_x,X
|1E8858| STA.b ($90),Y

|1E885A| LDA.b $02
|1E885C| CLC
|1E885D| ADC.w .offset_y,X
|1E8860| CLC
|1E8861| ADC.b #$10
|1E8863| CLC
|1E8864| ADC.w $0B08,X
|1E8867| INY
|1E8868| STA.b ($90),Y

|1E886A| LDA.w .char,X
|1E886D| CLC
|1E886E| ADC.b #$02
|1E8870| INY
|1E8871| STA.b ($90),Y

|1E8873| LDA.w .prop,X
|1E8876| EOR.b $05
|1E8878| INY
|1E8879| STA.b ($90),Y

|1E887B| PHY

|1E887C| TYA
|1E887D| LSR A
|1E887E| LSR A
|1E887F| TAY

|1E8880| LDA.b #$02
|1E8882| STA.b ($92),Y

|1E8884| PLY
|1E8885| INY

|1E8886| DEC.w $0FB5
|1E8889| BPL .next_leg

|1E888B| PLX

|1E888C| LDA.b $11
|1E888E| BEQ .exit

|1E8890| LDY.b #$02
|1E8892| LDA.b #$07
|1E8894| JSL CorrectOAMEntries_long

|1E8898| JSR GetScreenCoordinates_bank1E

.exit
|1E889B| RTS

;===================================================================================================

pool SpriteDraw_KingHelmasaur_Mouth

.offset_y
|1E889C| db  1,  2,  3,  4,  5,  6,  7,  8
|1E88A4| db  9, 10, 10, 10, 10, 10, 10, 10
|1E88AC| db 10, 10, 10, 10, 10, 10, 10,  9
|1E88B4| db  8,  7,  6,  5,  4,  3,  2,  1

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_KingHelmasaur_Mouth:
|1E88BC| LDA.w $0E10,X
|1E88BF| BEQ .exit

|1E88C1| LSR A
|1E88C2| LSR A
|1E88C3| TAY

|1E88C4| LDA.w .offset_y,Y
|1E88C7| STA.b $06

|1E88C9| LDA.b #$04
|1E88CB| JSL AllocateOAMInRegionB

|1E88CF| LDY.b #$00
|1E88D1| LDA.b $00
|1E88D3| STA.b ($90),Y

|1E88D5| LDA.b $02
|1E88D7| CLC
|1E88D8| ADC.b #$13

|1E88DA| ADC.b $06
|1E88DC| INY
|1E88DD| STA.b ($90),Y

|1E88DF| LDA.b #$AA
|1E88E1| INY
|1E88E2| STA.b ($90),Y

|1E88E4| LDA.b $05
|1E88E6| EOR.b #$0B
|1E88E8| INY
|1E88E9| STA.b ($90),Y

|1E88EB| LDA.b #$02
|1E88ED| STA.b ($92)

.exit
|1E88EF| RTS

;===================================================================================================

pool KingHelmasaur_OperateTail

.multiplier_a
|1E88F0| db $FF, $F0, $E0, $D0, $C0, $B0, $A0, $90
|1E88F8| db $80, $70, $60, $50, $40, $30, $20, $10

.multiplier_b
|1E8900| db $FF, $F8, $F0, $E8, $E0, $D8, $D0, $C8
|1E8908| db $BC, $B0, $A0, $90, $70, $40, $20, $10

.multiplier_c
|1E8910| db $FF, $F0, $E0, $D0, $C0, $B0, $A0, $90
|1E8918| db $80, $70, $60, $50, $40, $30, $20, $10

endpool

;---------------------------------------------------------------------------------------------------

KingHelmasaur_OperateTail:
|1E8920| STZ.w $0FB5

.next_segment
|1E8923| LDY.w $0FB5
|1E8926| PHY

|1E8927| LDA.w $0EC0,X
|1E892A| BEQ .use_set_a

|1E892C| TYA
|1E892D| CLC
|1E892E| ADC.b #$10
|1E8930| TAY

.use_set_a
|1E8931| REP #$20

|1E8933| LDA.w $0B2D
|1E8936| CLC
|1E8937| ADC.w $0B31
|1E893A| STA.b $0D

|1E893C| SEP #$20

|1E893E| LDA.b $0E
|1E8940| CMP.b #$01

|1E8942| PHP
|1E8943| PHP

|1E8944| LDA.b $0D
|1E8946| PLP
|1E8947| BPL .pos_a

|1E8949| EOR.b #$FF
|1E894B| INC A

.pos_a
|1E894C| STA.w WRMPYA

|1E894F| LDA.w .multiplier_a,Y
|1E8952| STA.w WRMPYB

|1E8955| JSR NOP8

|1E8958| LDA.w RDMPYH

|1E895B| PLP
|1E895C| BPL .pos_b

|1E895E| EOR.b #$FF

.pos_b
|1E8960| STA.b $06

|1E8962| LDA.b $0E
|1E8964| STA.b $07

|1E8966| PLY

|1E8967| LDA.w $0B2F
|1E896A| STA.w WRMPYA

|1E896D| LDA.w .multiplier_c,Y
|1E8970| STA.w WRMPYB

|1E8973| JSR NOP8

|1E8976| LDA.w RDMPYH
|1E8979| STA.b $0F

|1E897B| PHX
|1E897C| REP #$30

|1E897E| LDA.b $06
|1E8980| AND.w #$00FF
|1E8983| ASL A
|1E8984| TAX

|1E8985| LDA.l TrigTable,X
|1E8989| STA.b $0A

|1E898B| LDA.b $06
|1E898D| CLC
|1E898E| ADC.w #$0080
|1E8991| STA.b $08

|1E8993| AND.w #$00FF
|1E8996| ASL A
|1E8997| TAX

|1E8998| LDA.l TrigTable,X
|1E899C| STA.b $0C

|1E899E| SEP #$30

|1E89A0| PLX

|1E89A1| LDA.b $0A
|1E89A3| STA.w WRMPYA

|1E89A6| LDA.b $0F
|1E89A8| LDY.b $0B
|1E89AA| BNE .nonzero_a

|1E89AC| STA.w WRMPYB

|1E89AF| JSR NOP8

|1E89B2| ASL.w RDMPYL
|1E89B5| LDA.w RDMPYH
|1E89B8| ADC.b #$00

.nonzero_a
|1E89BA| LSR.b $07
|1E89BC| BCC .keep_sign_a

|1E89BE| EOR.b #$FF
|1E89C0| INC A

.keep_sign_a
|1E89C1| LDY.w $0FB5

|1E89C4| STA.w $0B0D,Y

|1E89C7| LDA.b $0C
|1E89C9| STA.w WRMPYA

|1E89CC| LDA.b $0F

|1E89CE| LDY.b $0D
|1E89D0| BNE .nonzero_b

|1E89D2| STA.w WRMPYB

|1E89D5| JSR NOP8

|1E89D8| ASL.w RDMPYL
|1E89DB| LDA.w RDMPYH
|1E89DE| ADC.b #$00

.nonzero_b
|1E89E0| LSR.b $09
|1E89E2| BCC .keep_sign_b

|1E89E4| EOR.b #$FF
|1E89E6| INC A

.keep_sign_b
|1E89E7| LDY.w $0FB5

|1E89EA| SEC
|1E89EB| SBC.b #$28
|1E89ED| STA.w $0B1D,Y

|1E89F0| INC.w $0FB5

|1E89F3| LDA.w $0FB5
|1E89F6| CMP.b #$10
|1E89F8| BEQ SpriteDraw_HelmasaurKingTailSegment

|1E89FA| JMP.w .next_segment

;===================================================================================================

SpriteDraw_HelmasaurKingTailSegment:
|1E89FD| LDA.w $0EC0,X
|1E8A00| STA.b $0A

|1E8A02| STZ.b $0F

|1E8A04| PHX

|1E8A05| LDX.w $0B33
|1E8A08| CPX.b #$10
|1E8A0A| BEQ .skip

|1E8A0C| LDY.b #$00

.next_segment
|1E8A0E| LDA.b $00
|1E8A10| CLC
|1E8A11| ADC.w $0B0D,X
|1E8A14| STA.b ($90),Y
|1E8A16| STA.b $08

|1E8A18| LDA.b $02
|1E8A1A| CLC
|1E8A1B| ADC.w $0B1D,X

|1E8A1E| INY

|1E8A1F| STA.b ($90),Y
|1E8A21| STA.b $09

|1E8A23| LDA.b #$AC

|1E8A25| CPY.b #$01
|1E8A27| BNE .not_the_tip

|1E8A29| LDA.b #$E4

.not_the_tip
|1E8A2B| INY

|1E8A2C| STA.b ($90),Y

|1E8A2E| LDA.b $05
|1E8A30| EOR.b #$1B
|1E8A32| INY
|1E8A33| STA.b ($90),Y

|1E8A35| INY

|1E8A36| TXA
|1E8A37| EOR.b $1A
|1E8A39| AND.b #$00

|1E8A3B| ORA.w $031F
|1E8A3E| BNE .no_player_contact

|1E8A40| LDA.b $0A
|1E8A42| BEQ .no_player_contact

|1E8A44| LDA.b $22
|1E8A46| SBC.b $E2
|1E8A48| SBC.b $08

|1E8A4A| ADC.b #$0C
|1E8A4C| CMP.b #$18
|1E8A4E| BCS .no_player_contact

|1E8A50| LDA.b $20
|1E8A52| SBC.b $E8
|1E8A54| ADC.b #$08

|1E8A56| SBC.b $09
|1E8A58| ADC.b #$08

|1E8A5A| CMP.b #$10
|1E8A5C| BCS .no_player_contact

|1E8A5E| INC.b $0F

|1E8A60| STZ.b $28

|1E8A62| LDA.b #$38
|1E8A64| STA.b $27

.no_player_contact
|1E8A66| INX
|1E8A67| CPX.b #$10
|1E8A69| BNE .next_segment

.skip
|1E8A6B| PLX

|1E8A6C| LDA.b $0F
|1E8A6E| BEQ .no_damage

|1E8A70| LDA.w $0FFC
|1E8A73| BNE .no_damage

|1E8A75| JSL AttemptDamageToLinkPlusRecoil_long

.no_damage
|1E8A79| LDY.b #$02
|1E8A7B| LDA.b #$0F
|1E8A7D| JSL CorrectOAMEntries_long

|1E8A81| JSR GetScreenCoordinates_bank1E

|1E8A84| RTS

;===================================================================================================

NOP8:
|1E8A85| NOP
|1E8A86| NOP
|1E8A87| NOP
|1E8A88| NOP

|1E8A89| NOP
|1E8A8A| NOP
|1E8A8B| NOP
|1E8A8C| NOP

|1E8A8D| RTS

;===================================================================================================

MagicBatLightning:
|1E8A8E| PHB
|1E8A8F| PHK
|1E8A90| PLB

|1E8A91| JSR .main

|1E8A94| PLB

|1E8A95| RTL

;---------------------------------------------------------------------------------------------------

.main
|1E8A96| LDA.w $0E80,X
|1E8A99| AND.b #$10
|1E8A9B| BEQ .in_front

|1E8A9D| LDA.b #$04
|1E8A9F| JSL AllocateOAMInRegionB

.in_front
|1E8AA3| JSL SpriteDraw_SingleSmall_long
|1E8AA7| JSR CheckIfActive_bank1E

|1E8AAA| LDA.w $0D80,X
|1E8AAD| BNE .active

|1E8AAF| JSR MoveSpriteXY_bank1E

|1E8AB2| LDA.w $0DF0,X
|1E8AB5| BNE .wait

|1E8AB7| INC.w $0D80,X

.wait
|1E8ABA| RTS

;---------------------------------------------------------------------------------------------------

.offset_x
|1E8ABB| db 0, 4, 8, 12, 12, 4, 8, 0

.offset_y
|1E8AC3| db 0, 4, 8, 12, 12, 4, 8, 0

;---------------------------------------------------------------------------------------------------

.active
|1E8ACB| INC.w $0D80,X
|1E8ACE| BNE .stayalive

|1E8AD0| STZ.w $0DD0,X

.stayalive
|1E8AD3| INC.w $0E80,X

|1E8AD6| LDA.w $0E80,X
|1E8AD9| PHA

|1E8ADA| AND.b #$07
|1E8ADC| BNE .no_sfx

|1E8ADE| LDA.b #$30 ; SFX3.30
|1E8AE0| STA.w $012F

.no_sfx
|1E8AE3| PLA
|1E8AE4| LSR A
|1E8AE5| LSR A
|1E8AE6| PHA

|1E8AE7| AND.b #$07
|1E8AE9| TAY

|1E8AEA| LDA.b $22
|1E8AEC| CLC
|1E8AED| ADC.w .offset_x,Y
|1E8AF0| STA.w $0D10,X

|1E8AF3| LDA.b $23
|1E8AF5| ADC.b #$00
|1E8AF7| STA.w $0D30,X

|1E8AFA| PLA
|1E8AFB| LSR A
|1E8AFC| LSR A
|1E8AFD| AND.b #$07
|1E8AFF| TAY

|1E8B00| LDA.b $20
|1E8B02| CLC
|1E8B03| ADC.w .offset_y,Y
|1E8B06| STA.w $0D00,X

|1E8B09| LDA.b $21
|1E8B0B| ADC.b #$00
|1E8B0D| STA.w $0D20,X

|1E8B10| RTS

;===================================================================================================

SpriteModule_Active_bank1E:
|1E8B11| PHB
|1E8B12| PHK
|1E8B13| PLB

|1E8B14| JSR .main

|1E8B17| PLB

|1E8B18| RTL

;---------------------------------------------------------------------------------------------------

.main
|1E8B19| LDA.w $0E20,X
|1E8B1C| SEC
|1E8B1D| SBC.b #$79

|1E8B1F| REP #$30

|1E8B21| AND.w #$00FF
|1E8B24| ASL A
|1E8B25| TAY

|1E8B26| LDA.w .vectors,Y
|1E8B29| DEC A
|1E8B2A| PHA

|1E8B2B| SEP #$30

|1E8B2D| RTS

;===================================================================================================

#CheckSpriteTileCollision_bank1E:
|1E8B2E| JSL CheckSpriteTileCollision_long

|1E8B32| RTS

;===================================================================================================

.vectors
|1E8B33| dw Sprite_79_Bee
|1E8B35| dw Sprite_7A_Agahnim
|1E8B37| dw Sprite_7B_AgahnimBalls
|1E8B39| dw Sprite_7C_GreenStalfos
|1E8B3B| dw Sprite_7D_BigSpike
|1E8B3D| dw Sprite_7E_Firebar_Clockwise
|1E8B3F| dw Sprite_7F_Firebar_Counterclockwise
|1E8B41| dw Sprite_80_Firesnake
|1E8B43| dw Sprite_81_Hover
|1E8B45| dw Sprite_82_AntifairyCircle
|1E8B47| dw Sprite_83_GreenEyegore
|1E8B49| dw Sprite_84_RedEyegore
|1E8B4B| dw Sprite_85_YellowStalfos
|1E8B4D| dw Sprite_86_Kodongo
|1E8B4F| dw Sprite_87_KodongoFire
|1E8B51| dw Sprite_88_Mothula
|1E8B53| dw Sprite_89_MothulaBeam
|1E8B55| dw Sprite_8A_SpikeBlock
|1E8B57| dw Sprite_8B_Gibdo
|1E8B59| dw Sprite_8C_Arrghus
|1E8B5B| dw Sprite_8D_Arrghi
|1E8B5D| dw Sprite_8E_Terrorpin
|1E8B5F| dw Sprite_8F_Blob
|1E8B61| dw Sprite_90_Wallmaster
|1E8B63| dw Sprite_91_StalfosKnight
|1E8B65| dw Sprite_92_HelmasaurKing
|1E8B67| dw Sprite_93_Bumper
|1E8B69| dw Sprite_94_Pirogusu
|1E8B6B| dw Sprite_95_LaserEyeLeft
|1E8B6D| dw Sprite_96_LaserEyeRight
|1E8B6F| dw Sprite_97_LaserEyeTop
|1E8B71| dw Sprite_98_LaserEyeBottom
|1E8B73| dw Sprite_99_Pengator
|1E8B75| dw Sprite_9A_Kyameron
|1E8B77| dw Sprite_9B_Wizzrobe
|1E8B79| dw Sprite_9C_Zoro
|1E8B7B| dw Sprite_9D_Babasu
|1E8B7D| dw Sprite_9E_HauntedGroveOstrich
|1E8B7F| dw Sprite_9F_HauntedGroveRabbit
|1E8B81| dw Sprite_A0_HauntedGroveBird
|1E8B83| dw Sprite_A1_Freezor
|1E8B85| dw Sprite_A2_Kholdstare
|1E8B87| dw Sprite_A3_KholdstareShell
|1E8B89| dw Sprite_A4_FallingIce
|1E8B8B| dw Sprite_A5_BlueZazak
|1E8B8D| dw Sprite_A6_RedZazak
|1E8B8F| dw Sprite_A7_Stalfos
|1E8B91| dw Sprite_A8_GreenZirro
|1E8B93| dw Sprite_A9_BlueZirro
|1E8B95| dw Sprite_AA_Pikit
|1E8B97| dw Sprite_AB_CrystalMaiden
|1E8B99| dw Sprite_AC_Apple
|1E8B9B| dw Sprite_AD_OldMan
|1E8B9D| dw Sprite_AE_Pipe_Down
|1E8B9F| dw Sprite_AF_Pipe_Up
|1E8BA1| dw Sprite_B0_Pipe_Right
|1E8BA3| dw Sprite_B1_Pipe_Left
|1E8BA5| dw Sprite_B2_PlayerBee
|1E8BA7| dw Sprite_B3_PedestalPlaque
|1E8BA9| dw Sprite_B4_PurpleChest
|1E8BAB| dw Sprite_B5_BombShop
|1E8BAD| dw Sprite_B6_Kiki
|1E8BAF| dw Sprite_B7_BlindMaiden
|1E8BB1| dw Sprite_B8_DialogueTester
|1E8BB3| dw Sprite_B9_BullyAndPinkBall
|1E8BB5| dw Sprite_BA_Whirlpool
|1E8BB7| dw Sprite_BB_Shopkeeper
|1E8BB9| dw Sprite_BC_Drunkard

;===================================================================================================

UNREACHABLE_1E8BBB:
|1E8BBB| db $00, $00, $00, $00

;===================================================================================================

Sprite_AA_Pikit:
|1E8BBF| JSR Pikit_PrepDraw
|1E8BC2| JSR CheckIfActive_bank1E
|1E8BC5| JSR HandleSpriteRecoil_bank1E
|1E8BC8| JSR CheckDamageToAndFromLink_bank1E

|1E8BCB| LDA.w $0D80,X
|1E8BCE| JSL JumpTableLocal
|1E8BD2| dw Pikit_PikNextMovement
|1E8BD4| dw Pikit_LandAndAttack
|1E8BD6| dw Pikit_Steal

;===================================================================================================

Sixteen_X:
|1E8BD8| db  16, -16

Sixteen_Y:
|1E8BDA| db   0,   0,  16, -16

;===================================================================================================

Pikit_PikNextMovement:
|1E8BDE| LDA.w $0DF0,X
|1E8BE1| BNE Pikit_Animate

|1E8BE3| INC.w $0D80,X
|1E8BE6| INC.w $0DB0,X

|1E8BE9| LDA.w $0DB0,X
|1E8BEC| CMP.b #$04
|1E8BEE| BNE .random_direction

.target_link
|1E8BF0| STZ.w $0DB0,X

|1E8BF3| JSR GetDirectionTowardsLink_bank1E

|1E8BF6| BRA .direction_continue

.random_direction
|1E8BF8| JSL GetRandomNumber
|1E8BFC| AND.b #$03
|1E8BFE| TAY

.direction_continue
|1E8BFF| LDA.w Sixteen_X,Y
|1E8C02| STA.w $0D50,X

|1E8C05| LDA.w Sixteen_Y,Y
|1E8C08| STA.w $0D40,X

|1E8C0B| JSL GetRandomNumber
|1E8C0F| AND.b #$07
|1E8C11| ADC.b #$13
|1E8C13| STA.w $0F80,X

;===================================================================================================

Pikit_Animate:
|1E8C16| INC.w $0E80,X

|1E8C19| LDA.w $0E80,X

|1E8C1C| LSR A
|1E8C1D| LSR A
|1E8C1E| LSR A

|1E8C1F| AND.b #$01
|1E8C21| STA.w $0DC0,X

|1E8C24| RTS

;===================================================================================================

Pikit_LandAndAttack:
|1E8C25| JSR MoveSpriteXYZ_bank1E
|1E8C28| JSR CheckSpriteTileCollision_bank1E

|1E8C2B| DEC.w $0F80,X
|1E8C2E| DEC.w $0F80,X

|1E8C31| LDA.w $0F70,X
|1E8C34| BPL .airborne

|1E8C36| STZ.w $0F70,X
|1E8C39| STZ.w $0F80,X

|1E8C3C| JSR GetDirectionTowardsLink_bank1E

|1E8C3F| LDA.b $0E
|1E8C41| CLC
|1E8C42| ADC.b #$30
|1E8C44| CMP.b #$60
|1E8C46| BCS .dont_tongue_link

|1E8C48| LDA.b $0F
|1E8C4A| CLC
|1E8C4B| ADC.b #$30
|1E8C4D| CMP.b #$60
|1E8C4F| BCS .dont_tongue_link

|1E8C51| INC.w $0D80,X

|1E8C54| LDA.b #$1F
|1E8C56| JSL ProjectSpriteSpeedTowardsLink_long
|1E8C5A| JSL ConvertVelocityToAngle

|1E8C5E| LSR A
|1E8C5F| STA.w $0DE0,X

|1E8C62| LDA.b #$5F
|1E8C64| STA.w $0DF0,X

|1E8C67| RTS

;---------------------------------------------------------------------------------------------------

.dont_tongue_link
|1E8C68| STZ.w $0D80,X

|1E8C6B| LDA.b #$10
|1E8C6D| STA.w $0DF0,X

.airborne
|1E8C70| BRA Pikit_Animate

;===================================================================================================

pool Pikit_Steal

.anim
|1E8C72| db $02, $02, $02, $02, $03, $03, $03, $03
|1E8C7A| db $03, $03, $03, $03, $03, $03, $03, $03
|1E8C82| db $03, $03, $03, $03, $02, $02, $02, $02

.pos
|1E8C8A| db   0,   0,   0,   0,   0,   0,   0,   0
|1E8C92| db   0,   0,   0,   0,   0,   0,   0,   0
|1E8C9A| db   0,   0,   0,   0,   0,   0,   0,   0

|1E8CA2| db   0,   0,   0,   0,   0,   0,   0,   0
|1E8CAA| db  12,  16,  24,  32,  32,  24,  16,  12
|1E8CB2| db   0,   0,   0,   0,   0,   0,   0,   0

|1E8CBA| db   0,   0,   0,   0,   0,   0,   0,   0
|1E8CC2| db -12, -16, -24, -32, -32, -24, -16, -12
|1E8CCA| db   0,   0,   0,   0,   0,   0,   0,   0

.index_offset_x
|1E8CD2| db $18, $18, $00, $30, $30, $30, $00, $18

.index_offset_y
|1E8CDA| db $00, $18, $18, $18, $00, $30, $30, $30

endpool

;---------------------------------------------------------------------------------------------------

Pikit_Steal:
|1E8CE2| LDA.w $0DF0,X
|1E8CE5| BNE .lickylicky

|1E8CE7| STZ.w $0D80,X

|1E8CEA| LDA.b #$10
|1E8CEC| STA.w $0DF0,X

|1E8CEF| STZ.w $0D90,X
|1E8CF2| STZ.w $0DA0,X
|1E8CF5| STZ.w $0ED0,X

|1E8CF8| RTS

;---------------------------------------------------------------------------------------------------

.lickylicky
|1E8CF9| LSR A
|1E8CFA| LSR A
|1E8CFB| PHA

|1E8CFC| TAY

|1E8CFD| LDA.w .anim,Y
|1E8D00| STA.w $0DC0,X

|1E8D03| TYA

|1E8D04| LDY.w $0DE0,X
|1E8D07| PHY

|1E8D08| CLC
|1E8D09| ADC.w .index_offset_x,Y
|1E8D0C| TAY

|1E8D0D| LDA.w .pos,Y
|1E8D10| STA.w $0D90,X

|1E8D13| STA.b $04
|1E8D15| STZ.b $05

|1E8D17| BPL .positive_x

|1E8D19| DEC.b $05

.positive_x
|1E8D1B| PLY

|1E8D1C| PLA
|1E8D1D| CLC
|1E8D1E| ADC.w .index_offset_y,Y

|1E8D21| TAY
|1E8D22| LDA.w .pos,Y

|1E8D25| STA.w $0DA0,X

|1E8D28| STA.b $06
|1E8D2A| STZ.b $07
|1E8D2C| STZ.b $07

|1E8D2E| BPL .positive_y

|1E8D30| DEC.b $07

.positive_y
|1E8D32| LDA.w $0ED0,X
|1E8D35| BNE .exit

|1E8D37| REP #$20

|1E8D39| LDA.w $0FD8
|1E8D3C| CLC
|1E8D3D| ADC.b $04
|1E8D3F| SEC
|1E8D40| SBC.b $22
|1E8D42| CLC
|1E8D43| ADC.w #$000C

|1E8D46| CMP.w #$0018
|1E8D49| BCS .exit

|1E8D4B| LDA.w $0FDA
|1E8D4E| CLC
|1E8D4F| ADC.b $06
|1E8D51| SEC
|1E8D52| SBC.b $20
|1E8D54| CLC
|1E8D55| ADC.w #$000C

|1E8D58| CMP.w #$0020
|1E8D5B| BCS .exit

;---------------------------------------------------------------------------------------------------

|1E8D5D| SEP #$20

|1E8D5F| LDA.w $0DF0,X
|1E8D62| CMP.b #$2E
|1E8D64| BCS .exit

|1E8D66| JSL CalculateLinkSFXPan
|1E8D6A| ORA.b #$26 ; SFX2.26
|1E8D6C| STA.w $012E

|1E8D6F| JSL GetRandomNumber
|1E8D73| AND.b #$03
|1E8D75| INC A
|1E8D76| STA.w $0ED0,X
|1E8D79| STA.w $0E90,X

|1E8D7C| CMP.b #$01
|1E8D7E| BNE .dont_steal_bomb

|1E8D80| LDA.l $7EF343
|1E8D84| BEQ .dont_steal_anything

|1E8D86| DEC A
|1E8D87| STA.l $7EF343

|1E8D8B| RTS

.dont_steal_anything
|1E8D8C| SEP #$20

|1E8D8E| STZ.w $0ED0,X

|1E8D91| RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_bomb
|1E8D92| CMP.b #$02
|1E8D94| BNE .dont_steal_arrow

|1E8D96| LDA.l $7EF377
|1E8D9A| BEQ .dont_steal_anything

|1E8D9C| DEC A
|1E8D9D| STA.l $7EF377

|1E8DA1| RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_arrow
|1E8DA2| CMP.b #$03
|1E8DA4| BNE .dont_steal_rupee

|1E8DA6| REP #$20

|1E8DA8| LDA.l $7EF360
|1E8DAC| BEQ .dont_steal_anything

|1E8DAE| DEC A
|1E8DAF| STA.l $7EF360

.exit
|1E8DB3| SEP #$20

|1E8DB5| RTS

;---------------------------------------------------------------------------------------------------

.dont_steal_rupee
|1E8DB6| LDA.l $7EF35A
|1E8DBA| STA.w $0E30,X
|1E8DBD| BEQ .dont_steal_anything

|1E8DBF| CMP.b #$03
|1E8DC1| BEQ .dont_steal_anything

|1E8DC3| LDA.b #$00
|1E8DC5| STA.l $7EF35A

|1E8DC9| RTS

;===================================================================================================

Pikit_PrepDraw:
|1E8DCA| JSR GetScreenCoordinates_bank1E
|1E8DCD| JSL SpriteDraw_Pikit

|1E8DD1| RTS

;===================================================================================================

Sprite_A8_GreenZirro:
Sprite_A9_BlueZirro:
|1E8DD2| LDA.b #$30
|1E8DD4| STA.w $0B89,X

|1E8DD7| LDA.w $0D90,X
|1E8DDA| BEQ Zirro_Main

;===================================================================================================

Zirro_Bomb:
|1E8DDC| LDA.w $0D80,X
|1E8DDF| JSL JumpTableLocal
|1E8DE3| dw ZirroBomb_Falling
|1E8DE5| dw ZirroBomb_Exploding

;===================================================================================================

ZirroBomb_Falling:
|1E8DE7| JSL SpriteDraw_SingleSmall_long
|1E8DEB| JSR CheckIfActive_bank1E

|1E8DEE| JSR MoveSpriteXY_bank1E
|1E8DF1| JSR MoveSpriteZ_bank1E

|1E8DF4| DEC.w $0F80,X
|1E8DF7| DEC.w $0F80,X

|1E8DFA| LDA.w $0F70,X
|1E8DFD| BPL .exit

|1E8DFF| STZ.w $0F70,X

|1E8E02| INC.w $0D80,X

|1E8E05| LDA.b #$13
|1E8E07| STA.w $0DF0,X

|1E8E0A| INC.w $0E40,X

|1E8E0D| LDA.b #$0C ; SFX2.0C
|1E8E0F| JSL QueueSpriteSFX2WithPan

.exit
|1E8E13| RTS

;===================================================================================================

ZirroBomb_Exploding:
|1E8E14| JSL SpriteDraw_ZirroBomb
|1E8E18| JSR CheckIfActive_bank1E

|1E8E1B| LDA.b $1A
|1E8E1D| AND.b #$03
|1E8E1F| BNE .frame_rule

|1E8E21| INC.w $0DF0,X

.frame_rule
|1E8E24| JSL CheckDamageToLink_long

|1E8E28| RTS

;===================================================================================================

pool Zirro_Main

.speed_z
|1E8E29| db  1, -1

.max_z
|1E8E2B| db  8, -8

.anim_step
|1E8E2D| db $09, $0A, $08, $07

endpool

;---------------------------------------------------------------------------------------------------

Zirro_Main:
|1E8E31| LDA.w $0E00,X
|1E8E34| BEQ .not_focused

|1E8E36| LDY.w $0DE0,X

|1E8E39| LDA.w .anim_step,Y
|1E8E3C| STA.w $0DC0,X

.not_focused
|1E8E3F| LDA.w $0B89,X
|1E8E42| ORA.b #$30
|1E8E44| STA.w $0B89,X

|1E8E47| JSL SpriteDraw_Zirro
|1E8E4B| JSR CheckIfActive_bank1E
|1E8E4E| JSR HandleSpriteRecoil_bank1E

|1E8E51| LDA.w $0E00,X
|1E8E54| CMP.b #$08
|1E8E56| BNE .no_bombing

|1E8E58| JSR Zirro_DropBomb

.no_bombing
|1E8E5B| JSR CheckDamageToAndFromLink_bank1E

|1E8E5E| LDA.b $1A
|1E8E60| AND.b #$01
|1E8E62| BNE .dont_adjust_z_speed

|1E8E64| LDA.w $0ED0,X
|1E8E67| AND.b #$01
|1E8E69| TAY

|1E8E6A| LDA.w $0F80,X
|1E8E6D| CLC
|1E8E6E| ADC.w .speed_z,Y
|1E8E71| STA.w $0F80,X

|1E8E74| CMP.w .max_z,Y
|1E8E77| BNE .dont_adjust_z_speed

|1E8E79| INC.w $0ED0,X

.dont_adjust_z_speed
|1E8E7C| JSR MoveSpriteZ_bank1E
|1E8E7F| JSR GetDirectionTowardsLink_bank1E

|1E8E82| LDA.b $0E
|1E8E84| CLC
|1E8E85| ADC.b #$28
|1E8E87| CMP.b #$50
|1E8E89| BCS .dont_dodge

|1E8E8B| LDA.b $0F
|1E8E8D| CLC
|1E8E8E| ADC.b #$28
|1E8E90| CMP.b #$50
|1E8E92| BCS .dont_dodge

|1E8E94| LDA.b $44
|1E8E96| CMP.b #$80
|1E8E98| BEQ .dont_dodge

|1E8E9A| LDA.w $0372
|1E8E9D| BNE .dashing

|1E8E9F| LDA.b $3C
|1E8EA1| CMP.b #$09
|1E8EA3| BPL .dont_dodge

.dashing
|1E8EA5| LDA.b #$30
|1E8EA7| JSL ProjectSpriteSpeedTowardsLink_long

|1E8EAB| LDA.b $01
|1E8EAD| EOR.b #$FF
|1E8EAF| INC A
|1E8EB0| STA.w $0D50,X

|1E8EB3| LDA.b $00
|1E8EB5| EOR.b #$FF
|1E8EB7| INC A
|1E8EB8| STA.w $0D40,X

|1E8EBB| LDA.b #$08
|1E8EBD| STA.w $0DF0,X

|1E8EC0| LDA.b #$02
|1E8EC2| STA.w $0D80,X

.dont_dodge
|1E8EC5| LDA.w $0D80,X
|1E8EC8| JSL JumpTableLocal
|1E8ECC| dw Zirro_Idle
|1E8ECE| dw Zirro_Move
|1E8ED0| dw Zirro_Dodge

;===================================================================================================

Zirro_Dodge:
|1E8ED2| LDA.w $0DF0,X
|1E8ED5| BNE .still_dodging

|1E8ED7| STZ.w $0D80,X

.still_dodging
|1E8EDA| INC.w $0E80,X
|1E8EDD| INC.w $0E80,X

|1E8EE0| JSR Zirro_HandleMovement

|1E8EE3| RTS

;===================================================================================================

pool Zirro_Idle

.speed_x
|1E8EE4| db  16,  12,   0, -12, -16, -12,   0,  12

.speed_y
|1E8EEC| db   0,  12,  16,  12,   0, -12, -16, -12

.direction
|1E8EF4| db $00, $04, $02, $06

endpool

;---------------------------------------------------------------------------------------------------

Zirro_Idle:
|1E8EF8| LDA.w $0DF0,X
|1E8EFB| BNE .delay

|1E8EFD| INC.w $0D80,X
|1E8F00| INC.w $0DA0,X

|1E8F03| LDA.w $0DA0,X
|1E8F06| CMP.b #$03
|1E8F08| BNE .random_direction

|1E8F0A| STZ.w $0DA0,X

|1E8F0D| LDA.b #$30
|1E8F0F| STA.w $0DF0,X

|1E8F12| JSR GetDirectionTowardsLink_bank1E

|1E8F15| LDA.w .direction,Y
|1E8F18| BRA .use_direction

.random_direction
|1E8F1A| JSL GetRandomNumber
|1E8F1E| AND.b #$1F
|1E8F20| ORA.b #$20
|1E8F22| STA.w $0DF0,X

|1E8F25| AND.b #$07

.use_direction
|1E8F27| TAY

|1E8F28| LDA.w .speed_x,Y
|1E8F2B| STA.w $0D50,X

|1E8F2E| LDA.w .speed_y,Y
|1E8F31| STA.w $0D40,X

.delay
|1E8F34| BRA Zirro_Animate

;===================================================================================================

Zirro_Move:
|1E8F36| LDA.w $0DF0,X
|1E8F39| BNE Zirro_HandleMovement

|1E8F3B| STZ.w $0D80,X

|1E8F3E| LDA.b #$0A
|1E8F40| STA.w $0DF0,X

|1E8F43| LDY.w $0E20,X
|1E8F46| CPY.b #$A8 ; SPRITE A8
|1E8F48| BNE .not_green

|1E8F4A| LDA.b #$10
|1E8F4C| STA.w $0E00,X

.not_green
|1E8F4F| RTS

;===================================================================================================

Zirro_HandleMovement:
|1E8F50| JSR MoveSpriteXY_bank1E

;===================================================================================================

Zirro_Animate:
|1E8F53| JSR GetDirectionTowardsLink_bank1E
|1E8F56| TYA
|1E8F57| STA.w $0DE0,X

|1E8F5A| INC.w $0E80,X

|1E8F5D| LDA.w $0E80,X
|1E8F60| LSR A
|1E8F61| LSR A
|1E8F62| LSR A
|1E8F63| AND.b #$01
|1E8F65| STA.b $00

|1E8F67| LDA.w $0DE0,X
|1E8F6A| ASL A
|1E8F6B| ORA.b $00
|1E8F6D| STA.w $0DC0,X

|1E8F70| RTS

;===================================================================================================

pool Zirro_DropBomb

.offset_x_low
|1E8F71| db  14,  -6,   4,   4

.offset_x_high
|1E8F75| db   0,  -1,   0,   0

.offset_y_low
|1E8F79| db   7,   7,  12,  -4

.offset_y_high
|1E8F7D| db   0,   0,   0,  -1

endpool

;---------------------------------------------------------------------------------------------------

Zirro_DropBomb:
|1E8F81| LDA.b #$A8 ; SPRITE A8
|1E8F83| JSL SpawnSpriteDynamically
|1E8F87| BMI .exit

|1E8F89| LDA.b #$20 ; SFX2.20
|1E8F8B| JSL QueueSpriteSFX2WithPan

|1E8F8F| LDA.b $04
|1E8F91| STA.w $0F70,Y

|1E8F94| PHX

|1E8F95| LDX.w $0DE0,Y

|1E8F98| LDA.b $00
|1E8F9A| CLC
|1E8F9B| ADC.w .offset_x_low,X
|1E8F9E| STA.w $0D10,Y

|1E8FA1| LDA.b $01
|1E8FA3| ADC.w .offset_x_high,X
|1E8FA6| STA.w $0D30,Y

|1E8FA9| LDA.b $02
|1E8FAB| CLC
|1E8FAC| ADC.w .offset_y_low,X
|1E8FAF| STA.w $0D00,Y

|1E8FB2| LDA.b $03
|1E8FB4| ADC.w .offset_y_high,X
|1E8FB7| STA.w $0D20,Y

|1E8FBA| LDA.w Sixteen_X,X
|1E8FBD| STA.w $0D50,Y

|1E8FC0| LDA.w Sixteen_Y,X
|1E8FC3| STA.w $0D40,Y

|1E8FC6| PLX

|1E8FC7| LDA.b #$01
|1E8FC9| STA.w $0D90,Y
|1E8FCC| STA.w $0BA0,Y

|1E8FCF| LDA.b #$09
|1E8FD1| STA.w $0F60,Y

|1E8FD4| LDA.b #$33
|1E8FD6| STA.w $0E60,Y

|1E8FD9| AND.b #$0F
|1E8FDB| STA.w $0F50,Y

.exit
|1E8FDE| RTS

;===================================================================================================

StalfosBone:
|1E8FDF| JSR SpriteDraw_StalfosBone
|1E8FE2| JSR CheckIfActive_bank1E
|1E8FE5| JSR CheckDamageToLink_bank1E

|1E8FE8| INC.w $0E80,X

|1E8FEB| JSR MoveSpriteXY_bank1E

|1E8FEE| LDA.w $0DF0,X
|1E8FF1| BNE .exit

|1E8FF3| JSR CheckSpriteTileCollision_bank1E
|1E8FF6| BEQ .exit

|1E8FF8| STZ.w $0DD0,X

|1E8FFB| JSL PlaceWeaponTinkAtSprite

.exit
|1E8FFF| RTS

;===================================================================================================

pool SpriteDraw_StalfosBone

.oam_groups
|1E9000| dw  -4,  -2 : db $2F, $80, $00, $00
|1E9008| dw   4,   2 : db $2F, $40, $00, $00

|1E9010| dw  -4,   2 : db $2F, $00, $00, $00
|1E9018| dw   4,  -2 : db $2F, $C0, $00, $00

|1E9020| dw   2,  -4 : db $3F, $40, $00, $00
|1E9028| dw  -2,   4 : db $3F, $80, $00, $00

|1E9030| dw  -2,  -4 : db $3F, $00, $00, $00
|1E9038| dw   2,   4 : db $3F, $C0, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosBone:
|1E9040| LDA.b #$00
|1E9042| XBA
|1E9043| LDA.w $0E80,X

|1E9046| LSR A
|1E9047| LSR A
|1E9048| AND.b #$03

|1E904A| REP #$20

|1E904C| ASL A
|1E904D| ASL A
|1E904E| ASL A
|1E904F| ASL A

|1E9050| ADC.w #.oam_groups
|1E9053| STA.b $08

|1E9055| SEP #$20

|1E9057| LDA.b #$02
|1E9059| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

StalfosTimers:
|1E905C| db 16, 32, 64, 32

StalfosDrawStepsA:
|1E9060| db $06, $04, $00, $02, $07, $05, $01, $03

StalfosDrawStepsB:
|1E9068| db $08, $09, $0A, $0B

;===================================================================================================

Sprite_A7_Stalfos:
|1E906C| LDA.w $0D90,X
|1E906F| BEQ Stalfos

|1E9071| JMP.w StalfosBone

;===================================================================================================

Stalfos:
|1E9074| LDA.w $0E90,X
|1E9077| BEQ Stalfos_Skellington

;===================================================================================================

Stalfos_Invisible:
|1E9079| LDA.w $0DF0,X
|1E907C| BNE .wait_in_closet

|1E907E| LDA.b #$01
|1E9080| STA.w $0D50,X
|1E9083| STA.w $0D40,X

|1E9086| JSR CheckSpriteTileCollision_bank1E
|1E9089| BEQ .no_collision

|1E908B| STZ.w $0DD0,X

|1E908E| RTS

;---------------------------------------------------------------------------------------------------

.no_collision
|1E908F| STZ.w $0E90,X

|1E9092| LDA.b #$15 ; SFX2.15
|1E9094| JSL QueueSpriteSFX2WithPan

|1E9098| JSL SpawnPoofGarnish

|1E909C| LDA.b #$08
|1E909E| STA.w $0E10,X

|1E90A1| LDA.b #$40
|1E90A3| STA.w $0DF0,X

|1E90A6| STZ.w $0D40,X
|1E90A9| STZ.w $0D50,X

.wait_in_closet
|1E90AC| JSL GetScreenCoordinates_long

|1E90B0| RTS

;===================================================================================================

pool Stalfos_Skellington

.direction
|1E90B1| db $03, $02, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

Stalfos_Skellington:
|1E90B5| LDA.w $0DD0,X
|1E90B8| CMP.b #$09
|1E90BA| BNE .dont_dodge

|1E90BC| REP #$20

|1E90BE| LDA.b $22
|1E90C0| SEC
|1E90C1| SBC.w $0FD8
|1E90C4| CLC
|1E90C5| ADC.w #$0028

|1E90C8| CMP.w #$0050
|1E90CB| BCS .dont_dodge

|1E90CD| LDA.b $20
|1E90CF| SEC
|1E90D0| SBC.w $0FDA
|1E90D3| CLC
|1E90D4| ADC.w #$0030

|1E90D7| CMP.w #$0050
|1E90DA| BCS .dont_dodge

|1E90DC| SEP #$20

|1E90DE| LDA.b $44
|1E90E0| CMP.b #$80
|1E90E2| BEQ .dont_dodge

|1E90E4| LDA.w $0F70,X
|1E90E7| ORA.w $0F00,X
|1E90EA| BNE .dont_dodge

|1E90EC| LDA.b $EE
|1E90EE| CMP.w $0F20,X
|1E90F1| BNE .dont_dodge

|1E90F3| JSR GetDirectionTowardsLink_bank1E
|1E90F6| STY.b $00

|1E90F8| LDA.w $0372
|1E90FB| BNE .dodge

|1E90FD| LDA.b $3C
|1E90FF| CMP.b #$90
|1E9101| BCS .face_link

|1E9103| CMP.b #$09
|1E9105| BPL .dont_dodge

.dodge
|1E9107| LDA.b $2F
|1E9109| LSR A
|1E910A| TAY

|1E910B| LDA.b $00
|1E910D| CMP.w .direction,Y
|1E9110| BEQ .dont_dodge

.face_link
|1E9112| LDA.b $00
|1E9114| STA.w $0DE0,X

|1E9117| LDA.b #$20
|1E9119| JSL ProjectSpriteSpeedTowardsLink_long

|1E911D| LDA.b $01
|1E911F| EOR.b #$FF
|1E9121| INC A
|1E9122| STA.w $0D50,X

|1E9125| LDA.b $00
|1E9127| EOR.b #$FF
|1E9129| INC A
|1E912A| STA.w $0D40,X

|1E912D| LDA.b #$20
|1E912F| STA.w $0F80,X

|1E9132| LDA.b #$13 ; SFX3.13
|1E9134| JSL QueueSpriteSFX3WithPan

|1E9138| INC.w $0F70,X

;---------------------------------------------------------------------------------------------------

.dont_dodge
|1E913B| SEP #$20

|1E913D| LDA.w $0F70,X
|1E9140| BEQ Zazak_Main

|1E9142| LDY.w $0DE0,X

|1E9145| LDA.w StalfosDrawStepsB,Y
|1E9148| STA.w $0DC0,X

|1E914B| JSL SpriteDraw_Stalfos
|1E914F| JSR CheckIfActive_bank1E

|1E9152| LDA.w $0EA0,X
|1E9155| BEQ .not_recoiling

|1E9157| STZ.w $0F80,X

.not_recoiling
|1E915A| JSR HandleSpriteRecoil_bank1E
|1E915D| JSR CheckDamageToAndFromLink_bank1E
|1E9160| JSR CheckSpriteTileCollision_bank1E

|1E9163| PHA

|1E9164| AND.b #$03
|1E9166| BEQ .no_horizontal_tile_collision

|1E9168| STZ.w $0D50,X

.no_horizontal_tile_collision
|1E916B| PLA
|1E916C| AND.b #$0C
|1E916E| BEQ .no_vertical_tile_collision

|1E9170| STZ.w $0D40,X

.no_vertical_tile_collision
|1E9173| JSR MoveSpriteXYZ_bank1E

|1E9176| LDA.w $0F80,X
|1E9179| SEC
|1E917A| SBC.b #$02
|1E917C| STA.w $0F80,X

|1E917F| LDA.w $0F70,X
|1E9182| DEC A
|1E9183| BPL .exit

|1E9185| STZ.w $0F70,X

|1E9188| JSR ZeroVelocityXY_bank1E

|1E918B| LDA.b #$21 ; SFX2.21
|1E918D| JSL QueueSpriteSFX2WithPan

|1E9191| LDA.w $0E30,X
|1E9194| BEQ .exit

|1E9196| LDA.b #$10
|1E9198| STA.w $0EE0,X

|1E919B| STZ.w $0E80,X

.exit
|1E919E| RTS

;===================================================================================================

Zazak_Main:
Sprite_A5_BlueZazak:
Sprite_A6_RedZazak:
|1E919F| LDA.w $0DA0,X
|1E91A2| BEQ TrueZazak

;===================================================================================================

ZazakPhlegm:
|1E91A4| JSR SpriteDraw_Phlegm
|1E91A7| JSR CheckIfActive_bank1E

|1E91AA| LDA.b $1A
|1E91AC| LSR A
|1E91AD| AND.b #$01
|1E91AF| STA.w $0DC0,X

|1E91B2| JSR CheckDamageToLink_bank1E
|1E91B5| JSR MoveSpriteXY_bank1E

|1E91B8| JSR CheckSpriteTileCollision_bank1E
|1E91BB| BEQ .exit

|1E91BD| STZ.w $0DD0,X

|1E91C0| JSL PlaceWeaponTinkAtSprite_forced

.exit
|1E91C4| RTS

;===================================================================================================

TrueZazak:
|1E91C5| LDA.w $0EE0,X
|1E91C8| BEQ .dont_toss_bone

|1E91CA| PHA

|1E91CB| STZ.w $0D80,X

|1E91CE| LDA.b #$20
|1E91D0| STA.w $0DF0,X

|1E91D3| JSR ZeroVelocityXY_bank1E
|1E91D6| JSR GetDirectionTowardsLink_bank1E

|1E91D9| TYA
|1E91DA| STA.w $0EB0,X

|1E91DD| PLA

.dont_toss_bone
|1E91DE| CMP.b #$01
|1E91E0| BNE .definitely_dont_toss_bone

|1E91E2| JSR Stalfos_ThrowBone

|1E91E5| LDA.b #$01
|1E91E7| STA.w $0E80,X

.definitely_dont_toss_bone
|1E91EA| LDA.w $0E80,X
|1E91ED| AND.b #$01
|1E91EF| ASL A
|1E91F0| ASL A
|1E91F1| ADC.w $0DE0,X
|1E91F4| TAY

|1E91F5| LDA.w StalfosDrawStepsA,Y
|1E91F8| STA.w $0DC0,X

|1E91FB| LDA.w $0E20,X
|1E91FE| CMP.b #$A7 ; SPRITE A7
|1E9200| BNE .draw_as_zazak

.draw_as_stalfos
|1E9202| JSL SpriteDraw_Stalfos
|1E9206| JSR CheckIfActive_bank1E
|1E9209| BRA .draw_done

.draw_as_zazak
|1E920B| JSL SpriteDraw_Zazak
|1E920F| JSR CheckIfActive_bank1E

.draw_done
|1E9212| JSR HandleSpriteRecoil_bank1E
|1E9215| JSR CheckDamageToAndFromLink_bank1E
|1E9218| JSR MoveSpriteXY_bank1E
|1E921B| JSR CheckSpriteTileCollision_bank1E

|1E921E| LDA.w $0D80,X
|1E9221| JSL JumpTableLocal
|1E9225| dw StalfosZazak_Walk
|1E9227| dw StalfosZazak_Wait
|1E9229| dw StalfosZazak_Shoot

;===================================================================================================

StalfosZazak_Walk:
|1E922B| LDA.w $0DF0,X
|1E922E| BNE .exit

|1E9230| JSL GetRandomNumber
|1E9234| AND.b #$03
|1E9236| TAY

|1E9237| LDA.w StalfosTimers,Y
|1E923A| STA.w $0DF0,X

|1E923D| INC.w $0D80,X

|1E9240| LDA.w $0EB0,X
|1E9243| STA.w $0DE0,X

|1E9246| TAY

|1E9247| LDA.w Sixteen_X,Y
|1E924A| STA.w $0D50,X

|1E924D| LDA.w Sixteen_Y,Y
|1E9250| STA.w $0D40,X

.exit
|1E9253| RTS

;===================================================================================================

SharedDirections_Nice:
|1E9254| db $02, $03, $02, $03, $00, $01, $00, $01

;===================================================================================================

StalfosZazak_Wait:
|1E925C| LDA.b #$10

|1E925E| LDY.w $0E70,X
|1E9261| BNE .new_direction

|1E9263| LDA.w $0DF0,X
|1E9266| BNE .delay

|1E9268| LDA.w $0E20,X
|1E926B| CMP.b #$A6 ; SPRITE A6
|1E926D| BNE .dont_shoot

|1E926F| JSR GetDirectionTowardsLink_bank1E
|1E9272| TYA
|1E9273| CMP.w $0DE0,X
|1E9276| BNE .dont_shoot

|1E9278| LDA.b $EE
|1E927A| CMP.w $0F20,X
|1E927D| BNE .dont_shoot

|1E927F| INC.w $0D80,X

|1E9282| LDA.b #$30
|1E9284| STA.w $0DF0,X
|1E9287| STA.w $0E00,X

|1E928A| BRA ZeroVelocityXY_bank1E

.dont_shoot
|1E928C| LDA.b #$20

.new_direction
|1E928E| STA.w $0DF0,X

|1E9291| JSL GetRandomNumber
|1E9295| LSR A
|1E9296| LDA.w $0DE0,X
|1E9299| ROL A
|1E929A| TAY

|1E929B| LDA.w SharedDirections_Nice,Y
|1E929E| STA.w $0EB0,X

|1E92A1| STZ.w $0D80,X

|1E92A4| INC.w $0DB0,X

|1E92A7| LDA.w $0DB0,X
|1E92AA| CMP.b #$04
|1E92AC| BNE ZeroVelocityXY_bank1E

|1E92AE| STZ.w $0DB0,X

|1E92B1| JSR GetDirectionTowardsLink_bank1E
|1E92B4| TYA
|1E92B5| STA.w $0EB0,X

|1E92B8| LDA.b #$18
|1E92BA| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#ZeroVelocityXY_bank1E:
|1E92BD| STZ.w $0D50,X
|1E92C0| STZ.w $0D40,X

|1E92C3| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1E92C4| DEC.w $0ED0,X
|1E92C7| BPL .exit

|1E92C9| LDA.b #$0B
|1E92CB| STA.w $0ED0,X

|1E92CE| INC.w $0E80,X

.exit
|1E92D1| RTS

;===================================================================================================

StalfosZazak_Shoot:
|1E92D2| LDA.w $0DF0,X
|1E92D5| BNE .wait

|1E92D7| STZ.w $0D80,X

|1E92DA| RTS

.wait
|1E92DB| CMP.b #$18
|1E92DD| BNE .wait_some_more

|1E92DF| JSL Sprite_SpawnFirePhlegm

.wait_some_more
|1E92E3| RTS

;===================================================================================================

Sprite_SpawnFirePhlegm:
|1E92E4| PHB
|1E92E5| PHK
|1E92E6| PLB

|1E92E7| LDA.b #$A5 ; SPRITE A5
|1E92E9| JSL SpawnSpriteDynamically
|1E92ED| BMI .no_space

|1E92EF| LDA.b #$05 ; SFX3.05
|1E92F1| JSL QueueSpriteSFX3WithPan
|1E92F5| JSL SetSpawnedSpriteCoordinates

|1E92F9| PHX

|1E92FA| LDA.w $0DE0,X
|1E92FD| TAX

|1E92FE| LDA.b $00
|1E9300| CLC
|1E9301| ADC.w .offset_x_low,X
|1E9304| STA.w $0D10,Y

|1E9307| LDA.b $01
|1E9309| ADC.w .offset_x_high,X
|1E930C| STA.w $0D30,Y

|1E930F| LDA.b $02
|1E9311| CLC
|1E9312| ADC.w .offset_y_low,X
|1E9315| STA.w $0D00,Y

|1E9318| LDA.b $03
|1E931A| ADC.w .offset_y_high,X
|1E931D| STA.w $0D20,Y

|1E9320| LDA.w .speed_x,X
|1E9323| STA.w $0D50,Y

|1E9326| LDA.w .speed_y,X
|1E9329| STA.w $0D40,Y

|1E932C| LDA.w $0E60,Y
|1E932F| ORA.b #$40
|1E9331| STA.w $0E60,Y

|1E9334| LDA.b #$40
|1E9336| STA.w $0CAA,Y

|1E9339| LDA.b #$21
|1E933B| STA.w $0E40,Y
|1E933E| STA.w $0DA0,Y

|1E9341| LDA.b #$02
|1E9343| STA.w $0F50,Y

|1E9346| LDA.b #$14
|1E9348| STA.w $0F60,Y
|1E934B| STA.w $0BA0,Y

|1E934E| LDA.b #$25
|1E9350| STA.w $0CD2,Y

|1E9353| LDA.l $7EF35A
|1E9357| CMP.b #$03
|1E9359| BCC .not_blockable

|1E935B| LDA.b #$20
|1E935D| STA.w $0BE0,Y

.not_blockable
|1E9360| PLX

.no_space
|1E9361| PLB

|1E9362| RTL

;---------------------------------------------------------------------------------------------------

.speed_x ; bleeds into next
|1E9363| db  48, -48

.speed_y
|1E9365| db   0,   0,  48, -48

.offset_x_low
|1E9369| db  16,  -8,   4,   4

.offset_x_high
|1E936D| db   0,  -1,   0,   0

.offset_y_low
|1E9371| db  -2,  -2,   8, -20

.offset_y_high
|1E9375| db  -1,  -1,   0,  -1

;===================================================================================================

Stalfos_ThrowBone:
|1E9379| LDA.b #$A7 ; SPRITE A7
|1E937B| JSL SpawnSpriteDynamically
|1E937F| BMI .exit

|1E9381| LDA.b #$01
|1E9383| STA.w $0D90,Y

|1E9386| JSL SetSpawnedSpriteCoordinates

|1E938A| PHX
|1E938B| TYX

|1E938C| LDA.b #$20
|1E938E| JSL ApplySpeedTowardsLink_long

|1E9392| LDA.b #$21
|1E9394| STA.w $0E40,X
|1E9397| STA.w $0BA0,X

|1E939A| LDA.w $0E60,X
|1E939D| ORA.b #$40
|1E939F| STA.w $0E60,X

|1E93A2| LDA.b #$48
|1E93A4| STA.w $0CAA,X

|1E93A7| LDA.b #$10
|1E93A9| STA.w $0DF0,X

|1E93AC| LDA.b #$14
|1E93AE| STA.w $0F60,X

|1E93B1| LDA.b #$07
|1E93B3| STA.w $0F50,X

|1E93B6| LDA.b #$20
|1E93B8| STA.w $0CD2,X

|1E93BB| PLX

|1E93BC| LDA.b #$02 ; SFX2.02
|1E93BE| JSL QueueSpriteSFX2WithPan

.exit
|1E93C2| RTS

;===================================================================================================

pool SpriteDraw_Phlegm

.oam_groups
|1E93C3| dw   0,   0 : db $C3, $00, $00, $00
|1E93CB| dw  -8,   0 : db $C2, $00, $00, $00

|1E93D3| dw   0,   0 : db $C3, $80, $00, $00
|1E93DB| dw  -8,   0 : db $C2, $80, $00, $00

|1E93E3| dw   0,   0 : db $C3, $40, $00, $00
|1E93EB| dw   8,   0 : db $C2, $40, $00, $00

|1E93F3| dw   0,   0 : db $C3, $C0, $00, $00
|1E93FB| dw   8,   0 : db $C2, $C0, $00, $00

|1E9403| dw   0,   0 : db $D4, $00, $00, $00
|1E940B| dw   0,  -8 : db $D3, $00, $00, $00

|1E9413| dw   0,   0 : db $D4, $40, $00, $00
|1E941B| dw   0,  -8 : db $D3, $40, $00, $00

|1E9423| dw   0,   0 : db $D4, $80, $00, $00
|1E942B| dw   0,   8 : db $D3, $80, $00, $00

|1E9433| dw   0,   0 : db $D4, $C0, $00, $00
|1E943B| dw   0,   8 : db $D3, $C0, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Phlegm:
|1E9443| LDA.b #$00
|1E9445| XBA
|1E9446| LDA.w $0DE0,X

|1E9449| ASL A
|1E944A| CLC
|1E944B| ADC.w $0DC0,X

|1E944E| REP #$20

|1E9450| ASL A
|1E9451| ASL A
|1E9452| ASL A
|1E9453| ASL A
|1E9454| ADC.w #.oam_groups
|1E9457| STA.b $08

|1E9459| SEP #$20

|1E945B| LDA.b #$02
|1E945D| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

Sprite_A3_KholdstareShell:
|1E9460| JSR CheckIfActivePermissive_bank1E
|1E9463| JSR GetDirectionTowardsLink_bank1E

|1E9466| LDA.b $0F
|1E9468| CLC
|1E9469| ADC.b #$20
|1E946B| CMP.b #$40
|1E946D| BCS .link_not_close

|1E946F| LDA.b $0E
|1E9471| CLC
|1E9472| ADC.b #$20
|1E9474| CMP.b #$40
|1E9476| BCS .link_not_close

|1E9478| JSL AbortMovement
|1E947C| JSL RepelDash_long

.link_not_close
|1E9480| JSL CheckDamageFromLink_long

|1E9484| LDA.w $0D80,X
|1E9487| BNE .phase_out

|1E9489| LDA.w $0DD0,X
|1E948C| CMP.b #$06
|1E948E| BNE .shake

|1E9490| LDA.b #$C0
|1E9492| STA.w $0E60,X

|1E9495| INC.w $0D80,X

|1E9498| LDA.b #$09
|1E949A| STA.w $0DD0,X

|1E949D| RTS

;---------------------------------------------------------------------------------------------------

.offset_low
|1E949E| db  1, -1

.offset_high
|1E94A0| db  0, -1

;---------------------------------------------------------------------------------------------------

.shake
|1E94A2| LDA.w $0EF0,X
|1E94A5| BEQ .not_recoiling

|1E94A7| AND.b #$02
|1E94A9| LSR A
|1E94AA| TAY

|1E94AB| LDA.w .offset_low,Y
|1E94AE| STA.w $0422

|1E94B1| LDA.w .offset_high,Y
|1E94B4| STA.w $0423

|1E94B7| LDA.b #$01
|1E94B9| STA.w $0428

|1E94BC| RTS

.not_recoiling
|1E94BD| STZ.w $0428

|1E94C0| RTS

;---------------------------------------------------------------------------------------------------

.phase_out
|1E94C1| INC.w $0D80,X
|1E94C4| CMP.b #$12
|1E94C6| BEQ .activate_khold

|1E94C8| PHX
|1E94C9| JSL PaletteFilter_KholdstareShell
|1E94CD| PLX

|1E94CE| RTS

.activate_khold
|1E94CF| STZ.w $0DD0,X

|1E94D2| LDA.b #$02
|1E94D4| STA.w $0D82

|1E94D7| LDA.b #$80
|1E94D9| STA.w $0DF2

|1E94DC| RTS

;===================================================================================================

GenerateIceball:
|1E94DD| INC.w $0E80,X

|1E94E0| LDA.w $0E80,X
|1E94E3| AND.b #$7F
|1E94E5| ORA.w $0E00,X
|1E94E8| BNE .exit

|1E94EA| LDA.b #$A4 ; SPRITE A4
|1E94EC| JSL SpawnSpriteDynamically
|1E94F0| BMI .exit

|1E94F2| LDA.b $22
|1E94F4| STA.w $0D10,Y

|1E94F7| LDA.b $23
|1E94F9| STA.w $0D30,Y

|1E94FC| LDA.b $20
|1E94FE| STA.w $0D00,Y

|1E9501| LDA.b $21
|1E9503| STA.w $0D20,Y

|1E9506| LDA.b #$E0
|1E9508| STA.w $0F70,Y
|1E950B| STA.w $0DB0,Y

|1E950E| PHX
|1E950F| TYX

|1E9510| LDA.b #$20 ; SFX2.20
|1E9512| JSL QueueSpriteSFX2WithPan

|1E9516| PLX

.exit
|1E9517| RTS

;===================================================================================================

Sprite_A2_Kholdstare:
|1E9518| JSL SpriteDraw_Kholdstare
|1E951C| JSR CheckIfActive_bank1E

|1E951F| LDA.w $0D80,X
|1E9522| CMP.b #$02
|1E9524| BCS .no_garnish

|1E9526| JSR SpawnPuffCloudGarnish

|1E9529| LDA.b $1A
|1E952B| AND.b #$07
|1E952D| BNE .no_garnish

|1E952F| LDA.b #$02 ; SFX2.02
|1E9531| STA.w $012E

.no_garnish
|1E9534| JSR HandleSpriteRecoil_bank1E

|1E9537| DEC.w $0E80,X
|1E953A| BPL .delay_anim

|1E953C| LDA.b #$0A
|1E953E| STA.w $0E80,X

|1E9541| LDA.w $0DC0,X
|1E9544| INC A
|1E9545| AND.b #$03
|1E9547| STA.w $0DC0,X

.delay_anim
|1E954A| LDA.b $1A
|1E954C| AND.b #$03
|1E954E| BNE .dont_turn_eye

|1E9550| LDA.b #$1F
|1E9552| JSL ProjectSpriteSpeedTowardsLink_long
|1E9556| JSL ConvertVelocityToAngle
|1E955A| STA.w $0D90,X

.dont_turn_eye
|1E955D| JSR MoveSpriteXY_bank1E

|1E9560| LDA.w $0D80,X
|1E9563| JSL JumpTableLocal
|1E9567| dw Kholdstare_Accelerate
|1E9569| dw Kholdstare_Decelerate
|1E956B| dw Kholdstare_Split
|1E956D| dw Kholdstare_DoAbsolutelyNothing

;===================================================================================================

Kholdstare_Accelerate:
|1E956F| JSR CheckDamageToAndFromLink_bank1E

|1E9572| LDA.w $0DF0,X
|1E9575| BNE .delay

|1E9577| INC.w $0D80,X

|1E957A| JSL GetRandomNumber
|1E957E| AND.b #$3F
|1E9580| ADC.b #$20
|1E9582| STA.w $0DF0,X

|1E9585| RTS

.delay
|1E9586| LDA.w $0D50,X
|1E9589| CMP.w $0F80,X
|1E958C| BEQ .x_done
|1E958E| BPL .x_too_high

|1E9590| INC.w $0D50,X
|1E9593| BRA .x_done

.x_too_high
|1E9595| DEC.w $0D50,X

.x_done
|1E9598| LDA.w $0D40,X
|1E959B| CMP.w $0F90,X
|1E959E| BEQ Kholdstare_CheckTileCollision
|1E95A0| BPL .y_too_high

.y_too_low
|1E95A2| INC.w $0D40,X
|1E95A5| BRA Kholdstare_CheckTileCollision

.y_too_high
|1E95A7| DEC.w $0D40,X

;===================================================================================================

Kholdstare_CheckTileCollision:
|1E95AA| JSR CheckSpriteTileCollision_bank1E
|1E95AD| AND.b #$03
|1E95AF| BEQ .no_collision

|1E95B1| LDA.w $0D50,X
|1E95B4| EOR.b #$FF
|1E95B6| INC A
|1E95B7| STA.w $0D50,X

|1E95BA| LDA.w $0F80,X
|1E95BD| EOR.b #$FF
|1E95BF| INC A
|1E95C0| STA.w $0F80,X

.no_collision
|1E95C3| LDA.w $0E70,X
|1E95C6| AND.b #$0C
|1E95C8| BEQ .exit

|1E95CA| LDA.w $0D40,X
|1E95CD| EOR.b #$FF
|1E95CF| INC A
|1E95D0| STA.w $0D40,X

|1E95D3| LDA.w $0F90,X
|1E95D6| EOR.b #$FF
|1E95D8| INC A
|1E95D9| STA.w $0F90,X

.exit
|1E95DC| RTS

;===================================================================================================

pool Kholdstare_Decelerate

.limit_x
|1E95DD| db  16,  16, -16, -16

.limit_y
|1E95E1| db -16,  16,  16, -16

endpool

;---------------------------------------------------------------------------------------------------

Kholdstare_Decelerate:
|1E95E5| JSR CheckDamageToAndFromLink_bank1E

|1E95E8| LDA.w $0DF0,X
|1E95EB| BNE .delay

|1E95ED| STZ.w $0D80,X

|1E95F0| JSL GetRandomNumber
|1E95F4| AND.b #$3F

|1E95F6| ADC.b #$60
|1E95F8| STA.w $0DF0,X

|1E95FB| JSL GetRandomNumber
|1E95FF| PHA

|1E9600| AND.b #$03
|1E9602| TAY

|1E9603| LDA.w .limit_x,Y
|1E9606| STA.w $0F80,X

|1E9609| LDA.w .limit_y,Y
|1E960C| STA.w $0F90,X

|1E960F| PLA
|1E9610| AND.b #$1C
|1E9612| BNE .use_random_direction

|1E9614| LDA.b #$18
|1E9616| JSL ProjectSpriteSpeedTowardsLink_long

|1E961A| LDA.b $00
|1E961C| STA.w $0F90,X

|1E961F| LDA.b $01
|1E9621| STA.w $0F80,X

.use_random_direction
|1E9624| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1E9625| LDA.w $0D50,X
|1E9628| BEQ .x_done
|1E962A| BPL .x_too_high

|1E962C| INC.w $0D50,X
|1E962F| BRA .x_done

.x_too_high
|1E9631| DEC.w $0D50,X

.x_done
|1E9634| LDA.w $0D40,X
|1E9637| BEQ .y_done
|1E9639| BPL .y_too_high

|1E963B| INC.w $0D40,X
|1E963E| BRA .y_done

.y_too_high
|1E9640| DEC.w $0D40,X

.y_done
|1E9643| JMP.w Kholdstare_CheckTileCollision

;===================================================================================================

pool Kholdstare_Split

.target_speed_x
|1E9646| db  32, -32,   0

.target_speed_y
|1E9649| db -32, -32,  48

endpool

;---------------------------------------------------------------------------------------------------

Kholdstare_Split:
|1E964C| LDA.w $0DF0,X
|1E964F| CMP.b #$01
|1E9651| BNE .exit

|1E9653| STZ.w $0DD0,X
|1E9656| STZ.w $0DD1,X
|1E9659| STZ.w $0DD2,X

|1E965C| LDA.b #$02
|1E965E| STA.w $0FB5

.next_scoop
|1E9661| LDA.b #$A2 ; SPRITE A2
|1E9663| LDY.b #$04
|1E9665| JSL SpawnSpriteDynamically.slot_limited
|1E9669| BMI .exit

|1E966B| JSL SetSpawnedSpriteCoordinates

|1E966F| PHX

|1E9670| LDX.w $0FB5

|1E9673| LDA.w .target_speed_x,X
|1E9676| STA.w $0F80,Y

|1E9679| LDA.w .target_speed_y,X
|1E967C| STA.w $0F90,Y

|1E967F| LDA.b #$20
|1E9681| STA.w $0DF0,Y

|1E9684| PLX

|1E9685| DEC.w $0FB5
|1E9688| BPL .next_scoop

|1E968A| RTS

.exit
|1E968B| LDA.w $0EF0,X
|1E968E| ORA.b #$E0
|1E9690| STA.w $0EF0,X

|1E9693| RTS

;===================================================================================================

Kholdstare_DoAbsolutelyNothing:
|1E9694| RTS

;===================================================================================================

pool SpawnPuffCloudGarnish

.offset_low
|1E9695| db  -8, -6, -4, -2,  0,  2,  4,  6

.offset_high
|1E969D| db  -1, -1, -1, -1,  0,  0,  0,  0

endpool

;---------------------------------------------------------------------------------------------------

SpawnPuffCloudGarnish:
|1E96A5| TXA
|1E96A6| EOR.b $1A
|1E96A8| AND.b #$03
|1E96AA| BNE .exit

|1E96AC| PHX

|1E96AD| LDX.b #$0E

.next
|1E96AF| LDA.l $7FF800,X
|1E96B3| BEQ .open_slot

|1E96B5| DEX
|1E96B6| BPL .next

|1E96B8| PLX

|1E96B9| RTS

;---------------------------------------------------------------------------------------------------

.open_slot
|1E96BA| LDA.b #$07 ; GARNISH 07
|1E96BC| STA.l $7FF800,X
|1E96C0| STA.w $0FB4

|1E96C3| LDA.b #$1F
|1E96C5| STA.l $7FF90E,X

|1E96C9| JSL GetRandomNumber
|1E96CD| AND.b #$07
|1E96CF| TAY

|1E96D0| LDA.w $0FD8
|1E96D3| CLC
|1E96D4| ADC.w .offset_low,Y
|1E96D7| STA.l $7FF83C,X

|1E96DB| LDA.w $0FD9
|1E96DE| ADC.w .offset_high,Y
|1E96E1| STA.l $7FF878,X

|1E96E5| JSL GetRandomNumber
|1E96E9| AND.b #$07
|1E96EB| TAY

|1E96EC| LDA.w $0FDA
|1E96EF| CLC
|1E96F0| ADC.w .offset_low,Y

|1E96F3| PHP

|1E96F4| CLC
|1E96F5| ADC.b #$10
|1E96F7| STA.l $7FF81E,X

|1E96FB| LDA.w $0FDB
|1E96FE| ADC.b #$00

|1E9700| PLP
|1E9701| ADC.w .offset_high,Y
|1E9704| STA.l $7FF85A,X

|1E9708| LDA.b #$00
|1E970A| STA.l $7FF968,X

|1E970E| PLX

.exit
|1E970F| RTS

;===================================================================================================

Sprite_A4_FallingIce:
|1E9710| LDA.w $0DB0,X
|1E9713| BNE IceBall

;===================================================================================================

IceBallGenerator:
|1E9715| JSR CheckIfActive_bank1E

|1E9718| LDA.w $0DD2
|1E971B| CMP.b #$09
|1E971D| BCS .active_kholdstare

|1E971F| LDA.w $0DD3
|1E9722| CMP.b #$09
|1E9724| BCS .active_kholdstare

|1E9726| LDA.w $0DD4
|1E9729| CMP.b #$09
|1E972B| BCS .active_kholdstare

|1E972D| STZ.w $0DD0,X

.active_kholdstare
|1E9730| JMP.w GenerateIceball

;===================================================================================================

IceBall:
|1E9733| LDA.b #$01
|1E9735| STA.w $0BA0,X

|1E9738| LDA.b #$30
|1E973A| STA.w $0B89,X

|1E973D| JSL SpriteDraw_SingleLarge_long

|1E9741| LDA.w $0D80,X
|1E9744| BNE .ice_ball_piece

|1E9746| LDA.w $0E60,X
|1E9749| EOR.b #$10
|1E974B| STA.w $0E60,X

.ice_ball_piece
|1E974E| JSR CheckIfActive_bank1E

|1E9751| LDA.w $0DF0,X
|1E9754| BEQ .falling_as_ball

|1E9756| CMP.b #$01
|1E9758| BNE .stick_around

|1E975A| STZ.w $0DD0,X

.stick_around
|1E975D| LSR A
|1E975E| LSR A
|1E975F| LSR A

|1E9760| INC A
|1E9761| INC A

|1E9762| STA.w $0DC0,X

|1E9765| RTS

;---------------------------------------------------------------------------------------------------

.falling_as_ball
|1E9766| JSR MoveSpriteXY_bank1E

|1E9769| LDA.w $0D80,X
|1E976C| BEQ .is_also_iceball

|1E976E| JSR CheckDamageToLink_bank1E
|1E9771| JSR CheckSpriteTileCollision_bank1E
|1E9774| BNE .tile_collision

.is_also_iceball
|1E9776| LDA.w $0F70,X
|1E9779| PHA

|1E977A| JSR MoveSpriteZ_bank1E

|1E977D| LDA.w $0F80,X
|1E9780| CMP.b #$C0
|1E9782| BMI .at_max_speed

|1E9784| SEC
|1E9785| SBC.b #$03
|1E9787| STA.w $0F80,X

.at_max_speed
|1E978A| PLA
|1E978B| EOR.w $0F70,X
|1E978E| BPL .exit

|1E9790| LDA.w $0F70,X
|1E9793| BPL .exit

|1E9795| STZ.w $0F70,X

|1E9798| LDA.w $0D80,X
|1E979B| BNE .tile_collision

|1E979D| STZ.w $0DD0,X

|1E97A0| JSR IceBall_Split

|1E97A3| RTS

;---------------------------------------------------------------------------------------------------

.tile_collision
|1E97A4| LDA.b #$0F
|1E97A6| STA.w $0DF0,X

|1E97A9| LDA.b #$04
|1E97AB| STA.w $0F50,X

|1E97AE| LDA.w $012E
|1E97B1| BNE .exit

|1E97B3| LDA.b #$1E ; SFX2.1E
|1E97B5| JSL QueueSpriteSFX2WithPan

|1E97B9| LDA.b #$03
|1E97BB| STA.w $0DC0,X

.exit
|1E97BE| RTS

;===================================================================================================

pool IceBall_Split

.speed_x
|1E97BF| db   0,  32,   0, -32
|1E97C3| db  24,  24, -24, -24

.speed_y
|1E97C7| db -32,   0,  32,   0
|1E97CB| db -24,  24, -24,  24

endpool

;---------------------------------------------------------------------------------------------------

IceBall_Split:
|1E97CF| LDA.b #$1F ; SFX2.1F
|1E97D1| JSL QueueSpriteSFX2WithPan

|1E97D5| JSL GetRandomNumber
|1E97D9| AND.b #$04
|1E97DB| STA.b $0D

|1E97DD| LDA.b #$03
|1E97DF| STA.w $0FB5

.next_shard
|1E97E2| LDA.b #$A4 ; SPRITE A4
|1E97E4| JSL SpawnSpriteDynamically
|1E97E8| BMI .no_space

|1E97EA| JSL SetSpawnedSpriteCoordinates

|1E97EE| LDA.b #$01
|1E97F0| STA.w $0D80,Y
|1E97F3| STA.w $0DC0,Y
|1E97F6| STA.w $0DB0,Y

|1E97F9| LDA.b #$20
|1E97FB| STA.w $0F80,Y

|1E97FE| PHX

|1E97FF| LDA.w $0FB5
|1E9802| ORA.b $0D
|1E9804| TAX

|1E9805| LDA.w .speed_x,X
|1E9808| STA.w $0D50,Y

|1E980B| LDA.w .speed_y,X
|1E980E| STA.w $0D40,Y

|1E9811| PLX

|1E9812| LDA.b #$1C
|1E9814| STA.w $0F60,Y

.no_space
|1E9817| DEC.w $0FB5
|1E981A| BPL .next_shard

|1E981C| RTS

;===================================================================================================

Sprite_A1_Freezor:
|1E981D| JSL SpriteDraw_Freezor

|1E9821| LDA.w $0DD0,X
|1E9824| CMP.b #$09
|1E9826| BEQ .active_state

|1E9828| LDA.b #$03
|1E982A| STA.w $0D80,X

|1E982D| LDA.b #$1F
|1E982F| STA.w $0DF0,X
|1E9832| STA.w $0BA0,X

|1E9835| LDA.b #$09
|1E9837| STA.w $0DD0,X
|1E983A| STZ.w $0EF0,X

.active_state
|1E983D| JSR CheckIfActive_bank1E

|1E9840| LDA.w $0D80,X
|1E9843| CMP.b #$03
|1E9845| BEQ .ignore_recoil

|1E9847| JSR HandleSpriteRecoil_bank1E

.ignore_recoil
|1E984A| LDA.w $0D80,X
|1E984D| JSL JumpTableLocal
|1E9851| dw Freezor_Dormant
|1E9853| dw Freezor_Waking
|1E9855| dw Freezor_Flailing
|1E9857| dw ImMelllltiiiinnnnggggg

;===================================================================================================

Freezor_Dormant:
|1E9859| INC.w $0BA0,X

|1E985C| JSR GetXDisplacementFromLink_bank1E

|1E985F| LDA.b $0F
|1E9861| CLC
|1E9862| ADC.b #$10
|1E9864| CMP.b #$20
|1E9866| BCS .stay_asleep

|1E9868| INC.w $0D80,X

|1E986B| LDA.b #$20
|1E986D| STA.w $0DF0,X

.stay_asleep
|1E9870| RTS

;===================================================================================================

Freezor_Waking:
|1E9871| LDA.w $0DF0,X
|1E9874| STA.w $0BA0,X
|1E9877| BNE .still_shaking

|1E9879| INC.w $0D80,X

|1E987C| LDA.w $0D10,X
|1E987F| SEC
|1E9880| SBC.b #$05
|1E9882| STA.b $00

|1E9884| LDA.w $0D30,X
|1E9887| SBC.b #$00
|1E9889| STA.b $01

|1E988B| LDA.w $0D00,X
|1E988E| STA.b $02

|1E9890| LDA.w $0D20,X
|1E9893| STA.b $03

|1E9895| LDY.b #$08
|1E9897| JSL UpdateTilemapWithCommonObject

|1E989B| LDA.b #$60
|1E989D| STA.w $0E00,X

|1E98A0| LDA.b #$02
|1E98A2| STA.w $0DE0,X

|1E98A5| LDA.b #$50
|1E98A7| STA.w $0DF0,X

|1E98AA| RTS

.still_shaking
|1E98AB| AND.b #$01
|1E98AD| TAY

|1E98AE| LDA.w Sixteen_X,Y
|1E98B1| STA.w $0D50,X

|1E98B4| JSR MoveSpriteX_bank1E

|1E98B7| RTS

;===================================================================================================

pool Freezor_Flailing

.speed_x
|1E98B8| db   8,  -8 ; bleeds into next

.speed_y
|1E98BA| db   0,   0,  18, -18

.anim_step
|1E98BE| db   1,   2,   1,   3

.sparkle_offset_low
|1E98C2| db  -4,  -2,   0,   2,   4,   6,   8,  10

.sparkle_offset_high
|1E98CA| db  -1,  -1,   0,   0,   0,   0,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Freezor_Flailing:
|1E98D2| JSR CheckDamageToLink_bank1E

|1E98D5| JSL CheckDamageFromLink_long
|1E98D9| BCC .no_damage

|1E98DB| STZ.w $0EF0,X

.no_damage
|1E98DE| LDA.w $0E00,X
|1E98E1| BEQ .dont_sparkle

|1E98E3| TXA
|1E98E4| EOR.b $1A
|1E98E6| AND.b #$07
|1E98E8| BNE .dont_sparkle

|1E98EA| JSL GetRandomNumber
|1E98EE| AND.b #$07
|1E98F0| TAY

|1E98F1| LDA.w .sparkle_offset_low,Y
|1E98F4| STA.b $00

|1E98F6| LDA.w .sparkle_offset_high,Y
|1E98F9| STA.b $01

|1E98FB| LDA.b #$FC
|1E98FD| STA.b $02

|1E98FF| LDA.b #$FF
|1E9901| STA.b $03

|1E9903| JSL GarnishSpawn_Sparkle

.dont_sparkle
|1E9907| LDA.w $0DF0,X
|1E990A| BNE .dont_turn

|1E990C| JSR GetDirectionTowardsLink_bank1E
|1E990F| TYA
|1E9910| STA.w $0DE0,X

.dont_turn
|1E9913| LDY.w $0DE0,X

|1E9916| LDA.w .speed_x,Y
|1E9919| STA.w $0D50,X

|1E991C| LDA.w .speed_y,Y
|1E991F| STA.w $0D40,X

|1E9922| LDA.w $0E70,X
|1E9925| AND.b #$0F
|1E9927| BNE .tile_collision

|1E9929| JSR MoveSpriteXY_bank1E

.tile_collision
|1E992C| JSR CheckSpriteTileCollision_bank1E

|1E992F| TXA
|1E9930| EOR.b $1A

|1E9932| LSR A
|1E9933| LSR A

|1E9934| AND.b #$03
|1E9936| TAY

|1E9937| LDA.w .anim_step,Y
|1E993A| STA.w $0DC0,X

|1E993D| RTS

;===================================================================================================

pool ImMelllltiiiinnnnggggg

.draw_step
|1E993E| db $06, $05, $04, $07

endpool

;---------------------------------------------------------------------------------------------------

ImMelllltiiiinnnnggggg:
|1E9942| LDA.w $0DF0,X
|1E9945| BNE .delay

|1E9947| PHA

|1E9948| JSL ManuallySetDeathFlagUW

|1E994C| STZ.w $0DD0,X

|1E994F| PLA

.delay
|1E9950| LSR A
|1E9951| LSR A
|1E9952| LSR A
|1E9953| TAY

|1E9954| LDA.w .draw_step,Y
|1E9957| STA.w $0DC0,X

|1E995A| RTS

;===================================================================================================

Sprite_9E_HauntedGroveOstrich:
|1E995B| JSR SpriteDraw_HauntedGroveOstrich
|1E995E| JSR CheckIfActive_bank1E

|1E9961| LDA.w $0D80,X
|1E9964| JSL JumpTableLocal
|1E9968| dw HauntedGroveOstrich_Idle
|1E996A| dw HauntedGroveOstrich_Flee

;===================================================================================================

HauntedGroveOstrich_Idle:
|1E996C| LDY.b #$00

|1E996E| LDA.b $1A
|1E9970| AND.b #$18
|1E9972| BEQ .default_anim

|1E9974| LDY.b #$03

.default_anim
|1E9976| TYA
|1E9977| STA.w $0DC0,X

|1E997A| LDA.w $0FDD
|1E997D| BEQ .dont_run

|1E997F| INC.w $0D80,X

|1E9982| LDA.b #$F8
|1E9984| STA.w $0D40,X

|1E9987| LDA.b #$F0
|1E9989| STA.w $0D50,X

.dont_run
|1E998C| RTS

;===================================================================================================

pool HauntedGroveOstrich_Flee

.anim_step
|1E998D| db $00, $01, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

HauntedGroveOstrich_Flee:
|1E9991| JSR MoveSpriteXYZ_bank1E

|1E9994| DEC.w $0F80,X
|1E9997| DEC.w $0F80,X

|1E999A| LDA.w $0F70,X
|1E999D| BPL .no_hop

|1E999F| LDA.b #$20
|1E99A1| STA.w $0F80,X

|1E99A4| STZ.w $0F70,X
|1E99A7| STZ.w $0E80,X
|1E99AA| STZ.w $0D90,X

.no_hop
|1E99AD| INC.w $0E80,X

|1E99B0| LDA.w $0E80,X
|1E99B3| AND.b #$07
|1E99B5| BNE .skip_anim_stepping

|1E99B7| LDA.w $0D90,X
|1E99BA| CMP.b #$03
|1E99BC| BEQ .skip_anim_stepping

|1E99BE| INC.w $0D90,X

.skip_anim_stepping
|1E99C1| LDY.w $0D90,X

|1E99C4| LDA.w .anim_step,Y
|1E99C7| STA.w $0DC0,X

|1E99CA| RTS

;===================================================================================================

pool SpriteDraw_HauntedGroveOstrich

.oam_groups
|1E99CB| dw  -4,  -8 : db $80, $00, $00, $02
|1E99D3| dw   4,  -8 : db $81, $00, $00, $02
|1E99DB| dw  -4,   8 : db $A3, $00, $00, $02
|1E99E3| dw   4,   8 : db $A4, $00, $00, $02

|1E99EB| dw  -4,  -8 : db $80, $00, $00, $02
|1E99F3| dw   4,  -8 : db $81, $00, $00, $02
|1E99FB| dw  -4,   8 : db $A0, $00, $00, $02
|1E9A03| dw   4,   8 : db $A1, $00, $00, $02

|1E9A0B| dw  -4,  -8 : db $80, $00, $00, $02
|1E9A13| dw   4,  -8 : db $81, $00, $00, $02
|1E9A1B| dw  -4,   8 : db $83, $00, $00, $02
|1E9A23| dw   4,   8 : db $84, $00, $00, $02

|1E9A2B| dw  -4,  -7 : db $80, $00, $00, $02
|1E9A33| dw   4,  -7 : db $81, $00, $00, $02
|1E9A3B| dw  -4,   9 : db $A3, $00, $00, $02
|1E9A43| dw   4,   9 : db $A4, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_HauntedGroveOstrich:
|1E9A4B| LDA.b #$00
|1E9A4D| XBA
|1E9A4E| LDA.w $0DC0,X

|1E9A51| REP #$20

|1E9A53| ASL A
|1E9A54| ASL A
|1E9A55| ASL A
|1E9A56| ASL A
|1E9A57| ASL A

|1E9A58| ADC.w #.oam_groups
|1E9A5B| STA.b $08

|1E9A5D| SEP #$20

|1E9A5F| LDA.b #$04
|1E9A61| JSR TabulatedSpriteDraw_bank1E

|1E9A64| LDA.b #$12
|1E9A66| JSL DrawSpriteShadow_custom_long

|1E9A6A| RTS

;===================================================================================================

HauntedGroveFlip:
|1E9A6B| db $40, $00

;===================================================================================================

Sprite_9F_HauntedGroveRabbit:
|1E9A6D| LDY.w $0DE0,X

|1E9A70| LDA.w $0F50,X
|1E9A73| AND.b #$BF
|1E9A75| ORA.w HauntedGroveFlip,Y
|1E9A78| STA.w $0F50,X

|1E9A7B| JSL SpriteDraw_SingleLarge_long

|1E9A7F| LDA.w $0D80,X
|1E9A82| JSL JumpTableLocal
|1E9A86| dw HauntedGroveRabbit_Idle
|1E9A88| dw HauntedGroveRabbit_Flee

;===================================================================================================

HauntedGroveRabbit_Idle:
|1E9A8A| LDA.b #$03
|1E9A8C| STA.w $0DC0,X

|1E9A8F| LDA.w $0FDD
|1E9A92| BEQ .exit

|1E9A94| INC.w $0D80,X

|1E9A97| LDA.w $0DE0,X
|1E9A9A| EOR.b #$01
|1E9A9C| STA.w $0DE0,X

|1E9A9F| TAY

|1E9AA0| LDA.w Sixteen_X,Y
|1E9AA3| STA.w $0D50,X

|1E9AA6| LDA.b #$F8
|1E9AA8| STA.w $0D40,X

.exit
|1E9AAB| RTS

;===================================================================================================

pool HauntedGroveRabbit_Flee

.anim_step
|1E9AAC| db $00, $01, $02

endpool

;---------------------------------------------------------------------------------------------------

HauntedGroveRabbit_Flee:
|1E9AAF| JSR MoveSpriteXYZ_bank1E

|1E9AB2| DEC.w $0F80,X
|1E9AB5| DEC.w $0F80,X
|1E9AB8| DEC.w $0F80,X

|1E9ABB| LDA.w $0F70,X
|1E9ABE| BPL .hopping

|1E9AC0| LDA.b #$18
|1E9AC2| STA.w $0F80,X

|1E9AC5| STZ.w $0F70,X
|1E9AC8| STZ.w $0E80,X
|1E9ACB| STZ.w $0D90,X

.hopping
|1E9ACE| INC.w $0E80,X

|1E9AD1| LDA.w $0E80,X
|1E9AD4| AND.b #$03
|1E9AD6| BNE .dont_step_anim

|1E9AD8| LDA.w $0D90,X
|1E9ADB| CMP.b #$02
|1E9ADD| BEQ .dont_step_anim

|1E9ADF| INC.w $0D90,X

.dont_step_anim
|1E9AE2| LDY.w $0D90,X

|1E9AE5| LDA.w .anim_step,Y
|1E9AE8| STA.w $0DC0,X

|1E9AEB| RTS

;===================================================================================================

Sprite_A0_HauntedGroveBird:
|1E9AEC| LDA.w $0DC0,X
|1E9AEF| CMP.b #$03
|1E9AF1| BNE .eyes_emoji

|1E9AF3| JSR HauntedGroveBird_Blink

.eyes_emoji
|1E9AF6| LDY.w $0DE0,X

|1E9AF9| LDA.w $0F50,X
|1E9AFC| AND.b #$BF
|1E9AFE| ORA.w HauntedGroveFlip,Y
|1E9B01| STA.w $0F50,X

|1E9B04| REP #$20

|1E9B06| LDA.b $90
|1E9B08| CLC
|1E9B09| ADC.w #$0004
|1E9B0C| STA.b $90

|1E9B0E| INC.b $92

|1E9B10| SEP #$20

|1E9B12| DEC.w $0E40,X

|1E9B15| JSL SpriteDraw_SingleLarge_long

|1E9B19| INC.w $0E40,X

|1E9B1C| JSR MoveSpriteXYZ_bank1E

|1E9B1F| LDA.w $0D80,X
|1E9B22| JSL JumpTableLocal
|1E9B26| dw HauntedGroveBird_Idle
|1E9B28| dw HauntedGroveBird_Ascending
|1E9B2A| dw HauntedGroveBird_Descending

;===================================================================================================

HauntedGroveBird_Idle:
|1E9B2C| LDY.b #$00

|1E9B2E| LDA.b $1A
|1E9B30| AND.b #$18
|1E9B32| BNE .keep_anim_step

|1E9B34| LDY.b #$03

.keep_anim_step
|1E9B36| TYA
|1E9B37| STA.w $0DC0,X

|1E9B3A| LDA.w $0FDD
|1E9B3D| BEQ .exit

|1E9B3F| INC.w $0D80,X

|1E9B42| LDA.w $0DE0,X
|1E9B45| EOR.b #$01
|1E9B47| STA.w $0DE0,X

|1E9B4A| TAY

|1E9B4B| LDA.w Sixteen_X,Y
|1E9B4E| STA.w $0D50,X

|1E9B51| LDA.b #$20
|1E9B53| STA.w $0DF0,X

|1E9B56| LDA.b #$10
|1E9B58| STA.w $0F80,X

|1E9B5B| LDA.b #$F8
|1E9B5D| STA.w $0D40,X

.exit
|1E9B60| RTS

;===================================================================================================

HauntedGroveBird_Ascending:
|1E9B61| LDA.w $0DF0,X
|1E9B64| BNE .dont_accel

|1E9B66| LDA.w $0F80,X
|1E9B69| CLC
|1E9B6A| ADC.b #$02
|1E9B6C| STA.w $0F80,X

|1E9B6F| CMP.b #$10
|1E9B71| BMI .dont_accel

|1E9B73| INC.w $0D80,X

.dont_accel
|1E9B76| INC.w $0E80,X

|1E9B79| LDA.w $0E80,X
|1E9B7C| LSR A
|1E9B7D| AND.b #$01

|1E9B7F| INC A
|1E9B80| STA.w $0DC0,X

|1E9B83| RTS

;===================================================================================================

HauntedGroveBird_Descending:
|1E9B84| LDA.b #$01
|1E9B86| STA.w $0DC0,X

|1E9B89| LDA.w $0F80,X
|1E9B8C| SEC
|1E9B8D| SBC.b #$01
|1E9B8F| STA.w $0F80,X

|1E9B92| CMP.b #$F1
|1E9B94| BPL .dont_decel

|1E9B96| DEC.w $0D80,X

.dont_decel
|1E9B99| RTS

;===================================================================================================

pool HauntedGroveBird_Blink

.offset_x
|1E9B9A| db  8,  0

endpool

;---------------------------------------------------------------------------------------------------

HauntedGroveBird_Blink:
|1E9B9C| JSR GetScreenCoordinates_bank1E

|1E9B9F| PHX

|1E9BA0| LDA.w $0DE0,X
|1E9BA3| TAX

|1E9BA4| LDA.b $00
|1E9BA6| CLC
|1E9BA7| ADC.w .offset_x,X
|1E9BAA| STA.b ($90),Y

|1E9BAC| LDA.b $02
|1E9BAE| INY
|1E9BAF| STA.b ($90),Y

|1E9BB1| LDA.b #$AE
|1E9BB3| INY
|1E9BB4| STA.b ($90),Y

|1E9BB6| LDA.b $05
|1E9BB8| ORA.w HauntedGroveFlip,X
|1E9BBB| INY
|1E9BBC| STA.b ($90),Y

|1E9BBE| PLX

|1E9BBF| LDY.b #$00
|1E9BC1| LDA.b #$00
|1E9BC3| JSL CorrectOAMEntries_long

|1E9BC7| RTS

;===================================================================================================

Sprite_9C_Zoro:
Sprite_9D_Babasu:
|1E9BC8| LDA.w $0E90,X
|1E9BCB| BNE Zoro

|1E9BCD| JMP.w Babasu

;===================================================================================================

Zoro:
|1E9BD0| LDA.w $0DB0,X
|1E9BD3| BNE .continue

|1E9BD5| INC.w $0DB0,X

|1E9BD8| JSR GetYDisplacementFromLink_bank1E

|1E9BDB| CPY.b #$00
|1E9BDD| BEQ .continue

|1E9BDF| STZ.w $0DD0,X

|1E9BE2| RTS

.continue
|1E9BE3| JSL SpriteDraw_SingleSmall_long
|1E9BE7| JSR CheckIfActive_bank1E
|1E9BEA| JSR CheckDamageToAndFromLink_bank1E

|1E9BED| INC.w $0E80,X

|1E9BF0| LDA.w $0E80,X
|1E9BF3| LSR A
|1E9BF4| AND.b #$01
|1E9BF6| STA.w $0DC0,X

|1E9BF9| LDA.w $0E80,X
|1E9BFC| LSR A
|1E9BFD| LSR A

|1E9BFE| AND.b #$01
|1E9C00| TAY

|1E9C01| LDA.w Sixteen_X,Y
|1E9C04| STA.w $0D50,X

|1E9C07| JSR MoveSpriteXY_bank1E

|1E9C0A| LDA.w $0DF0,X
|1E9C0D| BNE .dont_die

|1E9C0F| JSR CheckSpriteTileCollision_bank1E
|1E9C12| BEQ .dont_die

|1E9C14| STZ.w $0DD0,X

.dont_die
|1E9C17| LDA.w $0E80,X
|1E9C1A| AND.b #$03
|1E9C1C| BNE .exit

|1E9C1E| PHX
|1E9C1F| TXY

|1E9C20| LDX.b #$1D

.next_slot
|1E9C22| LDA.l $7FF800,X
|1E9C26| BEQ .spawn_garnish

|1E9C28| DEX
|1E9C29| BPL .next_slot

|1E9C2B| PLX

.exit
|1E9C2C| RTS

;---------------------------------------------------------------------------------------------------

.spawn_garnish
|1E9C2D| LDA.b #$06 ; GARNISH 06
|1E9C2F| STA.l $7FF800,X
|1E9C33| STA.w $0FB4

|1E9C36| LDA.w $0D10,Y
|1E9C39| STA.l $7FF83C,X

|1E9C3D| LDA.w $0D30,Y
|1E9C40| STA.l $7FF878,X

|1E9C44| LDA.w $0D00,Y
|1E9C47| CLC
|1E9C48| ADC.b #$10
|1E9C4A| STA.l $7FF81E,X

|1E9C4E| LDA.w $0D20,Y
|1E9C51| ADC.b #$00
|1E9C53| STA.l $7FF85A,X

|1E9C57| LDA.b #$0A
|1E9C59| STA.l $7FF90E,X

|1E9C5D| TYA
|1E9C5E| STA.l $7FF92C,X

|1E9C62| LDA.w $0F20,Y
|1E9C65| STA.l $7FF968,X

|1E9C69| PLX

|1E9C6A| RTS

;===================================================================================================

Babasu:
|1E9C6B| JSL SpriteDraw_Babasu
|1E9C6F| JSR CheckIfActive_bank1E

|1E9C72| LDA.w $0D80,X
|1E9C75| JSL JumpTableLocal
|1E9C79| dw Babasu_Reset
|1E9C7B| dw Babasu_Hidden
|1E9C7D| dw Babasu_Telegraph
|1E9C7F| dw Babasu_Dart

;===================================================================================================

Babasu_Reset:
|1E9C81| INC.w $0D80,X

|1E9C84| LDA.b #$80
|1E9C86| STA.w $0DF0,X

|1E9C89| LDA.b #$FF
|1E9C8B| STA.w $0DC0,X

|1E9C8E| RTS

;===================================================================================================

Babasu_Hidden:
|1E9C8F| LDA.w $0DF0,X
|1E9C92| BNE .exit

|1E9C94| INC.w $0D80,X

|1E9C97| LDA.b #$37
|1E9C99| STA.w $0DF0,X

.exit
|1E9C9C| RTS

;===================================================================================================

pool Babasu_Telegraph

.anim
|1E9C9D| db $05, $04, $03, $02, $01, $00

.anim_offset
|1E9CA3| db $06, $06, $00, $00

.speed_x ; bleeds into next
|1E9CA7| db  32, -32

.speed_y
|1E9CA9| db   0,   0,  32, -32

endpool

;---------------------------------------------------------------------------------------------------

Babasu_Telegraph:
|1E9CAD| LDA.w $0DF0,X
|1E9CB0| BNE .delay

|1E9CB2| PHA

|1E9CB3| INC.w $0D80,X

|1E9CB6| LDY.w $0DE0,X

|1E9CB9| LDA.w .speed_x,Y
|1E9CBC| STA.w $0D50,X

|1E9CBF| LDA.w .speed_y,Y
|1E9CC2| STA.w $0D40,X

|1E9CC5| LDA.b #$20
|1E9CC7| STA.w $0DF0,X

|1E9CCA| PLA

;---------------------------------------------------------------------------------------------------

.delay
|1E9CCB| CMP.b #$20
|1E9CCD| BCC .hide

|1E9CCF| SBC.b #$20
|1E9CD1| LSR A
|1E9CD2| LSR A
|1E9CD3| TAY

|1E9CD4| LDA.w .anim,Y
|1E9CD7| LDY.w $0DE0,X

|1E9CDA| CLC
|1E9CDB| ADC.w .anim_offset,Y
|1E9CDE| STA.w $0DC0,X

|1E9CE1| RTS

.hide
|1E9CE2| LDA.b #$FF
|1E9CE4| STA.w $0DC0,X

|1E9CE7| RTS

;===================================================================================================

pool Babasu_Dart

.anim_step
|1E9CE8| db $12, $0E, $0C, $10

endpool

;---------------------------------------------------------------------------------------------------

Babasu_Dart:
|1E9CEC| JSR CheckDamageToAndFromLink_bank1E
|1E9CEF| JSR MoveSpriteXY_bank1E

|1E9CF2| LDA.b $1A
|1E9CF4| LSR A
|1E9CF5| AND.b #$01

|1E9CF7| LDY.w $0DE0,X

|1E9CFA| CLC
|1E9CFB| ADC.w .anim_step,Y
|1E9CFE| STA.w $0DC0,X

|1E9D01| LDA.w $0DF0,X
|1E9D04| BNE .exit

|1E9D06| JSR CheckSpriteTileCollision_bank1E
|1E9D09| BEQ .exit

|1E9D0B| LDA.w $0DE0,X
|1E9D0E| EOR.b #$01
|1E9D10| STA.w $0DE0,X

|1E9D13| STZ.w $0D80,X

.exit
|1E9D16| RTS

;===================================================================================================

UNREACHABLE_1E9D17:
|1E9D17| db $03, $43, $C3, $83

;===================================================================================================

Sprite_9B_Wizzrobe:
|1E9D1B| LDA.w $0DB0,X
|1E9D1E| BEQ Wizzrobe

;===================================================================================================

WizzrobeBeam:
|1E9D20| JSL SpriteDraw_WizzrobeBeam
|1E9D24| JSR CheckIfActive_bank1E

|1E9D27| LDA.w $0F50,X
|1E9D2A| EOR.b #$06
|1E9D2C| STA.w $0F50,X

|1E9D2F| INC.w $0E80,X

|1E9D32| LDA.w $0D80,X
|1E9D35| BNE .harmless

|1E9D37| JSR CheckDamageToLink_bank1E

.harmless
|1E9D3A| JSR MoveSpriteXY_bank1E
|1E9D3D| JSR CheckSpriteTileCollision_bank1E
|1E9D40| BEQ .exit

|1E9D42| STZ.w $0DD0,X

.exit
|1E9D45| RTS

;===================================================================================================

Wizzrobe:
|1E9D46| LDA.w $0D80,X
|1E9D49| BEQ .no_draw

|1E9D4B| AND.b #$01
|1E9D4D| BEQ .do_draw

|1E9D4F| LDA.w $0DF0,X
|1E9D52| AND.b #$01
|1E9D54| BEQ .do_draw

.no_draw
|1E9D56| JSL GetScreenCoordinates_long
|1E9D5A| BRA .continue

.do_draw
|1E9D5C| JSL SpriteDraw_Wizzrobe

.continue
|1E9D60| JSR CheckIfActive_bank1E
|1E9D63| JSR HandleSpriteRecoil_bank1E

|1E9D66| LDA.b #$01
|1E9D68| STA.w $0BA0,X

|1E9D6B| LDA.w $0D80,X
|1E9D6E| JSL JumpTableLocal
|1E9D72| dw Wizzrobe_Invisible
|1E9D74| dw Wizzrobe_Appear
|1E9D76| dw Wizzrobe_Attack
|1E9D78| dw Wizzrobe_Disappear

;===================================================================================================

pool Wizzrobe_Invisible

.anim_step
|1E9D7A| db $04, $02, $00, $06

endpool

;---------------------------------------------------------------------------------------------------

Wizzrobe_Invisible:
|1E9D7E| LDA.w $0DF0,X
|1E9D81| BNE .exit

|1E9D83| LDA.b #$01
|1E9D85| STA.w $0D50,X
|1E9D88| STA.w $0D40,X

|1E9D8B| JSR CheckSpriteTileCollision_bank1E
|1E9D8E| BNE .die

|1E9D90| INC.w $0D80,X

|1E9D93| LDA.b #$3F
|1E9D95| STA.w $0DF0,X

|1E9D98| JSR GetDirectionTowardsLink_bank1E
|1E9D9B| TYA
|1E9D9C| STA.w $0DE0,X

|1E9D9F| LDA.w .anim_step,Y
|1E9DA2| STA.w $0DC0,X

|1E9DA5| RTS

.die
|1E9DA6| STZ.w $0DD0,X

.exit
|1E9DA9| RTS

;===================================================================================================

Wizzrobe_Appear:
|1E9DAA| LDA.w $0DF0,X
|1E9DAD| BNE .exit

|1E9DAF| INC.w $0D80,X

|1E9DB2| LDA.b #$3F
|1E9DB4| STA.w $0DF0,X

.exit
|1E9DB7| RTS

;===================================================================================================

pool Wizzrobe_Attack

.anim_step
|1E9DB8| db $00, $01
|1E9DBA| db $01, $01
|1E9DBC| db $01, $01
|1E9DBE| db $01, $00

.anim_direction_offset
|1E9DC0| db $04, $02, $00, $06

endpool

;---------------------------------------------------------------------------------------------------

Wizzrobe_Attack:
|1E9DC4| STZ.w $0BA0,X

|1E9DC7| JSR CheckDamageToAndFromLink_bank1E

|1E9DCA| LDA.w $0DF0,X
|1E9DCD| BNE .wait

|1E9DCF| INC.w $0D80,X

|1E9DD2| LDA.b #$3F
|1E9DD4| STA.w $0DF0,X

|1E9DD7| RTS

.wait
|1E9DD8| CMP.b #$20
|1E9DDA| BNE .delay_beam

|1E9DDC| PHA

|1E9DDD| JSR Wizzrobe_FireBeam

|1E9DE0| PLA

.delay_beam
|1E9DE1| LSR A
|1E9DE2| LSR A
|1E9DE3| LSR A
|1E9DE4| TAY

|1E9DE5| LDA.w .anim_step,Y

|1E9DE8| LDY.w $0DE0,X

|1E9DEB| CLC
|1E9DEC| ADC.w .anim_direction_offset,Y
|1E9DEF| STA.w $0DC0,X

|1E9DF2| RTS

;===================================================================================================

Wizzrobe_Disappear:
|1E9DF3| LDA.w $0DF0,X
|1E9DF6| BNE .exit

|1E9DF8| LDA.w $0DA0,X
|1E9DFB| BEQ .dont_die

|1E9DFD| STZ.w $0DD0,X

.dont_die
|1E9E00| STZ.w $0D80,X

|1E9E03| JSL GetRandomNumber
|1E9E07| AND.b #$1F
|1E9E09| ADC.b #$20
|1E9E0B| STA.w $0DF0,X

.exit
|1E9E0E| RTS

;===================================================================================================

pool Wizzrobe_FireBeam

.speed_x ; bleeds into next
|1E9E0F| db  32, -32

.speed_y
|1E9E11| db   0,   0,  32, -32

endpool

;---------------------------------------------------------------------------------------------------

Wizzrobe_FireBeam:
|1E9E15| LDA.b #$9B ; SPRITE 9B
|1E9E17| JSL SpawnSpriteDynamically
|1E9E1B| BMI .no_space

|1E9E1D| LDA.b #$36 ; SFX3.36
|1E9E1F| JSL QueueSpriteSFX3WithPan

|1E9E23| LDA.b #$01
|1E9E25| STA.w $0DB0,Y
|1E9E28| STA.w $0BA0,Y

|1E9E2B| LDA.b $00
|1E9E2D| CLC
|1E9E2E| ADC.b #$04
|1E9E30| STA.w $0D10,Y

|1E9E33| LDA.b $01
|1E9E35| ADC.b #$00
|1E9E37| STA.w $0D30,Y

|1E9E3A| LDA.b $02
|1E9E3C| CLC
|1E9E3D| ADC.b #$00
|1E9E3F| STA.w $0D00,Y

|1E9E42| LDA.b $03
|1E9E44| ADC.b #$00
|1E9E46| STA.w $0D20,Y

|1E9E49| PHX

|1E9E4A| LDA.w $0DE0,X
|1E9E4D| TAX

|1E9E4E| LDA.w .speed_x,X
|1E9E51| STA.w $0D50,Y

|1E9E54| LDA.w .speed_y,X
|1E9E57| STA.w $0D40,Y

|1E9E5A| LDA.b #$48
|1E9E5C| STA.w $0CAA,Y

|1E9E5F| LDA.b #$02
|1E9E61| STA.w $0F50,Y

|1E9E64| LDA.l $7EF35A
|1E9E68| TAX

|1E9E69| LDA.b #$00
|1E9E6B| CPX.b #$03
|1E9E6D| BNE .not_blockable

|1E9E6F| LDA.b #$20

.not_blockable
|1E9E71| STA.w $0BE0,Y

|1E9E74| PLX

|1E9E75| LDA.b #$14
|1E9E77| STA.w $0F60,Y

.no_space
|1E9E7A| RTS

;===================================================================================================

Sprite_9A_Kyameron:
|1E9E7B| LDA.w $0D80,X
|1E9E7E| BNE .visible

|1E9E80| JSL GetScreenCoordinates_long
|1E9E84| BRA .not_visible

.visible
|1E9E86| JSR SpriteDraw_Kyameron

.not_visible
|1E9E89| JSR CheckIfActive_bank1E
|1E9E8C| JSR HandleSpriteRecoil_bank1E

|1E9E8F| LDA.b #$01
|1E9E91| STA.w $0BA0,X

|1E9E94| LDA.w $0D80,X
|1E9E97| JSL JumpTableLocal
|1E9E9B| dw Kyameron_Reset
|1E9E9D| dw Kyameron_Puddle
|1E9E9F| dw Kyameron_BuildUp
|1E9EA1| dw Kyameron_Moving
|1E9EA3| dw Kyameron_Dissipate

;===================================================================================================

Kyameron_Reset:
|1E9EA5| LDA.w $0DF0,X
|1E9EA8| BNE .exit

|1E9EAA| INC.w $0D80,X

|1E9EAD| JSL GetRandomNumber
|1E9EB1| AND.b #$3F
|1E9EB3| ADC.b #$60
|1E9EB5| STA.w $0DF0,X

|1E9EB8| LDA.w $0D90,X
|1E9EBB| STA.w $0D10,X

|1E9EBE| LDA.w $0DA0,X
|1E9EC1| STA.w $0D30,X

|1E9EC4| LDA.w $0DB0,X
|1E9EC7| STA.w $0D00,X

|1E9ECA| LDA.w $0EB0,X
|1E9ECD| STA.w $0D20,X

|1E9ED0| LDA.b #$05
|1E9ED2| STA.w $0E80,X

|1E9ED5| LDA.b #$08
|1E9ED7| STA.w $0DC0,X

.exit
|1E9EDA| RTS

;===================================================================================================

Kyameron_Puddle:
|1E9EDB| LDA.w $0DF0,X
|1E9EDE| BNE .delay

|1E9EE0| LDA.b #$1F
|1E9EE2| STA.w $0DF0,X

|1E9EE5| INC.w $0D80,X

.delay
|1E9EE8| DEC.w $0E80,X
|1E9EEB| BPL .exit

|1E9EED| LDA.b #$05
|1E9EEF| STA.w $0E80,X

|1E9EF2| INC.w $0DC0,X

|1E9EF5| LDA.w $0DC0,X
|1E9EF8| AND.b #$03
|1E9EFA| CLC
|1E9EFB| ADC.b #$08
|1E9EFD| STA.w $0DC0,X

.exit
|1E9F00| RTS

;===================================================================================================

pool Kyameron_BuildUp

.anim_step
|1E9F01| db $04, $07, $0E, $0D, $0C, $06, $06, $05

.speed_x
|1E9F09| db  32, -32,  32, -32

.speed_y
|1E9F0D| db  32,  32, -32, -32

endpool

;---------------------------------------------------------------------------------------------------

Kyameron_BuildUp:
|1E9F11| LDA.w $0DF0,X
|1E9F14| BNE .delay

|1E9F16| INC.w $0D80,X

|1E9F19| JSR GetYDisplacementFromLink_bank1E
|1E9F1C| TYA
|1E9F1D| ASL A
|1E9F1E| STA.b $00

|1E9F20| JSR GetXDisplacementFromLink_bank1E
|1E9F23| TYA
|1E9F24| ORA.b $00
|1E9F26| TAY

|1E9F27| LDA.w .speed_x,Y
|1E9F2A| STA.w $0D50,X

|1E9F2D| LDA.w .speed_y,Y
|1E9F30| STA.w $0D40,X

|1E9F33| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1E9F34| CMP.b #$07
|1E9F36| BNE .dont_move_upwards

|1E9F38| PHA

|1E9F39| LDA.w $0D00,X
|1E9F3C| SEC
|1E9F3D| SBC.b #$1D
|1E9F3F| STA.w $0D00,X

|1E9F42| LDA.w $0D20,X
|1E9F45| SBC.b #$00
|1E9F47| STA.w $0D20,X

|1E9F4A| PLA

.dont_move_upwards
|1E9F4B| LSR A
|1E9F4C| LSR A
|1E9F4D| TAY

|1E9F4E| LDA.w .anim_step,Y
|1E9F51| STA.w $0DC0,X

|1E9F54| RTS

;===================================================================================================

pool Kyameron_Moving

.anim_step
|1E9F55| db $03, $02, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

Kyameron_Moving:
|1E9F59| STZ.w $0BA0,X

|1E9F5C| JSR CheckDamageToAndFromLink_bank1E
|1E9F5F| BCS .damage

|1E9F61| JSR MoveSpriteXY_bank1E
|1E9F64| JSR CheckSpriteTileCollision_bank1E
|1E9F67| AND.b #$03
|1E9F69| BEQ .no_horizontal_collision

|1E9F6B| LDA.w $0D50,X
|1E9F6E| EOR.b #$FF
|1E9F70| INC A
|1E9F71| STA.w $0D50,X

|1E9F74| INC.w $0EC0,X
|1E9F77| BRA .no_horizontal_collision

.no_horizontal_collision
|1E9F79| LDA.w $0E70,X
|1E9F7C| AND.b #$0C
|1E9F7E| BEQ .no_vertical_collision

|1E9F80| LDA.w $0D40,X
|1E9F83| EOR.b #$FF
|1E9F85| INC A
|1E9F86| STA.w $0D40,X

|1E9F89| INC.w $0EC0,X

.no_vertical_collision
|1E9F8C| LDA.w $0EC0,X
|1E9F8F| CMP.b #$03
|1E9F91| BCC .can_bounce_more

.damage
|1E9F93| LDA.b #$04
|1E9F95| STA.w $0D80,X

|1E9F98| LDA.b #$0F
|1E9F9A| STA.w $0DF0,X

|1E9F9D| LDA.b #$28 ; SFX2.28
|1E9F9F| JSL QueueSpriteSFX2WithPan

.can_bounce_more
|1E9FA3| INC.w $0E80,X

|1E9FA6| LDA.w $0E80,X
|1E9FA9| LSR A
|1E9FAA| LSR A
|1E9FAB| LSR A

|1E9FAC| AND.b #$03
|1E9FAE| TAY

|1E9FAF| LDA.w .anim_step,Y
|1E9FB2| STA.w $0DC0,X

|1E9FB5| TXA
|1E9FB6| EOR.b $1A
|1E9FB8| AND.b #$07
|1E9FBA| BNE .exit

|1E9FBC| JSL GetRandomNumber

|1E9FC0| REP #$20

|1E9FC2| AND.w #$000F
|1E9FC5| SEC
|1E9FC6| SBC.w #$0004
|1E9FC9| STA.b $00

|1E9FCB| SEP #$20

|1E9FCD| JSL GetRandomNumber

|1E9FD1| REP #$20

|1E9FD3| AND.w #$000F
|1E9FD6| SEC
|1E9FD7| SBC.w #$0004
|1E9FDA| STA.b $02

|1E9FDC| SEP #$20

|1E9FDE| JSL GarnishSpawn_Sparkle

.exit
|1E9FE2| RTS

;===================================================================================================

Kyameron_Dissipate:
|1E9FE3| LDA.w $0DF0,X
|1E9FE6| BNE .still_being_dramatic_about_the_ordeal

|1E9FE8| STZ.w $0EC0,X
|1E9FEB| STZ.w $0D80,X
|1E9FEE| STZ.w $0F70,X

|1E9FF1| LDA.b #$40
|1E9FF3| STA.w $0DF0,X

|1E9FF6| RTS

.still_being_dramatic_about_the_ordeal
|1E9FF7| LSR A
|1E9FF8| LSR A
|1E9FF9| TAY

|1E9FFA| CLC
|1E9FFB| ADC.b #$0F
|1E9FFD| STA.w $0DC0,X

|1EA000| RTS

;===================================================================================================

GarnishSpawn_Sparkle_limited:
|1EA001| PHX
|1EA002| TXY

|1EA003| LDX.b #$0E
|1EA005| BRA .check_slot

;===================================================================================================

#GarnishSpawn_Sparkle:
|1EA007| PHX
|1EA008| TXY

|1EA009| LDX.b #$1D

.check_slot
|1EA00B| LDA.l $7FF800,X
|1EA00F| BEQ .free_slot

|1EA011| DEX
|1EA012| BPL .check_slot

|1EA014| STX.b $0F

|1EA016| PLX

|1EA017| RTL

;---------------------------------------------------------------------------------------------------

.free_slot
|1EA018| STX.b $0F

|1EA01A| LDA.b #$05 ; GARNISH 05
|1EA01C| STA.l $7FF800,X
|1EA020| STA.w $0FB4

|1EA023| LDA.w $0D10,Y
|1EA026| CLC
|1EA027| ADC.b $00
|1EA029| STA.l $7FF83C,X

|1EA02D| LDA.w $0D30,Y
|1EA030| ADC.b $01
|1EA032| STA.l $7FF878,X

|1EA036| LDA.w $0D00,Y
|1EA039| SEC
|1EA03A| SBC.w $0F70,Y
|1EA03D| PHP

|1EA03E| CLC
|1EA03F| ADC.b #$10
|1EA041| PHP

|1EA042| CLC
|1EA043| ADC.b $02
|1EA045| STA.l $7FF81E,X

|1EA049| LDA.w $0D20,Y
|1EA04C| ADC.b $03

|1EA04E| PLP
|1EA04F| ADC.b #$00

|1EA051| PLP
|1EA052| SBC.b #$00

|1EA054| STA.l $7FF85A,X

|1EA058| LDA.b #$1F
|1EA05A| STA.l $7FF90E,X

|1EA05E| TYA
|1EA05F| STA.l $7FF92C,X

|1EA063| LDA.w $0F20,Y
|1EA066| STA.l $7FF968,X

|1EA06A| PLX

|1EA06B| RTL

;===================================================================================================

pool SpriteDraw_Kyameron

.oam_groups
|1EA06C| dw   1,   8 : db $B4, $00, $00, $00
|1EA074| dw   7,   8 : db $B5, $00, $00, $00
|1EA07C| dw   4,  -3 : db $86, $00, $00, $00
|1EA084| dw   0, -13 : db $A2, $80, $00, $02

|1EA08C| dw   2,   8 : db $B4, $00, $00, $00
|1EA094| dw   6,   8 : db $B5, $00, $00, $00
|1EA09C| dw   4,  -6 : db $96, $00, $00, $00
|1EA0A4| dw   0, -20 : db $A2, $00, $00, $02

|1EA0AC| dw   4,  -1 : db $96, $00, $00, $00
|1EA0B4| dw   0, -27 : db $A2, $00, $00, $02
|1EA0BC| dw   0, -27 : db $A2, $00, $00, $02
|1EA0C4| dw   0, -27 : db $A2, $00, $00, $02

|1EA0CC| dw  -6,  -6 : db $DF, $01, $00, $00
|1EA0D4| dw  14,  -6 : db $DF, $41, $00, $00
|1EA0DC| dw  -6,  14 : db $DF, $81, $00, $00
|1EA0E4| dw  14,  14 : db $DF, $C1, $00, $00

|1EA0EC| dw  -6,  -6 : db $96, $00, $00, $00
|1EA0F4| dw  14,  -6 : db $96, $40, $00, $00
|1EA0FC| dw  -6,  14 : db $96, $80, $00, $00
|1EA104| dw  14,  14 : db $96, $C0, $00, $00

|1EA10C| dw  -4,  -4 : db $8D, $01, $00, $00
|1EA114| dw  12,  -4 : db $8D, $41, $00, $00
|1EA11C| dw  -4,  12 : db $8D, $81, $00, $00
|1EA124| dw  12,  12 : db $8D, $C1, $00, $00

|1EA12C| dw   0,   0 : db $8D, $01, $00, $00
|1EA134| dw   8,   0 : db $8D, $41, $00, $00
|1EA13C| dw   0,   8 : db $8D, $81, $00, $00
|1EA144| dw   8,   8 : db $8D, $C1, $00, $00

;---------------------------------------------------------------------------------------------------

.flip
|1EA14C| db $40, $00
|1EA14E| db $00, $00
|1EA150| db $00, $00
|1EA152| db $00, $00
|1EA154| db $00, $40
|1EA156| db $C0, $80

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Kyameron:
|1EA158| LDA.w $0DC0,X
|1EA15B| CMP.b #$0C
|1EA15D| BCS .dispersing

|1EA15F| LDY.w $0DC0,X

|1EA162| LDA.w $0F50,X
|1EA165| PHA

|1EA166| AND.b #$3F
|1EA168| ORA.w .flip,Y
|1EA16B| STA.w $0F50,X

|1EA16E| JSL SpriteDraw_SingleLarge_long

|1EA172| PLA
|1EA173| STA.w $0F50,X

|1EA176| RTS

.dispersing
|1EA177| SEC
|1EA178| SBC.b #$0C
|1EA17A| TAY

|1EA17B| LDA.b #$00
|1EA17D| XBA

|1EA17E| TYA

|1EA17F| REP #$20

|1EA181| ASL A
|1EA182| ASL A
|1EA183| ASL A
|1EA184| ASL A
|1EA185| ASL A

|1EA186| ADC.w #.oam_groups
|1EA189| STA.b $08

|1EA18B| SEP #$20

|1EA18D| LDA.b #$04
|1EA18F| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

pool Sprite_99_Pengator

.anim_step
|1EA192| db $05, $00, $0A, $0F

endpool

;---------------------------------------------------------------------------------------------------

Sprite_99_Pengator:
|1EA196| LDY.w $0DE0,X

|1EA199| LDA.w $0D90,X
|1EA19C| CLC
|1EA19D| ADC.w .anim_step,Y
|1EA1A0| STA.w $0DC0,X

|1EA1A3| JSR SpriteDraw_Pengator

|1EA1A6| LDA.w $0EA0,X
|1EA1A9| BNE .recoiling

|1EA1AB| LDA.w $0E70,X
|1EA1AE| AND.b #$0F
|1EA1B0| BEQ .no_tile_collision

.recoiling
|1EA1B2| STZ.w $0D80,X
|1EA1B5| STZ.w $0D50,X
|1EA1B8| STZ.w $0D40,X

.no_tile_collision
|1EA1BB| JSR CheckIfActive_bank1E
|1EA1BE| JSR HandleSpriteRecoil_bank1E
|1EA1C1| JSR CheckDamageToAndFromLink_bank1E
|1EA1C4| JSR MoveSpriteXYZ_bank1E

|1EA1C7| DEC.w $0F80,X
|1EA1CA| DEC.w $0F80,X

|1EA1CD| LDA.w $0F70,X
|1EA1D0| BPL .airborne

|1EA1D2| STZ.w $0F80,X
|1EA1D5| STZ.w $0F70,X

.airborne
|1EA1D8| JSR CheckSpriteTileCollision_bank1E

|1EA1DB| LDA.w $0D80,X
|1EA1DE| JSL JumpTableLocal
|1EA1E2| dw Pengator_FaceLink
|1EA1E4| dw Pengator_Accelerate
|1EA1E6| dw Pengator_Hop
|1EA1E8| dw Pengator_Slide

;===================================================================================================

Pengator_FaceLink:
|1EA1EA| JSR GetDirectionTowardsLink_bank1E
|1EA1ED| TYA
|1EA1EE| STA.w $0DE0,X

|1EA1F1| INC.w $0D80,X

|1EA1F4| RTS

;===================================================================================================

pool Pengator_Accelerate

.speed_x ; bleeds into next
|1EA1F5| db  1, -1

.speed_y
|1EA1F7| db  0,  0,  1, -1

endpool

;---------------------------------------------------------------------------------------------------

Pengator_Accelerate:
|1EA1FB| TXA
|1EA1FC| EOR.b $1A
|1EA1FE| AND.b #$03
|1EA200| BNE .continue

|1EA202| STZ.b $00

|1EA204| LDY.w $0DE0,X

|1EA207| LDA.w $0D50,X
|1EA20A| CMP.w Sixteen_X,Y
|1EA20D| BEQ .at_max_x

|1EA20F| CLC
|1EA210| ADC.w .speed_x,Y
|1EA213| STA.w $0D50,X

|1EA216| INC.b $00

.at_max_x
|1EA218| LDA.w $0D40,X
|1EA21B| CMP.w Sixteen_Y,Y
|1EA21E| BEQ .at_max_y

|1EA220| CLC
|1EA221| ADC.w .speed_y,Y
|1EA224| STA.w $0D40,X

|1EA227| INC.b $00

.at_max_y
|1EA229| LDA.b $00
|1EA22B| BNE .continue

|1EA22D| LDA.b #$0F
|1EA22F| STA.w $0DF0,X

|1EA232| INC.w $0D80,X

.continue
|1EA235| LDA.b $1A
|1EA237| AND.b #$04
|1EA239| LSR A
|1EA23A| LSR A
|1EA23B| TAY ; useless

|1EA23C| STA.w $0D90,X

|1EA23F| RTS

;===================================================================================================

pool Pengator_Hop

.anim_step
|1EA240| db $04, $04, $03, $02

endpool

;---------------------------------------------------------------------------------------------------

Pengator_Hop:
|1EA244| LDA.w $0DF0,X
|1EA247| BNE .delay

|1EA249| INC.w $0D80,X

.delay
|1EA24C| CMP.b #$05
|1EA24E| BNE .no_hop

|1EA250| PHA

|1EA251| LDA.b #$18
|1EA253| STA.w $0F80,X

|1EA256| PLA

.no_hop
|1EA257| LSR A
|1EA258| LSR A
|1EA259| TAY

|1EA25A| LDA.w .anim_step,Y
|1EA25D| STA.w $0D90,X

|1EA260| RTS

;===================================================================================================

pool Pengator_Slide

.sparkle_offset_x
|1EA261| db  8, 10, 12, 14, 12, 12, 12, 12

.sparkle_offset_y
|1EA269| db  4,  4,  4,  4,  0,  4,  8, 12

endpool

;---------------------------------------------------------------------------------------------------

Pengator_Slide:
|1EA271| TXA
|1EA272| EOR.b $1A
|1EA274| AND.b #$07
|1EA276| ORA.w $0F70,X
|1EA279| BNE .exit

|1EA27B| LDA.w $0DE0,X
|1EA27E| STA.b $06

|1EA280| JSL GetRandomNumber
|1EA284| AND.b #$03
|1EA286| TAY

|1EA287| LDA.b $06
|1EA289| CMP.b #$02
|1EA28B| BCC .facing_vertical

|1EA28D| INY
|1EA28E| INY
|1EA28F| INY
|1EA290| INY

.facing_vertical
|1EA291| LDA.w .sparkle_offset_y,Y
|1EA294| STA.b $00
|1EA296| STZ.b $01

|1EA298| JSL GetRandomNumber

|1EA29C| AND.b #$03
|1EA29E| TAY

|1EA29F| LDA.b $06
|1EA2A1| CMP.b #$02
|1EA2A3| BCC .facing_vertical_also

|1EA2A5| INY
|1EA2A6| INY
|1EA2A7| INY
|1EA2A8| INY

.facing_vertical_also
|1EA2A9| LDA.w .sparkle_offset_x,Y
|1EA2AC| STA.b $02
|1EA2AE| STZ.b $03

|1EA2B0| JSL GarnishSpawn_Sparkle_limited

.exit
|1EA2B4| RTS

;===================================================================================================

pool SpriteDraw_Pengator

.oam_group_set_1
|1EA2B5| dw  -1,  -8 : db $82, $00, $00, $02
|1EA2BD| dw   0,   0 : db $88, $00, $00, $02

|1EA2C5| dw  -1,  -7 : db $82, $00, $00, $02
|1EA2CD| dw   0,   0 : db $8A, $00, $00, $02

|1EA2D5| dw  -3,  -6 : db $82, $00, $00, $02
|1EA2DD| dw   0,   0 : db $88, $00, $00, $02

|1EA2E5| dw  -6,  -4 : db $82, $00, $00, $02
|1EA2ED| dw   0,   0 : db $8A, $00, $00, $02

|1EA2F5| dw  -4,   0 : db $A2, $00, $00, $02
|1EA2FD| dw   4,   0 : db $A3, $00, $00, $02

|1EA305| dw   1,  -8 : db $82, $40, $00, $02
|1EA30D| dw   0,   0 : db $88, $40, $00, $02

|1EA315| dw   1,  -7 : db $82, $40, $00, $02
|1EA31D| dw   0,   0 : db $8A, $40, $00, $02

|1EA325| dw   3,  -6 : db $82, $40, $00, $02
|1EA32D| dw   0,   0 : db $88, $40, $00, $02

|1EA335| dw   6,  -4 : db $82, $40, $00, $02
|1EA33D| dw   0,   0 : db $8A, $40, $00, $02

|1EA345| dw   4,   0 : db $A2, $40, $00, $02
|1EA34D| dw  -4,   0 : db $A3, $40, $00, $02

|1EA355| dw   0,  -7 : db $80, $00, $00, $02
|1EA35D| dw   0,   0 : db $86, $00, $00, $02

|1EA365| dw   0,  -7 : db $80, $40, $00, $02
|1EA36D| dw   0,   0 : db $86, $40, $00, $02

|1EA375| dw   0,  -4 : db $80, $00, $00, $02
|1EA37D| dw   0,   0 : db $86, $00, $00, $02

|1EA385| dw   0,  -1 : db $80, $00, $00, $02
|1EA38D| dw   0,   0 : db $86, $00, $00, $02

|1EA395| dw  -8,   0 : db $8E, $00, $00, $02
|1EA39D| dw   8,   0 : db $8E, $40, $00, $02

|1EA3A5| dw   0,  -8 : db $84, $00, $00, $02
|1EA3AD| dw   0,   0 : db $8C, $00, $00, $02

|1EA3B5| dw   0,  -8 : db $84, $40, $00, $02
|1EA3BD| dw   0,   0 : db $8C, $40, $00, $02

|1EA3C5| dw   0,  -7 : db $84, $00, $00, $02
|1EA3CD| dw   0,   0 : db $8C, $00, $00, $02

|1EA3D5| dw   0,   0 : db $8C, $40, $00, $02
|1EA3DD| dw   0,  -6 : db $84, $40, $00, $02

|1EA3E5| dw  -8,   0 : db $A0, $00, $00, $02
|1EA3ED| dw   8,   0 : db $A0, $40, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_set_2
|1EA3F5| dw   0,  16 : db $B5, $00, $00, $00
|1EA3FD| dw   8,  16 : db $B5, $40, $00, $00

|1EA405| dw   0,  -8 : db $A5, $00, $00, $00
|1EA40D| dw   8,  -8 : db $A5, $40, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Pengator:
|1EA415| LDA.b #$00
|1EA417| XBA
|1EA418| LDA.w $0DC0,X

|1EA41B| REP #$20

|1EA41D| ASL A
|1EA41E| ASL A
|1EA41F| ASL A
|1EA420| ASL A
|1EA421| ADC.w #.oam_group_set_1
|1EA424| STA.b $08

|1EA426| SEP #$20

|1EA428| LDA.b #$02
|1EA42A| JSR TabulatedSpriteDraw_bank1E

|1EA42D| LDY.b #$00

|1EA42F| LDA.b #$00
|1EA431| XBA

|1EA432| LDA.w $0DC0,X
|1EA435| CMP.b #$0E
|1EA437| BEQ .draw_more

|1EA439| INY

|1EA43A| CMP.b #$13
|1EA43C| BNE .draw_not_more

;---------------------------------------------------------------------------------------------------

.draw_more
|1EA43E| TYA

|1EA43F| REP #$20

|1EA441| ASL A
|1EA442| ASL A
|1EA443| ASL A
|1EA444| ASL A
|1EA445| ADC.w #.oam_group_set_2
|1EA448| STA.b $08

|1EA44A| LDA.b $90
|1EA44C| CLC
|1EA44D| ADC.w #$0008
|1EA450| STA.b $90

|1EA452| INC.b $92
|1EA454| INC.b $92

|1EA456| SEP #$20

|1EA458| LDA.b #$02
|1EA45A| JSR TabulatedSpriteDraw_bank1E

;---------------------------------------------------------------------------------------------------

.draw_not_more
|1EA45D| JSL DrawSpriteShadow_long

|1EA461| RTS

;===================================================================================================

LaserBeam:
|1EA462| JSL SpriteDraw_SingleSmall_long
|1EA466| JSR CheckIfActive_bank1E

|1EA469| JSR LaserBeam_BuildUpGarnish
|1EA46C| JSR MoveSpriteXY_bank1E
|1EA46F| JSL CheckDamageToLink_same_layer_long

|1EA473| LDA.w $0DF0,X
|1EA476| BNE .exit

|1EA478| JSR CheckSpriteTileCollision_bank1E
|1EA47B| BEQ .exit

|1EA47D| STZ.w $0DD0,X

|1EA480| LDA.b #$26 ; SFX3.26
|1EA482| JSL QueueSpriteSFX3WithPan

|1EA486| RTS

.exit
|1EA487| RTS

;===================================================================================================

LaserBeam_BuildUpGarnish:
|1EA488| PHX
|1EA489| TXY

|1EA48A| LDX.b #$1D

.next_slot
|1EA48C| LDA.l $7FF800,X
|1EA490| BEQ .free_slot

|1EA492| DEX
|1EA493| BPL .next_slot

|1EA495| DEC.w $0FF8
|1EA498| BPL .use_indexer

|1EA49A| LDA.b #$1D
|1EA49C| STA.w $0FF8

.use_indexer
|1EA49F| LDX.w $0FF8

;---------------------------------------------------------------------------------------------------

.free_slot
|1EA4A2| LDA.b #$04 ; GARNISH 04
|1EA4A4| STA.l $7FF800,X
|1EA4A8| STA.w $0FB4

|1EA4AB| LDA.w $0D10,Y
|1EA4AE| STA.l $7FF83C,X

|1EA4B2| LDA.w $0D30,Y
|1EA4B5| STA.l $7FF878,X

|1EA4B9| LDA.w $0D00,Y
|1EA4BC| CLC
|1EA4BD| ADC.b #$10
|1EA4BF| STA.l $7FF81E,X

|1EA4C3| LDA.w $0D20,Y
|1EA4C6| ADC.b #$00
|1EA4C8| STA.l $7FF85A,X

|1EA4CC| LDA.b #$10
|1EA4CE| STA.l $7FF90E,X

|1EA4D2| LDA.w $0DC0,Y
|1EA4D5| STA.l $7FF9FE,X

|1EA4D9| TYA
|1EA4DA| STA.l $7FF92C,X

|1EA4DE| LDA.w $0F20,Y
|1EA4E1| STA.l $7FF968,X

|1EA4E5| PLX

|1EA4E6| RTS

;===================================================================================================

SpritePrep_LaserEye:
|1EA4E7| PHB
|1EA4E8| PHK
|1EA4E9| PLB

|1EA4EA| JSR .main

|1EA4ED| PLB

|1EA4EE| RTL

;---------------------------------------------------------------------------------------------------

.offset
|1EA4EF| db  -8,  8

;---------------------------------------------------------------------------------------------------

.main
|1EA4F1| LDA.w $0E20,X
|1EA4F4| CMP.b #$97 ; SPRITE 97
|1EA4F6| BCC .horizontal

|1EA4F8| LDA.w $0D10,X
|1EA4FB| CLC
|1EA4FC| ADC.b #$08
|1EA4FE| STA.w $0D10,X

|1EA501| LDA.w $0E20,X
|1EA504| SEC
|1EA505| SBC.b #$95
|1EA507| STA.w $0DE0,X

|1EA50A| TAY

|1EA50B| LDA.w $0D10,X
|1EA50E| AND.b #$10
|1EA510| EOR.b #$10
|1EA512| STA.w $0EB0,X

|1EA515| BNE .dont_adjust_y

|1EA517| LDA.w $0D00,X
|1EA51A| CLC
|1EA51B| ADC.w .offset-2,Y
|1EA51E| STA.w $0D00,X

.dont_adjust_y
|1EA521| RTS

;---------------------------------------------------------------------------------------------------

.horizontal
|1EA522| LDA.w $0E20,X
|1EA525| SEC
|1EA526| SBC.b #$95
|1EA528| STA.w $0DE0,X

|1EA52B| TAY

|1EA52C| LDA.w $0D00,X
|1EA52F| AND.b #$10
|1EA531| STA.w $0EB0,X

|1EA534| BNE .dont_adjust_x

|1EA536| LDA.w $0D10,X
|1EA539| CLC
|1EA53A| ADC.w .offset,Y
|1EA53D| STA.w $0D10,X

.dont_adjust_x
|1EA540| RTS

;===================================================================================================

Sprite_95_LaserEyeLeft:
Sprite_96_LaserEyeRight:
Sprite_97_LaserEyeTop:
Sprite_98_LaserEyeBottom:
|1EA541| LDA.w $0D90,X
|1EA544| BEQ LaserEye

|1EA546| JMP.w LaserBeam

;===================================================================================================

LaserEye:
|1EA549| JSR SpriteDraw_LaserEye
|1EA54C| JSR CheckIfActive_bank1E

|1EA54F| LDA.w $0D80,X
|1EA552| JSL JumpTableLocal
|1EA556| dw LaserEye_Reconnaissance
|1EA558| dw LaserEye_TangoLocked

;===================================================================================================

pool LaserEye_Reconnaissance

.direction
|1EA55A| db $02, $03, $00, $01

endpool

;---------------------------------------------------------------------------------------------------

LaserEye_Reconnaissance:
|1EA55E| REP #$20

|1EA560| LDA.b $20
|1EA562| SEC
|1EA563| SBC.w $0FDA
|1EA566| STA.b $0C

|1EA568| LDA.b $22
|1EA56A| SEC
|1EA56B| SBC.w $0FD8
|1EA56E| STA.b $0E

|1EA570| SEP #$20

|1EA572| LDA.b $2F
|1EA574| LSR A

;---------------------------------------------------------------------------------------------------

|1EA575| LDY.w $0EB0,X
|1EA578| CPY.b #$01

|1EA57A| TAY

|1EA57B| LDA.w $0DE0,X
|1EA57E| BCS .ignore_direction

|1EA580| CMP.w .direction,Y
|1EA583| BNE .dont_fire

.ignore_direction
|1EA585| CMP.b #$02

|1EA587| REP #$20
|1EA589| BCS .vertical

|1EA58B| LDA.b $0C
|1EA58D| BRA .continue

.vertical
|1EA58F| LDA.b $0E

;---------------------------------------------------------------------------------------------------

.continue
|1EA591| CLC
|1EA592| ADC.w #$0010
|1EA595| CMP.w #$0020

|1EA598| SEP #$20
|1EA59A| BCS .dont_fire

|1EA59C| LDA.b #$20

|1EA59E| LDY.w $0EB0,X
|1EA5A1| BEQ .pointless_check

|1EA5A3| LDA.b #$20

.pointless_check
|1EA5A5| STA.w $0DF0,X

|1EA5A8| INC.w $0D80,X

|1EA5AB| RTS

.dont_fire
|1EA5AC| STZ.w $0DC0,X

|1EA5AF| RTS

;===================================================================================================

pool LaserEye_FireBeam

.offset_x_low ; bleeds into next
|1EA5B0| db   12,   -4

.offset_y_low
|1EA5B2| db    4,    4,   12,   -4

.offset_x_high ; bleeds into next
|1EA5B6| db    0,   -1

.offset_y_high
|1EA5B8| db    0,    0,    0,   -1

.speed_x ; bleeds into next
|1EA5BC| db  112, -112

.speed_y
|1EA5BE| db    0,    0,  112, -112

endpool

;---------------------------------------------------------------------------------------------------

LaserEye_TangoLocked:
|1EA5C2| LDA.b #$01
|1EA5C4| STA.w $0DC0,X

|1EA5C7| LDA.w $0DF0,X
|1EA5CA| BNE .cover_me_im_reloading

|1EA5CC| STZ.w $0D80,X

|1EA5CF| JSR LaserEye_FireBeam

|1EA5D2| LDA.b #$0C
|1EA5D4| STA.w $0F10,X

.cover_me_im_reloading
|1EA5D7| RTS

;===================================================================================================

LaserEye_FireBeam:
|1EA5D8| LDA.b #$95 ; SPRITE 95
|1EA5DA| JSL SpawnSpriteDynamically
|1EA5DE| BMI .no_space

|1EA5E0| PHX

|1EA5E1| LDA.w $0DE0,X
|1EA5E4| TAX

|1EA5E5| AND.b #$02
|1EA5E7| LSR A
|1EA5E8| STA.w $0DC0,Y

|1EA5EB| LDA.b $00
|1EA5ED| CLC
|1EA5EE| ADC.w .offset_x_low,X
|1EA5F1| STA.w $0D10,Y

|1EA5F4| LDA.b $01
|1EA5F6| ADC.w .offset_x_high,X
|1EA5F9| STA.w $0D30,Y

|1EA5FC| LDA.b $02
|1EA5FE| CLC
|1EA5FF| ADC.w .offset_y_low,X
|1EA602| STA.w $0D00,Y

|1EA605| LDA.b $03
|1EA607| ADC.w .offset_y_high,X
|1EA60A| STA.w $0D20,Y

|1EA60D| LDA.w .speed_x,X
|1EA610| STA.w $0D50,Y

|1EA613| LDA.w .speed_y,X
|1EA616| STA.w $0D40,Y

|1EA619| LDA.b #$20
|1EA61B| STA.w $0E40,Y
|1EA61E| STA.w $0D90,Y

|1EA621| LDA.b #$05
|1EA623| STA.w $0F50,Y

|1EA626| LDA.b #$48
|1EA628| STA.w $0CAA,Y
|1EA62B| STA.w $0BA0,Y

|1EA62E| LDA.b #$05
|1EA630| STA.w $0DF0,Y

|1EA633| LDA.l $7EF35A
|1EA637| CMP.b #$03
|1EA639| BNE .full_photon_jacket

|1EA63B| LDA.b #$20
|1EA63D| STA.w $0BE0,Y

.full_photon_jacket
|1EA640| PLX

|1EA641| LDA.b #$19 ; SFX3.19
|1EA643| JSL QueueSpriteSFX3WithPan

.no_space
|1EA647| RTS

;===================================================================================================

pool SpriteDraw_LaserEye

.oam_groups
|1EA648| dw   8,  -4 : db $C8, $40, $00, $00
|1EA650| dw   8,   4 : db $D8, $40, $00, $00
|1EA658| dw   8,  12 : db $C8, $C0, $00, $00

|1EA660| dw   8,  -4 : db $C9, $40, $00, $00
|1EA668| dw   8,   4 : db $D9, $40, $00, $00
|1EA670| dw   8,  12 : db $C9, $C0, $00, $00

|1EA678| dw   0,  -4 : db $C8, $00, $00, $00
|1EA680| dw   0,   4 : db $D8, $00, $00, $00
|1EA688| dw   0,  12 : db $C8, $80, $00, $00

|1EA690| dw   0,  -4 : db $C9, $00, $00, $00
|1EA698| dw   0,   4 : db $D9, $00, $00, $00
|1EA6A0| dw   0,  12 : db $C9, $80, $00, $00

|1EA6A8| dw  -4,   8 : db $D6, $00, $00, $00
|1EA6B0| dw   4,   8 : db $D7, $00, $00, $00
|1EA6B8| dw  12,   8 : db $D6, $40, $00, $00

|1EA6C0| dw  -4,   8 : db $C6, $00, $00, $00
|1EA6C8| dw   4,   8 : db $C7, $00, $00, $00
|1EA6D0| dw  12,   8 : db $C6, $40, $00, $00

|1EA6D8| dw  -4,   0 : db $D6, $80, $00, $00
|1EA6E0| dw   4,   0 : db $D7, $80, $00, $00
|1EA6E8| dw  12,   0 : db $D6, $C0, $00, $00

|1EA6F0| dw  -4,   0 : db $C6, $80, $00, $00
|1EA6F8| dw   4,   0 : db $C7, $80, $00, $00
|1EA700| dw  12,   0 : db $C6, $C0, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_LaserEye:
|1EA708| LDA.w $0EB0,X
|1EA70B| BEQ .continue

|1EA70D| LDA.b #$01
|1EA70F| STA.w $0DC0,X

|1EA712| LDA.w $0F10,X
|1EA715| BEQ .continue

|1EA717| STZ.w $0DC0,X

.continue
|1EA71A| LDA.b #$30
|1EA71C| STA.w $0B89,X

|1EA71F| LDA.b #$00
|1EA721| XBA
|1EA722| LDA.w $0DE0,X

|1EA725| ASL A
|1EA726| ADC.w $0DC0,X

|1EA729| REP #$20

|1EA72B| ASL A
|1EA72C| ASL A
|1EA72D| ASL A

|1EA72E| STA.b $00

|1EA730| ASL A
|1EA731| ADC.b $00
|1EA733| ADC.w #.oam_groups

|1EA736| STA.b $08

|1EA738| SEP #$20

|1EA73A| LDA.b #$03
|1EA73C| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

Sprite_94_Tile_bounce:
|1EA73F| JMP.w Sprite_94_Tile

;---------------------------------------------------------------------------------------------------

Sprite_94_Pirogusu:
|1EA742| LDA.w $0E90,X
|1EA745| BNE Sprite_94_Tile_bounce

|1EA747| LDA.w $0B89,X
|1EA74A| ORA.b #$30
|1EA74C| STA.w $0B89,X

|1EA74F| JSR SpriteDraw_Pirogusu
|1EA752| JSR CheckIfActive_bank1E

|1EA755| LDA.w $0D80,X
|1EA758| JSL JumpTableLocal
|1EA75C| dw Pirogusu_InHole
|1EA75E| dw Pirogusu_Crowning
|1EA760| dw Pirogusu_Plop
|1EA762| dw Pirogusu_Active

;===================================================================================================

pool Pirogusu_InHole

.anim_step
|1EA764| db $02, $03, $00, $01

endpool

;---------------------------------------------------------------------------------------------------

Pirogusu_InHole:
|1EA768| LDA.w $0DF0,X
|1EA76B| BNE .wait_for_timer

|1EA76D| INC.w $0D80,X
|1EA770| LDA.b #$1F
|1EA772| STA.w $0DF0,X

.wait_for_timer
|1EA775| STA.w $0BA0,X

|1EA778| LDY.w $0DE0,X

|1EA77B| LDA.w .anim_step,Y
|1EA77E| STA.w $0D90,X

|1EA781| RTS

;===================================================================================================

pool Pirogusu_Crowning

.anim
|1EA782| db $09, $0B, $05, $07, $05, $0B, $07, $09

.speed_y
|1EA78A| db  0,  0 ; bleeds into next

.speed_x
|1EA78C| db  4, -4,  0,  0

endpool

;---------------------------------------------------------------------------------------------------

Pirogusu_Crowning:
|1EA790| LDA.w $0DF0,X
|1EA793| BNE .push_push

|1EA795| INC.w $0D80,X

|1EA798| LDA.b #$20
|1EA79A| STA.w $0DF0,X

|1EA79D| STZ.w $0BA0,X

|1EA7A0| JSR ZeroVelocityXY_bank1E

|1EA7A3| RTS

.push_push
|1EA7A4| LDA.w $0DE0,X
|1EA7A7| ASL A
|1EA7A8| STA.b $00

|1EA7AA| LDA.w $0DF0,X
|1EA7AD| LSR A
|1EA7AE| LSR A
|1EA7AF| LSR A
|1EA7B0| AND.b #$01
|1EA7B2| ORA.b $00
|1EA7B4| TAY

|1EA7B5| LDA.w .anim,Y
|1EA7B8| STA.w $0D90,X

|1EA7BB| LDY.w $0DE0,X

|1EA7BE| LDA.w .speed_x,Y
|1EA7C1| STA.w $0D50,X

|1EA7C4| LDA.w .speed_y,Y
|1EA7C7| STA.w $0D40,X

|1EA7CA| JSR MoveSpriteXY_bank1E

|1EA7CD| RTS

;===================================================================================================

pool Pirogusu_Animate

.anim_step
|1EA7CE| db $10, $11, $12, $13, $0C, $0D, $0E, $0F

endpool

;===================================================================================================

pool Pirogusu_Plop

.acceleration_x
|1EA7D6| db  2, -2 ; bleeds into next

.acceleration_y
|1EA7D8| db  0,  0,  2, -2

endpool

;---------------------------------------------------------------------------------------------------

Pirogusu_Plop:
|1EA7DC| JSR CheckDamageToAndFromLink_bank1E
|1EA7DF| JSR MoveSpriteXY_bank1E

|1EA7E2| LDY.w $0DE0,X

|1EA7E5| LDA.w $0D50,X
|1EA7E8| CLC
|1EA7E9| ADC.w .acceleration_x,Y
|1EA7EC| STA.w $0D50,X

|1EA7EF| LDA.w $0D40,X
|1EA7F2| CLC
|1EA7F3| ADC.w .acceleration_y,Y
|1EA7F6| STA.w $0D40,X

|1EA7F9| LDA.w $0DF0,X
|1EA7FC| BNE Pirogusu_Animate

|1EA7FE| JSL Sprite_SpawnSmallSplash

|1EA802| LDA.b #$10
|1EA804| STA.w $0E00,X

|1EA807| INC.w $0D80,X

;===================================================================================================

Pirogusu_Animate:
|1EA80A| LDA.w $0DE0,X
|1EA80D| ASL A
|1EA80E| STA.b $00

|1EA810| LDA.b $1A
|1EA812| AND.b #$04
|1EA814| LSR A
|1EA815| LSR A

|1EA816| ORA.b $00
|1EA818| TAY

|1EA819| LDA.w .anim_step,Y
|1EA81C| STA.w $0D90,X

|1EA81F| RTS

;===================================================================================================

Sprite_SpawnSmallSplash:
|1EA820| LDA.b #$EC ; SPRITE EC
|1EA822| LDY.b #$0E
|1EA824| JSL SpawnSpriteDynamically.slot_limited
|1EA828| BMI .no_space

|1EA82A| JSL SetSpawnedSpriteCoordinates

|1EA82E| STZ.w $012E

|1EA831| LDA.b #$28 ; SFX2.28
|1EA833| JSL QueueSpriteSFX2WithPan

|1EA837| LDA.b #$03
|1EA839| STA.w $0DD0,Y

|1EA83C| LDA.b #$0F
|1EA83E| STA.w $0DF0,Y

|1EA841| LDA.b #$00
|1EA843| STA.w $0D80,Y

|1EA846| LDA.b #$03
|1EA848| STA.w $0E40,Y

.no_space
|1EA84B| RTL

;===================================================================================================

pool Pirogusu_Active

.speed_x ; bleeds into next
|1EA84C| db  24, -24

.speed_y
|1EA84E| db   0,   0,  24, -24

endpool

;---------------------------------------------------------------------------------------------------

Pirogusu_Active:
|1EA852| JSR HandleSpriteRecoil_bank1E
|1EA855| JSR CheckDamageToAndFromLink_bank1E
|1EA858| JSR Pirogusu_Animate

|1EA85B| CLC
|1EA85C| ADC.b #$08
|1EA85E| STA.w $0D90,X

|1EA861| LDA.w $0E00,X
|1EA864| BNE .exit

|1EA866| JSR Pirogusu_SpawnSplash
|1EA869| JSR MoveSpriteXY_bank1E
|1EA86C| JSR CheckSpriteTileCollision_bank1E

|1EA86F| AND.b #$0F
|1EA871| BEQ .no_collision

|1EA873| JSL GetRandomNumber
|1EA877| LSR A

|1EA878| LDA.w $0DE0,X
|1EA87B| ROL A
|1EA87C| TAY

|1EA87D| LDA.w SharedDirections_Nice,Y
|1EA880| STA.w $0DE0,X

.no_collision
|1EA883| LDY.w $0DE0,X

|1EA886| LDA.w .speed_x,Y
|1EA889| STA.w $0D50,X

|1EA88C| LDA.w .speed_y,Y
|1EA88F| STA.w $0D40,X

.exit
|1EA892| RTS

;===================================================================================================

pool Pirogusu_SpawnSplash

.offset
|1EA893| db $03, $04, $05, $04

endpool

;---------------------------------------------------------------------------------------------------

Pirogusu_SpawnSplash:
|1EA897| TXA
|1EA898| EOR.b $1A
|1EA89A| AND.b #$03
|1EA89C| BNE .exit

|1EA89E| JSL GetRandomNumber
|1EA8A2| AND.b #$03
|1EA8A4| TAY

|1EA8A5| LDA.w .offset,Y
|1EA8A8| STA.b $00

|1EA8AA| JSL GetRandomNumber
|1EA8AE| AND.b #$03
|1EA8B0| TAY

|1EA8B1| LDA.w .offset,Y
|1EA8B4| STA.b $01

|1EA8B6| PHX
|1EA8B7| TXY

|1EA8B8| LDX.b #$0E

.next_slot
|1EA8BA| LDA.l $7FF800,X
|1EA8BE| BEQ .free_slot

|1EA8C0| DEX
|1EA8C1| BPL .next_slot

|1EA8C3| PLX

.exit
|1EA8C4| RTS

;---------------------------------------------------------------------------------------------------

.free_slot
|1EA8C5| LDA.b #$0B ; GARNISH 0B
|1EA8C7| STA.l $7FF800,X
|1EA8CB| STA.w $0FB4

|1EA8CE| LDA.w $0D10,Y
|1EA8D1| CLC
|1EA8D2| ADC.b $00
|1EA8D4| STA.l $7FF83C,X

|1EA8D8| LDA.w $0D30,Y
|1EA8DB| ADC.b #$00
|1EA8DD| STA.l $7FF878,X

|1EA8E1| LDA.w $0D00,Y
|1EA8E4| CLC
|1EA8E5| ADC.b #$10

|1EA8E7| PHP

|1EA8E8| CLC
|1EA8E9| ADC.b $01
|1EA8EB| STA.l $7FF81E,X

|1EA8EF| LDA.w $0D20,Y
|1EA8F2| ADC.b #$00

|1EA8F4| PLP

|1EA8F5| ADC.b #$00
|1EA8F7| STA.l $7FF85A,X

|1EA8FB| LDA.b #$0F
|1EA8FD| STA.l $7FF90E,X

|1EA901| PLX

|1EA902| RTS

;===================================================================================================

pool SpriteDraw_Pirogusu

.flip
|1EA903| db $00, $80, $40, $00, $00, $00, $00
|1EA90A| db $80, $80, $C0, $40, $40, $00, $40
|1EA911| db $80, $C0, $40, $C0, $00, $80, $00
|1EA918| db $40, $80, $C0, $40, $C0, $00, $80

.anim_step
|1EA91F| db $00, $00, $01, $01, $02, $03, $04
|1EA926| db $03, $02, $03, $04, $03, $05, $05
|1EA92D| db $05, $05, $07, $07, $07, $07, $06
|1EA934| db $06, $06, $06, $08, $08, $08, $08

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Pirogusu:
|1EA93B| LDY.w $0D90,X

|1EA93E| LDA.w $0F50,X
|1EA941| AND.b #$3F
|1EA943| ORA.w .flip,Y
|1EA946| STA.w $0F50,X

|1EA949| LDA.w .anim_step,Y
|1EA94C| STA.w $0DC0,X

|1EA94F| CPY.b #$04
|1EA951| BCS .fully_visible

|1EA953| LDA.w $0FD8
|1EA956| CLC
|1EA957| ADC.b #$04
|1EA959| STA.w $0FD8

|1EA95C| LDA.w $0FD9
|1EA95F| ADC.b #$00
|1EA961| STA.w $0FD9

|1EA964| LDA.w $0FDA
|1EA967| CLC
|1EA968| ADC.b #$04
|1EA96A| STA.w $0FDA

|1EA96D| LDA.w $0FDB
|1EA970| ADC.b #$00
|1EA972| STA.w $0FDB

|1EA975| JSL SpriteDraw_SingleSmall_long

|1EA979| RTS

.fully_visible
|1EA97A| JSL SpriteDraw_SingleLarge_long

|1EA97E| RTS

;===================================================================================================

pool Sprite_93_Bumper

.recoil_speed
|1EA97F| db 0,  2, -2

endpool

;---------------------------------------------------------------------------------------------------

Sprite_93_Bumper:
|1EA982| JSR SpriteDraw_Bumper
|1EA985| JSR CheckIfActive_bank1E
|1EA988| JSR CheckSpriteTileCollision_bank1E

|1EA98B| LDA.b $55
|1EA98D| BNE .dont_boing_link

|1EA98F| JSL CheckDamageToLink_same_layer_long
|1EA993| BCC .dont_boing_link

|1EA995| JSL CancelDash_long

|1EA999| LDA.b #$20
|1EA99B| STA.w $0DF0,X

|1EA99E| LDA.b #$30
|1EA9A0| JSL ProjectSpriteSpeedTowardsLink_long

|1EA9A4| LDA.b $F0
|1EA9A6| LSR A
|1EA9A7| LSR A
|1EA9A8| AND.b #$03
|1EA9AA| TAY

|1EA9AB| LDA.b $00
|1EA9AD| CLC
|1EA9AE| ADC.w .recoil_speed,Y
|1EA9B1| STA.b $27

|1EA9B3| LDA.b $F0
|1EA9B5| AND.b #$03
|1EA9B7| TAY

|1EA9B8| LDA.b $01
|1EA9BA| CLC
|1EA9BB| ADC.w .recoil_speed,Y
|1EA9BE| STA.b $28

|1EA9C0| LDA.b #$14
|1EA9C2| STA.b $46

|1EA9C4| PHX

|1EA9C5| JSL ResetSwimmingState

|1EA9C9| PLX

|1EA9CA| LDA.b #$32 ; SFX3.32
|1EA9CC| JSL QueueSpriteSFX3WithPan

;---------------------------------------------------------------------------------------------------

.dont_boing_link
|1EA9D0| LDY.b #$0F

.next_sprite
|1EA9D2| TYA
|1EA9D3| EOR.b $1A
|1EA9D5| AND.b #$03
|1EA9D7| ORA.w $0F70,Y
|1EA9DA| BNE .dont_boing_sprite

|1EA9DC| LDA.w $0DD0,Y
|1EA9DF| CMP.b #$09
|1EA9E1| BCC .dont_boing_sprite

|1EA9E3| LDA.w $0E60,Y
|1EA9E6| ORA.w $0F60,Y
|1EA9E9| AND.b #$40
|1EA9EB| BNE .dont_boing_sprite

|1EA9ED| LDA.w $0D10,Y
|1EA9F0| STA.b $04

|1EA9F2| LDA.w $0D30,Y
|1EA9F5| STA.b $05

|1EA9F7| LDA.w $0D00,Y
|1EA9FA| STA.b $06

|1EA9FC| LDA.w $0D20,Y
|1EA9FF| STA.b $07

|1EAA01| REP #$20

|1EAA03| LDA.w $0FD8
|1EAA06| SEC
|1EAA07| SBC.b $04
|1EAA09| CLC
|1EAA0A| ADC.w #$0010

|1EAA0D| CMP.w #$0020
|1EAA10| BCS .dont_boing_sprite

|1EAA12| LDA.w $0FDA
|1EAA15| SEC
|1EAA16| SBC.b $06
|1EAA18| CLC
|1EAA19| ADC.w #$0010

|1EAA1C| CMP.w #$0020
|1EAA1F| BCS .dont_boing_sprite

|1EAA21| SEP #$20

|1EAA23| LDA.b #$0F
|1EAA25| STA.w $0EA0,Y

|1EAA28| PHY

|1EAA29| LDA.b #$40
|1EAA2B| JSL ProjectSpriteSpeedTowardsLocation_long

|1EAA2F| PLY

|1EAA30| LDA.b $00
|1EAA32| STA.w $0F30,Y

|1EAA35| LDA.b $01
|1EAA37| STA.w $0F40,Y

|1EAA3A| LDA.b #$20
|1EAA3C| STA.w $0DF0,X

|1EAA3F| LDA.b #$32 ; SFX3.32
|1EAA41| JSL QueueSpriteSFX3WithPan

.dont_boing_sprite
|1EAA45| SEP #$20

|1EAA47| DEY
|1EAA48| BPL .next_sprite

|1EAA4A| RTS

;===================================================================================================

pool SpriteDraw_Bumper

.oam_groups
|1EAA4B| dw  -8,  -8 : db $EC, $00, $00, $02
|1EAA53| dw   8,  -8 : db $EC, $40, $00, $02
|1EAA5B| dw  -8,   8 : db $EC, $80, $00, $02
|1EAA63| dw   8,   8 : db $EC, $C0, $00, $02

|1EAA6B| dw  -7,  -7 : db $EC, $00, $00, $02
|1EAA73| dw   7,  -7 : db $EC, $40, $00, $02
|1EAA7B| dw  -7,   7 : db $EC, $80, $00, $02
|1EAA83| dw   7,   7 : db $EC, $C0, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bumper:
|1EAA8B| LDA.b #$00
|1EAA8D| XBA
|1EAA8E| LDA.w $0DF0,X

|1EAA91| LSR A
|1EAA92| AND.b #$01

|1EAA94| REP #$20

|1EAA96| ASL A
|1EAA97| ASL A
|1EAA98| ASL A
|1EAA99| ASL A
|1EAA9A| ASL A

|1EAA9B| ADC.w #.oam_groups
|1EAA9E| STA.b $08

|1EAAA0| SEP #$20

|1EAAA2| LDA.b #$04
|1EAAA4| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

Sprite_91_StalfosKnight:
|1EAAA7| LDA.w $0D80,X
|1EAAAA| BNE .dropped

|1EAAAC| JSL GetScreenCoordinates_long
|1EAAB0| BRA .continue

.dropped
|1EAAB2| JSR SpriteDraw_StalfosKnight

.continue
|1EAAB5| JSR CheckIfActive_bank1E

|1EAAB8| LDA.w $0EF0,X
|1EAABB| AND.b #$7F
|1EAABD| CMP.b #$01
|1EAABF| BNE .not_collapsed

|1EAAC1| STZ.w $0EF0,X

|1EAAC4| LDA.b #$06
|1EAAC6| STA.w $0D80,X

|1EAAC9| LDA.b #$FF
|1EAACB| STA.w $0DF0,X

|1EAACE| STZ.w $0D50,X
|1EAAD1| STZ.w $0D40,X

|1EAAD4| LDA.b #$02
|1EAAD6| STA.l $7F6918

.not_collapsed
|1EAADA| JSR HandleSpriteRecoil_bank1E

|1EAADD| LDA.w $0D80,X
|1EAAE0| JSL JumpTableLocal
|1EAAE4| dw StalfosKnight_Hidden
|1EAAE6| dw StalfosKnight_EnterBattle
|1EAAE8| dw StalfosKnight_Idle
|1EAAEA| dw StalfosKnight_ScanForOpponents
|1EAAEC| dw StalfosKnight_Squat
|1EAAEE| dw StalfosKnight_HopAround
|1EAAF0| dw StalfosKnight_Crumble
|1EAAF2| dw StalfosKnight_CelebrateStandingUp

;===================================================================================================

StalfosKnight_Hidden:
|1EAAF4| LDA.b #$09
|1EAAF6| STA.w $0F60,X
|1EAAF9| STA.w $0BA0,X

|1EAAFC| LDA.w $0E40,X
|1EAAFF| PHA

|1EAB00| ORA.b #$80
|1EAB02| STA.w $0E40,X

|1EAB05| JSR CheckDamageToLink_bank1E

|1EAB08| PLA
|1EAB09| STA.w $0E40,X

|1EAB0C| BCC .exit

|1EAB0E| LDA.b #$90
|1EAB10| STA.w $0F70,X

|1EAB13| INC.w $0D80,X

|1EAB16| LDA.b #$02
|1EAB18| STA.w $0EB0,X

|1EAB1B| LDA.b #$02
|1EAB1D| STA.w $0DC0,X

|1EAB20| LDA.b #$20 ; SFX2.20
|1EAB22| JSL QueueSpriteSFX2WithPan

.exit
|1EAB26| RTS

;===================================================================================================

StalfosKnight_EnterBattle:
|1EAB27| LDA.w $0F70,X
|1EAB2A| PHA

|1EAB2B| JSR MoveSpriteZ_bank1E

|1EAB2E| LDA.w $0F80,X
|1EAB31| CMP.b #$C0
|1EAB33| BMI .at_max_speed

|1EAB35| SEC
|1EAB36| SBC.b #$03
|1EAB38| STA.w $0F80,X

.at_max_speed
|1EAB3B| PLA
|1EAB3C| EOR.w $0F70,X
|1EAB3F| BPL .exit

|1EAB41| LDA.w $0F70,X
|1EAB44| BPL .exit

;===================================================================================================

#StalfosKnight_EnterIdleState:
|1EAB46| LDA.b #$02
|1EAB48| STA.w $0D80,X

|1EAB4B| STZ.w $0BA0,X
|1EAB4E| STZ.w $0F70,X
|1EAB51| STZ.w $0F80,X

|1EAB54| LDA.b #$3F
|1EAB56| STA.w $0DF0,X

.exit
|1EAB59| RTS

;===================================================================================================

pool StalfosKnight_Idle

.anim_step
|1EAB5A| db $00, $01

endpool

;---------------------------------------------------------------------------------------------------

StalfosKnight_Idle:
|1EAB5C| LDA.b #$00
|1EAB5E| STA.l $7F6918

|1EAB62| JSR CheckDamageToAndFromLink_bank1E

|1EAB65| LDA.w $0DF0,X
|1EAB68| BNE .delay

|1EAB6A| LDA.b #$03
|1EAB6C| STA.w $0D80,X

|1EAB6F| JSL GetRandomNumber
|1EAB73| AND.b #$3F
|1EAB75| STA.w $0DA0,X

|1EAB78| LDA.b #$7F
|1EAB7A| STA.w $0DF0,X

|1EAB7D| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EAB7E| LSR A
|1EAB7F| LSR A
|1EAB80| LSR A
|1EAB81| LSR A
|1EAB82| LSR A

|1EAB83| TAY

|1EAB84| LDA.w .anim_step,Y
|1EAB87| STA.w $0DC0,X

|1EAB8A| LDA.w .anim_step,Y
|1EAB8D| STA.w $0DB0,X

|1EAB90| LDA.b #$02
|1EAB92| STA.w $0EB0,X

|1EAB95| RTS

;===================================================================================================

pool StalfosKnight_ScanForOpponents

.head_direction
|1EAB96| db $00, $00, $00, $02, $01, $01, $01, $02
|1EAB9E| db $00, $00, $00, $02, $01, $01, $01, $02

endpool

;---------------------------------------------------------------------------------------------------

StalfosKnight_ScanForOpponents:
|1EABA6| JSR CheckDamageToAndFromLink_bank1E

|1EABA9| LDA.w $0DF0,X
|1EABAC| CMP.w $0DA0,X
|1EABAF| BNE .delay

|1EABB1| JSR GetXDisplacementFromLink_bank1E
|1EABB4| TYA
|1EABB5| STA.w $0EB0,X

|1EABB8| INC.w $0D80,X

|1EABBB| LDA.b #$20
|1EABBD| STA.w $0DF0,X

|1EABC0| RTS

.delay
|1EABC1| LSR A
|1EABC2| LSR A
|1EABC3| LSR A
|1EABC4| TAY

|1EABC5| LDA.w .head_direction,Y
|1EABC8| STA.w $0EB0,X

|1EABCB| LDA.b #$00
|1EABCD| STA.w $0DB0,X

|1EABD0| LDA.b #$00
|1EABD2| STA.w $0DC0,X

|1EABD5| RTS

;===================================================================================================

StalfosKnight_Squat:
|1EABD6| JSR CheckDamageToAndFromLink_bank1E

|1EABD9| LDA.w $0DF0,X
|1EABDC| BNE StalfosKnight_PrepJump

|1EABDE| INC.w $0D80,X

|1EABE1| LDA.b #$FF
|1EABE3| STA.w $0DF0,X

|1EABE6| LDA.b #$20
|1EABE8| STA.w $0E00,X

;===================================================================================================

StalfosKnight_PrepJump:
|1EABEB| LDA.b #$01
|1EABED| STA.w $0DB0,X

|1EABF0| LDA.b #$01
|1EABF2| STA.w $0DC0,X

|1EABF5| RTS

;===================================================================================================

StalfosKnight_HopAround:
|1EABF6| JSR CheckDamageToAndFromLink_bank1E

|1EABF9| LDA.w $0E00,X
|1EABFC| BEQ .still_jumping

|1EABFE| DEC A
|1EABFF| BNE .dont_change_direction

|1EAC01| LDA.b #$30
|1EAC03| STA.w $0F80,X

|1EAC06| LDA.b #$10
|1EAC08| JSL ApplySpeedTowardsLink_long

|1EAC0C| JSR GetXDisplacementFromLink_bank1E
|1EAC0F| TYA
|1EAC10| STA.w $0EB0,X

|1EAC13| LDA.b #$13 ; SFX3.13
|1EAC15| JSL QueueSpriteSFX3WithPan

.dont_change_direction
|1EAC19| BRA StalfosKnight_PrepJump

;---------------------------------------------------------------------------------------------------

.still_jumping
|1EAC1B| JSR MoveSpriteXYZ_bank1E
|1EAC1E| JSR CheckSpriteTileCollision_bank1E

|1EAC21| LDA.w $0F80,X
|1EAC24| CMP.b #$C0
|1EAC26| BMI .at_max_ascending_speed

|1EAC28| SEC
|1EAC29| SBC.b #$02
|1EAC2B| STA.w $0F80,X

.at_max_ascending_speed
|1EAC2E| LDA.w $0F70,X
|1EAC31| DEC A
|1EAC32| BPL .airborne

|1EAC34| STZ.w $0F70,X
|1EAC37| STZ.w $0F80,X

|1EAC3A| LDA.w $0DF0,X
|1EAC3D| BNE .bounce_again

|1EAC3F| JMP.w StalfosKnight_EnterIdleState

;---------------------------------------------------------------------------------------------------

.bounce_again
|1EAC42| LDA.b #$10
|1EAC44| STA.w $0E00,X

.airborne
|1EAC47| LDY.b #$02

|1EAC49| LDA.w $0F80,X
|1EAC4C| CMP.b #$18
|1EAC4E| BMI .at_max_descending_speed

|1EAC50| LDY.b #$00

.at_max_descending_speed
|1EAC52| TYA
|1EAC53| STA.w $0DC0,X

|1EAC56| RTS

;===================================================================================================

pool StalfosKnight_Crumble

.head_anim
|1EAC57| db $00, $04, $08, $0C, $0E, $0E, $0E, $0E
|1EAC5F| db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
|1EAC67| db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E
|1EAC6F| db $0E, $0E, $0F, $0E, $0C, $08, $04, $00

endpool

;---------------------------------------------------------------------------------------------------

StalfosKnight_Crumble:
|1EAC77| JSR MoveSpriteXYZ_bank1E
|1EAC7A| JSR CheckSpriteTileCollision_bank1E

|1EAC7D| LDA.w $0F80,X
|1EAC80| CMP.b #$C0
|1EAC82| BMI .at_max_speed

|1EAC84| SEC
|1EAC85| SBC.b #$02
|1EAC87| STA.w $0F80,X

.at_max_speed
|1EAC8A| LDA.w $0F70,X
|1EAC8D| DEC A
|1EAC8E| BPL .head_aloft

|1EAC90| STZ.w $0F70,X
|1EAC93| STZ.w $0F80,X

.head_aloft
|1EAC96| LDA.w $0DF0,X
|1EAC99| BNE .still_animating

|1EAC9B| JSL GetRandomNumber
|1EAC9F| AND.b #$01
|1EACA1| BNE .dont_celebrate_its_not_a_big_deal

|1EACA3| LDA.b #$07
|1EACA5| STA.w $0D80,X

|1EACA8| LDA.b #$50
|1EACAA| STA.w $0DF0,X

|1EACAD| RTS

.dont_celebrate_its_not_a_big_deal
|1EACAE| JMP.w StalfosKnight_EnterIdleState

;---------------------------------------------------------------------------------------------------

.still_animating
|1EACB1| CMP.b #$E0
|1EACB3| BCC .no_sfx

|1EACB5| PHA
|1EACB6| AND.b #$03
|1EACB8| BNE .dont_do_sfx

|1EACBA| LDA.b #$14 ; SFX3.14
|1EACBC| JSL QueueSpriteSFX3WithPan

.dont_do_sfx
|1EACC0| PLA

.no_sfx
|1EACC1| LSR A
|1EACC2| LSR A
|1EACC3| LSR A
|1EACC4| TAY

|1EACC5| LDA.w .head_anim,Y
|1EACC8| STA.w $0DB0,X

|1EACCB| LDA.b #$03
|1EACCD| STA.w $0DC0,X

|1EACD0| LDA.b #$02
|1EACD2| STA.w $0EB0,X

|1EACD5| RTS

;===================================================================================================

pool StalfosKnight_CelebrateStandingUp

.anim_state
|1EACD6| db $01, $04

endpool

;---------------------------------------------------------------------------------------------------

StalfosKnight_CelebrateStandingUp:
|1EACD8| LDA.w $0DF0,X
|1EACDB| BNE .still_celebrating

|1EACDD| JMP.w StalfosKnight_EnterIdleState

.still_celebrating
|1EACE0| LSR A
|1EACE1| LSR A
|1EACE2| AND.b #$01
|1EACE4| TAY

|1EACE5| LDA.w .anim_state,Y
|1EACE8| STA.w $0DC0,X

|1EACEB| RTS

;===================================================================================================

pool SpriteDraw_StalfosKnight

.oam_groups
|1EACEC| dw  -4,  -8 : db $64, $00, $00, $00
|1EACF4| dw  -4,   0 : db $61, $00, $00, $02
|1EACFC| dw   4,   0 : db $62, $00, $00, $02
|1EAD04| dw  -3,  16 : db $74, $00, $00, $00
|1EAD0C| dw  11,  16 : db $74, $40, $00, $00

|1EAD14| dw  -4,  -7 : db $64, $00, $00, $00
|1EAD1C| dw  -4,   1 : db $61, $00, $00, $02
|1EAD24| dw   4,   1 : db $62, $00, $00, $02
|1EAD2C| dw  -3,  16 : db $65, $00, $00, $00
|1EAD34| dw  11,  16 : db $65, $40, $00, $00

|1EAD3C| dw  -4,  -8 : db $48, $00, $00, $02
|1EAD44| dw   4,  -8 : db $49, $00, $00, $02
|1EAD4C| dw  -4,   8 : db $4B, $00, $00, $02
|1EAD54| dw   4,   8 : db $4C, $00, $00, $02
|1EAD5C| dw   4,   8 : db $4C, $00, $00, $02

|1EAD64| dw  -4,   8 : db $68, $00, $00, $02
|1EAD6C| dw   4,   8 : db $69, $00, $00, $02
|1EAD74| dw   4,   8 : db $69, $00, $00, $02
|1EAD7C| dw   4,   8 : db $69, $00, $00, $02
|1EAD84| dw   4,   8 : db $69, $00, $00, $02

|1EAD8C| dw  12,  -7 : db $64, $40, $00, $00
|1EAD94| dw  -4,   1 : db $62, $40, $00, $02
|1EAD9C| dw   4,   1 : db $61, $40, $00, $02
|1EADA4| dw  -3,  16 : db $65, $00, $00, $00
|1EADAC| dw  11,  16 : db $65, $40, $00, $00

|1EADB4| dw  12,  -8 : db $64, $40, $00, $00
|1EADBC| dw  -4,   0 : db $62, $40, $00, $02
|1EADC4| dw   4,   0 : db $61, $40, $00, $02
|1EADCC| dw  -3,  16 : db $74, $00, $00, $00
|1EADD4| dw  11,  16 : db $74, $40, $00, $00

|1EADDC| dw  -4,  -8 : db $49, $40, $00, $02
|1EADE4| dw   4,  -8 : db $48, $40, $00, $02
|1EADEC| dw  -4,   8 : db $4C, $40, $00, $02
|1EADF4| dw   4,   8 : db $4B, $40, $00, $02
|1EADFC| dw   4,   8 : db $4B, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosKnight:
|1EAE04| JSR GetScreenCoordinates_bank1E
|1EAE07| JSR SpriteDraw_StalfosKnight_Head

|1EAE0A| LDA.b #$00
|1EAE0C| XBA
|1EAE0D| LDA.w $0DC0,X

|1EAE10| REP #$20

|1EAE12| ASL A
|1EAE13| ASL A
|1EAE14| ASL A
|1EAE15| STA.b $00

|1EAE17| ASL A
|1EAE18| ASL A
|1EAE19| ADC.b $00

|1EAE1B| ADC.w #.oam_groups
|1EAE1E| STA.b $08

|1EAE20| LDA.b $90
|1EAE22| CLC
|1EAE23| ADC.w #$0004
|1EAE26| STA.b $90

|1EAE28| INC.b $92

|1EAE2A| SEP #$20

|1EAE2C| LDA.b #$05
|1EAE2E| JSR TabulatedSpriteDraw_bank1E

|1EAE31| REP #$20

|1EAE33| LDA.b $90
|1EAE35| SEC
|1EAE36| SBC.w #$0004
|1EAE39| STA.b $90

|1EAE3B| DEC.b $92

|1EAE3D| SEP #$20

|1EAE3F| LDA.b #$12
|1EAE41| JSL DrawSpriteShadow_custom_long

|1EAE45| RTS

;===================================================================================================

pool SpriteDraw_StalfosKnight_Head

.head_char
|1EAE46| db $66, $66, $46, $46

.head_flip
|1EAE4A| db $40, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_StalfosKnight_Head:
|1EAE4E| LDA.w $0DC0,X
|1EAE51| CMP.b #$02
|1EAE53| BEQ .head_part_of_body_chars

|1EAE55| LDA.w $0DB0,X
|1EAE58| STA.b $06
|1EAE5A| STZ.b $07

|1EAE5C| LDY.b #$00

|1EAE5E| PHX

|1EAE5F| LDA.w $0EB0,X
|1EAE62| TAX

|1EAE63| REP #$20

|1EAE65| LDA.b $00
|1EAE67| STA.b ($90),Y

|1EAE69| AND.w #$0100
|1EAE6C| STA.b $0E

|1EAE6E| LDA.b $02
|1EAE70| CLC
|1EAE71| ADC.b $06

|1EAE73| SEC
|1EAE74| SBC.w #$000C

|1EAE77| INY
|1EAE78| STA.b ($90),Y

|1EAE7A| CLC
|1EAE7B| ADC.w #$0010

|1EAE7E| CMP.w #$0100
|1EAE81| BCC .on_screen

|1EAE83| LDA.w #$00F0
|1EAE86| STA.b ($90),Y

.on_screen
|1EAE88| SEP #$20

|1EAE8A| LDA.w .head_char,X
|1EAE8D| INY
|1EAE8E| STA.b ($90),Y

|1EAE90| LDA.w .head_flip,X
|1EAE93| INY
|1EAE94| ORA.b $05
|1EAE96| STA.b ($90),Y

|1EAE98| TYA
|1EAE99| LSR A
|1EAE9A| LSR A
|1EAE9B| TAY

|1EAE9C| LDA.b #$02
|1EAE9E| ORA.b $0F
|1EAEA0| STA.b ($92),Y

|1EAEA2| PLX

.head_part_of_body_chars
|1EAEA3| RTS

;===================================================================================================

Sprite_90_Wallmaster:
|1EAEA4| LDA.w $0B89,X
|1EAEA7| ORA.b #$30
|1EAEA9| STA.w $0B89,X

|1EAEAC| JSR SpriteDraw_WallMaster

|1EAEAF| LDA.w $0DD0,X
|1EAEB2| CMP.b #$09
|1EAEB4| BEQ .continue

|1EAEB6| STZ.w $02E4
|1EAEB9| STZ.w $037B

.continue
|1EAEBC| JSR CheckIfActive_bank1E

|1EAEBF| LDA.w $0D90,X
|1EAEC2| BEQ .not_holding_link

|1EAEC4| LDA.w $0D10,X
|1EAEC7| STA.b $22

|1EAEC9| LDA.w $0D30,X
|1EAECC| STA.b $23

|1EAECE| LDA.w $0D00,X
|1EAED1| SEC
|1EAED2| SBC.w $0F70,X
|1EAED5| PHP

|1EAED6| CLC
|1EAED7| ADC.b #$03
|1EAED9| STA.b $20

|1EAEDB| LDA.w $0D20,X
|1EAEDE| ADC.b #$00

|1EAEE0| PLP
|1EAEE1| SBC.b #$00
|1EAEE3| STA.b $21

|1EAEE5| LDA.b #$01
|1EAEE7| STA.w $02E4
|1EAEEA| STA.w $037B

|1EAEED| STZ.b $46
|1EAEEF| STZ.b $28
|1EAEF1| STZ.b $27
|1EAEF3| STZ.b $30
|1EAEF5| STZ.b $31

|1EAEF7| REP #$20

|1EAEF9| LDA.b $20
|1EAEFB| SEC

|1EAEFC| SBC.b $E8
|1EAEFE| SEC

|1EAEFF| SBC.w #$0010
|1EAF02| CMP.w #$0100

|1EAF05| SEP #$20
|1EAF07| BCC .still_rising

|1EAF09| STZ.w $02E4
|1EAF0C| STZ.w $037B

|1EAF0F| PHX

|1EAF10| JSL DragToLastEntrance
|1EAF14| JSL InitializeLink

|1EAF18| PLX

|1EAF19| RTS

;---------------------------------------------------------------------------------------------------

.not_holding_link
|1EAF1A| JSL CheckDamageFromLink_long

.still_rising
|1EAF1E| LDA.w $0D80,X
|1EAF21| JSL JumpTableLocal
|1EAF25| dw Wallmaster_Descend
|1EAF27| dw Wallmaster_Grab
|1EAF29| dw Wallmaster_Ascend

;===================================================================================================

Wallmaster_Descend:
|1EAF2B| LDA.w $0F70,X
|1EAF2E| PHA

|1EAF2F| JSR MoveSpriteZ_bank1E

|1EAF32| LDA.w $0F80,X
|1EAF35| CMP.b #$C0
|1EAF37| BMI .at_max_z_speed

|1EAF39| SEC
|1EAF3A| SBC.b #$03
|1EAF3C| STA.w $0F80,X

.at_max_z_speed
|1EAF3F| PLA
|1EAF40| EOR.w $0F70,X
|1EAF43| BPL .exit

|1EAF45| LDA.w $0F70,X
|1EAF48| BPL .exit

|1EAF4A| INC.w $0D80,X

|1EAF4D| STZ.w $0F70,X
|1EAF50| STZ.w $0F80,X

|1EAF53| LDA.b #$3F
|1EAF55| STA.w $0DF0,X

.exit
|1EAF58| RTS

;===================================================================================================

Wallmaster_Grab:
|1EAF59| LDA.w $0DF0,X
|1EAF5C| BNE .still_grabby

|1EAF5E| INC.w $0D80,X

.still_grabby
|1EAF61| LDY.b #$00

|1EAF63| AND.b #$20
|1EAF65| BNE .anim_step_0

|1EAF67| INY

.anim_step_0
|1EAF68| TYA
|1EAF69| STA.w $0DC0,X

|1EAF6C| JSR CheckDamageToLink_bank1E
|1EAF6F| BCC .exit

|1EAF71| LDA.b #$01
|1EAF73| STA.w $0D90,X

|1EAF76| LDA.b #$40
|1EAF78| STA.w $0E60,X

|1EAF7B| LDA.b #$2A ; SFX3.2A
|1EAF7D| JSL QueueSpriteSFX3WithPan

.exit
|1EAF81| RTS

;===================================================================================================

Wallmaster_Ascend:
|1EAF82| LDA.w $0F70,X
|1EAF85| PHA

|1EAF86| JSR MoveSpriteZ_bank1E

|1EAF89| LDA.w $0F80,X
|1EAF8C| CMP.b #$40
|1EAF8E| BPL .at_max_z_speed

|1EAF90| INC A
|1EAF91| INC A
|1EAF92| STA.w $0F80,X

.at_max_z_speed
|1EAF95| PLA
|1EAF96| EOR.w $0F70,X
|1EAF99| BPL .exit

|1EAF9B| LDA.w $0F70,X
|1EAF9E| BMI .exit

|1EAFA0| STZ.w $0DD0,X

.exit
|1EAFA3| RTS

;===================================================================================================

pool SpriteDraw_WallMaster

.oam_groups
|1EAFA4| dw  -4,   0 : db $A6, $01, $00, $02
|1EAFAC| dw  12,   0 : db $AA, $01, $00, $00
|1EAFB4| dw  -4,  16 : db $BA, $01, $00, $00
|1EAFBC| dw   4,   8 : db $A8, $01, $00, $02

|1EAFC4| dw  -4,   0 : db $AB, $01, $00, $02
|1EAFCC| dw  12,   0 : db $AF, $01, $00, $00
|1EAFD4| dw  -4,  16 : db $BF, $01, $00, $00
|1EAFDC| dw   4,   8 : db $AD, $01, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_WallMaster:
|1EAFE4| LDA.b #$00
|1EAFE6| XBA
|1EAFE7| LDA.w $0DC0,X

|1EAFEA| REP #$20

|1EAFEC| ASL A
|1EAFED| ASL A
|1EAFEE| ASL A
|1EAFEF| ASL A
|1EAFF0| ASL A
|1EAFF1| ADC.w #.oam_groups
|1EAFF4| STA.b $08

|1EAFF6| SEP #$20

|1EAFF8| LDA.b #$04
|1EAFFA| JSR TabulatedSpriteDraw_bank1E

|1EAFFD| JSL SpriteDraw_BigShadow_with_altitude

|1EB001| RTS

;===================================================================================================

Sprite_8F_Blob:
|1EB002| LDA.w $0DD0,X
|1EB005| CMP.b #$09
|1EB007| BNE .skip_tile_collision

|1EB009| LDA.w $0E90,X
|1EB00C| BEQ .skip_tile_collision

|1EB00E| STZ.w $0E90,X

|1EB011| LDA.b #$01
|1EB013| STA.w $0D50,X

|1EB016| JSR CheckSpriteTileCollision_bank1E

|1EB019| STZ.w $0D50,X

|1EB01C| BEQ .dont_die

|1EB01E| STZ.w $0DD0,X

|1EB021| RTS

;---------------------------------------------------------------------------------------------------

.dont_die
|1EB022| LDA.b #$20 ; SFX2.20
|1EB024| JSL QueueSpriteSFX2WithPan

.skip_tile_collision
|1EB028| LDA.w $0DB0,X
|1EB02B| BEQ .normal_priority

|1EB02D| LDA.b #$30
|1EB02F| STA.w $0B89,X

.normal_priority
|1EB032| JSR SpriteDraw_Blob
|1EB035| JSR CheckIfActive_bank1E

|1EB038| LDA.w $0D80,X
|1EB03B| CMP.b #$02
|1EB03D| BCC .hidden

|1EB03F| JSL CheckDamageFromLink_long

.hidden
|1EB043| JSR HandleSpriteRecoil_bank1E

|1EB046| LDA.w $0D80,X
|1EB049| JSL JumpTableLocal
|1EB04D| dw Blob_Hidden
|1EB04F| dw Blob_Peeking
|1EB051| dw Blob_Falling
|1EB053| dw Blob_Active

;===================================================================================================

Blob_Hidden:
|1EB055| LDA.w $0F60,X
|1EB058| PHA

|1EB059| ORA.b #$09
|1EB05B| STA.w $0F60,X

|1EB05E| LDA.w $0E40,X
|1EB061| ORA.b #$80
|1EB063| STA.w $0E40,X

|1EB066| JSR CheckDamageToLink_bank1E

|1EB069| PLA
|1EB06A| STA.w $0F60,X

|1EB06D| BCC .exit

|1EB06F| INC.w $0D80,X

|1EB072| LDA.b #$7F
|1EB074| STA.w $0DF0,X

|1EB077| ASL.w $0E40,X
|1EB07A| LSR.w $0E40,X

|1EB07D| LDA.b $22
|1EB07F| STA.w $0D10,X

|1EB082| LDA.b $23
|1EB084| STA.w $0D30,X

|1EB087| LDA.b $20
|1EB089| CLC
|1EB08A| ADC.b #$08
|1EB08C| STA.w $0D00,X

|1EB08F| LDA.b $21
|1EB091| ADC.b #$00
|1EB093| STA.w $0D20,X

|1EB096| LDA.b #$30
|1EB098| STA.w $0F10,X

|1EB09B| STZ.w $0BA0,X

.exit
|1EB09E| RTS

;===================================================================================================

pool Blob_Peeking

.anim_step
|1EB09F| db $00, $01, $07, $07, $06, $06, $05, $05
|1EB0A7| db $06, $06, $05, $05, $04, $04, $04, $04

endpool

;---------------------------------------------------------------------------------------------------

Blob_Peeking:
|1EB0AF| LDA.w $0DF0,X
|1EB0B2| BNE .delay

|1EB0B4| INC.w $0D80,X

|1EB0B7| LDA.b #$20
|1EB0B9| STA.w $0F80,X

|1EB0BC| LDA.b #$10
|1EB0BE| JSL ApplySpeedTowardsLink_long

|1EB0C2| LDA.b #$30 ; SFX3.30
|1EB0C4| JSL QueueSpriteSFX3WithPan

|1EB0C8| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EB0C9| LSR A
|1EB0CA| LSR A
|1EB0CB| LSR A
|1EB0CC| TAY

|1EB0CD| LDA.w .anim_step,Y
|1EB0D0| STA.w $0DC0,X

|1EB0D3| RTS

;===================================================================================================

pool Blob_Falling

.anim_step
|1EB0D4| db $00, $01

endpool

;---------------------------------------------------------------------------------------------------

Blob_Falling:
|1EB0D6| LDA.w $0DF0,X
|1EB0D9| BEQ .begin_descent

|1EB0DB| DEC A
|1EB0DC| BNE .shake_from_fall

|1EB0DE| LDA.b #$20
|1EB0E0| STA.w $0DF0,X

|1EB0E3| INC.w $0D80,X

|1EB0E6| STZ.w $0DC0,X

|1EB0E9| RTS

.shake_from_fall
|1EB0EA| LSR A
|1EB0EB| LSR A
|1EB0EC| LSR A
|1EB0ED| LSR A
|1EB0EE| TAY

|1EB0EF| LDA.w .anim_step,Y
|1EB0F2| STA.w $0DC0,X

|1EB0F5| LDA.b $1A
|1EB0F7| LSR A
|1EB0F8| AND.b #$01
|1EB0FA| TAY

|1EB0FB| LDA.w .shake_x,Y
|1EB0FE| STA.w $0D50,X

|1EB101| JSR MoveSpriteX_bank1E

|1EB104| RTS

.begin_descent
|1EB105| JSL CheckDamageFromLink_long
|1EB109| JSR MoveSpriteXY_bank1E
|1EB10C| JSR CheckSpriteTileCollision_bank1E

|1EB10F| LDA.w $0F70,X
|1EB112| PHA

|1EB113| JSR MoveSpriteZ_bank1E

|1EB116| LDA.w $0F80,X
|1EB119| CMP.b #$C0
|1EB11B| BMI .at_max_z_speed

|1EB11D| SEC
|1EB11E| SBC.b #$02
|1EB120| STA.w $0F80,X

;---------------------------------------------------------------------------------------------------

.at_max_z_speed
|1EB123| PLA
|1EB124| EOR.w $0F70,X
|1EB127| BPL .exit

|1EB129| LDA.w $0F70,X
|1EB12C| BPL .exit

|1EB12E| STZ.w $0F80,X
|1EB131| STZ.w $0F70,X
|1EB134| STZ.w $0DB0,X

|1EB137| LDA.b #$1F
|1EB139| STA.w $0DF0,X

|1EB13C| LDA.b #$08
|1EB13E| STA.w $0EB0,X

.exit
|1EB141| RTS

;---------------------------------------------------------------------------------------------------

.shake_x
|1EB142| db -8,  8

;===================================================================================================

Blob_Active:
|1EB144| JSR CheckDamageToLink_bank1E

|1EB147| LDA.w $0E00,X
|1EB14A| BNE .dont_turn

|1EB14C| LDA.b #$30
|1EB14E| JSL ApplySpeedTowardsLink_long

|1EB152| JSL GetRandomNumber
|1EB156| AND.b #$3F
|1EB158| ORA.b #$60
|1EB15A| STA.w $0E00,X

|1EB15D| ASL.w $0F50,X
|1EB160| ASL.w $0F50,X

|1EB163| LDA.w $0D50,X
|1EB166| ASL A
|1EB167| ROR.w $0F50,X
|1EB16A| LSR.w $0F50,X

.dont_turn
|1EB16D| LDA.w $0E10,X
|1EB170| BNE .not_aggressive

|1EB172| INC.w $0E80,X

|1EB175| LDA.w $0E80,X
|1EB178| AND.b #$0E
|1EB17A| ORA.w $0E70,X
|1EB17D| BNE .still_aggressive

|1EB17F| JSR MoveSpriteXY_bank1E

|1EB182| INC.w $0ED0,X

|1EB185| LDA.w $0ED0,X
|1EB188| CMP.w $0EB0,X
|1EB18B| BNE .still_aggressive

|1EB18D| STZ.w $0ED0,X

|1EB190| JSL GetRandomNumber
|1EB194| AND.b #$1F
|1EB196| ADC.b #$40
|1EB198| STA.w $0E10,X

|1EB19B| JSL GetRandomNumber
|1EB19F| AND.b #$1F
|1EB1A1| ORA.b #$10
|1EB1A3| STA.w $0EB0,X

.still_aggressive
|1EB1A6| JSR CheckSpriteTileCollision_bank1E

|1EB1A9| LDA.w $0E80,X
|1EB1AC| AND.b #$08
|1EB1AE| LSR A
|1EB1AF| LSR A
|1EB1B0| LSR A
|1EB1B1| STA.w $0DC0,X

|1EB1B4| RTS

.not_aggressive
|1EB1B5| LDY.b #$00

|1EB1B7| AND.b #$10
|1EB1B9| BEQ .anim_step_0

|1EB1BB| INY

.anim_step_0
|1EB1BC| TYA
|1EB1BD| STA.w $0DC0,X

|1EB1C0| RTS

;===================================================================================================

pool SpriteDraw_Blob

.flip
|1EB1C1| db $00, $00, $40, $40

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Blob:
|1EB1C5| LDA.w $0F50,X
|1EB1C8| LSR A
|1EB1C9| BCS .not_quake_blob

|1EB1CB| LDA.w $0FC6
|1EB1CE| CMP.b #$03
|1EB1D0| BCS .bad_gfx

.not_quake_blob
|1EB1D2| LDA.w $0F10,X
|1EB1D5| BEQ .draw_in_front_of_link

|1EB1D7| LDA.b #$08
|1EB1D9| JSL AllocateOAMInRegionB

.draw_in_front_of_link
|1EB1DD| LDA.w $0D80,X
|1EB1E0| BEQ .invisible

|1EB1E2| LDA.w $0DC0,X
|1EB1E5| CMP.b #$04
|1EB1E7| BCS .head_popping_out

;---------------------------------------------------------------------------------------------------

|1EB1E9| PHA

|1EB1EA| TAY

|1EB1EB| LDA.w $0F50,X
|1EB1EE| PHA

|1EB1EF| EOR.w .flip,Y
|1EB1F2| STA.w $0F50,X

|1EB1F5| AND.b #$01
|1EB1F7| EOR.b #$01

|1EB1F9| ASL A
|1EB1FA| ASL A

|1EB1FB| CLC
|1EB1FC| ADC.w $0DC0,X
|1EB1FF| STA.w $0DC0,X

|1EB202| JSL SpriteDraw_SingleLarge_long

|1EB206| PLA
|1EB207| STA.w $0F50,X

|1EB20A| PLA
|1EB20B| STA.w $0DC0,X

|1EB20E| RTS

;---------------------------------------------------------------------------------------------------

.invisible
|1EB20F| JSL GetScreenCoordinates_long

.bad_gfx
|1EB213| RTS

;---------------------------------------------------------------------------------------------------

.oam_groups
|1EB214| dw   0,   8 : db $6C, $03, $00, $00
|1EB21C| dw   8,   8 : db $6D, $03, $00, $00

|1EB224| dw   0,   8 : db $60, $00, $00, $00
|1EB22C| dw   8,   8 : db $70, $00, $00, $00

|1EB234| dw   0,   8 : db $70, $40, $00, $00
|1EB23C| dw   8,   8 : db $60, $40, $00, $00

|1EB244| dw   0,   0 : db $40, $00, $00, $02
|1EB24C| dw   0,   0 : db $40, $00, $00, $02

;---------------------------------------------------------------------------------------------------

.head_popping_out
|1EB254| LDA.b #$00
|1EB256| XBA

|1EB257| LDA.w $0DC0,X
|1EB25A| SEC
|1EB25B| SBC.b #$04

|1EB25D| REP #$20

|1EB25F| ASL A
|1EB260| ASL A
|1EB261| ASL A
|1EB262| ASL A

|1EB263| ADC.w #.oam_groups
|1EB266| STA.b $08

|1EB268| SEP #$20

|1EB26A| LDA.b #$02
|1EB26C| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

Sprite_8E_Terrorpin:
|1EB26F| JSL SpriteDraw_SingleLarge_long
|1EB273| JSR CheckSpriteTileCollision_bank1E
|1EB276| JSR CheckIfActive_bank1E
|1EB279| JSR HandleSpriteRecoil_bank1E

|1EB27C| LDA.w $0E10,X
|1EB27F| BNE .invulnerable

|1EB281| JSL CheckDamageFromLink_long

.invulnerable
|1EB285| JSR Terrorpin_CheckForHammer
|1EB288| JSR MoveSpriteXYZ_bank1E

|1EB28B| LDA.w $0DA0,X
|1EB28E| JSL JumpTableLocal
|1EB292| dw Terrorpin_RightsideUp
|1EB294| dw Terrorpin_UpsideDown

|1EB296| RTS

;===================================================================================================

pool Terrorpin_RightsideUp

.speed_x
|1EB297| db   8,  -8,   0,   0
|1EB29B| db  12, -12,   0,   0

.speed_y
|1EB29F| db   0,   0,   8,  -8
|1EB2A3| db   0,   0,  12, -12

endpool

;---------------------------------------------------------------------------------------------------

Terrorpin_RightsideUp:
|1EB2A7| LDA.w $0F10,X
|1EB2AA| BNE .dont_turn

|1EB2AC| JSL GetRandomNumber
|1EB2B0| AND.b #$1F
|1EB2B2| ADC.b #$20
|1EB2B4| STA.w $0F10,X

|1EB2B7| AND.b #$03
|1EB2B9| STA.w $0DE0,X

|1EB2BC| AND.b #$30
|1EB2BE| BNE .dont_turn

|1EB2C0| JSR GetDirectionTowardsLink_bank1E
|1EB2C3| TYA
|1EB2C4| STA.w $0DE0,X

.dont_turn
|1EB2C7| LDA.w $0DE0,X
|1EB2CA| CLC
|1EB2CB| ADC.w $0ED0,X
|1EB2CE| TAY

|1EB2CF| LDA.w .speed_x,Y
|1EB2D2| STA.w $0D50,X

|1EB2D5| LDA.w .speed_y,Y
|1EB2D8| STA.w $0D40,X

|1EB2DB| LDA.w $0F80,X
|1EB2DE| DEC A
|1EB2DF| DEC A
|1EB2E0| STA.w $0F80,X

|1EB2E3| LDA.w $0F70,X
|1EB2E6| BPL .airborne

|1EB2E8| STZ.w $0F70,X
|1EB2EB| STZ.w $0F80,X

.airborne
|1EB2EE| LDA.b $1A
|1EB2F0| LDY.w $0ED0,X
|1EB2F3| BNE .move_faster

|1EB2F5| LSR A

.move_faster
|1EB2F6| LSR A
|1EB2F7| LSR A
|1EB2F8| AND.b #$01
|1EB2FA| STA.w $0DC0,X

|1EB2FD| LDA.w $0E60,X
|1EB300| ORA.b #$40
|1EB302| STA.w $0E60,X

|1EB305| LDA.b #$04
|1EB307| STA.w $0CAA,X

|1EB30A| JSR CheckDamageToLink_bank1E

|1EB30D| RTS

;===================================================================================================

Terrorpin_UpsideDown:
|1EB30E| LDA.w $0E60,X
|1EB311| AND.b #$BF
|1EB313| STA.w $0E60,X

|1EB316| STZ.w $0CAA,X

|1EB319| LDA.w $0F10,X
|1EB31C| BNE .delay

|1EB31E| STZ.w $0DA0,X

|1EB321| LDA.b #$20
|1EB323| STA.w $0F80,X

|1EB326| LDA.b #$40
|1EB328| STA.w $0F10,X

|1EB32B| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EB32C| LDA.w $0F80,X
|1EB32F| DEC A
|1EB330| DEC A
|1EB331| STA.w $0F80,X

|1EB334| LDA.w $0F70,X
|1EB337| BPL .dont_reset_y_speed

|1EB339| STZ.w $0F70,X

|1EB33C| LDA.w $0F80,X
|1EB33F| EOR.b #$FF
|1EB341| INC A
|1EB342| LSR A

|1EB343| CMP.b #$09
|1EB345| BCS .airborne

|1EB347| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.airborne
|1EB349| STA.w $0F80,X

|1EB34C| LDA.w $0D50,X
|1EB34F| ASL A
|1EB350| ROR.w $0D50,X

|1EB353| LDA.w $0D50,X
|1EB356| CMP.b #$FF
|1EB358| BNE .dont_reset_x_speed

|1EB35A| STZ.w $0D50,X

;---------------------------------------------------------------------------------------------------

.dont_reset_x_speed
|1EB35D| LDA.w $0D40,X
|1EB360| ASL A
|1EB361| ROR.w $0D40,X

|1EB364| LDA.w $0D40,X
|1EB367| CMP.b #$FF
|1EB369| BNE .dont_reset_y_speed

|1EB36B| STZ.w $0D40,X

;---------------------------------------------------------------------------------------------------

.dont_reset_y_speed
|1EB36E| LDA.w $0F10,X
|1EB371| CMP.b #$40
|1EB373| BCS .not_struggling

|1EB375| LSR A
|1EB376| AND.b #$01
|1EB378| TAY

|1EB379| LDA.w .shake,Y
|1EB37C| STA.w $0D50,X

|1EB37F| INC.w $0E80,X

;---------------------------------------------------------------------------------------------------

.not_struggling
|1EB382| INC.w $0E80,X

|1EB385| LDA.w $0E80,X
|1EB388| LSR A
|1EB389| LSR A
|1EB38A| LSR A

|1EB38B| AND.b #$01
|1EB38D| TAY

|1EB38E| LDA.b #$02
|1EB390| STA.w $0DC0,X

|1EB393| LDA.w $0F50,X
|1EB396| AND.b #$BF
|1EB398| ORA.w .flip,Y
|1EB39B| STA.w $0F50,X

|1EB39E| RTS

;---------------------------------------------------------------------------------------------------

.flip
|1EB39F| db $00, $40

.shake
|1EB3A1| db   8,  -8

;===================================================================================================

Terrorpin_CheckForHammer:
|1EB3A3| LDA.w $0F70,X
|1EB3A6| ORA.w $0E10,X
|1EB3A9| BNE .nohit

|1EB3AB| LDA.b $EE
|1EB3AD| CMP.w $0F20,X
|1EB3B0| BNE .nohit

|1EB3B2| LDA.w $0044
|1EB3B5| CMP.b #$80
|1EB3B7| BEQ .nohit

|1EB3B9| LDA.w $0301
|1EB3BC| AND.b #$0A
|1EB3BE| BEQ .nohit

|1EB3C0| JSL SetupActionHitbox_long
|1EB3C4| JSR Terrorpin_SetUpHammerHitbox
|1EB3C7| JSL CheckIfHitboxesOverlap_long
|1EB3CB| BCC .nohit

|1EB3CD| LDA.w $0D50,X
|1EB3D0| EOR.b #$FF
|1EB3D2| INC A
|1EB3D3| STA.w $0D50,X

|1EB3D6| LDA.w $0D40,X
|1EB3D9| EOR.b #$FF
|1EB3DB| INC A
|1EB3DC| STA.w $0D40,X

|1EB3DF| LDA.b #$20
|1EB3E1| STA.w $0E10,X

|1EB3E4| LDA.b #$20
|1EB3E6| STA.w $0F80,X

|1EB3E9| LDA.b #$04
|1EB3EB| STA.w $0ED0,X

|1EB3EE| LDA.w $0DA0,X
|1EB3F1| EOR.b #$01
|1EB3F3| STA.w $0DA0,X

|1EB3F6| CMP.b #$01

|1EB3F8| LDA.b #$FF
|1EB3FA| BCS .nonzerodao

|1EB3FC| LDA.b #$40

.nonzerodao
|1EB3FE| STA.w $0F10,X

.nohit
|1EB401| STZ.w $0EB0,X

|1EB404| RTS

;===================================================================================================

Terrorpin_SetUpHammerHitbox:
|1EB405| LDA.w $0D10,X
|1EB408| SEC
|1EB409| SBC.b #$10
|1EB40B| STA.b $04

|1EB40D| LDA.w $0D30,X
|1EB410| SBC.b #$00
|1EB412| STA.b $0A

|1EB414| LDA.w $0D00,X
|1EB417| SEC
|1EB418| SBC.b #$10
|1EB41A| STA.b $05

|1EB41C| LDA.w $0D20,X
|1EB41F| SBC.b #$00
|1EB421| STA.b $0B

|1EB423| LDA.b #$30
|1EB425| STA.b $06
|1EB427| STA.b $07

|1EB429| RTS

;===================================================================================================

pool Sprite_8C_Arrghus

.anim_step
|1EB42A| db $01, $01, $01, $02, $02, $01, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_8C_Arrghus:
|1EB433| LDA.w $0B89,X
|1EB436| ORA.b #$30
|1EB438| STA.w $0B89,X

|1EB43B| JSR SpriteDraw_Arrghus

|1EB43E| LDA.w $0DD0,X
|1EB441| CMP.b #$09
|1EB443| BNE .dying

|1EB445| LDA.w $0F70,X
|1EB448| CMP.b #$60
|1EB44A| BCS .airborne

.dying
|1EB44C| JSR CheckIfActive_bank1E

;---------------------------------------------------------------------------------------------------

.airborne
|1EB44F| JSR ControlArrghi

|1EB452| LDA.b #$01
|1EB454| STA.w $0B0C

|1EB457| LDA.w $0EF0,X
|1EB45A| AND.b #$7F
|1EB45C| CMP.b #$02
|1EB45E| BNE .dont_jump

|1EB460| JSR Arrghus_BOING

|1EB463| LDA.b #$40
|1EB465| STA.w $0E60,X

.dont_jump
|1EB468| JSR HandleSpriteRecoil_bank1E
|1EB46B| JSR CheckDamageToLink_bank1E

|1EB46E| LDA.w $0E80,X
|1EB471| INC.w $0E80,X
|1EB474| AND.b #$03
|1EB476| BNE .dont_tick_step

|1EB478| INC.w $0ED0,X

|1EB47B| LDA.w $0ED0,X
|1EB47E| CMP.b #$09
|1EB480| BNE .dont_reset_step

|1EB482| STZ.w $0ED0,X

.dont_reset_step
|1EB485| LDY.w $0ED0,X

|1EB488| LDA.w .anim_step,Y
|1EB48B| STA.w $0DC0,X

;---------------------------------------------------------------------------------------------------

.dont_tick_step
|1EB48E| JSR CheckSpriteTileCollision_bank1E
|1EB491| BEQ .handle_ai

|1EB493| LDY.w $0D80,X
|1EB496| CPY.b #$05
|1EB498| BNE .stop_moving

|1EB49A| AND.b #$03
|1EB49C| BEQ .invert_y_speed

.invert_x_speed
|1EB49E| LDA.w $0D50,X
|1EB4A1| EOR.b #$FF
|1EB4A3| INC A
|1EB4A4| STA.w $0D50,X

|1EB4A7| BRA .handle_ai

.invert_y_speed
|1EB4A9| LDA.w $0D40,X
|1EB4AC| EOR.b #$FF
|1EB4AE| INC A
|1EB4AF| STA.w $0D40,X

|1EB4B2| BRA .handle_ai

;---------------------------------------------------------------------------------------------------

.stop_moving
|1EB4B4| JSR ZeroVelocityXY_bank1E

.handle_ai
|1EB4B7| LDA.w $0D80,X
|1EB4BA| JSL JumpTableLocal
|1EB4BE| dw Arrghus_Move
|1EB4C0| dw Arrghus_MakeDecision
|1EB4C2| dw Arrghus_PuffAttack
|1EB4C4| dw Arrghus_JumpUp
|1EB4C6| dw Arrghus_SmashDown
|1EB4C8| dw Arrghus_PingPong

;===================================================================================================

Arrghus_JumpUp:
|1EB4CA| LDA.b #$78
|1EB4CC| STA.w $0F80,X

|1EB4CF| JSR MoveSpriteZ_bank1E

|1EB4D2| LDA.w $0F70,X
|1EB4D5| CMP.b #$E0
|1EB4D7| BCC .at_max_z_speed

|1EB4D9| LDA.b #$40
|1EB4DB| STA.w $0DF0,X

|1EB4DE| INC.w $0D80,X

|1EB4E1| STZ.w $0F80,X

|1EB4E4| LDA.b $22
|1EB4E6| STA.w $0D10,X

|1EB4E9| LDA.b $20
|1EB4EB| STA.w $0D00,X

.at_max_z_speed
|1EB4EE| RTS

;===================================================================================================

Arrghus_SmashDown:
|1EB4EF| LDA.w $0DF0,X
|1EB4F2| BNE .descending

|1EB4F4| LDA.b #$90
|1EB4F6| STA.w $0F80,X

|1EB4F9| LDA.w $0F70,X
|1EB4FC| PHA

|1EB4FD| JSR MoveSpriteZ_bank1E

|1EB500| PLA
|1EB501| EOR.w $0F70,X
|1EB504| BPL .descending

|1EB506| LDA.w $0F70,X
|1EB509| BPL .descending

|1EB50B| STZ.w $0F70,X

|1EB50E| JSL Arrghus_SpawnSplash

|1EB512| INC.w $0D80,X

|1EB515| LDA.b #$20
|1EB517| STA.w $0DF0,X

|1EB51A| LDA.b #$03 ; SFX3.03
|1EB51C| JSL QueueSpriteSFX3WithPan

|1EB520| LDA.b #$20
|1EB522| STA.w $0D50,X
|1EB525| STA.w $0D40,X

.descending
|1EB528| DEC A
|1EB529| BNE .exit

|1EB52B| LDA.b #$20 ; SFX2.20
|1EB52D| JSL QueueSpriteSFX2WithPan

.exit
|1EB531| RTS

;===================================================================================================

Arrghus_PingPong:
|1EB532| LDA.w $0DF0,X
|1EB535| BNE .exit

|1EB537| STZ.w $0E60,X

|1EB53A| JSR MoveSpriteXY_bank1E
|1EB53D| JSL CheckDamageFromLink_long

|1EB541| LDA.b $1A
|1EB543| AND.b #$07
|1EB545| BNE .exit

|1EB547| LDA.b #$28 ; SFX2.28
|1EB549| JSL QueueSpriteSFX2WithPan

|1EB54D| PHX

|1EB54E| TXY
|1EB54F| LDX.b #$1D

|1EB551| LDA.w $0D40,Y
|1EB554| BMI .next_slot

|1EB556| LDX.b #$0E

.next_slot
|1EB558| LDA.l $7FF800,X
|1EB55C| BNE .slot_occupied

|1EB55E| LDA.b #$15 ; GARNISH 15
|1EB560| STA.l $7FF800,X
|1EB564| STA.w $0FB4

|1EB567| LDA.w $0D10,Y
|1EB56A| STA.l $7FF83C,X

|1EB56E| LDA.w $0D30,Y
|1EB571| STA.l $7FF878,X

|1EB575| LDA.w $0D00,Y
|1EB578| CLC
|1EB579| ADC.b #$18
|1EB57B| STA.l $7FF81E,X

|1EB57F| LDA.w $0D20,Y
|1EB582| STA.l $7FF85A,X

|1EB586| LDA.b #$0F
|1EB588| STA.l $7FF90E,X

|1EB58C| PLX

|1EB58D| RTS

;---------------------------------------------------------------------------------------------------

.slot_occupied
|1EB58E| DEX
|1EB58F| BPL .next_slot

|1EB591| PLX

.exit
|1EB592| RTS

;===================================================================================================

Arrghus_Move:
|1EB593| LDA.w $0DF0,X
|1EB596| BNE .delay

|1EB598| INC.w $0D80,X

|1EB59B| LDA.b #$30
|1EB59D| STA.w $0DF0,X

.delay
|1EB5A0| JSR MoveSpriteXY_bank1E

|1EB5A3| LDA.w $0D50,X
|1EB5A6| CMP.w $0EB0,X
|1EB5A9| BEQ .check_y_speed
|1EB5AB| BPL .x_too_high

|1EB5AD| INC.w $0D50,X
|1EB5B0| BRA .check_y_speed

.x_too_high
|1EB5B2| DEC.w $0D50,X

.check_y_speed
|1EB5B5| LDA.w $0D40,X
|1EB5B8| CMP.w $0DE0,X
|1EB5BB| BEQ .exit
|1EB5BD| BPL .y_too_high

|1EB5BF| INC.w $0D40,X
|1EB5C2| BRA .exit

.y_too_high
|1EB5C4| DEC.w $0D40,X

.exit
|1EB5C7| RTS

;===================================================================================================

Arrghus_MakeDecision:
|1EB5C8| LDA.w $0DF0,X
|1EB5CB| BNE Arrghus_Decelerate

|1EB5CD| STZ.w $0D80,X

|1EB5D0| JSL CheckIfScreenIsClear
|1EB5D4| BCS Arrghus_BOING

|1EB5D6| INC.w $0B0B

|1EB5D9| LDA.w $0B0B
|1EB5DC| CMP.b #$04
|1EB5DE| BNE Arrghus_TargetLink

|1EB5E0| STZ.w $0B0B

|1EB5E3| LDA.b #$02
|1EB5E5| STA.w $0D80,X

|1EB5E8| LDA.b #$B0
|1EB5EA| STA.w $0DF0,X

|1EB5ED| RTS

;===================================================================================================

Arrghus_BOING:
|1EB5EE| LDA.b #$03
|1EB5F0| STA.w $0D80,X

|1EB5F3| LDA.b #$32 ; SFX3.32
|1EB5F5| JSL QueueSpriteSFX3WithPan

|1EB5F9| STZ.w $0E80,X

|1EB5FC| RTS

;===================================================================================================

Arrghus_TargetLink:
|1EB5FD| JSL GetRandomNumber
|1EB601| AND.b #$3F
|1EB603| ADC.b #$30
|1EB605| STA.w $0DF0,X

|1EB608| AND.b #$03
|1EB60A| ADC.b #$08
|1EB60C| JSL ProjectSpriteSpeedTowardsLink_long

|1EB610| LDA.b $00
|1EB612| STA.w $0DE0,X

|1EB615| LDA.b $01
|1EB617| STA.w $0EB0,X

|1EB61A| RTS

;===================================================================================================

Arrghus_Decelerate:
|1EB61B| JSR MoveSpriteXY_bank1E

|1EB61E| LDA.w $0D50,X
|1EB621| BEQ .check_y_speed
|1EB623| BPL .x_positive

|1EB625| INC.w $0D50,X
|1EB628| BRA .check_y_speed

.x_positive
|1EB62A| DEC.w $0D50,X

.check_y_speed
|1EB62D| LDA.w $0D40,X
|1EB630| BEQ .exit
|1EB632| BPL .y_positive

|1EB634| INC.w $0D40,X
|1EB637| BRA .exit

.y_positive
|1EB639| DEC.w $0D40,X

.exit
|1EB63C| RTS

;===================================================================================================

Arrghus_PuffAttack:
|1EB63D| LDA.b #$08
|1EB63F| STA.w $0B0C

|1EB642| LDA.w $0DF0,X
|1EB645| CMP.b #$20
|1EB647| BCC .shrink

|1EB649| CMP.b #$60
|1EB64B| BCS .hold

.grow
|1EB64D| INC.w $0B0A

|1EB650| RTS

.shrink
|1EB651| DEC.w $0B0A
|1EB654| BMI .attack_over

|1EB656| RTS

;---------------------------------------------------------------------------------------------------

.hold
|1EB657| BNE .not_about_to_shrink

|1EB659| LDA.b #$26 ; SFX3.26
|1EB65B| BRA .play_sfx

.not_about_to_shrink
|1EB65D| AND.b #$0F
|1EB65F| BNE .no_sfx

|1EB661| LDA.b #$06 ; SFX3.06

.play_sfx
|1EB663| JSL QueueSpriteSFX3WithPan

.no_sfx
|1EB667| RTS

;---------------------------------------------------------------------------------------------------

.attack_over
|1EB668| STZ.w $0B0A

|1EB66B| DEC.w $0D80,X

|1EB66E| LDA.b #$70
|1EB670| STA.w $0DF0,X

|1EB673| RTS

;===================================================================================================

pool ControlArrghi

.angle_offset
|1EB674| dw $0000, $0040, $0080, $00C0, $0100, $0140, $0180, $01C0
|1EB684| dw $0000, $0066, $00CC, $0132, $0198

.angle_mask
|1EB68E| dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
|1EB69E| dw $01FF, $01FF, $01FF, $01FF, $01FF

.pinch
|1EB6A8| db $14, $14, $14, $14, $14, $14, $14, $14
|1EB6B0| db $0C, $0C, $0C, $0C, $0C

.some_offset
|1EB6B5| db $00, $FF, $FE, $FD, $FC, $FB, $FA, $FA, $FB, $FC, $FD, $FE, $FF
|1EB6C2| db $00, $FF, $FE, $FD, $FC, $FB, $FA, $FA, $FB, $FC, $FD, $FE, $FF
|1EB6CF| db $00, $FF, $FE, $FD, $FC, $FB, $FA, $FA, $FB, $FC, $FD, $FE, $FF
|1EB6DC| db $00, $FF, $FE, $FD, $FC, $FB, $FA, $FA, $FB, $FC, $FD, $FE, $FF

endpool

;---------------------------------------------------------------------------------------------------

ControlArrghi:
|1EB6E9| LDA.w $0B08
|1EB6EC| CLC
|1EB6ED| ADC.w $0B0C
|1EB6F0| STA.w $0B08

|1EB6F3| LDA.w $0B09
|1EB6F6| ADC.b #$00
|1EB6F8| STA.w $0B09

|1EB6FB| LDA.b $1A
|1EB6FD| AND.b #$03
|1EB6FF| BNE .check_offset_y

|1EB701| INC.w $0D90,X

|1EB704| LDA.w $0D90,X
|1EB707| CMP.b #$0D
|1EB709| BNE .check_offset_y

|1EB70B| STZ.w $0D90,X

.check_offset_y
|1EB70E| LDA.b $1A
|1EB710| AND.b #$07
|1EB712| BNE .start_puffs

|1EB714| INC.w $0DA0,X

|1EB717| LDA.w $0DA0,X
|1EB71A| CMP.b #$0D
|1EB71C| BNE .start_puffs

|1EB71E| STZ.w $0DA0,X

;---------------------------------------------------------------------------------------------------

.start_puffs
|1EB721| STZ.w $0FB5

.next_puff
|1EB724| LDA.w $0FB5
|1EB727| PHA

|1EB728| ASL A
|1EB729| TAY

|1EB72A| REP #$20

|1EB72C| LDA.w $0B08
|1EB72F| CLC
|1EB730| ADC.w .angle_offset,Y
|1EB733| EOR.w .angle_mask,Y
|1EB736| STA.b $00

|1EB738| SEP #$20

|1EB73A| PLY

|1EB73B| LDA.w $0B0A
|1EB73E| CLC
|1EB73F| ADC.w .pinch,Y
|1EB742| STA.b $0E
|1EB744| STA.b $0F

|1EB746| LDA.w $0FB5
|1EB749| STA.b $02

|1EB74B| LDA.w $0D90,X
|1EB74E| CLC
|1EB74F| ADC.b $02
|1EB751| TAY

|1EB752| LDA.b $0F
|1EB754| CLC
|1EB755| ADC.w .some_offset,Y
|1EB758| STA.b $0F

|1EB75A| LDA.w $0DA0,X
|1EB75D| CLC
|1EB75E| ADC.b $02
|1EB760| TAY

|1EB761| LDA.b $0E
|1EB763| CLC
|1EB764| ADC.w .some_offset,Y
|1EB767| STA.b $0E

|1EB769| PHX
|1EB76A| REP #$30

|1EB76C| LDA.b $00
|1EB76E| AND.w #$00FF
|1EB771| ASL A
|1EB772| TAX

|1EB773| LDA.l TrigTable,X
|1EB777| STA.b $04

|1EB779| LDA.b $00
|1EB77B| CLC
|1EB77C| ADC.w #$0080
|1EB77F| STA.b $02

|1EB781| AND.w #$00FF
|1EB784| ASL A
|1EB785| TAX

|1EB786| LDA.l TrigTable,X
|1EB78A| STA.b $06

|1EB78C| SEP #$30

|1EB78E| PLX

|1EB78F| LDA.b $04
|1EB791| STA.w WRMPYA

|1EB794| LDA.b $0F

|1EB796| LDY.b $05
|1EB798| BNE .nonzero_a

|1EB79A| STA.w WRMPYB

|1EB79D| JSR NOP8

|1EB7A0| ASL.w RDMPYL
|1EB7A3| LDA.w RDMPYH
|1EB7A6| ADC.b #$00

.nonzero_a
|1EB7A8| LSR.b $01
|1EB7AA| BCC .dont_invert_a

|1EB7AC| EOR.b #$FF
|1EB7AE| INC A

.dont_invert_a
|1EB7AF| STZ.b $0A

|1EB7B1| CMP.b #$00
|1EB7B3| BPL .positive_a

|1EB7B5| DEC.b $0A

.positive_a
|1EB7B7| CLC
|1EB7B8| ADC.w $0D10,X

|1EB7BB| LDY.w $0FB5
|1EB7BE| STA.w $0B10,Y

|1EB7C1| LDA.w $0D30,X
|1EB7C4| ADC.b $0A
|1EB7C6| STA.w $0B20,Y

|1EB7C9| LDA.b $06
|1EB7CB| STA.w WRMPYA

|1EB7CE| LDA.b $0E

|1EB7D0| LDY.b $07
|1EB7D2| BNE .nonzero_b

|1EB7D4| STA.w WRMPYB

|1EB7D7| JSR NOP8

|1EB7DA| ASL.w RDMPYL
|1EB7DD| LDA.w RDMPYH
|1EB7E0| ADC.b #$00

.nonzero_b
|1EB7E2| LSR.b $03
|1EB7E4| BCC .dont_invert_b

|1EB7E6| EOR.b #$FF
|1EB7E8| INC A

.dont_invert_b
|1EB7E9| STZ.b $0A

|1EB7EB| CMP.b #$00
|1EB7ED| BPL .positive_b

|1EB7EF| DEC.b $0A

.positive_b
|1EB7F1| CLC
|1EB7F2| ADC.w $0D00,X
|1EB7F5| PHP

|1EB7F6| SEC
|1EB7F7| SBC.b #$10

|1EB7F9| LDY.w $0FB5
|1EB7FC| STA.w $0B30,Y

|1EB7FF| LDA.w $0D20,X
|1EB802| SBC.b #$00

|1EB804| PLP
|1EB805| ADC.b $0A
|1EB807| STA.w $0B40,Y

|1EB80A| INC.w $0FB5

|1EB80D| LDA.w $0FB5
|1EB810| CMP.b #$0D
|1EB812| BEQ .exit

|1EB814| JMP.w .next_puff

.exit
|1EB817| RTS

;===================================================================================================

pool SpriteDraw_Arrghus

.oam_groups
|1EB818| dw  -8,  -4 : db $80, $00, $00, $02
|1EB820| dw   8,  -4 : db $80, $40, $00, $02
|1EB828| dw  -8,  12 : db $A0, $00, $00, $02
|1EB830| dw   8,  12 : db $A0, $40, $00, $02
|1EB838| dw   0,  24 : db $A8, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Arrghus:
|1EB840| REP #$20

|1EB842| LDA.w #.oam_groups
|1EB845| STA.b $08

|1EB847| SEP #$20

|1EB849| LDA.b #$05
|1EB84B| JSR TabulatedSpriteDraw_bank1E

|1EB84E| LDA.w $0DC0,X
|1EB851| ASL A
|1EB852| STA.b $00

;---------------------------------------------------------------------------------------------------

|1EB854| LDY.b #$02

.adjust_next_object
|1EB856| LDA.b ($90),Y
|1EB858| CLC
|1EB859| ADC.b $00
|1EB85B| STA.b ($90),Y

|1EB85D| INY
|1EB85E| INY
|1EB85F| INY
|1EB860| INY

|1EB861| CPY.b #$12
|1EB863| BCC .adjust_next_object

|1EB865| LDA.w $0D80,X
|1EB868| CMP.b #$05
|1EB86A| BNE .not_pingponging

|1EB86C| LDY.b #$11
|1EB86E| LDA.b #$F0
|1EB870| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.not_pingponging
|1EB872| LDA.w $0E80,X
|1EB875| AND.b #$08
|1EB877| BEQ .dont_flip_tentacles

|1EB879| LDY.b #$13

|1EB87B| LDA.b ($90),Y
|1EB87D| ORA.b #$40
|1EB87F| STA.b ($90),Y

.dont_flip_tentacles
|1EB881| LDA.w $0D80,X
|1EB884| CMP.b #$05
|1EB886| BEQ .draw_wake

|1EB888| REP #$20

|1EB88A| LDA.b $90
|1EB88C| CLC
|1EB88D| ADC.w #$0004
|1EB890| STA.b $90

|1EB892| INC.b $92

|1EB894| SEP #$20

|1EB896| LDA.w $0F70,X

|1EB899| CMP.b #$A0
|1EB89B| BCS .exit

|1EB89D| LDA.w $0F50,X
|1EB8A0| PHA

|1EB8A1| AND.b #$FE
|1EB8A3| STA.w $0F50,X

|1EB8A6| JSL SpriteDraw_BigShadow

|1EB8AA| PLA
|1EB8AB| STA.w $0F50,X

.exit
|1EB8AE| RTS

;---------------------------------------------------------------------------------------------------

.draw_wake
|1EB8AF| JSL SpriteDraw_ArrghusWake

|1EB8B3| RTS

;===================================================================================================

ControlArrghi_long:
|1EB8B4| PHB
|1EB8B5| PHK
|1EB8B6| PLB

|1EB8B7| JSR ControlArrghi

|1EB8BA| PLB

|1EB8BB| RTL

;===================================================================================================

pool Sprite_8D_Arrghi

.anim_step
|1EB8BC| db $00, $01, $02, $02, $02, $02, $02, $01

endpool

;---------------------------------------------------------------------------------------------------

Sprite_8D_Arrghi:
|1EB8C4| LDA.w $0B89,X
|1EB8C7| ORA.b #$30
|1EB8C9| STA.w $0B89,X

|1EB8CC| JSL SpriteDraw_SingleLarge_long
|1EB8D0| JSR CheckIfActive_bank1E

|1EB8D3| INC.w $0E80,X

|1EB8D6| LDA.w $0E80,X
|1EB8D9| LSR A
|1EB8DA| LSR A
|1EB8DB| LSR A
|1EB8DC| AND.b #$07
|1EB8DE| TAY

|1EB8DF| LDA.w .anim_step,Y
|1EB8E2| STA.w $0DC0,X

|1EB8E5| LDA.w $0DA0,X
|1EB8E8| BEQ .not_dragged

|1EB8EA| TAY
|1EB8EB| DEY

|1EB8EC| LDA.w $0C4A,Y
|1EB8EF| BEQ .stop_drag

|1EB8F1| LDA.w $0C04,Y
|1EB8F4| STA.w $0D10,X

|1EB8F7| LDA.w $0C18,Y
|1EB8FA| STA.w $0D30,X

|1EB8FD| LDA.w $0BFA,Y
|1EB900| STA.w $0D00,X

|1EB903| LDA.w $0C0E,Y
|1EB906| STA.w $0D20,X

|1EB909| LDA.b #$05
|1EB90B| STA.w $0F50,X

|1EB90E| LDA.w $0E60,X
|1EB911| AND.b #$BF
|1EB913| STA.w $0E60,X

|1EB916| RTS

.stop_drag
|1EB917| LDA.b #$01
|1EB919| STA.w $0D80,X

|1EB91C| STZ.w $0DA0,X

|1EB91F| LDA.b #$20
|1EB921| STA.w $0DF0,X

.not_dragged
|1EB924| LDA.w $0DF0,X
|1EB927| BNE .harmless

|1EB929| JSR CheckDamageToLink_bank1E

;---------------------------------------------------------------------------------------------------

.harmless
|1EB92C| LDA.w $0D80,X
|1EB92F| BNE .vulnerable

|1EB931| LDA.w $0B0F,X
|1EB934| STA.w $0D10,X

|1EB937| LDA.w $0B1F,X
|1EB93A| STA.w $0D30,X

|1EB93D| LDA.w $0B2F,X
|1EB940| STA.w $0D00,X

|1EB943| LDA.w $0B3F,X
|1EB946| STA.w $0D20,X

|1EB949| RTS

;---------------------------------------------------------------------------------------------------

.vulnerable
|1EB94A| JSL CheckDamageFromLink_long

|1EB94E| TXA
|1EB94F| EOR.b $1A
|1EB951| AND.b #$03
|1EB953| BNE .cant_hug_arrghus

|1EB955| LDA.w $0B0F,X
|1EB958| STA.b $04

|1EB95A| LDA.w $0B1F,X
|1EB95D| STA.b $05

|1EB95F| LDA.w $0B2F,X
|1EB962| STA.b $06

|1EB964| LDA.w $0B3F,X
|1EB967| STA.b $07

|1EB969| LDA.b #$04
|1EB96B| JSL ProjectSpriteSpeedTowardsLocation_long

|1EB96F| LDA.b $00
|1EB971| STA.w $0D40,X

|1EB974| LDA.b $01
|1EB976| STA.w $0D50,X

|1EB979| LDA.w $0D10,X
|1EB97C| SEC
|1EB97D| SBC.w $0B0F,X
|1EB980| CLC
|1EB981| ADC.b #$08

|1EB983| CMP.b #$10
|1EB985| BCS .cant_hug_arrghus

|1EB987| LDA.w $0D00,X
|1EB98A| SEC
|1EB98B| SBC.w $0B2F,X
|1EB98E| CLC
|1EB98F| ADC.b #$08

|1EB991| CMP.b #$10
|1EB993| BCS .cant_hug_arrghus

|1EB995| STZ.w $0D80,X

|1EB998| LDA.b #$0D
|1EB99A| STA.w $0F50,X

|1EB99D| LDA.w $0E60,X
|1EB9A0| ORA.b #$40
|1EB9A2| STA.w $0E60,X

.cant_hug_arrghus
|1EB9A5| JSR MoveSpriteXY_bank1E

|1EB9A8| RTS

;===================================================================================================

Sprite_8B_Gibdo:
|1EB9A9| JSR SpriteDraw_Gibdo
|1EB9AC| JSR CheckIfActive_bank1E
|1EB9AF| JSR HandleSpriteRecoil_bank1E
|1EB9B2| JSR CheckDamageToAndFromLink_bank1E

|1EB9B5| LDA.w $0D80,X
|1EB9B8| JSL JumpTableLocal
|1EB9BC| dw Gibdo_Turn
|1EB9BE| dw Gibdo_Walk

;===================================================================================================

pool Gibdo_Turn

.target_direction
|1EB9C0| db $02, $06, $04, $00

.anim_step
|1EB9C4| db $04, $08, $0B, $0A, $00, $06, $03, $07

endpool

;---------------------------------------------------------------------------------------------------

Gibdo_Turn:
|1EB9CC| LDY.w $0DE0,X

|1EB9CF| LDA.w .anim_step,Y
|1EB9D2| STA.w $0DC0,X

|1EB9D5| LDA.b $1A
|1EB9D7| AND.b #$07
|1EB9D9| BNE .exit

|1EB9DB| LDY.w $0D90,X

|1EB9DE| LDA.w $0DE0,X
|1EB9E1| CMP.w .target_direction,Y
|1EB9E4| BEQ .begin_movement
|1EB9E6| BPL .turn_left

.turn_right
|1EB9E8| INC.w $0DE0,X
|1EB9EB| BRA .exit

.turn_left
|1EB9ED| DEC.w $0DE0,X

.exit
|1EB9F0| RTS

.begin_movement
|1EB9F1| JSL GetRandomNumber
|1EB9F5| AND.b #$1F
|1EB9F7| ADC.b #$30
|1EB9F9| STA.w $0DF0,X

|1EB9FC| INC.w $0D80,X

|1EB9FF| RTS

;===================================================================================================

pool Gibdo_Walk

.speed_y ; bleeds into next
|1EBA00| db -16,   0

.speed_x
|1EBA02| db   0,   0,  16,   0,   0,   0, -16,   0

.anim_step
|1EBA0A| db $09, $02, $00, $04, $0B, $03, $01, $05

endpool

;---------------------------------------------------------------------------------------------------

Gibdo_Walk:
|1EBA12| LDY.w $0DE0,X

|1EBA15| LDA.w .speed_x,Y
|1EBA18| STA.w $0D50,X

|1EBA1B| LDA.w .speed_y,Y
|1EBA1E| STA.w $0D40,X

|1EBA21| JSR MoveSpriteXY_bank1E
|1EBA24| JSR CheckSpriteTileCollision_bank1E

|1EBA27| LDA.w $0DF0,X
|1EBA2A| BEQ .face_link

|1EBA2C| LDA.w $0E70,X
|1EBA2F| BEQ .continue

.face_link
|1EBA31| JSR GetDirectionTowardsLink_bank1E
|1EBA34| TYA
|1EBA35| CMP.w $0D90,X
|1EBA38| BEQ .continue

|1EBA3A| STA.w $0D90,X

|1EBA3D| STZ.w $0D80,X

|1EBA40| RTS

.continue
|1EBA41| DEC.w $0DA0,X
|1EBA44| BPL .dont_step_animation

|1EBA46| LDA.b #$0E
|1EBA48| STA.w $0DA0,X

|1EBA4B| INC.w $0E80,X

.dont_step_animation
|1EBA4E| LDA.w $0E80,X
|1EBA51| ASL A
|1EBA52| ASL A

|1EBA53| AND.b #$04
|1EBA55| ORA.w $0D90,X
|1EBA58| TAY

|1EBA59| LDA.w .anim_step,Y
|1EBA5C| STA.w $0DC0,X

|1EBA5F| RTS

;===================================================================================================

pool SpriteDraw_Gibdo

.oam_groups
|1EBA60| dw   0,  -9 : db $80, $00, $00, $02
|1EBA68| dw   0,   0 : db $8A, $00, $00, $02

|1EBA70| dw   0,  -8 : db $80, $00, $00, $02
|1EBA78| dw   0,   1 : db $8A, $40, $00, $02

|1EBA80| dw   0,  -9 : db $82, $00, $00, $02
|1EBA88| dw   0,   0 : db $8C, $00, $00, $02

|1EBA90| dw   0,  -8 : db $82, $00, $00, $02
|1EBA98| dw   0,   0 : db $8E, $00, $00, $02

|1EBAA0| dw   0,  -9 : db $84, $00, $00, $02
|1EBAA8| dw   0,   0 : db $A0, $00, $00, $02

|1EBAB0| dw   0,  -8 : db $84, $00, $00, $02
|1EBAB8| dw   0,   1 : db $A0, $40, $00, $02

|1EBAC0| dw   0,  -9 : db $86, $00, $00, $02
|1EBAC8| dw   0,   0 : db $A2, $00, $00, $02

|1EBAD0| dw   0,  -9 : db $88, $00, $00, $02
|1EBAD8| dw   0,   0 : db $A4, $00, $00, $02

|1EBAE0| dw   0,  -9 : db $88, $40, $00, $02
|1EBAE8| dw   0,   0 : db $A4, $40, $00, $02

|1EBAF0| dw   0,  -9 : db $82, $40, $00, $02
|1EBAF8| dw   0,   0 : db $8C, $40, $00, $02

|1EBB00| dw   0,  -9 : db $86, $40, $00, $02
|1EBB08| dw   0,   0 : db $A2, $40, $00, $02

|1EBB10| dw   0,  -8 : db $82, $40, $00, $02
|1EBB18| dw   0,   1 : db $8E, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Gibdo:
|1EBB20| LDA.b #$00
|1EBB22| XBA
|1EBB23| LDA.w $0DC0,X

|1EBB26| REP #$20

|1EBB28| ASL A
|1EBB29| ASL A
|1EBB2A| ASL A
|1EBB2B| ASL A

|1EBB2C| ADC.w #.oam_groups
|1EBB2F| STA.b $08

|1EBB31| SEP #$20

|1EBB33| LDA.b #$02
|1EBB35| JSR TabulatedSpriteDraw_bank1E

|1EBB38| LDA.w $0F00,X
|1EBB3B| BNE .no_shadow

|1EBB3D| JSL DrawSpriteShadow_long

.no_shadow
|1EBB41| RTS

;===================================================================================================

Sprite_89_MothulaBeam:
|1EBB42| JSL SpriteDraw_SingleLarge_long
|1EBB46| JSR CheckIfActive_bank1E
|1EBB49| JSR CheckDamageToLink_bank1E

|1EBB4C| LDA.b $1A
|1EBB4E| AND.b #$01
|1EBB50| BNE .frame_parity

|1EBB52| LDA.w $0F50,X
|1EBB55| EOR.b #$80
|1EBB57| STA.w $0F50,X

.frame_parity
|1EBB5A| JSR MoveSpriteXY_bank1E

|1EBB5D| LDA.w $0DF0,X
|1EBB60| BNE .stick_around

|1EBB62| JSR CheckSpriteTileCollision_bank1E
|1EBB65| BEQ .stick_around

|1EBB67| STZ.w $0DD0,X

.stick_around
|1EBB6A| TXA
|1EBB6B| EOR.b $1A
|1EBB6D| AND.b #$03
|1EBB6F| BNE .exit

|1EBB71| PHX
|1EBB72| TXY

;---------------------------------------------------------------------------------------------------

|1EBB73| LDX.b #$0E

.next_slot
|1EBB75| LDA.l $7FF800,X
|1EBB79| BEQ .free_garnish_slot

|1EBB7B| DEX
|1EBB7C| BPL .next_slot

|1EBB7E| PLX

.exit
|1EBB7F| RTS

;---------------------------------------------------------------------------------------------------

.free_garnish_slot
|1EBB80| LDA.b #$02 ; GARNISH 02
|1EBB82| STA.l $7FF800,X
|1EBB86| STA.w $0FB4

|1EBB89| LDA.w $0D10,Y
|1EBB8C| STA.l $7FF83C,X

|1EBB90| LDA.w $0D30,Y
|1EBB93| STA.l $7FF878,X

|1EBB97| LDA.w $0D00,Y
|1EBB9A| STA.l $7FF81E,X

|1EBB9E| LDA.w $0D20,Y
|1EBBA1| STA.l $7FF85A,X

|1EBBA5| LDA.b #$10
|1EBBA7| STA.l $7FF90E,X

|1EBBAB| TYA
|1EBBAC| STA.l $7FF92C,X

|1EBBB0| LDA.w $0F20,Y
|1EBBB3| STA.l $7FF968,X

|1EBBB7| PLX

|1EBBB8| RTS

;===================================================================================================

Sprite_94_Tile:
|1EBBB9| LDA.b #$30
|1EBBBB| STA.w $0B89,X

|1EBBBE| JSR SpriteDraw_Tile
|1EBBC1| JSR CheckIfActivePermissive_bank1E

|1EBBC4| LDA.w $0EF0,X
|1EBBC7| BNE Tile_Shatter

|1EBBC9| LDA.b #$01
|1EBBCB| STA.w $0BA0,X

|1EBBCE| LDA.w $0D80,X
|1EBBD1| JSL JumpTableLocal
|1EBBD5| dw Tile_DeleteFloor
|1EBBD7| dw Tile_Ascend
|1EBBD9| dw Tile_Launched

;===================================================================================================

Tile_DeleteFloor:
|1EBBDB| LDA.w $0D10,X
|1EBBDE| STA.b $00

|1EBBE0| LDA.w $0D30,X
|1EBBE3| STA.b $01

|1EBBE5| LDA.w $0D00,X
|1EBBE8| CLC
|1EBBE9| ADC.b #$08
|1EBBEB| STA.b $02

|1EBBED| LDA.w $0D20,X
|1EBBF0| STA.b $03

|1EBBF2| LDY.b #$06
|1EBBF4| JSL UpdateTilemapWithCommonObject

|1EBBF8| INC.w $0D80,X

|1EBBFB| LDA.b #$80
|1EBBFD| STA.w $0DF0,X

|1EBC00| RTS

;===================================================================================================

Tile_Launched:
|1EBC01| STZ.w $0BA0,X

|1EBC04| LDA.w $0DF0,X
|1EBC07| BEQ .dont_turn

|1EBC09| AND.b #$03
|1EBC0B| BNE .dont_turn

|1EBC0D| JSR Tile_SpeedTowardsLink

.dont_turn
|1EBC10| JSR CheckDamageToAndFromLink_bank1E
|1EBC13| BCS Tile_Shatter

|1EBC15| JSR MoveSpriteXY_bank1E

|1EBC18| LDA.w $0FDA
|1EBC1B| SEC
|1EBC1C| SBC.w $0F70,X
|1EBC1F| STA.w $0FDA

|1EBC22| LDA.w $0FDB
|1EBC25| SBC.b #$00
|1EBC27| STA.w $0FDB

|1EBC2A| JSR CheckSpriteTileCollision_bank1E
|1EBC2D| BEQ .no_tile_collision

;---------------------------------------------------------------------------------------------------

#Tile_Shatter:
|1EBC2F| LDA.b #$1F ; SFX2.1F
|1EBC31| JSL QueueSpriteSFX2WithPan

|1EBC35| LDA.b #$06
|1EBC37| STA.w $0DD0,X

|1EBC3A| LDA.b #$1F
|1EBC3C| STA.w $0DF0,X

|1EBC3F| LDA.b #$EC ; SPRITE EC
|1EBC41| STA.w $0E20,X

|1EBC44| STZ.w $0EF0,X

|1EBC47| LDA.b #$80
|1EBC49| STA.w $0DB0,X

|1EBC4C| RTS

.no_tile_collision
|1EBC4D| BRA Tile_Whirr

;===================================================================================================

Tile_Ascend:
|1EBC4F| LDA.w $0DF0,X
|1EBC52| BNE .ascending

|1EBC54| INC.w $0D80,X

|1EBC57| LDA.b #$10
|1EBC59| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#Tile_SpeedTowardsLink:
|1EBC5C| LDA.b #$20
|1EBC5E| JSL ApplySpeedTowardsLink_long

|1EBC62| RTS

;---------------------------------------------------------------------------------------------------

.ascending
|1EBC63| CMP.b #$40
|1EBC65| BCC Tile_Whirr

|1EBC67| LDA.b #$04
|1EBC69| STA.w $0F80,X

|1EBC6C| JSR MoveSpriteZ_bank1E

;---------------------------------------------------------------------------------------------------

Tile_Whirr:
|1EBC6F| INC.w $0E80,X

|1EBC72| LDA.w $0E80,X
|1EBC75| LSR A
|1EBC76| LSR A
|1EBC77| AND.b #$01
|1EBC79| STA.w $0DC0,X

|1EBC7C| TXA
|1EBC7D| EOR.b $1A
|1EBC7F| AND.b #$07
|1EBC81| BNE .exit

|1EBC83| LDA.b #$07 ; SFX2.07
|1EBC85| JSL QueueSpriteSFX2WithPan

.exit
|1EBC89| RTS

;===================================================================================================

pool SpriteDraw_Tile

.oam_groups
|1EBC8A| dw   0,   0 : db $D3, $00, $00, $00
|1EBC92| dw   8,   0 : db $D3, $40, $00, $00
|1EBC9A| dw   0,   8 : db $D3, $80, $00, $00
|1EBCA2| dw   8,   8 : db $D3, $C0, $00, $00

|1EBCAA| dw   0,   0 : db $C3, $00, $00, $00
|1EBCB2| dw   8,   0 : db $C3, $40, $00, $00
|1EBCBA| dw   0,   8 : db $C3, $80, $00, $00
|1EBCC2| dw   8,   8 : db $C3, $C0, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Tile:
|1EBCCA| LDA.b #$00
|1EBCCC| XBA
|1EBCCD| LDA.w $0DC0,X

|1EBCD0| REP #$20

|1EBCD2| ASL A
|1EBCD3| ASL A
|1EBCD4| ASL A
|1EBCD5| ASL A
|1EBCD6| ASL A
|1EBCD7| ADC.w #.oam_groups
|1EBCDA| STA.b $08

|1EBCDC| SEP #$20

|1EBCDE| LDA.b #$04
|1EBCE0| JSR TabulatedSpriteDraw_bank1E

|1EBCE3| JSL DrawSpriteShadow_long

|1EBCE7| RTS

;===================================================================================================

Sprite_8A_SpikeBlock:
|1EBCE8| LDA.w $0E90,X
|1EBCEB| BNE SpikeBlock_ByMothula

|1EBCED| JSL SpriteDraw_SingleLarge_long
|1EBCF1| JSR CheckIfActive_bank1E
|1EBCF4| JSR CheckDamageToAndFromLink_bank1E
|1EBCF7| JSR MoveSpriteXY_bank1E
|1EBCFA| JSR CheckSpriteTileCollision_bank1E

|1EBCFD| LDA.w $0DF0,X
|1EBD00| BNE .exit

|1EBD02| JSR SpikeBlock_CheckStatueCollision
|1EBD05| BCC .hit_statue

|1EBD07| LDA.w $0E70,X
|1EBD0A| AND.b #$0F
|1EBD0C| BEQ .exit

.hit_statue
|1EBD0E| LDA.b #$04
|1EBD10| STA.w $0DF0,X

|1EBD13| LDA.w $0D50,X
|1EBD16| EOR.b #$FF
|1EBD18| INC A
|1EBD19| STA.w $0D50,X

|1EBD1C| LDA.b #$05 ; SFX2.05
|1EBD1E| JSL QueueSpriteSFX2WithPan

.exit
|1EBD22| RTS

;===================================================================================================

SpikeBlock_ByMothula:
|1EBD23| LDA.b #$04
|1EBD25| JSL AllocateOAMInRegionB

|1EBD29| JSL SpriteDraw_SingleLarge_long
|1EBD2D| JSR CheckIfActive_bank1E
|1EBD30| JSR CheckDamageToAndFromLink_bank1E

|1EBD33| LDA.w $0D80,X
|1EBD36| BNE .active

|1EBD38| LDY.b #$00
|1EBD3A| JSR SpikeBlock_UpdateTilemap

|1EBD3D| INC.w $0D80,X

|1EBD40| LDA.b #$40
|1EBD42| STA.w $0DF0,X

|1EBD45| LDA.b #$69
|1EBD47| STA.w $0E00,X

|1EBD4A| RTS

;---------------------------------------------------------------------------------------------------

.shake
|1EBD4B| db  8, -8

;---------------------------------------------------------------------------------------------------

.active
|1EBD4D| LDA.w $0DF0,X
|1EBD50| BEQ .moving

|1EBD52| CMP.b #$01
|1EBD54| BNE .jiggle

|1EBD56| LDA.w $0D90,X
|1EBD59| STA.w $0D10,X

|1EBD5C| LDA.w $0DA0,X
|1EBD5F| STA.w $0D00,X

|1EBD62| RTS

.jiggle
|1EBD63| LSR A
|1EBD64| AND.b #$01
|1EBD66| TAY

|1EBD67| LDA.w .shake,Y
|1EBD6A| STA.w $0D50,X

|1EBD6D| JSR MoveSpriteX_bank1E

|1EBD70| STZ.w $0D50,X

|1EBD73| RTS

;---------------------------------------------------------------------------------------------------

.max_speed_x ; bleeds into next
|1EBD74| db  32, -32

.max_speed_y
|1EBD76| db   0,   0,  32, -32

.accel_x ; bleeds into next
|1EBD7A| db   1,  -1

.accel_y
|1EBD7C| db   0,   0,   1,  -1

;---------------------------------------------------------------------------------------------------

.moving
|1EBD80| LDA.w $0D80,X
|1EBD83| CMP.b #$01
|1EBD85| BNE .returning

|1EBD87| LDA.b $1A
|1EBD89| AND.b #$00
|1EBD8B| BNE .delay

|1EBD8D| LDY.w $0DE0,X

|1EBD90| LDA.w $0D50,X
|1EBD93| CMP.w .max_speed_x,Y
|1EBD96| BEQ .up_to_speed_x

|1EBD98| CLC
|1EBD99| ADC.w .accel_x,Y
|1EBD9C| STA.w $0D50,X

.up_to_speed_x
|1EBD9F| LDA.w $0D40,X
|1EBDA2| CMP.w .max_speed_y,Y
|1EBDA5| BEQ .delay

|1EBDA7| CLC
|1EBDA8| ADC.w .accel_y,Y
|1EBDAB| STA.w $0D40,X

.delay
|1EBDAE| JSR MoveSpriteXY_bank1E

|1EBDB1| LDA.w $0E00,X
|1EBDB4| BNE .exit_a

|1EBDB6| JSL Get16BitSpriteCoords_long
|1EBDBA| JSR CheckSpriteTileCollision_bank1E
|1EBDBD| BEQ .exit_a

|1EBDBF| INC.w $0D80,X

|1EBDC2| LDA.b #$40
|1EBDC4| STA.w $0E00,X

.exit_a
|1EBDC7| RTS

;---------------------------------------------------------------------------------------------------

.return_speed_x
|1EBDC8| db $F0, $10, $00, $00

.return_speed_y
|1EBDCC| db $00, $00, $F0, $10

;---------------------------------------------------------------------------------------------------

.returning
|1EBDD0| LDA.w $0E00,X
|1EBDD3| BNE .exit_b

|1EBDD5| LDY.w $0DE0,X

|1EBDD8| LDA.w .return_speed_x,Y
|1EBDDB| STA.w $0D50,X

|1EBDDE| LDA.w .return_speed_y,Y
|1EBDE1| STA.w $0D40,X

|1EBDE4| JSR MoveSpriteXY_bank1E

|1EBDE7| LDA.w $0D10,X
|1EBDEA| CMP.w $0D90,X
|1EBDED| BNE .exit_b

|1EBDEF| LDA.w $0D00,X
|1EBDF2| CMP.w $0DA0,X
|1EBDF5| BNE .exit_b

|1EBDF7| STZ.w $0DD0,X

|1EBDFA| LDY.b #$02
|1EBDFC| JSR SpikeBlock_UpdateTilemap

.exit_b
|1EBDFF| RTS

;===================================================================================================

SpikeBlock_UpdateTilemap:
|1EBE00| LDA.w $0D10,X
|1EBE03| STA.b $00

|1EBE05| LDA.w $0D30,X
|1EBE08| STA.b $01

|1EBE0A| LDA.w $0D00,X
|1EBE0D| STA.b $02

|1EBE0F| LDA.w $0D20,X
|1EBE12| STA.b $03

|1EBE14| JSL UpdateTilemapWithCommonObject

|1EBE18| RTS

;===================================================================================================

SpikeBlock_CheckStatueCollision:
|1EBE19| LDY.b #$0F

.next_sprite
|1EBE1B| TYA
|1EBE1C| EOR.b $1A
|1EBE1E| AND.b #$01
|1EBE20| BNE .skip

|1EBE22| LDA.w $0DD0,Y
|1EBE25| BEQ .skip

|1EBE27| LDA.w $0E20,Y
|1EBE2A| CMP.b #$1C ; SPRITE 1C
|1EBE2C| BNE .skip

|1EBE2E| LDA.w $0D10,X
|1EBE31| STA.b $00

|1EBE33| LDA.w $0D30,X
|1EBE36| STA.b $01

|1EBE38| LDA.w $0D00,X
|1EBE3B| STA.b $02

|1EBE3D| LDA.w $0D20,X
|1EBE40| STA.b $03

|1EBE42| LDA.w $0D10,Y
|1EBE45| STA.b $04

|1EBE47| LDA.w $0D30,Y
|1EBE4A| STA.b $05

|1EBE4C| LDA.w $0D00,Y
|1EBE4F| STA.b $06

|1EBE51| LDA.w $0D20,Y
|1EBE54| STA.b $07

|1EBE56| REP #$20

|1EBE58| LDA.b $00
|1EBE5A| SEC
|1EBE5B| SBC.b $04
|1EBE5D| CLC
|1EBE5E| ADC.w #$0010

|1EBE61| CMP.w #$0020
|1EBE64| BCS .no_collision

|1EBE66| LDA.b $02
|1EBE68| SEC
|1EBE69| SBC.b $06
|1EBE6B| CLC
|1EBE6C| ADC.w #$0008

|1EBE6F| CMP.w #$0010
|1EBE72| BCS .no_collision

|1EBE74| SEP #$20

|1EBE76| RTS

.no_collision
|1EBE77| SEP #$20

.skip
|1EBE79| DEY
|1EBE7A| BPL .next_sprite

|1EBE7C| SEC

|1EBE7D| RTS

;===================================================================================================

Sprite_88_Mothula:
|1EBE7E| JSR Mothula

|1EBE81| JSR CheckIfActive_bank1E

|1EBE84| JSR Mothula_HandleSpikes

|1EBE87| RTS

;===================================================================================================

Mothula:
|1EBE88| JSL SpriteDraw_Mothula

|1EBE8C| LDA.w $0DD0,X
|1EBE8F| CMP.b #$0B
|1EBE91| BNE .not_stunned

|1EBE93| STZ.w $0D80,X

.not_stunned
|1EBE96| JSR CheckIfActive_bank1E

|1EBE99| STZ.w $0E60,X

|1EBE9C| LDA.w $0EE0,X
|1EBE9F| BEQ .vulnerable

|1EBEA1| LDA.b #$40
|1EBEA3| STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

.vulnerable
|1EBEA6| LDA.w $0EA0,X
|1EBEA9| BEQ .continue

|1EBEAB| AND.b #$7F
|1EBEAD| CMP.b #$06
|1EBEAF| BNE .continue

|1EBEB1| STZ.w $0EA0,X

|1EBEB4| LDA.b #$20
|1EBEB6| STA.w $0EE0,X

|1EBEB9| LDA.b #$02
|1EBEBB| STA.w $0D80,X

|1EBEBE| STZ.w $0DF0,X

|1EBEC1| LDA.b #$40
|1EBEC3| STA.w $0ED0,X

;---------------------------------------------------------------------------------------------------

.continue
|1EBEC6| JSR HandleSpriteRecoil_bank1E

|1EBEC9| LDA.w $0D80,X
|1EBECC| JSL JumpTableLocal
|1EBED0| dw Modula_Dormant
|1EBED2| dw Modula_WakeUp
|1EBED4| dw Modula_ActLikeAMoth
|1EBED6| dw Modula_FireBeams

;===================================================================================================

Modula_Dormant:
|1EBED8| LDA.w $0DF0,X
|1EBEDB| BNE .exit

|1EBEDD| INC.w $0D80,X

.exit
|1EBEE0| RTS

;===================================================================================================

Modula_WakeUp:
|1EBEE1| LDA.b #$08
|1EBEE3| STA.w $0F80,X

|1EBEE6| JSR MoveSpriteZ_bank1E

|1EBEE9| STZ.w $0F80,X

|1EBEEC| LDA.w $0F70,X
|1EBEEF| CMP.b #$18
|1EBEF1| BCC .still_rising

|1EBEF3| LDA.b #$80
|1EBEF5| STA.w $0ED0,X

|1EBEF8| INC.w $0D80,X

|1EBEFB| STZ.w $0BA0,X

|1EBEFE| LDA.b #$40
|1EBF00| STA.w $0DF0,X

.still_rising
|1EBF03| JSR Mothula_FlapWings

|1EBF06| RTS

;===================================================================================================

pool Modula_ActLikeAMoth

.speed_z
|1EBF07| db   1,  -1

.speed_y ; bleeds into next
|1EBF09| db -16, -12

.speed_x
|1EBF0B| db   0,  12,  16,  12,   0, -12, -16, -12

endpool

;---------------------------------------------------------------------------------------------------

Modula_ActLikeAMoth:
|1EBF13| LDA.w $0ED0,X
|1EBF16| BNE .dont_shoot

|1EBF18| LDA.b #$3F
|1EBF1A| STA.w $0DF0,X

|1EBF1D| INC.w $0D80,X

|1EBF20| RTS

;---------------------------------------------------------------------------------------------------

.dont_shoot
|1EBF21| DEC.w $0ED0,X

|1EBF24| JSR Mothula_FlapWings

|1EBF27| LDA.w $0D90,X
|1EBF2A| AND.b #$01
|1EBF2C| TAY

|1EBF2D| LDA.w $0F80,X
|1EBF30| CLC
|1EBF31| ADC.w .speed_z,Y
|1EBF34| STA.w $0F80,X

|1EBF37| CMP.w Sixteen_X,Y
|1EBF3A| BNE .dont_change_z_speed

|1EBF3C| INC.w $0D90,X

.dont_change_z_speed
|1EBF3F| LDA.w $0DF0,X
|1EBF42| BNE .direction_fine

|1EBF44| INC.w $0DB0,X

|1EBF47| LDA.w $0DB0,X
|1EBF4A| CMP.b #$07
|1EBF4C| BNE .pick_random_direction

|1EBF4E| STZ.w $0DB0,X

|1EBF51| BRA .target_link

.pick_random_direction
|1EBF53| JSL GetRandomNumber
|1EBF57| AND.b #$07
|1EBF59| TAY

|1EBF5A| LDA.w .speed_x,Y
|1EBF5D| STA.w $0D50,X

|1EBF60| LDA.w .speed_y,Y
|1EBF63| STA.w $0D40,X

|1EBF66| JSL GetRandomNumber
|1EBF6A| AND.b #$1F
|1EBF6C| ADC.b #$40
|1EBF6E| STA.w $0DF0,X

|1EBF71| BRA .direction_fine

;---------------------------------------------------------------------------------------------------

.target_link
|1EBF73| LDA.b #$20
|1EBF75| JSL ApplySpeedTowardsLink_long

|1EBF79| LDA.b #$80
|1EBF7B| STA.w $0DF0,X

.direction_fine
|1EBF7E| LDA.w $0E70,X
|1EBF81| BNE .skip_movement

|1EBF83| JSR MoveSpriteXY_bank1E

.skip_movement
|1EBF86| JSR MoveSpriteZ_bank1E
|1EBF89| JSR CheckSpriteTileCollision_bank1E
|1EBF8C| BEQ .no_tile_collision

|1EBF8E| STZ.w $0DF0,X

.no_tile_collision
|1EBF91| JSR CheckDamageToAndFromLink_bank1E

|1EBF94| INC.w $0E80,X
|1EBF97| INC.w $0E80,X

|1EBF9A| RTS

;===================================================================================================

pool Mothula_FlapWings

.anim_step
|1EBF9B| db $00, $01, $02, $01

endpool

;---------------------------------------------------------------------------------------------------

Mothula_FlapWings:
|1EBF9F| INC.w $0E80,X

|1EBFA2| LDA.w $0E80,X
|1EBFA5| LSR A
|1EBFA6| LSR A
|1EBFA7| AND.b #$03
|1EBFA9| TAY

|1EBFAA| BNE .no_sfx

|1EBFAC| LDA.b #$02 ; SFX3.02
|1EBFAE| JSL QueueSpriteSFX3WithPan

.no_sfx
|1EBFB2| LDA.w .anim_step,Y
|1EBFB5| STA.w $0DC0,X

|1EBFB8| RTS

;===================================================================================================

Modula_FireBeams:
|1EBFB9| JSR CheckDamageToAndFromLink_bank1E

|1EBFBC| LDA.w $0DF0,X
|1EBFBF| BNE .delay

|1EBFC1| DEC.w $0D80,X

|1EBFC4| JSL GetRandomNumber
|1EBFC8| AND.b #$1F
|1EBFCA| ORA.b #$40
|1EBFCC| STA.w $0ED0,X

|1EBFCF| RTS

.delay
|1EBFD0| CMP.b #$20
|1EBFD2| BNE .not_yet

|1EBFD4| JSR Mothula_SpawnBeams

.not_yet
|1EBFD7| BRA Mothula_FlapWings

;===================================================================================================

pool Mothula_SpawnBeams

.speed_and_offset_x
|1EBFD9| db -16,   0,  16

.speed_y
|1EBFDC| db  24,  32,  24

endpool

;---------------------------------------------------------------------------------------------------

Mothula_SpawnBeams:
|1EBFDF| LDA.b #$36 ; SFX3.36
|1EBFE1| JSL QueueSpriteSFX3WithPan

|1EBFE5| LDA.b #$02
|1EBFE7| STA.w $0FB5

.next_spawn
|1EBFEA| LDA.b #$89 ; SPRITE 89
|1EBFEC| JSL SpawnSpriteDynamically
|1EBFF0| BMI .no_space

|1EBFF2| JSL SetSpawnedSpriteCoordinates

|1EBFF6| LDA.b $02
|1EBFF8| SEC
|1EBFF9| SBC.b $04

|1EBFFB| CLC
|1EBFFC| ADC.b #$03
|1EBFFE| STA.w $0D00,Y

|1EC001| LDA.b #$10
|1EC003| STA.w $0DF0,Y
|1EC006| STA.w $0BA0,Y

|1EC009| PHX

|1EC00A| LDX.w $0FB5

|1EC00D| LDA.b $00
|1EC00F| CLC
|1EC010| ADC.w .speed_and_offset_x,X
|1EC013| STA.w $0D10,Y

|1EC016| LDA.w .speed_and_offset_x,X
|1EC019| STA.w $0D50,Y

|1EC01C| LDA.w .speed_y,X
|1EC01F| STA.w $0D40,Y

|1EC022| LDA.b #$00
|1EC024| STA.w $0F70,Y

|1EC027| PLX

.no_space
|1EC028| DEC.w $0FB5
|1EC02B| BPL .next_spawn

|1EC02D| RTS

;===================================================================================================

pool Mothula_HandleSpikes

.position_x
|1EC02E| db $38, $48, $58, $68, $88, $98, $A8, $B8
|1EC036| db $C8, $C8, $C8, $C8, $C8, $C8, $C8, $B8
|1EC03E| db $A8, $98, $78, $68, $58, $48, $38, $28
|1EC046| db $28, $28, $28, $28, $28, $28

.position_y
|1EC04C| db $38, $38, $38, $38, $38, $38, $38, $38
|1EC054| db $48, $58, $68, $78, $98, $A8, $B8, $C8
|1EC05C| db $C8, $C8, $C8, $C8, $C8, $C8, $C8, $B8
|1EC064| db $A8, $98, $78, $68, $58, $48

.direction
|1EC06A| db $02, $02, $02, $02, $02, $02, $02, $02
|1EC072| db $01, $01, $01, $01, $01, $01, $01, $03
|1EC07A| db $03, $03, $03, $03, $03, $03, $03, $00
|1EC082| db $00, $00, $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Mothula_HandleSpikes:
|1EC088| DEC.w $0EB0,X
|1EC08B| BNE .exit

|1EC08D| LDA.b #$40
|1EC08F| STA.w $0EB0,X

|1EC092| LDA.b #$8A ; SPRITE 8A
|1EC094| JSL SpawnSpriteDynamically
|1EC098| BMI .exit

|1EC09A| PHX

|1EC09B| JSL GetRandomNumber
|1EC09F| AND.b #$1F
|1EC0A1| CMP.b #$1E
|1EC0A3| BCC .rng_roll_in_range

|1EC0A5| SBC.b #$1E

.rng_roll_in_range
|1EC0A7| TAX

|1EC0A8| LDA.w .position_x,X
|1EC0AB| STA.w $0D10,Y
|1EC0AE| STA.w $0D90,Y

|1EC0B1| LDA.w .position_y,X
|1EC0B4| DEC A
|1EC0B5| STA.w $0D00,Y
|1EC0B8| STA.w $0DA0,Y

|1EC0BB| LDA.w .direction,X
|1EC0BE| STA.w $0DE0,Y

|1EC0C1| LDA.b #$01
|1EC0C3| STA.w $0E90,Y

|1EC0C6| CLC
|1EC0C7| ADC.w $0FB0
|1EC0CA| STA.w $0D30,Y

|1EC0CD| LDA.b #$01
|1EC0CF| CLC
|1EC0D0| ADC.w $0FB1
|1EC0D3| STA.w $0D20,Y

|1EC0D6| TYX

|1EC0D7| LDA.b #$01
|1EC0D9| STA.w $0D50,X

|1EC0DC| JSL Get16BitSpriteCoords_long
|1EC0E0| JSR CheckSpriteTileCollision_bank1E

|1EC0E3| STZ.w $0D50,X

|1EC0E6| LDA.w $0D90,X
|1EC0E9| STA.w $0D10,X

|1EC0EC| LDA.w $0DA0,X
|1EC0EF| STA.w $0D00,X

|1EC0F2| LDA.w $0E70,X
|1EC0F5| BNE .keep_spawn

|1EC0F7| STZ.w $0DD0,X

|1EC0FA| PLX

|1EC0FB| LDA.b #$01
|1EC0FD| STA.w $0EB0,X

|1EC100| RTS

.keep_spawn
|1EC101| PLX

.exit
|1EC102| RTS

;===================================================================================================

Sprite_86_Kodongo:
|1EC103| JSL SpriteDraw_SingleLarge_long
|1EC107| JSR CheckIfActive_bank1E
|1EC10A| JSR HandleSpriteRecoil_bank1E
|1EC10D| JSR CheckDamageToAndFromLink_bank1E

|1EC110| STZ.w $0B6B,X

|1EC113| LDA.w $0D80,X
|1EC116| JSL JumpTableLocal
|1EC11A| dw Kodongo_MakeDecision
|1EC11C| dw Kodongo_Move
|1EC11E| dw Kodongo_ShootFire

;===================================================================================================

pool Kodongo_MakeDecision

.speed_x
|1EC120| db  1, -1,  0,  0

.speed_y
|1EC124| db  0,  0,  1, -1

endpool

;---------------------------------------------------------------------------------------------------

Kodongo_MakeDecision:
|1EC128| INC.w $0D80,X

|1EC12B| JSL GetRandomNumber
|1EC12F| AND.b #$03
|1EC131| STA.w $0DE0,X

|1EC134| LDA.b #$B0
|1EC136| STA.w $0B6B,X

.try_new_direction
|1EC139| LDY.w $0DE0,X

|1EC13C| LDA.w .speed_x,Y
|1EC13F| STA.w $0D50,X

|1EC142| LDA.w .speed_y,Y
|1EC145| STA.w $0D40,X

|1EC148| JSR CheckSpriteTileCollision_bank1E
|1EC14B| BEQ Kodongo_SetDirection

|1EC14D| LDA.w $0DE0,X
|1EC150| INC A
|1EC151| AND.b #$03
|1EC153| STA.w $0DE0,X

|1EC156| BRA .try_new_direction

;===================================================================================================

Kodongo_SetDirection:
|1EC158| LDY.w $0DE0,X

|1EC15B| LDA.w Sixteen_X,Y
|1EC15E| STA.w $0D50,X

|1EC161| LDA.w Sixteen_Y,Y
|1EC164| STA.w $0D40,X

|1EC167| RTS

;===================================================================================================

pool Kodongo_Move

.anim_step
|1EC168| db $02, $02, $00, $05
|1EC16C| db $03, $03, $00, $05

.flip
|1EC170| db $40, $00, $00, $00
|1EC174| db $40, $00, $40, $40

endpool

;---------------------------------------------------------------------------------------------------

Kodongo_Move:
|1EC178| JSR MoveSpriteXY_bank1E
|1EC17B| JSR CheckSpriteTileCollision_bank1E
|1EC17E| BEQ .no_tile_collision

|1EC180| LDA.w $0DE0,X
|1EC183| EOR.b #$01
|1EC185| STA.w $0DE0,X

|1EC188| JSR Kodongo_SetDirection

.no_tile_collision
|1EC18B| LDA.w $0D10,X
|1EC18E| AND.b #$1F
|1EC190| CMP.b #$04
|1EC192| BNE .dont_breathe_fire

|1EC194| LDA.w $0D00,X
|1EC197| AND.b #$1F
|1EC199| CMP.b #$1B
|1EC19B| BNE .dont_breathe_fire

|1EC19D| JSL GetRandomNumber
|1EC1A1| AND.b #$03
|1EC1A3| BNE .dont_breathe_fire

|1EC1A5| LDA.b #$6F
|1EC1A7| STA.w $0DF0,X

|1EC1AA| INC.w $0D80,X

|1EC1AD| STZ.w $0D90,X

.dont_breathe_fire
|1EC1B0| INC.w $0E80,X

|1EC1B3| LDA.w $0E80,X
|1EC1B6| AND.b #$04
|1EC1B8| ORA.w $0DE0,X
|1EC1BB| TAY

|1EC1BC| LDA.w .anim_step,Y
|1EC1BF| STA.w $0DC0,X

|1EC1C2| LDA.w $0F50,X
|1EC1C5| AND.b #$BF
|1EC1C7| ORA.w .flip,Y
|1EC1CA| STA.w $0F50,X

|1EC1CD| RTS

;===================================================================================================

pool Kodongo_ShootFire

.anim_step
|1EC1CE| db $02, $02, $00, $05
|1EC1D2| db $04, $04, $01, $06

endpool

;---------------------------------------------------------------------------------------------------

Kodongo_ShootFire:
|1EC1D6| LDA.w $0DF0,X
|1EC1D9| BNE .wait

|1EC1DB| STZ.w $0D80,X

.wait
|1EC1DE| LDY.b #$00

|1EC1E0| SEC
|1EC1E1| SBC.b #$20

|1EC1E3| CMP.b #$30
|1EC1E5| BCS .wait_more

|1EC1E7| LDY.b #$04

.wait_more
|1EC1E9| CPY.b #$04
|1EC1EB| BNE .dont_fire

|1EC1ED| LDA.w $0DF0,X
|1EC1F0| AND.b #$0F
|1EC1F2| BNE .dont_fire

|1EC1F4| PHY

|1EC1F5| JSR Kodongo_SpawnFire

|1EC1F8| PLY

.dont_fire
|1EC1F9| TYA
|1EC1FA| ORA.w $0DE0,X
|1EC1FD| TAY

|1EC1FE| LDA.w .anim_step,Y
|1EC201| STA.w $0DC0,X

|1EC204| RTS

;===================================================================================================

pool Kodongo_SpawnFire

.offset_x_low
|1EC205| db   8,  -8,   0,   0

.offset_x_high
|1EC209| db   0,  -1,   0,   0

.offset_y_low
|1EC20D| db   0,   0,   8,  -8

.offset_y_high
|1EC211| db   0,   0,   0,  -1

.speed_x
|1EC215| db  24, -24,   0,   0

.speed_y
|1EC219| db   0,   0,  24, -24

|1EC21D| db  64,  56,  48,  40, 32,  24

endpool

;---------------------------------------------------------------------------------------------------

Kodongo_SpawnFire:
|1EC223| LDA.b #$87 ; SPRITE 87
|1EC225| LDY.b #$0D
|1EC227| JSL SpawnSpriteDynamically.slot_limited
|1EC22B| BMI .no_space

|1EC22D| PHX

|1EC22E| LDA.w $0DE0,X
|1EC231| TAX

|1EC232| LDA.b $00
|1EC234| CLC
|1EC235| ADC.w .offset_x_low,X
|1EC238| STA.w $0D10,Y

|1EC23B| LDA.b $01
|1EC23D| ADC.w .offset_x_high,X
|1EC240| STA.w $0D30,Y

|1EC243| LDA.b $02
|1EC245| CLC
|1EC246| ADC.w .offset_y_low,X
|1EC249| STA.w $0D00,Y

|1EC24C| LDA.b $03
|1EC24E| ADC.w .offset_y_high,X
|1EC251| STA.w $0D20,Y

|1EC254| LDA.w .speed_x,X
|1EC257| STA.w $0D50,Y

|1EC25A| LDA.w .speed_y,X
|1EC25D| STA.w $0D40,Y

|1EC260| LDA.b #$01
|1EC262| STA.w $0BA0,Y

|1EC265| PLX

.no_space
|1EC266| RTS

;===================================================================================================

CheckDamageToAndFromLink_bank1E:
|1EC267| JSL CheckDamageFromLink_long

;===================================================================================================

CheckDamageToLink_bank1E:
|1EC26B| JSL CheckDamageToLink_long

|1EC26F| RTS

;===================================================================================================

pool Sprite_87_KodongoFire

.flip
|1EC270| db $00, $40, $C0, $80

endpool

;---------------------------------------------------------------------------------------------------

Sprite_87_KodongoFire:
|1EC274| LDA.w $0DF0,X
|1EC277| BNE LingeringFlame

|1EC279| JSL SpriteDraw_SingleLarge_long
|1EC27D| JSR CheckIfActive_bank1E

|1EC280| LDA.b $1A
|1EC282| LSR A
|1EC283| LSR A
|1EC284| AND.b #$03
|1EC286| TAY

|1EC287| LDA.w $0F50,X
|1EC28A| AND.b #$3F
|1EC28C| ORA.w .flip,Y
|1EC28F| STA.w $0F50,X

|1EC292| JSR CheckDamageToLink_bank1E
|1EC295| BCS .collided

|1EC297| JSR MoveSpriteXY_bank1E
|1EC29A| JSR CheckSpriteTileCollision_bank1E
|1EC29D| BNE .collided

|1EC29F| RTS

.collided
|1EC2A0| LDA.b #$7F
|1EC2A2| STA.w $0DF0,X

|1EC2A5| LDA.w $0F50,X
|1EC2A8| AND.b #$3F
|1EC2AA| STA.w $0F50,X

|1EC2AD| LDA.b #$2A ; SFX2.2A
|1EC2AF| JSL QueueSpriteSFX2WithPan

|1EC2B3| RTS

;===================================================================================================

LingeringFlameDrawStep:
|1EC2B4| db $05, $04, $03, $01, $02, $00, $03, $00
|1EC2BC| db $01, $02, $03, $00, $01, $02, $03, $00
|1EC2C4| db $01, $02, $03, $00, $01, $02, $03, $00
|1EC2CC| db $01, $02, $03, $00, $01, $02, $03, $00

;===================================================================================================

LingeringFlame:
|1EC2D4| JSL CheckDamageFromLink_long
|1EC2D8| BCC .nohit

|1EC2DA| DEC.w $0DF0,X
|1EC2DD| BEQ .extinguish

.nohit
|1EC2DF| LDA.w $0DF0,X
|1EC2E2| DEC A
|1EC2E3| BNE .continue_burning

.extinguish
|1EC2E5| STZ.w $0DD0,X

.continue_burning
|1EC2E8| LDA.w $0DF0,X
|1EC2EB| LSR A
|1EC2EC| LSR A
|1EC2ED| LSR A
|1EC2EE| TAY

|1EC2EF| LDA.w LingeringFlameDrawStep,Y
|1EC2F2| STA.w $0DC0,X

|1EC2F5| JSL SpriteDraw_Flame
|1EC2F9| JMP.w CheckDamageToLink_bank1E

;===================================================================================================

pool SpriteDraw_Flame

.oam_groups
|1EC2FC| dw   0,   0 : db $8E, $01, $00, $02
|1EC304| dw   0,   0 : db $8E, $01, $00, $02

|1EC30C| dw   0,   0 : db $A0, $01, $00, $02
|1EC314| dw   0,   0 : db $A0, $01, $00, $02

|1EC31C| dw   0,   0 : db $8E, $41, $00, $02
|1EC324| dw   0,   0 : db $8E, $41, $00, $02

|1EC32C| dw   0,   0 : db $A0, $41, $00, $02
|1EC334| dw   0,   0 : db $A0, $41, $00, $02

|1EC33C| dw   0,   0 : db $A2, $01, $00, $02
|1EC344| dw   0,   0 : db $A2, $01, $00, $02

|1EC34C| dw   0,  -6 : db $A4, $01, $00, $00
|1EC354| dw   8,  -6 : db $A5, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Flame:
|1EC35C| PHB
|1EC35D| PHK
|1EC35E| PLB

|1EC35F| LDA.b #$00
|1EC361| XBA
|1EC362| LDA.w $0DC0,X

|1EC365| REP #$20

|1EC367| ASL A
|1EC368| ASL A
|1EC369| ASL A
|1EC36A| ASL A

|1EC36B| ADC.w #.oam_groups
|1EC36E| STA.b $08

|1EC370| SEP #$20

|1EC372| LDA.b #$02
|1EC374| JSR TabulatedSpriteDraw_bank1E

|1EC377| PLB

|1EC378| RTL

;===================================================================================================

pool Sprite_85_YellowStalfos

.priority
|1EC379| db $30, $00, $00, $00, $30, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_85_YellowStalfos:
|1EC37F| LDA.w $0D90,X
|1EC382| BNE .tile_already_checked

|1EC384| LDA.b #$01
|1EC386| STA.w $0D50,X
|1EC389| STA.w $0D40,X

|1EC38C| JSR CheckSpriteTileCollision_bank1E
|1EC38F| BEQ .can_spawn

|1EC391| STZ.w $0DD0,X

|1EC394| RTS

;---------------------------------------------------------------------------------------------------

.can_spawn
|1EC395| INC.w $0D90,X

|1EC398| LDA.b #$0A
|1EC39A| STA.w $0DB0,X

|1EC39D| LDA.w $0E60,X
|1EC3A0| ORA.b #$40
|1EC3A2| STA.w $0E60,X

|1EC3A5| LDA.b #$20 ; SFX2.20
|1EC3A7| JSL QueueSpriteSFX2WithPan

.tile_already_checked
|1EC3AB| LDY.w $0D80,X

|1EC3AE| LDA.w $0B89,X
|1EC3B1| ORA.w .priority,Y
|1EC3B4| STA.w $0B89,X

|1EC3B7| JSR SpriteDraw_YellowStalfos
|1EC3BA| JSR CheckIfActive_bank1E

|1EC3BD| LDA.l $7EF359
|1EC3C1| CMP.b #$03
|1EC3C3| BCC .dont_recoil_from_sword

|1EC3C5| JSR HandleSpriteRecoil_bank1E

|1EC3C8| BRA .continue

.dont_recoil_from_sword
|1EC3CA| LDA.w $0D80,X
|1EC3CD| CMP.b #$05
|1EC3CF| BEQ .continue

|1EC3D1| LDA.w $0EF0,X
|1EC3D4| BEQ .continue

|1EC3D6| STZ.w $0EF0,X

|1EC3D9| LDA.b #$05
|1EC3DB| STA.w $0D80,X

|1EC3DE| LDA.b #$FF
|1EC3E0| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.continue
|1EC3E3| LDA.b #$01
|1EC3E5| STA.w $0BA0,X

|1EC3E8| LDA.w $0D80,X
|1EC3EB| JSL JumpTableLocal
|1EC3EF| dw YellowStalfos_Descend
|1EC3F1| dw YellowStalfos_TrackLink
|1EC3F3| dw YellowStalfos_DecapitateSelf
|1EC3F5| dw YellowStalfos_RegretDecapitatingSelf
|1EC3F7| dw YellowStalfos_Ascend
|1EC3F9| dw YellowStalfos_Collapsed

;===================================================================================================

YellowStalfos_Descend:
|1EC3FB| LDA.b #$02
|1EC3FD| STA.w $0EB0,X

|1EC400| LDA.w $0F70,X
|1EC403| PHA

|1EC404| JSR MoveSpriteZ_bank1E

|1EC407| LDA.w $0F80,X
|1EC40A| CMP.b #$C0
|1EC40C| BMI .at_max_z_speed

|1EC40E| SEC
|1EC40F| SBC.b #$03
|1EC411| STA.w $0F80,X

.at_max_z_speed
|1EC414| PLA
|1EC415| EOR.w $0F70,X
|1EC418| BPL .exit

|1EC41A| LDA.w $0F70,X
|1EC41D| BPL .exit

|1EC41F| INC.w $0D80,X

|1EC422| STZ.w $0F70,X
|1EC425| STZ.w $0F80,X

|1EC428| LDA.b #$40
|1EC42A| STA.w $0DF0,X

|1EC42D| JSR YellowStalfos_Animate

.exit
|1EC430| RTS

;===================================================================================================

YellowStalfos_TrackLink:
|1EC431| STZ.w $0BA0,X

|1EC434| JSR CheckDamageToAndFromLink_bank1E

|1EC437| JSR GetDirectionTowardsLink_bank1E
|1EC43A| TYA
|1EC43B| STA.w $0DE0,X
|1EC43E| STA.w $0EB0,X

|1EC441| LDA.w $0DF0,X
|1EC444| BNE YellowStalfos_MakeVulnerable

|1EC446| INC.w $0D80,X

|1EC449| LDA.b #$7F
|1EC44B| STA.w $0DF0,X

;===================================================================================================

YellowStalfos_MakeVulnerable:
|1EC44E| LDA.w $0E60,X
|1EC451| AND.b #$BF
|1EC453| STA.w $0E60,X

|1EC456| RTS

;===================================================================================================

pool YellowStalfos_DecapitateSelf

.anim_step
|1EC457| db $08, $05, $01, $01, $08, $05, $01, $01
|1EC45F| db $08, $05, $01, $01, $07, $04, $02, $02
|1EC467| db $07, $04, $02, $02, $07, $04, $02, $02
|1EC46F| db $07, $04, $02, $02, $07, $04, $02, $02

.head_offset_x
|1EC477| db $80, $80, $80, $80, $80, $80, $80, $80
|1EC47F| db $80, $80, $80, $80, $00, $00, $00, $00
|1EC487| db $00, $00, $00, $00, $FF, $00, $01, $00
|1EC48F| db $FF, $00, $01, $00, $00, $00, $00, $00

.head_offset_y
|1EC497| db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
|1EC49F| db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0D
|1EC4A7| db $0D, $0C, $0B, $0A, $0A, $0A, $0A, $0A
|1EC4AF| db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A

endpool

;---------------------------------------------------------------------------------------------------

YellowStalfos_DecapitateSelf:
|1EC4B7| STZ.w $0BA0,X

|1EC4BA| JSR CheckDamageToAndFromLink_bank1E

|1EC4BD| LDA.w $0DF0,X
|1EC4C0| BNE .delay

|1EC4C2| INC.w $0D80,X

|1EC4C5| LDA.b #$40
|1EC4C7| STA.w $0DF0,X

|1EC4CA| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EC4CB| CMP.b #$30
|1EC4CD| BNE .cold_feet

|1EC4CF| PHA

|1EC4D0| JSR YellowStalfos_EmancipateHead

|1EC4D3| PLA

.cold_feet
|1EC4D4| LSR A
|1EC4D5| LSR A
|1EC4D6| AND.b #$FC

|1EC4D8| ORA.w $0DE0,X
|1EC4DB| TAY

|1EC4DC| LDA.w .anim_step,Y
|1EC4DF| STA.w $0DC0,X

|1EC4E2| LDA.w $0DF0,X
|1EC4E5| LSR A
|1EC4E6| LSR A
|1EC4E7| TAY

|1EC4E8| LDA.w .head_offset_x,Y
|1EC4EB| STA.w $0DA0,X

|1EC4EE| LDA.w .head_offset_y,Y
|1EC4F1| STA.w $0DB0,X

|1EC4F4| JMP.w YellowStalfos_MakeVulnerable

;===================================================================================================

pool YellowStalfos_Animate

.step
|1EC4F7| db $06, $03, $01, $01

endpool

;===================================================================================================

YellowStalfos_RegretDecapitatingSelf:
|1EC4FB| STZ.w $0BA0,X

|1EC4FE| JSR CheckDamageToAndFromLink_bank1E

|1EC501| LDA.w $0DF0,X
|1EC504| BNE YellowStalfos_Animate

|1EC506| INC.w $0D80,X

;===================================================================================================

YellowStalfos_Animate:
|1EC509| LDY.w $0DE0,X

|1EC50C| LDA.w .step,Y
|1EC50F| STA.w $0DC0,X

|1EC512| JMP.w YellowStalfos_MakeVulnerable

;===================================================================================================

YellowStalfos_Ascend:
|1EC515| STZ.w $0DC0,X

|1EC518| LDA.b #$02
|1EC51A| STA.w $0EB0,X

|1EC51D| LDA.w $0F70,X
|1EC520| PHA

|1EC521| JSR MoveSpriteZ_bank1E

|1EC524| LDA.w $0F80,X
|1EC527| CMP.b #$40
|1EC529| BPL .at_max_z_speed

|1EC52B| INC A
|1EC52C| INC A
|1EC52D| STA.w $0F80,X

.at_max_z_speed
|1EC530| PLA
|1EC531| EOR.w $0F70,X
|1EC534| BPL .exit

|1EC536| LDA.w $0F70,X
|1EC539| BMI .exit

|1EC53B| STZ.w $0DD0,X

.exit
|1EC53E| RTS

;===================================================================================================

pool YellowStalfos_Collapsed

.anim_step
|1EC53F| db $01, $01, $01, $09, $0A, $0A, $0A, $0A
|1EC547| db $0A, $0A, $0A, $0A, $0A, $0A, $0A, $09

.head_offset
|1EC54F| db $0A, $0A, $0A, $07, $00, $00, $00, $00
|1EC557| db $00, $00, $00, $00, $00, $00, $00, $07

endpool

;---------------------------------------------------------------------------------------------------

YellowStalfos_Collapsed:
|1EC55F| STZ.w $0BA0,X

|1EC562| JSL CheckDamageFromLink_long

|1EC566| LDA.w $0DF0,X
|1EC569| BNE .delay

|1EC56B| DEC.w $0D80,X

.delay
|1EC56E| LSR A
|1EC56F| LSR A
|1EC570| LSR A
|1EC571| LSR A
|1EC572| TAY

|1EC573| LDA.w .anim_step,Y
|1EC576| STA.w $0DC0,X

|1EC579| LDA.w .head_offset,Y
|1EC57C| STA.w $0DB0,X

|1EC57F| RTS

;===================================================================================================

YellowStalfos_EmancipateHead:
|1EC580| LDA.b #$02 ; SPRITE 02
|1EC582| JSL SpawnSpriteDynamically
|1EC586| BMI .no_space

|1EC588| JSL SetSpawnedSpriteCoordinates

|1EC58C| LDA.b #$0D
|1EC58E| STA.w $0F70,Y

|1EC591| PHX
|1EC592| TYX

|1EC593| LDA.b #$10
|1EC595| JSL ApplySpeedTowardsLink_long

|1EC599| PLX

|1EC59A| LDA.b #$FF
|1EC59C| STA.w $0DF0,Y

|1EC59F| LDA.b #$20
|1EC5A1| STA.w $0E00,Y

.no_space
|1EC5A4| RTS

;===================================================================================================

pool SpriteDraw_YellowStalfos

.oam_groups
|1EC5A5| dw   0,   0 : db $0A, $00, $00, $02
|1EC5AD| dw   0,   0 : db $0A, $00, $00, $02

|1EC5B5| dw   0,   0 : db $0C, $00, $00, $02
|1EC5BD| dw   0,   0 : db $0C, $00, $00, $02

|1EC5C5| dw   0,   0 : db $2C, $00, $00, $02
|1EC5CD| dw   0,   0 : db $2C, $00, $00, $02

|1EC5D5| dw   5,   5 : db $2E, $00, $00, $00
|1EC5DD| dw   0,   0 : db $24, $00, $00, $02

|1EC5E5| dw   4,   1 : db $3E, $00, $00, $00
|1EC5ED| dw   0,   0 : db $24, $00, $00, $02

|1EC5F5| dw   0,   0 : db $0E, $00, $00, $02
|1EC5FD| dw   0,   0 : db $0E, $00, $00, $02

|1EC605| dw   3,   5 : db $2E, $40, $00, $00
|1EC60D| dw   0,   0 : db $24, $40, $00, $02

|1EC615| dw   4,   1 : db $3E, $40, $00, $00
|1EC61D| dw   0,   0 : db $24, $40, $00, $02

|1EC625| dw   0,   0 : db $0E, $40, $00, $02
|1EC62D| dw   0,   0 : db $0E, $40, $00, $02

|1EC635| dw   0,   0 : db $2A, $00, $00, $02
|1EC63D| dw   0,   0 : db $2A, $00, $00, $02

|1EC645| dw   0,   0 : db $2A, $00, $00, $02
|1EC64D| dw   0,   0 : db $2A, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_YellowStalfos:
|1EC655| LDA.b #$00
|1EC657| XBA
|1EC658| LDA.w $0DC0,X

|1EC65B| REP #$20

|1EC65D| ASL A
|1EC65E| ASL A
|1EC65F| ASL A
|1EC660| ASL A
|1EC661| ADC.w #.oam_groups
|1EC664| STA.b $08

|1EC666| LDA.b $90
|1EC668| CLC
|1EC669| ADC.w #$0004
|1EC66C| STA.b $90

|1EC66E| INC.b $92

|1EC670| SEP #$20

|1EC672| LDA.b #$02
|1EC674| JSR TabulatedSpriteDraw_bank1E

;---------------------------------------------------------------------------------------------------

|1EC677| REP #$20

|1EC679| LDA.b $90
|1EC67B| SEC
|1EC67C| SBC.w #$0004
|1EC67F| STA.b $90

|1EC681| DEC.b $92

|1EC683| SEP #$20

|1EC685| LDA.w $0F00,X
|1EC688| BNE .no_head

|1EC68A| JSR .draw_head
|1EC68D| JSL DrawSpriteShadow_long

.no_head
|1EC691| RTS

;---------------------------------------------------------------------------------------------------

.char
|1EC692| db $02, $02, $00, $04

.flip
|1EC696| db $40, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.draw_head
|1EC69A| LDA.w $0DC0,X
|1EC69D| CMP.b #$0A
|1EC69F| BEQ .exit

|1EC6A1| LDA.w $0DA0,X

|1EC6A4| STZ.b $0D

|1EC6A6| CMP.b #$80
|1EC6A8| BEQ .exit

|1EC6AA| STA.b $0C

|1EC6AC| CMP.b #$00
|1EC6AE| BPL .positive

|1EC6B0| DEC.b $0D

.positive
|1EC6B2| LDA.w $0DB0,X
|1EC6B5| STA.b $0A
|1EC6B7| STZ.b $0B

|1EC6B9| LDY.b #$00

|1EC6BB| PHX

|1EC6BC| LDA.w $0EB0,X
|1EC6BF| TAX

;---------------------------------------------------------------------------------------------------

|1EC6C0| REP #$20

|1EC6C2| LDA.b $00
|1EC6C4| CLC
|1EC6C5| ADC.b $0C
|1EC6C7| STA.b ($90),Y

|1EC6C9| AND.w #$0100
|1EC6CC| STA.b $0E

|1EC6CE| LDA.b $02
|1EC6D0| SEC
|1EC6D1| SBC.b $0A

|1EC6D3| INY
|1EC6D4| STA.b ($90),Y

|1EC6D6| CLC
|1EC6D7| ADC.w #$0010

|1EC6DA| CMP.w #$0100
|1EC6DD| BCC .on_screen

|1EC6DF| LDA.w #$00F0
|1EC6E2| STA.b ($90),Y

.on_screen
|1EC6E4| SEP #$20

|1EC6E6| LDA.w .char,X
|1EC6E9| INY
|1EC6EA| STA.b ($90),Y

|1EC6EC| LDA.w .flip,X
|1EC6EF| INY
|1EC6F0| ORA.b $05
|1EC6F2| STA.b ($90),Y

|1EC6F4| TYA
|1EC6F5| LSR A
|1EC6F6| LSR A
|1EC6F7| TAY

|1EC6F8| LDA.b #$02
|1EC6FA| ORA.b $0F
|1EC6FC| STA.b ($92),Y

|1EC6FE| PLX

.exit
|1EC6FF| RTS

;===================================================================================================

SpritePrep_Eyegore:
|1EC700| LDA.w $048E

|1EC703| CMP.b #$0C ; ROOM 010C
|1EC705| BEQ .become_mimic

|1EC707| CMP.b #$1B ; ROOM 001B
|1EC709| BEQ .become_mimic

|1EC70B| CMP.b #$4B ; ROOM 004B
|1EC70D| BEQ .become_mimic

|1EC70F| CMP.b #$6B ; ROOM 006B
|1EC711| BNE .exit

.become_mimic
|1EC713| INC.w $0DA0,X

|1EC716| LDA.w $0E20,X
|1EC719| CMP.b #$83 ; SPRITE 83
|1EC71B| BNE .exit

|1EC71D| STZ.w $0CAA,X

.exit
|1EC720| RTL

;===================================================================================================

pool Mimic

.speed_x
|1EC721| db   0,  16, -16,   0,   0,  13, -13,   0
|1EC729| db   0,  13, -13,   0,   0,   0,   0,   0

|1EC731| db   0, -24,  24,   0,   0, -16,  16,   0
|1EC739| db   0, -16,  16,   0,   0,   0,   0,   0

.speed_y
|1EC741| db   0,   0,   0,   0, -16,  -5,  -5,   0
|1EC749| db  16,  13,  13,   0,   0,   0,   0,   0

|1EC751| db   0,   0,   0,   0, -24, -16, -16,   0
|1EC759| db  24,  16,  16,   0,   0,   0,   0,   0

.direction
|1EC761| db $00, $00, $01, $00, $03, $03, $03, $00
|1EC769| db $02, $02, $02, $00, $00, $00, $00, $00

|1EC771| db $00, $01, $00, $00, $03, $03, $03, $00
|1EC779| db $02, $02, $02, $00, $00, $00, $00, $00

.anim_step
|1EC781| db $08, $06, $00, $03, $09, $07, $01, $04

|1EC789| db $08, $06, $00, $03, $09, $07, $02, $05

endpool

;===================================================================================================

Mimic_Stationary:
|1EC791| STZ.w $0D90,X

|1EC794| JSR CheckDamageToAndFromLink_bank1E
|1EC797| JSR CheckSpriteTileCollision_bank1E

|1EC79A| RTS

;===================================================================================================

Sprite_83_GreenEyegore:
Sprite_84_RedEyegore:
|1EC79B| LDA.w $0DA0,X
|1EC79E| BNE Mimic

|1EC7A0| JMP.w Eyegore

;===================================================================================================

Mimic:
|1EC7A3| JSL SpriteDraw_Mimic
|1EC7A7| JSR CheckIfActive_bank1E
|1EC7AA| JSR HandleSpriteRecoil_bank1E

|1EC7AD| LDA.w $0E00,X
|1EC7B0| BEQ .dont_shoot

|1EC7B2| CMP.b #$08
|1EC7B4| BNE .dont_shoot

|1EC7B6| JSL Sprite_SpawnFirePhlegm

;---------------------------------------------------------------------------------------------------

.dont_shoot
|1EC7BA| LDA.w $0048
|1EC7BD| CMP.b #$00
|1EC7BF| BNE Mimic_Stationary

|1EC7C1| LDY.w $0E20,X

|1EC7C4| LDA.b $F0
|1EC7C6| AND.b #$0F
|1EC7C8| BEQ Mimic_Stationary

|1EC7CA| CPY.b #$84 ; SPRITE 84
|1EC7CC| BNE .not_red_mimic

|1EC7CE| ORA.b #$10

;---------------------------------------------------------------------------------------------------

.not_red_mimic
|1EC7D0| TAY

|1EC7D1| LDA.w Mimic.direction,Y
|1EC7D4| STA.w $0DE0,X

|1EC7D7| LDA.w Mimic.speed_x,Y
|1EC7DA| STA.w $0D50,X

|1EC7DD| LDA.w Mimic.speed_y,Y
|1EC7E0| STA.w $0D40,X

|1EC7E3| LDA.w $0E70,X
|1EC7E6| BNE .tile_collision

|1EC7E8| JSR MoveSpriteXY_bank1E

.tile_collision
|1EC7EB| JSR CheckDamageToAndFromLink_bank1E
|1EC7EE| JSR CheckSpriteTileCollision_bank1E

|1EC7F1| INC.w $0E80,X

|1EC7F4| LDA.w $0E80,X
|1EC7F7| AND.b #$0C
|1EC7F9| ORA.w $0DE0,X
|1EC7FC| TAY

|1EC7FD| LDA.w Mimic.anim_step,Y
|1EC800| STA.w $0DC0,X

|1EC803| LDA.w $0E20,X
|1EC806| CMP.b #$84 ; SPRITE 84
|1EC808| BNE .dont_prep_shot

|1EC80A| JSR GetDirectionTowardsLink_bank1E

|1EC80D| LDA.b $0F
|1EC80F| CLC
|1EC810| ADC.b #$08

|1EC812| CMP.b #$10
|1EC814| BCC .link_in_sight

|1EC816| LDA.b $0E
|1EC818| CLC
|1EC819| ADC.b #$08

|1EC81B| CMP.b #$10
|1EC81D| BCS .dont_prep_shot

;---------------------------------------------------------------------------------------------------

.link_in_sight
|1EC81F| TYA
|1EC820| CMP.w $0DE0,X
|1EC823| BNE .dont_prep_shot

|1EC825| LDA.w $0D90,X
|1EC828| AND.b #$1F
|1EC82A| BNE .need_to_charge

|1EC82C| LDA.b #$10
|1EC82E| STA.w $0E00,X

.need_to_charge
|1EC831| INC.w $0D90,X

|1EC834| RTS

.dont_prep_shot
|1EC835| STZ.w $0D90,X

|1EC838| RTS

;===================================================================================================

Eyegore:
|1EC839| JSR SpriteDraw_Eyegore
|1EC83C| JSR CheckIfActive_bank1E
|1EC83F| JSR HandleSpriteRecoil_bank1E
|1EC842| JSR CheckDamageToAndFromLink_bank1E

|1EC845| LDA.w $0E60,X
|1EC848| ORA.b #$40
|1EC84A| STA.w $0E60,X

|1EC84D| LDA.w $0CAA,X
|1EC850| ORA.b #$04
|1EC852| STA.w $0CAA,X

|1EC855| LDA.w $0D80,X
|1EC858| JSL JumpTableLocal
|1EC85C| dw Eyegore_Dormant
|1EC85E| dw Eyegore_WakingUp
|1EC860| dw Eyegore_Chase
|1EC862| dw Eyegore_GoToSleep

;===================================================================================================

EyegoreMovementTimer:
|1EC864| db  96, 128, 160, 128

;---------------------------------------------------------------------------------------------------

Eyegore_Dormant:
|1EC868| LDA.w $0DF0,X
|1EC86B| BNE .exit

|1EC86D| JSR GetDirectionTowardsLink_bank1E

|1EC870| LDA.b $0E
|1EC872| CLC
|1EC873| ADC.b #$30

|1EC875| CMP.b #$60
|1EC877| BCS .exit

|1EC879| LDA.b $0F
|1EC87B| CLC
|1EC87C| ADC.b #$30

|1EC87E| CMP.b #$60
|1EC880| BCS .exit

|1EC882| INC.w $0D80,X

|1EC885| LDA.b #$3F
|1EC887| STA.w $0DF0,X

.exit
|1EC88A| RTS

;===================================================================================================

pool Eyegore_WakingUp

.anim_step
|1EC88B| db $02, $02, $02, $02
|1EC88F| db $01, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Eyegore_WakingUp:
|1EC893| LDA.w $0DF0,X
|1EC896| BNE .waking_up

|1EC898| JSR GetDirectionTowardsLink_bank1E
|1EC89B| TYA
|1EC89C| STA.w $0DE0,X

|1EC89F| INC.w $0D80,X

|1EC8A2| JSL GetRandomNumber
|1EC8A6| AND.b #$03
|1EC8A8| TAY

|1EC8A9| LDA.w EyegoreMovementTimer,Y
|1EC8AC| STA.w $0DF0,X

|1EC8AF| RTS

;---------------------------------------------------------------------------------------------------

.waking_up
|1EC8B0| LSR A
|1EC8B1| LSR A
|1EC8B2| LSR A
|1EC8B3| TAY

|1EC8B4| LDA.w .anim_step,Y
|1EC8B7| STA.w $0DC0,X

|1EC8BA| RTS

;===================================================================================================

pool Eyegore_Chase

.anim_step
|1EC8BB| db $07, $05, $02, $09, $08, $06, $03, $0A
|1EC8C3| db $07, $05, $02, $09, $08, $06, $04, $0B

endpool

;---------------------------------------------------------------------------------------------------

Eyegore_Chase:
|1EC8CB| LDA.w $0E60,X
|1EC8CE| AND.b #$BF
|1EC8D0| STA.w $0E60,X

|1EC8D3| LDA.w $0E20,X
|1EC8D6| CMP.b #$84 ; SPRITE 84
|1EC8D8| BEQ .not_red

|1EC8DA| LDA.w $0CAA,X
|1EC8DD| AND.b #$FB
|1EC8DF| STA.w $0CAA,X

.not_red
|1EC8E2| LDA.w $0DF0,X
|1EC8E5| BNE .continue_chase

|1EC8E7| LDA.b #$3F
|1EC8E9| STA.w $0DF0,X

|1EC8EC| INC.w $0D80,X

|1EC8EF| STZ.w $0DC0,X

|1EC8F2| RTS

;---------------------------------------------------------------------------------------------------

.continue_chase
|1EC8F3| TXA
|1EC8F4| EOR.b $1A
|1EC8F6| AND.b #$1F
|1EC8F8| BNE .dont_turn

|1EC8FA| JSR GetDirectionTowardsLink_bank1E
|1EC8FD| TYA
|1EC8FE| STA.w $0DE0,X

.dont_turn
|1EC901| LDY.w $0DE0,X

|1EC904| LDA.w Sixteen_X,Y
|1EC907| STA.w $0D50,X

|1EC90A| LDA.w Sixteen_Y,Y
|1EC90D| STA.w $0D40,X

|1EC910| LDA.w $0E70,X
|1EC913| BNE .tile_collision

|1EC915| JSR MoveSpriteXY_bank1E

;---------------------------------------------------------------------------------------------------

.tile_collision
|1EC918| JSR CheckSpriteTileCollision_bank1E

|1EC91B| INC.w $0E80,X

|1EC91E| LDA.w $0E80,X
|1EC921| AND.b #$0C
|1EC923| ORA.w $0DE0,X
|1EC926| TAY

|1EC927| LDA.w .anim_step,Y
|1EC92A| STA.w $0DC0,X

|1EC92D| RTS

;===================================================================================================

pool Eyegore_GoToSleep

.anim_step
|1EC92E| db $00, $00, $01, $01, $02, $02, $02, $02

endpool

;---------------------------------------------------------------------------------------------------

Eyegore_GoToSleep:
|1EC936| LDA.w $0DF0,X
|1EC939| BNE .closing_eye

|1EC93B| STZ.w $0D80,X

|1EC93E| LDA.b #$60
|1EC940| STA.w $0DF0,X

|1EC943| RTS

.closing_eye
|1EC944| LSR A
|1EC945| LSR A
|1EC946| LSR A
|1EC947| TAY

|1EC948| LDA.w .anim_step,Y
|1EC94B| STA.w $0DC0,X

|1EC94E| RTS

;===================================================================================================

pool SpriteDraw_Eyegore

.oam_groups
|1EC94F| dw  -4,  -4 : db $A2, $00, $00, $02
|1EC957| dw   4,  -4 : db $A2, $40, $00, $02
|1EC95F| dw  -4,   4 : db $9C, $00, $00, $02
|1EC967| dw   4,   4 : db $9C, $40, $00, $02

|1EC96F| dw  -4,  -4 : db $A4, $00, $00, $02
|1EC977| dw   4,  -4 : db $A4, $40, $00, $02
|1EC97F| dw  -4,   4 : db $9C, $00, $00, $02
|1EC987| dw   4,   4 : db $9C, $40, $00, $02

|1EC98F| dw  -4,  -4 : db $8C, $00, $00, $02
|1EC997| dw   4,  -4 : db $8C, $40, $00, $02
|1EC99F| dw  -4,   4 : db $9C, $00, $00, $02
|1EC9A7| dw   4,   4 : db $9C, $40, $00, $02

|1EC9AF| dw  -4,  -3 : db $8C, $00, $00, $02
|1EC9B7| dw  12,  -3 : db $8C, $40, $00, $00
|1EC9BF| dw  -4,  13 : db $BC, $00, $00, $00
|1EC9C7| dw   4,   5 : db $8A, $40, $00, $02

|1EC9CF| dw  -4,  -3 : db $8C, $00, $00, $00
|1EC9D7| dw   4,  -3 : db $8C, $40, $00, $02
|1EC9DF| dw  -4,   5 : db $8A, $00, $00, $02
|1EC9E7| dw  12,  13 : db $BC, $40, $00, $00

|1EC9EF| dw   0,  -4 : db $AA, $00, $00, $02
|1EC9F7| dw   0,   4 : db $A6, $00, $00, $02
|1EC9FF| dw   0,  -4 : db $AA, $00, $00, $02
|1ECA07| dw   0,   4 : db $A6, $00, $00, $02

|1ECA0F| dw   0,  -3 : db $AA, $00, $00, $02
|1ECA17| dw   0,   4 : db $A8, $00, $00, $02
|1ECA1F| dw   0,  -3 : db $AA, $00, $00, $02
|1ECA27| dw   0,   4 : db $A8, $00, $00, $02

|1ECA2F| dw   0,  -4 : db $AA, $40, $00, $02
|1ECA37| dw   0,   4 : db $A6, $40, $00, $02
|1ECA3F| dw   0,  -4 : db $AA, $40, $00, $02
|1ECA47| dw   0,   4 : db $A6, $40, $00, $02

|1ECA4F| dw   0,  -3 : db $AA, $40, $00, $02
|1ECA57| dw   0,   4 : db $A8, $40, $00, $02
|1ECA5F| dw   0,  -3 : db $AA, $40, $00, $02
|1ECA67| dw   0,   4 : db $A8, $40, $00, $02

|1ECA6F| dw  -4,  -4 : db $8E, $00, $00, $02
|1ECA77| dw   4,  -4 : db $8E, $40, $00, $02
|1ECA7F| dw  -4,   4 : db $9E, $00, $00, $02
|1ECA87| dw   4,   4 : db $9E, $40, $00, $02

|1ECA8F| dw  -4,  -3 : db $8E, $00, $00, $02
|1ECA97| dw  12,  -3 : db $8E, $40, $00, $00
|1ECA9F| dw  -4,  13 : db $BD, $00, $00, $00
|1ECAA7| dw   4,   5 : db $A0, $40, $00, $02

|1ECAAF| dw  -4,  -3 : db $8E, $00, $00, $00
|1ECAB7| dw   4,  -3 : db $8E, $40, $00, $02
|1ECABF| dw  -4,   5 : db $A0, $00, $00, $02
|1ECAC7| dw  12,  13 : db $BD, $40, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Eyegore:
|1ECACF| LDA.b #$00
|1ECAD1| XBA
|1ECAD2| LDA.w $0DC0,X

|1ECAD5| REP #$20

|1ECAD7| ASL A
|1ECAD8| ASL A
|1ECAD9| ASL A
|1ECADA| ASL A
|1ECADB| ASL A

|1ECADC| ADC.w #.oam_groups
|1ECADF| STA.b $08

|1ECAE1| SEP #$20

|1ECAE3| LDA.b #$04
|1ECAE5| JSR TabulatedSpriteDraw_bank1E

|1ECAE8| LDA.w $0F00,X
|1ECAEB| BNE .exit

|1ECAED| LDA.b #$0E
|1ECAEF| JSL DrawSpriteShadow_custom_long

.exit
|1ECAF3| RTS

;===================================================================================================

pool SpritePrep_AntifairyCircle

.offset_x_low
|1ECAF4| db  10,  20,  10

.offset_x_high
|1ECAF7| db   0,   0,   0

.offset_y_low
|1ECAFA| db -10,   0,  10

.offset_y_high
|1ECAFD| db  -1,   0,   0

;---------------------------------------------------------------------------------------------------

.speed_x
|1ECB00| db  18,   0, -18

.polarity_x
|1ECB03| db $01, $01, $00

.speed_y
|1ECB06| db   0,  18,   0

.polarity_y
|1ECB09| db $00, $01, $01

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_AntifairyCircle:
|1ECB0C| LDA.w $0D10,X
|1ECB0F| SEC
|1ECB10| SBC.b #$0A
|1ECB12| STA.w $0D10,X

|1ECB15| LDA.w $0D30,X
|1ECB18| SBC.b #$00
|1ECB1A| STA.w $0D30,X

|1ECB1D| LDA.b #$EE
|1ECB1F| STA.w $0D40,X

|1ECB22| LDA.b #$00
|1ECB24| STA.w $0D50,X

|1ECB27| LDA.b #$00
|1ECB29| STA.w $0D90,X

|1ECB2C| LDA.b #$00
|1ECB2E| STA.w $0DA0,X

|1ECB31| LDA.b #$02
|1ECB33| STA.w $0FB5

;---------------------------------------------------------------------------------------------------

.next_bubble
|1ECB36| LDA.b #$82 ; SPRITE 82
|1ECB38| JSL SpawnSpriteDynamically
|1ECB3C| BMI .no_space

|1ECB3E| PHX

|1ECB3F| LDX.w $0FB5

|1ECB42| LDA.b $00
|1ECB44| CLC
|1ECB45| ADC.l .offset_x_low,X
|1ECB49| STA.w $0D10,Y

|1ECB4C| LDA.b $01
|1ECB4E| ADC.l .offset_x_high,X
|1ECB52| STA.w $0D30,Y

|1ECB55| LDA.b $02
|1ECB57| CLC
|1ECB58| ADC.l .offset_y_low,X
|1ECB5C| STA.w $0D00,Y

|1ECB5F| LDA.b $03
|1ECB61| ADC.l .offset_y_high,X
|1ECB65| STA.w $0D20,Y

|1ECB68| LDA.l .speed_x,X
|1ECB6C| STA.w $0D50,Y

|1ECB6F| LDA.l .speed_y,X
|1ECB73| STA.w $0D40,Y

|1ECB76| LDA.l .polarity_x,X
|1ECB7A| STA.w $0D90,Y

|1ECB7D| LDA.l .polarity_y,X
|1ECB81| STA.w $0DA0,Y

|1ECB84| PLX

.no_space
|1ECB85| DEC.w $0FB5
|1ECB88| BPL .next_bubble

|1ECB8A| RTL

;===================================================================================================

UNREACHABLE_1ECB8B:
|1ECB8B| db $00, $01, $00, $01, $00, $00, $40, $40

;===================================================================================================

pool Sprite_82_AntifairyCircle

.speed
|1ECB93| db   1,   -1

.speed_max
|1ECB95| db  18,  -18

endpool

;---------------------------------------------------------------------------------------------------

Sprite_82_AntifairyCircle:
|1ECB97| JSL SpriteDraw_Antifairy
|1ECB9B| JSR CheckIfActive_bank1E

|1ECB9E| LDA.w $0D90,X
|1ECBA1| AND.b #$01
|1ECBA3| TAY

|1ECBA4| LDA.w $0D50,X
|1ECBA7| CLC
|1ECBA8| ADC.w .speed,Y
|1ECBAB| STA.w $0D50,X

|1ECBAE| CMP.w .speed_max,Y
|1ECBB1| BNE .not_at_max_x

|1ECBB3| INC.w $0D90,X

.not_at_max_x
|1ECBB6| LDA.w $0DA0,X
|1ECBB9| AND.b #$01
|1ECBBB| TAY

|1ECBBC| LDA.w $0D40,X
|1ECBBF| CLC
|1ECBC0| ADC.w .speed,Y
|1ECBC3| STA.w $0D40,X

|1ECBC6| CMP.w .speed_max,Y
|1ECBC9| BNE .not_at_max_y

|1ECBCB| INC.w $0DA0,X

.not_at_max_y
|1ECBCE| JSR MoveSpriteXY_bank1E

|1ECBD1| LDA.w $0D50,X
|1ECBD4| BEQ .keep_circling

|1ECBD6| LDA.w $0D40,X
|1ECBD9| BEQ .keep_circling

|1ECBDB| JSL CheckIfRoomIsClear
|1ECBDF| BCC .keep_circling

|1ECBE1| LDA.b #$15 ; SPRITE 15
|1ECBE3| STA.w $0E20,X

|1ECBE6| LDA.b #$10
|1ECBE8| LDY.w $0D50,X
|1ECBEB| BPL .use_positive_x

|1ECBED| LDA.b #$F0

.use_positive_x
|1ECBEF| STA.w $0D50,X

|1ECBF2| LDA.b #$10

|1ECBF4| LDY.w $0D40,X
|1ECBF7| BPL .use_positive_y

|1ECBF9| LDA.b #$F0

.use_positive_y
|1ECBFB| STA.w $0D40,X

.keep_circling
|1ECBFE| JSR CheckDamageToLink_bank1E

|1ECC01| RTS

;===================================================================================================

Sprite_81_Hover:
|1ECC02| LDA.w $0B89,X
|1ECC05| ORA.b #$30
|1ECC07| STA.w $0B89,X

|1ECC0A| JSL SpriteDraw_SingleLarge_long
|1ECC0E| JSR CheckIfActive_bank1E

|1ECC11| LDA.w $0EA0,X
|1ECC14| BEQ .not_recoiling

|1ECC16| STZ.w $0D80,X

.not_recoiling
|1ECC19| JSR HandleSpriteRecoil_bank1E
|1ECC1C| JSR CheckDamageToAndFromLink_bank1E

|1ECC1F| LDA.w $0E70,X
|1ECC22| BNE .tile_collision

|1ECC24| JSR MoveSpriteXY_bank1E

.tile_collision
|1ECC27| JSR CheckSpriteTileCollision_bank1E

|1ECC2A| INC.w $0E80,X

|1ECC2D| LDA.w $0E80,X
|1ECC30| LSR A
|1ECC31| LSR A
|1ECC32| LSR A
|1ECC33| AND.b #$02
|1ECC35| STA.w $0DC0,X

|1ECC38| LDA.w $0D80,X
|1ECC3B| JSL JumpTableLocal
|1ECC3F| dw Hover_Idle
|1ECC41| dw Hover_Move

;===================================================================================================

pool Hover_Idle

.flip
|1ECC43| db $40, $00, $40, $00

endpool

;---------------------------------------------------------------------------------------------------

Hover_Idle:
|1ECC47| LDA.w $0DF0,X
|1ECC4A| BNE .exit

|1ECC4C| INC.w $0D80,X

|1ECC4F| JSR GetXDisplacementFromLink_bank1E
|1ECC52| STY.b $0C

|1ECC54| JSR GetYDisplacementFromLink_bank1E

|1ECC57| TYA
|1ECC58| ASL A
|1ECC59| ORA.b $0C
|1ECC5B| STA.w $0DE0,X

|1ECC5E| TAY

|1ECC5F| LDA.w $0F50,X
|1ECC62| AND.b #$BF
|1ECC64| ORA.w .flip,Y
|1ECC67| STA.w $0F50,X

|1ECC6A| JSL GetRandomNumber
|1ECC6E| AND.b #$0F
|1ECC70| ADC.b #$0C
|1ECC72| STA.w $0DF0,X

|1ECC75| JSR ZeroVelocityXY_bank1E

.exit
|1ECC78| RTS

;===================================================================================================

pool Hover_Move

.accel_x
|1ECC79| db  1, -1,  1, -1

.accel_y
|1ECC7D| db  1,  1, -1, -1

.decel_x
|1ECC81| db -1,  1, -1,  1

.decel_y
|1ECC85| db -1, -1,  1,  1

endpool

;---------------------------------------------------------------------------------------------------

Hover_Move:
|1ECC89| LDA.w $0DF0,X
|1ECC8C| BEQ .decelerate

|1ECC8E| LDY.w $0DE0,X

|1ECC91| LDA.w $0D50,X
|1ECC94| CLC
|1ECC95| ADC.w .accel_x,Y
|1ECC98| STA.w $0D50,X

|1ECC9B| LDA.w $0D40,X
|1ECC9E| CLC
|1ECC9F| ADC.w .accel_y,Y
|1ECCA2| STA.w $0D40,X

|1ECCA5| LDA.w $0E80,X
|1ECCA8| LSR A
|1ECCA9| LSR A
|1ECCAA| LSR A
|1ECCAB| AND.b #$01
|1ECCAD| STA.w $0DC0,X

|1ECCB0| RTS

;---------------------------------------------------------------------------------------------------

.decelerate
|1ECCB1| LDY.w $0DE0,X

|1ECCB4| LDA.w $0D50,X
|1ECCB7| CLC
|1ECCB8| ADC.w .decel_x,Y
|1ECCBB| STA.w $0D50,X

|1ECCBE| LDA.w $0D40,X
|1ECCC1| CLC
|1ECCC2| ADC.w .decel_y,Y
|1ECCC5| STA.w $0D40,X

|1ECCC8| BNE .exit

|1ECCCA| STZ.w $0D80,X

|1ECCCD| LDA.b #$40
|1ECCCF| STA.w $0DF0,X

.exit
|1ECCD2| RTS

;===================================================================================================

Palettes_Crystal:
|1ECCD3| dw  $0000,  $3821,  $4463,  $54A5,  $5CE7,  $6D29,  $79AD,  $7E10

;---------------------------------------------------------------------------------------------------

CrystalCutscene_Initialize:
|1ECCE3| LDA.b #$33
|1ECCE5| STA.b $9A

|1ECCE7| LDA.b #$00
|1ECCE9| STA.l $7EC007
|1ECCED| STA.l $7EC009

|1ECCF1| PHX

|1ECCF2| JSL AssertTranslucencySwap
|1ECCF6| JSL PaletteFilter_Crystal

|1ECCFA| PLX

|1ECCFB| REP #$20

|1ECCFD| LDA.l Palettes_Crystal+0
|1ECD01| STA.l $7EC5E0

|1ECD05| LDA.l Palettes_Crystal+2
|1ECD09| STA.l $7EC5E2

|1ECD0D| LDA.l Palettes_Crystal+4
|1ECD11| STA.l $7EC5E4

|1ECD15| LDA.l Palettes_Crystal+6
|1ECD19| STA.l $7EC5E6

|1ECD1D| LDA.l Palettes_Crystal+8
|1ECD21| STA.l $7EC5E8

|1ECD25| LDA.l Palettes_Crystal+10
|1ECD29| STA.l $7EC5EA

|1ECD2D| LDA.l Palettes_Crystal+12
|1ECD31| STA.l $7EC5EC

|1ECD35| LDA.l Palettes_Crystal+14
|1ECD39| STA.l $7EC5EE

|1ECD3D| SEP #$30

|1ECD3F| INC.b $15

|1ECD41| JSR CrystalCutscene_SpawnMaiden
|1ECD44| JSR CrystalCutscene_InitializePolyhedral

|1ECD47| RTL

;===================================================================================================

CrystalCutscene_SpawnMaiden:
|1ECD48| LDY.b #$0F

|1ECD4A| LDA.b #$00

.next_sprite
|1ECD4C| STA.w $0DD0,Y

|1ECD4F| DEY
|1ECD50| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|1ECD52| LDA.b #$AB ; SPRITE AB
|1ECD54| JSL SpawnSpriteDynamically

|1ECD58| LDA.b $23
|1ECD5A| STA.w $0D30,Y

|1ECD5D| LDA.b $21
|1ECD5F| STA.w $0D20,Y

|1ECD62| LDA.b #$78
|1ECD64| STA.w $0D10,Y

|1ECD67| LDA.b #$7C
|1ECD69| STA.w $0D00,Y

|1ECD6C| LDA.b #$01
|1ECD6E| STA.w $0DE0,Y

|1ECD71| LDA.b #$0B
|1ECD73| STA.w $0F50,Y

|1ECD76| LDA.b #$00
|1ECD78| STA.w $0E80,Y
|1ECD7B| STA.w $0F20,Y

|1ECD7E| PHY

|1ECD7F| JSL TerminateSelectInteractives

|1ECD83| STZ.w $02E9

|1ECD86| TYA

|1ECD87| PLY

|1ECD88| STA.w $0D90,Y

;---------------------------------------------------------------------------------------------------

|1ECD8B| LDA.w $040C
|1ECD8E| CMP.b #$18 ; DUNGEON 18
|1ECD90| BNE .not_zelda

|1ECD92| LDA.b #$09
|1ECD94| STA.w $0F50,Y

|1ECD97| LDA.b #$01 ; FOLLOWER 01

|1ECD99| BRA .load_gfx

.not_zelda
|1ECD9B| LDA.b #$06 ; FOLLOWER 06

.load_gfx
|1ECD9D| STA.l $7EF3CC

|1ECDA1| PHX

|1ECDA2| JSL LoadFollowerGraphics

|1ECDA6| PLX

|1ECDA7| LDA.b #$00
|1ECDA9| STA.l $7EF3CC

|1ECDAD| STZ.w $0428

|1ECDB0| REP #$20

|1ECDB2| LDA.b $22
|1ECDB4| SEC
|1ECDB5| SBC.b $E2
|1ECDB7| EOR.w #$FFFF
|1ECDBA| SEC
|1ECDBB| ADC.w #$0079
|1ECDBE| STA.w $0422

|1ECDC1| LDA.b $E6
|1ECDC3| AND.w #$00FF
|1ECDC6| STA.b $00

|1ECDC8| LDA.w #$0030
|1ECDCB| SEC
|1ECDCC| SBC.b $00
|1ECDCE| STA.w $0424

|1ECDD1| SEP #$30

|1ECDD3| LDA.b #$01
|1ECDD5| STA.w $0428

|1ECDD8| RTS

;===================================================================================================

CrystalCutscene_InitializePolyhedral:
|1ECDD9| LDA.b #$9C
|1ECDDB| STA.w $1F02

|1ECDDE| LDA.b #$01
|1ECDE0| STA.w $1F01
|1ECDE3| STA.w $012A
|1ECDE6| STA.w $1F00

|1ECDE9| LDA.b #$20
|1ECDEB| STA.w $1F06
|1ECDEE| STA.w $1F07
|1ECDF1| STA.w $1F08

|1ECDF4| STZ.w $1F03

|1ECDF7| LDA.b #$10
|1ECDF9| STA.w $1F04

|1ECDFC| STZ.b $1D

|1ECDFE| LDA.b #$16
|1ECE00| STA.b $1C

|1ECE02| RTS

;===================================================================================================

Sprite_AB_CrystalMaiden:
|1ECE03| REP #$20

|1ECE05| LDA.w $0FD8
|1ECE08| SEC
|1ECE09| SBC.w $0422
|1ECE0C| STA.w $0FD8

|1ECE0F| LDA.w $0FDA
|1ECE12| SEC
|1ECE13| SBC.w $0424
|1ECE16| STA.w $0FDA

|1ECE19| SEP #$30

|1ECE1B| LDA.w $0D80,X
|1ECE1E| CMP.b #$03
|1ECE20| BCC .invisible

|1ECE22| JSL SpriteDraw_Maiden

.invisible
|1ECE26| LDA.b #$01
|1ECE28| STA.w $012A

|1ECE2B| LDA.w $1F00
|1ECE2E| BNE .exit

|1ECE30| JSR CrystalMaiden_RunCutscene

|1ECE33| LDA.b #$01
|1ECE35| STA.w $1F00

.exit
|1ECE38| RTS

;===================================================================================================

CrystalMaiden_RunCutscene:
|1ECE39| INC.w $0E90,X

|1ECE3C| LDA.w $1F05
|1ECE3F| CLC
|1ECE40| ADC.b #$06
|1ECE42| STA.w $1F05

|1ECE45| LDA.b $11
|1ECE47| BEQ .continue

|1ECE49| RTS

.continue
|1ECE4A| LDA.w $0D80,X
|1ECE4D| JSL JumpTableLocal
|1ECE51| dw CrystalMaiden_DisableSubscreen
|1ECE53| dw CrystalMaiden_EnableSubscreen
|1ECE55| dw CrystalMaiden_WaitForCrystalGrowth
|1ECE57| dw CrystalMaiden_Emerge
|1ECE59| dw CrystalMaiden_DelaySpeech
|1ECE5B| dw CrystalMaiden_GiveSpeech
|1ECE5D| dw CrystalMaiden_DoYouUnderstand
|1ECE5F| dw CrystalMaiden_GoodLuckKid
|1ECE61| dw CrystalMaiden_KickOutOfDungeon

;===================================================================================================

CrystalMaiden_DisableSubscreen:
|1ECE63| STZ.b $1D

|1ECE65| INC.w $0D80,X

|1ECE68| RTS

;===================================================================================================

CrystalMaiden_EnableSubscreen:
|1ECE69| LDA.b #$01
|1ECE6B| STA.b $1D

|1ECE6D| INC.w $0D80,X

|1ECE70| RTS

;===================================================================================================

CrystalMaiden_WaitForCrystalGrowth:
|1ECE71| LDA.w $1F02
|1ECE74| CMP.b #$06
|1ECE76| BCS .wait

|1ECE78| STZ.w $1F02

|1ECE7B| INC.w $0D80,X

|1ECE7E| RTS

.wait
|1ECE7F| SBC.b #$03
|1ECE81| STA.w $1F02

|1ECE84| CMP.b #$40
|1ECE86| BCC .exit

|1ECE88| PHX

|1ECE89| LDA.w $0D90,X
|1ECE8C| TAX

|1ECE8D| JSL AncillaAdd_SwordChargeSparkle_preserveX

|1ECE91| PLX

.exit
|1ECE92| RTS

;===================================================================================================

CrystalMaiden_Emerge:
|1ECE93| INC.w $0D80,X

;===================================================================================================

CrystalMaiden_DelaySpeech:
|1ECE96| LDA.w $0E90,X
|1ECE99| AND.b #$01
|1ECE9B| BNE .exit

|1ECE9D| PHX

|1ECE9E| JSL PaletteFilter_Sprite5Left

|1ECEA2| PLX

|1ECEA3| LDA.l $7EC007
|1ECEA7| BNE .exit

|1ECEA9| INC.w $0D80,X

|1ECEAC| LDA.b #$01
|1ECEAE| STA.w $02E4

|1ECEB1| STZ.w $02D8
|1ECEB4| STZ.w $02DA

|1ECEB7| STZ.b $2E
|1ECEB9| STZ.b $2F

.exit
|1ECEBB| RTS

;===================================================================================================

CrystalMaiden_Messages:
|1ECEBC| dw $0133 ; MESSAGE 0133 - Swamp
|1ECEBE| dw $0132 ; MESSAGE 0132 - PoD
|1ECEC0| dw $0137 ; MESSAGE 0137 - Mire
|1ECEC2| dw $0134 ; MESSAGE 0134 - Skull
|1ECEC4| dw $0136 ; MESSAGE 0136 - Ice
|1ECEC6| dw $0132 ; MESSAGE 0132 - Hera
|1ECEC8| dw $0135 ; MESSAGE 0135 - Thieves
|1ECECA| dw $0138 ; MESSAGE 0138 - Turtle Rock
|1ECECC| dw $013C ; MESSAGE 013C - Turtle Rock every crystal

;---------------------------------------------------------------------------------------------------

CrystalMaiden_GiveSpeech:
|1ECECE| LDA.w $040C
|1ECED1| SEC
|1ECED2| SBC.b #$0A
|1ECED4| TAY

|1ECED5| CPY.b #$02
|1ECED7| BNE .dont_update_map

|1ECED9| LDA.l $7EF3C7

|1ECEDD| CMP.b #$07
|1ECEDF| BCS .dont_update_map

|1ECEE1| LDA.b #$07
|1ECEE3| STA.l $7EF3C7

.dont_update_map
|1ECEE7| CPY.b #$0E
|1ECEE9| BNE .not_special_zelda_message

|1ECEEB| LDA.l $7EF37A
|1ECEEF| AND.b #$7F
|1ECEF1| CMP.b #$7F
|1ECEF3| BEQ .not_special_zelda_message

|1ECEF5| LDY.b #$10

.not_special_zelda_message
|1ECEF7| LDA.w CrystalMaiden_Messages+0,Y
|1ECEFA| XBA

|1ECEFB| LDA.w CrystalMaiden_Messages+1,Y
|1ECEFE| TAY

|1ECEFF| XBA

|1ECF00| JSL ShowMessageUnconditional

|1ECF04| INC.w $0D80,X

|1ECF07| LDA.l $7EF37A
|1ECF0B| AND.b #$7F
|1ECF0D| CMP.b #$7F
|1ECF0F| BNE .exit

|1ECF11| LDA.b #$08
|1ECF13| STA.l $7EF3C7

.exit
|1ECF17| RTS

;===================================================================================================

CrystalMaiden_DoYouUnderstand:
|1ECF18| LDA.b #$3A ; MESSAGE 013A
|1ECF1A| LDY.b #$01
|1ECF1C| JSL ShowMessageUnconditional

|1ECF20| INC.w $0D80,X

|1ECF23| RTS

;===================================================================================================

CrystalMaiden_GoodLuckKid:
|1ECF24| LDA.w $1CE8
|1ECF27| BEQ .speech_was_CRYSTAL_clear

|1ECF29| LDA.b #$05
|1ECF2B| STA.w $0D80,X

|1ECF2E| RTS

.speech_was_CRYSTAL_clear
|1ECF2F| LDA.b #$39 ; MESSAGE 0139
|1ECF31| LDY.b #$01
|1ECF33| JSL ShowMessageUnconditional

|1ECF37| INC.w $0D80,X

|1ECF3A| RTS

;===================================================================================================

CrystalMaiden_KickOutOfDungeon:
|1ECF3B| STZ.b $1D

|1ECF3D| PHX

|1ECF3E| JSL PrepareDungeonExitFromBossFight

|1ECF42| PLX

|1ECF43| STZ.w $0DD0,X

|1ECF46| RTS

;===================================================================================================

Sprite_7D_BigSpike:
|1ECF47| JSR SpriteDraw_BigSpike
|1ECF4A| JSR CheckIfActive_bank1E
|1ECF4D| JSR CheckDamageToAndFromLink_bank1E

|1ECF50| LDA.w $0D80,X
|1ECF53| BNE .in_motion

|1ECF55| JSR GetDirectionTowardsLink_bank1E
|1ECF58| TYA
|1ECF59| STA.w $0DE0,X

|1ECF5C| LDA.b $0F
|1ECF5E| CLC
|1ECF5F| ADC.b #$10

|1ECF61| CMP.b #$20
|1ECF63| BCS .not_close
|1ECF65| BRA .start_movement

.not_close
|1ECF67| LDA.b $0E
|1ECF69| CLC
|1ECF6A| ADC.b #$10

|1ECF6C| CMP.b #$20
|1ECF6E| BCS .also_not_close

.start_movement
|1ECF70| LDA.w .timer,Y
|1ECF73| STA.w $0DF0,X

|1ECF76| INC.w $0D80,X

|1ECF79| LDA.w .forward_speed_x,Y
|1ECF7C| STA.w $0D50,X

|1ECF7F| LDA.w .forward_speed_y,Y
|1ECF82| STA.w $0D40,X

.also_not_close
|1ECF85| RTS

;---------------------------------------------------------------------------------------------------

.forward_speed_x
|1ECF86| db  32, -32,   0,   0

.backward_speed_x
|1ECF8A| db -16,  16,   0,   0

.forward_speed_y
|1ECF8E| db   0,   0,  32, -32

.backward_speed_y
|1ECF92| db   0,   0, -16,  16

.timer
|1ECF96| db  64,  64,  56,  56

;===================================================================================================

.in_motion
|1ECF9A| CMP.b #$01
|1ECF9C| BNE .retracting

|1ECF9E| JSR CheckSpriteTileCollision_bank1E
|1ECFA1| BNE .tile_collision

|1ECFA3| LDA.w $0DF0,X
|1ECFA6| BNE .still_moving

.tile_collision
|1ECFA8| INC.w $0D80,X

|1ECFAB| LDA.b #$60
|1ECFAD| STA.w $0DF0,X

.still_moving
|1ECFB0| JSR MoveSpriteXY_bank1E

|1ECFB3| RTS

;---------------------------------------------------------------------------------------------------

.retracting
|1ECFB4| LDA.w $0DF0,X
|1ECFB7| BNE .exit

|1ECFB9| LDY.w $0DE0,X

|1ECFBC| LDA.w .backward_speed_x,Y
|1ECFBF| STA.w $0D50,X

|1ECFC2| LDA.w .backward_speed_y,Y
|1ECFC5| STA.w $0D40,X

|1ECFC8| JSR MoveSpriteXY_bank1E

|1ECFCB| LDA.w $0D10,X
|1ECFCE| CMP.w $0D90,X
|1ECFD1| BNE .exit

|1ECFD3| LDA.w $0D00,X
|1ECFD6| CMP.w $0DB0,X
|1ECFD9| BNE .exit

|1ECFDB| STZ.w $0D80,X

.exit
|1ECFDE| RTS

;===================================================================================================

pool SpriteDraw_BigSpike

.oam_groups
|1ECFDF| dw  -8,  -8 : db $C4, $00, $00, $02
|1ECFE7| dw   8,  -8 : db $C4, $40, $00, $02
|1ECFEF| dw  -8,   8 : db $C4, $80, $00, $02
|1ECFF7| dw   8,   8 : db $C4, $C0, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_BigSpike:
|1ECFFF| REP #$20

|1ED001| LDA.w #.oam_groups
|1ED004| STA.b $08

|1ED006| LDA.w #$0004
|1ED009| STA.b $06

|1ED00B| SEP #$30

|1ED00D| JSL TabulatedSpriteDraw.preset_quantity

|1ED011| RTS

;===================================================================================================

pool Firebar

.offset_low
|1ED012| db -2,  2
|1ED014| db -1,  1

.offset_high
|1ED016| db -1,  0
|1ED018| db -1,  0

endpool

;---------------------------------------------------------------------------------------------------

Sprite_7E_Firebar_Clockwise:
Sprite_7F_Firebar_Counterclockwise:
|1ED01A| JSR Firebar_Main
|1ED01D| JSR CheckIfActive_bank1E

|1ED020| INC.w $0E80,X

|1ED023| LDA.w $0E20,X
|1ED026| SEC
|1ED027| SBC.b #$7E
|1ED029| TAY

|1ED02A| LDA.w $040C
|1ED02D| CMP.b #$12 ; DUNGEON 12
|1ED02F| BNE .not_ice_palace

|1ED031| INY
|1ED032| INY

.not_ice_palace
|1ED033| LDA.w $0D90,X
|1ED036| CLC
|1ED037| ADC.w Firebar.offset_low,Y
|1ED03A| STA.w $0D90,X

|1ED03D| LDA.w $0DA0,X
|1ED040| ADC.w Firebar.offset_high,Y
|1ED043| AND.b #$01
|1ED045| STA.w $0DA0,X

|1ED048| RTS

;===================================================================================================

Firebar_Main:
|1ED049| JSR GetScreenCoordinates_bank1E

|1ED04C| LDA.b $05
|1ED04E| STA.w $0FB6

|1ED051| LDA.b $00
|1ED053| STA.w $0FA8

|1ED056| LDA.b $02
|1ED058| STA.w $0FA9

|1ED05B| LDA.w $0D90,X
|1ED05E| STA.b $00

|1ED060| LDA.w $0DA0,X
|1ED063| STA.b $01

|1ED065| LDA.b #$40
|1ED067| STA.b $0F

|1ED069| PHX

;---------------------------------------------------------------------------------------------------

|1ED06A| REP #$30

|1ED06C| LDA.b $00
|1ED06E| AND.w #$01FF

|1ED071| LSR A
|1ED072| LSR A
|1ED073| LSR A
|1ED074| LSR A
|1ED075| LSR A
|1ED076| LSR A

|1ED077| STA.b $0A

|1ED079| LDA.b $00
|1ED07B| CLC
|1ED07C| ADC.w #$0080
|1ED07F| AND.w #$01FF
|1ED082| STA.b $02

|1ED084| LDA.b $00
|1ED086| AND.w #$00FF
|1ED089| ASL A
|1ED08A| TAX

|1ED08B| LDA.l TrigTable,X
|1ED08F| STA.b $04

|1ED091| LDA.b $02
|1ED093| AND.w #$00FF
|1ED096| ASL A
|1ED097| TAX

|1ED098| LDA.l TrigTable,X
|1ED09C| STA.b $06

;---------------------------------------------------------------------------------------------------

|1ED09E| SEP #$30

|1ED0A0| PLX

|1ED0A1| LDA.b $04
|1ED0A3| STA.w WRMPYA

|1ED0A6| LDA.b $0F

|1ED0A8| LDY.b $05
|1ED0AA| BNE .nonzero_a

|1ED0AC| STA.w WRMPYB

|1ED0AF| JSR NOP8

|1ED0B2| ASL.w RDMPYL
|1ED0B5| LDA.w RDMPYH
|1ED0B8| ADC.b #$00

.nonzero_a
|1ED0BA| STA.b $0E

|1ED0BC| LSR.b $01
|1ED0BE| BCC .dont_invert_a

|1ED0C0| EOR.b #$FF
|1ED0C2| INC A

.dont_invert_a
|1ED0C3| STA.b $04

;---------------------------------------------------------------------------------------------------

|1ED0C5| LDA.b $06
|1ED0C7| STA.w WRMPYA

|1ED0CA| LDA.b $0F

|1ED0CC| LDY.b $07
|1ED0CE| BNE .nonzero_b

|1ED0D0| STA.w WRMPYB

|1ED0D3| JSR NOP8

|1ED0D6| ASL.w RDMPYL
|1ED0D9| LDA.w RDMPYH
|1ED0DC| ADC.b #$00

.nonzero_b
|1ED0DE| STA.b $0F

|1ED0E0| LSR.b $03
|1ED0E2| BCC .dont_invert_b

|1ED0E4| EOR.b #$FF
|1ED0E6| INC A

.dont_invert_b
|1ED0E7| STA.b $06

;---------------------------------------------------------------------------------------------------

|1ED0E9| LDA.w $0E80,X

|1ED0EC| ASL A
|1ED0ED| ASL A
|1ED0EE| ASL A
|1ED0EF| ASL A

|1ED0F0| AND.b #$C0
|1ED0F2| ORA.w $0FB6
|1ED0F5| STA.b $0D

|1ED0F7| LDY.b #$00

|1ED0F9| LDA.b $04
|1ED0FB| CLC
|1ED0FC| ADC.w $0FA8
|1ED0FF| STA.b ($90),Y

|1ED101| LDA.b $06
|1ED103| CLC
|1ED104| ADC.w $0FA9

|1ED107| INY
|1ED108| STA.b ($90),Y

|1ED10A| LDA.b #$28
|1ED10C| INY
|1ED10D| STA.b ($90),Y

|1ED10F| LDA.b $0D
|1ED111| INY
|1ED112| STA.b ($90),Y

|1ED114| LDA.b #$02
|1ED116| STA.b ($92)

;---------------------------------------------------------------------------------------------------

|1ED118| LDY.b #$04

|1ED11A| PHX

|1ED11B| LDX.b #$02

.next_object_a
|1ED11D| LDA.b $0E
|1ED11F| STA.w WRMPYA

|1ED122| LDA.w .mutliplier,X
|1ED125| STA.w WRMPYB

|1ED128| JSR NOP8

|1ED12B| LDA.b $04
|1ED12D| ASL A
|1ED12E| LDA.w RDMPYH
|1ED131| BCC .dont_invert_c

|1ED133| EOR.b #$FF
|1ED135| INC A

.dont_invert_c
|1ED136| CLC
|1ED137| ADC.w $0FA8
|1ED13A| STA.b ($90),Y

|1ED13C| LDA.b $0F
|1ED13E| STA.w WRMPYA

|1ED141| LDA.w .mutliplier,X
|1ED144| STA.w WRMPYB

|1ED147| JSR NOP8

|1ED14A| LDA.b $06
|1ED14C| ASL A
|1ED14D| LDA.w RDMPYH
|1ED150| BCC .dont_invert_d

|1ED152| EOR.b #$FF
|1ED154| INC A

.dont_invert_d
|1ED155| CLC
|1ED156| ADC.w $0FA9

|1ED159| INY
|1ED15A| STA.b ($90),Y

|1ED15C| LDA.b #$28
|1ED15E| INY
|1ED15F| STA.b ($90),Y

|1ED161| LDA.b $0D
|1ED163| INY
|1ED164| STA.b ($90),Y

|1ED166| PHY

|1ED167| TYA
|1ED168| LSR A
|1ED169| LSR A
|1ED16A| TAY

|1ED16B| LDA.b #$02
|1ED16D| STA.b ($92),Y

|1ED16F| PLY
|1ED170| INY

|1ED171| DEX
|1ED172| BPL .next_object_a

;---------------------------------------------------------------------------------------------------

|1ED174| PLX

|1ED175| LDY.b #$FF
|1ED177| LDA.b #$03
|1ED179| JSL CorrectOAMEntries_long

|1ED17D| TXA
|1ED17E| EOR.b $1A
|1ED180| AND.b #$03

|1ED182| ORA.b $11
|1ED184| ORA.w $0FC1
|1ED187| BNE .exit

|1ED189| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_segment
|1ED18B| PHY

|1ED18C| TYA
|1ED18D| LSR A
|1ED18E| LSR A
|1ED18F| TAY

|1ED190| LDA.b ($92),Y
|1ED192| PLY
|1ED193| AND.b #$01
|1ED195| BNE .no_damage

|1ED197| LDA.b ($90),Y
|1ED199| CLC
|1ED19A| ADC.b $E2
|1ED19C| SEC
|1ED19D| SBC.b $22
|1ED19F| CLC
|1ED1A0| ADC.b #$0C

|1ED1A2| CMP.b #$18
|1ED1A4| BCS .no_damage

|1ED1A6| INY
|1ED1A7| LDA.b ($90),Y

|1ED1A9| DEY

|1ED1AA| CMP.b #$F0
|1ED1AC| BCS .no_damage

|1ED1AE| CLC
|1ED1AF| ADC.b $E8
|1ED1B1| SEC
|1ED1B2| SBC.b $20
|1ED1B4| CLC
|1ED1B5| ADC.b #$04

|1ED1B7| CMP.b #$10
|1ED1B9| BCS .no_damage

|1ED1BB| PHY
|1ED1BC| JSL AttemptDamageToLinkPlusRecoil_long
|1ED1C0| PLY

.no_damage
|1ED1C1| INY
|1ED1C2| INY
|1ED1C3| INY
|1ED1C4| INY

|1ED1C5| CPY.b #$10
|1ED1C7| BCC .next_segment

.exit
|1ED1C9| RTS

;---------------------------------------------------------------------------------------------------

.mutliplier
|1ED1CA| db $40, $80, $C0

;===================================================================================================

pool Sprite_80_Firesnake

.flip
|1ED1CD| db $00, $40, $80, $C0

endpool

;---------------------------------------------------------------------------------------------------

Sprite_80_Firesnake:
|1ED1D1| JSL SpriteDraw_SingleLarge_long
|1ED1D5| JSR CheckIfActive_bank1E
|1ED1D8| JSR HandleSpriteRecoil_bank1E

|1ED1DB| LDA.b $1A
|1ED1DD| LSR A
|1ED1DE| LSR A
|1ED1DF| AND.b #$03
|1ED1E1| TAY

|1ED1E2| LDA.w $0F50,X
|1ED1E5| AND.b #$3F
|1ED1E7| ORA.w .flip,Y
|1ED1EA| STA.w $0F50,X

|1ED1ED| LDA.w $0D90,X
|1ED1F0| BEQ .main

|1ED1F2| LDA.w $0DF0,X
|1ED1F5| STA.w $0BA0,X
|1ED1F8| BNE .exit

|1ED1FA| STZ.w $0DD0,X

.exit
|1ED1FD| RTS

;---------------------------------------------------------------------------------------------------

.speed_x
|1ED1FE| db  24, -24,   0,   0

.speed_y
|1ED202| db   0,   0,  24, -24

;---------------------------------------------------------------------------------------------------

.main
|1ED206| JSR CheckDamageToAndFromLink_bank1E
|1ED209| JSR SpawnFiresnakeSegment

|1ED20C| LDA.w $0E70,X
|1ED20F| BNE .tile_collision

|1ED211| JSR MoveSpriteXY_bank1E

.tile_collision
|1ED214| JSR CheckSpriteTileCollision_bank1E
|1ED217| BEQ .no_tile_collision

|1ED219| JSL GetRandomNumber
|1ED21D| LSR A
|1ED21E| LDA.w $0DE0,X

|1ED221| ROL A
|1ED222| TAY

|1ED223| LDA.w SharedDirections_Nice,Y
|1ED226| STA.w $0DE0,X

.no_tile_collision
|1ED229| LDY.w $0DE0,X

|1ED22C| LDA.w .speed_x,Y
|1ED22F| STA.w $0D50,X

|1ED232| LDA.w .speed_y,Y
|1ED235| STA.w $0D40,X

|1ED238| RTS

;===================================================================================================

SpawnFiresnakeSegment:
|1ED239| TXA
|1ED23A| EOR.b $1A
|1ED23C| AND.b #$07
|1ED23E| BNE .exit

|1ED240| PHX
|1ED241| TXY

|1ED242| LDX.b #$1D

.next_slot
|1ED244| LDA.l $7FF800,X
|1ED248| BEQ .free_slot

|1ED24A| DEX
|1ED24B| BPL .next_slot

|1ED24D| PLX

|1ED24E| RTS

;---------------------------------------------------------------------------------------------------

.free_slot
|1ED24F| LDA.b #$01 ; GARNISH 01
|1ED251| STA.l $7FF800,X
|1ED255| STA.w $0FB4

|1ED258| LDA.w $0D10,Y
|1ED25B| STA.l $7FF83C,X

|1ED25F| LDA.w $0D30,Y
|1ED262| STA.l $7FF878,X

|1ED266| LDA.w $0D00,Y
|1ED269| CLC
|1ED26A| ADC.b #$10
|1ED26C| STA.l $7FF81E,X

|1ED270| LDA.w $0D20,Y
|1ED273| ADC.b #$00
|1ED275| STA.l $7FF85A,X

|1ED279| LDA.b #$20
|1ED27B| STA.l $7FF90E,X

|1ED27F| TYA
|1ED280| STA.l $7FF92C,X

|1ED284| LDA.w $0F20,Y
|1ED287| STA.l $7FF968,X

|1ED28B| PLX

.exit
|1ED28C| RTS

;===================================================================================================

pool Sprite_7C_GreenStalfos

.direction
|1ED28D| db $04, $06, $00, $02

.flip
|1ED291| db $40, $00, $00, $00

.anim_step
|1ED295| db $00, $00, $01, $02

endpool

;---------------------------------------------------------------------------------------------------

Sprite_7C_GreenStalfos:
|1ED299| LDY.w $0DE0,X

|1ED29C| LDA.w $0F50,X
|1ED29F| AND.b #$BF
|1ED2A1| ORA.w .flip,Y
|1ED2A4| STA.w $0F50,X

|1ED2A7| LDA.w .anim_step,Y
|1ED2AA| STA.w $0DC0,X

|1ED2AD| JSL SpriteDraw_SingleLarge_long
|1ED2B1| JSR CheckIfActive_bank1E
|1ED2B4| JSR HandleSpriteRecoil_bank1E
|1ED2B7| JSR CheckDamageToAndFromLink_bank1E

|1ED2BA| STZ.w $0D90,X

|1ED2BD| JSR GetDirectionTowardsLink_bank1E

|1ED2C0| LDA.w .direction,Y
|1ED2C3| CMP.w $002F
|1ED2C6| BEQ .link_facing_me

|1ED2C8| TXA
|1ED2C9| EOR.b $1A
|1ED2CB| AND.b #$07
|1ED2CD| BNE .dont_turn

|1ED2CF| JSR GetDirectionTowardsLink_bank1E
|1ED2D2| TYA
|1ED2D3| STA.w $0DE0,X

|1ED2D6| LDA.w $0DA0,X
|1ED2D9| CMP.b #$04
|1ED2DB| BEQ .at_max

|1ED2DD| INC.w $0DA0,X

.at_max
|1ED2E0| JSL ApplySpeedTowardsLink_long

|1ED2E4| JSR GetXDisplacementFromLink_bank1E
|1ED2E7| TYA
|1ED2E8| STA.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.dont_turn
|1ED2EB| JSR MoveSpriteXY_bank1E

|1ED2EE| RTS

.link_facing_me
|1ED2EF| INC.w $0D90,X

|1ED2F2| TXA
|1ED2F3| EOR.b $1A
|1ED2F5| AND.b #$0F
|1ED2F7| BNE .dont_turn_b

|1ED2F9| LDA.w $0DA0,X
|1ED2FC| BEQ .at_min

|1ED2FE| DEC.w $0DA0,X

.at_min
|1ED301| JSL ApplySpeedTowardsLink_long

|1ED305| JSR GetXDisplacementFromLink_bank1E
|1ED308| TYA
|1ED309| STA.w $0DE0,X

.dont_turn_b
|1ED30C| JSR MoveSpriteXY_bank1E

|1ED30F| RTS

;===================================================================================================

Agahnim_Direction:
|1ED310| db $00, $00, $00, $00, $00, $00, $00, $00
|1ED318| db $00, $00, $05, $05, $00, $01, $01, $04
|1ED320| db $04, $00, $02, $02, $04, $04, $03, $02
|1ED328| db $02

;---------------------------------------------------------------------------------------------------

Agahnim_DirectionStepOffset:
|1ED329| db $02, $0A, $08, $00, $04, $06, $FA

;===================================================================================================

Sprite_7A_Agahnim:
|1ED330| JSR SpriteDraw_Agahnim

|1ED333| LDA.w $0F00,X
|1ED336| BEQ .active

|1ED338| LDA.b #$20
|1ED33A| STA.w $0DF0,X

|1ED33D| LDA.b #$00
|1ED33F| STA.w $0DC0,X

|1ED342| LDA.b #$03
|1ED344| STA.w $0DE0,X

.active
|1ED347| JSR CheckIfActive_bank1E
|1ED34A| JSR HandleSpriteRecoil_bank1E

|1ED34D| LDA.b #$01
|1ED34F| STA.w $0BA0,X

|1ED352| LDA.w $0D80,X
|1ED355| JSL JumpTableLocal
|1ED359| dw Agahnim_ChooseFirstMove

|1ED35B| dw Agahnim_HelloLightWorld
|1ED35D| dw Agahnim_EmergeFromShadow
|1ED35F| dw Agahnim_Attack
|1ED361| dw Agahnim_ChooseWarpSpot
|1ED363| dw Agahnim_MoveTowardsWarp

|1ED365| dw Agahnim_HelloDarkWorld
|1ED367| dw Agahnim_CreateClones
|1ED369| dw Agahnim_ExorciseGanon
|1ED36B| dw Agahnim_UncloneSelf

|1ED36D| dw Agahnim_SpinToPyramid

;===================================================================================================

pool Agahnim_SpinToPyramid

.anim_step
|1ED36F| db $00, $08, $0A, $02, $02, $06, $04

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_SpinToPyramid:
|1ED376| LDA.w $0DF0,X
|1ED379| BNE .delay

|1ED37B| PHX

|1ED37C| STZ.w $0DD0,X

|1ED37F| JSL PrepareDungeonExitFromBossFight

|1ED383| PLX

.delay
|1ED384| LDA.w $0DF0,X
|1ED387| CMP.b #$10
|1ED389| BCS .spinning

|1ED38B| LDA.b #$7F
|1ED38D| STA.b $9A

|1ED38F| LDA.b #$06
|1ED391| STA.b $1C

|1ED393| LDA.b #$10
|1ED395| STA.b $1D

|1ED397| PHX

|1ED398| JSL PaletteFilter_Sprite5Left

|1ED39C| PLX

.spinning
|1ED39D| LDA.w $0DF0,X
|1ED3A0| AND.b #$00
|1ED3A2| BNE .dont_increase_rotation_speed

|1ED3A4| LDA.w $0F80,X
|1ED3A7| CMP.b #$FF
|1ED3A9| BEQ .dont_increase_rotation_speed

|1ED3AB| CLC
|1ED3AC| ADC.b #$01
|1ED3AE| STA.w $0F80,X

.dont_increase_rotation_speed
|1ED3B1| LDA.w $0F90,X
|1ED3B4| CLC
|1ED3B5| ADC.w $0F80,X
|1ED3B8| STA.w $0F90,X

|1ED3BB| BCC .no_sfx

|1ED3BD| INC.w $0E80,X

|1ED3C0| LDA.w $0E80,X
|1ED3C3| CMP.b #$07
|1ED3C5| BNE .no_sfx

|1ED3C7| STZ.w $0E80,X

|1ED3CA| LDA.b #$04 ; SFX2.04
|1ED3CC| JSL QueueSpriteSFX2WithPan

.no_sfx
|1ED3D0| LDY.w $0E80,X

|1ED3D3| LDA.w .anim_step,Y
|1ED3D6| STA.w $0DC0,X

|1ED3D9| RTS

;===================================================================================================

Agahnim_ExorciseGanon:
|1ED3DA| LDA.b #$02
|1ED3DC| STA.w $0FFC

|1ED3DF| STZ.w $0EB0,X

|1ED3E2| LDA.w $0DF0,X
|1ED3E5| CMP.b #$40
|1ED3E7| BCC .delay

|1ED3E9| LDA.w $0EF0,X
|1ED3EC| ORA.b #$E0
|1ED3EE| STA.w $0EF0,X

|1ED3F1| RTS

.delay
|1ED3F2| CMP.b #$01
|1ED3F4| BNE .no_bat_yet

|1ED3F6| JSL SpawnPhantomGanon

|1ED3FA| LDA.b #$1D ; SONG 1D
|1ED3FC| STA.w $012C

.no_bat_yet
|1ED3FF| STZ.w $0EF0,X

|1ED402| LDA.b #$11
|1ED404| STA.w $0DC0,X

|1ED407| RTS

;===================================================================================================

Agahnim_UncloneSelf:
|1ED408| STZ.w $0EB0,X

|1ED40B| LDA.w $0D10
|1ED40E| STA.b $04

|1ED410| LDA.w $0D30
|1ED413| STA.b $05

|1ED415| LDA.w $0D00
|1ED418| STA.b $06

|1ED41A| LDA.w $0D20
|1ED41D| STA.b $07

|1ED41F| REP #$20

|1ED421| LDA.w $0FD8
|1ED424| SEC
|1ED425| SBC.b $04
|1ED427| CLC
|1ED428| ADC.w #$0004

|1ED42B| CMP.w #$0008
|1ED42E| BCS .not_merged_yet

|1ED430| LDA.w $0FDA
|1ED433| SEC
|1ED434| SBC.b $06
|1ED436| CLC
|1ED437| ADC.w #$0004

|1ED43A| CMP.w #$0008
|1ED43D| BCS .not_merged_yet

|1ED43F| SEP #$20

|1ED441| STZ.w $0DD0,X

.not_merged_yet
|1ED444| SEP #$20

|1ED446| LDA.b #$20
|1ED448| JSL ProjectSpriteSpeedTowardsLocation_long

|1ED44C| LDA.b $00
|1ED44E| STA.w $0D40,X

|1ED451| LDA.b $01
|1ED453| STA.w $0D50,X

|1ED456| JSR MoveSpriteXY_bank1E
|1ED459| JSL Agahnim_ApplyMotionBlur

|1ED45D| RTS

;===================================================================================================

Agahnim_HelloDarkWorld:
|1ED45E| LDA.w $0DF0,X
|1ED461| BNE .exit

|1ED463| LDA.b #$41 ; MESSAGE 0141
|1ED465| STA.w $1CF0

|1ED468| LDA.b #$01
|1ED46A| STA.w $1CF1

|1ED46D| JSL ShowMessageMinimal

|1ED471| INC.w $0D80,X

|1ED474| LDA.b #$50
|1ED476| STA.w $0DF0,X

.exit
|1ED479| RTS

;===================================================================================================

pool Agahnim_CreateClones

.speed
|1ED47A| db  32, -32

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_CreateClones:
|1ED47C| LDA.w $0EC0,X
|1ED47F| BEQ .spawn_clones

|1ED481| LDA.w $0DF0,X
|1ED484| BNE .delay

|1ED486| JMP.w Agahnim_PrepareToAttack

;---------------------------------------------------------------------------------------------------

.delay
|1ED489| LDA.w .speed-1,X
|1ED48C| STA.w $0D50,X

|1ED48F| LDA.w $0D40,X
|1ED492| CLC
|1ED493| ADC.b #$02
|1ED495| STA.w $0D40,X

|1ED498| JSR MoveSpriteXY_bank1E

|1ED49B| JSL Agahnim_ApplyMotionBlur
|1ED49F| BMI .exit_a

|1ED4A1| LDA.b #$04
|1ED4A3| STA.w $0F50,Y

.exit_a
|1ED4A6| RTS

;---------------------------------------------------------------------------------------------------

.palette
|1ED4A7| db $09, $0B

;---------------------------------------------------------------------------------------------------

.spawn_clones
|1ED4A9| LDA.w $0DF0,X
|1ED4AC| BNE .wait_for_clones

|1ED4AE| JMP.w Agahnim_PrepareToAttack

;---------------------------------------------------------------------------------------------------

.wait_for_clones
|1ED4B1| CMP.b #$40
|1ED4B3| BNE .exit_b

|1ED4B5| LDA.b #$28 ; SFX3.28
|1ED4B7| STA.w $012F

|1ED4BA| LDA.b #$01
|1ED4BC| STA.w $0FB5

.next_clone
|1ED4BF| LDA.b #$7A ; SPRITE 7A
|1ED4C1| LDY.b #$02
|1ED4C3| JSL SpawnSpriteDynamically.slot_limited

|1ED4C7| JSL SetSpawnedSpriteCoordinates


|1ED4CB| LDA.w .palette-1,Y
|1ED4CE| STA.w $0E60,Y

|1ED4D1| AND.b #$0F
|1ED4D3| STA.w $0F50,Y
|1ED4D6| STA.w $0EC0,Y

|1ED4D9| LDA.w $0D80,X
|1ED4DC| STA.w $0D80,Y

|1ED4DF| LDA.b #$20
|1ED4E1| STA.w $0DF0,Y

|1ED4E4| DEC.w $0FB5
|1ED4E7| BPL .next_clone

.exit_b
|1ED4E9| RTS

;===================================================================================================

pool Agahnim_ChooseFirstMove

.next_ai
|1ED4EA| db $01 ; LW: Aga 1
|1ED4EB| db $06 ; DW: Aga 2

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_ChooseFirstMove:
|1ED4EC| LDY.w $0FFF

|1ED4EF| LDA.w .next_ai,Y
|1ED4F2| STA.w $0D80,X

|1ED4F5| RTS

;===================================================================================================

Agahnim_HelloLightWorld:
|1ED4F6| LDA.w $0DF0,X
|1ED4F9| BNE EXIT_1ED51E

|1ED4FB| LDA.b #$3F ; MESSAGE 013F
|1ED4FD| STA.w $1CF0

|1ED500| LDA.b #$01
|1ED502| STA.w $1CF1

|1ED505| JSL ShowMessageMinimal

;===================================================================================================

Agahnim_PrepareToAttack:
|1ED509| LDA.b #$03
|1ED50B| STA.w $0D80,X

|1ED50E| LDA.b #$20
|1ED510| STA.w $0DF0,X

|1ED513| RTS

;===================================================================================================

Agahnim_PrepareToEmerge:
|1ED514| LDA.b #$02
|1ED516| STA.w $0D80,X

|1ED519| LDA.b #$27
|1ED51B| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

#EXIT_1ED51E:
|1ED51E| RTS

;===================================================================================================

pool Agahnim_EmergeFromShadow

.anim_step
|1ED51F| db $0C, $0D, $0E, $0F, $10

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_EmergeFromShadow:
|1ED524| STZ.w $0FF8

|1ED527| LDA.w $0DF0,X
|1ED52A| BNE .delay

|1ED52C| INC.w $0D80,X

|1ED52F| LDA.b #$FF
|1ED531| STA.w $0DF0,X

|1ED534| RTS

.delay
|1ED535| LSR A
|1ED536| LSR A
|1ED537| LSR A
|1ED538| TAY

|1ED539| LDA.w .anim_step,Y
|1ED53C| STA.w $0DC0,X

|1ED53F| RTS

;===================================================================================================

pool Agahnim_Attack

.attack_anim_offset
|1ED540| db $00, $00, $00, $00, $00, $00, $00, $01
|1ED548| db $01, $01, $01, $01, $01, $01, $00, $00

.attack_anim_ball_step
|1ED550| db $00, $00, $00, $00, $00, $00, $00, $06
|1ED558| db $05, $04, $03, $02, $01, $00, $00, $00

.attack_anim_ball_step_offset
|1ED560| db $1E, $18, $0C, $00, $06, $12

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_Attack:
|1ED566| LDA.w $0DF0,X
|1ED569| CMP.b #$C0
|1ED56B| BNE .no_charge_sfx

|1ED56D| PHA

|1ED56E| LDA.b #$27 ; SFX3.27
|1ED570| JSL QueueSpriteSFX3WithPan

|1ED574| PLA

;---------------------------------------------------------------------------------------------------

.no_charge_sfx
|1ED575| CMP.b #$EF
|1ED577| BCS .apply_unfade_filter

.apply_fade_filter
|1ED579| CMP.b #$10
|1ED57B| BCS .skip_filter

.apply_unfade_filter
|1ED57D| PHX

|1ED57E| LDA.w $0FFF
|1ED581| BNE .aga2_filtering

|1ED583| LDX.b #$02

.aga2_filtering
|1ED585| JSL AgahnimWarpShadowFilter

|1ED589| PLX

|1ED58A| BRA .immune

;---------------------------------------------------------------------------------------------------

.skip_filter
|1ED58C| TXA
|1ED58D| BNE .immune

|1ED58F| JSR CheckDamageToAndFromLink_bank1E

|1ED592| STZ.w $0BA0,X

.immune
|1ED595| LDA.w $0DF0,X
|1ED598| BNE .delay_warp

|1ED59A| INC.w $0D80,X

|1ED59D| LDA.b #$27
|1ED59F| STA.w $0DF0,X

|1ED5A2| RTS

;---------------------------------------------------------------------------------------------------

.delay_warp
|1ED5A3| CMP.b #$80
|1ED5A5| BCC .direction_locked

|1ED5A7| PHA

|1ED5A8| LDA.b #$02
|1ED5AA| JSL ApplySpeedTowardsLink_long

|1ED5AE| LDY.b $01

|1ED5B0| LDA.b $00
|1ED5B2| CLC
|1ED5B3| ADC.b #$02
|1ED5B5| STA.b $02

|1ED5B7| ASL A
|1ED5B8| ASL A
|1ED5B9| ADC.b $02
|1ED5BB| ADC.b #$02

|1ED5BD| CLC
|1ED5BE| ADC.b $01
|1ED5C0| TAY

|1ED5C1| LDA.w Agahnim_Direction,Y
|1ED5C4| STA.w $0DE0,X

|1ED5C7| LDA.b #$20
|1ED5C9| JSL ApplySpeedTowardsLink_long

|1ED5CD| LDA.w $0E30,X
|1ED5D0| CMP.b #$04
|1ED5D2| BNE .not_lightning

|1ED5D4| LDA.b #$03
|1ED5D6| STA.w $0DE0,X

.not_lightning
|1ED5D9| PLA

.direction_locked
|1ED5DA| CMP.b #$70
|1ED5DC| BNE .dont_fire

|1ED5DE| PHA

|1ED5DF| JSR Agahnim_PerformAttack

|1ED5E2| PLA

.dont_fire
|1ED5E3| LSR A
|1ED5E4| LSR A
|1ED5E5| LSR A
|1ED5E6| LSR A
|1ED5E7| TAY

|1ED5E8| LDA.w .attack_anim_offset,Y
|1ED5EB| STA.w $0D90,X

|1ED5EE| LDA.w .attack_anim_ball_step,Y
|1ED5F1| BEQ .no_offset_needed

|1ED5F3| CLC
|1ED5F4| LDY.w $0DE0,X
|1ED5F7| ADC.w .attack_anim_ball_step_offset,Y

.no_offset_needed
|1ED5FA| STA.w $0EB0,X

|1ED5FD| LDY.w $0DE0,X

|1ED600| LDA.w Agahnim_DirectionStepOffset,Y
|1ED603| CLC
|1ED604| ADC.w $0D90,X
|1ED607| STA.w $0DC0,X

|1ED60A| RTS

;===================================================================================================

pool Agahnim_ChooseWarpSpot

.anim_step
|1ED60B| db $10, $0F, $0E, $0D, $0C

.pos_x
|1ED610| db $38, $38, $38, $58, $78, $98, $B8, $B8
|1ED618| db $B8, $98, $58, $58, $60, $90, $98, $78

.pos_y
|1ED620| db $B8, $78, $58, $48, $48, $48, $58, $78
|1ED628| db $B8, $B8, $B8, $90, $70, $70, $90, $A0

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_ChooseWarpSpot:
|1ED630| LDA.w $0DF0,X
|1ED633| STA.w $0BA0,X
|1ED636| BNE .delay

|1ED638| INC.w $0D80,X

|1ED63B| LDY.b #$04

|1ED63D| LDA.w $0E30,X
|1ED640| CMP.b #$04
|1ED642| BEQ .use_middle_for_lightning

|1ED644| JSL GetRandomNumber
|1ED648| AND.b #$0F
|1ED64A| TAY

.use_middle_for_lightning
|1ED64B| LDA.w .pos_x,Y
|1ED64E| STA.w $0DB0,X

|1ED651| LDA.w .pos_y,Y
|1ED654| STA.w $0E90,X

|1ED657| LDA.b #$08
|1ED659| STA.w $0ED0,X

|1ED65C| RTS

.delay
|1ED65D| LSR A
|1ED65E| LSR A
|1ED65F| LSR A
|1ED660| TAY

|1ED661| LDA.w .anim_step,Y
|1ED664| STA.w $0DC0,X

|1ED667| RTS

;===================================================================================================

pool Agahnim_PerformAttack

.offset_x_low
|1ED668| db   0,  10,   8,   0, -10, -10

.offset_x_high
|1ED66E| db   0,   0,   0,   0,  -1,  -1

.offset_y_low
|1ED674| db  -9,  -2,  -2,  -9,  -2,  -2

endpool

;---------------------------------------------------------------------------------------------------

Agahnim_PerformAttack:
|1ED67A| CPX.b #$00
|1ED67C| BNE .can_use_lightning

|1ED67E| INC.w $0E30,X

|1ED681| LDA.w $0FFF
|1ED684| BEQ .can_use_lightning

|1ED686| LDA.w $0E30,X
|1ED689| AND.b #$03
|1ED68B| STA.w $0E30,X

.can_use_lightning
|1ED68E| LDA.w $0E30,X
|1ED691| CMP.b #$05
|1ED693| BNE .balls

|1ED695| STZ.w $0E30,X

|1ED698| LDA.b #$26 ; SFX3.26
|1ED69A| JSL QueueSpriteSFX3WithPan

|1ED69E| JSR .spawn_2

.spawn_2
|1ED6A1| JSL Sprite_SpawnLightning
|1ED6A5| JSL Sprite_SpawnLightning

|1ED6A9| RTS

;---------------------------------------------------------------------------------------------------

.balls
|1ED6AA| LDA.b #$7B ; SPRITE 7B
|1ED6AC| JSL SpawnSpriteDynamically
|1ED6B0| BMI .exit

|1ED6B2| LDA.b #$29 ; SFX3.29
|1ED6B4| JSL QueueSpriteSFX3WithPan

|1ED6B8| PHX

|1ED6B9| LDA.w $0DE0,X
|1ED6BC| TAX

|1ED6BD| LDA.b $00
|1ED6BF| CLC
|1ED6C0| ADC.w .offset_x_low,X
|1ED6C3| STA.w $0D10,Y

|1ED6C6| LDA.b $01
|1ED6C8| ADC.w .offset_x_high,X
|1ED6CB| STA.w $0D30,Y

|1ED6CE| LDA.b $02
|1ED6D0| CLC
|1ED6D1| ADC.w .offset_y_low,X
|1ED6D4| STA.w $0D00,Y

|1ED6D7| LDA.b $03
|1ED6D9| ADC.b #$FF
|1ED6DB| STA.w $0D20,Y
|1ED6DE| STA.w $0BA0,Y

|1ED6E1| PLX

|1ED6E2| LDA.w $0D50,X
|1ED6E5| STA.w $0D50,Y

|1ED6E8| LDA.w $0D40,X
|1ED6EB| STA.w $0D40,Y

|1ED6EE| LDA.w $0E30,X
|1ED6F1| CMP.b #$02
|1ED6F3| BCC .exit

|1ED6F5| JSL GetRandomNumber
|1ED6F9| AND.b #$01
|1ED6FB| BNE .exit

|1ED6FD| LDA.b #$01
|1ED6FF| STA.w $0DA0,Y

|1ED702| LDA.b #$20
|1ED704| STA.w $0DF0,Y

.exit
|1ED707| RTS

;===================================================================================================

Agahnim_MoveTowardsWarp:
|1ED708| LDA.b #$01
|1ED70A| STA.w $0BA0,X

|1ED70D| LDA.w $0D10,X
|1ED710| STA.b $00

|1ED712| LDA.w $0D30,X
|1ED715| STA.b $01
|1ED717| STA.b $05

|1ED719| LDA.w $0D00,X
|1ED71C| STA.b $02

|1ED71E| LDA.w $0D20,X
|1ED721| STA.b $03
|1ED723| STA.b $07

|1ED725| LDA.w $0DB0,X
|1ED728| STA.b $04

|1ED72A| LDA.w $0E90,X
|1ED72D| STA.b $06

;---------------------------------------------------------------------------------------------------

|1ED72F| REP #$20

|1ED731| LDA.b $00
|1ED733| SEC
|1ED734| SBC.b $04

|1ED736| CLC
|1ED737| ADC.w #$0007

|1ED73A| CMP.w #$000E
|1ED73D| BCS .not_close

|1ED73F| LDA.b $02
|1ED741| SEC
|1ED742| SBC.b $06

|1ED744| CLC
|1ED745| ADC.w #$0007

|1ED748| CMP.w #$000E
|1ED74B| BCS .not_close

|1ED74D| SEP #$20

|1ED74F| LDA.w $0DB0,X
|1ED752| STA.w $0D10,X

|1ED755| LDA.w $0E90,X
|1ED758| STA.w $0D00,X

|1ED75B| JMP.w Agahnim_PrepareToEmerge

;---------------------------------------------------------------------------------------------------

.not_close
|1ED75E| SEP #$20

|1ED760| LDA.w $0ED0,X
|1ED763| JSL ProjectSpriteSpeedTowardsLocation_long

|1ED767| LDA.b $00
|1ED769| STA.w $0D40,X

|1ED76C| LDA.b $01
|1ED76E| STA.w $0D50,X

|1ED771| LDA.w $0ED0,X
|1ED774| CMP.b #$40
|1ED776| BCS .skip

|1ED778| INC.w $0ED0,X

.skip
|1ED77B| JSR MoveSpriteXY_bank1E

|1ED77E| RTS

;===================================================================================================

pool SpriteDraw_Agahnim

.agahnim_offset_x
|1ED77F| db  -8,   8,  -8,   8
|1ED783| db  -8,   8,  -8,   8
|1ED787| db  -8,   8,  -8,   8
|1ED78B| db  -8,   8,  -8,   8
|1ED78F| db  -8,   8,  -8,   8
|1ED793| db  -8,   8,  -8,   8
|1ED797| db  -8,   8,  -8,   8
|1ED79B| db  -8,   8,  -8,   8
|1ED79F| db  -8,   8,  -8,   8
|1ED7A3| db  -8,   8,  -8,   8
|1ED7A7| db  -8,   8,  -8,   8
|1ED7AB| db  -8,   8,  -8,   8
|1ED7AF| db  -8,   8,  -8,   8
|1ED7B3| db  -6,   6,  -6,   6
|1ED7B7| db  -8,   8,  -8,   8
|1ED7BB| db  -6,   6,  -6,   6
|1ED7BF| db   0,   8,   0,   8
|1ED7C3| db  -8,   8,  -8,   8

.agahnim_offset_y
|1ED7C7| db  -8,  -8,   8,   8
|1ED7CB| db  -8,  -8,   8,   8
|1ED7CF| db  -8,  -8,   8,   8
|1ED7D3| db  -8,  -8,   8,   8
|1ED7D7| db  -8,  -8,   8,   8
|1ED7DB| db  -8,  -8,   8,   8
|1ED7DF| db  -8,  -8,   8,   8
|1ED7E3| db  -8,  -8,   8,   8
|1ED7E7| db  -8,  -8,   8,   8
|1ED7EB| db  -8,  -8,   8,   8
|1ED7EF| db  -8,  -8,   8,   8
|1ED7F3| db  -8,  -8,   8,   8
|1ED7F7| db  -8,  -8,   8,   8
|1ED7FB| db  -6,  -6,   6,   6
|1ED7FF| db  -8,  -8,   8,   8
|1ED803| db  -6,  -6,   6,   6
|1ED807| db   0,   0,   8,   8
|1ED80B| db   8,   8,   8,   8

.agahnim_char
|1ED80F| db $82, $82, $A2, $A2
|1ED813| db $80, $80, $A0, $A0
|1ED817| db $84, $84, $A4, $A4
|1ED81B| db $86, $86, $A6, $A6
|1ED81F| db $88, $8A, $A8, $AA
|1ED823| db $8C, $8E, $AC, $AE
|1ED827| db $C4, $C2, $E4, $E6
|1ED82B| db $C0, $C2, $E0, $E2
|1ED82F| db $8A, $88, $AA, $A8
|1ED833| db $8E, $8C, $AE, $AC
|1ED837| db $C2, $C4, $E6, $E4
|1ED83B| db $C2, $C0, $E2, $E0
|1ED83F| db $EC, $EC, $EC, $EC
|1ED843| db $EC, $EC, $EC, $EC
|1ED847| db $EE, $EE, $EE, $EE
|1ED84B| db $EE, $EE, $EE, $EE
|1ED84F| db $DF, $DF, $DF, $DF
|1ED853| db $40, $42, $40, $42

.agahnim_flip
|1ED857| db $00, $40, $00, $40
|1ED85B| db $00, $40, $00, $40
|1ED85F| db $00, $40, $00, $40
|1ED863| db $00, $40, $00, $40
|1ED867| db $00, $00, $00, $00
|1ED86B| db $00, $00, $00, $00
|1ED86F| db $00, $00, $00, $00
|1ED873| db $00, $00, $00, $00
|1ED877| db $40, $40, $40, $40
|1ED87B| db $40, $40, $40, $40
|1ED87F| db $40, $40, $40, $40
|1ED883| db $40, $40, $40, $40
|1ED887| db $00, $40, $80, $C0
|1ED88B| db $00, $40, $80, $C0
|1ED88F| db $00, $40, $80, $C0
|1ED893| db $00, $40, $80, $C0
|1ED897| db $00, $40, $80, $C0
|1ED89B| db $00, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.ball_offset_x
|1ED89F| db  -7,  15, -11,  11
|1ED8A3| db -11,  11,  -8,   8
|1ED8A7| db  -4,   4,   0,   0
|1ED8AB| db -10,  -1, -14,  -5
|1ED8AF| db -14,  -5, -12,  -7
|1ED8B3| db -10,  -7, -10, -10
|1ED8B7| db  16,   8,  12,   4
|1ED8BB| db  12,   4,  10,   6
|1ED8BF| db   9,   7,   8,   8

|1ED8C3| db  -6,  -6, -10, -10
|1ED8C7| db -10, -10, -10, -10
|1ED8CB| db -10, -10, -10, -10
|1ED8CF| db  14,  14,  10,  10
|1ED8D3| db  10,  10,  10,  10
|1ED8D7| db  10,  10,  10,  10
|1ED8DB| db  -7,  15, -11,  11
|1ED8DF| db -11,  11,  -8,   8
|1ED8E3| db  -4,   4,   0,   0

.ball_offset_y
|1ED8E7| db  -5,  -5,  -9,  -9
|1ED8EB| db  -9,  -9,  -9,  -9
|1ED8EF| db  -9,  -9,  -9,  -9
|1ED8F3| db  -3,   9,  -7,   5
|1ED8F7| db  -7,   5,  -5,   3
|1ED8FB| db  -3,   3,  -2,  -2
|1ED8FF| db  -3,   9,  -7,   5
|1ED903| db  -7,   5,  -5,   3
|1ED907| db  -3,   3,  -2,  -2

|1ED90B| db  -3,   9,  -7,   5
|1ED90F| db  -7,   5,  -5,   3
|1ED913| db  -3,   3,  -2,  -2
|1ED917| db  -3,   9,  -7,   5
|1ED91B| db  -7,   5,  -5,   3
|1ED91F| db  -3,   3,  -2,  -2
|1ED923| db  -5,  -5,  -9,  -9
|1ED927| db  -9,  -9,  -9,  -9
|1ED92B| db  -9,  -9,  -9,  -9

.ball_char
|1ED92F| db $CE, $CC, $C6, $C6
|1ED933| db $C6, $C6, $CE, $CC
|1ED937| db $C6, $C6, $C6, $C6
|1ED93B| db $CE, $CC, $C6, $C6
|1ED93F| db $C6, $C6, $CE, $CC
|1ED943| db $C6, $C6, $C6, $C6
|1ED947| db $CE, $CC, $C6, $C6
|1ED94B| db $C6, $C6, $CE, $CC
|1ED94F| db $C6, $C6, $C6, $C6

.ball_palette
|1ED953| db $00, $02, $02, $02
|1ED957| db $02, $02, $00, $02
|1ED95B| db $02, $02, $02, $02
|1ED95F| db $00, $02, $02, $02
|1ED963| db $02, $02, $00, $02
|1ED967| db $02, $02, $02, $02
|1ED96B| db $00, $02, $02, $02
|1ED96F| db $02, $02, $00, $02
|1ED973| db $02, $02, $02, $02

endpool

;===================================================================================================

UNREACHABLE_1ED977:
|1ED977| RTS

;===================================================================================================

SpriteDraw_Agahnim:
|1ED978| JSR GetScreenCoordinates_bank1E

|1ED97B| LDA.w $0DC0,X
|1ED97E| ASL A
|1ED97F| ASL A
|1ED980| STA.b $06

;---------------------------------------------------------------------------------------------------

|1ED982| PHX

|1ED983| LDX.b #$03

.next_aga_obj
|1ED985| PHX

|1ED986| TXA
|1ED987| CLC
|1ED988| ADC.b $06
|1ED98A| TAX

|1ED98B| LDA.b $00
|1ED98D| CLC
|1ED98E| ADC.w .agahnim_offset_x,X
|1ED991| STA.b ($90),Y

|1ED993| LDA.b $02
|1ED995| CLC
|1ED996| ADC.w .agahnim_offset_y,X
|1ED999| INY
|1ED99A| STA.b ($90),Y

|1ED99C| LDA.w .agahnim_char,X
|1ED99F| INY
|1ED9A0| STA.b ($90),Y

|1ED9A2| LDA.w .agahnim_flip,X
|1ED9A5| ORA.b $05
|1ED9A7| INY
|1ED9A8| STA.b ($90),Y

|1ED9AA| PHY

|1ED9AB| TYA
|1ED9AC| LSR A
|1ED9AD| LSR A
|1ED9AE| TAY

|1ED9AF| LDA.b #$02

|1ED9B1| CPX.b #$44
|1ED9B3| BCS .draw_big

|1ED9B5| CPX.b #$40
|1ED9B7| BCC .draw_big

|1ED9B9| LDA.b #$00

.draw_big
|1ED9BB| STA.b ($92),Y

|1ED9BD| PLY

|1ED9BE| INY

|1ED9BF| PLX
|1ED9C0| DEX
|1ED9C1| BPL .next_aga_obj

|1ED9C3| PLX

;---------------------------------------------------------------------------------------------------

|1ED9C4| LDA.w $0DC0,X
|1ED9C7| CMP.b #$0C
|1ED9C9| BCS .no_shadow

|1ED9CB| LDA.b #$12
|1ED9CD| JSL DrawSpriteShadow_custom_long

.no_shadow
|1ED9D1| LDA.b $11
|1ED9D3| BEQ .skip_correction

|1ED9D5| LDY.b #$FF
|1ED9D7| LDA.b #$03
|1ED9D9| JSL CorrectOAMEntries_long

.skip_correction
|1ED9DD| JSR GetScreenCoordinates_bank1E

|1ED9E0| LDA.b #$08
|1ED9E2| LDY.w $0DE0,X
|1ED9E5| BEQ .use_region_b

.use_region_c
|1ED9E7| JSL AllocateOAMInRegionC

|1ED9EB| BRA .continue

.use_region_b
|1ED9ED| JSL AllocateOAMInRegionB

;---------------------------------------------------------------------------------------------------

.continue
|1ED9F1| LDY.b #$00
|1ED9F3| LDA.w $0EB0,X
|1ED9F6| BEQ .exit

|1ED9F8| DEC A
|1ED9F9| STA.b $0C

|1ED9FB| ASL A
|1ED9FC| STA.b $06

|1ED9FE| LDA.b $1A
|1EDA00| LSR A
|1EDA01| AND.b #$02

|1EDA03| INC A
|1EDA04| INC A

|1EDA05| ORA.b #$31
|1EDA07| STA.b $0D

;---------------------------------------------------------------------------------------------------

|1EDA09| PHX

|1EDA0A| LDX.b #$01

.next_ball_obj
|1EDA0C| PHX

|1EDA0D| TXA
|1EDA0E| CLC
|1EDA0F| ADC.b $06
|1EDA11| TAX

|1EDA12| LDA.b $00
|1EDA14| CLC
|1EDA15| ADC.w .ball_offset_x,X
|1EDA18| STA.b ($90),Y

|1EDA1A| LDA.b $02
|1EDA1C| CLC
|1EDA1D| ADC.w .ball_offset_y,X
|1EDA20| INY
|1EDA21| STA.b ($90),Y

|1EDA23| LDX.b $0C

|1EDA25| LDA.w .ball_char,X
|1EDA28| INY
|1EDA29| STA.b ($90),Y

|1EDA2B| INY

|1EDA2C| LDA.b $0D
|1EDA2E| STA.b ($90),Y

|1EDA30| PHY

|1EDA31| TYA
|1EDA32| LSR A
|1EDA33| LSR A
|1EDA34| TAY

|1EDA35| LDA.w .ball_palette,X
|1EDA38| STA.b ($92),Y

|1EDA3A| PLY
|1EDA3B| INY

|1EDA3C| PLX
|1EDA3D| DEX
|1EDA3E| BPL .next_ball_obj

|1EDA40| PLX

.exit
|1EDA41| RTS

;===================================================================================================

Sprite_7B_AgahnimBalls:
|1EDA42| LDA.w $0DA0,X
|1EDA45| BEQ YellowBall

;===================================================================================================

BlueBall:
|1EDA47| LDA.w $0DF0,X
|1EDA4A| BEQ .done_homing

|1EDA4C| LDA.b #$20
|1EDA4E| JSL ApplySpeedTowardsLink_long

.done_homing
|1EDA52| LDA.b #$05
|1EDA54| BRA AgahnimBalls_Main

;===================================================================================================

YellowBall:
|1EDA56| LDA.b $1A
|1EDA58| LSR A
|1EDA59| AND.b #$02

|1EDA5B| INC A
|1EDA5C| INC A
|1EDA5D| ORA.b #$01

;===================================================================================================

AgahnimBalls_Main:
|1EDA5F| STA.w $0F50,X

|1EDA62| LDA.w $0D80,X
|1EDA65| BEQ .continue

|1EDA67| JMP.w AgahnimBalls_DrawTrail

.continue
|1EDA6A| LDA.w $0DA0,X
|1EDA6D| BEQ .draw_yellow

|1EDA6F| JSR SpriteDraw_BlueBalls
|1EDA72| BRA .drawing_done

.draw_yellow
|1EDA74| JSL SpriteDraw_SingleLarge_long

;---------------------------------------------------------------------------------------------------

.drawing_done
|1EDA78| JSR CheckIfActive_bank1E

|1EDA7B| INC.w $0E80,X

|1EDA7E| JSR MoveSpriteXY_bank1E

|1EDA81| JSR CheckSpriteTileCollision_bank1E
|1EDA84| BEQ .no_tile_collision

|1EDA86| STZ.w $0DD0,X

|1EDA89| LDA.w $0DA0,X
|1EDA8C| BNE .blue_ball_explode

.no_tile_collision
|1EDA8E| LDA.w $0D90,X
|1EDA91| BEQ .reflected

|1EDA93| LDA.w $0BA0
|1EDA96| BNE .reflected

|1EDA98| LDA.w $0D10,X
|1EDA9B| STA.b $00

|1EDA9D| LDA.w $0D30,X
|1EDAA0| STA.b $08

|1EDAA2| LDA.b #$0F
|1EDAA4| STA.b $02
|1EDAA6| STA.b $03

|1EDAA8| LDA.w $0D00,X
|1EDAAB| STA.b $01

|1EDAAD| LDA.w $0D20,X
|1EDAB0| STA.b $09

|1EDAB2| PHX

|1EDAB3| LDX.b #$00
|1EDAB5| JSL SetupSpriteHitbox_long

|1EDAB9| PLX

|1EDABA| JSL CheckIfHitboxesOverlap_long
|1EDABE| BCC .didnt_hit_aga

|1EDAC0| PHX

|1EDAC1| LDA.b #$A0
|1EDAC3| STA.b $00

|1EDAC5| LDA.b #$10
|1EDAC7| LDX.b #$00
|1EDAC9| JSL DamageAgahnimWithBalls

|1EDACD| PLX

|1EDACE| STZ.w $0DD0,X

|1EDAD1| LDA.w $0D50,X
|1EDAD4| STA.w $0F40

|1EDAD7| LDA.w $0D40,X
|1EDADA| STA.w $0F30

.didnt_hit_aga
|1EDADD| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.reflected
|1EDADF| JSR CheckDamageToLink_bank1E
|1EDAE2| JSL CheckDamageFromLink_long
|1EDAE6| BCC .finish_up

|1EDAE8| LDA.w $0DA0,X
|1EDAEB| BEQ .reflected_yellow_ball

|1EDAED| STZ.w $0DD0,X

.blue_ball_explode
|1EDAF0| LDA.b #$36 ; SFX3.36
|1EDAF2| JSL QueueSpriteSFX3WithPan

|1EDAF6| JSR CreateSixBlueBalls

|1EDAF9| RTS

;---------------------------------------------------------------------------------------------------

.reflected_yellow_ball
|1EDAFA| LDA.b #$05 ; SFX2.05
|1EDAFC| JSL QueueSpriteSFX2WithPan

|1EDB00| LDA.b #$29 ; SFX3.29
|1EDB02| JSL QueueSpriteSFX3WithPan

|1EDB06| LDA.b #$30
|1EDB08| JSL ApplySpeedTowardsLink_long

|1EDB0C| LDA.b $01
|1EDB0E| EOR.b #$FF
|1EDB10| INC A
|1EDB11| STA.w $0D50,X

|1EDB14| LDA.b $00
|1EDB16| EOR.b #$FF
|1EDB18| INC A
|1EDB19| STA.w $0D40,X

|1EDB1C| INC.w $0D90,X

;---------------------------------------------------------------------------------------------------

.finish_up
|1EDB1F| TXA
|1EDB20| EOR.b $1A
|1EDB22| AND.b #$03
|1EDB24| ORA.w $0DA0,X
|1EDB27| BNE .exit

|1EDB29| LDA.b #$7B ; SPRITE 7B
|1EDB2B| JSL SpawnSpriteDynamically
|1EDB2F| BMI .exit

|1EDB31| JSL SetSpawnedSpriteCoordinates

|1EDB35| LDA.b #$0F
|1EDB37| STA.w $0DF0,Y
|1EDB3A| STA.w $0D80,Y

|1EDB3D| LDA.w $0DA0,X
|1EDB40| STA.w $0DA0,Y

.exit
|1EDB43| RTS

;===================================================================================================

pool AgahnimBalls_DrawTrail

.anim_step
|1EDB44| db $02, $02, $02, $02, $02, $02, $02, $01
|1EDB4C| db $01, $01, $01, $01, $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

AgahnimBalls_DrawTrail:
|1EDB54| LDA.w $0DC0,X
|1EDB57| CMP.b #$02
|1EDB59| BEQ .small

|1EDB5B| JSL SpriteDraw_SingleLarge_long
|1EDB5F| BRA .continue

.small
|1EDB61| JSL SpriteDraw_SingleSmall_long

.continue
|1EDB65| JSR CheckIfActive_bank1E

|1EDB68| LDA.w $0DF0,X
|1EDB6B| STA.w $0BA0,X
|1EDB6E| BNE .stay_around

|1EDB70| STZ.w $0DD0,X

.stay_around
|1EDB73| TAY
|1EDB74| CMP.b #$06
|1EDB76| BNE .dont_move

|1EDB78| LDA.b #$40
|1EDB7A| STA.w $0D50,X
|1EDB7D| STA.w $0D40,X

|1EDB80| JSR MoveSpriteXY_bank1E

.dont_move
|1EDB83| LDA.w .anim_step,Y
|1EDB86| STA.w $0DC0,X

|1EDB89| RTS

;===================================================================================================

pool CreateSixBlueBalls

.speed_x
|1EDB8A| db   0,  24,  24,   0, -24, -24

.speed_y
|1EDB90| db -32, -16,  16,  32,  16, -16

endpool

;---------------------------------------------------------------------------------------------------

CreateSixBlueBalls:
|1EDB96| LDA.b #$36 ; SFX3.36
|1EDB98| JSL QueueSpriteSFX3WithPan

|1EDB9C| LDA.b #$05
|1EDB9E| STA.w $0FB5

.spawn_next
|1EDBA1| JSR .spawn_one

|1EDBA4| DEC.w $0FB5
|1EDBA7| BNE .spawn_next

;---------------------------------------------------------------------------------------------------

.spawn_one
|1EDBA9| LDA.b #$55 ; SPRITE 55
|1EDBAB| JSL SpawnSpriteDynamically
|1EDBAF| BMI .no_space

|1EDBB1| LDA.b $00
|1EDBB3| CLC
|1EDBB4| ADC.b #$04
|1EDBB6| STA.w $0D10,Y

|1EDBB9| LDA.b $01
|1EDBBB| ADC.b #$00
|1EDBBD| STA.w $0D30,Y

|1EDBC0| LDA.b $02
|1EDBC2| CLC
|1EDBC3| ADC.b #$04
|1EDBC5| STA.w $0D00,Y

|1EDBC8| LDA.b $03
|1EDBCA| ADC.b #$00
|1EDBCC| STA.w $0D20,Y

|1EDBCF| LDA.w $0E60,Y
|1EDBD2| AND.b #$FE
|1EDBD4| ORA.b #$40
|1EDBD6| STA.w $0E60,Y

|1EDBD9| LDA.b #$04
|1EDBDB| STA.w $0F50,Y
|1EDBDE| STA.w $0E00,Y

|1EDBE1| LDA.b #$14
|1EDBE3| STA.w $0F60,Y
|1EDBE6| STA.w $0DB0,Y
|1EDBE9| STA.w $0E90,Y

|1EDBEC| PHX

|1EDBED| LDX.w $0FB5

|1EDBF0| LDA.w .speed_x,X
|1EDBF3| STA.w $0D50,Y

|1EDBF6| LDA.w .speed_y,X
|1EDBF9| STA.w $0D40,Y

|1EDBFC| PLX

.no_space
|1EDBFD| RTS

;===================================================================================================

pool SpriteDraw_BlueBalls

.oam_groups
|1EDBFE| dw   4,  -3 : db $CE, $00, $00, $00
|1EDC06| dw  11,   4 : db $CE, $00, $00, $00
|1EDC0E| dw   4,  11 : db $CE, $00, $00, $00
|1EDC16| dw  -3,   4 : db $CE, $00, $00, $00

|1EDC1E| dw  -1,  -1 : db $CE, $00, $00, $00
|1EDC26| dw   9,  -1 : db $CE, $00, $00, $00
|1EDC2E| dw  -1,   9 : db $CE, $00, $00, $00
|1EDC36| dw   9,   9 : db $CE, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_BlueBalls:
|1EDC3E| LDA.b #$00
|1EDC40| XBA
|1EDC41| LDA.w $0E80,X

|1EDC44| LSR A
|1EDC45| LSR A
|1EDC46| AND.b #$01

|1EDC48| REP #$20

|1EDC4A| ASL A
|1EDC4B| ASL A
|1EDC4C| ASL A
|1EDC4D| ASL A
|1EDC4E| ASL A
|1EDC4F| ADC.w #.oam_groups
|1EDC52| STA.b $08

|1EDC54| SEP #$20

|1EDC56| LDA.b #$04
|1EDC58| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

Sprite_79_Bee:
|1EDC5B| LDA.w $0D80,X
|1EDC5E| JSL JumpTableLocal
|1EDC62| dw Bee_DormantHive
|1EDC64| dw Bee_Main
|1EDC66| dw Bee_Captured

;===================================================================================================

Bee_DormantHive:
|1EDC68| LDA.w $0E90,X
|1EDC6B| BNE .exit

|1EDC6D| STZ.w $0DD0,X

|1EDC70| LDY.b #$0B

.more_bees
|1EDC72| PHY

|1EDC73| JSR SpawnBeeFromHive

|1EDC76| PLY
|1EDC77| DEY
|1EDC78| BPL .more_bees

.exit
|1EDC7A| RTS

;===================================================================================================

BeeSpeedSlow:
|1EDC7B| db  15,   5,  -5, -15,  20,  10, -10, -20

BeeSpeedFast:
|1EDC83| db   8,   2,  -2,  -8,  10,   5,  -5, -10

BeeTimer:
|1EDC8B| db  64,  64, 255, 255

;===================================================================================================

SpawnBeeFromHive:
|1EDC8F| LDA.b #$79 ; SPRITE 79
|1EDC91| JSL SpawnSpriteDynamically
|1EDC95| BMI .no_space

|1EDC97| JSL SetSpawnedSpriteCoordinates

;===================================================================================================

#InitializeSpawnedBee:
|1EDC9B| PHX

|1EDC9C| LDA.b #$01
|1EDC9E| STA.w $0D80,Y

|1EDCA1| TYA
|1EDCA2| AND.b #$03
|1EDCA4| TAX

|1EDCA5| LDA.w BeeTimer,X
|1EDCA8| STA.w $0DF0,Y
|1EDCAB| STA.w $0D90,Y

|1EDCAE| LDA.b #$60
|1EDCB0| STA.w $0F10,Y

|1EDCB3| JSL GetRandomNumber
|1EDCB7| AND.b #$07
|1EDCB9| TAX

|1EDCBA| LDA.w BeeSpeedSlow,X
|1EDCBD| STA.w $0D50,Y

|1EDCC0| JSL GetRandomNumber
|1EDCC4| AND.b #$07
|1EDCC6| TAX

|1EDCC7| LDA.w BeeSpeedSlow,X
|1EDCCA| STA.w $0D40,Y

|1EDCCD| PLX

.no_space
|1EDCCE| RTS

;===================================================================================================

ReleaseBeeFromBottle:
|1EDCCF| PHB
|1EDCD0| PHK
|1EDCD1| PLB

|1EDCD2| LDA.b #$B2 ; SPRITE B2
|1EDCD4| JSL SpawnSpriteDynamically
|1EDCD8| BMI .no_space

|1EDCDA| LDA.b $EE
|1EDCDC| STA.w $0F20,Y

|1EDCDF| LDA.b $22
|1EDCE1| CLC
|1EDCE2| ADC.b #$08
|1EDCE4| STA.w $0D10,Y

|1EDCE7| LDA.b $23
|1EDCE9| ADC.b #$00
|1EDCEB| STA.w $0D30,Y

|1EDCEE| LDA.b $20
|1EDCF0| CLC
|1EDCF1| ADC.b #$10
|1EDCF3| STA.w $0D00,Y

|1EDCF6| LDA.b $21
|1EDCF8| ADC.b #$00
|1EDCFA| STA.w $0D20,Y

|1EDCFD| PHX

|1EDCFE| LDX.w $0202
|1EDD01| LDA.l $7EF33F,X

|1EDD05| TAX

|1EDD06| LDA.l $7EF35B,X
|1EDD0A| CMP.b #$08
|1EDD0C| BNE .regular_bee

|1EDD0E| LDA.b #$01
|1EDD10| STA.w $0EB0,Y

.regular_bee
|1EDD13| JSR InitializeSpawnedBee

|1EDD16| JSL GetRandomNumber
|1EDD1A| AND.b #$07
|1EDD1C| TAX

|1EDD1D| LDA.w BeeSpeedFast,X
|1EDD20| STA.w $0D50,Y

|1EDD23| JSL GetRandomNumber
|1EDD27| AND.b #$07
|1EDD29| TAX

|1EDD2A| LDA.w BeeSpeedFast,X
|1EDD2D| STA.w $0D40,Y

|1EDD30| LDA.b #$40
|1EDD32| STA.w $0DF0,Y
|1EDD35| STA.w $0D90,Y

|1EDD38| PLX
|1EDD39| PLB

|1EDD3A| LDA.b #$00

|1EDD3C| RTL

.no_space
|1EDD3D| PLB

|1EDD3E| LDA.b #$FF

|1EDD40| RTL

;===================================================================================================

Bee_BounceBoundaries:
|1EDD41| db  0,  5, 10, 15

;===================================================================================================

Bee_Main:
|1EDD45| JSR Bee_HandleZ

|1EDD48| JSL SpriteDraw_SingleSmall_long

|1EDD4C| JSR Bee_HandleInteractions

|1EDD4F| JSR CheckIfActive_bank1E
|1EDD52| JSR HandleSpriteRecoil_bank1E

|1EDD55| LDA.w $0EB0,X
|1EDD58| BEQ .regular_bee

|1EDD5A| JSL SpawnBeeSparkle

.regular_bee
|1EDD5E| JSR BuzzBuzz
|1EDD61| JSR MoveSpriteXY_bank1E

|1EDD64| TXA
|1EDD65| EOR.b $1A
|1EDD67| LSR A
|1EDD68| AND.b #$01
|1EDD6A| STA.w $0DC0,X

|1EDD6D| LDA.w $0F10,X
|1EDD70| BNE .not_caught

|1EDD72| JSR CheckDamageToLink_bank1E

|1EDD75| JSL CheckDamageFromLink_long
|1EDD79| BEQ .not_caught

|1EDD7B| LDA.b #$C8 ; MESSAGE 00C8
|1EDD7D| LDY.b #$00
|1EDD7F| JSL ShowMessageUnconditional

|1EDD83| INC.w $0D80,X

|1EDD86| RTS

;---------------------------------------------------------------------------------------------------

.not_caught
|1EDD87| LDA.b $1A
|1EDD89| BNE .skip_timer

|1EDD8B| LDA.w $0D90,X
|1EDD8E| CMP.b #$10
|1EDD90| BEQ .skip_timer

|1EDD92| SEC
|1EDD93| SBC.b #$08
|1EDD95| STA.w $0D90,X

.skip_timer
|1EDD98| LDA.w $0DF0,X
|1EDD9B| BNE .exit

|1EDD9D| JSL GetRandomNumber
|1EDDA1| AND.b #$03
|1EDDA3| TAY

|1EDDA4| LDA.b $22
|1EDDA6| CLC
|1EDDA7| ADC.w Bee_BounceBoundaries,Y
|1EDDAA| STA.b $04

|1EDDAC| LDA.b $23
|1EDDAE| ADC.b #$00
|1EDDB0| STA.b $05

|1EDDB2| JSL GetRandomNumber
|1EDDB6| AND.b #$03
|1EDDB8| TAY

|1EDDB9| LDA.b $20
|1EDDBB| CLC
|1EDDBC| ADC.w Bee_BounceBoundaries,Y
|1EDDBF| STA.b $06

|1EDDC1| LDA.b $21
|1EDDC3| ADC.b #$00
|1EDDC5| STA.b $07

|1EDDC7| LDA.b #$14
|1EDDC9| JSL ProjectSpriteSpeedTowardsLocation_long

|1EDDCD| LDA.b $00
|1EDDCF| STA.w $0D40,X

|1EDDD2| LDA.b $01
|1EDDD4| STA.w $0D50,X
|1EDDD7| BPL .flip_horizontally

|1EDDD9| LDA.w $0F50,X
|1EDDDC| AND.b #$BF
|1EDDDE| BRA .save_h_flip

.flip_horizontally
|1EDDE0| LDA.w $0F50,X
|1EDDE3| ORA.b #$40

.save_h_flip
|1EDDE5| STA.w $0F50,X

|1EDDE8| TXA
|1EDDE9| CLC
|1EDDEA| ADC.w $0D90,X
|1EDDED| STA.w $0DF0,X

.exit
|1EDDF0| RTS

;===================================================================================================

Bee_Captured:
|1EDDF1| JSR Bee_HandleInteractions

|1EDDF4| JSR CheckIfActive_bank1E

|1EDDF7| LDA.w $1CE8
|1EDDFA| BNE .freed

|1EDDFC| JSL FindEmptyBottle
|1EDE00| BMI .no_bottles

|1EDE02| LDA.w $0EB0,X
|1EDE05| STA.b $00

|1EDE07| PHX

|1EDE08| TYX

|1EDE09| LDA.b #$07
|1EDE0B| CLC
|1EDE0C| ADC.b $00
|1EDE0E| STA.l $7EF35C,X

|1EDE12| JSL RefreshItemIcon

|1EDE16| PLX

|1EDE17| STZ.w $0DD0,X

|1EDE1A| RTS

;---------------------------------------------------------------------------------------------------

.no_bottles
|1EDE1B| LDA.b #$CA ; MESSAGE 00CA
|1EDE1D| LDY.b #$00
|1EDE1F| JSL ShowMessageUnconditional

.freed
|1EDE23| LDA.b #$40
|1EDE25| STA.w $0F10,X

|1EDE28| LDA.b #$01
|1EDE2A| STA.w $0D80,X

|1EDE2D| RTS

;===================================================================================================

FindEmptyBottle:
|1EDE2E| PHX

|1EDE2F| LDX.b #$00

.next_bottle
|1EDE31| LDA.l $7EF35C,X
|1EDE35| CMP.b #$02
|1EDE37| BEQ .empty

|1EDE39| INX
|1EDE3A| CPX.b #$04
|1EDE3C| BCC .next_bottle

|1EDE3E| LDX.b #$FF

.empty
|1EDE40| TXY
|1EDE41| PLX
|1EDE42| TYA

|1EDE43| RTL

;===================================================================================================

Bee_HandleInteractions:
|1EDE44| LDA.b $11
|1EDE46| CMP.b #$02
|1EDE48| BNE .exit

|1EDE4A| REP #$20

|1EDE4C| LDA.w $1CF0

|1EDE4F| CMP.w #$00C8 ; MESSAGE 00C8
|1EDE52| BEQ .not_caught

|1EDE54| CMP.w #$00CA ; MESSAGE 00CA
|1EDE57| BNE .exit

.not_caught
|1EDE59| SEP #$30

|1EDE5B| LDA.b #$28
|1EDE5D| STA.w $0F10,X

.exit
|1EDE60| SEP #$30

|1EDE62| RTS

;===================================================================================================

Sprite_B2_PlayerBee:
|1EDE63| LDA.w $0D80,X
|1EDE66| JSL JumpTableLocal
|1EDE6A| dw GoldBee_Dormant
|1EDE6C| dw PlayerBee_Main
|1EDE6E| dw Bee_Captured

;===================================================================================================

GoldBee_Dormant:
|1EDE70| LDA.w $0E90,X
|1EDE73| BNE .exit

|1EDE75| STZ.w $0DD0,X

|1EDE78| LDA.l $7EF35C
|1EDE7C| ORA.l $7EF35D
|1EDE80| ORA.l $7EF35E
|1EDE84| ORA.l $7EF35F
|1EDE88| AND.b #$08
|1EDE8A| BNE .exit

|1EDE8C| JSR GoldBee_SpawnSelf

.exit
|1EDE8F| RTS

;===================================================================================================

GoldBee_SpawnSelf:
|1EDE90| LDA.b #$79 ; SPRITE 79
|1EDE92| JSL SpawnSpriteDynamically
|1EDE96| BMI .no_space

|1EDE98| JSL SetSpawnedSpriteCoordinates

|1EDE9C| LDA.b #$01
|1EDE9E| STA.w $0D80,Y

|1EDEA1| LDA.b #$40
|1EDEA3| STA.w $0DF0,Y
|1EDEA6| STA.w $0D90,Y

|1EDEA9| LDA.b #$60
|1EDEAB| STA.w $0F10,Y

|1EDEAE| LDA.b #$01
|1EDEB0| STA.w $0EB0,Y

|1EDEB3| PHX

|1EDEB4| JSL GetRandomNumber
|1EDEB8| AND.b #$07
|1EDEBA| TAX

|1EDEBB| LDA.w BeeSpeedSlow,X
|1EDEBE| STA.w $0D50,Y

|1EDEC1| JSL GetRandomNumber
|1EDEC5| AND.b #$07
|1EDEC7| TAX

|1EDEC8| LDA.w BeeSpeedSlow,X
|1EDECB| STA.w $0D40,Y

|1EDECE| PLX

.no_space
|1EDECF| RTS

;===================================================================================================

PlayerBee_Useless:
|1EDED0| db $0A, $14

;===================================================================================================

PlayerBee_Main:
|1EDED2| LDA.b #$01
|1EDED4| STA.w $0BA0,X

|1EDED7| JSR Bee_HandleZ

|1EDEDA| JSL SpriteDraw_SingleSmall_long

|1EDEDE| JSR Bee_HandleInteractions
|1EDEE1| JSR CheckIfActive_bank1E

|1EDEE4| JSR BuzzBuzz

|1EDEE7| JSR MoveSpriteXY_bank1E

|1EDEEA| TXA
|1EDEEB| EOR.b $1A
|1EDEED| LSR A
|1EDEEE| AND.b #$01
|1EDEF0| STA.w $0DC0,X

|1EDEF3| LDA.w $0EB0,X
|1EDEF6| BEQ .regular_bee

|1EDEF8| JSL SpawnBeeSparkle

.regular_bee
|1EDEFC| LDA.w $0DA0,X

|1EDEFF| LDY.w $0EB0,X

|1EDF02| CMP.w PlayerBee_Useless,Y
|1EDF05| BCC .what

|1EDF07| LDA.b #$40
|1EDF09| STA.w $0CAA,X

|1EDF0C| RTS

.what
|1EDF0D| LDA.w $0F10,X
|1EDF10| BNE .exit

|1EDF12| JSL CheckDamageFromLink_long
|1EDF16| BEQ .not_caught

|1EDF18| LDA.b #$C8 ; MESSAGE 00C8
|1EDF1A| LDY.b #$00
|1EDF1C| JSL ShowMessageUnconditional

|1EDF20| INC.w $0D80,X

|1EDF23| RTS

;---------------------------------------------------------------------------------------------------

.not_caught
|1EDF24| TXA
|1EDF25| EOR.b $1A
|1EDF27| AND.b #$03
|1EDF29| BNE .exit

|1EDF2B| JSR PlayerBee_FindTarget
|1EDF2E| BCS .target_locked

|1EDF30| TXA
|1EDF31| EOR.b $1A
|1EDF33| AND.b #$03
|1EDF35| BNE .exit

|1EDF37| JSL GetRandomNumber
|1EDF3B| AND.b #$03
|1EDF3D| TAY

|1EDF3E| LDA.b $22
|1EDF40| CLC
|1EDF41| ADC.w Bee_BounceBoundaries,Y
|1EDF44| STA.b $04

|1EDF46| LDA.b $23
|1EDF48| ADC.b #$00
|1EDF4A| STA.b $05

|1EDF4C| JSL GetRandomNumber
|1EDF50| AND.b #$03
|1EDF52| TAY

|1EDF53| LDA.b $20
|1EDF55| CLC
|1EDF56| ADC.w Bee_BounceBoundaries,Y
|1EDF59| STA.b $06

|1EDF5B| LDA.b $21
|1EDF5D| ADC.b #$00
|1EDF5F| STA.b $07

;---------------------------------------------------------------------------------------------------

.target_locked
|1EDF61| TXA
|1EDF62| EOR.b $1A
|1EDF64| AND.b #$07
|1EDF66| BNE .exit

|1EDF68| LDA.b #$20
|1EDF6A| JSL ProjectSpriteSpeedTowardsLocation_long

|1EDF6E| LDA.b $00
|1EDF70| STA.w $0D40,X

|1EDF73| LDA.b $01
|1EDF75| STA.w $0D50,X
|1EDF78| BPL .enable_h_flip

|1EDF7A| LDA.w $0F50,X
|1EDF7D| AND.b #$BF
|1EDF7F| BRA .set_h_flip

.enable_h_flip
|1EDF81| LDA.w $0F50,X
|1EDF84| ORA.b #$40

.set_h_flip
|1EDF86| STA.w $0F50,X

.exit
|1EDF89| RTS

;===================================================================================================

Bee_HandleZ:
|1EDF8A| LDA.b #$10
|1EDF8C| STA.w $0F70,X

|1EDF8F| LDA.w $0EB0,X
|1EDF92| BEQ .exit

|1EDF94| LDA.w $0F50,X
|1EDF97| AND.b #$F1
|1EDF99| STA.b $00

|1EDF9B| LDA.b $1A
|1EDF9D| LSR A
|1EDF9E| LSR A
|1EDF9F| LSR A
|1EDFA0| LSR A

|1EDFA1| AND.b #$03
|1EDFA3| INC A
|1EDFA4| ASL A

|1EDFA5| ORA.b $00
|1EDFA7| STA.w $0F50,X

.exit
|1EDFAA| RTS

;===================================================================================================

PlayerBee_FindTarget:
|1EDFAB| LDA.b #$0F
|1EDFAD| STA.b $00

|1EDFAF| TXA
|1EDFB0| ASL A
|1EDFB1| ASL A
|1EDFB2| AND.b #$0F
|1EDFB4| TAY

;---------------------------------------------------------------------------------------------------

.next_sprite
|1EDFB5| CPY.w $0FA0
|1EDFB8| BEQ .unsuitable_target

|1EDFBA| LDA.w $0DD0,Y
|1EDFBD| CMP.b #$09
|1EDFBF| BCC .unsuitable_target

|1EDFC1| LDA.w $0F00,Y
|1EDFC4| BNE .unsuitable_target

|1EDFC6| LDA.w $0E40,Y
|1EDFC9| BMI .potential_target

|1EDFCB| LDA.w $0F20,Y
|1EDFCE| CMP.w $0F20,X
|1EDFD1| BNE .unsuitable_target

|1EDFD3| LDA.w $0F60,Y
|1EDFD6| AND.b #$40
|1EDFD8| BNE .unsuitable_target

|1EDFDA| LDA.w $0BA0,Y
|1EDFDD| BEQ .valid_target
|1EDFDF| BRA .unsuitable_target

.potential_target
|1EDFE1| LDA.w $0EB0,X
|1EDFE4| BEQ .unsuitable_target

|1EDFE6| LDA.w $0CD2,Y
|1EDFE9| AND.b #$40
|1EDFEB| BNE .valid_target

;---------------------------------------------------------------------------------------------------

.unsuitable_target
|1EDFED| DEY

|1EDFEE| TYA
|1EDFEF| AND.b #$0F
|1EDFF1| TAY

|1EDFF2| DEC.b $00
|1EDFF4| BPL .next_sprite

|1EDFF6| CLC

|1EDFF7| RTS

;---------------------------------------------------------------------------------------------------

.valid_target
|1EDFF8| JSL PlayerBee_HoneInOnTarget

|1EDFFC| PHX

|1EDFFD| JSL GetRandomNumber
|1EE001| AND.b #$03
|1EE003| TAX

|1EE004| LDA.w $0D10,Y
|1EE007| CLC
|1EE008| ADC.w Bee_BounceBoundaries,X
|1EE00B| STA.b $04

|1EE00D| LDA.w $0D30,Y
|1EE010| ADC.b #$00
|1EE012| STA.b $05

|1EE014| JSL GetRandomNumber
|1EE018| AND.b #$03
|1EE01A| TAX

|1EE01B| LDA.w $0D00,Y
|1EE01E| CLC
|1EE01F| ADC.w Bee_BounceBoundaries,X
|1EE022| STA.b $06

|1EE024| LDA.w $0D20,Y
|1EE027| ADC.b #$00
|1EE029| STA.b $07

|1EE02B| PLX

|1EE02C| SEC

|1EE02D| RTS

;===================================================================================================

BuzzBuzz:
|1EE02E| TXA
|1EE02F| EOR.b $1A
|1EE031| AND.b #$1F
|1EE033| BNE .exit

|1EE035| LDA.b #$2C ; SFX3.2C
|1EE037| JSL QueueSpriteSFX3WithPan

.exit
|1EE03B| RTS

;===================================================================================================

PlaqueMessages:
.pedestal_low
|1EE03C| db $B6 ; MESSAGE 00B6
|1EE03D| db $B7 ; MESSAGE 00B7

.pedestal_high
|1EE03E| db $00
|1EE03F| db $00

;---------------------------------------------------------------------------------------------------

.desert_low
|1EE040| db $BC ; MESSAGE 00BC
|1EE041| db $BD ; MESSAGE 00BD

.desert_high
|1EE042| db $00
|1EE043| db $00

;---------------------------------------------------------------------------------------------------

Sprite_B3_PedestalPlaque:
|1EE044| JSL GetScreenCoordinates_long
|1EE048| JSR CheckIfActive_bank1E

|1EE04B| LDA.w $02E4
|1EE04E| BNE .cutscene

|1EE050| JSL CheckIfLinkIsBusy
|1EE054| BCC .continue

.cutscene
|1EE056| RTS

.continue
|1EE057| LDA.w $037A
|1EE05A| AND.b #$DF
|1EE05C| STA.w $037A

|1EE05F| LDA.b $8A
|1EE061| CMP.b #$30 ; OW 30
|1EE063| BEQ DesertTablet

;===================================================================================================

MasterSwordPedestal:
|1EE065| LDA.b $2F
|1EE067| BNE .exit

|1EE069| JSL CheckDamageToLink_same_layer_long
|1EE06D| BCC .exit

|1EE06F| LDA.w $0202
|1EE072| CMP.b #$0F
|1EE074| BNE .not_holding_book

|1EE076| LDY.b #$01
|1EE078| BIT.b $F4
|1EE07A| BVS .not_pressing_y

.not_holding_book
|1EE07C| LDA.b $F6
|1EE07E| BPL .exit

|1EE080| LDY.b #$00

.not_pressing_y
|1EE082| CPY.b #$01
|1EE084| BNE .no_book_pose

|1EE086| STZ.w $0300

|1EE089| LDA.b #$20
|1EE08B| STA.w $037A

|1EE08E| STZ.w $012E

.no_book_pose
|1EE091| LDA.w PlaqueMessages.pedestal_low,Y
|1EE094| XBA

|1EE095| LDA.w PlaqueMessages.pedestal_high,Y
|1EE098| TAY

|1EE099| XBA

|1EE09A| JSL ShowMessageUnconditional

.exit
|1EE09E| RTS

;===================================================================================================

DesertTablet:
|1EE09F| LDA.b $2F
|1EE0A1| BNE .exit

|1EE0A3| JSL CheckDamageToLink_same_layer_long
|1EE0A7| BCC .exit

|1EE0A9| LDA.w $0202
|1EE0AC| CMP.b #$0F
|1EE0AE| BNE .not_holding_book

|1EE0B0| LDY.b #$01
|1EE0B2| BIT.b $F4
|1EE0B4| BVS .not_pressing_y

.not_holding_book
|1EE0B6| LDA.b $F6
|1EE0B8| BPL .exit

|1EE0BA| LDY.b #$00

.not_pressing_y
|1EE0BC| CPY.b #$01
|1EE0BE| BNE .no_book_pose

|1EE0C0| STZ.w $0300

|1EE0C3| LDA.b #$20
|1EE0C5| STA.w $037A

|1EE0C8| STZ.w $012E

|1EE0CB| JSL InitiateDesertCutscene

.no_book_pose
|1EE0CF| LDA.w PlaqueMessages.desert_low,Y
|1EE0D2| XBA

|1EE0D3| LDA.w PlaqueMessages.desert_high,Y
|1EE0D6| TAY

|1EE0D7| XBA

|1EE0D8| JSL ShowMessageUnconditional

.exit
|1EE0DC| RTS

;===================================================================================================

Sprite_B4_PurpleChest:
|1EE0DD| JSL SpriteDraw_SingleLarge_long
|1EE0E1| JSR CheckIfActive_bank1E

|1EE0E4| LDA.w $0D80,X
|1EE0E7| BNE .follow_link

|1EE0E9| LDA.b #$16 ; MESSAGE 0116
|1EE0EB| LDY.b #$01
|1EE0ED| JSL ShowMessageOnContact
|1EE0F1| BCC .exit

|1EE0F3| LDA.l $7EF3CC
|1EE0F7| BNE .exit

|1EE0F9| INC.w $0D80,X

.exit
|1EE0FC| RTS

;---------------------------------------------------------------------------------------------------

.follow_link
|1EE0FD| STZ.w $0DD0,X

|1EE100| LDA.b #$0C ; FOLLOWER 0C
|1EE102| STA.l $7EF3CC

|1EE106| PHX
|1EE107| JSL LoadFollowerGraphics
|1EE10B| PLX

|1EE10C| JSL BecomeFollower

|1EE110| RTS

;===================================================================================================

Sprite_B5_BombShop:
|1EE111| LDA.w $0E80,X
|1EE114| JSL JumpTableLocal
|1EE118| dw BombShop_Clerk
|1EE11A| dw BombShop_Bomb
|1EE11C| dw BombShop_SuperBomb
|1EE11E| dw BombShop_Huff

;===================================================================================================

pool BombShop_Clerk

.message_low
|1EE120| db $17 ; MESSAGE 0117
|1EE121| db $18 ; MESSAGE 0118

.message_high
|1EE122| db $01
|1EE123| db $01

.anim_step
|1EE124| db $00, $01, $00, $01, $00, $01, $00, $01

.timer
|1EE12C| db 255,  32, 255,  24,  15,  24, 255,  15

endpool

;---------------------------------------------------------------------------------------------------

BombShop_Clerk:
|1EE134| JSR SpriteDraw_BombShop
|1EE137| JSR CheckIfActive_bank1E

|1EE13A| LDA.w $0DF0,X
|1EE13D| BNE .continue

|1EE13F| LDA.w $0E90,X
|1EE142| TAY

|1EE143| INC A
|1EE144| AND.b #$07
|1EE146| STA.w $0E90,X

|1EE149| LDA.w .timer,Y
|1EE14C| STA.w $0DF0,X

|1EE14F| LDA.w .anim_step,Y
|1EE152| STA.w $0DC0,X
|1EE155| BNE .inhale

|1EE157| LDA.b #$11 ; SFX3.11
|1EE159| JSL QueueSpriteSFX3WithPan

|1EE15D| JSR BombShop_ClerkExhalation

|1EE160| BRA .continue

.inhale
|1EE162| LDA.b #$12 ; SFX3.12
|1EE164| JSL QueueSpriteSFX3WithPan

;---------------------------------------------------------------------------------------------------

.continue
|1EE168| LDY.b #$00

|1EE16A| LDA.l $7EF37A
|1EE16E| AND.b #$05
|1EE170| CMP.b #$05
|1EE172| BNE .no_super_bomb_message

|1EE174| LDA.l $7EF3C9
|1EE178| AND.b #$20
|1EE17A| BEQ .no_super_bomb_message

|1EE17C| LDY.b #$01

.no_super_bomb_message
|1EE17E| LDA.w .message_low,Y
|1EE181| XBA

|1EE182| LDA.w .message_high,Y
|1EE185| TAY

|1EE186| XBA

|1EE187| JSL ShowSolicitedMessage
|1EE18B| JSL BehaveAsBarrier

|1EE18F| RTS

;===================================================================================================

BombShop_Bomb:
|1EE190| JSR SpriteDraw_BombShop
|1EE193| JSR CheckIfActive_bank1E
|1EE196| JSL BehaveAsBarrier

|1EE19A| JSR ShopItem_CheckForAPress
|1EE19D| BCC .exit

|1EE19F| LDA.l $7EF370
|1EE1A3| PHX

|1EE1A4| TAX
|1EE1A5| LDA.l CapacityUpgrades.bombs_hex,X

|1EE1A9| PLX

|1EE1AA| CMP.l $7EF343
|1EE1AE| BEQ .no_space

|1EE1B0| LDA.b #$64
|1EE1B2| LDY.b #$00
|1EE1B4| JSR ShopItem_HandleCost
|1EE1B7| BCC .too_poor

|1EE1B9| LDA.b #$1B
|1EE1BB| STA.l $7EF375

|1EE1BF| STZ.w $0DD0,X

|1EE1C2| LDA.b #$19 ; MESSAGE 0119
|1EE1C4| LDY.b #$01
|1EE1C6| JSL ShowMessageUnconditional

|1EE1CA| LDY.b #$28 ; ITEMGET 28
|1EE1CC| JSR ShopItem_HandleReceipt

.exit
|1EE1CF| RTS

;---------------------------------------------------------------------------------------------------

.no_space
|1EE1D0| LDA.b #$6E ; MESSAGE 016E
|1EE1D2| LDY.b #$01
|1EE1D4| JSL ShowMessageUnconditional

|1EE1D8| JSR ShopItem_PlayBeep

|1EE1DB| RTS

.too_poor
|1EE1DC| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

BombShop_SuperBomb:
|1EE1DF| JSR SpriteDraw_BombShop
|1EE1E2| JSR CheckIfActive_bank1E
|1EE1E5| JSL BehaveAsBarrier
|1EE1E9| JSR ShopItem_CheckForAPress
|1EE1EC| BCC .exit

|1EE1EE| LDA.b #$64
|1EE1F0| LDY.b #$00
|1EE1F2| JSR ShopItem_HandleCost
|1EE1F5| BCC .too_poor

|1EE1F7| LDA.b #$0D ; FOLLOWER 0D
|1EE1F9| STA.l $7EF3CC

|1EE1FD| PHX
|1EE1FE| JSL LoadFollowerGraphics
|1EE202| PLX

|1EE203| JSL BecomeFollower

|1EE207| STZ.w $0DD0,X

|1EE20A| LDA.b #$1A ; MESSAGE 011A
|1EE20C| LDY.b #$01
|1EE20E| JSL ShowMessageUnconditional

.exit
|1EE212| RTS

;---------------------------------------------------------------------------------------------------

.too_poor
|1EE213| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

pool BombShop_Huff

.prop
|1EE216| db $04, $44, $C4, $84

endpool

;---------------------------------------------------------------------------------------------------

BombShop_Huff:
|1EE21A| LDA.b #$04
|1EE21C| JSL AllocateOAMInRegionC

|1EE220| JSL SpriteDraw_SingleSmall_long

|1EE224| JSR CheckIfActive_bank1E

|1EE227| LDA.w $0F50,X
|1EE22A| AND.b #$30
|1EE22C| STA.w $0F50,X

|1EE22F| LDA.b $1A
|1EE231| LSR A
|1EE232| LSR A
|1EE233| AND.b #$03
|1EE235| TAY

|1EE236| LDA.w $0F50,X
|1EE239| ORA.w .prop,Y
|1EE23C| STA.w $0F50,X

|1EE23F| INC.w $0F80,X

|1EE242| JSR MoveSpriteZ_bank1E

|1EE245| LDA.w $0DF0,X
|1EE248| BNE .stick_around_for_now

|1EE24A| STZ.w $0DD0,X

.stick_around_for_now
|1EE24D| LSR A
|1EE24E| LSR A
|1EE24F| LSR A
|1EE250| AND.b #$03
|1EE252| STA.w $0DC0,X

|1EE255| RTS

;===================================================================================================

BombShop_ClerkExhalation:
|1EE256| LDA.b #$B5 ; SPRITE B5
|1EE258| JSL SpawnSpriteDynamically

|1EE25C| LDA.b #$03
|1EE25E| STA.w $0E80,Y
|1EE261| STA.w $0BA0,Y

|1EE264| LDA.b $00
|1EE266| CLC
|1EE267| ADC.b #$04
|1EE269| STA.w $0D10,Y

|1EE26C| LDA.b $01
|1EE26E| STA.w $0D30,Y

|1EE271| LDA.b $02
|1EE273| CLC
|1EE274| ADC.b #$10
|1EE276| STA.w $0D00,Y

|1EE279| LDA.b $03
|1EE27B| STA.w $0D20,Y

|1EE27E| LDA.b #$04
|1EE280| STA.w $0F70,Y

|1EE283| LDA.b #$F4
|1EE285| STA.w $0F80,Y

|1EE288| LDA.b #$17
|1EE28A| STA.w $0DF0,Y

|1EE28D| LDA.w $0E60,Y
|1EE290| AND.b #$EE
|1EE292| STA.w $0E60,Y

|1EE295| RTS

;===================================================================================================

pool SpriteDraw_BombShop

.oam_groups
|1EE296| dw   0,   0 : db $48, $0A, $00, $02
|1EE29E| dw   0,   0 : db $4C, $0A, $00, $02

|1EE2A6| dw   0,   0 : db $C2, $04, $00, $02
|1EE2AE| dw   0,   0 : db $C2, $04, $00, $02

|1EE2B6| dw   0,   0 : db $4E, $08, $00, $02
|1EE2BE| dw   0,   0 : db $4E, $08, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_BombShop:
|1EE2C6| LDA.b #$01
|1EE2C8| STA.b $06
|1EE2CA| STZ.b $07

|1EE2CC| LDA.w $0E80,X
|1EE2CF| ASL A

|1EE2D0| ADC.w $0DC0,X
|1EE2D3| ASL A
|1EE2D4| ASL A
|1EE2D5| ASL A

|1EE2D6| ADC.b #<.oam_groups
|1EE2D8| STA.b $08

|1EE2DA| LDA.b #>.oam_groups
|1EE2DC| ADC.b #$00
|1EE2DE| STA.b $09

|1EE2E0| JSL TabulatedSpriteDraw.player_deferred
|1EE2E4| JSL DrawSpriteShadow_long

|1EE2E8| RTS

;===================================================================================================

pool Kiki_WalkOnRoof

.speed_x ; bleeds into next
|1EE2E9| db   0,   0

.speed_y
|1EE2EB| db  -9,   9,   0,   0

endpool

;===================================================================================================

Sprite_B6_Kiki:
|1EE2EF| LDA.w $0E80,X
|1EE2F2| JSL JumpTableLocal
|1EE2F6| dw Kiki_Dormant
|1EE2F8| dw Kiki_OfferEntranceService
|1EE2FA| dw Kiki_OfferInitialService
|1EE2FC| dw Kiki_Flee

;===================================================================================================

Kiki_Flee:
|1EE2FE| JSR SpriteDraw_Kiki
|1EE301| JSR CheckIfActive_bank1E

|1EE304| LDA.w $0F70,X
|1EE307| BNE .dont_flag

|1EE309| REP #$20

|1EE30B| LDA.w $0FD8
|1EE30E| SEC
|1EE30F| SBC.w #$0C98

|1EE312| CMP.w #$00D0
|1EE315| BCS .dont_flag

|1EE317| LDA.w $0FDA
|1EE31A| SEC
|1EE31B| SBC.w #$06A5

|1EE31E| CMP.w #$00D0
|1EE321| BCS .dont_flag

|1EE323| LDA.w #$FFFF
|1EE326| STA.b $01

.dont_flag
|1EE328| SEP #$30

|1EE32A| LDA.b $01
|1EE32C| ORA.b $03
|1EE32E| BEQ .stay

|1EE330| STZ.w $0DD0,X

.stay
|1EE333| DEC.w $0F80,X
|1EE336| DEC.w $0F80,X

|1EE339| JSR MoveSpriteXYZ_bank1E

|1EE33C| LDA.w $0F70,X
|1EE33F| BPL .no_bounce

|1EE341| STZ.w $0F70,X

|1EE344| JSL GetRandomNumber
|1EE348| AND.b #$0F
|1EE34A| ORA.b #$10
|1EE34C| STA.w $0F80,X

.no_bounce
|1EE34F| LDA.b #$F5
|1EE351| STA.b $04

|1EE353| LDA.b #$0C
|1EE355| STA.b $05

|1EE357| LDA.b #$FE
|1EE359| STA.b $06

|1EE35B| LDA.b #$06
|1EE35D| STA.b $07

|1EE35F| LDA.b #$10
|1EE361| JSL ProjectSpriteSpeedTowardsLocation_long

|1EE365| LDA.b $00
|1EE367| ASL A
|1EE368| STA.w $0D40,X

|1EE36B| LDA.b $01
|1EE36D| ASL A
|1EE36E| STA.w $0D50,X

|1EE371| LDA.w $02F2
|1EE374| AND.b #$FC
|1EE376| STA.w $02F2

|1EE379| LDA.b $00
|1EE37B| BPL .positive_x

|1EE37D| EOR.b #$FF
|1EE37F| INC A
|1EE380| STA.b $00

.positive_x
|1EE382| LDA.b $01
|1EE384| BPL .positive_y

|1EE386| EOR.b #$FF
|1EE388| INC A

.positive_y
|1EE389| CMP.b $00
|1EE38B| BCC .at_max_x

|1EE38D| LDA.w $0D50,X
|1EE390| ROL A
|1EE391| ROL A
|1EE392| AND.b #$01
|1EE394| EOR.b #$03
|1EE396| BRA .continue

.at_max_x
|1EE398| LDA.w $0D40,X
|1EE39B| ROL A
|1EE39C| ROL A
|1EE39D| AND.b #$01
|1EE39F| EOR.b #$01

.continue
|1EE3A1| STA.w $0DE0,X

|1EE3A4| LDA.b $1A
|1EE3A6| LSR A
|1EE3A7| LSR A
|1EE3A8| LSR A
|1EE3A9| AND.b #$01
|1EE3AB| STA.w $0DC0,X

|1EE3AE| RTS

;===================================================================================================

Kiki_OfferInitialService:
|1EE3AF| LDA.w $0D80,X
|1EE3B2| DEC A
|1EE3B3| DEC A
|1EE3B4| BMI .invisible

|1EE3B6| JSR SpriteDraw_Kiki

.invisible
|1EE3B9| JSR CheckIfActive_bank1E
|1EE3BC| JSR MoveSpriteXYZ_bank1E

|1EE3BF| DEC.w $0F80,X

|1EE3C2| LDA.w $0F70,X
|1EE3C5| BPL .airborne

|1EE3C7| STZ.w $0F80,X
|1EE3CA| STZ.w $0F70,X

.airborne
|1EE3CD| LDA.b $1A
|1EE3CF| LSR A
|1EE3D0| LSR A
|1EE3D1| LSR A
|1EE3D2| AND.b #$01
|1EE3D4| STA.w $0DC0,X

|1EE3D7| LDA.w $0D80,X
|1EE3DA| JSL JumpTableLocal
|1EE3DE| dw Kiki_OfferToFollow
|1EE3E0| dw Kiki_OfferToFollowTransaction
|1EE3E2| dw Kiki_MoveTowardsLink
|1EE3E4| dw Kiki_WaitABit
|1EE3E6| dw Kiki_EndIntroductionCutscene

;===================================================================================================

Kiki_OfferToFollow:
|1EE3E8| LDA.b #$1E ; MESSAGE 011E
|1EE3EA| LDY.b #$01
|1EE3EC| JSL ShowMessageUnconditional

|1EE3F0| INC.w $0D80,X

|1EE3F3| RTS

;===================================================================================================

Kiki_OfferToFollowTransaction:
|1EE3F4| LDA.w $1CE8
|1EE3F7| BNE .offer_rejected

|1EE3F9| LDA.b #$0A
|1EE3FB| LDY.b #$00
|1EE3FD| JSR ShopItem_HandleCost
|1EE400| BCC .offer_rejected

|1EE402| LDA.b #$1F ; MESSAGE 011F
|1EE404| LDY.b #$01
|1EE406| JSL ShowMessageUnconditional

|1EE40A| LDA.w $02F2
|1EE40D| ORA.b #$03
|1EE40F| STA.w $02F2

|1EE412| STZ.w $0DD0,X

|1EE415| RTS

;---------------------------------------------------------------------------------------------------

.offer_rejected
|1EE416| LDA.b #$20 ; MESSAGE 0120
|1EE418| LDY.b #$01
|1EE41A| JSL ShowMessageUnconditional

|1EE41E| LDA.w $02F2
|1EE421| AND.b #$FC
|1EE423| STA.w $02F2

|1EE426| LDA.b #$00
|1EE428| STA.l $7EF3CC

|1EE42C| INC.w $0D80,X
|1EE42F| INC.w $02E4

|1EE432| RTS

;===================================================================================================

Kiki_MoveTowardsLink:
|1EE433| INC.w $0D80,X

|1EE436| LDA.b #$F5
|1EE438| STA.b $04

|1EE43A| LDA.b #$0C
|1EE43C| STA.b $05

|1EE43E| LDA.b #$FE
|1EE440| STA.b $06

|1EE442| LDA.b #$06
|1EE444| STA.b $07

|1EE446| LDA.b #$09
|1EE448| JSL ProjectSpriteSpeedTowardsLocation_long

|1EE44C| LDA.b $00
|1EE44E| STA.w $0D40,X

|1EE451| LDA.b $01
|1EE453| STA.w $0D50,X

|1EE456| ASL A
|1EE457| ROL A
|1EE458| AND.b #$01
|1EE45A| EOR.b #$03
|1EE45C| STA.w $0DE0,X

|1EE45F| LDA.b #$20
|1EE461| STA.w $0DF0,X

|1EE464| RTS

;===================================================================================================

Kiki_WaitABit:
|1EE465| LDA.w $0DF0,X
|1EE468| BNE .exit

|1EE46A| INC.w $0D80,X

|1EE46D| LDA.b #$10
|1EE46F| STA.w $0F80,X
|1EE472| STA.w $0DF0,X

.exit
|1EE475| RTS

;===================================================================================================

Kiki_EndIntroductionCutscene:
|1EE476| LDA.w $0DF0,X
|1EE479| BNE .exit

|1EE47B| LDA.w $0F70,X
|1EE47E| BNE .exit

|1EE480| STZ.w $0DD0,X
|1EE483| STZ.w $02E4

.exit
|1EE486| RTS

;===================================================================================================

Kiki_Dormant:
|1EE487| JSL GetScreenCoordinates_long
|1EE48B| JSR CheckIfActive_bank1E

|1EE48E| LDA.w $02E0
|1EE491| BNE .exit

|1EE493| LDA.w $037B
|1EE496| ORA.w $031F
|1EE499| BNE .exit

|1EE49B| LDA.l $7EF3CC
|1EE49F| CMP.b #$0A ; FOLLOWER 0A
|1EE4A1| BEQ .exit

|1EE4A3| PHX

|1EE4A4| LDX.b $8A
|1EE4A6| LDA.l $7EF280,X

|1EE4AA| PLX

|1EE4AB| AND.b #$20
|1EE4AD| BNE .exit

|1EE4AF| JSL CheckDamageToLink_same_layer_long
|1EE4B3| BCC .exit

|1EE4B5| LDA.b #$0A ; FOLLOWER 0A
|1EE4B7| STA.l $7EF3CC

|1EE4BB| PHX

|1EE4BC| STZ.w $02F9

|1EE4BF| JSL LoadFollowerGraphics
|1EE4C3| JSL InitializeFollower

|1EE4C7| PLX

.exit
|1EE4C8| RTS

;===================================================================================================

Kiki_OfferEntranceService:
|1EE4C9| JSR SpriteDraw_Kiki
|1EE4CC| JSR CheckIfActive_bank1E
|1EE4CF| JSR MoveSpriteXYZ_bank1E

|1EE4D2| DEC.w $0F80,X

|1EE4D5| LDA.w $0F70,X
|1EE4D8| BPL .airborne

|1EE4DA| STZ.w $0F80,X
|1EE4DD| STZ.w $0F70,X

.airborne
|1EE4E0| LDA.w $0D80,X
|1EE4E3| JSL JumpTableLocal
|1EE4E7| dw Kiki_OfferToOpenPOD
|1EE4E9| dw Kiki_VerifyPurchase
|1EE4EB| dw Kiki_HopToSpot
|1EE4ED| dw Kiki_DartHead

|1EE4EF| dw Kiki_HopToSpot
|1EE4F1| dw Kiki_DartHead
|1EE4F3| dw Kiki_HopToSpot
|1EE4F5| dw Kiki_WalkOnRoof

|1EE4F7| dw Kiki_ReadyButtonPress
|1EE4F9| dw Kiki_SlamButton
|1EE4FB| dw Kiki_IdleOnRoof

;===================================================================================================

Kiki_OfferToOpenPOD:
|1EE4FD| LDA.b #$1B ; MESSAGE 011B
|1EE4FF| LDY.b #$01
|1EE501| JSL ShowMessageUnconditional

|1EE505| INC.w $0D80,X

|1EE508| RTS

;===================================================================================================

Kiki_VerifyPurchase:
|1EE509| LDA.w $1CE8
|1EE50C| BEQ .made_the_sale

.too_poor
|1EE50E| LDA.b #$1C ; MESSAGE 011C
|1EE510| LDY.b #$01
|1EE512| JSL ShowMessageUnconditional

|1EE516| LDA.b #$03
|1EE518| STA.w $0E80,X

|1EE51B| RTS

.made_the_sale
|1EE51C| LDA.b #$64
|1EE51E| LDY.b #$00
|1EE520| JSR ShopItem_HandleCost
|1EE523| BCC .too_poor

|1EE525| LDA.b #$1D ; MESSAGE 011D
|1EE527| LDY.b #$01
|1EE529| JSL ShowMessageUnconditional

|1EE52D| INC.w $02E4

|1EE530| INC.w $0D80,X

|1EE533| STZ.w $0DE0,X

|1EE536| RTS

;===================================================================================================

pool Kiki_DartHead

.next_jump_speed
|1EE537| db  32,  28

endpool

;---------------------------------------------------------------------------------------------------

Kiki_DartHead:
|1EE539| LDA.w $0E00,X
|1EE53C| BNE .delay

|1EE53E| LDA.w $0D80,X
|1EE541| INC.w $0D80,X

|1EE544| LSR A
|1EE545| AND.b #$01
|1EE547| TAY

|1EE548| LDA.w .next_jump_speed,Y
|1EE54B| STA.w $0F80,X

|1EE54E| LDA.b #$20 ; SFX2.20
|1EE550| JSL QueueSpriteSFX2WithPan

|1EE554| LDA.w $0D80,X
|1EE557| LSR A
|1EE558| AND.b #$01
|1EE55A| ORA.b #$04
|1EE55C| STA.w $0DE0,X

|1EE55F| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EE560| LDA.w $0D80,X
|1EE563| LSR A
|1EE564| AND.b #$01
|1EE566| ORA.b #$06
|1EE568| STA.w $0DE0,X

|1EE56B| LDA.b $1A
|1EE56D| LSR A
|1EE56E| LSR A
|1EE56F| LSR A
|1EE570| AND.b #$01
|1EE572| STA.w $0DC0,X

|1EE575| RTS

;===================================================================================================

pool Kiki_HopToSpot

.target_y
|1EE576| dw $0661
|1EE578| dw $064C
|1EE57A| dw $0624

.target_x
|1EE57C| dw $0F4F
|1EE57E| dw $0F70
|1EE580| dw $0F5D

endpool

;---------------------------------------------------------------------------------------------------

Kiki_HopToSpot:
|1EE582| LDA.b $1A
|1EE584| LSR A
|1EE585| LSR A
|1EE586| LSR A
|1EE587| AND.b #$01
|1EE589| STA.w $0DC0,X

|1EE58C| LDA.w $0D80,X
|1EE58F| SEC
|1EE590| SBC.b #$02
|1EE592| TAY

|1EE593| LDA.w .target_x+0,Y
|1EE596| SEC
|1EE597| SBC.w $0D10,X
|1EE59A| CLC
|1EE59B| ADC.b #$02

|1EE59D| CMP.b #$04
|1EE59F| BCS .not_at_target

|1EE5A1| LDA.w .target_y+0,Y
|1EE5A4| SEC
|1EE5A5| SBC.w $0D00,X
|1EE5A8| CLC
|1EE5A9| ADC.b #$02

|1EE5AB| CMP.b #$04
|1EE5AD| BCS .not_at_target

|1EE5AF| INC.w $0D80,X

|1EE5B2| STZ.w $0D40,X
|1EE5B5| STZ.w $0D50,X

|1EE5B8| LDA.b #$20
|1EE5BA| STA.w $0E00,X

|1EE5BD| LDA.b #$21 ; SFX2.21
|1EE5BF| JSL QueueSpriteSFX2WithPan

|1EE5C3| RTS

;---------------------------------------------------------------------------------------------------

.not_at_target
|1EE5C4| LDA.w .target_x+0,Y
|1EE5C7| STA.b $04

|1EE5C9| LDA.w .target_x+1,Y
|1EE5CC| STA.b $05

|1EE5CE| LDA.w .target_y+0,Y
|1EE5D1| STA.b $06

|1EE5D3| LDA.w .target_y+1,Y
|1EE5D6| STA.b $07

|1EE5D8| LDA.b #$09
|1EE5DA| JSL ProjectSpriteSpeedTowardsLocation_long

|1EE5DE| LDA.b $00
|1EE5E0| STA.w $0D40,X

|1EE5E3| LDA.b $01
|1EE5E5| STA.w $0D50,X

|1EE5E8| RTS

;===================================================================================================

pool Kiki_WalkOnRoof

.step
|1EE5E9| db $02, $01, $FF

.timer
|1EE5EC| db  82,   0

endpool

;---------------------------------------------------------------------------------------------------

Kiki_WalkOnRoof:
|1EE5EE| LDA.b $1A
|1EE5F0| LSR A
|1EE5F1| LSR A
|1EE5F2| LSR A
|1EE5F3| AND.b #$01
|1EE5F5| STA.w $0DC0,X

|1EE5F8| LDA.w $0F70,X
|1EE5FB| BNE .exit

|1EE5FD| LDA.w $0DF0,X
|1EE600| BNE .exit

|1EE602| LDA.w $0D90,X
|1EE605| TAY

|1EE606| INC.w $0D90,X

|1EE609| LDA.w .step,Y
|1EE60C| BMI .on_roof

|1EE60E| PHA

|1EE60F| STA.w $0DE0,X

|1EE612| LDA.w .timer,Y
|1EE615| STA.w $0DF0,X

|1EE618| PLA
|1EE619| TAY

|1EE61A| LDA.w .speed_x,Y
|1EE61D| STA.w $0D50,X

|1EE620| LDA.w .speed_y,Y
|1EE623| STA.w $0D40,X

.exit
|1EE626| RTS

;---------------------------------------------------------------------------------------------------

.on_roof
|1EE627| INC.w $0D80,X

|1EE62A| STZ.w $0D50,X
|1EE62D| STZ.w $0D40,X

|1EE630| LDA.b #$01
|1EE632| STA.w $04C6

|1EE635| STZ.b $B0
|1EE637| STZ.b $C8

|1EE639| STZ.w $0DE0,X

|1EE63C| STZ.w $02E4

|1EE63F| RTS

;===================================================================================================

Kiki_ReadyButtonPress:
|1EE640| LDA.b #$08
|1EE642| STA.w $0DE0,X

|1EE645| STZ.w $0DC0,X

|1EE648| JSL GetRandomNumber
|1EE64C| AND.b #$0F
|1EE64E| ADC.b #$10
|1EE650| STA.w $0F80,X

|1EE653| INC.w $0D80,X

|1EE656| RTS

;===================================================================================================

Kiki_SlamButton:
|1EE657| LDA.w $0F80,X
|1EE65A| BPL Kiki_IdleOnRoof

|1EE65C| LDA.w $0F70,X
|1EE65F| BNE Kiki_IdleOnRoof

|1EE661| INC.w $0D80,X

|1EE664| LDA.b #$25 ; SFX3.25
|1EE666| JSL QueueSpriteSFX3WithPan

;===================================================================================================

Kiki_IdleOnRoof:
|1EE66A| RTS

;===================================================================================================

Kiki_RevertToSprite:
|1EE66B| JSR Kiki_SpawnHandlerMonke

|1EE66E| LDA.b #$01
|1EE670| STA.w $0E80,Y

|1EE673| LDA.b #$00
|1EE675| STA.l $7EF3CC

|1EE679| RTL

;===================================================================================================

Kiki_SpawnHandlerMonke:
|1EE67A| PHA

|1EE67B| LDA.b #$B6 ; SPRITE B6
|1EE67D| JSL SpawnSpriteDynamically
|1EE681| BMI .no_space

|1EE683| PLA
|1EE684| PHX
|1EE685| TAX

|1EE686| LDA.w $1A64,X
|1EE689| AND.b #$03
|1EE68B| STA.w $0EB0,Y
|1EE68E| STA.w $0DE0,Y

|1EE691| LDA.w $1A00,X
|1EE694| CLC
|1EE695| ADC.b #$02
|1EE697| STA.w $0D00,Y

|1EE69A| LDA.w $1A14,X
|1EE69D| ADC.b #$00
|1EE69F| STA.w $0D20,Y

|1EE6A2| LDA.w $1A28,X
|1EE6A5| CLC
|1EE6A6| ADC.b #$02
|1EE6A8| STA.w $0D10,Y

|1EE6AB| LDA.w $1A3C,X
|1EE6AE| ADC.b #$00
|1EE6B0| STA.w $0D30,Y

|1EE6B3| LDA.b $EE
|1EE6B5| STA.w $0F20,Y

|1EE6B8| LDA.b #$01
|1EE6BA| STA.w $0BA0,Y

|1EE6BD| INC A
|1EE6BE| STA.w $0F20,Y

|1EE6C1| STZ.b $5E

|1EE6C3| PLX

|1EE6C4| RTS

.no_space
|1EE6C5| PLA

|1EE6C6| RTS

;===================================================================================================

Kiki_SpawnHandler_A:
|1EE6C7| JSR Kiki_SpawnHandlerMonke

|1EE6CA| LDA.b #$02
|1EE6CC| STA.w $0E80,Y

|1EE6CF| RTL

;===================================================================================================

Kiki_SpawnHandler_B:
|1EE6D0| JSR Kiki_SpawnHandlerMonke

|1EE6D3| LDA.b #$01
|1EE6D5| STA.w $0F70,Y

|1EE6D8| LDA.b #$10
|1EE6DA| STA.w $0F80,Y

|1EE6DD| LDA.b #$03
|1EE6DF| STA.w $0E80,Y

|1EE6E2| LDA.b #$00
|1EE6E4| STA.l $7EF3CC

|1EE6E8| RTL

;===================================================================================================

pool SpriteDraw_Kiki

.gfx_offset
|1EE6E9| db $20, $C0
|1EE6EB| db $20, $C0
|1EE6ED| db $00, $A0
|1EE6EF| db $00, $A0
|1EE6F1| db $40, $80
|1EE6F3| db $40, $60
|1EE6F5| db $40, $80
|1EE6F7| db $40, $60

;---------------------------------------------------------------------------------------------------

.oam_groups_a
|1EE6F9| dw   0,  -6 : db $20, $00, $00, $02
|1EE701| dw   0,   0 : db $22, $00, $00, $02

|1EE709| dw   0,  -6 : db $20, $00, $00, $02
|1EE711| dw   0,   0 : db $22, $40, $00, $02

|1EE719| dw   0,  -6 : db $20, $00, $00, $02
|1EE721| dw   0,   0 : db $22, $00, $00, $02

|1EE729| dw   0,  -6 : db $20, $00, $00, $02
|1EE731| dw   0,   0 : db $22, $40, $00, $02

|1EE739| dw  -1,  -6 : db $20, $00, $00, $02
|1EE741| dw   0,   0 : db $22, $00, $00, $02

|1EE749| dw  -1,  -6 : db $20, $00, $00, $02
|1EE751| dw   0,   0 : db $22, $00, $00, $02

|1EE759| dw   1,  -6 : db $20, $40, $00, $02
|1EE761| dw   0,   0 : db $22, $40, $00, $02

|1EE769| dw   1,  -6 : db $20, $40, $00, $02
|1EE771| dw   0,   0 : db $22, $40, $00, $02

|1EE779| dw   0,  -6 : db $CE, $01, $00, $02
|1EE781| dw   0,   0 : db $EE, $01, $00, $02

|1EE789| dw   0,  -6 : db $CE, $01, $00, $02
|1EE791| dw   0,   0 : db $EE, $01, $00, $02

|1EE799| dw   0,  -6 : db $CE, $41, $00, $02
|1EE7A1| dw   0,   0 : db $EE, $41, $00, $02

|1EE7A9| dw   0,  -6 : db $CE, $41, $00, $02
|1EE7B1| dw   0,   0 : db $EE, $41, $00, $02

|1EE7B9| dw  -1,  -6 : db $CE, $01, $00, $02
|1EE7C1| dw   0,   0 : db $EC, $01, $00, $02

|1EE7C9| dw  -1,  -6 : db $CE, $41, $00, $02
|1EE7D1| dw   0,   0 : db $EC, $01, $00, $02

|1EE7D9| dw   1,  -6 : db $CE, $41, $00, $02
|1EE7E1| dw   0,   0 : db $EC, $41, $00, $02

|1EE7E9| dw   1,  -6 : db $CE, $01, $00, $02
|1EE7F1| dw   0,   0 : db $EC, $41, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_groups_b
|1EE7F9| dw   0,  -6 : db $CA, $01, $00, $00
|1EE801| dw   8,  -6 : db $CA, $41, $00, $00
|1EE809| dw   0,   2 : db $DA, $01, $00, $00
|1EE811| dw   8,   2 : db $DA, $41, $00, $00
|1EE819| dw   0,  10 : db $CB, $01, $00, $00
|1EE821| dw   8,  10 : db $CB, $41, $00, $00

|1EE829| dw   0,  -6 : db $DB, $01, $00, $00
|1EE831| dw   8,  -6 : db $DB, $41, $00, $00
|1EE839| dw   0,   2 : db $CC, $01, $00, $00
|1EE841| dw   8,   2 : db $CC, $41, $00, $00
|1EE849| dw   0,  10 : db $DC, $01, $00, $00
|1EE851| dw   8,  10 : db $DD, $41, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Kiki:
|1EE859| LDA.w $0DE0,X
|1EE85C| CMP.b #$08
|1EE85E| BCS .use_set_2

|1EE860| LDA.w $0DE0,X
|1EE863| ASL A
|1EE864| ADC.w $0DC0,X
|1EE867| ASL A
|1EE868| TAY

|1EE869| LDA.w .gfx_offset+0,Y
|1EE86C| STA.w $0AE8

|1EE86F| LDA.w .gfx_offset+1,Y
|1EE872| STA.w $0AEA

|1EE875| TYA
|1EE876| ASL A
|1EE877| ASL A
|1EE878| ASL A
|1EE879| ADC.b #<.oam_groups_a
|1EE87B| STA.b $08

|1EE87D| LDA.b #>.oam_groups_a
|1EE87F| ADC.b #$00
|1EE881| STA.b $09

|1EE883| LDA.b #$02
|1EE885| JSR TabulatedSpriteDraw_bank1E

|1EE888| LDA.w $0F00,X
|1EE88B| BNE .exit_a

|1EE88D| JSL DrawSpriteShadow_long

.exit_a
|1EE891| RTS

;---------------------------------------------------------------------------------------------------

.use_set_2
|1EE892| LDA.w $0DC0,X
|1EE895| ASL A

|1EE896| ADC.w $0DC0,X
|1EE899| ASL A
|1EE89A| ASL A
|1EE89B| ASL A
|1EE89C| ASL A

|1EE89D| ADC.b #<.oam_groups_b
|1EE89F| STA.b $08

|1EE8A1| LDA.b #>.oam_groups_b
|1EE8A3| ADC.b #$00
|1EE8A5| STA.b $09

|1EE8A7| LDA.b #$06
|1EE8A9| JSR TabulatedSpriteDraw_bank1E

|1EE8AC| LDA.w $0F00,X
|1EE8AF| BNE .exit_b

|1EE8B1| JSL DrawSpriteShadow_long

.exit_b
|1EE8B5| RTS

;===================================================================================================

Sprite_B7_BlindMaiden:
|1EE8B6| JSL SpriteDraw_Maiden
|1EE8BA| JSR CheckIfActive_bank1E
|1EE8BD| JSL TrackBodyToHead

|1EE8C1| JSR GetDirectionTowardsLink_bank1E
|1EE8C4| TYA
|1EE8C5| EOR.b #$03
|1EE8C7| STA.w $0EB0,X

|1EE8CA| LDA.w $0D80,X
|1EE8CD| BNE .become_follower

|1EE8CF| LDA.b #$22 ; MESSAGE 0122
|1EE8D1| LDY.b #$01
|1EE8D3| JSL ShowMessageOnContact
|1EE8D7| BCC .exit

|1EE8D9| INC.w $0D80,X

.exit
|1EE8DC| RTS

;---------------------------------------------------------------------------------------------------

.become_follower
|1EE8DD| STZ.w $0DD0,X

|1EE8E0| LDA.b #$06 ; FOLLOWER 06
|1EE8E2| STA.l $7EF3CC

|1EE8E6| PHX
|1EE8E7| JSL LoadFollowerGraphics
|1EE8EB| PLX

|1EE8EC| JSL BecomeFollower

|1EE8F0| RTS

;===================================================================================================

SpritePrep_OldMan:
|1EE8F1| PHB
|1EE8F2| PHK
|1EE8F3| PLB

|1EE8F4| JSR .main

|1EE8F7| PLB

|1EE8F8| RTL

;---------------------------------------------------------------------------------------------------

.main
|1EE8F9| INC.w $0BA0,X

|1EE8FC| LDA.b $A0
|1EE8FE| CMP.b #$E4 ; ROOM 00E4
|1EE900| BNE .not_home

|1EE902| LDA.b #$02
|1EE904| STA.w $0E80,X

|1EE907| RTS

.not_home
|1EE908| LDA.l $7EF3CC
|1EE90C| CMP.b #$00
|1EE90E| BNE .dont_spawn

|1EE910| LDA.l $7EF353
|1EE914| CMP.b #$02
|1EE916| BNE .spawn

|1EE918| STZ.w $0DD0,X

.spawn
|1EE91B| LDA.b #$04 ; FOLLOWER 04
|1EE91D| STA.l $7EF3CC

|1EE921| PHX
|1EE922| JSL LoadFollowerGraphics
|1EE926| PLX

|1EE927| LDA.b #$00
|1EE929| STA.l $7EF3CC

|1EE92D| RTS

;---------------------------------------------------------------------------------------------------

.dont_spawn
|1EE92E| STZ.w $0DD0,X

|1EE931| PHX
|1EE932| JSL LoadFollowerGraphics
|1EE936| PLX

|1EE937| RTS

;===================================================================================================

OldMan_RevertToSprite:
|1EE938| PHA

|1EE939| LDA.b #$AD ; SPRITE AD
|1EE93B| JSL SpawnSpriteDynamically

|1EE93F| PLA

|1EE940| PHX

|1EE941| TAX

|1EE942| LDA.w $1A64,X
|1EE945| AND.b #$03
|1EE947| STA.w $0EB0,Y
|1EE94A| STA.w $0DE0,Y

|1EE94D| LDA.w $1A00,X
|1EE950| CLC
|1EE951| ADC.b #$02
|1EE953| STA.w $0D00,Y

|1EE956| LDA.w $1A14,X
|1EE959| ADC.b #$00
|1EE95B| STA.w $0D20,Y

|1EE95E| LDA.w $1A28,X
|1EE961| CLC
|1EE962| ADC.b #$02
|1EE964| STA.w $0D10,Y

|1EE967| LDA.w $1A3C,X
|1EE96A| ADC.b #$00
|1EE96C| STA.w $0D30,Y

|1EE96F| LDA.b $EE
|1EE971| STA.w $0F20,Y

|1EE974| LDA.b #$01
|1EE976| STA.w $0BA0,Y
|1EE979| STA.w $0E80,Y

|1EE97C| JSR OldMan_EnableCutscene

|1EE97F| PLX

|1EE980| LDA.b #$00
|1EE982| STA.l $7EF3CC

|1EE986| STZ.b $5E

|1EE988| RTL

;===================================================================================================

OldMan_EnableCutscene:
|1EE989| LDA.b #$01
|1EE98B| STA.w $02E4
|1EE98E| STA.w $037B

|1EE991| RTS

;===================================================================================================

Sprite_AD_OldMan:
|1EE992| JSL SpriteDraw_OldMan
|1EE996| JSR CheckIfActive_bank1E

|1EE999| LDA.w $0E80,X
|1EE99C| JSL JumpTableLocal
|1EE9A0| dw OldMan_Lost
|1EE9A2| dw OldMan_Returning
|1EE9A4| dw OldMan_Home

;===================================================================================================

OldMan_Lost:
|1EE9A6| LDA.w $0D80,X
|1EE9A9| JSL JumpTableLocal
|1EE9AD| dw OldMan_Wait
|1EE9AF| dw OldMan_BecomeFollower

;===================================================================================================

OldMan_Wait:
|1EE9B1| JSL TrackBodyToHead

|1EE9B5| JSR GetDirectionTowardsLink_bank1E
|1EE9B8| TYA
|1EE9B9| EOR.b #$03
|1EE9BB| STA.w $0EB0,X

|1EE9BE| LDA.b #$9C ; MESSAGE 009C
|1EE9C0| LDY.b #$00
|1EE9C2| JSL ShowMessageOnContact
|1EE9C6| BCC .exit

|1EE9C8| STA.w $0DE0,X
|1EE9CB| STA.w $0EB0,X

|1EE9CE| INC.w $0D80,X

.exit
|1EE9D1| RTS

;===================================================================================================

OldMan_BecomeFollower:
|1EE9D2| LDA.b #$04 ; FOLLOWER 04
|1EE9D4| STA.l $7EF3CC

|1EE9D8| JSL BecomeFollower

|1EE9DC| LDA.b #$05
|1EE9DE| STA.l $7EF3C8

|1EE9E2| STZ.w $0DD0,X

|1EE9E5| JSL CacheRoomEntryProperties_long

|1EE9E9| RTS

;===================================================================================================

OldMan_Returning:
|1EE9EA| JSR MoveSpriteXY_bank1E

|1EE9ED| LDA.w $0D80,X
|1EE9F0| JSL JumpTableLocal
|1EE9F4| dw OldMan_GiveMirror
|1EE9F6| dw OldMan_Move
|1EE9F8| dw OldMan_EnterDoor
|1EE9FA| dw OldMan_FinishUp

;===================================================================================================

OldMan_GiveMirror:
|1EE9FC| INC.w $0D80,X

|1EE9FF| LDY.b #$1A ; ITEMGET 1A
|1EEA01| STZ.w $02E9
|1EEA04| JSL GrantItemReceipt

|1EEA08| LDA.b #$01
|1EEA0A| STA.l $7EF3C8

|1EEA0E| JSR OldMan_EnableCutscene

|1EEA11| LDA.b #$30
|1EEA13| STA.w $0DF0,X

|1EEA16| LDA.b #$08
|1EEA18| STA.w $0D50,X

|1EEA1B| LSR A
|1EEA1C| STA.w $0D40,X

|1EEA1F| LDA.b #$03
|1EEA21| STA.w $0EB0,X
|1EEA24| STA.w $0DE0,X

|1EEA27| RTS

;===================================================================================================

OldMan_Move:
|1EEA28| JSR OldMan_EnableCutscene

|1EEA2B| LDA.w $0DF0,X
|1EEA2E| BNE .delay

|1EEA30| INC.w $0D80,X

.delay
|1EEA33| TXA
|1EEA34| EOR.b $1A
|1EEA36| LSR A
|1EEA37| LSR A
|1EEA38| LSR A
|1EEA39| AND.b #$01
|1EEA3B| STA.w $0DC0,X

|1EEA3E| RTS

;===================================================================================================

OldMan_EnterDoor:
|1EEA3F| STZ.w $0EB0,X

|1EEA42| STZ.w $0DE0,X

|1EEA45| LDY.w $0FDE

|1EEA48| LDA.w $0B18,Y
|1EEA4B| STA.b $00

|1EEA4D| LDA.w $0B20,Y
|1EEA50| STA.b $01

|1EEA52| LDA.w $0D00,X
|1EEA55| STA.b $02

|1EEA57| LDA.w $0D20,X
|1EEA5A| STA.b $03

|1EEA5C| REP #$20

|1EEA5E| LDA.b $00
|1EEA60| CMP.b $02

|1EEA62| SEP #$30
|1EEA64| BCC .not_north_enough

|1EEA66| INC.w $0D80,X

|1EEA69| STZ.w $0D50,X
|1EEA6C| STZ.w $0D40,X

|1EEA6F| RTS

.not_north_enough
|1EEA70| LDA.w $0B08,Y
|1EEA73| STA.b $04

|1EEA75| LDA.w $0B10,Y
|1EEA78| STA.b $05

|1EEA7A| LDA.w $0B18,Y
|1EEA7D| STA.b $06

|1EEA7F| LDA.w $0B20,Y
|1EEA82| STA.b $07

|1EEA84| LDA.b #$08
|1EEA86| JSL ProjectSpriteSpeedTowardsLocation_long

|1EEA8A| LDA.b $00
|1EEA8C| STA.w $0D40,X

|1EEA8F| LDA.b $01
|1EEA91| STA.w $0D50,X

|1EEA94| TXA
|1EEA95| EOR.b $1A
|1EEA97| LSR A
|1EEA98| LSR A
|1EEA99| LSR A
|1EEA9A| AND.b #$01
|1EEA9C| STA.w $0DC0,X

|1EEA9F| JSR OldMan_EnableCutscene

|1EEAA2| RTS

;===================================================================================================

OldMan_FinishUp:
|1EEAA3| STZ.w $0DD0,X
|1EEAA6| STZ.w $02E4
|1EEAA9| STZ.w $037B

|1EEAAC| RTS

;===================================================================================================

pool OldMan_Home

.message_low
|1EEAAD| db $9E ; MESSAGE 009E
|1EEAAE| db $9F ; MESSAGE 009F
|1EEAAF| db $A0 ; MESSAGE 00A0

.message_high
|1EEAB0| db $00
|1EEAB1| db $00
|1EEAB2| db $00

endpool

;---------------------------------------------------------------------------------------------------

OldMan_Home:
|1EEAB3| JSL BehaveAsBarrier

|1EEAB7| LDA.w $0D80,X
|1EEABA| BEQ .no_kiss

|1EEABC| LDA.b #$A0
|1EEABE| STA.l $7EF372

|1EEAC2| STZ.w $0D80,X

.no_kiss
|1EEAC5| LDY.b #$02

|1EEAC7| LDA.l $7EF3C5
|1EEACB| CMP.b #$03
|1EEACD| BCS .agahnim_defeated

|1EEACF| LDA.l $7EF357
|1EEAD3| TAY

.agahnim_defeated
|1EEAD4| LDA.w .message_low,Y
|1EEAD7| XBA

|1EEAD8| LDA.w .message_high,Y
|1EEADB| TAY

|1EEADC| XBA
|1EEADD| JSL ShowSolicitedMessage
|1EEAE1| BCC .exit

|1EEAE3| INC.w $0D80,X

.exit
|1EEAE6| RTS

;===================================================================================================

Sprite_B8_DialogueTester:
|1EEAE7| JSL SpriteDraw_Priest

|1EEAEB| JSR CheckIfActive_bank1E

|1EEAEE| LDA.w $0D90,X
|1EEAF1| AND.b #$03
|1EEAF3| STA.w $0DE0,X

|1EEAF6| LDA.w $0D80,X
|1EEAF9| JSL JumpTableLocal
|1EEAFD| dw DialogueTester_Initialize
|1EEAFF| dw DialogueTester_TestMessage
|1EEB01| dw DialogueTester_NextMessage

;===================================================================================================

DialogueTester_Initialize:
|1EEB03| STZ.w $0D90,X

|1EEB06| STZ.w $0DA0,X

|1EEB09| INC.w $0D80,X

;===================================================================================================

DialogueTester_TestMessage:
|1EEB0C| LDA.w $0D90,X
|1EEB0F| LDY.w $0DA0,X

|1EEB12| JSL ShowMessageOnContact
|1EEB16| BCC .exit

|1EEB18| INC.w $0D80,X

.exit
|1EEB1B| RTS

;===================================================================================================

DialogueTester_NextMessage:
|1EEB1C| LDA.w $0D90,X
|1EEB1F| CLC
|1EEB20| ADC.b #$01
|1EEB22| STA.w $0D90,X

|1EEB25| LDA.w $0DA0,X
|1EEB28| ADC.b #$00
|1EEB2A| STA.w $0DA0,X

|1EEB2D| LDA.b #$01
|1EEB2F| STA.w $0D80,X

|1EEB32| RTS

;===================================================================================================

Sprite_B9_BullyAndPinkBall:
|1EEB33| LDA.w $0E80,X
|1EEB36| JSL JumpTableLocal
|1EEB3A| dw PinkBall
|1EEB3C| dw PinkBall_Distress
|1EEB3E| dw Bully

;===================================================================================================

PinkBall:
|1EEB40| JSL AllocateOAMDeferToPlayer_long
|1EEB44| JSL SpriteDraw_SingleLarge_long

|1EEB48| JSR CheckIfActive_bank1E
|1EEB4B| JSR PinkBall_HandleMessage

|1EEB4E| LDA.w $0F50,X
|1EEB51| AND.b #$7F
|1EEB53| ORA.w $0EB0,X
|1EEB56| STA.w $0F50,X

|1EEB59| JSR MoveSpriteXYZ_bank1E
|1EEB5C| JSR CheckSpriteTileCollision_bank1E
|1EEB5F| BEQ .no_tile_collision

|1EEB61| AND.b #$03
|1EEB63| BNE .bounce

|1EEB65| LDA.w $0D40,X
|1EEB68| EOR.b #$FF
|1EEB6A| INC A
|1EEB6B| STA.w $0D40,X

|1EEB6E| LDA.w $0E90,X
|1EEB71| BEQ .bounce

|1EEB73| JSR BOIoiOIoiOING
|1EEB76| BRA .no_tile_collision

.bounce
|1EEB78| LDA.w $0D50,X
|1EEB7B| EOR.b #$FF
|1EEB7D| INC A
|1EEB7E| STA.w $0D50,X

|1EEB81| LDA.w $0E90,X
|1EEB84| BEQ .no_tile_collision

|1EEB86| JSR BOIoiOIoiOING

.no_tile_collision
|1EEB89| DEC.w $0F80,X

|1EEB8C| LDA.w $0F70,X
|1EEB8F| BPL .airborne

|1EEB91| STZ.w $0F70,X

|1EEB94| LDA.w $0F80,X
|1EEB97| EOR.b #$FF
|1EEB99| INC A

|1EEB9A| LSR A
|1EEB9B| LSR A
|1EEB9C| STA.w $0F80,X

|1EEB9F| AND.b #$FC
|1EEBA1| BEQ .no_sfx

|1EEBA3| JSR BOIoiOIoiOING

.no_sfx
|1EEBA6| JSR PinkBall_HandleDeceleration

.airborne
|1EEBA9| LDA.w $0E90,X
|1EEBAC| BNE PinkBall_Kicked

|1EEBAE| LDA.w $0EB0,X
|1EEBB1| BEQ PinkBall_RightSideUp

|1EEBB3| JMP.w PinkBall_UpsideDown

;===================================================================================================

PinkBall_RightSideUp:
|1EEBB6| JSR PinkBall_Distress

|1EEBB9| TXA
|1EEBBA| EOR.b $1A
|1EEBBC| PHA

|1EEBBD| LSR A
|1EEBBE| LSR A
|1EEBBF| LSR A
|1EEBC0| AND.b #$01
|1EEBC2| STA.w $0DC0,X

|1EEBC5| PLA
|1EEBC6| AND.b #$3F
|1EEBC8| BNE .continue

|1EEBCA| JSL GetRandomNumber
|1EEBCE| STA.b $04

|1EEBD0| LDA.b $23
|1EEBD2| STA.b $05

|1EEBD4| JSL GetRandomNumber
|1EEBD8| STA.b $06

|1EEBDA| LDA.b $21
|1EEBDC| STA.b $07

|1EEBDE| LDA.b #$08
|1EEBE0| JSL ProjectSpriteSpeedTowardsLocation_long

|1EEBE4| LDA.b $01
|1EEBE6| STA.w $0DA0,X

|1EEBE9| LDA.b $00
|1EEBEB| STA.w $0D90,X

|1EEBEE| BEQ .continue

|1EEBF0| LDA.w $0F50,X
|1EEBF3| ORA.b #$40
|1EEBF5| STA.w $0F50,X

|1EEBF8| LDA.w $0D50,X
|1EEBFB| LSR A
|1EEBFC| AND.b #$40
|1EEBFE| EOR.w $0F50,X
|1EEC01| STA.w $0F50,X

.continue
|1EEC04| LDA.w $0DA0,X
|1EEC07| STA.w $0D50,X

|1EEC0A| LDA.w $0D90,X
|1EEC0D| STA.w $0D40,X

|1EEC10| RTS

;===================================================================================================

PinkBall_Kicked:
|1EEC11| LDA.w $0D50,X
|1EEC14| ORA.w $0D40,X
|1EEC17| BNE .have_momentum

|1EEC19| STZ.w $0E90,X

|1EEC1C| RTS

.have_momentum
|1EEC1D| TXA
|1EEC1E| EOR.b $1A
|1EEC20| PHA

|1EEC21| LSR A
|1EEC22| LSR A
|1EEC23| AND.b #$01
|1EEC25| STA.w $0DC0,X

|1EEC28| PLA
|1EEC29| ASL A
|1EEC2A| ASL A
|1EEC2B| AND.b #$80
|1EEC2D| STA.w $0EB0,X

|1EEC30| RTS

;===================================================================================================

PinkBall_UpsideDown:
|1EEC31| JSR PinkBall_Distress

|1EEC34| TXA
|1EEC35| EOR.b $1A
|1EEC37| BEQ .flip_upright

|1EEC39| LSR A
|1EEC3A| LSR A
|1EEC3B| AND.b #$01
|1EEC3D| STA.w $0DC0,X

|1EEC40| STZ.w $0D50,X
|1EEC43| STZ.w $0D40,X

|1EEC46| RTS

.flip_upright
|1EEC47| STZ.w $0EB0,X

|1EEC4A| RTS

;===================================================================================================

pool PinkBall_HandleDeceleration

.decel
|1EEC4B| db -2,  2

endpool

;---------------------------------------------------------------------------------------------------

PinkBall_HandleDeceleration:
|1EEC4D| LDA.w $0D50,X
|1EEC50| BEQ .handle_y

|1EEC52| PHA

|1EEC53| ASL A
|1EEC54| ROL A
|1EEC55| AND.b #$01
|1EEC57| TAY

|1EEC58| PLA
|1EEC59| CLC
|1EEC5A| ADC.w .decel,Y
|1EEC5D| STA.w $0D50,X

.handle_y
|1EEC60| LDA.w $0D40,X
|1EEC63| BEQ .exit

|1EEC65| PHA

|1EEC66| ASL A
|1EEC67| ROL A
|1EEC68| AND.b #$01
|1EEC6A| TAY

|1EEC6B| PLA
|1EEC6C| CLC
|1EEC6D| ADC.w .decel,Y
|1EEC70| STA.w $0D40,X

.exit
|1EEC73| RTS

;===================================================================================================

PinkBall_Distress:
|1EEC74| JSR GetScreenCoordinates_bank1E
|1EEC77| JSL DrawSpriteDistress

|1EEC7B| RTS

;===================================================================================================

Bully:
|1EEC7C| JSR SpriteDraw_Bully
|1EEC7F| JSR CheckIfActive_bank1E
|1EEC82| JSR Bully_HandleMessage

|1EEC85| JSR MoveSpriteXYZ_bank1E
|1EEC88| JSR CheckSpriteTileCollision_bank1E
|1EEC8B| BEQ .no_tile_collision

|1EEC8D| AND.b #$03
|1EEC8F| BNE .horizontal_collision

|1EEC91| LDA.w $0D40,X
|1EEC94| EOR.b #$FF
|1EEC96| INC A
|1EEC97| STA.w $0D40,X
|1EEC9A| BRA .no_tile_collision

.horizontal_collision
|1EEC9C| LDA.w $0D50,X
|1EEC9F| EOR.b #$FF
|1EECA1| INC A
|1EECA2| STA.w $0D50,X

.no_tile_collision
|1EECA5| LDA.w $0D80,X
|1EECA8| JSL JumpTableLocal
|1EECAC| dw Bully_ChaseVictim
|1EECAE| dw Bully_PuntVictim
|1EECB0| dw Bully_Idle

;===================================================================================================

Bully_ChaseVictim:
|1EECB2| TXA
|1EECB3| EOR.b $1A
|1EECB5| PHA

|1EECB6| LSR A
|1EECB7| LSR A
|1EECB8| LSR A
|1EECB9| AND.b #$01
|1EECBB| STA.w $0DC0,X

|1EECBE| PLA
|1EECBF| AND.b #$1F
|1EECC1| BNE .dont_turn

|1EECC3| LDA.w $0EB0,X
|1EECC6| TAY

|1EECC7| LDA.w $0D10,Y
|1EECCA| STA.b $04

|1EECCC| LDA.w $0D30,Y
|1EECCF| STA.b $05

|1EECD1| LDA.w $0D00,Y
|1EECD4| STA.b $06

|1EECD6| LDA.w $0D20,Y
|1EECD9| STA.b $07

|1EECDB| LDA.b #$0E
|1EECDD| JSL ProjectSpriteSpeedTowardsLocation_long

|1EECE1| LDA.b $00
|1EECE3| STA.w $0D40,X

|1EECE6| LDA.b $01
|1EECE8| STA.w $0D50,X
|1EECEB| BEQ .dont_turn

|1EECED| LDA.w $0D50,X
|1EECF0| ASL A
|1EECF1| ROL A
|1EECF2| AND.b #$01
|1EECF4| STA.w $0DE0,X

.dont_turn
|1EECF7| LDA.w $0EB0,X
|1EECFA| TAY

|1EECFB| LDA.w $0F70,Y
|1EECFE| BNE .exit

|1EED00| LDA.w $0D10,X
|1EED03| SEC
|1EED04| SBC.w $0D10,Y
|1EED07| CLC
|1EED08| ADC.b #$08

|1EED0A| CMP.b #$10
|1EED0C| BCS .exit

|1EED0E| LDA.w $0D00,X
|1EED11| SEC
|1EED12| SBC.w $0D00,Y
|1EED15| CLC
|1EED16| ADC.b #$08

|1EED18| CMP.b #$10
|1EED1A| BCS .exit

|1EED1C| INC.w $0D80,X

|1EED1F| JSR BOIoiOIoiOING

.exit
|1EED22| RTS

;===================================================================================================

Bully_PuntVictim:
|1EED23| INC.w $0D80,X

|1EED26| LDA.w $0EB0,X
|1EED29| TAY

|1EED2A| LDA.w $0D50,X
|1EED2D| ASL A
|1EED2E| STA.w $0D50,Y

|1EED31| LDA.w $0D40,X
|1EED34| ASL A
|1EED35| STA.w $0D40,Y

|1EED38| STZ.w $0D50,X
|1EED3B| STZ.w $0D40,X

|1EED3E| JSL GetRandomNumber
|1EED42| AND.b #$1F
|1EED44| STA.w $0F80,Y

|1EED47| LDA.b #$60
|1EED49| STA.w $0DF0,X

|1EED4C| LDA.b #$01
|1EED4E| STA.w $0DC0,X
|1EED51| STA.w $0E90,Y

|1EED54| RTS

;===================================================================================================

Bully_Idle:
|1EED55| LDA.w $0DF0,X
|1EED58| BNE .exit

|1EED5A| STZ.w $0D80,X

.exit
|1EED5D| RTS

;===================================================================================================

pool SpriteDraw_Bully

.oam_groups
|1EED5E| dw   0,  -7 : db $E0, $46, $00, $02
|1EED66| dw   0,   0 : db $E2, $46, $00, $02

|1EED6E| dw   0,  -7 : db $E0, $46, $00, $02
|1EED76| dw   0,   0 : db $C4, $46, $00, $02

|1EED7E| dw   0,  -7 : db $E0, $06, $00, $02
|1EED86| dw   0,   0 : db $E2, $06, $00, $02

|1EED8E| dw   0,  -7 : db $E0, $06, $00, $02
|1EED96| dw   0,   0 : db $C4, $06, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bully:
|1EED9E| LDA.b #$02
|1EEDA0| STA.b $06
|1EEDA2| STZ.b $07

|1EEDA4| LDA.w $0DE0,X
|1EEDA7| ASL A

|1EEDA8| ADC.w $0DC0,X

|1EEDAB| ASL A
|1EEDAC| ASL A
|1EEDAD| ASL A
|1EEDAE| ASL A

|1EEDAF| ADC.b #<.oam_groups
|1EEDB1| STA.b $08

|1EEDB3| LDA.b #>.oam_groups
|1EEDB5| ADC.b #$00
|1EEDB7| STA.b $09

|1EEDB9| JSL TabulatedSpriteDraw.player_deferred
|1EEDBD| JSL DrawSpriteShadow_long

|1EEDC1| RTS

;===================================================================================================

BOIoiOIoiOING:
|1EEDC2| LDA.b #$32 ; SFX3.32
|1EEDC4| JSL QueueSpriteSFX3WithPan

|1EEDC8| RTS

;===================================================================================================

SpawnBully:
|1EEDC9| LDA.b #$B9 ; SPRITE B9
|1EEDCB| JSL SpawnSpriteDynamically
|1EEDCF| BMI .no_space

|1EEDD1| JSL SetSpawnedSpriteCoordinates

|1EEDD5| LDA.b #$02
|1EEDD7| STA.w $0E80,Y

|1EEDDA| TXA
|1EEDDB| STA.w $0EB0,Y

|1EEDDE| LDA.b #$01
|1EEDE0| STA.w $0BA0,Y

.no_space
|1EEDE3| RTL

;===================================================================================================

pool PinkBall_HandleMessage

.message_low
|1EEDE4| db $5B ; MESSAGE 015B
|1EEDE5| db $5C ; MESSAGE 015C

.message_high
|1EEDE6| db $01
|1EEDE7| db $01

endpool

;---------------------------------------------------------------------------------------------------

PinkBall_HandleMessage:
|1EEDE8| LDA.w $0F10,X
|1EEDEB| BNE .exit

|1EEDED| LDA.l $7EF357
|1EEDF1| AND.b #$01
|1EEDF3| TAY

|1EEDF4| LDA.w .message_low,Y
|1EEDF7| XBA

|1EEDF8| LDA.w .message_high,Y
|1EEDFB| TAY

|1EEDFC| XBA

|1EEDFD| JSL ShowMessageOnContact
|1EEE01| BCC .exit

|1EEE03| LDA.w $0D50,X
|1EEE06| EOR.b #$FF
|1EEE08| STA.w $0D50,X

|1EEE0B| LDA.w $0D40,X
|1EEE0E| EOR.b #$FF
|1EEE10| STA.w $0D40,X

|1EEE13| LDA.w $0E90,X
|1EEE16| BEQ .no_sfx

|1EEE18| JSR BOIoiOIoiOING

.no_sfx
|1EEE1B| LDA.b #$40
|1EEE1D| STA.w $0F10,X

.exit
|1EEE20| RTS

;===================================================================================================

pool Bully_HandleMessage

.message_low
|1EEE21| db $5D ; MESSAGE 015D
|1EEE22| db $5E ; MESSAGE 015E

.message_high
|1EEE23| db $01
|1EEE24| db $01

endpool

;---------------------------------------------------------------------------------------------------

Bully_HandleMessage:
|1EEE25| LDA.w $0F10,X
|1EEE28| BNE .exit

|1EEE2A| LDA.l $7EF357
|1EEE2E| AND.b #$01
|1EEE30| TAY

|1EEE31| LDA.w .message_low,Y
|1EEE34| XBA

|1EEE35| LDA.w .message_high,Y
|1EEE38| TAY

|1EEE39| XBA

|1EEE3A| JSL ShowMessageOnContact
|1EEE3E| BCC .exit

|1EEE40| LDA.w $0D50,X
|1EEE43| EOR.b #$FF
|1EEE45| STA.w $0D50,X

|1EEE48| LDA.w $0D40,X
|1EEE4B| EOR.b #$FF
|1EEE4D| STA.w $0D40,X

|1EEE50| LDA.b #$40
|1EEE52| STA.w $0F10,X

.exit
|1EEE55| RTS

;===================================================================================================

WhirlpoolFlip:
|1EEE56| db $00, $40, $C0, $80

;---------------------------------------------------------------------------------------------------

Sprite_BA_Whirlpool:
|1EEE5A| LDA.b $8A
|1EEE5C| CMP.b #$1B ; OW 1B
|1EEE5E| BNE Whirlpool

;===================================================================================================

CastleWarp:
|1EEE60| JSL GetScreenCoordinates_long
|1EEE64| JSR CheckIfActive_bank1E

|1EEE67| REP #$20

|1EEE69| LDA.w $0FD8
|1EEE6C| SEC
|1EEE6D| SBC.b $22
|1EEE6F| CLC
|1EEE70| ADC.w #$0040
|1EEE73| CMP.w #$0051
|1EEE76| BCS .no_warp

|1EEE78| LDA.w $0FDA
|1EEE7B| SEC
|1EEE7C| SBC.b $20
|1EEE7E| CLC
|1EEE7F| ADC.w #$000F
|1EEE82| CMP.w #$0012
|1EEE85| BCS .no_warp

|1EEE87| SEP #$30

|1EEE89| LDA.b #$23
|1EEE8B| STA.b $11

|1EEE8D| LDA.b #$01
|1EEE8F| STA.w $02DB

|1EEE92| STZ.b $B0
|1EEE94| STZ.b $27
|1EEE96| STZ.b $28

|1EEE98| LDA.b #$14 ; LINKSTATE 14
|1EEE9A| STA.b $5D

|1EEE9C| LDA.b $8A
|1EEE9E| AND.b #$40
|1EEEA0| STA.b $7B

.no_warp
|1EEEA2| SEP #$30

|1EEEA4| RTS

;===================================================================================================

Whirlpool:
|1EEEA5| LDA.w $0F50,X
|1EEEA8| AND.b #$3F
|1EEEAA| STA.w $0F50,X

|1EEEAD| LDA.b $1A
|1EEEAF| LSR A
|1EEEB0| LSR A
|1EEEB1| LSR A
|1EEEB2| AND.b #$03
|1EEEB4| TAY

|1EEEB5| LDA.w WhirlpoolFlip,Y
|1EEEB8| ORA.w $0F50,X
|1EEEBB| STA.w $0F50,X

|1EEEBE| LDA.b #$04
|1EEEC0| JSL AllocateOAMInRegionB

|1EEEC4| REP #$20

|1EEEC6| LDA.w $0FD8
|1EEEC9| SEC
|1EEECA| SBC.w #$0005
|1EEECD| STA.w $0FD8

|1EEED0| SEP #$30

|1EEED2| JSL SpriteDraw_SingleLarge_long
|1EEED6| JSR CheckIfActive_bank1E

|1EEED9| JSL CheckDamageToLink_same_layer_long
|1EEEDD| BCC .no_contact

|1EEEDF| LDA.w $0D90,X
|1EEEE2| BNE .exit

|1EEEE4| LDA.b #$2E
|1EEEE6| STA.b $11
|1EEEE8| STZ.b $B0

.exit
|1EEEEA| RTS

.no_contact
|1EEEEB| STZ.w $0D90,X

|1EEEEE| RTS

;===================================================================================================

Sprite_BB_Shopkeeper:
|1EEEEF| LDA.w $0E80,X
|1EEEF2| JSL JumpTableLocal
|1EEEF6| dw Shopkeeper_StandardClerk
|1EEEF8| dw ChestGameGuy
|1EEEFA| dw NiceThiefWithGift
|1EEEFC| dw MiniChestGameGuy
|1EEEFE| dw LostWoodsChestGameGuy
|1EEF00| dw NiceThiefUnderRock
|1EEF02| dw NiceThiefUnderRock

|1EEF04| dw ShopItem_RedPotion150
|1EEF06| dw ShopItem_FighterShield
|1EEF08| dw ShopItem_FireShield
|1EEF0A| dw ShopItem_Heart
|1EEF0C| dw ShopItem_Arrows
|1EEF0E| dw ShopItem_Bombs
|1EEF10| dw ShopItem_Bee

;===================================================================================================

Shopkeeper_StandardClerk:
|1EEF12| LDA.w $0FFF
|1EEF15| BEQ .light_world

|1EEF17| JSL AllocateOAMDeferToPlayer_long
|1EEF1B| JSL SpriteDraw_SingleLarge_long
|1EEF1F| JSR CheckIfActive_bank1E

|1EEF22| LDA.w $0F50,X
|1EEF25| AND.b #$3F
|1EEF27| STA.b $00

|1EEF29| LDA.b $1A
|1EEF2B| ASL A
|1EEF2C| ASL A
|1EEF2D| ASL A

|1EEF2E| AND.b #$40
|1EEF30| ORA.b $00
|1EEF32| STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.handle_interaction
|1EEF35| JSL BehaveAsBarrier
|1EEF39| LDY.w $0FFF

|1EEF3C| LDA.w .message_low,Y
|1EEF3F| XBA

|1EEF40| LDA.w .message_high,Y
|1EEF43| TAY

|1EEF44| XBA

|1EEF45| JSL ShowSolicitedMessage

|1EEF49| LDA.w $0D80,X

|1EEF4C| BEQ .not_welcomed_yet
|1EEF4E| BRA .exit

;---------------------------------------------------------------------------------------------------

.light_world
|1EEF50| LDA.b #$07
|1EEF52| STA.w $0F50,X

|1EEF55| JSL SpriteDraw_Shopkeeper
|1EEF59| JSR CheckIfActive_bank1E

|1EEF5C| LDA.b $1A
|1EEF5E| LSR A
|1EEF5F| LSR A
|1EEF60| LSR A
|1EEF61| LSR A

|1EEF62| AND.b #$01
|1EEF64| STA.w $0DC0,X

|1EEF67| BRA .handle_interaction

;---------------------------------------------------------------------------------------------------

.message_low
|1EEF69| db $65 ; MESSAGE 0165
|1EEF6A| db $5F ; MESSAGE 015F

.message_high
|1EEF6B| db $01
|1EEF6C| db $01

;---------------------------------------------------------------------------------------------------

.not_welcomed_yet
|1EEF6D| REP #$20

|1EEF6F| LDA.w $0FDA
|1EEF72| CLC
|1EEF73| ADC.w #$0060
|1EEF76| CMP.b $20

|1EEF78| SEP #$30
|1EEF7A| BCC .exit

|1EEF7C| LDY.w $0FFF

|1EEF7F| LDA.w .message_low,Y
|1EEF82| XBA

|1EEF83| LDA.w .message_high,Y
|1EEF86| TAY

|1EEF87| XBA

|1EEF88| JSL ShowMessageUnconditional

|1EEF8C| INC.w $0D80,X

.exit
|1EEF8F| RTS

;===================================================================================================

ChestGameGuy:
|1EEF90| JSL AllocateOAMDeferToPlayer_long
|1EEF94| JSL SpriteDraw_SingleLarge_long

|1EEF98| JSR CheckIfActive_bank1E
|1EEF9B| JSL BehaveAsBarrier

|1EEF9F| LDA.w $0F50,X
|1EEFA2| AND.b #$3F
|1EEFA4| STA.b $00

|1EEFA6| LDA.b $1A
|1EEFA8| ASL A
|1EEFA9| ASL A
|1EEFAA| ASL A

|1EEFAB| AND.b #$40
|1EEFAD| ORA.b $00
|1EEFAF| STA.w $0F50,X

|1EEFB2| LDA.w $0D80,X
|1EEFB5| JSL JumpTableLocal
|1EEFB9| dw ChestGameGuy_OfferGame
|1EEFBB| dw ChestGameGuy_HandlePayment
|1EEFBD| dw ChestGameGuy_ProctorGame

;===================================================================================================

ChestGameGuy_OfferGame:
|1EEFBF| LDA.w $04C4
|1EEFC2| DEC A
|1EEFC3| CMP.b #$02
|1EEFC5| BCC .exit

|1EEFC7| LDA.b #$60 ; MESSAGE 0160
|1EEFC9| LDY.b #$01
|1EEFCB| JSL ShowSolicitedMessage
|1EEFCF| BCC .exit

|1EEFD1| INC.w $0D80,X

.exit
|1EEFD4| RTS

;===================================================================================================

ChestGameGuy_HandlePayment:
|1EEFD5| LDA.w $1CE8
|1EEFD8| BNE .rejected

|1EEFDA| LDA.b #$1E
|1EEFDC| LDY.b #$00
|1EEFDE| JSR ShopItem_HandleCost
|1EEFE1| BCC .rejected

|1EEFE3| LDA.b #$02
|1EEFE5| STA.w $04C4

|1EEFE8| LDA.b #$64 ; MESSAGE 0164
|1EEFEA| LDY.b #$01
|1EEFEC| JSL ShowMessageUnconditional

|1EEFF0| INC.w $0D80,X

|1EEFF3| RTS

.rejected
|1EEFF4| LDA.b #$61 ; MESSAGE 0161
|1EEFF6| LDY.b #$01
|1EEFF8| JSL ShowMessageUnconditional

|1EEFFC| STZ.w $0D80,X

|1EEFFF| RTS

;===================================================================================================

ChestGameGuy_ProctorGame:
|1EF000| LDA.w $04C4
|1EF003| BNE .credits_remaining

|1EF005| LDA.b #$63 ; MESSAGE 0163
|1EF007| LDY.b #$01
|1EF009| JSL ShowSolicitedMessage

|1EF00D| RTS

.credits_remaining
|1EF00E| LDA.b #$7F ; MESSAGE 017F
|1EF010| LDY.b #$01
|1EF012| JSL ShowSolicitedMessage

|1EF016| RTS

;===================================================================================================

NiceThief_Animate:
|1EF017| LDA.b $1A
|1EF019| AND.b #$03
|1EF01B| BNE .dont_turn_head

|1EF01D| LDA.b #$02
|1EF01F| STA.w $0DC0,X

|1EF022| JSR GetDirectionTowardsLink_bank1E

|1EF025| CPY.b #$03
|1EF027| BNE .dont_face_up

|1EF029| LDY.b #$02

.dont_face_up
|1EF02B| TYA
|1EF02C| STA.w $0EB0,X

.dont_turn_head
|1EF02F| JSL AllocateOAMDeferToPlayer_long
|1EF033| JSL SpriteDraw_Thief

|1EF037| RTS

;===================================================================================================

NiceThiefWithGift:
|1EF038| JSR NiceThief_Animate
|1EF03B| JSR CheckIfActive_bank1E
|1EF03E| JSL BehaveAsBarrier

|1EF042| LDA.w $0D80,X
|1EF045| JSL JumpTableLocal
|1EF049| dw NiceThiefWithGift_WaitForInteraction
|1EF04B| dw NiceThiefWithGift_GiveRupees
|1EF04D| dw NiceThiefWithGift_ResetAI

;===================================================================================================

NiceThiefWithGift_WaitForInteraction:
|1EF04F| LDA.b #$76 ; MESSAGE 0176
|1EF051| LDY.b #$01
|1EF053| JSL ShowSolicitedMessage
|1EF057| BCC .exit

|1EF059| INC.w $0D80,X

.exit
|1EF05C| RTS

;===================================================================================================

NiceThiefWithGift_GiveRupees:
|1EF05D| LDA.w $0403
|1EF060| AND.b #$40
|1EF062| BNE NiceThiefWithGift_ResetAI

|1EF064| LDA.w $0403
|1EF067| ORA.b #$40
|1EF069| STA.w $0403

|1EF06C| INC.w $0D80,X

|1EF06F| LDY.b #$46 ; ITEMGET 46
|1EF071| JMP.w ShopItem_HandleReceipt

;===================================================================================================

NiceThiefWithGift_ResetAI:
|1EF074| STZ.w $0D80,X

|1EF077| RTS

;===================================================================================================

MiniChestGameGuy:
|1EF078| JSR GetDirectionTowardsLink_bank1E
|1EF07B| TYA
|1EF07C| EOR.b #$03
|1EF07E| STA.w $0DE0,X

|1EF081| STZ.w $0DC0,X

|1EF084| JSL SpriteDraw_YoungGamer
|1EF088| JSR CheckIfActive_bank1E
|1EF08B| JSL BehaveAsBarrier

|1EF08F| LDA.w $0D80,X
|1EF092| JSL JumpTableLocal
|1EF096| dw MiniChestGameGuy_OfferGame
|1EF098| dw MiniChestGameGuy_VerifyPurchase
|1EF09A| dw LesserChestGameGuy_AfterGameStart

;===================================================================================================

MiniChestGameGuy_OfferGame:
|1EF09C| LDA.w $04C4
|1EF09F| DEC A
|1EF0A0| CMP.b #$02
|1EF0A2| BCC EXIT_1EF0B1

|1EF0A4| LDA.b #$7E ; MESSAGE 017E
|1EF0A6| LDY.b #$01
|1EF0A8| JSL ShowSolicitedMessage
|1EF0AC| BCC EXIT_1EF0B1

|1EF0AE| INC.w $0D80,X

;---------------------------------------------------------------------------------------------------

#EXIT_1EF0B1:
|1EF0B1| RTS

;===================================================================================================

MiniChestGameGuy_VerifyPurchase:
|1EF0B2| LDA.w $1CE8
|1EF0B5| BNE .rejected

|1EF0B7| LDA.b #$14
|1EF0B9| LDY.b #$00
|1EF0BB| JSR ShopItem_HandleCost
|1EF0BE| BCC .rejected

|1EF0C0| LDA.b #$01
|1EF0C2| STA.w $04C4

|1EF0C5| LDA.b #$7F ; MESSAGE 017F
|1EF0C7| LDY.b #$01
|1EF0C9| JSL ShowMessageUnconditional

|1EF0CD| INC.w $0D80,X

|1EF0D0| RTS

.rejected
|1EF0D1| LDA.b #$80 ; MESSAGE 0180
|1EF0D3| LDY.b #$01
|1EF0D5| JSL ShowMessageUnconditional

|1EF0D9| STZ.w $0D80,X

|1EF0DC| RTS

;===================================================================================================

pool LesserChestGameGuy_AfterGameStart

.message_low
|1EF0DD| db $63 ; MESSAGE 0163
|1EF0DE| db $7F ; MESSAGE 017F

.message_high
|1EF0DF| db $01
|1EF0E0| db $01

endpool

;---------------------------------------------------------------------------------------------------

LesserChestGameGuy_AfterGameStart:
|1EF0E1| LDA.w $04C4
|1EF0E4| TAY

|1EF0E5| LDA.w .message_low,Y
|1EF0E8| XBA

|1EF0E9| LDA.w .message_high,Y
|1EF0EC| TAY

|1EF0ED| XBA

|1EF0EE| JSL ShowSolicitedMessage

|1EF0F2| RTS

;===================================================================================================

LostWoodsChestGameGuy:
|1EF0F3| JSR NiceThief_Animate
|1EF0F6| JSR CheckIfActive_bank1E
|1EF0F9| JSL BehaveAsBarrier

|1EF0FD| LDA.w $0D80,X
|1EF100| JSL JumpTableLocal
|1EF104| dw LostWoodsChestGameGuy_OfferGame
|1EF106| dw LostWoodsChestGameGuy_VerifyPurchase
|1EF108| dw LesserChestGameGuy_AfterGameStart

;===================================================================================================

LostWoodsChestGameGuy_OfferGame:
|1EF10A| LDA.w $04C4
|1EF10D| DEC A
|1EF10E| CMP.b #$02
|1EF110| BCC EXIT_1EF0B1

|1EF112| LDA.b #$81 ; MESSAGE 0181
|1EF114| LDY.b #$01
|1EF116| JSL ShowSolicitedMessage
|1EF11A| BCC .exit

|1EF11C| INC.w $0D80,X

.exit
|1EF11F| RTS

;===================================================================================================

LostWoodsChestGameGuy_VerifyPurchase:
|1EF120| LDA.w $1CE8
|1EF123| BNE .rejected

|1EF125| LDA.b #$64
|1EF127| LDY.b #$00
|1EF129| JSR ShopItem_HandleCost
|1EF12C| BCC .rejected

|1EF12E| LDA.b #$01
|1EF130| STA.w $04C4

|1EF133| LDA.b #$7F ; MESSAGE 017F
|1EF135| LDY.b #$01
|1EF137| JSL ShowMessageUnconditional

|1EF13B| INC.w $0D80,X

|1EF13E| RTS

.rejected
|1EF13F| LDA.b #$80 ; MESSAGE 0180
|1EF141| LDY.b #$01
|1EF143| JSL ShowMessageUnconditional

|1EF147| STZ.w $0D80,X

|1EF14A| RTS

;===================================================================================================

pool NiceThiefUnderRock

.message_low
|1EF14B| db $77 ; MESSAGE 0177
|1EF14C| db $78 ; MESSAGE 0178

.message_high
|1EF14D| db $01
|1EF14E| db $01

endpool

;---------------------------------------------------------------------------------------------------

NiceThiefUnderRock:
|1EF14F| JSR NiceThief_Animate
|1EF152| JSR CheckIfActive_bank1E
|1EF155| JSL BehaveAsBarrier

|1EF159| LDA.w $0E80,X
|1EF15C| SEC
|1EF15D| SBC.b #$05
|1EF15F| TAY

|1EF160| LDA.w .message_low,Y
|1EF163| XBA

|1EF164| LDA.w .message_high,Y
|1EF167| TAY

|1EF168| XBA

|1EF169| JSL ShowSolicitedMessage

|1EF16D| RTS

;===================================================================================================

ShopItem_RedPotion150:
|1EF16E| JSR SpriteDraw_ShopItem
|1EF171| JSR CheckIfActive_bank1E
|1EF174| JSL BehaveAsBarrier
|1EF178| JSR ShopItem_CheckForAPress
|1EF17B| BCC .exit

|1EF17D| JSL FindEmptyBottle
|1EF181| BMI .no_empty_bottle

|1EF183| LDA.b #$96
|1EF185| LDY.b #$00
|1EF187| JSR ShopItem_HandleCost
|1EF18A| BCC ShopItem_GiveFailureMessage

|1EF18C| STZ.w $0DD0,X

|1EF18F| LDY.b #$2E ; ITEMGET 2E
|1EF191| JSR ShopItem_HandleReceipt

.exit
|1EF194| RTS

.no_empty_bottle
|1EF195| LDA.b #$6D ; MESSAGE 016D
|1EF197| LDY.b #$01
|1EF199| JSL ShowMessageUnconditional

|1EF19D| JSR ShopItem_PlayBeep

|1EF1A0| RTS

;===================================================================================================

ShopItem_GiveFailureMessage:
|1EF1A1| LDA.b #$7C ; MESSAGE 017C
|1EF1A3| LDY.b #$01
|1EF1A5| JSL ShowMessageUnconditional

|1EF1A9| JSR ShopItem_PlayBeep

|1EF1AC| RTS

;===================================================================================================

pool Shopkeeper_SpawnShopItem

.offset_x
|1EF1AD| dw -44,   8,  60

endpool

;---------------------------------------------------------------------------------------------------

Shopkeeper_SpawnShopItem:
|1EF1B3| PHA
|1EF1B4| PHY

|1EF1B5| LDA.b #$BB ; SPRITE BB
|1EF1B7| LDY.b #$0C
|1EF1B9| JSL SpawnSpriteDynamically.slot_limited

|1EF1BD| PLA
|1EF1BE| STA.w $0E80,Y
|1EF1C1| STA.w $0BA0,Y

|1EF1C4| PLA
|1EF1C5| PHX

|1EF1C6| ASL A
|1EF1C7| TAX

|1EF1C8| LDA.b $00
|1EF1CA| CLC
|1EF1CB| ADC.l .offset_x+0,X
|1EF1CF| STA.w $0D10,Y

|1EF1D2| LDA.b $01
|1EF1D4| ADC.l .offset_x+1,X
|1EF1D8| STA.w $0D30,Y

|1EF1DB| LDA.b $02
|1EF1DD| CLC
|1EF1DE| ADC.b #$27
|1EF1E0| STA.w $0D00,Y

|1EF1E3| LDA.b $03
|1EF1E5| STA.w $0D20,Y

|1EF1E8| LDA.w $0E40,Y
|1EF1EB| ORA.b #$04
|1EF1ED| STA.w $0E40,Y

|1EF1F0| PLX

|1EF1F1| RTL

;===================================================================================================

ShopItem_FighterShield:
|1EF1F2| JSR SpriteDraw_ShopItem

|1EF1F5| JSR CheckIfActive_bank1E
|1EF1F8| JSL BehaveAsBarrier

|1EF1FC| JSR ShopItem_MakeShieldsDeflect
|1EF1FF| JSR ShopItem_CheckForAPress
|1EF202| BCC .set_hitbox

|1EF204| LDA.l $7EF35A
|1EF208| BNE RejectShieldPurchase

|1EF20A| LDA.b #$32
|1EF20C| LDY.b #$00
|1EF20E| JSR ShopItem_HandleCost
|1EF211| BCC TooPoorForAShield

|1EF213| STZ.w $0DD0,X

|1EF216| LDY.b #$04 ; ITEMGET 04
|1EF218| JSR ShopItem_HandleReceipt

.set_hitbox
|1EF21B| LDA.b #$1C
|1EF21D| STA.w $0F60,X

|1EF220| RTS

;===================================================================================================

RejectShieldPurchase:
|1EF221| LDA.b #$66 ; MESSAGE 0166
|1EF223| LDY.b #$01
|1EF225| JSL ShowMessageUnconditional

|1EF229| JSR ShopItem_PlayBeep

|1EF22C| RTS

;===================================================================================================

TooPoorForAShield:
|1EF22D| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_FireShield:
|1EF230| JSR SpriteDraw_ShopItem
|1EF233| JSR CheckIfActive_bank1E
|1EF236| JSL BehaveAsBarrier

|1EF23A| JSR ShopItem_MakeShieldsDeflect
|1EF23D| JSR ShopItem_CheckForAPress
|1EF240| BCC .set_hitbox

|1EF242| LDA.l $7EF35A
|1EF246| CMP.b #$02
|1EF248| BCS RejectShieldPurchase

|1EF24A| LDA.b #$F4
|1EF24C| LDY.b #$01
|1EF24E| JSR ShopItem_HandleCost
|1EF251| BCC TooPoorForAShield

|1EF253| STZ.w $0DD0,X

|1EF256| LDY.b #$05 ; ITEMGET 05
|1EF258| JSR ShopItem_HandleReceipt

.set_hitbox
|1EF25B| LDA.b #$1C
|1EF25D| STA.w $0F60,X

|1EF260| RTS

;===================================================================================================

ShopItem_MakeShieldsDeflect:
|1EF261| STZ.w $0BA0,X

|1EF264| LDA.b #$08
|1EF266| STA.w $0B6B,X

|1EF269| LDA.b #$04
|1EF26B| STA.w $0CAA,X

|1EF26E| LDA.b #$1C
|1EF270| STA.w $0F60,X

|1EF273| JSL CheckDamageFromLink_long

|1EF277| LDA.b #$0A
|1EF279| STA.w $0F60,X

|1EF27C| RTS

;===================================================================================================

ShopItem_Heart:
|1EF27D| JSR SpriteDraw_ShopItem

|1EF280| JSR CheckIfActive_bank1E
|1EF283| JSL BehaveAsBarrier

|1EF287| JSR ShopItem_CheckForAPress
|1EF28A| BCC .exit

|1EF28C| LDA.l $7EF36C
|1EF290| CMP.l $7EF36D
|1EF294| BEQ .too_much_health

|1EF296| LDA.b #$0A
|1EF298| LDY.b #$00
|1EF29A| JSR ShopItem_HandleCost
|1EF29D| BCC .too_poor

|1EF29F| STZ.w $0DD0,X

|1EF2A2| LDY.b #$42 ; ITEMGET 42
|1EF2A4| JSR ShopItem_HandleReceipt

.exit
|1EF2A7| RTS

.too_much_health
|1EF2A8| JSR ShopItem_PlayBeep

|1EF2AB| RTS

.too_poor
|1EF2AC| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_Arrows:
|1EF2AF| JSR SpriteDraw_ShopItem
|1EF2B2| JSR CheckIfActive_bank1E
|1EF2B5| JSL BehaveAsBarrier

|1EF2B9| JSR ShopItem_CheckForAPress
|1EF2BC| BCC .exit

|1EF2BE| LDA.l $7EF371

|1EF2C2| PHX

|1EF2C3| TAX

|1EF2C4| LDA.l CapacityUpgrades.arrows_hex,X

|1EF2C8| PLX

|1EF2C9| CMP.l $7EF377
|1EF2CD| BEQ TooMuchAmmo

|1EF2CF| LDA.b #$1E
|1EF2D1| LDY.b #$00
|1EF2D3| JSR ShopItem_HandleCost
|1EF2D6| BCC RejectMunitionsPurchase

|1EF2D8| STZ.w $0DD0,X

|1EF2DB| LDY.b #$44 ; ITEMGET 44
|1EF2DD| JSR ShopItem_HandleReceipt

.exit
|1EF2E0| RTS

;===================================================================================================

TooMuchAmmo:
|1EF2E1| LDA.b #$6E ; MESSAGE 016E
|1EF2E3| LDY.b #$01
|1EF2E5| JSL ShowSolicitedMessage

|1EF2E9| JSR ShopItem_PlayBeep

|1EF2EC| RTS

;===================================================================================================

RejectMunitionsPurchase:
|1EF2ED| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

ShopItem_Bombs:
|1EF2F0| JSR SpriteDraw_ShopItem
|1EF2F3| JSR CheckIfActive_bank1E
|1EF2F6| JSL BehaveAsBarrier

|1EF2FA| JSR ShopItem_CheckForAPress
|1EF2FD| BCC .exit

|1EF2FF| LDA.l $7EF370
|1EF303| PHX
|1EF304| TAX

|1EF305| LDA.l CapacityUpgrades.bombs_hex,X

|1EF309| PLX

|1EF30A| CMP.l $7EF343
|1EF30E| BEQ TooMuchAmmo

|1EF310| LDA.b #$32
|1EF312| LDY.b #$00
|1EF314| JSR ShopItem_HandleCost
|1EF317| BCC RejectMunitionsPurchase

|1EF319| STZ.w $0DD0,X

|1EF31C| LDY.b #$31 ; ITEMGET 31
|1EF31E| JSR ShopItem_HandleReceipt

.exit
|1EF321| RTS

;===================================================================================================

ShopItem_Bee:
|1EF322| JSR SpriteDraw_ShopItem
|1EF325| JSR CheckIfActive_bank1E
|1EF328| JSL BehaveAsBarrier

|1EF32C| JSR ShopItem_CheckForAPress
|1EF32F| BCC .exit

|1EF331| JSL FindEmptyBottle
|1EF335| BMI .no_empty_bottle

|1EF337| LDA.b #$0A
|1EF339| LDY.b #$00
|1EF33B| JSR ShopItem_HandleCost
|1EF33E| BCC .too_poor

|1EF340| STZ.w $0DD0,X

|1EF343| LDY.b #$0E ; ITEMGET 0E
|1EF345| JSR ShopItem_HandleReceipt

.exit
|1EF348| RTS

.no_empty_bottle
|1EF349| LDA.b #$6D ; MESSAGE 016D
|1EF34B| LDY.b #$01
|1EF34D| JSL ShowMessageUnconditional

|1EF351| JSR ShopItem_PlayBeep

|1EF354| RTS

.too_poor
|1EF355| JMP.w ShopItem_GiveFailureMessage

;===================================================================================================

pool ShopItem_HandleReceipt

.message_low
|1EF358| db $68 ; MESSAGE 0168
|1EF359| db $67 ; MESSAGE 0167
|1EF35A| db $67 ; MESSAGE 0167
|1EF35B| db $6C ; MESSAGE 016C
|1EF35C| db $69 ; MESSAGE 0169
|1EF35D| db $6A ; MESSAGE 016A
|1EF35E| db $6B ; MESSAGE 016B

.message_high
|1EF35F| db $01
|1EF360| db $01
|1EF361| db $01
|1EF362| db $01
|1EF363| db $01
|1EF364| db $01
|1EF365| db $01

endpool

;---------------------------------------------------------------------------------------------------

ShopItem_HandleReceipt:
|1EF366| STZ.w $02E9

|1EF369| PHX

|1EF36A| JSL GrantItemReceipt

|1EF36E| PLX

|1EF36F| LDA.w $0E80,X
|1EF372| SEC
|1EF373| SBC.b #$07
|1EF375| BMI .exit

|1EF377| TAY

|1EF378| LDA.w .message_low,Y
|1EF37B| XBA

|1EF37C| LDA.w .message_high,Y
|1EF37F| TAY

|1EF380| XBA

|1EF381| JSL ShowMessageUnconditional
|1EF385| JSL RushToTerminateReceiveItem

.exit
|1EF389| RTS

;===================================================================================================

ShopItem_PlayBeep:
|1EF38A| LDA.b #$3C ; SFX2.3C
|1EF38C| JSL QueueSpriteSFX2WithPan

|1EF390| RTS

;===================================================================================================

ShopItem_CheckForAPress:
|1EF391| LDA.b $F6
|1EF393| BPL .no_interaction

|1EF395| JSL CheckDamageToLink_same_layer_long

|1EF399| BCC .no_interaction

|1EF39B| RTS

.no_interaction
|1EF39C| CLC

|1EF39D| RTS

;===================================================================================================

ShopItem_HandleCost:
|1EF39E| STA.b $00
|1EF3A0| STY.b $01

|1EF3A2| REP #$20

|1EF3A4| LDA.l $7EF360
|1EF3A8| CMP.b $00
|1EF3AA| BCC .too_poor

|1EF3AC| SBC.b $00
|1EF3AE| STA.l $7EF360

|1EF3B2| SEC

.too_poor
|1EF3B3| SEP #$30

|1EF3B5| RTS

;===================================================================================================

pool SpriteDraw_ShopItem

.oam_groups
|1EF3B6| dw  -4,  16 : db $31, $02, $00, $00 ; 1
|1EF3BE| dw   4,  16 : db $13, $02, $00, $00 ; 5
|1EF3C6| dw  12,  16 : db $30, $02, $00, $00 ; 0
|1EF3CE| dw   0,   0 : db $C0, $02, $00, $02 ; item
|1EF3D6| dw   0,  11 : db $6C, $03, $00, $02 ; shadow

|1EF3DE| dw   0,  16 : db $13, $02, $00, $00 ; 5
|1EF3E6| dw   0,  16 : db $13, $02, $00, $00 ; 5
|1EF3EE| dw   8,  16 : db $30, $02, $00, $00 ; 0
|1EF3F6| dw   0,   0 : db $CE, $04, $00, $02 ; item
|1EF3FE| dw   4,  12 : db $38, $03, $00, $00 ; shadow

|1EF406| dw  -4,  16 : db $13, $02, $00, $00 ; 5
|1EF40E| dw   4,  16 : db $30, $02, $00, $00 ; 0
|1EF416| dw  12,  16 : db $30, $02, $00, $00 ; 0
|1EF41E| dw   0,   0 : db $CC, $08, $00, $02 ; item
|1EF426| dw   4,  12 : db $38, $03, $00, $00 ; shadow

|1EF42E| dw   0,  16 : db $31, $02, $00, $00 ; 1
|1EF436| dw   0,  16 : db $31, $02, $00, $00 ; 1
|1EF43E| dw   8,  16 : db $30, $02, $00, $00 ; 0
|1EF446| dw   4,   8 : db $29, $03, $00, $00 ; item
|1EF44E| dw   4,  11 : db $38, $03, $00, $00 ; shadow

|1EF456| dw  -4,  16 : db $03, $02, $00, $00 ; 3
|1EF45E| dw  -4,  16 : db $03, $02, $00, $00 ; 3
|1EF466| dw   4,  16 : db $30, $02, $00, $00 ; 0
|1EF46E| dw   0,   0 : db $C4, $04, $00, $02 ; item
|1EF476| dw   0,  11 : db $38, $03, $00, $00 ; shadow

|1EF47E| dw   0,  16 : db $13, $02, $00, $00 ; 5
|1EF486| dw   0,  16 : db $13, $02, $00, $00 ; 5
|1EF48E| dw   8,  16 : db $30, $02, $00, $00 ; 0
|1EF496| dw   0,   0 : db $E8, $04, $00, $02 ; item
|1EF49E| dw   0,  11 : db $6C, $03, $00, $02 ; shadow

|1EF4A6| dw   0,  16 : db $31, $02, $00, $00 ; 1
|1EF4AE| dw   0,  16 : db $31, $02, $00, $00 ; 1
|1EF4B6| dw   8,  16 : db $30, $02, $00, $00 ; 0
|1EF4BE| dw   4,   8 : db $F4, $0F, $00, $00 ; item
|1EF4C6| dw   4,  11 : db $38, $03, $00, $00 ; shadow

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_ShopItem:
|1EF4CE| LDA.w $0E80,X
|1EF4D1| SEC
|1EF4D2| SBC.b #$07

|1EF4D4| REP #$20

|1EF4D6| AND.w #$00FF
|1EF4D9| STA.b $00

|1EF4DB| ASL A
|1EF4DC| ASL A
|1EF4DD| ADC.b $00

|1EF4DF| ASL A
|1EF4E0| ASL A
|1EF4E1| ASL A
|1EF4E2| ADC.w #.oam_groups
|1EF4E5| STA.b $08

|1EF4E7| LDA.w #$0005
|1EF4EA| STA.b $06

|1EF4EC| SEP #$30

|1EF4EE| JSL TabulatedSpriteDraw.player_deferred

|1EF4F2| RTS

;===================================================================================================

BehaveAsBarrier:
|1EF4F3| LDA.w $0F60,X
|1EF4F6| PHA

|1EF4F7| STZ.w $0F60,X

|1EF4FA| JSL CheckDamageToLink_same_layer_long
|1EF4FE| BCC .no_collision

|1EF500| JSR HaltAllMovement

.no_collision
|1EF503| PLA
|1EF504| STA.w $0F60,X

|1EF507| RTL

;===================================================================================================

HaltAllMovement:
|1EF508| PHX

|1EF509| JSL AbortMovement

|1EF50D| STZ.b $5E

|1EF50F| JSL CancelDash_long

|1EF513| PLX

|1EF514| RTS

;===================================================================================================

Sprite_AC_Apple:
|1EF515| LDA.w $0D80,X
|1EF518| BNE Apple

;===================================================================================================

ApplesInTree:
|1EF51A| LDA.w $0E90,X
|1EF51D| BNE .exit

|1EF51F| STZ.w $0DD0,X

|1EF522| JSL GetRandomNumber
|1EF526| AND.b #$03
|1EF528| CLC

|1EF529| ADC.b #$02
|1EF52B| TAY

.next_apple
|1EF52C| PHY

|1EF52D| JSR SpawnApple

|1EF530| PLY
|1EF531| DEY
|1EF532| BPL .next_apple

.exit
|1EF534| RTS

;===================================================================================================

SpawnApple:
|1EF535| LDA.b #$AC ; SPRITE AC
|1EF537| JSL SpawnSpriteDynamically
|1EF53B| BMI .exit

|1EF53D| JSL SetSpawnedSpriteCoordinates

|1EF541| LDA.b #$01
|1EF543| STA.w $0D80,Y

|1EF546| LDA.b #$FF
|1EF548| STA.w $0D90,Y

|1EF54B| LDA.b #$08
|1EF54D| STA.w $0F70,Y

|1EF550| LDA.b #$16
|1EF552| STA.w $0F80,Y

|1EF555| JSL GetRandomNumber
|1EF559| STA.b $04

|1EF55B| LDA.b $01
|1EF55D| STA.b $05

|1EF55F| JSL GetRandomNumber
|1EF563| STA.b $06

|1EF565| LDA.b $03
|1EF567| STA.b $07

|1EF569| LDA.b #$0A
|1EF56B| JSL ProjectSpriteSpeedTowardsLocation_long

|1EF56F| LDA.b $00
|1EF571| STA.w $0D40,Y

|1EF574| LDA.b $01
|1EF576| STA.w $0D50,Y

.exit
|1EF579| RTS

;===================================================================================================

pool Apple

.speed
|1EF57A| db -1,  1

endpool

;---------------------------------------------------------------------------------------------------

Apple:
|1EF57C| LDA.w $0D90,X
|1EF57F| CMP.b #$10
|1EF581| BCS .no_flicker

|1EF583| LDA.b $1A
|1EF585| AND.b #$02
|1EF587| BEQ .flicker_off

.no_flicker
|1EF589| JSL SpriteDraw_SingleLarge_long

.flicker_off
|1EF58D| JSR CheckIfActive_bank1E

|1EF590| LDA.w $0D90,X
|1EF593| BEQ .rot

|1EF595| JSR MoveSpriteXYZ_bank1E
|1EF598| JSR CheckDamageToLink_bank1E
|1EF59B| BCC .not_collected

|1EF59D| LDA.b #$0B ; SFX3.0B
|1EF59F| JSL QueueSpriteSFX3WithPan

|1EF5A3| LDA.l $7EF372
|1EF5A7| CLC
|1EF5A8| ADC.b #$08
|1EF5AA| STA.l $7EF372

.rot
|1EF5AE| STZ.w $0DD0,X

|1EF5B1| RTS

;---------------------------------------------------------------------------------------------------

.not_collected
|1EF5B2| LDA.b $1A
|1EF5B4| AND.b #$01
|1EF5B6| BNE .dont_tick_timer

|1EF5B8| DEC.w $0D90,X

.dont_tick_timer
|1EF5BB| LDA.w $0F70,X
|1EF5BE| DEC A
|1EF5BF| BPL .airborne

|1EF5C1| STZ.w $0F70,X

|1EF5C4| LDA.w $0F80,X
|1EF5C7| BMI .hit_ground

|1EF5C9| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.hit_ground
|1EF5CB| EOR.b #$FF
|1EF5CD| INC A
|1EF5CE| LSR A
|1EF5CF| STA.w $0F80,X

|1EF5D2| LDA.w $0D50,X
|1EF5D5| BEQ .x_speed_at_0

|1EF5D7| PHA

|1EF5D8| ASL A
|1EF5D9| LDA.b #$00
|1EF5DB| ROL A
|1EF5DC| TAY

|1EF5DD| PLA
|1EF5DE| CLC
|1EF5DF| ADC.w .speed,Y
|1EF5E2| STA.w $0D50,X

.x_speed_at_0
|1EF5E5| LDA.w $0D40,X
|1EF5E8| BEQ .exit

|1EF5EA| PHA

|1EF5EB| ASL A
|1EF5EC| LDA.b #$00
|1EF5EE| ROL A
|1EF5EF| TAY

|1EF5F0| PLA
|1EF5F1| CLC
|1EF5F2| ADC.w .speed,Y
|1EF5F5| STA.w $0D40,X

.exit
|1EF5F8| RTS

;---------------------------------------------------------------------------------------------------

.airborne
|1EF5F9| LDA.w $0F80,X
|1EF5FC| SEC
|1EF5FD| SBC.b #$01
|1EF5FF| STA.w $0F80,X

|1EF602| RTS

;===================================================================================================

Sprite_BC_Drunkard:
|1EF603| JSL SpriteDraw_Drunkard
|1EF607| JSR CheckIfActive_bank1E
|1EF60A| JSL BehaveAsBarrier
|1EF60E| JSL GetRandomNumber
|1EF612| BNE .skip_timer

|1EF614| LDA.b #$20
|1EF616| STA.w $0DF0,X

.skip_timer
|1EF619| STZ.w $0DC0,X

|1EF61C| LDA.w $0DF0,X
|1EF61F| BEQ .animating

|1EF621| INC.w $0DC0,X

.animating
|1EF624| LDA.b #$75 ; MESSAGE 0175
|1EF626| LDY.b #$01
|1EF628| JSL ShowSolicitedMessage
|1EF62C| BCC .exit

|1EF62E| STZ.w $0DC0,X

.exit
|1EF631| RTS

;===================================================================================================

Pipe_LocatePath:
|1EF632| LDA.b #$FF
|1EF634| STA.w $1DE0

|1EF637| LDA.w $0E20,X
|1EF63A| SEC
|1EF63B| SBC.b #$AE
|1EF63D| STA.w $0DE0,X

;===================================================================================================

SomariaPlatform_LocatePath:

.next
|1EF640| JSR SomariaPlatformAndPipe_CheckTile

|1EF643| STA.w $0E90,X

|1EF646| SEC
|1EF647| SBC.b #$B0 ; TILETYPE B0
|1EF649| BCS .upper_tile

.not_pipe
|1EF64B| LDA.w $0D10,X
|1EF64E| CLC
|1EF64F| ADC.b #$08
|1EF651| STA.w $0D10,X

|1EF654| LDA.w $0D30,X
|1EF657| ADC.b #$00
|1EF659| STA.w $0D30,X

|1EF65C| LDA.w $0D00,X
|1EF65F| CLC
|1EF660| ADC.b #$08
|1EF662| STA.w $0D00,X

|1EF665| LDA.w $0D20,X
|1EF668| ADC.b #$00
|1EF66A| STA.w $0D20,X

|1EF66D| BRA .next

;---------------------------------------------------------------------------------------------------

.upper_tile
|1EF66F| CMP.b #$0F ; TILETYPE BF
|1EF671| BCS .not_pipe

|1EF673| LDA.w $0D10,X
|1EF676| AND.b #$F8
|1EF678| CLC
|1EF679| ADC.b #$04
|1EF67B| STA.w $0D10,X

|1EF67E| LDA.w $0D00,X
|1EF681| AND.b #$F8
|1EF683| CLC
|1EF684| ADC.b #$04
|1EF686| STA.w $0D00,X

|1EF689| LDA.w $0DE0,X
|1EF68C| STA.w $0EB0,X

|1EF68F| JSR SomariaPlatformAndPipe_HandleMovement

|1EF692| INC.w $0BA0,X

|1EF695| STZ.w $02F5

|1EF698| LDA.b #$0E
|1EF69A| STA.w $0F10,X

|1EF69D| INC.w $0DC0,X

|1EF6A0| RTS

;===================================================================================================

SomariaPlatformAndPipe:
|1EF6A1| PHB
|1EF6A2| PHK
|1EF6A3| PLB

|1EF6A4| JSR .main

|1EF6A7| PLB

|1EF6A8| RTL

;---------------------------------------------------------------------------------------------------

.speed_x
|1EF6A9| db   0,   0, -16,  16
|1EF6AD| db -16,  16,  16

.speed_y
|1EF6B0| db -16,  16,   0,   0
|1EF6B4| db -16,  16, -16,  16

;---------------------------------------------------------------------------------------------------

.drag_x_high
|1EF6B8| db $00, $00, $FF, $00, $FF

.drag_x_low
|1EF6BD| db $00, $00, $FF, $01, $FF, $01, $01

.drag_y_low
|1EF6C4| db $FF, $01, $00, $00, $FF, $01, $FF, $01

.drag_y_high
|1EF6CC| db $FF, $00, $00, $00, $FF, $00, $FF, $00

;---------------------------------------------------------------------------------------------------

.main
|1EF6D4| LDA.w $0DC0,X
|1EF6D7| JSL JumpTableLocal
|1EF6DB| dw SomariaPlatform_Spawn
|1EF6DD| dw SomariaPlatformAndPipe_Main

;===================================================================================================

SomariaPlatform_Spawn:
|1EF6DF| JSR SomariaPlatform_LocatePath
|1EF6E2| JSL SpawnSuperficialExplosion

|1EF6E6| LDA.w $0D10,Y
|1EF6E9| SEC
|1EF6EA| SBC.b #$08
|1EF6EC| STA.w $0D10,Y

|1EF6EF| LDA.w $0D30,Y
|1EF6F2| SBC.b #$00
|1EF6F4| STA.w $0D30,Y

|1EF6F7| LDA.w $0D00,Y
|1EF6FA| SEC
|1EF6FB| SBC.b #$08
|1EF6FD| STA.w $0D00,Y

|1EF700| LDA.w $0D20,Y
|1EF703| SBC.b #$00
|1EF705| STA.w $0D20,Y

|1EF708| RTS

;===================================================================================================

SomariaPlatformAndPipe_Main:
|1EF709| JSR SpriteDraw_SomariaPlatform
|1EF70C| JSR CheckIfActive_bank1E

|1EF70F| LDA.w $0B7C
|1EF712| ORA.w $0B7D
|1EF715| ORA.w $0B7E
|1EF718| ORA.w $0B7F
|1EF71B| BEQ .not_dragging

.is_inactive
|1EF71D| JMP.w SomariaPlatform_Inactive

.not_dragging
|1EF720| LDA.b $5B
|1EF722| DEC A
|1EF723| DEC A
|1EF724| BPL .is_inactive

|1EF726| JSL CheckDamageToLink_ignore_layer_long
|1EF72A| BCC SomariaPlatform_Inactive

|1EF72C| LDA.b #$01
|1EF72E| STA.w $0DB0,X
|1EF731| JSL CancelDash_long

|1EF735| LDA.b $5D
|1EF737| CMP.b #$13 ; LINKSTATE 13
|1EF739| BEQ SomariaPlatform_Inactive

|1EF73B| CMP.b #$03 ; LINKSTATE 03
|1EF73D| BEQ SomariaPlatform_Inactive

|1EF73F| LDA.w $0D80,X
|1EF742| BNE SomariaPlatformAndPipe_HandleMovement

|1EF744| INC.w $0D90,X

|1EF747| LDA.b #$02
|1EF749| STA.w $02F5

|1EF74C| LDA.w $0D90,X
|1EF74F| AND.b #$07
|1EF751| BNE .skip_movement

|1EF753| JSR SomariaPlatformAndPipe_CheckTile

|1EF756| CMP.w $0E90,X
|1EF759| BEQ .skip_movement

|1EF75B| STA.w $0E90,X

|1EF75E| LDA.w $0DE0,X
|1EF761| STA.w $0EB0,X

|1EF764| JSR SomariaPlatformAndPipe_HandleMovement
|1EF767| JSR SomariaPlatform_HandleDrag

.skip_movement
|1EF76A| LDA.b $A0
|1EF76C| CMP.b #$24 ; ROOM 0024
|1EF76E| BEQ .not_big_chest

|1EF770| LDY.w $0DE0,X

|1EF773| LDA.w SomariaPlatformAndPipe.drag_x_low,Y
|1EF776| CLC
|1EF777| ADC.w $0B7C
|1EF77A| STA.w $0B7C

|1EF77D| LDA.w SomariaPlatformAndPipe.drag_x_high,Y
|1EF780| ADC.w $0B7D
|1EF783| STA.w $0B7D

|1EF786| LDA.w SomariaPlatformAndPipe.drag_y_low,Y
|1EF789| CLC
|1EF78A| ADC.w $0B7E
|1EF78D| STA.w $0B7E

|1EF790| LDA.w SomariaPlatformAndPipe.drag_y_high,Y
|1EF793| ADC.w $0B7F
|1EF796| STA.w $0B7F

|1EF799| JSR MoveSpriteXY_bank1E
|1EF79C| JSR SomariaPlatform_DragLink

|1EF79F| RTS

.not_big_chest
|1EF7A0| JMP.w SomariaPlatform_EnableDragging

;===================================================================================================

SomariaPlatform_Inactive:
|1EF7A3| LDA.w $0DB0,X
|1EF7A6| BEQ .exit

|1EF7A8| STZ.w $02F5
|1EF7AB| STZ.w $0DB0,X

.exit
|1EF7AE| RTS

;===================================================================================================

SomariaPlatformAndPipe_HandleMovement:
|1EF7AF| JSR SomariaPlatform_HandleTile

|1EF7B2| LDY.w $0DE0,X

|1EF7B5| LDA.w SomariaPlatformAndPipe.speed_x,Y
|1EF7B8| STA.w $0D50,X

|1EF7BB| LDA.w SomariaPlatformAndPipe.speed_y,Y
|1EF7BE| STA.w $0D40,X

|1EF7C1| RTS

;===================================================================================================

SomariaPlatformAndPipe_CheckTile:
|1EF7C2| LDA.w $0D00,X
|1EF7C5| STA.b $00

|1EF7C7| LDA.w $0D20,X
|1EF7CA| STA.b $01

|1EF7CC| LDA.w $0D10,X
|1EF7CF| STA.b $02

|1EF7D1| LDA.w $0D30,X
|1EF7D4| STA.b $03

|1EF7D6| LDA.b #$00
|1EF7D8| JSL GetTileType_long

|1EF7DC| LDA.w $0FA5

|1EF7DF| RTS

;===================================================================================================

pool SpriteDraw_SomariaPlatform

.oam_groups
|1EF7E0| dw -16, -16 : db $AC, $00, $00, $02
|1EF7E8| dw   0, -16 : db $AC, $40, $00, $02
|1EF7F0| dw -16,   0 : db $AC, $80, $00, $02
|1EF7F8| dw   0,   0 : db $AC, $C0, $00, $02

|1EF800| dw -13, -13 : db $AC, $00, $00, $02
|1EF808| dw  -3, -13 : db $AC, $40, $00, $02
|1EF810| dw -13,  -3 : db $AC, $80, $00, $02
|1EF818| dw  -3,  -3 : db $AC, $C0, $00, $02

|1EF820| dw -10, -10 : db $AC, $00, $00, $02
|1EF828| dw  -6, -10 : db $AC, $40, $00, $02
|1EF830| dw -10,  -6 : db $AC, $80, $00, $02
|1EF838| dw  -6,  -6 : db $AC, $C0, $00, $02

|1EF840| dw  -8,  -8 : db $AC, $00, $00, $02
|1EF848| dw  -8,  -8 : db $AC, $40, $00, $02
|1EF850| dw  -8,  -8 : db $AC, $80, $00, $02
|1EF858| dw  -8,  -8 : db $AC, $C0, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_SomariaPlatform:
|1EF860| LDA.b #$10
|1EF862| JSL AllocateOAMInRegionB

|1EF866| LDA.w $0F10,X
|1EF869| AND.b #$0C
|1EF86B| ASL A
|1EF86C| ASL A
|1EF86D| ASL A

|1EF86E| ADC.b #<.oam_groups
|1EF870| STA.b $08

|1EF872| LDA.b #>.oam_groups
|1EF874| ADC.b #$00
|1EF876| STA.b $09

|1EF878| LDA.b #$04
|1EF87A| JMP.w TabulatedSpriteDraw_bank1E

;===================================================================================================

SomariaPlatform_HandleTile:
|1EF87D| LDA.w $0E90,X
|1EF880| SEC
|1EF881| SBC.b #$B0
|1EF883| BCS .possibly_valid_tile

|1EF885| RTS

.possibly_valid_tile
|1EF886| CMP.b #$0F
|1EF888| BCC .valid_tile

|1EF88A| RTS

;---------------------------------------------------------------------------------------------------

.valid_tile
|1EF88B| JSL JumpTableLocal
|1EF88F| dw SomariaPlatform_HandleDoNothing
|1EF891| dw SomariaPlatform_HandleDoNothing
|1EF893| dw SomariaPlatform_HandleRisingSlope
|1EF895| dw SomariaPlatform_HandleFallingSlope
|1EF897| dw SomariaPlatform_HandleFallingSlope
|1EF899| dw SomariaPlatform_HandleRisingSlope
|1EF89B| dw SomariaPlatform_HandleTJunctionDLR
|1EF89D| dw SomariaPlatform_HandleTJunctionULR
|1EF89F| dw SomariaPlatform_HandleTJunctionUDR
|1EF8A1| dw SomariaPlatform_HandleTJunctionUDL
|1EF8A3| dw SomariaPlatform_Handle4WayJunction
|1EF8A5| dw SomariaPlatform_HandleCrossOver
|1EF8A7| dw SomariaPlatform_HandleUnknown
|1EF8A9| dw SomariaPlatform_HandleDoNothing
|1EF8AB| dw SomariaPlatform_HandleStation

;===================================================================================================

SomariaPlatform_HandleDragX:
|1EF8AD| LDA.w $0DE0,X
|1EF8B0| EOR.w $0EB0,X
|1EF8B3| AND.b #$02
|1EF8B5| BEQ .exit

|1EF8B7| LDA.w $0D10,X
|1EF8BA| AND.b #$F8

|1EF8BC| CLC
|1EF8BD| ADC.b #$04
|1EF8BF| STA.b $00

|1EF8C1| SEC
|1EF8C2| SBC.w $0D10,X
|1EF8C5| BEQ .exit

|1EF8C7| STA.w $0B7C
|1EF8CA| BPL .positive

|1EF8CC| LDA.b #$FF
|1EF8CE| STA.w $0B7D

.positive
|1EF8D1| LDA.b $00
|1EF8D3| STA.w $0D10,X

.exit
|1EF8D6| RTS

;===================================================================================================

SomariaPlatform_HandleDragY:
|1EF8D7| LDA.w $0DE0,X
|1EF8DA| EOR.w $0EB0,X
|1EF8DD| AND.b #$02
|1EF8DF| BEQ .exit

|1EF8E1| LDA.w $0D00,X
|1EF8E4| AND.b #$F8

|1EF8E6| CLC
|1EF8E7| ADC.b #$04
|1EF8E9| STA.b $00

|1EF8EB| SEC
|1EF8EC| SBC.w $0D00,X
|1EF8EF| BEQ .exit

|1EF8F1| STA.w $0B7E
|1EF8F4| BPL .positive

|1EF8F6| LDA.b #$FF
|1EF8F8| STA.w $0B7F

.positive
|1EF8FB| LDA.b $00
|1EF8FD| STA.w $0D00,X

.exit
|1EF900| RTS

;===================================================================================================

SomariaPlatform_HandleDrag:
|1EF901| JSR SomariaPlatform_HandleDragX
|1EF904| JSR SomariaPlatform_HandleDragY

|1EF907| RTS

;===================================================================================================

SomariaPlatform_HandleDoNothing:
|1EF908| RTS

;===================================================================================================

SomariaPlatform_HandleRisingSlope:
|1EF909| LDA.w $0DE0,X
|1EF90C| EOR.b #$03
|1EF90E| STA.w $0DE0,X

|1EF911| RTS

;===================================================================================================

SomariaPlatform_HandleFallingSlope:
|1EF912| LDA.w $0DE0,X
|1EF915| EOR.b #$02
|1EF917| STA.w $0DE0,X

|1EF91A| RTS

;===================================================================================================

pool SomariaPlatform_HandleTJunctionDLR

.dpad_press
|1EF91B| db $04, $08, $01, $02

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTJunctionDLR:
|1EF91F| LDA.b #$01
|1EF921| STA.w $0D80,X

|1EF924| LDA.b $4D
|1EF926| BNE .continue

|1EF928| LDY.w $0DE0,X

|1EF92B| LDA.b $F0
|1EF92D| AND.w .dpad_press,Y
|1EF930| BEQ .continue

|1EF932| STZ.w $0D80,X

|1EF935| LDA.w $0DE0,X
|1EF938| EOR.b #$01
|1EF93A| STA.w $0DE0,X

.continue
|1EF93D| STZ.b $4B

|1EF93F| JMP.w SomariaPlatform_EnableDragging

;===================================================================================================

pool SomariaPlatform_HandleTJunctionULR

.dpad_press
|1EF942| db $03, $07, $06, $05

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTJunctionULR:
|1EF946| LDA.b #$01
|1EF948| STA.w $0D80,X

|1EF94B| LDY.w $0DE0,X

|1EF94E| LDA.b $F0
|1EF950| AND.w .dpad_press,Y
|1EF953| STA.b $00

|1EF955| AND.b #$08
|1EF957| BEQ .not_up_press

|1EF959| LDA.b #$00
|1EF95B| STA.w $0DE0,X

|1EF95E| STZ.w $0D80,X
|1EF961| BRA .exit

.not_up_press
|1EF963| LDA.b $00
|1EF965| AND.b #$04
|1EF967| BEQ .not_down_press

|1EF969| LDA.b #$01
|1EF96B| STA.w $0DE0,X

|1EF96E| STZ.w $0D80,X
|1EF971| BRA .exit

.not_down_press
|1EF973| LDA.b $00
|1EF975| AND.b #$02
|1EF977| BEQ .not_left_press

|1EF979| LDA.b #$02
|1EF97B| STA.w $0DE0,X

|1EF97E| STZ.w $0D80,X
|1EF981| BRA .exit

.not_left_press
|1EF983| LDA.b $00
|1EF985| AND.b #$01
|1EF987| BEQ .not_right_press

|1EF989| LDA.b #$03
|1EF98B| STA.w $0DE0,X

|1EF98E| STZ.w $0D80,X

.not_right_press
|1EF991| LDA.w $0DE0,X
|1EF994| BNE .set_direction

|1EF996| LDA.b #$02
|1EF998| STA.w $0DE0,X

.set_direction
|1EF99B| STZ.w $0D80,X

.exit
|1EF99E| RTS

;===================================================================================================

pool SomariaPlatform_HandleTJunctionUDR

.dpad_press
|1EF99F| db $0B, $03, $0A, $09

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTJunctionUDR:
|1EF9A3| LDA.b #$01
|1EF9A5| STA.w $0D80,X

|1EF9A8| LDY.w $0DE0,X

|1EF9AB| LDA.b $F0
|1EF9AD| AND.w .dpad_press,Y
|1EF9B0| STA.b $00

|1EF9B2| AND.b #$08
|1EF9B4| BEQ .not_up_press

|1EF9B6| LDA.b #$00
|1EF9B8| STA.w $0DE0,X

|1EF9BB| STZ.w $0D80,X
|1EF9BE| BRA .exit

.not_up_press
|1EF9C0| LDA.b $00
|1EF9C2| AND.b #$04
|1EF9C4| BEQ .not_down_press

|1EF9C6| LDA.b #$01
|1EF9C8| STA.w $0DE0,X

|1EF9CB| STZ.w $0D80,X
|1EF9CE| BRA .exit

.not_down_press
|1EF9D0| LDA.b $00
|1EF9D2| AND.b #$02
|1EF9D4| BEQ .not_left_press

|1EF9D6| LDA.b #$02
|1EF9D8| STA.w $0DE0,X

|1EF9DB| STZ.w $0D80,X
|1EF9DE| BRA .exit

.not_left_press
|1EF9E0| LDA.b $00
|1EF9E2| AND.b #$01
|1EF9E4| BEQ .not_right_press

|1EF9E6| LDA.b #$03
|1EF9E8| STA.w $0DE0,X

|1EF9EB| STZ.w $0D80,X

.not_right_press
|1EF9EE| LDA.w $0DE0,X
|1EF9F1| CMP.b #$01
|1EF9F3| BNE .set_direction

|1EF9F5| LDA.b #$02
|1EF9F7| STA.w $0DE0,X

.set_direction
|1EF9FA| STZ.w $0D80,X

.exit
|1EF9FD| RTS

;===================================================================================================

pool SomariaPlatform_HandleTJunctionUDL

.dpad_press
|1EF9FE| db $09, $05, $0C, $0D

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleTJunctionUDL:
|1EFA02| LDA.b #$01
|1EFA04| STA.w $0D80,X

|1EFA07| LDY.w $0DE0,X

|1EFA0A| LDA.b $F0
|1EFA0C| AND.w .dpad_press,Y
|1EFA0F| STA.b $00

|1EFA11| AND.b #$08
|1EFA13| BEQ .not_up_press

|1EFA15| LDA.b #$00
|1EFA17| STA.w $0DE0,X

|1EFA1A| STZ.w $0D80,X
|1EFA1D| BRA .exit

.not_up_press
|1EFA1F| LDA.b $00
|1EFA21| AND.b #$04
|1EFA23| BEQ .not_down_press

|1EFA25| LDA.b #$01
|1EFA27| STA.w $0DE0,X

|1EFA2A| STZ.w $0D80,X
|1EFA2D| BRA .exit

.not_down_press
|1EFA2F| LDA.b $00
|1EFA31| AND.b #$02
|1EFA33| BEQ .not_left_press

|1EFA35| LDA.b #$02
|1EFA37| STA.w $0DE0,X

|1EFA3A| STZ.w $0D80,X
|1EFA3D| BRA .exit

.not_left_press
|1EFA3F| LDA.b $00
|1EFA41| AND.b #$01
|1EFA43| BEQ .not_right_press

|1EFA45| LDA.b #$03
|1EFA47| STA.w $0DE0,X

|1EFA4A| STZ.w $0D80,X

.not_right_press
|1EFA4D| LDA.w $0DE0,X
|1EFA50| CMP.b #$02
|1EFA52| BNE .set_direction

|1EFA54| LDA.b #$00
|1EFA56| STA.w $0DE0,X

.set_direction
|1EFA59| STZ.w $0D80,X

.exit
|1EFA5C| RTS

;===================================================================================================

pool SomariaPlatform_Handle4WayJunction

.dpad_press
|1EFA5D| db $0A, $06, $0E, $0C

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_Handle4WayJunction:
|1EFA61| LDA.b #$01
|1EFA63| STA.w $0D80,X

|1EFA66| LDY.w $0DE0,X

|1EFA69| LDA.b $F0
|1EFA6B| AND.w .dpad_press,Y
|1EFA6E| STA.b $00

|1EFA70| AND.b #$08
|1EFA72| BEQ .not_up_press

|1EFA74| LDA.b #$00
|1EFA76| STA.w $0DE0,X

|1EFA79| STZ.w $0D80,X
|1EFA7C| BRA .exit

.not_up_press
|1EFA7E| LDA.b $00
|1EFA80| AND.b #$04
|1EFA82| BEQ .not_down_press

|1EFA84| LDA.b #$01
|1EFA86| STA.w $0DE0,X

|1EFA89| STZ.w $0D80,X
|1EFA8C| BRA .exit

.not_down_press
|1EFA8E| LDA.b $00
|1EFA90| AND.b #$02
|1EFA92| BEQ .not_left_press

|1EFA94| LDA.b #$02
|1EFA96| STA.w $0DE0,X

|1EFA99| STZ.w $0D80,X
|1EFA9C| BRA .exit

.not_left_press
|1EFA9E| LDA.b $00
|1EFAA0| AND.b #$01
|1EFAA2| BEQ .not_right_press

|1EFAA4| LDA.b #$03
|1EFAA6| STA.w $0DE0,X

|1EFAA9| STZ.w $0D80,X

.not_right_press
|1EFAAC| LDA.w $0DE0,X
|1EFAAF| CMP.b #$03
|1EFAB1| BNE .set_direction

|1EFAB3| LDA.b #$00
|1EFAB5| STA.w $0DE0,X

.set_direction
|1EFAB8| STZ.w $0D80,X

.exit
|1EFABB| RTS

;===================================================================================================

pool SomariaPlatform_HandleCrossOver

.dpad_press
|1EFABC| db $0B, $07, $0E, $0D

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleCrossOver:
|1EFAC0| LDY.w $0DE0,X

|1EFAC3| LDA.b $F0
|1EFAC5| AND.w .dpad_press,Y
|1EFAC8| STA.b $00

|1EFACA| AND.b #$08
|1EFACC| BEQ .not_up_press

|1EFACE| LDA.b #$00
|1EFAD0| STA.w $0DE0,X
|1EFAD3| BRA .exit

.not_up_press
|1EFAD5| LDA.b $00
|1EFAD7| AND.b #$04
|1EFAD9| BEQ .not_down_press

|1EFADB| LDA.b #$01
|1EFADD| STA.w $0DE0,X
|1EFAE0| BRA .exit

.not_down_press
|1EFAE2| LDA.b $00
|1EFAE4| AND.b #$02
|1EFAE6| BEQ .not_left_press

|1EFAE8| LDA.b #$02
|1EFAEA| STA.w $0DE0,X
|1EFAED| BRA .exit

.not_left_press
|1EFAEF| LDA.b $00
|1EFAF1| AND.b #$01
|1EFAF3| BEQ .exit

|1EFAF5| LDA.b #$03
|1EFAF7| STA.w $0DE0,X

.exit
|1EFAFA| RTS

;===================================================================================================

pool SomariaPlatform_HandleUnknown

.dpad_press
|1EFAFB| db $0C, $0C, $03, $03

endpool

;---------------------------------------------------------------------------------------------------

SomariaPlatform_HandleUnknown:
|1EFAFF| LDA.b #$01
|1EFB01| STA.w $0D80,X

|1EFB04| LDY.w $0DE0,X

|1EFB07| LDA.b $F0
|1EFB09| AND.w .dpad_press,Y
|1EFB0C| BEQ SomariaPlatform_EnableDragging

|1EFB0E| STA.b $00

|1EFB10| AND.b #$08
|1EFB12| BEQ .not_up_press

|1EFB14| LDA.b #$00
|1EFB16| BRA .set_direction

.not_up_press
|1EFB18| LDA.b $00
|1EFB1A| AND.b #$04
|1EFB1C| BEQ .not_down_press

|1EFB1E| LDA.b #$01
|1EFB20| BRA .set_direction

.not_down_press
|1EFB22| LDA.b $00
|1EFB24| AND.b #$02
|1EFB26| BEQ .not_left_press

|1EFB28| LDA.b #$02
|1EFB2A| BRA .set_direction

.not_left_press
|1EFB2C| LDA.b #$03

.set_direction
|1EFB2E| STA.w $0DE0,X

|1EFB31| STZ.w $0D80,X

;===================================================================================================

SomariaPlatform_EnableDragging:
|1EFB34| LDA.b #$01
|1EFB36| STA.w $02F5

|1EFB39| RTS

;===================================================================================================

SomariaPlatform_HandleStation:
|1EFB3A| STZ.w $0D80,X

|1EFB3D| LDA.w $0DE0,X
|1EFB40| EOR.b #$01
|1EFB42| STA.w $0DE0,X

|1EFB45| STZ.b $4B
|1EFB47| BRA SomariaPlatform_EnableDragging

;===================================================================================================

SomariaPlatform_DragLink:
|1EFB49| REP #$20

|1EFB4B| LDA.w $0FD8
|1EFB4E| SEC
|1EFB4F| SBC.w #$0008

|1EFB52| CMP.b $22
|1EFB54| BEQ .x_done
|1EFB56| BPL .x_too_low

.x_too_high
|1EFB58| DEC.w $0B7C
|1EFB5B| BRA .x_done

.x_too_low
|1EFB5D| INC.w $0B7C

.x_done
|1EFB60| LDA.w $0FDA
|1EFB63| SEC
|1EFB64| SBC.w #$0010

|1EFB67| CMP.b $20
|1EFB69| BEQ .y_done
|1EFB6B| BPL .y_too_low

.y_too_high
|1EFB6D| DEC.w $0B7E
|1EFB70| BRA .y_done

.y_too_low
|1EFB72| INC.w $0B7E

.y_done
|1EFB75| SEP #$30

|1EFB77| RTS

;===================================================================================================

UNREACHABLE_1EFB78:
|1EFB78| db $00, $00, $01, $FF, $00, $00

;===================================================================================================

Sprite_AE_Pipe_Down:
Sprite_AF_Pipe_Up:
Sprite_B0_Pipe_Right:
Sprite_B1_Pipe_Left:
|1EFB7E| JSR CheckIfActive_bank1E

|1EFB81| LDA.w $0DC0,X
|1EFB84| JSL JumpTableLocal
|1EFB88| dw Pipe_LocatePath
|1EFB8A| dw Pipe_FindEndPoint
|1EFB8C| dw Pipe_Idle
|1EFB8E| dw Pipe_DragLink
|1EFB90| dw Pipe_MoveLink
|1EFB92| dw Pipe_Reset

;===================================================================================================

Pipe_FindEndPoint:
|1EFB94| JSR SomariaPlatformAndPipe_CheckTile
|1EFB97| CMP.b #$BE ; TILETYPE BE
|1EFB99| BNE .invalid_tile

|1EFB9B| STA.w $0E90,X

|1EFB9E| INC.w $0DC0,X

|1EFBA1| LDA.w $0DE0,X
|1EFBA4| EOR.b #$01
|1EFBA6| STA.w $0DE0,X

.invalid_tile
|1EFBA9| CMP.w $0E90,X
|1EFBAC| BEQ .same_as_last

|1EFBAE| STA.w $0E90,X

.same_as_last
|1EFBB1| LDA.w $0DE0,X
|1EFBB4| STA.w $0EB0,X

|1EFBB7| JSR SomariaPlatformAndPipe_HandleMovement
|1EFBBA| JSR MoveSpriteXY_bank1E

|1EFBBD| RTS

;===================================================================================================

Pipe_Idle:
|1EFBBE| LDA.w $1DE0
|1EFBC1| CMP.b #$FF
|1EFBC3| BNE .exit

|1EFBC5| JSL CheckDamageToLink_ignore_layer_long
|1EFBC9| BCC .exit

|1EFBCB| PHX
|1EFBCC| JSL ValidatePipeEntry
|1EFBD0| PLX

|1EFBD1| BCS .cant_use

|1EFBD3| INC.w $0DC0,X

|1EFBD6| LDA.b #$04
|1EFBD8| STA.w $0E00,X

|1EFBDB| JSL ResetLinkProperties_A

|1EFBDF| LDA.b #$01
|1EFBE1| STA.w $02E4
|1EFBE4| STA.w $037B

|1EFBE7| TXA
|1EFBE8| STA.w $1DE0

.exit
|1EFBEB| RTS

.cant_use
|1EFBEC| JSR HaltAllMovement

|1EFBEF| RTS

;===================================================================================================

PipeTileTypeMasks:
|1EFBF0| db $08, $04, $02, $01

;===================================================================================================

Pipe_DragLink:
|1EFBF4| LDA.w $0E00,X
|1EFBF7| BNE .delay

|1EFBF9| INC.w $0DC0,X

|1EFBFC| LDA.b #$0C
|1EFBFE| STA.b $4B

|1EFC00| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EFC01| LDA.b #$01
|1EFC03| STA.w $02E4
|1EFC06| STA.w $037B

|1EFC09| LDY.w $0DE0,X

|1EFC0C| LDA.w PipeTileTypeMasks,Y
|1EFC0F| JSR Pipe_HandlePlayerMovement

|1EFC12| RTS

;===================================================================================================

Pipe_MoveLink:
|1EFC13| LDA.b #$03
|1EFC15| STA.w $0E80,X

|1EFC18| LDA.b $22
|1EFC1A| STA.b $3F

|1EFC1C| LDA.b $23
|1EFC1E| STA.b $41

|1EFC20| LDA.b $20
|1EFC22| STA.b $3E

|1EFC24| LDA.b $21
|1EFC26| STA.b $40

;---------------------------------------------------------------------------------------------------

.next
|1EFC28| INC.w $0D90,X

|1EFC2B| LDA.w $0D90,X
|1EFC2E| AND.b #$07
|1EFC30| BNE .do_movement

|1EFC32| JSR SomariaPlatformAndPipe_CheckTile

|1EFC35| PHA

|1EFC36| CMP.b #$B2 ; TILETYPE B2
|1EFC38| BCC .no_thud

|1EFC3A| CMP.b #$B6 ; TILETYPE B6
|1EFC3C| BCS .no_thud

|1EFC3E| LDA.b #$0B ; SFX2.0B
|1EFC40| JSL QueueSpriteSFX2WithPan

.no_thud
|1EFC44| PLA
|1EFC45| CMP.w $0E90,X
|1EFC48| BEQ .do_movement

|1EFC4A| STA.w $0E90,X

|1EFC4D| CMP.b #$BE ; TILETYPE BE
|1EFC4F| BNE .check_new_tile

|1EFC51| INC.w $0DC0,X

|1EFC54| LDA.b #$18
|1EFC56| STA.w $0E00,X

.check_new_tile
|1EFC59| LDA.w $0DE0,X
|1EFC5C| STA.w $0EB0,X

|1EFC5F| JSR SomariaPlatformAndPipe_HandleMovement
|1EFC62| JSR SomariaPlatform_HandleDrag

;---------------------------------------------------------------------------------------------------

.do_movement
|1EFC65| JSR MoveSpriteXY_bank1E

|1EFC68| LDA.w $0D10,X
|1EFC6B| SEC
|1EFC6C| SBC.b #$08
|1EFC6E| STA.b $00

|1EFC70| LDA.w $0D30,X
|1EFC73| SBC.b #$00
|1EFC75| STA.b $01

|1EFC77| LDA.w $0D00,X
|1EFC7A| SEC
|1EFC7B| SBC.b #$0E
|1EFC7D| STA.b $02

|1EFC7F| LDA.w $0D20,X
|1EFC82| SBC.b #$00
|1EFC84| STA.b $03

|1EFC86| REP #$20

|1EFC88| LDA.b $00
|1EFC8A| CMP.b $22
|1EFC8C| BEQ .x_done
|1EFC8E| BCS .move_right

.move_left
|1EFC90| DEC.b $22
|1EFC92| BRA .x_done

.move_right
|1EFC94| INC.b $22

.x_done
|1EFC96| LDA.b $02
|1EFC98| CMP.b $20
|1EFC9A| BEQ .y_done
|1EFC9C| BCS .move_down

.move_up
|1EFC9E| DEC.b $20
|1EFCA0| BRA .y_done

.move_down
|1EFCA2| INC.b $20

.y_done
|1EFCA4| SEP #$30

|1EFCA6| DEC.w $0E80,X
|1EFCA9| BEQ .finish_up

|1EFCAB| JMP.w .next

;---------------------------------------------------------------------------------------------------

.finish_up
|1EFCAE| LDA.b $22
|1EFCB0| SEC
|1EFCB1| SBC.b $3F
|1EFCB3| STA.b $31

|1EFCB5| LDA.b $20
|1EFCB7| SEC
|1EFCB8| SBC.b $3E
|1EFCBA| STA.b $30

|1EFCBC| LDY.w $0DE0,X

|1EFCBF| LDA.w PipeTileTypeMasks,Y
|1EFCC2| STA.b $26

|1EFCC4| PHX

|1EFCC5| JSL HandleLinkAnimation_FullLongEntry
|1EFCC9| JSL HandleIndoorCameraAndDoors_long
|1EFCCD| JSL CancelDash_long

|1EFCD1| PLX

|1EFCD2| RTS

;===================================================================================================

Pipe_Reset:
|1EFCD3| LDA.w $0E00,X
|1EFCD6| BNE .delay

|1EFCD8| STZ.w $02E4
|1EFCDB| STZ.w $02F5
|1EFCDE| STZ.w $037B

|1EFCE1| STZ.b $4B
|1EFCE3| STZ.b $31
|1EFCE5| STZ.b $30

|1EFCE7| LDA.b #$FF
|1EFCE9| STA.w $1DE0

|1EFCEC| LDA.b #$02
|1EFCEE| STA.w $0DC0,X

|1EFCF1| RTS

;---------------------------------------------------------------------------------------------------

.delay
|1EFCF2| LDA.w $0DE0,X
|1EFCF5| EOR.b #$01
|1EFCF7| TAY

|1EFCF8| LDA.w PipeTileTypeMasks,Y
|1EFCFB| JSR Pipe_HandlePlayerMovement

|1EFCFE| RTS

;===================================================================================================

Pipe_HandlePlayerMovement:
|1EFCFF| PHX

|1EFD00| STA.b $67
|1EFD02| STA.b $26

|1EFD04| JSL HandleLinkVelocity
|1EFD08| JSL HandleLinkAnimation_FullLongEntry
|1EFD0C| JSL HandleIndoorCameraAndDoors_long

|1EFD10| PLX

|1EFD11| RTS

;===================================================================================================

pool HandleFairyMovement

.z_accel
|1EFD12| db  1, -1

endpool

;---------------------------------------------------------------------------------------------------

HandleFairyMovement:
|1EFD14| PHB
|1EFD15| PHK
|1EFD16| PLB

|1EFD17| JSR .main

|1EFD1A| PLB

|1EFD1B| RTL

;---------------------------------------------------------------------------------------------------

.main
|1EFD1C| LDA.b $1A
|1EFD1E| LSR A
|1EFD1F| LSR A
|1EFD20| LSR A
|1EFD21| AND.b #$01
|1EFD23| STA.w $0DC0,X

|1EFD26| LDA.b $1B
|1EFD28| BEQ .ignore_tile_collision

|1EFD2A| LDA.w $0E00,X
|1EFD2D| BNE .ignore_tile_collision

|1EFD2F| JSR CheckSpriteTileCollision_bank1E
|1EFD32| AND.b #$03
|1EFD34| BEQ .no_horizontal_collision

|1EFD36| LDA.w $0D50,X
|1EFD39| EOR.b #$FF
|1EFD3B| INC A
|1EFD3C| STA.w $0D50,X

|1EFD3F| LDA.w $0DE0,X
|1EFD42| EOR.b #$FF
|1EFD44| INC A
|1EFD45| STA.w $0DE0,X

|1EFD48| LDA.b #$20
|1EFD4A| STA.w $0E00,X

.no_horizontal_collision
|1EFD4D| LDA.w $0E70,X
|1EFD50| AND.b #$0C
|1EFD52| BEQ .ignore_tile_collision

|1EFD54| LDA.w $0D40,X
|1EFD57| EOR.b #$FF
|1EFD59| INC A
|1EFD5A| STA.w $0D40,X

|1EFD5D| LDA.w $0D90,X
|1EFD60| EOR.b #$FF
|1EFD62| INC A
|1EFD63| STA.w $0D90,X

|1EFD66| LDA.b #$20
|1EFD68| STA.w $0E00,X

;---------------------------------------------------------------------------------------------------

.ignore_tile_collision
|1EFD6B| LDA.w $0D50,X
|1EFD6E| BEQ .not_moving_horizontally
|1EFD70| BPL .moving_right

.moving_left
|1EFD72| LDA.w $0F50,X
|1EFD75| AND.b #$BF
|1EFD77| BRA .flip_done

.moving_right
|1EFD79| LDA.w $0F50,X
|1EFD7C| ORA.b #$40

.flip_done
|1EFD7E| STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.not_moving_horizontally
|1EFD81| JSR MoveSpriteXY_bank1E

|1EFD84| LDA.b $1A
|1EFD86| AND.b #$3F
|1EFD88| BNE .dont_turn

|1EFD8A| JSL GetRandomNumber
|1EFD8E| STA.b $04

|1EFD90| LDA.b $23
|1EFD92| STA.b $05

|1EFD94| JSL GetRandomNumber
|1EFD98| STA.b $06

|1EFD9A| LDA.b $21
|1EFD9C| STA.b $07

|1EFD9E| LDA.b #$10
|1EFDA0| JSL ProjectSpriteSpeedTowardsLocation_long

|1EFDA4| LDA.b $00
|1EFDA6| STA.w $0D90,X

|1EFDA9| LDA.b $01
|1EFDAB| STA.w $0DE0,X

.dont_turn
|1EFDAE| LDA.b $1A
|1EFDB0| AND.b #$0F
|1EFDB2| BNE .done_with_speed

|1EFDB4| LDA.b #$FF
|1EFDB6| STA.b $01
|1EFDB8| STA.b $03

|1EFDBA| LDA.w $0D90,X
|1EFDBD| STA.b $00
|1EFDBF| BMI .negative_y_target

|1EFDC1| STZ.b $01

.negative_y_target
|1EFDC3| LDA.w $0D40,X
|1EFDC6| STA.b $02
|1EFDC8| BMI .negative_y_speed

|1EFDCA| STZ.b $03

.negative_y_speed
|1EFDCC| REP #$21

|1EFDCE| LDA.b $00
|1EFDD0| ADC.b $02
|1EFDD2| LSR A

|1EFDD3| SEP #$30

|1EFDD5| STA.w $0D40,X

|1EFDD8| LDA.b #$FF
|1EFDDA| STA.b $01
|1EFDDC| STA.b $03

|1EFDDE| LDA.w $0DE0,X
|1EFDE1| STA.b $00
|1EFDE3| BMI .negative_x_target

|1EFDE5| STZ.b $01

.negative_x_target
|1EFDE7| LDA.w $0D50,X
|1EFDEA| STA.b $02
|1EFDEC| BMI .negative_x_speed

|1EFDEE| STZ.b $03

.negative_x_speed
|1EFDF0| REP #$21

|1EFDF2| LDA.b $00
|1EFDF4| ADC.b $02
|1EFDF6| LSR A

|1EFDF7| SEP #$30

|1EFDF9| STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.done_with_speed
|1EFDFC| JSR MoveSpriteZ_bank1E

|1EFDFF| JSL GetRandomNumber
|1EFE03| AND.b #$01
|1EFE05| TAY

|1EFE06| LDA.w .z_accel,Y
|1EFE09| CLC
|1EFE0A| ADC.w $0F80,X
|1EFE0D| STA.w $0F80,X

|1EFE10| LDA.w $0F70,X

|1EFE13| LDY.b #$08
|1EFE15| CMP.b #$08
|1EFE17| BCC .float_up

;---------------------------------------------------------------------------------------------------

.float_down
|1EFE19| LDY.b #$18
|1EFE1B| CMP.b #$18
|1EFE1D| BCC .exit

|1EFE1F| TYA
|1EFE20| STA.w $0F70,X

|1EFE23| LDA.b #$FB
|1EFE25| STA.w $0F80,X

.exit
|1EFE28| RTS

;---------------------------------------------------------------------------------------------------

.float_up
|1EFE29| TYA
|1EFE2A| STA.w $0F70,X

|1EFE2D| LDA.b #$05
|1EFE2F| STA.w $0F80,X

|1EFE32| RTS

;===================================================================================================

ReleaseFairy:
|1EFE33| LDA.b #$E3 ; SPRITE E3
|1EFE35| JSL SpawnSpriteDynamically
|1EFE39| BMI .no_space

|1EFE3B| LDA.b $EE
|1EFE3D| STA.w $0F20,Y

|1EFE40| LDA.b $22
|1EFE42| CLC
|1EFE43| ADC.b #$08
|1EFE45| STA.w $0D10,Y

|1EFE48| LDA.b $23
|1EFE4A| ADC.b #$00
|1EFE4C| STA.w $0D30,Y

|1EFE4F| LDA.b $20
|1EFE51| CLC
|1EFE52| ADC.b #$10
|1EFE54| STA.w $0D00,Y

|1EFE57| LDA.b $21
|1EFE59| ADC.b #$00
|1EFE5B| STA.w $0D20,Y

|1EFE5E| LDA.b #$00
|1EFE60| STA.w $0DE0,Y

|1EFE63| LDA.b #$60
|1EFE65| STA.w $0F10,Y

.no_space
|1EFE68| RTL

;===================================================================================================

GetDirectionTowardsLink_bank1E:
|1EFE69| JSL GetDirectionTowardsLink_long

|1EFE6D| RTS

;===================================================================================================

GetXDisplacementFromLink_bank1E:
|1EFE6E| JSL GetXDisplacementFromLink_long

|1EFE72| RTS

;===================================================================================================

GetYDisplacementFromLink_bank1E:
|1EFE73| JSL GetYDisplacementFromLink_long

|1EFE77| RTS

;===================================================================================================

CheckIfActive_bank1E:
|1EFE78| LDA.w $0DD0,X
|1EFE7B| CMP.b #$09
|1EFE7D| BNE .inactive

#CheckIfActivePermissive_bank1E:
|1EFE7F| LDA.w $0FC1
|1EFE82| BNE .inactive

|1EFE84| LDA.b $11
|1EFE86| BNE .inactive

|1EFE88| LDA.w $0CAA,X
|1EFE8B| BMI .active

|1EFE8D| LDA.w $0F00,X
|1EFE90| BEQ .active

.inactive
|1EFE92| PLA
|1EFE93| PLA

.active
|1EFE94| RTS

;===================================================================================================

pool HandleSpriteRecoil_bank1E

.masks
|1EFE95| db $03, $01, $00, $00, $0C, $03

endpool

;---------------------------------------------------------------------------------------------------

HandleSpriteRecoil_bank1E:
|1EFE9B| LDA.w $0EA0,X
|1EFE9E| BEQ .exit

|1EFEA0| AND.b #$7F
|1EFEA2| BEQ .recoil_over

|1EFEA4| LDA.w $0D40,X
|1EFEA7| PHA

|1EFEA8| LDA.w $0D50,X
|1EFEAB| PHA

|1EFEAC| DEC.w $0EA0,X
|1EFEAF| BNE .still_recoiling

|1EFEB1| LDA.w $0F40,X
|1EFEB4| CLC
|1EFEB5| ADC.b #$20
|1EFEB7| CMP.b #$40
|1EFEB9| BCS .no_adjust

|1EFEBB| LDA.w $0F30,X
|1EFEBE| CLC
|1EFEBF| ADC.b #$20
|1EFEC1| CMP.b #$40
|1EFEC3| BCC .still_recoiling

.no_adjust
|1EFEC5| LDA.b #$90
|1EFEC7| STA.w $0EA0,X

.still_recoiling
|1EFECA| LDA.w $0EA0,X
|1EFECD| BMI .no_movement

|1EFECF| LSR A
|1EFED0| LSR A
|1EFED1| TAY

|1EFED2| LDA.b $1A
|1EFED4| AND.w .masks,Y
|1EFED7| BNE .no_movement

|1EFED9| LDA.w $0F30,X
|1EFEDC| STA.w $0D40,X

|1EFEDF| LDA.w $0F40,X
|1EFEE2| STA.w $0D50,X

|1EFEE5| LDA.w $0CD2,X
|1EFEE8| BMI .handle_movement

|1EFEEA| JSR CheckSpriteTileCollision_bank1E
|1EFEED| AND.b #$0F
|1EFEEF| BEQ .handle_movement

|1EFEF1| CMP.b #$04
|1EFEF3| BCS .stop_vertical_movement

.stop_horizontal_movement
|1EFEF5| STZ.w $0F40,X
|1EFEF8| STZ.w $0D50,X

|1EFEFB| BRA .movement_stopped

.stop_vertical_movement
|1EFEFD| STZ.w $0F30,X
|1EFF00| STZ.w $0D40,X

.movement_stopped
|1EFF03| BRA .no_movement

.handle_movement
|1EFF05| JSR MoveSpriteXY_bank1E

.no_movement
|1EFF08| PLA
|1EFF09| STA.w $0D50,X

|1EFF0C| PLA
|1EFF0D| STA.w $0D40,X

|1EFF10| LDA.w $0E20,X
|1EFF13| CMP.b #$7A ; SPRITE 7A
|1EFF15| BEQ .exit

|1EFF17| PLA
|1EFF18| PLA

.exit
|1EFF19| RTS

.recoil_over
|1EFF1A| STZ.w $0EA0,X

|1EFF1D| RTS

;===================================================================================================

MoveSpriteXYZ_bank1E:
|1EFF1E| JSR MoveSpriteZ_bank1E

;===================================================================================================

MoveSpriteXY_bank1E:
|1EFF21| JSR MoveSpriteX_bank1E
|1EFF24| JSR MoveSpriteY_bank1E

|1EFF27| RTS

;===================================================================================================

MoveSpriteX_bank1E:
|1EFF28| TXA
|1EFF29| CLC
|1EFF2A| ADC.b #$10
|1EFF2C| TAX

|1EFF2D| JSR MoveSpriteY_bank1E

|1EFF30| LDX.w $0FA0

|1EFF33| RTS

;===================================================================================================

MoveSpriteY_bank1E:
|1EFF34| LDA.w $0D40,X
|1EFF37| BEQ .exit

|1EFF39| ASL A
|1EFF3A| ASL A
|1EFF3B| ASL A
|1EFF3C| ASL A

|1EFF3D| CLC
|1EFF3E| ADC.w $0D60,X
|1EFF41| STA.w $0D60,X

|1EFF44| LDA.w $0D40,X
|1EFF47| PHP

|1EFF48| LSR A
|1EFF49| LSR A
|1EFF4A| LSR A
|1EFF4B| LSR A

|1EFF4C| LDY.b #$00

|1EFF4E| PLP
|1EFF4F| BPL .positive_velocity

|1EFF51| ORA.b #$F0
|1EFF53| DEY

.positive_velocity
|1EFF54| ADC.w $0D00,X
|1EFF57| STA.w $0D00,X

|1EFF5A| TYA
|1EFF5B| ADC.w $0D20,X
|1EFF5E| STA.w $0D20,X

.exit
|1EFF61| RTS

;===================================================================================================

MoveSpriteZ_bank1E:
|1EFF62| LDA.w $0F80,X
|1EFF65| ASL A
|1EFF66| ASL A
|1EFF67| ASL A
|1EFF68| ASL A
|1EFF69| CLC
|1EFF6A| ADC.w $0F90,X
|1EFF6D| STA.w $0F90,X

|1EFF70| LDA.w $0F80,X
|1EFF73| PHP

|1EFF74| LSR A
|1EFF75| LSR A
|1EFF76| LSR A
|1EFF77| LSR A

|1EFF78| PLP
|1EFF79| BPL .positive_velocity

|1EFF7B| ORA.b #$F0

.positive_velocity
|1EFF7D| ADC.w $0F70,X
|1EFF80| STA.w $0F70,X

|1EFF83| RTS

;===================================================================================================

GetScreenCoordinates_bank1E:
|1EFF84| JSL GetScreenCoordinates_long
|1EFF88| BCC .draw

|1EFF8A| PLA
|1EFF8B| PLA

.draw
|1EFF8C| RTS

;===================================================================================================

DrawRippleIfInWater:
|1EFF8D| LDA.l $7FF9C2,X
|1EFF91| CMP.b #$08 ; TILETYPE 08
|1EFF93| BEQ .water_tile

|1EFF95| CMP.b #$09 ; TILETYPE 09
|1EFF97| BNE .not_water_tile

.water_tile
|1EFF99| LDA.w $0E60,X
|1EFF9C| AND.b #$20
|1EFF9E| BEQ .no_offset

|1EFFA0| LDA.w $0FD8
|1EFFA3| SEC
|1EFFA4| SBC.b #$04
|1EFFA6| STA.w $0FD8

|1EFFA9| LDA.w $0FD9
|1EFFAC| SBC.b #$00
|1EFFAE| STA.w $0FD9

|1EFFB1| LDA.w $0E20,X
|1EFFB4| CMP.b #$DF ; [HARDCODED] thing for small magic (SPRITE DF)
|1EFFB6| BNE .no_offset

|1EFFB8| LDA.w $0FDA
|1EFFBB| SEC
|1EFFBC| SBC.b #$07
|1EFFBE| STA.w $0FDA

|1EFFC1| LDA.w $0FDB
|1EFFC4| SBC.b #$00
|1EFFC6| STA.w $0FDB

.no_offset
|1EFFC9| JSL SpriteDraw_WaterRipple
|1EFFCD| JSL Get16BitSpriteCoords_long

|1EFFD1| LDA.w $0E40,X
|1EFFD4| AND.b #$1F
|1EFFD6| INC A
|1EFFD7| ASL A
|1EFFD8| ASL A

|1EFFD9| JSL AllocateOAMInRegionA

.not_water_tile
|1EFFDD| RTL

;===================================================================================================
; FREE ROM: 0x22
;===================================================================================================
NULL_1EFFDE:
|1EFFDE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1EFFE6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1EFFEE| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1EFFF6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|1EFFFE| db $FF, $FF

;===================================================================================================
