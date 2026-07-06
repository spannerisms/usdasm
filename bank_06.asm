org $068000

;===================================================================================================

SearchForFishToBuy:
|068000| PHB
|068001| PHK
|068002| PLB

|068003| LDY.b #$0F

.next
|068005| LDA.w $0DD0,Y
|068008| BEQ .inactive

|06800A| LDA.w $0E20,Y
|06800D| CMP.b #$D2 ; SPRITE D2
|06800F| BEQ .is_fish

.inactive
|068011| DEY
|068012| BPL .next

|068014| PLB

|068015| RTL

;---------------------------------------------------------------------------------------------------

.is_fish
|068016| LDA.w $0D10,X
|068019| STA.b $00

|06801B| LDA.w $0D30,X
|06801E| STA.b $08

|068020| LDA.b #$10
|068022| STA.b $02

|068024| LDA.w $0D00,X
|068027| STA.b $01

|068029| LDA.w $0D20,X
|06802C| STA.b $09

|06802E| LDA.b #$10
|068030| STA.b $03

|068032| PHX

|068033| TYX
|068034| JSR SetupSpriteHitbox

|068037| PLX

|068038| JSR CheckIfHitboxesOverlap
|06803B| BCC .no_good

|06803D| TYA
|06803E| ORA.b #$80
|068040| STA.w $0E90,X

.no_good
|068043| PLB

|068044| RTL

;===================================================================================================

pool PurchaseFloppingFish

.speed_x
|068045| db -6
|068046| db -3
|068047| db  0
|068048| db  4
|068049| db  7

.speed_y
|06804A| db 11
|06804B| db 14
|06804C| db 16
|06804D| db 14
|06804E| db 11

.item_id
|06804F| db $DB ; SPRITE DB - red rupee
|068050| db $E0 ; SPRITE E0 - large magic
|068051| db $DE ; SPRITE DE - 8 bombs
|068052| db $E2 ; SPRITE E2 - 10 arrows
|068053| db $D9 ; SPRITE D9 - green rupee

endpool

;---------------------------------------------------------------------------------------------------

PurchaseFloppingFish:
|068054| PHB
|068055| PHK
|068056| PLB

|068057| LDA.b #$13 ; SFX3.13
|068059| JSL QueueSpriteSFX3WithPan

|06805D| LDA.b #$04
|06805F| STA.w $0FB5

.next_gift
|068062| LDY.w $0FB5

|068065| LDA.w .item_id,Y
|068068| JSL SpawnSpriteDynamically
|06806C| BMI .skip

|06806E| JSL SetSpawnedSpriteCoordinates

|068072| LDA.b $00
|068074| CLC
|068075| ADC.b #$04
|068077| STA.w $0D10,Y

|06807A| LDA.b #$FF
|06807C| STA.w $0B58,Y

|06807F| PHX

|068080| LDX.w $0FB5

|068083| LDA.w .speed_x,X
|068086| STA.w $0D50,Y

|068089| LDA.w .speed_y,X
|06808C| STA.w $0D40,Y

|06808F| LDA.b #$20
|068091| STA.w $0F80,Y
|068094| STA.w $0F10,Y

|068097| PLX

.skip
|068098| DEC.w $0FB5
|06809B| BPL .next_gift

|06809D| PLB

|06809E| RTL

;===================================================================================================

CheatWhenNoOnesLooking:
|06809F| LDA.w $0C04,X
|0680A2| STA.b $02

|0680A4| LDA.w $0C18,X
|0680A7| STA.b $03

|0680A9| LDA.w $0BFA,X
|0680AC| STA.b $04

|0680AE| LDA.w $0C0E,X
|0680B1| STA.b $05

|0680B3| REP #$20

|0680B5| LDY.b #$70

|0680B7| LDA.b $22
|0680B9| SEC
|0680BA| SBC.b $02

|0680BC| CLC
|0680BD| ADC.w #$00F0

|0680C0| CMP.w #$01E0
|0680C3| BPL .positive_speed_x

|0680C5| LDY.b #$90

.positive_speed_x
|0680C7| BCC .nowdoY

|0680C9| STY.b $01

|0680CB| BRA .done

.nowdoY
|0680CD| LDY.b #$70

|0680CF| LDA.b $20
|0680D1| SEC
|0680D2| SBC.b $04

|0680D4| CLC
|0680D5| ADC.w #$00F0

|0680D8| CMP.w #$01E0
|0680DB| BPL .positive_Y_speed

|0680DD| LDY.b #$90

.positive_Y_speed
|0680DF| BCC .done

|0680E1| STY.b $00

.done
|0680E3| SEP #$20

|0680E5| RTL

;===================================================================================================

pool LetsGetReadyToRumble

.offset_x_low
|0680E6| db -32, -32, -32, 16

.offset_y_low
|0680EA| db -32, 32, -24, -24

.offset_y_high ; bleeds into next
|0680EE| db -1,  0

.offset_x_high
|0680F0| db -1, -1, -1, 0

.hitbox_w ; bleeds into next
|0680F4| db 80, 80

.hitbox_h
|0680F6| db 32, 32, 80, 80

endpool

;---------------------------------------------------------------------------------------------------

LetsGetReadyToRumble:
|0680FA| PHB
|0680FB| PHK
|0680FC| PLB

|0680FD| LDA.b $2F
|0680FF| LSR A
|068100| TAY

|068101| LDA.b $22
|068103| CLC
|068104| ADC.w .offset_x_low,Y
|068107| STA.b $00

|068109| LDA.b $23
|06810B| ADC.w .offset_x_high,Y
|06810E| STA.b $08

|068110| LDA.b $20
|068112| ADC.w .offset_y_low,Y
|068115| STA.b $01

|068117| LDA.b $21
|068119| ADC.w .offset_y_high,Y
|06811C| STA.b $09

|06811E| LDA.w .hitbox_w,Y
|068121| STA.b $02

|068123| LDA.w .hitbox_h,Y
|068126| STA.b $03

|068128| JSR ApplyRumbleToSprites

|06812B| PLB

|06812C| RTL

;===================================================================================================

SpawnImmediatelySmashedTerrain:
|06812D| LDY.w $0314
|068130| PHY

|068131| LDY.w $0FB2
|068134| PHY

|068135| PHB
|068136| PHK
|068137| PLB

|068138| JSL SpawnThrowableTerrain.silently
|06813C| BMI .fail

|06813E| JSR TransmuteThrowableToDebris

.fail
|068141| PLB

|068142| PLA
|068143| STA.w $0FB2

|068146| PLA
|068147| STA.w $0314

|06814A| RTL

;===================================================================================================

SpawnThrowableTerrain:
|06814B| PHA

|06814C| JSL CalculateLinkSFXPan
|068150| ORA.b #$1D ; SFX2.1D
|068152| STA.w $012E

|068155| PLA

;---------------------------------------------------------------------------------------------------

.silently
|068156| LDX.b #$0F

.next_slot
|068158| LDY.w $0DD0,X
|06815B| BEQ .free_slot

|06815D| DEX
|06815E| BPL .next_slot

|068160| RTL

;---------------------------------------------------------------------------------------------------

.free_slot
|068161| PHA

|068162| LDA.b #$0A
|068164| STA.w $0DD0,X

|068167| LDA.b #$EC ; SPRITE EC
|068169| STA.w $0E20,X

|06816C| LDA.b $00
|06816E| STA.w $0D10,X

|068171| LDA.b $01
|068173| STA.w $0D30,X

|068176| LDA.b $02
|068178| STA.w $0D00,X

|06817B| LDA.b $03
|06817D| STA.w $0D20,X

|068180| JSL LoadSpriteProperties

|068184| LDA.b $EE
|068186| STA.w $0F20,X

|068189| PLA
|06818A| STA.w $0DB0,X

|06818D| CMP.b #$06
|06818F| BCC .light_object

|068191| PHA

|068192| LDA.b #$A6
|068194| STA.w $0E40,X

|068197| PLA

;---------------------------------------------------------------------------------------------------

.light_object
|068198| CMP.b #$02
|06819A| BNE .not_bush_or_pot

|06819C| LDA.b $1B
|06819E| BEQ .not_bush_or_pot

|0681A0| LDA.b #$80
|0681A2| STA.w $0F50,X

.not_bush_or_pot
|0681A5| PHB
|0681A6| PHK
|0681A7| PLB

|0681A8| TAY

|0681A9| LDA.w SpriteDraw_ThrownItem.palette,Y
|0681AC| STA.w $0F50,X

|0681AF| LDA.b #$09
|0681B1| STA.l $7FFA2C,X

|0681B5| LDA.b #$02
|0681B7| STA.w $0314
|0681BA| STA.w $0FB2

|0681BD| LDA.b #$10
|0681BF| STA.w $0DF0,X

|0681C2| LDA.b $EE
|0681C4| STA.w $0F20,X

|0681C7| STZ.w $0DC0,X

|0681CA| LDA.w $0B9C
|0681CD| CMP.b #$FF
|0681CF| BEQ .exit

|0681D1| ORA.b $1B
|0681D3| BNE .no_substitution

|0681D5| LDA.w $0DB0,X
|0681D8| DEC A
|0681D9| DEC A
|0681DA| CMP.b #$02
|0681DC| BCS .no_substitution

|0681DE| JSL SubstituteAlternateSecret

.no_substitution
|0681E2| LDA.w $0B9C
|0681E5| BPL .normal

|0681E7| AND.b #$7F
|0681E9| STA.w $0DC0,X

|0681EC| STZ.w $0B9C

.normal
|0681EF| JSR SpawnSecret

.exit
|0681F2| PLB

|0681F3| RTL

;===================================================================================================

pool SpawnSecret

.ID
|0681F4| db $D9 ; SPRITE D9 - 0x01 - green rupee
|0681F5| db $3E ; SPRITE 3E - 0x02 - hoarder
|0681F6| db $79 ; SPRITE 79 - 0x03 - bee
|0681F7| db $D9 ; SPRITE D9 - 0x04 - green rupee
|0681F8| db $DC ; SPRITE DC - 0x05 - 1 bomb
|0681F9| db $D8 ; SPRITE D8 - 0x06 - heart
|0681FA| db $DA ; SPRITE DA - 0x07 - blue rupee
|0681FB| db $E4 ; SPRITE E4 - 0x08 - small key
|0681FC| db $E1 ; SPRITE E1 - 0x09 - 5 arrows
|0681FD| db $DC ; SPRITE DC - 0x0A - 1 bomb
|0681FE| db $D8 ; SPRITE D8 - 0x0B - heart
|0681FF| db $DF ; SPRITE DF - 0x0C - small magic
|068200| db $E0 ; SPRITE E0 - 0x0D - full magic
|068201| db $0B ; SPRITE 0B - 0x0E - cucco
|068202| db $42 ; SPRITE 42 - 0x0F - green guard
|068203| db $D3 ; SPRITE D3 - 0x10 - stal
|068204| db $41 ; SPRITE 41 - 0x11 - blue guard
|068205| db $D4 ; SPRITE D4 - 0x12 - landmine
|068206| db $D9 ; SPRITE D9 - 0x13 - green rupee
|068207| db $E3 ; SPRITE E3 - 0x14 - fairy
|068208| db $D8 ; SPRITE D8 - 0x15 - heart
|068209| db $00 ;             0x16 - null

;---------------------------------------------------------------------------------------------------

.mode
|06820A| db $00 ; 0x01 - green rupee
|06820B| db $01 ; 0x02 - hoarder
|06820C| db $01 ; 0x03 - bee
|06820D| db $00 ; 0x04 - green rupee
|06820E| db $00 ; 0x05 - 1 bomb
|06820F| db $00 ; 0x06 - heart
|068210| db $00 ; 0x07 - blue rupee
|068211| db $00 ; 0x08 - small key
|068212| db $00 ; 0x09 - 5 arrows
|068213| db $00 ; 0x0A - 1 bomb
|068214| db $03 ; 0x0B - heart
|068215| db $00 ; 0x0C - small magic
|068216| db $00 ; 0x0D - full magic
|068217| db $01 ; 0x0E - cucco
|068218| db $00 ; 0x0F - green guard
|068219| db $00 ; 0x10 - stal
|06821A| db $00 ; 0x11 - blue guard
|06821B| db $00 ; 0x12 - landmine
|06821C| db $00 ; 0x13 - green rupee
|06821D| db $00 ; 0x14 - fairy
|06821E| db $00 ; 0x15 - heart
|06821F| db $00 ; 0x16 - null

;---------------------------------------------------------------------------------------------------

.offset_x
|068220| db $04 ; 0x01 - green rupee
|068221| db $00 ; 0x02 - hoarder
|068222| db $04 ; 0x03 - bee
|068223| db $04 ; 0x04 - green rupee
|068224| db $00 ; 0x05 - 1 bomb
|068225| db $04 ; 0x06 - heart
|068226| db $04 ; 0x07 - blue rupee
|068227| db $04 ; 0x08 - small key
|068228| db $04 ; 0x09 - 5 arrows
|068229| db $00 ; 0x0A - 1 bomb
|06822A| db $04 ; 0x0B - heart
|06822B| db $04 ; 0x0C - small magic
|06822C| db $04 ; 0x0D - full magic
|06822D| db $00 ; 0x0E - cucco
|06822E| db $00 ; 0x0F - green guard
|06822F| db $00 ; 0x10 - stal
|068230| db $00 ; 0x11 - blue guard
|068231| db $00 ; 0x12 - landmine
|068232| db $04 ; 0x13 - green rupee
|068233| db $00 ; 0x14 - fairy
|068234| db $04 ; 0x15 - heart
|068235| db $04 ; 0x16 - null

;---------------------------------------------------------------------------------------------------

.ignore_ancillae
|068236| db $01 ; 0x01 - green rupee
|068237| db $00 ; 0x02 - hoarder
|068238| db $00 ; 0x03 - bee
|068239| db $01 ; 0x04 - green rupee
|06823A| db $01 ; 0x05 - 1 bomb
|06823B| db $01 ; 0x06 - heart
|06823C| db $01 ; 0x07 - blue rupee
|06823D| db $01 ; 0x08 - small key
|06823E| db $01 ; 0x09 - 5 arrows
|06823F| db $01 ; 0x0A - 1 bomb
|068240| db $01 ; 0x0B - heart
|068241| db $01 ; 0x0C - small magic
|068242| db $01 ; 0x0D - full magic
|068243| db $00 ; 0x0E - cucco
|068244| db $00 ; 0x0F - green guard
|068245| db $00 ; 0x10 - stal
|068246| db $00 ; 0x11 - blue guard
|068247| db $00 ; 0x12 - landmine
|068248| db $01 ; 0x13 - green rupee
|068249| db $01 ; 0x14 - fairy
|06824A| db $01 ; 0x15 - heart
|06824B| db $01 ; 0x16 - null

;---------------------------------------------------------------------------------------------------

.jump_velocity
|06824C| db $10 ; 0x01 - green rupee
|06824D| db $00 ; 0x02 - hoarder
|06824E| db $00 ; 0x03 - bee
|06824F| db $10 ; 0x04 - green rupee
|068250| db $00 ; 0x05 - 1 bomb
|068251| db $00 ; 0x06 - heart
|068252| db $10 ; 0x07 - blue rupee
|068253| db $10 ; 0x08 - small key
|068254| db $10 ; 0x09 - 5 arrows
|068255| db $10 ; 0x0A - 1 bomb
|068256| db $00 ; 0x0B - heart
|068257| db $10 ; 0x0C - small magic
|068258| db $0A ; 0x0D - full magic
|068259| db $10 ; 0x0E - cucco
|06825A| db $00 ; 0x0F - green guard
|06825B| db $00 ; 0x10 - stal
|06825C| db $00 ; 0x11 - blue guard
|06825D| db $00 ; 0x12 - landmine
|06825E| db $10 ; 0x13 - green rupee
|06825F| db $00 ; 0x14 - fairy
|068260| db $00 ; 0x15 - heart
|068261| db $00 ; 0x16 - null

endpool

;---------------------------------------------------------------------------------------------------

SpawnSecretFail:
|068262| CLC

|068263| RTS

;---------------------------------------------------------------------------------------------------

SpawnSecret:
|068264| LDA.b $1B
|068266| BNE .indoors

|068268| JSL GetRandomNumber
|06826C| AND.b #$08
|06826E| BNE SpawnSecretFail

.indoors
|068270| LDY.w $0B9C
|068273| BEQ SpawnSecretFail

|068275| CPY.b #$04
|068277| BNE .not_random_bush

|068279| JSL GetRandomNumber
|06827D| AND.b #$03
|06827F| CLC
|068280| ADC.b #$13
|068282| TAY

.not_random_bush
|068283| STY.b $0D

|068285| LDA.w .ID-1,Y
|068288| BEQ SpawnSecretFail

|06828A| JSL SpawnSpriteDynamically
|06828E| BMI SpawnSecretFail

;---------------------------------------------------------------------------------------------------

|068290| PHX

|068291| LDX.b $0D

|068293| LDA.w .mode-1,X
|068296| STA.w $0D80,Y

|068299| LDA.w .ignore_ancillae-1,X
|06829C| STA.w $0BA0,Y

|06829F| LDA.w .jump_velocity-1,X
|0682A2| STA.w $0F80,Y

|0682A5| LDA.b $00
|0682A7| CLC
|0682A8| ADC.w .offset_x-1,X
|0682AB| STA.w $0D10,Y

|0682AE| LDA.b $01
|0682B0| ADC.b #$00
|0682B2| STA.w $0D30,Y

|0682B5| LDA.b $02
|0682B7| STA.w $0D00,Y

|0682BA| LDA.b $03
|0682BC| STA.w $0D20,Y

|0682BF| LDA.b $04
|0682C1| STA.w $0F70,Y

|0682C4| LDA.b #$00
|0682C6| STA.w $0DC0,Y

|0682C9| LDA.b #$20
|0682CB| STA.w $0F10,Y

|0682CE| LDA.b #$30
|0682D0| STA.w $0E10,Y

|0682D3| LDX.w $0E20,Y
|0682D6| CPX.b #$E4 ; SPRITE E4
|0682D8| BNE .not_key

|0682DA| PHX

|0682DB| TYX

|0682DC| JSR SpritePrep_SmallKey

|0682DF| PLX

;---------------------------------------------------------------------------------------------------

.not_key
|0682E0| CPX.b #$0B ; SPRITE 0B
|0682E2| BNE .not_cucco

|0682E4| LDA.b #$30 ; SFX2.30
|0682E6| STA.w $012E

|0682E9| LDA.w $048E
|0682EC| CMP.b #$01 ; ROOM 0101
|0682EE| BNE .not_cucco

|0682F0| STA.w $0E30,Y

.not_cucco
|0682F3| CPX.b #$42 ; SPRITE 42
|0682F5| BEQ .guard

|0682F7| CPX.b #$41 ; SPRITE 41
|0682F9| BEQ .guard

|0682FB| CPX.b #$3E ; SPRITE 3E
|0682FD| BNE .not_hoarder

|0682FF| LDA.b #$09
|068301| STA.w $0F50,Y

|068304| BRA .done

;---------------------------------------------------------------------------------------------------

.guard
|068306| LDA.b #$04 ; SFX3.04
|068308| STA.w $012F

|06830B| LDA.b #$00
|06830D| STA.w $0CE2,Y

|068310| LDA.b #$A0
|068312| STA.w $0EF0,Y

|068315| BRA .last_check

;---------------------------------------------------------------------------------------------------

.not_hoarder
|068317| LDA.b #$FF
|068319| STA.w $0B58,Y

.last_check
|06831C| CPX.b #$79 ; SPRITE 79
|06831E| BNE .done

|068320| LDA.b #$20
|068322| STA.w $0D90,Y

;---------------------------------------------------------------------------------------------------

.done
|068325| SEC

|068326| PLX

|068327| RTS

;===================================================================================================

HandleAllSprites:
|068328| LDA.b $1B
|06832A| BNE .indoors

|06832C| STZ.w $0C7C
|06832F| STZ.w $0C7D
|068332| STZ.w $0C7E
|068335| STZ.w $0C7F
|068338| STZ.w $0C80

|06833B| JSL ProximalSpriteActivation

;---------------------------------------------------------------------------------------------------

.indoors
|06833F| PHB
|068340| PHK
|068341| PLB

|068342| LDY.b #$00

|068344| LDA.l $7EF3CA
|068348| BEQ .lightworld

|06834A| INY

.lightworld
|06834B| STY.w $0FFF

|06834E| LDA.b $11
|068350| BNE .dont_reset_drag

|068352| STZ.w $0B7C
|068355| STZ.w $0B7D
|068358| STZ.w $0B7E
|06835B| STZ.w $0B7F

;---------------------------------------------------------------------------------------------------

.dont_reset_drag
|06835E| JSR ResetOAMRegionBases
|068361| JSL HandleUpperGarnishSlots_long
|068365| JSL HandleFollower

|068369| LDA.w $0314
|06836C| STA.w $0FB2

|06836F| STZ.w $0314

|068372| LDA.b #$80
|068374| STA.w $0FAB

|068377| LDA.b $47
|068379| AND.b #$7F
|06837B| BEQ .repulse_timer_over

|06837D| DEC.b $47
|06837F| BRA .continue

;---------------------------------------------------------------------------------------------------

.repulse_timer_over
|068381| STZ.b $47

.continue
|068383| STZ.w $0379
|068386| STZ.w $0377
|068389| STZ.w $0B7B

|06838C| LDA.w $0FDC
|06838F| BEQ .alert_timer_over

|068391| DEC.w $0FDC

;---------------------------------------------------------------------------------------------------

.alert_timer_over
|068394| JSL Ancilla_Main
|068398| JSL HandleAllOverlords

|06839C| STZ.w $0B9A

|06839F| LDX.b #$0F

.next_sprite
|0683A1| STX.w $0FA0

|0683A4| JSR HandleSingleSprite

|0683A7| DEX
|0683A8| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0683AA| JSL HandleLowerGarnishSlots_long

|0683AE| STZ.w $069F
|0683B1| STZ.w $069E

|0683B4| PLB

|0683B5| JSL ExecuteCachedSprites

|0683B9| LDA.w $0AAA
|0683BC| BEQ .exit

|0683BE| STA.w $0FC6

.exit
|0683C1| RTL

;===================================================================================================

NRURURU_bounce:
|0683C2| JSL NRURURU

|0683C6| RTL

;===================================================================================================

pool ResetOAMRegionBases

.addresses
|0683C7| dw $0030
|0683C9| dw $01D0
|0683CB| dw $0000
|0683CD| dw $0030
|0683CF| dw $0120
|0683D1| dw $0140

endpool

;---------------------------------------------------------------------------------------------------

ResetOAMRegionBases:
|0683D3| LDY.b #$00

|0683D5| REP #$20

.next
|0683D7| LDA.w .addresses,Y
|0683DA| STA.w $0FE0,Y

|0683DD| INY
|0683DE| INY
|0683DF| CPY.b #$0B
|0683E1| BCC .next

|0683E3| SEP #$20

|0683E5| RTS

;===================================================================================================

CheckIfHitboxesOverlap_long:
|0683E6| JSR CheckIfHitboxesOverlap

|0683E9| RTL

;===================================================================================================

SetupSpriteHitbox_long:
|0683EA| PHB
|0683EB| PHK
|0683EC| PLB

|0683ED| JSR SetupSpriteHitbox

|0683F0| PLB

|0683F1| RTL

;===================================================================================================

DoSpriteOAMandTimers:
|0683F2| JSR Get16BitSpriteCoords

|0683F5| LDA.w $0E40,X
|0683F8| AND.b #$1F
|0683FA| INC A

|0683FB| ASL A
|0683FC| ASL A

|0683FD| LDY.w $0FB3
|068400| BEQ .use_regionA

|068402| LDY.w $0F20,X
|068405| BEQ .use_regionD

|068407| JSL AllocateOAMInRegionF
|06840B| BRA .oam_done

.use_regionD
|06840D| JSL AllocateOAMInRegionD
|068411| BRA .oam_done

.use_regionA
|068413| JSL AllocateOAMInRegionA

.oam_done
|068417| LDA.b $11
|068419| ORA.w $0FC1
|06841C| BEQ .timers_ago

|06841E| JMP.w .handle_linkhop

;---------------------------------------------------------------------------------------------------

.timers_ago
|068421| LDA.w $0DF0,X
|068424| BEQ .skip_timer0

|068426| DEC.w $0DF0,X

.skip_timer0
|068429| LDA.w $0E00,X
|06842C| BEQ .skip_timer1

|06842E| DEC.w $0E00,X

.skip_timer1
|068431| LDA.w $0E10,X
|068434| BEQ .skip_timer2

|068436| DEC.w $0E10,X

.skip_timer2
|068439| LDA.w $0EE0,X
|06843C| BEQ .skip_timer3

|06843E| DEC.w $0EE0,X

.skip_timer3
|068441| LDA.w $0EF0,X
|068444| AND.b #$7F
|068446| BEQ .skip_hit_timer

|068448| LDY.w $0DD0,X
|06844B| CPY.b #$09
|06844D| BCC .no_damage

|06844F| CMP.b #$1F
|068451| BNE .delay_damage

;---------------------------------------------------------------------------------------------------

|068453| PHA

|068454| LDA.w $0E20,X
|068457| CMP.b #$7A ; SPRITE 7A
|068459| BNE .not_agahnim1

|06845B| LDA.w $0FFF
|06845E| BNE .not_agahnim1

|068460| LDA.w $0E50,X
|068463| SEC
|068464| SBC.w $0CE2,X

|068467| BEQ .aga1_message
|068469| BCS .not_agahnim1

.aga1_message
|06846B| LDA.b #$40 ; MESSAGE 0140
|06846D| STA.w $1CF0

|068470| LDA.b #$01
|068472| STA.w $1CF1

|068475| JSL ShowMessageMinimal

;---------------------------------------------------------------------------------------------------

.not_agahnim1
|068479| PLA

.delay_damage
|06847A| CMP.b #$18
|06847C| BNE .no_damage

|06847E| JSR HandleSpriteDamageApplication

.no_damage
|068481| LDA.w $0CE2,X
|068484| CMP.b #$FB
|068486| BCS .skip_palette_cycling

|068488| LDA.w $0EF0,X
|06848B| ASL A
|06848C| AND.b #$0E
|06848E| STA.w $0B89,X

.skip_palette_cycling
|068491| DEC.w $0EF0,X

|068494| BRA .hit_continue

.skip_hit_timer
|068496| STZ.w $0EF0,X
|068499| STZ.w $0B89,X

.hit_continue
|06849C| LDA.w $0F10,X
|06849F| BEQ .handle_linkhop

|0684A1| DEC.w $0F10,X

.handle_linkhop
|0684A4| LDY.b $EE
|0684A6| CPY.b #$03
|0684A8| BEQ .link_is_jumping

|0684AA| LDY.w $0F20,X

.link_is_jumping
|0684AD| LDA.w $0B89,X
|0684B0| AND.b #$CF
|0684B2| ORA.w .OAM_priority,Y
|0684B5| STA.w $0B89,X

|0684B8| RTS

;---------------------------------------------------------------------------------------------------

.OAM_priority
|0684B9| db $20, $10, $30, $30

;===================================================================================================

Get16BitSpriteCoords_long:
|0684BD| JSR Get16BitSpriteCoords

|0684C0| RTL

;---------------------------------------------------------------------------------------------------

Get16BitSpriteCoords:
|0684C1| LDA.w $0D10,X
|0684C4| STA.w $0FD8

|0684C7| LDA.w $0D30,X
|0684CA| STA.w $0FD9

|0684CD| LDA.w $0D00,X
|0684D0| STA.w $0FDA

|0684D3| LDA.w $0D20,X
|0684D6| STA.w $0FDB

|0684D9| RTS

;===================================================================================================

HandleSingleSprite_long:
|0684DA| PHB
|0684DB| PHK
|0684DC| PLB

|0684DD| JSR HandleSingleSprite

|0684E0| PLB

|0684E1| RTL

;---------------------------------------------------------------------------------------------------

HandleSingleSprite:
|0684E2| LDA.w $0DD0,X
|0684E5| BEQ SpriteModule_Inactive

|0684E7| PHA

|0684E8| JSR DoSpriteOAMandTimers

|0684EB| PLA
|0684EC| CMP.b #$09
|0684EE| BEQ .active

|0684F0| JSL JumpTableLocal
|0684F4| dw SpriteModule_Inactive       ; 0x00
|0684F6| dw SpriteModule_Fall1          ; 0x01
|0684F8| dw SpriteModule_Poof           ; 0x02
|0684FA| dw SpriteModule_Drown          ; 0x03
|0684FC| dw SpriteModule_Explode_bounce ; 0x04
|0684FE| dw SpriteModule_Fall2          ; 0x05
|068500| dw SpriteModule_Die            ; 0x06
|068502| dw SpriteModule_Burn_bounce    ; 0x07
|068504| dw SpriteModule_Initialize     ; 0x08
|068506| dw SpriteModule_Active         ; 0x09
|068508| dw SpriteModule_Carried        ; 0x0A
|06850A| dw SpriteModule_Stunned        ; 0x0B

;---------------------------------------------------------------------------------------------------

.active
|06850C| JMP.w SpriteModule_Active

;===================================================================================================

SpritePrep_DoNothingI:
|06850F| RTS

;===================================================================================================

SpriteModule_Inactive:
|068510| LDA.b $1B
|068512| BNE .indoors

|068514| TXA
|068515| ASL A
|068516| TAY

|068517| LDA.b #$FF
|068519| STA.w $0BC0,Y
|06851C| STA.w $0BC1,Y

|06851F| RTS

.indoors
|068520| LDA.b #$FF
|068522| STA.w $0BC0,X

|068525| RTS

;===================================================================================================

SpriteModule_Active_long:
|068526| PHB
|068527| PHK
|068528| PLB

|068529| JSR SpriteModule_Active

|06852C| PLB

|06852D| RTL

;===================================================================================================

SpriteModule_Fall1:
|06852E| LDA.w $0DF0,X
|068531| BNE .fall_longer

|068533| STZ.w $0DD0,X

|068536| JSL ManuallySetDeathFlagUW

|06853A| RTS

.fall_longer
|06853B| JSR GetScreenCoordinates
|06853E| JSL SpriteDraw_Falling

|068542| RTS

;===================================================================================================

SpriteModule_Burn_bounce:
|068543| JSL SpriteModule_Burn

|068547| RTS

;===================================================================================================

SpriteModule_Explode_bounce:
|068548| JSL SpriteModule_Explode

|06854C| RTS

;===================================================================================================

pool SpriteModule_Drown

.oam_groups
|06854D| dw  -7,  -7 : db $80, $04, $00, $00
|068555| dw  14,  -6 : db $83, $04, $00, $00

|06855D| dw  -6,  -6 : db $CF, $04, $00, $00
|068565| dw  13,  -5 : db $DF, $04, $00, $00

|06856D| dw  -4,  -4 : db $AE, $04, $00, $00
|068575| dw  12,  -4 : db $AF, $44, $00, $00

|06857D| dw   0,   0 : db $E7, $04, $00, $02
|068585| dw   0,   0 : db $E7, $04, $00, $02

;---------------------------------------------------------------------------------------------------

.flip
|06858D| db $00
|06858E| db $40
|06858F| db $C0
|068590| db $80

.char
|068591| db $C0, $C0, $C0, $C0
|068595| db $CD, $CD, $CD
|068598| db $CB, $CB, $CB, $CB

endpool

;---------------------------------------------------------------------------------------------------

SpriteModule_Drown:
|06859C| LDA.w $0D80,X
|06859F| BEQ DrawDrowningSprite

|0685A1| LDA.w $0D90,X
|0685A4| CMP.b #$06
|0685A6| BNE .use_allotted_region

|0685A8| LDA.b #$08
|0685AA| JSL AllocateOAMInRegionC

.use_allotted_region
|0685AE| LDA.w $0E60,X
|0685B1| EOR.b #$10
|0685B3| STA.w $0E60,X

|0685B6| JSR SpriteDraw_SingleLarge

|0685B9| LDA.w $0E80,X
|0685BC| LSR A
|0685BD| LSR A
|0685BE| AND.b #$03
|0685C0| TAY

|0685C1| LDA.w .flip,Y
|0685C4| STA.b $05

|0685C6| LDA.w $0DF0,X
|0685C9| CMP.b #$01
|0685CB| BNE .stay_alive

|0685CD| STZ.w $0DD0,X

.stay_alive
|0685D0| PHX

|0685D1| LDA.b #$8A
|0685D3| BCC .delay

|0685D5| LDA.w $0DF0,X
|0685D8| LSR A
|0685D9| TAX

|0685DA| STZ.b $05

|0685DC| LDA.w .char,X

.delay
|0685DF| LDY.b #$02
|0685E1| STA.b ($90),Y

|0685E3| INY
|0685E4| LDA.b #$24
|0685E6| ORA.b $05
|0685E8| STA.b ($90),Y

|0685EA| PLX

|0685EB| LDA.w $0DF0,X
|0685EE| BNE EXIT_06861A

;---------------------------------------------------------------------------------------------------

|0685F0| JSR CheckIfActivePermissive_bank06

|0685F3| INC.w $0E80,X

|0685F6| JSR MoveSpriteXY_bank06
|0685F9| JSR MoveSpriteZ_bank06

|0685FC| LDA.w $0F80,X
|0685FF| SEC
|068600| SBC.b #$02
|068602| STA.w $0F80,X

|068605| LDA.w $0F70,X
|068608| BPL EXIT_06861A

|06860A| STZ.w $0F70,X

|06860D| LDA.b #$12
|06860F| STA.w $0DF0,X

;===================================================================================================

DisableShadowFlag:
|068612| LDA.w $0E60,X
|068615| AND.b #$EF
|068617| STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

#EXIT_06861A:
|06861A| RTS

;===================================================================================================

DrawDrowningSprite:
|06861B| JSR CheckIfActivePermissive_bank06

|06861E| LDA.b $1A
|068620| AND.b #$01
|068622| BNE .timer_parity

|068624| INC.w $0DF0,X

.timer_parity
|068627| STZ.w $0F50,X
|06862A| STZ.w $0EF0,X

|06862D| LDA.b #$00
|06862F| XBA

|068630| LDA.w $0DF0,X
|068633| BNE .stay_alive

|068635| STZ.w $0DD0,X

.stay_alive
|068638| REP #$20

|06863A| ASL A
|06863B| AND.w #$00F8
|06863E| ASL A
|06863F| ADC.w #SpriteModule_Drown.oam_groups
|068642| STA.b $08

|068644| SEP #$20

|068646| LDA.b #$02
|068648| JSL TabulatedSpriteDraw

|06864C| RTS

;===================================================================================================

SpriteModule_Initialize:
|06864D| JSL LoadSpriteProperties

|068651| INC.w $0DD0,X

|068654| LDA.w $0E20,X
|068657| JSL JumpTableLocal
|06865B| dw SpritePrep_Raven                         ; 0x00 - RAVEN
|06865D| dw SpritePrep_Vulture                       ; 0x01 - VULTURE
|06865F| dw SpritePrep_DoNothingA                    ; 0x02 - STALFOS HEAD
|068661| dw $0000                                    ; 0x03 - NULL
|068663| dw SpritePrep_Switch                        ; 0x04 - CORRECT PULL SWITCH
|068665| dw SpritePrep_DoNothingA                    ; 0x05 - UNUSED CORRECT PULL SWITCH
|068667| dw SpritePrep_Switch                        ; 0x06 - WRONG PULL SWITCH
|068669| dw SpritePrep_DoNothingB                    ; 0x07 - UNUSED WRONG PULL SWITCH
|06866B| dw SpritePrep_Octorok                       ; 0x08 - OCTOROK
|06866D| dw SpritePrep_Moldorm_bounce                ; 0x09 - MOLDORM
|06866F| dw SpritePrep_Octorok                       ; 0x0A - OCTOROK 4WAY
|068671| dw SpritePrep_DoNothingA                    ; 0x0B - CUCCO
|068673| dw SpritePrep_DoNothingA                    ; 0x0C - OCTOROK STONE
|068675| dw SpritePrep_DoNothingA                    ; 0x0D - BUZZBLOB
|068677| dw SpritePrep_DoNothingA                    ; 0x0E - SNAPDRAGON
|068679| dw SpritePrep_Octoballoon                   ; 0x0F - OCTOBALLOON
|06867B| dw SpritePrep_DoNothingA                    ; 0x10 - OCTOBALLOON BABY
|06867D| dw SpritePrep_DoNothingA                    ; 0x11 - HINOX
|06867F| dw SpritePrep_DoNothingA                    ; 0x12 - MOBLIN
|068681| dw SpritePrep_MiniHelmasaur                 ; 0x13 - MINI HELMASAUR
|068683| dw SpritePrep_ThievesTownGrate              ; 0x14 - THIEVES TOWN GRATE
|068685| dw SpritePrep_Antifairy                     ; 0x15 - ANTIFAIRY
|068687| dw SpritePrep_Sage                          ; 0x16 - SAHASRAHLA / AGINAH
|068689| dw SpritePrep_DoNothingA                    ; 0x17 - BUSH HOARDER
|06868B| dw SpritePrep_MiniMoldorm_bounce            ; 0x18 - MINI MOLDORM
|06868D| dw SpritePrep_Poe                           ; 0x19 - POE
|06868F| dw SpritePrep_Smithy                        ; 0x1A - SMITHY
|068691| dw SpritePrep_DoNothingA                    ; 0x1B - ARROW
|068693| dw SpritePrep_Statue                        ; 0x1C - STATUE
|068695| dw SpritePrep_IgnoreProjectiles             ; 0x1D - FLUTE QUEST
|068697| dw SpritePrep_CrystalSwitch                 ; 0x1E - CRYSTAL SWITCH
|068699| dw SpritePrep_SickKid                       ; 0x1F - SICK KID
|06869B| dw SpritePrep_DoNothingA                    ; 0x20 - SLUGGULA
|06869D| dw SpritePrep_WaterLever                    ; 0x21 - WATER SWITCH
|06869F| dw SpritePrep_DoNothingA                    ; 0x22 - ROPA
|0686A1| dw SpritePrep_Bari                          ; 0x23 - RED BARI
|0686A3| dw SpritePrep_Bari                          ; 0x24 - BLUE BARI
|0686A5| dw SpritePrep_TalkingTree                   ; 0x25 - TALKING TREE
|0686A7| dw SpritePrep_HardhatBeetle                 ; 0x26 - HARDHAT BEETLE
|0686A9| dw SpritePrep_DoNothingA                    ; 0x27 - DEADROCK
|0686AB| dw SpritePrep_DarkWorldHintNPC              ; 0x28 - DARK WORLD HINT NPC
|0686AD| dw SpritePrep_Adult                         ; 0x29 - ADULT
|0686AF| dw SpritePrep_IgnoreProjectiles             ; 0x2A - SWEEPING LADY
|0686B1| dw SpritePrep_Hobo                          ; 0x2B - HOBO
|0686B3| dw SpritePrep_Lumberjacks                   ; 0x2C - LUMBERJACKS
|0686B5| dw SpritePrep_IgnoreProjectiles             ; 0x2D - NECKLESS MAN
|0686B7| dw SpritePrep_FluteKid                      ; 0x2E - FLUTE KID
|0686B9| dw SpritePrep_IgnoreProjectiles             ; 0x2F - RACE GAME LADY
|0686BB| dw SpritePrep_IgnoreProjectiles             ; 0x30 - RACE GAME GUY
|0686BD| dw SpritePrep_FortuneTeller                 ; 0x31 - FORTUNE TELLER
|0686BF| dw SpritePrep_IgnoreProjectiles             ; 0x32 - ARGUE BROS
|0686C1| dw SpritePrep_RupeePull                     ; 0x33 - RUPEE PULL
|0686C3| dw SpritePrep_Snitch_bounce_2               ; 0x34 - YOUNG SNITCH
|0686C5| dw SpritePrep_Snitch_bounce_3               ; 0x35 - INNKEEPER
|0686C7| dw SpritePrep_IgnoreProjectiles             ; 0x36 - WITCH
|0686C9| dw SpritePrep_IgnoreProjectiles             ; 0x37 - WATERFALL
|0686CB| dw SpritePrep_DoNothingA                    ; 0x38 - EYE STATUE
|0686CD| dw SpritePrep_Locksmith                     ; 0x39 - LOCKSMITH
|0686CF| dw SpritePrep_MagicBat                      ; 0x3A - MAGIC BAT
|0686D1| dw SpritePrep_BonkItem                      ; 0x3B - BONK ITEM
|0686D3| dw SpritePrep_IgnoreProjectiles             ; 0x3C - KID IN KAK
|0686D5| dw SpritePrep_Snitch_bounce_1               ; 0x3D - OLD SNITCH
|0686D7| dw SpritePrep_DoNothingA                    ; 0x3E - ROCK HOARDER
|0686D9| dw SpritePrep_DoNothingA                    ; 0x3F - TUTORIAL GUARD
|0686DB| dw SpritePrep_LightningGate                 ; 0x40 - LIGHTNING GATE
|0686DD| dw SpritePrep_StandardGuard                 ; 0x41 - BLUE GUARD
|0686DF| dw SpritePrep_StandardGuard                 ; 0x42 - GREEN GUARD
|0686E1| dw SpritePrep_StandardGuard                 ; 0x43 - RED SPEAR GUARD
|0686E3| dw SpritePrep_CoolerGuard                   ; 0x44 - BLUESAIN BOLT
|0686E5| dw SpritePrep_CoolerGuard                   ; 0x45 - USAIN BOLT
|0686E7| dw SpritePrep_CoolerGuard                   ; 0x46 - BLUE ARCHER
|0686E9| dw SpritePrep_CoolerGuard                   ; 0x47 - GREEN BUSH GUARD
|0686EB| dw SpritePrep_CoolerGuard                   ; 0x48 - RED JAVELIN GUARD
|0686ED| dw SpritePrep_CoolerGuard                   ; 0x49 - RED BUSH GUARD
|0686EF| dw SpritePrep_CoolerGuard                   ; 0x4A - BOMB GUARD
|0686F1| dw SpritePrep_WeakGuard                     ; 0x4B - GREEN KNIFE GUARD
|0686F3| dw SpritePrep_Geldman                       ; 0x4C - GELDMAN
|0686F5| dw SpritePrep_CacheOriginalCoordinates      ; 0x4D - TOPPO
|0686F7| dw SpritePrep_Popo                          ; 0x4E - POPO
|0686F9| dw SpritePrep_Popo2                         ; 0x4F - POPO
|0686FB| dw SpritePrep_DoNothingA                    ; 0x50 - CANNONBALL
|0686FD| dw SpritePrep_DoNothingD                    ; 0x51 - ARMOS STATUE
|0686FF| dw SpritePrep_KingZora                      ; 0x52 - KING ZORA
|068701| dw SpritePrep_ArmosKnight                   ; 0x53 - ARMOS KNIGHT
|068703| dw SpritePrep_Lanmolas_bounce               ; 0x54 - LANMOLAS
|068705| dw SpritePrep_SwimmingZora                  ; 0x55 - ZORA / FIREBALL
|068707| dw SpritePrep_WalkingZora                   ; 0x56 - WALKING ZORA
|068709| dw SpritePrep_DesertStatue                  ; 0x57 - DESERT STATUE
|06870B| dw SpritePrep_DoNothingA                    ; 0x58 - CRAB
|06870D| dw SpritePrep_LostWoodsBird                 ; 0x59 - LOST WOODS BIRD
|06870F| dw SpritePrep_LostWoodsSquirrel             ; 0x5A - LOST WOODS SQUIRREL
|068711| dw SpritePrep_Spark                         ; 0x5B - SPARK
|068713| dw SpritePrep_Spark                         ; 0x5C - SPARK
|068715| dw SpritePrep_Roller_VerticalDownFirst      ; 0x5D - ROLLER VERTICAL DOWN FIRST
|068717| dw SpritePrep_Roller_VerticalUpFirst        ; 0x5E - ROLLER VERTICAL UP FIRST
|068719| dw SpritePrep_Roller_HorizontalRightFirst   ; 0x5F - ROLLER HORIZONTAL RIGHT FIRST
|06871B| dw SpritePrep_Roller_HorizontalLeftFirst    ; 0x60 - ROLLER HORIZONTAL LEFT FIRST
|06871D| dw SpritePrep_DoNothingA                    ; 0x61 - BEAMOS
|06871F| dw SpritePrep_MasterSword                   ; 0x62 - MASTERSWORD
|068721| dw SpritePrep_DebirandoPit                  ; 0x63 - DEBIRANDO PIT
|068723| dw SpritePrep_Debirando                     ; 0x64 - DEBIRANDO
|068725| dw SpritePrep_ArcheryGame_bounce            ; 0x65 - ARCHERY GUY
|068727| dw SpritePrep_WallCannon                    ; 0x66 - WALL CANNON VERTICAL LEFT
|068729| dw SpritePrep_WallCannon                    ; 0x67 - WALL CANNON VERTICAL RIGHT
|06872B| dw SpritePrep_WallCannon                    ; 0x68 - WALL CANNON HORIZONTAL TOP
|06872D| dw SpritePrep_WallCannon                    ; 0x69 - WALL CANNON HORIZONTAL BOTTOM
|06872F| dw SpritePrep_DoNothingA                    ; 0x6A - BALL N CHAIN
|068731| dw SpritePrep_DoNothingA                    ; 0x6B - CANNONBALL / CANNON TROOPER
|068733| dw SpritePrep_DoNothingA                    ; 0x6C - MIRROR PORTAL
|068735| dw SpritePrep_Rat                           ; 0x6D - RAT / CRICKET
|068737| dw SpritePrep_Rope                          ; 0x6E - ROPE
|068739| dw SpritePrep_Keese                         ; 0x6F - KEESE
|06873B| dw SpritePrep_DoNothingG                    ; 0x70 - KING HELMASAUR FIREBALL
|06873D| dw SpritePrep_Leever                        ; 0x71 - LEEVER
|06873F| dw SpritePrep_IgnoreProjectiles             ; 0x72 - FAIRY POND TRIGGER
|068741| dw SpritePrep_UncleAndPriest_bounce         ; 0x73 - UNCLE / PRIEST / MANTLE
|068743| dw SpritePrep_RunningBoy_bounce             ; 0x74 - RUNNING BOY
|068745| dw SpritePrep_IgnoreProjectiles             ; 0x75 - BOTTLE MERCHANT
|068747| dw SpritePrep_Zelda_bounce                  ; 0x76 - ZELDA
|068749| dw SpritePrep_Antifairy                     ; 0x77 - ANTIFAIRY
|06874B| dw SpritePrep_MrsSahasrahla                 ; 0x78 - SAHASRAHLAS WIFE
|06874D| dw SpritePrep_OverworldBonkItem             ; 0x79 - BEE
|06874F| dw SpritePrep_Agahnim                       ; 0x7A - AGAHNIM
|068751| dw SpritePrep_DoNothingG                    ; 0x7B - AGAHNIMS BALLS
|068753| dw SpritePrep_GreenStalfos                  ; 0x7C - GREEN STALFOS
|068755| dw SpritePrep_BigSpike                      ; 0x7D - BIG SPIKE
|068757| dw SpritePrep_FireBar                       ; 0x7E - FIREBAR CLOCKWISE
|068759| dw SpritePrep_FireBar                       ; 0x7F - FIREBAR COUNTERCLOCKWISE
|06875B| dw SpritePrep_DoNothingG                    ; 0x80 - FIRESNAKE
|06875D| dw SpritePrep_DoNothingG                    ; 0x81 - HOVER
|06875F| dw SpritePrep_AntifairyCircle_bounce        ; 0x82 - ANTIFAIRY CIRCLE
|068761| dw SpritePrep_Eyegore_bounce                ; 0x83 - GREEN EYEGORE / GREEN MIMIC
|068763| dw SpritePrep_Eyegore_bounce                ; 0x84 - RED EYEGORE / RED MIMIC
|068765| dw SpritePrep_DoNothingG                    ; 0x85 - YELLOW STALFOS
|068767| dw SpritePrep_Kodongo                       ; 0x86 - KODONGO
|068769| dw SpritePrep_DoNothingG                    ; 0x87 - KODONGO FIRE
|06876B| dw SpritePrep_Mothula                       ; 0x88 - MOTHULA
|06876D| dw SpritePrep_DoNothingG                    ; 0x89 - MOTHULA BEAM
|06876F| dw SpritePrep_Spike                         ; 0x8A - SPIKE BLOCK
|068771| dw SpritePrep_DoNothingG                    ; 0x8B - GIBDO
|068773| dw SpritePrep_Arrghus                       ; 0x8C - ARRGHUS
|068775| dw SpritePrep_Arrghi                        ; 0x8D - ARRGHI
|068777| dw SpritePrep_DoNothingG                    ; 0x8E - TERRORPIN
|068779| dw SpritePrep_Blob                          ; 0x8F - BLOB
|06877B| dw SpritePrep_DoNothingG                    ; 0x90 - WALLMASTER
|06877D| dw SpritePrep_DoNothingG                    ; 0x91 - STALFOS KNIGHT
|06877F| dw SpritePrep_HelmasaurKing                 ; 0x92 - KING HELMASAUR
|068781| dw SpritePrep_Bumper                        ; 0x93 - BUMPER
|068783| dw SpritePrep_DoNothingA                    ; 0x94 - PIROGUSU
|068785| dw SpritePrep_LaserEye_bounce               ; 0x95 - LASER EYE LEFT
|068787| dw SpritePrep_LaserEye_bounce               ; 0x96 - LASER EYE RIGHT
|068789| dw SpritePrep_LaserEye_bounce               ; 0x97 - LASER EYE TOP
|06878B| dw SpritePrep_LaserEye_bounce               ; 0x98 - LASER EYE BOTTOM
|06878D| dw SpritePrep_DoNothingA                    ; 0x99 - PENGATOR
|06878F| dw SpritePrep_CacheOriginalCoordinates      ; 0x9A - KYAMERON
|068791| dw SpritePrep_DoNothingA                    ; 0x9B - WIZZROBE
|068793| dw SpritePrep_Zoro                          ; 0x9C - ZORO
|068795| dw SpritePrep_Babasu                        ; 0x9D - BABASU
|068797| dw SpritePrep_HauntedGroveOstrich           ; 0x9E - HAUNTED GROVE OSTRICH
|068799| dw SpritePrep_HauntedGroveAnimal            ; 0x9F - HAUNTED GROVE RABBIT
|06879B| dw SpritePrep_HauntedGroveAnimal            ; 0xA0 - HAUNTED GROVE BIRD
|06879D| dw SpritePrep_MoveDown8px                   ; 0xA1 - FREEZOR
|06879F| dw SpritePrep_Kholdstare                    ; 0xA2 - KHOLDSTARE
|0687A1| dw SpritePrep_KholdstareShell               ; 0xA3 - KHOLDSTARE SHELL
|0687A3| dw SpritePrep_FallingIce                    ; 0xA4 - FALLING ICE
|0687A5| dw SpritePrep_DoNothingE                    ; 0xA5 - BLUE ZAZAK
|0687A7| dw SpritePrep_DoNothingE                    ; 0xA6 - RED ZAZAK
|0687A9| dw SpritePrep_Stalfos                       ; 0xA7 - STALFOS
|0687AB| dw SpritePrep_Zirro                         ; 0xA8 - GREEN ZIRRO
|0687AD| dw SpritePrep_Zirro                         ; 0xA9 - BLUE ZIRRO
|0687AF| dw SpritePrep_DoNothingC                    ; 0xAA - PIKIT
|0687B1| dw SpritePrep_DoNothingH                    ; 0xAB - CRYSTAL MAIDEN
|0687B3| dw SpritePrep_OverworldBonkItem             ; 0xAC - APPLE
|0687B5| dw SpritePrep_OldMan_bounce                 ; 0xAD - OLD MAN
|0687B7| dw SpritePrep_DoNothingA                    ; 0xAE - PIPE DOWN
|0687B9| dw SpritePrep_DoNothingA                    ; 0xAF - PIPE UP
|0687BB| dw SpritePrep_DoNothingA                    ; 0xB0 - PIPE RIGHT
|0687BD| dw SpritePrep_DoNothingA                    ; 0xB1 - PIPE LEFT
|0687BF| dw SpritePrep_GoodBee                       ; 0xB2 - GOOD BEE
|0687C1| dw SpritePrep_PedestalPlaque                ; 0xB3 - PEDESTAL PLAQUE
|0687C3| dw SpritePrep_PurpleChest                   ; 0xB4 - PURPLE CHEST
|0687C5| dw SpritePrep_BombShop                      ; 0xB5 - BOMB SHOP GUY
|0687C7| dw SpritePrep_Kiki                          ; 0xB6 - KIKI
|0687C9| dw SpritePrep_BlindMaiden                   ; 0xB7 - BLIND MAIDEN
|0687CB| dw SpritePrep_DoNothingA                    ; 0xB8 - DIALOGUE TESTER
|0687CD| dw SpritePrep_BullyAndVictim                ; 0xB9 - BULLY / PINK BALL
|0687CF| dw SpritePrep_Whirlpool                     ; 0xBA - WHIRLPOOL
|0687D1| dw SpritePrep_Shopkeeper                    ; 0xBB - SHOPKEEPER / CHEST GAME GUY
|0687D3| dw SpritePrep_IgnoreProjectiles             ; 0xBC - DRUNKARD
|0687D5| dw SpritePrep_Vitreous                      ; 0xBD - VITREOUS
|0687D7| dw SpritePrep_MiniVitreous                  ; 0xBE - VITREOUS SMALL EYE
|0687D9| dw SpritePrep_DoNothingA                    ; 0xBF - LIGHTNING
|0687DB| dw SpritePrep_Catfish                       ; 0xC0 - CATFISH
|0687DD| dw SpritePrep_CutsceneAgahnim               ; 0xC1 - CUTSCENE AGAHNIM
|0687DF| dw SpritePrep_DoNothingA                    ; 0xC2 - BOULDER
|0687E1| dw SpritePrep_Gibo                          ; 0xC3 - GIBO
|0687E3| dw SpritePrep_DoNothingA                    ; 0xC4 - THIEF
|0687E5| dw SpritePrep_IgnoreProjectiles             ; 0xC5 - MEDUSA
|0687E7| dw SpritePrep_IgnoreProjectiles             ; 0xC6 - YOMO MEDUSA
|0687E9| dw SpritePrep_Pokey                         ; 0xC7 - POKEY
|0687EB| dw SpritePrep_BigFairy                      ; 0xC8 - BIG FAIRY
|0687ED| dw SpritePrep_Tektite                       ; 0xC9 - TEKTITE / FIREBAT
|0687EF| dw SpritePrep_Chainchomp_bounce             ; 0xCA - CHAIN CHOMP
|0687F1| dw SpritePrep_Trinexx                       ; 0xCB - TRINEXX ROCK HEAD
|0687F3| dw SpritePrep_Trinexx                       ; 0xCC - TRINEXX FIRE HEAD
|0687F5| dw SpritePrep_Trinexx                       ; 0xCD - TRINEXX ICE HEAD
|0687F7| dw SpritePrep_Blind                         ; 0xCE - BLIND
|0687F9| dw SpritePrep_Swamola                       ; 0xCF - SWAMOLA
|0687FB| dw SpritePrep_DoNothingA                    ; 0xD0 - LYNEL
|0687FD| dw SpritePrep_DoNothingA                    ; 0xD1 - BUNNYBEAM / SMOKE
|0687FF| dw SpritePrep_IgnoreProjectiles             ; 0xD2 - FLOPPING FISH
|068801| dw SpritePrep_RockStal                      ; 0xD3 - STAL
|068803| dw SpritePrep_IgnoreProjectiles             ; 0xD4 - LANDMINE
|068805| dw SpritePrep_DiggingGameGuy_bounce         ; 0xD5 - DIGGING GAME GUY
|068807| dw SpritePrep_Ganon                         ; 0xD6 - GANON
|068809| dw SpritePrep_Ganon                         ; 0xD7 - GANON
|06880B| dw SpritePrep_Absorbable                    ; 0xD8 - HEART
|06880D| dw SpritePrep_Absorbable                    ; 0xD9 - GREEN RUPEE
|06880F| dw SpritePrep_Absorbable                    ; 0xDA - BLUE RUPEE
|068811| dw SpritePrep_Absorbable                    ; 0xDB - RED RUPEE
|068813| dw SpritePrep_Absorbable                    ; 0xDC - BOMB REFILL 1
|068815| dw SpritePrep_Absorbable                    ; 0xDD - BOMB REFILL 4
|068817| dw SpritePrep_Absorbable                    ; 0xDE - BOMB REFILL 8
|068819| dw SpritePrep_Absorbable                    ; 0xDF - SMALL MAGIC DECANTER
|06881B| dw SpritePrep_Absorbable                    ; 0xE0 - LARGE MAGIC DECANTER
|06881D| dw SpritePrep_Absorbable                    ; 0xE1 - ARROW REFILL 5
|06881F| dw SpritePrep_Absorbable                    ; 0xE2 - ARROW REFILL 10
|068821| dw SpritePrep_Fairy                         ; 0xE3 - FAIRY
|068823| dw SpritePrep_SmallKey                      ; 0xE4 - SMALL KEY
|068825| dw SpritePrep_BigKey                        ; 0xE5 - BIG KEY
|068827| dw SpritePrep_DoNothingF                    ; 0xE6 - STOLEN SHIELD
|068829| dw SpritePrep_Mushroom_bounce               ; 0xE7 - MUSHROOM
|06882B| dw SpritePrep_FakeMasterSword_bounce        ; 0xE8 - FAKE MASTER SWORD
|06882D| dw SpritePrep_MagicShopAssistant_bounce     ; 0xE9 - MAGIC SHOP ASSISTANT
|06882F| dw SpritePrep_HeartContainer_bounce         ; 0xEA - HEART CONTAINER
|068831| dw SpritePrep_HeartPiece                    ; 0xEB - HEART PIECE
|068833| dw SpritePrep_DoNothingI                    ; 0xEC - THROWN ITEM
|068835| dw SpritePrep_DoNothingA                    ; 0xED - SOMARIA PLATFORM
|068837| dw SpritePrep_Mantle                        ; 0xEE - CASTLE MANTLE
|068839| dw SpritePrep_DoNothingA                    ; 0xEF - UNUSED SOMARIA PLATFORM
|06883B| dw SpritePrep_DoNothingA                    ; 0xF0 - UNUSED SOMARIA PLATFORM
|06883D| dw SpritePrep_DoNothingA                    ; 0xF1 - UNUSED SOMARIA PLATFORM
|06883F| dw SpritePrep_MedallionTablet_bounce        ; 0xF2 - MEDALLION TABLET

;===================================================================================================

SpritePrep_Mantle:
|068841| LDA.w $0D00,X
|068844| CLC
|068845| ADC.b #$03
|068847| STA.w $0D00,X

;===================================================================================================

SpritePrep_MoveRight8px:
|06884A| LDA.w $0D10,X
|06884D| CLC
|06884E| ADC.b #$08
|068850| STA.w $0D10,X

|068853| RTS

;===================================================================================================

SpritePrep_MedallionTablet_bounce:
|068854| JSL SpritePrep_MedallionTablet

|068858| RTS

;===================================================================================================

SpritePrep_Switch:
|068859| LDA.w $048E

|06885C| CMP.b #$CE ; ROOM 00CE
|06885E| BEQ .tongue_room

|068860| CMP.b #$04 ; ROOM 0004
|068862| BEQ .tongue_room

|068864| CMP.b #$3F ; ROOM 003F
|068866| BNE SpritePrep_DoNothingB

.tongue_room
|068868| LDA.b #$0D
|06886A| STA.w $0F50,X

;===================================================================================================

SpritePrep_DoNothingB:
|06886D| RTS

;===================================================================================================

SpritePrep_Snitch_bounce_1:
|06886E| JSL SpritePrep_Snitch

|068872| RTS

;===================================================================================================

SpritePrep_DoNothingA:
|068873| RTS

;===================================================================================================

pool SpritePrep_Rat

.damage
|068874| db $00, $05

.hp
|068876| db   2,   8

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Rat:
|068878| LDY.w $0FFF

|06887B| LDA.w .damage,Y
|06887E| STA.w $0CD2,X

|068881| LDA.w .hp,Y
|068884| STA.w $0E50,X

|068887| RTS

;===================================================================================================

pool SpritePrep_Keese

.damage
|068888| db $80, $85

.hp
|06888A| db   1,   4

.prizepack
|06888C| db $00, $07

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Keese:
|06888E| LDY.w $0FFF

|068891| LDA.w .damage,Y
|068894| STA.w $0CD2,X

|068897| LDA.w .hp,Y
|06889A| STA.w $0E50,X

|06889D| LDA.w .prizepack,Y
|0688A0| STA.w $0BE0,X

|0688A3| RTS

;===================================================================================================

pool SpritePrep_Rope

.damage
|0688A4| db $01, $05

.hp
|0688A6| db   4,   8

.prizepack
|0688A8| db $01, $07

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Rope:
|0688AA| LDY.w $0FFF

|0688AD| LDA.w .damage,Y
|0688B0| STA.w $0CD2,X

|0688B3| LDA.w .hp,Y
|0688B6| STA.w $0E50,X

|0688B9| LDA.w .prizepack,Y
|0688BC| STA.w $0BE0,X

|0688BF| RTS

;===================================================================================================

SpritePrep_Swamola:
|0688C0| JSL InitializeSwamolaSegments

|0688C4| JMP.w SpritePrep_CacheOriginalCoordinates

;===================================================================================================

SpritePrep_Blind:
|0688C7| JSR SpritePrep_Boss
|0688CA| JSL SpritePrep_Blind_PrepareBattle

|0688CE| RTS

;===================================================================================================

SpritePrep_Ganon:
|0688CF| JSR SpritePrep_Boss
|0688D2| JSL SpritePrep_Ganon_PrepareBattle

|0688D6| RTS

;===================================================================================================

pool SpritePrep_Pokey

.speed_x
|0688D7| db  16, -16,  16, -16

.speed_y
|0688DB| db  16,  16, -16, -16

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Pokey:
|0688DF| LDA.b #$03
|0688E1| STA.w $0D90,X

|0688E4| LDA.b #$08
|0688E6| STA.w $0DA0,X

|0688E9| JSL GetRandomNumber
|0688ED| AND.b #$03
|0688EF| TAY

|0688F0| LDA.w .speed_x,Y
|0688F3| STA.w $0D50,X

|0688F6| LDA.w .speed_y,Y
|0688F9| STA.w $0D40,X

|0688FC| RTS

;===================================================================================================

SpritePrep_MiniVitreous:
|0688FD| JSR SpritePrep_Boss

|068900| RTS

;===================================================================================================

SpritePrep_Gibo:
|068901| LDA.b #$10
|068903| STA.w $0F70,X

|068906| LDA.b #$08
|068908| STA.w $0ED0,X

|06890B| RTS

;===================================================================================================

pool SpritePrep_Octoballoon

.timer
|06890C| db 192,  208,  224,  240

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Octoballoon:
|068910| TXA
|068911| AND.b #$03
|068913| TAY

|068914| LDA.w .timer,Y
|068917| STA.w $0DF0,X

|06891A| RTS

;===================================================================================================

SpritePrep_LightningGate:
|06891B| PHX

|06891C| LDX.b $8A

|06891E| LDA.l $7EF280,X

|068922| PLX

|068923| AND.b #$40
|068925| BEQ SpritePrep_Catfish

|068927| LDA.b #$04
|068929| STA.w $0DC0,X

;===================================================================================================

SpritePrep_Catfish:
|06892C| JSR SpritePrep_MoveDown8pxRight8px

|06892F| LDA.w $0D00,X
|068932| SEC
|068933| SBC.b #$0C
|068935| STA.w $0D00,X

|068938| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_CutsceneAgahnim:
|06893B| LDA.w $0403
|06893E| AND.b #$40
|068940| BEQ .not_seen_cutscene

|068942| STZ.w $0DD0,X

|068945| RTS

.not_seen_cutscene
|068946| JSL CutsceneAgahnim_SpawnZeldaOnAltar

|06894A| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Vitreous:
|06894D| JSR SpritePrep_Boss
|068950| JSR SpritePrep_MoveDown8pxRight8px

|068953| LDA.w $0D00,X
|068956| SEC
|068957| SBC.b #$10
|068959| STA.w $0D00,X

|06895C| JSL Vitreous_SpawnMinions

|068960| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

pool SpritePrep_Raven

.damage
|068963| db $81, $88

.hp
|068965| db $04, $08

.prize_pack
|068967| db $06, $02

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Raven:
|068969| LDY.w $0FFF

|06896C| LDA.w .damage,Y
|06896F| STA.w $0CD2,X

|068972| LDA.w .hp,Y
|068975| STA.w $0E50,X

|068978| LDA.w .prize_pack,Y
|06897B| STA.w $0BE0,X

;===================================================================================================

SpritePrep_Vulture:
|06897E| LDA.b #$00
|068980| STA.w $0F70,X

|068983| LDA.w $0D10,X
|068986| AND.b #$10
|068988| LSR A
|068989| LSR A
|06898A| LSR A
|06898B| LSR A
|06898C| STA.w $0D90,X

|06898F| BRA SpritePrep_SetAuxToFE

;===================================================================================================

SpritePrep_Poe:
|068991| LDA.b #$0C
|068993| STA.w $0F70,X

;===================================================================================================

SpritePrep_SetAuxToFE:
|068996| LDA.b #$FE
|068998| STA.w $0E30,X

;===================================================================================================

SpritePrep_DoNothingC:
|06899B| RTS

;===================================================================================================

SpritePrep_BlindMaiden:
|06899C| LDA.l $7EF159
|0689A0| AND.b #$08
|0689A2| BNE .kill_the_girl

|0689A4| INC.w $0BA0,X

|0689A7| LDA.l $7EF3CC
|0689AB| CMP.b #$06 ; FOLLOWER 06
|0689AD| BEQ .kill_the_girl

|0689AF| LDA.b #$06 ; FOLLOWER 06
|0689B1| STA.l $7EF3CC

|0689B5| LDA.b #$00
|0689B7| STA.l $7EF3D3

|0689BB| PHX

|0689BC| STZ.w $02F9

|0689BF| JSL LoadFollowerGraphics
|0689C3| JSL InitializeFollower

|0689C7| PLX

|0689C8| LDA.b #$00
|0689CA| STA.l $7EF3CC

|0689CE| RTS

.kill_the_girl
|0689CF| STZ.w $0DD0,X

|0689D2| RTS

;===================================================================================================

SpritePrep_MiniMoldorm_bounce:
|0689D3| JSL SpritePrep_MiniMoldorm

|0689D7| RTS

;===================================================================================================

SpritePrep_Zirro:
|0689D8| LDA.b #$10
|0689DA| STA.w $0F70,X

|0689DD| BRA SpritePrep_SetAuxToFE

;===================================================================================================

SpritePrep_BombShop:
|0689DF| INC.w $0BA0,X

|0689E2| LDA.b #$B5 ; SPRITE B5
|0689E4| JSL SpawnSpriteDynamically
|0689E8| BMI .no_space_to_spawn_OHNO

|0689EA| LDA.b $00
|0689EC| SEC
|0689ED| SBC.b #$18
|0689EF| STA.w $0D10,Y

|0689F2| LDA.b $01
|0689F4| SBC.b #$00
|0689F6| STA.w $0D30,Y

|0689F9| LDA.b $02
|0689FB| SEC
|0689FC| SBC.b #$18
|0689FE| STA.w $0D00,Y

|068A01| LDA.b $03
|068A03| SBC.b #$00
|068A05| STA.w $0D20,Y

|068A08| LDA.b #$01
|068A0A| STA.w $0E80,Y
|068A0D| STA.w $0BA0,Y

;---------------------------------------------------------------------------------------------------

.no_space_to_spawn_OHNO
|068A10| LDA.l $7EF37A
|068A14| AND.b #$05
|068A16| CMP.b #$05
|068A18| BNE .you_dont_deserve_the_big_bomb

|068A1A| LDA.l $7EF3C9
|068A1E| AND.b #$20
|068A20| BEQ .you_dont_deserve_the_big_bomb

|068A22| LDA.b #$B5 ; SPRITE B5
|068A24| JSL SpawnSpriteDynamically
|068A28| BMI .you_dont_deserve_the_big_bomb

|068A2A| LDA.b $00
|068A2C| SEC
|068A2D| SBC.b #$38
|068A2F| STA.w $0D10,Y

|068A32| LDA.b $01
|068A34| SBC.b #$00
|068A36| STA.w $0D30,Y

|068A39| LDA.b $02
|068A3B| SEC
|068A3C| SBC.b #$18
|068A3E| STA.w $0D00,Y

|068A41| LDA.b $03
|068A43| SBC.b #$00
|068A45| STA.w $0D20,Y

|068A48| LDA.b #$02
|068A4A| STA.w $0E80,Y
|068A4D| STA.w $0BA0,Y

.you_dont_deserve_the_big_bomb
|068A50| RTS

;===================================================================================================

SpritePrep_BullyAndVictim:
|068A51| JSL SpawnBully

|068A55| INC.w $0BA0,X

|068A58| RTS

;===================================================================================================

SpritePrep_PurpleChest:
|068A59| LDA.l $7EF3CC
|068A5D| CMP.b #$0C ; FOLLOWER 0C
|068A5F| BEQ NoFriendForYou

|068A61| LDA.l $7EF3C9
|068A65| AND.b #$10
|068A67| BNE NoFriendForYou

|068A69| LDA.l $7EF3C9
|068A6D| AND.b #$20
|068A6F| BEQ NoFriendForYou

|068A71| INC.w $0BA0,X

|068A74| RTS

;===================================================================================================

NoFriendForYou:
|068A75| STZ.w $0DD0,X

|068A78| RTS

;===================================================================================================

SpritePrep_Smithy:
|068A79| INC.w $0BA0,X

|068A7C| LDA.l $7EF3CA
|068A80| AND.b #$40
|068A82| BEQ .in_light_world

|068A84| LDA.l $7EF3C9
|068A88| AND.b #$20
|068A8A| BNE NoFriendForYou

|068A8C| LDA.l $7EF3CC
|068A90| CMP.b #$00
|068A92| BNE NoFriendForYou

|068A94| LDA.b #$02
|068A96| STA.w $0E80,X

|068A99| RTS

;---------------------------------------------------------------------------------------------------

.in_light_world
|068A9A| JSL SpawnDumbBarrierSprite

|068A9E| LDA.l $7EF3C9
|068AA2| AND.b #$20
|068AA4| BNE .rescued

|068AA6| LDA.w $0D10,X
|068AA9| CLC
|068AAA| ADC.b #$02
|068AAC| STA.w $0D10,X

|068AAF| LDA.w $0D00,X
|068AB2| SEC
|068AB3| SBC.b #$03
|068AB5| STA.w $0D00,X

|068AB8| RTS

;---------------------------------------------------------------------------------------------------

.rescued
|068AB9| LDA.w $0D10,X
|068ABC| CLC
|068ABD| ADC.b #$02
|068ABF| STA.w $0D10,X

|068AC2| LDA.w $0D00,X
|068AC5| SEC
|068AC6| SBC.b #$03
|068AC8| STA.w $0D00,X

|068ACB| JSR Smithy_SpawnDwarfPal

|068ACE| PHX
|068ACF| PHY

|068AD0| TYX
|068AD1| JSL SpawnDumbBarrierSprite

|068AD5| PLY
|068AD6| PLX

|068AD7| TYA
|068AD8| STA.w $0E90,X

|068ADB| TXA
|068ADC| STA.w $0E90,Y

|068ADF| LDA.l $7EF3C9
|068AE3| AND.b #$80
|068AE5| BEQ .exit

|068AE7| LDA.b #$05
|068AE9| STA.w $0D80,X
|068AEC| STA.w $0D80,Y

.exit
|068AEF| RTS

;===================================================================================================

SpritePrep_Babasu:
|068AF0| JSR SpritePrep_MoveDown8px

;===================================================================================================

SpritePrep_Zoro:
|068AF3| LDA.w $0E20,X
|068AF6| SEC
|068AF7| SBC.b #$9C
|068AF9| ASL A
|068AFA| STA.w $0DE0,X

|068AFD| DEC.w $0DC0,X

|068B00| RTS

;===================================================================================================

UNREACHABLE_068B01:
|068B01| db $F8, $08

;===================================================================================================

SpritePrep_LaserEye_bounce:
|068B03| JSL SpritePrep_LaserEye

|068B07| RTS

;===================================================================================================

SpritePrep_Popo:
|068B08| LDA.b #$07
|068B0A| BRA .set_movement_mask

;===================================================================================================

#SpritePrep_Popo2:
|068B0C| LDA.b #$0F

;===================================================================================================

.set_movement_mask
|068B0E| STA.w $0DA0,X

|068B11| RTS

;===================================================================================================

SpritePrep_Statue:
|068B12| LDA.w $0D00,X
|068B15| CLC
|068B16| ADC.b #$07
|068B18| STA.w $0D00,X

|068B1B| RTS

;===================================================================================================

SpritePrep_Bari:
|068B1C| LDA.b #$06
|068B1E| STA.w $0F70,X

|068B21| LDA.w $048E
|068B24| CMP.b #$CE ; ROOM 00CE
|068B26| BNE .not_uninformed

|068B28| DEC.w $0DB0,X

.not_uninformed
|068B2B| JMP.w Bari_RandomlySetTimer2

;===================================================================================================

SpritePrep_GreenStalfos:
|068B2E| LDA.b #$09
|068B30| STA.w $0F70,X

|068B33| RTS

;===================================================================================================

SpritePrep_WaterLever:
|068B34| LDA.w $0D00,X
|068B37| CLC
|068B38| ADC.b #$05
|068B3A| STA.w $0D00,X

|068B3D| RTS

;===================================================================================================

SpritePrep_Debirando:
|068B3E| LDA.b #$63 ; SPRITE 63
|068B40| STA.w $0E20,X

|068B43| JSL LoadSpriteProperties
|068B47| DEC.w $0ED0,X

;===================================================================================================

SpritePrep_DebirandoPit:
|068B4A| INC.w $0ED0,X

|068B4D| LDA.b #$00
|068B4F| STA.w $0DF0,X

|068B52| LDA.b #$06
|068B54| STA.w $0DC0,X

|068B57| JSR SpritePrep_IgnoreProjectiles

|068B5A| LDA.b #$64 ; SPRITE 64
|068B5C| JSL SpawnSpriteDynamically
|068B60| BMI .no_space

|068B62| JSL SetSpawnedSpriteCoordinates

|068B66| LDA.b #$60
|068B68| STA.w $0DF0,Y

|068B6B| TYA
|068B6C| STA.w $0EB0,X

|068B6F| LDA.w $0ED0,X
|068B72| STA.w $0ED0,Y

|068B75| PHX

|068B76| TAX

|068B77| LDA.w .palette,X
|068B7A| STA.w $0F50,Y

|068B7D| PLX

.no_space
|068B7E| RTS

;---------------------------------------------------------------------------------------------------

.palette
|068B7F| db $06, $08

;===================================================================================================

SpritePrep_WeakGuard:
|068B81| JSL GetRandomNumber
|068B85| AND.b #$03
|068B87| STA.w $0DE0,X
|068B8A| STA.w $0EB0,X

|068B8D| LDA.b #$10
|068B8F| STA.w $0DF0,X

|068B92| RTS

;===================================================================================================

SpritePrep_WallCannon:
|068B93| LDA.w $0E20,X
|068B96| SEC
|068B97| SBC.b #$66 ; SPRITE 66 - base wall cannon ID
|068B99| STA.w $0DE0,X

|068B9C| AND.b #$02
|068B9E| STA.w $0D90,X

|068BA1| RTS

;===================================================================================================

SpritePrep_ArcheryGame_bounce:
|068BA2| JSL SpritePrep_ArcheryGame

|068BA6| RTS

;===================================================================================================

SpritePrep_IgnoreProjectiles:
|068BA7| INC.w $0BA0,X

|068BAA| RTS

;===================================================================================================

SpritePrep_HauntedGroveAnimal:
|068BAB| JSR GetXDisplacementFromLink

|068BAE| TYA
|068BAF| STA.w $0DE0,X

;===================================================================================================

SpritePrep_HauntedGroveOstrich:
|068BB2| LDA.l $7EF34C
|068BB6| CMP.b #$02
|068BB8| BCC .has_no_flute

|068BBA| STZ.w $0DD0,X

.has_no_flute
|068BBD| BRA SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_DiggingGameGuy_bounce:
|068BBF| JSL SpritePrep_DiggingGameGuy

|068BC3| RTS

;===================================================================================================

SpritePrep_ThievesTownGrate:
|068BC4| LDA.l $7EF2D8
|068BC8| AND.b #$20
|068BCA| BEQ SpritePrep_RupeePull

|068BCC| STZ.w $0DD0,X

;===================================================================================================

SpritePrep_RupeePull:
|068BCF| INC.w $0BA0,X

|068BD2| LDA.w $0D10,X
|068BD5| SEC
|068BD6| SBC.b #$08
|068BD8| STA.w $0D10,X

|068BDB| LDA.w $0D30,X
|068BDE| SBC.b #$00
|068BE0| STA.w $0D30,X

|068BE3| RTS

;===================================================================================================

pool SpritePrep_Shopkeeper

.rooms
|068BE4| db $0F ; ROOM 010F - Darkworld Lumberjack / Outcasts shield shop
|068BE5| db $10 ; ROOM 0110 - East of Outcasts
|068BE6| db $00 ; ROOM 0100 - Lost Woods chest game
|068BE7| db $06 ; ROOM 0106 - Village of Outcasts chest game
|068BE8| db $18 ; ROOM 0118 - South of Kak 3 chest game
|068BE9| db $12 ; ROOM 0112 - Common cave shop
|068BEA| db $1E ; ROOM 011E - Swamplands thief cave
|068BEB| db $FF ; ROOM 00FF - Paradox cave shop
|068BEC| db $1F ; ROOM 011F - Kakariko shop
|068BED| db $23 ; ROOM 0123 - Mini moldorm cave
|068BEE| db $24 ; ROOM 0124 - Outside Desert thief
|068BEF| db $25 ; ROOM 0125 - Ice rod cave thief
|068BF0| db $27 ; ROOM 0127 - Hammer pegs cave

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper:
|068BF1| INC.w $0BA0,X

|068BF4| LDA.w $0E40,X
|068BF7| ORA.b #$02
|068BF9| STA.w $0E40,X

|068BFC| LDA.w $0F50,X
|068BFF| ORA.b #$0C
|068C01| STA.w $0F50,X

|068C04| LDA.w $0E60,X
|068C07| ORA.b #$10
|068C09| STA.w $0E60,X

|068C0C| LDA.b $A0

|068C0E| LDY.b #$00

.next_room
|068C10| CMP.w .rooms,Y
|068C13| BEQ .found_room

|068C15| INY
|068C16| BNE .next_room

;---------------------------------------------------------------------------------------------------

.found_room
|068C18| TYA
|068C19| JSL JumpTableLocal
|068C1D| dw SpritePrep_Shopkeeper_DarkWorldStock
|068C1F| dw SpritePrep_Shopkeeper_EastOfOutcasts
|068C21| dw SpritePrep_LostWoodsChestGame
|068C23| dw SpritePrep_ChestGameGuy
|068C25| dw SpritePrep_KakChestGame
|068C27| dw SpritePrep_Shopkeeper_StandardStock
|068C29| dw SpritePrep_NiceThief_WithGift
|068C2B| dw SpritePrep_Shopkeeper_StandardStock
|068C2D| dw SpritePrep_Shopkeeper_StandardStock
|068C2F| dw SpritePrep_NiceThief_WithGift
|068C31| dw SpritePrep_NiceThief_Desert
|068C33| dw SpritePrep_NiceThief_Ice
|068C35| dw SpritePrep_NiceThief_WithGift

;===================================================================================================

SpritePrep_Shopkeeper_DarkWorldStock:
|068C37| LDA.b #$00
|068C39| LDY.b #$07 ; Red potion
|068C3B| JSL Shopkeeper_SpawnShopItem

|068C3F| LDY.b #$08 ; Fighter shield
|068C41| BRA SpritePrep_Shopkeeper_SpawnItemAndBombs

;===================================================================================================

SpritePrep_Shopkeeper_EastOfOutcasts:
|068C43| LDA.b #$00
|068C45| LDY.b #$09 ; Fire shield
|068C47| JSL Shopkeeper_SpawnShopItem

|068C4B| LDA.b #$01
|068C4D| LDY.b #$0D ; Bee
|068C4F| JSL Shopkeeper_SpawnShopItem

|068C53| LDA.b #$02
|068C55| LDY.b #$0B ; Arrows
|068C57| JSL Shopkeeper_SpawnShopItem

|068C5B| RTS

;===================================================================================================

SpritePrep_LostWoodsChestGame:
|068C5C| LDA.b #$04
|068C5E| BRA SpritePrep_Shopkeeper_SetType

;===================================================================================================

SpritePrep_ChestGameGuy:
|068C60| LDA.b #$01
|068C62| STA.w $0DC0,X
|068C65| BRA SpritePrep_Shopkeeper_SetType

;===================================================================================================

SpritePrep_KakChestGame:
|068C67| LDA.b #$03

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper_SetType:
|068C69| STA.w $0E80,X

|068C6C| LDA.b #$FF
|068C6E| STA.w $04C4

|068C71| RTS

;===================================================================================================

SpritePrep_Shopkeeper_StandardStock:
|068C72| LDA.b #$00
|068C74| LDY.b #$07 ; Red potion
|068C76| JSL Shopkeeper_SpawnShopItem

|068C7A| LDY.b #$0A ; Heart

;---------------------------------------------------------------------------------------------------

SpritePrep_Shopkeeper_SpawnItemAndBombs:
|068C7C| LDA.b #$01
|068C7E| JSL Shopkeeper_SpawnShopItem

|068C82| LDA.b #$02
|068C84| LDY.b #$0C ; Bombs
|068C86| JSL Shopkeeper_SpawnShopItem

|068C8A| RTS

;===================================================================================================

SpritePrep_NiceThief_WithGift:
|068C8B| LDA.b #$02

;===================================================================================================

SpritePrep_NiceThief_SetType:
|068C8D| STA.w $0E80,X

|068C90| RTS

;===================================================================================================

SpritePrep_NiceThief_Desert:
|068C91| LDA.b #$05

|068C93| BRA SpritePrep_NiceThief_SetType

;===================================================================================================

SpritePrep_NiceThief_Ice:
|068C95| LDA.b #$06

|068C97| BRA SpritePrep_NiceThief_SetType

;===================================================================================================

pool SpritePrep_DarkWorldHintNPC

.rooms
|068C99| db $0E ; ROOM 010E - bird
|068C9A| db $0E ; ROOM 010E - glover
|068C9B| db $12 ; ROOM 0112 - octorok
|068C9C| db $1A ; ROOM 011A - broccoli
|068C9D| db $14 ; ROOM 0114 - watto

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_DarkWorldHintNPC:
|068C9E| INC.w $0BA0,X

|068CA1| LDA.b $A0

|068CA3| LDY.b #$00

.next_room
|068CA5| CMP.w .rooms,Y
|068CA8| BEQ .found_room

|068CAA| INY
|068CAB| BNE .next_room

;---------------------------------------------------------------------------------------------------

.found_room
|068CAD| TYA
|068CAE| STA.w $0E80,X
|068CB1| BNE .exit

|068CB3| LDA.w $0D30,X
|068CB6| AND.b #$01
|068CB8| BEQ .exit

|068CBA| INC.w $0E80,X

.exit
|068CBD| RTS

;===================================================================================================

pool SpritePrep_Adult

.rooms
|068CBE| db $03 ; ROOM 0103 - Kakariko Tavern
|068CBF| db $E1 ; ROOM 00E1 - Lost Woods hideout
|068CC0| db $19 ; ROOM 0119 - Blind's Hideout

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Adult:
|068CC1| INC.w $0BA0,X

|068CC4| LDA.b $A0

|068CC6| LDY.b #$00

.next_room
|068CC8| CMP.w .rooms,Y
|068CCB| BEQ .found_room

|068CCD| INY
|068CCE| BNE .next_room

.found_room
|068CD0| TYA
|068CD1| STA.w $0E80,X

|068CD4| RTS

;===================================================================================================

SpritePrep_Whirlpool:
|068CD5| INC.w $0BA0,X

|068CD8| LDA.b #$01
|068CDA| STA.w $0D90,X

|068CDD| RTS

;===================================================================================================

SpritePrep_Sage:
|068CDE| INC.w $0BA0,X

|068CE1| LDA.b $A0
|068CE3| CMP.b #$0A ; ROOM 010A
|068CE5| BNE .not_aginah

|068CE7| INC.w $0E80,X

|068CEA| LDA.b #$0B
|068CEC| STA.w $0F50,X

.not_aginah
|068CEF| RTS

;===================================================================================================

pool SpritePrep_BonkKey

.room_flags
|068CF0| db $40, $20

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_BonkItem:
|068CF2| LDA.b $1B
|068CF4| BEQ SpritePrep_LumberjackTree

|068CF6| LDA.b #$02
|068CF8| STA.w $0F20,X

|068CFB| LDA.b $A0
|068CFD| CMP.b #$07 ; ROOM 0107
|068CFF| BNE SpritePrep_BonkKey

|068D01| LDA.b $A1
|068D03| CMP.b #$01
|068D05| BNE SpritePrep_BonkKey

;===================================================================================================

SpritePrep_BonkBook:
|068D07| LDA.l $7EF34E
|068D0B| BEQ .book_not_owned

|068D0D| STZ.w $0DD0,X

|068D10| RTS

.book_not_owned
|068D11| PHX

|068D12| LDA.b #$0E
|068D14| JSL WriteTo4BPPBuffer_item_gfx

|068D18| PLX

|068D19| RTS

;===================================================================================================

SpritePrep_BonkKey:
|068D1A| LDA.w $0B9B
|068D1D| STA.w $0CBA,X

|068D20| TAY

|068D21| INC.w $0B9B

|068D24| LDA.w $0403
|068D27| AND.w .room_flags,Y
|068D2A| BEQ .not_obtained

|068D2C| STZ.w $0DD0,X

.not_obtained
|068D2F| INC.w $0DC0,X

|068D32| LDA.b #$08
|068D34| STA.w $0F50,X

|068D37| LDA.w $0E60,X
|068D3A| ORA.b #$20
|068D3C| STA.w $0E60,X

|068D3F| RTS

;===================================================================================================

SpritePrep_LumberjackTree:
|068D40| LDA.b #$02
|068D42| STA.w $0DC0,X

|068D45| RTS

;===================================================================================================

SpritePrep_Kiki:
|068D46| INC.w $0BA0,X

|068D49| PHX

|068D4A| LDX.b $8A
|068D4C| LDA.l $7EF280,X

|068D50| PLX

|068D51| AND.b #$20
|068D53| BEQ .monkey_lives

|068D55| STZ.w $0DD0,X

.monkey_lives
|068D58| RTS

;===================================================================================================

SpritePrep_Locksmith:
|068D59| INC.w $0BA0,X

|068D5C| LDA.l $7EF3CC
|068D60| CMP.b #$09 ; FOLLOWER 09
|068D62| BNE .not_already_following

|068D64| STZ.w $0DD0,X

|068D67| RTS

;---------------------------------------------------------------------------------------------------

.not_already_following
|068D68| CMP.b #$0C ; FOLLOWER 0C
|068D6A| BNE .no_purple_chest

|068D6C| LDA.b #$02
|068D6E| STA.w $0D80,X

.no_purple_chest
|068D71| LDA.l $7EF3C9
|068D75| AND.b #$10
|068D77| BEQ .exit

|068D79| LDA.b #$04
|068D7B| STA.w $0D80,X

.exit
|068D7E| RTS

;===================================================================================================

SpritePrep_SickKid:
|068D7F| LDA.l $7EF34D
|068D83| BEQ .no_net

|068D85| LDA.b #$03
|068D87| STA.w $0D80,X

.no_net
|068D8A| INC.w $0BA0,X

|068D8D| RTS

;===================================================================================================

pool SpritePrep_Tektite

.palette
|068D8E| db $09, $07

.health
|068D90| db   8,  12

.damage
|068D92| db $03, $05

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Tektite:
|068D94| LDA.w $0D10,X

|068D97| LSR A
|068D98| LSR A
|068D99| LSR A
|068D9A| LSR A

|068D9B| AND.b #$01
|068D9D| STA.w $0D90,X

|068DA0| TAY

|068DA1| LDA.w .palette,Y
|068DA4| STA.w $0F50,X

|068DA7| LDA.w .health,Y
|068DAA| STA.w $0E50,X

|068DAD| LDA.w .damage,Y
|068DB0| STA.w $0CD2,X

|068DB3| LDA.b #$10
|068DB5| JSR ApplySpeedTowardsLink

|068DB8| LDA.b #$20
|068DBA| STA.w $0F80,X

|068DBD| INC.w $0D80,X

|068DC0| RTS

;===================================================================================================

SpritePrep_Chainchomp_bounce:
|068DC1| JSL SpritePrep_Chainchomp

|068DC5| RTS

;===================================================================================================

SpritePrep_BigFairy:
|068DC6| LDA.b #$18
|068DC8| STA.w $0F70,X

|068DCB| JSR SpritePrep_MoveDown8pxRight8px

|068DCE| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_MrsSahasrahla:
|068DD1| LDA.w $0D00,X
|068DD4| CLC
|068DD5| ADC.b #$08
|068DD7| STA.w $0D00,X

;===================================================================================================

SpritePrep_MagicBat:
SpritePrep_Lumberjacks:
|068DDA| JSR SpritePrep_MoveRight8px

|068DDD| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_FortuneTeller:
|068DE0| JSR SpritePrep_MoveDown8pxRight8px

|068DE3| INC.w $0BA0,X

|068DE6| RTS

;===================================================================================================

pool SpritePrep_Leever

.palette
|068DE7| db $0A, $02

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Leever:
|068DE9| LDA.w $0D10,X

|068DEC| LSR A
|068DED| LSR A
|068DEE| LSR A
|068DEF| LSR A

|068DF0| AND.b #$01
|068DF2| STA.w $0D90,X

|068DF5| TAY

|068DF6| LDA.w .palette,Y
|068DF9| STA.w $0F50,X

|068DFC| RTS

;===================================================================================================

SpritePrep_Hobo:
|068DFD| LDY.b #$0F

; WTF??????
.next_spawn
|068DFF| PHY

|068E00| JSR SpawnBonusHobo

|068E03| PLY

|068E04| DEY
|068E05| BNE .next_spawn

|068E07| LDY.b #$0F

.next_check
|068E09| LDA.w $0E20,Y
|068E0C| CMP.b #$2B ; SPRITE 2B
|068E0E| BNE .kill_the_hobo

|068E10| LDA.b #$00
|068E12| STA.w $0DD0,Y

.kill_the_hobo
|068E15| DEY
|068E16| BNE .next_check

;---------------------------------------------------------------------------------------------------

|068E18| JSR SpawnCampfire

|068E1B| TXY

|068E1C| LDA.l $7EF3C9
|068E20| AND.b #$01
|068E22| BEQ .can_give_bottle

|068E24| LDA.b #$03
|068E26| STA.w $0D80

.can_give_bottle
|068E29| TYX

|068E2A| LDA.b #$01
|068E2C| STA.w $0BA0

|068E2F| RTS

;===================================================================================================

SpritePrep_MasterSword:
|068E30| LDA.w $0D10,X
|068E33| CLC
|068E34| ADC.b #$06
|068E36| STA.w $0D10,X

|068E39| LDA.w $0D00,X
|068E3C| ADC.b #$06
|068E3E| STA.w $0D00,X

|068E41| RTS

;===================================================================================================

SpritePrep_Roller_HorizontalRightFirst:
|068E42| LDY.b #$00
|068E44| BRA .get_x_position

;---------------------------------------------------------------------------------------------------

#SpritePrep_Roller_HorizontalLeftFirst:
|068E46| LDY.b #$01

.get_x_position
|068E48| LDA.w $0D10,X
|068E4B| EOR.b #$10

|068E4D| BRA SpritePrep_Roller

;===================================================================================================

SpritePrep_Roller_VerticalDownFirst:
|068E4F| LDY.b #$02
|068E51| BRA .get_y_position

;---------------------------------------------------------------------------------------------------

#SpritePrep_Roller_VerticalUpFirst:
|068E53| LDY.b #$03

.get_y_position
|068E55| LDA.w $0D00,X

;===================================================================================================

SpritePrep_Roller:
|068E58| AND.b #$10

|068E5A| LSR A
|068E5B| LSR A
|068E5C| LSR A
|068E5D| LSR A

|068E5E| STA.w $0D80,X

|068E61| BEQ .leave_hitbox

|068E63| INC.w $0F60,X

.leave_hitbox
|068E66| TYA
|068E67| STA.w $0DE0,X

|068E6A| RTS

;===================================================================================================

SpritePrep_Kodongo:
|068E6B| LDA.w $0D10,X
|068E6E| CLC
|068E6F| ADC.b #$04
|068E71| STA.w $0D10,X

|068E74| LDA.w $0D00,X
|068E77| SEC
|068E78| SBC.b #$05
|068E7A| STA.w $0D00,X

|068E7D| LDA.w $0D20,X
|068E80| SBC.b #$00
|068E82| STA.w $0D20,X

;===================================================================================================

SpritePrep_Spark:
|068E85| DEC.w $0E30,X

|068E88| RTS

;===================================================================================================

UNREACHABLE_068E89:
|068E89| db $00, $E0, $F8, $18, $E8, $18, $D0, $30
|068E91| db $E8, $18, $E0, $F8, $18, $00, $00, $FF
|068E99| db $FF, $00, $FF, $00, $FF, $00, $FF, $00
|068EA1| db $FF, $FF, $00, $00, $C0, $D0, $D8, $D0
|068EA9| db $F0, $F0, $00, $00, $10, $10, $28, $30
|068EB1| db $30, $40, $FF, $FF, $FF, $FF, $FF, $FF
|068EB9| db $00, $00, $00, $00, $00, $00, $00, $00

;===================================================================================================

SpritePrep_LostWoodsBird:
|068EC1| JSL GetRandomNumber
|068EC5| AND.b #$1F
|068EC7| SEC
|068EC8| SBC.b #$10
|068ECA| STA.w $0F80,X

|068ECD| LDA.b #$40
|068ECF| STA.w $0F70,X

;===================================================================================================

SpritePrep_LostWoodsSquirrel:
|068ED2| JSR GetXDisplacementFromLink

|068ED5| LDA.b #$10

|068ED7| CPY.b #$00
|068ED9| BEQ .run_right

|068EDB| LDA.b #$F0

.run_right
|068EDD| STA.w $0D50,X

|068EE0| LDA.b #$FC

|068EE2| LDY.w $069E
|068EE5| BPL .run_down

|068EE7| LDA.b #$04

.run_down
|068EE9| STA.w $0D40,X
|068EEC| STA.w $0BA0,X

|068EEF| RTS

;===================================================================================================

pool SpritePrep_Antifairy

.speed_x
|068EF0| db 16, -16

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Antifairy:
|068EF2| LDA.w $0D10,X
|068EF5| LSR A
|068EF6| LSR A
|068EF7| LSR A
|068EF8| LSR A
|068EF9| AND.b #$01
|068EFB| TAY

|068EFC| LDA.w .speed_x,Y
|068EFF| STA.w $0D50,X

|068F02| LDA.b #$F0
|068F04| STA.w $0D40,X

|068F07| RTS

;===================================================================================================

SpritePrep_FallingIce:
|068F08| JSR SpritePrep_Boss

|068F0B| INC.w $0BA0,X

|068F0E| RTS

;===================================================================================================

SpritePrep_KingZora:
|068F0F| LDA.l $7EF356
|068F13| BEQ .finger_webs_for_sale

|068F15| STZ.w $0DD0,X

|068F18| RTS

.finger_webs_for_sale
|068F19| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Boss:
|068F1C| LDA.w $0403
|068F1F| BPL .boss_alive

|068F21| PLA
|068F22| PLA

|068F23| STZ.w $0DD0,X

|068F26| RTS

;---------------------------------------------------------------------------------------------------

.boss_alive
|068F27| LDY.b #$0F

.next_sprite
|068F29| PHX

|068F2A| LDX.w $0E20,Y
|068F2D| LDA.l SpriteData_Bump,X

|068F31| PLX

|068F32| AND.b #$10
|068F34| BNE .leave_alive

|068F36| LDA.b #$00
|068F38| STA.w $0DD0,Y

.leave_alive
|068F3B| DEY
|068F3C| BPL .next_sprite

|068F3E| RTS

;===================================================================================================

SpritePrep_ArmosKnight:
|068F3F| JSR SpritePrep_Boss

|068F42| LDA.b #$FF
|068F44| STA.w $0DF0,X

|068F47| INC.w $0FF8

|068F4A| JMP.w SpritePrep_MoveDown8pxRight8px

;===================================================================================================

SpritePrep_DesertStatue:
|068F4D| LDA.w $0B6A
|068F50| STA.w $0D90,X

|068F53| INC.w $0B6A

|068F56| JSR SpritePrep_MoveDown8pxRight8px

|068F59| LDA.w $0D10,X

|068F5C| LDY.b #$01

|068F5E| CMP.b #$30
|068F60| BCC .ignore_position

|068F62| INY

|068F63| CMP.b #$E0
|068F65| BCS .ignore_position

|068F67| INY

.ignore_position
|068F68| TYA
|068F69| STA.w $0DE0,X

;===================================================================================================

SpritePrep_DoNothingD:
|068F6C| RTS

;===================================================================================================

pool SpritePrep_Octorok

.damage
|068F6D| db $03, $05

.health
|068F6F| db   2,   4

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Octorok:
|068F71| LDY.w $0FFF

|068F74| LDA.w .health,Y
|068F77| STA.w $0E50,X

|068F7A| LDA.w .damage,Y
|068F7D| STA.w $0CD2,X

|068F80| JSL GetRandomNumber
|068F84| AND.b #$7F
|068F86| STA.w $0DF0,X

|068F89| RTS

;===================================================================================================

SpritePrep_Moldorm_bounce:
|068F8A| JSR SpritePrep_Boss

|068F8D| INC.w $0BA0,X

|068F90| JSL SpritePrep_Moldorm

|068F94| RTS

;===================================================================================================

SpritePrep_Lanmolas_bounce:
|068F95| JSR SpritePrep_Boss
|068F98| JSL SpritePrep_Lanmolas

|068F9C| RTS

;===================================================================================================

SpritePrep_BigSpike:
|068F9D| JSR SpritePrep_MoveDown8pxRight8px

|068FA0| BRA SpritePrep_CacheOriginalCoordinates

;===================================================================================================

SpritePrep_SwimmingZora:
|068FA2| LDA.b #$40
|068FA4| STA.w $0DF0,X

;===================================================================================================

SpritePrep_Geldman:
|068FA7| LDA.b #$08
|068FA9| CLC
|068FAA| ADC.w $0D10,X
|068FAD| STA.w $0D10,X

;===================================================================================================

SpritePrep_CacheOriginalCoordinates:
|068FB0| LDA.w $0D10,X
|068FB3| STA.w $0D90,X

|068FB6| LDA.w $0D30,X
|068FB9| STA.w $0DA0,X

|068FBC| LDA.w $0D00,X
|068FBF| STA.w $0DB0,X

|068FC2| LDA.w $0D20,X
|068FC5| STA.w $0EB0,X

|068FC8| RTS

;===================================================================================================

SpritePrep_WalkingZora:
|068FC9| LDA.b #$60
|068FCB| STA.w $0DF0,X

|068FCE| RTS

;===================================================================================================

SpritePrep_StandardGuard_Indoors:
|068FCF| ASL.w $0BE0,X
|068FD2| LSR.w $0BE0,X

|068FD5| RTS

;===================================================================================================

SpritePrep_StandardGuard:
|068FD6| LDA.w $0E30,X
|068FD9| BEQ .dont_turn

|068FDB| LDY.b #$00

|068FDD| AND.b #$07
|068FDF| CMP.b #$05
|068FE1| BCS .special_turn

|068FE3| DEC A
|068FE4| EOR.b #$01
|068FE6| STA.w $0DE0,X

.dont_turn
|068FE9| LDA.b $1B
|068FEB| BNE SpritePrep_StandardGuard_Indoors

|068FED| LDA.b #$01
|068FEF| STA.w $0D80,X

|068FF2| LDA.b #$70
|068FF4| STA.w $0DF0,X

|068FF7| JSR GetDirectionTowardsLink

|068FFA| TYA
|068FFB| STA.w $0DE0,X
|068FFE| STA.w $0EB0,X

;===================================================================================================

#SpritePrep_CoolerGuard:
|069001| BRA SpritePrep_CoolestGuardEver

.special_turn
|069003| BEQ .not_five

|069005| LDY.b #$04

.not_five
|069007| LDA.w $0E30,X

|06900A| LSR A
|06900B| LSR A
|06900C| LSR A

|06900D| AND.b #$03
|06900F| STA.b $00

|069011| TYA
|069012| ORA.b $00
|069014| TAY

|069015| LDA.w .data,Y
|069018| STA.w $0DA0,X

|06901B| LDA.w $0B6B,X
|06901E| AND.b #$0F
|069020| ORA.b #$50
|069022| STA.w $0B6B,X

;===================================================================================================

#SpritePrep_CoolestGuardEver:
|069025| LDA.b $11
|069027| PHA

|069028| STZ.b $11

|06902A| SEC
|06902B| ROR.w $0CAA,X

|06902E| JSR SpriteModule_Active
|069031| JSR SpriteModule_Active

|069034| ASL.w $0CAA,X

|069037| PLA
|069038| STA.b $11

|06903A| RTS

;---------------------------------------------------------------------------------------------------

.data
|06903B| db $00, $02, $01, $03, $06, $04, $05, $07

;===================================================================================================

SpritePrep_TalkingTree:
|069043| INC.w $0BA0,X

|069046| LDA.w $0D10,X
|069049| SEC
|06904A| SBC.b #$08
|06904C| STA.w $0D10,X

|06904F| LDA.w $0D30,X
|069052| SBC.b #$00
|069054| STA.w $0D30,X

|069057| LDA.b #$00
|069059| JSL SpritePrep_TalkingTree_SpawnEyeball

|06905D| LDA.b #$01
|06905F| JSL SpritePrep_TalkingTree_SpawnEyeball

|069063| RTS

;===================================================================================================

SpritePrep_CrystalSwitch:
|069064| LDA.l $7EC172
|069068| AND.b #$01
|06906A| TAY

|06906B| LDA.w CrystalSwitch_Palette,Y
|06906E| ORA.w $0F50,X
|069071| STA.w $0F50,X

|069074| RTS

;===================================================================================================

SpritePrep_FluteKid:
|069075| INC.w $0BA0,X

|069078| LDA.l $7EF3CA
|06907C| ASL A
|06907D| ROL A
|06907E| ROL A
|06907F| AND.b #$01
|069081| STA.w $0E80,X
|069084| BEQ .light_world

;---------------------------------------------------------------------------------------------------

.stumpy
|069086| LDA.l $7EF3C9
|06908A| AND.b #$08
|06908C| BNE .not_stumpified

|06908E| LDA.l $7EF34C
|069092| CMP.b #$02
|069094| BCC .no_flute
|069096| BEQ .have_shovel

;---------------------------------------------------------------------------------------------------

.not_stumpified
|069098| LDA.b #$03
|06909A| STA.w $0DC0,X

|06909D| LDA.b #$05
|06909F| STA.w $0D80,X

|0690A2| BRA .no_flute

;---------------------------------------------------------------------------------------------------

.have_shovel
|0690A4| LDA.b #$01
|0690A6| STA.w $0DC0,X

.no_flute
|0690A9| JSR SpritePrep_MoveRight8px

|0690AC| LDA.w $0D00,X
|0690AF| SEC
|0690B0| SBC.b #$08
|0690B2| STA.w $0D00,X

|0690B5| RTS

;---------------------------------------------------------------------------------------------------

.light_world
|0690B6| LDA.l $7EF34C
|0690BA| CMP.b #$02
|0690BC| BCC SpritePrep_MoveRight7px

|0690BE| STZ.w $0DD0,X

|0690C1| RTS

;===================================================================================================

SpritePrep_MoveRight7px:
|0690C2| LDA.w $0D10,X
|0690C5| CLC
|0690C6| ADC.b #$07
|0690C8| STA.w $0D10,X

|0690CB| RTS

;===================================================================================================

SpritePrep_MoveDown8px:
|0690CC| LDA.w $0D00,X
|0690CF| CLC
|0690D0| ADC.b #$08
|0690D2| STA.w $0D00,X

;===================================================================================================

SpritePrep_DoNothingE:
|0690D5| RTS

;===================================================================================================

SpritePrep_PedestalPlaque:
|0690D6| INC.w $0BA0,X

|0690D9| LDA.b $8A
|0690DB| CMP.b #$30 ; OW 30
|0690DD| BEQ SpritePrep_MoveRight7px

|0690DF| RTS

;===================================================================================================

SpritePrep_Stalfos:
|0690E0| LDA.w $0D10,X
|0690E3| AND.b #$10
|0690E5| STA.w $0E30,X
|0690E8| BEQ .blue_stalfos

|0690EA| LDA.b #$07
|0690EC| STA.w $0F50,X

.blue_stalfos
|0690EF| RTS

;===================================================================================================

SpritePrep_KholdstareShell:
|0690F0| JSR SpritePrep_Boss

|0690F3| LDA.b #$C0
|0690F5| STA.w $0E00,X

|0690F8| BRA SpritePrep_MoveDown8pxRight8px

;===================================================================================================

SpritePrep_Kholdstare:
|0690FA| JSR SpritePrep_Boss

|0690FD| LDA.b #$03
|0690FF| STA.w $0D80,X

|069102| JSR SpritePrep_IgnoreProjectiles

|069105| BRA SpritePrep_MoveDown8pxRight8px

;===================================================================================================

SpritePrep_Bumper:
|069107| JSR SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_MoveDown8pxRight8px:
|06910A| PHX

|06910B| TXA
|06910C| CLC
|06910D| ADC.b #$10
|06910F| TAX

|069110| JSR SpritePrep_MoveDown8px

|069113| PLX

|069114| BRA SpritePrep_MoveDown8px

;===================================================================================================

pool SpritePrep_HardhatBeetle

.palette
|069116| db $06, $08

.health
|069118| db  32,   6

.speed
|06911A| db $10, $0C

.ai
|06911C| db $01, $03

.prize
|06911E| db $02, $06

.bump
|069120| db $05, $03

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_HardhatBeetle:
|069122| LDY.b #$00

|069124| LDA.w $0D10,X
|069127| AND.b #$10
|069129| BEQ .red

|06912B| INY

.red
|06912C| LDA.w .palette,Y
|06912F| STA.w $0F50,X

|069132| LDA.w .health,Y
|069135| STA.w $0E50,X

|069138| LDA.w .speed,Y
|06913B| STA.w $0D90,X

|06913E| LDA.w .ai,Y
|069141| STA.w $0D80,X

|069144| LDA.w .prize,Y
|069147| STA.w $0BE0,X

|06914A| LDA.w .bump,Y
|06914D| STA.w $0CD2,X

|069150| RTS

;===================================================================================================

SpritePrep_MiniHelmasaur:
|069151| LDA.b #$10
|069153| STA.w $0D90,X

|069156| LDA.b #$01
|069158| STA.w $0D80,X

|06915B| RTS

;===================================================================================================

SpritePrep_Fairy:
|06915C| JSL GetRandomNumber
|069160| AND.b #$01
|069162| STA.w $0D90,X

|069165| EOR.b #$01
|069167| STA.w $0DE0,X

;===================================================================================================

SpritePrep_Absorbable:
|06916A| LDA.b $1B
|06916C| BNE SpritePrep_DoNothingF

;===================================================================================================

SpritePrep_OverworldBonkItem:
|06916E| INC.w $0E90,X
|069171| INC.w $0BA0,X

;===================================================================================================

SpritePrep_DoNothingF:
|069174| RTS

;===================================================================================================

SpritePrep_GoodBee:
|069175| LDA.l $7EF35C
|069179| ORA.l $7EF35D
|06917D| ORA.l $7EF35E
|069181| ORA.l $7EF35F
|069185| AND.b #$08
|069187| BEQ .bees_for_everyone_like_that_oprah_gif

|069189| STZ.w $0DD0,X

.bees_for_everyone_like_that_oprah_gif
|06918C| INC.w $0E90,X
|06918F| INC.w $0BA0,X

|069192| RTS

;===================================================================================================

pool SpritePrep_Agahnim

.palette
|069193| db $0B, $07

endpool

;---------------------------------------------------------------------------------------------------

SpritePrep_Agahnim:
|069195| JSR SpritePrep_Boss

|069198| LDA.b #$00
|06919A| STA.w $0DC0,X

|06919D| LDA.b #$03
|06919F| STA.w $0DE0,X

|0691A2| JSR SpritePrep_MoveDown8pxRight8px

|0691A5| LDY.w $0FFF

|0691A8| LDA.w .palette,Y
|0691AB| STA.w $0F50,X

;===================================================================================================

SpritePrep_DoNothingG:
|0691AE| RTS

;===================================================================================================

SpritePrep_Eyegore_bounce:
|0691AF| JSL SpritePrep_Eyegore

|0691B3| RTS

;===================================================================================================

SpritePrep_FireBar:
|0691B4| INC.w $0DA0,X

|0691B7| JMP.w SpritePrep_IgnoreProjectiles

;===================================================================================================

SpritePrep_Trinexx:
|0691BA| JSR SpritePrep_Boss
|0691BD| JSL Trinexx_Initialize
|0691C1| JSR RemoveCachedSprites

|0691C4| RTS

;===================================================================================================

SpritePrep_HelmasaurKing:
|0691C5| JSR SpritePrep_Boss
|0691C8| JSL HelmasaurKing_Initialize

;===================================================================================================

RemoveCachedSprites:
|0691CC| LDY.b #$0F
|0691CE| LDA.b #$00

.next
|0691D0| STA.w $1D00,Y

|0691D3| DEY
|0691D4| BPL .next

|0691D6| RTS

;===================================================================================================

SpritePrep_Spike:
|0691D7| LDA.b #$20
|0691D9| STA.w $0D50,X

;===================================================================================================

SpritePrep_RockStal:
|0691DC| LDA.b #$F0
|0691DE| STA.w $0D40,X

|0691E1| JSR MoveSpriteY_bank06

|0691E4| STZ.w $0D40,X

|0691E7| RTS

;===================================================================================================

SpritePrep_Blob:
|0691E8| LDA.b #$04
|0691EA| STA.w $0DC0,X

|0691ED| JSR SpritePrep_IgnoreProjectiles

|0691F0| RTS

;===================================================================================================

SpritePrep_Arrghus:
|0691F1| JSR SpritePrep_Boss

|0691F4| LDA.b #$18
|0691F6| STA.w $0F70,X

|0691F9| RTS

;===================================================================================================

SpritePrep_Arrghi:
|0691FA| JSR SpritePrep_Boss

|0691FD| JSL GetRandomNumber

|069201| STA.w $0E80,X

|069204| CPX.b #$0D
|069206| BNE .not_last_puff

|069208| STZ.w $0B0A
|06920B| STZ.w $0B0B

|06920E| PHX

|06920F| LDX.b #$00
|069211| JSL ControlArrghi_long

|069215| PLX

.not_last_puff
|069216| LDA.w $0B0F,X
|069219| STA.w $0D10,X

|06921C| LDA.w $0B1F,X
|06921F| STA.w $0D30,X

|069222| LDA.w $0B2F,X
|069225| STA.w $0D00,X

|069228| LDA.w $0B3F,X
|06922B| STA.w $0D20,X

|06922E| RTS

;===================================================================================================

SpritePrep_Mothula:
|06922F| JSR SpritePrep_Boss

|069232| LDA.b #$50
|069234| STA.w $0DF0,X

|069237| INC.w $0BA0,X

|06923A| LDA.b #$02
|06923C| STA.w $0DC0,X

|06923F| INC.w $041A

|069242| LDA.b #$70
|069244| STA.w $0DB0,X

|069247| RTS

;===================================================================================================

SpritePrep_AntifairyCircle_bounce:
|069248| JSL SpritePrep_AntifairyCircle

|06924C| RTS

;===================================================================================================

SpritePrep_DoNothingH:
|06924D| RTS

;===================================================================================================

SpritePrep_BigKey:
|06924E| JSR SpritePrep_MoveRight8px

|069251| LDA.b #$FF
|069253| STA.w $0E30,X

;---------------------------------------------------------------------------------------------------

LoadBigKeyGraphics:
|069256| PHX
|069257| PHY

|069258| LDA.b #$22
|06925A| JSL WriteTo4BPPBuffer_item_gfx

|06925E| PLY
|06925F| PLX

|069260| BRA SetKeyIndex

;===================================================================================================

SpritePrep_SmallKey:
|069262| LDA.b #$FF
|069264| STA.w $0E30,X

;===================================================================================================

SetKeyIndex:
|069267| LDA.w $0B9B
|06926A| STA.w $0CBA,X

|06926D| INC.w $0B9B

|069270| RTS

;===================================================================================================

SpriteModule_Active:
|069271| LDA.w $0E20,X

|069274| REP #$30

|069276| AND.w #$00FF
|069279| ASL A
|06927A| TAY

|06927B| LDA.w .vectors,Y
|06927E| DEC A
|06927F| PHA

|069280| SEP #$30

|069282| RTS

;---------------------------------------------------------------------------------------------------

.vectors
|069283| dw Sprite_00_Raven_bounce                   ; 0x00 - RAVEN
|069285| dw Sprite_01_Vulture_bounce                 ; 0x01 - VULTURE
|069287| dw Sprite_02_StalfosHead                    ; 0x02 - STALFOS HEAD
|069289| dw $0000                                    ; 0x03 - NULL
|06928B| dw PullSwitch_bounce                        ; 0x04 - CORRECT PULL SWITCH
|06928D| dw PullSwitch_bounce                        ; 0x05 - UNUSED CORRECT PULL SWITCH
|06928F| dw PullSwitch_bounce                        ; 0x06 - WRONG PULL SWITCH
|069291| dw PullSwitch_bounce                        ; 0x07 - UNUSED WRONG PULL SWITCH
|069293| dw Sprite_08_Octorok                        ; 0x08 - OCTOROK
|069295| dw Sprite_09_Moldorm_bounce                 ; 0x09 - MOLDORM
|069297| dw Sprite_0A_Octorok4way                    ; 0x0A - OCTOROK 4WAY
|069299| dw Sprite_0B_Cucco                          ; 0x0B - CUCCO
|06929B| dw Sprite_0C_OctorokStone                   ; 0x0C - OCTOROK STONE
|06929D| dw Sprite_0D_Buzzblob                       ; 0x0D - BUZZBLOB
|06929F| dw Sprite_0E_Snapdragon                     ; 0x0E - SNAPDRAGON
|0692A1| dw Sprite_0F_Octoballoon                    ; 0x0F - OCTOBALLOON
|0692A3| dw Sprite_10_OctoballoonBaby                ; 0x10 - OCTOBALLOON BABY
|0692A5| dw Sprite_11_Hinox                          ; 0x11 - HINOX
|0692A7| dw Sprite_12_Moblin                         ; 0x12 - MOBLIN
|0692A9| dw Sprite_13_MiniHelmasaur                  ; 0x13 - MINI HELMASAUR
|0692AB| dw Sprite_14_ThievesTownGrate_bounce        ; 0x14 - THIEVES TOWN GRATE
|0692AD| dw Sprite_15_Antifairy                      ; 0x15 - ANTIFAIRY
|0692AF| dw Sprite_16_Elder_bounce                   ; 0x16 - SAHASRAHLA / AGINAH
|0692B1| dw Sprite_17_Hoarder                        ; 0x17 - BUSH HOARDER
|0692B3| dw Sprite_18_MiniMoldorm                    ; 0x18 - MINI MOLDORM
|0692B5| dw Sprite_19_Poe                            ; 0x19 - POE
|0692B7| dw Sprite_1A_Smithy                         ; 0x1A - SMITHY
|0692B9| dw Sprite_1B_Arrow                          ; 0x1B - ARROW
|0692BB| dw Sprite_1C_Statue                         ; 0x1C - STATUE
|0692BD| dw Sprite_1D_FluteQuest                     ; 0x1D - FLUTE QUEST
|0692BF| dw Sprite_1E_CrystalSwitch                  ; 0x1E - CRYSTAL SWITCH
|0692C1| dw Sprite_1F_SickKid                        ; 0x1F - SICK KID
|0692C3| dw Sprite_20_Sluggula                       ; 0x20 - SLUGGULA
|0692C5| dw Sprite_21_WaterSwitch                    ; 0x21 - WATER SWITCH
|0692C7| dw Sprite_22_Ropa                           ; 0x22 - ROPA
|0692C9| dw Sprite_23_RedBari                        ; 0x23 - RED BARI
|0692CB| dw Sprite_24_BlueBari                       ; 0x24 - BLUE BARI
|0692CD| dw Sprite_25_TalkingTree_bounce             ; 0x25 - TALKING TREE
|0692CF| dw Sprite_26_HardhatBeetle                  ; 0x26 - HARDHAT BEETLE
|0692D1| dw Sprite_27_Deadrock                       ; 0x27 - DEADROCK
|0692D3| dw Sprite_28_DarkWorldHintNPC               ; 0x28 - DARK WORLD HINT NPC
|0692D5| dw Sprite_29_Adult_bounce                   ; 0x29 - ADULT
|0692D7| dw Sprite_2A_SweepingLady_bounce            ; 0x2A - SWEEPING LADY
|0692D9| dw Sprite_2B_Hobo                           ; 0x2B - HOBO
|0692DB| dw Sprite_2C_Lumberjacks_bounce             ; 0x2C - LUMBERJACKS
|0692DD| dw Sprite_2D_NecklessMan_bounce             ; 0x2D - NECKLESS MAN
|0692DF| dw Sprite_2E_FluteKid                       ; 0x2E - FLUTE KID
|0692E1| dw Sprite_2F_RaceGameLady_bounce            ; 0x2F - RACE GAME LADY
|0692E3| dw Sprite_30_RaceGameGuy_bounce             ; 0x30 - RACE GAME GUY
|0692E5| dw Sprite_31_FortuneTeller_bounce           ; 0x31 - FORTUNE TELLER
|0692E7| dw Sprite_32_ArguingBros_bounce             ; 0x32 - ARGUE BROS
|0692E9| dw Sprite_33_RupeePull_bounce               ; 0x33 - RUPEE PULL
|0692EB| dw Sprite_34_YoungSnitch_bounce             ; 0x34 - YOUNG SNITCH
|0692ED| dw Sprite_35_Innkeeper_bounce               ; 0x35 - INNKEEPER
|0692EF| dw Sprite_36_Witch_bounce                   ; 0x36 - WITCH
|0692F1| dw Sprite_37_Waterfall_bounce               ; 0x37 - WATERFALL
|0692F3| dw Sprite_38_EyeStatue_bounce               ; 0x38 - EYE STATUE
|0692F5| dw Sprite_39_Locksmith                      ; 0x39 - LOCKSMITH
|0692F7| dw Sprite_3A_MagicBat_bounce                ; 0x3A - MAGIC BAT
|0692F9| dw Sprite_3B_BonkItem_bounce                ; 0x3B - BONK ITEM
|0692FB| dw Sprite_3C_KidInKak_bounce                ; 0x3C - KID IN KAK
|0692FD| dw Sprite_3D_OldSnitch_bounce               ; 0x3D - OLD SNITCH
|0692FF| dw Sprite_3E_Hoarder                        ; 0x3E - ROCK HOARDER
|069301| dw TutorialGuardOrBarrier_bounce            ; 0x3F - TUTORIAL GUARD
|069303| dw TutorialGuardOrBarrier_bounce            ; 0x40 - LIGHTNING GATE
|069305| dw SpriteModule_Active_bank05_bounce        ; 0x41 - BLUE GUARD
|069307| dw SpriteModule_Active_bank05_bounce        ; 0x42 - GREEN GUARD
|069309| dw SpriteModule_Active_bank05_bounce        ; 0x43 - RED SPEAR GUARD
|06930B| dw SpriteModule_Active_bank05_bounce        ; 0x44 - BLUESAIN BOLT
|06930D| dw SpriteModule_Active_bank05_bounce        ; 0x45 - USAIN BOLT
|06930F| dw SpriteModule_Active_bank05_bounce        ; 0x46 - BLUE ARCHER
|069311| dw SpriteModule_Active_bank05_bounce        ; 0x47 - GREEN BUSH GUARD
|069313| dw SpriteModule_Active_bank05_bounce        ; 0x48 - RED JAVELIN GUARD
|069315| dw SpriteModule_Active_bank05_bounce        ; 0x49 - RED BUSH GUARD
|069317| dw SpriteModule_Active_bank05_bounce        ; 0x4A - BOMB GUARD
|069319| dw SpriteModule_Active_bank05_bounce        ; 0x4B - GREEN KNIFE GUARD
|06931B| dw SpriteModule_Active_bank05_bounce        ; 0x4C - GELDMAN
|06931D| dw SpriteModule_Active_bank05_bounce        ; 0x4D - TOPPO
|06931F| dw SpriteModule_Active_bank05_bounce        ; 0x4E - POPO
|069321| dw SpriteModule_Active_bank05_bounce        ; 0x4F - POPO
|069323| dw SpriteModule_Active_bank05_bounce        ; 0x50 - CANNONBALL
|069325| dw SpriteModule_Active_bank05_bounce        ; 0x51 - ARMOS STATUE
|069327| dw SpriteModule_Active_bank05_bounce        ; 0x52 - KING ZORA
|069329| dw SpriteModule_Active_bank05_bounce        ; 0x53 - ARMOS KNIGHT
|06932B| dw SpriteModule_Active_bank05_bounce        ; 0x54 - LANMOLAS
|06932D| dw SpriteModule_Active_bank05_bounce        ; 0x55 - ZORA / FIREBALL
|06932F| dw SpriteModule_Active_bank05_bounce        ; 0x56 - WALKING ZORA
|069331| dw SpriteModule_Active_bank05_bounce        ; 0x57 - DESERT STATUE
|069333| dw SpriteModule_Active_bank05_bounce        ; 0x58 - CRAB
|069335| dw SpriteModule_Active_bank05_bounce        ; 0x59 - LOST WOODS BIRD
|069337| dw SpriteModule_Active_bank05_bounce        ; 0x5A - LOST WOODS SQUIRREL
|069339| dw SpriteModule_Active_bank05_bounce        ; 0x5B - SPARK
|06933B| dw SpriteModule_Active_bank05_bounce        ; 0x5C - SPARK
|06933D| dw SpriteModule_Active_bank05_bounce        ; 0x5D - ROLLER VERTICAL DOWN FIRST
|06933F| dw SpriteModule_Active_bank05_bounce        ; 0x5E - ROLLER VERTICAL UP FIRST
|069341| dw SpriteModule_Active_bank05_bounce        ; 0x5F - ROLLER HORIZONTAL RIGHT FIRST
|069343| dw SpriteModule_Active_bank05_bounce        ; 0x60 - ROLLER HORIZONTAL LEFT FIRST
|069345| dw SpriteModule_Active_bank05_bounce        ; 0x61 - BEAMOS
|069347| dw SpriteModule_Active_bank05_bounce        ; 0x62 - MASTERSWORD
|069349| dw SpriteModule_Active_bank05_bounce        ; 0x63 - DEBIRANDO PIT
|06934B| dw SpriteModule_Active_bank05_bounce        ; 0x64 - DEBIRANDO
|06934D| dw SpriteModule_Active_bank05_bounce        ; 0x65 - ARCHERY GUY
|06934F| dw SpriteModule_Active_bank05_bounce        ; 0x66 - WALL CANNON VERTICAL LEFT
|069351| dw SpriteModule_Active_bank05_bounce        ; 0x67 - WALL CANNON VERTICAL RIGHT
|069353| dw SpriteModule_Active_bank05_bounce        ; 0x68 - WALL CANNON HORIZONTAL TOP
|069355| dw SpriteModule_Active_bank05_bounce        ; 0x69 - WALL CANNON HORIZONTAL BOTTOM
|069357| dw SpriteModule_Active_bank05_bounce        ; 0x6A - BALL N CHAIN
|069359| dw SpriteModule_Active_bank05_bounce        ; 0x6B - CANNONBALL / CANNON TROOPER
|06935B| dw SpriteModule_Active_bank05_bounce        ; 0x6C - MIRROR PORTAL
|06935D| dw SpriteModule_Active_bank05_bounce        ; 0x6D - RAT / CRICKET
|06935F| dw SpriteModule_Active_bank05_bounce        ; 0x6E - ROPE
|069361| dw SpriteModule_Active_bank05_bounce        ; 0x6F - KEESE
|069363| dw SpriteModule_Active_bank05_bounce        ; 0x70 - KING HELMASAUR FIREBALL
|069365| dw Sprite_71_Leever                         ; 0x71 - LEEVER
|069367| dw Sprite_72_FairyPond                      ; 0x72 - FAIRY POND TRIGGER
|069369| dw Sprite_73_UncleAndPriest_bounce          ; 0x73 - UNCLE / PRIEST / MANTLE
|06936B| dw Sprite_74_RunningBoy_bounce              ; 0x74 - RUNNING BOY
|06936D| dw Sprite_75_BottleMerchant_bounce          ; 0x75 - BOTTLE MERCHANT
|06936F| dw Sprite_76_Zelda_bounce                   ; 0x76 - ZELDA
|069371| dw Sprite_77_Antifairy                      ; 0x77 - ANTIFAIRY
|069373| dw Sprite_78_MrsSahasrahla_bounce           ; 0x78 - SAHASRAHLAS WIFE
|069375| dw SpriteModule_Active_bank1E_bounce        ; 0x79 - BEE
|069377| dw SpriteModule_Active_bank1E_bounce        ; 0x7A - AGAHNIM
|069379| dw SpriteModule_Active_bank1E_bounce        ; 0x7B - AGAHNIMS BALLS
|06937B| dw SpriteModule_Active_bank1E_bounce        ; 0x7C - GREEN STALFOS
|06937D| dw SpriteModule_Active_bank1E_bounce        ; 0x7D - BIG SPIKE
|06937F| dw SpriteModule_Active_bank1E_bounce        ; 0x7E - FIREBAR CLOCKWISE
|069381| dw SpriteModule_Active_bank1E_bounce        ; 0x7F - FIREBAR COUNTERCLOCKWISE
|069383| dw SpriteModule_Active_bank1E_bounce        ; 0x80 - FIRESNAKE
|069385| dw SpriteModule_Active_bank1E_bounce        ; 0x81 - HOVER
|069387| dw SpriteModule_Active_bank1E_bounce        ; 0x82 - ANTIFAIRY CIRCLE
|069389| dw SpriteModule_Active_bank1E_bounce        ; 0x83 - GREEN EYEGORE / GREEN MIMIC
|06938B| dw SpriteModule_Active_bank1E_bounce        ; 0x84 - RED EYEGORE / RED MIMIC
|06938D| dw SpriteModule_Active_bank1E_bounce        ; 0x85 - YELLOW STALFOS
|06938F| dw SpriteModule_Active_bank1E_bounce        ; 0x86 - KODONGO
|069391| dw SpriteModule_Active_bank1E_bounce        ; 0x87 - KODONGO FIRE
|069393| dw SpriteModule_Active_bank1E_bounce        ; 0x88 - MOTHULA
|069395| dw SpriteModule_Active_bank1E_bounce        ; 0x89 - MOTHULA BEAM
|069397| dw SpriteModule_Active_bank1E_bounce        ; 0x8A - SPIKE BLOCK
|069399| dw SpriteModule_Active_bank1E_bounce        ; 0x8B - GIBDO
|06939B| dw SpriteModule_Active_bank1E_bounce        ; 0x8C - ARRGHUS
|06939D| dw SpriteModule_Active_bank1E_bounce        ; 0x8D - ARRGHI
|06939F| dw SpriteModule_Active_bank1E_bounce        ; 0x8E - TERRORPIN
|0693A1| dw SpriteModule_Active_bank1E_bounce        ; 0x8F - BLOB
|0693A3| dw SpriteModule_Active_bank1E_bounce        ; 0x90 - WALLMASTER
|0693A5| dw SpriteModule_Active_bank1E_bounce        ; 0x91 - STALFOS KNIGHT
|0693A7| dw SpriteModule_Active_bank1E_bounce        ; 0x92 - KING HELMASAUR
|0693A9| dw SpriteModule_Active_bank1E_bounce        ; 0x93 - BUMPER
|0693AB| dw SpriteModule_Active_bank1E_bounce        ; 0x94 - PIROGUSU
|0693AD| dw SpriteModule_Active_bank1E_bounce        ; 0x95 - LASER EYE LEFT
|0693AF| dw SpriteModule_Active_bank1E_bounce        ; 0x96 - LASER EYE RIGHT
|0693B1| dw SpriteModule_Active_bank1E_bounce        ; 0x97 - LASER EYE TOP
|0693B3| dw SpriteModule_Active_bank1E_bounce        ; 0x98 - LASER EYE BOTTOM
|0693B5| dw SpriteModule_Active_bank1E_bounce        ; 0x99 - PENGATOR
|0693B7| dw SpriteModule_Active_bank1E_bounce        ; 0x9A - KYAMERON
|0693B9| dw SpriteModule_Active_bank1E_bounce        ; 0x9B - WIZZROBE
|0693BB| dw SpriteModule_Active_bank1E_bounce        ; 0x9C - ZORO
|0693BD| dw SpriteModule_Active_bank1E_bounce        ; 0x9D - BABASU
|0693BF| dw SpriteModule_Active_bank1E_bounce        ; 0x9E - HAUNTED GROVE OSTRICH
|0693C1| dw SpriteModule_Active_bank1E_bounce        ; 0x9F - HAUNTED GROVE RABBIT
|0693C3| dw SpriteModule_Active_bank1E_bounce        ; 0xA0 - HAUNTED GROVE BIRD
|0693C5| dw SpriteModule_Active_bank1E_bounce        ; 0xA1 - FREEZOR
|0693C7| dw SpriteModule_Active_bank1E_bounce        ; 0xA2 - KHOLDSTARE
|0693C9| dw SpriteModule_Active_bank1E_bounce        ; 0xA3 - KHOLDSTARE SHELL
|0693CB| dw SpriteModule_Active_bank1E_bounce        ; 0xA4 - FALLING ICE
|0693CD| dw SpriteModule_Active_bank1E_bounce        ; 0xA5 - BLUE ZAZAK
|0693CF| dw SpriteModule_Active_bank1E_bounce        ; 0xA6 - RED ZAZAK
|0693D1| dw SpriteModule_Active_bank1E_bounce        ; 0xA7 - STALFOS
|0693D3| dw SpriteModule_Active_bank1E_bounce        ; 0xA8 - GREEN ZIRRO
|0693D5| dw SpriteModule_Active_bank1E_bounce        ; 0xA9 - BLUE ZIRRO
|0693D7| dw SpriteModule_Active_bank1E_bounce        ; 0xAA - PIKIT
|0693D9| dw SpriteModule_Active_bank1E_bounce        ; 0xAB - CRYSTAL MAIDEN
|0693DB| dw SpriteModule_Active_bank1E_bounce        ; 0xAC - APPLE
|0693DD| dw SpriteModule_Active_bank1E_bounce        ; 0xAD - OLD MAN
|0693DF| dw SpriteModule_Active_bank1E_bounce        ; 0xAE - PIPE DOWN
|0693E1| dw SpriteModule_Active_bank1E_bounce        ; 0xAF - PIPE UP
|0693E3| dw SpriteModule_Active_bank1E_bounce        ; 0xB0 - PIPE RIGHT
|0693E5| dw SpriteModule_Active_bank1E_bounce        ; 0xB1 - PIPE LEFT
|0693E7| dw SpriteModule_Active_bank1E_bounce        ; 0xB2 - GOOD BEE
|0693E9| dw SpriteModule_Active_bank1E_bounce        ; 0xB3 - PEDESTAL PLAQUE
|0693EB| dw SpriteModule_Active_bank1E_bounce        ; 0xB4 - PURPLE CHEST
|0693ED| dw SpriteModule_Active_bank1E_bounce        ; 0xB5 - BOMB SHOP GUY
|0693EF| dw SpriteModule_Active_bank1E_bounce        ; 0xB6 - KIKI
|0693F1| dw SpriteModule_Active_bank1E_bounce        ; 0xB7 - BLIND MAIDEN
|0693F3| dw SpriteModule_Active_bank1E_bounce        ; 0xB8 - DIALOGUE TESTER
|0693F5| dw SpriteModule_Active_bank1E_bounce        ; 0xB9 - BULLY / PINK BALL
|0693F7| dw SpriteModule_Active_bank1E_bounce        ; 0xBA - WHIRLPOOL
|0693F9| dw SpriteModule_Active_bank1E_bounce        ; 0xBB - SHOPKEEPER / CHEST GAME GUY
|0693FB| dw SpriteModule_Active_bank1E_bounce        ; 0xBC - DRUNKARD
|0693FD| dw SpriteModule_Active_bank1D_bounce        ; 0xBD - VITREOUS
|0693FF| dw SpriteModule_Active_bank1D_bounce        ; 0xBE - VITREOUS SMALL EYE
|069401| dw SpriteModule_Active_bank1D_bounce        ; 0xBF - LIGHTNING
|069403| dw SpriteModule_Active_bank1D_bounce        ; 0xC0 - CATFISH
|069405| dw SpriteModule_Active_bank1D_bounce        ; 0xC1 - CUTSCENE AGAHNIM
|069407| dw SpriteModule_Active_bank1D_bounce        ; 0xC2 - BOULDER
|069409| dw SpriteModule_Active_bank1D_bounce        ; 0xC3 - GIBO
|06940B| dw SpriteModule_Active_bank1D_bounce        ; 0xC4 - THIEF
|06940D| dw SpriteModule_Active_bank1D_bounce        ; 0xC5 - MEDUSA
|06940F| dw SpriteModule_Active_bank1D_bounce        ; 0xC6 - YOMO MEDUSA
|069411| dw SpriteModule_Active_bank1D_bounce        ; 0xC7 - POKEY
|069413| dw SpriteModule_Active_bank1D_bounce        ; 0xC8 - BIG FAIRY
|069415| dw SpriteModule_Active_bank1D_bounce        ; 0xC9 - TEKTITE / FIREBAT
|069417| dw SpriteModule_Active_bank1D_bounce        ; 0xCA - CHAIN CHOMP
|069419| dw SpriteModule_Active_bank1D_bounce        ; 0xCB - TRINEXX ROCK HEAD
|06941B| dw SpriteModule_Active_bank1D_bounce        ; 0xCC - TRINEXX FIRE HEAD
|06941D| dw SpriteModule_Active_bank1D_bounce        ; 0xCD - TRINEXX ICE HEAD
|06941F| dw SpriteModule_Active_bank1D_bounce        ; 0xCE - BLIND
|069421| dw SpriteModule_Active_bank1D_bounce        ; 0xCF - SWAMOLA
|069423| dw SpriteModule_Active_bank1D_bounce        ; 0xD0 - LYNEL
|069425| dw SpriteModule_Active_bank1D_bounce        ; 0xD1 - BUNNYBEAM / SMOKE
|069427| dw SpriteModule_Active_bank1D_bounce        ; 0xD2 - FLOPPING FISH
|069429| dw SpriteModule_Active_bank1D_bounce        ; 0xD3 - STAL
|06942B| dw SpriteModule_Active_bank1D_bounce        ; 0xD4 - LANDMINE
|06942D| dw SpriteModule_Active_bank1D_bounce        ; 0xD5 - DIGGING GAME GUY
|06942F| dw SpriteModule_Active_bank1D_bounce        ; 0xD6 - GANON
|069431| dw SpriteModule_Active_bank1D_bounce        ; 0xD7 - GANON
|069433| dw Sprite_D8_Heart                          ; 0xD8 - HEART
|069435| dw Sprite_D9_GreenRupee                     ; 0xD9 - GREEN RUPEE
|069437| dw Sprite_DA_BlueRupee                      ; 0xDA - BLUE RUPEE
|069439| dw Sprite_DB_RedRupee                       ; 0xDB - RED RUPEE
|06943B| dw Sprite_DC_BombRefill1                    ; 0xDC - BOMB REFILL 1
|06943D| dw Sprite_DD_BombRefill4                    ; 0xDD - BOMB REFILL 4
|06943F| dw Sprite_DE_BombRefill8                    ; 0xDE - BOMB REFILL 8
|069441| dw Sprite_DF_SmallMagicDecanter             ; 0xDF - SMALL MAGIC DECANTER
|069443| dw Sprite_E0_LargeMagicDecanter             ; 0xE0 - LARGE MAGIC DECANTER
|069445| dw Sprite_E1_ArrowRefill5                   ; 0xE1 - ARROW REFILL 5
|069447| dw Sprite_E2_ArrowRefill10                  ; 0xE2 - ARROW REFILL 10
|069449| dw Sprite_E3_Fairy                          ; 0xE3 - FAIRY
|06944B| dw Sprite_E4_SmallKey                       ; 0xE4 - SMALL KEY
|06944D| dw Sprite_E5_BigKey                         ; 0xE5 - BIG KEY
|06944F| dw Sprite_E6_StolenShield                   ; 0xE6 - STOLEN SHIELD
|069451| dw Sprite_E7_Mushroom_bounce                ; 0xE7 - MUSHROOM
|069453| dw Sprite_E8_FakeMasterSword_bounce         ; 0xE8 - FAKE MASTER SWORD
|069455| dw Sprite_E9_MagicShopAssistant_bounce      ; 0xE9 - MAGIC SHOP ASSISTANT
|069457| dw Sprite_EA_HeartContainer_bounce          ; 0xEA - HEART CONTAINER
|069459| dw Sprite_EB_HeartPiece_bounce              ; 0xEB - HEART PIECE
|06945B| dw Sprite_EC_ThrownItem                     ; 0xEC - THROWN ITEM
|06945D| dw SomariaPlatformAndPipe_bounce            ; 0xED - SOMARIA PLATFORM
|06945F| dw Sprite_EE_CastleMantle_bounce            ; 0xEE - CASTLE MANTLE
|069461| dw SomariaPlatformAndPipe_bounce            ; 0xEF - UNUSED SOMARIA PLATFORM
|069463| dw SomariaPlatformAndPipe_bounce            ; 0xF0 - UNUSED SOMARIA PLATFORM
|069465| dw SomariaPlatformAndPipe_bounce            ; 0xF1 - UNUSED SOMARIA PLATFORM
|069467| dw Sprite_F2_MedallionTablet_bounce         ; 0xF2 - MEDALLION TABLET

;===================================================================================================

Sprite_09_Moldorm_bounce:
|069469| JSL Sprite_09_Moldorm

|06946D| RTS

;===================================================================================================

Sprite_00_Raven_bounce:
|06946E| JSL Sprite_00_Raven

|069472| RTS

;===================================================================================================

Sprite_01_Vulture_bounce:
|069473| JSL Sprite_01_Vulture

|069477| RTS

;===================================================================================================

pool Sprite_27_Deadrock

.anim_step
|069478| db $00, $01, $00, $01
|06947C| db $02, $02, $03, $03
|069480| db $04

.flip
|069481| db $40, $40, $00, $00
|069485| db $00, $40, $00, $40
|069489| db $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_27_Deadrock:
|06948A| LDA.w $0E10,X
|06948D| BEQ .not_stunned

|06948F| AND.b #$04
|069491| BNE .normal

.stunned
|069493| LDY.b #$08
|069495| BRA .continue

.not_stunned
|069497| LDA.w $0D80,X
|06949A| CMP.b #$02
|06949C| BEQ .stunned

.normal
|06949E| LDY.w $0D90,X

;---------------------------------------------------------------------------------------------------

.continue
|0694A1| LDA.w .anim_step,Y
|0694A4| STA.w $0DC0,X

|0694A7| LDA.w $0F50,X
|0694AA| AND.b #$BF
|0694AC| ORA.w .flip,Y
|0694AF| STA.w $0F50,X

|0694B2| JSR SpriteDraw_SingleLarge
|0694B5| JSR CheckIfActive_bank06

|0694B8| LDA.w $0EA0,X
|0694BB| BNE .no_sfx_or_damage

|0694BD| JSR CheckDamageFromLink
|0694C0| BCC .no_sfx_or_damage

|0694C2| LDA.w $012E
|0694C5| BNE .no_sfx_or_damage

|0694C7| LDA.b #$0B ; SFX2.0B
|0694C9| JSL QueueSpriteSFX2WithPan

.no_sfx_or_damage
|0694CD| JSR CheckDamageToLink_same_layer
|0694D0| BCC .no_contact

|0694D2| JSL AbortMovement
|0694D6| JSL RepelDash_long

.no_contact
|0694DA| LDA.w $0EA0,X
|0694DD| CMP.b #$0E
|0694DF| BNE .dont_get_stunned

|0694E1| LDA.b #$02
|0694E3| STA.w $0D80,X

|0694E6| LDA.b #$FF
|0694E8| STA.w $0E00,X

|0694EB| LDA.b #$40
|0694ED| STA.w $0E10,X

;---------------------------------------------------------------------------------------------------

.dont_get_stunned
|0694F0| JSR HandleSpriteRecoil_bank06

|0694F3| LDA.w $0D80,X
|0694F6| JSL JumpTableLocal
|0694FA| dw Deadrock_Halted
|0694FC| dw Deadrock_Walk
|0694FE| dw Deadrock_Stunned

;===================================================================================================

DeadRockSpeed_X:
|069500| db  32, -32 ; bleeds into next

DeadRockSpeed_Y:
|069502| db   0,   0,  32, -32

;===================================================================================================

Deadrock_Halted:
|069506| LDA.w $0DF0,X
|069509| BNE EXIT_069558

|06950B| ASL.w $0E40,X
|06950E| LSR.w $0E40,X

|069511| LDA.w $0CAA,X
|069514| AND.b #$FB
|069516| STA.w $0CAA,X

|069519| LDA.w $0E60,X
|06951C| AND.b #$BF
|06951E| STA.w $0E60,X

|069521| INC.w $0D80,X

|069524| JSL GetRandomNumber
|069528| AND.b #$1F
|06952A| ADC.b #$20
|06952C| STA.w $0DF0,X

|06952F| INC.w $0DA0,X

|069532| LDA.w $0DA0,X
|069535| CMP.b #$04
|069537| BNE .use_random_direction

|069539| STZ.w $0DA0,X

|06953C| JSR GetDirectionTowardsLink
|06953F| TYA

|069540| BRA DeadRock_SetSpeed

.use_random_direction
|069542| JSL GetRandomNumber
|069546| AND.b #$03

;===================================================================================================

DeadRock_SetSpeed:
|069548| STA.w $0DE0,X

|06954B| TAY

|06954C| LDA.w DeadRockSpeed_X,Y
|06954F| STA.w $0D50,X

|069552| LDA.w DeadRockSpeed_Y,Y
|069555| STA.w $0D40,X

;---------------------------------------------------------------------------------------------------

#EXIT_069558:
|069558| RTS

;===================================================================================================

Deadrock_Walk:
|069559| LDA.w $0DF0,X
|06955C| BNE .delay

|06955E| STZ.w $0D80,X

|069561| LDA.b #$20
|069563| STA.w $0DF0,X

|069566| RTS

.delay
|069567| JSR MoveSpriteXY_bank06
|06956A| JSR CheckSpriteTileCollision

|06956D| LDA.w $0E70,X
|069570| BEQ .no_collision

|069572| LDA.w $0DE0,X
|069575| EOR.b #$01

|069577| BRA DeadRock_SetSpeed

.no_collision
|069579| INC.w $0E80,X

|06957C| LDA.w $0E80,X
|06957F| LSR A
|069580| LSR A
|069581| AND.b #$01
|069583| STA.b $00

|069585| LDA.w $0DE0,X
|069588| ASL A
|069589| ORA.b $00
|06958B| STA.w $0D90,X

|06958E| RTS

;===================================================================================================

Deadrock_Stunned:
|06958F| LDA.w $0E40,X
|069592| ORA.b #$80
|069594| STA.w $0E40,X

|069597| LDA.w $0CAA,X
|06959A| ORA.b #$04
|06959C| STA.w $0CAA,X

|06959F| LDA.w $0E60,X
|0695A2| ORA.b #$40
|0695A4| STA.w $0E60,X

|0695A7| LDA.b $1A
|0695A9| AND.b #$01
|0695AB| BNE .resist_timer

|0695AD| LDA.w $0E00,X
|0695B0| BNE .delay

|0695B2| STZ.w $0D80,X

|0695B5| LDA.b #$10
|0695B7| STA.w $0DF0,X

|0695BA| RTS

.delay
|0695BB| CMP.b #$20
|0695BD| BNE .exit

|0695BF| LDA.b #$40
|0695C1| STA.w $0E10,X

.exit
|0695C4| RTS

.resist_timer
|0695C5| INC.w $0E00,X

|0695C8| RTS

;===================================================================================================

pool Sprite_20_Sluggula

.anim_step
|0695C9| db $00, $01, $00, $01
|0695CD| db $02, $03, $04, $05

.flip
|0695D1| db $40, $40, $00, $00
|0695D5| db $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_20_Sluggula:
|0695D9| LDA.w $0E80,X
|0695DC| AND.b #$08
|0695DE| LSR A
|0695DF| LSR A
|0695E0| LSR A
|0695E1| STA.b $00

|0695E3| LDA.w $0DE0,X
|0695E6| ASL A
|0695E7| ORA.b $00
|0695E9| TAY

|0695EA| LDA.w .anim_step,Y
|0695ED| STA.w $0DC0,X

|0695F0| LDA.w $0F50,X
|0695F3| AND.b #$BF
|0695F5| ORA.w .flip,Y
|0695F8| STA.w $0F50,X

|0695FB| JSR SpriteDraw_SingleLarge
|0695FE| JSR CheckIfActive_bank06
|069601| JSR HandleSpriteRecoil_bank06
|069604| JSR CheckDamageToAndFromLink_bank06

|069607| INC.w $0E80,X

|06960A| LDA.w $0D80,X
|06960D| JSL JumpTableLocal
|069611| dw Sluggula_Normal
|069613| dw Sluggula_BreakFromBombing

;===================================================================================================

SluggulaMoblinSpeed_X:
|069615| db  16, -16 ; bleeds into next

SluggulaMoblinSpeed_Y:
|069617| db   0,   0,  16, -16

;===================================================================================================

Sluggula_Normal:
|06961B| LDA.w $0DF0,X
|06961E| BNE .delay

|069620| INC.w $0D80,X

|069623| JSL GetRandomNumber
|069627| AND.b #$1F
|069629| ADC.b #$20
|06962B| STA.w $0DF0,X

|06962E| AND.b #$03
|069630| STA.w $0DE0,X

;===================================================================================================

#Sluggula_SetSpeed:
|069633| TAY

|069634| LDA.w SluggulaMoblinSpeed_X,Y
|069637| STA.w $0D50,X

|06963A| LDA.w SluggulaMoblinSpeed_Y,Y
|06963D| STA.w $0D40,X

|069640| RTS

;===================================================================================================

.delay
|069641| CMP.b #$10
|069643| BNE EXIT_069672

|069645| JSL GetRandomNumber
|069649| LSR A
|06964A| BCS EXIT_069672

|06964C| JMP.w Sluggula_DropBomb

;===================================================================================================

Sluggula_BreakFromBombing:
|06964F| LDA.w $0DF0,X
|069652| BNE .delay

|069654| STZ.w $0D80,X

|069657| LDA.b #$20
|069659| STA.w $0DF0,X

.delay
|06965C| JSR MoveSpriteXY_bank06
|06965F| JSR CheckSpriteTileCollision

|069662| LDA.w $0E70,X
|069665| BEQ EXIT_069672

|069667| LDA.w $0DE0,X
|06966A| EOR.b #$01
|06966C| STA.w $0DE0,X

|06966F| JMP.w Sluggula_SetSpeed

;---------------------------------------------------------------------------------------------------

#EXIT_069672:
|069672| RTS

;===================================================================================================

Sluggula_DropBomb:
|069673| LDA.b #$4A ; SPRITE 4A
|069675| LDY.b #$0B
|069677| JSL SpawnSpriteDynamically.slot_limited
|06967B| BMI .no_space

|06967D| JSL SetSpawnedSpriteCoordinates
|069681| JSL TransmuteSpriteToBomb

.no_space
|069685| RTS

;===================================================================================================

pool Sprite_19_Poe

.hflip
|069686| db $40, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_19_Poe:
|069688| LDA.w $0D50,X
|06968B| ASL A
|06968C| ROL A
|06968D| AND.b #$01
|06968F| STA.w $0DE0,X

|069692| TAY

|069693| LDA.w $0F50,X
|069696| AND.b #$BF
|069698| ORA.w .hflip,Y
|06969B| STA.w $0F50,X

|06969E| LDA.w $0E90,X
|0696A1| BNE .keep_priority

|0696A3| LDA.w $0B89,X
|0696A6| ORA.b #$30
|0696A8| STA.w $0B89,X

;---------------------------------------------------------------------------------------------------

.keep_priority
|0696AB| JSR SpriteDraw_Poe

|0696AE| REP #$20

|0696B0| LDA.b $90
|0696B2| CLC
|0696B3| ADC.w #$0004
|0696B6| STA.b $90

|0696B8| INC.b $92

|0696BA| SEP #$20

|0696BC| DEC.w $0E40,X

|0696BF| JSR SpriteDraw_SingleLarge

|0696C2| INC.w $0E40,X

;---------------------------------------------------------------------------------------------------

|0696C5| JSR CheckIfActive_bank06
|0696C8| JSR HandleSpriteRecoil_bank06

|0696CB| LDA.w $0E90,X
|0696CE| BEQ Poe_Main

|0696D0| INC.w $0F70,X

|0696D3| LDA.w $0F70,X
|0696D6| CMP.b #$0C
|0696D8| BNE .exit

|0696DA| STZ.w $0E90,X

.exit
|0696DD| RTS

;===================================================================================================

Poe_Main:
|0696DE| JSR CheckDamageToAndFromLink_bank06

|0696E1| INC.w $0E80,X

|0696E4| JSR MoveSpriteXY_bank06

|0696E7| LDA.b $1A
|0696E9| LSR A
|0696EA| BCS .continue

|0696EC| LDA.w $0ED0,X
|0696EF| AND.b #$01
|0696F1| TAY

|0696F2| LDA.w $0F80,X
|0696F5| CLC
|0696F6| ADC.w Poe_SpeedZ,Y
|0696F9| STA.w $0F80,X

|0696FC| CMP.w Poe_MaxZ,Y
|0696FF| BNE .continue

|069701| INC.w $0ED0,X

.continue
|069704| JSR MoveSpriteZ_bank06

|069707| STZ.w $0D40,X

|06970A| LDA.w $0D80,X
|06970D| JSL JumpTableLocal
|069711| dw Poe_Pondering
|069713| dw Poe_SpookAround

;===================================================================================================

Poe_SpeedZ:
|069715| db   1,  -1
|069717| db   2,  -2

;===================================================================================================

Poe_MaxSpeedX:
|069719| db  16, -16
|06971B| db  28, -28

;===================================================================================================

Poe_MaxZ:
|06971D| db   8,  -8

;===================================================================================================

Poe_Pondering:
|06971F| LDA.w $0DF0,X
|069722| BNE .exit

|069724| INC.w $0D80,X

|069727| JSL GetRandomNumber
|06972B| AND.b #$0C
|06972D| BNE .use_random_direction

|06972F| JSR GetYDisplacementFromLink

|069732| TYA
|069733| BRA .continue

.use_random_direction
|069735| JSL GetRandomNumber
|069739| AND.b #$01

.continue
|06973B| STA.w $0EB0,X

.exit
|06973E| RTS

;===================================================================================================

Poe_MaxSpeedY:
|06973F| db   8,  -8

;===================================================================================================

Poe_SpookAround:
|069741| LDA.w $001A
|069744| LSR A
|069745| BCS .continue

|069747| LDA.w $0EC0,X
|06974A| AND.b #$01

|06974C| CLC
|06974D| ADC.w $0FFF
|069750| ADC.w $0FFF
|069753| TAY

|069754| LDA.w $0D50,X
|069757| CLC
|069758| ADC.w Poe_SpeedZ,Y
|06975B| STA.w $0D50,X

|06975E| CMP.w Poe_MaxSpeedX,Y
|069761| BNE .continue

|069763| INC.w $0EC0,X

|069766| STZ.w $0D80,X

|069769| JSL GetRandomNumber
|06976D| AND.b #$1F
|06976F| ADC.b #$10
|069771| STA.w $0DF0,X

.continue
|069774| LDY.w $0EB0,X

|069777| LDA.w Poe_MaxSpeedY,Y
|06977A| STA.w $0D40,X

|06977D| RTS

;===================================================================================================

pool SpriteDraw_Poe

.offset_x
|06977E| db   9,   0,  -1,  -1

.char
|069782| db $7C, $80, $B7, $80

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Poe:
|069786| JSR GetScreenCoordinates

|069789| LDA.w $0E80,X

|06978C| LSR A
|06978D| LSR A
|06978E| LSR A

|06978F| AND.b #$03
|069791| STA.b $06

|069793| LDA.w $0DE0,X
|069796| ASL A

|069797| PHX

|069798| TAX

|069799| REP #$20

|06979B| LDA.b $00
|06979D| CLC
|06979E| ADC.w .offset_x,X
|0697A1| STA.b ($90),Y

|0697A3| CLC
|0697A4| AND.w #$0100
|0697A7| STA.b $0E

|0697A9| LDA.b $02
|0697AB| CLC
|0697AC| ADC.w #$0009

|0697AF| INY
|0697B0| STA.b ($90),Y

|0697B2| CLC
|0697B3| ADC.w #$0010
|0697B6| CMP.w #$0100

|0697B9| SEP #$20
|0697BB| BCC .on_screen

|0697BD| LDA.b #$F0
|0697BF| STA.b ($90),Y

.on_screen
|0697C1| LDX.b $06

|0697C3| LDA.w .char,X
|0697C6| INY
|0697C7| STA.b ($90),Y

|0697C9| LDA.b $05
|0697CB| AND.b #$F0
|0697CD| ORA.b #$02

|0697CF| INY
|0697D0| STA.b ($90),Y

|0697D2| LDA.b $0F
|0697D4| STA.b ($92)

|0697D6| PLX

|0697D7| RTS

;===================================================================================================

pool Sprite_18_MiniMoldorm

.speed_x
|0697D8| db  24,  22,  17,   9,   0,  -9, -17, -22
|0697E0| db -24, -22, -17,  -9,   0,   9,  17,  22

.speed_y
|0697E8| db   0,   9,  17,  22,  24,  22,  17,   9
|0697F0| db   0,  -9, -17, -22, -24, -22, -17,  -9

.direction
|0697F8| db $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
|069800| db $00, $01, $02, $03, $04, $05, $06, $07

endpool

;---------------------------------------------------------------------------------------------------

Sprite_18_MiniMoldorm:
|069808| JSL SpriteDraw_MiniMoldorm
|06980C| JSR CheckIfActive_bank06

|06980F| LDA.w $0EA0,X
|069812| BEQ .not_recoiling

|069814| JSR SpritePrep_MiniMoldorm_bounce

.not_recoiling
|069817| JSR HandleSpriteRecoil_bank06
|06981A| JSR CheckDamageToAndFromLink_bank06

|06981D| INC.w $0E80,X

|069820| LDY.w $0DE0,X

|069823| LDA.w .speed_x,Y
|069826| STA.w $0D50,X

|069829| LDA.w .speed_y,Y
|06982C| STA.w $0D40,X

|06982F| JSR MoveSpriteXY_bank06
|069832| JSR CheckSpriteTileCollision

|069835| LDA.w $0E70,X
|069838| BEQ .no_tile_collision

|06983A| JSL GetRandomNumber
|06983E| LSR A
|06983F| BCC .dont_flip

|069841| LDA.w $0EB0,X
|069844| EOR.b #$FF
|069846| INC A
|069847| STA.w $0EB0,X

.dont_flip
|06984A| LDY.w $0DE0,X

|06984D| LDA.w .direction,Y
|069850| STA.w $0DE0,X

.no_tile_collision
|069853| LDA.w $0D80,X
|069856| JSL JumpTableLocal
|06985A| dw MiniMoldorm_Readjust
|06985C| dw MiniMoldorm_Meander
|06985E| dw MiniMoldorm_TargetLink

;===================================================================================================

MiniMoldorm_Readjust:
|069860| LDA.w $0DF0,X
|069863| BNE .exit

|069865| INC A

|069866| INC.w $0ED0,X

|069869| LDY.w $0ED0,X
|06986C| CPY.b #$06
|06986E| BNE .dont_target_link

|069870| STZ.w $0ED0,X

|069873| INC A

.dont_target_link
|069874| STA.w $0D80,X

|069877| JSL GetRandomNumber
|06987B| AND.b #$02
|06987D| DEC A
|06987E| STA.w $0EB0,X

|069881| JSL GetRandomNumber
|069885| AND.b #$1F
|069887| ADC.b #$20
|069889| STA.w $0DF0,X

.exit
|06988C| RTS

;===================================================================================================

MiniMoldorm_Meander:
|06988D| LDA.w $0DF0,X
|069890| BNE .delay

|069892| JSL GetRandomNumber
|069896| AND.b #$0F
|069898| ADC.b #$08
|06989A| STA.w $0DF0,X

|06989D| STZ.w $0D80,X

|0698A0| RTS

;---------------------------------------------------------------------------------------------------

.delay
|0698A1| AND.b #$03
|0698A3| BNE .exit

|0698A5| LDA.w $0DE0,X
|0698A8| CLC
|0698A9| ADC.w $0EB0,X
|0698AC| AND.b #$0F
|0698AE| STA.w $0DE0,X

.exit
|0698B1| RTS

;===================================================================================================

MiniMoldorm_TargetLink:
|0698B2| TXA
|0698B3| EOR.b $1A
|0698B5| AND.b #$03
|0698B7| BNE .exit

|0698B9| LDA.b #$1F
|0698BB| JSR ApplySpeedTowardsLink
|0698BE| JSL ConvertVelocityToAngle

|0698C2| CMP.w $0DE0,X
|0698C5| BNE .not_at_target

|0698C7| STZ.w $0D80,X

|0698CA| LDA.b #$30
|0698CC| STA.w $0DF0,X

|0698CF| RTS

;---------------------------------------------------------------------------------------------------

.not_at_target
|0698D0| PHP

|0698D1| LDA.w $0DE0,X

|0698D4| PLP
|0698D5| BMI .decrease_angle

|0698D7| INC A
|0698D8| INC A

.decrease_angle
|0698D9| DEC A
|0698DA| AND.b #$0F
|0698DC| STA.w $0DE0,X

.exit
|0698DF| RTS

;===================================================================================================

Moblin_Directions:
|0698E0| db $06, $04, $00, $02

;===================================================================================================

Sprite_12_Moblin:
|0698E4| JSR SpriteDraw_Moblin

|0698E7| JSR CheckIfActive_bank06
|0698EA| JSR HandleSpriteRecoil_bank06
|0698ED| JSR CheckDamageToAndFromLink_bank06

|0698F0| JSR MoveSpriteXY_bank06
|0698F3| JSR CheckSpriteTileCollision

|0698F6| LDA.w $0D80,X
|0698F9| JSL JumpTableLocal
|0698FD| dw Moblin_Halted
|0698FF| dw Moblin_Walk
|069901| dw Moblin_ThrowSpear

;===================================================================================================

pool Moblin_Halted

.timer
|069903| db  16,  32,  48,  64

endpool

;---------------------------------------------------------------------------------------------------

Moblin_Halted:
|069907| LDA.w $0DF0,X
|06990A| BNE .exit

|06990C| JSL GetRandomNumber
|069910| AND.b #$03
|069912| TAY

|069913| LDA.w .timer,Y
|069916| STA.w $0DF0,X

|069919| INC.w $0D80,X

|06991C| LDA.w $0EB0,X
|06991F| STA.w $0DE0,X

|069922| TAY

|069923| LDA.w SluggulaMoblinSpeed_X,Y
|069926| STA.w $0D50,X

|069929| LDA.w SluggulaMoblinSpeed_Y,Y
|06992C| STA.w $0D40,X

.exit
|06992F| RTS

;===================================================================================================

pool Moblin_Walk

.head_direction
|069930| db $02, $03 ; right
|069932| db $02, $03 ; left
|069934| db $00, $01 ; down
|069936| db $00, $01 ; up

endpool

;---------------------------------------------------------------------------------------------------

Moblin_Walk:
|069938| LDA.w $0E80,X
|06993B| AND.b #$01

|06993D| LDY.w $0DE0,X

|069940| CLC
|069941| ADC.w Moblin_Directions,Y
|069944| STA.w $0DC0,X

|069947| LDA.b #$0C
|069949| LDY.w $0E70,X
|06994C| BNE .no_tile_collision

|06994E| LDA.w $0DF0,X
|069951| BNE .delay

|069953| JSR GetDirectionTowardsLink

|069956| TYA
|069957| CMP.w $0DE0,X
|06995A| BNE .dont_stop

|06995C| INC.w $0D80,X

|06995F| LDA.b #$20
|069961| STA.w $0DF0,X

|069964| BRA .stop

.dont_stop
|069966| LDA.b #$10

;---------------------------------------------------------------------------------------------------

.no_tile_collision
|069968| STA.w $0DF0,X

|06996B| JSL GetRandomNumber
|06996F| AND.b #$01
|069971| STA.b $00

|069973| LDA.w $0DE0,X
|069976| ASL A
|069977| ORA.b $00
|069979| TAY

|06997A| LDA.w .head_direction,Y
|06997D| STA.w $0EB0,X

|069980| STZ.w $0D80,X

|069983| INC.w $0DB0,X

|069986| LDA.w $0DB0,X
|069989| CMP.b #$04
|06998B| BNE .stop

|06998D| STZ.w $0DB0,X

|069990| JSR GetDirectionTowardsLink

|069993| TYA
|069994| STA.w $0EB0,X

;---------------------------------------------------------------------------------------------------

.stop
|069997| JSR ZeroVelocityXYZ_bank06

|06999A| RTS

;---------------------------------------------------------------------------------------------------

.delay
|06999B| DEC.w $0E90,X
|06999E| BPL .exit

|0699A0| LDA.b #$0B
|0699A2| STA.w $0E90,X

|0699A5| INC.w $0E80,X

.exit
|0699A8| RTS

;===================================================================================================

pool Moblin_ThrowSpear

.anim_step
|0699A9| db $0B, $0A, $08, $09
|0699AD| db $07, $05, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

Moblin_ThrowSpear:
|0699B1| LDY.w $0DE0,X

|0699B4| LDA.w $0DF0,X
|0699B7| BNE .delay

|0699B9| STZ.w $0D80,X

.delay
|0699BC| CMP.b #$10
|0699BE| BCS .animate

|0699C0| CMP.b #$0F
|0699C2| BNE .dont_throw

|0699C4| PHY
|0699C5| JSR Moblin_MaterializeSpear
|0699C8| PLY

|0699C9| LDA.b #$20
|0699CB| STA.w $0E00,X

.dont_throw
|0699CE| INY
|0699CF| INY
|0699D0| INY
|0699D1| INY

.animate
|0699D2| LDA.w .anim_step,Y
|0699D5| STA.w $0DC0,X

|0699D8| RTS

;===================================================================================================

pool Moblin_MaterializeSpear

.offset_x_low
|0699D9| db  11,  -2,  -3,  11

.offset_y_low
|0699DD| db  -3,  -3,   3, -11

.offset_y_high
|0699E1| db  -1,  -1,   0,  -1

.speed_x
|0699E5| db  32, -32 ; bleeds into next

.speed_y
|0699E7| db   0,   0,  32, -32

endpool

;---------------------------------------------------------------------------------------------------

Moblin_MaterializeSpear:
|0699EB| LDA.b #$1B ; SPRITE 1B
|0699ED| JSL SpawnSpriteDynamically
|0699F1| BMI .no_space

|0699F3| LDA.b #$03
|0699F5| STA.w $0D90,Y

|0699F8| PHX

|0699F9| LDA.w $0DE0,X
|0699FC| STA.w $0DE0,Y

|0699FF| TAX

|069A00| LDA.b $00
|069A02| CLC
|069A03| ADC.w .offset_x_low,X
|069A06| STA.w $0D10,Y

|069A09| LDA.b $01
|069A0B| ADC.w Hinox_ThrowBomb.offset_x_high,X
|069A0E| STA.w $0D30,Y

|069A11| LDA.b $02
|069A13| CLC
|069A14| ADC.w .offset_y_low,X
|069A17| STA.w $0D00,Y

|069A1A| LDA.b $03
|069A1C| ADC.w .offset_y_high,X
|069A1F| STA.w $0D20,Y

|069A22| LDA.w .speed_x,X
|069A25| STA.w $0D50,Y

|069A28| LDA.w .speed_y,X
|069A2B| STA.w $0D40,Y

|069A2E| PLX

.no_space
|069A2F| RTS

;===================================================================================================

pool SpriteDraw_Moblin

.oam_groups
|069A30| dw  -2,   3 : db $91, $80, $00, $00
|069A38| dw  -2,  11 : db $90, $80, $00, $00
|069A40| dw   0, -10 : db $86, $00, $00, $02
|069A48| dw   0,   0 : db $8A, $00, $00, $02

|069A50| dw  -2,   7 : db $91, $80, $00, $00
|069A58| dw  -2,  15 : db $90, $80, $00, $00
|069A60| dw   0, -10 : db $86, $00, $00, $02
|069A68| dw   0,   0 : db $8A, $40, $00, $02

|069A70| dw   0,  -9 : db $84, $00, $00, $02
|069A78| dw   0,   0 : db $A0, $00, $00, $02
|069A80| dw  11,  -5 : db $90, $00, $00, $00
|069A88| dw  11,   3 : db $91, $00, $00, $00

|069A90| dw   0,  -9 : db $84, $00, $00, $02
|069A98| dw   0,   0 : db $A0, $40, $00, $02
|069AA0| dw  11,  -8 : db $90, $00, $00, $00
|069AA8| dw  11,   0 : db $91, $00, $00, $00

|069AB0| dw  -4,   8 : db $80, $00, $00, $00
|069AB8| dw   4,   8 : db $81, $00, $00, $00
|069AC0| dw   0,  -9 : db $88, $00, $00, $02
|069AC8| dw   0,   0 : db $A6, $00, $00, $02

|069AD0| dw  -9,   6 : db $80, $00, $00, $00
|069AD8| dw  -1,   6 : db $81, $00, $00, $00
|069AE0| dw   0,  -8 : db $88, $00, $00, $02
|069AE8| dw   0,   0 : db $A4, $00, $00, $02

|069AF0| dw  12,   8 : db $80, $40, $00, $00
|069AF8| dw   4,   8 : db $81, $40, $00, $00
|069B00| dw   0,  -9 : db $88, $40, $00, $02
|069B08| dw   0,   0 : db $A6, $40, $00, $02

|069B10| dw  17,   6 : db $80, $40, $00, $00
|069B18| dw   9,   6 : db $81, $40, $00, $00
|069B20| dw   0,  -8 : db $88, $40, $00, $02
|069B28| dw   0,   0 : db $A4, $40, $00, $02

|069B30| dw  -3,  -5 : db $91, $80, $00, $00
|069B38| dw  -3,   3 : db $90, $80, $00, $00
|069B40| dw   0, -10 : db $86, $00, $00, $02
|069B48| dw   0,   0 : db $A8, $00, $00, $02

|069B50| dw  11, -11 : db $90, $00, $00, $00
|069B58| dw  11,  -3 : db $91, $00, $00, $00
|069B60| dw   0,  -9 : db $84, $00, $00, $02
|069B68| dw   0,   0 : db $82, $40, $00, $02

|069B70| dw  -2,  -3 : db $80, $00, $00, $00
|069B78| dw   6,  -3 : db $81, $00, $00, $00
|069B80| dw   0,  -9 : db $88, $00, $00, $02
|069B88| dw   0,   0 : db $A2, $00, $00, $02

|069B90| dw  10,  -3 : db $80, $40, $00, $00
|069B98| dw   2,  -3 : db $81, $40, $00, $00
|069BA0| dw   0,  -9 : db $88, $40, $00, $02
|069BA8| dw   0,   0 : db $A2, $40, $00, $02

;---------------------------------------------------------------------------------------------------

.buffer_offset
|069BB0| db $08, $08, $00, $00
|069BB4| db $08, $08, $08, $08
|069BB8| db $08, $08, $08, $08

.char
|069BBC| db $88, $88, $86, $84

.hflip
|069BC0| db $40, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Moblin:
|069BC4| LDA.b #$00
|069BC6| XBA
|069BC7| LDA.w $0DC0,X

|069BCA| REP #$20

|069BCC| ASL A
|069BCD| ASL A
|069BCE| ASL A
|069BCF| ASL A
|069BD0| ASL A

|069BD1| ADC.w #.oam_groups
|069BD4| STA.b $08

|069BD6| SEP #$20

|069BD8| LDA.b #$04
|069BDA| JSL TabulatedSpriteDraw

|069BDE| LDA.w $0F00,X
|069BE1| BNE .exit

|069BE3| LDA.w $0E00,X
|069BE6| BEQ .no_spear

|069BE8| LDY.b #$03

.next_object
|069BEA| LDA.b ($92),Y
|069BEC| AND.b #$02
|069BEE| BNE .skip_object

|069BF0| PHY

|069BF1| TYA
|069BF2| ASL A
|069BF3| ASL A
|069BF4| TAY

|069BF5| INY
|069BF6| LDA.b #$F0
|069BF8| STA.b ($90),Y

|069BFA| PLY

.skip_object
|069BFB| DEY
|069BFC| BPL .next_object

.no_spear
|069BFE| LDY.w $0DC0,X

|069C01| LDA.w .buffer_offset,Y
|069C04| TAY

|069C05| PHX

|069C06| LDA.w $0EB0,X
|069C09| TAX

|069C0A| LDA.w .char,X
|069C0D| INY
|069C0E| INY
|069C0F| STA.b ($90),Y

|069C11| INY
|069C12| LDA.b ($90),Y

|069C14| AND.b #$BF
|069C16| ORA.w .hflip,X
|069C19| STA.b ($90),Y

|069C1B| PLX

|069C1C| JMP.w DrawSpriteShadow

.exit
|069C1F| RTS

;===================================================================================================

pool Sprite_0E_Snapdragon

.anim_step
|069C20| db $04, $00, $06, $02

endpool

;---------------------------------------------------------------------------------------------------

Sprite_0E_Snapdragon:
|069C24| LDY.w $0DE0,X

|069C27| LDA.w $0DA0,X
|069C2A| CLC
|069C2B| ADC.w .anim_step,Y
|069C2E| STA.w $0DC0,X

|069C31| JSR SpriteDraw_Snapdragon
|069C34| JSR CheckIfActive_bank06
|069C37| JSR HandleSpriteRecoil_bank06
|069C3A| JSR CheckDamageToAndFromLink_bank06

|069C3D| STZ.w $0DA0,X

|069C40| LDA.w $0D80,X
|069C43| JSL JumpTableLocal
|069C47| dw Snapdragon_Halted
|069C49| dw Snapdragon_MoveAround

;===================================================================================================

SnapdragonSpeedX:
|069C4B| db   8,  -8,   8,  -8
|069C4F| db  16, -16,  16, -16

;===================================================================================================

SnapdragonSpeedY:
|069C53| db   8,   8,  -8,  -8
|069C57| db  16,  16, -16, -16

;===================================================================================================

pool Snapdragon_Halted

.timer
|069C5B| db  32,  48,  64,  80

endpool

;---------------------------------------------------------------------------------------------------

Snapdragon_Halted:
|069C5F| LDA.w $0DF0,X
|069C62| BNE .delay

|069C64| INC.w $0D80,X

|069C67| JSL GetRandomNumber
|069C6B| AND.b #$0C
|069C6D| LSR A
|069C6E| LSR A
|069C6F| TAY

|069C70| LDA.w .timer,Y
|069C73| STA.w $0DF0,X

|069C76| DEC.w $0D90,X
|069C79| BPL .use_random_direction

|069C7B| LDA.b #$03
|069C7D| STA.w $0D90,X

|069C80| LDA.b #$60
|069C82| STA.w $0DF0,X

|069C85| INC.w $0DB0,X

|069C88| JSR GetYDisplacementFromLink

|069C8B| TYA
|069C8C| ASL A
|069C8D| STA.b $00

|069C8F| JSR GetXDisplacementFromLink
|069C92| TYA
|069C93| ORA.b $00
|069C95| BRA .continue

;---------------------------------------------------------------------------------------------------

.use_random_direction
|069C97| JSL GetRandomNumber
|069C9B| AND.b #$03

.continue
|069C9D| STA.w $0DE0,X

|069CA0| RTS

;---------------------------------------------------------------------------------------------------

.delay
|069CA1| AND.b #$18
|069CA3| BEQ .exit

|069CA5| INC.w $0DA0,X

.exit
|069CA8| RTS

;===================================================================================================

Snapdragon_MoveAround:
|069CA9| INC.w $0DA0,X

|069CAC| JSR MoveSpriteXY_bank06
|069CAF| JSR CheckSpriteTileCollision

|069CB2| LDA.w $0E70,X
|069CB5| BEQ .no_tile_collision

|069CB7| LDA.w $0DE0,X
|069CBA| EOR.b #$03
|069CBC| STA.w $0DE0,X

.no_tile_collision
|069CBF| LDY.w $0DE0,X
|069CC2| LDA.w $0DB0,X
|069CC5| BEQ .use_slow_speed

|069CC7| INY
|069CC8| INY
|069CC9| INY
|069CCA| INY

.use_slow_speed
|069CCB| LDA.w SnapdragonSpeedX,Y
|069CCE| STA.w $0D50,X

|069CD1| LDA.w SnapdragonSpeedY,Y
|069CD4| STA.w $0D40,X

|069CD7| JSR MoveSpriteZ_bank06

|069CDA| LDA.w $0F80,X
|069CDD| SEC
|069CDE| SBC.b #$04
|069CE0| STA.w $0F80,X

|069CE3| LDA.w $0F70,X
|069CE6| BPL .exit

|069CE8| STZ.w $0F70,X

|069CEB| LDA.w $0DF0,X
|069CEE| BNE .delay

|069CF0| STZ.w $0D80,X
|069CF3| STZ.w $0DB0,X

|069CF6| LDA.b #$3F
|069CF8| STA.w $0DF0,X

|069CFB| RTS

;---------------------------------------------------------------------------------------------------

.delay
|069CFC| LDA.b #$14
|069CFE| STA.w $0F80,X

.exit
|069D01| RTS

;===================================================================================================

pool SpriteDraw_Snapdragon

.oam_groups
|069D02| dw   4,  -8 : db $8F, $00, $00, $00
|069D0A| dw  12,  -8 : db $9F, $00, $00, $00
|069D12| dw  -4,   0 : db $8C, $00, $00, $02
|069D1A| dw   4,   0 : db $8D, $00, $00, $02

|069D22| dw   4,  -8 : db $2B, $00, $00, $00
|069D2A| dw  12,  -8 : db $3B, $00, $00, $00
|069D32| dw  -4,   0 : db $28, $00, $00, $02
|069D3A| dw   4,   0 : db $29, $00, $00, $02

|069D42| dw  -4,  -8 : db $3C, $00, $00, $00
|069D4A| dw   4,  -8 : db $3D, $00, $00, $00
|069D52| dw  -4,   0 : db $AA, $00, $00, $02
|069D5A| dw   4,   0 : db $AB, $00, $00, $02

|069D62| dw  -4,  -8 : db $3E, $00, $00, $00
|069D6A| dw   4,  -8 : db $3F, $00, $00, $00
|069D72| dw  -4,   0 : db $AD, $00, $00, $02
|069D7A| dw   4,   0 : db $AE, $00, $00, $02

|069D82| dw  -4,  -8 : db $9F, $40, $00, $00
|069D8A| dw   4,  -8 : db $8F, $40, $00, $00
|069D92| dw  -4,   0 : db $8D, $40, $00, $02
|069D9A| dw   4,   0 : db $8C, $40, $00, $02

|069DA2| dw  -4,  -8 : db $3B, $40, $00, $00
|069DAA| dw   4,  -8 : db $2B, $40, $00, $00
|069DB2| dw  -4,   0 : db $29, $40, $00, $02
|069DBA| dw   4,   0 : db $28, $40, $00, $02

|069DC2| dw   4,  -8 : db $3D, $40, $00, $00
|069DCA| dw  12,  -8 : db $3C, $40, $00, $00
|069DD2| dw  -4,   0 : db $AB, $40, $00, $02
|069DDA| dw   4,   0 : db $AA, $40, $00, $02

|069DE2| dw   4,  -8 : db $3F, $40, $00, $00
|069DEA| dw  12,  -8 : db $3E, $40, $00, $00
|069DF2| dw  -4,   0 : db $AE, $40, $00, $02
|069DFA| dw   4,   0 : db $AD, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Snapdragon:
|069E02| LDA.b #$00
|069E04| XBA
|069E05| LDA.w $0DC0,X

|069E08| REP #$20

|069E0A| ASL A
|069E0B| ASL A
|069E0C| ASL A
|069E0D| ASL A
|069E0E| ASL A
|069E0F| ADC.w #.oam_groups
|069E12| STA.b $08

|069E14| SEP #$20

|069E16| LDA.b #$04
|069E18| JSL TabulatedSpriteDraw

|069E1C| JMP.w DrawSpriteShadow

;===================================================================================================

Sprite_22_Ropa:
|069E1F| JSR SpriteDraw_Ropa
|069E22| JSR CheckIfActive_bank06
|069E25| JSR HandleSpriteRecoil_bank06
|069E28| JSR CheckDamageToAndFromLink_bank06

|069E2B| INC.w $0E80,X

|069E2E| LDA.w $0E80,X
|069E31| LSR A
|069E32| LSR A
|069E33| LSR A
|069E34| AND.b #$03
|069E36| STA.w $0DC0,X

|069E39| LDA.w $0D80,X
|069E3C| JSL JumpTableLocal
|069E40| dw Ropa_Halted
|069E42| dw Ropa_Pounce

;===================================================================================================

Ropa_Halted:
|069E44| LDA.w $0DF0,X
|069E47| BNE .exit

|069E49| LDA.b #$10
|069E4B| JSR ApplySpeedTowardsLink

|069E4E| JSL GetRandomNumber
|069E52| AND.b #$0F
|069E54| ADC.b #$14
|069E56| STA.w $0F80,X

|069E59| INC.w $0D80,X

.exit
|069E5C| RTS

;===================================================================================================

Ropa_Pounce:
|069E5D| JSR MoveSpriteXY_bank06
|069E60| JSR CheckSpriteTileCollision

|069E63| LDA.w $0E70,X
|069E66| BEQ .air_borne

|069E68| JSR ZeroVelocityXY_bank06

.air_borne
|069E6B| JSR MoveSpriteZ_bank06

|069E6E| DEC.w $0F80,X
|069E71| DEC.w $0F80,X

|069E74| LDA.w $0F70,X
|069E77| BPL .exit

|069E79| STZ.w $0F70,X

|069E7C| LDA.b #$30
|069E7E| STA.w $0DF0,X

|069E81| STZ.w $0D80,X

.exit
|069E84| RTS

;===================================================================================================

pool SpriteDraw_Ropa

.oam_groups
|069E85| dw   0,  -8 : db $26, $00, $00, $00
|069E8D| dw   8,  -8 : db $27, $00, $00, $00
|069E95| dw   0,   0 : db $08, $00, $00, $02

|069E9D| dw   0,  -8 : db $36, $00, $00, $00
|069EA5| dw   8,  -8 : db $37, $00, $00, $00
|069EAD| dw   0,   0 : db $0A, $00, $00, $02

|069EB5| dw   0,  -8 : db $27, $40, $00, $00
|069EBD| dw   8,  -8 : db $26, $40, $00, $00
|069EC5| dw   0,   0 : db $08, $40, $00, $02

|069ECD| dw   0,  -8 : db $37, $40, $00, $00
|069ED5| dw   8,  -8 : db $36, $40, $00, $00
|069EDD| dw   0,   0 : db $08, $40, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Ropa:
|069EE5| LDA.b #$00
|069EE7| XBA
|069EE8| LDA.w $0DC0,X

|069EEB| REP #$20

|069EED| ASL A
|069EEE| ASL A
|069EEF| ASL A
|069EF0| STA.b $00

|069EF2| ASL A
|069EF3| ADC.b $00
|069EF5| ADC.w #.oam_groups
|069EF8| STA.b $08

|069EFA| SEP #$20

|069EFC| LDA.b #$03
|069EFE| JSL TabulatedSpriteDraw

|069F02| JMP.w DrawSpriteShadow

;===================================================================================================

Sprite_11_Hinox:
|069F05| JSR SpriteDraw_Hinox
|069F08| JSR CheckIfActive_bank06

|069F0B| LDA.w $0EA0,X
|069F0E| BEQ .not_recoiling

|069F10| JSR Hinox_FaceLink

|069F13| LDA.b #$02
|069F15| STA.w $0D80,X

|069F18| LDA.b #$30
|069F1A| STA.w $0DF0,X

.not_recoiling
|069F1D| JSR HandleSpriteRecoil_bank06
|069F20| JSR CheckDamageToAndFromLink_bank06

|069F23| LDA.w $0D80,X
|069F26| JSL JumpTableLocal
|069F2A| dw Hinox_Halted
|069F2C| dw Hinox_Walk
|069F2E| dw Hinox_ThrowBomb

;===================================================================================================

pool Hinox_ThrowBomb

.anim_step
|069F30| db $0B, $0A, $08, $09
|069F34| db $07, $05, $01, $03

.offset_x_low
|069F38| db   8,  -8, -13,  13

;---------------------------------------------------------------------------------------------------

#CuccoSwarmSpeed:
.offset_x_high
|069F3C| db   0,  -1,  -1,   0

.offset_y_low
|069F40| db -11, -11, -16, -16

.speed_x
|069F44| db  24, -24 ; bleeds into next

.speed_y
|069F46| db   0,   0,  24, -24

endpool

;---------------------------------------------------------------------------------------------------

Hinox_ThrowBomb:
|069F4A| LDA.w $0DF0,X
|069F4D| BNE .delay

|069F4F| STZ.w $0D80,X

|069F52| LDA.b #$02
|069F54| STA.w $0DF0,X

|069F57| RTS

;---------------------------------------------------------------------------------------------------

.delay
|069F58| CMP.b #$20
|069F5A| BNE .dont_throw

|069F5C| LDA.b #$4A ; SPRITE 4A
|069F5E| JSL SpawnSpriteDynamically
|069F62| BMI .no_space

|069F64| JSL TransmuteSpriteToBomb

|069F68| LDA.b #$40
|069F6A| STA.w $0E00,Y

|069F6D| PHX

|069F6E| LDA.w $0DE0,X
|069F71| TAX

|069F72| LDA.b $00
|069F74| CLC
|069F75| ADC.w .offset_x_low,X
|069F78| STA.w $0D10,Y

|069F7B| LDA.b $01
|069F7D| ADC.w .offset_x_high,X
|069F80| STA.w $0D30,Y

|069F83| LDA.b $02
|069F85| CLC
|069F86| ADC.w .offset_y_low,X
|069F89| STA.w $0D00,Y

|069F8C| LDA.b $03
|069F8E| ADC.b #$FF
|069F90| STA.w $0D20,Y

|069F93| LDA.w .speed_x,X
|069F96| STA.w $0D50,Y

|069F99| LDA.w .speed_y,X
|069F9C| STA.w $0D40,Y

|069F9F| PLX

|069FA0| LDA.b #$28
|069FA2| STA.w $0F80,Y

.no_space
|069FA5| RTS

;---------------------------------------------------------------------------------------------------

.dont_throw
|069FA6| LDY.w $0DE0,X
|069FA9| BCS .dont_adjust_arm

|069FAB| INY
|069FAC| INY
|069FAD| INY
|069FAE| INY

.dont_adjust_arm
|069FAF| LDA.w .anim_step,Y
|069FB2| STA.w $0DC0,X

|069FB5| RTS

;===================================================================================================

HinoxSpeedX:
|069FB6| db   8,  -8 ; bleeds into next

HinoxSpeedY:
|069FB8| db   0,   0,   8,  -8

;===================================================================================================

Hinox_Halted:
|069FBC| LDA.w $0DF0,X
|069FBF| BNE EXIT_06A024

|069FC1| JSL GetRandomNumber
|069FC5| AND.b #$03
|069FC7| BNE .change_direction

|069FC9| LDA.b #$02
|069FCB| STA.w $0D80,X

|069FCE| LDA.b #$40
|069FD0| STA.w $0DF0,X

|069FD3| RTS

.change_direction
|069FD4| INC.w $0DB0,X

|069FD7| LDA.w $0DB0,X
|069FDA| CMP.b #$04
|069FDC| BNE Hinox_PickRandomDirection

|069FDE| STZ.w $0DB0,X

;===================================================================================================

Hinox_FaceLink:
|069FE1| JSR GetDirectionTowardsLink

|069FE4| TYA
|069FE5| JSR Hinox_SetDirection

|069FE8| ASL.w $0D50,X
|069FEB| ASL.w $0D40,X

|069FEE| RTS

;===================================================================================================

pool Hinox_PickRandomDirection

.direction
|069FEF| db $02, $03, $03, $02
|069FF3| db $00, $01, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

Hinox_PickRandomDirection:
|069FF7| JSL GetRandomNumber
|069FFB| LSR A

|069FFC| LDA.w $0DE0,X
|069FFF| ROL A
|06A000| TAY

|06A001| LDA.w .direction,Y

;===================================================================================================

Hinox_SetDirection:
|06A004| STA.w $0DE0,X

|06A007| JSL GetRandomNumber
|06A00B| AND.b #$3F
|06A00D| ADC.b #$60
|06A00F| STA.w $0DF0,X

|06A012| INC.w $0D80,X

|06A015| LDY.w $0DE0,X

|06A018| LDA.w HinoxSpeedX,Y
|06A01B| STA.w $0D50,X

|06A01E| LDA.w HinoxSpeedY,Y
|06A021| STA.w $0D40,X

;---------------------------------------------------------------------------------------------------

#EXIT_06A024:
|06A024| RTS

;===================================================================================================

pool Hinox_Walk

.anim_step
|06A025| db $06, $04, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

Hinox_Walk:
|06A029| LDA.w $0DF0,X
|06A02C| BNE .delay

.reset_ai
|06A02E| LDA.b #$10
|06A030| STA.w $0DF0,X

|06A033| STZ.w $0D80,X

|06A036| RTS

.delay
|06A037| DEC.w $0D90,X
|06A03A| BPL .delay_tick

|06A03C| LDA.b #$0B
|06A03E| STA.w $0D90,X

|06A041| INC.w $0E80,X

.delay_tick
|06A044| JSR MoveSpriteXY_bank06
|06A047| JSR CheckSpriteTileCollision

|06A04A| LDA.w $0E70,X
|06A04D| BEQ .no_tile_collision
|06A04F| BRA .reset_ai

.no_tile_collision
|06A051| LDA.w $0E80,X
|06A054| AND.b #$01
|06A056| STA.b $00

|06A058| LDY.w $0DE0,X

|06A05B| LDA.w .anim_step,Y
|06A05E| CLC
|06A05F| ADC.b $00
|06A061| STA.w $0DC0,X

|06A064| RTS

;===================================================================================================

pool SpriteDraw_Hinox

.oam_groups

.group00
|06A065| dw   0, -13 : db $00, $06, $00, $02
|06A06D| dw  -8,  -5 : db $24, $06, $00, $02
|06A075| dw   8,  -5 : db $24, $46, $00, $02
|06A07D| dw   0,   1 : db $06, $06, $00, $02

.group01
|06A085| dw   0, -13 : db $00, $06, $00, $02
|06A08D| dw  -8,  -5 : db $24, $06, $00, $02
|06A095| dw   8,  -5 : db $24, $46, $00, $02
|06A09D| dw   0,   1 : db $06, $46, $00, $02

.group02
|06A0A5| dw  -8,  -6 : db $24, $06, $00, $02
|06A0AD| dw   8,  -6 : db $24, $46, $00, $02
|06A0B5| dw   0,   0 : db $06, $06, $00, $02
|06A0BD| dw   0, -13 : db $04, $06, $00, $02

.group03
|06A0C5| dw  -8,  -6 : db $24, $06, $00, $02
|06A0CD| dw   8,  -6 : db $24, $46, $00, $02
|06A0D5| dw   0,   0 : db $06, $46, $00, $02
|06A0DD| dw   0, -13 : db $04, $06, $00, $02

.group04
|06A0E5| dw  -3, -13 : db $02, $06, $00, $02
|06A0ED| dw   0,  -8 : db $0C, $06, $00, $02
|06A0F5| dw   0,   0 : db $1C, $06, $00, $02

.group05
|06A0FD| dw  -3, -12 : db $02, $06, $00, $02
|06A105| dw   0,  -8 : db $0E, $06, $00, $02
|06A10D| dw   0,   0 : db $1E, $06, $00, $02

.group06
|06A115| dw   3, -13 : db $02, $46, $00, $02
|06A11D| dw   0,  -8 : db $0C, $46, $00, $02
|06A125| dw   0,   0 : db $1C, $46, $00, $02

.group07
|06A12D| dw   3, -12 : db $02, $46, $00, $02
|06A135| dw   0,  -8 : db $0E, $46, $00, $02
|06A13D| dw   0,   0 : db $1E, $46, $00, $02

.group08
|06A145| dw -13, -16 : db $6E, $05, $00, $02
|06A14D| dw   0, -13 : db $00, $06, $00, $02
|06A155| dw  -8,  -5 : db $20, $06, $00, $02
|06A15D| dw   8,  -5 : db $24, $46, $00, $02
|06A165| dw   0,   1 : db $06, $06, $00, $02

.group09
|06A16D| dw  -8,  -5 : db $24, $06, $00, $02
|06A175| dw   8,  -5 : db $20, $46, $00, $02
|06A17D| dw   0,   1 : db $06, $06, $00, $02
|06A185| dw   0, -13 : db $04, $06, $00, $02
|06A18D| dw  13, -16 : db $6E, $05, $00, $02

.group0A
|06A195| dw  -8, -11 : db $6E, $05, $00, $02
|06A19D| dw  -3, -13 : db $02, $06, $00, $02
|06A1A5| dw   0,   0 : db $22, $06, $00, $02
|06A1AD| dw   0,  -8 : db $0C, $06, $00, $02

.group0B
|06A1B5| dw   8, -11 : db $6E, $05, $00, $02
|06A1BD| dw   3, -13 : db $02, $46, $00, $02
|06A1C5| dw   0,   0 : db $22, $46, $00, $02
|06A1CD| dw   0,  -8 : db $0C, $46, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_pointers
|06A1D5| dw .group00
|06A1D7| dw .group01
|06A1D9| dw .group02
|06A1DB| dw .group03
|06A1DD| dw .group04
|06A1DF| dw .group05
|06A1E1| dw .group06
|06A1E3| dw .group07
|06A1E5| dw .group08
|06A1E7| dw .group09
|06A1E9| dw .group0A
|06A1EB| dw .group0B

;---------------------------------------------------------------------------------------------------

.oam_group_size
|06A1ED| db 4
|06A1EE| db 4
|06A1EF| db 4
|06A1F0| db 4
|06A1F1| db 3
|06A1F2| db 3
|06A1F3| db 3
|06A1F4| db 3
|06A1F5| db 5
|06A1F6| db 5
|06A1F7| db 4
|06A1F8| db 4

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Hinox:
|06A1F9| LDA.w $0DC0,X
|06A1FC| PHA

|06A1FD| ASL A
|06A1FE| TAY

|06A1FF| REP #$20

|06A201| LDA.w .oam_group_pointers,Y
|06A204| STA.b $08

|06A206| SEP #$20

|06A208| PLY

|06A209| LDA.w .oam_group_size,Y

|06A20C| JSL TabulatedSpriteDraw

|06A210| JMP.w DrawSpriteShadow

;===================================================================================================

PositiveAndNegativeOne:
|06A213| db  1, -1

;===================================================================================================

BariSpeed:
.x
|06A215| db   0,   8,  11,  14
|06A219| db  16,  14,  11,   8
|06A21D| db   0,  -8, -11, -14
|06A221| db -16, -14, -11,  -8

.y
|06A225| db -16, -14, -11,  -8
|06A229| db   0,   8,  11,  14
|06A22D| db  16,  14,  11,   8
|06A231| db   0,  -9, -11, -14

;===================================================================================================

BariSplit:
.offset_x
|06A235| db   0,   8

.speed_x
|06A237| db -32,  32

;===================================================================================================

BariWiggle:
|06A239| db   8,  -8

;===================================================================================================

BariAnimStep:
|06A23B| db $00, $03

;===================================================================================================

Sprite_23_RedBari:
Sprite_24_BlueBari:
|06A23D| LDA.w $0DB0,X
|06A240| BEQ Bari_JustDraw

|06A242| BPL RedBiri

;===================================================================================================

Bari_Main:
|06A244| LDA.w $0EB0,X
|06A247| CMP.b #$10
|06A249| BNE .delay_tile_collision

|06A24B| LDA.b #$FF
|06A24D| STA.w $0D50,X
|06A250| STA.w $0E30,X

|06A253| JSR CheckSpriteTileCollision

|06A256| STZ.w $0E30,X

|06A259| LDA.w $0FA5 ; TILETYPE 00
|06A25C| BNE .collision

|06A25E| STZ.w $0DB0,X
|06A261| STZ.w $0BA0,X

|06A264| JMP.w Bari_RandomlySetTimer2

.collision
|06A267| STA.w $0BA0,X

|06A26A| RTS

.delay_tile_collision
|06A26B| INC.w $0EB0,X

|06A26E| RTS

;===================================================================================================

RedBiri:
|06A26F| JSR SpriteDraw_SingleSmall

|06A272| BRA BariAndBiri_Main

;===================================================================================================

Bari_JustDraw:
|06A274| LDA.w $0DC0,X
|06A277| CMP.b #$02
|06A279| BCC .not_electrified

|06A27B| JSR SpriteDraw_SingleLarge

|06A27E| BRA BariAndBiri_Main

.not_electrified
|06A280| JSR SpriteDraw_Bari

;===================================================================================================

BariAndBiri_Main:
|06A283| JSR CheckIfActive_bank06
|06A286| JSR HandleSpriteRecoil_bank06

|06A289| LDA.w $0E10,X
|06A28C| BNE Biri_Recoiling

|06A28E| LDA.w $0D80,X
|06A291| CMP.b #$02
|06A293| BNE Bari_NotSplitting

|06A295| STA.w $0BA0,X

|06A298| LDA.b $1A
|06A29A| LSR A
|06A29B| AND.b #$01
|06A29D| TAY

|06A29E| LDA.w BariWiggle,Y
|06A2A1| STA.w $0D50,X

|06A2A4| JSR MoveSpriteX_bank06

|06A2A7| LDA.w $0DF0,X
|06A2AA| BNE .exit

|06A2AC| JSR RedBari_Split

|06A2AF| STZ.w $0DD0,X

.exit
|06A2B2| RTS

;===================================================================================================

Bari_NotSplitting:
|06A2B3| JSR CheckDamageToAndFromLink_bank06

|06A2B6| TXA
|06A2B7| EOR.b $1A
|06A2B9| AND.b #$0F
|06A2BB| BNE .delay_rotation_tick

|06A2BD| LDA.w $0DA0,X
|06A2C0| AND.b #$01
|06A2C2| TAY

|06A2C3| LDA.w $0D90,X
|06A2C6| CLC
|06A2C7| ADC.w PositiveAndNegativeOne,Y
|06A2CA| STA.w $0D90,X

|06A2CD| JSL GetRandomNumber

|06A2D1| AND.b #$03
|06A2D3| BNE .delay_rotation_tick

|06A2D5| INC.w $0DA0,X

.delay_rotation_tick
|06A2D8| LDA.w $0D90,X
|06A2DB| AND.b #$0F
|06A2DD| TAY

|06A2DE| LDA.w BariSpeed.x,Y
|06A2E1| STA.w $0D50,X

|06A2E4| LDA.w BariSpeed.y,Y
|06A2E7| STA.w $0D40,X

|06A2EA| TXA
|06A2EB| EOR.b $1A
|06A2ED| AND.b #$03
|06A2EF| ORA.w $0DF0,X
|06A2F2| BNE Bari_Animate

;===================================================================================================

Biri_Recoiling:
|06A2F4| LDA.w $0E70,X
|06A2F7| BNE .no_tile_collision

|06A2F9| JSR MoveSpriteXY_bank06

.no_tile_collision
|06A2FC| JSR CheckSpriteTileCollision

;===================================================================================================

Bari_Animate:
|06A2FF| LDY.w $0DB0,X

|06A302| LDA.b $1A
|06A304| LSR A
|06A305| LSR A
|06A306| LSR A
|06A307| AND.b #$01
|06A309| CLC
|06A30A| ADC.w BariAnimStep,Y
|06A30D| STA.w $0DC0,X

|06A310| LDA.w $0D80,X
|06A313| BEQ .not_electrified

|06A315| LDA.w $0DF0,X
|06A318| BNE .delay

|06A31A| STZ.w $0D80,X

|06A31D| BRA Bari_RandomlySetTimer2

.delay
|06A31F| LDA.b $1A
|06A321| LSR A
|06A322| AND.b #$02

|06A324| CLC
|06A325| ADC.w BariAnimStep,Y
|06A328| STA.w $0DC0,X

|06A32B| RTS

;---------------------------------------------------------------------------------------------------

.not_electrified
|06A32C| LDA.w $0E00,X
|06A32F| BNE EXIT_06A34D

|06A331| JSL GetRandomNumber
|06A335| AND.b #$01
|06A337| BNE Bari_RandomlySetTimer2

|06A339| LDA.b #$80
|06A33B| STA.w $0DF0,X

|06A33E| INC.w $0D80,X

|06A341| RTS

;===================================================================================================

Bari_RandomlySetTimer2:
|06A342| JSL GetRandomNumber
|06A346| AND.b #$3F
|06A348| ADC.b #$80
|06A34A| STA.w $0E00,X

;---------------------------------------------------------------------------------------------------

#EXIT_06A34D:
|06A34D| RTS

;===================================================================================================

RedBari_Split:
|06A34E| LDA.b #$01
|06A350| STA.w $0FB5

.next_biri
|06A353| LDA.b #$23 ; SPRITE 23
|06A355| JSL SpawnSpriteDynamically
|06A359| BMI .no_space

|06A35B| JSL SetSpawnedSpriteCoordinates

|06A35F| LDA.b #$33
|06A361| STA.w $0E60,Y

|06A364| LDA.b #$03
|06A366| STA.w $0F50,Y

|06A369| LDA.b #$01
|06A36B| STA.w $0F60,Y
|06A36E| STA.w $0DB0,Y

|06A371| PHX

|06A372| LDX.w $0FB5

|06A375| LDA.b $00
|06A377| CLC
|06A378| ADC.w BariSplit.offset_x,X
|06A37B| STA.w $0D10,Y

|06A37E| LDA.b $01
|06A380| ADC.b #$00
|06A382| STA.w $0D30,Y

|06A385| LDA.w BariSplit.speed_x,X
|06A388| STA.w $0D50,Y

|06A38B| LDA.b #$08
|06A38D| STA.w $0E10,Y

|06A390| LDA.b #$40
|06A392| STA.w $0E00,Y

|06A395| PLX

.no_space
|06A396| DEC.w $0FB5
|06A399| BPL .next_biri

|06A39B| RTS

;===================================================================================================

pool SpriteDraw_Bari

.oam_groups
|06A39C| dw   0,   0 : db $22, $00, $00, $00
|06A3A4| dw   8,   0 : db $22, $40, $00, $00
|06A3AC| dw   0,   8 : db $32, $00, $00, $00
|06A3B4| dw   8,   8 : db $32, $40, $00, $00

|06A3BC| dw   0,   0 : db $23, $00, $00, $00
|06A3C4| dw   8,   0 : db $23, $40, $00, $00
|06A3CC| dw   0,   8 : db $33, $00, $00, $00
|06A3D4| dw   8,   8 : db $33, $40, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Bari:
|06A3DC| LDA.b #$00
|06A3DE| XBA
|06A3DF| LDA.w $0DC0,X

|06A3E2| REP #$20

|06A3E4| ASL A
|06A3E5| ASL A
|06A3E6| ASL A
|06A3E7| ASL A
|06A3E8| ASL A

|06A3E9| ADC.w #.oam_groups
|06A3EC| STA.b $08

|06A3EE| SEP #$20

|06A3F0| LDA.b #$04
|06A3F2| JSL TabulatedSpriteDraw

|06A3F6| JMP.w DrawSpriteShadow

;===================================================================================================

pool Sprite_13_MiniHelmasaur

.anim_step
|06A3F9| db $03, $04, $03, $04
|06A3FD| db $02, $02, $05, $05

.flip
|06A401| db $40, $40, $00, $00
|06A405| db $00, $40, $40, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_13_MiniHelmasaur:
|06A409| LDA.w $0DE0,X
|06A40C| ASL A
|06A40D| STA.b $00

|06A40F| LDA.w $0E80,X
|06A412| LSR A
|06A413| LSR A
|06A414| AND.b #$01

|06A416| ORA.b $00
|06A418| TAY

|06A419| LDA.w .anim_step,Y
|06A41C| STA.w $0DC0,X

|06A41F| LDA.w $0F50,X
|06A422| AND.b #$BF
|06A424| ORA.w .flip,Y
|06A427| STA.w $0F50,X

|06A42A| TXA
|06A42B| EOR.b $1A
|06A42D| AND.b #$0F
|06A42F| BNE .continue

;---------------------------------------------------------------------------------------------------

|06A431| LDA.w $0D50,X
|06A434| BPL .positive_x

|06A436| EOR.b #$FF
|06A438| INC A

.positive_x
|06A439| STA.b $00

|06A43B| LDA.w $0D40,X
|06A43E| BPL .positive_y

|06A440| EOR.b #$FF
|06A442| INC A

.positive_y
|06A443| STA.b $01

|06A445| LDA.b $00
|06A447| CMP.b $01

|06A449| LDA.b #$00
|06A44B| LDY.w $0D50,X
|06A44E| BCS .use_x_speed

|06A450| LDA.b #$02
|06A452| LDY.w $0D40,X

.use_x_speed
|06A455| BPL .positive_choice

|06A457| INC A

.positive_choice
|06A458| STA.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.continue
|06A45B| JSR SpriteDraw_SingleLarge

|06A45E| BRA MiniHelmaAndBeetleMain

;===================================================================================================

Sprite_26_HardhatBeetle:
|06A460| LDA.w $0E80,X
|06A463| LSR A
|06A464| LSR A
|06A465| AND.b #$01
|06A467| STA.w $0DC0,X

|06A46A| JSR SpriteDraw_HardhatBeetle

;===================================================================================================

MiniHelmaAndBeetleMain:
|06A46D| JSR CheckIfActive_bank06

|06A470| INC.w $0E80,X

|06A473| JSR HandleSpriteRecoil_bank06
|06A476| JSR CheckDamageToAndFromLink_bank06

|06A479| LDA.w $0E70,X
|06A47C| AND.b #$0F
|06A47E| BEQ .no_tile_collision

|06A480| AND.b #$03
|06A482| BEQ .no_horizontal_tile_collision

|06A484| STZ.w $0D50,X

.no_horizontal_tile_collision
|06A487| STZ.w $0D40,X

|06A48A| BRA .continue

.no_tile_collision
|06A48C| JSR MoveSpriteXY_bank06

;---------------------------------------------------------------------------------------------------

.continue
|06A48F| JSR CheckSpriteTileCollision

|06A492| TXA
|06A493| EOR.b $1A
|06A495| AND.b #$1F
|06A497| BNE .delay_turning

|06A499| LDA.w $0D90,X
|06A49C| JSR ProjectSpriteSpeedTowardsLink

|06A49F| LDA.b $00
|06A4A1| STA.w $0DA0,X

|06A4A4| LDA.b $01
|06A4A6| STA.w $0DB0,X

;---------------------------------------------------------------------------------------------------

.delay_turning
|06A4A9| TXA
|06A4AA| EOR.b $1A
|06A4AC| AND.w $0D80,X
|06A4AF| BNE .exit

|06A4B1| LDA.w $0D40,X
|06A4B4| CMP.w $0DA0,X
|06A4B7| BPL .at_max_y_speed

|06A4B9| INC.w $0D40,X
|06A4BC| BRA .check_x_speed

.at_max_y_speed
|06A4BE| DEC.w $0D40,X

.check_x_speed
|06A4C1| LDA.w $0D50,X
|06A4C4| CMP.w $0DB0,X
|06A4C7| BPL .at_max_x_speed

|06A4C9| INC.w $0D50,X
|06A4CC| BRA .exit

.at_max_x_speed
|06A4CE| DEC.w $0D50,X

.exit
|06A4D1| RTS

;===================================================================================================

pool SpriteDraw_HardhatBeetle

.oam_groups
|06A4D2| dw   0,  -4 : db $40, $01, $00, $02
|06A4DA| dw   0,   2 : db $42, $01, $00, $02

|06A4E2| dw   0,  -5 : db $40, $01, $00, $02
|06A4EA| dw   0,   2 : db $44, $01, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_HardhatBeetle:
|06A4F2| LDA.w $0DC0,X
|06A4F5| ASL A
|06A4F6| ASL A
|06A4F7| ASL A
|06A4F8| ASL A
|06A4F9| ADC.b #<.oam_groups
|06A4FB| STA.b $08

|06A4FD| LDA.b #>.oam_groups
|06A4FF| ADC.b #$00
|06A501| STA.b $09

|06A503| LDA.b #$02
|06A505| JSL TabulatedSpriteDraw

|06A509| JMP.w DrawSpriteShadow_Conditional

;===================================================================================================

Sprite_15_Antifairy:
Sprite_77_Antifairy:
|06A50C| JSL SpriteDraw_Antifairy
|06A510| JSR CheckIfActive_bank06
|06A513| JSR CheckDamageToLink
|06A516| BCC .dont_drain_magic

|06A518| LDA.w $0DF0,X
|06A51B| BNE .dont_drain_magic

|06A51D| LDA.b #$10
|06A51F| STA.w $0DF0,X

|06A522| LDA.l $7EF36E
|06A526| SEC
|06A527| SBC.b #$08
|06A529| BCS .enough_magic_to_drain

|06A52B| LDA.b #$00

|06A52D| BRA .skip_sfx

.enough_magic_to_drain
|06A52F| LDY.b #$1D ; SFX3.1D
|06A531| STY.w $012F

.skip_sfx
|06A534| STA.l $7EF36E

.dont_drain_magic
|06A538| JSR MoveSpriteXY_bank06
|06A53B| JSL Sprite_BounceFromTileCollision_long

|06A53F| RTS

;===================================================================================================

UNREACHABLE_06A540:
|06A540| dw $FFE8, $FFF8, $0008, $0018
|06A548| dw $FFE8, $FFF8, $0008, $0018
|06A550| dw $FFE8, $FFF8, $0008, $0018
|06A558| dw $FFE8, $FFF8, $0008, $0018
|06A560| dw $FFEA, $FFF9, $0007, $0016
|06A568| dw $FFEA, $FFF9, $0007, $0016
|06A570| dw $FFEA, $FFF9, $0007, $0016
|06A578| dw $FFEA, $FFF9, $0007, $0016
|06A580| dw $FFE8, $FFE8, $FFE8, $FFE8
|06A588| dw $FFF8, $FFF8, $FFF8, $FFF8
|06A590| dw $0008, $0008, $0008, $0008
|06A598| dw $0018, $0018, $0018, $0018
|06A5A0| dw $FFEA, $FFEA, $FFEA, $FFEA
|06A5A8| dw $FFF9, $FFF9, $FFF9, $FFF9
|06A5B0| dw $0007, $0007, $0007, $0007
|06A5B8| dw $0016, $0016, $0016, $0016

;===================================================================================================

pool Sprite_0B_Cucco

.h_flip
|06A5C0| db $40, $00

endpool

;---------------------------------------------------------------------------------------------------

Sprite_0B_Cucco:
|06A5C2| LDA.w $0D50,X
|06A5C5| BEQ .x_speed_0

|06A5C7| ASL A
|06A5C8| ROL A
|06A5C9| AND.b #$01
|06A5CB| TAY

|06A5CC| LDA.w $0F50,X
|06A5CF| AND.b #$BF
|06A5D1| ORA.w .h_flip,Y
|06A5D4| STA.w $0F50,X

.x_speed_0
|06A5D7| JSR SpriteDraw_SingleLarge

|06A5DA| LDA.w $0EB0,X
|06A5DD| BEQ .not_easter_egg

|06A5DF| LDA.b #$3D ; SPRITE 3D
|06A5E1| STA.w $0E20,X

|06A5E4| JSL LoadSpriteProperties

|06A5E8| INC.w $0E30,X

|06A5EB| LDA.b #$30
|06A5ED| STA.w $0DF0,X

|06A5F0| LDA.b #$15 ; SFX2.15
|06A5F2| STA.w $012E
|06A5F5| STA.w $0BA0,X

|06A5F8| RTS

;---------------------------------------------------------------------------------------------------

.not_easter_egg
|06A5F9| LDA.w $0DD0,X
|06A5FC| CMP.b #$0A
|06A5FE| BNE .not_panic_clucking

|06A600| LDA.b #$03
|06A602| STA.w $0D80,X

|06A605| LDA.b $11
|06A607| BNE .not_panic_clucking

|06A609| JSR Cucco_AnimateSlow
|06A60C| JSR Cucco_DrawPANIC

|06A60F| LDA.b $1A
|06A611| AND.b #$0F
|06A613| BNE .not_panic_clucking

|06A615| JSR BawkBawk

.not_panic_clucking
|06A618| JSR CheckIfActive_bank06

|06A61B| LDA.w $0DB0,X
|06A61E| BEQ Cucco_Main

;===================================================================================================

Cucco_Swarming:
|06A620| LDA.w $0F50,X
|06A623| ORA.b #$10
|06A625| STA.w $0F50,X

|06A628| JSR MoveSpriteXY_bank06

|06A62B| LDA.b #$0C
|06A62D| STA.w $0F70,X
|06A630| STA.w $0BA0,X

|06A633| TXA
|06A634| EOR.b $1A
|06A636| AND.b #$07
|06A638| BNE .dont_damage

|06A63A| JSR CheckDamageToLink

.dont_damage
|06A63D| JMP.w Cucco_AnimateFast

;===================================================================================================

Cucco_Main:
|06A640| LDA.b #$FF
|06A642| STA.w $0E50,X

|06A645| LDA.w $0DA0,X
|06A648| CMP.b #$23
|06A64A| BCC .dont_summon

|06A64C| JSR SummonAvengerChicken

.dont_summon
|06A64F| LDA.w $0EA0,X
|06A652| BEQ .no_more_hits

|06A654| STZ.w $0EA0,X

|06A657| LDA.w $0DA0,X
|06A65A| CMP.b #$23
|06A65C| BCS .too_hurt_to_cluck

|06A65E| INC.w $0DA0,X

|06A661| JSR BawkBawk

.too_hurt_to_cluck
|06A664| LDA.b #$02
|06A666| STA.w $0D80,X

.no_more_hits
|06A669| JSR CheckDamageFromLink

|06A66C| LDA.w $0D80,X
|06A66F| BEQ Cucco_Calm

|06A671| CMP.b #$01
|06A673| BEQ Cucco_Bouncing

|06A675| CMP.b #$02
|06A677| BNE .carried

|06A679| JMP.w Cucco_Flee

.carried
|06A67C| JMP.w Cucco_Carried

;===================================================================================================

Cucco_Calm:
|06A67F| LDA.w $0DF0,X
|06A682| BNE .delay

|06A684| JSL GetRandomNumber
|06A688| AND.b #$0F

|06A68A| PHX

|06A68B| TXY
|06A68C| TAX

|06A68D| LDA.l SomeRandomXSpeeds_bank05,X
|06A691| STA.w $0D50,Y

|06A694| LDA.l SomeRandomYSpeeds_bank05,X
|06A698| STA.w $0D40,Y

|06A69B| PLX

|06A69C| JSL GetRandomNumber
|06A6A0| AND.b #$1F
|06A6A2| ADC.b #$10
|06A6A4| STA.w $0DF0,X

|06A6A7| INC.w $0D80,X

.delay
|06A6AA| STZ.w $0DC0,X

;===================================================================================================

Cucco_CheckIfLifted:
|06A6AD| JSR Sprite_CheckIfLifted

|06A6B0| RTS

;===================================================================================================

Cucco_Bouncing:
|06A6B1| TXA
|06A6B2| EOR.b $1A
|06A6B4| LSR A
|06A6B5| BCC .continue

|06A6B7| JSR Cucco_DoMovement_XY
|06A6BA| BEQ .continue

|06A6BC| STZ.w $0D80,X

.continue
|06A6BF| JSR MoveSpriteZ_bank06

|06A6C2| DEC.w $0F80,X
|06A6C5| DEC.w $0F80,X

|06A6C8| LDA.w $0F70,X
|06A6CB| BPL Cucco_AnimateFast

|06A6CD| STZ.w $0F70,X

|06A6D0| LDA.w $0DF0,X
|06A6D3| BNE .delay

|06A6D5| LDA.b #$20
|06A6D7| STA.w $0DF0,X

|06A6DA| STZ.w $0D80,X

.delay
|06A6DD| LDA.b #$0A
|06A6DF| STA.w $0F80,X

;===================================================================================================

Cucco_AnimateFast:
|06A6E2| INC.w $0E80,X

;===================================================================================================

Cucco_AnimateSlow:
|06A6E5| INC.w $0E80,X
|06A6E8| INC.w $0E80,X
|06A6EB| INC.w $0E80,X

|06A6EE| LDA.w $0E80,X
|06A6F1| LSR A
|06A6F2| LSR A
|06A6F3| LSR A
|06A6F4| LSR A
|06A6F5| AND.b #$01
|06A6F7| STA.w $0DC0,X
|06A6FA| BRA Cucco_CheckIfLifted

;===================================================================================================

Cucco_Flee:
|06A6FC| JSR Cucco_CheckIfLifted
|06A6FF| JSR Cucco_DoMovement_XY

|06A702| STZ.w $0F70,X

|06A705| TXA
|06A706| EOR.b $1A
|06A708| AND.b #$1F
|06A70A| BNE .dont_update_direction

;===================================================================================================

#Cucco_UpdateFleeSpeed:
|06A70C| LDA.b #$10
|06A70E| JSR ProjectSpriteSpeedTowardsLink

|06A711| LDA.b $00
|06A713| EOR.b #$FF
|06A715| INC A
|06A716| STA.w $0D40,X

|06A719| LDA.b $01
|06A71B| EOR.b #$FF
|06A71D| INC A
|06A71E| STA.w $0D50,X

.dont_update_direction
|06A721| INC.w $0E80,X

|06A724| JSR Cucco_AnimateFast

;===================================================================================================

Cucco_DrawPANIC:
|06A727| JSR GetScreenCoordinates
|06A72A| JSL DrawSpriteDistress

|06A72E| RTS

;===================================================================================================

DrawSpriteDistress:
|06A72F| LDA.b $1A
|06A731| STA.b $06

;---------------------------------------------------------------------------------------------------

.custom
|06A733| LDA.b #$10
|06A735| JSL AllocateOAMInRegionA

|06A739| LDA.b $06
|06A73B| AND.b #$18
|06A73D| BEQ .exit

|06A73F| PHX

|06A740| LDX.b #$03
|06A742| LDY.b #$00

.next_object
|06A744| PHX
|06A745| PHX

|06A746| TXA
|06A747| ASL A
|06A748| TAX

|06A749| REP #$20

|06A74B| LDA.b $00
|06A74D| CLC
|06A74E| ADC.l CuccoDistress.offset_x,X
|06A752| STA.b ($90),Y

|06A754| AND.w #$0100
|06A757| STA.b $0E

|06A759| LDA.b $02
|06A75B| CLC
|06A75C| ADC.l CuccoDistress.offset_y,X

|06A760| INY
|06A761| STA.b ($90),Y

|06A763| CLC
|06A764| ADC.w #$0010
|06A767| CMP.w #$0100

|06A76A| SEP #$20
|06A76C| BCC .on_screen

|06A76E| LDA.b #$F0
|06A770| STA.b ($90),Y

.on_screen
|06A772| PLX

|06A773| LDA.b #$83
|06A775| INY
|06A776| STA.b ($90),Y

|06A778| LDA.b #$22
|06A77A| INY
|06A77B| STA.b ($90),Y

|06A77D| PHY

|06A77E| TYA
|06A77F| LSR A
|06A780| LSR A
|06A781| TAY

|06A782| LDA.b $0F
|06A784| STA.b ($92),Y

|06A786| PLY
|06A787| INY

|06A788| PLX
|06A789| DEX
|06A78A| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06A78C| PLX

.exit
|06A78D| RTL

;===================================================================================================

Cucco_Carried:
|06A78E| JSR Cucco_DoMovement_XYZ
|06A791| BEQ .dont_stop

|06A793| JSR InvertSpeedXY
|06A796| JSR MoveSpriteXY_bank06

|06A799| JSR HalveSpeedXY
|06A79C| JSR HalveSpeedXY

|06A79F| JSR BawkBawk

.dont_stop
|06A7A2| DEC.w $0F80,X

|06A7A5| LDA.w $0F70,X
|06A7A8| BPL .airborne

|06A7AA| STZ.w $0F70,X

|06A7AD| LDA.b #$02
|06A7AF| STA.w $0D80,X

|06A7B2| JMP.w Cucco_UpdateFleeSpeed

.airborne
|06A7B5| JMP.w Cucco_AnimateFast

;===================================================================================================

Cucco_DoMovement_XYZ:
|06A7B8| JSR MoveSpriteZ_bank06

;===================================================================================================

Cucco_DoMovement_XY:
|06A7BB| JSR MoveSpriteXY_bank06
|06A7BE| JSL CheckSpriteTileCollision_long

|06A7C2| RTS

;===================================================================================================

CuccoDistress:
.offset_x
|06A7C3| db  -3,  -1,   2,   0
|06A7C7| db   7,   0,  11,   0

.offset_y
|06A7CB| db  -5,  -1,  -7,  -1
|06A7CF| db  -7,  -1,  -5,  -1

;===================================================================================================

SummonAvengerChicken:
|06A7D3| TXA
|06A7D4| EOR.b $1A
|06A7D6| AND.b #$0F
|06A7D8| ORA.b $1B
|06A7DA| BNE EXIT_06A852

|06A7DC| LDA.b #$0B ; SPRITE 0B
|06A7DE| LDY.b #$0A
|06A7E0| JSL SpawnSpriteDynamically.slot_limited
|06A7E4| BMI EXIT_06A852

|06A7E6| PHX

|06A7E7| TYX

|06A7E8| LDA.b #$1E ; SFX3.1E
|06A7EA| JSL QueueSpriteSFX3WithPan

|06A7EE| PLX

|06A7EF| LDA.b #$01
|06A7F1| STA.w $0DB0,Y

|06A7F4| PHX

|06A7F5| JSL GetRandomNumber
|06A7F9| STA.b $0F

|06A7FB| AND.b #$02
|06A7FD| BEQ .enter_vertically

;---------------------------------------------------------------------------------------------------

.enter_horizontally
|06A7FF| LDA.b $0F
|06A801| ADC.b $E2
|06A803| STA.w $0D10,Y

|06A806| LDA.b $E3
|06A808| ADC.b #$00
|06A80A| STA.w $0D30,Y

|06A80D| LDA.b $0F
|06A80F| AND.b #$01
|06A811| TAX

|06A812| LDA.w CuccoSwarmSpeed,X
|06A815| ADC.b $E8
|06A817| STA.w $0D00,Y

|06A81A| LDA.b $E9
|06A81C| ADC.b #$00
|06A81E| STA.w $0D20,Y

|06A821| BRA .continue

;---------------------------------------------------------------------------------------------------

.enter_vertically
|06A823| LDA.b $0F
|06A825| ADC.b $E8
|06A827| STA.w $0D00,Y

|06A82A| LDA.b $E9
|06A82C| ADC.b #$00
|06A82E| STA.w $0D20,Y

|06A831| LDA.b $0F
|06A833| AND.b #$01
|06A835| TAX

|06A836| LDA.w CuccoSwarmSpeed,X
|06A839| ADC.b $E2
|06A83B| STA.w $0D10,Y

|06A83E| LDA.b $E3
|06A840| ADC.b #$00
|06A842| STA.w $0D30,Y

;---------------------------------------------------------------------------------------------------

.continue
|06A845| TYX

|06A846| LDA.b #$20
|06A848| JSR ApplySpeedTowardsLink

|06A84B| PLX

;===================================================================================================

BawkBawk:
|06A84C| LDA.b #$30 ; SFX2.30
|06A84E| JSL QueueSpriteSFX2WithPan

;---------------------------------------------------------------------------------------------------

#EXIT_06A852:
|06A852| RTS

;===================================================================================================

Sprite_EE_CastleMantle_bounce:
|06A853| JSL Sprite_EE_CastleMantle

|06A857| RTS

;===================================================================================================

pool Hoarder_Covered

.anim_step
|06A858| db $03, $04, $05, $04

.speed_x
|06A85C| db -12,  12,   0,   0

.speed_y
|06A860| db   0,   0, -12,  12

endpool

;===================================================================================================

pool Hoarder_Frantic

.speed_x
|06A864| db -16,  16, -16,  16

.speed_y
|06A868| db -16, -16,  16,  16

endpool

;===================================================================================================

Sprite_17_Hoarder:
Sprite_3E_Hoarder:
|06A86C| LDA.w $0D80,X
|06A86F| BEQ Hoarder_Covered

|06A871| JMP.w Hoarder_Frantic

;===================================================================================================

Hoarder_Covered:
|06A874| JSR SpriteDraw_Hoarder
|06A877| JSR CheckIfActive_bank06

|06A87A| STZ.w $0DC0,X

|06A87D| JSR GetDirectionTowardsLink

|06A880| LDA.w $0DF0,X
|06A883| BNE .flee

|06A885| LDA.b $0E
|06A887| CLC
|06A888| ADC.b #$30
|06A88A| CMP.b #$60
|06A88C| BCS .not_close

|06A88E| LDA.b $0F
|06A890| CLC
|06A891| ADC.b #$20
|06A893| CMP.b #$40
|06A895| BCS .not_close

|06A897| LDA.b #$20
|06A899| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.flee
|06A89C| LDA.w .speed_x,Y
|06A89F| STA.w $0D50,X

|06A8A2| LDA.w .speed_y,Y
|06A8A5| STA.w $0D40,X

|06A8A8| LDA.w $0E70,X
|06A8AB| BNE .tile_collision

|06A8AD| JSR MoveSpriteXY_bank06

.tile_collision
|06A8B0| JSR CheckSpriteTileCollision
|06A8B3| JSR CheckDamageFromLink

|06A8B6| INC.w $0E80,X

|06A8B9| LDA.w $0E80,X
|06A8BC| LSR A
|06A8BD| AND.b #$03
|06A8BF| TAY

|06A8C0| LDA.w .anim_step,Y
|06A8C3| STA.w $0DC0,X

.not_close
|06A8C6| LDA.w $0E20,X
|06A8C9| CMP.b #$3E ; SPRITE 3E
|06A8CB| BNE .not_rock

|06A8CD| LDA.l $7EF354
|06A8D1| CMP.b #$01
|06A8D3| BCC .weakling

.not_rock
|06A8D5| JSL Sprite_CheckIfLifted_permissive_long

.weakling
|06A8D9| LDA.w $0DD0,X
|06A8DC| CMP.b #$09
|06A8DE| BEQ .exit

|06A8E0| LDA.b #$01

|06A8E2| LDY.w $0E20,X
|06A8E5| CPY.b #$17 ; SPRITE 17
|06A8E7| BNE .rock_hoarder

|06A8E9| INC A

.rock_hoarder
|06A8EA| STA.w $0DB0,X

|06A8ED| LDA.b #$EC ; SPRITE EC
|06A8EF| STA.w $0E20,X

|06A8F2| LSR.w $0F50,X
|06A8F5| ASL.w $0F50,X

|06A8F8| STZ.w $0DC0,X

;---------------------------------------------------------------------------------------------------

|06A8FB| LDA.b #$3E ; SPRITE 3E
|06A8FD| JSL SpawnSpriteDynamically
|06A901| BMI .exit

|06A903| JSL SetSpawnedSpriteCoordinates

|06A907| LDA.w $0E40,Y
|06A90A| ASL A
|06A90B| LSR A
|06A90C| STA.w $0E40,Y

|06A90F| LDA.b #$80
|06A911| STA.w $0E10,Y

|06A914| LDA.b #$09
|06A916| STA.w $0F50,Y
|06A919| STA.w $0D80,Y

.exit
|06A91C| RTS

;===================================================================================================

Hoarder_Frantic:
|06A91D| JSR SpriteDraw_SingleLarge
|06A920| JSR CheckIfActive_bank06
|06A923| JSR HandleSpriteRecoil_bank06
|06A926| JSR CheckDamageFromLink

|06A929| LDA.w $0E10,X
|06A92C| BNE .no_damage

|06A92E| JSR CheckDamageToLink

.no_damage
|06A931| INC.w $0E80,X

|06A934| LDA.w $0E80,X
|06A937| LSR A
|06A938| AND.b #$03
|06A93A| TAY

|06A93B| LDA.w .anim_step,Y
|06A93E| STA.w $0DC0,X

|06A941| LDA.w $0F50,X
|06A944| AND.b #$BF
|06A946| ORA.w .h_flip,Y
|06A949| STA.w $0F50,X

|06A94C| LDA.w $0E70,X
|06A94F| BEQ .no_tile_collision

|06A951| LDA.b #$10
|06A953| STA.w $0F10,X

|06A956| JSL GetRandomNumber
|06A95A| AND.b #$03
|06A95C| TAY

|06A95D| LDA.w Hoarder_Frantic.speed_x,Y
|06A960| STA.w $0D50,X

|06A963| LDA.w Hoarder_Frantic.speed_y,Y
|06A966| STA.w $0D40,X

|06A969| BRA .continue

;---------------------------------------------------------------------------------------------------

.no_tile_collision
|06A96B| JSR MoveSpriteXY_bank06

.continue
|06A96E| JSR CheckSpriteTileCollision

|06A971| LDA.w $0F10,X
|06A974| BNE .dont_turn

|06A976| TXA
|06A977| EOR.b $1A
|06A979| AND.b #$1F
|06A97B| BNE .dont_turn

|06A97D| LDA.b #$10
|06A97F| JSR ProjectSpriteSpeedTowardsLink

|06A982| LDA.b $00
|06A984| EOR.b #$FF
|06A986| INC A
|06A987| STA.w $0D40,X

|06A98A| LDA.b $01
|06A98C| EOR.b #$FF
|06A98E| INC A
|06A98F| STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.dont_turn
|06A992| LDA.b $1A
|06A994| AND.b #$01
|06A996| BNE .exit

|06A998| INC.w $0ED0,X

|06A99B| LDA.w $0ED0,X
|06A99E| CMP.b #$C0
|06A9A0| BNE .dont_die

|06A9A2| LDA.b #$0F
|06A9A4| JSR ScheduleForBreakage.parameterized

|06A9A7| LDY.b #$01

|06A9A9| BRA .green_rupee

;---------------------------------------------------------------------------------------------------

.dont_die
|06A9AB| LDA.w $0ED0,X
|06A9AE| AND.b #$0F
|06A9B0| BNE .exit

|06A9B2| LDY.b #$00

|06A9B4| LDA.w $0EB0,X
|06A9B7| CMP.b #$06
|06A9B9| BNE .green_rupee

|06A9BB| LDA.b #$DB ; SPRITE DB
|06A9BD| BRA .spit_rupee

.green_rupee
|06A9BF| LDA.b #$D9 ; SPRITE D9

;---------------------------------------------------------------------------------------------------

.spit_rupee
|06A9C1| JSL SpawnSpriteDynamically.slot_limited
|06A9C5| BMI .exit

|06A9C7| INC.w $0EB0,X

|06A9CA| JSL SetSpawnedSpriteCoordinates

|06A9CE| LDA.b $00
|06A9D0| CLC
|06A9D1| ADC.b #$08
|06A9D3| STA.w $0D10,Y

|06A9D6| LDA.b $01
|06A9D8| ADC.b #$00
|06A9DA| STA.w $0D30,Y

|06A9DD| LDA.b #$20
|06A9DF| STA.w $0F80,Y

|06A9E2| LDA.b #$10
|06A9E4| STA.w $0F10,Y

|06A9E7| PHX

|06A9E8| TYX

|06A9E9| LDA.b #$10
|06A9EB| JSR ApplySpeedTowardsLink

|06A9EE| LDA.b $00
|06A9F0| EOR.b #$FF
|06A9F2| STA.w $0D40,X

|06A9F5| LDA.b $01
|06A9F7| EOR.b #$FF
|06A9F9| STA.w $0D50,X

|06A9FC| PLX

|06A9FD| LDA.b #$30 ; SFX3.30
|06A9FF| JSL QueueSpriteSFX3WithPan

.exit
|06AA03| RTS

;---------------------------------------------------------------------------------------------------

.anim_step
|06AA04| db $00, $01, $00, $01

.h_flip
|06AA08| db $00, $00, $40, $00

;===================================================================================================

Sprite_CheckIfLifted_permissive_long:
|06AA0C| PHB
|06AA0D| PHK
|06AA0E| PLB

|06AA0F| JSR .wrapper

|06AA12| PLB

|06AA13| RTL

;---------------------------------------------------------------------------------------------------

.wrapper
|06AA14| JSR Sprite_CheckIfLifted_permissive

|06AA17| RTS

;===================================================================================================

pool SpriteDraw_Hoarder

.offset_y
|06AA18| dw   0,   0,   0,  -3
|06AA20| dw   0,  -5,   0,  -6
|06AA28| dw   0,  -6,   0,  -6

.char
|06AA30| db $44, $44, $E8, $44
|06AA34| db $E8, $44, $E6, $44
|06AA38| db $E8, $44, $E6, $44

.props
|06AA3C| db $00, $0C, $03, $0C
|06AA40| db $03, $0C, $03, $0C
|06AA44| db $03, $0C, $43, $0C

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Hoarder:
|06AA48| JSR GetScreenCoordinates

|06AA4B| LDA.w $0FC6
|06AA4E| CMP.b #$03
|06AA50| BCS .exit

|06AA52| STZ.b $07

|06AA54| LDA.w $0E20,X
|06AA57| CMP.b #$17 ; SPRITE 17
|06AA59| BNE .rock_hoarder

|06AA5B| LDA.b #$02
|06AA5D| STA.b $07

.rock_hoarder
|06AA5F| LDA.w $0DC0,X
|06AA62| ASL A
|06AA63| STA.b $06

;---------------------------------------------------------------------------------------------------

|06AA65| PHX

|06AA66| LDX.b #$01

.next_object
|06AA68| PHX

|06AA69| TXA
|06AA6A| CLC
|06AA6B| ADC.b $06
|06AA6D| PHA

|06AA6E| ASL A
|06AA6F| TAX

|06AA70| REP #$20

|06AA72| LDA.b $00
|06AA74| STA.b ($90),Y

|06AA76| AND.w #$0100
|06AA79| STA.b $0E

|06AA7B| LDA.b $02
|06AA7D| CLC
|06AA7E| ADC.w .offset_y,X

|06AA81| INY
|06AA82| STA.b ($90),Y

|06AA84| CLC
|06AA85| ADC.w #$0010
|06AA88| CMP.w #$0100

|06AA8B| SEP #$20
|06AA8D| BCC .on_screen

|06AA8F| LDA.b #$F0
|06AA91| STA.b ($90),Y

.on_screen
|06AA93| PLX

|06AA94| LDA.w .char,X
|06AA97| CMP.b #$44
|06AA99| BNE .change_char

|06AA9B| CLC
|06AA9C| ADC.b $07

.change_char
|06AA9E| INY
|06AA9F| STA.b ($90),Y

|06AAA1| LDA.b $05
|06AAA3| AND.b #$FE
|06AAA5| ORA.w .props,X

|06AAA8| INY
|06AAA9| STA.b ($90),Y

|06AAAB| PHY

|06AAAC| TYA
|06AAAD| LSR A
|06AAAE| LSR A
|06AAAF| TAY

|06AAB0| LDA.b #$02
|06AAB2| ORA.b $0F
|06AAB4| STA.b ($92),Y

|06AAB6| PLY
|06AAB7| INY

|06AAB8| PLX
|06AAB9| DEX
|06AABA| BPL .next_object

|06AABC| PLX

.exit
|06AABD| RTS

;===================================================================================================

pool SpriteDraw_ThrownItem

.char
|06AABE| db $42, $44, $46, $00
|06AAC2| db $46, $44, $42, $44
|06AAC6| db $44, $00, $46, $44

.palette
|06AACA| db $0C, $0C
|06AACC| db $0C, $00
|06AACE| db $00, $00

.oam_main
|06AAD0| dw $08B0, $08B4, $08B8, $08BC

.oam_small
|06AAD8| dw $0A4C, $0A4D, $0A4E, $0A4F

endpool

;===================================================================================================

Sprite_EC_ThrownItem:
|06AAE0| LDA.w $0FC6
|06AAE3| CMP.b #$03
|06AAE5| BCS .continue

|06AAE7| LDA.w $0FB3
|06AAEA| BEQ .dont_use_reserved_slots

|06AAEC| LDA.w $0F20,X
|06AAEF| BEQ .dont_use_reserved_slots

|06AAF1| TXA
|06AAF2| AND.b #$03
|06AAF4| ASL A
|06AAF5| TAY

|06AAF6| REP #$20

|06AAF8| LDA.w SpriteDraw_ThrownItem.oam_main,Y
|06AAFB| STA.b $90

|06AAFD| LDA.w SpriteDraw_ThrownItem.oam_small,Y
|06AB00| STA.b $92

|06AB02| SEP #$20

.dont_use_reserved_slots
|06AB04| LDA.w $0DD0,X
|06AB07| STA.w $0BA0,X

|06AB0A| LDA.w $0DB0,X
|06AB0D| CMP.b #$06
|06AB0F| BCC .not_big

|06AB11| JSR SpriteDraw_GiganticThrownItem
|06AB14| BRA .continue

.not_big
|06AB16| JSR SpriteDraw_SingleLarge

|06AB19| PHX

|06AB1A| LDA.b $1B
|06AB1C| CLC
|06AB1D| ADC.w $0FFF
|06AB20| CMP.b #$02

|06AB22| LDA.w $0DB0,X
|06AB25| PHA

|06AB26| BCC .not_skull_pot

|06AB28| ADC.b #$05

.not_skull_pot
|06AB2A| TAX

|06AB2B| LDA.w SpriteDraw_ThrownItem.char,X
|06AB2E| LDY.b #$02
|06AB30| STA.b ($90),Y

|06AB32| INY

|06AB33| LDA.b ($90),Y
|06AB35| AND.b #$F0

|06AB37| PLX

|06AB38| ORA.w SpriteDraw_ThrownItem.palette,X
|06AB3B| STA.b ($90),Y

|06AB3D| PLX

|06AB3E| AND.b #$0F
|06AB40| STA.b $00

|06AB42| LDA.w $0F50,X
|06AB45| AND.b #$C0
|06AB47| ORA.b $00
|06AB49| STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

.continue
|06AB4C| LDA.w $0DD0,X
|06AB4F| CMP.b #$09
|06AB51| BNE .exit

|06AB53| JSR CheckIfActive_bank06
|06AB56| JSR ThrowableScenery_InteractWithSpritesAndTiles

.exit
|06AB59| RTS

;===================================================================================================

pool SpriteDraw_GiganticThrownItem

.offset_x
|06AB5A| dw  -8,   8,  -8,   8

.offset_y
|06AB62| dw -14, -14,   2,   2

.flip
|06AB6A| db $00, $40, $80, $C0

.offset_shadow
|06AB6E| dw  -6,   0,   6,  12

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_GiganticThrownItem:
|06AB76| LDY.w $0DB0,X

|06AB79| LDA.w .offset_shadow,Y
|06AB7C| STA.w $0F50,X

|06AB7F| JSR GetScreenCoordinates

|06AB82| PHX

|06AB83| LDX.b #$03

.next_object
|06AB85| PHX

|06AB86| TXA
|06AB87| ASL A
|06AB88| TAX

|06AB89| REP #$20

|06AB8B| LDA.b $00
|06AB8D| CLC
|06AB8E| ADC.w .offset_x,X
|06AB91| STA.b ($90),Y

|06AB93| AND.w #$0100
|06AB96| STA.b $0E

|06AB98| LDA.b $02
|06AB9A| CLC
|06AB9B| ADC.w .offset_y,X

|06AB9E| INY
|06AB9F| STA.b ($90),Y

|06ABA1| CLC
|06ABA2| ADC.w #$0010
|06ABA5| CMP.w #$0100

|06ABA8| SEP #$20
|06ABAA| BCC .on_screen

|06ABAC| LDA.b #$F0
|06ABAE| STA.b ($90),Y

.on_screen
|06ABB0| PLX

|06ABB1| LDA.b #$4A
|06ABB3| INY
|06ABB4| STA.b ($90),Y

|06ABB6| LDA.w .flip,X
|06ABB9| INY
|06ABBA| ORA.b $05
|06ABBC| STA.b ($90),Y

|06ABBE| PHY

|06ABBF| TYA
|06ABC0| LSR A
|06ABC1| LSR A
|06ABC2| TAY

|06ABC3| LDA.b #$02
|06ABC5| ORA.b $0F
|06ABC7| STA.b ($92),Y

|06ABC9| PLY
|06ABCA| INY

|06ABCB| DEX
|06ABCC| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06ABCE| PLX

|06ABCF| LDA.b #$0C
|06ABD1| JSL AllocateOAMInRegionB

|06ABD5| LDY.b #$00

|06ABD7| LDA.w $0D00,X
|06ABDA| SEC
|06ABDB| SBC.b $E8
|06ABDD| STA.b $02

|06ABDF| LDA.w $0D20,X
|06ABE2| SBC.b $E9
|06ABE4| STA.b $03

|06ABE6| PHX

|06ABE7| LDX.b #$02

.next_shadow
|06ABE9| PHX

|06ABEA| TXA
|06ABEB| ASL A
|06ABEC| TAX

|06ABED| REP #$20

|06ABEF| LDA.b $00
|06ABF1| CLC
|06ABF2| ADC.w .offset_shadow,X
|06ABF5| STA.b ($90),Y

|06ABF7| AND.w #$0100
|06ABFA| STA.b $0E

|06ABFC| LDA.b $02
|06ABFE| CLC
|06ABFF| ADC.w #$000C

|06AC02| INY
|06AC03| STA.b ($90),Y

|06AC05| CLC
|06AC06| ADC.w #$0010
|06AC09| CMP.w #$0100

|06AC0C| SEP #$20
|06AC0E| BCC .shadow_on_screen

|06AC10| LDA.b #$F0
|06AC12| STA.b ($90),Y

.shadow_on_screen
|06AC14| PLX

|06AC15| LDA.b #$6C
|06AC17| INY
|06AC18| STA.b ($90),Y

|06AC1A| LDA.b #$24
|06AC1C| INY
|06AC1D| STA.b ($90),Y

|06AC1F| PHY

|06AC20| TYA
|06AC21| LSR A
|06AC22| LSR A
|06AC23| TAY

|06AC24| LDA.b #$02
|06AC26| ORA.b $0F
|06AC28| STA.b ($92),Y

|06AC2A| PLY
|06AC2B| INY

|06AC2C| DEX
|06AC2D| BPL .next_shadow

;---------------------------------------------------------------------------------------------------

|06AC2F| PLX

|06AC30| RTS

;===================================================================================================

pool ThrowableScenery_ScatterIntoDebris

.offset_x_low
|06AC31| db -8,  8, -8,  8

.offset_x_high
|06AC35| db -1,  0, -1,  0

.offset_y_low
|06AC39| db -8, -8,  8,  8

.offset_y_high
|06AC3D| db -1, -1,  0,  0

endpool

;---------------------------------------------------------------------------------------------------

ThrowableScenery_ScatterIntoDebris:
|06AC41| LDA.w $0DB0,X
|06AC44| BMI ThrowableScenery_ScatterIntoSmallerDebris

|06AC46| CMP.b #$06
|06AC48| BCC ThrowableScenery_ScatterIntoSmallerDebris

|06AC4A| LDA.b #$03
|06AC4C| STA.b $0D

.next_particle
|06AC4E| LDA.b #$EC ; SPRITE EC
|06AC50| JSL SpawnSpriteDynamically
|06AC54| BMI .no_space

|06AC56| LDA.w $0F70,X
|06AC59| STA.w $0F70,Y

|06AC5C| PHX

|06AC5D| LDX.b $0D

|06AC5F| LDA.b $00
|06AC61| CLC
|06AC62| ADC.w .offset_x_low,X
|06AC65| STA.w $0D10,Y

|06AC68| LDA.b $01
|06AC6A| ADC.w .offset_x_high,X
|06AC6D| STA.w $0D30,Y

|06AC70| LDA.b $02
|06AC72| CLC
|06AC73| ADC.w .offset_y_low,X
|06AC76| STA.w $0D00,Y

|06AC79| LDA.b $03
|06AC7B| ADC.w .offset_y_high,X
|06AC7E| STA.w $0D20,Y

|06AC81| LDA.b #$01
|06AC83| STA.w $0DB0,Y

|06AC86| TYX
|06AC87| JSR ScheduleForBreakage

|06AC8A| PLX

|06AC8B| LDA.w $0DB0,X
|06AC8E| CMP.b #$07

|06AC90| LDA.b #$00
|06AC92| BCS .default_palette

|06AC94| LDA.b #$0C

.default_palette
|06AC96| STA.w $0F50,Y

.no_space
|06AC99| DEC.b $0D
|06AC9B| BPL .next_particle

|06AC9D| STZ.w $0DD0,X

|06ACA0| RTS

;===================================================================================================

ThrowableScenery_ScatterIntoSmallerDebris:
|06ACA1| STZ.w $0DD0,X

|06ACA4| JSR GetScreenCoordinates

|06ACA7| PHX

|06ACA8| TXY
|06ACA9| LDX.b #$1D

.next_slot
|06ACAB| LDA.l $7FF800,X
|06ACAF| BEQ .empty_slot

|06ACB1| DEX
|06ACB2| BPL .next_slot

|06ACB4| INX

.empty_slot
|06ACB5| LDA.b #$16 ; GARNISH 16
|06ACB7| STA.l $7FF800,X
|06ACBB| STA.w $0FB4

|06ACBE| LDA.w $0D10,Y
|06ACC1| STA.l $7FF83C,X

|06ACC5| LDA.w $0D30,Y
|06ACC8| STA.l $7FF878,X

|06ACCC| LDA.w $0D00,Y
|06ACCF| SEC
|06ACD0| SBC.w $0F70,Y

|06ACD3| PHP

|06ACD4| CLC
|06ACD5| ADC.b #$10
|06ACD7| STA.l $7FF81E,X

|06ACDB| LDA.w $0D20,Y
|06ACDE| ADC.b #$00

|06ACE0| PLP
|06ACE1| SBC.b #$00
|06ACE3| STA.l $7FF85A,X

|06ACE7| LDA.b $05
|06ACE9| STA.l $7FF9FE,X

|06ACED| LDA.w $0F20,Y
|06ACF0| STA.l $7FF968,X

|06ACF4| LDA.b #$1F
|06ACF6| STA.l $7FF90E,X

|06ACFA| LDA.w $0DB0,Y
|06ACFD| STA.l $7FF92C,X

|06AD01| PLX

|06AD02| RTS

;===================================================================================================

ApplyRumbleToSprites:
|06AD03| LDY.b #$0F

.next_sprite
|06AD05| LDA.w $0CAA,Y
|06AD08| AND.b #$02
|06AD0A| BEQ .skip

|06AD0C| LDA.w $0E90,Y
|06AD0F| BEQ .skip

|06AD11| LDA.w $0FC6
|06AD14| CMP.b #$0E
|06AD16| BEQ .collision_guaranteed

|06AD18| PHX

|06AD19| TYX
|06AD1A| JSR SetupSpriteHitbox

|06AD1D| PLX

|06AD1E| JSR CheckIfHitboxesOverlap
|06AD21| BCC .skip

.collision_guaranteed
|06AD23| LDA.b #$00
|06AD25| STA.w $0E90,Y

|06AD28| LDA.b #$30 ; SFX3.30
|06AD2A| STA.w $012F

|06AD2D| LDA.b #$30
|06AD2F| STA.w $0F80,Y

|06AD32| LDA.b #$10
|06AD34| STA.w $0D50,Y

|06AD37| LDA.b #$30
|06AD39| STA.w $0EE0,Y

|06AD3C| LDA.b #$FF
|06AD3E| STA.w $0B58,Y

|06AD41| LDA.w $0E20,Y ; hearts in trees turn into bombs
|06AD44| CMP.b #$D8 ; SPRITE D8
|06AD46| BNE .skip

|06AD48| JSL TransmuteSpriteToBomb

.skip
|06AD4C| DEY
|06AD4D| BPL .next_sprite

|06AD4F| RTS

;===================================================================================================

TransmuteSpriteToBomb:
|06AD50| LDA.b #$4A ; SPRITE 4A
|06AD52| STA.w $0E20,Y

|06AD55| LDA.b #$01
|06AD57| STA.w $0DB0,Y

|06AD5A| LDA.b #$FF
|06AD5C| STA.w $0E00,Y

|06AD5F| LDA.b #$18
|06AD61| STA.w $0E60,Y

|06AD64| LDA.b #$08
|06AD66| STA.w $0F50,Y

|06AD69| LDA.b #$00
|06AD6B| STA.w $0E50,Y

|06AD6E| RTL

;===================================================================================================

Sprite_28_DarkWorldHintNPC:
|06AD6F| JSR SpriteDraw_DarkWorldHintNPC
|06AD72| JSR CheckIfActive_bank06
|06AD75| JSL BehaveAsBarrier

|06AD79| LDA.w $0DF0,X
|06AD7C| BNE .delay

|06AD7E| LDA.b $1A

|06AD80| LSR A
|06AD81| LSR A
|06AD82| LSR A
|06AD83| LSR A

|06AD84| AND.b #$01
|06AD86| STA.w $0DC0,X

.delay
|06AD89| LDA.w $0E80,X
|06AD8C| JSL JumpTableLocal
|06AD90| dw DarkWorldHintNPC_Bird
|06AD92| dw HamburgerHelper
|06AD94| dw Octopus
|06AD96| dw Broccoli
|06AD98| dw Watto

;===================================================================================================

DarkWorldHintNPC_Bird:
|06AD9A| LDA.w $0D80,X
|06AD9D| JSL JumpTableLocal
|06ADA1| dw DarkWorldHintNPC_Idle
|06ADA3| dw HintBird_TellStory
|06ADA5| dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

DarkWorldHintNPC_Idle:
|06ADA7| LDA.b #$FE ; MESSAGE 00FE
|06ADA9| LDY.b #$00
|06ADAB| JSL ShowSolicitedMessage
|06ADAF| BCC .exit

|06ADB1| INC.w $0D80,X

.exit
|06ADB4| RTS

;===================================================================================================

DarkWorldHintNPC_RestoreHealth:
|06ADB5| LDA.b #$A0
|06ADB7| STA.l $7EF372

|06ADBB| STZ.w $0D80,X

|06ADBE| RTS

;===================================================================================================

HintBird_TellStory:
|06ADBF| LDA.w $1CE8
|06ADC2| BNE .rejected

|06ADC4| JSR DarkWorldHintNPC_HandlePayment
|06ADC7| BCC .rejected

|06ADC9| LDA.b #$FF ; MESSAGE 00FF
|06ADCB| LDY.b #$00

;---------------------------------------------------------------------------------------------------

#DarkWorldHintNPC_TellStory:
|06ADCD| JSL ShowMessageUnconditional

|06ADD1| INC.w $0D80,X

|06ADD4| RTS

;---------------------------------------------------------------------------------------------------

.rejected
|06ADD5| LDA.b #$00 ; MESSAGE 0100
|06ADD7| LDY.b #$01
|06ADD9| JSL ShowMessageUnconditional

|06ADDD| STZ.w $0D80,X

|06ADE0| RTS

;===================================================================================================

HamburgerHelper:
|06ADE1| LDA.w $0D80,X
|06ADE4| JSL JumpTableLocal
|06ADE8| dw DarkWorldHintNPC_Idle
|06ADEA| dw HamburgerHelper_TellStory
|06ADEC| dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

HamburgerHelper_TellStory:
|06ADEE| LDA.w $1CE8
|06ADF1| BNE .rejected

|06ADF3| JSR DarkWorldHintNPC_HandlePayment
|06ADF6| BCC .rejected

|06ADF8| LDA.b #$01 ; MESSAGE 0101
|06ADFA| LDY.b #$01
|06ADFC| BRA DarkWorldHintNPC_TellStory

.rejected
|06ADFE| LDA.b #$00 ; MESSAGE 0100
|06AE00| LDY.b #$01
|06AE02| JSL ShowMessageUnconditional

|06AE06| STZ.w $0D80,X

|06AE09| RTS

;===================================================================================================

Octopus:
|06AE0A| LDA.w $0D80,X
|06AE0D| JSL JumpTableLocal
|06AE11| dw DarkWorldHintNPC_Idle
|06AE13| dw Octopus_TellStory
|06AE15| dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

Octopus_TellStory:
|06AE17| LDA.w $1CE8
|06AE1A| BNE .rejected

|06AE1C| JSR DarkWorldHintNPC_HandlePayment
|06AE1F| BCC .rejected

|06AE21| LDA.b #$02 ; MESSAGE 0102
|06AE23| LDY.b #$01
|06AE25| JMP.w DarkWorldHintNPC_TellStory

;---------------------------------------------------------------------------------------------------

.rejected
|06AE28| LDA.b #$00 ; MESSAGE 0100
|06AE2A| LDY.b #$01
|06AE2C| JSL ShowMessageUnconditional

|06AE30| STZ.w $0D80,X

|06AE33| RTS

;===================================================================================================

Broccoli:
|06AE34| LDA.w $0DF0,X
|06AE37| BNE .continue

|06AE39| LDA.b $1A
|06AE3B| AND.b #$3F
|06AE3D| BNE .dont_flip

|06AE3F| LDA.w $0F50,X
|06AE42| EOR.b #$40
|06AE44| STA.w $0F50,X

.dont_flip
|06AE47| JSL GetRandomNumber
|06AE4B| BNE .continue

|06AE4D| LDA.b #$20
|06AE4F| STA.w $0DF0,X

.continue
|06AE52| LDA.b #$49 ; MESSAGE 0149
|06AE54| LDY.b #$01
|06AE56| JSL ShowSolicitedMessage

|06AE5A| RTS

;===================================================================================================

Watto:
|06AE5B| LDA.b $1A
|06AE5D| LSR A
|06AE5E| AND.b #$01
|06AE60| STA.w $0DC0,X

|06AE63| JSR MoveSpriteZ_bank06

|06AE66| LDA.w $0F70,X
|06AE69| BPL .air_born

|06AE6B| STZ.w $0F70,X

.air_born
|06AE6E| LDA.w $0F70,X
|06AE71| CMP.b #$04
|06AE73| ROL A
|06AE74| AND.b #$01
|06AE76| TAY

|06AE77| LDA.w $0F80,X
|06AE7A| CLC
|06AE7B| ADC.w PositiveAndNegativeOne,Y
|06AE7E| STA.w $0F80,X

|06AE81| LDA.w $0D80,X
|06AE84| JSL JumpTableLocal
|06AE88| dw DarkWorldHintNPC_Idle
|06AE8A| dw Watto_TellStory
|06AE8C| dw DarkWorldHintNPC_RestoreHealth

;===================================================================================================

Watto_TellStory:
|06AE8E| LDA.w $1CE8
|06AE91| BNE .rejected

|06AE93| JSR DarkWorldHintNPC_HandlePayment
|06AE96| BCC .rejected

|06AE98| LDA.b #$03 ; MESSAGE 0103
|06AE9A| LDY.b #$01
|06AE9C| JMP.w DarkWorldHintNPC_TellStory

.rejected
|06AE9F| LDA.b #$00 ; MESSAGE 0100
|06AEA1| LDY.b #$01
|06AEA3| JSL ShowMessageUnconditional

|06AEA7| STZ.w $0D80,X

|06AEAA| RTS

;===================================================================================================

DarkWorldHintNPC_HandlePayment:
|06AEAB| REP #$20

|06AEAD| LDA.l $7EF360
|06AEB1| CMP.w #$14
|06AEB4| BCC .too_poor

|06AEB6| LDA.l $7EF360
|06AEBA| SEC
|06AEBB| SBC.w #$14
|06AEBE| STA.l $7EF360

|06AEC2| SEP #$30
|06AEC4| SEC

|06AEC5| RTS

;---------------------------------------------------------------------------------------------------

.too_poor
|06AEC6| SEP #$30
|06AEC8| CLC

|06AEC9| RTS

;===================================================================================================

pool SpriteDraw_DarkWorldHintNPC

.oam_groups
|06AECA| dw   0,   0 : db $4A, $0A, $00, $02
|06AED2| dw   0,   0 : db $6E, $4A, $00, $02

|06AEDA| dw   0,   0 : db $24, $0A, $00, $02
|06AEE2| dw   0,   0 : db $24, $4A, $00, $02

|06AEEA| dw   0,   0 : db $04, $08, $00, $02
|06AEF2| dw   0,   0 : db $04, $48, $00, $02

|06AEFA| dw   0,   0 : db $6A, $0A, $00, $02
|06AF02| dw   0,   0 : db $6C, $0A, $00, $02

|06AF0A| dw   0,   0 : db $0E, $0A, $00, $02
|06AF12| dw   0,   0 : db $2E, $0A, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_DarkWorldHintNPC:
|06AF1A| LDA.w $0E80,X
|06AF1D| ASL A

|06AF1E| ADC.w $0DC0,X

|06AF21| ASL A
|06AF22| ASL A
|06AF23| ASL A

|06AF24| ADC.b #<.oam_groups
|06AF26| STA.b $08

|06AF28| LDA.b #>.oam_groups
|06AF2A| ADC.b #$00
|06AF2C| STA.b $09

|06AF2E| LDA.b #$01
|06AF30| STA.b $06
|06AF32| STZ.b $07

|06AF34| JSL TabulatedSpriteDraw.player_deferred

|06AF38| JMP.w DrawSpriteShadow

;===================================================================================================

Sprite_2E_FluteKid:
|06AF3B| LDA.w $0EB0,X
|06AF3E| JSL JumpTableLocal
|06AF42| dw FluteKid
|06AF44| dw Quaver

;===================================================================================================

FluteKid:
|06AF46| LDA.w $0E80,X
|06AF49| JSL JumpTableLocal
|06AF4D| dw FluteKid_Human
|06AF4F| dw Stumpy

;===================================================================================================

FluteKid_Human:
|06AF51| LDA.w $0D80,X
|06AF54| CMP.b #$03
|06AF56| BEQ .invisible

|06AF58| JSL SpriteDraw_FluteKid

|06AF5C| LDA.b $01
|06AF5E| ORA.b $03
|06AF60| STA.w $0DB0,X

.invisible
|06AF63| JSR CheckIfActive_bank06

|06AF66| LDA.w $0DB0,X
|06AF69| BNE .no_tune

|06AF6B| LDA.w $0DA0,X
|06AF6E| BNE .no_tune

|06AF70| LDA.b #$0B ; SFX1.0B
|06AF72| STA.w $012D
|06AF75| STA.w $0DA0,X

.no_tune
|06AF78| LDA.b $1A
|06AF7A| LSR A
|06AF7B| LSR A
|06AF7C| LSR A
|06AF7D| LSR A
|06AF7E| LSR A
|06AF7F| AND.b #$01
|06AF81| STA.w $0DC0,X

|06AF84| LDA.w $0D80,X
|06AF87| JSL JumpTableLocal
|06AF8B| dw FluteKid_Chillin
|06AF8D| dw FluteKid_AboutToDisappear
|06AF8F| dw FluteKid_PhaseOut
|06AF91| dw FluteKid_HeDisappeared

;===================================================================================================

FluteKid_Chillin:
|06AF93| LDA.l $7EF34C
|06AF97| CMP.b #$02
|06AF99| BCS .flute_owned

|06AF9B| JSR FluteKid_CheckIfInRange
|06AF9E| BCS .not_close

.flute_owned
|06AFA0| INC.w $0D80,X
|06AFA3| INC.w $0DE0,X

|06AFA6| INC.w $0FDD

|06AFA9| LDA.b #$B0
|06AFAB| STA.w $0DF0,X

|06AFAE| LDA.b #$01
|06AFB0| STA.w $02E4

.not_close
|06AFB3| LDA.w $0DF0,X
|06AFB6| BNE .exit

|06AFB8| LDA.b #$19
|06AFBA| STA.w $0DF0,X

|06AFBD| JSR SpawnQuaver

.exit
|06AFC0| RTS

;===================================================================================================

FluteKid_AboutToDisappear:
|06AFC1| LDA.b #$01
|06AFC3| STA.w $02E4

|06AFC6| LDA.w $0DF0,X
|06AFC9| BNE .exit

|06AFCB| LDA.b #$02
|06AFCD| STA.b $1D

|06AFCF| LDA.b #$30
|06AFD1| STA.b $9A

|06AFD3| LDA.b #$00
|06AFD5| STA.l $7EC007
|06AFD9| STA.l $7EC009

|06AFDD| PHX
|06AFDE| JSL AssertTranslucencySwap
|06AFE2| PLX

|06AFE3| INC.w $0D80,X

|06AFE6| LDA.b #$80 ; SFX1.80 - fade
|06AFE8| STA.w $012D

|06AFEB| LDA.b #$33 ; SFX2.33
|06AFED| JSL QueueSpriteSFX2WithPan

.exit
|06AFF1| RTS

;===================================================================================================

FluteKid_PhaseOut:
|06AFF2| LDA.b $1A
|06AFF4| AND.b #$0F
|06AFF6| BNE .exit

|06AFF8| PHX
|06AFF9| JSL PaletteFilter_Sprite5Left
|06AFFD| PLX

|06AFFE| LDA.l $7EC007
|06B002| BNE .exit

|06B004| INC.w $0D80,X

.exit
|06B007| RTS

;===================================================================================================

FluteKid_HeDisappeared:
|06B008| PHX

|06B009| JSL PaletteFilter_RestoreSprite5Left
|06B00D| JSL RevertTranslucencySwap

|06B011| PLX

|06B012| STZ.w $0DD0,X
|06B015| STZ.w $02E4

|06B018| RTS

;===================================================================================================

Stumpify:

.anim_step
|06B019| db $01, $01, $01, $01
|06B01D| db $02, $01, $02, $01
|06B021| db $02, $01, $02, $03
|06B025| db $02, $03, $02, $03
|06B029| db $02, $03, $02, $FF

;---------------------------------------------------------------------------------------------------

.timer
|06B02D| db $FF, $FF, $FF,  16
|06B031| db   2,  12,   6,   8
|06B035| db  10,   4,  14,   2
|06B039| db  10,   6,   6,  10
|06B03D| db   2,  14,   2

;===================================================================================================

Stumpy:
|06B040| JSL SpriteDraw_Stumpy
|06B044| JSR CheckIfActive_bank06

|06B047| LDA.w $0D80,X
|06B04A| JSL JumpTableLocal
|06B04E| dw Stumpy_Initialize
|06B050| dw Stumpy_WaitForConvo
|06B052| dw Stumpy_GiveShovel
|06B054| dw Stumpy_WaitForMusic
|06B056| dw Stumpy_BecomeTree
|06B058| dw Stumpy_AmTree

;===================================================================================================

Stumpy_Initialize:
|06B05A| LDA.l $7EF34C
|06B05E| AND.b #$03
|06B060| JSL JumpTableLocal
|06B064| dw Stumpy_Supplicate
|06B066| dw Stumpy_GetMeMyDamnFlute
|06B068| dw Stumpy_ThanksButYouKeepIt
|06B06A| dw Stumpy_SorryButAmTree

;===================================================================================================

Stumpy_Supplicate:
|06B06C| LDA.b #$E5 ; MESSAGE 00E5
|06B06E| LDY.b #$00
|06B070| JSL ShowSolicitedMessage
|06B074| BCC .exit

|06B076| INC.w $0D80,X

.exit
|06B079| RTS

;===================================================================================================

Stumpy_GetMeMyDamnFlute:
|06B07A| LDA.b #$E8 ; MESSAGE 00E8
|06B07C| LDY.b #$00
|06B07E| JSL ShowSolicitedMessage

|06B082| RTS

;===================================================================================================

Stumpy_ThanksButYouKeepIt:
|06B083| LDA.b #$01
|06B085| STA.w $0DC0,X

|06B088| LDA.b #$E9 ; MESSAGE 00E9
|06B08A| LDY.b #$00
|06B08C| JSL ShowSolicitedMessage
|06B090| BCC .exit

|06B092| LDA.b #$03
|06B094| STA.w $0D80,X

.exit
|06B097| RTS

;===================================================================================================

Stumpy_SorryButAmTree:
|06B098| LDA.b #$03
|06B09A| STA.w $0DC0,X

|06B09D| RTS

;===================================================================================================

Stumpy_WaitForConvo:
|06B09E| LDA.w $1CE8
|06B0A1| BNE .rejected

|06B0A3| LDA.b #$E6 ; MESSAGE 00E6
|06B0A5| LDY.b #$00
|06B0A7| JSL ShowMessageUnconditional

|06B0AB| INC.w $0D80,X

|06B0AE| RTS

.rejected
|06B0AF| LDA.b #$E7 ; MESSAGE 00E7
|06B0B1| LDY.b #$00
|06B0B3| JSL ShowMessageUnconditional

|06B0B7| STZ.w $0D80,X

|06B0BA| RTS

;===================================================================================================

Stumpy_GiveShovel:
|06B0BB| STZ.w $02E9

|06B0BE| LDY.b #$13 ; ITEMGET 13

|06B0C0| PHX

|06B0C1| JSL GrantItemReceipt

|06B0C5| PLX

|06B0C6| STZ.w $0D80,X

|06B0C9| RTS

;===================================================================================================

Stumpy_WaitForMusic:
|06B0CA| LDA.w $0202
|06B0CD| CMP.b #$0D
|06B0CF| BNE .exit

|06B0D1| BIT.b $F0
|06B0D3| BVC .exit

|06B0D5| INC.w $0D80,X

|06B0D8| LDA.b #$F2 ; SONG F2 - half volume
|06B0DA| STA.w $012C

|06B0DD| STZ.w $012E

|06B0E0| LDA.b #$17 ; SFX1.17
|06B0E2| STA.w $012D

|06B0E5| INC.w $02E4

.exit
|06B0E8| RTS

;===================================================================================================

Stumpy_BecomeTree:
|06B0E9| LDA.w $0DF0,X
|06B0EC| BNE .exit

|06B0EE| LDA.w $0D90,X
|06B0F1| CMP.b #$03
|06B0F3| BCC .skip_sfx

|06B0F5| LDA.b #$33 ; SFX2.33
|06B0F7| JSL QueueSpriteSFX2WithPan

.skip_sfx
|06B0FB| LDA.w $0D90,X
|06B0FE| TAY

|06B0FF| INC A
|06B100| STA.w $0D90,X

|06B103| LDA.w Stumpify.anim_step,Y
|06B106| BMI .turn_it_up_to_11

|06B108| STA.w $0DC0,X

|06B10B| LDA.w Stumpify.timer,Y
|06B10E| STA.w $0DF0,X

.exit
|06B111| RTS

.turn_it_up_to_11
|06B112| LDA.b #$F3 ; SONG F3 - max volume
|06B114| STA.w $012C

|06B117| INC.w $0D80,X

|06B11A| STZ.w $02E4

|06B11D| RTS

;===================================================================================================

Stumpy_AmTree:
|06B11E| LDA.b #$03
|06B120| STA.w $0DC0,X

|06B123| LDA.l $7EF3C9
|06B127| ORA.b #$08
|06B129| STA.l $7EF3C9

|06B12D| RTS

;===================================================================================================

FluteKid_CheckIfInRange:
|06B12E| LDA.w $0D10,X
|06B131| STA.b $00

|06B133| LDA.w $0D30,X
|06B136| STA.b $01

|06B138| LDA.w $0D00,X
|06B13B| STA.b $02

|06B13D| LDA.w $0D20,X
|06B140| STA.b $03

|06B142| REP #$30

|06B144| LDA.b $02
|06B146| SEC
|06B147| SBC.w #$0010
|06B14A| STA.b $02

|06B14C| LDA.b $22
|06B14E| SBC.b $00
|06B150| BPL .positive_x

|06B152| EOR.w #$FFFF

.positive_x
|06B155| STA.b $00

|06B157| LDA.b $20
|06B159| SBC.b $02
|06B15B| BPL .positive_y

|06B15D| EOR.w #$FFFF

.positive_y
|06B160| STA.b $02

|06B162| LDA.b $00
|06B164| CMP.w #$0030
|06B167| BCS .exit

|06B169| LDA.b $02
|06B16B| CMP.w #$0030

.exit
|06B16E| SEP #$30

|06B170| RTS

;===================================================================================================

pool Quaver

.speed_x
|06B171| db   1,  -1

endpool

;---------------------------------------------------------------------------------------------------

Quaver:
|06B173| JSR SpriteDraw_SingleSmall
|06B176| JSR CheckIfActive_bank06
|06B179| JSR MoveSpriteXY_bank06
|06B17C| JSR MoveSpriteZ_bank06

|06B17F| LDA.w $0DF0,X
|06B182| BNE .tenuto

|06B184| STZ.w $0DD0,X

.tenuto
|06B187| LDA.b $1A
|06B189| AND.b #$01
|06B18B| BNE .exit

|06B18D| LDA.b $1A

|06B18F| LSR A
|06B190| LSR A
|06B191| LSR A
|06B192| LSR A
|06B193| LSR A

|06B194| EOR.w $0FA0
|06B197| AND.b #$01
|06B199| TAY

|06B19A| LDA.w $0D50,X
|06B19D| CLC
|06B19E| ADC.w .speed_x,Y
|06B1A1| STA.w $0D50,X

.exit
|06B1A4| RTS

;===================================================================================================

SpawnQuaver:
|06B1A5| LDA.b #$2E ; SPRITE 2E
|06B1A7| JSL SpawnSpriteDynamically
|06B1AB| BMI .no_space

|06B1AD| LDA.b $00
|06B1AF| CLC
|06B1B0| ADC.b #$04
|06B1B2| STA.w $0D10,Y

|06B1B5| LDA.b $01
|06B1B7| ADC.b #$00
|06B1B9| STA.w $0D30,Y

|06B1BC| LDA.b $02
|06B1BE| SEC
|06B1BF| SBC.b #$04
|06B1C1| STA.w $0D00,Y

|06B1C4| LDA.b $03
|06B1C6| SBC.b #$00
|06B1C8| STA.w $0D20,Y

|06B1CB| LDA.b #$01
|06B1CD| STA.w $0EB0,Y

|06B1D0| LDA.b #$08
|06B1D2| STA.w $0F80,Y

|06B1D5| LDA.b #$60
|06B1D7| STA.w $0DF0,Y
|06B1DA| STA.w $0BA0,Y

.no_space
|06B1DD| RTS

;===================================================================================================

Smithy_anim_step:
|06B1DE| db $00, $01, $02, $03
|06B1E2| db $03, $02, $01, $00

SmithyAnimTimer:
|06B1E6| db  24,   4,   1,  16
|06B1EA| db  16,   5,  10,  16

;===================================================================================================

Sprite_1A_Smithy:
|06B1EE| LDA.w $0E80,X
|06B1F1| JSL JumpTableLocal
|06B1F5| dw Smithy
|06B1F7| dw AnvilSpawk
|06B1F9| dw Froggy
|06B1FB| dw Smithy_Homecoming

;===================================================================================================

Smithy_Homecoming:
|06B1FD| JSR SpriteDraw_SmithyHomecoming
|06B200| JSR CheckIfActive_bank06

|06B203| LDA.w $0D80,X
|06B206| JSL JumpTableLocal
|06B20A| dw Smithy_Walk
|06B20C| dw Smithy_TYVM

;===================================================================================================

pool Smithy_Walk

.timer
|06B20E| db 104,  12

.direction
|06B210| db $00, $02, $FF

.speed_x
|06B213| db   0,   0, -13,  13

.speed_y
|06B217| db -13,  13,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Smithy_Walk:
|06B21B| JSR MoveSpriteXY_bank06

|06B21E| LDA.b $1A

|06B220| LSR A
|06B221| LSR A
|06B222| LSR A

|06B223| AND.b #$01
|06B225| STA.w $0DC0,X

|06B228| LDA.w $0DF0,X
|06B22B| BNE .exit

|06B22D| LDA.w $0D90,X
|06B230| TAY

|06B231| INC A
|06B232| STA.w $0D90,X

|06B235| LDA.w .timer,Y
|06B238| STA.w $0DF0,X

|06B23B| LDA.w .direction,Y
|06B23E| BMI .next_state

|06B240| STA.w $0DE0,X

|06B243| TAY

|06B244| LDA.w .speed_x,Y
|06B247| STA.w $0D50,X

|06B24A| LDA.w .speed_y,Y
|06B24D| STA.w $0D40,X

.exit
|06B250| RTS

;---------------------------------------------------------------------------------------------------

.next_state
|06B251| INC.w $0D80,X

|06B254| RTS

;===================================================================================================

Smithy_TYVM:
|06B255| JSL BehaveAsBarrier

|06B259| LDA.b #$E3 ; MESSAGE 00E3
|06B25B| LDY.b #$00
|06B25D| JSL ShowSolicitedMessage

|06B261| STZ.w $02E4

|06B264| LDA.b #$01
|06B266| STA.w $0DE0,X

|06B269| LDA.l $7EF3C9
|06B26D| ORA.b #$20
|06B26F| STA.l $7EF3C9

|06B273| RTS

;===================================================================================================

Froggy:
|06B274| JSR SpriteDraw_Froggy
|06B277| JSR CheckIfActive_bank06
|06B27A| JSL BehaveAsBarrier

|06B27E| DEC.w $0F80,X
|06B281| DEC.w $0F80,X

|06B284| JSR MoveSpriteZ_bank06

|06B287| LDA.w $0F70,X
|06B28A| BPL .him_hop

|06B28C| STZ.w $0F70,X

|06B28F| LDA.b #$10
|06B291| STA.w $0F80,X

.him_hop
|06B294| LDA.w $0D80,X
|06B297| BNE .follow_link

|06B299| LDA.b #$01
|06B29B| STA.w $0DE0,X

|06B29E| LDA.b #$E1 ; MESSAGE 00E1
|06B2A0| LDY.b #$00
|06B2A2| JSL ShowSolicitedMessage
|06B2A6| BCC .ignored_WOW

|06B2A8| INC.w $0D80,X

.ignored_WOW
|06B2AB| RTS

;---------------------------------------------------------------------------------------------------

.follow_link
|06B2AC| LDA.b #$07 ; FOLLOWER 07
|06B2AE| STA.l $7EF3CC

|06B2B2| PHX

|06B2B3| JSL LoadFollowerGraphics
|06B2B7| JSL BecomeFollower

|06B2BB| PLX

|06B2BC| STZ.w $0DD0,X

|06B2BF| RTS

;===================================================================================================

pool SpriteDraw_SmithyHomecoming

.oam_groups
|06B2C0| dw   0,   0 : db $22, $41, $00, $02

|06B2C8| dw   0,   0 : db $22, $01, $00, $02

|06B2D0| dw   0,   0 : db $22, $41, $00, $02

|06B2D8| dw   0,   0 : db $22, $01, $00, $02

|06B2E0| dw   0,   0 : db $22, $01, $00, $02

|06B2E8| dw   0,   0 : db $22, $01, $00, $02

|06B2F0| dw   0,   0 : db $22, $41, $00, $02

|06B2F8| dw   0,   0 : db $22, $41, $00, $02

;---------------------------------------------------------------------------------------------------

.char_offset
|06B300| db $C0
|06B301| db $C0
|06B302| db $A0
|06B303| db $A0
|06B304| db $80
|06B305| db $60
|06B306| db $80
|06B307| db $60

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_SmithyHomecoming:
|06B308| LDA.b #$01
|06B30A| STA.b $06
|06B30C| STZ.b $07

|06B30E| LDA.w $0DE0,X
|06B311| ASL A
|06B312| ADC.w $0DC0,X
|06B315| TAY

|06B316| LDA.w .char_offset,Y
|06B319| STA.w $0AEA

|06B31C| TYA
|06B31D| ASL A
|06B31E| ASL A
|06B31F| ASL A
|06B320| ADC.b #<.oam_groups
|06B322| STA.b $08

|06B324| LDA.b #>.oam_groups
|06B326| ADC.b #$00
|06B328| STA.b $09

|06B32A| JSL TabulatedSpriteDraw.player_deferred

|06B32E| JMP.w DrawSpriteShadow

;===================================================================================================

pool SpriteDraw_Froggy

.oam_groups
|06B331| dw   0,   0 : db $C8, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Froggy:
|06B339| LDA.b #$01
|06B33B| STA.b $06
|06B33D| STZ.b $07

|06B33F| LDA.b #<.oam_groups
|06B341| STA.b $08

|06B343| LDA.b #>.oam_groups
|06B345| STA.b $09

|06B347| JSL TabulatedSpriteDraw.player_deferred

|06B34B| JMP.w DrawSpriteShadow

;===================================================================================================

Smithy:
|06B34E| JSR SpriteDraw_Smithy

|06B351| DEC.w $0F80,X
|06B354| DEC.w $0F80,X

|06B357| JSR MoveSpriteZ_bank06

|06B35A| LDA.w $0F70,X
|06B35D| BPL .hopping

|06B35F| STZ.w $0F70,X
|06B362| STZ.w $0F80,X

.hopping
|06B365| JSR CheckIfActive_bank06

|06B368| LDY.w $0E90,X

|06B36B| LDA.w $0D80,Y
|06B36E| CMP.b #$05
|06B370| BEQ .tick_timer

|06B372| CMP.b #$07
|06B374| BEQ .tick_timer

|06B376| CMP.b #$09
|06B378| BEQ .tick_timer

|06B37A| ORA.w $0D80,X
|06B37D| BEQ .tick_timer

|06B37F| LDA.w $0D80,X
|06B382| CMP.b #$05
|06B384| BEQ .tick_timer

|06B386| CMP.b #$07
|06B388| BEQ .tick_timer

|06B38A| CMP.b #$09
|06B38C| BNE .perform_ai

;---------------------------------------------------------------------------------------------------

.tick_timer
|06B38E| LDA.w $0DA0,X

|06B391| DEC.w $0DA0,X

|06B394| CMP.b #$00
|06B396| BNE .perform_ai

|06B398| LDA.w $0D90,X
|06B39B| TAY

|06B39C| INC A
|06B39D| AND.b #$07
|06B39F| STA.w $0D90,X

|06B3A2| LDA.w Smithy_anim_step,Y
|06B3A5| STA.w $0DC0,X

|06B3A8| LDA.w SmithyAnimTimer,Y
|06B3AB| STA.w $0DA0,X

|06B3AE| CPY.b #$01
|06B3B0| BNE .no_hop_for_him

|06B3B2| LDA.b #$10
|06B3B4| STA.w $0F80,X

.no_hop_for_him
|06B3B7| CPY.b #$03
|06B3B9| BNE .perform_ai

|06B3BB| JSR SpawnAnvilSpawk

|06B3BE| LDA.b #$05 ; SFX2.05
|06B3C0| JSL QueueSpriteSFX2WithPan

;---------------------------------------------------------------------------------------------------

.perform_ai
|06B3C4| LDA.w $0D80,X
|06B3C7| JSL JumpTableLocal
|06B3CB| dw Smithy_Smithing
|06B3CD| dw Smithy_WannaTemper
|06B3CF| dw Smithy_ForRealsies
|06B3D1| dw Smithy_ItAintFreeKid
|06B3D3| dw Smithy_TemperInProgress
|06B3D5| dw Smithy_TemperInProgress
|06B3D7| dw Smithy_GiveTemperedSword
|06B3D9| dw Smithy_Nothing
|06B3DB| dw Smithy_Nothing
|06B3DD| dw Smithy_Nothing
|06B3DF| dw Smithy_SpawnFriend
|06B3E1| dw Smithy_Thanks

;===================================================================================================

Smithy_Smithing:
|06B3E3| STZ.w $0DB0,X

|06B3E6| LDA.l $7EF3CC
|06B3EA| CMP.b #$08 ; FOLLOWER 08
|06B3EC| BEQ .smithy_follower

|06B3EE| JSR Smithy_ListenForHammer
|06B3F1| BCC .link_not_helping_out

|06B3F3| LDA.b #$E4 ; MESSAGE 00E4
|06B3F5| LDY.b #$00
|06B3F7| JSL ShowMessageUnconditional

|06B3FB| LDA.b #$60
|06B3FD| STA.w $0E00,X

|06B400| INC.w $0DB0,X

|06B403| RTS

;---------------------------------------------------------------------------------------------------

.link_not_helping_out
|06B404| LDA.l $7EF3C9
|06B408| AND.b #$20
|06B40A| BEQ .not_rescued

|06B40C| LDA.b #$D8 ; MESSAGE 00D8
|06B40E| LDY.b #$00
|06B410| JSL ShowSolicitedMessage
|06B414| BCC .exit_a

|06B416| INC.w $0D80,X
|06B419| INC.w $0DB0,X

.exit_a
|06B41C| RTS

;---------------------------------------------------------------------------------------------------

.not_rescued
|06B41D| LDA.b #$DF ; MESSAGE 00DF
|06B41F| LDY.b #$00
|06B421| JSL ShowSolicitedMessage

|06B425| RTS

;---------------------------------------------------------------------------------------------------

.smithy_follower
|06B426| LDA.b $20
|06B428| CMP.b #$C2
|06B42A| BCS .exit_b

|06B42C| LDA.b #$E0 ; MESSAGE 00E0
|06B42E| LDY.b #$00

|06B430| JSL ShowMessageUnconditional

|06B434| LDA.b #$0A
|06B436| STA.w $0D80,X

|06B439| INC.w $02E4

.exit_b
|06B43C| RTS

;===================================================================================================

Smithy_ListenForHammer:
|06B43D| LDA.w $0E00,X
|06B440| BNE .no_hammer

|06B442| LDA.w $0202
|06B445| CMP.b #$0C
|06B447| BNE .no_hammer

|06B449| LDA.w $0301
|06B44C| AND.b #$02
|06B44E| BEQ .no_hammer

|06B450| LDA.w $0300
|06B453| CMP.b #$02
|06B455| BNE .no_hammer

|06B457| JSR CheckDamageToLink_same_layer
|06B45A| BCC .no_hammer

|06B45C| RTS

.no_hammer
|06B45D| CLC

|06B45E| RTS

;===================================================================================================

Smithy_WannaTemper:
|06B45F| LDA.w $1CE8
|06B462| BNE .didnt_make_the_sale

|06B464| LDA.b #$D9 ; MESSAGE 00D9
|06B466| LDY.b #$00
|06B468| JSL ShowMessageUnconditional

|06B46C| INC.w $0D80,X

|06B46F| RTS

.didnt_make_the_sale
|06B470| LDA.b #$DC ; MESSAGE 00DC
|06B472| LDY.b #$00
|06B474| JSL ShowMessageUnconditional

|06B478| STZ.w $0D80,X

|06B47B| RTS

;===================================================================================================

Smithy_ForRealsies:
|06B47C| LDA.w $1CE8
|06B47F| BNE .didnt_make_the_sale

|06B481| LDA.l $7EF359
|06B485| CMP.b #$03
|06B487| BCS .sword_too_good_already

|06B489| LDA.b #$DA ; MESSAGE 00DA
|06B48B| LDY.b #$00
|06B48D| JSL ShowMessageUnconditional

|06B491| INC.w $0D80,X

|06B494| RTS

;---------------------------------------------------------------------------------------------------

.sword_too_good_already
|06B495| LDA.b #$DB ; MESSAGE 00DB
|06B497| LDY.b #$00
|06B499| JSL ShowMessageUnconditional

|06B49D| STZ.w $0D80,X

|06B4A0| RTS

;---------------------------------------------------------------------------------------------------

.didnt_make_the_sale
|06B4A1| LDA.b #$DC ; MESSAGE 00DC
|06B4A3| LDY.b #$00
|06B4A5| JSL ShowMessageUnconditional

|06B4A9| STZ.w $0D80,X

|06B4AC| RTS

;===================================================================================================

Smithy_ItAintFreeKid:
|06B4AD| LDA.w $1CE8
|06B4B0| BEQ .made_the_sale

|06B4B2| LDA.b #$DC ; MESSAGE 00DC
|06B4B4| LDY.b #$00

|06B4B6| JSL ShowMessageUnconditional
|06B4BA| STZ.w $0D80,X

|06B4BD| RTS

;---------------------------------------------------------------------------------------------------

.made_the_sale
|06B4BE| REP #$20

|06B4C0| LDA.l $7EF360
|06B4C4| CMP.w #$000A

|06B4C7| SEP #$30
|06B4C9| BCS .paid_in_cash

|06B4CB| LDA.b #$DC ; MESSAGE 00DC
|06B4CD| LDY.b #$00
|06B4CF| JSL ShowMessageUnconditional

|06B4D3| STZ.w $0D80,X

|06B4D6| RTS

;---------------------------------------------------------------------------------------------------

.paid_in_cash
|06B4D7| REP #$20

|06B4D9| LDA.l $7EF360
|06B4DD| SEC
|06B4DE| SBC.w #$000A
|06B4E1| STA.l $7EF360

|06B4E5| SEP #$30

|06B4E7| LDA.b #$DD ; MESSAGE 00DD
|06B4E9| LDY.b #$00
|06B4EB| JSL ShowMessageUnconditional

|06B4EF| LDY.w $0E90,X

|06B4F2| LDA.b #$05
|06B4F4| STA.w $0D80,Y
|06B4F7| STA.w $0D80,X

|06B4FA| STZ.w $0ABF

|06B4FD| LDA.b #$FF
|06B4FF| STA.l $7EF359

|06B503| LDA.l $7EF3C9
|06B507| ORA.b #$80
|06B509| STA.l $7EF3C9

|06B50D| RTS

;===================================================================================================

Smithy_TemperInProgress:
|06B50E| STZ.w $0DB0,X

|06B511| JSR Smithy_ListenForHammer
|06B514| BCC .link_isnt_helping

|06B516| LDA.b #$E4 ; MESSAGE 00E4
|06B518| LDY.b #$00
|06B51A| JSL ShowMessageUnconditional

|06B51E| LDA.b #$60
|06B520| STA.w $0E00,X

|06B523| INC.w $0DB0,X

|06B526| RTS

;---------------------------------------------------------------------------------------------------

.link_isnt_helping
|06B527| LDA.w $0ABF
|06B52A| BEQ .not_finished

|06B52C| LDA.b #$DE ; MESSAGE 00DE
|06B52E| LDY.b #$00
|06B530| JSL ShowSolicitedMessage
|06B534| BCC .exit

|06B536| INC.w $0D80,X

|06B539| LDA.b #$04
|06B53B| STA.w $0DC0,X

.exit
|06B53E| RTS

;---------------------------------------------------------------------------------------------------

.not_finished
|06B53F| LDA.b #$E2 ; MESSAGE 00E2
|06B541| LDY.b #$00
|06B543| JSL ShowSolicitedMessage

|06B547| RTS

;===================================================================================================

Smithy_GiveTemperedSword:
|06B548| LDY.w $0E90,X

|06B54B| LDA.b #$00
|06B54D| STA.w $0D80,X
|06B550| STA.w $0D80,Y

|06B553| LDY.b #$02 ; ITEMGET 02

|06B555| STZ.w $02E9

|06B558| PHX
|06B559| JSL GrantItemReceipt
|06B55D| PLX

|06B55E| LDA.l $7EF3C9
|06B562| AND.b #$7F
|06B564| STA.l $7EF3C9

|06B568| RTS

;===================================================================================================

Smithy_Nothing:
|06B569| RTS

;===================================================================================================

Smithy_SpawnFriend:
|06B56A| LDA.b #$1A ; SPRITE 1A
|06B56C| JSL SpawnSpriteDynamically
|06B570| BMI .no_friend_in_me

|06B572| LDA.b $22
|06B574| STA.w $0D10,Y

|06B577| LDA.b $23
|06B579| STA.w $0D30,Y

|06B57C| LDA.b $20
|06B57E| STA.w $0D00,Y

|06B581| LDA.b $21
|06B583| STA.w $0D20,Y

|06B586| LDA.b #$03
|06B588| STA.w $0E80,Y
|06B58B| STA.w $0BA0,Y

.no_friend_in_me
|06B58E| INC.w $0D80,X

|06B591| LDA.b #$00
|06B593| STA.l $7EF3CC

|06B597| LDA.b #$04
|06B599| STA.w $0DC0,X

|06B59C| RTS

;===================================================================================================

Smithy_Thanks:
|06B59D| LDA.b #$E3 ; MESSAGE 00E3
|06B59F| LDY.b #$00
|06B5A1| JSL ShowSolicitedMessage

|06B5A5| RTS

;===================================================================================================

Smithy_SpawnDwarfPal:
|06B5A6| LDA.b #$1A ; SPRITE 1A
|06B5A8| JSL SpawnSpriteDynamically
|06B5AC| BMI .no_space

|06B5AE| LDA.b $00
|06B5B0| CLC
|06B5B1| ADC.b #$2C
|06B5B3| STA.w $0D10,Y

|06B5B6| LDA.b $01
|06B5B8| STA.w $0D30,Y

|06B5BB| LDA.b $02
|06B5BD| STA.w $0D00,Y

|06B5C0| LDA.b $03
|06B5C2| STA.w $0D20,Y

|06B5C5| LDA.b #$01
|06B5C7| STA.w $0DE0,Y

|06B5CA| LDA.b #$04
|06B5CC| STA.w $0D90,Y
|06B5CF| STA.w $0BA0,Y

.no_space
|06B5D2| RTS

;===================================================================================================

pool SpriteDraw_Smithy

.oam_groups
|06B5D3| dw   1,   0 : db $40, $40, $00, $02
|06B5DB| dw -11, -10 : db $60, $40, $00, $02

|06B5E3| dw  -1,   0 : db $40, $00, $00, $02
|06B5EB| dw  11, -10 : db $60, $00, $00, $02

|06B5F3| dw   1,   0 : db $40, $40, $00, $02
|06B5FB| dw  -3, -14 : db $44, $40, $00, $02

|06B603| dw  -1,   0 : db $40, $00, $00, $02
|06B60B| dw   3, -14 : db $44, $00, $00, $02

|06B613| dw   1,   0 : db $42, $40, $00, $02
|06B61B| dw  11, -10 : db $60, $00, $00, $02

|06B623| dw  -1,   0 : db $42, $00, $00, $02
|06B62B| dw -11, -10 : db $60, $40, $00, $02

|06B633| dw   1,   0 : db $42, $40, $00, $02
|06B63B| dw  13,   2 : db $62, $40, $00, $02

|06B643| dw  -1,   0 : db $42, $00, $00, $02
|06B64B| dw -13,   2 : db $62, $00, $00, $02

|06B653| dw   0,   0 : db $64, $40, $00, $02
|06B65B| dw   0,   0 : db $62, $40, $00, $02

|06B663| dw   0,   0 : db $64, $00, $00, $02
|06B66B| dw   0,   0 : db $64, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Smithy:
|06B673| LDA.b #$02
|06B675| STA.b $06
|06B677| STZ.b $07

|06B679| LDA.w $0DC0,X
|06B67C| ASL A
|06B67D| ADC.w $0DE0,X

|06B680| ASL A
|06B681| ASL A
|06B682| ASL A
|06B683| ASL A

|06B684| ADC.b #<.oam_groups
|06B686| STA.b $08

|06B688| LDA.b #>.oam_groups
|06B68A| ADC.b #$00
|06B68C| STA.b $09

|06B68E| JSL TabulatedSpriteDraw.player_deferred
|06B692| JSR DrawSpriteShadow

|06B695| RTS

;===================================================================================================

pool AnvilSpawk

.anim
|06B696| db $00, $01, $02, $01, $02, $01, $FF

.timer
|06B69D| db   4,   1,   3,   2,   1,   1

endpool

;---------------------------------------------------------------------------------------------------

AnvilSpawk:
|06B6A3| JSR SpriteDraw_AnvilSpawk
|06B6A6| JSR CheckIfActive_bank06

|06B6A9| LDA.w $0DF0,X
|06B6AC| BNE .exit

|06B6AE| LDA.w $0D90,X
|06B6B1| TAY

|06B6B2| INC A
|06B6B3| AND.b #$07
|06B6B5| STA.w $0D90,X

|06B6B8| LDA.w .anim,Y
|06B6BB| BMI .terminate

|06B6BD| STA.w $0DC0,X

|06B6C0| LDA.w .timer,Y
|06B6C3| STA.w $0DF0,X

.exit
|06B6C6| RTS

;---------------------------------------------------------------------------------------------------

.terminate
|06B6C7| STZ.w $0DD0,X

|06B6CA| RTS

;===================================================================================================

pool SpawnAnvilSpawk

.offset_x
|06B6CB| db  15, -15

endpool

;---------------------------------------------------------------------------------------------------

SpawnAnvilSpawk:
|06B6CD| LDA.b #$1A ; SPRITE 1A

|06B6CF| JSL SpawnSpriteDynamically
|06B6D3| BMI .no_space

|06B6D5| PHX

|06B6D6| LDA.w $0DE0,X
|06B6D9| TAX

|06B6DA| LDA.b $00
|06B6DC| CLC
|06B6DD| ADC.w .offset_x,X
|06B6E0| STA.w $0D10,Y

|06B6E3| LDA.b $01
|06B6E5| STA.w $0D30,Y

|06B6E8| LDA.b $02
|06B6EA| CLC
|06B6EB| ADC.b #$02
|06B6ED| STA.w $0D00,Y

|06B6F0| LDA.b $03
|06B6F2| STA.w $0D20,Y

|06B6F5| LDA.b #$01
|06B6F7| STA.w $0E80,Y

|06B6FA| PLX

.no_space
|06B6FB| RTS

;===================================================================================================

pool SpriteDraw_AnvilSpawk

.oam_groups
|06B6FC| dw   0,   3 : db $AA, $41, $00, $02
|06B704| dw   0,  -1 : db $AA, $41, $00, $02

|06B70C| dw  -4,   0 : db $90, $01, $00, $00
|06B714| dw  12,   0 : db $90, $41, $00, $00

|06B71C| dw  -5,  -2 : db $91, $01, $00, $00
|06B724| dw  13,  -2 : db $91, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_AnvilSpawk:
|06B72C| LDA.b #$08
|06B72E| JSL AllocateOAMInRegionB

|06B732| LDA.w $0DC0,X

|06B735| ASL A
|06B736| ASL A
|06B737| ASL A
|06B738| ASL A

|06B739| ADC.b #<.oam_groups
|06B73B| STA.b $08

|06B73D| LDA.b #>.oam_groups
|06B73F| ADC.b #$00
|06B741| STA.b $09

|06B743| LDA.b #$02
|06B745| JSL TabulatedSpriteDraw

|06B749| RTS

;===================================================================================================

pool Sprite_1B_Arrow

.speed_x
|06B74A| db   0,   0 ; bleeds into next

.speed_y
|06B74C| db  16,  16,   0,   0, -16, -16,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Sprite_1B_Arrow:
|06B754| JSR SpriteDraw_Arrow
|06B757| JSR CheckIfActivePermissive_bank06

|06B75A| LDA.w $0DD0,X
|06B75D| CMP.b #$09
|06B75F| BNE SpriteArrow_KnockedAway

|06B761| LDA.w $0DF0,X
|06B764| BEQ SpriteArrow_InFlight

|06B766| DEC A
|06B767| BNE .live

|06B769| STZ.w $0DD0,X

|06B76C| RTS

;---------------------------------------------------------------------------------------------------

.live
|06B76D| CMP.b #$20
|06B76F| BCC .exit

|06B771| AND.b #$01
|06B773| BNE .exit

|06B775| LDA.b $1A
|06B777| ASL A
|06B778| AND.b #$04
|06B77A| ORA.w $0DE0,X
|06B77D| TAY

|06B77E| LDA.w .speed_x,Y
|06B781| STA.w $0D50,X

|06B784| LDA.w .speed_y,Y
|06B787| STA.w $0D40,X

|06B78A| JSR MoveSpriteXY_bank06

.exit
|06B78D| RTS

;===================================================================================================

SpriteArrow_InFlight:
|06B78E| JSR CheckDamageToLink_same_layer
|06B791| LDA.w $0E90,X
|06B794| BNE .continue

|06B796| JSR CheckSpriteTileCollision
|06B799| LDA.w $0E70,X
|06B79C| BEQ .continue

|06B79E| LDY.w $0D90,X
|06B7A1| BEQ .dont_break

|06B7A3| JSL SpriteArrow_Break

|06B7A7| RTS

.dont_break
|06B7A8| LDA.b #$30
|06B7AA| STA.w $0DF0,X

|06B7AD| LDA.b #$02
|06B7AF| STA.w $0D90,X

|06B7B2| LDA.b #$08 ; SFX2.08
|06B7B4| JSL QueueSpriteSFX2WithPan

|06B7B8| RTS

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_06B7B9:
|06B7B9| STZ.w $0DD0,X

|06B7BC| JSL PlaceWeaponTinkAtSprite

;---------------------------------------------------------------------------------------------------

.continue
|06B7C0| JMP.w MoveSpriteXY_bank06

;===================================================================================================

pool SpriteArrow_KnockedAway

.direction
|06B7C3| db $00
|06B7C4| db $02
|06B7C5| db $01
|06B7C6| db $03

endpool

;---------------------------------------------------------------------------------------------------

SpriteArrow_KnockedAway:
|06B7C7| LDA.w $0D80,X
|06B7CA| BNE .prepped

|06B7CC| JSR ApplyRicochet

|06B7CF| LDA.b #$18
|06B7D1| STA.w $0F80,X

|06B7D4| LDA.b #$FF
|06B7D6| STA.w $0DF0,X

|06B7D9| INC.w $0D80,X

|06B7DC| STZ.w $0EF0,X

;---------------------------------------------------------------------------------------------------

.prepped
|06B7DF| LDA.w $0DF0,X
|06B7E2| LSR A
|06B7E3| LSR A
|06B7E4| LSR A
|06B7E5| AND.b #$03
|06B7E7| TAY

|06B7E8| LDA.w .direction,Y
|06B7EB| STA.w $0DE0,X

|06B7EE| JSR MoveSpriteZ_bank06
|06B7F1| JSR MoveSpriteXY_bank06

|06B7F4| LDA.w $0F80,X
|06B7F7| SEC
|06B7F8| SBC.b #$02
|06B7FA| STA.w $0F80,X

|06B7FD| LDA.w $0F70,X
|06B800| BPL .exit

|06B802| STZ.w $0DD0,X

.exit
|06B805| RTS

;===================================================================================================

UNREACHABLE_06B806:
|06B806| RTS

;===================================================================================================

pool SpriteDraw_Arrow

.offset_x
|06B807| dw  -8,   0
|06B80B| dw   0,   8
|06B80F| dw   0,   0
|06B813| dw   0,   0

;---------------------------------------------------------------------------------------------------

.offset_y
|06B817| dw   0,   0
|06B81B| dw   0,   0
|06B81F| dw  -8,   0
|06B823| dw   0,   8

;---------------------------------------------------------------------------------------------------

.char
|06B827| db $3A, $3D
|06B829| db $3D, $3A
|06B82B| db $2A, $2B
|06B82D| db $2B, $2A

|06B82F| db $7C, $6C
|06B831| db $6C, $7C
|06B833| db $7B, $6B
|06B835| db $6B, $7B

|06B837| db $3A, $3B
|06B839| db $3B, $3A
|06B83B| db $2A, $3C
|06B83D| db $3C, $2A

|06B83F| db $81, $80
|06B841| db $80, $81
|06B843| db $91, $90
|06B845| db $90, $91

;---------------------------------------------------------------------------------------------------

.prop
|06B847| db $08, $08
|06B849| db $48, $48
|06B84B| db $08, $08
|06B84D| db $88, $88

|06B84F| db $09, $49
|06B851| db $09, $49
|06B853| db $09, $89
|06B855| db $09, $89

|06B857| db $08, $88
|06B859| db $C8, $48
|06B85B| db $08, $08
|06B85D| db $88, $88

|06B85F| db $49, $49
|06B861| db $09, $09
|06B863| db $89, $89
|06B865| db $09, $09

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Arrow:
|06B867| JSR GetScreenCoordinates

|06B86A| LDA.w $0DE0,X
|06B86D| ASL A
|06B86E| STA.b $06

|06B870| LDA.w $0D90,X
|06B873| ASL A
|06B874| ASL A
|06B875| ASL A
|06B876| STA.b $07

|06B878| PHX

|06B879| LDX.b #$01

.next_object
|06B87B| PHX

|06B87C| TXA
|06B87D| CLC
|06B87E| ADC.b $06
|06B880| PHA

|06B881| ASL A
|06B882| TAX

|06B883| REP #$20

|06B885| LDA.b $00
|06B887| CLC
|06B888| ADC.w .offset_x,X
|06B88B| STA.b ($90),Y

|06B88D| AND.w #$0100
|06B890| STA.b $0E

|06B892| LDA.b $02
|06B894| CLC
|06B895| ADC.w .offset_y,X

|06B898| INY
|06B899| STA.b ($90),Y

|06B89B| CLC
|06B89C| ADC.w #$0010
|06B89F| CMP.w #$0100

|06B8A2| SEP #$20
|06B8A4| BCC .on_screen

|06B8A6| LDA.b #$F0
|06B8A8| STA.b ($90),Y

.on_screen
|06B8AA| PLA
|06B8AB| CLC
|06B8AC| ADC.b $07
|06B8AE| TAX

|06B8AF| LDA.w .char,X
|06B8B2| INY
|06B8B3| STA.b ($90),Y

|06B8B5| LDA.w .prop,X
|06B8B8| ORA.b $05
|06B8BA| INY
|06B8BB| STA.b ($90),Y

|06B8BD| PHY

|06B8BE| TYA
|06B8BF| LSR A
|06B8C0| LSR A
|06B8C1| TAY

|06B8C2| LDA.b $0F
|06B8C4| STA.b ($92),Y

|06B8C6| PLY
|06B8C7| INY

|06B8C8| PLX
|06B8C9| DEX
|06B8CA| BPL .next_object

|06B8CC| PLX

|06B8CD| RTS

;===================================================================================================

CrystalSwitch_Palette:
|06B8CE| db $02, $04

;===================================================================================================

Sprite_1E_CrystalSwitch:
|06B8D0| LDA.w $0F50,X
|06B8D3| AND.b #$F1
|06B8D5| STA.w $0F50,X

|06B8D8| LDA.l $7EC172
|06B8DC| AND.b #$01
|06B8DE| TAY

|06B8DF| LDA.w CrystalSwitch_Palette,Y
|06B8E2| ORA.w $0F50,X
|06B8E5| STA.w $0F50,X

|06B8E8| JSR AllocateOAMDeferToPlayer
|06B8EB| JSR SpriteDraw_SingleLarge

|06B8EE| JSR CheckIfActive_bank06
|06B8F1| JSR CheckDamageToLink_same_layer
|06B8F4| BCC .not_touching

|06B8F6| JSL AbortMovement

|06B8FA| STZ.b $5E

|06B8FC| JSL RepelDash_long

.not_touching
|06B900| LDA.w $0DF0,X
|06B903| BNE .no_sparkle

|06B905| LDA.b $1A
|06B907| AND.b #$07
|06B909| STA.b $00
|06B90B| STZ.b $01

|06B90D| JSL GetRandomNumber
|06B911| AND.b #$07
|06B913| STA.b $02
|06B915| STZ.b $03

|06B917| JSL GarnishSpawn_Sparkle

|06B91B| LDA.b #$1F
|06B91D| STA.w $0DF0,X

.no_sparkle
|06B920| LDA.w $0EA0,X
|06B923| BNE .transitioning

|06B925| LDA.b $3C
|06B927| DEC A
|06B928| CMP.b #$08
|06B92A| BPL .exit

|06B92C| JSR CheckDamageFromLink

.exit
|06B92F| RTS

;---------------------------------------------------------------------------------------------------

.transitioning
|06B930| DEC.w $0EA0,X
|06B933| CMP.b #$0B
|06B935| BNE .no_color_change

|06B937| LDA.l $7EC172
|06B93B| EOR.b #$01
|06B93D| STA.l $7EC172

|06B941| LDA.b #$16
|06B943| STA.b $11

|06B945| LDA.b #$25 ; SFX3.25
|06B947| JSL QueueSpriteSFX3WithPan

.no_color_change
|06B94B| RTS

;===================================================================================================

Sprite_1F_SickKid:
|06B94C| JSL SpriteDraw_SickKid
|06B950| JSR CheckIfActive_bank06

|06B953| LDA.w $0D80,X
|06B956| JSL JumpTableLocal
|06B95A| dw SickKid_ISleep
|06B95C| dw SickKid_RealShit
|06B95E| dw SickKid_NothingButNet
|06B960| dw SickKid_OutOfShaqMemes

;===================================================================================================

SickKid_ISleep:
|06B962| JSL CheckIfLinkIsBusy
|06B966| BCS .zzzzzzzz

|06B968| JSR CheckDamageToLink_same_layer
|06B96B| BCC .zzzzzzzz

|06B96D| LDA.l $7EF35C
|06B971| ORA.l $7EF35D
|06B975| ORA.l $7EF35E
|06B979| ORA.l $7EF35F
|06B97D| CMP.b #$02
|06B97F| BCC .wakeywakey

|06B981| INC.w $0D80,X
|06B984| INC.w $02E4

.zzzzzzzz
|06B987| RTS

;---------------------------------------------------------------------------------------------------

.wakeywakey
|06B988| LDA.b #$04 ; MESSAGE 0104
|06B98A| LDY.b #$01
|06B98C| JSL ShowSolicitedMessage

|06B990| RTS

;===================================================================================================

pool SickKid_RealShit

.anim_step
|06B991| db $00, $01, $00, $01, $00, $01, $02, $FF

.timer
|06B999| db   8,  12,   8,  12,   8,  96,  16

endpool

;---------------------------------------------------------------------------------------------------

SickKid_RealShit:
|06B9A0| LDA.w $0DF0,X
|06B9A3| BNE .exit

|06B9A5| LDY.w $0D90,X

|06B9A8| LDA.w .anim_step,Y
|06B9AB| BMI .speak

|06B9AD| STA.w $0DC0,X

|06B9B0| LDA.w .timer,Y
|06B9B3| STA.w $0DF0,X

|06B9B6| INC.w $0D90,X

.exit
|06B9B9| RTS

;---------------------------------------------------------------------------------------------------

.speak
|06B9BA| LDA.b #$05 ; MESSAGE 0105
|06B9BC| LDY.b #$01
|06B9BE| JSL ShowMessageUnconditional

|06B9C2| INC.w $0D80,X

|06B9C5| RTS

;===================================================================================================

SickKid_NothingButNet:
|06B9C6| LDY.b #$21 ; ITEMGET 21
|06B9C8| STZ.w $02E9

|06B9CB| PHX

|06B9CC| JSL GrantItemReceipt

|06B9D0| PLX

|06B9D1| INC.w $0D80,X

|06B9D4| STZ.w $02E4

|06B9D7| RTS

;===================================================================================================

SickKid_OutOfShaqMemes:
|06B9D8| LDA.b #$01
|06B9DA| STA.w $0DC0,X

|06B9DD| LDA.b #$06 ; MESSAGE 0106
|06B9DF| LDY.b #$01
|06B9E1| JSL ShowSolicitedMessage

|06B9E5| RTS

;===================================================================================================

WaterSwitch_Timer:
|06B9E6| db  40,   6,   3,   3
|06B9EA| db   3,   5,   1,   1
|06B9EE| db   3,  12

;===================================================================================================

WaterSwitch_Position:
|06B9F0| db $00, $01, $02, $03
|06B9F4| db $04, $05, $05, $06
|06B9F8| db $07, $06

;===================================================================================================

Sprite_21_WaterSwitch:
|06B9FA| JSR WaterSwitch_Main
|06B9FD| JSR CheckIfActive_bank06

|06BA00| LDA.w $0D80,X
|06BA03| CMP.b #$02
|06BA05| BEQ .exit

|06BA07| JSL JumpTableLocal
|06BA0B| dw WaterSwitch_Untoggled
|06BA0D| dw WaterSwitch_ReleaseGate

;---------------------------------------------------------------------------------------------------

.exit
|06BA0F| RTS

;===================================================================================================

WaterSwitch_Untoggled:
|06BA10| LDA.w $0DB0,X
|06BA13| BEQ .reset_timer

|06BA15| DEC.w $0DA0,X

|06BA18| LDA.w $0DA0,X
|06BA1B| BNE .delay

|06BA1D| INC.w $0D80,X

.delay
|06BA20| LDA.b $1A
|06BA22| AND.b #$03
|06BA24| BNE .exit

|06BA26| LDA.b #$22 ; SFX2.22
|06BA28| JSL QueueSpriteSFX2WithPan

.exit
|06BA2C| RTS

;---------------------------------------------------------------------------------------------------

.reset_timer
|06BA2D| LDA.b #$30
|06BA2F| STA.w $0DA0,X

|06BA32| RTS

;===================================================================================================

WaterSwitch_ReleaseGate:
|06BA33| LDA.w $0DF0,X
|06BA36| BNE .exit

|06BA38| INC.w $0D90,X

|06BA3B| LDY.w $0D90,X
|06BA3E| CPY.b #$0A
|06BA40| BNE .delay_release

|06BA42| INC.w $0D80,X
|06BA45| INC.w $0642

|06BA48| LDA.b #$25 ; SFX3.25
|06BA4A| JSL QueueSpriteSFX3WithPan

|06BA4E| RTS

.delay_release
|06BA4F| LDA.w WaterSwitch_Timer,Y
|06BA52| STA.w $0DF0,X

|06BA55| LDA.w WaterSwitch_Position,Y
|06BA58| STA.w $0DE0,X

|06BA5B| LDA.b #$22 ; SFX2.22
|06BA5D| JSL QueueSpriteSFX2WithPan

.exit
|06BA61| RTS

;===================================================================================================

WaterSwitch_OAMData:
.step_0
|06BA62| db $04, $14, $DC, $20
|06BA66| db $04, $0C, $DD, $20
|06BA6A| db $04, $0C, $DD, $20
|06BA6E| db $04, $0C, $DD, $20
|06BA72| db $00, $00, $CA, $20

.step_1
|06BA76| db $03, $0C, $DD, $20
|06BA7A| db $03, $14, $DC, $20
|06BA7E| db $03, $14, $DC, $20
|06BA82| db $03, $14, $DC, $20
|06BA86| db $00, $00, $CA, $20

.step_2
|06BA8A| db $F8, $08, $EA, $20
|06BA8E| db $00, $08, $EB, $20
|06BA92| db $F8, $10, $FA, $20
|06BA96| db $00, $10, $FB, $20
|06BA9A| db $00, $00, $CA, $20

.step_3
|06BA9E| db $F4, $04, $CC, $20
|06BAA2| db $FC, $04, $CD, $20
|06BAA6| db $FC, $04, $CD, $20
|06BAAA| db $FC, $04, $CD, $20
|06BAAE| db $00, $00, $CA, $20

.step_4
|06BAB2| db $F6, $04, $CC, $20
|06BAB6| db $FC, $04, $CD, $20
|06BABA| db $FC, $04, $CD, $20
|06BABE| db $FC, $04, $CD, $20
|06BAC2| db $00, $00, $CA, $20

.step_5
|06BAC6| db $F8, $04, $CC, $20
|06BACA| db $FC, $04, $CD, $20
|06BACE| db $FC, $04, $CD, $20
|06BAD2| db $FC, $04, $CD, $20
|06BAD6| db $00, $00, $CA, $20

.step_6
|06BADA| db $04, $03, $E2, $20
|06BADE| db $FA, $04, $CC, $20
|06BAE2| db $FC, $04, $CD, $20
|06BAE6| db $FC, $04, $CD, $20
|06BAEA| db $00, $00, $CA, $20

.step_7
|06BAEE| db $04, $03, $F1, $20
|06BAF2| db $FA, $04, $CC, $20
|06BAF6| db $FC, $04, $CD, $20
|06BAFA| db $FC, $04, $CD, $20
|06BAFE| db $00, $00, $CA, $20

;===================================================================================================

WaterSwitch_Hitbox:
|06BB02| db $08, $06
|06BB04| db $10, $10
|06BB06| db $10, $08
|06BB08| db $10, $08
|06BB0A| db $10, $08
|06BB0C| db $10, $08
|06BB0E| db $10, $03
|06BB10| db $10, $08

;===================================================================================================

WaterSwitch_OAMDataPointer:
|06BB12| dw WaterSwitch_OAMData.step_0
|06BB14| dw WaterSwitch_OAMData.step_1
|06BB16| dw WaterSwitch_OAMData.step_2
|06BB18| dw WaterSwitch_OAMData.step_3
|06BB1A| dw WaterSwitch_OAMData.step_4
|06BB1C| dw WaterSwitch_OAMData.step_5
|06BB1E| dw WaterSwitch_OAMData.step_6
|06BB20| dw WaterSwitch_OAMData.step_7

;===================================================================================================

WaterSwitch_Main:
|06BB22| JSR AllocateOAMDeferToPlayer
|06BB25| JSR GetScreenCoordinates

|06BB28| LDA.w $0F50,X

|06BB2B| LDY.w $0ABD
|06BB2E| BEQ .translucency_enabled

|06BB30| ORA.b #$0E
|06BB32| BRA .continue

.translucency_enabled
|06BB34| AND.b #$F1

;---------------------------------------------------------------------------------------------------

.continue
|06BB36| STA.w $0F50,X
|06BB39| STA.b $02

|06BB3B| LDA.w $0DA0,X

|06BB3E| LSR A
|06BB3F| LSR A

|06BB40| AND.b #$03
|06BB42| STA.b $01

|06BB44| LDA.b #$00
|06BB46| XBA
|06BB47| LDA.w $0DE0,X
|06BB4A| ASL A

|06BB4B| PHX

|06BB4C| REP #$31

|06BB4E| PHB

|06BB4F| TAY

|06BB50| LDX.w WaterSwitch_OAMDataPointer,Y

|06BB53| LDA.b $90
|06BB55| ADC.w #$0004
|06BB58| STA.b $90

|06BB5A| TAY

|06BB5B| INC.b $92

|06BB5D| LDA.w #$0013
|06BB60| MVN ^WaterSwitch_OAMDataPointer, $00

|06BB63| PLB

;---------------------------------------------------------------------------------------------------

|06BB64| SEP #$20

|06BB66| LDY.b $90

|06BB68| LDA.b $01
|06BB6A| EOR.b #$FF
|06BB6C| INC A

|06BB6D| CLC
|06BB6E| ADC.w $0FA8
|06BB71| TAX

|06BB72| CLC
|06BB73| ADC.w $0000,Y
|06BB76| STA.w $0000,Y

|06BB79| TXA
|06BB7A| CLC
|06BB7B| ADC.w $0004,Y
|06BB7E| STA.w $0004,Y

|06BB81| TXA
|06BB82| CLC
|06BB83| ADC.w $0008,Y
|06BB86| STA.w $0008,Y

|06BB89| TXA
|06BB8A| CLC
|06BB8B| ADC.w $000C,Y
|06BB8E| STA.w $000C,Y

|06BB91| LDA.w $0FA8
|06BB94| CLC
|06BB95| ADC.w $0010,Y
|06BB98| STA.w $0010,Y

;---------------------------------------------------------------------------------------------------

|06BB9B| LSR.b $01

|06BB9D| LDA.w $0FA9
|06BBA0| SEC
|06BBA1| SBC.b $01
|06BBA3| TAX

|06BBA4| CLC
|06BBA5| ADC.w $0001,Y
|06BBA8| STA.w $0001,Y

|06BBAB| TXA
|06BBAC| CLC
|06BBAD| ADC.w $0005,Y
|06BBB0| STA.w $0005,Y

|06BBB3| TXA
|06BBB4| CLC
|06BBB5| ADC.w $0009,Y
|06BBB8| STA.w $0009,Y

|06BBBB| TXA
|06BBBC| CLC
|06BBBD| ADC.w $000D,Y
|06BBC0| STA.w $000D,Y

|06BBC3| LDA.w $0FA9
|06BBC6| CLC
|06BBC7| ADC.w $0011,Y
|06BBCA| STA.w $0011,Y

;---------------------------------------------------------------------------------------------------

|06BBCD| LDA.b $02
|06BBCF| ORA.w $0003,Y
|06BBD2| STA.w $0003,Y

|06BBD5| LDA.b $02
|06BBD7| ORA.w $0007,Y
|06BBDA| STA.w $0007,Y

|06BBDD| LDA.b $02
|06BBDF| ORA.w $000B,Y
|06BBE2| STA.w $000B,Y

|06BBE5| LDA.b $02
|06BBE7| ORA.w $000F,Y
|06BBEA| STA.w $000F,Y

|06BBED| LDA.b $02
|06BBEF| ORA.w $0013,Y
|06BBF2| STA.w $0013,Y

;---------------------------------------------------------------------------------------------------

|06BBF5| REP #$31

|06BBF7| LDA.w #$0000
|06BBFA| TAY
|06BBFB| STA.b ($92),Y

|06BBFD| INY
|06BBFE| INY
|06BBFF| STA.b ($92),Y

|06BC01| LDA.w #$0200
|06BC04| INY
|06BC05| STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

|06BC07| SEP #$30

|06BC09| PLX

|06BC0A| LDY.b #$FF
|06BC0C| LDA.b #$04
|06BC0E| JSR CorrectOAMEntries

|06BC11| LDA.w $0F20,X
|06BC14| CMP.b $EE
|06BC16| BEQ .same_layer

|06BC18| JMP.w .exit

;---------------------------------------------------------------------------------------------------

.same_layer
|06BC1B| STZ.w $0DB0,X

|06BC1E| LDA.w $0DE0,X
|06BC21| ASL A
|06BC22| ASL A
|06BC23| ASL A
|06BC24| ASL A
|06BC25| TAY

|06BC26| LDA.w WaterSwitch_OAMData+0,Y
|06BC29| CLC
|06BC2A| ADC.w $0D10,X
|06BC2D| STA.b $04

;---------------------------------------------------------------------------------------------------

|06BC2F| STZ.b $0A

|06BC31| LDA.w WaterSwitch_OAMData+0,Y
|06BC34| BPL .positive_x

|06BC36| DEC.b $0A

.positive_x
|06BC38| LDA.b $0A
|06BC3A| ADC.w $0D30,X
|06BC3D| STA.b $0A

|06BC3F| LDA.w WaterSwitch_OAMData+1,Y
|06BC42| CLC
|06BC43| ADC.w $0D00,X
|06BC46| STA.b $05

;---------------------------------------------------------------------------------------------------

|06BC48| STZ.b $0B

|06BC4A| LDA.w WaterSwitch_OAMData+1,Y
|06BC4D| BPL .positive_y

|06BC4F| DEC.b $0B

.positive_y
|06BC51| LDA.b $0B
|06BC53| ADC.w $0D20,X
|06BC56| STA.b $0B

;---------------------------------------------------------------------------------------------------

|06BC58| LDA.w $0DE0,X
|06BC5B| ASL A
|06BC5C| TAY

|06BC5D| LDA.w WaterSwitch_Hitbox+0,Y
|06BC60| STA.b $06

|06BC62| LDA.w WaterSwitch_Hitbox+1,Y
|06BC65| STA.b $07

|06BC67| JSR SetupLinkHitbox
|06BC6A| JSR CheckIfHitboxesOverlap
|06BC6D| BCC .no_contact

;---------------------------------------------------------------------------------------------------

|06BC6F| LDA.w $0D00,X
|06BC72| PHA

|06BC73| CLC
|06BC74| ADC.b #$13
|06BC76| STA.w $0D00,X

|06BC79| LDA.w $0D20,X
|06BC7C| PHA

|06BC7D| ADC.b #$00
|06BC7F| STA.w $0D20,X

|06BC82| JSR GetDirectionTowardsLink

|06BC85| PLA
|06BC86| STA.w $0D20,X

|06BC89| PLA
|06BC8A| STA.w $0D00,X

|06BC8D| CPY.b #$00
|06BC8F| BNE .contact

|06BC91| LDA.b $2F
|06BC93| CMP.b #$04
|06BC95| BNE .contact

|06BC97| INC.w $0DB0,X
|06BC9A| BRA .contact

;---------------------------------------------------------------------------------------------------

.no_contact
|06BC9C| JSR CheckDamageToLink_same_layer
|06BC9F| BCC .exit

;---------------------------------------------------------------------------------------------------

.contact
|06BCA1| JSL AbortMovement

|06BCA5| STZ.b $5E

|06BCA7| JSL RepelDash_long

.exit
|06BCAB| RTS

;===================================================================================================

Sprite_39_Locksmith:
|06BCAC| JSR SpriteDraw_Locksmith
|06BCAF| JSR CheckIfActive_bank06
|06BCB2| JSL BehaveAsBarrier

|06BCB6| LDA.w $0D80,X
|06BCB9| JSL JumpTableLocal
|06BCBD| dw Locksmith_Chillin
|06BCBF| dw Locksmith_FollowLink
|06BCC1| dw Locksmith_OfferService
|06BCC3| dw Locksmith_RespondToAnswer
|06BCC5| dw Locksmith_JustPromiseOkay
|06BCC7| dw Locksmith_SilentDismay

;===================================================================================================

Locksmith_Chillin:
|06BCC9| LDA.b #$07 ; MESSAGE 0107
|06BCCB| LDY.b #$01
|06BCCD| JSL ShowSolicitedMessage

|06BCD1| LDA.w $0D10,X
|06BCD4| PHA

|06BCD5| SEC
|06BCD6| SBC.b #$10
|06BCD8| STA.w $0D10,X

|06BCDB| JSR Get16BitSpriteCoords

|06BCDE| LDA.b #$01
|06BCE0| STA.w $0D50,X
|06BCE3| STA.w $0D40,X

|06BCE6| JSL CheckSpriteTileCollision_long
|06BCEA| BNE .dont_stalk_link

|06BCEC| INC.w $0D80,X

|06BCEF| LDA.l $7EF3CC
|06BCF3| CMP.b #$00
|06BCF5| BEQ .dont_stalk_link

|06BCF7| LDA.b #$05
|06BCF9| STA.w $0D80,X

.dont_stalk_link
|06BCFC| PLA
|06BCFD| STA.w $0D10,X

|06BD00| RTS

;===================================================================================================

Locksmith_FollowLink:
|06BD01| LDA.b #$09 ; FOLLOWER 09
|06BD03| STA.l $7EF3CC

|06BD07| PHX

|06BD08| STZ.w $02F9

|06BD0B| JSL LoadFollowerGraphics
|06BD0F| JSL InitializeFollower

|06BD13| PLX

|06BD14| LDA.b #$40
|06BD16| STA.w $02CD
|06BD19| STZ.w $02CE

|06BD1C| STZ.w $0DD0,X

|06BD1F| RTS

;===================================================================================================

Locksmith_OfferService:
|06BD20| JSL CheckIfLinkIsBusy
|06BD24| BCS .exit

|06BD26| LDA.l $7EF3D3
|06BD2A| BEQ .dont_have_chest

|06BD2C| LDA.b #$09 ; MESSAGE 0109
|06BD2E| LDY.b #$01
|06BD30| JSL ShowSolicitedMessage
|06BD34| BCC .exit

|06BD36| BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_have_chest
|06BD38| LDA.b #$09 ; MESSAGE 0109
|06BD3A| LDY.b #$01
|06BD3C| JSL ShowMessageOnContact
|06BD40| BCC .exit

.continue
|06BD42| INC.w $0D80,X

.exit
|06BD45| RTS

;===================================================================================================

Locksmith_RespondToAnswer:
|06BD46| LDA.w $1CE8
|06BD49| BNE .rejected

|06BD4B| LDA.l $7EF3D3
|06BD4F| BEQ .give_bottle

|06BD51| LDA.b #$0C ; MESSAGE 010C
|06BD53| LDY.b #$01
|06BD55| JSL ShowMessageUnconditional

|06BD59| LDA.b #$02
|06BD5B| STA.w $0D80,X

|06BD5E| RTS

;---------------------------------------------------------------------------------------------------

.give_bottle
|06BD5F| LDY.b #$16 ; ITEMGET 16
|06BD61| STZ.w $02E9
|06BD64| JSL GrantItemReceipt

|06BD68| LDA.l $7EF3C9
|06BD6C| ORA.b #$10
|06BD6E| STA.l $7EF3C9

|06BD72| INC.w $0D80,X

|06BD75| LDA.b #$00
|06BD77| STA.l $7EF3CC

|06BD7B| RTS

;---------------------------------------------------------------------------------------------------

.rejected
|06BD7C| LDA.b #$0A ; MESSAGE 010A
|06BD7E| LDY.b #$01
|06BD80| JSL ShowMessageUnconditional

|06BD84| LDA.b #$02
|06BD86| STA.w $0D80,X

|06BD89| RTS

;===================================================================================================

Locksmith_JustPromiseOkay:
|06BD8A| LDA.b #$0B ; MESSAGE 010B
|06BD8C| LDY.b #$01
|06BD8E| JSL ShowSolicitedMessage

|06BD92| RTS

;===================================================================================================

Locksmith_SilentDismay:
|06BD93| LDA.b #$07 ; MESSAGE 0107
|06BD95| LDY.b #$01
|06BD97| JSL ShowSolicitedMessage

|06BD9B| RTS

;===================================================================================================

pool SpriteDraw_Locksmith

.oam_groups
|06BD9C| dw   0,  -8 : db $EA, $00, $00, $02
|06BDA4| dw   0,   0 : db $EC, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Locksmith:
|06BDAC| LDA.b #$02
|06BDAE| STA.b $06
|06BDB0| STZ.b $07

|06BDB2| LDA.b #<.oam_groups
|06BDB4| STA.b $08

|06BDB6| LDA.b #>.oam_groups
|06BDB8| STA.b $09

|06BDBA| JSL TabulatedSpriteDraw.player_deferred

|06BDBE| JMP.w DrawSpriteShadow

;===================================================================================================

Sprite_2B_Hobo:
|06BDC1| LDA.w $0E80,X
|06BDC4| JSL JumpTableLocal
|06BDC8| dw Hobo
|06BDCA| dw SnotBubble
|06BDCC| dw Campfire
|06BDCE| dw AirPollution

;===================================================================================================

Hobo:
|06BDD0| JSL SpriteDraw_Hobo
|06BDD4| JSR CheckIfActive_bank06

|06BDD7| LDA.b #$03
|06BDD9| STA.w $0F60,X

|06BDDC| JSR CheckDamageToLink_same_layer
|06BDDF| BCC .no_contact

|06BDE1| JSL AbortMovement

|06BDE5| STZ.b $5E

|06BDE7| JSL CancelDash_long

.no_contact
|06BDEB| LDA.w $0D80,X
|06BDEE| JSL JumpTableLocal
|06BDF2| dw Hobo_Sleep
|06BDF4| dw Hobo_Awoken
|06BDF6| dw Hobo_GiveBottle
|06BDF8| dw Hobo_BackToSleep

;===================================================================================================

Hobo_Sleep:
|06BDFA| LDA.b #$07
|06BDFC| STA.w $0F60,X

|06BDFF| JSR CheckDamageToLink_same_layer
|06BE02| BCC .keep_snoozing

|06BE04| LDA.b $F6
|06BE06| BPL .keep_snoozing

|06BE08| INC.w $0D80,X

|06BE0B| LDY.w $0E90,X

|06BE0E| LDA.b #$04
|06BE10| STA.w $0DF0,Y

|06BE13| LDA.b #$01
|06BE15| STA.w $02E4

;---------------------------------------------------------------------------------------------------

.keep_snoozing
|06BE18| LDA.w $0E10,X
|06BE1B| BNE .exit

|06BE1D| LDA.b #$A0
|06BE1F| STA.w $0E10,X

|06BE22| JSR ExpelSnotBubble

|06BE25| TYA
|06BE26| STA.w $0E90,X

.exit
|06BE29| RTS

;===================================================================================================

pool Hobo_Awoken

.anim_step
|06BE2A| db $00, $01, $00, $01, $00, $01, $02, $FF

.timer
|06BE32| db   6,   2,   6,   6,   2, 100,  30

endpool

;---------------------------------------------------------------------------------------------------

Hobo_Awoken:
|06BE39| LDA.w $0DF0,X
|06BE3C| BNE .exit

|06BE3E| LDY.w $0D90,X

|06BE41| LDA.w .anim_step,Y
|06BE44| BMI .fully_awake

|06BE46| STA.w $0DC0,X

|06BE49| LDA.w .timer,Y
|06BE4C| STA.w $0DF0,X

|06BE4F| INC.w $0D90,X

.exit
|06BE52| RTS

;---------------------------------------------------------------------------------------------------

.fully_awake
|06BE53| LDA.b #$D7 ; MESSAGE 00D7
|06BE55| LDY.b #$00
|06BE57| JSL ShowMessageUnconditional

|06BE5B| INC.w $0D80,X

|06BE5E| RTS

;===================================================================================================

Hobo_GiveBottle:
|06BE5F| INC.w $0D80,X

|06BE62| LDA.b #$01
|06BE64| STA.w $0DC0,X

|06BE67| PHX

|06BE68| LDX.b $8A

|06BE6A| LDA.l $7EF280,X
|06BE6E| ORA.b #$20
|06BE70| STA.l $7EF280,X

|06BE74| LDY.b #$16 ; ITEMGET 16
|06BE76| STZ.w $02E9
|06BE79| JSL GrantItemReceipt

|06BE7D| LDA.l $7EF3C9
|06BE81| ORA.b #$01
|06BE83| STA.l $7EF3C9

|06BE87| PLX

|06BE88| RTS

;===================================================================================================

Hobo_BackToSleep:
|06BE89| STZ.w $02E4

|06BE8C| STZ.w $0DC0,X

|06BE8F| LDA.w $0DF0,X
|06BE92| BNE .exit

|06BE94| LDA.b #$A0
|06BE96| STA.w $0DF0,X

|06BE99| JSR ExpelSnotBubble

.exit
|06BE9C| RTS

;===================================================================================================

SpawnBonusHobo:
|06BE9D| LDA.b #$2B ; SPRITE 2B
|06BE9F| JSL SpawnSpriteDynamically
|06BEA3| BMI .no_space

|06BEA5| JSL SetSpawnedSpriteCoordinates

|06BEA9| LDA.b #$00
|06BEAB| STA.w $0E80,Y
|06BEAE| STA.w $0BA0,Y

.no_space
|06BEB1| RTS

;===================================================================================================

UNREACHABLE_06BEB2:
|06BEB2| db $01, $FF

;===================================================================================================

SnotBubble:
|06BEB4| LDA.b #$04
|06BEB6| JSL AllocateOAMInRegionC

|06BEBA| JSR SpriteDraw_SingleSmall
|06BEBD| JSR CheckIfActive_bank06

|06BEC0| LDA.b $1A

|06BEC2| LSR A
|06BEC3| LSR A
|06BEC4| LSR A
|06BEC5| LSR A

|06BEC6| AND.b #$01

|06BEC8| INC A
|06BEC9| INC A

|06BECA| STA.w $0DC0,X

|06BECD| LDA.w $0E00,X
|06BED0| BNE .delay

|06BED2| INC.w $0DC0,X

|06BED5| JSR MoveSpriteZ_bank06

|06BED8| LDA.w $0DF0,X
|06BEDB| BNE .delay

|06BEDD| STZ.w $0DD0,X

.delay
|06BEE0| LDA.w $0DF0,X
|06BEE3| CMP.b #$04
|06BEE5| BCS .exit

|06BEE7| LDA.b #$03
|06BEE9| STA.w $0DC0,X

.exit
|06BEEC| RTS

;===================================================================================================

ExpelSnotBubble:
|06BEED| LDA.b #$2B ; SPRITE 2B
|06BEEF| JSL SpawnSpriteDynamically
|06BEF3| BMI EXIT_06BF14

|06BEF5| JSL SetSpawnedSpriteCoordinates

|06BEF9| LDA.b #$01
|06BEFB| STA.w $0E80,Y

|06BEFE| LDA.b #$02
|06BF00| STA.w $0F80,Y

|06BF03| LDA.b #$60
|06BF05| STA.w $0DF0,Y

|06BF08| LSR A
|06BF09| STA.w $0E00,Y
|06BF0C| STA.w $0BA0,Y

;===================================================================================================

ZeroOutOAMAllocation:
|06BF0F| LDA.b #$00
|06BF11| STA.w $0E40,Y

;---------------------------------------------------------------------------------------------------

#EXIT_06BF14:
|06BF14| RTS

;===================================================================================================

Campfire:
|06BF15| JSR SpriteDraw_SingleSmall
|06BF18| JSR CheckIfActive_bank06

|06BF1B| LDA.b $1A

|06BF1D| LSR A
|06BF1E| LSR A
|06BF1F| LSR A

|06BF20| AND.b #$03
|06BF22| STA.b $00

|06BF24| AND.b #$01
|06BF26| STA.w $0DC0,X

|06BF29| LDA.b $00

|06BF2B| ASL A
|06BF2C| ASL A
|06BF2D| ASL A
|06BF2E| ASL A

|06BF2F| AND.b #$40
|06BF31| STA.b $00

|06BF33| LDA.w $0F50,X
|06BF36| AND.b #$BF
|06BF38| ORA.b $00
|06BF3A| STA.w $0F50,X

|06BF3D| LDA.w $0DF0,X
|06BF40| BNE .exit

|06BF42| JSR PolluteTheAirWithSmoke

|06BF45| LDA.b #$2F
|06BF47| STA.w $0DF0,X

.exit
|06BF4A| RTS

;===================================================================================================

SpawnCampfire:
|06BF4B| LDA.b #$2B ; SPRITE 2B
|06BF4D| JSL SpawnSpriteDynamically
|06BF51| BMI .no_space

|06BF53| LDA.b #$94
|06BF55| STA.w $0D10,Y

|06BF58| LDA.b #$01
|06BF5A| STA.w $0D30,Y

|06BF5D| LDA.b #$3F
|06BF5F| STA.w $0D00,Y

|06BF62| LDA.b #$00
|06BF64| STA.w $0D20,Y

|06BF67| LDA.b #$02
|06BF69| STA.w $0E80,Y
|06BF6C| STA.w $0BA0,Y

|06BF6F| JSR ZeroOutOAMAllocation

|06BF72| LDA.w $0F50,Y
|06BF75| AND.b #$F1
|06BF77| ORA.b #$02
|06BF79| STA.w $0F50,Y

.no_space
|06BF7C| RTS

;===================================================================================================

pool AirPollution

.flip
|06BF7D| db $00, $40, $80, $C0

endpool

;---------------------------------------------------------------------------------------------------

AirPollution:
|06BF81| LDA.b #$06
|06BF83| STA.w $0DC0,X

|06BF86| JSR SpriteDraw_SingleSmall
|06BF89| JSR CheckIfActive_bank06

|06BF8C| JSR MoveSpriteXY_bank06
|06BF8F| JSR MoveSpriteZ_bank06

|06BF92| LDA.b $1A

|06BF94| LSR A
|06BF95| LSR A
|06BF96| LSR A
|06BF97| LSR A

|06BF98| AND.b #$03
|06BF9A| TAY

|06BF9B| LDA.w $0F50,X
|06BF9E| AND.b #$3F
|06BFA0| ORA.w .flip,Y
|06BFA3| STA.w $0F50,X

|06BFA6| LDA.w $0DF0,X
|06BFA9| BNE .exit

|06BFAB| STZ.w $0DD0,X

.exit
|06BFAE| RTS

;===================================================================================================

PolluteTheAirWithSmoke:
|06BFAF| LDA.b #$2B ; SPRITE 2B
|06BFB1| JSL SpawnSpriteDynamically
|06BFB5| BMI .exit

|06BFB7| JSL SetSpawnedSpriteCoordinates

|06BFBB| LDA.b $02
|06BFBD| SEC
|06BFBE| SBC.b #$04
|06BFC0| STA.w $0D00,Y

|06BFC3| LDA.b $03
|06BFC5| SBC.b #$00
|06BFC7| STA.w $0D20,Y

|06BFCA| LDA.b #$03
|06BFCC| STA.w $0E80,Y

|06BFCF| LDA.b #$07
|06BFD1| STA.w $0F80,Y

|06BFD4| LDA.b #$60
|06BFD6| STA.w $0DF0,Y
|06BFD9| STA.w $0BA0,Y

|06BFDC| JSR ZeroOutOAMAllocation

.exit
|06BFDF| RTS

;===================================================================================================

Sprite_73_UncleAndPriest_bounce:
|06BFE0| JSL Sprite_73_UncleAndPriest

|06BFE4| RTS

;===================================================================================================

SpritePrep_UncleAndPriest_bounce:
|06BFE5| JSL SpritePrep_UncleAndPriest

|06BFE9| RTS

;===================================================================================================

SpriteModule_Active_bank05_bounce:
|06BFEA| JSL SpriteModule_Active_bank05

|06BFEE| RTS

;===================================================================================================

SpriteModule_Active_bank1E_bounce:
|06BFEF| JSL SpriteModule_Active_bank1E

|06BFF3| RTS

;===================================================================================================

SpriteModule_Active_bank1D_bounce:
|06BFF4| JSL SpriteModule_Active_bank1D

|06BFF8| RTS

;===================================================================================================

SpritePrep_OldMan_bounce:
|06BFF9| JSL SpritePrep_OldMan

|06BFFD| RTS

;===================================================================================================

TutorialGuardOrBarrier_bounce:
|06BFFE| JSL TutorialGuardOrBarrier

|06C002| RTS

;===================================================================================================

PullSwitch_bounce:
|06C003| JSL PullSwitch

|06C007| RTS

;===================================================================================================

SomariaPlatformAndPipe_bounce:
|06C008| JSL SomariaPlatformAndPipe

|06C00C| RTS

;===================================================================================================

Sprite_F2_MedallionTablet_bounce:
|06C00D| JSL Sprite_F2_MedallionTablet

|06C011| RTS

;===================================================================================================

Sprite_32_ArguingBros_bounce:
|06C012| JSL Sprite_32_ArguingBros

|06C016| RTS

;===================================================================================================

Sprite_33_RupeePull_bounce:
|06C017| JSL Sprite_33_RupeePull

|06C01B| RTS

;===================================================================================================

Sprite_14_ThievesTownGrate_bounce:
|06C01C| JSL Sprite_14_ThievesTownGrate

|06C020| RTS

;===================================================================================================

Sprite_34_YoungSnitch_bounce:
|06C021| JSL Sprite_34_YoungSnitch

|06C025| RTS

;===================================================================================================

SpritePrep_Snitch_bounce_2:
|06C026| JSL SpritePrep_Snitch

|06C02A| RTS

;===================================================================================================

Sprite_35_Innkeeper_bounce:
|06C02B| JSL Sprite_35_Innkeeper

|06C02F| RTS

;===================================================================================================

SpritePrep_Snitch_bounce_3:
|06C030| JSL SpritePrep_Snitch

|06C034| RTS

;===================================================================================================

Sprite_36_Witch_bounce:
|06C035| JSL Sprite_36_Witch

|06C039| RTS

;===================================================================================================

Sprite_37_Waterfall_bounce:
|06C03A| JSL Sprite_37_Waterfall

|06C03E| RTS

;===================================================================================================

Sprite_38_EyeStatue_bounce:
|06C03F| JSL Sprite_38_EyeStatue

|06C043| RTS

;===================================================================================================

Sprite_3A_MagicBat_bounce:
|06C044| JSL Sprite_3A_MagicBat

|06C048| RTS

;===================================================================================================

Sprite_3B_BonkItem_bounce:
|06C049| JSL Sprite_3B_BonkItem

|06C04D| RTS

;===================================================================================================

Sprite_3C_KidInKak_bounce:
|06C04E| JSL Sprite_3C_KidInKak

|06C052| RTS

;===================================================================================================

Sprite_3D_OldSnitch_bounce:
|06C053| JSL Sprite_3D_OldSnitch

|06C057| RTS

;===================================================================================================

Sprite_74_RunningBoy_bounce:
|06C058| JSL Sprite_74_RunningBoy

|06C05C| RTS

;===================================================================================================

SpritePrep_RunningBoy_bounce:
|06C05D| JSL SpritePrep_RunningBoy

|06C061| RTS

;===================================================================================================

Sprite_75_BottleMerchant_bounce:
|06C062| JSL Sprite_75_BottleMerchant

|06C066| RTS

;===================================================================================================

Sprite_76_Zelda_bounce:
|06C067| JSL Sprite_76_Zelda

|06C06B| RTS

;===================================================================================================

SpritePrep_Zelda_bounce:
|06C06C| JSL SpritePrep_Zelda

|06C070| RTS

;===================================================================================================

Sprite_78_MrsSahasrahla_bounce:
|06C071| JSL Sprite_78_MrsSahasrahla

|06C075| RTS

;===================================================================================================

Sprite_E7_Mushroom_bounce:
|06C076| JSL Sprite_E7_Mushroom

|06C07A| RTS

;===================================================================================================

SpritePrep_Mushroom_bounce:
|06C07B| JSL SpritePrep_Mushroom

|06C07F| RTS

;===================================================================================================

Sprite_E8_FakeMasterSword_bounce:
|06C080| JSL Sprite_E8_FakeMasterSword

|06C084| RTS

;---------------------------------------------------------------------------------------------------

SpritePrep_FakeMasterSword_bounce:
|06C085| JSL SpritePrep_FakeMasterSword

|06C089| RTS

;===================================================================================================

Sprite_16_Elder_bounce:
|06C08A| JSL Sprite_16_Elder

|06C08E| RTS

;===================================================================================================

Sprite_E9_MagicShopAssistant_bounce:
|06C08F| JSL Sprite_E9_MagicShopAssistant

|06C093| RTS

;===================================================================================================

SpritePrep_MagicShopAssistant_bounce:
|06C094| JSL SpritePrep_MagicShopAssistant

|06C098| RTS

;===================================================================================================

Sprite_EA_HeartContainer_bounce:
|06C099| JSL Sprite_EA_HeartContainer

|06C09D| RTS

;===================================================================================================

SpritePrep_HeartContainer_bounce:
|06C09E| JSL SpritePrep_HeartContainer

|06C0A2| RTS

;===================================================================================================

Sprite_EB_HeartPiece_bounce:
|06C0A3| JSL Sprite_EB_HeartPiece

|06C0A7| RTS

;===================================================================================================

SpritePrep_HeartPiece:
|06C0A8| JSL SpritePrep_HeartContainer

|06C0AC| RTS

;===================================================================================================

Sprite_2E_FluteKid_bounce:
|06C0AD| JSL Sprite_2E_FluteKid

|06C0B1| RTS

;===================================================================================================

Sprite_2D_NecklessMan_bounce:
|06C0B2| JSL Sprite_2D_NecklessMan

|06C0B6| RTS

;===================================================================================================

Sprite_29_Adult_bounce:
|06C0B7| JSL Sprite_29_Adult

|06C0BB| RTS

;===================================================================================================

Sprite_2A_SweepingLady_bounce:
|06C0BC| JSL Sprite_2A_SweepingLady

|06C0C0| RTS

;===================================================================================================

Sprite_2C_Lumberjacks_bounce:
|06C0C1| JSL Sprite_2C_Lumberjacks

|06C0C5| RTS

;===================================================================================================

Sprite_31_FortuneTeller_bounce:
|06C0C6| JSL Sprite_31_FortuneTeller

|06C0CA| RTS

;===================================================================================================

Sprite_2F_RaceGameLady_bounce:
|06C0CB| JSL Sprite_2F_RaceGameLady

|06C0CF| RTS

;===================================================================================================

Sprite_30_RaceGameGuy_bounce:
|06C0D0| JSL Sprite_30_RaceGameGuy

|06C0D4| RTS

;===================================================================================================

Sprite_25_TalkingTree_bounce:
|06C0D5| JSL Sprite_25_TalkingTree

|06C0D9| RTS

;===================================================================================================

StatueDirection:
|06C0DA| db $04, $06, $00, $02

;---------------------------------------------------------------------------------------------------

StatuePressMask:
|06C0DE| db $01, $02, $04, $08

;---------------------------------------------------------------------------------------------------

StatueSpeed:
.x
|06C0E2| db -16,  16 ; bleeds into next

.y
|06C0E4| db   0,   0, -16,  16

;===================================================================================================

Sprite_1C_Statue:
|06C0E8| LDA.w $0DE0,X
|06C0EB| BEQ .not_being_pushed

|06C0ED| STZ.w $0DE0,X

|06C0F0| STZ.b $5E
|06C0F2| STZ.b $48

.not_being_pushed
|06C0F4| LDA.w $0DF0,X
|06C0F7| BEQ .retain_momentum

|06C0F9| LDA.b #$01
|06C0FB| STA.w $0DE0,X

|06C0FE| LDA.b #$81
|06C100| STA.b $48

|06C102| LDA.b #$08
|06C104| STA.b $5E

.retain_momentum
|06C106| JSR SpriteDraw_Statue
|06C109| JSR CheckIfActive_bank06
|06C10C| JSR Statue_BlockSprites

|06C10F| STZ.w $0642

|06C112| JSR Statue_CheckForSwitch
|06C115| BCC .no_switch

|06C117| LDA.b #$01
|06C119| STA.w $0642

.no_switch
|06C11C| JSR MoveSpriteXY_bank06

|06C11F| JSR Get16BitSpriteCoords
|06C122| JSR CheckSpriteTileCollision
|06C125| JSR ZeroVelocityXY_bank06

|06C128| JSR CheckDamageToLink_same_layer
|06C12B| BCC Statue_NotInContact

|06C12D| LDA.b #$07
|06C12F| STA.w $0DF0,X

|06C132| JSL RepelDash_long

|06C136| LDA.w $0E00,X
|06C139| BNE Statue_AbortMovement

|06C13B| JSR GetDirectionTowardsLink

|06C13E| LDA.w StatueSpeed.x,Y
|06C141| STA.w $0D50,X

|06C144| LDA.w StatueSpeed.y,Y
|06C147| STA.w $0D40,X

;===================================================================================================

Statue_HandleGrab:
|06C14A| LDA.w $0376
|06C14D| AND.b #$02
|06C14F| BNE .not_grabbing

|06C151| JSL AbortMovement

.not_grabbing
|06C155| LDA.w $0E70,X
|06C158| AND.b #$0F
|06C15A| BNE .exit

|06C15C| LDA.w $0F10,X
|06C15F| BNE .exit

|06C161| LDA.b #$22 ; SFX2.22
|06C163| JSL QueueSpriteSFX2WithPan

|06C167| LDA.b #$08
|06C169| STA.w $0F10,X

.exit
|06C16C| RTS

;===================================================================================================

Statue_AbortMovement:
|06C16D| JSL AbortMovement

|06C171| RTS

;===================================================================================================

Statue_NotInContact:
|06C172| LDA.w $0DF0,X
|06C175| BNE .delay_timer

|06C177| LDA.b #$0D
|06C179| STA.w $0E00,X

.delay_timer
|06C17C| REP #$20

|06C17E| LDA.w $0FD8
|06C181| SEC
|06C182| SBC.b $22
|06C184| CLC
|06C185| ADC.w #$0010

|06C188| CMP.w #$0023
|06C18B| BCS .reset_contact

|06C18D| LDA.w $0FDA
|06C190| SEC
|06C191| SBC.b $20
|06C193| CLC
|06C194| ADC.w #$000C

|06C197| CMP.w #$0024
|06C19A| BCS .reset_contact

;---------------------------------------------------------------------------------------------------

|06C19C| SEP #$30

|06C19E| JSR GetDirectionTowardsLink

|06C1A1| LDA.b $2F
|06C1A3| CMP.w StatueDirection,Y
|06C1A6| BNE .reset_contact

|06C1A8| LDA.w $0372
|06C1AB| BNE .reset_contact

|06C1AD| LDA.b #$01
|06C1AF| STA.w $02FA

|06C1B2| LDA.b #$01
|06C1B4| STA.w $0D90,X

|06C1B7| LDA.w $0376
|06C1BA| AND.b #$02
|06C1BC| BEQ .exit

|06C1BE| LDA.b $F0
|06C1C0| AND.w StatuePressMask,Y
|06C1C3| BEQ .exit

|06C1C5| LDA.b $30
|06C1C7| ORA.b $31
|06C1C9| BEQ .exit

;---------------------------------------------------------------------------------------------------

|06C1CB| TYA
|06C1CC| EOR.b #$01
|06C1CE| TAY

|06C1CF| LDA.w StatueSpeed.x,Y
|06C1D2| STA.w $0D50,X

|06C1D5| LDA.w StatueSpeed.y,Y
|06C1D8| STA.w $0D40,X

|06C1DB| JMP.w Statue_HandleGrab

;---------------------------------------------------------------------------------------------------

.reset_contact
|06C1DE| SEP #$30

|06C1E0| LDA.w $0D90,X
|06C1E3| BEQ .exit

|06C1E5| STZ.w $0D90,X

|06C1E8| STZ.b $5E

|06C1EA| STZ.w $0376
|06C1ED| STZ.w $02FA

|06C1F0| LDA.b $50
|06C1F2| AND.b #$FE
|06C1F4| STA.b $50

.exit
|06C1F6| RTS

;===================================================================================================

pool Statue_CheckForSwitch

.offset_x
|06C1F7| db   3,  12,   3,  12

.offset_y
|06C1FB| db   3,   3,  12,  12

.tile_id
|06C1FF| db $23, $24, $25, $3B

endpool

;---------------------------------------------------------------------------------------------------

Statue_CheckForSwitch:
|06C203| LDY.b #$03

.next_tile
|06C205| LDA.w $0D00,X
|06C208| CLC
|06C209| ADC.w .offset_y,Y
|06C20C| STA.b $00

|06C20E| LDA.w $0D20,X
|06C211| ADC.b #$00
|06C213| STA.b $01

|06C215| LDA.w $0D10,X
|06C218| CLC
|06C219| ADC.w .offset_x,Y
|06C21C| STA.b $02

|06C21E| LDA.w $0D30,X
|06C221| ADC.b #$00
|06C223| STA.b $03

|06C225| LDA.w $0F20,X

|06C228| PHY

|06C229| JSL GetTileType_long

|06C22D| PLY

;---------------------------------------------------------------------------------------------------

|06C22E| LDA.w $0FA5

|06C231| CMP.w .tile_id+0
|06C234| BEQ .switch_tile

|06C236| CMP.w .tile_id+1
|06C239| BEQ .switch_tile

|06C23B| CMP.w .tile_id+2
|06C23E| BEQ .switch_tile

|06C240| CMP.w .tile_id+3
|06C243| BNE .fail

.switch_tile
|06C245| DEY
|06C246| BPL .next_tile

|06C248| SEC

|06C249| RTS

;---------------------------------------------------------------------------------------------------

.fail
|06C24A| CLC

|06C24B| RTS

;===================================================================================================

pool SpriteDraw_Statue

.oam_groups
|06C24C| dw   0,  -8 : db $C2, $00, $00, $00
|06C254| dw   8,  -8 : db $C2, $40, $00, $00
|06C25C| dw   0,   0 : db $C0, $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Statue:
|06C264| REP #$20

|06C266| LDA.w #.oam_groups
|06C269| STA.b $08

|06C26B| LDA.w #$0003
|06C26E| STA.b $06

|06C270| SEP #$30

|06C272| JSL TabulatedSpriteDraw.player_deferred

|06C276| RTS

;===================================================================================================

Statue_BlockSprites:
|06C277| LDY.b #$0F

.next
|06C279| LDA.w $0E20,Y
|06C27C| CMP.b #$1C ; SPRITE 1C
|06C27E| BEQ .skip

|06C280| CPY.w $0FA0
|06C283| BEQ .skip

|06C285| TYA
|06C286| EOR.b $1A
|06C288| AND.b #$01
|06C28A| BNE .skip

|06C28C| LDA.w $0DD0,Y
|06C28F| CMP.b #$09
|06C291| BCC .skip

|06C293| LDA.w $0D10,Y
|06C296| STA.b $04

|06C298| LDA.w $0D30,Y
|06C29B| STA.b $05

|06C29D| LDA.w $0D00,Y
|06C2A0| STA.b $06

|06C2A2| LDA.w $0D20,Y
|06C2A5| STA.b $07

|06C2A7| REP #$20

|06C2A9| LDA.w $0FD8
|06C2AC| SEC
|06C2AD| SBC.b $04
|06C2AF| CLC
|06C2B0| ADC.w #$000C

|06C2B3| CMP.w #$0018
|06C2B6| BCS .skip

|06C2B8| LDA.w $0FDA
|06C2BB| SEC
|06C2BC| SBC.b $06
|06C2BE| CLC
|06C2BF| ADC.w #$000C

|06C2C2| CMP.w #$0024
|06C2C5| BCS .skip

;---------------------------------------------------------------------------------------------------

|06C2C7| SEP #$20

|06C2C9| LDA.b #$04
|06C2CB| STA.w $0EA0,Y

|06C2CE| PHY

|06C2CF| LDA.b #$20
|06C2D1| JSR ProjectSpriteSpeedTowardsLocation

|06C2D4| PLY

|06C2D5| LDA.b $00
|06C2D7| STA.w $0F30,Y

|06C2DA| LDA.b $01
|06C2DC| STA.w $0F40,Y

;---------------------------------------------------------------------------------------------------

.skip
|06C2DF| SEP #$20

|06C2E1| DEY
|06C2E2| BPL .next

|06C2E4| RTS

;===================================================================================================

Sprite_1D_FluteQuest:
|06C2E5| JSR GetScreenCoordinates_wrapper
|06C2E8| JSR CheckIfActive_bank06

|06C2EB| LDA.b $8A
|06C2ED| CMP.b #$18 ; OW 18
|06C2EF| BNE .not_kakariko

|06C2F1| LDA.l $7EF34C
|06C2F5| CMP.b #$03
|06C2F7| BNE .no_active_flute

|06C2F9| STZ.w $0DD0,X

.no_active_flute
|06C2FC| RTS

;---------------------------------------------------------------------------------------------------

.not_kakariko
|06C2FD| LDA.l $7EF34C
|06C301| AND.b #$02
|06C303| BEQ .dont_die

|06C305| STZ.w $0DD0,X

.dont_die
|06C308| RTS

;===================================================================================================

FairyPond_offset_x:
|06C309| db   0,   4,   8,  12
|06C30D| db  16,  20,  24,   0

FairyPond_offset_y:
|06C311| db   0,   8,  16,  24
|06C315| db  32,  40,   4,  36

;===================================================================================================

Sprite_72_FairyPond:
|06C319| LDA.w $0D90,X
|06C31C| BNE FairyPond_Dust

|06C31E| LDA.w $0DA0,X
|06C321| BNE .visible

|06C323| JSR GetScreenCoordinates_wrapper

|06C326| JMP.w FairyPond_Main

.visible
|06C329| JSR SpriteDraw_FairyQueen

|06C32C| LDA.b $1A

|06C32E| LSR A
|06C32F| LSR A
|06C330| LSR A
|06C331| LSR A

|06C332| AND.b #$01
|06C334| STA.w $0DC0,X

|06C337| LDA.b $1A
|06C339| AND.b #$0F
|06C33B| BNE .exit

|06C33D| LDA.b #$72 ; SPRITE 72
|06C33F| JSL SpawnSpriteDynamically
|06C343| BMI .exit

|06C345| PHX

|06C346| JSL GetRandomNumber
|06C34A| AND.b #$07
|06C34C| TAX

|06C34D| LDA.b $00
|06C34F| CLC
|06C350| ADC.w FairyPond_offset_x,X
|06C353| STA.w $0D10,Y

|06C356| LDA.b $01
|06C358| ADC.b #$00
|06C35A| STA.w $0D30,Y

|06C35D| JSL GetRandomNumber
|06C361| AND.b #$07
|06C363| TAX

|06C364| LDA.b $02
|06C366| CLC
|06C367| ADC.w FairyPond_offset_y,X
|06C36A| STA.w $0D00,Y

|06C36D| LDA.b $03
|06C36F| ADC.b #$00
|06C371| STA.w $0D20,Y

|06C374| LDA.b #$1F
|06C376| STA.w $0DB0,Y
|06C379| STA.w $0D90,Y

|06C37C| JSR ZeroOutOAMAllocation

|06C37F| LDA.b #$48
|06C381| STA.w $0E60,Y

|06C384| AND.b #$0F
|06C386| STA.w $0F50,Y

|06C389| LDA.b #$01
|06C38B| STA.w $0DA0,Y

|06C38E| PLX

.exit
|06C38F| RTS

;===================================================================================================

FairyPond_Dust:
|06C390| DEC.w $0DB0,X
|06C393| BNE .delay

|06C395| STZ.w $0DD0,X

.delay
|06C398| LDA.w $0DB0,X
|06C39B| LSR A
|06C39C| LSR A
|06C39D| LSR A
|06C39E| STA.w $0DC0,X

|06C3A1| LDA.b #$04
|06C3A3| JSL AllocateOAMInRegionC

|06C3A7| JSR SpriteDraw_SingleSmall

|06C3AA| RTS

;===================================================================================================

FairyPond_TossGFXID:
.bow
|06C3AB| db $3A ; empty normal bow
|06C3AC| db $3A ; normal bow and arrows
|06C3AD| db $3B ; empty silver bow
|06C3AE| db $3B ; silver bow and arrows

.boomerang
|06C3AF| db $0C ; blue
|06C3B0| db $2A ; red

.hookshot
|06C3B1| db $0A

.bombs
|06C3B2| db $27

.mushroom
|06C3B3| db $29 ; mushroom
|06C3B4| db $0D ; powder

.fire_rod
|06C3B5| db $07

.ice_rod
|06C3B6| db $08

.bombos
|06C3B7| db $0F

.ether
|06C3B8| db $10

.quake
|06C3B9| db $11

.lamp
|06C3BA| db $12

.hammer
|06C3BB| db $09

.flute
|06C3BC| db $13 ; shovel
|06C3BD| db $14 ; inactive flute
|06C3BE| db $4A ; active flute

.net
|06C3BF| db $21

.book
|06C3C0| db $1D

.somaria
|06C3C1| db $15

.byrna
|06C3C2| db $18

.cape
|06C3C3| db $19

.mirror
|06C3C4| db $31 ; map
|06C3C5| db $1A ; mirror
|06C3C6| db $1A ; mirror (triforce)

.gloves
|06C3C7| db $1B ; power glove
|06C3C8| db $1C ; titan's mitt

.boots
|06C3C9| db $4B

.flippers
|06C3CA| db $1E

.pearl
|06C3CB| db $1F

.sword
|06C3CC| db $49 ; fighter sword
|06C3CD| db $01 ; master sword
|06C3CE| db $02 ; tempered sword
|06C3CF| db $03 ; butter sword

.shield
|06C3D0| db $04 ; fighter shield
|06C3D1| db $05 ; fire shield
|06C3D2| db $06 ; mirror shield

.armor
|06C3D3| db $22 ; blue mail
|06C3D4| db $23 ; red mail

.bottles
|06C3D5| db $29 ; mushroom
|06C3D6| db $16 ; empty bottle
|06C3D7| db $2B ; red potion
|06C3D8| db $2C ; green potion
|06C3D9| db $2D ; blue potion
|06C3DA| db $3D ; fairy
|06C3DB| db $3C ; bee
|06C3DC| db $48 ; good bee

;---------------------------------------------------------------------------------------------------

.pointer
|06C3DD| dw .bow-1
|06C3DF| dw .boomerang-1
|06C3E1| dw .hookshot-1
|06C3E3| dw .bombs-1
|06C3E5| dw .mushroom-1
|06C3E7| dw .fire_rod-1
|06C3E9| dw .ice_rod-1
|06C3EB| dw .bombos-1
|06C3ED| dw .ether-1
|06C3EF| dw .quake-1
|06C3F1| dw .lamp-1
|06C3F3| dw .hammer-1
|06C3F5| dw .flute-1
|06C3F7| dw .net-1
|06C3F9| dw .book-1
|06C3FB| dw .somaria-1
|06C3FD| dw .somaria-1
|06C3FF| dw .byrna-1
|06C401| dw .cape-1
|06C403| dw .mirror-1
|06C405| dw .gloves-1
|06C407| dw .boots-1
|06C409| dw .flippers-1
|06C40B| dw .pearl-1
|06C40D| dw .sword-1
|06C40F| dw .sword-1
|06C411| dw .shield-1
|06C413| dw .armor-1
|06C415| dw .bottles-1
|06C417| dw .bottles-1
|06C419| dw .bottles-1
|06C41B| dw .bottles-1

;===================================================================================================

FairyPond_Main:
|06C41D| JSR SpriteDraw_FairyPondItem
|06C420| JSR CheckIfActive_bank06

|06C423| LDA.b $A0
|06C425| CMP.b #$15 ; ROOM 0115
|06C427| BEQ FairyPond_LakeHylia

;===================================================================================================

FairyPond_Waterfall:
|06C429| LDA.w $0D80,X
|06C42C| JSL JumpTableLocal
|06C430| dw UpgradeFairy_WaitForLink
|06C432| dw UpgradeFairy_OfferItemToss
|06C434| dw UpgradeFairy_HandleItemToss
|06C436| dw UpgradeFairy_SpawnFairy
|06C438| dw UpgradeFairy_AskWhoDidThis
|06C43A| dw UpgradeFairy_HandleAnswer
|06C43C| dw UpgradeFairy_HandleUpgrade
|06C43E| dw UpgradeFairy_Retreat
|06C440| dw UpgradeFairy_FixPalettes
|06C442| dw UpgradeFairy_HandleItemReceipt
|06C444| dw UpgradeFairy_FinalGoodBye
|06C446| dw UpgradeFairy_YouLiar
|06C448| dw UpgradeFairy_SecondChance
|06C44A| dw UpgradeFairy_DebaseLink

;===================================================================================================

FairyPond_LakeHylia:
|06C44C| LDA.w $0D80,X
|06C44F| JSL JumpTableLocal
|06C453| dw FairyPond_WaitForLink
|06C455| dw LakeHyliaFairy_WaitForLink
|06C457| dw LakeHyliaFairy_BegForDonation
|06C459| dw LakeHyliaFairy_AcceptDonation
|06C45B| dw LakeHyliaFairy_WaitForDonation
|06C45D| dw LakeHyliaFairy_SpawnFairy
|06C45F| dw LakeHyliaFairy_Greetings
|06C461| dw LakeHyliaFairy_OfferUpgrade
|06C463| dw LakeHyliaFairy_UpgradeBombs
|06C465| dw LakeHyliaFairy_RevertTranslucency
|06C467| dw LakeHyliaFairy_DeleteFairy
|06C469| dw LakeHyliaFairy_RestoreAndReset
|06C46B| dw LakeHyliaFairy_UpgradeArrows
|06C46D| dw LakeHyliaFairy_GiveDonationStatus
|06C46F| dw LakeHyliaFairy_GrantLuck

;===================================================================================================

pool SpriteDraw_FairyPondItem

.oam_groups

.group00
|06C471| dw  32, -64 : db $24, $00, $00, $00
|06C479| dw  32, -56 : db $34, $00, $00, $00
|06C481| dw  32, -64 : db $24, $00, $00, $00
|06C489| dw  32, -56 : db $34, $00, $00, $00

.group01
|06C491| dw  32, -64 : db $24, $00, $00, $02
|06C499| dw  32, -64 : db $24, $00, $00, $02
|06C4A1| dw  32, -64 : db $24, $00, $00, $02
|06C4A9| dw  32, -64 : db $24, $00, $00, $02

;---------------------------------------------------------------------------------------------------

.oam_group_pointers
|06C4B1| dw .group00
|06C4B3| dw .group01

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_FairyPondItem:
|06C4B5| LDA.b $A0
|06C4B7| CMP.b #$15 ; ROOM 0115
|06C4B9| BEQ .exit

|06C4BB| LDA.w $0D80,X
|06C4BE| CMP.b #$05
|06C4C0| BEQ .draw_object

|06C4C2| CMP.b #$06
|06C4C4| BEQ .draw_object

|06C4C6| CMP.b #$0B
|06C4C8| BEQ .draw_object

|06C4CA| CMP.b #$0C
|06C4CC| BEQ .draw_object
|06C4CE| BRA .exit

.draw_object
|06C4D0| PHX

|06C4D1| TXY

|06C4D2| LDA.w $0DC0,Y
|06C4D5| TAX

|06C4D6| LDA.l AncillaAdd_ItemReceipt.prop,X
|06C4DA| CMP.b #$FF
|06C4DC| BNE .use_loaded_palette

|06C4DE| LDA.b #$05

.use_loaded_palette
|06C4E0| AND.b #$07
|06C4E2| ASL A
|06C4E3| STA.w $0F50,Y

|06C4E6| LDA.l AncillaAdd_ItemReceipt.width,X
|06C4EA| TAY

|06C4EB| LDA.w .oam_group_pointers+0,Y
|06C4EE| STA.b $08

|06C4F0| LDA.w .oam_group_pointers+1,Y
|06C4F3| STA.b $09

|06C4F5| LDA.b #$04

|06C4F7| PLX

|06C4F8| JSL TabulatedSpriteDraw

.exit
|06C4FC| RTS

;===================================================================================================

FairyPond_WaitForLink:
|06C4FD| STZ.w $02E4

|06C500| LDA.w $0DF0,X
|06C503| BNE .exit

|06C505| JSL CheckIfLinkIsBusy
|06C509| BCS .exit

|06C50B| LDA.b #$89 ; MESSAGE 0089
|06C50D| LDY.b #$00
|06C50F| JSL ShowMessageOnContact
|06C513| BCC .exit

|06C515| INC.w $0D80,X

|06C518| JSL ResetLinkProperties_A
|06C51C| JSL TerminateSparkles

|06C520| STZ.b $2F

.exit
|06C522| RTS

;===================================================================================================

FairyPond_Prices:
|06C523| db   5,  20,  25,  50

FairyPond_PricesBCD:
|06C527| db $05, $20, $25, $50

;===================================================================================================

LakeHyliaFairy_WaitForLink:
|06C52B| LDA.w $1CE8
|06C52E| BNE .negatory

|06C530| LDA.l $7EF370
|06C534| ORA.l $7EF371
|06C538| BEQ .have_upgraded_before

|06C53A| LDA.b #$02

.have_upgraded_before
|06C53C| STA.w $0DC0,X

|06C53F| TAY

|06C540| LDA.w FairyPond_PricesBCD+0,Y
|06C543| STA.w $1CF2

|06C546| LDA.w FairyPond_PricesBCD+1,Y
|06C549| STA.w $1CF3

|06C54C| LDA.b #$4E ; MESSAGE 014E
|06C54E| LDY.b #$01
|06C550| JSL ShowMessageUnconditional

|06C554| INC.w $0D80,X

|06C557| LDA.b #$01
|06C559| STA.w $02E4

|06C55C| RTS

;===================================================================================================

#FairyPond_ResetAI:
|06C55D| SEP #$30

.negatory
|06C55F| LDA.b #$4C ; MESSAGE 014C
|06C561| LDY.b #$01
|06C563| JSL ShowMessageUnconditional

|06C567| STZ.w $0D80,X

|06C56A| LDA.b #$FF
|06C56C| STA.w $0DF0,X

|06C56F| RTS

;===================================================================================================

LakeHyliaFairy_BegForDonation:
|06C570| LDA.w $1CE8
|06C573| CLC
|06C574| ADC.w $0DC0,X
|06C577| TAY

|06C578| LDA.w FairyPond_PricesBCD,Y
|06C57B| STA.w $1CF3

|06C57E| REP #$20

|06C580| LDA.w FairyPond_Prices,Y
|06C583| AND.w #$00FF
|06C586| STA.b $00

|06C588| LDA.l $7EF360
|06C58C| CMP.b $00
|06C58E| BCC FairyPond_ResetAI

|06C590| SEP #$30

|06C592| LDA.b $00
|06C594| STA.w $0DE0,X

|06C597| TYA
|06C598| STA.w $0EB0,X

|06C59B| INC.w $0D80,X

|06C59E| RTS

;===================================================================================================

LakeHyliaFairy_AcceptDonation:
|06C59F| LDA.b #$50
|06C5A1| STA.w $0DF0,X

|06C5A4| LDA.w $0DE0,X
|06C5A7| STA.b $00
|06C5A9| STZ.b $01

|06C5AB| REP #$20

|06C5AD| LDA.l $7EF360
|06C5B1| SEC
|06C5B2| SBC.b $00
|06C5B4| STA.l $7EF360

|06C5B8| SEP #$30

|06C5BA| LDA.l $7EF36A
|06C5BE| CLC
|06C5BF| ADC.b $00
|06C5C1| STA.l $7EF36A

|06C5C5| PHX

|06C5C6| LDA.w $0EB0,X
|06C5C9| JSL AddHappinessPondRupees

|06C5CD| PLX

|06C5CE| LDA.l $7EF36A
|06C5D2| CMP.b #$64
|06C5D4| BCC .not_enough_for_upgrade

|06C5D6| SBC.b #$64
|06C5D8| STA.l $7EF36A

|06C5DC| LDA.b #$05
|06C5DE| STA.w $0D80,X

|06C5E1| RTS

;---------------------------------------------------------------------------------------------------

.not_enough_for_upgrade
|06C5E2| LDA.l $7EF36A

|06C5E6| STZ.b $02

.remove_rupees
|06C5E8| CMP.b #$0A
|06C5EA| BCC .less_than_10

|06C5EC| SBC.b #$0A
|06C5EE| INC.b $02

|06C5F0| BRA .remove_rupees

.less_than_10
|06C5F2| ASL.b $02
|06C5F4| ASL.b $02
|06C5F6| ASL.b $02
|06C5F8| ASL.b $02

|06C5FA| ORA.b $02
|06C5FC| STA.w $1CF2

|06C5FF| INC.w $0D80,X

|06C602| RTS

;===================================================================================================

LakeHyliaFairy_WaitForDonation:
|06C603| LDA.w $0DF0,X
|06C606| BNE .exit

|06C608| LDA.b #$94 ; MESSAGE 0094
|06C60A| LDY.b #$00
|06C60C| JSL ShowMessageUnconditional

|06C610| LDA.b #$0D
|06C612| STA.w $0D80,X

.exit
|06C615| RTS

;===================================================================================================

LakeHyliaFairy_SpawnFairy:
|06C616| LDA.w $0DF0,X
|06C619| BNE .exit

|06C61B| LDA.b #$72 ; SPRITE 72
|06C61D| JSL SpawnSpriteDynamically

|06C621| LDA.b #$1B ; SONG 1B
|06C623| STA.w $012C

|06C626| STZ.w $0133

|06C629| LDA.b $00
|06C62B| SEC
|06C62C| SBC.w FairyPondFairy_offset_x
|06C62F| STA.w $0D10,Y

|06C632| LDA.b $01
|06C634| SBC.b #$00
|06C636| STA.w $0D30,Y

|06C639| LDA.b $02
|06C63B| SEC
|06C63C| SBC.w FairyPondFairy_offset_y
|06C63F| STA.w $0D00,Y

|06C642| LDA.b $03
|06C644| SBC.b #$00
|06C646| STA.w $0D20,Y

|06C649| LDA.b #$01
|06C64B| STA.w $0DA0,Y

|06C64E| INC.w $0D80,X

|06C651| LDA.b #$FF
|06C653| STA.w $0DF0,X

|06C656| PHX

|06C657| JSL AssertTranslucencySwap
|06C65B| JSL PaletteFilter_WishPonds

|06C65F| PLX

|06C660| TYA
|06C661| STA.w $0E90,X

.exit
|06C664| RTS

;===================================================================================================

LakeHyliaFairy_Greetings:
|06C665| LDA.b $1A
|06C667| AND.b #$07
|06C669| BNE .exit

|06C66B| PHX

|06C66C| JSL PaletteFilter_Sprite5Left

|06C670| PLX

|06C671| LDA.l $7EC007
|06C675| BNE .exit

|06C677| INC.w $0D80,X

|06C67A| LDA.b #$95 ; MESSAGE 0095
|06C67C| LDY.b #$00
|06C67E| JSL ShowMessageUnconditional

|06C682| PHX

|06C683| JSL RevertTranslucencySwap

|06C687| STZ.b $1D

|06C689| LDA.b #$20
|06C68B| STA.b $9A

|06C68D| INC.b $15

|06C68F| PLX

.exit
|06C690| RTS

;===================================================================================================

LakeHyliaFairy_OfferUpgrade:
|06C691| LDA.w $1CE8
|06C694| BNE .chose_arrows

|06C696| INC.w $0D80,X

|06C699| RTS

.chose_arrows
|06C69A| LDA.b #$0C
|06C69C| STA.w $0D80,X

|06C69F| RTS

;===================================================================================================

LakeHyliaFairy_UpgradeBombs:
|06C6A0| INC.w $0D80,X

|06C6A3| LDA.l $7EF370
|06C6A7| CMP.b #$07
|06C6A9| BEQ .at_max

|06C6AB| INC A
|06C6AC| STA.l $7EF370

|06C6B0| PHX

|06C6B1| TAX

|06C6B2| LDA.l CapacityUpgrades.bombs_bcd,X
|06C6B6| STA.w $1CF2

|06C6B9| STA.l $7EF375

|06C6BD| PLX

|06C6BE| LDA.b #$96 ; MESSAGE 0096
|06C6C0| LDY.b #$00
|06C6C2| JSL ShowMessageUnconditional

|06C6C6| RTS

;---------------------------------------------------------------------------------------------------

.at_max
|06C6C7| LDA.b #$98 ; MESSAGE 0098
|06C6C9| LDY.b #$00
|06C6CB| JSL ShowMessageUnconditional

|06C6CF| JMP.w LakeHyliaFairy_RefundRupees

;===================================================================================================

LakeHyliaFairy_RevertTranslucency:
|06C6D2| INC.w $0D80,X

|06C6D5| PHX

|06C6D6| JSL AssertTranslucencySwap

|06C6DA| LDA.b #$02
|06C6DC| STA.b $1D

|06C6DE| LDA.b #$30
|06C6E0| STA.b $9A

|06C6E2| INC.w $0015

|06C6E5| PLX

|06C6E6| RTS

;===================================================================================================

LakeHyliaFairy_DeleteFairy:
|06C6E7| LDA.b $1A
|06C6E9| AND.b #$07
|06C6EB| BNE .exit

|06C6ED| PHX

|06C6EE| JSL PaletteFilter_Sprite5Left

|06C6F2| PLX

|06C6F3| LDA.l $7EC007
|06C6F7| CMP.b #$1E
|06C6F9| BNE .delay

|06C6FB| LDA.w $0E90,X
|06C6FE| TAY

|06C6FF| LDA.b #$00
|06C701| STA.w $0DD0,Y

|06C704| BRA .exit

.delay
|06C706| CMP.b #$00
|06C708| BNE .exit

|06C70A| INC.w $0D80,X

.exit
|06C70D| RTS

;===================================================================================================

LakeHyliaFairy_RestoreAndReset:
|06C70E| PHX

|06C70F| JSL PaletteFilter_RestoreSprite5Left
|06C713| JSL RevertTranslucencySwap

|06C717| PLX

|06C718| STZ.w $0D80,X

|06C71B| LDA.b #$FF
|06C71D| STA.w $0DF0,X

|06C720| RTS

;===================================================================================================

LakeHyliaFairy_UpgradeArrows:
|06C721| LDA.b #$09
|06C723| STA.w $0D80,X

|06C726| LDA.l $7EF371
|06C72A| CMP.b #$07
|06C72C| BEQ .at_max

|06C72E| INC A
|06C72F| STA.l $7EF371

|06C733| PHX

|06C734| TAX

|06C735| LDA.l CapacityUpgrades.arrows_bcd,X
|06C739| STA.w $1CF2
|06C73C| STA.l $7EF376

|06C740| PLX

|06C741| LDA.b #$97 ; MESSAGE 0097
|06C743| LDY.b #$00
|06C745| JSL ShowMessageUnconditional

|06C749| RTS

;---------------------------------------------------------------------------------------------------

.at_max
|06C74A| LDA.b #$98 ; MESSAGE 0098
|06C74C| LDY.b #$00
|06C74E| JSL ShowMessageUnconditional

;===================================================================================================

LakeHyliaFairy_RefundRupees:
|06C752| REP #$20

|06C754| LDA.l $7EF360
|06C758| CLC
|06C759| ADC.w #$64
|06C75C| STA.l $7EF360

|06C760| SEP #$30

|06C762| RTS

;===================================================================================================

LakeHyliaFairy_GiveDonationStatus:
|06C763| LDA.b #$54 ; MESSAGE 0154
|06C765| LDY.b #$01
|06C767| JSL ShowMessageUnconditional

|06C76B| INC.w $0D80,X

|06C76E| RTS

;===================================================================================================

pool LakeHyliaFairy_GrantLuck

.message_low
|06C76F| db $50 ; MESSAGE 0150
|06C770| db $51 ; MESSAGE 0151
|06C771| db $52 ; MESSAGE 0152
|06C772| db $53 ; MESSAGE 0153

.message_high
|06C773| db $01
|06C774| db $01
|06C775| db $01
|06C776| db $01

.luck_level
|06C777| db $01
|06C778| db $00
|06C779| db $00
|06C77A| db $02

endpool

;---------------------------------------------------------------------------------------------------

LakeHyliaFairy_GrantLuck:
|06C77B| JSL GetRandomNumber
|06C77F| AND.b #$03
|06C781| TAY

|06C782| LDA.w .luck_level,Y
|06C785| STA.w $0CF9

|06C788| STZ.w $0CFA

|06C78B| LDA.w .message_low,Y
|06C78E| XBA

|06C78F| LDA.w .message_high,Y
|06C792| TAY

|06C793| XBA
|06C794| JSL ShowMessageUnconditional

|06C798| STZ.w $0D80,X

|06C79B| LDA.b #$FF
|06C79D| STA.w $0DF0,X

|06C7A0| RTS

;===================================================================================================

UpgradeFairy_WaitForLink:
|06C7A1| STZ.w $02E4

|06C7A4| LDA.w $0DF0,X
|06C7A7| BNE .exit

|06C7A9| JSL CheckIfLinkIsBusy
|06C7AD| BCS .exit

|06C7AF| LDA.b #$4A ; MESSAGE 014A
|06C7B1| LDY.b #$01
|06C7B3| JSL ShowMessageOnContact
|06C7B7| BCC .exit

|06C7B9| INC.w $0D80,X

|06C7BC| JSL ResetLinkProperties_A

|06C7C0| STZ.b $2F

|06C7C2| STZ.w $0EB0,X

.exit
|06C7C5| RTS

;===================================================================================================

UpgradeFairy_OfferItemToss:
|06C7C6| LDA.w $1CE8
|06C7C9| BNE .no_toss

|06C7CB| LDA.b #$8A ; MESSAGE 008A
|06C7CD| LDY.b #$00
|06C7CF| JSL ShowMessageUnconditional

|06C7D3| INC.w $0D80,X

|06C7D6| LDA.b #$01
|06C7D8| STA.w $02E4

|06C7DB| RTS

.no_toss
|06C7DC| LDA.b #$4B ; MESSAGE 014B
|06C7DE| LDY.b #$01
|06C7E0| JSL ShowMessageUnconditional

|06C7E4| STZ.w $0D80,X

|06C7E7| LDA.b #$FF
|06C7E9| STA.w $0DF0,X

|06C7EC| RTS

;===================================================================================================

UpgradeFairy_HandleItemToss:
|06C7ED| INC.w $0D80,X

|06C7F0| PHX

|06C7F1| LDA.w $1CE8
|06C7F4| STA.w $0DB0,X

|06C7F7| TAX

|06C7F8| ASL A
|06C7F9| TAY

|06C7FA| LDA.w FairyPond_TossGFXID.pointer+0,Y
|06C7FD| STA.b $00

|06C7FF| LDA.w FairyPond_TossGFXID.pointer+1,Y
|06C802| STA.b $01

|06C804| LDA.l $7EF340,X
|06C808| PHA

|06C809| CPX.b #$20
|06C80B| BEQ .bottle

|06C80D| CPX.b #$03
|06C80F| BNE .not_bombs

.bottle
|06C811| LDA.b #$01

;---------------------------------------------------------------------------------------------------

.not_bombs
|06C813| TAY

|06C814| LDA.b #$00
|06C816| STA.l $7EF340,X

|06C81A| LDA.b ($00),Y
|06C81C| PHA

|06C81D| TAX

|06C81E| LDY.b #$04
|06C820| LDA.b #$28 ; ANCILLA 28
|06C822| JSL AncillaAdd_TossedPondItem

|06C826| JSL RefreshItemIcon

|06C82A| PLA
|06C82B| PLY
|06C82C| PLX

|06C82D| STA.w $0DC0,X

|06C830| TYA
|06C831| STA.w $0DE0,X

|06C834| LDA.b #$FF
|06C836| STA.w $0DF0,X

|06C839| RTS

;===================================================================================================

FairyPondFairy_offset_x:
|06C83A| db $00

FairyPondFairy_offset_y:
|06C83B| db $50

;===================================================================================================

UpgradeFairy_SpawnFairy:
|06C83C| LDA.w $0DF0,X
|06C83F| BNE .exit

|06C841| LDA.b #$72 ; SPRITE 72
|06C843| JSL SpawnSpriteDynamically

|06C847| LDA.b #$1B ; SONG 1B
|06C849| STA.w $012C

|06C84C| STZ.w $0133

|06C84F| LDA.b $00
|06C851| SEC
|06C852| SBC.w FairyPondFairy_offset_x
|06C855| STA.w $0D10,Y

|06C858| LDA.b $01
|06C85A| SBC.b #$00
|06C85C| STA.w $0D30,Y

|06C85F| LDA.b $02
|06C861| SEC
|06C862| SBC.w FairyPondFairy_offset_y
|06C865| STA.w $0D00,Y

|06C868| LDA.b $03
|06C86A| SBC.b #$00
|06C86C| STA.w $0D20,Y

|06C86F| LDA.b #$01
|06C871| STA.w $0DA0,Y

|06C874| INC.w $0D80,X

|06C877| LDA.b #$FF
|06C879| STA.w $0DF0,X

|06C87C| PHX

|06C87D| JSL AssertTranslucencySwap
|06C881| JSL PaletteFilter_WishPonds

|06C885| PLX

|06C886| TYA
|06C887| STA.w $0E90,X

.exit
|06C88A| RTS

;===================================================================================================

UpgradeFairy_AskWhoDidThis:
|06C88B| LDA.b $1A
|06C88D| AND.b #$07
|06C88F| BNE .exit

|06C891| PHX
|06C892| JSL PaletteFilter_Sprite5Left
|06C896| PLX

|06C897| LDA.l $7EC007
|06C89B| BNE .exit

|06C89D| INC.w $0D80,X

|06C8A0| LDA.b #$8B ; MESSAGE 008B
|06C8A2| LDY.b #$00
|06C8A4| JSL ShowMessageUnconditional

|06C8A8| PHX

|06C8A9| JSL RevertTranslucencySwap

|06C8AD| STZ.b $1D

|06C8AF| LDA.b #$20
|06C8B1| STA.b $9A

|06C8B3| INC.b $15

|06C8B5| PLX

.exit
|06C8B6| RTS

;===================================================================================================

UpgradeFairy_HandleAnswer:
|06C8B7| LDA.w $1CE8
|06C8BA| BNE .liar

|06C8BC| INC.w $0D80,X

|06C8BF| RTS

.liar
|06C8C0| LDA.b #$0B
|06C8C2| STA.w $0D80,X

|06C8C5| RTS

;===================================================================================================

UpgradeFairy_HandleUpgrade:
|06C8C6| INC.w $0D80,X

|06C8C9| LDA.l $7EF3CA
|06C8CD| BNE .fat_fairy

;---------------------------------------------------------------------------------------------------

|06C8CF| LDA.w $0DC0,X
|06C8D2| CMP.b #$0C
|06C8D4| BNE .not_blue_boomerang

|06C8D6| LDA.b #$2A ; red boom gfx
|06C8D8| STA.w $0DC0,X

|06C8DB| LDA.b #$01
|06C8DD| STA.w $0EB0,X

|06C8E0| BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_blue_boomerang
|06C8E2| CMP.b #$04
|06C8E4| BNE .not_fighter_shield

|06C8E6| LDA.b #$05 ; fire shield gfx
|06C8E8| STA.w $0DC0,X

|06C8EB| LDA.b #$02
|06C8ED| STA.w $0EB0,X

|06C8F0| BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_fighter_shield
|06C8F2| CMP.b #$16
|06C8F4| BNE .not_empty_bottle_a

|06C8F6| LDA.b #$2C ; green potion gfx
|06C8F8| STA.w $0DC0,X

|06C8FB| LDA.b #$03
|06C8FD| STA.w $0EB0,X

|06C900| BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_empty_bottle_a
|06C902| BRA .what_a_lame_item

;---------------------------------------------------------------------------------------------------

.fat_fairy
|06C904| LDA.w $0DC0,X
|06C907| CMP.b #$3A
|06C909| BNE .not_normal_bow

|06C90B| LDA.b #$3B ; silver bow gfx
|06C90D| STA.w $0DC0,X

|06C910| LDA.b #$04
|06C912| STA.w $0EB0,X

|06C915| LDA.b #$4F ; MESSAGE 014F
|06C917| LDY.b #$01
|06C919| JSL ShowMessageUnconditional

|06C91D| RTS

;---------------------------------------------------------------------------------------------------

.not_normal_bow
|06C91E| CMP.b #$02
|06C920| BNE .not_tempered_sword

|06C922| LDA.b #$03 ; butter sword gfx
|06C924| STA.w $0DC0,X

|06C927| LDA.b #$05
|06C929| STA.w $0EB0,X

|06C92C| BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_tempered_sword
|06C92E| CMP.b #$16
|06C930| BNE .not_empty_bottle_b

|06C932| LDA.b #$2C ; green potion gfx
|06C934| STA.w $0DC0,X

|06C937| LDA.b #$03
|06C939| STA.w $0EB0,X

|06C93C| BRA .what_a_nice_item

;---------------------------------------------------------------------------------------------------

.not_empty_bottle_b
|06C93E| BRA .what_a_lame_item

;---------------------------------------------------------------------------------------------------

.what_a_nice_item
|06C940| LDA.b #$8C ; MESSAGE 008C
|06C942| LDY.b #$00
|06C944| JSL ShowMessageUnconditional

|06C948| RTS

;---------------------------------------------------------------------------------------------------

.what_a_lame_item
|06C949| LDA.b #$4D ; MESSAGE 014D
|06C94B| LDY.b #$01
|06C94D| JSL ShowMessageUnconditional

|06C951| RTS

;===================================================================================================

UpgradeFairy_Retreat:
|06C952| LDA.w $0DE0,X
|06C955| TAY

|06C956| LDA.w $0DB0,X

|06C959| PHX

|06C95A| TAX

|06C95B| TYA

|06C95C| CPX.b #$03
|06C95E| BNE .not_bombs

|06C960| STA.l $7EF340,X

.not_bombs
|06C964| PLX

|06C965| INC.w $0D80,X

|06C968| PHX

|06C969| JSL AssertTranslucencySwap

|06C96D| LDA.b #$02
|06C96F| STA.b $1D

|06C971| LDA.b #$30
|06C973| STA.b $9A

|06C975| INC.w $0015

|06C978| PLX

|06C979| RTS

;===================================================================================================

UpgradeFairy_FixPalettes:
|06C97A| LDA.b $1A
|06C97C| AND.b #$07
|06C97E| BNE .exit

|06C980| PHX

|06C981| JSL PaletteFilter_Sprite5Left

|06C985| PLX

|06C986| LDA.l $7EC007
|06C98A| CMP.b #$1E
|06C98C| BNE .delay

|06C98E| LDA.w $0E90,X
|06C991| TAY

|06C992| LDA.b #$00
|06C994| STA.w $0DD0,Y

|06C997| BRA .exit

.delay
|06C999| CMP.b #$00
|06C99B| BNE .exit

|06C99D| INC.w $0D80,X

.exit
|06C9A0| RTS

;===================================================================================================

UpgradeFairy_HandleItemReceipt:
|06C9A1| INC.w $0D80,X

|06C9A4| PHX

|06C9A5| JSL PaletteFilter_RestoreSprite5Left
|06C9A9| JSL RevertTranslucencySwap

|06C9AD| PLX
|06C9AE| PHX

|06C9AF| LDA.b #$02
|06C9B1| STA.w $02E9

|06C9B4| LDA.w $0DC0,X
|06C9B7| TAY

|06C9B8| JSL GrantItemReceipt

|06C9BC| PLX

|06C9BD| RTS

;===================================================================================================

pool UpgradeFairy_FinalGoodBye

.message_low
|06C9BE| db $8F ; MESSAGE 008F
|06C9BF| db $90 ; MESSAGE 0090
|06C9C0| db $92 ; MESSAGE 0092
|06C9C1| db $91 ; MESSAGE 0091
|06C9C2| db $93 ; MESSAGE 0093

.message_high
|06C9C3| db $00
|06C9C4| db $00
|06C9C5| db $00
|06C9C6| db $00
|06C9C7| db $00

endpool

;---------------------------------------------------------------------------------------------------

UpgradeFairy_FinalGoodBye:
|06C9C8| LDA.w $0EB0,X
|06C9CB| BEQ .reset

|06C9CD| DEC A
|06C9CE| TAY

|06C9CF| LDA.w .message_low,Y
|06C9D2| XBA

|06C9D3| LDA.w .message_high,Y
|06C9D6| TAY

|06C9D7| XBA

|06C9D8| JSL ShowMessageUnconditional

.reset
|06C9DC| STZ.w $0D80,X

|06C9DF| LDA.b #$FF
|06C9E1| STA.w $0DF0,X

|06C9E4| RTS

;===================================================================================================

UpgradeFairy_YouLiar:
|06C9E5| INC.w $0D80,X

|06C9E8| LDA.b #$8D ; MESSAGE 008D
|06C9EA| LDY.b #$00
|06C9EC| JSL ShowMessageUnconditional

|06C9F0| RTS

;===================================================================================================

UpgradeFairy_SecondChance:
|06C9F1| LDA.w $1CE8
|06C9F4| BNE .still_lying

|06C9F6| INC.w $0D80,X

|06C9F9| RTS

.still_lying
|06C9FA| LDA.b #$06
|06C9FC| STA.w $0D80,X

|06C9FF| RTS

;===================================================================================================

UpgradeFairy_DebaseLink:
|06CA00| LDA.b #$8E ; MESSAGE 008E
|06CA02| LDY.b #$00
|06CA04| JSL ShowMessageUnconditional

|06CA08| LDA.b #$07
|06CA0A| STA.w $0D80,X

|06CA0D| RTS

;===================================================================================================

pool SpriteDraw_ThinFairy

.offset_x
|06CA0E| db   0,  16,   0,   8,  16,  24,   0,   8
|06CA16| db  16,  24,   0,  16,   0,  16,   0,   8
|06CA1E| db  16,  24,   0,   8,  16,  24,   0,  16

.offset_y
|06CA26| db   0,   0,  16,  16,  16,  16,  24,  24
|06CA2E| db  24,  24,  32,  32,   0,   0,  16,  16
|06CA36| db  16,  16,  24,  24,  24,  24,  32,  32

.char
|06CA3E| db $C7, $C7, $CF, $CA, $CA, $CF, $DF, $DA
|06CA46| db $DA, $DF, $CB, $CB, $CD, $CD, $C9, $CA
|06CA4E| db $CA, $C9, $D9, $DA, $DA, $D9, $CB, $CB

.prop
|06CA56| db $00, $40, $00, $00, $40, $40, $00, $00
|06CA5E| db $40, $40, $00, $40, $00, $40, $00, $00
|06CA66| db $40, $40, $00, $00, $40, $40, $00, $40

.oam_sizes
|06CA6E| db $02, $02, $00, $00, $00, $00, $00, $00
|06CA76| db $00, $00, $02, $02, $02, $02, $00, $00
|06CA7E| db $00, $00, $00, $00, $00, $00, $02, $02

endpool

;===================================================================================================

pool SpriteDraw_FatFairy

.oam_groups
|06CA86| dw   0,   0 : db $E9, $00, $00, $02
|06CA8E| dw  16,   0 : db $E9, $40, $00, $02
|06CA96| dw   0,   0 : db $E9, $00, $00, $02
|06CA9E| dw  16,   0 : db $E9, $40, $00, $02
|06CAA6| dw   0,   0 : db $E9, $00, $00, $02
|06CAAE| dw  16,   0 : db $E9, $40, $00, $02
|06CAB6| dw   0,  16 : db $EB, $00, $00, $02
|06CABE| dw  16,  16 : db $EB, $40, $00, $02
|06CAC6| dw   0,  32 : db $ED, $00, $00, $02
|06CACE| dw  16,  32 : db $ED, $40, $00, $02

|06CAD6| dw   0,   0 : db $EF, $00, $00, $00
|06CADE| dw  24,   0 : db $EF, $40, $00, $00
|06CAE6| dw   0,   8 : db $FF, $00, $00, $00
|06CAEE| dw  24,   8 : db $FF, $40, $00, $00
|06CAF6| dw   0,   0 : db $E9, $00, $00, $02
|06CAFE| dw  16,   0 : db $E9, $40, $00, $02
|06CB06| dw   0,  16 : db $EB, $00, $00, $02
|06CB0E| dw  16,  16 : db $EB, $40, $00, $02
|06CB16| dw   0,  32 : db $ED, $00, $00, $02
|06CB1E| dw  16,  32 : db $ED, $40, $00, $02

endpool

;===================================================================================================

SpriteDraw_FairyQueen:
|06CB26| LDA.l $7EF3CA
|06CB2A| BNE SpriteDraw_FatFairy

;===================================================================================================

SpriteDraw_ThinFairy:
|06CB2C| JSR GetScreenCoordinates

|06CB2F| LDA.w $0DC0,X
|06CB32| ASL A
|06CB33| ASL A
|06CB34| STA.b $0D

|06CB36| LDA.w $0DC0,X
|06CB39| ASL A
|06CB3A| ASL A
|06CB3B| ASL A
|06CB3C| ADC.b $0D
|06CB3E| STA.b $06

|06CB40| PHX

;---------------------------------------------------------------------------------------------------

|06CB41| LDX.b #$0B

.next_object
|06CB43| PHX

|06CB44| TXA
|06CB45| CLC
|06CB46| ADC.b $06
|06CB48| TAX

|06CB49| LDA.b $00
|06CB4B| CLC
|06CB4C| ADC.w .offset_x,X
|06CB4F| STA.b ($90),Y

|06CB51| LDA.b $02
|06CB53| CLC
|06CB54| ADC.w .offset_y,X
|06CB57| INY
|06CB58| STA.b ($90),Y

|06CB5A| LDA.w .char,X
|06CB5D| INY
|06CB5E| STA.b ($90),Y

|06CB60| LDA.w .prop,X
|06CB63| ORA.b $05
|06CB65| INY
|06CB66| STA.b ($90),Y

|06CB68| PHY

|06CB69| TYA
|06CB6A| LSR A
|06CB6B| LSR A
|06CB6C| TAY

|06CB6D| LDA.w .oam_sizes,X
|06CB70| STA.b ($92),Y

|06CB72| PLY
|06CB73| INY

|06CB74| PLX
|06CB75| DEX
|06CB76| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06CB78| PLX

|06CB79| LDY.b #$FF
|06CB7B| LDA.b #$0B
|06CB7D| JSR CorrectOAMEntries

|06CB80| RTS

;===================================================================================================

SpriteDraw_FatFairy:
|06CB81| LDA.b #$0A
|06CB83| STA.b $06
|06CB85| STZ.b $07

|06CB87| LDA.w $0DC0,X

|06CB8A| ASL A
|06CB8B| ASL A

|06CB8C| ADC.w $0DC0,X

|06CB8F| ASL A
|06CB90| ASL A
|06CB91| ASL A
|06CB92| ASL A

|06CB93| ADC.b #<.oam_groups
|06CB95| STA.b $08

|06CB97| LDA.b #>.oam_groups
|06CB99| ADC.b #$00
|06CB9B| STA.b $09

|06CB9D| JSL TabulatedSpriteDraw.preset_quantity

|06CBA1| RTS

;===================================================================================================

Sprite_71_Leever:
|06CBA2| LDA.w $0D80,X
|06CBA5| BEQ .underground

|06CBA7| JSR SpriteDraw_Leever
|06CBAA| BRA .respawn

.underground
|06CBAC| JSR GetScreenCoordinates_wrapper

.respawn
|06CBAF| LDA.w $0F00,X
|06CBB2| BEQ .dont_respawn

|06CBB4| LDA.b #$08
|06CBB6| STA.w $0DD0,X

.dont_respawn
|06CBB9| JSR CheckIfActive_bank06
|06CBBC| JSR HandleSpriteRecoil_bank06

|06CBBF| LDA.w $0D80,X

|06CBC2| REP #$30

|06CBC4| AND.w #$00FF
|06CBC7| ASL A
|06CBC8| TAY

|06CBC9| LDA.w .vectors,Y
|06CBCC| PHA

|06CBCD| SEP #$30

|06CBCF| RTS

;---------------------------------------------------------------------------------------------------

.vectors
|06CBD0| dw Leever_Underground-1
|06CBD2| dw Leever_Emerge-1
|06CBD4| dw Leever_Attack-1
|06CBD6| dw Leever_Dig-1

;===================================================================================================

Leever_Underground:
|06CBD8| LDA.w $0DF0,X
|06CBDB| STA.w $0BA0,X
|06CBDE| BNE .delay

|06CBE0| INC.w $0D80,X

|06CBE3| LDA.b #$7F
|06CBE5| STA.w $0DF0,X

|06CBE8| RTS

;---------------------------------------------------------------------------------------------------

.delay
|06CBE9| LDA.b #$10
|06CBEB| JSR ApplySpeedTowardsLink
|06CBEE| JSR MoveSpriteXY_bank06
|06CBF1| JSR CheckSpriteTileCollision

|06CBF4| RTS

;===================================================================================================

UNREACHABLE_06CBF5:
|06CBF5| LDA.w $0DF0,X
|06CBF8| BNE .exit

|06CBFA| INC.w $0D80,X

|06CBFD| LDA.b #$7F
|06CBFF| STA.w $0DF0,X

.exit
|06CC02| RTS

;===================================================================================================

pool Leever_Emerge

.anim_step
|06CC03| db $0A, $09, $08, $07
|06CC07| db $06, $05, $04, $03
|06CC0B| db $02, $01, $02, $01
|06CC0F| db $02, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Leever_Emerge:
|06CC13| LDA.w $0DF0,X
|06CC16| STA.w $0BA0,X
|06CC19| BNE .delay

|06CC1B| INC.w $0D80,X

|06CC1E| JSL GetRandomNumber
|06CC22| AND.b #$3F
|06CC24| ADC.b #$A0
|06CC26| STA.w $0DF0,X

|06CC29| JMP.w ZeroVelocityXY_bank06

;---------------------------------------------------------------------------------------------------

.delay
|06CC2C| LSR A
|06CC2D| LSR A
|06CC2E| LSR A
|06CC2F| TAY

|06CC30| LDA.w .anim_step,Y
|06CC33| STA.w $0DC0,X

|06CC36| RTS

;===================================================================================================

pool Leever_Attack

.anim_step
|06CC37| db $09, $0A, $0B ; bleeds into next

.speed
|06CC3A| db $0C, $08

endpool

;---------------------------------------------------------------------------------------------------

Leever_Attack:
|06CC3C| JSR CheckDamageToAndFromLink_bank06

|06CC3F| LDA.w $0DF0,X
|06CC42| BNE .delay

.tile_collision
|06CC44| INC.w $0D80,X

|06CC47| LDA.b #$7F
|06CC49| STA.w $0DF0,X

|06CC4C| RTS

;---------------------------------------------------------------------------------------------------

.delay
|06CC4D| LDA.w $0E80,X
|06CC50| AND.b #$07
|06CC52| BNE .delay_turn

|06CC54| LDY.w $0D90,X

|06CC57| LDA.w .speed,Y
|06CC5A| JSR ApplySpeedTowardsLink

.delay_turn
|06CC5D| JSR MoveSpriteXY_bank06
|06CC60| JSR CheckSpriteTileCollision

|06CC63| LDA.w $0E70,X
|06CC66| BNE .tile_collision

|06CC68| INC.w $0E80,X

|06CC6B| LDA.w $0E80,X
|06CC6E| LSR A
|06CC6F| LSR A
|06CC70| AND.b #$03
|06CC72| TAY

|06CC73| LDA.w .anim_step,Y
|06CC76| STA.w $0DC0,X

|06CC79| RTS

;===================================================================================================

pool Leever_Dig

.anim_step
|06CC7A| db $0A, $09, $08, $07
|06CC7E| db $06, $05, $04, $03
|06CC82| db $02, $01, $02, $01
|06CC86| db $02, $01, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Leever_Dig:
|06CC8A| LDA.w $0DF0,X
|06CC8D| STA.w $0BA0,X
|06CC90| BNE .delay

|06CC92| STZ.w $0D80,X

|06CC95| JSL GetRandomNumber
|06CC99| AND.b #$1F
|06CC9B| ADC.b #$40
|06CC9D| STA.w $0DF0,X

|06CCA0| RTS

.delay
|06CCA1| LSR A
|06CCA2| LSR A
|06CCA3| LSR A
|06CCA4| EOR.b #$0F
|06CCA6| TAY

|06CCA7| LDA.w .anim_step,Y
|06CCAA| STA.w $0DC0,X

|06CCAD| RTS

;===================================================================================================

UNREACHABLE_06CCAE:
|06CCAE| RTS

;===================================================================================================

pool SpriteDraw_Leever

.offset_x
|06CCAF| dw   2,   6,   6,   6
|06CCB7| dw   0,   8,   8,   8
|06CCBF| dw   0,   8,   8,   8
|06CCC7| dw   0,   8,   0,   8
|06CCCF| dw   0,   8,   0,   8
|06CCD7| dw   0,   0,   0,   8
|06CCDF| dw   0,   0,   0,   8
|06CCE7| dw   0,   0,   0,   8
|06CCEF| dw   0,   0,   0,   8
|06CCF7| dw   0,   0,   0,   0
|06CCFF| dw   0,   0,   0,   0
|06CD07| dw   0,   0,   0,   0
|06CD0F| dw   0,   0,   0,   0
|06CD17| dw   0,   0,   0,   0

;---------------------------------------------------------------------------------------------------

.offset_y
|06CD1F| dw   8,   8,   8,   8
|06CD27| dw   8,   8,   8,   8
|06CD2F| dw   8,   8,   8,   8
|06CD37| dw   5,   5,   8,   8
|06CD3F| dw   5,   5,   8,   8
|06CD47| dw   2,   2,   8,   8
|06CD4F| dw   1,   1,   8,   8
|06CD57| dw   0,   0,   8,   8
|06CD5F| dw  -1,  -1,   8,   8
|06CD67| dw   8,  -2,  -2,   0
|06CD6F| dw   8,  -2,  -2,   0
|06CD77| dw   8,  -2,  -2,   0
|06CD7F| dw   8,  -2,  -2,   0
|06CD87| dw   8,  -2,  -2,   0

;---------------------------------------------------------------------------------------------------

.char
|06CD8F| db $28, $28, $28, $28
|06CD93| db $28, $28, $28, $28
|06CD97| db $38, $38, $38, $38
|06CD9B| db $08, $09, $28, $28
|06CD9F| db $08, $09, $D9, $D9
|06CDA3| db $08, $08, $D8, $D8
|06CDA7| db $08, $08, $DA, $DA
|06CDAB| db $06, $06, $D9, $D9
|06CDAF| db $26, $26, $D8, $D8
|06CDB3| db $6C, $06, $06, $00
|06CDB7| db $6C, $26, $26, $00
|06CDBB| db $6C, $06, $06, $00
|06CDBF| db $6C, $26, $26, $00
|06CDC3| db $6C, $08, $08, $00

;---------------------------------------------------------------------------------------------------

.prop
|06CDC7| db $01, $41, $41, $41
|06CDCB| db $01, $41, $41, $41
|06CDCF| db $01, $41, $41, $41
|06CDD3| db $01, $01, $01, $41
|06CDD7| db $01, $01, $00, $40
|06CDDB| db $01, $01, $00, $40
|06CDDF| db $01, $01, $00, $40
|06CDE3| db $01, $01, $00, $40
|06CDE7| db $00, $01, $00, $40
|06CDEB| db $06, $41, $41, $00
|06CDEF| db $06, $41, $41, $00
|06CDF3| db $06, $01, $01, $00
|06CDF7| db $06, $01, $01, $00
|06CDFB| db $06, $01, $01, $00

;---------------------------------------------------------------------------------------------------

.size
|06CDFF| db $00, $00, $00, $00
|06CE03| db $00, $00, $00, $00
|06CE07| db $00, $00, $00, $00
|06CE0B| db $00, $00, $00, $00
|06CE0F| db $00, $00, $00, $00
|06CE13| db $02, $02, $00, $00
|06CE17| db $02, $02, $00, $00
|06CE1B| db $02, $02, $00, $00
|06CE1F| db $02, $02, $00, $00
|06CE23| db $02, $02, $02, $00
|06CE27| db $02, $02, $02, $00
|06CE2B| db $02, $02, $02, $00
|06CE2F| db $02, $02, $02, $00
|06CE33| db $02, $02, $02, $00

;---------------------------------------------------------------------------------------------------

.object_count
|06CE37| db $01
|06CE38| db $01
|06CE39| db $01
|06CE3A| db $03
|06CE3B| db $03
|06CE3C| db $03
|06CE3D| db $03
|06CE3E| db $03
|06CE3F| db $03
|06CE40| db $01
|06CE41| db $01
|06CE42| db $01
|06CE43| db $01
|06CE44| db $01

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Leever:
|06CE45| JSR GetScreenCoordinates

|06CE48| LDA.w $0DC0,X
|06CE4B| TAY

|06CE4C| ASL A
|06CE4D| ASL A
|06CE4E| STA.b $06

|06CE50| PHX

|06CE51| LDX.w .object_count,Y
|06CE54| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
|06CE56| PHX

|06CE57| TXA
|06CE58| CLC
|06CE59| ADC.b $06
|06CE5B| PHA

|06CE5C| ASL A
|06CE5D| TAX

|06CE5E| REP #$20

|06CE60| LDA.b $00
|06CE62| CLC
|06CE63| ADC.w .offset_x,X
|06CE66| STA.b ($90),Y

|06CE68| AND.w #$0100
|06CE6B| STA.b $0E

|06CE6D| LDA.b $02
|06CE6F| CLC
|06CE70| ADC.w .offset_y,X

|06CE73| INY
|06CE74| STA.b ($90),Y

|06CE76| CLC
|06CE77| ADC.w #$0010
|06CE7A| CMP.w #$0100

|06CE7D| SEP #$20
|06CE7F| BCC .on_screen

|06CE81| LDA.b #$F0
|06CE83| STA.b ($90),Y

.on_screen
|06CE85| PLX

|06CE86| LDA.b $05
|06CE88| PHA

|06CE89| LDA.w .char,X
|06CE8C| INY
|06CE8D| STA.b ($90),Y

|06CE8F| CMP.b #$60
|06CE91| BCS .change_props

|06CE93| CMP.b #$28
|06CE95| BEQ .change_props

|06CE97| CMP.b #$38
|06CE99| BNE .dont_change_props

.change_props
|06CE9B| LDA.b $05
|06CE9D| AND.b #$F0
|06CE9F| STA.b $05

.dont_change_props
|06CEA1| LDA.w .prop,X
|06CEA4| ORA.b $05
|06CEA6| INY
|06CEA7| STA.b ($90),Y

|06CEA9| PLA
|06CEAA| STA.b $05

|06CEAC| PHY

|06CEAD| TYA
|06CEAE| LSR A
|06CEAF| LSR A
|06CEB0| TAY

|06CEB1| LDA.w .size,X
|06CEB4| ORA.b $0F
|06CEB6| STA.b ($92),Y

|06CEB8| PLY
|06CEB9| INY

|06CEBA| PLX
|06CEBB| DEX
|06CEBC| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06CEBE| PLX

|06CEBF| RTS

;===================================================================================================

Sprite_D8_Heart:
|06CEC0| JSR SpriteDraw_AbsorbableTransient
|06CEC3| JSR CheckIfActive_bank06

|06CEC6| JSR TestAbsorption
|06CEC9| JSR HandleDraggingByAncilla

|06CECC| JSR MoveSpriteXY_bank06
|06CECF| JSR MoveSpriteZ_bank06

|06CED2| LDA.w $0F70,X
|06CED5| BPL .airborne

|06CED7| STZ.w $0F70,X

|06CEDA| INC.w $0D80,X

|06CEDD| STZ.w $0DC0,X

.airborne
|06CEE0| LDA.w $0F50,X
|06CEE3| AND.b #$BF
|06CEE5| STA.w $0F50,X

|06CEE8| LDA.w $0D50,X
|06CEEB| BMI .moving_left

.moving_right
|06CEED| LDA.w $0F50,X
|06CEF0| EOR.b #$40
|06CEF2| STA.w $0F50,X

.moving_left
|06CEF5| LDA.w $0D80,X
|06CEF8| CMP.b #$03
|06CEFA| BCC .not_maxed

|06CEFC| LDA.b #$03

.not_maxed
|06CEFE| JSL JumpTableLocal
|06CF02| dw HeartRefill_InitializeAscent
|06CF04| dw HeartRefill_BeginDescending
|06CF06| dw HeartRefill_GlideGroundward
|06CF08| dw ZeroVelocityXYZ_bank06

;===================================================================================================

HeartRefill_InitializeAscent:
|06CF0A| INC.w $0D80,X

|06CF0D| LDA.b #$12
|06CF0F| STA.w $0DF0,X

|06CF12| LDA.b #$14
|06CF14| STA.w $0F80,X

|06CF17| LDA.b #$01
|06CF19| STA.w $0DC0,X

|06CF1C| STZ.w $0DE0,X

|06CF1F| RTS

;===================================================================================================

HeartRefill_BeginDescending:
|06CF20| LDA.w $0DF0,X
|06CF23| BNE .decelerate

|06CF25| INC.w $0D80,X

|06CF28| LDA.b #$FD
|06CF2A| STA.w $0F80,X

|06CF2D| STZ.w $0D50,X

|06CF30| RTS

.decelerate
|06CF31| DEC.w $0F80,X

|06CF34| RTS

;===================================================================================================

pool HeartRefill_GlideGroundward

.speed
|06CF35| db  10, -10

endpool

;---------------------------------------------------------------------------------------------------

HeartRefill_GlideGroundward:
|06CF37| LDA.w $0DF0,X
|06CF3A| BNE .exit

|06CF3C| LDA.w $0DE0,X
|06CF3F| AND.b #$01
|06CF41| TAY

|06CF42| LDA.w $0D50,X
|06CF45| CLC
|06CF46| ADC.w PositiveAndNegativeOne,Y
|06CF49| STA.w $0D50,X

|06CF4C| CMP.w .speed,Y
|06CF4F| BNE .exit

|06CF51| INC.w $0DE0,X

|06CF54| LDA.b #$08
|06CF56| STA.w $0DF0,X

.exit
|06CF59| RTS

;===================================================================================================

ZeroVelocityXYZ_bank06:
|06CF5A| STZ.w $0F80,X

;===================================================================================================

ZeroVelocityXY_bank06:
|06CF5D| STZ.w $0D50,X
|06CF60| STZ.w $0D40,X

|06CF63| RTS

;===================================================================================================

HandleDraggingByAncilla:
|06CF64| LDA.w $0DA0,X
|06CF67| BEQ .exit

|06CF69| TAY
|06CF6A| DEY

|06CF6B| LDA.w $0C4A,Y
|06CF6E| BEQ .handler_gone

|06CF70| LDA.w $0C04,Y
|06CF73| STA.w $0D10,X

|06CF76| LDA.w $0C18,Y
|06CF79| STA.w $0D30,X

|06CF7C| LDA.w $0BFA,Y
|06CF7F| STA.w $0D00,X

|06CF82| LDA.w $0C0E,Y
|06CF85| STA.w $0D20,X

|06CF88| STZ.w $0F70,X

.hard_exit
|06CF8B| PLA
|06CF8C| PLA

.exit
|06CF8D| RTS

;---------------------------------------------------------------------------------------------------

.handler_gone
|06CF8E| JSL GetAbsorbedAsItem_long

|06CF92| BRA .hard_exit

;===================================================================================================

Sprite_E3_Fairy:
|06CF94| LDA.b #$01
|06CF96| STA.w $0BA0,X

|06CF99| LDA.w $0D80,X
|06CF9C| BNE .continue

|06CF9E| LDA.b $1B
|06CFA0| BNE .indoors

|06CFA2| LDA.b #$30
|06CFA4| STA.w $0B89,X

.indoors
|06CFA7| JSR SpriteDraw_AbsorbableTransient

.continue
|06CFAA| JSR Fairy_CheckIfTouchable

|06CFAD| JSR CheckIfActive_bank06

|06CFB0| LDA.w $0D80,X
|06CFB3| JSL JumpTableLocal
|06CFB7| dw Fairy_Prancing
|06CFB9| dw Fairy_HandleCapture

;===================================================================================================

Fairy_Prancing:
|06CFBB| LDA.w $0F10,X
|06CFBE| BNE .not_nabbed_directly

|06CFC0| JSR CheckDamageToLink
|06CFC3| BCC .no_contact

|06CFC5| JSL GetAbsorbedAsItem_long
|06CFC9| BRA .not_nabbed_directly

.no_contact
|06CFCB| JSR CheckDamageFromLink
|06CFCE| BEQ .not_nabbed_directly

|06CFD0| INC.w $0D80,X

|06CFD3| LDA.b #$C9 ; MESSAGE 00C9
|06CFD5| LDY.b #$00
|06CFD7| JSL ShowMessageUnconditional

|06CFDB| RTS

.not_nabbed_directly
|06CFDC| JSR HandleDraggingByAncilla
|06CFDF| JSL HandleFairyMovement

|06CFE3| RTS

;===================================================================================================

Fairy_HandleCapture:
|06CFE4| LDA.w $1CE8
|06CFE7| BNE .release

|06CFE9| JSL FindEmptyBottle
|06CFED| BMI .no_space

|06CFEF| PHX

|06CFF0| TAX

|06CFF1| LDA.b #$06
|06CFF3| STA.l $7EF35C,X

|06CFF7| JSL RefreshItemIcon

|06CFFB| PLX

|06CFFC| STZ.w $0DD0,X

|06CFFF| RTS

;---------------------------------------------------------------------------------------------------

.no_space
|06D000| LDA.b #$CA ; MESSAGE 00CA
|06D002| LDY.b #$00
|06D004| JSL ShowMessageUnconditional

.release
|06D008| LDA.b #$30
|06D00A| STA.w $0F10,X

|06D00D| STZ.w $0D80,X

|06D010| RTS

;===================================================================================================

Fairy_CheckIfTouchable:
|06D011| LDA.b $11
|06D013| CMP.b #$02
|06D015| BNE .touchable

|06D017| REP #$20

|06D019| LDA.w $1CF0

|06D01C| CMP.w #$00C9 ; MESSAGE 00C9
|06D01F| BEQ .untouchable

|06D021| CMP.w #$00CA ; MESSAGE 00CA
|06D024| BNE .touchable

.untouchable
|06D026| SEP #$30

|06D028| LDA.b #$28
|06D02A| STA.w $0F10,X

.touchable
|06D02D| SEP #$30

|06D02F| RTS

;===================================================================================================

KeyRoomFlagMasks:
|06D030| db $40, $20

;===================================================================================================

Sprite_E4_SmallKey:
Sprite_E5_BigKey:
|06D032| LDY.w $0CBA,X

|06D035| LDA.w $0403
|06D038| AND.w KeyRoomFlagMasks,Y
|06D03B| BEQ .not_obtained

|06D03D| STZ.w $0DD0,X

|06D040| RTS

.not_obtained
|06D041| JSL DrawRippleIfInWater
|06D045| JSR SpriteDraw_Absorbable

|06D048| BRA Absorbable_Main

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
|06D04A| JSL DrawRippleIfInWater
|06D04E| JSR SpriteDraw_AbsorbableTransient

;===================================================================================================

Absorbable_Main:
|06D051| JSR CheckIfActive_bank06
|06D054| JSR MoveSpriteZ_bank06
|06D057| JSR MoveSpriteXY_bank06

|06D05A| LDA.w $0EE0,X
|06D05D| BNE .skip_tile_collision

|06D05F| JSR CheckSpriteTileCollision
|06D062| JSR BounceOffWall

.skip_tile_collision
|06D065| LDA.w $0F80,X
|06D068| SEC
|06D069| SBC.b #$02
|06D06B| STA.w $0F80,X

|06D06E| LDA.w $0F70,X
|06D071| BPL .aloft

|06D073| STZ.w $0F70,X

|06D076| LDA.w $0D50,X
|06D079| ASL A
|06D07A| ROR.w $0D50,X

|06D07D| LDA.w $0D40,X
|06D080| ASL A
|06D081| ROR.w $0D40,X

|06D084| LDA.w $0F80,X
|06D087| EOR.b #$FF
|06D089| INC A

|06D08A| LSR A
|06D08B| CMP.b #$09
|06D08D| BCS .no_bounce

|06D08F| JSR ZeroVelocityXYZ_bank06
|06D092| BRA .aloft

;---------------------------------------------------------------------------------------------------

.no_bounce
|06D094| STA.w $0F80,X

|06D097| LDA.l $7FF9C2,X
|06D09B| CMP.b #$08 ; TILETYPE 08
|06D09D| BEQ .water_tile

|06D09F| CMP.b #$09 ; TILETYPE 09
|06D0A1| BNE .not_water_tile

.water_tile
|06D0A3| STZ.w $0F80,X

|06D0A6| JSL Sprite_SpawnSmallSplash
|06D0AA| BMI .aloft

|06D0AC| LDA.w $0E60,X
|06D0AF| AND.b #$20
|06D0B1| BEQ .aloft

|06D0B3| LDA.w $0D10,Y
|06D0B6| SBC.b #$04
|06D0B8| STA.w $0D10,Y

|06D0BB| LDA.w $0D30,Y
|06D0BE| SBC.b #$00
|06D0C0| STA.w $0D30,Y

|06D0C3| LDA.w $0D00,Y
|06D0C6| SBC.b #$04
|06D0C8| STA.w $0D00,Y

|06D0CB| LDA.w $0D20,Y
|06D0CE| SBC.b #$00
|06D0D0| STA.w $0D20,Y

|06D0D3| BRA .aloft

;---------------------------------------------------------------------------------------------------

.not_water_tile
|06D0D5| LDA.w $0E20,X
|06D0D8| CMP.b #$E4 ; SPRITE E4
|06D0DA| BCC .aloft

|06D0DC| LDA.b $1B
|06D0DE| BEQ .aloft

|06D0E0| LDA.b #$05 ; SFX2.05
|06D0E2| JSL QueueSpriteSFX2WithPan

.aloft
|06D0E6| JSR HandleDraggingByAncilla
|06D0E9| JSR TestAbsorption

|06D0EC| RTS

;===================================================================================================

Absorbable_HandleBlink:
|06D0ED| LDA.w $0B58,X
|06D0F0| BEQ .exit

|06D0F2| LDA.b $11
|06D0F4| ORA.w $0FC1
|06D0F7| BNE .exit

|06D0F9| LDA.b $1A
|06D0FB| LSR A
|06D0FC| BCS .delay_tick

|06D0FE| DEC.w $0B58,X

.delay_tick
|06D101| LDA.w $0B58,X
|06D104| BNE .dont_disappear

|06D106| STZ.w $0DD0,X

.dont_disappear
|06D109| CMP.b #$28
|06D10B| BCS .exit

|06D10D| LSR A
|06D10E| BCS .exit

|06D110| JSR GetScreenCoordinates_wrapper

|06D113| PLA
|06D114| PLA

.exit
|06D115| RTS

;===================================================================================================

TestAbsorption:
|06D116| LDA.w $0F10,X
|06D119| BNE .exit

|06D11B| JSR CheckDamageToLink_staggered
|06D11E| BCC .exit

|06D120| JSL GetAbsorbedAsItem_long

.exit
|06D124| RTS

;===================================================================================================

GetAbsorbedAsItem_long:
|06D125| PHB
|06D126| PHK
|06D127| PLB

|06D128| JSR GetAbsorbedAsItem

|06D12B| PLB

|06D12C| RTL

;===================================================================================================

Absorbable_SFX3:
|06D12D| db $0B ; SFX3.0B - heart
|06D12E| db $0A ; SFX3.0A - green rupee
|06D12F| db $0A ; SFX3.0A - blue rupee
|06D130| db $0A ; SFX3.0A - red rupee
|06D131| db $0B ; SFX3.0B - bomb refill 1
|06D132| db $0B ; SFX3.0B - bomb refill 4
|06D133| db $0B ; SFX3.0B - bomb refill 8
|06D134| db $0B ; SFX3.0B - small magic
|06D135| db $0B ; SFX3.0B - full magic
|06D136| db $0B ; SFX3.0B - arrow refill 5
|06D137| db $0B ; SFX3.0B - arrow refill 10
|06D138| db $0B ; SFX3.0B - fairy
|06D139| db $2F ; SFX3.2F - small key
|06D13A| db $2F ; SFX3.2F - big key
|06D13B| db $0B ; SFX3.0B - stolen shield

;---------------------------------------------------------------------------------------------------

GetAbsorbedAsItem:
|06D13C| STZ.w $0DD0,X

|06D13F| LDA.w $0E20,X
|06D142| SEC
|06D143| SBC.b #$D8
|06D145| TAY

|06D146| LDA.w Absorbable_SFX3,Y
|06D149| JSL QueueSpriteSFX3WithPan

|06D14D| TYA
|06D14E| JSL JumpTableLocal
|06D152| dw Absorb_Heart
|06D154| dw Absorb_Rupee
|06D156| dw Absorb_Rupee
|06D158| dw Absorb_Rupee
|06D15A| dw Absorb_Bomb
|06D15C| dw Absorb_Bomb
|06D15E| dw Absorb_Bomb
|06D160| dw Absorb_SmallMagic
|06D162| dw Absorb_FullMagic
|06D164| dw Absorb_Arrows_5
|06D166| dw Absorb_Arrows_10
|06D168| dw Absorb_Fairy
|06D16A| dw Absorb_SmallKey
|06D16C| dw Absorb_BigKey
|06D16E| dw Absorb_Shield

;===================================================================================================

Absorb_Shield:
|06D170| LDA.w $0E30,X
|06D173| STA.l $7EF35A

|06D177| RTS

;===================================================================================================

Absorb_BigKey:
|06D178| STZ.w $02E9
|06D17B| LDY.b #$32 ; ITEMGET 32

|06D17D| PHX

|06D17E| JSL GrantItemReceipt

|06D182| PLX

|06D183| BRA Absorb_FlagKey

;===================================================================================================

Absorb_SmallKey:
|06D185| LDA.l $7EF36F
|06D189| INC A
|06D18A| STA.l $7EF36F

;===================================================================================================

Absorb_FlagKey:
|06D18E| LDA.w $0E30,X
|06D191| STA.w $0BC0,X

|06D194| LDY.w $0CBA,X

|06D197| LDA.w $0403
|06D19A| ORA.w KeyRoomFlagMasks,Y
|06D19D| STA.w $0403

|06D1A0| JSL ManuallySetDeathFlagUW

|06D1A4| RTS

;===================================================================================================

Absorb_Fairy:
|06D1A5| LDA.b #$31 ; SFX2.31
|06D1A7| JSL QueueSpriteSFX2WithPan

|06D1AB| LDA.b #$38
|06D1AD| BRA Absorb_AddHealth

;===================================================================================================

Absorb_Heart:
|06D1AF| LDA.b #$08

;===================================================================================================

Absorb_AddHealth:
|06D1B1| CLC
|06D1B2| ADC.l $7EF372
|06D1B6| STA.l $7EF372

|06D1BA| RTS

;===================================================================================================

pool Absorb_Rupee

.denomination
|06D1BB| db  1
|06D1BC| db  5
|06D1BD| db  20

endpool

;---------------------------------------------------------------------------------------------------

Absorb_Rupee:
|06D1BE| LDY.w $0E20,X

|06D1C1| LDA.b #$00
|06D1C3| XBA

|06D1C4| LDA.w .denomination-$D9,Y ; D9 being the sprite ID of a green rupee

|06D1C7| REP #$20

|06D1C9| CLC
|06D1CA| ADC.l $7EF360
|06D1CE| STA.l $7EF360

|06D1D2| SEP #$20

|06D1D4| RTS

;===================================================================================================

pool Absorb_Bomb

.megatonnage
|06D1D5| db 1
|06D1D6| db 4
|06D1D7| db 8

endpool

;---------------------------------------------------------------------------------------------------

Absorb_Bomb:
|06D1D8| LDY.w $0E20,X

|06D1DB| LDA.w .megatonnage-$DC,Y ; DC being the sprite ID of a single bomb
|06D1DE| CLC
|06D1DF| ADC.l $7EF375
|06D1E3| STA.l $7EF375

|06D1E7| RTS

;===================================================================================================

Absorb_SmallMagic:
|06D1E8| LDA.l $7EF373
|06D1EC| CLC
|06D1ED| ADC.b #$10
|06D1EF| BRA Absorb_AddMagic

;===================================================================================================

Absorb_FullMagic:
|06D1F1| LDA.b #$80

;===================================================================================================

Absorb_AddMagic:
|06D1F3| STA.l $7EF373

|06D1F7| RTS

;===================================================================================================

Absorb_Arrows_5:
|06D1F8| LDA.w $0EB0,X
|06D1FB| BNE Absorb_AddArrows

|06D1FD| LDA.b #5
|06D1FF| BRA Absorb_AddArrows

;===================================================================================================

Absorb_Arrows_10:
|06D201| LDA.b #10

;===================================================================================================

Absorb_AddArrows:
|06D203| CLC
|06D204| ADC.l $7EF376
|06D208| STA.l $7EF376

|06D20C| RTS

;===================================================================================================

pool SpriteDraw_Absorbable

.gfx_shape
|06D20D| db $00 ; heart
|06D20E| db $01 ; green rupee
|06D20F| db $01 ; blue rupee
|06D210| db $01 ; red rupee
|06D211| db $02 ; bomb refill 1
|06D212| db $02 ; bomb refill 4
|06D213| db $02 ; bomb refill 8
|06D214| db $00 ; small magic
|06D215| db $01 ; full magic
|06D216| db $01 ; arrow refill 5
|06D217| db $02 ; arrow refill 10
|06D218| db $02 ; fairy
|06D219| db $01 ; small key
|06D21A| db $02 ; big key
|06D21B| db $02 ; stolen shield

.numeral
|06D21C| db $00 ; heart
|06D21D| db $00 ; green rupee
|06D21E| db $00 ; blue rupee
|06D21F| db $00 ; red rupee
|06D220| db $01 ; bomb refill 1
|06D221| db $02 ; bomb refill 4
|06D222| db $03 ; bomb refill 8
|06D223| db $00 ; small magic
|06D224| db $00 ; full magic
|06D225| db $04 ; arrow refill 5
|06D226| db $05 ; arrow refill 10
|06D227| db $00 ; fairy
|06D228| db $00 ; small key
|06D229| db $00 ; big key
|06D22A| db $00 ; stolen shield

endpool

;===================================================================================================

UNREACHABLE_06D22B:
|06D22B| db $02, $04, $06, $02

;===================================================================================================

SpriteDraw_AbsorbableTransient:
|06D22F| JSR Absorbable_HandleBlink

;===================================================================================================

SpriteDraw_Absorbable:
|06D232| LDA.w $0FB3
|06D235| BNE .continue

|06D237| LDA.b $1B
|06D239| BEQ .continue

|06D23B| LDA.b #$30
|06D23D| STA.w $0B89,X

.continue
|06D240| LDA.w $0FC6
|06D243| CMP.b #$03
|06D245| BCS .exit

|06D247| LDA.w $0E10,X
|06D24A| BEQ .use_selected_region

|06D24C| LDA.b #$0C
|06D24E| JSL AllocateOAMInRegionC

.use_selected_region
|06D252| LDA.w $0E90,X
|06D255| BNE .abort

|06D257| LDY.w $0E20,X

|06D25A| LDA.w .numeral-$D8,Y
|06D25D| BEQ .not_special

|06D25F| JMP.w .draw_special_char

;---------------------------------------------------------------------------------------------------

.not_special
|06D262| LDA.w .gfx_shape-$D8,Y
|06D265| BNE .not_8x8

|06D267| JMP.w SpriteDraw_SingleSmall

;---------------------------------------------------------------------------------------------------

.not_8x8
|06D26A| CMP.b #$02
|06D26C| BNE .is_8x16

;---------------------------------------------------------------------------------------------------

|06D26E| LDA.w $0E20,X
|06D271| CMP.b #$E6 ; SPRITE E6
|06D273| BNE .not_shield

|06D275| LDA.w $0E30,X
|06D278| CMP.b #$01
|06D27A| BEQ .is_8x16

|06D27C| LDA.b #$01
|06D27E| STA.w $0DC0,X

.not_shield
|06D281| JMP.w SpriteDraw_SingleLarge

;---------------------------------------------------------------------------------------------------

.is_8x16
|06D284| JMP.w SpriteDraw_ThinAndTall

;---------------------------------------------------------------------------------------------------

.abort
|06D287| PLA
|06D288| PLA

.exit
|06D289| RTS

;---------------------------------------------------------------------------------------------------

.numbered_offset_x
|06D28A| dw   0,   0,   8,   0
|06D292| dw   0,   8,   0,   0
|06D29A| dw   8,   0,   0,   2
|06D2A2| dw   0,   0,   2,   0
|06D2AA| dw   0,   0

;===================================================================================================

#Octorok_hflip:
|06D2AE| db $40, $00, $00, $00

;===================================================================================================

.numbered_offset_y
|06D2B2| dw   0,   0,   8,   0
|06D2BA| dw   0,   8,   0,   0
|06D2C2| dw   8,   0,   8,   8
|06D2CA| dw   0,   8,   8,   0
|06D2D2| dw   8,   8

;---------------------------------------------------------------------------------------------------

.number_char
|06D2D6| db $6E, $6E, $68, $6E, $6E, $78, $6E, $6E
|06D2DE| db $79, $63, $73, $69, $63, $73, $6A, $63
|06D2E6| db $73, $73

;---------------------------------------------------------------------------------------------------

.number_prop
|06D2E8| db $02, $02, $00, $02, $02, $00, $02, $02
|06D2F0| db $00, $00, $00, $00, $00, $00, $00, $00
|06D2F8| db $00, $00

;---------------------------------------------------------------------------------------------------

.draw_special_char
|06D2FA| DEC A
|06D2FB| STA.b $06

|06D2FD| JSR GetScreenCoordinates

|06D300| LDA.b $06
|06D302| ASL A
|06D303| ADC.b $06
|06D305| STA.b $06

|06D307| PHX

|06D308| LDA.w $0EB0,X
|06D30B| CMP.b #$01

|06D30D| LDX.b #$02
|06D30F| BCC .next_object

|06D311| DEX

;---------------------------------------------------------------------------------------------------

.next_object
|06D312| PHX

|06D313| TXA
|06D314| CLC
|06D315| ADC.b $06
|06D317| PHA

|06D318| ASL A
|06D319| TAX

|06D31A| REP #$20

|06D31C| LDA.b $00
|06D31E| CLC
|06D31F| ADC.w .numbered_offset_x,X
|06D322| STA.b ($90),Y

|06D324| AND.w #$0100
|06D327| STA.b $0E

|06D329| LDA.b $02
|06D32B| CLC
|06D32C| ADC.w .numbered_offset_y,X

|06D32F| INY
|06D330| STA.b ($90),Y

|06D332| CLC
|06D333| ADC.w #$0010
|06D336| CMP.w #$0100

|06D339| SEP #$20
|06D33B| BCC .on_screen

|06D33D| LDA.b #$F0
|06D33F| STA.b ($90),Y

.on_screen
|06D341| PLX

|06D342| LDA.w .number_char,X
|06D345| INY
|06D346| STA.b ($90),Y

|06D348| INY

|06D349| LDA.b $05
|06D34B| STA.b ($90),Y

|06D34D| PHY

|06D34E| TYA
|06D34F| LSR A
|06D350| LSR A
|06D351| TAY

|06D352| LDA.w .number_prop,X
|06D355| ORA.b $0F
|06D357| STA.b ($92),Y

|06D359| PLY
|06D35A| INY

|06D35B| PLX
|06D35C| DEX
|06D35D| BPL .next_object

|06D35F| PLX

|06D360| JMP.w DrawSpriteShadow

;===================================================================================================

pool Sprite_08_Octorok

.direction
|06D363| db   3,   2,   0,   1

.speed_x
|06D367| db  24, -24,   0,   0

.speed_y
|06D36B| db   0,   0,  24, -24

.unused
|06D36F| db $01, $02, $04, $08

.timer
|06D373| db  60, 128, 160, 128

endpool

;===================================================================================================

Sprite_08_Octorok:
#Sprite_0A_Octorok4way:
|06D377| LDY.w $0DE0,X
|06D37A| PHY

|06D37B| LDA.w $0E00,X
|06D37E| BEQ .not_spinning

|06D380| LDA.w .direction,Y
|06D383| STA.w $0DE0,X

.not_spinning
|06D386| STZ.b $00

|06D388| LDA.w $0DC0,X
|06D38B| CMP.b #$07
|06D38D| BNE .no_flip

|06D38F| LDA.b #$40
|06D391| STA.b $00

.no_flip
|06D393| LDA.w $0F50,X
|06D396| AND.b #$BF
|06D398| ORA.w Octorok_hflip,Y
|06D39B| ORA.b $00
|06D39D| STA.w $0F50,X

|06D3A0| JSR SpriteDraw_Octorok

|06D3A3| PLA
|06D3A4| STA.w $0DE0,X

|06D3A7| JSR CheckIfActive_bank06
|06D3AA| JSR HandleSpriteRecoil_bank06
|06D3AD| JSR MoveSpriteXY_bank06
|06D3B0| JSR CheckDamageToAndFromLink_bank06

|06D3B3| LDA.w $0D80,X
|06D3B6| AND.b #$01
|06D3B8| BNE .octorok_used_barrage

|06D3BA| LDA.w $0DE0,X
|06D3BD| AND.b #$02
|06D3BF| ASL A
|06D3C0| STA.b $00

|06D3C2| INC.w $0E80,X

|06D3C5| LDA.w $0E80,X
|06D3C8| LSR A
|06D3C9| LSR A
|06D3CA| LSR A
|06D3CB| AND.b #$03
|06D3CD| ORA.b $00
|06D3CF| STA.w $0DC0,X

|06D3D2| LDA.w $0DF0,X
|06D3D5| BNE .wait

|06D3D7| INC.w $0D80,X

|06D3DA| LDY.w $0E20,X

|06D3DD| LDA.w .timer-8,Y
|06D3E0| STA.w $0DF0,X

|06D3E3| RTS

;---------------------------------------------------------------------------------------------------

.wait
|06D3E4| LDY.w $0DE0,X

|06D3E7| LDA.w .speed_x,Y
|06D3EA| STA.w $0D50,X

|06D3ED| LDA.w .speed_y,Y
|06D3F0| STA.w $0D40,X

|06D3F3| JSR CheckSpriteTileCollision
|06D3F6| LDA.w $0E70,X
|06D3F9| BEQ .no_collision

|06D3FB| LDA.w $0DE0,X
|06D3FE| EOR.b #$01
|06D400| STA.w $0DE0,X

|06D403| BRA .exit

.no_collision
|06D405| RTS

;---------------------------------------------------------------------------------------------------

.octorok_used_barrage
|06D406| JSR ZeroVelocityXY_bank06

|06D409| LDA.w $0DF0,X
|06D40C| BNE Octorock_ShootEmUp

|06D40E| INC.w $0D80,X

|06D411| LDA.w $0DE0,X
|06D414| PHA

|06D415| JSL GetRandomNumber
|06D419| AND.b #$3F
|06D41B| ADC.b #$30
|06D41D| STA.w $0DF0,X

|06D420| AND.b #$03
|06D422| STA.w $0DE0,X

|06D425| PLA
|06D426| CMP.w $0DE0,X
|06D429| BEQ .exit

|06D42B| EOR.w $0DE0,X
|06D42E| BNE .exit

|06D430| LDA.b #$08
|06D432| STA.w $0E00,X

.exit
|06D435| RTS

;===================================================================================================

Octorock_ShootEmUp:
|06D436| LDA.w $0E20,X
|06D439| SEC
|06D43A| SBC.b #$08

|06D43C| REP #$30

|06D43E| AND.w #$00FF
|06D441| ASL A
|06D442| TAY

|06D443| LDA.w .vectors,Y
|06D446| DEC A
|06D447| PHA

|06D448| SEP #$30

|06D44A| RTS

.vectors
|06D44B| dw Octorok_ShootSingle ; Sprite 08
|06D44D| dw $0000
|06D44F| dw Octorok_Shoot4Ways ; Sprite 0A

;===================================================================================================

pool Octorok_ShootSingle

.mouth_anim_step
|06D451| db $00, $02, $02, $02
|06D455| db $01, $01, $01, $00
|06D459| db $00, $00, $00, $00
|06D45D| db $02, $02, $02, $02
|06D461| db $02, $01, $01, $00

endpool

;===================================================================================================

pool Octorok_Shoot4Ways

.mouth_anim_step
|06D465| db $02, $02, $02, $02
|06D469| db $02, $02, $02, $02
|06D46D| db $01, $00

endpool

;===================================================================================================

Octorok_ShootSingle:
|06D46F| LDA.w $0DF0,X
|06D472| CMP.b #$1C
|06D474| BNE .bide_time

|06D476| PHA

|06D477| JSR Octorok_FireLoogie

|06D47A| PLA

.bide_time
|06D47B| LSR A
|06D47C| LSR A
|06D47D| LSR A
|06D47E| TAY

|06D47F| LDA.w .mouth_anim_step,Y
|06D482| STA.w $0DB0,X

|06D485| RTS

;===================================================================================================

pool Octorok_Shoot4Ways

.next_direction
|06D486| db $02, $03, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

Octorok_Shoot4Ways:
|06D48A| LDA.w $0DF0,X
|06D48D| PHA

|06D48E| CMP.b #$80
|06D490| BCS .animate

|06D492| AND.b #$0F
|06D494| BNE .delay_turn

|06D496| PHA

|06D497| LDY.w $0DE0,X

|06D49A| LDA.w .next_direction,Y
|06D49D| STA.w $0DE0,X

|06D4A0| PLA

.delay_turn
|06D4A1| CMP.b #$08
|06D4A3| BNE .animate

|06D4A5| JSR Octorok_FireLoogie

.animate
|06D4A8| PLA
|06D4A9| LSR A
|06D4AA| LSR A
|06D4AB| LSR A
|06D4AC| LSR A
|06D4AD| TAY

|06D4AE| LDA.w .mouth_anim_step,Y
|06D4B1| STA.w $0DB0,X

|06D4B4| RTS

;===================================================================================================

pool Octorok_FireLoogie

.offset_x_low
|06D4B5| db  12, -12,   0,   0

.offset_x_high
|06D4B9| db   0,  -1,   0,   0

.offset_y_low
|06D4BD| db   4,   4,  12, -12

.offset_y_high
|06D4C1| db   0,   0,   0,  -1

.rock_speed_x
|06D4C5| db  44, -44,   0,   0

.rock_speed_y
|06D4C9| db   0,   0,  44, -44

endpool

;---------------------------------------------------------------------------------------------------

Octorok_FireLoogie:
|06D4CD| LDA.b #$07 ; SFX2.07
|06D4CF| JSL QueueSpriteSFX2WithPan

|06D4D3| LDA.b #$0C ; SPRITE 0C
|06D4D5| JSL SpawnSpriteDynamically
|06D4D9| BMI .fired_a_blank

|06D4DB| PHX

|06D4DC| LDA.w $0DE0,X
|06D4DF| TAX

|06D4E0| LDA.b $00
|06D4E2| CLC
|06D4E3| ADC.w .offset_x_low,X
|06D4E6| STA.w $0D10,Y

|06D4E9| LDA.b $01
|06D4EB| ADC.w .offset_x_high,X
|06D4EE| STA.w $0D30,Y

|06D4F1| LDA.b $02
|06D4F3| CLC
|06D4F4| ADC.w .offset_y_low,X
|06D4F7| STA.w $0D00,Y

|06D4FA| LDA.b $03
|06D4FC| ADC.w .offset_y_high,X
|06D4FF| STA.w $0D20,Y

|06D502| LDA.w $0DE0,Y
|06D505| TAX

|06D506| LDA.w .rock_speed_x,X
|06D509| STA.w $0D50,Y

|06D50C| LDA.w .rock_speed_y,X
|06D50F| STA.w $0D40,Y

|06D512| PLX

.fired_a_blank
|06D513| RTS

;===================================================================================================

pool SpriteDraw_Octorok

.mouth_offset_x
|06D514| dw   8,   0,   4,   8,   0,   4,   9,  -1,   4

.mouth_offset_y
|06D526| dw   6,   6,   9,   6,   6,   9,   6,   6,   9

.mouth_char
|06D538| db $BB, $BB, $BA, $AB, $AB, $AA, $A9, $A9, $B9

.mouth_props
|06D541| db $65, $25, $25, $65, $25, $25, $65, $25, $25

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Octorok:
|06D54A| JSR GetScreenCoordinates

|06D54D| LDA.w $0DE0,X
|06D550| CMP.b #$03
|06D552| BEQ .no_mouth

;---------------------------------------------------------------------------------------------------

|06D554| LDA.w $0DB0,X
|06D557| ASL A
|06D558| ADC.w $0DB0,X
|06D55B| ADC.w $0DE0,X
|06D55E| STA.b $07

|06D560| PHX
|06D561| PHA

|06D562| ASL A
|06D563| TAX

|06D564| REP #$20

|06D566| LDA.b $00
|06D568| CLC
|06D569| ADC.w .mouth_offset_x,X
|06D56C| STA.b ($90),Y

|06D56E| AND.w #$0100
|06D571| STA.b $0E

|06D573| LDA.b $02
|06D575| CLC
|06D576| ADC.w .mouth_offset_y,X

|06D579| INY
|06D57A| STA.b ($90),Y

|06D57C| CLC
|06D57D| ADC.w #$0010
|06D580| CMP.w #$0100

|06D583| SEP #$20
|06D585| BCC .on_screen

|06D587| LDA.b #$F0
|06D589| STA.b ($90),Y

.on_screen
|06D58B| PLX

|06D58C| LDA.w .mouth_char,X
|06D58F| INY
|06D590| STA.b ($90),Y

|06D592| LDA.w .mouth_props,X
|06D595| INY
|06D596| ORA.b $05
|06D598| STA.b ($90),Y

|06D59A| LDA.b $0F
|06D59C| STA.b ($92)

|06D59E| PLX

;---------------------------------------------------------------------------------------------------

.no_mouth
|06D59F| REP #$20

|06D5A1| LDA.b $90
|06D5A3| CLC
|06D5A4| ADC.w #$0004
|06D5A7| STA.b $90

|06D5A9| INC.b $92

|06D5AB| SEP #$20

|06D5AD| DEC.w $0E40,X

|06D5B0| LDY.b #$00
|06D5B2| JSR SpriteDraw_SingleLarge_skipcoords

|06D5B5| INC.w $0E40,X

|06D5B8| RTS

;===================================================================================================

Sprite_0C_OctorokStone:
|06D5B9| LDA.w $0DD0,X
|06D5BC| CMP.b #$06
|06D5BE| BNE OctorokStone_Active

;===================================================================================================

OctorokStone_Crumbling:
|06D5C0| JSR SpriteDraw_OctorokStoneCrumbling
|06D5C3| JSR CheckIfActivePermissive_bank06

|06D5C6| LDA.w $0DF0,X
|06D5C9| CMP.b #$1E
|06D5CB| BNE .exit

|06D5CD| LDA.b #$1F ; SFX2.1F
|06D5CF| JSL QueueSpriteSFX2WithPan

.exit
|06D5D3| RTS

;===================================================================================================

OctorokStone_Active:
|06D5D4| JSR SpriteDraw_SingleLarge
|06D5D7| JSR CheckIfActive_bank06
|06D5DA| JSR CheckDamageToLink
|06D5DD| JSR MoveSpriteXY_bank06

|06D5E0| TXA
|06D5E1| EOR.b $1A
|06D5E3| AND.b #$03
|06D5E5| BNE .exit

|06D5E7| JSR CheckSpriteTileCollision

|06D5EA| LDA.w $0E70,X
|06D5ED| BEQ .exit

|06D5EF| JSR PrepareSpriteToDie

.exit
|06D5F2| RTS

;===================================================================================================

pool SpriteDraw_OctorokStoneCrumbling

.offset_x
|06D5F3| dw   0,   8,   0,   8,  -8,  16,  -8,  16
|06D603| dw -12,  20, -12,  20, -14,  22, -14,  22

.offset_y
|06D613| dw   0,   0,   8,   8,  -8,  -8,  16,  16
|06D623| dw -12, -12,  20,  20, -14, -14,  22,  22

.flip
|06D633| db $00, $40, $80, $C0, $00, $40, $80, $C0
|06D63B| db $00, $40, $80, $C0, $00, $40, $80, $C0

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_OctorokStoneCrumbling:
|06D643| JSR GetScreenCoordinates

|06D646| PHX

|06D647| LDA.b #$03
|06D649| STA.b $06

|06D64B| LDA.w $0DF0,X
|06D64E| LSR A
|06D64F| AND.b #$0C
|06D651| EOR.b #$0C

|06D653| CLC
|06D654| ADC.b $06
|06D656| TAX

;---------------------------------------------------------------------------------------------------

.next_object
|06D657| PHX

|06D658| TXA
|06D659| ASL A
|06D65A| TAX

|06D65B| REP #$20

|06D65D| LDA.b $00
|06D65F| CLC
|06D660| ADC.w .offset_x,X
|06D663| STA.b ($90),Y

|06D665| AND.w #$0100
|06D668| STA.b $0E

|06D66A| LDA.b $02
|06D66C| CLC
|06D66D| ADC.w .offset_y,X

|06D670| INY
|06D671| STA.b ($90),Y

|06D673| CLC
|06D674| ADC.w #$0010
|06D677| CMP.w #$0100

|06D67A| SEP #$20
|06D67C| BCC .on_screen

|06D67E| LDA.b #$F0
|06D680| STA.b ($90),Y

.on_screen
|06D682| PLX

|06D683| LDA.b #$BC
|06D685| INY
|06D686| STA.b ($90),Y

|06D688| LDA.w .flip,X
|06D68B| ORA.b #$2D
|06D68D| INY
|06D68E| STA.b ($90),Y

|06D690| PHY

|06D691| TYA
|06D692| LSR A
|06D693| LSR A
|06D694| TAY

|06D695| LDA.b $0F
|06D697| STA.b ($92),Y

|06D699| PLY
|06D69A| INY

|06D69B| DEX
|06D69C| DEC.b $06
|06D69E| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06D6A0| PLX

|06D6A1| RTS

;===================================================================================================

pool Sprite_0F_Octoballoon

.altitude
|06D6A2| db  16,  17,  18,  19
|06D6A6| db  20,  19,  18,  17

endpool

;---------------------------------------------------------------------------------------------------

Sprite_0F_Octoballoon:
|06D6AA| LDA.w $0E80,X

|06D6AD| LSR A
|06D6AE| LSR A
|06D6AF| LSR A

|06D6B0| AND.b #$07
|06D6B2| TAY

|06D6B3| LDA.w .altitude,Y
|06D6B6| STA.w $0F70,X

|06D6B9| JSR Octoballoon_DrawAndBabies
|06D6BC| JSR CheckIfActive_bank06

|06D6BF| LDA.w $0DF0,X
|06D6C2| BNE .dont_explode

|06D6C4| LDA.b #$03
|06D6C6| STA.w $0DF0,X

|06D6C9| LDY.b #$0F

.next_sprite
|06D6CB| LDA.w $0DD0,Y
|06D6CE| BEQ .am_dead

|06D6D0| LDA.w $0E20,Y
|06D6D3| CMP.b #$10 ; SPRITE 10
|06D6D5| BEQ .dont_explode

.am_dead
|06D6D7| DEY
|06D6D8| BPL .next_sprite

|06D6DA| LDA.b #$06
|06D6DC| STA.w $0DD0,X

|06D6DF| JMP.w OctoballoonEXPLOSIONTIME

;---------------------------------------------------------------------------------------------------

.dont_explode
|06D6E2| JSR HandleSpriteRecoil_bank06

|06D6E5| INC.w $0E80,X

|06D6E8| TXA
|06D6E9| EOR.b $1A
|06D6EB| AND.b #$0F
|06D6ED| BNE .continue

|06D6EF| LDA.b #$04
|06D6F1| JSR ProjectSpriteSpeedTowardsLink

|06D6F4| LDA.w $0D40,X
|06D6F7| CMP.b $00
|06D6F9| BEQ .at_target_y_speed
|06D6FB| BPL .slowdown_y

|06D6FD| INC.w $0D40,X

|06D700| BRA .at_target_y_speed

.slowdown_y
|06D702| DEC.w $0D40,X

;---------------------------------------------------------------------------------------------------

.at_target_y_speed
|06D705| LDA.w $0D50,X
|06D708| CMP.b $01
|06D70A| BEQ .continue
|06D70C| BPL .slowdown_x

|06D70E| INC.w $0D50,X

|06D711| BRA .continue

.slowdown_x
|06D713| DEC.w $0D50,X

;---------------------------------------------------------------------------------------------------

.continue
|06D716| JSR MoveSpriteXY_bank06
|06D719| JSR CheckDamageToLink
|06D71C| BCC .no_contact

|06D71E| JSR Octoballoon_RecoilLink

.no_contact
|06D721| JSR CheckDamageFromLink
|06D724| JSR CheckSpriteTileCollision
|06D727| JSR BounceOffWall

|06D72A| RTS

;===================================================================================================

Octoballoon_RecoilLink:
|06D72B| LDA.b $46
|06D72D| BNE .exit

|06D72F| LDA.b #$04
|06D731| STA.b $46

|06D733| LDA.b #$10
|06D735| JSR ApplyRecoilToLink

|06D738| JSR InvertSpeedXY

.exit
|06D73B| RTS

;===================================================================================================

pool Octoballoon_DrawAndBabies

.offset_x
|06D73C| dw  -4,   4,  -4,   4
|06D744| dw  -8,   8,  -8,   8
|06D74C| dw  -4,   4,  -4,   4

.offset_y
|06D754| dw  -4,  -4,   4,   4
|06D75C| dw  -8,  -8,   8,   8
|06D764| dw  -4,  -4,   4,   4

.char
|06D76C| db $8C, $8C, $9C, $9C
|06D770| db $86, $86, $86, $86
|06D774| db $86, $86, $86, $86

.flip
|06D778| db $00, $40, $00, $40
|06D77C| db $00, $40, $80, $C0
|06D780| db $00, $40, $80, $C0

endpool

;---------------------------------------------------------------------------------------------------

Octoballoon_DrawAndBabies:
|06D784| STZ.b $0A

|06D786| LDA.w $0DD0,X
|06D789| CMP.b #$06
|06D78B| BNE .not_dying

|06D78D| LDA.w $0DF0,X
|06D790| CMP.b #$06
|06D792| BNE .no_baby

|06D794| LDA.b $11
|06D796| BNE .no_baby

|06D798| JSR FormBabby

.no_baby
|06D79B| LDA.w $0DF0,X
|06D79E| LSR A
|06D79F| AND.b #$04
|06D7A1| CLC
|06D7A2| ADC.b #$04
|06D7A4| STA.b $0A

;---------------------------------------------------------------------------------------------------

.not_dying
|06D7A6| JSR GetScreenCoordinates

|06D7A9| PHX

|06D7AA| LDA.b #$03
|06D7AC| STA.b $0B

|06D7AE| CLC
|06D7AF| ADC.b $0A

|06D7B1| TAX

.next_object
|06D7B2| PHX

|06D7B3| TXA
|06D7B4| ASL A
|06D7B5| TAX

|06D7B6| REP #$20

|06D7B8| LDA.b $00
|06D7BA| CLC
|06D7BB| ADC.w .offset_x,X
|06D7BE| STA.b ($90),Y

|06D7C0| AND.w #$0100
|06D7C3| STA.b $0E

|06D7C5| LDA.b $02
|06D7C7| CLC
|06D7C8| ADC.w .offset_y,X

|06D7CB| INY
|06D7CC| STA.b ($90),Y

|06D7CE| CLC
|06D7CF| ADC.w #$0010
|06D7D2| CMP.w #$0100

|06D7D5| SEP #$20
|06D7D7| BCC .on_screen

|06D7D9| LDA.b #$F0
|06D7DB| STA.b ($90),Y

.on_screen
|06D7DD| PLX

|06D7DE| LDA.w .char,X
|06D7E1| INY
|06D7E2| STA.b ($90),Y

|06D7E4| LDA.w .flip,X
|06D7E7| ORA.b $05
|06D7E9| INY
|06D7EA| STA.b ($90),Y

|06D7EC| PHY

|06D7ED| TYA
|06D7EE| LSR A
|06D7EF| LSR A
|06D7F0| TAY

|06D7F1| LDA.b #$02
|06D7F3| ORA.b $0F
|06D7F5| STA.b ($92),Y

|06D7F7| PLY
|06D7F8| INY

|06D7F9| DEX

|06D7FA| DEC.b $0B
|06D7FC| BPL .next_object

|06D7FE| PLX

|06D7FF| JMP.w DrawSpriteShadow

;===================================================================================================

pool FormBabby

.speed_x
|06D802| db  16,  11, -11, -16, -11,  11

.speed_y
|06D808| db   0,  11,  11,   0, -11, -11

endpool

;---------------------------------------------------------------------------------------------------

FormBabby:
|06D80E| LDA.b #$0C ; SFX2.0C
|06D810| JSL QueueSpriteSFX2WithPan

|06D814| LDA.b #$05
|06D816| STA.b $0D

.nth_child
|06D818| LDA.b #$10 ; SPRITE 10
|06D81A| JSL SpawnSpriteDynamically
|06D81E| BMI .no_space

|06D820| JSL SetSpawnedSpriteCoordinates

|06D824| PHX

|06D825| LDX.b $0D

|06D827| LDA.w .speed_x,X
|06D82A| STA.w $0D50,Y

|06D82D| LDA.w .speed_y,X
|06D830| STA.w $0D40,Y

|06D833| LDA.b #$30
|06D835| STA.w $0F80,Y

|06D838| LDA.b #$FF
|06D83A| STA.w $0E80,Y

|06D83D| PLX

.no_space
|06D83E| DEC.b $0D
|06D840| BPL .nth_child

|06D842| RTS

;===================================================================================================

UNREACHABLE_06D843:
|06D843| db $00, $03, $05, $08, $0A, $0C, $0D, $0E
|06D84B| db $0F, $0E, $0D, $0C, $0A, $08, $05, $03

;===================================================================================================

Sprite_10_OctoballoonBaby:
|06D853| LDA.w $0E80,X
|06D856| BNE .alive

|06D858| STZ.w $0DD0,X

.alive
|06D85B| CMP.b #$40
|06D85D| BCS .not_blinking

|06D85F| AND.b #$01
|06D861| BNE .dont_draw

.not_blinking
|06D863| JSR SpriteDraw_SingleSmall

.dont_draw
|06D866| JSR CheckIfActive_bank06

|06D869| DEC.w $0E80,X

|06D86C| JSR HandleSpriteRecoil_bank06

|06D86F| DEC.w $0F80,X

|06D872| JSR MoveSpriteZ_bank06

|06D875| LDA.w $0F70,X
|06D878| BPL .airborne

|06D87A| STZ.w $0F70,X

|06D87D| LDA.b #$10
|06D87F| STA.w $0F80,X

.airborne
|06D882| JSR MoveSpriteXY_bank06
|06D885| JSR CheckSpriteTileCollision
|06D888| JSR BounceOffWall

;===================================================================================================

CheckDamageToAndFromLink_bank06:
|06D88B| JSR CheckDamageFromLink
|06D88E| JSR CheckDamageToLink

|06D891| RTS

;===================================================================================================

pool Sprite_0D_Buzzblob

.anim_step
|06D892| db $00, $01, $00, $02

.palette
|06D896| db $0A, $02, $08, $02

endpool

;---------------------------------------------------------------------------------------------------

Sprite_0D_Buzzblob:
|06D89A| LDA.w $0E00,X
|06D89D| BEQ .not_electrified

|06D89F| LSR A
|06D8A0| AND.b #$03
|06D8A2| TAY

|06D8A3| LDA.w $0B89,X
|06D8A6| AND.b #$F1
|06D8A8| ORA.w .palette,Y
|06D8AB| STA.w $0B89,X

.not_electrified
|06D8AE| JSL Cukeman
|06D8B2| JSR SpriteDraw_Buzzblob

|06D8B5| LDA.w $0E80,X

|06D8B8| LSR A
|06D8B9| LSR A
|06D8BA| LSR A

|06D8BB| AND.b #$03
|06D8BD| TAY

|06D8BE| LDA.w .anim_step,Y

|06D8C1| LDY.w $0E00,X
|06D8C4| BEQ .normal_anim_step

|06D8C6| INC A
|06D8C7| INC A
|06D8C8| INC A

.normal_anim_step
|06D8C9| STA.w $0DC0,X

|06D8CC| JSR CheckIfActive_bank06
|06D8CF| JSR HandleSpriteRecoil_bank06

|06D8D2| INC.w $0E80,X

|06D8D5| LDA.w $0DF0,X
|06D8D8| BNE .delay

|06D8DA| JSR Buzzblob_SelectNewDirection

.delay
|06D8DD| LDA.w $0E00,X
|06D8E0| BNE .immobile

|06D8E2| JSR MoveSpriteXY_bank06

.immobile
|06D8E5| JSR CheckSpriteTileCollision
|06D8E8| JSR BounceOffWall

|06D8EB| JMP.w CheckDamageToAndFromLink_bank06

;===================================================================================================

pool Buzzblob_SelectNewDirection

.speed_x
|06D8EE| db  3,  2, -2, -3, -2,  2,  0,  0

.speed_y
|06D8F6| db  0,  2,  2,  0, -2, -2,  0,  0

.timers
|06D8FE| db 48, 48, 48, 48, 48, 48, 64, 64

endpool

;---------------------------------------------------------------------------------------------------

Buzzblob_SelectNewDirection:
|06D906| JSL GetRandomNumber
|06D90A| AND.b #$07
|06D90C| TAY

|06D90D| LDA.w .speed_x,Y
|06D910| STA.w $0D50,X

|06D913| LDA.w .speed_y,Y
|06D916| STA.w $0D40,X

|06D919| LDA.w .timers,Y
|06D91C| STA.w $0DF0,X

|06D91F| RTS

;===================================================================================================

pool SpriteDraw_Buzzblob

.offset_x
|06D920| dw   0,   8,   0

.offset_y
|06D926| dw  -8,  -8,   0

.char
|06D92C| db $F0, $F0, $E1
|06D92F| db $00, $00, $CE
|06D932| db $00, $00, $CE
|06D935| db $E3, $E3, $CA
|06D938| db $E4, $E5, $CC
|06D93B| db $E5, $E4, $CC

.flip
|06D93E| db $00, $40, $00
|06D941| db $00, $00, $00
|06D944| db $00, $00, $40
|06D947| db $00, $40, $00
|06D94A| db $00, $00, $00
|06D94D| db $40, $40, $40

.size
|06D950| db $00, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_Buzzblob:
|06D953| JSR GetScreenCoordinates

|06D956| PHX

|06D957| LDA.w $0DC0,X
|06D95A| ASL A
|06D95B| ADC.w $0DC0,X
|06D95E| STA.b $06

|06D960| LDX.b #$02

.next_object
|06D962| PHX

|06D963| TXA
|06D964| ASL A
|06D965| TAX

|06D966| REP #$20

|06D968| LDA.b $00
|06D96A| CLC
|06D96B| ADC.w .offset_x,X
|06D96E| STA.b ($90),Y

|06D970| AND.w #$0100
|06D973| STA.b $0E

|06D975| LDA.b $02
|06D977| CLC
|06D978| ADC.w .offset_y,X

|06D97B| INY
|06D97C| STA.b ($90),Y

|06D97E| CLC
|06D97F| ADC.w #$0010
|06D982| CMP.w #$0100

|06D985| SEP #$20
|06D987| BCC .on_screen

|06D989| LDA.b #$F0
|06D98B| STA.b ($90),Y

.on_screen
|06D98D| PLX
|06D98E| PHX

|06D98F| TXA
|06D990| CLC
|06D991| ADC.b $06
|06D993| TAX

|06D994| INY

|06D995| LDA.w .char,X
|06D998| STA.b ($90),Y
|06D99A| BNE .dont_skip

|06D99C| DEY

|06D99D| LDA.b #$F0
|06D99F| STA.b ($90),Y

|06D9A1| INY

.dont_skip
|06D9A2| LDA.w .flip,X
|06D9A5| ORA.b $05
|06D9A7| INY
|06D9A8| STA.b ($90),Y

|06D9AA| PLX

|06D9AB| PHY

|06D9AC| TYA
|06D9AD| LSR A
|06D9AE| LSR A
|06D9AF| TAY

|06D9B0| LDA.w .size,X
|06D9B3| ORA.b $0F
|06D9B5| STA.b ($92),Y

|06D9B7| PLY
|06D9B8| INY

|06D9B9| DEX
|06D9BA| BPL .next_object

|06D9BC| PLX

|06D9BD| JMP.w DrawSpriteShadow

;===================================================================================================

BounceOffWall:
|06D9C0| LDA.w $0E70,X
|06D9C3| AND.b #$03
|06D9C5| BEQ .no_horizontal_collision

|06D9C7| JSR InvertSpeedX

.no_horizontal_collision
|06D9CA| LDA.w $0E70,X
|06D9CD| AND.b #$0C
|06D9CF| BEQ .no_vertical_collision

|06D9D1| JSR InvertSpeedY

.no_vertical_collision
|06D9D4| RTS

;===================================================================================================

InvertSpeedXY:
|06D9D5| JSR InvertSpeedY

;===================================================================================================

InvertSpeedX:
|06D9D8| LDA.w $0D50,X
|06D9DB| EOR.b #$FF
|06D9DD| INC A
|06D9DE| STA.w $0D50,X

|06D9E1| RTS

;===================================================================================================

InvertSpeedY:
|06D9E2| LDA.w $0D40,X
|06D9E5| EOR.b #$FF
|06D9E7| INC A
|06D9E8| STA.w $0D40,X

|06D9EB| RTS

;===================================================================================================

CheckIfActive_bank06:
|06D9EC| LDA.w $0DD0,X
|06D9EF| CMP.b #$09
|06D9F1| BNE .inactive

;---------------------------------------------------------------------------------------------------

#CheckIfActivePermissive_bank06:
|06D9F3| LDA.w $0FC1
|06D9F6| BNE .inactive

|06D9F8| LDA.b $11
|06D9FA| BNE .inactive

|06D9FC| LDA.w $0CAA,X
|06D9FF| BMI .active

|06DA01| LDA.w $0F00,X
|06DA04| BEQ .active

.inactive
|06DA06| PLA
|06DA07| PLA

.active
|06DA08| RTS

;===================================================================================================

SpriteDraw_IDtoClass:
; 0x00
|06DA09| db $A0, $A2, $A0, $A2
|06DA0D| db $80, $82, $80, $82

; 0x08 - Cucco
|06DA11| db $EA, $EC

; 0x0A - Octorok stone
|06DA13| db $84

; 0x0B - Buzz blob
|06DA14| db $4E, $61

; 0x0D - Octoballoon baby
|06DA16| db $BD

; 0x0E - Kodongo fire
|06DA17| db $8C

; 0x0F - Red guard/Elder
|06DA18| db $20, $22

; 0x11 - Hoarder
|06DA1A| db $C0, $C2

; 0x13 - Poe
|06DA1C| db $E6

; 0x14 - Crystal switch
|06DA1D| db $E4

; 0x15 - Sluggula
|06DA1E| db $82, $AA, $84, $AC
|06DA22| db $80, $A0

; 0x1B - Water switch
|06DA24| db $CA

; 0x1C - Flute kid
|06DA25| db $AF

; 0x1D - Heart
|06DA26| db $29, $39

; 0x1F - Rupees
|06DA28| db $0B

; 0x20 - Bombs
|06DA29| db $6E

; 0x21 - Small magic
|06DA2A| db $60

; 0x22 - Full magic
|06DA2B| db $62

; 0x23 - Arrows
|06DA2C| db $63

; 0x24 - Mirror portal
|06DA2D| db $4C

; 0x25 - Fairy
|06DA2E| db $EA, $EC

; 0x27 - Bonk item
|06DA30| db $24

; 0x28 - Small key
|06DA31| db $6B

; 0x29 - Mushroom
|06DA32| db $24

; 0x2A - Bari
|06DA33| db $22, $24, $26, $20
|06DA37| db $30, $21

; 0x30 - Cannonball
|06DA39| db $2A, $24

; 0x32 - Rat
|06DA3B| db $86, $88, $8A, $8C
|06DA3F| db $8E, $A2

; 0x38 - Rope
|06DA41| db $A4, $A6, $A8

; 0x3B - Mothula beam
|06DA44| db $AA

; 0x3C - Keese
|06DA45| db $84, $80, $82

; 0x3F - Bomb
|06DA48| db $6E

; 0x40 - Popo
|06DA49| db $40, $42

; 0x42 - Hoarder/Spike block
|06DA4B| db $E6, $E8

; 0x44 - Cannonball
|06DA4D| db $80, $82

; 0x46 - Zora
|06DA4F| db $C8

; 0x47 - Zora/fireball
|06DA50| db $8D

; 0x48 - Lost woods bird
|06DA51| db $E3, $E5

; 0x4A - Lost woods squirrel
|06DA53| db $C5, $E1

; 0x4C - Archery game guy
|06DA55| db $04, $24

; 0x4E - Wall cannon
|06DA57| db $0E, $2E, $0C, $0A

; 0x52 - Big fairy
|06DA5B| db $9C, $C7, $B6, $B7

; 0x56 - Mini helmasaur
|06DA5F| db $60, $62, $64, $66
|06DA63| db $68, $6A

; 0x5C - Bee
|06DA65| db $E4, $F4

; 0x5E - Green stalfos
|06DA67| db $02, $02, $00, $04

; 0x62 - Aga balls
|06DA6B| db $C6, $CC, $CE

; 0x65 - Fire snake, sparks
|06DA6E| db $28

; 0x66 - Hover
|06DA6F| db $84, $82, $80

; 0x69 - Apple
|06DA72| db $E5

; 0x6A - Big key / Catfish (quake)
|06DA73| db $24

; 0x6B - Stalfos head
|06DA74| db $00, $02, $04

; 0x6E - Kodongo
|06DA77| db $A0, $AA, $A4, $A6
|06DA7B| db $AC, $A2, $A8

; 0x75 - Arrghi/Wizzrobe
|06DA7E| db $A6, $88, $86

; 0x78 - Terror pin
|06DA81| db $8E, $AE, $8A

; 0x7B - Blob
|06DA84| db $42, $44, $42, $44
|06DA88| db $64, $66

; 0x81 - King Helmasaur fireball
|06DA8A| db $CC, $CC, $CA

; 0x84 - Pirogusu
|06DA8D| db $87, $97, $8E, $AE
|06DA91| db $AC, $8C, $8E, $AA
|06DA95| db $AC

; 0x8D - Laser eye
|06DA96| db $D2, $F3

; 0x8F - Master sword
|06DA98| db $84, $A2, $84, $A4
|06DA9C| db $E7

; 0x94 - Kyameron
|06DA9D| db $8A, $A8, $8A, $A8
|06DAA1| db $88, $A0, $A4, $A2
|06DAA5| db $A6, $A6, $A6, $A6

; 0xA0 - Zoro
|06DAA9| db $7E, $7F

; 0xA2 - Haunted grove rabbit
|06DAAB| db $8A, $88, $8C, $A6

; 0xA6 - Haunted grove bird
|06DAAF| db $86, $8E, $AC, $86

; 0xAA - Hobo
|06DAB3| db $BB, $AC, $A9, $B9
|06DAB7| db $AA, $BA, $BC

; 0xB1 - Falling ice
|06DABA| db $8A, $8E, $8A, $86

; 0xB5 - Zazak fire ball
|06DABE| db $0A

; 0xB6 - Deadrock
|06DABF| db $C2, $C4, $E2, $E4
|06DAC3| db $C6

; 0xBB - Magic bat
|06DAC4| db $EA, $EC

; 0xBD - Zirro bomb
|06DAC6| db $FF

; 0xBE - Vitreous small eye
|06DAC7| db $E6, $C6

; 0xC0 - Lightning
|06DAC9| db $CC, $EC, $CE, $EE
|06DACD| db $4C, $6C, $4E, $6E

; 0xC8 - Raven
|06DAD1| db $C8, $C4, $C6

; 0xCB - Moldorm
|06DAD4| db $88, $8C

; 0xCD - Heart container
|06DAD6| db $24

; 0xCE - Heart piece
|06DAD7| db $E0

; 0xCF - King Helmasaur
|06DAD8| db $AE, $C0, $C8, $C4
|06DADC| db $C6, $E2, $E0

; 0xD6 - Purple chest
|06DADF| db $EE

; 0xD7 - Gibo
|06DAE0| db $AE

; 0xD8 - Pokey
|06DAE1| db $A0, $80

; 0xDA - Whirlpool
|06DAE3| db $EE

; 0xDB - Bully/Victim
|06DAE4| db $C0, $C2, $BF

; 0xDE - Chain chomp
|06DAE7| db $8C, $AA, $86, $A8
|06DAEB| db $A6

; 0xE3 - Trinexx
|06DAEC| db $2C, $28, $06

; 0xE6 - Bomb shop guy
|06DAEF| db $DF, $CF, $A9

; 0xE9 - Shopkeeper
|06DAF2| db $46, $46

; 0xEB - Swamola
|06DAF4| db $EA, $C0, $C2, $E0
|06DAF8| db $E8, $E2, $E6, $E4

; 0xF3 - Waterfall
|06DAFC| db $0B

; 0xF4 - Ganon
|06DAFD| db $8E, $A0

; 0xF6 - Stolen shield
|06DAFF| db $EC, $EA

; 0xF8 - Talking tree
|06DB01| db $E9

; 0xF9 - Boulder
|06DB02| db $48, $58

;===================================================================================================

SpriteDraw_ClassToChar:
|06DB04| db $C8 ; RAVEN
|06DB05| db $00 ; VULTURE
|06DB06| db $6B ; STALFOS HEAD
|06DB07| db $00 ; NULL
|06DB08| db $00 ; CORRECT PULL SWITCH
|06DB09| db $00 ; UNUSED CORRECT PULL SWITCH
|06DB0A| db $00 ; WRONG PULL SWITCH
|06DB0B| db $00 ; UNUSED WRONG PULL SWITCH
|06DB0C| db $00 ; OCTOROK
|06DB0D| db $CB ; MOLDORM
|06DB0E| db $00 ; OCTOROK 4WAY
|06DB0F| db $08 ; CUCCO
|06DB10| db $0A ; OCTOROK STONE
|06DB11| db $0B ; BUZZBLOB
|06DB12| db $00 ; SNAPDRAGON
|06DB13| db $00 ; OCTOBALLOON
|06DB14| db $0D ; OCTOBALLOON BABY
|06DB15| db $00 ; HINOX
|06DB16| db $00 ; MOBLIN
|06DB17| db $56 ; MINI HELMASAUR
|06DB18| db $00 ; THIEVES TOWN GRATE
|06DB19| db $00 ; ANTIFAIRY
|06DB1A| db $0F ; SAHASRAHLA / AGINAH
|06DB1B| db $11 ; HOARDER
|06DB1C| db $00 ; MINI MOLDORM
|06DB1D| db $13 ; POE
|06DB1E| db $00 ; SMITHY
|06DB1F| db $00 ; ARROW
|06DB20| db $00 ; STATUE
|06DB21| db $00 ; FLUTE QUEST
|06DB22| db $14 ; CRYSTAL SWITCH
|06DB23| db $00 ; SICK KID
|06DB24| db $15 ; SLUGGULA
|06DB25| db $1B ; WATER SWITCH
|06DB26| db $00 ; ROPA
|06DB27| db $2A ; RED BARI
|06DB28| db $2A ; BLUE BARI
|06DB29| db $F8 ; TALKING TREE
|06DB2A| db $00 ; HARDHAT BEETLE
|06DB2B| db $B6 ; DEADROCK
|06DB2C| db $00 ; DARK WORLD HINT NPC
|06DB2D| db $00 ; ADULT
|06DB2E| db $00 ; SWEEPING LADY
|06DB2F| db $AA ; HOBO
|06DB30| db $00 ; LUMBERJACKS
|06DB31| db $00 ; TELEPATHIC TILE
|06DB32| db $1C ; FLUTE KID
|06DB33| db $00 ; RACE GAME LADY
|06DB34| db $00 ; RACE GAME GUY
|06DB35| db $00 ; FORTUNE TELLER
|06DB36| db $00 ; ARGUE BROS
|06DB37| db $00 ; RUPEE PULL
|06DB38| db $00 ; YOUNG SNITCH
|06DB39| db $00 ; INNKEEPER
|06DB3A| db $00 ; WITCH
|06DB3B| db $F3 ; WATERFALL
|06DB3C| db $F3 ; EYE STATUE
|06DB3D| db $00 ; LOCKSMITH
|06DB3E| db $BB ; MAGIC BAT
|06DB3F| db $27 ; BONK ITEM
|06DB40| db $00 ; KID IN KAK
|06DB41| db $00 ; OLD SNITCH
|06DB42| db $42 ; HOARDER
|06DB43| db $00 ; TUTORIAL GUARD
|06DB44| db $00 ; LIGHTNING GATE
|06DB45| db $00 ; BLUE GUARD
|06DB46| db $00 ; GREEN GUARD
|06DB47| db $00 ; RED SPEAR GUARD
|06DB48| db $00 ; BLUESAIN BOLT
|06DB49| db $00 ; USAIN BOLT
|06DB4A| db $00 ; BLUE ARCHER
|06DB4B| db $00 ; GREEN BUSH GUARD
|06DB4C| db $00 ; RED JAVELIN GUARD
|06DB4D| db $0F ; RED BUSH GUARD
|06DB4E| db $3F ; BOMB GUARD
|06DB4F| db $00 ; GREEN KNIFE GUARD
|06DB50| db $00 ; GELDMAN
|06DB51| db $00 ; TOPPO
|06DB52| db $40 ; POPO
|06DB53| db $40 ; POPO
|06DB54| db $44 ; CANNONBALL
|06DB55| db $00 ; ARMOS STATUE
|06DB56| db $00 ; KING ZORA
|06DB57| db $00 ; ARMOS KNIGHT
|06DB58| db $00 ; LANMOLAS
|06DB59| db $47 ; ZORA / FIREBALL
|06DB5A| db $46 ; WALKING ZORA
|06DB5B| db $00 ; DESERT STATUE
|06DB5C| db $00 ; CRAB
|06DB5D| db $48 ; LOST WOODS BIRD
|06DB5E| db $4A ; LOST WOODS SQUIRREL
|06DB5F| db $65 ; SPARK
|06DB60| db $65 ; SPARK
|06DB61| db $00 ; ROLLER VERTICAL DOWN FIRST
|06DB62| db $00 ; ROLLER VERTICAL UP FIRST
|06DB63| db $00 ; ROLLER HORIZONTAL RIGHT FIRST
|06DB64| db $00 ; ROLLER HORIZONTAL LEFT FIRST
|06DB65| db $00 ; BEAMOS
|06DB66| db $8F ; MASTERSWORD
|06DB67| db $00 ; DEBIRANDO PIT
|06DB68| db $00 ; DEBIRANDO
|06DB69| db $4C ; ARCHERY GUY
|06DB6A| db $4E ; WALL CANNON VERTICAL LEFT
|06DB6B| db $4E ; WALL CANNON VERTICAL RIGHT
|06DB6C| db $4E ; WALL CANNON HORIZONTAL TOP
|06DB6D| db $4E ; WALL CANNON HORIZONTAL BOTTOM
|06DB6E| db $00 ; BALL N CHAIN
|06DB6F| db $30 ; CANNONBALL / CANNON TROOPER
|06DB70| db $24 ; MIRROR PORTAL
|06DB71| db $32 ; RAT / CRICKET
|06DB72| db $38 ; SNAKE
|06DB73| db $3C ; KEESE
|06DB74| db $81 ; KING HELMASAUR FIREBALL
|06DB75| db $00 ; LEEVER
|06DB76| db $52 ; FAIRY POND TRIGGER
|06DB77| db $00 ; UNCLE / PRIEST / MANTLE
|06DB78| db $00 ; RUNNING BOY
|06DB79| db $00 ; BOTTLE MERCHANT
|06DB7A| db $00 ; ZELDA
|06DB7B| db $00 ; ANTIFAIRY
|06DB7C| db $00 ; SAHASRAHLAS WIFE
|06DB7D| db $5C ; BEE
|06DB7E| db $00 ; AGAHNIM
|06DB7F| db $62 ; AGAHNIMS BALLS
|06DB80| db $5E ; GREEN STALFOS
|06DB81| db $00 ; BIG SPIKE
|06DB82| db $00 ; FIREBAR CLOCKWISE
|06DB83| db $00 ; FIREBAR COUNTERCLOCKWISE
|06DB84| db $65 ; FIRESNAKE
|06DB85| db $66 ; HOVER
|06DB86| db $00 ; ANTIFAIRY CIRCLE
|06DB87| db $00 ; GREEN EYEGORE / GREEN MIMIC
|06DB88| db $00 ; RED EYEGORE / RED MIMIC
|06DB89| db $00 ; YELLOW STALFOS
|06DB8A| db $6E ; KODONGO
|06DB8B| db $0E ; KODONGO FIRE
|06DB8C| db $00 ; MOTHULA
|06DB8D| db $3B ; MOTHULA BEAM
|06DB8E| db $42 ; SPIKE BLOCK
|06DB8F| db $00 ; GIBDO
|06DB90| db $00 ; ARRGHUS
|06DB91| db $75 ; ARRGHI
|06DB92| db $78 ; TERRORPIN
|06DB93| db $7B ; BLOB
|06DB94| db $00 ; WALLMASTER
|06DB95| db $00 ; STALFOS KNIGHT
|06DB96| db $CF ; KING HELMASAUR
|06DB97| db $00 ; BUMPER
|06DB98| db $84 ; PIROGUSU
|06DB99| db $8D ; LASER EYE LEFT
|06DB9A| db $8D ; LASER EYE RIGHT
|06DB9B| db $8D ; LASER EYE TOP
|06DB9C| db $8D ; LASER EYE BOTTOM
|06DB9D| db $00 ; PENGATOR
|06DB9E| db $94 ; KYAMERON
|06DB9F| db $75 ; WIZZROBE
|06DBA0| db $A0 ; ZORO
|06DBA1| db $00 ; BABASU
|06DBA2| db $00 ; HAUNTED GROVE OSTRICH
|06DBA3| db $A2 ; HAUNTED GROVE RABBIT
|06DBA4| db $A6 ; HAUNTED GROVE BIRD
|06DBA5| db $00 ; FREEZOR
|06DBA6| db $00 ; KHOLDSTARE
|06DBA7| db $00 ; KHOLDSTARE SHELL
|06DBA8| db $B1 ; FALLING ICE
|06DBA9| db $00 ; BLUE ZAZAK
|06DBAA| db $B5 ; RED ZAZAK
|06DBAB| db $00 ; STALFOS
|06DBAC| db $BD ; GREEN ZIRRO
|06DBAD| db $00 ; BLUE ZIRRO
|06DBAE| db $00 ; PIKIT
|06DBAF| db $00 ; CRYSTAL MAIDEN
|06DBB0| db $69 ; APPLE
|06DBB1| db $00 ; OLD MAN
|06DBB2| db $00 ; PIPE DOWN
|06DBB3| db $00 ; PIPE UP
|06DBB4| db $00 ; PIPE RIGHT
|06DBB5| db $00 ; PIPE LEFT
|06DBB6| db $5C ; GOOD BEE
|06DBB7| db $00 ; PEDESTAL PLAQUE
|06DBB8| db $D6 ; PURPLE CHEST
|06DBB9| db $E6 ; BOMB SHOP GUY
|06DBBA| db $00 ; KIKI
|06DBBB| db $00 ; BLIND MAIDEN
|06DBBC| db $00 ; DIALOGUE TESTER
|06DBBD| db $DB ; BULLY / PINK BALL
|06DBBE| db $DA ; WHIRLPOOL
|06DBBF| db $E9 ; SHOPKEEPER / CHEST GAME GUY
|06DBC0| db $00 ; DRUNKARD
|06DBC1| db $00 ; VITREOUS
|06DBC2| db $BE ; VITREOUS SMALL EYE
|06DBC3| db $C0 ; LIGHTNING
|06DBC4| db $6A ; CATFISH
|06DBC5| db $00 ; CUTSCENE AGAHNIM
|06DBC6| db $F9 ; BOULDER
|06DBC7| db $D7 ; GIBO
|06DBC8| db $00 ; THIEF
|06DBC9| db $00 ; MEDUSA
|06DBCA| db $00 ; YOMO MEDUSA
|06DBCB| db $D8 ; POKEY
|06DBCC| db $00 ; BIG FAIRY
|06DBCD| db $00 ; TEKTITE / FIREBAT
|06DBCE| db $DE ; CHAIN CHOMP
|06DBCF| db $E3 ; TRINEXX ROCK HEAD
|06DBD0| db $00 ; TRINEXX FIRE HEAD
|06DBD1| db $00 ; TRINEXX ICE HEAD
|06DBD2| db $00 ; BLIND
|06DBD3| db $EB ; SWAMOLA
|06DBD4| db $00 ; LYNEL
|06DBD5| db $00 ; BUNNYBEAM / SMOKE
|06DBD6| db $00 ; FLOPPING FISH
|06DBD7| db $00 ; STAL
|06DBD8| db $00 ; LANDMINE
|06DBD9| db $00 ; DIGGING GAME GUY
|06DBDA| db $F4 ; GANON
|06DBDB| db $F4 ; GANON
|06DBDC| db $1D ; HEART
|06DBDD| db $1F ; GREEN RUPEE
|06DBDE| db $1F ; BLUE RUPEE
|06DBDF| db $1F ; RED RUPEE
|06DBE0| db $20 ; BOMB REFILL 1
|06DBE1| db $20 ; BOMB REFILL 4
|06DBE2| db $20 ; BOMB REFILL 8
|06DBE3| db $21 ; SMALL MAGIC DECANTER
|06DBE4| db $22 ; LARGE MAGIC DECANTER
|06DBE5| db $23 ; ARROW REFILL 5
|06DBE6| db $23 ; ARROW REFILL 10
|06DBE7| db $25 ; FAIRY
|06DBE8| db $28 ; SMALL KEY
|06DBE9| db $6A ; BIG KEY
|06DBEA| db $F6 ; STOLEN SHIELD
|06DBEB| db $29 ; MUSHROOM
|06DBEC| db $00 ; FAKE MASTER SWORD
|06DBED| db $00 ; MAGIC SHOP ASSISTANT
|06DBEE| db $CD ; HEART CONTAINER
|06DBEF| db $CE ; HEART PIECE

;===================================================================================================

SpriteDraw_SingleLarge_long:
|06DBF0| PHB
|06DBF1| PHK
|06DBF2| PLB

|06DBF3| JSR SpriteDraw_SingleLarge

|06DBF6| PLB

|06DBF7| RTL

;---------------------------------------------------------------------------------------------------

SpriteDraw_SingleSmall_long:
|06DBF8| PHB
|06DBF9| PHK
|06DBFA| PLB

|06DBFB| JSR SpriteDraw_SingleSmall

|06DBFE| PLB

|06DBFF| RTL

;===================================================================================================

UNREACHABLE_06DC00:
|06DC00| db $00, $00, $01, $01, $01, $02, $02, $02
|06DC08| db $02, $03, $03, $03, $03, $03, $03, $03

;===================================================================================================

SpriteDraw_SingleLarge:
|06DC10| JSR GetScreenCoordinates

;===================================================================================================

SpriteDraw_SingleLarge_skipcoords:
|06DC13| LDA.b $00 ; save X coordinate
|06DC15| STA.b ($90),Y

|06DC17| LDA.b $01 ; get bit 8 of X for the other table
|06DC19| CMP.b #$01

|06DC1B| LDA.b #$01
|06DC1D| ROL A
|06DC1E| STA.b ($92)

|06DC20| REP #$20

|06DC22| LDA.b $02 ; get Y coordinate
|06DC24| INY
|06DC25| CLC
|06DC26| ADC.w #$0010 ; adjust it to see where it will end up
|06DC29| CMP.w #$0100

|06DC2C| SEP #$20
|06DC2E| BCS DrawSpriteShadow_Conditional

|06DC30| SBC.b #$0F
|06DC32| STA.b ($90),Y

|06DC34| PHY

|06DC35| LDY.w $0E20,X

|06DC38| LDA.w SpriteDraw_ClassToChar,Y
|06DC3B| CLC
|06DC3C| ADC.w $0DC0,X
|06DC3F| TAY

|06DC40| LDA.w SpriteDraw_IDtoClass,Y

|06DC43| PLY
|06DC44| INY
|06DC45| STA.b ($90),Y

|06DC47| LDA.b $05
|06DC49| INY
|06DC4A| STA.b ($90),Y

;===================================================================================================

DrawSpriteShadow_Conditional:
|06DC4C| LDA.w $0E60,X
|06DC4F| AND.b #$10
|06DC51| BNE DrawSpriteShadow

|06DC53| RTS

;===================================================================================================

DrawSpriteShadow_long:
|06DC54| PHB
|06DC55| PHK
|06DC56| PLB

|06DC57| JSR DrawSpriteShadow

|06DC5A| PLB

|06DC5B| RTL

;===================================================================================================

DrawSpriteShadow_custom_long:
|06DC5C| PHB
|06DC5D| PHK
|06DC5E| PLB

|06DC5F| JSR DrawSpriteShadow_custom

|06DC62| PLB

|06DC63| RTL

;===================================================================================================

DrawSpriteShadow:
|06DC64| LDA.b #$0A

;===================================================================================================

DrawSpriteShadow_custom:
|06DC66| CLC
|06DC67| ADC.w $0D00,X
|06DC6A| STA.b $02

|06DC6C| LDA.w $0D20,X
|06DC6F| ADC.b #$00
|06DC71| STA.b $03

|06DC73| LDA.w $0F00,X
|06DC76| BNE .no_shadow

|06DC78| LDA.w $0DD0,X
|06DC7B| CMP.b #$0A
|06DC7D| BNE .not_being_carried

|06DC7F| LDA.l $7FFA1C,X
|06DC83| CMP.b #$03
|06DC85| BEQ .no_shadow

.not_being_carried
|06DC87| REP #$20

|06DC89| LDA.b $02
|06DC8B| SEC
|06DC8C| SBC.b $E8
|06DC8E| STA.b $02

|06DC90| CLC
|06DC91| ADC.w #$0010
|06DC94| CMP.w #$0100

|06DC97| SEP #$20
|06DC99| BCS .offscreen

|06DC9B| LDA.w $0E40,X
|06DC9E| AND.b #$1F
|06DCA0| ASL A
|06DCA1| ASL A
|06DCA2| TAY

|06DCA3| LDA.b $00
|06DCA5| STA.b ($90),Y

|06DCA7| LDA.w $0E60,X
|06DCAA| AND.b #$20
|06DCAC| BEQ .not_small

|06DCAE| INY

|06DCAF| LDA.b ($90),Y ; useless

|06DCB1| LDA.b $02
|06DCB3| INC A
|06DCB4| STA.b ($90),Y

|06DCB6| INY

|06DCB7| LDA.b #$38
|06DCB9| STA.b ($90),Y

|06DCBB| LDA.b $05
|06DCBD| AND.b #$30
|06DCBF| ORA.b #$08

|06DCC1| INY
|06DCC2| STA.b ($90),Y

|06DCC4| TYA
|06DCC5| LSR A
|06DCC6| LSR A
|06DCC7| TAY

|06DCC8| LDA.b $01
|06DCCA| AND.b #$01
|06DCCC| STA.b ($92),Y

.no_shadow
|06DCCE| RTS

;---------------------------------------------------------------------------------------------------

.not_small
|06DCCF| LDA.b $02
|06DCD1| INY
|06DCD2| STA.b ($90),Y

|06DCD4| LDA.b #$6C
|06DCD6| INY
|06DCD7| STA.b ($90),Y

|06DCD9| LDA.b $05
|06DCDB| AND.b #$30
|06DCDD| ORA.b #$08

|06DCDF| INY
|06DCE0| STA.b ($90),Y

|06DCE2| TYA
|06DCE3| LSR A
|06DCE4| LSR A
|06DCE5| TAY

|06DCE6| LDA.b $01
|06DCE8| AND.b #$01
|06DCEA| ORA.b #$02
|06DCEC| STA.b ($92),Y

.offscreen
|06DCEE| RTS

;===================================================================================================

SpriteDraw_SingleSmall:
|06DCEF| JSR GetScreenCoordinates

|06DCF2| LDA.b $00
|06DCF4| STA.b ($90),Y

|06DCF6| LDA.b $01
|06DCF8| CMP.b #$01

|06DCFA| LDA.b #$00
|06DCFC| ROL A
|06DCFD| STA.b ($92)

|06DCFF| REP #$20

|06DD01| LDA.b $02
|06DD03| INY
|06DD04| CLC
|06DD05| ADC.w #$0010
|06DD08| CMP.w #$0100

|06DD0B| SEP #$20
|06DD0D| BCS SpriteDraw_SingleSmall_DoShadow

|06DD0F| SBC.b #$0F
|06DD11| STA.b ($90),Y

|06DD13| PHY

|06DD14| LDY.w $0E20,X

|06DD17| LDA.w SpriteDraw_ClassToChar,Y
|06DD1A| CLC
|06DD1B| ADC.w $0DC0,X
|06DD1E| TAY

|06DD1F| LDA.w SpriteDraw_IDtoClass,Y

|06DD22| PLY
|06DD23| INY

|06DD24| STA.b ($90),Y

|06DD26| LDA.b $05
|06DD28| INY
|06DD29| STA.b ($90),Y

;===================================================================================================

SpriteDraw_SingleSmall_DoShadow:
|06DD2B| LDA.w $0E60,X
|06DD2E| AND.b #$10
|06DD30| BEQ .no_shadow

|06DD32| LDA.b #$02
|06DD34| JMP.w DrawSpriteShadow_custom

.no_shadow
|06DD37| RTS

;===================================================================================================

SpriteDraw_ThinAndTall_long:
|06DD38| PHB
|06DD39| PHK
|06DD3A| PLB

|06DD3B| JSR SpriteDraw_ThinAndTall

|06DD3E| PLB

|06DD3F| RTL

;---------------------------------------------------------------------------------------------------

SpriteDraw_ThinAndTall:
|06DD40| JSR GetScreenCoordinates

|06DD43| LDA.b $00
|06DD45| STA.b ($90),Y

|06DD47| LDY.b #$04
|06DD49| STA.b ($90),Y

|06DD4B| LDA.b $01
|06DD4D| CMP.b #$01

|06DD4F| LDA.b #$00
|06DD51| ROL A

|06DD52| LDY.b #$00
|06DD54| STA.b ($92),Y

|06DD56| INY
|06DD57| STA.b ($92),Y

|06DD59| REP #$20

|06DD5B| LDA.b $02
|06DD5D| LDY.b #$01
|06DD5F| STA.b ($90),Y

|06DD61| CLC
|06DD62| ADC.w #$0010
|06DD65| CMP.w #$0100
|06DD68| BCC .on_screen

|06DD6A| LDA.w #$00F0
|06DD6D| STA.b ($90),Y

.on_screen
|06DD6F| LDA.b $02
|06DD71| CLC
|06DD72| ADC.w #$0008

|06DD75| LDY.b #$05
|06DD77| STA.b ($90),Y

|06DD79| CLC
|06DD7A| ADC.w #$0010
|06DD7D| CMP.w #$0100
|06DD80| BCC .not_off_screen

|06DD82| LDA.w #$00F0
|06DD85| STA.b ($90),Y

.not_off_screen
|06DD87| SEP #$20

|06DD89| LDY.w $0E20,X

|06DD8C| LDA.w SpriteDraw_ClassToChar,Y
|06DD8F| CLC
|06DD90| ADC.w $0DC0,X
|06DD93| TAY

|06DD94| LDA.w SpriteDraw_IDtoClass,Y
|06DD97| LDY.b #$02
|06DD99| STA.b ($90),Y

|06DD9B| CLC
|06DD9C| ADC.b #$10
|06DD9E| LDY.b #$06
|06DDA0| STA.b ($90),Y

|06DDA2| LDA.b $05
|06DDA4| LDY.b #$03
|06DDA6| STA.b ($90),Y

|06DDA8| LDY.b #$07
|06DDAA| STA.b ($90),Y

|06DDAC| JMP.w DrawSpriteShadow_Conditional

;===================================================================================================

pool Sprite_02_StalfosHead

.flip
|06DDAF| db $00, $00, $00, $40

.anim_step
|06DDB3| db $00, $01, $02, $01

endpool

;---------------------------------------------------------------------------------------------------

Sprite_02_StalfosHead:
|06DDB7| LDA.b $EE
|06DDB9| STA.w $0F20,X

|06DDBC| LDA.w $0E00,X
|06DDBF| BEQ .keep_region

|06DDC1| LDA.b #$08
|06DDC3| JSL AllocateOAMInRegionC

.keep_region
|06DDC7| LDA.w $0E80,X
|06DDCA| LSR A
|06DDCB| LSR A
|06DDCC| LSR A
|06DDCD| AND.b #$03
|06DDCF| TAY

|06DDD0| LDA.w $0F50,X
|06DDD3| AND.b #$BF
|06DDD5| ORA.w .flip,Y
|06DDD8| STA.w $0F50,X

|06DDDB| LDA.w .anim_step,Y
|06DDDE| STA.w $0DC0,X

|06DDE1| LDA.b #$30
|06DDE3| STA.w $0B89,X

|06DDE6| JSR SpriteDraw_SingleLarge
|06DDE9| JSR CheckIfActive_bank06
|06DDEC| JSR HandleSpriteRecoil_bank06
|06DDEF| JSR CheckDamageToAndFromLink_bank06

|06DDF2| LDA.w $0EA0,X
|06DDF5| BEQ .not_recoiling

|06DDF7| JSR ZeroVelocityXY_bank06

.not_recoiling
|06DDFA| JSR MoveSpriteXY_bank06

|06DDFD| INC.w $0E80,X

|06DE00| LDA.w $0DF0,X
|06DE03| BEQ .delay_turn

|06DE05| AND.b #$01
|06DE07| BNE .exit

|06DE09| LDA.b #$10
|06DE0B| JSR ProjectSpriteSpeedTowardsLink

;---------------------------------------------------------------------------------------------------

.handle_movement
|06DE0E| LDA.w $0D40,X
|06DE11| CMP.b $00
|06DE13| BEQ .check_x
|06DE15| BPL .too_far_down

.too_far_up
|06DE17| INC.w $0D40,X
|06DE1A| BRA .check_x

.too_far_down
|06DE1C| DEC.w $0D40,X

.check_x
|06DE1F| LDA.w $0D50,X
|06DE22| CMP.b $01
|06DE24| BEQ .exit
|06DE26| BPL .too_far_right

.too_far_left
|06DE28| INC.w $0D50,X
|06DE2B| BRA .exit

.too_far_right
|06DE2D| DEC.w $0D50,X

.exit
|06DE30| RTS

;---------------------------------------------------------------------------------------------------

.delay_turn
|06DE31| TXA
|06DE32| EOR.b $1A
|06DE34| AND.b #$03
|06DE36| BNE .exit

|06DE38| LDA.b #$10
|06DE3A| JSR ProjectSpriteSpeedTowardsLink

|06DE3D| LDA.b $00
|06DE3F| EOR.b #$FF
|06DE41| INC A
|06DE42| STA.b $00

|06DE44| LDA.b $01
|06DE46| EOR.b #$FF
|06DE48| INC A
|06DE49| STA.b $01

|06DE4B| BRA .handle_movement

;===================================================================================================

pool SpriteModule_Carried

.offset_x_low
|06DE4D| db   0,   0,   0,   0 ; up
|06DE51| db   0,   0,   0,   0 ; down
|06DE55| db -13, -10,  -5,   0 ; left
|06DE59| db  13,  10,   5,   0 ; right

.offset_x_high
|06DE5D| db   0,   0,   0,   0 ; up
|06DE61| db   0,   0,   0,   0 ; down
|06DE65| db  -1,  -1,  -1,   0 ; left
|06DE69| db   0,   0,   0,   0 ; right

.offset_z
|06DE6D| db  13,  14,  15,  16 ; up
|06DE71| db   0,  10,  22,  16 ; down
|06DE75| db   8,  11,  14,  16 ; left
|06DE79| db   8,  11,  14,  16 ; right

.offset_y_low
|06DE7D| db   3,   2,   1,   3,   2,   1

endpool

;---------------------------------------------------------------------------------------------------

SpriteModule_Carried:
|06DE83| LDA.w $040A
|06DE86| STA.w $0C9A,X

|06DE89| LDA.l $7FFA1C,X
|06DE8D| CMP.b #$03
|06DE8F| BEQ .lifted

|06DE91| LDA.w $0DF0,X
|06DE94| BNE .wait_for_timer

|06DE96| LDA.b #$04

|06DE98| LDY.w $0DB0,X
|06DE9B| CPY.b #$06
|06DE9D| BNE .not_large

|06DE9F| LDA.b #$08

.not_large
|06DEA1| STA.w $0DF0,X

|06DEA4| LDA.l $7FFA1C,X
|06DEA8| INC A
|06DEA9| STA.l $7FFA1C,X

.wait_for_timer
|06DEAD| BRA .continue

.lifted
|06DEAF| LDA.w $0E60,X
|06DEB2| AND.b #$EF
|06DEB4| STA.w $0E60,X

;---------------------------------------------------------------------------------------------------

.continue
|06DEB7| STZ.b $00

|06DEB9| LDA.w $0F10,X
|06DEBC| DEC A

|06DEBD| CMP.b #$3F
|06DEBF| BCS .no_x_shake

|06DEC1| AND.b #$02
|06DEC3| BEQ .no_x_shake

|06DEC5| INC.b $00

;---------------------------------------------------------------------------------------------------

.no_x_shake
|06DEC7| LDA.b $2F
|06DEC9| ASL A
|06DECA| CLC
|06DECB| ADC.l $7FFA1C,X
|06DECF| TAY

|06DED0| LDA.b $22
|06DED2| CLC
|06DED3| ADC.w .offset_x_low,Y
|06DED6| PHP

|06DED7| ADC.b $00
|06DED9| STA.w $0D10,X

|06DEDC| LDA.b $23
|06DEDE| ADC.b #$00

|06DEE0| PLP
|06DEE1| ADC.w .offset_x_high,Y
|06DEE4| STA.w $0D30,X

|06DEE7| LDA.w .offset_z,Y
|06DEEA| STA.w $0F70,X

;---------------------------------------------------------------------------------------------------

|06DEED| LDY.b $2E
|06DEEF| CPY.b #$06
|06DEF1| BCC .valid_animation_step

|06DEF3| LDY.b #$00

.valid_animation_step
|06DEF5| LDA.b $24
|06DEF7| CLC
|06DEF8| ADC.b #$01
|06DEFA| PHP

|06DEFB| CLC
|06DEFC| ADC.w .offset_y_low,Y
|06DEFF| STA.b $00

|06DF01| LDA.b $25
|06DF03| ADC.b #$00

|06DF05| PLP
|06DF06| ADC.b #$00
|06DF08| STA.b $0E

|06DF0A| LDA.b $20
|06DF0C| SEC
|06DF0D| SBC.b $00
|06DF0F| PHP

|06DF10| CLC
|06DF11| ADC.b #$08
|06DF13| STA.w $0D00,X

|06DF16| LDA.b $21
|06DF18| ADC.b #$00

|06DF1A| PLP
|06DF1B| SBC.b $0E
|06DF1D| STA.w $0D20,X

|06DF20| LDA.b $EE
|06DF22| AND.b #$01
|06DF24| STA.w $0F20,X

|06DF27| JSR CarriedSprite_CheckForThrow
|06DF2A| JSR Get16BitSpriteCoords

|06DF2D| LDA.l $7FFA2C,X
|06DF31| CMP.b #$0B
|06DF33| BEQ .am_freezed

;---------------------------------------------------------------------------------------------------

|06DF35| JSR SpriteModule_Active

|06DF38| LDA.w $0F10,X
|06DF3B| DEC A
|06DF3C| BNE EXIT_06DF5D

|06DF3E| LDA.b #$09
|06DF40| STA.w $0DD0,X

|06DF43| STZ.w $0DA0,X

|06DF46| LDA.b #$60
|06DF48| STA.w $0F10,X

|06DF4B| LDA.b #$20
|06DF4D| STA.w $0F80,X

|06DF50| LDA.w $0E60,X
|06DF53| ORA.b #$10
|06DF55| STA.w $0E60,X

|06DF58| LDA.b #$02
|06DF5A| STA.w $0309

;---------------------------------------------------------------------------------------------------

#EXIT_06DF5D:
|06DF5D| RTS

;---------------------------------------------------------------------------------------------------

.am_freezed
|06DF5E| JMP.w SpriteModule_Frozen

;===================================================================================================

pool CarriedSprite_CheckForThrow

.throw_speed_x
|06DF61| db   0,   0, -62,  63

.throw_speed_y
|06DF65| db -62,  63,   0,   0

.throw_speed_z
|06DF69| db   4,   4,   4,   4

endpool

;---------------------------------------------------------------------------------------------------

CarriedSprite_CheckForThrow:
|06DF6D| LDA.w $0010
|06DF70| CMP.b #$0E
|06DF72| BEQ EXIT_06DF5D

|06DF74| LDA.b $5B
|06DF76| CMP.b #$02
|06DF78| BEQ .forced_throw

|06DF7A| LDA.b $4D
|06DF7C| AND.b #$01

|06DF7E| LDY.w $037B
|06DF81| BNE .link_not_hittable

|06DF83| ORA.w $0046

.link_not_hittable
|06DF86| ORA.w $0345
|06DF89| ORA.w $02E0
|06DF8C| ORA.w $02DA
|06DF8F| BNE .forced_throw

|06DF91| LDA.l $7FFA1C,X
|06DF95| CMP.b #$03
|06DF97| BNE .no_throw

|06DF99| LDA.b $F4
|06DF9B| ORA.b $F6
|06DF9D| BPL .no_throw

|06DF9F| ASL.b $F6
|06DFA1| LSR.b $F6

;---------------------------------------------------------------------------------------------------

.forced_throw
|06DFA3| LDA.b #$13 ; SFX3.13
|06DFA5| JSL QueueSpriteSFX3WithPan

|06DFA9| LDA.b #$02
|06DFAB| STA.w $0309

|06DFAE| LDA.l $7FFA2C,X
|06DFB2| STA.w $0DD0,X

|06DFB5| STZ.w $0F80,X

|06DFB8| LDA.b #$00
|06DFBA| STA.l $7FFA1C,X

;---------------------------------------------------------------------------------------------------

|06DFBE| PHX

|06DFBF| LDA.w $0E20,X
|06DFC2| TAX

|06DFC3| LDA.l SpriteData_OAMProp,X

|06DFC7| PLX

|06DFC8| AND.b #$10
|06DFCA| STA.b $00

|06DFCC| LDA.w $0E60,X
|06DFCF| AND.b #$EF
|06DFD1| ORA.b $00
|06DFD3| STA.w $0E60,X

|06DFD6| LDA.b $2F
|06DFD8| LSR A
|06DFD9| TAY

|06DFDA| LDA.w .throw_speed_x,Y
|06DFDD| STA.w $0D50,X

|06DFE0| LDA.w .throw_speed_y,Y
|06DFE3| STA.w $0D40,X

|06DFE6| LDA.w .throw_speed_z,Y
|06DFE9| STA.w $0F80,X

|06DFEC| LDA.b #$00
|06DFEE| STA.w $0F10,X

.no_throw
|06DFF1| RTS

;===================================================================================================

ThrownSprite_TileAndSpriteInteraction_long:
|06DFF2| PHB
|06DFF3| PHK
|06DFF4| PLB

|06DFF5| JSR ThrownSprite_TileAndSpriteInteraction

|06DFF8| PLB

|06DFF9| RTL

;===================================================================================================

SpriteModule_Stunned:
|06DFFA| JSR HandleFreezeAndStunTimer
|06DFFD| JSR CheckIfActivePermissive_bank06

|06E000| LDA.w $0EA0,X
|06E003| BEQ .not_recoiling
|06E005| BPL .recoil_timer_ticking

|06E007| STZ.w $0EA0,X

.recoil_timer_ticking
|06E00A| JSR ZeroVelocityXY_bank06

.not_recoiling
|06E00D| LDA.w $0DF0,X
|06E010| CMP.b #$20
|06E012| BCS .delay_damage

|06E014| JSR CheckDamageFromLink

.delay_damage
|06E017| JSR HandleSpriteRecoil_bank06
|06E01A| JSR MoveSpriteXY_bank06

|06E01D| LDA.w $0E90,X
|06E020| BNE .skip_tile_collision

|06E022| JSR CheckSpriteTileCollision

|06E025| LDA.w $0DD0,X
|06E028| BEQ .not_even_here_exit

;===================================================================================================

#ThrownSprite_TileAndSpriteInteraction:
|06E02A| LDA.w $0E70,X
|06E02D| AND.b #$0F
|06E02F| BEQ .skip_tile_collision

|06E031| JSR ApplyRicochet

|06E034| LDA.w $0DD0,X
|06E037| CMP.b #$0B
|06E039| BNE .skip_tile_collision

|06E03B| LDA.b #$05 ; SFX2.05
|06E03D| JSL QueueSpriteSFX2WithPan

.skip_tile_collision
|06E041| LDY.b #$68
|06E043| JSR CheckSpriteTileProperty

|06E046| PHX

|06E047| LDA.w $0E20,X
|06E04A| TAX

|06E04B| LDA.l SpriteData_OAMProp,X

|06E04F| PLX

|06E050| AND.b #$10
|06E052| BEQ .not_over_pit

|06E054| LDA.w $0E60,X
|06E057| ORA.b #$10
|06E059| STA.w $0E60,X

|06E05C| LDA.w $0FA5
|06E05F| CMP.b #$20 ; TILETYPE 20
|06E061| BNE .not_over_pit

|06E063| JSR DisableShadowFlag

.not_over_pit
|06E066| JSR MoveSpriteZ_bank06

|06E069| DEC.w $0F80,X
|06E06C| DEC.w $0F80,X

|06E06F| LDA.w $0F70,X
|06E072| DEC A
|06E073| CMP.b #$F0
|06E075| BCS .not_too_high

|06E077| JMP.w .check_for_freeze

.not_too_high
|06E07A| STZ.w $0F70,X

|06E07D| LDA.w $0E20,X
|06E080| CMP.b #$E8 ; SPRITE E8
|06E082| BNE .dont_set_death_state

|06E084| LDA.w $0F80,X
|06E087| CMP.b #$E8
|06E089| BPL .dont_set_death_state

|06E08B| LDA.b #$06
|06E08D| STA.w $0DD0,X

|06E090| LDA.b #$08
|06E092| STA.w $0DF0,X

;===================================================================================================

#SetOAMAllotmentTo4:
|06E095| LDA.b #$03
|06E097| STA.w $0E40,X

.not_even_here_exit
|06E09A| RTS

;---------------------------------------------------------------------------------------------------

.dont_set_death_state
|06E09B| JSR ThrowableScenery_TransmuteIfValid

|06E09E| LDA.w $0FA5
|06E0A1| CMP.b #$20 ; TILETYPE 20
|06E0A3| BNE .not_pit_or_too_high

|06E0A5| LDA.w $0B6B,X
|06E0A8| LSR A
|06E0A9| BCS .not_pit_or_too_high

;===================================================================================================

#Sprite_SetToFalling:
|06E0AB| LDA.b #$01
|06E0AD| STA.w $0DD0,X

|06E0B0| LDA.b #$1F
|06E0B2| STA.w $0DF0,X

|06E0B5| STZ.w $012E

|06E0B8| LDA.b #$20 ; SFX2.20
|06E0BA| JSL QueueSpriteSFX2WithPan

|06E0BE| RTS

;---------------------------------------------------------------------------------------------------

.not_pit_or_too_high
|06E0BF| CMP.b #$09
|06E0C1| BNE .not_shallow_water

|06E0C3| LDA.w $0F80,X

|06E0C6| STZ.w $0F80,X

|06E0C9| CMP.b #$F0
|06E0CB| BPL .continue

|06E0CD| LDA.b #$EC ; SPRITE EC
|06E0CF| JSL SpawnSpriteDynamically
|06E0D3| BMI .continue

;---------------------------------------------------------------------------------------------------

|06E0D5| JSL SetSpawnedSpriteCoordinates

|06E0D9| PHX

|06E0DA| TYX
|06E0DB| JSR .plop_in_water

|06E0DE| PLX

|06E0DF| BRA .continue

;---------------------------------------------------------------------------------------------------

.not_shallow_water
|06E0E1| CMP.b #$08
|06E0E3| BNE .continue

|06E0E5| LDA.w $0E20,X
|06E0E8| CMP.b #$D2 ; SPRITE D2
|06E0EA| BEQ .spawn_a_fish

|06E0EC| JSL GetRandomNumber
|06E0F0| LSR A
|06E0F1| BCC .plop_in_water

.spawn_a_fish
|06E0F3| JSR SpawnLeapingFish

;---------------------------------------------------------------------------------------------------

.plop_in_water
|06E0F6| JSL CalculateSpriteSFXPan
|06E0FA| ORA.b #$28 ; SFX2.28
|06E0FC| STA.w $012E

|06E0FF| LDA.b #$03
|06E101| STA.w $0DD0,X

|06E104| LDA.b #$0F
|06E106| STA.w $0DF0,X

|06E109| STZ.w $0D80,X

|06E10C| JSL GetRandomNumber
|06E110| AND.b #$01

|06E112| JMP.w SetOAMAllotmentTo4

;---------------------------------------------------------------------------------------------------

.continue
|06E115| LDA.w $0F80,X
|06E118| BPL .positive_z_speed

|06E11A| EOR.b #$FF
|06E11C| INC A
|06E11D| LSR A
|06E11E| CMP.b #$09
|06E120| BCS .not_too_slow

|06E122| LDA.b #$00

.not_too_slow
|06E124| STA.w $0F80,X

.positive_z_speed
|06E127| LDA.w $0D50,X
|06E12A| ASL A
|06E12B| ROR.w $0D50,X

|06E12E| LDA.w $0D50,X
|06E131| CMP.b #$FF
|06E133| BNE .dont_reset_x_speed

|06E135| STZ.w $0D50,X

.dont_reset_x_speed
|06E138| LDA.w $0D40,X
|06E13B| ASL A
|06E13C| ROR.w $0D40,X

|06E13F| LDA.w $0D40,X
|06E142| CMP.b #$FF
|06E144| BNE .check_for_freeze

|06E146| STZ.w $0D40,X

;---------------------------------------------------------------------------------------------------

.check_for_freeze
|06E149| LDA.w $0DD0,X
|06E14C| CMP.b #$0B
|06E14E| BNE .not_even_stunned

|06E150| LDA.l $7FFA3C,X
|06E154| BEQ .exit

.not_even_stunned
|06E156| JSR Sprite_CheckIfLifted

|06E159| LDA.w $0E20,X
|06E15C| CMP.b #$4A ; SPRITE 4A
|06E15E| BEQ .exit

|06E160| JSR ThrownSprite_CheckDamageToSprites

.exit
|06E163| RTS

;===================================================================================================

ThrowableScenery_InteractWithSpritesAndTiles:
|06E164| JSR MoveSpriteXY_bank06
|06E167| LDA.w $0E90,X
|06E16A| BNE .skip_tile_collision

|06E16C| JSR CheckSpriteTileCollision

.skip_tile_collision
|06E16F| JMP.w ThrownSprite_TileAndSpriteInteraction

;===================================================================================================

ThrownSprite_CheckDamageToSprites:
|06E172| LDA.w $0F10,X
|06E175| BNE EXIT_06E1B1

|06E177| LDA.w $0D50,X
|06E17A| ORA.w $0D40,X
|06E17D| BEQ EXIT_06E1B1

|06E17F| LDY.b #$0F

.next
|06E181| PHY
|06E182| CPY.w $0FA0
|06E185| BEQ .skip

|06E187| LDA.w $0E20,X
|06E18A| CMP.b #$D2 ; SPRITE D2
|06E18C| BEQ .skip

|06E18E| LDA.w $0DD0,Y
|06E191| CMP.b #$09
|06E193| BCC .skip

|06E195| TYA
|06E196| EOR.b $1A
|06E198| AND.b #$03
|06E19A| ORA.w $0BA0,Y
|06E19D| ORA.w $0EF0,Y
|06E1A0| BNE .skip

|06E1A2| LDA.w $0F20,X
|06E1A5| CMP.w $0F20,Y
|06E1A8| BNE .skip

|06E1AA| JSR ThrownSprite_CheckDamageToSingleSprite

.skip
|06E1AD| PLY
|06E1AE| DEY
|06E1AF| BPL .next

;---------------------------------------------------------------------------------------------------

#EXIT_06E1B1:
|06E1B1| RTS

;===================================================================================================

ThrownSprite_CheckDamageToSingleSprite:
|06E1B2| LDA.w $0D10,X
|06E1B5| STA.b $00

|06E1B7| LDA.w $0D30,X
|06E1BA| STA.b $08

|06E1BC| LDA.b #$0F
|06E1BE| STA.b $02

|06E1C0| LDA.w $0D00,X
|06E1C3| SEC
|06E1C4| SBC.w $0F70,X

|06E1C7| PHP

|06E1C8| CLC
|06E1C9| ADC.b #$08
|06E1CB| STA.b $01

|06E1CD| LDA.w $0D20,X
|06E1D0| ADC.b #$00

|06E1D2| PLP
|06E1D3| SBC.b #$00
|06E1D5| STA.b $09

|06E1D7| LDA.b #$08
|06E1D9| STA.b $03

;---------------------------------------------------------------------------------------------------

|06E1DB| PHX

|06E1DC| TYX

|06E1DD| JSR SetupSpriteHitbox

|06E1E0| PLX

|06E1E1| JSR CheckIfHitboxesOverlap
|06E1E4| BCC EXIT_06E1B1

|06E1E6| LDA.w $0E20,Y
|06E1E9| CMP.b #$3F ; SPRITE 3F
|06E1EB| BNE .not_tutorial_guard

|06E1ED| JSL PlaceWeaponTinkAtSprite

|06E1F1| BRA ApplyRicochet

;---------------------------------------------------------------------------------------------------

.not_tutorial_guard
|06E1F3| LDA.b #$03
|06E1F5| PHA

|06E1F6| LDA.w $0E20,X
|06E1F9| CMP.b #$EC ; SPRITE EC
|06E1FB| BNE .not_pot

|06E1FD| LDA.w $0DB0,X
|06E200| CMP.b #$02
|06E202| BNE .not_pot

|06E204| LDA.b $1B
|06E206| BNE .not_pot

|06E208| PLA

|06E209| LDA.b #$01
|06E20B| PHA

;---------------------------------------------------------------------------------------------------

.not_pot
|06E20C| PLA
|06E20D| PHX

|06E20E| TYX
|06E20F| PHY

|06E210| JSL CheckAncillaDamageToSprite_preset

|06E214| PLY
|06E215| PLX

|06E216| LDA.w $0D50,X
|06E219| ASL A
|06E21A| STA.w $0F40,Y

|06E21D| LDA.w $0D40,X
|06E220| ASL A
|06E221| STA.w $0F30,Y

|06E224| LDA.b #$10
|06E226| STA.w $0F10,X

;===================================================================================================

ApplyRicochet:
|06E229| JSR InvertSpeedXY
|06E22C| JSR HalveSpeedXY

;===================================================================================================

ThrowableScenery_TransmuteIfValid:
|06E22F| LDA.w $0E20,X
|06E232| CMP.b #$EC ; SPRITE EC
|06E234| BNE EXIT_06E26D

|06E236| STZ.w $0FAC

;===================================================================================================

TransmuteThrowableToDebris:
|06E239| LDA.w $0DC0,X
|06E23C| BEQ .no_secret

|06E23E| STA.w $0B9C

|06E241| JSR SpawnSecret

|06E244| STZ.w $0B9C

.no_secret
|06E247| LDY.w $0DB0,X

|06E24A| LDA.b $1B
|06E24C| BEQ .overworld

|06E24E| LDY.b #$00

.overworld
|06E250| STZ.w $012E

|06E253| LDA.w ThrownItemSFX,Y
|06E256| JSL QueueSpriteSFX2WithPan

;===================================================================================================

ScheduleForBreakage:
|06E25A| LDA.b #$1F

.parameterized
|06E25C| STA.w $0DF0,X

|06E25F| LDA.b #$06
|06E261| STA.w $0DD0,X

|06E264| LDA.w $0E40,X
|06E267| CLC
|06E268| ADC.b #$04
|06E26A| STA.w $0E40,X

;---------------------------------------------------------------------------------------------------

#EXIT_06E26D:
|06E26D| RTS

;===================================================================================================

HalveSpeedXY:
|06E26E| LDA.w $0D50,X
|06E271| ASL A
|06E272| ROR.w $0D50,X

|06E275| LDA.w $0D40,X
|06E278| ASL A
|06E279| ROR.w $0D40,X

|06E27C| RTS

;===================================================================================================

ThrownItemSFX:
|06E27D| db $1F ; SFX2.1F
|06E27E| db $1F ; SFX2.1F
|06E27F| db $1E ; SFX2.1E
|06E280| db $1E ; SFX2.1E
|06E281| db $1E ; SFX2.1E
|06E282| db $1F ; SFX2.1F
|06E283| db $1F ; SFX2.1F
|06E284| db $1F ; SFX2.1F
|06E285| db $1F ; SFX2.1F

;===================================================================================================

SpawnLeapingFish:
|06E286| LDA.b #$D2 ; SPRITE D2
|06E288| JSL SpawnSpriteDynamically
|06E28C| BMI .exit

|06E28E| JSL SetSpawnedSpriteCoordinates

|06E292| LDA.b #$02
|06E294| STA.w $0D80,Y

|06E297| LDA.b #$30
|06E299| STA.w $0DF0,Y

|06E29C| LDA.w $0E20,X
|06E29F| CMP.b #$D2 ; SPRITE D2
|06E2A1| BNE .exit

|06E2A3| STA.w $0D90,Y

.exit
|06E2A6| RTS

;===================================================================================================

pool SpriteModule_Frozen

.sparkle_offset_low
|06E2A7| db  -4,  12,   3,   8

.sparkle_offset_high
|06E2AB| db  -1,   0,   0,   0

.sparkle_mask
|06E2AF| db $7F, $0F, $03, $01, $00, $00, $00

endpool

;===================================================================================================

HandleFreezeAndStunTimer:
|06E2B6| JSL DrawRippleIfInWater

;===================================================================================================

SpriteModule_Frozen:
|06E2BA| JSR SpriteModule_Active

|06E2BD| LDA.l $7FFA3C,X
|06E2C1| BEQ .not_frozen

|06E2C3| LDA.w $0DF0,X
|06E2C6| CMP.b #$20
|06E2C8| BCS .skip_palette

|06E2CA| LDA.w $0F50,X
|06E2CD| AND.b #$F1
|06E2CF| ORA.b #$04
|06E2D1| STA.w $0F50,X

.skip_palette
|06E2D4| LDA.w $0DF0,X
|06E2D7| LSR A
|06E2D8| LSR A
|06E2D9| LSR A
|06E2DA| LSR A
|06E2DB| TAY

|06E2DC| TXA
|06E2DD| ASL A
|06E2DE| ASL A
|06E2DF| ASL A
|06E2E0| ASL A
|06E2E1| EOR.b $1A
|06E2E3| ORA.b $11
|06E2E5| AND.w .sparkle_mask,Y

|06E2E8| BNE .exit

|06E2EA| JSL GetRandomNumber
|06E2EE| AND.b #$03
|06E2F0| TAY

|06E2F1| LDA.w .sparkle_offset_low,Y
|06E2F4| STA.b $00

|06E2F6| LDA.w .sparkle_offset_high,Y
|06E2F9| STA.b $01

|06E2FB| JSL GetRandomNumber
|06E2FF| AND.b #$03
|06E301| TAY

|06E302| LDA.w .sparkle_offset_low,Y
|06E305| STA.b $02

|06E307| LDA.w .sparkle_offset_high,Y
|06E30A| STA.b $03

|06E30C| JSL GarnishSpawn_Sparkle

.exit
|06E310| RTS

;---------------------------------------------------------------------------------------------------

.not_frozen
|06E311| LDA.b $1A
|06E313| AND.b #$01
|06E315| ORA.b $11
|06E317| ORA.w $0FC1
|06E31A| BNE .exit_b

|06E31C| LDA.w $0B58,X
|06E31F| BEQ .unstun

|06E321| DEC.w $0B58,X

|06E324| CMP.b #$38
|06E326| BCS .exit_b

|06E328| AND.b #$01
|06E32A| TAY

|06E32B| LDA.w .shake_x,Y
|06E32E| STA.w $0D50,X

|06E331| JSR MoveSpriteX_bank06

.exit_b
|06E334| RTS

;---------------------------------------------------------------------------------------------------

.unstun
|06E335| LDA.b #$09
|06E337| STA.w $0DD0,X

|06E33A| STZ.w $0F40,X
|06E33D| STZ.w $0F30,X

|06E340| RTS

;---------------------------------------------------------------------------------------------------

.shake_x
|06E341| db   8,  -8

;===================================================================================================

pool SpriteModule_Poof

.offset_x
|06E343| db  -6,  10,   1,  13
|06E347| db  -6,  10,   1,  13
|06E34B| db  -7,   4,  -5,   6
|06E34F| db  -1,   1,  -2,   0

.offset_y
|06E353| db  -6,  -4,  10,   9
|06E357| db  -6,  -4,  10,   9
|06E35B| db  -8, -10,   4,   3
|06E35F| db  -1,  -2,   0,   1

.char
|06E363| db $9B, $9B, $9B, $9B
|06E367| db $B3, $B3, $B3, $B3
|06E36B| db $8A, $8A, $8A, $8A
|06E36F| db $8A, $8A, $8A, $8A

.prop
|06E373| db $24, $A4, $24, $A4
|06E377| db $E4, $64, $A4, $24
|06E37B| db $24, $E4, $E4, $E4
|06E37F| db $24, $E4, $E4, $E4

.size
|06E383| db $00, $00, $00, $00
|06E387| db $00, $00, $00, $00
|06E38B| db $02, $02, $02, $02
|06E38F| db $02, $02, $02, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteModule_Poof:
|06E393| LDA.w $0DF0,X
|06E396| BNE .delay

|06E398| LDA.w $0E20,X
|06E39B| CMP.b #$0D ; SPRITE 0D
|06E39D| BNE .not_cukeman

|06E39F| LDY.w $0EB0,X
|06E3A2| BEQ .not_cukeman

|06E3A4| LDY.w $0D10,X
|06E3A7| PHY

|06E3A8| LDY.w $0D30,X
|06E3AB| PHY

|06E3AC| JSR PrepareEnemyDrop

|06E3AF| PLA
|06E3B0| STA.w $0D30,X

|06E3B3| PLA
|06E3B4| STA.w $0D10,X

|06E3B7| STZ.w $0F80,X
|06E3BA| STZ.w $0BA0,X

|06E3BD| RTS

;---------------------------------------------------------------------------------------------------

.not_cukeman
|06E3BE| LDA.w $0CBA,X
|06E3C1| BNE .no_forced_drop

|06E3C3| LDY.b #$02
|06E3C5| JMP.w ForcePrizeDrop

;---------------------------------------------------------------------------------------------------

.no_forced_drop
|06E3C8| JMP.w MeetYourDemise

;---------------------------------------------------------------------------------------------------

.delay
|06E3CB| JSR GetScreenCoordinates

|06E3CE| LDA.w $0DF0,X
|06E3D1| LSR A
|06E3D2| AND.b #$FC
|06E3D4| STA.b $00

|06E3D6| PHX
|06E3D7| LDX.b #$03

.next_object
|06E3D9| PHX

|06E3DA| TXA
|06E3DB| CLC
|06E3DC| ADC.b $00
|06E3DE| TAX

|06E3DF| LDA.w $0FA8
|06E3E2| CLC
|06E3E3| ADC.w .offset_x,X
|06E3E6| STA.b ($90),Y

|06E3E8| LDA.w $0FA9
|06E3EB| CLC
|06E3EC| ADC.w .offset_y,X
|06E3EF| INY
|06E3F0| STA.b ($90),Y

|06E3F2| LDA.w .char,X
|06E3F5| INY
|06E3F6| STA.b ($90),Y

|06E3F8| LDA.w .prop,X
|06E3FB| INY
|06E3FC| STA.b ($90),Y

|06E3FE| PHY

|06E3FF| TYA
|06E400| LSR A
|06E401| LSR A
|06E402| TAY

|06E403| LDA.w .size,X
|06E406| STA.b ($92),Y

|06E408| PLY
|06E409| INY

|06E40A| PLX
|06E40B| DEX
|06E40C| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06E40E| PLX

|06E40F| LDY.b #$FF
|06E411| LDA.b #$03
|06E413| JMP.w CorrectOAMEntries

;===================================================================================================

GetScreenCoordinates_long:
|06E416| JSR GetScreenCoordinates_wrapper

|06E419| RTL

;---------------------------------------------------------------------------------------------------

GetScreenCoordinates_wrapper:
|06E41A| JSR GetScreenCoordinates

|06E41D| RTS

;---------------------------------------------------------------------------------------------------

GetScreenCoordinates:
|06E41E| STZ.w $0F00,X

|06E421| REP #$20

|06E423| LDA.w $0FD8
|06E426| SEC
|06E427| SBC.b $E2
|06E429| STA.b $00

|06E42B| CLC
|06E42C| ADC.w #$0040
|06E42F| CMP.w #$0170

|06E432| SEP #$20
|06E434| BCS .offscreen

;---------------------------------------------------------------------------------------------------

|06E436| LDA.w $0F70,X
|06E439| STA.b $04
|06E43B| STZ.b $05

|06E43D| REP #$20

|06E43F| LDA.w $0FDA
|06E442| SEC
|06E443| SBC.b $E8
|06E445| PHA

|06E446| SEC
|06E447| SBC.b $04
|06E449| STA.b $02

|06E44B| PLA
|06E44C| CLC
|06E44D| ADC.w #$0040
|06E450| CMP.w #$0170

|06E453| SEP #$20
|06E455| BCC .on_screen

|06E457| LDA.w $0F60,X
|06E45A| AND.b #$20
|06E45C| BEQ .disable

;---------------------------------------------------------------------------------------------------

.on_screen
|06E45E| CLC

.prep_exit
|06E45F| LDA.w $0F50,X
|06E462| EOR.w $0B89,X
|06E465| STA.b $05
|06E467| STZ.b $04

|06E469| LDA.b $00
|06E46B| STA.w $0FA8

|06E46E| LDA.b $02
|06E470| STA.w $0FA9

|06E473| LDY.b #$00

|06E475| RTS

;---------------------------------------------------------------------------------------------------

.offscreen
|06E476| REP #$20

|06E478| LDA.w $0FDA
|06E47B| SEC
|06E47C| SBC.b $E8

|06E47E| SEC
|06E47F| SBC.b $04
|06E481| STA.b $02

|06E483| SEP #$20

;---------------------------------------------------------------------------------------------------

.disable
|06E485| INC.w $0F00,X

|06E488| LDA.w $0CAA,X
|06E48B| BMI .pull_out

|06E48D| JSL KillThisSprite

.pull_out
|06E491| PLA
|06E492| PLA

|06E493| SEC

|06E494| BRA .prep_exit

;===================================================================================================

CheckSpriteTileCollision_long:
|06E496| PHB
|06E497| PHK
|06E498| PLB

|06E499| JSR CheckSpriteTileCollision

|06E49C| PLB

|06E49D| LDA.w $0E70,X

|06E4A0| RTL

;===================================================================================================

CheckSpriteTileCollision_set_layer:
|06E4A1| LDA.w $0FB6
|06E4A4| STA.w $0F20,X

|06E4A7| RTS

;---------------------------------------------------------------------------------------------------

CheckSpriteTileCollision_check_just_one:
|06E4A8| JMP.w CheckSpriteTileCollisionSingleLayer

;---------------------------------------------------------------------------------------------------

CheckSpriteTileCollision:
|06E4AB| STZ.w $0E70,X

|06E4AE| LDA.w $0F60,X
|06E4B1| BMI CheckSpriteTileCollision_check_just_one

|06E4B3| LDA.w $046C
|06E4B6| BEQ CheckSpriteTileCollision_check_just_one

|06E4B8| LDA.w $0F20,X
|06E4BB| STA.w $0FB6

|06E4BE| LDA.b #$01
|06E4C0| STA.w $0F20,X

|06E4C3| JSR CheckSpriteTileCollisionSingleLayer

|06E4C6| LDA.w $046C
|06E4C9| CMP.b #$04
|06E4CB| BEQ CheckSpriteTileCollision_set_layer

|06E4CD| STZ.w $0F20,X

|06E4D0| JSR CheckSpriteTileCollisionSingleLayer

|06E4D3| LDA.w $0FA5
|06E4D6| STA.l $7FFABC,X

|06E4DA| RTS

;===================================================================================================

CheckSpriteTileCollisionSingleLayer:
|06E4DB| LDA.w $0E40,X
|06E4DE| AND.b #$20
|06E4E0| BEQ .normal_check

|06E4E2| LDY.b #$6A
|06E4E4| JSR CheckSpriteTileProperty
|06E4E7| BCC .exit_a

|06E4E9| INC.w $0E70,X

.exit_a
|06E4EC| RTS

;---------------------------------------------------------------------------------------------------

.normal_check
|06E4ED| LDA.w $0F60,X
|06E4F0| BMI .force_check

|06E4F2| LDA.w $046C
|06E4F5| BNE .unorthodox_collision_settings

.force_check
|06E4F7| LDY.b #$00

|06E4F9| LDA.w $0D40,X
|06E4FC| BEQ .no_y_velocity
|06E4FE| BMI .negative_y_velocity

|06E500| INY

.negative_y_velocity
|06E501| JSR CheckTileInDirection_vertical

.no_y_velocity
|06E504| LDY.b #$02

|06E506| LDA.w $0D50,X
|06E509| BEQ .no_x_velocity
|06E50B| BMI .negative_x_velocity

|06E50D| INY

.negative_x_velocity
|06E50E| JSR CheckTileInDirection_horizontal

.no_x_velocity
|06E511| BRA .continue

;---------------------------------------------------------------------------------------------------

.unorthodox_collision_settings
|06E513| LDY.b #$01

.check_next_vertical
|06E515| JSR CheckTileInDirection_vertical

|06E518| DEY
|06E519| BPL .check_next_vertical

;---------------------------------------------------------------------------------------------------

|06E51B| LDY.b #$03

.check_next_horizontal
|06E51D| JSR CheckTileInDirection_horizontal

|06E520| DEY
|06E521| CPY.b #$01
|06E523| BNE .check_next_horizontal

;---------------------------------------------------------------------------------------------------

.continue
|06E525| LDA.w $0BE0,X
|06E528| BMI .exit_b

|06E52A| LDA.w $0F70,X
|06E52D| BEQ .grounded

.exit_b
|06E52F| RTS

;---------------------------------------------------------------------------------------------------

.grounded
|06E530| LDY.b #$68
|06E532| JSR CheckSpriteTileProperty

|06E535| LDA.w $0FA5
|06E538| STA.l $7FF9C2,X

|06E53C| CMP.b #$1C ; TILETYPE 1C
|06E53E| BNE .dont_fall_to_lower_layer

|06E540| LDY.w $0FB3
|06E543| BEQ .dont_fall_to_lower_layer

|06E545| LDY.w $0DD0,X
|06E548| CPY.b #$0B
|06E54A| BNE .dont_fall_to_lower_layer

|06E54C| LDA.b #$01
|06E54E| STA.w $0F20,X

|06E551| RTS

;---------------------------------------------------------------------------------------------------

.dont_fall_to_lower_layer
|06E552| CMP.b #$20 ; TILETYPE 20
|06E554| BNE .not_pit

|06E556| LDA.w $0B6B,X
|06E559| AND.b #$01
|06E55B| BEQ .sprite_cant_fall

|06E55D| LDA.b $1B
|06E55F| BNE .indoors_pit

|06E561| JMP.w Sprite_SetToFalling

.indoors_pit
|06E564| LDA.b #$05
|06E566| STA.w $0DD0,X

|06E569| LDA.b #$5F

|06E56B| LDY.w $0E20,X
|06E56E| CPY.b #$13 ; SPRITE 13
|06E570| BEQ .mini_helma_falling

|06E572| CPY.b #$26 ; SPRITE 26
|06E574| BNE .not_beetle_falling

.mini_helma_falling
|06E576| LSR.w $0F50,X
|06E579| ASL.w $0F50,X

|06E57C| LDA.b #$3F

.not_beetle_falling
|06E57E| STA.w $0DF0,X

|06E581| RTS

;---------------------------------------------------------------------------------------------------

.not_pit
|06E582| CMP.b #$0C ; TILETYPE 0C
|06E584| BNE .sprite_cant_fall

|06E586| LDA.l $7FFABC,X
|06E58A| CMP.b #$1C ; TILETYPE 1C
|06E58C| BNE .exit_c

|06E58E| JSR SpriteFall_AdjustPosition

|06E591| LDA.w $0E70,X
|06E594| ORA.b #$20
|06E596| STA.w $0E70,X

|06E599| RTS

;---------------------------------------------------------------------------------------------------

.sprite_cant_fall
|06E59A| CMP.b #$68 ; TILETYPE 68
|06E59C| BCC .not_a_conveyor

|06E59E| CMP.b #$6C ; TILETYPE 6C
|06E5A0| BCS .exit_c

.apply_conveyor_motion
|06E5A2| TAY
|06E5A3| JSL ApplyConveyorToSprites

|06E5A7| RTS

;---------------------------------------------------------------------------------------------------

.not_a_conveyor
|06E5A8| CMP.b #$08 ; TILETYPE 08
|06E5AA| BNE .exit_c

|06E5AC| LDA.w $046C
|06E5AF| CMP.b #$04
|06E5B1| BNE .exit_c

|06E5B3| LDA.b #$6A ; TILETYPE 6A
|06E5B5| BRA .apply_conveyor_motion

.exit_c
|06E5B7| RTS

;===================================================================================================

CheckTileInDirection_horizontal:
|06E5B8| JSR CheckTileInDirection
|06E5BB| BCC .exit

|06E5BD| LDA.w CheckTileInDirection.direction_flag,Y
|06E5C0| ORA.w $0E70,X
|06E5C3| STA.w $0E70,X

|06E5C6| LDA.w $0E30,X
|06E5C9| AND.b #$07
|06E5CB| CMP.b #$05
|06E5CD| BCS .exit

|06E5CF| LDA.w $0EA0,X
|06E5D2| BEQ .check_once

|06E5D4| JSR .check_once
|06E5D7| JSR .check_once

;---------------------------------------------------------------------------------------------------

.check_once
|06E5DA| LDA.w $0D10,X
|06E5DD| CLC
|06E5DE| ADC.w CheckTileInDirection.pushback_low,Y
|06E5E1| STA.w $0D10,X

|06E5E4| LDA.w $0D30,X
|06E5E7| ADC.w CheckTileInDirection.pushback_high,Y
|06E5EA| STA.w $0D30,X

.exit
|06E5ED| RTS

;===================================================================================================

CheckTileInDirection_vertical:
|06E5EE| JSR CheckTileInDirection
|06E5F1| BCC .exit

|06E5F3| LDA.w CheckTileInDirection.direction_flag,Y
|06E5F6| ORA.w $0E70,X
|06E5F9| STA.w $0E70,X

|06E5FC| LDA.w $0E30,X
|06E5FF| AND.b #$07
|06E601| CMP.b #$05
|06E603| BCS .exit

|06E605| LDA.w $0EA0,X
|06E608| BEQ .check_once

|06E60A| JSR .check_once
|06E60D| JSR .check_once

;---------------------------------------------------------------------------------------------------

.check_once
|06E610| LDA.w $0D00,X
|06E613| CLC
|06E614| ADC.w CheckTileInDirection.pushback_low,Y
|06E617| STA.w $0D00,X

|06E61A| LDA.w $0D20,X
|06E61D| ADC.w CheckTileInDirection.pushback_high,Y
|06E620| STA.w $0D20,X

.exit
|06E623| RTS

;===================================================================================================

SpriteFall_AdjustPosition:
|06E624| LDA.w $0310
|06E627| CLC
|06E628| ADC.w $0D00,X
|06E62B| STA.w $0D00,X

|06E62E| LDA.w $0311
|06E631| ADC.w $0D20,X
|06E634| STA.w $0D20,X

|06E637| LDA.w $0312
|06E63A| CLC
|06E63B| ADC.w $0D10,X
|06E63E| STA.w $0D10,X

|06E641| LDA.w $0313
|06E644| ADC.w $0D30,X
|06E647| STA.w $0D30,X

|06E64A| RTS

;===================================================================================================

pool CheckSpriteTileProperty

.offset_x
|06E64B| dw $0008, $0008, $0002, $000E
|06E653| dw $0008, $0008, $FFFE, $000A
|06E65B| dw $0008, $0008, $0001, $000E
|06E663| dw $0004, $0004, $0004, $0004
|06E66B| dw $0004, $0004, $FFFE, $000A
|06E673| dw $0008, $0008, $FFE7, $0028
|06E67B| dw $0008, $0008, $0002, $000E
|06E683| dw $0008, $0008, $FFF8, $0017
|06E68B| dw $0008, $0008, $FFEC, $0024
|06E693| dw $0008, $0008, $FFFF, $0010
|06E69B| dw $0008, $0008, $FFFF, $0010
|06E6A3| dw $0008, $0008, $FFF8, $0018
|06E6AB| dw $0008, $0008, $FFF8, $0018
|06E6B3| dw $0008, $0003

.offset_y
|06E6B7| dw $0006, $0014, $000D, $000D
|06E6BF| dw $0000, $0008, $0004, $0004
|06E6C7| dw $0001, $000E, $0008, $0008
|06E6CF| dw $0004, $0004, $0004, $0004
|06E6D7| dw $FFFE, $000A, $0004, $0004
|06E6DF| dw $FFE7, $0028, $0008, $0008
|06E6E7| dw $0003, $0010, $000A, $000A
|06E6EF| dw $FFF8, $0019, $0008, $0008
|06E6F7| dw $FFEC, $0024, $0008, $0008
|06E6FF| dw $FFFF, $0010, $0008, $0008
|06E707| dw $000E, $0003, $0008, $0008
|06E70F| dw $FFF8, $0018, $0008, $0008
|06E717| dw $FFF8, $0020, $0008, $0008
|06E71F| dw $000C, $0004

endpool

;===================================================================================================

pool CheckTileInDirection

.direction_flag
|06E723| db $08 ; up
|06E724| db $04 ; down
|06E725| db $02 ; left
|06E726| db $01 ; right

.pushback_low
|06E727| db   1 ; up
|06E728| db  -1 ; down
|06E729| db   1 ; left
|06E72A| db  -1 ; right

.pushback_high
|06E72B| db   0 ; up
|06E72C| db  -1 ; down
|06E72D| db   0 ; left
|06E72E| db  -1 ; right

endpool

;===================================================================================================

CheckTileInDirection:
|06E72F| STY.b $08

|06E731| LDA.w $0B6B,X
|06E734| AND.b #$F0
|06E736| LSR A
|06E737| LSR A
|06E738| ADC.b $08
|06E73A| ASL A
|06E73B| TAY

;===================================================================================================

CheckSpriteTileProperty:
|06E73C| LDA.b $1B
|06E73E| BEQ .overworld

;---------------------------------------------------------------------------------------------------

|06E740| REP #$20

|06E742| LDA.w $0FDA
|06E745| CLC
|06E746| ADC.w #$0008
|06E749| AND.w #$01FF

|06E74C| CLC
|06E74D| ADC.w .offset_y,Y

|06E750| SEC
|06E751| SBC.w #$0008
|06E754| STA.b $00

|06E756| CMP.w #$0200
|06E759| BCS .continue_check

|06E75B| LDA.w $0FD8
|06E75E| ADC.w #$0008
|06E761| AND.w #$01FF

|06E764| CLC
|06E765| ADC.w .offset_x,Y

|06E768| SEC
|06E769| SBC.w #$0008
|06E76C| STA.b $02

|06E76E| CMP.w #$0200
|06E771| BRA .continue_check

;---------------------------------------------------------------------------------------------------

.overworld
|06E773| REP #$20

|06E775| LDA.w $0FDA
|06E778| CLC
|06E779| ADC.w .offset_y,Y
|06E77C| STA.b $00

|06E77E| SEC
|06E77F| SBC.w $0FBE
|06E782| CMP.w $0FBA
|06E785| BCS .continue_check

|06E787| LDA.w $0FD8
|06E78A| CLC
|06E78B| ADC.w .offset_x,Y
|06E78E| STA.b $02

|06E790| SEC
|06E791| SBC.w $0FBC
|06E794| CMP.w $0FB8

;---------------------------------------------------------------------------------------------------

.continue_check
|06E797| SEP #$20
|06E799| BCC .check_attributes

|06E79B| JMP.w .check_harmlessness

.check_attributes
|06E79E| JSR GetTileTypeForSprite
|06E7A1| TAY

|06E7A2| LDA.w $0CAA,X
|06E7A5| AND.b #$08
|06E7A7| BEQ .dont_use_projectile_table

|06E7A9| PHX
|06E7AA| TYX

|06E7AB| LDY.b $08

|06E7AD| LDA.l GeneralizedProjectileTileInteraction,X

|06E7B1| PLX

|06E7B2| CMP.b #$04
|06E7B4| BEQ .check_worldiness

|06E7B6| CMP.b #$01
|06E7B8| BCC .proceed_to_failure

|06E7BA| LDA.w $0FA5
|06E7BD| CMP.b #$10 ; TILETYPE 10
|06E7BF| BCC .proceed_to_success

|06E7C1| CMP.b #$14 ; TILETYPE 14
|06E7C3| BCS .proceed_to_success

|06E7C5| JSR CheckSlopedTileCollision

|06E7C8| JMP.w .load_tile_prop_exit

;---------------------------------------------------------------------------------------------------

.proceed_to_success
|06E7CB| JMP.w .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.check_worldiness
|06E7CE| LDY.b $1B
|06E7D0| BNE .proceed_to_failure

|06E7D2| STA.w $0E90,X

.proceed_to_failure
|06E7D5| JMP.w .fail

;---------------------------------------------------------------------------------------------------

.dont_use_projectile_table
|06E7D8| LDA.w $0BE0,X
|06E7DB| ASL A
|06E7DC| BPL .disable_some_checks

|06E7DE| LDA.w $0E20,X
|06E7E1| CMP.b #$D2 ; SPRITE D2
|06E7E3| BEQ .is_fish

|06E7E5| CMP.b #$8A ; SPRITE 8A
|06E7E7| BNE .not_spiky_ouchers

.is_fish
|06E7E9| CPY.b #$09 ; TILETYPE 09
|06E7EB| BEQ .fish_in_deep_water

.not_spiky_ouchers
|06E7ED| CMP.b #$94 ; SPRITE 94
|06E7EF| BNE .not_pirogusu

|06E7F1| LDA.w $0E90,X
|06E7F4| BEQ .check_for_water

|06E7F6| BRA .disable_some_checks

;---------------------------------------------------------------------------------------------------

.not_pirogusu
|06E7F8| CMP.b #$E3 ; SPRITE E3
|06E7FA| BEQ .check_for_water

|06E7FC| CMP.b #$8C ; SPRITE 8C
|06E7FE| BEQ .check_for_water

|06E800| CMP.b #$9A ; SPRITE 9A
|06E802| BEQ .check_for_water

|06E804| CMP.b #$81 ; SPRITE 81
|06E806| BNE .disable_some_checks

.check_for_water
|06E808| CPY.b #$08 ; TILETYPE 08
|06E80A| BEQ .fail

|06E80C| CPY.b #$09 ; TILETYPE 09

.fish_in_deep_water
|06E80E| BEQ .fail

|06E810| BRA .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.disable_some_checks
|06E812| PHX
|06E813| TYX

|06E814| LDA.l GeneralizedSpriteTileInteraction,X

|06E818| PLX

|06E819| LDY.b $08
|06E81B| CMP.b #$00
|06E81D| BEQ .fail

|06E81F| LDA.w $0FA5
|06E822| CMP.b #$10 ; TILETYPE 10
|06E824| BCC .not_slope

|06E826| CMP.b #$14 ; TILETYPE 14
|06E828| BCS .not_slope

|06E82A| JSR CheckSlopedTileCollision
|06E82D| BRA .load_tile_prop_exit

;---------------------------------------------------------------------------------------------------

.not_slope
|06E82F| CMP.b #$44 ; TILETYPE 44
|06E831| BNE .not_spike

|06E833| LDA.w $0EA0,X
|06E836| BEQ .succeed_and_exit

|06E838| LDA.w $0CE2,X
|06E83B| BMI .skip_damage_or_recoil

|06E83D| LDA.b #$04
|06E83F| JSL CheckAncillaDamageToSprite_preset

|06E843| LDA.w $0EF0,X
|06E846| BEQ .skip_damage_or_recoil

|06E848| LDA.b #$99
|06E84A| STA.w $0EF0,X

|06E84D| STZ.w $0EA0,X

.skip_damage_or_recoil
|06E850| BRA .succeed_and_exit

;---------------------------------------------------------------------------------------------------

.check_harmlessness
|06E852| JSR .succeed_and_exit

|06E855| LDA.w $0E40,X
|06E858| ASL A
|06E859| BPL .dont_die

|06E85B| STZ.w $0DD0,X

|06E85E| CLC

|06E85F| RTS

.dont_die
|06E860| SEC

|06E861| RTS

;---------------------------------------------------------------------------------------------------

.not_spike
|06E862| CMP.b #$20 ; TILETYPE 20
|06E864| BNE .succeed_and_exit

|06E866| LDA.w $0B6B,X
|06E869| AND.b #$01
|06E86B| BEQ .succeed_and_exit

|06E86D| LDA.w $0EA0,X
|06E870| BNE .fail

;---------------------------------------------------------------------------------------------------

.succeed_and_exit
|06E872| SEC
|06E873| SEP #$21

|06E875| BRA .load_tile_prop_exit

.fail
|06E877| CLC

.load_tile_prop_exit
|06E878| LDY.b $08

|06E87A| RTS

;===================================================================================================

GetTileType_long:
|06E87B| PHB
|06E87C| PHK
|06E87D| PLB

|06E87E| JSR GetTileType

|06E881| PLB

|06E882| RTL

;===================================================================================================

GetTileTypeForSprite:
|06E883| LDA.w $0F20,X

;===================================================================================================

GetTileType:
|06E886| CMP.b #$01

|06E888| REP #$30

|06E88A| STZ.b $05
|06E88C| BCC .other_layer

|06E88E| LDA.w #$1000
|06E891| STA.b $05

.other_layer
|06E893| LDA.b $1B
|06E895| AND.w #$00FF
|06E898| BEQ .overworld

;---------------------------------------------------------------------------------------------------

.underworld
|06E89A| LDA.b $02
|06E89C| AND.w #$01FF

|06E89F| LSR A
|06E8A0| LSR A
|06E8A1| LSR A

|06E8A2| STA.b $04

|06E8A4| LDA.b $00
|06E8A6| AND.w #$01F8

|06E8A9| ASL A
|06E8AA| ASL A
|06E8AB| ASL A

|06E8AC| CLC
|06E8AD| ADC.b $04

|06E8AF| CLC
|06E8B0| ADC.b $05

|06E8B2| PHX

|06E8B3| TAX

|06E8B4| LDA.l $7F2000,X

|06E8B8| PLX

|06E8B9| SEP #$30

|06E8BB| STA.w $0FA5

|06E8BE| RTS

;---------------------------------------------------------------------------------------------------

.overworld
|06E8BF| LDA.b $02
|06E8C1| LSR A
|06E8C2| LSR A
|06E8C3| LSR A
|06E8C4| STA.b $02

|06E8C6| SEP #$10

|06E8C8| PHX
|06E8C9| PHY

|06E8CA| JSL GetOverworldTileType

|06E8CE| SEP #$30

|06E8D0| STA.w $0FA5

|06E8D3| PLY
|06E8D4| PLX

|06E8D5| RTS

;===================================================================================================

pool CheckSlopedTileCollision

.angle
|06E8D6| db $07, $06, $05, $04, $03, $02, $01, $00
|06E8DE| db $00, $01, $02, $03, $04, $05, $06, $07

|06E8E6| db $00, $01, $02, $03, $04, $05, $06, $07
|06E8EE| db $07, $06, $05, $04, $03, $02, $01, $00

endpool

;---------------------------------------------------------------------------------------------------

CheckSlopedTileCollision_long:
|06E8F6| PHB
|06E8F7| PHK
|06E8F8| PLB

|06E8F9| JSR CheckSlopedTileCollision

|06E8FC| PLB

|06E8FD| RTL

;===================================================================================================

CheckSlopedTileCollision:
|06E8FE| LDA.b $00
|06E900| AND.b #$07
|06E902| STA.b $04

|06E904| LDA.b $02
|06E906| AND.b #$07
|06E908| STA.b $05

|06E90A| LDA.w $0FA5
|06E90D| SEC
|06E90E| SBC.b #$10
|06E910| STA.b $06

|06E912| ASL A
|06E913| ASL A
|06E914| ASL A

|06E915| CLC
|06E916| ADC.b $05
|06E918| TAY

|06E919| LDA.b $06
|06E91B| CMP.b #$02
|06E91D| BCC .flip_comparison

|06E91F| LDA.b $04
|06E921| CMP.w .angle,Y
|06E924| BRA .exit

;---------------------------------------------------------------------------------------------------

.flip_comparison
|06E926| LDA.w .angle,Y
|06E929| CMP.b $04

.exit
|06E92B| RTS

;===================================================================================================

MoveSpriteXY_bank06:
|06E92C| JSR MoveSpriteX_bank06

|06E92F| JMP.w MoveSpriteY_bank06

;---------------------------------------------------------------------------------------------------

MoveSpriteX_bank06:
|06E932| TXA
|06E933| CLC
|06E934| ADC.b #$10
|06E936| TAX

|06E937| JSR MoveSpriteY_bank06

|06E93A| LDX.w $0FA0

|06E93D| RTS

;===================================================================================================

MoveSpriteY_bank06:
|06E93E| LDA.w $0D40,X
|06E941| BEQ .exit

|06E943| ASL A
|06E944| ASL A
|06E945| ASL A
|06E946| ASL A

|06E947| CLC
|06E948| ADC.w $0D60,X
|06E94B| STA.w $0D60,X

|06E94E| LDA.w $0D40,X
|06E951| PHP

|06E952| LSR A
|06E953| LSR A
|06E954| LSR A
|06E955| LSR A

|06E956| LDY.b #$00

|06E958| PLP
|06E959| BPL .positive_velocity

|06E95B| ORA.b #$F0
|06E95D| DEY

.positive_velocity
|06E95E| ADC.w $0D00,X
|06E961| STA.w $0D00,X

|06E964| TYA
|06E965| ADC.w $0D20,X
|06E968| STA.w $0D20,X

.exit
|06E96B| RTS

;===================================================================================================

MoveSpriteZ_bank06:
|06E96C| LDA.w $0F80,X

|06E96F| ASL A
|06E970| ASL A
|06E971| ASL A
|06E972| ASL A

|06E973| CLC
|06E974| ADC.w $0F90,X
|06E977| STA.w $0F90,X

|06E97A| LDA.w $0F80,X
|06E97D| PHP

|06E97E| LSR A
|06E97F| LSR A
|06E980| LSR A
|06E981| LSR A

|06E982| PLP
|06E983| BPL .positive_velocity

|06E985| ORA.b #$F0

.positive_velocity
|06E987| ADC.w $0F70,X
|06E98A| STA.w $0F70,X

|06E98D| RTS

;===================================================================================================

ProjectSpriteSpeedTowardsLink_InstantExit:
|06E98E| STZ.b $00

|06E990| RTS

;---------------------------------------------------------------------------------------------------

ProjectSpriteSpeedTowardsLink:
|06E991| STA.b $01

|06E993| CMP.b #$00
|06E995| BEQ ProjectSpriteSpeedTowardsLink_InstantExit

|06E997| PHX
|06E998| PHY

|06E999| JSR GetYDisplacementFromLink
|06E99C| STY.b $02

|06E99E| LDA.b $0E
|06E9A0| BPL .positive_y

|06E9A2| EOR.b #$FF
|06E9A4| INC A

.positive_y
|06E9A5| STA.b $0C

;---------------------------------------------------------------------------------------------------

|06E9A7| JSR GetXDisplacementFromLink
|06E9AA| STY.b $03

|06E9AC| LDA.b $0F
|06E9AE| BPL .positive_x

|06E9B0| EOR.b #$FF
|06E9B2| INC A

.positive_x
|06E9B3| STA.b $0D

;---------------------------------------------------------------------------------------------------

|06E9B5| LDY.b #$00

|06E9B7| LDA.b $0D
|06E9B9| CMP.b $0C
|06E9BB| BCS .x_is_bigger

|06E9BD| INY

|06E9BE| PHA

|06E9BF| LDA.b $0C
|06E9C1| STA.b $0D

|06E9C3| PLA
|06E9C4| STA.b $0C

.x_is_bigger
|06E9C6| STZ.b $0B
|06E9C8| STZ.b $00

|06E9CA| LDX.b $01

;---------------------------------------------------------------------------------------------------

.next
|06E9CC| LDA.b $0B
|06E9CE| CLC
|06E9CF| ADC.b $0C
|06E9D1| CMP.b $0D
|06E9D3| BCC .dont_accumulate

|06E9D5| SBC.b $0D
|06E9D7| INC.b $00

.dont_accumulate
|06E9D9| STA.b $0B

|06E9DB| DEX
|06E9DC| BNE .next

;---------------------------------------------------------------------------------------------------

|06E9DE| TYA
|06E9DF| BEQ .dont_flip_axes

|06E9E1| LDA.b $00
|06E9E3| PHA

|06E9E4| LDA.b $01
|06E9E6| STA.b $00

|06E9E8| PLA
|06E9E9| STA.b $01

.dont_flip_axes
|06E9EB| LDA.b $00
|06E9ED| LDY.b $02
|06E9EF| BEQ .sign_correct_y

|06E9F1| EOR.b #$FF
|06E9F3| INC A
|06E9F4| STA.b $00

.sign_correct_y
|06E9F6| LDA.b $01
|06E9F8| LDY.b $03
|06E9FA| BEQ .sign_correct_x

|06E9FC| EOR.b #$FF
|06E9FE| INC A
|06E9FF| STA.b $01

.sign_correct_x
|06EA01| PLY
|06EA02| PLX

|06EA03| RTS

;===================================================================================================

ApplySpeedTowardsLink:
|06EA04| JSR ProjectSpriteSpeedTowardsLink

|06EA07| LDA.b $00
|06EA09| STA.w $0D40,X

|06EA0C| LDA.b $01
|06EA0E| STA.w $0D50,X

|06EA11| RTS

;===================================================================================================

ApplySpeedTowardsLink_long:
|06EA12| PHB
|06EA13| PHK
|06EA14| PLB

|06EA15| JSR ApplySpeedTowardsLink

|06EA18| PLB

|06EA19| RTL

;===================================================================================================

ProjectSpriteSpeedTowardsLink_long:
|06EA1A| PHB
|06EA1B| PHK
|06EA1C| PLB

|06EA1D| JSR ProjectSpriteSpeedTowardsLink

|06EA20| PLB

|06EA21| RTL

;===================================================================================================

ProjectSpriteSpeedTowardsLocation_long:
|06EA22| PHB
|06EA23| PHK
|06EA24| PLB

|06EA25| JSR ProjectSpriteSpeedTowardsLocation

|06EA28| PLB

|06EA29| RTL

;===================================================================================================

ProjectSpriteSpeedTowardsLocation_InstantExit:
|06EA2A| STZ.b $00

|06EA2C| RTS

;---------------------------------------------------------------------------------------------------

ProjectSpriteSpeedTowardsLocation:
|06EA2D| STA.b $01

|06EA2F| CMP.b #$00
|06EA31| BEQ ProjectSpriteSpeedTowardsLocation_InstantExit

|06EA33| PHX
|06EA34| PHY

|06EA35| JSR GetYDisplacement
|06EA38| STY.b $02

|06EA3A| LDA.b $0E
|06EA3C| BPL .positive_y

|06EA3E| EOR.b #$FF
|06EA40| INC A

.positive_y
|06EA41| STA.b $0C

;---------------------------------------------------------------------------------------------------

|06EA43| JSR GetXDisplacement
|06EA46| STY.b $03

|06EA48| LDA.b $0F
|06EA4A| BPL .positive_x

|06EA4C| EOR.b #$FF
|06EA4E| INC A

.positive_x
|06EA4F| STA.b $0D

;---------------------------------------------------------------------------------------------------

|06EA51| LDY.b #$00

|06EA53| LDA.b $0D
|06EA55| CMP.b $0C
|06EA57| BCS .x_is_bigger

|06EA59| INY

|06EA5A| PHA

|06EA5B| LDA.b $0C
|06EA5D| STA.b $0D

|06EA5F| PLA
|06EA60| STA.b $0C

.x_is_bigger
|06EA62| STZ.b $0B
|06EA64| STZ.b $00

|06EA66| LDX.b $01

;---------------------------------------------------------------------------------------------------

.next
|06EA68| LDA.b $0B
|06EA6A| CLC
|06EA6B| ADC.b $0C

|06EA6D| CMP.b $0D
|06EA6F| BCC .dont_accumulate

|06EA71| SBC.b $0D
|06EA73| INC.b $00

.dont_accumulate
|06EA75| STA.b $0B

|06EA77| DEX
|06EA78| BNE .next

;---------------------------------------------------------------------------------------------------

|06EA7A| TYA
|06EA7B| BEQ .x_was_bigger

|06EA7D| LDA.b $00
|06EA7F| PHA

|06EA80| LDA.b $01
|06EA82| STA.b $00

|06EA84| PLA
|06EA85| STA.b $01

;---------------------------------------------------------------------------------------------------

.x_was_bigger
|06EA87| LDA.b $00
|06EA89| LDY.b $02
|06EA8B| BEQ .sign_correct_y

|06EA8D| EOR.b #$FF
|06EA8F| INC A
|06EA90| STA.b $00

.sign_correct_y
|06EA92| LDA.b $01
|06EA94| LDY.b $03
|06EA96| BEQ .sign_correct_x

|06EA98| EOR.b #$FF
|06EA9A| INC A
|06EA9B| STA.b $01

.sign_correct_x
|06EA9D| PLY
|06EA9E| PLX

|06EA9F| RTS

;===================================================================================================

GetDirectionTowardsLink_long:
|06EAA0| JSR GetDirectionTowardsLink

|06EAA3| RTL

;===================================================================================================

GetDirectionTowardsLink:
|06EAA4| JSR GetXDisplacementFromLink
|06EAA7| STY.b $00

|06EAA9| JSR GetYDisplacementFromLink
|06EAAC| STY.b $01

|06EAAE| LDA.b $0E
|06EAB0| BPL .positive_y

|06EAB2| EOR.b #$FF
|06EAB4| INC A

.positive_y
|06EAB5| STA.w $0FB5

|06EAB8| LDA.b $0F
|06EABA| BPL .positive_x

|06EABC| EOR.b #$FF
|06EABE| INC A

.positive_x
|06EABF| CMP.w $0FB5
|06EAC2| BCC .use_y_axis

.use_x_axis
|06EAC4| LDY.b $00

|06EAC6| RTS

;---------------------------------------------------------------------------------------------------

.use_y_axis
|06EAC7| LDA.b $01
|06EAC9| INC A
|06EACA| INC A
|06EACB| TAY

|06EACC| RTS

;===================================================================================================

GetXDisplacementFromLink_long:
|06EACD| JSR GetXDisplacementFromLink

|06EAD0| RTL

;===================================================================================================

GetXDisplacementFromLink:
|06EAD1| LDY.b #$00

|06EAD3| LDA.b $22
|06EAD5| SEC
|06EAD6| SBC.w $0D10,X
|06EAD9| STA.b $0F

|06EADB| LDA.b $23
|06EADD| SBC.w $0D30,X
|06EAE0| BPL .exit

|06EAE2| INY

.exit
|06EAE3| RTS

;===================================================================================================

GetYDisplacementFromLink_long:
|06EAE4| JSR GetYDisplacementFromLink

|06EAE7| RTL

;===================================================================================================

GetYDisplacementFromLink: 
|06EAE8| LDY.b #$00

|06EAEA| LDA.b $20
|06EAEC| CLC
|06EAED| ADC.b #$08
|06EAEF| PHP

|06EAF0| CLC
|06EAF1| ADC.w $0F70,X

|06EAF4| PHP

|06EAF5| SEC
|06EAF6| SBC.w $0D00,X
|06EAF9| STA.b $0E

|06EAFB| LDA.b $21
|06EAFD| SBC.w $0D20,X

|06EB00| PLP
|06EB01| ADC.b #$00

|06EB03| PLP
|06EB04| ADC.b #$00
|06EB06| BPL .exit

|06EB08| INY

.exit
|06EB09| RTS

;===================================================================================================

GetXDisplacement:
|06EB0A| LDY.b #$00

|06EB0C| LDA.b $04
|06EB0E| SEC
|06EB0F| SBC.w $0D10,X
|06EB12| STA.b $0F

|06EB14| LDA.b $05
|06EB16| SBC.w $0D30,X
|06EB19| BPL .exit

|06EB1B| INY

.exit
|06EB1C| RTS

;===================================================================================================

GetYDisplacement:
|06EB1D| LDY.b #$00

|06EB1F| LDA.b $06
|06EB21| SEC
|06EB22| SBC.w $0D00,X
|06EB25| STA.b $0E

|06EB27| LDA.b $07
|06EB29| SBC.w $0D20,X
|06EB2C| BPL .exit

|06EB2E| INY

.exit
|06EB2F| RTS

;===================================================================================================

GetDirectionTowardsPoint:
|06EB30| PHB
|06EB31| PHK
|06EB32| PLB

|06EB33| JSR GetXDisplacement
|06EB36| STY.b $00

|06EB38| JSR GetYDisplacement
|06EB3B| STY.b $01

|06EB3D| LDA.b $0E
|06EB3F| BPL .positive_y

|06EB41| EOR.b #$FF
|06EB43| INC A

.positive_y
|06EB44| STA.w $0FB5

|06EB47| LDA.b $0F
|06EB49| BPL .positive_x

|06EB4B| EOR.b #$FF
|06EB4D| INC A

.positive_x
|06EB4E| CMP.w $0FB5
|06EB51| BCC .use_y_axis

.use_x_axis
|06EB53| LDY.b $00

|06EB55| PLB

|06EB56| RTL

;---------------------------------------------------------------------------------------------------

.use_y_axis
|06EB57| LDA.b $01
|06EB59| INC A
|06EB5A| INC A
|06EB5B| TAY

|06EB5C| PLB

|06EB5D| RTL

;===================================================================================================

ParrySwordAttacks:
|06EB5E| PHB
|06EB5F| PHK
|06EB60| PLB

|06EB61| JSR .main

|06EB64| PLB

|06EB65| RTL

;---------------------------------------------------------------------------------------------------

.recoil_timer_guard
|06EB66| db 15, 15, 24, 15
|06EB6A| db 15, 19, 15, 15

.recoil_timer_link
|06EB6E| db  6,  6,  6, 12
|06EB72| db  6,  6,  6, 15

;---------------------------------------------------------------------------------------------------

.main
|06EB76| LDA.b $EE
|06EB78| CMP.w $0F20,X
|06EB7B| BNE .different_layer

|06EB7D| LDA.b $46
|06EB7F| ORA.b $4D

.different_layer
|06EB81| BNE .exit

|06EB83| LDA.w $0EF0,X
|06EB86| BMI .exit

;---------------------------------------------------------------------------------------------------

|06EB88| JSR DoSpriteHitboxesFast

|06EB8B| LDA.w $037A
|06EB8E| AND.b #$10
|06EB90| BNE .fail_now

|06EB92| LDA.b $44
|06EB94| CMP.b #$80
|06EB96| BEQ .fail_now

|06EB98| JSR SetupActionHitbox

|06EB9B| LDA.b $3C
|06EB9D| BMI .continue

|06EB9F| JSR CheckIfHitboxesOverlap
|06EBA2| BCC .continue

|06EBA4| LDA.w $0E20,X
|06EBA7| CMP.b #$6A ; SPRITE 6A
|06EBA9| BEQ .is_bnc

|06EBAB| JSL GetRandomNumber
|06EBAF| AND.b #$07
|06EBB1| TAY

|06EBB2| LDA.w .recoil_timer_guard,Y
|06EBB5| STA.w $0EA0,X

;---------------------------------------------------------------------------------------------------

.is_bnc
|06EBB8| JSL GetRandomNumber
|06EBBC| AND.b #$07
|06EBBE| TAY

|06EBBF| LDA.w .recoil_timer_link,Y
|06EBC2| STA.b $46

|06EBC4| LDA.b #$18

|06EBC6| LDY.b $3C
|06EBC8| CPY.b #$09
|06EBCA| BPL .not_a_poke_a

|06EBCC| LDA.b #$20

.not_a_poke_a
|06EBCE| JSR ProjectSpriteSpeedTowardsLink

|06EBD1| LDA.b $00
|06EBD3| EOR.b #$FF
|06EBD5| INC A
|06EBD6| STA.w $0F30,X

|06EBD9| LDA.b $01
|06EBDB| EOR.b #$FF
|06EBDD| INC A
|06EBDE| STA.w $0F40,X

|06EBE1| LDA.b #$10

|06EBE3| LDY.b $3C
|06EBE5| CPY.b #$09
|06EBE7| BPL .not_a_poke_b

|06EBE9| LDA.b #$08

.not_a_poke_b
|06EBEB| JSR ApplyRecoilToLink
|06EBEE| JSR PlaceWeaponTinkAtLink

|06EBF1| LDA.b #$90
|06EBF3| STA.b $47

.exit
|06EBF5| RTS

;===================================================================================================

.continue
|06EBF6| JSR SetupSpriteHitbox
|06EBF9| JSR CheckIfHitboxesOverlap
|06EBFC| BCS TestSwordDamage

.fail_now
|06EBFE| JML AttemptDamageToLinkWithCollisionCheck

;===================================================================================================

TestSwordDamage:
|06EC02| LDA.w $0E20,X

|06EC05| CMP.b #$7A ; SPRITE 7A
|06EC07| BEQ .get_zapped

|06EC09| CMP.b #$0D ; SPRITE 0D
|06EC0B| BNE .not_buzzblob

|06EC0D| LDA.l $7EF359
|06EC11| CMP.b #$04
|06EC13| BCC .get_zapped

.not_buzzblob
|06EC15| CMP.b #$24 ; SPRITE 24
|06EC17| BEQ .blue_baritone_saxamaphone

|06EC19| CMP.b #$23 ; SPRITE 23
|06EC1B| BNE .no_zap_damage

.blue_baritone_saxamaphone
|06EC1D| LDA.w $0DF0,X
|06EC20| BEQ .no_zap_damage

;---------------------------------------------------------------------------------------------------

.get_zapped
|06EC22| LDA.w $0DD0,X
|06EC25| CMP.b #$09
|06EC27| BNE .no_zap_damage

|06EC29| LDA.w $031F
|06EC2C| BNE .exit

|06EC2E| LDA.b #$40
|06EC30| STA.w $0E00,X

|06EC33| STA.w $0360

|06EC36| JSR AttemptDamageToLinkPlusRecoil

.exit
|06EC39| RTS

;---------------------------------------------------------------------------------------------------

.no_zap_damage
|06EC3A| LDA.b #$50

|06EC3C| LDY.b $3C
|06EC3E| CPY.b #$09
|06EC40| BMI .not_charged

|06EC42| LDA.b #$40

.not_charged
|06EC44| JSR ProjectSpriteSpeedTowardsLink

|06EC47| LDA.b $00
|06EC49| EOR.b #$FF
|06EC4B| INC A
|06EC4C| STA.w $0F30,X

|06EC4F| LDA.b $01
|06EC51| EOR.b #$FF
|06EC53| INC A
|06EC54| STA.w $0F40,X

|06EC57| JSL CheckSwordDamageToSprite

|06EC5B| RTS

;===================================================================================================

CheckMedallionDamageToSprite:
|06EC5C| LDA.w $0C4A,X
|06EC5F| STA.w $0FB5

|06EC62| LDX.b #$0F

.next
|06EC64| LDA.w $0DD0,X
|06EC67| CMP.b #$09
|06EC69| BCC .skip

|06EC6B| LDA.w $0BA0,X
|06EC6E| ORA.w $0F00,X
|06EC71| BNE .skip

|06EC73| LDA.w $0FB5
|06EC76| JSL CheckAncillaDamageToSprite_aggressive

.skip
|06EC7A| DEX
|06EC7B| BPL .next

|06EC7D| RTL

;===================================================================================================

AncillaDamageClasses:
|06EC7E| db $06 ; NOTHING
|06EC7F| db $01 ; SOMARIA BULLET
|06EC80| db $0B ; FIRE ROD SHOT
|06EC81| db $00 ; UNUSED
|06EC82| db $00 ; BEAM HIT
|06EC83| db $00 ; BOOMERANG
|06EC84| db $00 ; WALL HIT
|06EC85| db $08 ; BOMB
|06EC86| db $00 ; DOOR DEBRIS
|06EC87| db $06 ; ARROW
|06EC88| db $00 ; LODGED ARROW
|06EC89| db $0C ; ICE ROD SHOT
|06EC8A| db $01 ; SWORD BEAM
|06EC8B| db $00 ; SPIN ATTACK FULL CHARGE SPARK
|06EC8C| db $00 ; BLAST WALL EXPLOSION
|06EC8D| db $00 ; BLAST WALL EXPLOSION
|06EC8E| db $00 ; BLAST WALL EXPLOSION
|06EC8F| db $01 ; ICE ROD WALL HIT
|06EC90| db $00 ; BLAST WALL EXPLOSION
|06EC91| db $00 ; ICE ROD SPARKLE
|06EC92| db $00 ; BAD POINTER
|06EC93| db $00 ; SPLASH
|06EC94| db $00 ; HIT STARS
|06EC95| db $00 ; SHOVEL DIRT
|06EC96| db $0E ; ETHER SPELL
|06EC97| db $0D ; BOMBOS SPELL
|06EC98| db $00 ; POWDER DUST
|06EC99| db $00 ; SWORD WALL HIT
|06EC9A| db $0F ; QUAKE SPELL
|06EC9B| db $00 ; SCREEN SHAKE
|06EC9C| db $00 ; DASH DUST
|06EC9D| db $07 ; HOOKSHOT
|06EC9E| db $01 ; BLANKET
|06EC9F| db $01 ; SNORE
|06ECA0| db $01 ; ITEM GET
|06ECA1| db $01 ; LINK POOF
|06ECA2| db $01 ; GRAVESTONE
|06ECA3| db $01 ; BAD POINTER
|06ECA4| db $01 ; SWORD SWING SPARKLE
|06ECA5| db $01 ; DUCK
|06ECA6| db $01 ; WISH POND ITEM
|06ECA7| db $01 ; MILESTONE ITEM GET
|06ECA8| db $01 ; SPIN ATTACK SPARKLE A
|06ECA9| db $01 ; SPIN ATTACK SPARKLE B
|06ECAA| db $01 ; SOMARIA BLOCK
|06ECAB| db $01 ; SOMARIA BLOCK FIZZ
|06ECAC| db $01 ; SOMARIA BLOCK FISSION
|06ECAD| db $0B ; LAMP FLAME
|06ECAE| db $00 ; BYRNA WINDUP SPARK
|06ECAF| db $01 ; BYRNA SPARK
|06ECB0| db $01 ; BLAST WALL FIREBALL
|06ECB1| db $01 ; BLAST WALL EXPLOSION
|06ECB2| db $01 ; SKULL WOODS FIRE
|06ECB3| db $01 ; MASTER SWORD GET
|06ECB4| db $01 ; FLUTE
|06ECB5| db $01 ; WEATHERVANE EXPLOSION
|06ECB6| db $01 ; CUTSCENE DUCK

;===================================================================================================

CheckAncillaDamageToSprite:
|06ECB7| LDY.w $0EF0,X
|06ECBA| BPL CheckAncillaDamageToSprite_aggressive

|06ECBC| RTL

;===================================================================================================

CheckAncillaDamageToSprite_aggressive:
|06ECBD| PHX

|06ECBE| TAX
|06ECBF| LDA.l AncillaDamageClasses,X

|06ECC3| PLX

|06ECC4| CMP.b #$06
|06ECC6| BNE CheckAncillaDamageToSprite_preset

|06ECC8| PHA

|06ECC9| LDA.l $7EF340
|06ECCD| CMP.b #$03

|06ECCF| PLA
|06ECD0| BCC CheckAncillaDamageToSprite_preset

|06ECD2| LDA.w $0E20,X
|06ECD5| CMP.b #$D7 ; SPRITE D7
|06ECD7| BNE .not_ganon

|06ECD9| LDA.b #$20
|06ECDB| STA.w $0F10,X

.not_ganon
|06ECDE| LDA.b #$09

;===================================================================================================

#CheckAncillaDamageToSprite_preset:
|06ECE0| CMP.b #$0F
|06ECE2| BNE .not_quake_against_airborne

|06ECE4| LDY.w $0F70,X
|06ECE7| BEQ .not_quake_against_airborne

|06ECE9| RTL

;---------------------------------------------------------------------------------------------------

.not_quake_against_airborne
|06ECEA| CMP.b #$00
|06ECEC| BEQ .not_airborne

|06ECEE| CMP.b #$07
|06ECF0| BNE .apply

;---------------------------------------------------------------------------------------------------

.not_airborne
|06ECF2| JSL .apply

|06ECF6| LDA.w $0CE2,X
|06ECF9| BNE .exit

|06ECFB| LDA.w $0FAC
|06ECFE| BNE .exit

|06ED00| LDA.b #$05
|06ED02| STA.w $0FAC

|06ED05| LDY.w $0FB6

|06ED08| LDA.w $0C04,Y
|06ED0B| ADC.b #$04
|06ED0D| STA.w $0FAD

|06ED10| LDA.w $0BFA,Y
|06ED13| STA.w $0FAE

|06ED16| LDA.b $EE
|06ED18| STA.w $0B68

|06ED1B| STZ.w $012E

|06ED1E| LDA.b #$05 ; SFX2.05
|06ED20| JSL QueueSpriteSFX2WithPan

.exit
|06ED24| RTL

;---------------------------------------------------------------------------------------------------

.apply
|06ED25| STA.w $0CF2

|06ED28| TAY

|06ED29| LDA.b #$20

|06ED2B| CPY.b #$08
|06ED2D| BNE .not_bomb_damage

|06ED2F| LDA.b #$35

.not_bomb_damage
|06ED31| BRA ApplyDamageToSprite

;===================================================================================================

pool CheckSwordDamageToSprite

.damage_class
|06ED33| db $01, $02, $03, $04 ; slash/dash
|06ED37| db $02, $03, $04, $05 ; spin
|06ED3B| db $01, $01, $02, $03 ; poke

endpool

;---------------------------------------------------------------------------------------------------

CheckSwordDamageToSprite:
|06ED3F| LDA.w $0E60,X
|06ED42| AND.b #$40
|06ED44| BEQ .vulnerable_to_sword

|06ED46| RTL

;---------------------------------------------------------------------------------------------------

.vulnerable_to_sword
|06ED47| LDA.w $0372
|06ED4A| STA.l $7FFA4C,X

|06ED4E| PHX

|06ED4F| LDA.l $7EF359
|06ED53| DEC A

|06ED54| LDX.w $0372
|06ED57| BNE .set_damage_class

|06ED59| BRA .check_if_spinning

.spinning
|06ED5B| ORA.b #$04
|06ED5D| BRA .set_damage_class

.check_if_spinning
|06ED5F| LDX.b $3C
|06ED61| BMI .spinning

|06ED63| CPX.b #$09
|06ED65| BMI .set_damage_class

|06ED67| ORA.b #$08

.set_damage_class
|06ED69| TAX

|06ED6A| LDA.l .damage_class,X
|06ED6E| STA.w $0CF2

|06ED71| LDA.w $0301
|06ED74| AND.b #$0A
|06ED76| BEQ .not_hammer

|06ED78| LDA.b #$03
|06ED7A| STA.w $0CF2

.not_hammer
|06ED7D| LDA.b #$04
|06ED7F| STA.w $02E3

|06ED82| PLX

|06ED83| LDA.b #$10
|06ED85| STA.b $47

|06ED87| LDA.b #$9D

;===================================================================================================

ApplyDamageToSprite:
|06ED89| STA.b $00

|06ED8B| STZ.w $0CF3

|06ED8E| LDA.w $0E60,X
|06ED91| AND.b #$40
|06ED93| BNE .exit_a

|06ED95| LDA.b #$00
|06ED97| XBA

|06ED98| LDA.w $0E20,X
|06ED9B| CMP.b #$D8 ; SPRITE D8
|06ED9D| BCC .not_absorbable

.exit_a
|06ED9F| RTL

;---------------------------------------------------------------------------------------------------

.not_absorbable
|06EDA0| REP #$20

|06EDA2| ASL A
|06EDA3| ASL A
|06EDA4| ASL A
|06EDA5| ASL A

|06EDA6| ORA.w $0CF2

|06EDA9| PHX

|06EDAA| REP #$10

|06EDAC| TAX

|06EDAD| SEP #$20

|06EDAF| LDA.l $7F6000,X
|06EDB3| STA.b $02

|06EDB5| SEP #$10

|06EDB7| LDA.w $0CF2
|06EDBA| ASL A
|06EDBB| ASL A
|06EDBC| ASL A
|06EDBD| ORA.b $02
|06EDBF| TAX

|06EDC0| LDA.l DamageSubclassValue,X

|06EDC4| PLX

;===================================================================================================

#DamageAgahnimWithBalls:
|06EDC5| CMP.b #$F9
|06EDC7| BNE .dont_fairyize

|06EDC9| LDA.b #$E3 ; SPRITE E3

;---------------------------------------------------------------------------------------------------

.transmute_to_sprite
|06EDCB| STA.w $0E20,X

|06EDCE| JSL LoadSpriteProperties
|06EDD2| JSL SpawnPoofGarnish

|06EDD6| STZ.w $012F

|06EDD9| LDA.b #$32 ; SFX3.32
|06EDDB| JSL QueueSpriteSFX3WithPan

|06EDDF| JMP.w .clear_queued_damage

;---------------------------------------------------------------------------------------------------

.dont_fairyize
|06EDE2| CMP.b #$FA
|06EDE4| BNE .dont_blobbify

|06EDE6| LDA.b #$8F ; SPRITE 8F
|06EDE8| JSL .transmute_to_sprite

|06EDEC| LDA.b #$02
|06EDEE| STA.w $0D80,X

|06EDF1| LDA.b #$20
|06EDF3| STA.w $0F80,X

|06EDF6| LDA.b #$08
|06EDF8| STA.w $0F50,X

|06EDFB| STZ.w $0EA0,X
|06EDFE| STZ.w $0EF0,X
|06EE01| STZ.w $0E50,X

|06EE04| LDA.b #$01
|06EE06| STA.w $0CD2,X

|06EE09| STA.w $0BE0,X

|06EE0C| RTL

;---------------------------------------------------------------------------------------------------

.dont_blobbify
|06EE0D| CMP.w $0CE2,X
|06EE10| BCC .new_damage_less

|06EE12| STA.w $0CE2,X

.new_damage_less
|06EE15| CMP.b #$00
|06EE17| BNE .non_zero_damage

|06EE19| LDA.w $0CF2
|06EE1C| CMP.b #$0A
|06EE1E| BEQ .powder_damage

|06EE20| LDA.w $0B6B,X
|06EE23| AND.b #$04
|06EE25| BNE .early_phase_helma

|06EE27| STZ.w $02E3

.powder_damage
|06EE2A| JMP.w .clear_queued_damage

.non_zero_damage
|06EE2D| CMP.b #$FE
|06EE2F| BCC .sub_frozen

|06EE31| LDA.w $0DD0,X
|06EE34| CMP.b #$0B
|06EE36| BEQ .powder_damage

.sub_frozen
|06EE38| LDA.w $0E20,X
|06EE3B| CMP.b #$9A ; SPRITE 9A
|06EE3D| BNE .dont_reset_kyameron

|06EE3F| LDY.w $0CE2,X
|06EE42| CPY.b #$F0
|06EE44| BCS .dont_reset_kyameron

|06EE46| LDA.b #$09
|06EE48| STA.w $0DD0,X

|06EE4B| LDA.b #$04
|06EE4D| STA.w $0D80,X

|06EE50| LDA.b #$0F
|06EE52| STA.w $0DF0,X

|06EE55| LDA.b #$28 ; SFX2.28
|06EE57| JSL QueueSpriteSFX2WithPan

|06EE5B| RTL

;---------------------------------------------------------------------------------------------------

.dont_reset_kyameron
|06EE5C| CMP.b #$1B ; SPRITE 1B
|06EE5E| BNE .not_arrow

;===================================================================================================

#SpriteArrow_Break:
|06EE60| LDA.b #$05 ; SFX2.05
|06EE62| JSL QueueSpriteSFX2WithPan

|06EE66| JSR ScheduleForBreakage
|06EE69| JSL PlaceWeaponTinkAtSprite

|06EE6D| RTL

;===================================================================================================

.not_arrow
|06EE6E| PHA

|06EE6F| LDA.b $00
|06EE71| STA.w $0EF0,X

|06EE74| PLA
|06EE75| CMP.b #$92 ; SPRITE 92
|06EE77| BNE .not_king_helma

|06EE79| LDA.w $0DB0,X
|06EE7C| CMP.b #$03
|06EE7E| BCC .early_phase_helma

;---------------------------------------------------------------------------------------------------

.not_king_helma
|06EE80| LDY.b #$21 ; SFX3.21

|06EE82| LDA.w $0B6B,X
|06EE85| AND.b #$02
|06EE87| BNE .set_damage_sfx

|06EE89| LDY.b #$08 ; SFX3.08

|06EE8B| LDA.w $0BE0,X
|06EE8E| AND.b #$10
|06EE90| BEQ .set_damage_sfx

|06EE92| LDY.b #$1C ; SFX3.1C

.set_damage_sfx
|06EE94| STY.b $01

|06EE96| JSL CalculateSpriteSFXPan
|06EE9A| ORA.b $01
|06EE9C| STA.w $012F

;---------------------------------------------------------------------------------------------------

.early_phase_helma
|06EE9F| LDA.b #$00

|06EEA1| LDY.w $0CF2
|06EEA4| CPY.b #$0D
|06EEA6| BCS .set_iframe_timer

|06EEA8| LDY.w $0E20,X

|06EEAB| LDA.b #$14

|06EEAD| CPY.b #$09 ; SPRITE 09
|06EEAF| BEQ .set_iframe_timer

|06EEB1| LDA.b #$0F
|06EEB3| CPY.b #$53 ; SPRITE 53
|06EEB5| BEQ .eleven_frames_of_armos

|06EEB7| CPY.b #$18 ; SPRITE 18
|06EEB9| BNE .set_iframe_timer

.eleven_frames_of_armos
|06EEBB| LDA.b #$0B

.set_iframe_timer
|06EEBD| STA.w $0EA0,X

|06EEC0| RTL

;---------------------------------------------------------------------------------------------------

.clear_queued_damage
|06EEC1| STZ.w $0EF0,X
|06EEC4| STZ.w $0CE2,X

|06EEC7| RTL

;===================================================================================================

HandleSpriteDamageApplication:
|06EEC8| LDA.w $0DD0,X
|06EECB| CMP.b #$09
|06EECD| BCC .exit_b

|06EECF| STA.w $0FB5

|06EED2| LDA.w $0CE2,X
|06EED5| CMP.b #$FD
|06EED7| BNE .not_burning

|06EED9| STZ.w $0CE2,X

|06EEDC| LDA.b #$09 ; SFX3.09
|06EEDE| JSL QueueSpriteSFX3WithPan

|06EEE2| LDA.b #$07
|06EEE4| STA.w $0DD0,X

|06EEE7| LDA.b #$70
|06EEE9| STA.w $0DF0,X

|06EEEC| LDA.w $0E40,X
|06EEEF| INC A
|06EEF0| INC A
|06EEF1| STA.w $0E40,X

|06EEF4| STZ.w $0CE2,X

.exit_b
|06EEF7| RTS

;---------------------------------------------------------------------------------------------------

.not_burning
|06EEF8| CMP.b #$FB
|06EEFA| BCC .transmutation

|06EEFC| STZ.w $0CE2,X

|06EEFF| STA.b $00

|06EF01| LDY.w $0DD0,X
|06EF04| CPY.b #$0B
|06EF06| BEQ .exit_b

|06EF08| LDY.b #$00

|06EF0A| CMP.b #$FE
|06EF0C| BNE .not_freeze

|06EF0E| INY

.not_freeze
|06EF0F| TYA
|06EF10| STA.l $7FFA3C,X
|06EF14| BEQ .sprite_not_frozen

|06EF16| LDA.w $0CAA,X
|06EF19| ORA.b #$08
|06EF1B| STA.w $0CAA,X

|06EF1E| ASL.w $0BE0,X
|06EF21| LSR.w $0BE0,X

|06EF24| LDA.b #$0F ; SFX2.0F
|06EF26| JSL QueueSpriteSFX2WithPan

|06EF2A| LDA.b #$18
|06EF2C| STA.w $0F80,X

|06EF2F| ASL.w $0CD2,X
|06EF32| LSR.w $0CD2,X

|06EF35| JSR ZeroVelocityXY_bank06

;---------------------------------------------------------------------------------------------------

.sprite_not_frozen
|06EF38| LDA.b #$0B
|06EF3A| STA.w $0DD0,X

|06EF3D| LDA.b #$40
|06EF3F| STA.w $0DF0,X

|06EF42| LDA.b $00
|06EF44| CLC
|06EF45| ADC.b #$05
|06EF47| TAY

|06EF48| LDA.w .stun_timers,Y
|06EF4B| STA.w $0B58,X

|06EF4E| LDA.w $0E20,X
|06EF51| CMP.b #$23 ; SPRITE 23
|06EF53| BNE .not_a_red_bari

|06EF55| INC A
|06EF56| STA.w $0E20,X

.not_a_red_bari
|06EF59| JMP.w .exit_c

;---------------------------------------------------------------------------------------------------

.stun_timers
|06EF5C| db  32 ; 0xFB
|06EF5D| db 128 ; 0xFC
|06EF5E| db   0 ; 0xFD
|06EF5F| db   0 ; 0xFE
|06EF60| db 255 ; 0xFF

;---------------------------------------------------------------------------------------------------

.transmutation
|06EF61| LDA.w $0E50,X
|06EF64| STA.b $00

|06EF66| SEC
|06EF67| SBC.w $0CE2,X
|06EF6A| STA.w $0E50,X

|06EF6D| STZ.w $0CE2,X

|06EF70| BEQ .zero_hp_now
|06EF72| BCS .exit_c

.zero_hp_now
|06EF74| LDA.w $0CBA,X
|06EF77| BNE .no_forced_drop

|06EF79| LDA.w $0DD0,X
|06EF7C| CMP.b #$0B
|06EF7E| BNE .not_currently_stunned

|06EF80| LDA.b #$03
|06EF82| STA.w $0CBA,X

;---------------------------------------------------------------------------------------------------

.not_currently_stunned
|06EF85| LDA.l $7FFA4C,X
|06EF89| BEQ .no_forced_drop

|06EF8B| LDA.b #$00
|06EF8D| STA.l $7FFA4C,X

|06EF91| STZ.w $0BE0,X

.no_forced_drop
|06EF94| LDY.w $0E20,X
|06EF97| CPY.b #$1B ; SPRITE 1B
|06EF99| BEQ .no_arrow_sfx

|06EF9B| LDA.b #$09 ; SFX3.09
|06EF9D| JSL QueueSpriteSFX3WithPan

.no_arrow_sfx
|06EFA1| CPY.b #$40 ; SPRITE 40
|06EFA3| BNE .not_aga_barrier

|06EFA5| PHX

|06EFA6| LDX.b $8A

|06EFA8| LDA.l $7EF280,X
|06EFAC| ORA.b #$40
|06EFAE| STA.l $7EF280,X

|06EFB2| PLX

;---------------------------------------------------------------------------------------------------

.not_aga_barrier
|06EFB3| TYA
|06EFB4| CMP.b #$EC ; SPRITE EC
|06EFB6| BNE .not_a_thrown_item

|06EFB8| LDY.w $0DB0,X
|06EFBB| CPY.b #$02
|06EFBD| BNE .exit_c

|06EFBF| JMP.w TransmuteThrowableToDebris

.not_a_thrown_item
|06EFC2| PHA

|06EFC3| LDA.w $0DD0,X
|06EFC6| CMP.b #$0A
|06EFC8| BNE .not_being_carried

|06EFCA| STZ.w $0308
|06EFCD| STZ.w $0309

.not_being_carried
|06EFD0| LDA.b #$06
|06EFD2| STA.w $0DD0,X

|06EFD5| PLA
|06EFD6| CMP.b #$0C ; SPRITE 0C
|06EFD8| BNE AttemptKillingOfKin

;===================================================================================================

#PrepareSpriteToDie:
|06EFDA| LDA.b #$06
|06EFDC| STA.w $0DD0,X

|06EFDF| LDA.b #$1F
|06EFE1| STA.w $0DF0,X

|06EFE4| JSR SetOAMAllotmentTo4

;---------------------------------------------------------------------------------------------------

.exit_c
|06EFE7| RTS

;===================================================================================================

AttemptKillingOfKin:
|06EFE8| CMP.b #$92 ; SPRITE 92
|06EFEA| BNE .not_helmasaur_king

|06EFEC| JSL KillFellowSprites

|06EFF0| LDA.b #$FF
|06EFF2| STA.w $0DF0,X

|06EFF5| JMP.w RoarAndDisableMenu

;---------------------------------------------------------------------------------------------------

.not_helmasaur_king
|06EFF8| CMP.b #$CB ; SPRITE CB
|06EFFA| BNE .not_trinexx_rock

|06EFFC| JMP.w TrinexxRock_ScreamAndDie

.not_trinexx_rock
|06EFFF| CMP.b #$CC ; SPRITE CC
|06F001| BEQ .is_trinexx_fire

|06F003| CMP.b #$CD ; SPRITE CD
|06F005| BNE .not_trinexx_ice

.is_trinexx_fire
|06F007| JMP.w Sidenexx_ScreamAndDie

;---------------------------------------------------------------------------------------------------

.not_trinexx_ice
|06F00A| CMP.b #$53 ; SPRITE 53
|06F00C| BEQ ArmosKnight_ScreamAndDie

|06F00E| CMP.b #$54 ; SPRITE 54
|06F010| BEQ Lanmolas_ScreamAndDie

|06F012| CMP.b #$09 ; SPRITE 09
|06F014| BEQ Moldorm_ScreamAndDie

|06F016| CMP.b #$7A ; SPRITE 7A
|06F018| BNE .not_agahnim

|06F01A| JMP.w Agahnim_ScreamAndDie

;---------------------------------------------------------------------------------------------------

.not_agahnim
|06F01D| CMP.b #$23 ; SPRITE 23
|06F01F| BEQ RedBariDeathSplit

|06F021| CMP.b #$0F ; SPRITE 0F
|06F023| BNE AttemptKillingOfKin.not_octoballoon

;===================================================================================================

#OctoballoonEXPLOSIONTIME:
|06F025| STZ.w $0EF0,X

|06F028| LDA.b #$0F
|06F02A| STA.w $0DF0,X

|06F02D| RTS

;---------------------------------------------------------------------------------------------------

.not_octoballoon
|06F02E| LDA.w $0B6B,X
|06F031| AND.b #$02
|06F033| BNE .am_explode

|06F035| LDA.w $0EF0,X
|06F038| ASL A

|06F039| LDA.b #$0F
|06F03B| BCC .delay

|06F03D| LDA.b #$1F

.delay
|06F03F| STA.w $0DF0,X

|06F042| JMP.w StandardTimeToDie

;===================================================================================================

#UNREACHABLE_06F045:
|06F045| RTS

;===================================================================================================

#Moldorm_ScreamAndDie:
|06F046| LDA.b #$03
|06F048| STA.w $0D80,X

|06F04B| LDA.b #$A0
|06F04D| STA.w $0F10,X

|06F050| LDA.b #$09
|06F052| STA.w $0DD0,X

|06F055| BRA RoarAndDisableMenu

;---------------------------------------------------------------------------------------------------

.am_explode
|06F057| LDA.w $0E20,X
|06F05A| CMP.b #$A2 ; SPRITE A2
|06F05C| BEQ .kholdstare

|06F05E| JSL KillFellowSprites

.kholdstare
|06F062| LDA.b #$04
|06F064| STA.w $0DD0,X

|06F067| STZ.w $0D90,X

|06F06A| LDA.b #$FF

;---------------------------------------------------------------------------------------------------

.set_death_timer
|06F06C| STA.w $0DF0,X
|06F06F| STA.w $0EF0,X

|06F072| BRA RoarAndDisableMenu

;---------------------------------------------------------------------------------------------------

#Lanmolas_ScreamAndDie:
|06F074| LDA.b #$05
|06F076| STA.w $0D80,X

|06F079| LDA.b #$C0
|06F07B| BRA .set_death_timer

;===================================================================================================

ArmosKnight_ScreamAndDie:
|06F07D| LDA.b #$23
|06F07F| STA.w $0DF0,X

|06F082| STZ.w $0EF0,X

|06F085| BRA .queue_scream

;===================================================================================================

#RoarAndDisableMenu:
|06F087| INC.w $0FFC

.queue_scream
|06F08A| STZ.w $012F

|06F08D| LDA.b #$22 ; SFX3.22
|06F08F| JSL QueueSpriteSFX3WithPan

|06F093| RTS

;===================================================================================================

RedBariDeathSplit:
|06F094| LDA.w $0DB0,X
|06F097| BNE AttemptKillingOfKin.not_octoballoon

|06F099| LDA.b #$02
|06F09B| STA.w $0D80,X

|06F09E| LDA.b #$20
|06F0A0| STA.w $0DF0,X

|06F0A3| LDA.b #$09
|06F0A5| STA.w $0DD0,X

|06F0A8| STZ.w $0EF0,X

|06F0AB| RTS

;===================================================================================================

Sidenexx_ScreamAndDie:
|06F0AC| LDA.b #$80
|06F0AE| STA.w $0D80,X

|06F0B1| LDA.b #$60
|06F0B3| STA.w $0DF0,X

|06F0B6| LDA.b #$09
|06F0B8| STA.w $0DD0,X

|06F0BB| BRA RoarAndDisableMenu

;===================================================================================================

TrinexxRock_ScreamAndDie:
|06F0BD| LDA.b #$80
|06F0BF| STA.w $0D80,X

|06F0C2| LDA.b #$80
|06F0C4| STA.w $0DF0,X

|06F0C7| LDA.b #$09
|06F0C9| STA.w $0DD0,X

|06F0CC| BRA RoarAndDisableMenu

;===================================================================================================

Agahnim_ScreamAndDie:
|06F0CE| JSL KillFellowSprites

|06F0D2| LDA.b #$09
|06F0D4| STA.w $0DD0,X
|06F0D7| STA.w $0BA0,X

|06F0DA| LDA.w $0FFF
|06F0DD| BNE .aga_2

|06F0DF| LDA.b #$0A
|06F0E1| STA.w $0D80,X

|06F0E4| LDA.b #$FF
|06F0E6| STA.w $0DF0,X

|06F0E9| LDA.b #$20
|06F0EB| STA.w $0F80,X

|06F0EE| JMP.w RoarAndDisableMenu

;---------------------------------------------------------------------------------------------------

.aga_2
|06F0F1| LDA.b #$FF
|06F0F3| STA.w $0DF0,X

|06F0F6| LDA.b #$08
|06F0F8| STA.w $0D80,X

|06F0FB| INC A
|06F0FC| STA.w $0D81
|06F0FF| STA.w $0D82

|06F102| STZ.w $0DC1
|06F105| STZ.w $0DC2

|06F108| JMP.w RoarAndDisableMenu

;===================================================================================================

StandardTimeToDie:
|06F10B| LDA.w $0E40,X
|06F10E| CLC
|06F10F| ADC.b #$04
|06F111| STA.w $0E40,X

|06F114| LDA.w $0FB5
|06F117| CMP.b #$0B
|06F119| BNE .exit

|06F11B| LDA.b #$01
|06F11D| STA.w $0BE0,X

.exit
|06F120| RTS

;===================================================================================================

CheckDamageToLink_long:
|06F121| PHB
|06F122| PHK
|06F123| PLB

|06F124| JSR CheckDamageToLink

|06F127| PLB

|06F128| RTL

;---------------------------------------------------------------------------------------------------

CheckDamageToLink_same_layer_long:
|06F129| PHB
|06F12A| PHK
|06F12B| PLB

|06F12C| JSR CheckDamageToLink_same_layer

|06F12F| PLB

|06F130| RTL

;---------------------------------------------------------------------------------------------------

CheckDamageToLink_ignore_layer_long:
|06F131| PHB
|06F132| PHK
|06F133| PLB

|06F134| JSR CheckDamageToLink_ignore_layer

|06F137| PLB

|06F138| RTL

;---------------------------------------------------------------------------------------------------

SpriteToLinkDirections:
.opposing
|06F139| db $04, $06, $00, $02

.standing
|06F13D| db $06, $04, $00, $00

.opposing2
|06F141| db $04, $06, $00, $02

;===================================================================================================

CheckDamageToLink:
|06F145| LDA.w $037B
|06F148| BNE .no_damage

;===================================================================================================

#CheckDamageToLink_staggered:
|06F14A| TXA
|06F14B| EOR.b $1A
|06F14D| AND.b #$03

|06F14F| ORA.w $0EF0,X
|06F152| BNE .no_damage

;===================================================================================================

#CheckDamageToLink_same_layer:
|06F154| LDA.w $00EE
|06F157| CMP.w $0F20,X
|06F15A| BNE .no_damage2

#CheckDamageToLink_ignore_layer:
|06F15C| LDA.w $0F60,X
|06F15F| BEQ .use_fast_hitbox_0

|06F161| JSR SetupLinkHitbox
|06F164| JSR SetupSpriteHitbox
|06F167| JSR CheckIfHitboxesOverlap

|06F16A| BRA .collision_checked

.use_fast_hitbox_0
|06F16C| JSR SetupSpriteHitbox00

;---------------------------------------------------------------------------------------------------

.collision_checked
|06F16F| LDA.w $0E40,X
|06F172| BMI .exit_preserve_check
|06F174| BCC .no_damage2

|06F176| LDA.b $4D
|06F178| BNE .no_damage2

|06F17A| LDA.w $02E0
|06F17D| BNE .definitely_getting_hit

|06F17F| LDA.w $0308
|06F182| BMI .definitely_getting_hit

|06F184| LDA.w $0BE0,X
|06F187| AND.b #$20
|06F189| BEQ .definitely_getting_hit

|06F18B| LDA.l $7EF35A
|06F18F| BEQ .definitely_getting_hit

|06F191| STZ.w $0DD0,X

|06F194| LDA.b $2F

|06F196| LDY.b $3C
|06F198| BEQ .sword_in

|06F19A| LSR A
|06F19B| TAY

|06F19C| LDA.w SpriteToLinkDirections.standing,Y

.sword_in
|06F19F| LDY.w $0DE0,X

|06F1A2| CMP.w SpriteToLinkDirections.opposing2,Y
|06F1A5| BNE .definitely_getting_hit

|06F1A7| LDA.b #$06 ; SFX2.06
|06F1A9| JSL QueueSpriteSFX2WithPan

|06F1AD| JSL PlaceWeaponTinkAtSprite_forced

|06F1B1| LDA.w $0E20,X
|06F1B4| CMP.b #$95 ; SPRITE 95
|06F1B6| BNE .not_laser

|06F1B8| LDA.b #$26 ; SFX3.26
|06F1BA| JSL QueueSpriteSFX3WithPan

.no_damage
|06F1BE| CLC

.exit_preserve_check
|06F1BF| RTS

;---------------------------------------------------------------------------------------------------

.not_laser
|06F1C0| CMP.b #$9B ; SPRITE 9B
|06F1C2| BNE .not_wizzrobe_beam

|06F1C4| JSR InvertSpeedXY

|06F1C7| LDA.w $0DE0,X
|06F1CA| EOR.b #$01
|06F1CC| STA.w $0DE0,X

|06F1CF| INC.w $0D80,X

|06F1D2| LDA.b #$09
|06F1D4| STA.w $0DD0,X

.no_damage2
|06F1D7| CLC

|06F1D8| RTS

;---------------------------------------------------------------------------------------------------

.not_wizzrobe_beam
|06F1D9| CMP.b #$1B ; SPRITE 1B
|06F1DB| BEQ .is_arrow

|06F1DD| CMP.b #$0C ; SPRITE 0C
|06F1DF| BEQ .is_rock

|06F1E1| RTS

;---------------------------------------------------------------------------------------------------

.definitely_getting_hit
|06F1E2| JSR AttemptDamageToLinkPlusRecoil

|06F1E5| LDA.w $0E20,X
|06F1E8| CMP.b #$0C ; SPRITE 0C
|06F1EA| BNE .is_not_rock

.is_rock
|06F1EC| JSR PrepareSpriteToDie

.is_not_rock
|06F1EF| SEC

|06F1F0| RTS

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_06F1F1:
|06F1F1| CLC

|06F1F2| RTS

;---------------------------------------------------------------------------------------------------

.is_arrow
|06F1F3| JMP.w ScheduleForBreakage

;===================================================================================================

SetupSpriteHitbox00:
|06F1F6| LDA.w $0F70,X
|06F1F9| STA.b $0C
|06F1FB| STZ.b $0D

|06F1FD| REP #$20

|06F1FF| LDA.b $22
|06F201| SEC
|06F202| SBC.w $0FD8
|06F205| CLC
|06F206| ADC.w #$000B

|06F209| CMP.w #$0017
|06F20C| BCS .no_overlap

|06F20E| LDA.b $20
|06F210| SEC
|06F211| SBC.w $0FDA
|06F214| CLC
|06F215| ADC.b $0C
|06F217| CLC
|06F218| ADC.w #$0010

|06F21B| CMP.w #$0018
|06F21E| BCS .no_overlap

.overlap
|06F220| SEP #$20
|06F222| SEC

|06F223| RTS

.no_overlap
|06F224| SEP #$20
|06F226| CLC

|06F227| RTS

;===================================================================================================

Sprite_CheckIfLifted:
|06F228| LDA.b $11
|06F22A| ORA.b $3C
|06F22C| ORA.w $0FC1
|06F22F| BNE EXIT_06F2A9

|06F231| LDA.b $EE
|06F233| CMP.w $0F20,X
|06F236| BNE EXIT_06F2A9

;---------------------------------------------------------------------------------------------------

|06F238| LDY.b #$0F

.next_sprite
|06F23A| LDA.w $0DD0,Y
|06F23D| CMP.b #$0A
|06F23F| BEQ EXIT_06F2A9

|06F241| DEY
|06F242| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|06F244| LDA.w $0E20,X
|06F247| CMP.b #$0B ; SPRITE 0B
|06F249| BEQ Sprite_CheckIfLifted_permissive

|06F24B| CMP.b #$4A ; SPRITE 4A
|06F24D| BEQ Sprite_CheckIfLifted_permissive

|06F24F| LDA.w $0D50,X
|06F252| ORA.w $0D40,X
|06F255| BNE EXIT_06F2A9

;===================================================================================================

#Sprite_CheckIfLifted_permissive:
|06F257| LDA.w $0372
|06F25A| BNE EXIT_06F2A9

|06F25C| LDA.w $02F4
|06F25F| DEC A
|06F260| CMP.w $0FA0
|06F263| BEQ .get_lifted

|06F265| JSR SetupLinkHitbox_conditional
|06F268| JSR SetupSpriteHitbox
|06F26B| JSR CheckIfHitboxesOverlap

|06F26E| BCC EXIT_06F2A9

|06F270| TXA
|06F271| INC A
|06F272| STA.w $0314
|06F275| STA.w $0FB2

|06F278| RTS

;---------------------------------------------------------------------------------------------------

.get_lifted
|06F279| STZ.b $F6

|06F27B| STZ.w $0E90,X

|06F27E| LDA.b #$1D ; SFX2.1D
|06F280| JSL QueueSpriteSFX2WithPan

|06F284| LDA.w $0DD0,X
|06F287| STA.l $7FFA2C,X

|06F28B| LDA.b #$0A
|06F28D| STA.w $0DD0,X

|06F290| LDA.b #$10
|06F292| STA.w $0DF0,X

|06F295| LDA.b #$00 ; TILETYPE 00
|06F297| STA.l $7FFA1C,X
|06F29B| STA.l $7FF9C2,X

|06F29F| JSR GetDirectionTowardsLink

|06F2A2| LDA.w SpriteToLinkDirections.opposing,Y
|06F2A5| STA.b $2F

|06F2A7| PLA
|06F2A8| PLA

;---------------------------------------------------------------------------------------------------

#EXIT_06F2A9:
|06F2A9| RTS

;===================================================================================================

CheckDamageFromLink_long:
|06F2AA| PHB
|06F2AB| PHK
|06F2AC| PLB

|06F2AD| JSR CheckDamageFromLink

|06F2B0| TAY

|06F2B1| PLB

|06F2B2| TYA

|06F2B3| RTL

;===================================================================================================

CheckDamageFromLink:
|06F2B4| LDA.w $0EF0,X
|06F2B7| AND.b #$80
|06F2B9| BNE .dying

|06F2BB| LDA.b $EE
|06F2BD| CMP.w $0F20,X

.dying
|06F2C0| BNE .no_collision

|06F2C2| LDA.b $44
|06F2C4| CMP.b #$80
|06F2C6| BEQ .no_collision

|06F2C8| JSR SetupActionHitbox
|06F2CB| JSR SetupSpriteHitbox
|06F2CE| JSR CheckIfHitboxesOverlap
|06F2D1| BCC .no_collision

|06F2D3| STZ.w $0047

|06F2D6| LDA.w $037A
|06F2D9| AND.b #$10
|06F2DB| BNE EXIT_06F2A9

|06F2DD| LDA.w $0301
|06F2E0| AND.b #$0A
|06F2E2| BEQ .not_frozen_kill

|06F2E4| LDA.w $0E20,X
|06F2E7| CMP.b #$D6 ; SPRITE D6
|06F2E9| BCS .no_collision

|06F2EB| LDA.w $0DD0,X
|06F2EE| CMP.b #$0B
|06F2F0| BNE .not_frozen_kill

|06F2F2| LDA.l $7FFA3C,X
|06F2F6| BEQ .not_frozen_kill

|06F2F8| LDA.b #$02
|06F2FA| STA.w $0DD0,X

|06F2FD| LDA.b #$20
|06F2FF| STA.w $0DF0,X

|06F302| LDA.w $0E40,X
|06F305| AND.b #$E0
|06F307| ORA.b #$03
|06F309| STA.w $0E40,X

|06F30C| LDA.b #$1F ; SFX2.1F
|06F30E| JSL QueueSpriteSFX2WithPan

|06F312| SEC

|06F313| RTS

;---------------------------------------------------------------------------------------------------

.not_frozen_kill
|06F314| LDA.w $0E20,X
|06F317| CMP.b #$7B ; SPRITE 7B
|06F319| BNE .not_aga_ball

|06F31B| LDA.b $3C
|06F31D| CMP.b #$09
|06F31F| BMI .am_slashing

.no_collision
|06F321| JMP.w .fail_and_exit

.am_slashing
|06F324| JMP.w .check_sword_swing

;---------------------------------------------------------------------------------------------------

.mini_helma
|06F327| LDY.w $0DE0,X

|06F32A| LDA.b $2F
|06F32C| CMP.w SpriteToLinkDirections.opposing2,Y
|06F32F| BNE CheckDamageFromLink_with_recoil

.stalfos_head
|06F331| JSR CheckDamageFromLink_with_recoil

|06F334| STZ.w $0EF0,X

|06F337| JSR PlaceWeaponTinkAtLink

|06F33A| JMP.w SpriteDamage_ExitWith00

;===================================================================================================

#CheckDamageFromLink_with_recoil:
|06F33D| JSR TestSwordDamage

|06F340| LDA.b #$20
|06F342| JSR ApplyRecoilToLink

|06F345| LDA.b #$10
|06F347| STA.b $47
|06F349| STA.b $46

|06F34B| JMP.w SpriteDamage_ExitWith00

;---------------------------------------------------------------------------------------------------

.not_aga_ball
|06F34E| CMP.b #$09 ; SPRITE 09
|06F350| BNE .not_moldorm

|06F352| LDA.w $0D90,X
|06F355| BNE .check_sword_swing

|06F357| JSR RecoilLinkAndTHUMP

|06F35A| LDA.b #$32 ; SFX3.32
|06F35C| JSL CalculateSpriteSFXPan
|06F360| STA.w $012F

|06F363| JMP.w .place_tink

;---------------------------------------------------------------------------------------------------

.not_moldorm
|06F366| CMP.b #$92 ; SPRITE 92
|06F368| BNE .not_helma_king

|06F36A| JMP.w KingHelmasaur_ApplyRecoilIfEarlyPhase

;---------------------------------------------------------------------------------------------------

.not_helma_king
|06F36D| CMP.b #$26 ; SPRITE 26
|06F36F| BEQ CheckDamageFromLink_with_recoil

|06F371| CMP.b #$13 ; SPRITE 13
|06F373| BEQ .mini_helma

|06F375| CMP.b #$02 ; SPRITE 02
|06F377| BEQ .stalfos_head

|06F379| CMP.b #$CB ; SPRITE CB
|06F37B| BEQ CheckDamageFromLink_apply_normal_recoil

|06F37D| CMP.b #$CD ; SPRITE CD
|06F37F| BEQ CheckDamageFromLink_apply_normal_recoil

|06F381| CMP.b #$CC ; SPRITE CC
|06F383| BEQ CheckDamageFromLink_apply_normal_recoil

|06F385| CMP.b #$D6 ; SPRITE D6
|06F387| BEQ CheckDamageFromLink_apply_normal_recoil

|06F389| CMP.b #$D7 ; SPRITE D7
|06F38B| BEQ CheckDamageFromLink_apply_normal_recoil

|06F38D| CMP.b #$CE ; SPRITE CE
|06F38F| BEQ CheckDamageFromLink_apply_normal_recoil

|06F391| CMP.b #$54 ; SPRITE 54
|06F393| BNE .check_sword_swing

;===================================================================================================

#CheckDamageFromLink_apply_normal_recoil:
|06F395| LDA.b #$20
|06F397| JSR ApplyRecoilToLink

|06F39A| LDA.b #$90
|06F39C| STA.b $47

|06F39E| LDA.b #$10
|06F3A0| STA.b $46

;---------------------------------------------------------------------------------------------------

.check_sword_swing
|06F3A2| LDA.w $0CAA,X
|06F3A5| AND.b #$04
|06F3A7| BNE CheckDamageFromLink_attempt_small_recoil

|06F3A9| JSR TestSwordDamage

|06F3AC| SEC

|06F3AD| BRA SpriteDamage_ExitWith00

;---------------------------------------------------------------------------------------------------

.fail_and_exit
|06F3AF| CLC

|06F3B0| BRA SpriteDamage_ExitWith00

;===================================================================================================

#CheckDamageFromLink_attempt_small_recoil:
|06F3B2| LDA.b $47
|06F3B4| BNE .place_tink

|06F3B6| LDA.b #$04
|06F3B8| JSR ApplyRecoilToLink

|06F3BB| LDA.b #$10
|06F3BD| STA.b $46

|06F3BF| LDA.b #$10
|06F3C1| STA.b $47

.place_tink
|06F3C3| JSR PlaceWeaponTinkAtLink

|06F3C6| SEC

;===================================================================================================

SpriteDamage_ExitWith00:
|06F3C7| LDA.b #$00

|06F3C9| RTS

;===================================================================================================

AttemptDamageToLinkWithCollisionCheck:
|06F3CA| TXA
|06F3CB| EOR.b $1A
|06F3CD| LSR A
|06F3CE| BCS .no_damage

|06F3D0| JSR DoSpriteHitboxesFast

|06F3D3| JSR SetupLinkHitbox_conditional
|06F3D6| JSR CheckIfHitboxesOverlap

|06F3D9| BCC .no_damage

;===================================================================================================

#AttemptDamageToLinkPlusRecoil:
|06F3DB| LDA.w $031F
|06F3DE| ORA.w $037B
|06F3E1| BNE .no_damage

|06F3E3| LDA.b #$13
|06F3E5| STA.b $46

|06F3E7| LDA.b #$18
|06F3E9| JSR ApplyRecoilToLink

|06F3EC| LDA.b #$01
|06F3EE| STA.b $4D

|06F3F0| LDA.w $0CD2,X
|06F3F3| AND.b #$0F
|06F3F5| STA.b $00

|06F3F7| ASL A
|06F3F8| ADC.b $00
|06F3FA| CLC
|06F3FB| ADC.l $7EF35B
|06F3FF| TAY

|06F400| LDA.w BumpDamageGroups,Y
|06F403| STA.w $0373

|06F406| LDA.w $0E20,X
|06F409| CMP.b #$61 ; SPRITE 61
|06F40B| BNE .no_damage

|06F40D| LDA.w $0DB0,X
|06F410| BEQ .no_damage

|06F412| LDA.w $0D50,X
|06F415| ASL A
|06F416| STA.b $28

|06F418| LDA.w $0D40,X
|06F41B| ASL A
|06F41C| STA.b $27

.no_damage
|06F41E| RTS

;===================================================================================================

AttemptDamageToLinkPlusRecoil_long:
|06F41F| PHB
|06F420| PHK
|06F421| PLB

|06F422| JSR AttemptDamageToLinkPlusRecoil

|06F425| PLB

|06F426| RTL

;===================================================================================================

BumpDamageGroups:
|06F427| db $02, $01, $01 ; 0x00
|06F42A| db $04, $04, $04 ; 0x01
|06F42D| db $00, $00, $00 ; 0x02
|06F430| db $08, $04, $02 ; 0x03
|06F433| db $08, $08, $08 ; 0x04
|06F436| db $10, $08, $04 ; 0x05
|06F439| db $20, $10, $08 ; 0x06
|06F43C| db $20, $18, $10 ; 0x07
|06F43F| db $18, $10, $08 ; 0x08
|06F442| db $40, $30, $18 ; 0x09

;===================================================================================================

RecoilLinkAndTHUMP:
|06F445| LDA.b #$30
|06F447| JSR ApplyRecoilToLink

|06F44A| LDA.b #$90
|06F44C| STA.b $47

|06F44E| LDA.b #$10
|06F450| STA.b $46

|06F452| LDA.b #$21 ; SFX2.21
|06F454| JSL QueueSpriteSFX2WithPan

|06F458| LDA.b #$30
|06F45A| STA.w $0E00,X

|06F45D| JMP.w SpriteDamage_ExitWith00

;===================================================================================================

KingHelmasaur_ApplyRecoilIfEarlyPhase:
|06F460| LDA.w $0DB0,X
|06F463| CMP.b #$03
|06F465| BCS .do_recoil

|06F467| JMP.w CheckDamageFromLink_attempt_small_recoil

.do_recoil
|06F46A| JMP.w CheckDamageFromLink_apply_normal_recoil

;===================================================================================================

pool ActionHitbox

.offset_x
|06F46D| db   0 ; net/hammer

|06F46E| db   2 ; up
|06F46F| db   0 ; up
|06F470| db   0 ; up
|06F471| db  -8 ; up
|06F472| db   0 ; up
|06F473| db   2 ; up
|06F474| db   0 ; up
|06F475| db   2 ; up
|06F476| db   2 ; up
|06F477| db   1 ; up
|06F478| db   1 ; up
|06F479| db   0 ; up
|06F47A| db   0 ; up
|06F47B| db   0 ; up
|06F47C| db   0 ; up
|06F47D| db   0 ; up

|06F47E| db   2 ; down
|06F47F| db   4 ; down
|06F480| db   4 ; down
|06F481| db   0 ; down
|06F482| db   0 ; down
|06F483| db  -4 ; down
|06F484| db  -4 ; down
|06F485| db  -6 ; down
|06F486| db   2 ; down
|06F487| db   1 ; down
|06F488| db   1 ; down
|06F489| db   0 ; down
|06F48A| db   0 ; down
|06F48B| db   0 ; down
|06F48C| db   0 ; down
|06F48D| db   0 ; down

|06F48E| db   0 ; left
|06F48F| db   0 ; left
|06F490| db   0 ; left
|06F491| db   2 ; left
|06F492| db   2 ; left
|06F493| db   4 ; left
|06F494| db   4 ; left
|06F495| db   2 ; left
|06F496| db   2 ; left
|06F497| db   2 ; left
|06F498| db   2 ; left
|06F499| db   0 ; left
|06F49A| db   0 ; left
|06F49B| db   0 ; left
|06F49C| db   0 ; left
|06F49D| db   0 ; left

|06F49E| db   0 ; right
|06F49F| db   0 ; right
|06F4A0| db   0 ; right
|06F4A1| db  -4 ; right
|06F4A2| db  -4 ; right
|06F4A3| db -10 ; right
|06F4A4| db   0 ; right
|06F4A5| db   2 ; right
|06F4A6| db   2 ; right
|06F4A7| db   0 ; right
|06F4A8| db   0 ; right
|06F4A9| db   0 ; right
|06F4AA| db   0 ; right
|06F4AB| db   0 ; right
|06F4AC| db   0 ; right
|06F4AD| db   0 ; right

;---------------------------------------------------------------------------------------------------

.size_x
|06F4AE| db  15 ; net/hammer

|06F4AF| db   4 ; up
|06F4B0| db   8 ; up
|06F4B1| db   8 ; up
|06F4B2| db   8 ; up
|06F4B3| db   8 ; up
|06F4B4| db  12 ; up
|06F4B5| db   8 ; up
|06F4B6| db   4 ; up
|06F4B7| db   4 ; up
|06F4B8| db   6 ; up
|06F4B9| db   6 ; up
|06F4BA| db   0 ; up
|06F4BB| db   0 ; up
|06F4BC| db   0 ; up
|06F4BD| db   0 ; up
|06F4BE| db   0 ; up

|06F4BF| db   4 ; down
|06F4C0| db  16 ; down
|06F4C1| db  12 ; down
|06F4C2| db   8 ; down
|06F4C3| db   8 ; down
|06F4C4| db  12 ; down
|06F4C5| db  11 ; down
|06F4C6| db  12 ; down
|06F4C7| db   4 ; down
|06F4C8| db   6 ; down
|06F4C9| db   6 ; down
|06F4CA| db   0 ; down
|06F4CB| db   0 ; down
|06F4CC| db   0 ; down
|06F4CD| db   0 ; down
|06F4CE| db   0 ; down

|06F4CF| db   8 ; left
|06F4D0| db   8 ; left
|06F4D1| db   8 ; left
|06F4D2| db  10 ; left
|06F4D3| db  14 ; left
|06F4D4| db  15 ; left
|06F4D5| db   4 ; left
|06F4D6| db   4 ; left
|06F4D7| db   4 ; left
|06F4D8| db   6 ; left
|06F4D9| db   6 ; left
|06F4DA| db   0 ; left
|06F4DB| db   0 ; left
|06F4DC| db   0 ; left
|06F4DD| db   0 ; left
|06F4DE| db   0 ; left

|06F4DF| db   8 ; right
|06F4E0| db   8 ; right
|06F4E1| db   8 ; right
|06F4E2| db  10 ; right
|06F4E3| db  14 ; right
|06F4E4| db  15 ; right
|06F4E5| db   4 ; right
|06F4E6| db   4 ; right
|06F4E7| db   4 ; right
|06F4E8| db   6 ; right
|06F4E9| db   6 ; right
|06F4EA| db   0 ; right
|06F4EB| db   0 ; right
|06F4EC| db   0 ; right
|06F4ED| db   0 ; right
|06F4EE| db   0 ; right

;---------------------------------------------------------------------------------------------------

.offset_y
|06F4EF| db   0 ; net/hammer

|06F4F0| db   2 ; up
|06F4F1| db   0 ; up
|06F4F2| db   2 ; up
|06F4F3| db   4 ; up
|06F4F4| db   4 ; up
|06F4F5| db   4 ; up
|06F4F6| db   7 ; up
|06F4F7| db   2 ; up
|06F4F8| db   2 ; up
|06F4F9| db   1 ; up
|06F4FA| db   1 ; up
|06F4FB| db   0 ; up
|06F4FC| db   0 ; up
|06F4FD| db   0 ; up
|06F4FE| db   0 ; up
|06F4FF| db   0 ; up

|06F500| db   2 ; down
|06F501| db   0 ; down
|06F502| db   2 ; down
|06F503| db  -4 ; down
|06F504| db  -3 ; down
|06F505| db  -8 ; down
|06F506| db   0 ; down
|06F507| db   0 ; down
|06F508| db   2 ; down
|06F509| db   1 ; down
|06F50A| db   1 ; down
|06F50B| db   0 ; down
|06F50C| db   0 ; down
|06F50D| db   0 ; down
|06F50E| db   0 ; down
|06F50F| db   0 ; down

|06F510| db   0 ; left
|06F511| db   0 ; left
|06F512| db   0 ; left
|06F513| db  -2 ; left
|06F514| db   0 ; left
|06F515| db  -4 ; left
|06F516| db   1 ; left
|06F517| db   2 ; left
|06F518| db   2 ; left
|06F519| db   1 ; left
|06F51A| db   1 ; left
|06F51B| db   0 ; left
|06F51C| db   0 ; left
|06F51D| db   0 ; left
|06F51E| db   0 ; left
|06F51F| db   0 ; left

|06F520| db   0 ; right
|06F521| db   0 ; right
|06F522| db   0 ; right
|06F523| db  -2 ; right
|06F524| db   0 ; right
|06F525| db  -4 ; right
|06F526| db   1 ; right
|06F527| db   2 ; right
|06F528| db   2 ; right
|06F529| db   1 ; right
|06F52A| db   1 ; right
|06F52B| db   0 ; right
|06F52C| db   0 ; right
|06F52D| db   0 ; right
|06F52E| db   0 ; right
|06F52F| db   0 ; right

;---------------------------------------------------------------------------------------------------

.size_y
|06F530| db  15 ; net/hammer

|06F531| db   4 ; up
|06F532| db   8 ; up
|06F533| db   2 ; up
|06F534| db  12 ; up
|06F535| db   8 ; up
|06F536| db  12 ; up
|06F537| db   8 ; up
|06F538| db   4 ; up
|06F539| db   4 ; up
|06F53A| db   6 ; up
|06F53B| db   6 ; up
|06F53C| db   0 ; up
|06F53D| db   0 ; up
|06F53E| db   0 ; up
|06F53F| db   0 ; up
|06F540| db   0 ; up

|06F541| db   4 ; down
|06F542| db   8 ; down
|06F543| db   4 ; down
|06F544| db  12 ; down
|06F545| db  12 ; down
|06F546| db  12 ; down
|06F547| db   4 ; down
|06F548| db   8 ; down
|06F549| db   4 ; down
|06F54A| db   6 ; down
|06F54B| db   4 ; down
|06F54C| db   0 ; down
|06F54D| db   0 ; down
|06F54E| db   0 ; down
|06F54F| db   0 ; down
|06F550| db   0 ; down

|06F551| db   8 ; left
|06F552| db   8 ; left
|06F553| db   8 ; left
|06F554| db   8 ; left
|06F555| db   8 ; left
|06F556| db  12 ; left
|06F557| db   4 ; left
|06F558| db   4 ; left
|06F559| db   4 ; left
|06F55A| db   6 ; left
|06F55B| db   6 ; left
|06F55C| db   0 ; left
|06F55D| db   0 ; left
|06F55E| db   0 ; left
|06F55F| db   0 ; left
|06F560| db   0 ; left

|06F561| db   8 ; right
|06F562| db   8 ; right
|06F563| db   8 ; right
|06F564| db   8 ; right
|06F565| db   8 ; right
|06F566| db  12 ; right
|06F567| db   4 ; right
|06F568| db   4 ; right
|06F569| db   4 ; right
|06F56A| db   6 ; right
|06F56B| db   6 ; right
|06F56C| db   0 ; right
|06F56D| db   0 ; right
|06F56E| db   0 ; right
|06F56F| db   0 ; right
|06F570| db   0 ; right

;---------------------------------------------------------------------------------------------------

.sword_validity
|06F571| db $01
|06F572| db $01
|06F573| db $01
|06F574| db $00
|06F575| db $00
|06F576| db $00
|06F577| db $00
|06F578| db $01
|06F579| db $01
|06F57A| db $00
|06F57B| db $00
|06F57C| db $01
|06F57D| db $01

endpool

;===================================================================================================

SetupActionHitbox_long:
|06F57E| PHB
|06F57F| PHK
|06F580| PLB

|06F581| JSR SetupActionHitbox

|06F584| PLB

|06F585| RTL

;===================================================================================================

pool SetupActionHitbox_dashing

.offset_y_high ; bleeds into next
|06F586| db  -1,   0

.offset_x_low
|06F588| db   0,   0,  -8,   8

.offset_x_high
|06F58C| db   0,   0,  -1,   0

.offset_y_low
|06F590| db  -8,  16,   8,   8

endpool

;===================================================================================================

SetupActionHitbox_spinning:
|06F594| LDA.b $22
|06F596| SEC
|06F597| SBC.b #$0E
|06F599| STA.b $00

|06F59B| LDA.b $23
|06F59D| SBC.b #$00
|06F59F| STA.b $08

|06F5A1| LDA.b $20
|06F5A3| SEC
|06F5A4| SBC.b #$0A
|06F5A6| STA.b $01

|06F5A8| LDA.b $21
|06F5AA| SBC.b #$00
|06F5AC| STA.b $09

|06F5AE| LDA.b #$2C
|06F5B0| STA.b $02

|06F5B2| INC A
|06F5B3| STA.b $03

|06F5B5| PLX

|06F5B6| RTS

;===================================================================================================

SetupActionHitbox_dashing:
|06F5B7| LDA.b $2F
|06F5B9| LSR A
|06F5BA| TAY

|06F5BB| LDA.b $22
|06F5BD| CLC
|06F5BE| ADC.w .offset_x_low,Y
|06F5C1| STA.b $00

|06F5C3| LDA.b $23
|06F5C5| ADC.w .offset_x_high,Y
|06F5C8| STA.b $08

|06F5CA| LDA.b $20
|06F5CC| CLC
|06F5CD| ADC.w .offset_y_low,Y
|06F5D0| STA.b $01

|06F5D2| LDA.b $21
|06F5D4| ADC.w .offset_y_high,Y
|06F5D7| STA.b $09

|06F5D9| LDA.b #$10
|06F5DB| STA.b $02
|06F5DD| STA.b $03

|06F5DF| RTS

;===================================================================================================

SetupActionHitbox:
|06F5E0| LDA.w $0372
|06F5E3| BNE SetupActionHitbox_dashing

|06F5E5| PHX

|06F5E6| LDX.b #$00

|06F5E8| LDA.w $0301
|06F5EB| AND.b #$0A
|06F5ED| BNE .hammer_or_net

|06F5EF| LDA.w $037A
|06F5F2| AND.b #$10
|06F5F4| BNE .hammer_or_net

|06F5F6| LDY.b $3C
|06F5F8| BMI SetupActionHitbox_spinning

|06F5FA| LDA.w ActionHitbox.sword_validity,Y
|06F5FD| BNE .no_hitbox

|06F5FF| LDA.b $2F
|06F601| ASL A
|06F602| ASL A
|06F603| ASL A
|06F604| CLC
|06F605| ADC.b $3C
|06F607| TAX

|06F608| INX

;---------------------------------------------------------------------------------------------------

.hammer_or_net
|06F609| LDY.b #$00

|06F60B| LDA.b $45
|06F60D| CLC
|06F60E| ADC.w ActionHitbox.offset_x,X
|06F611| BPL .positive_x

|06F613| DEY

.positive_x
|06F614| CLC
|06F615| ADC.b $22
|06F617| STA.b $00

|06F619| TYA
|06F61A| ADC.b $23
|06F61C| STA.b $08

;---------------------------------------------------------------------------------------------------

|06F61E| LDY.b #$00

|06F620| LDA.b $44
|06F622| CLC
|06F623| ADC.w ActionHitbox.offset_y,X
|06F626| BPL .positive_y

|06F628| DEY

.positive_y
|06F629| CLC
|06F62A| ADC.b $20
|06F62C| STA.b $01

|06F62E| TYA
|06F62F| ADC.b $21
|06F631| STA.b $09

;---------------------------------------------------------------------------------------------------

|06F633| LDA.w ActionHitbox.size_x,X
|06F636| STA.b $02

|06F638| LDA.w ActionHitbox.size_y,X
|06F63B| STA.b $03

|06F63D| PLX

|06F63E| RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
|06F63F| LDA.b #$80
|06F641| STA.b $08

|06F643| PLX

|06F644| RTS

;===================================================================================================

DoSpriteHitboxesFast:
|06F645| LDY.b #$00

|06F647| LDA.w $0FAB
|06F64A| CMP.b #$80
|06F64C| BEQ .exit

|06F64E| CMP.b #$00
|06F650| BPL .positive_x

|06F652| DEY

.positive_x
|06F653| CLC
|06F654| ADC.w $0D10,X
|06F657| STA.b $04

|06F659| TYA
|06F65A| ADC.w $0D30,X
|06F65D| STA.b $0A

|06F65F| LDY.b #$00

|06F661| LDA.w $0FAA
|06F664| BPL .positive_y

|06F666| DEY

.positive_y
|06F667| CLC
|06F668| ADC.w $0D00,X
|06F66B| STA.b $05

|06F66D| TYA
|06F66E| ADC.w $0D20,X
|06F671| STA.b $0B

;---------------------------------------------------------------------------------------------------

|06F673| LDA.b #$03

|06F675| LDY.w $0E20,X
|06F678| CPY.b #$6A ; SPRITE 6A
|06F67A| BNE .not_bnc

|06F67C| LDA.b #$10

.not_bnc
|06F67E| STA.b $06
|06F680| STA.b $07

|06F682| RTS

.exit
|06F683| LDA.b #$80
|06F685| STA.b $0A

|06F687| RTS

;===================================================================================================

ApplyRecoilToLink:
|06F688| PHA

|06F689| JSR ProjectSpriteSpeedTowardsLink

|06F68C| LDA.b $00
|06F68E| STA.b $27

|06F690| LDA.b $01
|06F692| STA.b $28

|06F694| PLA
|06F695| LSR A
|06F696| STA.b $29
|06F698| STA.b $C7

|06F69A| STZ.b $24
|06F69C| STZ.b $25

|06F69E| RTS

;===================================================================================================

PlaceWeaponTinkAtLink:
|06F69F| LDA.w $0FAC
|06F6A2| BNE .exit

|06F6A4| LDA.b #$05
|06F6A6| STA.w $0FAC

|06F6A9| LDA.w $0022
|06F6AC| ADC.w $0045
|06F6AF| STA.w $0FAD

|06F6B2| LDA.w $0020
|06F6B5| ADC.w $0044
|06F6B8| STA.w $0FAE

|06F6BB| LDA.b $EE
|06F6BD| STA.w $0B68

|06F6C0| JSL CalculateLinkSFXPan
|06F6C4| ORA.b #$05 ; SFX2.05
|06F6C6| STA.w $012E

.exit
|06F6C9| RTS

;===================================================================================================

PlaceWeaponTinkAtSprite:
|06F6CA| LDA.w $0FAC
|06F6CD| BNE .no_spark

|06F6CF| LDA.b #$05 ; SFX2.05
|06F6D1| JSL QueueSpriteSFX2WithPan

;===================================================================================================

#PlaceWeaponTinkAtSprite_forced:
|06F6D5| LDA.w $0D10,X
|06F6D8| CMP.b $E2

|06F6DA| LDA.w $0D30,X
|06F6DD| SBC.b $E3
|06F6DF| BNE .no_spark

|06F6E1| LDA.w $0D00,X
|06F6E4| CMP.b $E8

|06F6E6| LDA.w $0D20,X
|06F6E9| SBC.b $E9
|06F6EB| BNE .no_spark

|06F6ED| LDA.w $0D10,X
|06F6F0| STA.w $0FAD

|06F6F3| LDA.w $0D00,X
|06F6F6| STA.w $0FAE

|06F6F9| LDA.b #$05
|06F6FB| STA.w $0FAC

|06F6FE| LDA.w $0F20,X
|06F701| STA.w $0B68

.no_spark
|06F704| RTL

;===================================================================================================

SetupLinkHitbox_conditional:
|06F705| LDA.w $037B
|06F708| BNE .no_hitbox

;===================================================================================================

#SetupLinkHitbox:
|06F70A| LDA.b #$08
|06F70C| STA.b $02
|06F70E| STA.b $03

|06F710| LDA.b $22
|06F712| CLC
|06F713| ADC.b #$04
|06F715| STA.b $00

|06F717| LDA.b $23
|06F719| ADC.b #$00
|06F71B| STA.b $08

|06F71D| LDA.b $20
|06F71F| ADC.b #$08
|06F721| STA.b $01

|06F723| LDA.b $21
|06F725| ADC.b #$00
|06F727| STA.b $09

|06F729| RTS

;---------------------------------------------------------------------------------------------------

.no_hitbox
|06F72A| LDA.b #$80
|06F72C| STA.b $09

|06F72E| RTS

;===================================================================================================

pool SetupSpriteHitbox

.offset_x_low
|06F72F| db   2 ; 0x00
|06F730| db   3 ; 0x01
|06F731| db   0 ; 0x02
|06F732| db  -3 ; 0x03
|06F733| db  -6 ; 0x04
|06F734| db   0 ; 0x05
|06F735| db   2 ; 0x06
|06F736| db  -8 ; 0x07
|06F737| db   0 ; 0x08
|06F738| db  -4 ; 0x09
|06F739| db  -8 ; 0x0A
|06F73A| db   0 ; 0x0B
|06F73B| db  -8 ; 0x0C
|06F73C| db -16 ; 0x0D
|06F73D| db   2 ; 0x0E
|06F73E| db   2 ; 0x0F

|06F73F| db   2 ; 0x10
|06F740| db   2 ; 0x11
|06F741| db   2 ; 0x12
|06F742| db  -8 ; 0x13
|06F743| db   2 ; 0x14
|06F744| db   2 ; 0x15
|06F745| db -16 ; 0x16
|06F746| db  -8 ; 0x17
|06F747| db -12 ; 0x18
|06F748| db   4 ; 0x19
|06F749| db  -4 ; 0x1A
|06F74A| db -12 ; 0x1B
|06F74B| db   5 ; 0x1C
|06F74C| db -32 ; 0x1D
|06F74D| db  -2 ; 0x1E
|06F74E| db   4 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_x_high
|06F74F| db   0 ; 0x00
|06F750| db   0 ; 0x01
|06F751| db   0 ; 0x02
|06F752| db  -1 ; 0x03
|06F753| db  -1 ; 0x04
|06F754| db   0 ; 0x05
|06F755| db   0 ; 0x06
|06F756| db  -1 ; 0x07
|06F757| db   0 ; 0x08
|06F758| db  -1 ; 0x09
|06F759| db  -1 ; 0x0A
|06F75A| db   0 ; 0x0B
|06F75B| db  -1 ; 0x0C
|06F75C| db  -1 ; 0x0D
|06F75D| db   0 ; 0x0E
|06F75E| db   0 ; 0x0F

|06F75F| db   0 ; 0x10
|06F760| db   0 ; 0x11
|06F761| db   0 ; 0x12
|06F762| db  -1 ; 0x13
|06F763| db   0 ; 0x14
|06F764| db   0 ; 0x15
|06F765| db  -1 ; 0x16
|06F766| db  -1 ; 0x17
|06F767| db  -1 ; 0x18
|06F768| db   0 ; 0x19
|06F769| db  -1 ; 0x1A
|06F76A| db  -1 ; 0x1B
|06F76B| db   0 ; 0x1C
|06F76C| db  -1 ; 0x1D
|06F76D| db  -1 ; 0x1E
|06F76E| db   0 ; 0x1F

;---------------------------------------------------------------------------------------------------

.width
|06F76F| db  12 ; 0x00
|06F770| db   1 ; 0x01
|06F771| db  16 ; 0x02
|06F772| db  20 ; 0x03
|06F773| db  20 ; 0x04
|06F774| db   8 ; 0x05
|06F775| db   4 ; 0x06
|06F776| db  32 ; 0x07
|06F777| db  48 ; 0x08
|06F778| db  24 ; 0x09
|06F779| db  32 ; 0x0A
|06F77A| db  32 ; 0x0B
|06F77B| db  32 ; 0x0C
|06F77C| db  48 ; 0x0D
|06F77D| db  12 ; 0x0E
|06F77E| db  12 ; 0x0F

|06F77F| db  60 ; 0x10
|06F780| db 124 ; 0x11
|06F781| db  12 ; 0x12
|06F782| db  32 ; 0x13
|06F783| db   4 ; 0x14
|06F784| db  12 ; 0x15
|06F785| db  48 ; 0x16
|06F786| db  32 ; 0x17
|06F787| db  40 ; 0x18
|06F788| db   8 ; 0x19
|06F789| db  24 ; 0x1A
|06F78A| db  24 ; 0x1B
|06F78B| db   5 ; 0x1C
|06F78C| db  80 ; 0x1D
|06F78D| db   4 ; 0x1E
|06F78E| db   8 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_y_low
|06F78F| db   0 ; 0x00
|06F790| db   3 ; 0x01
|06F791| db   4 ; 0x02
|06F792| db  -4 ; 0x03
|06F793| db  -8 ; 0x04
|06F794| db   2 ; 0x05
|06F795| db   0 ; 0x06
|06F796| db -16 ; 0x07
|06F797| db  12 ; 0x08
|06F798| db  -4 ; 0x09
|06F799| db  -8 ; 0x0A
|06F79A| db   0 ; 0x0B
|06F79B| db -10 ; 0x0C
|06F79C| db -16 ; 0x0D
|06F79D| db   2 ; 0x0E
|06F79E| db   2 ; 0x0F

|06F79F| db   2 ; 0x10
|06F7A0| db   2 ; 0x11
|06F7A1| db  -3 ; 0x12
|06F7A2| db -12 ; 0x13
|06F7A3| db   2 ; 0x14
|06F7A4| db  10 ; 0x15
|06F7A5| db   0 ; 0x16
|06F7A6| db -12 ; 0x17
|06F7A7| db  16 ; 0x18
|06F7A8| db   4 ; 0x19
|06F7A9| db  -4 ; 0x1A
|06F7AA| db -12 ; 0x1B
|06F7AB| db   3 ; 0x1C
|06F7AC| db -16 ; 0x1D
|06F7AD| db  -8 ; 0x1E
|06F7AE| db  10 ; 0x1F

;---------------------------------------------------------------------------------------------------

.offset_y_high
|06F7AF| db   0 ; 0x00
|06F7B0| db   0 ; 0x01
|06F7B1| db   0 ; 0x02
|06F7B2| db  -1 ; 0x03
|06F7B3| db  -1 ; 0x04
|06F7B4| db   0 ; 0x05
|06F7B5| db   0 ; 0x06
|06F7B6| db  -1 ; 0x07
|06F7B7| db   0 ; 0x08
|06F7B8| db  -1 ; 0x09
|06F7B9| db  -1 ; 0x0A
|06F7BA| db   0 ; 0x0B
|06F7BB| db  -1 ; 0x0C
|06F7BC| db  -1 ; 0x0D
|06F7BD| db   0 ; 0x0E
|06F7BE| db   0 ; 0x0F

|06F7BF| db   0 ; 0x10
|06F7C0| db   0 ; 0x11
|06F7C1| db  -1 ; 0x12
|06F7C2| db  -1 ; 0x13
|06F7C3| db   0 ; 0x14
|06F7C4| db   0 ; 0x15
|06F7C5| db   0 ; 0x16
|06F7C6| db  -1 ; 0x17
|06F7C7| db   0 ; 0x18
|06F7C8| db   0 ; 0x19
|06F7C9| db  -1 ; 0x1A
|06F7CA| db  -1 ; 0x1B
|06F7CB| db   0 ; 0x1C
|06F7CC| db  -1 ; 0x1D
|06F7CD| db  -1 ; 0x1E
|06F7CE| db   0 ; 0x1F

;---------------------------------------------------------------------------------------------------

.height
|06F7CF| db  14 ; 0x00
|06F7D0| db   1 ; 0x01
|06F7D1| db  16 ; 0x02
|06F7D2| db  21 ; 0x03
|06F7D3| db  24 ; 0x04
|06F7D4| db   4 ; 0x05
|06F7D5| db   8 ; 0x06
|06F7D6| db  40 ; 0x07
|06F7D7| db  20 ; 0x08
|06F7D8| db  24 ; 0x09
|06F7D9| db  40 ; 0x0A
|06F7DA| db  29 ; 0x0B
|06F7DB| db  36 ; 0x0C
|06F7DC| db  48 ; 0x0D
|06F7DD| db  60 ; 0x0E
|06F7DE| db 124 ; 0x0F

|06F7DF| db  12 ; 0x10
|06F7E0| db  12 ; 0x11
|06F7E1| db  17 ; 0x12
|06F7E2| db  28 ; 0x13
|06F7E3| db   4 ; 0x14
|06F7E4| db   2 ; 0x15
|06F7E5| db  28 ; 0x16
|06F7E6| db  20 ; 0x17
|06F7E7| db  10 ; 0x18
|06F7E8| db   4 ; 0x19
|06F7E9| db  24 ; 0x1A
|06F7EA| db  16 ; 0x1B
|06F7EB| db   5 ; 0x1C
|06F7EC| db  48 ; 0x1D
|06F7ED| db   8 ; 0x1E
|06F7EE| db  12 ; 0x1F

endpool

;---------------------------------------------------------------------------------------------------

SetupSpriteHitbox:
|06F7EF| LDA.w $0F70,X
|06F7F2| BMI .too_high

|06F7F4| PHY

|06F7F5| LDA.w $0F60,X
|06F7F8| AND.b #$1F
|06F7FA| TAY

|06F7FB| LDA.w $0D10,X
|06F7FE| CLC
|06F7FF| ADC.w .offset_x_low,Y
|06F802| STA.b $04

|06F804| LDA.w $0D30,X
|06F807| ADC.w .offset_x_high,Y
|06F80A| STA.b $0A

|06F80C| LDA.w $0D00,X
|06F80F| CLC
|06F810| ADC.w .offset_y_low,Y

|06F813| PHP
|06F814| SEC
|06F815| SBC.w $0F70,X
|06F818| STA.b $05

|06F81A| LDA.w $0D20,X
|06F81D| SBC.b #$00

|06F81F| PLP
|06F820| ADC.w .offset_y_high,Y
|06F823| STA.b $0B

|06F825| LDA.w .width,Y
|06F828| STA.b $06

|06F82A| LDA.w .height,Y
|06F82D| STA.b $07

|06F82F| PLY

|06F830| RTS

;---------------------------------------------------------------------------------------------------

.too_high
|06F831| LDA.b #$80
|06F833| STA.b $0A

|06F835| RTS

;===================================================================================================

CheckIfHitboxesOverlap:
|06F836| PHX

|06F837| LDX.b #$01

.check_other_side
|06F839| LDA.b $04,X
|06F83B| SEC
|06F83C| SBC.b $00,X

|06F83E| PHA
|06F83F| PHP

|06F840| CLC
|06F841| ADC.b $06,X
|06F843| STA.b $0F

|06F845| PLP

|06F846| LDA.b $0A,X
|06F848| SBC.b $08,X
|06F84A| STA.b $0C

|06F84C| PLA
|06F84D| CLC
|06F84E| ADC.b #$80

|06F850| LDA.b $0C
|06F852| ADC.b #$00
|06F854| BNE .no_overlap

|06F856| LDA.b $02,X
|06F858| CLC
|06F859| ADC.b $06,X

|06F85B| CMP.b $0F
|06F85D| BCC .no_overlap

|06F85F| DEX
|06F860| BPL .check_other_side

;---------------------------------------------------------------------------------------------------

.no_overlap
|06F862| PLX

|06F863| RTS

;===================================================================================================

AllocateOAMDeferToPlayer_long:
|06F864| PHB
|06F865| PHK
|06F866| PLB

|06F867| JSR AllocateOAMDeferToPlayer

|06F86A| PLB

|06F86B| RTL

;===================================================================================================

AllocateOAMDeferToPlayer:
|06F86C| LDA.w $0F20,X
|06F86F| CMP.b $EE
|06F871| BNE .exit

|06F873| JSR GetXDisplacementFromLink

|06F876| LDA.b $0F
|06F878| CLC
|06F879| ADC.b #$10

|06F87B| CMP.b #$20
|06F87D| BCS .exit

|06F87F| JSR GetYDisplacementFromLink

|06F882| LDA.b $0E
|06F884| CLC
|06F885| ADC.b #$20

|06F887| CMP.b #$48
|06F889| BCS .exit

|06F88B| LDA.w $0E40,X
|06F88E| AND.b #$1F
|06F890| INC A
|06F891| ASL A
|06F892| ASL A

|06F893| CPY.b #$00
|06F895| BEQ .use_region_b

.use_region_c
|06F897| JSL AllocateOAMInRegionC

|06F89B| BRA .exit

.use_region_b
|06F89D| JSL AllocateOAMInRegionB

.exit
|06F8A1| RTS

;===================================================================================================

SpriteModule_Die:
|06F8A2| LDA.w $0E20,X
|06F8A5| CMP.b #$EC ; SPRITE EC
|06F8A7| BNE .not_foliage

|06F8A9| JSR ThrowableScenery_ScatterIntoDebris

|06F8AC| RTS

;---------------------------------------------------------------------------------------------------

.not_foliage
|06F8AD| CMP.b #$53 ; SPRITE 53
|06F8AF| BEQ .just_draw

|06F8B1| CMP.b #$54 ; SPRITE 54
|06F8B3| BEQ .just_draw

|06F8B5| CMP.b #$92 ; SPRITE 92
|06F8B7| BEQ .just_draw

|06F8B9| CMP.b #$4A ; SPRITE 4A
|06F8BB| BNE .not_enemy_bomb

|06F8BD| LDA.w $0DB0,X
|06F8C0| CMP.b #$02
|06F8C2| BCS .just_draw

.not_enemy_bomb
|06F8C4| LDA.w $0DF0,X
|06F8C7| BEQ MeetYourDemise

.kyameron_respawn
|06F8C9| LDA.w $0E60,X
|06F8CC| BMI .just_draw

|06F8CE| LDA.b $1A
|06F8D0| AND.b #$03
|06F8D2| ORA.b $11
|06F8D4| ORA.w $0FC1
|06F8D7| BNE .delay_the_inevitable

|06F8D9| INC.w $0DF0,X

.delay_the_inevitable
|06F8DC| JSR SpriteDraw_DeathPoof

;---------------------------------------------------------------------------------------------------

|06F8DF| LDA.w $0E20,X
|06F8E2| CMP.b #$40 ; SPRITE 40
|06F8E4| BEQ .aga_barrier

|06F8E6| LDA.w $0DF0,X
|06F8E9| CMP.b #$0A
|06F8EB| BCC .dont_draw_barrier

.aga_barrier
|06F8ED| REP #$20

|06F8EF| LDA.b $90
|06F8F1| CLC
|06F8F2| ADC.w #$0010
|06F8F5| STA.b $90

|06F8F7| LDA.b $92
|06F8F9| CLC
|06F8FA| ADC.w #$0004
|06F8FD| STA.b $92

|06F8FF| SEP #$20

|06F901| LDA.w $0E40,X
|06F904| PHA

|06F905| SEC
|06F906| SBC.b #$04
|06F908| STA.w $0E40,X

|06F90B| JSR SpriteModule_Active

|06F90E| PLA
|06F90F| STA.w $0E40,X

.dont_draw_barrier
|06F912| RTS

;---------------------------------------------------------------------------------------------------

.just_draw
|06F913| JSR SpriteModule_Active

|06F916| RTS

;===================================================================================================

MeetYourDemise_long:
|06F917| PHB
|06F918| PHK
|06F919| PLB

|06F91A| JSR MeetYourDemise

|06F91D| PLB

|06F91E| RTL

;===================================================================================================

pool MeetYourDemise

.pikit_loot
|06F91F| db $DC ; SPRITE DC - 1 bomb
|06F920| db $E1 ; SPRITE E1 - 1 arrow
|06F921| db $D9 ; SPRITE D9 - 1 rupee
|06F922| db $E6 ; SPRITE E6 - 1 shield

endpool

;---------------------------------------------------------------------------------------------------

MeetYourDemise:
|06F923| LDA.w $0E20,X
|06F926| CMP.b #$BE ; SPRITE BE
|06F928| BNE .not_mini_vitty

|06F92A| DEC.w $0ED0

.not_mini_vitty
|06F92D| CMP.b #$AA ; SPRITE AA
|06F92F| BNE .pikit_no

|06F931| LDY.w $0E90,X
|06F934| BEQ .pikit_no

|06F936| LDA.w .pikit_loot-1,Y

|06F939| LDY.w $0E30,X
|06F93C| PHY

|06F93D| JSR PrepareEnemyDrop

|06F940| PLA
|06F941| STA.w $0E30,X

;---------------------------------------------------------------------------------------------------

|06F944| DEC A
|06F945| BNE .skip_pikit_item_props

|06F947| LDA.b #$09
|06F949| STA.w $0F50,X

|06F94C| LDA.b #$F0
|06F94E| STA.w $0E60,X

.skip_pikit_item_props
|06F951| INC.w $0EB0,X

|06F954| RTS

;---------------------------------------------------------------------------------------------------

.pikit_no
|06F955| LDA.w $0E20,X
|06F958| CMP.b #$45 ; SPRITE 45
|06F95A| BNE .not_snitch_guard

|06F95C| LDA.l $7EF3C5
|06F960| CMP.b #$02
|06F962| BNE .not_snitch_guard

|06F964| LDA.w $040A
|06F967| CMP.b #$18 ; OW 18
|06F969| BNE .not_snitch_guard

|06F96B| LDA.b #$07 ; SONG 07
|06F96D| STA.w $012C

.not_snitch_guard
|06F970| LDY.w $0CBA,X
|06F973| BEQ .no_forced_drop

|06F975| LDA.w $0BC0,X
|06F978| STA.w $0E30,X

|06F97B| LDA.b #$FF
|06F97D| STA.w $0BC0,X

|06F980| LDA.b #$E4 ; SPRITE E4
|06F982| CPY.b #$01
|06F984| BEQ PrepareEnemyDrop

|06F986| LDA.b #$E5 ; SPRITE E5
|06F988| CPY.b #$03
|06F98A| BNE PrepareEnemyDrop

|06F98C| LDA.b #$D9 ; SPRITE D9
|06F98E| BRA PrepareEnemyDrop

;---------------------------------------------------------------------------------------------------

.no_forced_drop
|06F990| LDA.w $0BE0,X
|06F993| AND.b #$0F
|06F995| BEQ .no_drop

|06F997| DEC A
|06F998| PHA

|06F999| LDY.w $0CF9
|06F99C| BEQ .no_luck_override

|06F99E| INC.w $0CFA

|06F9A1| LDA.w $0CFA
|06F9A4| CMP.b #$0A
|06F9A6| BCC .no_luck_reset

|06F9A8| STZ.w $0CF9

.no_luck_reset
|06F9AB| PLA

|06F9AC| CPY.b #$01
|06F9AE| BEQ .good_drop_luck

.no_drop
|06F9B0| BRA .you_dont_get_a_drop

.no_luck_override
|06F9B2| JSL GetRandomNumber

|06F9B6| PLY

|06F9B7| AND.w PrizePackRarities,Y
|06F9BA| BNE .you_dont_get_a_drop

;===================================================================================================

#ForcePrizeDrop:
|06F9BC| TYA

.good_drop_luck
|06F9BD| ASL A
|06F9BE| ASL A
|06F9BF| ASL A
|06F9C0| ORA.w $0FC7,Y
|06F9C3| PHA

|06F9C4| LDA.w $0FC7,Y
|06F9C7| INC A
|06F9C8| AND.b #$07
|06F9CA| STA.w $0FC7,Y

|06F9CD| PLY

|06F9CE| LDA.w PrizePackPrizes,Y

;===================================================================================================

#PrepareEnemyDrop:
|06F9D1| STA.w $0E20,X

|06F9D4| CMP.b #$E5 ; SPRITE E5
|06F9D6| BNE .not_big_key_drop

|06F9D8| JSR LoadBigKeyGraphics
|06F9DB| BRA .spawn_drop

.not_big_key_drop
|06F9DD| CMP.b #$E4 ; SPRITE E4
|06F9DF| BNE .spawn_drop

|06F9E1| JSR SetKeyIndex

;---------------------------------------------------------------------------------------------------

.spawn_drop
|06F9E4| LDA.b #$09
|06F9E6| STA.w $0DD0,X

|06F9E9| LDA.w $0F70,X
|06F9EC| PHA

|06F9ED| JSL LoadSpriteProperties

|06F9F1| INC.w $0BA0,X

|06F9F4| LDY.w $0E20,X

|06F9F7| LDA.w ItemDropBounceProps-$D9,Y
|06F9FA| PHA

|06F9FB| AND.b #$F0
|06F9FD| STA.w $0F80,X

|06FA00| PLA
|06FA01| AND.b #$0F

|06FA03| CLC
|06FA04| ADC.w $0D10,X
|06FA07| STA.w $0D10,X

|06FA0A| LDA.w $0D30,X
|06FA0D| ADC.b #$00
|06FA0F| STA.w $0D30,X

|06FA12| PLA
|06FA13| STA.w $0F70,X

|06FA16| LDA.b #$15
|06FA18| STA.w $0F10,X

|06FA1B| LDA.b #$FF
|06FA1D| STA.w $0B58,X

|06FA20| BRA .post_death_stuff

;---------------------------------------------------------------------------------------------------

.you_dont_get_a_drop
|06FA22| STZ.w $0DD0,X

.post_death_stuff
|06FA25| LDA.w $0E20,X
|06FA28| CMP.b #$A2 ; SPRITE A2
|06FA2A| BNE .not_dead_kholdstares

|06FA2C| JSL CheckIfScreenIsClear
|06FA30| BCC .not_dead_kholdstares

|06FA32| LDA.b #$04
|06FA34| JSL SpawnFallingDungeonPrize

.not_dead_kholdstares
|06FA38| JSL ManuallySetDeathFlagUW

|06FA3C| INC.w $0CFB

|06FA3F| LDA.w $0E20,X
|06FA42| CMP.b #$40 ; SPRITE 40
|06FA44| BNE .not_barrier

|06FA46| LDA.b #$09
|06FA48| STA.w $0DD0,X

|06FA4B| LDA.b #$04
|06FA4D| STA.w $0DC0,X

|06FA50| JMP.w SpriteModule_Die.kyameron_respawn

.not_barrier
|06FA53| RTS

;===================================================================================================

ForcePrizeDrop_long:
|06FA54| PHB
|06FA55| PHK
|06FA56| PLB

|06FA57| JSR ForcePrizeDrop

|06FA5A| PLB

|06FA5B| RTL

;===================================================================================================

PrizePackRarities:
|06FA5C| db $01 ; pack 1 :  50%
|06FA5D| db $01 ; pack 2 :  50%
|06FA5E| db $01 ; pack 3 :  50%
|06FA5F| db $00 ; pack 4 : 100%
|06FA60| db $01 ; pack 5 :  50%
|06FA61| db $01 ; pack 6 :  50%
|06FA62| db $01 ; pack 7 :  50%
|06FA63| db $00 ; pack 8 : 100% - doesn't exist

;===================================================================================================

ItemDropBounceProps:
|06FA64| db $24 ; GREEN RUPEE
|06FA65| db $24 ; BLUE RUPEE
|06FA66| db $24 ; RED RUPEE
|06FA67| db $20 ; BOMB REFILL 1
|06FA68| db $20 ; BOMB REFILL 4
|06FA69| db $20 ; BOMB REFILL 8
|06FA6A| db $24 ; SMALL MAGIC DECANTER
|06FA6B| db $24 ; LARGE MAGIC DECANTER
|06FA6C| db $24 ; ARROW REFILL 5
|06FA6D| db $24 ; ARROW REFILL 10
|06FA6E| db $00 ; FAIRY
|06FA6F| db $24 ; SMALL KEY
|06FA70| db $20 ; BIG KEY
|06FA71| db $20 ; STOLEN SHIELD

;===================================================================================================

PrizePackPrizes:

.pack_1
|06FA72| db $D8 ; SPRITE D8 - heart
|06FA73| db $D8 ; SPRITE D8 - heart
|06FA74| db $D8 ; SPRITE D8 - heart
|06FA75| db $D8 ; SPRITE D8 - heart
|06FA76| db $D9 ; SPRITE D9 - green rupee
|06FA77| db $D8 ; SPRITE D8 - heart
|06FA78| db $D8 ; SPRITE D8 - heart
|06FA79| db $D9 ; SPRITE D9 - green rupee

;---------------------------------------------------------------------------------------------------

.pack_2
|06FA7A| db $DA ; SPRITE DA - blue rupee
|06FA7B| db $D9 ; SPRITE D9 - green rupee
|06FA7C| db $DA ; SPRITE DA - blue rupee
|06FA7D| db $DB ; SPRITE DB - red rupee
|06FA7E| db $DA ; SPRITE DA - blue rupee
|06FA7F| db $D9 ; SPRITE D9 - green rupee
|06FA80| db $DA ; SPRITE DA - blue rupee
|06FA81| db $DA ; SPRITE DA - blue rupee

;---------------------------------------------------------------------------------------------------

.pack_3
|06FA82| db $E0 ; SPRITE E0 - full magic
|06FA83| db $DF ; SPRITE DF - small magic
|06FA84| db $DF ; SPRITE DF - small magic
|06FA85| db $DA ; SPRITE DA - blue rupee
|06FA86| db $E0 ; SPRITE E0 - full magic
|06FA87| db $DF ; SPRITE DF - small magic
|06FA88| db $D8 ; SPRITE D8 - heart
|06FA89| db $DF ; SPRITE DF - small magic

;---------------------------------------------------------------------------------------------------

.pack_4
|06FA8A| db $DC ; SPRITE DC - 1 bomb
|06FA8B| db $DC ; SPRITE DC - 1 bomb
|06FA8C| db $DC ; SPRITE DC - 1 bomb
|06FA8D| db $DD ; SPRITE DD - 4 bombs
|06FA8E| db $DC ; SPRITE DC - 1 bomb
|06FA8F| db $DC ; SPRITE DC - 1 bomb
|06FA90| db $DE ; SPRITE DE - 8 bombs
|06FA91| db $DC ; SPRITE DC - 1 bomb

;---------------------------------------------------------------------------------------------------

.pack_5
|06FA92| db $E1 ; SPRITE E1 - 5 arrows
|06FA93| db $D8 ; SPRITE D8 - heart
|06FA94| db $E1 ; SPRITE E1 - 5 arrows
|06FA95| db $E2 ; SPRITE E2 - 10 arrows
|06FA96| db $E1 ; SPRITE E1 - 5 arrows
|06FA97| db $D8 ; SPRITE D8 - heart
|06FA98| db $E1 ; SPRITE E1 - 5 arrows
|06FA99| db $E2 ; SPRITE E2 - 10 arrows

;---------------------------------------------------------------------------------------------------

.pack_6
|06FA9A| db $DF ; SPRITE DF - small magic
|06FA9B| db $D9 ; SPRITE D9 - green rupee
|06FA9C| db $D8 ; SPRITE D8 - heart
|06FA9D| db $E1 ; SPRITE E1 - 5 arrows
|06FA9E| db $DF ; SPRITE DF - small magic
|06FA9F| db $DC ; SPRITE DC - 1 bomb
|06FAA0| db $D9 ; SPRITE D9 - green rupee
|06FAA1| db $D8 ; SPRITE D8 - heart

;---------------------------------------------------------------------------------------------------

.pack_7
|06FAA2| db $D8 ; SPRITE D8 - heart
|06FAA3| db $E3 ; SPRITE E3 - fairy
|06FAA4| db $E0 ; SPRITE E0 - full magic
|06FAA5| db $DB ; SPRITE DB - red rupee
|06FAA6| db $DE ; SPRITE DE - 8 bombs
|06FAA7| db $D8 ; SPRITE D8 - heart
|06FAA8| db $DB ; SPRITE DB - red rupee
|06FAA9| db $E2 ; SPRITE E2 - 10 arrows

;===================================================================================================

pool SpriteDraw_DeathPoof

.offset_x
|06FAAA| db   0,   0,   0,   8
|06FAAE| db   0,   8,   0,   8
|06FAB2| db   8,   8,   0,   8
|06FAB6| db   0,   8,   0,   8
|06FABA| db   0,   8,   0,   8
|06FABE| db   0,   8,   0,   8
|06FAC2| db  -3,  11,  -3,  11
|06FAC6| db  -6,  14,  -6,  14

.offset_y
|06FACA| db   0,   0,   8,   8
|06FACE| db   0,   0,   8,   8
|06FAD2| db   0,   0,   8,   8
|06FAD6| db   0,   0,   8,   8
|06FADA| db   0,   0,   8,   8
|06FADE| db   0,   0,   8,   8
|06FAE2| db  -3,  -3,  11,  11
|06FAE6| db  -6,  -6,  14,  14

.char
|06FAEA| db $00, $B9, $00, $00
|06FAEE| db $B4, $B5, $B5, $B4
|06FAF2| db $B9, $00, $00, $00
|06FAF6| db $B5, $B4, $B4, $B5
|06FAFA| db $A8, $A8, $B8, $B8
|06FAFE| db $A8, $A8, $B8, $B8
|06FB02| db $A9, $A9, $A9, $A9
|06FB06| db $9B, $9B, $9B, $9B

.prop
|06FB0A| db $04, $04, $04, $04
|06FB0E| db $04, $04, $C4, $C4
|06FB12| db $44, $04, $04, $04
|06FB16| db $44, $44, $84, $84
|06FB1A| db $04, $44, $04, $44
|06FB1E| db $04, $44, $04, $44
|06FB22| db $44, $04, $C4, $84
|06FB26| db $04, $44, $84, $C4

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_DeathPoof:
|06FB2A| LDA.w $046C
|06FB2D| CMP.b #$04
|06FB2F| BNE .keep_priority_as_is

|06FB31| LDA.b #$30
|06FB33| STA.w $0B89,X

.keep_priority_as_is
|06FB36| JSR GetScreenCoordinates

|06FB39| LDA.w $0E60,X
|06FB3C| AND.b #$20
|06FB3E| LSR A
|06FB3F| LSR A
|06FB40| LSR A
|06FB41| STA.b $0C

|06FB43| PHX

|06FB44| LDA.b #$03
|06FB46| STA.b $00

|06FB48| LDA.w $0DF0,X
|06FB4B| AND.b #$1C
|06FB4D| EOR.b #$1C

|06FB4F| CLC
|06FB50| ADC.b $00
|06FB52| TAX

;---------------------------------------------------------------------------------------------------

.next_object
|06FB53| PHY

|06FB54| LDA.w .char,X
|06FB57| BEQ .skip

|06FB59| INY
|06FB5A| INY

|06FB5B| STA.b ($90),Y

|06FB5D| LDA.w $0FA9
|06FB60| SEC
|06FB61| SBC.b $0C

|06FB63| CLC
|06FB64| ADC.w .offset_y,X

|06FB67| DEY

|06FB68| STA.b ($90),Y

|06FB6A| LDA.w $0FA8
|06FB6D| SEC
|06FB6E| SBC.b $0C

|06FB70| CLC
|06FB71| ADC.w .offset_x,X

|06FB74| DEY

|06FB75| STA.b ($90),Y

|06FB77| LDA.b $05
|06FB79| AND.b #$30
|06FB7B| ORA.w .prop,X

|06FB7E| INY
|06FB7F| INY
|06FB80| INY

|06FB81| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.skip
|06FB83| PLY

|06FB84| INY
|06FB85| INY
|06FB86| INY
|06FB87| INY

|06FB88| DEX

|06FB89| DEC.b $00
|06FB8B| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06FB8D| PLX

|06FB8E| LDY.b #$00
|06FB90| LDA.b #$03
|06FB92| JSR CorrectOAMEntries

|06FB95| RTS

;===================================================================================================

pool SpriteModule_Fall2

.anim_step_a
|06FB96| db $0D, $0D, $0D, $0D, $0D, $0D, $0D, $0C
|06FB9E| db $0C, $0C, $0C, $0C, $03, $03, $03, $03
|06FBA6| db $03, $02, $02, $02, $02, $01, $01, $01
|06FBAE| db $01, $00, $00, $00, $00, $00, $00, $00

.anim_step_b
|06FBB6| db $05, $05, $05, $05, $05, $05, $05, $04
|06FBBE| db $04, $04, $04, $04, $03, $03, $03, $03
|06FBC6| db $03, $02, $02, $02, $02, $01, $01, $01
|06FBCE| db $01, $00, $00, $00, $00, $00, $00, $00

.frame_mask
|06FBD6| db $FF, $3F, $1F, $0F, $0F, $07, $03, $01
|06FBDE| db $FF, $3F, $1F, $0F, $07, $03, $01, $00

.head_data_offset
|06FBE6| db $00, $04, $08, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteModule_Fall2:
|06FBEA| LDA.w $0DF0,X
|06FBED| BNE .falling

|06FBEF| STZ.w $0DD0,X

|06FBF2| JSL ManuallySetDeathFlagUW

|06FBF6| RTS

;---------------------------------------------------------------------------------------------------

.falling
|06FBF7| CMP.b #$40
|06FBF9| BCC .continue_a

|06FBFB| LDA.w $0F50,X
|06FBFE| CMP.b #$05
|06FC00| BNE .not_frozen

|06FC02| LDA.b #$3F
|06FC04| STA.w $0DF0,X

|06FC07| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.not_frozen
|06FC09| LDA.w $0DF0,X
|06FC0C| AND.b #$07
|06FC0E| ORA.b $11
|06FC10| ORA.w $0FC1
|06FC13| BNE .skip_sfx31

|06FC15| LDA.b #$31 ; SFX3.31
|06FC17| JSL QueueSpriteSFX3WithPan

.skip_sfx31
|06FC1B| JSR SpriteModule_Active
|06FC1E| JSR GetScreenCoordinates

|06FC21| LDA.b $02
|06FC23| SEC
|06FC24| SBC.b #$08
|06FC26| STA.b $02

|06FC28| LDA.b $03
|06FC2A| SBC.b #$00
|06FC2C| STA.b $03

|06FC2E| LDA.w $0DF0,X
|06FC31| CLC
|06FC32| ADC.b #$14
|06FC34| STA.b $06

|06FC36| JSL DrawSpriteDistress.custom

|06FC3A| RTS

;---------------------------------------------------------------------------------------------------

.continue_a
|06FC3B| CMP.b #$3D
|06FC3D| BNE .skip_sfx20

|06FC3F| PHA

|06FC40| LDA.b #$20 ; SFX2.20
|06FC42| JSL QueueSpriteSFX2WithPan

|06FC46| PLA

;---------------------------------------------------------------------------------------------------

.skip_sfx20
|06FC47| LSR A
|06FC48| TAY

|06FC49| LDA.w $0E20,X
|06FC4C| CMP.b #$26 ; SPRITE 26
|06FC4E| BEQ .is_beetle

|06FC50| CMP.b #$13 ; SPRITE 13
|06FC52| BNE .not_minihelma

.is_beetle
|06FC54| LDA.w .anim_step_b,Y
|06FC57| STA.w $0DC0,X

|06FC5A| JSR SpriteDraw_FallingHelmaBeetle

|06FC5D| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_minihelma
|06FC5F| LDA.w .anim_step_a,Y
|06FC62| CMP.b #$0C
|06FC64| BCS .ignore_head

|06FC66| LDY.w $0DE0,X

|06FC69| CLC
|06FC6A| ADC.w .head_data_offset,Y

.ignore_head
|06FC6D| STA.w $0DC0,X

|06FC70| JSR SpriteDraw_FallingHumanoid

.continue_b
|06FC73| LDA.w $0DF0,X
|06FC76| LSR A
|06FC77| LSR A
|06FC78| LSR A
|06FC79| TAY

|06FC7A| LDA.b $1A
|06FC7C| AND.w .frame_mask,Y
|06FC7F| ORA.b $11
|06FC81| BNE .exit

;---------------------------------------------------------------------------------------------------

|06FC83| LDY.b #$68
|06FC85| JSR CheckSpriteTileProperty

|06FC88| LDA.w $0FA5
|06FC8B| CMP.b #$20 ; TILETYPE 20
|06FC8D| BEQ .dont_reset_recoil

|06FC8F| STZ.w $0F30,X
|06FC92| STZ.w $0F40,X

.dont_reset_recoil
|06FC95| LDA.w $0F30,X
|06FC98| STA.w $0D40,X

|06FC9B| ASL A
|06FC9C| PHP
|06FC9D| ROR.w $0D40,X
|06FCA0| PLP
|06FCA1| ROR.w $0D40,X

|06FCA4| LDA.w $0F40,X
|06FCA7| STA.w $0D50,X

|06FCAA| ASL A
|06FCAB| PHP
|06FCAC| ROR.w $0D50,X
|06FCAF| PLP
|06FCB0| ROR.w $0D50,X

|06FCB3| JSR MoveSpriteXY_bank06

;---------------------------------------------------------------------------------------------------

.exit
|06FCB6| RTS

;===================================================================================================

pool SpriteDraw_FallingHelmaBeetle

.oam_groups_beetle
|06FCB7| dw   0,   0 : db $46, $01, $00, $02

|06FCBF| dw   0,   0 : db $48, $01, $00, $02

|06FCC7| dw   0,   0 : db $4A, $01, $00, $02

|06FCCF| dw   4,   4 : db $4C, $01, $00, $00

|06FCD7| dw   4,   4 : db $B7, $00, $00, $00

|06FCDF| dw   4,   4 : db $80, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.oam_groups_mini_helma
|06FCE7| dw   0,   0 : db $6C, $01, $00, $02

|06FCEF| dw   0,   0 : db $6E, $01, $00, $02

|06FCF7| dw   0,   0 : db $4E, $01, $00, $02

|06FCFF| dw   4,   4 : db $5C, $01, $00, $00

|06FD07| dw   4,   4 : db $B7, $00, $00, $00

|06FD0F| dw   4,   4 : db $80, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_FallingHelmaBeetle:
|06FD17| LDA.w $0E20,X
|06FD1A| CMP.b #$13 ; SPRITE 13
|06FD1C| BEQ .mini_helma

;---------------------------------------------------------------------------------------------------

|06FD1E| LDA.w $0DC0,X

|06FD21| ASL A
|06FD22| ASL A
|06FD23| ASL A

|06FD24| ADC.b #<.oam_groups_beetle
|06FD26| STA.b $08

|06FD28| LDA.b #>.oam_groups_beetle

;---------------------------------------------------------------------------------------------------

.save_high_byte
|06FD2A| ADC.b #$00
|06FD2C| STA.b $09

|06FD2E| LDA.b #$01
|06FD30| JSL TabulatedSpriteDraw

|06FD34| RTS

;---------------------------------------------------------------------------------------------------

.mini_helma
|06FD35| LDA.w $0DC0,X

|06FD38| ASL A
|06FD39| ASL A
|06FD3A| ASL A

|06FD3B| ADC.b #<.oam_groups_mini_helma
|06FD3D| STA.b $08

|06FD3F| LDA.b #>.oam_groups_mini_helma

|06FD41| BRA .save_high_byte

;===================================================================================================

pool SpriteDraw_FallingHumanoid

.offset_x
|06FD43| db  -4,   4,  -4,  12
|06FD47| db   0,   0,   0,   0
|06FD4B| db   0,   0,   0,   0
|06FD4F| db   4,   0,   0,   0
|06FD53| db  -4,  12,  -4,   4
|06FD57| db   0,   0,   0,   0
|06FD5B| db   0,   0,   0,   0
|06FD5F| db   4,   0,   0,   0
|06FD63| db  -4,  12,  -4,   4
|06FD67| db   0,   0,   0,   0
|06FD6B| db   0,   0,   0,   0
|06FD6F| db   4,   0,   0,   0
|06FD73| db   4,   0,   0,   0
|06FD77| db   4,   0,   0,   0

.offset_y
|06FD7B| db  -4,  -4,   4,  12
|06FD7F| db   0,   0,   0,   0
|06FD83| db   0,   0,   0,   0
|06FD87| db   4,   0,   0,   0
|06FD8B| db  -4,  -4,  12,   4
|06FD8F| db   0,   0,   0,   0
|06FD93| db   0,   0,   0,   0
|06FD97| db   4,   0,   0,   0
|06FD9B| db  -4,  -4,  12,   4
|06FD9F| db   0,   0,   0,   0
|06FDA3| db   0,   0,   0,   0
|06FDA7| db   4,   0,   0,   0
|06FDAB| db   4,   0,   0,   0
|06FDAF| db   4,   0,   0,   0

.char
|06FDB3| db $AE, $A8, $A6, $AF
|06FDB7| db $AA, $00, $00, $00
|06FDBB| db $AC, $00, $00, $00
|06FDBF| db $BE, $00, $00, $00
|06FDC3| db $A8, $AE, $AF, $A6
|06FDC7| db $AA, $00, $00, $00
|06FDCB| db $AC, $00, $00, $00
|06FDCF| db $BE, $00, $00, $00
|06FDD3| db $A6, $AF, $AE, $A8
|06FDD7| db $AA, $00, $00, $00
|06FDDB| db $AC, $00, $00, $00
|06FDDF| db $BE, $00, $00, $00
|06FDE3| db $B6, $00, $00, $00
|06FDE7| db $80, $00, $00, $00

.prop
|06FDEB| db $00, $00, $00, $00
|06FDEF| db $00, $00, $00, $00
|06FDF3| db $00, $00, $00, $00
|06FDF7| db $00, $00, $00, $00
|06FDFB| db $40, $40, $40, $40
|06FDFF| db $40, $00, $00, $00
|06FE03| db $40, $00, $00, $00
|06FE07| db $40, $00, $00, $00
|06FE0B| db $80, $80, $80, $80
|06FE0F| db $80, $00, $00, $00
|06FE13| db $80, $00, $00, $00
|06FE17| db $80, $00, $00, $00
|06FE1B| db $01, $00, $00, $00
|06FE1F| db $01, $00, $00, $00

.size
|06FE23| db $00, $02, $02, $00
|06FE27| db $02, $00, $00, $00
|06FE2B| db $02, $00, $00, $00
|06FE2F| db $00, $00, $00, $00
|06FE33| db $02, $00, $00, $02
|06FE37| db $02, $00, $00, $00
|06FE3B| db $02, $00, $00, $00
|06FE3F| db $00, $00, $00, $00
|06FE43| db $02, $00, $00, $02
|06FE47| db $02, $00, $00, $00
|06FE4B| db $02, $00, $00, $00
|06FE4F| db $00, $00, $00, $00
|06FE53| db $00, $00, $00, $00
|06FE57| db $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

SpriteDraw_FallingHumanoid:
|06FE5B| JSR GetScreenCoordinates

|06FE5E| LDA.w $0DC0,X
|06FE61| PHA

|06FE62| ASL A
|06FE63| ASL A
|06FE64| STA.b $06

|06FE66| PLA
|06FE67| PHX

|06FE68| LDX.b #$00

|06FE6A| CMP.b #$0C
|06FE6C| BCS .set_correction_quota

|06FE6E| AND.b #$03
|06FE70| BNE .set_correction_quota

|06FE72| LDX.b #$03

.set_correction_quota
|06FE74| STX.b $07

;---------------------------------------------------------------------------------------------------

.next_object
|06FE76| PHX

|06FE77| TXA
|06FE78| CLC
|06FE79| ADC.b $06
|06FE7B| TAX

|06FE7C| LDA.b $00
|06FE7E| CLC
|06FE7F| ADC.w .offset_x,X
|06FE82| STA.b ($90),Y

|06FE84| LDA.b $02
|06FE86| CLC
|06FE87| ADC.w .offset_y,X

|06FE8A| INY

|06FE8B| STA.b ($90),Y

|06FE8D| LDA.w .char,X
|06FE90| INY

|06FE91| STA.b ($90),Y

|06FE93| LDA.w .prop,X
|06FE96| EOR.b $05
|06FE98| INY

|06FE99| STA.b ($90),Y

|06FE9B| PHY

|06FE9C| TYA
|06FE9D| LSR A
|06FE9E| LSR A
|06FE9F| TAY

|06FEA0| LDA.w .size,X
|06FEA3| STA.b ($92),Y

|06FEA5| PLY
|06FEA6| INY

|06FEA7| PLX
|06FEA8| DEX
|06FEA9| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06FEAB| PLX

|06FEAC| LDY.b #$FF
|06FEAE| LDA.b $07
|06FEB0| JSR CorrectOAMEntries

|06FEB3| RTS

;===================================================================================================

CorrectOAMEntries_long:
|06FEB4| PHB
|06FEB5| PHK
|06FEB6| PLB

|06FEB7| JSR CorrectOAMEntries

|06FEBA| PLB

|06FEBB| RTL

;===================================================================================================

CorrectOAMEntries:
|06FEBC| JSR GetSpriteCoordinatesRelativeScreen

|06FEBF| PHX

|06FEC0| REP #$10

|06FEC2| LDX.b $90
|06FEC4| STX.b $0C

|06FEC6| LDX.b $92
|06FEC8| STX.b $0E

;---------------------------------------------------------------------------------------------------

.next_object
|06FECA| LDX.b $0E

|06FECC| LDA.b $0B
|06FECE| BPL .make_small

|06FED0| LDA.b $00,X
|06FED2| AND.b #$02

.make_small
|06FED4| STA.b $00,X

|06FED6| LDY.w #$0000

|06FED9| LDX.b $0C

|06FEDB| LDA.b $00,X
|06FEDD| SEC
|06FEDE| SBC.b $07
|06FEE0| BPL .positive_x

|06FEE2| DEY

.positive_x
|06FEE3| CLC
|06FEE4| ADC.b $02
|06FEE6| STA.b $04

|06FEE8| TYA
|06FEE9| ADC.b $03
|06FEEB| STA.b $05

|06FEED| JSR CheckIfXOnScreen
|06FEF0| BCC .not_offscreen_x

|06FEF2| LDX.b $0E
|06FEF4| INC.b $00,X

.not_offscreen_x
|06FEF6| LDY.w #$0000

|06FEF9| LDX.b $0C
|06FEFB| INX

|06FEFC| LDA.b $00,X
|06FEFE| SEC
|06FEFF| SBC.b $06
|06FF01| BPL .positive_y

|06FF03| DEY

.positive_y
|06FF04| CLC
|06FF05| ADC.b $00
|06FF07| STA.b $09

|06FF09| TYA
|06FF0A| ADC.b $01
|06FF0C| STA.b $0A

|06FF0E| JSR CheckIfYOnScreen
|06FF11| BCC .not_offscreen_y

|06FF13| LDA.b #$F0
|06FF15| STA.b $00,X

.not_offscreen_y
|06FF17| INX
|06FF18| INX
|06FF19| INX
|06FF1A| STX.b $0C

|06FF1C| INC.b $0E

|06FF1E| DEC.b $08
|06FF20| BPL .next_object

;---------------------------------------------------------------------------------------------------

|06FF22| SEP #$10

|06FF24| PLX

|06FF25| RTS

;===================================================================================================

GetSpriteCoordinatesRelativeScreen:
|06FF26| STY.b $0B

|06FF28| STA.b $08

|06FF2A| LDA.w $0D00,X
|06FF2D| STA.b $00

|06FF2F| SEC
|06FF30| SBC.b $E8
|06FF32| STA.b $06

|06FF34| LDA.w $0D20,X
|06FF37| STA.b $01

|06FF39| LDA.w $0D10,X
|06FF3C| STA.b $02

|06FF3E| SEC
|06FF3F| SBC.b $E2
|06FF41| STA.b $07

|06FF43| LDA.w $0D30,X
|06FF46| STA.b $03

|06FF48| RTS

;===================================================================================================

CheckIfXOnScreen:
|06FF49| REP #$20

|06FF4B| LDA.b $04
|06FF4D| SEC
|06FF4E| SBC.b $E2
|06FF50| CMP.w #$0100

|06FF53| SEP #$20

|06FF55| RTS

;===================================================================================================

CheckIfYOnScreen:
|06FF56| REP #$20

|06FF58| LDA.b $09
|06FF5A| PHA

|06FF5B| CLC
|06FF5C| ADC.w #$0010
|06FF5F| STA.b $09

|06FF61| SEC
|06FF62| SBC.b $E8
|06FF64| CMP.w #$0100

|06FF67| PLA
|06FF68| STA.b $09

|06FF6A| SEP #$20

|06FF6C| RTS

;===================================================================================================

UNREACHABLE_06FF6D:
|06FF6D| JSL KillThisSprite

|06FF71| RTS

;===================================================================================================

pool HandleSpriteRecoil_bank06

.masks
|06FF72| db $03, $01, $00, $00, $0C, $03

endpool

;---------------------------------------------------------------------------------------------------

HandleSpriteRecoil_bank06:
|06FF78| LDA.w $0EA0,X
|06FF7B| BEQ .exit

|06FF7D| AND.b #$7F
|06FF7F| BEQ .recoil_over

|06FF81| LDA.w $0D40,X
|06FF84| PHA

|06FF85| LDA.w $0D50,X
|06FF88| PHA

|06FF89| DEC.w $0EA0,X
|06FF8C| BNE .still_recoiling

|06FF8E| LDA.w $0F40,X
|06FF91| CLC
|06FF92| ADC.b #$20
|06FF94| CMP.b #$40
|06FF96| BCS .no_adjust

|06FF98| LDA.w $0F30,X
|06FF9B| CLC
|06FF9C| ADC.b #$20
|06FF9E| CMP.b #$40
|06FFA0| BCC .still_recoiling

.no_adjust
|06FFA2| LDA.b #$90
|06FFA4| STA.w $0EA0,X

.still_recoiling
|06FFA7| LDA.w $0EA0,X
|06FFAA| BMI .no_movement

|06FFAC| LSR A
|06FFAD| LSR A
|06FFAE| TAY

|06FFAF| LDA.b $1A
|06FFB1| AND.w .masks,Y
|06FFB4| BNE .no_movement

|06FFB6| LDA.w $0F30,X
|06FFB9| STA.w $0D40,X

|06FFBC| LDA.w $0F40,X
|06FFBF| STA.w $0D50,X

|06FFC2| LDA.w $0CD2,X
|06FFC5| BMI .handle_movement

|06FFC7| JSL CheckSpriteTileCollision_long

|06FFCB| LDA.w $0E70,X
|06FFCE| AND.b #$0F
|06FFD0| BEQ .handle_movement

.stop_horizontal_movement
|06FFD2| CMP.b #$04
|06FFD4| BCS .stop_vertical_movement

|06FFD6| STZ.w $0F40,X
|06FFD9| STZ.w $0D50,X

|06FFDC| BRA .movement_stopped

.stop_vertical_movement
|06FFDE| STZ.w $0F30,X
|06FFE1| STZ.w $0D40,X

.movement_stopped
|06FFE4| BRA .no_movement

.handle_movement
|06FFE6| JSR MoveSpriteXY_bank06

.no_movement
|06FFE9| PLA
|06FFEA| STA.w $0D50,X

|06FFED| PLA
|06FFEE| STA.w $0D40,X

|06FFF1| PLA
|06FFF2| PLA

.exit
|06FFF3| RTS

.recoil_over
|06FFF4| STZ.w $0EA0,X

|06FFF7| RTS

;===================================================================================================
; FREE ROM: 0x08
;===================================================================================================
NULL_06FFF8:
|06FFF8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
