org $088000

;===================================================================================================

Ancilla_SFX1_Near:
|088000| JSR SetAncillaSFXPanNearLink
|088003| STA.w $012D

|088006| RTS

;===================================================================================================

Ancilla_SFX2_Near:
|088007| JSR SetAncillaSFXPanNearLink
|08800A| STA.w $012E

|08800D| RTS

;===================================================================================================

Ancilla_SFX3_Near:
|08800E| JSR SetAncillaSFXPanNearLink
|088011| STA.w $012F

|088014| RTS

;===================================================================================================

SetAncillaSFXPanNearLink:
|088015| STA.w $0CF8

|088018| JSL CalculateLinkSFXPan
|08801C| ORA.w $0CF8

|08801F| RTS

;===================================================================================================

Ancilla_SFX1_Pan:
|088020| JSR SetAncillaSFXPan
|088023| STA.w $012D

|088026| RTS

;===================================================================================================

Ancilla_SFX2_Pan:
|088027| JSR SetAncillaSFXPan
|08802A| STA.w $012E

|08802D| RTS

;===================================================================================================

Ancilla_SFX3_Pan:
|08802E| JSR SetAncillaSFXPan
|088031| STA.w $012F

|088034| RTS

;===================================================================================================

SetAncillaSFXPan:
|088035| STA.w $0CF8

|088038| JSL CalculateAncillaSFXPan
|08803C| ORA.w $0CF8

|08803F| RTS


;===================================================================================================

pool AncillaAdd_FireRodShot

.init_check_offset_x_low
|088040| db   0,   0,  -8,  16

.init_check_offset_x_high
|088044| db   0,   0,  -1,   0

.init_check_offset_y_low
|088048| db  -8,  16,   3,   3

.init_check_offset_y_high
|08804C| db  -1,   0,   0,   0

;---------------------------------------------------------------------------------------------------

#SomariaBulletSpeedX:
|088050| db   0,   0, -40,  40
|088054| db   0,   0, -48,  48
|088058| db   0,   0, -64,  64

#SomariaBulletSpeedY:
|08805C| db -40,  40,   0,   0
|088060| db -48,  48,   0,   0
|088064| db -64,  64,   0,   0

;---------------------------------------------------------------------------------------------------

.flame_speed_x
|088068| db   0,   0, -64,  64

.flame_speed_y
|08806C| db -64,  64,   0

endpool

;===================================================================================================

AncillaObjectAllocation:
|08806F| db $00 ; 0x00 - NOTHING
|088070| db $08 ; 0x01 - SOMARIA BULLET
|088071| db $0C ; 0x02 - FIRE ROD SHOT
|088072| db $10 ; 0x03 - UNUSED
|088073| db $10 ; 0x04 - BEAM HIT
|088074| db $04 ; 0x05 - BOOMERANG
|088075| db $10 ; 0x06 - WALL HIT
|088076| db $18 ; 0x07 - BOMB
|088077| db $08 ; 0x08 - DOOR DEBRIS
|088078| db $08 ; 0x09 - ARROW
|088079| db $08 ; 0x0A - LODGED ARROW
|08807A| db $00 ; 0x0B - ICE ROD SHOT
|08807B| db $14 ; 0x0C - SWORD BEAM
|08807C| db $00 ; 0x0D - SPIN ATTACK FULL CHARGE SPARK
|08807D| db $10 ; 0x0E - BLAST WALL EXPLOSION
|08807E| db $28 ; 0x0F - BLAST WALL EXPLOSION
|08807F| db $18 ; 0x10 - BLAST WALL EXPLOSION
|088080| db $10 ; 0x11 - ICE ROD WALL HIT
|088081| db $10 ; 0x12 - BLAST WALL EXPLOSION
|088082| db $10 ; 0x13 - ICE ROD SPARKLE
|088083| db $10 ; 0x14 - BAD POINTER
|088084| db $0C ; 0x15 - SPLASH
|088085| db $08 ; 0x16 - HIT STARS
|088086| db $08 ; 0x17 - SHOVEL DIRT
|088087| db $50 ; 0x18 - ETHER SPELL
|088088| db $00 ; 0x19 - BOMBOS SPELL
|088089| db $10 ; 0x1A - POWDER DUST
|08808A| db $08 ; 0x1B - SWORD WALL HIT
|08808B| db $40 ; 0x1C - QUAKE SPELL
|08808C| db $00 ; 0x1D - SCREEN SHAKE
|08808D| db $0C ; 0x1E - DASH DUST
|08808E| db $24 ; 0x1F - HOOKSHOT
|08808F| db $10 ; 0x20 - BLANKET
|088090| db $0C ; 0x21 - SNORE
|088091| db $08 ; 0x22 - ITEM GET
|088092| db $10 ; 0x23 - LINK POOF
|088093| db $10 ; 0x24 - GRAVESTONE
|088094| db $04 ; 0x25 - BAD POINTER
|088095| db $0C ; 0x26 - SWORD SWING SPARKLE
|088096| db $1C ; 0x27 - DUCK
|088097| db $00 ; 0x28 - WISH POND ITEM
|088098| db $10 ; 0x29 - MILESTONE ITEM GET
|088099| db $14 ; 0x2A - SPIN ATTACK SPARKLE A
|08809A| db $14 ; 0x2B - SPIN ATTACK SPARKLE B
|08809B| db $10 ; 0x2C - SOMARIA BLOCK
|08809C| db $08 ; 0x2D - SOMARIA BLOCK FIZZ
|08809D| db $20 ; 0x2E - SOMARIA BLOCK FISSION
|08809E| db $10 ; 0x2F - LAMP FLAME
|08809F| db $10 ; 0x30 - BYRNA WINDUP SPARK
|0880A0| db $10 ; 0x31 - BYRNA SPARK
|0880A1| db $04 ; 0x32 - BLAST WALL FIREBALL
|0880A2| db $00 ; 0x33 - BLAST WALL EXPLOSION
|0880A3| db $80 ; 0x34 - SKULL WOODS FIRE
|0880A4| db $10 ; 0x35 - MASTER SWORD GET
|0880A5| db $04 ; 0x36 - FLUTE
|0880A6| db $30 ; 0x37 - WEATHERVANE EXPLOSION
|0880A7| db $14 ; 0x38 - CUTSCENE DUCK
|0880A8| db $10 ; 0x39 - SOMARIA PLATFORM POOF
|0880A9| db $00 ; 0x3A - BIG BOMB EXPLOSION
|0880AA| db $10 ; 0x3B - SWORD UP SPARKLE
|0880AB| db $00 ; 0x3C - SPIN ATTACK CHARGE SPARKLE
|0880AC| db $00 ; 0x3D - ITEM SPLASH
|0880AD| db $08 ; 0x3E - RISING CRYSTAL
|0880AE| db $00 ; 0x3F - BUSH POOF
|0880AF| db $10 ; 0x40 - DWARF POOF
|0880B0| db $08 ; 0x41 - WATERFALL SPLASH
|0880B1| db $78 ; 0x42 - HAPPINESS POND RUPEES
|0880B2| db $80 ; 0x43 - GANONS TOWER CUTSCENE

;===================================================================================================

AncillaAdd_FireRodShot:
|0880B3| LDY.b #$01

|0880B5| STA.b $00

|0880B7| JSL FindAncillaSlot
|0880BB| BPL .free_slot

|0880BD| LDA.b $00
|0880BF| CMP.b #$01
|0880C1| BEQ .no_RefundMagic

|0880C3| LDX.b #$00
|0880C5| JSL RefundMagic

.no_RefundMagic
|0880C9| BRL .exit_a

;---------------------------------------------------------------------------------------------------

.free_slot
|0880CC| PHB
|0880CD| PHK
|0880CE| PLB

|0880CF| PHX

|0880D0| LDA.b $00
|0880D2| CMP.b #$01
|0880D4| BEQ .no_sfx

|0880D6| PHY

|0880D7| LDA.b #$0E ; SFX2.0E
|0880D9| JSR Ancilla_SFX2_Near

|0880DC| PLY

;---------------------------------------------------------------------------------------------------

.no_sfx
|0880DD| LDA.b $00
|0880DF| STA.w $0C4A,Y

|0880E2| TAX

|0880E3| LDA.w AncillaObjectAllocation,X
|0880E6| STA.w $0C90,Y

|0880E9| LDA.b #$03
|0880EB| STA.w $0C68,Y

|0880EE| LDA.b #$00
|0880F0| STA.w $0C54,Y
|0880F3| STA.w $0C5E,Y

|0880F6| STA.w $0280,Y
|0880F9| STA.w $028A,Y

|0880FC| LDA.b $2F
|0880FE| LSR A
|0880FF| STA.w $0C72,Y

|088102| TAX

|088103| PHY
|088104| PHX

|088105| TYX
|088106| JSL Ancilla_CheckInitialTile_A

|08810A| PLX
|08810B| PLY

|08810C| BCS .disperse_on_spawn

;---------------------------------------------------------------------------------------------------

|08810E| LDA.w $0022
|088111| CLC
|088112| ADC.w .init_check_offset_x_low,X
|088115| STA.w $0C04,Y

|088118| LDA.w $0023
|08811B| ADC.w .init_check_offset_x_high,X
|08811E| STA.w $0C18,Y

|088121| LDA.w $0020
|088124| CLC
|088125| ADC.w .init_check_offset_y_low,X
|088128| STA.w $0BFA,Y

|08812B| LDA.w $0021
|08812E| ADC.w .init_check_offset_y_high,X
|088131| STA.w $0C0E,Y

;---------------------------------------------------------------------------------------------------

|088134| LDA.w $0C4A,Y
|088137| CMP.b #$01 ; ANCILLA 01
|088139| BEQ .is_somaria_bullet

|08813B| LDA.w .flame_speed_x,X
|08813E| STA.w $0C2C,Y

|088141| LDA.w .flame_speed_y,X

|088144| BRA .speed_set

;---------------------------------------------------------------------------------------------------

.is_somaria_bullet
|088146| LDA.l $7EF359
|08814A| DEC A
|08814B| DEC A

|08814C| ASL A
|08814D| ASL A

|08814E| STA.b $0F

|088150| TXA
|088151| CLC
|088152| ADC.b $0F
|088154| TAX

|088155| LDA.w SomariaBulletSpeedX,X
|088158| STA.w $0C2C,Y

|08815B| LDA.w SomariaBulletSpeedY,X

;---------------------------------------------------------------------------------------------------

.speed_set
|08815E| STA.w $0C22,Y

|088161| LDA.w $00EE
|088164| STA.w $0C7C,Y

|088167| LDA.w $0476
|08816A| STA.w $03CA,Y

|08816D| PLX
|08816E| PLB

.exit_a
|08816F| RTL

;---------------------------------------------------------------------------------------------------

.disperse_on_spawn
|088170| LDA.w $0C4A,Y
|088173| CMP.b #$01 ; ANCILLA 01
|088175| BNE .not_bullet

|088177| LDA.b #$04 ; ANCILLA 04
|088179| STA.w $0C4A,Y

|08817C| LDA.b #$07
|08817E| STA.w $0C68,Y

|088181| LDA.b #$10
|088183| STA.w $0C90,Y

|088186| BRA .exit_b

;---------------------------------------------------------------------------------------------------

.not_bullet
|088188| LDA.b #$01
|08818A| STA.w $0C54,Y

|08818D| LDA.b #$1F
|08818F| STA.w $0C68,Y

|088192| LDA.b #$08
|088194| STA.w $0C90,Y

|088197| LDA.b #$2A ; SFX2.2A
|088199| JSR Ancilla_SFX2_Pan

.exit_b
|08819C| PLX
|08819D| PLB

|08819E| RTL

;===================================================================================================

pool SpawnSomariaBullets

.offset_x
|08819F| db  -8,  -8,  -9,  -4

.offset_y
|0881A3| db -15,  -4,  -8,  -8

endpool

;---------------------------------------------------------------------------------------------------

SpawnSomariaBullets:
|0881A7| LDA.b #$03
|0881A9| STA.w $0FB5

|0881AC| LDA.w $029E,X
|0881AF| CMP.b #$FF
|0881B1| BNE .altitiude_fine

|0881B3| LDA.b #$00

.altitiude_fine
|0881B5| STA.b $05

|0881B7| LDA.w $0C04,X
|0881BA| STA.b $00

|0881BC| LDA.w $0C18,X
|0881BF| STA.b $01

|0881C1| LDA.w $0BFA,X
|0881C4| SEC
|0881C5| SBC.b $05
|0881C7| STA.b $02

|0881C9| LDA.w $0C0E,X
|0881CC| SBC.b #$00
|0881CE| STA.b $03

|0881D0| LDA.w $0C7C,X
|0881D3| STA.b $04

;---------------------------------------------------------------------------------------------------

.next_spawn
|0881D5| LDY.b #$04
|0881D7| LDA.b #$01 ; ANCILLA 01
|0881D9| JSL FindAncillaSlot
|0881DD| BMI .spawn_failed

|0881DF| PHX

|0881E0| LDA.b #$01 ; ANCILLA 01
|0881E2| STA.w $0C4A,Y

|0881E5| TAX

|0881E6| LDA.w AncillaObjectAllocation,X
|0881E9| STA.w $0C90,Y

|0881EC| LDA.b #$04
|0881EE| STA.w $0C54,Y

|0881F1| LDA.b #$00
|0881F3| STA.w $0C5E,Y
|0881F6| STA.w $0280,Y

|0881F9| LDX.w $0FB5
|0881FC| TXA
|0881FD| STA.w $0C72,Y

|088200| LDA.b $00
|088202| CLC
|088203| ADC.w .offset_x,X
|088206| STA.w $0C04,Y

|088209| LDA.b $01
|08820B| ADC.b #$FF
|08820D| STA.w $0C18,Y

|088210| LDA.b $02
|088212| CLC
|088213| ADC.w .offset_y,X
|088216| STA.w $0BFA,Y

|088219| LDA.b $03
|08821B| ADC.b #$FF
|08821D| STA.w $0C0E,Y

|088220| JSL Ancilla_TerminateOffScreen

|088224| LDA.w SomariaBulletSpeedX,X
|088227| STA.w $0C2C,Y

|08822A| LDA.w SomariaBulletSpeedY,X
|08822D| STA.w $0C22,Y

|088230| LDA.b $04
|088232| STA.w $0C7C,Y

|088235| LDA.w $0476
|088238| STA.w $03CA,Y

|08823B| PLX

.spawn_failed
|08823C| DEC.w $0FB5
|08823F| BPL .next_spawn

|088241| RTS

;===================================================================================================

Ancilla_Main:
|088242| PHB
|088243| PHK
|088244| PLB

|088245| JSR WeaponTink
|088248| JSR HandleAllAncilla

|08824B| PLB

|08824C| RTL

;===================================================================================================

Ancilla_ProjectReflexiveSpeedOntoSprite:
|08824D| LDA.w $0022
|088250| PHA

|088251| LDA.w $0023
|088254| PHA

|088255| LDA.w $0020
|088258| PHA

|088259| LDA.w $0021
|08825C| PHA

|08825D| LDA.b $04
|08825F| STA.w $0022

|088262| LDA.b $05
|088264| STA.w $0023

|088267| LDA.b $06
|088269| STA.w $0020

|08826C| LDA.b $07
|08826E| STA.w $0021

|088271| TYA
|088272| JSL ProjectReflexiveSpeedOntoSprite_UsingLinkCoordinates

|088276| PLA
|088277| STA.w $0021

|08827A| PLA
|08827B| STA.w $0020

|08827E| PLA
|08827F| STA.w $0023

|088282| PLA
|088283| STA.w $0022

|088286| RTS

;===================================================================================================

Bomb_CheckSpriteDamage:
|088287| LDY.b #$0F

.next_sprite
|088289| TYA
|08828A| EOR.b $1A
|08828C| AND.b #$03
|08828E| ORA.w $0EF0,Y
|088291| ORA.w $0BA0,Y
|088294| BEQ .continue

.different_layer
|088296| JMP.w .skip

.continue
|088299| LDA.w $0F20,Y
|08829C| CMP.w $0C7C,X
|08829F| BNE .different_layer

|0882A1| LDA.w $0DD0,Y
|0882A4| CMP.b #$09
|0882A6| BCC .skip

|0882A8| LDA.w $0C04,X
|0882AB| SEC
|0882AC| SBC.b #$18
|0882AE| STA.b $00

|0882B0| LDA.w $0C18,X
|0882B3| SBC.b #$00
|0882B5| STA.b $08

|0882B7| LDA.w $0BFA,X
|0882BA| SEC
|0882BB| SBC.b #$18
|0882BD| PHP

|0882BE| SEC
|0882BF| SBC.w $029E,X
|0882C2| STA.b $01

|0882C4| LDA.w $0C0E,X
|0882C7| SBC.b #$00

|0882C9| PLP
|0882CA| SBC.b #$00
|0882CC| STA.b $09

|0882CE| LDA.b #$30
|0882D0| STA.b $02
|0882D2| STA.b $03

|0882D4| PHX

|0882D5| TYX
|0882D6| JSL SetupSpriteHitbox_long

|0882DA| PLX

|0882DB| JSL CheckIfHitboxesOverlap_long
|0882DF| BCC .skip

;---------------------------------------------------------------------------------------------------

|0882E1| LDA.w $0E20,Y
|0882E4| CMP.b #$92 ; SPRITE 92
|0882E6| BNE .not_king_helma

|0882E8| LDA.w $0DB0,Y
|0882EB| CMP.b #$03
|0882ED| BCS .skip

.not_king_helma
|0882EF| LDA.w $0C04,X
|0882F2| STA.b $04

|0882F4| LDA.w $0C18,X
|0882F7| STA.b $05

|0882F9| LDA.w $0BFA,X
|0882FC| STA.b $06

|0882FE| LDA.w $0C0E,X
|088301| STA.b $07

|088303| PHX
|088304| PHY

|088305| LDA.w $0C4A,X
|088308| TYX

|088309| JSL CheckAncillaDamageToSprite

|08830D| LDY.b #$40
|08830F| JSR Ancilla_ProjectReflexiveSpeedOntoSprite

|088312| PLY
|088313| PLX

|088314| LDA.b $00
|088316| EOR.b #$FF
|088318| INC A
|088319| STA.w $0F30,Y

|08831C| LDA.b $01
|08831E| EOR.b #$FF
|088320| INC A
|088321| STA.w $0F40,Y

.skip
|088324| DEY
|088325| BMI .done

|088327| JMP.w .next_sprite

;---------------------------------------------------------------------------------------------------

.done
|08832A| RTS

;===================================================================================================

HandleAllAncilla:
|08832B| LDX.b #$09

.next
|08832D| STX.w $0FA0

|088330| LDA.w $0C4A,X
|088333| BEQ .skip

|088335| JSR HandleSingleAncilla

.skip
|088338| DEX
|088339| BPL .next

|08833B| RTS

;===================================================================================================

HandleSingleAncilla:
|08833C| PHA

|08833D| CPX.b #$06
|08833F| BCS .skip_oam

|088341| LDA.w $0C90,X

|088344| LDY.w $0FB3
|088347| BEQ .ignore_layer

|088349| LDY.w $0C7C,X
|08834C| BNE .bg1

|08834E| JSL AllocateOAMInRegionD
|088352| BRA .save_oam

.bg1
|088354| JSL AllocateOAMInRegionF
|088358| BRA .save_oam

.ignore_layer
|08835A| JSL AllocateOAMInRegionA

.save_oam
|08835E| TYA
|08835F| STA.w $0C86,X

;---------------------------------------------------------------------------------------------------

.skip_oam
|088362| LDY.b $11
|088364| BNE .skip_timer

|088366| LDY.w $0C68,X
|088369| BEQ .skip_timer

|08836B| DEC.w $0C68,X

.skip_timer
|08836E| PLA
|08836F| DEC A
|088370| ASL A
|088371| TAY

|088372| LDA.w .vectors+0,Y
|088375| STA.b $00

|088377| LDA.w .vectors+1,Y
|08837A| STA.b $01

|08837C| JMP.w ($0000)

;---------------------------------------------------------------------------------------------------

.vectors
|08837F| dw Ancilla01_SomariaBullet
|088381| dw Ancilla02_FireRodShot
|088383| dw Ancilla03
|088385| dw Ancilla04_BeamHit
|088387| dw Ancilla05_Boomerang
|088389| dw Ancilla06_WallHit
|08838B| dw Ancilla07_Bomb
|08838D| dw Ancilla08_DoorDebris
|08838F| dw Ancilla09_Arrow
|088391| dw Ancilla0A_LodgedArrow
|088393| dw Ancilla0B_IceRodShot
|088395| dw Ancilla0C_SwordBeam_bounce
|088397| dw Ancilla0D_SpinAttackFullChargeSpark
|088399| dw Ancilla33_BlastWallExplosion ; Unused
|08839B| dw Ancilla33_BlastWallExplosion ; Unused
|08839D| dw Ancilla33_BlastWallExplosion ; Unused
|08839F| dw Ancilla11_IceRodWallHit
|0883A1| dw Ancilla33_BlastWallExplosion ; Unused
|0883A3| dw Ancilla13_IceRodSparkle
|0883A5| dw JumpSplash_char ; bad pointer but correct
|0883A7| dw Ancilla15_JumpSplash
|0883A9| dw Ancilla16_HitStars
|0883AB| dw Ancilla17_ShovelDirt
|0883AD| dw Ancilla18_EtherSpell
|0883AF| dw Ancilla19_BombosSpell
|0883B1| dw Ancilla1A_PowderDust
|0883B3| dw Ancilla1B_SwordWallHit
|0883B5| dw Ancilla1C_QuakeSpell
|0883B7| dw Ancilla1D_ScreenShake
|0883B9| dw Ancilla1E_DashDust
|0883BB| dw Ancilla1F_Hookshot
|0883BD| dw Ancilla20_Blanket
|0883BF| dw Ancilla21_Snore
|0883C1| dw Ancilla22_ItemReceipt
|0883C3| dw Ancilla23_LinkPoof
|0883C5| dw Ancilla24_Gravestone
|0883C7| dw HitStar_char ; bad pointer but correct
|0883C9| dw Ancilla26_SwordSwingSparkle
|0883CB| dw Ancilla27_Duck
|0883CD| dw Ancilla28_WishPondItem
|0883CF| dw Ancilla29_MilestoneItemReceipt
|0883D1| dw Ancilla2A_SpinAttackSparkleA
|0883D3| dw Ancilla2B_SpinAttackSparkleB
|0883D5| dw Ancilla2C_SomariaBlock
|0883D7| dw Ancilla2D_SomariaBlockFizz
|0883D9| dw Ancilla2E_SomariaBlockFission
|0883DB| dw Ancilla2F_LampFlame
|0883DD| dw Ancilla30_ByrnaWindupSpark
|0883DF| dw Ancilla31_ByrnaSpark
|0883E1| dw Ancilla32_BlastWallFireball
|0883E3| dw Ancilla33_BlastWallExplosion
|0883E5| dw Ancilla34_SkullWoodsFire
|0883E7| dw Ancilla35_MasterSwordCutscene
|0883E9| dw Ancilla36_Flute
|0883EB| dw Ancilla37_WeathervaneExplosion
|0883ED| dw Ancilla38_CutsceneDuck
|0883EF| dw Ancilla39_SomariaPlatformPoof
|0883F1| dw Ancilla3A_BigBombExplosion
|0883F3| dw Ancilla3B_SwordUpSparkle
|0883F5| dw Ancilla3C_SpinAttackChargeSparkle
|0883F7| dw Ancilla3D_ItemSplash
|0883F9| dw Ancilla3E_RisingCrystal
|0883FB| dw Ancilla3F_BushPoof
|0883FD| dw Ancilla40_DwarfPoof
|0883FF| dw Ancilla41_WaterfallSplash
|088401| dw Ancilla42_HappinessPondRupees
|088403| dw Ancilla43_GanonsTowerCutscene

;===================================================================================================

pool Ancilla13_IceRodSparkle

.offset_x
|088405| db  2,  7,  6,  1
|088409| db  1,  7,  7,  1
|08840D| db  0,  7,  8,  1
|088411| db  4,  9,  4, -1

.offset_y
|088415| db  2,  3,  8,  7
|088419| db  1,  1,  7,  7
|08841D| db  1,  0,  7,  8
|088421| db -1,  4,  9,  4

.char
|088425| db $83, $83, $83, $83
|088429| db $B6, $80, $B6, $80
|08842D| db $B7, $B6, $B7, $B6
|088431| db $B7, $B6, $B7, $B6

endpool

;---------------------------------------------------------------------------------------------------

Ancilla13_IceRodSparkle:
|088435| LDA.w $0C68,X
|088438| BNE .active

|08843A| STZ.w $0C4A,X

.active
|08843D| LDA.b $11
|08843F| BNE .no_move

|088441| JSR AncillaMoveX
|088444| JSR AncillaMoveY

.no_move
|088447| JSR Ancilla_KillOffscreen

|08844A| LDY.b #$04
|08844C| LDA.b #$0B ; ANCILLA 0B

.next_slot
|08844E| CMP.w $0C4A,Y
|088451| BEQ .found_him

|088453| DEY
|088454| BPL .next_slot

.found_him
|088456| LDA.w $0280,Y
|088459| BEQ .normal_priority

|08845B| LDA.b #$30
|08845D| STA.b $04

.normal_priority
|08845F| LDA.b #$10

|088461| LDY.w $0FB3
|088464| BEQ .ignore_layer

|088466| LDY.w $0C7C,X
|088469| BNE .lower_layer

|08846B| JSL AllocateOAMInRegionD
|08846F| BRA .draw

.lower_layer
|088471| JSL AllocateOAMInRegionE
|088475| BRA .draw

.ignore_layer
|088477| JSL AllocateOAMInRegionA

.draw
|08847B| LDY.b #$00

|08847D| LDA.b #$03
|08847F| STA.b $05

|088481| LDA.w $0C68,X
|088484| AND.b #$1C
|088486| STA.b $06

|088488| PHX

;---------------------------------------------------------------------------------------------------

.next_object
|088489| LDA.b $05
|08848B| ORA.b $06

|08848D| TAX

|08848E| LDA.b $00
|088490| CLC
|088491| ADC.w .offset_x,X
|088494| STA.b ($90),Y

|088496| INY
|088497| LDA.b $01
|088499| CLC
|08849A| ADC.w .offset_y,X
|08849D| STA.b ($90),Y

|08849F| INY
|0884A0| LDA.w .char,X
|0884A3| STA.b ($90),Y

|0884A5| INY
|0884A6| LDA.b $04
|0884A8| ORA.b #$04
|0884AA| STA.b ($90),Y

|0884AC| INY
|0884AD| PHY

|0884AE| TYA
|0884AF| SEC
|0884B0| SBC.b #$04
|0884B2| LSR A
|0884B3| LSR A
|0884B4| TAY

|0884B5| LDA.b #$00
|0884B7| STA.b ($92),Y

|0884B9| PLY

|0884BA| DEC.b $05
|0884BC| BPL .next_object

;---------------------------------------------------------------------------------------------------

|0884BE| PLX

|0884BF| RTS

;===================================================================================================

pool AncillaAdd_IceRodSparkle

.speed_y
|0884C0| db -4,  4,  0,  0

.speed_x
|0884C4| db  0,  0, -4,  4

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_IceRodSparkle:
|0884C8| LDA.b $11
|0884CA| BNE .return

|0884CC| DEC.w $0BF0,X
|0884CF| BPL .return

|0884D1| LDA.b #$05
|0884D3| STA.w $0BF0,X

;---------------------------------------------------------------------------------------------------

|0884D6| LDY.b #$09

.next_slot
|0884D8| LDA.w $0C4A,Y
|0884DB| BEQ .free_slot

|0884DD| DEY
|0884DE| BPL .next_slot

.return
|0884E0| RTS

;---------------------------------------------------------------------------------------------------

.free_slot
|0884E1| LDA.b #$13 ; ANCILLA 13
|0884E3| STA.w $0C4A,Y

|0884E6| LDA.b #$0F
|0884E8| STA.w $0C68,Y

|0884EB| LDA.w $0C72,X

|0884EE| PHX
|0884EF| TAX

|0884F0| LDA.w .speed_x,X
|0884F3| STA.w $0C2C,Y

|0884F6| LDA.w .speed_y,X
|0884F9| STA.w $0C22,Y

|0884FC| PLX

|0884FD| LDA.w $0C04,X
|088500| STA.w $0C04,Y

|088503| LDA.w $0BFA,X
|088506| STA.w $0BFA,Y

|088509| LDA.w $0C7C,X
|08850C| STA.w $0C7C,Y

|08850F| LDA.b #$00
|088511| STA.w $0C90,Y

|088514| RTS

;===================================================================================================

pool Ancilla01_SomariaBullet

.frame_masks
|088515| db $07, $03, $01, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Ancilla01_SomariaBullet:
|08851B| LDA.b $11
|08851D| BNE .draw

|08851F| LDY.w $0C54,X

|088522| LDA.b $1A
|088524| AND.w .frame_masks,Y
|088527| BNE .delay_movement

|088529| JSR AncillaMoveX
|08852C| JSR AncillaMoveY

.delay_movement
|08852F| LDA.w $0C68,X
|088532| BNE .timer_delay

|088534| LDA.b #$03
|088536| STA.w $0C68,X

|088539| LDA.w $0C54,X
|08853C| INC A
|08853D| CMP.b #$06
|08853F| BCC .dont_reset_state

|088541| LDA.b #$04

.dont_reset_state
|088543| STA.w $0C54,X

.timer_delay
|088546| JSR Ancilla_CheckSpriteCollision
|088549| BCS .collision

|08854B| JSR Ancilla_CheckTileCollision_staggered
|08854E| BCC .draw

.collision
|088550| LDA.b #$04 ; ANCILLA 04
|088552| STA.w $0C4A,X

|088555| LDA.b #$07
|088557| STA.w $0C68,X

|08855A| LDA.b #$10
|08855C| STA.w $0C90,X

.draw
|08855F| BRL SomariaBlast_Draw

;===================================================================================================

pool SomariaBlast_Draw

.char_a
|088562| db  $50,  $50
|088564| db  $44,  $44
|088566| db  $52,  $52
|088568| db  $50,  $50
|08856A| db  $44,  $44
|08856C| db  $51,  $51
|08856E| db  $43,  $43
|088570| db  $42,  $42
|088572| db  $41,  $41
|088574| db  $43,  $43
|088576| db  $42,  $42
|088578| db  $40,  $40

.char_b
|08857A| db  $50,  $50
|08857C| db  $44,  $44
|08857E| db  $51,  $51
|088580| db  $50,  $50
|088582| db  $44,  $44
|088584| db  $52,  $52
|088586| db  $43,  $43
|088588| db  $42,  $42
|08858A| db  $40,  $40
|08858C| db  $43,  $43
|08858E| db  $42,  $42
|088590| db  $41,  $41

;---------------------------------------------------------------------------------------------------

.prop_a
|088592| db  $C0,  $C0
|088594| db  $C0,  $C0
|088596| db  $80,  $C0
|088598| db  $40,  $40
|08859A| db  $40,  $40
|08859C| db  $00,  $40
|08859E| db  $40,  $40
|0885A0| db  $40,  $40
|0885A2| db  $40,  $C0
|0885A4| db  $00,  $00
|0885A6| db  $00,  $00
|0885A8| db  $00,  $80

.prop_b
|0885AA| db  $80,  $80
|0885AC| db  $80,  $80
|0885AE| db  $80,  $C0
|0885B0| db  $00,  $00
|0885B2| db  $00,  $00
|0885B4| db  $00,  $40
|0885B6| db  $C0,  $C0
|0885B8| db  $C0,  $C0
|0885BA| db  $40,  $C0
|0885BC| db  $80,  $80
|0885BE| db  $80,  $80
|0885C0| db  $00,  $80

;---------------------------------------------------------------------------------------------------

.offset_x_a
|0885C2| db    0,    0
|0885C4| db    0,    0
|0885C6| db    4,    4
|0885C8| db    0,    0
|0885CA| db    0,    0
|0885CC| db    4,    4
|0885CE| db    0,    0
|0885D0| db    0,    0
|0885D2| db    0,    0
|0885D4| db    0,    0
|0885D6| db    0,    0
|0885D8| db    0,    0

.offset_x_b
|0885DA| db    8,    8
|0885DC| db    8,    8
|0885DE| db    4,    4
|0885E0| db    8,    8
|0885E2| db    8,    8
|0885E4| db    4,    4
|0885E6| db    0,    0
|0885E8| db    0,    0
|0885EA| db    8,    8
|0885EC| db    0,    0
|0885EE| db    0,    0
|0885F0| db    8,    8

;---------------------------------------------------------------------------------------------------

.offset_y_a
|0885F2| db -128,    0
|0885F4| db    0,    0
|0885F6| db    0,    0
|0885F8| db    0,    0
|0885FA| db    0,    0
|0885FC| db    0,    0
|0885FE| db    0,    0
|088600| db    0,    0
|088602| db    4,    4
|088604| db    0,    0
|088606| db    0,    0
|088608| db    4,    4

.offset_y_b
|08860A| db    0,    0
|08860C| db    0,    0
|08860E| db    8,    8
|088610| db -128,    0
|088612| db    0,    0
|088614| db    8,    8
|088616| db -128,    8
|088618| db    8,    8
|08861A| db    4,    4
|08861C| db -128,    8
|08861E| db    8,    8
|088620| db    4,    4

endpool

;===================================================================================================

Ancilla_Killa:
|088622| PLA
|088623| PLA

|088624| STZ.w $0C4A,X

|088627| RTS

;===================================================================================================

pool Ancilla_KillOffscreen

.data
|088628| db $20, $10

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_KillOffscreen:
|08862A| LDY.w $0C7C,X

|08862D| LDA.w .data,Y
|088630| STA.b $04

|088632| LDY.w $0C86,X

|088635| LDA.w $0C04,X
|088638| SEC
|088639| SBC.b $E2
|08863B| CMP.b #$F4
|08863D| BCS Ancilla_Killa

|08863F| STA.b $00

|088641| LDA.w $0BFA,X
|088644| SEC
|088645| SBC.b $E8
|088647| CMP.b #$F0
|088649| BCS Ancilla_Killa

|08864B| STA.b $01

|08864D| RTS

;===================================================================================================

pool SomariaBlast_Draw

.palette
|08864E| db $02, $06

endpool

;---------------------------------------------------------------------------------------------------

SomariaBlast_Draw:
|088650| JSR Ancilla_KillOffscreen

|088653| LDY.w $0C5E,X

|088656| LDA.b $04
|088658| ORA.w .palette,Y
|08865B| STA.b $04

|08865D| LDA.w $0280,X
|088660| BEQ .normal_priority

|088662| LDA.b #$30
|088664| TSB.b $04

.normal_priority
|088666| LDY.b #$00

|088668| LDA.w $0C72,X
|08866B| ASL A
|08866C| ASL A

|08866D| ADC.w $0C72,X
|088670| ADC.w $0C72,X
|088673| ADC.w $0C54,X

|088676| TAX

|088677| LDA.w .offset_x_a,X
|08867A| CLC
|08867B| ADC.b $00
|08867D| STA.b ($90),Y

|08867F| LDA.w .offset_x_b,X
|088682| CLC
|088683| ADC.b $00
|088685| LDY.b #$04
|088687| STA.b ($90),Y

|088689| LDA.w .offset_y_a,X
|08868C| BMI .hide_a

|08868E| CLC
|08868F| ADC.b $01
|088691| LDY.b #$01
|088693| STA.b ($90),Y

.hide_a
|088695| LDA.w .offset_y_b,X
|088698| BMI .hide_b

|08869A| CLC
|08869B| ADC.b $01
|08869D| LDY.b #$05
|08869F| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.hide_b
|0886A1| LDA.w .char_a,X
|0886A4| CLC
|0886A5| ADC.b #$82
|0886A7| LDY.b #$02

|0886A9| STA.b ($90),Y

|0886AB| LDA.w .char_b,X
|0886AE| CLC
|0886AF| ADC.b #$82
|0886B1| LDY.b #$06

|0886B3| STA.b ($90),Y

|0886B5| LDA.w .prop_a,X
|0886B8| ORA.b $04

|0886BA| LDY.b #$03
|0886BC| STA.b ($90),Y

|0886BE| LDA.w .prop_b,X
|0886C1| ORA.b $04

|0886C3| LDY.b #$07
|0886C5| STA.b ($90),Y

|0886C7| LDY.b #$00
|0886C9| TYA
|0886CA| STA.b ($92),Y

|0886CC| INY
|0886CD| STA.b ($92),Y

|0886CF| BRL Ancilla_RestoreIndex

;===================================================================================================

Ancilla02_FireRodShot:
|0886D2| LDA.w $0C54,X
|0886D5| BEQ FireRodShot_Moving

|0886D7| JMP.w FireRodShot_Halted

;===================================================================================================

FireRodShot_Moving:
|0886DA| LDA.b $11
|0886DC| BNE .draw

|0886DE| STZ.w $0385,X

|0886E1| JSR AncillaMoveX
|0886E4| JSR AncillaMoveY

|0886E7| JSR Ancilla_CheckSpriteCollision
|0886EA| BCS .collision

;---------------------------------------------------------------------------------------------------

|0886EC| LDA.w $0C72,X
|0886EF| ORA.b #$08
|0886F1| STA.w $0C72,X

|0886F4| JSR Ancilla_CheckTileCollision
|0886F7| PHP

|0886F8| LDA.w $03E4,X
|0886FB| STA.w $0385,X

|0886FE| PLP
|0886FF| BCS .collision

|088701| LDA.w $0C72,X
|088704| ORA.b #$0C
|088706| STA.w $0C72,X

|088709| LDA.w $028A,X
|08870C| STA.b $74

|08870E| JSR Ancilla_CheckTileCollision
|088711| PHP

|088712| LDA.b $74
|088714| STA.w $028A,X

|088717| PLP
|088718| BCC .no_collision

.collision
|08871A| INC.w $0C54,X

|08871D| LDA.b #$1F
|08871F| STA.w $0C68,X

|088722| LDA.b #$08
|088724| STA.w $0C90,X

|088727| LDA.b #$2A ; SFX2.2A
|088729| JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.no_collision
|08872C| INC.w $0C5E,X

|08872F| LDA.w $0C72,X
|088732| AND.b #$F3
|088734| STA.w $0C72,X

|088737| LDA.w $0385,X
|08873A| STA.w $0333

|08873D| AND.b #$F0
|08873F| CMP.b #$C0
|088741| BEQ .torch

|088743| LDA.w $03E4,X
|088746| STA.w $0333

|088749| AND.b #$F0
|08874B| CMP.b #$C0
|08874D| BNE .draw

.torch
|08874F| PHX
|088750| JSL LightTorch
|088754| PLX

;---------------------------------------------------------------------------------------------------

.draw
|088755| JSR AncillaDraw_FireRodShot

|088758| RTS

;===================================================================================================

pool AncillaDraw_FireRodShot

.offset_x
|088759| db   7,   0,   8,   0
|08875D| db   8,   4,   0,   0
|088761| db   2,   8,   0,   0
|088765| db   1,   4,   9,   0

.offset_y
|088769| db   1,   4,   9,   0
|08876D| db   7,   0,   8,   0
|088771| db   8,   4,   0,   0
|088775| db   2,   8,   0,   0

.char
|088779| db $8D, $9D, $9C

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_FireRodShot:
|08877C| JSR Ancilla_KillOffscreen

|08877F| LDA.w $0280,X
|088782| BEQ .default_priority

|088784| LDA.b #$30
|088786| TSB.b $04

.default_priority
|088788| LDA.w $0C5E,X
|08878B| AND.b #$0C
|08878D| STA.b $02

|08878F| PHX

;---------------------------------------------------------------------------------------------------

|088790| LDX.b #$02
|088792| LDY.b #$00

.next_object
|088794| STX.b $03

|088796| TXA
|088797| ORA.b $02
|088799| TAX

|08879A| LDA.b $00
|08879C| CLC
|08879D| ADC.w .offset_x,X
|0887A0| STA.b ($90),Y

|0887A2| LDA.b $01
|0887A4| CLC
|0887A5| ADC.w .offset_y,X
|0887A8| INY
|0887A9| STA.b ($90),Y

|0887AB| LDX.b $03

|0887AD| LDA.w .char,X
|0887B0| INY
|0887B1| STA.b ($90),Y

|0887B3| LDA.b $04
|0887B5| ORA.b #$02
|0887B7| INY
|0887B8| STA.b ($90),Y

|0887BA| PHY

|0887BB| TYA
|0887BC| LSR A
|0887BD| LSR A
|0887BE| TAY

|0887BF| LDA.b #$00
|0887C1| STA.b ($92),Y

|0887C3| PLY
|0887C4| INY

|0887C5| DEX
|0887C6| BPL .next_object

|0887C8| PLX

|0887C9| RTS

;===================================================================================================

UNREACHABLE_0887CA:
|0887CA| RTS

;===================================================================================================

FireRodShot_Dissipate:
|0887CB| LDA.w $0C4A,X

|0887CE| STZ.w $0C4A,X

|0887D1| CMP.b #$2F ; ANCILLA 2F
|0887D3| BEQ .no_burn

|0887D5| LDA.b $8A
|0887D7| CMP.b #$40 ; OW 40
|0887D9| BNE .no_burn

|0887DB| LDA.w $03E4,X
|0887DE| CMP.b #$43 ; TILETYPE 43
|0887E0| BNE .no_burn

|0887E2| PHX

|0887E3| JSL BecomeSkullWoodsFire

|0887E7| PLX

.no_burn
|0887E8| RTS

;===================================================================================================

pool FireRodShot_Halted

.char
|0887E9| db $A2, $A0, $8E

endpool

;---------------------------------------------------------------------------------------------------

FireRodShot_Halted:
|0887EC| JSR Ancilla_CheckBasicSpriteCollision
|0887EF| JSR Ancilla_KillOffscreen

|0887F2| LDY.b #$00
|0887F4| LDA.w $0C68,X
|0887F7| BEQ FireRodShot_Dissipate

|0887F9| LSR A
|0887FA| LSR A
|0887FB| LSR A
|0887FC| BEQ .dying

|0887FE| TAX

|0887FF| LDA.b $00
|088801| STA.b ($90),Y

|088803| LDA.b $01
|088805| INY
|088806| STA.b ($90),Y

|088808| LDA.w .char-1,X
|08880B| INY
|08880C| STA.b ($90),Y

|08880E| LDA.b #$02
|088810| ORA.b $04
|088812| INY
|088813| STA.b ($90),Y

|088815| LDA.b #$02
|088817| STA.b ($92)

|088819| BRL Ancilla_RestoreIndex

;---------------------------------------------------------------------------------------------------

.dying
|08881C| TYA
|08881D| STA.b ($92),Y

|08881F| INY
|088820| STA.b ($92),Y

|088822| DEY

|088823| LDA.b $00
|088825| STA.b ($90),Y

|088827| CLC
|088828| ADC.b #$08
|08882A| LDY.b #$04
|08882C| STA.b ($90),Y

|08882E| LDA.b $01
|088830| CLC
|088831| ADC.b #$FD
|088833| LDY.b #$01
|088835| STA.b ($90),Y

|088837| LDY.b #$05
|088839| STA.b ($90),Y

|08883B| LDA.b #$A4
|08883D| LDY.b #$02
|08883F| STA.b ($90),Y

|088841| INC A
|088842| LDY.b #$06
|088844| STA.b ($90),Y

|088846| LDA.b #$02
|088848| ORA.b $04
|08884A| LDY.b #$03
|08884C| STA.b ($90),Y

|08884E| LDY.b #$07
|088850| STA.b ($90),Y

;===================================================================================================

Ancilla03:
|088852| RTS

;===================================================================================================

Ancilla_TileCollisionBehaviorClass1:

.interaction
|088853| db $00 ; 00
|088854| db $01 ; 01
|088855| db $00 ; 02
|088856| db $03 ; 03
|088857| db $00 ; 04
|088858| db $00 ; 05
|088859| db $00 ; 06
|08885A| db $00 ; 07
|08885B| db $00 ; 08
|08885C| db $00 ; 09
|08885D| db $03 ; 0A
|08885E| db $00 ; 0B
|08885F| db $00 ; 0C
|088860| db $00 ; 0D
|088861| db $00 ; 0E
|088862| db $00 ; 0F
|088863| db $01 ; 10
|088864| db $01 ; 11
|088865| db $01 ; 12
|088866| db $01 ; 13
|088867| db $00 ; 14
|088868| db $00 ; 15
|088869| db $00 ; 16
|08886A| db $00 ; 17
|08886B| db $02 ; 18
|08886C| db $02 ; 19
|08886D| db $02 ; 1A
|08886E| db $02 ; 1B
|08886F| db $00 ; 1C
|088870| db $03 ; 1D
|088871| db $03 ; 1E
|088872| db $03 ; 1F
|088873| db $00 ; 20
|088874| db $00 ; 21
|088875| db $00 ; 22
|088876| db $00 ; 23
|088877| db $00 ; 24
|088878| db $00 ; 25
|088879| db $01 ; 26
|08887A| db $01 ; 27
|08887B| db $04 ; 28
|08887C| db $04 ; 29
|08887D| db $04 ; 2A
|08887E| db $04 ; 2B
|08887F| db $04 ; 2C
|088880| db $04 ; 2D
|088881| db $04 ; 2E
|088882| db $04 ; 2F
|088883| db $01 ; 30
|088884| db $01 ; 31
|088885| db $01 ; 32
|088886| db $01 ; 33
|088887| db $01 ; 34
|088888| db $01 ; 35
|088889| db $01 ; 36
|08888A| db $01 ; 37
|08888B| db $00 ; 38
|08888C| db $00 ; 39
|08888D| db $00 ; 3A
|08888E| db $00 ; 3B
|08888F| db $00 ; 3C
|088890| db $03 ; 3D
|088891| db $03 ; 3E
|088892| db $03 ; 3F
|088893| db $00 ; 40
|088894| db $00 ; 41
|088895| db $00 ; 42
|088896| db $01 ; 43
|088897| db $00 ; 44
|088898| db $00 ; 45
|088899| db $00 ; 46
|08889A| db $00 ; 47
|08889B| db $00 ; 48
|08889C| db $00 ; 49
|08889D| db $00 ; 4A
|08889E| db $00 ; 4B
|08889F| db $04 ; 4C
|0888A0| db $04 ; 4D
|0888A1| db $04 ; 4E
|0888A2| db $04 ; 4F
|0888A3| db $00 ; 50
|0888A4| db $00 ; 51
|0888A5| db $00 ; 52
|0888A6| db $00 ; 53
|0888A7| db $00 ; 54
|0888A8| db $00 ; 55
|0888A9| db $00 ; 56
|0888AA| db $00 ; 57
|0888AB| db $01 ; 58
|0888AC| db $01 ; 59
|0888AD| db $01 ; 5A
|0888AE| db $01 ; 5B
|0888AF| db $01 ; 5C
|0888B0| db $01 ; 5D
|0888B1| db $00 ; 5E
|0888B2| db $00 ; 5F
|0888B3| db $00 ; 60
|0888B4| db $00 ; 61
|0888B5| db $00 ; 62
|0888B6| db $01 ; 63
|0888B7| db $00 ; 64
|0888B8| db $00 ; 65
|0888B9| db $00 ; 66
|0888BA| db $00 ; 67
|0888BB| db $00 ; 68
|0888BC| db $00 ; 69
|0888BD| db $00 ; 6A
|0888BE| db $00 ; 6B
|0888BF| db $01 ; 6C
|0888C0| db $01 ; 6D
|0888C1| db $01 ; 6E
|0888C2| db $01 ; 6F
|0888C3| db $01 ; 70
|0888C4| db $01 ; 71
|0888C5| db $01 ; 72
|0888C6| db $01 ; 73
|0888C7| db $01 ; 74
|0888C8| db $01 ; 75
|0888C9| db $01 ; 76
|0888CA| db $01 ; 77
|0888CB| db $01 ; 78
|0888CC| db $01 ; 79
|0888CD| db $01 ; 7A
|0888CE| db $01 ; 7B
|0888CF| db $01 ; 7C
|0888D0| db $01 ; 7D
|0888D1| db $01 ; 7E
|0888D2| db $01 ; 7F
|0888D3| db $00 ; 80
|0888D4| db $00 ; 81
|0888D5| db $00 ; 82
|0888D6| db $00 ; 83
|0888D7| db $00 ; 84
|0888D8| db $00 ; 85
|0888D9| db $00 ; 86
|0888DA| db $00 ; 87
|0888DB| db $01 ; 88
|0888DC| db $01 ; 89
|0888DD| db $01 ; 8A
|0888DE| db $01 ; 8B
|0888DF| db $01 ; 8C
|0888E0| db $01 ; 8D
|0888E1| db $00 ; 8E
|0888E2| db $01 ; 8F
|0888E3| db $00 ; 90
|0888E4| db $00 ; 91
|0888E5| db $00 ; 92
|0888E6| db $00 ; 93
|0888E7| db $00 ; 94
|0888E8| db $00 ; 95
|0888E9| db $00 ; 96
|0888EA| db $00 ; 97
|0888EB| db $00 ; 98
|0888EC| db $00 ; 99
|0888ED| db $00 ; 9A
|0888EE| db $00 ; 9B
|0888EF| db $00 ; 9C
|0888F0| db $00 ; 9D
|0888F1| db $00 ; 9E
|0888F2| db $00 ; 9F
|0888F3| db $00 ; A0
|0888F4| db $00 ; A1
|0888F5| db $00 ; A2
|0888F6| db $00 ; A3
|0888F7| db $00 ; A4
|0888F8| db $00 ; A5
|0888F9| db $00 ; A6
|0888FA| db $00 ; A7
|0888FB| db $00 ; A8
|0888FC| db $00 ; A9
|0888FD| db $00 ; AA
|0888FE| db $00 ; AB
|0888FF| db $00 ; AC
|088900| db $00 ; AD
|088901| db $00 ; AE
|088902| db $00 ; AF
|088903| db $00 ; B0
|088904| db $00 ; B1
|088905| db $00 ; B2
|088906| db $00 ; B3
|088907| db $00 ; B4
|088908| db $00 ; B5
|088909| db $00 ; B6
|08890A| db $00 ; B7
|08890B| db $00 ; B8
|08890C| db $00 ; B9
|08890D| db $00 ; BA
|08890E| db $00 ; BB
|08890F| db $00 ; BC
|088910| db $00 ; BD
|088911| db $00 ; BE
|088912| db $00 ; BF
|088913| db $01 ; C0
|088914| db $01 ; C1
|088915| db $01 ; C2
|088916| db $01 ; C3
|088917| db $01 ; C4
|088918| db $01 ; C5
|088919| db $01 ; C6
|08891A| db $01 ; C7
|08891B| db $01 ; C8
|08891C| db $01 ; C9
|08891D| db $01 ; CA
|08891E| db $01 ; CB
|08891F| db $01 ; CC
|088920| db $01 ; CD
|088921| db $01 ; CE
|088922| db $01 ; CF
|088923| db $00 ; D0
|088924| db $00 ; D1
|088925| db $00 ; D2
|088926| db $00 ; D3
|088927| db $00 ; D4
|088928| db $00 ; D5
|088929| db $00 ; D6
|08892A| db $00 ; D7
|08892B| db $00 ; D8
|08892C| db $00 ; D9
|08892D| db $00 ; DA
|08892E| db $00 ; DB
|08892F| db $00 ; DC
|088930| db $00 ; DD
|088931| db $00 ; DE
|088932| db $00 ; DF
|088933| db $00 ; E0
|088934| db $00 ; E1
|088935| db $00 ; E2
|088936| db $00 ; E3
|088937| db $00 ; E4
|088938| db $00 ; E5
|088939| db $00 ; E6
|08893A| db $00 ; E7
|08893B| db $00 ; E8
|08893C| db $00 ; E9
|08893D| db $00 ; EA
|08893E| db $00 ; EB
|08893F| db $00 ; EC
|088940| db $00 ; ED
|088941| db $00 ; EE
|088942| db $00 ; EF
|088943| db $01 ; F0
|088944| db $01 ; F1
|088945| db $01 ; F2
|088946| db $01 ; F3
|088947| db $01 ; F4
|088948| db $01 ; F5
|088949| db $01 ; F6
|08894A| db $01 ; F7
|08894B| db $01 ; F8
|08894C| db $01 ; F9
|08894D| db $01 ; FA
|08894E| db $01 ; FB
|08894F| db $01 ; FC
|088950| db $01 ; FD
|088951| db $01 ; FE
|088952| db $01 ; FF

;---------------------------------------------------------------------------------------------------

.offset_y
|088953| db   0,  16,   5,   5
|088957| db   0,  16,   4,   4
|08895B| db   4,  12,   5,   5
|08895F| db   4,  12,  12,  12
|088963| db   0,   0,   0,   0

.offset_x
|088967| db   8,   8,   0,  16
|08896B| db   4,   4,   0,  16
|08896F| db   4,   4,   4,  12
|088973| db  12,  12,   4,  12
|088977| db   0,   0,   0,   0

;===================================================================================================

Ancilla_CheckTileCollision_staggered:
|08897B| TXA
|08897C| EOR.b $1A
|08897E| LSR A
|08897F| BCC .skip_frame

;---------------------------------------------------------------------------------------------------

#Ancilla_CheckTileCollision:
|088981| LDA.b $1B
|088983| BNE .indoors

|088985| LDA.w $0280,X
|088988| BEQ .indoors

|08898A| STZ.w $03E4,X

;---------------------------------------------------------------------------------------------------

.skip_frame
|08898D| CLC

|08898E| RTS

;---------------------------------------------------------------------------------------------------

.indoors
|08898F| LDA.w $046C
|088992| BEQ .check_basic

|088994| CMP.b #$03

|088996| REP #$20
|088998| BCC .get_bg_diff

|08899A| STZ.b $00
|08899C| STZ.b $02

|08899E| BRA .both_bg

;---------------------------------------------------------------------------------------------------

.get_bg_diff
|0889A0| LDA.b $E0
|0889A2| SEC
|0889A3| SBC.b $E2
|0889A5| STA.b $00

|0889A7| LDA.b $E6
|0889A9| SEC
|0889AA| SBC.b $E8
|0889AC| STA.b $02

;---------------------------------------------------------------------------------------------------

.both_bg
|0889AE| SEP #$20

|0889B0| LDA.w $0C04,X
|0889B3| PHA

|0889B4| CLC
|0889B5| ADC.b $00
|0889B7| STA.w $0C04,X

|0889BA| LDA.w $0C18,X
|0889BD| PHA

|0889BE| ADC.b $01
|0889C0| STA.w $0C18,X

|0889C3| LDA.w $0BFA,X
|0889C6| PHA

|0889C7| CLC
|0889C8| ADC.b $02
|0889CA| STA.w $0BFA,X

|0889CD| LDA.w $0C0E,X
|0889D0| PHA

|0889D1| ADC.b $03
|0889D3| STA.w $0C0E,X

|0889D6| LDA.b #$01
|0889D8| STA.w $0C7C,X

;---------------------------------------------------------------------------------------------------

|0889DB| JSR .check_basic

|0889DE| STZ.w $0C7C,X

|0889E1| PLA
|0889E2| STA.w $0C0E,X

|0889E5| PLA
|0889E6| STA.w $0BFA,X

|0889E9| PLA
|0889EA| STA.w $0C18,X

|0889ED| PLA
|0889EE| STA.w $0C04,X

|0889F1| LDY.b #$00
|0889F3| BCC .skip_layer1

|0889F5| INY

;---------------------------------------------------------------------------------------------------

.skip_layer1
|0889F6| PHY
|0889F7| PHP

|0889F8| JSR .check_basic

|0889FB| PLA
|0889FC| AND.b #$01
|0889FE| ROL A
|0889FF| CMP.b #$01

|088A01| PLY

|088A02| RTS

;---------------------------------------------------------------------------------------------------

.check_basic
|088A03| LDY.w $0C72,X

|088A06| LDA.w $0BFA,X
|088A09| CLC
|088A0A| ADC.w Ancilla_TileCollisionBehaviorClass1.offset_y,Y
|088A0D| STA.b $00

|088A0F| LDA.w $0C0E,X
|088A12| ADC.b #$00
|088A14| STA.b $01

|088A16| LDA.w $0C04,X
|088A19| CLC
|088A1A| ADC.w Ancilla_TileCollisionBehaviorClass1.offset_x,Y
|088A1D| STA.b $02

|088A1F| LDA.w $0C18,X
|088A22| ADC.b #$00
|088A24| STA.b $03

;===================================================================================================

Ancilla_CheckTileCollision_targeted:
|088A26| REP #$20

|088A28| LDA.b $00
|088A2A| SEC
|088A2B| SBC.b $E8
|088A2D| CMP.w #$00E0

|088A30| SEP #$20
|088A32| BCS .off_screen_y

;---------------------------------------------------------------------------------------------------

|088A34| REP #$20

|088A36| LDA.b $02
|088A38| SEC
|088A39| SBC.b $E2
|088A3B| CMP.w #$0100

|088A3E| SEP #$20
|088A40| BCS .no_collision

|088A42| LDA.b $1B
|088A44| BNE .indoors

;---------------------------------------------------------------------------------------------------

|088A46| REP #$20

|088A48| LSR.b $02
|088A4A| LSR.b $02
|088A4C| LSR.b $02

|088A4E| PHX
|088A4F| JSL GetOverworldTileType
|088A53| PLX

|088A54| BRA .continue

;---------------------------------------------------------------------------------------------------

.indoors
|088A56| LDA.w $0C7C,X
|088A59| JSL GetTileType_long

;---------------------------------------------------------------------------------------------------

.continue
|088A5D| STA.w $03E4,X

|088A60| TAY

|088A61| LDA.w Ancilla_TileCollisionBehaviorClass1.interaction,Y
|088A64| STA.b $0F

|088A66| LDA.w $0C4A,X
|088A69| CMP.b #$02 ; ANCILLA 02
|088A6B| BNE .no_firetorch

|088A6D| TYA
|088A6E| AND.b #$F0
|088A70| CMP.b #$C0
|088A72| BNE .no_firetorch

|088A74| STZ.b $0F

;---------------------------------------------------------------------------------------------------

.no_firetorch
|088A76| LDA.w $0280,X
|088A79| BNE .high_pri

|088A7B| LDA.b $0F
|088A7D| BEQ .no_collision

|088A7F| CMP.b #$01
|088A81| BEQ .collision

|088A83| CMP.b #$02
|088A85| BNE .not_slope

|088A87| JSL CheckSlopedTileCollision_long

|088A8B| RTS

;---------------------------------------------------------------------------------------------------

.not_slope
|088A8C| CMP.b #$03
|088A8E| BNE .high_pri

|088A90| LDY.w $03CA,X
|088A93| BNE .collision

.off_screen_y
|088A95| BRA .no_collision

;---------------------------------------------------------------------------------------------------

.high_pri
|088A97| DEC.w $028A,X
|088A9A| BPL .no_collision

|088A9C| STZ.w $028A,X

|088A9F| LDA.b $0F
|088AA1| CMP.b #$04
|088AA3| BNE .no_collision

|088AA5| LDA.b #$06
|088AA7| STA.w $028A,X

|088AAA| LDA.w $0280,X
|088AAD| EOR.b #$01
|088AAF| STA.w $0280,X

|088AB2| BRA .no_collision

;---------------------------------------------------------------------------------------------------

.no_collision
|088AB4| CLC

|088AB5| RTS

;---------------------------------------------------------------------------------------------------

.collision
|088AB6| LDY.b #$00

|088AB8| SEC

;===================================================================================================

AlertSprites:
|088AB9| LDA.b #$03
|088ABB| STA.w $0FDC

|088ABE| RTS

;===================================================================================================

Ancilla_TileCollisionBehaviorClass2:

.interaction
|088ABF| db $00 ; 00
|088AC0| db $01 ; 01
|088AC1| db $00 ; 02
|088AC2| db $00 ; 03
|088AC3| db $01 ; 04
|088AC4| db $00 ; 05
|088AC5| db $00 ; 06
|088AC6| db $00 ; 07
|088AC7| db $00 ; 08
|088AC8| db $00 ; 09
|088AC9| db $03 ; 0A
|088ACA| db $00 ; 0B
|088ACB| db $00 ; 0C
|088ACC| db $00 ; 0D
|088ACD| db $00 ; 0E
|088ACE| db $00 ; 0F
|088ACF| db $01 ; 10
|088AD0| db $01 ; 11
|088AD1| db $01 ; 12
|088AD2| db $01 ; 13
|088AD3| db $00 ; 14
|088AD4| db $00 ; 15
|088AD5| db $00 ; 16
|088AD6| db $00 ; 17
|088AD7| db $02 ; 18
|088AD8| db $02 ; 19
|088AD9| db $02 ; 1A
|088ADA| db $02 ; 1B
|088ADB| db $00 ; 1C
|088ADC| db $03 ; 1D
|088ADD| db $03 ; 1E
|088ADE| db $03 ; 1F
|088ADF| db $00 ; 20
|088AE0| db $00 ; 21
|088AE1| db $00 ; 22
|088AE2| db $00 ; 23
|088AE3| db $00 ; 24
|088AE4| db $00 ; 25
|088AE5| db $01 ; 26
|088AE6| db $01 ; 27
|088AE7| db $04 ; 28
|088AE8| db $04 ; 29
|088AE9| db $04 ; 2A
|088AEA| db $04 ; 2B
|088AEB| db $04 ; 2C
|088AEC| db $04 ; 2D
|088AED| db $04 ; 2E
|088AEE| db $04 ; 2F
|088AEF| db $01 ; 30
|088AF0| db $01 ; 31
|088AF1| db $01 ; 32
|088AF2| db $01 ; 33
|088AF3| db $01 ; 34
|088AF4| db $01 ; 35
|088AF5| db $01 ; 36
|088AF6| db $01 ; 37
|088AF7| db $00 ; 38
|088AF8| db $00 ; 39
|088AF9| db $00 ; 3A
|088AFA| db $00 ; 3B
|088AFB| db $00 ; 3C
|088AFC| db $03 ; 3D
|088AFD| db $03 ; 3E
|088AFE| db $03 ; 3F
|088AFF| db $00 ; 40
|088B00| db $00 ; 41
|088B01| db $00 ; 42
|088B02| db $01 ; 43
|088B03| db $00 ; 44
|088B04| db $00 ; 45
|088B05| db $00 ; 46
|088B06| db $00 ; 47
|088B07| db $00 ; 48
|088B08| db $00 ; 49
|088B09| db $00 ; 4A
|088B0A| db $00 ; 4B
|088B0B| db $04 ; 4C
|088B0C| db $04 ; 4D
|088B0D| db $04 ; 4E
|088B0E| db $04 ; 4F
|088B0F| db $00 ; 50
|088B10| db $00 ; 51
|088B11| db $00 ; 52
|088B12| db $00 ; 53
|088B13| db $00 ; 54
|088B14| db $00 ; 55
|088B15| db $00 ; 56
|088B16| db $00 ; 57
|088B17| db $00 ; 58
|088B18| db $00 ; 59
|088B19| db $00 ; 5A
|088B1A| db $00 ; 5B
|088B1B| db $00 ; 5C
|088B1C| db $00 ; 5D
|088B1D| db $00 ; 5E
|088B1E| db $00 ; 5F
|088B1F| db $00 ; 60
|088B20| db $00 ; 61
|088B21| db $00 ; 62
|088B22| db $00 ; 63
|088B23| db $00 ; 64
|088B24| db $00 ; 65
|088B25| db $00 ; 66
|088B26| db $00 ; 67
|088B27| db $00 ; 68
|088B28| db $00 ; 69
|088B29| db $00 ; 6A
|088B2A| db $00 ; 6B
|088B2B| db $01 ; 6C
|088B2C| db $01 ; 6D
|088B2D| db $01 ; 6E
|088B2E| db $01 ; 6F
|088B2F| db $00 ; 70
|088B30| db $00 ; 71
|088B31| db $00 ; 72
|088B32| db $00 ; 73
|088B33| db $00 ; 74
|088B34| db $00 ; 75
|088B35| db $00 ; 76
|088B36| db $00 ; 77
|088B37| db $00 ; 78
|088B38| db $00 ; 79
|088B39| db $00 ; 7A
|088B3A| db $00 ; 7B
|088B3B| db $00 ; 7C
|088B3C| db $00 ; 7D
|088B3D| db $00 ; 7E
|088B3E| db $00 ; 7F
|088B3F| db $01 ; 80
|088B40| db $01 ; 81
|088B41| db $01 ; 82
|088B42| db $01 ; 83
|088B43| db $01 ; 84
|088B44| db $01 ; 85
|088B45| db $01 ; 86
|088B46| db $01 ; 87
|088B47| db $01 ; 88
|088B48| db $01 ; 89
|088B49| db $01 ; 8A
|088B4A| db $01 ; 8B
|088B4B| db $01 ; 8C
|088B4C| db $01 ; 8D
|088B4D| db $00 ; 8E
|088B4E| db $01 ; 8F
|088B4F| db $01 ; 90
|088B50| db $01 ; 91
|088B51| db $01 ; 92
|088B52| db $01 ; 93
|088B53| db $01 ; 94
|088B54| db $01 ; 95
|088B55| db $01 ; 96
|088B56| db $01 ; 97
|088B57| db $01 ; 98
|088B58| db $01 ; 99
|088B59| db $01 ; 9A
|088B5A| db $01 ; 9B
|088B5B| db $01 ; 9C
|088B5C| db $01 ; 9D
|088B5D| db $01 ; 9E
|088B5E| db $01 ; 9F
|088B5F| db $01 ; A0
|088B60| db $01 ; A1
|088B61| db $01 ; A2
|088B62| db $01 ; A3
|088B63| db $01 ; A4
|088B64| db $01 ; A5
|088B65| db $01 ; A6
|088B66| db $01 ; A7
|088B67| db $01 ; A8
|088B68| db $01 ; A9
|088B69| db $01 ; AA
|088B6A| db $01 ; AB
|088B6B| db $01 ; AC
|088B6C| db $01 ; AD
|088B6D| db $01 ; AE
|088B6E| db $01 ; AF
|088B6F| db $00 ; B0
|088B70| db $00 ; B1
|088B71| db $00 ; B2
|088B72| db $00 ; B3
|088B73| db $00 ; B4
|088B74| db $00 ; B5
|088B75| db $00 ; B6
|088B76| db $00 ; B7
|088B77| db $00 ; B8
|088B78| db $00 ; B9
|088B79| db $00 ; BA
|088B7A| db $00 ; BB
|088B7B| db $00 ; BC
|088B7C| db $00 ; BD
|088B7D| db $00 ; BE
|088B7E| db $00 ; BF
|088B7F| db $00 ; C0
|088B80| db $00 ; C1
|088B81| db $00 ; C2
|088B82| db $00 ; C3
|088B83| db $00 ; C4
|088B84| db $00 ; C5
|088B85| db $00 ; C6
|088B86| db $00 ; C7
|088B87| db $00 ; C8
|088B88| db $00 ; C9
|088B89| db $00 ; CA
|088B8A| db $00 ; CB
|088B8B| db $00 ; CC
|088B8C| db $00 ; CD
|088B8D| db $00 ; CE
|088B8E| db $00 ; CF
|088B8F| db $00 ; D0
|088B90| db $00 ; D1
|088B91| db $00 ; D2
|088B92| db $00 ; D3
|088B93| db $00 ; D4
|088B94| db $00 ; D5
|088B95| db $00 ; D6
|088B96| db $00 ; D7
|088B97| db $00 ; D8
|088B98| db $00 ; D9
|088B99| db $00 ; DA
|088B9A| db $00 ; DB
|088B9B| db $00 ; DC
|088B9C| db $00 ; DD
|088B9D| db $00 ; DE
|088B9E| db $00 ; DF
|088B9F| db $00 ; E0
|088BA0| db $00 ; E1
|088BA1| db $00 ; E2
|088BA2| db $00 ; E3
|088BA3| db $00 ; E4
|088BA4| db $00 ; E5
|088BA5| db $00 ; E6
|088BA6| db $00 ; E7
|088BA7| db $00 ; E8
|088BA8| db $00 ; E9
|088BA9| db $00 ; EA
|088BAA| db $00 ; EB
|088BAB| db $00 ; EC
|088BAC| db $00 ; ED
|088BAD| db $00 ; EE
|088BAE| db $00 ; EF
|088BAF| db $01 ; F0
|088BB0| db $01 ; F1
|088BB1| db $01 ; F2
|088BB2| db $01 ; F3
|088BB3| db $01 ; F4
|088BB4| db $01 ; F5
|088BB5| db $01 ; F6
|088BB6| db $01 ; F7
|088BB7| db $01 ; F8
|088BB8| db $01 ; F9
|088BB9| db $01 ; FA
|088BBA| db $01 ; FB
|088BBB| db $01 ; FC
|088BBC| db $01 ; FD
|088BBD| db $01 ; FE
|088BBE| db $01 ; FF

;---------------------------------------------------------------------------------------------------

.offset_y_low
|088BBF| db  -8,   8,   0,   0

.offset_y_high
|088BC3| db  -1,   0,   0,   0

.offset_x_low
|088BC7| db   0,   0,  -8,   8

.offset_x_high
|088BCB| db   0,   0,  -1,   0

;===================================================================================================

Ancilla_CheckTileCollision_Class2:
|088BCF| LDA.w $046C
|088BD2| BEQ .check_basic

|088BD4| CMP.b #$03

|088BD6| REP #$20
|088BD8| BCC .get_bg_diff

|088BDA| STZ.b $00
|088BDC| STZ.b $02

|088BDE| BRA .both_bg

;---------------------------------------------------------------------------------------------------

.get_bg_diff
|088BE0| LDA.b $E0
|088BE2| SEC
|088BE3| SBC.b $E2
|088BE5| STA.b $00

|088BE7| LDA.b $E6
|088BE9| SEC
|088BEA| SBC.b $E8
|088BEC| STA.b $02

;---------------------------------------------------------------------------------------------------

.both_bg
|088BEE| SEP #$20

|088BF0| LDA.w $0C04,X
|088BF3| PHA

|088BF4| CLC
|088BF5| ADC.b $00
|088BF7| STA.w $0C04,X

|088BFA| LDA.w $0C18,X
|088BFD| PHA

|088BFE| ADC.b $01
|088C00| STA.w $0C18,X

|088C03| LDA.w $0BFA,X
|088C06| PHA

|088C07| CLC
|088C08| ADC.b $02
|088C0A| STA.w $0BFA,X

|088C0D| LDA.w $0C0E,X
|088C10| PHA

|088C11| ADC.b $03
|088C13| STA.w $0C0E,X

|088C16| LDA.b #$01
|088C18| STA.w $0C7C,X

|088C1B| JSR .check_basic

;---------------------------------------------------------------------------------------------------

|088C1E| STZ.w $0C7C,X

|088C21| PLA
|088C22| STA.w $0C0E,X

|088C25| PLA
|088C26| STA.w $0BFA,X

|088C29| PLA
|088C2A| STA.w $0C18,X

|088C2D| PLA
|088C2E| STA.w $0C04,X

;---------------------------------------------------------------------------------------------------

|088C31| LDY.b #$00
|088C33| BCC .skip_layer1

|088C35| INY

.skip_layer1
|088C36| PHY
|088C37| PHP

|088C38| JSR .check_basic

|088C3B| PLA
|088C3C| AND.b #$01
|088C3E| ROL A
|088C3F| CMP.b #$01

|088C41| PLY

|088C42| RTS

;---------------------------------------------------------------------------------------------------

.check_basic
|088C43| LDY.w $0C72,X

|088C46| LDA.w $0BFA,X
|088C49| CLC
|088C4A| ADC.w Ancilla_TileCollisionBehaviorClass2.offset_y_low,Y
|088C4D| STA.b $00

|088C4F| LDA.w $0C0E,X
|088C52| ADC.w Ancilla_TileCollisionBehaviorClass2.offset_y_high,Y
|088C55| STA.b $01

|088C57| LDA.w $0C04,X
|088C5A| CLC
|088C5B| ADC.w Ancilla_TileCollisionBehaviorClass2.offset_x_low,Y
|088C5E| STA.b $02

|088C60| LDA.w $0C18,X
|088C63| ADC.w Ancilla_TileCollisionBehaviorClass2.offset_x_high,Y
|088C66| STA.b $03

|088C68| REP #$20

|088C6A| LDA.b $00
|088C6C| SEC
|088C6D| SBC.b $E8
|088C6F| CMP.w #$00E0

|088C72| SEP #$20
|088C74| BCS .no_collision

;---------------------------------------------------------------------------------------------------

|088C76| REP #$20

|088C78| LDA.b $02
|088C7A| SEC
|088C7B| SBC.b $E2
|088C7D| CMP.w #$0100

|088C80| SEP #$20
|088C82| BCS .no_collision

|088C84| LDA.b $1B
|088C86| BNE .check_indoors

;---------------------------------------------------------------------------------------------------

|088C88| REP #$20

|088C8A| LSR.b $02
|088C8C| LSR.b $02
|088C8E| LSR.b $02

|088C90| PHX
|088C91| JSL GetOverworldTileType
|088C95| PLX

|088C96| BRA .save_tile

;---------------------------------------------------------------------------------------------------

.check_indoors
|088C98| LDA.w $0C7C,X
|088C9B| JSL GetTileType_long

;---------------------------------------------------------------------------------------------------

.save_tile
|088C9F| STA.w $03E4,X

|088CA2| CMP.b #$03 ; TILETYPE 03
|088CA4| BNE .not_slope3

|088CA6| LDY.w $03CA,X
|088CA9| BNE .no_collision

.not_slope3
|088CAB| TAY

|088CAC| LDA.w Ancilla_TileCollisionBehaviorClass2.interaction,Y
|088CAF| BEQ .no_collision

|088CB1| CMP.b #$02
|088CB3| BNE .not_a_slope

|088CB5| JSL CheckSlopedTileCollision_long

|088CB9| RTS

;---------------------------------------------------------------------------------------------------

.not_a_slope
|088CBA| CMP.b #$04
|088CBC| BNE .not_a_ledge

|088CBE| LDA.w $03CA,X
|088CC1| BNE .collision

|088CC3| LDA.b #$01
|088CC5| STA.w $0280,X

|088CC8| BRA .no_collision

;---------------------------------------------------------------------------------------------------

.not_a_ledge
|088CCA| CMP.b #$03
|088CCC| BNE .collision

|088CCE| LDY.w $03CA,X
|088CD1| BNE .collision

;---------------------------------------------------------------------------------------------------

.no_collision
|088CD3| CLC

|088CD4| RTS

;---------------------------------------------------------------------------------------------------

.collision
|088CD5| LDY.b #$00

|088CD7| SEC

|088CD8| RTS

;===================================================================================================

pool Ancilla04_BeamHit

.offset_x
|088CD9| db -12,  20, -12,  20
|088CDD| db  -8,  16,  -8,  16
|088CE1| db  -4,  12,  -4,  12
|088CE5| db   0,   8,   0,   8

.offset_y
|088CE9| db -12, -12,  20,  20
|088CED| db  -8,  -8,  16,  16
|088CF1| db  -4,  -4,  12,  12
|088CF5| db   0,   0,   8,   8

.char
|088CF9| db $53, $53, $53, $53
|088CFD| db $53, $53, $53, $53
|088D01| db $53, $53, $53, $53
|088D05| db $54, $54, $54, $54

.props
|088D09| db $40, $00, $C0, $80
|088D0D| db $40, $00, $C0, $80
|088D11| db $40, $00, $C0, $80
|088D15| db $00, $40, $80, $C0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla04_BeamHit:
|088D19| JSR Ancilla_KillOffscreen

|088D1C| LDA.w $0C68,X
|088D1F| BNE .active

|088D21| BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

.active
|088D24| LSR A
|088D25| STA.b $02

|088D27| LDX.b #$03
|088D29| LDY.b #$00

.next_object
|088D2B| STX.b $03

|088D2D| LDA.b $02
|088D2F| ASL A
|088D30| ASL A
|088D31| ADC.b $03
|088D33| TAX

|088D34| LDA.b $00
|088D36| CLC
|088D37| ADC.w .offset_x,X
|088D3A| STA.b ($90),Y

|088D3C| LDA.b $01
|088D3E| CLC
|088D3F| ADC.w .offset_y,X
|088D42| INY
|088D43| STA.b ($90),Y

|088D45| LDA.w .char,X
|088D48| CLC
|088D49| ADC.b #$82
|088D4B| INY
|088D4C| STA.b ($90),Y

|088D4E| LDA.w .props,X
|088D51| ORA.b #$02
|088D53| ORA.b $04
|088D55| INY
|088D56| STA.b ($90),Y

|088D58| INY

|088D59| LDX.b $03
|088D5B| DEX
|088D5C| BPL .next_object

;---------------------------------------------------------------------------------------------------

|088D5E| LDX.w $0FA0
|088D61| LDY.b #$00
|088D63| LDA.b #$03
|088D65| BRL BeamHit_OAMAdjustments

;===================================================================================================

Ancilla_CheckSpriteCollision:
|088D68| LDY.b #$0F

.next_sprite
|088D6A| LDA.w $0C4A,X
|088D6D| CMP.b #$09 ; ANCILLA 09
|088D6F| BEQ .arrow_or_hook

|088D71| CMP.b #$1F ; ANCILLA 1F
|088D73| BEQ .arrow_or_hook

|088D75| TYA
|088D76| EOR.b $1A
|088D78| AND.b #$03
|088D7A| ORA.w $0F00,Y
|088D7D| BNE .skip

.arrow_or_hook
|088D7F| LDA.w $0DD0,Y
|088D82| CMP.b #$09
|088D84| BCC .skip

|088D86| LDA.w $0CAA,Y
|088D89| AND.b #$02
|088D8B| BNE .ignore_priority

|088D8D| LDA.w $0280,X
|088D90| BNE .skip

.ignore_priority
|088D92| LDA.w $0C7C,X
|088D95| CMP.w $0F20,Y
|088D98| BNE .skip

|088D9A| JSR Ancilla_CheckSpriteCollision_Single

.skip
|088D9D| DEY
|088D9E| BPL .next_sprite

|088DA0| CLC

|088DA1| RTS

;===================================================================================================

Ancilla_CheckSpriteCollision_long:
|088DA2| PHB
|088DA3| PHK
|088DA4| PLB

|088DA5| JSR Ancilla_CheckSpriteCollision

|088DA8| PLB

|088DA9| RTL

;---------------------------------------------------------------------------------------------------

pool Ancilla_CheckSpriteCollision_Single

.direction
|088DAA| db $02, $03, $00, $01

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_CheckSpriteCollision_Single:
|088DAE| JSR Ancilla_SetupHitbox

|088DB1| PHY
|088DB2| PHX

|088DB3| TYX
|088DB4| JSL SetupSpriteHitbox_long

|088DB8| PLX
|088DB9| PLY

|088DBA| JSL CheckIfHitboxesOverlap_long
|088DBE| BCS .hitbox_overlap

|088DC0| JMP.w .no_collision

;---------------------------------------------------------------------------------------------------

.hitbox_overlap
|088DC3| LDA.w $0B6B,Y
|088DC6| AND.b #$08
|088DC8| BEQ .arrow_continue

|088DCA| LDA.w $0C4A,X
|088DCD| CMP.b #$09 ; ANCILLA 09
|088DCF| BNE .arrow_continue

|088DD1| LDA.w $0E20,Y
|088DD4| CMP.b #$1B ; SPRITE 1B
|088DD6| BEQ .arrow_v_arrow

.deflected_arrow
|088DD8| JSL CreateDeflectedArrow

|088DDC| CLC

|088DDD| RTS

;---------------------------------------------------------------------------------------------------

.arrow_v_arrow
|088DDE| LDA.l $7EF340
|088DE2| CMP.b #$03
|088DE4| BCC .not_silvers

|088DE6| JSR .arrow_continue

|088DE9| CLC

|088DEA| RTS

;---------------------------------------------------------------------------------------------------

.not_silvers
|088DEB| JSR .deflected_arrow

;---------------------------------------------------------------------------------------------------

.arrow_continue
|088DEE| LDA.w $0CAA,Y
|088DF1| AND.b #$10
|088DF3| BEQ .no_succ

|088DF5| LDA.w $0C72,X
|088DF8| AND.b #$03
|088DFA| STA.w $0C72,X

|088DFD| PHY

|088DFE| LDA.w $0DE0,Y
|088E01| TAY

|088E02| LDA.w .direction,Y

|088E05| PLY

|088E06| CMP.w $0C72,X
|088E09| BEQ .immunity

;---------------------------------------------------------------------------------------------------

.no_succ
|088E0B| LDA.w $0C4A,X
|088E0E| CMP.b #$05 ; ANCILLA 05
|088E10| BEQ .boom

|088E12| CMP.b #$1F ; ANCILLA 1F
|088E14| BNE .continue_b

|088E16| LDA.w $0E20,Y
|088E19| CMP.b #$8D ; SPRITE 8D
|088E1B| BEQ .arrghus_puff

.boom
|088E1D| LDA.w $0EF0,Y
|088E20| BNE .immunity

|088E22| LDA.w $0CAA,Y
|088E25| AND.b #$02
|088E27| BEQ .continue_b

.arrghus_puff
|088E29| TXA
|088E2A| INC A
|088E2B| STA.w $0DA0,Y

|088E2E| BRA .set_drag

;---------------------------------------------------------------------------------------------------

.continue_b
|088E30| LDA.w $0BA0,Y
|088E33| BNE .no_collision

|088E35| LDA.w $0E20,Y
|088E38| CMP.b #$92 ; SPRITE 92
|088E3A| BNE .not_helma_mask

|088E3C| LDA.w $0DB0,Y
|088E3F| CMP.b #$03
|088E41| BCC .immunity

.not_helma_mask
|088E43| PHX

|088E44| LDA.w $0C72,X
|088E47| AND.b #$03
|088E49| TAX

|088E4A| LDA.w .recoil_x,X
|088E4D| STA.w $0F40,Y

|088E50| LDA.w .recoil_y,X
|088E53| STA.w $0F30,Y

|088E56| PLX
|088E57| PHX

|088E58| LDA.w $0C4A,X

|088E5B| STX.w $0FB6

|088E5E| TYX

|088E5F| PHY

|088E60| JSL CheckAncillaDamageToSprite

|088E64| PLY
|088E65| PLX

.set_drag
|088E66| LDA.w $0C4A,X
|088E69| STA.w $0BB0,Y

.immunity
|088E6C| PLA
|088E6D| PLA

|088E6E| JSR AlertSprites

|088E71| SEC

|088E72| RTS

;---------------------------------------------------------------------------------------------------

.no_collision
|088E73| CLC

|088E74| RTS

;---------------------------------------------------------------------------------------------------

.recoil_x
|088E75| db   0,   0, -64,  64

.recoil_y
|088E79| db -64,  64,   0,   0

;===================================================================================================

AncillaHitbox:

.offset_x
|088E7D| db   4
|088E7E| db   4
|088E7F| db   4
|088E80| db   4
|088E81| db   3
|088E82| db   3
|088E83| db   2
|088E84| db  11
|088E85| db -16
|088E86| db -16
|088E87| db  -1
|088E88| db  -8

;---------------------------------------------------------------------------------------------------

.width
|088E89| db   8
|088E8A| db   8
|088E8B| db   8
|088E8C| db   8
|088E8D| db   1
|088E8E| db   1
|088E8F| db   1
|088E90| db   1
|088E91| db  32
|088E92| db  32
|088E93| db   8
|088E94| db   8

;---------------------------------------------------------------------------------------------------

.offset_y
|088E95| db   4
|088E96| db   4
|088E97| db   4
|088E98| db   4
|088E99| db   2
|088E9A| db  11
|088E9B| db   3
|088E9C| db   3
|088E9D| db  -1
|088E9E| db  -8
|088E9F| db -16
|088EA0| db -16

;---------------------------------------------------------------------------------------------------

.height
|088EA1| db   8
|088EA2| db   8
|088EA3| db   8
|088EA4| db   8
|088EA5| db   1
|088EA6| db   1
|088EA7| db   1
|088EA8| db   1
|088EA9| db   8
|088EAA| db   8
|088EAB| db  32
|088EAC| db  32

;===================================================================================================

Ancilla_SetupHitbox:
|088EAD| STZ.b $09

|088EAF| PHY

|088EB0| LDY.w $0C72,X

|088EB3| LDA.w $0C4A,X
|088EB6| CMP.b #$0C ; ANCILLA 0C
|088EB8| BNE .not_beam

|088EBA| DEC.b $09

|088EBC| TYA
|088EBD| ORA.b #$08
|088EBF| TAY

.not_beam
|088EC0| LDA.w $0C04,X
|088EC3| CLC
|088EC4| ADC.w AncillaHitbox.offset_x,Y
|088EC7| STA.b $00

|088EC9| LDA.w $0C18,X
|088ECC| ADC.b $09
|088ECE| STA.b $08

|088ED0| LDA.w $0BFA,X
|088ED3| CLC
|088ED4| ADC.w AncillaHitbox.offset_y,Y
|088ED7| STA.b $01

|088ED9| LDA.w $0C0E,X
|088EDC| ADC.b $09
|088EDE| STA.b $09

|088EE0| LDA.w AncillaHitbox.width,Y
|088EE3| STA.b $02

|088EE5| LDA.w AncillaHitbox.height,Y
|088EE8| STA.b $03

|088EEA| PLY

|088EEB| RTS

;===================================================================================================

UNREACHABLE_088EEC:
|088EEC| RTS

;===================================================================================================

ProjectAncillaSpeedTowardsLink:
|088EED| STA.b $01

|088EEF| PHX
|088EF0| PHY

|088EF1| JSR GetAncillaYDisplacement
|088EF4| STY.b $02

|088EF6| LDA.b $0E
|088EF8| BPL .positive_y

|088EFA| EOR.b #$FF
|088EFC| INC A

.positive_y
|088EFD| STA.b $0C

|088EFF| JSR GetAncillaXDisplacement
|088F02| STY.b $03

|088F04| LDA.b $0F
|088F06| BPL .positive_x

|088F08| EOR.b #$FF
|088F0A| INC A

.positive_x
|088F0B| STA.b $0D

;---------------------------------------------------------------------------------------------------

|088F0D| LDY.b #$00

|088F0F| LDA.b $0D
|088F11| CMP.b $0C
|088F13| BCS .x_bigger

|088F15| INY
|088F16| PHA

|088F17| LDA.b $0C
|088F19| STA.b $0D

|088F1B| PLA
|088F1C| STA.b $0C

.x_bigger
|088F1E| STZ.b $0B
|088F20| STZ.b $00

;---------------------------------------------------------------------------------------------------

|088F22| LDX.b $01

.stupid_algo
|088F24| LDA.b $0B
|088F26| CLC
|088F27| ADC.b $0C

|088F29| CMP.b $0D
|088F2B| BCC .keep_dumbing

|088F2D| SBC.b $0D
|088F2F| INC.b $00

.keep_dumbing
|088F31| STA.b $0B

|088F33| DEX
|088F34| BNE .stupid_algo

;---------------------------------------------------------------------------------------------------

|088F36| TYA
|088F37| BEQ .x_bigger_again

|088F39| LDA.b $00
|088F3B| PHA

|088F3C| LDA.b $01
|088F3E| STA.b $00

|088F40| PLA
|088F41| STA.b $01

.x_bigger_again
|088F43| LDA.b $00

|088F45| LDY.b $02
|088F47| BEQ .y_fine

|088F49| EOR.b #$FF
|088F4B| INC A
|088F4C| STA.b $00

.y_fine
|088F4E| LDA.b $01
|088F50| LDY.b $03
|088F52| BEQ .x_fine

|088F54| EOR.b #$FF
|088F56| INC A
|088F57| STA.b $01

.x_fine
|088F59| PLY
|088F5A| PLX

|088F5B| RTS

;===================================================================================================

GetAncillaXDisplacement:
|088F5C| LDY.b #$00

|088F5E| LDA.b $22
|088F60| SEC
|088F61| SBC.w $0C04,X
|088F64| STA.b $0F

|088F66| LDA.b $23
|088F68| SBC.w $0C18,X
|088F6B| BPL .no_left

|088F6D| INY

.no_left
|088F6E| RTS

;===================================================================================================

GetAncillaYDisplacement:
|088F6F| LDY.b #$00

|088F71| LDA.b $20
|088F73| SEC
|088F74| SBC.w $0BFA,X
|088F77| STA.b $0E

|088F79| LDA.b $21
|088F7B| SBC.w $0C0E,X
|088F7E| BPL EXIT_088F81

|088F80| INY

;---------------------------------------------------------------------------------------------------

#EXIT_088F81:
|088F81| RTS

;===================================================================================================

pool WeaponTink

.char
|088F82| db $93, $82, $81

.props
|088F85| db $22, $12, $22, $22

endpool

;---------------------------------------------------------------------------------------------------

WeaponTink:
|088F89| LDA.w $0FAC
|088F8C| BEQ EXIT_088F81

|088F8E| LDA.b #$02
|088F90| STA.w $0FDC

|088F93| DEC.w $0FAF
|088F96| BPL .keep_state

|088F98| DEC.w $0FAC

|088F9B| LDA.b #$01
|088F9D| STA.w $0FAF

.keep_state
|088FA0| LDA.b #$10

|088FA2| LDY.w $0FB3
|088FA5| BEQ .ignore_layer

|088FA7| LDY.w $0B68
|088FAA| BNE .bg1

|088FAC| JSL AllocateOAMInRegionD
|088FB0| BRA .screen_check

.bg1
|088FB2| JSL AllocateOAMInRegionF
|088FB6| BRA .screen_check

.ignore_layer
|088FB8| JSL AllocateOAMInRegionA

;---------------------------------------------------------------------------------------------------

.screen_check
|088FBC| LDA.w $0FAD
|088FBF| SEC
|088FC0| SBC.w $00E2

|088FC3| CMP.b #$F8
|088FC5| BCS .offscreen

|088FC7| STA.b $00

|088FC9| LDA.w $0FAE
|088FCC| SEC
|088FCD| SBC.w $00E8

|088FD0| CMP.b #$F0
|088FD2| BCS .offscreen

|088FD4| STA.b $01

|088FD6| LDA.w $0FAC
|088FD9| CMP.b #$03
|088FDB| BCC .late_stage

|088FDD| LDY.b #$00

|088FDF| LDA.b $00
|088FE1| STA.b ($90),Y

|088FE3| LDA.b $01
|088FE5| INY
|088FE6| STA.b ($90),Y

|088FE8| LDA.b #$80

|088FEA| LDX.w $0FAC
|088FED| CPX.b #$09
|088FEF| BCS .diff_chr

|088FF1| LDA.b #$92

.diff_chr
|088FF3| INY
|088FF4| STA.b ($90),Y

|088FF6| LDX.w $0B68

|088FF9| LDA.l .props,X
|088FFD| INY
|088FFE| STA.b ($90),Y

|089000| TYA
|089001| LSR A
|089002| LSR A
|089003| TAY

|089004| LDA.b #$00
|089006| STA.b ($92),Y

|089008| RTS

.offscreen
|089009| STZ.w $0FAC

|08900C| RTS

;---------------------------------------------------------------------------------------------------

.late_stage
|08900D| LDA.b $00
|08900F| SEC
|089010| SBC.b #$04

|089012| LDY.b #$00
|089014| STA.b ($90),Y

|089016| LDY.b #$08
|089018| STA.b ($90),Y

|08901A| CLC
|08901B| ADC.b #$08

|08901D| LDY.b #$04
|08901F| STA.b ($90),Y

|089021| LDY.b #$0C
|089023| STA.b ($90),Y

|089025| LDA.b $01
|089027| SEC
|089028| SBC.b #$04

|08902A| LDY.b #$01
|08902C| STA.b ($90),Y

|08902E| LDY.b #$05
|089030| STA.b ($90),Y

|089032| CLC
|089033| ADC.b #$08

|089035| LDY.b #$09
|089037| STA.b ($90),Y

|089039| LDY.b #$0D
|08903B| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

|08903D| LDX.w $0B68

|089040| LDA.l .props,X
|089044| LDY.b #$03
|089046| STA.b ($90),Y

|089048| ORA.b #$40
|08904A| LDY.b #$07
|08904C| STA.b ($90),Y

|08904E| ORA.b #$80
|089050| LDY.b #$0F
|089052| STA.b ($90),Y

|089054| EOR.b #$40
|089056| LDY.b #$0B
|089058| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

|08905A| LDX.w $0FAC

|08905D| LDA.w .char,X
|089060| LDY.b #$02
|089062| STA.b ($90),Y

|089064| LDY.b #$06
|089066| STA.b ($90),Y

|089068| LDY.b #$0A
|08906A| STA.b ($90),Y

|08906C| LDY.b #$0E
|08906E| STA.b ($90),Y

|089070| LDY.b #$00
|089072| LDA.b #$00
|089074| STA.b ($92),Y

|089076| INY
|089077| STA.b ($92),Y

|089079| INY
|08907A| STA.b ($92),Y

|08907C| INY
|08907D| STA.b ($92),Y

|08907F| RTS

;===================================================================================================

AncillaMoveX:
|089080| TXA
|089081| CLC
|089082| ADC.b #$0A
|089084| TAX

|089085| JSR AncillaMoveY

|089088| BRL Ancilla_RestoreIndex

;---------------------------------------------------------------------------------------------------

AncillaMoveY:
|08908B| LDA.w $0C22,X

|08908E| ASL A
|08908F| ASL A
|089090| ASL A
|089091| ASL A

|089092| CLC
|089093| ADC.w $0C36,X
|089096| STA.w $0C36,X

|089099| LDY.b #$00

|08909B| LDA.w $0C22,X
|08909E| PHP

|08909F| LSR A
|0890A0| LSR A
|0890A1| LSR A
|0890A2| LSR A

|0890A3| PLP
|0890A4| BPL .other_way

|0890A6| ORA.b #$F0
|0890A8| DEY

.other_way
|0890A9| ADC.w $0BFA,X
|0890AC| STA.w $0BFA,X

|0890AF| TYA
|0890B0| ADC.w $0C0E,X
|0890B3| STA.w $0C0E,X

|0890B6| RTS

;===================================================================================================

AncillaMoveZ:
|0890B7| LDA.w $0294,X

|0890BA| ASL A
|0890BB| ASL A
|0890BC| ASL A
|0890BD| ASL A

|0890BE| CLC
|0890BF| ADC.w $02A8,X
|0890C2| STA.w $02A8,X

|0890C5| LDY.b #$00

|0890C7| LDA.w $0294,X
|0890CA| PHP

|0890CB| LSR A
|0890CC| LSR A
|0890CD| LSR A
|0890CE| LSR A

|0890CF| PLP
|0890D0| BPL .other_way

|0890D2| ORA.b #$F0
|0890D4| DEY

.other_way
|0890D5| ADC.w $029E,X
|0890D8| STA.w $029E,X

|0890DB| RTS

;===================================================================================================

pool Ancilla05_Boomerang

.offset_y
|0890DC| dw -16,   6,   0,   0
|0890E4| dw  -8,   8,  -8,   8

.offset_x
|0890EC| dw   0,   0,  -8,   8
|0890F4| dw   8,   8,  -8,  -8

endpool

;---------------------------------------------------------------------------------------------------

Ancilla05_Boomerang:
|0890FC| LDY.b #$04

.next_slot
|0890FE| LDA.w $0C4A,Y
|089101| CMP.b #$22 ; ANCILLA 22
|089103| BEQ .draw

|089105| DEY
|089106| BPL .next_slot

;---------------------------------------------------------------------------------------------------

|089108| LDA.b $11
|08910A| BNE .draw

|08910C| LDA.b $1A
|08910E| AND.b #$07
|089110| BNE .no_whoosh

|089112| LDA.b #$09 ; SFX2.09
|089114| JSR Ancilla_SFX2_Pan

.no_whoosh
|089117| LDA.w $03B1,X
|08911A| BNE .pos_set

|08911C| LDA.b $3C
|08911E| CMP.b #$09
|089120| BCS .init_pos

|089122| LDA.w $0300
|089125| BNE .init_pos

|089127| LDA.w $02E0
|08912A| BNE .bunny

|08912C| LDA.b $4D
|08912E| BEQ .draw

.bunny
|089130| BRL Boom_Die

.draw
|089133| BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.init_pos
|089136| LDA.w $03CF,X
|089139| TAY

|08913A| REP #$20

|08913C| LDA.b $20
|08913E| CLC
|08913F| ADC.w #$0008
|089142| CLC
|089143| ADC.w .offset_y,Y
|089146| STA.b $00

|089148| LDA.b $22
|08914A| CLC
|08914B| ADC.w .offset_x,Y
|08914E| STA.b $02

|089150| SEP #$20

|089152| LDA.b $00
|089154| STA.w $0BFA,X

|089157| LDA.b $01
|089159| STA.w $0C0E,X

|08915C| LDA.b $02
|08915E| STA.w $0C04,X

|089161| LDA.b $03
|089163| STA.w $0C18,X

|089166| INC.w $03B1,X

;---------------------------------------------------------------------------------------------------

.pos_set
|089169| LDA.w $0394,X
|08916C| BEQ .no_sparkle

|08916E| LDA.b $1A
|089170| AND.b #$01
|089172| BNE .no_sparkle

|089174| PHX
|089175| JSL AncillaAdd_SwordChargeSparkle
|089179| PLX

.no_sparkle
|08917A| LDA.w $0C5E,X
|08917D| BEQ .move_away

|08917F| LDA.w $0380,X
|089182| BEQ .not_decelerating

|089184| INC A

.decelerating
|089185| STA.w $0380,X

.not_decelerating
|089188| REP #$20

|08918A| LDA.b $20
|08918C| STA.w $038A,X

|08918F| CLC
|089190| ADC.w #$0008
|089193| STA.b $20

|089195| SEP #$20

|089197| LDA.w $03C5,X
|08919A| JSR ProjectAncillaSpeedTowardsLink

|08919D| JSL CheatWhenNoOnesLooking

|0891A1| LDA.b $00
|0891A3| STA.w $0C22,X

|0891A6| LDA.b $01
|0891A8| STA.w $0C2C,X

|0891AB| REP #$20

|0891AD| LDA.w $038A,X
|0891B0| STA.b $20

|0891B2| SEP #$20

;---------------------------------------------------------------------------------------------------

.move_away
|0891B4| LDA.w $0C22,X
|0891B7| BEQ .y_speed_0

|0891B9| CLC
|0891BA| ADC.w $0380,X
|0891BD| STA.w $0C22,X

.y_speed_0
|0891C0| JSR AncillaMoveY

|0891C3| LDA.w $0C2C,X
|0891C6| BEQ .x_speed_0

|0891C8| CLC
|0891C9| ADC.w $0380,X
|0891CC| STA.w $0C2C,X

.x_speed_0
|0891CF| JSR AncillaMoveX
|0891D2| JSR Ancilla_CheckSpriteCollision

|0891D5| LDY.b #$00
|0891D7| BCC .no_sprite_collision

|0891D9| INY

;---------------------------------------------------------------------------------------------------

.no_sprite_collision
|0891DA| LDA.w $0C5E,X
|0891DD| BNE .dont_turn_around

|0891DF| CPY.b #$01
|0891E1| BEQ .turn_around

|0891E3| JSR Ancilla_CheckTileCollision
|0891E6| BCC .no_tile_collision

|0891E8| PHX

|0891E9| JSL AncillaAdd_BoomerangWallClink

|0891ED| PLX

|0891EE| LDY.b #$06 ; SFX2.06

|0891F0| LDA.w $03E4,X
|0891F3| CMP.b #$F0 ; TILETYPE F0
|0891F5| BEQ .not_key_door

|0891F7| LDY.b #$05 ; SFX2.05

.not_key_door
|0891F9| TYA
|0891FA| JSR Ancilla_SFX2_Pan

|0891FD| BRA .turn_around

;---------------------------------------------------------------------------------------------------

.no_tile_collision
|0891FF| JSR Boomerang_ScreenEdge
|089202| BCS .turn_around

|089204| DEC.w $0C54,X

|089207| LDA.w $0C54,X
|08920A| BEQ .turn_around

|08920C| CMP.b #$05
|08920E| BCS .proceed_to_draw

|089210| DEC.w $0380,X
|089213| BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.turn_around
|089215| LDA.w $0C5E,X
|089218| EOR.b #$01
|08921A| STA.w $0C5E,X

|08921D| BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.dont_turn_around
|08921F| LDA.w $0280,X
|089222| PHA

|089223| LDA.w $0C7C,X
|089226| PHA

|089227| STZ.w $0C7C,X

|08922A| JSR Ancilla_CheckTileCollision

|08922D| PLA
|08922E| STA.w $0C7C,X

|089231| PLA
|089232| STA.w $0280,X

|089235| JSR Boomerang_StopOffScreen

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
|089238| BRL AncillaDraw_Boomerang

;===================================================================================================

Ancilla_CheckTileCollision_long:
|08923B| PHB
|08923C| PHK
|08923D| PLB

|08923E| JSR Ancilla_CheckTileCollision

|089241| PLB

|089242| RTL

;===================================================================================================

Ancilla_CheckTileCollision_Class2_long:
|089243| PHB
|089244| PHK
|089245| PLB

|089246| JSR Ancilla_CheckTileCollision_Class2

|089249| PLB

|08924A| RTL

;===================================================================================================

Boomerang_ScreenEdge:
|08924B| LDA.w $0BFA,X
|08924E| STA.b $00

|089250| LDA.w $0C0E,X
|089253| STA.b $01

|089255| LDA.w $0C04,X
|089258| STA.b $02

|08925A| LDA.w $0C18,X
|08925D| STA.b $03

;---------------------------------------------------------------------------------------------------

|08925F| REP #$30

|089261| LDY.w #$0000

|089264| LDA.w $039D
|089267| AND.w #$0003
|08926A| BEQ .no_horizontal

|08926C| AND.w #$0001
|08926F| BEQ .leftwards

|089271| LDY.w #$0010

.leftwards
|089274| TYA
|089275| CLC
|089276| ADC.b $02

|089278| SEC
|089279| SBC.b $E2
|08927B| STA.b $02

|08927D| CMP.w #$0100
|089280| BCS .do_reverse

;---------------------------------------------------------------------------------------------------

.no_horizontal
|089282| LDY.w #$0000

|089285| LDA.w $039D
|089288| AND.w #$000C
|08928B| BEQ .dont_reverse

|08928D| AND.w #$0004
|089290| BEQ .upward

|089292| LDY.w #$0010

.upward
|089295| TYA
|089296| CLC
|089297| ADC.b $00

|089299| SEC
|08929A| SBC.b $E8
|08929C| STA.b $00

|08929E| CMP.w #$00E2
|0892A1| BCC .dont_reverse

;---------------------------------------------------------------------------------------------------

.do_reverse
|0892A3| SEP #$30
|0892A5| SEC

|0892A6| RTS

;---------------------------------------------------------------------------------------------------

.dont_reverse
|0892A7| SEP #$30
|0892A9| CLC

|0892AA| RTS

;===================================================================================================

Boomerang_StopOffScreen:
|0892AB| LDA.w $0BFA,X
|0892AE| STA.b $04

|0892B0| LDA.w $0C0E,X
|0892B3| STA.b $05

|0892B5| LDA.w $0C04,X
|0892B8| STA.b $06

|0892BA| LDA.w $0C18,X
|0892BD| STA.b $07

;---------------------------------------------------------------------------------------------------

|0892BF| REP #$20

|0892C1| LDA.b $20
|0892C3| CLC
|0892C4| ADC.w #$0018
|0892C7| STA.b $00

|0892C9| LDA.b $22
|0892CB| CLC
|0892CC| ADC.w #$0010
|0892CF| STA.b $02

|0892D1| LDA.b $04
|0892D3| CLC
|0892D4| ADC.w #$0008
|0892D7| STA.b $04

|0892D9| LDA.b $06
|0892DB| CLC
|0892DC| ADC.w #$0008
|0892DF| STA.b $06

|0892E1| LDA.b $04
|0892E3| CMP.b $20
|0892E5| BCC Boom_NoDie

|0892E7| CMP.b $00
|0892E9| BCS Boom_NoDie

|0892EB| LDA.b $06
|0892ED| CMP.b $22
|0892EF| BCC Boom_NoDie

|0892F1| CMP.b $02
|0892F3| BCS Boom_NoDie

;---------------------------------------------------------------------------------------------------

Boom_Die:
|0892F5| SEP #$20

|0892F7| STZ.w $0C4A,X

|0892FA| STZ.w $035F

|0892FD| LDA.w $0301
|089300| AND.b #$80
|089302| BEQ Boom_NoDie

|089304| STZ.w $0301

|089307| LDA.b $3A
|089309| AND.b #$BF
|08930B| STA.b $3A

|08930D| AND.b #$80
|08930F| BNE Boom_NoDie

|089311| LDA.b $50
|089313| AND.b #$FE
|089315| STA.b $50

;===================================================================================================

Boom_NoDie:
|089317| SEP #$20

|089319| RTS

;===================================================================================================

pool AncillaDraw_Boomerang

.prop
|08931A| db $A4, $E4
|08931C| db $64, $24
|08931E| db $A2, $E2
|089320| db $62, $22

.offset
|089322| dw   2,  -2
|089326| dw   2,   2
|08932A| dw  -2,   2
|08932E| dw  -2,  -2

.oam_offset
|089332| dw $0180
|089334| dw $00D0

.rotation
|089336| db $03, $02

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_Boomerang:
|089338| JSR Ancilla_PrepOAMCoord

|08933B| LDA.w $0C5E,X
|08933E| BEQ .move_away

|089340| LDA.b $EE
|089342| STA.w $0C7C,X

|089345| TAY

|089346| LDA.w AncillaPriorities,Y
|089349| STA.b $65

.move_away
|08934B| LDA.w $0280,X
|08934E| BEQ .normal_priority

|089350| LDA.b #$30
|089352| STA.b $65

.normal_priority
|089354| LDA.b $11
|089356| BNE .leave_rotation

|089358| LDA.w $03B1,X
|08935B| BEQ .leave_rotation

|08935D| DEC.w $039F,X
|089360| BPL .leave_rotation

|089362| LDY.w $0394,X

|089365| LDA.w .rotation,Y
|089368| STA.w $039F,X

|08936B| LDY.w $03A4,X

|08936E| LDA.w $03A9,X
|089371| BEQ .left_throw

|089373| DEY

|089374| BRA .set_rotation

.left_throw
|089376| INY

.set_rotation
|089377| TYA
|089378| AND.b #$03
|08937A| STA.w $03A4,X

;---------------------------------------------------------------------------------------------------

.leave_rotation
|08937D| PHX

|08937E| LDA.w $0394,X
|089381| ASL A
|089382| ASL A
|089383| STA.b $72

|089385| LDA.w $03A4,X
|089388| ASL A
|089389| ASL A
|08938A| TAY

|08938B| REP #$20

|08938D| STZ.b $74

|08938F| LDA.w .offset+0,Y
|089392| CLC
|089393| ADC.b $00
|089395| STA.b $00

|089397| LDA.w .offset+2,Y
|08939A| CLC
|08939B| ADC.b $02
|08939D| STA.b $02
|08939F| STA.b $04

|0893A1| LDA.w $03B1,X
|0893A4| AND.w #$00FF
|0893A7| BNE .general_oam

|0893A9| LDA.w $0FB3
|0893AC| AND.w #$00FF
|0893AF| ASL A
|0893B0| TAX

|0893B1| LDA.w .oam_offset,X
|0893B4| PHA

|0893B5| LSR A
|0893B6| LSR A
|0893B7| CLC

|0893B8| ADC.w #$0A20
|0893BB| STA.b $92

|0893BD| PLA
|0893BE| CLC
|0893BF| ADC.w #$0800
|0893C2| STA.b $90

;---------------------------------------------------------------------------------------------------

.general_oam
|0893C4| SEP #$20

|0893C6| TYA
|0893C7| LSR A
|0893C8| LSR A
|0893C9| CLC
|0893CA| ADC.b $72
|0893CC| TAX

|0893CD| LDY.b #$00
|0893CF| JSR Ancilla_SetOAM_XY_safe

|0893D2| LDA.b #$26
|0893D4| STA.b ($90),Y

|0893D6| INY

|0893D7| LDA.w .prop,X
|0893DA| AND.b #$CF
|0893DC| ORA.b $65
|0893DE| STA.b ($90),Y

|0893E0| LDA.b #$02
|0893E2| ORA.b $75
|0893E4| STA.b ($92)

|0893E6| PLX

|0893E7| RTS

;===================================================================================================

Ancilla06_WallHit:
|0893E8| DEC.w $039F,X
|0893EB| BPL WallHit_JustDraw

|0893ED| LDA.w $0C5E,X
|0893F0| INC A
|0893F1| CMP.b #$05
|0893F3| BEQ WallHit_JustDie

|0893F5| STA.w $0C5E,X

|0893F8| LDA.b #$01
|0893FA| STA.w $039F,X

|0893FD| BRA WallHit_JustDraw

;===================================================================================================

Ancilla1B_SwordWallHit:
|0893FF| JSR AlertSprites

|089402| DEC.w $03B1,X
|089405| BPL WallHit_JustDraw

|089407| LDA.w $0C5E,X
|08940A| INC A
|08940B| CMP.b #$08
|08940D| BEQ WallHit_JustDie

|08940F| STA.w $0C5E,X

|089412| LDA.b #$01
|089414| STA.w $03B1,X

|089417| BRA WallHit_JustDraw

;---------------------------------------------------------------------------------------------------

WallHit_JustDie:
|089419| BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

WallHit_JustDraw:
|08941C| BRL AncillaDraw_WallHit

;===================================================================================================

pool AncillaDraw_WallHit

.char
|08941F| db $80, $00, $00, $00
|089423| db $92, $00, $00, $00
|089427| db $81, $81, $81, $81
|08942B| db $82, $82, $82, $82
|08942F| db $93, $93, $93, $93
|089433| db $92, $00, $00, $00
|089437| db $B9, $00, $00, $00
|08943B| db $90, $90, $00, $00

.prop
|08943F| db $32, $00, $00, $00
|089443| db $32, $00, $00, $00
|089447| db $32, $72, $B2, $F2
|08944B| db $32, $72, $B2, $F2
|08944F| db $32, $72, $B2, $F2
|089453| db $32, $00, $00, $00
|089457| db $72, $00, $00, $00
|08945B| db $32, $F2, $00, $00

.offset_y
|08945F| dw  -4,   0,   0,   0
|089467| dw  -4,   0,   0,   0
|08946F| dw  -8,  -8,   0,   0
|089477| dw  -8,  -8,   0,   0
|08947F| dw  -8,  -8,   0,   0
|089487| dw  -4,   0,   0,   0
|08948F| dw  -4,   0,   0,   0
|089497| dw  -8,   0,   0,   0

.offset_x
|08949F| dw  -4,   0,   0,   0
|0894A7| dw  -4,   0,   0,   0
|0894AF| dw  -8,   0,  -8,   0
|0894B7| dw  -8,   0,  -8,   0
|0894BF| dw  -8,   0,  -8,   0
|0894C7| dw  -4,   0,   0,   0
|0894CF| dw  -4,   0,   0,   0
|0894D7| dw  -8,   0,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_WallHit:
|0894DF| JSR Ancilla_PrepOAMCoord

|0894E2| REP #$20

|0894E4| LDA.b $00
|0894E6| STA.b $04

|0894E8| LDA.b $02
|0894EA| STA.b $06

|0894EC| SEP #$20

|0894EE| LDA.b #$03
|0894F0| STA.b $08

|0894F2| PHX

|0894F3| LDA.w $0C5E,X
|0894F6| ASL A
|0894F7| ASL A
|0894F8| TAX

;---------------------------------------------------------------------------------------------------

|0894F9| LDY.b #$00

.next_object
|0894FB| LDA.w .char,X
|0894FE| BEQ .skip

|089500| PHX

|089501| TXA
|089502| ASL A
|089503| TAX

|089504| REP #$20

|089506| LDA.w .offset_y,X
|089509| CLC
|08950A| ADC.b $04
|08950C| STA.b $00

|08950E| LDA.w .offset_x,X
|089511| CLC
|089512| ADC.b $06
|089514| STA.b $02

|089516| SEP #$20

|089518| PLX

|089519| JSR Ancilla_SetOAM_XY

|08951C| LDA.w .char,X
|08951F| STA.b ($90),Y

|089521| INY

|089522| LDA.w .prop,X
|089525| AND.b #$CF
|089527| ORA.b $65
|089529| STA.b ($90),Y

|08952B| INY

|08952C| PHY

|08952D| TYA
|08952E| SEC
|08952F| SBC.b #$04
|089531| LSR A
|089532| LSR A
|089533| TAY

|089534| LDA.b #$00
|089536| STA.b ($92),Y

|089538| PLY

.skip
|089539| JSR AllocateOAMInCustomRegion

|08953C| INX
|08953D| DEC.b $08

|08953F| BPL .next_object

;---------------------------------------------------------------------------------------------------

|089541| PLX

|089542| RTS

;===================================================================================================

BombTimers:
|089543| db 160,   6,   4,   4
|089547| db   4,   4,   4,   6
|08954B| db   6,   6,   6

BombAnimationSteps:
|08954E| db $00, $01, $02, $03
|089552| db $02, $03, $04, $05
|089556| db $06, $07, $08, $09

;===================================================================================================

Ancilla07_Bomb:
|08955A| LDA.b $11
|08955C| BEQ .main

|08955E| CMP.b #$08
|089560| BEQ .staircase

|089562| CMP.b #$10
|089564| BNE .not_staircase

.staircase
|089566| JSR Ancilla_HandleLiftLogic

|089569| BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.not_staircase
|08956B| TXA
|08956C| INC A
|08956D| CMP.w $02EC
|089570| BNE .proceed_to_draw

|089572| LDA.w $0380,X
|089575| BEQ .proceed_to_draw

|089577| CMP.b #$03
|089579| BEQ .fully_held

|08957B| LDY.b #$03
|08957D| JSR Ancilla_LatchLinkCoordinates
|089580| JSR Ancilla_LatchAltitudeAboveLink

|089583| LDA.b #$03
|089585| STA.w $0380,X

.fully_held
|089588| JSR Ancilla_LatchCarriedPosition

.proceed_to_draw
|08958B| BRL Bomb_DoDraw

;---------------------------------------------------------------------------------------------------

.main
|08958E| JSR Ancilla_HandleLiftLogic
|089591| JSR Ancilla_LatchYCoordToZ

|089594| LDA.w $0C72,X
|089597| STA.b $74

|089599| LDA.w $0280,X
|08959C| STA.b $75

|08959E| STZ.w $0280,X

|0895A1| JSR Ancilla_CheckTileCollision_Class2
|0895A4| PHP

|0895A5| LDA.b $1B
|0895A7| BEQ .leave_layer

|0895A9| LDA.w $0385,X
|0895AC| BEQ .leave_layer

|0895AE| LDA.w $03E4,X
|0895B1| CMP.b #$1C ; TILETYPE 1C
|0895B3| BNE .leave_layer

|0895B5| LDA.b #$01
|0895B7| STA.w $03D5,X

.leave_layer
|0895BA| PLP
|0895BB| BCC .no_tile_collision

;---------------------------------------------------------------------------------------------------

.check_for_lift
|0895BD| BIT.w $0308
|0895C0| BPL .link_not_holding

|0895C2| LDA.w $0309
|0895C5| BEQ .no_tile_collision

.link_not_holding
|0895C7| LDA.b $75
|0895C9| BNE .ignore_tile_collision

|0895CB| LDA.w $0BF0,X
|0895CE| BNE .ignore_tile_collision

|0895D0| LDA.b #$01
|0895D2| STA.w $0BF0,X

|0895D5| LDA.b #$04
|0895D7| STA.b $0E

|0895D9| LDY.b #$FC

|0895DB| LDA.w $0C72,X
|0895DE| CMP.b #$01
|0895E0| BNE .not_downwards

|0895E2| LDA.b #$10
|0895E4| STA.b $0E

|0895E6| LDY.b #$F0

;---------------------------------------------------------------------------------------------------

.not_downwards
|0895E8| LDA.w $0C22,X
|0895EB| BEQ .not_moving_y
|0895ED| BPL .positive_y

|0895EF| LDY.b $0E

.positive_y
|0895F1| TYA
|0895F2| STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

.not_moving_y
|0895F5| LDY.b #$FC

|0895F7| LDA.w $0C2C,X
|0895FA| BEQ .not_moving_x
|0895FC| BPL .positive_x

|0895FE| LDY.b #$04

.positive_x
|089600| TYA
|089601| STA.w $0C2C,X

.not_moving_x
|089604| LDA.w $0C72,X
|089607| CMP.b #$01
|089609| BNE .ignore_tile_collision

|08960B| LDA.w $029E,X
|08960E| BEQ .ignore_tile_collision

|089610| LDA.b #$FC
|089612| STA.w $0C22,X

|089615| LDA.b #$02
|089617| STA.w $0385,X

.ignore_tile_collision
|08961A| BRL Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.no_tile_collision
|08961D| TXA
|08961E| INC A
|08961F| CMP.w $02EC
|089622| BNE .not_lifted_bomb

|089624| BIT.w $0308
|089627| BMI .ignore_tile_collision

.not_lifted_bomb
|089629| LDA.w $029E,X
|08962C| BEQ .on_ground

|08962E| CMP.b #$FF
|089630| BNE .ignore_tile_collision

.on_ground
|089632| LDA.b #$10
|089634| STA.w $0C72,X

|089637| LDA.w $0280,X
|08963A| PHA

|08963B| JSR Ancilla_CheckTileCollision

|08963E| PLA
|08963F| STA.w $0280,X

;---------------------------------------------------------------------------------------------------

|089642| LDA.w $03E4,X
|089645| CMP.b #$26 ; TILETYPE 26
|089647| BEQ .tile_staircase

|089649| CMP.b #$0C ; TILETYPE 0C
|08964B| BEQ .tile_0C_1C

|08964D| CMP.b #$1C ; TILETYPE 1C
|08964F| BEQ .tile_0C_1C

|089651| CMP.b #$20 ; TILETYPE 20
|089653| BEQ .tile_pit

|089655| CMP.b #$08 ; TILETYPE 08
|089657| BEQ .tile_deep_water

|089659| CMP.b #$68 ; TILETYPE 68
|08965B| BEQ .tile_conveyor

|08965D| CMP.b #$69 ; TILETYPE 69
|08965F| BEQ .tile_conveyor

|089661| CMP.b #$6A ; TILETYPE 6A
|089663| BEQ .tile_conveyor

|089665| CMP.b #$6B ; TILETYPE 6B
|089667| BEQ .tile_conveyor

|089669| CMP.b #$B6 ; TILETYPE B6
|08966B| BEQ .tile_transit

|08966D| CMP.b #$BC ; TILETYPE BC
|08966F| BEQ .tile_transit

|089671| AND.b #$F0
|089673| CMP.b #$B0
|089675| BEQ .tile_pit

;---------------------------------------------------------------------------------------------------

.tile_transit
|089677| STZ.w $0C68,X

|08967A| LDA.w $0385,X
|08967D| BNE .ignore_tile_collision

|08967F| LDA.b #$02
|089681| STA.w $0C68,X

.bounce_to_state_handler
|089684| BRL Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.tile_conveyor
|089687| BRL Bomb_HandleConveyor

;---------------------------------------------------------------------------------------------------

.tile_staircase
|08968A| BRL .check_for_lift

;---------------------------------------------------------------------------------------------------

.tile_0C_1C
|08968D| BRL Bomb_HandleTiles_0C_1C

;---------------------------------------------------------------------------------------------------

.tile_deep_water
|089690| TXA
|089691| INC A
|089692| CMP.w $02EC
|089695| BNE .water_reset_a

|089697| STZ.w $02EC

.water_reset_a
|08969A| LDA.w $0C68,X
|08969D| BNE .bounce_to_state_handler

|08969F| LDA.w $0BFA,X
|0896A2| CLC
|0896A3| ADC.b #$E8
|0896A5| STA.w $0BFA,X

|0896A8| LDA.b #$FF
|0896AA| ADC.w $0C0E,X
|0896AD| STA.w $0C0E,X

|0896B0| BRL Ancilla_TransmuteToSplash

;---------------------------------------------------------------------------------------------------

.tile_pit
|0896B3| LDA.w $0308
|0896B6| BMI Bomb_HandleState

|0896B8| STX.b $04

|0896BA| LDA.w $02EC
|0896BD| DEC A
|0896BE| CMP.b $04
|0896C0| BNE .water_reset_b

|0896C2| STZ.w $02EC

.water_reset_b
|0896C5| LDA.w $0C68,X
|0896C8| BNE .bounce_to_state_handler

|0896CA| BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

Bomb_HandleTiles_0C_1C:
|0896CD| LDA.w $046C
|0896D0| CMP.b #$03
|0896D2| BEQ .moving_floor

|0896D4| LDA.w $0C7C,X
|0896D7| BNE Bomb_HandleState

|0896D9| LDA.w $029E,X
|0896DC| BEQ Bomb_HandleState

|0896DE| CMP.b #$FF
|0896E0| BEQ Bomb_HandleState

|0896E2| LDA.b #$01
|0896E4| STA.w $0C7C,X

|0896E7| BRA Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.moving_floor
|0896E9| LDA.w $0310
|0896EC| CLC
|0896ED| ADC.w $0BFA,X
|0896F0| STA.b $72

|0896F2| LDA.w $0311
|0896F5| ADC.w $0C0E,X
|0896F8| STA.b $73

|0896FA| LDA.w $0312
|0896FD| CLC
|0896FE| ADC.w $0C04,X
|089701| STA.w $0C04,X

|089704| LDA.w $0313
|089707| ADC.w $0C18,X
|08970A| STA.w $0C18,X

|08970D| BRA Bomb_HandleState

;===================================================================================================

Bomb_HandleConveyor:
|08970F| JSR Ancilla_ApplyConveyor

;===================================================================================================

Bomb_HandleState:
|089712| JSR Ancilla_SetYFrom_DP72

|089715| LDA.b $74
|089717| STA.w $0C72,X

|08971A| LDA.b $75
|08971C| ORA.w $0280,X
|08971F| STA.w $0280,X

|089722| JSR Bomb_CheckSpriteAndPlayerDamage

|089725| DEC.w $039F,X

|089728| LDA.w $039F,X
|08972B| BNE .delay

|08972D| INC.w $0C5E,X

|089730| LDA.w $0C5E,X
|089733| CMP.b #$01
|089735| BNE .not_just_exploded

|089737| LDA.b #$0C ; SFX2.0C
|089739| JSR Ancilla_SFX2_Pan

|08973C| TXA
|08973D| INC A
|08973E| CMP.w $02EC
|089741| BNE .not_just_exploded

|089743| STZ.w $02EC

|089746| BIT.w $0308
|089749| BPL .not_just_exploded

|08974B| STZ.w $0308
|08974E| STZ.b $50

;---------------------------------------------------------------------------------------------------

.not_just_exploded
|089750| LDA.w $0C5E,X
|089753| CMP.b #$0B
|089755| BNE .not_fully_exploded

|089757| LDY.b #$00

|089759| LDA.w $0C54,X
|08975C| BEQ .dont_become_debris

|08975E| LDY.b #$08 ; ANCILLA 08

.dont_become_debris
|089760| TYA
|089761| STA.w $0C4A,X

|089764| RTS

;---------------------------------------------------------------------------------------------------

.not_fully_exploded
|089765| TAY

|089766| LDA.w BombTimers,Y
|089769| STA.w $039F,X

;---------------------------------------------------------------------------------------------------

.delay
|08976C| LDA.w $0C5E,X

|08976F| CMP.b #$07
|089771| BNE Bomb_DoDraw

|089773| LDA.w $039F,X
|089776| CMP.b #$02
|089778| BNE Bomb_DoDraw

|08977A| PHX

|08977B| LDA.w $0BFA,X
|08977E| STA.b $00

|089780| LDA.w $0C0E,X
|089783| STA.b $01

|089785| LDA.w $0C04,X
|089788| STA.b $02

|08978A| LDA.w $0C18,X
|08978D| STA.b $03

|08978F| STX.b $0E

|089791| TXA
|089792| ASL A
|089793| TAX

|089794| STZ.w $03B6,X
|089797| STZ.w $03B7,X

|08979A| JSL FindBombableThings

|08979E| PLX

|08979F| TXY
|0897A0| TXA

|0897A1| ASL A
|0897A2| TAX

|0897A3| LDA.w $03B6,X
|0897A6| ORA.w $03B7,X
|0897A9| BEQ .didnt_break_wall

|0897AB| TYX

|0897AC| LDA.b #$01
|0897AE| STA.w $0C54,X

.didnt_break_wall
|0897B1| TYX

;===================================================================================================

Bomb_DoDraw:
|0897B2| JSR AncillaDraw_Bomb

;---------------------------------------------------------------------------------------------------

#EXIT_0897B5:
|0897B5| RTS

;===================================================================================================

pool Ancilla_ApplyConveyor

.speed_y
|0897B6| db  -8,   8,   0,   0

.speed_x
|0897BA| db   0,   0,  -8,   8

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_ApplyConveyor:
|0897BE| LDA.w $03E4,X
|0897C1| SEC
|0897C2| SBC.b #$68 ; TILETYPE 68
|0897C4| TAY

|0897C5| LDA.w .speed_y,Y
|0897C8| STA.w $0C22,X

|0897CB| LDA.w .speed_x,Y
|0897CE| STA.w $0C2C,X

|0897D1| JSR AncillaMoveY
|0897D4| JSR AncillaMoveX

|0897D7| LDA.w $0BFA,X
|0897DA| STA.b $72

|0897DC| LDA.w $0C0E,X
|0897DF| STA.b $73

|0897E1| RTS

;===================================================================================================

pool Bomb_CheckSpriteAndPlayerDamage

.recoil
|0897E2| db $20, $20, $20, $20
|0897E6| db $20, $20, $1C, $1C
|0897EA| db $1C, $1C, $1C, $1C
|0897EE| db $18, $18, $18, $18

.recoil_z
|0897F2| db $10, $10, $10, $10
|0897F6| db $10, $10, $0C, $0C
|0897FA| db $0C, $0C, $08, $08
|0897FE| db $08, $08, $08, $08

.recoil_timer
|089802| db  32,  32,  32,  32
|089806| db  32,  32,  24,  24
|08980A| db  24,  24,  24,  24
|08980E| db  16,  16,  16,  16

.link_damage
|089812| db $08 ; green mail
|089813| db $04 ; blue mail
|089814| db $02 ; red mail

endpool

;===================================================================================================

Bomb_CheckSpriteAndPlayerDamage:
|089815| LDA.w $0C5E,X
|089818| BEQ .no_damage

|08981A| CMP.b #$09
|08981C| BCS .no_damage

|08981E| JSR Bomb_CheckSpriteDamage

|089821| LDA.w $037B
|089824| BEQ .link_vulnerable

|089826| TXA
|089827| INC A
|089828| CMP.w $02EC
|08982B| BNE EXIT_0897B5

|08982D| LDA.w $0308
|089830| AND.b #$80
|089832| BEQ EXIT_0897B5

|089834| LDA.w $0308
|089837| AND.b #$7F
|089839| STA.w $0308

|08983C| STZ.b $50

.no_damage
|08983E| BRL EXIT_0897B5

.link_vulnerable
|089841| LDA.b $4D
|089843| BNE .no_damage

|089845| LDA.b $46
|089847| BNE .no_damage

|089849| LDA.w $0C7C,X
|08984C| CMP.b $EE
|08984E| BNE .no_damage

;---------------------------------------------------------------------------------------------------

|089850| LDA.b $22
|089852| STA.b $00

|089854| LDA.b $23
|089856| STA.b $08

|089858| LDA.b $20
|08985A| STA.b $01

|08985C| LDA.b $21
|08985E| STA.b $09

|089860| LDA.b #$10
|089862| STA.b $02

|089864| LDA.b #$18
|089866| STA.b $03

|089868| LDA.w $0C04,X
|08986B| STA.b $04

|08986D| LDA.w $0C18,X
|089870| STA.b $05

|089872| LDA.w $0BFA,X
|089875| STA.b $06

|089877| LDA.w $0C0E,X
|08987A| STA.b $07

;---------------------------------------------------------------------------------------------------

|08987C| REP #$20

|08987E| LDA.b $04
|089880| CLC
|089881| ADC.w #$FFF0
|089884| STA.b $04

|089886| LDA.b $06
|089888| CLC
|089889| ADC.w #$FFF0
|08988C| STA.b $06

|08988E| SEP #$20

|089890| LDA.b $05
|089892| STA.b $0A

|089894| LDA.b $06
|089896| STA.b $05

|089898| LDA.b $07
|08989A| STA.b $0B

|08989C| LDA.b #$20
|08989E| STA.b $06
|0898A0| STA.b $07

|0898A2| JSL CheckIfHitboxesOverlap_long
|0898A6| BCC .exit

;---------------------------------------------------------------------------------------------------

|0898A8| LDA.w $0C04,X
|0898AB| CLC
|0898AC| ADC.b #$F8
|0898AE| STA.b $00

|0898B0| LDA.w $0C18,X
|0898B3| ADC.b #$FF
|0898B5| STA.b $01

|0898B7| LDA.w $0BFA,X
|0898BA| CLC
|0898BB| ADC.b #$F4
|0898BD| STA.b $02

|0898BF| LDA.w $0C0E,X
|0898C2| ADC.b #$FF
|0898C4| STA.b $03

|0898C6| PHX

|0898C7| JSR Bomb_GetDisplacementFromLink

|0898CA| LDA.w .recoil,Y
|0898CD| TAY

|0898CE| JSL HijackSlot0ForBombRecoil
|0898D2| PLX

;---------------------------------------------------------------------------------------------------

|0898D3| LDA.w $031F
|0898D6| BNE .exit

|0898D8| LDA.w $0FFC
|0898DB| CMP.b #$02
|0898DD| BEQ .exit

|0898DF| LDA.b $00
|0898E1| STA.b $27

|0898E3| LDA.b $01
|0898E5| STA.b $28

|0898E7| JSR Bomb_GetDisplacementFromLink

|0898EA| LDA.w .recoil_z,Y
|0898ED| STA.b $29
|0898EF| STA.w $02C7

|0898F2| LDA.w .recoil_timer,Y
|0898F5| STA.b $46

|0898F7| LDA.b #$01
|0898F9| STA.b $4D

|0898FB| LDA.b #$3A
|0898FD| STA.w $031F

|089900| LDA.w $0403
|089903| AND.b #$80
|089905| BNE .exit

|089907| LDA.l $7EF35B
|08990B| TAY

|08990C| LDA.w .link_damage,Y
|08990F| STA.w $0373

.exit
|089912| RTS

;===================================================================================================

pool AncillaCarry

.offset_y
|089913| dw  16,   8,   4,   4
|08991B| dw   8,   2,  -1,  -1
|089923| dw   2,   2,  -1,  -1

.offset_x
|08992B| dw   8,   8,  -4,  20
|089933| dw   8,   8,   8,   8
|08993B| dw   8,   8,   8,   8

.timer
|089943| db  16,   8,   9

.offset_z
|089946| dw  -2,  -1
|08994A| dw   0,  -2
|08994E| dw  -1,   0

.throw_speed_y
|089952| db -32,  32,   0,   0

.throw_speed_x
|089956| db   0,   0, -32,  32

.unused_a
|08995A| db $08, $08, $00, $00
|08995E| db $04, $04, $00, $00

.unused_b
|089962| db $00, $00, $08, $08
|089966| db $00, $00, $04, $04

.bounce_z
|08996A| db  16,  16

.unused_c
|08996C| db $10, $10, $08, $08, $08, $08

.direction
|089972| db $00, $02, $04, $06

endpool

;===================================================================================================

Ancilla_HandleLiftLogic:
|089976| LDA.w $03EA,X
|089979| BNE .not_liftable

|08997B| LDA.w $0385,X
|08997E| BEQ .not_airborne

|089980| BRL AncillaCarry_Airborne

.not_airborne
|089983| STX.b $00

|089985| LDA.w $02EC
|089988| BEQ .link_not_close

|08998A| DEC A
|08998B| CMP.b $00
|08998D| BEQ .is_closest_for_lift

|08998F| RTS

;---------------------------------------------------------------------------------------------------

.is_closest_for_lift
|089990| LDY.w $037B
|089993| BNE .link_invulnerable

|089995| LDA.b $46
|089997| BNE .link_cant_handle_it

.link_invulnerable
|089999| LDA.w $03FD
|08999C| BNE .link_cant_handle_it

|08999E| LDA.b $4D
|0899A0| CMP.b #$01
|0899A2| BNE .link_not_recoiling

;---------------------------------------------------------------------------------------------------

.link_cant_handle_it
|0899A4| LDA.b #$01
|0899A6| STA.w $03EA,X

|0899A9| STZ.w $0294,X
|0899AC| STZ.w $02EC
|0899AF| STZ.w $0BF0,X

|0899B2| BRA .not_liftable

;---------------------------------------------------------------------------------------------------

.link_not_recoiling
|0899B4| LDA.w $0308
|0899B7| BPL .link_not_close

|0899B9| BRL .link_hands_are_full

;---------------------------------------------------------------------------------------------------

.not_liftable
|0899BC| BRL Ancilla_LatchCarriedPosition.handle_altitude

;---------------------------------------------------------------------------------------------------

.link_not_close
|0899BF| STZ.w $02EC

|0899C2| LDA.w $0C5E,X
|0899C5| BNE .exit

|0899C7| LDA.w $0308
|0899CA| BNE .exit

|0899CC| LDY.b #$00
|0899CE| JSR Ancilla_CheckLinkCollision
|0899D1| BCC .exit

|0899D3| LDA.w $0C7C,X
|0899D6| CMP.b $EE
|0899D8| BNE .exit

|0899DA| LDA.b $08
|0899DC| CMP.b #$10
|0899DE| BCS .y_difference_big

|0899E0| LDA.b $0A
|0899E2| CMP.b #$0C
|0899E4| BCC .continue_lift

;---------------------------------------------------------------------------------------------------

.y_difference_big
|0899E6| LDA.b $08
|0899E8| CMP.b $0A
|0899EA| BCC .y_difference_smaller

|0899EC| LDY.b #$00

|0899EE| LDA.b $04
|0899F0| BPL .check_direction

|0899F2| INY
|0899F3| BRA .check_direction

;---------------------------------------------------------------------------------------------------

.y_difference_smaller
|0899F5| LDY.b #$02

|0899F7| LDA.b $06
|0899F9| BPL .check_direction

|0899FB| INY

.check_direction
|0899FC| LDA.w AncillaCarry.direction,Y
|0899FF| CMP.b $2F
|089A01| BNE .exit

;---------------------------------------------------------------------------------------------------

.continue_lift
|089A03| TXA
|089A04| INC A
|089A05| STA.w $02EC

|089A08| STZ.w $0380,X

|089A0B| LDA.w AncillaCarry.timer
|089A0E| STA.w $03B1,X

|089A11| STZ.w $0385,X
|089A14| STZ.w $029E,X

.exit
|089A17| RTS

;---------------------------------------------------------------------------------------------------

.link_hands_are_full
|089A18| LDA.w $0309
|089A1B| CMP.b #$02
|089A1D| BEQ Ancilla_HandleThrowLogic

|089A1F| LDA.w $02EC
|089A22| BEQ Ancilla_HandleThrowLogic

|089A24| LDY.w $0380,X
|089A27| CPY.b #$03
|089A29| BEQ Ancilla_HandleThrowLogic

|089A2B| CPY.b #$00
|089A2D| BNE .skip_lift_sfx

|089A2F| LDA.w $03B1,X
|089A32| CMP.b #$10
|089A34| BNE .skip_lift_sfx

|089A36| LDA.b #$1D ; SFX2.1D
|089A38| JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.skip_lift_sfx
|089A3B| DEC.w $03B1,X
|089A3E| BPL Ancilla_LatchLinkCoordinates

|089A40| INY
|089A41| TYA
|089A42| STA.w $0380,X

|089A45| LDA.w AncillaCarry.timer,Y
|089A48| STA.w $03B1,X

|089A4B| CPY.b #$03
|089A4D| BNE Ancilla_LatchLinkCoordinates

;---------------------------------------------------------------------------------------------------

Ancilla_LatchAltitudeAboveLink:
|089A4F| LDA.b #$11
|089A51| STA.w $029E,X

|089A54| LDA.w $0BFA,X
|089A57| CLC
|089A58| ADC.b #$11
|089A5A| STA.w $0BFA,X

|089A5D| LDA.w $0C0E,X
|089A60| ADC.b #$00
|089A62| STA.w $0C0E,X

|089A65| STZ.w $0280,X

|089A68| BRA EXIT_089A94

;===================================================================================================

Ancilla_LatchLinkCoordinates:
|089A6A| TYA
|089A6B| ASL A
|089A6C| ASL A
|089A6D| ASL A
|089A6E| CLC
|089A6F| ADC.b $2F
|089A71| TAY

|089A72| LDA.b $20
|089A74| CLC
|089A75| ADC.w AncillaCarry.offset_y+0,Y
|089A78| STA.w $0BFA,X

|089A7B| LDA.b $21
|089A7D| ADC.w AncillaCarry.offset_y+1,Y
|089A80| STA.w $0C0E,X

|089A83| LDA.b $22
|089A85| CLC
|089A86| ADC.w AncillaCarry.offset_x+0,Y
|089A89| STA.w $0C04,X

|089A8C| LDA.b $23
|089A8E| ADC.w AncillaCarry.offset_x+1,Y
|089A91| STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#EXIT_089A94:
|089A94| RTS

;===================================================================================================

Ancilla_HandleThrowLogic:
|089A95| LDA.w $0380,X
|089A98| CMP.b #$03
|089A9A| BNE EXIT_089A94

|089A9C| LDA.w $0309
|089A9F| CMP.b #$02
|089AA1| BEQ AncillaCarry_HandleThrow

|089AA3| LDA.b $11
|089AA5| BNE .cant_throw

|089AA7| LDA.b $F6
|089AA9| ORA.b $F4
|089AAB| AND.b #$80
|089AAD| BNE AncillaCarry_HandleThrow

.cant_throw
|089AAF| BRL AncillaCarry_HandleFalling

;===================================================================================================

AncillaCarry_HandleThrow:
|089AB2| LDA.b $2F
|089AB4| LSR A
|089AB5| STA.w $0C72,X

|089AB8| TAY

|089AB9| LDA.b #$18
|089ABB| STA.w $0294,X

|089ABE| LDA.w AncillaCarry.throw_speed_y,Y
|089AC1| STA.w $0C22,X

|089AC4| LDA.w AncillaCarry.throw_speed_x,Y
|089AC7| STA.w $0C2C,X

|089ACA| LDA.b #$02
|089ACC| STA.w $0309

|089ACF| DEC A
|089AD0| STA.w $0385,X

|089AD3| STZ.w $02EC

|089AD6| STZ.w $0BF0,X
|089AD9| STZ.w $0380,X
|089ADC| STZ.w $0280,X

|089ADF| LDA.b #$13 ; SFX3.13
|089AE1| JSR Ancilla_SFX3_Pan

;===================================================================================================

AncillaCarry_Airborne:
|089AE4| LDA.w $0C5E,X
|089AE7| BEQ .continue

|089AE9| RTS

.continue
|089AEA| LDA.w $0294,X
|089AED| SEC
|089AEE| SBC.b #$02
|089AF0| STA.w $0294,X

|089AF3| JSR AncillaMoveY
|089AF6| JSR AncillaMoveX

|089AF9| LDA.w $029E,X
|089AFC| STA.b $00

|089AFE| JSR AncillaMoveZ

|089B01| LDA.w $0BF0,X
|089B04| BEQ .dont_adjust_altitude

|089B06| LDA.w $0C72,X
|089B09| CMP.b #$01
|089B0B| BNE .dont_adjust_altitude

|089B0D| LDA.w $0BFA,X
|089B10| STA.b $0C

|089B12| LDA.w $0C0E,X
|089B15| STA.b $0D

|089B17| LDA.w $029E,X
|089B1A| BMI .dont_adjust_altitude

|089B1C| SEC
|089B1D| SBC.b $00
|089B1F| STA.b $0E

|089B21| REP #$20

|089B23| LDA.b $0E
|089B25| AND.w #$00FF
|089B28| CMP.w #$0080
|089B2B| BCC .y_is_positive

|089B2D| ORA.w #$FF00

.y_is_positive
|089B30| CLC
|089B31| ADC.b $0C
|089B33| STA.b $0C

|089B35| SEP #$20

|089B37| LDA.b $0C
|089B39| STA.w $0BFA,X

|089B3C| LDA.b $0D
|089B3E| STA.w $0C0E,X

.dont_adjust_altitude
|089B41| LDA.w $029E,X
|089B44| CMP.b #$80
|089B46| BCS .negative_z

.exit_a
|089B48| RTS

;---------------------------------------------------------------------------------------------------

.negative_z
|089B49| CMP.b #$FF
|089B4B| BCS .exit_a

|089B4D| STZ.w $029E,X

|089B50| LDA.b #$21 ; SFX2.21
|089B52| JSR Ancilla_SFX2_Pan

|089B55| INC.w $0385,X

|089B58| LDA.w $0385,X
|089B5B| CMP.b #$03
|089B5D| BEQ .bounces_maxed

|089B5F| SEC
|089B60| SBC.b #$02

|089B62| ASL A
|089B63| ASL A

|089B64| CLC
|089B65| ADC.w $0C72,X
|089B68| TAY

;---------------------------------------------------------------------------------------------------

|089B69| LDY.b #$00

|089B6B| LDA.w $0C22,X
|089B6E| BPL .positive_y

|089B70| LDY.b #$01

|089B72| EOR.b #$FF
|089B74| INC A

.positive_y
|089B75| LSR A

|089B76| CPY.b #$01
|089B78| BNE .dont_invert_y

|089B7A| EOR.b #$FF
|089B7C| INC A

.dont_invert_y
|089B7D| STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

|089B80| LDY.b #$00

|089B82| LDA.w $0C2C,X
|089B85| BPL .positive_x

|089B87| LDY.b #$01

|089B89| EOR.b #$FF
|089B8B| INC A

.positive_x
|089B8C| LSR A
|089B8D| CPY.b #$01
|089B8F| BNE .dont_invert_x

|089B91| EOR.b #$FF
|089B93| INC A

.dont_invert_x
|089B94| STA.w $0C2C,X

|089B97| LDA.w AncillaCarry.bounce_z,Y
|089B9A| STA.w $0294,X

|089B9D| LDA.w $0BF0,X
|089BA0| BEQ .exit_b

|089BA2| STZ.w $0BF0,X

|089BA5| RTS

;---------------------------------------------------------------------------------------------------

.bounces_maxed
|089BA6| STZ.w $029E,X
|089BA9| STZ.w $0385,X
|089BAC| STZ.w $0BF0,X

|089BAF| STZ.b $5E

|089BB1| STZ.w $0C22,X
|089BB4| STZ.w $0C2C,X
|089BB7| STZ.w $0294,X

|089BBA| LDA.w $03D5,X
|089BBD| BEQ .exit_b

|089BBF| STA.w $0C7C,X

|089BC2| STZ.w $03D5,X

.exit_b
|089BC5| RTS

;===================================================================================================

AncillaCarry_HandleFalling:
|089BC6| LDA.w $0C5E,X
|089BC9| BNE EXIT_089C3D

|089BCB| LDA.b $5B
|089BCD| CMP.b #$02
|089BCF| BCC .continue

|089BD1| STZ.b $5E

|089BD3| TXA
|089BD4| INC A

|089BD5| CMP.w $02EC
|089BD8| BNE .exit

|089BDA| STZ.w $02EC

|089BDD| STZ.w $0C4A,X

.exit
|089BE0| RTS

.continue
|089BE1| LDA.w $0345
|089BE4| ORA.w $02E0
|089BE7| BEQ Ancilla_LatchCarriedPosition

|089BE9| STZ.w $0308

|089BEC| BRL AncillaCarry_HandleThrow

;===================================================================================================

Ancilla_LatchCarriedPosition:
|089BEF| LDA.b $2E
|089BF1| ASL A
|089BF2| TAY

|089BF3| LDA.b #$0C
|089BF5| STA.b $5E

|089BF7| LDA.b $EE
|089BF9| STA.w $0C7C,X

|089BFC| LDA.w $0476
|089BFF| STA.w $03CA,X

|089C02| REP #$20

|089C04| LDA.b $24
|089C06| CMP.w #$FFFF
|089C09| BNE .positive

|089C0B| LDA.w #$0000

.positive
|089C0E| EOR.w #$FFFF
|089C11| INC A

|089C12| CLC
|089C13| ADC.b $20

|089C15| CLC
|089C16| ADC.w AncillaCarry.offset_z,Y

|089C19| CLC
|089C1A| ADC.w #$0012
|089C1D| STA.b $00

;---------------------------------------------------------------------------------------------------

|089C1F| LDA.b $22
|089C21| CLC
|089C22| ADC.w #$0008
|089C25| STA.b $02

|089C27| SEP #$20

|089C29| LDA.b $00
|089C2B| STA.w $0BFA,X

|089C2E| LDA.b $01
|089C30| STA.w $0C0E,X

|089C33| LDA.b $02
|089C35| STA.w $0C04,X

|089C38| LDA.b $03
|089C3A| STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#EXIT_089C3D:
|089C3D| RTS

;---------------------------------------------------------------------------------------------------

.handle_altitude
|089C3E| LDA.w $0C5E,X
|089C41| BNE EXIT_089C3D

|089C43| LDA.w $0380,X
|089C46| CMP.b #$03
|089C48| BNE .restore_lift

|089C4A| LDA.w $0294,X
|089C4D| SEC
|089C4E| SBC.b #$02
|089C50| STA.w $0294,X

|089C53| JSR AncillaMoveZ

|089C56| LDA.w $029E,X
|089C59| BEQ .zero_zee

|089C5B| CMP.b #$FC
|089C5D| BCC .exit

;---------------------------------------------------------------------------------------------------

.zero_zee
|089C5F| STZ.w $029E,X

|089C62| INC.w $03EA,X

|089C65| LDA.w $03EA,X
|089C68| CMP.b #$03
|089C6A| BEQ .bounces_maxed

|089C6C| LDA.b #$18
|089C6E| STA.w $0294,X

|089C71| BRA .exit

.bounces_maxed
|089C73| STZ.w $029E,X
|089C76| STZ.w $0380,X

.restore_lift
|089C79| STZ.w $03EA,X
|089C7C| STZ.b $5E

.exit
|089C7E| RTS

;===================================================================================================

Ancilla_LatchYCoordToZ:
|089C7F| LDA.w $0BFA,X
|089C82| STA.b $72

|089C84| LDA.w $0C0E,X
|089C87| STA.b $73

|089C89| STZ.b $0D
|089C8B| STZ.b $0C

|089C8D| LDA.w $0C72,X
|089C90| ASL A
|089C91| TAY

|089C92| CMP.b #$02
|089C94| BNE .continue

|089C96| LDA.w $029E,X
|089C99| STA.b $0C
|089C9B| BPL .continue

|089C9D| LDA.b #$FF
|089C9F| STA.b $0D

;---------------------------------------------------------------------------------------------------

.continue
|089CA1| REP #$20

|089CA3| LDA.b $0C
|089CA5| CMP.w #$FFFF
|089CA8| BNE .not_ground_impact

|089CAA| LDA.w #$0000

.not_ground_impact
|089CAD| EOR.w #$FFFF
|089CB0| INC A
|089CB1| CLC
|089CB2| ADC.b $72
|089CB4| STA.b $0E

|089CB6| SEP #$20

|089CB8| LDA.b $0E
|089CBA| STA.w $0BFA,X

|089CBD| LDA.b $0F
|089CBF| STA.w $0C0E,X

|089CC2| RTS

;===================================================================================================

Ancilla_SetYFrom_DP72:
|089CC3| LDA.b $73
|089CC5| STA.w $0C0E,X

|089CC8| LDA.b $72
|089CCA| STA.w $0BFA,X

|089CCD| RTS

;===================================================================================================

Bomb_GetDisplacementFromLink:
|089CCE| LDA.w $0C04,X
|089CD1| STA.b $06

|089CD3| LDA.w $0C18,X
|089CD6| STA.b $07

|089CD8| LDA.w $0BFA,X
|089CDB| STA.b $04

|089CDD| LDA.w $0C0E,X
|089CE0| STA.b $05

|089CE2| REP #$20

|089CE4| LDA.b $22
|089CE6| CLC
|089CE7| ADC.w #$0008
|089CEA| SEC
|089CEB| SBC.b $06
|089CED| BPL .positive_x

|089CEF| EOR.w #$FFFF
|089CF2| INC A

.positive_x
|089CF3| STA.b $0A

|089CF5| LDA.b $20
|089CF7| CLC
|089CF8| ADC.w #$000C
|089CFB| SEC
|089CFC| SBC.b $04
|089CFE| BPL .positive_y

|089D00| EOR.w #$FFFF
|089D03| INC A

.positive_y
|089D04| CLC
|089D05| ADC.b $0A
|089D07| AND.w #$00FC
|089D0A| LSR A
|089D0B| LSR A
|089D0C| TAY

|089D0D| SEP #$20

|089D0F| RTS

;===================================================================================================

BombDraw:

.char_and_prop
|089D10| db $6E, $26
|089D12| db $FF, $FF
|089D14| db $FF, $FF
|089D16| db $FF, $FF
|089D18| db $FF, $FF
|089D1A| db $FF, $FF

|089D1C| db $8C, $22
|089D1E| db $8C, $62
|089D20| db $8C, $A2
|089D22| db $8C, $E2
|089D24| db $FF, $FF
|089D26| db $FF, $FF

|089D28| db $84, $22
|089D2A| db $84, $62
|089D2C| db $84, $A2
|089D2E| db $84, $E2
|089D30| db $FF, $FF
|089D32| db $FF, $FF

|089D34| db $88, $22
|089D36| db $88, $62
|089D38| db $88, $A2
|089D3A| db $88, $E2
|089D3C| db $FF, $FF
|089D3E| db $FF, $FF

|089D40| db $86, $22
|089D42| db $88, $22
|089D44| db $88, $62
|089D46| db $88, $A2
|089D48| db $88, $E2
|089D4A| db $FF, $FF

|089D4C| db $86, $22
|089D4E| db $86, $62
|089D50| db $86, $E2
|089D52| db $86, $E2
|089D54| db $FF, $FF
|089D56| db $FF, $FF

|089D58| db $86, $E2
|089D5A| db $86, $22
|089D5C| db $86, $22
|089D5E| db $86, $62
|089D60| db $86, $A2
|089D62| db $86, $A2

|089D64| db $8A, $A2
|089D66| db $8A, $62
|089D68| db $8A, $22
|089D6A| db $8A, $62
|089D6C| db $8A, $62
|089D6E| db $8A, $E2

|089D70| db $9B, $22
|089D72| db $9B, $A2
|089D74| db $9B, $62
|089D76| db $9B, $E2
|089D78| db $9B, $A2
|089D7A| db $9B, $22

;---------------------------------------------------------------------------------------------------

.offset
|089D7C| dw  -8,  -8
|089D80| dw   0,   0
|089D84| dw   0,   0
|089D88| dw   0,   0
|089D8C| dw   0,   0
|089D90| dw   0,   0

|089D94| dw  -8,  -8
|089D98| dw  -8,   0
|089D9C| dw   0,  -8
|089DA0| dw   0,   0
|089DA4| dw   0,   0
|089DA8| dw   0,   0

|089DAC| dw -16, -16
|089DB0| dw -16,   0
|089DB4| dw   0, -16
|089DB8| dw   0,   0
|089DBC| dw   0,   0
|089DC0| dw   0,   0

|089DC4| dw -16, -16
|089DC8| dw -16,   0
|089DCC| dw   0, -16
|089DD0| dw   0,   0
|089DD4| dw   0,   0
|089DD8| dw   0,   0

|089DDC| dw  -8,  -8
|089DE0| dw -21, -22
|089DE4| dw -21,   8
|089DE8| dw   9, -22
|089DEC| dw   9,   8
|089DF0| dw   0,   0

|089DF4| dw  -6, -15
|089DF8| dw   0,  -1
|089DFC| dw -16,  -2
|089E00| dw  -8,  -7
|089E04| dw   0,   0
|089E08| dw   0,   0

|089E0C| dw  -9,  -4
|089E10| dw -21,  -5
|089E14| dw -12, -18
|089E18| dw -11,   7
|089E1C| dw   0, -15
|089E20| dw   4,  -2

|089E24| dw  -9,  -4
|089E28| dw -22,  -5
|089E2C| dw -13, -20
|089E30| dw -11,   8
|089E34| dw   1, -16
|089E38| dw   5,  -2

|089E3C| dw -20,   4
|089E40| dw -12, -19
|089E44| dw  -9,  16
|089E48| dw  -5,  -2
|089E4C| dw   2,  -9
|089E50| dw  10,   6

;---------------------------------------------------------------------------------------------------

.oam_size
|089E54| db $02
|089E55| db $01
|089E56| db $01
|089E57| db $01
|089E58| db $01
|089E59| db $01

|089E5A| db $00
|089E5B| db $00
|089E5C| db $00
|089E5D| db $00
|089E5E| db $01
|089E5F| db $01

|089E60| db $02
|089E61| db $02
|089E62| db $02
|089E63| db $02
|089E64| db $01
|089E65| db $01

|089E66| db $02
|089E67| db $02
|089E68| db $02
|089E69| db $02
|089E6A| db $01
|089E6B| db $01

|089E6C| db $02
|089E6D| db $02
|089E6E| db $02
|089E6F| db $02
|089E70| db $02
|089E71| db $01

|089E72| db $02
|089E73| db $02
|089E74| db $02
|089E75| db $02
|089E76| db $01
|089E77| db $01

|089E78| db $02
|089E79| db $02
|089E7A| db $02
|089E7B| db $02
|089E7C| db $02
|089E7D| db $02

|089E7E| db $02
|089E7F| db $02
|089E80| db $02
|089E81| db $02
|089E82| db $02
|089E83| db $02

|089E84| db $00
|089E85| db $00
|089E86| db $00
|089E87| db $00
|089E88| db $00
|089E89| db $00

;---------------------------------------------------------------------------------------------------

.data_offset
|089E8A| db $00
|089E8B| db $06
|089E8C| db $0C
|089E8D| db $12
|089E8E| db $18
|089E8F| db $1E
|089E90| db $24
|089E91| db $2A
|089E92| db $30

;---------------------------------------------------------------------------------------------------

.object_count
|089E93| db $01
|089E94| db $04
|089E95| db $04
|089E96| db $04
|089E97| db $04
|089E98| db $04
|089E99| db $05
|089E9A| db $04
|089E9B| db $06
|089E9C| db $06
|089E9D| db $06

;===================================================================================================

AncillaDraw_Bomb:
|089E9E| JSR Ancilla_PrepOAMCoord.adjusted

|089EA1| REP #$20

|089EA3| LDA.w $029E,X
|089EA6| AND.w #$00FF
|089EA9| CMP.w #$0080
|089EAC| BCC .positive_z

|089EAE| ORA.w #$FF00

;---------------------------------------------------------------------------------------------------

.positive_z
|089EB1| STA.b $04
|089EB3| BEQ .not_max_priority

|089EB5| CMP.w #$FFFF
|089EB8| BEQ .not_max_priority

|089EBA| LDA.w $0380,X
|089EBD| AND.w #$00FF
|089EC0| CMP.w #$0003
|089EC3| BEQ .not_max_priority

|089EC5| LDA.w $0280,X
|089EC8| AND.w #$00FF
|089ECB| BEQ .not_max_priority

|089ECD| LDA.w #$3000
|089ED0| STA.b $64

;---------------------------------------------------------------------------------------------------

.not_max_priority
|089ED2| LDA.w #$0000
|089ED5| CLC
|089ED6| ADC.b $04

|089ED8| EOR.w #$FFFF
|089EDB| INC A
|089EDC| CLC
|089EDD| ADC.b $00
|089EDF| STA.b $00

|089EE1| SEP #$20

|089EE3| LDY.w $0C5E,X

|089EE6| LDA.w BombAnimationSteps,Y
|089EE9| TAY

|089EEA| LDA.w BombDraw.data_offset,Y
|089EED| ASL A
|089EEE| TAY

|089EEF| ASL A
|089EF0| STA.b $04

|089EF2| STZ.b $05
|089EF4| STZ.b $0A

|089EF6| LDA.b #$02
|089EF8| STA.b $0B

;---------------------------------------------------------------------------------------------------

|089EFA| LDA.w $0C5E,X
|089EFD| BNE .dont_flash

|089EFF| LDA.b #$04
|089F01| STA.b $0B

|089F03| LDA.w $039F,X
|089F06| CMP.b #$20
|089F08| BCS .dont_flash

|089F0A| AND.b #$0E
|089F0C| STA.b $0B

;---------------------------------------------------------------------------------------------------

.dont_flash
|089F0E| PHX
|089F0F| PHY

|089F10| LDA.w $0C5E,X
|089F13| STA.b $08
|089F15| BNE .continue

|089F17| LDA.w $0385,X
|089F1A| BNE .not_deferred

|089F1C| LDA.w $0E20
|089F1F| CMP.b #$92 ; SPRITE 92
|089F21| BEQ .outmaneuver_this

|089F23| TXY
|089F24| INY
|089F25| CPY.w $02EC
|089F28| BNE .not_deferred

;---------------------------------------------------------------------------------------------------

.outmaneuver_this
|089F2A| LDA.w $0308
|089F2D| AND.b #$80
|089F2F| BEQ .not_carried

|089F31| LDA.w $0380,X
|089F34| CMP.b #$03
|089F36| BEQ .not_deferred

|089F38| LDA.b $2F
|089F3A| BNE .not_deferred

.not_carried
|089F3C| LDA.b #$0C
|089F3E| JSR AllocateOAMInRegionsBE

|089F41| BRA .continue

;---------------------------------------------------------------------------------------------------

.not_deferred
|089F43| LDA.w $0FB3
|089F46| BEQ .continue

|089F48| LDA.w $0C7C,X
|089F4B| BEQ .continue

|089F4D| LDA.w $0385,X
|089F50| BNE .hardcode_slot

|089F52| TXY
|089F53| INY
|089F54| CPY.w $02EC
|089F57| BNE .continue

|089F59| LDA.w $0308
|089F5C| BPL .continue

;---------------------------------------------------------------------------------------------------

.hardcode_slot
|089F5E| REP #$20

|089F60| LDA.w #$00D0
|089F63| CLC
|089F64| ADC.w #$0800
|089F67| STA.b $90

|089F69| LDA.w #$0034
|089F6C| CLC
|089F6D| ADC.w #$0A20
|089F70| STA.b $92

|089F72| SEP #$20

;---------------------------------------------------------------------------------------------------

.continue
|089F74| LDY.b $08

|089F76| LDA.w BombDraw.object_count,Y
|089F79| STA.b $08

|089F7B| CPY.b #$00
|089F7D| BNE .zero_objects

|089F7F| LDA.w $03E4,X
|089F82| CMP.b #$09 ; TILETYPE 09
|089F84| BEQ .am_on_shallow_water

|089F86| CMP.b #$40
|089F88| BNE .zero_objects

.am_on_shallow_water
|089F8A| LDY.b #$08
|089F8C| BRA .this_many

.zero_objects
|089F8E| LDY.b #$00

.this_many
|089F90| LDA.b $00
|089F92| STA.b $0C

|089F94| LDA.b $01
|089F96| STA.b $0D

|089F98| LDA.b $02
|089F9A| STA.b $0E

|089F9C| LDA.b $03
|089F9E| STA.b $0F

|089FA0| STZ.b $06

|089FA2| PLX

|089FA3| JSR AncillaDraw_Explosion

|089FA6| PLX

|089FA7| JSL AncillaDraw_BombExtraStuff
|089FAB| BCS .exit

|089FAD| LDX.b $0A
|089FAF| JSR AncillaDraw_Shadow

|089FB2| LDX.w $0FA0

.exit
|089FB5| RTS

;===================================================================================================

Ancilla08_DoorDebris:
|089FB6| JSR AncillaDraw_DoorDebris

|089FB9| DEC.w $03C0,X
|089FBC| BPL .exit

|089FBE| LDA.b #$07
|089FC0| STA.w $03C0,X

|089FC3| INC.w $03C2,X

|089FC6| LDA.w $03C2,X
|089FC9| CMP.b #$04
|089FCB| BNE .exit

|089FCD| STZ.w $0C4A,X

.exit
|089FD0| RTS

;===================================================================================================

pool AncillaDraw_DoorDebris

.offset
|089FD1| dw   4,   7
|089FD5| dw   3,  17

|089FD9| dw   8,   8
|089FDD| dw   7,  17

|089FE1| dw  11,   7
|089FE5| dw  10,  16

|089FE9| dw  16,   7
|089FED| dw  17,  17

|089FF1| dw  20,   7
|089FF5| dw  21,  17

|089FF9| dw  16,   8
|089FFD| dw  17,  17

|08A001| dw  13,   7
|08A005| dw  14,  16

|08A009| dw   8,   7
|08A00D| dw   7,  17

|08A011| dw   7,   4
|08A015| dw  17,   3

|08A019| dw   8,   8
|08A01D| dw  17,   7

|08A021| dw   7,  11
|08A025| dw  16,  10

|08A029| dw   7,  16
|08A02D| dw  17,  17

|08A031| dw   7,  20
|08A035| dw  17,  21

|08A039| dw   8,  16
|08A03D| dw  17,  17

|08A041| dw   7,  13
|08A045| dw  16,  14

|08A049| dw   7,   8
|08A04D| dw  17,   7

;---------------------------------------------------------------------------------------------------

.char_and_prop
|08A051| db $5E, $20
|08A053| db $5E, $E0

|08A055| db $5E, $A0
|08A057| db $5E, $60

|08A059| db $4F, $20
|08A05B| db $4F, $20

|08A05D| db $4F, $20
|08A05F| db $4F, $20

|08A061| db $5E, $60
|08A063| db $5E, $60

|08A065| db $5E, $20
|08A067| db $5E, $E0

|08A069| db $4F, $60
|08A06B| db $4F, $60

|08A06D| db $4F, $60
|08A06F| db $4F, $60

|08A071| db $5E, $20
|08A073| db $5E, $E0

|08A075| db $5E, $A0
|08A077| db $5E, $60

|08A079| db $4F, $20
|08A07B| db $4F, $E0

|08A07D| db $4F, $20
|08A07F| db $4F, $20

|08A081| db $5E, $60
|08A083| db $5E, $60

|08A085| db $5E, $20
|08A087| db $5E, $E0

|08A089| db $4F, $60
|08A08B| db $4F, $60

|08A08D| db $4F, $60
|08A08F| db $4F, $60

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_DoorDebris:
|08A091| JSR Ancilla_PrepOAMCoord.adjusted

|08A094| TXA
|08A095| ASL A
|08A096| TAY

|08A097| REP #$20

|08A099| LDA.w $03BA,Y
|08A09C| SEC
|08A09D| SBC.b $E8
|08A09F| STA.b $0C

|08A0A1| LDA.w $03B6,Y
|08A0A4| SEC
|08A0A5| SBC.b $E2
|08A0A7| STA.b $0E

|08A0A9| SEP #$20

|08A0AB| PHX

|08A0AC| STZ.b $06

|08A0AE| LDA.w $03C2,X
|08A0B1| ASL A
|08A0B2| ASL A
|08A0B3| STA.b $04
|08A0B5| STA.b $08

|08A0B7| LDA.w $03BE,X
|08A0BA| ASL A
|08A0BB| ASL A
|08A0BC| ASL A
|08A0BD| ASL A
|08A0BE| STA.b $0A

|08A0C0| CLC
|08A0C1| ADC.b $04
|08A0C3| TAX

;---------------------------------------------------------------------------------------------------

|08A0C4| LDY.b #$00

.next_object
|08A0C6| PHX

|08A0C7| LDA.b $0A
|08A0C9| ASL A
|08A0CA| STA.b $04

|08A0CC| LDA.b $08
|08A0CE| ASL A
|08A0CF| CLC
|08A0D0| ADC.b $04
|08A0D2| STA.b $04

|08A0D4| LDA.b $06
|08A0D6| ASL A
|08A0D7| ASL A
|08A0D8| CLC
|08A0D9| ADC.b $04
|08A0DB| TAX

|08A0DC| REP #$20

|08A0DE| LDA.w .offset+0,X
|08A0E1| CLC
|08A0E2| ADC.b $0C
|08A0E4| STA.b $00

|08A0E6| LDA.w .offset+2,X
|08A0E9| CLC
|08A0EA| ADC.b $0E
|08A0EC| STA.b $02

|08A0EE| SEP #$20

|08A0F0| PLX

|08A0F1| JSR Ancilla_SetOAM_XY

|08A0F4| LDA.w .char_and_prop+0,X
|08A0F7| STA.b ($90),Y

|08A0F9| INY

|08A0FA| LDA.w .char_and_prop+1,X
|08A0FD| AND.b #$C0
|08A0FF| ORA.b $65
|08A101| STA.b ($90),Y

|08A103| INY

|08A104| PHY
|08A105| TYA

|08A106| SEC
|08A107| SBC.b #$04

|08A109| LSR A
|08A10A| LSR A
|08A10B| TAY

|08A10C| LDA.b #$00
|08A10E| STA.b ($92),Y

|08A110| PLY
|08A111| JSR AllocateOAMInCustomRegion

|08A114| INX
|08A115| INX

|08A116| LDA.b $06
|08A118| INC A
|08A119| STA.b $06

|08A11B| CMP.b #$02
|08A11D| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08A11F| PLX

|08A120| RTS

;===================================================================================================

pool Ancilla09_Arrow

.offset_y
|08A121| dw  -4,   2,   0,   0

.offset_x
|08A129| dw   0,   0,  -4,   4

endpool

;---------------------------------------------------------------------------------------------------

Ancilla09_Arrow:
|08A131| LDA.b $11
|08A133| BEQ .good_submode

|08A135| BRL .proceed_to_draw

.good_submode
|08A138| DEC.w $0C5E,X

|08A13B| LDA.w $0C5E,X
|08A13E| BMI .timer_done

|08A140| CMP.b #$04
|08A142| BCC .start_moving

|08A144| BRL .exit

;---------------------------------------------------------------------------------------------------

.timer_done
|08A147| LDA.b #$FF
|08A149| STA.w $0C5E,X

.start_moving
|08A14C| JSR AncillaMoveY
|08A14F| JSR AncillaMoveX

|08A152| LDA.l $7EF340
|08A156| AND.b #$04
|08A158| BEQ .no_sparkle

|08A15A| LDA.b $1A
|08A15C| AND.b #$01
|08A15E| BNE .no_sparkle

|08A160| PHX

|08A161| JSL AncillaAdd_SilverArrowSparkle

|08A165| PLX

.no_sparkle
|08A166| LDA.b #$FF
|08A168| STA.w $03A9,X

|08A16B| JSR Ancilla_CheckSpriteCollision
|08A16E| BCS .sprite_collision

|08A170| JSR Ancilla_CheckTileCollision
|08A173| BCS .tile_collision

|08A175| BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.tile_collision
|08A178| TYA
|08A179| STA.w $03C5,X

|08A17C| LDA.w $0C72,X
|08A17F| AND.b #$03
|08A181| ASL A
|08A182| TAY

|08A183| LDA.w .offset_y+0,Y
|08A186| CLC
|08A187| ADC.w $0BFA,X
|08A18A| STA.w $0BFA,X

|08A18D| LDA.w .offset_y+1,Y
|08A190| ADC.w $0C0E,X
|08A193| STA.w $0C0E,X

|08A196| LDA.w .offset_x+0,Y
|08A199| CLC
|08A19A| ADC.w $0C04,X
|08A19D| STA.w $0C04,X

|08A1A0| LDA.w .offset_x+1,Y
|08A1A3| ADC.w $0C18,X
|08A1A6| STA.w $0C18,X

|08A1A9| STZ.w $0B88

|08A1AC| BRA .become_stopped

;---------------------------------------------------------------------------------------------------

.sprite_collision
|08A1AE| LDA.w $0C04,X
|08A1B1| SEC
|08A1B2| SBC.w $0D10,Y
|08A1B5| STA.w $0C2C,X

|08A1B8| LDA.w $0BFA,X
|08A1BB| SEC
|08A1BC| SBC.w $0D00,Y
|08A1BF| CLC
|08A1C0| ADC.w $0F70,Y
|08A1C3| STA.w $0C22,X

|08A1C6| TYA
|08A1C7| STA.w $03A9,X

|08A1CA| LDA.w $0E20,Y
|08A1CD| CMP.b #$65 ; SPRITE 65
|08A1CF| BNE .not_arrow_game

|08A1D1| LDA.w $0D90,Y
|08A1D4| CMP.b #$01
|08A1D6| BNE .not_arrow_game_target

|08A1D8| LDA.b #$2D ; SFX3.2D
|08A1DA| STA.w $012F

|08A1DD| LDA.b #$80
|08A1DF| STA.w $0E10,Y
|08A1E2| STA.w $0F10 ; [HARDCODED] sprite slot

|08A1E5| LDA.w $0B88
|08A1E8| CMP.b #$09
|08A1EA| BCS .the_99_dream

|08A1EC| INC.w $0B88

.the_99_dream
|08A1EF| LDA.w $0B88
|08A1F2| STA.w $0DA0,Y

|08A1F5| LDA.w $0ED0,Y
|08A1F8| INC A
|08A1F9| STA.w $0ED0,Y

|08A1FC| BRA .become_stopped

;---------------------------------------------------------------------------------------------------

.not_arrow_game_target
|08A1FE| LDA.b #$04
|08A200| STA.w $0EE0,Y

.not_arrow_game
|08A203| STZ.w $0B88

;---------------------------------------------------------------------------------------------------

.become_stopped
|08A206| LDA.w $0E20,Y
|08A209| CMP.b #$1B ; SPRITE 1B
|08A20B| BEQ .not_enemy_arrow

|08A20D| LDA.b #$08 ; SFX2.08
|08A20F| JSR Ancilla_SFX2_Pan

.not_enemy_arrow
|08A212| STZ.w $0C5E,X

|08A215| LDA.b #$0A ; ANCILLA 0A
|08A217| STA.w $0C4A,X

|08A21A| LDA.b #$01
|08A21C| STA.w $03B1,X

|08A21F| LDA.w $03C5,X
|08A222| BEQ .proceed_to_draw

|08A224| REP #$20

|08A226| LDA.b $E0
|08A228| SEC
|08A229| SBC.b $E2
|08A22B| CLC
|08A22C| ADC.w $0C04,X
|08A22F| STA.b $00

|08A231| LDA.b $E6
|08A233| SEC
|08A234| SBC.b $E8
|08A236| CLC
|08A237| ADC.w $0BFA,X
|08A23A| STA.b $02

|08A23C| SEP #$20

|08A23E| LDA.b $00
|08A240| STA.w $0C04,X

|08A243| LDA.b $02
|08A245| STA.w $0BFA,X

|08A248| BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.exit
|08A24A| RTS

.proceed_to_draw
|08A24B| BRL AncillaDraw_Arrow

;===================================================================================================

pool AncillaDraw_Arrow

.char_and_prop
|08A24E| db $2B, $A4
|08A250| db $2A, $A4

|08A252| db $2A, $24
|08A254| db $2B, $24

|08A256| db $3D, $64
|08A258| db $3A, $64

|08A25A| db $3A, $24
|08A25C| db $3D, $24

|08A25E| db $2B, $A4
|08A260| db $FF, $FF

|08A262| db $2B, $24
|08A264| db $FF, $FF

|08A266| db $3D, $64
|08A268| db $FF, $FF

|08A26A| db $3D, $24
|08A26C| db $FF, $FF

|08A26E| db $3C, $A4
|08A270| db $2C, $A4

|08A272| db $3C, $A4
|08A274| db $2A, $A4

|08A276| db $3C, $A4
|08A278| db $2C, $E4

|08A27A| db $3C, $A4
|08A27C| db $2A, $A4

|08A27E| db $2C, $24
|08A280| db $3C, $24

|08A282| db $2A, $24
|08A284| db $3C, $24

|08A286| db $2C, $64
|08A288| db $3C, $24

|08A28A| db $2A, $24
|08A28C| db $3C, $24

|08A28E| db $3B, $64
|08A290| db $2D, $64

|08A292| db $3B, $64
|08A294| db $3A, $E4

|08A296| db $3B, $64
|08A298| db $2D, $E4

|08A29A| db $3B, $64
|08A29C| db $3A, $E4

|08A29E| db $2D, $24
|08A2A0| db $3B, $24

|08A2A2| db $3A, $24
|08A2A4| db $3B, $A4

|08A2A6| db $2D, $A4
|08A2A8| db $3B, $24

|08A2AA| db $3A, $24
|08A2AC| db $3B, $A4

;---------------------------------------------------------------------------------------------------

.offset
|08A2AE| dw   0,   0
|08A2B2| dw   8,   0

|08A2B6| dw   0,   0
|08A2BA| dw   8,   0

|08A2BE| dw   0,   0
|08A2C2| dw   0,   8

|08A2C6| dw   0,   0
|08A2CA| dw   0,   8

|08A2CE| dw   0,   0
|08A2D2| dw   0,   0

|08A2D6| dw   0,   0
|08A2DA| dw   0,   0

|08A2DE| dw   0,   0
|08A2E2| dw   0,   0

|08A2E6| dw   0,   0
|08A2EA| dw   0,   0

|08A2EE| dw   0,   1
|08A2F2| dw   8,   1

|08A2F6| dw   0,   0
|08A2FA| dw   8,   0

|08A2FE| dw   0,  -1
|08A302| dw   8,  -2

|08A306| dw   0,   0
|08A30A| dw   8,   0

|08A30E| dw   0,   1
|08A312| dw   8,   1

|08A316| dw   0,   0
|08A31A| dw   8,   0

|08A31E| dw   0,  -2
|08A322| dw   8,  -1

|08A326| dw   0,   0
|08A32A| dw   8,   0

|08A32E| dw  -1,   0
|08A332| dw  -1,   8

|08A336| dw   0,   0
|08A33A| dw   0,   8

|08A33E| dw   0,   0
|08A342| dw   1,   8

|08A346| dw   0,   0
|08A34A| dw   0,   8

|08A34E| dw  -1,   0
|08A352| dw  -1,   8

|08A356| dw   0,   0
|08A35A| dw   0,   8

|08A35E| dw   1,   0
|08A362| dw   0,   8

|08A366| dw   0,   0
|08A36A| dw   0,   8

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_Arrow:
|08A36E| JSR Ancilla_PrepOAMCoord.adjusted

|08A371| LDA.w $0280,X
|08A374| BEQ .normal_priority

|08A376| LDA.b #$30
|08A378| STA.b $65

.normal_priority
|08A37A| REP #$20

|08A37C| LDA.b $00
|08A37E| STA.b $0C

|08A380| LDA.b $02
|08A382| STA.b $0E
|08A384| STA.b $04

|08A386| LDA.w $03C5,X
|08A389| AND.w #$00FF
|08A38C| BEQ .regular_collision

;---------------------------------------------------------------------------------------------------

|08A38E| LDA.b $E8
|08A390| SEC
|08A391| SBC.b $E6
|08A393| CLC
|08A394| ADC.b $0C
|08A396| STA.b $0C

|08A398| LDA.b $E2
|08A39A| SEC
|08A39B| SBC.b $E0
|08A39D| CLC
|08A39E| ADC.b $0E
|08A3A0| STA.b $0E
|08A3A2| STA.b $04

;---------------------------------------------------------------------------------------------------

.regular_collision
|08A3A4| SEP #$20

|08A3A6| LDA.w $0C5E,X
|08A3A9| STA.b $07

|08A3AB| LDA.w $0C72,X
|08A3AE| AND.b #$FB
|08A3B0| TAY

|08A3B1| LDA.w $0C4A,X
|08A3B4| CMP.b #$0A ; ANCILLA 0A
|08A3B6| BNE .not_halted

|08A3B8| LDA.w $0C5E,X
|08A3BB| AND.b #$08
|08A3BD| BEQ .wiggle

|08A3BF| LDA.b #$01
|08A3C1| BRA .continue

.wiggle
|08A3C3| LDA.w $0C5E,X
|08A3C6| AND.b #$03

;---------------------------------------------------------------------------------------------------

.continue
|08A3C8| STA.b $0A

|08A3CA| TYA
|08A3CB| ASL A
|08A3CC| ASL A
|08A3CD| CLC
|08A3CE| ADC.b #$08
|08A3D0| CLC
|08A3D1| ADC.b $0A
|08A3D3| TAY

|08A3D4| BRA .get_palette

;---------------------------------------------------------------------------------------------------

.not_halted
|08A3D6| LDA.w $0C5E,X
|08A3D9| BMI .get_palette

|08A3DB| TYA
|08A3DC| ORA.b #$04
|08A3DE| TAY

;---------------------------------------------------------------------------------------------------

.get_palette
|08A3DF| PHX

|08A3E0| TYA
|08A3E1| ASL A
|08A3E2| ASL A
|08A3E3| TAX

|08A3E4| LDY.b #$02
|08A3E6| LDA.l $7EF340

|08A3EA| AND.b #$04
|08A3EC| BNE .silvers

|08A3EE| LDY.b #$04

.silvers
|08A3F0| STY.b $74

|08A3F2| LDY.b #$00
|08A3F4| STZ.b $06

;---------------------------------------------------------------------------------------------------

.next_object
|08A3F6| LDA.w .char_and_prop+0,X
|08A3F9| CMP.b #$FF
|08A3FB| BEQ .skip

|08A3FD| STA.b $72

|08A3FF| PHX

|08A400| TXA
|08A401| ASL A
|08A402| TAX

|08A403| REP #$20

|08A405| LDA.w .offset+0,X
|08A408| CLC
|08A409| ADC.b $0C
|08A40B| STA.b $00

|08A40D| LDA.w .offset+2,X
|08A410| CLC
|08A411| ADC.b $0E
|08A413| STA.b $02

|08A415| SEP #$20

|08A417| JSR Ancilla_SetOAM_XY

|08A41A| PLX

|08A41B| LDA.b $72
|08A41D| STA.b ($90),Y

|08A41F| INY

|08A420| LDA.w .char_and_prop+1,X
|08A423| AND.b #$C1
|08A425| ORA.b $74
|08A427| ORA.b $65
|08A429| STA.b ($90),Y

|08A42B| INY

|08A42C| PHY

|08A42D| TYA
|08A42E| SEC
|08A42F| SBC.b #$04
|08A431| LSR A
|08A432| LSR A
|08A433| TAY

|08A434| LDA.b #$00
|08A436| STA.b ($92),Y

|08A438| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08A439| INX
|08A43A| INX

|08A43B| INC.b $06

|08A43D| LDA.b $06
|08A43F| CMP.b #$02
|08A441| BEQ .done

;---------------------------------------------------------------------------------------------------

|08A443| BRL .next_object

.done
|08A446| PLX

|08A447| LDY.b #$01

|08A449| LDA.b ($90),Y
|08A44B| CMP.b #$F0
|08A44D| BNE .exit

|08A44F| LDY.b #$05

|08A451| LDA.b ($90),Y
|08A453| CMP.b #$F0
|08A455| BNE .exit

|08A457| BRL Arrow_DeleteSelf

.exit
|08A45A| RTS

;===================================================================================================

Ancilla0A_LodgedArrow:
|08A45B| LDY.w $03A9,X
|08A45E| BMI .not_sprite_collided

|08A460| LDA.w $0DD0,Y
|08A463| CMP.b #$09
|08A465| BCC Arrow_DeleteSelf

|08A467| LDA.w $0F70,Y
|08A46A| BMI Arrow_DeleteSelf

|08A46C| LDA.w $0BA0,Y
|08A46F| BNE Arrow_DeleteSelf

|08A471| LDA.w $0CAA,Y
|08A474| AND.b #$02
|08A476| BNE Arrow_DeleteSelf

;---------------------------------------------------------------------------------------------------

|08A478| STZ.b $00

|08A47A| LDA.w $0C2C,X
|08A47D| BPL .positive_x

|08A47F| DEC.b $00

.positive_x
|08A481| CLC
|08A482| ADC.w $0D10,Y
|08A485| STA.w $0C04,X

|08A488| LDA.w $0D30,Y
|08A48B| ADC.b $00
|08A48D| STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

|08A490| STZ.b $00

|08A492| LDA.w $0C22,X
|08A495| BPL .positive_y

|08A497| DEC.b $00

.positive_y
|08A499| CLC
|08A49A| ADC.w $0D00,Y
|08A49D| PHP

|08A49E| SEC
|08A49F| SBC.w $0F70,Y
|08A4A2| STA.w $0BFA,X

|08A4A5| LDA.w $0D20,Y
|08A4A8| SBC.b #$00

|08A4AA| PLP
|08A4AB| ADC.b $00
|08A4AD| STA.w $0C0E,X

;---------------------------------------------------------------------------------------------------

.not_sprite_collided
|08A4B0| LDA.b $11
|08A4B2| BEQ .continue

|08A4B4| BRA .proceed_to_draw

.continue
|08A4B6| DEC.w $03B1,X

|08A4B9| LDA.w $03B1,X
|08A4BC| BNE .proceed_to_draw

|08A4BE| LDA.b #$02
|08A4C0| STA.w $03B1,X

|08A4C3| INC.w $0C5E,X

|08A4C6| LDA.w $0C5E,X
|08A4C9| CMP.b #$09
|08A4CB| BEQ Arrow_DeleteSelf

|08A4CD| AND.b #$08
|08A4CF| BEQ .proceed_to_draw

|08A4D1| LDA.b #$80
|08A4D3| STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
|08A4D6| JML AncillaDraw_Arrow

;===================================================================================================

Arrow_DeleteSelf:
|08A4DA| BRL Ancilla_DeleteSelf

;===================================================================================================

Ancilla0B_IceRodShot:
|08A4DD| LDA.b $11
|08A4DF| BEQ .continue

|08A4E1| BRA .generate_sparkle

.continue
|08A4E3| DEC.w $03B1,X
|08A4E6| BPL .delay_a

|08A4E8| LDA.w $0C5E,X
|08A4EB| INC A
|08A4EC| STA.w $0C5E,X

|08A4EF| AND.b #$FE
|08A4F1| BEQ .delay_b

|08A4F3| LDA.b #$01
|08A4F5| STA.w $0C54,X

|08A4F8| LDA.w $0C5E,X
|08A4FB| AND.b #$07
|08A4FD| ORA.b #$04
|08A4FF| STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.delay_b
|08A502| LDA.b #$03
|08A504| STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.delay_a
|08A507| LDA.w $0C54,X
|08A50A| BEQ .generate_sparkle

|08A50C| JSR Ancilla_KillOffscreen

|08A50F| JSR AncillaMoveY
|08A512| JSR AncillaMoveX

|08A515| JSR Ancilla_CheckSpriteCollision
|08A518| BCS .sprite_collision

|08A51A| JSR Ancilla_CheckTileCollision
|08A51D| BCC .generate_sparkle

.sprite_collision
|08A51F| LDA.b #$11 ; ANCILLA 11
|08A521| STA.w $0C4A,X

|08A524| TAY

|08A525| LDA.w AncillaObjectAllocation,Y
|08A528| STA.w $0C90,X

|08A52B| STZ.w $0C5E,X

|08A52E| LDA.b #$04
|08A530| STA.w $03B1,X

.generate_sparkle
|08A533| BRL AncillaAdd_IceRodSparkle

;===================================================================================================

Ancilla11_IceRodWallHit:
|08A536| DEC.w $03B1,X
|08A539| BPL .delay

|08A53B| LDA.b #$07
|08A53D| STA.w $03B1,X

|08A540| INC.w $0C5E,X

|08A543| LDA.w $0C5E,X
|08A546| CMP.b #$02
|08A548| BNE .delay

|08A54A| STZ.w $0C4A,X

|08A54D| RTS

.delay
|08A54E| BRL AncillaDraw_IceRodWallHit

;===================================================================================================

pool AncillaDraw_IceRodWallHit

.char_and_prop
|08A551| db $CF, $24
|08A553| db $CF, $24
|08A555| db $CF, $24
|08A557| db $CF, $24

|08A559| db $DF, $24
|08A55B| db $DF, $24
|08A55D| db $DF, $24
|08A55F| db $DF, $24

.offset
|08A561| db   0,   0
|08A563| db   0,   8
|08A565| db   8,   0
|08A567| db   8,   8

|08A569| db  -8,  -8
|08A56B| db  -8,  16
|08A56D| db  16,  -8
|08A56F| db  16,  16

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_IceRodWallHit:
|08A571| JSR Ancilla_PrepOAMCoord

|08A574| PHX

|08A575| LDA.w $0C90,X
|08A578| JSR AllocateOAMInRegionsADF

|08A57B| LDA.w $0C5E,X
|08A57E| ASL A
|08A57F| ASL A
|08A580| ASL A
|08A581| TAX

;---------------------------------------------------------------------------------------------------

|08A582| LDY.b #$00

|08A584| STZ.b $04

.next_object
|08A586| REP #$20

|08A588| LDA.w .offset+0,X
|08A58B| AND.w #$00FF
|08A58E| CMP.w #$0080
|08A591| BCC .x_positive

|08A593| ORA.w #$FF00

.x_positive
|08A596| CLC
|08A597| ADC.b $00
|08A599| STA.b $08

|08A59B| LDA.w .offset+1,X
|08A59E| AND.w #$00FF
|08A5A1| CMP.w #$0080
|08A5A4| BCC .y_positive

|08A5A6| ORA.w #$FF00

.y_positive
|08A5A9| CLC
|08A5AA| ADC.b $02
|08A5AC| STA.b $0A

;---------------------------------------------------------------------------------------------------

|08A5AE| SEP #$20

|08A5B0| PHX
|08A5B1| LDX.b #$F0

|08A5B3| LDA.b $09
|08A5B5| BNE .off_screen

|08A5B7| LDA.b $0B
|08A5B9| BNE .off_screen

|08A5BB| LDA.b $0A
|08A5BD| STA.b ($90),Y

|08A5BF| LDA.b $08
|08A5C1| CMP.b #$F0
|08A5C3| BCS .off_screen

|08A5C5| TAX

.off_screen
|08A5C6| INY

|08A5C7| TXA
|08A5C8| STA.b ($90),Y

|08A5CA| INY

|08A5CB| PLX
|08A5CC| LDA.w .char_and_prop+0,X
|08A5CF| STA.b ($90),Y

|08A5D1| INY

|08A5D2| LDA.w .char_and_prop+1,X
|08A5D5| AND.b #$CF
|08A5D7| ORA.b $65
|08A5D9| STA.b ($90),Y

|08A5DB| INY
|08A5DC| PHY

|08A5DD| TYA
|08A5DE| SEC
|08A5DF| SBC.b #$04
|08A5E1| LSR A
|08A5E2| LSR A
|08A5E3| TAY

|08A5E4| LDA.b #$00
|08A5E6| STA.b ($92),Y

|08A5E8| PLY

|08A5E9| JSR AllocateOAMInCustomRegion

|08A5EC| INX
|08A5ED| INX

|08A5EE| INC.b $04

|08A5F0| LDA.b $04
|08A5F2| CMP.b #$04
|08A5F4| BEQ .done

|08A5F6| BRL .next_object

;---------------------------------------------------------------------------------------------------

.done
|08A5F9| PLX

|08A5FA| LDY.b #$01
|08A5FC| LDA.b ($90),Y

|08A5FE| CMP.b #$F0
|08A600| BNE .exit

|08A602| LDY.b #$05

|08A604| LDA.b ($90),Y
|08A606| CMP.b #$F0
|08A608| BNE .exit

|08A60A| STZ.w $0C4A,X

.exit
|08A60D| RTS

;===================================================================================================

Ancilla33_BlastWallExplosion:
|08A60E| LDA.b $11
|08A610| BNE .proceed_to_draw

|08A612| LDA.l $7F0000,X
|08A616| BEQ .inactive_component

|08A618| LDA.l $7F0008,X
|08A61C| DEC A
|08A61D| STA.l $7F0008,X
|08A621| BNE .proceed_to_draw

|08A623| LDA.l $7F0000,X
|08A627| INC A
|08A628| STA.l $7F0000,X
|08A62C| BEQ .no_fireball

|08A62E| CMP.b #$09
|08A630| BCS .no_fireball

;---------------------------------------------------------------------------------------------------

|08A632| PHX
|08A633| TXA

|08A634| ASL A
|08A635| ASL A
|08A636| STA.b $04

|08A638| LDY.b #$0A
|08A63A| LDA.b #$32 ; ANCILLA 32
|08A63C| JSL AncillaAdd_BlastWallFireball

|08A640| PLX

;---------------------------------------------------------------------------------------------------

.no_fireball
|08A641| LDA.l $7F0000,X
|08A645| CMP.b #$0B
|08A647| BNE .dont_reset_state

|08A649| LDA.b #$00
|08A64B| STA.l $7F0000,X
|08A64F| STA.l $7F0008,X

|08A653| BRA .proceed_to_draw

.dont_reset_state
|08A655| TAY

|08A656| LDA.b #$03
|08A658| STA.l $7F0008,X

.proceed_to_draw
|08A65C| BRL AncillaDraw_BlastWallExplosion

;---------------------------------------------------------------------------------------------------

.inactive_component
|08A65F| TXA
|08A660| EOR.b #$01
|08A662| TAX

|08A663| LDA.l $7F0000,X
|08A667| CMP.b #$06
|08A669| BNE .proceed_to_draw

|08A66B| LDA.l $7F0008,X
|08A66F| CMP.b #$02
|08A671| BNE .proceed_to_draw

|08A673| LDX.w $0380

|08A676| LDA.w $0C5E
|08A679| INC A
|08A67A| CMP.b #$07
|08A67C| BCC .reset_inactive_component

|08A67E| BRL AncillaDraw_BlastWallExplosion

;---------------------------------------------------------------------------------------------------

.reset_inactive_component
|08A681| STA.w $0C5E

|08A684| LDA.b #$01
|08A686| STA.l $7F0000,X

|08A68A| LDA.b #$03
|08A68C| STA.l $7F0008,X

|08A690| PHX

;---------------------------------------------------------------------------------------------------

|08A691| LDA.b #$03
|08A693| STA.b $06

.next_position
|08A695| STZ.b $00
|08A697| STZ.b $01
|08A699| STZ.b $02
|08A69B| STZ.b $03

|08A69D| STX.b $04

|08A69F| LDX.b #$00

|08A6A1| LDA.l $7F001C
|08A6A5| CMP.b #$04
|08A6A7| BCS .diverge_v

|08A6A9| LDX.b #$02

.diverge_v
|08A6AB| LDA.b #$0D
|08A6AD| STA.b $00,X

|08A6AF| LDA.b $06
|08A6B1| AND.b #$02
|08A6B3| BEQ .dont_invert

|08A6B5| LDA.b $00,X
|08A6B7| EOR.b #$FF
|08A6B9| INC A
|08A6BA| STA.b $00,X

|08A6BC| LDA.b #$FF
|08A6BE| STA.b $01,X

.dont_invert
|08A6C0| LDA.b $04
|08A6C2| ASL A
|08A6C3| ASL A
|08A6C4| ASL A
|08A6C5| STA.b $08

|08A6C7| LDA.b $06
|08A6C9| ASL A
|08A6CA| CLC
|08A6CB| ADC.b $08
|08A6CD| TAX

|08A6CE| REP #$20

|08A6D0| LDA.l $7F0020,X
|08A6D4| CLC
|08A6D5| ADC.b $00
|08A6D7| STA.l $7F0020,X

|08A6DB| LDA.l $7F0030,X
|08A6DF| CLC
|08A6E0| ADC.b $02
|08A6E2| STA.l $7F0030,X

|08A6E6| SEC
|08A6E7| SBC.b $E2
|08A6E9| STA.b $72

|08A6EB| SEP #$20

|08A6ED| LDA.b $73
|08A6EF| BNE .no_sfx

|08A6F1| LDA.b $72
|08A6F3| JSR Ancilla_SetPanRelativeCoordinates
|08A6F6| ORA.b #$0C ; SFX2.0C
|08A6F8| STA.w $012E

.no_sfx
|08A6FB| LDX.b $04

|08A6FD| DEC.b $06
|08A6FF| BPL .next_position

|08A701| PLX

;===================================================================================================

AncillaDraw_BlastWallExplosion:
|08A702| LDX.w $0380

|08A705| LDA.l $7F0000,X
|08A709| BEQ .dont_draw

|08A70B| LDY.b #$07

|08A70D| CPX.b #$01
|08A70F| BEQ .next_object

|08A711| LDY.b #$03

.next_object
|08A713| PHY
|08A714| PHX

|08A715| TYA
|08A716| ASL A
|08A717| TAX

|08A718| REP #$20

|08A71A| LDA.l $7F0020,X
|08A71E| STA.b $00

|08A720| LDA.l $7F0030,X
|08A724| STA.b $02

|08A726| SEP #$20

|08A728| PLX
|08A729| PLY

|08A72A| JSR AncillaDraw_BlastWallBlast

|08A72D| SEP #$20

|08A72F| DEY
|08A730| TYA
|08A731| AND.b #$03
|08A733| CMP.b #$03
|08A735| BNE .next_object

;---------------------------------------------------------------------------------------------------

.dont_draw
|08A737| LDA.w $0C5E
|08A73A| CMP.b #$06
|08A73C| BNE Ancilla_RestoreIndex

|08A73E| LDX.b #$01

.next_check
|08A740| LDA.l $7F0000,X
|08A744| BNE Ancilla_RestoreIndex

|08A746| DEX
|08A747| BPL .next_check

|08A749| STZ.w $0C4A
|08A74C| STZ.w $0C4B

|08A74F| STZ.w $0112

;===================================================================================================

Ancilla_RestoreIndex:
|08A752| LDX.w $0FA0

|08A755| RTS

;===================================================================================================

AncillaDraw_BlastWallBlast:
|08A756| PHX
|08A757| PHY

|08A758| LDA.b #$30
|08A75A| STA.b $65
|08A75C| STZ.b $64

|08A75E| LDA.l $7F0000,X
|08A762| TAY

|08A763| LDA.w BombDraw.object_count,Y
|08A766| STA.b $08

|08A768| LDA.w BombAnimationSteps,Y
|08A76B| TAY

|08A76C| LDA.w BombDraw.data_offset,Y
|08A76F| ASL A
|08A770| TAX

|08A771| ASL A
|08A772| STA.b $04
|08A774| STZ.b $05

|08A776| STZ.b $0A

|08A778| LDA.b #$32
|08A77A| STA.b $0B

|08A77C| STZ.b $06
|08A77E| STZ.b $07

|08A780| LDA.b #$18

|08A782| LDY.w $0FB3
|08A785| BEQ .use_region_a

|08A787| JSL AllocateOAMInRegionD

|08A78B| BRA .continue

.use_region_a
|08A78D| JSL AllocateOAMInRegionA

;---------------------------------------------------------------------------------------------------

.continue
|08A791| REP #$20

|08A793| LDA.b $00
|08A795| SEC
|08A796| SBC.b $E8
|08A798| STA.b $0C

|08A79A| LDA.b $02
|08A79C| SEC
|08A79D| SBC.b $E2
|08A79F| STA.b $0E

|08A7A1| SEP #$20

|08A7A3| LDY.b #$00
|08A7A5| JSR AncillaDraw_Explosion

|08A7A8| PLY
|08A7A9| PLX

|08A7AA| RTS

;===================================================================================================

AncillaDraw_Explosion:
.next_object
|08A7AB| LDA.w BombDraw.char_and_prop,X
|08A7AE| CMP.b #$FF
|08A7B0| BEQ .skip

|08A7B2| STX.b $72

|08A7B4| REP #$20

|08A7B6| STZ.b $74

|08A7B8| LDA.b $06
|08A7BA| ASL A
|08A7BB| ASL A
|08A7BC| CLC
|08A7BD| ADC.b $04
|08A7BF| TAX

|08A7C0| LDA.w BombDraw.offset+0,X
|08A7C3| CLC
|08A7C4| ADC.b $0C
|08A7C6| STA.b $00

|08A7C8| LDA.w BombDraw.offset+2,X
|08A7CB| CLC
|08A7CC| ADC.b $0E
|08A7CE| STA.b $02

|08A7D0| SEP #$20

|08A7D2| LDX.b $72

|08A7D4| JSR Ancilla_SetOAM_XY_safe

|08A7D7| LDA.w BombDraw.char_and_prop+0,X
|08A7DA| STA.b ($90),Y

|08A7DC| INY

|08A7DD| LDA.w BombDraw.char_and_prop+1,X
|08A7E0| AND.b #$C1
|08A7E2| ORA.b $65
|08A7E4| ORA.b $0B
|08A7E6| STA.b ($90),Y

|08A7E8| INY
|08A7E9| STY.b $72
|08A7EB| STX.b $73

|08A7ED| TYA
|08A7EE| SEC
|08A7EF| SBC.b #$04
|08A7F1| LSR A
|08A7F2| LSR A
|08A7F3| TAY

|08A7F4| TXA
|08A7F5| LSR A
|08A7F6| TAX

|08A7F7| LDA.w BombDraw.oam_size,X
|08A7FA| ORA.b $75

|08A7FC| STA.b ($92),Y

|08A7FE| LDX.b $73
|08A800| LDY.b $72

;---------------------------------------------------------------------------------------------------

.skip
|08A802| INX
|08A803| INX

|08A804| INC.b $06

|08A806| LDA.b $06
|08A808| CMP.b $08
|08A80A| BNE .next_object

|08A80C| RTS

;===================================================================================================

JumpSplash_char:
|08A80D| db $AC, $AE

;---------------------------------------------------------------------------------------------------

Ancilla15_JumpSplash:
|08A80F| LDA.b $11
|08A811| BNE AncillaDraw_JumpSplash

|08A813| DEC.w $03B1,X
|08A816| BPL .delay

|08A818| STZ.w $03B1,X

|08A81B| LDA.b #$01
|08A81D| STA.w $0C5E,X

.delay
|08A820| LDA.w $0C5E,X
|08A823| BEQ AncillaDraw_JumpSplash

|08A825| LDA.w $0C22,X
|08A828| CLC
|08A829| ADC.b #$FC
|08A82B| STA.w $0C22,X
|08A82E| STA.w $0C2C,X

|08A831| CMP.b #$E8
|08A833| BCS .speed_not_maxed

|08A835| STZ.w $0C4A,X

|08A838| LDA.w $02E0
|08A83B| BNE .am_bunny

|08A83D| LDA.b $5D
|08A83F| CMP.b #$04 ; LINKSTATE 04
|08A841| BNE .exit

.am_bunny
|08A843| LDA.w $0345
|08A846| BEQ .exit

|08A848| PHX
|08A849| JSL CheckAbilityToSwim
|08A84D| PLX

.exit
|08A84E| RTS

;---------------------------------------------------------------------------------------------------

.speed_not_maxed
|08A84F| JSR AncillaMoveY
|08A852| JSR AncillaMoveX

;===================================================================================================

AncillaDraw_JumpSplash:
|08A855| JSR Ancilla_PrepOAMCoord

|08A858| LDA.w $0C04,X
|08A85B| STA.b $06

|08A85D| LDA.w $0C18,X
|08A860| STA.b $07

|08A862| REP #$20

|08A864| LDA.b $22
|08A866| SEC
|08A867| SBC.b $06
|08A869| STA.b $08

|08A86B| LDA.b $22
|08A86D| CLC
|08A86E| ADC.b $08
|08A870| SEC
|08A871| SBC.b $E2
|08A873| STA.b $08

|08A875| LDA.b $06
|08A877| CLC
|08A878| ADC.w #$000C
|08A87B| SEC
|08A87C| SBC.b $E2
|08A87E| STA.b $06

;---------------------------------------------------------------------------------------------------

|08A880| SEP #$20

|08A882| PHX

|08A883| LDA.w $0C5E,X
|08A886| STA.b $0A

|08A888| TAX

|08A889| LDA.b #$01
|08A88B| STA.b $72

|08A88D| LDY.b #$00
|08A88F| STY.b $0C

;---------------------------------------------------------------------------------------------------

.next_object
|08A891| JSR Ancilla_SetOAM_XY

|08A894| LDA.w JumpSplash_char,X
|08A897| STA.b ($90),Y

|08A899| INY

|08A89A| LDA.b #$24
|08A89C| ORA.b $0C
|08A89E| STA.b ($90),Y

|08A8A0| INY
|08A8A1| PHY

|08A8A2| TYA
|08A8A3| SEC
|08A8A4| SBC.b #$04
|08A8A6| LSR A
|08A8A7| LSR A
|08A8A8| TAY

|08A8A9| LDA.b #$02
|08A8AB| STA.b ($92),Y

|08A8AD| PLY

;---------------------------------------------------------------------------------------------------

|08A8AE| JSR AllocateOAMInCustomRegion

|08A8B1| LDA.b $08
|08A8B3| STA.b $02

|08A8B5| LDA.b #$40
|08A8B7| STA.b $0C

|08A8B9| DEC.b $72
|08A8BB| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08A8BD| LDA.b $06
|08A8BF| STA.b $02

|08A8C1| JSR Ancilla_SetOAM_XY

|08A8C4| LDA.b #$C0
|08A8C6| STA.b ($90),Y

|08A8C8| INY
|08A8C9| LDA.b #$24
|08A8CB| STA.b ($90),Y

|08A8CD| INY
|08A8CE| TYA

|08A8CF| SEC
|08A8D0| SBC.b #$04

|08A8D2| LSR A
|08A8D3| LSR A
|08A8D4| TAY

|08A8D5| LDA.b #$02
|08A8D7| STA.b ($92),Y

|08A8D9| LDA.b $0A
|08A8DB| CMP.b #$01
|08A8DD| BNE .exit

|08A8DF| STA.b ($92),Y

.exit
|08A8E1| PLX

|08A8E2| RTS

;===================================================================================================

HitStar_char:
|08A8E3| db $90, $91

;---------------------------------------------------------------------------------------------------

Ancilla16_HitStars:
|08A8E5| DEC.w $039F,X
|08A8E8| BMI .continue

|08A8EA| RTS

.continue
|08A8EB| STZ.w $039F,X

|08A8EE| LDA.b $11
|08A8F0| BNE AncillaDraw_HitStars

|08A8F2| DEC.w $03B1,X
|08A8F5| BPL .delay

|08A8F7| STZ.w $03B1,X

|08A8FA| LDA.b #$01
|08A8FC| STA.w $0C5E,X

.delay
|08A8FF| LDA.w $0C5E,X
|08A902| BEQ AncillaDraw_HitStars

|08A904| LDA.w $0C22,X
|08A907| CLC
|08A908| ADC.b #$FC
|08A90A| STA.w $0C22,X
|08A90D| STA.w $0C2C,X

|08A910| CMP.b #$E8
|08A912| BCS .dont_die

|08A914| STZ.w $0C4A,X

|08A917| RTS

.dont_die
|08A918| JSR AncillaMoveY
|08A91B| JSR AncillaMoveX

;===================================================================================================

AncillaDraw_HitStars:
|08A91E| JSR Ancilla_PrepOAMCoord

|08A921| LDA.w $0C04,X
|08A924| STA.b $06

|08A926| LDA.w $0C18,X
|08A929| STA.b $07

|08A92B| LDA.w $038A,X
|08A92E| STA.b $72

|08A930| LDA.w $038F,X
|08A933| STA.b $73

|08A935| REP #$20

|08A937| LDA.b $72
|08A939| SEC
|08A93A| SBC.b $06
|08A93C| STA.b $08

|08A93E| LDA.b $72
|08A940| CLC
|08A941| ADC.b $08

|08A943| SEC
|08A944| SBC.w #$0008

|08A947| SEC
|08A948| SBC.b $E2
|08A94A| STA.b $08

;---------------------------------------------------------------------------------------------------

|08A94C| SEP #$20

|08A94E| LDA.w $0C54,X
|08A951| CMP.b #$02
|08A953| BNE .leave_allocation_alone

|08A955| LDA.b #$08
|08A957| JSR AllocateOAMInRegionsBE

.leave_allocation_alone
|08A95A| PHX

|08A95B| LDA.b #$01
|08A95D| STA.b $72

|08A95F| LDA.w $0C5E,X
|08A962| TAX

|08A963| LDY.b #$00
|08A965| STY.b $73

.next_object
|08A967| JSR Ancilla_SetOAM_XY

|08A96A| LDA.w HitStar_char,X
|08A96D| STA.b ($90),Y

|08A96F| INY

|08A970| LDA.b #$04
|08A972| ORA.b $65
|08A974| ORA.b $73
|08A976| STA.b ($90),Y

|08A978| INY

|08A979| PHY
|08A97A| TYA

|08A97B| SEC
|08A97C| SBC.b #$04

|08A97E| LSR A
|08A97F| LSR A
|08A980| TAY

|08A981| LDA.b #$00
|08A983| STA.b ($92),Y

|08A985| PLY

|08A986| JSR HitStars_UpdateOAMBufferPosition

|08A989| LDA.b #$40
|08A98B| STA.b $73

|08A98D| LDA.b $08
|08A98F| STA.b $02

|08A991| DEC.b $72
|08A993| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08A995| PLX

|08A996| RTS

;===================================================================================================

pool Ancilla17_ShovelDirt

.offset
|08A997| dw  18, -13
|08A99B| dw  -9,   4

|08A99F| dw  18,  13
|08A9A3| dw  -9, -11

.char
|08A9A7| db $40
|08A9A8| db $50

endpool

;---------------------------------------------------------------------------------------------------

Ancilla17_ShovelDirt:
|08A9A9| JSR Ancilla_PrepOAMCoord

|08A9AC| LDA.w $0C68,X
|08A9AF| BNE .dont_terminate

|08A9B1| LDA.b #$08
|08A9B3| STA.w $0C68,X

|08A9B6| INC.w $0C5E,X

|08A9B9| LDA.w $0C5E,X
|08A9BC| CMP.b #$02
|08A9BE| BNE .dont_terminate

|08A9C0| STZ.w $0C4A,X

|08A9C3| RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
|08A9C4| LDA.w $0C5E,X
|08A9C7| STA.b $0A

|08A9C9| ASL A
|08A9CA| ASL A
|08A9CB| STA.b $08

|08A9CD| LDY.b #$00

|08A9CF| LDA.b $2F
|08A9D1| CMP.b #$04
|08A9D3| BEQ .facing_left

|08A9D5| LDY.b #$08

.facing_left
|08A9D7| TYA
|08A9D8| CLC
|08A9D9| ADC.b $08
|08A9DB| TAY

;---------------------------------------------------------------------------------------------------

|08A9DC| REP #$20

|08A9DE| LDA.w .offset+0,Y
|08A9E1| CLC
|08A9E2| ADC.b $00
|08A9E4| STA.b $00

|08A9E6| LDA.w .offset+2,Y
|08A9E9| CLC
|08A9EA| ADC.b $02
|08A9EC| STA.b $02

|08A9EE| CLC
|08A9EF| ADC.w #$0008
|08A9F2| STA.b $04

|08A9F4| SEP #$20

|08A9F6| PHX

;---------------------------------------------------------------------------------------------------

|08A9F7| LDY.b #$00
|08A9F9| STY.b $72

.next_object
|08A9FB| JSR Ancilla_SetOAM_XY

|08A9FE| LDX.b $0A

|08AA00| LDA.w .char,X
|08AA03| CLC
|08AA04| ADC.b $72
|08AA06| STA.b ($90),Y

|08AA08| INY

|08AA09| LDA.b #$04
|08AA0B| ORA.b $65
|08AA0D| STA.b ($90),Y

|08AA0F| INY
|08AA10| PHY

|08AA11| TYA
|08AA12| SEC
|08AA13| SBC.b #$04
|08AA15| LSR A
|08AA16| LSR A
|08AA17| TAY

|08AA18| LDA.b #$00
|08AA1A| STA.b ($92),Y

|08AA1C| PLY

|08AA1D| JSR AllocateOAMInCustomRegion

|08AA20| LDA.b $04
|08AA22| STA.b $02

|08AA24| LDA.b $05
|08AA26| STA.b $03

|08AA28| INC.b $72

|08AA2A| LDA.b $72
|08AA2C| CMP.b #$02
|08AA2E| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08AA30| PLX

|08AA31| RTS

;===================================================================================================

pool AncillaDraw_BlastWallFireball

.char
|08AA32| db $9D, $9C, $8D

endpool

;===================================================================================================

Ancilla32_BlastWallFireball:
|08AA35| LDA.b $11
|08AA37| BNE AncillaDraw_BlastWallFireball

|08AA39| LDA.w $0C5E,X
|08AA3C| CLC
|08AA3D| ADC.b #$02
|08AA3F| STA.w $0C5E,X

|08AA42| CLC
|08AA43| ADC.w $0C22,X
|08AA46| STA.w $0C22,X

|08AA49| JSR AncillaMoveY
|08AA4C| JSR AncillaMoveX

|08AA4F| LDA.l $7F0040,X
|08AA53| DEC A
|08AA54| STA.l $7F0040,X

|08AA58| BPL AncillaDraw_BlastWallFireball

|08AA5A| STZ.w $0C4A,X

|08AA5D| RTS

;===================================================================================================

AncillaDraw_BlastWallFireball:
|08AA5E| LDA.b #$04

|08AA60| LDY.w $0FB3
|08AA63| BEQ .use_region_a

|08AA65| JSL AllocateOAMInRegionD
|08AA69| BRA .continue

.use_region_a
|08AA6B| JSL AllocateOAMInRegionA

;---------------------------------------------------------------------------------------------------

.continue
|08AA6F| LDY.b #$00

|08AA71| LDA.l $7F0040,X
|08AA75| STA.b $06

|08AA77| AND.b #$08
|08AA79| BNE .proceed_with_character

|08AA7B| LDY.b #$01

|08AA7D| LDA.b $06
|08AA7F| AND.b #$04
|08AA81| BNE .proceed_with_character

|08AA83| LDY.b #$02

.proceed_with_character
|08AA85| LDA.w .char,Y
|08AA88| STA.b $06

|08AA8A| JSR Ancilla_PrepOAMCoord

|08AA8D| LDY.b #$00
|08AA8F| JSR Ancilla_SetOAM_XY

|08AA92| LDA.b $06
|08AA94| STA.b ($90),Y

|08AA96| INY
|08AA97| LDA.b #$22
|08AA99| STA.b ($90),Y

|08AA9B| LDA.b #$00
|08AA9D| STA.b ($92)

|08AA9F| RTS

;===================================================================================================

Ancilla18_EtherSpell:
|08AAA0| LDA.b $11
|08AAA2| BEQ .submode_fine

|08AAA4| BRL .exit

;---------------------------------------------------------------------------------------------------

.submode_fine
|08AAA7| LDA.w $0C54,X
|08AAAA| BEQ .done_palette_flash

|08AAAC| LDA.w $031D
|08AAAF| BNE .lightning_descended

|08AAB1| INC.w $0BF0,X

|08AAB4| LDA.w $0BF0,X
|08AAB7| AND.b #$04
|08AAB9| BEQ .oversaturate

|08AABB| BRA .restore

;---------------------------------------------------------------------------------------------------

.lightning_descended
|08AABD| LDA.w $031D
|08AAC0| CMP.b #$0B
|08AAC2| BNE .restore

;---------------------------------------------------------------------------------------------------

.oversaturate
|08AAC4| PHX

|08AAC5| JSL RefreshEquipmentPalettes_zap
|08AAC9| JSL PaletteFilter_Oversaturation

|08AACD| PLX

|08AACE| BRA .done_palette_flash

;---------------------------------------------------------------------------------------------------

.restore
|08AAD0| PHX

|08AAD1| JSL RefreshEquipmentPalettes_sword_and_mail
|08AAD5| JSL RestorePalettesAfterFlash

|08AAD9| PLX

;---------------------------------------------------------------------------------------------------

.done_palette_flash
|08AADA| LDA.w $0C54,X
|08AADD| CMP.b #$02
|08AADF| BNE .check_ball_timer

|08AAE1| DEC.w $03B1,X
|08AAE4| BPL .delay

|08AAE6| LDA.b #$02
|08AAE8| STA.w $03B1,X

|08AAEB| LDA.w $0C5E,X
|08AAEE| INC A
|08AAEF| STA.w $0C5E,X

|08AAF2| CMP.b #$02
|08AAF4| BNE .delay

|08AAF6| DEC.w $0C5E,X

|08AAF9| LDA.b #$10
|08AAFB| STA.w $0C2C,X

|08AAFE| LDA.b #$03
|08AB00| STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.delay
|08AB03| LDA.w $0C2C,X
|08AB06| CLC
|08AB07| ADC.b #$01
|08AB09| STA.w $0C2C,X

|08AB0C| BRL EtherSpell_HandleRadialSpin

;---------------------------------------------------------------------------------------------------

.check_ball_timer
|08AB0F| DEC.w $03B1,X
|08AB12| BPL .dont_swap_char

|08AB14| LDA.b #$02
|08AB16| STA.w $03B1,X

|08AB19| LDA.w $0C5E,X
|08AB1C| EOR.b #$01
|08AB1E| STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.dont_swap_char
|08AB21| LDA.w $0C54,X
|08AB24| BEQ .lightning

|08AB26| CMP.b #$01
|08AB28| BEQ .pulsing_orb

|08AB2A| CMP.b #$03
|08AB2C| BEQ .do_spin

|08AB2E| CMP.b #$04
|08AB30| BEQ .dissipate

;---------------------------------------------------------------------------------------------------

|08AB32| LDA.w $0C2C,X
|08AB35| CLC
|08AB36| ADC.b #$10
|08AB38| BPL .radial_speed_not_maxed

|08AB3A| LDA.b #$7F

.radial_speed_not_maxed
|08AB3C| STA.w $0C2C,X
|08AB3F| BRL .do_spin

;---------------------------------------------------------------------------------------------------

.lightning
|08AB42| BRA EtherSpell_HandleLightningStroke

;---------------------------------------------------------------------------------------------------

.pulsing_orb
|08AB44| BRL EtherSpell_HandleOrbPulse

;---------------------------------------------------------------------------------------------------

.dissipate
|08AB47| LDA.l $7F5812
|08AB4B| DEC A
|08AB4C| STA.l $7F5812

|08AB50| BNE .do_spin

|08AB52| LDA.b #$05
|08AB54| STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.do_spin
|08AB57| BRL EtherSpell_HandleRadialSpin

.exit
|08AB5A| RTS

;===================================================================================================

UNREACHABLE_08AB5B:
|08AB5B| db $E0, $00, $E8, $E8
|08AB5F| db $00, $20, $18, $18

;===================================================================================================

EtherSpell_HandleLightningStroke:
|08AB63| JSR AncillaMoveY

|08AB66| LDA.w $0C0E,X
|08AB69| STA.b $01

|08AB6B| LDA.w $0BFA,X
|08AB6E| STA.b $00

|08AB70| AND.b #$F0
|08AB72| CMP.l $7F580C
|08AB76| BEQ .dont_lengthen

|08AB78| STA.l $7F580C

|08AB7C| INC.w $03C2,X

.dont_lengthen
|08AB7F| REP #$20

|08AB81| LDA.b $00
|08AB83| CMP.w #$E000
|08AB86| BCS .delay

|08AB88| LDA.l $7F580A
|08AB8C| CMP.w #$E000
|08AB8F| BCS .at_target

|08AB91| LDA.l $7F580A
|08AB95| CMP.b $00
|08AB97| BEQ .at_target
|08AB99| BCS .delay

.at_target
|08AB9B| SEP #$20

|08AB9D| LDA.b #$01
|08AB9F| STA.w $0C54,X

.delay
|08ABA2| SEP #$20

|08ABA4| BRL AncillaDraw_EtherBlitz

;===================================================================================================

EtherSpell_HandleOrbPulse:
|08ABA7| LDA.w $03C2,X
|08ABAA| BMI .continue

|08ABAC| DEC.w $039F,X
|08ABAF| BPL .proceed_to_draw

|08ABB1| LDA.b #$03
|08ABB3| STA.w $039F,X

|08ABB6| DEC.w $03C2,X
|08ABB9| BPL .proceed_to_draw

|08ABBB| LDA.b #$09
|08ABBD| STA.w $039F,X

|08ABC0| BRA .continue

.proceed_to_draw
|08ABC2| BRL AncillaDraw_EtherBlitz

;---------------------------------------------------------------------------------------------------

.continue
|08ABC5| DEC.w $039F,X
|08ABC8| BPL .dont_damage

|08ABCA| LDA.b #$02
|08ABCC| STA.w $0C54,X

|08ABCF| STZ.w $0C22,X

|08ABD2| LDA.b #$10
|08ABD4| STA.w $0C2C,X

|08ABD7| STZ.w $0C5E,X

|08ABDA| LDA.b #$02
|08ABDC| STA.w $03B1,X

|08ABDF| LDA.w $031D
|08ABE2| BEQ .dont_damage

|08ABE4| PHX
|08ABE5| JSL CheckMedallionDamageToSprite
|08ABE9| PLX

.dont_damage
|08ABEA| LDY.b #$00
|08ABEC| BRL AncillaDraw_EtherOrb

;===================================================================================================

EtherSpell_HandleRadialSpin:
|08ABEF| LDA.w $0C54,X
|08ABF2| CMP.b #$04
|08ABF4| BNE .skip_sfx

|08ABF6| LDY.b #$2A ; SFX3.2A

|08ABF8| LDA.b $1A
|08ABFA| AND.b #$07
|08ABFC| BEQ .set_sfx


|08ABFE| LDY.b #$AA ; SFX3.2A with [HARDCODED] pan value of $80

|08AC00| CMP.b #$04
|08AC02| BEQ .set_sfx

|08AC04| CMP.b #$07
|08AC06| BNE .skip_sfx

|08AC08| LDY.b #$6A ; SFX3.2A with [HARDCODED] pan value of $40

.set_sfx
|08AC0A| STY.w $012F

;---------------------------------------------------------------------------------------------------

.skip_sfx
|08AC0D| LDA.w $0C54,X
|08AC10| CMP.b #$04
|08AC12| BEQ .dont_expand

|08AC14| LDA.l $7F5808
|08AC18| STA.w $0C04,X

|08AC1B| STZ.w $0C18,X

|08AC1E| JSR AncillaMoveX

|08AC21| LDA.w $0C04,X
|08AC24| STA.l $7F5808

|08AC28| CMP.b #$40
|08AC2A| BNE .dont_expand

|08AC2C| LDA.b #$04
|08AC2E| STA.w $0C54,X

.dont_expand
|08AC31| PHX

|08AC32| LDA.w $0C54,X
|08AC35| STA.b $72

|08AC37| LDA.w $0C5E,X
|08AC3A| STA.b $73

;---------------------------------------------------------------------------------------------------

|08AC3C| LDY.b #$00
|08AC3E| LDX.b #$07

.next_orb
|08AC40| LDA.b $72
|08AC42| CMP.b #$02
|08AC44| BEQ .dont_rotate

|08AC46| CMP.b #$05
|08AC48| BEQ .dont_rotate

|08AC4A| LDA.l $7F5800,X
|08AC4E| INC A
|08AC4F| AND.b #$3F
|08AC51| STA.l $7F5800,X

.dont_rotate
|08AC55| LDA.l $7F5808
|08AC59| STA.b $08

|08AC5B| LDA.l $7F5800,X

|08AC5F| JSR Ancilla_GetRadialProjection

|08AC62| PHX

|08AC63| LDA.b $72
|08AC65| CMP.b #$02
|08AC67| BEQ .draw_as_segment

|08AC69| JSR AncillaDraw_EtherBlitzBall

|08AC6C| BRA .to_next

.draw_as_segment
|08AC6E| JSR AncillaDraw_EtherBlitzSegment

.to_next
|08AC71| PLX
|08AC72| DEX
|08AC73| BPL .next_orb

;---------------------------------------------------------------------------------------------------

|08AC75| PLX

|08AC76| LDA.l $7F5808
|08AC7A| CMP.b #$F0
|08AC7C| BCS .terminate

|08AC7E| LDY.b #$01

.next_check
|08AC80| LDA.b ($90),Y
|08AC82| CMP.b #$F0
|08AC84| BNE .exit

|08AC86| INY
|08AC87| INY
|08AC88| INY
|08AC89| INY

|08AC8A| CPY.b #$21
|08AC8C| BNE .next_check

;---------------------------------------------------------------------------------------------------

.terminate
|08AC8E| STZ.w $0C4A,X

|08AC91| LDA.b #$01
|08AC93| STA.w $0AAA

|08AC96| STZ.w $0324
|08AC99| STZ.w $031C
|08AC9C| STZ.w $031D

|08AC9F| STZ.b $50

|08ACA1| STZ.w $0FC1

|08ACA4| LDA.b $8A
|08ACA6| CMP.b #$70 ; OW 70
|08ACA8| BNE .dont_open_mire

|08ACAA| LDA.l $7EF2F0
|08ACAE| AND.b #$20
|08ACB0| BNE .dont_open_mire

|08ACB2| LDY.b #$02
|08ACB4| JSR Ancilla_CheckForEntranceTrigger
|08ACB7| BCC .dont_open_mire

|08ACB9| LDA.b #$03
|08ACBB| STA.w $04C6

|08ACBE| STZ.b $B0
|08ACC0| STZ.b $C8

;---------------------------------------------------------------------------------------------------

.dont_open_mire
|08ACC2| LDA.b $5D
|08ACC4| CMP.b #$19 ; LINKSTATE 19
|08ACC6| BEQ .spin_attack

|08ACC8| LDA.b #$00 ; LINKSTATE 00
|08ACCA| STA.b $5D

|08ACCC| STZ.b $3D

|08ACCE| LDY.b #$00

|08ACD0| LDA.b $3C
|08ACD2| BEQ .dont_flag_b

|08ACD4| LDA.b $F0
|08ACD6| AND.b #$80
|08ACD8| TAY

.dont_flag_b
|08ACD9| STY.b $3A

;---------------------------------------------------------------------------------------------------

.spin_attack
|08ACDB| STZ.b $5E
|08ACDD| STZ.w $0325

|08ACE0| PHX

|08ACE1| JSL RefreshEquipmentPalettes_sword_and_mail
|08ACE5| JSL RestoreBackgroundPalettes

|08ACE9| PLX

.exit
|08ACEA| RTS

;===================================================================================================

pool AncillaDraw_EtherBlitzBall

.char
|08ACEB| db $68, $6A

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitzBall:
|08ACED| REP #$20

|08ACEF| PHY

|08ACF0| LDA.b $00

|08ACF2| LDY.b $02
|08ACF4| BEQ .positive_y

|08ACF6| EOR.w #$FFFF
|08ACF9| INC A

.positive_y
|08ACFA| STA.b $08

|08ACFC| CLC
|08ACFD| ADC.l $7F5810

|08AD01| CLC
|08AD02| ADC.w #$FFF8

|08AD05| SEC
|08AD06| SBC.b $E8
|08AD08| STA.b $00

;---------------------------------------------------------------------------------------------------

|08AD0A| LDA.b $04

|08AD0C| LDY.b $06
|08AD0E| BEQ .positive_x

|08AD10| EOR.w #$FFFF
|08AD13| INC A

.positive_x
|08AD14| STA.b $0A

|08AD16| CLC
|08AD17| ADC.l $7F580E

|08AD1B| CLC
|08AD1C| ADC.w #$FFF8

|08AD1F| SEC
|08AD20| SBC.b $E2
|08AD22| STA.b $02

;---------------------------------------------------------------------------------------------------

|08AD24| PLY

|08AD25| SEP #$20

|08AD27| JSR Ancilla_SetOAM_XY

|08AD2A| LDA.b $73
|08AD2C| TAX

|08AD2D| LDA.w .char,X
|08AD30| STA.b ($90),Y

|08AD32| INY

|08AD33| LDA.b #$3C
|08AD35| STA.b ($90),Y

|08AD37| INY
|08AD38| PHY
|08AD39| TYA

|08AD3A| SEC
|08AD3B| SBC.b #$04
|08AD3D| LSR A
|08AD3E| LSR A
|08AD3F| TAY

|08AD40| LDA.b #$02
|08AD42| STA.b ($92),Y

|08AD44| JSR AllocateOAMInCustomRegion

|08AD47| PLY

|08AD48| RTS

;===================================================================================================

pool AncillaDraw_EtherBlitzSegment

.char
|08AD49| db $40, $42
|08AD4B| db $66, $64
|08AD4D| db $62, $60
|08AD4F| db $64, $66
|08AD51| db $42, $40
|08AD53| db $66, $64
|08AD55| db $60, $62
|08AD57| db $64, $66
|08AD59| db $68, $42
|08AD5B| db $68, $64
|08AD5D| db $68, $60
|08AD5F| db $68, $64
|08AD61| db $68, $40
|08AD63| db $68, $66
|08AD65| db $68, $62
|08AD67| db $68, $64

;---------------------------------------------------------------------------------------------------

.prop
|08AD69| db $3C, $3C
|08AD6B| db $FC, $FC
|08AD6D| db $3C, $3C
|08AD6F| db $BC, $BC
|08AD71| db $3C, $3C
|08AD73| db $3C, $3C
|08AD75| db $3C, $3C
|08AD77| db $7C, $7C
|08AD79| db $3C, $7C
|08AD7B| db $3C, $3C
|08AD7D| db $3C, $BC
|08AD7F| db $3C, $7C
|08AD81| db $3C, $7C
|08AD83| db $3C, $FC
|08AD85| db $3C, $BC
|08AD87| db $3C, $BC

;---------------------------------------------------------------------------------------------------

.offset_y
|08AD89| dw   8
|08AD8B| dw   0
|08AD8D| dw  -8
|08AD8F| dw -16
|08AD91| dw -24
|08AD93| dw -16
|08AD95| dw  -8
|08AD97| dw -16
|08AD99| dw   8
|08AD9B| dw   0
|08AD9D| dw  -8
|08AD9F| dw -16
|08ADA1| dw -24
|08ADA3| dw -16
|08ADA5| dw  -8
|08ADA7| dw   0

;---------------------------------------------------------------------------------------------------

.offset_x
|08ADA9| dw  -8
|08ADAB| dw -16
|08ADAD| dw -24
|08ADAF| dw -16
|08ADB1| dw  -8
|08ADB3| dw   0
|08ADB5| dw   8
|08ADB7| dw -16
|08ADB9| dw  -8
|08ADBB| dw -16
|08ADBD| dw -24
|08ADBF| dw -16
|08ADC1| dw  -8
|08ADC3| dw   0
|08ADC5| dw   8
|08ADC7| dw   0

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitzSegment:
|08ADC9| REP #$20

|08ADCB| PHY

|08ADCC| LDA.b $00

|08ADCE| LDY.b $02
|08ADD0| BEQ .positive_y

|08ADD2| EOR.w #$FFFF
|08ADD5| INC A

.positive_y
|08ADD6| STA.b $08

|08ADD8| CLC
|08ADD9| ADC.l $7F5810

|08ADDD| CLC
|08ADDE| ADC.w #$FFF8

|08ADE1| SEC
|08ADE2| SBC.b $E8
|08ADE4| STA.b $00

;---------------------------------------------------------------------------------------------------

|08ADE6| LDA.b $04

|08ADE8| LDY.b $06
|08ADEA| BEQ .positive_x

|08ADEC| EOR.w #$FFFF
|08ADEF| INC A

.positive_x
|08ADF0| STA.b $0A

|08ADF2| CLC
|08ADF3| ADC.l $7F580E

|08ADF7| CLC
|08ADF8| ADC.w #$FFF8

|08ADFB| SEC
|08ADFC| SBC.b $E2
|08ADFE| STA.b $02

;---------------------------------------------------------------------------------------------------

|08AE00| PLY

|08AE01| SEP #$20

|08AE03| JSR Ancilla_SetOAM_XY

|08AE06| LDA.b $73
|08AE08| ASL A
|08AE09| ASL A
|08AE0A| ASL A
|08AE0B| ASL A
|08AE0C| STA.b $0E

|08AE0E| TXA
|08AE0F| ASL A
|08AE10| CLC
|08AE11| ADC.b $0E
|08AE13| TAX

|08AE14| LDA.w .char+0,X
|08AE17| STA.b ($90),Y

|08AE19| INY

|08AE1A| LDA.w .prop+0,X
|08AE1D| STA.b ($90),Y

|08AE1F| INY
|08AE20| PHY

|08AE21| TYA
|08AE22| SEC
|08AE23| SBC.b #$04
|08AE25| LSR A
|08AE26| LSR A
|08AE27| TAY

|08AE28| LDA.b #$02
|08AE2A| STA.b ($92),Y

|08AE2C| PLY

;---------------------------------------------------------------------------------------------------

|08AE2D| REP #$20

|08AE2F| LDA.b $08
|08AE31| CLC
|08AE32| ADC.l $7F5810

|08AE36| CLC
|08AE37| ADC.w .offset_y,X

|08AE3A| SEC
|08AE3B| SBC.b $E8
|08AE3D| STA.b $00

;---------------------------------------------------------------------------------------------------

|08AE3F| LDA.b $0A
|08AE41| CLC
|08AE42| ADC.l $7F580E

|08AE46| CLC
|08AE47| ADC.w .offset_x,X

|08AE4A| SEC
|08AE4B| SBC.b $E2
|08AE4D| STA.b $02

;---------------------------------------------------------------------------------------------------

|08AE4F| SEP #$20

|08AE51| PHX
|08AE52| JSR Ancilla_SetOAM_XY
|08AE55| PLX

|08AE56| LDA.w .char+1,X
|08AE59| STA.b ($90),Y

|08AE5B| INY

|08AE5C| LDA.w .prop+1,X
|08AE5F| STA.b ($90),Y

|08AE61| INY
|08AE62| PHY

|08AE63| TYA
|08AE64| SEC
|08AE65| SBC.b #$04
|08AE67| LSR A
|08AE68| LSR A
|08AE69| TAY

|08AE6A| LDA.b #$02
|08AE6C| STA.b ($92),Y

|08AE6E| PLY

|08AE6F| JSR AllocateOAMInCustomRegion

|08AE72| RTS

;===================================================================================================

EtherBlitzDraw:
.char
|08AE73| db $40, $42, $44, $46

.orb_char
|08AE77| db $48, $48, $4A, $4A
|08AE7B| db $4C, $4C, $4E, $4E

.prop
|08AE7F| db $3C, $7C, $3C, $7C
|08AE83| db $3C, $7C, $3C, $7C

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitz:
|08AE87| JSR Ancilla_PrepOAMCoord

|08AE8A| LDA.w $0C5E,X
|08AE8D| STA.b $06

|08AE8F| STZ.b $08

|08AE91| PHX

|08AE92| LDA.w $03C2,X
|08AE95| TAX

|08AE96| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
|08AE98| JSR Ancilla_SetOAM_XY

|08AE9B| PHX

|08AE9C| LDA.b $06
|08AE9E| ASL A
|08AE9F| CLC
|08AEA0| ADC.b $08
|08AEA2| TAX

|08AEA3| LDA.w EtherBlitzDraw.char,X
|08AEA6| STA.b ($90),Y

|08AEA8| PLX

|08AEA9| INY

|08AEAA| LDA.w EtherBlitzDraw.prop
|08AEAD| ORA.b $65
|08AEAF| STA.b ($90),Y

|08AEB1| INY
|08AEB2| PHY

|08AEB3| TYA
|08AEB4| SEC
|08AEB5| SBC.b #$04
|08AEB7| LSR A
|08AEB8| LSR A
|08AEB9| TAY

|08AEBA| LDA.b #$02
|08AEBC| STA.b ($92),Y

|08AEBE| PLY

|08AEBF| REP #$20

|08AEC1| LDA.b $00
|08AEC3| SEC
|08AEC4| SBC.w #$0010
|08AEC7| STA.b $00

|08AEC9| SEP #$20

|08AECB| LDA.b $08
|08AECD| EOR.b #$01
|08AECF| STA.b $08

|08AED1| DEX
|08AED2| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08AED4| PLX

|08AED5| LDA.w $0C54,X
|08AED8| CMP.b #$01
|08AEDA| BEQ AncillaDraw_EtherOrb

|08AEDC| RTS

;===================================================================================================

AncillaDraw_EtherOrb:
|08AEDD| REP #$20

|08AEDF| LDA.l $7F5813
|08AEE3| CLC
|08AEE4| ADC.w #$FFFF
|08AEE7| SEC
|08AEE8| SBC.b $E8
|08AEEA| STA.b $00

|08AEEC| LDA.l $7F5815
|08AEF0| CLC
|08AEF1| ADC.w #$FFF8
|08AEF4| SEC
|08AEF5| SBC.b $E2
|08AEF7| STA.b $02
|08AEF9| STA.b $04

|08AEFB| STZ.b $08

|08AEFD| SEP #$20

|08AEFF| PHX

|08AF00| LDA.w $0C5E,X
|08AF03| ASL A
|08AF04| ASL A
|08AF05| STA.b $06

.next_object
|08AF07| JSR Ancilla_SetOAM_XY

|08AF0A| LDX.b $06

|08AF0C| LDA.w EtherBlitzDraw.orb_char,X
|08AF0F| STA.b ($90),Y

|08AF11| INY

|08AF12| LDA.w EtherBlitzDraw.prop,X
|08AF15| STA.b ($90),Y

|08AF17| INY
|08AF18| PHY

|08AF19| TYA
|08AF1A| SEC
|08AF1B| SBC.b #$04
|08AF1D| LSR A
|08AF1E| LSR A
|08AF1F| TAY

|08AF20| LDA.b #$02
|08AF22| STA.b ($92),Y

|08AF24| PLY

|08AF25| JSR AllocateOAMInCustomRegion

|08AF28| REP #$20

|08AF2A| LDA.b $02
|08AF2C| CLC
|08AF2D| ADC.w #$0010
|08AF30| STA.b $02

|08AF32| INC.b $06

|08AF34| INC.b $08

|08AF36| LDA.b $08
|08AF38| CMP.w #$0004
|08AF3B| BEQ .exit

|08AF3D| CMP.w #$0002
|08AF40| BNE .continue

|08AF42| LDA.b $00
|08AF44| CLC
|08AF45| ADC.w #$0010
|08AF48| STA.b $00

|08AF4A| LDA.b $04
|08AF4C| STA.b $02

.continue
|08AF4E| SEP #$20

|08AF50| BRA .next_object

;---------------------------------------------------------------------------------------------------

.exit
|08AF52| SEP #$20

|08AF54| PLX

|08AF55| RTS

;===================================================================================================

pool AncillaAdd_BombosSpell

.offset_y
|08AF56| dw  16,  24, -128, -16

.offset_x
|08AF5E| dw -16, -128,   0, 128

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_BombosSpell:
|08AF66| PHB
|08AF67| PHK
|08AF68| PLB

|08AF69| JSR AddAncilla_bank08
|08AF6C| BCC .found_slot

|08AF6E| BRL .exit

;---------------------------------------------------------------------------------------------------

.found_slot
|08AF71| LDA.b #$03
|08AF73| STA.l $7F5800
|08AF77| STA.l $7F5801
|08AF7B| STA.l $7F5802
|08AF7F| STA.l $7F5803
|08AF83| STA.l $7F5804

|08AF87| STA.l $7F5805
|08AF8B| STA.l $7F5806
|08AF8F| STA.l $7F5807
|08AF93| STA.l $7F5808
|08AF97| STA.l $7F5809

|08AF9B| STA.l $7F5945
|08AF9F| STA.l $7F5946
|08AFA3| STA.l $7F5947
|08AFA7| STA.l $7F5948

|08AFAB| STA.l $7F5949
|08AFAF| STA.l $7F594A
|08AFB3| STA.l $7F594B
|08AFB7| STA.l $7F594C

|08AFBB| LDA.b #$00
|08AFBD| STA.l $7F5810
|08AFC1| STA.l $7F5811
|08AFC5| STA.l $7F5812
|08AFC9| STA.l $7F5813
|08AFCD| STA.l $7F5814

|08AFD1| STA.l $7F5815
|08AFD5| STA.l $7F5816
|08AFD9| STA.l $7F5817
|08AFDD| STA.l $7F5818
|08AFE1| STA.l $7F5819

|08AFE5| STA.l $7F5935
|08AFE9| STA.l $7F5936
|08AFED| STA.l $7F5937
|08AFF1| STA.l $7F5938

|08AFF5| STA.l $7F5939
|08AFF9| STA.l $7F593A
|08AFFD| STA.l $7F593B
|08B001| STA.l $7F593C

|08B005| STA.l $7F5934
|08B009| STA.l $7F5A56

;---------------------------------------------------------------------------------------------------

|08B00D| LDA.b #$80
|08B00F| STA.l $7F5A55

|08B013| LDA.b #$10
|08B015| STA.l $7F5820

|08B019| LDA.b #$0B
|08B01B| STA.w $0AAA

|08B01E| LDA.b #$01
|08B020| STA.w $0112

|08B023| STZ.w $0C54,X
|08B026| STZ.w $0C5E,X

;---------------------------------------------------------------------------------------------------

|08B029| LDA.b #$2A ; SFX2.2A
|08B02B| JSR Ancilla_SFX2_Near

|08B02E| PHX

|08B02F| LDY.b $1A

|08B031| LDA.b $21
|08B033| STA.l $7F5956

|08B037| LDA.b $23
|08B039| STA.l $7F59D6

|08B03D| LDA.w Ancilla05_Boomerang,Y
|08B040| CMP.b #$E0
|08B042| BCC .excuse_me

|08B044| AND.b #$7F

.excuse_me
|08B046| STA.l $7F5955
|08B04A| STA.l $7F59D5

;---------------------------------------------------------------------------------------------------

|08B04E| LDX.b #$00
|08B050| STX.b $72

.next
|08B052| REP #$20

|08B054| LDA.b $20
|08B056| CLC
|08B057| ADC.w .offset_y,X
|08B05A| STA.l $7F5924,X

|08B05E| LDA.b $22
|08B060| CLC
|08B061| ADC.w .offset_x,X
|08B064| STA.l $7F592C,X

|08B068| SEP #$20

|08B06A| PHX

|08B06B| TXA
|08B06C| LSR A
|08B06D| TAX

|08B06E| LDA.b #$10
|08B070| STA.b $08
|08B072| STA.l $7F5A57

|08B076| LDA.l $7F5820,X

|08B07A| PLX

|08B07B| JSR Ancilla_GetRadialProjection

;---------------------------------------------------------------------------------------------------

|08B07E| REP #$20

|08B080| LDA.b $00
|08B082| LDY.b $02
|08B084| BEQ .positive_x

|08B086| EOR.w #$FFFF
|08B089| INC A

.positive_x
|08B08A| CLC
|08B08B| ADC.l $7F5924,X
|08B08F| STA.b $00

;---------------------------------------------------------------------------------------------------

|08B091| LDA.b $04

|08B093| LDY.b $06
|08B095| BEQ .positive_y

|08B097| EOR.w #$FFFF
|08B09A| INC A

.positive_y
|08B09B| CLC
|08B09C| ADC.l $7F592C,X
|08B0A0| STA.b $04

;---------------------------------------------------------------------------------------------------

|08B0A2| SEP #$20

|08B0A4| PHX

|08B0A5| LDX.b $72

|08B0A7| LDA.b $00
|08B0A9| STA.l $7F5824,X

|08B0AD| LDA.b $01
|08B0AF| STA.l $7F5864,X

|08B0B3| LDA.b $04
|08B0B5| STA.l $7F58A4,X

|08B0B9| LDA.b $05
|08B0BB| STA.l $7F58E4,X

|08B0BF| PLX

|08B0C0| LDA.b $72
|08B0C2| SEC
|08B0C3| SBC.b #$10
|08B0C5| STA.b $72

|08B0C7| DEX
|08B0C8| DEX
|08B0C9| BPL .next

;---------------------------------------------------------------------------------------------------

|08B0CB| PLX

.exit
|08B0CC| PLB

|08B0CD| RTL

;===================================================================================================

Ancilla19_BombosSpell:
|08B0CE| LDA.l $7F5934
|08B0D2| BNE .no_new_columns

|08B0D4| LDA.b $11
|08B0D6| BNE .draw_columns

|08B0D8| JMP.w BombosSpell_ControlFireColumns

;---------------------------------------------------------------------------------------------------

.draw_columns
|08B0DB| LDY.b #$00
|08B0DD| LDX.b #$09

.next_column_draw
|08B0DF| JSR AncillaDraw_BombosFireColumn

|08B0E2| DEX
|08B0E3| BPL .next_column_draw

|08B0E5| RTS

;---------------------------------------------------------------------------------------------------

.no_new_columns
|08B0E6| LDA.l $7F5934
|08B0EA| CMP.b #$02
|08B0EC| BEQ .blasting

|08B0EE| LDA.b $11
|08B0F0| BNE .draw_columns

|08B0F2| JSR BombosSpell_FinishFireColumns

|08B0F5| RTS

;---------------------------------------------------------------------------------------------------

.blasting
|08B0F6| LDA.b $11
|08B0F8| BEQ .dont_draw_blast

|08B0FA| PHX

|08B0FB| LDA.w $0C54,X
|08B0FE| TAX

.next_blast_draw
|08B0FF| JSR AncillaDraw_BombosBlast

|08B102| DEX
|08B103| BPL .next_blast_draw

|08B105| PLX

|08B106| RTS

;---------------------------------------------------------------------------------------------------

.dont_draw_blast
|08B107| JMP.w BombosSpell_ControlBlasting

;===================================================================================================

BombosSpell_ControlFireColumns:
|08B10A| PHX

|08B10B| LDA.w $0C5E,X
|08B10E| STA.b $73

|08B110| LDA.w $0C54,X
|08B113| STA.b $72

|08B115| TAX
|08B116| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_column
|08B118| LDA.l $7F5810,X
|08B11C| CMP.b #$0D
|08B11E| BNE .continue

.skip_me
|08B120| BRL .skip_this_column

.continue
|08B123| LDA.l $7F5800,X
|08B127| DEC A
|08B128| STA.l $7F5800,X
|08B12C| BMI .time_up

.dont_spawn_new_column
|08B12E| BRL .just_draw

;---------------------------------------------------------------------------------------------------

.time_up
|08B131| LDA.b #$03
|08B133| STA.l $7F5800,X

|08B137| LDA.l $7F5810,X
|08B13B| INC A
|08B13C| STA.l $7F5810,X

|08B140| CMP.b #$0D
|08B142| BEQ .skip_me

;---------------------------------------------------------------------------------------------------

|08B144| CMP.b #$02
|08B146| BNE .dont_spawn_new_column

|08B148| LDA.b $73
|08B14A| BNE .skip_me

|08B14C| PHX

|08B14D| LDA.b $72
|08B14F| CMP.b #$09
|08B151| BNE .to_next_find

;---------------------------------------------------------------------------------------------------

|08B153| LDX.b #$09

.next_check
|08B155| LDA.l $7F5810,X
|08B159| CMP.b #$0D
|08B15B| BNE .dont_reset

|08B15D| LDA.b #$00
|08B15F| STA.l $7F5810,X
|08B163| BRA .set_radial

.dont_reset
|08B165| DEX
|08B166| BPL .next_check

.to_next_find
|08B168| LDX.b $72
|08B16A| INX
|08B16B| CPX.b #$0A
|08B16D| BNE .not_maxed

|08B16F| LDX.b #$09

.not_maxed
|08B171| STX.b $72

.set_radial
|08B173| TXA
|08B174| CLC
|08B175| ADC.b #$00
|08B177| STA.b $74

;---------------------------------------------------------------------------------------------------

.never
|08B179| LDA.b $74
|08B17B| LSR A
|08B17C| LSR A
|08B17D| LSR A
|08B17E| LSR A
|08B17F| TAX

|08B180| LDA.l $7F5A57
|08B184| CLC
|08B185| ADC.b #$03
|08B187| CMP.b #$D0
|08B189| BCC .not_maxed_distance

|08B18B| LDA.b #$CF

;---------------------------------------------------------------------------------------------------

.not_maxed_distance
|08B18D| STA.l $7F5A57
|08B191| STA.b $08

|08B193| LDA.l $7F5820,X
|08B197| CLC
|08B198| ADC.b #$06
|08B19A| STA.l $7F5820,X

|08B19E| AND.b #$3F
|08B1A0| JSR Ancilla_GetRadialProjection

|08B1A3| TXA
|08B1A4| ASL A
|08B1A5| TAX

|08B1A6| REP #$20

|08B1A8| PHY

;---------------------------------------------------------------------------------------------------

|08B1A9| LDA.b $00

|08B1AB| LDY.b $02
|08B1AD| BEQ .positive_y

|08B1AF| EOR.w #$FFFF
|08B1B2| INC A

.positive_y
|08B1B3| CLC
|08B1B4| ADC.l $7F5924,X
|08B1B8| STA.b $00

;---------------------------------------------------------------------------------------------------

|08B1BA| LDA.b $04

|08B1BC| LDY.b $06
|08B1BE| BEQ .positive_x

|08B1C0| EOR.w #$FFFF
|08B1C3| INC A

.positive_x
|08B1C4| CLC
|08B1C5| ADC.l $7F592C,X
|08B1C9| STA.b $04

;---------------------------------------------------------------------------------------------------

|08B1CB| PLY

|08B1CC| SEP #$20

|08B1CE| LDX.b $74

|08B1D0| LDA.b $00
|08B1D2| STA.l $7F5824,X

|08B1D6| LDA.b $01
|08B1D8| STA.l $7F5864,X

|08B1DC| LDA.b $04
|08B1DE| STA.l $7F58A4,X

|08B1E2| LDA.b $05
|08B1E4| STA.l $7F58E4,X

;---------------------------------------------------------------------------------------------------

|08B1E8| LDA.b $74
|08B1EA| SEC
|08B1EB| SBC.b #$10
|08B1ED| STA.b $74
|08B1EF| BPL .never

|08B1F1| REP #$20

|08B1F3| LDA.b $04
|08B1F5| SEC
|08B1F6| SBC.b $E2

|08B1F8| CLC
|08B1F9| ADC.w #$0008
|08B1FC| STA.b $04

;---------------------------------------------------------------------------------------------------

|08B1FE| SEP #$20

|08B200| LDA.b $05
|08B202| BNE .no_sfx

|08B204| LDA.b $04
|08B206| LSR A
|08B207| LSR A
|08B208| LSR A
|08B209| LSR A
|08B20A| LSR A
|08B20B| TAX

|08B20C| LDA.l AncillaPanValues,X
|08B210| ORA.b #$2A ; SFX2.2A
|08B212| STA.w $012E

;---------------------------------------------------------------------------------------------------

.no_sfx
|08B215| PLX

.just_draw
|08B216| JSR AncillaDraw_BombosFireColumn

.skip_this_column
|08B219| DEX
|08B21A| BMI .done_columns

|08B21C| BRL .next_column

;---------------------------------------------------------------------------------------------------

.done_columns
|08B21F| PLX

|08B220| LDA.l $7F5820
|08B224| CMP.b #$80
|08B226| BCS .trigger_wrap_up

|08B228| BRA .finish_up

.trigger_wrap_up
|08B22A| LDA.b #$01
|08B22C| STA.l $7F5934

.finish_up
|08B230| LDA.b $72
|08B232| STA.w $0C54,X

|08B235| RTS

;---------------------------------------------------------------------------------------------------

BombosSpell_FinishFireColumns:
|08B236| PHX

|08B237| LDA.w $0C54,X
|08B23A| TAX
|08B23B| LDY.b #$00

.next_column
|08B23D| LDA.l $7F5800,X
|08B241| DEC A
|08B242| STA.l $7F5800,X
|08B246| BPL .delay

|08B248| LDA.b #$03
|08B24A| STA.l $7F5800,X

|08B24E| LDA.l $7F5810,X
|08B252| INC A
|08B253| STA.l $7F5810,X

|08B257| CMP.b #$0D
|08B259| BCC .delay

|08B25B| LDA.b #$0D
|08B25D| STA.l $7F5810,X

.delay
|08B261| JSR AncillaDraw_BombosFireColumn

|08B264| DEX
|08B265| BPL .next_column

;---------------------------------------------------------------------------------------------------

|08B267| LDX.b #$09

.next_check
|08B269| LDA.l $7F5810,X
|08B26D| CMP.b #$0D
|08B26F| BNE .found_active_column

|08B271| DEX
|08B272| BPL .next_check

;---------------------------------------------------------------------------------------------------

|08B274| STZ.b $72

|08B276| LDA.b #$02
|08B278| STA.l $7F5934

|08B27C| PLX

|08B27D| PHX
|08B27E| JSL CheckMedallionDamageToSprite
|08B282| PLX

|08B283| STZ.w $0C54,X

|08B286| RTS

;---------------------------------------------------------------------------------------------------

.found_active_column
|08B287| PLX

|08B288| RTS

;===================================================================================================

pool AncillaDraw_BombosFireColumn

.char
|08B289| db $40, $FF, $FF
|08B28C| db $42, $44, $FF
|08B28F| db $42, $44, $FF
|08B292| db $42, $44, $FF
|08B295| db $42, $44, $FF
|08B298| db $40, $46, $44
|08B29B| db $4A, $4A, $48
|08B29E| db $4C, $4C, $4A
|08B2A1| db $4E, $4C, $4A
|08B2A4| db $4E, $6A, $4C
|08B2A7| db $4E, $68, $FF
|08B2AA| db $6A, $FF, $FF
|08B2AD| db $4E, $FF, $FF

;---------------------------------------------------------------------------------------------------

.prop
|08B2B0| db $3C, $FF, $FF
|08B2B3| db $3C, $3C, $FF
|08B2B6| db $3C, $3C, $FF
|08B2B9| db $7C, $7C, $FF
|08B2BC| db $3C, $7C, $FF
|08B2BF| db $3C, $3C, $3C
|08B2C2| db $BC, $3C, $3C
|08B2C5| db $7C, $3C, $3C
|08B2C8| db $3C, $3C, $7C
|08B2CB| db $3C, $3C, $3C
|08B2CE| db $3C, $3C, $FF
|08B2D1| db $3C, $FF, $FF
|08B2D4| db $3C, $FF, $FF

;---------------------------------------------------------------------------------------------------

.offset_y
|08B2D7| dw   0,  -1,  -1
|08B2DD| dw   0,  -4,  -1
|08B2E3| dw   0,  -8,  -1
|08B2E9| dw   0, -12,  -1
|08B2EF| dw   0, -16,  -1
|08B2F5| dw   0,  -4, -20
|08B2FB| dw   0,  -8, -24
|08B301| dw   0, -12, -28
|08B307| dw   0, -16, -32
|08B30D| dw   0, -16, -32
|08B313| dw -18, -34,  -1
|08B319| dw -35,  -1,  -1
|08B31F| dw -36,  -1,  -1

;---------------------------------------------------------------------------------------------------

.offset_x
|08B325| dw   0,  -1,  -1
|08B32B| dw   0,   0,  -1
|08B331| dw   0,   0,  -1
|08B337| dw   0,   0,  -1
|08B33D| dw   0,   0,  -1
|08B343| dw   0,   0,   0
|08B349| dw   0,   0,   0
|08B34F| dw   0,   0,   0
|08B355| dw   0,   0,   0
|08B35B| dw   0,   0,   0
|08B361| dw   0,   0,  -1
|08B367| dw   1,  -1,  -1
|08B36D| dw   2,  -1,  -1

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_BombosFireColumn:
|08B373| TXA
|08B374| CLC
|08B375| ADC.b #$00
|08B377| STA.b $75

|08B379| LDA.b #$10
|08B37B| JSR AllocateOAMInRegionsADF

|08B37E| LDY.b #$00

.next_never
|08B380| PHX

|08B381| LDA.l $7F5810,X
|08B385| CMP.b #$0D
|08B387| BEQ .inactive

|08B389| ASL A
|08B38A| CLC
|08B38B| ADC.l $7F5810,X

|08B38F| CLC
|08B390| ADC.b #$02
|08B392| TAX

|08B393| STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_object
|08B395| LDA.w .char,X
|08B398| CMP.b #$FF
|08B39A| BEQ .skip

|08B39C| PHX

|08B39D| LDX.b $75

|08B39F| LDA.l $7F5824,X
|08B3A3| STA.b $00

|08B3A5| LDA.l $7F5864,X
|08B3A9| STA.b $01

|08B3AB| LDA.l $7F58A4,X
|08B3AF| STA.b $02

|08B3B1| LDA.l $7F58E4,X
|08B3B5| STA.b $03

|08B3B7| PLX
|08B3B8| PHX

|08B3B9| TXA
|08B3BA| ASL A
|08B3BB| TAX

|08B3BC| REP #$20

|08B3BE| LDA.b $00
|08B3C0| CLC
|08B3C1| ADC.w .offset_y,X

|08B3C4| SEC
|08B3C5| SBC.b $E8
|08B3C7| STA.b $00

|08B3C9| LDA.b $02
|08B3CB| CLC
|08B3CC| ADC.w .offset_x,X

|08B3CF| SEC
|08B3D0| SBC.b $E2
|08B3D2| STA.b $02

;---------------------------------------------------------------------------------------------------

|08B3D4| SEP #$20

|08B3D6| JSR Ancilla_SetOAM_XY

|08B3D9| PLX

|08B3DA| LDA.w .char,X
|08B3DD| STA.b ($90),Y

|08B3DF| INY

|08B3E0| LDA.w .prop,X
|08B3E3| STA.b ($90),Y

|08B3E5| INY
|08B3E6| PHY

|08B3E7| TYA
|08B3E8| SEC
|08B3E9| SBC.b #$04
|08B3EB| LSR A
|08B3EC| LSR A
|08B3ED| TAY

|08B3EE| LDA.b #$02
|08B3F0| STA.b ($92),Y

|08B3F2| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08B3F3| JSR AllocateOAMInCustomRegion

|08B3F6| DEX

|08B3F7| INC.b $08

|08B3F9| LDA.b $08
|08B3FB| CMP.b #$03
|08B3FD| BNE .next_object

;---------------------------------------------------------------------------------------------------

.inactive
|08B3FF| PLX

|08B400| LDA.b $75
|08B402| SEC
|08B403| SBC.b #$10
|08B405| STA.b $75
|08B407| BMI .exit

|08B409| BRL .next_never

.exit
|08B40C| RTS

;===================================================================================================

BombosSpell_ControlBlasting:
|08B40D| PHX

|08B40E| LDY.b #$00

|08B410| LDA.w $0C54,X
|08B413| STA.b $72

|08B415| TAX

.next_blast
|08B416| LDA.l $7F5935,X
|08B41A| CMP.b #$08
|08B41C| BEQ .inactive

|08B41E| LDA.l $7F5945,X
|08B422| DEC A
|08B423| STA.l $7F5945,X
|08B427| BMI .time_up

.inactive
|08B429| BRL .just_draw

;---------------------------------------------------------------------------------------------------

.time_up
|08B42C| LDA.b #$03
|08B42E| STA.l $7F5945,X

|08B432| LDA.l $7F5935,X
|08B436| INC A
|08B437| STA.l $7F5935,X

|08B43B| CMP.b #$01
|08B43D| BNE .inactive

|08B43F| LDA.l $7F5A56
|08B443| BNE .inactive

;---------------------------------------------------------------------------------------------------

|08B445| PHX

|08B446| LDA.b $72
|08B448| CMP.b #$0F
|08B44A| BEQ .maxed_blast

|08B44C| LDA.b $72
|08B44E| INC A
|08B44F| CMP.b #$10
|08B451| BNE .not_maxed

|08B453| LDA.b #$0F

.not_maxed
|08B455| STA.b $72

|08B457| TAX

|08B458| BRA .activate_next

;---------------------------------------------------------------------------------------------------

.maxed_blast
|08B45A| LDX.b #$0F

.next_check
|08B45C| LDA.l $7F5935,X
|08B460| CMP.b #$08
|08B462| BEQ .activate_next

|08B464| DEX
|08B465| BPL .next_check

;---------------------------------------------------------------------------------------------------

.activate_next
|08B467| LDA.b #$00
|08B469| STA.l $7F5935,X

|08B46D| LDA.b #$03
|08B46F| STA.l $7F5945,X

|08B473| PHY

|08B474| TXA
|08B475| ASL A
|08B476| TAY

|08B477| LDA.b $1A
|08B479| AND.b #$3F
|08B47B| TAX

|08B47C| LDA.l BombosBlastRandomPosition+0,X
|08B480| STA.b $00
|08B482| STZ.b $01

|08B484| LDA.l BombosBlastRandomPosition+3,X
|08B488| STA.b $02
|08B48A| STZ.b $03

;---------------------------------------------------------------------------------------------------

|08B48C| TYX

|08B48D| REP #$20

|08B48F| LDA.b $00
|08B491| CLC
|08B492| ADC.b $E8
|08B494| STA.l $7F5955,X

|08B498| LDA.b $02
|08B49A| CLC
|08B49B| ADC.b $E2
|08B49D| STA.l $7F59D5,X

|08B4A1| SEP #$20

|08B4A3| LDA.l $7F59D5,X
|08B4A7| LSR A
|08B4A8| LSR A
|08B4A9| LSR A
|08B4AA| LSR A
|08B4AB| LSR A
|08B4AC| TAX

|08B4AD| LDA.l AncillaPanValues,X
|08B4B1| ORA.b #$0C ; SFX2.0C
|08B4B3| STA.w $012E

|08B4B6| PLY
|08B4B7| PLX

;---------------------------------------------------------------------------------------------------

.just_draw
|08B4B8| JSR AncillaDraw_BombosBlast

|08B4BB| DEX
|08B4BC| BMI .done_blasting

|08B4BE| BRL .next_blast

;---------------------------------------------------------------------------------------------------

.done_blasting
|08B4C1| LDX.b #$0F

.next_active_check
|08B4C3| LDA.l $7F5935,X
|08B4C7| CMP.b #$08
|08B4C9| BNE .found_one

|08B4CB| DEX
|08B4CC| BPL .next_active_check

;---------------------------------------------------------------------------------------------------

|08B4CE| PLX

|08B4CF| STZ.w $0C4A,X

|08B4D2| LDA.b #$01
|08B4D4| STA.w $0AAA

|08B4D7| STZ.w $0324
|08B4DA| STZ.w $031C
|08B4DD| STZ.w $031D

|08B4E0| STZ.b $50

|08B4E2| STZ.w $0FC1

|08B4E5| LDA.b $5D
|08B4E7| CMP.b #$1A ; LINKSTATE 1A
|08B4E9| BEQ .link_bombosing

|08B4EB| LDA.b #$00 ; LINKSTATE 00
|08B4ED| STA.b $5D

|08B4EF| STZ.b $3D

|08B4F1| LDY.b #$00

|08B4F3| LDA.b $3C
|08B4F5| BEQ .sword_not_drawn

|08B4F7| LDA.b $F0
|08B4F9| AND.b #$80
|08B4FB| TAY

.sword_not_drawn
|08B4FC| STY.b $3A

.link_bombosing
|08B4FE| STZ.b $5E
|08B500| STZ.w $0325

|08B503| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.found_one
|08B505| PLX

|08B506| LDA.b $72
|08B508| STA.w $0C54,X

.finish_up
|08B50B| LDA.l $7F5A55
|08B50F| DEC A
|08B510| STA.l $7F5A55
|08B514| BNE .exit

|08B516| LDA.b #$01
|08B518| STA.l $7F5A56
|08B51C| STA.l $7F5A55

.exit
|08B520| RTS

;===================================================================================================

pool AncillaDraw_BombosBlast

.char
|08B521| db $60, $FF, $FF, $FF
|08B525| db $62, $62, $62, $62
|08B529| db $64, $64, $64, $64
|08B52D| db $66, $66, $66, $66
|08B531| db $68, $68, $68, $68
|08B535| db $68, $68, $68, $68
|08B539| db $6A, $6A, $6A, $6A
|08B53D| db $4E, $4E, $4E, $4E

;---------------------------------------------------------------------------------------------------

.prop
|08B541| db $3C, $FF, $FF, $FF
|08B545| db $3C, $7C, $BC, $FC
|08B549| db $3C, $7C, $BC, $FC
|08B54D| db $3C, $7C, $BC, $FC
|08B551| db $3C, $7C, $BC, $FC
|08B555| db $3C, $7C, $BC, $FC
|08B559| db $3C, $7C, $BC, $FC
|08B55D| db $3C, $7C, $BC, $FC

;---------------------------------------------------------------------------------------------------

.offset_y
|08B561| dw  -8,  -1,  -1,  -1
|08B569| dw -12, -12,  -4,  -4
|08B571| dw -16, -16,   0,   0
|08B579| dw -16, -16,   0,   0
|08B581| dw -17, -17,   1,   1
|08B589| dw -19, -19,   3,   3
|08B591| dw -19, -19,   3,   3
|08B599| dw -19, -19,   3,   3

;---------------------------------------------------------------------------------------------------

.offset_x
|08B5A1| dw  -8,  -1,  -1,  -1
|08B5A9| dw -12,  -4, -12,  -4
|08B5B1| dw -16,   0, -16,   0
|08B5B9| dw -16,   0, -16,   0
|08B5C1| dw -17,   1, -17,   1
|08B5C9| dw -19,   3, -19,   3
|08B5D1| dw -19,   3, -19,   3
|08B5D9| dw -19,   3, -19,   3

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_BombosBlast:
|08B5E1| PHX

|08B5E2| LDA.b #$03
|08B5E4| STA.b $0C

|08B5E6| PHX

|08B5E7| TXA
|08B5E8| ASL A
|08B5E9| TAX

|08B5EA| LDA.l $7F5955,X
|08B5EE| STA.b $08

|08B5F0| LDA.l $7F5956,X
|08B5F4| STA.b $09

|08B5F6| LDA.l $7F59D5,X
|08B5FA| STA.b $0A

|08B5FC| LDA.l $7F59D6,X
|08B600| STA.b $0B

|08B602| PLX

;---------------------------------------------------------------------------------------------------

|08B603| LDA.l $7F5935,X

|08B607| CMP.b #$08
|08B609| BEQ .inactive

|08B60B| LDA.b #$10
|08B60D| JSR AllocateOAMInRegionsADF

|08B610| LDY.b #$00

|08B612| LDA.l $7F5935,X
|08B616| ASL A
|08B617| ASL A

|08B618| CLC
|08B619| ADC.b #$03
|08B61B| STA.b $73

|08B61D| TAX

;---------------------------------------------------------------------------------------------------

.next_object
|08B61E| LDA.w .char,X
|08B621| CMP.b #$FF
|08B623| BEQ .skip_object

;---------------------------------------------------------------------------------------------------

|08B625| PHX

|08B626| TXA
|08B627| ASL A
|08B628| TAX

|08B629| REP #$20

|08B62B| LDA.w .offset_y,X
|08B62E| CLC
|08B62F| ADC.b $08

|08B631| SEC
|08B632| SBC.b $E8
|08B634| STA.b $00

|08B636| LDA.w .offset_x,X
|08B639| CLC
|08B63A| ADC.b $0A

|08B63C| SEC
|08B63D| SBC.b $E2
|08B63F| STA.b $02

|08B641| SEP #$20

|08B643| PLX

;---------------------------------------------------------------------------------------------------

|08B644| JSR Ancilla_SetOAM_XY

|08B647| LDA.w .char,X
|08B64A| STA.b ($90),Y

|08B64C| INY

|08B64D| LDA.w .prop,X
|08B650| STA.b ($90),Y

|08B652| INY
|08B653| PHY

|08B654| TYA
|08B655| SEC
|08B656| SBC.b #$04

|08B658| LSR A
|08B659| LSR A
|08B65A| TAY

|08B65B| LDA.b #$02
|08B65D| STA.b ($92),Y

|08B65F| PLY

;---------------------------------------------------------------------------------------------------

.skip_object
|08B660| JSR AllocateOAMInCustomRegion

|08B663| DEX

|08B664| DEC.b $0C
|08B666| BPL .next_object

;---------------------------------------------------------------------------------------------------

.inactive
|08B668| PLX

|08B669| RTS

;===================================================================================================

Ancilla1C_QuakeSpell:
|08B66A| LDA.b $11
|08B66C| BNE .only_draw

|08B66E| LDA.w $0C54,X
|08B671| CMP.b #$02
|08B673| BEQ .finish_up

|08B675| JSR QuakeSpell_ShakeScreen
|08B678| JSR QuakeSpell_ControlBolts

|08B67B| BRL QuakeSpell_SpreadBolts

.finish_up
|08B67E| BRA QuakeSpell_FinishingTouches

;---------------------------------------------------------------------------------------------------

.only_draw
|08B680| PHX

|08B681| LDX.b #$04

|08B683| LDA.l $7F5805,X
|08B687| CMP.w QuakeSpellStates,X
|08B68A| BEQ .bad_branch

|08B68C| JSR AncillaDraw_QuakeInitialBolts

.bad_branch
|08B68F| DEX
|08B690| BPL .bad_branch

|08B692| PLX

|08B693| RTS

;---------------------------------------------------------------------------------------------------

QuakeSpell_FinishingTouches:
|08B694| PHX

|08B695| JSL CheckMedallionDamageToSprite
|08B699| JSL LetsGetReadyToRumble

|08B69D| PLX

|08B69E| STZ.w $0C4A,X

|08B6A1| LDA.b #$00 ; LINKSTATE 00
|08B6A3| STA.b $5D

|08B6A5| LDA.b #$01
|08B6A7| STA.w $0AAA

|08B6AA| STZ.w $0324
|08B6AD| STZ.w $031C
|08B6B0| STZ.w $031D

|08B6B3| STZ.b $50
|08B6B5| STZ.b $3D

|08B6B7| STZ.w $0FC1

|08B6BA| STZ.w $011A
|08B6BD| STZ.w $011B
|08B6C0| STZ.w $011C
|08B6C3| STZ.w $011D

;---------------------------------------------------------------------------------------------------

|08B6C6| LDA.b $8A
|08B6C8| CMP.b #$47 ; OW 47
|08B6CA| BNE .no_turtle_rock_trigger

|08B6CC| LDA.l $7EF2C7
|08B6D0| AND.b #$20
|08B6D2| BNE .no_turtle_rock_trigger

|08B6D4| LDY.b #$03
|08B6D6| JSR Ancilla_CheckForEntranceTrigger
|08B6D9| BCC .no_turtle_rock_trigger

|08B6DB| LDA.b #$04
|08B6DD| STA.w $04C6

|08B6E0| STZ.b $B0
|08B6E2| STZ.b $C8

;---------------------------------------------------------------------------------------------------

.no_turtle_rock_trigger
|08B6E4| LDY.b #$00

|08B6E6| LDA.b $3C
|08B6E8| BEQ .no_sword_charge

|08B6EA| LDA.b $F0
|08B6EC| AND.b #$80
|08B6EE| TAY

.no_sword_charge
|08B6EF| STY.b $3A

|08B6F1| STZ.b $5E
|08B6F3| STZ.w $0325

|08B6F6| RTS

;===================================================================================================

QuakeSpell_ShakeScreen:
|08B6F7| REP #$20

|08B6F9| LDA.l $7F581E
|08B6FD| STA.w $011C

|08B700| EOR.w #$FFFF
|08B703| INC A
|08B704| STA.l $7F581E

|08B708| SEP #$20

|08B70A| LDA.b $30
|08B70C| CLC
|08B70D| ADC.w $011C
|08B710| STA.b $30

|08B712| RTS

;===================================================================================================

QuakeSpellStates:
|08B713| db $17, $16, $17, $16, $10

;===================================================================================================

QuakeSpell_ControlBolts:
|08B718| PHX

|08B719| LDA.w $0C54,X
|08B71C| STA.l $7F580F

|08B720| LDA.l $7F580A
|08B724| TAX

;---------------------------------------------------------------------------------------------------

.next_bolt
|08B725| LDA.l $7F5805,X
|08B729| CMP.w QuakeSpellStates,X
|08B72C| BEQ .skip

|08B72E| LDA.l $7F5800,X
|08B732| DEC A
|08B733| STA.l $7F5800,X
|08B737| BPL .just_draw

|08B739| LDA.b #$01
|08B73B| STA.l $7F5800,X
|08B73F| LDA.l $7F5805,X

|08B743| INC A
|08B744| STA.l $7F5805,X

|08B748| CMP.w QuakeSpellStates,X
|08B74B| BEQ .skip

;---------------------------------------------------------------------------------------------------

|08B74D| TXY
|08B74E| BNE .dont_go_to_2

|08B750| CMP.b #$02
|08B752| BNE .dont_go_to_2

|08B754| LDA.b #$0C ; SFX2.0C
|08B756| JSR Ancilla_SFX2_Near

|08B759| LDA.b #$01
|08B75B| STA.l $7F580A

|08B75F| BRA .just_draw

;---------------------------------------------------------------------------------------------------

.dont_go_to_2
|08B761| CPX.b #$01
|08B763| BNE .dont_go_to_3

|08B765| CMP.b #$02
|08B767| BNE .dont_go_to_3

|08B769| LDA.b #$04
|08B76B| STA.l $7F580A

|08B76F| BRA .just_draw

;---------------------------------------------------------------------------------------------------

.dont_go_to_3
|08B771| CPX.b #$04
|08B773| BNE .just_draw

|08B775| CMP.b #$07
|08B777| BNE .just_draw

|08B779| LDA.b #$01
|08B77B| STA.l $7F580F

;---------------------------------------------------------------------------------------------------

.just_draw
|08B77F| JSR AncillaDraw_QuakeInitialBolts

;---------------------------------------------------------------------------------------------------

.skip
|08B782| DEX
|08B783| BPL .next_bolt

|08B785| PLX

|08B786| LDA.l $7F580F
|08B78A| STA.w $0C54,X

|08B78D| RTS

;===================================================================================================

pool AncillaDraw_QuakeInitialBolts

.offset
|08B78E| db $00
|08B78F| db $18
|08B790| db $00
|08B791| db $18
|08B792| db $2F

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_QuakeInitialBolts:
|08B793| PHX

|08B794| LDA.l $7F5805,X
|08B798| CLC
|08B799| ADC.w .offset,X
|08B79C| ASL A
|08B79D| TAY

|08B79E| LDA.w InitialQuakeBoltPointers+0,Y
|08B7A1| STA.b $72

|08B7A3| LDA.w InitialQuakeBoltPointers+1,Y
|08B7A6| STA.b $73

|08B7A8| LDA.w InitialQuakeBoltPointers+2,Y
|08B7AB| STA.b $74

|08B7AD| LDA.w InitialQuakeBoltPointers+3,Y
|08B7B0| STA.b $75

;---------------------------------------------------------------------------------------------------

|08B7B2| REP #$20

|08B7B4| LDA.b $74
|08B7B6| SEC
|08B7B7| SBC.b $72
|08B7B9| STA.b $74

|08B7BB| SEP #$20

|08B7BD| LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_bolt
|08B7BF| TXY

|08B7C0| REP #$20

|08B7C2| LDA.b ($72),Y
|08B7C4| AND.w #$00FF
|08B7C7| CMP.w #$0080
|08B7CA| BCC .positive_x

|08B7CC| ORA.w #$FF00

.positive_x
|08B7CF| STA.b $02

|08B7D1| LDA.l $7F580D
|08B7D5| CLC
|08B7D6| ADC.b $02

|08B7D8| SEC
|08B7D9| SBC.b $E2
|08B7DB| STA.b $02

;---------------------------------------------------------------------------------------------------

|08B7DD| INX
|08B7DE| TXY

|08B7DF| LDA.b ($72),Y
|08B7E1| AND.w #$00FF
|08B7E4| CMP.w #$0080
|08B7E7| BCC .positive_y

|08B7E9| ORA.w #$FF00

.positive_y
|08B7EC| STA.b $00

|08B7EE| LDA.l $7F580B
|08B7F2| CLC
|08B7F3| ADC.b $00

|08B7F5| SEC
|08B7F6| SBC.b $E8
|08B7F8| STA.b $00

|08B7FA| INX

|08B7FB| SEP #$20

|08B7FD| PHX

|08B7FE| LDX.b #$F0

|08B800| LDA.b $01
|08B802| BNE .off_screen

|08B804| LDA.b $03
|08B806| BNE .off_screen

|08B808| LDY.b #$00

|08B80A| LDA.b $02
|08B80C| STA.b ($90),Y

|08B80E| LDA.b $00
|08B810| CMP.b #$F0
|08B812| BCS .off_screen

|08B814| TAX

;---------------------------------------------------------------------------------------------------

.off_screen
|08B815| INC.b $90

|08B817| LDY.b #$00

|08B819| TXA
|08B81A| STA.b ($90),Y

|08B81C| INC.b $90

|08B81E| PLX
|08B81F| PHX

|08B820| TXY

|08B821| LDA.b ($72),Y
|08B823| AND.b #$0F
|08B825| TAX

|08B826| LDA.w QuakeBoltChar,X
|08B829| LDY.b #$00
|08B82B| STA.b ($90),Y

|08B82D| INC.b $90

;---------------------------------------------------------------------------------------------------

|08B82F| PLX
|08B830| TXY

|08B831| LDA.b ($72),Y
|08B833| AND.b #$C0
|08B835| ORA.b #$3C

|08B837| LDY.b #$00
|08B839| STA.b ($90),Y

|08B83B| INC.b $90

|08B83D| LDY.b #$00
|08B83F| LDA.b #$02
|08B841| STA.b ($92),Y

|08B843| INC.b $92

|08B845| INX
|08B846| CPX.b $74
|08B848| BEQ .done

|08B84A| BRL .next_bolt

;---------------------------------------------------------------------------------------------------

.done
|08B84D| PLX

|08B84E| RTS

;===================================================================================================

QuakeSpell_SpreadBolts:
|08B84F| LDA.w $0C54,X
|08B852| CMP.b #$01
|08B854| BNE .exit

|08B856| LDA.w $0C68,X
|08B859| BNE .proceed_to_bolts

|08B85B| LDA.b #$02
|08B85D| STA.w $0C68,X

|08B860| LDA.w $0C5E,X
|08B863| INC A
|08B864| STA.w $0C5E,X

|08B867| CMP.b #$37
|08B869| BNE .proceed_to_bolts

|08B86B| LDA.b #$02
|08B86D| STA.w $0C54,X

.exit
|08B870| RTS

;---------------------------------------------------------------------------------------------------

.proceed_to_bolts
|08B871| BRA AncillaDraw_QuakeSpreadBolts

;===================================================================================================

QuakeBoltChar:
|08B873| db $40, $42, $44, $46
|08B877| db $48, $4A, $4C, $4E
|08B87B| db $60, $62, $64, $66
|08B87F| db $68, $6A, $63

;===================================================================================================

AncillaDraw_QuakeSpreadBolts:
|08B882| PHX

|08B883| LDA.w $0C5E,X
|08B886| ASL A
|08B887| TAY

|08B888| LDA.w SpreadQuakeBoltPointers+0,Y
|08B88B| STA.b $72

|08B88D| LDA.w SpreadQuakeBoltPointers+1,Y
|08B890| STA.b $73

|08B892| LDA.w SpreadQuakeBoltPointers+2,Y
|08B895| STA.b $74

|08B897| LDA.w SpreadQuakeBoltPointers+3,Y
|08B89A| STA.b $75

|08B89C| REP #$20

|08B89E| LDA.b $74
|08B8A0| SEC
|08B8A1| SBC.b $72
|08B8A3| STA.b $74

|08B8A5| SEP #$20

|08B8A7| LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_bolt
|08B8A9| TXY

|08B8AA| LDA.b ($72),Y
|08B8AC| LDY.b #$00
|08B8AE| STA.b ($90),Y

|08B8B0| INC.b $90

;---------------------------------------------------------------------------------------------------

|08B8B2| INX
|08B8B3| TXY

|08B8B4| LDA.b ($72),Y
|08B8B6| LDY.b #$00
|08B8B8| STA.b ($90),Y

|08B8BA| INC.b $90

;---------------------------------------------------------------------------------------------------

|08B8BC| INX
|08B8BD| PHX
|08B8BE| TXY

|08B8BF| LDA.b ($72),Y
|08B8C1| AND.b #$0F
|08B8C3| TAX

|08B8C4| LDA.w QuakeBoltChar,X
|08B8C7| LDY.b #$00
|08B8C9| STA.b ($90),Y

|08B8CB| INC.b $90

;---------------------------------------------------------------------------------------------------

|08B8CD| PLX
|08B8CE| TXY

|08B8CF| LDA.b ($72),Y
|08B8D1| AND.b #$C0
|08B8D3| ORA.b #$3C

|08B8D5| LDY.b #$00

|08B8D7| STA.b ($90),Y

|08B8D9| INC.b $90

;---------------------------------------------------------------------------------------------------

|08B8DB| TXY
|08B8DC| LDA.b ($72),Y
|08B8DE| AND.b #$30

|08B8E0| LSR A
|08B8E1| LSR A
|08B8E2| LSR A
|08B8E3| LSR A

|08B8E4| LDY.b #$00

|08B8E6| STA.b ($92),Y

|08B8E8| INC.b $92

|08B8EA| JSR AllocateOAMInCustomRegion

|08B8ED| INX
|08B8EE| CPX.b $74
|08B8F0| BNE .next_bolt

;---------------------------------------------------------------------------------------------------

|08B8F2| PLX

|08B8F3| RTS

;===================================================================================================

PowderDraw:

.anim_step
|08B8F4| db $0D, $0E, $0F, $00, $01
|08B8F9| db $02, $03, $04, $05, $06

|08B8FE| db $0A, $0B, $0C, $00, $01
|08B903| db $02, $03, $04, $05, $06

|08B908| db $10, $11, $12, $00, $01
|08B90D| db $02, $03, $04, $05, $06

|08B912| db $07, $08, $09, $00, $01
|08B917| db $02, $03, $04, $05, $06

;---------------------------------------------------------------------------------------------------

.group_offset
|08B91C| db $00
|08B91D| db $0A
|08B91E| db $14
|08B91F| db $1E

;---------------------------------------------------------------------------------------------------

.offset_y
|08B920| dw -20, -15, -13,  -7, -18
|08B92A| dw -13, -13, -13, -20, -13
|08B934| dw -13,  -8, -20, -13, -13
|08B93E| dw  -8, -19, -12, -12

|08B946| dw  -7, -18, -11, -11,  -6
|08B950| dw -17, -10, -10,  -5, -16
|08B95A| dw -14, -12,  -9, -17, -14
|08B964| dw -12,  -8, -18, -14

|08B96C| dw -13,  -6, -33, -31, -29
|08B976| dw -26, -28, -25, -23, -19
|08B980| dw -22, -18, -17, -10,  -2
|08B98A| dw   0,   2,   5,  -9

|08B992| dw  -6,  -4,   0, -16, -12
|08B99C| dw -11,  -4, -16, -14, -12
|08B9A6| dw  -9, -17, -14, -12,  -8
|08B9B0| dw -18, -14, -13,  -6

;---------------------------------------------------------------------------------------------------

.offset_x
|08B9B8| dw  -5, -12,   2,  -9,  -7
|08B9C2| dw -10,  -6,  -2,  -6, -12
|08B9CC| dw   1,  -6,  -6, -12,   1
|08B9D6| dw  -6,  -6, -12,   1

|08B9DE| dw  -6,  -6, -12,   1,  -6
|08B9E8| dw  -6, -12,   1,  -6, -17
|08B9F2| dw -23, -14, -19, -11, -18
|08B9FC| dw  -9, -13,  -4, -13

|08BA04| dw  -1,  -8,  -3,  -9,   0
|08BA0E| dw  -5,  -3, -10,  -1,  -5
|08BA18| dw  -4, -13,  -1,  -8,  -3
|08BA22| dw  -9,   0,  -5,  -3

|08BA2A| dw -10,  -1,  -5,  -3, -13
|08BA34| dw  -1,  -8,   9,  15,   6
|08BA3E| dw  11,   3,  10,   1,   5
|08BA48| dw  -4,   5,  -7,   0

;---------------------------------------------------------------------------------------------------

.char
|08BA50| db $09, $0A, $0A, $09, $09

|08BA55| db $09, $09, $09, $09, $09

|08BA5A| db $09, $09, $09, $09, $09

|08BA5F| db $09, $09, $09, $09, $09

;---------------------------------------------------------------------------------------------------

.prop
|08BA64| db $68, $24, $A2, $28, $68
|08BA69| db $E2, $28, $A4, $68, $E2
|08BA6E| db $A4, $28, $22, $A4, $E8
|08BA73| db $62, $24, $A8, $E2

|08BA77| db $64, $28, $A2, $E4, $68
|08BA7C| db $22, $A4, $E8, $62, $E2
|08BA81| db $A4, $E8, $64, $E8, $A8
|08BA86| db $E4, $62, $E4, $A8

|08BA8A| db $E2, $68, $E2, $A4, $E8
|08BA8F| db $64, $E8, $A8, $E4, $62
|08BA94| db $E4, $A8, $E2, $68, $E2
|08BA99| db $A4, $E8, $64, $E8

|08BA9D| db $A8, $E4, $62, $E4, $A8
|08BAA2| db $E2, $68, $E2, $A4, $E8
|08BAA7| db $64, $E8, $A8, $E4, $62
|08BAAC| db $E4, $A8, $E2, $68

;===================================================================================================

Ancilla1A_PowderDust:
|08BAB0| LDA.b $11
|08BAB2| BNE .just_draw

|08BAB4| JSR Powder_CheckDamageToSprites

|08BAB7| DEC.w $03B1,X
|08BABA| BPL .just_draw

;---------------------------------------------------------------------------------------------------

|08BABC| LDA.b #$01
|08BABE| STA.w $03B1,X

|08BAC1| LDY.w $0C72,X

|08BAC4| LDA.w PowderDraw.group_offset,Y
|08BAC7| STA.b $00

|08BAC9| LDA.w $0C5E,X
|08BACC| INC A
|08BACD| CMP.b #$0A
|08BACF| BNE .dont_terminate

|08BAD1| STZ.w $0C4A,X
|08BAD4| STZ.w $0333

|08BAD7| RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
|08BAD8| STA.w $0C5E,X

|08BADB| CLC
|08BADC| ADC.b $00
|08BADE| TAY

|08BADF| LDA.w PowderDraw.anim_step,Y
|08BAE2| STA.w $03C2,X

;---------------------------------------------------------------------------------------------------

.just_draw
|08BAE5| LDA.w $0C90,X
|08BAE8| JSR AllocateOAMInRegionsBE

;===================================================================================================

AncillaDraw_Powder:
|08BAEB| JSR Ancilla_PrepOAMCoord

|08BAEE| PHX

|08BAEF| LDA.b $00
|08BAF1| STA.b $06

|08BAF3| LDA.b $01
|08BAF5| STA.b $07

|08BAF7| LDA.b $02
|08BAF9| STA.b $08

|08BAFB| LDA.b $03
|08BAFD| STA.b $09

|08BAFF| LDA.w $03C2,X
|08BB02| STA.b $0C

|08BB04| ASL A
|08BB05| ASL A
|08BB06| STA.b $0A

|08BB08| ASL A
|08BB09| STA.b $04

;---------------------------------------------------------------------------------------------------

|08BB0B| LDA.b #$03
|08BB0D| STA.w $0072

|08BB10| LDY.b #$00

.next_object
|08BB12| LDX.b $04

|08BB14| REP #$20

|08BB16| LDA.b $06
|08BB18| CLC
|08BB19| ADC.w PowderDraw.offset_y,X
|08BB1C| STA.b $00

|08BB1E| LDA.b $08
|08BB20| CLC
|08BB21| ADC.w PowderDraw.offset_x,X
|08BB24| STA.b $02

|08BB26| SEP #$20

|08BB28| JSR Ancilla_SetOAM_XY

|08BB2B| LDX.b $0C

|08BB2D| LDA.w PowderDraw.char,X
|08BB30| STA.b ($90),Y

|08BB32| INY

|08BB33| LDX.b $0A

|08BB35| LDA.w PowderDraw.prop,X
|08BB38| AND.b #$CF
|08BB3A| ORA.b $65
|08BB3C| STA.b ($90),Y

|08BB3E| INY
|08BB3F| PHY

|08BB40| TYA
|08BB41| SEC
|08BB42| SBC.b #$04
|08BB44| LSR A
|08BB45| LSR A
|08BB46| TAY

|08BB47| LDA.b #$00
|08BB49| STA.b ($92),Y

|08BB4B| PLY

|08BB4C| INC.b $04
|08BB4E| INC.b $04

|08BB50| INC.b $0A

|08BB52| DEC.b $72
|08BB54| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08BB56| PLX

|08BB57| RTS

;===================================================================================================

Powder_CheckDamageToSprites:
|08BB58| LDY.b #$0F

.next_sprite
|08BB5A| TYA
|08BB5B| EOR.b $1A
|08BB5D| AND.b #$03
|08BB5F| BNE .skip_sprite

|08BB61| LDA.w $0DD0,Y
|08BB64| CMP.b #$09
|08BB66| BNE .skip_sprite

|08BB68| LDA.w $0CD2,Y
|08BB6B| AND.b #$20
|08BB6D| BNE .skip_sprite

;---------------------------------------------------------------------------------------------------

|08BB6F| JSR Ancilla_SetupBasicHitbox

|08BB72| PHY
|08BB73| PHX

|08BB74| TYX
|08BB75| JSL SetupSpriteHitbox_long

|08BB79| PLX
|08BB7A| PLY

|08BB7B| JSL CheckIfHitboxesOverlap_long
|08BB7F| BCC .skip_sprite

|08BB81| LDA.w $0E20,Y
|08BB84| CMP.b #$0B ; SPRITE 0B
|08BB86| BNE .not_cucco_easter_egg

|08BB88| LDA.b $1B
|08BB8A| BEQ .not_cucco_easter_egg

|08BB8C| LDA.w $048E ; ROOM 0101
|08BB8F| DEC A
|08BB90| BNE .not_cucco_easter_egg

|08BB92| BRA .special_transform

;---------------------------------------------------------------------------------------------------

.not_cucco_easter_egg
|08BB94| CMP.b #$0D ; SPRITE 0D
|08BB96| BNE .not_buzz_blob

|08BB98| LDA.w $0EB0,Y
|08BB9B| BNE .skip_sprite

.special_transform
|08BB9D| LDA.b #$01
|08BB9F| STA.w $0EB0,Y

|08BBA2| PHX
|08BBA3| PHY

|08BBA4| TYX
|08BBA5| JSL SpawnPoofGarnish

|08BBA9| PLY
|08BBAA| PLX

|08BBAB| BRA .skip_sprite

;---------------------------------------------------------------------------------------------------

.not_buzz_blob
|08BBAD| PHX
|08BBAE| PHY

|08BBAF| TYX

|08BBB0| LDA.b #$0A
|08BBB2| JSL CheckAncillaDamageToSprite_preset

|08BBB6| PLY
|08BBB7| PLX

.skip_sprite
|08BBB8| DEY
|08BBB9| BPL .next_sprite

|08BBBB| RTS

;===================================================================================================

Ancilla1D_ScreenShake:
|08BBBC| LDA.b $11
|08BBBE| BNE .alert

|08BBC0| DEC.w $0C5E,X
|08BBC3| BPL .delay

|08BBC5| STZ.w $011A
|08BBC8| STZ.w $011B
|08BBCB| STZ.w $011C
|08BBCE| STZ.w $011D

|08BBD1| STZ.w $0C4A,X

|08BBD4| RTS

;---------------------------------------------------------------------------------------------------

.delay
|08BBD5| JSL DashTremor_Twiddle

|08BBD9| LDA.b $00
|08BBDB| STA.w $011A,Y

|08BBDE| LDA.b $01
|08BBE0| STA.w $011B,Y

|08BBE3| TYA
|08BBE4| LSR A
|08BBE5| EOR.b #$01
|08BBE7| TAY

|08BBE8| LDA.w $0030,Y
|08BBEB| CLC
|08BBEC| ADC.b $00
|08BBEE| STA.w $0030,Y

.alert
|08BBF1| BRL AlertSprites

;===================================================================================================

pool Ancilla1E_DashDust

.offset_y
|08BBF4| dw  -2,   0,  -1
|08BBFA| dw  -3,  -2,   0
|08BC00| dw  -3,   0,  -1
|08BC06| dw  -3,  -1,  -1
|08BC0C| dw  -2,  -1,  -1
|08BC12| dw  -2,   0,  -1
|08BC18| dw  -3,  -2,   0
|08BC1E| dw  -3,   0,  -1
|08BC24| dw  -3,  -1,  -1
|08BC2A| dw  -2,  -1,  -1

.offset_x
|08BC30| dw  10,   5,  -1
|08BC36| dw   0,  10,   5
|08BC3C| dw   0,   5,  -1
|08BC42| dw   0,  -1,  -1
|08BC48| dw   9,  -1,  -1
|08BC4E| dw  10,   5,  -1
|08BC54| dw   0,  10,   5
|08BC5A| dw   0,   5,  -1
|08BC60| dw   0,  -1,  -1
|08BC66| dw   9,  -1,  -1

.char
|08BC6C| db $CF, $A9, $FF
|08BC6F| db $A9, $DF, $CF
|08BC72| db $CF, $DF, $FF
|08BC75| db $DF, $FF, $FF
|08BC78| db $A9, $FF, $FF
|08BC7B| db $CF, $CF, $FF
|08BC7E| db $CF, $DF, $CF
|08BC81| db $CF, $DF, $FF
|08BC84| db $DF, $FF, $FF
|08BC87| db $CF, $FF, $FF

.offset_from_link
|08BC8A| dw   0
|08BC8C| dw   0
|08BC8E| dw   4
|08BC90| dw  -4

endpool

;---------------------------------------------------------------------------------------------------

Ancilla1E_DashDust:
|08BC92| LDA.w $0C54,X
|08BC95| BEQ .stationary

|08BC97| JSL DashDust_Motive

|08BC9B| BRA .exit

;---------------------------------------------------------------------------------------------------

.stationary
|08BC9D| LDA.w $0C68,X
|08BCA0| BNE .delay

|08BCA2| LDA.b #$03
|08BCA4| STA.w $0C68,X

|08BCA7| LDA.w $0C5E,X
|08BCAA| INC A
|08BCAB| STA.w $0C5E,X

|08BCAE| CMP.b #$05
|08BCB0| BEQ .exit

|08BCB2| CMP.b #$06
|08BCB4| BNE .delay

|08BCB6| STZ.w $0C4A,X

.exit
|08BCB9| RTS

;---------------------------------------------------------------------------------------------------

.delay
|08BCBA| LDA.w $0C5E,X
|08BCBD| CMP.b #$05
|08BCBF| BEQ .exit

;---------------------------------------------------------------------------------------------------

|08BCC1| JSR Ancilla_PrepOAMCoord

|08BCC4| PHX

|08BCC5| LDA.b $00
|08BCC7| STA.b $06

|08BCC9| LDA.b $01
|08BCCB| STA.b $07

|08BCCD| LDA.b $02
|08BCCF| STA.b $08

|08BCD1| LDA.b $03
|08BCD3| STA.b $09

|08BCD5| LDY.b $2F

|08BCD7| LDA.w .offset_from_link+0,Y
|08BCDA| STA.b $0C

|08BCDC| LDA.w .offset_from_link+1,Y
|08BCDF| STA.b $0D

|08BCE1| LDY.b #$00

|08BCE3| LDA.w $0351
|08BCE6| CMP.b #$01
|08BCE8| BNE .not_in_water

|08BCEA| LDY.b #$05

.not_in_water
|08BCEC| STY.b $04

|08BCEE| LDA.w $0C5E,X
|08BCF1| CLC
|08BCF2| ADC.b $04
|08BCF4| STA.b $04

|08BCF6| ASL A
|08BCF7| CLC
|08BCF8| ADC.b $04
|08BCFA| STA.b $04

;---------------------------------------------------------------------------------------------------

|08BCFC| LDA.b #$02
|08BCFE| STA.b $72

|08BD00| LDY.b #$00

.next_object
|08BD02| LDX.b $04

|08BD04| LDA.w .char,X
|08BD07| CMP.b #$FF
|08BD09| BEQ .skip_object

|08BD0B| TXA
|08BD0C| ASL A
|08BD0D| TAX

|08BD0E| REP #$20

|08BD10| LDA.b $06
|08BD12| CLC
|08BD13| ADC.w .offset_y,X
|08BD16| STA.b $00

|08BD18| LDA.b $08
|08BD1A| CLC
|08BD1B| ADC.w .offset_x,X

|08BD1E| CLC
|08BD1F| ADC.b $0C
|08BD21| STA.b $02

;---------------------------------------------------------------------------------------------------

|08BD23| SEP #$20

|08BD25| JSR Ancilla_SetOAM_XY

|08BD28| LDX.b $04

|08BD2A| LDA.w .char,X
|08BD2D| STA.b ($90),Y

|08BD2F| INY

|08BD30| LDA.b #$04
|08BD32| ORA.b $65
|08BD34| STA.b ($90),Y

|08BD36| INY
|08BD37| PHY

|08BD38| TYA
|08BD39| SEC
|08BD3A| SBC.b #$04
|08BD3C| LSR A
|08BD3D| LSR A
|08BD3E| TAY

|08BD3F| LDA.b #$00
|08BD41| STA.b ($92),Y

|08BD43| PLY

;---------------------------------------------------------------------------------------------------

.skip_object
|08BD44| INC.b $04

|08BD46| DEC.b $72
|08BD48| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08BD4A| PLX

|08BD4B| RTS

;===================================================================================================

pool Hookshot

.char
|08BD4C| db $09, $0A, $FF ; up
|08BD4F| db $09, $0A, $FF ; down
|08BD52| db $09, $FF, $0A ; left
|08BD55| db $09, $FF, $0A ; right

.prop
|08BD58| db $00, $00, $FF ; up
|08BD5B| db $80, $80, $FF ; down
|08BD5E| db $40, $FF, $40 ; left
|08BD61| db $00, $FF, $00 ; right

.box_size_y
|08BD64| dw   8 ; up
|08BD66| dw  -9 ; down - This is larger, but does it matter?
|08BD68| dw   0 ; left
|08BD6A| dw   0 ; right

.box_size_x
|08BD6C| dw   0 ; up
|08BD6E| dw   0 ; down
|08BD70| dw   8 ; left
|08BD72| dw  -8 ; right

endpool

;===================================================================================================

Ancilla1F_Hookshot:
|08BD74| LDA.b $11
|08BD76| BNE .just_draw

|08BD78| LDA.w $0C68,X
|08BD7B| BNE .no_chain_sfx

|08BD7D| LDA.b #$07
|08BD7F| STA.w $0C68,X

|08BD82| LDA.b #$0A ; SFX2.0A
|08BD84| JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.no_chain_sfx
|08BD87| LDA.w $037E
|08BD8A| BNE .just_draw

|08BD8C| JSR AncillaMoveY
|08BD8F| JSR AncillaMoveX

|08BD92| LDA.w $0C54,X
|08BD95| BEQ Hookshot_Extending

|08BD97| DEC.w $0C5E,X
|08BD9A| BMI Hookshot_DeleteSelf

.just_draw
|08BD9C| BRL AncillaDraw_Hookshot

;===================================================================================================

Hookshot_DeleteSelf:
|08BD9F| STZ.w $0C4A,X

|08BDA2| RTS

;===================================================================================================

Hookshot_Extending:
|08BDA3| LDA.w $0C5E,X
|08BDA6| INC A
|08BDA7| STA.w $0C5E,X

|08BDAA| CMP.b #$20
|08BDAC| BNE .not_fully_extended

|08BDAE| LDA.b #$01
|08BDB0| STA.w $0C54,X

|08BDB3| LDA.w $0C22,X
|08BDB6| EOR.b #$FF
|08BDB8| INC A
|08BDB9| STA.w $0C22,X

|08BDBC| LDA.w $0C2C,X
|08BDBF| EOR.b #$FF
|08BDC1| INC A
|08BDC2| STA.w $0C2C,X

;---------------------------------------------------------------------------------------------------

.not_fully_extended
|08BDC5| JSR Hookshot_ShouldIEvenBotherWithTiles
|08BDC8| BCC .do_bother

|08BDCA| BRL AncillaDraw_Hookshot

;---------------------------------------------------------------------------------------------------

.do_bother
|08BDCD| LDA.w $0385,X
|08BDD0| BNE .ignore_collision

|08BDD2| LDA.w $0C54,X
|08BDD5| BNE .ignore_collision

|08BDD7| JSR Ancilla_CheckSpriteCollision
|08BDDA| BCC .ignore_collision

|08BDDC| LDA.w $0C54,X
|08BDDF| BNE .ignore_collision

;---------------------------------------------------------------------------------------------------

|08BDE1| LDA.b #$01
|08BDE3| STA.w $0C54,X

|08BDE6| LDA.w $0C22,X
|08BDE9| EOR.b #$FF
|08BDEB| INC A
|08BDEC| STA.w $0C22,X

|08BDEF| LDA.w $0C2C,X
|08BDF2| EOR.b #$FF
|08BDF4| INC A
|08BDF5| STA.w $0C2C,X

|08BDF8| BRA .ignore_collision

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_08BDFA:
|08BDFA| BRL Hookshot_ExtraCollisionLogic.branching_here_unreachable

;---------------------------------------------------------------------------------------------------

.ignore_collision
|08BDFD| JSL Hookshot_CheckTileCollision

|08BE01| STZ.b $00

|08BE03| LDA.b $1B
|08BE05| BEQ .outdoors_ledge

|08BE07| LDY.b #$01

|08BE09| LDA.w $0C72,X
|08BE0C| AND.b #$02
|08BE0E| BNE .indoor_horizontal_ledge

|08BE10| LDA.w $036D
|08BE13| LSR A
|08BE14| LSR A
|08BE15| LSR A
|08BE16| LSR A
|08BE17| STA.b $00

|08BE19| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.indoor_horizontal_ledge
|08BE1B| LDA.w $036D,Y
|08BE1E| ORA.b $00
|08BE20| AND.b #$03
|08BE22| STA.b $00

|08BE24| BEQ .not_ledge

|08BE26| BRA .ledge_collision

;---------------------------------------------------------------------------------------------------

.outdoors_ledge
|08BE28| LDA.w $036E
|08BE2B| AND.b #$03
|08BE2D| ORA.w $036D
|08BE30| ORA.w $0370
|08BE33| AND.b #$33
|08BE35| BEQ .not_ledge

;---------------------------------------------------------------------------------------------------

.ledge_collision
|08BE37| DEC.w $0394,X
|08BE3A| BPL .not_ledge

|08BE3C| LDY.w $0380,X
|08BE3F| BEQ .last_tile_passable

|08BE41| LDA.b $00
|08BE43| AND.b #$03
|08BE45| BNE .hit_indoor_ledge

|08BE47| CPY.b $76
|08BE49| BEQ .last_tile_passable

;---------------------------------------------------------------------------------------------------

.hit_indoor_ledge
|08BE4B| LDA.b #$02
|08BE4D| STA.w $0394,X

|08BE50| DEC.w $0385,X
|08BE53| BPL .not_ledge

|08BE55| STZ.w $0385,X

|08BE58| BRA .not_ledge

.last_tile_passable
|08BE5A| INC.w $0385,X

|08BE5D| LDA.b $76
|08BE5F| STA.w $0380,X

|08BE62| LDA.b #$01
|08BE64| STA.w $0394,X

;---------------------------------------------------------------------------------------------------

.not_ledge
|08BE67| LDA.w $0385,X
|08BE6A| BNE .just_draw_already

|08BE6C| LDA.w $0394,X
|08BE6F| BMI Hookshot_ExtraCollisionLogic

|08BE71| DEC.w $0394,X

.just_draw_already
|08BE74| BRL AncillaDraw_Hookshot

;===================================================================================================

Hookshot_ExtraCollisionLogic:
|08BE77| LDA.b $0E

|08BE79| LSR A
|08BE7A| LSR A
|08BE7B| LSR A
|08BE7C| LSR A

|08BE7D| ORA.b $0E
|08BE7F| ORA.b $58
|08BE81| ORA.b $0C
|08BE83| AND.b #$03

|08BE85| BEQ .no_collision

|08BE87| LDA.w $0C54,X
|08BE8A| BNE .no_collision

|08BE8C| LDA.b #$01
|08BE8E| STA.w $0C54,X

|08BE91| LDA.w $0C22,X
|08BE94| EOR.b #$FF
|08BE96| INC A
|08BE97| STA.w $0C22,X

|08BE9A| LDA.w $0C2C,X
|08BE9D| EOR.b #$FF
|08BE9F| INC A
|08BEA0| STA.w $0C2C,X

|08BEA3| LDA.w $02F6
|08BEA6| AND.b #$03
|08BEA8| BNE .no_collision

;---------------------------------------------------------------------------------------------------

|08BEAA| PHX

|08BEAB| LDY.b #$01
|08BEAD| LDA.b #$06 ; ANCILLA 06
|08BEAF| JSL AncillaAdd_HookshotWallClink

|08BEB3| PLX

|08BEB4| LDY.b #$06 ; SFX2.06

|08BEB6| LDA.w $02F6
|08BEB9| AND.b #$30
|08BEBB| BNE .key_door

|08BEBD| LDY.b #$05 ; SFX2.05

.key_door
|08BEBF| TYA
|08BEC0| JSR Ancilla_SFX2_Pan

.no_collision
|08BEC3| LDA.w $02F6
|08BEC6| AND.b #$03
|08BEC8| BEQ AncillaDraw_Hookshot

;---------------------------------------------------------------------------------------------------

.branching_here_unreachable
|08BECA| LDA.w $0C5E,X
|08BECD| CMP.b #$04
|08BECF| BCS .dont_delete_self

|08BED1| BRL Hookshot_DeleteSelf

.dont_delete_self
|08BED4| LDA.b #$01
|08BED6| STA.w $037E

|08BED9| STX.w $039D

;===================================================================================================

AncillaDraw_Hookshot:
|08BEDC| JSR Ancilla_PrepOAMCoord

|08BEDF| LDA.w $0385,X
|08BEE2| BEQ .not_max_priority

|08BEE4| LDA.b #$30
|08BEE6| STA.b $65

.not_max_priority
|08BEE8| REP #$20

|08BEEA| LDA.b $00
|08BEEC| STA.b $04

|08BEEE| LDA.b $02
|08BEF0| STA.b $06

|08BEF2| SEP #$20

|08BEF4| PHX

|08BEF5| LDA.w $0C72,X
|08BEF8| STA.b $08

|08BEFA| ASL A
|08BEFB| CLC
|08BEFC| ADC.b $08
|08BEFE| STA.b $0A

|08BF00| TAX

;---------------------------------------------------------------------------------------------------

|08BF01| LDA.b #$02
|08BF03| STA.b $08

|08BF05| LDY.b #$00

.next_object
|08BF07| LDX.b $0A

|08BF09| LDA.w Hookshot.char,X
|08BF0C| CMP.b #$FF
|08BF0E| BEQ .skip

|08BF10| JSR Ancilla_SetOAM_XY

|08BF13| LDX.b $0A

|08BF15| LDA.w Hookshot.char,X
|08BF18| STA.b ($90),Y

|08BF1A| INY

|08BF1B| LDA.w Hookshot.prop,X
|08BF1E| ORA.b #$02
|08BF20| ORA.b $65
|08BF22| STA.b ($90),Y

|08BF24| INY
|08BF25| PHY

|08BF26| TYA
|08BF27| SEC
|08BF28| SBC.b #$04
|08BF2A| LSR A
|08BF2B| LSR A
|08BF2C| TAY

|08BF2D| LDA.b #$00
|08BF2F| STA.b ($92),Y

|08BF31| PLY

.skip
|08BF32| INC.b $0A

|08BF34| LDA.b $02
|08BF36| CLC
|08BF37| ADC.b #$08
|08BF39| STA.b $02

|08BF3B| DEC.b $08
|08BF3D| BMI AncillaDraw_HookshotChain

;---------------------------------------------------------------------------------------------------

|08BF3F| LDA.b $08
|08BF41| BNE .next_object

|08BF43| LDA.b $00
|08BF45| CLC
|08BF46| ADC.b #$08
|08BF48| STA.b $00

|08BF4A| LDA.b $06
|08BF4C| STA.b $02

|08BF4E| BRA .next_object

;===================================================================================================

AncillaDraw_HookshotChain:
|08BF50| PLX
|08BF51| PHX

|08BF52| STZ.b $0A
|08BF54| STZ.b $0B
|08BF56| STZ.b $0C
|08BF58| STZ.b $0D

|08BF5A| LDA.w $0C5E,X
|08BF5D| LSR A
|08BF5E| CMP.b #$07
|08BF60| BCC .no_scaling

|08BF62| SEC
|08BF63| SBC.b #$07
|08BF65| STA.b $0A
|08BF67| STA.b $0C

|08BF69| LDA.b #$06

.no_scaling
|08BF6B| STA.b $08
|08BF6D| BNE .at_least_one_link

|08BF6F| BRL .exit

;---------------------------------------------------------------------------------------------------

.at_least_one_link
|08BF72| LDA.w $0C72,X
|08BF75| AND.b #$01
|08BF77| BEQ .up_or_left

|08BF79| LDA.b $0A
|08BF7B| EOR.b #$FF
|08BF7D| INC A
|08BF7E| STA.b $0A
|08BF80| STA.b $0C
|08BF82| BEQ .up_or_left

|08BF84| LDA.b #$FF
|08BF86| STA.b $0B
|08BF88| STA.b $0D

.up_or_left
|08BF8A| REP #$20

|08BF8C| LDA.w $0C72,X
|08BF8F| ASL A
|08BF90| AND.w #$00FF
|08BF93| TAX

;---------------------------------------------------------------------------------------------------

|08BF94| LDA.w Hookshot.box_size_y,X
|08BF97| BNE .use_actual_y

|08BF99| LDA.b $04
|08BF9B| CLC
|08BF9C| ADC.w #$0004
|08BF9F| STA.b $04

;---------------------------------------------------------------------------------------------------

.use_actual_y
|08BFA1| LDA.w Hookshot.box_size_x,X
|08BFA4| BNE .next_object

|08BFA6| LDA.b $06
|08BFA8| CLC
|08BFA9| ADC.w #$0004
|08BFAC| STA.b $06

|08BFAE| SEP #$20

;---------------------------------------------------------------------------------------------------

.next_object
|08BFB0| REP #$20

|08BFB2| LDA.w Hookshot.box_size_y,X
|08BFB5| BEQ .dont_add_y

|08BFB7| CLC
|08BFB8| ADC.b $0A

.dont_add_y
|08BFBA| CLC
|08BFBB| ADC.b $04
|08BFBD| STA.b $04
|08BFBF| STA.b $00

|08BFC1| LDA.w Hookshot.box_size_x,X
|08BFC4| BEQ .dont_add_x

|08BFC6| CLC
|08BFC7| ADC.b $0C

.dont_add_x
|08BFC9| CLC
|08BFCA| ADC.b $06
|08BFCC| STA.b $06
|08BFCE| STA.b $02

;---------------------------------------------------------------------------------------------------

|08BFD0| SEP #$20

|08BFD2| JSR Hookshot_CheckProximityToLink
|08BFD5| BCS .skip

|08BFD7| JSR Ancilla_SetOAM_XY

|08BFDA| LDA.b #$19
|08BFDC| STA.b ($90),Y

|08BFDE| INY

|08BFDF| LDA.b $1A
|08BFE1| AND.b #$02

|08BFE3| ASL A
|08BFE4| ASL A
|08BFE5| ASL A
|08BFE6| ASL A
|08BFE7| ASL A
|08BFE8| ASL A

|08BFE9| ORA.b #$02
|08BFEB| ORA.b $65
|08BFED| STA.b ($90),Y

|08BFEF| INY
|08BFF0| PHY

|08BFF1| TYA
|08BFF2| SEC
|08BFF3| SBC.b #$04
|08BFF5| LSR A
|08BFF6| LSR A
|08BFF7| TAY

|08BFF8| LDA.b #$00
|08BFFA| STA.b ($92),Y

|08BFFC| PLY

.skip
|08BFFD| DEC.b $08
|08BFFF| BPL .next_object

;---------------------------------------------------------------------------------------------------

.exit
|08C001| PLX

|08C002| RTS

;===================================================================================================

pool Ancilla20_Blanket

.char
|08C003| db $0A, $0A, $0A, $0A
|08C007| db $0C, $0C, $0A, $0A

.prop
|08C00B| db $00, $60, $A0, $E0
|08C00F| db $00, $60, $A0, $E0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla20_Blanket:
|08C013| JSR Ancilla_PrepOAMCoord

|08C016| REP #$20

|08C018| LDA.b $00
|08C01A| STA.b $04

|08C01C| LDA.b $02
|08C01E| STA.b $06
|08C020| STA.b $08

|08C022| SEP #$20

|08C024| PHX

|08C025| LDA.w $037D
|08C028| BNE .im_awake

|08C02A| LDA.b #$10
|08C02C| JSL AllocateOAMInRegionB

|08C030| BRA .continue

.im_awake
|08C032| LDA.b #$10
|08C034| JSL AllocateOAMInRegionA

;---------------------------------------------------------------------------------------------------

.continue
|08C038| LDA.w $037D
|08C03B| BEQ .i_sleep

|08C03D| LDA.b #$04

.i_sleep
|08C03F| TAX

|08C040| LDA.b #$03
|08C042| STA.b $0A

|08C044| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
|08C046| JSR Ancilla_SetOAM_XY

|08C049| LDA.w .char,X
|08C04C| STA.b ($90),Y

|08C04E| INY

|08C04F| LDA.w .prop,X
|08C052| ORA.b #$0D
|08C054| ORA.b $65
|08C056| STA.b ($90),Y

|08C058| INY
|08C059| PHY

|08C05A| TYA
|08C05B| SEC
|08C05C| SBC.b #$04
|08C05E| LSR A
|08C05F| LSR A
|08C060| TAY

|08C061| LDA.b #$02
|08C063| STA.b ($92),Y

|08C065| PLY

|08C066| INX

|08C067| REP #$20

|08C069| LDA.b $06
|08C06B| CLC
|08C06C| ADC.w #$0010
|08C06F| STA.b $02

|08C071| SEP #$20

|08C073| DEC.b $0A
|08C075| BMI .exit

|08C077| LDA.b $0A
|08C079| CMP.b #$01
|08C07B| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08C07D| REP #$20

|08C07F| LDA.b $06
|08C081| STA.b $02

|08C083| LDA.b $04
|08C085| CLC
|08C086| ADC.w #$0008
|08C089| STA.b $00

|08C08B| SEP #$20

|08C08D| BRA .next_object

;---------------------------------------------------------------------------------------------------

.exit
|08C08F| PLX

|08C090| RTS

;===================================================================================================

pool Ancilla21_Snore

.char
|08C091| db $44, $43, $42

endpool

;---------------------------------------------------------------------------------------------------

Ancilla21_Snore:
|08C094| DEC.w $03B1,X
|08C097| BPL .delay

|08C099| LDA.w $0C5E,X
|08C09C| INC A
|08C09D| CMP.b #$03
|08C09F| BEQ .fully_zeed

|08C0A1| STA.w $0C5E,X

.fully_zeed
|08C0A4| LDA.b #$07
|08C0A6| STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.delay
|08C0A9| LDA.w $0C2C,X
|08C0AC| CLC
|08C0AD| ADC.w $0C54,X
|08C0B0| STA.w $0C2C,X
|08C0B3| BPL .positive_x

|08C0B5| EOR.b #$FF
|08C0B7| INC A

.positive_x
|08C0B8| CMP.b #$08
|08C0BA| BCC .dont_invert

|08C0BC| LDA.w $0C54,X
|08C0BF| EOR.b #$FF
|08C0C1| INC A
|08C0C2| STA.w $0C54,X

.dont_invert
|08C0C5| JSR AncillaMoveY
|08C0C8| JSR AncillaMoveX

|08C0CB| LDA.w $0BFA,X
|08C0CE| STA.b $00

|08C0D0| LDA.w $0C0E,X
|08C0D3| STA.b $01

;---------------------------------------------------------------------------------------------------

|08C0D5| REP #$20

|08C0D7| LDA.b $20
|08C0D9| SEC
|08C0DA| SBC.w #$0018
|08C0DD| CMP.b $00
|08C0DF| BCC .dont_delete_me

|08C0E1| SEP #$20

|08C0E3| STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

.dont_delete_me
|08C0E6| SEP #$20

|08C0E8| LDY.w $0C5E,X

|08C0EB| LDA.w .char,Y
|08C0EE| STA.w $0109

|08C0F1| JSR Ancilla_PrepOAMCoord

|08C0F4| LDY.b #$00
|08C0F6| JSR Ancilla_SetOAM_XY

|08C0F9| LDA.b #$09
|08C0FB| STA.b ($90),Y

|08C0FD| INY

|08C0FE| LDA.b #$24
|08C100| STA.b ($90),Y

|08C102| LDA.b #$00
|08C104| STA.b ($92)

|08C106| RTS

;===================================================================================================

pool Ancilla3B_SwordUpSparkle

.offset_y
|08C107| dw  -7,   0,   0,   0
|08C10F| dw -11, -11,  -3,  -3
|08C117| dw  -7,  -7,   0,   0
|08C11F| dw  -7,   0,   0,   0

.offset_x
|08C127| dw  16,   0,   0,   0
|08C12F| dw   8,  16,   8,  16
|08C137| dw   9,  15,   0,   0
|08C13F| dw  12,   0,   0,   0

.char
|08C147| db $92, $FF, $FF, $FF
|08C14B| db $93, $93, $93, $93
|08C14F| db $F9, $F9, $FF, $FF
|08C153| db $80, $FF, $FF, $FF

.prop
|08C157| db $00, $FF, $FF, $FF
|08C15B| db $00, $40, $80, $C0
|08C15F| db $00, $40, $FF, $FF
|08C163| db $00, $FF, $FF, $FF

endpool

;---------------------------------------------------------------------------------------------------

Ancilla3B_SwordUpSparkle:
|08C167| LDA.w $03B1,X
|08C16A| BNE .delay

|08C16C| DEC.w $039F,X
|08C16F| BPL .active

|08C171| LDA.b #$01
|08C173| STA.w $039F,X

|08C176| INC.w $0C5E,X

|08C179| LDA.w $0C5E,X
|08C17C| CMP.b #$04
|08C17E| BNE .active

|08C180| STZ.w $0C4A,X

.delay
|08C183| DEC.w $03B1,X

|08C186| RTS

;---------------------------------------------------------------------------------------------------

.active
|08C187| PHX

|08C188| JSR Ancilla_PrepOAMCoord

|08C18B| LDA.b #$03
|08C18D| STA.b $06

|08C18F| LDA.w $0C5E,X
|08C192| ASL A
|08C193| ASL A
|08C194| TAX

;---------------------------------------------------------------------------------------------------

|08C195| LDY.b #$00

.next_object
|08C197| LDA.w .char,X
|08C19A| CMP.b #$FF
|08C19C| BEQ .skip

|08C19E| REP #$20

|08C1A0| PHX

|08C1A1| TXA
|08C1A2| ASL A
|08C1A3| TAX

|08C1A4| LDA.b $20
|08C1A6| CLC
|08C1A7| ADC.w .offset_y,X
|08C1AA| SEC
|08C1AB| SBC.b $E8
|08C1AD| STA.b $00

|08C1AF| LDA.b $22
|08C1B1| CLC
|08C1B2| ADC.w .offset_x,X
|08C1B5| SEC
|08C1B6| SBC.b $E2
|08C1B8| STA.b $02

|08C1BA| PLX

;---------------------------------------------------------------------------------------------------

|08C1BB| SEP #$20

|08C1BD| JSR Ancilla_SetOAM_XY

|08C1C0| LDA.w .char,X
|08C1C3| STA.b ($90),Y

|08C1C5| INY

|08C1C6| LDA.w .prop,X
|08C1C9| ORA.b #$04
|08C1CB| ORA.b $65
|08C1CD| STA.b ($90),Y

|08C1CF| INY
|08C1D0| PHY

|08C1D1| TYA
|08C1D2| SEC
|08C1D3| SBC.b #$04
|08C1D5| LSR A
|08C1D6| LSR A
|08C1D7| TAY

|08C1D8| LDA.b #$00
|08C1DA| STA.b ($92),Y

|08C1DC| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08C1DD| INX

|08C1DE| DEC.b $06
|08C1E0| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08C1E2| PLX

|08C1E3| RTS

;===================================================================================================

pool Ancilla3C_SpinAttackChargeSparkle

.char
|08C1E4| db $B7, $80, $83

.prop
|08C1E7| db $04, $04, $84

endpool

;---------------------------------------------------------------------------------------------------

Ancilla3C_SpinAttackChargeSparkle:
|08C1EA| LDA.b $11
|08C1EC| BNE .continue

|08C1EE| LDA.w $0C68,X
|08C1F1| BNE .continue

|08C1F3| LDA.b #$04
|08C1F5| STA.w $0C68,X

|08C1F8| INC.w $0C5E,X

|08C1FB| LDA.w $0C5E,X
|08C1FE| CMP.b #$03
|08C200| BNE .continue

|08C202| STZ.w $0C4A,X

|08C205| RTS

;---------------------------------------------------------------------------------------------------

.continue
|08C206| PHX

|08C207| LDA.b #$04
|08C209| JSR AllocateOAMInRegionsADF

|08C20C| TYA
|08C20D| STA.w $0C86,X

|08C210| JSR Ancilla_PrepOAMCoord

|08C213| LDA.w $0C5E,X
|08C216| TAX

|08C217| LDY.b #$00
|08C219| JSR Ancilla_SetOAM_XY

|08C21C| LDA.w .char,X

|08C21F| STA.b ($90),Y

|08C221| INY

|08C222| LDA.w .prop,X
|08C225| ORA.b $65
|08C227| STA.b ($90),Y

|08C229| LDA.b #$00
|08C22B| STA.b ($92)

|08C22D| PLX

|08C22E| RTS

;===================================================================================================

pool Ancilla35_MasterSwordCutscene

.offset_y
|08C22F| dw   1,   1,   9,   9
|08C237| dw   1,   1,   9,   9

.offset_x
|08C23F| dw  -1,   8,  -1,   8
|08C247| dw   0,   7,   0,   7

.char
|08C24F| db $86, $86, $96, $96
|08C253| db $87, $87, $97, $97

.prop
|08C257| db $01, $41, $01, $41
|08C25B| db $01, $41, $01, $41

endpool

;---------------------------------------------------------------------------------------------------

Ancilla35_MasterSwordCutscene:
|08C25F| LDA.w $0C68,X
|08C262| BNE .stay_around

|08C264| STZ.w $0C4A,X

|08C267| RTS

.stay_around
|08C268| DEC.w $03B1,X
|08C26B| BPL .delay

|08C26D| LDA.w $0C5E,X
|08C270| INC A
|08C271| CMP.b #$03
|08C273| BNE .no_wrap

|08C275| LDA.b #$00

.no_wrap
|08C277| STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.delay
|08C27A| JSR Ancilla_PrepOAMCoord

|08C27D| REP #$20

|08C27F| LDA.b $00
|08C281| STA.b $04

|08C283| LDA.b $02
|08C285| STA.b $06

|08C287| SEP #$20

|08C289| PHX

|08C28A| STZ.b $08

|08C28C| LDA.w $0C5E,X
|08C28F| BEQ .no_draw

|08C291| DEC A
|08C292| ASL A
|08C293| ASL A
|08C294| TAX

;---------------------------------------------------------------------------------------------------

|08C295| LDY.b #$00

.next_object
|08C297| PHX

|08C298| TXA
|08C299| ASL A
|08C29A| TAX

|08C29B| REP #$20

|08C29D| LDA.b $04
|08C29F| CLC
|08C2A0| ADC.w .offset_y,X
|08C2A3| STA.b $00

|08C2A5| LDA.b $06
|08C2A7| CLC
|08C2A8| ADC.w .offset_x,X
|08C2AB| STA.b $02

|08C2AD| SEP #$20

|08C2AF| PLX

|08C2B0| JSR Ancilla_SetOAM_XY

|08C2B3| LDA.w .char,X
|08C2B6| STA.b ($90),Y

|08C2B8| INY

|08C2B9| LDA.w .prop,X
|08C2BC| AND.b #$CF
|08C2BE| ORA.b #$04
|08C2C0| ORA.b $65
|08C2C2| STA.b ($90),Y

|08C2C4| INY
|08C2C5| PHY

|08C2C6| TYA
|08C2C7| SEC
|08C2C8| SBC.b #$04
|08C2CA| LSR A
|08C2CB| LSR A
|08C2CC| TAY

|08C2CD| LDA.b #$00
|08C2CF| STA.b ($92),Y

|08C2D1| PLY

|08C2D2| INX

|08C2D3| INC.b $08

|08C2D5| LDA.b $08
|08C2D7| CMP.b #$04
|08C2D9| BNE .next_object

;---------------------------------------------------------------------------------------------------

.no_draw
|08C2DB| PLX

|08C2DC| RTS

;===================================================================================================

pool Ancilla22_ItemReceipt ItemReceipt

.message
|08C2DD| dw $FFFF ; FIGHTER SWORD
|08C2DF| dw $0070 ; MASTER SWORD              - MESSAGE 0070
|08C2E1| dw $0077 ; TEMPERED SWORD            - MESSAGE 0077
|08C2E3| dw $0052 ; BUTTER SWORD              - MESSAGE 0052 - WRONG MESSAGE
|08C2E5| dw $FFFF ; FIGHTER SHIELD
|08C2E7| dw $0078 ; FIRE SHIELD               - MESSAGE 0078 - WRONG MESSAGE
|08C2E9| dw $0078 ; MIRROR SHIELD             - MESSAGE 0078
|08C2EB| dw $0062 ; FIRE ROD                  - MESSAGE 0062
|08C2ED| dw $0061 ; ICE ROD                   - MESSAGE 0061
|08C2EF| dw $0066 ; HAMMER                    - MESSAGE 0066
|08C2F1| dw $0069 ; HOOKSHOT                  - MESSAGE 0069
|08C2F3| dw $0053 ; BOW                       - MESSAGE 0053
|08C2F5| dw $0052 ; BOOMERANG                 - MESSAGE 0052
|08C2F7| dw $0056 ; POWDER                    - MESSAGE 0056
|08C2F9| dw $FFFF ; BOTTLE REFILL (BEE)
|08C2FB| dw $0064 ; BOMBOS                    - MESSAGE 0064
|08C2FD| dw $0063 ; ETHER                     - MESSAGE 0063
|08C2FF| dw $0065 ; QUAKE                     - MESSAGE 0065
|08C301| dw $0051 ; LAMP                      - MESSAGE 0051
|08C303| dw $0054 ; SHOVEL                    - MESSAGE 0054
|08C305| dw $0067 ; FLUTE                     - MESSAGE 0067
|08C307| dw $0068 ; SOMARIA                   - MESSAGE 0068
|08C309| dw $006B ; BOTTLE                    - MESSAGE 006B
|08C30B| dw $0077 ; HEART PIECE               - MESSAGE 0077 - WRONG MESSAGE
|08C30D| dw $0079 ; BYRNA                     - MESSAGE 0079
|08C30F| dw $0055 ; CAPE                      - MESSAGE 0055
|08C311| dw $006E ; MIRROR                    - MESSAGE 006E
|08C313| dw $0058 ; GLOVE                     - MESSAGE 0058
|08C315| dw $006D ; MITTS                     - MESSAGE 006D
|08C317| dw $005D ; BOOK                      - MESSAGE 005D
|08C319| dw $0057 ; FLIPPERS                  - MESSAGE 0057
|08C31B| dw $005E ; PEARL                     - MESSAGE 005E
|08C31D| dw $FFFF ; CRYSTAL
|08C31F| dw $0074 ; NET                       - MESSAGE 0074
|08C321| dw $0075 ; BLUE MAIL                 - MESSAGE 0075
|08C323| dw $0076 ; RED MAIL                  - MESSAGE 0076
|08C325| dw $FFFF ; SMALL KEY
|08C327| dw $005F ; COMPASS                   - MESSAGE 005F
|08C329| dw $0158 ; HEART CONTAINER FROM 4/4  - MESSAGE 0158
|08C32B| dw $FFFF ; BOMB
|08C32D| dw $006A ; 3 BOMBS                   - MESSAGE 006A
|08C32F| dw $005C ; MUSHROOM                  - MESSAGE 005C
|08C331| dw $008F ; RED BOOMERANG             - MESSAGE 008F
|08C333| dw $0071 ; FULL BOTTLE (RED)         - MESSAGE 0071
|08C335| dw $0072 ; FULL BOTTLE (GREEN)       - MESSAGE 0072
|08C337| dw $0073 ; FULL BOTTLE (BLUE)        - MESSAGE 0073
|08C339| dw $0071 ; POTION REFILL (RED)       - MESSAGE 0071
|08C33B| dw $0072 ; POTION REFILL (GREEN)     - MESSAGE 0072
|08C33D| dw $0073 ; POTION REFILL (BLUE)      - MESSAGE 0073
|08C33F| dw $006A ; 10 BOMBS                  - MESSAGE 006A
|08C341| dw $006C ; BIG KEY                   - MESSAGE 006C
|08C343| dw $0060 ; MAP                       - MESSAGE 0060
|08C345| dw $FFFF ; 1 RUPEE
|08C347| dw $FFFF ; 5 RUPEES
|08C349| dw $FFFF ; 20 RUPEES
|08C34B| dw $0059 ; GREEN PENDANT             - MESSAGE 0059
|08C34D| dw $0084 ; BLUE PENDANT              - MESSAGE 0084
|08C34F| dw $005A ; RED PENDANT               - MESSAGE 005A
|08C351| dw $FFFF ; TOSSED BOW
|08C353| dw $FFFF ; SILVERS
|08C355| dw $FFFF ; FULL BOTTLE (BEE)
|08C357| dw $FFFF ; FULL BOTTLE (FAIRY)
|08C359| dw $FFFF ; BOSS HC
|08C35B| dw $0159 ; SANC HC                   - MESSAGE 0159
|08C35D| dw $FFFF ; 100 RUPEES
|08C35F| dw $FFFF ; 50 RUPEES
|08C361| dw $FFFF ; HEART
|08C363| dw $FFFF ; ARROW
|08C365| dw $FFFF ; 10 ARROWS
|08C367| dw $FFFF ; SMALL MAGIC
|08C369| dw $FFFF ; 300 RUPEES
|08C36B| dw $FFFF ; 20 RUPEES GREEN
|08C36D| dw $FFFF ; FULL BOTTLE (GOOD BEE)
|08C36F| dw $00DB ; TOSSED FIGHTER SWORD      - MESSAGE 00DB
|08C371| dw $0067 ; FLUTE (ACTIVATED)         - MESSAGE 0067
|08C373| dw $007C ; BOOTS                     - MESSAGE 007C

;---------------------------------------------------------------------------------------------------

.animated_rupee_tiles
|08C375| db $24, $25, $26

.animated_rupee_timers
|08C378| db $09, $05, $05

.default_oam_props
|08C37B| db $05, $01, $04

.heart_piece_message
|08C37E| dw $FFFF
|08C380| dw $0155 ; MESSAGE 0155
|08C382| dw $0156 ; MESSAGE 0156
|08C384| dw $0157 ; MESSAGE 0157

.pendant_message
|08C386| dw $005B ; MESSAGE 005B
|08C388| dw $0083 ; MESSAGE 0083

endpool

;---------------------------------------------------------------------------------------------------

Ancilla22_ItemReceipt:
|08C38A| LDA.w $02E4
|08C38D| CMP.b #$02
|08C38F| BEQ .just_draw_a

|08C391| LDA.b $11
|08C393| BEQ .operable_submode

|08C395| CMP.b #$2B
|08C397| BEQ .operable_submode

|08C399| CMP.b #$09
|08C39B| BEQ .operable_submode

|08C39D| CMP.b #$02
|08C39F| BNE .just_draw_a

|08C3A1| LDA.b #$10
|08C3A3| STA.w $0C68,X

.just_draw_a
|08C3A6| BRL ItemReceipt_Animate

;---------------------------------------------------------------------------------------------------

.operable_submode
|08C3A9| INC.w $0FC1

|08C3AC| LDA.w $0C54,X
|08C3AF| BEQ .from_text_or_object

|08C3B1| CMP.b #$03
|08C3B3| BEQ .from_text_or_object

|08C3B5| BRL .from_chest_or_sprite

;---------------------------------------------------------------------------------------------------

.from_text_or_object
|08C3B8| LDA.w $0C5E,X
|08C3BB| CMP.b #$01 ; ITEMGET 01
|08C3BD| BNE .not_ms_pull

|08C3BF| LDA.w $0C54,X
|08C3C2| CMP.b #$02
|08C3C4| BEQ .not_ms_pull

|08C3C6| LDA.w $0C68,X
|08C3C9| BEQ .delay_a

|08C3CB| CMP.b #$11
|08C3CD| BNE .just_draw_b

|08C3CF| REP #$20

|08C3D1| LDA.w #$0DF3
|08C3D4| STA.w $02CD

|08C3D7| SEP #$20

|08C3D9| LDA.b #$0E ; FOLLOWER 0E
|08C3DB| STA.l $7EF3CC

.time_up_a
|08C3DF| BRL .time_up_b

;---------------------------------------------------------------------------------------------------

.not_ms_pull
|08C3E2| DEC.w $03B1,X

|08C3E5| LDA.w $03B1,X
|08C3E8| BEQ .delay_a

|08C3EA| CMP.b #$01
|08C3EC| BNE .just_draw_b

|08C3EE| LDA.w $0C5E,X
|08C3F1| CMP.b #$37 ; ITEMGET 37
|08C3F3| BEQ .is_pendant

|08C3F5| CMP.b #$38 ; ITEMGET 38
|08C3F7| BEQ .is_pendant

|08C3F9| CMP.b #$39 ; ITEMGET 39
|08C3FB| BNE .dont_wait_for_music

.is_pendant
|08C3FD| LDA.w APUIO0
|08C400| BEQ .dont_wait_for_music

|08C402| INC.w $03B1,X
|08C405| BRA .just_draw_b

.dont_wait_for_music
|08C407| BRL .time_up_a

;---------------------------------------------------------------------------------------------------

.just_draw_b
|08C40A| BRL ItemReceipt_Animate

;---------------------------------------------------------------------------------------------------

.delay_a
|08C40D| LDA.w $0C5E,X
|08C410| CMP.b #$01 ; ITEMGET 01
|08C412| BNE .not_ms_from_text

|08C414| LDA.w $0C54,X
|08C417| BNE .not_ms_from_text

|08C419| LDA.b #$05 ; SFX1.05
|08C41B| STA.w $012D

|08C41E| LDA.b #$02 ; SONG 02
|08C420| STA.w $012C

.not_ms_from_text
|08C423| LDY.b #$00 ; LINKSTATE 00

|08C425| LDA.w $0345
|08C428| BEQ .not_in_water

|08C42A| LDY.b #$04 ; LINKSTATE 04

.not_in_water
|08C42C| STY.b $5D

|08C42E| STZ.w $02D8
|08C431| STZ.w $02DA
|08C434| STZ.w $037B

|08C437| JSL Ancilla_AddRupees

;---------------------------------------------------------------------------------------------------

.check_if_hp
|08C43B| STZ.w $02E9

|08C43E| LDA.w $0C5E,X
|08C441| CMP.b #$17 ; ITEMGET 17
|08C443| BNE .not_heart_piece

|08C445| LDA.l $7EF36B
|08C449| BNE .not_heart_piece

|08C44B| PHX

|08C44C| LDY.b #$26 ; ITEMGET 26
|08C44E| JSL GrantItemReceipt

|08C452| PLX

|08C453| STZ.w $0C4A,X

|08C456| STZ.w $0FC1

|08C459| RTS

.not_heart_piece
|08C45A| CMP.b #$26 ; ITEMGET 26
|08C45C| BEQ .refill_hp

|08C45E| CMP.b #$3F ; ITEMGET 3F
|08C460| BEQ .refill_hp

|08C462| CMP.b #$3E ; ITEMGET 3E
|08C464| BNE .not_heart

|08C466| STZ.w $02E4

|08C469| LDA.l $7EF36C
|08C46D| CMP.b #$A0
|08C46F| BEQ .not_heart

|08C471| CLC
|08C472| ADC.b #$08
|08C474| STA.l $7EF36C

|08C478| LDA.l $7EF372
|08C47C| CLC
|08C47D| ADC.b #$08
|08C47F| STA.l $7EF372

|08C483| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.refill_hp
|08C485| LDA.l $7EF36D
|08C489| STA.b $00

|08C48B| LDA.l $7EF36C
|08C48F| CMP.b #$A0
|08C491| BEQ .not_heart

|08C493| CLC
|08C494| ADC.b #$08
|08C496| STA.l $7EF36C

|08C49A| SEC
|08C49B| SBC.b $00
|08C49D| STA.b $00

|08C49F| LDA.l $7EF372
|08C4A3| CLC
|08C4A4| ADC.b $00
|08C4A6| STA.l $7EF372

.continue_a
|08C4AA| LDA.b #$0D ; SFX3.0D
|08C4AC| JSR Ancilla_SFX3_Near

|08C4AF| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_heart
|08C4B1| CMP.b #$42 ; ITEMGET 42
|08C4B3| BNE .not_single_heart

|08C4B5| LDA.l $7EF372
|08C4B9| CLC
|08C4BA| ADC.b #$08
|08C4BC| STA.l $7EF372

|08C4C0| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_single_heart
|08C4C2| CMP.b #$45 ; ITEMGET 45
|08C4C4| BNE .not_small_magic

|08C4C6| LDA.l $7EF373
|08C4CA| CLC
|08C4CB| ADC.b #$10
|08C4CD| STA.l $7EF373

|08C4D1| BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_small_magic
|08C4D3| CMP.b #$22 ; ITEMGET 22
|08C4D5| BEQ .blue_mail

|08C4D7| CMP.b #$23 ; ITEMGET 23
|08C4D9| BNE .continue_b

.blue_mail
|08C4DB| PHX

|08C4DC| JSL PaletteLoad_LinkArmorAndGloves

|08C4E0| PLX

;---------------------------------------------------------------------------------------------------

.continue_b
|08C4E1| STZ.w $0C4A,X

|08C4E4| STZ.w $0FC1

|08C4E7| LDA.w $0C54,X
|08C4EA| CMP.b #$03
|08C4EC| BNE .no_victory_sequence

|08C4EE| LDY.w $0C5E,X

|08C4F1| CPY.w MilestoneItemReceiptIDs.ether
|08C4F4| BEQ .no_victory_sequence

|08C4F6| CPY.w MilestoneItemReceiptIDs.bombos
|08C4F9| BEQ .no_victory_sequence

|08C4FB| CPY.w MilestoneItemReceiptIDs.heart_container
|08C4FE| BEQ .no_victory_sequence

|08C500| CPY.w MilestoneItemReceiptIDs.crystal
|08C503| BEQ .no_victory_sequence

|08C505| PHA
|08C506| PHX

|08C507| JSL PrepareDungeonExitFromBossFight

|08C50B| PLX
|08C50C| PLA

.no_victory_sequence
|08C50D| CMP.b #$02 ; ITEMGET 02
|08C50F| BEQ .exit

|08C511| STZ.w $02E4

.exit
|08C514| RTS

;---------------------------------------------------------------------------------------------------

.from_chest_or_sprite
|08C515| DEC.w $03B1,X

|08C518| LDA.w $03B1,X
|08C51B| BPL .delay_b

|08C51D| BRL .check_if_hp

.delay_b
|08C520| CMP.b #$00
|08C522| BEQ .time_up_b

|08C524| CMP.b #$28
|08C526| BNE .dont_give

|08C528| LDA.w $0C54,X
|08C52B| CMP.b #$02
|08C52D| BEQ .dont_give

|08C52F| JSL Ancilla_AddRupees
|08C533| BCS .play_rupee_sfx

|08C535| LDA.w $0C5E,X
|08C538| CMP.b #$17
|08C53A| BNE .play_rupee_sfx

.dont_give
|08C53C| BRL .skip_messaging

.play_rupee_sfx
|08C53F| LDA.b #$0F ; SFX3.0F
|08C541| JSR Ancilla_SFX3_Near

|08C544| BRA .dont_give

;---------------------------------------------------------------------------------------------------

.time_up_b
|08C546| LDA.b $1B
|08C548| BEQ .not_a_shop

|08C54A| REP #$20

|08C54C| LDA.b $A0
|08C54E| CMP.w #$00FF ; ROOM 00FF
|08C551| BEQ .is_a_shop

|08C553| CMP.w #$010F ; ROOM 010F
|08C556| BEQ .is_a_shop

|08C558| CMP.w #$0110 ; ROOM 0110
|08C55B| BEQ .is_a_shop

|08C55D| CMP.w #$0112 ; ROOM 0112
|08C560| BEQ .is_a_shop

|08C562| CMP.w #$011F ; ROOM 011F
|08C565| BNE .not_a_shop

.is_a_shop
|08C567| SEP #$20

|08C569| BRA .skip_messaging

;---------------------------------------------------------------------------------------------------

.not_a_shop
|08C56B| SEP #$20

|08C56D| LDA.w $0C5E,X
|08C570| CMP.b #$38 ; ITEMGET 38
|08C572| BEQ .use_pendant_message

|08C574| CMP.b #$39 ; ITEMGET 39
|08C576| BNE .not_possibly_a_pendant

.use_pendant_message
|08C578| TAY

|08C579| LDA.l $7EF374
|08C57D| AND.b #$07
|08C57F| CMP.b #$07
|08C581| BNE .fetch_message_id

|08C583| TYA
|08C584| SEC
|08C585| SBC.b #$38
|08C587| ASL A
|08C588| TAY

|08C589| REP #$20

|08C58B| LDA.w .pendant_message,Y
|08C58E| STA.w $1CF0

|08C591| SEP #$20

|08C593| BRA .trigger_message

;---------------------------------------------------------------------------------------------------

.not_possibly_a_pendant
|08C595| LDA.w $0C54,X
|08C598| CMP.b #$02
|08C59A| BEQ ItemReceipt_Animate

|08C59C| LDA.w $0C5E,X
|08C59F| CMP.b #$17 ; ITEMGET 17
|08C5A1| BNE .fetch_message_id

|08C5A3| LDA.l $7EF36B
|08C5A7| ASL A
|08C5A8| TAY

|08C5A9| REP #$20

|08C5AB| LDA.w .heart_piece_message,Y
|08C5AE| CMP.w #$FFFF
|08C5B1| BEQ ItemReceipt_Animate

|08C5B3| STA.w $1CF0

|08C5B6| SEP #$20

|08C5B8| BRA .trigger_message

;---------------------------------------------------------------------------------------------------

.fetch_message_id
|08C5BA| LDA.w $0C5E,X
|08C5BD| ASL A
|08C5BE| TAY

|08C5BF| REP #$20

|08C5C1| LDA.w .message,Y
|08C5C4| CMP.w #$FFFF
|08C5C7| BEQ ItemReceipt_Animate

|08C5C9| STA.w $1CF0

|08C5CC| CMP.w #$0070 ; MESSAGE 0070
|08C5CF| BNE .no_sfx_just_text

|08C5D1| SEP #$20

|08C5D3| LDA.b #$09 ; SFX1.09
|08C5D5| STA.w $012D

.no_sfx_just_text
|08C5D8| SEP #$20

;---------------------------------------------------------------------------------------------------

.trigger_message
|08C5DA| JSL PrepAndDisplayMessage
|08C5DE| BRA ItemReceipt_Animate

.skip_messaging
|08C5E0| LDA.w $03B1,X
|08C5E3| CMP.b #$18
|08C5E5| BCC ItemReceipt_Animate

|08C5E7| LDA.w $0C22,X
|08C5EA| CLC
|08C5EB| ADC.b #$FF
|08C5ED| CMP.b #$F8
|08C5EF| BCC .halt_acceleration

|08C5F1| STA.w $0C22,X

.halt_acceleration
|08C5F4| JSR AncillaMoveY

;===================================================================================================

ItemReceipt_Animate:
|08C5F7| SEP #$20

|08C5F9| LDA.w $0C5E,X
|08C5FC| CMP.b #$20
|08C5FE| BNE .continue

|08C600| STZ.w $029E,X

|08C603| JSR AncillaAdd_OccasionalSparkle

|08C606| LDA.w APUIO0
|08C609| BNE .continue

|08C60B| LDA.b #$1A ; SONG 1A
|08C60D| STA.w $012C

|08C610| BRL ItemReceipt_TransmuteToRisingCrystal

;---------------------------------------------------------------------------------------------------

.continue
|08C613| SEP #$20

|08C615| LDA.w $0C5E,X
|08C618| CMP.b #$01 ; ITEMGET 01
|08C61A| BNE .not_a_flashy_sword

|08C61C| LDA.w ItemReceipt.default_oam_props
|08C61F| STA.w $0BF0,X

|08C622| LDA.w $0C54,X
|08C625| CMP.b #$02
|08C627| BEQ .not_a_flashy_sword

|08C629| LDA.w $0C68,X
|08C62C| CMP.b #$10
|08C62E| BCC .wait_for_flashy_sword

|08C630| DEC.w $039F,X
|08C633| BPL .not_a_flashy_sword

|08C635| LDA.b #$02
|08C637| STA.w $039F,X

|08C63A| LDA.w $03A4,X
|08C63D| INC A
|08C63E| CMP.b #$03
|08C640| BNE .no_wrap_flashy_sword

.wait_for_flashy_sword
|08C642| LDA.b #$00

.no_wrap_flashy_sword
|08C644| STA.w $03A4,X

|08C647| TAY

|08C648| LDA.w ItemReceipt.default_oam_props,Y
|08C64B| STA.w $0BF0,X

;---------------------------------------------------------------------------------------------------

.not_a_flashy_sword
|08C64E| LDA.w $0C5E,X
|08C651| CMP.b #$34 ; ITEMGET 34
|08C653| BEQ .animated_rupee

|08C655| CMP.b #$35 ; ITEMGET 35
|08C657| BEQ .animated_rupee

|08C659| CMP.b #$36 ; ITEMGET 36
|08C65B| BNE .not_animating_rupee

.animated_rupee
|08C65D| DEC.w $039F,X
|08C660| BPL .not_animating_rupee

|08C662| INC.w $03A4,X

|08C665| LDA.w $03A4,X
|08C668| CMP.b #$03
|08C66A| BNE .no_wrap_rupee

|08C66C| LDA.b #$00
|08C66E| STA.w $03A4,X

.no_wrap_rupee
|08C671| TAY

|08C672| LDA.w ItemReceipt.animated_rupee_timers,Y
|08C675| STA.w $039F,X

|08C678| PHX

|08C679| LDA.w ItemReceipt.animated_rupee_tiles,Y
|08C67C| JSL WriteTo4BPPBuffer_at_7F4000

|08C680| PLX

;---------------------------------------------------------------------------------------------------

.not_animating_rupee
|08C681| JSR Ancilla_PrepOAMCoord.adjusted

|08C684| REP #$20

|08C686| LDA.b $00
|08C688| CLC
|08C689| ADC.w #$0008
|08C68C| STA.b $08

|08C68E| SEP #$20

;===================================================================================================

AncillaDraw_ItemReceipt:
|08C690| PHX

|08C691| LDA.w $0BF0,X
|08C694| STA.b $74

|08C696| LDA.w $0C5E,X
|08C699| TAX

|08C69A| LDY.b #$00
|08C69C| JSR Ancilla_SetOAM_XY

|08C69F| LDA.b #$24
|08C6A1| STA.b ($90),Y

|08C6A3| INY

|08C6A4| LDA.l AncillaAdd_ItemReceipt.prop,X
|08C6A8| BPL .keep_prop_a

|08C6AA| LDA.b $74

;---------------------------------------------------------------------------------------------------

.keep_prop_a
|08C6AC| ASL A
|08C6AD| ORA.b #$30
|08C6AF| STA.b ($90),Y

|08C6B1| INY
|08C6B2| PHY

|08C6B3| TYA
|08C6B4| SEC
|08C6B5| SBC.b #$04
|08C6B7| LSR A
|08C6B8| LSR A
|08C6B9| TAY

|08C6BA| LDA.l AncillaAdd_ItemReceipt.width,X
|08C6BE| STA.b ($92),Y

|08C6C0| PLY

|08C6C1| CMP.b #$02
|08C6C3| BEQ .big_sprite

;---------------------------------------------------------------------------------------------------

|08C6C5| REP #$20

|08C6C7| LDA.b $08
|08C6C9| STA.b $00

|08C6CB| SEP #$20

|08C6CD| JSR Ancilla_SetOAM_XY

|08C6D0| LDA.b #$34
|08C6D2| STA.b ($90),Y

|08C6D4| INY

|08C6D5| LDA.l AncillaAdd_ItemReceipt.prop,X
|08C6D9| BPL .keep_prop_b

|08C6DB| LDA.b $74

;---------------------------------------------------------------------------------------------------

.keep_prop_b
|08C6DD| ASL A
|08C6DE| ORA.b #$30
|08C6E0| STA.b ($90),Y

|08C6E2| INY
|08C6E3| PHY

|08C6E4| TYA
|08C6E5| SEC
|08C6E6| SBC.b #$04
|08C6E8| LSR A
|08C6E9| LSR A
|08C6EA| TAY

|08C6EB| LDA.b #$00
|08C6ED| STA.b ($92),Y

|08C6EF| PLY

;---------------------------------------------------------------------------------------------------

.big_sprite
|08C6F0| PLX

|08C6F1| RTS

;===================================================================================================

Ancilla28_WishPondItem:
|08C6F2| LDA.b #$10
|08C6F4| JSR AllocateOAMInRegionsADF

|08C6F7| LDA.b $11
|08C6F9| BEQ .continue

|08C6FB| BRL AncillaDraw_WishPondItem

;---------------------------------------------------------------------------------------------------

.continue
|08C6FE| LDA.w $0C68,X
|08C701| BNE AncillaDraw_WishPondItem

|08C703| LDA.b #$02
|08C705| STA.w $0309
|08C708| STZ.w $0308

|08C70B| LDA.w $0294,X
|08C70E| SEC
|08C70F| SBC.b #$02
|08C711| STA.w $0294,X

|08C714| JSR AncillaMoveZ
|08C717| JSR AncillaMoveY
|08C71A| JSR AncillaMoveX

|08C71D| LDA.w $029E,X
|08C720| BPL AncillaDraw_WishPondItem

|08C722| CMP.b #$E4
|08C724| BCS AncillaDraw_WishPondItem

|08C726| LDA.b #$E4
|08C728| STA.w $029E,X

|08C72B| LDY.w $0C5E,X

|08C72E| LDA.w $0BFA,X
|08C731| CLC
|08C732| ADC.b #$12
|08C734| STA.w $0BFA,X

|08C737| LDA.w $0C0E,X
|08C73A| ADC.b #$00
|08C73C| STA.w $0C0E,X

|08C73F| LDA.b #$08
|08C741| STA.b $00

|08C743| LDA.w $088450,Y ; Verified nonsense
|08C746| BNE .absolute_nonsense

|08C748| LDA.b #$04
|08C74A| STA.b $00

.absolute_nonsense
|08C74C| LDA.w $0C04,X
|08C74F| CLC
|08C750| ADC.b $00
|08C752| STA.w $0C04,X

|08C755| LDA.w $0C18,X
|08C758| ADC.b #$00
|08C75A| STA.w $0C18,X

|08C75D| BRL Ancilla_TransmuteToSplash

;---------------------------------------------------------------------------------------------------

AncillaDraw_WishPondItem:
|08C760| JSR Ancilla_PrepOAMCoord.adjusted

|08C763| LDA.w $0C5E,X
|08C766| CMP.b #$01 ; ITEMGET 01
|08C768| BNE .not_master_sword

|08C76A| LDA.w ItemReceipt.default_oam_props
|08C76D| STA.w $0BF0,X

.not_master_sword
|08C770| REP #$20

|08C772| LDA.w $029E,X
|08C775| AND.w #$00FF
|08C778| CMP.w #$0080
|08C77B| BCC .positive

|08C77D| ORA.w #$FF00

.positive
|08C780| STA.b $04

|08C782| EOR.w #$FFFF
|08C785| INC A

|08C786| CLC
|08C787| ADC.b $00
|08C789| STA.b $00
|08C78B| STA.b $06

|08C78D| CLC
|08C78E| ADC.w #$0008
|08C791| STA.b $08

;---------------------------------------------------------------------------------------------------

|08C793| SEP #$20

|08C795| JSR AncillaDraw_ItemReceipt

|08C798| LDA.w $0309
|08C79B| CMP.b #$02
|08C79D| BNE .exit

;---------------------------------------------------------------------------------------------------

|08C79F| LDA.w $0294,X
|08C7A2| BMI .draw_shadow

|08C7A4| CMP.b #$02
|08C7A6| BCS .exit

.draw_shadow
|08C7A8| PHX

|08C7A9| LDA.w $0C5E,X
|08C7AC| TAX

|08C7AD| LDA.w $088450,X  ; Verified nonsense
|08C7B0| TAX

|08C7B1| REP #$20

|08C7B3| LDA.b $06
|08C7B5| CLC
|08C7B6| ADC.b $04

|08C7B8| CLC
|08C7B9| ADC.w #$0028
|08C7BC| STA.b $00

;---------------------------------------------------------------------------------------------------

|08C7BE| CPX.b #$02
|08C7C0| BEQ .wide

|08C7C2| LDA.b $02
|08C7C4| CLC
|08C7C5| ADC.w #$FFFC
|08C7C8| STA.b $02

.wide
|08C7CA| SEP #$20

|08C7CC| LDA.b #$01

|08C7CE| CPX.b #$02
|08C7D0| BEQ .wide_shadow

|08C7D2| LDA.b #$02

.wide_shadow
|08C7D4| TAX

|08C7D5| LDA.b $65
|08C7D7| STA.b $04

|08C7D9| JSR AncillaDraw_Shadow

|08C7DC| PLX

;---------------------------------------------------------------------------------------------------

.exit
|08C7DD| RTS

;===================================================================================================

Ancilla42_HappinessPondRupees:
|08C7DE| LDA.b #$02
|08C7E0| STA.w $0309
|08C7E3| STZ.w $0308

|08C7E6| LDX.b #$09

.next
|08C7E8| LDA.l $7F586C,X
|08C7EC| BEQ .skip

|08C7EE| PHX
|08C7EF| JSR HapinessPondRupees_ExecuteRupee
|08C7F2| PLX

|08C7F3| LDA.l $7F58AA,X
|08C7F7| CMP.b #$02
|08C7F9| BNE .skip

|08C7FB| LDA.b #$00
|08C7FD| STA.l $7F586C,X

.skip
|08C801| DEX

|08C802| BPL .next

;---------------------------------------------------------------------------------------------------

|08C804| LDX.b #$09

.next_check
|08C806| LDA.l $7F586C,X
|08C80A| BNE .found_one

|08C80C| DEX
|08C80D| BPL .next_check

|08C80F| LDX.w $0FA0

|08C812| STZ.w $0C4A,X

|08C815| RTS

.found_one
|08C816| BRL Ancilla_RestoreIndex

;===================================================================================================

HapinessPondRupees_ExecuteRupee:
|08C819| LDA.b #$10

|08C81B| JSR AllocateOAMInRegionsADF
|08C81E| PHX

|08C81F| LDY.w $0FA0

|08C822| JSR HapinessPondRupees_GetState
|08C825| TYX

|08C826| LDA.w $0C54,X
|08C829| BEQ .not_splashing

|08C82B| LDA.b $11
|08C82D| BNE .only_splash

|08C82F| LDA.w $0C68,X
|08C832| BNE .only_splash

|08C834| LDA.b #$06
|08C836| STA.w $0C68,X

|08C839| INC.w $0C5E,X

|08C83C| LDA.w $0C5E,X
|08C83F| CMP.b #$05
|08C841| BNE .only_splash

|08C843| INC.w $0C54,X
|08C846| BRL .finish_up

;---------------------------------------------------------------------------------------------------

.only_splash
|08C849| JSR AncillaDraw_ObjectSplash

|08C84C| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.not_splashing
|08C84E| LDA.b $11
|08C850| BNE .just_draw

|08C852| LDA.w $0C68,X
|08C855| BNE .just_draw

|08C857| LDA.w $0294,X
|08C85A| SEC
|08C85B| SBC.b #$02
|08C85D| STA.w $0294,X

|08C860| JSR AncillaMoveY
|08C863| JSR AncillaMoveX
|08C866| JSR AncillaMoveZ

|08C869| LDA.w $029E,X
|08C86C| BPL .just_draw

|08C86E| CMP.b #$E4
|08C870| BCS .just_draw

;---------------------------------------------------------------------------------------------------

|08C872| LDA.b #$E4
|08C874| STA.w $029E,X

|08C877| LDA.w $0BFA,X
|08C87A| CLC
|08C87B| ADC.b #$1E
|08C87D| STA.w $0BFA,X

|08C880| LDA.w $0C0E,X
|08C883| ADC.b #$00
|08C885| STA.w $0C0E,X

|08C888| LDA.w $0C04,X
|08C88B| CLC
|08C88C| ADC.b #$FC
|08C88E| STA.w $0C04,X

|08C891| LDA.w $0C18,X
|08C894| ADC.b #$FF
|08C896| STA.w $0C18,X

|08C899| STZ.w $0C5E,X

|08C89C| LDA.b #$06
|08C89E| STA.w $0C68,X

|08C8A1| LDA.b #$28 ; SFX2.28
|08C8A3| JSR Ancilla_SFX2_Pan

|08C8A6| INC.w $0C54,X

|08C8A9| BRA .only_splash

;---------------------------------------------------------------------------------------------------

.just_draw
|08C8AB| LDA.b #$02
|08C8AD| STA.w $0BF0,X

|08C8B0| LDA.b #$00
|08C8B2| STA.w $0C7C,X

|08C8B5| JSR AncillaDraw_WishPondItem

;---------------------------------------------------------------------------------------------------

.finish_up
|08C8B8| TXY

|08C8B9| PLX

|08C8BA| JSR HapinessPondRupees_SaveState

|08C8BD| RTS

;===================================================================================================

HapinessPondRupees_GetState:
|08C8BE| LDA.l $7F5824,X
|08C8C2| STA.w $0BFA,Y

|08C8C5| LDA.l $7F5830,X
|08C8C9| STA.w $0C0E,Y

|08C8CC| LDA.l $7F583C,X
|08C8D0| STA.w $0C04,Y

|08C8D3| LDA.l $7F5848,X
|08C8D7| STA.w $0C18,Y

|08C8DA| LDA.l $7F5854,X
|08C8DE| STA.w $029E,Y

|08C8E1| LDA.l $7F5800,X
|08C8E5| STA.w $0C22,Y

|08C8E8| LDA.l $7F580C,X
|08C8EC| STA.w $0C2C,Y

|08C8EF| LDA.l $7F5818,X
|08C8F3| STA.w $0294,Y

|08C8F6| LDA.l $7F5886,X
|08C8FA| STA.w $0C36,Y

|08C8FD| LDA.l $7F5892,X
|08C901| STA.w $0C40,Y

|08C904| LDA.l $7F589E,X
|08C908| STA.w $02A8,Y

|08C90B| LDA.l $7F587A,X
|08C90F| STA.w $0C5E,Y

|08C912| LDA.l $7F58AA,X
|08C916| STA.w $0C54,Y

|08C919| LDA.l $7F5860,X
|08C91D| BEQ .dont_dec

|08C91F| DEC A

.dont_dec
|08C920| STA.w $0C68,Y

|08C923| RTS

;===================================================================================================

HapinessPondRupees_SaveState:
|08C924| LDA.w $0BFA,Y
|08C927| STA.l $7F5824,X

|08C92B| LDA.w $0C0E,Y
|08C92E| STA.l $7F5830,X

|08C932| LDA.w $0C04,Y
|08C935| STA.l $7F583C,X

|08C939| LDA.w $0C18,Y
|08C93C| STA.l $7F5848,X

|08C940| LDA.w $029E,Y
|08C943| STA.l $7F5854,X

|08C947| LDA.w $0C22,Y
|08C94A| STA.l $7F5800,X

|08C94E| LDA.w $0C2C,Y
|08C951| STA.l $7F580C,X

|08C955| LDA.w $0294,Y
|08C958| STA.l $7F5818,X

|08C95C| LDA.w $0C36,Y
|08C95F| STA.l $7F5886,X

|08C963| LDA.w $0C40,Y
|08C966| STA.l $7F5892,X

|08C96A| LDA.w $02A8,Y
|08C96D| STA.l $7F589E,X

|08C971| LDA.w $0C5E,Y
|08C974| STA.l $7F587A,X

|08C978| LDA.w $0C68,Y
|08C97B| STA.l $7F5860,X

|08C97F| LDA.w $0C54,Y
|08C982| STA.l $7F58AA,X

|08C986| RTS

;===================================================================================================

pool AncillaDraw_ObjectSplash

.char
|08C987| db $C0, $FF
|08C989| db $E7, $FF
|08C98B| db $AF, $BF
|08C98D| db $80, $80
|08C98F| db $83, $83

.prop
|08C991| db $00, $FF
|08C993| db $00, $FF
|08C995| db $40, $00
|08C997| db $40, $00
|08C999| db $C0, $80

.offset_x
|08C99B| dw   0,   0
|08C99F| dw  -6,   0
|08C9A3| dw -13,  -8
|08C9A7| dw -17,  -4
|08C9AB| dw -17,  -4

.offset_y
|08C9AF| dw   0,   0
|08C9B3| dw   0,   0
|08C9B7| dw  11,  -3
|08C9BB| dw  15,  -7
|08C9BF| dw  15,  -7

.size
|08C9C3| db $02, $FF
|08C9C5| db $02, $FF
|08C9C7| db $00, $00
|08C9C9| db $00, $00
|08C9CB| db $00, $00

endpool

;===================================================================================================

Ancilla_TransmuteToSplash:
|08C9CD| LDA.b #$3D ; ANCILLA 3D
|08C9CF| STA.w $0C4A,X

|08C9D2| STZ.w $0C5E,X

|08C9D5| LDA.b #$06
|08C9D7| STA.w $0C68,X

|08C9DA| LDA.w $0BFA,X
|08C9DD| CLC
|08C9DE| ADC.b #$0C
|08C9E0| STA.w $0BFA,X

|08C9E3| LDA.w $0C0E,X
|08C9E6| ADC.b #$00
|08C9E8| STA.w $0C0E,X

|08C9EB| LDA.w $0C04,X
|08C9EE| CLC
|08C9EF| ADC.b #$F8
|08C9F1| STA.w $0C04,X

|08C9F4| LDA.w $0C18,X
|08C9F7| ADC.b #$FF
|08C9F9| STA.w $0C18,X

|08C9FC| LDA.b #$28 ; SFX2.28
|08C9FE| JSR Ancilla_SFX2_Pan

;===================================================================================================

Ancilla3D_ItemSplash:
|08CA01| LDA.b #$08
|08CA03| JSR AllocateOAMInRegionsADF

|08CA06| LDA.b $11
|08CA08| BNE AncillaDraw_ObjectSplash

|08CA0A| LDA.w $0C68,X
|08CA0D| BNE AncillaDraw_ObjectSplash

|08CA0F| LDA.b #$06
|08CA11| STA.w $0C68,X

|08CA14| INC.w $0C5E,X

|08CA17| LDA.w $0C5E,X
|08CA1A| CMP.b #$05
|08CA1C| BNE AncillaDraw_ObjectSplash

|08CA1E| STZ.w $0C4A,X

|08CA21| RTS

;===================================================================================================

AncillaDraw_ObjectSplash:
|08CA22| JSR Ancilla_PrepOAMCoord

|08CA25| REP #$20

|08CA27| LDA.b $00
|08CA29| STA.b $04

|08CA2B| LDA.b $02
|08CA2D| STA.b $06

|08CA2F| SEP #$20

|08CA31| PHX

|08CA32| LDY.b #$00

|08CA34| STZ.b $0C

|08CA36| LDA.w $0C5E,X
|08CA39| ASL A
|08CA3A| TAX

;---------------------------------------------------------------------------------------------------

.next
|08CA3B| LDA.w .char,X
|08CA3E| CMP.b #$FF
|08CA40| BEQ .skip

|08CA42| PHX

|08CA43| TXA
|08CA44| ASL A
|08CA45| TAX

|08CA46| REP #$20

|08CA48| LDA.w .offset_x,X
|08CA4B| CLC
|08CA4C| ADC.b $04
|08CA4E| STA.b $00

|08CA50| LDA.w .offset_y,X
|08CA53| CLC
|08CA54| ADC.b $06
|08CA56| STA.b $02

|08CA58| SEP #$20

|08CA5A| PLX

|08CA5B| JSR Ancilla_SetOAM_XY

|08CA5E| LDA.w .char,X
|08CA61| STA.b ($90),Y

|08CA63| INY

|08CA64| LDA.w .prop,X
|08CA67| ORA.b #$24
|08CA69| STA.b ($90),Y

|08CA6B| INY
|08CA6C| PHY

|08CA6D| TYA
|08CA6E| SEC
|08CA6F| SBC.b #$04
|08CA71| LSR A
|08CA72| LSR A
|08CA73| TAY

|08CA74| LDA.w .size,X
|08CA77| STA.b ($92),Y

|08CA79| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08CA7A| INX

|08CA7B| INC.b $0C

|08CA7D| LDA.b $0C
|08CA7F| CMP.b #$02
|08CA81| BNE .next

|08CA83| PLX

|08CA84| RTS

;===================================================================================================

MilestoneItemReceiptIDs:

.ether
|08CA85| db $10 ; ITEMGET 10

.green_pendant
|08CA86| db $37 ; ITEMGET 37

.blue_pendant
|08CA87| db $39 ; ITEMGET 39

.red_pendant
|08CA88| db $38 ; ITEMGET 38

.heart_container
|08CA89| db $26 ; ITEMGET 26

.bombos
|08CA8A| db $0F ; ITEMGET 0F

.crystal
|08CA8B| db $20 ; ITEMGET 20

;---------------------------------------------------------------------------------------------------

Ancilla29_MilestoneItemReceipt:
|08CA8C| LDA.w $0C5E,X
|08CA8F| CMP.w MilestoneItemReceiptIDs.ether
|08CA92| BEQ .medallion

|08CA94| CMP.w MilestoneItemReceiptIDs.bombos
|08CA97| BEQ .medallion

|08CA99| LDA.w $0403
|08CA9C| AND.b #$40
|08CA9E| BNE .terminate

|08CAA0| LDA.w $0403
|08CAA3| AND.b #$80
|08CAA5| BEQ .exit

|08CAA7| LDA.w $04C2
|08CAAA| BEQ .time_up

|08CAAC| CMP.b #$01
|08CAAE| BNE .tick_timer

|08CAB0| LDY.b #$23

|08CAB2| LDA.w $0C5E,X
|08CAB5| CMP.w MilestoneItemReceiptIDs.crystal
|08CAB8| BNE .not_crystal

|08CABA| LDA.b #$0F ; SFX1.0F
|08CABC| STA.w $012D

|08CABF| LDY.b #$28

.not_crystal
|08CAC1| TYA
|08CAC2| STA.b $72

|08CAC4| PHX

|08CAC5| JSL WriteTo4BPPBuffer_item_gfx

|08CAC9| PLX

.tick_timer
|08CACA| DEC.w $04C2

.exit
|08CACD| RTS

;---------------------------------------------------------------------------------------------------

.terminate
|08CACE| STZ.w $0C4A,X

|08CAD1| RTS

.medallion
|08CAD2| LDA.w $0394,X
|08CAD5| BEQ .no_misc_palette

|08CAD7| DEC.w $0394,X

|08CADA| RTS

;---------------------------------------------------------------------------------------------------

.time_up
|08CADB| LDA.w $039F,X
|08CADE| BNE .no_misc_palette

|08CAE0| LDA.w $0C5E,X
|08CAE3| CMP.w MilestoneItemReceiptIDs.crystal
|08CAE6| BNE .no_misc_palette

|08CAE8| LDA.b #$01
|08CAEA| STA.w $039F,X

|08CAED| PHX

|08CAEE| LDA.b #$04
|08CAF0| STA.w $0AB1

|08CAF3| LDA.b #$02
|08CAF5| STA.w $0AA9

|08CAF8| JSL PaletteLoad_SpriteEnvironment_Underworld

|08CAFC| INC.b $15

|08CAFE| PLX

;---------------------------------------------------------------------------------------------------

.no_misc_palette
|08CAFF| LDA.w $0C5E,X
|08CB02| CMP.w MilestoneItemReceiptIDs.crystal
|08CB05| BNE .no_sparkle

|08CB07| JSR AncillaAdd_OccasionalSparkle

.no_sparkle
|08CB0A| LDA.b $11
|08CB0C| BNE .just_draw

|08CB0E| LDA.w $029E,X
|08CB11| CMP.b #$18
|08CB13| BCS .no_collision

|08CB15| LDY.b #$02
|08CB17| JSR Ancilla_CheckLinkCollision
|08CB1A| BCC .no_collision

|08CB1C| LDA.w $037E
|08CB1F| BNE .no_collision

|08CB21| LDA.b $4D
|08CB23| BNE .no_collision

|08CB25| STZ.w $0C4A,X

|08CB28| LDA.b $5D
|08CB2A| CMP.b #$19 ; LINKSTATE 19
|08CB2C| BEQ .using_medallion

|08CB2E| CMP.b #$1A ; LINKSTATE 1A
|08CB30| BNE .not_medallion

.using_medallion
|08CB32| STZ.w $0112
|08CB35| STZ.w $03EF

|08CB38| LDA.b #$00 ; LINKSTATE 00
|08CB3A| STA.b $5D

;---------------------------------------------------------------------------------------------------

.not_medallion
|08CB3C| LDA.b #$03
|08CB3E| STA.w $02E9

|08CB41| PHX

|08CB42| LDA.w $0C5E,X
|08CB45| TAY

|08CB46| JSL GrantItemReceipt

|08CB4A| PLX

|08CB4B| RTS

;---------------------------------------------------------------------------------------------------

.no_collision
|08CB4C| LDA.w $0C54,X
|08CB4F| BEQ .not_grounded

|08CB51| CMP.b #$02
|08CB53| BEQ .just_draw

|08CB55| LDA.w $0294,X
|08CB58| SEC
|08CB59| SBC.b #$01
|08CB5B| STA.w $0294,X

.not_grounded
|08CB5E| JSR AncillaMoveZ

|08CB61| LDA.w $029E,X
|08CB64| CMP.b #$F8
|08CB66| BCC .just_draw

|08CB68| INC.w $0C54,X

|08CB6B| LDA.b #$18
|08CB6D| STA.w $0294,X

|08CB70| STZ.w $029E,X

;---------------------------------------------------------------------------------------------------

.just_draw
|08CB73| JSR Ancilla_PrepOAMCoord.adjusted

|08CB76| REP #$20

|08CB78| LDA.w $029E,X
|08CB7B| AND.w #$00FF
|08CB7E| STA.b $72

|08CB80| LDA.b $00
|08CB82| STA.b $06

|08CB84| SEC
|08CB85| SBC.b $72
|08CB87| STA.b $00

|08CB89| SEP #$20

|08CB8B| JSR AncillaDraw_ItemReceipt

|08CB8E| PHX

|08CB8F| DEC.w $03B1,X
|08CB92| BPL .delay_ripple

|08CB94| LDA.b #$09
|08CB96| STA.w $03B1,X

|08CB99| INC.w $0385,X

|08CB9C| LDA.w $0385,X
|08CB9F| CMP.b #$03
|08CBA1| BNE .delay_ripple

|08CBA3| STZ.w $0385,X

;---------------------------------------------------------------------------------------------------

.delay_ripple
|08CBA6| LDA.w $0385,X
|08CBA9| STA.b $72

|08CBAB| LDA.w $029E,X
|08CBAE| CMP.b #$00
|08CBB0| BNE .airborne

|08CBB2| LDX.b #$00

|08CBB4| LDA.b $A0
|08CBB6| CMP.b #$06 ; ROOM 0006
|08CBB8| BNE .no_water_draw

|08CBBA| LDA.b $A1
|08CBBC| CMP.b #$00
|08CBBE| BNE .no_water_draw

|08CBC0| LDA.b $72
|08CBC2| CLC
|08CBC3| ADC.b #$04
|08CBC5| TAX

|08CBC6| BRA .no_water_draw

.airborne
|08CBC8| LDX.b #$01

|08CBCA| CMP.b #$20
|08CBCC| BCC .no_water_draw

|08CBCE| INX

;---------------------------------------------------------------------------------------------------

.no_water_draw
|08CBCF| REP #$20

|08CBD1| LDA.b $06
|08CBD3| CLC
|08CBD4| ADC.w #$000C
|08CBD7| STA.b $00

|08CBD9| SEP #$20

|08CBDB| LDA.b #$20
|08CBDD| STA.b $04

|08CBDF| JSR AncillaDraw_Shadow

|08CBE2| PLX

|08CBE3| RTS

;===================================================================================================

ItemReceipt_TransmuteToRisingCrystal:
|08CBE4| LDA.b #$3E ; ANCILLA 3E
|08CBE6| STA.w $0C4A,X

|08CBE9| STZ.w $0C22,X
|08CBEC| STZ.w $0C2C,X
|08CBEF| STZ.w $0C36,X

;===================================================================================================

Ancilla3E_RisingCrystal:
|08CBF2| STZ.w $029E,X

|08CBF5| JSR AncillaAdd_OccasionalSparkle

|08CBF8| LDA.w $0C22,X
|08CBFB| CLC
|08CBFC| ADC.b #$FF
|08CBFE| CMP.b #$F0
|08CC00| BCS .positive

|08CC02| LDA.b #$F0

.positive
|08CC04| STA.w $0C22,X

|08CC07| JSR AncillaMoveY

|08CC0A| LDA.w $0BFA,X
|08CC0D| STA.b $00

|08CC0F| LDA.w $0C0E,X
|08CC12| STA.b $01

|08CC14| REP #$20

|08CC16| LDA.b $00
|08CC18| SEC
|08CC19| SBC.w $0122
|08CC1C| CMP.w #$0049
|08CC1F| BCS .not_in_position

|08CC21| LDA.w #$0049
|08CC24| CLC
|08CC25| ADC.w $0122
|08CC28| STA.b $00

;---------------------------------------------------------------------------------------------------

|08CC2A| SEP #$20

|08CC2C| LDA.b $00
|08CC2E| STA.w $0BFA,X

|08CC31| LDA.b $01
|08CC33| STA.w $0C0E,X

|08CC36| LDA.b $11
|08CC38| BNE .not_in_position

|08CC3A| PHX

|08CC3B| LDA.w $040C
|08CC3E| LSR A
|08CC3F| TAX

|08CC40| LDA.l $7EF37A
|08CC44| ORA.l RoomTagPrizeChecks,X
|08CC48| STA.l $7EF37A

|08CC4C| LDA.b #$18
|08CC4E| STA.b $11
|08CC50| STZ.b $B0

;---------------------------------------------------------------------------------------------------

|08CC52| REP #$20

|08CC54| LDX.b #$00

|08CC56| LDA.w #$0000 ; RGB: #000000

.next_color
|08CC59| STA.l $7EC340,X
|08CC5D| STA.l $7EC360,X
|08CC61| STA.l $7EC380,X
|08CC65| STA.l $7EC3A0,X
|08CC69| STA.l $7EC3C0,X
|08CC6D| STA.l $7EC3E0,X

|08CC71| INX
|08CC72| INX
|08CC73| CPX.b #$20
|08CC75| BNE .next_color

|08CC77| STA.l $7EC007
|08CC7B| STA.l $7EC009

;---------------------------------------------------------------------------------------------------

|08CC7F| SEP #$20

|08CC81| PLX

.not_in_position
|08CC82| SEP #$20

|08CC84| JSR Ancilla_PrepOAMCoord.adjusted

|08CC87| REP #$20

|08CC89| LDA.b $00
|08CC8B| STA.b $06

|08CC8D| SEP #$20

|08CC8F| JSR AncillaDraw_ItemReceipt

|08CC92| RTS

;===================================================================================================

AncillaAdd_OccasionalSparkle:
|08CC93| LDA.b $1A
|08CC95| AND.b #$07
|08CC97| BNE .exit

|08CC99| PHX

|08CC9A| JSL AncillaAdd_SwordChargeSparkle

|08CC9E| PLX

.exit
|08CC9F| RTS

;===================================================================================================

Ancilla43_GanonsTowerCutscene:
|08CCA0| LDA.w $0C54,X
|08CCA3| BNE .not_first_state

|08CCA5| LDA.w $0C22,X
|08CCA8| CLC
|08CCA9| ADC.b #$FF
|08CCAB| CMP.b #$F0
|08CCAD| BCS .not_max_crystal_speed

|08CCAF| LDA.b #$F0

.not_max_crystal_speed
|08CCB1| STA.w $0C22,X

|08CCB4| JSR AncillaMoveY

|08CCB7| LDA.w $0BFA,X
|08CCBA| STA.b $00

|08CCBC| LDA.w $0C0E,X
|08CCBF| STA.b $01

|08CCC1| LDA.w $0C04,X
|08CCC4| STA.b $02

|08CCC6| LDA.w $0C18,X
|08CCC9| STA.b $03

;---------------------------------------------------------------------------------------------------

|08CCCB| REP #$20

|08CCCD| LDA.b $00
|08CCCF| SEC
|08CCD0| SBC.w $0122

|08CCD3| CMP.w #$0038
|08CCD6| BCS .crystals_not_together

|08CCD8| LDA.w #$0038
|08CCDB| CLC
|08CCDC| ADC.w $0122
|08CCDF| STA.b $00

|08CCE1| CLC
|08CCE2| ADC.w #$0008
|08CCE5| STA.l $7F5810

|08CCE9| LDA.b $02
|08CCEB| CLC
|08CCEC| ADC.w #$0008
|08CCEF| STA.l $7F580E

;---------------------------------------------------------------------------------------------------

|08CCF3| SEP #$20

|08CCF5| LDA.b $00
|08CCF7| STA.w $0BFA,X

|08CCFA| LDA.b $01
|08CCFC| STA.w $0C0E,X

|08CCFF| INC.w $0C54,X

|08CD02| LDA.b #$05 ; SFX1.05
|08CD04| STA.w $012D

|08CD07| LDA.b #$F1 ; SONG F1 - fade
|08CD09| STA.w $012C

|08CD0C| REP #$20

|08CD0E| LDA.w #$013B ; MESSAGE 013B
|08CD11| STA.w $1CF0

|08CD14| SEP #$20

|08CD16| JSL PrepAndDisplayMessage

|08CD1A| BRA .draw_single_crystal_prep

;---------------------------------------------------------------------------------------------------

.crystals_not_together
|08CD1C| SEP #$20

.not_first_state
|08CD1E| LDA.w $0C54,X
|08CD21| CMP.b #$01
|08CD23| BNE .not_expansive

|08CD25| LDA.b $11
|08CD27| BNE .not_expansive

|08CD29| LDA.b #$10
|08CD2B| STA.w $0C2C,X

|08CD2E| LDA.w $0C04,X
|08CD31| STA.b $72

|08CD33| LDA.w $0C18,X
|08CD36| STA.b $73

|08CD38| LDA.l $7F5808
|08CD3C| STA.w $0C04,X

|08CD3F| STZ.w $0C18,X

|08CD42| JSR AncillaMoveX

|08CD45| LDA.w $0C04,X
|08CD48| STA.l $7F5808

|08CD4C| LDA.b $72
|08CD4E| STA.w $0C04,X

|08CD51| LDA.b $73
|08CD53| STA.w $0C18,X

|08CD56| LDA.l $7F5808
|08CD5A| CMP.b #$30
|08CD5C| BCC .not_expansive

|08CD5E| LDA.b #$30
|08CD60| STA.l $7F5808

|08CD64| INC.w $0C54,X

;---------------------------------------------------------------------------------------------------

.not_expansive
|08CD67| LDA.b $11
|08CD69| BNE GTCutscene_AnimateCrystals

|08CD6B| LDA.w $0C54,X
|08CD6E| BNE .draw_multiple

;---------------------------------------------------------------------------------------------------

.draw_single_crystal_prep
|08CD70| LDY.b #$00

|08CD72| BRL GTCutscene_DrawSingleCrystal

;---------------------------------------------------------------------------------------------------

.draw_multiple
|08CD75| CMP.b #$01
|08CD77| BEQ GTCutscene_AnimateCrystals

|08CD79| CMP.b #$03
|08CD7B| BEQ .final_rotation

;---------------------------------------------------------------------------------------------------

|08CD7D| LDA.l $7F5812
|08CD81| DEC A
|08CD82| STA.l $7F5812

|08CD86| BNE GTCutscene_AnimateCrystals

|08CD88| LDA.b #$05
|08CD8A| STA.w $04C6

|08CD8D| STZ.b $B0
|08CD8F| STZ.b $C8

|08CD91| INC.w $0C54,X

|08CD94| BRA GTCutscene_AnimateCrystals

;---------------------------------------------------------------------------------------------------

.final_rotation
|08CD96| LDA.b #$30
|08CD98| STA.w $0C2C,X

|08CD9B| LDA.w $0C04,X
|08CD9E| STA.b $72

|08CDA0| LDA.w $0C18,X
|08CDA3| STA.b $73

|08CDA5| LDA.l $7F5808
|08CDA9| STA.w $0C04,X

|08CDAC| STZ.w $0C18,X

|08CDAF| JSR AncillaMoveX

|08CDB2| LDA.w $0C04,X
|08CDB5| STA.l $7F5808

|08CDB9| LDA.b $72
|08CDBB| STA.w $0C04,X

|08CDBE| LDA.b $73
|08CDC0| STA.w $0C18,X

|08CDC3| LDA.l $7F5808
|08CDC7| CMP.b #$F0
|08CDC9| BCC GTCutscene_AnimateCrystals

;---------------------------------------------------------------------------------------------------

|08CDCB| PHX

|08CDCC| LDA.b #$00
|08CDCE| STA.w $0AB1

|08CDD1| LDA.b #$02
|08CDD3| STA.w $0AA9

|08CDD6| JSL PaletteLoad_SpriteEnvironment_Underworld

|08CDDA| INC.b $15

|08CDDC| PLX

|08CDDD| STZ.w $0C4A,X

|08CDE0| RTS

;===================================================================================================

GTCutscene_AnimateCrystals:
|08CDE1| LDY.b #$00

|08CDE3| LDA.w $0C54,X
|08CDE6| STA.b $72

|08CDE8| BEQ .sparkle_a_not

|08CDEA| JSR GTCutscene_SparkleALot

.sparkle_a_not
|08CDED| LDX.b #$06

.next_crystal
|08CDEF| LDA.b $11
|08CDF1| BNE .no_rotate

|08CDF3| LDA.b $72
|08CDF5| CMP.b #$01
|08CDF7| BEQ .no_rotate

|08CDF9| LDA.b $1A
|08CDFB| AND.b #$01
|08CDFD| BNE .no_rotate

|08CDFF| LDA.l $7F5800,X
|08CE03| INC A
|08CE04| AND.b #$3F
|08CE06| STA.l $7F5800,X

.no_rotate
|08CE0A| LDA.l $7F5808
|08CE0E| STA.b $08

|08CE10| LDA.l $7F5800,X

|08CE14| JSR Ancilla_GetRadialProjection

|08CE17| REP #$20

|08CE19| PHY

|08CE1A| LDA.b $00
|08CE1C| LDY.b $02
|08CE1E| BEQ .positive_y

|08CE20| EOR.w #$FFFF
|08CE23| INC A

.positive_y
|08CE24| CLC
|08CE25| ADC.l $7F5810

|08CE29| CLC
|08CE2A| ADC.w #$FFF8

|08CE2D| SEC
|08CE2E| SBC.w $0122
|08CE31| STA.b $00

|08CE33| LDA.b $04

|08CE35| LDY.b $06
|08CE37| BEQ .positive_x

|08CE39| EOR.w #$FFFF
|08CE3C| INC A

.positive_x
|08CE3D| CLC
|08CE3E| ADC.l $7F580E

|08CE42| CLC
|08CE43| ADC.w #$FFF8

|08CE46| SEC
|08CE47| SBC.w $011E
|08CE4A| STA.b $02

|08CE4C| PLY

|08CE4D| SEP #$20

|08CE4F| LDA.b $00
|08CE51| STA.l $7F5817,X

|08CE55| LDA.b $01
|08CE57| STA.l $7F581F,X

|08CE5B| LDA.b $02
|08CE5D| STA.l $7F5827,X

|08CE61| LDA.b $03
|08CE63| STA.l $7F582F,X

|08CE67| PHX

|08CE68| JSR AncillaDraw_GTCutsceneCrystal

|08CE6B| PLX
|08CE6C| DEX

|08CE6D| BPL .next_crystal

;===================================================================================================

GTCutscene_DrawSingleCrystal:
|08CE6F| LDX.w $0FA0

|08CE72| PHY
|08CE73| JSR Ancilla_PrepOAMCoord.adjusted
|08CE76| PLY

|08CE77| LDA.b $00
|08CE79| STA.l $7F581E

|08CE7D| LDA.b $01
|08CE7F| STA.l $7F5826

|08CE83| LDA.b $02
|08CE85| STA.l $7F582E

|08CE89| LDA.b $03
|08CE8B| STA.l $7F5836

|08CE8F| JSR AncillaDraw_GTCutsceneCrystal

;---------------------------------------------------------------------------------------------------

|08CE92| LDX.w $0FA0

|08CE95| LDA.w $0C54,X
|08CE98| BNE .skip_sparkle

|08CE9A| JSR AncillaAdd_OccasionalSparkle

|08CE9D| BRA .exit

.skip_sparkle
|08CE9F| LDA.b $11
|08CEA1| BNE .exit

|08CEA3| JSR GTCutscene_ActivateSparkle

|08CEA6| LDX.w $0FA0

.exit
|08CEA9| RTS

;===================================================================================================

AncillaDraw_GTCutsceneCrystal:
|08CEAA| JSR Ancilla_SetOAM_XY_safe

|08CEAD| LDA.b #$24
|08CEAF| STA.b ($90),Y

|08CEB1| INY

|08CEB2| LDA.b #$3C
|08CEB4| STA.b ($90),Y

|08CEB6| INY
|08CEB7| PHY

|08CEB8| TYA
|08CEB9| SEC
|08CEBA| SBC.b #$04
|08CEBC| LSR A
|08CEBD| LSR A
|08CEBE| TAY

|08CEBF| LDA.b #$02
|08CEC1| ORA.b $75
|08CEC3| STA.b ($92),Y

|08CEC5| PLY

|08CEC6| RTS

;===================================================================================================

GTCutscene_ActivateSparkle:
|08CEC7| LDX.b #$17

.next_check
|08CEC9| LDA.l $7F5837,X
|08CECD| CMP.b #$FF
|08CECF| BEQ .activate_it

|08CED1| DEX
|08CED2| BPL .next_check

|08CED4| BRA .exit

;---------------------------------------------------------------------------------------------------

.activate_it
|08CED6| PHX

|08CED7| LDA.b #$00
|08CED9| STA.l $7F5837,X

|08CEDD| LDA.b #$04
|08CEDF| STA.l $7F58AF,X

|08CEE3| JSL GetRandomNumber
|08CEE7| STA.b $08

|08CEE9| LSR A
|08CEEA| LSR A
|08CEEB| LSR A
|08CEEC| LSR A
|08CEED| STA.b $09

|08CEEF| LDA.b $08
|08CEF1| AND.b #$0F
|08CEF3| STA.b $08

|08CEF5| TXA
|08CEF6| AND.b #$07
|08CEF8| TAX

|08CEF9| LDA.l $7F5817,X
|08CEFD| CLC
|08CEFE| ADC.b $08
|08CF00| STA.b $00

|08CF02| LDA.l $7F581F,X
|08CF06| ADC.b #$00
|08CF08| STA.b $01

|08CF0A| LDA.l $7F5827,X
|08CF0E| CLC
|08CF0F| ADC.b $09
|08CF11| STA.b $02

|08CF13| LDA.l $7F582F,X
|08CF17| ADC.b #$00
|08CF19| STA.b $03

|08CF1B| PLX

|08CF1C| LDA.b $00
|08CF1E| STA.l $7F584F,X

|08CF22| LDA.b $01
|08CF24| STA.l $7F5867,X

|08CF28| LDA.b $02
|08CF2A| STA.l $7F587F,X

|08CF2E| LDA.b $03
|08CF30| STA.l $7F5897,X

.exit
|08CF34| RTS

;===================================================================================================

GTCutscene_SparkleALot:
|08CF35| LDX.b #$17

.next
|08CF37| LDA.l $7F5837,X
|08CF3B| CMP.b #$FF
|08CF3D| BEQ .skip

|08CF3F| LDA.l $7F58AF,X
|08CF43| DEC A
|08CF44| STA.l $7F58AF,X
|08CF48| BPL .active

|08CF4A| LDA.b #$04
|08CF4C| STA.l $7F58AF,X

|08CF50| LDA.l $7F5837,X
|08CF54| INC A
|08CF55| STA.l $7F5837,X

|08CF59| CMP.b #$03
|08CF5B| BNE .active

|08CF5D| LDA.b #$FF
|08CF5F| STA.l $7F5837,X
|08CF63| BRA .skip

;---------------------------------------------------------------------------------------------------

.active
|08CF65| PHX

|08CF66| LDA.l $7F584F,X
|08CF6A| STA.b $00

|08CF6C| LDA.l $7F5867,X
|08CF70| STA.b $01

|08CF72| LDA.l $7F587F,X
|08CF76| STA.b $02

|08CF78| LDA.l $7F5897,X
|08CF7C| STA.b $03

|08CF7E| LDA.l $7F5837,X
|08CF82| TAX

|08CF83| JSR Ancilla_SetOAM_XY

|08CF86| LDA.w Ancilla3C_SpinAttackChargeSparkle.char,X
|08CF89| STA.b ($90),Y

|08CF8B| INY

|08CF8C| LDA.w Ancilla3C_SpinAttackChargeSparkle.prop,X
|08CF8F| ORA.b #$30
|08CF91| STA.b ($90),Y

|08CF93| INY
|08CF94| PHY

|08CF95| TYA
|08CF96| SEC
|08CF97| SBC.b #$04
|08CF99| LSR A
|08CF9A| LSR A
|08CF9B| TAY

|08CF9C| LDA.b #$00
|08CF9E| STA.b ($92),Y

|08CFA0| PLY
|08CFA1| PLX

.skip
|08CFA2| DEX
|08CFA3| BPL .next

;---------------------------------------------------------------------------------------------------

|08CFA5| RTS

;===================================================================================================

FluteBounce:
|08CFA6| db  24
|08CFA7| db  16
|08CFA8| db  10
|08CFA9| db   0

;===================================================================================================

Ancilla36_Flute:
|08CFAA| LDA.b $11
|08CFAC| BNE .no_collision_check

|08CFAE| LDA.w $0C54,X
|08CFB1| CMP.b #$03
|08CFB3| BEQ .check_collision

|08CFB5| LDA.w $0294,X
|08CFB8| SEC
|08CFB9| SBC.b #$02
|08CFBB| STA.w $0294,X

|08CFBE| JSR AncillaMoveX
|08CFC1| JSR AncillaMoveZ

;---------------------------------------------------------------------------------------------------

|08CFC4| LDA.w $029E,X
|08CFC7| BPL .no_collision_check

|08CFC9| CMP.b #$F0
|08CFCB| BCC .no_collision_check

|08CFCD| INC.w $0C54,X

|08CFD0| LDY.w $0C54,X

|08CFD3| LDA.w FluteBounce,Y
|08CFD6| STA.w $0294,X

|08CFD9| STZ.w $029E,X

.no_collision_check
|08CFDC| BRA AncillaDraw_Flute

;---------------------------------------------------------------------------------------------------

.check_collision
|08CFDE| LDY.b #$02
|08CFE0| JSR Ancilla_CheckLinkCollision
|08CFE3| BCC AncillaDraw_Flute

|08CFE5| LDA.w $037E
|08CFE8| BNE AncillaDraw_Flute

|08CFEA| LDA.b $4D
|08CFEC| BNE AncillaDraw_Flute

|08CFEE| PHX

|08CFEF| STZ.w $0C4A,X

|08CFF2| STZ.w $02E9

|08CFF5| LDY.b #$14 ; ITEMGET 14
|08CFF7| JSL GrantItemReceipt

|08CFFB| PLX

|08CFFC| RTS

;===================================================================================================

AncillaDraw_Flute:
|08CFFD| JSR Ancilla_PrepOAMCoord.adjusted

|08D000| REP #$20

|08D002| LDA.w $029E,X
|08D005| AND.w #$00FF
|08D008| CMP.w #$0080
|08D00B| BCC .positive_z

|08D00D| ORA.w #$FF00

.positive_z
|08D010| EOR.w #$FFFF
|08D013| INC A

|08D014| CLC
|08D015| ADC.b $00
|08D017| STA.b $00

;---------------------------------------------------------------------------------------------------

|08D019| SEP #$20

|08D01B| PHX

|08D01C| LDY.b #$00
|08D01E| JSR Ancilla_SetOAM_XY

|08D021| LDA.b #$24
|08D023| STA.b ($90),Y

|08D025| INY

|08D026| LDA.b #$04
|08D028| ORA.b $65
|08D02A| STA.b ($90),Y

|08D02C| LDA.b #$02
|08D02E| STA.b ($92)

|08D030| PLX

|08D031| LDY.b #$01

|08D033| LDA.b ($90),Y
|08D035| CMP.b #$F0
|08D037| BNE EXIT_08D03C

|08D039| STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

#EXIT_08D03C:
|08D03C| RTS

;===================================================================================================

Ancilla37_WeathervaneExplosion:
|08D03D| REP #$20

|08D03F| LDA.l $7F58B6
|08D043| DEC A
|08D044| STA.l $7F58B6

|08D048| BNE .proceed_to_exit

|08D04A| SEP #$20

|08D04C| INC A
|08D04D| STA.l $7F58B6

|08D051| LDA.l $7F58B8
|08D055| BNE .continue

|08D057| INC A
|08D058| STA.l $7F58B8

|08D05C| LDA.b #$F3 ; SONG F3 - max volume
|08D05E| STA.w $012C

|08D061| BRA .continue

.proceed_to_exit
|08D063| SEP #$20

|08D065| BRA EXIT_08D03C

;---------------------------------------------------------------------------------------------------

.continue
|08D067| DEC.w $0394,X

|08D06A| LDA.w $0394,X
|08D06D| BNE .proceed_to_exit

|08D06F| INC A
|08D070| STA.w $0394,X

|08D073| LDA.w $039F,X
|08D076| BNE .already_BOOMed

|08D078| INC A
|08D079| STA.w $039F,X

|08D07C| LDA.b #$0C ; SFX2.0C
|08D07E| JSR Ancilla_SFX2_Near

;---------------------------------------------------------------------------------------------------

.already_BOOMed
|08D081| LDA.w $0C54,X
|08D084| BNE .not_first_step

|08D086| DEC.w $03B1,X
|08D089| BPL .not_first_step

|08D08B| LDA.b #$01
|08D08D| STA.w $0C54,X

|08D090| PHX

|08D091| JSL AlterWeathervane

|08D095| LDY.b #$00
|08D097| LDA.b #$38 ; ANCILLA 38
|08D099| JSL AncillaAdd_CutsceneDuck

|08D09D| PLX

.not_first_step
|08D09E| TXA
|08D09F| STA.l $7F5878

|08D0A3| LDA.b #$00
|08D0A5| STA.l $7F5879

;---------------------------------------------------------------------------------------------------

|08D0A9| LDX.b #$0B

.next
|08D0AB| LDA.l $7F586C,X
|08D0AF| CMP.b #$FF
|08D0B1| BNE .dont_skip

|08D0B3| BRL .skip

.dont_skip
|08D0B6| LDA.l $7F5860,X
|08D0BA| DEC A
|08D0BB| STA.l $7F5860,X

|08D0BF| BPL .delay_char_toggle

|08D0C1| LDA.b #$01
|08D0C3| STA.l $7F5860,X

|08D0C7| LDA.l $7F586C,X
|08D0CB| EOR.b #$01
|08D0CD| STA.l $7F586C,X

;---------------------------------------------------------------------------------------------------

.delay_char_toggle
|08D0D1| PHX

|08D0D2| LDA.l $7F5878
|08D0D6| TAY

|08D0D7| LDA.l $7F586C,X
|08D0DB| STA.w $0C5E,Y

|08D0DE| LDA.l $7F5824,X
|08D0E2| STA.w $0BFA,Y

|08D0E5| LDA.l $7F5830,X
|08D0E9| STA.w $0C0E,Y

|08D0EC| LDA.l $7F583C,X
|08D0F0| STA.w $0C04,Y

|08D0F3| LDA.l $7F5848,X
|08D0F7| STA.w $0C18,Y

|08D0FA| LDA.l $7F5854,X
|08D0FE| STA.w $029E,Y

|08D101| LDA.l $7F5800,X
|08D105| STA.w $0C22,Y

|08D108| LDA.l $7F580C,X
|08D10C| STA.w $0C2C,Y

|08D10F| LDA.l $7F5818,X
|08D113| SEC
|08D114| SBC.b #$01
|08D116| STA.l $7F5818,X
|08D11A| STA.w $0294,Y

;---------------------------------------------------------------------------------------------------

|08D11D| TYX

|08D11E| JSR AncillaMoveY
|08D121| JSR AncillaMoveX
|08D124| JSR AncillaMoveZ

|08D127| STZ.b $74

|08D129| LDA.w $029E,X
|08D12C| CMP.b #$F0
|08D12E| BCC .not_buried

|08D130| LDA.b #$FF
|08D132| STA.b $74

.not_buried
|08D134| JSR AncillaDraw_WeathervaneExplosionWoodDebris
|08D137| PLX

|08D138| LDA.b $74
|08D13A| BPL .dont_deactivate

|08D13C| STA.l $7F586C,X

.dont_deactivate
|08D140| LDA.l $7F5878
|08D144| TAY

|08D145| LDA.w $0BFA,Y
|08D148| STA.l $7F5824,X

|08D14C| LDA.w $0C0E,Y
|08D14F| STA.l $7F5830,X

|08D153| LDA.w $0C04,Y
|08D156| STA.l $7F583C,X

|08D15A| LDA.w $0C18,Y
|08D15D| STA.l $7F5848,X

|08D161| LDA.w $029E,Y
|08D164| STA.l $7F5854,X

;---------------------------------------------------------------------------------------------------

.skip
|08D168| DEX
|08D169| BMI .done_loop

|08D16B| BRL .next

;---------------------------------------------------------------------------------------------------

.done_loop
|08D16E| LDA.l $7F5878
|08D172| TAY

|08D173| LDX.b #$0B

.next_active_check
|08D175| LDA.l $7F586C,X
|08D179| CMP.b #$FF
|08D17B| BNE .exit

|08D17D| DEX
|08D17E| BPL .next_active_check

|08D180| TYX
|08D181| STZ.w $0C4A,X

.exit
|08D184| TYX

|08D185| RTS

;===================================================================================================

pool AncillaDraw_WeathervaneExplosionWoodDebris

.char
|08D186| db $4E, $4F

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_WeathervaneExplosionWoodDebris:
|08D188| JSR Ancilla_PrepOAMCoord

|08D18B| REP #$20

|08D18D| LDA.w $029E,X
|08D190| AND.w #$00FF
|08D193| CMP.w #$0080
|08D196| BCC .positive_z

|08D198| ORA.w #$FF00

.positive_z
|08D19B| EOR.w #$FFFF
|08D19E| INC A

|08D19F| CLC
|08D1A0| ADC.b $00
|08D1A2| STA.b $00

|08D1A4| SEP #$20

|08D1A6| LDA.w $0C5E,X
|08D1A9| STA.b $72

|08D1AB| BMI .exit

;---------------------------------------------------------------------------------------------------

|08D1AD| PHX

|08D1AE| LDA.l $7F5879
|08D1B2| TAY

|08D1B3| JSR Ancilla_SetOAM_XY

|08D1B6| LDX.b $72

|08D1B8| LDA.w .char,X
|08D1BB| STA.b ($90),Y

|08D1BD| INY

|08D1BE| LDA.b #$3C
|08D1C0| STA.b ($90),Y

|08D1C2| INY
|08D1C3| TYA
|08D1C4| STA.l $7F5879

|08D1C8| SEC
|08D1C9| SBC.b #$04

|08D1CB| LSR A
|08D1CC| LSR A
|08D1CD| TAY

|08D1CE| LDA.b #$00
|08D1D0| STA.b ($92),Y

|08D1D2| PLX

;---------------------------------------------------------------------------------------------------

.exit
|08D1D3| RTS

;===================================================================================================

pool Ancilla38_CutsceneDuck CutsceneDuck_Draw

.hflip
|08D1D4| db $40, $00

.swirl
|08D1D6| db $1C, $3C

endpool

;---------------------------------------------------------------------------------------------------

Ancilla38_CutsceneDuck:
|08D1D8| LDA.b $1A
|08D1DA| AND.b #$1F
|08D1DC| BNE .skip_sfx

|08D1DE| LDA.b #$1E ; SFX3.1E
|08D1E0| JSR Ancilla_SFX3_Pan

.skip_sfx
|08D1E3| DEC.w $039F,X
|08D1E6| BPL .delay

|08D1E8| LDA.b #$03
|08D1EA| STA.w $039F,X

|08D1ED| LDA.w $0380,X
|08D1F0| EOR.b #$01
|08D1F2| STA.w $0380,X

.delay
|08D1F5| DEC.w $03B1,X

|08D1F8| LDA.w $03B1,X
|08D1FB| BEQ .movement

|08D1FD| BRL CutsceneDuck_Draw

;---------------------------------------------------------------------------------------------------

.movement
|08D200| LDA.b #$01
|08D202| STA.w $03B1,X

|08D205| LDA.w $0385,X
|08D208| BNE .swirl_around

|08D20A| DEC.w $0C5E,X
|08D20D| BMI .init_swirling

|08D20F| LDY.b #$FF
|08D211| LDA.w $0C54,X
|08D214| BEQ .accelerate_descent

|08D216| LDY.b #$01

.accelerate_descent
|08D218| TYA
|08D219| CLC
|08D21A| ADC.w $0294,X
|08D21D| STA.w $0294,X

|08D220| BPL .positive_z

|08D222| EOR.b #$FF
|08D224| INC A

.positive_z
|08D225| CMP.b #$0C
|08D227| BCC .dont_flip_swirl

|08D229| LDA.w $0C54,X
|08D22C| EOR.b #$01
|08D22E| STA.w $0C54,X

.dont_flip_swirl
|08D231| BRL CutsceneDuck_Draw

;---------------------------------------------------------------------------------------------------

.init_swirling
|08D234| STZ.w $0C5E,X
|08D237| STZ.w $0C54,X

|08D23A| LDA.w .swirl
|08D23D| STA.w $0C2C,X

|08D240| LDA.b #$F0
|08D242| STA.w $0294,X

|08D245| INC.w $0385,X

|08D248| LDA.b #$03
|08D24A| STA.w $0C54,X

.swirl_around
|08D24D| LDY.b #$FF

|08D24F| LDA.w $0C54,X
|08D252| AND.b #$01
|08D254| BNE .accelerate_left

|08D256| LDY.b #$01

.accelerate_left
|08D258| TYA
|08D259| CLC
|08D25A| ADC.w $0C2C,X
|08D25D| STA.w $0C2C,X

|08D260| BPL .positive_x_a

|08D262| EOR.b #$FF
|08D264| INC A

.positive_x_a
|08D265| CMP.b #$00
|08D267| BNE .not_maxed_swirl

|08D269| INC.w $0385,X

|08D26C| LDY.w $0385,X
|08D26F| CPY.b #$07
|08D271| BNE .not_maxed_swirl

|08D273| PHA

|08D274| LDA.b #$01
|08D276| STA.w $03A9,X

|08D279| PLA

;---------------------------------------------------------------------------------------------------

.not_maxed_swirl
|08D27A| LDY.w $03A9,X
|08D27D| CMP.w .swirl,Y
|08D280| BCC .not_max_x

|08D282| LDA.w $0C54,X
|08D285| AND.b #$03
|08D287| EOR.b #$03
|08D289| STA.b $00

|08D28B| LDA.w $0C54,X
|08D28E| AND.b #$FC
|08D290| ORA.b $00
|08D292| STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.not_max_x
|08D295| LDY.b #$03
|08D297| LDA.w $0C2C,X
|08D29A| BPL .positive_x_b

|08D29C| EOR.b #$FF
|08D29E| INC A

|08D29F| LDY.b #$02

.positive_x_b
|08D2A1| STA.b $00

|08D2A3| TYA
|08D2A4| STA.w $0C72,X

|08D2A7| LDY.w $03A9,X

|08D2AA| LDA.w .swirl,Y
|08D2AD| SEC
|08D2AE| SBC.b $00
|08D2B0| LSR A
|08D2B1| STA.b $00

|08D2B3| LDA.w $0C54,X
|08D2B6| AND.b #$02
|08D2B8| BEQ .descending

|08D2BA| LDA.b $00
|08D2BC| EOR.b #$FF
|08D2BE| INC A
|08D2BF| STA.b $00

.descending
|08D2C1| LDA.b $00
|08D2C3| STA.w $0294,X

;===================================================================================================

CutsceneDuck_Draw:
|08D2C6| JSR AncillaMoveX
|08D2C9| JSR AncillaMoveZ

|08D2CC| LDY.w $0380,X

|08D2CF| LDA.w .vram_offset+1,Y
|08D2D2| STA.w $0AF4

|08D2D5| JSR Ancilla_PrepOAMCoord

|08D2D8| LDA.w $0C72,X
|08D2DB| AND.b #$01
|08D2DD| TAY

|08D2DE| LDA.w .hflip,Y
|08D2E1| STA.b $08

;===================================================================================================

|08D2E3| REP #$20

|08D2E5| LDA.w $029E,X
|08D2E8| AND.w #$00FF
|08D2EB| CMP.w #$0080
|08D2EE| BCC .z_is_positive

|08D2F0| ORA.w #$FF00

.z_is_positive
|08D2F3| EOR.w #$FFFF
|08D2F6| INC A
|08D2F7| STA.b $04

|08D2F9| LDA.b $00
|08D2FB| STA.b $0A

|08D2FD| SEC
|08D2FE| SBC.b $04
|08D300| STA.b $04

|08D302| LDA.b $02
|08D304| STA.b $06

;---------------------------------------------------------------------------------------------------

|08D306| SEP #$20

|08D308| PHX

|08D309| LDY.b #$00

|08D30B| REP #$20

|08D30D| LDA.w .offset_y
|08D310| AND.w #$00FF
|08D313| CLC
|08D314| ADC.b $04
|08D316| STA.b $00

|08D318| LDA.w .offset_x
|08D31B| AND.w #$00FF
|08D31E| CLC
|08D31F| ADC.b $06
|08D321| STA.b $02

;---------------------------------------------------------------------------------------------------

|08D323| SEP #$20

|08D325| JSR Ancilla_SetOAM_XY

|08D328| LDA.w .char
|08D32B| STA.b ($90),Y

|08D32D| INY

|08D32E| LDA.w .prop
|08D331| ORA.b #$30
|08D333| ORA.b $08
|08D335| STA.b ($90),Y

|08D337| INY
|08D338| PHY

|08D339| TYA
|08D33A| SEC
|08D33B| SBC.b #$04
|08D33D| LSR A
|08D33E| LSR A
|08D33F| TAY

|08D340| LDA.b #$02
|08D342| STA.b ($92),Y

|08D344| PLY

|08D345| REP #$20

|08D347| LDA.b $0A
|08D349| CLC
|08D34A| ADC.w #$0030
|08D34D| STA.b $00

|08D34F| LDA.b $06
|08D351| STA.b $02

;---------------------------------------------------------------------------------------------------

|08D353| SEP #$20

|08D355| LDA.b #$30
|08D357| STA.b $04

|08D359| LDX.b #$01
|08D35B| JSR AncillaDraw_Shadow

|08D35E| PLX

|08D35F| REP #$20

|08D361| LDA.b $06
|08D363| BMI .exit

|08D365| CMP.w #$00F8
|08D368| BCC .exit

;---------------------------------------------------------------------------------------------------

|08D36A| SEP #$20

|08D36C| STZ.w $0C4A,X

|08D36F| STZ.b $11

|08D371| LDA.b #$03
|08D373| STA.l $7EF34C

;---------------------------------------------------------------------------------------------------

.exit
|08D377| SEP #$20

|08D379| RTS

;===================================================================================================

pool AncillaDraw_LinkPoof

.char
|08D37A| db $86
|08D37B| db $A9
|08D37C| db $9B

.size
|08D37D| db $02
|08D37E| db $00
|08D37F| db $00

.prop
|08D380| db $00, $FF, $FF, $FF
|08D384| db $40, $00, $C0, $80
|08D388| db $00, $40, $80, $C0

.offset_y
|08D38C| dw   0,   0,   0,   0
|08D394| dw   0,   0,   8,   8
|08D39C| dw  -4,  -4,  12,  12

.offset_x
|08D3A4| dw   0,   0,   0,   0
|08D3AC| dw   0,   8,   0,   8
|08D3B4| dw  -4,  12,  -4,  12

endpool

;---------------------------------------------------------------------------------------------------

Ancilla23_LinkPoof:
|08D3BC| DEC.w $03B1,X
|08D3BF| BPL AncillaDraw_LinkPoof

|08D3C1| LDA.b #$07
|08D3C3| STA.w $03B1,X

|08D3C6| LDA.w $0C5E,X
|08D3C9| INC A
|08D3CA| STA.w $0C5E,X

|08D3CD| CMP.b #$03
|08D3CF| BNE AncillaDraw_LinkPoof

|08D3D1| STZ.w $0C4A,X

|08D3D4| STZ.w $02E1
|08D3D7| STZ.b $50

|08D3D9| LDA.w $0C54,X
|08D3DC| BNE .exit

|08D3DE| STZ.b $2E
|08D3E0| STZ.b $4B

;---------------------------------------------------------------------------------------------------

|08D3E2| LDY.b #$00

|08D3E4| LDA.b $8A
|08D3E6| AND.b #$40
|08D3E8| BEQ .light_world

|08D3EA| INY

.light_world
|08D3EB| STY.w $02E0
|08D3EE| STY.b $56
|08D3F0| BEQ .link_colors

.bunny_colors
|08D3F2| JSL RefreshEquipmentPalettes_bunny

|08D3F6| BRA .exit

.link_colors
|08D3F8| JSL RefreshEquipmentPalettes_sword_and_mail

.exit
|08D3FC| RTS

;===================================================================================================

AncillaDraw_LinkPoof:
|08D3FD| LDA.w $0FB3
|08D400| BEQ .use_default_oam_slots

|08D402| LDA.w $0C7C,X
|08D405| BEQ .use_default_oam_slots

|08D407| LDA.w $035F
|08D40A| BEQ .use_hardcoded_oam_slots

|08D40C| LDA.b $1A
|08D40E| AND.b #$01
|08D410| BNE .use_default_oam_slots

;---------------------------------------------------------------------------------------------------

.use_hardcoded_oam_slots
|08D412| REP #$20

|08D414| LDA.w #$00D0
|08D417| PHA

|08D418| CLC
|08D419| ADC.w #$0800
|08D41C| STA.b $90

|08D41E| PLA
|08D41F| LSR A
|08D420| LSR A
|08D421| CLC
|08D422| ADC.w #$0A20
|08D425| STA.b $92

|08D427| SEP #$20

;---------------------------------------------------------------------------------------------------

.use_default_oam_slots
|08D429| JSR Ancilla_PrepOAMCoord

|08D42C| REP #$20

|08D42E| LDA.b $00
|08D430| STA.b $04

|08D432| LDA.b $02
|08D434| STA.b $06

|08D436| SEP #$20

|08D438| PHX

|08D439| LDY.w $0C5E,X

|08D43C| LDA.w .size,Y
|08D43F| STA.b $08

|08D441| LDA.w .char,Y
|08D444| STA.b $0C

|08D446| TYA
|08D447| ASL A
|08D448| ASL A
|08D449| STA.b $0E

;---------------------------------------------------------------------------------------------------

|08D44B| LDY.b #$00
|08D44D| STY.b $0A

.next
|08D44F| LDA.b $0E
|08D451| CLC
|08D452| ADC.b $0A
|08D454| ASL A
|08D455| TAX

|08D456| REP #$20

|08D458| LDA.b $04
|08D45A| CLC
|08D45B| ADC.w .offset_y,X
|08D45E| STA.b $00

|08D460| LDA.b $06
|08D462| CLC
|08D463| ADC.w .offset_x,X
|08D466| STA.b $02

;---------------------------------------------------------------------------------------------------

|08D468| SEP #$20

|08D46A| JSR Ancilla_SetOAM_XY

|08D46D| LDA.b $0C
|08D46F| STA.b ($90),Y

|08D471| INY

|08D472| TXA
|08D473| LSR A
|08D474| TAX

|08D475| LDA.w .prop,X
|08D478| ORA.b #$04
|08D47A| ORA.b $65
|08D47C| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

|08D47E| INY
|08D47F| PHY

|08D480| TYA
|08D481| SEC
|08D482| SBC.b #$04
|08D484| LSR A
|08D485| LSR A
|08D486| TAY

|08D487| LDA.b $08
|08D489| STA.b ($92),Y

|08D48B| PLY

;---------------------------------------------------------------------------------------------------

|08D48C| CMP.b #$02
|08D48E| BEQ .exit

|08D490| INC.b $0A

|08D492| LDA.b $0A
|08D494| CMP.b #$04
|08D496| BNE .next

.exit
|08D498| PLX

|08D499| RTS

;===================================================================================================

Ancilla40_DwarfPoof:
|08D49A| DEC.w $03B1,X
|08D49D| BPL .draw

|08D49F| LDA.b #$07
|08D4A1| STA.w $03B1,X

|08D4A4| LDA.w $0C5E,X
|08D4A7| INC A
|08D4A8| STA.w $0C5E,X

|08D4AB| CMP.b #$03
|08D4AD| BNE .draw

|08D4AF| STZ.w $0C4A,X
|08D4B2| STZ.w $02F9

|08D4B5| RTS

.draw
|08D4B6| BRL AncillaDraw_LinkPoof

;===================================================================================================

pool Ancilla3F_BushPoof

.char
|08D4B9| db $86, $87, $96, $97
|08D4BD| db $A9, $A9, $A9, $A9
|08D4C1| db $8A, $8B, $9A, $9B
|08D4C5| db $9B, $9B, $9B, $9B

.prop
|08D4C9| db $00, $00, $00, $00
|08D4CD| db $00, $40, $80, $C0
|08D4D1| db $00, $00, $00, $00
|08D4D5| db $C0, $80, $40, $00

.offset_y_low
|08D4D9| db   0,   0,   8,   8
|08D4DD| db   0,   0,   8,   8
|08D4E1| db   0,   0,   8,   8
|08D4E5| db  -2,  -2,  10,  10

.offset_y_high
|08D4E9| db   0,   0,   0,   0
|08D4ED| db   0,   0,   0,   0
|08D4F1| db   0,   0,   0,   0
|08D4F5| db  -1,  -1,   0,   0

.offset_x_low
|08D4F9| db   0,   8,   0,   8
|08D4FD| db   0,   8,   0,   8
|08D501| db   0,   8,   0,   8
|08D505| db  -2,  10,  -2,  10

.offset_x_high
|08D509| db   0,   0,   0,   0
|08D50D| db   0,   0,   0,   0
|08D511| db   0,   0,   0,   0
|08D515| db  -1,   0,  -1,   0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla3F_BushPoof:
|08D519| LDA.w $0C68,X
|08D51C| BNE .draw

|08D51E| LDA.b #$07
|08D520| STA.w $0C68,X

|08D523| INC.w $0C5E,X

|08D526| LDA.w $0C5E,X
|08D529| CMP.b #$04
|08D52B| BNE .draw

|08D52D| STZ.w $0C4A,X

|08D530| RTS

;---------------------------------------------------------------------------------------------------

.draw
|08D531| LDA.b #$10
|08D533| JSL AllocateOAMInRegionC

|08D537| JSR Ancilla_PrepOAMCoord

|08D53A| LDA.b $00
|08D53C| STA.b $06

|08D53E| LDA.b $01
|08D540| STA.b $07
|08D542| STZ.b $08

;---------------------------------------------------------------------------------------------------

|08D544| LDY.b #$00

|08D546| LDA.w $0C5E,X
|08D549| ASL A
|08D54A| ASL A
|08D54B| TAX

.next
|08D54C| LDA.b $06
|08D54E| CLC
|08D54F| ADC.w .offset_y_low,X
|08D552| STA.b $00

|08D554| LDA.b $07
|08D556| ADC.w .offset_y_high,X
|08D559| STA.b $01

|08D55B| LDA.b $04
|08D55D| CLC
|08D55E| ADC.w .offset_x_low,X
|08D561| STA.b $02

|08D563| LDA.b $05
|08D565| ADC.w .offset_x_high,X
|08D568| STA.b $03

|08D56A| JSR Ancilla_SetOAM_XY

|08D56D| LDA.w .char,X
|08D570| STA.b ($90),Y

|08D572| INY

|08D573| LDA.w .prop,X
|08D576| ORA.b #$04
|08D578| ORA.b $65
|08D57A| STA.b ($90),Y

|08D57C| INY
|08D57D| PHY

|08D57E| TYA
|08D57F| SEC
|08D580| SBC.b #$04
|08D582| LSR A
|08D583| LSR A
|08D584| TAY

|08D585| LDA.b #$00
|08D587| STA.b ($92),Y

|08D589| PLY

|08D58A| INX

|08D58B| INC.b $08

|08D58D| LDA.b $08
|08D58F| CMP.b #$04
|08D591| BNE .next

;---------------------------------------------------------------------------------------------------

|08D593| BRL Ancilla_RestoreIndex

;===================================================================================================

pool Ancilla26_SwordSwingSparkle

.char
|08D596| db $B7, $B7, $FF
|08D599| db $80, $80, $B7
|08D59C| db $83, $83, $80
|08D59F| db $83, $FF, $FF

|08D5A2| db $B7, $B7, $FF
|08D5A5| db $80, $80, $B7
|08D5A8| db $83, $83, $80
|08D5AB| db $83, $FF, $FF

|08D5AE| db $B7, $B7, $FF
|08D5B1| db $80, $80, $B7
|08D5B4| db $83, $83, $80
|08D5B7| db $83, $FF, $FF

|08D5BA| db $B7, $B7, $FF
|08D5BD| db $80, $80, $B7
|08D5C0| db $83, $83, $80
|08D5C3| db $83, $FF, $FF

;---------------------------------------------------------------------------------------------------

.prop
|08D5C6| db $00, $00, $FF
|08D5C9| db $00, $00, $00
|08D5CC| db $80, $80, $00
|08D5CF| db $80, $FF, $FF

|08D5D2| db $00, $00, $FF
|08D5D5| db $00, $00, $00
|08D5D8| db $80, $80, $00
|08D5DB| db $80, $FF, $FF

|08D5DE| db $00, $00, $FF
|08D5E1| db $00, $00, $00
|08D5E4| db $80, $80, $00
|08D5E7| db $80, $FF, $FF

|08D5EA| db $00, $00, $FF
|08D5ED| db $00, $00, $00
|08D5F0| db $80, $80, $00
|08D5F3| db $80, $FF, $FF

;---------------------------------------------------------------------------------------------------

.offset_y
|08D5F6| db -22, -18,  -1
|08D5F9| db -22, -18, -17
|08D5FC| db -22, -18, -17
|08D5FF| db -17,  -1,  -1

|08D602| db  35,  40,  -1
|08D605| db  35,  40,  37
|08D608| db  35,  40,  37
|08D60B| db  37,  -1,  -1

|08D60E| db   2,   7,  -1
|08D611| db   2,   7,  19
|08D614| db   2,   7,  19
|08D617| db  19,  -1,  -1

|08D61A| db   2,   7,  -1
|08D61D| db   2,   7,  19
|08D620| db   2,   7,  19
|08D623| db  19,  -1,  -1

;---------------------------------------------------------------------------------------------------

.offset_x
|08D626| db   5,  10,  -1
|08D629| db   5,  10,  -4
|08D62C| db   5,  10,  -4
|08D62F| db  -4,  -1,  -1

|08D632| db   0,   5,  -1
|08D635| db   0,   5,  14
|08D638| db   0,   5,  14
|08D63B| db  14,  -1,  -1

|08D63E| db -23, -27,  -1
|08D641| db -23, -27, -22
|08D644| db -23, -27, -22
|08D647| db -22,  -1,  -1

|08D64A| db  32,  35,  -1
|08D64D| db  32,  35,  30
|08D650| db  32,  35,  30
|08D653| db  30,  -1,  -1

;---------------------------------------------------------------------------------------------------

.group_offset
|08D656| db $00
|08D657| db $0C
|08D658| db $18
|08D659| db $24

endpool

;---------------------------------------------------------------------------------------------------

Ancilla26_SwordSwingSparkle:
|08D65A| DEC.w $03B1,X
|08D65D| BPL .draw

|08D65F| LDA.b #$00
|08D661| STA.w $03B1,X

|08D664| INC.w $0C5E,X

|08D667| LDA.w $0C5E,X

|08D66A| CMP.b #$04
|08D66C| BNE .draw

|08D66E| STZ.w $0C4A,X

|08D671| RTS

;---------------------------------------------------------------------------------------------------

.draw
|08D672| PHX

|08D673| LDA.b $20
|08D675| STA.w $0BFA,X

|08D678| LDA.b $21
|08D67A| STA.w $0C0E,X

|08D67D| LDA.b $22
|08D67F| STA.w $0C04,X

|08D682| LDA.b $23
|08D684| STA.w $0C18,X

|08D687| JSR Ancilla_PrepOAMCoord

;---------------------------------------------------------------------------------------------------

|08D68A| REP #$20

|08D68C| LDA.b $00
|08D68E| STA.b $04

|08D690| LDA.b $02
|08D692| STA.b $06

|08D694| SEP #$20

|08D696| LDA.b #$02
|08D698| STA.b $08

|08D69A| LDY.w $0C72,X

|08D69D| LDA.w $0C5E,X
|08D6A0| ASL A
|08D6A1| CLC
|08D6A2| ADC.w $0C5E,X
|08D6A5| CLC
|08D6A6| ADC.w .group_offset,Y
|08D6A9| TAX

;---------------------------------------------------------------------------------------------------

|08D6AA| LDY.b #$00

.next
|08D6AC| LDA.w .char,X
|08D6AF| CMP.b #$FF
|08D6B1| BEQ .skip

|08D6B3| REP #$20

|08D6B5| LDA.w .offset_y,X
|08D6B8| AND.w #$00FF
|08D6BB| CMP.w #$0080
|08D6BE| BCC .positive_y

|08D6C0| ORA.w #$FF00

.positive_y
|08D6C3| CLC
|08D6C4| ADC.b $04
|08D6C6| STA.b $00

|08D6C8| LDA.w .offset_x,X
|08D6CB| AND.w #$00FF
|08D6CE| CMP.w #$0080
|08D6D1| BCC .positive_x

|08D6D3| ORA.w #$FF00

.positive_x
|08D6D6| CLC
|08D6D7| ADC.b $06
|08D6D9| STA.b $02

;---------------------------------------------------------------------------------------------------

|08D6DB| SEP #$20

|08D6DD| JSR Ancilla_SetOAM_XY

|08D6E0| LDA.w .char,X
|08D6E3| STA.b ($90),Y

|08D6E5| INY

|08D6E6| LDA.w .prop,X
|08D6E9| ORA.b #$04
|08D6EB| ORA.b $65
|08D6ED| STA.b ($90),Y

|08D6EF| INY
|08D6F0| PHY

|08D6F1| TYA
|08D6F2| SEC
|08D6F3| SBC.b #$04
|08D6F5| LSR A
|08D6F6| LSR A
|08D6F7| TAY

|08D6F8| LDA.b #$00
|08D6FA| STA.b ($92),Y

|08D6FC| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08D6FD| INX

|08D6FE| DEC.b $08
|08D700| BPL .next

;---------------------------------------------------------------------------------------------------

|08D702| PLX

|08D703| RTS

;===================================================================================================

pool Ancilla2A_SpinAttackSparkleA

.timer
|08D704| db   4
|08D705| db   2
|08D706| db   3
|08D707| db   3
|08D708| db   2
|08D709| db   1

.char
|08D70A| db $92, $FF, $FF, $FF
|08D70E| db $8C, $8C, $8C, $8C
|08D712| db $D6, $D6, $D6, $D6
|08D716| db $93, $93, $93, $93
|08D71A| db $D6, $D6, $D6, $D6
|08D71E| db $D7, $FF, $FF, $FF
|08D722| db $80, $FF, $FF, $FF

.prop
|08D726| db $22, $FF, $FF, $FF
|08D72A| db $22, $62, $A2, $E2
|08D72E| db $24, $64, $A4, $E4
|08D732| db $22, $62, $A2, $E2
|08D736| db $22, $62, $A2, $E2
|08D73A| db $22, $FF, $FF, $FF
|08D73E| db $22, $FF, $FF, $FF

.offset_y
|08D742| dw  -4,   0,   0,   0
|08D74A| dw  -8,  -8,   0,   0
|08D752| dw  -8,  -8,   0,   0
|08D75A| dw  -8,  -8,   0,   0
|08D762| dw  -8,  -8,   0,   0
|08D76A| dw  -4,   0,   0,   0
|08D772| dw  -4,   0,   0,   0

.offset_x
|08D77A| dw  -4,   0,   0,   0
|08D782| dw  -8,   0,  -8,   0
|08D78A| dw  -8,   0,  -8,   0
|08D792| dw  -8,   0,  -8,   0
|08D79A| dw  -8,   0,  -8,   0
|08D7A2| dw  -4,   0,   0,   0
|08D7AA| dw  -4,   0,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla2A_SpinAttackSparkleA:
|08D7B2| LDA.b $11
|08D7B4| BNE .just_draw

|08D7B6| DEC.w $03B1,X
|08D7B9| BPL .just_draw

|08D7BB| STZ.w $03B1,X

|08D7BE| LDA.w $0C68,X
|08D7C1| BNE .just_draw

|08D7C3| LDA.w $0C5E,X
|08D7C6| INC A
|08D7C7| STA.w $0C5E,X

|08D7CA| TAY

|08D7CB| LDA.w .timer,Y
|08D7CE| STA.w $0C68,X

|08D7D1| CPY.b #$05
|08D7D3| BNE .just_draw

|08D7D5| LDA.w $0C54,X
|08D7D8| BNE .add_beam

|08D7DA| BRL SpinAttackSparkleA_TransmuteToNextSpark

.add_beam
|08D7DD| JSL AncillaAdd_SwordBeam

|08D7E1| RTS

;---------------------------------------------------------------------------------------------------

.just_draw
|08D7E2| LDA.w $0C5E,X
|08D7E5| BEQ .exit

|08D7E7| JSR Ancilla_PrepOAMCoord

|08D7EA| REP #$20

|08D7EC| LDA.b $00
|08D7EE| STA.b $06

|08D7F0| LDA.b $02
|08D7F2| STA.b $08

|08D7F4| SEP #$20

|08D7F6| PHX

|08D7F7| LDY.b #$00
|08D7F9| STY.b $04

|08D7FB| LDA.w $0C5E,X
|08D7FE| DEC A
|08D7FF| ASL A
|08D800| ASL A
|08D801| TAX

;===================================================================================================

#AncillaDraw_SpinningSpark:
.next
|08D802| LDA.w .char,X
|08D805| CMP.b #$FF
|08D807| BEQ .skip

|08D809| REP #$20

|08D80B| PHX

|08D80C| TXA
|08D80D| ASL A
|08D80E| TAX

|08D80F| LDA.b $06
|08D811| CLC
|08D812| ADC.w .offset_y,X
|08D815| STA.b $00

|08D817| LDA.b $08
|08D819| CLC
|08D81A| ADC.w .offset_x,X
|08D81D| STA.b $02

|08D81F| PLX

;---------------------------------------------------------------------------------------------------

|08D820| SEP #$20

|08D822| JSR Ancilla_SetOAM_XY

|08D825| LDA.w .char,X
|08D828| STA.b ($90),Y

|08D82A| INY

|08D82B| LDA.w .prop,X
|08D82E| AND.b #$CF
|08D830| ORA.b $65
|08D832| STA.b ($90),Y

|08D834| INY
|08D835| PHY

|08D836| TYA
|08D837| SEC
|08D838| SBC.b #$04
|08D83A| LSR A
|08D83B| LSR A
|08D83C| TAY

|08D83D| LDA.b #$00
|08D83F| STA.b ($92),Y

|08D841| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08D842| INX

|08D843| INC.b $04

|08D845| LDA.b $04
|08D847| AND.b #$03
|08D849| BNE .next

;---------------------------------------------------------------------------------------------------

|08D84B| PLX

.exit
|08D84C| RTS

;===================================================================================================

pool SpinAttackSparkleA_TransmuteToNextSpark

.rotation
|08D84D| db $21, $20, $1F, $1E ; up
|08D851| db $03, $02, $01, $00 ; down
|08D855| db $12, $11, $10, $0F ; left
|08D859| db $31, $30, $2F, $2E ; right

.offset_y
|08D85D| dw  28 ; up
|08D85F| dw  -2 ; down
|08D861| dw  24 ; left
|08D863| dw   6 ; right

.offset_x
|08D865| dw  -3 ; up
|08D867| dw  21 ; down
|08D869| dw  25 ; left
|08D86B| dw  -8 ; right

endpool

;---------------------------------------------------------------------------------------------------

SpinAttackSparkleA_TransmuteToNextSpark:
|08D86D| LDA.b #$2B ; ANCILLA 2B
|08D86F| STA.w $0C4A,X

|08D872| LDA.b $2F
|08D874| ASL A
|08D875| TAY

|08D876| LDA.w .rotation+0,Y
|08D879| STA.l $7F5800

|08D87D| LDA.w .rotation+1,Y
|08D880| STA.l $7F5801

|08D884| LDA.w .rotation+2,Y
|08D887| STA.l $7F5802

|08D88B| LDA.w .rotation+3,Y
|08D88E| STA.l $7F5803
|08D892| STA.l $7F5804

;---------------------------------------------------------------------------------------------------

|08D896| LDA.b #$02
|08D898| STA.w $03B1,X

|08D89B| LDA.b #$4C
|08D89D| STA.w $0C5E,X

|08D8A0| LDA.b #$08
|08D8A2| STA.w $039F,X

|08D8A5| STZ.w $0C54,X
|08D8A8| STZ.w $0385,X

|08D8AB| LDA.b #$FF
|08D8AD| STA.w $03A4,X

|08D8B0| LDA.b #$14
|08D8B2| STA.l $7F5808

;---------------------------------------------------------------------------------------------------

|08D8B6| LDY.b $2F

|08D8B8| REP #$20

|08D8BA| LDA.b $20
|08D8BC| CLC
|08D8BD| ADC.w #$000C
|08D8C0| STA.l $7F5810

|08D8C4| LDA.b $22
|08D8C6| CLC
|08D8C7| ADC.w #$0008
|08D8CA| STA.l $7F580E

|08D8CE| LDA.b $20
|08D8D0| CLC
|08D8D1| ADC.w .offset_y,Y
|08D8D4| STA.b $00

|08D8D6| LDA.b $22
|08D8D8| CLC
|08D8D9| ADC.w .offset_x,Y
|08D8DC| STA.b $02

;---------------------------------------------------------------------------------------------------

|08D8DE| SEP #$20

|08D8E0| LDA.b $00
|08D8E2| STA.w $0BFA,X

|08D8E5| LDA.b $01
|08D8E7| STA.w $0C0E,X

|08D8EA| LDA.b $02
|08D8EC| STA.w $0C04,X

|08D8EF| LDA.b $03
|08D8F1| STA.w $0C18,X

|08D8F4| BRA Ancilla2B_SpinAttackSparkleB

;===================================================================================================

pool Ancilla2B_SpinAttackSparkleB

.char
|08D8F6| db $D7, $B7, $80, $83

.extra_char
|08D8FA| db $B7, $80, $83

endpool

;---------------------------------------------------------------------------------------------------

Ancilla2B_SpinAttackSparkleB:
|08D8FD| LDA.w $0385,X
|08D900| BEQ .continue

|08D902| BRL SpinAttackSparkleB_Closer

.continue
|08D905| PHX

|08D906| LDA.b #$02
|08D908| STA.b $73

|08D90A| LDA.b $11
|08D90C| BNE .no_ai

|08D90E| LDY.b #$00

|08D910| LDA.w $0C5E,X
|08D913| SEC
|08D914| SBC.b #$03
|08D916| STA.w $0C5E,X

|08D919| CMP.b #$0D
|08D91B| BCS .dont_run_closer

|08D91D| PLX

|08D91E| LDA.b #$01
|08D920| STA.w $03B1,X
|08D923| STA.w $0385,X

|08D926| STZ.w $0C5E,X

|08D929| BRL SpinAttackSparkleB_Closer

;---------------------------------------------------------------------------------------------------

.dont_run_closer
|08D92C| CMP.b #$42
|08D92E| BCS .not_four

|08D930| LDY.b #$03
|08D932| BRA .set_count

.not_four
|08D934| CMP.b #$46
|08D936| BNE .not_two

|08D938| LDY.b #$01

.not_two
|08D93A| CMP.b #$43
|08D93C| BNE .set_count

|08D93E| LDY.b #$02

.set_count
|08D940| TYA
|08D941| STA.w $0C54,X

|08D944| DEC.w $03B1,X
|08D947| BPL .no_ai

|08D949| LDA.b #$04
|08D94B| STA.b $73

|08D94D| LDA.b #$02
|08D94F| STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.no_ai
|08D952| LDY.b #$00

|08D954| LDA.w $0C54,X
|08D957| TAX

.next_spark
|08D958| STX.b $72

|08D95A| LDA.b $11
|08D95C| BNE .no_rotate

|08D95E| LDA.l $7F5800,X
|08D962| CLC
|08D963| ADC.b #$04
|08D965| AND.b #$3F
|08D967| STA.l $7F5800,X

.no_rotate
|08D96B| PHX
|08D96C| PHY

|08D96D| LDA.l $7F5808
|08D971| STA.b $08

|08D973| LDA.l $7F5800,X
|08D977| JSR Ancilla_GetRadialProjection
|08D97A| JSL Sparkle_PrepOAMFromRadial

|08D97E| PLY

|08D97F| JSR Ancilla_SetOAM_XY

|08D982| LDX.b $72

|08D984| LDA.w .char,X
|08D987| STA.b ($90),Y

|08D989| INY

|08D98A| LDA.b $73
|08D98C| ORA.b $65
|08D98E| STA.b ($90),Y

|08D990| INY
|08D991| PHY

|08D992| TYA
|08D993| SEC
|08D994| SBC.b #$04
|08D996| LSR A
|08D997| LSR A
|08D998| TAY

|08D999| LDA.b #$00
|08D99B| STA.b ($92),Y

|08D99D| PLY
|08D99E| PLX
|08D99F| DEX
|08D9A0| BPL .next_spark

;---------------------------------------------------------------------------------------------------

|08D9A2| PLX
|08D9A3| PHX

|08D9A4| LDA.b $11
|08D9A6| BNE .skip_extra_logic

|08D9A8| DEC.w $039F,X
|08D9AB| BPL .delay_extra

|08D9AD| LDA.b #$00
|08D9AF| STA.w $039F,X

|08D9B2| LDA.w $03A4,X
|08D9B5| INC A
|08D9B6| AND.b #$03
|08D9B8| STA.w $03A4,X

|08D9BB| CMP.b #$03
|08D9BD| BNE .skip_extra_logic

|08D9BF| LDA.l $7F5804
|08D9C3| CLC
|08D9C4| ADC.b #$09
|08D9C6| AND.b #$3F
|08D9C8| STA.l $7F5804

;---------------------------------------------------------------------------------------------------

.skip_extra_logic
|08D9CC| LDA.w $03A4,X
|08D9CF| STA.b $72

|08D9D1| CMP.b #$03
|08D9D3| BEQ .delay_extra

|08D9D5| PHY

|08D9D6| LDA.l $7F5808
|08D9DA| STA.b $08

|08D9DC| LDA.l $7F5804
|08D9E0| JSR Ancilla_GetRadialProjection
|08D9E3| JSL Sparkle_PrepOAMFromRadial

|08D9E7| PLY

|08D9E8| JSR Ancilla_SetOAM_XY

|08D9EB| LDX.b $72

|08D9ED| LDA.w .extra_char,X
|08D9F0| STA.b ($90),Y

|08D9F2| INY

|08D9F3| LDA.b #$04
|08D9F5| ORA.b $65
|08D9F7| STA.b ($90),Y

|08D9F9| INY
|08D9FA| TYA
|08D9FB| SEC
|08D9FC| SBC.b #$04

|08D9FE| LSR A
|08D9FF| LSR A
|08DA00| TAY

|08DA01| LDA.b #$00
|08DA03| STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

.delay_extra
|08DA05| PLX
|08DA06| PHX

|08DA07| LDA.w $0C5E,X
|08DA0A| TAX

|08DA0B| CPX.b #$07
|08DA0D| BNE .exit

|08DA0F| LDY.b #$03

|08DA11| LDA.b #$01
|08DA13| STA.b ($92),Y

.exit
|08DA15| PLX

|08DA16| RTS

;===================================================================================================

Sparkle_PrepOAMFromRadial:
|08DA17| REP #$20

|08DA19| LDA.b $00

|08DA1B| LDY.b $02
|08DA1D| BEQ .positive_y

|08DA1F| EOR.w #$FFFF
|08DA22| INC A

.positive_y
|08DA23| CLC
|08DA24| ADC.l $7F5810
|08DA28| CLC
|08DA29| ADC.w #$FFFC
|08DA2C| SEC
|08DA2D| SBC.b $E8
|08DA2F| STA.b $00

|08DA31| LDA.b $04

|08DA33| LDY.b $06
|08DA35| BEQ .positive_x

|08DA37| EOR.w #$FFFF
|08DA3A| INC A

.positive_x
|08DA3B| CLC
|08DA3C| ADC.l $7F580E
|08DA40| CLC
|08DA41| ADC.w #$FFFC
|08DA44| SEC
|08DA45| SBC.b $E2
|08DA47| STA.b $02

|08DA49| SEP #$20

|08DA4B| RTL

;===================================================================================================

SpinAttackSparkleB_Closer:
|08DA4C| DEC.w $03B1,X
|08DA4F| BPL .delay

|08DA51| LDA.b #$01
|08DA53| STA.w $03B1,X

|08DA56| LDA.w $0C5E,X
|08DA59| INC A
|08DA5A| STA.w $0C5E,X

|08DA5D| CMP.b #$03
|08DA5F| BNE .delay

|08DA61| STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

.delay
|08DA64| JSR Ancilla_PrepOAMCoord

|08DA67| REP #$20

|08DA69| LDA.b $00
|08DA6B| STA.b $06

|08DA6D| LDA.b $02
|08DA6F| STA.b $08

|08DA71| SEP #$20

|08DA73| PHX

|08DA74| LDY.b #$00
|08DA76| STY.b $04

|08DA78| LDA.w $0C5E,X
|08DA7B| CLC
|08DA7C| ADC.b #$04

|08DA7E| ASL A
|08DA7F| ASL A
|08DA80| TAX

|08DA81| BRL AncillaDraw_SpinningSpark

;===================================================================================================

pool Ancilla30_ByrnaWindupSpark

.char
|08DA84| db $92, $FF, $FF, $FF
|08DA88| db $8C, $8C, $8C, $8C
|08DA8C| db $D6, $D6, $D6, $D6
|08DA90| db $93, $93, $93, $93

.prop
|08DA94| db $22, $FF, $FF, $FF
|08DA98| db $22, $62, $A2, $E2
|08DA9C| db $24, $64, $A4, $E4
|08DAA0| db $22, $62, $A2, $E2

.offset_y
|08DAA4| dw  -4,   0,   0,   0
|08DAAC| dw  -8,  -8,   0,   0
|08DAB4| dw  -8,  -8,   0,   0
|08DABC| dw  -8,  -8,   0,   0

.offset_x
|08DAC4| dw  -4,   0,   0,   0
|08DACC| dw  -8,   0,  -8,   0
|08DAD4| dw  -8,   0,  -8,   0
|08DADC| dw  -8,   0,  -8,   0

.offset_link_y
|08DAE4| dw   5,   0,  -3,  -6
|08DAEC| dw  -8,  -3,  12,  28
|08DAF4| dw   5,   0,   8,  16
|08DAFC| dw   5,   0,   8,  16

.offset_link_x
|08DB04| dw   3,   1,   0,   0
|08DB0C| dw  13,  16,  12,  12
|08DB14| dw  24,   7,  -4, -10
|08DB1C| dw  -8,   9,  22,  26

endpool

;---------------------------------------------------------------------------------------------------

Ancilla30_ByrnaWindupSpark:
|08DB24| LDA.b $11
|08DB26| BNE .delay

|08DB28| DEC.w $03B1,X
|08DB2B| BPL .delay

|08DB2D| LDA.b #$01
|08DB2F| STA.w $03B1,X

|08DB32| LDA.w $0C5E,X
|08DB35| INC A
|08DB36| STA.w $0C5E,X

|08DB39| CMP.b #$11
|08DB3B| BNE .delay

|08DB3D| BRL ByrnaWindupSpark_TransmuteToNormal

.delay
|08DB40| LDA.w $0C5E,X
|08DB43| BNE .active

|08DB45| BRL .exit

;---------------------------------------------------------------------------------------------------

.active
|08DB48| LDA.b $2F
|08DB4A| ASL A
|08DB4B| ASL A
|08DB4C| STA.b $00

|08DB4E| LDA.w $0300
|08DB51| CMP.b #$02
|08DB53| BNE .not_final_pose

|08DB55| TAY

|08DB56| LDA.w $039F,X
|08DB59| DEC A
|08DB5A| BPL .not_final_chars

|08DB5C| LDA.b #$00
|08DB5E| LDY.b #$03

.not_final_chars
|08DB60| STA.w $039F,X

|08DB63| TYA

.not_final_pose
|08DB64| ASL A
|08DB65| CLC
|08DB66| ADC.b $00
|08DB68| TAY

;---------------------------------------------------------------------------------------------------

|08DB69| REP #$20

|08DB6B| LDA.w .offset_link_y,Y
|08DB6E| CLC
|08DB6F| ADC.b $20
|08DB71| STA.b $00

|08DB73| LDA.w .offset_link_x,Y
|08DB76| CLC
|08DB77| ADC.b $22
|08DB79| STA.b $02

|08DB7B| SEP #$20

|08DB7D| LDA.b $00
|08DB7F| STA.w $0BFA,X

|08DB82| LDA.b $01
|08DB84| STA.w $0C0E,X

|08DB87| LDA.b $02
|08DB89| STA.w $0C04,X

|08DB8C| LDA.b $03
|08DB8E| STA.w $0C18,X

|08DB91| JSR Ancilla_PrepOAMCoord

|08DB94| REP #$20

|08DB96| LDA.b $00
|08DB98| STA.b $06

|08DB9A| LDA.b $02
|08DB9C| STA.b $08

|08DB9E| SEP #$20

|08DBA0| PHX

|08DBA1| STZ.b $0A

|08DBA3| LDA.w $0C5E,X
|08DBA6| DEC A
|08DBA7| AND.b #$0F
|08DBA9| BEQ .start_oam

|08DBAB| CMP.b #$0F
|08DBAD| BEQ .use_last_group

|08DBAF| AND.b #$01
|08DBB1| INC A
|08DBB2| STA.b $0A

|08DBB4| BRA .start_oam

.use_last_group
|08DBB6| LDA.b #$03
|08DBB8| STA.b $0A

.start_oam
|08DBBA| LDA.b $0A
|08DBBC| ASL A
|08DBBD| ASL A
|08DBBE| TAX

;---------------------------------------------------------------------------------------------------

|08DBBF| LDY.b #$00
|08DBC1| STY.b $04

.next_object
|08DBC3| LDA.w .char,X
|08DBC6| CMP.b #$FF
|08DBC8| BEQ .skip

|08DBCA| REP #$20

|08DBCC| PHX

|08DBCD| TXA
|08DBCE| ASL A
|08DBCF| TAX

|08DBD0| LDA.b $06
|08DBD2| CLC
|08DBD3| ADC.w .offset_y,X
|08DBD6| STA.b $00

|08DBD8| LDA.b $08
|08DBDA| CLC
|08DBDB| ADC.w .offset_x,X
|08DBDE| STA.b $02

|08DBE0| PLX

|08DBE1| SEP #$20

|08DBE3| JSR Ancilla_SetOAM_XY

|08DBE6| LDA.w .char,X
|08DBE9| STA.b ($90),Y

|08DBEB| INY

|08DBEC| LDA.w .prop,X
|08DBEF| AND.b #$CF
|08DBF1| ORA.b $65
|08DBF3| STA.b ($90),Y

|08DBF5| INY
|08DBF6| PHY

|08DBF7| TYA
|08DBF8| SEC
|08DBF9| SBC.b #$04
|08DBFB| LSR A
|08DBFC| LSR A
|08DBFD| TAY

|08DBFE| LDA.b #$00
|08DC00| STA.b ($92),Y

|08DC02| PLY

;---------------------------------------------------------------------------------------------------

.skip
|08DC03| INX

|08DC04| INC.b $04

|08DC06| LDA.b $04
|08DC08| AND.b #$03
|08DC0A| BNE .next_object

|08DC0C| PLX

;---------------------------------------------------------------------------------------------------

.exit
|08DC0D| RTS

;===================================================================================================

pool ByrnaWindupSpark_TransmuteToNormal

.rotation
|08DC0E| db $34, $33, $32, $31 ; up
|08DC12| db $16, $15, $14, $13 ; down
|08DC16| db $2A, $29, $28, $27 ; left
|08DC1A| db $10, $0F, $0E, $0D ; right

endpool

;===================================================================================================

ByrnaMagicCost:
|08DC1E| db $04, $02, $01

;===================================================================================================

ByrnaWindupSpark_TransmuteToNormal:
|08DC21| LDA.b #$31 ; ANCILLA 31
|08DC23| STA.w $0C4A,X

|08DC26| LDA.b $2F
|08DC28| ASL A
|08DC29| TAY

|08DC2A| LDA.w .rotation+0,Y
|08DC2D| STA.l $7F5800

|08DC31| LDA.w .rotation+1,Y
|08DC34| STA.l $7F5801

|08DC38| LDA.w .rotation+2,Y
|08DC3B| STA.l $7F5802

|08DC3F| LDA.w .rotation+3,Y
|08DC42| STA.l $7F5803

|08DC46| LDA.b #$17
|08DC48| STA.w $03B1,X

|08DC4B| STZ.w $0394,X
|08DC4E| STZ.w $0C5E,X

|08DC51| LDA.b #$08
|08DC53| STA.w $039F,X

|08DC56| STZ.w $0C54,X
|08DC59| STZ.w $0385,X

|08DC5C| LDA.b #$02
|08DC5E| STA.w $03A4,X

|08DC61| LDA.b #$15
|08DC63| STA.w $0C68,X

|08DC66| DEC A
|08DC67| STA.l $7F5808

|08DC6B| LDA.b #$30 ; SFX3.30
|08DC6D| JSR Ancilla_SFX3_Near

;===================================================================================================

Ancilla31_ByrnaSpark:
|08DC70| PHX

|08DC71| LDA.b #$02
|08DC73| STA.b $73

|08DC75| LDA.b $11
|08DC77| BEQ .continue

|08DC79| BRL ByrnaSpark_Animate

.continue
|08DC7C| LDA.w $0303
|08DC7F| CMP.b #$0D
|08DC81| BNE .terminate

|08DC83| LDA.b #$01
|08DC85| STA.w $037B

|08DC88| DEC.w $03B1,X

|08DC8B| LDA.w $03B1,X
|08DC8E| BNE .keep_sparkling

|08DC90| LDA.b #$01
|08DC92| STA.w $03B1,X

|08DC95| LDA.l $7EF37B
|08DC99| TAY

|08DC9A| LDA.w ByrnaMagicCost,Y
|08DC9D| STA.b $00

|08DC9F| LDA.l $7EF36E
|08DCA3| BEQ .terminate

|08DCA5| SEC
|08DCA6| SBC.b $00
|08DCA8| CMP.b #$80
|08DCAA| BCS .terminate

|08DCAC| STA.b $00

|08DCAE| DEC.w $0394,X
|08DCB1| BPL .delay_sap

|08DCB3| LDA.b #$17
|08DCB5| STA.w $0394,X

|08DCB8| LDA.b $00
|08DCBA| STA.l $7EF36E

.delay_sap
|08DCBE| BIT.b $F4
|08DCC0| BVC .keep_sparkling

;---------------------------------------------------------------------------------------------------

.terminate
|08DCC2| PLX

|08DCC3| STZ.w $037B

|08DCC6| STZ.w $0C4A,X

|08DCC9| STZ.w $0373

|08DCCC| RTS

;---------------------------------------------------------------------------------------------------

.keep_sparkling
|08DCCD| LDA.w $0C54,X
|08DCD0| CMP.b #$03
|08DCD2| BEQ .all_sparks

|08DCD4| LDY.b #$00

|08DCD6| INC.w $0C5E,X

|08DCD9| LDA.w $0C5E,X
|08DCDC| CMP.b #$04
|08DCDE| BCC .not_all_sparks

|08DCE0| LDY.b #$03
|08DCE2| BRA .set_spark_count

.not_all_sparks
|08DCE4| CMP.b #$02
|08DCE6| BNE .not_two

|08DCE8| LDY.b #$01

.not_two
|08DCEA| CMP.b #$03
|08DCEC| BNE .set_spark_count

|08DCEE| LDY.b #$02

.set_spark_count
|08DCF0| TYA
|08DCF1| STA.w $0C54,X

.all_sparks
|08DCF4| DEC.w $03A4,X
|08DCF7| BPL ByrnaSpark_Animate

|08DCF9| LDA.b #$02
|08DCFB| STA.w $03A4,X

|08DCFE| LDA.b #$04
|08DD00| STA.b $73

;===================================================================================================

ByrnaSpark_Animate:
|08DD02| REP #$20

|08DD04| LDA.b $24
|08DD06| AND.w #$00FF
|08DD09| CMP.w #$0080
|08DD0C| BCC .positive_z

|08DD0E| ORA.w #$FF00

.positive_z
|08DD11| CMP.w #$FFFF
|08DD14| BNE .nonzero_z

|08DD16| LDA.w #$0000

.nonzero_z
|08DD19| EOR.w #$FFFF
|08DD1C| INC A

|08DD1D| CLC
|08DD1E| ADC.b $20

|08DD20| CLC
|08DD21| ADC.w #$000C
|08DD24| STA.l $7F5810

|08DD28| LDA.b $22
|08DD2A| CLC
|08DD2B| ADC.w #$0008
|08DD2E| STA.l $7F580E

;---------------------------------------------------------------------------------------------------

|08DD32| SEP #$20

|08DD34| LDA.w $0C68,X
|08DD37| BNE .skip_sfx

|08DD39| LDA.b #$15
|08DD3B| STA.w $0C68,X

|08DD3E| LDA.b #$30 ; SFX3.30
|08DD40| JSR Ancilla_SFX3_Near

.skip_sfx
|08DD43| STX.b $74

|08DD45| LDY.b #$00

|08DD47| LDA.w $0C54,X
|08DD4A| TAX

;---------------------------------------------------------------------------------------------------

.next_object
|08DD4B| STX.b $72

|08DD4D| LDA.b $11
|08DD4F| BNE .dont_inc_sparkle

|08DD51| LDA.l $7F5800,X
|08DD55| CLC
|08DD56| ADC.b #$03
|08DD58| AND.b #$3F
|08DD5A| STA.l $7F5800,X

.dont_inc_sparkle
|08DD5E| PHX
|08DD5F| PHY

|08DD60| LDA.l $7F5808
|08DD64| STA.b $08

|08DD66| LDA.l $7F5800,X
|08DD6A| JSR Ancilla_GetRadialProjection
|08DD6D| JSL Sparkle_PrepOAMFromRadial

|08DD71| PLY

|08DD72| JSR Ancilla_SetOAM_XY

|08DD75| LDX.b $72

|08DD77| LDA.w Ancilla2B_SpinAttackSparkleB.char,X
|08DD7A| STA.b ($90),Y

|08DD7C| INY

|08DD7D| LDA.b $73
|08DD7F| ORA.b $65
|08DD81| STA.b ($90),Y

|08DD83| INY
|08DD84| PHY

|08DD85| TYA
|08DD86| SEC
|08DD87| SBC.b #$04
|08DD89| LSR A
|08DD8A| LSR A
|08DD8B| TAY

|08DD8C| LDA.b #$00
|08DD8E| STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

|08DD90| REP #$20

|08DD92| LDA.b $00
|08DD94| CLC
|08DD95| ADC.b $E8
|08DD97| STA.b $04

|08DD99| LDA.b $02
|08DD9B| CLC
|08DD9C| ADC.b $E2
|08DD9E| STA.b $06

|08DDA0| SEP #$20

|08DDA2| LDX.b $74

|08DDA4| LDA.b $04
|08DDA6| STA.w $0BFA,X

|08DDA9| LDA.b $05
|08DDAB| STA.w $0C0E,X

|08DDAE| LDA.b $06
|08DDB0| STA.w $0C04,X

|08DDB3| LDA.b $07
|08DDB5| STA.w $0C18,X

|08DDB8| STZ.w $0C72,X

|08DDBB| JSR Ancilla_CheckSpriteCollision

|08DDBE| PLY

|08DDBF| PLX
|08DDC0| DEX
|08DDC1| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08DDC3| PLX

|08DDC4| RTS

;===================================================================================================

Ancilla0C_SwordBeam_bounce:
|08DDC5| JSL Ancilla0C_SwordBeam

|08DDC9| RTS

;===================================================================================================

Ancilla0D_SpinAttackFullChargeSpark:
|08DDCA| LDA.b #$04
|08DDCC| JSR AllocateOAMInRegionsADF

|08DDCF| TYA
|08DDD0| STA.w $0C86,X

|08DDD3| JSL Ancilla0D_SpinAttackFullChargeSpark_long

|08DDD7| RTS

;===================================================================================================

pool Ancilla27_Duck CutsceneDuck_Draw

.char
|08DDD8| db $0E, $00, $02

.prop
|08DDDB| db $22, $2E, $2E

.offset_y
|08DDDE| db   0,  12,  20

.offset_x
|08DDE1| db   0,  -9,  -9

.vram_offset
|08DDE4| db $00, $20, $40, $E0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla27_Duck:
|08DDE8| LDA.b $11
|08DDEA| BEQ .continue

|08DDEC| BRL .animate

.continue
|08DDEF| LDA.w $0C68,X
|08DDF2| BEQ .seek_link

|08DDF4| REP #$20

|08DDF6| LDA.b $20
|08DDF8| SEC
|08DDF9| SBC.w #$0008
|08DDFC| STA.b $00

|08DDFE| LDA.w #$FFF0
|08DE01| CLC
|08DE02| ADC.b $E2
|08DE04| STA.b $02

|08DE06| SEP #$20

|08DE08| LDA.b $00
|08DE0A| STA.w $0BFA,X

|08DE0D| LDA.b $01
|08DE0F| STA.w $0C0E,X

|08DE12| LDA.b $02
|08DE14| STA.w $0C04,X

|08DE17| LDA.b $03
|08DE19| STA.w $0C18,X

|08DE1C| RTS

;---------------------------------------------------------------------------------------------------

.seek_link
|08DE1D| DEC.w $0394,X
|08DE20| BPL .delay_flap_sfx

|08DE22| LDA.b #$28
|08DE24| STA.w $0394,X

|08DE27| LDA.b #$1E ; SFX3.1E
|08DE29| JSR Ancilla_SFX3_Pan

;---------------------------------------------------------------------------------------------------

.delay_flap_sfx
|08DE2C| LDY.w $0385,X
|08DE2F| BNE .swoop_down

|08DE31| LDA.w $0C54,X
|08DE34| BEQ .maintain_altitude

|08DE36| INC.w $0FC1

.swoop_down
|08DE39| LDA.w $0294,X
|08DE3C| CLC
|08DE3D| ADC.b #$FF
|08DE3F| STA.w $0294,X

|08DE42| JSR AncillaMoveZ

.maintain_altitude
|08DE45| JSR AncillaMoveX

|08DE48| LDA.w $0385,X
|08DE4B| BEQ .picking_up

|08DE4D| BRL .dropping_off

;---------------------------------------------------------------------------------------------------

.dont_pick_up
|08DE50| BRL .continue_from_pickup

.picking_up
|08DE53| LDY.b #$01
|08DE55| JSR Ancilla_CheckLinkCollision
|08DE58| BCC .dont_pick_up

|08DE5A| LDA.b $10
|08DE5C| CMP.b #$0F
|08DE5E| BEQ .dont_pick_up

|08DE60| LDA.b $1B
|08DE62| BNE .continue_the_pick

|08DE64| LDA.b $5D
|08DE66| CMP.b #$0A ; LINKSTATE 0A
|08DE68| BEQ .dont_pick_up

|08DE6A| CMP.b #$09 ; LINKSTATE 09
|08DE6C| BEQ .dont_pick_up

|08DE6E| CMP.b #$08 ; LINKSTATE 08
|08DE70| BEQ .dont_pick_up

|08DE72| LDA.b $5B
|08DE74| CMP.b #$02
|08DE76| BEQ .dont_pick_up

|08DE78| LDA.w $02DA
|08DE7B| ORA.w $037E
|08DE7E| ORA.w $03EF
|08DE81| ORA.w $037B
|08DE84| BNE .dont_pick_up

|08DE86| BIT.w $0308
|08DE89| BMI .dont_pick_up

;---------------------------------------------------------------------------------------------------

|08DE8B| PHX

|08DE8C| LDX.b #$04

.next_ancilla_delete
|08DE8E| LDA.w $0C4A,X
|08DE91| CMP.b #$2A ; ANCILLA 2A
|08DE93| BEQ .delete_ancilla

|08DE95| CMP.b #$1F ; ANCILLA 1F
|08DE97| BEQ .delete_ancilla

|08DE99| CMP.b #$30 ; ANCILLA 30
|08DE9B| BEQ .delete_ancilla

|08DE9D| CMP.b #$31 ; ANCILLA 31
|08DE9F| BEQ .delete_ancilla

|08DEA1| CMP.b #$41 ; ANCILLA 41
|08DEA3| BNE .dont_delete_ancilla

.delete_ancilla
|08DEA5| STZ.w $0C4A,X

.dont_delete_ancilla
|08DEA8| DEX
|08DEA9| BPL .next_ancilla_delete

|08DEAB| PLX

;---------------------------------------------------------------------------------------------------

|08DEAC| LDA.l $7EF3CC
|08DEB0| CMP.b #$09 ; FOLLOWER 09
|08DEB2| BNE .continue_the_pick

|08DEB4| LDA.b #$00
|08DEB6| STA.l $7EF3CC
|08DEBA| STA.w $02F9

.continue_the_pick
|08DEBD| REP #$20

|08DEBF| STZ.w $0308
|08DEC2| STZ.w $011A
|08DEC5| STZ.w $011C

|08DEC8| SEP #$20

|08DECA| JSL ResetLinkProperties_A

|08DECE| STZ.w $0345
|08DED1| STZ.w $03F8

|08DED4| LDA.b #$0C
|08DED6| STA.b $4B

|08DED8| LDA.b #$00 ; LINKSTATE 00
|08DEDA| STA.b $5D

|08DEDC| INC A
|08DEDD| STA.w $02DA
|08DEE0| STA.w $02E4
|08DEE3| STA.w $037B
|08DEE6| STA.w $02F9

|08DEE9| INC A
|08DEEA| STA.w $0C54,X

|08DEED| INC.w $0FC1

|08DEF0| STZ.w $0373

|08DEF3| LDA.b $1B
|08DEF5| BEQ .continue_from_pickup

|08DEF7| STA.w $03FD

.continue_from_pickup
|08DEFA| BRA .animate

;---------------------------------------------------------------------------------------------------

.dropping_off
|08DEFC| LDA.w $0C04,X
|08DEFF| STA.b $00

|08DF01| LDA.w $0C18,X
|08DF04| STA.b $01

|08DF06| LDA.w $0C54,X
|08DF09| BEQ .dont_freeze_npcs

|08DF0B| INC.w $0FC1

.dont_freeze_npcs
|08DF0E| REP #$20

|08DF10| LDA.b $00
|08DF12| BMI .delay_dropoff

|08DF14| CMP.b $22
|08DF16| BCC .delay_dropoff

;---------------------------------------------------------------------------------------------------

|08DF18| SEP #$20

|08DF1A| LDA.w $0C54,X
|08DF1D| BEQ .animate

|08DF1F| STZ.w $0C54,X

|08DF22| STZ.b $4B

|08DF24| STZ.w $02F9
|08DF27| STZ.w $02DA

|08DF2A| STZ.w $0C22,X

|08DF2D| STZ.w $02E4
|08DF30| STZ.w $037B
|08DF33| STZ.w $03FD

|08DF36| LDA.b #$90
|08DF38| STA.w $031F

|08DF3B| LDA.l $7EF3CC
|08DF3F| CMP.b #$0D ; FOLLOWER 0D
|08DF41| BEQ .check_followering

|08DF43| CMP.b #$0C ; FOLLOWER 0C
|08DF45| BNE .do_not_check

.check_followering
|08DF47| LDA.l $7EF3D3
|08DF4B| BNE .animate

.do_not_check
|08DF4D| JSL InitializeFollower
|08DF51| BRA .animate

.delay_dropoff
|08DF53| LDA.b $22
|08DF55| SEC
|08DF56| SBC.b $00
|08DF58| CMP.w #$0030
|08DF5B| BCS .animate

|08DF5D| LDY.b #$03

|08DF5F| SEP #$20

|08DF61| BRA .set_vram_offset

;---------------------------------------------------------------------------------------------------

.animate
|08DF63| SEP #$20

|08DF65| DEC.w $039F,X
|08DF68| BPL .delay_step

|08DF6A| LDA.b #$03
|08DF6C| STA.w $039F,X

|08DF6F| INC.w $0380,X

|08DF72| LDA.w $0380,X
|08DF75| CMP.b #$03
|08DF77| BNE .delay_step

|08DF79| STZ.w $0380,X

.delay_step
|08DF7C| LDY.w $0380,X

;---------------------------------------------------------------------------------------------------

.set_vram_offset
|08DF7F| LDA.w .vram_offset+0,Y
|08DF82| STA.w $0AF4

|08DF85| JSR Ancilla_PrepOAMCoord

|08DF88| REP #$20

|08DF8A| LDA.w $029E,X
|08DF8D| AND.w #$00FF
|08DF90| BEQ .positive_altitiude

|08DF92| ORA.w #$FF00

.positive_altitiude
|08DF95| STA.b $04
|08DF97| STA.b $72

|08DF99| LDA.b $00
|08DF9B| STA.b $0A

|08DF9D| CLC
|08DF9E| ADC.b $04
|08DFA0| STA.b $04

|08DFA2| LDA.b $02
|08DFA4| STA.b $06

;---------------------------------------------------------------------------------------------------

|08DFA6| SEP #$20

|08DFA8| PHX

|08DFA9| LDA.w $0C54,X

|08DFAC| INC A
|08DFAD| STA.b $08

|08DFAF| LDY.b #$00
|08DFB1| TYX

.next_object
|08DFB2| REP #$20

|08DFB4| LDA.w .offset_y,X
|08DFB7| AND.w #$00FF
|08DFBA| CMP.w #$0080
|08DFBD| BCC .positive_y

|08DFBF| ORA.w #$FF00

.positive_y
|08DFC2| CLC
|08DFC3| ADC.b $04
|08DFC5| STA.b $00

|08DFC7| LDA.w .offset_x,X
|08DFCA| AND.w #$00FF
|08DFCD| CMP.w #$0080
|08DFD0| BCC .positive_x

|08DFD2| ORA.w #$FF00

.positive_x
|08DFD5| CLC
|08DFD6| ADC.b $06
|08DFD8| STA.b $02

|08DFDA| SEP #$20

|08DFDC| JSR Ancilla_SetOAM_XY

|08DFDF| LDA.w .char,X
|08DFE2| STA.b ($90),Y

|08DFE4| INY

|08DFE5| LDA.w .prop,X
|08DFE8| ORA.b #$30
|08DFEA| STA.b ($90),Y

|08DFEC| INY
|08DFED| PHY

|08DFEE| TYA
|08DFEF| SEC
|08DFF0| SBC.b #$04
|08DFF2| LSR A
|08DFF3| LSR A
|08DFF4| TAY

|08DFF5| LDA.b #$02
|08DFF7| STA.b ($92),Y

|08DFF9| PLY

|08DFFA| INX
|08DFFB| CPX.b $08
|08DFFD| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08DFFF| REP #$20

|08E001| LDA.b $0A
|08E003| CLC
|08E004| ADC.w #$001C
|08E007| STA.b $00

|08E009| LDA.b $06
|08E00B| STA.b $02

|08E00D| SEP #$20

|08E00F| LDA.b #$30
|08E011| STA.b $04

|08E013| LDX.b #$01
|08E015| JSR AncillaDraw_Shadow

|08E018| LDX.w $0FA0

|08E01B| LDA.w $0C54,X
|08E01E| BEQ .no_link_shadow

|08E020| REP #$20

|08E022| LDA.b $0A
|08E024| CLC
|08E025| ADC.w #$001C
|08E028| STA.b $00

|08E02A| LDA.b $06
|08E02C| CLC
|08E02D| ADC.w #$FFF9
|08E030| STA.b $02

|08E032| SEP #$20

|08E034| LDA.b #$30
|08E036| STA.b $04

|08E038| LDX.b #$01
|08E03A| JSR AncillaDraw_Shadow

.no_link_shadow
|08E03D| PLX

;---------------------------------------------------------------------------------------------------

|08E03E| REP #$20

|08E040| LDA.b $06
|08E042| BMI .exit

|08E044| CMP.w #$0130
|08E047| BCC .exit

|08E049| SEP #$20

|08E04B| STZ.w $0C4A,X

|08E04E| LDA.w $0385,X
|08E051| BNE .exit

|08E053| LDA.w $0C54,X
|08E056| BEQ .exit

|08E058| LDA.b #$0A
|08E05A| STA.b $11

|08E05C| LDA.b $10
|08E05E| STA.w $010C

|08E061| LDA.b #$0E
|08E063| STA.b $10

;---------------------------------------------------------------------------------------------------

.exit
|08E065| SEP #$20

|08E067| RTS

;===================================================================================================

pool AncillaAdd_SomariaBlock

.offset_y
|08E068| dw  -8 ; up
|08E06A| dw  31 ; down
|08E06C| dw  17 ; left
|08E06E| dw  17 ; right

.offset_x
|08E070| dw   8 ; up
|08E072| dw   8 ; down
|08E074| dw  -8 ; left
|08E076| dw  23 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_SomariaBlock:
|08E078| PHB
|08E079| PHK
|08E07A| PLB

|08E07B| JSR AddAncilla_bank08
|08E07E| BCC .spawn_the_block

|08E080| BRL .refund

;---------------------------------------------------------------------------------------------------

.spawn_the_block
|08E083| PHX

|08E084| STX.b $00

|08E086| LDX.b #$04

.next_block_check
|08E088| CPX.b $00
|08E08A| BEQ .skip

|08E08C| LDA.w $0C4A,X
|08E08F| CMP.b #$2C ; ANCILLA 2C
|08E091| BNE .skip

;---------------------------------------------------------------------------------------------------

|08E093| STX.b $02

|08E095| LDA.w $02EC
|08E098| DEC A
|08E099| CMP.b $02
|08E09B| BNE .not_closest_carryable

|08E09D| STZ.w $02EC

.not_closest_carryable
|08E0A0| JSL AncillaAdd_ExplodingSomariaBlock

|08E0A4| PLX

|08E0A5| STZ.w $0C4A,X

|08E0A8| STZ.w $0646

|08E0AB| LDA.b $5E
|08E0AD| CMP.b #$12
|08E0AF| BNE .dont_reset_speed

|08E0B1| STZ.b $48
|08E0B3| STZ.b $5E

.dont_reset_speed
|08E0B5| BRL .exit

;---------------------------------------------------------------------------------------------------

.skip
|08E0B8| DEX
|08E0B9| BPL .next_block_check

;---------------------------------------------------------------------------------------------------

|08E0BB| PLX

|08E0BC| LDA.b #$2A ; SFX3.2A
|08E0BE| JSR Ancilla_SFX3_Near

|08E0C1| STZ.w $0C54,X

|08E0C4| STZ.w $0C22,X
|08E0C7| STZ.w $0C2C,X

|08E0CA| STZ.w $0C5E,X

|08E0CD| STZ.w $03B1,X
|08E0D0| STZ.w $039F,X
|08E0D3| STZ.w $03A4,X
|08E0D6| STZ.w $03C5,X

|08E0D9| LDA.b #$0C
|08E0DB| STA.w $0394,X

|08E0DE| LDA.b #$12
|08E0E0| STA.w $0C68,X

|08E0E3| STZ.w $0385,X
|08E0E6| STZ.w $029E,X

|08E0E9| STZ.w $0380,X
|08E0EC| STZ.w $03EA,X

|08E0EF| STZ.w $0BF0,X

|08E0F2| LDA.b #$09
|08E0F4| STA.w $03A9,X

|08E0F7| STZ.w $03D5,X

;---------------------------------------------------------------------------------------------------

|08E0FA| LDA.b $2F
|08E0FC| LSR A
|08E0FD| STA.w $0C72,X

|08E100| JSL Ancilla_CheckInitialTileCollision_Class2
|08E104| BCC .space_to_spawn

|08E106| REP #$20

|08E108| LDA.b $20
|08E10A| CLC
|08E10B| ADC.w #$0010
|08E10E| STA.b $00

|08E110| LDA.b $22
|08E112| CLC
|08E113| ADC.w #$0008
|08E116| STA.b $02

|08E118| SEP #$20

|08E11A| LDA.b $00
|08E11C| STA.w $0BFA,X

|08E11F| LDA.b $01
|08E121| STA.w $0C0E,X

|08E124| LDA.b $02
|08E126| STA.w $0C04,X

|08E129| LDA.b $03
|08E12B| STA.w $0C18,X

|08E12E| BRA .exit

;---------------------------------------------------------------------------------------------------

.space_to_spawn
|08E130| LDY.b $2F

|08E132| LDA.b $20
|08E134| CLC
|08E135| ADC.w .offset_y+0,Y
|08E138| STA.w $0BFA,X

|08E13B| LDA.b $21
|08E13D| ADC.w .offset_y+1,Y
|08E140| STA.w $0C0E,X

|08E143| LDA.b $22
|08E145| CLC
|08E146| ADC.w .offset_x+0,Y
|08E149| STA.w $0C04,X

|08E14C| LDA.b $23
|08E14E| ADC.w .offset_x+1,Y
|08E151| STA.w $0C18,X

|08E154| JSR SomariaBlock_CheckForTransitTile

|08E157| BRA .exit

;---------------------------------------------------------------------------------------------------

.refund
|08E159| LDX.b #$04
|08E15B| JSL RefundMagic

.exit
|08E15F| PLB

|08E160| RTL

;===================================================================================================

pool SomariaBlock_CheckForTransitTile

.offset_y
|08E161| dw -16, -16, -16,  16,  16,  16
|08E16D| dw  -8,   0,   8,  -8,   0,   8

.offset_x
|08E179| dw  -8,   0,   8,  -8,   0,   8
|08E185| dw -16, -16, -16,  16,  16,  16

endpool

;---------------------------------------------------------------------------------------------------

SomariaBlock_CheckForTransitTile:
|08E191| LDA.w $03F4
|08E194| BEQ .exit

|08E196| LDY.b #$16

.next
|08E198| LDA.w $0BFA,X
|08E19B| CLC
|08E19C| ADC.w .offset_y+0,Y
|08E19F| STA.b $00
|08E1A1| STA.b $72

|08E1A3| LDA.w $0C0E,X
|08E1A6| ADC.w .offset_y+1,Y
|08E1A9| STA.b $01
|08E1AB| STA.b $73

|08E1AD| LDA.w $0C04,X
|08E1B0| CLC
|08E1B1| ADC.w .offset_x+0,Y
|08E1B4| STA.b $02
|08E1B6| STA.b $74

|08E1B8| LDA.w $0C18,X
|08E1BB| ADC.w .offset_x+1,Y
|08E1BE| STA.b $03
|08E1C0| STA.b $75

|08E1C2| PHY

|08E1C3| LDA.w $0280,X
|08E1C6| PHA

|08E1C7| JSR Ancilla_CheckTileCollision_targeted

|08E1CA| PLA
|08E1CB| STA.w $0280,X

|08E1CE| PLY
|08E1CF| LDA.w $03E4,X

|08E1D2| CMP.b #$B6 ; TILETYPE B6
|08E1D4| BEQ .node

|08E1D6| CMP.b #$BC ; TILETYPE BC
|08E1D8| BEQ .node

|08E1DA| DEY
|08E1DB| DEY
|08E1DC| BPL .next

|08E1DE| BRA .exit

;---------------------------------------------------------------------------------------------------

.node
|08E1E0| LDA.b $72
|08E1E2| STA.w $0BFA,X

|08E1E5| LDA.b $73
|08E1E7| STA.w $0C0E,X

|08E1EA| LDA.b $74
|08E1EC| STA.w $0C04,X

|08E1EF| LDA.b $75
|08E1F1| STA.w $0C18,X

|08E1F4| JSL AncillaAdd_SomariaPlatformPoof

.exit
|08E1F8| RTS

;===================================================================================================

Ancilla_CheckBasicSpriteCollision:
|08E1F9| LDY.b #$0F

.next_sprite
|08E1FB| TYA
|08E1FC| EOR.b $1A
|08E1FE| AND.b #$03

|08E200| ORA.w $0F00,Y
|08E203| ORA.w $0EF0,Y
|08E206| BNE .skip

|08E208| LDA.w $0DD0,Y
|08E20B| CMP.b #$09
|08E20D| BCC .skip

|08E20F| LDA.w $0CAA,Y
|08E212| AND.b #$02
|08E214| BNE .sprite_ignores_priority

|08E216| LDA.w $0280,X
|08E219| BNE .skip

.sprite_ignores_priority
|08E21B| LDA.w $0C7C,X
|08E21E| CMP.w $0F20,Y
|08E221| BNE .skip

|08E223| LDA.w $0C4A,X
|08E226| CMP.b #$2C ; ANCILLA 2C
|08E228| BNE .not_somaria_block

|08E22A| LDA.w $0E20,Y
|08E22D| CMP.b #$1E ; SPRITE 1E
|08E22F| BEQ .skip

|08E231| CMP.b #$90 ; SPRITE 90
|08E233| BEQ .skip

.not_somaria_block
|08E235| JSR Ancilla_CheckBasicSpriteCollision_Single

.skip
|08E238| DEY
|08E239| BPL .next_sprite

|08E23B| CLC

|08E23C| RTS

;===================================================================================================

Ancilla_CheckBasicSpriteCollision_Single:
|08E23D| JSR Ancilla_SetupBasicHitbox

|08E240| PHY
|08E241| PHX

|08E242| TYX
|08E243| JSL SetupSpriteHitbox_long

|08E247| PLX
|08E248| PLY

|08E249| JSL CheckIfHitboxesOverlap_long
|08E24D| BCC .fail

|08E24F| LDA.w $0E20,Y
|08E252| CMP.b #$92 ; SPRITE 92
|08E254| BNE .not_king_helma

|08E256| LDA.w $0DB0,Y
|08E259| CMP.b #$03
|08E25B| BCC .success

.not_king_helma
|08E25D| LDA.w $0E20,Y
|08E260| CMP.b #$80 ; SPRITE 80
|08E262| BNE .dont_reverse_fire_snake

|08E264| LDA.w $0F10,Y
|08E267| BNE .dont_reverse_fire_snake

|08E269| LDA.b #$18
|08E26B| STA.w $0F10,Y

|08E26E| LDA.w $0DE0,Y
|08E271| EOR.b #$01
|08E273| STA.w $0DE0,Y

.dont_reverse_fire_snake
|08E276| LDA.w $0BA0,Y
|08E279| BNE .fail

|08E27B| LDA.w $0C04,X
|08E27E| SEC
|08E27F| SBC.b #$08
|08E281| STA.b $04

|08E283| LDA.w $0C18,X
|08E286| SBC.b #$00
|08E288| STA.b $05

|08E28A| LDA.w $0BFA,X
|08E28D| SEC
|08E28E| SBC.b #$08
|08E290| PHP

|08E291| SEC
|08E292| SBC.w $029E,X
|08E295| STA.b $06

|08E297| LDA.w $0C0E,X
|08E29A| SBC.b #$00

|08E29C| PLP
|08E29D| SBC.b #$00
|08E29F| STA.b $07

|08E2A1| LDA.b #$50

|08E2A3| PHY
|08E2A4| PHX

|08E2A5| TYX
|08E2A6| JSL ProjectSpriteSpeedTowardsLocation_long

|08E2AA| PLX
|08E2AB| PLY

|08E2AC| LDA.b $00
|08E2AE| EOR.b #$FF
|08E2B0| STA.w $0F30,Y

|08E2B3| LDA.b $01
|08E2B5| EOR.b #$FF
|08E2B7| STA.w $0F40,Y

|08E2BA| PHX

|08E2BB| LDA.w $0C4A,X

|08E2BE| TYX
|08E2BF| JSL CheckAncillaDamageToSprite

|08E2C3| PLX

;---------------------------------------------------------------------------------------------------

.success
|08E2C4| PLA
|08E2C5| PLA

|08E2C6| SEC

|08E2C7| RTS

.fail
|08E2C8| CLC

|08E2C9| RTS

;===================================================================================================

Ancilla_SetupBasicHitbox:
|08E2CA| LDA.w $0C04,X
|08E2CD| SEC
|08E2CE| SBC.b #$08
|08E2D0| STA.b $00

|08E2D2| LDA.w $0C18,X
|08E2D5| SBC.b #$00
|08E2D7| STA.b $08

|08E2D9| LDA.w $0BFA,X
|08E2DC| SEC
|08E2DD| SBC.b #$08
|08E2DF| PHP

|08E2E0| SEC
|08E2E1| SBC.w $029E,X
|08E2E4| STA.b $01

|08E2E6| LDA.w $0C0E,X
|08E2E9| SBC.b #$00

|08E2EB| PLP
|08E2EC| SBC.b #$00
|08E2EE| STA.b $09

|08E2F0| LDA.b #$0F
|08E2F2| STA.b $02

|08E2F4| LDA.b #$0F
|08E2F6| STA.b $03

;---------------------------------------------------------------------------------------------------

#EXIT_08E2F8:
|08E2F8| RTS

;===================================================================================================

pool AncillaDraw_SomariaBlock

.prop
|08E2F9| db $00, $40, $80, $C0
|08E2FD| db $00, $40, $80, $C0
|08E301| db $00, $40, $80, $C0

.offset_y
|08E305| dw  -8,  -8,   0,   0
|08E30D| dw   0,   0,   0,   0
|08E315| dw   0,   0,   0,   0

.offset_x
|08E31D| dw  -8,   0,  -8,   0
|08E325| dw   0,   0,   0,   0
|08E32D| dw   0,   0,   0,   0

endpool

;===================================================================================================

pool Ancilla2C_SomariaBlock

.node_offset_y
|08E335| dw  -8,   8,   0,   0
|08E33D| dw   0,   0,   0,   0
|08E345| dw  -8,   8,  -8,   8

.node_offset_x
|08E34D| dw   0,   0,  -8,   8
|08E355| dw   0,   0,   0,   0
|08E35D| dw   8,  -8,  -8,   8

endpool

;---------------------------------------------------------------------------------------------------

Ancilla2C_SomariaBlock:
|08E365| DEC.w $0394,X
|08E368| BPL EXIT_08E2F8

|08E36A| STZ.w $0394,X

|08E36D| LDA.w $03C5,X
|08E370| BNE .bouncing

|08E372| LDA.b $11
|08E374| BEQ .continue

|08E376| CMP.b #$08
|08E378| BEQ .continue

|08E37A| CMP.b #$10
|08E37C| BNE .skip_lift

.continue
|08E37E| JSR Ancilla_HandleLiftLogic
|08E381| BRA .handle_lift_logic

;---------------------------------------------------------------------------------------------------

.skip_lift
|08E383| TXA
|08E384| INC A
|08E385| CMP.w $02EC
|08E388| BNE .handle_lift_logic

|08E38A| LDA.w $0380,X
|08E38D| BEQ .handle_lift_logic

|08E38F| CMP.b #$03
|08E391| BEQ .assert_holditude

|08E393| LDY.b #$03
|08E395| JSR Ancilla_LatchLinkCoordinates
|08E398| JSR Ancilla_LatchAltitudeAboveLink

|08E39B| LDA.b #$03
|08E39D| STA.w $0380,X

.assert_holditude
|08E3A0| JSR Ancilla_LatchCarriedPosition

;---------------------------------------------------------------------------------------------------

.handle_lift_logic
|08E3A3| LDA.b $1B
|08E3A5| BEQ .no_trigger

|08E3A7| LDA.w $0380,X
|08E3AA| BNE .bouncing

|08E3AC| BIT.w $0308
|08E3AF| BMI .bouncing

|08E3B1| LDA.w $029E,X
|08E3B4| BEQ .run_trigger

|08E3B6| CMP.b #$FF
|08E3B8| BEQ .run_trigger

;---------------------------------------------------------------------------------------------------

.bouncing
|08E3BA| TXA
|08E3BB| INC A
|08E3BC| CMP.w $02EC
|08E3BF| BNE .no_trigger

|08E3C1| STZ.w $0646

.no_trigger
|08E3C4| BRL .tile_collision_logic

;---------------------------------------------------------------------------------------------------

.run_trigger
|08E3C7| LDA.w $03F4
|08E3CA| BEQ .no_transit_tiles

|08E3CC| LDA.b $1A
|08E3CE| AND.b #$03
|08E3D0| ASL A
|08E3D1| TAY

.next_node_check
|08E3D2| LDA.w $0BFA,X
|08E3D5| CLC
|08E3D6| ADC.w .node_offset_y+0,Y
|08E3D9| STA.b $00
|08E3DB| STA.b $72

|08E3DD| LDA.w $0C0E,X
|08E3E0| ADC.w .node_offset_y+1,Y
|08E3E3| STA.b $01
|08E3E5| STA.b $73

|08E3E7| LDA.w $0C04,X
|08E3EA| CLC
|08E3EB| ADC.w .node_offset_x+0,Y
|08E3EE| STA.b $02
|08E3F0| STA.b $74

|08E3F2| LDA.w $0C18,X
|08E3F5| ADC.w .node_offset_x+1,Y
|08E3F8| STA.b $03
|08E3FA| STA.b $75

|08E3FC| PHY

|08E3FD| LDA.w $0280,X
|08E400| PHA

|08E401| JSR Ancilla_CheckTileCollision_targeted

|08E404| PLA
|08E405| STA.w $0280,X

|08E408| PLY

|08E409| LDA.w $03E4,X
|08E40C| CMP.b #$B6 ; TILETYPE B6
|08E40E| BEQ .valid_node

|08E410| CMP.b #$BC ; TILETYPE BC
|08E412| BEQ .valid_node

|08E414| TYA
|08E415| CLC
|08E416| ADC.b #$08
|08E418| TAY

|08E419| CPY.b #$18
|08E41B| BCS .tile_collision_logic

|08E41D| BRA .next_node_check

;---------------------------------------------------------------------------------------------------

.valid_node
|08E41F| LDA.b $72
|08E421| STA.w $0BFA,X

|08E424| LDA.b $73
|08E426| STA.w $0C0E,X

|08E429| LDA.b $74
|08E42B| STA.w $0C04,X

|08E42E| LDA.b $75
|08E430| STA.w $0C18,X

|08E433| JSL AncillaAdd_SomariaPlatformPoof

|08E437| TXA
|08E438| INC A
|08E439| CMP.w $02EC
|08E43C| BNE .exit

|08E43E| STZ.w $02EC

.exit
|08E441| RTS

;---------------------------------------------------------------------------------------------------

.no_transit_tiles
|08E442| JSR SomariaBlock_CheckForSwitch
|08E445| BCS .tile_collision_logic

|08E447| LDA.w $029E,X
|08E44A| BEQ .set_trigger

|08E44C| CMP.b #$FF
|08E44E| BNE .tile_collision_logic

.set_trigger
|08E450| INC.w $0646

;---------------------------------------------------------------------------------------------------

.tile_collision_logic
|08E453| JSR Ancilla_LatchYCoordToZ

|08E456| LDA.w $0C72,X
|08E459| STA.b $74

|08E45B| LDA.w $0280,X
|08E45E| STA.b $75

|08E460| STZ.w $0280,X

|08E463| JSR Ancilla_CheckTileCollision_Class2

|08E466| PHP

|08E467| LDA.b $1B
|08E469| BEQ .dont_layer_swap

|08E46B| LDA.w $0385,X
|08E46E| BEQ .dont_layer_swap

|08E470| LDA.w $03E4,X
|08E473| CMP.b #$1C ; TILETYPE 1C
|08E475| BNE .dont_layer_swap

|08E477| LDA.b #$01
|08E479| STA.w $03D5,X

.dont_layer_swap
|08E47C| PLP
|08E47D| BCC .no_tile_collision

;---------------------------------------------------------------------------------------------------

.run_wall_bounce_logic
|08E47F| BIT.w $0308
|08E482| BPL .not_held

|08E484| LDA.w $0309
|08E487| BEQ .no_tile_collision

.not_held
|08E489| LDA.b $75
|08E48B| BNE .end_tile_collision_logic

|08E48D| LDA.w $0BF0,X
|08E490| BNE .end_tile_collision_logic

|08E492| LDA.w $029E,X
|08E495| BEQ .end_tile_collision_logic

|08E497| LDA.b #$01
|08E499| STA.w $0BF0,X

|08E49C| LDA.b #$04
|08E49E| STA.b $0E

|08E4A0| LDA.w $0C72,X
|08E4A3| CMP.b #$01
|08E4A5| BNE .small_bounce

|08E4A7| LDA.b #$10
|08E4A9| STA.b $0E

|08E4AB| LDY.b #$F0
|08E4AD| BRA .bounce_continue

.small_bounce
|08E4AF| LDY.b #$FC

;---------------------------------------------------------------------------------------------------

.bounce_continue
|08E4B1| LDA.w $0C22,X
|08E4B4| BEQ .zero_y_speed
|08E4B6| BPL .bounce_up

|08E4B8| LDY.b $0E

.bounce_up
|08E4BA| TYA
|08E4BB| STA.w $0C22,X

.zero_y_speed
|08E4BE| LDY.b #$FC

|08E4C0| LDA.w $0C2C,X
|08E4C3| BEQ .zero_x_speed
|08E4C5| BPL .bounce_left

|08E4C7| LDY.b #$04

.bounce_left
|08E4C9| TYA
|08E4CA| STA.w $0C2C,X

.zero_x_speed
|08E4CD| LDA.w $0C72,X
|08E4D0| CMP.b #$01
|08E4D2| BNE .end_tile_collision_logic

|08E4D4| INC A
|08E4D5| STA.w $0385,X

|08E4D8| LDA.b #$FC
|08E4DA| STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

.end_tile_collision_logic
|08E4DD| BRL SomariaBlock_HandleDamage

.no_tile_collision
|08E4E0| BIT.w $0308
|08E4E3| BMI .end_tile_collision_logic

|08E4E5| LDA.w $029E,X
|08E4E8| BEQ .not_airborne

|08E4EA| CMP.b #$FF
|08E4EC| BNE .end_tile_collision_logic

.not_airborne
|08E4EE| LDA.b #$10
|08E4F0| STA.w $0C72,X

;---------------------------------------------------------------------------------------------------

|08E4F3| LDA.w $0280,X
|08E4F6| PHA

|08E4F7| JSR Ancilla_CheckTileCollision

|08E4FA| PLA
|08E4FB| STA.w $0280,X

;---------------------------------------------------------------------------------------------------

|08E4FE| LDA.w $03E4,X

|08E501| CMP.b #$26 ; TILETYPE 26
|08E503| BEQ .staircase_boundary

|08E505| CMP.b #$0C ; TILETYPE 0C
|08E507| BEQ .overlay_mask

|08E509| CMP.b #$1C ; TILETYPE 1C
|08E50B| BEQ .overlay_mask

|08E50D| CMP.b #$20 ; TILETYPE 20
|08E50F| BEQ .pit

|08E511| CMP.b #$08 ; TILETYPE 08
|08E513| BEQ .deep_water

|08E515| CMP.b #$68 ; TILETYPE 68
|08E517| BEQ .conveyor

|08E519| CMP.b #$69 ; TILETYPE 69
|08E51B| BEQ .conveyor

|08E51D| CMP.b #$6A ; TILETYPE 6A
|08E51F| BEQ .conveyor

|08E521| CMP.b #$6B ; TILETYPE 6B
|08E523| BEQ .conveyor

|08E525| CMP.b #$B6 ; TILETYPE B6
|08E527| BEQ .somaria_node_or_path

|08E529| CMP.b #$BC ; TILETYPE BC
|08E52B| BEQ .somaria_node_or_path

|08E52D| AND.b #$F0
|08E52F| CMP.b #$B0
|08E531| BNE .somaria_node_or_path

;---------------------------------------------------------------------------------------------------

.pit
|08E533| BRL SomariaBlock_HandlePitLogic

;---------------------------------------------------------------------------------------------------

.staircase_boundary
|08E536| BRL .run_wall_bounce_logic

;---------------------------------------------------------------------------------------------------

.conveyor
|08E539| BRL SomariaBlock_HandleConveyor

;---------------------------------------------------------------------------------------------------

.somaria_node_or_path
|08E53C| STZ.w $0C68,X

|08E53F| LDA.w $0385,X
|08E542| ORA.w $03C5,X
|08E545| BNE .am_airborne

|08E547| LDA.b #$02
|08E549| STA.w $0C68,X

.am_airborne
|08E54C| BRL SomariaBlock_HandleDamage

;===================================================================================================

.deep_water
|08E54F| TXA
|08E550| INC A
|08E551| CMP.w $02EC
|08E554| BNE .dont_reset_water

|08E556| STZ.w $02EC

.dont_reset_water
|08E559| LDA.w $0C68,X
|08E55C| BNE .am_airborne

|08E55E| LDA.w $0BFA,X
|08E561| CLC
|08E562| ADC.b #$E8
|08E564| STA.w $0BFA,X

|08E567| LDA.w $0C0E,X
|08E56A| ADC.b #$FF
|08E56C| STA.w $0C0E,X

|08E56F| BRL Ancilla_TransmuteToSplash

;===================================================================================================

.overlay_mask
|08E572| LDA.w $046C
|08E575| CMP.b #$03
|08E577| BEQ .layer_2_moving_floor

|08E579| LDA.w $0C7C,X
|08E57C| BNE SomariaBlock_HandleDamage

|08E57E| LDA.w $029E,X
|08E581| BEQ SomariaBlock_HandleDamage

|08E583| CMP.b #$FF
|08E585| BEQ SomariaBlock_HandleDamage

|08E587| LDA.b #$01
|08E589| STA.w $0C7C,X

|08E58C| BRL SomariaBlock_HandleDamage

;---------------------------------------------------------------------------------------------------

.layer_2_moving_floor
|08E58F| LDA.w $0BFA,X
|08E592| CLC
|08E593| ADC.w $0310
|08E596| STA.b $72

|08E598| LDA.w $0C0E,X
|08E59B| ADC.w $0311
|08E59E| STA.b $73

|08E5A0| LDA.w $0C04,X
|08E5A3| CLC
|08E5A4| ADC.w $0312
|08E5A7| STA.w $0C04,X

|08E5AA| LDA.w $0C18,X
|08E5AD| ADC.w $0313
|08E5B0| STA.w $0C18,X

|08E5B3| BRA SomariaBlock_HandleDamage

;===================================================================================================

SomariaBlock_HandleConveyor:
|08E5B5| JSR Ancilla_ApplyConveyor

|08E5B8| BRA SomariaBlock_HandleDamage

;===================================================================================================

SomariaBlock_HandlePitLogic:
|08E5BA| LDA.w $0308
|08E5BD| BMI SomariaBlock_HandleDamage

|08E5BF| TXA
|08E5C0| INC A
|08E5C1| CMP.w $02EC
|08E5C4| BNE .dont_reset

|08E5C6| STZ.w $02EC

.dont_reset
|08E5C9| LDA.w $0C68,X
|08E5CC| BNE SomariaBlock_HandleDamage

|08E5CE| LDA.b $5E
|08E5D0| CMP.b #$12
|08E5D2| BNE Ancilla_DeleteSelf

|08E5D4| STZ.b $5E
|08E5D6| STZ.b $48

;===================================================================================================

Ancilla_DeleteSelf:
|08E5D8| STZ.w $0C4A,X

|08E5DB| RTS

;===================================================================================================

SomariaBlock_HandleDamage:
|08E5DC| LDA.b $75
|08E5DE| ORA.w $0280,X
|08E5E1| STA.b $75

|08E5E3| LDA.w $0308
|08E5E6| BMI .dont_fizzle

|08E5E8| DEC.w $03A9,X

|08E5EB| LDA.w $03A9,X
|08E5EE| BNE .dont_fizzle

|08E5F0| INC.w $03A9,X

|08E5F3| STZ.w $0280,X

|08E5F6| JSR Ancilla_CheckBasicSpriteCollision
|08E5F9| BCC .dont_fizzle

|08E5FB| LDA.b #$07
|08E5FD| STA.w $03A9,X

|08E600| LDA.w $0C54,X
|08E603| INC A
|08E604| STA.w $0C54,X

|08E607| CMP.b #$05
|08E609| BNE .dont_fizzle

|08E60B| BRL SomariaBlock_FizzleAway

.dont_fizzle
|08E60E| LDA.b $74
|08E610| STA.w $0C72,X

|08E613| LDA.b $75
|08E615| STA.w $0280,X

|08E618| JSR Ancilla_SetYFrom_DP72

;===================================================================================================

AncillaDraw_SomariaBlock:
|08E61B| TXY
|08E61C| INY
|08E61D| CPY.w $02EC
|08E620| BNE .not_special_oam_slots

|08E622| LDA.w $0308
|08E625| BPL .not_special_oam_slots

|08E627| LDA.w $0380,X
|08E62A| CMP.b #$03
|08E62C| BEQ .not_special_oam_slots

|08E62E| LDA.b $2F
|08E630| BNE .not_special_oam_slots

|08E632| LDA.w $0C90,X
|08E635| JSR AllocateOAMInRegionsBE

|08E638| BRA .prep_coord

.not_special_oam_slots
|08E63A| LDA.w $0FB3
|08E63D| BEQ .prep_coord

|08E63F| LDA.w $0C7C,X
|08E642| BEQ .prep_coord

|08E644| LDA.w $0385,X
|08E647| BNE .airborne_slots

|08E649| TXY
|08E64A| INY
|08E64B| CPY.w $02EC
|08E64E| BNE .prep_coord

|08E650| LDA.w $0308
|08E653| BPL .prep_coord

;---------------------------------------------------------------------------------------------------

.airborne_slots
|08E655| REP #$20

|08E657| LDA.w #$00D0
|08E65A| CLC
|08E65B| ADC.w #$0800
|08E65E| STA.b $90

|08E660| LDA.w #$0034
|08E663| CLC
|08E664| ADC.w #$0A20
|08E667| STA.b $92

|08E669| SEP #$20

;---------------------------------------------------------------------------------------------------

.prep_coord
|08E66B| JSR Ancilla_PrepOAMCoord.adjusted

|08E66E| REP #$20

|08E670| LDA.w $029E,X
|08E673| AND.w #$00FF
|08E676| CMP.w #$0080
|08E679| BCC .positive_z

|08E67B| ORA.w #$FF00

.positive_z
|08E67E| STA.b $04
|08E680| BEQ .not_max_priority

|08E682| CMP.w #$FFFF
|08E685| BEQ .not_max_priority

|08E687| LDA.w $0380,X
|08E68A| AND.w #$00FF
|08E68D| CMP.w #$0003
|08E690| BEQ .not_max_priority

|08E692| LDA.w $0280,X
|08E695| AND.w #$00FF
|08E698| BEQ .not_max_priority

|08E69A| LDA.w #$3000
|08E69D| STA.b $64

.not_max_priority
|08E69F| LDA.w #$0000
|08E6A2| CLC
|08E6A3| ADC.b $04

|08E6A5| EOR.w #$FFFF
|08E6A8| INC A

|08E6A9| CLC
|08E6AA| ADC.b $00
|08E6AC| STA.b $04

;---------------------------------------------------------------------------------------------------

|08E6AE| LDA.b $02
|08E6B0| STA.b $06

|08E6B2| SEP #$20

|08E6B4| STZ.b $08

|08E6B6| PHX

|08E6B7| LDA.b #$02
|08E6B9| STA.b $72

|08E6BB| LDA.w $03A4,X
|08E6BE| ASL A
|08E6BF| ASL A
|08E6C0| TAX

;---------------------------------------------------------------------------------------------------

|08E6C1| LDY.b #$00

.next_object
|08E6C3| REP #$20

|08E6C5| STZ.b $74

|08E6C7| PHX

|08E6C8| TXA
|08E6C9| ASL A
|08E6CA| TAX

|08E6CB| LDA.b $04
|08E6CD| CLC
|08E6CE| ADC.w .offset_y,X
|08E6D1| STA.b $00

|08E6D3| LDA.b $06
|08E6D5| CLC
|08E6D6| ADC.w .offset_x,X
|08E6D9| STA.b $02

|08E6DB| PLX

|08E6DC| SEP #$20

|08E6DE| JSR Ancilla_SetOAM_XY_safe

|08E6E1| LDA.b #$E9
|08E6E3| STA.b ($90),Y

|08E6E5| INY

|08E6E6| LDA.w .prop,X
|08E6E9| AND.b #$CF
|08E6EB| ORA.b $72
|08E6ED| ORA.b $65
|08E6EF| STA.b ($90),Y

|08E6F1| INY
|08E6F2| PHY

|08E6F3| TYA
|08E6F4| SEC
|08E6F5| SBC.b #$04
|08E6F7| LSR A
|08E6F8| LSR A
|08E6F9| TAY

|08E6FA| LDA.b #$00
|08E6FC| ORA.b $75
|08E6FE| STA.b ($92),Y

|08E700| PLY

|08E701| INX

|08E702| INC.b $08

|08E704| LDA.b $08
|08E706| AND.b #$03
|08E708| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08E70A| PLX

|08E70B| LDA.w $0380,X
|08E70E| CMP.b #$03
|08E710| BEQ .exit

|08E712| LDY.b #$01

.next_object_check
|08E714| LDA.b ($90),Y
|08E716| CMP.b #$F0
|08E718| BNE .not_off_screen

|08E71A| INY
|08E71B| INY
|08E71C| INY
|08E71D| INY
|08E71E| CPY.b #$11
|08E720| BNE .next_object_check

|08E722| BRA .terminate

.not_off_screen
|08E724| LDY.b #$00

.next_oam_check
|08E726| LDA.b ($92),Y
|08E728| AND.b #$01
|08E72A| BEQ .exit

|08E72C| INY
|08E72D| CPY.b #$04
|08E72F| BNE .next_oam_check

.terminate
|08E731| STZ.w $0646

|08E734| STZ.w $0C4A,X

|08E737| TXA
|08E738| INC A
|08E739| CMP.w $02EC
|08E73C| BNE .exit

|08E73E| STZ.w $02EC

|08E741| LDA.w $0308
|08E744| AND.b #$80
|08E746| BEQ .exit

|08E748| STZ.w $0308

.exit
|08E74B| RTS

;===================================================================================================

pool SomariaBlock_CheckForSwitch

.offset_y
|08E74C| dw  -4 ; up
|08E74E| dw   4 ; down
|08E750| dw   0 ; left
|08E752| dw   0 ; right

.offset_x
|08E754| dw   0 ; up
|08E756| dw   0 ; down
|08E758| dw  -4 ; left
|08E75A| dw   4 ; right

endpool

;---------------------------------------------------------------------------------------------------

SomariaBlock_CheckForSwitch:
|08E75C| STZ.w $0646

|08E75F| STZ.w $03DB,X

|08E762| LDY.b #$06

.next_check
|08E764| LDA.w $0BFA,X
|08E767| CLC
|08E768| ADC.w .offset_y+0,Y
|08E76B| STA.b $00
|08E76D| STA.b $72

|08E76F| LDA.w $0C0E,X
|08E772| ADC.w .offset_y+1,Y
|08E775| STA.b $01
|08E777| STA.b $73

|08E779| LDA.w $0C04,X
|08E77C| CLC
|08E77D| ADC.w .offset_x+0,Y
|08E780| STA.b $02
|08E782| STA.b $74

|08E784| LDA.w $0C18,X
|08E787| ADC.w .offset_x+1,Y
|08E78A| STA.b $03
|08E78C| STA.b $75

|08E78E| PHY

|08E78F| LDA.w $0280,X
|08E792| PHA

|08E793| JSR Ancilla_CheckTileCollision_targeted

|08E796| PLA
|08E797| STA.w $0280,X

|08E79A| PLY

|08E79B| LDA.w $03E4,X
|08E79E| CMP.b #$23 ; TILETYPE 23
|08E7A0| BEQ .valid_switch

|08E7A2| CMP.b #$24 ; TILETYPE 24
|08E7A4| BEQ .valid_switch

|08E7A6| CMP.b #$25 ; TILETYPE 25
|08E7A8| BEQ .valid_switch

|08E7AA| CMP.b #$3B ; TILETYPE 3B
|08E7AC| BNE .not_star_tile

.valid_switch
|08E7AE| INC.w $03DB,X

.not_star_tile
|08E7B1| DEY
|08E7B2| DEY
|08E7B3| BPL .next_check

;---------------------------------------------------------------------------------------------------

|08E7B5| LDA.w $03DB,X
|08E7B8| CMP.b #$04
|08E7BA| BNE .fail

.succeed
|08E7BC| CLC

|08E7BD| RTS

.fail
|08E7BE| SEC

|08E7BF| RTS

;===================================================================================================

pool SomariaBlock_HandlePlayerInteraction

.push_speed_positive
|08E7C0| db  16

.push_speed_negative
|08E7C1| db -16

;---------------------------------------------------------------------------------------------------

.launch_speed_y
|08E7C2| db -40
|08E7C3| db  40
|08E7C4| db   0
|08E7C5| db   0

.unused_a
|08E7C6| db -32
|08E7C7| db  32
|08E7C8| db   0
|08E7C9| db   0

|08E7CA| db -16
|08E7CB| db  16
|08E7CC| db   0
|08E7CD| db   0

|08E7CE| db  -8
|08E7CF| db   8
|08E7D0| db   0
|08E7D1| db   0

;---------------------------------------------------------------------------------------------------

.launch_speed_x
|08E7D2| db   0
|08E7D3| db   0
|08E7D4| db -40
|08E7D5| db  40

.unused_b
|08E7D6| db   0
|08E7D7| db   0
|08E7D8| db -32
|08E7D9| db  32

|08E7DA| db   0
|08E7DB| db   0
|08E7DC| db -16
|08E7DD| db  16

|08E7DE| db   0
|08E7DF| db   0
|08E7E0| db  -8
|08E7E1| db   8

;---------------------------------------------------------------------------------------------------

.rebound_speed_z
|08E7E2| db  48
|08E7E3| db  24
|08E7E4| db  16
|08E7E5| db   8

endpool

;---------------------------------------------------------------------------------------------------

SomariaBlock_HandlePlayerInteraction:
|08E7E6| PHB
|08E7E7| PHK
|08E7E8| PLB

|08E7E9| STX.w $0FA0

|08E7EC| LDA.w $0394,X
|08E7EF| BNE .no_do_somaria

|08E7F1| LDA.w $03C5,X
|08E7F4| BEQ .not_dash_airborne

|08E7F6| BRL .punt_continue

;---------------------------------------------------------------------------------------------------

.not_dash_airborne
|08E7F9| LDA.b $4D
|08E7FB| BNE .no_do_somaria

|08E7FD| LDA.w $0308
|08E800| AND.b #$01
|08E802| BNE .no_do_somaria

|08E804| LDA.w $029E,X
|08E807| BEQ .grounded

|08E809| CMP.b #$FF
|08E80B| BNE .no_do_somaria

.grounded
|08E80D| LDA.w $0380,X
|08E810| BNE .no_do_somaria

|08E812| LDA.w $0385,X
|08E815| BNE .no_do_somaria

|08E817| LDA.b $F0
|08E819| AND.b #$0F
|08E81B| BNE .pressing_dpad

|08E81D| STA.w $039F,X

|08E820| STA.b $48

|08E822| LDA.b #$FF
|08E824| STA.w $038A,X

|08E827| LDA.w $0372
|08E82A| BNE .check_link_collision

|08E82C| STZ.b $5E

.no_do_somaria
|08E82E| BRL .exit_a

;---------------------------------------------------------------------------------------------------

.pressing_dpad
|08E831| CMP.w $039F,X
|08E834| BNE .input_mismatch

|08E836| LDA.b $5E
|08E838| CMP.b #$12
|08E83A| BNE .check_link_collision

|08E83C| LDA.b #$81
|08E83E| TSB.b $48
|08E840| BRA .check_link_collision

.input_mismatch
|08E842| STA.w $039F,X

|08E845| STZ.b $5E

;---------------------------------------------------------------------------------------------------

.check_link_collision
|08E847| LDY.b #$04
|08E849| JSR Ancilla_CheckLinkCollision
|08E84C| BCC .no_do_somaria

|08E84E| LDA.w $0C7C,X
|08E851| CMP.b $EE
|08E853| BNE .no_do_somaria

|08E855| LDA.w $0372
|08E858| BEQ .no_punt

|08E85A| LDA.w $02F1
|08E85D| CMP.b #$40
|08E85F| BEQ .no_punt

|08E861| TXA
|08E862| INC A
|08E863| CMP.w $02EC
|08E866| BNE .disable_nearitude

|08E868| STZ.w $02EC

;---------------------------------------------------------------------------------------------------

.disable_nearitude
|08E86B| JSL CancelDash_long

|08E86F| LDA.b #$32 ; SFX3.32
|08E871| JSR Ancilla_SFX3_Pan

|08E874| BRL .init_dash_bouncing

;---------------------------------------------------------------------------------------------------

.no_punt
|08E877| STZ.w $0C2C,X
|08E87A| STZ.w $0C22,X

|08E87D| LDA.b $F0
|08E87F| AND.b #$0F
|08E881| STA.w $039F,X

|08E884| AND.b #$03
|08E886| BEQ .pushing_left_or_right

|08E888| LDY.w .push_speed_positive

|08E88B| AND.b #$01
|08E88D| BNE .pushing_right

|08E88F| LDY.w .push_speed_negative

.pushing_right
|08E892| TYA
|08E893| STA.w $0C2C,X

|08E896| LDY.b #$02
|08E898| CMP.w .push_speed_positive
|08E89B| BNE .set_direction

|08E89D| INY
|08E89E| BRA .set_direction

.pushing_left_or_right
|08E8A0| LDY.w .push_speed_positive

|08E8A3| LDA.b $F0
|08E8A5| AND.b #$08
|08E8A7| BEQ .upward_push

|08E8A9| LDY.w .push_speed_negative

.upward_push
|08E8AC| TYA
|08E8AD| STA.w $0C22,X

|08E8B0| LDY.b #$00
|08E8B2| CMP.w .push_speed_positive
|08E8B5| BNE .set_direction

|08E8B7| INY

;---------------------------------------------------------------------------------------------------

.set_direction
|08E8B8| TYA
|08E8B9| STA.w $0C72,X

|08E8BC| LDA.b $27
|08E8BE| BEQ .no_recoil

|08E8C0| LDA.b $28
|08E8C2| BNE .yes_recoil

.no_recoil
|08E8C4| JSR Ancilla_CheckTileCollision_Class2
|08E8C7| BCS .no_tile_collision_here

|08E8C9| JSR AncillaMoveY
|08E8CC| JSR AncillaMoveX

|08E8CF| LDA.w $0308
|08E8D2| AND.b #$80
|08E8D4| BNE .no_tile_collision_here

|08E8D6| INC.w $038A,X

|08E8D9| LDA.w $038A,X
|08E8DC| AND.b #$07
|08E8DE| BNE .no_tile_collision_here

|08E8E0| LDA.b #$22 ; SFX2.22
|08E8E2| JSR Ancilla_SFX2_Pan

.no_tile_collision_here
|08E8E5| LDA.b #$81
|08E8E7| STA.b $48

|08E8E9| LDA.b #$12
|08E8EB| STA.b $5E

.yes_recoil
|08E8ED| JSL AbortMovement

.exit_a
|08E8F1| PLB

|08E8F2| RTL

;---------------------------------------------------------------------------------------------------

.init_dash_bouncing
|08E8F3| LDA.b $2F
|08E8F5| LSR A
|08E8F6| STA.w $0C72,X

|08E8F9| TAY

|08E8FA| LDA.w .launch_speed_y,Y
|08E8FD| STA.w $0C22,X

|08E900| LDA.w .launch_speed_x,Y
|08E903| STA.w $0C2C,X

|08E906| LDA.w .rebound_speed_z
|08E909| STA.w $0294,X

|08E90C| LDA.b #$01
|08E90E| STA.w $03C5,X

|08E911| STZ.w $029E,X

;---------------------------------------------------------------------------------------------------

.punt_continue
|08E914| LDA.w $0294,X
|08E917| SEC
|08E918| SBC.b #$02
|08E91A| STA.w $0294,X

|08E91D| JSR AncillaMoveY
|08E920| JSR AncillaMoveX
|08E923| JSR AncillaMoveZ

|08E926| LDA.w $029E,X
|08E929| BEQ .hit_ground_running

|08E92B| CMP.b #$FC
|08E92D| BCC .exit_b

.hit_ground_running
|08E92F| LDA.b #$21 ; SFX2.21
|08E931| JSR Ancilla_SFX2_Pan

|08E934| STZ.w $029E,X

|08E937| LDA.w $03C5,X
|08E93A| INC A
|08E93B| STA.w $03C5,X

|08E93E| CMP.b #$04
|08E940| BNE .max_bounces

|08E942| STZ.w $0BF0,X
|08E945| STZ.w $03C5,X
|08E948| BRA .exit_b

;---------------------------------------------------------------------------------------------------

.max_bounces
|08E94A| TAY
|08E94B| DEY

|08E94C| LDA.w .rebound_speed_z,Y
|08E94F| STA.w $0294,X

|08E952| LDA.b $2F
|08E954| LSR A
|08E955| STA.b $00

|08E957| TYA
|08E958| ASL A
|08E959| ASL A
|08E95A| CLC
|08E95B| ADC.b $00
|08E95D| TAY

;---------------------------------------------------------------------------------------------------

|08E95E| LDY.b #$00

|08E960| LDA.w $0C22,X
|08E963| BPL .y_is_positive

|08E965| LDY.b #$01

|08E967| EOR.b #$FF
|08E969| INC A

.y_is_positive
|08E96A| LSR A

|08E96B| CPY.b #$01
|08E96D| BNE .restore_y_sign

|08E96F| EOR.b #$FF
|08E971| INC A

.restore_y_sign
|08E972| STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

|08E975| LDY.b #$00

|08E977| LDA.w $0C2C,X
|08E97A| BPL .x_is_positive

|08E97C| LDY.b #$01

|08E97E| EOR.b #$FF
|08E980| INC A

.x_is_positive
|08E981| LSR A

|08E982| CPY.b #$01
|08E984| BNE .restore_x_sign

|08E986| EOR.b #$FF
|08E988| INC A

.restore_x_sign
|08E989| STA.w $0C2C,X

;---------------------------------------------------------------------------------------------------

.exit_b
|08E98C| PLB

|08E98D| RTL

;===================================================================================================

pool Ancilla2D_SomariaBlockFizz

.offset_y
|08E98E| dw  -4,  -1,  -4
|08E994| dw  -4,  -4,  -4

.offset_x
|08E99A| dw  -4,  -1,  -8
|08E9A0| dw   0,  -6,  -2

.char
|08E9A6| db $92, $FF, $F9
|08E9A9| db $F9, $F9, $F9

.prop
|08E9AC| db $06, $FF, $86
|08E9AF| db $C6, $86, $C6

endpool

;===================================================================================================

SomariaBlock_FizzleAway:
|08E9B2| LDA.b $5E
|08E9B4| CMP.b #$12
|08E9B6| BNE .dont_reset_speed

|08E9B8| STZ.b $48
|08E9BA| STZ.b $5E

.dont_reset_speed
|08E9BC| STZ.w $0646

|08E9BF| LDA.b #$2D ; ANCILLA 2D
|08E9C1| STA.w $0C4A,X

|08E9C4| STZ.w $03B1,X

|08E9C7| STZ.w $0C54,X
|08E9CA| STZ.w $0C5E,X

|08E9CD| STZ.w $039F,X
|08E9D0| STZ.w $03A4,X

|08E9D3| STZ.w $03EA,X

|08E9D6| TXA
|08E9D7| INC A
|08E9D8| CMP.w $02EC
|08E9DB| BNE Ancilla2D_SomariaBlockFizz

|08E9DD| STZ.w $02EC

|08E9E0| LDA.w $0308
|08E9E3| AND.b #$80
|08E9E5| STA.w $0308

;===================================================================================================

Ancilla2D_SomariaBlockFizz:
|08E9E8| DEC.w $03B1,X
|08E9EB| BPL .continue

|08E9ED| LDA.b #$03
|08E9EF| STA.w $03B1,X

|08E9F2| LDA.w $0C5E,X
|08E9F5| INC A
|08E9F6| STA.w $0C5E,X

|08E9F9| CMP.b #$03
|08E9FB| BNE .continue

|08E9FD| STZ.w $0C4A,X

|08EA00| RTS

;---------------------------------------------------------------------------------------------------

.continue
|08EA01| JSR Ancilla_PrepOAMCoord.adjusted

|08EA04| LDY.b #$00

|08EA06| LDA.w $029E,X
|08EA09| CMP.b #$FF
|08EA0B| BNE .not_underground

|08EA0D| LDA.b #$00

.not_underground
|08EA0F| STA.b $04
|08EA11| BPL .positive_z

|08EA13| LDY.b #$FF

.positive_z
|08EA15| STY.b $05

|08EA17| REP #$20

|08EA19| LDA.b $04
|08EA1B| EOR.w #$FFFF
|08EA1E| INC A
|08EA1F| CLC
|08EA20| ADC.b $00
|08EA22| STA.b $04

|08EA24| LDA.b $02
|08EA26| STA.b $06

;---------------------------------------------------------------------------------------------------

|08EA28| SEP #$20

|08EA2A| PHX

|08EA2B| LDA.w $0C5E,X
|08EA2E| ASL A
|08EA2F| TAX

|08EA30| LDY.b #$00
|08EA32| STY.b $08

.next_object
|08EA34| LDA.w .char,X
|08EA37| CMP.b #$FF
|08EA39| BEQ .skip

|08EA3B| REP #$20

|08EA3D| PHX

|08EA3E| TXA
|08EA3F| ASL A
|08EA40| TAX

|08EA41| LDA.b $04
|08EA43| CLC
|08EA44| ADC.w .offset_y,X
|08EA47| STA.b $00

|08EA49| LDA.b $06
|08EA4B| CLC
|08EA4C| ADC.w .offset_x,X
|08EA4F| STA.b $02

|08EA51| PLX

|08EA52| SEP #$20

|08EA54| JSR Ancilla_SetOAM_XY

|08EA57| LDA.w .char,X
|08EA5A| STA.b ($90),Y

|08EA5C| INY

|08EA5D| LDA.w .prop,X
|08EA60| AND.b #$CF
|08EA62| ORA.b $65
|08EA64| STA.b ($90),Y

|08EA66| INY
|08EA67| PHY

|08EA68| TYA
|08EA69| SEC
|08EA6A| SBC.b #$04
|08EA6C| LSR A
|08EA6D| LSR A
|08EA6E| TAY

|08EA6F| LDA.b #$00
|08EA71| STA.b ($92),Y

|08EA73| PLY

.skip
|08EA74| INX

|08EA75| INC.b $08

|08EA77| LDA.b $08
|08EA79| CMP.b #$02
|08EA7B| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08EA7D| PLX

|08EA7E| RTS

;===================================================================================================

pool Ancilla39_SomariaPlatformPoof

.direction
|08EA7F| db $01 ; up
|08EA80| db $00 ; down
|08EA81| db $03 ; left
|08EA82| db $02 ; right

endpool

;---------------------------------------------------------------------------------------------------

Ancilla39_SomariaPlatformPoof:
|08EA83| DEC.w $03B1,X
|08EA86| BMI .continue

|08EA88| RTS

;---------------------------------------------------------------------------------------------------

.continue
|08EA89| STZ.w $0C4A,X

|08EA8C| LDA.w $0BFA,X
|08EA8F| STA.b $72

|08EA91| LDA.w $0C0E,X
|08EA94| STA.b $73

|08EA96| LDA.w $0C04,X
|08EA99| STA.b $74

|08EA9B| LDA.w $0C18,X
|08EA9E| STA.b $75

|08EAA0| LDA.w $0C7C,X
|08EAA3| STA.b $BD

|08EAA5| PHX

|08EAA6| LDA.b #$ED ; SPRITE ED
|08EAA8| JSL SpawnSpriteDynamically
|08EAAC| BPL .free_slot

|08EAAE| BRL .just_draw

;---------------------------------------------------------------------------------------------------

.free_slot
|08EAB1| STZ.w $02F5

|08EAB4| LDA.b $72
|08EAB6| AND.b #$F8
|08EAB8| ORA.b #$04
|08EABA| STA.w $0D00,Y
|08EABD| STA.b $72

|08EABF| LDA.b $73
|08EAC1| STA.w $0D20,Y

|08EAC4| LDA.b $74
|08EAC6| AND.b #$F8
|08EAC8| ORA.b #$04
|08EACA| STA.w $0D10,Y
|08EACD| STA.b $74

|08EACF| LDA.b $75
|08EAD1| STA.w $0D30,Y

|08EAD4| LDA.b $BD
|08EAD6| CMP.b #$01

|08EAD8| REP #$30

|08EADA| STZ.b $06

|08EADC| BCC .lower_layer

|08EADE| LDA.w #$1000
|08EAE1| STA.b $06

;---------------------------------------------------------------------------------------------------

.lower_layer
|08EAE3| LDA.b $74
|08EAE5| AND.w #$01FF
|08EAE8| LSR A
|08EAE9| LSR A
|08EAEA| LSR A
|08EAEB| STA.b $04

|08EAED| LDA.b $72
|08EAEF| AND.w #$01F8
|08EAF2| ASL A
|08EAF3| ASL A
|08EAF4| ASL A
|08EAF5| CLC
|08EAF6| ADC.b $04
|08EAF8| CLC
|08EAF9| ADC.b $06
|08EAFB| TAX

;---------------------------------------------------------------------------------------------------

|08EAFC| STZ.b $06

|08EAFE| LDA.l $7F1FC0,X
|08EB02| AND.w #$00F0
|08EB05| CMP.w #$00B0
|08EB08| BEQ .match

|08EB0A| INC.b $06

|08EB0C| LDA.l $7F2040,X
|08EB10| AND.w #$00F0
|08EB13| CMP.w #$00B0
|08EB16| BEQ .match

|08EB18| INC.b $06

|08EB1A| LDA.l $7F1FFF,X
|08EB1E| AND.w #$00F0
|08EB21| CMP.w #$00B0
|08EB24| BEQ .match

|08EB26| INC.b $06

.match
|08EB28| SEP #$30

|08EB2A| LDX.b $06

|08EB2C| LDA.w .direction,X
|08EB2F| STA.w $0DE0,Y

|08EB32| LDA.b #$00
|08EB34| STA.w $0F20,Y

|08EB37| BRA .exit

;---------------------------------------------------------------------------------------------------

.just_draw
|08EB39| JSR AncillaDraw_SomariaBlock

.exit
|08EB3C| PLX

|08EB3D| RTS

;===================================================================================================

Ancilla2E_SomariaBlockFission:
|08EB3E| DEC.w $03B1,X
|08EB41| BPL .delay_explosion

|08EB43| LDA.b #$03
|08EB45| STA.w $03B1,X

|08EB48| LDA.w $0C5E,X
|08EB4B| INC A
|08EB4C| STA.w $0C5E,X

|08EB4F| CMP.b #$02
|08EB51| BNE .delay_explosion

|08EB53| STZ.w $0C4A,X

|08EB56| PHX

|08EB57| JSR SpawnSomariaBullets

|08EB5A| PLX

|08EB5B| RTS

;---------------------------------------------------------------------------------------------------

.delay_explosion
|08EB5C| JSR Ancilla_PrepOAMCoord.adjusted

|08EB5F| LDY.b #$00

|08EB61| LDA.w $0380,X
|08EB64| CMP.b #$03
|08EB66| BNE .ignore_link_z

|08EB68| LDA.b $24
|08EB6A| CMP.b #$FF
|08EB6C| BNE .positive_link_z

.ignore_link_z
|08EB6E| LDA.b #$00

.positive_link_z
|08EB70| CLC
|08EB71| ADC.w $029E,X
|08EB74| STA.b $04

|08EB76| BPL .positive_som_z

|08EB78| LDY.b #$FF

.positive_som_z
|08EB7A| STY.b $05

;---------------------------------------------------------------------------------------------------

|08EB7C| REP #$20

|08EB7E| LDA.b $04
|08EB80| EOR.w #$FFFF
|08EB83| INC A

|08EB84| CLC
|08EB85| ADC.b $00
|08EB87| STA.b $04

|08EB89| LDA.b $02
|08EB8B| STA.b $06


|08EB8D| SEP #$20

|08EB8F| PHX

|08EB90| LDA.w $0C5E,X
|08EB93| ASL A
|08EB94| ASL A
|08EB95| ASL A
|08EB96| TAX

;---------------------------------------------------------------------------------------------------

|08EB97| LDY.b #$00
|08EB99| STY.b $08

.next_object
|08EB9B| REP #$20

|08EB9D| PHX

|08EB9E| TXA
|08EB9F| ASL A
|08EBA0| TAX

|08EBA1| LDA.b $04
|08EBA3| CLC
|08EBA4| ADC.l SomariaBlockFission.offset_y,X
|08EBA8| STA.b $00

|08EBAA| LDA.b $06
|08EBAC| CLC
|08EBAD| ADC.l SomariaBlockFission.offset_x,X
|08EBB1| STA.b $02

|08EBB3| PLX

|08EBB4| SEP #$20

|08EBB6| JSR Ancilla_SetOAM_XY

|08EBB9| LDA.l SomariaBlockFission.char,X
|08EBBD| STA.b ($90),Y

|08EBBF| INY

|08EBC0| LDA.l SomariaBlockFission.prop,X
|08EBC4| AND.b #$CF
|08EBC6| ORA.b $65
|08EBC8| STA.b ($90),Y

|08EBCA| INY
|08EBCB| PHY

|08EBCC| TYA
|08EBCD| SEC
|08EBCE| SBC.b #$04
|08EBD0| LSR A
|08EBD1| LSR A
|08EBD2| TAY

|08EBD3| LDA.b #$00
|08EBD5| STA.b ($92),Y

|08EBD7| PLY

|08EBD8| INX

|08EBD9| INC.b $08

|08EBDB| LDA.b $08
|08EBDD| CMP.b #$08
|08EBDF| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08EBE1| PLX

|08EBE2| RTS

;===================================================================================================

pool Ancilla2F_LampFlame

.char
|08EBE3| db $9C, $9C, $FF, $FF
|08EBE7| db $A4, $A5, $B2, $B3
|08EBEB| db $E3, $F3, $FF, $FF

.offset_y_low
|08EBEF| db  -3,   0,   0,   0
|08EBF3| db   0,   0,   8,   8
|08EBF7| db   0,   8,   0,   0

.offset_y_high
|08EBFB| db  -1,   0,   0,   0
|08EBFF| db   0,   0,   0,   0
|08EC03| db   0,   0,   0,   0

.offset_x
|08EC07| db   4,  10,   0,   0
|08EC0B| db   1,   9,   2,   7
|08EC0F| db   4,   4,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla2F_LampFlame:
|08EC13| JSR Ancilla_PrepOAMCoord.adjusted

|08EC16| LDA.b $00
|08EC18| STA.b $06

|08EC1A| LDA.b $01
|08EC1C| STA.b $07

|08EC1E| LDY.b #$00

|08EC20| LDA.w $0C68,X
|08EC23| BNE .continue

|08EC25| STZ.w $0C4A,X

|08EC28| RTS

;---------------------------------------------------------------------------------------------------

.continue
|08EC29| AND.b #$F8
|08EC2B| LSR A
|08EC2C| TAX

.next_object
|08EC2D| LDA.w .char,X
|08EC30| CMP.b #$FF
|08EC32| BEQ .skip

|08EC34| LDA.w .offset_y_low,X
|08EC37| CLC
|08EC38| ADC.b $06
|08EC3A| STA.b $00

|08EC3C| LDA.b $07
|08EC3E| ADC.w .offset_y_high,X
|08EC41| STA.b $01

|08EC43| LDA.w .offset_x,X
|08EC46| CLC
|08EC47| ADC.b $04
|08EC49| STA.b $02

|08EC4B| LDA.b $05
|08EC4D| ADC.b #$00
|08EC4F| STA.b $03

|08EC51| JSR Ancilla_SetOAM_XY

|08EC54| LDA.w .char,X
|08EC57| STA.b ($90),Y

|08EC59| INY

|08EC5A| LDA.b #$02
|08EC5C| ORA.b $65
|08EC5E| STA.b ($90),Y

|08EC60| INY
|08EC61| PHY

|08EC62| TYA
|08EC63| SEC
|08EC64| SBC.b #$04
|08EC66| LSR A
|08EC67| LSR A
|08EC68| TAY

|08EC69| LDA.b #$00
|08EC6B| STA.b ($92),Y

|08EC6D| PLY

.skip
|08EC6E| INX
|08EC6F| TXA
|08EC70| AND.b #$03
|08EC72| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08EC74| BRL Ancilla_RestoreIndex

;===================================================================================================


pool Ancilla41_WaterfallSplash

.char
|08EC77| db $C0, $FF
|08EC79| db $AC, $AC
|08EC7B| db $AE, $AE
|08EC7D| db $BF, $BF

.prop
|08EC7F| db $84, $FF
|08EC81| db $84, $C4
|08EC83| db $84, $C4
|08EC85| db $84, $C4

.size
|08EC87| db $02, $FF
|08EC89| db $02, $02
|08EC8B| db $02, $02
|08EC8D| db $00, $00

;---------------------------------------------------------------------------------------------------

.offset_y_low
|08EC8F| db  -4,   0
|08EC91| db  -5,  -5
|08EC93| db  -3,  -3
|08EC95| db  12,  12

.offset_y_high
|08EC97| db  -1,   0
|08EC99| db  -1,  -1
|08EC9B| db  -1,  -1
|08EC9D| db   0,   0

.offset_x_low
|08EC9F| db   0,   0
|08ECA1| db  -4,   4
|08ECA3| db  -7,   7
|08ECA5| db  -9,  17

.offset_x_high
|08ECA7| db   0,   0
|08ECA9| db  -1,   0
|08ECAB| db  -1,   0
|08ECAD| db  -1,   0

endpool

;---------------------------------------------------------------------------------------------------

Ancilla41_WaterfallSplash:
|08ECAF| LDY.b #$00

|08ECB1| LDA.b $1B
|08ECB3| BNE .indoors

|08ECB5| LDY.b #$01

.indoors
|08ECB7| JSR Ancilla_CheckForEntranceTrigger
|08ECBA| BCS .splish_splash

|08ECBC| STZ.w $0C4A,X

|08ECBF| RTS

;---------------------------------------------------------------------------------------------------

.splish_splash
|08ECC0| LDA.b $11
|08ECC2| BNE .skip_sfx

|08ECC4| LDA.b $1A
|08ECC6| AND.b #$07
|08ECC8| BNE .skip_sfx

|08ECCA| LDA.b #$1C ; SFX2.1C
|08ECCC| JSR Ancilla_SFX2_Near

.skip_sfx
|08ECCF| LDA.b #$01
|08ECD1| STA.w $0351

|08ECD4| LDA.b $2E
|08ECD6| SEC
|08ECD7| SBC.b #$06
|08ECD9| BMI .dont_reset_anim

|08ECDB| STA.b $2E

.dont_reset_anim
|08ECDD| LDA.w $0C68,X
|08ECE0| BNE .anim_delay

|08ECE2| LDA.b #$02
|08ECE4| STA.w $0C68,X

|08ECE7| LDA.w $0C5E,X
|08ECEA| INC A
|08ECEB| AND.b #$03
|08ECED| STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.anim_delay
|08ECF0| LDA.b $1B
|08ECF2| BEQ .set_y_coord

|08ECF4| LDA.b $20
|08ECF6| CMP.b #$38
|08ECF8| BCS .set_y_coord

|08ECFA| LDA.b #$38
|08ECFC| STA.w $0BFA,X

|08ECFF| LDA.b #$0D
|08ED01| STA.w $0C0E,X
|08ED04| BRA .set_x_coord

.set_y_coord
|08ED06| LDA.b $20
|08ED08| STA.w $0BFA,X

|08ED0B| LDA.b $21
|08ED0D| STA.w $0C0E,X

.set_x_coord
|08ED10| LDA.b $22
|08ED12| STA.w $0C04,X

|08ED15| LDA.b $23
|08ED17| STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

|08ED1A| JSR Ancilla_PrepOAMCoord.adjusted

|08ED1D| LDA.b $24
|08ED1F| BPL .positive_link_z

|08ED21| LDA.b #$00

.positive_link_z
|08ED23| REP #$20

|08ED25| AND.w #$00FF
|08ED28| EOR.w #$FFFF
|08ED2B| INC A

|08ED2C| CLC
|08ED2D| ADC.b $00
|08ED2F| STA.b $00
|08ED31| STA.b $06

;---------------------------------------------------------------------------------------------------

|08ED33| SEP #$20

|08ED35| LDA.w $0C5E,X
|08ED38| ASL A
|08ED39| TAX

|08ED3A| LDY.b #$00

.next_object
|08ED3C| LDA.w .char,X
|08ED3F| CMP.b #$FF
|08ED41| BEQ .skip

|08ED43| LDA.w .offset_y_low,X
|08ED46| CLC
|08ED47| ADC.b $06
|08ED49| STA.b $00

|08ED4B| LDA.w .offset_y_high,X
|08ED4E| ADC.b $07
|08ED50| STA.b $01

|08ED52| LDA.w .offset_x_low,X
|08ED55| CLC
|08ED56| ADC.b $04
|08ED58| STA.b $02

|08ED5A| LDA.w .offset_x_high,X
|08ED5D| ADC.b $05
|08ED5F| STA.b $03

|08ED61| JSR Ancilla_SetOAM_XY

|08ED64| LDA.w .char,X
|08ED67| STA.b ($90),Y

|08ED69| INY

|08ED6A| LDA.w .prop,X
|08ED6D| ORA.b #$30
|08ED6F| STA.b ($90),Y

|08ED71| INY
|08ED72| PHY

|08ED73| TYA
|08ED74| SEC
|08ED75| SBC.b #$04
|08ED77| LSR A
|08ED78| LSR A
|08ED79| TAY

|08ED7A| LDA.w .size,X
|08ED7D| STA.b ($92),Y

|08ED7F| PLY

.skip
|08ED80| INX

|08ED81| TXA
|08ED82| AND.b #$01
|08ED84| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08ED86| BRL Ancilla_RestoreIndex

;===================================================================================================

Gravestone_Move:
|08ED89| PHB
|08ED8A| PHK
|08ED8B| PLB

|08ED8C| LDA.b $11
|08ED8E| BNE .exit

|08ED90| LDA.b #$F8
|08ED92| STA.w $0C22,X

|08ED95| JSR AncillaMoveY
|08ED98| JSR Gravestone_ActAsBarrier

|08ED9B| LDA.w $038A,X
|08ED9E| STA.b $00

|08EDA0| LDA.w $038F,X
|08EDA3| STA.b $01

|08EDA5| LDA.w $0BFA,X
|08EDA8| STA.b $02

|08EDAA| LDA.w $0C0E,X
|08EDAD| STA.b $03

;---------------------------------------------------------------------------------------------------

|08EDAF| REP #$20

|08EDB1| LDA.b $02
|08EDB3| CMP.b $00

|08EDB5| SEP #$20
|08EDB7| BCS .exit

|08EDB9| STZ.w $0C4A,X

|08EDBC| STZ.w $03E9

|08EDBF| LDA.b $48
|08EDC1| AND.b #$FB
|08EDC3| STA.b $48

|08EDC5| LDA.w $03BA,X
|08EDC8| STA.b $72

|08EDCA| LDA.w $03B6,X
|08EDCD| STA.b $73

|08EDCF| REP #$20

|08EDD1| LDA.b $72
|08EDD3| STA.w $0698

;---------------------------------------------------------------------------------------------------

|08EDD6| LDY.b #$48

|08EDD8| CMP.w #$0532
|08EDDB| BEQ .no_update_change

|08EDDD| LDY.b #$60
|08EDDF| CMP.w #$0488
|08EDE2| BEQ .no_update_change

|08EDE4| LDY.b #$40

.no_update_change
|08EDE6| TYA
|08EDE7| AND.w #$00FF
|08EDEA| STA.w $0692

|08EDED| SEP #$20

|08EDEF| PHX
|08EDF0| JSL BigMap16Update_long
|08EDF4| PLX

|08EDF5| BRA .exit

;---------------------------------------------------------------------------------------------------

.exit
|08EDF7| PLB

|08EDF8| RTL

;===================================================================================================

pool Ancilla24_Gravestone

.char
|08EDF9| db $C8, $C8, $D8, $D8

.prop
|08EDFD| db $00, $40, $00, $40

endpool

;---------------------------------------------------------------------------------------------------

Ancilla24_Gravestone:
|08EE01| PHX

|08EE02| JSR Ancilla_PrepOAMCoord.adjusted

|08EE05| REP #$20

|08EE07| LDA.b $02
|08EE09| STA.b $06

|08EE0B| SEP #$20

|08EE0D| LDA.b #$10
|08EE0F| JSL AllocateOAMInRegionB

;---------------------------------------------------------------------------------------------------

|08EE13| LDY.b #$00
|08EE15| TYX

.next_object
|08EE16| JSR Ancilla_SetOAM_XY

|08EE19| LDA.w .char,X
|08EE1C| STA.b ($90),Y

|08EE1E| INY

|08EE1F| LDA.w .prop,X
|08EE22| ORA.b #$3D
|08EE24| STA.b ($90),Y

|08EE26| INY
|08EE27| PHY

|08EE28| TYA
|08EE29| SEC
|08EE2A| SBC.b #$04
|08EE2C| LSR A
|08EE2D| LSR A
|08EE2E| TAY

|08EE2F| LDA.b #$02
|08EE31| STA.b ($92),Y

|08EE33| PLY

|08EE34| INX

|08EE35| REP #$20

|08EE37| LDA.b $02
|08EE39| CLC
|08EE3A| ADC.w #$0010
|08EE3D| STA.b $02

|08EE3F| CPX.b #$02
|08EE41| BNE .left_side

|08EE43| LDA.b $00
|08EE45| CLC
|08EE46| ADC.w #$0008
|08EE49| STA.b $00

|08EE4B| LDA.b $06
|08EE4D| STA.b $02

.left_side
|08EE4F| SEP #$20

|08EE51| CPX.b #$04
|08EE53| BNE .next_object

;---------------------------------------------------------------------------------------------------

|08EE55| PLX

|08EE56| RTS

;===================================================================================================

Gravestone_ActAsBarrier:
|08EE57| LDA.w $0BFA,X
|08EE5A| STA.b $00

|08EE5C| LDA.w $0C0E,X
|08EE5F| STA.b $01

|08EE61| LDA.w $0C04,X
|08EE64| STA.b $02

|08EE66| LDA.w $0C18,X
|08EE69| STA.b $03

;---------------------------------------------------------------------------------------------------

|08EE6B| REP #$20

|08EE6D| LDA.b $00
|08EE6F| CLC
|08EE70| ADC.w #$0018
|08EE73| STA.b $04

|08EE75| LDA.b $02
|08EE77| CLC
|08EE78| ADC.w #$0020
|08EE7B| STA.b $06

|08EE7D| LDA.b $20
|08EE7F| CLC
|08EE80| ADC.w #$0008
|08EE83| STA.b $08

;---------------------------------------------------------------------------------------------------

|08EE85| CMP.b $00
|08EE87| BCC .not_close

|08EE89| CMP.b $04
|08EE8B| BCS .not_close

|08EE8D| LDA.b $22
|08EE8F| CLC
|08EE90| ADC.w #$0008
|08EE93| CMP.b $02
|08EE95| BCC .not_close

|08EE97| CMP.b $06
|08EE99| BCS .not_close

;---------------------------------------------------------------------------------------------------

|08EE9B| LDA.b $08
|08EE9D| SEC
|08EE9E| SBC.b $04
|08EEA0| BPL .link_below

|08EEA2| EOR.w #$FFFF
|08EEA5| INC A

.link_below
|08EEA6| STA.b $0A

|08EEA8| CLC
|08EEA9| ADC.b $20
|08EEAB| STA.b $20

|08EEAD| LDA.b $30
|08EEAF| CMP.w #$0080
|08EEB2| BCC .sign_correct

|08EEB4| ORA.w #$FF00

.sign_correct
|08EEB7| STA.b $08

;---------------------------------------------------------------------------------------------------

|08EEB9| LDA.b $0A
|08EEBB| CLC
|08EEBC| ADC.b $08
|08EEBE| AND.w #$00FF
|08EEC1| STA.b $08

|08EEC3| LDA.b $30
|08EEC5| AND.w #$FF00
|08EEC8| ORA.b $08
|08EECA| STA.b $30

|08EECC| LDA.w #$0004
|08EECF| TSB.b $48

;---------------------------------------------------------------------------------------------------

.not_close
|08EED1| SEP #$20

|08EED3| LDA.b $2F
|08EED5| BEQ .exit

|08EED7| LDA.b $48
|08EED9| AND.b #$FB
|08EEDB| STA.b $48

.exit
|08EEDD| RTS

;===================================================================================================

pool AncillaDraw_SkullWoodsFlame

.flame_offset_y_low
|08EEDE| db   0
|08EEDF| db   0
|08EEE0| db   0
|08EEE1| db  -3

.flame_offset_y_high
|08EEE2| db   0
|08EEE3| db   0
|08EEE4| db   0
|08EEE5| db  -1

.flame_char
|08EEE6| db $8E
|08EEE7| db $A0
|08EEE8| db $A2
|08EEE9| db $A4

.flame_prop
|08EEEA| db $02
|08EEEB| db $02
|08EEEC| db $02
|08EEED| db $00

endpool

;===================================================================================================

pool AncillaDraw_SkullWoodsBlast

.blast_char
|08EEEE| db $86, $86, $86, $FF, $FF, $FF
|08EEF4| db $86, $86, $86, $86, $86, $86
|08EEFA| db $8A, $8A, $8A, $8A, $8A, $8A
|08EF00| db $9B, $9B, $9B, $9B, $9B, $9B

.blast_prop
|08EF06| db $00, $00, $00, $00, $00, $00
|08EF0C| db $00, $00, $00, $00, $00, $00
|08EF12| db $00, $00, $00, $00, $00, $00
|08EF18| db $80, $40, $40, $80, $40, $00

.blast_size
|08EF1E| db $02, $02, $02, $02, $01, $01
|08EF24| db $02, $02, $02, $02, $02, $02
|08EF2A| db $02, $02, $02, $02, $02, $02
|08EF30| db $00, $00, $00, $00, $00, $00

.blast_offset_y
|08EF36| dw -31, -24, -22,  -1,  -1,  -1
|08EF42| dw -37, -32, -32, -23, -16, -14
|08EF4E| dw -37, -32, -32, -23, -16, -14
|08EF5A| dw -35, -29, -28, -20, -13, -11

.blast_offset_x
|08EF66| dw -13, -21, -10,  -1,  -1,  -1
|08EF72| dw -16, -27,  -4, -16,  -6, -25
|08EF7E| dw -16, -27,  -4, -16,  -6, -25
|08EF8A| dw -13,  -5, -27, -11, -22,  -3

;---------------------------------------------------------------------------------------------------

.blast_data_index
|08EF96| db $00
|08EF97| db $06
|08EF98| db $0C
|08EF99| db $12

endpool

;===================================================================================================

Ancilla34_SkullWoodsFire:
|08EF9A| LDA.l $7F0010
|08EF9E| BEQ .inactive

|08EFA0| LDA.w $0C5E,X
|08EFA3| CMP.b #$04
|08EFA5| BEQ .inactive

|08EFA7| DEC.w $03B1,X
|08EFAA| BPL .inactive

|08EFAC| LDA.b #$05
|08EFAE| STA.w $03B1,X

|08EFB1| INC.w $0C5E,X

.inactive
|08EFB4| LDX.b #$03
|08EFB6| LDY.b #$00

;===================================================================================================

SkullWoodsFlame_DoNext:
|08EFB8| LDA.l $7F0008,X
|08EFBC| DEC A
|08EFBD| STA.l $7F0008,X
|08EFC1| BMI .reset_flame_index

.only_flame_draw
|08EFC3| BRL AncillaDraw_SkullWoodsFlame

;---------------------------------------------------------------------------------------------------

.reset_flame_index
|08EFC6| LDA.b #$05
|08EFC8| STA.l $7F0008,X

|08EFCC| LDA.l $7F0000,X
|08EFD0| CMP.b #$80
|08EFD2| BEQ .only_flame_draw

|08EFD4| INC A
|08EFD5| STA.l $7F0000,X
|08EFD9| BEQ .reset_control

|08EFDB| CMP.b #$04
|08EFDD| BNE .only_flame_draw

|08EFDF| LDA.b #$00
|08EFE1| STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

.reset_control
|08EFE5| REP #$20

|08EFE7| LDA.l $7F0018
|08EFEB| SEC
|08EFEC| SBC.w #$0008
|08EFEF| STA.l $7F0018

|08EFF3| CMP.w #$00C8
|08EFF6| BCS .skip_sfx

|08EFF8| LDA.w #$0098
|08EFFB| SEC
|08EFFC| SBC.b $E2
|08EFFE| STA.b $00

|08F000| SEP #$20

|08F002| LDA.l $7F0010
|08F006| CMP.b #$01
|08F008| BEQ .skip_sfx

|08F00A| LDA.b #$01
|08F00C| STA.l $7F0010

|08F010| LDA.b $00
|08F012| JSR Ancilla_SetPanRelativeCoordinates
|08F015| ORA.b #$0C ; SFX2.0C
|08F017| STA.w $012E

;---------------------------------------------------------------------------------------------------

.skip_sfx
|08F01A| REP #$20

|08F01C| LDA.l $7F0018
|08F020| CMP.w #$00A8
|08F023| BCS .dont_terminate

|08F025| LDA.l $7F0000,X
|08F029| AND.w #$FF00
|08F02C| ORA.w #$0080
|08F02F| STA.l $7F0000,X

.dont_terminate
|08F033| PHX

|08F034| TXA
|08F035| ASL A
|08F036| TAX

|08F037| LDA.l $7F001A
|08F03B| STA.l $7F0030,X

|08F03F| LDA.l $7F0018
|08F043| STA.l $7F0020,X

|08F047| PLX

|08F048| SEP #$20

|08F04A| LDA.w $012E
|08F04D| BNE AncillaDraw_SkullWoodsFlame

|08F04F| LDA.l $7F001A
|08F053| SEC
|08F054| SBC.b $E2

|08F056| JSR Ancilla_SetPanRelativeCoordinates
|08F059| ORA.b #$2A ; SFX2.2A
|08F05B| STA.w $012E

;===================================================================================================

AncillaDraw_SkullWoodsFlame:
|08F05E| SEP #$20

|08F060| PHX

|08F061| LDA.l $7F0000,X
|08F065| BPL .continue_with_flame

|08F067| BRL .skip_flame

;---------------------------------------------------------------------------------------------------

.continue_with_flame
|08F06A| PHY

|08F06B| TAY

|08F06C| LDA.w .flame_offset_y_low,Y
|08F06F| STA.b $04

|08F071| LDA.w .flame_offset_y_high,Y
|08F074| STA.b $05

|08F076| LDA.w .flame_char,Y
|08F079| STA.b $06

|08F07B| LDA.w .flame_prop,Y
|08F07E| STA.b $07

|08F080| TXA
|08F081| ASL A
|08F082| TAX

;---------------------------------------------------------------------------------------------------

|08F083| REP #$20

|08F085| LDA.l $7F0020,X
|08F089| SEC
|08F08A| SBC.b $E8

|08F08C| CLC
|08F08D| ADC.b $04
|08F08F| STA.b $00

|08F091| LDA.l $7F0030,X
|08F095| SEC
|08F096| SBC.b $E2
|08F098| STA.b $02

|08F09A| CLC
|08F09B| ADC.w #$0008
|08F09E| STA.b $08

|08F0A0| SEP #$20

|08F0A2| PLY

|08F0A3| JSR Ancilla_SetOAM_XY

|08F0A6| LDA.b $06
|08F0A8| STA.b ($90),Y

|08F0AA| INY

|08F0AB| LDA.b #$32
|08F0AD| STA.b ($90),Y

|08F0AF| INY
|08F0B0| PHY

|08F0B1| TYA
|08F0B2| SEC
|08F0B3| SBC.b #$04
|08F0B5| LSR A
|08F0B6| LSR A
|08F0B7| TAY

|08F0B8| LDA.b $07
|08F0BA| STA.b ($92),Y

|08F0BC| PLY

|08F0BD| CMP.b #$02
|08F0BF| BEQ .skip_flame

;---------------------------------------------------------------------------------------------------

|08F0C1| REP #$20

|08F0C3| LDA.b $08
|08F0C5| STA.b $02

|08F0C7| SEP #$20

|08F0C9| JSR Ancilla_SetOAM_XY

|08F0CC| LDA.b $06
|08F0CE| INC A
|08F0CF| STA.b ($90),Y

|08F0D1| INY

|08F0D2| LDA.b #$32
|08F0D4| STA.b ($90),Y

|08F0D6| INY
|08F0D7| PHY

|08F0D8| TYA
|08F0D9| SEC
|08F0DA| SBC.b #$04
|08F0DC| LSR A
|08F0DD| LSR A
|08F0DE| TAY

|08F0DF| LDA.b $07
|08F0E1| STA.b ($92),Y

|08F0E3| PLY

;---------------------------------------------------------------------------------------------------

.skip_flame
|08F0E4| PLX
|08F0E5| DEX
|08F0E6| BMI AncillaDraw_SkullWoodsBlast

|08F0E8| BRL SkullWoodsFlame_DoNext

;===================================================================================================

AncillaDraw_SkullWoodsBlast:
|08F0EB| LDX.b #$03

.find_blast
|08F0ED| LDA.l $7F0000,X
|08F0F1| BPL .one_active

|08F0F3| DEX
|08F0F4| BPL .find_blast

|08F0F6| LDX.w $0FA0
|08F0F9| STZ.w $0C4A,X

|08F0FC| RTS

.one_active
|08F0FD| LDX.w $0FA0

|08F100| LDA.l $7F0010
|08F104| BEQ .exit

|08F106| LDA.w $0C5E,X
|08F109| CMP.b #$04
|08F10B| BEQ .exit

|08F10D| TAX

|08F10E| LDA.w .blast_data_index,X
|08F111| TAX

|08F112| STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_object
|08F114| LDA.w .blast_char,X
|08F117| CMP.b #$FF
|08F119| BEQ .skip

|08F11B| PHX

|08F11C| TXA
|08F11D| ASL A
|08F11E| TAX

|08F11F| REP #$20

|08F121| LDA.w #$00C8
|08F124| SEC
|08F125| SBC.b $E8

|08F127| CLC
|08F128| ADC.w .blast_offset_y,X
|08F12B| STA.b $00

|08F12D| LDA.w #$00A8
|08F130| SEC
|08F131| SBC.b $E2

|08F133| CLC
|08F134| ADC.w .blast_offset_x,X
|08F137| STA.b $02

|08F139| SEP #$20

|08F13B| PLX

|08F13C| JSR Ancilla_SetOAM_XY

|08F13F| LDA.w .blast_char,X
|08F142| STA.b ($90),Y

|08F144| INY

|08F145| LDA.w .blast_prop,X
|08F148| ORA.b #$30
|08F14A| ORA.b #$02
|08F14C| STA.b ($90),Y

|08F14E| INY
|08F14F| PHY

|08F150| TYA
|08F151| SEC
|08F152| SBC.b #$04
|08F154| LSR A
|08F155| LSR A
|08F156| TAY

|08F157| LDA.w .blast_size,X
|08F15A| STA.b ($92),Y

|08F15C| PLY

.skip
|08F15D| INX

|08F15E| INC.b $08

|08F160| LDA.b $08
|08F162| CMP.b #$06
|08F164| BNE .next_object

;---------------------------------------------------------------------------------------------------

.exit
|08F166| BRL Ancilla_RestoreIndex

;===================================================================================================

pool Ancilla3A_BigBombExplosion

.offset_y
|08F169| dw   0, -16, -24, -16
|08F171| dw   0,   0,  16,  24
|08F179| dw  16

.offset_x
|08F17B| dw   0, -16,   0,  16
|08F183| dw -24,  24, -16,   0
|08F18B| dw  16

endpool

;---------------------------------------------------------------------------------------------------

Ancilla3A_BigBombExplosion:
|08F18D| LDA.b $11
|08F18F| BNE .just_draw

|08F191| DEC.w $039F,X

|08F194| LDA.w $039F,X
|08F197| BNE .just_draw

|08F199| INC.w $0C5E,X

|08F19C| LDA.w $0C5E,X
|08F19F| CMP.b #$02
|08F1A1| BNE .skip_sfx

|08F1A3| LDA.b #$0C ; SFX2.0C
|08F1A5| JSR Ancilla_SFX2_Pan

.skip_sfx
|08F1A8| LDA.w $0C5E,X
|08F1AB| CMP.b #$0B
|08F1AD| BNE .dont_terminate

|08F1AF| STZ.w $0C4A,X

|08F1B2| RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
|08F1B3| TAY
|08F1B4| LDA.w BombTimers,Y
|08F1B7| STA.w $039F,X

.just_draw
|08F1BA| LDA.b #$08
|08F1BC| STA.b $09

|08F1BE| LDA.b #$30
|08F1C0| STA.b $65
|08F1C2| STZ.b $64

|08F1C4| STZ.b $0A

|08F1C6| LDA.b #$32
|08F1C8| STA.b $0B

|08F1CA| LDA.w $0C5E,X
|08F1CD| TAY

|08F1CE| LDA.w BombDraw.object_count,Y
|08F1D1| STA.b $08

|08F1D3| LDA.w BombAnimationSteps,Y
|08F1D6| TAY

|08F1D7| LDA.w BombDraw.data_offset,Y
|08F1DA| ASL A
|08F1DB| TAY

|08F1DC| ASL A
|08F1DD| STA.b $04
|08F1DF| STZ.b $05

|08F1E1| TYA
|08F1E2| STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

|08F1E5| LDY.b #$00

.next_object
|08F1E7| PHX
|08F1E8| PHY

|08F1E9| LDA.w $0BFA,X
|08F1EC| STA.b $00

|08F1EE| LDA.w $0C0E,X
|08F1F1| STA.b $01

|08F1F3| LDA.w $0C04,X
|08F1F6| STA.b $02

|08F1F8| LDA.w $0C18,X
|08F1FB| STA.b $03

|08F1FD| LDA.b $09
|08F1FF| ASL A
|08F200| TAY

|08F201| REP #$20

|08F203| LDA.b $00
|08F205| CLC
|08F206| ADC.w .offset_y,Y

|08F209| SEC
|08F20A| SBC.b $E8
|08F20C| STA.b $00

|08F20E| LDA.b $02
|08F210| CLC
|08F211| ADC.w .offset_x,Y

|08F214| SEC
|08F215| SBC.b $E2
|08F217| STA.b $02

|08F219| SEP #$20

|08F21B| PLY

|08F21C| LDA.w $0C54,X
|08F21F| TAX

|08F220| LDA.b $01
|08F222| BNE .skip

|08F224| LDA.b $03
|08F226| BNE .skip

;---------------------------------------------------------------------------------------------------

|08F228| PHX
|08F229| PHY

|08F22A| LDA.b #$18
|08F22C| JSR AllocateOAMInRegionsADF

|08F22F| PLY
|08F230| PLX

|08F231| LDA.b $00
|08F233| STA.b $0C

|08F235| LDA.b $01
|08F237| STA.b $0D

|08F239| LDA.b $02
|08F23B| STA.b $0E

|08F23D| LDA.b $03
|08F23F| STA.b $0F

|08F241| STZ.b $06
|08F243| STZ.b $07

|08F245| JSR AncillaDraw_Explosion

;---------------------------------------------------------------------------------------------------

.skip
|08F248| PLX

|08F249| DEC.b $09
|08F24B| BPL .next_object

;---------------------------------------------------------------------------------------------------

|08F24D| LDA.w $0C5E,X
|08F250| CMP.b #$03
|08F252| BNE .exit

|08F254| LDA.w $039F,X
|08F257| CMP.b #$01
|08F259| BNE .exit

|08F25B| LDA.w $0BFA,X
|08F25E| STA.b $00

|08F260| LDA.w $0C0E,X
|08F263| STA.b $01

|08F265| LDA.w $0C04,X
|08F268| STA.b $02

|08F26A| LDA.w $0C18,X
|08F26D| STA.b $03

|08F26F| PHX

|08F270| JSL FindBombableThings

|08F274| PLX

|08F275| LDA.b #$00
|08F277| STA.l $7EF3CC

.exit
|08F27B| RTS

;===================================================================================================

pool RevivalFairy

.timer
|08F27C| db   0, 144

.char
|08F27E| db $4B, $4D, $49, $47, $49

endpool

;---------------------------------------------------------------------------------------------------

RevivalFairy:
|08F283| PHB
|08F284| PHK
|08F285| PLB

|08F286| LDX.b #$00

|08F288| LDA.w $0C54,X
|08F28B| BEQ .emerging

|08F28D| CMP.b #$03
|08F28F| BNE .emerged

|08F291| BRL .finish_up

;---------------------------------------------------------------------------------------------------

.emerging
|08F294| DEC.w $039F,X

|08F297| LDA.w $039F,X
|08F29A| BNE .sprinkling

|08F29C| INC.w $0C54,X

|08F29F| LDY.w $0C54,X

|08F2A2| LDA.w .timer,Y
|08F2A5| STA.w $039F,X

|08F2A8| STZ.w $0380,X
|08F2AB| STZ.w $0294,X

|08F2AE| BRL .draw

;---------------------------------------------------------------------------------------------------

.sprinkling
|08F2B1| JSR AncillaMoveZ

|08F2B4| BRL .draw

;---------------------------------------------------------------------------------------------------

.emerged
|08F2B7| CMP.b #$01
|08F2B9| BNE .fly_away_now

|08F2BB| DEC.w $039F,X
|08F2BE| LDA.w $039F,X
|08F2C1| BNE .busy_sprinkling

|08F2C3| INC.w $0C54,X

|08F2C6| STZ.w $0294,X
|08F2C9| STZ.w $0C2C,X

|08F2CC| BRL .draw

;---------------------------------------------------------------------------------------------------

.busy_sprinkling
|08F2CF| CMP.b #$4F
|08F2D1| BEQ .do_sprinkle

|08F2D3| CMP.b #$8F
|08F2D5| BNE .dont_sprinkle

.do_sprinkle
|08F2D7| INC.w $0385,X

|08F2DA| LDA.b #$31 ; SFX2.31
|08F2DC| JSR Ancilla_SFX2_Pan

.dont_sprinkle
|08F2DF| LDA.w $0385,X
|08F2E2| BEQ .not_sprinkling

|08F2E4| DEC.w $0394,X
|08F2E7| BPL .not_sprinkling

|08F2E9| LDA.b #$05
|08F2EB| STA.w $0394,X

|08F2EE| INC.w $0C5E,X

|08F2F1| LDA.w $0C5E,X
|08F2F4| CMP.b #$03
|08F2F6| BNE .not_sprinkling

|08F2F8| STZ.w $0C5E,X
|08F2FB| STZ.w $0385,X

;---------------------------------------------------------------------------------------------------

.not_sprinkling
|08F2FE| LDY.b #$FF

|08F300| LDA.w $0380,X
|08F303| BEQ .descending

|08F305| LDY.b #$01

.descending
|08F307| STY.b $00

|08F309| LDA.w $0294,X
|08F30C| CLC
|08F30D| ADC.b $00
|08F30F| STA.w $0294,X
|08F312| BPL .positive_z

|08F314| EOR.b #$FF
|08F316| INC A

.positive_z
|08F317| CMP.b #$08
|08F319| BNE .dont_toggle_z

|08F31B| LDA.w $0380,X
|08F31E| EOR.b #$01
|08F320| STA.w $0380,X

.dont_toggle_z
|08F323| JSR AncillaMoveZ

|08F326| BRA .draw

;---------------------------------------------------------------------------------------------------

.fly_away_now
|08F328| CMP.b #$02
|08F32A| BNE .draw

|08F32C| LDA.w $0294,X
|08F32F| CMP.b #$18
|08F331| BCS .at_max_z

|08F333| CLC
|08F334| ADC.b #$01
|08F336| STA.w $0294,X

.at_max_z
|08F339| LDA.w $0C2C,X
|08F33C| CMP.b #$10
|08F33E| BCS .at_max_x

|08F340| CLC
|08F341| ADC.b #$01
|08F343| STA.w $0C2C,X

.at_max_x
|08F346| JSR AncillaMoveX
|08F349| JSR AncillaMoveZ

;---------------------------------------------------------------------------------------------------

.draw
|08F34C| LDA.b #$0C
|08F34E| JSL AllocateOAMInRegionC

|08F352| JSR Ancilla_PrepOAMCoord

|08F355| PHX

|08F356| STZ.b $0A

|08F358| LDA.w $0C54,X
|08F35B| CMP.b #$01
|08F35D| BNE .am_not_sprinkling

|08F35F| LDA.w $0385,X
|08F362| BEQ .am_not_sprinkling

|08F364| LDA.w $0C5E,X
|08F367| INC A
|08F368| STA.b $0A

.am_not_sprinkling
|08F36A| LDY.b #$00

|08F36C| REP #$20

|08F36E| LDA.w $029E,X
|08F371| AND.w #$00FF
|08F374| CMP.w #$0080
|08F377| BCC .positive_altitude

|08F379| ORA.w #$FF00

.positive_altitude
|08F37C| EOR.w #$FFFF
|08F37F| INC A
|08F380| CLC
|08F381| ADC.b $00
|08F383| STA.b $00

;---------------------------------------------------------------------------------------------------

|08F385| SEP #$20

|08F387| JSR Ancilla_SetOAM_XY

|08F38A| LDA.b $0A
|08F38C| BEQ .flapping

|08F38E| DEC A
|08F38F| CLC
|08F390| ADC.b #$02
|08F392| TAX

|08F393| BRA .set_char

.flapping
|08F395| LDA.b $1A
|08F397| AND.b #$04
|08F399| LSR A
|08F39A| LSR A
|08F39B| TAX

.set_char
|08F39C| LDA.w .char,X
|08F39F| STA.b ($90),Y

|08F3A1| INY

|08F3A2| LDA.b #$74
|08F3A4| STA.b ($90),Y

|08F3A6| TYA
|08F3A7| SEC
|08F3A8| SBC.b #$03
|08F3AA| LSR A
|08F3AB| LSR A
|08F3AC| TAY

|08F3AD| LDA.b #$02
|08F3AF| STA.b ($92),Y

|08F3B1| PLX

|08F3B2| LDY.b #$01

|08F3B4| LDA.b ($90),Y
|08F3B6| CMP.b #$F0
|08F3B8| BNE .finish_up

|08F3BA| LDA.b #$03
|08F3BC| STA.w $0C54,X

|08F3BF| INC.b $11

|08F3C1| LDA.l $7EC211
|08F3C5| STA.b $1C

;---------------------------------------------------------------------------------------------------

.finish_up
|08F3C7| JSR RevivalFairy_Dust
|08F3CA| JSR RevivalFairy_MonitorHP

|08F3CD| PLB

|08F3CE| RTL

;===================================================================================================

RevivalFairy_Dust:
|08F3CF| LDA.w $0C54,X
|08F3D2| BNE .continue

|08F3D4| RTS

;---------------------------------------------------------------------------------------------------

.continue
|08F3D5| LDX.b #$02

|08F3D7| LDA.w $0C54,X
|08F3DA| CMP.b #$02
|08F3DC| BEQ .exit

|08F3DE| DEC.w $039F,X
|08F3E1| BPL .exit

|08F3E3| STZ.w $039F,X

|08F3E6| LDA.b #$10

|08F3E8| LDY.w $0FB3
|08F3EB| BNE .use_region_d

|08F3ED| JSL AllocateOAMInRegionA
|08F3F1| BRA .oam_allocated

.use_region_d
|08F3F3| JSL AllocateOAMInRegionD

;---------------------------------------------------------------------------------------------------

.oam_allocated
|08F3F7| DEC.w $03B1,X
|08F3FA| BPL .just_draw

|08F3FC| LDA.b #$03
|08F3FE| STA.w $03B1,X

|08F401| LDY.b #$03

|08F403| LDA.w PowderDraw.group_offset,Y
|08F406| STA.b $00

;---------------------------------------------------------------------------------------------------

|08F408| LDA.w $0C5E,X
|08F40B| INC A
|08F40C| CMP.b #$0A
|08F40E| BNE .not_fully_sprinkled

|08F410| LDA.b #$20
|08F412| STA.w $039F,X

|08F415| INC.w $0C54,X

|08F418| LDA.b #$02
|08F41A| STA.w $0C5E,X

|08F41D| BRA .exit

;---------------------------------------------------------------------------------------------------

.not_fully_sprinkled
|08F41F| STA.w $0C5E,X

|08F422| CLC
|08F423| ADC.b $00
|08F425| TAY

|08F426| LDA.w PowderDraw.anim_step,Y
|08F429| STA.w $03C2,X

.just_draw
|08F42C| JSR AncillaDraw_Powder

.exit
|08F42F| RTS

;===================================================================================================

RevivalFairy_MonitorHP:
|08F430| LDA.l $7EF36C
|08F434| STA.b $00

|08F436| LDA.l $7EF36D
|08F43A| CMP.b $00

|08F43C| BEQ .at_max

|08F43E| CMP.b #$38
|08F440| BNE .healing

.at_max
|08F442| LDA.w $020A
|08F445| BNE .healing

;---------------------------------------------------------------------------------------------------

|08F447| LDY.b #$00 ; LINKSTATE 00

|08F449| LDA.w $0345
|08F44C| BEQ .not_swimming

|08F44E| LDY.b #$04 ; LINKSTATE 04

|08F450| LDA.b #$04
|08F452| STA.w $0340

|08F455| BRA .set_state

.not_swimming
|08F457| LDA.b $56
|08F459| BEQ .set_state

|08F45B| LDY.b #$17 ; LINKSTATE 17

|08F45D| LDA.b #$01
|08F45F| STA.w $02E0

.set_state
|08F462| STY.b $5D

|08F464| STZ.b $4D
|08F466| STZ.w $036B

|08F469| STZ.w $030D
|08F46C| STZ.w $030A

|08F46F| STZ.b $24
|08F471| STZ.b $46

|08F473| STZ.w $0C4A
|08F476| STZ.w $0C4B
|08F479| STZ.w $0C4C
|08F47C| STZ.w $0C4D
|08F47F| STZ.w $0C4E

|08F482| RTS

;---------------------------------------------------------------------------------------------------

.healing
|08F483| LDX.b #$01

|08F485| LDA.w $0C54,X
|08F488| BNE .link_floating

|08F48A| DEC.w $039F,X

|08F48D| LDA.w $039F,X
|08F490| BNE .delay_ascent

|08F492| INC.w $039F,X

|08F495| LDA.b #$04
|08F497| STA.w $0294,X

|08F49A| JSR AncillaMoveZ

|08F49D| LDA.w $029E,X
|08F4A0| CMP.b #$10
|08F4A2| BCC .delay_ascent

|08F4A4| INC.w $0C54,X

|08F4A7| LDA.b #$02
|08F4A9| STA.w $0294,X

.delay_ascent
|08F4AC| BRA .float_link

;---------------------------------------------------------------------------------------------------

.link_floating
|08F4AE| DEC.w $0380,X
|08F4B1| BPL .delay_bobbing

|08F4B3| LDA.b #$20
|08F4B5| STA.w $0380,X

|08F4B8| LDA.w $0294,X
|08F4BB| EOR.b #$FF
|08F4BD| INC A

|08F4BE| STA.w $0294,X

;---------------------------------------------------------------------------------------------------

.delay_bobbing
|08F4C1| JSR AncillaMoveZ

.float_link
|08F4C4| LDA.w $029E,X
|08F4C7| STA.b $24

|08F4C9| RTS

;===================================================================================================

Animate_GAMEOVER_Letters:
|08F4CA| PHB
|08F4CB| PHK
|08F4CC| PLB

|08F4CD| JSR .main

|08F4D0| PLB

|08F4D1| RTL

;---------------------------------------------------------------------------------------------------

.vector_low
|08F4D2| db GAMEOVER_Sweep
|08F4D3| db GAMEOVER_Unfurl
|08F4D4| db GAMEOVER_Stay

.vector_high
|08F4D5| db >GAMEOVER_Sweep
|08F4D6| db >GAMEOVER_Unfurl
|08F4D7| db >GAMEOVER_Stay

;---------------------------------------------------------------------------------------------------

.main
|08F4D8| LDX.w $0C4A
|08F4DB| BEQ .none_active

|08F4DD| DEX

|08F4DE| LDA.w .vector_low,X
|08F4E1| STA.b $00

|08F4E3| LDA.w .vector_high,X
|08F4E6| STA.b $01

|08F4E8| JMP.w ($0000)

.none_active
|08F4EB| INC.b $11

|08F4ED| RTS

;===================================================================================================

pool GAMEOVER_Sweep

.target_x
|08F4EE| db $40 ; G
|08F4EF| db $50 ; A
|08F4F0| db $60 ; M
|08F4F1| db $70 ; E

|08F4F2| db $88 ; O
|08F4F3| db $98 ; V
|08F4F4| db $A8 ; E
|08F4F5| db $40 ; R

endpool

;---------------------------------------------------------------------------------------------------

GAMEOVER_Sweep:
|08F4F6| LDX.w $035F
|08F4F9| STX.w $0FA0

|08F4FC| LDY.b #$80
|08F4FE| CPX.b #$07

|08F500| BNE .pointless

|08F502| LDY.b #$80

;---------------------------------------------------------------------------------------------------

.pointless
|08F504| TYA
|08F505| STA.w $0C2C,X

|08F508| JSR AncillaMoveX

|08F50B| LDA.w $0C18,X
|08F50E| BNE .leftwards_ho

|08F510| LDA.w $0C04,X
|08F513| CMP.w .target_x,X
|08F516| BCS .leftwards_ho

|08F518| LDA.w .target_x,X
|08F51B| STA.w $0C04,X

|08F51E| INX
|08F51F| STX.w $035F

|08F522| CPX.b #$08
|08F524| BNE .leftwards_ho

|08F526| LDA.b #$07
|08F528| STA.w $035F

|08F52B| INC.w $0C4A

|08F52E| STZ.w $039D

|08F531| LDA.b #$26 ; SFX3.26
|08F533| STA.w $012F

|08F536| BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.leftwards_ho
|08F538| CPX.b #$07
|08F53A| BNE .proceed_to_draw

|08F53C| LDY.b #$06
|08F53E| CPY.w $039D
|08F541| BEQ .not_moving_together

;---------------------------------------------------------------------------------------------------

.next_follow
|08F543| LDA.w $0C04,X
|08F546| STA.w $0C04,Y

|08F549| DEY
|08F54A| CPY.w $039D
|08F54D| BNE .next_follow

;---------------------------------------------------------------------------------------------------

.not_moving_together
|08F54F| LDA.w $0C18,X
|08F552| BNE .proceed_to_draw

|08F554| LDA.w $0C04,X

|08F557| LDX.w $039D

|08F55A| CMP.w .target_x,X
|08F55D| BCS .proceed_to_draw

|08F55F| DEC.w $039D

.proceed_to_draw
|08F562| BRL GAMEOVER_Stay

;===================================================================================================

pool GAMEOVER_Unfurl

.target_x
|08F565| db $58 ; G
|08F566| db $60 ; A
|08F567| db $68 ; M
|08F568| db $70 ; E

|08F569| db $88 ; O
|08F56A| db $90 ; V
|08F56B| db $98 ; E
|08F56C| db $A0 ; R

endpool

;---------------------------------------------------------------------------------------------------

GAMEOVER_Unfurl:
|08F56D| LDX.w $035F
|08F570| STX.w $0FA0

|08F573| LDA.b #$60
|08F575| STA.w $0C2C,X

|08F578| JSR AncillaMoveX

|08F57B| LDY.w $039D

|08F57E| LDA.w $0C04,X
|08F581| CMP.w .target_x,Y
|08F584| BCC .rightwards_ho

|08F586| LDA.w .target_x,Y
|08F589| STA.w $0C04,Y

|08F58C| INC.w $039D

|08F58F| LDA.w $039D
|08F592| CMP.b #$08
|08F594| BNE .rightwards_ho

|08F596| INC.b $11
|08F598| INC.w $0C4A

|08F59B| BRA .proceed_to_draw

.rightwards_ho
|08F59D| LDA.w $039D
|08F5A0| DEC A
|08F5A1| STA.b $00

|08F5A3| LDX.w $035F
|08F5A6| TXY

.next_follow
|08F5A7| LDA.w $0C04,X
|08F5AA| STA.w $0C04,Y

|08F5AD| DEY
|08F5AE| CPY.b $00
|08F5B0| BNE .next_follow

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
|08F5B2| BRA GAMEOVER_Stay

;===================================================================================================

pool GAMEOVER_Stay

.char
|08F5B4| db $40, $50 ; G
|08F5B6| db $41, $51 ; A
|08F5B8| db $42, $52 ; M
|08F5BA| db $43, $53 ; E

|08F5BC| db $44, $54 ; O
|08F5BE| db $45, $55 ; V
|08F5C0| db $43, $53 ; E
|08F5C2| db $46, $56 ; R

endpool

;---------------------------------------------------------------------------------------------------

GAMEOVER_Stay:
|08F5C4| LDA.b #$00
|08F5C6| STA.b $90

|08F5C8| LDA.b #$08
|08F5CA| STA.b $91

|08F5CC| LDA.b #$20
|08F5CE| STA.b $92

|08F5D0| LDA.b #$0A
|08F5D2| STA.b $93

|08F5D4| LDX.w $035F
|08F5D7| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_letter
|08F5D9| PHX

|08F5DA| LDA.b #$57
|08F5DC| STA.b $00
|08F5DE| STZ.b $01

|08F5E0| LDA.w $0C04,X
|08F5E3| STA.b $02

|08F5E5| LDA.w $0C18,X
|08F5E8| STA.b $03

|08F5EA| JSR Ancilla_SetOAM_XY

|08F5ED| TXA
|08F5EE| ASL A
|08F5EF| TAX

|08F5F0| LDA.w .char+0,X
|08F5F3| STA.b ($90),Y

|08F5F5| INY

|08F5F6| LDA.b #$3C
|08F5F8| STA.b ($90),Y

|08F5FA| INY

|08F5FB| LDA.b #$5F
|08F5FD| STA.b $00
|08F5FF| STZ.b $01

|08F601| JSR Ancilla_SetOAM_XY

|08F604| LDA.w .char+1,X
|08F607| STA.b ($90),Y

|08F609| INY

|08F60A| LDA.b #$3C
|08F60C| STA.b ($90),Y

|08F60E| INY
|08F60F| PHY

|08F610| TYA
|08F611| SEC
|08F612| SBC.b #$08
|08F614| LSR A
|08F615| LSR A
|08F616| TAY

|08F617| LDA.b #$00
|08F619| STA.b ($92),Y

|08F61B| INY

|08F61C| STA.b ($92),Y

|08F61E| PLY
|08F61F| PLX

|08F620| DEX
|08F621| BPL .next_letter

;---------------------------------------------------------------------------------------------------

|08F623| RTS

;===================================================================================================

Ancilla_SetPanRelativeCoordinates:
|08F624| PHX

|08F625| LSR A
|08F626| LSR A
|08F627| LSR A
|08F628| LSR A
|08F629| LSR A

|08F62A| TAX

|08F62B| LDA.l AncillaPanValues,X

|08F62F| PLX

|08F630| RTS

;===================================================================================================

AddAncilla_bank08:
|08F631| PHA

|08F632| JSL FindAncillaSlot

|08F636| PLA

|08F637| TYX
|08F638| BMI .fail

|08F63A| STA.w $0C4A,X

|08F63D| TAY

|08F63E| LDA.w AncillaObjectAllocation,Y
|08F641| STA.w $0C90,X

|08F644| LDA.b $EE
|08F646| STA.w $0C7C,X

|08F649| LDA.w $0476
|08F64C| STA.w $03CA,X

|08F64F| STZ.w $0C22,X
|08F652| STZ.w $0C2C,X

|08F655| STZ.w $0280,X
|08F658| STZ.w $028A,X

|08F65B| CLC

|08F65C| RTS

.fail
|08F65D| SEC

|08F65E| RTS

;===================================================================================================

UNREACHABLE_08F65F:
|08F65F| LDX.b #$05

.next_slot
|08F661| CMP.w $0C4A,X
|08F664| BEQ .found_match

|08F666| DEX
|08F667| BPL .next_slot

|08F669| CLC

|08F66A| RTS

.found_match
|08F66B| SEC

|08F66C| RTS

;===================================================================================================

AncillaPriorities:
|08F66D| db $20, $10, $30, $20

;===================================================================================================

Ancilla_PrepOAMCoord:
|08F671| LDY.w $0C7C,X

|08F674| LDA.w AncillaPriorities,Y
|08F677| STA.b $65
|08F679| STZ.b $64

|08F67B| LDA.w $0BFA,X
|08F67E| STA.b $00

|08F680| LDA.w $0C0E,X
|08F683| STA.b $01

|08F685| LDA.w $0C04,X
|08F688| STA.b $02

|08F68A| LDA.w $0C18,X
|08F68D| STA.b $03

|08F68F| REP #$20

|08F691| LDA.b $00
|08F693| SEC
|08F694| SBC.b $E8
|08F696| STA.b $00

|08F698| LDA.b $02
|08F69A| SEC
|08F69B| SBC.b $E2
|08F69D| STA.b $02
|08F69F| STA.b $04

|08F6A1| SEP #$20

|08F6A3| RTS

;---------------------------------------------------------------------------------------------------

.adjusted
|08F6A4| LDY.w $0C7C,X

|08F6A7| LDA.w AncillaPriorities,Y
|08F6AA| STA.b $65
|08F6AC| STZ.b $64

|08F6AE| LDA.w $0BFA,X
|08F6B1| STA.b $00

|08F6B3| LDA.w $0C0E,X
|08F6B6| STA.b $01

|08F6B8| LDA.w $0C04,X
|08F6BB| STA.b $02

|08F6BD| LDA.w $0C18,X
|08F6C0| STA.b $03

|08F6C2| REP #$20

|08F6C4| LDA.b $00
|08F6C6| SEC
|08F6C7| SBC.w $0122
|08F6CA| STA.b $00

|08F6CC| LDA.b $02
|08F6CE| SEC
|08F6CF| SBC.w $011E
|08F6D2| STA.b $02
|08F6D4| STA.b $04

|08F6D6| SEP #$20

|08F6D8| RTS

;===================================================================================================

Ancilla_PrepOAMCoord_long:
|08F6D9| PHB
|08F6DA| PHK
|08F6DB| PLB

|08F6DC| JSR Ancilla_PrepOAMCoord

|08F6DF| PLB

|08F6E0| RTL

;===================================================================================================

Ancilla_SetOAM_XY:
|08F6E1| PHX

|08F6E2| LDX.b #$F0

|08F6E4| LDA.b $01
|08F6E6| BNE .off_screen

|08F6E8| LDA.b $03
|08F6EA| BNE .off_screen

|08F6EC| LDA.b $02
|08F6EE| STA.b ($90),Y

|08F6F0| LDA.b $00
|08F6F2| CMP.b #$F0
|08F6F4| BCS .off_screen

|08F6F6| TAX

.off_screen
|08F6F7| INY

|08F6F8| TXA
|08F6F9| STA.b ($90),Y

|08F6FB| INY

|08F6FC| PLX

|08F6FD| RTS

;===================================================================================================

Ancilla_SetOAM_XY_long:
|08F6FE| JSR Ancilla_SetOAM_XY

|08F701| RTL

;===================================================================================================

Ancilla_SetOAM_XY_safe:
|08F702| REP #$20

|08F704| LDA.b $02
|08F706| STA.b ($90),Y

|08F708| INY

|08F709| CLC
|08F70A| ADC.w #$0080
|08F70D| CMP.w #$0180
|08F710| BCS .off_screen

|08F712| LDA.b $02
|08F714| AND.w #$0100
|08F717| STA.b $74

|08F719| LDA.b $00
|08F71B| STA.b ($90),Y

|08F71D| CLC
|08F71E| ADC.w #$0010
|08F721| CMP.w #$0100
|08F724| BCC .on_screen

.off_screen
|08F726| LDA.w #$00F0
|08F729| STA.b ($90),Y

.on_screen
|08F72B| SEP #$20

|08F72D| INY

|08F72E| RTS

;===================================================================================================

pool Ancilla_CheckLinkCollision

.offset_y
|08F72F| dw  0
|08F731| dw  8
|08F733| dw  8
|08F735| dw  8
|08F737| dw  0

.offset_x
|08F739| dw  0
|08F73B| dw  8
|08F73D| dw  8
|08F73F| dw  8
|08F741| dw  0

.height
|08F743| dw 20
|08F745| dw 20
|08F747| dw  8
|08F749| dw 28
|08F74B| dw 14

.width
|08F74D| dw 20
|08F74F| dw  3
|08F751| dw  8
|08F753| dw 24
|08F755| dw 14

.offset_link_y
|08F757| dw 12
|08F759| dw 12
|08F75B| dw 12
|08F75D| dw 12
|08F75F| dw 12

.offset_link_x
|08F761| dw  8
|08F763| dw  8
|08F765| dw  8
|08F767| dw 12
|08F769| dw  8

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_CheckLinkCollision:
|08F76B| TYA
|08F76C| ASL A
|08F76D| TAY

|08F76E| LDA.w $0BFA,X
|08F771| STA.b $00

|08F773| LDA.w $0C0E,X
|08F776| STA.b $01

|08F778| LDA.w $0C04,X
|08F77B| STA.b $02

|08F77D| LDA.w $0C18,X
|08F780| STA.b $03

|08F782| STZ.b $0B

|08F784| LDA.w $029E,X
|08F787| STA.b $0A

|08F789| BPL .positive_z

|08F78B| LDA.b #$FF
|08F78D| STA.b $0B

;---------------------------------------------------------------------------------------------------

.positive_z
|08F78F| REP #$20

|08F791| LDA.b $00
|08F793| CLC
|08F794| ADC.b $0A

|08F796| CLC
|08F797| ADC.w .offset_y,Y
|08F79A| STA.b $00

|08F79C| LDA.b $02
|08F79E| CLC
|08F79F| ADC.w .offset_x,Y
|08F7A2| STA.b $02

|08F7A4| LDA.b $20
|08F7A6| CLC
|08F7A7| ADC.w .offset_link_y,Y

|08F7AA| SEC
|08F7AB| SBC.b $00
|08F7AD| STA.b $04

|08F7AF| BPL .positive_y

|08F7B1| EOR.w #$FFFF
|08F7B4| INC A

.positive_y
|08F7B5| STA.b $08

|08F7B7| CMP.w .height,Y
|08F7BA| BCS .no_collision

;---------------------------------------------------------------------------------------------------

|08F7BC| LDA.b $22
|08F7BE| CLC
|08F7BF| ADC.w .offset_link_x,Y

|08F7C2| SEC
|08F7C3| SBC.b $02
|08F7C5| STA.b $06

|08F7C7| BPL .positive_x

|08F7C9| EOR.w #$FFFF
|08F7CC| INC A

.positive_x
|08F7CD| STA.b $0A

|08F7CF| CMP.w .width,Y
|08F7D2| BCS .no_collision

;---------------------------------------------------------------------------------------------------

.collision
|08F7D4| SEP #$20
|08F7D6| SEC

|08F7D7| RTS

.no_collision
|08F7D8| SEP #$20
|08F7DA| CLC

|08F7DB| RTS

;===================================================================================================

Hookshot_CheckProximityToLink:
|08F7DC| REP #$20

|08F7DE| LDA.b $00
|08F7E0| CLC
|08F7E1| ADC.w #$0004
|08F7E4| STA.b $72

|08F7E6| LDA.b $02
|08F7E8| CLC
|08F7E9| ADC.w #$0004
|08F7EC| STA.b $74

|08F7EE| LDA.b $20
|08F7F0| SEC
|08F7F1| SBC.b $E8

|08F7F3| CLC
|08F7F4| ADC.w #$000C

|08F7F7| SEC
|08F7F8| SBC.b $72

|08F7FA| BPL .positive_y

|08F7FC| EOR.w #$FFFF
|08F7FF| INC A

.positive_y
|08F800| CMP.w #$000C
|08F803| BCS .too_far

|08F805| LDA.b $22
|08F807| SEC
|08F808| SBC.b $E2

|08F80A| CLC
|08F80B| ADC.w #$0008

|08F80E| SEC
|08F80F| SBC.b $74

|08F811| BPL .positive_x

|08F813| EOR.w #$FFFF
|08F816| INC A

.positive_x
|08F817| CMP.w #$000C
|08F81A| BCS .too_far

.close
|08F81C| SEP #$20
|08F81E| SEC

|08F81F| RTS

.too_far
|08F820| SEP #$20
|08F822| CLC

|08F823| RTS

;===================================================================================================

pool Ancilla_CheckForEntranceTrigger

.position_y
|08F824| dw $0D40, $0210, $0CFC, $0100

.position_x
|08F82C| dw $0D80, $0E68, $0130, $0F10

.height
|08F834| dw $000B, $0020, $0010, $000C

.width
|08F83C| dw $0010, $0010, $0010, $0010

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_CheckForEntranceTrigger:
|08F844| TYA
|08F845| ASL A
|08F846| TAY

|08F847| REP #$20

|08F849| LDA.b $20
|08F84B| CLC
|08F84C| ADC.w #$000C

|08F84F| SEC
|08F850| SBC.w .position_y,Y

|08F853| BPL .positive_y

|08F855| EOR.w #$FFFF
|08F858| INC A

.positive_y
|08F859| CMP.w .height,Y
|08F85C| BCS .out_of_range

|08F85E| LDA.b $22
|08F860| CLC
|08F861| ADC.w #$0008

|08F864| SEC
|08F865| SBC.w .position_x,Y

|08F868| BPL .positive_x

|08F86A| EOR.w #$FFFF
|08F86D| INC A

.positive_x
|08F86E| CMP.w .width,Y
|08F871| BCS .out_of_range

.success
|08F873| SEP #$20
|08F875| SEC

|08F876| RTS

.out_of_range
|08F877| SEP #$20
|08F879| CLC

|08F87A| RTS

;===================================================================================================

pool AncillaDraw_Shadow

.char
|08F87B| db $6C, $6C
|08F87D| db $28, $28
|08F87F| db $38, $FF
|08F881| db $C8, $C8
|08F883| db $D8, $D8
|08F885| db $D9, $D9
|08F887| db $DA, $DA

.prop
|08F889| db $28, $68
|08F88B| db $28, $68
|08F88D| db $28, $FF
|08F88F| db $22, $22
|08F891| db $24, $64
|08F893| db $24, $64
|08F895| db $24, $64

endpool

;---------------------------------------------------------------------------------------------------

AncillaDraw_Shadow:
|08F897| CPX.b #$02
|08F899| BNE .big_shadow

|08F89B| REP #$20

|08F89D| LDA.b $02
|08F89F| CLC
|08F8A0| ADC.w #$0004
|08F8A3| STA.b $02

|08F8A5| SEP #$20

;---------------------------------------------------------------------------------------------------

.big_shadow
|08F8A7| TXA
|08F8A8| ASL A
|08F8A9| TAX

|08F8AA| STZ.b $74
|08F8AC| STZ.b $75

|08F8AE| JSR Ancilla_SetOAM_XY_safe

|08F8B1| LDA.w .char+0,X
|08F8B4| STA.b ($90),Y

|08F8B6| INY

|08F8B7| LDA.w .prop+0,X
|08F8BA| AND.b #$CF
|08F8BC| ORA.b $04
|08F8BE| STA.b ($90),Y

|08F8C0| INY
|08F8C1| PHY

|08F8C2| TYA
|08F8C3| SEC
|08F8C4| SBC.b #$04
|08F8C6| LSR A
|08F8C7| LSR A
|08F8C8| TAY

|08F8C9| LDA.b #$00
|08F8CB| ORA.b $75
|08F8CD| STA.b ($92),Y

|08F8CF| PLY

|08F8D0| REP #$20

|08F8D2| LDA.b $02
|08F8D4| CLC
|08F8D5| ADC.w #$0008
|08F8D8| STA.b $02

|08F8DA| SEP #$20

|08F8DC| LDA.w .char+1,X
|08F8DF| CMP.b #$FF
|08F8E1| BEQ .exit

|08F8E3| STZ.b $74
|08F8E5| STZ.b $75

|08F8E7| JSR Ancilla_SetOAM_XY_safe

|08F8EA| LDA.w .char+1,X
|08F8ED| STA.b ($90),Y

|08F8EF| INY

|08F8F0| LDA.w .prop+1,X
|08F8F3| AND.b #$CF
|08F8F5| ORA.b $04
|08F8F7| STA.b ($90),Y

|08F8F9| INY
|08F8FA| PHY

|08F8FB| TYA
|08F8FC| SEC
|08F8FD| SBC.b #$03
|08F8FF| LSR A
|08F900| LSR A
|08F901| TAY

|08F902| LDA.b #$00
|08F904| ORA.b $75
|08F906| STA.b ($92),Y

|08F908| PLY

.exit
|08F909| RTS

;===================================================================================================

AllocateOAMInRegionsBE:
|08F90A| LDY.w $0FB3
|08F90D| BNE .use_region_E

.use_region_B
|08F90F| JSL AllocateOAMInRegionB
|08F913| BRA .exit

.use_region_E
|08F915| JSL AllocateOAMInRegionE

.exit
|08F919| RTS

;===================================================================================================

StepTowardsLink:
|08F91A| PHB
|08F91B| PHK
|08F91C| PLB

.get_closer
|08F91D| LDX.w $02D3

|08F920| LDA.w $1A00,X
|08F923| STA.w $0C03

|08F926| LDA.w $1A14,X
|08F929| STA.w $0C17

|08F92C| LDA.w $1A28,X
|08F92F| STA.w $0C0D

|08F932| LDA.w $1A3C,X
|08F935| STA.w $0C21

|08F938| LDX.b #$09
|08F93A| LDA.b #$18
|08F93C| JSR ProjectAncillaSpeedTowardsLink

|08F93F| LDA.b $00
|08F941| STA.w $0C22,X

|08F944| LDA.b $01
|08F946| STA.w $0C2C,X

|08F949| JSR AncillaMoveY

|08F94C| PHX
|08F94D| JSR AncillaMoveX
|08F950| PLX

|08F951| LDA.w $0BFA,X
|08F954| STA.b $00

|08F956| LDA.w $0C0E,X
|08F959| STA.b $01

|08F95B| LDA.w $0C04,X
|08F95E| STA.b $02

|08F960| LDA.w $0C18,X
|08F963| STA.b $03

;---------------------------------------------------------------------------------------------------

|08F965| REP #$20

|08F967| LDA.b $00
|08F969| SEC
|08F96A| SBC.b $20
|08F96C| BPL .positive_y

|08F96E| EOR.w #$FFFF
|08F971| INC A

.positive_y
|08F972| CMP.w #$0002
|08F975| BCS .not_close_enough

|08F977| LDA.b $02
|08F979| SEC
|08F97A| SBC.b $22
|08F97C| BPL .positive_x

|08F97E| EOR.w #$FFFF
|08F981| INC A

.positive_x
|08F982| CMP.w #$0002
|08F985| BCC .exit

;---------------------------------------------------------------------------------------------------

.not_close_enough
|08F987| SEP #$20

|08F989| INC.w $02D3

|08F98C| LDX.w $02D3
|08F98F| CPX.b #$12
|08F991| BEQ .exit

|08F993| LDA.b $00
|08F995| STA.w $1A00,X

|08F998| LDA.b $01
|08F99A| STA.w $1A14,X

|08F99D| LDA.b $02
|08F99F| STA.w $1A28,X

|08F9A2| LDA.b $03
|08F9A4| STA.w $1A3C,X

|08F9A7| LDY.b $EE

|08F9A9| LDA.w AncillaPriorities,Y
|08F9AC| LSR A
|08F9AD| LSR A
|08F9AE| ORA.b #$01
|08F9B0| STA.w $1A64,X

|08F9B3| BRL .get_closer

;---------------------------------------------------------------------------------------------------

.exit
|08F9B6| SEP #$20

|08F9B8| PLB

|08F9B9| RTL

;===================================================================================================

AllocateOAMInCustomRegion:
|08F9BA| PHA
|08F9BB| PHX

|08F9BC| REP #$20

|08F9BE| TYA
|08F9BF| AND.w #$00FF
|08F9C2| CLC
|08F9C3| ADC.b $90

|08F9C5| LDX.w $0FB3
|08F9C8| BEQ .ignore_layer

|08F9CA| CMP.w #$0900
|08F9CD| BCS .upper_region

|08F9CF| CMP.w #$08E0
|08F9D2| BCC .continue

|08F9D4| LDA.w #$0820
|08F9D7| BRA .set_region

.upper_region
|08F9D9| CMP.w #$09D0
|08F9DC| BCC .continue

|08F9DE| LDA.w #$0940
|08F9E1| BRA .set_region

;---------------------------------------------------------------------------------------------------

.ignore_layer
|08F9E3| CMP.w #$0990
|08F9E6| BCC .continue

|08F9E8| LDA.w #$0820

;---------------------------------------------------------------------------------------------------

.set_region
|08F9EB| STA.b $90

|08F9ED| SEC
|08F9EE| SBC.w #$0800
|08F9F1| LSR A
|08F9F2| LSR A
|08F9F3| CLC
|08F9F4| ADC.w #$0A20
|08F9F7| STA.b $92

|08F9F9| LDY.b #$00

;---------------------------------------------------------------------------------------------------

.continue
|08F9FB| SEP #$20

|08F9FD| PLX
|08F9FE| PLA

|08F9FF| RTS

;===================================================================================================

HitStars_UpdateOAMBufferPosition:
|08FA00| PHA
|08FA01| PHX

|08FA02| REP #$20

|08FA04| TYA
|08FA05| AND.w #$00FF
|08FA08| CLC
|08FA09| ADC.b $90

|08FA0B| LDX.w $0FB3
|08FA0E| BNE .exit

|08FA10| CMP.w #$09D0
|08FA13| BCC .exit

|08FA15| LDA.w #$0820
|08FA18| STA.b $90

|08FA1A| SEC
|08FA1B| SBC.w #$0800

|08FA1E| LSR A
|08FA1F| LSR A

|08FA20| CLC
|08FA21| ADC.w #$0A20
|08FA24| STA.b $92

|08FA26| LDY.b #$00

.exit
|08FA28| SEP #$20

|08FA2A| PLX
|08FA2B| PLA

|08FA2C| RTS

;===================================================================================================

Hookshot_ShouldIEvenBotherWithTiles:
|08FA2D| PHX
|08FA2E| PHY

|08FA2F| LDA.w $0BFA,X
|08FA32| STA.b $00

|08FA34| LDA.w $0C0E,X
|08FA37| STA.b $01

|08FA39| LDA.w $0C04,X
|08FA3C| STA.b $02

|08FA3E| LDA.w $0C18,X
|08FA41| STA.b $03

|08FA43| LDA.b $1B
|08FA45| BNE Hookshot_CheckForTileAllowanceUnderworld

;===================================================================================================

Hookshot_CheckForTileAllowanceOverworld:
|08FA47| REP #$20

|08FA49| LDA.w $0C72,X
|08FA4C| AND.w #$0002
|08FA4F| BNE .horizontal_direction

;---------------------------------------------------------------------------------------------------

.vertical_direction
|08FA51| LDX.w $0700

|08FA54| LDA.b $00
|08FA56| SEC
|08FA57| SBC.l OverworldTransitionPositionY,X
|08FA5B| CMP.w #$0004
|08FA5E| BCC Hookshot_DisallowTileCollision

|08FA60| CMP.w $0716
|08FA63| BCS Hookshot_DisallowTileCollision

|08FA65| BRA Hookshot_AllowTileCollision

;---------------------------------------------------------------------------------------------------

.horizontal_direction
|08FA67| LDX.w $0700

|08FA6A| LDA.b $02
|08FA6C| SEC
|08FA6D| SBC.l OverworldTransitionPositionX,X
|08FA71| CMP.w #$0006
|08FA74| BCC Hookshot_DisallowTileCollision

|08FA76| CMP.w $0716
|08FA79| BCC Hookshot_AllowTileCollision

;===================================================================================================

Hookshot_DisallowTileCollision:
|08FA7B| SEP #$20

|08FA7D| PLY
|08FA7E| PLX

|08FA7F| SEC

|08FA80| RTS

;===================================================================================================

Hookshot_AllowTileCollision:
|08FA81| SEP #$20

|08FA83| PLY
|08FA84| PLX

|08FA85| CLC

|08FA86| RTS

;===================================================================================================

Hookshot_CheckForTileAllowanceUnderworld:
|08FA87| REP #$20

|08FA89| LDA.w $0C72,X
|08FA8C| AND.w #$0002
|08FA8F| BNE .horizontal_direction

;---------------------------------------------------------------------------------------------------

.vertical_direction
|08FA91| LDA.b $00
|08FA93| AND.w #$01FF
|08FA96| CMP.w #$0004
|08FA99| BCC Hookshot_DisallowTileCollision

|08FA9B| CMP.w #$01E8
|08FA9E| BCS Hookshot_DisallowTileCollision

|08FAA0| BRA .continue_vertically

;---------------------------------------------------------------------------------------------------

.horizontal_direction
|08FAA2| LDA.b $02
|08FAA4| AND.w #$01FF
|08FAA7| CMP.w #$0004
|08FAAA| BCC Hookshot_DisallowTileCollision

|08FAAC| CMP.w #$01F0
|08FAAF| BCS Hookshot_DisallowTileCollision

|08FAB1| BRA .continue_horizontally

;---------------------------------------------------------------------------------------------------

.continue_vertically
|08FAB3| SEP #$20

|08FAB5| PLY
|08FAB6| PLX

|08FAB7| LDA.b $01
|08FAB9| AND.b #$02
|08FABB| STA.b $01

|08FABD| LDA.b $21
|08FABF| AND.b #$02
|08FAC1| CMP.b $01
|08FAC3| BEQ .allow

;---------------------------------------------------------------------------------------------------

.disallow_vertical
|08FAC5| SEC

|08FAC6| RTS

;---------------------------------------------------------------------------------------------------

.continue_horizontally
|08FAC7| SEP #$20

|08FAC9| PLY
|08FACA| PLX

|08FACB| LDA.b $03
|08FACD| AND.b #$02
|08FACF| STA.b $03

|08FAD1| LDA.b $23
|08FAD3| AND.b #$02
|08FAD5| CMP.b $03
|08FAD7| BEQ .allow

;---------------------------------------------------------------------------------------------------

.disallow_horizontal
|08FAD9| SEC

|08FADA| RTS

;---------------------------------------------------------------------------------------------------

.allow
|08FADB| CLC

|08FADC| RTS

;===================================================================================================

Ancilla_GetRadialProjection:
|08FADD| PHX

|08FADE| TAX

|08FADF| LDA.l .multiplier_y,X
|08FAE3| STA.w WRMPYA

|08FAE6| LDA.b $08
|08FAE8| STA.w WRMPYB

|08FAEB| LDA.l .meta_sign_y,X
|08FAEF| STA.b $02
|08FAF1| STZ.b $03

|08FAF3| LDA.w RDMPYL
|08FAF6| ASL A
|08FAF7| LDA.w RDMPYH

|08FAFA| ADC.b #$00
|08FAFC| STA.b $00
|08FAFE| STZ.b $01

;---------------------------------------------------------------------------------------------------

|08FB00| LDA.l .multiplier_x,X
|08FB04| STA.w WRMPYA

|08FB07| LDA.b $08
|08FB09| STA.w WRMPYB

|08FB0C| LDA.l .meta_sign_x,X
|08FB10| STA.b $06
|08FB12| STZ.b $07

|08FB14| LDA.w RDMPYL
|08FB17| ASL A
|08FB18| LDA.w RDMPYH

|08FB1B| ADC.b #$00
|08FB1D| STA.b $04
|08FB1F| STZ.b $05

|08FB21| PLX

|08FB22| RTS

;===================================================================================================

Ancilla_GetRadialProjection_long:
|08FB23| PHB
|08FB24| PHK
|08FB25| PLB

|08FB26| JSR Ancilla_GetRadialProjection

|08FB29| PLB

|08FB2A| RTL

;===================================================================================================

AllocateOAMInRegionsADF:
|08FB2B| LDY.w $0FB3
|08FB2E| BNE .consider_layer

|08FB30| JSL AllocateOAMInRegionA

|08FB34| RTS

.consider_layer
|08FB35| LDY.w $0C7C,X
|08FB38| BNE .lower_layer

|08FB3A| JSL AllocateOAMInRegionD

|08FB3E| RTS

.lower_layer
|08FB3F| JSL AllocateOAMInRegionF

|08FB43| RTS

;===================================================================================================

BeamHit_OAMAdjustments:
|08FB44| JSR BeamHit_GetCoords

|08FB47| LDY.b #$00

.next
|08FB49| PHY

|08FB4A| TYA
|08FB4B| LSR A
|08FB4C| LSR A
|08FB4D| TAY

|08FB4E| LDA.b $0B
|08FB50| BPL .skip_x_bit

|08FB52| LDA.b ($92),Y
|08FB54| AND.b #$02

;---------------------------------------------------------------------------------------------------

.skip_x_bit
|08FB56| STA.b ($92),Y

|08FB58| PLY

|08FB59| LDX.b #$00

|08FB5B| LDA.b ($90),Y
|08FB5D| SEC
|08FB5E| SBC.b $07
|08FB60| BPL .positive_x

|08FB62| DEX

.positive_x
|08FB63| CLC
|08FB64| ADC.b $02
|08FB66| STA.b $04

;---------------------------------------------------------------------------------------------------

|08FB68| TXA
|08FB69| ADC.b $03
|08FB6B| STA.b $05

|08FB6D| JSR BeamHit_GetTopXBit
|08FB70| BCC .x_on_screen

|08FB72| PHY

|08FB73| TYA
|08FB74| LSR A
|08FB75| LSR A
|08FB76| TAY

|08FB77| LDA.b ($92),Y
|08FB79| ORA.b #$01
|08FB7B| STA.b ($92),Y

|08FB7D| PLY

;---------------------------------------------------------------------------------------------------

.x_on_screen
|08FB7E| LDX.b #$00

|08FB80| INY

|08FB81| LDA.b ($90),Y
|08FB83| SEC
|08FB84| SBC.b $06
|08FB86| BPL .positive_y

|08FB88| DEX

.positive_y
|08FB89| CLC
|08FB8A| ADC.b $00
|08FB8C| STA.b $09

|08FB8E| TXA
|08FB8F| ADC.b $01
|08FB91| STA.b $0A

|08FB93| JSR BeamHit_CheckOffscreen_Y
|08FB96| BCC .y_on_screen

|08FB98| LDA.b #$F0
|08FB9A| STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.y_on_screen
|08FB9C| INY
|08FB9D| INY
|08FB9E| INY

|08FB9F| DEC.b $08
|08FBA1| BPL .next

|08FBA3| BRL Ancilla_RestoreIndex

;===================================================================================================

BeamHit_GetCoords:
|08FBA6| STY.b $0B

|08FBA8| STA.b $08

|08FBAA| LDA.w $0BFA,X
|08FBAD| STA.b $00

|08FBAF| SEC
|08FBB0| SBC.b $E8
|08FBB2| STA.b $06

|08FBB4| LDA.w $0C0E,X
|08FBB7| STA.b $01

|08FBB9| LDA.w $0C04,X
|08FBBC| STA.b $02

|08FBBE| SEC
|08FBBF| SBC.b $E2
|08FBC1| STA.b $07

|08FBC3| LDA.w $0C18,X
|08FBC6| STA.b $03

|08FBC8| RTS

;===================================================================================================

BeamHit_GetTopXBit:
|08FBC9| REP #$20

|08FBCB| LDA.b $04
|08FBCD| SEC
|08FBCE| SBC.b $E2
|08FBD0| CMP.w #$0100

|08FBD3| SEP #$20

|08FBD5| RTS

;===================================================================================================

BeamHit_CheckOffscreen_Y:
|08FBD6| REP #$20

|08FBD8| LDA.b $09
|08FBDA| PHA

|08FBDB| CLC
|08FBDC| ADC.w #$0010

|08FBDF| STA.b $09
|08FBE1| SEC
|08FBE2| SBC.b $E8
|08FBE4| CMP.w #$0100

|08FBE7| PLA
|08FBE8| STA.b $09

|08FBEA| SEP #$20

|08FBEC| RTS

;===================================================================================================

QuakeChars:

.group00_a
|08FBED| db $00, $F0, $00

.group00_b
|08FBF0| db $00, $F0, $01

;---------------------------------------------------------------------------------------------------

.group01_a
|08FBF3| db $00, $F0, $02

.group01_b
|08FBF6| db $00, $F0, $03

;---------------------------------------------------------------------------------------------------

.group02_a
|08FBF9| db $00, $F0, $43

.group02_b
|08FBFC| db $00, $F0, $42

;---------------------------------------------------------------------------------------------------

.group03_a
|08FBFF| db $00, $F0, $41

.group03_b
|08FC02| db $00, $F0, $40

;---------------------------------------------------------------------------------------------------

.group04_a
|08FC05| db $00, $F0, $40, $0E, $F8, $84

.group04_b
|08FC0B| db $1D, $F8, $44, $0D, $F9, $84

;---------------------------------------------------------------------------------------------------

.group05_a
|08FC11| db $1F, $F9, $44, $2F, $FC, $84

.group05_b
|08FC17| db $31, $F5, $06, $3F, $FB, $44, $2F, $FC
|08FC1F| db $84

;---------------------------------------------------------------------------------------------------

.group06_a
|08FC20| db $24, $EF, $08, $31, $F5, $06, $3F, $FB
|08FC28| db $44, $4E, $04, $08

.group06_b
|08FC2C| db $16, $E1, $08, $24, $EF, $08, $4E, $04
|08FC34| db $08, $5D, $14, $08

;---------------------------------------------------------------------------------------------------

.group07_a
|08FC38| db $07, $D2, $08, $17, $D3, $48, $16, $E1
|08FC40| db $08, $5D, $14, $08, $5D, $24, $48

.group07_b
|08FC47| db $F9, $C3, $08, $25, $C5, $48, $07, $D2
|08FC4F| db $08, $17, $D3, $48, $5D, $24, $48, $5D
|08FC57| db $34, $08

;---------------------------------------------------------------------------------------------------

.group08_a
|08FC59| db $EA, $B5, $08, $2F, $B6, $01, $F8, $C3
|08FC61| db $08, $24, $C4, $48, $5D, $34, $08, $6C
|08FC69| db $43, $08

.group08_b
|08FC6B| db $DB, $A6, $08, $EA, $B5, $08, $2F, $B6
|08FC73| db $01, $3B, $C2, $81, $6C, $43, $08, $79
|08FC7B| db $50, $08

;---------------------------------------------------------------------------------------------------

.group09_a
|08FC7D| db $D4, $98, $C9, $DB, $A6, $08, $49, $B6
|08FC85| db $48, $3B, $C2, $81, $79, $50, $08

.group09_b
|08FC8C| db $D4, $88, $09, $D4, $98, $C9, $57, $A7
|08FC94| db $48, $49, $B6, $48

;---------------------------------------------------------------------------------------------------

.group0A_a
|08FC98| db $D4, $88, $09, $66, $98, $48, $57, $A7
|08FCA0| db $48

.group0A_b
|08FCA1| db $66, $98, $48, $57, $A7, $48

;---------------------------------------------------------------------------------------------------

.group0B_a
|08FCA7| db $70, $8C, $48, $66, $98, $48

.group0B_b
|08FCAD| db $70, $8C, $48

;---------------------------------------------------------------------------------------------------

.group0C_a
|08FCB0| db $F3, $F0, $00

.group0C_b
|08FCB3| db $F3, $F0, $01

;---------------------------------------------------------------------------------------------------

.group0D_a
|08FCB6| db $F3, $F0, $02

.group0D_b
|08FCB9| db $F3, $F0, $03

;---------------------------------------------------------------------------------------------------

.group0E_a
|08FCBC| db $F5, $F0, $43

.group0E_b
|08FCBF| db $F5, $F0, $42

;---------------------------------------------------------------------------------------------------

.group0F_a
|08FCC2| db $F5, $F0, $41

.group0F_b
|08FCC5| db $F5, $F0, $40, $E8, $F6, $04

;---------------------------------------------------------------------------------------------------

.group10_a
|08FCCB| db $DA, $EE, $08, $E8, $F6, $04, $D8, $F9
|08FCD3| db $C4

.group10_b
|08FCD4| db $D3, $DF, $C9, $DA, $EE, $08, $C7, $F9
|08FCDC| db $04, $D8, $F9, $C4

;---------------------------------------------------------------------------------------------------

.group11_a
|08FCE0| db $D0, $D3, $07, $D3, $DF, $C9, $C7, $F9
|08FCE8| db $04, $B9, $02, $48

.group11_b
|08FCEC| db $D0, $D3, $06, $B9, $02, $48, $BA, $12
|08FCF4| db $08

;---------------------------------------------------------------------------------------------------

.group12_a
|08FCF5| db $D0, $D3, $05, $BA, $12, $08, $C8, $21
|08FCFD| db $08

.group12_b
|08FCFE| db $D0, $D3, $07, $CA, $22, $08, $CA, $31
|08FD06| db $88

;---------------------------------------------------------------------------------------------------

.group13_a
|08FD07| db $D0, $D3, $06, $CA, $31, $88, $BB, $40
|08FD0F| db $88

.group13_b
|08FD10| db $D0, $D3, $07, $BB, $40, $88, $AB, $49
|08FD18| db $C4

;---------------------------------------------------------------------------------------------------

.group14_a
|08FD19| db $D0, $D3, $05, $9B, $49, $04, $AB, $49
|08FD21| db $C4

.group14_b
|08FD22| db $C4, $CB, $08, $D0, $D3, $06, $9B, $49
|08FD2A| db $04, $8C, $4D, $C4

;---------------------------------------------------------------------------------------------------

.group15_a
|08FD2E| db $B5, $BD, $08, $C4, $CB, $08, $80, $4C
|08FD36| db $04, $8C, $4D, $C4

.group15_b
|08FD3A| db $A6, $AE, $08, $B5, $BD, $08, $80, $4C
|08FD42| db $04

;---------------------------------------------------------------------------------------------------

.group16_a
|08FD43| db $97, $9F, $08, $A6, $AE, $08

.group16_b
|08FD49| db $88, $91, $08, $97, $9F, $08

;---------------------------------------------------------------------------------------------------

.group17_a
|08FD4F| db $88, $91, $08

.group17_b
|08FD52| db $00, $FB, $0A

;---------------------------------------------------------------------------------------------------

.group18_a
|08FD55| db $00, $FB, $0B

.group18_b
|08FD58| db $02, $FD, $0C

;---------------------------------------------------------------------------------------------------

.group19_a
|08FD5B| db $01, $FD, $0D

.group19_b
|08FD5E| db $00, $FD, $8D

;---------------------------------------------------------------------------------------------------

.group1A_a
|08FD61| db $01, $FD, $8C

.group1A_b
|08FD64| db $01, $FD, $8B

;---------------------------------------------------------------------------------------------------

.group1B_a
|08FD67| db $01, $FD, $8A, $FA, $0C, $89

.group1B_b
|08FD6D| db $FA, $0C, $89, $F6, $1C, $C9

;---------------------------------------------------------------------------------------------------

.group1C_a
|08FD73| db $F6, $1C, $49, $F8, $2C, $89

.group1C_b
|08FD79| db $F8, $2C, $89, $F6, $38, $02

;---------------------------------------------------------------------------------------------------

.group1D_a
|08FD7F| db $F6, $38, $02, $E9, $46, $48, $05, $46
|08FD87| db $08

.group1D_b
|08FD88| db $E9, $46, $48, $05, $46, $08, $DA, $55
|08FD90| db $48, $13, $55, $08

;---------------------------------------------------------------------------------------------------

.group1E_a
|08FD94| db $DA, $55, $48, $13, $55, $08, $CC, $63
|08FD9C| db $48, $21, $65, $08

.group1E_b
|08FDA0| db $CC, $63, $48, $21, $65, $08, $BE, $71
|08FDA8| db $48, $2F, $73, $08

;---------------------------------------------------------------------------------------------------

.group1F_a
|08FDAC| db $BE, $71, $48, $2F, $73, $08

.group20_a
|08FDB2| db $A0, $70, $20

.group20_b
|08FDB5| db $A0, $70, $21

;---------------------------------------------------------------------------------------------------

.group21_a
|08FDB8| db $A0, $70, $66

.group21_b
|08FDBB| db $A0, $70, $22

;---------------------------------------------------------------------------------------------------

.group22_a
|08FDBE| db $A0, $70, $23

.group22_b
|08FDC1| db $A0, $70, $63

;---------------------------------------------------------------------------------------------------

.group23_a
|08FDC4| db $A0, $70, $62

.group23_b
|08FDC7| db $A0, $70, $26

;---------------------------------------------------------------------------------------------------

.group24_a
|08FDCA| db $A0, $70, $27, $AA, $7C, $28

.group24_b
|08FDD0| db $AA, $7C, $28, $B8, $8B, $28

;---------------------------------------------------------------------------------------------------

.group25_a
|08FDD6| db $B8, $8B, $28, $C5, $9A, $A1

.group25_b
|08FDDC| db $C5, $9A, $A1, $D4, $8C, $68

;---------------------------------------------------------------------------------------------------

.group26_a
|08FDE2| db $D4, $8C, $68, $E3, $7E, $68

.group26_b
|08FDE8| db $E3, $7E, $68

;---------------------------------------------------------------------------------------------------

.group27_a
|08FDEB| db $ED, $7D, $C5

.group27_b
|08FDEE| db $90, $60, $2A

;---------------------------------------------------------------------------------------------------

.group28_a
|08FDF1| db $90, $60, $2B

.group28_b
|08FDF4| db $90, $60, $2C

;---------------------------------------------------------------------------------------------------

.group29_a
|08FDF7| db $90, $60, $2D

.group29_b
|08FDFA| db $89, $52, $29, $90, $60, $2A

;---------------------------------------------------------------------------------------------------

.group2A_a
|08FE00| db $85, $42, $E9, $89, $52, $29

.group2A_b
|08FE06| db $87, $32, $29, $85, $42, $E9

;---------------------------------------------------------------------------------------------------

.group2B_a
|08FE0C| db $7E, $22, $28, $8D, $22, $68, $87, $32
|08FE14| db $29

.group2B_b
|08FE15| db $96, $12, $A9, $6F, $13, $28, $7E, $22
|08FE1D| db $28, $8D, $22, $68

;---------------------------------------------------------------------------------------------------

.group2C_a
|08FE21| db $9C, $02, $68, $66, $04, $E9, $96, $12
|08FE29| db $A9, $6F, $13, $28

.group2C_b
|08FE2D| db $A5, $F2, $A9, $5F, $F5, $28, $9C, $02
|08FE35| db $68, $66, $04, $E9

;---------------------------------------------------------------------------------------------------

.group2D_a
|08FE39| db $60, $70, $60

.group2D_b
|08FE3C| db $60, $70, $61

;---------------------------------------------------------------------------------------------------

.group2E_a
|08FE3F| db $60, $70, $26

.group2E_b
|08FE42| db $60, $70, $62

;---------------------------------------------------------------------------------------------------

.group2F_a
|08FE45| db $60, $70, $63

.group2F_b
|08FE48| db $60, $70, $23

;---------------------------------------------------------------------------------------------------

.group30_a
|08FE4B| db $60, $70, $22

.group30_b
|08FE4E| db $60, $70, $66

;---------------------------------------------------------------------------------------------------

.group31_a
|08FE51| db $55, $6F, $E8, $60, $70, $67

.group31_b
|08FE57| db $46, $68, $24, $55, $6F, $E8

;---------------------------------------------------------------------------------------------------

.group32_a
|08FE5D| db $46, $68, $24, $36, $6C, $E4

.group32_b
|08FE63| db $28, $64, $28, $26, $6B, $24, $36, $6C
|08FE6B| db $E4

;---------------------------------------------------------------------------------------------------

.group33_a
|08FE6C| db $19, $55, $28, $28, $64, $28, $26, $6B
|08FE74| db $24, $16, $6E, $E4

.group33_b
|08FE78| db $0B, $46, $28, $19, $55, $28, $07, $6C
|08FE80| db $24, $16, $6E, $E4

;---------------------------------------------------------------------------------------------------

.group34_a
|08FE84| db $0B, $46, $28, $07, $6C, $24

.group34_b
|08FE8A| db $70, $70, $2A

;---------------------------------------------------------------------------------------------------

.group35_a
|08FE8D| db $70, $70, $2B

.group35_b
|08FE90| db $70, $70, $2C

;---------------------------------------------------------------------------------------------------

.group36_a
|08FE93| db $70, $70, $2D

.group36_b
|08FE96| db $70, $70, $2A, $6C, $7D, $29

;---------------------------------------------------------------------------------------------------

.group37_a
|08FE9C| db $6C, $7D, $29, $72, $8C, $28

.group37_b
|08FEA2| db $72, $8C, $28, $7C, $9C, $29

;---------------------------------------------------------------------------------------------------

.group38_a
|08FEA8| db $7C, $9C, $29, $7B, $AC, $E9

.group38_b
|08FEAE| db $7B, $AC, $E9, $75, $B6, $E4, $84, $BB
|08FEB6| db $28

;---------------------------------------------------------------------------------------------------

.group39_a
|08FEB7| db $75, $B6, $E4, $84, $BB, $28, $67, $BD
|08FEBF| db $68, $92, $CA, $28

.group39_b
|08FEC3| db $67, $BD, $68, $92, $CA, $28, $5F, $CC
|08FECB| db $69, $9A, $D9, $29

;---------------------------------------------------------------------------------------------------

.group3A_a
|08FECF| db $5F, $CC, $69, $9A, $D9, $29, $60, $DC
|08FED7| db $E9, $9A, $E8, $E9

.group3A_b
|08FEDB| db $60, $DC, $E9, $9A, $E8, $E9

;---------------------------------------------------------------------------------------------------

.group3B_a
|08FEE1| db $85, $F2, $29, $8D, $F2, $2E, $31, $F4
|08FEE9| db $28

.group3B_b

;===================================================================================================

InitialQuakeBoltPointers:
|08FEEA| dw QuakeChars.group00_a, QuakeChars.group00_b
|08FEEE| dw QuakeChars.group01_a, QuakeChars.group01_b
|08FEF2| dw QuakeChars.group02_a, QuakeChars.group02_b
|08FEF6| dw QuakeChars.group03_a, QuakeChars.group03_b
|08FEFA| dw QuakeChars.group04_a, QuakeChars.group04_b
|08FEFE| dw QuakeChars.group05_a, QuakeChars.group05_b
|08FF02| dw QuakeChars.group06_a, QuakeChars.group06_b
|08FF06| dw QuakeChars.group07_a, QuakeChars.group07_b
|08FF0A| dw QuakeChars.group08_a, QuakeChars.group08_b
|08FF0E| dw QuakeChars.group09_a, QuakeChars.group09_b
|08FF12| dw QuakeChars.group0A_a, QuakeChars.group0A_b
|08FF16| dw QuakeChars.group0B_a, QuakeChars.group0B_b
|08FF1A| dw QuakeChars.group0C_a, QuakeChars.group0C_b
|08FF1E| dw QuakeChars.group0D_a, QuakeChars.group0D_b
|08FF22| dw QuakeChars.group0E_a, QuakeChars.group0E_b
|08FF26| dw QuakeChars.group0F_a, QuakeChars.group0F_b
|08FF2A| dw QuakeChars.group10_a, QuakeChars.group10_b
|08FF2E| dw QuakeChars.group11_a, QuakeChars.group11_b
|08FF32| dw QuakeChars.group12_a, QuakeChars.group12_b
|08FF36| dw QuakeChars.group13_a, QuakeChars.group13_b
|08FF3A| dw QuakeChars.group14_a, QuakeChars.group14_b
|08FF3E| dw QuakeChars.group15_a, QuakeChars.group15_b
|08FF42| dw QuakeChars.group16_a, QuakeChars.group16_b
|08FF46| dw QuakeChars.group17_a, QuakeChars.group17_b
|08FF4A| dw QuakeChars.group18_a, QuakeChars.group18_b
|08FF4E| dw QuakeChars.group19_a, QuakeChars.group19_b
|08FF52| dw QuakeChars.group1A_a, QuakeChars.group1A_b
|08FF56| dw QuakeChars.group1B_a, QuakeChars.group1B_b
|08FF5A| dw QuakeChars.group1C_a, QuakeChars.group1C_b
|08FF5E| dw QuakeChars.group1D_a, QuakeChars.group1D_b
|08FF62| dw QuakeChars.group1E_a, QuakeChars.group1E_b
|08FF66| dw QuakeChars.group1F_a, QuakeChars.group20_a

;---------------------------------------------------------------------------------------------------

SpreadQuakeBoltPointers:
|08FF6A| dw QuakeChars.group20_a, QuakeChars.group20_b
|08FF6E| dw QuakeChars.group21_a, QuakeChars.group21_b
|08FF72| dw QuakeChars.group22_a, QuakeChars.group22_b
|08FF76| dw QuakeChars.group23_a, QuakeChars.group23_b
|08FF7A| dw QuakeChars.group24_a, QuakeChars.group24_b
|08FF7E| dw QuakeChars.group25_a, QuakeChars.group25_b
|08FF82| dw QuakeChars.group26_a, QuakeChars.group26_b
|08FF86| dw QuakeChars.group27_a, QuakeChars.group27_b
|08FF8A| dw QuakeChars.group28_a, QuakeChars.group28_b
|08FF8E| dw QuakeChars.group29_a, QuakeChars.group29_b
|08FF92| dw QuakeChars.group2A_a, QuakeChars.group2A_b
|08FF96| dw QuakeChars.group2B_a, QuakeChars.group2B_b
|08FF9A| dw QuakeChars.group2C_a, QuakeChars.group2C_b
|08FF9E| dw QuakeChars.group2D_a, QuakeChars.group2D_b
|08FFA2| dw QuakeChars.group2E_a, QuakeChars.group2E_b
|08FFA6| dw QuakeChars.group2F_a, QuakeChars.group2F_b
|08FFAA| dw QuakeChars.group30_a, QuakeChars.group30_b
|08FFAE| dw QuakeChars.group31_a, QuakeChars.group31_b
|08FFB2| dw QuakeChars.group32_a, QuakeChars.group32_b
|08FFB6| dw QuakeChars.group33_a, QuakeChars.group33_b
|08FFBA| dw QuakeChars.group34_a, QuakeChars.group34_b
|08FFBE| dw QuakeChars.group35_a, QuakeChars.group35_b
|08FFC2| dw QuakeChars.group36_a, QuakeChars.group36_b
|08FFC6| dw QuakeChars.group37_a, QuakeChars.group37_b
|08FFCA| dw QuakeChars.group38_a, QuakeChars.group38_b
|08FFCE| dw QuakeChars.group39_a, QuakeChars.group39_b
|08FFD2| dw QuakeChars.group3A_a, QuakeChars.group3A_b
|08FFD6| dw QuakeChars.group3B_a, QuakeChars.group3B_b

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_08FFDA:
|08FFDA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|08FFE2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|08FFEA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|08FFF2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|08FFFA| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
