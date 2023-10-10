org $088000

;===================================================================================================

Ancilla_SFX1_Near:
#_088000: JSR Ancilla_SFX_Near
#_088003: STA.w $012D

#_088006: RTS

;===================================================================================================

Ancilla_SFX2_Near:
#_088007: JSR Ancilla_SFX_Near
#_08800A: STA.w $012E

#_08800D: RTS

;===================================================================================================

Ancilla_SFX3_Near:
#_08800E: JSR Ancilla_SFX_Near
#_088011: STA.w $012F

#_088014: RTS

;===================================================================================================

Ancilla_SFX_Near:
#_088015: STA.w $0CF8

#_088018: JSL Link_CalculateSFXPan
#_08801C: ORA.w $0CF8

#_08801F: RTS

;===================================================================================================

Ancilla_SFX1_Pan:
#_088020: JSR Ancilla_SFX_SetPan
#_088023: STA.w $012D

#_088026: RTS

;===================================================================================================

Ancilla_SFX2_Pan:
#_088027: JSR Ancilla_SFX_SetPan
#_08802A: STA.w $012E

#_08802D: RTS

;===================================================================================================

Ancilla_SFX3_Pan:
#_08802E: JSR Ancilla_SFX_SetPan
#_088031: STA.w $012F

#_088034: RTS

;===================================================================================================

Ancilla_SFX_SetPan:
#_088035: STA.w $0CF8

#_088038: JSL Ancilla_CalculateSFXPan
#_08803C: ORA.w $0CF8

#_08803F: RTS


;===================================================================================================

pool AncillaAdd_FireRodShot

.init_check_offset_x_low
#_088040: db   0,   0,  -8,  16

.init_check_offset_x_high
#_088044: db   0,   0,  -1,   0

.init_check_offset_y_low
#_088048: db  -8,  16,   3,   3

.init_check_offset_y_high
#_08804C: db  -1,   0,   0,   0

;---------------------------------------------------------------------------------------------------

#SomariaBulletSpeedX:
#_088050: db   0,   0, -40,  40
#_088054: db   0,   0, -48,  48
#_088058: db   0,   0, -64,  64

#SomariaBulletSpeedY:
#_08805C: db -40,  40,   0,   0
#_088060: db -48,  48,   0,   0
#_088064: db -64,  64,   0,   0

;---------------------------------------------------------------------------------------------------

.flame_speed_x
#_088068: db   0,   0, -64,  64

.flame_speed_y
#_08806C: db -64,  64,   0

pool off

;===================================================================================================

AncillaObjectAllocation:
#_08806F: db $00 ; 0x00 - NOTHING
#_088070: db $08 ; 0x01 - SOMARIA BULLET
#_088071: db $0C ; 0x02 - FIRE ROD SHOT
#_088072: db $10 ; 0x03 - UNUSED
#_088073: db $10 ; 0x04 - BEAM HIT
#_088074: db $04 ; 0x05 - BOOMERANG
#_088075: db $10 ; 0x06 - WALL HIT
#_088076: db $18 ; 0x07 - BOMB
#_088077: db $08 ; 0x08 - DOOR DEBRIS
#_088078: db $08 ; 0x09 - ARROW
#_088079: db $08 ; 0x0A - ARROW IN THE WALL
#_08807A: db $00 ; 0x0B - ICE ROD SHOT
#_08807B: db $14 ; 0x0C - SWORD BEAM_BOUNCE
#_08807C: db $00 ; 0x0D - SPIN ATTACK FULL CHARGE SPARK
#_08807D: db $10 ; 0x0E - BLAST WALL EXPLOSION
#_08807E: db $28 ; 0x0F - BLAST WALL EXPLOSION
#_08807F: db $18 ; 0x10 - BLAST WALL EXPLOSION
#_088080: db $10 ; 0x11 - ICE ROD WALL HIT
#_088081: db $10 ; 0x12 - BLAST WALL EXPLOSION
#_088082: db $10 ; 0x13 - ICE ROD SPARKLE
#_088083: db $10 ; 0x14 - BAD POINTER
#_088084: db $0C ; 0x15 - SPLASH
#_088085: db $08 ; 0x16 - HIT STARS
#_088086: db $08 ; 0x17 - SHOVEL DIRT
#_088087: db $50 ; 0x18 - ETHER SPELL
#_088088: db $00 ; 0x19 - BOMBOS SPELL
#_088089: db $10 ; 0x1A - POWDER DUST
#_08808A: db $08 ; 0x1B - SWORD WALL HIT
#_08808B: db $40 ; 0x1C - QUAKE SPELL
#_08808C: db $00 ; 0x1D - SCREEN SHAKE
#_08808D: db $0C ; 0x1E - DASH DUST
#_08808E: db $24 ; 0x1F - HOOKSHOT
#_08808F: db $10 ; 0x20 - BLANKET
#_088090: db $0C ; 0x21 - SNORE
#_088091: db $08 ; 0x22 - ITEM GET
#_088092: db $10 ; 0x23 - LINK POOF
#_088093: db $10 ; 0x24 - GRAVESTONE
#_088094: db $04 ; 0x25 - BAD POINTER
#_088095: db $0C ; 0x26 - SWORD SWING SPARKLE
#_088096: db $1C ; 0x27 - DUCK
#_088097: db $00 ; 0x28 - WISH POND ITEM
#_088098: db $10 ; 0x29 - MILESTONE ITEM GET
#_088099: db $14 ; 0x2A - SPIN ATTACK SPARKLE A
#_08809A: db $14 ; 0x2B - SPIN ATTACK SPARKLE B
#_08809B: db $10 ; 0x2C - SOMARIA BLOCK
#_08809C: db $08 ; 0x2D - SOMARIA BLOCK FIZZ
#_08809D: db $20 ; 0x2E - SOMARIA BLOCK FISSION
#_08809E: db $10 ; 0x2F - LAMP FLAME
#_08809F: db $10 ; 0x30 - BYRNA WINDUP SPARK
#_0880A0: db $10 ; 0x31 - BYRNA SPARK
#_0880A1: db $04 ; 0x32 - BLAST WALL FIREBALL
#_0880A2: db $00 ; 0x33 - BLAST WALL EXPLOSION
#_0880A3: db $80 ; 0x34 - SKULL WOODS FIRE
#_0880A4: db $10 ; 0x35 - MASTER SWORD GET
#_0880A5: db $04 ; 0x36 - FLUTE
#_0880A6: db $30 ; 0x37 - WEATHERVANE EXPLOSION
#_0880A7: db $14 ; 0x38 - CUTSCENE DUCK
#_0880A8: db $10 ; 0x39 - SOMARIA PLATFORM POOF
#_0880A9: db $00 ; 0x3A - BIG BOMB EXPLOSION
#_0880AA: db $10 ; 0x3B - SWORD UP SPARKLE
#_0880AB: db $00 ; 0x3C - SPIN ATTACK CHARGE SPARKLE
#_0880AC: db $00 ; 0x3D - ITEM SPLASH
#_0880AD: db $08 ; 0x3E - RISING CRYSTAL
#_0880AE: db $00 ; 0x3F - BUSH POOF
#_0880AF: db $10 ; 0x40 - DWARF POOF
#_0880B0: db $08 ; 0x41 - WATERFALL SPLASH
#_0880B1: db $78 ; 0x42 - HAPPINESS POND RUPEES
#_0880B2: db $80 ; 0x43 - GANONS TOWER CUTSCENE

;===================================================================================================

AncillaAdd_FireRodShot:
#_0880B3: LDY.b #$01

#_0880B5: STA.b $00

#_0880B7: JSL Ancilla_CheckForAvailableSlot
#_0880BB: BPL .free_slot

#_0880BD: LDA.b $00
#_0880BF: CMP.b #$01
#_0880C1: BEQ .no_refund_magic

#_0880C3: LDX.b #$00
#_0880C5: JSL Refund_Magic

.no_refund_magic
#_0880C9: BRL .exit_a

;---------------------------------------------------------------------------------------------------

.free_slot
#_0880CC: PHB
#_0880CD: PHK
#_0880CE: PLB

#_0880CF: PHX

#_0880D0: LDA.b $00
#_0880D2: CMP.b #$01
#_0880D4: BEQ .no_sfx

#_0880D6: PHY

#_0880D7: LDA.b #$0E ; SFX2.0E
#_0880D9: JSR Ancilla_SFX2_Near

#_0880DC: PLY

;---------------------------------------------------------------------------------------------------

.no_sfx
#_0880DD: LDA.b $00
#_0880DF: STA.w $0C4A,Y

#_0880E2: TAX

#_0880E3: LDA.w AncillaObjectAllocation,X
#_0880E6: STA.w $0C90,Y

#_0880E9: LDA.b #$03
#_0880EB: STA.w $0C68,Y

#_0880EE: LDA.b #$00
#_0880F0: STA.w $0C54,Y
#_0880F3: STA.w $0C5E,Y

#_0880F6: STA.w $0280,Y
#_0880F9: STA.w $028A,Y

#_0880FC: LDA.b $2F
#_0880FE: LSR A
#_0880FF: STA.w $0C72,Y

;---------------------------------------------------------------------------------------------------

#_088102: TAX

#_088103: PHY
#_088104: PHX

#_088105: TYX
#_088106: JSL Ancilla_CheckInitialTile_A

#_08810A: PLX
#_08810B: PLY

#_08810C: BCS .disperse_on_spawn

;---------------------------------------------------------------------------------------------------

#_08810E: LDA.w $0022
#_088111: CLC
#_088112: ADC.w .init_check_offset_x_low,X
#_088115: STA.w $0C04,Y

#_088118: LDA.w $0023
#_08811B: ADC.w .init_check_offset_x_high,X
#_08811E: STA.w $0C18,Y

#_088121: LDA.w $0020
#_088124: CLC
#_088125: ADC.w .init_check_offset_y_low,X
#_088128: STA.w $0BFA,Y

#_08812B: LDA.w $0021
#_08812E: ADC.w .init_check_offset_y_high,X
#_088131: STA.w $0C0E,Y

;---------------------------------------------------------------------------------------------------

#_088134: LDA.w $0C4A,Y
#_088137: CMP.b #$01 ; ANCILLA 01
#_088139: BEQ .is_somaria_bullet

#_08813B: LDA.w .flame_speed_x,X
#_08813E: STA.w $0C2C,Y

#_088141: LDA.w .flame_speed_y,X

#_088144: BRA .speed_set

;---------------------------------------------------------------------------------------------------

.is_somaria_bullet
#_088146: LDA.l $7EF359
#_08814A: DEC A
#_08814B: DEC A

#_08814C: ASL A
#_08814D: ASL A

#_08814E: STA.b $0F

#_088150: TXA
#_088151: CLC
#_088152: ADC.b $0F
#_088154: TAX

#_088155: LDA.w SomariaBulletSpeedX,X
#_088158: STA.w $0C2C,Y

#_08815B: LDA.w SomariaBulletSpeedY,X

;---------------------------------------------------------------------------------------------------

.speed_set
#_08815E: STA.w $0C22,Y

#_088161: LDA.w $00EE
#_088164: STA.w $0C7C,Y

#_088167: LDA.w $0476
#_08816A: STA.w $03CA,Y

#_08816D: PLX
#_08816E: PLB

.exit_a
#_08816F: RTL

;---------------------------------------------------------------------------------------------------

.disperse_on_spawn
#_088170: LDA.w $0C4A,Y
#_088173: CMP.b #$01 ; ANCILLA 01
#_088175: BNE .not_bullet

#_088177: LDA.b #$04 ; ANCILLA 04
#_088179: STA.w $0C4A,Y

#_08817C: LDA.b #$07
#_08817E: STA.w $0C68,Y

#_088181: LDA.b #$10
#_088183: STA.w $0C90,Y

#_088186: BRA .exit_b

;---------------------------------------------------------------------------------------------------

.not_bullet
#_088188: LDA.b #$01
#_08818A: STA.w $0C54,Y

#_08818D: LDA.b #$1F
#_08818F: STA.w $0C68,Y

#_088192: LDA.b #$08
#_088194: STA.w $0C90,Y

#_088197: LDA.b #$2A ; SFX2.2A
#_088199: JSR Ancilla_SFX2_Pan

.exit_b
#_08819C: PLX
#_08819D: PLB

#_08819E: RTL

;===================================================================================================

pool SomariaBlock_SpawnBullets

.offset_x
#_08819F: db  -8,  -8,  -9,  -4

.offset_y
#_0881A3: db -15,  -4,  -8,  -8

pool off

;---------------------------------------------------------------------------------------------------

SomariaBlock_SpawnBullets:
#_0881A7: LDA.b #$03
#_0881A9: STA.w $0FB5

#_0881AC: LDA.w $029E,X
#_0881AF: CMP.b #$FF
#_0881B1: BNE .altitiude_fine

#_0881B3: LDA.b #$00

.altitiude_fine
#_0881B5: STA.b $05

#_0881B7: LDA.w $0C04,X
#_0881BA: STA.b $00

#_0881BC: LDA.w $0C18,X
#_0881BF: STA.b $01

#_0881C1: LDA.w $0BFA,X
#_0881C4: SEC
#_0881C5: SBC.b $05
#_0881C7: STA.b $02

#_0881C9: LDA.w $0C0E,X
#_0881CC: SBC.b #$00
#_0881CE: STA.b $03

#_0881D0: LDA.w $0C7C,X
#_0881D3: STA.b $04

;---------------------------------------------------------------------------------------------------

.next_spawn
#_0881D5: LDY.b #$04
#_0881D7: LDA.b #$01 ; ANCILLA 01
#_0881D9: JSL Ancilla_CheckForAvailableSlot
#_0881DD: BMI .spawn_failed

#_0881DF: PHX

#_0881E0: LDA.b #$01 ; ANCILLA 01
#_0881E2: STA.w $0C4A,Y

#_0881E5: TAX

#_0881E6: LDA.w AncillaObjectAllocation,X
#_0881E9: STA.w $0C90,Y

#_0881EC: LDA.b #$04
#_0881EE: STA.w $0C54,Y

#_0881F1: LDA.b #$00
#_0881F3: STA.w $0C5E,Y
#_0881F6: STA.w $0280,Y

#_0881F9: LDX.w $0FB5
#_0881FC: TXA
#_0881FD: STA.w $0C72,Y

#_088200: LDA.b $00
#_088202: CLC
#_088203: ADC.w .offset_x,X
#_088206: STA.w $0C04,Y

#_088209: LDA.b $01
#_08820B: ADC.b #$FF
#_08820D: STA.w $0C18,Y

#_088210: LDA.b $02
#_088212: CLC
#_088213: ADC.w .offset_y,X
#_088216: STA.w $0BFA,Y

#_088219: LDA.b $03
#_08821B: ADC.b #$FF
#_08821D: STA.w $0C0E,Y

#_088220: JSL Ancilla_TerminateOffScreen

#_088224: LDA.w SomariaBulletSpeedX,X
#_088227: STA.w $0C2C,Y

#_08822A: LDA.w SomariaBulletSpeedY,X
#_08822D: STA.w $0C22,Y

#_088230: LDA.b $04
#_088232: STA.w $0C7C,Y

#_088235: LDA.w $0476
#_088238: STA.w $03CA,Y

#_08823B: PLX

.spawn_failed
#_08823C: DEC.w $0FB5
#_08823F: BPL .next_spawn

#_088241: RTS

;===================================================================================================

Ancilla_Main:
#_088242: PHB
#_088243: PHK
#_088244: PLB

#_088245: JSR Ancilla_WeaponTink
#_088248: JSR Ancilla_ExecuteAll

#_08824B: PLB

#_08824C: RTL

;===================================================================================================

Ancilla_ProjectReflexiveSpeedOntoSprite:
#_08824D: LDA.w $0022
#_088250: PHA

#_088251: LDA.w $0023
#_088254: PHA

#_088255: LDA.w $0020
#_088258: PHA

#_088259: LDA.w $0021
#_08825C: PHA

#_08825D: LDA.b $04
#_08825F: STA.w $0022

#_088262: LDA.b $05
#_088264: STA.w $0023

#_088267: LDA.b $06
#_088269: STA.w $0020

#_08826C: LDA.b $07
#_08826E: STA.w $0021

#_088271: TYA
#_088272: JSL ProjectReflexiveSpeedOntoSprite_UsingLinkCoordinates

#_088276: PLA
#_088277: STA.w $0021

#_08827A: PLA
#_08827B: STA.w $0020

#_08827E: PLA
#_08827F: STA.w $0023

#_088282: PLA
#_088283: STA.w $0022

#_088286: RTS

;===================================================================================================

Bomb_CheckSpriteDamage:
#_088287: LDY.b #$0F

.next_sprite
#_088289: TYA
#_08828A: EOR.b $1A
#_08828C: AND.b #$03
#_08828E: ORA.w $0EF0,Y
#_088291: ORA.w $0BA0,Y
#_088294: BEQ .continue

.different_layer
#_088296: JMP.w .skip

.continue
#_088299: LDA.w $0F20,Y
#_08829C: CMP.w $0C7C,X
#_08829F: BNE .different_layer

#_0882A1: LDA.w $0DD0,Y
#_0882A4: CMP.b #$09
#_0882A6: BCC .skip

#_0882A8: LDA.w $0C04,X
#_0882AB: SEC
#_0882AC: SBC.b #$18
#_0882AE: STA.b $00

#_0882B0: LDA.w $0C18,X
#_0882B3: SBC.b #$00
#_0882B5: STA.b $08

#_0882B7: LDA.w $0BFA,X
#_0882BA: SEC
#_0882BB: SBC.b #$18
#_0882BD: PHP

#_0882BE: SEC
#_0882BF: SBC.w $029E,X
#_0882C2: STA.b $01

#_0882C4: LDA.w $0C0E,X
#_0882C7: SBC.b #$00

#_0882C9: PLP
#_0882CA: SBC.b #$00
#_0882CC: STA.b $09

#_0882CE: LDA.b #$30
#_0882D0: STA.b $02
#_0882D2: STA.b $03

#_0882D4: PHX

#_0882D5: TYX
#_0882D6: JSL Sprite_SetupHitbox_long

#_0882DA: PLX

#_0882DB: JSL CheckIfHitBoxesOverlap_long
#_0882DF: BCC .skip

;---------------------------------------------------------------------------------------------------

#_0882E1: LDA.w $0E20,Y
#_0882E4: CMP.b #$92 ; SPRITE 92
#_0882E6: BNE .not_king_helma

#_0882E8: LDA.w $0DB0,Y
#_0882EB: CMP.b #$03
#_0882ED: BCS .skip

.not_king_helma
#_0882EF: LDA.w $0C04,X
#_0882F2: STA.b $04

#_0882F4: LDA.w $0C18,X
#_0882F7: STA.b $05

#_0882F9: LDA.w $0BFA,X
#_0882FC: STA.b $06

#_0882FE: LDA.w $0C0E,X
#_088301: STA.b $07

#_088303: PHX
#_088304: PHY

#_088305: LDA.w $0C4A,X
#_088308: TYX

#_088309: JSL Ancilla_CheckDamageToSprite

#_08830D: LDY.b #$40
#_08830F: JSR Ancilla_ProjectReflexiveSpeedOntoSprite

#_088312: PLY
#_088313: PLX

#_088314: LDA.b $00
#_088316: EOR.b #$FF
#_088318: INC A
#_088319: STA.w $0F30,Y

#_08831C: LDA.b $01
#_08831E: EOR.b #$FF
#_088320: INC A
#_088321: STA.w $0F40,Y

.skip
#_088324: DEY
#_088325: BMI .done

#_088327: JMP.w .next_sprite

;---------------------------------------------------------------------------------------------------

.done
#_08832A: RTS

;===================================================================================================

Ancilla_ExecuteAll:
#_08832B: LDX.b #$09

.next
#_08832D: STX.w $0FA0

#_088330: LDA.w $0C4A,X
#_088333: BEQ .skip

#_088335: JSR Ancilla_ExecuteOne

.skip
#_088338: DEX
#_088339: BPL .next

#_08833B: RTS

;===================================================================================================

Ancilla_ExecuteOne:
#_08833C: PHA

#_08833D: CPX.b #$06
#_08833F: BCS .skip_oam

#_088341: LDA.w $0C90,X

#_088344: LDY.w $0FB3
#_088347: BEQ .ignore_layer

#_088349: LDY.w $0C7C,X
#_08834C: BNE .bg1

#_08834E: JSL SpriteDraw_AllocateOAMFromRegionD
#_088352: BRA .save_oam

.bg1
#_088354: JSL SpriteDraw_AllocateOAMFromRegionF
#_088358: BRA .save_oam

.ignore_layer
#_08835A: JSL SpriteDraw_AllocateOAMFromRegionA

.save_oam
#_08835E: TYA
#_08835F: STA.w $0C86,X

;---------------------------------------------------------------------------------------------------

.skip_oam
#_088362: LDY.b $11
#_088364: BNE .skip_timer

#_088366: LDY.w $0C68,X
#_088369: BEQ .skip_timer

#_08836B: DEC.w $0C68,X

.skip_timer
#_08836E: PLA
#_08836F: DEC A
#_088370: ASL A
#_088371: TAY

#_088372: LDA.w .vectors+0,Y
#_088375: STA.b $00

#_088377: LDA.w .vectors+1,Y
#_08837A: STA.b $01

#_08837C: JMP.w ($0000)

;---------------------------------------------------------------------------------------------------

.vectors
#_08837F: dw Ancilla01_SomariaBullet
#_088381: dw Ancilla02_FireRodShot
#_088383: dw Ancilla03
#_088385: dw Ancilla04_BeamHit
#_088387: dw Ancilla05_Boomerang
#_088389: dw Ancilla06_WallHit
#_08838B: dw Ancilla07_Bomb
#_08838D: dw Ancilla08_DoorDebris
#_08838F: dw Ancilla09_Arrow
#_088391: dw Ancilla0A_ArrowInTheWall
#_088393: dw Ancilla0B_IceRodShot
#_088395: dw Ancilla0C_SwordBeam_bounce
#_088397: dw Ancilla0D_SpinAttackFullChargeSpark
#_088399: dw Ancilla33_BlastWallExplosion ; Unused
#_08839B: dw Ancilla33_BlastWallExplosion ; Unused
#_08839D: dw Ancilla33_BlastWallExplosion ; Unused
#_08839F: dw Ancilla11_IceRodWallHit
#_0883A1: dw Ancilla33_BlastWallExplosion ; Unused
#_0883A3: dw Ancilla13_IceRodSparkle
#_0883A5: dw JumpSplash_char ; bad pointer but correct
#_0883A7: dw Ancilla15_JumpSplash
#_0883A9: dw Ancilla16_HitStars
#_0883AB: dw Ancilla17_ShovelDirt
#_0883AD: dw Ancilla18_EtherSpell
#_0883AF: dw Ancilla19_BombosSpell
#_0883B1: dw Ancilla1A_PowderDust
#_0883B3: dw Ancilla1B_SwordWallHit
#_0883B5: dw Ancilla1C_QuakeSpell
#_0883B7: dw Ancilla1D_ScreenShake
#_0883B9: dw Ancilla1E_DashDust
#_0883BB: dw Ancilla1F_Hookshot
#_0883BD: dw Ancilla20_Blanket
#_0883BF: dw Ancilla21_Snore
#_0883C1: dw Ancilla22_ItemReceipt
#_0883C3: dw Ancilla23_LinkPoof
#_0883C5: dw Ancilla24_Gravestone
#_0883C7: dw HitStar_char ; bad pointer but correct
#_0883C9: dw Ancilla26_SwordSwingSparkle
#_0883CB: dw Ancilla27_Duck
#_0883CD: dw Ancilla28_WishPondItem
#_0883CF: dw Ancilla29_MilestoneItemReceipt
#_0883D1: dw Ancilla2A_SpinAttackSparkleA
#_0883D3: dw Ancilla2B_SpinAttackSparkleB
#_0883D5: dw Ancilla2C_SomariaBlock
#_0883D7: dw Ancilla2D_SomariaBlockFizz
#_0883D9: dw Ancilla2E_SomariaBlockFission
#_0883DB: dw Ancilla2F_LampFlame
#_0883DD: dw Ancilla30_ByrnaWindupSpark
#_0883DF: dw Ancilla31_ByrnaSpark
#_0883E1: dw Ancilla32_BlastWallFireball
#_0883E3: dw Ancilla33_BlastWallExplosion
#_0883E5: dw Ancilla34_SkullWoodsFire
#_0883E7: dw Ancilla35_MasterSwordReceipt
#_0883E9: dw Ancilla36_Flute
#_0883EB: dw Ancilla37_WeathervaneExplosion
#_0883ED: dw Ancilla38_CutsceneDuck
#_0883EF: dw Ancilla39_SomariaPlatformPoof
#_0883F1: dw Ancilla3A_BigBombExplosion
#_0883F3: dw Ancilla3B_SwordUpSparkle
#_0883F5: dw Ancilla3C_SpinAttackChargeSparkle
#_0883F7: dw Ancilla3D_ItemSplash
#_0883F9: dw Ancilla3E_RisingCrystal
#_0883FB: dw Ancilla3F_BushPoof
#_0883FD: dw Ancilla40_DwarfPoof
#_0883FF: dw Ancilla41_WaterfallSplash
#_088401: dw Ancilla42_HappinessPondRupees
#_088403: dw Ancilla43_GanonsTowerCutscene

;===================================================================================================

pool Ancilla13_IceRodSparkle

.offset_x
#_088405: db  2,  7,  6,  1
#_088409: db  1,  7,  7,  1
#_08840D: db  0,  7,  8,  1
#_088411: db  4,  9,  4, -1

.offset_y
#_088415: db  2,  3,  8,  7
#_088419: db  1,  1,  7,  7
#_08841D: db  1,  0,  7,  8
#_088421: db -1,  4,  9,  4

.char
#_088425: db $83, $83, $83, $83
#_088429: db $B6, $80, $B6, $80
#_08842D: db $B7, $B6, $B7, $B6
#_088431: db $B7, $B6, $B7, $B6

pool off

;---------------------------------------------------------------------------------------------------

Ancilla13_IceRodSparkle:
#_088435: LDA.w $0C68,X
#_088438: BNE .active

#_08843A: STZ.w $0C4A,X

.active
#_08843D: LDA.b $11
#_08843F: BNE .no_move

#_088441: JSR Ancilla_Move_X
#_088444: JSR Ancilla_Move_Y

.no_move
#_088447: JSR Ancilla_BoundsCheck

#_08844A: LDY.b #$04
#_08844C: LDA.b #$0B ; ANCILLA 0B

.next_slot
#_08844E: CMP.w $0C4A,Y
#_088451: BEQ .found_him

#_088453: DEY
#_088454: BPL .next_slot

.found_him
#_088456: LDA.w $0280,Y
#_088459: BEQ .normal_priority

#_08845B: LDA.b #$30
#_08845D: STA.b $04

.normal_priority
#_08845F: LDA.b #$10

#_088461: LDY.w $0FB3
#_088464: BEQ .ignore_layer

#_088466: LDY.w $0C7C,X
#_088469: BNE .lower_layer

#_08846B: JSL SpriteDraw_AllocateOAMFromRegionD
#_08846F: BRA .draw

.lower_layer
#_088471: JSL SpriteDraw_AllocateOAMFromRegionE
#_088475: BRA .draw

.ignore_layer
#_088477: JSL SpriteDraw_AllocateOAMFromRegionA

.draw
#_08847B: LDY.b #$00

#_08847D: LDA.b #$03
#_08847F: STA.b $05

#_088481: LDA.w $0C68,X
#_088484: AND.b #$1C
#_088486: STA.b $06

#_088488: PHX

;---------------------------------------------------------------------------------------------------

.next_object
#_088489: LDA.b $05
#_08848B: ORA.b $06

#_08848D: TAX

#_08848E: LDA.b $00
#_088490: CLC
#_088491: ADC.w .offset_x,X
#_088494: STA.b ($90),Y

#_088496: INY
#_088497: LDA.b $01
#_088499: CLC
#_08849A: ADC.w .offset_y,X
#_08849D: STA.b ($90),Y

#_08849F: INY
#_0884A0: LDA.w .char,X
#_0884A3: STA.b ($90),Y

#_0884A5: INY
#_0884A6: LDA.b $04
#_0884A8: ORA.b #$04
#_0884AA: STA.b ($90),Y

#_0884AC: INY
#_0884AD: PHY

#_0884AE: TYA
#_0884AF: SEC
#_0884B0: SBC.b #$04
#_0884B2: LSR A
#_0884B3: LSR A
#_0884B4: TAY

#_0884B5: LDA.b #$00
#_0884B7: STA.b ($92),Y

#_0884B9: PLY

#_0884BA: DEC.b $05
#_0884BC: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_0884BE: PLX

#_0884BF: RTS

;===================================================================================================

pool AncillaAdd_IceRodSparkle

.speed_y
#_0884C0: db -4,  4,  0,  0

.speed_x
#_0884C4: db  0,  0, -4,  4

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_IceRodSparkle:
#_0884C8: LDA.b $11
#_0884CA: BNE .return

#_0884CC: DEC.w $0BF0,X
#_0884CF: BPL .return

#_0884D1: LDA.b #$05
#_0884D3: STA.w $0BF0,X

;---------------------------------------------------------------------------------------------------

#_0884D6: LDY.b #$09

.next_slot
#_0884D8: LDA.w $0C4A,Y
#_0884DB: BEQ .free_slot

#_0884DD: DEY
#_0884DE: BPL .next_slot

.return
#_0884E0: RTS

;---------------------------------------------------------------------------------------------------

.free_slot
#_0884E1: LDA.b #$13 ; ANCILLA 13
#_0884E3: STA.w $0C4A,Y

#_0884E6: LDA.b #$0F
#_0884E8: STA.w $0C68,Y

#_0884EB: LDA.w $0C72,X

#_0884EE: PHX
#_0884EF: TAX

#_0884F0: LDA.w .speed_x,X
#_0884F3: STA.w $0C2C,Y

#_0884F6: LDA.w .speed_y,X
#_0884F9: STA.w $0C22,Y

#_0884FC: PLX

#_0884FD: LDA.w $0C04,X
#_088500: STA.w $0C04,Y

#_088503: LDA.w $0BFA,X
#_088506: STA.w $0BFA,Y

#_088509: LDA.w $0C7C,X
#_08850C: STA.w $0C7C,Y

#_08850F: LDA.b #$00
#_088511: STA.w $0C90,Y

#_088514: RTS

;===================================================================================================

pool Ancilla01_SomariaBullet

.frame_masks
#_088515: db $07, $03, $01, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Ancilla01_SomariaBullet:
#_08851B: LDA.b $11
#_08851D: BNE .draw

#_08851F: LDY.w $0C54,X

#_088522: LDA.b $1A
#_088524: AND.w .frame_masks,Y
#_088527: BNE .delay_movement

#_088529: JSR Ancilla_Move_X
#_08852C: JSR Ancilla_Move_Y

.delay_movement
#_08852F: LDA.w $0C68,X
#_088532: BNE .timer_delay

#_088534: LDA.b #$03
#_088536: STA.w $0C68,X

#_088539: LDA.w $0C54,X
#_08853C: INC A
#_08853D: CMP.b #$06
#_08853F: BCC .dont_reset_state

#_088541: LDA.b #$04

.dont_reset_state
#_088543: STA.w $0C54,X

.timer_delay
#_088546: JSR Ancilla_CheckSpriteCollision
#_088549: BCS .collision

#_08854B: JSR Ancilla_CheckTileCollision_staggered
#_08854E: BCC .draw

.collision
#_088550: LDA.b #$04 ; ANCILLA 04
#_088552: STA.w $0C4A,X

#_088555: LDA.b #$07
#_088557: STA.w $0C68,X

#_08855A: LDA.b #$10
#_08855C: STA.w $0C90,X

.draw
#_08855F: BRL SomariaBlast_Draw

;===================================================================================================

pool SomariaBlast_Draw

.char_a
#_088562: db  $50,  $50
#_088564: db  $44,  $44
#_088566: db  $52,  $52
#_088568: db  $50,  $50
#_08856A: db  $44,  $44
#_08856C: db  $51,  $51
#_08856E: db  $43,  $43
#_088570: db  $42,  $42
#_088572: db  $41,  $41
#_088574: db  $43,  $43
#_088576: db  $42,  $42
#_088578: db  $40,  $40

.char_b
#_08857A: db  $50,  $50
#_08857C: db  $44,  $44
#_08857E: db  $51,  $51
#_088580: db  $50,  $50
#_088582: db  $44,  $44
#_088584: db  $52,  $52
#_088586: db  $43,  $43
#_088588: db  $42,  $42
#_08858A: db  $40,  $40
#_08858C: db  $43,  $43
#_08858E: db  $42,  $42
#_088590: db  $41,  $41

;---------------------------------------------------------------------------------------------------

.prop_a
#_088592: db  $C0,  $C0
#_088594: db  $C0,  $C0
#_088596: db  $80,  $C0
#_088598: db  $40,  $40
#_08859A: db  $40,  $40
#_08859C: db  $00,  $40
#_08859E: db  $40,  $40
#_0885A0: db  $40,  $40
#_0885A2: db  $40,  $C0
#_0885A4: db  $00,  $00
#_0885A6: db  $00,  $00
#_0885A8: db  $00,  $80

.prop_b
#_0885AA: db  $80,  $80
#_0885AC: db  $80,  $80
#_0885AE: db  $80,  $C0
#_0885B0: db  $00,  $00
#_0885B2: db  $00,  $00
#_0885B4: db  $00,  $40
#_0885B6: db  $C0,  $C0
#_0885B8: db  $C0,  $C0
#_0885BA: db  $40,  $C0
#_0885BC: db  $80,  $80
#_0885BE: db  $80,  $80
#_0885C0: db  $00,  $80

;---------------------------------------------------------------------------------------------------

.offset_x_a
#_0885C2: db    0,    0
#_0885C4: db    0,    0
#_0885C6: db    4,    4
#_0885C8: db    0,    0
#_0885CA: db    0,    0
#_0885CC: db    4,    4
#_0885CE: db    0,    0
#_0885D0: db    0,    0
#_0885D2: db    0,    0
#_0885D4: db    0,    0
#_0885D6: db    0,    0
#_0885D8: db    0,    0

.offset_x_b
#_0885DA: db    8,    8
#_0885DC: db    8,    8
#_0885DE: db    4,    4
#_0885E0: db    8,    8
#_0885E2: db    8,    8
#_0885E4: db    4,    4
#_0885E6: db    0,    0
#_0885E8: db    0,    0
#_0885EA: db    8,    8
#_0885EC: db    0,    0
#_0885EE: db    0,    0
#_0885F0: db    8,    8

;---------------------------------------------------------------------------------------------------

.offset_y_a
#_0885F2: db -128,    0
#_0885F4: db    0,    0
#_0885F6: db    0,    0
#_0885F8: db    0,    0
#_0885FA: db    0,    0
#_0885FC: db    0,    0
#_0885FE: db    0,    0
#_088600: db    0,    0
#_088602: db    4,    4
#_088604: db    0,    0
#_088606: db    0,    0
#_088608: db    4,    4

.offset_y_b
#_08860A: db    0,    0
#_08860C: db    0,    0
#_08860E: db    8,    8
#_088610: db -128,    0
#_088612: db    0,    0
#_088614: db    8,    8
#_088616: db -128,    8
#_088618: db    8,    8
#_08861A: db    4,    4
#_08861C: db -128,    8
#_08861E: db    8,    8
#_088620: db    4,    4

pool off

;===================================================================================================

Ancilla_Killa:
#_088622: PLA
#_088623: PLA

#_088624: STZ.w $0C4A,X

#_088627: RTS

;===================================================================================================

pool Ancilla_BoundsCheck

.data
#_088628: db $20, $10

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_BoundsCheck:
#_08862A: LDY.w $0C7C,X

#_08862D: LDA.w .data,Y
#_088630: STA.b $04

#_088632: LDY.w $0C86,X

#_088635: LDA.w $0C04,X
#_088638: SEC
#_088639: SBC.b $E2
#_08863B: CMP.b #$F4
#_08863D: BCS Ancilla_Killa

#_08863F: STA.b $00

#_088641: LDA.w $0BFA,X
#_088644: SEC
#_088645: SBC.b $E8
#_088647: CMP.b #$F0
#_088649: BCS Ancilla_Killa

#_08864B: STA.b $01

#_08864D: RTS

;===================================================================================================

pool SomariaBlast_Draw

.palette
#_08864E: db $02, $06

pool off

;---------------------------------------------------------------------------------------------------

SomariaBlast_Draw:
#_088650: JSR Ancilla_BoundsCheck

#_088653: LDY.w $0C5E,X

#_088656: LDA.b $04
#_088658: ORA.w .palette,Y
#_08865B: STA.b $04

#_08865D: LDA.w $0280,X
#_088660: BEQ .normal_priority

#_088662: LDA.b #$30
#_088664: TSB.b $04

.normal_priority
#_088666: LDY.b #$00

#_088668: LDA.w $0C72,X
#_08866B: ASL A
#_08866C: ASL A

#_08866D: ADC.w $0C72,X
#_088670: ADC.w $0C72,X
#_088673: ADC.w $0C54,X

#_088676: TAX

#_088677: LDA.w .offset_x_a,X
#_08867A: CLC
#_08867B: ADC.b $00
#_08867D: STA.b ($90),Y

#_08867F: LDA.w .offset_x_b,X
#_088682: CLC
#_088683: ADC.b $00
#_088685: LDY.b #$04
#_088687: STA.b ($90),Y

#_088689: LDA.w .offset_y_a,X
#_08868C: BMI .hide_a

#_08868E: CLC
#_08868F: ADC.b $01
#_088691: LDY.b #$01
#_088693: STA.b ($90),Y

.hide_a
#_088695: LDA.w .offset_y_b,X
#_088698: BMI .hide_b

#_08869A: CLC
#_08869B: ADC.b $01
#_08869D: LDY.b #$05
#_08869F: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.hide_b
#_0886A1: LDA.w .char_a,X
#_0886A4: CLC
#_0886A5: ADC.b #$82
#_0886A7: LDY.b #$02

#_0886A9: STA.b ($90),Y

#_0886AB: LDA.w .char_b,X
#_0886AE: CLC
#_0886AF: ADC.b #$82
#_0886B1: LDY.b #$06

#_0886B3: STA.b ($90),Y

#_0886B5: LDA.w .prop_a,X
#_0886B8: ORA.b $04

#_0886BA: LDY.b #$03
#_0886BC: STA.b ($90),Y

#_0886BE: LDA.w .prop_b,X
#_0886C1: ORA.b $04

#_0886C3: LDY.b #$07
#_0886C5: STA.b ($90),Y

#_0886C7: LDY.b #$00
#_0886C9: TYA
#_0886CA: STA.b ($92),Y

#_0886CC: INY
#_0886CD: STA.b ($92),Y

#_0886CF: BRL Ancilla_RestoreIndex

;===================================================================================================

Ancilla02_FireRodShot:
#_0886D2: LDA.w $0C54,X
#_0886D5: BEQ FireRodShot_Moving

#_0886D7: JMP.w FireRodShot_Halted

;===================================================================================================

FireRodShot_Moving:
#_0886DA: LDA.b $11
#_0886DC: BNE .draw

#_0886DE: STZ.w $0385,X

#_0886E1: JSR Ancilla_Move_X
#_0886E4: JSR Ancilla_Move_Y

#_0886E7: JSR Ancilla_CheckSpriteCollision
#_0886EA: BCS .collision

;---------------------------------------------------------------------------------------------------

#_0886EC: LDA.w $0C72,X
#_0886EF: ORA.b #$08
#_0886F1: STA.w $0C72,X

#_0886F4: JSR Ancilla_CheckTileCollision
#_0886F7: PHP

#_0886F8: LDA.w $03E4,X
#_0886FB: STA.w $0385,X

#_0886FE: PLP
#_0886FF: BCS .collision

#_088701: LDA.w $0C72,X
#_088704: ORA.b #$0C
#_088706: STA.w $0C72,X

#_088709: LDA.w $028A,X
#_08870C: STA.b $74

#_08870E: JSR Ancilla_CheckTileCollision
#_088711: PHP

#_088712: LDA.b $74
#_088714: STA.w $028A,X

#_088717: PLP
#_088718: BCC .no_collision

.collision
#_08871A: INC.w $0C54,X

#_08871D: LDA.b #$1F
#_08871F: STA.w $0C68,X

#_088722: LDA.b #$08
#_088724: STA.w $0C90,X

#_088727: LDA.b #$2A ; SFX2.2A
#_088729: JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.no_collision
#_08872C: INC.w $0C5E,X

#_08872F: LDA.w $0C72,X
#_088732: AND.b #$F3
#_088734: STA.w $0C72,X

#_088737: LDA.w $0385,X
#_08873A: STA.w $0333

#_08873D: AND.b #$F0
#_08873F: CMP.b #$C0
#_088741: BEQ .torch

#_088743: LDA.w $03E4,X
#_088746: STA.w $0333

#_088749: AND.b #$F0
#_08874B: CMP.b #$C0
#_08874D: BNE .draw

.torch
#_08874F: PHX
#_088750: JSL Underworld_LightTorch
#_088754: PLX

;---------------------------------------------------------------------------------------------------

.draw
#_088755: JSR AncillaDraw_FireRodShot

#_088758: RTS

;===================================================================================================

pool AncillaDraw_FireRodShot

.offset_x
#_088759: db   7,   0,   8,   0
#_08875D: db   8,   4,   0,   0
#_088761: db   2,   8,   0,   0
#_088765: db   1,   4,   9,   0

.offset_y
#_088769: db   1,   4,   9,   0
#_08876D: db   7,   0,   8,   0
#_088771: db   8,   4,   0,   0
#_088775: db   2,   8,   0,   0

.char
#_088779: db $8D, $9D, $9C

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_FireRodShot:
#_08877C: JSR Ancilla_BoundsCheck

#_08877F: LDA.w $0280,X
#_088782: BEQ .default_priority

#_088784: LDA.b #$30
#_088786: TSB.b $04

.default_priority
#_088788: LDA.w $0C5E,X
#_08878B: AND.b #$0C
#_08878D: STA.b $02

#_08878F: PHX

;---------------------------------------------------------------------------------------------------

#_088790: LDX.b #$02
#_088792: LDY.b #$00

.next_object
#_088794: STX.b $03

#_088796: TXA
#_088797: ORA.b $02
#_088799: TAX

#_08879A: LDA.b $00
#_08879C: CLC
#_08879D: ADC.w .offset_x,X
#_0887A0: STA.b ($90),Y

#_0887A2: LDA.b $01
#_0887A4: CLC
#_0887A5: ADC.w .offset_y,X
#_0887A8: INY
#_0887A9: STA.b ($90),Y

#_0887AB: LDX.b $03

#_0887AD: LDA.w .char,X
#_0887B0: INY
#_0887B1: STA.b ($90),Y

#_0887B3: LDA.b $04
#_0887B5: ORA.b #$02
#_0887B7: INY
#_0887B8: STA.b ($90),Y

#_0887BA: PHY

#_0887BB: TYA
#_0887BC: LSR A
#_0887BD: LSR A
#_0887BE: TAY

#_0887BF: LDA.b #$00
#_0887C1: STA.b ($92),Y

#_0887C3: PLY
#_0887C4: INY

#_0887C5: DEX
#_0887C6: BPL .next_object

#_0887C8: PLX

#_0887C9: RTS

;===================================================================================================

UNREACHABLE_0887CA:
#_0887CA: RTS

;===================================================================================================

FireRodShot_Dissipate:
#_0887CB: LDA.w $0C4A,X

#_0887CE: STZ.w $0C4A,X

#_0887D1: CMP.b #$2F ; ANCILLA 2F
#_0887D3: BEQ .no_burn

#_0887D5: LDA.b $8A
#_0887D7: CMP.b #$40 ; OW 40
#_0887D9: BNE .no_burn

#_0887DB: LDA.w $03E4,X
#_0887DE: CMP.b #$43 ; TILETYPE 43
#_0887E0: BNE .no_burn

#_0887E2: PHX

#_0887E3: JSL FireRodShot_BecomeSkullWoodsFire

#_0887E7: PLX

.no_burn
#_0887E8: RTS

;===================================================================================================

pool FireRodShot_Halted

.char
#_0887E9: db $A2, $A0, $8E

pool off

;---------------------------------------------------------------------------------------------------

FireRodShot_Halted:
#_0887EC: JSR Ancilla_CheckBasicSpriteCollision
#_0887EF: JSR Ancilla_BoundsCheck

#_0887F2: LDY.b #$00
#_0887F4: LDA.w $0C68,X
#_0887F7: BEQ FireRodShot_Dissipate

#_0887F9: LSR A
#_0887FA: LSR A
#_0887FB: LSR A
#_0887FC: BEQ .dying

#_0887FE: TAX

#_0887FF: LDA.b $00
#_088801: STA.b ($90),Y

#_088803: LDA.b $01
#_088805: INY
#_088806: STA.b ($90),Y

#_088808: LDA.w .char-1,X
#_08880B: INY
#_08880C: STA.b ($90),Y

#_08880E: LDA.b #$02
#_088810: ORA.b $04
#_088812: INY
#_088813: STA.b ($90),Y

#_088815: LDA.b #$02
#_088817: STA.b ($92)

#_088819: BRL Ancilla_RestoreIndex

;---------------------------------------------------------------------------------------------------

.dying
#_08881C: TYA
#_08881D: STA.b ($92),Y

#_08881F: INY
#_088820: STA.b ($92),Y

#_088822: DEY

#_088823: LDA.b $00
#_088825: STA.b ($90),Y

#_088827: CLC
#_088828: ADC.b #$08
#_08882A: LDY.b #$04
#_08882C: STA.b ($90),Y

#_08882E: LDA.b $01
#_088830: CLC
#_088831: ADC.b #$FD
#_088833: LDY.b #$01
#_088835: STA.b ($90),Y

#_088837: LDY.b #$05
#_088839: STA.b ($90),Y

#_08883B: LDA.b #$A4
#_08883D: LDY.b #$02
#_08883F: STA.b ($90),Y

#_088841: INC A
#_088842: LDY.b #$06
#_088844: STA.b ($90),Y

#_088846: LDA.b #$02
#_088848: ORA.b $04
#_08884A: LDY.b #$03
#_08884C: STA.b ($90),Y

#_08884E: LDY.b #$07
#_088850: STA.b ($90),Y

;===================================================================================================

Ancilla03:
#_088852: RTS

;===================================================================================================

Ancilla_TileCollisionBehaviorClass1:

.interaction
#_088853: db $00 ; 00
#_088854: db $01 ; 01
#_088855: db $00 ; 02
#_088856: db $03 ; 03
#_088857: db $00 ; 04
#_088858: db $00 ; 05
#_088859: db $00 ; 06
#_08885A: db $00 ; 07
#_08885B: db $00 ; 08
#_08885C: db $00 ; 09
#_08885D: db $03 ; 0A
#_08885E: db $00 ; 0B
#_08885F: db $00 ; 0C
#_088860: db $00 ; 0D
#_088861: db $00 ; 0E
#_088862: db $00 ; 0F
#_088863: db $01 ; 10
#_088864: db $01 ; 11
#_088865: db $01 ; 12
#_088866: db $01 ; 13
#_088867: db $00 ; 14
#_088868: db $00 ; 15
#_088869: db $00 ; 16
#_08886A: db $00 ; 17
#_08886B: db $02 ; 18
#_08886C: db $02 ; 19
#_08886D: db $02 ; 1A
#_08886E: db $02 ; 1B
#_08886F: db $00 ; 1C
#_088870: db $03 ; 1D
#_088871: db $03 ; 1E
#_088872: db $03 ; 1F
#_088873: db $00 ; 20
#_088874: db $00 ; 21
#_088875: db $00 ; 22
#_088876: db $00 ; 23
#_088877: db $00 ; 24
#_088878: db $00 ; 25
#_088879: db $01 ; 26
#_08887A: db $01 ; 27
#_08887B: db $04 ; 28
#_08887C: db $04 ; 29
#_08887D: db $04 ; 2A
#_08887E: db $04 ; 2B
#_08887F: db $04 ; 2C
#_088880: db $04 ; 2D
#_088881: db $04 ; 2E
#_088882: db $04 ; 2F
#_088883: db $01 ; 30
#_088884: db $01 ; 31
#_088885: db $01 ; 32
#_088886: db $01 ; 33
#_088887: db $01 ; 34
#_088888: db $01 ; 35
#_088889: db $01 ; 36
#_08888A: db $01 ; 37
#_08888B: db $00 ; 38
#_08888C: db $00 ; 39
#_08888D: db $00 ; 3A
#_08888E: db $00 ; 3B
#_08888F: db $00 ; 3C
#_088890: db $03 ; 3D
#_088891: db $03 ; 3E
#_088892: db $03 ; 3F
#_088893: db $00 ; 40
#_088894: db $00 ; 41
#_088895: db $00 ; 42
#_088896: db $01 ; 43
#_088897: db $00 ; 44
#_088898: db $00 ; 45
#_088899: db $00 ; 46
#_08889A: db $00 ; 47
#_08889B: db $00 ; 48
#_08889C: db $00 ; 49
#_08889D: db $00 ; 4A
#_08889E: db $00 ; 4B
#_08889F: db $04 ; 4C
#_0888A0: db $04 ; 4D
#_0888A1: db $04 ; 4E
#_0888A2: db $04 ; 4F
#_0888A3: db $00 ; 50
#_0888A4: db $00 ; 51
#_0888A5: db $00 ; 52
#_0888A6: db $00 ; 53
#_0888A7: db $00 ; 54
#_0888A8: db $00 ; 55
#_0888A9: db $00 ; 56
#_0888AA: db $00 ; 57
#_0888AB: db $01 ; 58
#_0888AC: db $01 ; 59
#_0888AD: db $01 ; 5A
#_0888AE: db $01 ; 5B
#_0888AF: db $01 ; 5C
#_0888B0: db $01 ; 5D
#_0888B1: db $00 ; 5E
#_0888B2: db $00 ; 5F
#_0888B3: db $00 ; 60
#_0888B4: db $00 ; 61
#_0888B5: db $00 ; 62
#_0888B6: db $01 ; 63
#_0888B7: db $00 ; 64
#_0888B8: db $00 ; 65
#_0888B9: db $00 ; 66
#_0888BA: db $00 ; 67
#_0888BB: db $00 ; 68
#_0888BC: db $00 ; 69
#_0888BD: db $00 ; 6A
#_0888BE: db $00 ; 6B
#_0888BF: db $01 ; 6C
#_0888C0: db $01 ; 6D
#_0888C1: db $01 ; 6E
#_0888C2: db $01 ; 6F
#_0888C3: db $01 ; 70
#_0888C4: db $01 ; 71
#_0888C5: db $01 ; 72
#_0888C6: db $01 ; 73
#_0888C7: db $01 ; 74
#_0888C8: db $01 ; 75
#_0888C9: db $01 ; 76
#_0888CA: db $01 ; 77
#_0888CB: db $01 ; 78
#_0888CC: db $01 ; 79
#_0888CD: db $01 ; 7A
#_0888CE: db $01 ; 7B
#_0888CF: db $01 ; 7C
#_0888D0: db $01 ; 7D
#_0888D1: db $01 ; 7E
#_0888D2: db $01 ; 7F
#_0888D3: db $00 ; 80
#_0888D4: db $00 ; 81
#_0888D5: db $00 ; 82
#_0888D6: db $00 ; 83
#_0888D7: db $00 ; 84
#_0888D8: db $00 ; 85
#_0888D9: db $00 ; 86
#_0888DA: db $00 ; 87
#_0888DB: db $01 ; 88
#_0888DC: db $01 ; 89
#_0888DD: db $01 ; 8A
#_0888DE: db $01 ; 8B
#_0888DF: db $01 ; 8C
#_0888E0: db $01 ; 8D
#_0888E1: db $00 ; 8E
#_0888E2: db $01 ; 8F
#_0888E3: db $00 ; 90
#_0888E4: db $00 ; 91
#_0888E5: db $00 ; 92
#_0888E6: db $00 ; 93
#_0888E7: db $00 ; 94
#_0888E8: db $00 ; 95
#_0888E9: db $00 ; 96
#_0888EA: db $00 ; 97
#_0888EB: db $00 ; 98
#_0888EC: db $00 ; 99
#_0888ED: db $00 ; 9A
#_0888EE: db $00 ; 9B
#_0888EF: db $00 ; 9C
#_0888F0: db $00 ; 9D
#_0888F1: db $00 ; 9E
#_0888F2: db $00 ; 9F
#_0888F3: db $00 ; A0
#_0888F4: db $00 ; A1
#_0888F5: db $00 ; A2
#_0888F6: db $00 ; A3
#_0888F7: db $00 ; A4
#_0888F8: db $00 ; A5
#_0888F9: db $00 ; A6
#_0888FA: db $00 ; A7
#_0888FB: db $00 ; A8
#_0888FC: db $00 ; A9
#_0888FD: db $00 ; AA
#_0888FE: db $00 ; AB
#_0888FF: db $00 ; AC
#_088900: db $00 ; AD
#_088901: db $00 ; AE
#_088902: db $00 ; AF
#_088903: db $00 ; B0
#_088904: db $00 ; B1
#_088905: db $00 ; B2
#_088906: db $00 ; B3
#_088907: db $00 ; B4
#_088908: db $00 ; B5
#_088909: db $00 ; B6
#_08890A: db $00 ; B7
#_08890B: db $00 ; B8
#_08890C: db $00 ; B9
#_08890D: db $00 ; BA
#_08890E: db $00 ; BB
#_08890F: db $00 ; BC
#_088910: db $00 ; BD
#_088911: db $00 ; BE
#_088912: db $00 ; BF
#_088913: db $01 ; C0
#_088914: db $01 ; C1
#_088915: db $01 ; C2
#_088916: db $01 ; C3
#_088917: db $01 ; C4
#_088918: db $01 ; C5
#_088919: db $01 ; C6
#_08891A: db $01 ; C7
#_08891B: db $01 ; C8
#_08891C: db $01 ; C9
#_08891D: db $01 ; CA
#_08891E: db $01 ; CB
#_08891F: db $01 ; CC
#_088920: db $01 ; CD
#_088921: db $01 ; CE
#_088922: db $01 ; CF
#_088923: db $00 ; D0
#_088924: db $00 ; D1
#_088925: db $00 ; D2
#_088926: db $00 ; D3
#_088927: db $00 ; D4
#_088928: db $00 ; D5
#_088929: db $00 ; D6
#_08892A: db $00 ; D7
#_08892B: db $00 ; D8
#_08892C: db $00 ; D9
#_08892D: db $00 ; DA
#_08892E: db $00 ; DB
#_08892F: db $00 ; DC
#_088930: db $00 ; DD
#_088931: db $00 ; DE
#_088932: db $00 ; DF
#_088933: db $00 ; E0
#_088934: db $00 ; E1
#_088935: db $00 ; E2
#_088936: db $00 ; E3
#_088937: db $00 ; E4
#_088938: db $00 ; E5
#_088939: db $00 ; E6
#_08893A: db $00 ; E7
#_08893B: db $00 ; E8
#_08893C: db $00 ; E9
#_08893D: db $00 ; EA
#_08893E: db $00 ; EB
#_08893F: db $00 ; EC
#_088940: db $00 ; ED
#_088941: db $00 ; EE
#_088942: db $00 ; EF
#_088943: db $01 ; F0
#_088944: db $01 ; F1
#_088945: db $01 ; F2
#_088946: db $01 ; F3
#_088947: db $01 ; F4
#_088948: db $01 ; F5
#_088949: db $01 ; F6
#_08894A: db $01 ; F7
#_08894B: db $01 ; F8
#_08894C: db $01 ; F9
#_08894D: db $01 ; FA
#_08894E: db $01 ; FB
#_08894F: db $01 ; FC
#_088950: db $01 ; FD
#_088951: db $01 ; FE
#_088952: db $01 ; FF

;---------------------------------------------------------------------------------------------------

.offset_y
#_088953: db   0,  16,   5,   5
#_088957: db   0,  16,   4,   4
#_08895B: db   4,  12,   5,   5
#_08895F: db   4,  12,  12,  12
#_088963: db   0,   0,   0,   0

.offset_x
#_088967: db   8,   8,   0,  16
#_08896B: db   4,   4,   0,  16
#_08896F: db   4,   4,   4,  12
#_088973: db  12,  12,   4,  12
#_088977: db   0,   0,   0,   0

;===================================================================================================

Ancilla_CheckTileCollision_staggered:
#_08897B: TXA
#_08897C: EOR.b $1A
#_08897E: LSR A
#_08897F: BCC .skip_frame

;---------------------------------------------------------------------------------------------------

#Ancilla_CheckTileCollision:
#_088981: LDA.b $1B
#_088983: BNE .indoors

#_088985: LDA.w $0280,X
#_088988: BEQ .indoors

#_08898A: STZ.w $03E4,X

;---------------------------------------------------------------------------------------------------

.skip_frame
#_08898D: CLC

#_08898E: RTS

;---------------------------------------------------------------------------------------------------

.indoors
#_08898F: LDA.w $046C
#_088992: BEQ .check_basic

#_088994: CMP.b #$03

#_088996: REP #$20
#_088998: BCC .get_bg_diff

#_08899A: STZ.b $00
#_08899C: STZ.b $02

#_08899E: BRA .both_bg

;---------------------------------------------------------------------------------------------------

.get_bg_diff
#_0889A0: LDA.b $E0
#_0889A2: SEC
#_0889A3: SBC.b $E2
#_0889A5: STA.b $00

#_0889A7: LDA.b $E6
#_0889A9: SEC
#_0889AA: SBC.b $E8
#_0889AC: STA.b $02

;---------------------------------------------------------------------------------------------------

.both_bg
#_0889AE: SEP #$20

#_0889B0: LDA.w $0C04,X
#_0889B3: PHA

#_0889B4: CLC
#_0889B5: ADC.b $00
#_0889B7: STA.w $0C04,X

#_0889BA: LDA.w $0C18,X
#_0889BD: PHA

#_0889BE: ADC.b $01
#_0889C0: STA.w $0C18,X

#_0889C3: LDA.w $0BFA,X
#_0889C6: PHA

#_0889C7: CLC
#_0889C8: ADC.b $02
#_0889CA: STA.w $0BFA,X

#_0889CD: LDA.w $0C0E,X
#_0889D0: PHA

#_0889D1: ADC.b $03
#_0889D3: STA.w $0C0E,X

#_0889D6: LDA.b #$01
#_0889D8: STA.w $0C7C,X

;---------------------------------------------------------------------------------------------------

#_0889DB: JSR .check_basic

#_0889DE: STZ.w $0C7C,X

#_0889E1: PLA
#_0889E2: STA.w $0C0E,X

#_0889E5: PLA
#_0889E6: STA.w $0BFA,X

#_0889E9: PLA
#_0889EA: STA.w $0C18,X

#_0889ED: PLA
#_0889EE: STA.w $0C04,X

#_0889F1: LDY.b #$00
#_0889F3: BCC .skip_layer1

#_0889F5: INY

;---------------------------------------------------------------------------------------------------

.skip_layer1
#_0889F6: PHY
#_0889F7: PHP

#_0889F8: JSR .check_basic

#_0889FB: PLA
#_0889FC: AND.b #$01
#_0889FE: ROL A
#_0889FF: CMP.b #$01

#_088A01: PLY

#_088A02: RTS

;---------------------------------------------------------------------------------------------------

.check_basic
#_088A03: LDY.w $0C72,X

#_088A06: LDA.w $0BFA,X
#_088A09: CLC
#_088A0A: ADC.w Ancilla_TileCollisionBehaviorClass1_offset_y,Y
#_088A0D: STA.b $00

#_088A0F: LDA.w $0C0E,X
#_088A12: ADC.b #$00
#_088A14: STA.b $01

#_088A16: LDA.w $0C04,X
#_088A19: CLC
#_088A1A: ADC.w Ancilla_TileCollisionBehaviorClass1_offset_x,Y
#_088A1D: STA.b $02

#_088A1F: LDA.w $0C18,X
#_088A22: ADC.b #$00
#_088A24: STA.b $03

;===================================================================================================

Ancilla_CheckTileCollision_targeted:
#_088A26: REP #$20

#_088A28: LDA.b $00
#_088A2A: SEC
#_088A2B: SBC.b $E8
#_088A2D: CMP.w #$00E0

#_088A30: SEP #$20
#_088A32: BCS .off_screen_y

;---------------------------------------------------------------------------------------------------

#_088A34: REP #$20

#_088A36: LDA.b $02
#_088A38: SEC
#_088A39: SBC.b $E2
#_088A3B: CMP.w #$0100

#_088A3E: SEP #$20
#_088A40: BCS .no_collision

#_088A42: LDA.b $1B
#_088A44: BNE .indoors

;---------------------------------------------------------------------------------------------------

#_088A46: REP #$20

#_088A48: LSR.b $02
#_088A4A: LSR.b $02
#_088A4C: LSR.b $02

#_088A4E: PHX
#_088A4F: JSL Overworld_GetTileTypeAtLocation
#_088A53: PLX

#_088A54: BRA .continue

;---------------------------------------------------------------------------------------------------

.indoors
#_088A56: LDA.w $0C7C,X
#_088A59: JSL GetTileType_long

;---------------------------------------------------------------------------------------------------

.continue
#_088A5D: STA.w $03E4,X

#_088A60: TAY

#_088A61: LDA.w Ancilla_TileCollisionBehaviorClass1_interaction,Y
#_088A64: STA.b $0F

#_088A66: LDA.w $0C4A,X
#_088A69: CMP.b #$02 ; ANCILLA 02
#_088A6B: BNE .no_firetorch

#_088A6D: TYA
#_088A6E: AND.b #$F0
#_088A70: CMP.b #$C0
#_088A72: BNE .no_firetorch

#_088A74: STZ.b $0F

;---------------------------------------------------------------------------------------------------

.no_firetorch
#_088A76: LDA.w $0280,X
#_088A79: BNE .high_pri

#_088A7B: LDA.b $0F
#_088A7D: BEQ .no_collision

#_088A7F: CMP.b #$01
#_088A81: BEQ .collision

#_088A83: CMP.b #$02
#_088A85: BNE .not_slope

#_088A87: JSL Sprite_CheckSlopedTileCollision_long

#_088A8B: RTS

;---------------------------------------------------------------------------------------------------

.not_slope
#_088A8C: CMP.b #$03
#_088A8E: BNE .high_pri

#_088A90: LDY.w $03CA,X
#_088A93: BNE .collision

.off_screen_y
#_088A95: BRA .no_collision

;---------------------------------------------------------------------------------------------------

.high_pri
#_088A97: DEC.w $028A,X
#_088A9A: BPL .no_collision

#_088A9C: STZ.w $028A,X

#_088A9F: LDA.b $0F
#_088AA1: CMP.b #$04
#_088AA3: BNE .no_collision

#_088AA5: LDA.b #$06
#_088AA7: STA.w $028A,X

#_088AAA: LDA.w $0280,X
#_088AAD: EOR.b #$01
#_088AAF: STA.w $0280,X

#_088AB2: BRA .no_collision

;---------------------------------------------------------------------------------------------------

.no_collision
#_088AB4: CLC

#_088AB5: RTS

;---------------------------------------------------------------------------------------------------

.collision
#_088AB6: LDY.b #$00

#_088AB8: SEC

;===================================================================================================

Ancilla_SpriteAlert:
#_088AB9: LDA.b #$03
#_088ABB: STA.w $0FDC

#_088ABE: RTS

;===================================================================================================

Ancilla_TileCollisionBehaviorClass2:

.interaction
#_088ABF: db $00 ; 00
#_088AC0: db $01 ; 01
#_088AC1: db $00 ; 02
#_088AC2: db $00 ; 03
#_088AC3: db $01 ; 04
#_088AC4: db $00 ; 05
#_088AC5: db $00 ; 06
#_088AC6: db $00 ; 07
#_088AC7: db $00 ; 08
#_088AC8: db $00 ; 09
#_088AC9: db $03 ; 0A
#_088ACA: db $00 ; 0B
#_088ACB: db $00 ; 0C
#_088ACC: db $00 ; 0D
#_088ACD: db $00 ; 0E
#_088ACE: db $00 ; 0F
#_088ACF: db $01 ; 10
#_088AD0: db $01 ; 11
#_088AD1: db $01 ; 12
#_088AD2: db $01 ; 13
#_088AD3: db $00 ; 14
#_088AD4: db $00 ; 15
#_088AD5: db $00 ; 16
#_088AD6: db $00 ; 17
#_088AD7: db $02 ; 18
#_088AD8: db $02 ; 19
#_088AD9: db $02 ; 1A
#_088ADA: db $02 ; 1B
#_088ADB: db $00 ; 1C
#_088ADC: db $03 ; 1D
#_088ADD: db $03 ; 1E
#_088ADE: db $03 ; 1F
#_088ADF: db $00 ; 20
#_088AE0: db $00 ; 21
#_088AE1: db $00 ; 22
#_088AE2: db $00 ; 23
#_088AE3: db $00 ; 24
#_088AE4: db $00 ; 25
#_088AE5: db $01 ; 26
#_088AE6: db $01 ; 27
#_088AE7: db $04 ; 28
#_088AE8: db $04 ; 29
#_088AE9: db $04 ; 2A
#_088AEA: db $04 ; 2B
#_088AEB: db $04 ; 2C
#_088AEC: db $04 ; 2D
#_088AED: db $04 ; 2E
#_088AEE: db $04 ; 2F
#_088AEF: db $01 ; 30
#_088AF0: db $01 ; 31
#_088AF1: db $01 ; 32
#_088AF2: db $01 ; 33
#_088AF3: db $01 ; 34
#_088AF4: db $01 ; 35
#_088AF5: db $01 ; 36
#_088AF6: db $01 ; 37
#_088AF7: db $00 ; 38
#_088AF8: db $00 ; 39
#_088AF9: db $00 ; 3A
#_088AFA: db $00 ; 3B
#_088AFB: db $00 ; 3C
#_088AFC: db $03 ; 3D
#_088AFD: db $03 ; 3E
#_088AFE: db $03 ; 3F
#_088AFF: db $00 ; 40
#_088B00: db $00 ; 41
#_088B01: db $00 ; 42
#_088B02: db $01 ; 43
#_088B03: db $00 ; 44
#_088B04: db $00 ; 45
#_088B05: db $00 ; 46
#_088B06: db $00 ; 47
#_088B07: db $00 ; 48
#_088B08: db $00 ; 49
#_088B09: db $00 ; 4A
#_088B0A: db $00 ; 4B
#_088B0B: db $04 ; 4C
#_088B0C: db $04 ; 4D
#_088B0D: db $04 ; 4E
#_088B0E: db $04 ; 4F
#_088B0F: db $00 ; 50
#_088B10: db $00 ; 51
#_088B11: db $00 ; 52
#_088B12: db $00 ; 53
#_088B13: db $00 ; 54
#_088B14: db $00 ; 55
#_088B15: db $00 ; 56
#_088B16: db $00 ; 57
#_088B17: db $00 ; 58
#_088B18: db $00 ; 59
#_088B19: db $00 ; 5A
#_088B1A: db $00 ; 5B
#_088B1B: db $00 ; 5C
#_088B1C: db $00 ; 5D
#_088B1D: db $00 ; 5E
#_088B1E: db $00 ; 5F
#_088B1F: db $00 ; 60
#_088B20: db $00 ; 61
#_088B21: db $00 ; 62
#_088B22: db $00 ; 63
#_088B23: db $00 ; 64
#_088B24: db $00 ; 65
#_088B25: db $00 ; 66
#_088B26: db $00 ; 67
#_088B27: db $00 ; 68
#_088B28: db $00 ; 69
#_088B29: db $00 ; 6A
#_088B2A: db $00 ; 6B
#_088B2B: db $01 ; 6C
#_088B2C: db $01 ; 6D
#_088B2D: db $01 ; 6E
#_088B2E: db $01 ; 6F
#_088B2F: db $00 ; 70
#_088B30: db $00 ; 71
#_088B31: db $00 ; 72
#_088B32: db $00 ; 73
#_088B33: db $00 ; 74
#_088B34: db $00 ; 75
#_088B35: db $00 ; 76
#_088B36: db $00 ; 77
#_088B37: db $00 ; 78
#_088B38: db $00 ; 79
#_088B39: db $00 ; 7A
#_088B3A: db $00 ; 7B
#_088B3B: db $00 ; 7C
#_088B3C: db $00 ; 7D
#_088B3D: db $00 ; 7E
#_088B3E: db $00 ; 7F
#_088B3F: db $01 ; 80
#_088B40: db $01 ; 81
#_088B41: db $01 ; 82
#_088B42: db $01 ; 83
#_088B43: db $01 ; 84
#_088B44: db $01 ; 85
#_088B45: db $01 ; 86
#_088B46: db $01 ; 87
#_088B47: db $01 ; 88
#_088B48: db $01 ; 89
#_088B49: db $01 ; 8A
#_088B4A: db $01 ; 8B
#_088B4B: db $01 ; 8C
#_088B4C: db $01 ; 8D
#_088B4D: db $00 ; 8E
#_088B4E: db $01 ; 8F
#_088B4F: db $01 ; 90
#_088B50: db $01 ; 91
#_088B51: db $01 ; 92
#_088B52: db $01 ; 93
#_088B53: db $01 ; 94
#_088B54: db $01 ; 95
#_088B55: db $01 ; 96
#_088B56: db $01 ; 97
#_088B57: db $01 ; 98
#_088B58: db $01 ; 99
#_088B59: db $01 ; 9A
#_088B5A: db $01 ; 9B
#_088B5B: db $01 ; 9C
#_088B5C: db $01 ; 9D
#_088B5D: db $01 ; 9E
#_088B5E: db $01 ; 9F
#_088B5F: db $01 ; A0
#_088B60: db $01 ; A1
#_088B61: db $01 ; A2
#_088B62: db $01 ; A3
#_088B63: db $01 ; A4
#_088B64: db $01 ; A5
#_088B65: db $01 ; A6
#_088B66: db $01 ; A7
#_088B67: db $01 ; A8
#_088B68: db $01 ; A9
#_088B69: db $01 ; AA
#_088B6A: db $01 ; AB
#_088B6B: db $01 ; AC
#_088B6C: db $01 ; AD
#_088B6D: db $01 ; AE
#_088B6E: db $01 ; AF
#_088B6F: db $00 ; B0
#_088B70: db $00 ; B1
#_088B71: db $00 ; B2
#_088B72: db $00 ; B3
#_088B73: db $00 ; B4
#_088B74: db $00 ; B5
#_088B75: db $00 ; B6
#_088B76: db $00 ; B7
#_088B77: db $00 ; B8
#_088B78: db $00 ; B9
#_088B79: db $00 ; BA
#_088B7A: db $00 ; BB
#_088B7B: db $00 ; BC
#_088B7C: db $00 ; BD
#_088B7D: db $00 ; BE
#_088B7E: db $00 ; BF
#_088B7F: db $00 ; C0
#_088B80: db $00 ; C1
#_088B81: db $00 ; C2
#_088B82: db $00 ; C3
#_088B83: db $00 ; C4
#_088B84: db $00 ; C5
#_088B85: db $00 ; C6
#_088B86: db $00 ; C7
#_088B87: db $00 ; C8
#_088B88: db $00 ; C9
#_088B89: db $00 ; CA
#_088B8A: db $00 ; CB
#_088B8B: db $00 ; CC
#_088B8C: db $00 ; CD
#_088B8D: db $00 ; CE
#_088B8E: db $00 ; CF
#_088B8F: db $00 ; D0
#_088B90: db $00 ; D1
#_088B91: db $00 ; D2
#_088B92: db $00 ; D3
#_088B93: db $00 ; D4
#_088B94: db $00 ; D5
#_088B95: db $00 ; D6
#_088B96: db $00 ; D7
#_088B97: db $00 ; D8
#_088B98: db $00 ; D9
#_088B99: db $00 ; DA
#_088B9A: db $00 ; DB
#_088B9B: db $00 ; DC
#_088B9C: db $00 ; DD
#_088B9D: db $00 ; DE
#_088B9E: db $00 ; DF
#_088B9F: db $00 ; E0
#_088BA0: db $00 ; E1
#_088BA1: db $00 ; E2
#_088BA2: db $00 ; E3
#_088BA3: db $00 ; E4
#_088BA4: db $00 ; E5
#_088BA5: db $00 ; E6
#_088BA6: db $00 ; E7
#_088BA7: db $00 ; E8
#_088BA8: db $00 ; E9
#_088BA9: db $00 ; EA
#_088BAA: db $00 ; EB
#_088BAB: db $00 ; EC
#_088BAC: db $00 ; ED
#_088BAD: db $00 ; EE
#_088BAE: db $00 ; EF
#_088BAF: db $01 ; F0
#_088BB0: db $01 ; F1
#_088BB1: db $01 ; F2
#_088BB2: db $01 ; F3
#_088BB3: db $01 ; F4
#_088BB4: db $01 ; F5
#_088BB5: db $01 ; F6
#_088BB6: db $01 ; F7
#_088BB7: db $01 ; F8
#_088BB8: db $01 ; F9
#_088BB9: db $01 ; FA
#_088BBA: db $01 ; FB
#_088BBB: db $01 ; FC
#_088BBC: db $01 ; FD
#_088BBD: db $01 ; FE
#_088BBE: db $01 ; FF

;---------------------------------------------------------------------------------------------------

.offset_y_low
#_088BBF: db  -8,   8,   0,   0

.offset_y_high
#_088BC3: db  -1,   0,   0,   0

.offset_x_low
#_088BC7: db   0,   0,  -8,   8

.offset_x_high
#_088BCB: db   0,   0,  -1,   0

;===================================================================================================

Ancilla_CheckTileCollision_Class2:
#_088BCF: LDA.w $046C
#_088BD2: BEQ .check_basic

#_088BD4: CMP.b #$03

#_088BD6: REP #$20
#_088BD8: BCC .get_bg_diff

#_088BDA: STZ.b $00
#_088BDC: STZ.b $02

#_088BDE: BRA .both_bg

;---------------------------------------------------------------------------------------------------

.get_bg_diff
#_088BE0: LDA.b $E0
#_088BE2: SEC
#_088BE3: SBC.b $E2
#_088BE5: STA.b $00

#_088BE7: LDA.b $E6
#_088BE9: SEC
#_088BEA: SBC.b $E8
#_088BEC: STA.b $02

;---------------------------------------------------------------------------------------------------

.both_bg
#_088BEE: SEP #$20

#_088BF0: LDA.w $0C04,X
#_088BF3: PHA

#_088BF4: CLC
#_088BF5: ADC.b $00
#_088BF7: STA.w $0C04,X

#_088BFA: LDA.w $0C18,X
#_088BFD: PHA

#_088BFE: ADC.b $01
#_088C00: STA.w $0C18,X

#_088C03: LDA.w $0BFA,X
#_088C06: PHA

#_088C07: CLC
#_088C08: ADC.b $02
#_088C0A: STA.w $0BFA,X

#_088C0D: LDA.w $0C0E,X
#_088C10: PHA

#_088C11: ADC.b $03
#_088C13: STA.w $0C0E,X

#_088C16: LDA.b #$01
#_088C18: STA.w $0C7C,X

#_088C1B: JSR .check_basic

;---------------------------------------------------------------------------------------------------

#_088C1E: STZ.w $0C7C,X

#_088C21: PLA
#_088C22: STA.w $0C0E,X

#_088C25: PLA
#_088C26: STA.w $0BFA,X

#_088C29: PLA
#_088C2A: STA.w $0C18,X

#_088C2D: PLA
#_088C2E: STA.w $0C04,X

;---------------------------------------------------------------------------------------------------

#_088C31: LDY.b #$00
#_088C33: BCC .skip_layer1

#_088C35: INY

.skip_layer1
#_088C36: PHY
#_088C37: PHP

#_088C38: JSR .check_basic

#_088C3B: PLA
#_088C3C: AND.b #$01
#_088C3E: ROL A
#_088C3F: CMP.b #$01

#_088C41: PLY

#_088C42: RTS

;---------------------------------------------------------------------------------------------------

.check_basic
#_088C43: LDY.w $0C72,X

#_088C46: LDA.w $0BFA,X
#_088C49: CLC
#_088C4A: ADC.w Ancilla_TileCollisionBehaviorClass2_offset_y_low,Y
#_088C4D: STA.b $00

#_088C4F: LDA.w $0C0E,X
#_088C52: ADC.w Ancilla_TileCollisionBehaviorClass2_offset_y_high,Y
#_088C55: STA.b $01

#_088C57: LDA.w $0C04,X
#_088C5A: CLC
#_088C5B: ADC.w Ancilla_TileCollisionBehaviorClass2_offset_x_low,Y
#_088C5E: STA.b $02

#_088C60: LDA.w $0C18,X
#_088C63: ADC.w Ancilla_TileCollisionBehaviorClass2_offset_x_high,Y
#_088C66: STA.b $03

#_088C68: REP #$20

#_088C6A: LDA.b $00
#_088C6C: SEC
#_088C6D: SBC.b $E8
#_088C6F: CMP.w #$00E0

#_088C72: SEP #$20
#_088C74: BCS .no_collision

;---------------------------------------------------------------------------------------------------

#_088C76: REP #$20

#_088C78: LDA.b $02
#_088C7A: SEC
#_088C7B: SBC.b $E2
#_088C7D: CMP.w #$0100

#_088C80: SEP #$20
#_088C82: BCS .no_collision

#_088C84: LDA.b $1B
#_088C86: BNE .check_indoors

;---------------------------------------------------------------------------------------------------

#_088C88: REP #$20

#_088C8A: LSR.b $02
#_088C8C: LSR.b $02
#_088C8E: LSR.b $02

#_088C90: PHX
#_088C91: JSL Overworld_GetTileTypeAtLocation
#_088C95: PLX

#_088C96: BRA .save_tile

;---------------------------------------------------------------------------------------------------

.check_indoors
#_088C98: LDA.w $0C7C,X
#_088C9B: JSL GetTileType_long

;---------------------------------------------------------------------------------------------------

.save_tile
#_088C9F: STA.w $03E4,X

#_088CA2: CMP.b #$03 ; TILETYPE 03
#_088CA4: BNE .not_slope3

#_088CA6: LDY.w $03CA,X
#_088CA9: BNE .no_collision

.not_slope3
#_088CAB: TAY

#_088CAC: LDA.w Ancilla_TileCollisionBehaviorClass2_interaction,Y
#_088CAF: BEQ .no_collision

#_088CB1: CMP.b #$02
#_088CB3: BNE .not_a_slope

#_088CB5: JSL Sprite_CheckSlopedTileCollision_long

#_088CB9: RTS

;---------------------------------------------------------------------------------------------------

.not_a_slope
#_088CBA: CMP.b #$04
#_088CBC: BNE .not_a_ledge

#_088CBE: LDA.w $03CA,X
#_088CC1: BNE .collision

#_088CC3: LDA.b #$01
#_088CC5: STA.w $0280,X

#_088CC8: BRA .no_collision

;---------------------------------------------------------------------------------------------------

.not_a_ledge
#_088CCA: CMP.b #$03
#_088CCC: BNE .collision

#_088CCE: LDY.w $03CA,X
#_088CD1: BNE .collision

;---------------------------------------------------------------------------------------------------

.no_collision
#_088CD3: CLC

#_088CD4: RTS

;---------------------------------------------------------------------------------------------------

.collision
#_088CD5: LDY.b #$00

#_088CD7: SEC

#_088CD8: RTS

;===================================================================================================

pool Ancilla04_BeamHit

.offset_x
#_088CD9: db -12,  20, -12,  20
#_088CDD: db  -8,  16,  -8,  16
#_088CE1: db  -4,  12,  -4,  12
#_088CE5: db   0,   8,   0,   8

.offset_y
#_088CE9: db -12, -12,  20,  20
#_088CED: db  -8,  -8,  16,  16
#_088CF1: db  -4,  -4,  12,  12
#_088CF5: db   0,   0,   8,   8

.char
#_088CF9: db $53, $53, $53, $53
#_088CFD: db $53, $53, $53, $53
#_088D01: db $53, $53, $53, $53
#_088D05: db $54, $54, $54, $54

.props
#_088D09: db $40, $00, $C0, $80
#_088D0D: db $40, $00, $C0, $80
#_088D11: db $40, $00, $C0, $80
#_088D15: db $00, $40, $80, $C0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla04_BeamHit:
#_088D19: JSR Ancilla_BoundsCheck

#_088D1C: LDA.w $0C68,X
#_088D1F: BNE .active

#_088D21: BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

.active
#_088D24: LSR A
#_088D25: STA.b $02

#_088D27: LDX.b #$03
#_088D29: LDY.b #$00

.next_object
#_088D2B: STX.b $03

#_088D2D: LDA.b $02
#_088D2F: ASL A
#_088D30: ASL A
#_088D31: ADC.b $03
#_088D33: TAX

#_088D34: LDA.b $00
#_088D36: CLC
#_088D37: ADC.w .offset_x,X
#_088D3A: STA.b ($90),Y

#_088D3C: LDA.b $01
#_088D3E: CLC
#_088D3F: ADC.w .offset_y,X
#_088D42: INY
#_088D43: STA.b ($90),Y

#_088D45: LDA.w .char,X
#_088D48: CLC
#_088D49: ADC.b #$82
#_088D4B: INY
#_088D4C: STA.b ($90),Y

#_088D4E: LDA.w .props,X
#_088D51: ORA.b #$02
#_088D53: ORA.b $04
#_088D55: INY
#_088D56: STA.b ($90),Y

#_088D58: INY

#_088D59: LDX.b $03
#_088D5B: DEX
#_088D5C: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_088D5E: LDX.w $0FA0
#_088D61: LDY.b #$00
#_088D63: LDA.b #$03
#_088D65: BRL BeamHit_OAMAdjustments

;===================================================================================================

Ancilla_CheckSpriteCollision:
#_088D68: LDY.b #$0F

.next_sprite
#_088D6A: LDA.w $0C4A,X
#_088D6D: CMP.b #$09 ; ANCILLA 09
#_088D6F: BEQ .arrow_or_hook

#_088D71: CMP.b #$1F ; ANCILLA 1F
#_088D73: BEQ .arrow_or_hook

#_088D75: TYA
#_088D76: EOR.b $1A
#_088D78: AND.b #$03
#_088D7A: ORA.w $0F00,Y
#_088D7D: BNE .skip

.arrow_or_hook
#_088D7F: LDA.w $0DD0,Y
#_088D82: CMP.b #$09
#_088D84: BCC .skip

#_088D86: LDA.w $0CAA,Y
#_088D89: AND.b #$02
#_088D8B: BNE .ignore_layer

#_088D8D: LDA.w $0280,X
#_088D90: BNE .skip

.ignore_layer
#_088D92: LDA.w $0C7C,X
#_088D95: CMP.w $0F20,Y
#_088D98: BNE .skip

#_088D9A: JSR Ancilla_CheckSpriteCollision_Single

.skip
#_088D9D: DEY
#_088D9E: BPL .next_sprite

#_088DA0: CLC

#_088DA1: RTS

;===================================================================================================

Ancilla_CheckSpriteCollision_long:
#_088DA2: PHB
#_088DA3: PHK
#_088DA4: PLB

#_088DA5: JSR Ancilla_CheckSpriteCollision

#_088DA8: PLB

#_088DA9: RTL

;---------------------------------------------------------------------------------------------------

pool Ancilla_CheckSpriteCollision_Single

.direction
#_088DAA: db $02, $03, $00, $01

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_CheckSpriteCollision_Single:
#_088DAE: JSR Ancilla_SetupHitbox

#_088DB1: PHY
#_088DB2: PHX

#_088DB3: TYX
#_088DB4: JSL Sprite_SetupHitbox_long

#_088DB8: PLX
#_088DB9: PLY

#_088DBA: JSL CheckIfHitBoxesOverlap_long
#_088DBE: BCS .hitbox_overlap

#_088DC0: JMP.w .no_collision

;---------------------------------------------------------------------------------------------------

.hitbox_overlap
#_088DC3: LDA.w $0B6B,Y
#_088DC6: AND.b #$08
#_088DC8: BEQ .arrow_continue

#_088DCA: LDA.w $0C4A,X
#_088DCD: CMP.b #$09 ; ANCILLA 09
#_088DCF: BNE .arrow_continue

#_088DD1: LDA.w $0E20,Y
#_088DD4: CMP.b #$1B ; SPRITE 1B
#_088DD6: BEQ .arrow_v_arrow

.deflected_arrow
#_088DD8: JSL Sprite_CreateDeflectedArrow

#_088DDC: CLC

#_088DDD: RTS

;---------------------------------------------------------------------------------------------------

.arrow_v_arrow
#_088DDE: LDA.l $7EF340
#_088DE2: CMP.b #$03
#_088DE4: BCC .not_silvers

#_088DE6: JSR .arrow_continue

#_088DE9: CLC

#_088DEA: RTS

;---------------------------------------------------------------------------------------------------

.not_silvers
#_088DEB: JSR .deflected_arrow

;---------------------------------------------------------------------------------------------------

.arrow_continue
#_088DEE: LDA.w $0CAA,Y
#_088DF1: AND.b #$10
#_088DF3: BEQ .no_succ

#_088DF5: LDA.w $0C72,X
#_088DF8: AND.b #$03
#_088DFA: STA.w $0C72,X

#_088DFD: PHY

#_088DFE: LDA.w $0DE0,Y
#_088E01: TAY

#_088E02: LDA.w .direction,Y

#_088E05: PLY

#_088E06: CMP.w $0C72,X
#_088E09: BEQ .immunity

;---------------------------------------------------------------------------------------------------

.no_succ
#_088E0B: LDA.w $0C4A,X
#_088E0E: CMP.b #$05 ; ANCILLA 05
#_088E10: BEQ .boom

#_088E12: CMP.b #$1F ; ANCILLA 1F
#_088E14: BNE .continue_b

#_088E16: LDA.w $0E20,Y
#_088E19: CMP.b #$8D ; SPRITE 8D
#_088E1B: BEQ .arrghus_puff

.boom
#_088E1D: LDA.w $0EF0,Y
#_088E20: BNE .immunity

#_088E22: LDA.w $0CAA,Y
#_088E25: AND.b #$02
#_088E27: BEQ .continue_b

.arrghus_puff
#_088E29: TXA
#_088E2A: INC A
#_088E2B: STA.w $0DA0,Y

#_088E2E: BRA .set_drag

;---------------------------------------------------------------------------------------------------

.continue_b
#_088E30: LDA.w $0BA0,Y
#_088E33: BNE .no_collision

#_088E35: LDA.w $0E20,Y
#_088E38: CMP.b #$92 ; SPRITE 92
#_088E3A: BNE .not_helma_mask

#_088E3C: LDA.w $0DB0,Y
#_088E3F: CMP.b #$03
#_088E41: BCC .immunity

.not_helma_mask
#_088E43: PHX

#_088E44: LDA.w $0C72,X
#_088E47: AND.b #$03
#_088E49: TAX

#_088E4A: LDA.w .recoil_x,X
#_088E4D: STA.w $0F40,Y

#_088E50: LDA.w .recoil_y,X
#_088E53: STA.w $0F30,Y

#_088E56: PLX
#_088E57: PHX

#_088E58: LDA.w $0C4A,X

#_088E5B: STX.w $0FB6

#_088E5E: TYX

#_088E5F: PHY

#_088E60: JSL Ancilla_CheckDamageToSprite

#_088E64: PLY
#_088E65: PLX

.set_drag
#_088E66: LDA.w $0C4A,X
#_088E69: STA.w $0BB0,Y

.immunity
#_088E6C: PLA
#_088E6D: PLA

#_088E6E: JSR Ancilla_SpriteAlert

#_088E71: SEC

#_088E72: RTS

;---------------------------------------------------------------------------------------------------

.no_collision
#_088E73: CLC

#_088E74: RTS

;---------------------------------------------------------------------------------------------------

.recoil_x
#_088E75: db   0,   0, -64,  64

.recoil_y
#_088E79: db -64,  64,   0,   0

;===================================================================================================

AncillaHitbox:

.offset_x
#_088E7D: db   4
#_088E7E: db   4
#_088E7F: db   4
#_088E80: db   4
#_088E81: db   3
#_088E82: db   3
#_088E83: db   2
#_088E84: db  11
#_088E85: db -16
#_088E86: db -16
#_088E87: db  -1
#_088E88: db  -8

;---------------------------------------------------------------------------------------------------

.width
#_088E89: db   8
#_088E8A: db   8
#_088E8B: db   8
#_088E8C: db   8
#_088E8D: db   1
#_088E8E: db   1
#_088E8F: db   1
#_088E90: db   1
#_088E91: db  32
#_088E92: db  32
#_088E93: db   8
#_088E94: db   8

;---------------------------------------------------------------------------------------------------

.offset_y
#_088E95: db   4
#_088E96: db   4
#_088E97: db   4
#_088E98: db   4
#_088E99: db   2
#_088E9A: db  11
#_088E9B: db   3
#_088E9C: db   3
#_088E9D: db  -1
#_088E9E: db  -8
#_088E9F: db -16
#_088EA0: db -16

;---------------------------------------------------------------------------------------------------

.height
#_088EA1: db   8
#_088EA2: db   8
#_088EA3: db   8
#_088EA4: db   8
#_088EA5: db   1
#_088EA6: db   1
#_088EA7: db   1
#_088EA8: db   1
#_088EA9: db   8
#_088EAA: db   8
#_088EAB: db  32
#_088EAC: db  32

;===================================================================================================

Ancilla_SetupHitbox:
#_088EAD: STZ.b $09

#_088EAF: PHY

#_088EB0: LDY.w $0C72,X

#_088EB3: LDA.w $0C4A,X
#_088EB6: CMP.b #$0C ; ANCILLA 0C
#_088EB8: BNE .not_beam

#_088EBA: DEC.b $09

#_088EBC: TYA
#_088EBD: ORA.b #$08
#_088EBF: TAY

.not_beam
#_088EC0: LDA.w $0C04,X
#_088EC3: CLC
#_088EC4: ADC.w AncillaHitbox_offset_x,Y
#_088EC7: STA.b $00

#_088EC9: LDA.w $0C18,X
#_088ECC: ADC.b $09
#_088ECE: STA.b $08

#_088ED0: LDA.w $0BFA,X
#_088ED3: CLC
#_088ED4: ADC.w AncillaHitbox_offset_y,Y
#_088ED7: STA.b $01

#_088ED9: LDA.w $0C0E,X
#_088EDC: ADC.b $09
#_088EDE: STA.b $09

#_088EE0: LDA.w AncillaHitbox_width,Y
#_088EE3: STA.b $02

#_088EE5: LDA.w AncillaHitbox_height,Y
#_088EE8: STA.b $03

#_088EEA: PLY

#_088EEB: RTS

;===================================================================================================

UNREACHABLE_088EEC:
#_088EEC: RTS

;===================================================================================================

Ancilla_ProjectSpeedTowardsPlayer:
#_088EED: STA.b $01

#_088EEF: PHX
#_088EF0: PHY

#_088EF1: JSR Ancilla_IsBelowLink
#_088EF4: STY.b $02

#_088EF6: LDA.b $0E
#_088EF8: BPL .positive_y

#_088EFA: EOR.b #$FF
#_088EFC: INC A

.positive_y
#_088EFD: STA.b $0C

#_088EFF: JSR Ancilla_IsRightOfLink
#_088F02: STY.b $03

#_088F04: LDA.b $0F
#_088F06: BPL .positive_x

#_088F08: EOR.b #$FF
#_088F0A: INC A

.positive_x
#_088F0B: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_088F0D: LDY.b #$00

#_088F0F: LDA.b $0D
#_088F11: CMP.b $0C
#_088F13: BCS .x_bigger

#_088F15: INY
#_088F16: PHA

#_088F17: LDA.b $0C
#_088F19: STA.b $0D

#_088F1B: PLA
#_088F1C: STA.b $0C

.x_bigger
#_088F1E: STZ.b $0B
#_088F20: STZ.b $00

;---------------------------------------------------------------------------------------------------

#_088F22: LDX.b $01

.stupid_algo
#_088F24: LDA.b $0B
#_088F26: CLC
#_088F27: ADC.b $0C

#_088F29: CMP.b $0D
#_088F2B: BCC .keep_dumbing

#_088F2D: SBC.b $0D
#_088F2F: INC.b $00

.keep_dumbing
#_088F31: STA.b $0B

#_088F33: DEX
#_088F34: BNE .stupid_algo

;---------------------------------------------------------------------------------------------------

#_088F36: TYA
#_088F37: BEQ .x_bigger_again

#_088F39: LDA.b $00
#_088F3B: PHA

#_088F3C: LDA.b $01
#_088F3E: STA.b $00

#_088F40: PLA
#_088F41: STA.b $01

.x_bigger_again
#_088F43: LDA.b $00

#_088F45: LDY.b $02
#_088F47: BEQ .y_fine

#_088F49: EOR.b #$FF
#_088F4B: INC A
#_088F4C: STA.b $00

.y_fine
#_088F4E: LDA.b $01
#_088F50: LDY.b $03
#_088F52: BEQ .x_fine

#_088F54: EOR.b #$FF
#_088F56: INC A
#_088F57: STA.b $01

.x_fine
#_088F59: PLY
#_088F5A: PLX

#_088F5B: RTS

;===================================================================================================

Ancilla_IsRightOfLink:
#_088F5C: LDY.b #$00

#_088F5E: LDA.b $22
#_088F60: SEC
#_088F61: SBC.w $0C04,X
#_088F64: STA.b $0F

#_088F66: LDA.b $23
#_088F68: SBC.w $0C18,X
#_088F6B: BPL .no_left

#_088F6D: INY

.no_left
#_088F6E: RTS

;===================================================================================================

Ancilla_IsBelowLink:
#_088F6F: LDY.b #$00

#_088F71: LDA.b $20
#_088F73: SEC
#_088F74: SBC.w $0BFA,X
#_088F77: STA.b $0E

#_088F79: LDA.b $21
#_088F7B: SBC.w $0C0E,X
#_088F7E: BPL EXIT_088F81

#_088F80: INY

;---------------------------------------------------------------------------------------------------

#EXIT_088F81:
#_088F81: RTS

;===================================================================================================

pool Ancilla_WeaponTink

.char
#_088F82: db $93, $82, $81

.props
#_088F85: db $22, $12, $22, $22

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_WeaponTink:
#_088F89: LDA.w $0FAC
#_088F8C: BEQ EXIT_088F81

#_088F8E: LDA.b #$02
#_088F90: STA.w $0FDC

#_088F93: DEC.w $0FAF
#_088F96: BPL .keep_state

#_088F98: DEC.w $0FAC

#_088F9B: LDA.b #$01
#_088F9D: STA.w $0FAF

.keep_state
#_088FA0: LDA.b #$10

#_088FA2: LDY.w $0FB3
#_088FA5: BEQ .ignore_layer

#_088FA7: LDY.w $0B68
#_088FAA: BNE .bg1

#_088FAC: JSL SpriteDraw_AllocateOAMFromRegionD
#_088FB0: BRA .screen_check

.bg1
#_088FB2: JSL SpriteDraw_AllocateOAMFromRegionF
#_088FB6: BRA .screen_check

.ignore_layer
#_088FB8: JSL SpriteDraw_AllocateOAMFromRegionA

;---------------------------------------------------------------------------------------------------

.screen_check
#_088FBC: LDA.w $0FAD
#_088FBF: SEC
#_088FC0: SBC.w $00E2

#_088FC3: CMP.b #$F8
#_088FC5: BCS .offscreen

#_088FC7: STA.b $00

#_088FC9: LDA.w $0FAE
#_088FCC: SEC
#_088FCD: SBC.w $00E8

#_088FD0: CMP.b #$F0
#_088FD2: BCS .offscreen

#_088FD4: STA.b $01

#_088FD6: LDA.w $0FAC
#_088FD9: CMP.b #$03
#_088FDB: BCC .late_stage

#_088FDD: LDY.b #$00

#_088FDF: LDA.b $00
#_088FE1: STA.b ($90),Y

#_088FE3: LDA.b $01
#_088FE5: INY
#_088FE6: STA.b ($90),Y

#_088FE8: LDA.b #$80

#_088FEA: LDX.w $0FAC
#_088FED: CPX.b #$09
#_088FEF: BCS .diff_chr

#_088FF1: LDA.b #$92

.diff_chr
#_088FF3: INY
#_088FF4: STA.b ($90),Y

#_088FF6: LDX.w $0B68

#_088FF9: LDA.l .props,X
#_088FFD: INY
#_088FFE: STA.b ($90),Y

#_089000: TYA
#_089001: LSR A
#_089002: LSR A
#_089003: TAY

#_089004: LDA.b #$00
#_089006: STA.b ($92),Y

#_089008: RTS

.offscreen
#_089009: STZ.w $0FAC

#_08900C: RTS

;---------------------------------------------------------------------------------------------------

.late_stage
#_08900D: LDA.b $00
#_08900F: SEC
#_089010: SBC.b #$04

#_089012: LDY.b #$00
#_089014: STA.b ($90),Y

#_089016: LDY.b #$08
#_089018: STA.b ($90),Y

#_08901A: CLC
#_08901B: ADC.b #$08

#_08901D: LDY.b #$04
#_08901F: STA.b ($90),Y

#_089021: LDY.b #$0C
#_089023: STA.b ($90),Y

#_089025: LDA.b $01
#_089027: SEC
#_089028: SBC.b #$04

#_08902A: LDY.b #$01
#_08902C: STA.b ($90),Y

#_08902E: LDY.b #$05
#_089030: STA.b ($90),Y

#_089032: CLC
#_089033: ADC.b #$08

#_089035: LDY.b #$09
#_089037: STA.b ($90),Y

#_089039: LDY.b #$0D
#_08903B: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

#_08903D: LDX.w $0B68

#_089040: LDA.l .props,X
#_089044: LDY.b #$03
#_089046: STA.b ($90),Y

#_089048: ORA.b #$40
#_08904A: LDY.b #$07
#_08904C: STA.b ($90),Y

#_08904E: ORA.b #$80
#_089050: LDY.b #$0F
#_089052: STA.b ($90),Y

#_089054: EOR.b #$40
#_089056: LDY.b #$0B
#_089058: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

#_08905A: LDX.w $0FAC

#_08905D: LDA.w .char,X
#_089060: LDY.b #$02
#_089062: STA.b ($90),Y

#_089064: LDY.b #$06
#_089066: STA.b ($90),Y

#_089068: LDY.b #$0A
#_08906A: STA.b ($90),Y

#_08906C: LDY.b #$0E
#_08906E: STA.b ($90),Y

#_089070: LDY.b #$00
#_089072: LDA.b #$00
#_089074: STA.b ($92),Y

#_089076: INY
#_089077: STA.b ($92),Y

#_089079: INY
#_08907A: STA.b ($92),Y

#_08907C: INY
#_08907D: STA.b ($92),Y

#_08907F: RTS

;===================================================================================================

Ancilla_Move_X:
#_089080: TXA
#_089081: CLC
#_089082: ADC.b #$0A
#_089084: TAX

#_089085: JSR Ancilla_Move_Y

#_089088: BRL Ancilla_RestoreIndex

;---------------------------------------------------------------------------------------------------

Ancilla_Move_Y:
#_08908B: LDA.w $0C22,X

#_08908E: ASL A
#_08908F: ASL A
#_089090: ASL A
#_089091: ASL A

#_089092: CLC
#_089093: ADC.w $0C36,X
#_089096: STA.w $0C36,X

#_089099: LDY.b #$00

#_08909B: LDA.w $0C22,X
#_08909E: PHP

#_08909F: LSR A
#_0890A0: LSR A
#_0890A1: LSR A
#_0890A2: LSR A

#_0890A3: PLP
#_0890A4: BPL .other_way

#_0890A6: ORA.b #$F0
#_0890A8: DEY

.other_way
#_0890A9: ADC.w $0BFA,X
#_0890AC: STA.w $0BFA,X

#_0890AF: TYA
#_0890B0: ADC.w $0C0E,X
#_0890B3: STA.w $0C0E,X

#_0890B6: RTS

;===================================================================================================

Ancilla_Move_Z:
#_0890B7: LDA.w $0294,X

#_0890BA: ASL A
#_0890BB: ASL A
#_0890BC: ASL A
#_0890BD: ASL A

#_0890BE: CLC
#_0890BF: ADC.w $02A8,X
#_0890C2: STA.w $02A8,X

#_0890C5: LDY.b #$00

#_0890C7: LDA.w $0294,X
#_0890CA: PHP

#_0890CB: LSR A
#_0890CC: LSR A
#_0890CD: LSR A
#_0890CE: LSR A

#_0890CF: PLP
#_0890D0: BPL .other_way

#_0890D2: ORA.b #$F0
#_0890D4: DEY

.other_way
#_0890D5: ADC.w $029E,X
#_0890D8: STA.w $029E,X

#_0890DB: RTS

;===================================================================================================

pool Ancilla05_Boomerang

.offset_y
#_0890DC: dw -16,   6,   0,   0
#_0890E4: dw  -8,   8,  -8,   8

.offset_x
#_0890EC: dw   0,   0,  -8,   8
#_0890F4: dw   8,   8,  -8,  -8

pool off

;---------------------------------------------------------------------------------------------------

Ancilla05_Boomerang:
#_0890FC: LDY.b #$04

.next_slot
#_0890FE: LDA.w $0C4A,Y
#_089101: CMP.b #$22 ; ANCILLA 22
#_089103: BEQ .draw

#_089105: DEY
#_089106: BPL .next_slot

;---------------------------------------------------------------------------------------------------

#_089108: LDA.b $11
#_08910A: BNE .draw

#_08910C: LDA.b $1A
#_08910E: AND.b #$07
#_089110: BNE .no_whoosh

#_089112: LDA.b #$09 ; SFX2.09
#_089114: JSR Ancilla_SFX2_Pan

.no_whoosh
#_089117: LDA.w $03B1,X
#_08911A: BNE .pos_set

#_08911C: LDA.b $3C
#_08911E: CMP.b #$09
#_089120: BCS .init_pos

#_089122: LDA.w $0300
#_089125: BNE .init_pos

#_089127: LDA.w $02E0
#_08912A: BNE .bunny

#_08912C: LDA.b $4D
#_08912E: BEQ .draw

.bunny
#_089130: BRL Boom_Die

.draw
#_089133: BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.init_pos
#_089136: LDA.w $03CF,X
#_089139: TAY

#_08913A: REP #$20

#_08913C: LDA.b $20
#_08913E: CLC
#_08913F: ADC.w #$0008
#_089142: CLC
#_089143: ADC.w .offset_y,Y
#_089146: STA.b $00

#_089148: LDA.b $22
#_08914A: CLC
#_08914B: ADC.w .offset_x,Y
#_08914E: STA.b $02

#_089150: SEP #$20

#_089152: LDA.b $00
#_089154: STA.w $0BFA,X

#_089157: LDA.b $01
#_089159: STA.w $0C0E,X

#_08915C: LDA.b $02
#_08915E: STA.w $0C04,X

#_089161: LDA.b $03
#_089163: STA.w $0C18,X

#_089166: INC.w $03B1,X

;---------------------------------------------------------------------------------------------------

.pos_set
#_089169: LDA.w $0394,X
#_08916C: BEQ .no_sparkle

#_08916E: LDA.b $1A
#_089170: AND.b #$01
#_089172: BNE .no_sparkle

#_089174: PHX
#_089175: JSL AncillaAdd_SwordChargeSparkle
#_089179: PLX

.no_sparkle
#_08917A: LDA.w $0C5E,X
#_08917D: BEQ .move_away

#_08917F: LDA.w $0380,X
#_089182: BEQ .not_decelerating

#_089184: INC A

.decelerating
#_089185: STA.w $0380,X

.not_decelerating
#_089188: REP #$20

#_08918A: LDA.b $20
#_08918C: STA.w $038A,X

#_08918F: CLC
#_089190: ADC.w #$0008
#_089193: STA.b $20

#_089195: SEP #$20

#_089197: LDA.w $03C5,X
#_08919A: JSR Ancilla_ProjectSpeedTowardsPlayer

#_08919D: JSL Boomerang_CheatWhenNoOnesLooking

#_0891A1: LDA.b $00
#_0891A3: STA.w $0C22,X

#_0891A6: LDA.b $01
#_0891A8: STA.w $0C2C,X

#_0891AB: REP #$20

#_0891AD: LDA.w $038A,X
#_0891B0: STA.b $20

#_0891B2: SEP #$20

;---------------------------------------------------------------------------------------------------

.move_away
#_0891B4: LDA.w $0C22,X
#_0891B7: BEQ .y_speed_0

#_0891B9: CLC
#_0891BA: ADC.w $0380,X
#_0891BD: STA.w $0C22,X

.y_speed_0
#_0891C0: JSR Ancilla_Move_Y

#_0891C3: LDA.w $0C2C,X
#_0891C6: BEQ .x_speed_0

#_0891C8: CLC
#_0891C9: ADC.w $0380,X
#_0891CC: STA.w $0C2C,X

.x_speed_0
#_0891CF: JSR Ancilla_Move_X
#_0891D2: JSR Ancilla_CheckSpriteCollision

#_0891D5: LDY.b #$00
#_0891D7: BCC .no_sprite_collision

#_0891D9: INY

;---------------------------------------------------------------------------------------------------

.no_sprite_collision
#_0891DA: LDA.w $0C5E,X
#_0891DD: BNE .dont_turn_around

#_0891DF: CPY.b #$01
#_0891E1: BEQ .turn_around

#_0891E3: JSR Ancilla_CheckTileCollision
#_0891E6: BCC .no_tile_collision

#_0891E8: PHX

#_0891E9: JSL AncillaAdd_BoomerangWallClink

#_0891ED: PLX

#_0891EE: LDY.b #$06 ; SFX2.06

#_0891F0: LDA.w $03E4,X
#_0891F3: CMP.b #$F0 ; TILETYPE F0
#_0891F5: BEQ .not_key_door

#_0891F7: LDY.b #$05 ; SFX2.05

.not_key_door
#_0891F9: TYA
#_0891FA: JSR Ancilla_SFX2_Pan

#_0891FD: BRA .turn_around

;---------------------------------------------------------------------------------------------------

.no_tile_collision
#_0891FF: JSR Boomerang_ScreenEdge
#_089202: BCS .turn_around

#_089204: DEC.w $0C54,X

#_089207: LDA.w $0C54,X
#_08920A: BEQ .turn_around

#_08920C: CMP.b #$05
#_08920E: BCS .proceed_to_draw

#_089210: DEC.w $0380,X
#_089213: BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.turn_around
#_089215: LDA.w $0C5E,X
#_089218: EOR.b #$01
#_08921A: STA.w $0C5E,X

#_08921D: BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.dont_turn_around
#_08921F: LDA.w $0280,X
#_089222: PHA

#_089223: LDA.w $0C7C,X
#_089226: PHA

#_089227: STZ.w $0C7C,X

#_08922A: JSR Ancilla_CheckTileCollision

#_08922D: PLA
#_08922E: STA.w $0C7C,X

#_089231: PLA
#_089232: STA.w $0280,X

#_089235: JSR Boomerang_StopOffScreen

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
#_089238: BRL AncillaDraw_Boomerang

;===================================================================================================

Ancilla_CheckTileCollision_long:
#_08923B: PHB
#_08923C: PHK
#_08923D: PLB

#_08923E: JSR Ancilla_CheckTileCollision

#_089241: PLB

#_089242: RTL

;===================================================================================================

Ancilla_CheckTileCollision_Class2_long:
#_089243: PHB
#_089244: PHK
#_089245: PLB

#_089246: JSR Ancilla_CheckTileCollision_Class2

#_089249: PLB

#_08924A: RTL

;===================================================================================================

Boomerang_ScreenEdge:
#_08924B: LDA.w $0BFA,X
#_08924E: STA.b $00

#_089250: LDA.w $0C0E,X
#_089253: STA.b $01

#_089255: LDA.w $0C04,X
#_089258: STA.b $02

#_08925A: LDA.w $0C18,X
#_08925D: STA.b $03

;---------------------------------------------------------------------------------------------------

#_08925F: REP #$30

#_089261: LDY.w #$0000

#_089264: LDA.w $039D
#_089267: AND.w #$0003
#_08926A: BEQ .no_horizontal

#_08926C: AND.w #$0001
#_08926F: BEQ .leftwards

#_089271: LDY.w #$0010

.leftwards
#_089274: TYA
#_089275: CLC
#_089276: ADC.b $02

#_089278: SEC
#_089279: SBC.b $E2
#_08927B: STA.b $02

#_08927D: CMP.w #$0100
#_089280: BCS .do_reverse

;---------------------------------------------------------------------------------------------------

.no_horizontal
#_089282: LDY.w #$0000

#_089285: LDA.w $039D
#_089288: AND.w #$000C
#_08928B: BEQ .dont_reverse

#_08928D: AND.w #$0004
#_089290: BEQ .upward

#_089292: LDY.w #$0010

.upward
#_089295: TYA
#_089296: CLC
#_089297: ADC.b $00

#_089299: SEC
#_08929A: SBC.b $E8
#_08929C: STA.b $00

#_08929E: CMP.w #$00E2
#_0892A1: BCC .dont_reverse

;---------------------------------------------------------------------------------------------------

.do_reverse
#_0892A3: SEP #$30
#_0892A5: SEC

#_0892A6: RTS

;---------------------------------------------------------------------------------------------------

.dont_reverse
#_0892A7: SEP #$30
#_0892A9: CLC

#_0892AA: RTS

;===================================================================================================

Boomerang_StopOffScreen:
#_0892AB: LDA.w $0BFA,X
#_0892AE: STA.b $04

#_0892B0: LDA.w $0C0E,X
#_0892B3: STA.b $05

#_0892B5: LDA.w $0C04,X
#_0892B8: STA.b $06

#_0892BA: LDA.w $0C18,X
#_0892BD: STA.b $07

;---------------------------------------------------------------------------------------------------

#_0892BF: REP #$20

#_0892C1: LDA.b $20
#_0892C3: CLC
#_0892C4: ADC.w #$0018
#_0892C7: STA.b $00

#_0892C9: LDA.b $22
#_0892CB: CLC
#_0892CC: ADC.w #$0010
#_0892CF: STA.b $02

#_0892D1: LDA.b $04
#_0892D3: CLC
#_0892D4: ADC.w #$0008
#_0892D7: STA.b $04

#_0892D9: LDA.b $06
#_0892DB: CLC
#_0892DC: ADC.w #$0008
#_0892DF: STA.b $06

#_0892E1: LDA.b $04
#_0892E3: CMP.b $20
#_0892E5: BCC Boom_NoDie

#_0892E7: CMP.b $00
#_0892E9: BCS Boom_NoDie

#_0892EB: LDA.b $06
#_0892ED: CMP.b $22
#_0892EF: BCC Boom_NoDie

#_0892F1: CMP.b $02
#_0892F3: BCS Boom_NoDie

;---------------------------------------------------------------------------------------------------

Boom_Die:
#_0892F5: SEP #$20

#_0892F7: STZ.w $0C4A,X

#_0892FA: STZ.w $035F

#_0892FD: LDA.w $0301
#_089300: AND.b #$80
#_089302: BEQ Boom_NoDie

#_089304: STZ.w $0301

#_089307: LDA.b $3A
#_089309: AND.b #$BF
#_08930B: STA.b $3A

#_08930D: AND.b #$80
#_08930F: BNE Boom_NoDie

#_089311: LDA.b $50
#_089313: AND.b #$FE
#_089315: STA.b $50

;===================================================================================================

Boom_NoDie:
#_089317: SEP #$20

#_089319: RTS

;===================================================================================================

pool AncillaDraw_Boomerang

.prop
#_08931A: db $A4, $E4
#_08931C: db $64, $24
#_08931E: db $A2, $E2
#_089320: db $62, $22

.offset
#_089322: dw   2,  -2
#_089326: dw   2,   2
#_08932A: dw  -2,   2
#_08932E: dw  -2,  -2

.oam_offset
#_089332: dw $0180
#_089334: dw $00D0

.rotation
#_089336: db $03, $02

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_Boomerang:
#_089338: JSR Ancilla_PrepOAMCoord

#_08933B: LDA.w $0C5E,X
#_08933E: BEQ .move_away

#_089340: LDA.b $EE
#_089342: STA.w $0C7C,X

#_089345: TAY

#_089346: LDA.w AncillaPriorities,Y
#_089349: STA.b $65

.move_away
#_08934B: LDA.w $0280,X
#_08934E: BEQ .normal_priority

#_089350: LDA.b #$30
#_089352: STA.b $65

.normal_priority
#_089354: LDA.b $11
#_089356: BNE .leave_rotation

#_089358: LDA.w $03B1,X
#_08935B: BEQ .leave_rotation

#_08935D: DEC.w $039F,X
#_089360: BPL .leave_rotation

#_089362: LDY.w $0394,X

#_089365: LDA.w .rotation,Y
#_089368: STA.w $039F,X

#_08936B: LDY.w $03A4,X

#_08936E: LDA.w $03A9,X
#_089371: BEQ .left_throw

#_089373: DEY

#_089374: BRA .set_rotation

.left_throw
#_089376: INY

.set_rotation
#_089377: TYA
#_089378: AND.b #$03
#_08937A: STA.w $03A4,X

;---------------------------------------------------------------------------------------------------

.leave_rotation
#_08937D: PHX

#_08937E: LDA.w $0394,X
#_089381: ASL A
#_089382: ASL A
#_089383: STA.b $72

#_089385: LDA.w $03A4,X
#_089388: ASL A
#_089389: ASL A
#_08938A: TAY

#_08938B: REP #$20

#_08938D: STZ.b $74

#_08938F: LDA.w .offset+0,Y
#_089392: CLC
#_089393: ADC.b $00
#_089395: STA.b $00

#_089397: LDA.w .offset+2,Y
#_08939A: CLC
#_08939B: ADC.b $02
#_08939D: STA.b $02
#_08939F: STA.b $04

#_0893A1: LDA.w $03B1,X
#_0893A4: AND.w #$00FF
#_0893A7: BNE .general_oam

#_0893A9: LDA.w $0FB3
#_0893AC: AND.w #$00FF
#_0893AF: ASL A
#_0893B0: TAX

#_0893B1: LDA.w .oam_offset,X
#_0893B4: PHA

#_0893B5: LSR A
#_0893B6: LSR A
#_0893B7: CLC

#_0893B8: ADC.w #$0A20
#_0893BB: STA.b $92

#_0893BD: PLA
#_0893BE: CLC
#_0893BF: ADC.w #$0800
#_0893C2: STA.b $90

;---------------------------------------------------------------------------------------------------

.general_oam
#_0893C4: SEP #$20

#_0893C6: TYA
#_0893C7: LSR A
#_0893C8: LSR A
#_0893C9: CLC
#_0893CA: ADC.b $72
#_0893CC: TAX

#_0893CD: LDY.b #$00
#_0893CF: JSR Ancilla_SetOAM_XY_safe

#_0893D2: LDA.b #$26
#_0893D4: STA.b ($90),Y

#_0893D6: INY

#_0893D7: LDA.w .prop,X
#_0893DA: AND.b #$CF
#_0893DC: ORA.b $65
#_0893DE: STA.b ($90),Y

#_0893E0: LDA.b #$02
#_0893E2: ORA.b $75
#_0893E4: STA.b ($92)

#_0893E6: PLX

#_0893E7: RTS

;===================================================================================================

Ancilla06_WallHit:
#_0893E8: DEC.w $039F,X
#_0893EB: BPL WallHit_JustDraw

#_0893ED: LDA.w $0C5E,X
#_0893F0: INC A
#_0893F1: CMP.b #$05
#_0893F3: BEQ WallHit_JustDie

#_0893F5: STA.w $0C5E,X

#_0893F8: LDA.b #$01
#_0893FA: STA.w $039F,X

#_0893FD: BRA WallHit_JustDraw

;===================================================================================================

Ancilla1B_SwordWallHit:
#_0893FF: JSR Ancilla_SpriteAlert

#_089402: DEC.w $03B1,X
#_089405: BPL WallHit_JustDraw

#_089407: LDA.w $0C5E,X
#_08940A: INC A
#_08940B: CMP.b #$08
#_08940D: BEQ WallHit_JustDie

#_08940F: STA.w $0C5E,X

#_089412: LDA.b #$01
#_089414: STA.w $03B1,X

#_089417: BRA WallHit_JustDraw

;---------------------------------------------------------------------------------------------------

WallHit_JustDie:
#_089419: BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

WallHit_JustDraw:
#_08941C: BRL AncillaDraw_WallHit

;===================================================================================================

pool AncillaDraw_WallHit

.char
#_08941F: db $80, $00, $00, $00
#_089423: db $92, $00, $00, $00
#_089427: db $81, $81, $81, $81
#_08942B: db $82, $82, $82, $82
#_08942F: db $93, $93, $93, $93
#_089433: db $92, $00, $00, $00
#_089437: db $B9, $00, $00, $00
#_08943B: db $90, $90, $00, $00

.prop
#_08943F: db $32, $00, $00, $00
#_089443: db $32, $00, $00, $00
#_089447: db $32, $72, $B2, $F2
#_08944B: db $32, $72, $B2, $F2
#_08944F: db $32, $72, $B2, $F2
#_089453: db $32, $00, $00, $00
#_089457: db $72, $00, $00, $00
#_08945B: db $32, $F2, $00, $00

.offset_y
#_08945F: dw  -4,   0,   0,   0
#_089467: dw  -4,   0,   0,   0
#_08946F: dw  -8,  -8,   0,   0
#_089477: dw  -8,  -8,   0,   0
#_08947F: dw  -8,  -8,   0,   0
#_089487: dw  -4,   0,   0,   0
#_08948F: dw  -4,   0,   0,   0
#_089497: dw  -8,   0,   0,   0

.offset_x
#_08949F: dw  -4,   0,   0,   0
#_0894A7: dw  -4,   0,   0,   0
#_0894AF: dw  -8,   0,  -8,   0
#_0894B7: dw  -8,   0,  -8,   0
#_0894BF: dw  -8,   0,  -8,   0
#_0894C7: dw  -4,   0,   0,   0
#_0894CF: dw  -4,   0,   0,   0
#_0894D7: dw  -8,   0,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_WallHit:
#_0894DF: JSR Ancilla_PrepOAMCoord

#_0894E2: REP #$20

#_0894E4: LDA.b $00
#_0894E6: STA.b $04

#_0894E8: LDA.b $02
#_0894EA: STA.b $06

#_0894EC: SEP #$20

#_0894EE: LDA.b #$03
#_0894F0: STA.b $08

#_0894F2: PHX

#_0894F3: LDA.w $0C5E,X
#_0894F6: ASL A
#_0894F7: ASL A
#_0894F8: TAX

;---------------------------------------------------------------------------------------------------

#_0894F9: LDY.b #$00

.next_object
#_0894FB: LDA.w .char,X
#_0894FE: BEQ .skip

#_089500: PHX

#_089501: TXA
#_089502: ASL A
#_089503: TAX

#_089504: REP #$20

#_089506: LDA.w .offset_y,X
#_089509: CLC
#_08950A: ADC.b $04
#_08950C: STA.b $00

#_08950E: LDA.w .offset_x,X
#_089511: CLC
#_089512: ADC.b $06
#_089514: STA.b $02

#_089516: SEP #$20

#_089518: PLX

#_089519: JSR Ancilla_SetOAM_XY

#_08951C: LDA.w .char,X
#_08951F: STA.b ($90),Y

#_089521: INY

#_089522: LDA.w .prop,X
#_089525: AND.b #$CF
#_089527: ORA.b $65
#_089529: STA.b ($90),Y

#_08952B: INY

#_08952C: PHY

#_08952D: TYA
#_08952E: SEC
#_08952F: SBC.b #$04
#_089531: LSR A
#_089532: LSR A
#_089533: TAY

#_089534: LDA.b #$00
#_089536: STA.b ($92),Y

#_089538: PLY

.skip
#_089539: JSR Ancilla_AllocateOAMFromCustomRegion

#_08953C: INX
#_08953D: DEC.b $08

#_08953F: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_089541: PLX

#_089542: RTS

;===================================================================================================

Bomb_timer:
#_089543: db 160,   6,   4,   4
#_089547: db   4,   4,   4,   6
#_08954B: db   6,   6,   6

Bomb_anim_step:
#_08954E: db $00, $01, $02, $03
#_089552: db $02, $03, $04, $05
#_089556: db $06, $07, $08, $09

;===================================================================================================

Ancilla07_Bomb:
#_08955A: LDA.b $11
#_08955C: BEQ .main

#_08955E: CMP.b #$08
#_089560: BEQ .staircase

#_089562: CMP.b #$10
#_089564: BNE .not_staircase

.staircase
#_089566: JSR Ancilla_HandleLiftLogic

#_089569: BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.not_staircase
#_08956B: TXA
#_08956C: INC A
#_08956D: CMP.w $02EC
#_089570: BNE .proceed_to_draw

#_089572: LDA.w $0380,X
#_089575: BEQ .proceed_to_draw

#_089577: CMP.b #$03
#_089579: BEQ .fully_held

#_08957B: LDY.b #$03
#_08957D: JSR Ancilla_LatchLinkCoordinates
#_089580: JSR Ancilla_LatchAltitudeAboveLink

#_089583: LDA.b #$03
#_089585: STA.w $0380,X

.fully_held
#_089588: JSR Ancilla_LatchCarriedPosition

.proceed_to_draw
#_08958B: BRL Bomb_DoDraw

;---------------------------------------------------------------------------------------------------

.main
#_08958E: JSR Ancilla_HandleLiftLogic
#_089591: JSR Ancilla_LatchYCoordToZ

#_089594: LDA.w $0C72,X
#_089597: STA.b $74

#_089599: LDA.w $0280,X
#_08959C: STA.b $75

#_08959E: STZ.w $0280,X

#_0895A1: JSR Ancilla_CheckTileCollision_Class2
#_0895A4: PHP

#_0895A5: LDA.b $1B
#_0895A7: BEQ .leave_layer

#_0895A9: LDA.w $0385,X
#_0895AC: BEQ .leave_layer

#_0895AE: LDA.w $03E4,X
#_0895B1: CMP.b #$1C ; TILETYPE 1C
#_0895B3: BNE .leave_layer

#_0895B5: LDA.b #$01
#_0895B7: STA.w $03D5,X

.leave_layer
#_0895BA: PLP
#_0895BB: BCC .no_tile_collision

;---------------------------------------------------------------------------------------------------

.check_for_lift
#_0895BD: BIT.w $0308
#_0895C0: BPL .link_not_holding

#_0895C2: LDA.w $0309
#_0895C5: BEQ .no_tile_collision

.link_not_holding
#_0895C7: LDA.b $75
#_0895C9: BNE .ignore_tile_collision

#_0895CB: LDA.w $0BF0,X
#_0895CE: BNE .ignore_tile_collision

#_0895D0: LDA.b #$01
#_0895D2: STA.w $0BF0,X

#_0895D5: LDA.b #$04
#_0895D7: STA.b $0E

#_0895D9: LDY.b #$FC

#_0895DB: LDA.w $0C72,X
#_0895DE: CMP.b #$01
#_0895E0: BNE .not_downwards

#_0895E2: LDA.b #$10
#_0895E4: STA.b $0E

#_0895E6: LDY.b #$F0

;---------------------------------------------------------------------------------------------------

.not_downwards
#_0895E8: LDA.w $0C22,X
#_0895EB: BEQ .not_moving_y
#_0895ED: BPL .positive_y

#_0895EF: LDY.b $0E

.positive_y
#_0895F1: TYA
#_0895F2: STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

.not_moving_y
#_0895F5: LDY.b #$FC

#_0895F7: LDA.w $0C2C,X
#_0895FA: BEQ .not_moving_x
#_0895FC: BPL .positive_x

#_0895FE: LDY.b #$04

.positive_x
#_089600: TYA
#_089601: STA.w $0C2C,X

.not_moving_x
#_089604: LDA.w $0C72,X
#_089607: CMP.b #$01
#_089609: BNE .ignore_tile_collision

#_08960B: LDA.w $029E,X
#_08960E: BEQ .ignore_tile_collision

#_089610: LDA.b #$FC
#_089612: STA.w $0C22,X

#_089615: LDA.b #$02
#_089617: STA.w $0385,X

.ignore_tile_collision
#_08961A: BRL Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.no_tile_collision
#_08961D: TXA
#_08961E: INC A
#_08961F: CMP.w $02EC
#_089622: BNE .not_lifted_bomb

#_089624: BIT.w $0308
#_089627: BMI .ignore_tile_collision

.not_lifted_bomb
#_089629: LDA.w $029E,X
#_08962C: BEQ .on_ground

#_08962E: CMP.b #$FF
#_089630: BNE .ignore_tile_collision

.on_ground
#_089632: LDA.b #$10
#_089634: STA.w $0C72,X

#_089637: LDA.w $0280,X
#_08963A: PHA

#_08963B: JSR Ancilla_CheckTileCollision

#_08963E: PLA
#_08963F: STA.w $0280,X

;---------------------------------------------------------------------------------------------------

#_089642: LDA.w $03E4,X
#_089645: CMP.b #$26 ; TILETYPE 26
#_089647: BEQ .tile_staircase

#_089649: CMP.b #$0C ; TILETYPE 0C
#_08964B: BEQ .tile_0C_1C

#_08964D: CMP.b #$1C ; TILETYPE 1C
#_08964F: BEQ .tile_0C_1C

#_089651: CMP.b #$20 ; TILETYPE 20
#_089653: BEQ .tile_pit

#_089655: CMP.b #$08 ; TILETYPE 08
#_089657: BEQ .tile_deep_water

#_089659: CMP.b #$68 ; TILETYPE 68
#_08965B: BEQ .tile_conveyor

#_08965D: CMP.b #$69 ; TILETYPE 69
#_08965F: BEQ .tile_conveyor

#_089661: CMP.b #$6A ; TILETYPE 6A
#_089663: BEQ .tile_conveyor

#_089665: CMP.b #$6B ; TILETYPE 6B
#_089667: BEQ .tile_conveyor

#_089669: CMP.b #$B6 ; TILETYPE B6
#_08966B: BEQ .tile_transit

#_08966D: CMP.b #$BC ; TILETYPE BC
#_08966F: BEQ .tile_transit

#_089671: AND.b #$F0
#_089673: CMP.b #$B0
#_089675: BEQ .tile_pit

;---------------------------------------------------------------------------------------------------

.tile_transit
#_089677: STZ.w $0C68,X

#_08967A: LDA.w $0385,X
#_08967D: BNE .ignore_tile_collision

#_08967F: LDA.b #$02
#_089681: STA.w $0C68,X

.bounce_to_state_handler
#_089684: BRL Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.tile_conveyor
#_089687: BRL Bomb_HandleConveyor

;---------------------------------------------------------------------------------------------------

.tile_staircase
#_08968A: BRL .check_for_lift

;---------------------------------------------------------------------------------------------------

.tile_0C_1C
#_08968D: BRL Bomb_HandleTiles_0C_1C

;---------------------------------------------------------------------------------------------------

.tile_deep_water
#_089690: TXA
#_089691: INC A
#_089692: CMP.w $02EC
#_089695: BNE .water_reset_a

#_089697: STZ.w $02EC

.water_reset_a
#_08969A: LDA.w $0C68,X
#_08969D: BNE .bounce_to_state_handler

#_08969F: LDA.w $0BFA,X
#_0896A2: CLC
#_0896A3: ADC.b #$E8
#_0896A5: STA.w $0BFA,X

#_0896A8: LDA.b #$FF
#_0896AA: ADC.w $0C0E,X
#_0896AD: STA.w $0C0E,X

#_0896B0: BRL Ancilla_TransmuteToSplash

;---------------------------------------------------------------------------------------------------

.tile_pit
#_0896B3: LDA.w $0308
#_0896B6: BMI Bomb_HandleState

#_0896B8: STX.b $04

#_0896BA: LDA.w $02EC
#_0896BD: DEC A
#_0896BE: CMP.b $04
#_0896C0: BNE .water_reset_b

#_0896C2: STZ.w $02EC

.water_reset_b
#_0896C5: LDA.w $0C68,X
#_0896C8: BNE .bounce_to_state_handler

#_0896CA: BRL Ancilla_DeleteSelf

;---------------------------------------------------------------------------------------------------

Bomb_HandleTiles_0C_1C:
#_0896CD: LDA.w $046C
#_0896D0: CMP.b #$03
#_0896D2: BEQ .moving_floor

#_0896D4: LDA.w $0C7C,X
#_0896D7: BNE Bomb_HandleState

#_0896D9: LDA.w $029E,X
#_0896DC: BEQ Bomb_HandleState

#_0896DE: CMP.b #$FF
#_0896E0: BEQ Bomb_HandleState

#_0896E2: LDA.b #$01
#_0896E4: STA.w $0C7C,X

#_0896E7: BRA Bomb_HandleState

;---------------------------------------------------------------------------------------------------

.moving_floor
#_0896E9: LDA.w $0310
#_0896EC: CLC
#_0896ED: ADC.w $0BFA,X
#_0896F0: STA.b $72

#_0896F2: LDA.w $0311
#_0896F5: ADC.w $0C0E,X
#_0896F8: STA.b $73

#_0896FA: LDA.w $0312
#_0896FD: CLC
#_0896FE: ADC.w $0C04,X
#_089701: STA.w $0C04,X

#_089704: LDA.w $0313
#_089707: ADC.w $0C18,X
#_08970A: STA.w $0C18,X

#_08970D: BRA Bomb_HandleState

;===================================================================================================

Bomb_HandleConveyor:
#_08970F: JSR Ancilla_ApplyConveyor

;===================================================================================================

Bomb_HandleState:
#_089712: JSR Ancilla_SetYFrom_DP72

#_089715: LDA.b $74
#_089717: STA.w $0C72,X

#_08971A: LDA.b $75
#_08971C: ORA.w $0280,X
#_08971F: STA.w $0280,X

#_089722: JSR Bomb_CheckSpriteAndPlayerDamage

#_089725: DEC.w $039F,X

#_089728: LDA.w $039F,X
#_08972B: BNE .delay

#_08972D: INC.w $0C5E,X

#_089730: LDA.w $0C5E,X
#_089733: CMP.b #$01
#_089735: BNE .not_just_exploded

#_089737: LDA.b #$0C ; SFX2.0C
#_089739: JSR Ancilla_SFX2_Pan

#_08973C: TXA
#_08973D: INC A
#_08973E: CMP.w $02EC
#_089741: BNE .not_just_exploded

#_089743: STZ.w $02EC

#_089746: BIT.w $0308
#_089749: BPL .not_just_exploded

#_08974B: STZ.w $0308
#_08974E: STZ.b $50

;---------------------------------------------------------------------------------------------------

.not_just_exploded
#_089750: LDA.w $0C5E,X
#_089753: CMP.b #$0B
#_089755: BNE .not_fully_exploded

#_089757: LDY.b #$00

#_089759: LDA.w $0C54,X
#_08975C: BEQ .dont_become_debris

#_08975E: LDY.b #$08 ; ANCILLA 08

.dont_become_debris
#_089760: TYA
#_089761: STA.w $0C4A,X

#_089764: RTS

;---------------------------------------------------------------------------------------------------

.not_fully_exploded
#_089765: TAY

#_089766: LDA.w Bomb_timer,Y
#_089769: STA.w $039F,X

;---------------------------------------------------------------------------------------------------

.delay
#_08976C: LDA.w $0C5E,X

#_08976F: CMP.b #$07
#_089771: BNE Bomb_DoDraw

#_089773: LDA.w $039F,X
#_089776: CMP.b #$02
#_089778: BNE Bomb_DoDraw

#_08977A: PHX

#_08977B: LDA.w $0BFA,X
#_08977E: STA.b $00

#_089780: LDA.w $0C0E,X
#_089783: STA.b $01

#_089785: LDA.w $0C04,X
#_089788: STA.b $02

#_08978A: LDA.w $0C18,X
#_08978D: STA.b $03

#_08978F: STX.b $0E

#_089791: TXA
#_089792: ASL A
#_089793: TAX

#_089794: STZ.w $03B6,X
#_089797: STZ.w $03B7,X

#_08979A: JSL Bomb_CheckForDestructibles

#_08979E: PLX

#_08979F: TXY
#_0897A0: TXA

#_0897A1: ASL A
#_0897A2: TAX

#_0897A3: LDA.w $03B6,X
#_0897A6: ORA.w $03B7,X
#_0897A9: BEQ .didnt_break_wall

#_0897AB: TYX

#_0897AC: LDA.b #$01
#_0897AE: STA.w $0C54,X

.didnt_break_wall
#_0897B1: TYX

;===================================================================================================

Bomb_DoDraw:
#_0897B2: JSR AncillaDraw_Bomb

;---------------------------------------------------------------------------------------------------

#EXIT_0897B5:
#_0897B5: RTS

;===================================================================================================

pool Ancilla_ApplyConveyor

.speed_y
#_0897B6: db  -8,   8,   0,   0

.speed_x
#_0897BA: db   0,   0,  -8,   8

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_ApplyConveyor:
#_0897BE: LDA.w $03E4,X
#_0897C1: SEC
#_0897C2: SBC.b #$68 ; TILETYPE 68
#_0897C4: TAY

#_0897C5: LDA.w .speed_y,Y
#_0897C8: STA.w $0C22,X

#_0897CB: LDA.w .speed_x,Y
#_0897CE: STA.w $0C2C,X

#_0897D1: JSR Ancilla_Move_Y
#_0897D4: JSR Ancilla_Move_X

#_0897D7: LDA.w $0BFA,X
#_0897DA: STA.b $72

#_0897DC: LDA.w $0C0E,X
#_0897DF: STA.b $73

#_0897E1: RTS

;===================================================================================================

pool Bomb_CheckSpriteAndPlayerDamage

.recoil
#_0897E2: db $20, $20, $20, $20
#_0897E6: db $20, $20, $1C, $1C
#_0897EA: db $1C, $1C, $1C, $1C
#_0897EE: db $18, $18, $18, $18

.recoil_z
#_0897F2: db $10, $10, $10, $10
#_0897F6: db $10, $10, $0C, $0C
#_0897FA: db $0C, $0C, $08, $08
#_0897FE: db $08, $08, $08, $08

.recoil_timer
#_089802: db  32,  32,  32,  32
#_089806: db  32,  32,  24,  24
#_08980A: db  24,  24,  24,  24
#_08980E: db  16,  16,  16,  16

.link_damage
#_089812: db $08 ; green mail
#_089813: db $04 ; blue mail
#_089814: db $02 ; red mail

pool off

;===================================================================================================

Bomb_CheckSpriteAndPlayerDamage:
#_089815: LDA.w $0C5E,X
#_089818: BEQ .no_damage

#_08981A: CMP.b #$09
#_08981C: BCS .no_damage

#_08981E: JSR Bomb_CheckSpriteDamage

#_089821: LDA.w $037B
#_089824: BEQ .link_vulnerable

#_089826: TXA
#_089827: INC A
#_089828: CMP.w $02EC
#_08982B: BNE EXIT_0897B5

#_08982D: LDA.w $0308
#_089830: AND.b #$80
#_089832: BEQ EXIT_0897B5

#_089834: LDA.w $0308
#_089837: AND.b #$7F
#_089839: STA.w $0308

#_08983C: STZ.b $50

.no_damage
#_08983E: BRL EXIT_0897B5

.link_vulnerable
#_089841: LDA.b $4D
#_089843: BNE .no_damage

#_089845: LDA.b $46
#_089847: BNE .no_damage

#_089849: LDA.w $0C7C,X
#_08984C: CMP.b $EE
#_08984E: BNE .no_damage

;---------------------------------------------------------------------------------------------------

#_089850: LDA.b $22
#_089852: STA.b $00

#_089854: LDA.b $23
#_089856: STA.b $08

#_089858: LDA.b $20
#_08985A: STA.b $01

#_08985C: LDA.b $21
#_08985E: STA.b $09

#_089860: LDA.b #$10
#_089862: STA.b $02

#_089864: LDA.b #$18
#_089866: STA.b $03

#_089868: LDA.w $0C04,X
#_08986B: STA.b $04

#_08986D: LDA.w $0C18,X
#_089870: STA.b $05

#_089872: LDA.w $0BFA,X
#_089875: STA.b $06

#_089877: LDA.w $0C0E,X
#_08987A: STA.b $07

;---------------------------------------------------------------------------------------------------

#_08987C: REP #$20

#_08987E: LDA.b $04
#_089880: CLC
#_089881: ADC.w #$FFF0
#_089884: STA.b $04

#_089886: LDA.b $06
#_089888: CLC
#_089889: ADC.w #$FFF0
#_08988C: STA.b $06

#_08988E: SEP #$20

#_089890: LDA.b $05
#_089892: STA.b $0A

#_089894: LDA.b $06
#_089896: STA.b $05

#_089898: LDA.b $07
#_08989A: STA.b $0B

#_08989C: LDA.b #$20
#_08989E: STA.b $06
#_0898A0: STA.b $07

#_0898A2: JSL CheckIfHitBoxesOverlap_long
#_0898A6: BCC .exit

;---------------------------------------------------------------------------------------------------

#_0898A8: LDA.w $0C04,X
#_0898AB: CLC
#_0898AC: ADC.b #$F8
#_0898AE: STA.b $00

#_0898B0: LDA.w $0C18,X
#_0898B3: ADC.b #$FF
#_0898B5: STA.b $01

#_0898B7: LDA.w $0BFA,X
#_0898BA: CLC
#_0898BB: ADC.b #$F4
#_0898BD: STA.b $02

#_0898BF: LDA.w $0C0E,X
#_0898C2: ADC.b #$FF
#_0898C4: STA.b $03

#_0898C6: PHX

#_0898C7: JSR Bomb_GetDisplacementFromLink

#_0898CA: LDA.w .recoil,Y
#_0898CD: TAY

#_0898CE: JSL Bomb_HijackSlot0ForRecoil
#_0898D2: PLX

;---------------------------------------------------------------------------------------------------

#_0898D3: LDA.w $031F
#_0898D6: BNE .exit

#_0898D8: LDA.w $0FFC
#_0898DB: CMP.b #$02
#_0898DD: BEQ .exit

#_0898DF: LDA.b $00
#_0898E1: STA.b $27

#_0898E3: LDA.b $01
#_0898E5: STA.b $28

#_0898E7: JSR Bomb_GetDisplacementFromLink

#_0898EA: LDA.w .recoil_z,Y
#_0898ED: STA.b $29
#_0898EF: STA.w $02C7

#_0898F2: LDA.w .recoil_timer,Y
#_0898F5: STA.b $46

#_0898F7: LDA.b #$01
#_0898F9: STA.b $4D

#_0898FB: LDA.b #$3A
#_0898FD: STA.w $031F

#_089900: LDA.w $0403
#_089903: AND.b #$80
#_089905: BNE .exit

#_089907: LDA.l $7EF35B
#_08990B: TAY

#_08990C: LDA.w .link_damage,Y
#_08990F: STA.w $0373

.exit
#_089912: RTS

;===================================================================================================

pool AncillaCarry

.offset_y
#_089913: dw  16,   8,   4,   4
#_08991B: dw   8,   2,  -1,  -1
#_089923: dw   2,   2,  -1,  -1

.offset_x
#_08992B: dw   8,   8,  -4,  20
#_089933: dw   8,   8,   8,   8
#_08993B: dw   8,   8,   8,   8

.timer
#_089943: db  16,   8,   9

.offset_z
#_089946: dw  -2,  -1
#_08994A: dw   0,  -2
#_08994E: dw  -1,   0

.throw_speed_y
#_089952: db -32,  32,   0,   0

.throw_speed_x
#_089956: db   0,   0, -32,  32

.unused_a
#_08995A: db $08, $08, $00, $00
#_08995E: db $04, $04, $00, $00

.unused_b
#_089962: db $00, $00, $08, $08
#_089966: db $00, $00, $04, $04

.bounce_z
#_08996A: db  16,  16

.unused_c
#_08996C: db $10, $10, $08, $08, $08, $08

.direction
#_089972: db $00, $02, $04, $06

pool off

;===================================================================================================

Ancilla_HandleLiftLogic:
#_089976: LDA.w $03EA,X
#_089979: BNE .not_liftable

#_08997B: LDA.w $0385,X
#_08997E: BEQ .not_airborne

#_089980: BRL AncillaCarry_Airborne

.not_airborne
#_089983: STX.b $00

#_089985: LDA.w $02EC
#_089988: BEQ .link_not_close

#_08998A: DEC A
#_08998B: CMP.b $00
#_08998D: BEQ .is_closest_for_lift

#_08998F: RTS

;---------------------------------------------------------------------------------------------------

.is_closest_for_lift
#_089990: LDY.w $037B
#_089993: BNE .link_invulnerable

#_089995: LDA.b $46
#_089997: BNE .link_cant_handle_it

.link_invulnerable
#_089999: LDA.w $03FD
#_08999C: BNE .link_cant_handle_it

#_08999E: LDA.b $4D
#_0899A0: CMP.b #$01
#_0899A2: BNE .link_not_recoiling

;---------------------------------------------------------------------------------------------------

.link_cant_handle_it
#_0899A4: LDA.b #$01
#_0899A6: STA.w $03EA,X

#_0899A9: STZ.w $0294,X
#_0899AC: STZ.w $02EC
#_0899AF: STZ.w $0BF0,X

#_0899B2: BRA .not_liftable

;---------------------------------------------------------------------------------------------------

.link_not_recoiling
#_0899B4: LDA.w $0308
#_0899B7: BPL .link_not_close

#_0899B9: BRL .link_hands_are_full

;---------------------------------------------------------------------------------------------------

.not_liftable
#_0899BC: BRL Ancilla_LatchCarriedPosition_handle_altitude

;---------------------------------------------------------------------------------------------------

.link_not_close
#_0899BF: STZ.w $02EC

#_0899C2: LDA.w $0C5E,X
#_0899C5: BNE .exit

#_0899C7: LDA.w $0308
#_0899CA: BNE .exit

#_0899CC: LDY.b #$00
#_0899CE: JSR Ancilla_CheckLinkCollision
#_0899D1: BCC .exit

#_0899D3: LDA.w $0C7C,X
#_0899D6: CMP.b $EE
#_0899D8: BNE .exit

#_0899DA: LDA.b $08
#_0899DC: CMP.b #$10
#_0899DE: BCS .y_difference_big

#_0899E0: LDA.b $0A
#_0899E2: CMP.b #$0C
#_0899E4: BCC .continue_lift

;---------------------------------------------------------------------------------------------------

.y_difference_big
#_0899E6: LDA.b $08
#_0899E8: CMP.b $0A
#_0899EA: BCC .y_difference_smaller

#_0899EC: LDY.b #$00

#_0899EE: LDA.b $04
#_0899F0: BPL .check_direction

#_0899F2: INY
#_0899F3: BRA .check_direction

;---------------------------------------------------------------------------------------------------

.y_difference_smaller
#_0899F5: LDY.b #$02

#_0899F7: LDA.b $06
#_0899F9: BPL .check_direction

#_0899FB: INY

.check_direction
#_0899FC: LDA.w AncillaCarry_direction,Y
#_0899FF: CMP.b $2F
#_089A01: BNE .exit

;---------------------------------------------------------------------------------------------------

.continue_lift
#_089A03: TXA
#_089A04: INC A
#_089A05: STA.w $02EC

#_089A08: STZ.w $0380,X

#_089A0B: LDA.w AncillaCarry_timer
#_089A0E: STA.w $03B1,X

#_089A11: STZ.w $0385,X
#_089A14: STZ.w $029E,X

.exit
#_089A17: RTS

;---------------------------------------------------------------------------------------------------

.link_hands_are_full
#_089A18: LDA.w $0309
#_089A1B: CMP.b #$02
#_089A1D: BEQ Ancilla_HandleThrowLogic

#_089A1F: LDA.w $02EC
#_089A22: BEQ Ancilla_HandleThrowLogic

#_089A24: LDY.w $0380,X
#_089A27: CPY.b #$03
#_089A29: BEQ Ancilla_HandleThrowLogic

#_089A2B: CPY.b #$00
#_089A2D: BNE .skip_lift_sfx

#_089A2F: LDA.w $03B1,X
#_089A32: CMP.b #$10
#_089A34: BNE .skip_lift_sfx

#_089A36: LDA.b #$1D ; SFX2.1D
#_089A38: JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.skip_lift_sfx
#_089A3B: DEC.w $03B1,X
#_089A3E: BPL Ancilla_LatchLinkCoordinates

#_089A40: INY
#_089A41: TYA
#_089A42: STA.w $0380,X

#_089A45: LDA.w AncillaCarry_timer,Y
#_089A48: STA.w $03B1,X

#_089A4B: CPY.b #$03
#_089A4D: BNE Ancilla_LatchLinkCoordinates

;---------------------------------------------------------------------------------------------------

Ancilla_LatchAltitudeAboveLink:
#_089A4F: LDA.b #$11
#_089A51: STA.w $029E,X

#_089A54: LDA.w $0BFA,X
#_089A57: CLC
#_089A58: ADC.b #$11
#_089A5A: STA.w $0BFA,X

#_089A5D: LDA.w $0C0E,X
#_089A60: ADC.b #$00
#_089A62: STA.w $0C0E,X

#_089A65: STZ.w $0280,X

#_089A68: BRA EXIT_089A94

;===================================================================================================

Ancilla_LatchLinkCoordinates:
#_089A6A: TYA
#_089A6B: ASL A
#_089A6C: ASL A
#_089A6D: ASL A
#_089A6E: CLC
#_089A6F: ADC.b $2F
#_089A71: TAY

#_089A72: LDA.b $20
#_089A74: CLC
#_089A75: ADC.w AncillaCarry_offset_y+0,Y
#_089A78: STA.w $0BFA,X

#_089A7B: LDA.b $21
#_089A7D: ADC.w AncillaCarry_offset_y+1,Y
#_089A80: STA.w $0C0E,X

#_089A83: LDA.b $22
#_089A85: CLC
#_089A86: ADC.w AncillaCarry_offset_x+0,Y
#_089A89: STA.w $0C04,X

#_089A8C: LDA.b $23
#_089A8E: ADC.w AncillaCarry_offset_x+1,Y
#_089A91: STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#EXIT_089A94:
#_089A94: RTS

;===================================================================================================

Ancilla_HandleThrowLogic:
#_089A95: LDA.w $0380,X
#_089A98: CMP.b #$03
#_089A9A: BNE EXIT_089A94

#_089A9C: LDA.w $0309
#_089A9F: CMP.b #$02
#_089AA1: BEQ AncillaCarry_HandleThrow

#_089AA3: LDA.b $11
#_089AA5: BNE .cant_throw

#_089AA7: LDA.b $F6
#_089AA9: ORA.b $F4
#_089AAB: AND.b #$80
#_089AAD: BNE AncillaCarry_HandleThrow

.cant_throw
#_089AAF: BRL AncillaCarry_HandleFalling

;===================================================================================================

AncillaCarry_HandleThrow:
#_089AB2: LDA.b $2F
#_089AB4: LSR A
#_089AB5: STA.w $0C72,X

#_089AB8: TAY

#_089AB9: LDA.b #$18
#_089ABB: STA.w $0294,X

#_089ABE: LDA.w AncillaCarry_throw_speed_y,Y
#_089AC1: STA.w $0C22,X

#_089AC4: LDA.w AncillaCarry_throw_speed_x,Y
#_089AC7: STA.w $0C2C,X

#_089ACA: LDA.b #$02
#_089ACC: STA.w $0309

#_089ACF: DEC A
#_089AD0: STA.w $0385,X

#_089AD3: STZ.w $02EC

#_089AD6: STZ.w $0BF0,X
#_089AD9: STZ.w $0380,X
#_089ADC: STZ.w $0280,X

#_089ADF: LDA.b #$13 ; SFX3.13
#_089AE1: JSR Ancilla_SFX3_Pan

;===================================================================================================

AncillaCarry_Airborne:
#_089AE4: LDA.w $0C5E,X
#_089AE7: BEQ .continue

#_089AE9: RTS

.continue
#_089AEA: LDA.w $0294,X
#_089AED: SEC
#_089AEE: SBC.b #$02
#_089AF0: STA.w $0294,X

#_089AF3: JSR Ancilla_Move_Y
#_089AF6: JSR Ancilla_Move_X

#_089AF9: LDA.w $029E,X
#_089AFC: STA.b $00

#_089AFE: JSR Ancilla_Move_Z

#_089B01: LDA.w $0BF0,X
#_089B04: BEQ .dont_adjust_altitude

#_089B06: LDA.w $0C72,X
#_089B09: CMP.b #$01
#_089B0B: BNE .dont_adjust_altitude

#_089B0D: LDA.w $0BFA,X
#_089B10: STA.b $0C

#_089B12: LDA.w $0C0E,X
#_089B15: STA.b $0D

#_089B17: LDA.w $029E,X
#_089B1A: BMI .dont_adjust_altitude

#_089B1C: SEC
#_089B1D: SBC.b $00
#_089B1F: STA.b $0E

#_089B21: REP #$20

#_089B23: LDA.b $0E
#_089B25: AND.w #$00FF
#_089B28: CMP.w #$0080
#_089B2B: BCC .y_is_positive

#_089B2D: ORA.w #$FF00

.y_is_positive
#_089B30: CLC
#_089B31: ADC.b $0C
#_089B33: STA.b $0C

#_089B35: SEP #$20

#_089B37: LDA.b $0C
#_089B39: STA.w $0BFA,X

#_089B3C: LDA.b $0D
#_089B3E: STA.w $0C0E,X

.dont_adjust_altitude
#_089B41: LDA.w $029E,X
#_089B44: CMP.b #$80
#_089B46: BCS .negative_z

.exit_a
#_089B48: RTS

;---------------------------------------------------------------------------------------------------

.negative_z
#_089B49: CMP.b #$FF
#_089B4B: BCS .exit_a

#_089B4D: STZ.w $029E,X

#_089B50: LDA.b #$21 ; SFX2.21
#_089B52: JSR Ancilla_SFX2_Pan

#_089B55: INC.w $0385,X

#_089B58: LDA.w $0385,X
#_089B5B: CMP.b #$03
#_089B5D: BEQ .bounces_maxed

#_089B5F: SEC
#_089B60: SBC.b #$02

#_089B62: ASL A
#_089B63: ASL A

#_089B64: CLC
#_089B65: ADC.w $0C72,X
#_089B68: TAY

;---------------------------------------------------------------------------------------------------

#_089B69: LDY.b #$00

#_089B6B: LDA.w $0C22,X
#_089B6E: BPL .positive_y

#_089B70: LDY.b #$01

#_089B72: EOR.b #$FF
#_089B74: INC A

.positive_y
#_089B75: LSR A

#_089B76: CPY.b #$01
#_089B78: BNE .dont_invert_y

#_089B7A: EOR.b #$FF
#_089B7C: INC A

.dont_invert_y
#_089B7D: STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

#_089B80: LDY.b #$00

#_089B82: LDA.w $0C2C,X
#_089B85: BPL .positive_x

#_089B87: LDY.b #$01

#_089B89: EOR.b #$FF
#_089B8B: INC A

.positive_x
#_089B8C: LSR A
#_089B8D: CPY.b #$01
#_089B8F: BNE .dont_invert_x

#_089B91: EOR.b #$FF
#_089B93: INC A

.dont_invert_x
#_089B94: STA.w $0C2C,X

#_089B97: LDA.w AncillaCarry_bounce_z,Y
#_089B9A: STA.w $0294,X

#_089B9D: LDA.w $0BF0,X
#_089BA0: BEQ .exit_b

#_089BA2: STZ.w $0BF0,X

#_089BA5: RTS

;---------------------------------------------------------------------------------------------------

.bounces_maxed
#_089BA6: STZ.w $029E,X
#_089BA9: STZ.w $0385,X
#_089BAC: STZ.w $0BF0,X

#_089BAF: STZ.b $5E

#_089BB1: STZ.w $0C22,X
#_089BB4: STZ.w $0C2C,X
#_089BB7: STZ.w $0294,X

#_089BBA: LDA.w $03D5,X
#_089BBD: BEQ .exit_b

#_089BBF: STA.w $0C7C,X

#_089BC2: STZ.w $03D5,X

.exit_b
#_089BC5: RTS

;===================================================================================================

AncillaCarry_HandleFalling:
#_089BC6: LDA.w $0C5E,X
#_089BC9: BNE EXIT_089C3D

#_089BCB: LDA.b $5B
#_089BCD: CMP.b #$02
#_089BCF: BCC .continue

#_089BD1: STZ.b $5E

#_089BD3: TXA
#_089BD4: INC A

#_089BD5: CMP.w $02EC
#_089BD8: BNE .exit

#_089BDA: STZ.w $02EC

#_089BDD: STZ.w $0C4A,X

.exit
#_089BE0: RTS

.continue
#_089BE1: LDA.w $0345
#_089BE4: ORA.w $02E0
#_089BE7: BEQ Ancilla_LatchCarriedPosition

#_089BE9: STZ.w $0308

#_089BEC: BRL AncillaCarry_HandleThrow

;===================================================================================================

Ancilla_LatchCarriedPosition:
#_089BEF: LDA.b $2E
#_089BF1: ASL A
#_089BF2: TAY

#_089BF3: LDA.b #$0C
#_089BF5: STA.b $5E

#_089BF7: LDA.b $EE
#_089BF9: STA.w $0C7C,X

#_089BFC: LDA.w $0476
#_089BFF: STA.w $03CA,X

#_089C02: REP #$20

#_089C04: LDA.b $24
#_089C06: CMP.w #$FFFF
#_089C09: BNE .positive

#_089C0B: LDA.w #$0000

.positive
#_089C0E: EOR.w #$FFFF
#_089C11: INC A

#_089C12: CLC
#_089C13: ADC.b $20

#_089C15: CLC
#_089C16: ADC.w AncillaCarry_offset_z,Y

#_089C19: CLC
#_089C1A: ADC.w #$0012
#_089C1D: STA.b $00

;---------------------------------------------------------------------------------------------------

#_089C1F: LDA.b $22
#_089C21: CLC
#_089C22: ADC.w #$0008
#_089C25: STA.b $02

#_089C27: SEP #$20

#_089C29: LDA.b $00
#_089C2B: STA.w $0BFA,X

#_089C2E: LDA.b $01
#_089C30: STA.w $0C0E,X

#_089C33: LDA.b $02
#_089C35: STA.w $0C04,X

#_089C38: LDA.b $03
#_089C3A: STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#EXIT_089C3D:
#_089C3D: RTS

;---------------------------------------------------------------------------------------------------

.handle_altitude
#_089C3E: LDA.w $0C5E,X
#_089C41: BNE EXIT_089C3D

#_089C43: LDA.w $0380,X
#_089C46: CMP.b #$03
#_089C48: BNE .restore_lift

#_089C4A: LDA.w $0294,X
#_089C4D: SEC
#_089C4E: SBC.b #$02
#_089C50: STA.w $0294,X

#_089C53: JSR Ancilla_Move_Z

#_089C56: LDA.w $029E,X
#_089C59: BEQ .zero_zee

#_089C5B: CMP.b #$FC
#_089C5D: BCC .exit

;---------------------------------------------------------------------------------------------------

.zero_zee
#_089C5F: STZ.w $029E,X

#_089C62: INC.w $03EA,X

#_089C65: LDA.w $03EA,X
#_089C68: CMP.b #$03
#_089C6A: BEQ .bounces_maxed

#_089C6C: LDA.b #$18
#_089C6E: STA.w $0294,X

#_089C71: BRA .exit

.bounces_maxed
#_089C73: STZ.w $029E,X
#_089C76: STZ.w $0380,X

.restore_lift
#_089C79: STZ.w $03EA,X
#_089C7C: STZ.b $5E

.exit
#_089C7E: RTS

;===================================================================================================

Ancilla_LatchYCoordToZ:
#_089C7F: LDA.w $0BFA,X
#_089C82: STA.b $72

#_089C84: LDA.w $0C0E,X
#_089C87: STA.b $73

#_089C89: STZ.b $0D
#_089C8B: STZ.b $0C

#_089C8D: LDA.w $0C72,X
#_089C90: ASL A
#_089C91: TAY

#_089C92: CMP.b #$02
#_089C94: BNE .continue

#_089C96: LDA.w $029E,X
#_089C99: STA.b $0C
#_089C9B: BPL .continue

#_089C9D: LDA.b #$FF
#_089C9F: STA.b $0D

;---------------------------------------------------------------------------------------------------

.continue
#_089CA1: REP #$20

#_089CA3: LDA.b $0C
#_089CA5: CMP.w #$FFFF
#_089CA8: BNE .not_ground_impact

#_089CAA: LDA.w #$0000

.not_ground_impact
#_089CAD: EOR.w #$FFFF
#_089CB0: INC A
#_089CB1: CLC
#_089CB2: ADC.b $72
#_089CB4: STA.b $0E

#_089CB6: SEP #$20

#_089CB8: LDA.b $0E
#_089CBA: STA.w $0BFA,X

#_089CBD: LDA.b $0F
#_089CBF: STA.w $0C0E,X

#_089CC2: RTS

;===================================================================================================

Ancilla_SetYFrom_DP72:
#_089CC3: LDA.b $73
#_089CC5: STA.w $0C0E,X

#_089CC8: LDA.b $72
#_089CCA: STA.w $0BFA,X

#_089CCD: RTS

;===================================================================================================

Bomb_GetDisplacementFromLink:
#_089CCE: LDA.w $0C04,X
#_089CD1: STA.b $06

#_089CD3: LDA.w $0C18,X
#_089CD6: STA.b $07

#_089CD8: LDA.w $0BFA,X
#_089CDB: STA.b $04

#_089CDD: LDA.w $0C0E,X
#_089CE0: STA.b $05

;---------------------------------------------------------------------------------------------------

#_089CE2: REP #$20

#_089CE4: LDA.b $22
#_089CE6: CLC
#_089CE7: ADC.w #$0008

#_089CEA: SEC
#_089CEB: SBC.b $06
#_089CED: BPL .positive_x

#_089CEF: EOR.w #$FFFF
#_089CF2: INC A

.positive_x
#_089CF3: STA.b $0A

#_089CF5: LDA.b $20

;---------------------------------------------------------------------------------------------------

#_089CF7: CLC
#_089CF8: ADC.w #$000C

#_089CFB: SEC
#_089CFC: SBC.b $04
#_089CFE: BPL .positive_y

#_089D00: EOR.w #$FFFF
#_089D03: INC A

.positive_y
#_089D04: CLC
#_089D05: ADC.b $0A
#_089D07: AND.w #$00FC
#_089D0A: LSR A
#_089D0B: LSR A
#_089D0C: TAY

#_089D0D: SEP #$20

#_089D0F: RTS

;===================================================================================================

BombDraw:

.char_and_prop
#_089D10: db $6E, $26
#_089D12: db $FF, $FF
#_089D14: db $FF, $FF
#_089D16: db $FF, $FF
#_089D18: db $FF, $FF
#_089D1A: db $FF, $FF

#_089D1C: db $8C, $22
#_089D1E: db $8C, $62
#_089D20: db $8C, $A2
#_089D22: db $8C, $E2
#_089D24: db $FF, $FF
#_089D26: db $FF, $FF

#_089D28: db $84, $22
#_089D2A: db $84, $62
#_089D2C: db $84, $A2
#_089D2E: db $84, $E2
#_089D30: db $FF, $FF
#_089D32: db $FF, $FF

#_089D34: db $88, $22
#_089D36: db $88, $62
#_089D38: db $88, $A2
#_089D3A: db $88, $E2
#_089D3C: db $FF, $FF
#_089D3E: db $FF, $FF

#_089D40: db $86, $22
#_089D42: db $88, $22
#_089D44: db $88, $62
#_089D46: db $88, $A2
#_089D48: db $88, $E2
#_089D4A: db $FF, $FF

#_089D4C: db $86, $22
#_089D4E: db $86, $62
#_089D50: db $86, $E2
#_089D52: db $86, $E2
#_089D54: db $FF, $FF
#_089D56: db $FF, $FF

#_089D58: db $86, $E2
#_089D5A: db $86, $22
#_089D5C: db $86, $22
#_089D5E: db $86, $62
#_089D60: db $86, $A2
#_089D62: db $86, $A2

#_089D64: db $8A, $A2
#_089D66: db $8A, $62
#_089D68: db $8A, $22
#_089D6A: db $8A, $62
#_089D6C: db $8A, $62
#_089D6E: db $8A, $E2

#_089D70: db $9B, $22
#_089D72: db $9B, $A2
#_089D74: db $9B, $62
#_089D76: db $9B, $E2
#_089D78: db $9B, $A2
#_089D7A: db $9B, $22

;---------------------------------------------------------------------------------------------------

.offset
#_089D7C: dw  -8,  -8
#_089D80: dw   0,   0
#_089D84: dw   0,   0
#_089D88: dw   0,   0
#_089D8C: dw   0,   0
#_089D90: dw   0,   0

#_089D94: dw  -8,  -8
#_089D98: dw  -8,   0
#_089D9C: dw   0,  -8
#_089DA0: dw   0,   0
#_089DA4: dw   0,   0
#_089DA8: dw   0,   0

#_089DAC: dw -16, -16
#_089DB0: dw -16,   0
#_089DB4: dw   0, -16
#_089DB8: dw   0,   0
#_089DBC: dw   0,   0
#_089DC0: dw   0,   0

#_089DC4: dw -16, -16
#_089DC8: dw -16,   0
#_089DCC: dw   0, -16
#_089DD0: dw   0,   0
#_089DD4: dw   0,   0
#_089DD8: dw   0,   0

#_089DDC: dw  -8,  -8
#_089DE0: dw -21, -22
#_089DE4: dw -21,   8
#_089DE8: dw   9, -22
#_089DEC: dw   9,   8
#_089DF0: dw   0,   0

#_089DF4: dw  -6, -15
#_089DF8: dw   0,  -1
#_089DFC: dw -16,  -2
#_089E00: dw  -8,  -7
#_089E04: dw   0,   0
#_089E08: dw   0,   0

#_089E0C: dw  -9,  -4
#_089E10: dw -21,  -5
#_089E14: dw -12, -18
#_089E18: dw -11,   7
#_089E1C: dw   0, -15
#_089E20: dw   4,  -2

#_089E24: dw  -9,  -4
#_089E28: dw -22,  -5
#_089E2C: dw -13, -20
#_089E30: dw -11,   8
#_089E34: dw   1, -16
#_089E38: dw   5,  -2

#_089E3C: dw -20,   4
#_089E40: dw -12, -19
#_089E44: dw  -9,  16
#_089E48: dw  -5,  -2
#_089E4C: dw   2,  -9
#_089E50: dw  10,   6

;---------------------------------------------------------------------------------------------------

.oam_size
#_089E54: db $02
#_089E55: db $01
#_089E56: db $01
#_089E57: db $01
#_089E58: db $01
#_089E59: db $01

#_089E5A: db $00
#_089E5B: db $00
#_089E5C: db $00
#_089E5D: db $00
#_089E5E: db $01
#_089E5F: db $01

#_089E60: db $02
#_089E61: db $02
#_089E62: db $02
#_089E63: db $02
#_089E64: db $01
#_089E65: db $01

#_089E66: db $02
#_089E67: db $02
#_089E68: db $02
#_089E69: db $02
#_089E6A: db $01
#_089E6B: db $01

#_089E6C: db $02
#_089E6D: db $02
#_089E6E: db $02
#_089E6F: db $02
#_089E70: db $02
#_089E71: db $01

#_089E72: db $02
#_089E73: db $02
#_089E74: db $02
#_089E75: db $02
#_089E76: db $01
#_089E77: db $01

#_089E78: db $02
#_089E79: db $02
#_089E7A: db $02
#_089E7B: db $02
#_089E7C: db $02
#_089E7D: db $02

#_089E7E: db $02
#_089E7F: db $02
#_089E80: db $02
#_089E81: db $02
#_089E82: db $02
#_089E83: db $02

#_089E84: db $00
#_089E85: db $00
#_089E86: db $00
#_089E87: db $00
#_089E88: db $00
#_089E89: db $00

;---------------------------------------------------------------------------------------------------

.data_offset
#_089E8A: db $00
#_089E8B: db $06
#_089E8C: db $0C
#_089E8D: db $12
#_089E8E: db $18
#_089E8F: db $1E
#_089E90: db $24
#_089E91: db $2A
#_089E92: db $30

;---------------------------------------------------------------------------------------------------

.object_count
#_089E93: db $01
#_089E94: db $04
#_089E95: db $04
#_089E96: db $04
#_089E97: db $04
#_089E98: db $04
#_089E99: db $05
#_089E9A: db $04
#_089E9B: db $06
#_089E9C: db $06
#_089E9D: db $06

;===================================================================================================

AncillaDraw_Bomb:
#_089E9E: JSR Ancilla_PrepOAMCoord_adjusted

#_089EA1: REP #$20

#_089EA3: LDA.w $029E,X
#_089EA6: AND.w #$00FF
#_089EA9: CMP.w #$0080
#_089EAC: BCC .positive_z

#_089EAE: ORA.w #$FF00

;---------------------------------------------------------------------------------------------------

.positive_z
#_089EB1: STA.b $04
#_089EB3: BEQ .not_max_priority

#_089EB5: CMP.w #$FFFF
#_089EB8: BEQ .not_max_priority

#_089EBA: LDA.w $0380,X
#_089EBD: AND.w #$00FF
#_089EC0: CMP.w #$0003
#_089EC3: BEQ .not_max_priority

#_089EC5: LDA.w $0280,X
#_089EC8: AND.w #$00FF
#_089ECB: BEQ .not_max_priority

#_089ECD: LDA.w #$3000
#_089ED0: STA.b $64

;---------------------------------------------------------------------------------------------------

.not_max_priority
#_089ED2: LDA.w #$0000
#_089ED5: CLC
#_089ED6: ADC.b $04

#_089ED8: EOR.w #$FFFF
#_089EDB: INC A
#_089EDC: CLC
#_089EDD: ADC.b $00
#_089EDF: STA.b $00

#_089EE1: SEP #$20

#_089EE3: LDY.w $0C5E,X

#_089EE6: LDA.w Bomb_anim_step,Y
#_089EE9: TAY

#_089EEA: LDA.w BombDraw_data_offset,Y
#_089EED: ASL A
#_089EEE: TAY

#_089EEF: ASL A
#_089EF0: STA.b $04

#_089EF2: STZ.b $05
#_089EF4: STZ.b $0A

#_089EF6: LDA.b #$02
#_089EF8: STA.b $0B

;---------------------------------------------------------------------------------------------------

#_089EFA: LDA.w $0C5E,X
#_089EFD: BNE .dont_flash

#_089EFF: LDA.b #$04
#_089F01: STA.b $0B

#_089F03: LDA.w $039F,X
#_089F06: CMP.b #$20
#_089F08: BCS .dont_flash

#_089F0A: AND.b #$0E
#_089F0C: STA.b $0B

;---------------------------------------------------------------------------------------------------

.dont_flash
#_089F0E: PHX
#_089F0F: PHY

#_089F10: LDA.w $0C5E,X
#_089F13: STA.b $08
#_089F15: BNE .continue

#_089F17: LDA.w $0385,X
#_089F1A: BNE .not_deferred

#_089F1C: LDA.w $0E20
#_089F1F: CMP.b #$92 ; SPRITE 92
#_089F21: BEQ .outmaneuver_this

#_089F23: TXY
#_089F24: INY
#_089F25: CPY.w $02EC
#_089F28: BNE .not_deferred

;---------------------------------------------------------------------------------------------------

.outmaneuver_this
#_089F2A: LDA.w $0308
#_089F2D: AND.b #$80
#_089F2F: BEQ .not_carried

#_089F31: LDA.w $0380,X
#_089F34: CMP.b #$03
#_089F36: BEQ .not_deferred

#_089F38: LDA.b $2F
#_089F3A: BNE .not_deferred

.not_carried
#_089F3C: LDA.b #$0C
#_089F3E: JSR Ancilla_AllocateOAMFromRegion_B_or_E

#_089F41: BRA .continue

;---------------------------------------------------------------------------------------------------

.not_deferred
#_089F43: LDA.w $0FB3
#_089F46: BEQ .continue

#_089F48: LDA.w $0C7C,X
#_089F4B: BEQ .continue

#_089F4D: LDA.w $0385,X
#_089F50: BNE .hardcode_slot

#_089F52: TXY
#_089F53: INY
#_089F54: CPY.w $02EC
#_089F57: BNE .continue

#_089F59: LDA.w $0308
#_089F5C: BPL .continue

;---------------------------------------------------------------------------------------------------

.hardcode_slot
#_089F5E: REP #$20

#_089F60: LDA.w #$00D0
#_089F63: CLC
#_089F64: ADC.w #$0800
#_089F67: STA.b $90

#_089F69: LDA.w #$0034
#_089F6C: CLC
#_089F6D: ADC.w #$0A20
#_089F70: STA.b $92

#_089F72: SEP #$20

;---------------------------------------------------------------------------------------------------

.continue
#_089F74: LDY.b $08

#_089F76: LDA.w BombDraw_object_count,Y
#_089F79: STA.b $08

#_089F7B: CPY.b #$00
#_089F7D: BNE .zero_objects

#_089F7F: LDA.w $03E4,X
#_089F82: CMP.b #$09 ; TILETYPE 09
#_089F84: BEQ .am_on_shallow_water

#_089F86: CMP.b #$40
#_089F88: BNE .zero_objects

.am_on_shallow_water
#_089F8A: LDY.b #$08
#_089F8C: BRA .this_many

.zero_objects
#_089F8E: LDY.b #$00

.this_many
#_089F90: LDA.b $00
#_089F92: STA.b $0C

#_089F94: LDA.b $01
#_089F96: STA.b $0D

#_089F98: LDA.b $02
#_089F9A: STA.b $0E

#_089F9C: LDA.b $03
#_089F9E: STA.b $0F

#_089FA0: STZ.b $06

#_089FA2: PLX

#_089FA3: JSR AncillaDraw_Explosion

#_089FA6: PLX

#_089FA7: JSL AncillaDraw_BombExtraStuff
#_089FAB: BCS .exit

#_089FAD: LDX.b $0A
#_089FAF: JSR AncillaDraw_Shadow

#_089FB2: LDX.w $0FA0

.exit
#_089FB5: RTS

;===================================================================================================

Ancilla08_DoorDebris:
#_089FB6: JSR AncillaDraw_DoorDebris

#_089FB9: DEC.w $03C0,X
#_089FBC: BPL .exit

#_089FBE: LDA.b #$07
#_089FC0: STA.w $03C0,X

#_089FC3: INC.w $03C2,X

#_089FC6: LDA.w $03C2,X
#_089FC9: CMP.b #$04
#_089FCB: BNE .exit

#_089FCD: STZ.w $0C4A,X

.exit
#_089FD0: RTS

;===================================================================================================

pool AncillaDraw_DoorDebris

.offset
#_089FD1: dw   4,   7
#_089FD5: dw   3,  17

#_089FD9: dw   8,   8
#_089FDD: dw   7,  17

#_089FE1: dw  11,   7
#_089FE5: dw  10,  16

#_089FE9: dw  16,   7
#_089FED: dw  17,  17

#_089FF1: dw  20,   7
#_089FF5: dw  21,  17

#_089FF9: dw  16,   8
#_089FFD: dw  17,  17

#_08A001: dw  13,   7
#_08A005: dw  14,  16

#_08A009: dw   8,   7
#_08A00D: dw   7,  17

#_08A011: dw   7,   4
#_08A015: dw  17,   3

#_08A019: dw   8,   8
#_08A01D: dw  17,   7

#_08A021: dw   7,  11
#_08A025: dw  16,  10

#_08A029: dw   7,  16
#_08A02D: dw  17,  17

#_08A031: dw   7,  20
#_08A035: dw  17,  21

#_08A039: dw   8,  16
#_08A03D: dw  17,  17

#_08A041: dw   7,  13
#_08A045: dw  16,  14

#_08A049: dw   7,   8
#_08A04D: dw  17,   7

;---------------------------------------------------------------------------------------------------

.char_and_prop
#_08A051: db $5E, $20
#_08A053: db $5E, $E0

#_08A055: db $5E, $A0
#_08A057: db $5E, $60

#_08A059: db $4F, $20
#_08A05B: db $4F, $20

#_08A05D: db $4F, $20
#_08A05F: db $4F, $20

#_08A061: db $5E, $60
#_08A063: db $5E, $60

#_08A065: db $5E, $20
#_08A067: db $5E, $E0

#_08A069: db $4F, $60
#_08A06B: db $4F, $60

#_08A06D: db $4F, $60
#_08A06F: db $4F, $60

#_08A071: db $5E, $20
#_08A073: db $5E, $E0

#_08A075: db $5E, $A0
#_08A077: db $5E, $60

#_08A079: db $4F, $20
#_08A07B: db $4F, $E0

#_08A07D: db $4F, $20
#_08A07F: db $4F, $20

#_08A081: db $5E, $60
#_08A083: db $5E, $60

#_08A085: db $5E, $20
#_08A087: db $5E, $E0

#_08A089: db $4F, $60
#_08A08B: db $4F, $60

#_08A08D: db $4F, $60
#_08A08F: db $4F, $60

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_DoorDebris:
#_08A091: JSR Ancilla_PrepOAMCoord_adjusted

#_08A094: TXA
#_08A095: ASL A
#_08A096: TAY

#_08A097: REP #$20

#_08A099: LDA.w $03BA,Y
#_08A09C: SEC
#_08A09D: SBC.b $E8
#_08A09F: STA.b $0C

#_08A0A1: LDA.w $03B6,Y
#_08A0A4: SEC
#_08A0A5: SBC.b $E2
#_08A0A7: STA.b $0E

#_08A0A9: SEP #$20

#_08A0AB: PHX

#_08A0AC: STZ.b $06

#_08A0AE: LDA.w $03C2,X
#_08A0B1: ASL A
#_08A0B2: ASL A
#_08A0B3: STA.b $04
#_08A0B5: STA.b $08

#_08A0B7: LDA.w $03BE,X
#_08A0BA: ASL A
#_08A0BB: ASL A
#_08A0BC: ASL A
#_08A0BD: ASL A
#_08A0BE: STA.b $0A

#_08A0C0: CLC
#_08A0C1: ADC.b $04
#_08A0C3: TAX

;---------------------------------------------------------------------------------------------------

#_08A0C4: LDY.b #$00

.next_object
#_08A0C6: PHX

#_08A0C7: LDA.b $0A
#_08A0C9: ASL A
#_08A0CA: STA.b $04

#_08A0CC: LDA.b $08
#_08A0CE: ASL A
#_08A0CF: CLC
#_08A0D0: ADC.b $04
#_08A0D2: STA.b $04

#_08A0D4: LDA.b $06
#_08A0D6: ASL A
#_08A0D7: ASL A
#_08A0D8: CLC
#_08A0D9: ADC.b $04
#_08A0DB: TAX

#_08A0DC: REP #$20

#_08A0DE: LDA.w .offset+0,X
#_08A0E1: CLC
#_08A0E2: ADC.b $0C
#_08A0E4: STA.b $00

#_08A0E6: LDA.w .offset+2,X
#_08A0E9: CLC
#_08A0EA: ADC.b $0E
#_08A0EC: STA.b $02

#_08A0EE: SEP #$20

#_08A0F0: PLX

#_08A0F1: JSR Ancilla_SetOAM_XY

#_08A0F4: LDA.w .char_and_prop+0,X
#_08A0F7: STA.b ($90),Y

#_08A0F9: INY

#_08A0FA: LDA.w .char_and_prop+1,X
#_08A0FD: AND.b #$C0
#_08A0FF: ORA.b $65
#_08A101: STA.b ($90),Y

#_08A103: INY

#_08A104: PHY
#_08A105: TYA

#_08A106: SEC
#_08A107: SBC.b #$04

#_08A109: LSR A
#_08A10A: LSR A
#_08A10B: TAY

#_08A10C: LDA.b #$00
#_08A10E: STA.b ($92),Y

#_08A110: PLY
#_08A111: JSR Ancilla_AllocateOAMFromCustomRegion

#_08A114: INX
#_08A115: INX

#_08A116: LDA.b $06
#_08A118: INC A
#_08A119: STA.b $06

#_08A11B: CMP.b #$02
#_08A11D: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08A11F: PLX

#_08A120: RTS

;===================================================================================================

pool Ancilla09_Arrow

.offset_y
#_08A121: dw  -4,   2,   0,   0

.offset_x
#_08A129: dw   0,   0,  -4,   4

pool off

;---------------------------------------------------------------------------------------------------

Ancilla09_Arrow:
#_08A131: LDA.b $11
#_08A133: BEQ .good_submode

#_08A135: BRL .proceed_to_draw

.good_submode
#_08A138: DEC.w $0C5E,X

#_08A13B: LDA.w $0C5E,X
#_08A13E: BMI .timer_done

#_08A140: CMP.b #$04
#_08A142: BCC .start_moving

#_08A144: BRL .exit

;---------------------------------------------------------------------------------------------------

.timer_done
#_08A147: LDA.b #$FF
#_08A149: STA.w $0C5E,X

.start_moving
#_08A14C: JSR Ancilla_Move_Y
#_08A14F: JSR Ancilla_Move_X

#_08A152: LDA.l $7EF340
#_08A156: AND.b #$04
#_08A158: BEQ .no_sparkle

#_08A15A: LDA.b $1A
#_08A15C: AND.b #$01
#_08A15E: BNE .no_sparkle

#_08A160: PHX

#_08A161: JSL AncillaAdd_SilverArrowSparkle

#_08A165: PLX

.no_sparkle
#_08A166: LDA.b #$FF
#_08A168: STA.w $03A9,X

#_08A16B: JSR Ancilla_CheckSpriteCollision
#_08A16E: BCS .sprite_collision

#_08A170: JSR Ancilla_CheckTileCollision
#_08A173: BCS .tile_collision

#_08A175: BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.tile_collision
#_08A178: TYA
#_08A179: STA.w $03C5,X

#_08A17C: LDA.w $0C72,X
#_08A17F: AND.b #$03
#_08A181: ASL A
#_08A182: TAY

#_08A183: LDA.w .offset_y+0,Y
#_08A186: CLC
#_08A187: ADC.w $0BFA,X
#_08A18A: STA.w $0BFA,X

#_08A18D: LDA.w .offset_y+1,Y
#_08A190: ADC.w $0C0E,X
#_08A193: STA.w $0C0E,X

#_08A196: LDA.w .offset_x+0,Y
#_08A199: CLC
#_08A19A: ADC.w $0C04,X
#_08A19D: STA.w $0C04,X

#_08A1A0: LDA.w .offset_x+1,Y
#_08A1A3: ADC.w $0C18,X
#_08A1A6: STA.w $0C18,X

#_08A1A9: STZ.w $0B88

#_08A1AC: BRA .become_stopped

;---------------------------------------------------------------------------------------------------

.sprite_collision
#_08A1AE: LDA.w $0C04,X
#_08A1B1: SEC
#_08A1B2: SBC.w $0D10,Y
#_08A1B5: STA.w $0C2C,X

#_08A1B8: LDA.w $0BFA,X
#_08A1BB: SEC
#_08A1BC: SBC.w $0D00,Y
#_08A1BF: CLC
#_08A1C0: ADC.w $0F70,Y
#_08A1C3: STA.w $0C22,X

#_08A1C6: TYA
#_08A1C7: STA.w $03A9,X

#_08A1CA: LDA.w $0E20,Y
#_08A1CD: CMP.b #$65 ; SPRITE 65
#_08A1CF: BNE .not_arrow_game

#_08A1D1: LDA.w $0D90,Y
#_08A1D4: CMP.b #$01
#_08A1D6: BNE .not_arrow_game_target

#_08A1D8: LDA.b #$2D ; SFX3.2D
#_08A1DA: STA.w $012F

#_08A1DD: LDA.b #$80
#_08A1DF: STA.w $0E10,Y
#_08A1E2: STA.w $0F10 ; !HARDCODED sprite slot

#_08A1E5: LDA.w $0B88
#_08A1E8: CMP.b #$09
#_08A1EA: BCS .the_99_dream

#_08A1EC: INC.w $0B88

.the_99_dream
#_08A1EF: LDA.w $0B88
#_08A1F2: STA.w $0DA0,Y

#_08A1F5: LDA.w $0ED0,Y
#_08A1F8: INC A
#_08A1F9: STA.w $0ED0,Y

#_08A1FC: BRA .become_stopped

;---------------------------------------------------------------------------------------------------

.not_arrow_game_target
#_08A1FE: LDA.b #$04
#_08A200: STA.w $0EE0,Y

.not_arrow_game
#_08A203: STZ.w $0B88

;---------------------------------------------------------------------------------------------------

.become_stopped
#_08A206: LDA.w $0E20,Y
#_08A209: CMP.b #$1B ; SPRITE 1B
#_08A20B: BEQ .not_enemy_arrow

#_08A20D: LDA.b #$08 ; SFX2.08
#_08A20F: JSR Ancilla_SFX2_Pan

.not_enemy_arrow
#_08A212: STZ.w $0C5E,X

#_08A215: LDA.b #$0A ; ANCILLA 0A
#_08A217: STA.w $0C4A,X

#_08A21A: LDA.b #$01
#_08A21C: STA.w $03B1,X

#_08A21F: LDA.w $03C5,X
#_08A222: BEQ .proceed_to_draw

#_08A224: REP #$20

#_08A226: LDA.b $E0
#_08A228: SEC
#_08A229: SBC.b $E2
#_08A22B: CLC
#_08A22C: ADC.w $0C04,X
#_08A22F: STA.b $00

#_08A231: LDA.b $E6
#_08A233: SEC
#_08A234: SBC.b $E8
#_08A236: CLC
#_08A237: ADC.w $0BFA,X
#_08A23A: STA.b $02

#_08A23C: SEP #$20

#_08A23E: LDA.b $00
#_08A240: STA.w $0C04,X

#_08A243: LDA.b $02
#_08A245: STA.w $0BFA,X

#_08A248: BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.exit
#_08A24A: RTS

.proceed_to_draw
#_08A24B: BRL AncillaDraw_Arrow

;===================================================================================================

pool AncillaDraw_Arrow

.char_and_prop
#_08A24E: db $2B, $A4
#_08A250: db $2A, $A4

#_08A252: db $2A, $24
#_08A254: db $2B, $24

#_08A256: db $3D, $64
#_08A258: db $3A, $64

#_08A25A: db $3A, $24
#_08A25C: db $3D, $24

#_08A25E: db $2B, $A4
#_08A260: db $FF, $FF

#_08A262: db $2B, $24
#_08A264: db $FF, $FF

#_08A266: db $3D, $64
#_08A268: db $FF, $FF

#_08A26A: db $3D, $24
#_08A26C: db $FF, $FF

#_08A26E: db $3C, $A4
#_08A270: db $2C, $A4

#_08A272: db $3C, $A4
#_08A274: db $2A, $A4

#_08A276: db $3C, $A4
#_08A278: db $2C, $E4

#_08A27A: db $3C, $A4
#_08A27C: db $2A, $A4

#_08A27E: db $2C, $24
#_08A280: db $3C, $24

#_08A282: db $2A, $24
#_08A284: db $3C, $24

#_08A286: db $2C, $64
#_08A288: db $3C, $24

#_08A28A: db $2A, $24
#_08A28C: db $3C, $24

#_08A28E: db $3B, $64
#_08A290: db $2D, $64

#_08A292: db $3B, $64
#_08A294: db $3A, $E4

#_08A296: db $3B, $64
#_08A298: db $2D, $E4

#_08A29A: db $3B, $64
#_08A29C: db $3A, $E4

#_08A29E: db $2D, $24
#_08A2A0: db $3B, $24

#_08A2A2: db $3A, $24
#_08A2A4: db $3B, $A4

#_08A2A6: db $2D, $A4
#_08A2A8: db $3B, $24

#_08A2AA: db $3A, $24
#_08A2AC: db $3B, $A4

;---------------------------------------------------------------------------------------------------

.offset
#_08A2AE: dw   0,   0
#_08A2B2: dw   8,   0

#_08A2B6: dw   0,   0
#_08A2BA: dw   8,   0

#_08A2BE: dw   0,   0
#_08A2C2: dw   0,   8

#_08A2C6: dw   0,   0
#_08A2CA: dw   0,   8

#_08A2CE: dw   0,   0
#_08A2D2: dw   0,   0

#_08A2D6: dw   0,   0
#_08A2DA: dw   0,   0

#_08A2DE: dw   0,   0
#_08A2E2: dw   0,   0

#_08A2E6: dw   0,   0
#_08A2EA: dw   0,   0

#_08A2EE: dw   0,   1
#_08A2F2: dw   8,   1

#_08A2F6: dw   0,   0
#_08A2FA: dw   8,   0

#_08A2FE: dw   0,  -1
#_08A302: dw   8,  -2

#_08A306: dw   0,   0
#_08A30A: dw   8,   0

#_08A30E: dw   0,   1
#_08A312: dw   8,   1

#_08A316: dw   0,   0
#_08A31A: dw   8,   0

#_08A31E: dw   0,  -2
#_08A322: dw   8,  -1

#_08A326: dw   0,   0
#_08A32A: dw   8,   0

#_08A32E: dw  -1,   0
#_08A332: dw  -1,   8

#_08A336: dw   0,   0
#_08A33A: dw   0,   8

#_08A33E: dw   0,   0
#_08A342: dw   1,   8

#_08A346: dw   0,   0
#_08A34A: dw   0,   8

#_08A34E: dw  -1,   0
#_08A352: dw  -1,   8

#_08A356: dw   0,   0
#_08A35A: dw   0,   8

#_08A35E: dw   1,   0
#_08A362: dw   0,   8

#_08A366: dw   0,   0
#_08A36A: dw   0,   8

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_Arrow:
#_08A36E: JSR Ancilla_PrepOAMCoord_adjusted

#_08A371: LDA.w $0280,X
#_08A374: BEQ .normal_priority

#_08A376: LDA.b #$30
#_08A378: STA.b $65

.normal_priority
#_08A37A: REP #$20

#_08A37C: LDA.b $00
#_08A37E: STA.b $0C

#_08A380: LDA.b $02
#_08A382: STA.b $0E
#_08A384: STA.b $04

#_08A386: LDA.w $03C5,X
#_08A389: AND.w #$00FF
#_08A38C: BEQ .regular_collision

;---------------------------------------------------------------------------------------------------

#_08A38E: LDA.b $E8
#_08A390: SEC
#_08A391: SBC.b $E6
#_08A393: CLC
#_08A394: ADC.b $0C
#_08A396: STA.b $0C

#_08A398: LDA.b $E2
#_08A39A: SEC
#_08A39B: SBC.b $E0
#_08A39D: CLC
#_08A39E: ADC.b $0E
#_08A3A0: STA.b $0E
#_08A3A2: STA.b $04

;---------------------------------------------------------------------------------------------------

.regular_collision
#_08A3A4: SEP #$20

#_08A3A6: LDA.w $0C5E,X
#_08A3A9: STA.b $07

#_08A3AB: LDA.w $0C72,X
#_08A3AE: AND.b #$FB
#_08A3B0: TAY

#_08A3B1: LDA.w $0C4A,X
#_08A3B4: CMP.b #$0A ; ANCILLA 0A
#_08A3B6: BNE .not_halted

#_08A3B8: LDA.w $0C5E,X
#_08A3BB: AND.b #$08
#_08A3BD: BEQ .wiggle

#_08A3BF: LDA.b #$01
#_08A3C1: BRA .continue

.wiggle
#_08A3C3: LDA.w $0C5E,X
#_08A3C6: AND.b #$03

;---------------------------------------------------------------------------------------------------

.continue
#_08A3C8: STA.b $0A

#_08A3CA: TYA
#_08A3CB: ASL A
#_08A3CC: ASL A
#_08A3CD: CLC
#_08A3CE: ADC.b #$08
#_08A3D0: CLC
#_08A3D1: ADC.b $0A
#_08A3D3: TAY

#_08A3D4: BRA .get_palette

;---------------------------------------------------------------------------------------------------

.not_halted
#_08A3D6: LDA.w $0C5E,X
#_08A3D9: BMI .get_palette

#_08A3DB: TYA
#_08A3DC: ORA.b #$04
#_08A3DE: TAY

;---------------------------------------------------------------------------------------------------

.get_palette
#_08A3DF: PHX

#_08A3E0: TYA
#_08A3E1: ASL A
#_08A3E2: ASL A
#_08A3E3: TAX

#_08A3E4: LDY.b #$02
#_08A3E6: LDA.l $7EF340

#_08A3EA: AND.b #$04
#_08A3EC: BNE .silvers

#_08A3EE: LDY.b #$04

.silvers
#_08A3F0: STY.b $74

#_08A3F2: LDY.b #$00
#_08A3F4: STZ.b $06

;---------------------------------------------------------------------------------------------------

.next_object
#_08A3F6: LDA.w .char_and_prop+0,X
#_08A3F9: CMP.b #$FF
#_08A3FB: BEQ .skip

#_08A3FD: STA.b $72

#_08A3FF: PHX

#_08A400: TXA
#_08A401: ASL A
#_08A402: TAX

#_08A403: REP #$20

#_08A405: LDA.w .offset+0,X
#_08A408: CLC
#_08A409: ADC.b $0C
#_08A40B: STA.b $00

#_08A40D: LDA.w .offset+2,X
#_08A410: CLC
#_08A411: ADC.b $0E
#_08A413: STA.b $02

#_08A415: SEP #$20

#_08A417: JSR Ancilla_SetOAM_XY

#_08A41A: PLX

#_08A41B: LDA.b $72
#_08A41D: STA.b ($90),Y

#_08A41F: INY

#_08A420: LDA.w .char_and_prop+1,X
#_08A423: AND.b #$C1
#_08A425: ORA.b $74
#_08A427: ORA.b $65
#_08A429: STA.b ($90),Y

#_08A42B: INY

#_08A42C: PHY

#_08A42D: TYA
#_08A42E: SEC
#_08A42F: SBC.b #$04
#_08A431: LSR A
#_08A432: LSR A
#_08A433: TAY

#_08A434: LDA.b #$00
#_08A436: STA.b ($92),Y

#_08A438: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08A439: INX
#_08A43A: INX

#_08A43B: INC.b $06

#_08A43D: LDA.b $06
#_08A43F: CMP.b #$02
#_08A441: BEQ .done

;---------------------------------------------------------------------------------------------------

#_08A443: BRL .next_object

.done
#_08A446: PLX

#_08A447: LDY.b #$01

#_08A449: LDA.b ($90),Y
#_08A44B: CMP.b #$F0
#_08A44D: BNE .exit

#_08A44F: LDY.b #$05

#_08A451: LDA.b ($90),Y
#_08A453: CMP.b #$F0
#_08A455: BNE .exit

#_08A457: BRL Arrow_DeleteSelf

.exit
#_08A45A: RTS

;===================================================================================================

Ancilla0A_ArrowInTheWall:
#_08A45B: LDY.w $03A9,X
#_08A45E: BMI .not_sprite_collided

#_08A460: LDA.w $0DD0,Y
#_08A463: CMP.b #$09
#_08A465: BCC Arrow_DeleteSelf

#_08A467: LDA.w $0F70,Y
#_08A46A: BMI Arrow_DeleteSelf

#_08A46C: LDA.w $0BA0,Y
#_08A46F: BNE Arrow_DeleteSelf

#_08A471: LDA.w $0CAA,Y
#_08A474: AND.b #$02
#_08A476: BNE Arrow_DeleteSelf

;---------------------------------------------------------------------------------------------------

#_08A478: STZ.b $00

#_08A47A: LDA.w $0C2C,X
#_08A47D: BPL .positive_x

#_08A47F: DEC.b $00

.positive_x
#_08A481: CLC
#_08A482: ADC.w $0D10,Y
#_08A485: STA.w $0C04,X

#_08A488: LDA.w $0D30,Y
#_08A48B: ADC.b $00
#_08A48D: STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#_08A490: STZ.b $00

#_08A492: LDA.w $0C22,X
#_08A495: BPL .positive_y

#_08A497: DEC.b $00

.positive_y
#_08A499: CLC
#_08A49A: ADC.w $0D00,Y
#_08A49D: PHP

#_08A49E: SEC
#_08A49F: SBC.w $0F70,Y
#_08A4A2: STA.w $0BFA,X

#_08A4A5: LDA.w $0D20,Y
#_08A4A8: SBC.b #$00

#_08A4AA: PLP
#_08A4AB: ADC.b $00
#_08A4AD: STA.w $0C0E,X

;---------------------------------------------------------------------------------------------------

.not_sprite_collided
#_08A4B0: LDA.b $11
#_08A4B2: BEQ .continue

#_08A4B4: BRA .proceed_to_draw

.continue
#_08A4B6: DEC.w $03B1,X

#_08A4B9: LDA.w $03B1,X
#_08A4BC: BNE .proceed_to_draw

#_08A4BE: LDA.b #$02
#_08A4C0: STA.w $03B1,X

#_08A4C3: INC.w $0C5E,X

#_08A4C6: LDA.w $0C5E,X
#_08A4C9: CMP.b #$09
#_08A4CB: BEQ Arrow_DeleteSelf

#_08A4CD: AND.b #$08
#_08A4CF: BEQ .proceed_to_draw

#_08A4D1: LDA.b #$80
#_08A4D3: STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
#_08A4D6: JML AncillaDraw_Arrow

;===================================================================================================

Arrow_DeleteSelf:
#_08A4DA: BRL Ancilla_DeleteSelf

;===================================================================================================

Ancilla0B_IceRodShot:
#_08A4DD: LDA.b $11
#_08A4DF: BEQ .continue

#_08A4E1: BRA .generate_sparkle

.continue
#_08A4E3: DEC.w $03B1,X
#_08A4E6: BPL .delay_a

#_08A4E8: LDA.w $0C5E,X
#_08A4EB: INC A
#_08A4EC: STA.w $0C5E,X

#_08A4EF: AND.b #$FE
#_08A4F1: BEQ .delay_b

#_08A4F3: LDA.b #$01
#_08A4F5: STA.w $0C54,X

#_08A4F8: LDA.w $0C5E,X
#_08A4FB: AND.b #$07
#_08A4FD: ORA.b #$04
#_08A4FF: STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.delay_b
#_08A502: LDA.b #$03
#_08A504: STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.delay_a
#_08A507: LDA.w $0C54,X
#_08A50A: BEQ .generate_sparkle

#_08A50C: JSR Ancilla_BoundsCheck

#_08A50F: JSR Ancilla_Move_Y
#_08A512: JSR Ancilla_Move_X

#_08A515: JSR Ancilla_CheckSpriteCollision
#_08A518: BCS .sprite_collision

#_08A51A: JSR Ancilla_CheckTileCollision
#_08A51D: BCC .generate_sparkle

.sprite_collision
#_08A51F: LDA.b #$11 ; ANCILLA 11
#_08A521: STA.w $0C4A,X

#_08A524: TAY

#_08A525: LDA.w AncillaObjectAllocation,Y
#_08A528: STA.w $0C90,X

#_08A52B: STZ.w $0C5E,X

#_08A52E: LDA.b #$04
#_08A530: STA.w $03B1,X

.generate_sparkle
#_08A533: BRL AncillaAdd_IceRodSparkle

;===================================================================================================

Ancilla11_IceRodWallHit:
#_08A536: DEC.w $03B1,X
#_08A539: BPL .delay

#_08A53B: LDA.b #$07
#_08A53D: STA.w $03B1,X

#_08A540: INC.w $0C5E,X

#_08A543: LDA.w $0C5E,X
#_08A546: CMP.b #$02
#_08A548: BNE .delay

#_08A54A: STZ.w $0C4A,X

#_08A54D: RTS

.delay
#_08A54E: BRL AncillaDraw_IceRodWallHit

;===================================================================================================

pool AncillaDraw_IceRodWallHit

.char_and_prop
#_08A551: db $CF, $24
#_08A553: db $CF, $24
#_08A555: db $CF, $24
#_08A557: db $CF, $24

#_08A559: db $DF, $24
#_08A55B: db $DF, $24
#_08A55D: db $DF, $24
#_08A55F: db $DF, $24

.offset
#_08A561: db   0,   0
#_08A563: db   0,   8
#_08A565: db   8,   0
#_08A567: db   8,   8

#_08A569: db  -8,  -8
#_08A56B: db  -8,  16
#_08A56D: db  16,  -8
#_08A56F: db  16,  16

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_IceRodWallHit:
#_08A571: JSR Ancilla_PrepOAMCoord

#_08A574: PHX

#_08A575: LDA.w $0C90,X
#_08A578: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08A57B: LDA.w $0C5E,X
#_08A57E: ASL A
#_08A57F: ASL A
#_08A580: ASL A
#_08A581: TAX

;---------------------------------------------------------------------------------------------------

#_08A582: LDY.b #$00

#_08A584: STZ.b $04

.next_object
#_08A586: REP #$20

#_08A588: LDA.w .offset+0,X
#_08A58B: AND.w #$00FF
#_08A58E: CMP.w #$0080
#_08A591: BCC .x_positive

#_08A593: ORA.w #$FF00

.x_positive
#_08A596: CLC
#_08A597: ADC.b $00
#_08A599: STA.b $08

#_08A59B: LDA.w .offset+1,X
#_08A59E: AND.w #$00FF
#_08A5A1: CMP.w #$0080
#_08A5A4: BCC .y_positive

#_08A5A6: ORA.w #$FF00

.y_positive
#_08A5A9: CLC
#_08A5AA: ADC.b $02
#_08A5AC: STA.b $0A

;---------------------------------------------------------------------------------------------------

#_08A5AE: SEP #$20

#_08A5B0: PHX
#_08A5B1: LDX.b #$F0

#_08A5B3: LDA.b $09
#_08A5B5: BNE .off_screen

#_08A5B7: LDA.b $0B
#_08A5B9: BNE .off_screen

#_08A5BB: LDA.b $0A
#_08A5BD: STA.b ($90),Y

#_08A5BF: LDA.b $08
#_08A5C1: CMP.b #$F0
#_08A5C3: BCS .off_screen

#_08A5C5: TAX

.off_screen
#_08A5C6: INY

#_08A5C7: TXA
#_08A5C8: STA.b ($90),Y

#_08A5CA: INY

#_08A5CB: PLX
#_08A5CC: LDA.w .char_and_prop+0,X
#_08A5CF: STA.b ($90),Y

#_08A5D1: INY

#_08A5D2: LDA.w .char_and_prop+1,X
#_08A5D5: AND.b #$CF
#_08A5D7: ORA.b $65
#_08A5D9: STA.b ($90),Y

#_08A5DB: INY
#_08A5DC: PHY

#_08A5DD: TYA
#_08A5DE: SEC
#_08A5DF: SBC.b #$04
#_08A5E1: LSR A
#_08A5E2: LSR A
#_08A5E3: TAY

#_08A5E4: LDA.b #$00
#_08A5E6: STA.b ($92),Y

#_08A5E8: PLY

#_08A5E9: JSR Ancilla_AllocateOAMFromCustomRegion

#_08A5EC: INX
#_08A5ED: INX

#_08A5EE: INC.b $04

#_08A5F0: LDA.b $04
#_08A5F2: CMP.b #$04
#_08A5F4: BEQ .done

#_08A5F6: BRL .next_object

;---------------------------------------------------------------------------------------------------

.done
#_08A5F9: PLX

#_08A5FA: LDY.b #$01
#_08A5FC: LDA.b ($90),Y

#_08A5FE: CMP.b #$F0
#_08A600: BNE .exit

#_08A602: LDY.b #$05

#_08A604: LDA.b ($90),Y
#_08A606: CMP.b #$F0
#_08A608: BNE .exit

#_08A60A: STZ.w $0C4A,X

.exit
#_08A60D: RTS

;===================================================================================================

Ancilla33_BlastWallExplosion:
#_08A60E: LDA.b $11
#_08A610: BNE .proceed_to_draw

#_08A612: LDA.l $7F0000,X
#_08A616: BEQ .inactive_component

#_08A618: LDA.l $7F0008,X
#_08A61C: DEC A
#_08A61D: STA.l $7F0008,X
#_08A621: BNE .proceed_to_draw

#_08A623: LDA.l $7F0000,X
#_08A627: INC A
#_08A628: STA.l $7F0000,X
#_08A62C: BEQ .no_fireball

#_08A62E: CMP.b #$09
#_08A630: BCS .no_fireball

;---------------------------------------------------------------------------------------------------

#_08A632: PHX
#_08A633: TXA

#_08A634: ASL A
#_08A635: ASL A
#_08A636: STA.b $04

#_08A638: LDY.b #$0A
#_08A63A: LDA.b #$32 ; ANCILLA 32
#_08A63C: JSL AncillaAdd_BlastWallFireball

#_08A640: PLX

;---------------------------------------------------------------------------------------------------

.no_fireball
#_08A641: LDA.l $7F0000,X
#_08A645: CMP.b #$0B
#_08A647: BNE .dont_reset_state

#_08A649: LDA.b #$00
#_08A64B: STA.l $7F0000,X
#_08A64F: STA.l $7F0008,X

#_08A653: BRA .proceed_to_draw

.dont_reset_state
#_08A655: TAY

#_08A656: LDA.b #$03
#_08A658: STA.l $7F0008,X

.proceed_to_draw
#_08A65C: BRL AncillaDraw_BlastWallExplosion

;---------------------------------------------------------------------------------------------------

.inactive_component
#_08A65F: TXA
#_08A660: EOR.b #$01
#_08A662: TAX

#_08A663: LDA.l $7F0000,X
#_08A667: CMP.b #$06
#_08A669: BNE .proceed_to_draw

#_08A66B: LDA.l $7F0008,X
#_08A66F: CMP.b #$02
#_08A671: BNE .proceed_to_draw

#_08A673: LDX.w $0380

#_08A676: LDA.w $0C5E
#_08A679: INC A
#_08A67A: CMP.b #$07
#_08A67C: BCC .reset_inactive_component

#_08A67E: BRL AncillaDraw_BlastWallExplosion

;---------------------------------------------------------------------------------------------------

.reset_inactive_component
#_08A681: STA.w $0C5E

#_08A684: LDA.b #$01
#_08A686: STA.l $7F0000,X

#_08A68A: LDA.b #$03
#_08A68C: STA.l $7F0008,X

#_08A690: PHX

;---------------------------------------------------------------------------------------------------

#_08A691: LDA.b #$03
#_08A693: STA.b $06

.next_position
#_08A695: STZ.b $00
#_08A697: STZ.b $01
#_08A699: STZ.b $02
#_08A69B: STZ.b $03

#_08A69D: STX.b $04

#_08A69F: LDX.b #$00

#_08A6A1: LDA.l $7F001C
#_08A6A5: CMP.b #$04
#_08A6A7: BCS .diverge_v

#_08A6A9: LDX.b #$02

.diverge_v
#_08A6AB: LDA.b #$0D
#_08A6AD: STA.b $00,X

#_08A6AF: LDA.b $06
#_08A6B1: AND.b #$02
#_08A6B3: BEQ .dont_invert

#_08A6B5: LDA.b $00,X
#_08A6B7: EOR.b #$FF
#_08A6B9: INC A
#_08A6BA: STA.b $00,X

#_08A6BC: LDA.b #$FF
#_08A6BE: STA.b $01,X

.dont_invert
#_08A6C0: LDA.b $04
#_08A6C2: ASL A
#_08A6C3: ASL A
#_08A6C4: ASL A
#_08A6C5: STA.b $08

#_08A6C7: LDA.b $06
#_08A6C9: ASL A
#_08A6CA: CLC
#_08A6CB: ADC.b $08
#_08A6CD: TAX

#_08A6CE: REP #$20

#_08A6D0: LDA.l $7F0020,X
#_08A6D4: CLC
#_08A6D5: ADC.b $00
#_08A6D7: STA.l $7F0020,X

#_08A6DB: LDA.l $7F0030,X
#_08A6DF: CLC
#_08A6E0: ADC.b $02
#_08A6E2: STA.l $7F0030,X

#_08A6E6: SEC
#_08A6E7: SBC.b $E2
#_08A6E9: STA.b $72

#_08A6EB: SEP #$20

#_08A6ED: LDA.b $73
#_08A6EF: BNE .no_sfx

#_08A6F1: LDA.b $72
#_08A6F3: JSR Ancilla_SetPanRelativeCoordinates
#_08A6F6: ORA.b #$0C ; SFX2.0C
#_08A6F8: STA.w $012E

.no_sfx
#_08A6FB: LDX.b $04

#_08A6FD: DEC.b $06
#_08A6FF: BPL .next_position

#_08A701: PLX

;===================================================================================================

AncillaDraw_BlastWallExplosion:
#_08A702: LDX.w $0380

#_08A705: LDA.l $7F0000,X
#_08A709: BEQ .dont_draw

#_08A70B: LDY.b #$07

#_08A70D: CPX.b #$01
#_08A70F: BEQ .next_object

#_08A711: LDY.b #$03

.next_object
#_08A713: PHY
#_08A714: PHX

#_08A715: TYA
#_08A716: ASL A
#_08A717: TAX

#_08A718: REP #$20

#_08A71A: LDA.l $7F0020,X
#_08A71E: STA.b $00

#_08A720: LDA.l $7F0030,X
#_08A724: STA.b $02

#_08A726: SEP #$20

#_08A728: PLX
#_08A729: PLY

#_08A72A: JSR AncillaDraw_BlastWallBlast

#_08A72D: SEP #$20

#_08A72F: DEY
#_08A730: TYA
#_08A731: AND.b #$03
#_08A733: CMP.b #$03
#_08A735: BNE .next_object

;---------------------------------------------------------------------------------------------------

.dont_draw
#_08A737: LDA.w $0C5E
#_08A73A: CMP.b #$06
#_08A73C: BNE Ancilla_RestoreIndex

#_08A73E: LDX.b #$01

.next_check
#_08A740: LDA.l $7F0000,X
#_08A744: BNE Ancilla_RestoreIndex

#_08A746: DEX
#_08A747: BPL .next_check

#_08A749: STZ.w $0C4A
#_08A74C: STZ.w $0C4B

#_08A74F: STZ.w $0112

;===================================================================================================

Ancilla_RestoreIndex:
#_08A752: LDX.w $0FA0

#_08A755: RTS

;===================================================================================================

AncillaDraw_BlastWallBlast:
#_08A756: PHX
#_08A757: PHY

#_08A758: LDA.b #$30
#_08A75A: STA.b $65
#_08A75C: STZ.b $64

#_08A75E: LDA.l $7F0000,X
#_08A762: TAY

#_08A763: LDA.w BombDraw_object_count,Y
#_08A766: STA.b $08

#_08A768: LDA.w Bomb_anim_step,Y
#_08A76B: TAY

#_08A76C: LDA.w BombDraw_data_offset,Y
#_08A76F: ASL A
#_08A770: TAX

#_08A771: ASL A
#_08A772: STA.b $04
#_08A774: STZ.b $05

#_08A776: STZ.b $0A

#_08A778: LDA.b #$32
#_08A77A: STA.b $0B

#_08A77C: STZ.b $06
#_08A77E: STZ.b $07

#_08A780: LDA.b #$18

#_08A782: LDY.w $0FB3
#_08A785: BEQ .use_region_a

#_08A787: JSL SpriteDraw_AllocateOAMFromRegionD

#_08A78B: BRA .continue

.use_region_a
#_08A78D: JSL SpriteDraw_AllocateOAMFromRegionA

;---------------------------------------------------------------------------------------------------

.continue
#_08A791: REP #$20

#_08A793: LDA.b $00
#_08A795: SEC
#_08A796: SBC.b $E8
#_08A798: STA.b $0C

#_08A79A: LDA.b $02
#_08A79C: SEC
#_08A79D: SBC.b $E2
#_08A79F: STA.b $0E

#_08A7A1: SEP #$20

#_08A7A3: LDY.b #$00
#_08A7A5: JSR AncillaDraw_Explosion

#_08A7A8: PLY
#_08A7A9: PLX

#_08A7AA: RTS

;===================================================================================================

AncillaDraw_Explosion:
.next_object
#_08A7AB: LDA.w BombDraw_char_and_prop,X
#_08A7AE: CMP.b #$FF
#_08A7B0: BEQ .skip

#_08A7B2: STX.b $72

#_08A7B4: REP #$20

#_08A7B6: STZ.b $74

#_08A7B8: LDA.b $06
#_08A7BA: ASL A
#_08A7BB: ASL A
#_08A7BC: CLC
#_08A7BD: ADC.b $04
#_08A7BF: TAX

#_08A7C0: LDA.w BombDraw_offset+0,X
#_08A7C3: CLC
#_08A7C4: ADC.b $0C
#_08A7C6: STA.b $00

#_08A7C8: LDA.w BombDraw_offset+2,X
#_08A7CB: CLC
#_08A7CC: ADC.b $0E
#_08A7CE: STA.b $02

#_08A7D0: SEP #$20

#_08A7D2: LDX.b $72

#_08A7D4: JSR Ancilla_SetOAM_XY_safe

#_08A7D7: LDA.w BombDraw_char_and_prop+0,X
#_08A7DA: STA.b ($90),Y

#_08A7DC: INY

#_08A7DD: LDA.w BombDraw_char_and_prop+1,X
#_08A7E0: AND.b #$C1
#_08A7E2: ORA.b $65
#_08A7E4: ORA.b $0B
#_08A7E6: STA.b ($90),Y

#_08A7E8: INY
#_08A7E9: STY.b $72
#_08A7EB: STX.b $73

#_08A7ED: TYA
#_08A7EE: SEC
#_08A7EF: SBC.b #$04
#_08A7F1: LSR A
#_08A7F2: LSR A
#_08A7F3: TAY

#_08A7F4: TXA
#_08A7F5: LSR A
#_08A7F6: TAX

#_08A7F7: LDA.w BombDraw_oam_size,X
#_08A7FA: ORA.b $75

#_08A7FC: STA.b ($92),Y

#_08A7FE: LDX.b $73
#_08A800: LDY.b $72

;---------------------------------------------------------------------------------------------------

.skip
#_08A802: INX
#_08A803: INX

#_08A804: INC.b $06

#_08A806: LDA.b $06
#_08A808: CMP.b $08
#_08A80A: BNE .next_object

#_08A80C: RTS

;===================================================================================================

JumpSplash_char:
#_08A80D: db $AC, $AE

;---------------------------------------------------------------------------------------------------

Ancilla15_JumpSplash:
#_08A80F: LDA.b $11
#_08A811: BNE AncillaDraw_JumpSplash

#_08A813: DEC.w $03B1,X
#_08A816: BPL .delay

#_08A818: STZ.w $03B1,X

#_08A81B: LDA.b #$01
#_08A81D: STA.w $0C5E,X

.delay
#_08A820: LDA.w $0C5E,X
#_08A823: BEQ AncillaDraw_JumpSplash

#_08A825: LDA.w $0C22,X
#_08A828: CLC
#_08A829: ADC.b #$FC
#_08A82B: STA.w $0C22,X
#_08A82E: STA.w $0C2C,X

#_08A831: CMP.b #$E8
#_08A833: BCS .speed_not_maxed

#_08A835: STZ.w $0C4A,X

#_08A838: LDA.w $02E0
#_08A83B: BNE .am_bunny

#_08A83D: LDA.b $5D
#_08A83F: CMP.b #$04 ; LINKSTATE 04
#_08A841: BNE .exit

.am_bunny
#_08A843: LDA.w $0345
#_08A846: BEQ .exit

#_08A848: PHX
#_08A849: JSL CheckAbilityToSwim
#_08A84D: PLX

.exit
#_08A84E: RTS

;---------------------------------------------------------------------------------------------------

.speed_not_maxed
#_08A84F: JSR Ancilla_Move_Y
#_08A852: JSR Ancilla_Move_X

;===================================================================================================

AncillaDraw_JumpSplash:
#_08A855: JSR Ancilla_PrepOAMCoord

#_08A858: LDA.w $0C04,X
#_08A85B: STA.b $06

#_08A85D: LDA.w $0C18,X
#_08A860: STA.b $07

#_08A862: REP #$20

#_08A864: LDA.b $22
#_08A866: SEC
#_08A867: SBC.b $06
#_08A869: STA.b $08

#_08A86B: LDA.b $22
#_08A86D: CLC
#_08A86E: ADC.b $08
#_08A870: SEC
#_08A871: SBC.b $E2
#_08A873: STA.b $08

#_08A875: LDA.b $06
#_08A877: CLC
#_08A878: ADC.w #$000C
#_08A87B: SEC
#_08A87C: SBC.b $E2
#_08A87E: STA.b $06

;---------------------------------------------------------------------------------------------------

#_08A880: SEP #$20

#_08A882: PHX

#_08A883: LDA.w $0C5E,X
#_08A886: STA.b $0A

#_08A888: TAX

#_08A889: LDA.b #$01
#_08A88B: STA.b $72

#_08A88D: LDY.b #$00
#_08A88F: STY.b $0C

;---------------------------------------------------------------------------------------------------

.next_object
#_08A891: JSR Ancilla_SetOAM_XY

#_08A894: LDA.w JumpSplash_char,X
#_08A897: STA.b ($90),Y

#_08A899: INY

#_08A89A: LDA.b #$24
#_08A89C: ORA.b $0C
#_08A89E: STA.b ($90),Y

#_08A8A0: INY
#_08A8A1: PHY

#_08A8A2: TYA
#_08A8A3: SEC
#_08A8A4: SBC.b #$04
#_08A8A6: LSR A
#_08A8A7: LSR A
#_08A8A8: TAY

#_08A8A9: LDA.b #$02
#_08A8AB: STA.b ($92),Y

#_08A8AD: PLY

;---------------------------------------------------------------------------------------------------

#_08A8AE: JSR Ancilla_AllocateOAMFromCustomRegion

#_08A8B1: LDA.b $08
#_08A8B3: STA.b $02

#_08A8B5: LDA.b #$40
#_08A8B7: STA.b $0C

#_08A8B9: DEC.b $72
#_08A8BB: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08A8BD: LDA.b $06
#_08A8BF: STA.b $02

#_08A8C1: JSR Ancilla_SetOAM_XY

#_08A8C4: LDA.b #$C0
#_08A8C6: STA.b ($90),Y

#_08A8C8: INY
#_08A8C9: LDA.b #$24
#_08A8CB: STA.b ($90),Y

#_08A8CD: INY
#_08A8CE: TYA

#_08A8CF: SEC
#_08A8D0: SBC.b #$04

#_08A8D2: LSR A
#_08A8D3: LSR A
#_08A8D4: TAY

#_08A8D5: LDA.b #$02
#_08A8D7: STA.b ($92),Y

#_08A8D9: LDA.b $0A
#_08A8DB: CMP.b #$01
#_08A8DD: BNE .exit

#_08A8DF: STA.b ($92),Y

.exit
#_08A8E1: PLX

#_08A8E2: RTS

;===================================================================================================

HitStar_char:
#_08A8E3: db $90, $91

;---------------------------------------------------------------------------------------------------

Ancilla16_HitStars:
#_08A8E5: DEC.w $039F,X
#_08A8E8: BMI .continue

#_08A8EA: RTS

.continue
#_08A8EB: STZ.w $039F,X

#_08A8EE: LDA.b $11
#_08A8F0: BNE AncillaDraw_HitStars

#_08A8F2: DEC.w $03B1,X
#_08A8F5: BPL .delay

#_08A8F7: STZ.w $03B1,X

#_08A8FA: LDA.b #$01
#_08A8FC: STA.w $0C5E,X

.delay
#_08A8FF: LDA.w $0C5E,X
#_08A902: BEQ AncillaDraw_HitStars

#_08A904: LDA.w $0C22,X
#_08A907: CLC
#_08A908: ADC.b #$FC
#_08A90A: STA.w $0C22,X
#_08A90D: STA.w $0C2C,X

#_08A910: CMP.b #$E8
#_08A912: BCS .dont_die

#_08A914: STZ.w $0C4A,X

#_08A917: RTS

.dont_die
#_08A918: JSR Ancilla_Move_Y
#_08A91B: JSR Ancilla_Move_X

;===================================================================================================

AncillaDraw_HitStars:
#_08A91E: JSR Ancilla_PrepOAMCoord

#_08A921: LDA.w $0C04,X
#_08A924: STA.b $06

#_08A926: LDA.w $0C18,X
#_08A929: STA.b $07

#_08A92B: LDA.w $038A,X
#_08A92E: STA.b $72

#_08A930: LDA.w $038F,X
#_08A933: STA.b $73

#_08A935: REP #$20

#_08A937: LDA.b $72
#_08A939: SEC
#_08A93A: SBC.b $06
#_08A93C: STA.b $08

#_08A93E: LDA.b $72
#_08A940: CLC
#_08A941: ADC.b $08

#_08A943: SEC
#_08A944: SBC.w #$0008

#_08A947: SEC
#_08A948: SBC.b $E2
#_08A94A: STA.b $08

;---------------------------------------------------------------------------------------------------

#_08A94C: SEP #$20

#_08A94E: LDA.w $0C54,X
#_08A951: CMP.b #$02
#_08A953: BNE .leave_allocation_alone

#_08A955: LDA.b #$08
#_08A957: JSR Ancilla_AllocateOAMFromRegion_B_or_E

.leave_allocation_alone
#_08A95A: PHX

#_08A95B: LDA.b #$01
#_08A95D: STA.b $72

#_08A95F: LDA.w $0C5E,X
#_08A962: TAX

#_08A963: LDY.b #$00
#_08A965: STY.b $73

.next_object
#_08A967: JSR Ancilla_SetOAM_XY

#_08A96A: LDA.w HitStar_char,X
#_08A96D: STA.b ($90),Y

#_08A96F: INY

#_08A970: LDA.b #$04
#_08A972: ORA.b $65
#_08A974: ORA.b $73
#_08A976: STA.b ($90),Y

#_08A978: INY

#_08A979: PHY
#_08A97A: TYA

#_08A97B: SEC
#_08A97C: SBC.b #$04

#_08A97E: LSR A
#_08A97F: LSR A
#_08A980: TAY

#_08A981: LDA.b #$00
#_08A983: STA.b ($92),Y

#_08A985: PLY

#_08A986: JSR HitStars_UpdateOAMBufferPosition

#_08A989: LDA.b #$40
#_08A98B: STA.b $73

#_08A98D: LDA.b $08
#_08A98F: STA.b $02

#_08A991: DEC.b $72
#_08A993: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08A995: PLX

#_08A996: RTS

;===================================================================================================

pool Ancilla17_ShovelDirt

.offset
#_08A997: dw  18, -13
#_08A99B: dw  -9,   4

#_08A99F: dw  18,  13
#_08A9A3: dw  -9, -11

.char
#_08A9A7: db $40
#_08A9A8: db $50

pool off

;---------------------------------------------------------------------------------------------------

Ancilla17_ShovelDirt:
#_08A9A9: JSR Ancilla_PrepOAMCoord

#_08A9AC: LDA.w $0C68,X
#_08A9AF: BNE .dont_terminate

#_08A9B1: LDA.b #$08
#_08A9B3: STA.w $0C68,X

#_08A9B6: INC.w $0C5E,X

#_08A9B9: LDA.w $0C5E,X
#_08A9BC: CMP.b #$02
#_08A9BE: BNE .dont_terminate

#_08A9C0: STZ.w $0C4A,X

#_08A9C3: RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
#_08A9C4: LDA.w $0C5E,X
#_08A9C7: STA.b $0A

#_08A9C9: ASL A
#_08A9CA: ASL A
#_08A9CB: STA.b $08

#_08A9CD: LDY.b #$00

#_08A9CF: LDA.b $2F
#_08A9D1: CMP.b #$04
#_08A9D3: BEQ .facing_left

#_08A9D5: LDY.b #$08

.facing_left
#_08A9D7: TYA
#_08A9D8: CLC
#_08A9D9: ADC.b $08
#_08A9DB: TAY

;---------------------------------------------------------------------------------------------------

#_08A9DC: REP #$20

#_08A9DE: LDA.w .offset+0,Y
#_08A9E1: CLC
#_08A9E2: ADC.b $00
#_08A9E4: STA.b $00

#_08A9E6: LDA.w .offset+2,Y
#_08A9E9: CLC
#_08A9EA: ADC.b $02
#_08A9EC: STA.b $02

#_08A9EE: CLC
#_08A9EF: ADC.w #$0008
#_08A9F2: STA.b $04

#_08A9F4: SEP #$20

#_08A9F6: PHX

;---------------------------------------------------------------------------------------------------

#_08A9F7: LDY.b #$00
#_08A9F9: STY.b $72

.next_object
#_08A9FB: JSR Ancilla_SetOAM_XY

#_08A9FE: LDX.b $0A

#_08AA00: LDA.w .char,X
#_08AA03: CLC
#_08AA04: ADC.b $72
#_08AA06: STA.b ($90),Y

#_08AA08: INY

#_08AA09: LDA.b #$04
#_08AA0B: ORA.b $65
#_08AA0D: STA.b ($90),Y

#_08AA0F: INY
#_08AA10: PHY

#_08AA11: TYA
#_08AA12: SEC
#_08AA13: SBC.b #$04
#_08AA15: LSR A
#_08AA16: LSR A
#_08AA17: TAY

#_08AA18: LDA.b #$00
#_08AA1A: STA.b ($92),Y

#_08AA1C: PLY

#_08AA1D: JSR Ancilla_AllocateOAMFromCustomRegion

#_08AA20: LDA.b $04
#_08AA22: STA.b $02

#_08AA24: LDA.b $05
#_08AA26: STA.b $03

#_08AA28: INC.b $72

#_08AA2A: LDA.b $72
#_08AA2C: CMP.b #$02
#_08AA2E: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08AA30: PLX

#_08AA31: RTS

;===================================================================================================

pool AncillaDraw_BlastWallFireball

.char
#_08AA32: db $9D, $9C, $8D

pool off

;===================================================================================================

Ancilla32_BlastWallFireball:
#_08AA35: LDA.b $11
#_08AA37: BNE AncillaDraw_BlastWallFireball

#_08AA39: LDA.w $0C5E,X
#_08AA3C: CLC
#_08AA3D: ADC.b #$02
#_08AA3F: STA.w $0C5E,X

#_08AA42: CLC
#_08AA43: ADC.w $0C22,X
#_08AA46: STA.w $0C22,X

#_08AA49: JSR Ancilla_Move_Y
#_08AA4C: JSR Ancilla_Move_X

#_08AA4F: LDA.l $7F0040,X
#_08AA53: DEC A
#_08AA54: STA.l $7F0040,X

#_08AA58: BPL AncillaDraw_BlastWallFireball

#_08AA5A: STZ.w $0C4A,X

#_08AA5D: RTS

;===================================================================================================

AncillaDraw_BlastWallFireball:
#_08AA5E: LDA.b #$04

#_08AA60: LDY.w $0FB3
#_08AA63: BEQ .use_region_a

#_08AA65: JSL SpriteDraw_AllocateOAMFromRegionD
#_08AA69: BRA .continue

.use_region_a
#_08AA6B: JSL SpriteDraw_AllocateOAMFromRegionA

;---------------------------------------------------------------------------------------------------

.continue
#_08AA6F: LDY.b #$00

#_08AA71: LDA.l $7F0040,X
#_08AA75: STA.b $06

#_08AA77: AND.b #$08
#_08AA79: BNE .proceed_with_character

#_08AA7B: LDY.b #$01

#_08AA7D: LDA.b $06
#_08AA7F: AND.b #$04
#_08AA81: BNE .proceed_with_character

#_08AA83: LDY.b #$02

.proceed_with_character
#_08AA85: LDA.w .char,Y
#_08AA88: STA.b $06

#_08AA8A: JSR Ancilla_PrepOAMCoord

#_08AA8D: LDY.b #$00
#_08AA8F: JSR Ancilla_SetOAM_XY

#_08AA92: LDA.b $06
#_08AA94: STA.b ($90),Y

#_08AA96: INY
#_08AA97: LDA.b #$22
#_08AA99: STA.b ($90),Y

#_08AA9B: LDA.b #$00
#_08AA9D: STA.b ($92)

#_08AA9F: RTS

;===================================================================================================

Ancilla18_EtherSpell:
#_08AAA0: LDA.b $11
#_08AAA2: BEQ .submode_fine

#_08AAA4: BRL .exit

;---------------------------------------------------------------------------------------------------

.submode_fine
#_08AAA7: LDA.w $0C54,X
#_08AAAA: BEQ .done_palette_flash

#_08AAAC: LDA.w $031D
#_08AAAF: BNE .lightning_descended

#_08AAB1: INC.w $0BF0,X

#_08AAB4: LDA.w $0BF0,X
#_08AAB7: AND.b #$04
#_08AAB9: BEQ .oversaturate

#_08AABB: BRA .restore

;---------------------------------------------------------------------------------------------------

.lightning_descended
#_08AABD: LDA.w $031D
#_08AAC0: CMP.b #$0B
#_08AAC2: BNE .restore

;---------------------------------------------------------------------------------------------------

.oversaturate
#_08AAC4: PHX

#_08AAC5: JSL RefreshLinkEquipmentPalettes_zap
#_08AAC9: JSL PaletteFilter_Oversaturation

#_08AACD: PLX

#_08AACE: BRA .done_palette_flash

;---------------------------------------------------------------------------------------------------

.restore
#_08AAD0: PHX

#_08AAD1: JSL RefreshLinkEquipmentPalettes_sword_and_mail
#_08AAD5: JSL Palette_RestoreBGFromFlash

#_08AAD9: PLX

;---------------------------------------------------------------------------------------------------

.done_palette_flash
#_08AADA: LDA.w $0C54,X
#_08AADD: CMP.b #$02
#_08AADF: BNE .check_ball_timer

#_08AAE1: DEC.w $03B1,X
#_08AAE4: BPL .delay

#_08AAE6: LDA.b #$02
#_08AAE8: STA.w $03B1,X

#_08AAEB: LDA.w $0C5E,X
#_08AAEE: INC A
#_08AAEF: STA.w $0C5E,X

#_08AAF2: CMP.b #$02
#_08AAF4: BNE .delay

#_08AAF6: DEC.w $0C5E,X

#_08AAF9: LDA.b #$10
#_08AAFB: STA.w $0C2C,X

#_08AAFE: LDA.b #$03
#_08AB00: STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.delay
#_08AB03: LDA.w $0C2C,X
#_08AB06: CLC
#_08AB07: ADC.b #$01
#_08AB09: STA.w $0C2C,X

#_08AB0C: BRL EtherSpell_HandleRadialSpin

;---------------------------------------------------------------------------------------------------

.check_ball_timer
#_08AB0F: DEC.w $03B1,X
#_08AB12: BPL .dont_swap_char

#_08AB14: LDA.b #$02
#_08AB16: STA.w $03B1,X

#_08AB19: LDA.w $0C5E,X
#_08AB1C: EOR.b #$01
#_08AB1E: STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.dont_swap_char
#_08AB21: LDA.w $0C54,X
#_08AB24: BEQ .lightning

#_08AB26: CMP.b #$01
#_08AB28: BEQ .pulsing_orb

#_08AB2A: CMP.b #$03
#_08AB2C: BEQ .do_spin

#_08AB2E: CMP.b #$04
#_08AB30: BEQ .dissipate

;---------------------------------------------------------------------------------------------------

#_08AB32: LDA.w $0C2C,X
#_08AB35: CLC
#_08AB36: ADC.b #$10
#_08AB38: BPL .radial_speed_not_maxed

#_08AB3A: LDA.b #$7F

.radial_speed_not_maxed
#_08AB3C: STA.w $0C2C,X
#_08AB3F: BRL .do_spin

;---------------------------------------------------------------------------------------------------

.lightning
#_08AB42: BRA EtherSpell_HandleLightningStroke

;---------------------------------------------------------------------------------------------------

.pulsing_orb
#_08AB44: BRL EtherSpell_HandleOrbPulse

;---------------------------------------------------------------------------------------------------

.dissipate
#_08AB47: LDA.l $7F5812
#_08AB4B: DEC A
#_08AB4C: STA.l $7F5812

#_08AB50: BNE .do_spin

#_08AB52: LDA.b #$05
#_08AB54: STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.do_spin
#_08AB57: BRL EtherSpell_HandleRadialSpin

.exit
#_08AB5A: RTS

;===================================================================================================

UNREACHABLE_08AB5B:
#_08AB5B: db $E0, $00, $E8, $E8
#_08AB5F: db $00, $20, $18, $18

;===================================================================================================

EtherSpell_HandleLightningStroke:
#_08AB63: JSR Ancilla_Move_Y

#_08AB66: LDA.w $0C0E,X
#_08AB69: STA.b $01

#_08AB6B: LDA.w $0BFA,X
#_08AB6E: STA.b $00

#_08AB70: AND.b #$F0
#_08AB72: CMP.l $7F580C
#_08AB76: BEQ .dont_lengthen

#_08AB78: STA.l $7F580C

#_08AB7C: INC.w $03C2,X

.dont_lengthen
#_08AB7F: REP #$20

#_08AB81: LDA.b $00
#_08AB83: CMP.w #$E000
#_08AB86: BCS .delay

#_08AB88: LDA.l $7F580A
#_08AB8C: CMP.w #$E000
#_08AB8F: BCS .at_target

#_08AB91: LDA.l $7F580A
#_08AB95: CMP.b $00
#_08AB97: BEQ .at_target
#_08AB99: BCS .delay

.at_target
#_08AB9B: SEP #$20

#_08AB9D: LDA.b #$01
#_08AB9F: STA.w $0C54,X

.delay
#_08ABA2: SEP #$20

#_08ABA4: BRL AncillaDraw_EtherBlitz

;===================================================================================================

EtherSpell_HandleOrbPulse:
#_08ABA7: LDA.w $03C2,X
#_08ABAA: BMI .continue

#_08ABAC: DEC.w $039F,X
#_08ABAF: BPL .proceed_to_draw

#_08ABB1: LDA.b #$03
#_08ABB3: STA.w $039F,X

#_08ABB6: DEC.w $03C2,X
#_08ABB9: BPL .proceed_to_draw

#_08ABBB: LDA.b #$09
#_08ABBD: STA.w $039F,X

#_08ABC0: BRA .continue

.proceed_to_draw
#_08ABC2: BRL AncillaDraw_EtherBlitz

;---------------------------------------------------------------------------------------------------

.continue
#_08ABC5: DEC.w $039F,X
#_08ABC8: BPL .dont_damage

#_08ABCA: LDA.b #$02
#_08ABCC: STA.w $0C54,X

#_08ABCF: STZ.w $0C22,X

#_08ABD2: LDA.b #$10
#_08ABD4: STA.w $0C2C,X

#_08ABD7: STZ.w $0C5E,X

#_08ABDA: LDA.b #$02
#_08ABDC: STA.w $03B1,X

#_08ABDF: LDA.w $031D
#_08ABE2: BEQ .dont_damage

#_08ABE4: PHX
#_08ABE5: JSL Medallion_CheckSpriteDamage
#_08ABE9: PLX

.dont_damage
#_08ABEA: LDY.b #$00
#_08ABEC: BRL AncillaDraw_EtherOrb

;===================================================================================================

EtherSpell_HandleRadialSpin:
#_08ABEF: LDA.w $0C54,X
#_08ABF2: CMP.b #$04
#_08ABF4: BNE .skip_sfx

#_08ABF6: LDY.b #$2A ; SFX3.2A

#_08ABF8: LDA.b $1A
#_08ABFA: AND.b #$07
#_08ABFC: BEQ .set_sfx


#_08ABFE: LDY.b #$AA ; SFX3.2A with !HARDCODED pan value of $80

#_08AC00: CMP.b #$04
#_08AC02: BEQ .set_sfx

#_08AC04: CMP.b #$07
#_08AC06: BNE .skip_sfx

#_08AC08: LDY.b #$6A ; SFX3.2A with !HARDCODED pan value of $40

.set_sfx
#_08AC0A: STY.w $012F

;---------------------------------------------------------------------------------------------------

.skip_sfx
#_08AC0D: LDA.w $0C54,X
#_08AC10: CMP.b #$04
#_08AC12: BEQ .dont_expand

#_08AC14: LDA.l $7F5808
#_08AC18: STA.w $0C04,X

#_08AC1B: STZ.w $0C18,X

#_08AC1E: JSR Ancilla_Move_X

#_08AC21: LDA.w $0C04,X
#_08AC24: STA.l $7F5808

#_08AC28: CMP.b #$40
#_08AC2A: BNE .dont_expand

#_08AC2C: LDA.b #$04
#_08AC2E: STA.w $0C54,X

.dont_expand
#_08AC31: PHX

#_08AC32: LDA.w $0C54,X
#_08AC35: STA.b $72

#_08AC37: LDA.w $0C5E,X
#_08AC3A: STA.b $73

;---------------------------------------------------------------------------------------------------

#_08AC3C: LDY.b #$00
#_08AC3E: LDX.b #$07

.next_orb
#_08AC40: LDA.b $72
#_08AC42: CMP.b #$02
#_08AC44: BEQ .dont_rotate

#_08AC46: CMP.b #$05
#_08AC48: BEQ .dont_rotate

#_08AC4A: LDA.l $7F5800,X
#_08AC4E: INC A
#_08AC4F: AND.b #$3F
#_08AC51: STA.l $7F5800,X

.dont_rotate
#_08AC55: LDA.l $7F5808
#_08AC59: STA.b $08

#_08AC5B: LDA.l $7F5800,X

#_08AC5F: JSR Ancilla_GetRadialProjection

#_08AC62: PHX

#_08AC63: LDA.b $72
#_08AC65: CMP.b #$02
#_08AC67: BEQ .draw_as_segment

#_08AC69: JSR AncillaDraw_EtherBlitzBall

#_08AC6C: BRA .to_next

.draw_as_segment
#_08AC6E: JSR AncillaDraw_EtherBlitzSegment

.to_next
#_08AC71: PLX
#_08AC72: DEX
#_08AC73: BPL .next_orb

;---------------------------------------------------------------------------------------------------

#_08AC75: PLX

#_08AC76: LDA.l $7F5808
#_08AC7A: CMP.b #$F0
#_08AC7C: BCS .terminate

#_08AC7E: LDY.b #$01

.next_check
#_08AC80: LDA.b ($90),Y
#_08AC82: CMP.b #$F0
#_08AC84: BNE .exit

#_08AC86: INY
#_08AC87: INY
#_08AC88: INY
#_08AC89: INY

#_08AC8A: CPY.b #$21
#_08AC8C: BNE .next_check

;---------------------------------------------------------------------------------------------------

.terminate
#_08AC8E: STZ.w $0C4A,X

#_08AC91: LDA.b #$01
#_08AC93: STA.w $0AAA

#_08AC96: STZ.w $0324
#_08AC99: STZ.w $031C
#_08AC9C: STZ.w $031D

#_08AC9F: STZ.b $50

#_08ACA1: STZ.w $0FC1

#_08ACA4: LDA.b $8A
#_08ACA6: CMP.b #$70 ; OW 70
#_08ACA8: BNE .dont_open_mire

#_08ACAA: LDA.l $7EF2F0
#_08ACAE: AND.b #$20
#_08ACB0: BNE .dont_open_mire

#_08ACB2: LDY.b #$02
#_08ACB4: JSR Ancilla_CheckForEntranceTrigger
#_08ACB7: BCC .dont_open_mire

#_08ACB9: LDA.b #$03
#_08ACBB: STA.w $04C6

#_08ACBE: STZ.b $B0
#_08ACC0: STZ.b $C8

;---------------------------------------------------------------------------------------------------

.dont_open_mire
#_08ACC2: LDA.b $5D
#_08ACC4: CMP.b #$19 ; LINKSTATE 19
#_08ACC6: BEQ .spin_attack

#_08ACC8: LDA.b #$00 ; LINKSTATE 00
#_08ACCA: STA.b $5D

#_08ACCC: STZ.b $3D

#_08ACCE: LDY.b #$00

#_08ACD0: LDA.b $3C
#_08ACD2: BEQ .dont_flag_b

#_08ACD4: LDA.b $F0
#_08ACD6: AND.b #$80
#_08ACD8: TAY

.dont_flag_b
#_08ACD9: STY.b $3A

;---------------------------------------------------------------------------------------------------

.spin_attack
#_08ACDB: STZ.b $5E
#_08ACDD: STZ.w $0325

#_08ACE0: PHX

#_08ACE1: JSL RefreshLinkEquipmentPalettes_sword_and_mail
#_08ACE5: JSL Palette_RestoreBGAndHUD

#_08ACE9: PLX

.exit
#_08ACEA: RTS

;===================================================================================================

pool AncillaDraw_EtherBlitzBall

.char
#_08ACEB: db $68, $6A

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitzBall:
#_08ACED: REP #$20

#_08ACEF: PHY

#_08ACF0: LDA.b $00

#_08ACF2: LDY.b $02
#_08ACF4: BEQ .positive_y

#_08ACF6: EOR.w #$FFFF
#_08ACF9: INC A

.positive_y
#_08ACFA: STA.b $08

#_08ACFC: CLC
#_08ACFD: ADC.l $7F5810

#_08AD01: CLC
#_08AD02: ADC.w #$FFF8

#_08AD05: SEC
#_08AD06: SBC.b $E8
#_08AD08: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08AD0A: LDA.b $04

#_08AD0C: LDY.b $06
#_08AD0E: BEQ .positive_x

#_08AD10: EOR.w #$FFFF
#_08AD13: INC A

.positive_x
#_08AD14: STA.b $0A

#_08AD16: CLC
#_08AD17: ADC.l $7F580E

#_08AD1B: CLC
#_08AD1C: ADC.w #$FFF8

#_08AD1F: SEC
#_08AD20: SBC.b $E2
#_08AD22: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08AD24: PLY

#_08AD25: SEP #$20

#_08AD27: JSR Ancilla_SetOAM_XY

#_08AD2A: LDA.b $73
#_08AD2C: TAX

#_08AD2D: LDA.w .char,X
#_08AD30: STA.b ($90),Y

#_08AD32: INY

#_08AD33: LDA.b #$3C
#_08AD35: STA.b ($90),Y

#_08AD37: INY
#_08AD38: PHY
#_08AD39: TYA

#_08AD3A: SEC
#_08AD3B: SBC.b #$04
#_08AD3D: LSR A
#_08AD3E: LSR A
#_08AD3F: TAY

#_08AD40: LDA.b #$02
#_08AD42: STA.b ($92),Y

#_08AD44: JSR Ancilla_AllocateOAMFromCustomRegion

#_08AD47: PLY

#_08AD48: RTS

;===================================================================================================

pool AncillaDraw_EtherBlitzSegment

.char
#_08AD49: db $40, $42
#_08AD4B: db $66, $64
#_08AD4D: db $62, $60
#_08AD4F: db $64, $66
#_08AD51: db $42, $40
#_08AD53: db $66, $64
#_08AD55: db $60, $62
#_08AD57: db $64, $66
#_08AD59: db $68, $42
#_08AD5B: db $68, $64
#_08AD5D: db $68, $60
#_08AD5F: db $68, $64
#_08AD61: db $68, $40
#_08AD63: db $68, $66
#_08AD65: db $68, $62
#_08AD67: db $68, $64

;---------------------------------------------------------------------------------------------------

.prop
#_08AD69: db $3C, $3C
#_08AD6B: db $FC, $FC
#_08AD6D: db $3C, $3C
#_08AD6F: db $BC, $BC
#_08AD71: db $3C, $3C
#_08AD73: db $3C, $3C
#_08AD75: db $3C, $3C
#_08AD77: db $7C, $7C
#_08AD79: db $3C, $7C
#_08AD7B: db $3C, $3C
#_08AD7D: db $3C, $BC
#_08AD7F: db $3C, $7C
#_08AD81: db $3C, $7C
#_08AD83: db $3C, $FC
#_08AD85: db $3C, $BC
#_08AD87: db $3C, $BC

;---------------------------------------------------------------------------------------------------

.offset_y
#_08AD89: dw   8
#_08AD8B: dw   0
#_08AD8D: dw  -8
#_08AD8F: dw -16
#_08AD91: dw -24
#_08AD93: dw -16
#_08AD95: dw  -8
#_08AD97: dw -16
#_08AD99: dw   8
#_08AD9B: dw   0
#_08AD9D: dw  -8
#_08AD9F: dw -16
#_08ADA1: dw -24
#_08ADA3: dw -16
#_08ADA5: dw  -8
#_08ADA7: dw   0

;---------------------------------------------------------------------------------------------------

.offset_x
#_08ADA9: dw  -8
#_08ADAB: dw -16
#_08ADAD: dw -24
#_08ADAF: dw -16
#_08ADB1: dw  -8
#_08ADB3: dw   0
#_08ADB5: dw   8
#_08ADB7: dw -16
#_08ADB9: dw  -8
#_08ADBB: dw -16
#_08ADBD: dw -24
#_08ADBF: dw -16
#_08ADC1: dw  -8
#_08ADC3: dw   0
#_08ADC5: dw   8
#_08ADC7: dw   0

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitzSegment:
#_08ADC9: REP #$20

#_08ADCB: PHY

#_08ADCC: LDA.b $00

#_08ADCE: LDY.b $02
#_08ADD0: BEQ .positive_y

#_08ADD2: EOR.w #$FFFF
#_08ADD5: INC A

.positive_y
#_08ADD6: STA.b $08

#_08ADD8: CLC
#_08ADD9: ADC.l $7F5810

#_08ADDD: CLC
#_08ADDE: ADC.w #$FFF8

#_08ADE1: SEC
#_08ADE2: SBC.b $E8
#_08ADE4: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08ADE6: LDA.b $04

#_08ADE8: LDY.b $06
#_08ADEA: BEQ .positive_x

#_08ADEC: EOR.w #$FFFF
#_08ADEF: INC A

.positive_x
#_08ADF0: STA.b $0A

#_08ADF2: CLC
#_08ADF3: ADC.l $7F580E

#_08ADF7: CLC
#_08ADF8: ADC.w #$FFF8

#_08ADFB: SEC
#_08ADFC: SBC.b $E2
#_08ADFE: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08AE00: PLY

#_08AE01: SEP #$20

#_08AE03: JSR Ancilla_SetOAM_XY

#_08AE06: LDA.b $73
#_08AE08: ASL A
#_08AE09: ASL A
#_08AE0A: ASL A
#_08AE0B: ASL A
#_08AE0C: STA.b $0E

#_08AE0E: TXA
#_08AE0F: ASL A
#_08AE10: CLC
#_08AE11: ADC.b $0E
#_08AE13: TAX

#_08AE14: LDA.w .char+0,X
#_08AE17: STA.b ($90),Y

#_08AE19: INY

#_08AE1A: LDA.w .prop+0,X
#_08AE1D: STA.b ($90),Y

#_08AE1F: INY
#_08AE20: PHY

#_08AE21: TYA
#_08AE22: SEC
#_08AE23: SBC.b #$04
#_08AE25: LSR A
#_08AE26: LSR A
#_08AE27: TAY

#_08AE28: LDA.b #$02
#_08AE2A: STA.b ($92),Y

#_08AE2C: PLY

;---------------------------------------------------------------------------------------------------

#_08AE2D: REP #$20

#_08AE2F: LDA.b $08
#_08AE31: CLC
#_08AE32: ADC.l $7F5810

#_08AE36: CLC
#_08AE37: ADC.w .offset_y,X

#_08AE3A: SEC
#_08AE3B: SBC.b $E8
#_08AE3D: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08AE3F: LDA.b $0A
#_08AE41: CLC
#_08AE42: ADC.l $7F580E

#_08AE46: CLC
#_08AE47: ADC.w .offset_x,X

#_08AE4A: SEC
#_08AE4B: SBC.b $E2
#_08AE4D: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08AE4F: SEP #$20

#_08AE51: PHX
#_08AE52: JSR Ancilla_SetOAM_XY
#_08AE55: PLX

#_08AE56: LDA.w .char+1,X
#_08AE59: STA.b ($90),Y

#_08AE5B: INY

#_08AE5C: LDA.w .prop+1,X
#_08AE5F: STA.b ($90),Y

#_08AE61: INY
#_08AE62: PHY

#_08AE63: TYA
#_08AE64: SEC
#_08AE65: SBC.b #$04
#_08AE67: LSR A
#_08AE68: LSR A
#_08AE69: TAY

#_08AE6A: LDA.b #$02
#_08AE6C: STA.b ($92),Y

#_08AE6E: PLY

#_08AE6F: JSR Ancilla_AllocateOAMFromCustomRegion

#_08AE72: RTS

;===================================================================================================

EtherBlitzDraw:
.char
#_08AE73: db $40, $42, $44, $46

.orb_char
#_08AE77: db $48, $48, $4A, $4A
#_08AE7B: db $4C, $4C, $4E, $4E

.prop
#_08AE7F: db $3C, $7C, $3C, $7C
#_08AE83: db $3C, $7C, $3C, $7C

;---------------------------------------------------------------------------------------------------

AncillaDraw_EtherBlitz:
#_08AE87: JSR Ancilla_PrepOAMCoord

#_08AE8A: LDA.w $0C5E,X
#_08AE8D: STA.b $06

#_08AE8F: STZ.b $08

#_08AE91: PHX

#_08AE92: LDA.w $03C2,X
#_08AE95: TAX

#_08AE96: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
#_08AE98: JSR Ancilla_SetOAM_XY

#_08AE9B: PHX

#_08AE9C: LDA.b $06
#_08AE9E: ASL A
#_08AE9F: CLC
#_08AEA0: ADC.b $08
#_08AEA2: TAX

#_08AEA3: LDA.w EtherBlitzDraw_char,X
#_08AEA6: STA.b ($90),Y

#_08AEA8: PLX

#_08AEA9: INY

#_08AEAA: LDA.w EtherBlitzDraw_prop
#_08AEAD: ORA.b $65
#_08AEAF: STA.b ($90),Y

#_08AEB1: INY
#_08AEB2: PHY

#_08AEB3: TYA
#_08AEB4: SEC
#_08AEB5: SBC.b #$04
#_08AEB7: LSR A
#_08AEB8: LSR A
#_08AEB9: TAY

#_08AEBA: LDA.b #$02
#_08AEBC: STA.b ($92),Y

#_08AEBE: PLY

#_08AEBF: REP #$20

#_08AEC1: LDA.b $00
#_08AEC3: SEC
#_08AEC4: SBC.w #$0010
#_08AEC7: STA.b $00

#_08AEC9: SEP #$20

#_08AECB: LDA.b $08
#_08AECD: EOR.b #$01
#_08AECF: STA.b $08

#_08AED1: DEX
#_08AED2: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08AED4: PLX

#_08AED5: LDA.w $0C54,X
#_08AED8: CMP.b #$01
#_08AEDA: BEQ AncillaDraw_EtherOrb

#_08AEDC: RTS

;===================================================================================================

AncillaDraw_EtherOrb:
#_08AEDD: REP #$20

#_08AEDF: LDA.l $7F5813
#_08AEE3: CLC
#_08AEE4: ADC.w #$FFFF
#_08AEE7: SEC
#_08AEE8: SBC.b $E8
#_08AEEA: STA.b $00

#_08AEEC: LDA.l $7F5815
#_08AEF0: CLC
#_08AEF1: ADC.w #$FFF8
#_08AEF4: SEC
#_08AEF5: SBC.b $E2
#_08AEF7: STA.b $02
#_08AEF9: STA.b $04

#_08AEFB: STZ.b $08

#_08AEFD: SEP #$20

#_08AEFF: PHX

#_08AF00: LDA.w $0C5E,X
#_08AF03: ASL A
#_08AF04: ASL A
#_08AF05: STA.b $06

.next_object
#_08AF07: JSR Ancilla_SetOAM_XY

#_08AF0A: LDX.b $06

#_08AF0C: LDA.w EtherBlitzDraw_orb_char,X
#_08AF0F: STA.b ($90),Y

#_08AF11: INY

#_08AF12: LDA.w EtherBlitzDraw_prop,X
#_08AF15: STA.b ($90),Y

#_08AF17: INY
#_08AF18: PHY

#_08AF19: TYA
#_08AF1A: SEC
#_08AF1B: SBC.b #$04
#_08AF1D: LSR A
#_08AF1E: LSR A
#_08AF1F: TAY

#_08AF20: LDA.b #$02
#_08AF22: STA.b ($92),Y

#_08AF24: PLY

#_08AF25: JSR Ancilla_AllocateOAMFromCustomRegion

#_08AF28: REP #$20

#_08AF2A: LDA.b $02
#_08AF2C: CLC
#_08AF2D: ADC.w #$0010
#_08AF30: STA.b $02

#_08AF32: INC.b $06

#_08AF34: INC.b $08

#_08AF36: LDA.b $08
#_08AF38: CMP.w #$0004
#_08AF3B: BEQ .exit

#_08AF3D: CMP.w #$0002
#_08AF40: BNE .continue

#_08AF42: LDA.b $00
#_08AF44: CLC
#_08AF45: ADC.w #$0010
#_08AF48: STA.b $00

#_08AF4A: LDA.b $04
#_08AF4C: STA.b $02

.continue
#_08AF4E: SEP #$20

#_08AF50: BRA .next_object

;---------------------------------------------------------------------------------------------------

.exit
#_08AF52: SEP #$20

#_08AF54: PLX

#_08AF55: RTS

;===================================================================================================

pool AncillaAdd_BombosSpell

.offset_y
#_08AF56: dw  16,  24, -128, -16

.offset_x
#_08AF5E: dw -16, -128,   0, 128

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_BombosSpell:
#_08AF66: PHB
#_08AF67: PHK
#_08AF68: PLB

#_08AF69: JSR AncillaAdd_AddAncilla_Bank08
#_08AF6C: BCC .found_slot

#_08AF6E: BRL .exit

;---------------------------------------------------------------------------------------------------

.found_slot
#_08AF71: LDA.b #$03
#_08AF73: STA.l $7F5800
#_08AF77: STA.l $7F5801
#_08AF7B: STA.l $7F5802
#_08AF7F: STA.l $7F5803
#_08AF83: STA.l $7F5804

#_08AF87: STA.l $7F5805
#_08AF8B: STA.l $7F5806
#_08AF8F: STA.l $7F5807
#_08AF93: STA.l $7F5808
#_08AF97: STA.l $7F5809

#_08AF9B: STA.l $7F5945
#_08AF9F: STA.l $7F5946
#_08AFA3: STA.l $7F5947
#_08AFA7: STA.l $7F5948

#_08AFAB: STA.l $7F5949
#_08AFAF: STA.l $7F594A
#_08AFB3: STA.l $7F594B
#_08AFB7: STA.l $7F594C

#_08AFBB: LDA.b #$00
#_08AFBD: STA.l $7F5810
#_08AFC1: STA.l $7F5811
#_08AFC5: STA.l $7F5812
#_08AFC9: STA.l $7F5813
#_08AFCD: STA.l $7F5814

#_08AFD1: STA.l $7F5815
#_08AFD5: STA.l $7F5816
#_08AFD9: STA.l $7F5817
#_08AFDD: STA.l $7F5818
#_08AFE1: STA.l $7F5819

#_08AFE5: STA.l $7F5935
#_08AFE9: STA.l $7F5936
#_08AFED: STA.l $7F5937
#_08AFF1: STA.l $7F5938

#_08AFF5: STA.l $7F5939
#_08AFF9: STA.l $7F593A
#_08AFFD: STA.l $7F593B
#_08B001: STA.l $7F593C

#_08B005: STA.l $7F5934
#_08B009: STA.l $7F5A56

;---------------------------------------------------------------------------------------------------

#_08B00D: LDA.b #$80
#_08B00F: STA.l $7F5A55

#_08B013: LDA.b #$10
#_08B015: STA.l $7F5820

#_08B019: LDA.b #$0B
#_08B01B: STA.w $0AAA

#_08B01E: LDA.b #$01
#_08B020: STA.w $0112

#_08B023: STZ.w $0C54,X
#_08B026: STZ.w $0C5E,X

;---------------------------------------------------------------------------------------------------

#_08B029: LDA.b #$2A ; SFX2.2A
#_08B02B: JSR Ancilla_SFX2_Near

#_08B02E: PHX

#_08B02F: LDY.b $1A

#_08B031: LDA.b $21
#_08B033: STA.l $7F5956

#_08B037: LDA.b $23
#_08B039: STA.l $7F59D6

#_08B03D: LDA.w Ancilla05_Boomerang,Y
#_08B040: CMP.b #$E0
#_08B042: BCC .excuse_me

#_08B044: AND.b #$7F

.excuse_me
#_08B046: STA.l $7F5955
#_08B04A: STA.l $7F59D5

;---------------------------------------------------------------------------------------------------

#_08B04E: LDX.b #$00
#_08B050: STX.b $72

.next
#_08B052: REP #$20

#_08B054: LDA.b $20
#_08B056: CLC
#_08B057: ADC.w .offset_y,X
#_08B05A: STA.l $7F5924,X

#_08B05E: LDA.b $22
#_08B060: CLC
#_08B061: ADC.w .offset_x,X
#_08B064: STA.l $7F592C,X

#_08B068: SEP #$20

#_08B06A: PHX

#_08B06B: TXA
#_08B06C: LSR A
#_08B06D: TAX

#_08B06E: LDA.b #$10
#_08B070: STA.b $08
#_08B072: STA.l $7F5A57

#_08B076: LDA.l $7F5820,X

#_08B07A: PLX

#_08B07B: JSR Ancilla_GetRadialProjection

;---------------------------------------------------------------------------------------------------

#_08B07E: REP #$20

#_08B080: LDA.b $00
#_08B082: LDY.b $02
#_08B084: BEQ .positive_x

#_08B086: EOR.w #$FFFF
#_08B089: INC A

.positive_x
#_08B08A: CLC
#_08B08B: ADC.l $7F5924,X
#_08B08F: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08B091: LDA.b $04

#_08B093: LDY.b $06
#_08B095: BEQ .positive_y

#_08B097: EOR.w #$FFFF
#_08B09A: INC A

.positive_y
#_08B09B: CLC
#_08B09C: ADC.l $7F592C,X
#_08B0A0: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08B0A2: SEP #$20

#_08B0A4: PHX

#_08B0A5: LDX.b $72

#_08B0A7: LDA.b $00
#_08B0A9: STA.l $7F5824,X

#_08B0AD: LDA.b $01
#_08B0AF: STA.l $7F5864,X

#_08B0B3: LDA.b $04
#_08B0B5: STA.l $7F58A4,X

#_08B0B9: LDA.b $05
#_08B0BB: STA.l $7F58E4,X

#_08B0BF: PLX

#_08B0C0: LDA.b $72
#_08B0C2: SEC
#_08B0C3: SBC.b #$10
#_08B0C5: STA.b $72

#_08B0C7: DEX
#_08B0C8: DEX
#_08B0C9: BPL .next

;---------------------------------------------------------------------------------------------------

#_08B0CB: PLX

.exit
#_08B0CC: PLB

#_08B0CD: RTL

;===================================================================================================

Ancilla19_BombosSpell:
#_08B0CE: LDA.l $7F5934
#_08B0D2: BNE .no_new_columns

#_08B0D4: LDA.b $11
#_08B0D6: BNE .draw_columns

#_08B0D8: JMP.w BombosSpell_ControlFireColumns

;---------------------------------------------------------------------------------------------------

.draw_columns
#_08B0DB: LDY.b #$00
#_08B0DD: LDX.b #$09

.next_column_draw
#_08B0DF: JSR AncillaDraw_BombosFireColumn

#_08B0E2: DEX
#_08B0E3: BPL .next_column_draw

#_08B0E5: RTS

;---------------------------------------------------------------------------------------------------

.no_new_columns
#_08B0E6: LDA.l $7F5934
#_08B0EA: CMP.b #$02
#_08B0EC: BEQ .blasting

#_08B0EE: LDA.b $11
#_08B0F0: BNE .draw_columns

#_08B0F2: JSR BombosSpell_FinishFireColumns

#_08B0F5: RTS

;---------------------------------------------------------------------------------------------------

.blasting
#_08B0F6: LDA.b $11
#_08B0F8: BEQ .dont_draw_blast

#_08B0FA: PHX

#_08B0FB: LDA.w $0C54,X
#_08B0FE: TAX

.next_blast_draw
#_08B0FF: JSR AncillaDraw_BombosBlast

#_08B102: DEX
#_08B103: BPL .next_blast_draw

#_08B105: PLX

#_08B106: RTS

;---------------------------------------------------------------------------------------------------

.dont_draw_blast
#_08B107: JMP.w BombosSpell_ControlBlasting

;===================================================================================================

BombosSpell_ControlFireColumns:
#_08B10A: PHX

#_08B10B: LDA.w $0C5E,X
#_08B10E: STA.b $73

#_08B110: LDA.w $0C54,X
#_08B113: STA.b $72

#_08B115: TAX
#_08B116: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_column
#_08B118: LDA.l $7F5810,X
#_08B11C: CMP.b #$0D
#_08B11E: BNE .continue

.skip_me
#_08B120: BRL .skip_this_column

.continue
#_08B123: LDA.l $7F5800,X
#_08B127: DEC A
#_08B128: STA.l $7F5800,X
#_08B12C: BMI .time_up

.dont_spawn_new_column
#_08B12E: BRL .just_draw

;---------------------------------------------------------------------------------------------------

.time_up
#_08B131: LDA.b #$03
#_08B133: STA.l $7F5800,X

#_08B137: LDA.l $7F5810,X
#_08B13B: INC A
#_08B13C: STA.l $7F5810,X

#_08B140: CMP.b #$0D
#_08B142: BEQ .skip_me

;---------------------------------------------------------------------------------------------------

#_08B144: CMP.b #$02
#_08B146: BNE .dont_spawn_new_column

#_08B148: LDA.b $73
#_08B14A: BNE .skip_me

#_08B14C: PHX

#_08B14D: LDA.b $72
#_08B14F: CMP.b #$09
#_08B151: BNE .to_next_find

;---------------------------------------------------------------------------------------------------

#_08B153: LDX.b #$09

.next_check
#_08B155: LDA.l $7F5810,X
#_08B159: CMP.b #$0D
#_08B15B: BNE .dont_reset

#_08B15D: LDA.b #$00
#_08B15F: STA.l $7F5810,X
#_08B163: BRA .set_radial

.dont_reset
#_08B165: DEX
#_08B166: BPL .next_check

.to_next_find
#_08B168: LDX.b $72
#_08B16A: INX
#_08B16B: CPX.b #$0A
#_08B16D: BNE .not_maxed

#_08B16F: LDX.b #$09

.not_maxed
#_08B171: STX.b $72

.set_radial
#_08B173: TXA
#_08B174: CLC
#_08B175: ADC.b #$00
#_08B177: STA.b $74

;---------------------------------------------------------------------------------------------------

.never
#_08B179: LDA.b $74
#_08B17B: LSR A
#_08B17C: LSR A
#_08B17D: LSR A
#_08B17E: LSR A
#_08B17F: TAX

#_08B180: LDA.l $7F5A57
#_08B184: CLC
#_08B185: ADC.b #$03
#_08B187: CMP.b #$D0
#_08B189: BCC .not_maxed_distance

#_08B18B: LDA.b #$CF

;---------------------------------------------------------------------------------------------------

.not_maxed_distance
#_08B18D: STA.l $7F5A57
#_08B191: STA.b $08

#_08B193: LDA.l $7F5820,X
#_08B197: CLC
#_08B198: ADC.b #$06
#_08B19A: STA.l $7F5820,X

#_08B19E: AND.b #$3F
#_08B1A0: JSR Ancilla_GetRadialProjection

#_08B1A3: TXA
#_08B1A4: ASL A
#_08B1A5: TAX

#_08B1A6: REP #$20

#_08B1A8: PHY

;---------------------------------------------------------------------------------------------------

#_08B1A9: LDA.b $00

#_08B1AB: LDY.b $02
#_08B1AD: BEQ .positive_y

#_08B1AF: EOR.w #$FFFF
#_08B1B2: INC A

.positive_y
#_08B1B3: CLC
#_08B1B4: ADC.l $7F5924,X
#_08B1B8: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08B1BA: LDA.b $04

#_08B1BC: LDY.b $06
#_08B1BE: BEQ .positive_x

#_08B1C0: EOR.w #$FFFF
#_08B1C3: INC A

.positive_x
#_08B1C4: CLC
#_08B1C5: ADC.l $7F592C,X
#_08B1C9: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08B1CB: PLY

#_08B1CC: SEP #$20

#_08B1CE: LDX.b $74

#_08B1D0: LDA.b $00
#_08B1D2: STA.l $7F5824,X

#_08B1D6: LDA.b $01
#_08B1D8: STA.l $7F5864,X

#_08B1DC: LDA.b $04
#_08B1DE: STA.l $7F58A4,X

#_08B1E2: LDA.b $05
#_08B1E4: STA.l $7F58E4,X

;---------------------------------------------------------------------------------------------------

#_08B1E8: LDA.b $74
#_08B1EA: SEC
#_08B1EB: SBC.b #$10
#_08B1ED: STA.b $74
#_08B1EF: BPL .never

#_08B1F1: REP #$20

#_08B1F3: LDA.b $04
#_08B1F5: SEC
#_08B1F6: SBC.b $E2

#_08B1F8: CLC
#_08B1F9: ADC.w #$0008
#_08B1FC: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08B1FE: SEP #$20

#_08B200: LDA.b $05
#_08B202: BNE .no_sfx

#_08B204: LDA.b $04
#_08B206: LSR A
#_08B207: LSR A
#_08B208: LSR A
#_08B209: LSR A
#_08B20A: LSR A
#_08B20B: TAX

#_08B20C: LDA.l AncillaPanValues,X
#_08B210: ORA.b #$2A ; SFX2.2A
#_08B212: STA.w $012E

;---------------------------------------------------------------------------------------------------

.no_sfx
#_08B215: PLX

.just_draw
#_08B216: JSR AncillaDraw_BombosFireColumn

.skip_this_column
#_08B219: DEX
#_08B21A: BMI .done_columns

#_08B21C: BRL .next_column

;---------------------------------------------------------------------------------------------------

.done_columns
#_08B21F: PLX

#_08B220: LDA.l $7F5820
#_08B224: CMP.b #$80
#_08B226: BCS .trigger_wrap_up

#_08B228: BRA .finish_up

.trigger_wrap_up
#_08B22A: LDA.b #$01
#_08B22C: STA.l $7F5934

.finish_up
#_08B230: LDA.b $72
#_08B232: STA.w $0C54,X

#_08B235: RTS

;---------------------------------------------------------------------------------------------------

BombosSpell_FinishFireColumns:
#_08B236: PHX

#_08B237: LDA.w $0C54,X
#_08B23A: TAX
#_08B23B: LDY.b #$00

.next_column
#_08B23D: LDA.l $7F5800,X
#_08B241: DEC A
#_08B242: STA.l $7F5800,X
#_08B246: BPL .delay

#_08B248: LDA.b #$03
#_08B24A: STA.l $7F5800,X

#_08B24E: LDA.l $7F5810,X
#_08B252: INC A
#_08B253: STA.l $7F5810,X

#_08B257: CMP.b #$0D
#_08B259: BCC .delay

#_08B25B: LDA.b #$0D
#_08B25D: STA.l $7F5810,X

.delay
#_08B261: JSR AncillaDraw_BombosFireColumn

#_08B264: DEX
#_08B265: BPL .next_column

;---------------------------------------------------------------------------------------------------

#_08B267: LDX.b #$09

.next_check
#_08B269: LDA.l $7F5810,X
#_08B26D: CMP.b #$0D
#_08B26F: BNE .found_active_column

#_08B271: DEX
#_08B272: BPL .next_check

;---------------------------------------------------------------------------------------------------

#_08B274: STZ.b $72

#_08B276: LDA.b #$02
#_08B278: STA.l $7F5934

#_08B27C: PLX

#_08B27D: PHX
#_08B27E: JSL Medallion_CheckSpriteDamage
#_08B282: PLX

#_08B283: STZ.w $0C54,X

#_08B286: RTS

;---------------------------------------------------------------------------------------------------

.found_active_column
#_08B287: PLX

#_08B288: RTS

;===================================================================================================

pool AncillaDraw_BombosFireColumn

.char
#_08B289: db $40, $FF, $FF
#_08B28C: db $42, $44, $FF
#_08B28F: db $42, $44, $FF
#_08B292: db $42, $44, $FF
#_08B295: db $42, $44, $FF
#_08B298: db $40, $46, $44
#_08B29B: db $4A, $4A, $48
#_08B29E: db $4C, $4C, $4A
#_08B2A1: db $4E, $4C, $4A
#_08B2A4: db $4E, $6A, $4C
#_08B2A7: db $4E, $68, $FF
#_08B2AA: db $6A, $FF, $FF
#_08B2AD: db $4E, $FF, $FF

;---------------------------------------------------------------------------------------------------

.prop
#_08B2B0: db $3C, $FF, $FF
#_08B2B3: db $3C, $3C, $FF
#_08B2B6: db $3C, $3C, $FF
#_08B2B9: db $7C, $7C, $FF
#_08B2BC: db $3C, $7C, $FF
#_08B2BF: db $3C, $3C, $3C
#_08B2C2: db $BC, $3C, $3C
#_08B2C5: db $7C, $3C, $3C
#_08B2C8: db $3C, $3C, $7C
#_08B2CB: db $3C, $3C, $3C
#_08B2CE: db $3C, $3C, $FF
#_08B2D1: db $3C, $FF, $FF
#_08B2D4: db $3C, $FF, $FF

;---------------------------------------------------------------------------------------------------

.offset_y
#_08B2D7: dw   0,  -1,  -1
#_08B2DD: dw   0,  -4,  -1
#_08B2E3: dw   0,  -8,  -1
#_08B2E9: dw   0, -12,  -1
#_08B2EF: dw   0, -16,  -1
#_08B2F5: dw   0,  -4, -20
#_08B2FB: dw   0,  -8, -24
#_08B301: dw   0, -12, -28
#_08B307: dw   0, -16, -32
#_08B30D: dw   0, -16, -32
#_08B313: dw -18, -34,  -1
#_08B319: dw -35,  -1,  -1
#_08B31F: dw -36,  -1,  -1

;---------------------------------------------------------------------------------------------------

.offset_x
#_08B325: dw   0,  -1,  -1
#_08B32B: dw   0,   0,  -1
#_08B331: dw   0,   0,  -1
#_08B337: dw   0,   0,  -1
#_08B33D: dw   0,   0,  -1
#_08B343: dw   0,   0,   0
#_08B349: dw   0,   0,   0
#_08B34F: dw   0,   0,   0
#_08B355: dw   0,   0,   0
#_08B35B: dw   0,   0,   0
#_08B361: dw   0,   0,  -1
#_08B367: dw   1,  -1,  -1
#_08B36D: dw   2,  -1,  -1

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_BombosFireColumn:
#_08B373: TXA
#_08B374: CLC
#_08B375: ADC.b #$00
#_08B377: STA.b $75

#_08B379: LDA.b #$10
#_08B37B: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08B37E: LDY.b #$00

.next_never
#_08B380: PHX

#_08B381: LDA.l $7F5810,X
#_08B385: CMP.b #$0D
#_08B387: BEQ .inactive

#_08B389: ASL A
#_08B38A: CLC
#_08B38B: ADC.l $7F5810,X

#_08B38F: CLC
#_08B390: ADC.b #$02
#_08B392: TAX

#_08B393: STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_object
#_08B395: LDA.w .char,X
#_08B398: CMP.b #$FF
#_08B39A: BEQ .skip

#_08B39C: PHX

#_08B39D: LDX.b $75

#_08B39F: LDA.l $7F5824,X
#_08B3A3: STA.b $00

#_08B3A5: LDA.l $7F5864,X
#_08B3A9: STA.b $01

#_08B3AB: LDA.l $7F58A4,X
#_08B3AF: STA.b $02

#_08B3B1: LDA.l $7F58E4,X
#_08B3B5: STA.b $03

#_08B3B7: PLX
#_08B3B8: PHX

#_08B3B9: TXA
#_08B3BA: ASL A
#_08B3BB: TAX

#_08B3BC: REP #$20

#_08B3BE: LDA.b $00
#_08B3C0: CLC
#_08B3C1: ADC.w .offset_y,X

#_08B3C4: SEC
#_08B3C5: SBC.b $E8
#_08B3C7: STA.b $00

#_08B3C9: LDA.b $02
#_08B3CB: CLC
#_08B3CC: ADC.w .offset_x,X

#_08B3CF: SEC
#_08B3D0: SBC.b $E2
#_08B3D2: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08B3D4: SEP #$20

#_08B3D6: JSR Ancilla_SetOAM_XY

#_08B3D9: PLX

#_08B3DA: LDA.w .char,X
#_08B3DD: STA.b ($90),Y

#_08B3DF: INY

#_08B3E0: LDA.w .prop,X
#_08B3E3: STA.b ($90),Y

#_08B3E5: INY
#_08B3E6: PHY

#_08B3E7: TYA
#_08B3E8: SEC
#_08B3E9: SBC.b #$04
#_08B3EB: LSR A
#_08B3EC: LSR A
#_08B3ED: TAY

#_08B3EE: LDA.b #$02
#_08B3F0: STA.b ($92),Y

#_08B3F2: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08B3F3: JSR Ancilla_AllocateOAMFromCustomRegion

#_08B3F6: DEX

#_08B3F7: INC.b $08

#_08B3F9: LDA.b $08
#_08B3FB: CMP.b #$03
#_08B3FD: BNE .next_object

;---------------------------------------------------------------------------------------------------

.inactive
#_08B3FF: PLX

#_08B400: LDA.b $75
#_08B402: SEC
#_08B403: SBC.b #$10
#_08B405: STA.b $75
#_08B407: BMI .exit

#_08B409: BRL .next_never

.exit
#_08B40C: RTS

;===================================================================================================

BombosSpell_ControlBlasting:
#_08B40D: PHX

#_08B40E: LDY.b #$00

#_08B410: LDA.w $0C54,X
#_08B413: STA.b $72

#_08B415: TAX

.next_blast
#_08B416: LDA.l $7F5935,X
#_08B41A: CMP.b #$08
#_08B41C: BEQ .inactive

#_08B41E: LDA.l $7F5945,X
#_08B422: DEC A
#_08B423: STA.l $7F5945,X
#_08B427: BMI .time_up

.inactive
#_08B429: BRL .just_draw

;---------------------------------------------------------------------------------------------------

.time_up
#_08B42C: LDA.b #$03
#_08B42E: STA.l $7F5945,X

#_08B432: LDA.l $7F5935,X
#_08B436: INC A
#_08B437: STA.l $7F5935,X

#_08B43B: CMP.b #$01
#_08B43D: BNE .inactive

#_08B43F: LDA.l $7F5A56
#_08B443: BNE .inactive

;---------------------------------------------------------------------------------------------------

#_08B445: PHX

#_08B446: LDA.b $72
#_08B448: CMP.b #$0F
#_08B44A: BEQ .maxed_blast

#_08B44C: LDA.b $72
#_08B44E: INC A
#_08B44F: CMP.b #$10
#_08B451: BNE .not_maxed

#_08B453: LDA.b #$0F

.not_maxed
#_08B455: STA.b $72

#_08B457: TAX

#_08B458: BRA .activate_next

;---------------------------------------------------------------------------------------------------

.maxed_blast
#_08B45A: LDX.b #$0F

.next_check
#_08B45C: LDA.l $7F5935,X
#_08B460: CMP.b #$08
#_08B462: BEQ .activate_next

#_08B464: DEX
#_08B465: BPL .next_check

;---------------------------------------------------------------------------------------------------

.activate_next
#_08B467: LDA.b #$00
#_08B469: STA.l $7F5935,X

#_08B46D: LDA.b #$03
#_08B46F: STA.l $7F5945,X

#_08B473: PHY

#_08B474: TXA
#_08B475: ASL A
#_08B476: TAY

#_08B477: LDA.b $1A
#_08B479: AND.b #$3F
#_08B47B: TAX

#_08B47C: LDA.l BombosBlastRandomPosition+0,X
#_08B480: STA.b $00
#_08B482: STZ.b $01

#_08B484: LDA.l BombosBlastRandomPosition+3,X
#_08B488: STA.b $02
#_08B48A: STZ.b $03

;---------------------------------------------------------------------------------------------------

#_08B48C: TYX

#_08B48D: REP #$20

#_08B48F: LDA.b $00
#_08B491: CLC
#_08B492: ADC.b $E8
#_08B494: STA.l $7F5955,X

#_08B498: LDA.b $02
#_08B49A: CLC
#_08B49B: ADC.b $E2
#_08B49D: STA.l $7F59D5,X

#_08B4A1: SEP #$20

#_08B4A3: LDA.l $7F59D5,X
#_08B4A7: LSR A
#_08B4A8: LSR A
#_08B4A9: LSR A
#_08B4AA: LSR A
#_08B4AB: LSR A
#_08B4AC: TAX

#_08B4AD: LDA.l AncillaPanValues,X
#_08B4B1: ORA.b #$0C ; SFX2.0C
#_08B4B3: STA.w $012E

#_08B4B6: PLY
#_08B4B7: PLX

;---------------------------------------------------------------------------------------------------

.just_draw
#_08B4B8: JSR AncillaDraw_BombosBlast

#_08B4BB: DEX
#_08B4BC: BMI .done_blasting

#_08B4BE: BRL .next_blast

;---------------------------------------------------------------------------------------------------

.done_blasting
#_08B4C1: LDX.b #$0F

.next_active_check
#_08B4C3: LDA.l $7F5935,X
#_08B4C7: CMP.b #$08
#_08B4C9: BNE .found_one

#_08B4CB: DEX
#_08B4CC: BPL .next_active_check

;---------------------------------------------------------------------------------------------------

#_08B4CE: PLX

#_08B4CF: STZ.w $0C4A,X

#_08B4D2: LDA.b #$01
#_08B4D4: STA.w $0AAA

#_08B4D7: STZ.w $0324
#_08B4DA: STZ.w $031C
#_08B4DD: STZ.w $031D

#_08B4E0: STZ.b $50

#_08B4E2: STZ.w $0FC1

#_08B4E5: LDA.b $5D
#_08B4E7: CMP.b #$1A ; LINKSTATE 1A
#_08B4E9: BEQ .link_bombosing

#_08B4EB: LDA.b #$00 ; LINKSTATE 00
#_08B4ED: STA.b $5D

#_08B4EF: STZ.b $3D

#_08B4F1: LDY.b #$00

#_08B4F3: LDA.b $3C
#_08B4F5: BEQ .sword_not_drawn

#_08B4F7: LDA.b $F0
#_08B4F9: AND.b #$80
#_08B4FB: TAY

.sword_not_drawn
#_08B4FC: STY.b $3A

.link_bombosing
#_08B4FE: STZ.b $5E
#_08B500: STZ.w $0325

#_08B503: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.found_one
#_08B505: PLX

#_08B506: LDA.b $72
#_08B508: STA.w $0C54,X

.finish_up
#_08B50B: LDA.l $7F5A55
#_08B50F: DEC A
#_08B510: STA.l $7F5A55
#_08B514: BNE .exit

#_08B516: LDA.b #$01
#_08B518: STA.l $7F5A56
#_08B51C: STA.l $7F5A55

.exit
#_08B520: RTS

;===================================================================================================

pool AncillaDraw_BombosBlast

.char
#_08B521: db $60, $FF, $FF, $FF
#_08B525: db $62, $62, $62, $62
#_08B529: db $64, $64, $64, $64
#_08B52D: db $66, $66, $66, $66
#_08B531: db $68, $68, $68, $68
#_08B535: db $68, $68, $68, $68
#_08B539: db $6A, $6A, $6A, $6A
#_08B53D: db $4E, $4E, $4E, $4E

;---------------------------------------------------------------------------------------------------

.prop
#_08B541: db $3C, $FF, $FF, $FF
#_08B545: db $3C, $7C, $BC, $FC
#_08B549: db $3C, $7C, $BC, $FC
#_08B54D: db $3C, $7C, $BC, $FC
#_08B551: db $3C, $7C, $BC, $FC
#_08B555: db $3C, $7C, $BC, $FC
#_08B559: db $3C, $7C, $BC, $FC
#_08B55D: db $3C, $7C, $BC, $FC

;---------------------------------------------------------------------------------------------------

.offset_y
#_08B561: dw  -8,  -1,  -1,  -1
#_08B569: dw -12, -12,  -4,  -4
#_08B571: dw -16, -16,   0,   0
#_08B579: dw -16, -16,   0,   0
#_08B581: dw -17, -17,   1,   1
#_08B589: dw -19, -19,   3,   3
#_08B591: dw -19, -19,   3,   3
#_08B599: dw -19, -19,   3,   3

;---------------------------------------------------------------------------------------------------

.offset_x
#_08B5A1: dw  -8,  -1,  -1,  -1
#_08B5A9: dw -12,  -4, -12,  -4
#_08B5B1: dw -16,   0, -16,   0
#_08B5B9: dw -16,   0, -16,   0
#_08B5C1: dw -17,   1, -17,   1
#_08B5C9: dw -19,   3, -19,   3
#_08B5D1: dw -19,   3, -19,   3
#_08B5D9: dw -19,   3, -19,   3

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_BombosBlast:
#_08B5E1: PHX

#_08B5E2: LDA.b #$03
#_08B5E4: STA.b $0C

#_08B5E6: PHX

#_08B5E7: TXA
#_08B5E8: ASL A
#_08B5E9: TAX

#_08B5EA: LDA.l $7F5955,X
#_08B5EE: STA.b $08

#_08B5F0: LDA.l $7F5956,X
#_08B5F4: STA.b $09

#_08B5F6: LDA.l $7F59D5,X
#_08B5FA: STA.b $0A

#_08B5FC: LDA.l $7F59D6,X
#_08B600: STA.b $0B

#_08B602: PLX

;---------------------------------------------------------------------------------------------------

#_08B603: LDA.l $7F5935,X

#_08B607: CMP.b #$08
#_08B609: BEQ .inactive

#_08B60B: LDA.b #$10
#_08B60D: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08B610: LDY.b #$00

#_08B612: LDA.l $7F5935,X
#_08B616: ASL A
#_08B617: ASL A

#_08B618: CLC
#_08B619: ADC.b #$03
#_08B61B: STA.b $73

#_08B61D: TAX

;---------------------------------------------------------------------------------------------------

.next_object
#_08B61E: LDA.w .char,X
#_08B621: CMP.b #$FF
#_08B623: BEQ .skip_object

;---------------------------------------------------------------------------------------------------

#_08B625: PHX

#_08B626: TXA
#_08B627: ASL A
#_08B628: TAX

#_08B629: REP #$20

#_08B62B: LDA.w .offset_y,X
#_08B62E: CLC
#_08B62F: ADC.b $08

#_08B631: SEC
#_08B632: SBC.b $E8
#_08B634: STA.b $00

#_08B636: LDA.w .offset_x,X
#_08B639: CLC
#_08B63A: ADC.b $0A

#_08B63C: SEC
#_08B63D: SBC.b $E2
#_08B63F: STA.b $02

#_08B641: SEP #$20

#_08B643: PLX

;---------------------------------------------------------------------------------------------------

#_08B644: JSR Ancilla_SetOAM_XY

#_08B647: LDA.w .char,X
#_08B64A: STA.b ($90),Y

#_08B64C: INY

#_08B64D: LDA.w .prop,X
#_08B650: STA.b ($90),Y

#_08B652: INY
#_08B653: PHY

#_08B654: TYA
#_08B655: SEC
#_08B656: SBC.b #$04

#_08B658: LSR A
#_08B659: LSR A
#_08B65A: TAY

#_08B65B: LDA.b #$02
#_08B65D: STA.b ($92),Y

#_08B65F: PLY

;---------------------------------------------------------------------------------------------------

.skip_object
#_08B660: JSR Ancilla_AllocateOAMFromCustomRegion

#_08B663: DEX

#_08B664: DEC.b $0C
#_08B666: BPL .next_object

;---------------------------------------------------------------------------------------------------

.inactive
#_08B668: PLX

#_08B669: RTS

;===================================================================================================

Ancilla1C_QuakeSpell:
#_08B66A: LDA.b $11
#_08B66C: BNE .only_draw

#_08B66E: LDA.w $0C54,X
#_08B671: CMP.b #$02
#_08B673: BEQ .finish_up

#_08B675: JSR QuakeSpell_ShakeScreen
#_08B678: JSR QuakeSpell_ControlBolts

#_08B67B: BRL QuakeSpell_SpreadBolts

.finish_up
#_08B67E: BRA QuakeSpell_FinishingTouches

;---------------------------------------------------------------------------------------------------

.only_draw
#_08B680: PHX

#_08B681: LDX.b #$04

#_08B683: LDA.l $7F5805,X
#_08B687: CMP.w QuakeSpellStates,X
#_08B68A: BEQ .bad_branch

#_08B68C: JSR AncillaDraw_QuakeInitialBolts

.bad_branch
#_08B68F: DEX
#_08B690: BPL .bad_branch

#_08B692: PLX

#_08B693: RTS

;---------------------------------------------------------------------------------------------------

QuakeSpell_FinishingTouches:
#_08B694: PHX

#_08B695: JSL Medallion_CheckSpriteDamage
#_08B699: JSL Prepare_ApplyRumbleToSprites

#_08B69D: PLX

#_08B69E: STZ.w $0C4A,X

#_08B6A1: LDA.b #$00 ; LINKSTATE 00
#_08B6A3: STA.b $5D

#_08B6A5: LDA.b #$01
#_08B6A7: STA.w $0AAA

#_08B6AA: STZ.w $0324
#_08B6AD: STZ.w $031C
#_08B6B0: STZ.w $031D

#_08B6B3: STZ.b $50
#_08B6B5: STZ.b $3D

#_08B6B7: STZ.w $0FC1

#_08B6BA: STZ.w $011A
#_08B6BD: STZ.w $011B
#_08B6C0: STZ.w $011C
#_08B6C3: STZ.w $011D

;---------------------------------------------------------------------------------------------------

#_08B6C6: LDA.b $8A
#_08B6C8: CMP.b #$47 ; OW 47
#_08B6CA: BNE .no_turtle_rock_trigger

#_08B6CC: LDA.l $7EF2C7
#_08B6D0: AND.b #$20
#_08B6D2: BNE .no_turtle_rock_trigger

#_08B6D4: LDY.b #$03
#_08B6D6: JSR Ancilla_CheckForEntranceTrigger
#_08B6D9: BCC .no_turtle_rock_trigger

#_08B6DB: LDA.b #$04
#_08B6DD: STA.w $04C6

#_08B6E0: STZ.b $B0
#_08B6E2: STZ.b $C8

;---------------------------------------------------------------------------------------------------

.no_turtle_rock_trigger
#_08B6E4: LDY.b #$00

#_08B6E6: LDA.b $3C
#_08B6E8: BEQ .no_sword_charge

#_08B6EA: LDA.b $F0
#_08B6EC: AND.b #$80
#_08B6EE: TAY

.no_sword_charge
#_08B6EF: STY.b $3A

#_08B6F1: STZ.b $5E
#_08B6F3: STZ.w $0325

#_08B6F6: RTS

;===================================================================================================

QuakeSpell_ShakeScreen:
#_08B6F7: REP #$20

#_08B6F9: LDA.l $7F581E
#_08B6FD: STA.w $011C

#_08B700: EOR.w #$FFFF
#_08B703: INC A
#_08B704: STA.l $7F581E

#_08B708: SEP #$20

#_08B70A: LDA.b $30
#_08B70C: CLC
#_08B70D: ADC.w $011C
#_08B710: STA.b $30

#_08B712: RTS

;===================================================================================================

QuakeSpellStates:
#_08B713: db $17, $16, $17, $16, $10

;===================================================================================================

QuakeSpell_ControlBolts:
#_08B718: PHX

#_08B719: LDA.w $0C54,X
#_08B71C: STA.l $7F580F

#_08B720: LDA.l $7F580A
#_08B724: TAX

;---------------------------------------------------------------------------------------------------

.next_bolt
#_08B725: LDA.l $7F5805,X
#_08B729: CMP.w QuakeSpellStates,X
#_08B72C: BEQ .skip

#_08B72E: LDA.l $7F5800,X
#_08B732: DEC A
#_08B733: STA.l $7F5800,X
#_08B737: BPL .just_draw

#_08B739: LDA.b #$01
#_08B73B: STA.l $7F5800,X
#_08B73F: LDA.l $7F5805,X

#_08B743: INC A
#_08B744: STA.l $7F5805,X

#_08B748: CMP.w QuakeSpellStates,X
#_08B74B: BEQ .skip

;---------------------------------------------------------------------------------------------------

#_08B74D: TXY
#_08B74E: BNE .dont_go_to_2

#_08B750: CMP.b #$02
#_08B752: BNE .dont_go_to_2

#_08B754: LDA.b #$0C ; SFX2.0C
#_08B756: JSR Ancilla_SFX2_Near

#_08B759: LDA.b #$01
#_08B75B: STA.l $7F580A

#_08B75F: BRA .just_draw

;---------------------------------------------------------------------------------------------------

.dont_go_to_2
#_08B761: CPX.b #$01
#_08B763: BNE .dont_go_to_3

#_08B765: CMP.b #$02
#_08B767: BNE .dont_go_to_3

#_08B769: LDA.b #$04
#_08B76B: STA.l $7F580A

#_08B76F: BRA .just_draw

;---------------------------------------------------------------------------------------------------

.dont_go_to_3
#_08B771: CPX.b #$04
#_08B773: BNE .just_draw

#_08B775: CMP.b #$07
#_08B777: BNE .just_draw

#_08B779: LDA.b #$01
#_08B77B: STA.l $7F580F

;---------------------------------------------------------------------------------------------------

.just_draw
#_08B77F: JSR AncillaDraw_QuakeInitialBolts

;---------------------------------------------------------------------------------------------------

.skip
#_08B782: DEX
#_08B783: BPL .next_bolt

#_08B785: PLX

#_08B786: LDA.l $7F580F
#_08B78A: STA.w $0C54,X

#_08B78D: RTS

;===================================================================================================

pool AncillaDraw_QuakeInitialBolts

.offset
#_08B78E: db $00
#_08B78F: db $18
#_08B790: db $00
#_08B791: db $18
#_08B792: db $2F

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_QuakeInitialBolts:
#_08B793: PHX

#_08B794: LDA.l $7F5805,X
#_08B798: CLC
#_08B799: ADC.w .offset,X
#_08B79C: ASL A
#_08B79D: TAY

#_08B79E: LDA.w QuakeSpell_InitialBoltPointers+0,Y
#_08B7A1: STA.b $72

#_08B7A3: LDA.w QuakeSpell_InitialBoltPointers+1,Y
#_08B7A6: STA.b $73

#_08B7A8: LDA.w QuakeSpell_InitialBoltPointers+2,Y
#_08B7AB: STA.b $74

#_08B7AD: LDA.w QuakeSpell_InitialBoltPointers+3,Y
#_08B7B0: STA.b $75

;---------------------------------------------------------------------------------------------------

#_08B7B2: REP #$20

#_08B7B4: LDA.b $74
#_08B7B6: SEC
#_08B7B7: SBC.b $72
#_08B7B9: STA.b $74

#_08B7BB: SEP #$20

#_08B7BD: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_bolt
#_08B7BF: TXY

#_08B7C0: REP #$20

#_08B7C2: LDA.b ($72),Y
#_08B7C4: AND.w #$00FF
#_08B7C7: CMP.w #$0080
#_08B7CA: BCC .positive_x

#_08B7CC: ORA.w #$FF00

.positive_x
#_08B7CF: STA.b $02

#_08B7D1: LDA.l $7F580D
#_08B7D5: CLC
#_08B7D6: ADC.b $02

#_08B7D8: SEC
#_08B7D9: SBC.b $E2
#_08B7DB: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08B7DD: INX
#_08B7DE: TXY

#_08B7DF: LDA.b ($72),Y
#_08B7E1: AND.w #$00FF
#_08B7E4: CMP.w #$0080
#_08B7E7: BCC .positive_y

#_08B7E9: ORA.w #$FF00

.positive_y
#_08B7EC: STA.b $00

#_08B7EE: LDA.l $7F580B
#_08B7F2: CLC
#_08B7F3: ADC.b $00

#_08B7F5: SEC
#_08B7F6: SBC.b $E8
#_08B7F8: STA.b $00

#_08B7FA: INX

#_08B7FB: SEP #$20

#_08B7FD: PHX

#_08B7FE: LDX.b #$F0

#_08B800: LDA.b $01
#_08B802: BNE .off_screen

#_08B804: LDA.b $03
#_08B806: BNE .off_screen

#_08B808: LDY.b #$00

#_08B80A: LDA.b $02
#_08B80C: STA.b ($90),Y

#_08B80E: LDA.b $00
#_08B810: CMP.b #$F0
#_08B812: BCS .off_screen

#_08B814: TAX

;---------------------------------------------------------------------------------------------------

.off_screen
#_08B815: INC.b $90

#_08B817: LDY.b #$00

#_08B819: TXA
#_08B81A: STA.b ($90),Y

#_08B81C: INC.b $90

#_08B81E: PLX
#_08B81F: PHX

#_08B820: TXY

#_08B821: LDA.b ($72),Y
#_08B823: AND.b #$0F
#_08B825: TAX

#_08B826: LDA.w QuakeBoltChar,X
#_08B829: LDY.b #$00
#_08B82B: STA.b ($90),Y

#_08B82D: INC.b $90

;---------------------------------------------------------------------------------------------------

#_08B82F: PLX
#_08B830: TXY

#_08B831: LDA.b ($72),Y
#_08B833: AND.b #$C0
#_08B835: ORA.b #$3C

#_08B837: LDY.b #$00
#_08B839: STA.b ($90),Y

#_08B83B: INC.b $90

#_08B83D: LDY.b #$00
#_08B83F: LDA.b #$02
#_08B841: STA.b ($92),Y

#_08B843: INC.b $92

#_08B845: INX
#_08B846: CPX.b $74
#_08B848: BEQ .done

#_08B84A: BRL .next_bolt

;---------------------------------------------------------------------------------------------------

.done
#_08B84D: PLX

#_08B84E: RTS

;===================================================================================================

QuakeSpell_SpreadBolts:
#_08B84F: LDA.w $0C54,X
#_08B852: CMP.b #$01
#_08B854: BNE .exit

#_08B856: LDA.w $0C68,X
#_08B859: BNE .proceed_to_bolts

#_08B85B: LDA.b #$02
#_08B85D: STA.w $0C68,X

#_08B860: LDA.w $0C5E,X
#_08B863: INC A
#_08B864: STA.w $0C5E,X

#_08B867: CMP.b #$37
#_08B869: BNE .proceed_to_bolts

#_08B86B: LDA.b #$02
#_08B86D: STA.w $0C54,X

.exit
#_08B870: RTS

;---------------------------------------------------------------------------------------------------

.proceed_to_bolts
#_08B871: BRA AncillaDraw_QuakeSpreadBolts

;===================================================================================================

QuakeBoltChar:
#_08B873: db $40, $42, $44, $46
#_08B877: db $48, $4A, $4C, $4E
#_08B87B: db $60, $62, $64, $66
#_08B87F: db $68, $6A, $63

;===================================================================================================

AncillaDraw_QuakeSpreadBolts:
#_08B882: PHX

#_08B883: LDA.w $0C5E,X
#_08B886: ASL A
#_08B887: TAY

#_08B888: LDA.w QuakeSpell_SpreadBoltPointers+0,Y
#_08B88B: STA.b $72

#_08B88D: LDA.w QuakeSpell_SpreadBoltPointers+1,Y
#_08B890: STA.b $73

#_08B892: LDA.w QuakeSpell_SpreadBoltPointers+2,Y
#_08B895: STA.b $74

#_08B897: LDA.w QuakeSpell_SpreadBoltPointers+3,Y
#_08B89A: STA.b $75

#_08B89C: REP #$20

#_08B89E: LDA.b $74
#_08B8A0: SEC
#_08B8A1: SBC.b $72
#_08B8A3: STA.b $74

#_08B8A5: SEP #$20

#_08B8A7: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_bolt
#_08B8A9: TXY

#_08B8AA: LDA.b ($72),Y
#_08B8AC: LDY.b #$00
#_08B8AE: STA.b ($90),Y

#_08B8B0: INC.b $90

;---------------------------------------------------------------------------------------------------

#_08B8B2: INX
#_08B8B3: TXY

#_08B8B4: LDA.b ($72),Y
#_08B8B6: LDY.b #$00
#_08B8B8: STA.b ($90),Y

#_08B8BA: INC.b $90

;---------------------------------------------------------------------------------------------------

#_08B8BC: INX
#_08B8BD: PHX
#_08B8BE: TXY

#_08B8BF: LDA.b ($72),Y
#_08B8C1: AND.b #$0F
#_08B8C3: TAX

#_08B8C4: LDA.w QuakeBoltChar,X
#_08B8C7: LDY.b #$00
#_08B8C9: STA.b ($90),Y

#_08B8CB: INC.b $90

;---------------------------------------------------------------------------------------------------

#_08B8CD: PLX
#_08B8CE: TXY

#_08B8CF: LDA.b ($72),Y
#_08B8D1: AND.b #$C0
#_08B8D3: ORA.b #$3C

#_08B8D5: LDY.b #$00

#_08B8D7: STA.b ($90),Y

#_08B8D9: INC.b $90

;---------------------------------------------------------------------------------------------------

#_08B8DB: TXY
#_08B8DC: LDA.b ($72),Y
#_08B8DE: AND.b #$30

#_08B8E0: LSR A
#_08B8E1: LSR A
#_08B8E2: LSR A
#_08B8E3: LSR A

#_08B8E4: LDY.b #$00

#_08B8E6: STA.b ($92),Y

#_08B8E8: INC.b $92

#_08B8EA: JSR Ancilla_AllocateOAMFromCustomRegion

#_08B8ED: INX
#_08B8EE: CPX.b $74
#_08B8F0: BNE .next_bolt

;---------------------------------------------------------------------------------------------------

#_08B8F2: PLX

#_08B8F3: RTS

;===================================================================================================

PowderDraw:

.anim_step
#_08B8F4: db $0D, $0E, $0F, $00, $01
#_08B8F9: db $02, $03, $04, $05, $06

#_08B8FE: db $0A, $0B, $0C, $00, $01
#_08B903: db $02, $03, $04, $05, $06

#_08B908: db $10, $11, $12, $00, $01
#_08B90D: db $02, $03, $04, $05, $06

#_08B912: db $07, $08, $09, $00, $01
#_08B917: db $02, $03, $04, $05, $06

;---------------------------------------------------------------------------------------------------

.group_offset
#_08B91C: db $00
#_08B91D: db $0A
#_08B91E: db $14
#_08B91F: db $1E

;---------------------------------------------------------------------------------------------------

.offset_y
#_08B920: dw -20, -15, -13,  -7, -18
#_08B92A: dw -13, -13, -13, -20, -13
#_08B934: dw -13,  -8, -20, -13, -13
#_08B93E: dw  -8, -19, -12, -12

#_08B946: dw  -7, -18, -11, -11,  -6
#_08B950: dw -17, -10, -10,  -5, -16
#_08B95A: dw -14, -12,  -9, -17, -14
#_08B964: dw -12,  -8, -18, -14

#_08B96C: dw -13,  -6, -33, -31, -29
#_08B976: dw -26, -28, -25, -23, -19
#_08B980: dw -22, -18, -17, -10,  -2
#_08B98A: dw   0,   2,   5,  -9

#_08B992: dw  -6,  -4,   0, -16, -12
#_08B99C: dw -11,  -4, -16, -14, -12
#_08B9A6: dw  -9, -17, -14, -12,  -8
#_08B9B0: dw -18, -14, -13,  -6

;---------------------------------------------------------------------------------------------------

.offset_x
#_08B9B8: dw  -5, -12,   2,  -9,  -7
#_08B9C2: dw -10,  -6,  -2,  -6, -12
#_08B9CC: dw   1,  -6,  -6, -12,   1
#_08B9D6: dw  -6,  -6, -12,   1

#_08B9DE: dw  -6,  -6, -12,   1,  -6
#_08B9E8: dw  -6, -12,   1,  -6, -17
#_08B9F2: dw -23, -14, -19, -11, -18
#_08B9FC: dw  -9, -13,  -4, -13

#_08BA04: dw  -1,  -8,  -3,  -9,   0
#_08BA0E: dw  -5,  -3, -10,  -1,  -5
#_08BA18: dw  -4, -13,  -1,  -8,  -3
#_08BA22: dw  -9,   0,  -5,  -3

#_08BA2A: dw -10,  -1,  -5,  -3, -13
#_08BA34: dw  -1,  -8,   9,  15,   6
#_08BA3E: dw  11,   3,  10,   1,   5
#_08BA48: dw  -4,   5,  -7,   0

;---------------------------------------------------------------------------------------------------

.char
#_08BA50: db $09, $0A, $0A, $09, $09

#_08BA55: db $09, $09, $09, $09, $09

#_08BA5A: db $09, $09, $09, $09, $09

#_08BA5F: db $09, $09, $09, $09, $09

;---------------------------------------------------------------------------------------------------

.prop
#_08BA64: db $68, $24, $A2, $28, $68
#_08BA69: db $E2, $28, $A4, $68, $E2
#_08BA6E: db $A4, $28, $22, $A4, $E8
#_08BA73: db $62, $24, $A8, $E2

#_08BA77: db $64, $28, $A2, $E4, $68
#_08BA7C: db $22, $A4, $E8, $62, $E2
#_08BA81: db $A4, $E8, $64, $E8, $A8
#_08BA86: db $E4, $62, $E4, $A8

#_08BA8A: db $E2, $68, $E2, $A4, $E8
#_08BA8F: db $64, $E8, $A8, $E4, $62
#_08BA94: db $E4, $A8, $E2, $68, $E2
#_08BA99: db $A4, $E8, $64, $E8

#_08BA9D: db $A8, $E4, $62, $E4, $A8
#_08BAA2: db $E2, $68, $E2, $A4, $E8
#_08BAA7: db $64, $E8, $A8, $E4, $62
#_08BAAC: db $E4, $A8, $E2, $68

;===================================================================================================

Ancilla1A_PowderDust:
#_08BAB0: LDA.b $11
#_08BAB2: BNE .just_draw

#_08BAB4: JSR Powder_ApplyDamageToSprites

#_08BAB7: DEC.w $03B1,X
#_08BABA: BPL .just_draw

;---------------------------------------------------------------------------------------------------

#_08BABC: LDA.b #$01
#_08BABE: STA.w $03B1,X

#_08BAC1: LDY.w $0C72,X

#_08BAC4: LDA.w PowderDraw_group_offset,Y
#_08BAC7: STA.b $00

#_08BAC9: LDA.w $0C5E,X
#_08BACC: INC A
#_08BACD: CMP.b #$0A
#_08BACF: BNE .dont_terminate

#_08BAD1: STZ.w $0C4A,X
#_08BAD4: STZ.w $0333

#_08BAD7: RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
#_08BAD8: STA.w $0C5E,X

#_08BADB: CLC
#_08BADC: ADC.b $00
#_08BADE: TAY

#_08BADF: LDA.w PowderDraw_anim_step,Y
#_08BAE2: STA.w $03C2,X

;---------------------------------------------------------------------------------------------------

.just_draw
#_08BAE5: LDA.w $0C90,X
#_08BAE8: JSR Ancilla_AllocateOAMFromRegion_B_or_E

;===================================================================================================

AncillaDraw_Powder:
#_08BAEB: JSR Ancilla_PrepOAMCoord

#_08BAEE: PHX

#_08BAEF: LDA.b $00
#_08BAF1: STA.b $06

#_08BAF3: LDA.b $01
#_08BAF5: STA.b $07

#_08BAF7: LDA.b $02
#_08BAF9: STA.b $08

#_08BAFB: LDA.b $03
#_08BAFD: STA.b $09

#_08BAFF: LDA.w $03C2,X
#_08BB02: STA.b $0C

#_08BB04: ASL A
#_08BB05: ASL A
#_08BB06: STA.b $0A

#_08BB08: ASL A
#_08BB09: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08BB0B: LDA.b #$03
#_08BB0D: STA.w $0072

#_08BB10: LDY.b #$00

.next_object
#_08BB12: LDX.b $04

#_08BB14: REP #$20

#_08BB16: LDA.b $06
#_08BB18: CLC
#_08BB19: ADC.w PowderDraw_offset_y,X
#_08BB1C: STA.b $00

#_08BB1E: LDA.b $08
#_08BB20: CLC
#_08BB21: ADC.w PowderDraw_offset_x,X
#_08BB24: STA.b $02

#_08BB26: SEP #$20

#_08BB28: JSR Ancilla_SetOAM_XY

#_08BB2B: LDX.b $0C

#_08BB2D: LDA.w PowderDraw_char,X
#_08BB30: STA.b ($90),Y

#_08BB32: INY

#_08BB33: LDX.b $0A

#_08BB35: LDA.w PowderDraw_prop,X
#_08BB38: AND.b #$CF
#_08BB3A: ORA.b $65
#_08BB3C: STA.b ($90),Y

#_08BB3E: INY
#_08BB3F: PHY

#_08BB40: TYA
#_08BB41: SEC
#_08BB42: SBC.b #$04
#_08BB44: LSR A
#_08BB45: LSR A
#_08BB46: TAY

#_08BB47: LDA.b #$00
#_08BB49: STA.b ($92),Y

#_08BB4B: PLY

#_08BB4C: INC.b $04
#_08BB4E: INC.b $04

#_08BB50: INC.b $0A

#_08BB52: DEC.b $72
#_08BB54: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08BB56: PLX

#_08BB57: RTS

;===================================================================================================

Powder_ApplyDamageToSprites:
#_08BB58: LDY.b #$0F

.next_sprite
#_08BB5A: TYA
#_08BB5B: EOR.b $1A
#_08BB5D: AND.b #$03
#_08BB5F: BNE .skip_sprite

#_08BB61: LDA.w $0DD0,Y
#_08BB64: CMP.b #$09
#_08BB66: BNE .skip_sprite

#_08BB68: LDA.w $0CD2,Y
#_08BB6B: AND.b #$20
#_08BB6D: BNE .skip_sprite

;---------------------------------------------------------------------------------------------------

#_08BB6F: JSR Ancilla_SetupBasicHitBox

#_08BB72: PHY
#_08BB73: PHX

#_08BB74: TYX
#_08BB75: JSL Sprite_SetupHitbox_long

#_08BB79: PLX
#_08BB7A: PLY

#_08BB7B: JSL CheckIfHitBoxesOverlap_long
#_08BB7F: BCC .skip_sprite

#_08BB81: LDA.w $0E20,Y
#_08BB84: CMP.b #$0B ; SPRITE 0B
#_08BB86: BNE .not_cucco_easter_egg

#_08BB88: LDA.b $1B
#_08BB8A: BEQ .not_cucco_easter_egg

#_08BB8C: LDA.w $048E ; ROOM 0101
#_08BB8F: DEC A
#_08BB90: BNE .not_cucco_easter_egg

#_08BB92: BRA .special_transform

;---------------------------------------------------------------------------------------------------

.not_cucco_easter_egg
#_08BB94: CMP.b #$0D ; SPRITE 0D
#_08BB96: BNE .not_buzz_blob

#_08BB98: LDA.w $0EB0,Y
#_08BB9B: BNE .skip_sprite

.special_transform
#_08BB9D: LDA.b #$01
#_08BB9F: STA.w $0EB0,Y

#_08BBA2: PHX
#_08BBA3: PHY

#_08BBA4: TYX
#_08BBA5: JSL Sprite_SpawnPoofGarnish

#_08BBA9: PLY
#_08BBAA: PLX

#_08BBAB: BRA .skip_sprite

;---------------------------------------------------------------------------------------------------

.not_buzz_blob
#_08BBAD: PHX
#_08BBAE: PHY

#_08BBAF: TYX

#_08BBB0: LDA.b #$0A
#_08BBB2: JSL Ancilla_CheckDamageToSprite_preset

#_08BBB6: PLY
#_08BBB7: PLX

.skip_sprite
#_08BBB8: DEY
#_08BBB9: BPL .next_sprite

#_08BBBB: RTS

;===================================================================================================

Ancilla1D_ScreenShake:
#_08BBBC: LDA.b $11
#_08BBBE: BNE .alert

#_08BBC0: DEC.w $0C5E,X
#_08BBC3: BPL .delay

#_08BBC5: STZ.w $011A
#_08BBC8: STZ.w $011B
#_08BBCB: STZ.w $011C
#_08BBCE: STZ.w $011D

#_08BBD1: STZ.w $0C4A,X

#_08BBD4: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_08BBD5: JSL DashTremor_Twiddle

#_08BBD9: LDA.b $00
#_08BBDB: STA.w $011A,Y

#_08BBDE: LDA.b $01
#_08BBE0: STA.w $011B,Y

#_08BBE3: TYA
#_08BBE4: LSR A
#_08BBE5: EOR.b #$01
#_08BBE7: TAY

#_08BBE8: LDA.w $0030,Y
#_08BBEB: CLC
#_08BBEC: ADC.b $00
#_08BBEE: STA.w $0030,Y

.alert
#_08BBF1: BRL Ancilla_SpriteAlert

;===================================================================================================

pool Ancilla1E_DashDust

.offset_y
#_08BBF4: dw  -2,   0,  -1
#_08BBFA: dw  -3,  -2,   0
#_08BC00: dw  -3,   0,  -1
#_08BC06: dw  -3,  -1,  -1
#_08BC0C: dw  -2,  -1,  -1
#_08BC12: dw  -2,   0,  -1
#_08BC18: dw  -3,  -2,   0
#_08BC1E: dw  -3,   0,  -1
#_08BC24: dw  -3,  -1,  -1
#_08BC2A: dw  -2,  -1,  -1

.offset_x
#_08BC30: dw  10,   5,  -1
#_08BC36: dw   0,  10,   5
#_08BC3C: dw   0,   5,  -1
#_08BC42: dw   0,  -1,  -1
#_08BC48: dw   9,  -1,  -1
#_08BC4E: dw  10,   5,  -1
#_08BC54: dw   0,  10,   5
#_08BC5A: dw   0,   5,  -1
#_08BC60: dw   0,  -1,  -1
#_08BC66: dw   9,  -1,  -1

.char
#_08BC6C: db $CF, $A9, $FF
#_08BC6F: db $A9, $DF, $CF
#_08BC72: db $CF, $DF, $FF
#_08BC75: db $DF, $FF, $FF
#_08BC78: db $A9, $FF, $FF
#_08BC7B: db $CF, $CF, $FF
#_08BC7E: db $CF, $DF, $CF
#_08BC81: db $CF, $DF, $FF
#_08BC84: db $DF, $FF, $FF
#_08BC87: db $CF, $FF, $FF

.offset_from_link
#_08BC8A: dw   0
#_08BC8C: dw   0
#_08BC8E: dw   4
#_08BC90: dw  -4

pool off

;---------------------------------------------------------------------------------------------------

Ancilla1E_DashDust:
#_08BC92: LDA.w $0C54,X
#_08BC95: BEQ .stationary

#_08BC97: JSL DashDust_Motive

#_08BC9B: BRA .exit

;---------------------------------------------------------------------------------------------------

.stationary
#_08BC9D: LDA.w $0C68,X
#_08BCA0: BNE .delay

#_08BCA2: LDA.b #$03
#_08BCA4: STA.w $0C68,X

#_08BCA7: LDA.w $0C5E,X
#_08BCAA: INC A
#_08BCAB: STA.w $0C5E,X

#_08BCAE: CMP.b #$05
#_08BCB0: BEQ .exit

#_08BCB2: CMP.b #$06
#_08BCB4: BNE .delay

#_08BCB6: STZ.w $0C4A,X

.exit
#_08BCB9: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_08BCBA: LDA.w $0C5E,X
#_08BCBD: CMP.b #$05
#_08BCBF: BEQ .exit

;---------------------------------------------------------------------------------------------------

#_08BCC1: JSR Ancilla_PrepOAMCoord

#_08BCC4: PHX

#_08BCC5: LDA.b $00
#_08BCC7: STA.b $06

#_08BCC9: LDA.b $01
#_08BCCB: STA.b $07

#_08BCCD: LDA.b $02
#_08BCCF: STA.b $08

#_08BCD1: LDA.b $03
#_08BCD3: STA.b $09

#_08BCD5: LDY.b $2F

#_08BCD7: LDA.w .offset_from_link+0,Y
#_08BCDA: STA.b $0C

#_08BCDC: LDA.w .offset_from_link+1,Y
#_08BCDF: STA.b $0D

#_08BCE1: LDY.b #$00

#_08BCE3: LDA.w $0351
#_08BCE6: CMP.b #$01
#_08BCE8: BNE .not_in_water

#_08BCEA: LDY.b #$05

.not_in_water
#_08BCEC: STY.b $04

#_08BCEE: LDA.w $0C5E,X
#_08BCF1: CLC
#_08BCF2: ADC.b $04
#_08BCF4: STA.b $04

#_08BCF6: ASL A
#_08BCF7: CLC
#_08BCF8: ADC.b $04
#_08BCFA: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08BCFC: LDA.b #$02
#_08BCFE: STA.b $72

#_08BD00: LDY.b #$00

.next_object
#_08BD02: LDX.b $04

#_08BD04: LDA.w .char,X
#_08BD07: CMP.b #$FF
#_08BD09: BEQ .skip_object

#_08BD0B: TXA
#_08BD0C: ASL A
#_08BD0D: TAX

#_08BD0E: REP #$20

#_08BD10: LDA.b $06
#_08BD12: CLC
#_08BD13: ADC.w .offset_y,X
#_08BD16: STA.b $00

#_08BD18: LDA.b $08
#_08BD1A: CLC
#_08BD1B: ADC.w .offset_x,X

#_08BD1E: CLC
#_08BD1F: ADC.b $0C
#_08BD21: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08BD23: SEP #$20

#_08BD25: JSR Ancilla_SetOAM_XY

#_08BD28: LDX.b $04

#_08BD2A: LDA.w .char,X
#_08BD2D: STA.b ($90),Y

#_08BD2F: INY

#_08BD30: LDA.b #$04
#_08BD32: ORA.b $65
#_08BD34: STA.b ($90),Y

#_08BD36: INY
#_08BD37: PHY

#_08BD38: TYA
#_08BD39: SEC
#_08BD3A: SBC.b #$04
#_08BD3C: LSR A
#_08BD3D: LSR A
#_08BD3E: TAY

#_08BD3F: LDA.b #$00
#_08BD41: STA.b ($92),Y

#_08BD43: PLY

;---------------------------------------------------------------------------------------------------

.skip_object
#_08BD44: INC.b $04

#_08BD46: DEC.b $72
#_08BD48: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08BD4A: PLX

#_08BD4B: RTS

;===================================================================================================

pool Hookshot

.char
#_08BD4C: db $09, $0A, $FF ; up
#_08BD4F: db $09, $0A, $FF ; down
#_08BD52: db $09, $FF, $0A ; left
#_08BD55: db $09, $FF, $0A ; right

.prop
#_08BD58: db $00, $00, $FF ; up
#_08BD5B: db $80, $80, $FF ; down
#_08BD5E: db $40, $FF, $40 ; left
#_08BD61: db $00, $FF, $00 ; right

.box_size_y
#_08BD64: dw   8 ; up
#_08BD66: dw  -9 ; down - This is larger, but does it matter?
#_08BD68: dw   0 ; left
#_08BD6A: dw   0 ; right

.box_size_x
#_08BD6C: dw   0 ; up
#_08BD6E: dw   0 ; down
#_08BD70: dw   8 ; left
#_08BD72: dw  -8 ; right

pool off

;===================================================================================================

Ancilla1F_Hookshot:
#_08BD74: LDA.b $11
#_08BD76: BNE .just_draw

#_08BD78: LDA.w $0C68,X
#_08BD7B: BNE .no_chain_sfx

#_08BD7D: LDA.b #$07
#_08BD7F: STA.w $0C68,X

#_08BD82: LDA.b #$0A ; SFX2.0A
#_08BD84: JSR Ancilla_SFX2_Pan

;---------------------------------------------------------------------------------------------------

.no_chain_sfx
#_08BD87: LDA.w $037E
#_08BD8A: BNE .just_draw

#_08BD8C: JSR Ancilla_Move_Y
#_08BD8F: JSR Ancilla_Move_X

#_08BD92: LDA.w $0C54,X
#_08BD95: BEQ Hookshot_Extending

#_08BD97: DEC.w $0C5E,X
#_08BD9A: BMI Hookshot_DeleteSelf

.just_draw
#_08BD9C: BRL AncillaDraw_Hookshot

;===================================================================================================

Hookshot_DeleteSelf:
#_08BD9F: STZ.w $0C4A,X

#_08BDA2: RTS

;===================================================================================================

Hookshot_Extending:
#_08BDA3: LDA.w $0C5E,X
#_08BDA6: INC A
#_08BDA7: STA.w $0C5E,X

#_08BDAA: CMP.b #$20
#_08BDAC: BNE .not_fully_extended

#_08BDAE: LDA.b #$01
#_08BDB0: STA.w $0C54,X

#_08BDB3: LDA.w $0C22,X
#_08BDB6: EOR.b #$FF
#_08BDB8: INC A
#_08BDB9: STA.w $0C22,X

#_08BDBC: LDA.w $0C2C,X
#_08BDBF: EOR.b #$FF
#_08BDC1: INC A
#_08BDC2: STA.w $0C2C,X

;---------------------------------------------------------------------------------------------------

.not_fully_extended
#_08BDC5: JSR Hookshot_ShouldIEvenBotherWithTiles
#_08BDC8: BCC .do_bother

#_08BDCA: BRL AncillaDraw_Hookshot

;---------------------------------------------------------------------------------------------------

.do_bother
#_08BDCD: LDA.w $0385,X
#_08BDD0: BNE .ignore_collision

#_08BDD2: LDA.w $0C54,X
#_08BDD5: BNE .ignore_collision

#_08BDD7: JSR Ancilla_CheckSpriteCollision
#_08BDDA: BCC .ignore_collision

#_08BDDC: LDA.w $0C54,X
#_08BDDF: BNE .ignore_collision

;---------------------------------------------------------------------------------------------------

#_08BDE1: LDA.b #$01
#_08BDE3: STA.w $0C54,X

#_08BDE6: LDA.w $0C22,X
#_08BDE9: EOR.b #$FF
#_08BDEB: INC A
#_08BDEC: STA.w $0C22,X

#_08BDEF: LDA.w $0C2C,X
#_08BDF2: EOR.b #$FF
#_08BDF4: INC A
#_08BDF5: STA.w $0C2C,X

#_08BDF8: BRA .ignore_collision

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_08BDFA:
#_08BDFA: BRL Hookshot_ExtraCollisionLogic_branching_here_unreachable

;---------------------------------------------------------------------------------------------------

.ignore_collision
#_08BDFD: JSL Hookshot_CheckTileCollision

#_08BE01: STZ.b $00

#_08BE03: LDA.b $1B
#_08BE05: BEQ .outdoors_ledge

#_08BE07: LDY.b #$01

#_08BE09: LDA.w $0C72,X
#_08BE0C: AND.b #$02
#_08BE0E: BNE .indoor_horizontal_ledge

#_08BE10: LDA.w $036D
#_08BE13: LSR A
#_08BE14: LSR A
#_08BE15: LSR A
#_08BE16: LSR A
#_08BE17: STA.b $00

#_08BE19: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.indoor_horizontal_ledge
#_08BE1B: LDA.w $036D,Y
#_08BE1E: ORA.b $00
#_08BE20: AND.b #$03
#_08BE22: STA.b $00

#_08BE24: BEQ .not_ledge

#_08BE26: BRA .ledge_collision

;---------------------------------------------------------------------------------------------------

.outdoors_ledge
#_08BE28: LDA.w $036E
#_08BE2B: AND.b #$03
#_08BE2D: ORA.w $036D
#_08BE30: ORA.w $0370
#_08BE33: AND.b #$33
#_08BE35: BEQ .not_ledge

;---------------------------------------------------------------------------------------------------

.ledge_collision
#_08BE37: DEC.w $0394,X
#_08BE3A: BPL .not_ledge

#_08BE3C: LDY.w $0380,X
#_08BE3F: BEQ .last_tile_passable

#_08BE41: LDA.b $00
#_08BE43: AND.b #$03
#_08BE45: BNE .hit_indoor_ledge

#_08BE47: CPY.b $76
#_08BE49: BEQ .last_tile_passable

;---------------------------------------------------------------------------------------------------

.hit_indoor_ledge
#_08BE4B: LDA.b #$02
#_08BE4D: STA.w $0394,X

#_08BE50: DEC.w $0385,X
#_08BE53: BPL .not_ledge

#_08BE55: STZ.w $0385,X

#_08BE58: BRA .not_ledge

.last_tile_passable
#_08BE5A: INC.w $0385,X

#_08BE5D: LDA.b $76
#_08BE5F: STA.w $0380,X

#_08BE62: LDA.b #$01
#_08BE64: STA.w $0394,X

;---------------------------------------------------------------------------------------------------

.not_ledge
#_08BE67: LDA.w $0385,X
#_08BE6A: BNE .just_draw_already

#_08BE6C: LDA.w $0394,X
#_08BE6F: BMI Hookshot_ExtraCollisionLogic

#_08BE71: DEC.w $0394,X

.just_draw_already
#_08BE74: BRL AncillaDraw_Hookshot

;===================================================================================================

Hookshot_ExtraCollisionLogic:
#_08BE77: LDA.b $0E

#_08BE79: LSR A
#_08BE7A: LSR A
#_08BE7B: LSR A
#_08BE7C: LSR A

#_08BE7D: ORA.b $0E
#_08BE7F: ORA.b $58
#_08BE81: ORA.b $0C
#_08BE83: AND.b #$03

#_08BE85: BEQ .no_collision

#_08BE87: LDA.w $0C54,X
#_08BE8A: BNE .no_collision

#_08BE8C: LDA.b #$01
#_08BE8E: STA.w $0C54,X

#_08BE91: LDA.w $0C22,X
#_08BE94: EOR.b #$FF
#_08BE96: INC A
#_08BE97: STA.w $0C22,X

#_08BE9A: LDA.w $0C2C,X
#_08BE9D: EOR.b #$FF
#_08BE9F: INC A
#_08BEA0: STA.w $0C2C,X

#_08BEA3: LDA.w $02F6
#_08BEA6: AND.b #$03
#_08BEA8: BNE .no_collision

;---------------------------------------------------------------------------------------------------

#_08BEAA: PHX

#_08BEAB: LDY.b #$01
#_08BEAD: LDA.b #$06 ; ANCILLA 06
#_08BEAF: JSL AncillaAdd_HookshotWallClink

#_08BEB3: PLX

#_08BEB4: LDY.b #$06 ; SFX2.06

#_08BEB6: LDA.w $02F6
#_08BEB9: AND.b #$30
#_08BEBB: BNE .key_door

#_08BEBD: LDY.b #$05 ; SFX2.05

.key_door
#_08BEBF: TYA
#_08BEC0: JSR Ancilla_SFX2_Pan

.no_collision
#_08BEC3: LDA.w $02F6
#_08BEC6: AND.b #$03
#_08BEC8: BEQ AncillaDraw_Hookshot

;---------------------------------------------------------------------------------------------------

.branching_here_unreachable
#_08BECA: LDA.w $0C5E,X
#_08BECD: CMP.b #$04
#_08BECF: BCS .dont_delete_self

#_08BED1: BRL Hookshot_DeleteSelf

.dont_delete_self
#_08BED4: LDA.b #$01
#_08BED6: STA.w $037E

#_08BED9: STX.w $039D

;===================================================================================================

AncillaDraw_Hookshot:
#_08BEDC: JSR Ancilla_PrepOAMCoord

#_08BEDF: LDA.w $0385,X
#_08BEE2: BEQ .not_max_priority

#_08BEE4: LDA.b #$30
#_08BEE6: STA.b $65

.not_max_priority
#_08BEE8: REP #$20

#_08BEEA: LDA.b $00
#_08BEEC: STA.b $04

#_08BEEE: LDA.b $02
#_08BEF0: STA.b $06

#_08BEF2: SEP #$20

#_08BEF4: PHX

#_08BEF5: LDA.w $0C72,X
#_08BEF8: STA.b $08

#_08BEFA: ASL A
#_08BEFB: CLC
#_08BEFC: ADC.b $08
#_08BEFE: STA.b $0A

#_08BF00: TAX

;---------------------------------------------------------------------------------------------------

#_08BF01: LDA.b #$02
#_08BF03: STA.b $08

#_08BF05: LDY.b #$00

.next_object
#_08BF07: LDX.b $0A

#_08BF09: LDA.w Hookshot_char,X
#_08BF0C: CMP.b #$FF
#_08BF0E: BEQ .skip

#_08BF10: JSR Ancilla_SetOAM_XY

#_08BF13: LDX.b $0A

#_08BF15: LDA.w Hookshot_char,X
#_08BF18: STA.b ($90),Y

#_08BF1A: INY

#_08BF1B: LDA.w Hookshot_prop,X
#_08BF1E: ORA.b #$02
#_08BF20: ORA.b $65
#_08BF22: STA.b ($90),Y

#_08BF24: INY
#_08BF25: PHY

#_08BF26: TYA
#_08BF27: SEC
#_08BF28: SBC.b #$04
#_08BF2A: LSR A
#_08BF2B: LSR A
#_08BF2C: TAY

#_08BF2D: LDA.b #$00
#_08BF2F: STA.b ($92),Y

#_08BF31: PLY

.skip
#_08BF32: INC.b $0A

#_08BF34: LDA.b $02
#_08BF36: CLC
#_08BF37: ADC.b #$08
#_08BF39: STA.b $02

#_08BF3B: DEC.b $08
#_08BF3D: BMI AncillaDraw_HookshotChain

;---------------------------------------------------------------------------------------------------

#_08BF3F: LDA.b $08
#_08BF41: BNE .next_object

#_08BF43: LDA.b $00
#_08BF45: CLC
#_08BF46: ADC.b #$08
#_08BF48: STA.b $00

#_08BF4A: LDA.b $06
#_08BF4C: STA.b $02

#_08BF4E: BRA .next_object

;===================================================================================================

AncillaDraw_HookshotChain:
#_08BF50: PLX
#_08BF51: PHX

#_08BF52: STZ.b $0A
#_08BF54: STZ.b $0B
#_08BF56: STZ.b $0C
#_08BF58: STZ.b $0D

#_08BF5A: LDA.w $0C5E,X
#_08BF5D: LSR A
#_08BF5E: CMP.b #$07
#_08BF60: BCC .no_scaling

#_08BF62: SEC
#_08BF63: SBC.b #$07
#_08BF65: STA.b $0A
#_08BF67: STA.b $0C

#_08BF69: LDA.b #$06

.no_scaling
#_08BF6B: STA.b $08
#_08BF6D: BNE .at_least_one_link

#_08BF6F: BRL .exit

;---------------------------------------------------------------------------------------------------

.at_least_one_link
#_08BF72: LDA.w $0C72,X
#_08BF75: AND.b #$01
#_08BF77: BEQ .up_or_left

#_08BF79: LDA.b $0A
#_08BF7B: EOR.b #$FF
#_08BF7D: INC A
#_08BF7E: STA.b $0A
#_08BF80: STA.b $0C
#_08BF82: BEQ .up_or_left

#_08BF84: LDA.b #$FF
#_08BF86: STA.b $0B
#_08BF88: STA.b $0D

.up_or_left
#_08BF8A: REP #$20

#_08BF8C: LDA.w $0C72,X
#_08BF8F: ASL A
#_08BF90: AND.w #$00FF
#_08BF93: TAX

;---------------------------------------------------------------------------------------------------

#_08BF94: LDA.w Hookshot_box_size_y,X
#_08BF97: BNE .use_actual_y

#_08BF99: LDA.b $04
#_08BF9B: CLC
#_08BF9C: ADC.w #$0004
#_08BF9F: STA.b $04

;---------------------------------------------------------------------------------------------------

.use_actual_y
#_08BFA1: LDA.w Hookshot_box_size_x,X
#_08BFA4: BNE .next_object

#_08BFA6: LDA.b $06
#_08BFA8: CLC
#_08BFA9: ADC.w #$0004
#_08BFAC: STA.b $06

#_08BFAE: SEP #$20

;---------------------------------------------------------------------------------------------------

.next_object
#_08BFB0: REP #$20

#_08BFB2: LDA.w Hookshot_box_size_y,X
#_08BFB5: BEQ .dont_add_y

#_08BFB7: CLC
#_08BFB8: ADC.b $0A

.dont_add_y
#_08BFBA: CLC
#_08BFBB: ADC.b $04
#_08BFBD: STA.b $04
#_08BFBF: STA.b $00

#_08BFC1: LDA.w Hookshot_box_size_x,X
#_08BFC4: BEQ .dont_add_x

#_08BFC6: CLC
#_08BFC7: ADC.b $0C

.dont_add_x
#_08BFC9: CLC
#_08BFCA: ADC.b $06
#_08BFCC: STA.b $06
#_08BFCE: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08BFD0: SEP #$20

#_08BFD2: JSR Hookshot_CheckProximityToLink
#_08BFD5: BCS .skip

#_08BFD7: JSR Ancilla_SetOAM_XY

#_08BFDA: LDA.b #$19
#_08BFDC: STA.b ($90),Y

#_08BFDE: INY

#_08BFDF: LDA.b $1A
#_08BFE1: AND.b #$02

#_08BFE3: ASL A
#_08BFE4: ASL A
#_08BFE5: ASL A
#_08BFE6: ASL A
#_08BFE7: ASL A
#_08BFE8: ASL A

#_08BFE9: ORA.b #$02
#_08BFEB: ORA.b $65
#_08BFED: STA.b ($90),Y

#_08BFEF: INY
#_08BFF0: PHY

#_08BFF1: TYA
#_08BFF2: SEC
#_08BFF3: SBC.b #$04
#_08BFF5: LSR A
#_08BFF6: LSR A
#_08BFF7: TAY

#_08BFF8: LDA.b #$00
#_08BFFA: STA.b ($92),Y

#_08BFFC: PLY

.skip
#_08BFFD: DEC.b $08
#_08BFFF: BPL .next_object

;---------------------------------------------------------------------------------------------------

.exit
#_08C001: PLX

#_08C002: RTS

;===================================================================================================

pool Ancilla20_Blanket

.char
#_08C003: db $0A, $0A, $0A, $0A
#_08C007: db $0C, $0C, $0A, $0A

.prop
#_08C00B: db $00, $60, $A0, $E0
#_08C00F: db $00, $60, $A0, $E0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla20_Blanket:
#_08C013: JSR Ancilla_PrepOAMCoord

#_08C016: REP #$20

#_08C018: LDA.b $00
#_08C01A: STA.b $04

#_08C01C: LDA.b $02
#_08C01E: STA.b $06
#_08C020: STA.b $08

#_08C022: SEP #$20

#_08C024: PHX

#_08C025: LDA.w $037D
#_08C028: BNE .im_awake

#_08C02A: LDA.b #$10
#_08C02C: JSL SpriteDraw_AllocateOAMFromRegionB

#_08C030: BRA .continue

.im_awake
#_08C032: LDA.b #$10
#_08C034: JSL SpriteDraw_AllocateOAMFromRegionA

;---------------------------------------------------------------------------------------------------

.continue
#_08C038: LDA.w $037D
#_08C03B: BEQ .i_sleep

#_08C03D: LDA.b #$04

.i_sleep
#_08C03F: TAX

#_08C040: LDA.b #$03
#_08C042: STA.b $0A

#_08C044: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_object
#_08C046: JSR Ancilla_SetOAM_XY

#_08C049: LDA.w .char,X
#_08C04C: STA.b ($90),Y

#_08C04E: INY

#_08C04F: LDA.w .prop,X
#_08C052: ORA.b #$0D
#_08C054: ORA.b $65
#_08C056: STA.b ($90),Y

#_08C058: INY
#_08C059: PHY

#_08C05A: TYA
#_08C05B: SEC
#_08C05C: SBC.b #$04
#_08C05E: LSR A
#_08C05F: LSR A
#_08C060: TAY

#_08C061: LDA.b #$02
#_08C063: STA.b ($92),Y

#_08C065: PLY

#_08C066: INX

#_08C067: REP #$20

#_08C069: LDA.b $06
#_08C06B: CLC
#_08C06C: ADC.w #$0010
#_08C06F: STA.b $02

#_08C071: SEP #$20

#_08C073: DEC.b $0A
#_08C075: BMI .exit

#_08C077: LDA.b $0A
#_08C079: CMP.b #$01
#_08C07B: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08C07D: REP #$20

#_08C07F: LDA.b $06
#_08C081: STA.b $02

#_08C083: LDA.b $04
#_08C085: CLC
#_08C086: ADC.w #$0008
#_08C089: STA.b $00

#_08C08B: SEP #$20

#_08C08D: BRA .next_object

;---------------------------------------------------------------------------------------------------

.exit
#_08C08F: PLX

#_08C090: RTS

;===================================================================================================

pool Ancilla21_Snore

.char
#_08C091: db $44, $43, $42

pool off

;---------------------------------------------------------------------------------------------------

Ancilla21_Snore:
#_08C094: DEC.w $03B1,X
#_08C097: BPL .delay

#_08C099: LDA.w $0C5E,X
#_08C09C: INC A
#_08C09D: CMP.b #$03
#_08C09F: BEQ .fully_zeed

#_08C0A1: STA.w $0C5E,X

.fully_zeed
#_08C0A4: LDA.b #$07
#_08C0A6: STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.delay
#_08C0A9: LDA.w $0C2C,X
#_08C0AC: CLC
#_08C0AD: ADC.w $0C54,X
#_08C0B0: STA.w $0C2C,X
#_08C0B3: BPL .positive_x

#_08C0B5: EOR.b #$FF
#_08C0B7: INC A

.positive_x
#_08C0B8: CMP.b #$08
#_08C0BA: BCC .dont_invert

#_08C0BC: LDA.w $0C54,X
#_08C0BF: EOR.b #$FF
#_08C0C1: INC A
#_08C0C2: STA.w $0C54,X

.dont_invert
#_08C0C5: JSR Ancilla_Move_Y
#_08C0C8: JSR Ancilla_Move_X

#_08C0CB: LDA.w $0BFA,X
#_08C0CE: STA.b $00

#_08C0D0: LDA.w $0C0E,X
#_08C0D3: STA.b $01

;---------------------------------------------------------------------------------------------------

#_08C0D5: REP #$20

#_08C0D7: LDA.b $20
#_08C0D9: SEC
#_08C0DA: SBC.w #$0018
#_08C0DD: CMP.b $00
#_08C0DF: BCC .dont_delete_me

#_08C0E1: SEP #$20

#_08C0E3: STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

.dont_delete_me
#_08C0E6: SEP #$20

#_08C0E8: LDY.w $0C5E,X

#_08C0EB: LDA.w .char,Y
#_08C0EE: STA.w $0109

#_08C0F1: JSR Ancilla_PrepOAMCoord

#_08C0F4: LDY.b #$00
#_08C0F6: JSR Ancilla_SetOAM_XY

#_08C0F9: LDA.b #$09
#_08C0FB: STA.b ($90),Y

#_08C0FD: INY

#_08C0FE: LDA.b #$24
#_08C100: STA.b ($90),Y

#_08C102: LDA.b #$00
#_08C104: STA.b ($92)

#_08C106: RTS

;===================================================================================================

pool Ancilla3B_SwordUpSparkle

.offset_y
#_08C107: dw  -7,   0,   0,   0
#_08C10F: dw -11, -11,  -3,  -3
#_08C117: dw  -7,  -7,   0,   0
#_08C11F: dw  -7,   0,   0,   0

.offset_x
#_08C127: dw  16,   0,   0,   0
#_08C12F: dw   8,  16,   8,  16
#_08C137: dw   9,  15,   0,   0
#_08C13F: dw  12,   0,   0,   0

.char
#_08C147: db $92, $FF, $FF, $FF
#_08C14B: db $93, $93, $93, $93
#_08C14F: db $F9, $F9, $FF, $FF
#_08C153: db $80, $FF, $FF, $FF

.prop
#_08C157: db $00, $FF, $FF, $FF
#_08C15B: db $00, $40, $80, $C0
#_08C15F: db $00, $40, $FF, $FF
#_08C163: db $00, $FF, $FF, $FF

pool off

;---------------------------------------------------------------------------------------------------

Ancilla3B_SwordUpSparkle:
#_08C167: LDA.w $03B1,X
#_08C16A: BNE .delay

#_08C16C: DEC.w $039F,X
#_08C16F: BPL .active

#_08C171: LDA.b #$01
#_08C173: STA.w $039F,X

#_08C176: INC.w $0C5E,X

#_08C179: LDA.w $0C5E,X
#_08C17C: CMP.b #$04
#_08C17E: BNE .active

#_08C180: STZ.w $0C4A,X

.delay
#_08C183: DEC.w $03B1,X

#_08C186: RTS

;---------------------------------------------------------------------------------------------------

.active
#_08C187: PHX

#_08C188: JSR Ancilla_PrepOAMCoord

#_08C18B: LDA.b #$03
#_08C18D: STA.b $06

#_08C18F: LDA.w $0C5E,X
#_08C192: ASL A
#_08C193: ASL A
#_08C194: TAX

;---------------------------------------------------------------------------------------------------

#_08C195: LDY.b #$00

.next_object
#_08C197: LDA.w .char,X
#_08C19A: CMP.b #$FF
#_08C19C: BEQ .skip

#_08C19E: REP #$20

#_08C1A0: PHX

#_08C1A1: TXA
#_08C1A2: ASL A
#_08C1A3: TAX

#_08C1A4: LDA.b $20
#_08C1A6: CLC
#_08C1A7: ADC.w .offset_y,X
#_08C1AA: SEC
#_08C1AB: SBC.b $E8
#_08C1AD: STA.b $00

#_08C1AF: LDA.b $22
#_08C1B1: CLC
#_08C1B2: ADC.w .offset_x,X
#_08C1B5: SEC
#_08C1B6: SBC.b $E2
#_08C1B8: STA.b $02

#_08C1BA: PLX

;---------------------------------------------------------------------------------------------------

#_08C1BB: SEP #$20

#_08C1BD: JSR Ancilla_SetOAM_XY

#_08C1C0: LDA.w .char,X
#_08C1C3: STA.b ($90),Y

#_08C1C5: INY

#_08C1C6: LDA.w .prop,X
#_08C1C9: ORA.b #$04
#_08C1CB: ORA.b $65
#_08C1CD: STA.b ($90),Y

#_08C1CF: INY
#_08C1D0: PHY

#_08C1D1: TYA
#_08C1D2: SEC
#_08C1D3: SBC.b #$04
#_08C1D5: LSR A
#_08C1D6: LSR A
#_08C1D7: TAY

#_08C1D8: LDA.b #$00
#_08C1DA: STA.b ($92),Y

#_08C1DC: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08C1DD: INX

#_08C1DE: DEC.b $06
#_08C1E0: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08C1E2: PLX

#_08C1E3: RTS

;===================================================================================================

pool Ancilla3C_SpinAttackChargeSparkle

.char
#_08C1E4: db $B7, $80, $83

.prop
#_08C1E7: db $04, $04, $84

pool off

;---------------------------------------------------------------------------------------------------

Ancilla3C_SpinAttackChargeSparkle:
#_08C1EA: LDA.b $11
#_08C1EC: BNE .continue

#_08C1EE: LDA.w $0C68,X
#_08C1F1: BNE .continue

#_08C1F3: LDA.b #$04
#_08C1F5: STA.w $0C68,X

#_08C1F8: INC.w $0C5E,X

#_08C1FB: LDA.w $0C5E,X
#_08C1FE: CMP.b #$03
#_08C200: BNE .continue

#_08C202: STZ.w $0C4A,X

#_08C205: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_08C206: PHX

#_08C207: LDA.b #$04
#_08C209: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08C20C: TYA
#_08C20D: STA.w $0C86,X

#_08C210: JSR Ancilla_PrepOAMCoord

#_08C213: LDA.w $0C5E,X
#_08C216: TAX

#_08C217: LDY.b #$00
#_08C219: JSR Ancilla_SetOAM_XY

#_08C21C: LDA.w .char,X

#_08C21F: STA.b ($90),Y

#_08C221: INY

#_08C222: LDA.w .prop,X
#_08C225: ORA.b $65
#_08C227: STA.b ($90),Y

#_08C229: LDA.b #$00
#_08C22B: STA.b ($92)

#_08C22D: PLX

#_08C22E: RTS

;===================================================================================================

pool Ancilla35_MasterSwordReceipt

.offset_y
#_08C22F: dw   1,   1,   9,   9
#_08C237: dw   1,   1,   9,   9

.offset_x
#_08C23F: dw  -1,   8,  -1,   8
#_08C247: dw   0,   7,   0,   7

.char
#_08C24F: db $86, $86, $96, $96
#_08C253: db $87, $87, $97, $97

.prop
#_08C257: db $01, $41, $01, $41
#_08C25B: db $01, $41, $01, $41

pool off

;---------------------------------------------------------------------------------------------------

Ancilla35_MasterSwordReceipt:
#_08C25F: LDA.w $0C68,X
#_08C262: BNE .stay_around

#_08C264: STZ.w $0C4A,X

#_08C267: RTS

.stay_around
#_08C268: DEC.w $03B1,X
#_08C26B: BPL .delay

#_08C26D: LDA.w $0C5E,X
#_08C270: INC A
#_08C271: CMP.b #$03
#_08C273: BNE .no_wrap

#_08C275: LDA.b #$00

.no_wrap
#_08C277: STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.delay
#_08C27A: JSR Ancilla_PrepOAMCoord

#_08C27D: REP #$20

#_08C27F: LDA.b $00
#_08C281: STA.b $04

#_08C283: LDA.b $02
#_08C285: STA.b $06

#_08C287: SEP #$20

#_08C289: PHX

#_08C28A: STZ.b $08

#_08C28C: LDA.w $0C5E,X
#_08C28F: BEQ .no_draw

#_08C291: DEC A
#_08C292: ASL A
#_08C293: ASL A
#_08C294: TAX

;---------------------------------------------------------------------------------------------------

#_08C295: LDY.b #$00

.next_object
#_08C297: PHX

#_08C298: TXA
#_08C299: ASL A
#_08C29A: TAX

#_08C29B: REP #$20

#_08C29D: LDA.b $04
#_08C29F: CLC
#_08C2A0: ADC.w .offset_y,X
#_08C2A3: STA.b $00

#_08C2A5: LDA.b $06
#_08C2A7: CLC
#_08C2A8: ADC.w .offset_x,X
#_08C2AB: STA.b $02

#_08C2AD: SEP #$20

#_08C2AF: PLX

#_08C2B0: JSR Ancilla_SetOAM_XY

#_08C2B3: LDA.w .char,X
#_08C2B6: STA.b ($90),Y

#_08C2B8: INY

#_08C2B9: LDA.w .prop,X
#_08C2BC: AND.b #$CF
#_08C2BE: ORA.b #$04
#_08C2C0: ORA.b $65
#_08C2C2: STA.b ($90),Y

#_08C2C4: INY
#_08C2C5: PHY

#_08C2C6: TYA
#_08C2C7: SEC
#_08C2C8: SBC.b #$04
#_08C2CA: LSR A
#_08C2CB: LSR A
#_08C2CC: TAY

#_08C2CD: LDA.b #$00
#_08C2CF: STA.b ($92),Y

#_08C2D1: PLY

#_08C2D2: INX

#_08C2D3: INC.b $08

#_08C2D5: LDA.b $08
#_08C2D7: CMP.b #$04
#_08C2D9: BNE .next_object

;---------------------------------------------------------------------------------------------------

.no_draw
#_08C2DB: PLX

#_08C2DC: RTS

;===================================================================================================

pool Ancilla22_ItemReceipt ItemReceipt

.message
#_08C2DD: dw $FFFF ; FIGHTER SWORD
#_08C2DF: dw $0070 ; MASTER SWORD              - MESSAGE 0070
#_08C2E1: dw $0077 ; TEMPERED SWORD            - MESSAGE 0077
#_08C2E3: dw $0052 ; BUTTER SWORD              - MESSAGE 0052 - WRONG MESSAGE
#_08C2E5: dw $FFFF ; FIGHTER SHIELD
#_08C2E7: dw $0078 ; FIRE SHIELD               - MESSAGE 0078 - WRONG MESSAGE
#_08C2E9: dw $0078 ; MIRROR SHIELD             - MESSAGE 0078
#_08C2EB: dw $0062 ; FIRE ROD                  - MESSAGE 0062
#_08C2ED: dw $0061 ; ICE ROD                   - MESSAGE 0061
#_08C2EF: dw $0066 ; HAMMER                    - MESSAGE 0066
#_08C2F1: dw $0069 ; HOOKSHOT                  - MESSAGE 0069
#_08C2F3: dw $0053 ; BOW                       - MESSAGE 0053
#_08C2F5: dw $0052 ; BOOMERANG                 - MESSAGE 0052
#_08C2F7: dw $0056 ; POWDER                    - MESSAGE 0056
#_08C2F9: dw $FFFF ; BOTTLE REFILL (BEE)
#_08C2FB: dw $0064 ; BOMBOS                    - MESSAGE 0064
#_08C2FD: dw $0063 ; ETHER                     - MESSAGE 0063
#_08C2FF: dw $0065 ; QUAKE                     - MESSAGE 0065
#_08C301: dw $0051 ; LAMP                      - MESSAGE 0051
#_08C303: dw $0054 ; SHOVEL                    - MESSAGE 0054
#_08C305: dw $0067 ; FLUTE                     - MESSAGE 0067
#_08C307: dw $0068 ; SOMARIA                   - MESSAGE 0068
#_08C309: dw $006B ; BOTTLE                    - MESSAGE 006B
#_08C30B: dw $0077 ; HEART PIECE               - MESSAGE 0077 - WRONG MESSAGE
#_08C30D: dw $0079 ; BYRNA                     - MESSAGE 0079
#_08C30F: dw $0055 ; CAPE                      - MESSAGE 0055
#_08C311: dw $006E ; MIRROR                    - MESSAGE 006E
#_08C313: dw $0058 ; GLOVE                     - MESSAGE 0058
#_08C315: dw $006D ; MITTS                     - MESSAGE 006D
#_08C317: dw $005D ; BOOK                      - MESSAGE 005D
#_08C319: dw $0057 ; FLIPPERS                  - MESSAGE 0057
#_08C31B: dw $005E ; PEARL                     - MESSAGE 005E
#_08C31D: dw $FFFF ; CRYSTAL
#_08C31F: dw $0074 ; NET                       - MESSAGE 0074
#_08C321: dw $0075 ; BLUE MAIL                 - MESSAGE 0075
#_08C323: dw $0076 ; RED MAIL                  - MESSAGE 0076
#_08C325: dw $FFFF ; SMALL KEY
#_08C327: dw $005F ; COMPASS                   - MESSAGE 005F
#_08C329: dw $0158 ; HEART CONTAINER FROM 4/4  - MESSAGE 0158
#_08C32B: dw $FFFF ; BOMB
#_08C32D: dw $006A ; 3 BOMBS                   - MESSAGE 006A
#_08C32F: dw $005C ; MUSHROOM                  - MESSAGE 005C
#_08C331: dw $008F ; RED BOOMERANG             - MESSAGE 008F
#_08C333: dw $0071 ; FULL BOTTLE (RED)         - MESSAGE 0071
#_08C335: dw $0072 ; FULL BOTTLE (GREEN)       - MESSAGE 0072
#_08C337: dw $0073 ; FULL BOTTLE (BLUE)        - MESSAGE 0073
#_08C339: dw $0071 ; POTION REFILL (RED)       - MESSAGE 0071
#_08C33B: dw $0072 ; POTION REFILL (GREEN)     - MESSAGE 0072
#_08C33D: dw $0073 ; POTION REFILL (BLUE)      - MESSAGE 0073
#_08C33F: dw $006A ; 10 BOMBS                  - MESSAGE 006A
#_08C341: dw $006C ; BIG KEY                   - MESSAGE 006C
#_08C343: dw $0060 ; MAP                       - MESSAGE 0060
#_08C345: dw $FFFF ; 1 RUPEE
#_08C347: dw $FFFF ; 5 RUPEES
#_08C349: dw $FFFF ; 20 RUPEES
#_08C34B: dw $0059 ; GREEN PENDANT             - MESSAGE 0059
#_08C34D: dw $0084 ; BLUE PENDANT              - MESSAGE 0084
#_08C34F: dw $005A ; RED PENDANT               - MESSAGE 005A
#_08C351: dw $FFFF ; TOSSED BOW
#_08C353: dw $FFFF ; SILVERS
#_08C355: dw $FFFF ; FULL BOTTLE (BEE)
#_08C357: dw $FFFF ; FULL BOTTLE (FAIRY)
#_08C359: dw $FFFF ; BOSS HC
#_08C35B: dw $0159 ; SANC HC                   - MESSAGE 0159
#_08C35D: dw $FFFF ; 100 RUPEES
#_08C35F: dw $FFFF ; 50 RUPEES
#_08C361: dw $FFFF ; HEART
#_08C363: dw $FFFF ; ARROW
#_08C365: dw $FFFF ; 10 ARROWS
#_08C367: dw $FFFF ; SMALL MAGIC
#_08C369: dw $FFFF ; 300 RUPEES
#_08C36B: dw $FFFF ; 20 RUPEES GREEN
#_08C36D: dw $FFFF ; FULL BOTTLE (GOOD BEE)
#_08C36F: dw $00DB ; TOSSED FIGHTER SWORD      - MESSAGE 00DB
#_08C371: dw $0067 ; FLUTE (ACTIVATED)         - MESSAGE 0067
#_08C373: dw $007C ; BOOTS                     - MESSAGE 007C

;---------------------------------------------------------------------------------------------------

.animated_rupee_tiles
#_08C375: db $24, $25, $26

.animated_rupee_timers
#_08C378: db $09, $05, $05

.default_oam_props
#_08C37B: db $05, $01, $04

.heart_piece_message
#_08C37E: dw $FFFF
#_08C380: dw $0155 ; MESSAGE 0155
#_08C382: dw $0156 ; MESSAGE 0156
#_08C384: dw $0157 ; MESSAGE 0157

.pendant_message
#_08C386: dw $005B ; MESSAGE 005B
#_08C388: dw $0083 ; MESSAGE 0083

pool off

;---------------------------------------------------------------------------------------------------

Ancilla22_ItemReceipt:
#_08C38A: LDA.w $02E4
#_08C38D: CMP.b #$02
#_08C38F: BEQ .just_draw_a

#_08C391: LDA.b $11
#_08C393: BEQ .operable_submode

#_08C395: CMP.b #$2B
#_08C397: BEQ .operable_submode

#_08C399: CMP.b #$09
#_08C39B: BEQ .operable_submode

#_08C39D: CMP.b #$02
#_08C39F: BNE .just_draw_a

#_08C3A1: LDA.b #$10
#_08C3A3: STA.w $0C68,X

.just_draw_a
#_08C3A6: BRL ItemReceipt_Animate

;---------------------------------------------------------------------------------------------------

.operable_submode
#_08C3A9: INC.w $0FC1

#_08C3AC: LDA.w $0C54,X
#_08C3AF: BEQ .from_text_or_object

#_08C3B1: CMP.b #$03
#_08C3B3: BEQ .from_text_or_object

#_08C3B5: BRL .from_chest_or_sprite

;---------------------------------------------------------------------------------------------------

.from_text_or_object
#_08C3B8: LDA.w $0C5E,X

#_08C3BB: CMP.b #$01 ; ITEMGET 01
#_08C3BD: BNE .not_ms_pull

#_08C3BF: LDA.w $0C54,X
#_08C3C2: CMP.b #$02
#_08C3C4: BEQ .not_ms_pull

#_08C3C6: LDA.w $0C68,X
#_08C3C9: BEQ .delay_a

#_08C3CB: CMP.b #$11
#_08C3CD: BNE .just_draw_b

#_08C3CF: REP #$20

#_08C3D1: LDA.w #$0DF3
#_08C3D4: STA.w $02CD

#_08C3D7: SEP #$20

#_08C3D9: LDA.b #$0E ; FOLLOWER 0E
#_08C3DB: STA.l $7EF3CC

.time_up_a
#_08C3DF: BRL .time_up_b

;---------------------------------------------------------------------------------------------------

.not_ms_pull
#_08C3E2: DEC.w $03B1,X

#_08C3E5: LDA.w $03B1,X
#_08C3E8: BEQ .delay_a

#_08C3EA: CMP.b #$01 ; ITEMGET 01
#_08C3EC: BNE .just_draw_b

#_08C3EE: LDA.w $0C5E,X
#_08C3F1: CMP.b #$37 ; ITEMGET 37
#_08C3F3: BEQ .is_pendant

#_08C3F5: CMP.b #$38 ; ITEMGET 38
#_08C3F7: BEQ .is_pendant

#_08C3F9: CMP.b #$39 ; ITEMGET 39
#_08C3FB: BNE .wait_for_music

.is_pendant
#_08C3FD: LDA.w APUIO0
#_08C400: BEQ .wait_for_music

#_08C402: INC.w $03B1,X
#_08C405: BRA .just_draw_b

.wait_for_music
#_08C407: BRL .time_up_a

;---------------------------------------------------------------------------------------------------

.just_draw_b
#_08C40A: BRL ItemReceipt_Animate

;---------------------------------------------------------------------------------------------------

.delay_a
#_08C40D: LDA.w $0C5E,X
#_08C410: CMP.b #$01 ; ITEMGET 01
#_08C412: BNE .not_ms_from_text

#_08C414: LDA.w $0C54,X
#_08C417: BNE .not_ms_from_text

#_08C419: LDA.b #$05 ; SFX1.05
#_08C41B: STA.w $012D

#_08C41E: LDA.b #$02 ; SONG 02
#_08C420: STA.w $012C

.not_ms_from_text
#_08C423: LDY.b #$00 ; LINKSTATE 00

#_08C425: LDA.w $0345
#_08C428: BEQ .not_in_water

#_08C42A: LDY.b #$04 ; LINKSTATE 04

.not_in_water
#_08C42C: STY.b $5D

#_08C42E: STZ.w $02D8
#_08C431: STZ.w $02DA
#_08C434: STZ.w $037B

#_08C437: JSL Ancilla_AddRupees

;---------------------------------------------------------------------------------------------------

.check_if_hp
#_08C43B: STZ.w $02E9

#_08C43E: LDA.w $0C5E,X
#_08C441: CMP.b #$17 ; ITEMGET 17
#_08C443: BNE .not_heart_piece

#_08C445: LDA.l $7EF36B
#_08C449: BNE .not_heart_piece

#_08C44B: PHX

#_08C44C: LDY.b #$26 ; ITEMGET 26
#_08C44E: JSL Link_ReceiveItem

#_08C452: PLX

#_08C453: STZ.w $0C4A,X

#_08C456: STZ.w $0FC1

#_08C459: RTS

.not_heart_piece
#_08C45A: CMP.b #$26 ; ITEMGET 26
#_08C45C: BEQ .refill_hp

#_08C45E: CMP.b #$3F ; ITEMGET 3F
#_08C460: BEQ .refill_hp

#_08C462: CMP.b #$3E ; ITEMGET 3E
#_08C464: BNE .not_heart

#_08C466: STZ.w $02E4

#_08C469: LDA.l $7EF36C
#_08C46D: CMP.b #$A0
#_08C46F: BEQ .not_heart

#_08C471: CLC
#_08C472: ADC.b #$08
#_08C474: STA.l $7EF36C

#_08C478: LDA.l $7EF372
#_08C47C: CLC
#_08C47D: ADC.b #$08
#_08C47F: STA.l $7EF372

#_08C483: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.refill_hp
#_08C485: LDA.l $7EF36D
#_08C489: STA.b $00

#_08C48B: LDA.l $7EF36C
#_08C48F: CMP.b #$A0
#_08C491: BEQ .not_heart

#_08C493: CLC
#_08C494: ADC.b #$08
#_08C496: STA.l $7EF36C

#_08C49A: SEC
#_08C49B: SBC.b $00
#_08C49D: STA.b $00

#_08C49F: LDA.l $7EF372
#_08C4A3: CLC
#_08C4A4: ADC.b $00
#_08C4A6: STA.l $7EF372

.continue_a
#_08C4AA: LDA.b #$0D ; SFX3.0D
#_08C4AC: JSR Ancilla_SFX3_Near

#_08C4AF: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_heart
#_08C4B1: CMP.b #$42 ; ITEMGET 42
#_08C4B3: BNE .not_single_heart

#_08C4B5: LDA.l $7EF372
#_08C4B9: CLC
#_08C4BA: ADC.b #$08
#_08C4BC: STA.l $7EF372

#_08C4C0: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_single_heart
#_08C4C2: CMP.b #$45 ; ITEMGET 45
#_08C4C4: BNE .not_small_magic

#_08C4C6: LDA.l $7EF373
#_08C4CA: CLC
#_08C4CB: ADC.b #$10
#_08C4CD: STA.l $7EF373

#_08C4D1: BRA .continue_b

;---------------------------------------------------------------------------------------------------

.not_small_magic
#_08C4D3: CMP.b #$22 ; ITEMGET 22
#_08C4D5: BEQ .blue_mail

#_08C4D7: CMP.b #$23 ; ITEMGET 23
#_08C4D9: BNE .continue_b

.blue_mail
#_08C4DB: PHX

#_08C4DC: JSL Palettes_Load_LinkArmorAndGloves

#_08C4E0: PLX

;---------------------------------------------------------------------------------------------------

.continue_b
#_08C4E1: STZ.w $0C4A,X

#_08C4E4: STZ.w $0FC1

#_08C4E7: LDA.w $0C54,X
#_08C4EA: CMP.b #$03
#_08C4EC: BNE .no_victory_sequence

#_08C4EE: LDY.w $0C5E,X

#_08C4F1: CPY.w MilestoneItemReceiptIDs_ether
#_08C4F4: BEQ .no_victory_sequence

#_08C4F6: CPY.w MilestoneItemReceiptIDs_bombos
#_08C4F9: BEQ .no_victory_sequence

#_08C4FB: CPY.w MilestoneItemReceiptIDs_heart_container
#_08C4FE: BEQ .no_victory_sequence

#_08C500: CPY.w MilestoneItemReceiptIDs_crystal
#_08C503: BEQ .no_victory_sequence

#_08C505: PHA
#_08C506: PHX

#_08C507: JSL PrepareDungeonExitFromBossFight

#_08C50B: PLX
#_08C50C: PLA

.no_victory_sequence
#_08C50D: CMP.b #$02 ; ITEMGET 02
#_08C50F: BEQ .exit

#_08C511: STZ.w $02E4

.exit
#_08C514: RTS

;---------------------------------------------------------------------------------------------------

.from_chest_or_sprite
#_08C515: DEC.w $03B1,X

#_08C518: LDA.w $03B1,X
#_08C51B: BPL .delay_b

#_08C51D: BRL .check_if_hp

.delay_b
#_08C520: CMP.b #$00
#_08C522: BEQ .time_up_b

#_08C524: CMP.b #$28
#_08C526: BNE .dont_give

#_08C528: LDA.w $0C54,X
#_08C52B: CMP.b #$02
#_08C52D: BEQ .dont_give

#_08C52F: JSL Ancilla_AddRupees
#_08C533: BCS .play_rupee_sfx

#_08C535: LDA.w $0C5E,X
#_08C538: CMP.b #$17
#_08C53A: BNE .play_rupee_sfx

.dont_give
#_08C53C: BRL .skip_messaging

.play_rupee_sfx
#_08C53F: LDA.b #$0F ; SFX3.0F
#_08C541: JSR Ancilla_SFX3_Near

#_08C544: BRA .dont_give

;---------------------------------------------------------------------------------------------------

.time_up_b
#_08C546: LDA.b $1B
#_08C548: BEQ .not_a_shop

#_08C54A: REP #$20

#_08C54C: LDA.b $A0
#_08C54E: CMP.w #$00FF ; ROOM 00FF
#_08C551: BEQ .is_a_shop

#_08C553: CMP.w #$010F ; ROOM 010F
#_08C556: BEQ .is_a_shop

#_08C558: CMP.w #$0110 ; ROOM 0110
#_08C55B: BEQ .is_a_shop

#_08C55D: CMP.w #$0112 ; ROOM 0112
#_08C560: BEQ .is_a_shop

#_08C562: CMP.w #$011F ; ROOM 011F
#_08C565: BNE .not_a_shop

.is_a_shop
#_08C567: SEP #$20

#_08C569: BRA .skip_messaging

;---------------------------------------------------------------------------------------------------

.not_a_shop
#_08C56B: SEP #$20

#_08C56D: LDA.w $0C5E,X
#_08C570: CMP.b #$38 ; ITEMGET 38
#_08C572: BEQ .use_pendant_message

#_08C574: CMP.b #$39 ; ITEMGET 39
#_08C576: BNE .not_possibly_a_pendant

.use_pendant_message
#_08C578: TAY

#_08C579: LDA.l $7EF374
#_08C57D: AND.b #$07
#_08C57F: CMP.b #$07
#_08C581: BNE .fetch_message_id

#_08C583: TYA
#_08C584: SEC
#_08C585: SBC.b #$38
#_08C587: ASL A
#_08C588: TAY

#_08C589: REP #$20

#_08C58B: LDA.w .pendant_message,Y
#_08C58E: STA.w $1CF0

#_08C591: SEP #$20

#_08C593: BRA .trigger_message

;---------------------------------------------------------------------------------------------------

.not_possibly_a_pendant
#_08C595: LDA.w $0C54,X
#_08C598: CMP.b #$02
#_08C59A: BEQ ItemReceipt_Animate

#_08C59C: LDA.w $0C5E,X
#_08C59F: CMP.b #$17 ; ITEMGET 17
#_08C5A1: BNE .fetch_message_id

#_08C5A3: LDA.l $7EF36B
#_08C5A7: ASL A
#_08C5A8: TAY

#_08C5A9: REP #$20

#_08C5AB: LDA.w .heart_piece_message,Y
#_08C5AE: CMP.w #$FFFF
#_08C5B1: BEQ ItemReceipt_Animate

#_08C5B3: STA.w $1CF0

#_08C5B6: SEP #$20

#_08C5B8: BRA .trigger_message

;---------------------------------------------------------------------------------------------------

.fetch_message_id
#_08C5BA: LDA.w $0C5E,X
#_08C5BD: ASL A
#_08C5BE: TAY

#_08C5BF: REP #$20

#_08C5C1: LDA.w .message,Y
#_08C5C4: CMP.w #$FFFF
#_08C5C7: BEQ ItemReceipt_Animate

#_08C5C9: STA.w $1CF0

#_08C5CC: CMP.w #$0070 ; MESSAGE 0070
#_08C5CF: BNE .no_sfx_just_text

#_08C5D1: SEP #$20

#_08C5D3: LDA.b #$09 ; SFX1.09
#_08C5D5: STA.w $012D

.no_sfx_just_text
#_08C5D8: SEP #$20

;---------------------------------------------------------------------------------------------------

.trigger_message
#_08C5DA: JSL Interface_PrepAndDisplayMessage
#_08C5DE: BRA ItemReceipt_Animate

.skip_messaging
#_08C5E0: LDA.w $03B1,X
#_08C5E3: CMP.b #$18
#_08C5E5: BCC ItemReceipt_Animate

#_08C5E7: LDA.w $0C22,X
#_08C5EA: CLC
#_08C5EB: ADC.b #$FF
#_08C5ED: CMP.b #$F8
#_08C5EF: BCC .halt_acceleration

#_08C5F1: STA.w $0C22,X

.halt_acceleration
#_08C5F4: JSR Ancilla_Move_Y

;===================================================================================================

ItemReceipt_Animate:
#_08C5F7: SEP #$20

#_08C5F9: LDA.w $0C5E,X
#_08C5FC: CMP.b #$20
#_08C5FE: BNE .continue

#_08C600: STZ.w $029E,X

#_08C603: JSR AncillaAdd_OccasionalSparkle

#_08C606: LDA.w APUIO0
#_08C609: BNE .continue

#_08C60B: LDA.b #$1A ; SONG 1A
#_08C60D: STA.w $012C

#_08C610: BRL ItemReceipt_TransmuteToRisingCrystal

;---------------------------------------------------------------------------------------------------

.continue
#_08C613: SEP #$20

#_08C615: LDA.w $0C5E,X
#_08C618: CMP.b #$01 ; ITEMGET 01
#_08C61A: BNE .not_a_flashy_sword

#_08C61C: LDA.w ItemReceipt_default_oam_props
#_08C61F: STA.w $0BF0,X

#_08C622: LDA.w $0C54,X
#_08C625: CMP.b #$02
#_08C627: BEQ .not_a_flashy_sword

#_08C629: LDA.w $0C68,X
#_08C62C: CMP.b #$10
#_08C62E: BCC .wait_for_flashy_sword

#_08C630: DEC.w $039F,X
#_08C633: BPL .not_a_flashy_sword

#_08C635: LDA.b #$02
#_08C637: STA.w $039F,X

#_08C63A: LDA.w $03A4,X
#_08C63D: INC A
#_08C63E: CMP.b #$03
#_08C640: BNE .no_wrap_flashy_sword

.wait_for_flashy_sword
#_08C642: LDA.b #$00

.no_wrap_flashy_sword
#_08C644: STA.w $03A4,X

#_08C647: TAY

#_08C648: LDA.w ItemReceipt_default_oam_props,Y
#_08C64B: STA.w $0BF0,X

;---------------------------------------------------------------------------------------------------

.not_a_flashy_sword
#_08C64E: LDA.w $0C5E,X
#_08C651: CMP.b #$34 ; ITEMGET 34
#_08C653: BEQ .animated_rupee

#_08C655: CMP.b #$35 ; ITEMGET 35
#_08C657: BEQ .animated_rupee

#_08C659: CMP.b #$36 ; ITEMGET 36
#_08C65B: BNE .not_animating_rupee

.animated_rupee
#_08C65D: DEC.w $039F,X
#_08C660: BPL .not_animating_rupee

#_08C662: INC.w $03A4,X

#_08C665: LDA.w $03A4,X
#_08C668: CMP.b #$03
#_08C66A: BNE .no_wrap_rupee

#_08C66C: LDA.b #$00
#_08C66E: STA.w $03A4,X

.no_wrap_rupee
#_08C671: TAY

#_08C672: LDA.w ItemReceipt_animated_rupee_timers,Y
#_08C675: STA.w $039F,X

#_08C678: PHX

#_08C679: LDA.w ItemReceipt_animated_rupee_tiles,Y
#_08C67C: JSL WriteTo4BPPBuffer_at_7F4000

#_08C680: PLX

;---------------------------------------------------------------------------------------------------

.not_animating_rupee
#_08C681: JSR Ancilla_PrepOAMCoord_adjusted

#_08C684: REP #$20

#_08C686: LDA.b $00
#_08C688: CLC
#_08C689: ADC.w #$0008
#_08C68C: STA.b $08

#_08C68E: SEP #$20

;===================================================================================================

AncillaDraw_ItemReceipt:
#_08C690: PHX

#_08C691: LDA.w $0BF0,X
#_08C694: STA.b $74

#_08C696: LDA.w $0C5E,X
#_08C699: TAX

#_08C69A: LDY.b #$00
#_08C69C: JSR Ancilla_SetOAM_XY

#_08C69F: LDA.b #$24
#_08C6A1: STA.b ($90),Y

#_08C6A3: INY

#_08C6A4: LDA.l AncillaAdd_ItemReceipt_prop,X
#_08C6A8: BPL .keep_prop_a

#_08C6AA: LDA.b $74

;---------------------------------------------------------------------------------------------------

.keep_prop_a
#_08C6AC: ASL A
#_08C6AD: ORA.b #$30
#_08C6AF: STA.b ($90),Y

#_08C6B1: INY
#_08C6B2: PHY

#_08C6B3: TYA
#_08C6B4: SEC
#_08C6B5: SBC.b #$04
#_08C6B7: LSR A
#_08C6B8: LSR A
#_08C6B9: TAY

#_08C6BA: LDA.l AncillaAdd_ItemReceipt_width,X
#_08C6BE: STA.b ($92),Y

#_08C6C0: PLY

#_08C6C1: CMP.b #$02
#_08C6C3: BEQ .big_sprite

;---------------------------------------------------------------------------------------------------

#_08C6C5: REP #$20

#_08C6C7: LDA.b $08
#_08C6C9: STA.b $00

#_08C6CB: SEP #$20

#_08C6CD: JSR Ancilla_SetOAM_XY

#_08C6D0: LDA.b #$34
#_08C6D2: STA.b ($90),Y

#_08C6D4: INY

#_08C6D5: LDA.l AncillaAdd_ItemReceipt_prop,X
#_08C6D9: BPL .keep_prop_b

#_08C6DB: LDA.b $74

;---------------------------------------------------------------------------------------------------

.keep_prop_b
#_08C6DD: ASL A
#_08C6DE: ORA.b #$30
#_08C6E0: STA.b ($90),Y

#_08C6E2: INY
#_08C6E3: PHY

#_08C6E4: TYA
#_08C6E5: SEC
#_08C6E6: SBC.b #$04
#_08C6E8: LSR A
#_08C6E9: LSR A
#_08C6EA: TAY

#_08C6EB: LDA.b #$00
#_08C6ED: STA.b ($92),Y

#_08C6EF: PLY

;---------------------------------------------------------------------------------------------------

.big_sprite
#_08C6F0: PLX

#_08C6F1: RTS

;===================================================================================================

Ancilla28_WishPondItem:
#_08C6F2: LDA.b #$10
#_08C6F4: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08C6F7: LDA.b $11
#_08C6F9: BEQ .continue

#_08C6FB: BRL AncillaDraw_WishPondItem

;---------------------------------------------------------------------------------------------------

.continue
#_08C6FE: LDA.w $0C68,X
#_08C701: BNE AncillaDraw_WishPondItem

#_08C703: LDA.b #$02
#_08C705: STA.w $0309
#_08C708: STZ.w $0308

#_08C70B: LDA.w $0294,X
#_08C70E: SEC
#_08C70F: SBC.b #$02
#_08C711: STA.w $0294,X

#_08C714: JSR Ancilla_Move_Z
#_08C717: JSR Ancilla_Move_Y
#_08C71A: JSR Ancilla_Move_X

#_08C71D: LDA.w $029E,X
#_08C720: BPL AncillaDraw_WishPondItem

#_08C722: CMP.b #$E4
#_08C724: BCS AncillaDraw_WishPondItem

#_08C726: LDA.b #$E4
#_08C728: STA.w $029E,X

#_08C72B: LDY.w $0C5E,X

#_08C72E: LDA.w $0BFA,X
#_08C731: CLC
#_08C732: ADC.b #$12
#_08C734: STA.w $0BFA,X

#_08C737: LDA.w $0C0E,X
#_08C73A: ADC.b #$00
#_08C73C: STA.w $0C0E,X

#_08C73F: LDA.b #$08
#_08C741: STA.b $00

#_08C743: LDA.w $088450,Y ; Verified nonsense
#_08C746: BNE .absolute_nonsense

#_08C748: LDA.b #$04
#_08C74A: STA.b $00

.absolute_nonsense
#_08C74C: LDA.w $0C04,X
#_08C74F: CLC
#_08C750: ADC.b $00
#_08C752: STA.w $0C04,X

#_08C755: LDA.w $0C18,X
#_08C758: ADC.b #$00
#_08C75A: STA.w $0C18,X

#_08C75D: BRL Ancilla_TransmuteToSplash

;---------------------------------------------------------------------------------------------------

AncillaDraw_WishPondItem:
#_08C760: JSR Ancilla_PrepOAMCoord_adjusted

#_08C763: LDA.w $0C5E,X
#_08C766: CMP.b #$01 ; ITEMGET 01
#_08C768: BNE .not_master_sword

#_08C76A: LDA.w ItemReceipt_default_oam_props
#_08C76D: STA.w $0BF0,X

.not_master_sword
#_08C770: REP #$20

#_08C772: LDA.w $029E,X
#_08C775: AND.w #$00FF
#_08C778: CMP.w #$0080
#_08C77B: BCC .positive

#_08C77D: ORA.w #$FF00

.positive
#_08C780: STA.b $04

#_08C782: EOR.w #$FFFF
#_08C785: INC A

#_08C786: CLC
#_08C787: ADC.b $00
#_08C789: STA.b $00
#_08C78B: STA.b $06

#_08C78D: CLC
#_08C78E: ADC.w #$0008
#_08C791: STA.b $08

;---------------------------------------------------------------------------------------------------

#_08C793: SEP #$20

#_08C795: JSR AncillaDraw_ItemReceipt

#_08C798: LDA.w $0309
#_08C79B: CMP.b #$02
#_08C79D: BNE .exit

;---------------------------------------------------------------------------------------------------

#_08C79F: LDA.w $0294,X
#_08C7A2: BMI .draw_shadow

#_08C7A4: CMP.b #$02
#_08C7A6: BCS .exit

.draw_shadow
#_08C7A8: PHX

#_08C7A9: LDA.w $0C5E,X
#_08C7AC: TAX

#_08C7AD: LDA.w $088450,X  ; Verified nonsense
#_08C7B0: TAX

#_08C7B1: REP #$20

#_08C7B3: LDA.b $06
#_08C7B5: CLC
#_08C7B6: ADC.b $04

#_08C7B8: CLC
#_08C7B9: ADC.w #$0028
#_08C7BC: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08C7BE: CPX.b #$02
#_08C7C0: BEQ .wide

#_08C7C2: LDA.b $02
#_08C7C4: CLC
#_08C7C5: ADC.w #$FFFC
#_08C7C8: STA.b $02

.wide
#_08C7CA: SEP #$20

#_08C7CC: LDA.b #$01

#_08C7CE: CPX.b #$02
#_08C7D0: BEQ .wide_shadow

#_08C7D2: LDA.b #$02

.wide_shadow
#_08C7D4: TAX

#_08C7D5: LDA.b $65
#_08C7D7: STA.b $04

#_08C7D9: JSR AncillaDraw_Shadow

#_08C7DC: PLX

;---------------------------------------------------------------------------------------------------

.exit
#_08C7DD: RTS

;===================================================================================================

Ancilla42_HappinessPondRupees:
#_08C7DE: LDA.b #$02
#_08C7E0: STA.w $0309
#_08C7E3: STZ.w $0308

#_08C7E6: LDX.b #$09

.next
#_08C7E8: LDA.l $7F586C,X
#_08C7EC: BEQ .skip

#_08C7EE: PHX
#_08C7EF: JSR HapinessPondRupees_ExecuteRupee
#_08C7F2: PLX

#_08C7F3: LDA.l $7F58AA,X
#_08C7F7: CMP.b #$02
#_08C7F9: BNE .skip

#_08C7FB: LDA.b #$00
#_08C7FD: STA.l $7F586C,X

.skip
#_08C801: DEX

#_08C802: BPL .next

;---------------------------------------------------------------------------------------------------

#_08C804: LDX.b #$09

.next_check
#_08C806: LDA.l $7F586C,X
#_08C80A: BNE .found_one

#_08C80C: DEX
#_08C80D: BPL .next_check

#_08C80F: LDX.w $0FA0

#_08C812: STZ.w $0C4A,X

#_08C815: RTS

.found_one
#_08C816: BRL Ancilla_RestoreIndex

;===================================================================================================

HapinessPondRupees_ExecuteRupee:
#_08C819: LDA.b #$10

#_08C81B: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F
#_08C81E: PHX

#_08C81F: LDY.w $0FA0

#_08C822: JSR HapinessPondRupees_GetState
#_08C825: TYX

#_08C826: LDA.w $0C54,X
#_08C829: BEQ .not_splashing

#_08C82B: LDA.b $11
#_08C82D: BNE .only_splash

#_08C82F: LDA.w $0C68,X
#_08C832: BNE .only_splash

#_08C834: LDA.b #$06
#_08C836: STA.w $0C68,X

#_08C839: INC.w $0C5E,X

#_08C83C: LDA.w $0C5E,X
#_08C83F: CMP.b #$05
#_08C841: BNE .only_splash

#_08C843: INC.w $0C54,X
#_08C846: BRL .finish_up

;---------------------------------------------------------------------------------------------------

.only_splash
#_08C849: JSR AncillaDraw_ObjectSplash

#_08C84C: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.not_splashing
#_08C84E: LDA.b $11
#_08C850: BNE .just_draw

#_08C852: LDA.w $0C68,X
#_08C855: BNE .just_draw

#_08C857: LDA.w $0294,X
#_08C85A: SEC
#_08C85B: SBC.b #$02
#_08C85D: STA.w $0294,X

#_08C860: JSR Ancilla_Move_Y
#_08C863: JSR Ancilla_Move_X
#_08C866: JSR Ancilla_Move_Z

#_08C869: LDA.w $029E,X
#_08C86C: BPL .just_draw

#_08C86E: CMP.b #$E4
#_08C870: BCS .just_draw

;---------------------------------------------------------------------------------------------------

#_08C872: LDA.b #$E4
#_08C874: STA.w $029E,X

#_08C877: LDA.w $0BFA,X
#_08C87A: CLC
#_08C87B: ADC.b #$1E
#_08C87D: STA.w $0BFA,X

#_08C880: LDA.w $0C0E,X
#_08C883: ADC.b #$00
#_08C885: STA.w $0C0E,X

#_08C888: LDA.w $0C04,X
#_08C88B: CLC
#_08C88C: ADC.b #$FC
#_08C88E: STA.w $0C04,X

#_08C891: LDA.w $0C18,X
#_08C894: ADC.b #$FF
#_08C896: STA.w $0C18,X

#_08C899: STZ.w $0C5E,X

#_08C89C: LDA.b #$06
#_08C89E: STA.w $0C68,X

#_08C8A1: LDA.b #$28 ; SFX2.28
#_08C8A3: JSR Ancilla_SFX2_Pan

#_08C8A6: INC.w $0C54,X

#_08C8A9: BRA .only_splash

;---------------------------------------------------------------------------------------------------

.just_draw
#_08C8AB: LDA.b #$02
#_08C8AD: STA.w $0BF0,X

#_08C8B0: LDA.b #$00
#_08C8B2: STA.w $0C7C,X

#_08C8B5: JSR AncillaDraw_WishPondItem

;---------------------------------------------------------------------------------------------------

.finish_up
#_08C8B8: TXY

#_08C8B9: PLX

#_08C8BA: JSR HapinessPondRupees_SaveState

#_08C8BD: RTS

;===================================================================================================

HapinessPondRupees_GetState:
#_08C8BE: LDA.l $7F5824,X
#_08C8C2: STA.w $0BFA,Y

#_08C8C5: LDA.l $7F5830,X
#_08C8C9: STA.w $0C0E,Y

#_08C8CC: LDA.l $7F583C,X
#_08C8D0: STA.w $0C04,Y

#_08C8D3: LDA.l $7F5848,X
#_08C8D7: STA.w $0C18,Y

#_08C8DA: LDA.l $7F5854,X
#_08C8DE: STA.w $029E,Y

#_08C8E1: LDA.l $7F5800,X
#_08C8E5: STA.w $0C22,Y

#_08C8E8: LDA.l $7F580C,X
#_08C8EC: STA.w $0C2C,Y

#_08C8EF: LDA.l $7F5818,X
#_08C8F3: STA.w $0294,Y

#_08C8F6: LDA.l $7F5886,X
#_08C8FA: STA.w $0C36,Y

#_08C8FD: LDA.l $7F5892,X
#_08C901: STA.w $0C40,Y

#_08C904: LDA.l $7F589E,X
#_08C908: STA.w $02A8,Y

#_08C90B: LDA.l $7F587A,X
#_08C90F: STA.w $0C5E,Y

#_08C912: LDA.l $7F58AA,X
#_08C916: STA.w $0C54,Y

#_08C919: LDA.l $7F5860,X
#_08C91D: BEQ .dont_dec

#_08C91F: DEC A

.dont_dec
#_08C920: STA.w $0C68,Y

#_08C923: RTS

;===================================================================================================

HapinessPondRupees_SaveState:
#_08C924: LDA.w $0BFA,Y
#_08C927: STA.l $7F5824,X

#_08C92B: LDA.w $0C0E,Y
#_08C92E: STA.l $7F5830,X

#_08C932: LDA.w $0C04,Y
#_08C935: STA.l $7F583C,X

#_08C939: LDA.w $0C18,Y
#_08C93C: STA.l $7F5848,X

#_08C940: LDA.w $029E,Y
#_08C943: STA.l $7F5854,X

#_08C947: LDA.w $0C22,Y
#_08C94A: STA.l $7F5800,X

#_08C94E: LDA.w $0C2C,Y
#_08C951: STA.l $7F580C,X

#_08C955: LDA.w $0294,Y
#_08C958: STA.l $7F5818,X

#_08C95C: LDA.w $0C36,Y
#_08C95F: STA.l $7F5886,X

#_08C963: LDA.w $0C40,Y
#_08C966: STA.l $7F5892,X

#_08C96A: LDA.w $02A8,Y
#_08C96D: STA.l $7F589E,X

#_08C971: LDA.w $0C5E,Y
#_08C974: STA.l $7F587A,X

#_08C978: LDA.w $0C68,Y
#_08C97B: STA.l $7F5860,X

#_08C97F: LDA.w $0C54,Y
#_08C982: STA.l $7F58AA,X

#_08C986: RTS

;===================================================================================================

pool AncillaDraw_ObjectSplash

.char
#_08C987: db $C0, $FF
#_08C989: db $E7, $FF
#_08C98B: db $AF, $BF
#_08C98D: db $80, $80
#_08C98F: db $83, $83

.prop
#_08C991: db $00, $FF
#_08C993: db $00, $FF
#_08C995: db $40, $00
#_08C997: db $40, $00
#_08C999: db $C0, $80

.offset_x
#_08C99B: dw   0,   0
#_08C99F: dw  -6,   0
#_08C9A3: dw -13,  -8
#_08C9A7: dw -17,  -4
#_08C9AB: dw -17,  -4

.offset_y
#_08C9AF: dw   0,   0
#_08C9B3: dw   0,   0
#_08C9B7: dw  11,  -3
#_08C9BB: dw  15,  -7
#_08C9BF: dw  15,  -7

.size
#_08C9C3: db $02, $FF
#_08C9C5: db $02, $FF
#_08C9C7: db $00, $00
#_08C9C9: db $00, $00
#_08C9CB: db $00, $00

pool off

;===================================================================================================

Ancilla_TransmuteToSplash:
#_08C9CD: LDA.b #$3D ; ANCILLA 3D
#_08C9CF: STA.w $0C4A,X

#_08C9D2: STZ.w $0C5E,X

#_08C9D5: LDA.b #$06
#_08C9D7: STA.w $0C68,X

#_08C9DA: LDA.w $0BFA,X
#_08C9DD: CLC
#_08C9DE: ADC.b #$0C
#_08C9E0: STA.w $0BFA,X

#_08C9E3: LDA.w $0C0E,X
#_08C9E6: ADC.b #$00
#_08C9E8: STA.w $0C0E,X

#_08C9EB: LDA.w $0C04,X
#_08C9EE: CLC
#_08C9EF: ADC.b #$F8
#_08C9F1: STA.w $0C04,X

#_08C9F4: LDA.w $0C18,X
#_08C9F7: ADC.b #$FF
#_08C9F9: STA.w $0C18,X

#_08C9FC: LDA.b #$28 ; SFX2.28
#_08C9FE: JSR Ancilla_SFX2_Pan

;===================================================================================================

Ancilla3D_ItemSplash:
#_08CA01: LDA.b #$08
#_08CA03: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08CA06: LDA.b $11
#_08CA08: BNE AncillaDraw_ObjectSplash

#_08CA0A: LDA.w $0C68,X
#_08CA0D: BNE AncillaDraw_ObjectSplash

#_08CA0F: LDA.b #$06
#_08CA11: STA.w $0C68,X

#_08CA14: INC.w $0C5E,X

#_08CA17: LDA.w $0C5E,X
#_08CA1A: CMP.b #$05
#_08CA1C: BNE AncillaDraw_ObjectSplash

#_08CA1E: STZ.w $0C4A,X

#_08CA21: RTS

;===================================================================================================

AncillaDraw_ObjectSplash:
#_08CA22: JSR Ancilla_PrepOAMCoord

#_08CA25: REP #$20

#_08CA27: LDA.b $00
#_08CA29: STA.b $04

#_08CA2B: LDA.b $02
#_08CA2D: STA.b $06

#_08CA2F: SEP #$20

#_08CA31: PHX

#_08CA32: LDY.b #$00

#_08CA34: STZ.b $0C

#_08CA36: LDA.w $0C5E,X
#_08CA39: ASL A
#_08CA3A: TAX

;---------------------------------------------------------------------------------------------------

.next
#_08CA3B: LDA.w .char,X
#_08CA3E: CMP.b #$FF
#_08CA40: BEQ .skip

#_08CA42: PHX

#_08CA43: TXA
#_08CA44: ASL A
#_08CA45: TAX

#_08CA46: REP #$20

#_08CA48: LDA.w .offset_x,X
#_08CA4B: CLC
#_08CA4C: ADC.b $04
#_08CA4E: STA.b $00

#_08CA50: LDA.w .offset_y,X
#_08CA53: CLC
#_08CA54: ADC.b $06
#_08CA56: STA.b $02

#_08CA58: SEP #$20

#_08CA5A: PLX

#_08CA5B: JSR Ancilla_SetOAM_XY

#_08CA5E: LDA.w .char,X
#_08CA61: STA.b ($90),Y

#_08CA63: INY

#_08CA64: LDA.w .prop,X
#_08CA67: ORA.b #$24
#_08CA69: STA.b ($90),Y

#_08CA6B: INY
#_08CA6C: PHY

#_08CA6D: TYA
#_08CA6E: SEC
#_08CA6F: SBC.b #$04
#_08CA71: LSR A
#_08CA72: LSR A
#_08CA73: TAY

#_08CA74: LDA.w .size,X
#_08CA77: STA.b ($92),Y

#_08CA79: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08CA7A: INX

#_08CA7B: INC.b $0C

#_08CA7D: LDA.b $0C
#_08CA7F: CMP.b #$02
#_08CA81: BNE .next

#_08CA83: PLX

#_08CA84: RTS

;===================================================================================================

MilestoneItemReceiptIDs:
.ether
#_08CA85: db $10 ; ITEMGET 10

.pendants
.green_pendant
#_08CA86: db $37 ; ITEMGET 37

.blue_pendant
#_08CA87: db $39 ; ITEMGET 39

.red_pendant
#_08CA88: db $38 ; ITEMGET 38

.heart_container
#_08CA89: db $26 ; ITEMGET 26

.bombos
#_08CA8A: db $0F ; ITEMGET 0F

.crystal
#_08CA8B: db $20 ; ITEMGET 20

;---------------------------------------------------------------------------------------------------

Ancilla29_MilestoneItemReceipt:
#_08CA8C: LDA.w $0C5E,X
#_08CA8F: CMP.w MilestoneItemReceiptIDs_ether
#_08CA92: BEQ .medallion

#_08CA94: CMP.w MilestoneItemReceiptIDs_bombos
#_08CA97: BEQ .medallion

#_08CA99: LDA.w $0403
#_08CA9C: AND.b #$40
#_08CA9E: BNE .terminate

#_08CAA0: LDA.w $0403
#_08CAA3: AND.b #$80
#_08CAA5: BEQ .exit

#_08CAA7: LDA.w $04C2
#_08CAAA: BEQ .time_up

#_08CAAC: CMP.b #$01
#_08CAAE: BNE .tick_timer

#_08CAB0: LDY.b #$23

#_08CAB2: LDA.w $0C5E,X
#_08CAB5: CMP.w MilestoneItemReceiptIDs_crystal
#_08CAB8: BNE .not_crystal

#_08CABA: LDA.b #$0F ; SFX1.0F
#_08CABC: STA.w $012D

#_08CABF: LDY.b #$28

.not_crystal
#_08CAC1: TYA
#_08CAC2: STA.b $72

#_08CAC4: PHX

#_08CAC5: JSL WriteTo4BPPBuffer_item_gfx

#_08CAC9: PLX

.tick_timer
#_08CACA: DEC.w $04C2

.exit
#_08CACD: RTS

;---------------------------------------------------------------------------------------------------

.terminate
#_08CACE: STZ.w $0C4A,X

#_08CAD1: RTS

.medallion
#_08CAD2: LDA.w $0394,X
#_08CAD5: BEQ .no_misc_palette

#_08CAD7: DEC.w $0394,X

#_08CADA: RTS

;---------------------------------------------------------------------------------------------------

.time_up
#_08CADB: LDA.w $039F,X
#_08CADE: BNE .no_misc_palette

#_08CAE0: LDA.w $0C5E,X
#_08CAE3: CMP.w MilestoneItemReceiptIDs_crystal
#_08CAE6: BNE .no_misc_palette

#_08CAE8: LDA.b #$01
#_08CAEA: STA.w $039F,X

#_08CAED: PHX

#_08CAEE: LDA.b #$04
#_08CAF0: STA.w $0AB1

#_08CAF3: LDA.b #$02
#_08CAF5: STA.w $0AA9

#_08CAF8: JSL Palettes_Load_SpriteEnvironment_Underworld

#_08CAFC: INC.b $15

#_08CAFE: PLX

;---------------------------------------------------------------------------------------------------

.no_misc_palette
#_08CAFF: LDA.w $0C5E,X
#_08CB02: CMP.w MilestoneItemReceiptIDs_crystal
#_08CB05: BNE .no_sparkle

#_08CB07: JSR AncillaAdd_OccasionalSparkle

.no_sparkle
#_08CB0A: LDA.b $11
#_08CB0C: BNE .just_draw

#_08CB0E: LDA.w $029E,X
#_08CB11: CMP.b #$18
#_08CB13: BCS .no_collision

#_08CB15: LDY.b #$02
#_08CB17: JSR Ancilla_CheckLinkCollision
#_08CB1A: BCC .no_collision

#_08CB1C: LDA.w $037E
#_08CB1F: BNE .no_collision

#_08CB21: LDA.b $4D
#_08CB23: BNE .no_collision

#_08CB25: STZ.w $0C4A,X

#_08CB28: LDA.b $5D
#_08CB2A: CMP.b #$19 ; LINKSTATE 19
#_08CB2C: BEQ .using_medallion

#_08CB2E: CMP.b #$1A ; LINKSTATE 1A
#_08CB30: BNE .not_medallion

.using_medallion
#_08CB32: STZ.w $0112
#_08CB35: STZ.w $03EF

#_08CB38: LDA.b #$00 ; LINKSTATE 00
#_08CB3A: STA.b $5D

;---------------------------------------------------------------------------------------------------

.not_medallion
#_08CB3C: LDA.b #$03
#_08CB3E: STA.w $02E9

#_08CB41: PHX

#_08CB42: LDA.w $0C5E,X
#_08CB45: TAY

#_08CB46: JSL Link_ReceiveItem

#_08CB4A: PLX

#_08CB4B: RTS

;---------------------------------------------------------------------------------------------------

.no_collision
#_08CB4C: LDA.w $0C54,X
#_08CB4F: BEQ .not_grounded

#_08CB51: CMP.b #$02
#_08CB53: BEQ .just_draw

#_08CB55: LDA.w $0294,X
#_08CB58: SEC
#_08CB59: SBC.b #$01
#_08CB5B: STA.w $0294,X

.not_grounded
#_08CB5E: JSR Ancilla_Move_Z

#_08CB61: LDA.w $029E,X
#_08CB64: CMP.b #$F8
#_08CB66: BCC .just_draw

#_08CB68: INC.w $0C54,X

#_08CB6B: LDA.b #$18
#_08CB6D: STA.w $0294,X

#_08CB70: STZ.w $029E,X

;---------------------------------------------------------------------------------------------------

.just_draw
#_08CB73: JSR Ancilla_PrepOAMCoord_adjusted

#_08CB76: REP #$20

#_08CB78: LDA.w $029E,X
#_08CB7B: AND.w #$00FF
#_08CB7E: STA.b $72

#_08CB80: LDA.b $00
#_08CB82: STA.b $06

#_08CB84: SEC
#_08CB85: SBC.b $72
#_08CB87: STA.b $00

#_08CB89: SEP #$20

#_08CB8B: JSR AncillaDraw_ItemReceipt

#_08CB8E: PHX

#_08CB8F: DEC.w $03B1,X
#_08CB92: BPL .delay_ripple

#_08CB94: LDA.b #$09
#_08CB96: STA.w $03B1,X

#_08CB99: INC.w $0385,X

#_08CB9C: LDA.w $0385,X
#_08CB9F: CMP.b #$03
#_08CBA1: BNE .delay_ripple

#_08CBA3: STZ.w $0385,X

;---------------------------------------------------------------------------------------------------

.delay_ripple
#_08CBA6: LDA.w $0385,X
#_08CBA9: STA.b $72

#_08CBAB: LDA.w $029E,X
#_08CBAE: CMP.b #$00
#_08CBB0: BNE .airborne

#_08CBB2: LDX.b #$00

#_08CBB4: LDA.b $A0
#_08CBB6: CMP.b #$06 ; ROOM 0006
#_08CBB8: BNE .no_water_draw

#_08CBBA: LDA.b $A1
#_08CBBC: CMP.b #$00
#_08CBBE: BNE .no_water_draw

#_08CBC0: LDA.b $72
#_08CBC2: CLC
#_08CBC3: ADC.b #$04
#_08CBC5: TAX

#_08CBC6: BRA .no_water_draw

.airborne
#_08CBC8: LDX.b #$01

#_08CBCA: CMP.b #$20
#_08CBCC: BCC .no_water_draw

#_08CBCE: INX

;---------------------------------------------------------------------------------------------------

.no_water_draw
#_08CBCF: REP #$20

#_08CBD1: LDA.b $06
#_08CBD3: CLC
#_08CBD4: ADC.w #$000C
#_08CBD7: STA.b $00

#_08CBD9: SEP #$20

#_08CBDB: LDA.b #$20
#_08CBDD: STA.b $04

#_08CBDF: JSR AncillaDraw_Shadow

#_08CBE2: PLX

#_08CBE3: RTS

;===================================================================================================

ItemReceipt_TransmuteToRisingCrystal:
#_08CBE4: LDA.b #$3E ; ANCILLA 3E
#_08CBE6: STA.w $0C4A,X

#_08CBE9: STZ.w $0C22,X
#_08CBEC: STZ.w $0C2C,X
#_08CBEF: STZ.w $0C36,X

;===================================================================================================

Ancilla3E_RisingCrystal:
#_08CBF2: STZ.w $029E,X

#_08CBF5: JSR AncillaAdd_OccasionalSparkle

#_08CBF8: LDA.w $0C22,X
#_08CBFB: CLC
#_08CBFC: ADC.b #$FF
#_08CBFE: CMP.b #$F0
#_08CC00: BCS .positive

#_08CC02: LDA.b #$F0

.positive
#_08CC04: STA.w $0C22,X

#_08CC07: JSR Ancilla_Move_Y

#_08CC0A: LDA.w $0BFA,X
#_08CC0D: STA.b $00

#_08CC0F: LDA.w $0C0E,X
#_08CC12: STA.b $01

#_08CC14: REP #$20

#_08CC16: LDA.b $00
#_08CC18: SEC
#_08CC19: SBC.w $0122
#_08CC1C: CMP.w #$0049
#_08CC1F: BCS .not_in_position

#_08CC21: LDA.w #$0049
#_08CC24: CLC
#_08CC25: ADC.w $0122
#_08CC28: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08CC2A: SEP #$20

#_08CC2C: LDA.b $00
#_08CC2E: STA.w $0BFA,X

#_08CC31: LDA.b $01
#_08CC33: STA.w $0C0E,X

#_08CC36: LDA.b $11
#_08CC38: BNE .not_in_position

#_08CC3A: PHX

#_08CC3B: LDA.w $040C
#_08CC3E: LSR A
#_08CC3F: TAX

#_08CC40: LDA.l $7EF37A
#_08CC44: ORA.l RoomTagPrizeChecks,X
#_08CC48: STA.l $7EF37A

#_08CC4C: LDA.b #$18
#_08CC4E: STA.b $11
#_08CC50: STZ.b $B0

;---------------------------------------------------------------------------------------------------

#_08CC52: REP #$20

#_08CC54: LDX.b #$00

#_08CC56: LDA.w #$0000 ; RGB: #000000

.next_color
#_08CC59: STA.l $7EC340,X
#_08CC5D: STA.l $7EC360,X
#_08CC61: STA.l $7EC380,X
#_08CC65: STA.l $7EC3A0,X
#_08CC69: STA.l $7EC3C0,X
#_08CC6D: STA.l $7EC3E0,X

#_08CC71: INX
#_08CC72: INX
#_08CC73: CPX.b #$20
#_08CC75: BNE .next_color

#_08CC77: STA.l $7EC007
#_08CC7B: STA.l $7EC009

;---------------------------------------------------------------------------------------------------

#_08CC7F: SEP #$20

#_08CC81: PLX

.not_in_position
#_08CC82: SEP #$20

#_08CC84: JSR Ancilla_PrepOAMCoord_adjusted

#_08CC87: REP #$20

#_08CC89: LDA.b $00
#_08CC8B: STA.b $06

#_08CC8D: SEP #$20

#_08CC8F: JSR AncillaDraw_ItemReceipt

#_08CC92: RTS

;===================================================================================================

AncillaAdd_OccasionalSparkle:
#_08CC93: LDA.b $1A
#_08CC95: AND.b #$07
#_08CC97: BNE .exit

#_08CC99: PHX

#_08CC9A: JSL AncillaAdd_SwordChargeSparkle

#_08CC9E: PLX

.exit
#_08CC9F: RTS

;===================================================================================================

Ancilla43_GanonsTowerCutscene:
#_08CCA0: LDA.w $0C54,X
#_08CCA3: BNE .not_first_state

#_08CCA5: LDA.w $0C22,X
#_08CCA8: CLC
#_08CCA9: ADC.b #$FF
#_08CCAB: CMP.b #$F0
#_08CCAD: BCS .not_max_crystal_speed

#_08CCAF: LDA.b #$F0

.not_max_crystal_speed
#_08CCB1: STA.w $0C22,X

#_08CCB4: JSR Ancilla_Move_Y

#_08CCB7: LDA.w $0BFA,X
#_08CCBA: STA.b $00

#_08CCBC: LDA.w $0C0E,X
#_08CCBF: STA.b $01

#_08CCC1: LDA.w $0C04,X
#_08CCC4: STA.b $02

#_08CCC6: LDA.w $0C18,X
#_08CCC9: STA.b $03

;---------------------------------------------------------------------------------------------------

#_08CCCB: REP #$20

#_08CCCD: LDA.b $00
#_08CCCF: SEC
#_08CCD0: SBC.w $0122

#_08CCD3: CMP.w #$0038
#_08CCD6: BCS .crystals_not_together

#_08CCD8: LDA.w #$0038
#_08CCDB: CLC
#_08CCDC: ADC.w $0122
#_08CCDF: STA.b $00

#_08CCE1: CLC
#_08CCE2: ADC.w #$0008
#_08CCE5: STA.l $7F5810

#_08CCE9: LDA.b $02
#_08CCEB: CLC
#_08CCEC: ADC.w #$0008
#_08CCEF: STA.l $7F580E

;---------------------------------------------------------------------------------------------------

#_08CCF3: SEP #$20

#_08CCF5: LDA.b $00
#_08CCF7: STA.w $0BFA,X

#_08CCFA: LDA.b $01
#_08CCFC: STA.w $0C0E,X

#_08CCFF: INC.w $0C54,X

#_08CD02: LDA.b #$05 ; SFX1.05
#_08CD04: STA.w $012D

#_08CD07: LDA.b #$F1 ; SONG F1 - fade
#_08CD09: STA.w $012C

#_08CD0C: REP #$20

#_08CD0E: LDA.w #$013B ; MESSAGE 013B
#_08CD11: STA.w $1CF0

#_08CD14: SEP #$20

#_08CD16: JSL Interface_PrepAndDisplayMessage

#_08CD1A: BRA .draw_single_crystal_prep

;---------------------------------------------------------------------------------------------------

.crystals_not_together
#_08CD1C: SEP #$20

.not_first_state
#_08CD1E: LDA.w $0C54,X
#_08CD21: CMP.b #$01
#_08CD23: BNE .not_expansive

#_08CD25: LDA.b $11
#_08CD27: BNE .not_expansive

#_08CD29: LDA.b #$10
#_08CD2B: STA.w $0C2C,X

#_08CD2E: LDA.w $0C04,X
#_08CD31: STA.b $72

#_08CD33: LDA.w $0C18,X
#_08CD36: STA.b $73

#_08CD38: LDA.l $7F5808
#_08CD3C: STA.w $0C04,X

#_08CD3F: STZ.w $0C18,X

#_08CD42: JSR Ancilla_Move_X

#_08CD45: LDA.w $0C04,X
#_08CD48: STA.l $7F5808

#_08CD4C: LDA.b $72
#_08CD4E: STA.w $0C04,X

#_08CD51: LDA.b $73
#_08CD53: STA.w $0C18,X

#_08CD56: LDA.l $7F5808
#_08CD5A: CMP.b #$30
#_08CD5C: BCC .not_expansive

#_08CD5E: LDA.b #$30
#_08CD60: STA.l $7F5808

#_08CD64: INC.w $0C54,X

;---------------------------------------------------------------------------------------------------

.not_expansive
#_08CD67: LDA.b $11
#_08CD69: BNE GTCutscene_AnimateCrystals

#_08CD6B: LDA.w $0C54,X
#_08CD6E: BNE .draw_multiple

;---------------------------------------------------------------------------------------------------

.draw_single_crystal_prep
#_08CD70: LDY.b #$00

#_08CD72: BRL GTCutscene_DrawSingleCrystal

;---------------------------------------------------------------------------------------------------

.draw_multiple
#_08CD75: CMP.b #$01
#_08CD77: BEQ GTCutscene_AnimateCrystals

#_08CD79: CMP.b #$03
#_08CD7B: BEQ .final_rotation

;---------------------------------------------------------------------------------------------------

#_08CD7D: LDA.l $7F5812
#_08CD81: DEC A
#_08CD82: STA.l $7F5812

#_08CD86: BNE GTCutscene_AnimateCrystals

#_08CD88: LDA.b #$05
#_08CD8A: STA.w $04C6

#_08CD8D: STZ.b $B0
#_08CD8F: STZ.b $C8

#_08CD91: INC.w $0C54,X

#_08CD94: BRA GTCutscene_AnimateCrystals

;---------------------------------------------------------------------------------------------------

.final_rotation
#_08CD96: LDA.b #$30
#_08CD98: STA.w $0C2C,X

#_08CD9B: LDA.w $0C04,X
#_08CD9E: STA.b $72

#_08CDA0: LDA.w $0C18,X
#_08CDA3: STA.b $73

#_08CDA5: LDA.l $7F5808
#_08CDA9: STA.w $0C04,X

#_08CDAC: STZ.w $0C18,X

#_08CDAF: JSR Ancilla_Move_X

#_08CDB2: LDA.w $0C04,X
#_08CDB5: STA.l $7F5808

#_08CDB9: LDA.b $72
#_08CDBB: STA.w $0C04,X

#_08CDBE: LDA.b $73
#_08CDC0: STA.w $0C18,X

#_08CDC3: LDA.l $7F5808
#_08CDC7: CMP.b #$F0
#_08CDC9: BCC GTCutscene_AnimateCrystals

;---------------------------------------------------------------------------------------------------

#_08CDCB: PHX

#_08CDCC: LDA.b #$00
#_08CDCE: STA.w $0AB1

#_08CDD1: LDA.b #$02
#_08CDD3: STA.w $0AA9

#_08CDD6: JSL Palettes_Load_SpriteEnvironment_Underworld

#_08CDDA: INC.b $15

#_08CDDC: PLX

#_08CDDD: STZ.w $0C4A,X

#_08CDE0: RTS

;===================================================================================================

GTCutscene_AnimateCrystals:
#_08CDE1: LDY.b #$00

#_08CDE3: LDA.w $0C54,X
#_08CDE6: STA.b $72

#_08CDE8: BEQ .sparkle_a_not

#_08CDEA: JSR GTCutscene_SparkleALot

.sparkle_a_not
#_08CDED: LDX.b #$06

.next_crystal
#_08CDEF: LDA.b $11
#_08CDF1: BNE .no_rotate

#_08CDF3: LDA.b $72
#_08CDF5: CMP.b #$01
#_08CDF7: BEQ .no_rotate

#_08CDF9: LDA.b $1A
#_08CDFB: AND.b #$01
#_08CDFD: BNE .no_rotate

#_08CDFF: LDA.l $7F5800,X
#_08CE03: INC A
#_08CE04: AND.b #$3F
#_08CE06: STA.l $7F5800,X

.no_rotate
#_08CE0A: LDA.l $7F5808
#_08CE0E: STA.b $08

#_08CE10: LDA.l $7F5800,X

#_08CE14: JSR Ancilla_GetRadialProjection

#_08CE17: REP #$20

#_08CE19: PHY

#_08CE1A: LDA.b $00
#_08CE1C: LDY.b $02
#_08CE1E: BEQ .positive_y

#_08CE20: EOR.w #$FFFF
#_08CE23: INC A

.positive_y
#_08CE24: CLC
#_08CE25: ADC.l $7F5810

#_08CE29: CLC
#_08CE2A: ADC.w #$FFF8

#_08CE2D: SEC
#_08CE2E: SBC.w $0122
#_08CE31: STA.b $00

#_08CE33: LDA.b $04

#_08CE35: LDY.b $06
#_08CE37: BEQ .positive_x

#_08CE39: EOR.w #$FFFF
#_08CE3C: INC A

.positive_x
#_08CE3D: CLC
#_08CE3E: ADC.l $7F580E

#_08CE42: CLC
#_08CE43: ADC.w #$FFF8

#_08CE46: SEC
#_08CE47: SBC.w $011E
#_08CE4A: STA.b $02

#_08CE4C: PLY

#_08CE4D: SEP #$20

#_08CE4F: LDA.b $00
#_08CE51: STA.l $7F5817,X

#_08CE55: LDA.b $01
#_08CE57: STA.l $7F581F,X

#_08CE5B: LDA.b $02
#_08CE5D: STA.l $7F5827,X

#_08CE61: LDA.b $03
#_08CE63: STA.l $7F582F,X

#_08CE67: PHX

#_08CE68: JSR AncillaDraw_GTCutsceneCrystal

#_08CE6B: PLX
#_08CE6C: DEX

#_08CE6D: BPL .next_crystal

;===================================================================================================

GTCutscene_DrawSingleCrystal:
#_08CE6F: LDX.w $0FA0

#_08CE72: PHY
#_08CE73: JSR Ancilla_PrepOAMCoord_adjusted
#_08CE76: PLY

#_08CE77: LDA.b $00
#_08CE79: STA.l $7F581E

#_08CE7D: LDA.b $01
#_08CE7F: STA.l $7F5826

#_08CE83: LDA.b $02
#_08CE85: STA.l $7F582E

#_08CE89: LDA.b $03
#_08CE8B: STA.l $7F5836

#_08CE8F: JSR AncillaDraw_GTCutsceneCrystal

;---------------------------------------------------------------------------------------------------

#_08CE92: LDX.w $0FA0

#_08CE95: LDA.w $0C54,X
#_08CE98: BNE .skip_sparkle

#_08CE9A: JSR AncillaAdd_OccasionalSparkle

#_08CE9D: BRA .exit

.skip_sparkle
#_08CE9F: LDA.b $11
#_08CEA1: BNE .exit

#_08CEA3: JSR GTCutscene_ActivateSparkle

#_08CEA6: LDX.w $0FA0

.exit
#_08CEA9: RTS

;===================================================================================================

AncillaDraw_GTCutsceneCrystal:
#_08CEAA: JSR Ancilla_SetOAM_XY_safe

#_08CEAD: LDA.b #$24
#_08CEAF: STA.b ($90),Y

#_08CEB1: INY

#_08CEB2: LDA.b #$3C
#_08CEB4: STA.b ($90),Y

#_08CEB6: INY
#_08CEB7: PHY

#_08CEB8: TYA
#_08CEB9: SEC
#_08CEBA: SBC.b #$04
#_08CEBC: LSR A
#_08CEBD: LSR A
#_08CEBE: TAY

#_08CEBF: LDA.b #$02
#_08CEC1: ORA.b $75
#_08CEC3: STA.b ($92),Y

#_08CEC5: PLY

#_08CEC6: RTS

;===================================================================================================

GTCutscene_ActivateSparkle:
#_08CEC7: LDX.b #$17

.next_check
#_08CEC9: LDA.l $7F5837,X
#_08CECD: CMP.b #$FF
#_08CECF: BEQ .activate_it

#_08CED1: DEX
#_08CED2: BPL .next_check

#_08CED4: BRA .exit

;---------------------------------------------------------------------------------------------------

.activate_it
#_08CED6: PHX

#_08CED7: LDA.b #$00
#_08CED9: STA.l $7F5837,X

#_08CEDD: LDA.b #$04
#_08CEDF: STA.l $7F58AF,X

#_08CEE3: JSL GetRandomNumber
#_08CEE7: STA.b $08

#_08CEE9: LSR A
#_08CEEA: LSR A
#_08CEEB: LSR A
#_08CEEC: LSR A
#_08CEED: STA.b $09

#_08CEEF: LDA.b $08
#_08CEF1: AND.b #$0F
#_08CEF3: STA.b $08

#_08CEF5: TXA
#_08CEF6: AND.b #$07
#_08CEF8: TAX

#_08CEF9: LDA.l $7F5817,X
#_08CEFD: CLC
#_08CEFE: ADC.b $08
#_08CF00: STA.b $00

#_08CF02: LDA.l $7F581F,X
#_08CF06: ADC.b #$00
#_08CF08: STA.b $01

#_08CF0A: LDA.l $7F5827,X
#_08CF0E: CLC
#_08CF0F: ADC.b $09
#_08CF11: STA.b $02

#_08CF13: LDA.l $7F582F,X
#_08CF17: ADC.b #$00
#_08CF19: STA.b $03

#_08CF1B: PLX

#_08CF1C: LDA.b $00
#_08CF1E: STA.l $7F584F,X

#_08CF22: LDA.b $01
#_08CF24: STA.l $7F5867,X

#_08CF28: LDA.b $02
#_08CF2A: STA.l $7F587F,X

#_08CF2E: LDA.b $03
#_08CF30: STA.l $7F5897,X

.exit
#_08CF34: RTS

;===================================================================================================

GTCutscene_SparkleALot:
#_08CF35: LDX.b #$17

.next
#_08CF37: LDA.l $7F5837,X
#_08CF3B: CMP.b #$FF
#_08CF3D: BEQ .skip

#_08CF3F: LDA.l $7F58AF,X
#_08CF43: DEC A
#_08CF44: STA.l $7F58AF,X
#_08CF48: BPL .active

#_08CF4A: LDA.b #$04
#_08CF4C: STA.l $7F58AF,X

#_08CF50: LDA.l $7F5837,X
#_08CF54: INC A
#_08CF55: STA.l $7F5837,X

#_08CF59: CMP.b #$03
#_08CF5B: BNE .active

#_08CF5D: LDA.b #$FF
#_08CF5F: STA.l $7F5837,X
#_08CF63: BRA .skip

;---------------------------------------------------------------------------------------------------

.active
#_08CF65: PHX

#_08CF66: LDA.l $7F584F,X
#_08CF6A: STA.b $00

#_08CF6C: LDA.l $7F5867,X
#_08CF70: STA.b $01

#_08CF72: LDA.l $7F587F,X
#_08CF76: STA.b $02

#_08CF78: LDA.l $7F5897,X
#_08CF7C: STA.b $03

#_08CF7E: LDA.l $7F5837,X
#_08CF82: TAX

#_08CF83: JSR Ancilla_SetOAM_XY

#_08CF86: LDA.w Ancilla3C_SpinAttackChargeSparkle_char,X
#_08CF89: STA.b ($90),Y

#_08CF8B: INY

#_08CF8C: LDA.w Ancilla3C_SpinAttackChargeSparkle_prop,X
#_08CF8F: ORA.b #$30
#_08CF91: STA.b ($90),Y

#_08CF93: INY
#_08CF94: PHY

#_08CF95: TYA
#_08CF96: SEC
#_08CF97: SBC.b #$04
#_08CF99: LSR A
#_08CF9A: LSR A
#_08CF9B: TAY

#_08CF9C: LDA.b #$00
#_08CF9E: STA.b ($92),Y

#_08CFA0: PLY
#_08CFA1: PLX

.skip
#_08CFA2: DEX
#_08CFA3: BPL .next

;---------------------------------------------------------------------------------------------------

#_08CFA5: RTS

;===================================================================================================

FluteBounce:
#_08CFA6: db  24
#_08CFA7: db  16
#_08CFA8: db  10
#_08CFA9: db   0

;===================================================================================================

Ancilla36_Flute:
#_08CFAA: LDA.b $11
#_08CFAC: BNE .no_collision_check

#_08CFAE: LDA.w $0C54,X
#_08CFB1: CMP.b #$03
#_08CFB3: BEQ .check_collision

#_08CFB5: LDA.w $0294,X
#_08CFB8: SEC
#_08CFB9: SBC.b #$02
#_08CFBB: STA.w $0294,X

#_08CFBE: JSR Ancilla_Move_X
#_08CFC1: JSR Ancilla_Move_Z

;---------------------------------------------------------------------------------------------------

#_08CFC4: LDA.w $029E,X
#_08CFC7: BPL .no_collision_check

#_08CFC9: CMP.b #$F0
#_08CFCB: BCC .no_collision_check

#_08CFCD: INC.w $0C54,X

#_08CFD0: LDY.w $0C54,X

#_08CFD3: LDA.w FluteBounce,Y
#_08CFD6: STA.w $0294,X

#_08CFD9: STZ.w $029E,X

.no_collision_check
#_08CFDC: BRA AncillaDraw_Flute

;---------------------------------------------------------------------------------------------------

.check_collision
#_08CFDE: LDY.b #$02
#_08CFE0: JSR Ancilla_CheckLinkCollision
#_08CFE3: BCC AncillaDraw_Flute

#_08CFE5: LDA.w $037E
#_08CFE8: BNE AncillaDraw_Flute

#_08CFEA: LDA.b $4D
#_08CFEC: BNE AncillaDraw_Flute

#_08CFEE: PHX

#_08CFEF: STZ.w $0C4A,X

#_08CFF2: STZ.w $02E9

#_08CFF5: LDY.b #$14 ; ITEMGET 14
#_08CFF7: JSL Link_ReceiveItem

#_08CFFB: PLX

#_08CFFC: RTS

;===================================================================================================

AncillaDraw_Flute:
#_08CFFD: JSR Ancilla_PrepOAMCoord_adjusted

#_08D000: REP #$20

#_08D002: LDA.w $029E,X
#_08D005: AND.w #$00FF
#_08D008: CMP.w #$0080
#_08D00B: BCC .positive_z

#_08D00D: ORA.w #$FF00

.positive_z
#_08D010: EOR.w #$FFFF
#_08D013: INC A

#_08D014: CLC
#_08D015: ADC.b $00
#_08D017: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08D019: SEP #$20

#_08D01B: PHX

#_08D01C: LDY.b #$00
#_08D01E: JSR Ancilla_SetOAM_XY

#_08D021: LDA.b #$24
#_08D023: STA.b ($90),Y

#_08D025: INY

#_08D026: LDA.b #$04
#_08D028: ORA.b $65
#_08D02A: STA.b ($90),Y

#_08D02C: LDA.b #$02
#_08D02E: STA.b ($92)

#_08D030: PLX

#_08D031: LDY.b #$01

#_08D033: LDA.b ($90),Y
#_08D035: CMP.b #$F0
#_08D037: BNE EXIT_08D03C

#_08D039: STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

#EXIT_08D03C:
#_08D03C: RTS

;===================================================================================================

Ancilla37_WeathervaneExplosion:
#_08D03D: REP #$20

#_08D03F: LDA.l $7F58B6
#_08D043: DEC A
#_08D044: STA.l $7F58B6

#_08D048: BNE .proceed_to_exit

#_08D04A: SEP #$20

#_08D04C: INC A
#_08D04D: STA.l $7F58B6

#_08D051: LDA.l $7F58B8
#_08D055: BNE .continue

#_08D057: INC A
#_08D058: STA.l $7F58B8

#_08D05C: LDA.b #$F3 ; SONG F3 - max volume
#_08D05E: STA.w $012C

#_08D061: BRA .continue

.proceed_to_exit
#_08D063: SEP #$20

#_08D065: BRA EXIT_08D03C

;---------------------------------------------------------------------------------------------------

.continue
#_08D067: DEC.w $0394,X

#_08D06A: LDA.w $0394,X
#_08D06D: BNE .proceed_to_exit

#_08D06F: INC A
#_08D070: STA.w $0394,X

#_08D073: LDA.w $039F,X
#_08D076: BNE .already_BOOMed

#_08D078: INC A
#_08D079: STA.w $039F,X

#_08D07C: LDA.b #$0C ; SFX2.0C
#_08D07E: JSR Ancilla_SFX2_Near

;---------------------------------------------------------------------------------------------------

.already_BOOMed
#_08D081: LDA.w $0C54,X
#_08D084: BNE .not_first_step

#_08D086: DEC.w $03B1,X
#_08D089: BPL .not_first_step

#_08D08B: LDA.b #$01
#_08D08D: STA.w $0C54,X

#_08D090: PHX

#_08D091: JSL Overworld_AlterWeathervane

#_08D095: LDY.b #$00
#_08D097: LDA.b #$38 ; ANCILLA 38
#_08D099: JSL AncillaAdd_CutsceneDuck

#_08D09D: PLX

.not_first_step
#_08D09E: TXA
#_08D09F: STA.l $7F5878

#_08D0A3: LDA.b #$00
#_08D0A5: STA.l $7F5879

;---------------------------------------------------------------------------------------------------

#_08D0A9: LDX.b #$0B

.next
#_08D0AB: LDA.l $7F586C,X
#_08D0AF: CMP.b #$FF
#_08D0B1: BNE .dont_skip

#_08D0B3: BRL .skip

.dont_skip
#_08D0B6: LDA.l $7F5860,X
#_08D0BA: DEC A
#_08D0BB: STA.l $7F5860,X

#_08D0BF: BPL .delay_char_toggle

#_08D0C1: LDA.b #$01
#_08D0C3: STA.l $7F5860,X

#_08D0C7: LDA.l $7F586C,X
#_08D0CB: EOR.b #$01
#_08D0CD: STA.l $7F586C,X

;---------------------------------------------------------------------------------------------------

.delay_char_toggle
#_08D0D1: PHX

#_08D0D2: LDA.l $7F5878
#_08D0D6: TAY

#_08D0D7: LDA.l $7F586C,X
#_08D0DB: STA.w $0C5E,Y

#_08D0DE: LDA.l $7F5824,X
#_08D0E2: STA.w $0BFA,Y

#_08D0E5: LDA.l $7F5830,X
#_08D0E9: STA.w $0C0E,Y

#_08D0EC: LDA.l $7F583C,X
#_08D0F0: STA.w $0C04,Y

#_08D0F3: LDA.l $7F5848,X
#_08D0F7: STA.w $0C18,Y

#_08D0FA: LDA.l $7F5854,X
#_08D0FE: STA.w $029E,Y

#_08D101: LDA.l $7F5800,X
#_08D105: STA.w $0C22,Y

#_08D108: LDA.l $7F580C,X
#_08D10C: STA.w $0C2C,Y

#_08D10F: LDA.l $7F5818,X
#_08D113: SEC
#_08D114: SBC.b #$01
#_08D116: STA.l $7F5818,X
#_08D11A: STA.w $0294,Y

;---------------------------------------------------------------------------------------------------

#_08D11D: TYX

#_08D11E: JSR Ancilla_Move_Y
#_08D121: JSR Ancilla_Move_X
#_08D124: JSR Ancilla_Move_Z

#_08D127: STZ.b $74

#_08D129: LDA.w $029E,X
#_08D12C: CMP.b #$F0
#_08D12E: BCC .not_buried

#_08D130: LDA.b #$FF
#_08D132: STA.b $74

.not_buried
#_08D134: JSR AncillaDraw_WeathervaneExplosionWoodDebris
#_08D137: PLX

#_08D138: LDA.b $74
#_08D13A: BPL .dont_deactivate

#_08D13C: STA.l $7F586C,X

.dont_deactivate
#_08D140: LDA.l $7F5878
#_08D144: TAY

#_08D145: LDA.w $0BFA,Y
#_08D148: STA.l $7F5824,X

#_08D14C: LDA.w $0C0E,Y
#_08D14F: STA.l $7F5830,X

#_08D153: LDA.w $0C04,Y
#_08D156: STA.l $7F583C,X

#_08D15A: LDA.w $0C18,Y
#_08D15D: STA.l $7F5848,X

#_08D161: LDA.w $029E,Y
#_08D164: STA.l $7F5854,X

;---------------------------------------------------------------------------------------------------

.skip
#_08D168: DEX
#_08D169: BMI .done_loop

#_08D16B: BRL .next

;---------------------------------------------------------------------------------------------------

.done_loop
#_08D16E: LDA.l $7F5878
#_08D172: TAY

#_08D173: LDX.b #$0B

.next_active_check
#_08D175: LDA.l $7F586C,X
#_08D179: CMP.b #$FF
#_08D17B: BNE .exit

#_08D17D: DEX
#_08D17E: BPL .next_active_check

#_08D180: TYX
#_08D181: STZ.w $0C4A,X

.exit
#_08D184: TYX

#_08D185: RTS

;===================================================================================================

pool AncillaDraw_WeathervaneExplosionWoodDebris

.char
#_08D186: db $4E, $4F

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_WeathervaneExplosionWoodDebris:
#_08D188: JSR Ancilla_PrepOAMCoord

#_08D18B: REP #$20

#_08D18D: LDA.w $029E,X
#_08D190: AND.w #$00FF
#_08D193: CMP.w #$0080
#_08D196: BCC .positive_z

#_08D198: ORA.w #$FF00

.positive_z
#_08D19B: EOR.w #$FFFF
#_08D19E: INC A

#_08D19F: CLC
#_08D1A0: ADC.b $00
#_08D1A2: STA.b $00

#_08D1A4: SEP #$20

#_08D1A6: LDA.w $0C5E,X
#_08D1A9: STA.b $72

#_08D1AB: BMI .exit

;---------------------------------------------------------------------------------------------------

#_08D1AD: PHX

#_08D1AE: LDA.l $7F5879
#_08D1B2: TAY

#_08D1B3: JSR Ancilla_SetOAM_XY

#_08D1B6: LDX.b $72

#_08D1B8: LDA.w .char,X
#_08D1BB: STA.b ($90),Y

#_08D1BD: INY

#_08D1BE: LDA.b #$3C
#_08D1C0: STA.b ($90),Y

#_08D1C2: INY
#_08D1C3: TYA
#_08D1C4: STA.l $7F5879

#_08D1C8: SEC
#_08D1C9: SBC.b #$04

#_08D1CB: LSR A
#_08D1CC: LSR A
#_08D1CD: TAY

#_08D1CE: LDA.b #$00
#_08D1D0: STA.b ($92),Y

#_08D1D2: PLX

;---------------------------------------------------------------------------------------------------

.exit
#_08D1D3: RTS

;===================================================================================================

pool Ancilla38_CutsceneDuck CutsceneDuck_Draw

.hflip
#_08D1D4: db $40, $00

.swirl
#_08D1D6: db $1C, $3C

pool off

;---------------------------------------------------------------------------------------------------

Ancilla38_CutsceneDuck:
#_08D1D8: LDA.b $1A
#_08D1DA: AND.b #$1F
#_08D1DC: BNE .skip_sfx

#_08D1DE: LDA.b #$1E ; SFX3.1E
#_08D1E0: JSR Ancilla_SFX3_Pan

.skip_sfx
#_08D1E3: DEC.w $039F,X
#_08D1E6: BPL .delay

#_08D1E8: LDA.b #$03
#_08D1EA: STA.w $039F,X

#_08D1ED: LDA.w $0380,X
#_08D1F0: EOR.b #$01
#_08D1F2: STA.w $0380,X

.delay
#_08D1F5: DEC.w $03B1,X

#_08D1F8: LDA.w $03B1,X
#_08D1FB: BEQ .movement

#_08D1FD: BRL CutsceneDuck_Draw

;---------------------------------------------------------------------------------------------------

.movement
#_08D200: LDA.b #$01
#_08D202: STA.w $03B1,X

#_08D205: LDA.w $0385,X
#_08D208: BNE .swirl_around

#_08D20A: DEC.w $0C5E,X
#_08D20D: BMI .init_swirling

#_08D20F: LDY.b #$FF
#_08D211: LDA.w $0C54,X
#_08D214: BEQ .accelerate_descent

#_08D216: LDY.b #$01

.accelerate_descent
#_08D218: TYA
#_08D219: CLC
#_08D21A: ADC.w $0294,X
#_08D21D: STA.w $0294,X

#_08D220: BPL .positive_z

#_08D222: EOR.b #$FF
#_08D224: INC A

.positive_z
#_08D225: CMP.b #$0C
#_08D227: BCC .dont_flip_swirl

#_08D229: LDA.w $0C54,X
#_08D22C: EOR.b #$01
#_08D22E: STA.w $0C54,X

.dont_flip_swirl
#_08D231: BRL CutsceneDuck_Draw

;---------------------------------------------------------------------------------------------------

.init_swirling
#_08D234: STZ.w $0C5E,X
#_08D237: STZ.w $0C54,X

#_08D23A: LDA.w .swirl
#_08D23D: STA.w $0C2C,X

#_08D240: LDA.b #$F0
#_08D242: STA.w $0294,X

#_08D245: INC.w $0385,X

#_08D248: LDA.b #$03
#_08D24A: STA.w $0C54,X

.swirl_around
#_08D24D: LDY.b #$FF

#_08D24F: LDA.w $0C54,X
#_08D252: AND.b #$01
#_08D254: BNE .accelerate_left

#_08D256: LDY.b #$01

.accelerate_left
#_08D258: TYA
#_08D259: CLC
#_08D25A: ADC.w $0C2C,X
#_08D25D: STA.w $0C2C,X

#_08D260: BPL .positive_x_a

#_08D262: EOR.b #$FF
#_08D264: INC A

.positive_x_a
#_08D265: CMP.b #$00
#_08D267: BNE .not_maxed_swirl

#_08D269: INC.w $0385,X

#_08D26C: LDY.w $0385,X
#_08D26F: CPY.b #$07
#_08D271: BNE .not_maxed_swirl

#_08D273: PHA

#_08D274: LDA.b #$01
#_08D276: STA.w $03A9,X

#_08D279: PLA

;---------------------------------------------------------------------------------------------------

.not_maxed_swirl
#_08D27A: LDY.w $03A9,X
#_08D27D: CMP.w .swirl,Y
#_08D280: BCC .not_max_x

#_08D282: LDA.w $0C54,X
#_08D285: AND.b #$03
#_08D287: EOR.b #$03
#_08D289: STA.b $00

#_08D28B: LDA.w $0C54,X
#_08D28E: AND.b #$FC
#_08D290: ORA.b $00
#_08D292: STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

.not_max_x
#_08D295: LDY.b #$03
#_08D297: LDA.w $0C2C,X
#_08D29A: BPL .positive_x_b

#_08D29C: EOR.b #$FF
#_08D29E: INC A

#_08D29F: LDY.b #$02

.positive_x_b
#_08D2A1: STA.b $00

#_08D2A3: TYA
#_08D2A4: STA.w $0C72,X

#_08D2A7: LDY.w $03A9,X

#_08D2AA: LDA.w .swirl,Y
#_08D2AD: SEC
#_08D2AE: SBC.b $00
#_08D2B0: LSR A
#_08D2B1: STA.b $00

#_08D2B3: LDA.w $0C54,X
#_08D2B6: AND.b #$02
#_08D2B8: BEQ .descending

#_08D2BA: LDA.b $00
#_08D2BC: EOR.b #$FF
#_08D2BE: INC A
#_08D2BF: STA.b $00

.descending
#_08D2C1: LDA.b $00
#_08D2C3: STA.w $0294,X

;===================================================================================================

CutsceneDuck_Draw:
#_08D2C6: JSR Ancilla_Move_X
#_08D2C9: JSR Ancilla_Move_Z

#_08D2CC: LDY.w $0380,X

#_08D2CF: LDA.w .vram_offset+1,Y
#_08D2D2: STA.w $0AF4

#_08D2D5: JSR Ancilla_PrepOAMCoord

#_08D2D8: LDA.w $0C72,X
#_08D2DB: AND.b #$01
#_08D2DD: TAY

#_08D2DE: LDA.w .hflip,Y
#_08D2E1: STA.b $08

;===================================================================================================

#_08D2E3: REP #$20

#_08D2E5: LDA.w $029E,X
#_08D2E8: AND.w #$00FF
#_08D2EB: CMP.w #$0080
#_08D2EE: BCC .z_is_positive

#_08D2F0: ORA.w #$FF00

.z_is_positive
#_08D2F3: EOR.w #$FFFF
#_08D2F6: INC A
#_08D2F7: STA.b $04

#_08D2F9: LDA.b $00
#_08D2FB: STA.b $0A

#_08D2FD: SEC
#_08D2FE: SBC.b $04
#_08D300: STA.b $04

#_08D302: LDA.b $02
#_08D304: STA.b $06

;---------------------------------------------------------------------------------------------------

#_08D306: SEP #$20

#_08D308: PHX

#_08D309: LDY.b #$00

#_08D30B: REP #$20

#_08D30D: LDA.w .offset_y
#_08D310: AND.w #$00FF
#_08D313: CLC
#_08D314: ADC.b $04
#_08D316: STA.b $00

#_08D318: LDA.w .offset_x
#_08D31B: AND.w #$00FF
#_08D31E: CLC
#_08D31F: ADC.b $06
#_08D321: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08D323: SEP #$20

#_08D325: JSR Ancilla_SetOAM_XY

#_08D328: LDA.w .char
#_08D32B: STA.b ($90),Y

#_08D32D: INY

#_08D32E: LDA.w .prop
#_08D331: ORA.b #$30
#_08D333: ORA.b $08
#_08D335: STA.b ($90),Y

#_08D337: INY
#_08D338: PHY

#_08D339: TYA
#_08D33A: SEC
#_08D33B: SBC.b #$04
#_08D33D: LSR A
#_08D33E: LSR A
#_08D33F: TAY

#_08D340: LDA.b #$02
#_08D342: STA.b ($92),Y

#_08D344: PLY

#_08D345: REP #$20

#_08D347: LDA.b $0A
#_08D349: CLC
#_08D34A: ADC.w #$0030
#_08D34D: STA.b $00

#_08D34F: LDA.b $06
#_08D351: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08D353: SEP #$20

#_08D355: LDA.b #$30
#_08D357: STA.b $04

#_08D359: LDX.b #$01
#_08D35B: JSR AncillaDraw_Shadow

#_08D35E: PLX

#_08D35F: REP #$20

#_08D361: LDA.b $06
#_08D363: BMI .exit

#_08D365: CMP.w #$00F8
#_08D368: BCC .exit

;---------------------------------------------------------------------------------------------------

#_08D36A: SEP #$20

#_08D36C: STZ.w $0C4A,X

#_08D36F: STZ.b $11

#_08D371: LDA.b #$03
#_08D373: STA.l $7EF34C

;---------------------------------------------------------------------------------------------------

.exit
#_08D377: SEP #$20

#_08D379: RTS

;===================================================================================================

pool AncillaDraw_LinkPoof

.char
#_08D37A: db $86
#_08D37B: db $A9
#_08D37C: db $9B

.size
#_08D37D: db $02
#_08D37E: db $00
#_08D37F: db $00

.prop
#_08D380: db $00, $FF, $FF, $FF
#_08D384: db $40, $00, $C0, $80
#_08D388: db $00, $40, $80, $C0

.offset_y
#_08D38C: dw   0,   0,   0,   0
#_08D394: dw   0,   0,   8,   8
#_08D39C: dw  -4,  -4,  12,  12

.offset_x
#_08D3A4: dw   0,   0,   0,   0
#_08D3AC: dw   0,   8,   0,   8
#_08D3B4: dw  -4,  12,  -4,  12

pool off

;---------------------------------------------------------------------------------------------------

Ancilla23_LinkPoof:
#_08D3BC: DEC.w $03B1,X
#_08D3BF: BPL AncillaDraw_LinkPoof

#_08D3C1: LDA.b #$07
#_08D3C3: STA.w $03B1,X

#_08D3C6: LDA.w $0C5E,X
#_08D3C9: INC A
#_08D3CA: STA.w $0C5E,X

#_08D3CD: CMP.b #$03
#_08D3CF: BNE AncillaDraw_LinkPoof

#_08D3D1: STZ.w $0C4A,X

#_08D3D4: STZ.w $02E1
#_08D3D7: STZ.b $50

#_08D3D9: LDA.w $0C54,X
#_08D3DC: BNE .exit

#_08D3DE: STZ.b $2E
#_08D3E0: STZ.b $4B

;---------------------------------------------------------------------------------------------------

#_08D3E2: LDY.b #$00

#_08D3E4: LDA.b $8A
#_08D3E6: AND.b #$40
#_08D3E8: BEQ .light_world

#_08D3EA: INY

.light_world
#_08D3EB: STY.w $02E0
#_08D3EE: STY.b $56
#_08D3F0: BEQ .link_colors

.bunny_colors
#_08D3F2: JSL RefreshLinkEquipmentPalettes_bunny

#_08D3F6: BRA .exit

.link_colors
#_08D3F8: JSL RefreshLinkEquipmentPalettes_sword_and_mail

.exit
#_08D3FC: RTS

;===================================================================================================

AncillaDraw_LinkPoof:
#_08D3FD: LDA.w $0FB3
#_08D400: BEQ .use_default_oam_slots

#_08D402: LDA.w $0C7C,X
#_08D405: BEQ .use_default_oam_slots

#_08D407: LDA.w $035F
#_08D40A: BEQ .use_hardcoded_oam_slots

#_08D40C: LDA.b $1A
#_08D40E: AND.b #$01
#_08D410: BNE .use_default_oam_slots

;---------------------------------------------------------------------------------------------------

.use_hardcoded_oam_slots
#_08D412: REP #$20

#_08D414: LDA.w #$00D0
#_08D417: PHA

#_08D418: CLC
#_08D419: ADC.w #$0800
#_08D41C: STA.b $90

#_08D41E: PLA
#_08D41F: LSR A
#_08D420: LSR A
#_08D421: CLC
#_08D422: ADC.w #$0A20
#_08D425: STA.b $92

#_08D427: SEP #$20

;---------------------------------------------------------------------------------------------------

.use_default_oam_slots
#_08D429: JSR Ancilla_PrepOAMCoord

#_08D42C: REP #$20

#_08D42E: LDA.b $00
#_08D430: STA.b $04

#_08D432: LDA.b $02
#_08D434: STA.b $06

#_08D436: SEP #$20

#_08D438: PHX

#_08D439: LDY.w $0C5E,X

#_08D43C: LDA.w .size,Y
#_08D43F: STA.b $08

#_08D441: LDA.w .char,Y
#_08D444: STA.b $0C

#_08D446: TYA
#_08D447: ASL A
#_08D448: ASL A
#_08D449: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_08D44B: LDY.b #$00
#_08D44D: STY.b $0A

.next
#_08D44F: LDA.b $0E
#_08D451: CLC
#_08D452: ADC.b $0A
#_08D454: ASL A
#_08D455: TAX

#_08D456: REP #$20

#_08D458: LDA.b $04
#_08D45A: CLC
#_08D45B: ADC.w .offset_y,X
#_08D45E: STA.b $00

#_08D460: LDA.b $06
#_08D462: CLC
#_08D463: ADC.w .offset_x,X
#_08D466: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08D468: SEP #$20

#_08D46A: JSR Ancilla_SetOAM_XY

#_08D46D: LDA.b $0C
#_08D46F: STA.b ($90),Y

#_08D471: INY

#_08D472: TXA
#_08D473: LSR A
#_08D474: TAX

#_08D475: LDA.w .prop,X
#_08D478: ORA.b #$04
#_08D47A: ORA.b $65
#_08D47C: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

#_08D47E: INY
#_08D47F: PHY

#_08D480: TYA
#_08D481: SEC
#_08D482: SBC.b #$04
#_08D484: LSR A
#_08D485: LSR A
#_08D486: TAY

#_08D487: LDA.b $08
#_08D489: STA.b ($92),Y

#_08D48B: PLY

;---------------------------------------------------------------------------------------------------

#_08D48C: CMP.b #$02
#_08D48E: BEQ .exit

#_08D490: INC.b $0A

#_08D492: LDA.b $0A
#_08D494: CMP.b #$04
#_08D496: BNE .next

.exit
#_08D498: PLX

#_08D499: RTS

;===================================================================================================

Ancilla40_DwarfPoof:
#_08D49A: DEC.w $03B1,X
#_08D49D: BPL .draw

#_08D49F: LDA.b #$07
#_08D4A1: STA.w $03B1,X

#_08D4A4: LDA.w $0C5E,X
#_08D4A7: INC A
#_08D4A8: STA.w $0C5E,X

#_08D4AB: CMP.b #$03
#_08D4AD: BNE .draw

#_08D4AF: STZ.w $0C4A,X
#_08D4B2: STZ.w $02F9

#_08D4B5: RTS

.draw
#_08D4B6: BRL AncillaDraw_LinkPoof

;===================================================================================================

pool Ancilla3F_BushPoof

.char
#_08D4B9: db $86, $87, $96, $97
#_08D4BD: db $A9, $A9, $A9, $A9
#_08D4C1: db $8A, $8B, $9A, $9B
#_08D4C5: db $9B, $9B, $9B, $9B

.prop
#_08D4C9: db $00, $00, $00, $00
#_08D4CD: db $00, $40, $80, $C0
#_08D4D1: db $00, $00, $00, $00
#_08D4D5: db $C0, $80, $40, $00

.offset_y_low
#_08D4D9: db   0,   0,   8,   8
#_08D4DD: db   0,   0,   8,   8
#_08D4E1: db   0,   0,   8,   8
#_08D4E5: db  -2,  -2,  10,  10

.offset_y_high
#_08D4E9: db   0,   0,   0,   0
#_08D4ED: db   0,   0,   0,   0
#_08D4F1: db   0,   0,   0,   0
#_08D4F5: db  -1,  -1,   0,   0

.offset_x_low
#_08D4F9: db   0,   8,   0,   8
#_08D4FD: db   0,   8,   0,   8
#_08D501: db   0,   8,   0,   8
#_08D505: db  -2,  10,  -2,  10

.offset_x_high
#_08D509: db   0,   0,   0,   0
#_08D50D: db   0,   0,   0,   0
#_08D511: db   0,   0,   0,   0
#_08D515: db  -1,   0,  -1,   0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla3F_BushPoof:
#_08D519: LDA.w $0C68,X
#_08D51C: BNE .draw

#_08D51E: LDA.b #$07
#_08D520: STA.w $0C68,X

#_08D523: INC.w $0C5E,X

#_08D526: LDA.w $0C5E,X
#_08D529: CMP.b #$04
#_08D52B: BNE .draw

#_08D52D: STZ.w $0C4A,X

#_08D530: RTS

;---------------------------------------------------------------------------------------------------

.draw
#_08D531: LDA.b #$10
#_08D533: JSL SpriteDraw_AllocateOAMFromRegionC

#_08D537: JSR Ancilla_PrepOAMCoord

#_08D53A: LDA.b $00
#_08D53C: STA.b $06

#_08D53E: LDA.b $01
#_08D540: STA.b $07
#_08D542: STZ.b $08

;---------------------------------------------------------------------------------------------------

#_08D544: LDY.b #$00

#_08D546: LDA.w $0C5E,X
#_08D549: ASL A
#_08D54A: ASL A
#_08D54B: TAX

.next
#_08D54C: LDA.b $06
#_08D54E: CLC
#_08D54F: ADC.w .offset_y_low,X
#_08D552: STA.b $00

#_08D554: LDA.b $07
#_08D556: ADC.w .offset_y_high,X
#_08D559: STA.b $01

#_08D55B: LDA.b $04
#_08D55D: CLC
#_08D55E: ADC.w .offset_x_low,X
#_08D561: STA.b $02

#_08D563: LDA.b $05
#_08D565: ADC.w .offset_x_high,X
#_08D568: STA.b $03

#_08D56A: JSR Ancilla_SetOAM_XY

#_08D56D: LDA.w .char,X
#_08D570: STA.b ($90),Y

#_08D572: INY

#_08D573: LDA.w .prop,X
#_08D576: ORA.b #$04
#_08D578: ORA.b $65
#_08D57A: STA.b ($90),Y

#_08D57C: INY
#_08D57D: PHY

#_08D57E: TYA
#_08D57F: SEC
#_08D580: SBC.b #$04
#_08D582: LSR A
#_08D583: LSR A
#_08D584: TAY

#_08D585: LDA.b #$00
#_08D587: STA.b ($92),Y

#_08D589: PLY

#_08D58A: INX

#_08D58B: INC.b $08

#_08D58D: LDA.b $08
#_08D58F: CMP.b #$04
#_08D591: BNE .next

;---------------------------------------------------------------------------------------------------

#_08D593: BRL Ancilla_RestoreIndex

;===================================================================================================

pool Ancilla26_SwordSwingSparkle

.char
#_08D596: db $B7, $B7, $FF
#_08D599: db $80, $80, $B7
#_08D59C: db $83, $83, $80
#_08D59F: db $83, $FF, $FF

#_08D5A2: db $B7, $B7, $FF
#_08D5A5: db $80, $80, $B7
#_08D5A8: db $83, $83, $80
#_08D5AB: db $83, $FF, $FF

#_08D5AE: db $B7, $B7, $FF
#_08D5B1: db $80, $80, $B7
#_08D5B4: db $83, $83, $80
#_08D5B7: db $83, $FF, $FF

#_08D5BA: db $B7, $B7, $FF
#_08D5BD: db $80, $80, $B7
#_08D5C0: db $83, $83, $80
#_08D5C3: db $83, $FF, $FF

;---------------------------------------------------------------------------------------------------

.prop
#_08D5C6: db $00, $00, $FF
#_08D5C9: db $00, $00, $00
#_08D5CC: db $80, $80, $00
#_08D5CF: db $80, $FF, $FF

#_08D5D2: db $00, $00, $FF
#_08D5D5: db $00, $00, $00
#_08D5D8: db $80, $80, $00
#_08D5DB: db $80, $FF, $FF

#_08D5DE: db $00, $00, $FF
#_08D5E1: db $00, $00, $00
#_08D5E4: db $80, $80, $00
#_08D5E7: db $80, $FF, $FF

#_08D5EA: db $00, $00, $FF
#_08D5ED: db $00, $00, $00
#_08D5F0: db $80, $80, $00
#_08D5F3: db $80, $FF, $FF

;---------------------------------------------------------------------------------------------------

.offset_y
#_08D5F6: db -22, -18,  -1
#_08D5F9: db -22, -18, -17
#_08D5FC: db -22, -18, -17
#_08D5FF: db -17,  -1,  -1

#_08D602: db  35,  40,  -1
#_08D605: db  35,  40,  37
#_08D608: db  35,  40,  37
#_08D60B: db  37,  -1,  -1

#_08D60E: db   2,   7,  -1
#_08D611: db   2,   7,  19
#_08D614: db   2,   7,  19
#_08D617: db  19,  -1,  -1

#_08D61A: db   2,   7,  -1
#_08D61D: db   2,   7,  19
#_08D620: db   2,   7,  19
#_08D623: db  19,  -1,  -1

;---------------------------------------------------------------------------------------------------

.offset_x
#_08D626: db   5,  10,  -1
#_08D629: db   5,  10,  -4
#_08D62C: db   5,  10,  -4
#_08D62F: db  -4,  -1,  -1

#_08D632: db   0,   5,  -1
#_08D635: db   0,   5,  14
#_08D638: db   0,   5,  14
#_08D63B: db  14,  -1,  -1

#_08D63E: db -23, -27,  -1
#_08D641: db -23, -27, -22
#_08D644: db -23, -27, -22
#_08D647: db -22,  -1,  -1

#_08D64A: db  32,  35,  -1
#_08D64D: db  32,  35,  30
#_08D650: db  32,  35,  30
#_08D653: db  30,  -1,  -1

;---------------------------------------------------------------------------------------------------

.group_offset
#_08D656: db $00
#_08D657: db $0C
#_08D658: db $18
#_08D659: db $24

pool off

;---------------------------------------------------------------------------------------------------

Ancilla26_SwordSwingSparkle:
#_08D65A: DEC.w $03B1,X
#_08D65D: BPL .draw

#_08D65F: LDA.b #$00
#_08D661: STA.w $03B1,X

#_08D664: INC.w $0C5E,X

#_08D667: LDA.w $0C5E,X

#_08D66A: CMP.b #$04
#_08D66C: BNE .draw

#_08D66E: STZ.w $0C4A,X

#_08D671: RTS

;---------------------------------------------------------------------------------------------------

.draw
#_08D672: PHX

#_08D673: LDA.b $20
#_08D675: STA.w $0BFA,X

#_08D678: LDA.b $21
#_08D67A: STA.w $0C0E,X

#_08D67D: LDA.b $22
#_08D67F: STA.w $0C04,X

#_08D682: LDA.b $23
#_08D684: STA.w $0C18,X

#_08D687: JSR Ancilla_PrepOAMCoord

;---------------------------------------------------------------------------------------------------

#_08D68A: REP #$20

#_08D68C: LDA.b $00
#_08D68E: STA.b $04

#_08D690: LDA.b $02
#_08D692: STA.b $06

#_08D694: SEP #$20

#_08D696: LDA.b #$02
#_08D698: STA.b $08

#_08D69A: LDY.w $0C72,X

#_08D69D: LDA.w $0C5E,X
#_08D6A0: ASL A
#_08D6A1: CLC
#_08D6A2: ADC.w $0C5E,X
#_08D6A5: CLC
#_08D6A6: ADC.w .group_offset,Y
#_08D6A9: TAX

;---------------------------------------------------------------------------------------------------

#_08D6AA: LDY.b #$00

.next
#_08D6AC: LDA.w .char,X
#_08D6AF: CMP.b #$FF
#_08D6B1: BEQ .skip

#_08D6B3: REP #$20

#_08D6B5: LDA.w .offset_y,X
#_08D6B8: AND.w #$00FF
#_08D6BB: CMP.w #$0080
#_08D6BE: BCC .positive_y

#_08D6C0: ORA.w #$FF00

.positive_y
#_08D6C3: CLC
#_08D6C4: ADC.b $04
#_08D6C6: STA.b $00

#_08D6C8: LDA.w .offset_x,X
#_08D6CB: AND.w #$00FF
#_08D6CE: CMP.w #$0080
#_08D6D1: BCC .positive_x

#_08D6D3: ORA.w #$FF00

.positive_x
#_08D6D6: CLC
#_08D6D7: ADC.b $06
#_08D6D9: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08D6DB: SEP #$20

#_08D6DD: JSR Ancilla_SetOAM_XY

#_08D6E0: LDA.w .char,X
#_08D6E3: STA.b ($90),Y

#_08D6E5: INY

#_08D6E6: LDA.w .prop,X
#_08D6E9: ORA.b #$04
#_08D6EB: ORA.b $65
#_08D6ED: STA.b ($90),Y

#_08D6EF: INY
#_08D6F0: PHY

#_08D6F1: TYA
#_08D6F2: SEC
#_08D6F3: SBC.b #$04
#_08D6F5: LSR A
#_08D6F6: LSR A
#_08D6F7: TAY

#_08D6F8: LDA.b #$00
#_08D6FA: STA.b ($92),Y

#_08D6FC: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08D6FD: INX

#_08D6FE: DEC.b $08
#_08D700: BPL .next

;---------------------------------------------------------------------------------------------------

#_08D702: PLX

#_08D703: RTS

;===================================================================================================

pool Ancilla2A_SpinAttackSparkleA

.timer
#_08D704: db   4
#_08D705: db   2
#_08D706: db   3
#_08D707: db   3
#_08D708: db   2
#_08D709: db   1

.char
#_08D70A: db $92, $FF, $FF, $FF
#_08D70E: db $8C, $8C, $8C, $8C
#_08D712: db $D6, $D6, $D6, $D6
#_08D716: db $93, $93, $93, $93
#_08D71A: db $D6, $D6, $D6, $D6
#_08D71E: db $D7, $FF, $FF, $FF
#_08D722: db $80, $FF, $FF, $FF

.prop
#_08D726: db $22, $FF, $FF, $FF
#_08D72A: db $22, $62, $A2, $E2
#_08D72E: db $24, $64, $A4, $E4
#_08D732: db $22, $62, $A2, $E2
#_08D736: db $22, $62, $A2, $E2
#_08D73A: db $22, $FF, $FF, $FF
#_08D73E: db $22, $FF, $FF, $FF

.offset_y
#_08D742: dw  -4,   0,   0,   0
#_08D74A: dw  -8,  -8,   0,   0
#_08D752: dw  -8,  -8,   0,   0
#_08D75A: dw  -8,  -8,   0,   0
#_08D762: dw  -8,  -8,   0,   0
#_08D76A: dw  -4,   0,   0,   0
#_08D772: dw  -4,   0,   0,   0

.offset_x
#_08D77A: dw  -4,   0,   0,   0
#_08D782: dw  -8,   0,  -8,   0
#_08D78A: dw  -8,   0,  -8,   0
#_08D792: dw  -8,   0,  -8,   0
#_08D79A: dw  -8,   0,  -8,   0
#_08D7A2: dw  -4,   0,   0,   0
#_08D7AA: dw  -4,   0,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla2A_SpinAttackSparkleA:
#_08D7B2: LDA.b $11
#_08D7B4: BNE .just_draw

#_08D7B6: DEC.w $03B1,X
#_08D7B9: BPL .just_draw

#_08D7BB: STZ.w $03B1,X

#_08D7BE: LDA.w $0C68,X
#_08D7C1: BNE .just_draw

#_08D7C3: LDA.w $0C5E,X
#_08D7C6: INC A
#_08D7C7: STA.w $0C5E,X

#_08D7CA: TAY

#_08D7CB: LDA.w .timer,Y
#_08D7CE: STA.w $0C68,X

#_08D7D1: CPY.b #$05
#_08D7D3: BNE .just_draw

#_08D7D5: LDA.w $0C54,X
#_08D7D8: BNE .add_beam

#_08D7DA: BRL SpinAttackSparkleA_TransmuteToNextSpark

.add_beam
#_08D7DD: JSL AncillaAdd_SwordBeam

#_08D7E1: RTS

;---------------------------------------------------------------------------------------------------

.just_draw
#_08D7E2: LDA.w $0C5E,X
#_08D7E5: BEQ .exit

#_08D7E7: JSR Ancilla_PrepOAMCoord

#_08D7EA: REP #$20

#_08D7EC: LDA.b $00
#_08D7EE: STA.b $06

#_08D7F0: LDA.b $02
#_08D7F2: STA.b $08

#_08D7F4: SEP #$20

#_08D7F6: PHX

#_08D7F7: LDY.b #$00
#_08D7F9: STY.b $04

#_08D7FB: LDA.w $0C5E,X
#_08D7FE: DEC A
#_08D7FF: ASL A
#_08D800: ASL A
#_08D801: TAX

;===================================================================================================

#AncillaDraw_SpinningSpark:
.next
#_08D802: LDA.w .char,X
#_08D805: CMP.b #$FF
#_08D807: BEQ .skip

#_08D809: REP #$20

#_08D80B: PHX

#_08D80C: TXA
#_08D80D: ASL A
#_08D80E: TAX

#_08D80F: LDA.b $06
#_08D811: CLC
#_08D812: ADC.w .offset_y,X
#_08D815: STA.b $00

#_08D817: LDA.b $08
#_08D819: CLC
#_08D81A: ADC.w .offset_x,X
#_08D81D: STA.b $02

#_08D81F: PLX

;---------------------------------------------------------------------------------------------------

#_08D820: SEP #$20

#_08D822: JSR Ancilla_SetOAM_XY

#_08D825: LDA.w .char,X
#_08D828: STA.b ($90),Y

#_08D82A: INY

#_08D82B: LDA.w .prop,X
#_08D82E: AND.b #$CF
#_08D830: ORA.b $65
#_08D832: STA.b ($90),Y

#_08D834: INY
#_08D835: PHY

#_08D836: TYA
#_08D837: SEC
#_08D838: SBC.b #$04
#_08D83A: LSR A
#_08D83B: LSR A
#_08D83C: TAY

#_08D83D: LDA.b #$00
#_08D83F: STA.b ($92),Y

#_08D841: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08D842: INX

#_08D843: INC.b $04

#_08D845: LDA.b $04
#_08D847: AND.b #$03
#_08D849: BNE .next

;---------------------------------------------------------------------------------------------------

#_08D84B: PLX

.exit
#_08D84C: RTS

;===================================================================================================

pool SpinAttackSparkleA_TransmuteToNextSpark

.rotation
#_08D84D: db $21, $20, $1F, $1E ; up
#_08D851: db $03, $02, $01, $00 ; down
#_08D855: db $12, $11, $10, $0F ; left
#_08D859: db $31, $30, $2F, $2E ; right

.offset_y
#_08D85D: dw  28 ; up
#_08D85F: dw  -2 ; down
#_08D861: dw  24 ; left
#_08D863: dw   6 ; right

.offset_x
#_08D865: dw  -3 ; up
#_08D867: dw  21 ; down
#_08D869: dw  25 ; left
#_08D86B: dw  -8 ; right

pool off

;---------------------------------------------------------------------------------------------------

SpinAttackSparkleA_TransmuteToNextSpark:
#_08D86D: LDA.b #$2B ; ANCILLA 2B
#_08D86F: STA.w $0C4A,X

#_08D872: LDA.b $2F
#_08D874: ASL A
#_08D875: TAY

#_08D876: LDA.w .rotation+0,Y
#_08D879: STA.l $7F5800

#_08D87D: LDA.w .rotation+1,Y
#_08D880: STA.l $7F5801

#_08D884: LDA.w .rotation+2,Y
#_08D887: STA.l $7F5802

#_08D88B: LDA.w .rotation+3,Y
#_08D88E: STA.l $7F5803
#_08D892: STA.l $7F5804

;---------------------------------------------------------------------------------------------------

#_08D896: LDA.b #$02
#_08D898: STA.w $03B1,X

#_08D89B: LDA.b #$4C
#_08D89D: STA.w $0C5E,X

#_08D8A0: LDA.b #$08
#_08D8A2: STA.w $039F,X

#_08D8A5: STZ.w $0C54,X
#_08D8A8: STZ.w $0385,X

#_08D8AB: LDA.b #$FF
#_08D8AD: STA.w $03A4,X

#_08D8B0: LDA.b #$14
#_08D8B2: STA.l $7F5808

;---------------------------------------------------------------------------------------------------

#_08D8B6: LDY.b $2F

#_08D8B8: REP #$20

#_08D8BA: LDA.b $20
#_08D8BC: CLC
#_08D8BD: ADC.w #$000C
#_08D8C0: STA.l $7F5810

#_08D8C4: LDA.b $22
#_08D8C6: CLC
#_08D8C7: ADC.w #$0008
#_08D8CA: STA.l $7F580E

#_08D8CE: LDA.b $20
#_08D8D0: CLC
#_08D8D1: ADC.w .offset_y,Y
#_08D8D4: STA.b $00

#_08D8D6: LDA.b $22
#_08D8D8: CLC
#_08D8D9: ADC.w .offset_x,Y
#_08D8DC: STA.b $02

;---------------------------------------------------------------------------------------------------

#_08D8DE: SEP #$20

#_08D8E0: LDA.b $00
#_08D8E2: STA.w $0BFA,X

#_08D8E5: LDA.b $01
#_08D8E7: STA.w $0C0E,X

#_08D8EA: LDA.b $02
#_08D8EC: STA.w $0C04,X

#_08D8EF: LDA.b $03
#_08D8F1: STA.w $0C18,X

#_08D8F4: BRA Ancilla2B_SpinAttackSparkleB

;===================================================================================================

pool Ancilla2B_SpinAttackSparkleB

.char
#_08D8F6: db $D7, $B7, $80, $83

.extra_char
#_08D8FA: db $B7, $80, $83

pool off

;---------------------------------------------------------------------------------------------------

Ancilla2B_SpinAttackSparkleB:
#_08D8FD: LDA.w $0385,X
#_08D900: BEQ .continue

#_08D902: BRL SpinAttackSparkleB_Closer

.continue
#_08D905: PHX

#_08D906: LDA.b #$02
#_08D908: STA.b $73

#_08D90A: LDA.b $11
#_08D90C: BNE .no_ai

#_08D90E: LDY.b #$00

#_08D910: LDA.w $0C5E,X
#_08D913: SEC
#_08D914: SBC.b #$03
#_08D916: STA.w $0C5E,X

#_08D919: CMP.b #$0D
#_08D91B: BCS .dont_run_closer

#_08D91D: PLX

#_08D91E: LDA.b #$01

#_08D920: STA.w $03B1,X
#_08D923: STA.w $0385,X

#_08D926: STZ.w $0C5E,X

#_08D929: BRL SpinAttackSparkleB_Closer

;---------------------------------------------------------------------------------------------------

.dont_run_closer
#_08D92C: CMP.b #$42
#_08D92E: BCS .not_four

#_08D930: LDY.b #$03
#_08D932: BRA .set_count

.not_four
#_08D934: CMP.b #$46
#_08D936: BNE .not_two

#_08D938: LDY.b #$01

.not_two
#_08D93A: CMP.b #$43
#_08D93C: BNE .set_count

#_08D93E: LDY.b #$02

.set_count
#_08D940: TYA
#_08D941: STA.w $0C54,X

#_08D944: DEC.w $03B1,X
#_08D947: BPL .no_ai

#_08D949: LDA.b #$04
#_08D94B: STA.b $73

#_08D94D: LDA.b #$02
#_08D94F: STA.w $03B1,X

;---------------------------------------------------------------------------------------------------

.no_ai
#_08D952: LDY.b #$00

#_08D954: LDA.w $0C54,X
#_08D957: TAX

.next_spark
#_08D958: STX.b $72

#_08D95A: LDA.b $11
#_08D95C: BNE .no_rotate

#_08D95E: LDA.l $7F5800,X
#_08D962: CLC
#_08D963: ADC.b #$04
#_08D965: AND.b #$3F
#_08D967: STA.l $7F5800,X

.no_rotate
#_08D96B: PHX
#_08D96C: PHY

#_08D96D: LDA.l $7F5808
#_08D971: STA.b $08

#_08D973: LDA.l $7F5800,X
#_08D977: JSR Ancilla_GetRadialProjection
#_08D97A: JSL Sparkle_PrepOAMFromRadial

#_08D97E: PLY

#_08D97F: JSR Ancilla_SetOAM_XY

#_08D982: LDX.b $72

#_08D984: LDA.w .char,X
#_08D987: STA.b ($90),Y

#_08D989: INY

#_08D98A: LDA.b $73
#_08D98C: ORA.b $65
#_08D98E: STA.b ($90),Y

#_08D990: INY
#_08D991: PHY

#_08D992: TYA
#_08D993: SEC
#_08D994: SBC.b #$04
#_08D996: LSR A
#_08D997: LSR A
#_08D998: TAY

#_08D999: LDA.b #$00
#_08D99B: STA.b ($92),Y

#_08D99D: PLY
#_08D99E: PLX
#_08D99F: DEX
#_08D9A0: BPL .next_spark

;---------------------------------------------------------------------------------------------------

#_08D9A2: PLX
#_08D9A3: PHX

#_08D9A4: LDA.b $11
#_08D9A6: BNE .skip_extra_logic

#_08D9A8: DEC.w $039F,X
#_08D9AB: BPL .delay_extra

#_08D9AD: LDA.b #$00
#_08D9AF: STA.w $039F,X

#_08D9B2: LDA.w $03A4,X
#_08D9B5: INC A
#_08D9B6: AND.b #$03
#_08D9B8: STA.w $03A4,X

#_08D9BB: CMP.b #$03
#_08D9BD: BNE .skip_extra_logic

#_08D9BF: LDA.l $7F5804
#_08D9C3: CLC
#_08D9C4: ADC.b #$09
#_08D9C6: AND.b #$3F
#_08D9C8: STA.l $7F5804

;---------------------------------------------------------------------------------------------------

.skip_extra_logic
#_08D9CC: LDA.w $03A4,X
#_08D9CF: STA.b $72

#_08D9D1: CMP.b #$03
#_08D9D3: BEQ .delay_extra

#_08D9D5: PHY

#_08D9D6: LDA.l $7F5808
#_08D9DA: STA.b $08

#_08D9DC: LDA.l $7F5804
#_08D9E0: JSR Ancilla_GetRadialProjection
#_08D9E3: JSL Sparkle_PrepOAMFromRadial

#_08D9E7: PLY

#_08D9E8: JSR Ancilla_SetOAM_XY

#_08D9EB: LDX.b $72

#_08D9ED: LDA.w .extra_char,X
#_08D9F0: STA.b ($90),Y

#_08D9F2: INY

#_08D9F3: LDA.b #$04
#_08D9F5: ORA.b $65
#_08D9F7: STA.b ($90),Y

#_08D9F9: INY
#_08D9FA: TYA
#_08D9FB: SEC
#_08D9FC: SBC.b #$04

#_08D9FE: LSR A
#_08D9FF: LSR A
#_08DA00: TAY

#_08DA01: LDA.b #$00
#_08DA03: STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

.delay_extra
#_08DA05: PLX
#_08DA06: PHX

#_08DA07: LDA.w $0C5E,X
#_08DA0A: TAX

#_08DA0B: CPX.b #$07
#_08DA0D: BNE .exit

#_08DA0F: LDY.b #$03

#_08DA11: LDA.b #$01
#_08DA13: STA.b ($92),Y

.exit
#_08DA15: PLX

#_08DA16: RTS

;===================================================================================================

Sparkle_PrepOAMFromRadial:
#_08DA17: REP #$20

#_08DA19: LDA.b $00

#_08DA1B: LDY.b $02
#_08DA1D: BEQ .positive_y

#_08DA1F: EOR.w #$FFFF
#_08DA22: INC A

.positive_y
#_08DA23: CLC
#_08DA24: ADC.l $7F5810

#_08DA28: CLC
#_08DA29: ADC.w #$FFFC

#_08DA2C: SEC
#_08DA2D: SBC.b $E8
#_08DA2F: STA.b $00

#_08DA31: LDA.b $04

#_08DA33: LDY.b $06
#_08DA35: BEQ .positive_x

#_08DA37: EOR.w #$FFFF
#_08DA3A: INC A

.positive_x
#_08DA3B: CLC
#_08DA3C: ADC.l $7F580E

#_08DA40: CLC
#_08DA41: ADC.w #$FFFC

#_08DA44: SEC
#_08DA45: SBC.b $E2
#_08DA47: STA.b $02

#_08DA49: SEP #$20

#_08DA4B: RTL

;===================================================================================================

SpinAttackSparkleB_Closer:
#_08DA4C: DEC.w $03B1,X
#_08DA4F: BPL .delay

#_08DA51: LDA.b #$01
#_08DA53: STA.w $03B1,X

#_08DA56: LDA.w $0C5E,X
#_08DA59: INC A
#_08DA5A: STA.w $0C5E,X

#_08DA5D: CMP.b #$03
#_08DA5F: BNE .delay

#_08DA61: STZ.w $0C4A,X

;---------------------------------------------------------------------------------------------------

.delay
#_08DA64: JSR Ancilla_PrepOAMCoord

#_08DA67: REP #$20

#_08DA69: LDA.b $00
#_08DA6B: STA.b $06

#_08DA6D: LDA.b $02
#_08DA6F: STA.b $08

#_08DA71: SEP #$20

#_08DA73: PHX

#_08DA74: LDY.b #$00
#_08DA76: STY.b $04

#_08DA78: LDA.w $0C5E,X
#_08DA7B: CLC
#_08DA7C: ADC.b #$04

#_08DA7E: ASL A
#_08DA7F: ASL A
#_08DA80: TAX

#_08DA81: BRL AncillaDraw_SpinningSpark

;===================================================================================================

pool Ancilla30_ByrnaWindupSpark

.char
#_08DA84: db $92, $FF, $FF, $FF
#_08DA88: db $8C, $8C, $8C, $8C
#_08DA8C: db $D6, $D6, $D6, $D6
#_08DA90: db $93, $93, $93, $93

.prop
#_08DA94: db $22, $FF, $FF, $FF
#_08DA98: db $22, $62, $A2, $E2
#_08DA9C: db $24, $64, $A4, $E4
#_08DAA0: db $22, $62, $A2, $E2

.offset_y
#_08DAA4: dw  -4,   0,   0,   0
#_08DAAC: dw  -8,  -8,   0,   0
#_08DAB4: dw  -8,  -8,   0,   0
#_08DABC: dw  -8,  -8,   0,   0

.offset_x
#_08DAC4: dw  -4,   0,   0,   0
#_08DACC: dw  -8,   0,  -8,   0
#_08DAD4: dw  -8,   0,  -8,   0
#_08DADC: dw  -8,   0,  -8,   0

.offset_link_y
#_08DAE4: dw   5,   0,  -3,  -6
#_08DAEC: dw  -8,  -3,  12,  28
#_08DAF4: dw   5,   0,   8,  16
#_08DAFC: dw   5,   0,   8,  16

.offset_link_x
#_08DB04: dw   3,   1,   0,   0
#_08DB0C: dw  13,  16,  12,  12
#_08DB14: dw  24,   7,  -4, -10
#_08DB1C: dw  -8,   9,  22,  26

pool off

;---------------------------------------------------------------------------------------------------

Ancilla30_ByrnaWindupSpark:
#_08DB24: LDA.b $11
#_08DB26: BNE .delay

#_08DB28: DEC.w $03B1,X
#_08DB2B: BPL .delay

#_08DB2D: LDA.b #$01
#_08DB2F: STA.w $03B1,X

#_08DB32: LDA.w $0C5E,X
#_08DB35: INC A
#_08DB36: STA.w $0C5E,X

#_08DB39: CMP.b #$11
#_08DB3B: BNE .delay

#_08DB3D: BRL ByrnaWindupSpark_TransmuteToNormal

.delay
#_08DB40: LDA.w $0C5E,X
#_08DB43: BNE .active

#_08DB45: BRL .exit

;---------------------------------------------------------------------------------------------------

.active
#_08DB48: LDA.b $2F
#_08DB4A: ASL A
#_08DB4B: ASL A
#_08DB4C: STA.b $00

#_08DB4E: LDA.w $0300
#_08DB51: CMP.b #$02
#_08DB53: BNE .not_final_pose

#_08DB55: TAY

#_08DB56: LDA.w $039F,X
#_08DB59: DEC A
#_08DB5A: BPL .not_final_chars

#_08DB5C: LDA.b #$00
#_08DB5E: LDY.b #$03

.not_final_chars
#_08DB60: STA.w $039F,X

#_08DB63: TYA

.not_final_pose
#_08DB64: ASL A
#_08DB65: CLC
#_08DB66: ADC.b $00
#_08DB68: TAY

;---------------------------------------------------------------------------------------------------

#_08DB69: REP #$20

#_08DB6B: LDA.w .offset_link_y,Y
#_08DB6E: CLC
#_08DB6F: ADC.b $20
#_08DB71: STA.b $00

#_08DB73: LDA.w .offset_link_x,Y
#_08DB76: CLC
#_08DB77: ADC.b $22
#_08DB79: STA.b $02

#_08DB7B: SEP #$20

#_08DB7D: LDA.b $00
#_08DB7F: STA.w $0BFA,X

#_08DB82: LDA.b $01
#_08DB84: STA.w $0C0E,X

#_08DB87: LDA.b $02
#_08DB89: STA.w $0C04,X

#_08DB8C: LDA.b $03
#_08DB8E: STA.w $0C18,X

#_08DB91: JSR Ancilla_PrepOAMCoord

#_08DB94: REP #$20

#_08DB96: LDA.b $00
#_08DB98: STA.b $06

#_08DB9A: LDA.b $02
#_08DB9C: STA.b $08

#_08DB9E: SEP #$20

#_08DBA0: PHX

#_08DBA1: STZ.b $0A

#_08DBA3: LDA.w $0C5E,X
#_08DBA6: DEC A
#_08DBA7: AND.b #$0F
#_08DBA9: BEQ .start_oam

#_08DBAB: CMP.b #$0F
#_08DBAD: BEQ .use_last_group

#_08DBAF: AND.b #$01
#_08DBB1: INC A
#_08DBB2: STA.b $0A

#_08DBB4: BRA .start_oam

.use_last_group
#_08DBB6: LDA.b #$03
#_08DBB8: STA.b $0A

.start_oam
#_08DBBA: LDA.b $0A
#_08DBBC: ASL A
#_08DBBD: ASL A
#_08DBBE: TAX

;---------------------------------------------------------------------------------------------------

#_08DBBF: LDY.b #$00
#_08DBC1: STY.b $04

.next_object
#_08DBC3: LDA.w .char,X
#_08DBC6: CMP.b #$FF
#_08DBC8: BEQ .skip

#_08DBCA: REP #$20

#_08DBCC: PHX

#_08DBCD: TXA
#_08DBCE: ASL A
#_08DBCF: TAX

#_08DBD0: LDA.b $06
#_08DBD2: CLC
#_08DBD3: ADC.w .offset_y,X
#_08DBD6: STA.b $00

#_08DBD8: LDA.b $08
#_08DBDA: CLC
#_08DBDB: ADC.w .offset_x,X
#_08DBDE: STA.b $02

#_08DBE0: PLX

#_08DBE1: SEP #$20

#_08DBE3: JSR Ancilla_SetOAM_XY

#_08DBE6: LDA.w .char,X
#_08DBE9: STA.b ($90),Y

#_08DBEB: INY

#_08DBEC: LDA.w .prop,X
#_08DBEF: AND.b #$CF
#_08DBF1: ORA.b $65
#_08DBF3: STA.b ($90),Y

#_08DBF5: INY
#_08DBF6: PHY

#_08DBF7: TYA
#_08DBF8: SEC
#_08DBF9: SBC.b #$04
#_08DBFB: LSR A
#_08DBFC: LSR A
#_08DBFD: TAY

#_08DBFE: LDA.b #$00
#_08DC00: STA.b ($92),Y

#_08DC02: PLY

;---------------------------------------------------------------------------------------------------

.skip
#_08DC03: INX

#_08DC04: INC.b $04

#_08DC06: LDA.b $04
#_08DC08: AND.b #$03
#_08DC0A: BNE .next_object

#_08DC0C: PLX

;---------------------------------------------------------------------------------------------------

.exit
#_08DC0D: RTS

;===================================================================================================

pool ByrnaWindupSpark_TransmuteToNormal

.rotation
#_08DC0E: db $34, $33, $32, $31 ; up
#_08DC12: db $16, $15, $14, $13 ; down
#_08DC16: db $2A, $29, $28, $27 ; left
#_08DC1A: db $10, $0F, $0E, $0D ; right

pool off

;===================================================================================================

ByrnaMagicCost:
#_08DC1E: db $04, $02, $01

;===================================================================================================

ByrnaWindupSpark_TransmuteToNormal:
#_08DC21: LDA.b #$31 ; ANCILLA 31
#_08DC23: STA.w $0C4A,X

#_08DC26: LDA.b $2F
#_08DC28: ASL A
#_08DC29: TAY

#_08DC2A: LDA.w .rotation+0,Y
#_08DC2D: STA.l $7F5800

#_08DC31: LDA.w .rotation+1,Y
#_08DC34: STA.l $7F5801

#_08DC38: LDA.w .rotation+2,Y
#_08DC3B: STA.l $7F5802

#_08DC3F: LDA.w .rotation+3,Y
#_08DC42: STA.l $7F5803

#_08DC46: LDA.b #$17
#_08DC48: STA.w $03B1,X

#_08DC4B: STZ.w $0394,X
#_08DC4E: STZ.w $0C5E,X

#_08DC51: LDA.b #$08
#_08DC53: STA.w $039F,X

#_08DC56: STZ.w $0C54,X
#_08DC59: STZ.w $0385,X

#_08DC5C: LDA.b #$02
#_08DC5E: STA.w $03A4,X

#_08DC61: LDA.b #$15
#_08DC63: STA.w $0C68,X

#_08DC66: DEC A
#_08DC67: STA.l $7F5808

#_08DC6B: LDA.b #$30 ; SFX3.30
#_08DC6D: JSR Ancilla_SFX3_Near

;===================================================================================================

Ancilla31_ByrnaSpark:
#_08DC70: PHX

#_08DC71: LDA.b #$02
#_08DC73: STA.b $73

#_08DC75: LDA.b $11
#_08DC77: BEQ .continue

#_08DC79: BRL ByrnaSpark_Animate

.continue
#_08DC7C: LDA.w $0303
#_08DC7F: CMP.b #$0D
#_08DC81: BNE .terminate

#_08DC83: LDA.b #$01
#_08DC85: STA.w $037B

#_08DC88: DEC.w $03B1,X

#_08DC8B: LDA.w $03B1,X
#_08DC8E: BNE .keep_sparkling

#_08DC90: LDA.b #$01
#_08DC92: STA.w $03B1,X

#_08DC95: LDA.l $7EF37B
#_08DC99: TAY

#_08DC9A: LDA.w ByrnaMagicCost,Y
#_08DC9D: STA.b $00

#_08DC9F: LDA.l $7EF36E
#_08DCA3: BEQ .terminate

#_08DCA5: SEC
#_08DCA6: SBC.b $00
#_08DCA8: CMP.b #$80
#_08DCAA: BCS .terminate

#_08DCAC: STA.b $00

#_08DCAE: DEC.w $0394,X
#_08DCB1: BPL .delay_sap

#_08DCB3: LDA.b #$17
#_08DCB5: STA.w $0394,X

#_08DCB8: LDA.b $00
#_08DCBA: STA.l $7EF36E

.delay_sap
#_08DCBE: BIT.b $F4
#_08DCC0: BVC .keep_sparkling

;---------------------------------------------------------------------------------------------------

.terminate
#_08DCC2: PLX

#_08DCC3: STZ.w $037B

#_08DCC6: STZ.w $0C4A,X

#_08DCC9: STZ.w $0373

#_08DCCC: RTS

;---------------------------------------------------------------------------------------------------

.keep_sparkling
#_08DCCD: LDA.w $0C54,X
#_08DCD0: CMP.b #$03
#_08DCD2: BEQ .all_sparks

#_08DCD4: LDY.b #$00

#_08DCD6: INC.w $0C5E,X

#_08DCD9: LDA.w $0C5E,X
#_08DCDC: CMP.b #$04
#_08DCDE: BCC .not_all_sparks

#_08DCE0: LDY.b #$03
#_08DCE2: BRA .set_spark_count

.not_all_sparks
#_08DCE4: CMP.b #$02
#_08DCE6: BNE .not_two

#_08DCE8: LDY.b #$01

.not_two
#_08DCEA: CMP.b #$03
#_08DCEC: BNE .set_spark_count

#_08DCEE: LDY.b #$02

.set_spark_count
#_08DCF0: TYA
#_08DCF1: STA.w $0C54,X

.all_sparks
#_08DCF4: DEC.w $03A4,X
#_08DCF7: BPL ByrnaSpark_Animate

#_08DCF9: LDA.b #$02
#_08DCFB: STA.w $03A4,X

#_08DCFE: LDA.b #$04
#_08DD00: STA.b $73

;===================================================================================================

ByrnaSpark_Animate:
#_08DD02: REP #$20

#_08DD04: LDA.b $24
#_08DD06: AND.w #$00FF
#_08DD09: CMP.w #$0080
#_08DD0C: BCC .positive_z

#_08DD0E: ORA.w #$FF00

.positive_z
#_08DD11: CMP.w #$FFFF
#_08DD14: BNE .nonzero_z

#_08DD16: LDA.w #$0000

.nonzero_z
#_08DD19: EOR.w #$FFFF
#_08DD1C: INC A

#_08DD1D: CLC
#_08DD1E: ADC.b $20

#_08DD20: CLC
#_08DD21: ADC.w #$000C
#_08DD24: STA.l $7F5810

#_08DD28: LDA.b $22
#_08DD2A: CLC
#_08DD2B: ADC.w #$0008
#_08DD2E: STA.l $7F580E

;---------------------------------------------------------------------------------------------------

#_08DD32: SEP #$20

#_08DD34: LDA.w $0C68,X
#_08DD37: BNE .skip_sfx

#_08DD39: LDA.b #$15
#_08DD3B: STA.w $0C68,X

#_08DD3E: LDA.b #$30 ; SFX3.30
#_08DD40: JSR Ancilla_SFX3_Near

.skip_sfx
#_08DD43: STX.b $74

#_08DD45: LDY.b #$00

#_08DD47: LDA.w $0C54,X
#_08DD4A: TAX

;---------------------------------------------------------------------------------------------------

.next_object
#_08DD4B: STX.b $72

#_08DD4D: LDA.b $11
#_08DD4F: BNE .dont_inc_sparkle

#_08DD51: LDA.l $7F5800,X
#_08DD55: CLC
#_08DD56: ADC.b #$03
#_08DD58: AND.b #$3F
#_08DD5A: STA.l $7F5800,X

.dont_inc_sparkle
#_08DD5E: PHX
#_08DD5F: PHY

#_08DD60: LDA.l $7F5808
#_08DD64: STA.b $08

#_08DD66: LDA.l $7F5800,X
#_08DD6A: JSR Ancilla_GetRadialProjection
#_08DD6D: JSL Sparkle_PrepOAMFromRadial

#_08DD71: PLY

#_08DD72: JSR Ancilla_SetOAM_XY

#_08DD75: LDX.b $72

#_08DD77: LDA.w Ancilla2B_SpinAttackSparkleB_char,X
#_08DD7A: STA.b ($90),Y

#_08DD7C: INY

#_08DD7D: LDA.b $73
#_08DD7F: ORA.b $65
#_08DD81: STA.b ($90),Y

#_08DD83: INY
#_08DD84: PHY

#_08DD85: TYA
#_08DD86: SEC
#_08DD87: SBC.b #$04
#_08DD89: LSR A
#_08DD8A: LSR A
#_08DD8B: TAY

#_08DD8C: LDA.b #$00
#_08DD8E: STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

#_08DD90: REP #$20

#_08DD92: LDA.b $00
#_08DD94: CLC
#_08DD95: ADC.b $E8
#_08DD97: STA.b $04

#_08DD99: LDA.b $02
#_08DD9B: CLC
#_08DD9C: ADC.b $E2
#_08DD9E: STA.b $06

#_08DDA0: SEP #$20

#_08DDA2: LDX.b $74

#_08DDA4: LDA.b $04
#_08DDA6: STA.w $0BFA,X

#_08DDA9: LDA.b $05
#_08DDAB: STA.w $0C0E,X

#_08DDAE: LDA.b $06
#_08DDB0: STA.w $0C04,X

#_08DDB3: LDA.b $07
#_08DDB5: STA.w $0C18,X

#_08DDB8: STZ.w $0C72,X

#_08DDBB: JSR Ancilla_CheckSpriteCollision

#_08DDBE: PLY

#_08DDBF: PLX
#_08DDC0: DEX
#_08DDC1: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08DDC3: PLX

#_08DDC4: RTS

;===================================================================================================

Ancilla0C_SwordBeam_bounce:
#_08DDC5: JSL Ancilla0C_SwordBeam

#_08DDC9: RTS

;===================================================================================================

Ancilla0D_SpinAttackFullChargeSpark:
#_08DDCA: LDA.b #$04
#_08DDCC: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08DDCF: TYA
#_08DDD0: STA.w $0C86,X

#_08DDD3: JSL Ancilla0D_SpinAttackFullChargeSpark_long

#_08DDD7: RTS

;===================================================================================================

pool Ancilla27_Duck CutsceneDuck_Draw

.char
#_08DDD8: db $0E, $00, $02

.prop
#_08DDDB: db $22, $2E, $2E

.offset_y
#_08DDDE: db   0,  12,  20

.offset_x
#_08DDE1: db   0,  -9,  -9

.vram_offset
#_08DDE4: db $00, $20, $40, $E0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla27_Duck:
#_08DDE8: LDA.b $11
#_08DDEA: BEQ .continue

#_08DDEC: BRL .animate

.continue
#_08DDEF: LDA.w $0C68,X
#_08DDF2: BEQ .seek_link

#_08DDF4: REP #$20

#_08DDF6: LDA.b $20
#_08DDF8: SEC
#_08DDF9: SBC.w #$0008
#_08DDFC: STA.b $00

#_08DDFE: LDA.w #$FFF0
#_08DE01: CLC
#_08DE02: ADC.b $E2
#_08DE04: STA.b $02

#_08DE06: SEP #$20

#_08DE08: LDA.b $00
#_08DE0A: STA.w $0BFA,X

#_08DE0D: LDA.b $01
#_08DE0F: STA.w $0C0E,X

#_08DE12: LDA.b $02
#_08DE14: STA.w $0C04,X

#_08DE17: LDA.b $03
#_08DE19: STA.w $0C18,X

#_08DE1C: RTS

;---------------------------------------------------------------------------------------------------

.seek_link
#_08DE1D: DEC.w $0394,X
#_08DE20: BPL .delay_flap_sfx

#_08DE22: LDA.b #$28
#_08DE24: STA.w $0394,X

#_08DE27: LDA.b #$1E ; SFX3.1E
#_08DE29: JSR Ancilla_SFX3_Pan

;---------------------------------------------------------------------------------------------------

.delay_flap_sfx
#_08DE2C: LDY.w $0385,X
#_08DE2F: BNE .swoop_down

#_08DE31: LDA.w $0C54,X
#_08DE34: BEQ .maintain_altitude

#_08DE36: INC.w $0FC1

.swoop_down
#_08DE39: LDA.w $0294,X
#_08DE3C: CLC
#_08DE3D: ADC.b #$FF
#_08DE3F: STA.w $0294,X

#_08DE42: JSR Ancilla_Move_Z

.maintain_altitude
#_08DE45: JSR Ancilla_Move_X

#_08DE48: LDA.w $0385,X
#_08DE4B: BEQ .picking_up

#_08DE4D: BRL .dropping_off

;---------------------------------------------------------------------------------------------------

.dont_pick_up
#_08DE50: BRL .continue_from_pickup

.picking_up
#_08DE53: LDY.b #$01
#_08DE55: JSR Ancilla_CheckLinkCollision
#_08DE58: BCC .dont_pick_up

#_08DE5A: LDA.b $10
#_08DE5C: CMP.b #$0F
#_08DE5E: BEQ .dont_pick_up

#_08DE60: LDA.b $1B
#_08DE62: BNE .continue_the_pick

#_08DE64: LDA.b $5D
#_08DE66: CMP.b #$0A ; LINKSTATE 0A
#_08DE68: BEQ .dont_pick_up

#_08DE6A: CMP.b #$09 ; LINKSTATE 09
#_08DE6C: BEQ .dont_pick_up

#_08DE6E: CMP.b #$08 ; LINKSTATE 08
#_08DE70: BEQ .dont_pick_up

#_08DE72: LDA.b $5B
#_08DE74: CMP.b #$02
#_08DE76: BEQ .dont_pick_up

#_08DE78: LDA.w $02DA
#_08DE7B: ORA.w $037E
#_08DE7E: ORA.w $03EF
#_08DE81: ORA.w $037B
#_08DE84: BNE .dont_pick_up

#_08DE86: BIT.w $0308
#_08DE89: BMI .dont_pick_up

;---------------------------------------------------------------------------------------------------

#_08DE8B: PHX

#_08DE8C: LDX.b #$04

.next_ancilla_delete
#_08DE8E: LDA.w $0C4A,X
#_08DE91: CMP.b #$2A ; ANCILLA 2A
#_08DE93: BEQ .delete_ancilla

#_08DE95: CMP.b #$1F ; ANCILLA 1F
#_08DE97: BEQ .delete_ancilla

#_08DE99: CMP.b #$30 ; ANCILLA 30
#_08DE9B: BEQ .delete_ancilla

#_08DE9D: CMP.b #$31 ; ANCILLA 31
#_08DE9F: BEQ .delete_ancilla

#_08DEA1: CMP.b #$41 ; ANCILLA 41
#_08DEA3: BNE .dont_delete_ancilla

.delete_ancilla
#_08DEA5: STZ.w $0C4A,X

.dont_delete_ancilla
#_08DEA8: DEX
#_08DEA9: BPL .next_ancilla_delete

#_08DEAB: PLX

;---------------------------------------------------------------------------------------------------

#_08DEAC: LDA.l $7EF3CC
#_08DEB0: CMP.b #$09 ; FOLLOWER 09
#_08DEB2: BNE .continue_the_pick

#_08DEB4: LDA.b #$00
#_08DEB6: STA.l $7EF3CC
#_08DEBA: STA.w $02F9

.continue_the_pick
#_08DEBD: REP #$20

#_08DEBF: STZ.w $0308
#_08DEC2: STZ.w $011A
#_08DEC5: STZ.w $011C

#_08DEC8: SEP #$20

#_08DECA: JSL Link_ResetProperties_A

#_08DECE: STZ.w $0345
#_08DED1: STZ.w $03F8

#_08DED4: LDA.b #$0C
#_08DED6: STA.b $4B

#_08DED8: LDA.b #$00 ; LINKSTATE 00
#_08DEDA: STA.b $5D

#_08DEDC: INC A
#_08DEDD: STA.w $02DA
#_08DEE0: STA.w $02E4
#_08DEE3: STA.w $037B
#_08DEE6: STA.w $02F9

#_08DEE9: INC A
#_08DEEA: STA.w $0C54,X

#_08DEED: INC.w $0FC1

#_08DEF0: STZ.w $0373

#_08DEF3: LDA.b $1B
#_08DEF5: BEQ .continue_from_pickup

#_08DEF7: STA.w $03FD

.continue_from_pickup
#_08DEFA: BRA .animate

;---------------------------------------------------------------------------------------------------

.dropping_off
#_08DEFC: LDA.w $0C04,X
#_08DEFF: STA.b $00

#_08DF01: LDA.w $0C18,X
#_08DF04: STA.b $01

#_08DF06: LDA.w $0C54,X
#_08DF09: BEQ .dont_freeze_npcs

#_08DF0B: INC.w $0FC1

.dont_freeze_npcs
#_08DF0E: REP #$20

#_08DF10: LDA.b $00
#_08DF12: BMI .delay_dropoff

#_08DF14: CMP.b $22
#_08DF16: BCC .delay_dropoff

;---------------------------------------------------------------------------------------------------

#_08DF18: SEP #$20

#_08DF1A: LDA.w $0C54,X
#_08DF1D: BEQ .animate

#_08DF1F: STZ.w $0C54,X

#_08DF22: STZ.b $4B

#_08DF24: STZ.w $02F9
#_08DF27: STZ.w $02DA

#_08DF2A: STZ.w $0C22,X

#_08DF2D: STZ.w $02E4
#_08DF30: STZ.w $037B
#_08DF33: STZ.w $03FD

#_08DF36: LDA.b #$90
#_08DF38: STA.w $031F

#_08DF3B: LDA.l $7EF3CC
#_08DF3F: CMP.b #$0D ; FOLLOWER 0D
#_08DF41: BEQ .check_followering

#_08DF43: CMP.b #$0C ; FOLLOWER 0C
#_08DF45: BNE .do_not_check

.check_followering
#_08DF47: LDA.l $7EF3D3
#_08DF4B: BNE .animate

.do_not_check
#_08DF4D: JSL Follower_Initialize
#_08DF51: BRA .animate

.delay_dropoff
#_08DF53: LDA.b $22
#_08DF55: SEC
#_08DF56: SBC.b $00
#_08DF58: CMP.w #$0030
#_08DF5B: BCS .animate

#_08DF5D: LDY.b #$03

#_08DF5F: SEP #$20

#_08DF61: BRA .set_vram_offset

;---------------------------------------------------------------------------------------------------

.animate
#_08DF63: SEP #$20

#_08DF65: DEC.w $039F,X
#_08DF68: BPL .delay_step

#_08DF6A: LDA.b #$03
#_08DF6C: STA.w $039F,X

#_08DF6F: INC.w $0380,X

#_08DF72: LDA.w $0380,X
#_08DF75: CMP.b #$03
#_08DF77: BNE .delay_step

#_08DF79: STZ.w $0380,X

.delay_step
#_08DF7C: LDY.w $0380,X

;---------------------------------------------------------------------------------------------------

.set_vram_offset
#_08DF7F: LDA.w .vram_offset+0,Y
#_08DF82: STA.w $0AF4

#_08DF85: JSR Ancilla_PrepOAMCoord

#_08DF88: REP #$20

#_08DF8A: LDA.w $029E,X
#_08DF8D: AND.w #$00FF
#_08DF90: BEQ .positive_altitiude

#_08DF92: ORA.w #$FF00

.positive_altitiude
#_08DF95: STA.b $04
#_08DF97: STA.b $72

#_08DF99: LDA.b $00
#_08DF9B: STA.b $0A

#_08DF9D: CLC
#_08DF9E: ADC.b $04
#_08DFA0: STA.b $04

#_08DFA2: LDA.b $02
#_08DFA4: STA.b $06

;---------------------------------------------------------------------------------------------------

#_08DFA6: SEP #$20

#_08DFA8: PHX

#_08DFA9: LDA.w $0C54,X

#_08DFAC: INC A
#_08DFAD: STA.b $08

#_08DFAF: LDY.b #$00
#_08DFB1: TYX

.next_object
#_08DFB2: REP #$20

#_08DFB4: LDA.w .offset_y,X
#_08DFB7: AND.w #$00FF
#_08DFBA: CMP.w #$0080
#_08DFBD: BCC .positive_y

#_08DFBF: ORA.w #$FF00

.positive_y
#_08DFC2: CLC
#_08DFC3: ADC.b $04
#_08DFC5: STA.b $00

#_08DFC7: LDA.w .offset_x,X
#_08DFCA: AND.w #$00FF
#_08DFCD: CMP.w #$0080
#_08DFD0: BCC .positive_x

#_08DFD2: ORA.w #$FF00

.positive_x
#_08DFD5: CLC
#_08DFD6: ADC.b $06
#_08DFD8: STA.b $02

#_08DFDA: SEP #$20

#_08DFDC: JSR Ancilla_SetOAM_XY

#_08DFDF: LDA.w .char,X
#_08DFE2: STA.b ($90),Y

#_08DFE4: INY

#_08DFE5: LDA.w .prop,X
#_08DFE8: ORA.b #$30
#_08DFEA: STA.b ($90),Y

#_08DFEC: INY
#_08DFED: PHY

#_08DFEE: TYA
#_08DFEF: SEC
#_08DFF0: SBC.b #$04
#_08DFF2: LSR A
#_08DFF3: LSR A
#_08DFF4: TAY

#_08DFF5: LDA.b #$02
#_08DFF7: STA.b ($92),Y

#_08DFF9: PLY

#_08DFFA: INX
#_08DFFB: CPX.b $08
#_08DFFD: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08DFFF: REP #$20

#_08E001: LDA.b $0A
#_08E003: CLC
#_08E004: ADC.w #$001C
#_08E007: STA.b $00

#_08E009: LDA.b $06
#_08E00B: STA.b $02

#_08E00D: SEP #$20

#_08E00F: LDA.b #$30
#_08E011: STA.b $04

#_08E013: LDX.b #$01
#_08E015: JSR AncillaDraw_Shadow

#_08E018: LDX.w $0FA0

#_08E01B: LDA.w $0C54,X
#_08E01E: BEQ .no_link_shadow

#_08E020: REP #$20

#_08E022: LDA.b $0A
#_08E024: CLC
#_08E025: ADC.w #$001C
#_08E028: STA.b $00

#_08E02A: LDA.b $06
#_08E02C: CLC
#_08E02D: ADC.w #$FFF9
#_08E030: STA.b $02

#_08E032: SEP #$20

#_08E034: LDA.b #$30
#_08E036: STA.b $04

#_08E038: LDX.b #$01
#_08E03A: JSR AncillaDraw_Shadow

.no_link_shadow
#_08E03D: PLX

;---------------------------------------------------------------------------------------------------

#_08E03E: REP #$20

#_08E040: LDA.b $06
#_08E042: BMI .exit

#_08E044: CMP.w #$0130
#_08E047: BCC .exit

#_08E049: SEP #$20

#_08E04B: STZ.w $0C4A,X

#_08E04E: LDA.w $0385,X
#_08E051: BNE .exit

#_08E053: LDA.w $0C54,X
#_08E056: BEQ .exit

#_08E058: LDA.b #$0A
#_08E05A: STA.b $11

#_08E05C: LDA.b $10
#_08E05E: STA.w $010C

#_08E061: LDA.b #$0E
#_08E063: STA.b $10

;---------------------------------------------------------------------------------------------------

.exit
#_08E065: SEP #$20

#_08E067: RTS

;===================================================================================================

pool AncillaAdd_SomariaBlock

.offset_y
#_08E068: dw  -8 ; up
#_08E06A: dw  31 ; down
#_08E06C: dw  17 ; left
#_08E06E: dw  17 ; right

.offset_x
#_08E070: dw   8 ; up
#_08E072: dw   8 ; down
#_08E074: dw  -8 ; left
#_08E076: dw  23 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_SomariaBlock:
#_08E078: PHB
#_08E079: PHK
#_08E07A: PLB

#_08E07B: JSR AncillaAdd_AddAncilla_Bank08
#_08E07E: BCC .spawn_the_block

#_08E080: BRL .refund

;---------------------------------------------------------------------------------------------------

.spawn_the_block
#_08E083: PHX

#_08E084: STX.b $00

#_08E086: LDX.b #$04

.next_block_check
#_08E088: CPX.b $00
#_08E08A: BEQ .skip

#_08E08C: LDA.w $0C4A,X
#_08E08F: CMP.b #$2C ; ANCILLA 2C
#_08E091: BNE .skip

;---------------------------------------------------------------------------------------------------

#_08E093: STX.b $02

#_08E095: LDA.w $02EC
#_08E098: DEC A
#_08E099: CMP.b $02
#_08E09B: BNE .not_closest_carryable

#_08E09D: STZ.w $02EC

.not_closest_carryable
#_08E0A0: JSL AncillaAdd_ExplodingSomariaBlock

#_08E0A4: PLX

#_08E0A5: STZ.w $0C4A,X

#_08E0A8: STZ.w $0646

#_08E0AB: LDA.b $5E
#_08E0AD: CMP.b #$12
#_08E0AF: BNE .dont_reset_speed

#_08E0B1: STZ.b $48
#_08E0B3: STZ.b $5E

.dont_reset_speed
#_08E0B5: BRL .exit

;---------------------------------------------------------------------------------------------------

.skip
#_08E0B8: DEX
#_08E0B9: BPL .next_block_check

;---------------------------------------------------------------------------------------------------

#_08E0BB: PLX

#_08E0BC: LDA.b #$2A ; SFX3.2A
#_08E0BE: JSR Ancilla_SFX3_Near

#_08E0C1: STZ.w $0C54,X

#_08E0C4: STZ.w $0C22,X
#_08E0C7: STZ.w $0C2C,X

#_08E0CA: STZ.w $0C5E,X

#_08E0CD: STZ.w $03B1,X
#_08E0D0: STZ.w $039F,X
#_08E0D3: STZ.w $03A4,X
#_08E0D6: STZ.w $03C5,X

#_08E0D9: LDA.b #$0C
#_08E0DB: STA.w $0394,X

#_08E0DE: LDA.b #$12
#_08E0E0: STA.w $0C68,X

#_08E0E3: STZ.w $0385,X
#_08E0E6: STZ.w $029E,X

#_08E0E9: STZ.w $0380,X
#_08E0EC: STZ.w $03EA,X

#_08E0EF: STZ.w $0BF0,X

#_08E0F2: LDA.b #$09
#_08E0F4: STA.w $03A9,X

#_08E0F7: STZ.w $03D5,X

;---------------------------------------------------------------------------------------------------

#_08E0FA: LDA.b $2F
#_08E0FC: LSR A
#_08E0FD: STA.w $0C72,X

#_08E100: JSL Ancilla_CheckInitialTileCollision_Class2
#_08E104: BCC .space_to_spawn

#_08E106: REP #$20

#_08E108: LDA.b $20
#_08E10A: CLC
#_08E10B: ADC.w #$0010
#_08E10E: STA.b $00

#_08E110: LDA.b $22
#_08E112: CLC
#_08E113: ADC.w #$0008
#_08E116: STA.b $02

#_08E118: SEP #$20

#_08E11A: LDA.b $00
#_08E11C: STA.w $0BFA,X

#_08E11F: LDA.b $01
#_08E121: STA.w $0C0E,X

#_08E124: LDA.b $02
#_08E126: STA.w $0C04,X

#_08E129: LDA.b $03
#_08E12B: STA.w $0C18,X

#_08E12E: BRA .exit

;---------------------------------------------------------------------------------------------------

.space_to_spawn
#_08E130: LDY.b $2F

#_08E132: LDA.b $20
#_08E134: CLC
#_08E135: ADC.w .offset_y+0,Y
#_08E138: STA.w $0BFA,X

#_08E13B: LDA.b $21
#_08E13D: ADC.w .offset_y+1,Y
#_08E140: STA.w $0C0E,X

#_08E143: LDA.b $22
#_08E145: CLC
#_08E146: ADC.w .offset_x+0,Y
#_08E149: STA.w $0C04,X

#_08E14C: LDA.b $23
#_08E14E: ADC.w .offset_x+1,Y
#_08E151: STA.w $0C18,X

#_08E154: JSR SomariaBlock_CheckForTransitTile

#_08E157: BRA .exit

;---------------------------------------------------------------------------------------------------

.refund
#_08E159: LDX.b #$04
#_08E15B: JSL Refund_Magic

.exit
#_08E15F: PLB

#_08E160: RTL

;===================================================================================================

pool SomariaBlock_CheckForTransitTile

.offset_y
#_08E161: dw -16, -16, -16,  16,  16,  16
#_08E16D: dw  -8,   0,   8,  -8,   0,   8

.offset_x
#_08E179: dw  -8,   0,   8,  -8,   0,   8
#_08E185: dw -16, -16, -16,  16,  16,  16

pool off

;---------------------------------------------------------------------------------------------------

SomariaBlock_CheckForTransitTile:
#_08E191: LDA.w $03F4
#_08E194: BEQ .exit

#_08E196: LDY.b #$16

.next
#_08E198: LDA.w $0BFA,X
#_08E19B: CLC
#_08E19C: ADC.w .offset_y+0,Y
#_08E19F: STA.b $00
#_08E1A1: STA.b $72

#_08E1A3: LDA.w $0C0E,X
#_08E1A6: ADC.w .offset_y+1,Y
#_08E1A9: STA.b $01
#_08E1AB: STA.b $73

#_08E1AD: LDA.w $0C04,X
#_08E1B0: CLC
#_08E1B1: ADC.w .offset_x+0,Y
#_08E1B4: STA.b $02
#_08E1B6: STA.b $74

#_08E1B8: LDA.w $0C18,X
#_08E1BB: ADC.w .offset_x+1,Y
#_08E1BE: STA.b $03
#_08E1C0: STA.b $75

#_08E1C2: PHY

#_08E1C3: LDA.w $0280,X
#_08E1C6: PHA

#_08E1C7: JSR Ancilla_CheckTileCollision_targeted

#_08E1CA: PLA
#_08E1CB: STA.w $0280,X

#_08E1CE: PLY
#_08E1CF: LDA.w $03E4,X

#_08E1D2: CMP.b #$B6 ; TILETYPE B6
#_08E1D4: BEQ .node

#_08E1D6: CMP.b #$BC ; TILETYPE BC
#_08E1D8: BEQ .node

#_08E1DA: DEY
#_08E1DB: DEY
#_08E1DC: BPL .next

#_08E1DE: BRA .exit

;---------------------------------------------------------------------------------------------------

.node
#_08E1E0: LDA.b $72
#_08E1E2: STA.w $0BFA,X

#_08E1E5: LDA.b $73
#_08E1E7: STA.w $0C0E,X

#_08E1EA: LDA.b $74
#_08E1EC: STA.w $0C04,X

#_08E1EF: LDA.b $75
#_08E1F1: STA.w $0C18,X

#_08E1F4: JSL AncillaAdd_SomariaPlatformPoof

.exit
#_08E1F8: RTS

;===================================================================================================

Ancilla_CheckBasicSpriteCollision:
#_08E1F9: LDY.b #$0F

.next_sprite
#_08E1FB: TYA
#_08E1FC: EOR.b $1A
#_08E1FE: AND.b #$03

#_08E200: ORA.w $0F00,Y
#_08E203: ORA.w $0EF0,Y
#_08E206: BNE .skip

#_08E208: LDA.w $0DD0,Y
#_08E20B: CMP.b #$09
#_08E20D: BCC .skip

#_08E20F: LDA.w $0CAA,Y
#_08E212: AND.b #$02
#_08E214: BNE .sprite_ignores_priority

#_08E216: LDA.w $0280,X
#_08E219: BNE .skip

.sprite_ignores_priority
#_08E21B: LDA.w $0C7C,X
#_08E21E: CMP.w $0F20,Y
#_08E221: BNE .skip

#_08E223: LDA.w $0C4A,X
#_08E226: CMP.b #$2C ; ANCILLA 2C
#_08E228: BNE .not_somaria_block

#_08E22A: LDA.w $0E20,Y
#_08E22D: CMP.b #$1E ; SPRITE 1E
#_08E22F: BEQ .skip

#_08E231: CMP.b #$90 ; SPRITE 90
#_08E233: BEQ .skip

.not_somaria_block
#_08E235: JSR Ancilla_CheckBasicSpriteCollision_Single

.skip
#_08E238: DEY
#_08E239: BPL .next_sprite

#_08E23B: CLC

#_08E23C: RTS

;===================================================================================================

Ancilla_CheckBasicSpriteCollision_Single:
#_08E23D: JSR Ancilla_SetupBasicHitBox

#_08E240: PHY
#_08E241: PHX

#_08E242: TYX
#_08E243: JSL Sprite_SetupHitbox_long

#_08E247: PLX
#_08E248: PLY

#_08E249: JSL CheckIfHitBoxesOverlap_long
#_08E24D: BCC .fail

#_08E24F: LDA.w $0E20,Y
#_08E252: CMP.b #$92 ; SPRITE 92
#_08E254: BNE .not_king_helma

#_08E256: LDA.w $0DB0,Y
#_08E259: CMP.b #$03
#_08E25B: BCC .success

.not_king_helma
#_08E25D: LDA.w $0E20,Y
#_08E260: CMP.b #$80 ; SPRITE 80
#_08E262: BNE .dont_reverse_fire_snake

#_08E264: LDA.w $0F10,Y
#_08E267: BNE .dont_reverse_fire_snake

#_08E269: LDA.b #$18
#_08E26B: STA.w $0F10,Y

#_08E26E: LDA.w $0DE0,Y
#_08E271: EOR.b #$01
#_08E273: STA.w $0DE0,Y

.dont_reverse_fire_snake
#_08E276: LDA.w $0BA0,Y
#_08E279: BNE .fail

#_08E27B: LDA.w $0C04,X
#_08E27E: SEC
#_08E27F: SBC.b #$08
#_08E281: STA.b $04

#_08E283: LDA.w $0C18,X
#_08E286: SBC.b #$00
#_08E288: STA.b $05

#_08E28A: LDA.w $0BFA,X
#_08E28D: SEC
#_08E28E: SBC.b #$08
#_08E290: PHP

#_08E291: SEC
#_08E292: SBC.w $029E,X
#_08E295: STA.b $06

#_08E297: LDA.w $0C0E,X
#_08E29A: SBC.b #$00

#_08E29C: PLP
#_08E29D: SBC.b #$00
#_08E29F: STA.b $07

#_08E2A1: LDA.b #$50

#_08E2A3: PHY
#_08E2A4: PHX

#_08E2A5: TYX
#_08E2A6: JSL Sprite_ProjectSpeedTowardsLocation_long

#_08E2AA: PLX
#_08E2AB: PLY

#_08E2AC: LDA.b $00
#_08E2AE: EOR.b #$FF
#_08E2B0: STA.w $0F30,Y

#_08E2B3: LDA.b $01
#_08E2B5: EOR.b #$FF
#_08E2B7: STA.w $0F40,Y

#_08E2BA: PHX

#_08E2BB: LDA.w $0C4A,X

#_08E2BE: TYX
#_08E2BF: JSL Ancilla_CheckDamageToSprite

#_08E2C3: PLX

;---------------------------------------------------------------------------------------------------

.success
#_08E2C4: PLA
#_08E2C5: PLA

#_08E2C6: SEC

#_08E2C7: RTS

.fail
#_08E2C8: CLC

#_08E2C9: RTS

;===================================================================================================

Ancilla_SetupBasicHitBox:
#_08E2CA: LDA.w $0C04,X
#_08E2CD: SEC
#_08E2CE: SBC.b #$08
#_08E2D0: STA.b $00

#_08E2D2: LDA.w $0C18,X
#_08E2D5: SBC.b #$00
#_08E2D7: STA.b $08

#_08E2D9: LDA.w $0BFA,X
#_08E2DC: SEC
#_08E2DD: SBC.b #$08
#_08E2DF: PHP

#_08E2E0: SEC
#_08E2E1: SBC.w $029E,X
#_08E2E4: STA.b $01

#_08E2E6: LDA.w $0C0E,X
#_08E2E9: SBC.b #$00

#_08E2EB: PLP
#_08E2EC: SBC.b #$00
#_08E2EE: STA.b $09

#_08E2F0: LDA.b #$0F
#_08E2F2: STA.b $02

#_08E2F4: LDA.b #$0F
#_08E2F6: STA.b $03

;---------------------------------------------------------------------------------------------------

#EXIT_08E2F8:
#_08E2F8: RTS

;===================================================================================================

pool AncillaDraw_SomariaBlock

.prop
#_08E2F9: db $00, $40, $80, $C0
#_08E2FD: db $00, $40, $80, $C0
#_08E301: db $00, $40, $80, $C0

.offset_y
#_08E305: dw  -8,  -8,   0,   0
#_08E30D: dw   0,   0,   0,   0
#_08E315: dw   0,   0,   0,   0

.offset_x
#_08E31D: dw  -8,   0,  -8,   0
#_08E325: dw   0,   0,   0,   0
#_08E32D: dw   0,   0,   0,   0

pool off

;===================================================================================================

pool Ancilla2C_SomariaBlock

.node_offset_y
#_08E335: dw  -8,   8,   0,   0
#_08E33D: dw   0,   0,   0,   0
#_08E345: dw  -8,   8,  -8,   8

.node_offset_x
#_08E34D: dw   0,   0,  -8,   8
#_08E355: dw   0,   0,   0,   0
#_08E35D: dw   8,  -8,  -8,   8

pool off

;---------------------------------------------------------------------------------------------------

Ancilla2C_SomariaBlock:
#_08E365: DEC.w $0394,X
#_08E368: BPL EXIT_08E2F8

#_08E36A: STZ.w $0394,X

#_08E36D: LDA.w $03C5,X
#_08E370: BNE .bouncing

#_08E372: LDA.b $11
#_08E374: BEQ .continue

#_08E376: CMP.b #$08
#_08E378: BEQ .continue

#_08E37A: CMP.b #$10
#_08E37C: BNE .skip_lift

.continue
#_08E37E: JSR Ancilla_HandleLiftLogic
#_08E381: BRA .handle_lift_logic

;---------------------------------------------------------------------------------------------------

.skip_lift
#_08E383: TXA
#_08E384: INC A
#_08E385: CMP.w $02EC
#_08E388: BNE .handle_lift_logic

#_08E38A: LDA.w $0380,X
#_08E38D: BEQ .handle_lift_logic

#_08E38F: CMP.b #$03
#_08E391: BEQ .assert_holditude

#_08E393: LDY.b #$03
#_08E395: JSR Ancilla_LatchLinkCoordinates
#_08E398: JSR Ancilla_LatchAltitudeAboveLink

#_08E39B: LDA.b #$03
#_08E39D: STA.w $0380,X

.assert_holditude
#_08E3A0: JSR Ancilla_LatchCarriedPosition

;---------------------------------------------------------------------------------------------------

.handle_lift_logic
#_08E3A3: LDA.b $1B
#_08E3A5: BEQ .no_trigger

#_08E3A7: LDA.w $0380,X
#_08E3AA: BNE .bouncing

#_08E3AC: BIT.w $0308
#_08E3AF: BMI .bouncing

#_08E3B1: LDA.w $029E,X
#_08E3B4: BEQ .run_trigger

#_08E3B6: CMP.b #$FF
#_08E3B8: BEQ .run_trigger

;---------------------------------------------------------------------------------------------------

.bouncing
#_08E3BA: TXA
#_08E3BB: INC A
#_08E3BC: CMP.w $02EC
#_08E3BF: BNE .no_trigger

#_08E3C1: STZ.w $0646

.no_trigger
#_08E3C4: BRL .tile_collision_logic

;---------------------------------------------------------------------------------------------------

.run_trigger
#_08E3C7: LDA.w $03F4
#_08E3CA: BEQ .no_transit_tiles

#_08E3CC: LDA.b $1A
#_08E3CE: AND.b #$03
#_08E3D0: ASL A
#_08E3D1: TAY

.next_node_check
#_08E3D2: LDA.w $0BFA,X
#_08E3D5: CLC
#_08E3D6: ADC.w .node_offset_y+0,Y
#_08E3D9: STA.b $00
#_08E3DB: STA.b $72

#_08E3DD: LDA.w $0C0E,X
#_08E3E0: ADC.w .node_offset_y+1,Y
#_08E3E3: STA.b $01
#_08E3E5: STA.b $73

#_08E3E7: LDA.w $0C04,X
#_08E3EA: CLC
#_08E3EB: ADC.w .node_offset_x+0,Y
#_08E3EE: STA.b $02
#_08E3F0: STA.b $74

#_08E3F2: LDA.w $0C18,X
#_08E3F5: ADC.w .node_offset_x+1,Y
#_08E3F8: STA.b $03
#_08E3FA: STA.b $75

#_08E3FC: PHY

#_08E3FD: LDA.w $0280,X
#_08E400: PHA

#_08E401: JSR Ancilla_CheckTileCollision_targeted

#_08E404: PLA
#_08E405: STA.w $0280,X

#_08E408: PLY

#_08E409: LDA.w $03E4,X
#_08E40C: CMP.b #$B6 ; TILETYPE B6
#_08E40E: BEQ .valid_node

#_08E410: CMP.b #$BC ; TILETYPE BC
#_08E412: BEQ .valid_node

#_08E414: TYA
#_08E415: CLC
#_08E416: ADC.b #$08
#_08E418: TAY

#_08E419: CPY.b #$18
#_08E41B: BCS .tile_collision_logic

#_08E41D: BRA .next_node_check

;---------------------------------------------------------------------------------------------------

.valid_node
#_08E41F: LDA.b $72
#_08E421: STA.w $0BFA,X

#_08E424: LDA.b $73
#_08E426: STA.w $0C0E,X

#_08E429: LDA.b $74
#_08E42B: STA.w $0C04,X

#_08E42E: LDA.b $75
#_08E430: STA.w $0C18,X

#_08E433: JSL AncillaAdd_SomariaPlatformPoof

#_08E437: TXA
#_08E438: INC A
#_08E439: CMP.w $02EC
#_08E43C: BNE .exit

#_08E43E: STZ.w $02EC

.exit
#_08E441: RTS

;---------------------------------------------------------------------------------------------------

.no_transit_tiles
#_08E442: JSR SomariaBlock_CheckForSwitch
#_08E445: BCS .tile_collision_logic

#_08E447: LDA.w $029E,X
#_08E44A: BEQ .set_trigger

#_08E44C: CMP.b #$FF
#_08E44E: BNE .tile_collision_logic

.set_trigger
#_08E450: INC.w $0646

;---------------------------------------------------------------------------------------------------

.tile_collision_logic
#_08E453: JSR Ancilla_LatchYCoordToZ

#_08E456: LDA.w $0C72,X
#_08E459: STA.b $74

#_08E45B: LDA.w $0280,X
#_08E45E: STA.b $75

#_08E460: STZ.w $0280,X

#_08E463: JSR Ancilla_CheckTileCollision_Class2

#_08E466: PHP

#_08E467: LDA.b $1B
#_08E469: BEQ .dont_layer_swap

#_08E46B: LDA.w $0385,X
#_08E46E: BEQ .dont_layer_swap

#_08E470: LDA.w $03E4,X
#_08E473: CMP.b #$1C ; TILETYPE 1C
#_08E475: BNE .dont_layer_swap

#_08E477: LDA.b #$01
#_08E479: STA.w $03D5,X

.dont_layer_swap
#_08E47C: PLP
#_08E47D: BCC .no_tile_collision

;---------------------------------------------------------------------------------------------------

.run_wall_bounce_logic
#_08E47F: BIT.w $0308
#_08E482: BPL .not_held

#_08E484: LDA.w $0309
#_08E487: BEQ .no_tile_collision

.not_held
#_08E489: LDA.b $75
#_08E48B: BNE .end_tile_collision_logic

#_08E48D: LDA.w $0BF0,X
#_08E490: BNE .end_tile_collision_logic

#_08E492: LDA.w $029E,X
#_08E495: BEQ .end_tile_collision_logic

#_08E497: LDA.b #$01
#_08E499: STA.w $0BF0,X

#_08E49C: LDA.b #$04
#_08E49E: STA.b $0E

#_08E4A0: LDA.w $0C72,X
#_08E4A3: CMP.b #$01
#_08E4A5: BNE .small_bounce

#_08E4A7: LDA.b #$10
#_08E4A9: STA.b $0E

#_08E4AB: LDY.b #$F0
#_08E4AD: BRA .bounce_continue

.small_bounce
#_08E4AF: LDY.b #$FC

;---------------------------------------------------------------------------------------------------

.bounce_continue
#_08E4B1: LDA.w $0C22,X
#_08E4B4: BEQ .zero_y_speed
#_08E4B6: BPL .bounce_up

#_08E4B8: LDY.b $0E

.bounce_up
#_08E4BA: TYA
#_08E4BB: STA.w $0C22,X

.zero_y_speed
#_08E4BE: LDY.b #$FC

#_08E4C0: LDA.w $0C2C,X
#_08E4C3: BEQ .zero_x_speed
#_08E4C5: BPL .bounce_left

#_08E4C7: LDY.b #$04

.bounce_left
#_08E4C9: TYA
#_08E4CA: STA.w $0C2C,X

.zero_x_speed
#_08E4CD: LDA.w $0C72,X
#_08E4D0: CMP.b #$01
#_08E4D2: BNE .end_tile_collision_logic

#_08E4D4: INC A
#_08E4D5: STA.w $0385,X

#_08E4D8: LDA.b #$FC
#_08E4DA: STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

.end_tile_collision_logic
#_08E4DD: BRL SomariaBlock_HandleDamage

.no_tile_collision
#_08E4E0: BIT.w $0308
#_08E4E3: BMI .end_tile_collision_logic

#_08E4E5: LDA.w $029E,X
#_08E4E8: BEQ .not_airborne

#_08E4EA: CMP.b #$FF
#_08E4EC: BNE .end_tile_collision_logic

.not_airborne
#_08E4EE: LDA.b #$10
#_08E4F0: STA.w $0C72,X

;---------------------------------------------------------------------------------------------------

#_08E4F3: LDA.w $0280,X
#_08E4F6: PHA

#_08E4F7: JSR Ancilla_CheckTileCollision

#_08E4FA: PLA
#_08E4FB: STA.w $0280,X

;---------------------------------------------------------------------------------------------------

#_08E4FE: LDA.w $03E4,X

#_08E501: CMP.b #$26 ; TILETYPE 26
#_08E503: BEQ .staircase_boundary

#_08E505: CMP.b #$0C ; TILETYPE 0C
#_08E507: BEQ .overlay_mask

#_08E509: CMP.b #$1C ; TILETYPE 1C
#_08E50B: BEQ .overlay_mask

#_08E50D: CMP.b #$20 ; TILETYPE 20
#_08E50F: BEQ .pit

#_08E511: CMP.b #$08 ; TILETYPE 08
#_08E513: BEQ .deep_water

#_08E515: CMP.b #$68 ; TILETYPE 68
#_08E517: BEQ .conveyor

#_08E519: CMP.b #$69 ; TILETYPE 69
#_08E51B: BEQ .conveyor

#_08E51D: CMP.b #$6A ; TILETYPE 6A
#_08E51F: BEQ .conveyor

#_08E521: CMP.b #$6B ; TILETYPE 6B
#_08E523: BEQ .conveyor

#_08E525: CMP.b #$B6 ; TILETYPE B6
#_08E527: BEQ .somaria_node_or_path

#_08E529: CMP.b #$BC ; TILETYPE BC
#_08E52B: BEQ .somaria_node_or_path

#_08E52D: AND.b #$F0
#_08E52F: CMP.b #$B0
#_08E531: BNE .somaria_node_or_path

;---------------------------------------------------------------------------------------------------

.pit
#_08E533: BRL SomariaBlock_HandlePitLogic

;---------------------------------------------------------------------------------------------------

.staircase_boundary
#_08E536: BRL .run_wall_bounce_logic

;---------------------------------------------------------------------------------------------------

.conveyor
#_08E539: BRL SomariaBlock_HandleConveyor

;---------------------------------------------------------------------------------------------------

.somaria_node_or_path
#_08E53C: STZ.w $0C68,X

#_08E53F: LDA.w $0385,X
#_08E542: ORA.w $03C5,X
#_08E545: BNE .am_airborne

#_08E547: LDA.b #$02
#_08E549: STA.w $0C68,X

.am_airborne
#_08E54C: BRL SomariaBlock_HandleDamage

;===================================================================================================

.deep_water
#_08E54F: TXA
#_08E550: INC A
#_08E551: CMP.w $02EC
#_08E554: BNE .dont_reset_water

#_08E556: STZ.w $02EC

.dont_reset_water
#_08E559: LDA.w $0C68,X
#_08E55C: BNE .am_airborne

#_08E55E: LDA.w $0BFA,X
#_08E561: CLC
#_08E562: ADC.b #$E8
#_08E564: STA.w $0BFA,X

#_08E567: LDA.w $0C0E,X
#_08E56A: ADC.b #$FF
#_08E56C: STA.w $0C0E,X

#_08E56F: BRL Ancilla_TransmuteToSplash

;===================================================================================================

.overlay_mask
#_08E572: LDA.w $046C
#_08E575: CMP.b #$03
#_08E577: BEQ .layer_2_moving_floor

#_08E579: LDA.w $0C7C,X
#_08E57C: BNE SomariaBlock_HandleDamage

#_08E57E: LDA.w $029E,X
#_08E581: BEQ SomariaBlock_HandleDamage

#_08E583: CMP.b #$FF
#_08E585: BEQ SomariaBlock_HandleDamage

#_08E587: LDA.b #$01
#_08E589: STA.w $0C7C,X

#_08E58C: BRL SomariaBlock_HandleDamage

;---------------------------------------------------------------------------------------------------

.layer_2_moving_floor
#_08E58F: LDA.w $0BFA,X
#_08E592: CLC
#_08E593: ADC.w $0310
#_08E596: STA.b $72

#_08E598: LDA.w $0C0E,X
#_08E59B: ADC.w $0311
#_08E59E: STA.b $73

#_08E5A0: LDA.w $0C04,X
#_08E5A3: CLC
#_08E5A4: ADC.w $0312
#_08E5A7: STA.w $0C04,X

#_08E5AA: LDA.w $0C18,X
#_08E5AD: ADC.w $0313
#_08E5B0: STA.w $0C18,X

#_08E5B3: BRA SomariaBlock_HandleDamage

;===================================================================================================

SomariaBlock_HandleConveyor:
#_08E5B5: JSR Ancilla_ApplyConveyor

#_08E5B8: BRA SomariaBlock_HandleDamage

;===================================================================================================

SomariaBlock_HandlePitLogic:
#_08E5BA: LDA.w $0308
#_08E5BD: BMI SomariaBlock_HandleDamage

#_08E5BF: TXA
#_08E5C0: INC A
#_08E5C1: CMP.w $02EC
#_08E5C4: BNE .dont_reset

#_08E5C6: STZ.w $02EC

.dont_reset
#_08E5C9: LDA.w $0C68,X
#_08E5CC: BNE SomariaBlock_HandleDamage

#_08E5CE: LDA.b $5E
#_08E5D0: CMP.b #$12
#_08E5D2: BNE Ancilla_DeleteSelf

#_08E5D4: STZ.b $5E
#_08E5D6: STZ.b $48

;===================================================================================================

Ancilla_DeleteSelf:
#_08E5D8: STZ.w $0C4A,X

#_08E5DB: RTS

;===================================================================================================

SomariaBlock_HandleDamage:
#_08E5DC: LDA.b $75
#_08E5DE: ORA.w $0280,X
#_08E5E1: STA.b $75

#_08E5E3: LDA.w $0308
#_08E5E6: BMI .dont_fizzle

#_08E5E8: DEC.w $03A9,X

#_08E5EB: LDA.w $03A9,X
#_08E5EE: BNE .dont_fizzle

#_08E5F0: INC.w $03A9,X

#_08E5F3: STZ.w $0280,X

#_08E5F6: JSR Ancilla_CheckBasicSpriteCollision
#_08E5F9: BCC .dont_fizzle

#_08E5FB: LDA.b #$07
#_08E5FD: STA.w $03A9,X

#_08E600: LDA.w $0C54,X
#_08E603: INC A
#_08E604: STA.w $0C54,X

#_08E607: CMP.b #$05
#_08E609: BNE .dont_fizzle

#_08E60B: BRL SomariaBlock_FizzleAway

.dont_fizzle
#_08E60E: LDA.b $74
#_08E610: STA.w $0C72,X

#_08E613: LDA.b $75
#_08E615: STA.w $0280,X

#_08E618: JSR Ancilla_SetYFrom_DP72

;===================================================================================================

AncillaDraw_SomariaBlock:
#_08E61B: TXY
#_08E61C: INY
#_08E61D: CPY.w $02EC
#_08E620: BNE .not_special_oam_slots

#_08E622: LDA.w $0308
#_08E625: BPL .not_special_oam_slots

#_08E627: LDA.w $0380,X
#_08E62A: CMP.b #$03
#_08E62C: BEQ .not_special_oam_slots

#_08E62E: LDA.b $2F
#_08E630: BNE .not_special_oam_slots

#_08E632: LDA.w $0C90,X
#_08E635: JSR Ancilla_AllocateOAMFromRegion_B_or_E

#_08E638: BRA .prep_coord

.not_special_oam_slots
#_08E63A: LDA.w $0FB3
#_08E63D: BEQ .prep_coord

#_08E63F: LDA.w $0C7C,X
#_08E642: BEQ .prep_coord

#_08E644: LDA.w $0385,X
#_08E647: BNE .airborne_slots

#_08E649: TXY
#_08E64A: INY
#_08E64B: CPY.w $02EC
#_08E64E: BNE .prep_coord

#_08E650: LDA.w $0308
#_08E653: BPL .prep_coord

;---------------------------------------------------------------------------------------------------

.airborne_slots
#_08E655: REP #$20

#_08E657: LDA.w #$00D0
#_08E65A: CLC
#_08E65B: ADC.w #$0800
#_08E65E: STA.b $90

#_08E660: LDA.w #$0034
#_08E663: CLC
#_08E664: ADC.w #$0A20
#_08E667: STA.b $92

#_08E669: SEP #$20

;---------------------------------------------------------------------------------------------------

.prep_coord
#_08E66B: JSR Ancilla_PrepOAMCoord_adjusted

#_08E66E: REP #$20

#_08E670: LDA.w $029E,X
#_08E673: AND.w #$00FF
#_08E676: CMP.w #$0080
#_08E679: BCC .positive_z

#_08E67B: ORA.w #$FF00

.positive_z
#_08E67E: STA.b $04
#_08E680: BEQ .not_max_priority

#_08E682: CMP.w #$FFFF
#_08E685: BEQ .not_max_priority

#_08E687: LDA.w $0380,X
#_08E68A: AND.w #$00FF
#_08E68D: CMP.w #$0003
#_08E690: BEQ .not_max_priority

#_08E692: LDA.w $0280,X
#_08E695: AND.w #$00FF
#_08E698: BEQ .not_max_priority

#_08E69A: LDA.w #$3000
#_08E69D: STA.b $64

.not_max_priority
#_08E69F: LDA.w #$0000
#_08E6A2: CLC
#_08E6A3: ADC.b $04

#_08E6A5: EOR.w #$FFFF
#_08E6A8: INC A

#_08E6A9: CLC
#_08E6AA: ADC.b $00
#_08E6AC: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08E6AE: LDA.b $02
#_08E6B0: STA.b $06

#_08E6B2: SEP #$20

#_08E6B4: STZ.b $08

#_08E6B6: PHX

#_08E6B7: LDA.b #$02
#_08E6B9: STA.b $72

#_08E6BB: LDA.w $03A4,X
#_08E6BE: ASL A
#_08E6BF: ASL A
#_08E6C0: TAX

;---------------------------------------------------------------------------------------------------

#_08E6C1: LDY.b #$00

.next_object
#_08E6C3: REP #$20

#_08E6C5: STZ.b $74

#_08E6C7: PHX

#_08E6C8: TXA
#_08E6C9: ASL A
#_08E6CA: TAX

#_08E6CB: LDA.b $04
#_08E6CD: CLC
#_08E6CE: ADC.w .offset_y,X
#_08E6D1: STA.b $00

#_08E6D3: LDA.b $06
#_08E6D5: CLC
#_08E6D6: ADC.w .offset_x,X
#_08E6D9: STA.b $02

#_08E6DB: PLX

#_08E6DC: SEP #$20

#_08E6DE: JSR Ancilla_SetOAM_XY_safe

#_08E6E1: LDA.b #$E9
#_08E6E3: STA.b ($90),Y

#_08E6E5: INY

#_08E6E6: LDA.w .prop,X
#_08E6E9: AND.b #$CF
#_08E6EB: ORA.b $72
#_08E6ED: ORA.b $65
#_08E6EF: STA.b ($90),Y

#_08E6F1: INY
#_08E6F2: PHY

#_08E6F3: TYA
#_08E6F4: SEC
#_08E6F5: SBC.b #$04
#_08E6F7: LSR A
#_08E6F8: LSR A
#_08E6F9: TAY

#_08E6FA: LDA.b #$00
#_08E6FC: ORA.b $75
#_08E6FE: STA.b ($92),Y

#_08E700: PLY

#_08E701: INX

#_08E702: INC.b $08

#_08E704: LDA.b $08
#_08E706: AND.b #$03
#_08E708: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08E70A: PLX

#_08E70B: LDA.w $0380,X
#_08E70E: CMP.b #$03
#_08E710: BEQ .exit

#_08E712: LDY.b #$01

.next_object_check
#_08E714: LDA.b ($90),Y
#_08E716: CMP.b #$F0
#_08E718: BNE .not_off_screen

#_08E71A: INY
#_08E71B: INY
#_08E71C: INY
#_08E71D: INY
#_08E71E: CPY.b #$11
#_08E720: BNE .next_object_check

#_08E722: BRA .terminate

.not_off_screen
#_08E724: LDY.b #$00

.next_oam_check
#_08E726: LDA.b ($92),Y
#_08E728: AND.b #$01
#_08E72A: BEQ .exit

#_08E72C: INY
#_08E72D: CPY.b #$04
#_08E72F: BNE .next_oam_check

.terminate
#_08E731: STZ.w $0646

#_08E734: STZ.w $0C4A,X

#_08E737: TXA
#_08E738: INC A
#_08E739: CMP.w $02EC
#_08E73C: BNE .exit

#_08E73E: STZ.w $02EC

#_08E741: LDA.w $0308
#_08E744: AND.b #$80
#_08E746: BEQ .exit

#_08E748: STZ.w $0308

.exit
#_08E74B: RTS

;===================================================================================================

pool SomariaBlock_CheckForSwitch

.offset_y
#_08E74C: dw  -4 ; up
#_08E74E: dw   4 ; down
#_08E750: dw   0 ; left
#_08E752: dw   0 ; right

.offset_x
#_08E754: dw   0 ; up
#_08E756: dw   0 ; down
#_08E758: dw  -4 ; left
#_08E75A: dw   4 ; right

pool off

;---------------------------------------------------------------------------------------------------

SomariaBlock_CheckForSwitch:
#_08E75C: STZ.w $0646

#_08E75F: STZ.w $03DB,X

#_08E762: LDY.b #$06

.next_check
#_08E764: LDA.w $0BFA,X
#_08E767: CLC
#_08E768: ADC.w .offset_y+0,Y
#_08E76B: STA.b $00
#_08E76D: STA.b $72

#_08E76F: LDA.w $0C0E,X
#_08E772: ADC.w .offset_y+1,Y
#_08E775: STA.b $01
#_08E777: STA.b $73

#_08E779: LDA.w $0C04,X
#_08E77C: CLC
#_08E77D: ADC.w .offset_x+0,Y
#_08E780: STA.b $02
#_08E782: STA.b $74

#_08E784: LDA.w $0C18,X
#_08E787: ADC.w .offset_x+1,Y
#_08E78A: STA.b $03
#_08E78C: STA.b $75

#_08E78E: PHY

#_08E78F: LDA.w $0280,X
#_08E792: PHA

#_08E793: JSR Ancilla_CheckTileCollision_targeted

#_08E796: PLA
#_08E797: STA.w $0280,X

#_08E79A: PLY

#_08E79B: LDA.w $03E4,X
#_08E79E: CMP.b #$23 ; TILETYPE 23
#_08E7A0: BEQ .valid_switch

#_08E7A2: CMP.b #$24 ; TILETYPE 24
#_08E7A4: BEQ .valid_switch

#_08E7A6: CMP.b #$25 ; TILETYPE 25
#_08E7A8: BEQ .valid_switch

#_08E7AA: CMP.b #$3B ; TILETYPE 3B
#_08E7AC: BNE .not_star_tile

.valid_switch
#_08E7AE: INC.w $03DB,X

.not_star_tile
#_08E7B1: DEY
#_08E7B2: DEY
#_08E7B3: BPL .next_check

;---------------------------------------------------------------------------------------------------

#_08E7B5: LDA.w $03DB,X
#_08E7B8: CMP.b #$04
#_08E7BA: BNE .fail

.succeed
#_08E7BC: CLC

#_08E7BD: RTS

.fail
#_08E7BE: SEC

#_08E7BF: RTS

;===================================================================================================

pool SomariaBlock_HandlePlayerInteraction

.push_speed_positive
#_08E7C0: db  16

.push_speed_negative
#_08E7C1: db -16

;---------------------------------------------------------------------------------------------------

.launch_speed_y
#_08E7C2: db -40
#_08E7C3: db  40
#_08E7C4: db   0
#_08E7C5: db   0

.unused_a
#_08E7C6: db -32
#_08E7C7: db  32
#_08E7C8: db   0
#_08E7C9: db   0

#_08E7CA: db -16
#_08E7CB: db  16
#_08E7CC: db   0
#_08E7CD: db   0

#_08E7CE: db  -8
#_08E7CF: db   8
#_08E7D0: db   0
#_08E7D1: db   0

;---------------------------------------------------------------------------------------------------

.launch_speed_x
#_08E7D2: db   0
#_08E7D3: db   0
#_08E7D4: db -40
#_08E7D5: db  40

.unused_b
#_08E7D6: db   0
#_08E7D7: db   0
#_08E7D8: db -32
#_08E7D9: db  32

#_08E7DA: db   0
#_08E7DB: db   0
#_08E7DC: db -16
#_08E7DD: db  16

#_08E7DE: db   0
#_08E7DF: db   0
#_08E7E0: db  -8
#_08E7E1: db   8

;---------------------------------------------------------------------------------------------------

.rebound_speed_z
#_08E7E2: db  48
#_08E7E3: db  24
#_08E7E4: db  16
#_08E7E5: db   8

pool off

;---------------------------------------------------------------------------------------------------

SomariaBlock_HandlePlayerInteraction:
#_08E7E6: PHB
#_08E7E7: PHK
#_08E7E8: PLB

#_08E7E9: STX.w $0FA0

#_08E7EC: LDA.w $0394,X
#_08E7EF: BNE .no_do_somaria

#_08E7F1: LDA.w $03C5,X
#_08E7F4: BEQ .not_dash_airborne

#_08E7F6: BRL .punt_continue

;---------------------------------------------------------------------------------------------------

.not_dash_airborne
#_08E7F9: LDA.b $4D
#_08E7FB: BNE .no_do_somaria

#_08E7FD: LDA.w $0308
#_08E800: AND.b #$01
#_08E802: BNE .no_do_somaria

#_08E804: LDA.w $029E,X
#_08E807: BEQ .grounded

#_08E809: CMP.b #$FF
#_08E80B: BNE .no_do_somaria

.grounded
#_08E80D: LDA.w $0380,X
#_08E810: BNE .no_do_somaria

#_08E812: LDA.w $0385,X
#_08E815: BNE .no_do_somaria

#_08E817: LDA.b $F0
#_08E819: AND.b #$0F
#_08E81B: BNE .pressing_dpad

#_08E81D: STA.w $039F,X

#_08E820: STA.b $48

#_08E822: LDA.b #$FF
#_08E824: STA.w $038A,X

#_08E827: LDA.w $0372
#_08E82A: BNE .check_link_collision

#_08E82C: STZ.b $5E

.no_do_somaria
#_08E82E: BRL .exit_a

;---------------------------------------------------------------------------------------------------

.pressing_dpad
#_08E831: CMP.w $039F,X
#_08E834: BNE .input_mismatch

#_08E836: LDA.b $5E
#_08E838: CMP.b #$12
#_08E83A: BNE .check_link_collision

#_08E83C: LDA.b #$81
#_08E83E: TSB.b $48
#_08E840: BRA .check_link_collision

.input_mismatch
#_08E842: STA.w $039F,X

#_08E845: STZ.b $5E

;---------------------------------------------------------------------------------------------------

.check_link_collision
#_08E847: LDY.b #$04
#_08E849: JSR Ancilla_CheckLinkCollision
#_08E84C: BCC .no_do_somaria

#_08E84E: LDA.w $0C7C,X
#_08E851: CMP.b $EE
#_08E853: BNE .no_do_somaria

#_08E855: LDA.w $0372
#_08E858: BEQ .no_punt

#_08E85A: LDA.w $02F1
#_08E85D: CMP.b #$40
#_08E85F: BEQ .no_punt

#_08E861: TXA
#_08E862: INC A
#_08E863: CMP.w $02EC
#_08E866: BNE .disable_nearitude

#_08E868: STZ.w $02EC

;---------------------------------------------------------------------------------------------------

.disable_nearitude
#_08E86B: JSL Link_CancelDash_long

#_08E86F: LDA.b #$32 ; SFX3.32
#_08E871: JSR Ancilla_SFX3_Pan

#_08E874: BRL .init_dash_bouncing

;---------------------------------------------------------------------------------------------------

.no_punt
#_08E877: STZ.w $0C2C,X
#_08E87A: STZ.w $0C22,X

#_08E87D: LDA.b $F0
#_08E87F: AND.b #$0F
#_08E881: STA.w $039F,X

#_08E884: AND.b #$03
#_08E886: BEQ .pushing_left_or_right

#_08E888: LDY.w .push_speed_positive

#_08E88B: AND.b #$01
#_08E88D: BNE .pushing_right

#_08E88F: LDY.w .push_speed_negative

.pushing_right
#_08E892: TYA
#_08E893: STA.w $0C2C,X

#_08E896: LDY.b #$02
#_08E898: CMP.w .push_speed_positive
#_08E89B: BNE .set_direction

#_08E89D: INY
#_08E89E: BRA .set_direction

.pushing_left_or_right
#_08E8A0: LDY.w .push_speed_positive

#_08E8A3: LDA.b $F0
#_08E8A5: AND.b #$08
#_08E8A7: BEQ .upward_push

#_08E8A9: LDY.w .push_speed_negative

.upward_push
#_08E8AC: TYA
#_08E8AD: STA.w $0C22,X

#_08E8B0: LDY.b #$00
#_08E8B2: CMP.w .push_speed_positive
#_08E8B5: BNE .set_direction

#_08E8B7: INY

;---------------------------------------------------------------------------------------------------

.set_direction
#_08E8B8: TYA
#_08E8B9: STA.w $0C72,X

#_08E8BC: LDA.b $27
#_08E8BE: BEQ .no_recoil

#_08E8C0: LDA.b $28
#_08E8C2: BNE .yes_recoil

.no_recoil
#_08E8C4: JSR Ancilla_CheckTileCollision_Class2
#_08E8C7: BCS .no_tile_collision_here

#_08E8C9: JSR Ancilla_Move_Y
#_08E8CC: JSR Ancilla_Move_X

#_08E8CF: LDA.w $0308
#_08E8D2: AND.b #$80
#_08E8D4: BNE .no_tile_collision_here

#_08E8D6: INC.w $038A,X

#_08E8D9: LDA.w $038A,X
#_08E8DC: AND.b #$07
#_08E8DE: BNE .no_tile_collision_here

#_08E8E0: LDA.b #$22 ; SFX2.22
#_08E8E2: JSR Ancilla_SFX2_Pan

.no_tile_collision_here
#_08E8E5: LDA.b #$81
#_08E8E7: STA.b $48

#_08E8E9: LDA.b #$12
#_08E8EB: STA.b $5E

.yes_recoil
#_08E8ED: JSL Sprite_CancelHookshot

.exit_a
#_08E8F1: PLB

#_08E8F2: RTL

;---------------------------------------------------------------------------------------------------

.init_dash_bouncing
#_08E8F3: LDA.b $2F
#_08E8F5: LSR A
#_08E8F6: STA.w $0C72,X

#_08E8F9: TAY

#_08E8FA: LDA.w .launch_speed_y,Y
#_08E8FD: STA.w $0C22,X

#_08E900: LDA.w .launch_speed_x,Y
#_08E903: STA.w $0C2C,X

#_08E906: LDA.w .rebound_speed_z
#_08E909: STA.w $0294,X

#_08E90C: LDA.b #$01
#_08E90E: STA.w $03C5,X

#_08E911: STZ.w $029E,X

;---------------------------------------------------------------------------------------------------

.punt_continue
#_08E914: LDA.w $0294,X
#_08E917: SEC
#_08E918: SBC.b #$02
#_08E91A: STA.w $0294,X

#_08E91D: JSR Ancilla_Move_Y
#_08E920: JSR Ancilla_Move_X
#_08E923: JSR Ancilla_Move_Z

#_08E926: LDA.w $029E,X
#_08E929: BEQ .hit_ground_running

#_08E92B: CMP.b #$FC
#_08E92D: BCC .exit_b

.hit_ground_running
#_08E92F: LDA.b #$21 ; SFX2.21
#_08E931: JSR Ancilla_SFX2_Pan

#_08E934: STZ.w $029E,X

#_08E937: LDA.w $03C5,X
#_08E93A: INC A
#_08E93B: STA.w $03C5,X

#_08E93E: CMP.b #$04
#_08E940: BNE .max_bounces

#_08E942: STZ.w $0BF0,X
#_08E945: STZ.w $03C5,X
#_08E948: BRA .exit_b

;---------------------------------------------------------------------------------------------------

.max_bounces
#_08E94A: TAY
#_08E94B: DEY

#_08E94C: LDA.w .rebound_speed_z,Y
#_08E94F: STA.w $0294,X

#_08E952: LDA.b $2F
#_08E954: LSR A
#_08E955: STA.b $00

#_08E957: TYA
#_08E958: ASL A
#_08E959: ASL A
#_08E95A: CLC
#_08E95B: ADC.b $00
#_08E95D: TAY

;---------------------------------------------------------------------------------------------------

#_08E95E: LDY.b #$00

#_08E960: LDA.w $0C22,X
#_08E963: BPL .y_is_positive

#_08E965: LDY.b #$01

#_08E967: EOR.b #$FF
#_08E969: INC A

.y_is_positive
#_08E96A: LSR A

#_08E96B: CPY.b #$01
#_08E96D: BNE .restore_y_sign

#_08E96F: EOR.b #$FF
#_08E971: INC A

.restore_y_sign
#_08E972: STA.w $0C22,X

;---------------------------------------------------------------------------------------------------

#_08E975: LDY.b #$00

#_08E977: LDA.w $0C2C,X
#_08E97A: BPL .x_is_positive

#_08E97C: LDY.b #$01

#_08E97E: EOR.b #$FF
#_08E980: INC A

.x_is_positive
#_08E981: LSR A

#_08E982: CPY.b #$01
#_08E984: BNE .restore_x_sign

#_08E986: EOR.b #$FF
#_08E988: INC A

.restore_x_sign
#_08E989: STA.w $0C2C,X

;---------------------------------------------------------------------------------------------------

.exit_b
#_08E98C: PLB

#_08E98D: RTL

;===================================================================================================

pool Ancilla2D_SomariaBlockFizz

.offset_y
#_08E98E: dw  -4,  -1,  -4
#_08E994: dw  -4,  -4,  -4

.offset_x
#_08E99A: dw  -4,  -1,  -8
#_08E9A0: dw   0,  -6,  -2

.char
#_08E9A6: db $92, $FF, $F9
#_08E9A9: db $F9, $F9, $F9

.prop
#_08E9AC: db $06, $FF, $86
#_08E9AF: db $C6, $86, $C6

pool off

;===================================================================================================

SomariaBlock_FizzleAway:
#_08E9B2: LDA.b $5E
#_08E9B4: CMP.b #$12
#_08E9B6: BNE .dont_reset_speed

#_08E9B8: STZ.b $48
#_08E9BA: STZ.b $5E

.dont_reset_speed
#_08E9BC: STZ.w $0646

#_08E9BF: LDA.b #$2D ; ANCILLA 2D
#_08E9C1: STA.w $0C4A,X

#_08E9C4: STZ.w $03B1,X

#_08E9C7: STZ.w $0C54,X
#_08E9CA: STZ.w $0C5E,X

#_08E9CD: STZ.w $039F,X
#_08E9D0: STZ.w $03A4,X

#_08E9D3: STZ.w $03EA,X

#_08E9D6: TXA
#_08E9D7: INC A
#_08E9D8: CMP.w $02EC
#_08E9DB: BNE Ancilla2D_SomariaBlockFizz

#_08E9DD: STZ.w $02EC

#_08E9E0: LDA.w $0308
#_08E9E3: AND.b #$80
#_08E9E5: STA.w $0308

;===================================================================================================

Ancilla2D_SomariaBlockFizz:
#_08E9E8: DEC.w $03B1,X
#_08E9EB: BPL .continue

#_08E9ED: LDA.b #$03
#_08E9EF: STA.w $03B1,X

#_08E9F2: LDA.w $0C5E,X
#_08E9F5: INC A
#_08E9F6: STA.w $0C5E,X

#_08E9F9: CMP.b #$03
#_08E9FB: BNE .continue

#_08E9FD: STZ.w $0C4A,X

#_08EA00: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_08EA01: JSR Ancilla_PrepOAMCoord_adjusted

#_08EA04: LDY.b #$00

#_08EA06: LDA.w $029E,X
#_08EA09: CMP.b #$FF
#_08EA0B: BNE .not_underground

#_08EA0D: LDA.b #$00

.not_underground
#_08EA0F: STA.b $04
#_08EA11: BPL .positive_z

#_08EA13: LDY.b #$FF

.positive_z
#_08EA15: STY.b $05

#_08EA17: REP #$20

#_08EA19: LDA.b $04
#_08EA1B: EOR.w #$FFFF
#_08EA1E: INC A
#_08EA1F: CLC
#_08EA20: ADC.b $00
#_08EA22: STA.b $04

#_08EA24: LDA.b $02
#_08EA26: STA.b $06

;---------------------------------------------------------------------------------------------------

#_08EA28: SEP #$20

#_08EA2A: PHX

#_08EA2B: LDA.w $0C5E,X
#_08EA2E: ASL A
#_08EA2F: TAX

#_08EA30: LDY.b #$00
#_08EA32: STY.b $08

.next_object
#_08EA34: LDA.w .char,X
#_08EA37: CMP.b #$FF
#_08EA39: BEQ .skip

#_08EA3B: REP #$20

#_08EA3D: PHX

#_08EA3E: TXA
#_08EA3F: ASL A
#_08EA40: TAX

#_08EA41: LDA.b $04
#_08EA43: CLC
#_08EA44: ADC.w .offset_y,X
#_08EA47: STA.b $00

#_08EA49: LDA.b $06
#_08EA4B: CLC
#_08EA4C: ADC.w .offset_x,X
#_08EA4F: STA.b $02

#_08EA51: PLX

#_08EA52: SEP #$20

#_08EA54: JSR Ancilla_SetOAM_XY

#_08EA57: LDA.w .char,X
#_08EA5A: STA.b ($90),Y

#_08EA5C: INY

#_08EA5D: LDA.w .prop,X
#_08EA60: AND.b #$CF
#_08EA62: ORA.b $65
#_08EA64: STA.b ($90),Y

#_08EA66: INY
#_08EA67: PHY

#_08EA68: TYA
#_08EA69: SEC
#_08EA6A: SBC.b #$04
#_08EA6C: LSR A
#_08EA6D: LSR A
#_08EA6E: TAY

#_08EA6F: LDA.b #$00
#_08EA71: STA.b ($92),Y

#_08EA73: PLY

.skip
#_08EA74: INX

#_08EA75: INC.b $08

#_08EA77: LDA.b $08
#_08EA79: CMP.b #$02
#_08EA7B: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08EA7D: PLX

#_08EA7E: RTS

;===================================================================================================

pool Ancilla39_SomariaPlatformPoof

.direction
#_08EA7F: db $01 ; up
#_08EA80: db $00 ; down
#_08EA81: db $03 ; left
#_08EA82: db $02 ; right

pool off

;---------------------------------------------------------------------------------------------------

Ancilla39_SomariaPlatformPoof:
#_08EA83: DEC.w $03B1,X
#_08EA86: BMI .continue

#_08EA88: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_08EA89: STZ.w $0C4A,X

#_08EA8C: LDA.w $0BFA,X
#_08EA8F: STA.b $72

#_08EA91: LDA.w $0C0E,X
#_08EA94: STA.b $73

#_08EA96: LDA.w $0C04,X
#_08EA99: STA.b $74

#_08EA9B: LDA.w $0C18,X
#_08EA9E: STA.b $75

#_08EAA0: LDA.w $0C7C,X
#_08EAA3: STA.b $BD

#_08EAA5: PHX

#_08EAA6: LDA.b #$ED ; SPRITE ED
#_08EAA8: JSL Sprite_SpawnDynamically
#_08EAAC: BPL .free_slot

#_08EAAE: BRL .just_draw

;---------------------------------------------------------------------------------------------------

.free_slot
#_08EAB1: STZ.w $02F5

#_08EAB4: LDA.b $72
#_08EAB6: AND.b #$F8
#_08EAB8: ORA.b #$04
#_08EABA: STA.w $0D00,Y
#_08EABD: STA.b $72

#_08EABF: LDA.b $73
#_08EAC1: STA.w $0D20,Y

#_08EAC4: LDA.b $74
#_08EAC6: AND.b #$F8
#_08EAC8: ORA.b #$04
#_08EACA: STA.w $0D10,Y
#_08EACD: STA.b $74

#_08EACF: LDA.b $75
#_08EAD1: STA.w $0D30,Y

#_08EAD4: LDA.b $BD
#_08EAD6: CMP.b #$01

#_08EAD8: REP #$30

#_08EADA: STZ.b $06

#_08EADC: BCC .lower_layer

#_08EADE: LDA.w #$1000
#_08EAE1: STA.b $06

;---------------------------------------------------------------------------------------------------

.lower_layer
#_08EAE3: LDA.b $74
#_08EAE5: AND.w #$01FF
#_08EAE8: LSR A
#_08EAE9: LSR A
#_08EAEA: LSR A
#_08EAEB: STA.b $04

#_08EAED: LDA.b $72
#_08EAEF: AND.w #$01F8
#_08EAF2: ASL A
#_08EAF3: ASL A
#_08EAF4: ASL A
#_08EAF5: CLC
#_08EAF6: ADC.b $04
#_08EAF8: CLC
#_08EAF9: ADC.b $06
#_08EAFB: TAX

;---------------------------------------------------------------------------------------------------

#_08EAFC: STZ.b $06

#_08EAFE: LDA.l $7F1FC0,X
#_08EB02: AND.w #$00F0
#_08EB05: CMP.w #$00B0
#_08EB08: BEQ .match

#_08EB0A: INC.b $06

#_08EB0C: LDA.l $7F2040,X
#_08EB10: AND.w #$00F0
#_08EB13: CMP.w #$00B0
#_08EB16: BEQ .match

#_08EB18: INC.b $06

#_08EB1A: LDA.l $7F1FFF,X
#_08EB1E: AND.w #$00F0
#_08EB21: CMP.w #$00B0
#_08EB24: BEQ .match

#_08EB26: INC.b $06

.match
#_08EB28: SEP #$30

#_08EB2A: LDX.b $06

#_08EB2C: LDA.w .direction,X
#_08EB2F: STA.w $0DE0,Y

#_08EB32: LDA.b #$00
#_08EB34: STA.w $0F20,Y

#_08EB37: BRA .exit

;---------------------------------------------------------------------------------------------------

.just_draw
#_08EB39: JSR AncillaDraw_SomariaBlock

.exit
#_08EB3C: PLX

#_08EB3D: RTS

;===================================================================================================

Ancilla2E_SomariaBlockFission:
#_08EB3E: DEC.w $03B1,X
#_08EB41: BPL .delay_explosion

#_08EB43: LDA.b #$03
#_08EB45: STA.w $03B1,X

#_08EB48: LDA.w $0C5E,X
#_08EB4B: INC A
#_08EB4C: STA.w $0C5E,X

#_08EB4F: CMP.b #$02
#_08EB51: BNE .delay_explosion

#_08EB53: STZ.w $0C4A,X

#_08EB56: PHX

#_08EB57: JSR SomariaBlock_SpawnBullets

#_08EB5A: PLX

#_08EB5B: RTS

;---------------------------------------------------------------------------------------------------

.delay_explosion
#_08EB5C: JSR Ancilla_PrepOAMCoord_adjusted

#_08EB5F: LDY.b #$00

#_08EB61: LDA.w $0380,X
#_08EB64: CMP.b #$03
#_08EB66: BNE .ignore_link_z

#_08EB68: LDA.b $24
#_08EB6A: CMP.b #$FF
#_08EB6C: BNE .positive_link_z

.ignore_link_z
#_08EB6E: LDA.b #$00

.positive_link_z
#_08EB70: CLC
#_08EB71: ADC.w $029E,X
#_08EB74: STA.b $04

#_08EB76: BPL .positive_som_z

#_08EB78: LDY.b #$FF

.positive_som_z
#_08EB7A: STY.b $05

;---------------------------------------------------------------------------------------------------

#_08EB7C: REP #$20

#_08EB7E: LDA.b $04
#_08EB80: EOR.w #$FFFF
#_08EB83: INC A

#_08EB84: CLC
#_08EB85: ADC.b $00
#_08EB87: STA.b $04

#_08EB89: LDA.b $02
#_08EB8B: STA.b $06


#_08EB8D: SEP #$20

#_08EB8F: PHX

#_08EB90: LDA.w $0C5E,X
#_08EB93: ASL A
#_08EB94: ASL A
#_08EB95: ASL A
#_08EB96: TAX

;---------------------------------------------------------------------------------------------------

#_08EB97: LDY.b #$00
#_08EB99: STY.b $08

.next_object
#_08EB9B: REP #$20

#_08EB9D: PHX

#_08EB9E: TXA
#_08EB9F: ASL A
#_08EBA0: TAX

#_08EBA1: LDA.b $04
#_08EBA3: CLC
#_08EBA4: ADC.l SomariaBlockFission_offset_y,X
#_08EBA8: STA.b $00

#_08EBAA: LDA.b $06
#_08EBAC: CLC
#_08EBAD: ADC.l SomariaBlockFission_offset_x,X
#_08EBB1: STA.b $02

#_08EBB3: PLX

#_08EBB4: SEP #$20

#_08EBB6: JSR Ancilla_SetOAM_XY

#_08EBB9: LDA.l SomariaBlockFission_char,X
#_08EBBD: STA.b ($90),Y

#_08EBBF: INY

#_08EBC0: LDA.l SomariaBlockFission_prop,X
#_08EBC4: AND.b #$CF
#_08EBC6: ORA.b $65
#_08EBC8: STA.b ($90),Y

#_08EBCA: INY
#_08EBCB: PHY

#_08EBCC: TYA
#_08EBCD: SEC
#_08EBCE: SBC.b #$04
#_08EBD0: LSR A
#_08EBD1: LSR A
#_08EBD2: TAY

#_08EBD3: LDA.b #$00
#_08EBD5: STA.b ($92),Y

#_08EBD7: PLY

#_08EBD8: INX

#_08EBD9: INC.b $08

#_08EBDB: LDA.b $08
#_08EBDD: CMP.b #$08
#_08EBDF: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08EBE1: PLX

#_08EBE2: RTS

;===================================================================================================

pool Ancilla2F_LampFlame

.char
#_08EBE3: db $9C, $9C, $FF, $FF
#_08EBE7: db $A4, $A5, $B2, $B3
#_08EBEB: db $E3, $F3, $FF, $FF

.offset_y_low
#_08EBEF: db  -3,   0,   0,   0
#_08EBF3: db   0,   0,   8,   8
#_08EBF7: db   0,   8,   0,   0

.offset_y_high
#_08EBFB: db  -1,   0,   0,   0
#_08EBFF: db   0,   0,   0,   0
#_08EC03: db   0,   0,   0,   0

.offset_x
#_08EC07: db   4,  10,   0,   0
#_08EC0B: db   1,   9,   2,   7
#_08EC0F: db   4,   4,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla2F_LampFlame:
#_08EC13: JSR Ancilla_PrepOAMCoord_adjusted

#_08EC16: LDA.b $00
#_08EC18: STA.b $06

#_08EC1A: LDA.b $01
#_08EC1C: STA.b $07

#_08EC1E: LDY.b #$00

#_08EC20: LDA.w $0C68,X
#_08EC23: BNE .continue

#_08EC25: STZ.w $0C4A,X

#_08EC28: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_08EC29: AND.b #$F8
#_08EC2B: LSR A
#_08EC2C: TAX

.next_object
#_08EC2D: LDA.w .char,X
#_08EC30: CMP.b #$FF
#_08EC32: BEQ .skip

#_08EC34: LDA.w .offset_y_low,X
#_08EC37: CLC
#_08EC38: ADC.b $06
#_08EC3A: STA.b $00

#_08EC3C: LDA.b $07
#_08EC3E: ADC.w .offset_y_high,X
#_08EC41: STA.b $01

#_08EC43: LDA.w .offset_x,X
#_08EC46: CLC
#_08EC47: ADC.b $04
#_08EC49: STA.b $02

#_08EC4B: LDA.b $05
#_08EC4D: ADC.b #$00
#_08EC4F: STA.b $03

#_08EC51: JSR Ancilla_SetOAM_XY

#_08EC54: LDA.w .char,X
#_08EC57: STA.b ($90),Y

#_08EC59: INY

#_08EC5A: LDA.b #$02
#_08EC5C: ORA.b $65
#_08EC5E: STA.b ($90),Y

#_08EC60: INY
#_08EC61: PHY

#_08EC62: TYA
#_08EC63: SEC
#_08EC64: SBC.b #$04
#_08EC66: LSR A
#_08EC67: LSR A
#_08EC68: TAY

#_08EC69: LDA.b #$00
#_08EC6B: STA.b ($92),Y

#_08EC6D: PLY

.skip
#_08EC6E: INX
#_08EC6F: TXA
#_08EC70: AND.b #$03
#_08EC72: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08EC74: BRL Ancilla_RestoreIndex

;===================================================================================================


pool Ancilla41_WaterfallSplash

.char
#_08EC77: db $C0, $FF
#_08EC79: db $AC, $AC
#_08EC7B: db $AE, $AE
#_08EC7D: db $BF, $BF

.prop
#_08EC7F: db $84, $FF
#_08EC81: db $84, $C4
#_08EC83: db $84, $C4
#_08EC85: db $84, $C4

.size
#_08EC87: db $02, $FF
#_08EC89: db $02, $02
#_08EC8B: db $02, $02
#_08EC8D: db $00, $00

;---------------------------------------------------------------------------------------------------

.offset_y_low
#_08EC8F: db  -4,   0
#_08EC91: db  -5,  -5
#_08EC93: db  -3,  -3
#_08EC95: db  12,  12

.offset_y_high
#_08EC97: db  -1,   0
#_08EC99: db  -1,  -1
#_08EC9B: db  -1,  -1
#_08EC9D: db   0,   0

.offset_x_low
#_08EC9F: db   0,   0
#_08ECA1: db  -4,   4
#_08ECA3: db  -7,   7
#_08ECA5: db  -9,  17

.offset_x_high
#_08ECA7: db   0,   0
#_08ECA9: db  -1,   0
#_08ECAB: db  -1,   0
#_08ECAD: db  -1,   0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla41_WaterfallSplash:
#_08ECAF: LDY.b #$00

#_08ECB1: LDA.b $1B
#_08ECB3: BNE .indoors

#_08ECB5: LDY.b #$01

.indoors
#_08ECB7: JSR Ancilla_CheckForEntranceTrigger
#_08ECBA: BCS .splish_splash

#_08ECBC: STZ.w $0C4A,X

#_08ECBF: RTS

;---------------------------------------------------------------------------------------------------

.splish_splash
#_08ECC0: LDA.b $11
#_08ECC2: BNE .skip_sfx

#_08ECC4: LDA.b $1A
#_08ECC6: AND.b #$07
#_08ECC8: BNE .skip_sfx

#_08ECCA: LDA.b #$1C ; SFX2.1C
#_08ECCC: JSR Ancilla_SFX2_Near

.skip_sfx
#_08ECCF: LDA.b #$01
#_08ECD1: STA.w $0351

#_08ECD4: LDA.b $2E
#_08ECD6: SEC
#_08ECD7: SBC.b #$06
#_08ECD9: BMI .dont_reset_anim

#_08ECDB: STA.b $2E

.dont_reset_anim
#_08ECDD: LDA.w $0C68,X
#_08ECE0: BNE .anim_delay

#_08ECE2: LDA.b #$02
#_08ECE4: STA.w $0C68,X

#_08ECE7: LDA.w $0C5E,X
#_08ECEA: INC A
#_08ECEB: AND.b #$03
#_08ECED: STA.w $0C5E,X

;---------------------------------------------------------------------------------------------------

.anim_delay
#_08ECF0: LDA.b $1B
#_08ECF2: BEQ .set_y_coord

#_08ECF4: LDA.b $20
#_08ECF6: CMP.b #$38
#_08ECF8: BCS .set_y_coord

#_08ECFA: LDA.b #$38
#_08ECFC: STA.w $0BFA,X

#_08ECFF: LDA.b #$0D
#_08ED01: STA.w $0C0E,X
#_08ED04: BRA .set_x_coord

.set_y_coord
#_08ED06: LDA.b $20
#_08ED08: STA.w $0BFA,X

#_08ED0B: LDA.b $21
#_08ED0D: STA.w $0C0E,X

.set_x_coord
#_08ED10: LDA.b $22
#_08ED12: STA.w $0C04,X

#_08ED15: LDA.b $23
#_08ED17: STA.w $0C18,X

;---------------------------------------------------------------------------------------------------

#_08ED1A: JSR Ancilla_PrepOAMCoord_adjusted

#_08ED1D: LDA.b $24
#_08ED1F: BPL .positive_link_z

#_08ED21: LDA.b #$00

.positive_link_z
#_08ED23: REP #$20

#_08ED25: AND.w #$00FF
#_08ED28: EOR.w #$FFFF
#_08ED2B: INC A

#_08ED2C: CLC
#_08ED2D: ADC.b $00
#_08ED2F: STA.b $00
#_08ED31: STA.b $06

;---------------------------------------------------------------------------------------------------

#_08ED33: SEP #$20

#_08ED35: LDA.w $0C5E,X
#_08ED38: ASL A
#_08ED39: TAX

#_08ED3A: LDY.b #$00

.next_object
#_08ED3C: LDA.w .char,X
#_08ED3F: CMP.b #$FF
#_08ED41: BEQ .skip

#_08ED43: LDA.w .offset_y_low,X
#_08ED46: CLC
#_08ED47: ADC.b $06
#_08ED49: STA.b $00

#_08ED4B: LDA.w .offset_y_high,X
#_08ED4E: ADC.b $07
#_08ED50: STA.b $01

#_08ED52: LDA.w .offset_x_low,X
#_08ED55: CLC
#_08ED56: ADC.b $04
#_08ED58: STA.b $02

#_08ED5A: LDA.w .offset_x_high,X
#_08ED5D: ADC.b $05
#_08ED5F: STA.b $03

#_08ED61: JSR Ancilla_SetOAM_XY

#_08ED64: LDA.w .char,X
#_08ED67: STA.b ($90),Y

#_08ED69: INY

#_08ED6A: LDA.w .prop,X
#_08ED6D: ORA.b #$30
#_08ED6F: STA.b ($90),Y

#_08ED71: INY
#_08ED72: PHY

#_08ED73: TYA
#_08ED74: SEC
#_08ED75: SBC.b #$04
#_08ED77: LSR A
#_08ED78: LSR A
#_08ED79: TAY

#_08ED7A: LDA.w .size,X
#_08ED7D: STA.b ($92),Y

#_08ED7F: PLY

.skip
#_08ED80: INX

#_08ED81: TXA
#_08ED82: AND.b #$01
#_08ED84: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08ED86: BRL Ancilla_RestoreIndex

;===================================================================================================

Gravestone_Move:
#_08ED89: PHB
#_08ED8A: PHK
#_08ED8B: PLB

#_08ED8C: LDA.b $11
#_08ED8E: BNE .exit

#_08ED90: LDA.b #$F8
#_08ED92: STA.w $0C22,X

#_08ED95: JSR Ancilla_Move_Y
#_08ED98: JSR Gravestone_ActAsBarrier

#_08ED9B: LDA.w $038A,X
#_08ED9E: STA.b $00

#_08EDA0: LDA.w $038F,X
#_08EDA3: STA.b $01

#_08EDA5: LDA.w $0BFA,X
#_08EDA8: STA.b $02

#_08EDAA: LDA.w $0C0E,X
#_08EDAD: STA.b $03

;---------------------------------------------------------------------------------------------------

#_08EDAF: REP #$20

#_08EDB1: LDA.b $02
#_08EDB3: CMP.b $00

#_08EDB5: SEP #$20
#_08EDB7: BCS .exit

#_08EDB9: STZ.w $0C4A,X

#_08EDBC: STZ.w $03E9

#_08EDBF: LDA.b $48
#_08EDC1: AND.b #$FB
#_08EDC3: STA.b $48

#_08EDC5: LDA.w $03BA,X
#_08EDC8: STA.b $72

#_08EDCA: LDA.w $03B6,X
#_08EDCD: STA.b $73

#_08EDCF: REP #$20

#_08EDD1: LDA.b $72
#_08EDD3: STA.w $0698

;---------------------------------------------------------------------------------------------------

#_08EDD6: LDY.b #$48

#_08EDD8: CMP.w #$0532
#_08EDDB: BEQ .no_update_change

#_08EDDD: LDY.b #$60
#_08EDDF: CMP.w #$0488
#_08EDE2: BEQ .no_update_change

#_08EDE4: LDY.b #$40

.no_update_change
#_08EDE6: TYA
#_08EDE7: AND.w #$00FF
#_08EDEA: STA.w $0692

#_08EDED: SEP #$20

#_08EDEF: PHX
#_08EDF0: JSL Overworld_DoMapUpdate32x32_long
#_08EDF4: PLX

#_08EDF5: BRA .exit

;---------------------------------------------------------------------------------------------------

.exit
#_08EDF7: PLB

#_08EDF8: RTL

;===================================================================================================

pool Ancilla24_Gravestone

.char
#_08EDF9: db $C8, $C8, $D8, $D8

.prop
#_08EDFD: db $00, $40, $00, $40

pool off

;---------------------------------------------------------------------------------------------------

Ancilla24_Gravestone:
#_08EE01: PHX

#_08EE02: JSR Ancilla_PrepOAMCoord_adjusted

#_08EE05: REP #$20

#_08EE07: LDA.b $02
#_08EE09: STA.b $06

#_08EE0B: SEP #$20

#_08EE0D: LDA.b #$10
#_08EE0F: JSL SpriteDraw_AllocateOAMFromRegionB

;---------------------------------------------------------------------------------------------------

#_08EE13: LDY.b #$00
#_08EE15: TYX

.next_object
#_08EE16: JSR Ancilla_SetOAM_XY

#_08EE19: LDA.w .char,X
#_08EE1C: STA.b ($90),Y

#_08EE1E: INY

#_08EE1F: LDA.w .prop,X
#_08EE22: ORA.b #$3D
#_08EE24: STA.b ($90),Y

#_08EE26: INY
#_08EE27: PHY

#_08EE28: TYA
#_08EE29: SEC
#_08EE2A: SBC.b #$04
#_08EE2C: LSR A
#_08EE2D: LSR A
#_08EE2E: TAY

#_08EE2F: LDA.b #$02
#_08EE31: STA.b ($92),Y

#_08EE33: PLY

#_08EE34: INX

#_08EE35: REP #$20

#_08EE37: LDA.b $02
#_08EE39: CLC
#_08EE3A: ADC.w #$0010
#_08EE3D: STA.b $02

#_08EE3F: CPX.b #$02
#_08EE41: BNE .left_side

#_08EE43: LDA.b $00
#_08EE45: CLC
#_08EE46: ADC.w #$0008
#_08EE49: STA.b $00

#_08EE4B: LDA.b $06
#_08EE4D: STA.b $02

.left_side
#_08EE4F: SEP #$20

#_08EE51: CPX.b #$04
#_08EE53: BNE .next_object

;---------------------------------------------------------------------------------------------------

#_08EE55: PLX

#_08EE56: RTS

;===================================================================================================

Gravestone_ActAsBarrier:
#_08EE57: LDA.w $0BFA,X
#_08EE5A: STA.b $00

#_08EE5C: LDA.w $0C0E,X
#_08EE5F: STA.b $01

#_08EE61: LDA.w $0C04,X
#_08EE64: STA.b $02

#_08EE66: LDA.w $0C18,X
#_08EE69: STA.b $03

;---------------------------------------------------------------------------------------------------

#_08EE6B: REP #$20

#_08EE6D: LDA.b $00
#_08EE6F: CLC
#_08EE70: ADC.w #$0018
#_08EE73: STA.b $04

#_08EE75: LDA.b $02
#_08EE77: CLC
#_08EE78: ADC.w #$0020
#_08EE7B: STA.b $06

#_08EE7D: LDA.b $20
#_08EE7F: CLC
#_08EE80: ADC.w #$0008
#_08EE83: STA.b $08

;---------------------------------------------------------------------------------------------------

#_08EE85: CMP.b $00
#_08EE87: BCC .not_close

#_08EE89: CMP.b $04
#_08EE8B: BCS .not_close

#_08EE8D: LDA.b $22
#_08EE8F: CLC
#_08EE90: ADC.w #$0008
#_08EE93: CMP.b $02
#_08EE95: BCC .not_close

#_08EE97: CMP.b $06
#_08EE99: BCS .not_close

;---------------------------------------------------------------------------------------------------

#_08EE9B: LDA.b $08
#_08EE9D: SEC
#_08EE9E: SBC.b $04
#_08EEA0: BPL .link_below

#_08EEA2: EOR.w #$FFFF
#_08EEA5: INC A

.link_below
#_08EEA6: STA.b $0A

#_08EEA8: CLC
#_08EEA9: ADC.b $20
#_08EEAB: STA.b $20

#_08EEAD: LDA.b $30
#_08EEAF: CMP.w #$0080
#_08EEB2: BCC .sign_correct

#_08EEB4: ORA.w #$FF00

.sign_correct
#_08EEB7: STA.b $08

;---------------------------------------------------------------------------------------------------

#_08EEB9: LDA.b $0A
#_08EEBB: CLC
#_08EEBC: ADC.b $08
#_08EEBE: AND.w #$00FF
#_08EEC1: STA.b $08

#_08EEC3: LDA.b $30
#_08EEC5: AND.w #$FF00
#_08EEC8: ORA.b $08
#_08EECA: STA.b $30

#_08EECC: LDA.w #$0004
#_08EECF: TSB.b $48

;---------------------------------------------------------------------------------------------------

.not_close
#_08EED1: SEP #$20

#_08EED3: LDA.b $2F
#_08EED5: BEQ .exit

#_08EED7: LDA.b $48
#_08EED9: AND.b #$FB
#_08EEDB: STA.b $48

.exit
#_08EEDD: RTS

;===================================================================================================

pool AncillaDraw_SkullWoodsFlame

.flame_offset_y_low
#_08EEDE: db   0
#_08EEDF: db   0
#_08EEE0: db   0
#_08EEE1: db  -3

.flame_offset_y_high
#_08EEE2: db   0
#_08EEE3: db   0
#_08EEE4: db   0
#_08EEE5: db  -1

.flame_char
#_08EEE6: db $8E
#_08EEE7: db $A0
#_08EEE8: db $A2
#_08EEE9: db $A4

.flame_prop
#_08EEEA: db $02
#_08EEEB: db $02
#_08EEEC: db $02
#_08EEED: db $00

pool off

;===================================================================================================

pool AncillaDraw_SkullWoodsBlast

.blast_char
#_08EEEE: db $86, $86, $86, $FF, $FF, $FF
#_08EEF4: db $86, $86, $86, $86, $86, $86
#_08EEFA: db $8A, $8A, $8A, $8A, $8A, $8A
#_08EF00: db $9B, $9B, $9B, $9B, $9B, $9B

.blast_prop
#_08EF06: db $00, $00, $00, $00, $00, $00
#_08EF0C: db $00, $00, $00, $00, $00, $00
#_08EF12: db $00, $00, $00, $00, $00, $00
#_08EF18: db $80, $40, $40, $80, $40, $00

.blast_size
#_08EF1E: db $02, $02, $02, $02, $01, $01
#_08EF24: db $02, $02, $02, $02, $02, $02
#_08EF2A: db $02, $02, $02, $02, $02, $02
#_08EF30: db $00, $00, $00, $00, $00, $00

.blast_offset_y
#_08EF36: dw -31, -24, -22,  -1,  -1,  -1
#_08EF42: dw -37, -32, -32, -23, -16, -14
#_08EF4E: dw -37, -32, -32, -23, -16, -14
#_08EF5A: dw -35, -29, -28, -20, -13, -11

.blast_offset_x
#_08EF66: dw -13, -21, -10,  -1,  -1,  -1
#_08EF72: dw -16, -27,  -4, -16,  -6, -25
#_08EF7E: dw -16, -27,  -4, -16,  -6, -25
#_08EF8A: dw -13,  -5, -27, -11, -22,  -3

;---------------------------------------------------------------------------------------------------

.blast_data_index
#_08EF96: db $00
#_08EF97: db $06
#_08EF98: db $0C
#_08EF99: db $12

pool off

;===================================================================================================

Ancilla34_SkullWoodsFire:
#_08EF9A: LDA.l $7F0010
#_08EF9E: BEQ .inactive

#_08EFA0: LDA.w $0C5E,X
#_08EFA3: CMP.b #$04
#_08EFA5: BEQ .inactive

#_08EFA7: DEC.w $03B1,X
#_08EFAA: BPL .inactive

#_08EFAC: LDA.b #$05
#_08EFAE: STA.w $03B1,X

#_08EFB1: INC.w $0C5E,X

.inactive
#_08EFB4: LDX.b #$03
#_08EFB6: LDY.b #$00

;===================================================================================================

SkullWoodsFlame_DoNext:
#_08EFB8: LDA.l $7F0008,X
#_08EFBC: DEC A
#_08EFBD: STA.l $7F0008,X
#_08EFC1: BMI .reset_flame_index

.only_flame_draw
#_08EFC3: BRL AncillaDraw_SkullWoodsFlame

;---------------------------------------------------------------------------------------------------

.reset_flame_index
#_08EFC6: LDA.b #$05
#_08EFC8: STA.l $7F0008,X

#_08EFCC: LDA.l $7F0000,X
#_08EFD0: CMP.b #$80
#_08EFD2: BEQ .only_flame_draw

#_08EFD4: INC A
#_08EFD5: STA.l $7F0000,X
#_08EFD9: BEQ .reset_control

#_08EFDB: CMP.b #$04
#_08EFDD: BNE .only_flame_draw

#_08EFDF: LDA.b #$00
#_08EFE1: STA.l $7F0000,X

;---------------------------------------------------------------------------------------------------

.reset_control
#_08EFE5: REP #$20

#_08EFE7: LDA.l $7F0018
#_08EFEB: SEC
#_08EFEC: SBC.w #$0008
#_08EFEF: STA.l $7F0018

#_08EFF3: CMP.w #$00C8
#_08EFF6: BCS .skip_sfx

#_08EFF8: LDA.w #$0098
#_08EFFB: SEC
#_08EFFC: SBC.b $E2
#_08EFFE: STA.b $00

#_08F000: SEP #$20

#_08F002: LDA.l $7F0010
#_08F006: CMP.b #$01
#_08F008: BEQ .skip_sfx

#_08F00A: LDA.b #$01
#_08F00C: STA.l $7F0010

#_08F010: LDA.b $00
#_08F012: JSR Ancilla_SetPanRelativeCoordinates
#_08F015: ORA.b #$0C ; SFX2.0C
#_08F017: STA.w $012E

;---------------------------------------------------------------------------------------------------

.skip_sfx
#_08F01A: REP #$20

#_08F01C: LDA.l $7F0018
#_08F020: CMP.w #$00A8
#_08F023: BCS .dont_terminate

#_08F025: LDA.l $7F0000,X
#_08F029: AND.w #$FF00
#_08F02C: ORA.w #$0080
#_08F02F: STA.l $7F0000,X

.dont_terminate
#_08F033: PHX

#_08F034: TXA
#_08F035: ASL A
#_08F036: TAX

#_08F037: LDA.l $7F001A
#_08F03B: STA.l $7F0030,X

#_08F03F: LDA.l $7F0018
#_08F043: STA.l $7F0020,X

#_08F047: PLX

#_08F048: SEP #$20

#_08F04A: LDA.w $012E
#_08F04D: BNE AncillaDraw_SkullWoodsFlame

#_08F04F: LDA.l $7F001A
#_08F053: SEC
#_08F054: SBC.b $E2

#_08F056: JSR Ancilla_SetPanRelativeCoordinates
#_08F059: ORA.b #$2A ; SFX2.2A
#_08F05B: STA.w $012E

;===================================================================================================

AncillaDraw_SkullWoodsFlame:
#_08F05E: SEP #$20

#_08F060: PHX

#_08F061: LDA.l $7F0000,X
#_08F065: BPL .continue_with_flame

#_08F067: BRL .skip_flame

;---------------------------------------------------------------------------------------------------

.continue_with_flame
#_08F06A: PHY

#_08F06B: TAY

#_08F06C: LDA.w .flame_offset_y_low,Y
#_08F06F: STA.b $04

#_08F071: LDA.w .flame_offset_y_high,Y
#_08F074: STA.b $05

#_08F076: LDA.w .flame_char,Y
#_08F079: STA.b $06

#_08F07B: LDA.w .flame_prop,Y
#_08F07E: STA.b $07

#_08F080: TXA
#_08F081: ASL A
#_08F082: TAX

;---------------------------------------------------------------------------------------------------

#_08F083: REP #$20

#_08F085: LDA.l $7F0020,X
#_08F089: SEC
#_08F08A: SBC.b $E8

#_08F08C: CLC
#_08F08D: ADC.b $04
#_08F08F: STA.b $00

#_08F091: LDA.l $7F0030,X
#_08F095: SEC
#_08F096: SBC.b $E2
#_08F098: STA.b $02

#_08F09A: CLC
#_08F09B: ADC.w #$0008
#_08F09E: STA.b $08

#_08F0A0: SEP #$20

#_08F0A2: PLY

#_08F0A3: JSR Ancilla_SetOAM_XY

#_08F0A6: LDA.b $06
#_08F0A8: STA.b ($90),Y

#_08F0AA: INY

#_08F0AB: LDA.b #$32
#_08F0AD: STA.b ($90),Y

#_08F0AF: INY
#_08F0B0: PHY

#_08F0B1: TYA
#_08F0B2: SEC
#_08F0B3: SBC.b #$04
#_08F0B5: LSR A
#_08F0B6: LSR A
#_08F0B7: TAY

#_08F0B8: LDA.b $07
#_08F0BA: STA.b ($92),Y

#_08F0BC: PLY

#_08F0BD: CMP.b #$02
#_08F0BF: BEQ .skip_flame

;---------------------------------------------------------------------------------------------------

#_08F0C1: REP #$20

#_08F0C3: LDA.b $08
#_08F0C5: STA.b $02

#_08F0C7: SEP #$20

#_08F0C9: JSR Ancilla_SetOAM_XY

#_08F0CC: LDA.b $06
#_08F0CE: INC A
#_08F0CF: STA.b ($90),Y

#_08F0D1: INY

#_08F0D2: LDA.b #$32
#_08F0D4: STA.b ($90),Y

#_08F0D6: INY
#_08F0D7: PHY

#_08F0D8: TYA
#_08F0D9: SEC
#_08F0DA: SBC.b #$04
#_08F0DC: LSR A
#_08F0DD: LSR A
#_08F0DE: TAY

#_08F0DF: LDA.b $07
#_08F0E1: STA.b ($92),Y

#_08F0E3: PLY

;---------------------------------------------------------------------------------------------------

.skip_flame
#_08F0E4: PLX
#_08F0E5: DEX
#_08F0E6: BMI AncillaDraw_SkullWoodsBlast

#_08F0E8: BRL SkullWoodsFlame_DoNext

;===================================================================================================

AncillaDraw_SkullWoodsBlast:
#_08F0EB: LDX.b #$03

.find_blast
#_08F0ED: LDA.l $7F0000,X
#_08F0F1: BPL .one_active

#_08F0F3: DEX
#_08F0F4: BPL .find_blast

#_08F0F6: LDX.w $0FA0
#_08F0F9: STZ.w $0C4A,X

#_08F0FC: RTS

.one_active
#_08F0FD: LDX.w $0FA0

#_08F100: LDA.l $7F0010
#_08F104: BEQ .exit

#_08F106: LDA.w $0C5E,X
#_08F109: CMP.b #$04
#_08F10B: BEQ .exit

#_08F10D: TAX

#_08F10E: LDA.w .blast_data_index,X
#_08F111: TAX

#_08F112: STZ.b $08

;---------------------------------------------------------------------------------------------------

.next_object
#_08F114: LDA.w .blast_char,X
#_08F117: CMP.b #$FF
#_08F119: BEQ .skip

#_08F11B: PHX

#_08F11C: TXA
#_08F11D: ASL A
#_08F11E: TAX

#_08F11F: REP #$20

#_08F121: LDA.w #$00C8
#_08F124: SEC
#_08F125: SBC.b $E8

#_08F127: CLC
#_08F128: ADC.w .blast_offset_y,X
#_08F12B: STA.b $00

#_08F12D: LDA.w #$00A8
#_08F130: SEC
#_08F131: SBC.b $E2

#_08F133: CLC
#_08F134: ADC.w .blast_offset_x,X
#_08F137: STA.b $02

#_08F139: SEP #$20

#_08F13B: PLX

#_08F13C: JSR Ancilla_SetOAM_XY

#_08F13F: LDA.w .blast_char,X
#_08F142: STA.b ($90),Y

#_08F144: INY

#_08F145: LDA.w .blast_prop,X
#_08F148: ORA.b #$30
#_08F14A: ORA.b #$02
#_08F14C: STA.b ($90),Y

#_08F14E: INY
#_08F14F: PHY

#_08F150: TYA
#_08F151: SEC
#_08F152: SBC.b #$04
#_08F154: LSR A
#_08F155: LSR A
#_08F156: TAY

#_08F157: LDA.w .blast_size,X
#_08F15A: STA.b ($92),Y

#_08F15C: PLY

.skip
#_08F15D: INX

#_08F15E: INC.b $08

#_08F160: LDA.b $08
#_08F162: CMP.b #$06
#_08F164: BNE .next_object

;---------------------------------------------------------------------------------------------------

.exit
#_08F166: BRL Ancilla_RestoreIndex

;===================================================================================================

pool Ancilla3A_BigBombExplosion

.offset_y
#_08F169: dw   0, -16, -24, -16
#_08F171: dw   0,   0,  16,  24
#_08F179: dw  16

.offset_x
#_08F17B: dw   0, -16,   0,  16
#_08F183: dw -24,  24, -16,   0
#_08F18B: dw  16

pool off

;---------------------------------------------------------------------------------------------------

Ancilla3A_BigBombExplosion:
#_08F18D: LDA.b $11
#_08F18F: BNE .just_draw

#_08F191: DEC.w $039F,X

#_08F194: LDA.w $039F,X
#_08F197: BNE .just_draw

#_08F199: INC.w $0C5E,X

#_08F19C: LDA.w $0C5E,X
#_08F19F: CMP.b #$02
#_08F1A1: BNE .skip_sfx

#_08F1A3: LDA.b #$0C ; SFX2.0C
#_08F1A5: JSR Ancilla_SFX2_Pan

.skip_sfx
#_08F1A8: LDA.w $0C5E,X
#_08F1AB: CMP.b #$0B
#_08F1AD: BNE .dont_terminate

#_08F1AF: STZ.w $0C4A,X

#_08F1B2: RTS

;---------------------------------------------------------------------------------------------------

.dont_terminate
#_08F1B3: TAY
#_08F1B4: LDA.w Bomb_timer,Y
#_08F1B7: STA.w $039F,X

.just_draw
#_08F1BA: LDA.b #$08
#_08F1BC: STA.b $09

#_08F1BE: LDA.b #$30
#_08F1C0: STA.b $65
#_08F1C2: STZ.b $64

#_08F1C4: STZ.b $0A

#_08F1C6: LDA.b #$32
#_08F1C8: STA.b $0B

#_08F1CA: LDA.w $0C5E,X
#_08F1CD: TAY

#_08F1CE: LDA.w BombDraw_object_count,Y
#_08F1D1: STA.b $08

#_08F1D3: LDA.w Bomb_anim_step,Y
#_08F1D6: TAY

#_08F1D7: LDA.w BombDraw_data_offset,Y
#_08F1DA: ASL A
#_08F1DB: TAY

#_08F1DC: ASL A
#_08F1DD: STA.b $04
#_08F1DF: STZ.b $05

#_08F1E1: TYA
#_08F1E2: STA.w $0C54,X

;---------------------------------------------------------------------------------------------------

#_08F1E5: LDY.b #$00

.next_object
#_08F1E7: PHX
#_08F1E8: PHY

#_08F1E9: LDA.w $0BFA,X
#_08F1EC: STA.b $00

#_08F1EE: LDA.w $0C0E,X
#_08F1F1: STA.b $01

#_08F1F3: LDA.w $0C04,X
#_08F1F6: STA.b $02

#_08F1F8: LDA.w $0C18,X
#_08F1FB: STA.b $03

#_08F1FD: LDA.b $09
#_08F1FF: ASL A
#_08F200: TAY

#_08F201: REP #$20

#_08F203: LDA.b $00
#_08F205: CLC
#_08F206: ADC.w .offset_y,Y

#_08F209: SEC
#_08F20A: SBC.b $E8
#_08F20C: STA.b $00

#_08F20E: LDA.b $02
#_08F210: CLC
#_08F211: ADC.w .offset_x,Y

#_08F214: SEC
#_08F215: SBC.b $E2
#_08F217: STA.b $02

#_08F219: SEP #$20

#_08F21B: PLY

#_08F21C: LDA.w $0C54,X
#_08F21F: TAX

#_08F220: LDA.b $01
#_08F222: BNE .skip

#_08F224: LDA.b $03
#_08F226: BNE .skip

;---------------------------------------------------------------------------------------------------

#_08F228: PHX
#_08F229: PHY

#_08F22A: LDA.b #$18
#_08F22C: JSR Ancilla_AllocateOAMFromRegion_A_or_D_or_F

#_08F22F: PLY
#_08F230: PLX

#_08F231: LDA.b $00
#_08F233: STA.b $0C

#_08F235: LDA.b $01
#_08F237: STA.b $0D

#_08F239: LDA.b $02
#_08F23B: STA.b $0E

#_08F23D: LDA.b $03
#_08F23F: STA.b $0F

#_08F241: STZ.b $06
#_08F243: STZ.b $07

#_08F245: JSR AncillaDraw_Explosion

;---------------------------------------------------------------------------------------------------

.skip
#_08F248: PLX

#_08F249: DEC.b $09
#_08F24B: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_08F24D: LDA.w $0C5E,X
#_08F250: CMP.b #$03
#_08F252: BNE .exit

#_08F254: LDA.w $039F,X
#_08F257: CMP.b #$01
#_08F259: BNE .exit

#_08F25B: LDA.w $0BFA,X
#_08F25E: STA.b $00

#_08F260: LDA.w $0C0E,X
#_08F263: STA.b $01

#_08F265: LDA.w $0C04,X
#_08F268: STA.b $02

#_08F26A: LDA.w $0C18,X
#_08F26D: STA.b $03

#_08F26F: PHX

#_08F270: JSL Bomb_CheckForDestructibles

#_08F274: PLX

#_08F275: LDA.b #$00
#_08F277: STA.l $7EF3CC

.exit
#_08F27B: RTS

;===================================================================================================

pool RevivalFairy_Main

.timer
#_08F27C: db   0, 144

.char
#_08F27E: db $4B, $4D, $49, $47, $49

pool off

;---------------------------------------------------------------------------------------------------

RevivalFairy_Main:
#_08F283: PHB
#_08F284: PHK
#_08F285: PLB

#_08F286: LDX.b #$00

#_08F288: LDA.w $0C54,X
#_08F28B: BEQ .emerging

#_08F28D: CMP.b #$03
#_08F28F: BNE .emerged

#_08F291: BRL .finish_up

;---------------------------------------------------------------------------------------------------

.emerging
#_08F294: DEC.w $039F,X

#_08F297: LDA.w $039F,X
#_08F29A: BNE .sprinkling

#_08F29C: INC.w $0C54,X

#_08F29F: LDY.w $0C54,X

#_08F2A2: LDA.w .timer,Y
#_08F2A5: STA.w $039F,X

#_08F2A8: STZ.w $0380,X
#_08F2AB: STZ.w $0294,X

#_08F2AE: BRL .draw

;---------------------------------------------------------------------------------------------------

.sprinkling
#_08F2B1: JSR Ancilla_Move_Z

#_08F2B4: BRL .draw

;---------------------------------------------------------------------------------------------------

.emerged
#_08F2B7: CMP.b #$01
#_08F2B9: BNE .fly_away_now

#_08F2BB: DEC.w $039F,X
#_08F2BE: LDA.w $039F,X
#_08F2C1: BNE .busy_sprinkling

#_08F2C3: INC.w $0C54,X

#_08F2C6: STZ.w $0294,X
#_08F2C9: STZ.w $0C2C,X

#_08F2CC: BRL .draw

;---------------------------------------------------------------------------------------------------

.busy_sprinkling
#_08F2CF: CMP.b #$4F
#_08F2D1: BEQ .do_sprinkle

#_08F2D3: CMP.b #$8F
#_08F2D5: BNE .dont_sprinkle

.do_sprinkle
#_08F2D7: INC.w $0385,X

#_08F2DA: LDA.b #$31 ; SFX2.31
#_08F2DC: JSR Ancilla_SFX2_Pan

.dont_sprinkle
#_08F2DF: LDA.w $0385,X
#_08F2E2: BEQ .not_sprinkling

#_08F2E4: DEC.w $0394,X
#_08F2E7: BPL .not_sprinkling

#_08F2E9: LDA.b #$05
#_08F2EB: STA.w $0394,X

#_08F2EE: INC.w $0C5E,X

#_08F2F1: LDA.w $0C5E,X
#_08F2F4: CMP.b #$03
#_08F2F6: BNE .not_sprinkling

#_08F2F8: STZ.w $0C5E,X
#_08F2FB: STZ.w $0385,X

;---------------------------------------------------------------------------------------------------

.not_sprinkling
#_08F2FE: LDY.b #$FF

#_08F300: LDA.w $0380,X
#_08F303: BEQ .descending

#_08F305: LDY.b #$01

.descending
#_08F307: STY.b $00

#_08F309: LDA.w $0294,X
#_08F30C: CLC
#_08F30D: ADC.b $00
#_08F30F: STA.w $0294,X
#_08F312: BPL .positive_z

#_08F314: EOR.b #$FF
#_08F316: INC A

.positive_z
#_08F317: CMP.b #$08
#_08F319: BNE .dont_toggle_z

#_08F31B: LDA.w $0380,X
#_08F31E: EOR.b #$01
#_08F320: STA.w $0380,X

.dont_toggle_z
#_08F323: JSR Ancilla_Move_Z

#_08F326: BRA .draw

;---------------------------------------------------------------------------------------------------

.fly_away_now
#_08F328: CMP.b #$02
#_08F32A: BNE .draw

#_08F32C: LDA.w $0294,X
#_08F32F: CMP.b #$18
#_08F331: BCS .at_max_z

#_08F333: CLC
#_08F334: ADC.b #$01
#_08F336: STA.w $0294,X

.at_max_z
#_08F339: LDA.w $0C2C,X
#_08F33C: CMP.b #$10
#_08F33E: BCS .at_max_x

#_08F340: CLC
#_08F341: ADC.b #$01
#_08F343: STA.w $0C2C,X

.at_max_x
#_08F346: JSR Ancilla_Move_X
#_08F349: JSR Ancilla_Move_Z

;---------------------------------------------------------------------------------------------------

.draw
#_08F34C: LDA.b #$0C
#_08F34E: JSL SpriteDraw_AllocateOAMFromRegionC

#_08F352: JSR Ancilla_PrepOAMCoord

#_08F355: PHX

#_08F356: STZ.b $0A

#_08F358: LDA.w $0C54,X
#_08F35B: CMP.b #$01
#_08F35D: BNE .am_not_sprinkling

#_08F35F: LDA.w $0385,X
#_08F362: BEQ .am_not_sprinkling

#_08F364: LDA.w $0C5E,X
#_08F367: INC A
#_08F368: STA.b $0A

.am_not_sprinkling
#_08F36A: LDY.b #$00

#_08F36C: REP #$20

#_08F36E: LDA.w $029E,X
#_08F371: AND.w #$00FF
#_08F374: CMP.w #$0080
#_08F377: BCC .positive_altitude

#_08F379: ORA.w #$FF00

.positive_altitude
#_08F37C: EOR.w #$FFFF
#_08F37F: INC A
#_08F380: CLC
#_08F381: ADC.b $00
#_08F383: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08F385: SEP #$20

#_08F387: JSR Ancilla_SetOAM_XY

#_08F38A: LDA.b $0A
#_08F38C: BEQ .flapping

#_08F38E: DEC A
#_08F38F: CLC
#_08F390: ADC.b #$02
#_08F392: TAX

#_08F393: BRA .set_char

.flapping
#_08F395: LDA.b $1A
#_08F397: AND.b #$04
#_08F399: LSR A
#_08F39A: LSR A
#_08F39B: TAX

.set_char
#_08F39C: LDA.w .char,X
#_08F39F: STA.b ($90),Y

#_08F3A1: INY

#_08F3A2: LDA.b #$74
#_08F3A4: STA.b ($90),Y

#_08F3A6: TYA
#_08F3A7: SEC
#_08F3A8: SBC.b #$03
#_08F3AA: LSR A
#_08F3AB: LSR A
#_08F3AC: TAY

#_08F3AD: LDA.b #$02
#_08F3AF: STA.b ($92),Y

#_08F3B1: PLX

#_08F3B2: LDY.b #$01

#_08F3B4: LDA.b ($90),Y
#_08F3B6: CMP.b #$F0
#_08F3B8: BNE .finish_up

#_08F3BA: LDA.b #$03
#_08F3BC: STA.w $0C54,X

#_08F3BF: INC.b $11

#_08F3C1: LDA.l $7EC211
#_08F3C5: STA.b $1C

;---------------------------------------------------------------------------------------------------

.finish_up
#_08F3C7: JSR RevivalFairy_Dust
#_08F3CA: JSR RevivalFairy_MonitorHP

#_08F3CD: PLB

#_08F3CE: RTL

;===================================================================================================

RevivalFairy_Dust:
#_08F3CF: LDA.w $0C54,X
#_08F3D2: BNE .continue

#_08F3D4: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_08F3D5: LDX.b #$02

#_08F3D7: LDA.w $0C54,X
#_08F3DA: CMP.b #$02
#_08F3DC: BEQ .exit

#_08F3DE: DEC.w $039F,X
#_08F3E1: BPL .exit

#_08F3E3: STZ.w $039F,X

#_08F3E6: LDA.b #$10

#_08F3E8: LDY.w $0FB3
#_08F3EB: BNE .use_region_d

#_08F3ED: JSL SpriteDraw_AllocateOAMFromRegionA
#_08F3F1: BRA .oam_allocated

.use_region_d
#_08F3F3: JSL SpriteDraw_AllocateOAMFromRegionD

;---------------------------------------------------------------------------------------------------

.oam_allocated
#_08F3F7: DEC.w $03B1,X
#_08F3FA: BPL .just_draw

#_08F3FC: LDA.b #$03
#_08F3FE: STA.w $03B1,X

#_08F401: LDY.b #$03

#_08F403: LDA.w PowderDraw_group_offset,Y
#_08F406: STA.b $00

;---------------------------------------------------------------------------------------------------

#_08F408: LDA.w $0C5E,X
#_08F40B: INC A
#_08F40C: CMP.b #$0A
#_08F40E: BNE .not_fully_sprinkled

#_08F410: LDA.b #$20
#_08F412: STA.w $039F,X

#_08F415: INC.w $0C54,X

#_08F418: LDA.b #$02
#_08F41A: STA.w $0C5E,X

#_08F41D: BRA .exit

;---------------------------------------------------------------------------------------------------

.not_fully_sprinkled
#_08F41F: STA.w $0C5E,X

#_08F422: CLC
#_08F423: ADC.b $00
#_08F425: TAY

#_08F426: LDA.w PowderDraw_anim_step,Y
#_08F429: STA.w $03C2,X

.just_draw
#_08F42C: JSR AncillaDraw_Powder

.exit
#_08F42F: RTS

;===================================================================================================

RevivalFairy_MonitorHP:
#_08F430: LDA.l $7EF36C
#_08F434: STA.b $00

#_08F436: LDA.l $7EF36D
#_08F43A: CMP.b $00

#_08F43C: BEQ .at_max

#_08F43E: CMP.b #$38
#_08F440: BNE .healing

.at_max
#_08F442: LDA.w $020A
#_08F445: BNE .healing

;---------------------------------------------------------------------------------------------------

#_08F447: LDY.b #$00 ; LINKSTATE 00

#_08F449: LDA.w $0345
#_08F44C: BEQ .not_swimming

#_08F44E: LDY.b #$04 ; LINKSTATE 04

#_08F450: LDA.b #$04
#_08F452: STA.w $0340

#_08F455: BRA .set_state

.not_swimming
#_08F457: LDA.b $56
#_08F459: BEQ .set_state

#_08F45B: LDY.b #$17 ; LINKSTATE 17

#_08F45D: LDA.b #$01
#_08F45F: STA.w $02E0

.set_state
#_08F462: STY.b $5D

#_08F464: STZ.b $4D
#_08F466: STZ.w $036B

#_08F469: STZ.w $030D
#_08F46C: STZ.w $030A

#_08F46F: STZ.b $24
#_08F471: STZ.b $46

#_08F473: STZ.w $0C4A
#_08F476: STZ.w $0C4B
#_08F479: STZ.w $0C4C
#_08F47C: STZ.w $0C4D
#_08F47F: STZ.w $0C4E

#_08F482: RTS

;---------------------------------------------------------------------------------------------------

.healing
#_08F483: LDX.b #$01

#_08F485: LDA.w $0C54,X
#_08F488: BNE .link_floating

#_08F48A: DEC.w $039F,X

#_08F48D: LDA.w $039F,X
#_08F490: BNE .delay_ascent

#_08F492: INC.w $039F,X

#_08F495: LDA.b #$04
#_08F497: STA.w $0294,X

#_08F49A: JSR Ancilla_Move_Z

#_08F49D: LDA.w $029E,X
#_08F4A0: CMP.b #$10
#_08F4A2: BCC .delay_ascent

#_08F4A4: INC.w $0C54,X

#_08F4A7: LDA.b #$02
#_08F4A9: STA.w $0294,X

.delay_ascent
#_08F4AC: BRA .float_link

;---------------------------------------------------------------------------------------------------

.link_floating
#_08F4AE: DEC.w $0380,X
#_08F4B1: BPL .delay_bobbing

#_08F4B3: LDA.b #$20
#_08F4B5: STA.w $0380,X

#_08F4B8: LDA.w $0294,X
#_08F4BB: EOR.b #$FF
#_08F4BD: INC A

#_08F4BE: STA.w $0294,X

;---------------------------------------------------------------------------------------------------

.delay_bobbing
#_08F4C1: JSR Ancilla_Move_Z

.float_link
#_08F4C4: LDA.w $029E,X
#_08F4C7: STA.b $24

#_08F4C9: RTS

;===================================================================================================

Animate_GAMEOVER_Letters:
#_08F4CA: PHB
#_08F4CB: PHK
#_08F4CC: PLB

#_08F4CD: JSR .main

#_08F4D0: PLB

#_08F4D1: RTL

;---------------------------------------------------------------------------------------------------

.vector_low
#_08F4D2: db GAMEOVER_Sweep>>0
#_08F4D3: db GAMEOVER_Unfurl>>0
#_08F4D4: db GAMEOVER_Stay>>0

.vector_high
#_08F4D5: db GAMEOVER_Sweep>>8
#_08F4D6: db GAMEOVER_Unfurl>>8
#_08F4D7: db GAMEOVER_Stay>>8

;---------------------------------------------------------------------------------------------------

.main
#_08F4D8: LDX.w $0C4A
#_08F4DB: BEQ .none_active

#_08F4DD: DEX

#_08F4DE: LDA.w .vector_low,X
#_08F4E1: STA.b $00

#_08F4E3: LDA.w .vector_high,X
#_08F4E6: STA.b $01

#_08F4E8: JMP.w ($0000)

.none_active
#_08F4EB: INC.b $11

#_08F4ED: RTS

;===================================================================================================

pool GAMEOVER_Sweep

.target_x
#_08F4EE: db $40 ; G
#_08F4EF: db $50 ; A
#_08F4F0: db $60 ; M
#_08F4F1: db $70 ; E

#_08F4F2: db $88 ; O
#_08F4F3: db $98 ; V
#_08F4F4: db $A8 ; E
#_08F4F5: db $40 ; R

pool off

;---------------------------------------------------------------------------------------------------

GAMEOVER_Sweep:
#_08F4F6: LDX.w $035F
#_08F4F9: STX.w $0FA0

#_08F4FC: LDY.b #$80
#_08F4FE: CPX.b #$07

#_08F500: BNE .pointless

#_08F502: LDY.b #$80

;---------------------------------------------------------------------------------------------------

.pointless
#_08F504: TYA
#_08F505: STA.w $0C2C,X

#_08F508: JSR Ancilla_Move_X

#_08F50B: LDA.w $0C18,X
#_08F50E: BNE .leftwards_ho

#_08F510: LDA.w $0C04,X
#_08F513: CMP.w .target_x,X
#_08F516: BCS .leftwards_ho

#_08F518: LDA.w .target_x,X
#_08F51B: STA.w $0C04,X

#_08F51E: INX
#_08F51F: STX.w $035F

#_08F522: CPX.b #$08
#_08F524: BNE .leftwards_ho

#_08F526: LDA.b #$07
#_08F528: STA.w $035F

#_08F52B: INC.w $0C4A

#_08F52E: STZ.w $039D

#_08F531: LDA.b #$26 ; SFX3.26
#_08F533: STA.w $012F

#_08F536: BRA .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.leftwards_ho
#_08F538: CPX.b #$07
#_08F53A: BNE .proceed_to_draw

#_08F53C: LDY.b #$06
#_08F53E: CPY.w $039D
#_08F541: BEQ .not_moving_together

;---------------------------------------------------------------------------------------------------

.next_follow
#_08F543: LDA.w $0C04,X
#_08F546: STA.w $0C04,Y

#_08F549: DEY
#_08F54A: CPY.w $039D
#_08F54D: BNE .next_follow

;---------------------------------------------------------------------------------------------------

.not_moving_together
#_08F54F: LDA.w $0C18,X
#_08F552: BNE .proceed_to_draw

#_08F554: LDA.w $0C04,X

#_08F557: LDX.w $039D

#_08F55A: CMP.w .target_x,X
#_08F55D: BCS .proceed_to_draw

#_08F55F: DEC.w $039D

.proceed_to_draw
#_08F562: BRL GAMEOVER_Stay

;===================================================================================================

pool GAMEOVER_Unfurl

.target_x
#_08F565: db $58 ; G
#_08F566: db $60 ; A
#_08F567: db $68 ; M
#_08F568: db $70 ; E

#_08F569: db $88 ; O
#_08F56A: db $90 ; V
#_08F56B: db $98 ; E
#_08F56C: db $A0 ; R

pool off

;---------------------------------------------------------------------------------------------------

GAMEOVER_Unfurl:
#_08F56D: LDX.w $035F
#_08F570: STX.w $0FA0

#_08F573: LDA.b #$60
#_08F575: STA.w $0C2C,X

#_08F578: JSR Ancilla_Move_X

#_08F57B: LDY.w $039D

#_08F57E: LDA.w $0C04,X
#_08F581: CMP.w .target_x,Y
#_08F584: BCC .rightwards_ho

#_08F586: LDA.w .target_x,Y
#_08F589: STA.w $0C04,Y

#_08F58C: INC.w $039D

#_08F58F: LDA.w $039D
#_08F592: CMP.b #$08
#_08F594: BNE .rightwards_ho

#_08F596: INC.b $11
#_08F598: INC.w $0C4A

#_08F59B: BRA .proceed_to_draw

.rightwards_ho
#_08F59D: LDA.w $039D
#_08F5A0: DEC A
#_08F5A1: STA.b $00

#_08F5A3: LDX.w $035F
#_08F5A6: TXY

.next_follow
#_08F5A7: LDA.w $0C04,X
#_08F5AA: STA.w $0C04,Y

#_08F5AD: DEY
#_08F5AE: CPY.b $00
#_08F5B0: BNE .next_follow

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
#_08F5B2: BRA GAMEOVER_Stay

;===================================================================================================

pool GAMEOVER_Stay

.char
#_08F5B4: db $40, $50 ; G
#_08F5B6: db $41, $51 ; A
#_08F5B8: db $42, $52 ; M
#_08F5BA: db $43, $53 ; E

#_08F5BC: db $44, $54 ; O
#_08F5BE: db $45, $55 ; V
#_08F5C0: db $43, $53 ; E
#_08F5C2: db $46, $56 ; R

pool off

;---------------------------------------------------------------------------------------------------

GAMEOVER_Stay:
#_08F5C4: LDA.b #$00
#_08F5C6: STA.b $90

#_08F5C8: LDA.b #$08
#_08F5CA: STA.b $91

#_08F5CC: LDA.b #$20
#_08F5CE: STA.b $92

#_08F5D0: LDA.b #$0A
#_08F5D2: STA.b $93

#_08F5D4: LDX.w $035F
#_08F5D7: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.next_letter
#_08F5D9: PHX

#_08F5DA: LDA.b #$57
#_08F5DC: STA.b $00
#_08F5DE: STZ.b $01

#_08F5E0: LDA.w $0C04,X
#_08F5E3: STA.b $02

#_08F5E5: LDA.w $0C18,X
#_08F5E8: STA.b $03

#_08F5EA: JSR Ancilla_SetOAM_XY

#_08F5ED: TXA
#_08F5EE: ASL A
#_08F5EF: TAX

#_08F5F0: LDA.w .char+0,X
#_08F5F3: STA.b ($90),Y

#_08F5F5: INY

#_08F5F6: LDA.b #$3C
#_08F5F8: STA.b ($90),Y

#_08F5FA: INY

#_08F5FB: LDA.b #$5F
#_08F5FD: STA.b $00
#_08F5FF: STZ.b $01

#_08F601: JSR Ancilla_SetOAM_XY

#_08F604: LDA.w .char+1,X
#_08F607: STA.b ($90),Y

#_08F609: INY

#_08F60A: LDA.b #$3C
#_08F60C: STA.b ($90),Y

#_08F60E: INY
#_08F60F: PHY

#_08F610: TYA
#_08F611: SEC
#_08F612: SBC.b #$08
#_08F614: LSR A
#_08F615: LSR A
#_08F616: TAY

#_08F617: LDA.b #$00
#_08F619: STA.b ($92),Y

#_08F61B: INY

#_08F61C: STA.b ($92),Y

#_08F61E: PLY
#_08F61F: PLX

#_08F620: DEX
#_08F621: BPL .next_letter

;---------------------------------------------------------------------------------------------------

#_08F623: RTS

;===================================================================================================

Ancilla_SetPanRelativeCoordinates:
#_08F624: PHX

#_08F625: LSR A
#_08F626: LSR A
#_08F627: LSR A
#_08F628: LSR A
#_08F629: LSR A

#_08F62A: TAX

#_08F62B: LDA.l AncillaPanValues,X

#_08F62F: PLX

#_08F630: RTS

;===================================================================================================

AncillaAdd_AddAncilla_Bank08:
#_08F631: PHA

#_08F632: JSL Ancilla_CheckForAvailableSlot

#_08F636: PLA

#_08F637: TYX
#_08F638: BMI .fail

#_08F63A: STA.w $0C4A,X

#_08F63D: TAY

#_08F63E: LDA.w AncillaObjectAllocation,Y
#_08F641: STA.w $0C90,X

#_08F644: LDA.b $EE
#_08F646: STA.w $0C7C,X

#_08F649: LDA.w $0476
#_08F64C: STA.w $03CA,X

#_08F64F: STZ.w $0C22,X
#_08F652: STZ.w $0C2C,X
#_08F655: STZ.w $0280,X

#_08F658: STZ.w $028A,X

#_08F65B: CLC

#_08F65C: RTS

.fail
#_08F65D: SEC

#_08F65E: RTS

;===================================================================================================

UNREACHABLE_08F65F:
#_08F65F: LDX.b #$05

.next_slot
#_08F661: CMP.w $0C4A,X
#_08F664: BEQ .found_match

#_08F666: DEX
#_08F667: BPL .next_slot

#_08F669: CLC

#_08F66A: RTS

.found_match
#_08F66B: SEC

#_08F66C: RTS

;===================================================================================================

AncillaPriorities:
#_08F66D: db $20, $10, $30, $20

;===================================================================================================

Ancilla_PrepOAMCoord:
#_08F671: LDY.w $0C7C,X

#_08F674: LDA.w AncillaPriorities,Y
#_08F677: STA.b $65
#_08F679: STZ.b $64

#_08F67B: LDA.w $0BFA,X
#_08F67E: STA.b $00

#_08F680: LDA.w $0C0E,X
#_08F683: STA.b $01

#_08F685: LDA.w $0C04,X
#_08F688: STA.b $02

#_08F68A: LDA.w $0C18,X
#_08F68D: STA.b $03

#_08F68F: REP #$20

#_08F691: LDA.b $00
#_08F693: SEC
#_08F694: SBC.b $E8
#_08F696: STA.b $00

#_08F698: LDA.b $02
#_08F69A: SEC
#_08F69B: SBC.b $E2
#_08F69D: STA.b $02
#_08F69F: STA.b $04

#_08F6A1: SEP #$20

#_08F6A3: RTS

;---------------------------------------------------------------------------------------------------

.adjusted
#_08F6A4: LDY.w $0C7C,X

#_08F6A7: LDA.w AncillaPriorities,Y
#_08F6AA: STA.b $65
#_08F6AC: STZ.b $64

#_08F6AE: LDA.w $0BFA,X
#_08F6B1: STA.b $00

#_08F6B3: LDA.w $0C0E,X
#_08F6B6: STA.b $01

#_08F6B8: LDA.w $0C04,X
#_08F6BB: STA.b $02

#_08F6BD: LDA.w $0C18,X
#_08F6C0: STA.b $03

#_08F6C2: REP #$20

#_08F6C4: LDA.b $00
#_08F6C6: SEC
#_08F6C7: SBC.w $0122
#_08F6CA: STA.b $00

#_08F6CC: LDA.b $02
#_08F6CE: SEC
#_08F6CF: SBC.w $011E
#_08F6D2: STA.b $02
#_08F6D4: STA.b $04

#_08F6D6: SEP #$20

#_08F6D8: RTS

;===================================================================================================

Ancilla_PrepOAMCoord_long:
#_08F6D9: PHB
#_08F6DA: PHK
#_08F6DB: PLB

#_08F6DC: JSR Ancilla_PrepOAMCoord

#_08F6DF: PLB

#_08F6E0: RTL

;===================================================================================================

Ancilla_SetOAM_XY:
#_08F6E1: PHX

#_08F6E2: LDX.b #$F0

#_08F6E4: LDA.b $01
#_08F6E6: BNE .off_screen

#_08F6E8: LDA.b $03
#_08F6EA: BNE .off_screen

#_08F6EC: LDA.b $02
#_08F6EE: STA.b ($90),Y

#_08F6F0: LDA.b $00
#_08F6F2: CMP.b #$F0
#_08F6F4: BCS .off_screen

#_08F6F6: TAX

.off_screen
#_08F6F7: INY

#_08F6F8: TXA
#_08F6F9: STA.b ($90),Y

#_08F6FB: INY

#_08F6FC: PLX

#_08F6FD: RTS

;===================================================================================================

Ancilla_SetOAM_XY_long:
#_08F6FE: JSR Ancilla_SetOAM_XY

#_08F701: RTL

;===================================================================================================

Ancilla_SetOAM_XY_safe:
#_08F702: REP #$20

#_08F704: LDA.b $02
#_08F706: STA.b ($90),Y

#_08F708: INY

#_08F709: CLC
#_08F70A: ADC.w #$0080
#_08F70D: CMP.w #$0180
#_08F710: BCS .off_screen

#_08F712: LDA.b $02
#_08F714: AND.w #$0100
#_08F717: STA.b $74

#_08F719: LDA.b $00
#_08F71B: STA.b ($90),Y

#_08F71D: CLC
#_08F71E: ADC.w #$0010
#_08F721: CMP.w #$0100
#_08F724: BCC .on_screen

.off_screen
#_08F726: LDA.w #$00F0
#_08F729: STA.b ($90),Y

.on_screen
#_08F72B: SEP #$20

#_08F72D: INY

#_08F72E: RTS

;===================================================================================================

pool Ancilla_CheckLinkCollision

.offset_y
#_08F72F: db   0,   0,   8,   0,   8
#_08F734: db   0,   8,   0,   0,   0

.offset_x
#_08F739: db   0,   0,   8,   0,   8
#_08F73E: db   0,   8,   0,   0,   0

.height
#_08F743: db  20,   0,  20,   0,   8
#_08F748: db   0,  28,   0,  14,   0

.width
#_08F74D: db  20,   0,   3,   0,   8
#_08F752: db   0,  24,   0,  14,   0

.offset_link_y
#_08F757: db  12,   0,  12,   0,  12
#_08F75C: db   0,  12,   0,  12,   0

.offset_link_x
#_08F761: db   8,   0,   8,   0,   8
#_08F766: db   0,  12,   0,   8,   0

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_CheckLinkCollision:
#_08F76B: TYA
#_08F76C: ASL A
#_08F76D: TAY

#_08F76E: LDA.w $0BFA,X
#_08F771: STA.b $00

#_08F773: LDA.w $0C0E,X
#_08F776: STA.b $01

#_08F778: LDA.w $0C04,X
#_08F77B: STA.b $02

#_08F77D: LDA.w $0C18,X
#_08F780: STA.b $03

#_08F782: STZ.b $0B

#_08F784: LDA.w $029E,X
#_08F787: STA.b $0A

#_08F789: BPL .positive_z

#_08F78B: LDA.b #$FF
#_08F78D: STA.b $0B

;---------------------------------------------------------------------------------------------------

.positive_z
#_08F78F: REP #$20

#_08F791: LDA.b $00
#_08F793: CLC
#_08F794: ADC.b $0A

#_08F796: CLC
#_08F797: ADC.w .offset_y,Y
#_08F79A: STA.b $00

#_08F79C: LDA.b $02
#_08F79E: CLC
#_08F79F: ADC.w .offset_x,Y
#_08F7A2: STA.b $02

#_08F7A4: LDA.b $20
#_08F7A6: CLC
#_08F7A7: ADC.w .offset_link_y,Y

#_08F7AA: SEC
#_08F7AB: SBC.b $00
#_08F7AD: STA.b $04

#_08F7AF: BPL .positive_y

#_08F7B1: EOR.w #$FFFF
#_08F7B4: INC A

.positive_y
#_08F7B5: STA.b $08

#_08F7B7: CMP.w .height,Y
#_08F7BA: BCS .no_collision

;---------------------------------------------------------------------------------------------------

#_08F7BC: LDA.b $22
#_08F7BE: CLC
#_08F7BF: ADC.w .offset_link_x,Y

#_08F7C2: SEC
#_08F7C3: SBC.b $02
#_08F7C5: STA.b $06

#_08F7C7: BPL .positive_x

#_08F7C9: EOR.w #$FFFF
#_08F7CC: INC A

.positive_x
#_08F7CD: STA.b $0A

#_08F7CF: CMP.w .width,Y
#_08F7D2: BCS .no_collision

;---------------------------------------------------------------------------------------------------

.collision
#_08F7D4: SEP #$20
#_08F7D6: SEC

#_08F7D7: RTS

.no_collision
#_08F7D8: SEP #$20
#_08F7DA: CLC

#_08F7DB: RTS

;===================================================================================================

Hookshot_CheckProximityToLink:
#_08F7DC: REP #$20

#_08F7DE: LDA.b $00
#_08F7E0: CLC
#_08F7E1: ADC.w #$0004
#_08F7E4: STA.b $72

#_08F7E6: LDA.b $02
#_08F7E8: CLC
#_08F7E9: ADC.w #$0004
#_08F7EC: STA.b $74

#_08F7EE: LDA.b $20
#_08F7F0: SEC
#_08F7F1: SBC.b $E8

#_08F7F3: CLC
#_08F7F4: ADC.w #$000C

#_08F7F7: SEC
#_08F7F8: SBC.b $72

#_08F7FA: BPL .positive_y

#_08F7FC: EOR.w #$FFFF
#_08F7FF: INC A

.positive_y
#_08F800: CMP.w #$000C
#_08F803: BCS .too_far

#_08F805: LDA.b $22
#_08F807: SEC
#_08F808: SBC.b $E2

#_08F80A: CLC
#_08F80B: ADC.w #$0008

#_08F80E: SEC
#_08F80F: SBC.b $74

#_08F811: BPL .positive_x

#_08F813: EOR.w #$FFFF
#_08F816: INC A

.positive_x
#_08F817: CMP.w #$000C
#_08F81A: BCS .too_far

.close
#_08F81C: SEP #$20
#_08F81E: SEC

#_08F81F: RTS

.too_far
#_08F820: SEP #$20
#_08F822: CLC

#_08F823: RTS

;===================================================================================================

pool Ancilla_CheckForEntranceTrigger

.position_y
#_08F824: dw $0D40, $0210, $0CFC, $0100

.position_x
#_08F82C: dw $0D80, $0E68, $0130, $0F10

.height
#_08F834: dw $000B, $0020, $0010, $000C

.width
#_08F83C: dw $0010, $0010, $0010, $0010

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_CheckForEntranceTrigger:
#_08F844: TYA
#_08F845: ASL A
#_08F846: TAY

#_08F847: REP #$20

#_08F849: LDA.b $20
#_08F84B: CLC
#_08F84C: ADC.w #$000C

#_08F84F: SEC
#_08F850: SBC.w .position_y,Y

#_08F853: BPL .positive_y

#_08F855: EOR.w #$FFFF
#_08F858: INC A

.positive_y
#_08F859: CMP.w .height,Y
#_08F85C: BCS .out_of_range

#_08F85E: LDA.b $22
#_08F860: CLC
#_08F861: ADC.w #$0008

#_08F864: SEC
#_08F865: SBC.w .position_x,Y

#_08F868: BPL .positive_x

#_08F86A: EOR.w #$FFFF
#_08F86D: INC A

.positive_x
#_08F86E: CMP.w .width,Y
#_08F871: BCS .out_of_range

.success
#_08F873: SEP #$20
#_08F875: SEC

#_08F876: RTS

.out_of_range
#_08F877: SEP #$20
#_08F879: CLC

#_08F87A: RTS

;===================================================================================================

pool AncillaDraw_Shadow

.char
#_08F87B: db $6C, $6C
#_08F87D: db $28, $28
#_08F87F: db $38, $FF
#_08F881: db $C8, $C8
#_08F883: db $D8, $D8
#_08F885: db $D9, $D9
#_08F887: db $DA, $DA

.prop
#_08F889: db $28, $68
#_08F88B: db $28, $68
#_08F88D: db $28, $FF
#_08F88F: db $22, $22
#_08F891: db $24, $64
#_08F893: db $24, $64
#_08F895: db $24, $64

pool off

;---------------------------------------------------------------------------------------------------

AncillaDraw_Shadow:
#_08F897: CPX.b #$02
#_08F899: BNE .big_shadow

#_08F89B: REP #$20

#_08F89D: LDA.b $02
#_08F89F: CLC
#_08F8A0: ADC.w #$0004
#_08F8A3: STA.b $02

#_08F8A5: SEP #$20

;---------------------------------------------------------------------------------------------------

.big_shadow
#_08F8A7: TXA
#_08F8A8: ASL A
#_08F8A9: TAX

#_08F8AA: STZ.b $74
#_08F8AC: STZ.b $75

#_08F8AE: JSR Ancilla_SetOAM_XY_safe

#_08F8B1: LDA.w .char+0,X
#_08F8B4: STA.b ($90),Y

#_08F8B6: INY

#_08F8B7: LDA.w .prop+0,X
#_08F8BA: AND.b #$CF
#_08F8BC: ORA.b $04
#_08F8BE: STA.b ($90),Y

#_08F8C0: INY
#_08F8C1: PHY

#_08F8C2: TYA
#_08F8C3: SEC
#_08F8C4: SBC.b #$04
#_08F8C6: LSR A
#_08F8C7: LSR A
#_08F8C8: TAY

#_08F8C9: LDA.b #$00
#_08F8CB: ORA.b $75
#_08F8CD: STA.b ($92),Y

#_08F8CF: PLY

#_08F8D0: REP #$20

#_08F8D2: LDA.b $02
#_08F8D4: CLC
#_08F8D5: ADC.w #$0008
#_08F8D8: STA.b $02

#_08F8DA: SEP #$20

#_08F8DC: LDA.w .char+1,X
#_08F8DF: CMP.b #$FF
#_08F8E1: BEQ .exit

#_08F8E3: STZ.b $74
#_08F8E5: STZ.b $75

#_08F8E7: JSR Ancilla_SetOAM_XY_safe

#_08F8EA: LDA.w .char+1,X
#_08F8ED: STA.b ($90),Y

#_08F8EF: INY

#_08F8F0: LDA.w .prop+1,X
#_08F8F3: AND.b #$CF
#_08F8F5: ORA.b $04
#_08F8F7: STA.b ($90),Y

#_08F8F9: INY
#_08F8FA: PHY

#_08F8FB: TYA
#_08F8FC: SEC
#_08F8FD: SBC.b #$03
#_08F8FF: LSR A
#_08F900: LSR A
#_08F901: TAY

#_08F902: LDA.b #$00
#_08F904: ORA.b $75
#_08F906: STA.b ($92),Y

#_08F908: PLY

.exit
#_08F909: RTS

;===================================================================================================

Ancilla_AllocateOAMFromRegion_B_or_E:
#_08F90A: LDY.w $0FB3
#_08F90D: BNE .use_region_E

.use_region_B
#_08F90F: JSL SpriteDraw_AllocateOAMFromRegionB
#_08F913: BRA .exit

.use_region_E
#_08F915: JSL SpriteDraw_AllocateOAMFromRegionE

.exit
#_08F919: RTS

;===================================================================================================

Follower_MoveTowardsLink:
#_08F91A: PHB
#_08F91B: PHK
#_08F91C: PLB

.get_closer
#_08F91D: LDX.w $02D3

#_08F920: LDA.w $1A00,X
#_08F923: STA.w $0C03

#_08F926: LDA.w $1A14,X
#_08F929: STA.w $0C17

#_08F92C: LDA.w $1A28,X
#_08F92F: STA.w $0C0D

#_08F932: LDA.w $1A3C,X
#_08F935: STA.w $0C21

#_08F938: LDX.b #$09
#_08F93A: LDA.b #$18
#_08F93C: JSR Ancilla_ProjectSpeedTowardsPlayer

#_08F93F: LDA.b $00
#_08F941: STA.w $0C22,X

#_08F944: LDA.b $01
#_08F946: STA.w $0C2C,X

#_08F949: JSR Ancilla_Move_Y

#_08F94C: PHX
#_08F94D: JSR Ancilla_Move_X
#_08F950: PLX

#_08F951: LDA.w $0BFA,X
#_08F954: STA.b $00

#_08F956: LDA.w $0C0E,X
#_08F959: STA.b $01

#_08F95B: LDA.w $0C04,X
#_08F95E: STA.b $02

#_08F960: LDA.w $0C18,X
#_08F963: STA.b $03

;---------------------------------------------------------------------------------------------------

#_08F965: REP #$20

#_08F967: LDA.b $00
#_08F969: SEC
#_08F96A: SBC.b $20
#_08F96C: BPL .positive_y

#_08F96E: EOR.w #$FFFF
#_08F971: INC A

.positive_y
#_08F972: CMP.w #$0002
#_08F975: BCS .close_enough

#_08F977: LDA.b $02
#_08F979: SEC
#_08F97A: SBC.b $22
#_08F97C: BPL .positive_x

#_08F97E: EOR.w #$FFFF
#_08F981: INC A

.positive_x
#_08F982: CMP.w #$0002
#_08F985: BCC .exit

;---------------------------------------------------------------------------------------------------

.close_enough
#_08F987: SEP #$20

#_08F989: INC.w $02D3

#_08F98C: LDX.w $02D3
#_08F98F: CPX.b #$12
#_08F991: BEQ .exit

#_08F993: LDA.b $00
#_08F995: STA.w $1A00,X

#_08F998: LDA.b $01
#_08F99A: STA.w $1A14,X

#_08F99D: LDA.b $02
#_08F99F: STA.w $1A28,X

#_08F9A2: LDA.b $03
#_08F9A4: STA.w $1A3C,X

#_08F9A7: LDY.b $EE

#_08F9A9: LDA.w AncillaPriorities,Y
#_08F9AC: LSR A
#_08F9AD: LSR A
#_08F9AE: ORA.b #$01
#_08F9B0: STA.w $1A64,X

#_08F9B3: BRL .get_closer

;---------------------------------------------------------------------------------------------------

.exit
#_08F9B6: SEP #$20

#_08F9B8: PLB

#_08F9B9: RTL

;===================================================================================================

Ancilla_AllocateOAMFromCustomRegion:
#_08F9BA: PHA
#_08F9BB: PHX

#_08F9BC: REP #$20

#_08F9BE: TYA
#_08F9BF: AND.w #$00FF
#_08F9C2: CLC
#_08F9C3: ADC.b $90

#_08F9C5: LDX.w $0FB3
#_08F9C8: BEQ .ignore_layer

#_08F9CA: CMP.w #$0900
#_08F9CD: BCS .upper_region

#_08F9CF: CMP.w #$08E0
#_08F9D2: BCC .continue

#_08F9D4: LDA.w #$0820
#_08F9D7: BRA .set_region

.upper_region
#_08F9D9: CMP.w #$09D0
#_08F9DC: BCC .continue

#_08F9DE: LDA.w #$0940
#_08F9E1: BRA .set_region

;---------------------------------------------------------------------------------------------------

.ignore_layer
#_08F9E3: CMP.w #$0990
#_08F9E6: BCC .continue

#_08F9E8: LDA.w #$0820

;---------------------------------------------------------------------------------------------------

.set_region
#_08F9EB: STA.b $90

#_08F9ED: SEC
#_08F9EE: SBC.w #$0800
#_08F9F1: LSR A
#_08F9F2: LSR A
#_08F9F3: CLC
#_08F9F4: ADC.w #$0A20
#_08F9F7: STA.b $92

#_08F9F9: LDY.b #$00

;---------------------------------------------------------------------------------------------------

.continue
#_08F9FB: SEP #$20

#_08F9FD: PLX
#_08F9FE: PLA

#_08F9FF: RTS

;===================================================================================================

HitStars_UpdateOAMBufferPosition:
#_08FA00: PHA
#_08FA01: PHX

#_08FA02: REP #$20

#_08FA04: TYA
#_08FA05: AND.w #$00FF
#_08FA08: CLC
#_08FA09: ADC.b $90

#_08FA0B: LDX.w $0FB3
#_08FA0E: BNE .exit

#_08FA10: CMP.w #$09D0
#_08FA13: BCC .exit

#_08FA15: LDA.w #$0820
#_08FA18: STA.b $90

#_08FA1A: SEC
#_08FA1B: SBC.w #$0800

#_08FA1E: LSR A
#_08FA1F: LSR A

#_08FA20: CLC
#_08FA21: ADC.w #$0A20
#_08FA24: STA.b $92

#_08FA26: LDY.b #$00

.exit
#_08FA28: SEP #$20

#_08FA2A: PLX
#_08FA2B: PLA

#_08FA2C: RTS

;===================================================================================================

Hookshot_ShouldIEvenBotherWithTiles:
#_08FA2D: PHX
#_08FA2E: PHY

#_08FA2F: LDA.w $0BFA,X
#_08FA32: STA.b $00

#_08FA34: LDA.w $0C0E,X
#_08FA37: STA.b $01

#_08FA39: LDA.w $0C04,X
#_08FA3C: STA.b $02

#_08FA3E: LDA.w $0C18,X
#_08FA41: STA.b $03

#_08FA43: LDA.b $1B
#_08FA45: BNE Hookshot_CheckForTileAllowanceUnderworld

;===================================================================================================

Hookshot_CheckForTileAllowanceOverworld:
#_08FA47: REP #$20

#_08FA49: LDA.w $0C72,X
#_08FA4C: AND.w #$0002
#_08FA4F: BNE .horizontal_direction

;---------------------------------------------------------------------------------------------------

.vertical_direction
#_08FA51: LDX.w $0700

#_08FA54: LDA.b $00
#_08FA56: SEC
#_08FA57: SBC.l OverworldTransitionPositionY,X
#_08FA5B: CMP.w #$0004
#_08FA5E: BCC Hookshot_DisallowTileCollision

#_08FA60: CMP.w $0716
#_08FA63: BCS Hookshot_DisallowTileCollision

#_08FA65: BRA Hookshot_AllowTileCollision

;---------------------------------------------------------------------------------------------------

.horizontal_direction
#_08FA67: LDX.w $0700

#_08FA6A: LDA.b $02
#_08FA6C: SEC
#_08FA6D: SBC.l OverworldTransitionPositionX,X
#_08FA71: CMP.w #$0006
#_08FA74: BCC Hookshot_DisallowTileCollision

#_08FA76: CMP.w $0716
#_08FA79: BCC Hookshot_AllowTileCollision

;===================================================================================================

Hookshot_DisallowTileCollision:
#_08FA7B: SEP #$20

#_08FA7D: PLY
#_08FA7E: PLX

#_08FA7F: SEC

#_08FA80: RTS

;===================================================================================================

Hookshot_AllowTileCollision:
#_08FA81: SEP #$20

#_08FA83: PLY
#_08FA84: PLX

#_08FA85: CLC

#_08FA86: RTS

;===================================================================================================

Hookshot_CheckForTileAllowanceUnderworld:
#_08FA87: REP #$20

#_08FA89: LDA.w $0C72,X
#_08FA8C: AND.w #$0002
#_08FA8F: BNE .horizontal_direction

;---------------------------------------------------------------------------------------------------

.vertical_direction
#_08FA91: LDA.b $00
#_08FA93: AND.w #$01FF
#_08FA96: CMP.w #$0004
#_08FA99: BCC Hookshot_DisallowTileCollision

#_08FA9B: CMP.w #$01E8
#_08FA9E: BCS Hookshot_DisallowTileCollision

#_08FAA0: BRA .continue_vertically

;---------------------------------------------------------------------------------------------------

.horizontal_direction
#_08FAA2: LDA.b $02
#_08FAA4: AND.w #$01FF
#_08FAA7: CMP.w #$0004
#_08FAAA: BCC Hookshot_DisallowTileCollision

#_08FAAC: CMP.w #$01F0
#_08FAAF: BCS Hookshot_DisallowTileCollision

#_08FAB1: BRA .continue_horizontally

;---------------------------------------------------------------------------------------------------

.continue_vertically
#_08FAB3: SEP #$20

#_08FAB5: PLY
#_08FAB6: PLX

#_08FAB7: LDA.b $01
#_08FAB9: AND.b #$02
#_08FABB: STA.b $01

#_08FABD: LDA.b $21
#_08FABF: AND.b #$02
#_08FAC1: CMP.b $01
#_08FAC3: BEQ .allow

;---------------------------------------------------------------------------------------------------

.disallow_vertical
#_08FAC5: SEC

#_08FAC6: RTS

;---------------------------------------------------------------------------------------------------

.continue_horizontally
#_08FAC7: SEP #$20

#_08FAC9: PLY
#_08FACA: PLX

#_08FACB: LDA.b $03
#_08FACD: AND.b #$02
#_08FACF: STA.b $03

#_08FAD1: LDA.b $23
#_08FAD3: AND.b #$02
#_08FAD5: CMP.b $03
#_08FAD7: BEQ .allow

;---------------------------------------------------------------------------------------------------

.disallow_horizontal
#_08FAD9: SEC

#_08FADA: RTS

;---------------------------------------------------------------------------------------------------

.allow
#_08FADB: CLC

#_08FADC: RTS

;===================================================================================================

Ancilla_GetRadialProjection:
#_08FADD: PHX

#_08FADE: TAX

#_08FADF: LDA.l .multiplier_y,X
#_08FAE3: STA.w WRMPYA

#_08FAE6: LDA.b $08
#_08FAE8: STA.w WRMPYB

#_08FAEB: LDA.l .meta_sign_y,X
#_08FAEF: STA.b $02
#_08FAF1: STZ.b $03

#_08FAF3: LDA.w RDMPYL
#_08FAF6: ASL A
#_08FAF7: LDA.w RDMPYH

#_08FAFA: ADC.b #$00
#_08FAFC: STA.b $00
#_08FAFE: STZ.b $01

;---------------------------------------------------------------------------------------------------

#_08FB00: LDA.l .multiplier_x,X
#_08FB04: STA.w WRMPYA

#_08FB07: LDA.b $08
#_08FB09: STA.w WRMPYB

#_08FB0C: LDA.l .meta_sign_x,X
#_08FB10: STA.b $06
#_08FB12: STZ.b $07

#_08FB14: LDA.w RDMPYL
#_08FB17: ASL A
#_08FB18: LDA.w RDMPYH

#_08FB1B: ADC.b #$00
#_08FB1D: STA.b $04
#_08FB1F: STZ.b $05

#_08FB21: PLX

#_08FB22: RTS

;===================================================================================================

Ancilla_GetRadialProjection_long:
#_08FB23: PHB
#_08FB24: PHK
#_08FB25: PLB

#_08FB26: JSR Ancilla_GetRadialProjection

#_08FB29: PLB

#_08FB2A: RTL

;===================================================================================================

Ancilla_AllocateOAMFromRegion_A_or_D_or_F:
#_08FB2B: LDY.w $0FB3
#_08FB2E: BNE .consider_layer

#_08FB30: JSL SpriteDraw_AllocateOAMFromRegionA

#_08FB34: RTS

.consider_layer
#_08FB35: LDY.w $0C7C,X
#_08FB38: BNE .lower_layer

#_08FB3A: JSL SpriteDraw_AllocateOAMFromRegionD

#_08FB3E: RTS

.lower_layer
#_08FB3F: JSL SpriteDraw_AllocateOAMFromRegionF

#_08FB43: RTS

;===================================================================================================

BeamHit_OAMAdjustments:
#_08FB44: JSR BeamHit_GetCoords

#_08FB47: LDY.b #$00

.next
#_08FB49: PHY

#_08FB4A: TYA
#_08FB4B: LSR A
#_08FB4C: LSR A
#_08FB4D: TAY

#_08FB4E: LDA.b $0B
#_08FB50: BPL .skip_x_bit

#_08FB52: LDA.b ($92),Y
#_08FB54: AND.b #$02

;---------------------------------------------------------------------------------------------------

.skip_x_bit
#_08FB56: STA.b ($92),Y

#_08FB58: PLY

#_08FB59: LDX.b #$00

#_08FB5B: LDA.b ($90),Y
#_08FB5D: SEC
#_08FB5E: SBC.b $07
#_08FB60: BPL .positive_x

#_08FB62: DEX

.positive_x
#_08FB63: CLC
#_08FB64: ADC.b $02
#_08FB66: STA.b $04

;---------------------------------------------------------------------------------------------------

#_08FB68: TXA
#_08FB69: ADC.b $03
#_08FB6B: STA.b $05

#_08FB6D: JSR BeamHit_GetTopXBit
#_08FB70: BCC .x_on_screen

#_08FB72: PHY

#_08FB73: TYA
#_08FB74: LSR A
#_08FB75: LSR A
#_08FB76: TAY

#_08FB77: LDA.b ($92),Y
#_08FB79: ORA.b #$01
#_08FB7B: STA.b ($92),Y

#_08FB7D: PLY

;---------------------------------------------------------------------------------------------------

.x_on_screen
#_08FB7E: LDX.b #$00

#_08FB80: INY

#_08FB81: LDA.b ($90),Y
#_08FB83: SEC
#_08FB84: SBC.b $06
#_08FB86: BPL .positive_y

#_08FB88: DEX

.positive_y
#_08FB89: CLC
#_08FB8A: ADC.b $00
#_08FB8C: STA.b $09

#_08FB8E: TXA
#_08FB8F: ADC.b $01
#_08FB91: STA.b $0A

#_08FB93: JSR BeamHit_CheckOffscreen_Y
#_08FB96: BCC .y_on_screen

#_08FB98: LDA.b #$F0
#_08FB9A: STA.b ($90),Y

;---------------------------------------------------------------------------------------------------

.y_on_screen
#_08FB9C: INY
#_08FB9D: INY
#_08FB9E: INY

#_08FB9F: DEC.b $08
#_08FBA1: BPL .next

#_08FBA3: BRL Ancilla_RestoreIndex

;===================================================================================================

BeamHit_GetCoords:
#_08FBA6: STY.b $0B

#_08FBA8: STA.b $08

#_08FBAA: LDA.w $0BFA,X
#_08FBAD: STA.b $00

#_08FBAF: SEC
#_08FBB0: SBC.b $E8
#_08FBB2: STA.b $06

#_08FBB4: LDA.w $0C0E,X
#_08FBB7: STA.b $01

#_08FBB9: LDA.w $0C04,X
#_08FBBC: STA.b $02

#_08FBBE: SEC
#_08FBBF: SBC.b $E2
#_08FBC1: STA.b $07

#_08FBC3: LDA.w $0C18,X
#_08FBC6: STA.b $03

#_08FBC8: RTS

;===================================================================================================

BeamHit_GetTopXBit:
#_08FBC9: REP #$20

#_08FBCB: LDA.b $04
#_08FBCD: SEC
#_08FBCE: SBC.b $E2
#_08FBD0: CMP.w #$0100

#_08FBD3: SEP #$20

#_08FBD5: RTS

;===================================================================================================

BeamHit_CheckOffscreen_Y:
#_08FBD6: REP #$20

#_08FBD8: LDA.b $09
#_08FBDA: PHA

#_08FBDB: CLC
#_08FBDC: ADC.w #$0010

#_08FBDF: STA.b $09
#_08FBE1: SEC
#_08FBE2: SBC.b $E8
#_08FBE4: CMP.w #$0100

#_08FBE7: PLA
#_08FBE8: STA.b $09

#_08FBEA: SEP #$20

#_08FBEC: RTS

;===================================================================================================

QuakeDrawGFX:

.group00_a
#_08FBED: db $00, $F0, $00

.group00_b
#_08FBF0: db $00, $F0, $01

;---------------------------------------------------------------------------------------------------

.group01_a
#_08FBF3: db $00, $F0, $02

.group01_b
#_08FBF6: db $00, $F0, $03

;---------------------------------------------------------------------------------------------------

.group02_a
#_08FBF9: db $00, $F0, $43

.group02_b
#_08FBFC: db $00, $F0, $42

;---------------------------------------------------------------------------------------------------

.group03_a
#_08FBFF: db $00, $F0, $41

.group03_b
#_08FC02: db $00, $F0, $40

;---------------------------------------------------------------------------------------------------

.group04_a
#_08FC05: db $00, $F0, $40, $0E, $F8, $84

.group04_b
#_08FC0B: db $1D, $F8, $44, $0D, $F9, $84

;---------------------------------------------------------------------------------------------------

.group05_a
#_08FC11: db $1F, $F9, $44, $2F, $FC, $84

.group05_b
#_08FC17: db $31, $F5, $06, $3F, $FB, $44, $2F, $FC
#_08FC1F: db $84

;---------------------------------------------------------------------------------------------------

.group06_a
#_08FC20: db $24, $EF, $08, $31, $F5, $06, $3F, $FB
#_08FC28: db $44, $4E, $04, $08

.group06_b
#_08FC2C: db $16, $E1, $08, $24, $EF, $08, $4E, $04
#_08FC34: db $08, $5D, $14, $08

;---------------------------------------------------------------------------------------------------

.group07_a
#_08FC38: db $07, $D2, $08, $17, $D3, $48, $16, $E1
#_08FC40: db $08, $5D, $14, $08, $5D, $24, $48

.group07_b
#_08FC47: db $F9, $C3, $08, $25, $C5, $48, $07, $D2
#_08FC4F: db $08, $17, $D3, $48, $5D, $24, $48, $5D
#_08FC57: db $34, $08

;---------------------------------------------------------------------------------------------------

.group08_a
#_08FC59: db $EA, $B5, $08, $2F, $B6, $01, $F8, $C3
#_08FC61: db $08, $24, $C4, $48, $5D, $34, $08, $6C
#_08FC69: db $43, $08

.group08_b
#_08FC6B: db $DB, $A6, $08, $EA, $B5, $08, $2F, $B6
#_08FC73: db $01, $3B, $C2, $81, $6C, $43, $08, $79
#_08FC7B: db $50, $08

;---------------------------------------------------------------------------------------------------

.group09_a
#_08FC7D: db $D4, $98, $C9, $DB, $A6, $08, $49, $B6
#_08FC85: db $48, $3B, $C2, $81, $79, $50, $08

.group09_b
#_08FC8C: db $D4, $88, $09, $D4, $98, $C9, $57, $A7
#_08FC94: db $48, $49, $B6, $48

;---------------------------------------------------------------------------------------------------

.group0A_a
#_08FC98: db $D4, $88, $09, $66, $98, $48, $57, $A7
#_08FCA0: db $48

.group0A_b
#_08FCA1: db $66, $98, $48, $57, $A7, $48

;---------------------------------------------------------------------------------------------------

.group0B_a
#_08FCA7: db $70, $8C, $48, $66, $98, $48

.group0B_b
#_08FCAD: db $70, $8C, $48

;---------------------------------------------------------------------------------------------------

.group0C_a
#_08FCB0: db $F3, $F0, $00

.group0C_b
#_08FCB3: db $F3, $F0, $01

;---------------------------------------------------------------------------------------------------

.group0D_a
#_08FCB6: db $F3, $F0, $02

.group0D_b
#_08FCB9: db $F3, $F0, $03

;---------------------------------------------------------------------------------------------------

.group0E_a
#_08FCBC: db $F5, $F0, $43

.group0E_b
#_08FCBF: db $F5, $F0, $42

;---------------------------------------------------------------------------------------------------

.group0F_a
#_08FCC2: db $F5, $F0, $41

.group0F_b
#_08FCC5: db $F5, $F0, $40, $E8, $F6, $04

;---------------------------------------------------------------------------------------------------

.group10_a
#_08FCCB: db $DA, $EE, $08, $E8, $F6, $04, $D8, $F9
#_08FCD3: db $C4

.group10_b
#_08FCD4: db $D3, $DF, $C9, $DA, $EE, $08, $C7, $F9
#_08FCDC: db $04, $D8, $F9, $C4

;---------------------------------------------------------------------------------------------------

.group11_a
#_08FCE0: db $D0, $D3, $07, $D3, $DF, $C9, $C7, $F9
#_08FCE8: db $04, $B9, $02, $48

.group11_b
#_08FCEC: db $D0, $D3, $06, $B9, $02, $48, $BA, $12
#_08FCF4: db $08

;---------------------------------------------------------------------------------------------------

.group12_a
#_08FCF5: db $D0, $D3, $05, $BA, $12, $08, $C8, $21
#_08FCFD: db $08

.group12_b
#_08FCFE: db $D0, $D3, $07, $CA, $22, $08, $CA, $31
#_08FD06: db $88

;---------------------------------------------------------------------------------------------------

.group13_a
#_08FD07: db $D0, $D3, $06, $CA, $31, $88, $BB, $40
#_08FD0F: db $88

.group13_b
#_08FD10: db $D0, $D3, $07, $BB, $40, $88, $AB, $49
#_08FD18: db $C4

;---------------------------------------------------------------------------------------------------

.group14_a
#_08FD19: db $D0, $D3, $05, $9B, $49, $04, $AB, $49
#_08FD21: db $C4

.group14_b
#_08FD22: db $C4, $CB, $08, $D0, $D3, $06, $9B, $49
#_08FD2A: db $04, $8C, $4D, $C4

;---------------------------------------------------------------------------------------------------

.group15_a
#_08FD2E: db $B5, $BD, $08, $C4, $CB, $08, $80, $4C
#_08FD36: db $04, $8C, $4D, $C4

.group15_b
#_08FD3A: db $A6, $AE, $08, $B5, $BD, $08, $80, $4C
#_08FD42: db $04

;---------------------------------------------------------------------------------------------------

.group16_a
#_08FD43: db $97, $9F, $08, $A6, $AE, $08

.group16_b
#_08FD49: db $88, $91, $08, $97, $9F, $08

;---------------------------------------------------------------------------------------------------

.group17_a
#_08FD4F: db $88, $91, $08

.group17_b
#_08FD52: db $00, $FB, $0A

;---------------------------------------------------------------------------------------------------

.group18_a
#_08FD55: db $00, $FB, $0B

.group18_b
#_08FD58: db $02, $FD, $0C

;---------------------------------------------------------------------------------------------------

.group19_a
#_08FD5B: db $01, $FD, $0D

.group19_b
#_08FD5E: db $00, $FD, $8D

;---------------------------------------------------------------------------------------------------

.group1A_a
#_08FD61: db $01, $FD, $8C

.group1A_b
#_08FD64: db $01, $FD, $8B

;---------------------------------------------------------------------------------------------------

.group1B_a
#_08FD67: db $01, $FD, $8A, $FA, $0C, $89

.group1B_b
#_08FD6D: db $FA, $0C, $89, $F6, $1C, $C9

;---------------------------------------------------------------------------------------------------

.group1C_a
#_08FD73: db $F6, $1C, $49, $F8, $2C, $89

.group1C_b
#_08FD79: db $F8, $2C, $89, $F6, $38, $02

;---------------------------------------------------------------------------------------------------

.group1D_a
#_08FD7F: db $F6, $38, $02, $E9, $46, $48, $05, $46
#_08FD87: db $08

.group1D_b
#_08FD88: db $E9, $46, $48, $05, $46, $08, $DA, $55
#_08FD90: db $48, $13, $55, $08

;---------------------------------------------------------------------------------------------------

.group1E_a
#_08FD94: db $DA, $55, $48, $13, $55, $08, $CC, $63
#_08FD9C: db $48, $21, $65, $08

.group1E_b
#_08FDA0: db $CC, $63, $48, $21, $65, $08, $BE, $71
#_08FDA8: db $48, $2F, $73, $08

;---------------------------------------------------------------------------------------------------

.group1F_a
#_08FDAC: db $BE, $71, $48, $2F, $73, $08

.group1F_b
.group20_a
#_08FDB2: db $A0, $70, $20

.group20_b
#_08FDB5: db $A0, $70, $21

;---------------------------------------------------------------------------------------------------

.group21_a
#_08FDB8: db $A0, $70, $66

.group21_b
#_08FDBB: db $A0, $70, $22

;---------------------------------------------------------------------------------------------------

.group22_a
#_08FDBE: db $A0, $70, $23

.group22_b
#_08FDC1: db $A0, $70, $63

;---------------------------------------------------------------------------------------------------

.group23_a
#_08FDC4: db $A0, $70, $62

.group23_b
#_08FDC7: db $A0, $70, $26

;---------------------------------------------------------------------------------------------------

.group24_a
#_08FDCA: db $A0, $70, $27, $AA, $7C, $28

.group24_b
#_08FDD0: db $AA, $7C, $28, $B8, $8B, $28

;---------------------------------------------------------------------------------------------------

.group25_a
#_08FDD6: db $B8, $8B, $28, $C5, $9A, $A1

.group25_b
#_08FDDC: db $C5, $9A, $A1, $D4, $8C, $68

;---------------------------------------------------------------------------------------------------

.group26_a
#_08FDE2: db $D4, $8C, $68, $E3, $7E, $68

.group26_b
#_08FDE8: db $E3, $7E, $68

;---------------------------------------------------------------------------------------------------

.group27_a
#_08FDEB: db $ED, $7D, $C5

.group27_b
#_08FDEE: db $90, $60, $2A

;---------------------------------------------------------------------------------------------------

.group28_a
#_08FDF1: db $90, $60, $2B

.group28_b
#_08FDF4: db $90, $60, $2C

;---------------------------------------------------------------------------------------------------

.group29_a
#_08FDF7: db $90, $60, $2D

.group29_b
#_08FDFA: db $89, $52, $29, $90, $60, $2A

;---------------------------------------------------------------------------------------------------

.group2A_a
#_08FE00: db $85, $42, $E9, $89, $52, $29

.group2A_b
#_08FE06: db $87, $32, $29, $85, $42, $E9

;---------------------------------------------------------------------------------------------------

.group2B_a
#_08FE0C: db $7E, $22, $28, $8D, $22, $68, $87, $32
#_08FE14: db $29

.group2B_b
#_08FE15: db $96, $12, $A9, $6F, $13, $28, $7E, $22
#_08FE1D: db $28, $8D, $22, $68

;---------------------------------------------------------------------------------------------------

.group2C_a
#_08FE21: db $9C, $02, $68, $66, $04, $E9, $96, $12
#_08FE29: db $A9, $6F, $13, $28

.group2C_b
#_08FE2D: db $A5, $F2, $A9, $5F, $F5, $28, $9C, $02
#_08FE35: db $68, $66, $04, $E9

;---------------------------------------------------------------------------------------------------

.group2D_a
#_08FE39: db $60, $70, $60

.group2D_b
#_08FE3C: db $60, $70, $61

;---------------------------------------------------------------------------------------------------

.group2E_a
#_08FE3F: db $60, $70, $26

.group2E_b
#_08FE42: db $60, $70, $62

;---------------------------------------------------------------------------------------------------

.group2F_a
#_08FE45: db $60, $70, $63

.group2F_b
#_08FE48: db $60, $70, $23

;---------------------------------------------------------------------------------------------------

.group30_a
#_08FE4B: db $60, $70, $22

.group30_b
#_08FE4E: db $60, $70, $66

;---------------------------------------------------------------------------------------------------

.group31_a
#_08FE51: db $55, $6F, $E8, $60, $70, $67

.group31_b
#_08FE57: db $46, $68, $24, $55, $6F, $E8

;---------------------------------------------------------------------------------------------------

.group32_a
#_08FE5D: db $46, $68, $24, $36, $6C, $E4

.group32_b
#_08FE63: db $28, $64, $28, $26, $6B, $24, $36, $6C
#_08FE6B: db $E4

;---------------------------------------------------------------------------------------------------

.group33_a
#_08FE6C: db $19, $55, $28, $28, $64, $28, $26, $6B
#_08FE74: db $24, $16, $6E, $E4

.group33_b
#_08FE78: db $0B, $46, $28, $19, $55, $28, $07, $6C
#_08FE80: db $24, $16, $6E, $E4

;---------------------------------------------------------------------------------------------------

.group34_a
#_08FE84: db $0B, $46, $28, $07, $6C, $24

.group34_b
#_08FE8A: db $70, $70, $2A

;---------------------------------------------------------------------------------------------------

.group35_a
#_08FE8D: db $70, $70, $2B

.group35_b
#_08FE90: db $70, $70, $2C

;---------------------------------------------------------------------------------------------------

.group36_a
#_08FE93: db $70, $70, $2D

.group36_b
#_08FE96: db $70, $70, $2A, $6C, $7D, $29

;---------------------------------------------------------------------------------------------------

.group37_a
#_08FE9C: db $6C, $7D, $29, $72, $8C, $28

.group37_b
#_08FEA2: db $72, $8C, $28, $7C, $9C, $29

;---------------------------------------------------------------------------------------------------

.group38_a
#_08FEA8: db $7C, $9C, $29, $7B, $AC, $E9

.group38_b
#_08FEAE: db $7B, $AC, $E9, $75, $B6, $E4, $84, $BB
#_08FEB6: db $28

;---------------------------------------------------------------------------------------------------

.group39_a
#_08FEB7: db $75, $B6, $E4, $84, $BB, $28, $67, $BD
#_08FEBF: db $68, $92, $CA, $28

.group39_b
#_08FEC3: db $67, $BD, $68, $92, $CA, $28, $5F, $CC
#_08FECB: db $69, $9A, $D9, $29

;---------------------------------------------------------------------------------------------------

.group3A_a
#_08FECF: db $5F, $CC, $69, $9A, $D9, $29, $60, $DC
#_08FED7: db $E9, $9A, $E8, $E9

.group3A_b
#_08FEDB: db $60, $DC, $E9, $9A, $E8, $E9

;---------------------------------------------------------------------------------------------------

.group3B_a
#_08FEE1: db $85, $F2, $29, $8D, $F2, $2E, $31, $F4
#_08FEE9: db $28

.group3B_b

;===================================================================================================

QuakeSpell_InitialBoltPointers:
#_08FEEA: dw QuakeDrawGFX_group00_a, QuakeDrawGFX_group00_b
#_08FEEE: dw QuakeDrawGFX_group01_a, QuakeDrawGFX_group01_b
#_08FEF2: dw QuakeDrawGFX_group02_a, QuakeDrawGFX_group02_b
#_08FEF6: dw QuakeDrawGFX_group03_a, QuakeDrawGFX_group03_b
#_08FEFA: dw QuakeDrawGFX_group04_a, QuakeDrawGFX_group04_b
#_08FEFE: dw QuakeDrawGFX_group05_a, QuakeDrawGFX_group05_b
#_08FF02: dw QuakeDrawGFX_group06_a, QuakeDrawGFX_group06_b
#_08FF06: dw QuakeDrawGFX_group07_a, QuakeDrawGFX_group07_b
#_08FF0A: dw QuakeDrawGFX_group08_a, QuakeDrawGFX_group08_b
#_08FF0E: dw QuakeDrawGFX_group09_a, QuakeDrawGFX_group09_b
#_08FF12: dw QuakeDrawGFX_group0A_a, QuakeDrawGFX_group0A_b
#_08FF16: dw QuakeDrawGFX_group0B_a, QuakeDrawGFX_group0B_b
#_08FF1A: dw QuakeDrawGFX_group0C_a, QuakeDrawGFX_group0C_b
#_08FF1E: dw QuakeDrawGFX_group0D_a, QuakeDrawGFX_group0D_b
#_08FF22: dw QuakeDrawGFX_group0E_a, QuakeDrawGFX_group0E_b
#_08FF26: dw QuakeDrawGFX_group0F_a, QuakeDrawGFX_group0F_b
#_08FF2A: dw QuakeDrawGFX_group10_a, QuakeDrawGFX_group10_b
#_08FF2E: dw QuakeDrawGFX_group11_a, QuakeDrawGFX_group11_b
#_08FF32: dw QuakeDrawGFX_group12_a, QuakeDrawGFX_group12_b
#_08FF36: dw QuakeDrawGFX_group13_a, QuakeDrawGFX_group13_b
#_08FF3A: dw QuakeDrawGFX_group14_a, QuakeDrawGFX_group14_b
#_08FF3E: dw QuakeDrawGFX_group15_a, QuakeDrawGFX_group15_b
#_08FF42: dw QuakeDrawGFX_group16_a, QuakeDrawGFX_group16_b
#_08FF46: dw QuakeDrawGFX_group17_a, QuakeDrawGFX_group17_b
#_08FF4A: dw QuakeDrawGFX_group18_a, QuakeDrawGFX_group18_b
#_08FF4E: dw QuakeDrawGFX_group19_a, QuakeDrawGFX_group19_b
#_08FF52: dw QuakeDrawGFX_group1A_a, QuakeDrawGFX_group1A_b
#_08FF56: dw QuakeDrawGFX_group1B_a, QuakeDrawGFX_group1B_b
#_08FF5A: dw QuakeDrawGFX_group1C_a, QuakeDrawGFX_group1C_b
#_08FF5E: dw QuakeDrawGFX_group1D_a, QuakeDrawGFX_group1D_b
#_08FF62: dw QuakeDrawGFX_group1E_a, QuakeDrawGFX_group1E_b
#_08FF66: dw QuakeDrawGFX_group1F_a, QuakeDrawGFX_group1F_b

;---------------------------------------------------------------------------------------------------

QuakeSpell_SpreadBoltPointers:
#_08FF6A: dw QuakeDrawGFX_group20_a, QuakeDrawGFX_group20_b
#_08FF6E: dw QuakeDrawGFX_group21_a, QuakeDrawGFX_group21_b
#_08FF72: dw QuakeDrawGFX_group22_a, QuakeDrawGFX_group22_b
#_08FF76: dw QuakeDrawGFX_group23_a, QuakeDrawGFX_group23_b
#_08FF7A: dw QuakeDrawGFX_group24_a, QuakeDrawGFX_group24_b
#_08FF7E: dw QuakeDrawGFX_group25_a, QuakeDrawGFX_group25_b
#_08FF82: dw QuakeDrawGFX_group26_a, QuakeDrawGFX_group26_b
#_08FF86: dw QuakeDrawGFX_group27_a, QuakeDrawGFX_group27_b
#_08FF8A: dw QuakeDrawGFX_group28_a, QuakeDrawGFX_group28_b
#_08FF8E: dw QuakeDrawGFX_group29_a, QuakeDrawGFX_group29_b
#_08FF92: dw QuakeDrawGFX_group2A_a, QuakeDrawGFX_group2A_b
#_08FF96: dw QuakeDrawGFX_group2B_a, QuakeDrawGFX_group2B_b
#_08FF9A: dw QuakeDrawGFX_group2C_a, QuakeDrawGFX_group2C_b
#_08FF9E: dw QuakeDrawGFX_group2D_a, QuakeDrawGFX_group2D_b
#_08FFA2: dw QuakeDrawGFX_group2E_a, QuakeDrawGFX_group2E_b
#_08FFA6: dw QuakeDrawGFX_group2F_a, QuakeDrawGFX_group2F_b
#_08FFAA: dw QuakeDrawGFX_group30_a, QuakeDrawGFX_group30_b
#_08FFAE: dw QuakeDrawGFX_group31_a, QuakeDrawGFX_group31_b
#_08FFB2: dw QuakeDrawGFX_group32_a, QuakeDrawGFX_group32_b
#_08FFB6: dw QuakeDrawGFX_group33_a, QuakeDrawGFX_group33_b
#_08FFBA: dw QuakeDrawGFX_group34_a, QuakeDrawGFX_group34_b
#_08FFBE: dw QuakeDrawGFX_group35_a, QuakeDrawGFX_group35_b
#_08FFC2: dw QuakeDrawGFX_group36_a, QuakeDrawGFX_group36_b
#_08FFC6: dw QuakeDrawGFX_group37_a, QuakeDrawGFX_group37_b
#_08FFCA: dw QuakeDrawGFX_group38_a, QuakeDrawGFX_group38_b
#_08FFCE: dw QuakeDrawGFX_group39_a, QuakeDrawGFX_group39_b
#_08FFD2: dw QuakeDrawGFX_group3A_a, QuakeDrawGFX_group3A_b
#_08FFD6: dw QuakeDrawGFX_group3B_a, QuakeDrawGFX_group3B_b

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_08FFDA:
#_08FFDA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_08FFE2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_08FFEA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_08FFF2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_08FFFA: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
