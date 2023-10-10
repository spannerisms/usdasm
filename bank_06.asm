org $068000

;===================================================================================================

BottleMerchant_DetectFish:
#_068000: PHB
#_068001: PHK
#_068002: PLB

#_068003: LDY.b #$0F

.next
#_068005: LDA.w $0DD0,Y
#_068008: BEQ .inactive

#_06800A: LDA.w $0E20,Y
#_06800D: CMP.b #$D2 ; SPRITE D2
#_06800F: BEQ .is_fish

.inactive
#_068011: DEY
#_068012: BPL .next

#_068014: PLB

#_068015: RTL

;---------------------------------------------------------------------------------------------------

.is_fish
#_068016: LDA.w $0D10,X
#_068019: STA.b $00

#_06801B: LDA.w $0D30,X
#_06801E: STA.b $08

#_068020: LDA.b #$10
#_068022: STA.b $02

#_068024: LDA.w $0D00,X
#_068027: STA.b $01

#_068029: LDA.w $0D20,X
#_06802C: STA.b $09

#_06802E: LDA.b #$10
#_068030: STA.b $03

#_068032: PHX

#_068033: TYX
#_068034: JSR Sprite_SetupHitBox

#_068037: PLX

#_068038: JSR CheckIfHitBoxesOverlap
#_06803B: BCC .no_good

#_06803D: TYA
#_06803E: ORA.b #$80
#_068040: STA.w $0E90,X

.no_good
#_068043: PLB

#_068044: RTL

;===================================================================================================

pool BottleMerchant_BuyFish

.speed_x
#_068045: db -6
#_068046: db -3
#_068047: db  0
#_068048: db  4
#_068049: db  7

.speed_y
#_06804A: db 11
#_06804B: db 14
#_06804C: db 16
#_06804D: db 14
#_06804E: db 11

.item_id
#_06804F: db $DB ; SPRITE DB - red rupee
#_068050: db $E0 ; SPRITE E0 - large magic
#_068051: db $DE ; SPRITE DE - 8 bombs
#_068052: db $E2 ; SPRITE E2 - 10 arrows
#_068053: db $D9 ; SPRITE D9 - green rupee

pool off

;---------------------------------------------------------------------------------------------------

BottleMerchant_BuyFish:
#_068054: PHB
#_068055: PHK
#_068056: PLB

#_068057: LDA.b #$13 ; SFX3.13
#_068059: JSL SpriteSFX_QueueSFX3WithPan

#_06805D: LDA.b #$04
#_06805F: STA.w $0FB5

.next_gift
#_068062: LDY.w $0FB5

#_068065: LDA.w .item_id,Y
#_068068: JSL Sprite_SpawnDynamically
#_06806C: BMI .skip

#_06806E: JSL Sprite_SetSpawnedCoordinates

#_068072: LDA.b $00
#_068074: CLC
#_068075: ADC.b #$04
#_068077: STA.w $0D10,Y

#_06807A: LDA.b #$FF
#_06807C: STA.w $0B58,Y

#_06807F: PHX

#_068080: LDX.w $0FB5

#_068083: LDA.w .speed_x,X
#_068086: STA.w $0D50,Y

#_068089: LDA.w .speed_y,X
#_06808C: STA.w $0D40,Y

#_06808F: LDA.b #$20
#_068091: STA.w $0F80,Y
#_068094: STA.w $0F10,Y

#_068097: PLX

.skip
#_068098: DEC.w $0FB5
#_06809B: BPL .next_gift

#_06809D: PLB

#_06809E: RTL

;===================================================================================================

Boomerang_CheatWhenNoOnesLooking:
#_06809F: LDA.w $0C04,X
#_0680A2: STA.b $02

#_0680A4: LDA.w $0C18,X
#_0680A7: STA.b $03

#_0680A9: LDA.w $0BFA,X
#_0680AC: STA.b $04

#_0680AE: LDA.w $0C0E,X
#_0680B1: STA.b $05

#_0680B3: REP #$20

#_0680B5: LDY.b #$70

#_0680B7: LDA.b $22
#_0680B9: SEC
#_0680BA: SBC.b $02

#_0680BC: CLC
#_0680BD: ADC.w #$00F0

#_0680C0: CMP.w #$01E0
#_0680C3: BPL .positive_speed_x

#_0680C5: LDY.b #$90

.positive_speed_x
#_0680C7: BCC .nowdoY

#_0680C9: STY.b $01

#_0680CB: BRA .done

.nowdoY
#_0680CD: LDY.b #$70

#_0680CF: LDA.b $20
#_0680D1: SEC
#_0680D2: SBC.b $04

#_0680D4: CLC
#_0680D5: ADC.w #$00F0

#_0680D8: CMP.w #$01E0
#_0680DB: BPL .positive_Y_speed

#_0680DD: LDY.b #$90

.positive_Y_speed
#_0680DF: BCC .done

#_0680E1: STY.b $00

.done
#_0680E3: SEP #$20

#_0680E5: RTL

;===================================================================================================

pool Prepare_ApplyRumbleToSprites

.offset_x_low
#_0680E6: db -32, -32, -32, 16

.offset_y_low
#_0680EA: db -32, 32, -24, -24

.offset_y_high ; bleeds into next
#_0680EE: db -1,  0

.offset_x_high
#_0680F0: db -1, -1, -1, 0

.hitbox_w ; bleeds into next
#_0680F4: db 80, 80

.hitbox_h
#_0680F6: db 32, 32, 80, 80

pool off

;---------------------------------------------------------------------------------------------------

Prepare_ApplyRumbleToSprites:
#_0680FA: PHB
#_0680FB: PHK
#_0680FC: PLB

#_0680FD: LDA.b $2F
#_0680FF: LSR A
#_068100: TAY

#_068101: LDA.b $22
#_068103: CLC
#_068104: ADC.w .offset_x_low,Y
#_068107: STA.b $00

#_068109: LDA.b $23
#_06810B: ADC.w .offset_x_high,Y
#_06810E: STA.b $08

#_068110: LDA.b $20
#_068112: ADC.w .offset_y_low,Y
#_068115: STA.b $01

#_068117: LDA.b $21
#_068119: ADC.w .offset_y_high,Y
#_06811C: STA.b $09

#_06811E: LDA.w .hitbox_w,Y
#_068121: STA.b $02

#_068123: LDA.w .hitbox_h,Y
#_068126: STA.b $03

#_068128: JSR ApplyRumbleToSprites

#_06812B: PLB

#_06812C: RTL

;===================================================================================================

Sprite_SpawnImmediatelySmashedTerrain:
#_06812D: LDY.w $0314
#_068130: PHY

#_068131: LDY.w $0FB2
#_068134: PHY

#_068135: PHB
#_068136: PHK
#_068137: PLB

#_068138: JSL Sprite_SpawnThrowableTerrain_silently
#_06813C: BMI .fail

#_06813E: JSR ThrowableScenery_TransmuteToDebris

.fail
#_068141: PLB

#_068142: PLA
#_068143: STA.w $0FB2

#_068146: PLA
#_068147: STA.w $0314

#_06814A: RTL

;===================================================================================================

Sprite_SpawnThrowableTerrain:
#_06814B: PHA

#_06814C: JSL Link_CalculateSFXPan
#_068150: ORA.b #$1D ; SFX2.1D
#_068152: STA.w $012E

#_068155: PLA

;---------------------------------------------------------------------------------------------------

Sprite_SpawnThrowableTerrain_silently:
#_068156: LDX.b #$0F

.next_slot
#_068158: LDY.w $0DD0,X
#_06815B: BEQ .free_slot

#_06815D: DEX
#_06815E: BPL .next_slot

#_068160: RTL

;---------------------------------------------------------------------------------------------------

.free_slot
#_068161: PHA

#_068162: LDA.b #$0A
#_068164: STA.w $0DD0,X

#_068167: LDA.b #$EC ; SPRITE EC
#_068169: STA.w $0E20,X

#_06816C: LDA.b $00
#_06816E: STA.w $0D10,X

#_068171: LDA.b $01
#_068173: STA.w $0D30,X

#_068176: LDA.b $02
#_068178: STA.w $0D00,X

#_06817B: LDA.b $03
#_06817D: STA.w $0D20,X

#_068180: JSL SpritePrep_LoadProperties

#_068184: LDA.b $EE
#_068186: STA.w $0F20,X

#_068189: PLA
#_06818A: STA.w $0DB0,X

#_06818D: CMP.b #$06
#_06818F: BCC .light_object

#_068191: PHA

#_068192: LDA.b #$A6
#_068194: STA.w $0E40,X

#_068197: PLA

;---------------------------------------------------------------------------------------------------

.light_object
#_068198: CMP.b #$02
#_06819A: BNE .not_bush_or_pot

#_06819C: LDA.b $1B
#_06819E: BEQ .not_bush_or_pot

#_0681A0: LDA.b #$80
#_0681A2: STA.w $0F50,X

.not_bush_or_pot
#_0681A5: PHB
#_0681A6: PHK
#_0681A7: PLB

#_0681A8: TAY

#_0681A9: LDA.w SpriteDraw_ThrownItem_palette,Y
#_0681AC: STA.w $0F50,X

#_0681AF: LDA.b #$09
#_0681B1: STA.l $7FFA2C,X

#_0681B5: LDA.b #$02
#_0681B7: STA.w $0314
#_0681BA: STA.w $0FB2

#_0681BD: LDA.b #$10
#_0681BF: STA.w $0DF0,X

#_0681C2: LDA.b $EE
#_0681C4: STA.w $0F20,X

#_0681C7: STZ.w $0DC0,X

#_0681CA: LDA.w $0B9C
#_0681CD: CMP.b #$FF
#_0681CF: BEQ .exit

#_0681D1: ORA.b $1B
#_0681D3: BNE .no_substitution

#_0681D5: LDA.w $0DB0,X
#_0681D8: DEC A
#_0681D9: DEC A
#_0681DA: CMP.b #$02
#_0681DC: BCS .no_substitution

#_0681DE: JSL Overworld_SubstituteAlternateSecret

.no_substitution
#_0681E2: LDA.w $0B9C
#_0681E5: BPL .normal

#_0681E7: AND.b #$7F
#_0681E9: STA.w $0DC0,X

#_0681EC: STZ.w $0B9C

.normal
#_0681EF: JSR Sprite_SpawnSecret

.exit
#_0681F2: PLB

#_0681F3: RTL

;===================================================================================================

pool Sprite_SpawnSecret

.ID
#_0681F4: db $D9 ; SPRITE D9 - 0x01 - green rupee
#_0681F5: db $3E ; SPRITE 3E - 0x02 - hoarder
#_0681F6: db $79 ; SPRITE 79 - 0x03 - bee
#_0681F7: db $D9 ; SPRITE D9 - 0x04 - green rupee
#_0681F8: db $DC ; SPRITE DC - 0x05 - 1 bomb
#_0681F9: db $D8 ; SPRITE D8 - 0x06 - heart
#_0681FA: db $DA ; SPRITE DA - 0x07 - blue rupee
#_0681FB: db $E4 ; SPRITE E4 - 0x08 - small key
#_0681FC: db $E1 ; SPRITE E1 - 0x09 - 5 arrows
#_0681FD: db $DC ; SPRITE DC - 0x0A - 1 bomb
#_0681FE: db $D8 ; SPRITE D8 - 0x0B - heart
#_0681FF: db $DF ; SPRITE DF - 0x0C - small magic
#_068200: db $E0 ; SPRITE E0 - 0x0D - full magic
#_068201: db $0B ; SPRITE 0B - 0x0E - cucco
#_068202: db $42 ; SPRITE 42 - 0x0F - green guard
#_068203: db $D3 ; SPRITE D3 - 0x10 - stal
#_068204: db $41 ; SPRITE 41 - 0x11 - blue guard
#_068205: db $D4 ; SPRITE D4 - 0x12 - landmine
#_068206: db $D9 ; SPRITE D9 - 0x13 - green rupee
#_068207: db $E3 ; SPRITE E3 - 0x14 - fairy
#_068208: db $D8 ; SPRITE D8 - 0x15 - heart

;---------------------------------------------------------------------------------------------------

.AI2
#_068209: db $00 ; 0x00 - null
#_06820A: db $00 ; 0x01 - green rupee
#_06820B: db $01 ; 0x02 - hoarder
#_06820C: db $01 ; 0x03 - bee
#_06820D: db $00 ; 0x04 - green rupee
#_06820E: db $00 ; 0x05 - 1 bomb
#_06820F: db $00 ; 0x06 - heart
#_068210: db $00 ; 0x07 - blue rupee
#_068211: db $00 ; 0x08 - small key
#_068212: db $00 ; 0x09 - 5 arrows
#_068213: db $00 ; 0x0A - 1 bomb
#_068214: db $03 ; 0x0B - heart
#_068215: db $00 ; 0x0C - small magic
#_068216: db $00 ; 0x0D - full magic
#_068217: db $01 ; 0x0E - cucco
#_068218: db $00 ; 0x0F - green guard
#_068219: db $00 ; 0x10 - stal
#_06821A: db $00 ; 0x11 - blue guard
#_06821B: db $00 ; 0x12 - landmine
#_06821C: db $00 ; 0x13 - green rupee
#_06821D: db $00 ; 0x14 - fairy
#_06821E: db $00 ; 0x15 - heart

;---------------------------------------------------------------------------------------------------

.offset_x
#_06821F: db $00 ; 0x00 - null
#_068220: db $04 ; 0x01 - green rupee
#_068221: db $00 ; 0x02 - hoarder
#_068222: db $04 ; 0x03 - bee
#_068223: db $04 ; 0x04 - green rupee
#_068224: db $00 ; 0x05 - 1 bomb
#_068225: db $04 ; 0x06 - heart
#_068226: db $04 ; 0x07 - blue rupee
#_068227: db $04 ; 0x08 - small key
#_068228: db $04 ; 0x09 - 5 arrows
#_068229: db $00 ; 0x0A - 1 bomb
#_06822A: db $04 ; 0x0B - heart
#_06822B: db $04 ; 0x0C - small magic
#_06822C: db $04 ; 0x0D - full magic
#_06822D: db $00 ; 0x0E - cucco
#_06822E: db $00 ; 0x0F - green guard
#_06822F: db $00 ; 0x10 - stal
#_068230: db $00 ; 0x11 - blue guard
#_068231: db $00 ; 0x12 - landmine
#_068232: db $04 ; 0x13 - green rupee
#_068233: db $00 ; 0x14 - fairy
#_068234: db $04 ; 0x15 - heart

;---------------------------------------------------------------------------------------------------

.ignore_ancillae
#_068235: db $04 ; 0x00 - null
#_068236: db $01 ; 0x01 - green rupee
#_068237: db $00 ; 0x02 - hoarder
#_068238: db $00 ; 0x03 - bee
#_068239: db $01 ; 0x04 - green rupee
#_06823A: db $01 ; 0x05 - 1 bomb
#_06823B: db $01 ; 0x06 - heart
#_06823C: db $01 ; 0x07 - blue rupee
#_06823D: db $01 ; 0x08 - small key
#_06823E: db $01 ; 0x09 - 5 arrows
#_06823F: db $01 ; 0x0A - 1 bomb
#_068240: db $01 ; 0x0B - heart
#_068241: db $01 ; 0x0C - small magic
#_068242: db $01 ; 0x0D - full magic
#_068243: db $00 ; 0x0E - cucco
#_068244: db $00 ; 0x0F - green guard
#_068245: db $00 ; 0x10 - stal
#_068246: db $00 ; 0x11 - blue guard
#_068247: db $00 ; 0x12 - landmine
#_068248: db $01 ; 0x13 - green rupee
#_068249: db $01 ; 0x14 - fairy
#_06824A: db $01 ; 0x15 - heart

;---------------------------------------------------------------------------------------------------

.jump_velocity
#_06824B: db $01 ; 0x00 - null
#_06824C: db $10 ; 0x01 - green rupee
#_06824D: db $00 ; 0x02 - hoarder
#_06824E: db $00 ; 0x03 - bee
#_06824F: db $10 ; 0x04 - green rupee
#_068250: db $00 ; 0x05 - 1 bomb
#_068251: db $00 ; 0x06 - heart
#_068252: db $10 ; 0x07 - blue rupee
#_068253: db $10 ; 0x08 - small key
#_068254: db $10 ; 0x09 - 5 arrows
#_068255: db $10 ; 0x0A - 1 bomb
#_068256: db $00 ; 0x0B - heart
#_068257: db $10 ; 0x0C - small magic
#_068258: db $0A ; 0x0D - full magic
#_068259: db $10 ; 0x0E - cucco
#_06825A: db $00 ; 0x0F - green guard
#_06825B: db $00 ; 0x10 - stal
#_06825C: db $00 ; 0x11 - blue guard
#_06825D: db $00 ; 0x12 - landmine
#_06825E: db $10 ; 0x13 - green rupee
#_06825F: db $00 ; 0x14 - fairy
#_068260: db $00 ; 0x15 - heart
#_068261: db $00 ; 0x16 - null

pool off

;---------------------------------------------------------------------------------------------------

Sprite_SpawnSecret_fastexit:
#_068262: CLC

#_068263: RTS

;---------------------------------------------------------------------------------------------------

Sprite_SpawnSecret:
#_068264: LDA.b $1B
#_068266: BNE .indoors

#_068268: JSL GetRandomNumber
#_06826C: AND.b #$08
#_06826E: BNE .fastexit

.indoors
#_068270: LDY.w $0B9C
#_068273: BEQ .fastexit

#_068275: CPY.b #$04
#_068277: BNE .not_random_bush

#_068279: JSL GetRandomNumber
#_06827D: AND.b #$03
#_06827F: CLC
#_068280: ADC.b #$13
#_068282: TAY

.not_random_bush
#_068283: STY.b $0D

#_068285: LDA.w .ID-1,Y
#_068288: BEQ .fastexit

#_06828A: JSL Sprite_SpawnDynamically
#_06828E: BMI .fastexit

;---------------------------------------------------------------------------------------------------

#_068290: PHX

#_068291: LDX.b $0D

#_068293: LDA.w .AI2,X
#_068296: STA.w $0D80,Y

#_068299: LDA.w .ignore_ancillae,X
#_06829C: STA.w $0BA0,Y

#_06829F: LDA.w .jump_velocity,X
#_0682A2: STA.w $0F80,Y

#_0682A5: LDA.b $00
#_0682A7: CLC
#_0682A8: ADC.w .offset_x,X
#_0682AB: STA.w $0D10,Y

#_0682AE: LDA.b $01
#_0682B0: ADC.b #$00
#_0682B2: STA.w $0D30,Y

#_0682B5: LDA.b $02
#_0682B7: STA.w $0D00,Y

#_0682BA: LDA.b $03
#_0682BC: STA.w $0D20,Y

#_0682BF: LDA.b $04
#_0682C1: STA.w $0F70,Y

#_0682C4: LDA.b #$00
#_0682C6: STA.w $0DC0,Y

#_0682C9: LDA.b #$20
#_0682CB: STA.w $0F10,Y

#_0682CE: LDA.b #$30
#_0682D0: STA.w $0E10,Y

#_0682D3: LDX.w $0E20,Y
#_0682D6: CPX.b #$E4 ; SPRITE E4
#_0682D8: BNE .not_key

#_0682DA: PHX

#_0682DB: TYX

#_0682DC: JSR SpritePrep_SmallKey

#_0682DF: PLX

;---------------------------------------------------------------------------------------------------

.not_key
#_0682E0: CPX.b #$0B ; SPRITE 0B
#_0682E2: BNE .not_cucco

#_0682E4: LDA.b #$30 ; SFX2.30
#_0682E6: STA.w $012E

#_0682E9: LDA.w $048E
#_0682EC: CMP.b #$01 ; ROOM 0101
#_0682EE: BNE .not_cucco

#_0682F0: STA.w $0E30,Y

.not_cucco
#_0682F3: CPX.b #$42 ; SPRITE 42
#_0682F5: BEQ .guard

#_0682F7: CPX.b #$41 ; SPRITE 41
#_0682F9: BEQ .guard

#_0682FB: CPX.b #$3E ; SPRITE 3E
#_0682FD: BNE .not_hoarder

#_0682FF: LDA.b #$09
#_068301: STA.w $0F50,Y

#_068304: BRA .done

;---------------------------------------------------------------------------------------------------

.guard
#_068306: LDA.b #$04 ; SFX3.04
#_068308: STA.w $012F

#_06830B: LDA.b #$00
#_06830D: STA.w $0CE2,Y

#_068310: LDA.b #$A0
#_068312: STA.w $0EF0,Y

#_068315: BRA .last_check

;---------------------------------------------------------------------------------------------------

.not_hoarder
#_068317: LDA.b #$FF
#_068319: STA.w $0B58,Y

.last_check
#_06831C: CPX.b #$79 ; SPRITE 79
#_06831E: BNE .done

#_068320: LDA.b #$20
#_068322: STA.w $0D90,Y

;---------------------------------------------------------------------------------------------------

.done
#_068325: SEC

#_068326: PLX

#_068327: RTS

;===================================================================================================

Sprite_Main:
#_068328: LDA.b $1B
#_06832A: BNE .indoors

#_06832C: STZ.w $0C7C
#_06832F: STZ.w $0C7D
#_068332: STZ.w $0C7E
#_068335: STZ.w $0C7F
#_068338: STZ.w $0C80

#_06833B: JSL Sprite_ProximityActivation

;---------------------------------------------------------------------------------------------------

.indoors
#_06833F: PHB
#_068340: PHK
#_068341: PLB

#_068342: LDY.b #$00

#_068344: LDA.l $7EF3CA
#_068348: BEQ .lightworld

#_06834A: INY

.lightworld
#_06834B: STY.w $0FFF

#_06834E: LDA.b $11
#_068350: BNE .dont_reset_drag

#_068352: STZ.w $0B7C
#_068355: STZ.w $0B7D
#_068358: STZ.w $0B7E
#_06835B: STZ.w $0B7F

;---------------------------------------------------------------------------------------------------

.dont_reset_drag
#_06835E: JSR OAM_ResetRegionBases
#_068361: JSL Garnish_ExecuteUpperSlots_long
#_068365: JSL Follower_Main

#_068369: LDA.w $0314
#_06836C: STA.w $0FB2

#_06836F: STZ.w $0314

#_068372: LDA.b #$80
#_068374: STA.w $0FAB

#_068377: LDA.b $47
#_068379: AND.b #$7F
#_06837B: BEQ .repulse_timer_over

#_06837D: DEC.b $47
#_06837F: BRA .continue

;---------------------------------------------------------------------------------------------------

.repulse_timer_over
#_068381: STZ.b $47

.continue
#_068383: STZ.w $0379
#_068386: STZ.w $0377
#_068389: STZ.w $0B7B

#_06838C: LDA.w $0FDC
#_06838F: BEQ .alert_timer_over

#_068391: DEC.w $0FDC

;---------------------------------------------------------------------------------------------------

.alert_timer_over
#_068394: JSL Ancilla_Main
#_068398: JSL Overlord_Main

#_06839C: STZ.w $0B9A

#_06839F: LDX.b #$0F

.next_sprite
#_0683A1: STX.w $0FA0

#_0683A4: JSR Sprite_ExecuteSingle

#_0683A7: DEX
#_0683A8: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0683AA: JSL Garnish_ExecuteLowerSlots_long

#_0683AE: STZ.w $069F
#_0683B1: STZ.w $069E

#_0683B4: PLB

#_0683B5: JSL ExecuteCachedSprites

#_0683B9: LDA.w $0AAA
#_0683BC: BEQ .exit

#_0683BE: STA.w $0FC6

.exit
#_0683C1: RTL

;===================================================================================================

NRURURU_bounce:
#_0683C2: JSL NRURURU

#_0683C6: RTL

;===================================================================================================

pool OAM_ResetRegionBases

.addresses
#_0683C7: dw $0030
#_0683C9: dw $01D0
#_0683CB: dw $0000
#_0683CD: dw $0030
#_0683CF: dw $0120
#_0683D1: dw $0140

pool off

;---------------------------------------------------------------------------------------------------

OAM_ResetRegionBases:
#_0683D3: LDY.b #$00

#_0683D5: REP #$20

.next
#_0683D7: LDA.w .addresses,Y
#_0683DA: STA.w $0FE0,Y

#_0683DD: INY
#_0683DE: INY
#_0683DF: CPY.b #$0B
#_0683E1: BCC .next

#_0683E3: SEP #$20

#_0683E5: RTS

;===================================================================================================

CheckIfHitBoxesOverlap_long:
#_0683E6: JSR CheckIfHitBoxesOverlap

#_0683E9: RTL

;===================================================================================================

Sprite_SetupHitbox_long:
#_0683EA: PHB
#_0683EB: PHK
#_0683EC: PLB

#_0683ED: JSR Sprite_SetupHitBox

#_0683F0: PLB

#_0683F1: RTL

;===================================================================================================

Sprite_TimersAndOAM:
#_0683F2: JSR Sprite_Get16BitCoords

#_0683F5: LDA.w $0E40,X
#_0683F8: AND.b #$1F
#_0683FA: INC A

#_0683FB: ASL A
#_0683FC: ASL A

#_0683FD: LDY.w $0FB3
#_068400: BEQ .use_regionA

#_068402: LDY.w $0F20,X
#_068405: BEQ .use_regionD

#_068407: JSL SpriteDraw_AllocateOAMFromRegionF
#_06840B: BRA .oam_done

.use_regionD
#_06840D: JSL SpriteDraw_AllocateOAMFromRegionD
#_068411: BRA .oam_done

.use_regionA
#_068413: JSL SpriteDraw_AllocateOAMFromRegionA

.oam_done
#_068417: LDA.b $11
#_068419: ORA.w $0FC1
#_06841C: BEQ .timers_ago

#_06841E: JMP.w .handle_linkhop

;---------------------------------------------------------------------------------------------------

.timers_ago
#_068421: LDA.w $0DF0,X
#_068424: BEQ .skip_timer0

#_068426: DEC.w $0DF0,X

.skip_timer0
#_068429: LDA.w $0E00,X
#_06842C: BEQ .skip_timer1

#_06842E: DEC.w $0E00,X

.skip_timer1
#_068431: LDA.w $0E10,X
#_068434: BEQ .skip_timer2

#_068436: DEC.w $0E10,X

.skip_timer2
#_068439: LDA.w $0EE0,X
#_06843C: BEQ .skip_timer3

#_06843E: DEC.w $0EE0,X

.skip_timer3
#_068441: LDA.w $0EF0,X
#_068444: AND.b #$7F
#_068446: BEQ .skip_hit_timer

#_068448: LDY.w $0DD0,X
#_06844B: CPY.b #$09
#_06844D: BCC .no_damage

#_06844F: CMP.b #$1F
#_068451: BNE .delay_damage

;---------------------------------------------------------------------------------------------------

#_068453: PHA

#_068454: LDA.w $0E20,X
#_068457: CMP.b #$7A ; SPRITE 7A
#_068459: BNE .not_agahnim2

#_06845B: LDA.w $0FFF
#_06845E: BNE .not_agahnim2

#_068460: LDA.w $0E50,X
#_068463: SEC
#_068464: SBC.w $0CE2,X

#_068467: BEQ .aga2_message
#_068469: BCS .not_agahnim2

.aga2_message
#_06846B: LDA.b #$40 ; MESSAGE 0140
#_06846D: STA.w $1CF0

#_068470: LDA.b #$01
#_068472: STA.w $1CF1

#_068475: JSL Sprite_ShowMessageMinimal

;---------------------------------------------------------------------------------------------------

.not_agahnim2
#_068479: PLA

.delay_damage
#_06847A: CMP.b #$18
#_06847C: BNE .no_damage

#_06847E: JSR Sprite_HandleSpecialHits

.no_damage
#_068481: LDA.w $0CE2,X
#_068484: CMP.b #$FB
#_068486: BCS .skip_palette_cycling

#_068488: LDA.w $0EF0,X
#_06848B: ASL A
#_06848C: AND.b #$0E
#_06848E: STA.w $0B89,X

.skip_palette_cycling
#_068491: DEC.w $0EF0,X

#_068494: BRA .hit_continue

.skip_hit_timer
#_068496: STZ.w $0EF0,X
#_068499: STZ.w $0B89,X

.hit_continue
#_06849C: LDA.w $0F10,X
#_06849F: BEQ .handle_linkhop

#_0684A1: DEC.w $0F10,X

.handle_linkhop
#_0684A4: LDY.b $EE
#_0684A6: CPY.b #$03
#_0684A8: BEQ .link_is_jumping

#_0684AA: LDY.w $0F20,X

.link_is_jumping
#_0684AD: LDA.w $0B89,X
#_0684B0: AND.b #$CF
#_0684B2: ORA.w .OAM_priority,Y
#_0684B5: STA.w $0B89,X

#_0684B8: RTS

;---------------------------------------------------------------------------------------------------

.OAM_priority
#_0684B9: db $20, $10, $30, $30

;===================================================================================================

Sprite_Get16BitCoords_long:
#_0684BD: JSR Sprite_Get16BitCoords

#_0684C0: RTL

;---------------------------------------------------------------------------------------------------

Sprite_Get16BitCoords:
#_0684C1: LDA.w $0D10,X
#_0684C4: STA.w $0FD8

#_0684C7: LDA.w $0D30,X
#_0684CA: STA.w $0FD9

#_0684CD: LDA.w $0D00,X
#_0684D0: STA.w $0FDA

#_0684D3: LDA.w $0D20,X
#_0684D6: STA.w $0FDB

#_0684D9: RTS

;===================================================================================================

Sprite_ExecuteSingle_long:
#_0684DA: PHB
#_0684DB: PHK
#_0684DC: PLB

#_0684DD: JSR Sprite_ExecuteSingle

#_0684E0: PLB

#_0684E1: RTL

;---------------------------------------------------------------------------------------------------

Sprite_ExecuteSingle:
#_0684E2: LDA.w $0DD0,X
#_0684E5: BEQ SpriteModule_Inactive

#_0684E7: PHA

#_0684E8: JSR Sprite_TimersAndOAM

#_0684EB: PLA
#_0684EC: CMP.b #$09
#_0684EE: BEQ .active

#_0684F0: JSL JumpTableLocal
#_0684F4: dw SpriteModule_Inactive       ; 0x00
#_0684F6: dw SpriteModule_Fall1          ; 0x01
#_0684F8: dw SpriteModule_Poof           ; 0x02
#_0684FA: dw SpriteModule_Drown          ; 0x03
#_0684FC: dw SpriteModule_Explode_bounce ; 0x04
#_0684FE: dw SpriteModule_Fall2          ; 0x05
#_068500: dw SpriteModule_Die            ; 0x06
#_068502: dw SpriteModule_Burn_bounce    ; 0x07
#_068504: dw SpriteModule_Initialize     ; 0x08
#_068506: dw SpriteModule_Active         ; 0x09
#_068508: dw SpriteModule_Carried        ; 0x0A
#_06850A: dw SpriteModule_Stunned        ; 0x0B

;---------------------------------------------------------------------------------------------------

.active
#_06850C: JMP.w SpriteModule_Active

;===================================================================================================

SpritePrep_DoNothingI:
#_06850F: RTS

;===================================================================================================

SpriteModule_Inactive:
#_068510: LDA.b $1B
#_068512: BNE .indoors

#_068514: TXA
#_068515: ASL A
#_068516: TAY

#_068517: LDA.b #$FF
#_068519: STA.w $0BC0,Y
#_06851C: STA.w $0BC1,Y

#_06851F: RTS

.indoors
#_068520: LDA.b #$FF
#_068522: STA.w $0BC0,X

#_068525: RTS

;===================================================================================================

SpriteModule_Active_long:
#_068526: PHB
#_068527: PHK
#_068528: PLB

#_068529: JSR SpriteModule_Active

#_06852C: PLB

#_06852D: RTL

;===================================================================================================

SpriteModule_Fall1:
#_06852E: LDA.w $0DF0,X
#_068531: BNE .fall_longer

#_068533: STZ.w $0DD0,X

#_068536: JSL Sprite_ManuallySetDeathFlagUW

#_06853A: RTS

.fall_longer
#_06853B: JSR Sprite_PrepOAMCoord
#_06853E: JSL SpriteDraw_Falling

#_068542: RTS

;===================================================================================================

SpriteModule_Burn_bounce:
#_068543: JSL SpriteModule_Burn

#_068547: RTS

;===================================================================================================

SpriteModule_Explode_bounce:
#_068548: JSL SpriteModule_Explode

#_06854C: RTS

;===================================================================================================

pool SpriteModule_Drown

.oam_groups
#_06854D: dw  -7,  -7 : db $80, $04, $00, $00
#_068555: dw  14,  -6 : db $83, $04, $00, $00

#_06855D: dw  -6,  -6 : db $CF, $04, $00, $00
#_068565: dw  13,  -5 : db $DF, $04, $00, $00

#_06856D: dw  -4,  -4 : db $AE, $04, $00, $00
#_068575: dw  12,  -4 : db $AF, $44, $00, $00

#_06857D: dw   0,   0 : db $E7, $04, $00, $02
#_068585: dw   0,   0 : db $E7, $04, $00, $02

;---------------------------------------------------------------------------------------------------

.flip
#_06858D: db $00
#_06858E: db $40
#_06858F: db $C0
#_068590: db $80

.char
#_068591: db $C0, $C0, $C0, $C0
#_068595: db $CD, $CD, $CD
#_068598: db $CB, $CB, $CB, $CB

pool off

;---------------------------------------------------------------------------------------------------

SpriteModule_Drown:
#_06859C: LDA.w $0D80,X
#_06859F: BEQ Drowning_DrawSprite

#_0685A1: LDA.w $0D90,X
#_0685A4: CMP.b #$06
#_0685A6: BNE .use_allotted_region

#_0685A8: LDA.b #$08
#_0685AA: JSL SpriteDraw_AllocateOAMFromRegionC

.use_allotted_region
#_0685AE: LDA.w $0E60,X
#_0685B1: EOR.b #$10
#_0685B3: STA.w $0E60,X

#_0685B6: JSR SpriteDraw_SingleLarge

#_0685B9: LDA.w $0E80,X
#_0685BC: LSR A
#_0685BD: LSR A
#_0685BE: AND.b #$03
#_0685C0: TAY

#_0685C1: LDA.w .flip,Y
#_0685C4: STA.b $05

#_0685C6: LDA.w $0DF0,X
#_0685C9: CMP.b #$01
#_0685CB: BNE .stay_alive

#_0685CD: STZ.w $0DD0,X

.stay_alive
#_0685D0: PHX

#_0685D1: LDA.b #$8A
#_0685D3: BCC .delay

#_0685D5: LDA.w $0DF0,X
#_0685D8: LSR A
#_0685D9: TAX

#_0685DA: STZ.b $05

#_0685DC: LDA.w .char,X

.delay
#_0685DF: LDY.b #$02
#_0685E1: STA.b ($90),Y

#_0685E3: INY
#_0685E4: LDA.b #$24
#_0685E6: ORA.b $05
#_0685E8: STA.b ($90),Y

#_0685EA: PLX

#_0685EB: LDA.w $0DF0,X
#_0685EE: BNE EXIT_06861A

;---------------------------------------------------------------------------------------------------

#_0685F0: JSR Sprite_CheckIfActivePermissive_Bank06

#_0685F3: INC.w $0E80,X

#_0685F6: JSR Sprite_Move_XY_Bank06
#_0685F9: JSR Sprite_Move_Z_Bank06

#_0685FC: LDA.w $0F80,X
#_0685FF: SEC
#_068600: SBC.b #$02
#_068602: STA.w $0F80,X

#_068605: LDA.w $0F70,X
#_068608: BPL EXIT_06861A

#_06860A: STZ.w $0F70,X

#_06860D: LDA.b #$12
#_06860F: STA.w $0DF0,X

;===================================================================================================

Sprite_DisableShadowFlag:
#_068612: LDA.w $0E60,X
#_068615: AND.b #$EF
#_068617: STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

#EXIT_06861A:
#_06861A: RTS

;===================================================================================================

Drowning_DrawSprite:
#_06861B: JSR Sprite_CheckIfActivePermissive_Bank06

#_06861E: LDA.b $1A
#_068620: AND.b #$01
#_068622: BNE .timer_parity

#_068624: INC.w $0DF0,X

.timer_parity
#_068627: STZ.w $0F50,X
#_06862A: STZ.w $0EF0,X

#_06862D: LDA.b #$00
#_06862F: XBA

#_068630: LDA.w $0DF0,X
#_068633: BNE .stay_alive

#_068635: STZ.w $0DD0,X

.stay_alive
#_068638: REP #$20

#_06863A: ASL A
#_06863B: AND.w #$00F8
#_06863E: ASL A
#_06863F: ADC.w #SpriteModule_Drown_oam_groups
#_068642: STA.b $08

#_068644: SEP #$20

#_068646: LDA.b #$02
#_068648: JSL SpriteDraw_Tabulated

#_06864C: RTS

;===================================================================================================

SpriteModule_Initialize:
#_06864D: JSL SpritePrep_LoadProperties

#_068651: INC.w $0DD0,X

#_068654: LDA.w $0E20,X
#_068657: JSL JumpTableLocal
#_06865B: dw SpritePrep_Raven                         ; 0x00 - RAVEN
#_06865D: dw SpritePrep_Vulture                       ; 0x01 - VULTURE
#_06865F: dw SpritePrep_DoNothingA                    ; 0x02 - STALFOS HEAD
#_068661: dw $0000                                    ; 0x03 - NULL
#_068663: dw SpritePrep_Switch                        ; 0x04 - CORRECT PULL SWITCH
#_068665: dw SpritePrep_DoNothingA                    ; 0x05 - UNUSED CORRECT PULL SWIT
#_068667: dw SpritePrep_Switch                        ; 0x06 - WRONG PULL SWITCH
#_068669: dw SpritePrep_DoNothingB                    ; 0x07 - UNUSED WRONG PULL SWITCH
#_06866B: dw SpritePrep_Octorok                       ; 0x08 - OCTOROK
#_06866D: dw SpritePrep_Moldorm_bounce                ; 0x09 - MOLDORM
#_06866F: dw SpritePrep_Octorok                       ; 0x0A - OCTOROK 4WAY
#_068671: dw SpritePrep_DoNothingA                    ; 0x0B - CUCCO
#_068673: dw SpritePrep_DoNothingA                    ; 0x0C - OCTOROK STONE
#_068675: dw SpritePrep_DoNothingA                    ; 0x0D - BUZZBLOB
#_068677: dw SpritePrep_DoNothingA                    ; 0x0E - SNAPDRAGON
#_068679: dw SpritePrep_Octoballoon                   ; 0x0F - OCTOBALLOON
#_06867B: dw SpritePrep_DoNothingA                    ; 0x10 - OCTOBALLOON BABY
#_06867D: dw SpritePrep_DoNothingA                    ; 0x11 - HINOX
#_06867F: dw SpritePrep_DoNothingA                    ; 0x12 - MOBLIN
#_068681: dw SpritePrep_MiniHelmasaur                 ; 0x13 - MINI HELMASAUR
#_068683: dw SpritePrep_ThievesTownGrate              ; 0x14 - THIEVES TOWN GRATE
#_068685: dw SpritePrep_Antifairy                     ; 0x15 - ANTIFAIRY
#_068687: dw SpritePrep_Sage                          ; 0x16 - SAHASRAHLA / AGINAH
#_068689: dw SpritePrep_DoNothingA                    ; 0x17 - HOARDER
#_06868B: dw SpritePrep_MiniMoldorm_bounce            ; 0x18 - MINI MOLDORM
#_06868D: dw SpritePrep_Poe                           ; 0x19 - POE
#_06868F: dw SpritePrep_Smithy                        ; 0x1A - SMITHY
#_068691: dw SpritePrep_DoNothingA                    ; 0x1B - ARROW
#_068693: dw SpritePrep_Statue                        ; 0x1C - STATUE
#_068695: dw SpritePrep_IgnoreProjectiles             ; 0x1D - FLUTEQUEST
#_068697: dw SpritePrep_CrystalSwitch                 ; 0x1E - CRYSTAL SWITCH
#_068699: dw SpritePrep_SickKid                       ; 0x1F - SICK KID
#_06869B: dw SpritePrep_DoNothingA                    ; 0x20 - SLUGGULA
#_06869D: dw SpritePrep_WaterLever                    ; 0x21 - WATER SWITCH
#_06869F: dw SpritePrep_DoNothingA                    ; 0x22 - ROPA
#_0686A1: dw SpritePrep_Bari                          ; 0x23 - RED BARI
#_0686A3: dw SpritePrep_Bari                          ; 0x24 - BLUE BARI
#_0686A5: dw SpritePrep_TalkingTree                   ; 0x25 - TALKING TREE
#_0686A7: dw SpritePrep_HardhatBeetle                 ; 0x26 - HARDHAT BEETLE
#_0686A9: dw SpritePrep_DoNothingA                    ; 0x27 - DEADROCK
#_0686AB: dw SpritePrep_Storyteller                   ; 0x28 - DARK WORLD HINT NPC
#_0686AD: dw SpritePrep_Adults                        ; 0x29 - ADULT
#_0686AF: dw SpritePrep_IgnoreProjectiles             ; 0x2A - SWEEPING LADY
#_0686B1: dw SpritePrep_Hobo                          ; 0x2B - HOBO
#_0686B3: dw SpritePrep_Lumberjacks                   ; 0x2C - LUMBERJACKS
#_0686B5: dw SpritePrep_IgnoreProjectiles             ; 0x2D - NECKLESS MAN
#_0686B7: dw SpritePrep_FluteKid                      ; 0x2E - FLUTE KID
#_0686B9: dw SpritePrep_IgnoreProjectiles             ; 0x2F - RACE GAME LADY
#_0686BB: dw SpritePrep_IgnoreProjectiles             ; 0x30 - RACE GAME GUY
#_0686BD: dw SpritePrep_FortuneTeller                 ; 0x31 - FORTUNE TELLER
#_0686BF: dw SpritePrep_IgnoreProjectiles             ; 0x32 - ARGUE BROS
#_0686C1: dw SpritePrep_RupeePull                     ; 0x33 - RUPEE PULL
#_0686C3: dw SpritePrep_Snitch_bounce_2               ; 0x34 - YOUNG SNITCH
#_0686C5: dw SpritePrep_Snitch_bounce_3               ; 0x35 - INNKEEPER
#_0686C7: dw SpritePrep_IgnoreProjectiles             ; 0x36 - WITCH
#_0686C9: dw SpritePrep_IgnoreProjectiles             ; 0x37 - WATERFALL
#_0686CB: dw SpritePrep_DoNothingA                    ; 0x38 - EYE STATUE
#_0686CD: dw SpritePrep_Locksmith                     ; 0x39 - LOCKSMITH
#_0686CF: dw SpritePrep_MagicBat                      ; 0x3A - MAGIC BAT
#_0686D1: dw SpritePrep_BonkItem                      ; 0x3B - BONK ITEM
#_0686D3: dw SpritePrep_IgnoreProjectiles             ; 0x3C - KID IN KAK
#_0686D5: dw SpritePrep_Snitch_bounce_1               ; 0x3D - OLD SNITCH
#_0686D7: dw SpritePrep_DoNothingA                    ; 0x3E - HOARDER
#_0686D9: dw SpritePrep_DoNothingA                    ; 0x3F - TUTORIAL GUARD
#_0686DB: dw SpritePrep_AgahnimsBarrier               ; 0x40 - LIGHTNING GATE
#_0686DD: dw SpritePrep_StandardGuard                 ; 0x41 - BLUE GUARD
#_0686DF: dw SpritePrep_StandardGuard                 ; 0x42 - GREEN GUARD
#_0686E1: dw SpritePrep_StandardGuard                 ; 0x43 - RED SPEAR GUARD
#_0686E3: dw SpritePrep_CoolerGuard                   ; 0x44 - BLUESAIN BOLT
#_0686E5: dw SpritePrep_CoolerGuard                   ; 0x45 - USAIN BOLT
#_0686E7: dw SpritePrep_CoolerGuard                   ; 0x46 - BLUE ARCHER
#_0686E9: dw SpritePrep_CoolerGuard                   ; 0x47 - GREEN BUSH GUARD
#_0686EB: dw SpritePrep_CoolerGuard                   ; 0x48 - RED JAVELIN GUARD
#_0686ED: dw SpritePrep_CoolerGuard                   ; 0x49 - RED BUSH GUARD
#_0686EF: dw SpritePrep_CoolerGuard                   ; 0x4A - BOMB GUARD
#_0686F1: dw SpritePrep_WeakGuard                     ; 0x4B - GREEN KNIFE GUARD
#_0686F3: dw SpritePrep_Geldman                       ; 0x4C - GELDMAN
#_0686F5: dw SpritePrep_CacheOriginalCoordinates      ; 0x4D - TOPPO
#_0686F7: dw SpritePrep_Popo                          ; 0x4E - POPO
#_0686F9: dw SpritePrep_Popo2                         ; 0x4F - POPO
#_0686FB: dw SpritePrep_DoNothingA                    ; 0x50 - CANNONBALL
#_0686FD: dw SpritePrep_DoNothingD                    ; 0x51 - ARMOS STATUE
#_0686FF: dw SpritePrep_KingZora                      ; 0x52 - KING ZORA
#_068701: dw SpritePrep_ArmosKnight                   ; 0x53 - ARMOS KNIGHT
#_068703: dw SpritePrep_Lanmolas_bounce               ; 0x54 - LANMOLAS
#_068705: dw SpritePrep_SwimmingZora                  ; 0x55 - ZORA / FIREBALL
#_068707: dw SpritePrep_WalkingZora                   ; 0x56 - ZORA
#_068709: dw SpritePrep_DesertStatue                  ; 0x57 - DESERT STATUE
#_06870B: dw SpritePrep_DoNothingA                    ; 0x58 - CRAB
#_06870D: dw SpritePrep_LostWoodsBird                 ; 0x59 - LOST WOODS BIRD
#_06870F: dw SpritePrep_LostWoodsSquirrel             ; 0x5A - LOST WOODS SQUIRREL
#_068711: dw SpritePrep_Spark                         ; 0x5B - SPARK
#_068713: dw SpritePrep_Spark                         ; 0x5C - SPARK
#_068715: dw SpritePrep_Roller_VerticalDownFirst      ; 0x5D - ROLLER VERTICAL DOWN FIRST
#_068717: dw SpritePrep_Roller_VerticalUpFirst        ; 0x5E - ROLLER VERTICAL UP FIRST
#_068719: dw SpritePrep_Roller_HorizontalRightFirst   ; 0x5F - ROLLER HORIZONTAL RIGHT FIRST
#_06871B: dw SpritePrep_Roller_HorizontalLeftFirst    ; 0x60 - ROLLER HORIZONTAL LEFT FIRST
#_06871D: dw SpritePrep_DoNothingA                    ; 0x61 - BEAMOS
#_06871F: dw SpritePrep_MasterSword                   ; 0x62 - MASTERSWORD
#_068721: dw SpritePrep_DebirandoPit                  ; 0x63 - DEBIRANDO PIT
#_068723: dw SpritePrep_Debirando                     ; 0x64 - DEBIRANDO
#_068725: dw SpritePrep_ArrowGame_bounce              ; 0x65 - ARCHERY GUY
#_068727: dw SpritePrep_WallCannon                    ; 0x66 - WALL CANNON VERTICAL LEFT
#_068729: dw SpritePrep_WallCannon                    ; 0x67 - WALL CANNON VERTICAL RIGHT
#_06872B: dw SpritePrep_WallCannon                    ; 0x68 - WALL CANNON HORIZONTAL TOP
#_06872D: dw SpritePrep_WallCannon                    ; 0x69 - WALL CANNON HORIZONTAL BOTTOM
#_06872F: dw SpritePrep_DoNothingA                    ; 0x6A - BALL N CHAIN
#_068731: dw SpritePrep_DoNothingA                    ; 0x6B - CANNONBALL / CANNON TROOPER
#_068733: dw SpritePrep_DoNothingA                    ; 0x6C - MIRROR PORTAL
#_068735: dw SpritePrep_Rat                           ; 0x6D - RAT / CRICKET
#_068737: dw SpritePrep_Rope                          ; 0x6E - SNAKE
#_068739: dw SpritePrep_Keese                         ; 0x6F - KEESE
#_06873B: dw SpritePrep_DoNothingG                    ; 0x70 - KING HELMASAUR FIREBALL
#_06873D: dw SpritePrep_Leever                        ; 0x71 - LEEVER
#_06873F: dw SpritePrep_IgnoreProjectiles             ; 0x72 - FAIRY POND TRIGGER
#_068741: dw SpritePrep_UncleAndPriest_bounce         ; 0x73 - UNCLE / PRIEST / MANTLE
#_068743: dw SpritePrep_RunningBoy_bounce             ; 0x74 - RUNNING MAN
#_068745: dw SpritePrep_IgnoreProjectiles             ; 0x75 - BOTTLE MERCHANT
#_068747: dw SpritePrep_Zelda_bounce                  ; 0x76 - ZELDA
#_068749: dw SpritePrep_Antifairy                     ; 0x77 - ANTIFAIRY
#_06874B: dw SpritePrep_MrsSahasrahla                 ; 0x78 - SAHASRAHLAS WIFE
#_06874D: dw SpritePrep_OverworldBonkItem             ; 0x79 - BEE
#_06874F: dw SpritePrep_Agahnim                       ; 0x7A - AGAHNIM
#_068751: dw SpritePrep_DoNothingG                    ; 0x7B - AGAHNIMS BALLS
#_068753: dw SpritePrep_GreenStalfos                  ; 0x7C - GREEN STALFOS
#_068755: dw SpritePrep_BigSpike                      ; 0x7D - BIG SPIKE
#_068757: dw SpritePrep_FireBar                       ; 0x7E - FIREBAR CLOCKWISE
#_068759: dw SpritePrep_FireBar                       ; 0x7F - FIREBAR COUNTERCLOCKWISE
#_06875B: dw SpritePrep_DoNothingG                    ; 0x80 - FIRESNAKE
#_06875D: dw SpritePrep_DoNothingG                    ; 0x81 - HOVER
#_06875F: dw SpritePrep_AntifairyCircle_bounce        ; 0x82 - ANTIFAIRY CIRCLE
#_068761: dw SpritePrep_Eyegore_bounce                ; 0x83 - GREEN EYEGORE / GREEN MIMIC
#_068763: dw SpritePrep_Eyegore_bounce                ; 0x84 - RED EYEGORE / RED MIMIC
#_068765: dw SpritePrep_DoNothingG                    ; 0x85 - YELLOW STALFOS
#_068767: dw SpritePrep_Kodongo                       ; 0x86 - KODONGO
#_068769: dw SpritePrep_DoNothingG                    ; 0x87 - KONDONGO FIRE
#_06876B: dw SpritePrep_Mothula                       ; 0x88 - MOTHULA
#_06876D: dw SpritePrep_DoNothingG                    ; 0x89 - MOTHULA BEAM
#_06876F: dw SpritePrep_Spike                         ; 0x8A - SPIKE BLOCK
#_068771: dw SpritePrep_DoNothingG                    ; 0x8B - GIBDO
#_068773: dw SpritePrep_Arrghus                       ; 0x8C - ARRGHUS
#_068775: dw SpritePrep_Arrghi                        ; 0x8D - ARRGHI
#_068777: dw SpritePrep_DoNothingG                    ; 0x8E - TERRORPIN
#_068779: dw SpritePrep_Blob                          ; 0x8F - BLOB
#_06877B: dw SpritePrep_DoNothingG                    ; 0x90 - WALLMASTER
#_06877D: dw SpritePrep_DoNothingG                    ; 0x91 - STALFOS KNIGHT
#_06877F: dw SpritePrep_HelmasaurKing                 ; 0x92 - KING HELMASAUR
#_068781: dw SpritePrep_Bumper                        ; 0x93 - BUMPER
#_068783: dw SpritePrep_DoNothingA                    ; 0x94 - PIROGUSU
#_068785: dw SpritePrep_LaserEye_bounce               ; 0x95 - LASER EYE LEFT
#_068787: dw SpritePrep_LaserEye_bounce               ; 0x96 - LASER EYE RIGHT
#_068789: dw SpritePrep_LaserEye_bounce               ; 0x97 - LASER EYE TOP
#_06878B: dw SpritePrep_LaserEye_bounce               ; 0x98 - LASER EYE BOTTOM
#_06878D: dw SpritePrep_DoNothingA                    ; 0x99 - PENGATOR
#_06878F: dw SpritePrep_CacheOriginalCoordinates      ; 0x9A - KYAMERON
#_068791: dw SpritePrep_DoNothingA                    ; 0x9B - WIZZROBE
#_068793: dw SpritePrep_Zoro                          ; 0x9C - ZORO
#_068795: dw SpritePrep_Babasu                        ; 0x9D - BABASU
#_068797: dw SpritePrep_HauntedGroveOstritch          ; 0x9E - HAUNTED GROVE OSTRITCH
#_068799: dw SpritePrep_HauntedGroveAnimal            ; 0x9F - HAUNTED GROVE RABBIT
#_06879B: dw SpritePrep_HauntedGroveAnimal            ; 0xA0 - HAUNTED GROVE BIRD
#_06879D: dw SpritePrep_MoveDown_8px                  ; 0xA1 - FREEZOR
#_06879F: dw SpritePrep_Kholdstare                    ; 0xA2 - KHOLDSTARE
#_0687A1: dw SpritePrep_KholdstareShell               ; 0xA3 - KHOLDSTARE SHELL
#_0687A3: dw SpritePrep_FallingIce                    ; 0xA4 - FALLING ICE
#_0687A5: dw SpritePrep_DoNothingE                    ; 0xA5 - BLUE ZAZAK
#_0687A7: dw SpritePrep_DoNothingE                    ; 0xA6 - RED ZAZAK
#_0687A9: dw SpritePrep_Stalfos                       ; 0xA7 - STALFOS
#_0687AB: dw SpritePrep_Zirro                         ; 0xA8 - GREEN ZIRRO
#_0687AD: dw SpritePrep_Zirro                         ; 0xA9 - BLUE ZIRRO
#_0687AF: dw SpritePrep_DoNothingC                    ; 0xAA - PIKIT
#_0687B1: dw SpritePrep_DoNothingH                    ; 0xAB - CRYSTAL MAIDEN
#_0687B3: dw SpritePrep_OverworldBonkItem             ; 0xAC - APPLE
#_0687B5: dw SpritePrep_OldMan_bounce                 ; 0xAD - OLD MAN
#_0687B7: dw SpritePrep_DoNothingA                    ; 0xAE - PIPE DOWN
#_0687B9: dw SpritePrep_DoNothingA                    ; 0xAF - PIPE UP
#_0687BB: dw SpritePrep_DoNothingA                    ; 0xB0 - PIPE RIGHT
#_0687BD: dw SpritePrep_DoNothingA                    ; 0xB1 - PIPE LEFT
#_0687BF: dw SpritePrep_NiceBee                       ; 0xB2 - GOOD BEE
#_0687C1: dw SpritePrep_PedestalPlaque                ; 0xB3 - PEDESTAL PLAQUE
#_0687C3: dw SpritePrep_PurpleChest                   ; 0xB4 - PURPLE CHEST
#_0687C5: dw SpritePrep_BombShoppe                    ; 0xB5 - BOMB SHOP GUY
#_0687C7: dw SpritePrep_Kiki                          ; 0xB6 - KIKI
#_0687C9: dw SpritePrep_BlindMaiden                   ; 0xB7 - BLIND MAIDEN
#_0687CB: dw SpritePrep_DoNothingA                    ; 0xB8 - DIALOGUE TESTER
#_0687CD: dw SpritePrep_BullyAndVictim                ; 0xB9 - BULLY / PINK BALL
#_0687CF: dw SpritePrep_Whirlpool                     ; 0xBA - WHIRLPOOL
#_0687D1: dw SpritePrep_Shopkeeper                    ; 0xBB - SHOPKEEPER / CHEST GAME GUY
#_0687D3: dw SpritePrep_IgnoreProjectiles             ; 0xBC - DRUNKARD
#_0687D5: dw SpritePrep_Vitreous                      ; 0xBD - VITREOUS
#_0687D7: dw SpritePrep_MiniVitreous                  ; 0xBE - VITREOUS SMALL EYE
#_0687D9: dw SpritePrep_DoNothingA                    ; 0xBF - LIGHTNING
#_0687DB: dw SpritePrep_Catfish                       ; 0xC0 - CATFISH
#_0687DD: dw SpritePrep_CutsceneAgahnim               ; 0xC1 - CUTSCENE AGAHNIM
#_0687DF: dw SpritePrep_DoNothingA                    ; 0xC2 - BOULDER
#_0687E1: dw SpritePrep_Gibo                          ; 0xC3 - GIBO
#_0687E3: dw SpritePrep_DoNothingA                    ; 0xC4 - THIEF
#_0687E5: dw SpritePrep_IgnoreProjectiles             ; 0xC5 - MEDUSA
#_0687E7: dw SpritePrep_IgnoreProjectiles             ; 0xC6 - 4WAY SHOOTER
#_0687E9: dw SpritePrep_Pokey                         ; 0xC7 - POKEY
#_0687EB: dw SpritePrep_BigFairy                      ; 0xC8 - BIG FAIRY
#_0687ED: dw SpritePrep_Tektite                       ; 0xC9 - TEKTITE / FIREBAT
#_0687EF: dw SpritePrep_Chainchomp_bounce             ; 0xCA - CHAIN CHOMP
#_0687F1: dw SpritePrep_Trinexx                       ; 0xCB - TRINEXX ROCK HEAD
#_0687F3: dw SpritePrep_Trinexx                       ; 0xCC - TRINEXX FIRE HEAD
#_0687F5: dw SpritePrep_Trinexx                       ; 0xCD - TRINEXX ICE HEAD
#_0687F7: dw SpritePrep_Blind                         ; 0xCE - BLIND
#_0687F9: dw SpritePrep_Swamola                       ; 0xCF - SWAMOLA
#_0687FB: dw SpritePrep_DoNothingA                    ; 0xD0 - LYNEL
#_0687FD: dw SpritePrep_DoNothingA                    ; 0xD1 - BUNNYBEAM / SMOKE
#_0687FF: dw SpritePrep_IgnoreProjectiles             ; 0xD2 - FLOPPING FISH
#_068801: dw SpritePrep_RockStal                      ; 0xD3 - STAL
#_068803: dw SpritePrep_IgnoreProjectiles             ; 0xD4 - LANDMINE
#_068805: dw SpritePrep_DiggingGameGuy_bounce         ; 0xD5 - DIG GAME GUY
#_068807: dw SpritePrep_Ganon                         ; 0xD6 - GANON
#_068809: dw SpritePrep_Ganon                         ; 0xD7 - GANON
#_06880B: dw SpritePrep_Absorbable                    ; 0xD8 - HEART
#_06880D: dw SpritePrep_Absorbable                    ; 0xD9 - GREEN RUPEE
#_06880F: dw SpritePrep_Absorbable                    ; 0xDA - BLUE RUPEE
#_068811: dw SpritePrep_Absorbable                    ; 0xDB - RED RUPEE
#_068813: dw SpritePrep_Absorbable                    ; 0xDC - BOMB REFILL 1
#_068815: dw SpritePrep_Absorbable                    ; 0xDD - BOMB REFILL 4
#_068817: dw SpritePrep_Absorbable                    ; 0xDE - BOMB REFILL 8
#_068819: dw SpritePrep_Absorbable                    ; 0xDF - SMALL MAGIC DECANTER
#_06881B: dw SpritePrep_Absorbable                    ; 0xE0 - LARGE MAGIC DECANTER
#_06881D: dw SpritePrep_Absorbable                    ; 0xE1 - ARROW REFILL 5
#_06881F: dw SpritePrep_Absorbable                    ; 0xE2 - ARROW REFILL 10
#_068821: dw SpritePrep_Fairy                         ; 0xE3 - FAIRY
#_068823: dw SpritePrep_SmallKey                      ; 0xE4 - SMALL KEY
#_068825: dw SpritePrep_BigKey                        ; 0xE5 - BIG KEY
#_068827: dw SpritePrep_DoNothingF                    ; 0xE6 - STOLEN SHIELD
#_068829: dw SpritePrep_Mushroom_bounce               ; 0xE7 - MUSHROOM
#_06882B: dw SpritePrep_FakeMasterSword_bounce        ; 0xE8 - FAKE MASTER SWORD
#_06882D: dw SpritePrep_MagicShopAssistant_bounce     ; 0xE9 - MAGIC SHOP ASSISTANT
#_06882F: dw SpritePrep_HeartContainer_bounce         ; 0xEA - HEART CONTAINER
#_068831: dw SpritePrep_HeartPiece                    ; 0xEB - HEART PIECE
#_068833: dw SpritePrep_DoNothingI                    ; 0xEC - THROWN ITEM
#_068835: dw SpritePrep_DoNothingA                    ; 0xED - SOMARIA PLATFORM
#_068837: dw SpritePrep_Mantle                        ; 0xEE - CASTLE MANTLE
#_068839: dw SpritePrep_DoNothingA                    ; 0xEF - UNUSED SOMARIA PLATFORM
#_06883B: dw SpritePrep_DoNothingA                    ; 0xF0 - UNUSED SOMARIA PLATFORM
#_06883D: dw SpritePrep_DoNothingA                    ; 0xF1 - UNUSED SOMARIA PLATFORM
#_06883F: dw SpritePrep_MedallionTablet_bounce        ; 0xF2 - MEDALLION TABLET

;===================================================================================================

SpritePrep_Mantle:
#_068841: LDA.w $0D00,X
#_068844: CLC
#_068845: ADC.b #$03
#_068847: STA.w $0D00,X

;===================================================================================================

SpritePrep_MoveRight_8px:
#_06884A: LDA.w $0D10,X
#_06884D: CLC
#_06884E: ADC.b #$08
#_068850: STA.w $0D10,X

#_068853: RTS

;===================================================================================================

SpritePrep_MedallionTablet_bounce:
#_068854: JSL SpritePrep_MedallionTablet

#_068858: RTS

;===================================================================================================

SpritePrep_Switch:
#_068859: LDA.w $048E

#_06885C: CMP.b #$CE ; ROOM 00CE
#_06885E: BEQ .tongue_room

#_068860: CMP.b #$04 ; ROOM 0004
#_068862: BEQ .tongue_room

#_068864: CMP.b #$3F ; ROOM 003F
#_068866: BNE SpritePrep_DoNothingB

.tongue_room
#_068868: LDA.b #$0D
#_06886A: STA.w $0F50,X

;===================================================================================================

SpritePrep_DoNothingB:
#_06886D: RTS

;===================================================================================================

SpritePrep_Snitch_bounce_1:
#_06886E: JSL SpritePrep_Snitch

#_068872: RTS

;===================================================================================================

SpritePrep_DoNothingA:
#_068873: RTS

;===================================================================================================

pool SpritePrep_Rat

.damage
#_068874: db $00, $05

.hp
#_068876: db   2,   8

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Rat:
#_068878: LDY.w $0FFF

#_06887B: LDA.w .damage,Y
#_06887E: STA.w $0CD2,X

#_068881: LDA.w .hp,Y
#_068884: STA.w $0E50,X

#_068887: RTS

;===================================================================================================

pool SpritePrep_Keese

.damage
#_068888: db $80, $85

.hp
#_06888A: db   1,   4

.prizepack
#_06888C: db $00, $07

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Keese:
#_06888E: LDY.w $0FFF

#_068891: LDA.w .damage,Y
#_068894: STA.w $0CD2,X

#_068897: LDA.w .hp,Y
#_06889A: STA.w $0E50,X

#_06889D: LDA.w .prizepack,Y
#_0688A0: STA.w $0BE0,X

#_0688A3: RTS

;===================================================================================================

pool SpritePrep_Rope

.damage
#_0688A4: db $01, $05

.hp
#_0688A6: db   4,   8

.prizepack
#_0688A8: db $01, $07

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Rope:
#_0688AA: LDY.w $0FFF

#_0688AD: LDA.w .damage,Y
#_0688B0: STA.w $0CD2,X

#_0688B3: LDA.w .hp,Y
#_0688B6: STA.w $0E50,X

#_0688B9: LDA.w .prizepack,Y
#_0688BC: STA.w $0BE0,X

#_0688BF: RTS

;===================================================================================================

SpritePrep_Swamola:
#_0688C0: JSL SpritePrep_Swamola_InitializeSegments

#_0688C4: JMP.w SpritePrep_CacheOriginalCoordinates

;===================================================================================================

SpritePrep_Blind:
#_0688C7: JSR SpritePrep_Boss
#_0688CA: JSL SpritePrep_Blind_PrepareBattle

#_0688CE: RTS

;===================================================================================================

SpritePrep_Ganon:
#_0688CF: JSR SpritePrep_Boss
#_0688D2: JSL SpritePrep_Ganon_PrepareBattle

#_0688D6: RTS

;===================================================================================================

pool SpritePrep_Pokey

.speed_x
#_0688D7: db  16, -16,  16, -16

.speed_y
#_0688DB: db  16,  16, -16, -16

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Pokey:
#_0688DF: LDA.b #$03
#_0688E1: STA.w $0D90,X

#_0688E4: LDA.b #$08
#_0688E6: STA.w $0DA0,X

#_0688E9: JSL GetRandomNumber
#_0688ED: AND.b #$03
#_0688EF: TAY

#_0688F0: LDA.w .speed_x,Y
#_0688F3: STA.w $0D50,X

#_0688F6: LDA.w .speed_y,Y
#_0688F9: STA.w $0D40,X

#_0688FC: RTS

;===================================================================================================

SpritePrep_MiniVitreous:
#_0688FD: JSR SpritePrep_Boss

#_068900: RTS

;===================================================================================================

SpritePrep_Gibo:
#_068901: LDA.b #$10
#_068903: STA.w $0F70,X

#_068906: LDA.b #$08
#_068908: STA.w $0ED0,X

#_06890B: RTS

;===================================================================================================

pool SpritePrep_Octoballoon

.timer
#_06890C: db 192,  208,  224,  240

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Octoballoon:
#_068910: TXA
#_068911: AND.b #$03
#_068913: TAY

#_068914: LDA.w .timer,Y
#_068917: STA.w $0DF0,X

#_06891A: RTS

;===================================================================================================

SpritePrep_AgahnimsBarrier:
#_06891B: PHX

#_06891C: LDX.b $8A

#_06891E: LDA.l $7EF280,X

#_068922: PLX

#_068923: AND.b #$40
#_068925: BEQ SpritePrep_Catfish

#_068927: LDA.b #$04
#_068929: STA.w $0DC0,X

;===================================================================================================

SpritePrep_Catfish:
#_06892C: JSR SpritePrep_MoveDown_8px_Right8px

#_06892F: LDA.w $0D00,X
#_068932: SEC
#_068933: SBC.b #$0C
#_068935: STA.w $0D00,X

#_068938: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_CutsceneAgahnim:
#_06893B: LDA.w $0403
#_06893E: AND.b #$40
#_068940: BEQ .not_seen_cutscene

#_068942: STZ.w $0DD0,X

#_068945: RTS

.not_seen_cutscene
#_068946: JSL CutsceneAgahnim_SpawnZeldaOnAltar

#_06894A: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Vitreous:
#_06894D: JSR SpritePrep_Boss
#_068950: JSR SpritePrep_MoveDown_8px_Right8px

#_068953: LDA.w $0D00,X
#_068956: SEC
#_068957: SBC.b #$10
#_068959: STA.w $0D00,X

#_06895C: JSL Vitreous_SpawnMinions

#_068960: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

pool SpritePrep_Raven

.damage
#_068963: db $81, $88

.hp
#_068965: db $04, $08

.prize_pack
#_068967: db $06, $02

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Raven:
#_068969: LDY.w $0FFF

#_06896C: LDA.w .damage,Y
#_06896F: STA.w $0CD2,X

#_068972: LDA.w .hp,Y
#_068975: STA.w $0E50,X

#_068978: LDA.w .prize_pack,Y
#_06897B: STA.w $0BE0,X

;===================================================================================================

SpritePrep_Vulture:
#_06897E: LDA.b #$00
#_068980: STA.w $0F70,X

#_068983: LDA.w $0D10,X
#_068986: AND.b #$10
#_068988: LSR A
#_068989: LSR A
#_06898A: LSR A
#_06898B: LSR A
#_06898C: STA.w $0D90,X

#_06898F: BRA SpritePrep_SetAuxToFE

;===================================================================================================

SpritePrep_Poe:
#_068991: LDA.b #$0C
#_068993: STA.w $0F70,X

;===================================================================================================

SpritePrep_SetAuxToFE:
#_068996: LDA.b #$FE
#_068998: STA.w $0E30,X

;===================================================================================================

SpritePrep_DoNothingC:
#_06899B: RTS

;===================================================================================================

SpritePrep_BlindMaiden:
#_06899C: LDA.l $7EF159
#_0689A0: AND.b #$08
#_0689A2: BNE .kill_the_girl

#_0689A4: INC.w $0BA0,X

#_0689A7: LDA.l $7EF3CC
#_0689AB: CMP.b #$06
#_0689AD: BEQ .kill_the_girl

#_0689AF: LDA.b #$06 ; FOLLOWER 06
#_0689B1: STA.l $7EF3CC

#_0689B5: LDA.b #$00
#_0689B7: STA.l $7EF3D3

#_0689BB: PHX

#_0689BC: STZ.w $02F9

#_0689BF: JSL LoadFollowerGraphics
#_0689C3: JSL Follower_Initialize

#_0689C7: PLX

#_0689C8: LDA.b #$00
#_0689CA: STA.l $7EF3CC

#_0689CE: RTS

.kill_the_girl
#_0689CF: STZ.w $0DD0,X

#_0689D2: RTS

;===================================================================================================

SpritePrep_MiniMoldorm_bounce:
#_0689D3: JSL SpritePrep_MiniMoldorm

#_0689D7: RTS

;===================================================================================================

SpritePrep_Zirro:
#_0689D8: LDA.b #$10
#_0689DA: STA.w $0F70,X

#_0689DD: BRA SpritePrep_SetAuxToFE

;===================================================================================================

SpritePrep_BombShoppe:
#_0689DF: INC.w $0BA0,X

#_0689E2: LDA.b #$B5 ; SPRITE B5
#_0689E4: JSL Sprite_SpawnDynamically
#_0689E8: BMI .no_space_to_spawn_OHNO

#_0689EA: LDA.b $00
#_0689EC: SEC
#_0689ED: SBC.b #$18
#_0689EF: STA.w $0D10,Y

#_0689F2: LDA.b $01
#_0689F4: SBC.b #$00
#_0689F6: STA.w $0D30,Y

#_0689F9: LDA.b $02
#_0689FB: SEC
#_0689FC: SBC.b #$18
#_0689FE: STA.w $0D00,Y

#_068A01: LDA.b $03
#_068A03: SBC.b #$00
#_068A05: STA.w $0D20,Y

#_068A08: LDA.b #$01
#_068A0A: STA.w $0E80,Y
#_068A0D: STA.w $0BA0,Y

;---------------------------------------------------------------------------------------------------

.no_space_to_spawn_OHNO
#_068A10: LDA.l $7EF37A
#_068A14: AND.b #$05
#_068A16: CMP.b #$05
#_068A18: BNE .you_dont_deserve_the_big_bomb

#_068A1A: LDA.l $7EF3C9
#_068A1E: AND.b #$20
#_068A20: BEQ .you_dont_deserve_the_big_bomb

#_068A22: LDA.b #$B5 ; SPRITE B5
#_068A24: JSL Sprite_SpawnDynamically
#_068A28: BMI .you_dont_deserve_the_big_bomb

#_068A2A: LDA.b $00
#_068A2C: SEC
#_068A2D: SBC.b #$38
#_068A2F: STA.w $0D10,Y

#_068A32: LDA.b $01
#_068A34: SBC.b #$00
#_068A36: STA.w $0D30,Y

#_068A39: LDA.b $02
#_068A3B: SEC
#_068A3C: SBC.b #$18
#_068A3E: STA.w $0D00,Y

#_068A41: LDA.b $03
#_068A43: SBC.b #$00
#_068A45: STA.w $0D20,Y

#_068A48: LDA.b #$02
#_068A4A: STA.w $0E80,Y
#_068A4D: STA.w $0BA0,Y

.you_dont_deserve_the_big_bomb
#_068A50: RTS

;===================================================================================================

SpritePrep_BullyAndVictim:
#_068A51: JSL SpawnBully

#_068A55: INC.w $0BA0,X

#_068A58: RTS

;===================================================================================================

SpritePrep_PurpleChest:
#_068A59: LDA.l $7EF3CC
#_068A5D: CMP.b #$0C ; FOLLOWER 0C
#_068A5F: BEQ No_chest_for_you

#_068A61: LDA.l $7EF3C9
#_068A65: AND.b #$10
#_068A67: BNE No_chest_for_you

#_068A69: LDA.l $7EF3C9
#_068A6D: AND.b #$20
#_068A6F: BEQ No_chest_for_you

#_068A71: INC.w $0BA0,X

#_068A74: RTS

;===================================================================================================

No_chest_for_you:
No_frog_for_you:
#_068A75: STZ.w $0DD0,X

#_068A78: RTS

;===================================================================================================

SpritePrep_Smithy:
#_068A79: INC.w $0BA0,X

#_068A7C: LDA.l $7EF3CA
#_068A80: AND.b #$40
#_068A82: BEQ .in_light_world

#_068A84: LDA.l $7EF3C9
#_068A88: AND.b #$20
#_068A8A: BNE No_frog_for_you

#_068A8C: LDA.l $7EF3CC
#_068A90: CMP.b #$00
#_068A92: BNE No_frog_for_you

#_068A94: LDA.b #$02
#_068A96: STA.w $0E80,X

#_068A99: RTS

;---------------------------------------------------------------------------------------------------

.in_light_world
#_068A9A: JSL Smithy_SpawnDumbBarrierSprite

#_068A9E: LDA.l $7EF3C9
#_068AA2: AND.b #$20
#_068AA4: BNE .rescued

#_068AA6: LDA.w $0D10,X
#_068AA9: CLC
#_068AAA: ADC.b #$02
#_068AAC: STA.w $0D10,X

#_068AAF: LDA.w $0D00,X
#_068AB2: SEC
#_068AB3: SBC.b #$03
#_068AB5: STA.w $0D00,X

#_068AB8: RTS

;---------------------------------------------------------------------------------------------------

.rescued
#_068AB9: LDA.w $0D10,X
#_068ABC: CLC
#_068ABD: ADC.b #$02
#_068ABF: STA.w $0D10,X

#_068AC2: LDA.w $0D00,X
#_068AC5: SEC
#_068AC6: SBC.b #$03
#_068AC8: STA.w $0D00,X

#_068ACB: JSR Smithy_SpawnDwarfPal

#_068ACE: PHX
#_068ACF: PHY

#_068AD0: TYX
#_068AD1: JSL Smithy_SpawnDumbBarrierSprite

#_068AD5: PLY
#_068AD6: PLX

#_068AD7: TYA
#_068AD8: STA.w $0E90,X

#_068ADB: TXA
#_068ADC: STA.w $0E90,Y

#_068ADF: LDA.l $7EF3C9
#_068AE3: AND.b #$80
#_068AE5: BEQ .exit

#_068AE7: LDA.b #$05
#_068AE9: STA.w $0D80,X
#_068AEC: STA.w $0D80,Y

.exit
#_068AEF: RTS

;===================================================================================================

SpritePrep_Babasu:
#_068AF0: JSR SpritePrep_MoveDown_8px

;===================================================================================================

SpritePrep_Zoro:
#_068AF3: LDA.w $0E20,X
#_068AF6: SEC
#_068AF7: SBC.b #$9C
#_068AF9: ASL A
#_068AFA: STA.w $0DE0,X

#_068AFD: DEC.w $0DC0,X

#_068B00: RTS

;===================================================================================================

UNREACHABLE_068B01:
#_068B01: db $F8, $08

;===================================================================================================

SpritePrep_LaserEye_bounce:
#_068B03: JSL SpritePrep_LaserEye

#_068B07: RTS

;===================================================================================================

SpritePrep_Popo:
#_068B08: LDA.b #$07
#_068B0A: BRA .set_movement_mask

;===================================================================================================

#SpritePrep_Popo2:
#_068B0C: LDA.b #$0F

;===================================================================================================

.set_movement_mask
#_068B0E: STA.w $0DA0,X

#_068B11: RTS

;===================================================================================================

SpritePrep_Statue:
#_068B12: LDA.w $0D00,X
#_068B15: CLC
#_068B16: ADC.b #$07
#_068B18: STA.w $0D00,X

#_068B1B: RTS

;===================================================================================================

SpritePrep_Bari:
#_068B1C: LDA.b #$06
#_068B1E: STA.w $0F70,X

#_068B21: LDA.w $048E
#_068B24: CMP.b #$CE ; ROOM 00CE
#_068B26: BNE .not_uninformed

#_068B28: DEC.w $0DB0,X

.not_uninformed
#_068B2B: JMP.w Bari_RandomlySetTimer2

;===================================================================================================

SpritePrep_GreenStalfos:
#_068B2E: LDA.b #$09
#_068B30: STA.w $0F70,X

#_068B33: RTS

;===================================================================================================

SpritePrep_WaterLever:
#_068B34: LDA.w $0D00,X
#_068B37: CLC
#_068B38: ADC.b #$05
#_068B3A: STA.w $0D00,X

#_068B3D: RTS

;===================================================================================================

SpritePrep_Debirando:
#_068B3E: LDA.b #$63 ; SPRITE 63
#_068B40: STA.w $0E20,X

#_068B43: JSL SpritePrep_LoadProperties
#_068B47: DEC.w $0ED0,X

;===================================================================================================

SpritePrep_DebirandoPit:
#_068B4A: INC.w $0ED0,X

#_068B4D: LDA.b #$00
#_068B4F: STA.w $0DF0,X

#_068B52: LDA.b #$06
#_068B54: STA.w $0DC0,X

#_068B57: JSR SpritePrep_IgnoreProjectiles

#_068B5A: LDA.b #$64 ; SPRITE 64
#_068B5C: JSL Sprite_SpawnDynamically
#_068B60: BMI .no_space

#_068B62: JSL Sprite_SetSpawnedCoordinates

#_068B66: LDA.b #$60
#_068B68: STA.w $0DF0,Y

#_068B6B: TYA
#_068B6C: STA.w $0EB0,X

#_068B6F: LDA.w $0ED0,X
#_068B72: STA.w $0ED0,Y

#_068B75: PHX

#_068B76: TAX

#_068B77: LDA.w .palette,X
#_068B7A: STA.w $0F50,Y

#_068B7D: PLX

.no_space
#_068B7E: RTS

;---------------------------------------------------------------------------------------------------

.palette
#_068B7F: db $06, $08

;===================================================================================================

SpritePrep_WeakGuard:
#_068B81: JSL GetRandomNumber
#_068B85: AND.b #$03
#_068B87: STA.w $0DE0,X
#_068B8A: STA.w $0EB0,X

#_068B8D: LDA.b #$10
#_068B8F: STA.w $0DF0,X

#_068B92: RTS

;===================================================================================================

SpritePrep_WallCannon:
#_068B93: LDA.w $0E20,X
#_068B96: SEC
#_068B97: SBC.b #$66 ; SPRITE 66 - base wall cannon ID
#_068B99: STA.w $0DE0,X

#_068B9C: AND.b #$02
#_068B9E: STA.w $0D90,X

#_068BA1: RTS

;===================================================================================================

SpritePrep_ArrowGame_bounce:
#_068BA2: JSL SpritePrep_ArrowGame

#_068BA6: RTS

;===================================================================================================

SpritePrep_IgnoreProjectiles:
#_068BA7: INC.w $0BA0,X

#_068BAA: RTS

;===================================================================================================

SpritePrep_HauntedGroveAnimal:
#_068BAB: JSR Sprite_IsRightOfLink

#_068BAE: TYA
#_068BAF: STA.w $0DE0,X

;===================================================================================================

SpritePrep_HauntedGroveOstritch:
#_068BB2: LDA.l $7EF34C
#_068BB6: CMP.b #$02
#_068BB8: BCC .has_no_flute

#_068BBA: STZ.w $0DD0,X

.has_no_flute
#_068BBD: BRA SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_DiggingGameGuy_bounce:
#_068BBF: JSL SpritePrep_DiggingGameGuy

#_068BC3: RTS

;===================================================================================================

SpritePrep_ThievesTownGrate:
#_068BC4: LDA.l $7EF2D8
#_068BC8: AND.b #$20
#_068BCA: BEQ SpritePrep_RupeePull

#_068BCC: STZ.w $0DD0,X

;===================================================================================================

SpritePrep_RupeePull:
#_068BCF: INC.w $0BA0,X

#_068BD2: LDA.w $0D10,X
#_068BD5: SEC
#_068BD6: SBC.b #$08
#_068BD8: STA.w $0D10,X

#_068BDB: LDA.w $0D30,X
#_068BDE: SBC.b #$00
#_068BE0: STA.w $0D30,X

#_068BE3: RTS

;===================================================================================================

pool SpritePrep_Shopkeeper

.rooms
#_068BE4: db $0F ; ROOM 010F - Darkworld Lumberjack / Outcasts shield shop
#_068BE5: db $10 ; ROOM 0110 - East of Outcasts
#_068BE6: db $00 ; ROOM 0100 - Lost Woods chest game
#_068BE7: db $06 ; ROOM 0106 - Village of Outcasts chest game
#_068BE8: db $18 ; ROOM 0118 - South of Kak 3 chest game
#_068BE9: db $12 ; ROOM 0112 - Common cave shop
#_068BEA: db $1E ; ROOM 011E - Swamplands thief cave
#_068BEB: db $FF ; ROOM 00FF - Paradox cave shop
#_068BEC: db $1F ; ROOM 011F - Kakariko shop
#_068BED: db $23 ; ROOM 0121 - Mini moldorm cave
#_068BEE: db $24 ; ROOM 0124 - Outside Desert thief
#_068BEF: db $25 ; ROOM 0125 - Ice rod cave thief
#_068BF0: db $27 ; ROOM 0127 - Hammer pegs cave

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper:
#_068BF1: INC.w $0BA0,X

#_068BF4: LDA.w $0E40,X
#_068BF7: ORA.b #$02
#_068BF9: STA.w $0E40,X

#_068BFC: LDA.w $0F50,X
#_068BFF: ORA.b #$0C
#_068C01: STA.w $0F50,X

#_068C04: LDA.w $0E60,X
#_068C07: ORA.b #$10
#_068C09: STA.w $0E60,X

#_068C0C: LDA.b $A0

#_068C0E: LDY.b #$00

.next_room
#_068C10: CMP.w .rooms,Y
#_068C13: BEQ .found_room

#_068C15: INY
#_068C16: BNE .next_room

;---------------------------------------------------------------------------------------------------

.found_room
#_068C18: TYA
#_068C19: JSL JumpTableLocal
#_068C1D: dw SpritePrep_Shopkeeper_DarkWorldStock
#_068C1F: dw SpritePrep_Shopkeeper_EastOfOutcasts
#_068C21: dw SpritePrep_LostWoodsChestGame
#_068C23: dw SpritePrep_ChestGameGuy
#_068C25: dw SpritePrep_KakChestGame
#_068C27: dw SpritePrep_Shopkeeper_StandardStock
#_068C29: dw SpritePrep_NiceThief_WithGift
#_068C2B: dw SpritePrep_Shopkeeper_StandardStock
#_068C2D: dw SpritePrep_Shopkeeper_StandardStock
#_068C2F: dw SpritePrep_NiceThief_WithGift
#_068C31: dw SpritePrep_NiceThief_Desert
#_068C33: dw SpritePrep_NiceThief_Ice
#_068C35: dw SpritePrep_NiceThief_WithGift

;===================================================================================================

SpritePrep_Shopkeeper_DarkWorldStock:
#_068C37: LDA.b #$00
#_068C39: LDY.b #$07 ; Red potion
#_068C3B: JSL ShopKeeper_SpawnShopItem

#_068C3F: LDY.b #$08 ; Fighter shield
#_068C41: BRA SpritePrep_Shopkeeper_SpawnItemAndBombs

;===================================================================================================

SpritePrep_Shopkeeper_EastOfOutcasts:
#_068C43: LDA.b #$00
#_068C45: LDY.b #$09 ; Fire shield
#_068C47: JSL ShopKeeper_SpawnShopItem

#_068C4B: LDA.b #$01
#_068C4D: LDY.b #$0D ; Bee
#_068C4F: JSL ShopKeeper_SpawnShopItem

#_068C53: LDA.b #$02
#_068C55: LDY.b #$0B ; Arrows
#_068C57: JSL ShopKeeper_SpawnShopItem
#_068C5B: RTS

;===================================================================================================

SpritePrep_LostWoodsChestGame:
#_068C5C: LDA.b #$04
#_068C5E: BRA SpritePrep_Shopkeeper_SetType

;===================================================================================================

SpritePrep_ChestGameGuy:
#_068C60: LDA.b #$01
#_068C62: STA.w $0DC0,X
#_068C65: BRA SpritePrep_Shopkeeper_SetType

;===================================================================================================

SpritePrep_KakChestGame:
#_068C67: LDA.b #$03

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper_SetType:
#_068C69: STA.w $0E80,X

#_068C6C: LDA.b #$FF
#_068C6E: STA.w $04C4

#_068C71: RTS

;===================================================================================================

SpritePrep_Shopkeeper_StandardStock:
#_068C72: LDA.b #$00
#_068C74: LDY.b #$07 ; Red potion
#_068C76: JSL ShopKeeper_SpawnShopItem

#_068C7A: LDY.b #$0A ; Heart

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper_SpawnItemAndBombs:
#_068C7C: LDA.b #$01
#_068C7E: JSL ShopKeeper_SpawnShopItem

#_068C82: LDA.b #$02
#_068C84: LDY.b #$0C ; Bombs
#_068C86: JSL ShopKeeper_SpawnShopItem

#_068C8A: RTS

;===================================================================================================

SpritePrep_NiceThief_WithGift:
#_068C8B: LDA.b #$02

;===================================================================================================

SpritePrep_NiceThief_SetType:
#_068C8D: STA.w $0E80,X

#_068C90: RTS

;===================================================================================================

SpritePrep_NiceThief_Desert:
#_068C91: LDA.b #$05

#_068C93: BRA SpritePrep_NiceThief_SetType

;===================================================================================================

SpritePrep_NiceThief_Ice:
#_068C95: LDA.b #$06

#_068C97: BRA SpritePrep_NiceThief_SetType

;===================================================================================================

pool SpritePrep_Storyteller

.rooms
#_068C99: db $0E ; ROOM 010E - bird
#_068C9A: db $0E ; ROOM 010E - glover
#_068C9B: db $12 ; ROOM 0112 - octorok
#_068C9C: db $1A ; ROOM 011A - broccoli
#_068C9D: db $14 ; ROOM 0114 - watto

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Storyteller:
#_068C9E: INC.w $0BA0,X

#_068CA1: LDA.b $A0

#_068CA3: LDY.b #$00

.next_room
#_068CA5: CMP.w .rooms,Y
#_068CA8: BEQ .found_room

#_068CAA: INY
#_068CAB: BNE .next_room

;---------------------------------------------------------------------------------------------------

.found_room
#_068CAD: TYA
#_068CAE: STA.w $0E80,X
#_068CB1: BNE .exit

#_068CB3: LDA.w $0D30,X
#_068CB6: AND.b #$01
#_068CB8: BEQ .exit

#_068CBA: INC.w $0E80,X

.exit
#_068CBD: RTS

;===================================================================================================

pool SpritePrep_Adults

.rooms
#_068CBE: db $03 ; ROOM 0103 - Kakariko Tavern
#_068CBF: db $E1 ; ROOM 00E1 - Lost Woods hideout
#_068CC0: db $19 ; ROOM 0119 - Blind's Hideout

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Adults:
#_068CC1: INC.w $0BA0,X

#_068CC4: LDA.b $A0

#_068CC6: LDY.b #$00

.next_room
#_068CC8: CMP.w .rooms,Y
#_068CCB: BEQ .found_room

#_068CCD: INY
#_068CCE: BNE .next_room

.found_room
#_068CD0: TYA
#_068CD1: STA.w $0E80,X

#_068CD4: RTS

;===================================================================================================

SpritePrep_Whirlpool:
#_068CD5: INC.w $0BA0,X

#_068CD8: LDA.b #$01
#_068CDA: STA.w $0D90,X

#_068CDD: RTS

;===================================================================================================

SpritePrep_Sage:
#_068CDE: INC.w $0BA0,X

#_068CE1: LDA.b $A0
#_068CE3: CMP.b #$0A ; ROOM 010A
#_068CE5: BNE .not_aginah

#_068CE7: INC.w $0E80,X

#_068CEA: LDA.b #$0B
#_068CEC: STA.w $0F50,X

.not_aginah
#_068CEF: RTS

;===================================================================================================

pool SpritePrep_BonkKey

.room_flags
#_068CF0: db $40, $20

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_BonkItem:
#_068CF2: LDA.b $1B
#_068CF4: BEQ SpritePrep_LumberjackTree

#_068CF6: LDA.b #$02
#_068CF8: STA.w $0F20,X

#_068CFB: LDA.b $A0
#_068CFD: CMP.b #$07 ; ROOM 0107
#_068CFF: BNE SpritePrep_BonkKey

#_068D01: LDA.b $A1
#_068D03: CMP.b #$01
#_068D05: BNE SpritePrep_BonkKey

;===================================================================================================

SpritePrep_BonkBook:
#_068D07: LDA.l $7EF34E
#_068D0B: BEQ .book_not_owned

#_068D0D: STZ.w $0DD0,X

#_068D10: RTS

.book_not_owned
#_068D11: PHX

#_068D12: LDA.b #$0E
#_068D14: JSL WriteTo4BPPBuffer_item_gfx

#_068D18: PLX

#_068D19: RTS

;===================================================================================================

SpritePrep_BonkKey:
#_068D1A: LDA.w $0B9B
#_068D1D: STA.w $0CBA,X

#_068D20: TAY

#_068D21: INC.w $0B9B

#_068D24: LDA.w $0403
#_068D27: AND.w .room_flags,Y
#_068D2A: BEQ .not_obtained

#_068D2C: STZ.w $0DD0,X

.not_obtained
#_068D2F: INC.w $0DC0,X

#_068D32: LDA.b #$08
#_068D34: STA.w $0F50,X

#_068D37: LDA.w $0E60,X
#_068D3A: ORA.b #$20
#_068D3C: STA.w $0E60,X

#_068D3F: RTS

;===================================================================================================

SpritePrep_LumberjackTree:
#_068D40: LDA.b #$02
#_068D42: STA.w $0DC0,X

#_068D45: RTS

;===================================================================================================

SpritePrep_Kiki:
#_068D46: INC.w $0BA0,X

#_068D49: PHX

#_068D4A: LDX.b $8A
#_068D4C: LDA.l $7EF280,X

#_068D50: PLX

#_068D51: AND.b #$20
#_068D53: BEQ .monkey_lives

#_068D55: STZ.w $0DD0,X

.monkey_lives
#_068D58: RTS

;===================================================================================================

SpritePrep_Locksmith:
#_068D59: INC.w $0BA0,X

#_068D5C: LDA.l $7EF3CC
#_068D60: CMP.b #$09 ; FOLLOWER 09
#_068D62: BNE .not_already_following

#_068D64: STZ.w $0DD0,X

#_068D67: RTS

;---------------------------------------------------------------------------------------------------

.not_already_following
#_068D68: CMP.b #$0C ; FOLLOWER 0C
#_068D6A: BNE .no_purple_chest

#_068D6C: LDA.b #$02
#_068D6E: STA.w $0D80,X

.no_purple_chest
#_068D71: LDA.l $7EF3C9
#_068D75: AND.b #$10
#_068D77: BEQ .exit

#_068D79: LDA.b #$04
#_068D7B: STA.w $0D80,X

.exit
#_068D7E: RTS

;===================================================================================================

SpritePrep_SickKid:
#_068D7F: LDA.l $7EF34D
#_068D83: BEQ .no_net

#_068D85: LDA.b #$03
#_068D87: STA.w $0D80,X

.no_net
#_068D8A: INC.w $0BA0,X

#_068D8D: RTS

;===================================================================================================

pool SpritePrep_Tektite

.palette
#_068D8E: db $09, $07

.health
#_068D90: db   8,  12

.damage
#_068D92: db $03, $05

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Tektite:
#_068D94: LDA.w $0D10,X

#_068D97: LSR A
#_068D98: LSR A
#_068D99: LSR A
#_068D9A: LSR A

#_068D9B: AND.b #$01
#_068D9D: STA.w $0D90,X

#_068DA0: TAY

#_068DA1: LDA.w .palette,Y
#_068DA4: STA.w $0F50,X

#_068DA7: LDA.w .health,Y
#_068DAA: STA.w $0E50,X

#_068DAD: LDA.w .damage,Y
#_068DB0: STA.w $0CD2,X

#_068DB3: LDA.b #$10
#_068DB5: JSR Sprite_ApplySpeedTowardsLink

#_068DB8: LDA.b #$20
#_068DBA: STA.w $0F80,X

#_068DBD: INC.w $0D80,X

#_068DC0: RTS

;===================================================================================================

SpritePrep_Chainchomp_bounce:
#_068DC1: JSL SpritePrep_Chainchomp

#_068DC5: RTS

;===================================================================================================

SpritePrep_BigFairy:
#_068DC6: LDA.b #$18
#_068DC8: STA.w $0F70,X

#_068DCB: JSR SpritePrep_MoveDown_8px_Right8px

#_068DCE: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_MrsSahasrahla:
#_068DD1: LDA.w $0D00,X
#_068DD4: CLC
#_068DD5: ADC.b #$08
#_068DD7: STA.w $0D00,X

;===================================================================================================

SpritePrep_MagicBat:
SpritePrep_Lumberjacks:
#_068DDA: JSR SpritePrep_MoveRight_8px

#_068DDD: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_FortuneTeller:
#_068DE0: JSR SpritePrep_MoveDown_8px_Right8px

#_068DE3: INC.w $0BA0,X

#_068DE6: RTS

;===================================================================================================

pool SpritePrep_Leever

.palette
#_068DE7: db $0A, $02

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Leever:
#_068DE9: LDA.w $0D10,X

#_068DEC: LSR A
#_068DED: LSR A
#_068DEE: LSR A
#_068DEF: LSR A

#_068DF0: AND.b #$01
#_068DF2: STA.w $0D90,X

#_068DF5: TAY

#_068DF6: LDA.w .palette,Y
#_068DF9: STA.w $0F50,X

#_068DFC: RTS

;===================================================================================================

SpritePrep_Hobo:
#_068DFD: LDY.b #$0F

.next_spawn
#_068DFF: PHY

#_068E00: JSR SpritePrep_Hobo_SpawnSmoke

#_068E03: PLY

#_068E04: DEY
#_068E05: BNE .next_spawn

#_068E07: LDY.b #$0F

.next_check
#_068E09: LDA.w $0E20,Y
#_068E0C: CMP.b #$2B ; SPRITE 2B
#_068E0E: BNE .kill_the_hobo

#_068E10: LDA.b #$00
#_068E12: STA.w $0DD0,Y

.kill_the_hobo
#_068E15: DEY
#_068E16: BNE .next_check

;---------------------------------------------------------------------------------------------------

#_068E18: JSR SpritePrep_Hobo_SpawnFire

#_068E1B: TXY

#_068E1C: LDA.l $7EF3C9
#_068E20: AND.b #$01
#_068E22: BEQ .can_give_bottle

#_068E24: LDA.b #$03
#_068E26: STA.w $0D80

.can_give_bottle
#_068E29: TYX

#_068E2A: LDA.b #$01
#_068E2C: STA.w $0BA0

#_068E2F: RTS

;===================================================================================================

SpritePrep_MasterSword:
#_068E30: LDA.w $0D10,X
#_068E33: CLC
#_068E34: ADC.b #$06
#_068E36: STA.w $0D10,X

#_068E39: LDA.w $0D00,X
#_068E3C: ADC.b #$06
#_068E3E: STA.w $0D00,X

#_068E41: RTS

;===================================================================================================

SpritePrep_Roller_HorizontalRightFirst:
#_068E42: LDY.b #$00
#_068E44: BRA .get_x_position

;---------------------------------------------------------------------------------------------------

#SpritePrep_Roller_HorizontalLeftFirst:
#_068E46: LDY.b #$01

.get_x_position
#_068E48: LDA.w $0D10,X
#_068E4B: EOR.b #$10

#_068E4D: BRA SpritePrep_Roller_Main

;===================================================================================================

SpritePrep_Roller_VerticalDownFirst:
#_068E4F: LDY.b #$02
#_068E51: BRA .get_y_position

;---------------------------------------------------------------------------------------------------

#SpritePrep_Roller_VerticalUpFirst:
#_068E53: LDY.b #$03

.get_y_position
#_068E55: LDA.w $0D00,X

;===================================================================================================

SpritePrep_Roller_Main:
#_068E58: AND.b #$10

#_068E5A: LSR A
#_068E5B: LSR A
#_068E5C: LSR A
#_068E5D: LSR A

#_068E5E: STA.w $0D80,X

#_068E61: BEQ .leave_hitbox

#_068E63: INC.w $0F60,X

.leave_hitbox
#_068E66: TYA
#_068E67: STA.w $0DE0,X

#_068E6A: RTS

;===================================================================================================

SpritePrep_Kodongo:
#_068E6B: LDA.w $0D10,X
#_068E6E: CLC
#_068E6F: ADC.b #$04
#_068E71: STA.w $0D10,X

#_068E74: LDA.w $0D00,X
#_068E77: SEC
#_068E78: SBC.b #$05
#_068E7A: STA.w $0D00,X

#_068E7D: LDA.w $0D20,X
#_068E80: SBC.b #$00
#_068E82: STA.w $0D20,X

;===================================================================================================

SpritePrep_Spark:
#_068E85: DEC.w $0E30,X

#_068E88: RTS

;===================================================================================================

UNREACHABLE_068E89:
#_068E89: db $00, $E0, $F8, $18, $E8, $18, $D0, $30
#_068E91: db $E8, $18, $E0, $F8, $18, $00, $00, $FF
#_068E99: db $FF, $00, $FF, $00, $FF, $00, $FF, $00
#_068EA1: db $FF, $FF, $00, $00, $C0, $D0, $D8, $D0
#_068EA9: db $F0, $F0, $00, $00, $10, $10, $28, $30
#_068EB1: db $30, $40, $FF, $FF, $FF, $FF, $FF, $FF
#_068EB9: db $00, $00, $00, $00, $00, $00, $00, $00

;===================================================================================================

SpritePrep_LostWoodsBird:
#_068EC1: JSL GetRandomNumber
#_068EC5: AND.b #$1F
#_068EC7: SEC
#_068EC8: SBC.b #$10
#_068ECA: STA.w $0F80,X

#_068ECD: LDA.b #$40
#_068ECF: STA.w $0F70,X

;===================================================================================================

SpritePrep_LostWoodsSquirrel:
#_068ED2: JSR Sprite_IsRightOfLink

#_068ED5: LDA.b #$10

#_068ED7: CPY.b #$00
#_068ED9: BEQ .run_right

#_068EDB: LDA.b #$F0

.run_right
#_068EDD: STA.w $0D50,X

#_068EE0: LDA.b #$FC

#_068EE2: LDY.w $069E
#_068EE5: BPL .run_down

#_068EE7: LDA.b #$04

.run_down
#_068EE9: STA.w $0D40,X
#_068EEC: STA.w $0BA0,X

#_068EEF: RTS

;===================================================================================================

pool SpritePrep_Antifairy

.speed_x
#_068EF0: db 16, -16

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Antifairy:
#_068EF2: LDA.w $0D10,X
#_068EF5: LSR A
#_068EF6: LSR A
#_068EF7: LSR A
#_068EF8: LSR A
#_068EF9: AND.b #$01
#_068EFB: TAY

#_068EFC: LDA.w .speed_x,Y
#_068EFF: STA.w $0D50,X

#_068F02: LDA.b #$F0
#_068F04: STA.w $0D40,X

#_068F07: RTS

;===================================================================================================

SpritePrep_FallingIce:
#_068F08: JSR SpritePrep_Boss

#_068F0B: INC.w $0BA0,X

#_068F0E: RTS

;===================================================================================================

SpritePrep_KingZora:
#_068F0F: LDA.l $7EF356
#_068F13: BEQ .flippers_sold_out

#_068F15: STZ.w $0DD0,X

#_068F18: RTS

.flippers_sold_out
#_068F19: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Boss:
#_068F1C: LDA.w $0403
#_068F1F: BPL .boss_alive

#_068F21: PLA
#_068F22: PLA

#_068F23: STZ.w $0DD0,X

#_068F26: RTS

;---------------------------------------------------------------------------------------------------

.boss_alive
#_068F27: LDY.b #$0F

.next_sprite
#_068F29: PHX

#_068F2A: LDX.w $0E20,Y
#_068F2D: LDA.l SpriteData_Bump,X

#_068F31: PLX

#_068F32: AND.b #$10
#_068F34: BNE .leave_alive

#_068F36: LDA.b #$00
#_068F38: STA.w $0DD0,Y

.leave_alive
#_068F3B: DEY
#_068F3C: BPL .next_sprite

#_068F3E: RTS

;===================================================================================================

SpritePrep_ArmosKnight:
#_068F3F: JSR SpritePrep_Boss

#_068F42: LDA.b #$FF
#_068F44: STA.w $0DF0,X

#_068F47: INC.w $0FF8

#_068F4A: JMP.w SpritePrep_MoveDown_8px_Right8px

;===================================================================================================

SpritePrep_DesertStatue:
#_068F4D: LDA.w $0B6A
#_068F50: STA.w $0D90,X

#_068F53: INC.w $0B6A

#_068F56: JSR SpritePrep_MoveDown_8px_Right8px

#_068F59: LDA.w $0D10,X

#_068F5C: LDY.b #$01

#_068F5E: CMP.b #$30
#_068F60: BCC .ignore_position

#_068F62: INY

#_068F63: CMP.b #$E0
#_068F65: BCS .ignore_position

#_068F67: INY

.ignore_position
#_068F68: TYA
#_068F69: STA.w $0DE0,X

;===================================================================================================

SpritePrep_DoNothingD:
#_068F6C: RTS

;===================================================================================================

pool SpritePrep_Octorok

.damage
#_068F6D: db $03, $05

.health
#_068F6F: db   2,   4

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Octorok:
#_068F71: LDY.w $0FFF

#_068F74: LDA.w .health,Y
#_068F77: STA.w $0E50,X

#_068F7A: LDA.w .damage,Y
#_068F7D: STA.w $0CD2,X

#_068F80: JSL GetRandomNumber
#_068F84: AND.b #$7F
#_068F86: STA.w $0DF0,X

#_068F89: RTS

;===================================================================================================

SpritePrep_Moldorm_bounce:
#_068F8A: JSR SpritePrep_Boss

#_068F8D: INC.w $0BA0,X

#_068F90: JSL SpritePrep_Moldorm

#_068F94: RTS

;===================================================================================================

SpritePrep_Lanmolas_bounce:
#_068F95: JSR SpritePrep_Boss
#_068F98: JSL SpritePrep_Lanmolas

#_068F9C: RTS

;===================================================================================================

SpritePrep_BigSpike:
#_068F9D: JSR SpritePrep_MoveDown_8px_Right8px

#_068FA0: BRA SpritePrep_CacheOriginalCoordinates

;===================================================================================================

SpritePrep_SwimmingZora:
#_068FA2: LDA.b #$40
#_068FA4: STA.w $0DF0,X

;===================================================================================================

SpritePrep_Geldman:
#_068FA7: LDA.b #$08
#_068FA9: CLC
#_068FAA: ADC.w $0D10,X
#_068FAD: STA.w $0D10,X

;===================================================================================================

SpritePrep_CacheOriginalCoordinates:
#_068FB0: LDA.w $0D10,X
#_068FB3: STA.w $0D90,X

#_068FB6: LDA.w $0D30,X
#_068FB9: STA.w $0DA0,X

#_068FBC: LDA.w $0D00,X
#_068FBF: STA.w $0DB0,X

#_068FC2: LDA.w $0D20,X
#_068FC5: STA.w $0EB0,X

#_068FC8: RTS

;===================================================================================================

SpritePrep_WalkingZora:
#_068FC9: LDA.b #$60
#_068FCB: STA.w $0DF0,X

#_068FCE: RTS

;===================================================================================================

SpritePrep_StandardGuard_indoors:
#_068FCF: ASL.w $0BE0,X
#_068FD2: LSR.w $0BE0,X

#_068FD5: RTS

;===================================================================================================

SpritePrep_StandardGuard:
#_068FD6: LDA.w $0E30,X
#_068FD9: BEQ .dont_turn

#_068FDB: LDY.b #$00

#_068FDD: AND.b #$07
#_068FDF: CMP.b #$05
#_068FE1: BCS .special_turn

#_068FE3: DEC A
#_068FE4: EOR.b #$01
#_068FE6: STA.w $0DE0,X

.dont_turn
#_068FE9: LDA.b $1B
#_068FEB: BNE .indoors

#_068FED: LDA.b #$01
#_068FEF: STA.w $0D80,X

#_068FF2: LDA.b #$70
#_068FF4: STA.w $0DF0,X

#_068FF7: JSR Sprite_DirectionToFaceLink

#_068FFA: TYA
#_068FFB: STA.w $0DE0,X
#_068FFE: STA.w $0EB0,X

;===================================================================================================

#SpritePrep_CoolerGuard:
#_069001: BRA SpritePrep_CoolestGuardEver

.special_turn
#_069003: BEQ .not_five

#_069005: LDY.b #$04

.not_five
#_069007: LDA.w $0E30,X

#_06900A: LSR A
#_06900B: LSR A
#_06900C: LSR A

#_06900D: AND.b #$03
#_06900F: STA.b $00

#_069011: TYA
#_069012: ORA.b $00
#_069014: TAY

#_069015: LDA.w .data,Y
#_069018: STA.w $0DA0,X

#_06901B: LDA.w $0B6B,X
#_06901E: AND.b #$0F
#_069020: ORA.b #$50
#_069022: STA.w $0B6B,X

;===================================================================================================

#SpritePrep_CoolestGuardEver:
#_069025: LDA.b $11
#_069027: PHA

#_069028: STZ.b $11

#_06902A: SEC
#_06902B: ROR.w $0CAA,X

#_06902E: JSR SpriteModule_Active
#_069031: JSR SpriteModule_Active

#_069034: ASL.w $0CAA,X

#_069037: PLA
#_069038: STA.b $11

#_06903A: RTS

;---------------------------------------------------------------------------------------------------

.data
#_06903B: db $00, $02, $01, $03, $06, $04, $05, $07

;===================================================================================================

SpritePrep_TalkingTree:
#_069043: INC.w $0BA0,X

#_069046: LDA.w $0D10,X
#_069049: SEC
#_06904A: SBC.b #$08
#_06904C: STA.w $0D10,X

#_06904F: LDA.w $0D30,X
#_069052: SBC.b #$00
#_069054: STA.w $0D30,X

#_069057: LDA.b #$00
#_069059: JSL SpritePrep_TalkingTree_SpawnEyeball

#_06905D: LDA.b #$01
#_06905F: JSL SpritePrep_TalkingTree_SpawnEyeball

#_069063: RTS

;===================================================================================================

SpritePrep_CrystalSwitch:
#_069064: LDA.l $7EC172
#_069068: AND.b #$01
#_06906A: TAY

#_06906B: LDA.w CrystalSwitch_Palette,Y
#_06906E: ORA.w $0F50,X
#_069071: STA.w $0F50,X

#_069074: RTS

;===================================================================================================

SpritePrep_FluteKid:
#_069075: INC.w $0BA0,X

#_069078: LDA.l $7EF3CA
#_06907C: ASL A
#_06907D: ROL A
#_06907E: ROL A
#_06907F: AND.b #$01
#_069081: STA.w $0E80,X
#_069084: BEQ .light_world

;---------------------------------------------------------------------------------------------------

.stumpy
#_069086: LDA.l $7EF3C9
#_06908A: AND.b #$08
#_06908C: BNE .not_stumpified

#_06908E: LDA.l $7EF34C
#_069092: CMP.b #$02
#_069094: BCC .no_flute
#_069096: BEQ .have_shovel

;---------------------------------------------------------------------------------------------------

.not_stumpified
#_069098: LDA.b #$03
#_06909A: STA.w $0DC0,X

#_06909D: LDA.b #$05
#_06909F: STA.w $0D80,X

#_0690A2: BRA .no_flute

;---------------------------------------------------------------------------------------------------

.have_shovel
#_0690A4: LDA.b #$01
#_0690A6: STA.w $0DC0,X

.no_flute
#_0690A9: JSR SpritePrep_MoveRight_8px

#_0690AC: LDA.w $0D00,X
#_0690AF: SEC
#_0690B0: SBC.b #$08
#_0690B2: STA.w $0D00,X

#_0690B5: RTS

;---------------------------------------------------------------------------------------------------

.light_world
#_0690B6: LDA.l $7EF34C
#_0690BA: CMP.b #$02
#_0690BC: BCC SpritePrep_MoveRight_7px

#_0690BE: STZ.w $0DD0,X

#_0690C1: RTS

;===================================================================================================

SpritePrep_MoveRight_7px:
#_0690C2: LDA.w $0D10,X
#_0690C5: CLC
#_0690C6: ADC.b #$07
#_0690C8: STA.w $0D10,X

#_0690CB: RTS

;===================================================================================================

SpritePrep_MoveDown_8px:
#_0690CC: LDA.w $0D00,X
#_0690CF: CLC
#_0690D0: ADC.b #$08
#_0690D2: STA.w $0D00,X

;===================================================================================================

SpritePrep_DoNothingE:
#_0690D5: RTS

;===================================================================================================

SpritePrep_PedestalPlaque:
#_0690D6: INC.w $0BA0,X

#_0690D9: LDA.b $8A
#_0690DB: CMP.b #$30 ; OW 30
#_0690DD: BEQ SpritePrep_MoveRight_7px

#_0690DF: RTS

;===================================================================================================

SpritePrep_Stalfos:
#_0690E0: LDA.w $0D10,X
#_0690E3: AND.b #$10
#_0690E5: STA.w $0E30,X
#_0690E8: BEQ .grounded

#_0690EA: LDA.b #$07
#_0690EC: STA.w $0F50,X

.grounded
#_0690EF: RTS

;===================================================================================================

SpritePrep_KholdstareShell:
#_0690F0: JSR SpritePrep_Boss

#_0690F3: LDA.b #$C0
#_0690F5: STA.w $0E00,X

#_0690F8: BRA SpritePrep_MoveDown_8px_Right8px

;===================================================================================================

SpritePrep_Kholdstare:
#_0690FA: JSR SpritePrep_Boss

#_0690FD: LDA.b #$03
#_0690FF: STA.w $0D80,X

#_069102: JSR SpritePrep_IgnoreProjectiles

#_069105: BRA SpritePrep_MoveDown_8px_Right8px

;===================================================================================================

SpritePrep_Bumper:
#_069107: JSR SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_MoveDown_8px_Right8px:
#_06910A: PHX

#_06910B: TXA
#_06910C: CLC
#_06910D: ADC.b #$10
#_06910F: TAX

#_069110: JSR SpritePrep_MoveDown_8px

#_069113: PLX

#_069114: BRA SpritePrep_MoveDown_8px

;===================================================================================================

pool SpritePrep_HardhatBeetle

.palette
#_069116: db $06, $08

.health
#_069118: db  32,   6

.speed
#_06911A: db $10, $0C

.ai
#_06911C: db $01, $03

.prize
#_06911E: db $02, $06

.bump
#_069120: db $05, $03

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_HardhatBeetle:
#_069122: LDY.b #$00

#_069124: LDA.w $0D10,X
#_069127: AND.b #$10
#_069129: BEQ .red

#_06912B: INY

.red
#_06912C: LDA.w .palette,Y
#_06912F: STA.w $0F50,X

#_069132: LDA.w .health,Y
#_069135: STA.w $0E50,X

#_069138: LDA.w .speed,Y
#_06913B: STA.w $0D90,X

#_06913E: LDA.w .ai,Y
#_069141: STA.w $0D80,X

#_069144: LDA.w .prize,Y
#_069147: STA.w $0BE0,X

#_06914A: LDA.w .bump,Y
#_06914D: STA.w $0CD2,X

#_069150: RTS

;===================================================================================================

SpritePrep_MiniHelmasaur:
#_069151: LDA.b #$10
#_069153: STA.w $0D90,X

#_069156: LDA.b #$01
#_069158: STA.w $0D80,X

#_06915B: RTS

;===================================================================================================

SpritePrep_Fairy:
#_06915C: JSL GetRandomNumber
#_069160: AND.b #$01
#_069162: STA.w $0D90,X

#_069165: EOR.b #$01
#_069167: STA.w $0DE0,X

;===================================================================================================

SpritePrep_Absorbable:
#_06916A: LDA.b $1B
#_06916C: BNE SpritePrep_DoNothingF

;===================================================================================================

SpritePrep_OverworldBonkItem:
#_06916E: INC.w $0E90,X
#_069171: INC.w $0BA0,X

;===================================================================================================

SpritePrep_DoNothingF:
#_069174: RTS

;===================================================================================================

SpritePrep_NiceBee:
#_069175: LDA.l $7EF35C
#_069179: ORA.l $7EF35D
#_06917D: ORA.l $7EF35E
#_069181: ORA.l $7EF35F
#_069185: AND.b #$08
#_069187: BEQ .bees_for_everyone_like_that_oprah_gif

#_069189: STZ.w $0DD0,X

.bees_for_everyone_like_that_oprah_gif
#_06918C: INC.w $0E90,X
#_06918F: INC.w $0BA0,X

#_069192: RTS

;===================================================================================================

pool SpritePrep_Agahnim

.palette
#_069193: db $0B, $07

pool off

;---------------------------------------------------------------------------------------------------

SpritePrep_Agahnim:
#_069195: JSR SpritePrep_Boss

#_069198: LDA.b #$00
#_06919A: STA.w $0DC0,X

#_06919D: LDA.b #$03
#_06919F: STA.w $0DE0,X

#_0691A2: JSR SpritePrep_MoveDown_8px_Right8px

#_0691A5: LDY.w $0FFF

#_0691A8: LDA.w .palette,Y
#_0691AB: STA.w $0F50,X

;===================================================================================================

SpritePrep_DoNothingG:
#_0691AE: RTS

;===================================================================================================

SpritePrep_Eyegore_bounce:
#_0691AF: JSL SpritePrep_Eyegore

#_0691B3: RTS

;===================================================================================================

SpritePrep_FireBar:
#_0691B4: INC.w $0DA0,X

#_0691B7: JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Trinexx:
#_0691BA: JSR SpritePrep_Boss
#_0691BD: JSL Trinexx_Initialize
#_0691C1: JSR SpritePrep_FreeUpBossSegmentSlots

#_0691C4: RTS

;===================================================================================================

SpritePrep_HelmasaurKing:
#_0691C5: JSR SpritePrep_Boss
#_0691C8: JSL HelmasaurKing_Initialize

;===================================================================================================

SpritePrep_FreeUpBossSegmentSlots:
#_0691CC: LDY.b #$0F
#_0691CE: LDA.b #$00

.next
#_0691D0: STA.w $1D00,Y

#_0691D3: DEY
#_0691D4: BPL .next

#_0691D6: RTS

;===================================================================================================

SpritePrep_Spike:
#_0691D7: LDA.b #$20
#_0691D9: STA.w $0D50,X

;===================================================================================================

SpritePrep_RockStal:
#_0691DC: LDA.b #$F0
#_0691DE: STA.w $0D40,X

#_0691E1: JSR Sprite_Move_Y_Bank06

#_0691E4: STZ.w $0D40,X

#_0691E7: RTS

;===================================================================================================

SpritePrep_Blob:
#_0691E8: LDA.b #$04
#_0691EA: STA.w $0DC0,X

#_0691ED: JSR SpritePrep_IgnoreProjectiles

#_0691F0: RTS

;===================================================================================================

SpritePrep_Arrghus:
#_0691F1: JSR SpritePrep_Boss

#_0691F4: LDA.b #$18
#_0691F6: STA.w $0F70,X

#_0691F9: RTS

;===================================================================================================

SpritePrep_Arrghi:
#_0691FA: JSR SpritePrep_Boss

#_0691FD: JSL GetRandomNumber

#_069201: STA.w $0E80,X

#_069204: CPX.b #$0D
#_069206: BNE .not_last_puff

#_069208: STZ.w $0B0A
#_06920B: STZ.w $0B0B

#_06920E: PHX

#_06920F: LDX.b #$00
#_069211: JSL Arrghus_HandlePuffs_long

#_069215: PLX

.not_last_puff
#_069216: LDA.w $0B0F,X
#_069219: STA.w $0D10,X

#_06921C: LDA.w $0B1F,X
#_06921F: STA.w $0D30,X

#_069222: LDA.w $0B2F,X
#_069225: STA.w $0D00,X

#_069228: LDA.w $0B3F,X
#_06922B: STA.w $0D20,X

#_06922E: RTS

;===================================================================================================

SpritePrep_Mothula:
#_06922F: JSR SpritePrep_Boss

#_069232: LDA.b #$50
#_069234: STA.w $0DF0,X

#_069237: INC.w $0BA0,X

#_06923A: LDA.b #$02
#_06923C: STA.w $0DC0,X

#_06923F: INC.w $041A

#_069242: LDA.b #$70
#_069244: STA.w $0DB0,X

#_069247: RTS

;===================================================================================================

SpritePrep_AntifairyCircle_bounce:
#_069248: JSL SpritePrep_AntifairyCircle

#_06924C: RTS

;===================================================================================================

SpritePrep_DoNothingH:
#_06924D: RTS

;===================================================================================================

SpritePrep_BigKey:
#_06924E: JSR SpritePrep_MoveRight_8px

#_069251: LDA.b #$FF
#_069253: STA.w $0E30,X

;---------------------------------------------------------------------------------------------------

SpritePrep_BigKey_load_graphics:
#_069256: PHX
#_069257: PHY

#_069258: LDA.b #$22
#_06925A: JSL WriteTo4BPPBuffer_item_gfx

#_06925E: PLY
#_06925F: PLX

#_069260: BRA SpritePrep_SetKeyIndex

;===================================================================================================

SpritePrep_SmallKey:
#_069262: LDA.b #$FF
#_069264: STA.w $0E30,X

;===================================================================================================

SpritePrep_SetKeyIndex:
#_069267: LDA.w $0B9B
#_06926A: STA.w $0CBA,X

#_06926D: INC.w $0B9B

#_069270: RTS

;===================================================================================================

SpriteModule_Active:
#_069271: LDA.w $0E20,X

#_069274: REP #$30

#_069276: AND.w #$00FF
#_069279: ASL A
#_06927A: TAY

#_06927B: LDA.w .vectors,Y
#_06927E: DEC A
#_06927F: PHA

#_069280: SEP #$30

#_069282: RTS

;---------------------------------------------------------------------------------------------------

.vectors
#_069283: dw Sprite_00_Raven_bounce                   ; 0x00 - RAVEN
#_069285: dw Sprite_01_Vulture_bounce                 ; 0x01 - VULTURE
#_069287: dw Sprite_02_StalfosHead                    ; 0x02 - STALFOS HEAD
#_069289: dw $0000                                    ; 0x03 - NULL
#_06928B: dw Sprite_PullSwitch_bounce                 ; 0x04 - CORRECT PULL SWITCH
#_06928D: dw Sprite_PullSwitch_bounce                 ; 0x05 - UNUSED CORRECT PULL SWITCH
#_06928F: dw Sprite_PullSwitch_bounce                 ; 0x06 - WRONG PULL SWITCH
#_069291: dw Sprite_PullSwitch_bounce                 ; 0x07 - UNUSED WRONG PULL SWITCH
#_069293: dw Sprite_08_Octorok                        ; 0x08 - OCTOROK
#_069295: dw Sprite_09_Moldorm_bounce                 ; 0x09 - MOLDORM
#_069297: dw Sprite_0A_Octorok4way                    ; 0x0A - OCTOROK 4WAY
#_069299: dw Sprite_0B_Cucco                          ; 0x0B - CUCCO
#_06929B: dw Sprite_0C_OctorokStone                   ; 0x0C - OCTOROK STONE
#_06929D: dw Sprite_0D_Buzzblob                       ; 0x0D - BUZZBLOB
#_06929F: dw Sprite_0E_Snapdragon                     ; 0x0E - SNAPDRAGON
#_0692A1: dw Sprite_0F_Octoballoon                    ; 0x0F - OCTOBALLOON
#_0692A3: dw Sprite_10_OctoballoonBaby                ; 0x10 - OCTOBALLOON BABY
#_0692A5: dw Sprite_11_Hinox                          ; 0x11 - HINOX
#_0692A7: dw Sprite_12_Moblin                         ; 0x12 - MOBLIN
#_0692A9: dw Sprite_13_MiniHelmasaur                  ; 0x13 - MINI HELMASAUR
#_0692AB: dw Sprite_14_ThievesTownGrate_bounce        ; 0x14 - THIEVES TOWN GRATE
#_0692AD: dw Sprite_15_Antifairy                      ; 0x15 - ANTIFAIRY
#_0692AF: dw Sprite_16_Elder_bounce                   ; 0x16 - SAHASRAHLA / AGINAH
#_0692B1: dw Sprite_17_Hoarder                        ; 0x17 - HOARDER
#_0692B3: dw Sprite_18_MiniMoldorm                    ; 0x18 - MINI MOLDORM
#_0692B5: dw Sprite_19_Poe                            ; 0x19 - POE
#_0692B7: dw Sprite_1A_Smithy                         ; 0x1A - SMITHY
#_0692B9: dw Sprite_1B_Arrow                          ; 0x1B - ARROW
#_0692BB: dw Sprite_1C_Statue                         ; 0x1C - STATUE
#_0692BD: dw Sprite_1D_FluteQuest                     ; 0x1D - FLUTEQUEST
#_0692BF: dw Sprite_1E_CrystalSwitch                  ; 0x1E - CRYSTAL SWITCH
#_0692C1: dw Sprite_1F_SickKid                        ; 0x1F - SICK KID
#_0692C3: dw Sprite_20_Sluggula                       ; 0x20 - SLUGGULA
#_0692C5: dw Sprite_21_WaterSwitch                    ; 0x21 - WATER SWITCH
#_0692C7: dw Sprite_22_Ropa                           ; 0x22 - ROPA
#_0692C9: dw Sprite_23_RedBari                        ; 0x23 - RED BARI
#_0692CB: dw Sprite_24_BlueBari                       ; 0x24 - BLUE BARI
#_0692CD: dw Sprite_25_TalkingTree_bounce             ; 0x25 - TALKING TREE
#_0692CF: dw Sprite_26_HardhatBeetle                  ; 0x26 - HARDHAT BEETLE
#_0692D1: dw Sprite_27_Deadrock                       ; 0x27 - DEADROCK
#_0692D3: dw Sprite_28_DarkWorldHintNPC               ; 0x28 - DARK WORLD HINT NPC
#_0692D5: dw Sprite_29_Adult_bounce                   ; 0x29 - ADULT
#_0692D7: dw Sprite_2A_SweepingLady_bounce            ; 0x2A - SWEEPING LADY
#_0692D9: dw Sprite_2B_Hobo                           ; 0x2B - HOBO
#_0692DB: dw Sprite_2C_Lumberjacks_bounce             ; 0x2C - LUMBERJACKS
#_0692DD: dw Sprite_2D_NecklessMan_bounce             ; 0x2D - NECKLESS MAN
#_0692DF: dw Sprite_2E_FluteKid                       ; 0x2E - FLUTE KID
#_0692E1: dw Sprite_2F_RaceGameLady_bounce            ; 0x2F - RACE GAME LADY
#_0692E3: dw Sprite_30_RaceGameGuy_bounce             ; 0x30 - RACE GAME GUY
#_0692E5: dw Sprite_31_FortuneTeller_bounce           ; 0x31 - FORTUNE TELLER
#_0692E7: dw Sprite_32_ArguingBros_bounce             ; 0x32 - ARGUE BROS
#_0692E9: dw Sprite_33_RupeePull_bounce               ; 0x33 - RUPEE PULL
#_0692EB: dw Sprite_34_YoungSnitch_bounce             ; 0x34 - YOUNG SNITCH
#_0692ED: dw Sprite_35_Innkeeper_bounce               ; 0x35 - INNKEEPER
#_0692EF: dw Sprite_36_Witch_bounce                   ; 0x36 - WITCH
#_0692F1: dw Sprite_37_Waterfall_bounce               ; 0x37 - WATERFALL
#_0692F3: dw Sprite_38_EyeStatue_bounce               ; 0x38 - EYE STATUE
#_0692F5: dw Sprite_39_Locksmith                      ; 0x39 - LOCKSMITH
#_0692F7: dw Sprite_3A_MagicBat_bounce                ; 0x3A - MAGIC BAT
#_0692F9: dw Sprite_3B_BonkItem_bounce                ; 0x3B - BONK ITEM
#_0692FB: dw Sprite_3C_KidInKak_bounce                ; 0x3C - KID IN KAK
#_0692FD: dw Sprite_3D_OldSnitch_bounce               ; 0x3D - OLD SNITCH
#_0692FF: dw Sprite_3E_Hoarder                        ; 0x3E - HOARDER
#_069301: dw TutorialGuardOrBarrier_bounce            ; 0x3F - TUTORIAL GUARD
#_069303: dw TutorialGuardOrBarrier_bounce            ; 0x40 - LIGHTNING GATE
#_069305: dw SpriteModule_Active_Bank05_bounce        ; 0x41 - BLUE GUARD
#_069307: dw SpriteModule_Active_Bank05_bounce        ; 0x42 - GREEN GUARD
#_069309: dw SpriteModule_Active_Bank05_bounce        ; 0x43 - RED SPEAR GUARD
#_06930B: dw SpriteModule_Active_Bank05_bounce        ; 0x44 - BLUESAIN BOLT
#_06930D: dw SpriteModule_Active_Bank05_bounce        ; 0x45 - USAIN BOLT
#_06930F: dw SpriteModule_Active_Bank05_bounce        ; 0x46 - BLUE ARCHER
#_069311: dw SpriteModule_Active_Bank05_bounce        ; 0x47 - GREEN BUSH GUARD
#_069313: dw SpriteModule_Active_Bank05_bounce        ; 0x48 - RED JAVELIN GUARD
#_069315: dw SpriteModule_Active_Bank05_bounce        ; 0x49 - RED BUSH GUARD
#_069317: dw SpriteModule_Active_Bank05_bounce        ; 0x4A - BOMB GUARD
#_069319: dw SpriteModule_Active_Bank05_bounce        ; 0x4B - GREEN KNIFE GUARD
#_06931B: dw SpriteModule_Active_Bank05_bounce        ; 0x4C - GELDMAN
#_06931D: dw SpriteModule_Active_Bank05_bounce        ; 0x4D - TOPPO
#_06931F: dw SpriteModule_Active_Bank05_bounce        ; 0x4E - POPO
#_069321: dw SpriteModule_Active_Bank05_bounce        ; 0x4F - POPO
#_069323: dw SpriteModule_Active_Bank05_bounce        ; 0x50 - CANNONBALL
#_069325: dw SpriteModule_Active_Bank05_bounce        ; 0x51 - ARMOS STATUE
#_069327: dw SpriteModule_Active_Bank05_bounce        ; 0x52 - KING ZORA
#_069329: dw SpriteModule_Active_Bank05_bounce        ; 0x53 - ARMOS KNIGHT
#_06932B: dw SpriteModule_Active_Bank05_bounce        ; 0x54 - LANMOLAS
#_06932D: dw SpriteModule_Active_Bank05_bounce        ; 0x55 - ZORA / FIREBALL
#_06932F: dw SpriteModule_Active_Bank05_bounce        ; 0x56 - ZORA
#_069331: dw SpriteModule_Active_Bank05_bounce        ; 0x57 - DESERT STATUE
#_069333: dw SpriteModule_Active_Bank05_bounce        ; 0x58 - CRAB
#_069335: dw SpriteModule_Active_Bank05_bounce        ; 0x59 - LOST WOODS BIRD
#_069337: dw SpriteModule_Active_Bank05_bounce        ; 0x5A - LOST WOODS SQUIRREL
#_069339: dw SpriteModule_Active_Bank05_bounce        ; 0x5B - SPARK
#_06933B: dw SpriteModule_Active_Bank05_bounce        ; 0x5C - SPARK
#_06933D: dw SpriteModule_Active_Bank05_bounce        ; 0x5D - ROLLER VERTICAL DOWN FIRST
#_06933F: dw SpriteModule_Active_Bank05_bounce        ; 0x5E - ROLLER VERTICAL UP FIRST
#_069341: dw SpriteModule_Active_Bank05_bounce        ; 0x5F - ROLLER HORIZONTAL RIGHT FIRST
#_069343: dw SpriteModule_Active_Bank05_bounce        ; 0x60 - ROLLER HORIZONTAL LEFT FIRST
#_069345: dw SpriteModule_Active_Bank05_bounce        ; 0x61 - BEAMOS
#_069347: dw SpriteModule_Active_Bank05_bounce        ; 0x62 - MASTERSWORD
#_069349: dw SpriteModule_Active_Bank05_bounce        ; 0x63 - DEBIRANDO PIT
#_06934B: dw SpriteModule_Active_Bank05_bounce        ; 0x64 - DEBIRANDO
#_06934D: dw SpriteModule_Active_Bank05_bounce        ; 0x65 - ARCHERY GUY
#_06934F: dw SpriteModule_Active_Bank05_bounce        ; 0x66 - WALL CANNON VERTICAL LEFT
#_069351: dw SpriteModule_Active_Bank05_bounce        ; 0x67 - WALL CANNON VERTICAL RIGHT
#_069353: dw SpriteModule_Active_Bank05_bounce        ; 0x68 - WALL CANNON HORIZONTAL TOP
#_069355: dw SpriteModule_Active_Bank05_bounce        ; 0x69 - WALL CANNON HORIZONTAL BOTTOM
#_069357: dw SpriteModule_Active_Bank05_bounce        ; 0x6A - BALL N CHAIN
#_069359: dw SpriteModule_Active_Bank05_bounce        ; 0x6B - CANNONBALL / CANNON TROOPER
#_06935B: dw SpriteModule_Active_Bank05_bounce        ; 0x6C - MIRROR PORTAL
#_06935D: dw SpriteModule_Active_Bank05_bounce        ; 0x6D - RAT / CRICKET
#_06935F: dw SpriteModule_Active_Bank05_bounce        ; 0x6E - SNAKE
#_069361: dw SpriteModule_Active_Bank05_bounce        ; 0x6F - KEESE
#_069363: dw SpriteModule_Active_Bank05_bounce        ; 0x70 - KING HELMASAUR FIREBALL
#_069365: dw Sprite_71_Leever                         ; 0x71 - LEEVER
#_069367: dw Sprite_72_FairyPond                      ; 0x72 - FAIRY POND TRIGGER
#_069369: dw Sprite_73_UncleAndPriest_bounce          ; 0x73 - UNCLE / PRIEST / MANTLE
#_06936B: dw Sprite_74_RunningBoy_bounce              ; 0x74 - RUNNING MAN
#_06936D: dw Sprite_75_BottleMerchant_bounce          ; 0x75 - BOTTLE MERCHANT
#_06936F: dw Sprite_76_Zelda_bounce                   ; 0x76 - ZELDA
#_069371: dw Sprite_77_Antifairy                      ; 0x77 - ANTIFAIRY
#_069373: dw Sprite_78_MrsSahasrahla_bounce           ; 0x78 - SAHASRAHLAS WIFE
#_069375: dw SpriteModule_Active_Bank1E_bounce        ; 0x79 - BEE
#_069377: dw SpriteModule_Active_Bank1E_bounce        ; 0x7A - AGAHNIM
#_069379: dw SpriteModule_Active_Bank1E_bounce        ; 0x7B - AGAHNIMS BALLS
#_06937B: dw SpriteModule_Active_Bank1E_bounce        ; 0x7C - GREEN STALFOS
#_06937D: dw SpriteModule_Active_Bank1E_bounce        ; 0x7D - BIG SPIKE
#_06937F: dw SpriteModule_Active_Bank1E_bounce        ; 0x7E - FIREBAR CLOCKWISE
#_069381: dw SpriteModule_Active_Bank1E_bounce        ; 0x7F - FIREBAR COUNTERCLOCKWISE
#_069383: dw SpriteModule_Active_Bank1E_bounce        ; 0x80 - FIRESNAKE
#_069385: dw SpriteModule_Active_Bank1E_bounce        ; 0x81 - HOVER
#_069387: dw SpriteModule_Active_Bank1E_bounce        ; 0x82 - ANTIFAIRY CIRCLE
#_069389: dw SpriteModule_Active_Bank1E_bounce        ; 0x83 - GREEN EYEGORE / GREEN MIMIC
#_06938B: dw SpriteModule_Active_Bank1E_bounce        ; 0x84 - RED EYEGORE / RED MIMIC
#_06938D: dw SpriteModule_Active_Bank1E_bounce        ; 0x85 - YELLOW STALFOS
#_06938F: dw SpriteModule_Active_Bank1E_bounce        ; 0x86 - KODONGO
#_069391: dw SpriteModule_Active_Bank1E_bounce        ; 0x87 - KONDONGO FIRE
#_069393: dw SpriteModule_Active_Bank1E_bounce        ; 0x88 - MOTHULA
#_069395: dw SpriteModule_Active_Bank1E_bounce        ; 0x89 - MOTHULA BEAM
#_069397: dw SpriteModule_Active_Bank1E_bounce        ; 0x8A - SPIKE BLOCK
#_069399: dw SpriteModule_Active_Bank1E_bounce        ; 0x8B - GIBDO
#_06939B: dw SpriteModule_Active_Bank1E_bounce        ; 0x8C - ARRGHUS
#_06939D: dw SpriteModule_Active_Bank1E_bounce        ; 0x8D - ARRGHI
#_06939F: dw SpriteModule_Active_Bank1E_bounce        ; 0x8E - TERRORPIN
#_0693A1: dw SpriteModule_Active_Bank1E_bounce        ; 0x8F - BLOB
#_0693A3: dw SpriteModule_Active_Bank1E_bounce        ; 0x90 - WALLMASTER
#_0693A5: dw SpriteModule_Active_Bank1E_bounce        ; 0x91 - STALFOS KNIGHT
#_0693A7: dw SpriteModule_Active_Bank1E_bounce        ; 0x92 - KING HELMASAUR
#_0693A9: dw SpriteModule_Active_Bank1E_bounce        ; 0x93 - BUMPER
#_0693AB: dw SpriteModule_Active_Bank1E_bounce        ; 0x94 - PIROGUSU
#_0693AD: dw SpriteModule_Active_Bank1E_bounce        ; 0x95 - LASER EYE LEFT
#_0693AF: dw SpriteModule_Active_Bank1E_bounce        ; 0x96 - LASER EYE RIGHT
#_0693B1: dw SpriteModule_Active_Bank1E_bounce        ; 0x97 - LASER EYE TOP
#_0693B3: dw SpriteModule_Active_Bank1E_bounce        ; 0x98 - LASER EYE BOTTOM
#_0693B5: dw SpriteModule_Active_Bank1E_bounce        ; 0x99 - PENGATOR
#_0693B7: dw SpriteModule_Active_Bank1E_bounce        ; 0x9A - KYAMERON
#_0693B9: dw SpriteModule_Active_Bank1E_bounce        ; 0x9B - WIZZROBE
#_0693BB: dw SpriteModule_Active_Bank1E_bounce        ; 0x9C - ZORO
#_0693BD: dw SpriteModule_Active_Bank1E_bounce        ; 0x9D - BABASU
#_0693BF: dw SpriteModule_Active_Bank1E_bounce        ; 0x9E - HAUNTED GROVE OSTRITCH
#_0693C1: dw SpriteModule_Active_Bank1E_bounce        ; 0x9F - HAUNTED GROVE RABBIT
#_0693C3: dw SpriteModule_Active_Bank1E_bounce        ; 0xA0 - HAUNTED GROVE BIRD
#_0693C5: dw SpriteModule_Active_Bank1E_bounce        ; 0xA1 - FREEZOR
#_0693C7: dw SpriteModule_Active_Bank1E_bounce        ; 0xA2 - KHOLDSTARE
#_0693C9: dw SpriteModule_Active_Bank1E_bounce        ; 0xA3 - KHOLDSTARE SHELL
#_0693CB: dw SpriteModule_Active_Bank1E_bounce        ; 0xA4 - FALLING ICE
#_0693CD: dw SpriteModule_Active_Bank1E_bounce        ; 0xA5 - BLUE ZAZAK
#_0693CF: dw SpriteModule_Active_Bank1E_bounce        ; 0xA6 - RED ZAZAK
#_0693D1: dw SpriteModule_Active_Bank1E_bounce        ; 0xA7 - STALFOS
#_0693D3: dw SpriteModule_Active_Bank1E_bounce        ; 0xA8 - GREEN ZIRRO
#_0693D5: dw SpriteModule_Active_Bank1E_bounce        ; 0xA9 - BLUE ZIRRO
#_0693D7: dw SpriteModule_Active_Bank1E_bounce        ; 0xAA - PIKIT
#_0693D9: dw SpriteModule_Active_Bank1E_bounce        ; 0xAB - CRYSTAL MAIDEN
#_0693DB: dw SpriteModule_Active_Bank1E_bounce        ; 0xAC - APPLE
#_0693DD: dw SpriteModule_Active_Bank1E_bounce        ; 0xAD - OLD MAN
#_0693DF: dw SpriteModule_Active_Bank1E_bounce        ; 0xAE - PIPE DOWN
#_0693E1: dw SpriteModule_Active_Bank1E_bounce        ; 0xAF - PIPE UP
#_0693E3: dw SpriteModule_Active_Bank1E_bounce        ; 0xB0 - PIPE RIGHT
#_0693E5: dw SpriteModule_Active_Bank1E_bounce        ; 0xB1 - PIPE LEFT
#_0693E7: dw SpriteModule_Active_Bank1E_bounce        ; 0xB2 - GOOD BEE
#_0693E9: dw SpriteModule_Active_Bank1E_bounce        ; 0xB3 - PEDESTAL PLAQUE
#_0693EB: dw SpriteModule_Active_Bank1E_bounce        ; 0xB4 - PURPLE CHEST
#_0693ED: dw SpriteModule_Active_Bank1E_bounce        ; 0xB5 - BOMB SHOP GUY
#_0693EF: dw SpriteModule_Active_Bank1E_bounce        ; 0xB6 - KIKI
#_0693F1: dw SpriteModule_Active_Bank1E_bounce        ; 0xB7 - BLIND MAIDEN
#_0693F3: dw SpriteModule_Active_Bank1E_bounce        ; 0xB8 - DIALOGUE TESTER
#_0693F5: dw SpriteModule_Active_Bank1E_bounce        ; 0xB9 - BULLY / PINK BALL
#_0693F7: dw SpriteModule_Active_Bank1E_bounce        ; 0xBA - WHIRLPOOL
#_0693F9: dw SpriteModule_Active_Bank1E_bounce        ; 0xBB - SHOPKEEPER / CHEST GAME GUY
#_0693FB: dw SpriteModule_Active_Bank1E_bounce        ; 0xBC - DRUNKARD
#_0693FD: dw SpriteModule_Active_Bank1D_bounce        ; 0xBD - VITREOUS
#_0693FF: dw SpriteModule_Active_Bank1D_bounce        ; 0xBE - VITREOUS SMALL EYE
#_069401: dw SpriteModule_Active_Bank1D_bounce        ; 0xBF - LIGHTNING
#_069403: dw SpriteModule_Active_Bank1D_bounce        ; 0xC0 - CATFISH
#_069405: dw SpriteModule_Active_Bank1D_bounce        ; 0xC1 - CUTSCENE AGAHNIM
#_069407: dw SpriteModule_Active_Bank1D_bounce        ; 0xC2 - BOULDER
#_069409: dw SpriteModule_Active_Bank1D_bounce        ; 0xC3 - GIBO
#_06940B: dw SpriteModule_Active_Bank1D_bounce        ; 0xC4 - THIEF
#_06940D: dw SpriteModule_Active_Bank1D_bounce        ; 0xC5 - MEDUSA
#_06940F: dw SpriteModule_Active_Bank1D_bounce        ; 0xC6 - 4WAY SHOOTER
#_069411: dw SpriteModule_Active_Bank1D_bounce        ; 0xC7 - POKEY
#_069413: dw SpriteModule_Active_Bank1D_bounce        ; 0xC8 - BIG FAIRY
#_069415: dw SpriteModule_Active_Bank1D_bounce        ; 0xC9 - TEKTITE / FIREBAT
#_069417: dw SpriteModule_Active_Bank1D_bounce        ; 0xCA - CHAIN CHOMP
#_069419: dw SpriteModule_Active_Bank1D_bounce        ; 0xCB - TRINEXX ROCK HEAD
#_06941B: dw SpriteModule_Active_Bank1D_bounce        ; 0xCC - TRINEXX FIRE HEAD
#_06941D: dw SpriteModule_Active_Bank1D_bounce        ; 0xCD - TRINEXX ICE HEAD
#_06941F: dw SpriteModule_Active_Bank1D_bounce        ; 0xCE - BLIND
#_069421: dw SpriteModule_Active_Bank1D_bounce        ; 0xCF - SWAMOLA
#_069423: dw SpriteModule_Active_Bank1D_bounce        ; 0xD0 - LYNEL
#_069425: dw SpriteModule_Active_Bank1D_bounce        ; 0xD1 - BUNNYBEAM / SMOKE
#_069427: dw SpriteModule_Active_Bank1D_bounce        ; 0xD2 - FLOPPING FISH
#_069429: dw SpriteModule_Active_Bank1D_bounce        ; 0xD3 - STAL
#_06942B: dw SpriteModule_Active_Bank1D_bounce        ; 0xD4 - LANDMINE
#_06942D: dw SpriteModule_Active_Bank1D_bounce        ; 0xD5 - DIG GAME GUY
#_06942F: dw SpriteModule_Active_Bank1D_bounce        ; 0xD6 - GANON
#_069431: dw SpriteModule_Active_Bank1D_bounce        ; 0xD7 - GANON
#_069433: dw Sprite_D8_Heart                          ; 0xD8 - HEART
#_069435: dw Sprite_D9_GreenRupee                     ; 0xD9 - GREEN RUPEE
#_069437: dw Sprite_DA_BlueRupee                      ; 0xDA - BLUE RUPEE
#_069439: dw Sprite_DB_RedRupee                       ; 0xDB - RED RUPEE
#_06943B: dw Sprite_DC_BombRefill1                    ; 0xDC - BOMB REFILL 1
#_06943D: dw Sprite_DD_BombRefill4                    ; 0xDD - BOMB REFILL 4
#_06943F: dw Sprite_DE_BombRefill8                    ; 0xDE - BOMB REFILL 8
#_069441: dw Sprite_DF_SmallMagicDecanter             ; 0xDF - SMALL MAGIC DECANTER
#_069443: dw Sprite_E0_LargeMagicDecanter             ; 0xE0 - LARGE MAGIC DECANTER
#_069445: dw Sprite_E1_ArrowRefill5                   ; 0xE1 - ARROW REFILL 5
#_069447: dw Sprite_E2_ArrowRefill10                  ; 0xE2 - ARROW REFILL 10
#_069449: dw Sprite_E3_Fairy                          ; 0xE3 - FAIRY
#_06944B: dw Sprite_E4_SmallKey                       ; 0xE4 - SMALL KEY
#_06944D: dw Sprite_E5_BigKey                         ; 0xE5 - BIG KEY
#_06944F: dw Sprite_E6_StolenShield                   ; 0xE6 - STOLEN SHIELD
#_069451: dw Sprite_E7_Mushroom_bounce                ; 0xE7 - MUSHROOM
#_069453: dw Sprite_E8_FakeMasterSword_bounce         ; 0xE8 - FAKE MASTER SWORD
#_069455: dw Sprite_E9_MagicShopAssistant_bounce      ; 0xE9 - MAGIC SHOP ASSISTANT
#_069457: dw Sprite_EA_HeartContainer_bounce          ; 0xEA - HEART CONTAINER
#_069459: dw Sprite_EB_HeartPiece_bounce              ; 0xEB - HEART PIECE
#_06945B: dw Sprite_EC_ThrownItem                     ; 0xEC - THROWN ITEM
#_06945D: dw SomariaPlatformAndPipe_bounce            ; 0xED - SOMARIA PLATFORM
#_06945F: dw Sprite_EE_CastleMantle_bounce            ; 0xEE - CASTLE MANTLE
#_069461: dw SomariaPlatformAndPipe_bounce            ; 0xEF - UNUSED SOMARIA PLATFORM
#_069463: dw SomariaPlatformAndPipe_bounce            ; 0xF0 - UNUSED SOMARIA PLATFORM
#_069465: dw SomariaPlatformAndPipe_bounce            ; 0xF1 - UNUSED SOMARIA PLATFORM
#_069467: dw Sprite_F2_MedallionTablet_bounce         ; 0xF2 - MEDALLION TABLET

;===================================================================================================

Sprite_09_Moldorm_bounce:
#_069469: JSL Sprite_09_Moldorm

#_06946D: RTS

;===================================================================================================

Sprite_00_Raven_bounce:
#_06946E: JSL Sprite_00_Raven

#_069472: RTS

;===================================================================================================

Sprite_01_Vulture_bounce:
#_069473: JSL Sprite_01_Vulture

#_069477: RTS

;===================================================================================================

pool Sprite_27_Deadrock

.anim_step
#_069478: db $00, $01, $00, $01
#_06947C: db $02, $02, $03, $03
#_069480: db $04

.flip
#_069481: db $40, $40, $00, $00
#_069485: db $00, $40, $00, $40
#_069489: db $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_27_Deadrock:
#_06948A: LDA.w $0E10,X
#_06948D: BEQ .not_stunned

#_06948F: AND.b #$04
#_069491: BNE .normal

.stunned
#_069493: LDY.b #$08
#_069495: BRA .continue

.not_stunned
#_069497: LDA.w $0D80,X
#_06949A: CMP.b #$02
#_06949C: BEQ .stunned

.normal
#_06949E: LDY.w $0D90,X

;---------------------------------------------------------------------------------------------------

.continue
#_0694A1: LDA.w .anim_step,Y
#_0694A4: STA.w $0DC0,X

#_0694A7: LDA.w $0F50,X
#_0694AA: AND.b #$BF
#_0694AC: ORA.w .flip,Y
#_0694AF: STA.w $0F50,X

#_0694B2: JSR SpriteDraw_SingleLarge
#_0694B5: JSR Sprite_CheckIfActive_Bank06

#_0694B8: LDA.w $0EA0,X
#_0694BB: BNE .no_sfx_or_damage

#_0694BD: JSR Sprite_CheckDamageFromLink
#_0694C0: BCC .no_sfx_or_damage

#_0694C2: LDA.w $012E
#_0694C5: BNE .no_sfx_or_damage

#_0694C7: LDA.b #$0B ; SFX2.0B
#_0694C9: JSL SpriteSFX_QueueSFX2WithPan

.no_sfx_or_damage
#_0694CD: JSR Sprite_CheckDamageToLink_same_layer
#_0694D0: BCC .no_contact

#_0694D2: JSL Sprite_CancelHookshot
#_0694D6: JSL Sprite_RepelDash_long

.no_contact
#_0694DA: LDA.w $0EA0,X
#_0694DD: CMP.b #$0E
#_0694DF: BNE .dont_get_stunned

#_0694E1: LDA.b #$02
#_0694E3: STA.w $0D80,X

#_0694E6: LDA.b #$FF
#_0694E8: STA.w $0E00,X

#_0694EB: LDA.b #$40
#_0694ED: STA.w $0E10,X

;---------------------------------------------------------------------------------------------------

.dont_get_stunned
#_0694F0: JSR Sprite_CheckIfRecoiling_Bank06

#_0694F3: LDA.w $0D80,X
#_0694F6: JSL JumpTableLocal
#_0694FA: dw Deadrock_Halted
#_0694FC: dw Deadrock_Walk
#_0694FE: dw Deadrock_Stunned

;===================================================================================================

DeadRockSpeedX:
#_069500: db  32, -32 ; bleeds into next

DeadRockSpeedY:
#_069502: db   0,   0,  32, -32

;===================================================================================================

Deadrock_Halted:
#_069506: LDA.w $0DF0,X
#_069509: BNE EXIT_069558

#_06950B: ASL.w $0E40,X
#_06950E: LSR.w $0E40,X

#_069511: LDA.w $0CAA,X
#_069514: AND.b #$FB
#_069516: STA.w $0CAA,X

#_069519: LDA.w $0E60,X
#_06951C: AND.b #$BF
#_06951E: STA.w $0E60,X

#_069521: INC.w $0D80,X

#_069524: JSL GetRandomNumber
#_069528: AND.b #$1F
#_06952A: ADC.b #$20
#_06952C: STA.w $0DF0,X

#_06952F: INC.w $0DA0,X

#_069532: LDA.w $0DA0,X
#_069535: CMP.b #$04
#_069537: BNE .use_random_direction

#_069539: STZ.w $0DA0,X

#_06953C: JSR Sprite_DirectionToFaceLink
#_06953F: TYA

#_069540: BRA DeadRock_SetSpeed

.use_random_direction
#_069542: JSL GetRandomNumber
#_069546: AND.b #$03

;===================================================================================================

DeadRock_SetSpeed:
#_069548: STA.w $0DE0,X

#_06954B: TAY

#_06954C: LDA.w DeadRockSpeedX,Y
#_06954F: STA.w $0D50,X

#_069552: LDA.w DeadRockSpeedY,Y
#_069555: STA.w $0D40,X

;---------------------------------------------------------------------------------------------------

#EXIT_069558:
#_069558: RTS

;===================================================================================================

Deadrock_Walk:
#_069559: LDA.w $0DF0,X
#_06955C: BNE .delay

#_06955E: STZ.w $0D80,X

#_069561: LDA.b #$20
#_069563: STA.w $0DF0,X

#_069566: RTS

.delay
#_069567: JSR Sprite_Move_XY_Bank06
#_06956A: JSR Sprite_CheckTileCollision

#_06956D: LDA.w $0E70,X
#_069570: BEQ .no_collision

#_069572: LDA.w $0DE0,X
#_069575: EOR.b #$01

#_069577: BRA DeadRock_SetSpeed

.no_collision
#_069579: INC.w $0E80,X

#_06957C: LDA.w $0E80,X
#_06957F: LSR A
#_069580: LSR A
#_069581: AND.b #$01
#_069583: STA.b $00

#_069585: LDA.w $0DE0,X
#_069588: ASL A
#_069589: ORA.b $00
#_06958B: STA.w $0D90,X

#_06958E: RTS

;===================================================================================================

Deadrock_Stunned:
#_06958F: LDA.w $0E40,X
#_069592: ORA.b #$80
#_069594: STA.w $0E40,X

#_069597: LDA.w $0CAA,X
#_06959A: ORA.b #$04
#_06959C: STA.w $0CAA,X

#_06959F: LDA.w $0E60,X
#_0695A2: ORA.b #$40
#_0695A4: STA.w $0E60,X

#_0695A7: LDA.b $1A
#_0695A9: AND.b #$01
#_0695AB: BNE .resist_timer

#_0695AD: LDA.w $0E00,X
#_0695B0: BNE .delay

#_0695B2: STZ.w $0D80,X

#_0695B5: LDA.b #$10
#_0695B7: STA.w $0DF0,X

#_0695BA: RTS

.delay
#_0695BB: CMP.b #$20
#_0695BD: BNE .exit

#_0695BF: LDA.b #$40
#_0695C1: STA.w $0E10,X

.exit
#_0695C4: RTS

.resist_timer
#_0695C5: INC.w $0E00,X

#_0695C8: RTS

;===================================================================================================

pool Sprite_20_Sluggula

.anim_step
#_0695C9: db $00, $01, $00, $01
#_0695CD: db $02, $03, $04, $05

.flip
#_0695D1: db $40, $40, $00, $00
#_0695D5: db $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_20_Sluggula:
#_0695D9: LDA.w $0E80,X
#_0695DC: AND.b #$08
#_0695DE: LSR A
#_0695DF: LSR A
#_0695E0: LSR A
#_0695E1: STA.b $00

#_0695E3: LDA.w $0DE0,X
#_0695E6: ASL A
#_0695E7: ORA.b $00
#_0695E9: TAY

#_0695EA: LDA.w .anim_step,Y
#_0695ED: STA.w $0DC0,X

#_0695F0: LDA.w $0F50,X
#_0695F3: AND.b #$BF
#_0695F5: ORA.w .flip,Y
#_0695F8: STA.w $0F50,X

#_0695FB: JSR SpriteDraw_SingleLarge
#_0695FE: JSR Sprite_CheckIfActive_Bank06
#_069601: JSR Sprite_CheckIfRecoiling_Bank06
#_069604: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_069607: INC.w $0E80,X

#_06960A: LDA.w $0D80,X
#_06960D: JSL JumpTableLocal
#_069611: dw Sluggula_Normal
#_069613: dw Sluggula_BreakFromBombing

;===================================================================================================

SluggulaAndMoblin_SpeedX:
#_069615: db  16, -16 ; bleeds into next

SluggulaAndMoblin_SpeedY:
#_069617: db   0,   0,  16, -16

;===================================================================================================

Sluggula_Normal:
#_06961B: LDA.w $0DF0,X
#_06961E: BNE .delay

#_069620: INC.w $0D80,X

#_069623: JSL GetRandomNumber
#_069627: AND.b #$1F
#_069629: ADC.b #$20
#_06962B: STA.w $0DF0,X

#_06962E: AND.b #$03
#_069630: STA.w $0DE0,X

;===================================================================================================

#Sluggula_SetSpeed:
#_069633: TAY

#_069634: LDA.w SluggulaAndMoblin_SpeedX,Y
#_069637: STA.w $0D50,X

#_06963A: LDA.w SluggulaAndMoblin_SpeedY,Y
#_06963D: STA.w $0D40,X

#_069640: RTS

;===================================================================================================

.delay
#_069641: CMP.b #$10
#_069643: BNE EXIT_069672

#_069645: JSL GetRandomNumber
#_069649: LSR A
#_06964A: BCS EXIT_069672

#_06964C: JMP.w Sluggula_DropBomb

;===================================================================================================

Sluggula_BreakFromBombing:
#_06964F: LDA.w $0DF0,X
#_069652: BNE .delay

#_069654: STZ.w $0D80,X

#_069657: LDA.b #$20
#_069659: STA.w $0DF0,X

.delay
#_06965C: JSR Sprite_Move_XY_Bank06
#_06965F: JSR Sprite_CheckTileCollision

#_069662: LDA.w $0E70,X
#_069665: BEQ EXIT_069672

#_069667: LDA.w $0DE0,X
#_06966A: EOR.b #$01
#_06966C: STA.w $0DE0,X

#_06966F: JMP.w Sluggula_SetSpeed

;---------------------------------------------------------------------------------------------------

#EXIT_069672:
#_069672: RTS

;===================================================================================================

Sluggula_DropBomb:
#_069673: LDA.b #$4A ; SPRITE 4A
#_069675: LDY.b #$0B
#_069677: JSL Sprite_SpawnDynamically_slot_limited
#_06967B: BMI .no_space

#_06967D: JSL Sprite_SetSpawnedCoordinates
#_069681: JSL Sprite_TransmuteToBomb

.no_space
#_069685: RTS

;===================================================================================================

pool Sprite_19_Poe

.hflip
#_069686: db $40, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_19_Poe:
#_069688: LDA.w $0D50,X
#_06968B: ASL A
#_06968C: ROL A
#_06968D: AND.b #$01
#_06968F: STA.w $0DE0,X

#_069692: TAY

#_069693: LDA.w $0F50,X
#_069696: AND.b #$BF
#_069698: ORA.w .hflip,Y
#_06969B: STA.w $0F50,X

#_06969E: LDA.w $0E90,X
#_0696A1: BNE .keep_priority

#_0696A3: LDA.w $0B89,X
#_0696A6: ORA.b #$30
#_0696A8: STA.w $0B89,X

;---------------------------------------------------------------------------------------------------

.keep_priority
#_0696AB: JSR SpriteDraw_Poe

#_0696AE: REP #$20

#_0696B0: LDA.b $90
#_0696B2: CLC
#_0696B3: ADC.w #$0004
#_0696B6: STA.b $90

#_0696B8: INC.b $92

#_0696BA: SEP #$20

#_0696BC: DEC.w $0E40,X

#_0696BF: JSR SpriteDraw_SingleLarge

#_0696C2: INC.w $0E40,X

;---------------------------------------------------------------------------------------------------

#_0696C5: JSR Sprite_CheckIfActive_Bank06
#_0696C8: JSR Sprite_CheckIfRecoiling_Bank06

#_0696CB: LDA.w $0E90,X
#_0696CE: BEQ Poe_Main

#_0696D0: INC.w $0F70,X

#_0696D3: LDA.w $0F70,X
#_0696D6: CMP.b #$0C
#_0696D8: BNE .exit

#_0696DA: STZ.w $0E90,X

.exit
#_0696DD: RTS

;===================================================================================================

Poe_Main:
#_0696DE: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_0696E1: INC.w $0E80,X

#_0696E4: JSR Sprite_Move_XY_Bank06

#_0696E7: LDA.b $1A
#_0696E9: LSR A
#_0696EA: BCS .continue

#_0696EC: LDA.w $0ED0,X
#_0696EF: AND.b #$01
#_0696F1: TAY

#_0696F2: LDA.w $0F80,X
#_0696F5: CLC
#_0696F6: ADC.w Poe_SpeedZ,Y
#_0696F9: STA.w $0F80,X

#_0696FC: CMP.w Poe_MaxZ,Y
#_0696FF: BNE .continue

#_069701: INC.w $0ED0,X

.continue
#_069704: JSR Sprite_Move_Z_Bank06

#_069707: STZ.w $0D40,X

#_06970A: LDA.w $0D80,X
#_06970D: JSL JumpTableLocal
#_069711: dw Poe_Pondering
#_069713: dw Poe_SpookAround

;===================================================================================================

Poe_SpeedZ:
#_069715: db   1,  -1
#_069717: db   2,  -2

;===================================================================================================

Poe_MaxSpeedX:
#_069719: db  16, -16
#_06971B: db  28, -28

;===================================================================================================

Poe_MaxZ:
#_06971D: db   8,  -8

;===================================================================================================

Poe_Pondering:
#_06971F: LDA.w $0DF0,X
#_069722: BNE .exit

#_069724: INC.w $0D80,X

#_069727: JSL GetRandomNumber
#_06972B: AND.b #$0C
#_06972D: BNE .use_random_direction

#_06972F: JSR Sprite_IsBelowLink

#_069732: TYA
#_069733: BRA .continue

.use_random_direction
#_069735: JSL GetRandomNumber
#_069739: AND.b #$01

.continue
#_06973B: STA.w $0EB0,X

.exit
#_06973E: RTS

;===================================================================================================

Poe_MaxSpeedY:
#_06973F: db   8,  -8

;===================================================================================================

Poe_SpookAround:
#_069741: LDA.w $001A
#_069744: LSR A
#_069745: BCS .continue

#_069747: LDA.w $0EC0,X
#_06974A: AND.b #$01

#_06974C: CLC
#_06974D: ADC.w $0FFF
#_069750: ADC.w $0FFF
#_069753: TAY

#_069754: LDA.w $0D50,X
#_069757: CLC
#_069758: ADC.w Poe_SpeedZ,Y
#_06975B: STA.w $0D50,X

#_06975E: CMP.w Poe_MaxSpeedX,Y
#_069761: BNE .continue

#_069763: INC.w $0EC0,X

#_069766: STZ.w $0D80,X

#_069769: JSL GetRandomNumber
#_06976D: AND.b #$1F
#_06976F: ADC.b #$10
#_069771: STA.w $0DF0,X

.continue
#_069774: LDY.w $0EB0,X

#_069777: LDA.w Poe_MaxSpeedY,Y
#_06977A: STA.w $0D40,X

#_06977D: RTS

;===================================================================================================

pool SpriteDraw_Poe

.offset_x
#_06977E: db   9,   0,  -1,  -1

.char
#_069782: db $7C, $80, $B7, $80

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Poe:
#_069786: JSR Sprite_PrepOAMCoord

#_069789: LDA.w $0E80,X

#_06978C: LSR A
#_06978D: LSR A
#_06978E: LSR A

#_06978F: AND.b #$03
#_069791: STA.b $06

#_069793: LDA.w $0DE0,X
#_069796: ASL A

#_069797: PHX

#_069798: TAX

#_069799: REP #$20

#_06979B: LDA.b $00
#_06979D: CLC
#_06979E: ADC.w .offset_x,X
#_0697A1: STA.b ($90),Y

#_0697A3: CLC
#_0697A4: AND.w #$0100
#_0697A7: STA.b $0E

#_0697A9: LDA.b $02
#_0697AB: CLC
#_0697AC: ADC.w #$0009

#_0697AF: INY
#_0697B0: STA.b ($90),Y

#_0697B2: CLC
#_0697B3: ADC.w #$0010
#_0697B6: CMP.w #$0100

#_0697B9: SEP #$20
#_0697BB: BCC .on_screen

#_0697BD: LDA.b #$F0
#_0697BF: STA.b ($90),Y

.on_screen
#_0697C1: LDX.b $06

#_0697C3: LDA.w .char,X
#_0697C6: INY
#_0697C7: STA.b ($90),Y

#_0697C9: LDA.b $05
#_0697CB: AND.b #$F0
#_0697CD: ORA.b #$02

#_0697CF: INY
#_0697D0: STA.b ($90),Y

#_0697D2: LDA.b $0F
#_0697D4: STA.b ($92)

#_0697D6: PLX

#_0697D7: RTS

;===================================================================================================

pool Sprite_18_MiniMoldorm

.speed_x
#_0697D8: db  24,  22,  17,   9,   0,  -9, -17, -22
#_0697E0: db -24, -22, -17,  -9,   0,   9,  17,  22

.speed_y
#_0697E8: db   0,   9,  17,  22,  24,  22,  17,   9
#_0697F0: db   0,  -9, -17, -22, -24, -22, -17,  -9

.direction
#_0697F8: db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
#_069800: db $00, $01, $02, $03, $04, $05, $06, $07

pool off

;---------------------------------------------------------------------------------------------------

Sprite_18_MiniMoldorm:
#_069808: JSL SpriteDraw_MiniMoldorm
#_06980C: JSR Sprite_CheckIfActive_Bank06

#_06980F: LDA.w $0EA0,X
#_069812: BEQ .not_recoiling

#_069814: JSR SpritePrep_MiniMoldorm_bounce

.not_recoiling
#_069817: JSR Sprite_CheckIfRecoiling_Bank06
#_06981A: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06981D: INC.w $0E80,X

#_069820: LDY.w $0DE0,X

#_069823: LDA.w .speed_x,Y
#_069826: STA.w $0D50,X

#_069829: LDA.w .speed_y,Y
#_06982C: STA.w $0D40,X

#_06982F: JSR Sprite_Move_XY_Bank06
#_069832: JSR Sprite_CheckTileCollision

#_069835: LDA.w $0E70,X
#_069838: BEQ .no_tile_collision

#_06983A: JSL GetRandomNumber
#_06983E: LSR A
#_06983F: BCC .dont_flip

#_069841: LDA.w $0EB0,X
#_069844: EOR.b #$FF
#_069846: INC A
#_069847: STA.w $0EB0,X

.dont_flip
#_06984A: LDY.w $0DE0,X

#_06984D: LDA.w .direction,Y
#_069850: STA.w $0DE0,X

.no_tile_collision
#_069853: LDA.w $0D80,X
#_069856: JSL JumpTableLocal
#_06985A: dw MiniMoldorm_Readjust
#_06985C: dw MiniMoldorm_Meander
#_06985E: dw MiniMoldorm_TargetLink

;===================================================================================================

MiniMoldorm_Readjust:
#_069860: LDA.w $0DF0,X
#_069863: BNE .exit

#_069865: INC A

#_069866: INC.w $0ED0,X

#_069869: LDY.w $0ED0,X
#_06986C: CPY.b #$06
#_06986E: BNE .dont_target_link

#_069870: STZ.w $0ED0,X

#_069873: INC A

.dont_target_link
#_069874: STA.w $0D80,X

#_069877: JSL GetRandomNumber
#_06987B: AND.b #$02
#_06987D: DEC A
#_06987E: STA.w $0EB0,X

#_069881: JSL GetRandomNumber
#_069885: AND.b #$1F
#_069887: ADC.b #$20
#_069889: STA.w $0DF0,X

.exit
#_06988C: RTS

;===================================================================================================

MiniMoldorm_Meander:
#_06988D: LDA.w $0DF0,X
#_069890: BNE .delay

#_069892: JSL GetRandomNumber
#_069896: AND.b #$0F
#_069898: ADC.b #$08
#_06989A: STA.w $0DF0,X

#_06989D: STZ.w $0D80,X

#_0698A0: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_0698A1: AND.b #$03
#_0698A3: BNE .exit

#_0698A5: LDA.w $0DE0,X
#_0698A8: CLC
#_0698A9: ADC.w $0EB0,X
#_0698AC: AND.b #$0F
#_0698AE: STA.w $0DE0,X

.exit
#_0698B1: RTS

;===================================================================================================

MiniMoldorm_TargetLink:
#_0698B2: TXA
#_0698B3: EOR.b $1A
#_0698B5: AND.b #$03
#_0698B7: BNE .exit

#_0698B9: LDA.b #$1F
#_0698BB: JSR Sprite_ApplySpeedTowardsLink
#_0698BE: JSL Sprite_ConvertVelocityToAngle

#_0698C2: CMP.w $0DE0,X
#_0698C5: BNE .not_at_target

#_0698C7: STZ.w $0D80,X

#_0698CA: LDA.b #$30
#_0698CC: STA.w $0DF0,X

#_0698CF: RTS

;---------------------------------------------------------------------------------------------------

.not_at_target
#_0698D0: PHP

#_0698D1: LDA.w $0DE0,X

#_0698D4: PLP
#_0698D5: BMI .decrease_angle

#_0698D7: INC A
#_0698D8: INC A

.decrease_angle
#_0698D9: DEC A
#_0698DA: AND.b #$0F
#_0698DC: STA.w $0DE0,X

.exit
#_0698DF: RTS

;===================================================================================================

Moblin_Directions:
#_0698E0: db $06, $04, $00, $02

;===================================================================================================

Sprite_12_Moblin:
#_0698E4: JSR SpriteDraw_Moblin

#_0698E7: JSR Sprite_CheckIfActive_Bank06
#_0698EA: JSR Sprite_CheckIfRecoiling_Bank06
#_0698ED: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_0698F0: JSR Sprite_Move_XY_Bank06
#_0698F3: JSR Sprite_CheckTileCollision

#_0698F6: LDA.w $0D80,X
#_0698F9: JSL JumpTableLocal
#_0698FD: dw Moblin_Halted
#_0698FF: dw Moblin_Walk
#_069901: dw Moblin_ThrowSpear

;===================================================================================================

pool Moblin_Halted

.timer
#_069903: db  16,  32,  48,  64

pool off

;---------------------------------------------------------------------------------------------------

Moblin_Halted:
#_069907: LDA.w $0DF0,X
#_06990A: BNE .exit

#_06990C: JSL GetRandomNumber
#_069910: AND.b #$03
#_069912: TAY

#_069913: LDA.w .timer,Y
#_069916: STA.w $0DF0,X

#_069919: INC.w $0D80,X

#_06991C: LDA.w $0EB0,X
#_06991F: STA.w $0DE0,X

#_069922: TAY

#_069923: LDA.w SluggulaAndMoblin_SpeedX,Y
#_069926: STA.w $0D50,X

#_069929: LDA.w SluggulaAndMoblin_SpeedY,Y
#_06992C: STA.w $0D40,X

.exit
#_06992F: RTS

;===================================================================================================

pool Moblin_Walk_head

.direction
#_069930: db $02, $03 ; right
#_069932: db $02, $03 ; left
#_069934: db $00, $01 ; down
#_069936: db $00, $01 ; up

pool off

;---------------------------------------------------------------------------------------------------

Moblin_Walk:
#_069938: LDA.w $0E80,X
#_06993B: AND.b #$01

#_06993D: LDY.w $0DE0,X

#_069940: CLC
#_069941: ADC.w Moblin_Directions,Y
#_069944: STA.w $0DC0,X

#_069947: LDA.b #$0C
#_069949: LDY.w $0E70,X
#_06994C: BNE .no_tile_collision

#_06994E: LDA.w $0DF0,X
#_069951: BNE .delay

#_069953: JSR Sprite_DirectionToFaceLink

#_069956: TYA
#_069957: CMP.w $0DE0,X
#_06995A: BNE .dont_stop

#_06995C: INC.w $0D80,X

#_06995F: LDA.b #$20
#_069961: STA.w $0DF0,X

#_069964: BRA .stop

.dont_stop
#_069966: LDA.b #$10

;---------------------------------------------------------------------------------------------------

.no_tile_collision
#_069968: STA.w $0DF0,X

#_06996B: JSL GetRandomNumber
#_06996F: AND.b #$01
#_069971: STA.b $00

#_069973: LDA.w $0DE0,X
#_069976: ASL A
#_069977: ORA.b $00
#_069979: TAY

#_06997A: LDA.w .head_direction,Y
#_06997D: STA.w $0EB0,X

#_069980: STZ.w $0D80,X

#_069983: INC.w $0DB0,X

#_069986: LDA.w $0DB0,X
#_069989: CMP.b #$04
#_06998B: BNE .stop

#_06998D: STZ.w $0DB0,X

#_069990: JSR Sprite_DirectionToFaceLink

#_069993: TYA
#_069994: STA.w $0EB0,X

;---------------------------------------------------------------------------------------------------

.stop
#_069997: JSR Sprite_ZeroVelocity_XYZ_Bank06

#_06999A: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_06999B: DEC.w $0E90,X
#_06999E: BPL .exit

#_0699A0: LDA.b #$0B
#_0699A2: STA.w $0E90,X

#_0699A5: INC.w $0E80,X

.exit
#_0699A8: RTS

;===================================================================================================

pool Moblin_ThrowSpear

.anim_step
#_0699A9: db $0B, $0A, $08, $09
#_0699AD: db $07, $05, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

Moblin_ThrowSpear:
#_0699B1: LDY.w $0DE0,X

#_0699B4: LDA.w $0DF0,X
#_0699B7: BNE .delay

#_0699B9: STZ.w $0D80,X

.delay
#_0699BC: CMP.b #$10
#_0699BE: BCS .animate

#_0699C0: CMP.b #$0F
#_0699C2: BNE .dont_throw

#_0699C4: PHY
#_0699C5: JSR Moblin_MaterializeSpear
#_0699C8: PLY

#_0699C9: LDA.b #$20
#_0699CB: STA.w $0E00,X

.dont_throw
#_0699CE: INY
#_0699CF: INY
#_0699D0: INY
#_0699D1: INY

.animate
#_0699D2: LDA.w .anim_step,Y
#_0699D5: STA.w $0DC0,X

#_0699D8: RTS

;===================================================================================================

pool Moblin_MaterializeSpear

.offset_x_low
#_0699D9: db  11,  -2,  -3,  11

.offset_y_low
#_0699DD: db  -3,  -3,   3, -11

.offset_y_high
#_0699E1: db  -1,  -1,   0,  -1

.speed_x
#_0699E5: db  32, -32 ; bleeds into next

.speed_y
#_0699E7: db   0,   0,  32, -32

pool off

;---------------------------------------------------------------------------------------------------

Moblin_MaterializeSpear:
#_0699EB: LDA.b #$1B ; SPRITE 1B
#_0699ED: JSL Sprite_SpawnDynamically
#_0699F1: BMI .no_space

#_0699F3: LDA.b #$03
#_0699F5: STA.w $0D90,Y

#_0699F8: PHX

#_0699F9: LDA.w $0DE0,X
#_0699FC: STA.w $0DE0,Y

#_0699FF: TAX

#_069A00: LDA.b $00
#_069A02: CLC
#_069A03: ADC.w .offset_x_low,X
#_069A06: STA.w $0D10,Y

#_069A09: LDA.b $01
#_069A0B: ADC.w Hinox_ThrowBomb_offset_x_high,X
#_069A0E: STA.w $0D30,Y

#_069A11: LDA.b $02
#_069A13: CLC
#_069A14: ADC.w .offset_y_low,X
#_069A17: STA.w $0D00,Y

#_069A1A: LDA.b $03
#_069A1C: ADC.w .offset_y_high,X
#_069A1F: STA.w $0D20,Y

#_069A22: LDA.w .speed_x,X
#_069A25: STA.w $0D50,Y

#_069A28: LDA.w .speed_y,X
#_069A2B: STA.w $0D40,Y

#_069A2E: PLX

.no_space
#_069A2F: RTS

;===================================================================================================

pool SpriteDraw_Moblin

.oam_groups
#_069A30: dw  -2,   3 : db $91, $80, $00, $00
#_069A38: dw  -2,  11 : db $90, $80, $00, $00
#_069A40: dw   0, -10 : db $86, $00, $00, $02
#_069A48: dw   0,   0 : db $8A, $00, $00, $02

#_069A50: dw  -2,   7 : db $91, $80, $00, $00
#_069A58: dw  -2,  15 : db $90, $80, $00, $00
#_069A60: dw   0, -10 : db $86, $00, $00, $02
#_069A68: dw   0,   0 : db $8A, $40, $00, $02

#_069A70: dw   0,  -9 : db $84, $00, $00, $02
#_069A78: dw   0,   0 : db $A0, $00, $00, $02
#_069A80: dw  11,  -5 : db $90, $00, $00, $00
#_069A88: dw  11,   3 : db $91, $00, $00, $00

#_069A90: dw   0,  -9 : db $84, $00, $00, $02
#_069A98: dw   0,   0 : db $A0, $40, $00, $02
#_069AA0: dw  11,  -8 : db $90, $00, $00, $00
#_069AA8: dw  11,   0 : db $91, $00, $00, $00

#_069AB0: dw  -4,   8 : db $80, $00, $00, $00
#_069AB8: dw   4,   8 : db $81, $00, $00, $00
#_069AC0: dw   0,  -9 : db $88, $00, $00, $02
#_069AC8: dw   0,   0 : db $A6, $00, $00, $02

#_069AD0: dw  -9,   6 : db $80, $00, $00, $00
#_069AD8: dw  -1,   6 : db $81, $00, $00, $00
#_069AE0: dw   0,  -8 : db $88, $00, $00, $02
#_069AE8: dw   0,   0 : db $A4, $00, $00, $02

#_069AF0: dw  12,   8 : db $80, $40, $00, $00
#_069AF8: dw   4,   8 : db $81, $40, $00, $00
#_069B00: dw   0,  -9 : db $88, $40, $00, $02
#_069B08: dw   0,   0 : db $A6, $40, $00, $02

#_069B10: dw  17,   6 : db $80, $40, $00, $00
#_069B18: dw   9,   6 : db $81, $40, $00, $00
#_069B20: dw   0,  -8 : db $88, $40, $00, $02
#_069B28: dw   0,   0 : db $A4, $40, $00, $02

#_069B30: dw  -3,  -5 : db $91, $80, $00, $00
#_069B38: dw  -3,   3 : db $90, $80, $00, $00
#_069B40: dw   0, -10 : db $86, $00, $00, $02
#_069B48: dw   0,   0 : db $A8, $00, $00, $02

#_069B50: dw  11, -11 : db $90, $00, $00, $00
#_069B58: dw  11,  -3 : db $91, $00, $00, $00
#_069B60: dw   0,  -9 : db $84, $00, $00, $02
#_069B68: dw   0,   0 : db $82, $40, $00, $02

#_069B70: dw  -2,  -3 : db $80, $00, $00, $00
#_069B78: dw   6,  -3 : db $81, $00, $00, $00
#_069B80: dw   0,  -9 : db $88, $00, $00, $02
#_069B88: dw   0,   0 : db $A2, $00, $00, $02

#_069B90: dw  10,  -3 : db $80, $40, $00, $00
#_069B98: dw   2,  -3 : db $81, $40, $00, $00
#_069BA0: dw   0,  -9 : db $88, $40, $00, $02
#_069BA8: dw   0,   0 : db $A2, $40, $00, $02

;---------------------------------------------------------------------------------------------------

.buffer_offset
#_069BB0: db $08, $08, $00, $00
#_069BB4: db $08, $08, $08, $08
#_069BB8: db $08, $08, $08, $08

.char
#_069BBC: db $88, $88, $86, $84

.hflip
#_069BC0: db $40, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Moblin:
#_069BC4: LDA.b #$00
#_069BC6: XBA
#_069BC7: LDA.w $0DC0,X

#_069BCA: REP #$20

#_069BCC: ASL A
#_069BCD: ASL A
#_069BCE: ASL A
#_069BCF: ASL A
#_069BD0: ASL A

#_069BD1: ADC.w #.oam_groups
#_069BD4: STA.b $08

#_069BD6: SEP #$20

#_069BD8: LDA.b #$04
#_069BDA: JSL SpriteDraw_Tabulated

#_069BDE: LDA.w $0F00,X
#_069BE1: BNE .exit

#_069BE3: LDA.w $0E00,X
#_069BE6: BEQ .no_spear

#_069BE8: LDY.b #$03

.next_object
#_069BEA: LDA.b ($92),Y
#_069BEC: AND.b #$02
#_069BEE: BNE .skip_object

#_069BF0: PHY

#_069BF1: TYA
#_069BF2: ASL A
#_069BF3: ASL A
#_069BF4: TAY

#_069BF5: INY
#_069BF6: LDA.b #$F0
#_069BF8: STA.b ($90),Y

#_069BFA: PLY

.skip_object
#_069BFB: DEY
#_069BFC: BPL .next_object

.no_spear
#_069BFE: LDY.w $0DC0,X

#_069C01: LDA.w .buffer_offset,Y
#_069C04: TAY

#_069C05: PHX

#_069C06: LDA.w $0EB0,X
#_069C09: TAX

#_069C0A: LDA.w .char,X
#_069C0D: INY
#_069C0E: INY
#_069C0F: STA.b ($90),Y

#_069C11: INY
#_069C12: LDA.b ($90),Y

#_069C14: AND.b #$BF
#_069C16: ORA.w .hflip,X
#_069C19: STA.b ($90),Y

#_069C1B: PLX

#_069C1C: JMP.w SpriteDraw_Shadow

.exit
#_069C1F: RTS

;===================================================================================================

pool Sprite_0E_Snapdragon

.anim_step
#_069C20: db $04, $00, $06, $02

pool off

;---------------------------------------------------------------------------------------------------

Sprite_0E_Snapdragon:
#_069C24: LDY.w $0DE0,X

#_069C27: LDA.w $0DA0,X
#_069C2A: CLC
#_069C2B: ADC.w .anim_step,Y
#_069C2E: STA.w $0DC0,X

#_069C31: JSR SpriteDraw_Snapdragon
#_069C34: JSR Sprite_CheckIfActive_Bank06
#_069C37: JSR Sprite_CheckIfRecoiling_Bank06
#_069C3A: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_069C3D: STZ.w $0DA0,X

#_069C40: LDA.w $0D80,X
#_069C43: JSL JumpTableLocal
#_069C47: dw Snapdragon_Halted
#_069C49: dw Snapdragon_MoveAround

;===================================================================================================

SnapdragonSpeedX:
#_069C4B: db   8,  -8,   8,  -8
#_069C4F: db  16, -16,  16, -16

;===================================================================================================

SnapdragonSpeedY:
#_069C53: db   8,   8,  -8,  -8
#_069C57: db  16,  16, -16, -16

;===================================================================================================

pool Snapdragon_Halted

.timer
#_069C5B: db  32,  48,  64,  80

pool off

;---------------------------------------------------------------------------------------------------

Snapdragon_Halted:
#_069C5F: LDA.w $0DF0,X
#_069C62: BNE .delay

#_069C64: INC.w $0D80,X

#_069C67: JSL GetRandomNumber
#_069C6B: AND.b #$0C
#_069C6D: LSR A
#_069C6E: LSR A
#_069C6F: TAY

#_069C70: LDA.w .timer,Y
#_069C73: STA.w $0DF0,X

#_069C76: DEC.w $0D90,X
#_069C79: BPL .use_random_direction

#_069C7B: LDA.b #$03
#_069C7D: STA.w $0D90,X

#_069C80: LDA.b #$60
#_069C82: STA.w $0DF0,X

#_069C85: INC.w $0DB0,X

#_069C88: JSR Sprite_IsBelowLink

#_069C8B: TYA
#_069C8C: ASL A
#_069C8D: STA.b $00

#_069C8F: JSR Sprite_IsRightOfLink
#_069C92: TYA
#_069C93: ORA.b $00
#_069C95: BRA .continue

;---------------------------------------------------------------------------------------------------

.use_random_direction
#_069C97: JSL GetRandomNumber
#_069C9B: AND.b #$03

.continue
#_069C9D: STA.w $0DE0,X

#_069CA0: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_069CA1: AND.b #$18
#_069CA3: BEQ .exit

#_069CA5: INC.w $0DA0,X

.exit
#_069CA8: RTS

;===================================================================================================

Snapdragon_MoveAround:
#_069CA9: INC.w $0DA0,X

#_069CAC: JSR Sprite_Move_XY_Bank06
#_069CAF: JSR Sprite_CheckTileCollision

#_069CB2: LDA.w $0E70,X
#_069CB5: BEQ .no_tile_collision

#_069CB7: LDA.w $0DE0,X
#_069CBA: EOR.b #$03
#_069CBC: STA.w $0DE0,X

.no_tile_collision
#_069CBF: LDY.w $0DE0,X
#_069CC2: LDA.w $0DB0,X
#_069CC5: BEQ .use_slow_speed

#_069CC7: INY
#_069CC8: INY
#_069CC9: INY
#_069CCA: INY

.use_slow_speed
#_069CCB: LDA.w SnapdragonSpeedX,Y
#_069CCE: STA.w $0D50,X

#_069CD1: LDA.w SnapdragonSpeedY,Y
#_069CD4: STA.w $0D40,X

#_069CD7: JSR Sprite_Move_Z_Bank06

#_069CDA: LDA.w $0F80,X
#_069CDD: SEC
#_069CDE: SBC.b #$04
#_069CE0: STA.w $0F80,X

#_069CE3: LDA.w $0F70,X
#_069CE6: BPL .exit

#_069CE8: STZ.w $0F70,X

#_069CEB: LDA.w $0DF0,X
#_069CEE: BNE .delay

#_069CF0: STZ.w $0D80,X
#_069CF3: STZ.w $0DB0,X

#_069CF6: LDA.b #$3F
#_069CF8: STA.w $0DF0,X

#_069CFB: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_069CFC: LDA.b #$14
#_069CFE: STA.w $0F80,X

.exit
#_069D01: RTS

;===================================================================================================

pool SpriteDraw_Snapdragon

.oam_groups
#_069D02: dw   4,  -8 : db $8F, $00, $00, $00
#_069D0A: dw  12,  -8 : db $9F, $00, $00, $00
#_069D12: dw  -4,   0 : db $8C, $00, $00, $02
#_069D1A: dw   4,   0 : db $8D, $00, $00, $02

#_069D22: dw   4,  -8 : db $2B, $00, $00, $00
#_069D2A: dw  12,  -8 : db $3B, $00, $00, $00
#_069D32: dw  -4,   0 : db $28, $00, $00, $02
#_069D3A: dw   4,   0 : db $29, $00, $00, $02

#_069D42: dw  -4,  -8 : db $3C, $00, $00, $00
#_069D4A: dw   4,  -8 : db $3D, $00, $00, $00
#_069D52: dw  -4,   0 : db $AA, $00, $00, $02
#_069D5A: dw   4,   0 : db $AB, $00, $00, $02

#_069D62: dw  -4,  -8 : db $3E, $00, $00, $00
#_069D6A: dw   4,  -8 : db $3F, $00, $00, $00
#_069D72: dw  -4,   0 : db $AD, $00, $00, $02
#_069D7A: dw   4,   0 : db $AE, $00, $00, $02

#_069D82: dw  -4,  -8 : db $9F, $40, $00, $00
#_069D8A: dw   4,  -8 : db $8F, $40, $00, $00
#_069D92: dw  -4,   0 : db $8D, $40, $00, $02
#_069D9A: dw   4,   0 : db $8C, $40, $00, $02

#_069DA2: dw  -4,  -8 : db $3B, $40, $00, $00
#_069DAA: dw   4,  -8 : db $2B, $40, $00, $00
#_069DB2: dw  -4,   0 : db $29, $40, $00, $02
#_069DBA: dw   4,   0 : db $28, $40, $00, $02

#_069DC2: dw   4,  -8 : db $3D, $40, $00, $00
#_069DCA: dw  12,  -8 : db $3C, $40, $00, $00
#_069DD2: dw  -4,   0 : db $AB, $40, $00, $02
#_069DDA: dw   4,   0 : db $AA, $40, $00, $02

#_069DE2: dw   4,  -8 : db $3F, $40, $00, $00
#_069DEA: dw  12,  -8 : db $3E, $40, $00, $00
#_069DF2: dw  -4,   0 : db $AE, $40, $00, $02
#_069DFA: dw   4,   0 : db $AD, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Snapdragon:
#_069E02: LDA.b #$00
#_069E04: XBA
#_069E05: LDA.w $0DC0,X

#_069E08: REP #$20

#_069E0A: ASL A
#_069E0B: ASL A
#_069E0C: ASL A
#_069E0D: ASL A
#_069E0E: ASL A
#_069E0F: ADC.w #.oam_groups
#_069E12: STA.b $08

#_069E14: SEP #$20

#_069E16: LDA.b #$04
#_069E18: JSL SpriteDraw_Tabulated

#_069E1C: JMP.w SpriteDraw_Shadow

;===================================================================================================

Sprite_22_Ropa:
#_069E1F: JSR SpriteDraw_Ropa
#_069E22: JSR Sprite_CheckIfActive_Bank06
#_069E25: JSR Sprite_CheckIfRecoiling_Bank06
#_069E28: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_069E2B: INC.w $0E80,X

#_069E2E: LDA.w $0E80,X
#_069E31: LSR A
#_069E32: LSR A
#_069E33: LSR A
#_069E34: AND.b #$03
#_069E36: STA.w $0DC0,X

#_069E39: LDA.w $0D80,X
#_069E3C: JSL JumpTableLocal
#_069E40: dw Ropa_Halted
#_069E42: dw Ropa_Pounce

;===================================================================================================

Ropa_Halted:
#_069E44: LDA.w $0DF0,X
#_069E47: BNE .exit

#_069E49: LDA.b #$10
#_069E4B: JSR Sprite_ApplySpeedTowardsLink

#_069E4E: JSL GetRandomNumber
#_069E52: AND.b #$0F
#_069E54: ADC.b #$14
#_069E56: STA.w $0F80,X

#_069E59: INC.w $0D80,X

.exit
#_069E5C: RTS

;===================================================================================================

Ropa_Pounce:
#_069E5D: JSR Sprite_Move_XY_Bank06
#_069E60: JSR Sprite_CheckTileCollision

#_069E63: LDA.w $0E70,X
#_069E66: BEQ .air_borne

#_069E68: JSR Sprite_ZeroVelocity_XY_Bank06

.air_borne
#_069E6B: JSR Sprite_Move_Z_Bank06

#_069E6E: DEC.w $0F80,X
#_069E71: DEC.w $0F80,X

#_069E74: LDA.w $0F70,X
#_069E77: BPL .exit

#_069E79: STZ.w $0F70,X

#_069E7C: LDA.b #$30
#_069E7E: STA.w $0DF0,X

#_069E81: STZ.w $0D80,X

.exit
#_069E84: RTS

;===================================================================================================

pool SpriteDraw_Ropa

.oam_groups
#_069E85: dw   0,  -8 : db $26, $00, $00, $00
#_069E8D: dw   8,  -8 : db $27, $00, $00, $00
#_069E95: dw   0,   0 : db $08, $00, $00, $02

#_069E9D: dw   0,  -8 : db $36, $00, $00, $00
#_069EA5: dw   8,  -8 : db $37, $00, $00, $00
#_069EAD: dw   0,   0 : db $0A, $00, $00, $02

#_069EB5: dw   0,  -8 : db $27, $40, $00, $00
#_069EBD: dw   8,  -8 : db $26, $40, $00, $00
#_069EC5: dw   0,   0 : db $08, $40, $00, $02

#_069ECD: dw   0,  -8 : db $37, $40, $00, $00
#_069ED5: dw   8,  -8 : db $36, $40, $00, $00
#_069EDD: dw   0,   0 : db $08, $40, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Ropa:
#_069EE5: LDA.b #$00
#_069EE7: XBA
#_069EE8: LDA.w $0DC0,X

#_069EEB: REP #$20

#_069EED: ASL A
#_069EEE: ASL A
#_069EEF: ASL A
#_069EF0: STA.b $00

#_069EF2: ASL A
#_069EF3: ADC.b $00
#_069EF5: ADC.w #.oam_groups
#_069EF8: STA.b $08

#_069EFA: SEP #$20

#_069EFC: LDA.b #$03
#_069EFE: JSL SpriteDraw_Tabulated

#_069F02: JMP.w SpriteDraw_Shadow

;===================================================================================================

Sprite_11_Hinox:
#_069F05: JSR SpriteDraw_Hinox
#_069F08: JSR Sprite_CheckIfActive_Bank06

#_069F0B: LDA.w $0EA0,X
#_069F0E: BEQ .not_recoiling

#_069F10: JSR Hinox_FaceLink

#_069F13: LDA.b #$02
#_069F15: STA.w $0D80,X

#_069F18: LDA.b #$30
#_069F1A: STA.w $0DF0,X

.not_recoiling
#_069F1D: JSR Sprite_CheckIfRecoiling_Bank06
#_069F20: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_069F23: LDA.w $0D80,X
#_069F26: JSL JumpTableLocal
#_069F2A: dw Hinox_Halted
#_069F2C: dw Hinox_Walk
#_069F2E: dw Hinox_ThrowBomb

;===================================================================================================

pool Hinox_ThrowBomb

.anim_step
#_069F30: db $0B, $0A, $08, $09
#_069F34: db $07, $05, $01, $03

.offset_x_low
#_069F38: db   8,  -8, -13,  13

;---------------------------------------------------------------------------------------------------

#CuccoSwarmSpeed:
.offset_x_high
#_069F3C: db   0,  -1,  -1,   0

.offset_y_low
#_069F40: db -11, -11, -16, -16

.speed_x
#_069F44: db  24, -24 ; bleeds into next

.speed_y
#_069F46: db   0,   0,  24, -24

pool off

;---------------------------------------------------------------------------------------------------

Hinox_ThrowBomb:
#_069F4A: LDA.w $0DF0,X
#_069F4D: BNE .delay

#_069F4F: STZ.w $0D80,X

#_069F52: LDA.b #$02
#_069F54: STA.w $0DF0,X

#_069F57: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_069F58: CMP.b #$20
#_069F5A: BNE .dont_throw

#_069F5C: LDA.b #$4A ; SPRITE 4A
#_069F5E: JSL Sprite_SpawnDynamically
#_069F62: BMI .no_space

#_069F64: JSL Sprite_TransmuteToBomb

#_069F68: LDA.b #$40
#_069F6A: STA.w $0E00,Y

#_069F6D: PHX

#_069F6E: LDA.w $0DE0,X
#_069F71: TAX

#_069F72: LDA.b $00
#_069F74: CLC
#_069F75: ADC.w .offset_x_low,X
#_069F78: STA.w $0D10,Y

#_069F7B: LDA.b $01
#_069F7D: ADC.w .offset_x_high,X
#_069F80: STA.w $0D30,Y

#_069F83: LDA.b $02
#_069F85: CLC
#_069F86: ADC.w .offset_y_low,X
#_069F89: STA.w $0D00,Y

#_069F8C: LDA.b $03
#_069F8E: ADC.b #$FF
#_069F90: STA.w $0D20,Y

#_069F93: LDA.w .speed_x,X
#_069F96: STA.w $0D50,Y

#_069F99: LDA.w .speed_y,X
#_069F9C: STA.w $0D40,Y

#_069F9F: PLX

#_069FA0: LDA.b #$28
#_069FA2: STA.w $0F80,Y

.no_space
#_069FA5: RTS

;---------------------------------------------------------------------------------------------------

.dont_throw
#_069FA6: LDY.w $0DE0,X
#_069FA9: BCS .dont_adjust_arm

#_069FAB: INY
#_069FAC: INY
#_069FAD: INY
#_069FAE: INY

.dont_adjust_arm
#_069FAF: LDA.w .anim_step,Y
#_069FB2: STA.w $0DC0,X

#_069FB5: RTS

;===================================================================================================

HinoxSpeedX:
#_069FB6: db   8,  -8 ; bleeds into next

HinoxSpeedY:
#_069FB8: db   0,   0,   8,  -8

;===================================================================================================

Hinox_Halted:
#_069FBC: LDA.w $0DF0,X
#_069FBF: BNE EXIT_06A024

#_069FC1: JSL GetRandomNumber
#_069FC5: AND.b #$03
#_069FC7: BNE .change_direction

#_069FC9: LDA.b #$02
#_069FCB: STA.w $0D80,X

#_069FCE: LDA.b #$40
#_069FD0: STA.w $0DF0,X

#_069FD3: RTS

.change_direction
#_069FD4: INC.w $0DB0,X

#_069FD7: LDA.w $0DB0,X
#_069FDA: CMP.b #$04
#_069FDC: BNE Hinox_PickRandomDirection

#_069FDE: STZ.w $0DB0,X

;===================================================================================================

Hinox_FaceLink:
#_069FE1: JSR Sprite_DirectionToFaceLink

#_069FE4: TYA
#_069FE5: JSR Hinox_SetDirection

#_069FE8: ASL.w $0D50,X
#_069FEB: ASL.w $0D40,X

#_069FEE: RTS

;===================================================================================================

pool Hinox_PickRandomDirection

.direction
#_069FEF: db $02, $03, $03, $02
#_069FF3: db $00, $01, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

Hinox_PickRandomDirection:
#_069FF7: JSL GetRandomNumber
#_069FFB: LSR A

#_069FFC: LDA.w $0DE0,X
#_069FFF: ROL A
#_06A000: TAY

#_06A001: LDA.w .direction,Y

;===================================================================================================

Hinox_SetDirection:
#_06A004: STA.w $0DE0,X

#_06A007: JSL GetRandomNumber
#_06A00B: AND.b #$3F
#_06A00D: ADC.b #$60
#_06A00F: STA.w $0DF0,X

#_06A012: INC.w $0D80,X

#_06A015: LDY.w $0DE0,X

#_06A018: LDA.w HinoxSpeedX,Y
#_06A01B: STA.w $0D50,X

#_06A01E: LDA.w HinoxSpeedY,Y
#_06A021: STA.w $0D40,X

;---------------------------------------------------------------------------------------------------

#EXIT_06A024:
#_06A024: RTS

;===================================================================================================

pool Hinox_Walk

.anim_step
#_06A025: db $06, $04, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

Hinox_Walk:
#_06A029: LDA.w $0DF0,X
#_06A02C: BNE .delay

.reset_ai
#_06A02E: LDA.b #$10
#_06A030: STA.w $0DF0,X

#_06A033: STZ.w $0D80,X

#_06A036: RTS

.delay
#_06A037: DEC.w $0D90,X
#_06A03A: BPL .delay_tick

#_06A03C: LDA.b #$0B
#_06A03E: STA.w $0D90,X

#_06A041: INC.w $0E80,X

.delay_tick
#_06A044: JSR Sprite_Move_XY_Bank06
#_06A047: JSR Sprite_CheckTileCollision

#_06A04A: LDA.w $0E70,X
#_06A04D: BEQ .no_tile_collision
#_06A04F: BRA .reset_ai

.no_tile_collision
#_06A051: LDA.w $0E80,X
#_06A054: AND.b #$01
#_06A056: STA.b $00

#_06A058: LDY.w $0DE0,X

#_06A05B: LDA.w .anim_step,Y
#_06A05E: CLC
#_06A05F: ADC.b $00
#_06A061: STA.w $0DC0,X

#_06A064: RTS

;===================================================================================================

pool SpriteDraw_Hinox

.oam_groups

.group00
#_06A065: dw   0, -13 : db $00, $06, $00, $02
#_06A06D: dw  -8,  -5 : db $24, $06, $00, $02
#_06A075: dw   8,  -5 : db $24, $46, $00, $02
#_06A07D: dw   0,   1 : db $06, $06, $00, $02

.group01
#_06A085: dw   0, -13 : db $00, $06, $00, $02
#_06A08D: dw  -8,  -5 : db $24, $06, $00, $02
#_06A095: dw   8,  -5 : db $24, $46, $00, $02
#_06A09D: dw   0,   1 : db $06, $46, $00, $02

.group02
#_06A0A5: dw  -8,  -6 : db $24, $06, $00, $02
#_06A0AD: dw   8,  -6 : db $24, $46, $00, $02
#_06A0B5: dw   0,   0 : db $06, $06, $00, $02
#_06A0BD: dw   0, -13 : db $04, $06, $00, $02

.group03
#_06A0C5: dw  -8,  -6 : db $24, $06, $00, $02
#_06A0CD: dw   8,  -6 : db $24, $46, $00, $02
#_06A0D5: dw   0,   0 : db $06, $46, $00, $02
#_06A0DD: dw   0, -13 : db $04, $06, $00, $02

.group04
#_06A0E5: dw  -3, -13 : db $02, $06, $00, $02
#_06A0ED: dw   0,  -8 : db $0C, $06, $00, $02
#_06A0F5: dw   0,   0 : db $1C, $06, $00, $02

.group05
#_06A0FD: dw  -3, -12 : db $02, $06, $00, $02
#_06A105: dw   0,  -8 : db $0E, $06, $00, $02
#_06A10D: dw   0,   0 : db $1E, $06, $00, $02

.group06
#_06A115: dw   3, -13 : db $02, $46, $00, $02
#_06A11D: dw   0,  -8 : db $0C, $46, $00, $02
#_06A125: dw   0,   0 : db $1C, $46, $00, $02

.group07
#_06A12D: dw   3, -12 : db $02, $46, $00, $02
#_06A135: dw   0,  -8 : db $0E, $46, $00, $02
#_06A13D: dw   0,   0 : db $1E, $46, $00, $02

.group08
#_06A145: dw -13, -16 : db $6E, $05, $00, $02
#_06A14D: dw   0, -13 : db $00, $06, $00, $02
#_06A155: dw  -8,  -5 : db $20, $06, $00, $02
#_06A15D: dw   8,  -5 : db $24, $46, $00, $02
#_06A165: dw   0,   1 : db $06, $06, $00, $02

.group09
#_06A16D: dw  -8,  -5 : db $24, $06, $00, $02
#_06A175: dw   8,  -5 : db $20, $46, $00, $02
#_06A17D: dw   0,   1 : db $06, $06, $00, $02
#_06A185: dw   0, -13 : db $04, $06, $00, $02
#_06A18D: dw  13, -16 : db $6E, $05, $00, $02

.group0A
#_06A195: dw  -8, -11 : db $6E, $05, $00, $02
#_06A19D: dw  -3, -13 : db $02, $06, $00, $02
#_06A1A5: dw   0,   0 : db $22, $06, $00, $02
#_06A1AD: dw   0,  -8 : db $0C, $06, $00, $02

.group0B
#_06A1B5: dw   8, -11 : db $6E, $05, $00, $02
#_06A1BD: dw   3, -13 : db $02, $46, $00, $02
#_06A1C5: dw   0,   0 : db $22, $46, $00, $02
#_06A1CD: dw   0,  -8 : db $0C, $46, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_pointers
#_06A1D5: dw .group00
#_06A1D7: dw .group01
#_06A1D9: dw .group02
#_06A1DB: dw .group03
#_06A1DD: dw .group04
#_06A1DF: dw .group05
#_06A1E1: dw .group06
#_06A1E3: dw .group07
#_06A1E5: dw .group08
#_06A1E7: dw .group09
#_06A1E9: dw .group0A
#_06A1EB: dw .group0B

;---------------------------------------------------------------------------------------------------

.oam_group_size
#_06A1ED: db 4
#_06A1EE: db 4
#_06A1EF: db 4
#_06A1F0: db 4
#_06A1F1: db 3
#_06A1F2: db 3
#_06A1F3: db 3
#_06A1F4: db 3
#_06A1F5: db 5
#_06A1F6: db 5
#_06A1F7: db 4
#_06A1F8: db 4

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Hinox:
#_06A1F9: LDA.w $0DC0,X
#_06A1FC: PHA

#_06A1FD: ASL A
#_06A1FE: TAY

#_06A1FF: REP #$20

#_06A201: LDA.w .oam_group_pointers,Y
#_06A204: STA.b $08

#_06A206: SEP #$20

#_06A208: PLY

#_06A209: LDA.w .oam_group_size,Y

#_06A20C: JSL SpriteDraw_Tabulated

#_06A210: JMP.w SpriteDraw_Shadow

;===================================================================================================

PositiveAndNegativeOne:
#_06A213: db  1, -1

;===================================================================================================

BariSpeed:
.x
#_06A215: db   0,   8,  11,  14
#_06A219: db  16,  14,  11,   8
#_06A21D: db   0,  -8, -11, -14
#_06A221: db -16, -14, -11,  -8

.y
#_06A225: db -16, -14, -11,  -8
#_06A229: db   0,   8,  11,  14
#_06A22D: db  16,  14,  11,   8
#_06A231: db   0,  -9, -11, -14

;===================================================================================================

BariSplit:
.offset_x
#_06A235: db   0,   8

.speed_x
#_06A237: db -32,  32

;===================================================================================================

BariWiggle:
#_06A239: db   8,  -8

;===================================================================================================

Bari_anim_step:
#_06A23B: db $00, $03

;===================================================================================================

Sprite_23_RedBari:
Sprite_24_BlueBari:
#_06A23D: LDA.w $0DB0,X
#_06A240: BEQ Bari_JustDraw

#_06A242: BPL Sprite_RedBiri

;===================================================================================================

Bari_Main:
#_06A244: LDA.w $0EB0,X
#_06A247: CMP.b #$10
#_06A249: BNE .delay_tile_collision

#_06A24B: LDA.b #$FF
#_06A24D: STA.w $0D50,X
#_06A250: STA.w $0E30,X

#_06A253: JSR Sprite_CheckTileCollision

#_06A256: STZ.w $0E30,X

#_06A259: LDA.w $0FA5 ; TILETYPE 00
#_06A25C: BNE .collision

#_06A25E: STZ.w $0DB0,X
#_06A261: STZ.w $0BA0,X

#_06A264: JMP.w Bari_RandomlySetTimer2

.collision
#_06A267: STA.w $0BA0,X

#_06A26A: RTS

.delay_tile_collision
#_06A26B: INC.w $0EB0,X

#_06A26E: RTS

;===================================================================================================

Sprite_RedBiri:
#_06A26F: JSR SpriteDraw_SingleSmall

#_06A272: BRA BariAndBiri_Main

;===================================================================================================

Bari_JustDraw:
#_06A274: LDA.w $0DC0,X
#_06A277: CMP.b #$02
#_06A279: BCC .not_electrified

#_06A27B: JSR SpriteDraw_SingleLarge

#_06A27E: BRA BariAndBiri_Main

.not_electrified
#_06A280: JSR SpriteDraw_Bari

;===================================================================================================

BariAndBiri_Main:
#_06A283: JSR Sprite_CheckIfActive_Bank06
#_06A286: JSR Sprite_CheckIfRecoiling_Bank06

#_06A289: LDA.w $0E10,X
#_06A28C: BNE Biri_Recoiling

#_06A28E: LDA.w $0D80,X
#_06A291: CMP.b #$02
#_06A293: BNE Bari_NotSplitting

#_06A295: STA.w $0BA0,X

#_06A298: LDA.b $1A
#_06A29A: LSR A
#_06A29B: AND.b #$01
#_06A29D: TAY

#_06A29E: LDA.w BariWiggle,Y
#_06A2A1: STA.w $0D50,X

#_06A2A4: JSR Sprite_Move_X_Bank06

#_06A2A7: LDA.w $0DF0,X
#_06A2AA: BNE .exit

#_06A2AC: JSR RedBari_Split

#_06A2AF: STZ.w $0DD0,X

.exit
#_06A2B2: RTS

;===================================================================================================

Bari_NotSplitting:
#_06A2B3: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06A2B6: TXA
#_06A2B7: EOR.b $1A
#_06A2B9: AND.b #$0F
#_06A2BB: BNE .delay_rotation_tick

#_06A2BD: LDA.w $0DA0,X
#_06A2C0: AND.b #$01
#_06A2C2: TAY

#_06A2C3: LDA.w $0D90,X
#_06A2C6: CLC
#_06A2C7: ADC.w PositiveAndNegativeOne,Y
#_06A2CA: STA.w $0D90,X

#_06A2CD: JSL GetRandomNumber

#_06A2D1: AND.b #$03
#_06A2D3: BNE .delay_rotation_tick

#_06A2D5: INC.w $0DA0,X

.delay_rotation_tick
#_06A2D8: LDA.w $0D90,X
#_06A2DB: AND.b #$0F
#_06A2DD: TAY

#_06A2DE: LDA.w BariSpeed_x,Y
#_06A2E1: STA.w $0D50,X

#_06A2E4: LDA.w BariSpeed_y,Y
#_06A2E7: STA.w $0D40,X

#_06A2EA: TXA
#_06A2EB: EOR.b $1A
#_06A2ED: AND.b #$03
#_06A2EF: ORA.w $0DF0,X
#_06A2F2: BNE Bari_Animate

;===================================================================================================

Biri_Recoiling:
#_06A2F4: LDA.w $0E70,X
#_06A2F7: BNE .no_tile_collision

#_06A2F9: JSR Sprite_Move_XY_Bank06

.no_tile_collision
#_06A2FC: JSR Sprite_CheckTileCollision

;===================================================================================================

Bari_Animate:
#_06A2FF: LDY.w $0DB0,X

#_06A302: LDA.b $1A
#_06A304: LSR A
#_06A305: LSR A
#_06A306: LSR A
#_06A307: AND.b #$01
#_06A309: CLC
#_06A30A: ADC.w Bari_anim_step,Y
#_06A30D: STA.w $0DC0,X

#_06A310: LDA.w $0D80,X
#_06A313: BEQ .not_electrified

#_06A315: LDA.w $0DF0,X
#_06A318: BNE .delay

#_06A31A: STZ.w $0D80,X

#_06A31D: BRA Bari_RandomlySetTimer2

.delay
#_06A31F: LDA.b $1A
#_06A321: LSR A
#_06A322: AND.b #$02

#_06A324: CLC
#_06A325: ADC.w Bari_anim_step,Y
#_06A328: STA.w $0DC0,X

#_06A32B: RTS

;---------------------------------------------------------------------------------------------------

.not_electrified
#_06A32C: LDA.w $0E00,X
#_06A32F: BNE EXIT_06A34D

#_06A331: JSL GetRandomNumber
#_06A335: AND.b #$01
#_06A337: BNE Bari_RandomlySetTimer2

#_06A339: LDA.b #$80
#_06A33B: STA.w $0DF0,X

#_06A33E: INC.w $0D80,X

#_06A341: RTS

;===================================================================================================

Bari_RandomlySetTimer2:
#_06A342: JSL GetRandomNumber
#_06A346: AND.b #$3F
#_06A348: ADC.b #$80
#_06A34A: STA.w $0E00,X

;---------------------------------------------------------------------------------------------------

#EXIT_06A34D:
#_06A34D: RTS

;===================================================================================================

RedBari_Split:
#_06A34E: LDA.b #$01
#_06A350: STA.w $0FB5

.next_biri
#_06A353: LDA.b #$23 ; SPRITE 23
#_06A355: JSL Sprite_SpawnDynamically
#_06A359: BMI .no_space

#_06A35B: JSL Sprite_SetSpawnedCoordinates

#_06A35F: LDA.b #$33
#_06A361: STA.w $0E60,Y

#_06A364: LDA.b #$03
#_06A366: STA.w $0F50,Y

#_06A369: LDA.b #$01
#_06A36B: STA.w $0F60,Y
#_06A36E: STA.w $0DB0,Y

#_06A371: PHX

#_06A372: LDX.w $0FB5

#_06A375: LDA.b $00
#_06A377: CLC
#_06A378: ADC.w BariSplit_offset_x,X
#_06A37B: STA.w $0D10,Y

#_06A37E: LDA.b $01
#_06A380: ADC.b #$00
#_06A382: STA.w $0D30,Y

#_06A385: LDA.w BariSplit_speed_x,X
#_06A388: STA.w $0D50,Y

#_06A38B: LDA.b #$08
#_06A38D: STA.w $0E10,Y

#_06A390: LDA.b #$40
#_06A392: STA.w $0E00,Y

#_06A395: PLX

.no_space
#_06A396: DEC.w $0FB5
#_06A399: BPL .next_biri

#_06A39B: RTS

;===================================================================================================

pool SpriteDraw_Bari

.oam_groups
#_06A39C: dw   0,   0 : db $22, $00, $00, $00
#_06A3A4: dw   8,   0 : db $22, $40, $00, $00
#_06A3AC: dw   0,   8 : db $32, $00, $00, $00
#_06A3B4: dw   8,   8 : db $32, $40, $00, $00

#_06A3BC: dw   0,   0 : db $23, $00, $00, $00
#_06A3C4: dw   8,   0 : db $23, $40, $00, $00
#_06A3CC: dw   0,   8 : db $33, $00, $00, $00
#_06A3D4: dw   8,   8 : db $33, $40, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bari:
#_06A3DC: LDA.b #$00
#_06A3DE: XBA
#_06A3DF: LDA.w $0DC0,X

#_06A3E2: REP #$20

#_06A3E4: ASL A
#_06A3E5: ASL A
#_06A3E6: ASL A
#_06A3E7: ASL A
#_06A3E8: ASL A

#_06A3E9: ADC.w #.oam_groups
#_06A3EC: STA.b $08

#_06A3EE: SEP #$20

#_06A3F0: LDA.b #$04
#_06A3F2: JSL SpriteDraw_Tabulated

#_06A3F6: JMP.w SpriteDraw_Shadow

;===================================================================================================

pool Sprite_13_MiniHelmasaur

.anim_step
#_06A3F9: db $03, $04, $03, $04
#_06A3FD: db $02, $02, $05, $05

.flip
#_06A401: db $40, $40, $00, $00
#_06A405: db $00, $40, $40, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_13_MiniHelmasaur:
#_06A409: LDA.w $0DE0,X
#_06A40C: ASL A
#_06A40D: STA.b $00

#_06A40F: LDA.w $0E80,X
#_06A412: LSR A
#_06A413: LSR A
#_06A414: AND.b #$01

#_06A416: ORA.b $00
#_06A418: TAY

#_06A419: LDA.w .anim_step,Y
#_06A41C: STA.w $0DC0,X

#_06A41F: LDA.w $0F50,X
#_06A422: AND.b #$BF
#_06A424: ORA.w .flip,Y
#_06A427: STA.w $0F50,X

#_06A42A: TXA
#_06A42B: EOR.b $1A
#_06A42D: AND.b #$0F
#_06A42F: BNE .continue

;---------------------------------------------------------------------------------------------------

#_06A431: LDA.w $0D50,X
#_06A434: BPL .positive_x

#_06A436: EOR.b #$FF
#_06A438: INC A

.positive_x
#_06A439: STA.b $00

#_06A43B: LDA.w $0D40,X
#_06A43E: BPL .positive_y

#_06A440: EOR.b #$FF
#_06A442: INC A

.positive_y
#_06A443: STA.b $01

#_06A445: LDA.b $00
#_06A447: CMP.b $01

#_06A449: LDA.b #$00
#_06A44B: LDY.w $0D50,X
#_06A44E: BCS .use_x_speed

#_06A450: LDA.b #$02
#_06A452: LDY.w $0D40,X

.use_x_speed
#_06A455: BPL .positive_choice

#_06A457: INC A

.positive_choice
#_06A458: STA.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.continue
#_06A45B: JSR SpriteDraw_SingleLarge

#_06A45E: BRA MiniHelmaAndBeetleMain

;===================================================================================================

Sprite_26_HardhatBeetle:
#_06A460: LDA.w $0E80,X
#_06A463: LSR A
#_06A464: LSR A
#_06A465: AND.b #$01
#_06A467: STA.w $0DC0,X

#_06A46A: JSR SpriteDraw_HardhatBeetle

;===================================================================================================

MiniHelmaAndBeetleMain:
#_06A46D: JSR Sprite_CheckIfActive_Bank06

#_06A470: INC.w $0E80,X

#_06A473: JSR Sprite_CheckIfRecoiling_Bank06
#_06A476: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06A479: LDA.w $0E70,X
#_06A47C: AND.b #$0F
#_06A47E: BEQ .no_tile_collision

#_06A480: AND.b #$03
#_06A482: BEQ .no_horizontal_tile_collision

#_06A484: STZ.w $0D50,X

.no_horizontal_tile_collision
#_06A487: STZ.w $0D40,X

#_06A48A: BRA .continue

.no_tile_collision
#_06A48C: JSR Sprite_Move_XY_Bank06

;---------------------------------------------------------------------------------------------------

.continue
#_06A48F: JSR Sprite_CheckTileCollision

#_06A492: TXA
#_06A493: EOR.b $1A
#_06A495: AND.b #$1F
#_06A497: BNE .delay_turning

#_06A499: LDA.w $0D90,X
#_06A49C: JSR Sprite_ProjectSpeedTowardsLink

#_06A49F: LDA.b $00
#_06A4A1: STA.w $0DA0,X

#_06A4A4: LDA.b $01
#_06A4A6: STA.w $0DB0,X

;---------------------------------------------------------------------------------------------------

.delay_turning
#_06A4A9: TXA
#_06A4AA: EOR.b $1A
#_06A4AC: AND.w $0D80,X
#_06A4AF: BNE .exit

#_06A4B1: LDA.w $0D40,X
#_06A4B4: CMP.w $0DA0,X
#_06A4B7: BPL .at_max_y_speed

#_06A4B9: INC.w $0D40,X
#_06A4BC: BRA .check_x_speed

.at_max_y_speed
#_06A4BE: DEC.w $0D40,X

.check_x_speed
#_06A4C1: LDA.w $0D50,X
#_06A4C4: CMP.w $0DB0,X
#_06A4C7: BPL .at_max_x_speed

#_06A4C9: INC.w $0D50,X
#_06A4CC: BRA .exit

.at_max_x_speed
#_06A4CE: DEC.w $0D50,X

.exit
#_06A4D1: RTS

;===================================================================================================

pool SpriteDraw_HardhatBeetle

.oam_groups
#_06A4D2: dw   0,  -4 : db $40, $01, $00, $02
#_06A4DA: dw   0,   2 : db $42, $01, $00, $02

#_06A4E2: dw   0,  -5 : db $40, $01, $00, $02
#_06A4EA: dw   0,   2 : db $44, $01, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_HardhatBeetle:
#_06A4F2: LDA.w $0DC0,X
#_06A4F5: ASL A
#_06A4F6: ASL A
#_06A4F7: ASL A
#_06A4F8: ASL A
#_06A4F9: ADC.b #.oam_groups>>0
#_06A4FB: STA.b $08

#_06A4FD: LDA.b #.oam_groups>>8
#_06A4FF: ADC.b #$00
#_06A501: STA.b $09

#_06A503: LDA.b #$02
#_06A505: JSL SpriteDraw_Tabulated

#_06A509: JMP.w SpriteDraw_Shadow_Conditional

;===================================================================================================

Sprite_15_Antifairy:
Sprite_77_Antifairy:
#_06A50C: JSL SpriteDraw_Antfairy
#_06A510: JSR Sprite_CheckIfActive_Bank06
#_06A513: JSR Sprite_CheckDamageToLink
#_06A516: BCC .dont_drain_magic

#_06A518: LDA.w $0DF0,X
#_06A51B: BNE .dont_drain_magic

#_06A51D: LDA.b #$10
#_06A51F: STA.w $0DF0,X

#_06A522: LDA.l $7EF36E
#_06A526: SEC
#_06A527: SBC.b #$08
#_06A529: BCS .enough_magic_to_drain

#_06A52B: LDA.b #$00

#_06A52D: BRA .skip_sfx

.enough_magic_to_drain
#_06A52F: LDY.b #$1D ; SFX3.1D
#_06A531: STY.w $012F

.skip_sfx
#_06A534: STA.l $7EF36E

.dont_drain_magic
#_06A538: JSR Sprite_Move_XY_Bank06
#_06A53B: JSL Sprite_BounceFromTileCollision_long

#_06A53F: RTS

;===================================================================================================

UNREACHABLE_06A540:
#_06A540: dw $FFE8, $FFF8, $0008, $0018
#_06A548: dw $FFE8, $FFF8, $0008, $0018
#_06A550: dw $FFE8, $FFF8, $0008, $0018
#_06A558: dw $FFE8, $FFF8, $0008, $0018
#_06A560: dw $FFEA, $FFF9, $0007, $0016
#_06A568: dw $FFEA, $FFF9, $0007, $0016
#_06A570: dw $FFEA, $FFF9, $0007, $0016
#_06A578: dw $FFEA, $FFF9, $0007, $0016
#_06A580: dw $FFE8, $FFE8, $FFE8, $FFE8
#_06A588: dw $FFF8, $FFF8, $FFF8, $FFF8
#_06A590: dw $0008, $0008, $0008, $0008
#_06A598: dw $0018, $0018, $0018, $0018
#_06A5A0: dw $FFEA, $FFEA, $FFEA, $FFEA
#_06A5A8: dw $FFF9, $FFF9, $FFF9, $FFF9
#_06A5B0: dw $0007, $0007, $0007, $0007
#_06A5B8: dw $0016, $0016, $0016, $0016

;===================================================================================================

pool Sprite_0B_Cucco

.h_flip
#_06A5C0: db $40, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_0B_Cucco:
#_06A5C2: LDA.w $0D50,X
#_06A5C5: BEQ .x_speed_0

#_06A5C7: ASL A
#_06A5C8: ROL A
#_06A5C9: AND.b #$01
#_06A5CB: TAY

#_06A5CC: LDA.w $0F50,X
#_06A5CF: AND.b #$BF
#_06A5D1: ORA.w .h_flip,Y
#_06A5D4: STA.w $0F50,X

.x_speed_0
#_06A5D7: JSR SpriteDraw_SingleLarge

#_06A5DA: LDA.w $0EB0,X
#_06A5DD: BEQ .not_easter_egg

#_06A5DF: LDA.b #$3D ; SPRITE 3D
#_06A5E1: STA.w $0E20,X

#_06A5E4: JSL SpritePrep_LoadProperties

#_06A5E8: INC.w $0E30,X

#_06A5EB: LDA.b #$30
#_06A5ED: STA.w $0DF0,X

#_06A5F0: LDA.b #$15 ; SFX2.15
#_06A5F2: STA.w $012E
#_06A5F5: STA.w $0BA0,X

#_06A5F8: RTS

;---------------------------------------------------------------------------------------------------

.not_easter_egg
#_06A5F9: LDA.w $0DD0,X
#_06A5FC: CMP.b #$0A
#_06A5FE: BNE .not_panic_clucking

#_06A600: LDA.b #$03
#_06A602: STA.w $0D80,X

#_06A605: LDA.b $11
#_06A607: BNE .not_panic_clucking

#_06A609: JSR Cucco_AnimateSlow
#_06A60C: JSR Cucco_DrawPANIC

#_06A60F: LDA.b $1A
#_06A611: AND.b #$0F
#_06A613: BNE .not_panic_clucking

#_06A615: JSR BawkBawk

.not_panic_clucking
#_06A618: JSR Sprite_CheckIfActive_Bank06

#_06A61B: LDA.w $0DB0,X
#_06A61E: BEQ Cucco_Main

;===================================================================================================

Cucco_Swarming:
#_06A620: LDA.w $0F50,X
#_06A623: ORA.b #$10
#_06A625: STA.w $0F50,X

#_06A628: JSR Sprite_Move_XY_Bank06

#_06A62B: LDA.b #$0C
#_06A62D: STA.w $0F70,X
#_06A630: STA.w $0BA0,X

#_06A633: TXA
#_06A634: EOR.b $1A
#_06A636: AND.b #$07
#_06A638: BNE .dont_damage

#_06A63A: JSR Sprite_CheckDamageToLink

.dont_damage
#_06A63D: JMP.w Cucco_AnimateFast

;===================================================================================================

Cucco_Main:
#_06A640: LDA.b #$FF
#_06A642: STA.w $0E50,X

#_06A645: LDA.w $0DA0,X
#_06A648: CMP.b #$23
#_06A64A: BCC .dont_summon

#_06A64C: JSR Cucco_SummonAvenger

.dont_summon
#_06A64F: LDA.w $0EA0,X
#_06A652: BEQ .no_more_hits

#_06A654: STZ.w $0EA0,X

#_06A657: LDA.w $0DA0,X
#_06A65A: CMP.b #$23
#_06A65C: BCS .too_hurt_to_cluck

#_06A65E: INC.w $0DA0,X

#_06A661: JSR BawkBawk

.too_hurt_to_cluck
#_06A664: LDA.b #$02
#_06A666: STA.w $0D80,X

.no_more_hits
#_06A669: JSR Sprite_CheckDamageFromLink

#_06A66C: LDA.w $0D80,X
#_06A66F: BEQ Cucco_Calm

#_06A671: CMP.b #$01
#_06A673: BEQ Cucco_Bouncing

#_06A675: CMP.b #$02
#_06A677: BNE .carried

#_06A679: JMP.w Cucco_Flee

.carried
#_06A67C: JMP.w Cucco_Carried

;===================================================================================================

Cucco_Calm:
#_06A67F: LDA.w $0DF0,X
#_06A682: BNE .delay

#_06A684: JSL GetRandomNumber
#_06A688: AND.b #$0F

#_06A68A: PHX

#_06A68B: TXY
#_06A68C: TAX

#_06A68D: LDA.l SomeRandomXSpeeds_Bank05,X
#_06A691: STA.w $0D50,Y

#_06A694: LDA.l SomeRandomYSpeeds_Bank05,X
#_06A698: STA.w $0D40,Y

#_06A69B: PLX

#_06A69C: JSL GetRandomNumber
#_06A6A0: AND.b #$1F
#_06A6A2: ADC.b #$10
#_06A6A4: STA.w $0DF0,X

#_06A6A7: INC.w $0D80,X

.delay
#_06A6AA: STZ.w $0DC0,X

;===================================================================================================

Cucco_CheckIfLifted:
#_06A6AD: JSR Sprite_CheckIfLifted

#_06A6B0: RTS

;===================================================================================================

Cucco_Bouncing:
#_06A6B1: TXA
#_06A6B2: EOR.b $1A
#_06A6B4: LSR A
#_06A6B5: BCC .continue

#_06A6B7: JSR Cucco_DoMovement_XY
#_06A6BA: BEQ .continue

#_06A6BC: STZ.w $0D80,X

.continue
#_06A6BF: JSR Sprite_Move_Z_Bank06

#_06A6C2: DEC.w $0F80,X
#_06A6C5: DEC.w $0F80,X

#_06A6C8: LDA.w $0F70,X
#_06A6CB: BPL Cucco_AnimateFast

#_06A6CD: STZ.w $0F70,X

#_06A6D0: LDA.w $0DF0,X
#_06A6D3: BNE .delay

#_06A6D5: LDA.b #$20
#_06A6D7: STA.w $0DF0,X

#_06A6DA: STZ.w $0D80,X

.delay
#_06A6DD: LDA.b #$0A
#_06A6DF: STA.w $0F80,X

;===================================================================================================

Cucco_AnimateFast:
#_06A6E2: INC.w $0E80,X

;===================================================================================================

Cucco_AnimateSlow:
#_06A6E5: INC.w $0E80,X
#_06A6E8: INC.w $0E80,X
#_06A6EB: INC.w $0E80,X

#_06A6EE: LDA.w $0E80,X
#_06A6F1: LSR A
#_06A6F2: LSR A
#_06A6F3: LSR A
#_06A6F4: LSR A
#_06A6F5: AND.b #$01
#_06A6F7: STA.w $0DC0,X
#_06A6FA: BRA Cucco_CheckIfLifted

;===================================================================================================

Cucco_Flee:
#_06A6FC: JSR Cucco_CheckIfLifted
#_06A6FF: JSR Cucco_DoMovement_XY

#_06A702: STZ.w $0F70,X

#_06A705: TXA
#_06A706: EOR.b $1A
#_06A708: AND.b #$1F
#_06A70A: BNE .dont_update_direction

;===================================================================================================

#Cucco_UpdateFleeSpeed:
#_06A70C: LDA.b #$10
#_06A70E: JSR Sprite_ProjectSpeedTowardsLink

#_06A711: LDA.b $00
#_06A713: EOR.b #$FF
#_06A715: INC A
#_06A716: STA.w $0D40,X

#_06A719: LDA.b $01
#_06A71B: EOR.b #$FF
#_06A71D: INC A
#_06A71E: STA.w $0D50,X

.dont_update_direction
#_06A721: INC.w $0E80,X

#_06A724: JSR Cucco_AnimateFast

;===================================================================================================

Cucco_DrawPANIC:
#_06A727: JSR Sprite_PrepOAMCoord
#_06A72A: JSL Sprite_DrawDistressSweat

#_06A72E: RTS

;===================================================================================================

Sprite_DrawDistressSweat:
#_06A72F: LDA.b $1A
#_06A731: STA.b $06

;===================================================================================================

Sprite_DrawDistress_custom:
#_06A733: LDA.b #$10
#_06A735: JSL SpriteDraw_AllocateOAMFromRegionA

#_06A739: LDA.b $06
#_06A73B: AND.b #$18
#_06A73D: BEQ .exit

#_06A73F: PHX

#_06A740: LDX.b #$03
#_06A742: LDY.b #$00

.next_object
#_06A744: PHX
#_06A745: PHX

#_06A746: TXA
#_06A747: ASL A
#_06A748: TAX

#_06A749: REP #$20

#_06A74B: LDA.b $00
#_06A74D: CLC
#_06A74E: ADC.l CuccoDistress_offset_x,X
#_06A752: STA.b ($90),Y

#_06A754: AND.w #$0100
#_06A757: STA.b $0E

#_06A759: LDA.b $02
#_06A75B: CLC
#_06A75C: ADC.l CuccoDistress_offset_y,X

#_06A760: INY
#_06A761: STA.b ($90),Y

#_06A763: CLC
#_06A764: ADC.w #$0010
#_06A767: CMP.w #$0100

#_06A76A: SEP #$20
#_06A76C: BCC .on_screen

#_06A76E: LDA.b #$F0
#_06A770: STA.b ($90),Y

.on_screen
#_06A772: PLX

#_06A773: LDA.b #$83
#_06A775: INY
#_06A776: STA.b ($90),Y

#_06A778: LDA.b #$22
#_06A77A: INY
#_06A77B: STA.b ($90),Y

#_06A77D: PHY

#_06A77E: TYA
#_06A77F: LSR A
#_06A780: LSR A
#_06A781: TAY

#_06A782: LDA.b $0F
#_06A784: STA.b ($92),Y

#_06A786: PLY
#_06A787: INY

#_06A788: PLX
#_06A789: DEX
#_06A78A: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06A78C: PLX

.exit
#_06A78D: RTL

;===================================================================================================

Cucco_Carried:
#_06A78E: JSR Cucco_DoMovement_XYZ
#_06A791: BEQ .dont_stop

#_06A793: JSR Sprite_InvertSpeed_XY
#_06A796: JSR Sprite_Move_XY_Bank06

#_06A799: JSR Sprite_HalveSpeed_XY
#_06A79C: JSR Sprite_HalveSpeed_XY

#_06A79F: JSR BawkBawk

.dont_stop
#_06A7A2: DEC.w $0F80,X

#_06A7A5: LDA.w $0F70,X
#_06A7A8: BPL .airborne

#_06A7AA: STZ.w $0F70,X

#_06A7AD: LDA.b #$02
#_06A7AF: STA.w $0D80,X

#_06A7B2: JMP.w Cucco_UpdateFleeSpeed

.airborne
#_06A7B5: JMP.w Cucco_AnimateFast

;===================================================================================================

Cucco_DoMovement_XYZ:
#_06A7B8: JSR Sprite_Move_Z_Bank06

;===================================================================================================

Cucco_DoMovement_XY:
#_06A7BB: JSR Sprite_Move_XY_Bank06
#_06A7BE: JSL Sprite_CheckTileCollision_long

#_06A7C2: RTS

;===================================================================================================

CuccoDistress:
.offset_x
#_06A7C3: db  -3,  -1,   2,   0
#_06A7C7: db   7,   0,  11,   0

.offset_y
#_06A7CB: db  -5,  -1,  -7,  -1
#_06A7CF: db  -7,  -1,  -5,  -1

;===================================================================================================

Cucco_SummonAvenger:
#_06A7D3: TXA
#_06A7D4: EOR.b $1A
#_06A7D6: AND.b #$0F
#_06A7D8: ORA.b $1B
#_06A7DA: BNE EXIT_06A852

#_06A7DC: LDA.b #$0B ; SPRITE 0B
#_06A7DE: LDY.b #$0A
#_06A7E0: JSL Sprite_SpawnDynamically_slot_limited
#_06A7E4: BMI EXIT_06A852

#_06A7E6: PHX

#_06A7E7: TYX

#_06A7E8: LDA.b #$1E ; SFX3.1E
#_06A7EA: JSL SpriteSFX_QueueSFX3WithPan

#_06A7EE: PLX

#_06A7EF: LDA.b #$01
#_06A7F1: STA.w $0DB0,Y

#_06A7F4: PHX

#_06A7F5: JSL GetRandomNumber
#_06A7F9: STA.b $0F

#_06A7FB: AND.b #$02
#_06A7FD: BEQ .enter_vertically

;---------------------------------------------------------------------------------------------------

.enter_horizontally
#_06A7FF: LDA.b $0F
#_06A801: ADC.b $E2
#_06A803: STA.w $0D10,Y

#_06A806: LDA.b $E3
#_06A808: ADC.b #$00
#_06A80A: STA.w $0D30,Y

#_06A80D: LDA.b $0F
#_06A80F: AND.b #$01
#_06A811: TAX

#_06A812: LDA.w CuccoSwarmSpeed,X
#_06A815: ADC.b $E8
#_06A817: STA.w $0D00,Y

#_06A81A: LDA.b $E9
#_06A81C: ADC.b #$00
#_06A81E: STA.w $0D20,Y

#_06A821: BRA .continue

;---------------------------------------------------------------------------------------------------

.enter_vertically
#_06A823: LDA.b $0F
#_06A825: ADC.b $E8
#_06A827: STA.w $0D00,Y

#_06A82A: LDA.b $E9
#_06A82C: ADC.b #$00
#_06A82E: STA.w $0D20,Y

#_06A831: LDA.b $0F
#_06A833: AND.b #$01
#_06A835: TAX

#_06A836: LDA.w CuccoSwarmSpeed,X
#_06A839: ADC.b $E2
#_06A83B: STA.w $0D10,Y

#_06A83E: LDA.b $E3
#_06A840: ADC.b #$00
#_06A842: STA.w $0D30,Y

;---------------------------------------------------------------------------------------------------

.continue
#_06A845: TYX

#_06A846: LDA.b #$20
#_06A848: JSR Sprite_ApplySpeedTowardsLink

#_06A84B: PLX

;===================================================================================================

BawkBawk:
#_06A84C: LDA.b #$30 ; SFX2.30
#_06A84E: JSL SpriteSFX_QueueSFX2WithPan

;---------------------------------------------------------------------------------------------------

#EXIT_06A852:
#_06A852: RTS

;===================================================================================================

Sprite_EE_CastleMantle_bounce:
#_06A853: JSL Sprite_EE_CastleMantle

#_06A857: RTS

;===================================================================================================

pool Hoarder_Covered

.anim_step
#_06A858: db $03, $04, $05, $04

.speed_x
#_06A85C: db -12,  12,   0,   0

.speed_y
#_06A860: db   0,   0, -12,  12

pool off

;===================================================================================================

pool Hoarder_Frantic

.speed_x
#_06A864: db -16,  16, -16,  16

.speed_y
#_06A868: db -16, -16,  16,  16

pool off

;===================================================================================================

Sprite_17_Hoarder:
Sprite_3E_Hoarder:
#_06A86C: LDA.w $0D80,X
#_06A86F: BEQ Hoarder_Covered

#_06A871: JMP.w Hoarder_Frantic

;===================================================================================================

Hoarder_Covered:
#_06A874: JSR SpriteDraw_Hoarder
#_06A877: JSR Sprite_CheckIfActive_Bank06

#_06A87A: STZ.w $0DC0,X

#_06A87D: JSR Sprite_DirectionToFaceLink

#_06A880: LDA.w $0DF0,X
#_06A883: BNE .flee

#_06A885: LDA.b $0E
#_06A887: CLC
#_06A888: ADC.b #$30
#_06A88A: CMP.b #$60
#_06A88C: BCS .not_close

#_06A88E: LDA.b $0F
#_06A890: CLC
#_06A891: ADC.b #$20
#_06A893: CMP.b #$40
#_06A895: BCS .not_close

#_06A897: LDA.b #$20
#_06A899: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.flee
#_06A89C: LDA.w .speed_x,Y
#_06A89F: STA.w $0D50,X

#_06A8A2: LDA.w .speed_y,Y
#_06A8A5: STA.w $0D40,X

#_06A8A8: LDA.w $0E70,X
#_06A8AB: BNE .tile_collision

#_06A8AD: JSR Sprite_Move_XY_Bank06

.tile_collision
#_06A8B0: JSR Sprite_CheckTileCollision
#_06A8B3: JSR Sprite_CheckDamageFromLink

#_06A8B6: INC.w $0E80,X

#_06A8B9: LDA.w $0E80,X
#_06A8BC: LSR A
#_06A8BD: AND.b #$03
#_06A8BF: TAY

#_06A8C0: LDA.w .anim_step,Y
#_06A8C3: STA.w $0DC0,X

.not_close
#_06A8C6: LDA.w $0E20,X
#_06A8C9: CMP.b #$3E ; SPRITE 3E
#_06A8CB: BNE .not_rock

#_06A8CD: LDA.l $7EF354
#_06A8D1: CMP.b #$01
#_06A8D3: BCC .weakling

.not_rock
#_06A8D5: JSL Sprite_CheckIfLifted_permissive_long

.weakling
#_06A8D9: LDA.w $0DD0,X
#_06A8DC: CMP.b #$09
#_06A8DE: BEQ .exit

#_06A8E0: LDA.b #$01

#_06A8E2: LDY.w $0E20,X
#_06A8E5: CPY.b #$17 ; SPRITE 17
#_06A8E7: BNE .rock_hoarder

#_06A8E9: INC A

.rock_hoarder
#_06A8EA: STA.w $0DB0,X

#_06A8ED: LDA.b #$EC ; SPRITE EC
#_06A8EF: STA.w $0E20,X

#_06A8F2: LSR.w $0F50,X
#_06A8F5: ASL.w $0F50,X

#_06A8F8: STZ.w $0DC0,X

;---------------------------------------------------------------------------------------------------

#_06A8FB: LDA.b #$3E ; SPRITE 3E
#_06A8FD: JSL Sprite_SpawnDynamically
#_06A901: BMI .exit

#_06A903: JSL Sprite_SetSpawnedCoordinates

#_06A907: LDA.w $0E40,Y
#_06A90A: ASL A
#_06A90B: LSR A
#_06A90C: STA.w $0E40,Y

#_06A90F: LDA.b #$80
#_06A911: STA.w $0E10,Y

#_06A914: LDA.b #$09
#_06A916: STA.w $0F50,Y
#_06A919: STA.w $0D80,Y

.exit
#_06A91C: RTS

;===================================================================================================

Hoarder_Frantic:
#_06A91D: JSR SpriteDraw_SingleLarge
#_06A920: JSR Sprite_CheckIfActive_Bank06
#_06A923: JSR Sprite_CheckIfRecoiling_Bank06
#_06A926: JSR Sprite_CheckDamageFromLink

#_06A929: LDA.w $0E10,X
#_06A92C: BNE .no_damage

#_06A92E: JSR Sprite_CheckDamageToLink

.no_damage
#_06A931: INC.w $0E80,X

#_06A934: LDA.w $0E80,X
#_06A937: LSR A
#_06A938: AND.b #$03
#_06A93A: TAY

#_06A93B: LDA.w .anim_step,Y
#_06A93E: STA.w $0DC0,X

#_06A941: LDA.w $0F50,X
#_06A944: AND.b #$BF
#_06A946: ORA.w .h_flip,Y
#_06A949: STA.w $0F50,X

#_06A94C: LDA.w $0E70,X
#_06A94F: BEQ .no_tile_collision

#_06A951: LDA.b #$10
#_06A953: STA.w $0F10,X

#_06A956: JSL GetRandomNumber
#_06A95A: AND.b #$03
#_06A95C: TAY

#_06A95D: LDA.w Hoarder_Frantic_speed_x,Y
#_06A960: STA.w $0D50,X

#_06A963: LDA.w Hoarder_Frantic_speed_y,Y
#_06A966: STA.w $0D40,X

#_06A969: BRA .continue

;---------------------------------------------------------------------------------------------------

.no_tile_collision
#_06A96B: JSR Sprite_Move_XY_Bank06

.continue
#_06A96E: JSR Sprite_CheckTileCollision

#_06A971: LDA.w $0F10,X
#_06A974: BNE .dont_turn

#_06A976: TXA
#_06A977: EOR.b $1A
#_06A979: AND.b #$1F
#_06A97B: BNE .dont_turn

#_06A97D: LDA.b #$10
#_06A97F: JSR Sprite_ProjectSpeedTowardsLink

#_06A982: LDA.b $00
#_06A984: EOR.b #$FF
#_06A986: INC A
#_06A987: STA.w $0D40,X

#_06A98A: LDA.b $01
#_06A98C: EOR.b #$FF
#_06A98E: INC A
#_06A98F: STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.dont_turn
#_06A992: LDA.b $1A
#_06A994: AND.b #$01
#_06A996: BNE .exit

#_06A998: INC.w $0ED0,X

#_06A99B: LDA.w $0ED0,X
#_06A99E: CMP.b #$C0
#_06A9A0: BNE .dont_die

#_06A9A2: LDA.b #$0F
#_06A9A4: JSR Sprite_ScheduleForBreakage_parameterized

#_06A9A7: LDY.b #$01

#_06A9A9: BRA .green_rupee

;---------------------------------------------------------------------------------------------------

.dont_die
#_06A9AB: LDA.w $0ED0,X
#_06A9AE: AND.b #$0F
#_06A9B0: BNE .exit

#_06A9B2: LDY.b #$00

#_06A9B4: LDA.w $0EB0,X
#_06A9B7: CMP.b #$06
#_06A9B9: BNE .green_rupee

#_06A9BB: LDA.b #$DB ; SPRITE DB
#_06A9BD: BRA .spit_rupee

.green_rupee
#_06A9BF: LDA.b #$D9 ; SPRITE D9

;---------------------------------------------------------------------------------------------------

.spit_rupee
#_06A9C1: JSL Sprite_SpawnDynamically_slot_limited
#_06A9C5: BMI .exit

#_06A9C7: INC.w $0EB0,X

#_06A9CA: JSL Sprite_SetSpawnedCoordinates

#_06A9CE: LDA.b $00
#_06A9D0: CLC
#_06A9D1: ADC.b #$08
#_06A9D3: STA.w $0D10,Y

#_06A9D6: LDA.b $01
#_06A9D8: ADC.b #$00
#_06A9DA: STA.w $0D30,Y

#_06A9DD: LDA.b #$20
#_06A9DF: STA.w $0F80,Y

#_06A9E2: LDA.b #$10
#_06A9E4: STA.w $0F10,Y

#_06A9E7: PHX

#_06A9E8: TYX

#_06A9E9: LDA.b #$10
#_06A9EB: JSR Sprite_ApplySpeedTowardsLink

#_06A9EE: LDA.b $00
#_06A9F0: EOR.b #$FF
#_06A9F2: STA.w $0D40,X

#_06A9F5: LDA.b $01
#_06A9F7: EOR.b #$FF
#_06A9F9: STA.w $0D50,X

#_06A9FC: PLX

#_06A9FD: LDA.b #$30 ; SFX3.30
#_06A9FF: JSL SpriteSFX_QueueSFX3WithPan

.exit
#_06AA03: RTS

;---------------------------------------------------------------------------------------------------

.anim_step
#_06AA04: db $00, $01, $00, $01

.h_flip
#_06AA08: db $00, $00, $40, $00

;===================================================================================================

Sprite_CheckIfLifted_permissive_long:
#_06AA0C: PHB
#_06AA0D: PHK
#_06AA0E: PLB

#_06AA0F: JSR .wrapper

#_06AA12: PLB

#_06AA13: RTL

;---------------------------------------------------------------------------------------------------

.wrapper
#_06AA14: JSR Sprite_CheckIfLifted_permissive

#_06AA17: RTS

;===================================================================================================

pool SpriteDraw_Hoarder

.offset_y
#_06AA18: dw   0,   0,   0,  -3
#_06AA20: dw   0,  -5,   0,  -6
#_06AA28: dw   0,  -6,   0,  -6

.char
#_06AA30: db $44, $44, $E8, $44
#_06AA34: db $E8, $44, $E6, $44
#_06AA38: db $E8, $44, $E6, $44

.props
#_06AA3C: db $00, $0C, $03, $0C
#_06AA40: db $03, $0C, $03, $0C
#_06AA44: db $03, $0C, $43, $0C

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Hoarder:
#_06AA48: JSR Sprite_PrepOAMCoord

#_06AA4B: LDA.w $0FC6
#_06AA4E: CMP.b #$03
#_06AA50: BCS .exit

#_06AA52: STZ.b $07

#_06AA54: LDA.w $0E20,X
#_06AA57: CMP.b #$17 ; SPRITE 17
#_06AA59: BNE .rock_hoarder

#_06AA5B: LDA.b #$02
#_06AA5D: STA.b $07

.rock_hoarder
#_06AA5F: LDA.w $0DC0,X
#_06AA62: ASL A
#_06AA63: STA.b $06

;---------------------------------------------------------------------------------------------------

#_06AA65: PHX

#_06AA66: LDX.b #$01

.next_object
#_06AA68: PHX

#_06AA69: TXA
#_06AA6A: CLC
#_06AA6B: ADC.b $06
#_06AA6D: PHA

#_06AA6E: ASL A
#_06AA6F: TAX

#_06AA70: REP #$20

#_06AA72: LDA.b $00
#_06AA74: STA.b ($90),Y

#_06AA76: AND.w #$0100
#_06AA79: STA.b $0E

#_06AA7B: LDA.b $02
#_06AA7D: CLC
#_06AA7E: ADC.w .offset_y,X

#_06AA81: INY
#_06AA82: STA.b ($90),Y

#_06AA84: CLC
#_06AA85: ADC.w #$0010
#_06AA88: CMP.w #$0100

#_06AA8B: SEP #$20
#_06AA8D: BCC .on_screen

#_06AA8F: LDA.b #$F0
#_06AA91: STA.b ($90),Y

.on_screen
#_06AA93: PLX

#_06AA94: LDA.w .char,X
#_06AA97: CMP.b #$44
#_06AA99: BNE .change_char

#_06AA9B: CLC
#_06AA9C: ADC.b $07

.change_char
#_06AA9E: INY
#_06AA9F: STA.b ($90),Y

#_06AAA1: LDA.b $05
#_06AAA3: AND.b #$FE
#_06AAA5: ORA.w .props,X

#_06AAA8: INY
#_06AAA9: STA.b ($90),Y

#_06AAAB: PHY

#_06AAAC: TYA
#_06AAAD: LSR A
#_06AAAE: LSR A
#_06AAAF: TAY

#_06AAB0: LDA.b #$02
#_06AAB2: ORA.b $0F
#_06AAB4: STA.b ($92),Y

#_06AAB6: PLY
#_06AAB7: INY

#_06AAB8: PLX
#_06AAB9: DEX
#_06AABA: BPL .next_object

#_06AABC: PLX

.exit
#_06AABD: RTS

;===================================================================================================

pool SpriteDraw_ThrownItem

.char
#_06AABE: db $42, $44, $46, $00
#_06AAC2: db $46, $44, $42, $44
#_06AAC6: db $44, $00, $46, $44

.palette
#_06AACA: db $0C, $0C
#_06AACC: db $0C, $00
#_06AACE: db $00, $00

.oam_main
#_06AAD0: dw $08B0, $08B4, $08B8, $08BC

.oam_small
#_06AAD8: dw $0A4C, $0A4D, $0A4E, $0A4F

pool off

;===================================================================================================

Sprite_EC_ThrownItem:
#_06AAE0: LDA.w $0FC6
#_06AAE3: CMP.b #$03
#_06AAE5: BCS .continue

#_06AAE7: LDA.w $0FB3
#_06AAEA: BEQ .dont_use_reserved_slots

#_06AAEC: LDA.w $0F20,X
#_06AAEF: BEQ .dont_use_reserved_slots

#_06AAF1: TXA
#_06AAF2: AND.b #$03
#_06AAF4: ASL A
#_06AAF5: TAY

#_06AAF6: REP #$20

#_06AAF8: LDA.w SpriteDraw_ThrownItem_oam_main,Y
#_06AAFB: STA.b $90

#_06AAFD: LDA.w SpriteDraw_ThrownItem_oam_small,Y
#_06AB00: STA.b $92

#_06AB02: SEP #$20

.dont_use_reserved_slots
#_06AB04: LDA.w $0DD0,X
#_06AB07: STA.w $0BA0,X

#_06AB0A: LDA.w $0DB0,X
#_06AB0D: CMP.b #$06
#_06AB0F: BCC .not_big

#_06AB11: JSR SpriteDraw_ThrownItem_Gigantic
#_06AB14: BRA .continue

.not_big
#_06AB16: JSR SpriteDraw_SingleLarge

#_06AB19: PHX

#_06AB1A: LDA.b $1B
#_06AB1C: CLC
#_06AB1D: ADC.w $0FFF
#_06AB20: CMP.b #$02

#_06AB22: LDA.w $0DB0,X
#_06AB25: PHA

#_06AB26: BCC .not_skull_pot

#_06AB28: ADC.b #$05

.not_skull_pot
#_06AB2A: TAX

#_06AB2B: LDA.w SpriteDraw_ThrownItem_char,X
#_06AB2E: LDY.b #$02
#_06AB30: STA.b ($90),Y

#_06AB32: INY

#_06AB33: LDA.b ($90),Y
#_06AB35: AND.b #$F0

#_06AB37: PLX

#_06AB38: ORA.w SpriteDraw_ThrownItem_palette,X
#_06AB3B: STA.b ($90),Y

#_06AB3D: PLX

#_06AB3E: AND.b #$0F
#_06AB40: STA.b $00

#_06AB42: LDA.w $0F50,X
#_06AB45: AND.b #$C0
#_06AB47: ORA.b $00
#_06AB49: STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.continue
#_06AB4C: LDA.w $0DD0,X
#_06AB4F: CMP.b #$09
#_06AB51: BNE .exit

#_06AB53: JSR Sprite_CheckIfActive_Bank06
#_06AB56: JSR ThrowableScenery_InteractWithSpritesAndTiles

.exit
#_06AB59: RTS

;===================================================================================================

pool SpriteDraw_ThrownItem_Gigantic

.offset_x
#_06AB5A: dw  -8,   8,  -8,   8

.offset_y
#_06AB62: dw -14, -14,   2,   2

.flip
#_06AB6A: db $00, $40, $80, $C0

.offset_shadow
#_06AB6E: dw  -6,   0,   6,  12

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_ThrownItem_Gigantic:
#_06AB76: LDY.w $0DB0,X

#_06AB79: LDA.w .offset_shadow,Y
#_06AB7C: STA.w $0F50,X

#_06AB7F: JSR Sprite_PrepOAMCoord

#_06AB82: PHX

#_06AB83: LDX.b #$03

.next_object
#_06AB85: PHX

#_06AB86: TXA
#_06AB87: ASL A
#_06AB88: TAX

#_06AB89: REP #$20

#_06AB8B: LDA.b $00
#_06AB8D: CLC
#_06AB8E: ADC.w .offset_x,X
#_06AB91: STA.b ($90),Y

#_06AB93: AND.w #$0100
#_06AB96: STA.b $0E

#_06AB98: LDA.b $02
#_06AB9A: CLC
#_06AB9B: ADC.w .offset_y,X

#_06AB9E: INY
#_06AB9F: STA.b ($90),Y

#_06ABA1: CLC
#_06ABA2: ADC.w #$0010
#_06ABA5: CMP.w #$0100

#_06ABA8: SEP #$20
#_06ABAA: BCC .on_screen

#_06ABAC: LDA.b #$F0
#_06ABAE: STA.b ($90),Y

.on_screen
#_06ABB0: PLX

#_06ABB1: LDA.b #$4A
#_06ABB3: INY
#_06ABB4: STA.b ($90),Y

#_06ABB6: LDA.w .flip,X
#_06ABB9: INY
#_06ABBA: ORA.b $05
#_06ABBC: STA.b ($90),Y

#_06ABBE: PHY

#_06ABBF: TYA
#_06ABC0: LSR A
#_06ABC1: LSR A
#_06ABC2: TAY

#_06ABC3: LDA.b #$02
#_06ABC5: ORA.b $0F
#_06ABC7: STA.b ($92),Y

#_06ABC9: PLY
#_06ABCA: INY

#_06ABCB: DEX
#_06ABCC: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06ABCE: PLX

#_06ABCF: LDA.b #$0C
#_06ABD1: JSL SpriteDraw_AllocateOAMFromRegionB

#_06ABD5: LDY.b #$00

#_06ABD7: LDA.w $0D00,X
#_06ABDA: SEC
#_06ABDB: SBC.b $E8
#_06ABDD: STA.b $02

#_06ABDF: LDA.w $0D20,X
#_06ABE2: SBC.b $E9
#_06ABE4: STA.b $03

#_06ABE6: PHX

#_06ABE7: LDX.b #$02

.next_shadow
#_06ABE9: PHX

#_06ABEA: TXA
#_06ABEB: ASL A
#_06ABEC: TAX

#_06ABED: REP #$20

#_06ABEF: LDA.b $00
#_06ABF1: CLC
#_06ABF2: ADC.w .offset_shadow,X
#_06ABF5: STA.b ($90),Y

#_06ABF7: AND.w #$0100
#_06ABFA: STA.b $0E

#_06ABFC: LDA.b $02
#_06ABFE: CLC
#_06ABFF: ADC.w #$000C

#_06AC02: INY
#_06AC03: STA.b ($90),Y

#_06AC05: CLC
#_06AC06: ADC.w #$0010
#_06AC09: CMP.w #$0100

#_06AC0C: SEP #$20
#_06AC0E: BCC .shadow_on_screen

#_06AC10: LDA.b #$F0
#_06AC12: STA.b ($90),Y

.shadow_on_screen
#_06AC14: PLX

#_06AC15: LDA.b #$6C
#_06AC17: INY
#_06AC18: STA.b ($90),Y

#_06AC1A: LDA.b #$24
#_06AC1C: INY
#_06AC1D: STA.b ($90),Y

#_06AC1F: PHY

#_06AC20: TYA
#_06AC21: LSR A
#_06AC22: LSR A
#_06AC23: TAY

#_06AC24: LDA.b #$02
#_06AC26: ORA.b $0F
#_06AC28: STA.b ($92),Y

#_06AC2A: PLY
#_06AC2B: INY

#_06AC2C: DEX
#_06AC2D: BPL .next_shadow

;---------------------------------------------------------------------------------------------------

#_06AC2F: PLX

#_06AC30: RTS

;===================================================================================================

pool ThrowableScenery_ScatterIntoDebris

.offset_x_low
#_06AC31: db -8,  8, -8,  8

.offset_x_high
#_06AC35: db -1,  0, -1,  0

.offset_y_low
#_06AC39: db -8, -8,  8,  8

.offset_y_high
#_06AC3D: db -1, -1,  0,  0

pool off

;---------------------------------------------------------------------------------------------------

ThrowableScenery_ScatterIntoDebris:
#_06AC41: LDA.w $0DB0,X
#_06AC44: BMI ThrowableScenery_ScatterIntoSmallerDebris

#_06AC46: CMP.b #$06
#_06AC48: BCC ThrowableScenery_ScatterIntoSmallerDebris

#_06AC4A: LDA.b #$03
#_06AC4C: STA.b $0D

.next_particle
#_06AC4E: LDA.b #$EC ; SPRITE EC
#_06AC50: JSL Sprite_SpawnDynamically
#_06AC54: BMI .no_space

#_06AC56: LDA.w $0F70,X
#_06AC59: STA.w $0F70,Y

#_06AC5C: PHX

#_06AC5D: LDX.b $0D

#_06AC5F: LDA.b $00
#_06AC61: CLC
#_06AC62: ADC.w .offset_x_low,X
#_06AC65: STA.w $0D10,Y

#_06AC68: LDA.b $01
#_06AC6A: ADC.w .offset_x_high,X
#_06AC6D: STA.w $0D30,Y

#_06AC70: LDA.b $02
#_06AC72: CLC
#_06AC73: ADC.w .offset_y_low,X
#_06AC76: STA.w $0D00,Y

#_06AC79: LDA.b $03
#_06AC7B: ADC.w .offset_y_high,X
#_06AC7E: STA.w $0D20,Y

#_06AC81: LDA.b #$01
#_06AC83: STA.w $0DB0,Y

#_06AC86: TYX
#_06AC87: JSR Sprite_ScheduleForBreakage

#_06AC8A: PLX

#_06AC8B: LDA.w $0DB0,X
#_06AC8E: CMP.b #$07

#_06AC90: LDA.b #$00
#_06AC92: BCS .default_palette

#_06AC94: LDA.b #$0C

.default_palette
#_06AC96: STA.w $0F50,Y

.no_space
#_06AC99: DEC.b $0D
#_06AC9B: BPL .next_particle

#_06AC9D: STZ.w $0DD0,X

#_06ACA0: RTS

;===================================================================================================

ThrowableScenery_ScatterIntoSmallerDebris:
#_06ACA1: STZ.w $0DD0,X

#_06ACA4: JSR Sprite_PrepOAMCoord

#_06ACA7: PHX

#_06ACA8: TXY
#_06ACA9: LDX.b #$1D

.next_slot
#_06ACAB: LDA.l $7FF800,X
#_06ACAF: BEQ .empty_slot

#_06ACB1: DEX
#_06ACB2: BPL .next_slot

#_06ACB4: INX

.empty_slot
#_06ACB5: LDA.b #$16 ; GARNISH 16
#_06ACB7: STA.l $7FF800,X
#_06ACBB: STA.w $0FB4

#_06ACBE: LDA.w $0D10,Y
#_06ACC1: STA.l $7FF83C,X

#_06ACC5: LDA.w $0D30,Y
#_06ACC8: STA.l $7FF878,X

#_06ACCC: LDA.w $0D00,Y
#_06ACCF: SEC
#_06ACD0: SBC.w $0F70,Y

#_06ACD3: PHP

#_06ACD4: CLC
#_06ACD5: ADC.b #$10
#_06ACD7: STA.l $7FF81E,X

#_06ACDB: LDA.w $0D20,Y
#_06ACDE: ADC.b #$00

#_06ACE0: PLP
#_06ACE1: SBC.b #$00
#_06ACE3: STA.l $7FF85A,X

#_06ACE7: LDA.b $05
#_06ACE9: STA.l $7FF9FE,X

#_06ACED: LDA.w $0F20,Y
#_06ACF0: STA.l $7FF968,X

#_06ACF4: LDA.b #$1F
#_06ACF6: STA.l $7FF90E,X

#_06ACFA: LDA.w $0DB0,Y
#_06ACFD: STA.l $7FF92C,X

#_06AD01: PLX

#_06AD02: RTS

;===================================================================================================

ApplyRumbleToSprites:
#_06AD03: LDY.b #$0F

.next_sprite
#_06AD05: LDA.w $0CAA,Y
#_06AD08: AND.b #$02
#_06AD0A: BEQ .skip

#_06AD0C: LDA.w $0E90,Y
#_06AD0F: BEQ .skip

#_06AD11: LDA.w $0FC6
#_06AD14: CMP.b #$0E
#_06AD16: BEQ .collision_guaranteed

#_06AD18: PHX

#_06AD19: TYX
#_06AD1A: JSR Sprite_SetupHitBox

#_06AD1D: PLX

#_06AD1E: JSR CheckIfHitBoxesOverlap
#_06AD21: BCC .skip

.collision_guaranteed
#_06AD23: LDA.b #$00
#_06AD25: STA.w $0E90,Y

#_06AD28: LDA.b #$30 ; SFX3.30
#_06AD2A: STA.w $012F

#_06AD2D: LDA.b #$30
#_06AD2F: STA.w $0F80,Y

#_06AD32: LDA.b #$10
#_06AD34: STA.w $0D50,Y

#_06AD37: LDA.b #$30
#_06AD39: STA.w $0EE0,Y

#_06AD3C: LDA.b #$FF
#_06AD3E: STA.w $0B58,Y

#_06AD41: LDA.w $0E20,Y ; hearts in trees turn into bombs
#_06AD44: CMP.b #$D8 ; SPRITE D8
#_06AD46: BNE .skip

#_06AD48: JSL Sprite_TransmuteToBomb

.skip
#_06AD4C: DEY
#_06AD4D: BPL .next_sprite

#_06AD4F: RTS

;===================================================================================================

Sprite_TransmuteToBomb:
#_06AD50: LDA.b #$4A ; SPRITE 4A
#_06AD52: STA.w $0E20,Y

#_06AD55: LDA.b #$01
#_06AD57: STA.w $0DB0,Y

#_06AD5A: LDA.b #$FF
#_06AD5C: STA.w $0E00,Y

#_06AD5F: LDA.b #$18
#_06AD61: STA.w $0E60,Y

#_06AD64: LDA.b #$08
#_06AD66: STA.w $0F50,Y

#_06AD69: LDA.b #$00
#_06AD6B: STA.w $0E50,Y

#_06AD6E: RTL

;===================================================================================================

Sprite_28_DarkWorldHintNPC:
#_06AD6F: JSR SpriteDraw_DarkWorldHintNPC
#_06AD72: JSR Sprite_CheckIfActive_Bank06
#_06AD75: JSL Sprite_BehaveAsBarrier

#_06AD79: LDA.w $0DF0,X
#_06AD7C: BNE .delay

#_06AD7E: LDA.b $1A

#_06AD80: LSR A
#_06AD81: LSR A
#_06AD82: LSR A
#_06AD83: LSR A

#_06AD84: AND.b #$01
#_06AD86: STA.w $0DC0,X

.delay
#_06AD89: LDA.w $0E80,X
#_06AD8C: JSL JumpTableLocal
#_06AD90: dw DarkWorldHintNPC_Bird
#_06AD92: dw HamburgerHelper
#_06AD94: dw DarkWorldHintNPC_Octopus
#_06AD96: dw Broccoli
#_06AD98: dw Watto

;===================================================================================================

DarkWorldHintNPC_Bird:
#_06AD9A: LDA.w $0D80,X
#_06AD9D: JSL JumpTableLocal
#_06ADA1: dw DarkWorldHintNPC_Idle
#_06ADA3: dw HintBird_TellStory
#_06ADA5: dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

DarkWorldHintNPC_Idle:
#_06ADA7: LDA.b #$FE ; MESSAGE 00FE
#_06ADA9: LDY.b #$00
#_06ADAB: JSL Sprite_ShowSolicitedMessage
#_06ADAF: BCC .exit

#_06ADB1: INC.w $0D80,X

.exit
#_06ADB4: RTS

;===================================================================================================

DarkWorldHintNPC_RestoreHealth:
#_06ADB5: LDA.b #$A0
#_06ADB7: STA.l $7EF372

#_06ADBB: STZ.w $0D80,X

#_06ADBE: RTS

;===================================================================================================

HintBird_TellStory:
#_06ADBF: LDA.w $1CE8
#_06ADC2: BNE .rejected

#_06ADC4: JSR DarkWorldHintNPC_HandlePayment
#_06ADC7: BCC .rejected

#_06ADC9: LDA.b #$FF ; MESSAGE 00FF
#_06ADCB: LDY.b #$00

;---------------------------------------------------------------------------------------------------

#DarkWorldHintNPC_TellStory:
#_06ADCD: JSL Sprite_ShowMessageUnconditional

#_06ADD1: INC.w $0D80,X

#_06ADD4: RTS

;---------------------------------------------------------------------------------------------------

.rejected
#_06ADD5: LDA.b #$00 ; MESSAGE 0100
#_06ADD7: LDY.b #$01
#_06ADD9: JSL Sprite_ShowMessageUnconditional

#_06ADDD: STZ.w $0D80,X

#_06ADE0: RTS

;===================================================================================================

HamburgerHelper:
#_06ADE1: LDA.w $0D80,X
#_06ADE4: JSL JumpTableLocal
#_06ADE8: dw DarkWorldHintNPC_Idle
#_06ADEA: dw HamburgerHelper_TellStory
#_06ADEC: dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

HamburgerHelper_TellStory:
#_06ADEE: LDA.w $1CE8
#_06ADF1: BNE .rejected

#_06ADF3: JSR DarkWorldHintNPC_HandlePayment
#_06ADF6: BCC .rejected

#_06ADF8: LDA.b #$01 ; MESSAGE 0101
#_06ADFA: LDY.b #$01
#_06ADFC: BRA DarkWorldHintNPC_TellStory

.rejected
#_06ADFE: LDA.b #$00 ; MESSAGE 0100
#_06AE00: LDY.b #$01
#_06AE02: JSL Sprite_ShowMessageUnconditional

#_06AE06: STZ.w $0D80,X

#_06AE09: RTS

;===================================================================================================

DarkWorldHintNPC_Octopus:
#_06AE0A: LDA.w $0D80,X
#_06AE0D: JSL JumpTableLocal
#_06AE11: dw DarkWorldHintNPC_Idle
#_06AE13: dw HintOctopus_TellStory
#_06AE15: dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

HintOctopus_TellStory:
#_06AE17: LDA.w $1CE8
#_06AE1A: BNE .rejected

#_06AE1C: JSR DarkWorldHintNPC_HandlePayment
#_06AE1F: BCC .rejected

#_06AE21: LDA.b #$02 ; MESSAGE 0102
#_06AE23: LDY.b #$01
#_06AE25: JMP.w DarkWorldHintNPC_TellStory

;---------------------------------------------------------------------------------------------------

.rejected
#_06AE28: LDA.b #$00 ; MESSAGE 0100
#_06AE2A: LDY.b #$01
#_06AE2C: JSL Sprite_ShowMessageUnconditional

#_06AE30: STZ.w $0D80,X

#_06AE33: RTS

;===================================================================================================

Broccoli:
#_06AE34: LDA.w $0DF0,X
#_06AE37: BNE .continue

#_06AE39: LDA.b $1A
#_06AE3B: AND.b #$3F
#_06AE3D: BNE .dont_flip

#_06AE3F: LDA.w $0F50,X
#_06AE42: EOR.b #$40
#_06AE44: STA.w $0F50,X

.dont_flip
#_06AE47: JSL GetRandomNumber
#_06AE4B: BNE .continue

#_06AE4D: LDA.b #$20
#_06AE4F: STA.w $0DF0,X

.continue
#_06AE52: LDA.b #$49 ; MESSAGE 0149
#_06AE54: LDY.b #$01
#_06AE56: JSL Sprite_ShowSolicitedMessage

#_06AE5A: RTS

;===================================================================================================

Watto:
#_06AE5B: LDA.b $1A
#_06AE5D: LSR A
#_06AE5E: AND.b #$01
#_06AE60: STA.w $0DC0,X

#_06AE63: JSR Sprite_Move_Z_Bank06

#_06AE66: LDA.w $0F70,X
#_06AE69: BPL .air_born

#_06AE6B: STZ.w $0F70,X

.air_born
#_06AE6E: LDA.w $0F70,X
#_06AE71: CMP.b #$04
#_06AE73: ROL A
#_06AE74: AND.b #$01
#_06AE76: TAY

#_06AE77: LDA.w $0F80,X
#_06AE7A: CLC
#_06AE7B: ADC.w PositiveAndNegativeOne,Y
#_06AE7E: STA.w $0F80,X

#_06AE81: LDA.w $0D80,X
#_06AE84: JSL JumpTableLocal
#_06AE88: dw DarkWorldHintNPC_Idle
#_06AE8A: dw Watto_TellStory
#_06AE8C: dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

Watto_TellStory:
#_06AE8E: LDA.w $1CE8
#_06AE91: BNE .rejected

#_06AE93: JSR DarkWorldHintNPC_HandlePayment
#_06AE96: BCC .rejected

#_06AE98: LDA.b #$03 ; MESSAGE 0103
#_06AE9A: LDY.b #$01
#_06AE9C: JMP.w DarkWorldHintNPC_TellStory

.rejected
#_06AE9F: LDA.b #$00 ; MESSAGE 0100
#_06AEA1: LDY.b #$01
#_06AEA3: JSL Sprite_ShowMessageUnconditional

#_06AEA7: STZ.w $0D80,X

#_06AEAA: RTS

;===================================================================================================

DarkWorldHintNPC_HandlePayment:
#_06AEAB: REP #$20

#_06AEAD: LDA.l $7EF360
#_06AEB1: CMP.w #$14
#_06AEB4: BCC .too_poor

#_06AEB6: LDA.l $7EF360
#_06AEBA: SEC
#_06AEBB: SBC.w #20
#_06AEBE: STA.l $7EF360

#_06AEC2: SEP #$30
#_06AEC4: SEC

#_06AEC5: RTS

;---------------------------------------------------------------------------------------------------

.too_poor
#_06AEC6: SEP #$30
#_06AEC8: CLC

#_06AEC9: RTS

;===================================================================================================

pool SpriteDraw_DarkWorldHintNPC

.oam_groups
#_06AECA: dw   0,   0 : db $4A, $0A, $00, $02
#_06AED2: dw   0,   0 : db $6E, $4A, $00, $02

#_06AEDA: dw   0,   0 : db $24, $0A, $00, $02
#_06AEE2: dw   0,   0 : db $24, $4A, $00, $02

#_06AEEA: dw   0,   0 : db $04, $08, $00, $02
#_06AEF2: dw   0,   0 : db $04, $48, $00, $02

#_06AEFA: dw   0,   0 : db $6A, $0A, $00, $02
#_06AF02: dw   0,   0 : db $6C, $0A, $00, $02

#_06AF0A: dw   0,   0 : db $0E, $0A, $00, $02
#_06AF12: dw   0,   0 : db $2E, $0A, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_DarkWorldHintNPC:
#_06AF1A: LDA.w $0E80,X
#_06AF1D: ASL A

#_06AF1E: ADC.w $0DC0,X

#_06AF21: ASL A
#_06AF22: ASL A
#_06AF23: ASL A

#_06AF24: ADC.b #.oam_groups>>0
#_06AF26: STA.b $08

#_06AF28: LDA.b #.oam_groups>>8
#_06AF2A: ADC.b #$00
#_06AF2C: STA.b $09

#_06AF2E: LDA.b #$01
#_06AF30: STA.b $06
#_06AF32: STZ.b $07

#_06AF34: JSL SpriteDraw_Tabulated_player_deferred

#_06AF38: JMP.w SpriteDraw_Shadow

;===================================================================================================

Sprite_2E_FluteKid:
#_06AF3B: LDA.w $0EB0,X
#_06AF3E: JSL JumpTableLocal
#_06AF42: dw FluteKid_TheKid
#_06AF44: dw FluteKid_Quaver

;===================================================================================================

FluteKid_TheKid:
#_06AF46: LDA.w $0E80,X
#_06AF49: JSL JumpTableLocal
#_06AF4D: dw FluteKid_Human
#_06AF4F: dw FluteKid_Stumpy

;===================================================================================================

FluteKid_Human:
#_06AF51: LDA.w $0D80,X
#_06AF54: CMP.b #$03
#_06AF56: BEQ .invisible

#_06AF58: JSL SpriteDraw_FluteKid

#_06AF5C: LDA.b $01
#_06AF5E: ORA.b $03
#_06AF60: STA.w $0DB0,X

.invisible
#_06AF63: JSR Sprite_CheckIfActive_Bank06

#_06AF66: LDA.w $0DB0,X
#_06AF69: BNE .no_tune

#_06AF6B: LDA.w $0DA0,X
#_06AF6E: BNE .no_tune

#_06AF70: LDA.b #$0B ; SFX1.0B
#_06AF72: STA.w $012D
#_06AF75: STA.w $0DA0,X

.no_tune
#_06AF78: LDA.b $1A
#_06AF7A: LSR A
#_06AF7B: LSR A
#_06AF7C: LSR A
#_06AF7D: LSR A
#_06AF7E: LSR A
#_06AF7F: AND.b #$01
#_06AF81: STA.w $0DC0,X

#_06AF84: LDA.w $0D80,X
#_06AF87: JSL JumpTableLocal
#_06AF8B: dw FluteKid_Chillin
#_06AF8D: dw FluteKid_AboutToDisappear
#_06AF8F: dw FluteKid_PhaseOut
#_06AF91: dw FluteKid_HeDisappeared

;===================================================================================================

FluteKid_Chillin:
#_06AF93: LDA.l $7EF34C
#_06AF97: CMP.b #$02
#_06AF99: BCS .flute_owned

#_06AF9B: JSR FluteKid_CheckIfInRange
#_06AF9E: BCS .not_close

.flute_owned
#_06AFA0: INC.w $0D80,X
#_06AFA3: INC.w $0DE0,X

#_06AFA6: INC.w $0FDD

#_06AFA9: LDA.b #$B0
#_06AFAB: STA.w $0DF0,X

#_06AFAE: LDA.b #$01
#_06AFB0: STA.w $02E4

.not_close
#_06AFB3: LDA.w $0DF0,X
#_06AFB6: BNE .exit

#_06AFB8: LDA.b #$19
#_06AFBA: STA.w $0DF0,X

#_06AFBD: JSR FluteKid_SpawnQuaver

.exit
#_06AFC0: RTS

;===================================================================================================

FluteKid_AboutToDisappear:
#_06AFC1: LDA.b #$01
#_06AFC3: STA.w $02E4

#_06AFC6: LDA.w $0DF0,X
#_06AFC9: BNE .exit

#_06AFCB: LDA.b #$02
#_06AFCD: STA.b $1D

#_06AFCF: LDA.b #$30
#_06AFD1: STA.b $9A

#_06AFD3: LDA.b #$00
#_06AFD5: STA.l $7EC007
#_06AFD9: STA.l $7EC009

#_06AFDD: PHX
#_06AFDE: JSL Palette_AssertTranslucencySwap
#_06AFE2: PLX

#_06AFE3: INC.w $0D80,X

#_06AFE6: LDA.b #$80 ; SFX1.80 - fade
#_06AFE8: STA.w $012D

#_06AFEB: LDA.b #$33 ; SFX2.33
#_06AFED: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_06AFF1: RTS

;===================================================================================================

FluteKid_PhaseOut:
#_06AFF2: LDA.b $1A
#_06AFF4: AND.b #$0F
#_06AFF6: BNE .exit

#_06AFF8: PHX
#_06AFF9: JSL PaletteFilter_SP5F
#_06AFFD: PLX

#_06AFFE: LDA.l $7EC007
#_06B002: BNE .exit

#_06B004: INC.w $0D80,X

.exit
#_06B007: RTS

;===================================================================================================

FluteKid_HeDisappeared:
#_06B008: PHX

#_06B009: JSL PaletteFilter_RestoreSP5F
#_06B00D: JSL Palette_RevertTranslucencySwap

#_06B011: PLX

#_06B012: STZ.w $0DD0,X
#_06B015: STZ.w $02E4

#_06B018: RTS

;===================================================================================================

Stumpify_anim_step:
#_06B019: db $01, $01, $01, $01
#_06B01D: db $02, $01, $02, $01
#_06B021: db $02, $01, $02, $03
#_06B025: db $02, $03, $02, $03
#_06B029: db $02, $03, $02, $FF

;===================================================================================================

StumpifyTimer:
#_06B02D: db $FF, $FF, $FF,  16
#_06B031: db   2,  12,   6,   8
#_06B035: db  10,   4,  14,   2
#_06B039: db  10,   6,   6,  10
#_06B03D: db   2,  14,   2

;===================================================================================================

FluteKid_Stumpy:
#_06B040: JSL SpriteDraw_Stumpy
#_06B044: JSR Sprite_CheckIfActive_Bank06

#_06B047: LDA.w $0D80,X
#_06B04A: JSL JumpTableLocal
#_06B04E: dw Stumpy_Initialize
#_06B050: dw Stumpy_WaitForConvo
#_06B052: dw Stumpy_GiveShovel
#_06B054: dw Stumpy_WaitForMusic
#_06B056: dw Stumpy_BecomeTree
#_06B058: dw Stumpy_AmTree

;===================================================================================================

Stumpy_Initialize:
#_06B05A: LDA.l $7EF34C
#_06B05E: AND.b #$03
#_06B060: JSL JumpTableLocal
#_06B064: dw Stumpy_Supplicate
#_06B066: dw Stumpy_GetMeMyDamnFlute
#_06B068: dw Stumpy_ThanksButYouKeepIt
#_06B06A: dw Stumpy_SorryButAmTree

;===================================================================================================

Stumpy_Supplicate:
#_06B06C: LDA.b #$E5 ; MESSAGE 00E5
#_06B06E: LDY.b #$00
#_06B070: JSL Sprite_ShowSolicitedMessage
#_06B074: BCC .exit

#_06B076: INC.w $0D80,X

.exit
#_06B079: RTS

;===================================================================================================

Stumpy_GetMeMyDamnFlute:
#_06B07A: LDA.b #$E8 ; MESSAGE 00E8
#_06B07C: LDY.b #$00
#_06B07E: JSL Sprite_ShowSolicitedMessage

#_06B082: RTS

;===================================================================================================

Stumpy_ThanksButYouKeepIt:
#_06B083: LDA.b #$01
#_06B085: STA.w $0DC0,X

#_06B088: LDA.b #$E9 ; MESSAGE 00E9
#_06B08A: LDY.b #$00
#_06B08C: JSL Sprite_ShowSolicitedMessage
#_06B090: BCC .exit

#_06B092: LDA.b #$03
#_06B094: STA.w $0D80,X

.exit
#_06B097: RTS

;===================================================================================================

Stumpy_SorryButAmTree:
#_06B098: LDA.b #$03
#_06B09A: STA.w $0DC0,X

#_06B09D: RTS

;===================================================================================================

Stumpy_WaitForConvo:
#_06B09E: LDA.w $1CE8
#_06B0A1: BNE .rejected

#_06B0A3: LDA.b #$E6 ; MESSAGE 00E6
#_06B0A5: LDY.b #$00
#_06B0A7: JSL Sprite_ShowMessageUnconditional

#_06B0AB: INC.w $0D80,X

#_06B0AE: RTS

.rejected
#_06B0AF: LDA.b #$E7 ; MESSAGE 00E7
#_06B0B1: LDY.b #$00
#_06B0B3: JSL Sprite_ShowMessageUnconditional

#_06B0B7: STZ.w $0D80,X

#_06B0BA: RTS

;===================================================================================================

Stumpy_GiveShovel:
#_06B0BB: STZ.w $02E9

#_06B0BE: LDY.b #$13 ; ITEMGET 13

#_06B0C0: PHX

#_06B0C1: JSL Link_ReceiveItem

#_06B0C5: PLX

#_06B0C6: STZ.w $0D80,X

#_06B0C9: RTS

;===================================================================================================

Stumpy_WaitForMusic:
#_06B0CA: LDA.w $0202
#_06B0CD: CMP.b #$0D
#_06B0CF: BNE .exit

#_06B0D1: BIT.b $F0
#_06B0D3: BVC .exit

#_06B0D5: INC.w $0D80,X

#_06B0D8: LDA.b #$F2 ; SONG F2 - half volume
#_06B0DA: STA.w $012C

#_06B0DD: STZ.w $012E

#_06B0E0: LDA.b #$17 ; SFX1.17
#_06B0E2: STA.w $012D

#_06B0E5: INC.w $02E4

.exit
#_06B0E8: RTS

;===================================================================================================

Stumpy_BecomeTree:
#_06B0E9: LDA.w $0DF0,X
#_06B0EC: BNE .exit

#_06B0EE: LDA.w $0D90,X
#_06B0F1: CMP.b #$03
#_06B0F3: BCC .skip_sfx

#_06B0F5: LDA.b #$33 ; SFX2.33
#_06B0F7: JSL SpriteSFX_QueueSFX2WithPan

.skip_sfx
#_06B0FB: LDA.w $0D90,X
#_06B0FE: TAY

#_06B0FF: INC A
#_06B100: STA.w $0D90,X

#_06B103: LDA.w Stumpify_anim_step,Y
#_06B106: BMI .turn_it_up_to_11

#_06B108: STA.w $0DC0,X

#_06B10B: LDA.w StumpifyTimer,Y
#_06B10E: STA.w $0DF0,X

.exit
#_06B111: RTS

.turn_it_up_to_11
#_06B112: LDA.b #$F3 ; SONG F3 - max volume
#_06B114: STA.w $012C

#_06B117: INC.w $0D80,X

#_06B11A: STZ.w $02E4

#_06B11D: RTS

;===================================================================================================

Stumpy_AmTree:
#_06B11E: LDA.b #$03
#_06B120: STA.w $0DC0,X

#_06B123: LDA.l $7EF3C9
#_06B127: ORA.b #$08
#_06B129: STA.l $7EF3C9

#_06B12D: RTS

;===================================================================================================

FluteKid_CheckIfInRange:
#_06B12E: LDA.w $0D10,X
#_06B131: STA.b $00

#_06B133: LDA.w $0D30,X
#_06B136: STA.b $01

#_06B138: LDA.w $0D00,X
#_06B13B: STA.b $02

#_06B13D: LDA.w $0D20,X
#_06B140: STA.b $03

#_06B142: REP #$30

#_06B144: LDA.b $02
#_06B146: SEC
#_06B147: SBC.w #$0010
#_06B14A: STA.b $02

#_06B14C: LDA.b $22
#_06B14E: SBC.b $00
#_06B150: BPL .positive_x

#_06B152: EOR.w #$FFFF

.positive_x
#_06B155: STA.b $00

#_06B157: LDA.b $20
#_06B159: SBC.b $02
#_06B15B: BPL .positive_y

#_06B15D: EOR.w #$FFFF

.positive_y
#_06B160: STA.b $02

#_06B162: LDA.b $00
#_06B164: CMP.w #$0030
#_06B167: BCS .exit

#_06B169: LDA.b $02
#_06B16B: CMP.w #$0030

.exit
#_06B16E: SEP #$30

#_06B170: RTS

;===================================================================================================

pool FluteKid_Quaver

.speed_x
#_06B171: db   1,  -1

pool off

;---------------------------------------------------------------------------------------------------

FluteKid_Quaver:
#_06B173: JSR SpriteDraw_SingleSmall
#_06B176: JSR Sprite_CheckIfActive_Bank06
#_06B179: JSR Sprite_Move_XY_Bank06
#_06B17C: JSR Sprite_Move_Z_Bank06

#_06B17F: LDA.w $0DF0,X
#_06B182: BNE .tenuto

#_06B184: STZ.w $0DD0,X

.tenuto
#_06B187: LDA.b $1A
#_06B189: AND.b #$01
#_06B18B: BNE .exit

#_06B18D: LDA.b $1A

#_06B18F: LSR A
#_06B190: LSR A
#_06B191: LSR A
#_06B192: LSR A
#_06B193: LSR A

#_06B194: EOR.w $0FA0
#_06B197: AND.b #$01
#_06B199: TAY

#_06B19A: LDA.w $0D50,X
#_06B19D: CLC
#_06B19E: ADC.w .speed_x,Y
#_06B1A1: STA.w $0D50,X

.exit
#_06B1A4: RTS

;===================================================================================================

FluteKid_SpawnQuaver:
#_06B1A5: LDA.b #$2E ; SPRITE 2E
#_06B1A7: JSL Sprite_SpawnDynamically
#_06B1AB: BMI .no_space

#_06B1AD: LDA.b $00
#_06B1AF: CLC
#_06B1B0: ADC.b #$04
#_06B1B2: STA.w $0D10,Y

#_06B1B5: LDA.b $01
#_06B1B7: ADC.b #$00
#_06B1B9: STA.w $0D30,Y

#_06B1BC: LDA.b $02
#_06B1BE: SEC
#_06B1BF: SBC.b #$04
#_06B1C1: STA.w $0D00,Y

#_06B1C4: LDA.b $03
#_06B1C6: SBC.b #$00
#_06B1C8: STA.w $0D20,Y

#_06B1CB: LDA.b #$01
#_06B1CD: STA.w $0EB0,Y

#_06B1D0: LDA.b #$08
#_06B1D2: STA.w $0F80,Y

#_06B1D5: LDA.b #$60
#_06B1D7: STA.w $0DF0,Y
#_06B1DA: STA.w $0BA0,Y

.no_space
#_06B1DD: RTS

;===================================================================================================

Smithy_anim_step:
#_06B1DE: db $00, $01, $02, $03
#_06B1E2: db $03, $02, $01, $00

SmithyAnimTimer:
#_06B1E6: db  24,   4,   1,  16
#_06B1EA: db  16,   5,  10,  16

;===================================================================================================

Sprite_1A_Smithy:
#_06B1EE: LDA.w $0E80,X
#_06B1F1: JSL JumpTableLocal
#_06B1F5: dw Smithy_Main
#_06B1F7: dw Smithy_Spark
#_06B1F9: dw Smithy_Frog
#_06B1FB: dw Smithy_Homecoming

;===================================================================================================

Smithy_Homecoming:
#_06B1FD: JSR SpriteDraw_Smithy_Homecoming
#_06B200: JSR Sprite_CheckIfActive_Bank06

#_06B203: LDA.w $0D80,X
#_06B206: JSL JumpTableLocal
#_06B20A: dw Smithy_Homecoming_Walk
#_06B20C: dw Smithy_Homecoming_TYVM

;===================================================================================================

pool Smithy_Homecoming_Walk

.timer
#_06B20E: db 104,  12

.direction
#_06B210: db $00, $02, $FF

.speed_x
#_06B213: db   0,   0, -13,  13

.speed_y
#_06B217: db -13,  13,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Smithy_Homecoming_Walk:
#_06B21B: JSR Sprite_Move_XY_Bank06

#_06B21E: LDA.b $1A

#_06B220: LSR A
#_06B221: LSR A
#_06B222: LSR A

#_06B223: AND.b #$01
#_06B225: STA.w $0DC0,X

#_06B228: LDA.w $0DF0,X
#_06B22B: BNE .exit

#_06B22D: LDA.w $0D90,X
#_06B230: TAY

#_06B231: INC A
#_06B232: STA.w $0D90,X

#_06B235: LDA.w .timer,Y
#_06B238: STA.w $0DF0,X

#_06B23B: LDA.w .direction,Y
#_06B23E: BMI .next_state

#_06B240: STA.w $0DE0,X

#_06B243: TAY

#_06B244: LDA.w .speed_x,Y
#_06B247: STA.w $0D50,X

#_06B24A: LDA.w .speed_y,Y
#_06B24D: STA.w $0D40,X

.exit
#_06B250: RTS

;---------------------------------------------------------------------------------------------------

.next_state
#_06B251: INC.w $0D80,X

#_06B254: RTS

;===================================================================================================

Smithy_Homecoming_TYVM:
#_06B255: JSL Sprite_BehaveAsBarrier

#_06B259: LDA.b #$E3 ; MESSAGE 00E3
#_06B25B: LDY.b #$00
#_06B25D: JSL Sprite_ShowSolicitedMessage

#_06B261: STZ.w $02E4

#_06B264: LDA.b #$01
#_06B266: STA.w $0DE0,X

#_06B269: LDA.l $7EF3C9
#_06B26D: ORA.b #$20
#_06B26F: STA.l $7EF3C9

#_06B273: RTS

;===================================================================================================

Smithy_Frog:
#_06B274: JSR SpriteDraw_Smithy_Frog
#_06B277: JSR Sprite_CheckIfActive_Bank06
#_06B27A: JSL Sprite_BehaveAsBarrier

#_06B27E: DEC.w $0F80,X
#_06B281: DEC.w $0F80,X

#_06B284: JSR Sprite_Move_Z_Bank06

#_06B287: LDA.w $0F70,X
#_06B28A: BPL .him_hop

#_06B28C: STZ.w $0F70,X

#_06B28F: LDA.b #$10
#_06B291: STA.w $0F80,X

.him_hop
#_06B294: LDA.w $0D80,X
#_06B297: BNE .follow_link

#_06B299: LDA.b #$01
#_06B29B: STA.w $0DE0,X

#_06B29E: LDA.b #$E1 ; MESSAGE 00E1
#_06B2A0: LDY.b #$00
#_06B2A2: JSL Sprite_ShowSolicitedMessage
#_06B2A6: BCC .ignored_WOW

#_06B2A8: INC.w $0D80,X

.ignored_WOW
#_06B2AB: RTS

;---------------------------------------------------------------------------------------------------

.follow_link
#_06B2AC: LDA.b #$07 ; FOLLOWER 07
#_06B2AE: STA.l $7EF3CC

#_06B2B2: PHX

#_06B2B3: JSL LoadFollowerGraphics
#_06B2B7: JSL Sprite_BecomeFollower

#_06B2BB: PLX

#_06B2BC: STZ.w $0DD0,X

#_06B2BF: RTS

;===================================================================================================

pool SpriteDraw_Smithy_Homecoming

.oam_groups
#_06B2C0: dw   0,   0 : db $22, $41, $00, $02

#_06B2C8: dw   0,   0 : db $22, $01, $00, $02

#_06B2D0: dw   0,   0 : db $22, $41, $00, $02

#_06B2D8: dw   0,   0 : db $22, $01, $00, $02

#_06B2E0: dw   0,   0 : db $22, $01, $00, $02

#_06B2E8: dw   0,   0 : db $22, $01, $00, $02

#_06B2F0: dw   0,   0 : db $22, $41, $00, $02

#_06B2F8: dw   0,   0 : db $22, $41, $00, $02

;---------------------------------------------------------------------------------------------------

.char_offset
#_06B300: db $C0
#_06B301: db $C0
#_06B302: db $A0
#_06B303: db $A0
#_06B304: db $80
#_06B305: db $60
#_06B306: db $80
#_06B307: db $60

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Smithy_Homecoming:
#_06B308: LDA.b #$01
#_06B30A: STA.b $06
#_06B30C: STZ.b $07

#_06B30E: LDA.w $0DE0,X
#_06B311: ASL A
#_06B312: ADC.w $0DC0,X
#_06B315: TAY

#_06B316: LDA.w .char_offset,Y
#_06B319: STA.w $0AEA

#_06B31C: TYA
#_06B31D: ASL A
#_06B31E: ASL A
#_06B31F: ASL A
#_06B320: ADC.b #.oam_groups>>0
#_06B322: STA.b $08

#_06B324: LDA.b #.oam_groups>>8
#_06B326: ADC.b #$00
#_06B328: STA.b $09

#_06B32A: JSL SpriteDraw_Tabulated_player_deferred

#_06B32E: JMP.w SpriteDraw_Shadow

;===================================================================================================

pool SpriteDraw_Smithy_Frog

.oam_groups
#_06B331: dw   0,   0 : db $C8, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Smithy_Frog:
#_06B339: LDA.b #$01
#_06B33B: STA.b $06
#_06B33D: STZ.b $07

#_06B33F: LDA.b #.oam_groups>>0
#_06B341: STA.b $08

#_06B343: LDA.b #.oam_groups>>8
#_06B345: STA.b $09

#_06B347: JSL SpriteDraw_Tabulated_player_deferred

#_06B34B: JMP.w SpriteDraw_Shadow

;===================================================================================================

Smithy_Main:
#_06B34E: JSR SpriteDraw_Smithy

#_06B351: DEC.w $0F80,X
#_06B354: DEC.w $0F80,X

#_06B357: JSR Sprite_Move_Z_Bank06

#_06B35A: LDA.w $0F70,X
#_06B35D: BPL .hopping

#_06B35F: STZ.w $0F70,X
#_06B362: STZ.w $0F80,X

.hopping
#_06B365: JSR Sprite_CheckIfActive_Bank06

#_06B368: LDY.w $0E90,X

#_06B36B: LDA.w $0D80,Y
#_06B36E: CMP.b #$05
#_06B370: BEQ .tick_timer

#_06B372: CMP.b #$07
#_06B374: BEQ .tick_timer

#_06B376: CMP.b #$09
#_06B378: BEQ .tick_timer

#_06B37A: ORA.w $0D80,X
#_06B37D: BEQ .tick_timer

#_06B37F: LDA.w $0D80,X
#_06B382: CMP.b #$05
#_06B384: BEQ .tick_timer

#_06B386: CMP.b #$07
#_06B388: BEQ .tick_timer

#_06B38A: CMP.b #$09
#_06B38C: BNE .perform_ai

;---------------------------------------------------------------------------------------------------

.tick_timer
#_06B38E: LDA.w $0DA0,X

#_06B391: DEC.w $0DA0,X

#_06B394: CMP.b #$00
#_06B396: BNE .perform_ai

#_06B398: LDA.w $0D90,X
#_06B39B: TAY

#_06B39C: INC A
#_06B39D: AND.b #$07
#_06B39F: STA.w $0D90,X

#_06B3A2: LDA.w Smithy_anim_step,Y
#_06B3A5: STA.w $0DC0,X

#_06B3A8: LDA.w SmithyAnimTimer,Y
#_06B3AB: STA.w $0DA0,X

#_06B3AE: CPY.b #$01
#_06B3B0: BNE .no_hop_for_him

#_06B3B2: LDA.b #$10
#_06B3B4: STA.w $0F80,X

.no_hop_for_him
#_06B3B7: CPY.b #$03
#_06B3B9: BNE .perform_ai

#_06B3BB: JSR Smithy_SpawnSpark

#_06B3BE: LDA.b #$05 ; SFX2.05
#_06B3C0: JSL SpriteSFX_QueueSFX2WithPan

;---------------------------------------------------------------------------------------------------

.perform_ai
#_06B3C4: LDA.w $0D80,X
#_06B3C7: JSL JumpTableLocal
#_06B3CB: dw Smithy_Smithing
#_06B3CD: dw Smithy_WannaTemper
#_06B3CF: dw Smithy_ForRealsies
#_06B3D1: dw Smithy_ItAintFreeKid
#_06B3D3: dw Smithy_TemperInProgress
#_06B3D5: dw Smithy_TemperInProgress
#_06B3D7: dw Smithy_GiveTemperedSword
#_06B3D9: dw Smithy_Nothing
#_06B3DB: dw Smithy_Nothing
#_06B3DD: dw Smithy_Nothing
#_06B3DF: dw Smithy_SpawnFriend
#_06B3E1: dw Smithy_Thanks

;===================================================================================================

Smithy_Smithing:
#_06B3E3: STZ.w $0DB0,X

#_06B3E6: LDA.l $7EF3CC
#_06B3EA: CMP.b #$08 ; FOLLOWER 08
#_06B3EC: BEQ .smithy_follower

#_06B3EE: JSR Smithy_ListenForHammer
#_06B3F1: BCC .link_not_helping_out

#_06B3F3: LDA.b #$E4 ; MESSAGE 00E4
#_06B3F5: LDY.b #$00
#_06B3F7: JSL Sprite_ShowMessageUnconditional

#_06B3FB: LDA.b #$60
#_06B3FD: STA.w $0E00,X

#_06B400: INC.w $0DB0,X

#_06B403: RTS

;---------------------------------------------------------------------------------------------------

.link_not_helping_out
#_06B404: LDA.l $7EF3C9
#_06B408: AND.b #$20
#_06B40A: BEQ .not_rescued

#_06B40C: LDA.b #$D8 ; MESSAGE 00D8
#_06B40E: LDY.b #$00
#_06B410: JSL Sprite_ShowSolicitedMessage
#_06B414: BCC .exit_a

#_06B416: INC.w $0D80,X
#_06B419: INC.w $0DB0,X

.exit_a
#_06B41C: RTS

;---------------------------------------------------------------------------------------------------

.not_rescued
#_06B41D: LDA.b #$DF ; MESSAGE 00DF
#_06B41F: LDY.b #$00
#_06B421: JSL Sprite_ShowSolicitedMessage

#_06B425: RTS

;---------------------------------------------------------------------------------------------------

.smithy_follower
#_06B426: LDA.b $20
#_06B428: CMP.b #$C2
#_06B42A: BCS .exit_b

#_06B42C: LDA.b #$E0 ; MESSAGE 00E0
#_06B42E: LDY.b #$00

#_06B430: JSL Sprite_ShowMessageUnconditional

#_06B434: LDA.b #$0A
#_06B436: STA.w $0D80,X

#_06B439: INC.w $02E4

.exit_b
#_06B43C: RTS

;===================================================================================================

Smithy_ListenForHammer:
#_06B43D: LDA.w $0E00,X
#_06B440: BNE .no_hammer

#_06B442: LDA.w $0202
#_06B445: CMP.b #$0C
#_06B447: BNE .no_hammer

#_06B449: LDA.w $0301
#_06B44C: AND.b #$02
#_06B44E: BEQ .no_hammer

#_06B450: LDA.w $0300
#_06B453: CMP.b #$02
#_06B455: BNE .no_hammer

#_06B457: JSR Sprite_CheckDamageToLink_same_layer
#_06B45A: BCC .no_hammer

#_06B45C: RTS

.no_hammer
#_06B45D: CLC

#_06B45E: RTS

;===================================================================================================

Smithy_WannaTemper:
#_06B45F: LDA.w $1CE8
#_06B462: BNE .didnt_make_the_sale

#_06B464: LDA.b #$D9 ; MESSAGE 00D9
#_06B466: LDY.b #$00
#_06B468: JSL Sprite_ShowMessageUnconditional

#_06B46C: INC.w $0D80,X

#_06B46F: RTS

.didnt_make_the_sale
#_06B470: LDA.b #$DC ; MESSAGE 00DC
#_06B472: LDY.b #$00
#_06B474: JSL Sprite_ShowMessageUnconditional

#_06B478: STZ.w $0D80,X

#_06B47B: RTS

;===================================================================================================

Smithy_ForRealsies:
#_06B47C: LDA.w $1CE8
#_06B47F: BNE .didnt_make_the_sale

#_06B481: LDA.l $7EF359
#_06B485: CMP.b #$03
#_06B487: BCS .sword_too_good_already

#_06B489: LDA.b #$DA ; MESSAGE 00DA
#_06B48B: LDY.b #$00
#_06B48D: JSL Sprite_ShowMessageUnconditional

#_06B491: INC.w $0D80,X

#_06B494: RTS

;---------------------------------------------------------------------------------------------------

.sword_too_good_already
#_06B495: LDA.b #$DB ; MESSAGE 00DB
#_06B497: LDY.b #$00
#_06B499: JSL Sprite_ShowMessageUnconditional

#_06B49D: STZ.w $0D80,X

#_06B4A0: RTS

;---------------------------------------------------------------------------------------------------

.didnt_make_the_sale
#_06B4A1: LDA.b #$DC ; MESSAGE 00DC
#_06B4A3: LDY.b #$00
#_06B4A5: JSL Sprite_ShowMessageUnconditional

#_06B4A9: STZ.w $0D80,X

#_06B4AC: RTS

;===================================================================================================

Smithy_ItAintFreeKid:
#_06B4AD: LDA.w $1CE8
#_06B4B0: BEQ .made_the_sale

#_06B4B2: LDA.b #$DC ; MESSAGE 00DC
#_06B4B4: LDY.b #$00

#_06B4B6: JSL Sprite_ShowMessageUnconditional
#_06B4BA: STZ.w $0D80,X

#_06B4BD: RTS

;---------------------------------------------------------------------------------------------------

.made_the_sale
#_06B4BE: REP #$20

#_06B4C0: LDA.l $7EF360
#_06B4C4: CMP.w #$0A

#_06B4C7: SEP #$30
#_06B4C9: BCS .paid_in_cash

#_06B4CB: LDA.b #$DC ; MESSAGE 00DC
#_06B4CD: LDY.b #$00
#_06B4CF: JSL Sprite_ShowMessageUnconditional

#_06B4D3: STZ.w $0D80,X

#_06B4D6: RTS

;---------------------------------------------------------------------------------------------------

.paid_in_cash
#_06B4D7: REP #$20

#_06B4D9: LDA.l $7EF360
#_06B4DD: SEC
#_06B4DE: SBC.w #10
#_06B4E1: STA.l $7EF360

#_06B4E5: SEP #$30

#_06B4E7: LDA.b #$DD ; MESSAGE 00DD
#_06B4E9: LDY.b #$00
#_06B4EB: JSL Sprite_ShowMessageUnconditional

#_06B4EF: LDY.w $0E90,X

#_06B4F2: LDA.b #$05
#_06B4F4: STA.w $0D80,Y
#_06B4F7: STA.w $0D80,X

#_06B4FA: STZ.w $0ABF

#_06B4FD: LDA.b #$FF
#_06B4FF: STA.l $7EF359

#_06B503: LDA.l $7EF3C9
#_06B507: ORA.b #$80
#_06B509: STA.l $7EF3C9

#_06B50D: RTS

;===================================================================================================

Smithy_TemperInProgress:
#_06B50E: STZ.w $0DB0,X

#_06B511: JSR Smithy_ListenForHammer
#_06B514: BCC .link_isnt_helping

#_06B516: LDA.b #$E4 ; MESSAGE 00E4
#_06B518: LDY.b #$00
#_06B51A: JSL Sprite_ShowMessageUnconditional

#_06B51E: LDA.b #$60
#_06B520: STA.w $0E00,X

#_06B523: INC.w $0DB0,X

#_06B526: RTS

;---------------------------------------------------------------------------------------------------

.link_isnt_helping
#_06B527: LDA.w $0ABF
#_06B52A: BEQ .not_finished

#_06B52C: LDA.b #$DE ; MESSAGE 00DE
#_06B52E: LDY.b #$00
#_06B530: JSL Sprite_ShowSolicitedMessage
#_06B534: BCC .exit

#_06B536: INC.w $0D80,X

#_06B539: LDA.b #$04
#_06B53B: STA.w $0DC0,X

.exit
#_06B53E: RTS

;---------------------------------------------------------------------------------------------------

.not_finished
#_06B53F: LDA.b #$E2 ; MESSAGE 00E2
#_06B541: LDY.b #$00
#_06B543: JSL Sprite_ShowSolicitedMessage

#_06B547: RTS

;===================================================================================================

Smithy_GiveTemperedSword:
#_06B548: LDY.w $0E90,X

#_06B54B: LDA.b #$00
#_06B54D: STA.w $0D80,X
#_06B550: STA.w $0D80,Y

#_06B553: LDY.b #$02 ; ITEMGET 02

#_06B555: STZ.w $02E9

#_06B558: PHX
#_06B559: JSL Link_ReceiveItem
#_06B55D: PLX

#_06B55E: LDA.l $7EF3C9
#_06B562: AND.b #$7F
#_06B564: STA.l $7EF3C9

#_06B568: RTS

;===================================================================================================

Smithy_Nothing:
#_06B569: RTS

;===================================================================================================

Smithy_SpawnFriend:
#_06B56A: LDA.b #$1A ; SPRITE 1A
#_06B56C: JSL Sprite_SpawnDynamically
#_06B570: BMI .no_friend_in_me

#_06B572: LDA.b $22
#_06B574: STA.w $0D10,Y

#_06B577: LDA.b $23
#_06B579: STA.w $0D30,Y

#_06B57C: LDA.b $20
#_06B57E: STA.w $0D00,Y

#_06B581: LDA.b $21
#_06B583: STA.w $0D20,Y

#_06B586: LDA.b #$03
#_06B588: STA.w $0E80,Y
#_06B58B: STA.w $0BA0,Y

.no_friend_in_me
#_06B58E: INC.w $0D80,X

#_06B591: LDA.b #$00
#_06B593: STA.l $7EF3CC

#_06B597: LDA.b #$04
#_06B599: STA.w $0DC0,X

#_06B59C: RTS

;===================================================================================================

Smithy_Thanks:
#_06B59D: LDA.b #$E3 ; MESSAGE 00E3
#_06B59F: LDY.b #$00
#_06B5A1: JSL Sprite_ShowSolicitedMessage

#_06B5A5: RTS

;===================================================================================================

Smithy_SpawnDwarfPal:
#_06B5A6: LDA.b #$1A ; SPRITE 1A
#_06B5A8: JSL Sprite_SpawnDynamically
#_06B5AC: BMI .no_space

#_06B5AE: LDA.b $00
#_06B5B0: CLC
#_06B5B1: ADC.b #$2C
#_06B5B3: STA.w $0D10,Y

#_06B5B6: LDA.b $01
#_06B5B8: STA.w $0D30,Y

#_06B5BB: LDA.b $02
#_06B5BD: STA.w $0D00,Y

#_06B5C0: LDA.b $03
#_06B5C2: STA.w $0D20,Y

#_06B5C5: LDA.b #$01
#_06B5C7: STA.w $0DE0,Y

#_06B5CA: LDA.b #$04
#_06B5CC: STA.w $0D90,Y
#_06B5CF: STA.w $0BA0,Y

.no_space
#_06B5D2: RTS

;===================================================================================================

pool SpriteDraw_Smithy

.oam_groups
#_06B5D3: dw   1,   0 : db $40, $40, $00, $02
#_06B5DB: dw -11, -10 : db $60, $40, $00, $02

#_06B5E3: dw  -1,   0 : db $40, $00, $00, $02
#_06B5EB: dw  11, -10 : db $60, $00, $00, $02

#_06B5F3: dw   1,   0 : db $40, $40, $00, $02
#_06B5FB: dw  -3, -14 : db $44, $40, $00, $02

#_06B603: dw  -1,   0 : db $40, $00, $00, $02
#_06B60B: dw   3, -14 : db $44, $00, $00, $02

#_06B613: dw   1,   0 : db $42, $40, $00, $02
#_06B61B: dw  11, -10 : db $60, $00, $00, $02

#_06B623: dw  -1,   0 : db $42, $00, $00, $02
#_06B62B: dw -11, -10 : db $60, $40, $00, $02

#_06B633: dw   1,   0 : db $42, $40, $00, $02
#_06B63B: dw  13,   2 : db $62, $40, $00, $02

#_06B643: dw  -1,   0 : db $42, $00, $00, $02
#_06B64B: dw -13,   2 : db $62, $00, $00, $02

#_06B653: dw   0,   0 : db $64, $40, $00, $02
#_06B65B: dw   0,   0 : db $62, $40, $00, $02

#_06B663: dw   0,   0 : db $64, $00, $00, $02
#_06B66B: dw   0,   0 : db $64, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Smithy:
#_06B673: LDA.b #$02
#_06B675: STA.b $06
#_06B677: STZ.b $07

#_06B679: LDA.w $0DC0,X
#_06B67C: ASL A
#_06B67D: ADC.w $0DE0,X

#_06B680: ASL A
#_06B681: ASL A
#_06B682: ASL A
#_06B683: ASL A

#_06B684: ADC.b #.oam_groups>>0
#_06B686: STA.b $08

#_06B688: LDA.b #.oam_groups>>8
#_06B68A: ADC.b #$00
#_06B68C: STA.b $09

#_06B68E: JSL SpriteDraw_Tabulated_player_deferred
#_06B692: JSR SpriteDraw_Shadow

#_06B695: RTS

;===================================================================================================

pool Smithy_Spark

.anim
#_06B696: db $00, $01, $02, $01, $02, $01, $FF

.timer
#_06B69D: db   4,   1,   3,   2,   1,   1

pool off

;---------------------------------------------------------------------------------------------------

Smithy_Spark:
#_06B6A3: JSR SpriteDraw_Smithy_Spark
#_06B6A6: JSR Sprite_CheckIfActive_Bank06

#_06B6A9: LDA.w $0DF0,X
#_06B6AC: BNE .exit

#_06B6AE: LDA.w $0D90,X
#_06B6B1: TAY

#_06B6B2: INC A
#_06B6B3: AND.b #$07
#_06B6B5: STA.w $0D90,X

#_06B6B8: LDA.w .anim,Y
#_06B6BB: BMI .terminate

#_06B6BD: STA.w $0DC0,X

#_06B6C0: LDA.w .timer,Y
#_06B6C3: STA.w $0DF0,X

.exit
#_06B6C6: RTS

;---------------------------------------------------------------------------------------------------

.terminate
#_06B6C7: STZ.w $0DD0,X

#_06B6CA: RTS

;===================================================================================================

pool Smithy_SpawnSpark

.offset_x
#_06B6CB: db  15, -15

pool off

;---------------------------------------------------------------------------------------------------

Smithy_SpawnSpark:
#_06B6CD: LDA.b #$1A ; SPRITE 1A

#_06B6CF: JSL Sprite_SpawnDynamically
#_06B6D3: BMI .no_space

#_06B6D5: PHX

#_06B6D6: LDA.w $0DE0,X
#_06B6D9: TAX

#_06B6DA: LDA.b $00
#_06B6DC: CLC
#_06B6DD: ADC.w .offset_x,X
#_06B6E0: STA.w $0D10,Y

#_06B6E3: LDA.b $01
#_06B6E5: STA.w $0D30,Y

#_06B6E8: LDA.b $02
#_06B6EA: CLC
#_06B6EB: ADC.b #$02
#_06B6ED: STA.w $0D00,Y

#_06B6F0: LDA.b $03
#_06B6F2: STA.w $0D20,Y

#_06B6F5: LDA.b #$01
#_06B6F7: STA.w $0E80,Y

#_06B6FA: PLX

.no_space
#_06B6FB: RTS

;===================================================================================================

pool SpriteDraw_Smithy_Spark

.oam_groups
#_06B6FC: dw   0,   3 : db $AA, $41, $00, $02
#_06B704: dw   0,  -1 : db $AA, $41, $00, $02

#_06B70C: dw  -4,   0 : db $90, $01, $00, $00
#_06B714: dw  12,   0 : db $90, $41, $00, $00

#_06B71C: dw  -5,  -2 : db $91, $01, $00, $00
#_06B724: dw  13,  -2 : db $91, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Smithy_Spark:
#_06B72C: LDA.b #$08
#_06B72E: JSL SpriteDraw_AllocateOAMFromRegionB

#_06B732: LDA.w $0DC0,X

#_06B735: ASL A
#_06B736: ASL A
#_06B737: ASL A
#_06B738: ASL A

#_06B739: ADC.b #.oam_groups>>0
#_06B73B: STA.b $08

#_06B73D: LDA.b #.oam_groups>>8
#_06B73F: ADC.b #$00
#_06B741: STA.b $09

#_06B743: LDA.b #$02
#_06B745: JSL SpriteDraw_Tabulated

#_06B749: RTS

;===================================================================================================

pool Sprite_1B_Arrow

.speed_x
#_06B74A: db   0,   0 ; bleeds into next

.speed_y
#_06B74C: db  16,  16,   0,   0, -16, -16,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Sprite_1B_Arrow:
#_06B754: JSR SpriteDraw_Arrow
#_06B757: JSR Sprite_CheckIfActivePermissive_Bank06

#_06B75A: LDA.w $0DD0,X
#_06B75D: CMP.b #$09
#_06B75F: BNE SpriteArrow_KnockedAway

#_06B761: LDA.w $0DF0,X
#_06B764: BEQ SpriteArrow_InFlight

#_06B766: DEC A
#_06B767: BNE .live

#_06B769: STZ.w $0DD0,X

#_06B76C: RTS

;---------------------------------------------------------------------------------------------------

.live
#_06B76D: CMP.b #$20
#_06B76F: BCC .exit

#_06B771: AND.b #$01
#_06B773: BNE .exit

#_06B775: LDA.b $1A
#_06B777: ASL A
#_06B778: AND.b #$04
#_06B77A: ORA.w $0DE0,X
#_06B77D: TAY

#_06B77E: LDA.w .speed_x,Y
#_06B781: STA.w $0D50,X

#_06B784: LDA.w .speed_y,Y
#_06B787: STA.w $0D40,X

#_06B78A: JSR Sprite_Move_XY_Bank06

.exit
#_06B78D: RTS

;===================================================================================================

SpriteArrow_InFlight:
#_06B78E: JSR Sprite_CheckDamageToLink_same_layer
#_06B791: LDA.w $0E90,X
#_06B794: BNE .continue

#_06B796: JSR Sprite_CheckTileCollision
#_06B799: LDA.w $0E70,X
#_06B79C: BEQ .continue

#_06B79E: LDY.w $0D90,X
#_06B7A1: BEQ .dont_break

#_06B7A3: JSL SpriteArrow_Break

#_06B7A7: RTS

.dont_break
#_06B7A8: LDA.b #$30
#_06B7AA: STA.w $0DF0,X

#_06B7AD: LDA.b #$02
#_06B7AF: STA.w $0D90,X

#_06B7B2: LDA.b #$08 ; SFX2.08
#_06B7B4: JSL SpriteSFX_QueueSFX2WithPan

#_06B7B8: RTS

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_06B7B9:
#_06B7B9: STZ.w $0DD0,X

#_06B7BC: JSL Sprite_PlaceWeaponTink

;---------------------------------------------------------------------------------------------------

.continue
#_06B7C0: JMP.w Sprite_Move_XY_Bank06

;===================================================================================================

pool SpriteArrow_KnockedAway

.direction
#_06B7C3: db $00
#_06B7C4: db $02
#_06B7C5: db $01
#_06B7C6: db $03

pool off

;---------------------------------------------------------------------------------------------------

SpriteArrow_KnockedAway:
#_06B7C7: LDA.w $0D80,X
#_06B7CA: BNE .prepped

#_06B7CC: JSR Sprite_ApplyRicochet

#_06B7CF: LDA.b #$18
#_06B7D1: STA.w $0F80,X

#_06B7D4: LDA.b #$FF
#_06B7D6: STA.w $0DF0,X

#_06B7D9: INC.w $0D80,X

#_06B7DC: STZ.w $0EF0,X

;---------------------------------------------------------------------------------------------------

.prepped
#_06B7DF: LDA.w $0DF0,X
#_06B7E2: LSR A
#_06B7E3: LSR A
#_06B7E4: LSR A
#_06B7E5: AND.b #$03
#_06B7E7: TAY

#_06B7E8: LDA.w .direction,Y
#_06B7EB: STA.w $0DE0,X

#_06B7EE: JSR Sprite_Move_Z_Bank06
#_06B7F1: JSR Sprite_Move_XY_Bank06

#_06B7F4: LDA.w $0F80,X
#_06B7F7: SEC
#_06B7F8: SBC.b #$02
#_06B7FA: STA.w $0F80,X

#_06B7FD: LDA.w $0F70,X
#_06B800: BPL .exit

#_06B802: STZ.w $0DD0,X

.exit
#_06B805: RTS

;===================================================================================================

UNREACHABLE_06B806:
#_06B806: RTS

;===================================================================================================

pool SpriteDraw_Arrow

.offset_x
#_06B807: dw  -8,   0
#_06B80B: dw   0,   8
#_06B80F: dw   0,   0
#_06B813: dw   0,   0

;---------------------------------------------------------------------------------------------------

.offset_y
#_06B817: dw   0,   0
#_06B81B: dw   0,   0
#_06B81F: dw  -8,   0
#_06B823: dw   0,   8

;---------------------------------------------------------------------------------------------------

.char
#_06B827: db $3A, $3D
#_06B829: db $3D, $3A
#_06B82B: db $2A, $2B
#_06B82D: db $2B, $2A

#_06B82F: db $7C, $6C
#_06B831: db $6C, $7C
#_06B833: db $7B, $6B
#_06B835: db $6B, $7B

#_06B837: db $3A, $3B
#_06B839: db $3B, $3A
#_06B83B: db $2A, $3C
#_06B83D: db $3C, $2A

#_06B83F: db $81, $80
#_06B841: db $80, $81
#_06B843: db $91, $90
#_06B845: db $90, $91

;---------------------------------------------------------------------------------------------------

.prop
#_06B847: db $08, $08
#_06B849: db $48, $48
#_06B84B: db $08, $08
#_06B84D: db $88, $88

#_06B84F: db $09, $49
#_06B851: db $09, $49
#_06B853: db $09, $89
#_06B855: db $09, $89

#_06B857: db $08, $88
#_06B859: db $C8, $48
#_06B85B: db $08, $08
#_06B85D: db $88, $88

#_06B85F: db $49, $49
#_06B861: db $09, $09
#_06B863: db $89, $89
#_06B865: db $09, $09

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Arrow:
#_06B867: JSR Sprite_PrepOAMCoord

#_06B86A: LDA.w $0DE0,X
#_06B86D: ASL A
#_06B86E: STA.b $06

#_06B870: LDA.w $0D90,X
#_06B873: ASL A
#_06B874: ASL A
#_06B875: ASL A
#_06B876: STA.b $07

#_06B878: PHX

#_06B879: LDX.b #$01

.next_object
#_06B87B: PHX

#_06B87C: TXA
#_06B87D: CLC
#_06B87E: ADC.b $06
#_06B880: PHA

#_06B881: ASL A
#_06B882: TAX

#_06B883: REP #$20

#_06B885: LDA.b $00
#_06B887: CLC
#_06B888: ADC.w .offset_x,X
#_06B88B: STA.b ($90),Y

#_06B88D: AND.w #$0100
#_06B890: STA.b $0E

#_06B892: LDA.b $02
#_06B894: CLC
#_06B895: ADC.w .offset_y,X

#_06B898: INY
#_06B899: STA.b ($90),Y

#_06B89B: CLC
#_06B89C: ADC.w #$0010
#_06B89F: CMP.w #$0100

#_06B8A2: SEP #$20
#_06B8A4: BCC .on_screen

#_06B8A6: LDA.b #$F0
#_06B8A8: STA.b ($90),Y

.on_screen
#_06B8AA: PLA
#_06B8AB: CLC
#_06B8AC: ADC.b $07
#_06B8AE: TAX

#_06B8AF: LDA.w .char,X
#_06B8B2: INY
#_06B8B3: STA.b ($90),Y

#_06B8B5: LDA.w .prop,X
#_06B8B8: ORA.b $05
#_06B8BA: INY
#_06B8BB: STA.b ($90),Y

#_06B8BD: PHY

#_06B8BE: TYA
#_06B8BF: LSR A
#_06B8C0: LSR A
#_06B8C1: TAY

#_06B8C2: LDA.b $0F
#_06B8C4: STA.b ($92),Y

#_06B8C6: PLY
#_06B8C7: INY

#_06B8C8: PLX
#_06B8C9: DEX
#_06B8CA: BPL .next_object

#_06B8CC: PLX

#_06B8CD: RTS

;===================================================================================================

CrystalSwitch_Palette:
#_06B8CE: db $02, $04

;===================================================================================================

Sprite_1E_CrystalSwitch:
#_06B8D0: LDA.w $0F50,X
#_06B8D3: AND.b #$F1
#_06B8D5: STA.w $0F50,X

#_06B8D8: LDA.l $7EC172
#_06B8DC: AND.b #$01
#_06B8DE: TAY

#_06B8DF: LDA.w CrystalSwitch_Palette,Y
#_06B8E2: ORA.w $0F50,X
#_06B8E5: STA.w $0F50,X

#_06B8E8: JSR SpriteDraw_AllocateOAMDeferToPlayer
#_06B8EB: JSR SpriteDraw_SingleLarge

#_06B8EE: JSR Sprite_CheckIfActive_Bank06
#_06B8F1: JSR Sprite_CheckDamageToLink_same_layer
#_06B8F4: BCC .not_touching

#_06B8F6: JSL Sprite_CancelHookshot

#_06B8FA: STZ.b $5E

#_06B8FC: JSL Sprite_RepelDash_long

.not_touching
#_06B900: LDA.w $0DF0,X
#_06B903: BNE .no_sparkle

#_06B905: LDA.b $1A
#_06B907: AND.b #$07
#_06B909: STA.b $00
#_06B90B: STZ.b $01

#_06B90D: JSL GetRandomNumber
#_06B911: AND.b #$07
#_06B913: STA.b $02
#_06B915: STZ.b $03

#_06B917: JSL GarnishSpawn_Sparkle

#_06B91B: LDA.b #$1F
#_06B91D: STA.w $0DF0,X

.no_sparkle
#_06B920: LDA.w $0EA0,X
#_06B923: BNE .transitioning

#_06B925: LDA.b $3C
#_06B927: DEC A
#_06B928: CMP.b #$08
#_06B92A: BPL .exit

#_06B92C: JSR Sprite_CheckDamageFromLink

.exit
#_06B92F: RTS

;---------------------------------------------------------------------------------------------------

.transitioning
#_06B930: DEC.w $0EA0,X
#_06B933: CMP.b #$0B
#_06B935: BNE .no_color_change

#_06B937: LDA.l $7EC172
#_06B93B: EOR.b #$01
#_06B93D: STA.l $7EC172

#_06B941: LDA.b #$16
#_06B943: STA.b $11

#_06B945: LDA.b #$25 ; SFX3.25
#_06B947: JSL SpriteSFX_QueueSFX3WithPan

.no_color_change
#_06B94B: RTS

;===================================================================================================

Sprite_1F_SickKid:
#_06B94C: JSL SpriteDraw_SickKid
#_06B950: JSR Sprite_CheckIfActive_Bank06

#_06B953: LDA.w $0D80,X
#_06B956: JSL JumpTableLocal
#_06B95A: dw SickKid_ISleep
#_06B95C: dw SickKid_RealShit
#_06B95E: dw SickKid_NothingButNet
#_06B960: dw SickKid_OutOfShaqMemes

;===================================================================================================

SickKid_ISleep:
#_06B962: JSL CheckIfLinkIsBusy
#_06B966: BCS .zzzzzzzz

#_06B968: JSR Sprite_CheckDamageToLink_same_layer
#_06B96B: BCC .zzzzzzzz

#_06B96D: LDA.l $7EF35C
#_06B971: ORA.l $7EF35D
#_06B975: ORA.l $7EF35E
#_06B979: ORA.l $7EF35F
#_06B97D: CMP.b #$02
#_06B97F: BCC .wakeywakey

#_06B981: INC.w $0D80,X
#_06B984: INC.w $02E4

.zzzzzzzz
#_06B987: RTS

;---------------------------------------------------------------------------------------------------

.wakeywakey
#_06B988: LDA.b #$04 ; MESSAGE 0104
#_06B98A: LDY.b #$01
#_06B98C: JSL Sprite_ShowSolicitedMessage

#_06B990: RTS

;===================================================================================================

pool SickKid_RealShit

.anim_step
#_06B991: db $00, $01, $00, $01, $00, $01, $02, $FF

.timer
#_06B999: db   8,  12,   8,  12,   8,  96,  16

pool off

;---------------------------------------------------------------------------------------------------

SickKid_RealShit:
#_06B9A0: LDA.w $0DF0,X
#_06B9A3: BNE .exit

#_06B9A5: LDY.w $0D90,X

#_06B9A8: LDA.w .anim_step,Y
#_06B9AB: BMI .speak

#_06B9AD: STA.w $0DC0,X

#_06B9B0: LDA.w .timer,Y
#_06B9B3: STA.w $0DF0,X

#_06B9B6: INC.w $0D90,X

.exit
#_06B9B9: RTS

;---------------------------------------------------------------------------------------------------

.speak
#_06B9BA: LDA.b #$05 ; MESSAGE 0105
#_06B9BC: LDY.b #$01
#_06B9BE: JSL Sprite_ShowMessageUnconditional

#_06B9C2: INC.w $0D80,X

#_06B9C5: RTS

;===================================================================================================

SickKid_NothingButNet:
#_06B9C6: LDY.b #$21 ; ITEMGET 21
#_06B9C8: STZ.w $02E9

#_06B9CB: PHX

#_06B9CC: JSL Link_ReceiveItem

#_06B9D0: PLX

#_06B9D1: INC.w $0D80,X

#_06B9D4: STZ.w $02E4

#_06B9D7: RTS

;===================================================================================================

SickKid_OutOfShaqMemes:
#_06B9D8: LDA.b #$01
#_06B9DA: STA.w $0DC0,X

#_06B9DD: LDA.b #$06 ; MESSAGE 0106
#_06B9DF: LDY.b #$01
#_06B9E1: JSL Sprite_ShowSolicitedMessage

#_06B9E5: RTS

;===================================================================================================

WaterSwitch_Timer:
#_06B9E6: db  40,   6,   3,   3
#_06B9EA: db   3,   5,   1,   1
#_06B9EE: db   3,  12

;===================================================================================================

WaterSwitch_Position:
#_06B9F0: db $00, $01, $02, $03
#_06B9F4: db $04, $05, $05, $06
#_06B9F8: db $07, $06

;===================================================================================================

Sprite_21_WaterSwitch:
#_06B9FA: JSR WaterSwitch_Main
#_06B9FD: JSR Sprite_CheckIfActive_Bank06

#_06BA00: LDA.w $0D80,X
#_06BA03: CMP.b #$02
#_06BA05: BEQ .exit

#_06BA07: JSL JumpTableLocal
#_06BA0B: dw WaterSwitch_Untoggled
#_06BA0D: dw WaterSwitch_ReleaseGate

;---------------------------------------------------------------------------------------------------

.exit
#_06BA0F: RTS

;===================================================================================================

WaterSwitch_Untoggled:
#_06BA10: LDA.w $0DB0,X
#_06BA13: BEQ .reset_timer

#_06BA15: DEC.w $0DA0,X

#_06BA18: LDA.w $0DA0,X
#_06BA1B: BNE .delay

#_06BA1D: INC.w $0D80,X

.delay
#_06BA20: LDA.b $1A
#_06BA22: AND.b #$03
#_06BA24: BNE .exit

#_06BA26: LDA.b #$22 ; SFX2.22
#_06BA28: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_06BA2C: RTS

;---------------------------------------------------------------------------------------------------

.reset_timer
#_06BA2D: LDA.b #$30
#_06BA2F: STA.w $0DA0,X

#_06BA32: RTS

;===================================================================================================

WaterSwitch_ReleaseGate:
#_06BA33: LDA.w $0DF0,X
#_06BA36: BNE .exit

#_06BA38: INC.w $0D90,X

#_06BA3B: LDY.w $0D90,X
#_06BA3E: CPY.b #$0A
#_06BA40: BNE .delay_release

#_06BA42: INC.w $0D80,X
#_06BA45: INC.w $0642

#_06BA48: LDA.b #$25 ; SFX3.25
#_06BA4A: JSL SpriteSFX_QueueSFX3WithPan

#_06BA4E: RTS

.delay_release
#_06BA4F: LDA.w WaterSwitch_Timer,Y
#_06BA52: STA.w $0DF0,X

#_06BA55: LDA.w WaterSwitch_Position,Y
#_06BA58: STA.w $0DE0,X

#_06BA5B: LDA.b #$22 ; SFX2.22
#_06BA5D: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_06BA61: RTS

;===================================================================================================

WaterSwitch_OAMData:
.step_0
#_06BA62: db $04, $14, $DC, $20
#_06BA66: db $04, $0C, $DD, $20
#_06BA6A: db $04, $0C, $DD, $20
#_06BA6E: db $04, $0C, $DD, $20
#_06BA72: db $00, $00, $CA, $20

.step_1
#_06BA76: db $03, $0C, $DD, $20
#_06BA7A: db $03, $14, $DC, $20
#_06BA7E: db $03, $14, $DC, $20
#_06BA82: db $03, $14, $DC, $20
#_06BA86: db $00, $00, $CA, $20

.step_2
#_06BA8A: db $F8, $08, $EA, $20
#_06BA8E: db $00, $08, $EB, $20
#_06BA92: db $F8, $10, $FA, $20
#_06BA96: db $00, $10, $FB, $20
#_06BA9A: db $00, $00, $CA, $20

.step_3
#_06BA9E: db $F4, $04, $CC, $20
#_06BAA2: db $FC, $04, $CD, $20
#_06BAA6: db $FC, $04, $CD, $20
#_06BAAA: db $FC, $04, $CD, $20
#_06BAAE: db $00, $00, $CA, $20

.step_4
#_06BAB2: db $F6, $04, $CC, $20
#_06BAB6: db $FC, $04, $CD, $20
#_06BABA: db $FC, $04, $CD, $20
#_06BABE: db $FC, $04, $CD, $20
#_06BAC2: db $00, $00, $CA, $20

.step_5
#_06BAC6: db $F8, $04, $CC, $20
#_06BACA: db $FC, $04, $CD, $20
#_06BACE: db $FC, $04, $CD, $20
#_06BAD2: db $FC, $04, $CD, $20
#_06BAD6: db $00, $00, $CA, $20

.step_6
#_06BADA: db $04, $03, $E2, $20
#_06BADE: db $FA, $04, $CC, $20
#_06BAE2: db $FC, $04, $CD, $20
#_06BAE6: db $FC, $04, $CD, $20
#_06BAEA: db $00, $00, $CA, $20

.step_7
#_06BAEE: db $04, $03, $F1, $20
#_06BAF2: db $FA, $04, $CC, $20
#_06BAF6: db $FC, $04, $CD, $20
#_06BAFA: db $FC, $04, $CD, $20
#_06BAFE: db $00, $00, $CA, $20

;===================================================================================================

WaterSwitch_HitBox:
#_06BB02: db $08, $06
#_06BB04: db $10, $10
#_06BB06: db $10, $08
#_06BB08: db $10, $08
#_06BB0A: db $10, $08
#_06BB0C: db $10, $08
#_06BB0E: db $10, $03
#_06BB10: db $10, $08

;===================================================================================================

WaterSwitch_OAMDataPointer:
#_06BB12: dw WaterSwitch_OAMData_step_0
#_06BB14: dw WaterSwitch_OAMData_step_1
#_06BB16: dw WaterSwitch_OAMData_step_2
#_06BB18: dw WaterSwitch_OAMData_step_3
#_06BB1A: dw WaterSwitch_OAMData_step_4
#_06BB1C: dw WaterSwitch_OAMData_step_5
#_06BB1E: dw WaterSwitch_OAMData_step_6
#_06BB20: dw WaterSwitch_OAMData_step_7

;===================================================================================================

WaterSwitch_Main:
#_06BB22: JSR SpriteDraw_AllocateOAMDeferToPlayer
#_06BB25: JSR Sprite_PrepOAMCoord

#_06BB28: LDA.w $0F50,X

#_06BB2B: LDY.w $0ABD
#_06BB2E: BEQ .translucency_enabled

#_06BB30: ORA.b #$0E
#_06BB32: BRA .continue

.translucency_enabled
#_06BB34: AND.b #$F1

;---------------------------------------------------------------------------------------------------

.continue
#_06BB36: STA.w $0F50,X
#_06BB39: STA.b $02

#_06BB3B: LDA.w $0DA0,X

#_06BB3E: LSR A
#_06BB3F: LSR A

#_06BB40: AND.b #$03
#_06BB42: STA.b $01

#_06BB44: LDA.b #$00
#_06BB46: XBA
#_06BB47: LDA.w $0DE0,X
#_06BB4A: ASL A

#_06BB4B: PHX

#_06BB4C: REP #$31

#_06BB4E: PHB

#_06BB4F: TAY

#_06BB50: LDX.w WaterSwitch_OAMDataPointer,Y

#_06BB53: LDA.b $90
#_06BB55: ADC.w #$0004
#_06BB58: STA.b $90

#_06BB5A: TAY

#_06BB5B: INC.b $92

#_06BB5D: LDA.w #$0013
#_06BB60: %MVN(WaterSwitch_OAMDataPointer>>16, $00) ; MVN $06, $00

#_06BB63: PLB

;---------------------------------------------------------------------------------------------------

#_06BB64: SEP #$20

#_06BB66: LDY.b $90

#_06BB68: LDA.b $01
#_06BB6A: EOR.b #$FF
#_06BB6C: INC A

#_06BB6D: CLC
#_06BB6E: ADC.w $0FA8
#_06BB71: TAX

#_06BB72: CLC
#_06BB73: ADC.w $0000,Y
#_06BB76: STA.w $0000,Y

#_06BB79: TXA
#_06BB7A: CLC
#_06BB7B: ADC.w $0004,Y
#_06BB7E: STA.w $0004,Y

#_06BB81: TXA
#_06BB82: CLC
#_06BB83: ADC.w $0008,Y
#_06BB86: STA.w $0008,Y

#_06BB89: TXA
#_06BB8A: CLC
#_06BB8B: ADC.w $000C,Y
#_06BB8E: STA.w $000C,Y

#_06BB91: LDA.w $0FA8
#_06BB94: CLC
#_06BB95: ADC.w $0010,Y
#_06BB98: STA.w $0010,Y

;---------------------------------------------------------------------------------------------------

#_06BB9B: LSR.b $01

#_06BB9D: LDA.w $0FA9
#_06BBA0: SEC
#_06BBA1: SBC.b $01
#_06BBA3: TAX

#_06BBA4: CLC
#_06BBA5: ADC.w $0001,Y
#_06BBA8: STA.w $0001,Y

#_06BBAB: TXA
#_06BBAC: CLC
#_06BBAD: ADC.w $0005,Y
#_06BBB0: STA.w $0005,Y

#_06BBB3: TXA
#_06BBB4: CLC
#_06BBB5: ADC.w $0009,Y
#_06BBB8: STA.w $0009,Y

#_06BBBB: TXA
#_06BBBC: CLC
#_06BBBD: ADC.w $000D,Y
#_06BBC0: STA.w $000D,Y

#_06BBC3: LDA.w $0FA9
#_06BBC6: CLC
#_06BBC7: ADC.w $0011,Y
#_06BBCA: STA.w $0011,Y

;---------------------------------------------------------------------------------------------------

#_06BBCD: LDA.b $02
#_06BBCF: ORA.w $0003,Y
#_06BBD2: STA.w $0003,Y

#_06BBD5: LDA.b $02
#_06BBD7: ORA.w $0007,Y
#_06BBDA: STA.w $0007,Y

#_06BBDD: LDA.b $02
#_06BBDF: ORA.w $000B,Y
#_06BBE2: STA.w $000B,Y

#_06BBE5: LDA.b $02
#_06BBE7: ORA.w $000F,Y
#_06BBEA: STA.w $000F,Y

#_06BBED: LDA.b $02
#_06BBEF: ORA.w $0013,Y
#_06BBF2: STA.w $0013,Y

;---------------------------------------------------------------------------------------------------

#_06BBF5: REP #$31

#_06BBF7: LDA.w #$0000
#_06BBFA: TAY
#_06BBFB: STA.b ($92),Y

#_06BBFD: INY
#_06BBFE: INY
#_06BBFF: STA.b ($92),Y

#_06BC01: LDA.w #$0200
#_06BC04: INY
#_06BC05: STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

#_06BC07: SEP #$30

#_06BC09: PLX

#_06BC0A: LDY.b #$FF
#_06BC0C: LDA.b #$04
#_06BC0E: JSR Sprite_CorrectOAMEntries

#_06BC11: LDA.w $0F20,X
#_06BC14: CMP.b $EE
#_06BC16: BEQ .same_layer

#_06BC18: JMP.w .exit

;---------------------------------------------------------------------------------------------------

.same_layer
#_06BC1B: STZ.w $0DB0,X

#_06BC1E: LDA.w $0DE0,X
#_06BC21: ASL A
#_06BC22: ASL A
#_06BC23: ASL A
#_06BC24: ASL A
#_06BC25: TAY

#_06BC26: LDA.w WaterSwitch_OAMData+0,Y
#_06BC29: CLC
#_06BC2A: ADC.w $0D10,X
#_06BC2D: STA.b $04

;---------------------------------------------------------------------------------------------------

#_06BC2F: STZ.b $0A

#_06BC31: LDA.w WaterSwitch_OAMData+0,Y
#_06BC34: BPL .positive_x

#_06BC36: DEC.b $0A

.positive_x
#_06BC38: LDA.b $0A
#_06BC3A: ADC.w $0D30,X
#_06BC3D: STA.b $0A

#_06BC3F: LDA.w WaterSwitch_OAMData+1,Y
#_06BC42: CLC
#_06BC43: ADC.w $0D00,X
#_06BC46: STA.b $05

;---------------------------------------------------------------------------------------------------

#_06BC48: STZ.b $0B

#_06BC4A: LDA.w WaterSwitch_OAMData+1,Y
#_06BC4D: BPL .positive_y

#_06BC4F: DEC.b $0B

.positive_y
#_06BC51: LDA.b $0B
#_06BC53: ADC.w $0D20,X
#_06BC56: STA.b $0B

;---------------------------------------------------------------------------------------------------

#_06BC58: LDA.w $0DE0,X
#_06BC5B: ASL A
#_06BC5C: TAY

#_06BC5D: LDA.w WaterSwitch_HitBox+0,Y
#_06BC60: STA.b $06

#_06BC62: LDA.w WaterSwitch_HitBox+1,Y
#_06BC65: STA.b $07

#_06BC67: JSR Link_SetupHitBox
#_06BC6A: JSR CheckIfHitBoxesOverlap
#_06BC6D: BCC .no_contact

;---------------------------------------------------------------------------------------------------

#_06BC6F: LDA.w $0D00,X
#_06BC72: PHA

#_06BC73: CLC
#_06BC74: ADC.b #$13
#_06BC76: STA.w $0D00,X

#_06BC79: LDA.w $0D20,X
#_06BC7C: PHA

#_06BC7D: ADC.b #$00
#_06BC7F: STA.w $0D20,X

#_06BC82: JSR Sprite_DirectionToFaceLink

#_06BC85: PLA
#_06BC86: STA.w $0D20,X

#_06BC89: PLA
#_06BC8A: STA.w $0D00,X

#_06BC8D: CPY.b #$00
#_06BC8F: BNE .contact

#_06BC91: LDA.b $2F
#_06BC93: CMP.b #$04
#_06BC95: BNE .contact

#_06BC97: INC.w $0DB0,X
#_06BC9A: BRA .contact

;---------------------------------------------------------------------------------------------------

.no_contact
#_06BC9C: JSR Sprite_CheckDamageToLink_same_layer
#_06BC9F: BCC .exit

;---------------------------------------------------------------------------------------------------

.contact
#_06BCA1: JSL Sprite_CancelHookshot

#_06BCA5: STZ.b $5E

#_06BCA7: JSL Sprite_RepelDash_long

.exit
#_06BCAB: RTS

;===================================================================================================

Sprite_39_Locksmith:
#_06BCAC: JSR SpriteDraw_Locksmith
#_06BCAF: JSR Sprite_CheckIfActive_Bank06
#_06BCB2: JSL Sprite_BehaveAsBarrier

#_06BCB6: LDA.w $0D80,X
#_06BCB9: JSL JumpTableLocal
#_06BCBD: dw LockSmith_Chillin
#_06BCBF: dw LockSmith_FollowLink
#_06BCC1: dw LockSmith_OfferService
#_06BCC3: dw LockSmith_RespondToAnswer
#_06BCC5: dw LockSmith_JustPromiseOkay
#_06BCC7: dw LockSmith_SilentDismay

;===================================================================================================

LockSmith_Chillin:
#_06BCC9: LDA.b #$07 ; MESSAGE 0107
#_06BCCB: LDY.b #$01
#_06BCCD: JSL Sprite_ShowSolicitedMessage

#_06BCD1: LDA.w $0D10,X
#_06BCD4: PHA

#_06BCD5: SEC
#_06BCD6: SBC.b #$10
#_06BCD8: STA.w $0D10,X

#_06BCDB: JSR Sprite_Get16BitCoords

#_06BCDE: LDA.b #$01
#_06BCE0: STA.w $0D50,X
#_06BCE3: STA.w $0D40,X

#_06BCE6: JSL Sprite_CheckTileCollision_long
#_06BCEA: BNE .dont_stalk_link

#_06BCEC: INC.w $0D80,X

#_06BCEF: LDA.l $7EF3CC
#_06BCF3: CMP.b #$00
#_06BCF5: BEQ .dont_stalk_link

#_06BCF7: LDA.b #$05
#_06BCF9: STA.w $0D80,X

.dont_stalk_link
#_06BCFC: PLA
#_06BCFD: STA.w $0D10,X

#_06BD00: RTS

;===================================================================================================

LockSmith_FollowLink:
#_06BD01: LDA.b #$09 ; FOLLOWER 09
#_06BD03: STA.l $7EF3CC

#_06BD07: PHX

#_06BD08: STZ.w $02F9

#_06BD0B: JSL LoadFollowerGraphics
#_06BD0F: JSL Follower_Initialize

#_06BD13: PLX

#_06BD14: LDA.b #$40
#_06BD16: STA.w $02CD
#_06BD19: STZ.w $02CE

#_06BD1C: STZ.w $0DD0,X

#_06BD1F: RTS

;===================================================================================================

LockSmith_OfferService:
#_06BD20: JSL CheckIfLinkIsBusy
#_06BD24: BCS .exit

#_06BD26: LDA.l $7EF3D3
#_06BD2A: BEQ .dont_have_chest

#_06BD2C: LDA.b #$09 ; MESSAGE 0109
#_06BD2E: LDY.b #$01
#_06BD30: JSL Sprite_ShowSolicitedMessage
#_06BD34: BCC .exit

#_06BD36: BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_have_chest
#_06BD38: LDA.b #$09 ; MESSAGE 0109
#_06BD3A: LDY.b #$01
#_06BD3C: JSL Sprite_ShowMessageOnContact
#_06BD40: BCC .exit

.continue
#_06BD42: INC.w $0D80,X

.exit
#_06BD45: RTS

;===================================================================================================

LockSmith_RespondToAnswer:
#_06BD46: LDA.w $1CE8
#_06BD49: BNE .rejected

#_06BD4B: LDA.l $7EF3D3
#_06BD4F: BEQ .give_bottle

#_06BD51: LDA.b #$0C ; MESSAGE 010C
#_06BD53: LDY.b #$01
#_06BD55: JSL Sprite_ShowMessageUnconditional

#_06BD59: LDA.b #$02
#_06BD5B: STA.w $0D80,X

#_06BD5E: RTS

;---------------------------------------------------------------------------------------------------

.give_bottle
#_06BD5F: LDY.b #$16 ; ITEMGET 16
#_06BD61: STZ.w $02E9
#_06BD64: JSL Link_ReceiveItem

#_06BD68: LDA.l $7EF3C9
#_06BD6C: ORA.b #$10
#_06BD6E: STA.l $7EF3C9

#_06BD72: INC.w $0D80,X

#_06BD75: LDA.b #$00
#_06BD77: STA.l $7EF3CC

#_06BD7B: RTS

;---------------------------------------------------------------------------------------------------

.rejected
#_06BD7C: LDA.b #$0A ; MESSAGE 010A
#_06BD7E: LDY.b #$01
#_06BD80: JSL Sprite_ShowMessageUnconditional

#_06BD84: LDA.b #$02
#_06BD86: STA.w $0D80,X

#_06BD89: RTS

;===================================================================================================

LockSmith_JustPromiseOkay:
#_06BD8A: LDA.b #$0B ; MESSAGE 010B
#_06BD8C: LDY.b #$01
#_06BD8E: JSL Sprite_ShowSolicitedMessage

#_06BD92: RTS

;===================================================================================================

LockSmith_SilentDismay:
#_06BD93: LDA.b #$07 ; MESSAGE 0107
#_06BD95: LDY.b #$01
#_06BD97: JSL Sprite_ShowSolicitedMessage

#_06BD9B: RTS

;===================================================================================================

pool SpriteDraw_Locksmith

.oam_groups
#_06BD9C: dw   0,  -8 : db $EA, $00, $00, $02
#_06BDA4: dw   0,   0 : db $EC, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Locksmith:
#_06BDAC: LDA.b #$02
#_06BDAE: STA.b $06
#_06BDB0: STZ.b $07

#_06BDB2: LDA.b #.oam_groups>>0
#_06BDB4: STA.b $08

#_06BDB6: LDA.b #.oam_groups>>8
#_06BDB8: STA.b $09

#_06BDBA: JSL SpriteDraw_Tabulated_player_deferred

#_06BDBE: JMP.w SpriteDraw_Shadow

;===================================================================================================

Sprite_2B_Hobo:
#_06BDC1: LDA.w $0E80,X
#_06BDC4: JSL JumpTableLocal
#_06BDC8: dw Hobo_Bum
#_06BDCA: dw Hobo_Bubble
#_06BDCC: dw Hobo_Fire
#_06BDCE: dw Hobo_Smoke

;===================================================================================================

Hobo_Bum:
#_06BDD0: JSL SpriteDraw_Hobo
#_06BDD4: JSR Sprite_CheckIfActive_Bank06

#_06BDD7: LDA.b #$03
#_06BDD9: STA.w $0F60,X

#_06BDDC: JSR Sprite_CheckDamageToLink_same_layer
#_06BDDF: BCC .no_contact

#_06BDE1: JSL Sprite_CancelHookshot

#_06BDE5: STZ.b $5E

#_06BDE7: JSL Link_CancelDash_long

.no_contact
#_06BDEB: LDA.w $0D80,X
#_06BDEE: JSL JumpTableLocal
#_06BDF2: dw Hobo_Sleep
#_06BDF4: dw Hobo_Awoken
#_06BDF6: dw Hobo_GiveBottle
#_06BDF8: dw Hobo_BackToSleep

;===================================================================================================

Hobo_Sleep:
#_06BDFA: LDA.b #$07
#_06BDFC: STA.w $0F60,X

#_06BDFF: JSR Sprite_CheckDamageToLink_same_layer
#_06BE02: BCC .keep_snoozing

#_06BE04: LDA.b $F6
#_06BE06: BPL .keep_snoozing

#_06BE08: INC.w $0D80,X

#_06BE0B: LDY.w $0E90,X

#_06BE0E: LDA.b #$04
#_06BE10: STA.w $0DF0,Y

#_06BE13: LDA.b #$01
#_06BE15: STA.w $02E4

;---------------------------------------------------------------------------------------------------

.keep_snoozing
#_06BE18: LDA.w $0E10,X
#_06BE1B: BNE .exit

#_06BE1D: LDA.b #$A0
#_06BE1F: STA.w $0E10,X

#_06BE22: JSR Hobo_SpawnBubble

#_06BE25: TYA
#_06BE26: STA.w $0E90,X

.exit
#_06BE29: RTS

;===================================================================================================

pool Hobo_Awoken

.anim_step
#_06BE2A: db $00, $01, $00, $01, $00, $01, $02, $FF

.timer
#_06BE32: db   6,   2,   6,   6,   2, 100,  30

pool off

;---------------------------------------------------------------------------------------------------

Hobo_Awoken:
#_06BE39: LDA.w $0DF0,X
#_06BE3C: BNE .exit

#_06BE3E: LDY.w $0D90,X

#_06BE41: LDA.w .anim_step,Y
#_06BE44: BMI .fully_awake

#_06BE46: STA.w $0DC0,X

#_06BE49: LDA.w .timer,Y
#_06BE4C: STA.w $0DF0,X

#_06BE4F: INC.w $0D90,X

.exit
#_06BE52: RTS

;---------------------------------------------------------------------------------------------------

.fully_awake
#_06BE53: LDA.b #$D7 ; MESSAGE 00D7
#_06BE55: LDY.b #$00
#_06BE57: JSL Sprite_ShowMessageUnconditional

#_06BE5B: INC.w $0D80,X

#_06BE5E: RTS

;===================================================================================================

Hobo_GiveBottle:
#_06BE5F: INC.w $0D80,X

#_06BE62: LDA.b #$01
#_06BE64: STA.w $0DC0,X

#_06BE67: PHX

#_06BE68: LDX.b $8A

#_06BE6A: LDA.l $7EF280,X
#_06BE6E: ORA.b #$20
#_06BE70: STA.l $7EF280,X

#_06BE74: LDY.b #$16 ; ITEMGET 16
#_06BE76: STZ.w $02E9
#_06BE79: JSL Link_ReceiveItem

#_06BE7D: LDA.l $7EF3C9
#_06BE81: ORA.b #$01
#_06BE83: STA.l $7EF3C9

#_06BE87: PLX

#_06BE88: RTS

;===================================================================================================

Hobo_BackToSleep:
#_06BE89: STZ.w $02E4

#_06BE8C: STZ.w $0DC0,X

#_06BE8F: LDA.w $0DF0,X
#_06BE92: BNE .exit

#_06BE94: LDA.b #$A0
#_06BE96: STA.w $0DF0,X

#_06BE99: JSR Hobo_SpawnBubble

.exit
#_06BE9C: RTS

;===================================================================================================

SpritePrep_Hobo_SpawnSmoke:
#_06BE9D: LDA.b #$2B ; SPRITE 2B
#_06BE9F: JSL Sprite_SpawnDynamically
#_06BEA3: BMI .no_space

#_06BEA5: JSL Sprite_SetSpawnedCoordinates

#_06BEA9: LDA.b #$00
#_06BEAB: STA.w $0E80,Y
#_06BEAE: STA.w $0BA0,Y

.no_space
#_06BEB1: RTS

;===================================================================================================

UNREACHABLE_06BEB2:
#_06BEB2: db $01, $FF

;===================================================================================================

Hobo_Bubble:
#_06BEB4: LDA.b #$04
#_06BEB6: JSL SpriteDraw_AllocateOAMFromRegionC

#_06BEBA: JSR SpriteDraw_SingleSmall
#_06BEBD: JSR Sprite_CheckIfActive_Bank06

#_06BEC0: LDA.b $1A

#_06BEC2: LSR A
#_06BEC3: LSR A
#_06BEC4: LSR A
#_06BEC5: LSR A

#_06BEC6: AND.b #$01

#_06BEC8: INC A
#_06BEC9: INC A

#_06BECA: STA.w $0DC0,X

#_06BECD: LDA.w $0E00,X
#_06BED0: BNE .delay

#_06BED2: INC.w $0DC0,X

#_06BED5: JSR Sprite_Move_Z_Bank06

#_06BED8: LDA.w $0DF0,X
#_06BEDB: BNE .delay

#_06BEDD: STZ.w $0DD0,X

.delay
#_06BEE0: LDA.w $0DF0,X
#_06BEE3: CMP.b #$04
#_06BEE5: BCS .exit

#_06BEE7: LDA.b #$03
#_06BEE9: STA.w $0DC0,X

.exit
#_06BEEC: RTS

;===================================================================================================

Hobo_SpawnBubble:
#_06BEED: LDA.b #$2B ; SPRITE 2B
#_06BEEF: JSL Sprite_SpawnDynamically
#_06BEF3: BMI EXIT_06BF14

#_06BEF5: JSL Sprite_SetSpawnedCoordinates

#_06BEF9: LDA.b #$01
#_06BEFB: STA.w $0E80,Y

#_06BEFE: LDA.b #$02
#_06BF00: STA.w $0F80,Y

#_06BF03: LDA.b #$60
#_06BF05: STA.w $0DF0,Y

#_06BF08: LSR A
#_06BF09: STA.w $0E00,Y
#_06BF0C: STA.w $0BA0,Y

;===================================================================================================

Sprite_ZeroOutOAMAllocation:
#_06BF0F: LDA.b #$00
#_06BF11: STA.w $0E40,Y

;---------------------------------------------------------------------------------------------------

#EXIT_06BF14:
#_06BF14: RTS

;===================================================================================================

Hobo_Fire:
#_06BF15: JSR SpriteDraw_SingleSmall
#_06BF18: JSR Sprite_CheckIfActive_Bank06

#_06BF1B: LDA.b $1A

#_06BF1D: LSR A
#_06BF1E: LSR A
#_06BF1F: LSR A

#_06BF20: AND.b #$03
#_06BF22: STA.b $00

#_06BF24: AND.b #$01
#_06BF26: STA.w $0DC0,X

#_06BF29: LDA.b $00

#_06BF2B: ASL A
#_06BF2C: ASL A
#_06BF2D: ASL A
#_06BF2E: ASL A

#_06BF2F: AND.b #$40
#_06BF31: STA.b $00

#_06BF33: LDA.w $0F50,X
#_06BF36: AND.b #$BF
#_06BF38: ORA.b $00
#_06BF3A: STA.w $0F50,X

#_06BF3D: LDA.w $0DF0,X
#_06BF40: BNE .exit

#_06BF42: JSR Hobo_SpawnSmoke

#_06BF45: LDA.b #$2F
#_06BF47: STA.w $0DF0,X

.exit
#_06BF4A: RTS

;===================================================================================================

SpritePrep_Hobo_SpawnFire:
#_06BF4B: LDA.b #$2B ; SPRITE 2B
#_06BF4D: JSL Sprite_SpawnDynamically
#_06BF51: BMI .no_space

#_06BF53: LDA.b #$94
#_06BF55: STA.w $0D10,Y

#_06BF58: LDA.b #$01
#_06BF5A: STA.w $0D30,Y

#_06BF5D: LDA.b #$3F
#_06BF5F: STA.w $0D00,Y

#_06BF62: LDA.b #$00
#_06BF64: STA.w $0D20,Y

#_06BF67: LDA.b #$02
#_06BF69: STA.w $0E80,Y
#_06BF6C: STA.w $0BA0,Y

#_06BF6F: JSR Sprite_ZeroOutOAMAllocation

#_06BF72: LDA.w $0F50,Y
#_06BF75: AND.b #$F1
#_06BF77: ORA.b #$02
#_06BF79: STA.w $0F50,Y

.no_space
#_06BF7C: RTS

;===================================================================================================

pool Hobo_Smoke

.flip
#_06BF7D: db $00, $40, $80, $C0

pool off

;---------------------------------------------------------------------------------------------------

Hobo_Smoke:
#_06BF81: LDA.b #$06
#_06BF83: STA.w $0DC0,X

#_06BF86: JSR SpriteDraw_SingleSmall
#_06BF89: JSR Sprite_CheckIfActive_Bank06

#_06BF8C: JSR Sprite_Move_XY_Bank06
#_06BF8F: JSR Sprite_Move_Z_Bank06

#_06BF92: LDA.b $1A

#_06BF94: LSR A
#_06BF95: LSR A
#_06BF96: LSR A
#_06BF97: LSR A

#_06BF98: AND.b #$03
#_06BF9A: TAY

#_06BF9B: LDA.w $0F50,X
#_06BF9E: AND.b #$3F
#_06BFA0: ORA.w .flip,Y
#_06BFA3: STA.w $0F50,X

#_06BFA6: LDA.w $0DF0,X
#_06BFA9: BNE .exit

#_06BFAB: STZ.w $0DD0,X

.exit
#_06BFAE: RTS

;===================================================================================================

Hobo_SpawnSmoke:
#_06BFAF: LDA.b #$2B ; SPRITE 2B
#_06BFB1: JSL Sprite_SpawnDynamically
#_06BFB5: BMI .exit

#_06BFB7: JSL Sprite_SetSpawnedCoordinates

#_06BFBB: LDA.b $02
#_06BFBD: SEC
#_06BFBE: SBC.b #$04
#_06BFC0: STA.w $0D00,Y

#_06BFC3: LDA.b $03
#_06BFC5: SBC.b #$00
#_06BFC7: STA.w $0D20,Y

#_06BFCA: LDA.b #$03
#_06BFCC: STA.w $0E80,Y

#_06BFCF: LDA.b #$07
#_06BFD1: STA.w $0F80,Y

#_06BFD4: LDA.b #$60
#_06BFD6: STA.w $0DF0,Y
#_06BFD9: STA.w $0BA0,Y

#_06BFDC: JSR Sprite_ZeroOutOAMAllocation

.exit
#_06BFDF: RTS

;===================================================================================================

Sprite_73_UncleAndPriest_bounce:
#_06BFE0: JSL Sprite_73_UncleAndPriest

#_06BFE4: RTS

;===================================================================================================

SpritePrep_UncleAndPriest_bounce:
#_06BFE5: JSL SpritePrep_UncleAndPriest

#_06BFE9: RTS

;===================================================================================================

SpriteModule_Active_Bank05_bounce:
#_06BFEA: JSL SpriteModule_Active_Bank05

#_06BFEE: RTS

;===================================================================================================

SpriteModule_Active_Bank1E_bounce:
#_06BFEF: JSL SpriteModule_Active_Bank1E

#_06BFF3: RTS

;===================================================================================================

SpriteModule_Active_Bank1D_bounce:
#_06BFF4: JSL SpriteModule_Active_Bank1D

#_06BFF8: RTS

;===================================================================================================

SpritePrep_OldMan_bounce:
#_06BFF9: JSL SpritePrep_OldMan

#_06BFFD: RTS

;===================================================================================================

TutorialGuardOrBarrier_bounce:
#_06BFFE: JSL TutorialGuardOrBarrier

#_06C002: RTS

;===================================================================================================

Sprite_PullSwitch_bounce:
#_06C003: JSL Sprite_PullSwitch

#_06C007: RTS

;===================================================================================================

SomariaPlatformAndPipe_bounce:
#_06C008: JSL SomariaPlatformAndPipe

#_06C00C: RTS

;===================================================================================================

Sprite_F2_MedallionTablet_bounce:
#_06C00D: JSL Sprite_F2_MedallionTablet

#_06C011: RTS

;===================================================================================================

Sprite_32_ArguingBros_bounce:
#_06C012: JSL Sprite_32_ArguingBros

#_06C016: RTS

;===================================================================================================

Sprite_33_RupeePull_bounce:
#_06C017: JSL Sprite_33_RupeePull

#_06C01B: RTS

;===================================================================================================

Sprite_14_ThievesTownGrate_bounce:
#_06C01C: JSL Sprite_14_ThievesTownGrate

#_06C020: RTS

;===================================================================================================

Sprite_34_YoungSnitch_bounce:
#_06C021: JSL Sprite_34_YoungSnitch

#_06C025: RTS

;===================================================================================================

SpritePrep_Snitch_bounce_2:
#_06C026: JSL SpritePrep_Snitch

#_06C02A: RTS

;===================================================================================================

Sprite_35_Innkeeper_bounce:
#_06C02B: JSL Sprite_35_Innkeeper

#_06C02F: RTS

;===================================================================================================

SpritePrep_Snitch_bounce_3:
#_06C030: JSL SpritePrep_Snitch

#_06C034: RTS

;===================================================================================================

Sprite_36_Witch_bounce:
#_06C035: JSL Sprite_36_Witch

#_06C039: RTS

;===================================================================================================

Sprite_37_Waterfall_bounce:
#_06C03A: JSL Sprite_37_Waterfall

#_06C03E: RTS

;===================================================================================================

Sprite_38_EyeStatue_bounce:
#_06C03F: JSL Sprite_38_EyeStatue

#_06C043: RTS

;===================================================================================================

Sprite_3A_MagicBat_bounce:
#_06C044: JSL Sprite_3A_MagicBat

#_06C048: RTS

;===================================================================================================

Sprite_3B_BonkItem_bounce:
#_06C049: JSL Sprite_3B_BonkItem

#_06C04D: RTS

;===================================================================================================

Sprite_3C_KidInKak_bounce:
#_06C04E: JSL Sprite_3C_KidInKak

#_06C052: RTS

;===================================================================================================

Sprite_3D_OldSnitch_bounce:
#_06C053: JSL Sprite_3D_OldSnitch

#_06C057: RTS

;===================================================================================================

Sprite_74_RunningBoy_bounce:
#_06C058: JSL Sprite_74_RunningBoy

#_06C05C: RTS

;===================================================================================================

SpritePrep_RunningBoy_bounce:
#_06C05D: JSL SpritePrep_RunningBoy

#_06C061: RTS

;===================================================================================================

Sprite_75_BottleMerchant_bounce:
#_06C062: JSL Sprite_75_BottleMerchant

#_06C066: RTS

;===================================================================================================

Sprite_76_Zelda_bounce:
#_06C067: JSL Sprite_76_Zelda

#_06C06B: RTS

;===================================================================================================

SpritePrep_Zelda_bounce:
#_06C06C: JSL SpritePrep_Zelda

#_06C070: RTS

;===================================================================================================

Sprite_78_MrsSahasrahla_bounce:
#_06C071: JSL Sprite_78_MrsSahasrahla

#_06C075: RTS

;===================================================================================================

Sprite_E7_Mushroom_bounce:
#_06C076: JSL Sprite_E7_Mushroom

#_06C07A: RTS

;===================================================================================================

SpritePrep_Mushroom_bounce:
#_06C07B: JSL SpritePrep_Mushroom

#_06C07F: RTS

;===================================================================================================

Sprite_E8_FakeMasterSword_bounce:
#_06C080: JSL Sprite_E8_FakeMasterSword

#_06C084: RTS

;---------------------------------------------------------------------------------------------------

SpritePrep_FakeMasterSword_bounce:
#_06C085: JSL SpritePrep_FakeMasterSword

#_06C089: RTS

;===================================================================================================

Sprite_16_Elder_bounce:
#_06C08A: JSL Sprite_16_Elder

#_06C08E: RTS

;===================================================================================================

Sprite_E9_MagicShopAssistant_bounce:
#_06C08F: JSL Sprite_E9_MagicShopAssistant

#_06C093: RTS

;===================================================================================================

SpritePrep_MagicShopAssistant_bounce:
#_06C094: JSL SpritePrep_MagicShopAssistant

#_06C098: RTS

;===================================================================================================

Sprite_EA_HeartContainer_bounce:
#_06C099: JSL Sprite_EA_HeartContainer

#_06C09D: RTS

;===================================================================================================

SpritePrep_HeartContainer_bounce:
#_06C09E: JSL SpritePrep_HeartContainer

#_06C0A2: RTS

;===================================================================================================

Sprite_EB_HeartPiece_bounce:
#_06C0A3: JSL Sprite_EB_HeartPiece

#_06C0A7: RTS

;===================================================================================================

SpritePrep_HeartPiece:
#_06C0A8: JSL SpritePrep_HeartContainer

#_06C0AC: RTS

;===================================================================================================

Sprite_2E_FluteKid_bounce:
#_06C0AD: JSL Sprite_2E_FluteKid

#_06C0B1: RTS

;===================================================================================================

Sprite_2D_NecklessMan_bounce:
#_06C0B2: JSL Sprite_2D_NecklessMan

#_06C0B6: RTS

;===================================================================================================

Sprite_29_Adult_bounce:
#_06C0B7: JSL Sprite_29_Adult

#_06C0BB: RTS

;===================================================================================================

Sprite_2A_SweepingLady_bounce:
#_06C0BC: JSL Sprite_2A_SweepingLady

#_06C0C0: RTS

;===================================================================================================

Sprite_2C_Lumberjacks_bounce:
#_06C0C1: JSL Sprite_2C_Lumberjacks

#_06C0C5: RTS

;===================================================================================================

Sprite_31_FortuneTeller_bounce:
#_06C0C6: JSL Sprite_31_FortuneTeller

#_06C0CA: RTS

;===================================================================================================

Sprite_2F_RaceGameLady_bounce:
#_06C0CB: JSL Sprite_2F_RaceGameLady

#_06C0CF: RTS

;===================================================================================================

Sprite_30_RaceGameGuy_bounce:
#_06C0D0: JSL Sprite_30_RaceGameGuy

#_06C0D4: RTS

;===================================================================================================

Sprite_25_TalkingTree_bounce:
#_06C0D5: JSL Sprite_25_TalkingTree

#_06C0D9: RTS

;===================================================================================================

StatueDirection:
#_06C0DA: db $04, $06, $00, $02

;---------------------------------------------------------------------------------------------------

StatuePressMask:
#_06C0DE: db $01, $02, $04, $08

;---------------------------------------------------------------------------------------------------

StatueSpeed:
.x
#_06C0E2: db -16,  16 ; bleeds into next

.y
#_06C0E4: db   0,   0, -16,  16

;===================================================================================================

Sprite_1C_Statue:
#_06C0E8: LDA.w $0DE0,X
#_06C0EB: BEQ .not_being_pushed

#_06C0ED: STZ.w $0DE0,X

#_06C0F0: STZ.b $5E
#_06C0F2: STZ.b $48

.not_being_pushed
#_06C0F4: LDA.w $0DF0,X
#_06C0F7: BEQ .retain_momentum

#_06C0F9: LDA.b #$01
#_06C0FB: STA.w $0DE0,X

#_06C0FE: LDA.b #$81
#_06C100: STA.b $48

#_06C102: LDA.b #$08
#_06C104: STA.b $5E

.retain_momentum
#_06C106: JSR SpriteDraw_Statue
#_06C109: JSR Sprite_CheckIfActive_Bank06
#_06C10C: JSR Statue_BlockSprites

#_06C10F: STZ.w $0642

#_06C112: JSR Statue_CheckForSwitch
#_06C115: BCC .no_switch

#_06C117: LDA.b #$01
#_06C119: STA.w $0642

.no_switch
#_06C11C: JSR Sprite_Move_XY_Bank06

#_06C11F: JSR Sprite_Get16BitCoords
#_06C122: JSR Sprite_CheckTileCollision
#_06C125: JSR Sprite_ZeroVelocity_XY_Bank06

#_06C128: JSR Sprite_CheckDamageToLink_same_layer
#_06C12B: BCC Statue_NotInContact

#_06C12D: LDA.b #$07
#_06C12F: STA.w $0DF0,X

#_06C132: JSL Sprite_RepelDash_long

#_06C136: LDA.w $0E00,X
#_06C139: BNE Statue_CancelHookshot

#_06C13B: JSR Sprite_DirectionToFaceLink

#_06C13E: LDA.w StatueSpeed_x,Y
#_06C141: STA.w $0D50,X

#_06C144: LDA.w StatueSpeed_y,Y
#_06C147: STA.w $0D40,X

;===================================================================================================

Statue_HandleGrab:
#_06C14A: LDA.w $0376
#_06C14D: AND.b #$02
#_06C14F: BNE .not_grabbing

#_06C151: JSL Sprite_CancelHookshot

.not_grabbing
#_06C155: LDA.w $0E70,X
#_06C158: AND.b #$0F
#_06C15A: BNE .exit

#_06C15C: LDA.w $0F10,X
#_06C15F: BNE .exit

#_06C161: LDA.b #$22 ; SFX2.22
#_06C163: JSL SpriteSFX_QueueSFX2WithPan

#_06C167: LDA.b #$08
#_06C169: STA.w $0F10,X

.exit
#_06C16C: RTS

;===================================================================================================

Statue_CancelHookshot:
#_06C16D: JSL Sprite_CancelHookshot

#_06C171: RTS

;===================================================================================================

Statue_NotInContact:
#_06C172: LDA.w $0DF0,X
#_06C175: BNE .delay_timer

#_06C177: LDA.b #$0D
#_06C179: STA.w $0E00,X

.delay_timer
#_06C17C: REP #$20

#_06C17E: LDA.w $0FD8
#_06C181: SEC
#_06C182: SBC.b $22
#_06C184: CLC
#_06C185: ADC.w #$0010

#_06C188: CMP.w #$0023
#_06C18B: BCS .reset_contact

#_06C18D: LDA.w $0FDA
#_06C190: SEC
#_06C191: SBC.b $20
#_06C193: CLC
#_06C194: ADC.w #$000C

#_06C197: CMP.w #$0024
#_06C19A: BCS .reset_contact

;---------------------------------------------------------------------------------------------------

#_06C19C: SEP #$30

#_06C19E: JSR Sprite_DirectionToFaceLink

#_06C1A1: LDA.b $2F
#_06C1A3: CMP.w StatueDirection,Y
#_06C1A6: BNE .reset_contact

#_06C1A8: LDA.w $0372
#_06C1AB: BNE .reset_contact

#_06C1AD: LDA.b #$01
#_06C1AF: STA.w $02FA

#_06C1B2: LDA.b #$01
#_06C1B4: STA.w $0D90,X

#_06C1B7: LDA.w $0376
#_06C1BA: AND.b #$02
#_06C1BC: BEQ .exit

#_06C1BE: LDA.b $F0
#_06C1C0: AND.w StatuePressMask,Y
#_06C1C3: BEQ .exit

#_06C1C5: LDA.b $30
#_06C1C7: ORA.b $31
#_06C1C9: BEQ .exit

;---------------------------------------------------------------------------------------------------

#_06C1CB: TYA
#_06C1CC: EOR.b #$01
#_06C1CE: TAY

#_06C1CF: LDA.w StatueSpeed_x,Y
#_06C1D2: STA.w $0D50,X

#_06C1D5: LDA.w StatueSpeed_y,Y
#_06C1D8: STA.w $0D40,X

#_06C1DB: JMP.w Statue_HandleGrab

;---------------------------------------------------------------------------------------------------

.reset_contact
#_06C1DE: SEP #$30

#_06C1E0: LDA.w $0D90,X
#_06C1E3: BEQ .exit

#_06C1E5: STZ.w $0D90,X

#_06C1E8: STZ.b $5E

#_06C1EA: STZ.w $0376
#_06C1ED: STZ.w $02FA

#_06C1F0: LDA.b $50
#_06C1F2: AND.b #$FE
#_06C1F4: STA.b $50

.exit
#_06C1F6: RTS

;===================================================================================================

pool Statue_CheckForSwitch

.offset_x
#_06C1F7: db   3,  12,   3,  12

.offset_y
#_06C1FB: db   3,   3,  12,  12

.tile_id
#_06C1FF: db $23, $24, $25, $3B

pool off

;---------------------------------------------------------------------------------------------------

Statue_CheckForSwitch:
#_06C203: LDY.b #$03

.next_tile
#_06C205: LDA.w $0D00,X
#_06C208: CLC
#_06C209: ADC.w .offset_y,Y
#_06C20C: STA.b $00

#_06C20E: LDA.w $0D20,X
#_06C211: ADC.b #$00
#_06C213: STA.b $01

#_06C215: LDA.w $0D10,X
#_06C218: CLC
#_06C219: ADC.w .offset_x,Y
#_06C21C: STA.b $02

#_06C21E: LDA.w $0D30,X
#_06C221: ADC.b #$00
#_06C223: STA.b $03

#_06C225: LDA.w $0F20,X

#_06C228: PHY

#_06C229: JSL GetTileType_long

#_06C22D: PLY

;---------------------------------------------------------------------------------------------------

#_06C22E: LDA.w $0FA5

#_06C231: CMP.w .tile_id+0
#_06C234: BEQ .switch_tile

#_06C236: CMP.w .tile_id+1
#_06C239: BEQ .switch_tile

#_06C23B: CMP.w .tile_id+2
#_06C23E: BEQ .switch_tile

#_06C240: CMP.w .tile_id+3
#_06C243: BNE .fail

.switch_tile
#_06C245: DEY
#_06C246: BPL .next_tile

#_06C248: SEC

#_06C249: RTS

;---------------------------------------------------------------------------------------------------

.fail
#_06C24A: CLC

#_06C24B: RTS

;===================================================================================================

pool SpriteDraw_Statue

.oam_groups
#_06C24C: dw   0,  -8 : db $C2, $00, $00, $00
#_06C254: dw   8,  -8 : db $C2, $40, $00, $00
#_06C25C: dw   0,   0 : db $C0, $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Statue:
#_06C264: REP #$20

#_06C266: LDA.w #.oam_groups
#_06C269: STA.b $08

#_06C26B: LDA.w #$0003
#_06C26E: STA.b $06

#_06C270: SEP #$30

#_06C272: JSL SpriteDraw_Tabulated_player_deferred

#_06C276: RTS

;===================================================================================================

Statue_BlockSprites:
#_06C277: LDY.b #$0F

.next
#_06C279: LDA.w $0E20,Y
#_06C27C: CMP.b #$1C ; SPRITE 1C
#_06C27E: BEQ .skip

#_06C280: CPY.w $0FA0
#_06C283: BEQ .skip

#_06C285: TYA
#_06C286: EOR.b $1A
#_06C288: AND.b #$01
#_06C28A: BNE .skip

#_06C28C: LDA.w $0DD0,Y
#_06C28F: CMP.b #$09
#_06C291: BCC .skip

#_06C293: LDA.w $0D10,Y
#_06C296: STA.b $04

#_06C298: LDA.w $0D30,Y
#_06C29B: STA.b $05

#_06C29D: LDA.w $0D00,Y
#_06C2A0: STA.b $06

#_06C2A2: LDA.w $0D20,Y
#_06C2A5: STA.b $07

#_06C2A7: REP #$20

#_06C2A9: LDA.w $0FD8
#_06C2AC: SEC
#_06C2AD: SBC.b $04
#_06C2AF: CLC
#_06C2B0: ADC.w #$000C

#_06C2B3: CMP.w #$0018
#_06C2B6: BCS .skip

#_06C2B8: LDA.w $0FDA
#_06C2BB: SEC
#_06C2BC: SBC.b $06
#_06C2BE: CLC
#_06C2BF: ADC.w #$000C

#_06C2C2: CMP.w #$0024
#_06C2C5: BCS .skip

;---------------------------------------------------------------------------------------------------

#_06C2C7: SEP #$20

#_06C2C9: LDA.b #$04
#_06C2CB: STA.w $0EA0,Y

#_06C2CE: PHY

#_06C2CF: LDA.b #$20
#_06C2D1: JSR Sprite_ProjectSpeedTowardsLocation

#_06C2D4: PLY

#_06C2D5: LDA.b $00
#_06C2D7: STA.w $0F30,Y

#_06C2DA: LDA.b $01
#_06C2DC: STA.w $0F40,Y

;---------------------------------------------------------------------------------------------------

.skip
#_06C2DF: SEP #$20

#_06C2E1: DEY
#_06C2E2: BPL .next

#_06C2E4: RTS

;===================================================================================================

Sprite_1D_FluteQuest:
#_06C2E5: JSR Sprite_PrepOAMCoord_wrapper
#_06C2E8: JSR Sprite_CheckIfActive_Bank06

#_06C2EB: LDA.b $8A
#_06C2ED: CMP.b #$18 ; OW 18
#_06C2EF: BNE .not_kakariko

#_06C2F1: LDA.l $7EF34C
#_06C2F5: CMP.b #$03
#_06C2F7: BNE .no_active_flute

#_06C2F9: STZ.w $0DD0,X

.no_active_flute
#_06C2FC: RTS

;---------------------------------------------------------------------------------------------------

.not_kakariko
#_06C2FD: LDA.l $7EF34C
#_06C301: AND.b #$02
#_06C303: BEQ .dont_die

#_06C305: STZ.w $0DD0,X

.dont_die
#_06C308: RTS

;===================================================================================================

FairyPond_offset_x:
#_06C309: db   0,   4,   8,  12
#_06C30D: db  16,  20,  24,   0

FairyPond_offset_y:
#_06C311: db   0,   8,  16,  24
#_06C315: db  32,  40,   4,  36

;===================================================================================================

Sprite_72_FairyPond:
#_06C319: LDA.w $0D90,X
#_06C31C: BNE FairyPond_Dust

#_06C31E: LDA.w $0DA0,X
#_06C321: BNE .visible

#_06C323: JSR Sprite_PrepOAMCoord_wrapper

#_06C326: JMP.w FairyPond_Main

.visible
#_06C329: JSR SpriteDraw_FairyQueen

#_06C32C: LDA.b $1A

#_06C32E: LSR A
#_06C32F: LSR A
#_06C330: LSR A
#_06C331: LSR A

#_06C332: AND.b #$01
#_06C334: STA.w $0DC0,X

#_06C337: LDA.b $1A
#_06C339: AND.b #$0F
#_06C33B: BNE .exit

#_06C33D: LDA.b #$72 ; SPRITE 72
#_06C33F: JSL Sprite_SpawnDynamically
#_06C343: BMI .exit

#_06C345: PHX

#_06C346: JSL GetRandomNumber
#_06C34A: AND.b #$07
#_06C34C: TAX

#_06C34D: LDA.b $00
#_06C34F: CLC
#_06C350: ADC.w FairyPond_offset_x,X
#_06C353: STA.w $0D10,Y

#_06C356: LDA.b $01
#_06C358: ADC.b #$00
#_06C35A: STA.w $0D30,Y

#_06C35D: JSL GetRandomNumber
#_06C361: AND.b #$07
#_06C363: TAX

#_06C364: LDA.b $02
#_06C366: CLC
#_06C367: ADC.w FairyPond_offset_y,X
#_06C36A: STA.w $0D00,Y

#_06C36D: LDA.b $03
#_06C36F: ADC.b #$00
#_06C371: STA.w $0D20,Y

#_06C374: LDA.b #$1F
#_06C376: STA.w $0DB0,Y
#_06C379: STA.w $0D90,Y

#_06C37C: JSR Sprite_ZeroOutOAMAllocation

#_06C37F: LDA.b #$48
#_06C381: STA.w $0E60,Y

#_06C384: AND.b #$0F
#_06C386: STA.w $0F50,Y

#_06C389: LDA.b #$01
#_06C38B: STA.w $0DA0,Y

#_06C38E: PLX

.exit
#_06C38F: RTS

;===================================================================================================

FairyPond_Dust:
#_06C390: DEC.w $0DB0,X
#_06C393: BNE .delay

#_06C395: STZ.w $0DD0,X

.delay
#_06C398: LDA.w $0DB0,X
#_06C39B: LSR A
#_06C39C: LSR A
#_06C39D: LSR A
#_06C39E: STA.w $0DC0,X

#_06C3A1: LDA.b #$04
#_06C3A3: JSL SpriteDraw_AllocateOAMFromRegionC

#_06C3A7: JSR SpriteDraw_SingleSmall

#_06C3AA: RTS

;===================================================================================================

FairyPond_TossGFXID:
.bow
#_06C3AB: db $3A ; empty normal bow
#_06C3AC: db $3A ; normal bow and arrows
#_06C3AD: db $3B ; empty silver bow
#_06C3AE: db $3B ; silver bow and arrows

.boomerang
#_06C3AF: db $0C ; blue
#_06C3B0: db $2A ; red

.hookshot
#_06C3B1: db $0A

.bombs
#_06C3B2: db $27

.mushroom
#_06C3B3: db $29 ; mushroom
#_06C3B4: db $0D ; powder

.fire_rod
#_06C3B5: db $07

.ice_rod
#_06C3B6: db $08

.bombos
#_06C3B7: db $0F

.ether
#_06C3B8: db $10

.quake
#_06C3B9: db $11

.lamp
#_06C3BA: db $12

.hammer
#_06C3BB: db $09

.flute
#_06C3BC: db $13 ; shovel
#_06C3BD: db $14 ; inactive flute
#_06C3BE: db $4A ; active flute

.net
#_06C3BF: db $21

.book
#_06C3C0: db $1D

.somaria
#_06C3C1: db $15

.byrna
#_06C3C2: db $18

.cape
#_06C3C3: db $19

.mirror
#_06C3C4: db $31 ; map
#_06C3C5: db $1A ; mirror
#_06C3C6: db $1A ; mirror (triforce)

.gloves
#_06C3C7: db $1B ; power glove
#_06C3C8: db $1C ; titan's mitt

.boots
#_06C3C9: db $4B

.flippers
#_06C3CA: db $1E

.pearl
#_06C3CB: db $1F

.sword
#_06C3CC: db $49 ; fighter sword
#_06C3CD: db $01 ; master sword
#_06C3CE: db $02 ; tempered sword
#_06C3CF: db $03 ; butter sword

.shield
#_06C3D0: db $04 ; fighter shield
#_06C3D1: db $05 ; fire shield
#_06C3D2: db $06 ; mirror shield

.armor
#_06C3D3: db $22 ; blue mail
#_06C3D4: db $23 ; red mail

.bottles
#_06C3D5: db $29 ; mushroom
#_06C3D6: db $16 ; empty bottle
#_06C3D7: db $2B ; red potion
#_06C3D8: db $2C ; green potion
#_06C3D9: db $2D ; blue potion
#_06C3DA: db $3D ; fairy
#_06C3DB: db $3C ; bee
#_06C3DC: db $48 ; good bee

;---------------------------------------------------------------------------------------------------

.pointer
#_06C3DD: dw .bow-1
#_06C3DF: dw .boomerang-1
#_06C3E1: dw .hookshot-1
#_06C3E3: dw .bombs-1
#_06C3E5: dw .mushroom-1
#_06C3E7: dw .fire_rod-1
#_06C3E9: dw .ice_rod-1
#_06C3EB: dw .bombos-1
#_06C3ED: dw .ether-1
#_06C3EF: dw .quake-1
#_06C3F1: dw .lamp-1
#_06C3F3: dw .hammer-1
#_06C3F5: dw .flute-1
#_06C3F7: dw .net-1
#_06C3F9: dw .book-1
#_06C3FB: dw .somaria-1
#_06C3FD: dw .somaria-1
#_06C3FF: dw .byrna-1
#_06C401: dw .cape-1
#_06C403: dw .mirror-1
#_06C405: dw .gloves-1
#_06C407: dw .boots-1
#_06C409: dw .flippers-1
#_06C40B: dw .pearl-1
#_06C40D: dw .sword-1
#_06C40F: dw .sword-1
#_06C411: dw .shield-1
#_06C413: dw .armor-1
#_06C415: dw .bottles-1
#_06C417: dw .bottles-1
#_06C419: dw .bottles-1
#_06C41B: dw .bottles-1

;===================================================================================================

FairyPond_Main:
#_06C41D: JSR SpriteDraw_FairyPondItem
#_06C420: JSR Sprite_CheckIfActive_Bank06

#_06C423: LDA.b $A0
#_06C425: CMP.b #$15 ; ROOM 0115
#_06C427: BEQ FairyPond_LakeHylia

;===================================================================================================

FairyPond_Waterfall:
#_06C429: LDA.w $0D80,X
#_06C42C: JSL JumpTableLocal
#_06C430: dw UpgradeFairy_WaitForLink
#_06C432: dw UpgradeFairy_OfferItemToss
#_06C434: dw UpgradeFairy_HandleItemToss
#_06C436: dw UpgradeFairy_SpawnFairy
#_06C438: dw UpgradeFairy_AskWhoDidThis
#_06C43A: dw UpgradeFairy_HandleAnswer
#_06C43C: dw UpgradeFairy_HandleUpgrade
#_06C43E: dw UpgradeFairy_Retreat
#_06C440: dw UpgradeFairy_FixPalettes
#_06C442: dw UpgradeFairy_HandleItemReceipt
#_06C444: dw UpgradeFairy_FinalGoodBye
#_06C446: dw UpgradeFairy_YouLiar
#_06C448: dw UpgradeFairy_SecondChance
#_06C44A: dw UpgradeFairy_DebaseLink

;===================================================================================================

FairyPond_LakeHylia:
#_06C44C: LDA.w $0D80,X
#_06C44F: JSL JumpTableLocal
#_06C453: dw FairyPond_WaitForLink
#_06C455: dw LakeHyliaFairy_WaitForLink
#_06C457: dw LakeHyliaFairy_BegForDonation
#_06C459: dw LakeHyliaFairy_AcceptDonation
#_06C45B: dw LakeHyliaFairy_WaitForDonation
#_06C45D: dw LakeHyliaFairy_SpawnFairy
#_06C45F: dw LakeHyliaFairy_Greetings
#_06C461: dw LakeHyliaFairy_OfferUpgrade
#_06C463: dw LakeHyliaFairy_UpgradeBombs
#_06C465: dw LakeHyliaFairy_RevertTranslucency
#_06C467: dw LakeHyliaFairy_DeleteFairy
#_06C469: dw LakeHyliaFairy_RestoreAndReset
#_06C46B: dw LakeHyliaFairy_UpgradeArrows
#_06C46D: dw LakeHyliaFairy_GiveDonationStatus
#_06C46F: dw LakeHyliaFairy_GrantLuck

;===================================================================================================

pool SpriteDraw_FairyPondItem

.oam_groups

.group00
#_06C471: dw  32, -64 : db $24, $00, $00, $00
#_06C479: dw  32, -56 : db $34, $00, $00, $00
#_06C481: dw  32, -64 : db $24, $00, $00, $00
#_06C489: dw  32, -56 : db $34, $00, $00, $00

.group01
#_06C491: dw  32, -64 : db $24, $00, $00, $02
#_06C499: dw  32, -64 : db $24, $00, $00, $02
#_06C4A1: dw  32, -64 : db $24, $00, $00, $02
#_06C4A9: dw  32, -64 : db $24, $00, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_pointers
#_06C4B1: dw .group00
#_06C4B3: dw .group01

;---------------------------------------------------------------------------------------------------

SpriteDraw_FairyPondItem:
#_06C4B5: LDA.b $A0
#_06C4B7: CMP.b #$15 ; ROOM 0115
#_06C4B9: BEQ .exit

#_06C4BB: LDA.w $0D80,X
#_06C4BE: CMP.b #$05
#_06C4C0: BEQ .draw_object

#_06C4C2: CMP.b #$06
#_06C4C4: BEQ .draw_object

#_06C4C6: CMP.b #$0B
#_06C4C8: BEQ .draw_object

#_06C4CA: CMP.b #$0C
#_06C4CC: BEQ .draw_object
#_06C4CE: BRA .exit

.draw_object
#_06C4D0: PHX

#_06C4D1: TXY

#_06C4D2: LDA.w $0DC0,Y
#_06C4D5: TAX

#_06C4D6: LDA.l AncillaAdd_ItemReceipt_prop,X
#_06C4DA: CMP.b #$FF
#_06C4DC: BNE .use_loaded_palette

#_06C4DE: LDA.b #$05

.use_loaded_palette
#_06C4E0: AND.b #$07
#_06C4E2: ASL A
#_06C4E3: STA.w $0F50,Y

#_06C4E6: LDA.l AncillaAdd_ItemReceipt_width,X
#_06C4EA: TAY

#_06C4EB: LDA.w .oam_group_pointers+0,Y
#_06C4EE: STA.b $08

#_06C4F0: LDA.w .oam_group_pointers+1,Y
#_06C4F3: STA.b $09

#_06C4F5: LDA.b #$04

#_06C4F7: PLX

#_06C4F8: JSL SpriteDraw_Tabulated

.exit
#_06C4FC: RTS

;===================================================================================================

FairyPond_WaitForLink:
#_06C4FD: STZ.w $02E4

#_06C500: LDA.w $0DF0,X
#_06C503: BNE .exit

#_06C505: JSL CheckIfLinkIsBusy
#_06C509: BCS .exit

#_06C50B: LDA.b #$89 ; MESSAGE 0089
#_06C50D: LDY.b #$00
#_06C50F: JSL Sprite_ShowMessageOnContact
#_06C513: BCC .exit

#_06C515: INC.w $0D80,X

#_06C518: JSL Link_ResetProperties_A
#_06C51C: JSL Ancilla_TerminateSparkleObjects

#_06C520: STZ.b $2F

.exit
#_06C522: RTS

;===================================================================================================

FairyPond_Prices:
#_06C523: db   5,  20,  25,  50

FairyPond_PricesBCD:
#_06C527: db $05, $20, $25, $50

;===================================================================================================

LakeHyliaFairy_WaitForLink:
#_06C52B: LDA.w $1CE8
#_06C52E: BNE .negatory

#_06C530: LDA.l $7EF370
#_06C534: ORA.l $7EF371
#_06C538: BEQ .have_upgraded_before

#_06C53A: LDA.b #$02

.have_upgraded_before
#_06C53C: STA.w $0DC0,X

#_06C53F: TAY

#_06C540: LDA.w FairyPond_PricesBCD+0,Y
#_06C543: STA.w $1CF2

#_06C546: LDA.w FairyPond_PricesBCD+1,Y
#_06C549: STA.w $1CF3

#_06C54C: LDA.b #$4E ; MESSAGE 014E
#_06C54E: LDY.b #$01
#_06C550: JSL Sprite_ShowMessageUnconditional

#_06C554: INC.w $0D80,X

#_06C557: LDA.b #$01
#_06C559: STA.w $02E4

#_06C55C: RTS

;===================================================================================================

#FairyPond_ResetAI:
#_06C55D: SEP #$30

.negatory
#_06C55F: LDA.b #$4C ; MESSAGE 014C
#_06C561: LDY.b #$01
#_06C563: JSL Sprite_ShowMessageUnconditional

#_06C567: STZ.w $0D80,X

#_06C56A: LDA.b #$FF
#_06C56C: STA.w $0DF0,X

#_06C56F: RTS

;===================================================================================================

LakeHyliaFairy_BegForDonation:
#_06C570: LDA.w $1CE8
#_06C573: CLC
#_06C574: ADC.w $0DC0,X
#_06C577: TAY

#_06C578: LDA.w FairyPond_PricesBCD,Y
#_06C57B: STA.w $1CF3

#_06C57E: REP #$20

#_06C580: LDA.w FairyPond_Prices,Y
#_06C583: AND.w #$00FF
#_06C586: STA.b $00

#_06C588: LDA.l $7EF360
#_06C58C: CMP.b $00
#_06C58E: BCC FairyPond_ResetAI

#_06C590: SEP #$30

#_06C592: LDA.b $00
#_06C594: STA.w $0DE0,X

#_06C597: TYA
#_06C598: STA.w $0EB0,X

#_06C59B: INC.w $0D80,X

#_06C59E: RTS

;===================================================================================================

LakeHyliaFairy_AcceptDonation:
#_06C59F: LDA.b #$50
#_06C5A1: STA.w $0DF0,X

#_06C5A4: LDA.w $0DE0,X
#_06C5A7: STA.b $00
#_06C5A9: STZ.b $01

#_06C5AB: REP #$20

#_06C5AD: LDA.l $7EF360
#_06C5B1: SEC
#_06C5B2: SBC.b $00
#_06C5B4: STA.l $7EF360

#_06C5B8: SEP #$30

#_06C5BA: LDA.l $7EF36A
#_06C5BE: CLC
#_06C5BF: ADC.b $00
#_06C5C1: STA.l $7EF36A

#_06C5C5: PHX

#_06C5C6: LDA.w $0EB0,X
#_06C5C9: JSL AddHappinessPondRupees

#_06C5CD: PLX

#_06C5CE: LDA.l $7EF36A
#_06C5D2: CMP.b #100
#_06C5D4: BCC .not_enough_for_upgrade

#_06C5D6: SBC.b #100
#_06C5D8: STA.l $7EF36A

#_06C5DC: LDA.b #$05
#_06C5DE: STA.w $0D80,X

#_06C5E1: RTS

;---------------------------------------------------------------------------------------------------

.not_enough_for_upgrade
#_06C5E2: LDA.l $7EF36A

#_06C5E6: STZ.b $02

.remove_rupees
#_06C5E8: CMP.b #10
#_06C5EA: BCC .less_than_10

#_06C5EC: SBC.b #10
#_06C5EE: INC.b $02

#_06C5F0: BRA .remove_rupees

.less_than_10
#_06C5F2: ASL.b $02
#_06C5F4: ASL.b $02
#_06C5F6: ASL.b $02
#_06C5F8: ASL.b $02

#_06C5FA: ORA.b $02
#_06C5FC: STA.w $1CF2

#_06C5FF: INC.w $0D80,X

#_06C602: RTS

;===================================================================================================

LakeHyliaFairy_WaitForDonation:
#_06C603: LDA.w $0DF0,X
#_06C606: BNE .exit

#_06C608: LDA.b #$94 ; MESSAGE 0094
#_06C60A: LDY.b #$00
#_06C60C: JSL Sprite_ShowMessageUnconditional

#_06C610: LDA.b #$0D
#_06C612: STA.w $0D80,X

.exit
#_06C615: RTS

;===================================================================================================

LakeHyliaFairy_SpawnFairy:
#_06C616: LDA.w $0DF0,X
#_06C619: BNE .exit

#_06C61B: LDA.b #$72 ; SPRITE 72
#_06C61D: JSL Sprite_SpawnDynamically

#_06C621: LDA.b #$1B ; SONG 1B
#_06C623: STA.w $012C

#_06C626: STZ.w $0133

#_06C629: LDA.b $00
#_06C62B: SEC
#_06C62C: SBC.w FairyPondFairy_offset_x
#_06C62F: STA.w $0D10,Y

#_06C632: LDA.b $01
#_06C634: SBC.b #$00
#_06C636: STA.w $0D30,Y

#_06C639: LDA.b $02
#_06C63B: SEC
#_06C63C: SBC.w FairyPondFairy_offset_y
#_06C63F: STA.w $0D00,Y

#_06C642: LDA.b $03
#_06C644: SBC.b #$00
#_06C646: STA.w $0D20,Y

#_06C649: LDA.b #$01
#_06C64B: STA.w $0DA0,Y

#_06C64E: INC.w $0D80,X

#_06C651: LDA.b #$FF
#_06C653: STA.w $0DF0,X

#_06C656: PHX

#_06C657: JSL Palette_AssertTranslucencySwap
#_06C65B: JSL PaletteFilter_WishPonds

#_06C65F: PLX

#_06C660: TYA
#_06C661: STA.w $0E90,X

.exit
#_06C664: RTS

;===================================================================================================

LakeHyliaFairy_Greetings:
#_06C665: LDA.b $1A
#_06C667: AND.b #$07
#_06C669: BNE .exit

#_06C66B: PHX

#_06C66C: JSL PaletteFilter_SP5F

#_06C670: PLX

#_06C671: LDA.l $7EC007
#_06C675: BNE .exit

#_06C677: INC.w $0D80,X

#_06C67A: LDA.b #$95 ; MESSAGE 0095
#_06C67C: LDY.b #$00
#_06C67E: JSL Sprite_ShowMessageUnconditional

#_06C682: PHX

#_06C683: JSL Palette_RevertTranslucencySwap

#_06C687: STZ.b $1D

#_06C689: LDA.b #$20
#_06C68B: STA.b $9A

#_06C68D: INC.b $15

#_06C68F: PLX

.exit
#_06C690: RTS

;===================================================================================================

LakeHyliaFairy_OfferUpgrade:
#_06C691: LDA.w $1CE8
#_06C694: BNE .chose_arrows

#_06C696: INC.w $0D80,X

#_06C699: RTS

.chose_arrows
#_06C69A: LDA.b #$0C
#_06C69C: STA.w $0D80,X

#_06C69F: RTS

;===================================================================================================

LakeHyliaFairy_UpgradeBombs:
#_06C6A0: INC.w $0D80,X

#_06C6A3: LDA.l $7EF370
#_06C6A7: CMP.b #$07
#_06C6A9: BEQ .at_max

#_06C6AB: INC A
#_06C6AC: STA.l $7EF370

#_06C6B0: PHX

#_06C6B1: TAX

#_06C6B2: LDA.l CapacityUpgrades_bombs_bcd,X
#_06C6B6: STA.w $1CF2

#_06C6B9: STA.l $7EF375

#_06C6BD: PLX

#_06C6BE: LDA.b #$96 ; MESSAGE 0096
#_06C6C0: LDY.b #$00
#_06C6C2: JSL Sprite_ShowMessageUnconditional

#_06C6C6: RTS

;---------------------------------------------------------------------------------------------------

.at_max
#_06C6C7: LDA.b #$98 ; MESSAGE 0098
#_06C6C9: LDY.b #$00
#_06C6CB: JSL Sprite_ShowMessageUnconditional

#_06C6CF: JMP.w LakeHyliaFairy_RefundRupees

;===================================================================================================

LakeHyliaFairy_RevertTranslucency:
#_06C6D2: INC.w $0D80,X

#_06C6D5: PHX

#_06C6D6: JSL Palette_AssertTranslucencySwap

#_06C6DA: LDA.b #$02
#_06C6DC: STA.b $1D

#_06C6DE: LDA.b #$30
#_06C6E0: STA.b $9A

#_06C6E2: INC.w $0015

#_06C6E5: PLX

#_06C6E6: RTS

;===================================================================================================

LakeHyliaFairy_DeleteFairy:
#_06C6E7: LDA.b $1A
#_06C6E9: AND.b #$07
#_06C6EB: BNE .exit

#_06C6ED: PHX

#_06C6EE: JSL PaletteFilter_SP5F

#_06C6F2: PLX

#_06C6F3: LDA.l $7EC007
#_06C6F7: CMP.b #$1E
#_06C6F9: BNE .delay

#_06C6FB: LDA.w $0E90,X
#_06C6FE: TAY

#_06C6FF: LDA.b #$00
#_06C701: STA.w $0DD0,Y

#_06C704: BRA .exit

.delay
#_06C706: CMP.b #$00
#_06C708: BNE .exit

#_06C70A: INC.w $0D80,X

.exit
#_06C70D: RTS

;===================================================================================================

LakeHyliaFairy_RestoreAndReset:
#_06C70E: PHX

#_06C70F: JSL PaletteFilter_RestoreSP5F
#_06C713: JSL Palette_RevertTranslucencySwap

#_06C717: PLX

#_06C718: STZ.w $0D80,X

#_06C71B: LDA.b #$FF
#_06C71D: STA.w $0DF0,X

#_06C720: RTS

;===================================================================================================

LakeHyliaFairy_UpgradeArrows:
#_06C721: LDA.b #$09
#_06C723: STA.w $0D80,X

#_06C726: LDA.l $7EF371
#_06C72A: CMP.b #$07
#_06C72C: BEQ .at_max

#_06C72E: INC A
#_06C72F: STA.l $7EF371

#_06C733: PHX

#_06C734: TAX

#_06C735: LDA.l CapacityUpgrades_arrows_bcd,X
#_06C739: STA.w $1CF2
#_06C73C: STA.l $7EF376

#_06C740: PLX

#_06C741: LDA.b #$97 ; MESSAGE 0097
#_06C743: LDY.b #$00
#_06C745: JSL Sprite_ShowMessageUnconditional

#_06C749: RTS

;---------------------------------------------------------------------------------------------------

.at_max
#_06C74A: LDA.b #$98 ; MESSAGE 0098
#_06C74C: LDY.b #$00
#_06C74E: JSL Sprite_ShowMessageUnconditional

;===================================================================================================

LakeHyliaFairy_RefundRupees:
#_06C752: REP #$20

#_06C754: LDA.l $7EF360
#_06C758: CLC
#_06C759: ADC.w #$64
#_06C75C: STA.l $7EF360

#_06C760: SEP #$30

#_06C762: RTS

;===================================================================================================

LakeHyliaFairy_GiveDonationStatus:
#_06C763: LDA.b #$54 ; MESSAGE 0154
#_06C765: LDY.b #$01
#_06C767: JSL Sprite_ShowMessageUnconditional

#_06C76B: INC.w $0D80,X

#_06C76E: RTS

;===================================================================================================

pool LakeHyliaFairy_GrantLuck

.message_low
#_06C76F: db $50 ; MESSAGE 0150
#_06C770: db $51 ; MESSAGE 0151
#_06C771: db $52 ; MESSAGE 0152
#_06C772: db $53 ; MESSAGE 0153

.message_high
#_06C773: db $01
#_06C774: db $01
#_06C775: db $01
#_06C776: db $01

.luck_level
#_06C777: db $01
#_06C778: db $00
#_06C779: db $00
#_06C77A: db $02

pool off

;---------------------------------------------------------------------------------------------------

LakeHyliaFairy_GrantLuck:
#_06C77B: JSL GetRandomNumber
#_06C77F: AND.b #$03
#_06C781: TAY

#_06C782: LDA.w .luck_level,Y
#_06C785: STA.w $0CF9

#_06C788: STZ.w $0CFA

#_06C78B: LDA.w .message_low,Y
#_06C78E: XBA

#_06C78F: LDA.w .message_high,Y
#_06C792: TAY

#_06C793: XBA
#_06C794: JSL Sprite_ShowMessageUnconditional

#_06C798: STZ.w $0D80,X

#_06C79B: LDA.b #$FF
#_06C79D: STA.w $0DF0,X

#_06C7A0: RTS

;===================================================================================================

UpgradeFairy_WaitForLink:
#_06C7A1: STZ.w $02E4

#_06C7A4: LDA.w $0DF0,X
#_06C7A7: BNE .exit

#_06C7A9: JSL CheckIfLinkIsBusy
#_06C7AD: BCS .exit

#_06C7AF: LDA.b #$4A ; MESSAGE 014A
#_06C7B1: LDY.b #$01
#_06C7B3: JSL Sprite_ShowMessageOnContact
#_06C7B7: BCC .exit

#_06C7B9: INC.w $0D80,X

#_06C7BC: JSL Link_ResetProperties_A

#_06C7C0: STZ.b $2F

#_06C7C2: STZ.w $0EB0,X

.exit
#_06C7C5: RTS

;===================================================================================================

UpgradeFairy_OfferItemToss:
#_06C7C6: LDA.w $1CE8
#_06C7C9: BNE .no_toss

#_06C7CB: LDA.b #$8A ; MESSAGE 008A
#_06C7CD: LDY.b #$00
#_06C7CF: JSL Sprite_ShowMessageUnconditional

#_06C7D3: INC.w $0D80,X

#_06C7D6: LDA.b #$01
#_06C7D8: STA.w $02E4

#_06C7DB: RTS

.no_toss
#_06C7DC: LDA.b #$4B ; MESSAGE 014B
#_06C7DE: LDY.b #$01
#_06C7E0: JSL Sprite_ShowMessageUnconditional

#_06C7E4: STZ.w $0D80,X

#_06C7E7: LDA.b #$FF
#_06C7E9: STA.w $0DF0,X

#_06C7EC: RTS

;===================================================================================================

UpgradeFairy_HandleItemToss:
#_06C7ED: INC.w $0D80,X

#_06C7F0: PHX

#_06C7F1: LDA.w $1CE8
#_06C7F4: STA.w $0DB0,X

#_06C7F7: TAX

#_06C7F8: ASL A
#_06C7F9: TAY

#_06C7FA: LDA.w FairyPond_TossGFXID_pointer+0,Y
#_06C7FD: STA.b $00

#_06C7FF: LDA.w FairyPond_TossGFXID_pointer+1,Y
#_06C802: STA.b $01

#_06C804: LDA.l $7EF340,X
#_06C808: PHA

#_06C809: CPX.b #$20
#_06C80B: BEQ .bottle

#_06C80D: CPX.b #$03
#_06C80F: BNE .not_bombs

.bottle
#_06C811: LDA.b #$01

;---------------------------------------------------------------------------------------------------

.not_bombs
#_06C813: TAY

#_06C814: LDA.b #$00
#_06C816: STA.l $7EF340,X

#_06C81A: LDA.b ($00),Y
#_06C81C: PHA

#_06C81D: TAX

#_06C81E: LDY.b #$04
#_06C820: LDA.b #$28 ; ANCILLA 28
#_06C822: JSL AncillaAdd_TossedPondItem

#_06C826: JSL RefreshIcon_long

#_06C82A: PLA
#_06C82B: PLY
#_06C82C: PLX

#_06C82D: STA.w $0DC0,X

#_06C830: TYA
#_06C831: STA.w $0DE0,X

#_06C834: LDA.b #$FF
#_06C836: STA.w $0DF0,X

#_06C839: RTS

;===================================================================================================

FairyPondFairy_offset_x:
#_06C83A: db $00

FairyPondFairy_offset_y:
#_06C83B: db $50

;===================================================================================================

UpgradeFairy_SpawnFairy:
#_06C83C: LDA.w $0DF0,X
#_06C83F: BNE .exit

#_06C841: LDA.b #$72 ; SPRITE 72
#_06C843: JSL Sprite_SpawnDynamically

#_06C847: LDA.b #$1B ; SONG 1B
#_06C849: STA.w $012C

#_06C84C: STZ.w $0133

#_06C84F: LDA.b $00
#_06C851: SEC
#_06C852: SBC.w FairyPondFairy_offset_x
#_06C855: STA.w $0D10,Y

#_06C858: LDA.b $01
#_06C85A: SBC.b #$00
#_06C85C: STA.w $0D30,Y

#_06C85F: LDA.b $02
#_06C861: SEC
#_06C862: SBC.w FairyPondFairy_offset_y
#_06C865: STA.w $0D00,Y

#_06C868: LDA.b $03
#_06C86A: SBC.b #$00
#_06C86C: STA.w $0D20,Y

#_06C86F: LDA.b #$01
#_06C871: STA.w $0DA0,Y

#_06C874: INC.w $0D80,X

#_06C877: LDA.b #$FF
#_06C879: STA.w $0DF0,X

#_06C87C: PHX

#_06C87D: JSL Palette_AssertTranslucencySwap
#_06C881: JSL PaletteFilter_WishPonds

#_06C885: PLX

#_06C886: TYA
#_06C887: STA.w $0E90,X

.exit
#_06C88A: RTS

;===================================================================================================

UpgradeFairy_AskWhoDidThis:
#_06C88B: LDA.b $1A
#_06C88D: AND.b #$07
#_06C88F: BNE .exit

#_06C891: PHX
#_06C892: JSL PaletteFilter_SP5F
#_06C896: PLX

#_06C897: LDA.l $7EC007
#_06C89B: BNE .exit

#_06C89D: INC.w $0D80,X

#_06C8A0: LDA.b #$8B ; MESSAGE 008B
#_06C8A2: LDY.b #$00
#_06C8A4: JSL Sprite_ShowMessageUnconditional

#_06C8A8: PHX

#_06C8A9: JSL Palette_RevertTranslucencySwap

#_06C8AD: STZ.b $1D

#_06C8AF: LDA.b #$20
#_06C8B1: STA.b $9A

#_06C8B3: INC.b $15

#_06C8B5: PLX

.exit
#_06C8B6: RTS

;===================================================================================================

UpgradeFairy_HandleAnswer:
#_06C8B7: LDA.w $1CE8
#_06C8BA: BNE .liar

#_06C8BC: INC.w $0D80,X

#_06C8BF: RTS

.liar
#_06C8C0: LDA.b #$0B
#_06C8C2: STA.w $0D80,X

#_06C8C5: RTS

;===================================================================================================

UpgradeFairy_HandleUpgrade:
#_06C8C6: INC.w $0D80,X

#_06C8C9: LDA.l $7EF3CA
#_06C8CD: BNE .fat_fairy

;---------------------------------------------------------------------------------------------------

#_06C8CF: LDA.w $0DC0,X
#_06C8D2: CMP.b #$0C
#_06C8D4: BNE .not_blue_boomerang

#_06C8D6: LDA.b #$2A ; red boom gfx
#_06C8D8: STA.w $0DC0,X

#_06C8DB: LDA.b #$01
#_06C8DD: STA.w $0EB0,X

#_06C8E0: BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_blue_boomerang
#_06C8E2: CMP.b #$04
#_06C8E4: BNE .not_fighter_shield

#_06C8E6: LDA.b #$05 ; fire shield gfx
#_06C8E8: STA.w $0DC0,X

#_06C8EB: LDA.b #$02
#_06C8ED: STA.w $0EB0,X

#_06C8F0: BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_fighter_shield
#_06C8F2: CMP.b #$16
#_06C8F4: BNE .not_empty_bottle_a

#_06C8F6: LDA.b #$2C ; green potion gfx
#_06C8F8: STA.w $0DC0,X

#_06C8FB: LDA.b #$03
#_06C8FD: STA.w $0EB0,X

#_06C900: BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_empty_bottle_a
#_06C902: BRA .what_a_lame_item

;---------------------------------------------------------------------------------------------------

.fat_fairy
#_06C904: LDA.w $0DC0,X
#_06C907: CMP.b #$3A
#_06C909: BNE .not_normal_bow

#_06C90B: LDA.b #$3B ; silver bow gfx
#_06C90D: STA.w $0DC0,X

#_06C910: LDA.b #$04
#_06C912: STA.w $0EB0,X

#_06C915: LDA.b #$4F ; MESSAGE 014F
#_06C917: LDY.b #$01
#_06C919: JSL Sprite_ShowMessageUnconditional

#_06C91D: RTS

;---------------------------------------------------------------------------------------------------

.not_normal_bow
#_06C91E: CMP.b #$02
#_06C920: BNE .not_tempered_sword

#_06C922: LDA.b #$03 ; butter sword gfx
#_06C924: STA.w $0DC0,X

#_06C927: LDA.b #$05
#_06C929: STA.w $0EB0,X

#_06C92C: BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_tempered_sword
#_06C92E: CMP.b #$16
#_06C930: BNE .not_empty_bottle_b

#_06C932: LDA.b #$2C ; green potion gfx
#_06C934: STA.w $0DC0,X

#_06C937: LDA.b #$03
#_06C939: STA.w $0EB0,X

#_06C93C: BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_empty_bottle_b
#_06C93E: BRA .what_a_lame_item

;---------------------------------------------------------------------------------------------------

.what_a_nice_item
#_06C940: LDA.b #$8C ; MESSAGE 008C
#_06C942: LDY.b #$00
#_06C944: JSL Sprite_ShowMessageUnconditional

#_06C948: RTS

;---------------------------------------------------------------------------------------------------

.what_a_lame_item
#_06C949: LDA.b #$4D ; MESSAGE 014D
#_06C94B: LDY.b #$01
#_06C94D: JSL Sprite_ShowMessageUnconditional

#_06C951: RTS

;===================================================================================================

UpgradeFairy_Retreat:
#_06C952: LDA.w $0DE0,X
#_06C955: TAY

#_06C956: LDA.w $0DB0,X

#_06C959: PHX

#_06C95A: TAX

#_06C95B: TYA

#_06C95C: CPX.b #$03
#_06C95E: BNE .not_bombs

#_06C960: STA.l $7EF340,X

.not_bombs
#_06C964: PLX

#_06C965: INC.w $0D80,X

#_06C968: PHX

#_06C969: JSL Palette_AssertTranslucencySwap

#_06C96D: LDA.b #$02
#_06C96F: STA.b $1D

#_06C971: LDA.b #$30
#_06C973: STA.b $9A

#_06C975: INC.w $0015

#_06C978: PLX

#_06C979: RTS

;===================================================================================================

UpgradeFairy_FixPalettes:
#_06C97A: LDA.b $1A
#_06C97C: AND.b #$07
#_06C97E: BNE .exit

#_06C980: PHX

#_06C981: JSL PaletteFilter_SP5F

#_06C985: PLX

#_06C986: LDA.l $7EC007
#_06C98A: CMP.b #$1E
#_06C98C: BNE .delay

#_06C98E: LDA.w $0E90,X
#_06C991: TAY

#_06C992: LDA.b #$00
#_06C994: STA.w $0DD0,Y

#_06C997: BRA .exit

.delay
#_06C999: CMP.b #$00
#_06C99B: BNE .exit

#_06C99D: INC.w $0D80,X

.exit
#_06C9A0: RTS

;===================================================================================================

UpgradeFairy_HandleItemReceipt:
#_06C9A1: INC.w $0D80,X

#_06C9A4: PHX

#_06C9A5: JSL PaletteFilter_RestoreSP5F
#_06C9A9: JSL Palette_RevertTranslucencySwap

#_06C9AD: PLX
#_06C9AE: PHX

#_06C9AF: LDA.b #$02
#_06C9B1: STA.w $02E9

#_06C9B4: LDA.w $0DC0,X
#_06C9B7: TAY

#_06C9B8: JSL Link_ReceiveItem

#_06C9BC: PLX

#_06C9BD: RTS

;===================================================================================================

pool UpgradeFairy_FinalGoodBye

.message_low
#_06C9BE: db $8F ; MESSAGE 008F
#_06C9BF: db $90 ; MESSAGE 0090
#_06C9C0: db $92 ; MESSAGE 0092
#_06C9C1: db $91 ; MESSAGE 0091
#_06C9C2: db $93 ; MESSAGE 0093

.message_high
#_06C9C3: db $00
#_06C9C4: db $00
#_06C9C5: db $00
#_06C9C6: db $00
#_06C9C7: db $00

pool off

;---------------------------------------------------------------------------------------------------

UpgradeFairy_FinalGoodBye:
#_06C9C8: LDA.w $0EB0,X
#_06C9CB: BEQ .reset

#_06C9CD: DEC A
#_06C9CE: TAY

#_06C9CF: LDA.w .message_low,Y
#_06C9D2: XBA

#_06C9D3: LDA.w .message_high,Y
#_06C9D6: TAY

#_06C9D7: XBA

#_06C9D8: JSL Sprite_ShowMessageUnconditional

.reset
#_06C9DC: STZ.w $0D80,X

#_06C9DF: LDA.b #$FF
#_06C9E1: STA.w $0DF0,X

#_06C9E4: RTS

;===================================================================================================

UpgradeFairy_YouLiar:
#_06C9E5: INC.w $0D80,X

#_06C9E8: LDA.b #$8D ; MESSAGE 008D
#_06C9EA: LDY.b #$00
#_06C9EC: JSL Sprite_ShowMessageUnconditional

#_06C9F0: RTS

;===================================================================================================

UpgradeFairy_SecondChance:
#_06C9F1: LDA.w $1CE8
#_06C9F4: BNE .still_lying

#_06C9F6: INC.w $0D80,X

#_06C9F9: RTS

.still_lying
#_06C9FA: LDA.b #$06
#_06C9FC: STA.w $0D80,X

#_06C9FF: RTS

;===================================================================================================

UpgradeFairy_DebaseLink:
#_06CA00: LDA.b #$8E ; MESSAGE 008E
#_06CA02: LDY.b #$00
#_06CA04: JSL Sprite_ShowMessageUnconditional

#_06CA08: LDA.b #$07
#_06CA0A: STA.w $0D80,X

#_06CA0D: RTS

;===================================================================================================

pool SpriteDraw_ThinFairy

.offset_x
#_06CA0E: db   0,  16,   0,   8,  16,  24,   0,   8
#_06CA16: db  16,  24,   0,  16,   0,  16,   0,   8
#_06CA1E: db  16,  24,   0,   8,  16,  24,   0,  16

.offset_y
#_06CA26: db   0,   0,  16,  16,  16,  16,  24,  24
#_06CA2E: db  24,  24,  32,  32,   0,   0,  16,  16
#_06CA36: db  16,  16,  24,  24,  24,  24,  32,  32

.char
#_06CA3E: db $C7, $C7, $CF, $CA, $CA, $CF, $DF, $DA
#_06CA46: db $DA, $DF, $CB, $CB, $CD, $CD, $C9, $CA
#_06CA4E: db $CA, $C9, $D9, $DA, $DA, $D9, $CB, $CB

.prop
#_06CA56: db $00, $40, $00, $00, $40, $40, $00, $00
#_06CA5E: db $40, $40, $00, $40, $00, $40, $00, $00
#_06CA66: db $40, $40, $00, $00, $40, $40, $00, $40

.oam_sizes
#_06CA6E: db $02, $02, $00, $00, $00, $00, $00, $00
#_06CA76: db $00, $00, $02, $02, $02, $02, $00, $00
#_06CA7E: db $00, $00, $00, $00, $00, $00, $02, $02

pool off

;===================================================================================================

pool SpriteDraw_FatFairy

.oam_groups
#_06CA86: dw   0,   0 : db $E9, $00, $00, $02
#_06CA8E: dw  16,   0 : db $E9, $40, $00, $02
#_06CA96: dw   0,   0 : db $E9, $00, $00, $02
#_06CA9E: dw  16,   0 : db $E9, $40, $00, $02
#_06CAA6: dw   0,   0 : db $E9, $00, $00, $02
#_06CAAE: dw  16,   0 : db $E9, $40, $00, $02
#_06CAB6: dw   0,  16 : db $EB, $00, $00, $02
#_06CABE: dw  16,  16 : db $EB, $40, $00, $02
#_06CAC6: dw   0,  32 : db $ED, $00, $00, $02
#_06CACE: dw  16,  32 : db $ED, $40, $00, $02

#_06CAD6: dw   0,   0 : db $EF, $00, $00, $00
#_06CADE: dw  24,   0 : db $EF, $40, $00, $00
#_06CAE6: dw   0,   8 : db $FF, $00, $00, $00
#_06CAEE: dw  24,   8 : db $FF, $40, $00, $00
#_06CAF6: dw   0,   0 : db $E9, $00, $00, $02
#_06CAFE: dw  16,   0 : db $E9, $40, $00, $02
#_06CB06: dw   0,  16 : db $EB, $00, $00, $02
#_06CB0E: dw  16,  16 : db $EB, $40, $00, $02
#_06CB16: dw   0,  32 : db $ED, $00, $00, $02
#_06CB1E: dw  16,  32 : db $ED, $40, $00, $02

pool off

;===================================================================================================

SpriteDraw_FairyQueen:
#_06CB26: LDA.l $7EF3CA
#_06CB2A: BNE SpriteDraw_FatFairy

;===================================================================================================

SpriteDraw_ThinFairy:
#_06CB2C: JSR Sprite_PrepOAMCoord

#_06CB2F: LDA.w $0DC0,X
#_06CB32: ASL A
#_06CB33: ASL A
#_06CB34: STA.b $0D

#_06CB36: LDA.w $0DC0,X
#_06CB39: ASL A
#_06CB3A: ASL A
#_06CB3B: ASL A
#_06CB3C: ADC.b $0D
#_06CB3E: STA.b $06

#_06CB40: PHX

;---------------------------------------------------------------------------------------------------

#_06CB41: LDX.b #$0B

.next_object
#_06CB43: PHX

#_06CB44: TXA
#_06CB45: CLC
#_06CB46: ADC.b $06
#_06CB48: TAX

#_06CB49: LDA.b $00
#_06CB4B: CLC
#_06CB4C: ADC.w .offset_x,X
#_06CB4F: STA.b ($90),Y

#_06CB51: LDA.b $02
#_06CB53: CLC
#_06CB54: ADC.w .offset_y,X
#_06CB57: INY
#_06CB58: STA.b ($90),Y

#_06CB5A: LDA.w .char,X
#_06CB5D: INY
#_06CB5E: STA.b ($90),Y

#_06CB60: LDA.w .prop,X
#_06CB63: ORA.b $05
#_06CB65: INY
#_06CB66: STA.b ($90),Y

#_06CB68: PHY

#_06CB69: TYA
#_06CB6A: LSR A
#_06CB6B: LSR A
#_06CB6C: TAY

#_06CB6D: LDA.w .oam_sizes,X
#_06CB70: STA.b ($92),Y

#_06CB72: PLY
#_06CB73: INY

#_06CB74: PLX
#_06CB75: DEX
#_06CB76: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06CB78: PLX

#_06CB79: LDY.b #$FF
#_06CB7B: LDA.b #$0B
#_06CB7D: JSR Sprite_CorrectOAMEntries

#_06CB80: RTS

;===================================================================================================

SpriteDraw_FatFairy:
#_06CB81: LDA.b #$0A
#_06CB83: STA.b $06
#_06CB85: STZ.b $07

#_06CB87: LDA.w $0DC0,X

#_06CB8A: ASL A
#_06CB8B: ASL A

#_06CB8C: ADC.w $0DC0,X

#_06CB8F: ASL A
#_06CB90: ASL A
#_06CB91: ASL A
#_06CB92: ASL A

#_06CB93: ADC.b #.oam_groups>>0
#_06CB95: STA.b $08

#_06CB97: LDA.b #.oam_groups>>8
#_06CB99: ADC.b #$00
#_06CB9B: STA.b $09

#_06CB9D: JSL SpriteDraw_Tabulated_preset_quantity

#_06CBA1: RTS

;===================================================================================================

Sprite_71_Leever:
#_06CBA2: LDA.w $0D80,X
#_06CBA5: BEQ .underground

#_06CBA7: JSR SpriteDraw_Leever
#_06CBAA: BRA .respawn

.underground
#_06CBAC: JSR Sprite_PrepOAMCoord_wrapper

.respawn
#_06CBAF: LDA.w $0F00,X
#_06CBB2: BEQ .dont_respawn

#_06CBB4: LDA.b #$08
#_06CBB6: STA.w $0DD0,X

.dont_respawn
#_06CBB9: JSR Sprite_CheckIfActive_Bank06
#_06CBBC: JSR Sprite_CheckIfRecoiling_Bank06

#_06CBBF: LDA.w $0D80,X

#_06CBC2: REP #$30

#_06CBC4: AND.w #$00FF
#_06CBC7: ASL A
#_06CBC8: TAY

#_06CBC9: LDA.w .vectors,Y
#_06CBCC: PHA

#_06CBCD: SEP #$30

#_06CBCF: RTS

;---------------------------------------------------------------------------------------------------

.vectors
#_06CBD0: dw Leever_Underground-1
#_06CBD2: dw Leever_Emerge-1
#_06CBD4: dw Leever_Attack-1
#_06CBD6: dw Leever_Dig-1

;===================================================================================================

Leever_Underground:
#_06CBD8: LDA.w $0DF0,X
#_06CBDB: STA.w $0BA0,X
#_06CBDE: BNE .delay

#_06CBE0: INC.w $0D80,X

#_06CBE3: LDA.b #$7F
#_06CBE5: STA.w $0DF0,X

#_06CBE8: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_06CBE9: LDA.b #$10
#_06CBEB: JSR Sprite_ApplySpeedTowardsLink
#_06CBEE: JSR Sprite_Move_XY_Bank06
#_06CBF1: JSR Sprite_CheckTileCollision

#_06CBF4: RTS

;===================================================================================================

UNREACHABLE_06CBF5:
#_06CBF5: LDA.w $0DF0,X
#_06CBF8: BNE .exit

#_06CBFA: INC.w $0D80,X

#_06CBFD: LDA.b #$7F
#_06CBFF: STA.w $0DF0,X

.exit
#_06CC02: RTS

;===================================================================================================

pool Leever_Emerge

.anim_step
#_06CC03: db $0A, $09, $08, $07
#_06CC07: db $06, $05, $04, $03
#_06CC0B: db $02, $01, $02, $01
#_06CC0F: db $02, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Leever_Emerge:
#_06CC13: LDA.w $0DF0,X
#_06CC16: STA.w $0BA0,X
#_06CC19: BNE .delay

#_06CC1B: INC.w $0D80,X

#_06CC1E: JSL GetRandomNumber
#_06CC22: AND.b #$3F
#_06CC24: ADC.b #$A0
#_06CC26: STA.w $0DF0,X

#_06CC29: JMP.w Sprite_ZeroVelocity_XY_Bank06

;---------------------------------------------------------------------------------------------------

.delay
#_06CC2C: LSR A
#_06CC2D: LSR A
#_06CC2E: LSR A
#_06CC2F: TAY

#_06CC30: LDA.w .anim_step,Y
#_06CC33: STA.w $0DC0,X

#_06CC36: RTS

;===================================================================================================

pool Leever_Attack

.anim_step
#_06CC37: db $09, $0A, $0B ; bleeds into next

.speed
#_06CC3A: db $0C, $08

pool off

;---------------------------------------------------------------------------------------------------

Leever_Attack:
#_06CC3C: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06CC3F: LDA.w $0DF0,X
#_06CC42: BNE .delay

.tile_collision
#_06CC44: INC.w $0D80,X

#_06CC47: LDA.b #$7F
#_06CC49: STA.w $0DF0,X

#_06CC4C: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_06CC4D: LDA.w $0E80,X
#_06CC50: AND.b #$07
#_06CC52: BNE .delay_turn

#_06CC54: LDY.w $0D90,X

#_06CC57: LDA.w .speed,Y
#_06CC5A: JSR Sprite_ApplySpeedTowardsLink

.delay_turn
#_06CC5D: JSR Sprite_Move_XY_Bank06
#_06CC60: JSR Sprite_CheckTileCollision

#_06CC63: LDA.w $0E70,X
#_06CC66: BNE .tile_collision

#_06CC68: INC.w $0E80,X

#_06CC6B: LDA.w $0E80,X
#_06CC6E: LSR A
#_06CC6F: LSR A
#_06CC70: AND.b #$03
#_06CC72: TAY

#_06CC73: LDA.w .anim_step,Y
#_06CC76: STA.w $0DC0,X

#_06CC79: RTS

;===================================================================================================

pool Leever_Dig

.anim_step
#_06CC7A: db $0A, $09, $08, $07
#_06CC7E: db $06, $05, $04, $03
#_06CC82: db $02, $01, $02, $01
#_06CC86: db $02, $01, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Leever_Dig:
#_06CC8A: LDA.w $0DF0,X
#_06CC8D: STA.w $0BA0,X
#_06CC90: BNE .delay

#_06CC92: STZ.w $0D80,X

#_06CC95: JSL GetRandomNumber
#_06CC99: AND.b #$1F
#_06CC9B: ADC.b #$40
#_06CC9D: STA.w $0DF0,X

#_06CCA0: RTS

.delay
#_06CCA1: LSR A
#_06CCA2: LSR A
#_06CCA3: LSR A
#_06CCA4: EOR.b #$0F
#_06CCA6: TAY

#_06CCA7: LDA.w .anim_step,Y
#_06CCAA: STA.w $0DC0,X

#_06CCAD: RTS

;===================================================================================================

UNREACHABLE_06CCAE:
#_06CCAE: RTS

;===================================================================================================

pool SpriteDraw_Leever

.offset_x
#_06CCAF: dw   2,   6,   6,   6
#_06CCB7: dw   0,   8,   8,   8
#_06CCBF: dw   0,   8,   8,   8
#_06CCC7: dw   0,   8,   0,   8
#_06CCCF: dw   0,   8,   0,   8
#_06CCD7: dw   0,   0,   0,   8
#_06CCDF: dw   0,   0,   0,   8
#_06CCE7: dw   0,   0,   0,   8
#_06CCEF: dw   0,   0,   0,   8
#_06CCF7: dw   0,   0,   0,   0
#_06CCFF: dw   0,   0,   0,   0
#_06CD07: dw   0,   0,   0,   0
#_06CD0F: dw   0,   0,   0,   0
#_06CD17: dw   0,   0,   0,   0

;---------------------------------------------------------------------------------------------------

.offset_y
#_06CD1F: dw   8,   8,   8,   8
#_06CD27: dw   8,   8,   8,   8
#_06CD2F: dw   8,   8,   8,   8
#_06CD37: dw   5,   5,   8,   8
#_06CD3F: dw   5,   5,   8,   8
#_06CD47: dw   2,   2,   8,   8
#_06CD4F: dw   1,   1,   8,   8
#_06CD57: dw   0,   0,   8,   8
#_06CD5F: dw  -1,  -1,   8,   8
#_06CD67: dw   8,  -2,  -2,   0
#_06CD6F: dw   8,  -2,  -2,   0
#_06CD77: dw   8,  -2,  -2,   0
#_06CD7F: dw   8,  -2,  -2,   0
#_06CD87: dw   8,  -2,  -2,   0

;---------------------------------------------------------------------------------------------------

.char
#_06CD8F: db $28, $28, $28, $28
#_06CD93: db $28, $28, $28, $28
#_06CD97: db $38, $38, $38, $38
#_06CD9B: db $08, $09, $28, $28
#_06CD9F: db $08, $09, $D9, $D9
#_06CDA3: db $08, $08, $D8, $D8
#_06CDA7: db $08, $08, $DA, $DA
#_06CDAB: db $06, $06, $D9, $D9
#_06CDAF: db $26, $26, $D8, $D8
#_06CDB3: db $6C, $06, $06, $00
#_06CDB7: db $6C, $26, $26, $00
#_06CDBB: db $6C, $06, $06, $00
#_06CDBF: db $6C, $26, $26, $00
#_06CDC3: db $6C, $08, $08, $00

;---------------------------------------------------------------------------------------------------

.prop
#_06CDC7: db $01, $41, $41, $41
#_06CDCB: db $01, $41, $41, $41
#_06CDCF: db $01, $41, $41, $41
#_06CDD3: db $01, $01, $01, $41
#_06CDD7: db $01, $01, $00, $40
#_06CDDB: db $01, $01, $00, $40
#_06CDDF: db $01, $01, $00, $40
#_06CDE3: db $01, $01, $00, $40
#_06CDE7: db $00, $01, $00, $40
#_06CDEB: db $06, $41, $41, $00
#_06CDEF: db $06, $41, $41, $00
#_06CDF3: db $06, $01, $01, $00
#_06CDF7: db $06, $01, $01, $00
#_06CDFB: db $06, $01, $01, $00

;---------------------------------------------------------------------------------------------------

.size
#_06CDFF: db $00, $00, $00, $00
#_06CE03: db $00, $00, $00, $00
#_06CE07: db $00, $00, $00, $00
#_06CE0B: db $00, $00, $00, $00
#_06CE0F: db $00, $00, $00, $00
#_06CE13: db $02, $02, $00, $00
#_06CE17: db $02, $02, $00, $00
#_06CE1B: db $02, $02, $00, $00
#_06CE1F: db $02, $02, $00, $00
#_06CE23: db $02, $02, $02, $00
#_06CE27: db $02, $02, $02, $00
#_06CE2B: db $02, $02, $02, $00
#_06CE2F: db $02, $02, $02, $00
#_06CE33: db $02, $02, $02, $00

;---------------------------------------------------------------------------------------------------

.object_count
#_06CE37: db $01
#_06CE38: db $01
#_06CE39: db $01
#_06CE3A: db $03
#_06CE3B: db $03
#_06CE3C: db $03
#_06CE3D: db $03
#_06CE3E: db $03
#_06CE3F: db $03
#_06CE40: db $01
#_06CE41: db $01
#_06CE42: db $01
#_06CE43: db $01
#_06CE44: db $01

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Leever:
#_06CE45: JSR Sprite_PrepOAMCoord

#_06CE48: LDA.w $0DC0,X
#_06CE4B: TAY

#_06CE4C: ASL A
#_06CE4D: ASL A
#_06CE4E: STA.b $06

#_06CE50: PHX

#_06CE51: LDX.w .object_count,Y
#_06CE54: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
#_06CE56: PHX

#_06CE57: TXA
#_06CE58: CLC
#_06CE59: ADC.b $06
#_06CE5B: PHA

#_06CE5C: ASL A
#_06CE5D: TAX

#_06CE5E: REP #$20

#_06CE60: LDA.b $00
#_06CE62: CLC
#_06CE63: ADC.w .offset_x,X
#_06CE66: STA.b ($90),Y

#_06CE68: AND.w #$0100
#_06CE6B: STA.b $0E

#_06CE6D: LDA.b $02
#_06CE6F: CLC
#_06CE70: ADC.w .offset_y,X

#_06CE73: INY
#_06CE74: STA.b ($90),Y

#_06CE76: CLC
#_06CE77: ADC.w #$0010
#_06CE7A: CMP.w #$0100

#_06CE7D: SEP #$20
#_06CE7F: BCC .on_screen

#_06CE81: LDA.b #$F0
#_06CE83: STA.b ($90),Y

.on_screen
#_06CE85: PLX

#_06CE86: LDA.b $05
#_06CE88: PHA

#_06CE89: LDA.w .char,X
#_06CE8C: INY
#_06CE8D: STA.b ($90),Y

#_06CE8F: CMP.b #$60
#_06CE91: BCS .change_props

#_06CE93: CMP.b #$28
#_06CE95: BEQ .change_props

#_06CE97: CMP.b #$38
#_06CE99: BNE .dont_change_props

.change_props
#_06CE9B: LDA.b $05
#_06CE9D: AND.b #$F0
#_06CE9F: STA.b $05

.dont_change_props
#_06CEA1: LDA.w .prop,X
#_06CEA4: ORA.b $05
#_06CEA6: INY
#_06CEA7: STA.b ($90),Y

#_06CEA9: PLA
#_06CEAA: STA.b $05

#_06CEAC: PHY

#_06CEAD: TYA
#_06CEAE: LSR A
#_06CEAF: LSR A
#_06CEB0: TAY

#_06CEB1: LDA.w .size,X
#_06CEB4: ORA.b $0F
#_06CEB6: STA.b ($92),Y

#_06CEB8: PLY
#_06CEB9: INY

#_06CEBA: PLX
#_06CEBB: DEX
#_06CEBC: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06CEBE: PLX

#_06CEBF: RTS

;===================================================================================================

Sprite_D8_Heart:
#_06CEC0: JSR SpriteDraw_AbsorbableTransient
#_06CEC3: JSR Sprite_CheckIfActive_Bank06

#_06CEC6: JSR Sprite_CheckAbsorptionByPlayer
#_06CEC9: JSR Sprite_HandleDraggingByAncilla

#_06CECC: JSR Sprite_Move_XY_Bank06
#_06CECF: JSR Sprite_Move_Z_Bank06

#_06CED2: LDA.w $0F70,X
#_06CED5: BPL .airborne

#_06CED7: STZ.w $0F70,X

#_06CEDA: INC.w $0D80,X

#_06CEDD: STZ.w $0DC0,X

.airborne
#_06CEE0: LDA.w $0F50,X
#_06CEE3: AND.b #$BF
#_06CEE5: STA.w $0F50,X

#_06CEE8: LDA.w $0D50,X
#_06CEEB: BMI .moving_left

.moving_right
#_06CEED: LDA.w $0F50,X
#_06CEF0: EOR.b #$40
#_06CEF2: STA.w $0F50,X

.moving_left
#_06CEF5: LDA.w $0D80,X
#_06CEF8: CMP.b #$03
#_06CEFA: BCC .not_maxed

#_06CEFC: LDA.b #$03

.not_maxed
#_06CEFE: JSL JumpTableLocal
#_06CF02: dw HeartRefill_InitializeAscent
#_06CF04: dw HeartRefill_BeginDescending
#_06CF06: dw HeartRefill_GlideGroundward
#_06CF08: dw Sprite_ZeroVelocity_XYZ_Bank06

;===================================================================================================

HeartRefill_InitializeAscent:
#_06CF0A: INC.w $0D80,X

#_06CF0D: LDA.b #$12
#_06CF0F: STA.w $0DF0,X

#_06CF12: LDA.b #$14
#_06CF14: STA.w $0F80,X

#_06CF17: LDA.b #$01
#_06CF19: STA.w $0DC0,X

#_06CF1C: STZ.w $0DE0,X

#_06CF1F: RTS

;===================================================================================================

HeartRefill_BeginDescending:
#_06CF20: LDA.w $0DF0,X
#_06CF23: BNE .decelerate

#_06CF25: INC.w $0D80,X

#_06CF28: LDA.b #$FD
#_06CF2A: STA.w $0F80,X

#_06CF2D: STZ.w $0D50,X

#_06CF30: RTS

.decelerate
#_06CF31: DEC.w $0F80,X

#_06CF34: RTS

;===================================================================================================

pool HeartRefill_GlideGroundward

.speed
#_06CF35: db  10, -10

pool off

;---------------------------------------------------------------------------------------------------

HeartRefill_GlideGroundward:
#_06CF37: LDA.w $0DF0,X
#_06CF3A: BNE .exit

#_06CF3C: LDA.w $0DE0,X
#_06CF3F: AND.b #$01
#_06CF41: TAY

#_06CF42: LDA.w $0D50,X
#_06CF45: CLC
#_06CF46: ADC.w PositiveAndNegativeOne,Y
#_06CF49: STA.w $0D50,X

#_06CF4C: CMP.w .speed,Y
#_06CF4F: BNE .exit

#_06CF51: INC.w $0DE0,X

#_06CF54: LDA.b #$08
#_06CF56: STA.w $0DF0,X

.exit
#_06CF59: RTS

;===================================================================================================

Sprite_ZeroVelocity_XYZ_Bank06:
#_06CF5A: STZ.w $0F80,X

;===================================================================================================

Sprite_ZeroVelocity_XY_Bank06:
#_06CF5D: STZ.w $0D50,X
#_06CF60: STZ.w $0D40,X

#_06CF63: RTS

;===================================================================================================

Sprite_HandleDraggingByAncilla:
#_06CF64: LDA.w $0DA0,X
#_06CF67: BEQ .exit

#_06CF69: TAY
#_06CF6A: DEY

#_06CF6B: LDA.w $0C4A,Y
#_06CF6E: BEQ .handler_gone

#_06CF70: LDA.w $0C04,Y
#_06CF73: STA.w $0D10,X

#_06CF76: LDA.w $0C18,Y
#_06CF79: STA.w $0D30,X

#_06CF7C: LDA.w $0BFA,Y
#_06CF7F: STA.w $0D00,X

#_06CF82: LDA.w $0C0E,Y
#_06CF85: STA.w $0D20,X

#_06CF88: STZ.w $0F70,X

.hard_exit
#_06CF8B: PLA
#_06CF8C: PLA

.exit
#_06CF8D: RTS

;---------------------------------------------------------------------------------------------------

.handler_gone
#_06CF8E: JSL Sprite_HandleAbsorptionByPlayer_long

#_06CF92: BRA .hard_exit

;===================================================================================================

Sprite_E3_Fairy:
#_06CF94: LDA.b #$01
#_06CF96: STA.w $0BA0,X

#_06CF99: LDA.w $0D80,X
#_06CF9C: BNE .continue

#_06CF9E: LDA.b $1B
#_06CFA0: BNE .indoors

#_06CFA2: LDA.b #$30
#_06CFA4: STA.w $0B89,X

.indoors
#_06CFA7: JSR SpriteDraw_AbsorbableTransient

.continue
#_06CFAA: JSR Fairy_CheckIfTouchable

#_06CFAD: JSR Sprite_CheckIfActive_Bank06

#_06CFB0: LDA.w $0D80,X
#_06CFB3: JSL JumpTableLocal
#_06CFB7: dw Fairy_Prancing
#_06CFB9: dw Fairy_HandleCapture

;===================================================================================================

Fairy_Prancing:
#_06CFBB: LDA.w $0F10,X
#_06CFBE: BNE .not_nabbed_directly

#_06CFC0: JSR Sprite_CheckDamageToLink
#_06CFC3: BCC .no_contact

#_06CFC5: JSL Sprite_HandleAbsorptionByPlayer_long
#_06CFC9: BRA .not_nabbed_directly

.no_contact
#_06CFCB: JSR Sprite_CheckDamageFromLink
#_06CFCE: BEQ .not_nabbed_directly

#_06CFD0: INC.w $0D80,X

#_06CFD3: LDA.b #$C9 ; MESSAGE 00C9
#_06CFD5: LDY.b #$00
#_06CFD7: JSL Sprite_ShowMessageUnconditional

#_06CFDB: RTS

.not_nabbed_directly
#_06CFDC: JSR Sprite_HandleDraggingByAncilla
#_06CFDF: JSL Fairy_HandleMovement

#_06CFE3: RTS

;===================================================================================================

Fairy_HandleCapture:
#_06CFE4: LDA.w $1CE8
#_06CFE7: BNE .release

#_06CFE9: JSL FindEmptyBottle
#_06CFED: BMI .no_space

#_06CFEF: PHX

#_06CFF0: TAX

#_06CFF1: LDA.b #$06
#_06CFF3: STA.l $7EF35C,X

#_06CFF7: JSL RefreshIcon_long

#_06CFFB: PLX

#_06CFFC: STZ.w $0DD0,X

#_06CFFF: RTS

;---------------------------------------------------------------------------------------------------

.no_space
#_06D000: LDA.b #$CA ; MESSAGE 00CA
#_06D002: LDY.b #$00
#_06D004: JSL Sprite_ShowMessageUnconditional

.release
#_06D008: LDA.b #$30
#_06D00A: STA.w $0F10,X

#_06D00D: STZ.w $0D80,X

#_06D010: RTS

;===================================================================================================

Fairy_CheckIfTouchable:
#_06D011: LDA.b $11
#_06D013: CMP.b #$02
#_06D015: BNE .touchable

#_06D017: REP #$20

#_06D019: LDA.w $1CF0

#_06D01C: CMP.w #$00C9 ; MESSAGE 00C9
#_06D01F: BEQ .untouchable

#_06D021: CMP.w #$00CA ; MESSAGE 00CA
#_06D024: BNE .touchable

.untouchable
#_06D026: SEP #$30

#_06D028: LDA.b #$28
#_06D02A: STA.w $0F10,X

.touchable
#_06D02D: SEP #$30

#_06D02F: RTS

;===================================================================================================

KeyRoomFlagMasks:
#_06D030: db $40, $20

;===================================================================================================

Sprite_E4_SmallKey:
Sprite_E5_BigKey:
#_06D032: LDY.w $0CBA,X

#_06D035: LDA.w $0403
#_06D038: AND.w KeyRoomFlagMasks,Y
#_06D03B: BEQ .not_obtained

#_06D03D: STZ.w $0DD0,X

#_06D040: RTS

.not_obtained
#_06D041: JSL Sprite_DrawRippleIfInWater
#_06D045: JSR SpriteDraw_Absorbable

#_06D048: BRA Absorbable_Main

;===================================================================================================

Sprite_D9_GreenRupee:
Sprite_DA_BlueRupee:
Sprite_DB_RedRupee:
Sprite_DC_BombRefill1:
Sprite_DD_BombRefill4:
Sprite_DE_BombRefill8:
Sprite_DF_SmallMagicDecanter:
Sprite_E0_LargeMagicDecanter:
Sprite_E1_ArrowRefill5:
Sprite_E2_ArrowRefill10:
Sprite_E6_StolenShield:
#_06D04A: JSL Sprite_DrawRippleIfInWater
#_06D04E: JSR SpriteDraw_AbsorbableTransient

;===================================================================================================

Absorbable_Main:
#_06D051: JSR Sprite_CheckIfActive_Bank06
#_06D054: JSR Sprite_Move_Z_Bank06
#_06D057: JSR Sprite_Move_XY_Bank06

#_06D05A: LDA.w $0EE0,X
#_06D05D: BNE .skip_tile_collision

#_06D05F: JSR Sprite_CheckTileCollision
#_06D062: JSR Sprite_BounceOffWall

.skip_tile_collision
#_06D065: LDA.w $0F80,X
#_06D068: SEC
#_06D069: SBC.b #$02
#_06D06B: STA.w $0F80,X

#_06D06E: LDA.w $0F70,X
#_06D071: BPL .aloft

#_06D073: STZ.w $0F70,X

#_06D076: LDA.w $0D50,X
#_06D079: ASL A
#_06D07A: ROR.w $0D50,X

#_06D07D: LDA.w $0D40,X
#_06D080: ASL A
#_06D081: ROR.w $0D40,X

#_06D084: LDA.w $0F80,X
#_06D087: EOR.b #$FF
#_06D089: INC A

#_06D08A: LSR A
#_06D08B: CMP.b #$09
#_06D08D: BCS .no_bounce

#_06D08F: JSR Sprite_ZeroVelocity_XYZ_Bank06
#_06D092: BRA .aloft

;---------------------------------------------------------------------------------------------------

.no_bounce
#_06D094: STA.w $0F80,X

#_06D097: LDA.l $7FF9C2,X
#_06D09B: CMP.b #$08 ; TILETYPE 08
#_06D09D: BEQ .water_tile

#_06D09F: CMP.b #$09 ; TILETYPE 09
#_06D0A1: BNE .not_water_tile

.water_tile
#_06D0A3: STZ.w $0F80,X

#_06D0A6: JSL Sprite_SpawnSmallSplash
#_06D0AA: BMI .aloft

#_06D0AC: LDA.w $0E60,X
#_06D0AF: AND.b #$20
#_06D0B1: BEQ .aloft

#_06D0B3: LDA.w $0D10,Y
#_06D0B6: SBC.b #$04
#_06D0B8: STA.w $0D10,Y

#_06D0BB: LDA.w $0D30,Y
#_06D0BE: SBC.b #$00
#_06D0C0: STA.w $0D30,Y

#_06D0C3: LDA.w $0D00,Y
#_06D0C6: SBC.b #$04
#_06D0C8: STA.w $0D00,Y

#_06D0CB: LDA.w $0D20,Y
#_06D0CE: SBC.b #$00
#_06D0D0: STA.w $0D20,Y

#_06D0D3: BRA .aloft

;---------------------------------------------------------------------------------------------------

.not_water_tile
#_06D0D5: LDA.w $0E20,X
#_06D0D8: CMP.b #$E4 ; SPRITE E4
#_06D0DA: BCC .aloft

#_06D0DC: LDA.b $1B
#_06D0DE: BEQ .aloft

#_06D0E0: LDA.b #$05 ; SFX2.05
#_06D0E2: JSL SpriteSFX_QueueSFX2WithPan

.aloft
#_06D0E6: JSR Sprite_HandleDraggingByAncilla
#_06D0E9: JSR Sprite_CheckAbsorptionByPlayer

#_06D0EC: RTS

;===================================================================================================

Absorbable_HandleBlink:
#_06D0ED: LDA.w $0B58,X
#_06D0F0: BEQ .exit

#_06D0F2: LDA.b $11
#_06D0F4: ORA.w $0FC1
#_06D0F7: BNE .exit

#_06D0F9: LDA.b $1A
#_06D0FB: LSR A
#_06D0FC: BCS .delay_tick

#_06D0FE: DEC.w $0B58,X

.delay_tick
#_06D101: LDA.w $0B58,X
#_06D104: BNE .dont_disappear

#_06D106: STZ.w $0DD0,X

.dont_disappear
#_06D109: CMP.b #$28
#_06D10B: BCS .exit

#_06D10D: LSR A
#_06D10E: BCS .exit

#_06D110: JSR Sprite_PrepOAMCoord_wrapper

#_06D113: PLA
#_06D114: PLA

.exit
#_06D115: RTS

;===================================================================================================

Sprite_CheckAbsorptionByPlayer:
#_06D116: LDA.w $0F10,X
#_06D119: BNE .exit

#_06D11B: JSR Sprite_CheckDamageToLink_staggered
#_06D11E: BCC .exit

#_06D120: JSL Sprite_HandleAbsorptionByPlayer_long

.exit
#_06D124: RTS

;===================================================================================================

Sprite_HandleAbsorptionByPlayer_long:
#_06D125: PHB
#_06D126: PHK
#_06D127: PLB

#_06D128: JSR Sprite_HandleAbsorptionByPlayer

#_06D12B: PLB

#_06D12C: RTL

;===================================================================================================

Absorbable_SFX3:
#_06D12D: db $0B ; SFX3.0B - heart
#_06D12E: db $0A ; SFX3.0A - green rupee
#_06D12F: db $0A ; SFX3.0A - blue rupee
#_06D130: db $0A ; SFX3.0A - red rupee
#_06D131: db $0B ; SFX3.0B - bomb refill 1
#_06D132: db $0B ; SFX3.0B - bomb refill 4
#_06D133: db $0B ; SFX3.0B - bomb refill 8
#_06D134: db $0B ; SFX3.0B - small magic
#_06D135: db $0B ; SFX3.0B - full magic
#_06D136: db $0B ; SFX3.0B - arrow refill 5
#_06D137: db $0B ; SFX3.0B - arrow refill 10
#_06D138: db $0B ; SFX3.0B - fairy
#_06D139: db $2F ; SFX3.2F - small key
#_06D13A: db $2F ; SFX3.2F - big key
#_06D13B: db $0B ; SFX3.0B - stolen shield

;---------------------------------------------------------------------------------------------------

Sprite_HandleAbsorptionByPlayer:
#_06D13C: STZ.w $0DD0,X

#_06D13F: LDA.w $0E20,X
#_06D142: SEC
#_06D143: SBC.b #$D8
#_06D145: TAY

#_06D146: LDA.w Absorbable_SFX3,Y
#_06D149: JSL SpriteSFX_QueueSFX3WithPan

#_06D14D: TYA
#_06D14E: JSL JumpTableLocal
#_06D152: dw Absorb_Heart
#_06D154: dw Absorb_Rupee
#_06D156: dw Absorb_Rupee
#_06D158: dw Absorb_Rupee
#_06D15A: dw Absorb_Bomb
#_06D15C: dw Absorb_Bomb
#_06D15E: dw Absorb_Bomb
#_06D160: dw Absorb_SmallMagic
#_06D162: dw Absorb_FullMagic
#_06D164: dw Absorb_Arrows_5
#_06D166: dw Absorb_Arrows_10
#_06D168: dw Absorb_Fairy
#_06D16A: dw Absorb_SmallKey
#_06D16C: dw Absorb_BigKey
#_06D16E: dw Absorb_Shield

;===================================================================================================

Absorb_Shield:
#_06D170: LDA.w $0E30,X
#_06D173: STA.l $7EF35A

#_06D177: RTS

;===================================================================================================

Absorb_BigKey:
#_06D178: STZ.w $02E9
#_06D17B: LDY.b #$32 ; ITEMGET 32

#_06D17D: PHX

#_06D17E: JSL Link_ReceiveItem

#_06D182: PLX

#_06D183: BRA Absorb_FlagKey

;===================================================================================================

Absorb_SmallKey:
#_06D185: LDA.l $7EF36F
#_06D189: INC A
#_06D18A: STA.l $7EF36F

;===================================================================================================

Absorb_FlagKey:
#_06D18E: LDA.w $0E30,X
#_06D191: STA.w $0BC0,X

#_06D194: LDY.w $0CBA,X

#_06D197: LDA.w $0403
#_06D19A: ORA.w KeyRoomFlagMasks,Y
#_06D19D: STA.w $0403

#_06D1A0: JSL Sprite_ManuallySetDeathFlagUW

#_06D1A4: RTS

;===================================================================================================

Absorb_Fairy:
#_06D1A5: LDA.b #$31 ; SFX2.31
#_06D1A7: JSL SpriteSFX_QueueSFX2WithPan

#_06D1AB: LDA.b #$38
#_06D1AD: BRA Absorb_AddHealth

;===================================================================================================

Absorb_Heart:
#_06D1AF: LDA.b #$08

;===================================================================================================

Absorb_AddHealth:
#_06D1B1: CLC
#_06D1B2: ADC.l $7EF372
#_06D1B6: STA.l $7EF372

#_06D1BA: RTS

;===================================================================================================

pool Absorb_Rupee

.denomination
#_06D1BB: db  1
#_06D1BC: db  5
#_06D1BD: db  20

pool off

;---------------------------------------------------------------------------------------------------

Absorb_Rupee:
#_06D1BE: LDY.w $0E20,X

#_06D1C1: LDA.b #$00
#_06D1C3: XBA

#_06D1C4: LDA.w .denomination-$D9,Y ; D9 being the sprite ID of a green rupee

#_06D1C7: REP #$20

#_06D1C9: CLC
#_06D1CA: ADC.l $7EF360
#_06D1CE: STA.l $7EF360

#_06D1D2: SEP #$20

#_06D1D4: RTS

;===================================================================================================

pool Absorb_Bomb

.megatonnage
#_06D1D5: db 1
#_06D1D6: db 4
#_06D1D7: db 8

pool off

;---------------------------------------------------------------------------------------------------

Absorb_Bomb:
#_06D1D8: LDY.w $0E20,X

#_06D1DB: LDA.w .megatonnage-$DC,Y ; DC being the sprite ID of a single bomb
#_06D1DE: CLC
#_06D1DF: ADC.l $7EF375
#_06D1E3: STA.l $7EF375

#_06D1E7: RTS

;===================================================================================================

Absorb_SmallMagic:
#_06D1E8: LDA.l $7EF373
#_06D1EC: CLC
#_06D1ED: ADC.b #$10
#_06D1EF: BRA Absorb_AddMagic

;===================================================================================================

Absorb_FullMagic:
#_06D1F1: LDA.b #$80

;===================================================================================================

Absorb_AddMagic:
#_06D1F3: STA.l $7EF373

#_06D1F7: RTS

;===================================================================================================

Absorb_Arrows_5:
#_06D1F8: LDA.w $0EB0,X
#_06D1FB: BNE Absorb_AddArrows

#_06D1FD: LDA.b #5
#_06D1FF: BRA Absorb_AddArrows

;===================================================================================================

Absorb_Arrows_10:
#_06D201: LDA.b #10

;===================================================================================================

Absorb_AddArrows:
#_06D203: CLC
#_06D204: ADC.l $7EF376
#_06D208: STA.l $7EF376

#_06D20C: RTS

;===================================================================================================

pool SpriteDraw_Absorbable

.gfx_shape
#_06D20D: db $00 ; heart
#_06D20E: db $01 ; green rupee
#_06D20F: db $01 ; blue rupee
#_06D210: db $01 ; red rupee
#_06D211: db $02 ; bomb refill 1
#_06D212: db $02 ; bomb refill 4
#_06D213: db $02 ; bomb refill 8
#_06D214: db $00 ; small magic
#_06D215: db $01 ; full magic
#_06D216: db $01 ; arrow refill 5
#_06D217: db $02 ; arrow refill 10
#_06D218: db $02 ; fairy
#_06D219: db $01 ; small key
#_06D21A: db $02 ; big key
#_06D21B: db $02 ; stolen shield

.numeral
#_06D21C: db $00 ; heart
#_06D21D: db $00 ; green rupee
#_06D21E: db $00 ; blue rupee
#_06D21F: db $00 ; red rupee
#_06D220: db $01 ; bomb refill 1
#_06D221: db $02 ; bomb refill 4
#_06D222: db $03 ; bomb refill 8
#_06D223: db $00 ; small magic
#_06D224: db $00 ; full magic
#_06D225: db $04 ; arrow refill 5
#_06D226: db $05 ; arrow refill 10
#_06D227: db $00 ; fairy
#_06D228: db $00 ; small key
#_06D229: db $00 ; big key
#_06D22A: db $00 ; stolen shield

pool off

;===================================================================================================

UNREACHABLE_06D22B:
#_06D22B: db $02, $04, $06, $02

;===================================================================================================

SpriteDraw_AbsorbableTransient:
#_06D22F: JSR Absorbable_HandleBlink

;===================================================================================================

SpriteDraw_Absorbable:
#_06D232: LDA.w $0FB3
#_06D235: BNE .continue

#_06D237: LDA.b $1B
#_06D239: BEQ .continue

#_06D23B: LDA.b #$30
#_06D23D: STA.w $0B89,X

.continue
#_06D240: LDA.w $0FC6
#_06D243: CMP.b #$03
#_06D245: BCS .exit

#_06D247: LDA.w $0E10,X
#_06D24A: BEQ .use_selected_region

#_06D24C: LDA.b #$0C
#_06D24E: JSL SpriteDraw_AllocateOAMFromRegionC

.use_selected_region
#_06D252: LDA.w $0E90,X
#_06D255: BNE .abort

#_06D257: LDY.w $0E20,X

#_06D25A: LDA.w .numeral-$D8,Y
#_06D25D: BEQ .not_special

#_06D25F: JMP.w .draw_special_char

;---------------------------------------------------------------------------------------------------

.not_special
#_06D262: LDA.w .gfx_shape-$D8,Y
#_06D265: BNE .not_8x8

#_06D267: JMP.w SpriteDraw_SingleSmall

;---------------------------------------------------------------------------------------------------

.not_8x8
#_06D26A: CMP.b #$02
#_06D26C: BNE .is_8x16

;---------------------------------------------------------------------------------------------------

#_06D26E: LDA.w $0E20,X
#_06D271: CMP.b #$E6 ; SPRITE E6
#_06D273: BNE .not_shield

#_06D275: LDA.w $0E30,X
#_06D278: CMP.b #$01
#_06D27A: BEQ .is_8x16

#_06D27C: LDA.b #$01
#_06D27E: STA.w $0DC0,X

.not_shield
#_06D281: JMP.w SpriteDraw_SingleLarge

;---------------------------------------------------------------------------------------------------

.is_8x16
#_06D284: JMP.w Sprite_DrawThinAndTall

;---------------------------------------------------------------------------------------------------

.abort
#_06D287: PLA
#_06D288: PLA

.exit
#_06D289: RTS

;---------------------------------------------------------------------------------------------------

.numbered_offset_x
#_06D28A: dw   0,   0,   8,   0
#_06D292: dw   0,   8,   0,   0
#_06D29A: dw   8,   0,   0,   2
#_06D2A2: dw   0,   0,   2,   0
#_06D2AA: dw   0,   0

;===================================================================================================

#Octorok_hflip:
#_06D2AE: db $40, $00, $00, $00

;===================================================================================================

.numbered_offset_y
#_06D2B2: dw   0,   0,   8,   0
#_06D2BA: dw   0,   8,   0,   0
#_06D2C2: dw   8,   0,   8,   8
#_06D2CA: dw   0,   8,   8,   0
#_06D2D2: dw   8,   8

;---------------------------------------------------------------------------------------------------

.number_char
#_06D2D6: db $6E, $6E, $68, $6E, $6E, $78, $6E, $6E
#_06D2DE: db $79, $63, $73, $69, $63, $73, $6A, $63
#_06D2E6: db $73, $73

;---------------------------------------------------------------------------------------------------

.number_prop
#_06D2E8: db $02, $02, $00, $02, $02, $00, $02, $02
#_06D2F0: db $00, $00, $00, $00, $00, $00, $00, $00
#_06D2F8: db $00, $00

;---------------------------------------------------------------------------------------------------

.draw_special_char
#_06D2FA: DEC A
#_06D2FB: STA.b $06

#_06D2FD: JSR Sprite_PrepOAMCoord

#_06D300: LDA.b $06
#_06D302: ASL A
#_06D303: ADC.b $06
#_06D305: STA.b $06

#_06D307: PHX

#_06D308: LDA.w $0EB0,X
#_06D30B: CMP.b #$01

#_06D30D: LDX.b #$02
#_06D30F: BCC .next_object

#_06D311: DEX

;---------------------------------------------------------------------------------------------------

.next_object
#_06D312: PHX

#_06D313: TXA
#_06D314: CLC
#_06D315: ADC.b $06
#_06D317: PHA

#_06D318: ASL A
#_06D319: TAX

#_06D31A: REP #$20

#_06D31C: LDA.b $00
#_06D31E: CLC
#_06D31F: ADC.w .numbered_offset_x,X
#_06D322: STA.b ($90),Y

#_06D324: AND.w #$0100
#_06D327: STA.b $0E

#_06D329: LDA.b $02
#_06D32B: CLC
#_06D32C: ADC.w .numbered_offset_y,X

#_06D32F: INY
#_06D330: STA.b ($90),Y

#_06D332: CLC
#_06D333: ADC.w #$0010
#_06D336: CMP.w #$0100

#_06D339: SEP #$20
#_06D33B: BCC .on_screen

#_06D33D: LDA.b #$F0
#_06D33F: STA.b ($90),Y

.on_screen
#_06D341: PLX

#_06D342: LDA.w .number_char,X
#_06D345: INY
#_06D346: STA.b ($90),Y

#_06D348: INY

#_06D349: LDA.b $05
#_06D34B: STA.b ($90),Y

#_06D34D: PHY

#_06D34E: TYA
#_06D34F: LSR A
#_06D350: LSR A
#_06D351: TAY

#_06D352: LDA.w .number_prop,X
#_06D355: ORA.b $0F
#_06D357: STA.b ($92),Y

#_06D359: PLY
#_06D35A: INY

#_06D35B: PLX
#_06D35C: DEX
#_06D35D: BPL .next_object

#_06D35F: PLX

#_06D360: JMP.w SpriteDraw_Shadow

;===================================================================================================

pool Sprite_08_Octorok

.direction
#_06D363: db   3,   2,   0,   1

.speed_x
#_06D367: db  24, -24,   0,   0

.speed_y
#_06D36B: db   0,   0,  24, -24

.unused
#_06D36F: db $01, $02, $04, $08

.timer
#_06D373: db  60, 128, 160, 128

pool off

;===================================================================================================

Sprite_08_Octorok:
#Sprite_0A_Octorok4way:
#_06D377: LDY.w $0DE0,X
#_06D37A: PHY

#_06D37B: LDA.w $0E00,X
#_06D37E: BEQ .not_spinning

#_06D380: LDA.w .direction,Y
#_06D383: STA.w $0DE0,X

.not_spinning
#_06D386: STZ.b $00

#_06D388: LDA.w $0DC0,X
#_06D38B: CMP.b #$07
#_06D38D: BNE .no_flip

#_06D38F: LDA.b #$40
#_06D391: STA.b $00

.no_flip
#_06D393: LDA.w $0F50,X
#_06D396: AND.b #$BF
#_06D398: ORA.w Octorok_hflip,Y
#_06D39B: ORA.b $00
#_06D39D: STA.w $0F50,X

#_06D3A0: JSR SpriteDraw_Octorok

#_06D3A3: PLA
#_06D3A4: STA.w $0DE0,X

#_06D3A7: JSR Sprite_CheckIfActive_Bank06
#_06D3AA: JSR Sprite_CheckIfRecoiling_Bank06
#_06D3AD: JSR Sprite_Move_XY_Bank06
#_06D3B0: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06D3B3: LDA.w $0D80,X
#_06D3B6: AND.b #$01
#_06D3B8: BNE .octorok_used_barrage

#_06D3BA: LDA.w $0DE0,X
#_06D3BD: AND.b #$02
#_06D3BF: ASL A
#_06D3C0: STA.b $00

#_06D3C2: INC.w $0E80,X

#_06D3C5: LDA.w $0E80,X
#_06D3C8: LSR A
#_06D3C9: LSR A
#_06D3CA: LSR A
#_06D3CB: AND.b #$03
#_06D3CD: ORA.b $00
#_06D3CF: STA.w $0DC0,X

#_06D3D2: LDA.w $0DF0,X
#_06D3D5: BNE .wait

#_06D3D7: INC.w $0D80,X

#_06D3DA: LDY.w $0E20,X

#_06D3DD: LDA.w .timer-8,Y
#_06D3E0: STA.w $0DF0,X

#_06D3E3: RTS

;---------------------------------------------------------------------------------------------------

.wait
#_06D3E4: LDY.w $0DE0,X

#_06D3E7: LDA.w .speed_x,Y
#_06D3EA: STA.w $0D50,X

#_06D3ED: LDA.w .speed_y,Y
#_06D3F0: STA.w $0D40,X

#_06D3F3: JSR Sprite_CheckTileCollision
#_06D3F6: LDA.w $0E70,X
#_06D3F9: BEQ .no_collision

#_06D3FB: LDA.w $0DE0,X
#_06D3FE: EOR.b #$01
#_06D400: STA.w $0DE0,X

#_06D403: BRA .exit

.no_collision
#_06D405: RTS

;---------------------------------------------------------------------------------------------------

.octorok_used_barrage
#_06D406: JSR Sprite_ZeroVelocity_XY_Bank06

#_06D409: LDA.w $0DF0,X
#_06D40C: BNE Octorock_ShootEmUp

#_06D40E: INC.w $0D80,X

#_06D411: LDA.w $0DE0,X
#_06D414: PHA

#_06D415: JSL GetRandomNumber
#_06D419: AND.b #$3F
#_06D41B: ADC.b #$30
#_06D41D: STA.w $0DF0,X

#_06D420: AND.b #$03
#_06D422: STA.w $0DE0,X

#_06D425: PLA
#_06D426: CMP.w $0DE0,X
#_06D429: BEQ .exit

#_06D42B: EOR.w $0DE0,X
#_06D42E: BNE .exit

#_06D430: LDA.b #$08
#_06D432: STA.w $0E00,X

.exit
#_06D435: RTS

;===================================================================================================

Octorock_ShootEmUp:
#_06D436: LDA.w $0E20,X
#_06D439: SEC
#_06D43A: SBC.b #$08

#_06D43C: REP #$30

#_06D43E: AND.w #$00FF
#_06D441: ASL A
#_06D442: TAY

#_06D443: LDA.w .vectors,Y
#_06D446: DEC A
#_06D447: PHA

#_06D448: SEP #$30

#_06D44A: RTS

.vectors
#_06D44B: dw Octorok_ShootSingle ; Sprite 08
#_06D44D: dw $0000
#_06D44F: dw Octorok_Shoot4Ways ; Sprite 0A

;===================================================================================================

pool Octorok_ShootSingle

.mouth_anim_step
#_06D451: db $00, $02, $02, $02
#_06D455: db $01, $01, $01, $00
#_06D459: db $00, $00, $00, $00
#_06D45D: db $02, $02, $02, $02
#_06D461: db $02, $01, $01, $00

pool off

;===================================================================================================

pool Octorok_Shoot4Ways

.mouth_anim_step
#_06D465: db $02, $02, $02, $02
#_06D469: db $02, $02, $02, $02
#_06D46D: db $01, $00

pool off

;===================================================================================================

Octorok_ShootSingle:
#_06D46F: LDA.w $0DF0,X
#_06D472: CMP.b #$1C
#_06D474: BNE .bide_time

#_06D476: PHA

#_06D477: JSR Octorok_FireLoogie

#_06D47A: PLA

.bide_time
#_06D47B: LSR A
#_06D47C: LSR A
#_06D47D: LSR A
#_06D47E: TAY

#_06D47F: LDA.w .mouth_anim_step,Y
#_06D482: STA.w $0DB0,X

#_06D485: RTS

;===================================================================================================

pool Octorok_Shoot4Ways

.next_direction
#_06D486: db $02, $03, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

Octorok_Shoot4Ways:
#_06D48A: LDA.w $0DF0,X
#_06D48D: PHA

#_06D48E: CMP.b #$80
#_06D490: BCS .animate

#_06D492: AND.b #$0F
#_06D494: BNE .delay_turn

#_06D496: PHA

#_06D497: LDY.w $0DE0,X

#_06D49A: LDA.w .next_direction,Y
#_06D49D: STA.w $0DE0,X

#_06D4A0: PLA

.delay_turn
#_06D4A1: CMP.b #$08
#_06D4A3: BNE .animate

#_06D4A5: JSR Octorok_FireLoogie

.animate
#_06D4A8: PLA
#_06D4A9: LSR A
#_06D4AA: LSR A
#_06D4AB: LSR A
#_06D4AC: LSR A
#_06D4AD: TAY

#_06D4AE: LDA.w .mouth_anim_step,Y
#_06D4B1: STA.w $0DB0,X

#_06D4B4: RTS

;===================================================================================================

pool Octorok_FireLoogie

.offset_x_low
#_06D4B5: db  12, -12,   0,   0

.offset_x_high
#_06D4B9: db   0,  -1,   0,   0

.offset_y_low
#_06D4BD: db   4,   4,  12, -12

.offset_y_high
#_06D4C1: db   0,   0,   0,  -1

.rock_speed_x
#_06D4C5: db  44, -44,   0,   0

.rock_speed_y
#_06D4C9: db   0,   0,  44, -44

pool off

;---------------------------------------------------------------------------------------------------

Octorok_FireLoogie:
#_06D4CD: LDA.b #$07 ; SFX2.07
#_06D4CF: JSL SpriteSFX_QueueSFX2WithPan

#_06D4D3: LDA.b #$0C ; SPRITE 0C
#_06D4D5: JSL Sprite_SpawnDynamically
#_06D4D9: BMI .fired_a_blank

#_06D4DB: PHX

#_06D4DC: LDA.w $0DE0,X
#_06D4DF: TAX

#_06D4E0: LDA.b $00
#_06D4E2: CLC
#_06D4E3: ADC.w .offset_x_low,X
#_06D4E6: STA.w $0D10,Y

#_06D4E9: LDA.b $01
#_06D4EB: ADC.w .offset_x_high,X
#_06D4EE: STA.w $0D30,Y

#_06D4F1: LDA.b $02
#_06D4F3: CLC
#_06D4F4: ADC.w .offset_y_low,X
#_06D4F7: STA.w $0D00,Y

#_06D4FA: LDA.b $03
#_06D4FC: ADC.w .offset_y_high,X
#_06D4FF: STA.w $0D20,Y

#_06D502: LDA.w $0DE0,Y
#_06D505: TAX

#_06D506: LDA.w .rock_speed_x,X
#_06D509: STA.w $0D50,Y

#_06D50C: LDA.w .rock_speed_y,X
#_06D50F: STA.w $0D40,Y

#_06D512: PLX

.fired_a_blank
#_06D513: RTS

;===================================================================================================

pool SpriteDraw_Octorok

.mouth_offset_x
#_06D514: dw   8,   0,   4,   8,   0,   4,   9,  -1,   4

.mouth_offset_y
#_06D526: dw   6,   6,   9,   6,   6,   9,   6,   6,   9

.mouth_char
#_06D538: db $BB, $BB, $BA, $AB, $AB, $AA, $A9, $A9, $B9

.mouth_props
#_06D541: db $65, $25, $25, $65, $25, $25, $65, $25, $25

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Octorok:
#_06D54A: JSR Sprite_PrepOAMCoord

#_06D54D: LDA.w $0DE0,X
#_06D550: CMP.b #$03
#_06D552: BEQ .no_mouth

;---------------------------------------------------------------------------------------------------

#_06D554: LDA.w $0DB0,X
#_06D557: ASL A
#_06D558: ADC.w $0DB0,X
#_06D55B: ADC.w $0DE0,X
#_06D55E: STA.b $07

#_06D560: PHX
#_06D561: PHA

#_06D562: ASL A
#_06D563: TAX

#_06D564: REP #$20

#_06D566: LDA.b $00
#_06D568: CLC
#_06D569: ADC.w .mouth_offset_x,X
#_06D56C: STA.b ($90),Y

#_06D56E: AND.w #$0100
#_06D571: STA.b $0E

#_06D573: LDA.b $02
#_06D575: CLC
#_06D576: ADC.w .mouth_offset_y,X

#_06D579: INY
#_06D57A: STA.b ($90),Y

#_06D57C: CLC
#_06D57D: ADC.w #$0010
#_06D580: CMP.w #$0100

#_06D583: SEP #$20
#_06D585: BCC .on_screen

#_06D587: LDA.b #$F0
#_06D589: STA.b ($90),Y

.on_screen
#_06D58B: PLX

#_06D58C: LDA.w .mouth_char,X
#_06D58F: INY
#_06D590: STA.b ($90),Y

#_06D592: LDA.w .mouth_props,X
#_06D595: INY
#_06D596: ORA.b $05
#_06D598: STA.b ($90),Y

#_06D59A: LDA.b $0F
#_06D59C: STA.b ($92)

#_06D59E: PLX

;---------------------------------------------------------------------------------------------------

.no_mouth
#_06D59F: REP #$20

#_06D5A1: LDA.b $90
#_06D5A3: CLC
#_06D5A4: ADC.w #$0004
#_06D5A7: STA.b $90

#_06D5A9: INC.b $92

#_06D5AB: SEP #$20

#_06D5AD: DEC.w $0E40,X

#_06D5B0: LDY.b #$00
#_06D5B2: JSR SpriteDraw_SingleLarge_skipcoords

#_06D5B5: INC.w $0E40,X

#_06D5B8: RTS

;===================================================================================================

Sprite_0C_OctorokStone:
#_06D5B9: LDA.w $0DD0,X
#_06D5BC: CMP.b #$06
#_06D5BE: BNE OctorokStone_Active

;===================================================================================================

OctorokStone_Crumbling:
#_06D5C0: JSR SpriteDraw_OctorokStoneCrumbling
#_06D5C3: JSR Sprite_CheckIfActivePermissive_Bank06

#_06D5C6: LDA.w $0DF0,X
#_06D5C9: CMP.b #$1E
#_06D5CB: BNE .exit

#_06D5CD: LDA.b #$1F ; SFX2.1F
#_06D5CF: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_06D5D3: RTS

;===================================================================================================

OctorokStone_Active:
#_06D5D4: JSR SpriteDraw_SingleLarge
#_06D5D7: JSR Sprite_CheckIfActive_Bank06
#_06D5DA: JSR Sprite_CheckDamageToLink
#_06D5DD: JSR Sprite_Move_XY_Bank06

#_06D5E0: TXA
#_06D5E1: EOR.b $1A
#_06D5E3: AND.b #$03
#_06D5E5: BNE .exit

#_06D5E7: JSR Sprite_CheckTileCollision

#_06D5EA: LDA.w $0E70,X
#_06D5ED: BEQ .exit

#_06D5EF: JSR Sprite_PrepareToDie

.exit
#_06D5F2: RTS

;===================================================================================================

pool SpriteDraw_OctorokStoneCrumbling

.offset_x
#_06D5F3: dw   0,   8,   0,   8,  -8,  16,  -8,  16
#_06D603: dw -12,  20, -12,  20, -14,  22, -14,  22

.offset_y
#_06D613: dw   0,   0,   8,   8,  -8,  -8,  16,  16
#_06D623: dw -12, -12,  20,  20, -14, -14,  22,  22

.flip
#_06D633: db $00, $40, $80, $C0, $00, $40, $80, $C0
#_06D63B: db $00, $40, $80, $C0, $00, $40, $80, $C0

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_OctorokStoneCrumbling:
#_06D643: JSR Sprite_PrepOAMCoord

#_06D646: PHX

#_06D647: LDA.b #$03
#_06D649: STA.b $06

#_06D64B: LDA.w $0DF0,X
#_06D64E: LSR A
#_06D64F: AND.b #$0C
#_06D651: EOR.b #$0C

#_06D653: CLC
#_06D654: ADC.b $06
#_06D656: TAX

;---------------------------------------------------------------------------------------------------

.next_object
#_06D657: PHX

#_06D658: TXA
#_06D659: ASL A
#_06D65A: TAX

#_06D65B: REP #$20

#_06D65D: LDA.b $00
#_06D65F: CLC
#_06D660: ADC.w .offset_x,X
#_06D663: STA.b ($90),Y

#_06D665: AND.w #$0100
#_06D668: STA.b $0E

#_06D66A: LDA.b $02
#_06D66C: CLC
#_06D66D: ADC.w .offset_y,X

#_06D670: INY
#_06D671: STA.b ($90),Y

#_06D673: CLC
#_06D674: ADC.w #$0010
#_06D677: CMP.w #$0100

#_06D67A: SEP #$20
#_06D67C: BCC .on_screen

#_06D67E: LDA.b #$F0
#_06D680: STA.b ($90),Y

.on_screen
#_06D682: PLX

#_06D683: LDA.b #$BC
#_06D685: INY
#_06D686: STA.b ($90),Y

#_06D688: LDA.w .flip,X
#_06D68B: ORA.b #$2D
#_06D68D: INY
#_06D68E: STA.b ($90),Y

#_06D690: PHY

#_06D691: TYA
#_06D692: LSR A
#_06D693: LSR A
#_06D694: TAY

#_06D695: LDA.b $0F
#_06D697: STA.b ($92),Y

#_06D699: PLY
#_06D69A: INY

#_06D69B: DEX
#_06D69C: DEC.b $06
#_06D69E: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06D6A0: PLX

#_06D6A1: RTS

;===================================================================================================

pool Sprite_0F_Octoballoon

.altitude

#_06D6A2: db  16,  17,  18,  19
#_06D6A6: db  20,  19,  18,  17

pool off

;---------------------------------------------------------------------------------------------------

Sprite_0F_Octoballoon:
#_06D6AA: LDA.w $0E80,X

#_06D6AD: LSR A
#_06D6AE: LSR A
#_06D6AF: LSR A

#_06D6B0: AND.b #$07
#_06D6B2: TAY

#_06D6B3: LDA.w .altitude,Y
#_06D6B6: STA.w $0F70,X

#_06D6B9: JSR Octoballoon_DrawAndBabies
#_06D6BC: JSR Sprite_CheckIfActive_Bank06

#_06D6BF: LDA.w $0DF0,X
#_06D6C2: BNE .dont_explode

#_06D6C4: LDA.b #$03
#_06D6C6: STA.w $0DF0,X

#_06D6C9: LDY.b #$0F

.next_sprite
#_06D6CB: LDA.w $0DD0,Y
#_06D6CE: BEQ .am_dead

#_06D6D0: LDA.w $0E20,Y
#_06D6D3: CMP.b #$10 ; SPRITE 10
#_06D6D5: BEQ .dont_explode

.am_dead
#_06D6D7: DEY
#_06D6D8: BPL .next_sprite

#_06D6DA: LDA.b #$06
#_06D6DC: STA.w $0DD0,X

#_06D6DF: JMP.w Octoballoon_TimeToDie

;---------------------------------------------------------------------------------------------------

.dont_explode
#_06D6E2: JSR Sprite_CheckIfRecoiling_Bank06

#_06D6E5: INC.w $0E80,X

#_06D6E8: TXA
#_06D6E9: EOR.b $1A
#_06D6EB: AND.b #$0F
#_06D6ED: BNE .continue

#_06D6EF: LDA.b #$04
#_06D6F1: JSR Sprite_ProjectSpeedTowardsLink

#_06D6F4: LDA.w $0D40,X
#_06D6F7: CMP.b $00
#_06D6F9: BEQ .at_target_y_speed
#_06D6FB: BPL .slowdown_y

#_06D6FD: INC.w $0D40,X

#_06D700: BRA .at_target_y_speed

.slowdown_y
#_06D702: DEC.w $0D40,X

;---------------------------------------------------------------------------------------------------

.at_target_y_speed
#_06D705: LDA.w $0D50,X
#_06D708: CMP.b $01
#_06D70A: BEQ .continue
#_06D70C: BPL .slowdown_x

#_06D70E: INC.w $0D50,X

#_06D711: BRA .continue

.slowdown_x
#_06D713: DEC.w $0D50,X

;---------------------------------------------------------------------------------------------------

.continue
#_06D716: JSR Sprite_Move_XY_Bank06
#_06D719: JSR Sprite_CheckDamageToLink
#_06D71C: BCC .no_contact

#_06D71E: JSR Octoballoon_RecoilLink

.no_contact
#_06D721: JSR Sprite_CheckDamageFromLink
#_06D724: JSR Sprite_CheckTileCollision
#_06D727: JSR Sprite_BounceOffWall

#_06D72A: RTS

;===================================================================================================

Octoballoon_RecoilLink:
#_06D72B: LDA.b $46
#_06D72D: BNE .exit

#_06D72F: LDA.b #$04
#_06D731: STA.b $46

#_06D733: LDA.b #$10
#_06D735: JSR Sprite_ApplyRecoilToLink

#_06D738: JSR Sprite_InvertSpeed_XY

.exit
#_06D73B: RTS

;===================================================================================================

pool Octoballoon_DrawAndBabies

.offset_x
#_06D73C: dw  -4,   4,  -4,   4
#_06D744: dw  -8,   8,  -8,   8
#_06D74C: dw  -4,   4,  -4,   4

.offset_y
#_06D754: dw  -4,  -4,   4,   4
#_06D75C: dw  -8,  -8,   8,   8
#_06D764: dw  -4,  -4,   4,   4

.char
#_06D76C: db $8C, $8C, $9C, $9C
#_06D770: db $86, $86, $86, $86
#_06D774: db $86, $86, $86, $86

.flip
#_06D778: db $00, $40, $00, $40
#_06D77C: db $00, $40, $80, $C0
#_06D780: db $00, $40, $80, $C0

pool off

;---------------------------------------------------------------------------------------------------

Octoballoon_DrawAndBabies:
#_06D784: STZ.b $0A

#_06D786: LDA.w $0DD0,X
#_06D789: CMP.b #$06
#_06D78B: BNE .not_dying

#_06D78D: LDA.w $0DF0,X
#_06D790: CMP.b #$06
#_06D792: BNE .no_baby

#_06D794: LDA.b $11
#_06D796: BNE .no_baby

#_06D798: JSR Octoballoon_FormBabby

.no_baby
#_06D79B: LDA.w $0DF0,X
#_06D79E: LSR A
#_06D79F: AND.b #$04
#_06D7A1: CLC
#_06D7A2: ADC.b #$04
#_06D7A4: STA.b $0A

.not_dying
#_06D7A6: JSR Sprite_PrepOAMCoord

#_06D7A9: PHX

#_06D7AA: LDA.b #$03
#_06D7AC: STA.b $0B

#_06D7AE: CLC
#_06D7AF: ADC.b $0A

#_06D7B1: TAX

.next_object
#_06D7B2: PHX

#_06D7B3: TXA
#_06D7B4: ASL A
#_06D7B5: TAX

#_06D7B6: REP #$20

#_06D7B8: LDA.b $00
#_06D7BA: CLC
#_06D7BB: ADC.w .offset_x,X
#_06D7BE: STA.b ($90),Y

#_06D7C0: AND.w #$0100
#_06D7C3: STA.b $0E

#_06D7C5: LDA.b $02
#_06D7C7: CLC
#_06D7C8: ADC.w .offset_y,X

#_06D7CB: INY
#_06D7CC: STA.b ($90),Y

#_06D7CE: CLC
#_06D7CF: ADC.w #$0010
#_06D7D2: CMP.w #$0100

#_06D7D5: SEP #$20
#_06D7D7: BCC .on_screen

#_06D7D9: LDA.b #$F0
#_06D7DB: STA.b ($90),Y

.on_screen
#_06D7DD: PLX

#_06D7DE: LDA.w .char,X
#_06D7E1: INY
#_06D7E2: STA.b ($90),Y

#_06D7E4: LDA.w .flip,X
#_06D7E7: ORA.b $05
#_06D7E9: INY
#_06D7EA: STA.b ($90),Y

#_06D7EC: PHY

#_06D7ED: TYA
#_06D7EE: LSR A
#_06D7EF: LSR A
#_06D7F0: TAY

#_06D7F1: LDA.b #$02
#_06D7F3: ORA.b $0F
#_06D7F5: STA.b ($92),Y

#_06D7F7: PLY
#_06D7F8: INY

#_06D7F9: DEX

#_06D7FA: DEC.b $0B
#_06D7FC: BPL .next_object

#_06D7FE: PLX

#_06D7FF: JMP.w SpriteDraw_Shadow

;===================================================================================================

pool Octoballoon_FormBabby

.speed_x
#_06D802: db  16,  11, -11, -16, -11,  11

.speed_y
#_06D808: db   0,  11,  11,   0, -11, -11

pool off

;---------------------------------------------------------------------------------------------------

Octoballoon_FormBabby:
#_06D80E: LDA.b #$0C ; SFX2.0C
#_06D810: JSL SpriteSFX_QueueSFX2WithPan

#_06D814: LDA.b #$05
#_06D816: STA.b $0D

.nth_child
#_06D818: LDA.b #$10 ; SPRITE 10
#_06D81A: JSL Sprite_SpawnDynamically
#_06D81E: BMI .no_space

#_06D820: JSL Sprite_SetSpawnedCoordinates

#_06D824: PHX

#_06D825: LDX.b $0D

#_06D827: LDA.w .speed_x,X
#_06D82A: STA.w $0D50,Y

#_06D82D: LDA.w .speed_y,X
#_06D830: STA.w $0D40,Y

#_06D833: LDA.b #$30
#_06D835: STA.w $0F80,Y

#_06D838: LDA.b #$FF
#_06D83A: STA.w $0E80,Y

#_06D83D: PLX

.no_space
#_06D83E: DEC.b $0D
#_06D840: BPL .nth_child

#_06D842: RTS

;===================================================================================================

UNREACHABLE_06D843:
#_06D843: db $00, $03, $05, $08, $0A, $0C, $0D, $0E
#_06D84B: db $0F, $0E, $0D, $0C, $0A, $08, $05, $03

;===================================================================================================

Sprite_10_OctoballoonBaby:
#_06D853: LDA.w $0E80,X
#_06D856: BNE .alive

#_06D858: STZ.w $0DD0,X

.alive
#_06D85B: CMP.b #$40
#_06D85D: BCS .not_blinking

#_06D85F: AND.b #$01
#_06D861: BNE .dont_draw

.not_blinking
#_06D863: JSR SpriteDraw_SingleSmall

.dont_draw
#_06D866: JSR Sprite_CheckIfActive_Bank06

#_06D869: DEC.w $0E80,X

#_06D86C: JSR Sprite_CheckIfRecoiling_Bank06

#_06D86F: DEC.w $0F80,X

#_06D872: JSR Sprite_Move_Z_Bank06

#_06D875: LDA.w $0F70,X
#_06D878: BPL .airborne

#_06D87A: STZ.w $0F70,X

#_06D87D: LDA.b #$10
#_06D87F: STA.w $0F80,X

.airborne
#_06D882: JSR Sprite_Move_XY_Bank06
#_06D885: JSR Sprite_CheckTileCollision
#_06D888: JSR Sprite_BounceOffWall

;===================================================================================================

Sprite_CheckDamageToAndFromLink_Bank06:
#_06D88B: JSR Sprite_CheckDamageFromLink
#_06D88E: JSR Sprite_CheckDamageToLink

#_06D891: RTS

;===================================================================================================

pool Sprite_0D_Buzzblob

.anim_step
#_06D892: db $00, $01, $00, $02

.palette
#_06D896: db $0A, $02, $08, $02

pool off

;---------------------------------------------------------------------------------------------------

Sprite_0D_Buzzblob:
#_06D89A: LDA.w $0E00,X
#_06D89D: BEQ .not_electrified

#_06D89F: LSR A
#_06D8A0: AND.b #$03
#_06D8A2: TAY

#_06D8A3: LDA.w $0B89,X
#_06D8A6: AND.b #$F1
#_06D8A8: ORA.w .palette,Y
#_06D8AB: STA.w $0B89,X

.not_electrified
#_06D8AE: JSL Sprite_Cukeman
#_06D8B2: JSR SpriteDraw_Buzzblob

#_06D8B5: LDA.w $0E80,X

#_06D8B8: LSR A
#_06D8B9: LSR A
#_06D8BA: LSR A

#_06D8BB: AND.b #$03
#_06D8BD: TAY

#_06D8BE: LDA.w .anim_step,Y

#_06D8C1: LDY.w $0E00,X
#_06D8C4: BEQ .normal_anim_step

#_06D8C6: INC A
#_06D8C7: INC A
#_06D8C8: INC A

.normal_anim_step
#_06D8C9: STA.w $0DC0,X

#_06D8CC: JSR Sprite_CheckIfActive_Bank06
#_06D8CF: JSR Sprite_CheckIfRecoiling_Bank06

#_06D8D2: INC.w $0E80,X

#_06D8D5: LDA.w $0DF0,X
#_06D8D8: BNE .delay

#_06D8DA: JSR Buzzblob_SelectNewDirection

.delay
#_06D8DD: LDA.w $0E00,X
#_06D8E0: BNE .immobile

#_06D8E2: JSR Sprite_Move_XY_Bank06

.immobile
#_06D8E5: JSR Sprite_CheckTileCollision
#_06D8E8: JSR Sprite_BounceOffWall

#_06D8EB: JMP.w Sprite_CheckDamageToAndFromLink_Bank06

;===================================================================================================

pool Buzzblob_SelectNewDirection

.speed_x
#_06D8EE: db  3,  2, -2, -3, -2,  2,  0,  0

.speed_y
#_06D8F6: db  0,  2,  2,  0, -2, -2,  0,  0

.timers
#_06D8FE: db 48, 48, 48, 48, 48, 48, 64, 64

pool off

;---------------------------------------------------------------------------------------------------

Buzzblob_SelectNewDirection:
#_06D906: JSL GetRandomNumber
#_06D90A: AND.b #$07
#_06D90C: TAY

#_06D90D: LDA.w .speed_x,Y
#_06D910: STA.w $0D50,X

#_06D913: LDA.w .speed_y,Y
#_06D916: STA.w $0D40,X

#_06D919: LDA.w .timers,Y
#_06D91C: STA.w $0DF0,X

#_06D91F: RTS

;===================================================================================================

pool SpriteDraw_Buzzblob

.offset_x
#_06D920: dw   0,   8,   0

.offset_y
#_06D926: dw  -8,  -8,   0

.char
#_06D92C: db $F0, $F0, $E1
#_06D92F: db $00, $00, $CE
#_06D932: db $00, $00, $CE
#_06D935: db $E3, $E3, $CA
#_06D938: db $E4, $E5, $CC
#_06D93B: db $E5, $E4, $CC

.flip
#_06D93E: db $00, $40, $00
#_06D941: db $00, $00, $00
#_06D944: db $00, $00, $40
#_06D947: db $00, $40, $00
#_06D94A: db $00, $00, $00
#_06D94D: db $40, $40, $40

.size
#_06D950: db $00, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_Buzzblob:
#_06D953: JSR Sprite_PrepOAMCoord

#_06D956: PHX

#_06D957: LDA.w $0DC0,X
#_06D95A: ASL A
#_06D95B: ADC.w $0DC0,X
#_06D95E: STA.b $06

#_06D960: LDX.b #$02

.next_object
#_06D962: PHX

#_06D963: TXA
#_06D964: ASL A
#_06D965: TAX

#_06D966: REP #$20

#_06D968: LDA.b $00
#_06D96A: CLC
#_06D96B: ADC.w .offset_x,X
#_06D96E: STA.b ($90),Y

#_06D970: AND.w #$0100
#_06D973: STA.b $0E

#_06D975: LDA.b $02
#_06D977: CLC
#_06D978: ADC.w .offset_y,X

#_06D97B: INY
#_06D97C: STA.b ($90),Y

#_06D97E: CLC
#_06D97F: ADC.w #$0010
#_06D982: CMP.w #$0100

#_06D985: SEP #$20
#_06D987: BCC .on_screen

#_06D989: LDA.b #$F0
#_06D98B: STA.b ($90),Y

.on_screen
#_06D98D: PLX
#_06D98E: PHX

#_06D98F: TXA
#_06D990: CLC
#_06D991: ADC.b $06
#_06D993: TAX

#_06D994: INY

#_06D995: LDA.w .char,X
#_06D998: STA.b ($90),Y
#_06D99A: BNE .dont_skip

#_06D99C: DEY

#_06D99D: LDA.b #$F0
#_06D99F: STA.b ($90),Y

#_06D9A1: INY

.dont_skip
#_06D9A2: LDA.w .flip,X
#_06D9A5: ORA.b $05
#_06D9A7: INY
#_06D9A8: STA.b ($90),Y

#_06D9AA: PLX

#_06D9AB: PHY

#_06D9AC: TYA
#_06D9AD: LSR A
#_06D9AE: LSR A
#_06D9AF: TAY

#_06D9B0: LDA.w .size,X
#_06D9B3: ORA.b $0F
#_06D9B5: STA.b ($92),Y

#_06D9B7: PLY
#_06D9B8: INY

#_06D9B9: DEX
#_06D9BA: BPL .next_object

#_06D9BC: PLX

#_06D9BD: JMP.w SpriteDraw_Shadow

;===================================================================================================

Sprite_BounceOffWall:
#_06D9C0: LDA.w $0E70,X
#_06D9C3: AND.b #$03
#_06D9C5: BEQ .no_horizontal_collision

#_06D9C7: JSR Sprite_InvertSpeed_X

.no_horizontal_collision
#_06D9CA: LDA.w $0E70,X
#_06D9CD: AND.b #$0C
#_06D9CF: BEQ .no_vertical_collision

#_06D9D1: JSR Sprite_InvertSpeed_Y

.no_vertical_collision
#_06D9D4: RTS

;===================================================================================================

Sprite_InvertSpeed_XY:
#_06D9D5: JSR Sprite_InvertSpeed_Y

;===================================================================================================

Sprite_InvertSpeed_X:
#_06D9D8: LDA.w $0D50,X
#_06D9DB: EOR.b #$FF
#_06D9DD: INC A
#_06D9DE: STA.w $0D50,X

#_06D9E1: RTS

;===================================================================================================

Sprite_InvertSpeed_Y:
#_06D9E2: LDA.w $0D40,X
#_06D9E5: EOR.b #$FF
#_06D9E7: INC A
#_06D9E8: STA.w $0D40,X

#_06D9EB: RTS

;===================================================================================================

Sprite_CheckIfActive_Bank06:
#_06D9EC: LDA.w $0DD0,X
#_06D9EF: CMP.b #$09
#_06D9F1: BNE .inactive

;---------------------------------------------------------------------------------------------------

#Sprite_CheckIfActivePermissive_Bank06:
#_06D9F3: LDA.w $0FC1
#_06D9F6: BNE .inactive

#_06D9F8: LDA.b $11
#_06D9FA: BNE .inactive

#_06D9FC: LDA.w $0CAA,X
#_06D9FF: BMI .active

#_06DA01: LDA.w $0F00,X
#_06DA04: BEQ .active

.inactive
#_06DA06: PLA
#_06DA07: PLA

.active
#_06DA08: RTS

;===================================================================================================

SpriteDraw_IDtoClass:
; 0x00
#_06DA09: db $A0, $A2, $A0, $A2
#_06DA0D: db $80, $82, $80, $82

; 0x08 - Cucco
#_06DA11: db $EA, $EC

; 0x0A - Octorok stone
#_06DA13: db $84

; 0x0B - Buzz blob
#_06DA14: db $4E, $61

; 0x0D - Octoballoon baby
#_06DA16: db $BD

; 0x0E - Kodongo fire
#_06DA17: db $8C

; 0x0F - Red guard/Elder
#_06DA18: db $20, $22

; 0x11 - Hoarder
#_06DA1A: db $C0, $C2

; 0x13 - Poe
#_06DA1C: db $E6

; 0x14 - Crystal switch
#_06DA1D: db $E4

; 0x15 - Sluggula
#_06DA1E: db $82, $AA, $84, $AC
#_06DA22: db $80, $A0

; 0x1B - Water switch
#_06DA24: db $CA

; 0x1C - Flute kid
#_06DA25: db $AF

; 0x1D - Heart
#_06DA26: db $29, $39

; 0x1F - Rupees
#_06DA28: db $0B

; 0x20 - Bombs
#_06DA29: db $6E

; 0x21 - Small magic
#_06DA2A: db $60

; 0x22 - Full magic
#_06DA2B: db $62

; 0x23 - Arrows
#_06DA2C: db $63

; 0x24 - Mirror portal
#_06DA2D: db $4C

; 0x25 - Fairy
#_06DA2E: db $EA, $EC

; 0x27 - Bonk item
#_06DA30: db $24

; 0x28 - Small key
#_06DA31: db $6B

; 0x29 - Mushroom
#_06DA32: db $24

; 0x2A - Bari
#_06DA33: db $22, $24, $26, $20
#_06DA37: db $30, $21

; 0x30 - Cannonball
#_06DA39: db $2A, $24

; 0x32 - Rat
#_06DA3B: db $86, $88, $8A, $8C
#_06DA3F: db $8E, $A2

; 0x38 - Rope
#_06DA41: db $A4, $A6, $A8

; 0x3B - Mothula beam
#_06DA44: db $AA

; 0x3C - Keese
#_06DA45: db $84, $80, $82

; 0x3F - Bomb
#_06DA48: db $6E

; 0x40 - Popo
#_06DA49: db $40, $42

; 0x42 - Hoarder/Spike block
#_06DA4B: db $E6, $E8

; 0x44 - Cannonball
#_06DA4D: db $80, $82

; 0x46 - Zora
#_06DA4F: db $C8

; 0x47 - Zora/fireball
#_06DA50: db $8D

; 0x48 - Lost woods bird
#_06DA51: db $E3, $E5

; 0x4A - Lost woods squirrel
#_06DA53: db $C5, $E1

; 0x4C - Archery game guy
#_06DA55: db $04, $24

; 0x4E - Wall cannon
#_06DA57: db $0E, $2E, $0C, $0A

; 0x52 - Big fairy
#_06DA5B: db $9C, $C7, $B6, $B7

; 0x56 - Mini helmasaur
#_06DA5F: db $60, $62, $64, $66
#_06DA63: db $68, $6A

; 0x5C - Bee
#_06DA65: db $E4, $F4

; 0x5E - Green stalfos
#_06DA67: db $02, $02, $00, $04

; 0x62 - Aga balls
#_06DA6B: db $C6, $CC, $CE

; 0x65 - Fire snake, sparks
#_06DA6E: db $28

; 0x66 - Hover
#_06DA6F: db $84, $82, $80

; 0x69 - Apple
#_06DA72: db $E5

; 0x6A - Big key
#_06DA73: db $24

; 0x6B - Stalfos head
#_06DA74: db $00, $02, $04

; 0x6E - Kodongo
#_06DA77: db $A0, $AA, $A4, $A6
#_06DA7B: db $AC, $A2, $A8

; 0x75 - Arrghi/Wizzrobe
#_06DA7E: db $A6, $88, $86

; 0x78 - Terror pin
#_06DA81: db $8E, $AE, $8A

; 0x7B - Blob
#_06DA84: db $42, $44, $42, $44
#_06DA88: db $64, $66

; 0x81 - King Helmasaur fireball
#_06DA8A: db $CC, $CC, $CA

; 0x84 - Pirogusu
#_06DA8D: db $87, $97, $8E, $AE
#_06DA91: db $AC, $8C, $8E, $AA
#_06DA95: db $AC

; 0x8D - Laser eye
#_06DA96: db $D2, $F3

; 0x8F - Master sword
#_06DA98: db $84, $A2, $84, $A4
#_06DA9C: db $E7

; 0x94 - Kyameron
#_06DA9D: db $8A, $A8, $8A, $A8
#_06DAA1: db $88, $A0, $A4, $A2
#_06DAA5: db $A6, $A6, $A6, $A6

; 0xA0 - Zoro
#_06DAA9: db $7E, $7F

; 0xA2 - Haunted grove rabbit
#_06DAAB: db $8A, $88, $8C, $A6

; 0xA6 - Haunted grove bird
#_06DAAF: db $86, $8E, $AC, $86

; 0xAA - Hobo
#_06DAB3: db $BB, $AC, $A9, $B9
#_06DAB7: db $AA, $BA, $BC

; 0xB1 - Falling ice
#_06DABA: db $8A, $8E, $8A, $86

; 0xB5 - Zazak fire ball
#_06DABE: db $0A

; 0xB6 - Deadrock
#_06DABF: db $C2, $C4, $E2, $E4
#_06DAC3: db $C6

; 0xBB - Magic bat
#_06DAC4: db $EA, $EC

; 0xBD - Zirro bomb
#_06DAC6: db $FF

; 0xBE - Vitreous small eye
#_06DAC7: db $E6, $C6

; 0xC0 - Lightning
#_06DAC9: db $CC, $EC, $CE, $EE
#_06DACD: db $4C, $6C, $4E, $6E

; 0xC8 - Raven
#_06DAD1: db $C8, $C4, $C6

; 0xCB - Mini moldorm
#_06DAD4: db $88, $8C

; 0xCD - Heart container
#_06DAD6: db $24

; 0xCE - Heart piece
#_06DAD7: db $E0

; 0xCF - King Helmasaur
#_06DAD8: db $AE, $C0, $C8, $C4
#_06DADC: db $C6, $E2, $E0

; 0xD6 - Purple chest
#_06DADF: db $EE

; 0xD7 - Gibo
#_06DAE0: db $AE

; 0xD8 - Pokey
#_06DAE1: db $A0, $80

; 0xDA - Whirlpool
#_06DAE3: db $EE

; 0xDB - Bully/Victim
#_06DAE4: db $C0, $C2, $BF

; 0xDE - Chain chomp
#_06DAE7: db $8C, $AA, $86, $A8
#_06DAEB: db $A6

; 0xE3 - Trinexx
#_06DAEC: db $2C, $28, $06

; 0xE6 - Bomb shop guy
#_06DAEF: db $DF, $CF, $A9

; 0xE9 - Shopkeeper
#_06DAF2: db $46, $46

; 0xEB - Swamola
#_06DAF4: db $EA, $C0, $C2, $E0
#_06DAF8: db $E8, $E2, $E6, $E4

; 0xF3 - Waterfall
#_06DAFC: db $0B

; 0xF4 - Ganon
#_06DAFD: db $8E, $A0

; 0xF6 - Stolen shield
#_06DAFF: db $EC, $EA

; 0xF8 - Talking tree
#_06DB01: db $E9

; 0xF9 - Boulder
#_06DB02: db $48, $58

;===================================================================================================

SpriteDraw_ClassToChar:
#_06DB04: db $C8 ; RAVEN
#_06DB05: db $00 ; VULTURE
#_06DB06: db $6B ; STALFOS HEAD
#_06DB07: db $00 ; NULL
#_06DB08: db $00 ; CORRECT PULL SWITCH
#_06DB09: db $00 ; UNUSED CORRECT PULL SWITCH
#_06DB0A: db $00 ; WRONG PULL SWITCH
#_06DB0B: db $00 ; UNUSED WRONG PULL SWITCH
#_06DB0C: db $00 ; OCTOROK
#_06DB0D: db $CB ; MOLDORM
#_06DB0E: db $00 ; OCTOROK 4WAY
#_06DB0F: db $08 ; CUCCO
#_06DB10: db $0A ; OCTOROK STONE
#_06DB11: db $0B ; BUZZBLOB
#_06DB12: db $00 ; SNAPDRAGON
#_06DB13: db $00 ; OCTOBALLOON
#_06DB14: db $0D ; OCTOBALLOON BABY
#_06DB15: db $00 ; HINOX
#_06DB16: db $00 ; MOBLIN
#_06DB17: db $56 ; MINI HELMASAUR
#_06DB18: db $00 ; THIEVES TOWN GRATE
#_06DB19: db $00 ; ANTIFAIRY
#_06DB1A: db $0F ; SAHASRAHLA / AGINAH
#_06DB1B: db $11 ; HOARDER
#_06DB1C: db $00 ; MINI MOLDORM
#_06DB1D: db $13 ; POE
#_06DB1E: db $00 ; SMITHY
#_06DB1F: db $00 ; ARROW
#_06DB20: db $00 ; STATUE
#_06DB21: db $00 ; FLUTEQUEST
#_06DB22: db $14 ; CRYSTAL SWITCH
#_06DB23: db $00 ; SICK KID
#_06DB24: db $15 ; SLUGGULA
#_06DB25: db $1B ; WATER SWITCH
#_06DB26: db $00 ; ROPA
#_06DB27: db $2A ; RED BARI
#_06DB28: db $2A ; BLUE BARI
#_06DB29: db $F8 ; TALKING TREE
#_06DB2A: db $00 ; HARDHAT BEETLE
#_06DB2B: db $B6 ; DEADROCK
#_06DB2C: db $00 ; DARK WORLD HINT NPC
#_06DB2D: db $00 ; ADULT
#_06DB2E: db $00 ; SWEEPING LADY
#_06DB2F: db $AA ; HOBO
#_06DB30: db $00 ; LUMBERJACKS
#_06DB31: db $00 ; TELEPATHIC TILE
#_06DB32: db $1C ; FLUTE KID
#_06DB33: db $00 ; RACE GAME LADY
#_06DB34: db $00 ; RACE GAME GUY
#_06DB35: db $00 ; FORTUNE TELLER
#_06DB36: db $00 ; ARGUE BROS
#_06DB37: db $00 ; RUPEE PULL
#_06DB38: db $00 ; YOUNG SNITCH
#_06DB39: db $00 ; INNKEEPER
#_06DB3A: db $00 ; WITCH
#_06DB3B: db $F3 ; WATERFALL
#_06DB3C: db $F3 ; EYE STATUE
#_06DB3D: db $00 ; LOCKSMITH
#_06DB3E: db $BB ; MAGIC BAT
#_06DB3F: db $27 ; BONK ITEM
#_06DB40: db $00 ; KID IN KAK
#_06DB41: db $00 ; OLD SNITCH
#_06DB42: db $42 ; HOARDER
#_06DB43: db $00 ; TUTORIAL GUARD
#_06DB44: db $00 ; LIGHTNING GATE
#_06DB45: db $00 ; BLUE GUARD
#_06DB46: db $00 ; GREEN GUARD
#_06DB47: db $00 ; RED SPEAR GUARD
#_06DB48: db $00 ; BLUESAIN BOLT
#_06DB49: db $00 ; USAIN BOLT
#_06DB4A: db $00 ; BLUE ARCHER
#_06DB4B: db $00 ; GREEN BUSH GUARD
#_06DB4C: db $00 ; RED JAVELIN GUARD
#_06DB4D: db $0F ; RED BUSH GUARD
#_06DB4E: db $3F ; BOMB GUARD
#_06DB4F: db $00 ; GREEN KNIFE GUARD
#_06DB50: db $00 ; GELDMAN
#_06DB51: db $00 ; TOPPO
#_06DB52: db $40 ; POPO
#_06DB53: db $40 ; POPO
#_06DB54: db $44 ; CANNONBALL
#_06DB55: db $00 ; ARMOS STATUE
#_06DB56: db $00 ; KING ZORA
#_06DB57: db $00 ; ARMOS KNIGHT
#_06DB58: db $00 ; LANMOLAS
#_06DB59: db $47 ; ZORA / FIREBALL
#_06DB5A: db $46 ; ZORA
#_06DB5B: db $00 ; DESERT STATUE
#_06DB5C: db $00 ; CRAB
#_06DB5D: db $48 ; LOST WOODS BIRD
#_06DB5E: db $4A ; LOST WOODS SQUIRREL
#_06DB5F: db $65 ; SPARK
#_06DB60: db $65 ; SPARK
#_06DB61: db $00 ; ROLLER VERTICAL DOWN FIRST
#_06DB62: db $00 ; ROLLER VERTICAL UP FIRST
#_06DB63: db $00 ; ROLLER HORIZONTAL RIGHT FIRST
#_06DB64: db $00 ; ROLLER HORIZONTAL LEFT FIRST
#_06DB65: db $00 ; BEAMOS
#_06DB66: db $8F ; MASTERSWORD
#_06DB67: db $00 ; DEBIRANDO PIT
#_06DB68: db $00 ; DEBIRANDO
#_06DB69: db $4C ; ARCHERY GUY
#_06DB6A: db $4E ; WALL CANNON VERTICAL LEFT
#_06DB6B: db $4E ; WALL CANNON VERTICAL RIGHT
#_06DB6C: db $4E ; WALL CANNON HORIZONTAL TOP
#_06DB6D: db $4E ; WALL CANNON HORIZONTAL BOTTOM
#_06DB6E: db $00 ; BALL N CHAIN
#_06DB6F: db $30 ; CANNONBALL / CANNON TROOPER
#_06DB70: db $24 ; MIRROR PORTAL
#_06DB71: db $32 ; RAT / CRICKET
#_06DB72: db $38 ; SNAKE
#_06DB73: db $3C ; KEESE
#_06DB74: db $81 ; KING HELMASAUR FIREBALL
#_06DB75: db $00 ; LEEVER
#_06DB76: db $52 ; FAIRY POND TRIGGER
#_06DB77: db $00 ; UNCLE / PRIEST / MANTLE
#_06DB78: db $00 ; RUNNING MAN
#_06DB79: db $00 ; BOTTLE MERCHANT
#_06DB7A: db $00 ; ZELDA
#_06DB7B: db $00 ; ANTIFAIRY
#_06DB7C: db $00 ; SAHASRAHLAS WIFE
#_06DB7D: db $5C ; BEE
#_06DB7E: db $00 ; AGAHNIM
#_06DB7F: db $62 ; AGAHNIMS BALLS
#_06DB80: db $5E ; GREEN STALFOS
#_06DB81: db $00 ; BIG SPIKE
#_06DB82: db $00 ; FIREBAR CLOCKWISE
#_06DB83: db $00 ; FIREBAR COUNTERCLOCKWISE
#_06DB84: db $65 ; FIRESNAKE
#_06DB85: db $66 ; HOVER
#_06DB86: db $00 ; ANTIFAIRY CIRCLE
#_06DB87: db $00 ; GREEN EYEGORE / GREEN MIMIC
#_06DB88: db $00 ; RED EYEGORE / RED MIMIC
#_06DB89: db $00 ; YELLOW STALFOS
#_06DB8A: db $6E ; KODONGO
#_06DB8B: db $0E ; KONDONGO FIRE
#_06DB8C: db $00 ; MOTHULA
#_06DB8D: db $3B ; MOTHULA BEAM
#_06DB8E: db $42 ; SPIKE BLOCK
#_06DB8F: db $00 ; GIBDO
#_06DB90: db $00 ; ARRGHUS
#_06DB91: db $75 ; ARRGHI
#_06DB92: db $78 ; TERRORPIN
#_06DB93: db $7B ; BLOB
#_06DB94: db $00 ; WALLMASTER
#_06DB95: db $00 ; STALFOS KNIGHT
#_06DB96: db $CF ; KING HELMASAUR
#_06DB97: db $00 ; BUMPER
#_06DB98: db $84 ; PIROGUSU
#_06DB99: db $8D ; LASER EYE LEFT
#_06DB9A: db $8D ; LASER EYE RIGHT
#_06DB9B: db $8D ; LASER EYE TOP
#_06DB9C: db $8D ; LASER EYE BOTTOM
#_06DB9D: db $00 ; PENGATOR
#_06DB9E: db $94 ; KYAMERON
#_06DB9F: db $75 ; WIZZROBE
#_06DBA0: db $A0 ; ZORO
#_06DBA1: db $00 ; BABASU
#_06DBA2: db $00 ; HAUNTED GROVE OSTRITCH
#_06DBA3: db $A2 ; HAUNTED GROVE RABBIT
#_06DBA4: db $A6 ; HAUNTED GROVE BIRD
#_06DBA5: db $00 ; FREEZOR
#_06DBA6: db $00 ; KHOLDSTARE
#_06DBA7: db $00 ; KHOLDSTARE SHELL
#_06DBA8: db $B1 ; FALLING ICE
#_06DBA9: db $00 ; BLUE ZAZAK
#_06DBAA: db $B5 ; RED ZAZAK
#_06DBAB: db $00 ; STALFOS
#_06DBAC: db $BD ; GREEN ZIRRO
#_06DBAD: db $00 ; BLUE ZIRRO
#_06DBAE: db $00 ; PIKIT
#_06DBAF: db $00 ; CRYSTAL MAIDEN
#_06DBB0: db $69 ; APPLE
#_06DBB1: db $00 ; OLD MAN
#_06DBB2: db $00 ; PIPE DOWN
#_06DBB3: db $00 ; PIPE UP
#_06DBB4: db $00 ; PIPE RIGHT
#_06DBB5: db $00 ; PIPE LEFT
#_06DBB6: db $5C ; GOOD BEE
#_06DBB7: db $00 ; PEDESTAL PLAQUE
#_06DBB8: db $D6 ; PURPLE CHEST
#_06DBB9: db $E6 ; BOMB SHOP GUY
#_06DBBA: db $00 ; KIKI
#_06DBBB: db $00 ; BLIND MAIDEN
#_06DBBC: db $00 ; DIALOGUE TESTER
#_06DBBD: db $DB ; BULLY / PINK BALL
#_06DBBE: db $DA ; WHIRLPOOL
#_06DBBF: db $E9 ; SHOPKEEPER / CHEST GAME GUY
#_06DBC0: db $00 ; DRUNKARD
#_06DBC1: db $00 ; VITREOUS
#_06DBC2: db $BE ; VITREOUS SMALL EYE
#_06DBC3: db $C0 ; LIGHTNING
#_06DBC4: db $6A ; CATFISH
#_06DBC5: db $00 ; CUTSCENE AGAHNIM
#_06DBC6: db $F9 ; BOULDER
#_06DBC7: db $D7 ; GIBO
#_06DBC8: db $00 ; THIEF
#_06DBC9: db $00 ; MEDUSA
#_06DBCA: db $00 ; 4WAY SHOOTER
#_06DBCB: db $D8 ; POKEY
#_06DBCC: db $00 ; BIG FAIRY
#_06DBCD: db $00 ; TEKTITE / FIREBAT
#_06DBCE: db $DE ; CHAIN CHOMP
#_06DBCF: db $E3 ; TRINEXX ROCK HEAD
#_06DBD0: db $00 ; TRINEXX FIRE HEAD
#_06DBD1: db $00 ; TRINEXX ICE HEAD
#_06DBD2: db $00 ; BLIND
#_06DBD3: db $EB ; SWAMOLA
#_06DBD4: db $00 ; LYNEL
#_06DBD5: db $00 ; BUNNYBEAM / SMOKE
#_06DBD6: db $00 ; FLOPPING FISH
#_06DBD7: db $00 ; STAL
#_06DBD8: db $00 ; LANDMINE
#_06DBD9: db $00 ; DIG GAME GUY
#_06DBDA: db $F4 ; GANON
#_06DBDB: db $F4 ; GANON
#_06DBDC: db $1D ; HEART
#_06DBDD: db $1F ; GREEN RUPEE
#_06DBDE: db $1F ; BLUE RUPEE
#_06DBDF: db $1F ; RED RUPEE
#_06DBE0: db $20 ; BOMB REFILL 1
#_06DBE1: db $20 ; BOMB REFILL 4
#_06DBE2: db $20 ; BOMB REFILL 8
#_06DBE3: db $21 ; SMALL MAGIC DECANTER
#_06DBE4: db $22 ; LARGE MAGIC DECANTER
#_06DBE5: db $23 ; ARROW REFILL 5
#_06DBE6: db $23 ; ARROW REFILL 10
#_06DBE7: db $25 ; FAIRY
#_06DBE8: db $28 ; SMALL KEY
#_06DBE9: db $6A ; BIG KEY
#_06DBEA: db $F6 ; STOLEN SHIELD
#_06DBEB: db $29 ; MUSHROOM
#_06DBEC: db $00 ; FAKE MASTER SWORD
#_06DBED: db $00 ; MAGIC SHOP ASSISTANT
#_06DBEE: db $CD ; HEART CONTAINER
#_06DBEF: db $CE ; HEART PIECE

;===================================================================================================

SpriteDraw_SingleLarge_long:
#_06DBF0: PHB
#_06DBF1: PHK
#_06DBF2: PLB

#_06DBF3: JSR SpriteDraw_SingleLarge

#_06DBF6: PLB

#_06DBF7: RTL

;---------------------------------------------------------------------------------------------------

SpriteDraw_SingleSmall_long:
#_06DBF8: PHB
#_06DBF9: PHK
#_06DBFA: PLB

#_06DBFB: JSR SpriteDraw_SingleSmall

#_06DBFE: PLB

#_06DBFF: RTL

;===================================================================================================

UNREACHABLE_06DC00:
#_06DC00: db $00, $00, $01, $01, $01, $02, $02, $02
#_06DC08: db $02, $03, $03, $03, $03, $03, $03, $03

;===================================================================================================

SpriteDraw_SingleLarge:
#_06DC10: JSR Sprite_PrepOAMCoord

;===================================================================================================

SpriteDraw_SingleLarge_skipcoords:
#_06DC13: LDA.b $00 ; save X coordinate
#_06DC15: STA.b ($90),Y

#_06DC17: LDA.b $01 ; get bit 8 of X for the other table
#_06DC19: CMP.b #$01

#_06DC1B: LDA.b #$01
#_06DC1D: ROL A
#_06DC1E: STA.b ($92)

#_06DC20: REP #$20

#_06DC22: LDA.b $02 ; get Y coordinate
#_06DC24: INY
#_06DC25: CLC
#_06DC26: ADC.w #$0010 ; adjust it to see where it will end up
#_06DC29: CMP.w #$0100

#_06DC2C: SEP #$20
#_06DC2E: BCS .off_screen

#_06DC30: SBC.b #$0F
#_06DC32: STA.b ($90),Y

#_06DC34: PHY

#_06DC35: LDY.w $0E20,X

#_06DC38: LDA.w SpriteDraw_ClassToChar,Y
#_06DC3B: CLC
#_06DC3C: ADC.w $0DC0,X
#_06DC3F: TAY

#_06DC40: LDA.w SpriteDraw_IDtoClass,Y

#_06DC43: PLY
#_06DC44: INY
#_06DC45: STA.b ($90),Y

#_06DC47: LDA.b $05
#_06DC49: INY
#_06DC4A: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

#SpriteDraw_Shadow_Conditional:
.off_screen
#_06DC4C: LDA.w $0E60,X
#_06DC4F: AND.b #$10
#_06DC51: BNE SpriteDraw_Shadow

#_06DC53: RTS

;===================================================================================================

SpriteDraw_Shadow_long:
#_06DC54: PHB
#_06DC55: PHK
#_06DC56: PLB

#_06DC57: JSR SpriteDraw_Shadow

#_06DC5A: PLB

#_06DC5B: RTL

;===================================================================================================

SpriteDraw_Shadow_custom_long:
#_06DC5C: PHB
#_06DC5D: PHK
#_06DC5E: PLB

#_06DC5F: JSR SpriteDraw_Shadow_custom

#_06DC62: PLB

#_06DC63: RTL

;===================================================================================================

SpriteDraw_Shadow:
#_06DC64: LDA.b #$0A

;===================================================================================================

SpriteDraw_Shadow_custom:
#_06DC66: CLC
#_06DC67: ADC.w $0D00,X
#_06DC6A: STA.b $02

#_06DC6C: LDA.w $0D20,X
#_06DC6F: ADC.b #$00
#_06DC71: STA.b $03

#_06DC73: LDA.w $0F00,X
#_06DC76: BNE .no_shadow

#_06DC78: LDA.w $0DD0,X
#_06DC7B: CMP.b #$0A
#_06DC7D: BNE .not_being_carried

#_06DC7F: LDA.l $7FFA1C,X
#_06DC83: CMP.b #$03
#_06DC85: BEQ .no_shadow

.not_being_carried
#_06DC87: REP #$20

#_06DC89: LDA.b $02
#_06DC8B: SEC
#_06DC8C: SBC.b $E8
#_06DC8E: STA.b $02

#_06DC90: CLC
#_06DC91: ADC.w #$0010
#_06DC94: CMP.w #$0100

#_06DC97: SEP #$20
#_06DC99: BCS .offscreen

#_06DC9B: LDA.w $0E40,X
#_06DC9E: AND.b #$1F
#_06DCA0: ASL A
#_06DCA1: ASL A
#_06DCA2: TAY

#_06DCA3: LDA.b $00
#_06DCA5: STA.b ($90),Y

#_06DCA7: LDA.w $0E60,X
#_06DCAA: AND.b #$20
#_06DCAC: BEQ .no_offset

#_06DCAE: INY

#_06DCAF: LDA.b ($90),Y ; useless

#_06DCB1: LDA.b $02
#_06DCB3: INC A
#_06DCB4: STA.b ($90),Y

#_06DCB6: INY

#_06DCB7: LDA.b #$38
#_06DCB9: STA.b ($90),Y

#_06DCBB: LDA.b $05
#_06DCBD: AND.b #$30
#_06DCBF: ORA.b #$08

#_06DCC1: INY
#_06DCC2: STA.b ($90),Y

#_06DCC4: TYA
#_06DCC5: LSR A
#_06DCC6: LSR A
#_06DCC7: TAY

#_06DCC8: LDA.b $01
#_06DCCA: AND.b #$01
#_06DCCC: STA.b ($92),Y

.no_shadow
#_06DCCE: RTS

;---------------------------------------------------------------------------------------------------

.no_offset
#_06DCCF: LDA.b $02
#_06DCD1: INY
#_06DCD2: STA.b ($90),Y

#_06DCD4: LDA.b #$6C
#_06DCD6: INY
#_06DCD7: STA.b ($90),Y

#_06DCD9: LDA.b $05
#_06DCDB: AND.b #$30
#_06DCDD: ORA.b #$08

#_06DCDF: INY
#_06DCE0: STA.b ($90),Y

#_06DCE2: TYA
#_06DCE3: LSR A
#_06DCE4: LSR A
#_06DCE5: TAY

#_06DCE6: LDA.b $01
#_06DCE8: AND.b #$01
#_06DCEA: ORA.b #$02
#_06DCEC: STA.b ($92),Y

.offscreen
#_06DCEE: RTS

;===================================================================================================

SpriteDraw_SingleSmall:
#_06DCEF: JSR Sprite_PrepOAMCoord

#_06DCF2: LDA.b $00
#_06DCF4: STA.b ($90),Y

#_06DCF6: LDA.b $01
#_06DCF8: CMP.b #$01

#_06DCFA: LDA.b #$00
#_06DCFC: ROL A
#_06DCFD: STA.b ($92)

#_06DCFF: REP #$20

#_06DD01: LDA.b $02
#_06DD03: INY
#_06DD04: CLC
#_06DD05: ADC.w #$0010
#_06DD08: CMP.w #$0100

#_06DD0B: SEP #$20
#_06DD0D: BCS SpriteDraw_SingleSmall_DoShadow

#_06DD0F: SBC.b #$0F
#_06DD11: STA.b ($90),Y

#_06DD13: PHY

#_06DD14: LDY.w $0E20,X

#_06DD17: LDA.w SpriteDraw_ClassToChar,Y
#_06DD1A: CLC
#_06DD1B: ADC.w $0DC0,X
#_06DD1E: TAY

#_06DD1F: LDA.w SpriteDraw_IDtoClass,Y

#_06DD22: PLY
#_06DD23: INY

#_06DD24: STA.b ($90),Y

#_06DD26: LDA.b $05
#_06DD28: INY
#_06DD29: STA.b ($90),Y

;===================================================================================================

SpriteDraw_SingleSmall_DoShadow:
#_06DD2B: LDA.w $0E60,X
#_06DD2E: AND.b #$10
#_06DD30: BEQ .no_shadow

#_06DD32: LDA.b #$02
#_06DD34: JMP.w SpriteDraw_Shadow_custom

.no_shadow
#_06DD37: RTS

;===================================================================================================

Sprite_DrawThinAndTall_long:
#_06DD38: PHB
#_06DD39: PHK
#_06DD3A: PLB

#_06DD3B: JSR Sprite_DrawThinAndTall

#_06DD3E: PLB

#_06DD3F: RTL

;---------------------------------------------------------------------------------------------------

Sprite_DrawThinAndTall:
#_06DD40: JSR Sprite_PrepOAMCoord

#_06DD43: LDA.b $00
#_06DD45: STA.b ($90),Y

#_06DD47: LDY.b #$04
#_06DD49: STA.b ($90),Y

#_06DD4B: LDA.b $01
#_06DD4D: CMP.b #$01

#_06DD4F: LDA.b #$00
#_06DD51: ROL A

#_06DD52: LDY.b #$00
#_06DD54: STA.b ($92),Y

#_06DD56: INY
#_06DD57: STA.b ($92),Y

#_06DD59: REP #$20

#_06DD5B: LDA.b $02
#_06DD5D: LDY.b #$01
#_06DD5F: STA.b ($90),Y

#_06DD61: CLC
#_06DD62: ADC.w #$0010
#_06DD65: CMP.w #$0100
#_06DD68: BCC .on_screen

#_06DD6A: LDA.w #$00F0
#_06DD6D: STA.b ($90),Y

.on_screen
#_06DD6F: LDA.b $02
#_06DD71: CLC
#_06DD72: ADC.w #$0008

#_06DD75: LDY.b #$05
#_06DD77: STA.b ($90),Y

#_06DD79: CLC
#_06DD7A: ADC.w #$0010
#_06DD7D: CMP.w #$0100
#_06DD80: BCC .not_off_screen

#_06DD82: LDA.w #$00F0
#_06DD85: STA.b ($90),Y

.not_off_screen
#_06DD87: SEP #$20

#_06DD89: LDY.w $0E20,X

#_06DD8C: LDA.w SpriteDraw_ClassToChar,Y
#_06DD8F: CLC
#_06DD90: ADC.w $0DC0,X
#_06DD93: TAY

#_06DD94: LDA.w SpriteDraw_IDtoClass,Y
#_06DD97: LDY.b #$02
#_06DD99: STA.b ($90),Y

#_06DD9B: CLC
#_06DD9C: ADC.b #$10
#_06DD9E: LDY.b #$06
#_06DDA0: STA.b ($90),Y

#_06DDA2: LDA.b $05
#_06DDA4: LDY.b #$03
#_06DDA6: STA.b ($90),Y

#_06DDA8: LDY.b #$07
#_06DDAA: STA.b ($90),Y

#_06DDAC: JMP.w SpriteDraw_Shadow_Conditional

;===================================================================================================

pool Sprite_02_StalfosHead

.flip
#_06DDAF: db $00, $00, $00, $40

.anim_step
#_06DDB3: db $00, $01, $02, $01

pool off

;---------------------------------------------------------------------------------------------------

Sprite_02_StalfosHead:
#_06DDB7: LDA.b $EE
#_06DDB9: STA.w $0F20,X

#_06DDBC: LDA.w $0E00,X
#_06DDBF: BEQ .keep_region

#_06DDC1: LDA.b #$08
#_06DDC3: JSL SpriteDraw_AllocateOAMFromRegionC

.keep_region
#_06DDC7: LDA.w $0E80,X
#_06DDCA: LSR A
#_06DDCB: LSR A
#_06DDCC: LSR A
#_06DDCD: AND.b #$03
#_06DDCF: TAY

#_06DDD0: LDA.w $0F50,X
#_06DDD3: AND.b #$BF
#_06DDD5: ORA.w .flip,Y
#_06DDD8: STA.w $0F50,X

#_06DDDB: LDA.w .anim_step,Y
#_06DDDE: STA.w $0DC0,X

#_06DDE1: LDA.b #$30
#_06DDE3: STA.w $0B89,X

#_06DDE6: JSR SpriteDraw_SingleLarge
#_06DDE9: JSR Sprite_CheckIfActive_Bank06
#_06DDEC: JSR Sprite_CheckIfRecoiling_Bank06
#_06DDEF: JSR Sprite_CheckDamageToAndFromLink_Bank06

#_06DDF2: LDA.w $0EA0,X
#_06DDF5: BEQ .not_recoiling

#_06DDF7: JSR Sprite_ZeroVelocity_XY_Bank06

.not_recoiling
#_06DDFA: JSR Sprite_Move_XY_Bank06

#_06DDFD: INC.w $0E80,X

#_06DE00: LDA.w $0DF0,X
#_06DE03: BEQ .delay_turn

#_06DE05: AND.b #$01
#_06DE07: BNE .exit

#_06DE09: LDA.b #$10
#_06DE0B: JSR Sprite_ProjectSpeedTowardsLink

;---------------------------------------------------------------------------------------------------

.handle_movement
#_06DE0E: LDA.w $0D40,X
#_06DE11: CMP.b $00
#_06DE13: BEQ .check_x
#_06DE15: BPL .too_far_down

.too_far_up
#_06DE17: INC.w $0D40,X
#_06DE1A: BRA .check_x

.too_far_down
#_06DE1C: DEC.w $0D40,X

.check_x
#_06DE1F: LDA.w $0D50,X
#_06DE22: CMP.b $01
#_06DE24: BEQ .exit
#_06DE26: BPL .too_far_right

.too_far_left
#_06DE28: INC.w $0D50,X
#_06DE2B: BRA .exit

.too_far_right
#_06DE2D: DEC.w $0D50,X

.exit
#_06DE30: RTS

;---------------------------------------------------------------------------------------------------

.delay_turn
#_06DE31: TXA
#_06DE32: EOR.b $1A
#_06DE34: AND.b #$03
#_06DE36: BNE .exit

#_06DE38: LDA.b #$10
#_06DE3A: JSR Sprite_ProjectSpeedTowardsLink

#_06DE3D: LDA.b $00
#_06DE3F: EOR.b #$FF
#_06DE41: INC A
#_06DE42: STA.b $00

#_06DE44: LDA.b $01
#_06DE46: EOR.b #$FF
#_06DE48: INC A
#_06DE49: STA.b $01

#_06DE4B: BRA .handle_movement

;===================================================================================================

pool SpriteModule_Carried

.offset_x_low
#_06DE4D: db   0,   0,   0,   0 ; up
#_06DE51: db   0,   0,   0,   0 ; down
#_06DE55: db -13, -10,  -5,   0 ; left
#_06DE59: db  13,  10,   5,   0 ; right

.offset_x_high
#_06DE5D: db   0,   0,   0,   0 ; up
#_06DE61: db   0,   0,   0,   0 ; down
#_06DE65: db  -1,  -1,  -1,   0 ; left
#_06DE69: db   0,   0,   0,   0 ; right

.offset_z
#_06DE6D: db  13,  14,  15,  16 ; up
#_06DE71: db   0,  10,  22,  16 ; down
#_06DE75: db   8,  11,  14,  16 ; left
#_06DE79: db   8,  11,  14,  16 ; right

.offset_y_low
#_06DE7D: db   3,   2,   1,   3,   2,   1

pool off

;---------------------------------------------------------------------------------------------------

SpriteModule_Carried:
#_06DE83: LDA.w $040A
#_06DE86: STA.w $0C9A,X

#_06DE89: LDA.l $7FFA1C,X
#_06DE8D: CMP.b #$03
#_06DE8F: BEQ .lifted

#_06DE91: LDA.w $0DF0,X
#_06DE94: BNE .wait_for_timer

#_06DE96: LDA.b #$04

#_06DE98: LDY.w $0DB0,X
#_06DE9B: CPY.b #$06
#_06DE9D: BNE .not_large

#_06DE9F: LDA.b #$08

.not_large
#_06DEA1: STA.w $0DF0,X

#_06DEA4: LDA.l $7FFA1C,X
#_06DEA8: INC A
#_06DEA9: STA.l $7FFA1C,X

.wait_for_timer
#_06DEAD: BRA .continue

.lifted
#_06DEAF: LDA.w $0E60,X
#_06DEB2: AND.b #$EF
#_06DEB4: STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

.continue
#_06DEB7: STZ.b $00

#_06DEB9: LDA.w $0F10,X
#_06DEBC: DEC A

#_06DEBD: CMP.b #$3F
#_06DEBF: BCS .no_x_shake

#_06DEC1: AND.b #$02
#_06DEC3: BEQ .no_x_shake

#_06DEC5: INC.b $00

;---------------------------------------------------------------------------------------------------

.no_x_shake
#_06DEC7: LDA.b $2F
#_06DEC9: ASL A
#_06DECA: CLC
#_06DECB: ADC.l $7FFA1C,X
#_06DECF: TAY

#_06DED0: LDA.b $22
#_06DED2: CLC
#_06DED3: ADC.w .offset_x_low,Y
#_06DED6: PHP

#_06DED7: ADC.b $00
#_06DED9: STA.w $0D10,X

#_06DEDC: LDA.b $23
#_06DEDE: ADC.b #$00

#_06DEE0: PLP
#_06DEE1: ADC.w .offset_x_high,Y
#_06DEE4: STA.w $0D30,X

#_06DEE7: LDA.w .offset_z,Y
#_06DEEA: STA.w $0F70,X

;---------------------------------------------------------------------------------------------------

#_06DEED: LDY.b $2E
#_06DEEF: CPY.b #$06
#_06DEF1: BCC .valid_animation_step

#_06DEF3: LDY.b #$00

.valid_animation_step
#_06DEF5: LDA.b $24
#_06DEF7: CLC
#_06DEF8: ADC.b #$01
#_06DEFA: PHP

#_06DEFB: CLC
#_06DEFC: ADC.w .offset_y_low,Y
#_06DEFF: STA.b $00

#_06DF01: LDA.b $25
#_06DF03: ADC.b #$00

#_06DF05: PLP
#_06DF06: ADC.b #$00
#_06DF08: STA.b $0E

#_06DF0A: LDA.b $20
#_06DF0C: SEC
#_06DF0D: SBC.b $00
#_06DF0F: PHP

#_06DF10: CLC
#_06DF11: ADC.b #$08
#_06DF13: STA.w $0D00,X

#_06DF16: LDA.b $21
#_06DF18: ADC.b #$00

#_06DF1A: PLP
#_06DF1B: SBC.b $0E
#_06DF1D: STA.w $0D20,X

#_06DF20: LDA.b $EE
#_06DF22: AND.b #$01
#_06DF24: STA.w $0F20,X

#_06DF27: JSR CarriedSprite_CheckForThrow
#_06DF2A: JSR Sprite_Get16BitCoords

#_06DF2D: LDA.l $7FFA2C,X
#_06DF31: CMP.b #$0B
#_06DF33: BEQ .am_freezed

;---------------------------------------------------------------------------------------------------

#_06DF35: JSR SpriteModule_Active

#_06DF38: LDA.w $0F10,X
#_06DF3B: DEC A
#_06DF3C: BNE EXIT_06DF5D

#_06DF3E: LDA.b #$09
#_06DF40: STA.w $0DD0,X

#_06DF43: STZ.w $0DA0,X

#_06DF46: LDA.b #$60
#_06DF48: STA.w $0F10,X

#_06DF4B: LDA.b #$20
#_06DF4D: STA.w $0F80,X

#_06DF50: LDA.w $0E60,X
#_06DF53: ORA.b #$10
#_06DF55: STA.w $0E60,X

#_06DF58: LDA.b #$02
#_06DF5A: STA.w $0309

;---------------------------------------------------------------------------------------------------

#EXIT_06DF5D:
#_06DF5D: RTS

;---------------------------------------------------------------------------------------------------

.am_freezed
#_06DF5E: JMP.w SpriteModule_Frozen

;===================================================================================================

pool CarriedSprite_CheckForThrow

.throw_speed_x
#_06DF61: db   0,   0, -62,  63

.throw_speed_y
#_06DF65: db -62,  63,   0,   0

.throw_speed_z
#_06DF69: db   4,   4,   4,   4

pool off

;---------------------------------------------------------------------------------------------------

CarriedSprite_CheckForThrow:
#_06DF6D: LDA.w $0010
#_06DF70: CMP.b #$0E
#_06DF72: BEQ EXIT_06DF5D

#_06DF74: LDA.b $5B
#_06DF76: CMP.b #$02
#_06DF78: BEQ .forced_throw

#_06DF7A: LDA.b $4D
#_06DF7C: AND.b #$01

#_06DF7E: LDY.w $037B
#_06DF81: BNE .link_not_hittable

#_06DF83: ORA.w $0046

.link_not_hittable
#_06DF86: ORA.w $0345
#_06DF89: ORA.w $02E0
#_06DF8C: ORA.w $02DA
#_06DF8F: BNE .forced_throw

#_06DF91: LDA.l $7FFA1C,X
#_06DF95: CMP.b #$03
#_06DF97: BNE .no_throw

#_06DF99: LDA.b $F4
#_06DF9B: ORA.b $F6
#_06DF9D: BPL .no_throw

#_06DF9F: ASL.b $F6
#_06DFA1: LSR.b $F6

;---------------------------------------------------------------------------------------------------

.forced_throw
#_06DFA3: LDA.b #$13 ; SFX3.13
#_06DFA5: JSL SpriteSFX_QueueSFX3WithPan

#_06DFA9: LDA.b #$02
#_06DFAB: STA.w $0309

#_06DFAE: LDA.l $7FFA2C,X
#_06DFB2: STA.w $0DD0,X

#_06DFB5: STZ.w $0F80,X

#_06DFB8: LDA.b #$00
#_06DFBA: STA.l $7FFA1C,X

;---------------------------------------------------------------------------------------------------

#_06DFBE: PHX

#_06DFBF: LDA.w $0E20,X
#_06DFC2: TAX

#_06DFC3: LDA.l SpriteData_OAMProp,X

#_06DFC7: PLX

#_06DFC8: AND.b #$10
#_06DFCA: STA.b $00

#_06DFCC: LDA.w $0E60,X
#_06DFCF: AND.b #$EF
#_06DFD1: ORA.b $00
#_06DFD3: STA.w $0E60,X

#_06DFD6: LDA.b $2F
#_06DFD8: LSR A
#_06DFD9: TAY

#_06DFDA: LDA.w .throw_speed_x,Y
#_06DFDD: STA.w $0D50,X

#_06DFE0: LDA.w .throw_speed_y,Y
#_06DFE3: STA.w $0D40,X

#_06DFE6: LDA.w .throw_speed_z,Y
#_06DFE9: STA.w $0F80,X

#_06DFEC: LDA.b #$00
#_06DFEE: STA.w $0F10,X

.no_throw
#_06DFF1: RTS

;===================================================================================================

ThrownSprite_TileAndSpriteInteraction_long:
#_06DFF2: PHB
#_06DFF3: PHK
#_06DFF4: PLB

#_06DFF5: JSR ThrownSprite_TileAndSpriteInteraction

#_06DFF8: PLB

#_06DFF9: RTL

;===================================================================================================

SpriteModule_Stunned:
#_06DFFA: JSR HandleFreezeAndStunTimer
#_06DFFD: JSR Sprite_CheckIfActivePermissive_Bank06

#_06E000: LDA.w $0EA0,X
#_06E003: BEQ .not_recoiling
#_06E005: BPL .recoil_timer_ticking

#_06E007: STZ.w $0EA0,X

.recoil_timer_ticking
#_06E00A: JSR Sprite_ZeroVelocity_XY_Bank06

.not_recoiling
#_06E00D: LDA.w $0DF0,X
#_06E010: CMP.b #$20
#_06E012: BCS .delay_damage

#_06E014: JSR Sprite_CheckDamageFromLink

.delay_damage
#_06E017: JSR Sprite_CheckIfRecoiling_Bank06
#_06E01A: JSR Sprite_Move_XY_Bank06

#_06E01D: LDA.w $0E90,X
#_06E020: BNE .skip_tile_collision

#_06E022: JSR Sprite_CheckTileCollision

#_06E025: LDA.w $0DD0,X
#_06E028: BEQ .not_even_here_exit

;===================================================================================================

#ThrownSprite_TileAndSpriteInteraction:
#_06E02A: LDA.w $0E70,X
#_06E02D: AND.b #$0F
#_06E02F: BEQ .skip_tile_collision

#_06E031: JSR Sprite_ApplyRicochet

#_06E034: LDA.w $0DD0,X
#_06E037: CMP.b #$0B
#_06E039: BNE .skip_tile_collision

#_06E03B: LDA.b #$05 ; SFX2.05
#_06E03D: JSL SpriteSFX_QueueSFX2WithPan

.skip_tile_collision
#_06E041: LDY.b #$68
#_06E043: JSR Sprite_CheckTileProperty

#_06E046: PHX

#_06E047: LDA.w $0E20,X
#_06E04A: TAX

#_06E04B: LDA.l SpriteData_OAMProp,X

#_06E04F: PLX

#_06E050: AND.b #$10
#_06E052: BEQ .not_over_pit

#_06E054: LDA.w $0E60,X
#_06E057: ORA.b #$10
#_06E059: STA.w $0E60,X

#_06E05C: LDA.w $0FA5
#_06E05F: CMP.b #$20 ; TILETYPE 20
#_06E061: BNE .not_over_pit

#_06E063: JSR Sprite_DisableShadowFlag

.not_over_pit
#_06E066: JSR Sprite_Move_Z_Bank06

#_06E069: DEC.w $0F80,X
#_06E06C: DEC.w $0F80,X

#_06E06F: LDA.w $0F70,X
#_06E072: DEC A
#_06E073: CMP.b #$F0
#_06E075: BCS .not_too_high

#_06E077: JMP.w .check_for_freeze

.not_too_high
#_06E07A: STZ.w $0F70,X

#_06E07D: LDA.w $0E20,X
#_06E080: CMP.b #$E8 ; SPRITE E8
#_06E082: BNE .dont_set_death_state

#_06E084: LDA.w $0F80,X
#_06E087: CMP.b #$E8
#_06E089: BPL .dont_set_death_state

#_06E08B: LDA.b #$06
#_06E08D: STA.w $0DD0,X

#_06E090: LDA.b #$08
#_06E092: STA.w $0DF0,X

;===================================================================================================

#Sprite_ChangeOAMAllotmentTo4:
#_06E095: LDA.b #$03
#_06E097: STA.w $0E40,X

.not_even_here_exit
#_06E09A: RTS

;---------------------------------------------------------------------------------------------------

.dont_set_death_state
#_06E09B: JSR ThrowableScenery_TransmuteIfValid

#_06E09E: LDA.w $0FA5
#_06E0A1: CMP.b #$20 ; TILETYPE 20
#_06E0A3: BNE .not_pit_or_too_high

#_06E0A5: LDA.w $0B6B,X
#_06E0A8: LSR A
#_06E0A9: BCS .not_pit_or_too_high

;===================================================================================================

#Sprite_SetToFalling:
#_06E0AB: LDA.b #$01
#_06E0AD: STA.w $0DD0,X

#_06E0B0: LDA.b #$1F
#_06E0B2: STA.w $0DF0,X

#_06E0B5: STZ.w $012E

#_06E0B8: LDA.b #$20 ; SFX2.20
#_06E0BA: JSL SpriteSFX_QueueSFX2WithPan

#_06E0BE: RTS

;---------------------------------------------------------------------------------------------------

.not_pit_or_too_high
#_06E0BF: CMP.b #$09
#_06E0C1: BNE .not_shallow_water

#_06E0C3: LDA.w $0F80,X

#_06E0C6: STZ.w $0F80,X

#_06E0C9: CMP.b #$F0
#_06E0CB: BPL .continue

#_06E0CD: LDA.b #$EC ; SPRITE EC
#_06E0CF: JSL Sprite_SpawnDynamically
#_06E0D3: BMI .continue

;---------------------------------------------------------------------------------------------------

#_06E0D5: JSL Sprite_SetSpawnedCoordinates

#_06E0D9: PHX

#_06E0DA: TYX
#_06E0DB: JSR .plop_in_water

#_06E0DE: PLX

#_06E0DF: BRA .continue

;---------------------------------------------------------------------------------------------------

.not_shallow_water
#_06E0E1: CMP.b #$08
#_06E0E3: BNE .continue

#_06E0E5: LDA.w $0E20,X
#_06E0E8: CMP.b #$D2 ; SPRITE D2
#_06E0EA: BEQ .spawn_a_fish

#_06E0EC: JSL GetRandomNumber
#_06E0F0: LSR A
#_06E0F1: BCC .plop_in_water

.spawn_a_fish
#_06E0F3: JSR Sprite_SpawnLeapingFish

;---------------------------------------------------------------------------------------------------

.plop_in_water
#_06E0F6: JSL Sprite_CalculateSFXPan
#_06E0FA: ORA.b #$28 ; SFX2.28
#_06E0FC: STA.w $012E

#_06E0FF: LDA.b #$03
#_06E101: STA.w $0DD0,X

#_06E104: LDA.b #$0F
#_06E106: STA.w $0DF0,X

#_06E109: STZ.w $0D80,X

#_06E10C: JSL GetRandomNumber
#_06E110: AND.b #$01

#_06E112: JMP.w Sprite_ChangeOAMAllotmentTo4

;---------------------------------------------------------------------------------------------------

.continue
#_06E115: LDA.w $0F80,X
#_06E118: BPL .positive_z_speed

#_06E11A: EOR.b #$FF
#_06E11C: INC A
#_06E11D: LSR A
#_06E11E: CMP.b #$09
#_06E120: BCS .active_or_quasi_active

#_06E122: LDA.b #$00

.active_or_quasi_active
#_06E124: STA.w $0F80,X

.positive_z_speed
#_06E127: LDA.w $0D50,X
#_06E12A: ASL A
#_06E12B: ROR.w $0D50,X

#_06E12E: LDA.w $0D50,X
#_06E131: CMP.b #$FF
#_06E133: BNE .dont_reset_x_speed

#_06E135: STZ.w $0D50,X

.dont_reset_x_speed
#_06E138: LDA.w $0D40,X
#_06E13B: ASL A
#_06E13C: ROR.w $0D40,X

#_06E13F: LDA.w $0D40,X
#_06E142: CMP.b #$FF
#_06E144: BNE .check_for_freeze

#_06E146: STZ.w $0D40,X

;---------------------------------------------------------------------------------------------------

.check_for_freeze
#_06E149: LDA.w $0DD0,X
#_06E14C: CMP.b #$0B
#_06E14E: BNE .not_even_stunned

#_06E150: LDA.l $7FFA3C,X
#_06E154: BEQ .exit

.not_even_stunned
#_06E156: JSR Sprite_CheckIfLifted

#_06E159: LDA.w $0E20,X
#_06E15C: CMP.b #$4A ; SPRITE 4A
#_06E15E: BEQ .exit

#_06E160: JSR ThrownSprite_CheckDamageToSprites

.exit
#_06E163: RTS

;===================================================================================================

ThrowableScenery_InteractWithSpritesAndTiles:
#_06E164: JSR Sprite_Move_XY_Bank06
#_06E167: LDA.w $0E90,X
#_06E16A: BNE .skip_tile_collision

#_06E16C: JSR Sprite_CheckTileCollision

.skip_tile_collision
#_06E16F: JMP.w ThrownSprite_TileAndSpriteInteraction

;===================================================================================================

ThrownSprite_CheckDamageToSprites:
#_06E172: LDA.w $0F10,X
#_06E175: BNE EXIT_06E1B1

#_06E177: LDA.w $0D50,X
#_06E17A: ORA.w $0D40,X
#_06E17D: BEQ EXIT_06E1B1

#_06E17F: LDY.b #$0F

.next
#_06E181: PHY
#_06E182: CPY.w $0FA0
#_06E185: BEQ .skip

#_06E187: LDA.w $0E20,X
#_06E18A: CMP.b #$D2 ; SPRITE D2
#_06E18C: BEQ .skip

#_06E18E: LDA.w $0DD0,Y
#_06E191: CMP.b #$09
#_06E193: BCC .skip

#_06E195: TYA
#_06E196: EOR.b $1A
#_06E198: AND.b #$03
#_06E19A: ORA.w $0BA0,Y
#_06E19D: ORA.w $0EF0,Y
#_06E1A0: BNE .skip

#_06E1A2: LDA.w $0F20,X
#_06E1A5: CMP.w $0F20,Y
#_06E1A8: BNE .skip

#_06E1AA: JSR ThrownSprite_CheckDamageToSingleSprite

.skip
#_06E1AD: PLY
#_06E1AE: DEY
#_06E1AF: BPL .next

;---------------------------------------------------------------------------------------------------

#EXIT_06E1B1:
#_06E1B1: RTS

;===================================================================================================

ThrownSprite_CheckDamageToSingleSprite:
#_06E1B2: LDA.w $0D10,X
#_06E1B5: STA.b $00

#_06E1B7: LDA.w $0D30,X
#_06E1BA: STA.b $08

#_06E1BC: LDA.b #$0F
#_06E1BE: STA.b $02

#_06E1C0: LDA.w $0D00,X
#_06E1C3: SEC
#_06E1C4: SBC.w $0F70,X

#_06E1C7: PHP

#_06E1C8: CLC
#_06E1C9: ADC.b #$08
#_06E1CB: STA.b $01

#_06E1CD: LDA.w $0D20,X
#_06E1D0: ADC.b #$00

#_06E1D2: PLP
#_06E1D3: SBC.b #$00
#_06E1D5: STA.b $09

#_06E1D7: LDA.b #$08
#_06E1D9: STA.b $03

;---------------------------------------------------------------------------------------------------

#_06E1DB: PHX

#_06E1DC: TYX

#_06E1DD: JSR Sprite_SetupHitBox

#_06E1E0: PLX

#_06E1E1: JSR CheckIfHitBoxesOverlap
#_06E1E4: BCC EXIT_06E1B1

#_06E1E6: LDA.w $0E20,Y
#_06E1E9: CMP.b #$3F ; SPRITE 3F
#_06E1EB: BNE .not_tutorial_guard

#_06E1ED: JSL Sprite_PlaceWeaponTink

#_06E1F1: BRA Sprite_ApplyRicochet

;---------------------------------------------------------------------------------------------------

.not_tutorial_guard
#_06E1F3: LDA.b #$03
#_06E1F5: PHA

#_06E1F6: LDA.w $0E20,X
#_06E1F9: CMP.b #$EC ; SPRITE EC
#_06E1FB: BNE .not_pot

#_06E1FD: LDA.w $0DB0,X
#_06E200: CMP.b #$02
#_06E202: BNE .not_pot

#_06E204: LDA.b $1B
#_06E206: BNE .not_pot

#_06E208: PLA

#_06E209: LDA.b #$01
#_06E20B: PHA

;---------------------------------------------------------------------------------------------------

.not_pot
#_06E20C: PLA
#_06E20D: PHX

#_06E20E: TYX
#_06E20F: PHY

#_06E210: JSL Ancilla_CheckDamageToSprite_preset

#_06E214: PLY
#_06E215: PLX

#_06E216: LDA.w $0D50,X
#_06E219: ASL A
#_06E21A: STA.w $0F40,Y

#_06E21D: LDA.w $0D40,X
#_06E220: ASL A
#_06E221: STA.w $0F30,Y

#_06E224: LDA.b #$10
#_06E226: STA.w $0F10,X

;===================================================================================================

Sprite_ApplyRicochet:
#_06E229: JSR Sprite_InvertSpeed_XY
#_06E22C: JSR Sprite_HalveSpeed_XY

;===================================================================================================

ThrowableScenery_TransmuteIfValid:
#_06E22F: LDA.w $0E20,X
#_06E232: CMP.b #$EC ; SPRITE EC
#_06E234: BNE EXIT_06E26D

#_06E236: STZ.w $0FAC

;===================================================================================================

ThrowableScenery_TransmuteToDebris:
#_06E239: LDA.w $0DC0,X
#_06E23C: BEQ .no_secret

#_06E23E: STA.w $0B9C

#_06E241: JSR Sprite_SpawnSecret

#_06E244: STZ.w $0B9C

.no_secret
#_06E247: LDY.w $0DB0,X

#_06E24A: LDA.b $1B
#_06E24C: BEQ .overworld

#_06E24E: LDY.b #$00

.overworld
#_06E250: STZ.w $012E

#_06E253: LDA.w ThrownItemSFX,Y
#_06E256: JSL SpriteSFX_QueueSFX2WithPan

;===================================================================================================

Sprite_ScheduleForBreakage:
#_06E25A: LDA.b #$1F

;===================================================================================================

Sprite_ScheduleForBreakage_parameterized:
#_06E25C: STA.w $0DF0,X

#_06E25F: LDA.b #$06
#_06E261: STA.w $0DD0,X

#_06E264: LDA.w $0E40,X
#_06E267: CLC
#_06E268: ADC.b #$04
#_06E26A: STA.w $0E40,X

;---------------------------------------------------------------------------------------------------

#EXIT_06E26D:
#_06E26D: RTS

;===================================================================================================

Sprite_HalveSpeed_XY:
#_06E26E: LDA.w $0D50,X
#_06E271: ASL A
#_06E272: ROR.w $0D50,X

#_06E275: LDA.w $0D40,X
#_06E278: ASL A
#_06E279: ROR.w $0D40,X

#_06E27C: RTS

;===================================================================================================

ThrownItemSFX:
#_06E27D: db $1F ; SFX2.1F
#_06E27E: db $1F ; SFX2.1F
#_06E27F: db $1E ; SFX2.1E
#_06E280: db $1E ; SFX2.1E
#_06E281: db $1E ; SFX2.1E
#_06E282: db $1F ; SFX2.1F
#_06E283: db $1F ; SFX2.1F
#_06E284: db $1F ; SFX2.1F
#_06E285: db $1F ; SFX2.1F

;===================================================================================================

Sprite_SpawnLeapingFish:
#_06E286: LDA.b #$D2 ; SPRITE D2
#_06E288: JSL Sprite_SpawnDynamically
#_06E28C: BMI .exit

#_06E28E: JSL Sprite_SetSpawnedCoordinates

#_06E292: LDA.b #$02
#_06E294: STA.w $0D80,Y

#_06E297: LDA.b #$30
#_06E299: STA.w $0DF0,Y

#_06E29C: LDA.w $0E20,X
#_06E29F: CMP.b #$D2 ; SPRITE D2
#_06E2A1: BNE .exit

#_06E2A3: STA.w $0D90,Y

.exit
#_06E2A6: RTS

;===================================================================================================

pool SpriteModule_Frozen

.sparkle_offset_low
#_06E2A7: db  -4,  12,   3,   8

.sparkle_offset_high
#_06E2AB: db  -1,   0,   0,   0

.sparkle_mask
#_06E2AF: db $7F, $0F, $03, $01, $00, $00, $00

pool off

;===================================================================================================

HandleFreezeAndStunTimer:
#_06E2B6: JSL Sprite_DrawRippleIfInWater

;===================================================================================================

SpriteModule_Frozen:
#_06E2BA: JSR SpriteModule_Active

#_06E2BD: LDA.l $7FFA3C,X
#_06E2C1: BEQ .not_frozen

#_06E2C3: LDA.w $0DF0,X
#_06E2C6: CMP.b #$20
#_06E2C8: BCS .skip_palette

#_06E2CA: LDA.w $0F50,X
#_06E2CD: AND.b #$F1
#_06E2CF: ORA.b #$04
#_06E2D1: STA.w $0F50,X

.skip_palette
#_06E2D4: LDA.w $0DF0,X
#_06E2D7: LSR A
#_06E2D8: LSR A
#_06E2D9: LSR A
#_06E2DA: LSR A
#_06E2DB: TAY

#_06E2DC: TXA
#_06E2DD: ASL A
#_06E2DE: ASL A
#_06E2DF: ASL A
#_06E2E0: ASL A
#_06E2E1: EOR.b $1A
#_06E2E3: ORA.b $11
#_06E2E5: AND.w .sparkle_mask,Y

#_06E2E8: BNE .exit

#_06E2EA: JSL GetRandomNumber
#_06E2EE: AND.b #$03
#_06E2F0: TAY

#_06E2F1: LDA.w .sparkle_offset_low,Y
#_06E2F4: STA.b $00

#_06E2F6: LDA.w .sparkle_offset_high,Y
#_06E2F9: STA.b $01

#_06E2FB: JSL GetRandomNumber
#_06E2FF: AND.b #$03
#_06E301: TAY

#_06E302: LDA.w .sparkle_offset_low,Y
#_06E305: STA.b $02

#_06E307: LDA.w .sparkle_offset_high,Y
#_06E30A: STA.b $03

#_06E30C: JSL GarnishSpawn_Sparkle

.exit
#_06E310: RTS

;---------------------------------------------------------------------------------------------------

.not_frozen
#_06E311: LDA.b $1A
#_06E313: AND.b #$01
#_06E315: ORA.b $11
#_06E317: ORA.w $0FC1
#_06E31A: BNE .exit_b

#_06E31C: LDA.w $0B58,X
#_06E31F: BEQ .unstun

#_06E321: DEC.w $0B58,X

#_06E324: CMP.b #$38
#_06E326: BCS .exit_b

#_06E328: AND.b #$01
#_06E32A: TAY

#_06E32B: LDA.w .shake_x,Y
#_06E32E: STA.w $0D50,X

#_06E331: JSR Sprite_Move_X_Bank06

.exit_b
#_06E334: RTS

;---------------------------------------------------------------------------------------------------

.unstun
#_06E335: LDA.b #$09
#_06E337: STA.w $0DD0,X

#_06E33A: STZ.w $0F40,X
#_06E33D: STZ.w $0F30,X

#_06E340: RTS

;---------------------------------------------------------------------------------------------------

.shake_x
#_06E341: db   8,  -8

;===================================================================================================

pool SpriteModule_Poof

.offset_x
#_06E343: db  -6,  10,   1,  13
#_06E347: db  -6,  10,   1,  13
#_06E34B: db  -7,   4,  -5,   6
#_06E34F: db  -1,   1,  -2,   0

.offset_y
#_06E353: db  -6,  -4,  10,   9
#_06E357: db  -6,  -4,  10,   9
#_06E35B: db  -8, -10,   4,   3
#_06E35F: db  -1,  -2,   0,   1

.char
#_06E363: db $9B, $9B, $9B, $9B
#_06E367: db $B3, $B3, $B3, $B3
#_06E36B: db $8A, $8A, $8A, $8A
#_06E36F: db $8A, $8A, $8A, $8A

.prop
#_06E373: db $24, $A4, $24, $A4
#_06E377: db $E4, $64, $A4, $24
#_06E37B: db $24, $E4, $E4, $E4
#_06E37F: db $24, $E4, $E4, $E4

.size
#_06E383: db $00, $00, $00, $00
#_06E387: db $00, $00, $00, $00
#_06E38B: db $02, $02, $02, $02
#_06E38F: db $02, $02, $02, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteModule_Poof:
#_06E393: LDA.w $0DF0,X
#_06E396: BNE .delay

#_06E398: LDA.w $0E20,X
#_06E39B: CMP.b #$0D ; SPRITE 0D
#_06E39D: BNE .not_cukeman

#_06E39F: LDY.w $0EB0,X
#_06E3A2: BEQ .not_cukeman

#_06E3A4: LDY.w $0D10,X
#_06E3A7: PHY

#_06E3A8: LDY.w $0D30,X
#_06E3AB: PHY

#_06E3AC: JSR PrepareEnemyDrop

#_06E3AF: PLA
#_06E3B0: STA.w $0D30,X

#_06E3B3: PLA
#_06E3B4: STA.w $0D10,X

#_06E3B7: STZ.w $0F80,X
#_06E3BA: STZ.w $0BA0,X

#_06E3BD: RTS

;---------------------------------------------------------------------------------------------------

.not_cukeman
#_06E3BE: LDA.w $0CBA,X
#_06E3C1: BNE .no_forced_drop

#_06E3C3: LDY.b #$02
#_06E3C5: JMP.w ForcePrizeDrop

;---------------------------------------------------------------------------------------------------

.no_forced_drop
#_06E3C8: JMP.w Sprite_DoTheDeath

;---------------------------------------------------------------------------------------------------

.delay
#_06E3CB: JSR Sprite_PrepOAMCoord

#_06E3CE: LDA.w $0DF0,X
#_06E3D1: LSR A
#_06E3D2: AND.b #$FC
#_06E3D4: STA.b $00

#_06E3D6: PHX
#_06E3D7: LDX.b #$03

.next_object
#_06E3D9: PHX

#_06E3DA: TXA
#_06E3DB: CLC
#_06E3DC: ADC.b $00
#_06E3DE: TAX

#_06E3DF: LDA.w $0FA8
#_06E3E2: CLC
#_06E3E3: ADC.w .offset_x,X
#_06E3E6: STA.b ($90),Y

#_06E3E8: LDA.w $0FA9
#_06E3EB: CLC
#_06E3EC: ADC.w .offset_y,X
#_06E3EF: INY
#_06E3F0: STA.b ($90),Y

#_06E3F2: LDA.w .char,X
#_06E3F5: INY
#_06E3F6: STA.b ($90),Y

#_06E3F8: LDA.w .prop,X
#_06E3FB: INY
#_06E3FC: STA.b ($90),Y

#_06E3FE: PHY

#_06E3FF: TYA
#_06E400: LSR A
#_06E401: LSR A
#_06E402: TAY

#_06E403: LDA.w .size,X
#_06E406: STA.b ($92),Y

#_06E408: PLY
#_06E409: INY

#_06E40A: PLX
#_06E40B: DEX
#_06E40C: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06E40E: PLX

#_06E40F: LDY.b #$FF
#_06E411: LDA.b #$03
#_06E413: JMP.w Sprite_CorrectOAMEntries

;===================================================================================================

Sprite_PrepOAMCoord_long:
#_06E416: JSR Sprite_PrepOAMCoord_wrapper

#_06E419: RTL

;---------------------------------------------------------------------------------------------------

Sprite_PrepOAMCoord_wrapper:
#_06E41A: JSR Sprite_PrepOAMCoord

#_06E41D: RTS

;---------------------------------------------------------------------------------------------------

Sprite_PrepOAMCoord:
#_06E41E: STZ.w $0F00,X

#_06E421: REP #$20

#_06E423: LDA.w $0FD8
#_06E426: SEC
#_06E427: SBC.b $E2
#_06E429: STA.b $00

#_06E42B: CLC
#_06E42C: ADC.w #$0040
#_06E42F: CMP.w #$0170

#_06E432: SEP #$20
#_06E434: BCS .offscreen

;---------------------------------------------------------------------------------------------------

#_06E436: LDA.w $0F70,X
#_06E439: STA.b $04
#_06E43B: STZ.b $05

#_06E43D: REP #$20

#_06E43F: LDA.w $0FDA
#_06E442: SEC
#_06E443: SBC.b $E8
#_06E445: PHA

#_06E446: SEC
#_06E447: SBC.b $04
#_06E449: STA.b $02

#_06E44B: PLA
#_06E44C: CLC
#_06E44D: ADC.w #$0040
#_06E450: CMP.w #$0170

#_06E453: SEP #$20
#_06E455: BCC .on_screen

#_06E457: LDA.w $0F60,X
#_06E45A: AND.b #$20
#_06E45C: BEQ .disable

;---------------------------------------------------------------------------------------------------

.on_screen
#_06E45E: CLC

.prep_exit
#_06E45F: LDA.w $0F50,X
#_06E462: EOR.w $0B89,X
#_06E465: STA.b $05
#_06E467: STZ.b $04

#_06E469: LDA.b $00
#_06E46B: STA.w $0FA8

#_06E46E: LDA.b $02
#_06E470: STA.w $0FA9

#_06E473: LDY.b #$00

#_06E475: RTS

;---------------------------------------------------------------------------------------------------

.offscreen
#_06E476: REP #$20

#_06E478: LDA.w $0FDA
#_06E47B: SEC
#_06E47C: SBC.b $E8

#_06E47E: SEC
#_06E47F: SBC.b $04
#_06E481: STA.b $02

#_06E483: SEP #$20

;---------------------------------------------------------------------------------------------------

.disable
#_06E485: INC.w $0F00,X

#_06E488: LDA.w $0CAA,X
#_06E48B: BMI .die

#_06E48D: JSL Sprite_KillSelf

;---------------------------------------------------------------------------------------------------

.die
#_06E491: PLA
#_06E492: PLA

#_06E493: SEC

#_06E494: BRA .prep_exit

;===================================================================================================

Sprite_CheckTileCollision_long:
#_06E496: PHB
#_06E497: PHK
#_06E498: PLB

#_06E499: JSR Sprite_CheckTileCollision

#_06E49C: PLB

#_06E49D: LDA.w $0E70,X

#_06E4A0: RTL

;===================================================================================================

Sprite_CheckTileCollision_set_layer:
#_06E4A1: LDA.w $0FB6
#_06E4A4: STA.w $0F20,X

#_06E4A7: RTS

;---------------------------------------------------------------------------------------------------

Sprite_CheckTileCollision_check_just_one:
#_06E4A8: JMP.w Sprite_CheckTileCollisionSingleLayer

;---------------------------------------------------------------------------------------------------

Sprite_CheckTileCollision:
#_06E4AB: STZ.w $0E70,X

#_06E4AE: LDA.w $0F60,X
#_06E4B1: BMI Sprite_CheckTileCollision_check_just_one

#_06E4B3: LDA.w $046C
#_06E4B6: BEQ Sprite_CheckTileCollision_check_just_one

#_06E4B8: LDA.w $0F20,X
#_06E4BB: STA.w $0FB6

#_06E4BE: LDA.b #$01
#_06E4C0: STA.w $0F20,X

#_06E4C3: JSR Sprite_CheckTileCollisionSingleLayer

#_06E4C6: LDA.w $046C
#_06E4C9: CMP.b #$04
#_06E4CB: BEQ Sprite_CheckTileCollision_set_layer

#_06E4CD: STZ.w $0F20,X

#_06E4D0: JSR Sprite_CheckTileCollisionSingleLayer

#_06E4D3: LDA.w $0FA5
#_06E4D6: STA.l $7FFABC,X

#_06E4DA: RTS

;===================================================================================================

Sprite_CheckTileCollisionSingleLayer:
#_06E4DB: LDA.w $0E40,X
#_06E4DE: AND.b #$20
#_06E4E0: BEQ .normal_check

#_06E4E2: LDY.b #$6A
#_06E4E4: JSR Sprite_CheckTileProperty
#_06E4E7: BCC .exit_a

#_06E4E9: INC.w $0E70,X

.exit_a
#_06E4EC: RTS

;---------------------------------------------------------------------------------------------------

.normal_check
#_06E4ED: LDA.w $0F60,X
#_06E4F0: BMI .force_check

#_06E4F2: LDA.w $046C
#_06E4F5: BNE .unorthodox_collision_settings

.force_check
#_06E4F7: LDY.b #$00

#_06E4F9: LDA.w $0D40,X
#_06E4FC: BEQ .no_y_velocity
#_06E4FE: BMI .negative_y_velocity

#_06E500: INY

.negative_y_velocity
#_06E501: JSR Sprite_CheckForTileInDirection_vertical

.no_y_velocity
#_06E504: LDY.b #$02

#_06E506: LDA.w $0D50,X
#_06E509: BEQ .no_x_velocity
#_06E50B: BMI .negative_x_velocity

#_06E50D: INY

.negative_x_velocity
#_06E50E: JSR Sprite_CheckForTileInDirection_horizontal

.no_x_velocity
#_06E511: BRA .continue

;---------------------------------------------------------------------------------------------------

.unorthodox_collision_settings
#_06E513: LDY.b #$01

.check_next_vertical
#_06E515: JSR Sprite_CheckForTileInDirection_vertical

#_06E518: DEY
#_06E519: BPL .check_next_vertical

;---------------------------------------------------------------------------------------------------

#_06E51B: LDY.b #$03

.check_next_horizontal
#_06E51D: JSR Sprite_CheckForTileInDirection_horizontal

#_06E520: DEY
#_06E521: CPY.b #$01
#_06E523: BNE .check_next_horizontal

;---------------------------------------------------------------------------------------------------

.continue
#_06E525: LDA.w $0BE0,X
#_06E528: BMI .exit_b

#_06E52A: LDA.w $0F70,X
#_06E52D: BEQ .grounded

.exit_b
#_06E52F: RTS

;---------------------------------------------------------------------------------------------------

.grounded
#_06E530: LDY.b #$68
#_06E532: JSR Sprite_CheckTileProperty

#_06E535: LDA.w $0FA5
#_06E538: STA.l $7FF9C2,X

#_06E53C: CMP.b #$1C ; TILETYPE 1C
#_06E53E: BNE .dont_fall_to_lower_layer

#_06E540: LDY.w $0FB3
#_06E543: BEQ .dont_fall_to_lower_layer

#_06E545: LDY.w $0DD0,X
#_06E548: CPY.b #$0B
#_06E54A: BNE .dont_fall_to_lower_layer

#_06E54C: LDA.b #$01
#_06E54E: STA.w $0F20,X

#_06E551: RTS

;---------------------------------------------------------------------------------------------------

.dont_fall_to_lower_layer
#_06E552: CMP.b #$20 ; TILETYPE 20
#_06E554: BNE .not_pit

#_06E556: LDA.w $0B6B,X
#_06E559: AND.b #$01
#_06E55B: BEQ .sprite_cant_fall

#_06E55D: LDA.b $1B
#_06E55F: BNE .indoors_pit

#_06E561: JMP.w Sprite_SetToFalling

.indoors_pit
#_06E564: LDA.b #$05
#_06E566: STA.w $0DD0,X

#_06E569: LDA.b #$5F

#_06E56B: LDY.w $0E20,X
#_06E56E: CPY.b #$13 ; SPRITE 13
#_06E570: BEQ .not_mini_helma_falling

#_06E572: CPY.b #$26 ; SPRITE 26
#_06E574: BNE .not_beetle_falling

.not_mini_helma_falling
#_06E576: LSR.w $0F50,X
#_06E579: ASL.w $0F50,X

#_06E57C: LDA.b #$3F

.not_beetle_falling
#_06E57E: STA.w $0DF0,X

#_06E581: RTS

;---------------------------------------------------------------------------------------------------

.not_pit
#_06E582: CMP.b #$0C ; TILETYPE 0C
#_06E584: BNE .sprite_cant_fall

#_06E586: LDA.l $7FFABC,X
#_06E58A: CMP.b #$1C ; TILETYPE 1C
#_06E58C: BNE .exit_c

#_06E58E: JSR SpriteFall_AdjustPosition

#_06E591: LDA.w $0E70,X
#_06E594: ORA.b #$20
#_06E596: STA.w $0E70,X

#_06E599: RTS

;---------------------------------------------------------------------------------------------------

.sprite_cant_fall
#_06E59A: CMP.b #$68 ; TILETYPE 68
#_06E59C: BCC .not_a_conveyor

#_06E59E: CMP.b #$6C ; TILETYPE 6C
#_06E5A0: BCS .exit_c

.apply_conveyor_motion
#_06E5A2: TAY
#_06E5A3: JSL Sprite_ApplyConveyor

#_06E5A7: RTS

;---------------------------------------------------------------------------------------------------

.not_a_conveyor
#_06E5A8: CMP.b #$08 ; TILETYPE 08
#_06E5AA: BNE .exit_c

#_06E5AC: LDA.w $046C
#_06E5AF: CMP.b #$04
#_06E5B1: BNE .exit_c

#_06E5B3: LDA.b #$6A ; TILETYPE 6A
#_06E5B5: BRA .apply_conveyor_motion

.exit_c
#_06E5B7: RTS

;===================================================================================================

Sprite_CheckForTileInDirection_horizontal:
#_06E5B8: JSR Sprite_CheckTileInDirection
#_06E5BB: BCC .exit

#_06E5BD: LDA.w Sprite_CheckForTileInDirection_direction_flag,Y
#_06E5C0: ORA.w $0E70,X
#_06E5C3: STA.w $0E70,X

#_06E5C6: LDA.w $0E30,X
#_06E5C9: AND.b #$07
#_06E5CB: CMP.b #$05
#_06E5CD: BCS .exit

#_06E5CF: LDA.w $0EA0,X
#_06E5D2: BEQ .check_once

#_06E5D4: JSR .check_once
#_06E5D7: JSR .check_once

;---------------------------------------------------------------------------------------------------

.check_once
#_06E5DA: LDA.w $0D10,X
#_06E5DD: CLC
#_06E5DE: ADC.w Sprite_CheckForTileInDirection_pushback_low,Y
#_06E5E1: STA.w $0D10,X

#_06E5E4: LDA.w $0D30,X
#_06E5E7: ADC.w Sprite_CheckForTileInDirection_pushback_high,Y
#_06E5EA: STA.w $0D30,X

.exit
#_06E5ED: RTS

;===================================================================================================

Sprite_CheckForTileInDirection_vertical:
#_06E5EE: JSR Sprite_CheckTileInDirection
#_06E5F1: BCC .exit

#_06E5F3: LDA.w Sprite_CheckForTileInDirection_direction_flag,Y
#_06E5F6: ORA.w $0E70,X
#_06E5F9: STA.w $0E70,X

#_06E5FC: LDA.w $0E30,X
#_06E5FF: AND.b #$07
#_06E601: CMP.b #$05
#_06E603: BCS .exit

#_06E605: LDA.w $0EA0,X
#_06E608: BEQ .check_once

#_06E60A: JSR .check_once
#_06E60D: JSR .check_once

;---------------------------------------------------------------------------------------------------

.check_once
#_06E610: LDA.w $0D00,X
#_06E613: CLC
#_06E614: ADC.w Sprite_CheckForTileInDirection_pushback_low,Y
#_06E617: STA.w $0D00,X

#_06E61A: LDA.w $0D20,X
#_06E61D: ADC.w Sprite_CheckForTileInDirection_pushback_high,Y
#_06E620: STA.w $0D20,X

.exit
#_06E623: RTS

;===================================================================================================

SpriteFall_AdjustPosition:
#_06E624: LDA.w $0310
#_06E627: CLC
#_06E628: ADC.w $0D00,X
#_06E62B: STA.w $0D00,X

#_06E62E: LDA.w $0311
#_06E631: ADC.w $0D20,X
#_06E634: STA.w $0D20,X

#_06E637: LDA.w $0312
#_06E63A: CLC
#_06E63B: ADC.w $0D10,X
#_06E63E: STA.w $0D10,X

#_06E641: LDA.w $0313
#_06E644: ADC.w $0D30,X
#_06E647: STA.w $0D30,X

#_06E64A: RTS

;===================================================================================================

pool Sprite_CheckTileProperty

.offset_x
#_06E64B: dw $0008, $0008, $0002, $000E
#_06E653: dw $0008, $0008, $FFFE, $000A
#_06E65B: dw $0008, $0008, $0001, $000E
#_06E663: dw $0004, $0004, $0004, $0004
#_06E66B: dw $0004, $0004, $FFFE, $000A
#_06E673: dw $0008, $0008, $FFE7, $0028
#_06E67B: dw $0008, $0008, $0002, $000E
#_06E683: dw $0008, $0008, $FFF8, $0017
#_06E68B: dw $0008, $0008, $FFEC, $0024
#_06E693: dw $0008, $0008, $FFFF, $0010
#_06E69B: dw $0008, $0008, $FFFF, $0010
#_06E6A3: dw $0008, $0008, $FFF8, $0018
#_06E6AB: dw $0008, $0008, $FFF8, $0018
#_06E6B3: dw $0008, $0003

.offset_y
#_06E6B7: dw $0006, $0014, $000D, $000D
#_06E6BF: dw $0000, $0008, $0004, $0004
#_06E6C7: dw $0001, $000E, $0008, $0008
#_06E6CF: dw $0004, $0004, $0004, $0004
#_06E6D7: dw $FFFE, $000A, $0004, $0004
#_06E6DF: dw $FFE7, $0028, $0008, $0008
#_06E6E7: dw $0003, $0010, $000A, $000A
#_06E6EF: dw $FFF8, $0019, $0008, $0008
#_06E6F7: dw $FFEC, $0024, $0008, $0008
#_06E6FF: dw $FFFF, $0010, $0008, $0008
#_06E707: dw $000E, $0003, $0008, $0008
#_06E70F: dw $FFF8, $0018, $0008, $0008
#_06E717: dw $FFF8, $0020, $0008, $0008
#_06E71F: dw $000C, $0004

pool off

;===================================================================================================

pool Sprite_CheckForTileInDirection

.direction_flag
#_06E723: db $08 ; up
#_06E724: db $04 ; down
#_06E725: db $02 ; left
#_06E726: db $01 ; right

.pushback_low
#_06E727: db   1 ; up
#_06E728: db  -1 ; down
#_06E729: db   1 ; left
#_06E72A: db  -1 ; right

.pushback_high
#_06E72B: db   0 ; up
#_06E72C: db  -1 ; down
#_06E72D: db   0 ; left
#_06E72E: db  -1 ; right

pool off

;===================================================================================================

Sprite_CheckTileInDirection:
#_06E72F: STY.b $08

#_06E731: LDA.w $0B6B,X
#_06E734: AND.b #$F0
#_06E736: LSR A
#_06E737: LSR A
#_06E738: ADC.b $08
#_06E73A: ASL A
#_06E73B: TAY

;===================================================================================================

Sprite_CheckTileProperty:
#_06E73C: LDA.b $1B
#_06E73E: BEQ .overworld

;---------------------------------------------------------------------------------------------------

#_06E740: REP #$20

#_06E742: LDA.w $0FDA
#_06E745: CLC
#_06E746: ADC.w #$0008
#_06E749: AND.w #$01FF

#_06E74C: CLC
#_06E74D: ADC.w .offset_y,Y

#_06E750: SEC
#_06E751: SBC.w #$0008
#_06E754: STA.b $00

#_06E756: CMP.w #$0200
#_06E759: BCS .continue_check

#_06E75B: LDA.w $0FD8
#_06E75E: ADC.w #$0008
#_06E761: AND.w #$01FF

#_06E764: CLC
#_06E765: ADC.w .offset_x,Y

#_06E768: SEC
#_06E769: SBC.w #$0008
#_06E76C: STA.b $02

#_06E76E: CMP.w #$0200
#_06E771: BRA .continue_check

;---------------------------------------------------------------------------------------------------

.overworld
#_06E773: REP #$20

#_06E775: LDA.w $0FDA
#_06E778: CLC
#_06E779: ADC.w .offset_y,Y
#_06E77C: STA.b $00

#_06E77E: SEC
#_06E77F: SBC.w $0FBE
#_06E782: CMP.w $0FBA
#_06E785: BCS .continue_check

#_06E787: LDA.w $0FD8
#_06E78A: CLC
#_06E78B: ADC.w .offset_x,Y
#_06E78E: STA.b $02

#_06E790: SEC
#_06E791: SBC.w $0FBC
#_06E794: CMP.w $0FB8

;---------------------------------------------------------------------------------------------------

.continue_check
#_06E797: SEP #$20
#_06E799: BCC .check_attributes

#_06E79B: JMP.w .check_harmlessness

.check_attributes
#_06E79E: JSR Sprite_GetTileType
#_06E7A1: TAY

#_06E7A2: LDA.w $0CAA,X
#_06E7A5: AND.b #$08
#_06E7A7: BEQ .dont_use_simplified_attributes

#_06E7A9: PHX
#_06E7AA: TYX

#_06E7AB: LDY.b $08

#_06E7AD: LDA.l GeneralizedProjectileTileInteraction,X

#_06E7B1: PLX

#_06E7B2: CMP.b #$04
#_06E7B4: BEQ .check_worldiness

#_06E7B6: CMP.b #$01
#_06E7B8: BCC .proceed_to_failure

#_06E7BA: LDA.w $0FA5
#_06E7BD: CMP.b #$10 ; TILETYPE 10
#_06E7BF: BCC .proceed_to_success

#_06E7C1: CMP.b #$14 ; TILETYPE 14
#_06E7C3: BCS .proceed_to_success

#_06E7C5: JSR Sprite_CheckSlopedTileCollision

#_06E7C8: JMP.w .load_tile_prop_exit

;---------------------------------------------------------------------------------------------------

.proceed_to_success
#_06E7CB: JMP.w .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.check_worldiness
#_06E7CE: LDY.b $1B
#_06E7D0: BNE .proceed_to_failure

#_06E7D2: STA.w $0E90,X

.proceed_to_failure
#_06E7D5: JMP.w .fail

;---------------------------------------------------------------------------------------------------

.dont_use_simplified_attributes
#_06E7D8: LDA.w $0BE0,X
#_06E7DB: ASL A
#_06E7DC: BPL .disable_some_checks

#_06E7DE: LDA.w $0E20,X
#_06E7E1: CMP.b #$D2 ; SPRITE D2
#_06E7E3: BEQ .is_fish

#_06E7E5: CMP.b #$8A ; SPRITE 8A
#_06E7E7: BNE .not_spiky_ouchers

.is_fish
#_06E7E9: CPY.b #$09 ; TILETYPE 09
#_06E7EB: BEQ .fish_in_deep_water

.not_spiky_ouchers
#_06E7ED: CMP.b #$94 ; SPRITE 94
#_06E7EF: BNE .not_pirogusu

#_06E7F1: LDA.w $0E90,X
#_06E7F4: BEQ .check_for_water

#_06E7F6: BRA .disable_some_checks

;---------------------------------------------------------------------------------------------------

.not_pirogusu
#_06E7F8: CMP.b #$E3 ; SPRITE E3
#_06E7FA: BEQ .check_for_water

#_06E7FC: CMP.b #$8C ; SPRITE 8C
#_06E7FE: BEQ .check_for_water

#_06E800: CMP.b #$9A ; SPRITE 9A
#_06E802: BEQ .check_for_water

#_06E804: CMP.b #$81 ; SPRITE 81
#_06E806: BNE .disable_some_checks

.check_for_water
#_06E808: CPY.b #$08 ; TILETYPE 08
#_06E80A: BEQ .fail

#_06E80C: CPY.b #$09 ; TILETYPE 09

.fish_in_deep_water
#_06E80E: BEQ .fail

#_06E810: BRA .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.disable_some_checks
#_06E812: PHX
#_06E813: TYX

#_06E814: LDA.l GeneralizedSpriteTileInteraction,X

#_06E818: PLX

#_06E819: LDY.b $08
#_06E81B: CMP.b #$00
#_06E81D: BEQ .fail

#_06E81F: LDA.w $0FA5
#_06E822: CMP.b #$10 ; TILETYPE 10
#_06E824: BCC .not_slope

#_06E826: CMP.b #$14 ; TILETYPE 14
#_06E828: BCS .not_slope

#_06E82A: JSR Sprite_CheckSlopedTileCollision
#_06E82D: BRA .load_tile_prop_exit

;---------------------------------------------------------------------------------------------------

.not_slope
#_06E82F: CMP.b #$44 ; TILETYPE 44
#_06E831: BNE .not_spike

#_06E833: LDA.w $0EA0,X
#_06E836: BEQ .succeed_and_exit

#_06E838: LDA.w $0CE2,X
#_06E83B: BMI .skip_damage_or_recoil

#_06E83D: LDA.b #$04
#_06E83F: JSL Ancilla_CheckDamageToSprite_preset

#_06E843: LDA.w $0EF0,X
#_06E846: BEQ .skip_damage_or_recoil

#_06E848: LDA.b #$99
#_06E84A: STA.w $0EF0,X

#_06E84D: STZ.w $0EA0,X

.skip_damage_or_recoil
#_06E850: BRA .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.check_harmlessness
#_06E852: JSR .succeed_and_exit

#_06E855: LDA.w $0E40,X
#_06E858: ASL A
#_06E859: BPL .dont_die

#_06E85B: STZ.w $0DD0,X

#_06E85E: CLC

#_06E85F: RTS

.dont_die
#_06E860: SEC

#_06E861: RTS

;---------------------------------------------------------------------------------------------------

.not_spike
#_06E862: CMP.b #$20 ; TILETYPE 20
#_06E864: BNE .succeed_and_exit

#_06E866: LDA.w $0B6B,X
#_06E869: AND.b #$01
#_06E86B: BEQ .succeed_and_exit

#_06E86D: LDA.w $0EA0,X
#_06E870: BNE .fail

;---------------------------------------------------------------------------------------------------

.succeed_and_exit
#_06E872: SEC
#_06E873: SEP #$21

#_06E875: BRA .load_tile_prop_exit

.fail
#_06E877: CLC

.load_tile_prop_exit
#_06E878: LDY.b $08

#_06E87A: RTS

;===================================================================================================

GetTileType_long:
#_06E87B: PHB
#_06E87C: PHK
#_06E87D: PLB

#_06E87E: JSR GetTileType

#_06E881: PLB

#_06E882: RTL

;===================================================================================================

Sprite_GetTileType:
#_06E883: LDA.w $0F20,X

;===================================================================================================

GetTileType:
#_06E886: CMP.b #$01

#_06E888: REP #$30

#_06E88A: STZ.b $05
#_06E88C: BCC .other_layer

#_06E88E: LDA.w #$1000
#_06E891: STA.b $05

.other_layer
#_06E893: LDA.b $1B
#_06E895: AND.w #$00FF
#_06E898: BEQ .overworld

;---------------------------------------------------------------------------------------------------

.underworld
#_06E89A: LDA.b $02
#_06E89C: AND.w #$01FF

#_06E89F: LSR A
#_06E8A0: LSR A
#_06E8A1: LSR A

#_06E8A2: STA.b $04

#_06E8A4: LDA.b $00
#_06E8A6: AND.w #$01F8

#_06E8A9: ASL A
#_06E8AA: ASL A
#_06E8AB: ASL A

#_06E8AC: CLC
#_06E8AD: ADC.b $04

#_06E8AF: CLC
#_06E8B0: ADC.b $05

#_06E8B2: PHX

#_06E8B3: TAX

#_06E8B4: LDA.l $7F2000,X

#_06E8B8: PLX

#_06E8B9: SEP #$30

#_06E8BB: STA.w $0FA5

#_06E8BE: RTS

;---------------------------------------------------------------------------------------------------

.overworld
#_06E8BF: LDA.b $02
#_06E8C1: LSR A
#_06E8C2: LSR A
#_06E8C3: LSR A
#_06E8C4: STA.b $02

#_06E8C6: SEP #$10

#_06E8C8: PHX
#_06E8C9: PHY

#_06E8CA: JSL Overworld_GetTileTypeAtLocation

#_06E8CE: SEP #$30

#_06E8D0: STA.w $0FA5

#_06E8D3: PLY
#_06E8D4: PLX

#_06E8D5: RTS

;===================================================================================================

pool Sprite_CheckSlopedTileCollision

.angle
#_06E8D6: db $07, $06, $05, $04, $03, $02, $01, $00
#_06E8DE: db $00, $01, $02, $03, $04, $05, $06, $07

#_06E8E6: db $00, $01, $02, $03, $04, $05, $06, $07
#_06E8EE: db $07, $06, $05, $04, $03, $02, $01, $00

pool off

;---------------------------------------------------------------------------------------------------

Sprite_CheckSlopedTileCollision_long:
#_06E8F6: PHB
#_06E8F7: PHK
#_06E8F8: PLB

#_06E8F9: JSR Sprite_CheckSlopedTileCollision

#_06E8FC: PLB

#_06E8FD: RTL

;===================================================================================================

Sprite_CheckSlopedTileCollision:
#_06E8FE: LDA.b $00
#_06E900: AND.b #$07
#_06E902: STA.b $04

#_06E904: LDA.b $02
#_06E906: AND.b #$07
#_06E908: STA.b $05

#_06E90A: LDA.w $0FA5
#_06E90D: SEC
#_06E90E: SBC.b #$10
#_06E910: STA.b $06

#_06E912: ASL A
#_06E913: ASL A
#_06E914: ASL A

#_06E915: CLC
#_06E916: ADC.b $05
#_06E918: TAY

#_06E919: LDA.b $06
#_06E91B: CMP.b #$02
#_06E91D: BCC .flip_comparison

#_06E91F: LDA.b $04
#_06E921: CMP.w .angle,Y
#_06E924: BRA .exit

;---------------------------------------------------------------------------------------------------

.flip_comparison
#_06E926: LDA.w .angle,Y
#_06E929: CMP.b $04

.exit
#_06E92B: RTS

;===================================================================================================

Sprite_Move_XY_Bank06:
#_06E92C: JSR Sprite_Move_X_Bank06

#_06E92F: JMP.w Sprite_Move_Y_Bank06

;---------------------------------------------------------------------------------------------------

Sprite_Move_X_Bank06:
#_06E932: TXA
#_06E933: CLC
#_06E934: ADC.b #$10
#_06E936: TAX

#_06E937: JSR Sprite_Move_Y_Bank06

#_06E93A: LDX.w $0FA0

#_06E93D: RTS

;===================================================================================================

Sprite_Move_Y_Bank06:
#_06E93E: LDA.w $0D40,X
#_06E941: BEQ .exit

#_06E943: ASL A
#_06E944: ASL A
#_06E945: ASL A
#_06E946: ASL A

#_06E947: CLC
#_06E948: ADC.w $0D60,X
#_06E94B: STA.w $0D60,X

#_06E94E: LDA.w $0D40,X
#_06E951: PHP

#_06E952: LSR A
#_06E953: LSR A
#_06E954: LSR A
#_06E955: LSR A

#_06E956: LDY.b #$00

#_06E958: PLP
#_06E959: BPL .positive_velocity

#_06E95B: ORA.b #$F0
#_06E95D: DEY

.positive_velocity
#_06E95E: ADC.w $0D00,X
#_06E961: STA.w $0D00,X

#_06E964: TYA
#_06E965: ADC.w $0D20,X
#_06E968: STA.w $0D20,X

.exit
#_06E96B: RTS

;===================================================================================================

Sprite_Move_Z_Bank06:
#_06E96C: LDA.w $0F80,X

#_06E96F: ASL A
#_06E970: ASL A
#_06E971: ASL A
#_06E972: ASL A

#_06E973: CLC
#_06E974: ADC.w $0F90,X
#_06E977: STA.w $0F90,X

#_06E97A: LDA.w $0F80,X
#_06E97D: PHP

#_06E97E: LSR A
#_06E97F: LSR A
#_06E980: LSR A
#_06E981: LSR A

#_06E982: PLP
#_06E983: BPL .positive_velocity

#_06E985: ORA.b #$F0

.positive_velocity
#_06E987: ADC.w $0F70,X
#_06E98A: STA.w $0F70,X

#_06E98D: RTS

;===================================================================================================

Sprite_ProjectSpeedTowardsLink_instant_exit:
#_06E98E: STZ.b $00

#_06E990: RTS

;---------------------------------------------------------------------------------------------------

Sprite_ProjectSpeedTowardsLink:
#_06E991: STA.b $01

#_06E993: CMP.b #$00
#_06E995: BEQ .instant_exit

#_06E997: PHX
#_06E998: PHY

#_06E999: JSR Sprite_IsBelowLink
#_06E99C: STY.b $02

#_06E99E: LDA.b $0E
#_06E9A0: BPL .positive_y

#_06E9A2: EOR.b #$FF
#_06E9A4: INC A

.positive_y
#_06E9A5: STA.b $0C

;---------------------------------------------------------------------------------------------------

#_06E9A7: JSR Sprite_IsRightOfLink
#_06E9AA: STY.b $03

#_06E9AC: LDA.b $0F
#_06E9AE: BPL .positive_x

#_06E9B0: EOR.b #$FF
#_06E9B2: INC A

.positive_x
#_06E9B3: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_06E9B5: LDY.b #$00

#_06E9B7: LDA.b $0D
#_06E9B9: CMP.b $0C
#_06E9BB: BCS .x_is_bigger

#_06E9BD: INY

#_06E9BE: PHA

#_06E9BF: LDA.b $0C
#_06E9C1: STA.b $0D

#_06E9C3: PLA
#_06E9C4: STA.b $0C

.x_is_bigger
#_06E9C6: STZ.b $0B
#_06E9C8: STZ.b $00

#_06E9CA: LDX.b $01

;---------------------------------------------------------------------------------------------------

.next
#_06E9CC: LDA.b $0B
#_06E9CE: CLC
#_06E9CF: ADC.b $0C
#_06E9D1: CMP.b $0D
#_06E9D3: BCC .dont_accumulate

#_06E9D5: SBC.b $0D
#_06E9D7: INC.b $00

.dont_accumulate
#_06E9D9: STA.b $0B

#_06E9DB: DEX
#_06E9DC: BNE .next

;---------------------------------------------------------------------------------------------------

#_06E9DE: TYA
#_06E9DF: BEQ .dont_flip_axes

#_06E9E1: LDA.b $00
#_06E9E3: PHA

#_06E9E4: LDA.b $01
#_06E9E6: STA.b $00

#_06E9E8: PLA
#_06E9E9: STA.b $01

.dont_flip_axes
#_06E9EB: LDA.b $00
#_06E9ED: LDY.b $02
#_06E9EF: BEQ .sign_correct_y

#_06E9F1: EOR.b #$FF
#_06E9F3: INC A
#_06E9F4: STA.b $00

.sign_correct_y
#_06E9F6: LDA.b $01
#_06E9F8: LDY.b $03
#_06E9FA: BEQ .sign_correct_x

#_06E9FC: EOR.b #$FF
#_06E9FE: INC A
#_06E9FF: STA.b $01

.sign_correct_x
#_06EA01: PLY
#_06EA02: PLX

#_06EA03: RTS

;===================================================================================================

Sprite_ApplySpeedTowardsLink:
#_06EA04: JSR Sprite_ProjectSpeedTowardsLink

#_06EA07: LDA.b $00
#_06EA09: STA.w $0D40,X

#_06EA0C: LDA.b $01
#_06EA0E: STA.w $0D50,X

#_06EA11: RTS

;===================================================================================================

Sprite_ApplySpeedTowardsLink_long:
#_06EA12: PHB
#_06EA13: PHK
#_06EA14: PLB

#_06EA15: JSR Sprite_ApplySpeedTowardsLink

#_06EA18: PLB

#_06EA19: RTL

;===================================================================================================

Sprite_ProjectSpeedTowardsLink_long:
#_06EA1A: PHB
#_06EA1B: PHK
#_06EA1C: PLB

#_06EA1D: JSR Sprite_ProjectSpeedTowardsLink

#_06EA20: PLB

#_06EA21: RTL

;===================================================================================================

Sprite_ProjectSpeedTowardsLocation_long:
#_06EA22: PHB
#_06EA23: PHK
#_06EA24: PLB

#_06EA25: JSR Sprite_ProjectSpeedTowardsLocation

#_06EA28: PLB

#_06EA29: RTL

;===================================================================================================

Sprite_ProjectSpeedTowardsLocation_fastexit:
#_06EA2A: STZ.b $00

#_06EA2C: RTS

;---------------------------------------------------------------------------------------------------

Sprite_ProjectSpeedTowardsLocation:
#_06EA2D: STA.b $01

#_06EA2F: CMP.b #$00
#_06EA31: BEQ .fastexit

#_06EA33: PHX
#_06EA34: PHY

#_06EA35: JSR Sprite_IsBelowLocation
#_06EA38: STY.b $02

#_06EA3A: LDA.b $0E
#_06EA3C: BPL .positive_y

#_06EA3E: EOR.b #$FF
#_06EA40: INC A

.positive_y
#_06EA41: STA.b $0C

;---------------------------------------------------------------------------------------------------

#_06EA43: JSR Sprite_IsRightOfLocation
#_06EA46: STY.b $03

#_06EA48: LDA.b $0F
#_06EA4A: BPL .positive_x

#_06EA4C: EOR.b #$FF
#_06EA4E: INC A

.positive_x
#_06EA4F: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_06EA51: LDY.b #$00

#_06EA53: LDA.b $0D
#_06EA55: CMP.b $0C
#_06EA57: BCS .x_is_bigger

#_06EA59: INY

#_06EA5A: PHA

#_06EA5B: LDA.b $0C
#_06EA5D: STA.b $0D

#_06EA5F: PLA
#_06EA60: STA.b $0C

.x_is_bigger
#_06EA62: STZ.b $0B
#_06EA64: STZ.b $00

#_06EA66: LDX.b $01

;---------------------------------------------------------------------------------------------------

.next
#_06EA68: LDA.b $0B
#_06EA6A: CLC
#_06EA6B: ADC.b $0C

#_06EA6D: CMP.b $0D
#_06EA6F: BCC .dont_accumulate

#_06EA71: SBC.b $0D
#_06EA73: INC.b $00

.dont_accumulate
#_06EA75: STA.b $0B

#_06EA77: DEX
#_06EA78: BNE .next

;---------------------------------------------------------------------------------------------------

#_06EA7A: TYA
#_06EA7B: BEQ .x_was_bigger

#_06EA7D: LDA.b $00
#_06EA7F: PHA

#_06EA80: LDA.b $01
#_06EA82: STA.b $00

#_06EA84: PLA
#_06EA85: STA.b $01

;---------------------------------------------------------------------------------------------------

.x_was_bigger
#_06EA87: LDA.b $00
#_06EA89: LDY.b $02
#_06EA8B: BEQ .sign_correct_y

#_06EA8D: EOR.b #$FF
#_06EA8F: INC A
#_06EA90: STA.b $00

.sign_correct_y
#_06EA92: LDA.b $01
#_06EA94: LDY.b $03
#_06EA96: BEQ .sign_correct_x

#_06EA98: EOR.b #$FF
#_06EA9A: INC A
#_06EA9B: STA.b $01

.sign_correct_x
#_06EA9D: PLY
#_06EA9E: PLX

#_06EA9F: RTS

;===================================================================================================

Sprite_DirectionToFaceLink_long:
#_06EAA0: JSR Sprite_DirectionToFaceLink

#_06EAA3: RTL

;===================================================================================================

Sprite_DirectionToFaceLink:
#_06EAA4: JSR Sprite_IsRightOfLink
#_06EAA7: STY.b $00

#_06EAA9: JSR Sprite_IsBelowLink
#_06EAAC: STY.b $01

#_06EAAE: LDA.b $0E
#_06EAB0: BPL .positive_y

#_06EAB2: EOR.b #$FF
#_06EAB4: INC A

.positive_y
#_06EAB5: STA.w $0FB5

#_06EAB8: LDA.b $0F
#_06EABA: BPL .positive_x

#_06EABC: EOR.b #$FF
#_06EABE: INC A

.positive_x
#_06EABF: CMP.w $0FB5
#_06EAC2: BCC .use_x_axis

.use_y_axis
#_06EAC4: LDY.b $00

#_06EAC6: RTS

;---------------------------------------------------------------------------------------------------

.use_x_axis
#_06EAC7: LDA.b $01
#_06EAC9: INC A
#_06EACA: INC A
#_06EACB: TAY

#_06EACC: RTS

;===================================================================================================

Sprite_IsRightOfLink_long:
#_06EACD: JSR Sprite_IsRightOfLink

#_06EAD0: RTL

;===================================================================================================

Sprite_IsRightOfLink:
#_06EAD1: LDY.b #$00

#_06EAD3: LDA.b $22
#_06EAD5: SEC
#_06EAD6: SBC.w $0D10,X
#_06EAD9: STA.b $0F

#_06EADB: LDA.b $23
#_06EADD: SBC.w $0D30,X
#_06EAE0: BPL .exit

#_06EAE2: INY

.exit
#_06EAE3: RTS

;===================================================================================================

Sprite_IsBelowLink_long:
#_06EAE4: JSR Sprite_IsBelowLink

#_06EAE7: RTL

;===================================================================================================

Sprite_IsBelowLink: 
#_06EAE8: LDY.b #$00

#_06EAEA: LDA.b $20
#_06EAEC: CLC
#_06EAED: ADC.b #$08
#_06EAEF: PHP

#_06EAF0: CLC
#_06EAF1: ADC.w $0F70,X

#_06EAF4: PHP

#_06EAF5: SEC
#_06EAF6: SBC.w $0D00,X
#_06EAF9: STA.b $0E

#_06EAFB: LDA.b $21
#_06EAFD: SBC.w $0D20,X

#_06EB00: PLP
#_06EB01: ADC.b #$00

#_06EB03: PLP
#_06EB04: ADC.b #$00
#_06EB06: BPL .exit

#_06EB08: INY

.exit
#_06EB09: RTS

;===================================================================================================

Sprite_IsRightOfLocation:
#_06EB0A: LDY.b #$00

#_06EB0C: LDA.b $04
#_06EB0E: SEC
#_06EB0F: SBC.w $0D10,X
#_06EB12: STA.b $0F

#_06EB14: LDA.b $05
#_06EB16: SBC.w $0D30,X
#_06EB19: BPL .exit

#_06EB1B: INY

.exit
#_06EB1C: RTS

;===================================================================================================

Sprite_IsBelowLocation:
#_06EB1D: LDY.b #$00

#_06EB1F: LDA.b $06
#_06EB21: SEC
#_06EB22: SBC.w $0D00,X
#_06EB25: STA.b $0E

#_06EB27: LDA.b $07
#_06EB29: SBC.w $0D20,X
#_06EB2C: BPL .exit

#_06EB2E: INY

.exit
#_06EB2F: RTS

;===================================================================================================

Sprite_DirectionToFaceLocation:
#_06EB30: PHB
#_06EB31: PHK
#_06EB32: PLB

#_06EB33: JSR Sprite_IsRightOfLocation
#_06EB36: STY.b $00

#_06EB38: JSR Sprite_IsBelowLocation
#_06EB3B: STY.b $01

#_06EB3D: LDA.b $0E
#_06EB3F: BPL .positive_y

#_06EB41: EOR.b #$FF
#_06EB43: INC A

.positive_y
#_06EB44: STA.w $0FB5

#_06EB47: LDA.b $0F
#_06EB49: BPL .positive_x

#_06EB4B: EOR.b #$FF
#_06EB4D: INC A

.positive_x
#_06EB4E: CMP.w $0FB5
#_06EB51: BCC .use_x_axis

.use_y_axis
#_06EB53: LDY.b $00

#_06EB55: PLB

#_06EB56: RTL

;---------------------------------------------------------------------------------------------------

.use_x_axis
#_06EB57: LDA.b $01
#_06EB59: INC A
#_06EB5A: INC A
#_06EB5B: TAY

#_06EB5C: PLB

#_06EB5D: RTL

;===================================================================================================

Guard_ParrySwordAttacks:
#_06EB5E: PHB
#_06EB5F: PHK
#_06EB60: PLB

#_06EB61: JSR .main

#_06EB64: PLB

#_06EB65: RTL

;---------------------------------------------------------------------------------------------------

.recoil_timer_guard
#_06EB66: db 15, 15, 24, 15
#_06EB6A: db 15, 19, 15, 15

.recoil_timer_link
#_06EB6E: db  6,  6,  6, 12
#_06EB72: db  6,  6,  6, 15

;---------------------------------------------------------------------------------------------------

.main
#_06EB76: LDA.b $EE
#_06EB78: CMP.w $0F20,X
#_06EB7B: BNE .different_layer

#_06EB7D: LDA.b $46
#_06EB7F: ORA.b $4D

.different_layer
#_06EB81: BNE .exit_a

#_06EB83: LDA.w $0EF0,X
#_06EB86: BMI .exit_a

;---------------------------------------------------------------------------------------------------

#_06EB88: JSR Sprite_DoHitboxesFast

#_06EB8B: LDA.w $037A
#_06EB8E: AND.b #$10
#_06EB90: BNE .fail_now

#_06EB92: LDA.b $44
#_06EB94: CMP.b #$80
#_06EB96: BEQ .fail_now

#_06EB98: JSR SetupActionHitbox

#_06EB9B: LDA.b $3C
#_06EB9D: BMI .continue

#_06EB9F: JSR CheckIfHitBoxesOverlap
#_06EBA2: BCC .continue

#_06EBA4: LDA.w $0E20,X
#_06EBA7: CMP.b #$6A ; SPRITE 6A
#_06EBA9: BEQ .is_bnc

#_06EBAB: JSL GetRandomNumber
#_06EBAF: AND.b #$07
#_06EBB1: TAY

#_06EBB2: LDA.w .recoil_timer_guard,Y
#_06EBB5: STA.w $0EA0,X

;---------------------------------------------------------------------------------------------------

.is_bnc
#_06EBB8: JSL GetRandomNumber
#_06EBBC: AND.b #$07
#_06EBBE: TAY

#_06EBBF: LDA.w .recoil_timer_link,Y
#_06EBC2: STA.b $46

#_06EBC4: LDA.b #$18

#_06EBC6: LDY.b $3C
#_06EBC8: CPY.b #$09
#_06EBCA: BPL .not_a_poke_a

#_06EBCC: LDA.b #$20

.not_a_poke_a
#_06EBCE: JSR Sprite_ProjectSpeedTowardsLink

#_06EBD1: LDA.b $00
#_06EBD3: EOR.b #$FF
#_06EBD5: INC A
#_06EBD6: STA.w $0F30,X

#_06EBD9: LDA.b $01
#_06EBDB: EOR.b #$FF
#_06EBDD: INC A
#_06EBDE: STA.w $0F40,X

#_06EBE1: LDA.b #$10

#_06EBE3: LDY.b $3C
#_06EBE5: CPY.b #$09
#_06EBE7: BPL .not_a_poke_b

#_06EBE9: LDA.b #$08

.not_a_poke_b
#_06EBEB: JSR Sprite_ApplyRecoilToLink
#_06EBEE: JSR Link_PlaceWeaponTink

#_06EBF1: LDA.b #$90
#_06EBF3: STA.b $47

.exit_a
#_06EBF5: RTS

;===================================================================================================

.continue
#_06EBF6: JSR Sprite_SetupHitBox
#_06EBF9: JSR CheckIfHitBoxesOverlap
#_06EBFC: BCS Sprite_AttemptZapDamage

.fail_now
#_06EBFE: JML Sprite_AttemptDamageToLinkWithCollisionCheck

;===================================================================================================

Sprite_AttemptZapDamage:
#_06EC02: LDA.w $0E20,X

#_06EC05: CMP.b #$7A ; SPRITE 7A
#_06EC07: BEQ .get_zapped

#_06EC09: CMP.b #$0D ; SPRITE 0D
#_06EC0B: BNE .not_buzzblob

#_06EC0D: LDA.l $7EF359
#_06EC11: CMP.b #$04
#_06EC13: BCC .get_zapped

.not_buzzblob
#_06EC15: CMP.b #$24 ; SPRITE 24
#_06EC17: BEQ .blue_baritone_saxamaphone

#_06EC19: CMP.b #$23 ; SPRITE 23
#_06EC1B: BNE .no_damage

.blue_baritone_saxamaphone
#_06EC1D: LDA.w $0DF0,X
#_06EC20: BEQ .no_damage

;---------------------------------------------------------------------------------------------------

.get_zapped
#_06EC22: LDA.w $0DD0,X
#_06EC25: CMP.b #$09
#_06EC27: BNE .no_damage

#_06EC29: LDA.w $031F
#_06EC2C: BNE .exit

#_06EC2E: LDA.b #$40
#_06EC30: STA.w $0E00,X

#_06EC33: STA.w $0360

#_06EC36: JSR Sprite_AttemptDamageToLinkPlusRecoil

.exit
#_06EC39: RTS

;---------------------------------------------------------------------------------------------------

.no_damage
#_06EC3A: LDA.b #$50

#_06EC3C: LDY.b $3C
#_06EC3E: CPY.b #$09
#_06EC40: BMI .not_charged

#_06EC42: LDA.b #$40

.not_charged
#_06EC44: JSR Sprite_ProjectSpeedTowardsLink

#_06EC47: LDA.b $00
#_06EC49: EOR.b #$FF
#_06EC4B: INC A
#_06EC4C: STA.w $0F30,X

#_06EC4F: LDA.b $01
#_06EC51: EOR.b #$FF
#_06EC53: INC A
#_06EC54: STA.w $0F40,X

#_06EC57: JSL Sprite_CalculateSwordDamage

#_06EC5B: RTS

;===================================================================================================

Medallion_CheckSpriteDamage:
#_06EC5C: LDA.w $0C4A,X
#_06EC5F: STA.w $0FB5

#_06EC62: LDX.b #$0F

.next
#_06EC64: LDA.w $0DD0,X
#_06EC67: CMP.b #$09
#_06EC69: BCC .skip

#_06EC6B: LDA.w $0BA0,X
#_06EC6E: ORA.w $0F00,X
#_06EC71: BNE .skip

#_06EC73: LDA.w $0FB5
#_06EC76: JSL Ancilla_CheckDamageToSprite_aggressive

.skip
#_06EC7A: DEX
#_06EC7B: BPL .next

#_06EC7D: RTL

;===================================================================================================

AncillaDamageClasses:
#_06EC7E: db $06 ; NOTHING
#_06EC7F: db $01 ; SOMARIA BULLET
#_06EC80: db $0B ; FIRE ROD SHOT
#_06EC81: db $00 ; UNUSED
#_06EC82: db $00 ; BEAM HIT
#_06EC83: db $00 ; BOOMERANG
#_06EC84: db $00 ; WALL HIT
#_06EC85: db $08 ; BOMB
#_06EC86: db $00 ; DOOR DEBRIS
#_06EC87: db $06 ; ARROW
#_06EC88: db $00 ; ARROW IN THE WALL
#_06EC89: db $0C ; ICE ROD SHOT
#_06EC8A: db $01 ; SWORD BEAM_BOUNCE
#_06EC8B: db $00 ; SPIN ATTACK FULL CHARGE SP
#_06EC8C: db $00 ; BLAST WALL EXPLOSION
#_06EC8D: db $00 ; BLAST WALL EXPLOSION
#_06EC8E: db $00 ; BLAST WALL EXPLOSION
#_06EC8F: db $01 ; ICE ROD WALL HIT
#_06EC90: db $00 ; BLAST WALL EXPLOSION
#_06EC91: db $00 ; ICE ROD SPARKLE
#_06EC92: db $00 ; BAD POINTER
#_06EC93: db $00 ; SPLASH
#_06EC94: db $00 ; HIT STARS
#_06EC95: db $00 ; SHOVEL DIRT
#_06EC96: db $0E ; ETHER SPELL
#_06EC97: db $0D ; BOMBOS SPELL
#_06EC98: db $00 ; POWDER DUST
#_06EC99: db $00 ; SWORD WALL HIT
#_06EC9A: db $0F ; QUAKE SPELL
#_06EC9B: db $00 ; SCREEN SHAKE
#_06EC9C: db $00 ; DASH DUST
#_06EC9D: db $07 ; HOOKSHOT
#_06EC9E: db $01 ; BLANKET
#_06EC9F: db $01 ; SNORE
#_06ECA0: db $01 ; ITEM GET
#_06ECA1: db $01 ; LINK POOF
#_06ECA2: db $01 ; GRAVESTONE
#_06ECA3: db $01 ; BAD POINTER
#_06ECA4: db $01 ; SWORD SWING SPARKLE
#_06ECA5: db $01 ; DUCK
#_06ECA6: db $01 ; WISH POND ITEM
#_06ECA7: db $01 ; MILESTONE ITEM GET
#_06ECA8: db $01 ; SPIN ATTACK SPARKLE A
#_06ECA9: db $01 ; SPIN ATTACK SPARKLE B
#_06ECAA: db $01 ; SOMARIA BLOCK
#_06ECAB: db $01 ; SOMARIA BLOCK FIZZ
#_06ECAC: db $01 ; SOMARIA BLOCK FISSION
#_06ECAD: db $0B ; LAMP FLAME
#_06ECAE: db $00 ; BYRNA WINDUP SPARK
#_06ECAF: db $01 ; BYRNA SPARK
#_06ECB0: db $01 ; BLAST WALL FIREBALL
#_06ECB1: db $01 ; BLAST WALL EXPLOSION
#_06ECB2: db $01 ; SKULL WOODS FIRE
#_06ECB3: db $01 ; MASTER SWORD GET
#_06ECB4: db $01 ; FLUTE
#_06ECB5: db $01 ; WEATHERVANE EXPLOSION
#_06ECB6: db $01 ; CUTSCENE DUCK

;===================================================================================================

Ancilla_CheckDamageToSprite:
#_06ECB7: LDY.w $0EF0,X
#_06ECBA: BPL Ancilla_CheckDamageToSprite_aggressive

#_06ECBC: RTL

;===================================================================================================

Ancilla_CheckDamageToSprite_aggressive:
#_06ECBD: PHX

#_06ECBE: TAX
#_06ECBF: LDA.l AncillaDamageClasses,X

#_06ECC3: PLX

#_06ECC4: CMP.b #$06
#_06ECC6: BNE Ancilla_CheckDamageToSprite_preset

#_06ECC8: PHA

#_06ECC9: LDA.l $7EF340
#_06ECCD: CMP.b #$03

#_06ECCF: PLA
#_06ECD0: BCC Ancilla_CheckDamageToSprite_preset

#_06ECD2: LDA.w $0E20,X
#_06ECD5: CMP.b #$D7 ; SPRITE D7
#_06ECD7: BNE .not_ganon

#_06ECD9: LDA.b #$20
#_06ECDB: STA.w $0F10,X

.not_ganon
#_06ECDE: LDA.b #$09

;===================================================================================================

#Ancilla_CheckDamageToSprite_preset:
#_06ECE0: CMP.b #$0F
#_06ECE2: BNE .not_quake_against_airborne

#_06ECE4: LDY.w $0F70,X
#_06ECE7: BEQ .not_quake_against_airborne

#_06ECE9: RTL

;---------------------------------------------------------------------------------------------------

.not_quake_against_airborne
#_06ECEA: CMP.b #$00
#_06ECEC: BEQ .not_airborne

#_06ECEE: CMP.b #$07
#_06ECF0: BNE .apply

;---------------------------------------------------------------------------------------------------

.not_airborne
#_06ECF2: JSL .apply

#_06ECF6: LDA.w $0CE2,X
#_06ECF9: BNE .exit

#_06ECFB: LDA.w $0FAC
#_06ECFE: BNE .exit

#_06ED00: LDA.b #$05
#_06ED02: STA.w $0FAC

#_06ED05: LDY.w $0FB6

#_06ED08: LDA.w $0C04,Y
#_06ED0B: ADC.b #$04
#_06ED0D: STA.w $0FAD

#_06ED10: LDA.w $0BFA,Y
#_06ED13: STA.w $0FAE

#_06ED16: LDA.b $EE
#_06ED18: STA.w $0B68

#_06ED1B: STZ.w $012E

#_06ED1E: LDA.b #$05 ; SFX2.05
#_06ED20: JSL SpriteSFX_QueueSFX2WithPan

.exit
#_06ED24: RTL

;---------------------------------------------------------------------------------------------------

.apply
#_06ED25: STA.w $0CF2

#_06ED28: TAY

#_06ED29: LDA.b #$20

#_06ED2B: CPY.b #$08
#_06ED2D: BNE .not_bomb_damage

#_06ED2F: LDA.b #$35

.not_bomb_damage
#_06ED31: BRA Sprite_ApplyCalculatedDamage

;===================================================================================================

pool Sprite_CalculateSwordDamage

.damage_class
#_06ED33: db $01, $02, $03, $04 ; slash/dash
#_06ED37: db $02, $03, $04, $05 ; spin
#_06ED3B: db $01, $01, $02, $03 ; poke

pool off

;---------------------------------------------------------------------------------------------------

Sprite_CalculateSwordDamage:
#_06ED3F: LDA.w $0E60,X
#_06ED42: AND.b #$40
#_06ED44: BEQ .vulnerable_to_sword

#_06ED46: RTL

;---------------------------------------------------------------------------------------------------

.vulnerable_to_sword
#_06ED47: LDA.w $0372
#_06ED4A: STA.l $7FFA4C,X

#_06ED4E: PHX

#_06ED4F: LDA.l $7EF359
#_06ED53: DEC A

#_06ED54: LDX.w $0372
#_06ED57: BNE .set_damage_class

#_06ED59: BRA .check_if_spinning

.spinning
#_06ED5B: ORA.b #$04
#_06ED5D: BRA .set_damage_class

.check_if_spinning
#_06ED5F: LDX.b $3C
#_06ED61: BMI .spinning

#_06ED63: CPX.b #$09
#_06ED65: BMI .set_damage_class

#_06ED67: ORA.b #$08

.set_damage_class
#_06ED69: TAX

#_06ED6A: LDA.l .damage_class,X
#_06ED6E: STA.w $0CF2

#_06ED71: LDA.w $0301
#_06ED74: AND.b #$0A
#_06ED76: BEQ .not_hammer

#_06ED78: LDA.b #$03
#_06ED7A: STA.w $0CF2

.not_hammer
#_06ED7D: LDA.b #$04
#_06ED7F: STA.w $02E3

#_06ED82: PLX

#_06ED83: LDA.b #$10
#_06ED85: STA.b $47

#_06ED87: LDA.b #$9D

;===================================================================================================

Sprite_ApplyCalculatedDamage:
#_06ED89: STA.b $00

#_06ED8B: STZ.w $0CF3

#_06ED8E: LDA.w $0E60,X
#_06ED91: AND.b #$40
#_06ED93: BNE .exit_a

#_06ED95: LDA.b #$00
#_06ED97: XBA

#_06ED98: LDA.w $0E20,X
#_06ED9B: CMP.b #$D8 ; SPRITE D8
#_06ED9D: BCC .not_absorbable

.exit_a
#_06ED9F: RTL

;---------------------------------------------------------------------------------------------------

.not_absorbable
#_06EDA0: REP #$20

#_06EDA2: ASL A
#_06EDA3: ASL A
#_06EDA4: ASL A
#_06EDA5: ASL A

#_06EDA6: ORA.w $0CF2

#_06EDA9: PHX

#_06EDAA: REP #$10

#_06EDAC: TAX

#_06EDAD: SEP #$20

#_06EDAF: LDA.l $7F6000,X
#_06EDB3: STA.b $02

#_06EDB5: SEP #$10

#_06EDB7: LDA.w $0CF2
#_06EDBA: ASL A
#_06EDBB: ASL A
#_06EDBC: ASL A
#_06EDBD: ORA.b $02
#_06EDBF: TAX

#_06EDC0: LDA.l DamageSubclassValue,X

#_06EDC4: PLX

;===================================================================================================

#AgahnimBalls_DamageAgahnim:
#_06EDC5: CMP.b #$F9
#_06EDC7: BNE .dont_fairyize

#_06EDC9: LDA.b #$E3 ; SPRITE E3

;---------------------------------------------------------------------------------------------------

.transmute_to_sprite
#_06EDCB: STA.w $0E20,X

#_06EDCE: JSL SpritePrep_LoadProperties
#_06EDD2: JSL Sprite_SpawnPoofGarnish

#_06EDD6: STZ.w $012F

#_06EDD9: LDA.b #$32 ; SFX3.32
#_06EDDB: JSL SpriteSFX_QueueSFX3WithPan

#_06EDDF: JMP.w .clear_queued_damage

;---------------------------------------------------------------------------------------------------

.dont_fairyize
#_06EDE2: CMP.b #$FA
#_06EDE4: BNE .dont_blobbify

#_06EDE6: LDA.b #$8F ; SPRITE 8F
#_06EDE8: JSL .transmute_to_sprite

#_06EDEC: LDA.b #$02
#_06EDEE: STA.w $0D80,X

#_06EDF1: LDA.b #$20
#_06EDF3: STA.w $0F80,X

#_06EDF6: LDA.b #$08
#_06EDF8: STA.w $0F50,X

#_06EDFB: STZ.w $0EA0,X
#_06EDFE: STZ.w $0EF0,X
#_06EE01: STZ.w $0E50,X

#_06EE04: LDA.b #$01
#_06EE06: STA.w $0CD2,X

#_06EE09: STA.w $0BE0,X

#_06EE0C: RTL

;---------------------------------------------------------------------------------------------------

.dont_blobbify
#_06EE0D: CMP.w $0CE2,X
#_06EE10: BCC .new_damage_less

#_06EE12: STA.w $0CE2,X

.new_damage_less
#_06EE15: CMP.b #$00
#_06EE17: BNE .non_zero_damage

#_06EE19: LDA.w $0CF2
#_06EE1C: CMP.b #$0A
#_06EE1E: BEQ .powder_damage

#_06EE20: LDA.w $0B6B,X
#_06EE23: AND.b #$04
#_06EE25: BNE .early_phase_helma

#_06EE27: STZ.w $02E3

.powder_damage
#_06EE2A: JMP.w .clear_queued_damage

.non_zero_damage
#_06EE2D: CMP.b #$FE
#_06EE2F: BCC .sub_frozen

#_06EE31: LDA.w $0DD0,X
#_06EE34: CMP.b #$0B
#_06EE36: BEQ .powder_damage

.sub_frozen
#_06EE38: LDA.w $0E20,X
#_06EE3B: CMP.b #$9A ; SPRITE 9A
#_06EE3D: BNE .dont_reset_kyameron

#_06EE3F: LDY.w $0CE2,X
#_06EE42: CPY.b #$F0
#_06EE44: BCS .dont_reset_kyameron

#_06EE46: LDA.b #$09
#_06EE48: STA.w $0DD0,X

#_06EE4B: LDA.b #$04
#_06EE4D: STA.w $0D80,X

#_06EE50: LDA.b #$0F
#_06EE52: STA.w $0DF0,X

#_06EE55: LDA.b #$28 ; SFX2.28
#_06EE57: JSL SpriteSFX_QueueSFX2WithPan

#_06EE5B: RTL

;---------------------------------------------------------------------------------------------------

.dont_reset_kyameron
#_06EE5C: CMP.b #$1B ; SPRITE 1B
#_06EE5E: BNE .not_arrow

;===================================================================================================

#SpriteArrow_Break:
#_06EE60: LDA.b #$05 ; SFX2.05
#_06EE62: JSL SpriteSFX_QueueSFX2WithPan

#_06EE66: JSR Sprite_ScheduleForBreakage
#_06EE69: JSL Sprite_PlaceWeaponTink

#_06EE6D: RTL

;===================================================================================================

.not_arrow
#_06EE6E: PHA

#_06EE6F: LDA.b $00
#_06EE71: STA.w $0EF0,X

#_06EE74: PLA
#_06EE75: CMP.b #$92 ; SPRITE 92
#_06EE77: BNE .not_king_helma

#_06EE79: LDA.w $0DB0,X
#_06EE7C: CMP.b #$03
#_06EE7E: BCC .early_phase_helma

;---------------------------------------------------------------------------------------------------

.not_king_helma
#_06EE80: LDY.b #$21 ; SFX3.21

#_06EE82: LDA.w $0B6B,X
#_06EE85: AND.b #$02
#_06EE87: BNE .set_damage_sfx

#_06EE89: LDY.b #$08 ; SFX3.08

#_06EE8B: LDA.w $0BE0,X
#_06EE8E: AND.b #$10
#_06EE90: BEQ .set_damage_sfx

#_06EE92: LDY.b #$1C ; SFX3.1C

.set_damage_sfx
#_06EE94: STY.b $01

#_06EE96: JSL Sprite_CalculateSFXPan
#_06EE9A: ORA.b $01
#_06EE9C: STA.w $012F

;---------------------------------------------------------------------------------------------------

.early_phase_helma
#_06EE9F: LDA.b #$00

#_06EEA1: LDY.w $0CF2
#_06EEA4: CPY.b #$0D
#_06EEA6: BCS .set_iframe_timer

#_06EEA8: LDY.w $0E20,X

#_06EEAB: LDA.b #$14

#_06EEAD: CPY.b #$09 ; SPRITE 09
#_06EEAF: BEQ .set_iframe_timer

#_06EEB1: LDA.b #$0F
#_06EEB3: CPY.b #$53 ; SPRITE 53
#_06EEB5: BEQ .eleven_frames_of_armos

#_06EEB7: CPY.b #$18 ; SPRITE 18
#_06EEB9: BNE .set_iframe_timer

.eleven_frames_of_armos
#_06EEBB: LDA.b #$0B

.set_iframe_timer
#_06EEBD: STA.w $0EA0,X

#_06EEC0: RTL

;---------------------------------------------------------------------------------------------------

.clear_queued_damage
#_06EEC1: STZ.w $0EF0,X
#_06EEC4: STZ.w $0CE2,X

#_06EEC7: RTL

;===================================================================================================

#Sprite_HandleSpecialHits:
#_06EEC8: LDA.w $0DD0,X
#_06EECB: CMP.b #$09
#_06EECD: BCC .exit_b

#_06EECF: STA.w $0FB5

#_06EED2: LDA.w $0CE2,X
#_06EED5: CMP.b #$FD
#_06EED7: BNE .not_burning

#_06EED9: STZ.w $0CE2,X

#_06EEDC: LDA.b #$09 ; SFX3.09
#_06EEDE: JSL SpriteSFX_QueueSFX3WithPan

#_06EEE2: LDA.b #$07
#_06EEE4: STA.w $0DD0,X

#_06EEE7: LDA.b #$70
#_06EEE9: STA.w $0DF0,X

#_06EEEC: LDA.w $0E40,X
#_06EEEF: INC A
#_06EEF0: INC A
#_06EEF1: STA.w $0E40,X

#_06EEF4: STZ.w $0CE2,X

.exit_b
#_06EEF7: RTS

;---------------------------------------------------------------------------------------------------

.not_burning
#_06EEF8: CMP.b #$FB
#_06EEFA: BCC .transmutation

#_06EEFC: STZ.w $0CE2,X

#_06EEFF: STA.b $00

#_06EF01: LDY.w $0DD0,X
#_06EF04: CPY.b #$0B
#_06EF06: BEQ .exit_b

#_06EF08: LDY.b #$00

#_06EF0A: CMP.b #$FE
#_06EF0C: BNE .not_freeze

#_06EF0E: INY

.not_freeze
#_06EF0F: TYA
#_06EF10: STA.l $7FFA3C,X
#_06EF14: BEQ .sprite_not_frozen

#_06EF16: LDA.w $0CAA,X
#_06EF19: ORA.b #$08
#_06EF1B: STA.w $0CAA,X

#_06EF1E: ASL.w $0BE0,X
#_06EF21: LSR.w $0BE0,X

#_06EF24: LDA.b #$0F ; SFX2.0F
#_06EF26: JSL SpriteSFX_QueueSFX2WithPan

#_06EF2A: LDA.b #$18
#_06EF2C: STA.w $0F80,X

#_06EF2F: ASL.w $0CD2,X
#_06EF32: LSR.w $0CD2,X

#_06EF35: JSR Sprite_ZeroVelocity_XY_Bank06

;---------------------------------------------------------------------------------------------------

.sprite_not_frozen
#_06EF38: LDA.b #$0B
#_06EF3A: STA.w $0DD0,X

#_06EF3D: LDA.b #$40
#_06EF3F: STA.w $0DF0,X

#_06EF42: LDA.b $00
#_06EF44: CLC
#_06EF45: ADC.b #$05
#_06EF47: TAY

#_06EF48: LDA.w .stun_timers,Y
#_06EF4B: STA.w $0B58,X

#_06EF4E: LDA.w $0E20,X
#_06EF51: CMP.b #$23 ; SPRITE 23
#_06EF53: BNE .not_a_red_bari

#_06EF55: INC A
#_06EF56: STA.w $0E20,X

.not_a_red_bari
#_06EF59: JMP.w .exit_c

;---------------------------------------------------------------------------------------------------

.stun_timers
#_06EF5C: db  32 ; 0xFB
#_06EF5D: db 128 ; 0xFC
#_06EF5E: db   0 ; 0xFD
#_06EF5F: db   0 ; 0xFE
#_06EF60: db 255 ; 0xFF

;---------------------------------------------------------------------------------------------------

.transmutation
#_06EF61: LDA.w $0E50,X
#_06EF64: STA.b $00

#_06EF66: SEC
#_06EF67: SBC.w $0CE2,X
#_06EF6A: STA.w $0E50,X

#_06EF6D: STZ.w $0CE2,X

#_06EF70: BEQ .zero_hp_now
#_06EF72: BCS .exit_c

.zero_hp_now
#_06EF74: LDA.w $0CBA,X
#_06EF77: BNE .no_forced_drop

#_06EF79: LDA.w $0DD0,X
#_06EF7C: CMP.b #$0B
#_06EF7E: BNE .not_currently_stunned

#_06EF80: LDA.b #$03
#_06EF82: STA.w $0CBA,X

;---------------------------------------------------------------------------------------------------

.not_currently_stunned
#_06EF85: LDA.l $7FFA4C,X
#_06EF89: BEQ .no_forced_drop

#_06EF8B: LDA.b #$00
#_06EF8D: STA.l $7FFA4C,X

#_06EF91: STZ.w $0BE0,X

.no_forced_drop
#_06EF94: LDY.w $0E20,X
#_06EF97: CPY.b #$1B ; SPRITE 1B
#_06EF99: BEQ .no_arrow_sfx

#_06EF9B: LDA.b #$09 ; SFX3.09
#_06EF9D: JSL SpriteSFX_QueueSFX3WithPan

.no_arrow_sfx
#_06EFA1: CPY.b #$40 ; SPRITE 40
#_06EFA3: BNE .not_aga_barrier

#_06EFA5: PHX

#_06EFA6: LDX.b $8A

#_06EFA8: LDA.l $7EF280,X
#_06EFAC: ORA.b #$40
#_06EFAE: STA.l $7EF280,X

#_06EFB2: PLX

;---------------------------------------------------------------------------------------------------

.not_aga_barrier
#_06EFB3: TYA
#_06EFB4: CMP.b #$EC ; SPRITE EC
#_06EFB6: BNE .not_a_thrown_item

#_06EFB8: LDY.w $0DB0,X
#_06EFBB: CPY.b #$02
#_06EFBD: BNE .exit_c

#_06EFBF: JMP.w ThrowableScenery_TransmuteToDebris

.not_a_thrown_item
#_06EFC2: PHA

#_06EFC3: LDA.w $0DD0,X
#_06EFC6: CMP.b #$0A
#_06EFC8: BNE .not_being_carried

#_06EFCA: STZ.w $0308
#_06EFCD: STZ.w $0309

.not_being_carried
#_06EFD0: LDA.b #$06
#_06EFD2: STA.w $0DD0,X

#_06EFD5: PLA
#_06EFD6: CMP.b #$0C ; SPRITE 0C
#_06EFD8: BNE Sprite_AttemptKillingOfKin

;===================================================================================================

#Sprite_PrepareToDie:
#_06EFDA: LDA.b #$06
#_06EFDC: STA.w $0DD0,X

#_06EFDF: LDA.b #$1F
#_06EFE1: STA.w $0DF0,X

#_06EFE4: JSR Sprite_ChangeOAMAllotmentTo4

;---------------------------------------------------------------------------------------------------

.exit_c
#_06EFE7: RTS

;===================================================================================================

Sprite_AttemptKillingOfKin:
#_06EFE8: CMP.b #$92 ; SPRITE 92
#_06EFEA: BNE .not_helmasaur_king

#_06EFEC: JSL Sprite_KillFriends

#_06EFF0: LDA.b #$FF
#_06EFF2: STA.w $0DF0,X

#_06EFF5: JMP.w Sprite_BossScreamAndDisableMenu

;---------------------------------------------------------------------------------------------------

.not_helmasaur_king
#_06EFF8: CMP.b #$CB ; SPRITE CB
#_06EFFA: BNE .not_trinexx_rock

#_06EFFC: JMP.w TrinexxRock_ScreamAndDie

.not_trinexx_rock
#_06EFFF: CMP.b #$CC ; SPRITE CC
#_06F001: BEQ .is_trinexx_fire

#_06F003: CMP.b #$CD ; SPRITE CD
#_06F005: BNE .not_trinexx_ice

.is_trinexx_fire
#_06F007: JMP.w Sidenexx_ScreamAndDie

;---------------------------------------------------------------------------------------------------

.not_trinexx_ice
#_06F00A: CMP.b #$53 ; SPRITE 53
#_06F00C: BEQ ArmosKnight_ScreamAndDie

#_06F00E: CMP.b #$54 ; SPRITE 54
#_06F010: BEQ Lanmolas_ScreamAndDie

#_06F012: CMP.b #$09 ; SPRITE 09
#_06F014: BEQ Moldorm_ScreamAndDie

#_06F016: CMP.b #$7A ; SPRITE 7A
#_06F018: BNE .not_agahnim

#_06F01A: JMP.w Agahnim_ScreamAndDie

;---------------------------------------------------------------------------------------------------

.not_agahnim
#_06F01D: CMP.b #$23 ; SPRITE 23
#_06F01F: BEQ RedBari_TimeToDie

#_06F021: CMP.b #$0F ; SPRITE 0F
#_06F023: BNE SpriteDeath_not_octoballoon

;===================================================================================================

#Octoballoon_TimeToDie:
#_06F025: STZ.w $0EF0,X

#_06F028: LDA.b #$0F
#_06F02A: STA.w $0DF0,X

#_06F02D: RTS

;---------------------------------------------------------------------------------------------------

#SpriteDeath_not_octoballoon:
#_06F02E: LDA.w $0B6B,X
#_06F031: AND.b #$02
#_06F033: BNE .not_a_boss

#_06F035: LDA.w $0EF0,X
#_06F038: ASL A

#_06F039: LDA.b #$0F
#_06F03B: BCC .delay

#_06F03D: LDA.b #$1F

.delay
#_06F03F: STA.w $0DF0,X

#_06F042: JMP.w NormalMob_TimeToDie

;===================================================================================================

#UNREACHABLE_06F045:
#_06F045: RTS

;===================================================================================================

#Moldorm_ScreamAndDie:
#_06F046: LDA.b #$03
#_06F048: STA.w $0D80,X

#_06F04B: LDA.b #$A0
#_06F04D: STA.w $0F10,X

#_06F050: LDA.b #$09
#_06F052: STA.w $0DD0,X

#_06F055: BRA Sprite_BossScreamAndDisableMenu

;---------------------------------------------------------------------------------------------------

.not_a_boss
#_06F057: LDA.w $0E20,X
#_06F05A: CMP.b #$A2 ; SPRITE A2
#_06F05C: BEQ .kholdstare

#_06F05E: JSL Sprite_KillFriends

.kholdstare
#_06F062: LDA.b #$04
#_06F064: STA.w $0DD0,X

#_06F067: STZ.w $0D90,X

#_06F06A: LDA.b #$FF

;---------------------------------------------------------------------------------------------------

.set_death_timer
#_06F06C: STA.w $0DF0,X
#_06F06F: STA.w $0EF0,X

#_06F072: BRA Sprite_BossScreamAndDisableMenu

;---------------------------------------------------------------------------------------------------

#Lanmolas_ScreamAndDie:
#_06F074: LDA.b #$05
#_06F076: STA.w $0D80,X

#_06F079: LDA.b #$C0
#_06F07B: BRA .set_death_timer

;===================================================================================================

ArmosKnight_ScreamAndDie:
#_06F07D: LDA.b #$23
#_06F07F: STA.w $0DF0,X

#_06F082: STZ.w $0EF0,X

#_06F085: BRA .queue_scream

;===================================================================================================

#Sprite_BossScreamAndDisableMenu:
#_06F087: INC.w $0FFC

.queue_scream
#_06F08A: STZ.w $012F

#_06F08D: LDA.b #$22 ; SFX3.22
#_06F08F: JSL SpriteSFX_QueueSFX3WithPan

#_06F093: RTS

;===================================================================================================

RedBari_TimeToDie:
#_06F094: LDA.w $0DB0,X
#_06F097: BNE SpriteDeath_not_octoballoon

#_06F099: LDA.b #$02
#_06F09B: STA.w $0D80,X

#_06F09E: LDA.b #$20
#_06F0A0: STA.w $0DF0,X

#_06F0A3: LDA.b #$09
#_06F0A5: STA.w $0DD0,X

#_06F0A8: STZ.w $0EF0,X

#_06F0AB: RTS

;===================================================================================================

Sidenexx_ScreamAndDie:
#_06F0AC: LDA.b #$80
#_06F0AE: STA.w $0D80,X

#_06F0B1: LDA.b #$60
#_06F0B3: STA.w $0DF0,X

#_06F0B6: LDA.b #$09
#_06F0B8: STA.w $0DD0,X

#_06F0BB: BRA Sprite_BossScreamAndDisableMenu

;===================================================================================================

TrinexxRock_ScreamAndDie:
#_06F0BD: LDA.b #$80
#_06F0BF: STA.w $0D80,X

#_06F0C2: LDA.b #$80
#_06F0C4: STA.w $0DF0,X

#_06F0C7: LDA.b #$09
#_06F0C9: STA.w $0DD0,X

#_06F0CC: BRA Sprite_BossScreamAndDisableMenu

;===================================================================================================

Agahnim_ScreamAndDie:
#_06F0CE: JSL Sprite_KillFriends

#_06F0D2: LDA.b #$09
#_06F0D4: STA.w $0DD0,X
#_06F0D7: STA.w $0BA0,X

#_06F0DA: LDA.w $0FFF
#_06F0DD: BNE .aga_2

#_06F0DF: LDA.b #$0A
#_06F0E1: STA.w $0D80,X

#_06F0E4: LDA.b #$FF
#_06F0E6: STA.w $0DF0,X

#_06F0E9: LDA.b #$20
#_06F0EB: STA.w $0F80,X

#_06F0EE: JMP.w Sprite_BossScreamAndDisableMenu

;---------------------------------------------------------------------------------------------------

.aga_2
#_06F0F1: LDA.b #$FF
#_06F0F3: STA.w $0DF0,X

#_06F0F6: LDA.b #$08
#_06F0F8: STA.w $0D80,X

#_06F0FB: INC A
#_06F0FC: STA.w $0D81
#_06F0FF: STA.w $0D82

#_06F102: STZ.w $0DC1
#_06F105: STZ.w $0DC2

#_06F108: JMP.w Sprite_BossScreamAndDisableMenu

;===================================================================================================

NormalMob_TimeToDie:
#_06F10B: LDA.w $0E40,X
#_06F10E: CLC
#_06F10F: ADC.b #$04
#_06F111: STA.w $0E40,X

#_06F114: LDA.w $0FB5
#_06F117: CMP.b #$0B
#_06F119: BNE .exit

#_06F11B: LDA.b #$01
#_06F11D: STA.w $0BE0,X

.exit
#_06F120: RTS

;===================================================================================================

Sprite_CheckDamageToLink_long:
#_06F121: PHB
#_06F122: PHK
#_06F123: PLB

#_06F124: JSR Sprite_CheckDamageToLink

#_06F127: PLB

#_06F128: RTL

;---------------------------------------------------------------------------------------------------

Sprite_CheckDamageToLink_same_layer_long:
#_06F129: PHB
#_06F12A: PHK
#_06F12B: PLB

#_06F12C: JSR Sprite_CheckDamageToLink_same_layer

#_06F12F: PLB

#_06F130: RTL

;---------------------------------------------------------------------------------------------------

Sprite_CheckDamageToLink_ignore_layer_long:
#_06F131: PHB
#_06F132: PHK
#_06F133: PLB

#_06F134: JSR Sprite_CheckDamageToLink_ignore_layer

#_06F137: PLB

#_06F138: RTL

;---------------------------------------------------------------------------------------------------

Sprite_ToLink_Directions:
.opposing
#_06F139: db $04, $06, $00, $02

.standing
#_06F13D: db $06, $04, $00, $00

.opposing2
#_06F141: db $04, $06, $00, $02

;===================================================================================================

Sprite_CheckDamageToLink:
#_06F145: LDA.w $037B
#_06F148: BNE .no_damage

;===================================================================================================

#Sprite_CheckDamageToLink_staggered:
#_06F14A: TXA
#_06F14B: EOR.b $1A
#_06F14D: AND.b #$03

#_06F14F: ORA.w $0EF0,X
#_06F152: BNE .no_damage

;===================================================================================================

#Sprite_CheckDamageToLink_same_layer:
#_06F154: LDA.w $00EE
#_06F157: CMP.w $0F20,X
#_06F15A: BNE .no_damage2

#Sprite_CheckDamageToLink_ignore_layer:
#_06F15C: LDA.w $0F60,X
#_06F15F: BEQ .use_fast_hitbox_0

#_06F161: JSR Link_SetupHitBox
#_06F164: JSR Sprite_SetupHitBox
#_06F167: JSR CheckIfHitBoxesOverlap

#_06F16A: BRA .collision_checked

.use_fast_hitbox_0
#_06F16C: JSR Sprite_SetupHitBox00

;---------------------------------------------------------------------------------------------------

.collision_checked
#_06F16F: LDA.w $0E40,X
#_06F172: BMI .exit_preserve_check
#_06F174: BCC .no_damage2

#_06F176: LDA.b $4D
#_06F178: BNE .no_damage2

#_06F17A: LDA.w $02E0
#_06F17D: BNE .definitely_getting_hit

#_06F17F: LDA.w $0308
#_06F182: BMI .definitely_getting_hit

#_06F184: LDA.w $0BE0,X
#_06F187: AND.b #$20
#_06F189: BEQ .definitely_getting_hit

#_06F18B: LDA.l $7EF35A
#_06F18F: BEQ .definitely_getting_hit

#_06F191: STZ.w $0DD0,X

#_06F194: LDA.b $2F

#_06F196: LDY.b $3C
#_06F198: BEQ .sword_in

#_06F19A: LSR A
#_06F19B: TAY

#_06F19C: LDA.w Sprite_ToLink_Directions_standing,Y

.sword_in
#_06F19F: LDY.w $0DE0,X

#_06F1A2: CMP.w Sprite_ToLink_Directions_opposing2,Y
#_06F1A5: BNE .definitely_getting_hit

#_06F1A7: LDA.b #$06 ; SFX2.06
#_06F1A9: JSL SpriteSFX_QueueSFX2WithPan

#_06F1AD: JSL Sprite_PlaceWeaponTink_forced

#_06F1B1: LDA.w $0E20,X
#_06F1B4: CMP.b #$95 ; SPRITE 95
#_06F1B6: BNE .not_laser

#_06F1B8: LDA.b #$26 ; SFX3.26
#_06F1BA: JSL SpriteSFX_QueueSFX3WithPan

.no_damage
#_06F1BE: CLC

.exit_preserve_check
#_06F1BF: RTS

;---------------------------------------------------------------------------------------------------

.not_laser
#_06F1C0: CMP.b #$9B ; SPRITE 9B
#_06F1C2: BNE .not_wizzrobe_beam

#_06F1C4: JSR Sprite_InvertSpeed_XY
#_06F1C7: LDA.w $0DE0,X

#_06F1CA: EOR.b #$01
#_06F1CC: STA.w $0DE0,X

#_06F1CF: INC.w $0D80,X

#_06F1D2: LDA.b #$09
#_06F1D4: STA.w $0DD0,X

.no_damage2
#_06F1D7: CLC

#_06F1D8: RTS

;---------------------------------------------------------------------------------------------------

.not_wizzrobe_beam
#_06F1D9: CMP.b #$1B ; SPRITE 1B
#_06F1DB: BEQ .is_arrow

#_06F1DD: CMP.b #$0C ; SPRITE 0C
#_06F1DF: BEQ .is_rock

#_06F1E1: RTS

;---------------------------------------------------------------------------------------------------

.definitely_getting_hit
#_06F1E2: JSR Sprite_AttemptDamageToLinkPlusRecoil

#_06F1E5: LDA.w $0E20,X
#_06F1E8: CMP.b #$0C ; SPRITE 0C
#_06F1EA: BNE .is_not_rock

.is_rock
#_06F1EC: JSR Sprite_PrepareToDie

.is_not_rock
#_06F1EF: SEC

#_06F1F0: RTS

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_06F1F1:
#_06F1F1: CLC

#_06F1F2: RTS

;---------------------------------------------------------------------------------------------------

.is_arrow
#_06F1F3: JMP.w Sprite_ScheduleForBreakage

;===================================================================================================

Sprite_SetupHitBox00:
#_06F1F6: LDA.w $0F70,X
#_06F1F9: STA.b $0C
#_06F1FB: STZ.b $0D

#_06F1FD: REP #$20

#_06F1FF: LDA.b $22
#_06F201: SEC
#_06F202: SBC.w $0FD8
#_06F205: CLC
#_06F206: ADC.w #$000B

#_06F209: CMP.w #$0017
#_06F20C: BCS .no_overlap

#_06F20E: LDA.b $20
#_06F210: SEC
#_06F211: SBC.w $0FDA
#_06F214: CLC
#_06F215: ADC.b $0C
#_06F217: CLC
#_06F218: ADC.w #$0010

#_06F21B: CMP.w #$0018
#_06F21E: BCS .no_overlap

.overlap
#_06F220: SEP #$20
#_06F222: SEC

#_06F223: RTS

.no_overlap
#_06F224: SEP #$20
#_06F226: CLC

#_06F227: RTS

;===================================================================================================

Sprite_CheckIfLifted:
#_06F228: LDA.b $11
#_06F22A: ORA.b $3C
#_06F22C: ORA.w $0FC1
#_06F22F: BNE EXIT_06F2A9

#_06F231: LDA.b $EE
#_06F233: CMP.w $0F20,X
#_06F236: BNE EXIT_06F2A9

;---------------------------------------------------------------------------------------------------

#_06F238: LDY.b #$0F

.next_sprite
#_06F23A: LDA.w $0DD0,Y
#_06F23D: CMP.b #$0A
#_06F23F: BEQ EXIT_06F2A9

#_06F241: DEY
#_06F242: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_06F244: LDA.w $0E20,X
#_06F247: CMP.b #$0B ; SPRITE 0B
#_06F249: BEQ Sprite_CheckIfLifted_permissive

#_06F24B: CMP.b #$4A ; SPRITE 4A
#_06F24D: BEQ Sprite_CheckIfLifted_permissive

#_06F24F: LDA.w $0D50,X
#_06F252: ORA.w $0D40,X
#_06F255: BNE EXIT_06F2A9

;===================================================================================================

#Sprite_CheckIfLifted_permissive:
#_06F257: LDA.w $0372
#_06F25A: BNE EXIT_06F2A9

#_06F25C: LDA.w $02F4
#_06F25F: DEC A
#_06F260: CMP.w $0FA0
#_06F263: BEQ .get_lifted

#_06F265: JSR Link_SetupHitBox_conditional
#_06F268: JSR Sprite_SetupHitBox
#_06F26B: JSR CheckIfHitBoxesOverlap

#_06F26E: BCC EXIT_06F2A9

#_06F270: TXA
#_06F271: INC A
#_06F272: STA.w $0314
#_06F275: STA.w $0FB2

#_06F278: RTS

;---------------------------------------------------------------------------------------------------

.get_lifted
#_06F279: STZ.b $F6

#_06F27B: STZ.w $0E90,X

#_06F27E: LDA.b #$1D ; SFX2.1D
#_06F280: JSL SpriteSFX_QueueSFX2WithPan

#_06F284: LDA.w $0DD0,X
#_06F287: STA.l $7FFA2C,X

#_06F28B: LDA.b #$0A
#_06F28D: STA.w $0DD0,X

#_06F290: LDA.b #$10
#_06F292: STA.w $0DF0,X

#_06F295: LDA.b #$00 ; TILETYPE 00
#_06F297: STA.l $7FFA1C,X
#_06F29B: STA.l $7FF9C2,X

#_06F29F: JSR Sprite_DirectionToFaceLink

#_06F2A2: LDA.w Sprite_ToLink_Directions_opposing,Y
#_06F2A5: STA.b $2F

#_06F2A7: PLA
#_06F2A8: PLA

;---------------------------------------------------------------------------------------------------

#EXIT_06F2A9:
#_06F2A9: RTS

;===================================================================================================

Sprite_CheckDamageFromLink_long:
#_06F2AA: PHB
#_06F2AB: PHK
#_06F2AC: PLB

#_06F2AD: JSR Sprite_CheckDamageFromLink

#_06F2B0: TAY

#_06F2B1: PLB

#_06F2B2: TYA

#_06F2B3: RTL

;===================================================================================================

Sprite_CheckDamageFromLink:
#_06F2B4: LDA.w $0EF0,X
#_06F2B7: AND.b #$80
#_06F2B9: BNE .dying

#_06F2BB: LDA.b $EE
#_06F2BD: CMP.w $0F20,X

.dying
#_06F2C0: BNE .no_collision

#_06F2C2: LDA.b $44
#_06F2C4: CMP.b #$80
#_06F2C6: BEQ .no_collision

#_06F2C8: JSR SetupActionHitbox
#_06F2CB: JSR Sprite_SetupHitBox
#_06F2CE: JSR CheckIfHitBoxesOverlap
#_06F2D1: BCC .no_collision

#_06F2D3: STZ.w $0047

#_06F2D6: LDA.w $037A
#_06F2D9: AND.b #$10
#_06F2DB: BNE EXIT_06F2A9

#_06F2DD: LDA.w $0301
#_06F2E0: AND.b #$0A
#_06F2E2: BEQ .not_frozen_kill

#_06F2E4: LDA.w $0E20,X
#_06F2E7: CMP.b #$D6 ; SPRITE D6
#_06F2E9: BCS .no_collision

#_06F2EB: LDA.w $0DD0,X
#_06F2EE: CMP.b #$0B ; SPRITE 0B
#_06F2F0: BNE .not_frozen_kill

#_06F2F2: LDA.l $7FFA3C,X
#_06F2F6: BEQ .not_frozen_kill

#_06F2F8: LDA.b #$02
#_06F2FA: STA.w $0DD0,X

#_06F2FD: LDA.b #$20
#_06F2FF: STA.w $0DF0,X

#_06F302: LDA.w $0E40,X
#_06F305: AND.b #$E0
#_06F307: ORA.b #$03
#_06F309: STA.w $0E40,X

#_06F30C: LDA.b #$1F ; SFX2.1F
#_06F30E: JSL SpriteSFX_QueueSFX2WithPan

#_06F312: SEC

#_06F313: RTS

;---------------------------------------------------------------------------------------------------

.not_frozen_kill
#_06F314: LDA.w $0E20,X
#_06F317: CMP.b #$7B ; SPRITE 7B
#_06F319: BNE .not_aga_ball

#_06F31B: LDA.b $3C
#_06F31D: CMP.b #$09
#_06F31F: BMI .am_slashing

.no_collision
#_06F321: JMP.w .fail_and_exit

.am_slashing
#_06F324: JMP.w .check_sword_swing

;---------------------------------------------------------------------------------------------------

.mini_helma
#_06F327: LDY.w $0DE0,X

#_06F32A: LDA.b $2F
#_06F32C: CMP.w Sprite_ToLink_Directions_opposing2,Y
#_06F32F: BNE Sprite_CheckDamageFromLink_with_recoil

.stalfos_head
#_06F331: JSR Sprite_CheckDamageFromLink_with_recoil

#_06F334: STZ.w $0EF0,X

#_06F337: JSR Link_PlaceWeaponTink

#_06F33A: JMP.w SpriteDamage_ExitWith00

;===================================================================================================

#Sprite_CheckDamageFromLink_with_recoil:
#_06F33D: JSR Sprite_AttemptZapDamage

#_06F340: LDA.b #$20
#_06F342: JSR Sprite_ApplyRecoilToLink

#_06F345: LDA.b #$10
#_06F347: STA.b $47
#_06F349: STA.b $46

#_06F34B: JMP.w SpriteDamage_ExitWith00

;---------------------------------------------------------------------------------------------------

.not_aga_ball
#_06F34E: CMP.b #$09 ; SPRITE 09
#_06F350: BNE .not_moldorm

#_06F352: LDA.w $0D90,X
#_06F355: BNE .check_sword_swing

#_06F357: JSR Sprite_RecoilLinkAndTHUMP

#_06F35A: LDA.b #$32 ; SFX3.32
#_06F35C: JSL Sprite_CalculateSFXPan
#_06F360: STA.w $012F

#_06F363: JMP.w .place_tink

;---------------------------------------------------------------------------------------------------

.not_moldorm
#_06F366: CMP.b #$92 ; SPRITE 92
#_06F368: BNE .not_helma_king

#_06F36A: JMP.w KingHelmasaur_ApplyRecoilIfEarlyPhase

;---------------------------------------------------------------------------------------------------

.not_helma_king
#_06F36D: CMP.b #$26 ; SPRITE 26
#_06F36F: BEQ Sprite_CheckDamageFromLink_with_recoil

#_06F371: CMP.b #$13 ; SPRITE 13
#_06F373: BEQ .mini_helma

#_06F375: CMP.b #$02 ; SPRITE 02
#_06F377: BEQ .stalfos_head

#_06F379: CMP.b #$CB ; SPRITE CB
#_06F37B: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F37D: CMP.b #$CD ; SPRITE CD
#_06F37F: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F381: CMP.b #$CC ; SPRITE CC
#_06F383: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F385: CMP.b #$D6 ; SPRITE D6
#_06F387: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F389: CMP.b #$D7 ; SPRITE D7
#_06F38B: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F38D: CMP.b #$CE ; SPRITE CE
#_06F38F: BEQ Sprite_CheckDamageFromLink_apply_normal_recoil

#_06F391: CMP.b #$54 ; SPRITE 54
#_06F393: BNE .check_sword_swing

;===================================================================================================

#Sprite_CheckDamageFromLink_apply_normal_recoil:
#_06F395: LDA.b #$20
#_06F397: JSR Sprite_ApplyRecoilToLink

#_06F39A: LDA.b #$90
#_06F39C: STA.b $47

#_06F39E: LDA.b #$10
#_06F3A0: STA.b $46

;---------------------------------------------------------------------------------------------------

.check_sword_swing
#_06F3A2: LDA.w $0CAA,X
#_06F3A5: AND.b #$04
#_06F3A7: BNE Sprite_CheckDamageFromLink_attempt_small_recoil

#_06F3A9: JSR Sprite_AttemptZapDamage

#_06F3AC: SEC

#_06F3AD: BRA SpriteDamage_ExitWith00

;---------------------------------------------------------------------------------------------------

.fail_and_exit
#_06F3AF: CLC

#_06F3B0: BRA SpriteDamage_ExitWith00

;===================================================================================================

#Sprite_CheckDamageFromLink_attempt_small_recoil:
#_06F3B2: LDA.b $47
#_06F3B4: BNE .place_tink

#_06F3B6: LDA.b #$04
#_06F3B8: JSR Sprite_ApplyRecoilToLink

#_06F3BB: LDA.b #$10
#_06F3BD: STA.b $46

#_06F3BF: LDA.b #$10
#_06F3C1: STA.b $47

.place_tink
#_06F3C3: JSR Link_PlaceWeaponTink

#_06F3C6: SEC

;===================================================================================================

SpriteDamage_ExitWith00:
#_06F3C7: LDA.b #$00

#_06F3C9: RTS

;===================================================================================================

Sprite_AttemptDamageToLinkWithCollisionCheck:
#_06F3CA: TXA
#_06F3CB: EOR.b $1A
#_06F3CD: LSR A
#_06F3CE: BCS .no_damage

#_06F3D0: JSR Sprite_DoHitboxesFast

#_06F3D3: JSR Link_SetupHitBox_conditional
#_06F3D6: JSR CheckIfHitBoxesOverlap

#_06F3D9: BCC .no_damage

;===================================================================================================

#Sprite_AttemptDamageToLinkPlusRecoil:
#_06F3DB: LDA.w $031F
#_06F3DE: ORA.w $037B
#_06F3E1: BNE .no_damage

#_06F3E3: LDA.b #$13
#_06F3E5: STA.b $46

#_06F3E7: LDA.b #$18
#_06F3E9: JSR Sprite_ApplyRecoilToLink

#_06F3EC: LDA.b #$01
#_06F3EE: STA.b $4D

#_06F3F0: LDA.w $0CD2,X
#_06F3F3: AND.b #$0F
#_06F3F5: STA.b $00

#_06F3F7: ASL A
#_06F3F8: ADC.b $00
#_06F3FA: CLC
#_06F3FB: ADC.l $7EF35B
#_06F3FF: TAY

#_06F400: LDA.w Sprite_BumpDamageGroups,Y
#_06F403: STA.w $0373

#_06F406: LDA.w $0E20,X
#_06F409: CMP.b #$61 ; SPRITE 61
#_06F40B: BNE .no_damage

#_06F40D: LDA.w $0DB0,X
#_06F410: BEQ .no_damage

#_06F412: LDA.w $0D50,X
#_06F415: ASL A
#_06F416: STA.b $28

#_06F418: LDA.w $0D40,X
#_06F41B: ASL A
#_06F41C: STA.b $27

.no_damage
#_06F41E: RTS

;===================================================================================================

Sprite_AttemptDamageToLinkPlusRecoil_long:
#_06F41F: PHB
#_06F420: PHK
#_06F421: PLB

#_06F422: JSR Sprite_AttemptDamageToLinkPlusRecoil

#_06F425: PLB

#_06F426: RTL

;===================================================================================================

Sprite_BumpDamageGroups:
#_06F427: db $02, $01, $01 ; 0x00
#_06F42A: db $04, $04, $04 ; 0x01
#_06F42D: db $00, $00, $00 ; 0x02
#_06F430: db $08, $04, $02 ; 0x03
#_06F433: db $08, $08, $08 ; 0x04
#_06F436: db $10, $08, $04 ; 0x05
#_06F439: db $20, $10, $08 ; 0x06
#_06F43C: db $20, $18, $10 ; 0x07
#_06F43F: db $18, $10, $08 ; 0x08
#_06F442: db $40, $30, $18 ; 0x09

;===================================================================================================

Sprite_RecoilLinkAndTHUMP:
#_06F445: LDA.b #$30
#_06F447: JSR Sprite_ApplyRecoilToLink

#_06F44A: LDA.b #$90
#_06F44C: STA.b $47

#_06F44E: LDA.b #$10
#_06F450: STA.b $46

#_06F452: LDA.b #$21 ; SFX2.21
#_06F454: JSL SpriteSFX_QueueSFX2WithPan

#_06F458: LDA.b #$30
#_06F45A: STA.w $0E00,X

#_06F45D: JMP.w SpriteDamage_ExitWith00

;===================================================================================================

KingHelmasaur_ApplyRecoilIfEarlyPhase:
#_06F460: LDA.w $0DB0,X
#_06F463: CMP.b #$03
#_06F465: BCS .do_recoil

#_06F467: JMP.w Sprite_CheckDamageFromLink_attempt_small_recoil

.do_recoil
#_06F46A: JMP.w Sprite_CheckDamageFromLink_apply_normal_recoil

;===================================================================================================

pool ActionHitbox

.offset_x
#_06F46D: db   0 ; net/hammer

#_06F46E: db   2 ; up
#_06F46F: db   0 ; up
#_06F470: db   0 ; up
#_06F471: db  -8 ; up
#_06F472: db   0 ; up
#_06F473: db   2 ; up
#_06F474: db   0 ; up
#_06F475: db   2 ; up
#_06F476: db   2 ; up
#_06F477: db   1 ; up
#_06F478: db   1 ; up
#_06F479: db   0 ; up
#_06F47A: db   0 ; up
#_06F47B: db   0 ; up
#_06F47C: db   0 ; up
#_06F47D: db   0 ; up

#_06F47E: db   2 ; down
#_06F47F: db   4 ; down
#_06F480: db   4 ; down
#_06F481: db   0 ; down
#_06F482: db   0 ; down
#_06F483: db  -4 ; down
#_06F484: db  -4 ; down
#_06F485: db  -6 ; down
#_06F486: db   2 ; down
#_06F487: db   1 ; down
#_06F488: db   1 ; down
#_06F489: db   0 ; down
#_06F48A: db   0 ; down
#_06F48B: db   0 ; down
#_06F48C: db   0 ; down
#_06F48D: db   0 ; down

#_06F48E: db   0 ; left
#_06F48F: db   0 ; left
#_06F490: db   0 ; left
#_06F491: db   2 ; left
#_06F492: db   2 ; left
#_06F493: db   4 ; left
#_06F494: db   4 ; left
#_06F495: db   2 ; left
#_06F496: db   2 ; left
#_06F497: db   2 ; left
#_06F498: db   2 ; left
#_06F499: db   0 ; left
#_06F49A: db   0 ; left
#_06F49B: db   0 ; left
#_06F49C: db   0 ; left
#_06F49D: db   0 ; left

#_06F49E: db   0 ; right
#_06F49F: db   0 ; right
#_06F4A0: db   0 ; right
#_06F4A1: db  -4 ; right
#_06F4A2: db  -4 ; right
#_06F4A3: db -10 ; right
#_06F4A4: db   0 ; right
#_06F4A5: db   2 ; right
#_06F4A6: db   2 ; right
#_06F4A7: db   0 ; right
#_06F4A8: db   0 ; right
#_06F4A9: db   0 ; right
#_06F4AA: db   0 ; right
#_06F4AB: db   0 ; right
#_06F4AC: db   0 ; right
#_06F4AD: db   0 ; right

;---------------------------------------------------------------------------------------------------

.size_x
#_06F4AE: db  15 ; net/hammer

#_06F4AF: db   4 ; up
#_06F4B0: db   8 ; up
#_06F4B1: db   8 ; up
#_06F4B2: db   8 ; up
#_06F4B3: db   8 ; up
#_06F4B4: db  12 ; up
#_06F4B5: db   8 ; up
#_06F4B6: db   4 ; up
#_06F4B7: db   4 ; up
#_06F4B8: db   6 ; up
#_06F4B9: db   6 ; up
#_06F4BA: db   0 ; up
#_06F4BB: db   0 ; up
#_06F4BC: db   0 ; up
#_06F4BD: db   0 ; up
#_06F4BE: db   0 ; up

#_06F4BF: db   4 ; down
#_06F4C0: db  16 ; down
#_06F4C1: db  12 ; down
#_06F4C2: db   8 ; down
#_06F4C3: db   8 ; down
#_06F4C4: db  12 ; down
#_06F4C5: db  11 ; down
#_06F4C6: db  12 ; down
#_06F4C7: db   4 ; down
#_06F4C8: db   6 ; down
#_06F4C9: db   6 ; down
#_06F4CA: db   0 ; down
#_06F4CB: db   0 ; down
#_06F4CC: db   0 ; down
#_06F4CD: db   0 ; down
#_06F4CE: db   0 ; down

#_06F4CF: db   8 ; left
#_06F4D0: db   8 ; left
#_06F4D1: db   8 ; left
#_06F4D2: db  10 ; left
#_06F4D3: db  14 ; left
#_06F4D4: db  15 ; left
#_06F4D5: db   4 ; left
#_06F4D6: db   4 ; left
#_06F4D7: db   4 ; left
#_06F4D8: db   6 ; left
#_06F4D9: db   6 ; left
#_06F4DA: db   0 ; left
#_06F4DB: db   0 ; left
#_06F4DC: db   0 ; left
#_06F4DD: db   0 ; left
#_06F4DE: db   0 ; left

#_06F4DF: db   8 ; right
#_06F4E0: db   8 ; right
#_06F4E1: db   8 ; right
#_06F4E2: db  10 ; right
#_06F4E3: db  14 ; right
#_06F4E4: db  15 ; right
#_06F4E5: db   4 ; right
#_06F4E6: db   4 ; right
#_06F4E7: db   4 ; right
#_06F4E8: db   6 ; right
#_06F4E9: db   6 ; right
#_06F4EA: db   0 ; right
#_06F4EB: db   0 ; right
#_06F4EC: db   0 ; right
#_06F4ED: db   0 ; right
#_06F4EE: db   0 ; right

;---------------------------------------------------------------------------------------------------

.offset_y
#_06F4EF: db   0 ; net/hammer

#_06F4F0: db   2 ; up
#_06F4F1: db   0 ; up
#_06F4F2: db   2 ; up
#_06F4F3: db   4 ; up
#_06F4F4: db   4 ; up
#_06F4F5: db   4 ; up
#_06F4F6: db   7 ; up
#_06F4F7: db   2 ; up
#_06F4F8: db   2 ; up
#_06F4F9: db   1 ; up
#_06F4FA: db   1 ; up
#_06F4FB: db   0 ; up
#_06F4FC: db   0 ; up
#_06F4FD: db   0 ; up
#_06F4FE: db   0 ; up
#_06F4FF: db   0 ; up

#_06F500: db   2 ; down
#_06F501: db   0 ; down
#_06F502: db   2 ; down
#_06F503: db  -4 ; down
#_06F504: db  -3 ; down
#_06F505: db  -8 ; down
#_06F506: db   0 ; down
#_06F507: db   0 ; down
#_06F508: db   2 ; down
#_06F509: db   1 ; down
#_06F50A: db   1 ; down
#_06F50B: db   0 ; down
#_06F50C: db   0 ; down
#_06F50D: db   0 ; down
#_06F50E: db   0 ; down
#_06F50F: db   0 ; down

#_06F510: db   0 ; left
#_06F511: db   0 ; left
#_06F512: db   0 ; left
#_06F513: db  -2 ; left
#_06F514: db   0 ; left
#_06F515: db  -4 ; left
#_06F516: db   1 ; left
#_06F517: db   2 ; left
#_06F518: db   2 ; left
#_06F519: db   1 ; left
#_06F51A: db   1 ; left
#_06F51B: db   0 ; left
#_06F51C: db   0 ; left
#_06F51D: db   0 ; left
#_06F51E: db   0 ; left
#_06F51F: db   0 ; left

#_06F520: db   0 ; right
#_06F521: db   0 ; right
#_06F522: db   0 ; right
#_06F523: db  -2 ; right
#_06F524: db   0 ; right
#_06F525: db  -4 ; right
#_06F526: db   1 ; right
#_06F527: db   2 ; right
#_06F528: db   2 ; right
#_06F529: db   1 ; right
#_06F52A: db   1 ; right
#_06F52B: db   0 ; right
#_06F52C: db   0 ; right
#_06F52D: db   0 ; right
#_06F52E: db   0 ; right
#_06F52F: db   0 ; right

;---------------------------------------------------------------------------------------------------

.size_y
#_06F530: db  15 ; net/hammer

#_06F531: db   4 ; up
#_06F532: db   8 ; up
#_06F533: db   2 ; up
#_06F534: db  12 ; up
#_06F535: db   8 ; up
#_06F536: db  12 ; up
#_06F537: db   8 ; up
#_06F538: db   4 ; up
#_06F539: db   4 ; up
#_06F53A: db   6 ; up
#_06F53B: db   6 ; up
#_06F53C: db   0 ; up
#_06F53D: db   0 ; up
#_06F53E: db   0 ; up
#_06F53F: db   0 ; up
#_06F540: db   0 ; up

#_06F541: db   4 ; down
#_06F542: db   8 ; down
#_06F543: db   4 ; down
#_06F544: db  12 ; down
#_06F545: db  12 ; down
#_06F546: db  12 ; down
#_06F547: db   4 ; down
#_06F548: db   8 ; down
#_06F549: db   4 ; down
#_06F54A: db   6 ; down
#_06F54B: db   4 ; down
#_06F54C: db   0 ; down
#_06F54D: db   0 ; down
#_06F54E: db   0 ; down
#_06F54F: db   0 ; down
#_06F550: db   0 ; down

#_06F551: db   8 ; left
#_06F552: db   8 ; left
#_06F553: db   8 ; left
#_06F554: db   8 ; left
#_06F555: db   8 ; left
#_06F556: db  12 ; left
#_06F557: db   4 ; left
#_06F558: db   4 ; left
#_06F559: db   4 ; left
#_06F55A: db   6 ; left
#_06F55B: db   6 ; left
#_06F55C: db   0 ; left
#_06F55D: db   0 ; left
#_06F55E: db   0 ; left
#_06F55F: db   0 ; left
#_06F560: db   0 ; left

#_06F561: db   8 ; right
#_06F562: db   8 ; right
#_06F563: db   8 ; right
#_06F564: db   8 ; right
#_06F565: db   8 ; right
#_06F566: db  12 ; right
#_06F567: db   4 ; right
#_06F568: db   4 ; right
#_06F569: db   4 ; right
#_06F56A: db   6 ; right
#_06F56B: db   6 ; right
#_06F56C: db   0 ; right
#_06F56D: db   0 ; right
#_06F56E: db   0 ; right
#_06F56F: db   0 ; right
#_06F570: db   0 ; right

;---------------------------------------------------------------------------------------------------

.sword_validity
#_06F571: db $01
#_06F572: db $01
#_06F573: db $01
#_06F574: db $00
#_06F575: db $00
#_06F576: db $00
#_06F577: db $00
#_06F578: db $01
#_06F579: db $01
#_06F57A: db $00
#_06F57B: db $00
#_06F57C: db $01
#_06F57D: db $01

pool off

;===================================================================================================

SetupActionHitbox_long:
#_06F57E: PHB
#_06F57F: PHK
#_06F580: PLB

#_06F581: JSR SetupActionHitbox

#_06F584: PLB

#_06F585: RTL

;===================================================================================================

pool SetupActionHitbox_dashing

.offset_y_high ; bleeds into next
#_06F586: db  -1,   0

.offset_x_low
#_06F588: db   0,   0,  -8,   8

.offset_x_high
#_06F58C: db   0,   0,  -1,   0

.offset_y_low
#_06F590: db  -8,  16,   8,   8

pool off

;===================================================================================================

SetupActionHitbox_spinning:
#_06F594: LDA.b $22
#_06F596: SEC
#_06F597: SBC.b #$0E
#_06F599: STA.b $00

#_06F59B: LDA.b $23
#_06F59D: SBC.b #$00
#_06F59F: STA.b $08

#_06F5A1: LDA.b $20
#_06F5A3: SEC
#_06F5A4: SBC.b #$0A
#_06F5A6: STA.b $01

#_06F5A8: LDA.b $21
#_06F5AA: SBC.b #$00
#_06F5AC: STA.b $09

#_06F5AE: LDA.b #$2C
#_06F5B0: STA.b $02

#_06F5B2: INC A
#_06F5B3: STA.b $03

#_06F5B5: PLX

#_06F5B6: RTS

;===================================================================================================

SetupActionHitbox_dashing:
#_06F5B7: LDA.b $2F
#_06F5B9: LSR A
#_06F5BA: TAY

#_06F5BB: LDA.b $22
#_06F5BD: CLC
#_06F5BE: ADC.w .offset_x_low,Y
#_06F5C1: STA.b $00

#_06F5C3: LDA.b $23
#_06F5C5: ADC.w .offset_x_high,Y
#_06F5C8: STA.b $08

#_06F5CA: LDA.b $20
#_06F5CC: CLC
#_06F5CD: ADC.w .offset_y_low,Y
#_06F5D0: STA.b $01

#_06F5D2: LDA.b $21
#_06F5D4: ADC.w .offset_y_high,Y
#_06F5D7: STA.b $09

#_06F5D9: LDA.b #$10
#_06F5DB: STA.b $02
#_06F5DD: STA.b $03

#_06F5DF: RTS

;===================================================================================================

SetupActionHitbox:
#_06F5E0: LDA.w $0372
#_06F5E3: BNE SetupActionHitbox_dashing

#_06F5E5: PHX

#_06F5E6: LDX.b #$00

#_06F5E8: LDA.w $0301
#_06F5EB: AND.b #$0A
#_06F5ED: BNE .hammer_or_net

#_06F5EF: LDA.w $037A
#_06F5F2: AND.b #$10
#_06F5F4: BNE .hammer_or_net

#_06F5F6: LDY.b $3C
#_06F5F8: BMI SetupActionHitbox_spinning

#_06F5FA: LDA.w ActionHitbox_sword_validity,Y
#_06F5FD: BNE .no_hitbox

#_06F5FF: LDA.b $2F
#_06F601: ASL A
#_06F602: ASL A
#_06F603: ASL A
#_06F604: CLC
#_06F605: ADC.b $3C
#_06F607: TAX

#_06F608: INX

;---------------------------------------------------------------------------------------------------

.hammer_or_net
#_06F609: LDY.b #$00

#_06F60B: LDA.b $45
#_06F60D: CLC
#_06F60E: ADC.w ActionHitbox_offset_x,X
#_06F611: BPL .positive_x

#_06F613: DEY

.positive_x
#_06F614: CLC
#_06F615: ADC.b $22
#_06F617: STA.b $00

#_06F619: TYA
#_06F61A: ADC.b $23
#_06F61C: STA.b $08

;---------------------------------------------------------------------------------------------------

#_06F61E: LDY.b #$00

#_06F620: LDA.b $44
#_06F622: CLC
#_06F623: ADC.w ActionHitbox_offset_y,X
#_06F626: BPL .positive_y

#_06F628: DEY

.positive_y
#_06F629: CLC
#_06F62A: ADC.b $20
#_06F62C: STA.b $01

#_06F62E: TYA
#_06F62F: ADC.b $21
#_06F631: STA.b $09

;---------------------------------------------------------------------------------------------------

#_06F633: LDA.w ActionHitbox_size_x,X
#_06F636: STA.b $02

#_06F638: LDA.w ActionHitbox_size_y,X
#_06F63B: STA.b $03

#_06F63D: PLX

#_06F63E: RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
#_06F63F: LDA.b #$80
#_06F641: STA.b $08

#_06F643: PLX

#_06F644: RTS

;===================================================================================================

Sprite_DoHitboxesFast:
#_06F645: LDY.b #$00

#_06F647: LDA.w $0FAB
#_06F64A: CMP.b #$80
#_06F64C: BEQ .exit

#_06F64E: CMP.b #$00
#_06F650: BPL .positive_x

#_06F652: DEY

.positive_x
#_06F653: CLC
#_06F654: ADC.w $0D10,X
#_06F657: STA.b $04

#_06F659: TYA
#_06F65A: ADC.w $0D30,X
#_06F65D: STA.b $0A

#_06F65F: LDY.b #$00

#_06F661: LDA.w $0FAA
#_06F664: BPL .positive_y

#_06F666: DEY

.positive_y
#_06F667: CLC
#_06F668: ADC.w $0D00,X
#_06F66B: STA.b $05

#_06F66D: TYA
#_06F66E: ADC.w $0D20,X
#_06F671: STA.b $0B

;---------------------------------------------------------------------------------------------------

#_06F673: LDA.b #$03

#_06F675: LDY.w $0E20,X
#_06F678: CPY.b #$6A ; SPRITE 6A
#_06F67A: BNE .not_bnc

#_06F67C: LDA.b #$10

.not_bnc
#_06F67E: STA.b $06
#_06F680: STA.b $07

#_06F682: RTS

.exit
#_06F683: LDA.b #$80
#_06F685: STA.b $0A

#_06F687: RTS

;===================================================================================================

Sprite_ApplyRecoilToLink:
#_06F688: PHA

#_06F689: JSR Sprite_ProjectSpeedTowardsLink

#_06F68C: LDA.b $00
#_06F68E: STA.b $27

#_06F690: LDA.b $01
#_06F692: STA.b $28

#_06F694: PLA
#_06F695: LSR A
#_06F696: STA.b $29
#_06F698: STA.b $C7

#_06F69A: STZ.b $24
#_06F69C: STZ.b $25

#_06F69E: RTS

;===================================================================================================

Link_PlaceWeaponTink:
#_06F69F: LDA.w $0FAC
#_06F6A2: BNE .exit

#_06F6A4: LDA.b #$05
#_06F6A6: STA.w $0FAC

#_06F6A9: LDA.w $0022
#_06F6AC: ADC.w $0045
#_06F6AF: STA.w $0FAD

#_06F6B2: LDA.w $0020
#_06F6B5: ADC.w $0044
#_06F6B8: STA.w $0FAE

#_06F6BB: LDA.b $EE
#_06F6BD: STA.w $0B68

#_06F6C0: JSL Link_CalculateSFXPan
#_06F6C4: ORA.b #$05 ; SFX2.05
#_06F6C6: STA.w $012E

.exit
#_06F6C9: RTS

;===================================================================================================

Sprite_PlaceWeaponTink:
#_06F6CA: LDA.w $0FAC
#_06F6CD: BNE .no_spark

#_06F6CF: LDA.b #$05 ; SFX2.05
#_06F6D1: JSL SpriteSFX_QueueSFX2WithPan

;===================================================================================================

#Sprite_PlaceWeaponTink_forced:
#_06F6D5: LDA.w $0D10,X
#_06F6D8: CMP.b $E2

#_06F6DA: LDA.w $0D30,X
#_06F6DD: SBC.b $E3
#_06F6DF: BNE .no_spark

#_06F6E1: LDA.w $0D00,X
#_06F6E4: CMP.b $E8

#_06F6E6: LDA.w $0D20,X
#_06F6E9: SBC.b $E9

#_06F6EB: BNE .no_spark

#_06F6ED: LDA.w $0D10,X
#_06F6F0: STA.w $0FAD

#_06F6F3: LDA.w $0D00,X
#_06F6F6: STA.w $0FAE

#_06F6F9: LDA.b #$05
#_06F6FB: STA.w $0FAC

#_06F6FE: LDA.w $0F20,X
#_06F701: STA.w $0B68

.no_spark
#_06F704: RTL

;===================================================================================================

Link_SetupHitBox_conditional:
#_06F705: LDA.w $037B
#_06F708: BNE .no_hitbox

;===================================================================================================

#Link_SetupHitBox:
#_06F70A: LDA.b #$08
#_06F70C: STA.b $02
#_06F70E: STA.b $03

#_06F710: LDA.b $22
#_06F712: CLC
#_06F713: ADC.b #$04
#_06F715: STA.b $00

#_06F717: LDA.b $23
#_06F719: ADC.b #$00
#_06F71B: STA.b $08

#_06F71D: LDA.b $20
#_06F71F: ADC.b #$08
#_06F721: STA.b $01

#_06F723: LDA.b $21
#_06F725: ADC.b #$00
#_06F727: STA.b $09

#_06F729: RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
#_06F72A: LDA.b #$80
#_06F72C: STA.b $09

#_06F72E: RTS

;===================================================================================================

pool Sprite_SetupHitBox

.offset_x_low
#_06F72F: db   2 ; 0x00
#_06F730: db   3 ; 0x01
#_06F731: db   0 ; 0x02
#_06F732: db  -3 ; 0x03
#_06F733: db  -6 ; 0x04
#_06F734: db   0 ; 0x05
#_06F735: db   2 ; 0x06
#_06F736: db  -8 ; 0x07
#_06F737: db   0 ; 0x08
#_06F738: db  -4 ; 0x09
#_06F739: db  -8 ; 0x0A
#_06F73A: db   0 ; 0x0B
#_06F73B: db  -8 ; 0x0C
#_06F73C: db -16 ; 0x0D
#_06F73D: db   2 ; 0x0E
#_06F73E: db   2 ; 0x0F

#_06F73F: db   2 ; 0x10
#_06F740: db   2 ; 0x11
#_06F741: db   2 ; 0x12
#_06F742: db  -8 ; 0x13
#_06F743: db   2 ; 0x14
#_06F744: db   2 ; 0x15
#_06F745: db -16 ; 0x16
#_06F746: db  -8 ; 0x17
#_06F747: db -12 ; 0x18
#_06F748: db   4 ; 0x19
#_06F749: db  -4 ; 0x1A
#_06F74A: db -12 ; 0x1B
#_06F74B: db   5 ; 0x1C
#_06F74C: db -32 ; 0x1D
#_06F74D: db  -2 ; 0x1E
#_06F74E: db   4 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_x_high
#_06F74F: db   0 ; 0x00
#_06F750: db   0 ; 0x01
#_06F751: db   0 ; 0x02
#_06F752: db  -1 ; 0x03
#_06F753: db  -1 ; 0x04
#_06F754: db   0 ; 0x05
#_06F755: db   0 ; 0x06
#_06F756: db  -1 ; 0x07
#_06F757: db   0 ; 0x08
#_06F758: db  -1 ; 0x09
#_06F759: db  -1 ; 0x0A
#_06F75A: db   0 ; 0x0B
#_06F75B: db  -1 ; 0x0C
#_06F75C: db  -1 ; 0x0D
#_06F75D: db   0 ; 0x0E
#_06F75E: db   0 ; 0x0F

#_06F75F: db   0 ; 0x10
#_06F760: db   0 ; 0x11
#_06F761: db   0 ; 0x12
#_06F762: db  -1 ; 0x13
#_06F763: db   0 ; 0x14
#_06F764: db   0 ; 0x15
#_06F765: db  -1 ; 0x16
#_06F766: db  -1 ; 0x17
#_06F767: db  -1 ; 0x18
#_06F768: db   0 ; 0x19
#_06F769: db  -1 ; 0x1A
#_06F76A: db  -1 ; 0x1B
#_06F76B: db   0 ; 0x1C
#_06F76C: db  -1 ; 0x1D
#_06F76D: db  -1 ; 0x1E
#_06F76E: db   0 ; 0x1F

;---------------------------------------------------------------------------------------------------

.width
#_06F76F: db  12 ; 0x00
#_06F770: db   1 ; 0x01
#_06F771: db  16 ; 0x02
#_06F772: db  20 ; 0x03
#_06F773: db  20 ; 0x04
#_06F774: db   8 ; 0x05
#_06F775: db   4 ; 0x06
#_06F776: db  32 ; 0x07
#_06F777: db  48 ; 0x08
#_06F778: db  24 ; 0x09
#_06F779: db  32 ; 0x0A
#_06F77A: db  32 ; 0x0B
#_06F77B: db  32 ; 0x0C
#_06F77C: db  48 ; 0x0D
#_06F77D: db  12 ; 0x0E
#_06F77E: db  12 ; 0x0F

#_06F77F: db  60 ; 0x10
#_06F780: db 124 ; 0x11
#_06F781: db  12 ; 0x12
#_06F782: db  32 ; 0x13
#_06F783: db   4 ; 0x14
#_06F784: db  12 ; 0x15
#_06F785: db  48 ; 0x16
#_06F786: db  32 ; 0x17
#_06F787: db  40 ; 0x18
#_06F788: db   8 ; 0x19
#_06F789: db  24 ; 0x1A
#_06F78A: db  24 ; 0x1B
#_06F78B: db   5 ; 0x1C
#_06F78C: db  80 ; 0x1D
#_06F78D: db   4 ; 0x1E
#_06F78E: db   8 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_y_low
#_06F78F: db   0 ; 0x00
#_06F790: db   3 ; 0x01
#_06F791: db   4 ; 0x02
#_06F792: db  -4 ; 0x03
#_06F793: db  -8 ; 0x04
#_06F794: db   2 ; 0x05
#_06F795: db   0 ; 0x06
#_06F796: db -16 ; 0x07
#_06F797: db  12 ; 0x08
#_06F798: db  -4 ; 0x09
#_06F799: db  -8 ; 0x0A
#_06F79A: db   0 ; 0x0B
#_06F79B: db -10 ; 0x0C
#_06F79C: db -16 ; 0x0D
#_06F79D: db   2 ; 0x0E
#_06F79E: db   2 ; 0x0F

#_06F79F: db   2 ; 0x10
#_06F7A0: db   2 ; 0x11
#_06F7A1: db  -3 ; 0x12
#_06F7A2: db -12 ; 0x13
#_06F7A3: db   2 ; 0x14
#_06F7A4: db  10 ; 0x15
#_06F7A5: db   0 ; 0x16
#_06F7A6: db -12 ; 0x17
#_06F7A7: db  16 ; 0x18
#_06F7A8: db   4 ; 0x19
#_06F7A9: db  -4 ; 0x1A
#_06F7AA: db -12 ; 0x1B
#_06F7AB: db   3 ; 0x1C
#_06F7AC: db -16 ; 0x1D
#_06F7AD: db  -8 ; 0x1E
#_06F7AE: db  10 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_y_high
#_06F7AF: db   0 ; 0x00
#_06F7B0: db   0 ; 0x01
#_06F7B1: db   0 ; 0x02
#_06F7B2: db  -1 ; 0x03
#_06F7B3: db  -1 ; 0x04
#_06F7B4: db   0 ; 0x05
#_06F7B5: db   0 ; 0x06
#_06F7B6: db  -1 ; 0x07
#_06F7B7: db   0 ; 0x08
#_06F7B8: db  -1 ; 0x09
#_06F7B9: db  -1 ; 0x0A
#_06F7BA: db   0 ; 0x0B
#_06F7BB: db  -1 ; 0x0C
#_06F7BC: db  -1 ; 0x0D
#_06F7BD: db   0 ; 0x0E
#_06F7BE: db   0 ; 0x0F

#_06F7BF: db   0 ; 0x10
#_06F7C0: db   0 ; 0x11
#_06F7C1: db  -1 ; 0x12
#_06F7C2: db  -1 ; 0x13
#_06F7C3: db   0 ; 0x14
#_06F7C4: db   0 ; 0x15
#_06F7C5: db   0 ; 0x16
#_06F7C6: db  -1 ; 0x17
#_06F7C7: db   0 ; 0x18
#_06F7C8: db   0 ; 0x19
#_06F7C9: db  -1 ; 0x1A
#_06F7CA: db  -1 ; 0x1B
#_06F7CB: db   0 ; 0x1C
#_06F7CC: db  -1 ; 0x1D
#_06F7CD: db  -1 ; 0x1E
#_06F7CE: db   0 ; 0x1F

;---------------------------------------------------------------------------------------------------

.height
#_06F7CF: db  14 ; 0x00
#_06F7D0: db   1 ; 0x01
#_06F7D1: db  16 ; 0x02
#_06F7D2: db  21 ; 0x03
#_06F7D3: db  24 ; 0x04
#_06F7D4: db   4 ; 0x05
#_06F7D5: db   8 ; 0x06
#_06F7D6: db  40 ; 0x07
#_06F7D7: db  20 ; 0x08
#_06F7D8: db  24 ; 0x09
#_06F7D9: db  40 ; 0x0A
#_06F7DA: db  29 ; 0x0B
#_06F7DB: db  36 ; 0x0C
#_06F7DC: db  48 ; 0x0D
#_06F7DD: db  60 ; 0x0E
#_06F7DE: db 124 ; 0x0F

#_06F7DF: db  12 ; 0x10
#_06F7E0: db  12 ; 0x11
#_06F7E1: db  17 ; 0x12
#_06F7E2: db  28 ; 0x13
#_06F7E3: db   4 ; 0x14
#_06F7E4: db   2 ; 0x15
#_06F7E5: db  28 ; 0x16
#_06F7E6: db  20 ; 0x17
#_06F7E7: db  10 ; 0x18
#_06F7E8: db   4 ; 0x19
#_06F7E9: db  24 ; 0x1A
#_06F7EA: db  16 ; 0x1B
#_06F7EB: db   5 ; 0x1C
#_06F7EC: db  48 ; 0x1D
#_06F7ED: db   8 ; 0x1E
#_06F7EE: db  12 ; 0x1F

pool off

;---------------------------------------------------------------------------------------------------

Sprite_SetupHitBox:
#_06F7EF: LDA.w $0F70,X
#_06F7F2: BMI .too_high

#_06F7F4: PHY

#_06F7F5: LDA.w $0F60,X
#_06F7F8: AND.b #$1F
#_06F7FA: TAY

#_06F7FB: LDA.w $0D10,X
#_06F7FE: CLC
#_06F7FF: ADC.w .offset_x_low,Y
#_06F802: STA.b $04

#_06F804: LDA.w $0D30,X
#_06F807: ADC.w .offset_x_high,Y
#_06F80A: STA.b $0A

#_06F80C: LDA.w $0D00,X
#_06F80F: CLC
#_06F810: ADC.w .offset_y_low,Y

#_06F813: PHP
#_06F814: SEC
#_06F815: SBC.w $0F70,X
#_06F818: STA.b $05

#_06F81A: LDA.w $0D20,X
#_06F81D: SBC.b #$00

#_06F81F: PLP
#_06F820: ADC.w .offset_y_high,Y
#_06F823: STA.b $0B

#_06F825: LDA.w .width,Y
#_06F828: STA.b $06

#_06F82A: LDA.w .height,Y
#_06F82D: STA.b $07

#_06F82F: PLY

#_06F830: RTS

;---------------------------------------------------------------------------------------------------

.too_high
#_06F831: LDA.b #$80
#_06F833: STA.b $0A

#_06F835: RTS

;===================================================================================================

CheckIfHitBoxesOverlap:
#_06F836: PHX

#_06F837: LDX.b #$01

.check_other_side
#_06F839: LDA.b $04,X
#_06F83B: SEC
#_06F83C: SBC.b $00,X

#_06F83E: PHA
#_06F83F: PHP

#_06F840: CLC
#_06F841: ADC.b $06,X
#_06F843: STA.b $0F

#_06F845: PLP

#_06F846: LDA.b $0A,X
#_06F848: SBC.b $08,X
#_06F84A: STA.b $0C

#_06F84C: PLA
#_06F84D: CLC
#_06F84E: ADC.b #$80

#_06F850: LDA.b $0C
#_06F852: ADC.b #$00
#_06F854: BNE .no_overlap

#_06F856: LDA.b $02,X
#_06F858: CLC
#_06F859: ADC.b $06,X

#_06F85B: CMP.b $0F
#_06F85D: BCC .no_overlap

#_06F85F: DEX
#_06F860: BPL .check_other_side

;---------------------------------------------------------------------------------------------------

.no_overlap
#_06F862: PLX

#_06F863: RTS

;===================================================================================================

SpriteDraw_AllocateOAMDeferToPlayer_long:
#_06F864: PHB
#_06F865: PHK
#_06F866: PLB

#_06F867: JSR SpriteDraw_AllocateOAMDeferToPlayer

#_06F86A: PLB

#_06F86B: RTL

;===================================================================================================

SpriteDraw_AllocateOAMDeferToPlayer:
#_06F86C: LDA.w $0F20,X
#_06F86F: CMP.b $EE
#_06F871: BNE .exit

#_06F873: JSR Sprite_IsRightOfLink

#_06F876: LDA.b $0F
#_06F878: CLC
#_06F879: ADC.b #$10

#_06F87B: CMP.b #$20
#_06F87D: BCS .exit

#_06F87F: JSR Sprite_IsBelowLink

#_06F882: LDA.b $0E
#_06F884: CLC
#_06F885: ADC.b #$20

#_06F887: CMP.b #$48
#_06F889: BCS .exit

#_06F88B: LDA.w $0E40,X
#_06F88E: AND.b #$1F
#_06F890: INC A
#_06F891: ASL A
#_06F892: ASL A

#_06F893: CPY.b #$00
#_06F895: BEQ .use_region_b

.use_region_c
#_06F897: JSL SpriteDraw_AllocateOAMFromRegionC

#_06F89B: BRA .exit

.use_region_b
#_06F89D: JSL SpriteDraw_AllocateOAMFromRegionB

.exit
#_06F8A1: RTS

;===================================================================================================

SpriteModule_Die:
#_06F8A2: LDA.w $0E20,X
#_06F8A5: CMP.b #$EC ; SPRITE EC
#_06F8A7: BNE .not_foliage

#_06F8A9: JSR ThrowableScenery_ScatterIntoDebris

#_06F8AC: RTS

;---------------------------------------------------------------------------------------------------

.not_foliage
#_06F8AD: CMP.b #$53 ; SPRITE 53
#_06F8AF: BEQ .just_draw

#_06F8B1: CMP.b #$54 ; SPRITE 54
#_06F8B3: BEQ .just_draw

#_06F8B5: CMP.b #$92 ; SPRITE 92
#_06F8B7: BEQ .just_draw

#_06F8B9: CMP.b #$4A ; SPRITE 4A
#_06F8BB: BNE .not_enemy_bomb

#_06F8BD: LDA.w $0DB0,X
#_06F8C0: CMP.b #$02
#_06F8C2: BCS .just_draw

.not_enemy_bomb
#_06F8C4: LDA.w $0DF0,X
#_06F8C7: BEQ Sprite_DoTheDeath

.kyameron_respawn
#_06F8C9: LDA.w $0E60,X
#_06F8CC: BMI .just_draw

#_06F8CE: LDA.b $1A
#_06F8D0: AND.b #$03
#_06F8D2: ORA.b $11
#_06F8D4: ORA.w $0FC1
#_06F8D7: BNE .delay_the_inevitable

#_06F8D9: INC.w $0DF0,X

.delay_the_inevitable
#_06F8DC: JSR SpriteDeath_DrawPoof

;---------------------------------------------------------------------------------------------------

#_06F8DF: LDA.w $0E20,X
#_06F8E2: CMP.b #$40 ; SPRITE 40
#_06F8E4: BEQ .aga_barrier

#_06F8E6: LDA.w $0DF0,X
#_06F8E9: CMP.b #$0A
#_06F8EB: BCC .dont_draw_barrier

.aga_barrier
#_06F8ED: REP #$20

#_06F8EF: LDA.b $90
#_06F8F1: CLC
#_06F8F2: ADC.w #$0010
#_06F8F5: STA.b $90

#_06F8F7: LDA.b $92
#_06F8F9: CLC
#_06F8FA: ADC.w #$0004
#_06F8FD: STA.b $92

#_06F8FF: SEP #$20

#_06F901: LDA.w $0E40,X
#_06F904: PHA

#_06F905: SEC
#_06F906: SBC.b #$04
#_06F908: STA.w $0E40,X

#_06F90B: JSR SpriteModule_Active

#_06F90E: PLA
#_06F90F: STA.w $0E40,X

.dont_draw_barrier
#_06F912: RTS

;---------------------------------------------------------------------------------------------------

.just_draw
#_06F913: JSR SpriteModule_Active

#_06F916: RTS

;===================================================================================================

Sprite_DoTheDeath_long:
#_06F917: PHB
#_06F918: PHK
#_06F919: PLB

#_06F91A: JSR Sprite_DoTheDeath

#_06F91D: PLB

#_06F91E: RTL

;===================================================================================================

pool Sprite_DoTheDeath

.pikit_loot
#_06F91F: db $DC ; SPRITE DC - 1 bomb
#_06F920: db $E1 ; SPRITE E1 - 1 arrow
#_06F921: db $D9 ; SPRITE D9 - 1 rupee
#_06F922: db $E6 ; SPRITE E6 - 1 shield

pool off

;---------------------------------------------------------------------------------------------------

Sprite_DoTheDeath:
#_06F923: LDA.w $0E20,X
#_06F926: CMP.b #$BE ; SPRITE BE
#_06F928: BNE .not_mini_vitty

#_06F92A: DEC.w $0ED0

.not_mini_vitty
#_06F92D: CMP.b #$AA ; SPRITE AA
#_06F92F: BNE .pikit_no

#_06F931: LDY.w $0E90,X
#_06F934: BEQ .pikit_no

#_06F936: LDA.w .pikit_loot-1,Y

#_06F939: LDY.w $0E30,X
#_06F93C: PHY

#_06F93D: JSR PrepareEnemyDrop

#_06F940: PLA
#_06F941: STA.w $0E30,X

;---------------------------------------------------------------------------------------------------

#_06F944: DEC A
#_06F945: BNE .skip_pikit_item_props

#_06F947: LDA.b #$09
#_06F949: STA.w $0F50,X

#_06F94C: LDA.b #$F0
#_06F94E: STA.w $0E60,X

.skip_pikit_item_props
#_06F951: INC.w $0EB0,X

#_06F954: RTS

;---------------------------------------------------------------------------------------------------

.pikit_no
#_06F955: LDA.w $0E20,X
#_06F958: CMP.b #$45 ; SPRITE 45
#_06F95A: BNE .not_snitch_guard

#_06F95C: LDA.l $7EF3C5
#_06F960: CMP.b #$02
#_06F962: BNE .not_snitch_guard

#_06F964: LDA.w $040A
#_06F967: CMP.b #$18 ; OW 18
#_06F969: BNE .not_snitch_guard

#_06F96B: LDA.b #$07 ; SONG 07
#_06F96D: STA.w $012C

.not_snitch_guard
#_06F970: LDY.w $0CBA,X
#_06F973: BEQ .no_forced_drop

#_06F975: LDA.w $0BC0,X
#_06F978: STA.w $0E30,X

#_06F97B: LDA.b #$FF
#_06F97D: STA.w $0BC0,X

#_06F980: LDA.b #$E4 ; SPRITE E4
#_06F982: CPY.b #$01
#_06F984: BEQ PrepareEnemyDrop

#_06F986: LDA.b #$E5 ; SPRITE E5
#_06F988: CPY.b #$03
#_06F98A: BNE PrepareEnemyDrop

#_06F98C: LDA.b #$D9 ; SPRITE D9
#_06F98E: BRA PrepareEnemyDrop

;---------------------------------------------------------------------------------------------------

.no_forced_drop
#_06F990: LDA.w $0BE0,X
#_06F993: AND.b #$0F
#_06F995: BEQ .no_drop

#_06F997: DEC A
#_06F998: PHA

#_06F999: LDY.w $0CF9
#_06F99C: BEQ .no_luck_override

#_06F99E: INC.w $0CFA

#_06F9A1: LDA.w $0CFA
#_06F9A4: CMP.b #10
#_06F9A6: BCC .no_luck_reset

#_06F9A8: STZ.w $0CF9

.no_luck_reset
#_06F9AB: PLA

#_06F9AC: CPY.b #$01
#_06F9AE: BEQ .good_drop_luck

.no_drop
#_06F9B0: BRA .you_dont_get_a_drop

.no_luck_override
#_06F9B2: JSL GetRandomNumber

#_06F9B6: PLY

#_06F9B7: AND.w PrizePackRarities,Y
#_06F9BA: BNE .you_dont_get_a_drop

;===================================================================================================

#ForcePrizeDrop:
#_06F9BC: TYA

.good_drop_luck
#_06F9BD: ASL A
#_06F9BE: ASL A
#_06F9BF: ASL A
#_06F9C0: ORA.w $0FC7,Y
#_06F9C3: PHA

#_06F9C4: LDA.w $0FC7,Y
#_06F9C7: INC A
#_06F9C8: AND.b #$07
#_06F9CA: STA.w $0FC7,Y

#_06F9CD: PLY

#_06F9CE: LDA.w PrizePackPrizes,Y

;===================================================================================================

#PrepareEnemyDrop:
#_06F9D1: STA.w $0E20,X

#_06F9D4: CMP.b #$E5 ; SPRITE E5
#_06F9D6: BNE .not_big_key_drop

#_06F9D8: JSR SpritePrep_BigKey_load_graphics
#_06F9DB: BRA .spawn_drop

.not_big_key_drop
#_06F9DD: CMP.b #$E4 ; SPRITE E4
#_06F9DF: BNE .spawn_drop

#_06F9E1: JSR SpritePrep_SetKeyIndex

;---------------------------------------------------------------------------------------------------

.spawn_drop
#_06F9E4: LDA.b #$09
#_06F9E6: STA.w $0DD0,X

#_06F9E9: LDA.w $0F70,X
#_06F9EC: PHA

#_06F9ED: JSL SpritePrep_LoadProperties

#_06F9F1: INC.w $0BA0,X

#_06F9F4: LDY.w $0E20,X

#_06F9F7: LDA.w ItemDropBounceProps-$D9,Y
#_06F9FA: PHA

#_06F9FB: AND.b #$F0
#_06F9FD: STA.w $0F80,X

#_06FA00: PLA
#_06FA01: AND.b #$0F

#_06FA03: CLC
#_06FA04: ADC.w $0D10,X
#_06FA07: STA.w $0D10,X

#_06FA0A: LDA.w $0D30,X
#_06FA0D: ADC.b #$00
#_06FA0F: STA.w $0D30,X

#_06FA12: PLA
#_06FA13: STA.w $0F70,X

#_06FA16: LDA.b #$15
#_06FA18: STA.w $0F10,X

#_06FA1B: LDA.b #$FF
#_06FA1D: STA.w $0B58,X

#_06FA20: BRA .post_death_stuff

;---------------------------------------------------------------------------------------------------

.you_dont_get_a_drop
#_06FA22: STZ.w $0DD0,X

.post_death_stuff
#_06FA25: LDA.w $0E20,X
#_06FA28: CMP.b #$A2 ; SPRITE A2
#_06FA2A: BNE .not_dead_kholdstares

#_06FA2C: JSL CheckIfScreenIsClear
#_06FA30: BCC .not_dead_kholdstares

#_06FA32: LDA.b #$04
#_06FA34: JSL Ancilla_SpawnFallingPrize

.not_dead_kholdstares
#_06FA38: JSL Sprite_ManuallySetDeathFlagUW

#_06FA3C: INC.w $0CFB

#_06FA3F: LDA.w $0E20,X
#_06FA42: CMP.b #$40 ; SPRITE 40
#_06FA44: BNE .not_barrier

#_06FA46: LDA.b #$09
#_06FA48: STA.w $0DD0,X

#_06FA4B: LDA.b #$04
#_06FA4D: STA.w $0DC0,X

#_06FA50: JMP.w SpriteModule_Die_kyameron_respawn

.not_barrier
#_06FA53: RTS

;===================================================================================================

ForcePrizeDrop_long:
#_06FA54: PHB
#_06FA55: PHK
#_06FA56: PLB

#_06FA57: JSR ForcePrizeDrop

#_06FA5A: PLB

#_06FA5B: RTL

;===================================================================================================

PrizePackRarities:
#_06FA5C: db $01 ; pack 1 :  50%
#_06FA5D: db $01 ; pack 2 :  50%
#_06FA5E: db $01 ; pack 3 :  50%
#_06FA5F: db $00 ; pack 4 : 100%
#_06FA60: db $01 ; pack 5 :  50%
#_06FA61: db $01 ; pack 6 :  50%
#_06FA62: db $01 ; pack 7 :  50%
#_06FA63: db $00 ; pack 8 : 100% - doesn't exist

;===================================================================================================

ItemDropBounceProps:
#_06FA64: db $24 ; GREEN RUPEE
#_06FA65: db $24 ; BLUE RUPEE
#_06FA66: db $24 ; RED RUPEE
#_06FA67: db $20 ; BOMB REFILL 1
#_06FA68: db $20 ; BOMB REFILL 4
#_06FA69: db $20 ; BOMB REFILL 8
#_06FA6A: db $24 ; SMALL MAGIC DECANTER
#_06FA6B: db $24 ; LARGE MAGIC DECANTER
#_06FA6C: db $24 ; ARROW REFILL 5
#_06FA6D: db $24 ; ARROW REFILL 10
#_06FA6E: db $00 ; FAIRY
#_06FA6F: db $24 ; SMALL KEY
#_06FA70: db $20 ; BIG KEY
#_06FA71: db $20 ; STOLEN SHIELD

;===================================================================================================

PrizePackPrizes:

.pack_1
#_06FA72: db $D8 ; SPRITE D8 - heart
#_06FA73: db $D8 ; SPRITE D8 - heart
#_06FA74: db $D8 ; SPRITE D8 - heart
#_06FA75: db $D8 ; SPRITE D8 - heart
#_06FA76: db $D9 ; SPRITE D9 - green rupee
#_06FA77: db $D8 ; SPRITE D8 - heart
#_06FA78: db $D8 ; SPRITE D8 - heart
#_06FA79: db $D9 ; SPRITE D9 - green rupee

;---------------------------------------------------------------------------------------------------

.pack_2
#_06FA7A: db $DA ; SPRITE DA - blue rupee
#_06FA7B: db $D9 ; SPRITE D9 - green rupee
#_06FA7C: db $DA ; SPRITE DA - blue rupee
#_06FA7D: db $DB ; SPRITE DB - red rupee
#_06FA7E: db $DA ; SPRITE DA - blue rupee
#_06FA7F: db $D9 ; SPRITE D9 - green rupee
#_06FA80: db $DA ; SPRITE DA - blue rupee
#_06FA81: db $DA ; SPRITE DA - blue rupee

;---------------------------------------------------------------------------------------------------

.pack_3
#_06FA82: db $E0 ; SPRITE E0 - full magic
#_06FA83: db $DF ; SPRITE DF - small magic
#_06FA84: db $DF ; SPRITE DF - small magic
#_06FA85: db $DA ; SPRITE DA - blue rupee
#_06FA86: db $E0 ; SPRITE E0 - full magic
#_06FA87: db $DF ; SPRITE DF - small magic
#_06FA88: db $D8 ; SPRITE D8 - heart
#_06FA89: db $DF ; SPRITE DF - small magic

;---------------------------------------------------------------------------------------------------

.pack_4
#_06FA8A: db $DC ; SPRITE DC - 1 bomb
#_06FA8B: db $DC ; SPRITE DC - 1 bomb
#_06FA8C: db $DC ; SPRITE DC - 1 bomb
#_06FA8D: db $DD ; SPRITE DD - 4 bombs
#_06FA8E: db $DC ; SPRITE DC - 1 bomb
#_06FA8F: db $DC ; SPRITE DC - 1 bomb
#_06FA90: db $DE ; SPRITE DE - 8 bombs
#_06FA91: db $DC ; SPRITE DC - 1 bomb

;---------------------------------------------------------------------------------------------------

.pack_5
#_06FA92: db $E1 ; SPRITE E1 - 5 arrows
#_06FA93: db $D8 ; SPRITE D8 - heart
#_06FA94: db $E1 ; SPRITE E1 - 5 arrows
#_06FA95: db $E2 ; SPRITE E2 - 10 arrows
#_06FA96: db $E1 ; SPRITE E1 - 5 arrows
#_06FA97: db $D8 ; SPRITE D8 - heart
#_06FA98: db $E1 ; SPRITE E1 - 5 arrows
#_06FA99: db $E2 ; SPRITE E2 - 10 arrows

;---------------------------------------------------------------------------------------------------

.pack_6
#_06FA9A: db $DF ; SPRITE DF - small magic
#_06FA9B: db $D9 ; SPRITE D9 - green rupee
#_06FA9C: db $D8 ; SPRITE D8 - heart
#_06FA9D: db $E1 ; SPRITE E1 - 5 arrows
#_06FA9E: db $DF ; SPRITE DF - small magic
#_06FA9F: db $DC ; SPRITE DC - 1 bomb
#_06FAA0: db $D9 ; SPRITE D9 - green rupee
#_06FAA1: db $D8 ; SPRITE D8 - heart

;---------------------------------------------------------------------------------------------------

.pack_7
#_06FAA2: db $D8 ; SPRITE D8 - heart
#_06FAA3: db $E3 ; SPRITE E3 - fairy
#_06FAA4: db $E0 ; SPRITE E0 - full magic
#_06FAA5: db $DB ; SPRITE DB - red rupee
#_06FAA6: db $DE ; SPRITE DE - 8 bombs
#_06FAA7: db $D8 ; SPRITE D8 - heart
#_06FAA8: db $DB ; SPRITE DB - red rupee
#_06FAA9: db $E2 ; SPRITE E2 - 10 arrows

;===================================================================================================

pool SpriteDeath_DrawPoof

.offset_x
#_06FAAA: db   0,   0,   0,   8
#_06FAAE: db   0,   8,   0,   8
#_06FAB2: db   8,   8,   0,   8
#_06FAB6: db   0,   8,   0,   8
#_06FABA: db   0,   8,   0,   8
#_06FABE: db   0,   8,   0,   8
#_06FAC2: db  -3,  11,  -3,  11
#_06FAC6: db  -6,  14,  -6,  14

.offset_y
#_06FACA: db   0,   0,   8,   8
#_06FACE: db   0,   0,   8,   8
#_06FAD2: db   0,   0,   8,   8
#_06FAD6: db   0,   0,   8,   8
#_06FADA: db   0,   0,   8,   8
#_06FADE: db   0,   0,   8,   8
#_06FAE2: db  -3,  -3,  11,  11
#_06FAE6: db  -6,  -6,  14,  14

.char
#_06FAEA: db $00, $B9, $00, $00
#_06FAEE: db $B4, $B5, $B5, $B4
#_06FAF2: db $B9, $00, $00, $00
#_06FAF6: db $B5, $B4, $B4, $B5
#_06FAFA: db $A8, $A8, $B8, $B8
#_06FAFE: db $A8, $A8, $B8, $B8
#_06FB02: db $A9, $A9, $A9, $A9
#_06FB06: db $9B, $9B, $9B, $9B

.prop
#_06FB0A: db $04, $04, $04, $04
#_06FB0E: db $04, $04, $C4, $C4
#_06FB12: db $44, $04, $04, $04
#_06FB16: db $44, $44, $84, $84
#_06FB1A: db $04, $44, $04, $44
#_06FB1E: db $04, $44, $04, $44
#_06FB22: db $44, $04, $C4, $84
#_06FB26: db $04, $44, $84, $C4

pool off

;---------------------------------------------------------------------------------------------------

SpriteDeath_DrawPoof:
#_06FB2A: LDA.w $046C
#_06FB2D: CMP.b #$04
#_06FB2F: BNE .keep_priority_as_is

#_06FB31: LDA.b #$30
#_06FB33: STA.w $0B89,X

.keep_priority_as_is
#_06FB36: JSR Sprite_PrepOAMCoord

#_06FB39: LDA.w $0E60,X
#_06FB3C: AND.b #$20
#_06FB3E: LSR A
#_06FB3F: LSR A
#_06FB40: LSR A
#_06FB41: STA.b $0C

#_06FB43: PHX

#_06FB44: LDA.b #$03
#_06FB46: STA.b $00

#_06FB48: LDA.w $0DF0,X
#_06FB4B: AND.b #$1C
#_06FB4D: EOR.b #$1C

#_06FB4F: CLC
#_06FB50: ADC.b $00
#_06FB52: TAX

;---------------------------------------------------------------------------------------------------

.next_object
#_06FB53: PHY

#_06FB54: LDA.w .char,X
#_06FB57: BEQ .skip

#_06FB59: INY
#_06FB5A: INY

#_06FB5B: STA.b ($90),Y

#_06FB5D: LDA.w $0FA9
#_06FB60: SEC
#_06FB61: SBC.b $0C

#_06FB63: CLC
#_06FB64: ADC.w .offset_y,X

#_06FB67: DEY

#_06FB68: STA.b ($90),Y

#_06FB6A: LDA.w $0FA8
#_06FB6D: SEC
#_06FB6E: SBC.b $0C

#_06FB70: CLC
#_06FB71: ADC.w .offset_x,X

#_06FB74: DEY

#_06FB75: STA.b ($90),Y

#_06FB77: LDA.b $05
#_06FB79: AND.b #$30
#_06FB7B: ORA.w .prop,X

#_06FB7E: INY
#_06FB7F: INY
#_06FB80: INY

#_06FB81: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.skip
#_06FB83: PLY

#_06FB84: INY
#_06FB85: INY
#_06FB86: INY
#_06FB87: INY

#_06FB88: DEX

#_06FB89: DEC.b $00
#_06FB8B: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06FB8D: PLX

#_06FB8E: LDY.b #$00

#_06FB90: LDA.b #$03
#_06FB92: JSR Sprite_CorrectOAMEntries

#_06FB95: RTS

;===================================================================================================

pool SpriteModule_Fall2

.anim_step_a
#_06FB96: db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0C
#_06FB9E: db $0C, $0C, $0C, $0C, $03, $03, $03, $03
#_06FBA6: db $03, $02, $02, $02, $02, $01, $01, $01
#_06FBAE: db $01, $00, $00, $00, $00, $00, $00, $00

.anim_step_b
#_06FBB6: db $05, $05, $05, $05, $05, $05, $05, $04
#_06FBBE: db $04, $04, $04, $04, $03, $03, $03, $03
#_06FBC6: db $03, $02, $02, $02, $02, $01, $01, $01
#_06FBCE: db $01, $00, $00, $00, $00, $00, $00, $00

.frame_mask
#_06FBD6: db $FF, $3F, $1F, $0F, $0F, $07, $03, $01
#_06FBDE: db $FF, $3F, $1F, $0F, $07, $03, $01, $00

.head_data_offset
#_06FBE6: db $00, $04, $08, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteModule_Fall2:
#_06FBEA: LDA.w $0DF0,X
#_06FBED: BNE .falling

#_06FBEF: STZ.w $0DD0,X

#_06FBF2: JSL Sprite_ManuallySetDeathFlagUW

#_06FBF6: RTS

;---------------------------------------------------------------------------------------------------

.falling
#_06FBF7: CMP.b #$40
#_06FBF9: BCC .continue_a

#_06FBFB: LDA.w $0F50,X
#_06FBFE: CMP.b #$05
#_06FC00: BNE .not_pal3_ns1

#_06FC02: LDA.b #$3F
#_06FC04: STA.w $0DF0,X

#_06FC07: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.not_pal3_ns1
#_06FC09: LDA.w $0DF0,X
#_06FC0C: AND.b #$07
#_06FC0E: ORA.b $11
#_06FC10: ORA.w $0FC1
#_06FC13: BNE .skip_sfx31

#_06FC15: LDA.b #$31 ; SFX3.31
#_06FC17: JSL SpriteSFX_QueueSFX3WithPan

.skip_sfx31
#_06FC1B: JSR SpriteModule_Active
#_06FC1E: JSR Sprite_PrepOAMCoord

#_06FC21: LDA.b $02
#_06FC23: SEC
#_06FC24: SBC.b #$08
#_06FC26: STA.b $02

#_06FC28: LDA.b $03
#_06FC2A: SBC.b #$00
#_06FC2C: STA.b $03

#_06FC2E: LDA.w $0DF0,X
#_06FC31: CLC
#_06FC32: ADC.b #$14
#_06FC34: STA.b $06

#_06FC36: JSL Sprite_DrawDistress_custom

#_06FC3A: RTS

;---------------------------------------------------------------------------------------------------

.continue_a
#_06FC3B: CMP.b #$3D
#_06FC3D: BNE .skip_sfx20

#_06FC3F: PHA

#_06FC40: LDA.b #$20 ; SFX2.20
#_06FC42: JSL SpriteSFX_QueueSFX2WithPan

#_06FC46: PLA

;---------------------------------------------------------------------------------------------------

.skip_sfx20
#_06FC47: LSR A
#_06FC48: TAY

#_06FC49: LDA.w $0E20,X
#_06FC4C: CMP.b #$26 ; SPRITE 26
#_06FC4E: BEQ .is_beetle

#_06FC50: CMP.b #$13 ; SPRITE 13
#_06FC52: BNE .not_minihelma

.is_beetle
#_06FC54: LDA.w .anim_step_b,Y
#_06FC57: STA.w $0DC0,X

#_06FC5A: JSR SpriteDraw_FallingHelmaBeetle

#_06FC5D: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_minihelma
#_06FC5F: LDA.w .anim_step_a,Y
#_06FC62: CMP.b #$0C
#_06FC64: BCS .ignore_head

#_06FC66: LDY.w $0DE0,X

#_06FC69: CLC
#_06FC6A: ADC.w .head_data_offset,Y

.ignore_head
#_06FC6D: STA.w $0DC0,X

#_06FC70: JSR SpriteDraw_FallingHumanoid

.continue_b
#_06FC73: LDA.w $0DF0,X
#_06FC76: LSR A
#_06FC77: LSR A
#_06FC78: LSR A
#_06FC79: TAY

#_06FC7A: LDA.b $1A
#_06FC7C: AND.w .frame_mask,Y
#_06FC7F: ORA.b $11
#_06FC81: BNE .exit

;---------------------------------------------------------------------------------------------------

#_06FC83: LDY.b #$68
#_06FC85: JSR Sprite_CheckTileProperty

#_06FC88: LDA.w $0FA5
#_06FC8B: CMP.b #$20 ; TILETYPE 20
#_06FC8D: BEQ .dont_reset_recoil

#_06FC8F: STZ.w $0F30,X
#_06FC92: STZ.w $0F40,X

.dont_reset_recoil
#_06FC95: LDA.w $0F30,X
#_06FC98: STA.w $0D40,X

#_06FC9B: ASL A
#_06FC9C: PHP
#_06FC9D: ROR.w $0D40,X
#_06FCA0: PLP
#_06FCA1: ROR.w $0D40,X

#_06FCA4: LDA.w $0F40,X
#_06FCA7: STA.w $0D50,X

#_06FCAA: ASL A
#_06FCAB: PHP
#_06FCAC: ROR.w $0D50,X
#_06FCAF: PLP
#_06FCB0: ROR.w $0D50,X

#_06FCB3: JSR Sprite_Move_XY_Bank06

;---------------------------------------------------------------------------------------------------

.exit
#_06FCB6: RTS

;===================================================================================================

pool SpriteDraw_FallingHelmaBeetle

.oam_groups_beetle
#_06FCB7: dw   0,   0 : db $46, $01, $00, $02

#_06FCBF: dw   0,   0 : db $48, $01, $00, $02

#_06FCC7: dw   0,   0 : db $4A, $01, $00, $02

#_06FCCF: dw   4,   4 : db $4C, $01, $00, $00

#_06FCD7: dw   4,   4 : db $B7, $00, $00, $00

#_06FCDF: dw   4,   4 : db $80, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.oam_groups_mini_helma
#_06FCE7: dw   0,   0 : db $6C, $01, $00, $02

#_06FCEF: dw   0,   0 : db $6E, $01, $00, $02

#_06FCF7: dw   0,   0 : db $4E, $01, $00, $02

#_06FCFF: dw   4,   4 : db $5C, $01, $00, $00

#_06FD07: dw   4,   4 : db $B7, $00, $00, $00

#_06FD0F: dw   4,   4 : db $80, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_FallingHelmaBeetle:
#_06FD17: LDA.w $0E20,X
#_06FD1A: CMP.b #$13 ; SPRITE 13
#_06FD1C: BEQ .mini_helma

;---------------------------------------------------------------------------------------------------

#_06FD1E: LDA.w $0DC0,X

#_06FD21: ASL A
#_06FD22: ASL A
#_06FD23: ASL A

#_06FD24: ADC.b #.oam_groups_beetle>>0
#_06FD26: STA.b $08

#_06FD28: LDA.b #.oam_groups_beetle>>8

;---------------------------------------------------------------------------------------------------

.save_high_byte
#_06FD2A: ADC.b #$00
#_06FD2C: STA.b $09

#_06FD2E: LDA.b #$01
#_06FD30: JSL SpriteDraw_Tabulated

#_06FD34: RTS

;---------------------------------------------------------------------------------------------------

.mini_helma
#_06FD35: LDA.w $0DC0,X

#_06FD38: ASL A
#_06FD39: ASL A
#_06FD3A: ASL A

#_06FD3B: ADC.b #.oam_groups_mini_helma>>0
#_06FD3D: STA.b $08

#_06FD3F: LDA.b #.oam_groups_mini_helma>>8

#_06FD41: BRA .save_high_byte

;===================================================================================================

pool SpriteDraw_FallingHumanoid

.offset_x
#_06FD43: db  -4,   4,  -4,  12
#_06FD47: db   0,   0,   0,   0
#_06FD4B: db   0,   0,   0,   0
#_06FD4F: db   4,   0,   0,   0
#_06FD53: db  -4,  12,  -4,   4
#_06FD57: db   0,   0,   0,   0
#_06FD5B: db   0,   0,   0,   0
#_06FD5F: db   4,   0,   0,   0
#_06FD63: db  -4,  12,  -4,   4
#_06FD67: db   0,   0,   0,   0
#_06FD6B: db   0,   0,   0,   0
#_06FD6F: db   4,   0,   0,   0
#_06FD73: db   4,   0,   0,   0
#_06FD77: db   4,   0,   0,   0

.offset_y
#_06FD7B: db  -4,  -4,   4,  12
#_06FD7F: db   0,   0,   0,   0
#_06FD83: db   0,   0,   0,   0
#_06FD87: db   4,   0,   0,   0
#_06FD8B: db  -4,  -4,  12,   4
#_06FD8F: db   0,   0,   0,   0
#_06FD93: db   0,   0,   0,   0
#_06FD97: db   4,   0,   0,   0
#_06FD9B: db  -4,  -4,  12,   4
#_06FD9F: db   0,   0,   0,   0
#_06FDA3: db   0,   0,   0,   0
#_06FDA7: db   4,   0,   0,   0
#_06FDAB: db   4,   0,   0,   0
#_06FDAF: db   4,   0,   0,   0

.char
#_06FDB3: db $AE, $A8, $A6, $AF
#_06FDB7: db $AA, $00, $00, $00
#_06FDBB: db $AC, $00, $00, $00
#_06FDBF: db $BE, $00, $00, $00
#_06FDC3: db $A8, $AE, $AF, $A6
#_06FDC7: db $AA, $00, $00, $00
#_06FDCB: db $AC, $00, $00, $00
#_06FDCF: db $BE, $00, $00, $00
#_06FDD3: db $A6, $AF, $AE, $A8
#_06FDD7: db $AA, $00, $00, $00
#_06FDDB: db $AC, $00, $00, $00
#_06FDDF: db $BE, $00, $00, $00
#_06FDE3: db $B6, $00, $00, $00
#_06FDE7: db $80, $00, $00, $00

.prop
#_06FDEB: db $00, $00, $00, $00
#_06FDEF: db $00, $00, $00, $00
#_06FDF3: db $00, $00, $00, $00
#_06FDF7: db $00, $00, $00, $00
#_06FDFB: db $40, $40, $40, $40
#_06FDFF: db $40, $00, $00, $00
#_06FE03: db $40, $00, $00, $00
#_06FE07: db $40, $00, $00, $00
#_06FE0B: db $80, $80, $80, $80
#_06FE0F: db $80, $00, $00, $00
#_06FE13: db $80, $00, $00, $00
#_06FE17: db $80, $00, $00, $00
#_06FE1B: db $01, $00, $00, $00
#_06FE1F: db $01, $00, $00, $00

.size
#_06FE23: db $00, $02, $02, $00
#_06FE27: db $02, $00, $00, $00
#_06FE2B: db $02, $00, $00, $00
#_06FE2F: db $00, $00, $00, $00
#_06FE33: db $02, $00, $00, $02
#_06FE37: db $02, $00, $00, $00
#_06FE3B: db $02, $00, $00, $00
#_06FE3F: db $00, $00, $00, $00
#_06FE43: db $02, $00, $00, $02
#_06FE47: db $02, $00, $00, $00
#_06FE4B: db $02, $00, $00, $00
#_06FE4F: db $00, $00, $00, $00
#_06FE53: db $00, $00, $00, $00
#_06FE57: db $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

SpriteDraw_FallingHumanoid:
#_06FE5B: JSR Sprite_PrepOAMCoord

#_06FE5E: LDA.w $0DC0,X
#_06FE61: PHA

#_06FE62: ASL A
#_06FE63: ASL A
#_06FE64: STA.b $06

#_06FE66: PLA
#_06FE67: PHX

#_06FE68: LDX.b #$00

#_06FE6A: CMP.b #$0C
#_06FE6C: BCS .set_correction_quota

#_06FE6E: AND.b #$03
#_06FE70: BNE .set_correction_quota

#_06FE72: LDX.b #$03

.set_correction_quota
#_06FE74: STX.b $07

;---------------------------------------------------------------------------------------------------

.next_object
#_06FE76: PHX

#_06FE77: TXA
#_06FE78: CLC
#_06FE79: ADC.b $06
#_06FE7B: TAX

#_06FE7C: LDA.b $00
#_06FE7E: CLC
#_06FE7F: ADC.w .offset_x,X
#_06FE82: STA.b ($90),Y

#_06FE84: LDA.b $02
#_06FE86: CLC
#_06FE87: ADC.w .offset_y,X

#_06FE8A: INY

#_06FE8B: STA.b ($90),Y

#_06FE8D: LDA.w .char,X
#_06FE90: INY

#_06FE91: STA.b ($90),Y

#_06FE93: LDA.w .prop,X
#_06FE96: EOR.b $05
#_06FE98: INY

#_06FE99: STA.b ($90),Y

#_06FE9B: PHY

#_06FE9C: TYA
#_06FE9D: LSR A
#_06FE9E: LSR A
#_06FE9F: TAY

#_06FEA0: LDA.w .size,X
#_06FEA3: STA.b ($92),Y

#_06FEA5: PLY
#_06FEA6: INY

#_06FEA7: PLX
#_06FEA8: DEX
#_06FEA9: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06FEAB: PLX

#_06FEAC: LDY.b #$FF
#_06FEAE: LDA.b $07
#_06FEB0: JSR Sprite_CorrectOAMEntries

#_06FEB3: RTS

;===================================================================================================

Sprite_CorrectOAMEntries_long:
#_06FEB4: PHB
#_06FEB5: PHK
#_06FEB6: PLB

#_06FEB7: JSR Sprite_CorrectOAMEntries

#_06FEBA: PLB

#_06FEBB: RTL

;===================================================================================================

Sprite_CorrectOAMEntries:
#_06FEBC: JSR Sprite_GetScreenRelativeCoords

#_06FEBF: PHX

#_06FEC0: REP #$10

#_06FEC2: LDX.b $90
#_06FEC4: STX.b $0C

#_06FEC6: LDX.b $92
#_06FEC8: STX.b $0E

;---------------------------------------------------------------------------------------------------

.next_object
#_06FECA: LDX.b $0E

#_06FECC: LDA.b $0B
#_06FECE: BPL .make_small

#_06FED0: LDA.b $00,X
#_06FED2: AND.b #$02

.make_small
#_06FED4: STA.b $00,X

#_06FED6: LDY.w #$0000

#_06FED9: LDX.b $0C

#_06FEDB: LDA.b $00,X
#_06FEDD: SEC
#_06FEDE: SBC.b $07
#_06FEE0: BPL .positive_x

#_06FEE2: DEY

.positive_x
#_06FEE3: CLC
#_06FEE4: ADC.b $02
#_06FEE6: STA.b $04

#_06FEE8: TYA
#_06FEE9: ADC.b $03
#_06FEEB: STA.b $05

#_06FEED: JSR Sprite_CheckIfXOnScreen
#_06FEF0: BCC .not_offscreen_x

#_06FEF2: LDX.b $0E
#_06FEF4: INC.b $00,X

.not_offscreen_x
#_06FEF6: LDY.w #$0000

#_06FEF9: LDX.b $0C
#_06FEFB: INX

#_06FEFC: LDA.b $00,X
#_06FEFE: SEC
#_06FEFF: SBC.b $06
#_06FF01: BPL .positive_y

#_06FF03: DEY

.positive_y
#_06FF04: CLC
#_06FF05: ADC.b $00
#_06FF07: STA.b $09

#_06FF09: TYA
#_06FF0A: ADC.b $01
#_06FF0C: STA.b $0A

#_06FF0E: JSR Sprite_CheckIfYOnScreen
#_06FF11: BCC .not_offscreen_y

#_06FF13: LDA.b #$F0
#_06FF15: STA.b $00,X

.not_offscreen_y
#_06FF17: INX
#_06FF18: INX
#_06FF19: INX
#_06FF1A: STX.b $0C

#_06FF1C: INC.b $0E

#_06FF1E: DEC.b $08
#_06FF20: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_06FF22: SEP #$10

#_06FF24: PLX

#_06FF25: RTS

;===================================================================================================

Sprite_GetScreenRelativeCoords:
#_06FF26: STY.b $0B

#_06FF28: STA.b $08

#_06FF2A: LDA.w $0D00,X
#_06FF2D: STA.b $00

#_06FF2F: SEC
#_06FF30: SBC.b $E8
#_06FF32: STA.b $06

#_06FF34: LDA.w $0D20,X
#_06FF37: STA.b $01

#_06FF39: LDA.w $0D10,X
#_06FF3C: STA.b $02

#_06FF3E: SEC
#_06FF3F: SBC.b $E2
#_06FF41: STA.b $07

#_06FF43: LDA.w $0D30,X
#_06FF46: STA.b $03

#_06FF48: RTS

;===================================================================================================

Sprite_CheckIfXOnScreen:
#_06FF49: REP #$20

#_06FF4B: LDA.b $04
#_06FF4D: SEC
#_06FF4E: SBC.b $E2
#_06FF50: CMP.w #$0100

#_06FF53: SEP #$20

#_06FF55: RTS

;===================================================================================================

Sprite_CheckIfYOnScreen:
#_06FF56: REP #$20

#_06FF58: LDA.b $09
#_06FF5A: PHA

#_06FF5B: CLC
#_06FF5C: ADC.w #$0010
#_06FF5F: STA.b $09

#_06FF61: SEC
#_06FF62: SBC.b $E8
#_06FF64: CMP.w #$0100

#_06FF67: PLA
#_06FF68: STA.b $09

#_06FF6A: SEP #$20

#_06FF6C: RTS

;===================================================================================================

UNREACHABLE_06FF6D:
#_06FF6D: JSL Sprite_KillSelf

#_06FF71: RTS

;===================================================================================================

pool Sprite_CheckIfRecoiling_Bank06

.masks
#_06FF72: db $03, $01, $00, $00, $0C, $03

pool off

;---------------------------------------------------------------------------------------------------

Sprite_CheckIfRecoiling_Bank06:
#_06FF78: LDA.w $0EA0,X
#_06FF7B: BEQ .exit

#_06FF7D: AND.b #$7F
#_06FF7F: BEQ .recoil_over

#_06FF81: LDA.w $0D40,X
#_06FF84: PHA

#_06FF85: LDA.w $0D50,X
#_06FF88: PHA

#_06FF89: DEC.w $0EA0,X
#_06FF8C: BNE .still_recoiling

#_06FF8E: LDA.w $0F40,X
#_06FF91: CLC
#_06FF92: ADC.b #$20
#_06FF94: CMP.b #$40
#_06FF96: BCS .no_adjust

#_06FF98: LDA.w $0F30,X
#_06FF9B: CLC
#_06FF9C: ADC.b #$20
#_06FF9E: CMP.b #$40
#_06FFA0: BCC .still_recoiling

.no_adjust
#_06FFA2: LDA.b #$90
#_06FFA4: STA.w $0EA0,X

.still_recoiling
#_06FFA7: LDA.w $0EA0,X
#_06FFAA: BMI .no_movement

#_06FFAC: LSR A
#_06FFAD: LSR A
#_06FFAE: TAY

#_06FFAF: LDA.b $1A
#_06FFB1: AND.w .masks,Y
#_06FFB4: BNE .no_movement

#_06FFB6: LDA.w $0F30,X
#_06FFB9: STA.w $0D40,X

#_06FFBC: LDA.w $0F40,X
#_06FFBF: STA.w $0D50,X

#_06FFC2: LDA.w $0CD2,X
#_06FFC5: BMI .handle_movement

#_06FFC7: JSL Sprite_CheckTileCollision_long

#_06FFCB: LDA.w $0E70,X
#_06FFCE: AND.b #$0F
#_06FFD0: BEQ .handle_movement

.stop_horizontal_movement
#_06FFD2: CMP.b #$04
#_06FFD4: BCS .stop_vertical_movement

#_06FFD6: STZ.w $0F40,X
#_06FFD9: STZ.w $0D50,X

#_06FFDC: BRA .movement_stopped

.stop_vertical_movement
#_06FFDE: STZ.w $0F30,X
#_06FFE1: STZ.w $0D40,X

.movement_stopped
#_06FFE4: BRA .no_movement

.handle_movement
#_06FFE6: JSR Sprite_Move_XY_Bank06

.no_movement
#_06FFE9: PLA
#_06FFEA: STA.w $0D50,X

#_06FFED: PLA
#_06FFEE: STA.w $0D40,X

#_06FFF1: PLA
#_06FFF2: PLA

.exit
#_06FFF3: RTS

.recoil_over
#_06FFF4: STZ.w $0EA0,X

#_06FFF7: RTS

;===================================================================================================
; FREE ROM: 0x08
;===================================================================================================
NULL_06FFF8:
#_06FFF8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
