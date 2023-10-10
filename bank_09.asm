org $098000

;===================================================================================================

pool Ancilla_AddHitStars

.offset
#_098000: dw  21, -11
#_098004: dw  21,  11
#_098008: dw   3,  -6
#_09800C: dw  21,   5
#_098010: dw  16, -14
#_098014: dw  16,  14

.unknown_offsets
#_098018: dw  -3,  19
#_09801C: dw   2,  13
#_098020: dw  -6,  22

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_AddHitStars:
#_098024: PHB
#_098025: PHK
#_098026: PLB

#_098027: JSR Ancilla_AddAncilla
#_09802A: BCS .spawn_failed

#_09802C: STZ.w $0C5E,X

#_09802F: LDA.b #$02
#_098031: STA.w $03B1,X

#_098034: LDA.b #$01
#_098036: STA.w $039F,X

#_098039: STZ.w $0C22,X
#_09803C: STZ.w $0C2C,X

#_09803F: LDA.w $0301
#_098042: BEQ .nothing_in_hand

#_098044: LDA.b $2F
#_098046: LSR A

#_098047: CLC
#_098048: ADC.b #$02
#_09804A: TAY

#_09804B: BRA .continue

.nothing_in_hand
#_09804D: LDA.w $037A
#_098050: BEQ .continue

#_098052: LDY.b #$00

#_098054: LDA.b $2F
#_098056: CMP.b #$04
#_098058: BEQ .continue

#_09805A: LDY.b #$01

;---------------------------------------------------------------------------------------------------

.continue
#_09805C: TYA
#_09805D: STA.w $0C54,X

#_098060: ASL A
#_098061: ASL A
#_098062: TAY

#_098063: REP #$20

#_098065: LDA.w .offset,Y
#_098068: CLC
#_098069: ADC.b $20
#_09806B: STA.b $00

#_09806D: LDA.w .offset+2,Y
#_098070: CLC
#_098071: ADC.b $22
#_098073: STA.b $02

#_098075: TYA
#_098076: LSR A
#_098077: TAY

#_098078: LDA.b $22
#_09807A: CLC
#_09807B: ADC.w .unknown_offsets,Y
#_09807E: STA.b $04

#_098080: SEP #$20

#_098082: LDA.b $04
#_098084: STA.w $038A,X

#_098087: LDA.b $05
#_098089: STA.w $038F,X

#_09808C: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.spawn_failed
#_09808F: PLB

#_098090: RTL

;===================================================================================================

AncillaAdd_Blanket:
#_098091: PHB
#_098092: PHK
#_098093: PLB

#_098094: LDX.b #$00

#_098096: STA.w $0C4A,X

#_098099: PHX

#_09809A: TAX

#_09809B: LDA.l AncillaObjectAllocation,X
#_09809F: STA.b $0E

#_0980A1: PLX

#_0980A2: LDA.b $0E
#_0980A4: STA.w $0C90,X

#_0980A7: LDA.b $EE
#_0980A9: STA.w $0C7C,X

#_0980AC: LDA.w $0476
#_0980AF: STA.w $03CA,X

#_0980B2: STZ.w $0280,X

#_0980B5: REP #$20

#_0980B7: LDA.w #$2162
#_0980BA: STA.b $00

#_0980BC: LDA.w #$0938
#_0980BF: STA.b $02

#_0980C1: SEP #$20

;===================================================================================================

AncillaInit_SetCoordsAndExit:
#_0980C3: JSR Ancilla_SetCoordinates

#_0980C6: PLB

#_0980C7: RTL

;===================================================================================================

AncillaAdd_Snoring:
#_0980C8: PHB
#_0980C9: PHK
#_0980CA: PLB

#_0980CB: JSR Ancilla_AddAncilla
#_0980CE: BCS EXIT_0980FD

;---------------------------------------------------------------------------------------------------

#_0980D0: STZ.w $0C5E,X

#_0980D3: LDA.b #$F8
#_0980D5: STA.w $0C22,X

#_0980D8: LDA.b #$07
#_0980DA: STA.w $03B1,X

#_0980DD: INC A
#_0980DE: STA.w $0C2C,X

#_0980E1: LDA.b #$FF
#_0980E3: STA.w $0C54,X

#_0980E6: REP #$20

#_0980E8: LDA.b $20
#_0980EA: CLC
#_0980EB: ADC.w #$0004
#_0980EE: STA.b $00

#_0980F0: LDA.b $22
#_0980F2: CLC
#_0980F3: ADC.w #$0010
#_0980F6: STA.b $02

#_0980F8: SEP #$20

#_0980FA: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_0980FD:
#_0980FD: PLB

#_0980FE: RTL

;===================================================================================================

pool AncillaAdd_Bomb

.offset_y_close
#_0980FF: dw   4 ; up
#_098101: dw  28 ; down
#_098103: dw  12 ; left
#_098105: dw  12 ; right

.offset_x_close
#_098107: dw   8 ; up
#_098109: dw   8 ; down
#_09810B: dw  -6 ; left
#_09810D: dw  22 ; right

;---------------------------------------------------------------------------------------------------

.offset_y
#_09810F: dw   0 ; up
#_098111: dw  24 ; down
#_098113: dw  12 ; left
#_098115: dw  12 ; right

.offset_x
#_098117: dw   8 ; up
#_098119: dw   8 ; down
#_09811B: dw   0 ; left
#_09811D: dw  16 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_Bomb:
#_09811F: PHB
#_098120: PHK
#_098121: PLB

#_098122: JSR Ancilla_AddAncilla
#_098125: BCS EXIT_0980FD

#_098127: LDA.l $7EF343
#_09812B: BNE .we_have_bombs

#_09812D: STZ.w $0C4A,X

#_098130: BRA .exit

;---------------------------------------------------------------------------------------------------

.we_have_bombs
#_098132: DEC A
#_098133: STA.l $7EF343
#_098137: BNE .we_have_more_bombs_too

#_098139: PHX

#_09813A: JSL RefreshIcon_long

#_09813E: PLX

.we_have_more_bombs_too
#_09813F: STZ.w $03EA,X

#_098142: STZ.w $0C54,X
#_098145: STZ.w $0C5E,X

#_098148: STZ.w $03C2,X

#_09814B: STZ.w $0385,X

#_09814E: LDA.l Bomb_timer
#_098152: STA.w $039F,X

#_098155: LDA.b #$07
#_098157: STA.w $03C0,X

#_09815A: STZ.w $029E,X

#_09815D: LDA.b #$08
#_09815F: STA.w $0C68,X

#_098162: LDA.b $2F
#_098164: LSR A
#_098165: STA.w $0C72,X

#_098168: STZ.w $03D5,X
#_09816B: STZ.w $03D2,X
#_09816E: STZ.w $03E1,X

#_098171: JSL Ancilla_CheckInitialTileCollision_Class2
#_098175: BCC .use_closer_offsets

;---------------------------------------------------------------------------------------------------

#_098177: LDY.b $2F

#_098179: REP #$20

#_09817B: LDA.b $20
#_09817D: CLC
#_09817E: ADC.w .offset_y,Y
#_098181: STA.b $00

#_098183: LDA.b $22
#_098185: CLC
#_098186: ADC.w .offset_x,Y
#_098189: STA.b $02

#_09818B: SEP #$20

#_09818D: BRA .finish_up

;---------------------------------------------------------------------------------------------------

.use_closer_offsets
#_09818F: LDY.b $2F

#_098191: REP #$20

#_098193: LDA.b $20
#_098195: CLC
#_098196: ADC.w .offset_y_close,Y
#_098199: STA.b $00

#_09819B: LDA.b $22
#_09819D: CLC
#_09819E: ADC.w .offset_x_close,Y
#_0981A1: STA.b $02

#_0981A3: SEP #$20

;---------------------------------------------------------------------------------------------------

.finish_up
#_0981A5: JSL Link_CalculateSFXPan
#_0981A9: ORA.b #$0B ; SFX2.0B
#_0981AB: STA.w $012E

#_0981AE: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_0981B1: PLB

#_0981B2: RTL

;===================================================================================================

pool AncillaAdd_Boomerang

.speed
#_0981B3: db $20, $18 ; blue
#_0981B5: db $30, $28 ; red

.distance
#_0981B7: db $20 ; blue
#_0981B8: db $60 ; red

.rotation_speed
#_0981B9: db $03 ; blue
#_0981BA: db $02 ; red

;---------------------------------------------------------------------------------------------------

.direction_component
#_0981BB: db $08 ; up
#_0981BC: db $04 ; down
#_0981BD: db $02 ; left
#_0981BE: db $01 ; right

;---------------------------------------------------------------------------------------------------

.valid_throw_dpad
#_0981BF: db $08 ; up
#_0981C0: db $04 ; down
#_0981C1: db $02 ; left
#_0981C2: db $01 ; right
#_0981C3: db $09 ; up-right
#_0981C4: db $05 ; down-right
#_0981C5: db $0A ; up-left
#_0981C6: db $06 ; down-left

.initial_rotation
#_0981C7: db $02 ; up
#_0981C8: db $03 ; down
#_0981C9: db $03 ; left
#_0981CA: db $02 ; right
#_0981CB: db $02 ; up-right
#_0981CC: db $03 ; down-right
#_0981CD: db $03 ; up-left
#_0981CE: db $03 ; down-left

;---------------------------------------------------------------------------------------------------

.offset_y_standard
#_0981CF: dw -10 ; up
#_0981D1: dw  -8 ; down
#_0981D3: dw  -9 ; left
#_0981D5: dw  -9 ; right
#_0981D7: dw -10 ; up-right
#_0981D9: dw  -8 ; down-right
#_0981DB: dw  -9 ; up-left
#_0981DD: dw  -9 ; down-left

.offset_x_standard
#_0981DF: dw -10 ; up
#_0981E1: dw  11 ; down
#_0981E3: dw   8 ; left
#_0981E5: dw  -8 ; right
#_0981E7: dw -10 ; up-right
#_0981E9: dw  11 ; down-right
#_0981EB: dw   8 ; up-left
#_0981ED: dw  -8 ; down-left

;---------------------------------------------------------------------------------------------------

.offset_y_sword
#_0981EF: dw -16 ; up
#_0981F1: dw   6 ; down
#_0981F3: dw   0 ; left
#_0981F5: dw   0 ; right
#_0981F7: dw  -8 ; up-right
#_0981F9: dw   8 ; down-right
#_0981FB: dw  -8 ; up-left
#_0981FD: dw   8 ; down-left

.offset_x_sword
#_0981FF: dw   0 ; up
#_098201: dw   0 ; down
#_098203: dw  -8 ; left
#_098205: dw   8 ; right
#_098207: dw   8 ; up-right
#_098209: dw   8 ; down-right
#_09820B: dw  -8 ; up-left
#_09820D: dw  -8 ; down-left

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_Boomerang:
#_09820F: PHB
#_098210: PHK
#_098211: PLB

#_098212: JSR Ancilla_AddAncilla
#_098215: BCC .open_slot

#_098217: BRL .exit

;---------------------------------------------------------------------------------------------------

.open_slot
#_09821A: STZ.w $03B1,X

#_09821D: STZ.w $0C5E,X
#_098220: STZ.w $0380,X

#_098223: STZ.w $029E,X
#_098226: STA.w $0385,X

#_098229: LDA.b #$01
#_09822B: STA.w $035F

#_09822E: LDA.l $7EF341
#_098232: DEC A
#_098233: STA.w $0394,X

#_098236: TAY

#_098237: LDA.w .distance,Y
#_09823A: STA.w $0C54,X

#_09823D: LDA.w .rotation_speed,Y
#_098240: STA.w $039F,X

;---------------------------------------------------------------------------------------------------

#_098243: LDY.b #$00

#_098245: LDA.b $F0
#_098247: AND.b #$0C
#_098249: BEQ .not_diagonal

#_09824B: LDA.b $F0
#_09824D: AND.b #$03
#_09824F: BEQ .not_diagonal

#_098251: INY

.not_diagonal
#_098252: STY.b $00

#_098254: LDA.w $0394,X
#_098257: ASL A
#_098258: CLC
#_098259: ADC.b $00
#_09825B: TAY

#_09825C: LDA.w .speed,Y
#_09825F: STA.b $00
#_098261: STA.w $03C5,X

#_098264: STY.b $72

;---------------------------------------------------------------------------------------------------

#_098266: LDA.b $F0
#_098268: AND.b #$0F
#_09826A: BNE .not_directional

#_09826C: LDA.b $2F
#_09826E: LSR A
#_09826F: TAY

#_098270: LDA.w .direction_component,Y

;---------------------------------------------------------------------------------------------------

.not_directional
#_098273: STA.b $01

#_098275: STZ.w $039D

#_098278: LDY.b $00

#_09827A: LDA.b $01
#_09827C: AND.b #$0C
#_09827E: BEQ .nonvertical

#_098280: AND.b #$08
#_098282: BEQ .down_throw

;---------------------------------------------------------------------------------------------------

.up_throw
#_098284: TYA
#_098285: EOR.b #$FF
#_098287: INC A
#_098288: TAY

;---------------------------------------------------------------------------------------------------

.down_throw
#_098289: TYA
#_09828A: STA.w $0C22,X

#_09828D: LDY.b #$00

#_09828F: LDA.w $0C22,X
#_098292: BMI .was_up_throw

#_098294: INY

.was_up_throw
#_098295: TYA
#_098296: STA.w $0C72,X

#_098299: LDA.w .direction_component,Y
#_09829C: STA.w $039D

;---------------------------------------------------------------------------------------------------

.nonvertical
#_09829F: STZ.w $03A9,X

#_0982A2: LDY.b $00

#_0982A4: LDA.b $01
#_0982A6: AND.b #$03
#_0982A8: BEQ .nonhorizontal

#_0982AA: AND.b #$02
#_0982AC: BEQ .right_throw

;---------------------------------------------------------------------------------------------------

.left_throw
#_0982AE: TYA
#_0982AF: EOR.b #$FF
#_0982B1: INC A
#_0982B2: TAY

#_0982B3: BRA .continue_horizontal

;---------------------------------------------------------------------------------------------------

.right_throw
#_0982B5: INC.w $03A9,X

.continue_horizontal
#_0982B8: TYA
#_0982B9: STA.w $0C2C,X

#_0982BC: LDY.b #$02

#_0982BE: LDA.w $0C2C,X
#_0982C1: BMI .was_left_throw

#_0982C3: LDY.b #$03

.was_left_throw
#_0982C5: TYA
#_0982C6: STA.w $0C72,X

#_0982C9: LDA.w .direction_component,Y
#_0982CC: ORA.w $039D
#_0982CF: STA.w $039D

;---------------------------------------------------------------------------------------------------

.nonhorizontal
#_0982D2: LDY.b #$07

.next_direction_check
#_0982D4: LDA.w .valid_throw_dpad,Y
#_0982D7: CMP.b $01
#_0982D9: BEQ .valid_dpad_press

#_0982DB: DEY
#_0982DC: BPL .next_direction_check


#_0982DE: INY

;---------------------------------------------------------------------------------------------------

.valid_dpad_press
#_0982DF: LDA.w .initial_rotation,Y
#_0982E2: STA.w $03A4,X

#_0982E5: TYA
#_0982E6: ASL A
#_0982E7: TAY

#_0982E8: STA.w $03CF,X

#_0982EB: LDA.b $3C
#_0982ED: CMP.b #$09
#_0982EF: BCC .spin_not_charged

#_0982F1: INC.w $03B1,X

#_0982F4: BRA .check_tile_collision

.spin_not_charged
#_0982F6: LDA.b $72
#_0982F8: BNE .magic_or_diagonal

#_0982FA: LDA.b $F0
#_0982FC: AND.b #$0F
#_0982FE: BNE .check_tile_collision

.magic_or_diagonal
#_098300: LDY.b $2F

;---------------------------------------------------------------------------------------------------

.check_tile_collision
#_098302: JSL Ancilla_CheckInitialTile_A
#_098306: BCS AncillaAdd_BoomerangAsClink

#_098308: LDA.w $03B1,X
#_09830B: BEQ .wasnt_during_spin

#_09830D: REP #$20

#_09830F: LDA.b $20
#_098311: CLC
#_098312: ADC.w #$0008

#_098315: CLC
#_098316: ADC.w .offset_y_sword,Y
#_098319: STA.b $00

#_09831B: LDA.b $22
#_09831D: CLC
#_09831E: ADC.w .offset_x_sword,Y
#_098321: STA.b $02

#_098323: SEP #$20

#_098325: BRL .proceed_to_set_coods

;---------------------------------------------------------------------------------------------------

.wasnt_during_spin
#_098328: REP #$20

#_09832A: LDA.b $20
#_09832C: CLC
#_09832D: ADC.w #$0008

#_098330: CLC
#_098331: ADC.w .offset_y_standard,Y
#_098334: STA.b $00

#_098336: LDA.b $22
#_098338: CLC
#_098339: ADC.w .offset_x_standard,Y
#_09833C: STA.b $02

#_09833E: SEP #$20

;---------------------------------------------------------------------------------------------------

.proceed_to_set_coods
#_098340: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_098343: PLB

#_098344: RTL

;---------------------------------------------------------------------------------------------------

AncillaAdd_BoomerangAsClink:
#_098345: STZ.w $0C4A,X
#_098348: STZ.w $035F

#_09834B: LDA.w $03E4,X
#_09834E: CMP.b #$F0 ; TILETYPE F0
#_098350: BEQ .shut_door

#_098352: JSL Ancilla_CalculateSFXPan
#_098356: ORA.b #$05 ; SFX2.05
#_098358: STA.w $012E

#_09835B: BRA .continue

;---------------------------------------------------------------------------------------------------

.shut_door
#_09835D: JSL Ancilla_CalculateSFXPan
#_098361: ORA.b #$06 ; SFX2.06
#_098363: STA.w $012E

;---------------------------------------------------------------------------------------------------

.continue
#_098366: JSL AncillaAdd_BoomerangWallClink

#_09836A: PLB

#_09836B: RTL

;===================================================================================================

pool AncillaAdd_ItemReceipt

.offset_y
#_09836C: db  -5 ; FIGHTER SWORD
#_09836D: db  -5 ; MASTER SWORD
#_09836E: db  -5 ; TEMPERED SWORD
#_09836F: db  -5 ; BUTTER SWORD
#_098370: db  -5 ; FIGHTER SHIELD
#_098371: db  -4 ; FIRE SHIELD
#_098372: db  -4 ; MIRROR SHIELD
#_098373: db  -5 ; FIRE ROD
#_098374: db  -5 ; ICE ROD
#_098375: db  -4 ; HAMMER
#_098376: db  -4 ; HOOKSHOT
#_098377: db  -4 ; BOW
#_098378: db  -2 ; BOOMERANG
#_098379: db  -4 ; POWDER
#_09837A: db  -4 ; BOTTLE REFILL (BEE)
#_09837B: db  -4 ; BOMBOS
#_09837C: db  -4 ; ETHER
#_09837D: db  -4 ; QUAKE
#_09837E: db  -4 ; LAMP
#_09837F: db  -4 ; SHOVEL
#_098380: db  -4 ; FLUTE
#_098381: db  -4 ; SOMARIA
#_098382: db  -4 ; BOTTLE
#_098383: db  -4 ; HEART PIECE
#_098384: db  -4 ; BYRNA
#_098385: db  -4 ; CAPE
#_098386: db  -4 ; MIRROR
#_098387: db  -4 ; GLOVE
#_098388: db  -4 ; MITTS
#_098389: db  -4 ; BOOK
#_09838A: db  -4 ; FLIPPERS
#_09838B: db  -4 ; PEARL
#_09838C: db  -4 ; CRYSTAL
#_09838D: db  -4 ; NET
#_09838E: db  -4 ; BLUE MAIL
#_09838F: db  -5 ; RED MAIL
#_098390: db  -4 ; SMALL KEY
#_098391: db  -4 ; COMPASS
#_098392: db  -4 ; HEART CONTAINER FROM 4/4
#_098393: db  -4 ; BOMB
#_098394: db  -4 ; 3 BOMBS
#_098395: db  -4 ; MUSHROOM
#_098396: db  -2 ; RED BOOMERANG
#_098397: db  -4 ; FULL BOTTLE (RED)
#_098398: db  -4 ; FULL BOTTLE (GREEN)
#_098399: db  -4 ; FULL BOTTLE (BLUE)
#_09839A: db  -4 ; POTION REFILL (RED)
#_09839B: db  -4 ; POTION REFILL (GREEN)
#_09839C: db  -4 ; POTION REFILL (BLUE)
#_09839D: db  -4 ; 10 BOMBS
#_09839E: db  -4 ; BIG KEY
#_09839F: db  -4 ; MAP
#_0983A0: db  -2 ; 1 RUPEE
#_0983A1: db  -2 ; 5 RUPEES
#_0983A2: db  -2 ; 20 RUPEES
#_0983A3: db  -4 ; GREEN PENDANT
#_0983A4: db  -4 ; BLUE PENDANT
#_0983A5: db  -4 ; RED PENDANT
#_0983A6: db  -4 ; TOSSED BOW
#_0983A7: db  -4 ; SILVERS
#_0983A8: db  -4 ; FULL BOTTLE (BEE)
#_0983A9: db  -4 ; FULL BOTTLE (FAIRY)
#_0983AA: db  -4 ; BOSS HC
#_0983AB: db  -4 ; SANC HC
#_0983AC: db  -4 ; 100 RUPEES
#_0983AD: db  -4 ; 50 RUPEES
#_0983AE: db  -2 ; HEART
#_0983AF: db  -2 ; ARROW
#_0983B0: db  -4 ; 10 ARROWS
#_0983B1: db  -2 ; SMALL MAGIC
#_0983B2: db  -4 ; 300 RUPEES
#_0983B3: db  -4 ; 20 RUPEES GREEN
#_0983B4: db  -4 ; FULL BOTTLE (GOOD BEE)
#_0983B5: db  -5 ; TOSSED FIGHTER SWORD
#_0983B6: db  -4 ; FLUTE (ACTIVATED)
#_0983B7: db  -4 ; BOOTS

;---------------------------------------------------------------------------------------------------

.offset_x
#_0983B8: db   4 ; FIGHTER SWORD
#_0983B9: db   4 ; MASTER SWORD
#_0983BA: db   4 ; TEMPERED SWORD
#_0983BB: db   4 ; BUTTER SWORD
#_0983BC: db   4 ; FIGHTER SHIELD
#_0983BD: db   0 ; FIRE SHIELD
#_0983BE: db   0 ; MIRROR SHIELD
#_0983BF: db   4 ; FIRE ROD
#_0983C0: db   4 ; ICE ROD
#_0983C1: db   4 ; HAMMER
#_0983C2: db   4 ; HOOKSHOT
#_0983C3: db   4 ; BOW
#_0983C4: db   5 ; BOOMERANG
#_0983C5: db   0 ; POWDER
#_0983C6: db   0 ; BOTTLE REFILL (BEE)
#_0983C7: db   0 ; BOMBOS
#_0983C8: db   0 ; ETHER
#_0983C9: db   0 ; QUAKE
#_0983CA: db   0 ; LAMP
#_0983CB: db   4 ; SHOVEL
#_0983CC: db   0 ; FLUTE
#_0983CD: db   4 ; SOMARIA
#_0983CE: db   0 ; BOTTLE
#_0983CF: db   0 ; HEART PIECE
#_0983D0: db   4 ; BYRNA
#_0983D1: db   0 ; CAPE
#_0983D2: db   0 ; MIRROR
#_0983D3: db   0 ; GLOVE
#_0983D4: db   0 ; MITTS
#_0983D5: db   0 ; BOOK
#_0983D6: db   0 ; FLIPPERS
#_0983D7: db   0 ; PEARL
#_0983D8: db   0 ; CRYSTAL
#_0983D9: db   0 ; NET
#_0983DA: db   0 ; BLUE MAIL
#_0983DB: db   0 ; RED MAIL
#_0983DC: db   4 ; SMALL KEY
#_0983DD: db   0 ; COMPASS
#_0983DE: db   0 ; HEART CONTAINER FROM 4/4
#_0983DF: db   0 ; BOMB
#_0983E0: db   0 ; 3 BOMBS
#_0983E1: db   0 ; MUSHROOM
#_0983E2: db   5 ; RED BOOMERANG
#_0983E3: db   0 ; FULL BOTTLE (RED)
#_0983E4: db   0 ; FULL BOTTLE (GREEN)
#_0983E5: db   0 ; FULL BOTTLE (BLUE)
#_0983E6: db   0 ; POTION REFILL (RED)
#_0983E7: db   0 ; POTION REFILL (GREEN)
#_0983E8: db   0 ; POTION REFILL (BLUE)
#_0983E9: db   0 ; 10 BOMBS
#_0983EA: db   0 ; BIG KEY
#_0983EB: db   0 ; MAP
#_0983EC: db   4 ; 1 RUPEE
#_0983ED: db   4 ; 5 RUPEES
#_0983EE: db   4 ; 20 RUPEES
#_0983EF: db   0 ; GREEN PENDANT
#_0983F0: db   0 ; BLUE PENDANT
#_0983F1: db   0 ; RED PENDANT
#_0983F2: db   0 ; TOSSED BOW
#_0983F3: db   0 ; SILVERS
#_0983F4: db   0 ; FULL BOTTLE (BEE)
#_0983F5: db   0 ; FULL BOTTLE (FAIRY)
#_0983F6: db   0 ; BOSS HC
#_0983F7: db   0 ; SANC HC
#_0983F8: db   0 ; 100 RUPEES
#_0983F9: db   0 ; 50 RUPEES
#_0983FA: db   4 ; HEART
#_0983FB: db   4 ; ARROW
#_0983FC: db   0 ; 10 ARROWS
#_0983FD: db   4 ; SMALL MAGIC
#_0983FE: db   0 ; 300 RUPEES
#_0983FF: db   0 ; 20 RUPEES GREEN
#_098400: db   0 ; FULL BOTTLE (GOOD BEE)
#_098401: db   4 ; TOSSED FIGHTER SWORD
#_098402: db   0 ; FLUTE (ACTIVATED)
#_098403: db   0 ; BOOTS

;---------------------------------------------------------------------------------------------------

.item_gfx_index
#_098404: db $06 ; FIGHTER SWORD
#_098405: db $18 ; MASTER SWORD
#_098406: db $18 ; TEMPERED SWORD
#_098407: db $18 ; BUTTER SWORD
#_098408: db $2D ; FIGHTER SHIELD
#_098409: db $20 ; FIRE SHIELD
#_09840A: db $2E ; MIRROR SHIELD
#_09840B: db $09 ; FIRE ROD
#_09840C: db $09 ; ICE ROD
#_09840D: db $0A ; HAMMER
#_09840E: db $08 ; HOOKSHOT
#_09840F: db $05 ; BOW
#_098410: db $10 ; BOOMERANG
#_098411: db $0B ; POWDER
#_098412: db $2C ; BOTTLE REFILL (BEE)
#_098413: db $1B ; BOMBOS
#_098414: db $1A ; ETHER
#_098415: db $1C ; QUAKE
#_098416: db $14 ; LAMP
#_098417: db $19 ; SHOVEL
#_098418: db $0C ; FLUTE
#_098419: db $07 ; SOMARIA
#_09841A: db $1D ; BOTTLE
#_09841B: db $2F ; HEART PIECE
#_09841C: db $07 ; BYRNA
#_09841D: db $15 ; CAPE
#_09841E: db $12 ; MIRROR
#_09841F: db $0D ; GLOVE
#_098420: db $0D ; MITTS
#_098421: db $0E ; BOOK
#_098422: db $11 ; FLIPPERS
#_098423: db $17 ; PEARL
#_098424: db $28 ; CRYSTAL
#_098425: db $27 ; NET
#_098426: db $04 ; BLUE MAIL
#_098427: db $04 ; RED MAIL
#_098428: db $0F ; SMALL KEY
#_098429: db $16 ; COMPASS
#_09842A: db $03 ; HEART CONTAINER FROM 4/4
#_09842B: db $13 ; BOMB
#_09842C: db $01 ; 3 BOMBS
#_09842D: db $1E ; MUSHROOM
#_09842E: db $10 ; RED BOOMERANG
#_09842F: db $00 ; FULL BOTTLE (RED)
#_098430: db $00 ; FULL BOTTLE (GREEN)
#_098431: db $00 ; FULL BOTTLE (BLUE)
#_098432: db $00 ; POTION REFILL (RED)
#_098433: db $00 ; POTION REFILL (GREEN)
#_098434: db $00 ; POTION REFILL (BLUE)
#_098435: db $30 ; 10 BOMBS
#_098436: db $22 ; BIG KEY
#_098437: db $21 ; MAP
#_098438: db $24 ; 1 RUPEE
#_098439: db $24 ; 5 RUPEES
#_09843A: db $24 ; 20 RUPEES
#_09843B: db $23 ; GREEN PENDANT
#_09843C: db $23 ; BLUE PENDANT
#_09843D: db $23 ; RED PENDANT
#_09843E: db $29 ; TOSSED BOW
#_09843F: db $2A ; SILVERS
#_098440: db $2C ; FULL BOTTLE (BEE)
#_098441: db $2B ; FULL BOTTLE (FAIRY)
#_098442: db $03 ; BOSS HC
#_098443: db $03 ; SANC HC
#_098444: db $34 ; 100 RUPEES
#_098445: db $35 ; 50 RUPEES
#_098446: db $31 ; HEART
#_098447: db $33 ; ARROW
#_098448: db $02 ; 10 ARROWS
#_098449: db $32 ; SMALL MAGIC
#_09844A: db $36 ; 300 RUPEES
#_09844B: db $37 ; 20 RUPEES GREEN
#_09844C: db $2C ; FULL BOTTLE (GOOD BEE)
#_09844D: db $06 ; TOSSED FIGHTER SWORD
#_09844E: db $0C ; FLUTE (ACTIVATED)
#_09844F: db $38 ; BOOTS

;---------------------------------------------------------------------------------------------------

.width
#_098450: db $00 ; FIGHTER SWORD
#_098451: db $00 ; MASTER SWORD
#_098452: db $00 ; TEMPERED SWORD
#_098453: db $00 ; BUTTER SWORD
#_098454: db $00 ; FIGHTER SHIELD
#_098455: db $02 ; FIRE SHIELD
#_098456: db $02 ; MIRROR SHIELD
#_098457: db $00 ; FIRE ROD
#_098458: db $00 ; ICE ROD
#_098459: db $00 ; HAMMER
#_09845A: db $00 ; HOOKSHOT
#_09845B: db $00 ; BOW
#_09845C: db $00 ; BOOMERANG
#_09845D: db $02 ; POWDER
#_09845E: db $02 ; BOTTLE REFILL (BEE)
#_09845F: db $02 ; BOMBOS
#_098460: db $02 ; ETHER
#_098461: db $02 ; QUAKE
#_098462: db $02 ; LAMP
#_098463: db $00 ; SHOVEL
#_098464: db $02 ; FLUTE
#_098465: db $00 ; SOMARIA
#_098466: db $02 ; BOTTLE
#_098467: db $02 ; HEART PIECE
#_098468: db $00 ; BYRNA
#_098469: db $02 ; CAPE
#_09846A: db $02 ; MIRROR
#_09846B: db $02 ; GLOVE
#_09846C: db $02 ; MITTS
#_09846D: db $02 ; BOOK
#_09846E: db $02 ; FLIPPERS
#_09846F: db $02 ; PEARL
#_098470: db $02 ; CRYSTAL
#_098471: db $02 ; NET
#_098472: db $02 ; BLUE MAIL
#_098473: db $02 ; RED MAIL
#_098474: db $00 ; SMALL KEY
#_098475: db $02 ; COMPASS
#_098476: db $02 ; HEART CONTAINER FROM 4/4
#_098477: db $02 ; BOMB
#_098478: db $02 ; 3 BOMBS
#_098479: db $02 ; MUSHROOM
#_09847A: db $00 ; RED BOOMERANG
#_09847B: db $02 ; FULL BOTTLE (RED)
#_09847C: db $02 ; FULL BOTTLE (GREEN)
#_09847D: db $02 ; FULL BOTTLE (BLUE)
#_09847E: db $02 ; POTION REFILL (RED)
#_09847F: db $02 ; POTION REFILL (GREEN)
#_098480: db $02 ; POTION REFILL (BLUE)
#_098481: db $02 ; 10 BOMBS
#_098482: db $02 ; BIG KEY
#_098483: db $02 ; MAP
#_098484: db $00 ; 1 RUPEE
#_098485: db $00 ; 5 RUPEES
#_098486: db $00 ; 20 RUPEES
#_098487: db $02 ; GREEN PENDANT
#_098488: db $02 ; BLUE PENDANT
#_098489: db $02 ; RED PENDANT
#_09848A: db $02 ; TOSSED BOW
#_09848B: db $02 ; SILVERS
#_09848C: db $02 ; FULL BOTTLE (BEE)
#_09848D: db $02 ; FULL BOTTLE (FAIRY)
#_09848E: db $02 ; BOSS HC
#_09848F: db $02 ; SANC HC
#_098490: db $02 ; 100 RUPEES
#_098491: db $02 ; 50 RUPEES
#_098492: db $00 ; HEART
#_098493: db $00 ; ARROW
#_098494: db $02 ; 10 ARROWS
#_098495: db $00 ; SMALL MAGIC
#_098496: db $02 ; 300 RUPEES
#_098497: db $02 ; 20 RUPEES GREEN
#_098498: db $02 ; FULL BOTTLE (GOOD BEE)
#_098499: db $00 ; TOSSED FIGHTER SWORD
#_09849A: db $02 ; FLUTE (ACTIVATED)
#_09849B: db $02 ; BOOTS

;---------------------------------------------------------------------------------------------------

.prop
#_09849C: db $05 ; FIGHTER SWORD
#_09849D: db $FF ; MASTER SWORD
#_09849E: db $05 ; TEMPERED SWORD
#_09849F: db $05 ; BUTTER SWORD
#_0984A0: db $05 ; FIGHTER SHIELD
#_0984A1: db $05 ; FIRE SHIELD
#_0984A2: db $05 ; MIRROR SHIELD
#_0984A3: db $01 ; FIRE ROD
#_0984A4: db $02 ; ICE ROD
#_0984A5: db $01 ; HAMMER
#_0984A6: db $01 ; HOOKSHOT
#_0984A7: db $01 ; BOW
#_0984A8: db $02 ; BOOMERANG
#_0984A9: db $02 ; POWDER
#_0984AA: db $02 ; BOTTLE REFILL (BEE)
#_0984AB: db $04 ; BOMBOS
#_0984AC: db $04 ; ETHER
#_0984AD: db $04 ; QUAKE
#_0984AE: db $01 ; LAMP
#_0984AF: db $01 ; SHOVEL
#_0984B0: db $02 ; FLUTE
#_0984B1: db $01 ; SOMARIA
#_0984B2: db $01 ; BOTTLE
#_0984B3: db $01 ; HEART PIECE
#_0984B4: db $02 ; BYRNA
#_0984B5: db $01 ; CAPE
#_0984B6: db $02 ; MIRROR
#_0984B7: db $01 ; GLOVE
#_0984B8: db $04 ; MITTS
#_0984B9: db $04 ; BOOK
#_0984BA: db $02 ; FLIPPERS
#_0984BB: db $01 ; PEARL
#_0984BC: db $06 ; CRYSTAL
#_0984BD: db $01 ; NET
#_0984BE: db $02 ; BLUE MAIL
#_0984BF: db $01 ; RED MAIL
#_0984C0: db $02 ; SMALL KEY
#_0984C1: db $02 ; COMPASS
#_0984C2: db $01 ; HEART CONTAINER FROM 4/4
#_0984C3: db $02 ; BOMB
#_0984C4: db $02 ; 3 BOMBS
#_0984C5: db $04 ; MUSHROOM
#_0984C6: db $01 ; RED BOOMERANG
#_0984C7: db $01 ; FULL BOTTLE (RED)
#_0984C8: db $04 ; FULL BOTTLE (GREEN)
#_0984C9: db $02 ; FULL BOTTLE (BLUE)
#_0984CA: db $01 ; POTION REFILL (RED)
#_0984CB: db $04 ; POTION REFILL (GREEN)
#_0984CC: db $02 ; POTION REFILL (BLUE)
#_0984CD: db $02 ; 10 BOMBS
#_0984CE: db $04 ; BIG KEY
#_0984CF: db $04 ; MAP
#_0984D0: db $04 ; 1 RUPEE
#_0984D1: db $02 ; 5 RUPEES
#_0984D2: db $01 ; 20 RUPEES
#_0984D3: db $04 ; GREEN PENDANT
#_0984D4: db $01 ; BLUE PENDANT
#_0984D5: db $02 ; RED PENDANT
#_0984D6: db $02 ; TOSSED BOW
#_0984D7: db $01 ; SILVERS
#_0984D8: db $02 ; FULL BOTTLE (BEE)
#_0984D9: db $02 ; FULL BOTTLE (FAIRY)
#_0984DA: db $01 ; BOSS HC
#_0984DB: db $01 ; SANC HC
#_0984DC: db $04 ; 100 RUPEES
#_0984DD: db $04 ; 50 RUPEES
#_0984DE: db $01 ; HEART
#_0984DF: db $02 ; ARROW
#_0984E0: db $02 ; 10 ARROWS
#_0984E1: db $04 ; SMALL MAGIC
#_0984E2: db $04 ; 300 RUPEES
#_0984E3: db $04 ; 20 RUPEES GREEN
#_0984E4: db $02 ; FULL BOTTLE (GOOD BEE)
#_0984E5: db $05 ; TOSSED FIGHTER SWORD
#_0984E6: db $02 ; FLUTE (ACTIVATED)
#_0984E7: db $01 ; BOOTS

;---------------------------------------------------------------------------------------------------

.sram_write
#_0984E8: dw $7EF359 ; FIGHTER SWORD
#_0984EA: dw $7EF359 ; MASTER SWORD
#_0984EC: dw $7EF359 ; TEMPERED SWORD
#_0984EE: dw $7EF359 ; BUTTER SWORD
#_0984F0: dw $7EF35A ; FIGHTER SHIELD
#_0984F2: dw $7EF35A ; FIRE SHIELD
#_0984F4: dw $7EF35A ; MIRROR SHIELD
#_0984F6: dw $7EF345 ; FIRE ROD
#_0984F8: dw $7EF346 ; ICE ROD
#_0984FA: dw $7EF34B ; HAMMER
#_0984FC: dw $7EF342 ; HOOKSHOT
#_0984FE: dw $7EF340 ; BOW
#_098500: dw $7EF341 ; BOOMERANG
#_098502: dw $7EF344 ; POWDER
#_098504: dw $7EF35C ; BOTTLE REFILL (BEE)
#_098506: dw $7EF347 ; BOMBOS
#_098508: dw $7EF348 ; ETHER
#_09850A: dw $7EF349 ; QUAKE
#_09850C: dw $7EF34A ; LAMP
#_09850E: dw $7EF34C ; SHOVEL
#_098510: dw $7EF34C ; FLUTE
#_098512: dw $7EF350 ; SOMARIA
#_098514: dw $7EF35C ; BOTTLE
#_098516: dw $7EF36B ; HEART PIECE
#_098518: dw $7EF351 ; BYRNA
#_09851A: dw $7EF352 ; CAPE
#_09851C: dw $7EF353 ; MIRROR
#_09851E: dw $7EF354 ; GLOVE
#_098520: dw $7EF354 ; MITTS
#_098522: dw $7EF34E ; BOOK
#_098524: dw $7EF356 ; FLIPPERS
#_098526: dw $7EF357 ; PEARL
#_098528: dw $7EF37A ; CRYSTAL
#_09852A: dw $7EF34D ; NET
#_09852C: dw $7EF35B ; BLUE MAIL
#_09852E: dw $7EF35B ; RED MAIL
#_098530: dw $7EF36F ; SMALL KEY
#_098532: dw $7EF364 ; COMPASS
#_098534: dw $7EF36C ; HEART CONTAINER FROM 4/4
#_098536: dw $7EF375 ; BOMB
#_098538: dw $7EF375 ; 3 BOMBS
#_09853A: dw $7EF344 ; MUSHROOM
#_09853C: dw $7EF341 ; RED BOOMERANG
#_09853E: dw $7EF35C ; FULL BOTTLE (RED)
#_098540: dw $7EF35C ; FULL BOTTLE (GREEN)
#_098542: dw $7EF35C ; FULL BOTTLE (BLUE)
#_098544: dw $7EF36D ; POTION REFILL (RED)
#_098546: dw $7EF36E ; POTION REFILL (GREEN)
#_098548: dw $7EF36E ; POTION REFILL (BLUE)
#_09854A: dw $7EF375 ; 10 BOMBS
#_09854C: dw $7EF366 ; BIG KEY
#_09854E: dw $7EF368 ; MAP
#_098550: dw $7EF360 ; 1 RUPEE
#_098552: dw $7EF360 ; 5 RUPEES
#_098554: dw $7EF360 ; 20 RUPEES
#_098556: dw $7EF374 ; GREEN PENDANT
#_098558: dw $7EF374 ; BLUE PENDANT
#_09855A: dw $7EF374 ; RED PENDANT
#_09855C: dw $7EF340 ; TOSSED BOW
#_09855E: dw $7EF340 ; SILVERS
#_098560: dw $7EF35C ; FULL BOTTLE (BEE)
#_098562: dw $7EF35C ; FULL BOTTLE (FAIRY)
#_098564: dw $7EF36C ; BOSS HC
#_098566: dw $7EF36C ; SANC HC
#_098568: dw $7EF360 ; 100 RUPEES
#_09856A: dw $7EF360 ; 50 RUPEES
#_09856C: dw $7EF372 ; HEART
#_09856E: dw $7EF376 ; ARROW
#_098570: dw $7EF376 ; 10 ARROWS
#_098572: dw $7EF373 ; SMALL MAGIC
#_098574: dw $7EF360 ; 300 RUPEES
#_098576: dw $7EF360 ; 20 RUPEES GREEN
#_098578: dw $7EF35C ; FULL BOTTLE (GOOD BEE)
#_09857A: dw $7EF359 ; TOSSED FIGHTER SWORD
#_09857C: dw $7EF34C ; FLUTE (ACTIVATED)
#_09857E: dw $7EF355 ; BOOTS

;---------------------------------------------------------------------------------------------------

.sram_value
#_098580: db $01 ; FIGHTER SWORD
#_098581: db $02 ; MASTER SWORD
#_098582: db $03 ; TEMPERED SWORD
#_098583: db $04 ; BUTTER SWORD
#_098584: db $01 ; FIGHTER SHIELD
#_098585: db $02 ; FIRE SHIELD
#_098586: db $03 ; MIRROR SHIELD
#_098587: db $01 ; FIRE ROD
#_098588: db $01 ; ICE ROD
#_098589: db $01 ; HAMMER
#_09858A: db $01 ; HOOKSHOT
#_09858B: db $01 ; BOW
#_09858C: db $01 ; BOOMERANG
#_09858D: db $02 ; POWDER
#_09858E: db $FF ; BOTTLE REFILL (BEE)
#_09858F: db $01 ; BOMBOS
#_098590: db $01 ; ETHER
#_098591: db $01 ; QUAKE
#_098592: db $01 ; LAMP
#_098593: db $01 ; SHOVEL
#_098594: db $02 ; FLUTE
#_098595: db $01 ; SOMARIA
#_098596: db $FF ; BOTTLE
#_098597: db $FF ; HEART PIECE
#_098598: db $01 ; BYRNA
#_098599: db $01 ; CAPE
#_09859A: db $02 ; MIRROR
#_09859B: db $01 ; GLOVE
#_09859C: db $02 ; MITTS
#_09859D: db $01 ; BOOK
#_09859E: db $01 ; FLIPPERS
#_09859F: db $01 ; PEARL
#_0985A0: db $FF ; CRYSTAL
#_0985A1: db $01 ; NET
#_0985A2: db $FF ; BLUE MAIL
#_0985A3: db $02 ; RED MAIL
#_0985A4: db $FF ; SMALL KEY
#_0985A5: db $FF ; COMPASS
#_0985A6: db $FF ; HEART CONTAINER FROM 4/4
#_0985A7: db $FF ; BOMB
#_0985A8: db $FF ; 3 BOMBS
#_0985A9: db $FF ; MUSHROOM
#_0985AA: db $02 ; RED BOOMERANG
#_0985AB: db $FF ; FULL BOTTLE (RED)
#_0985AC: db $FF ; FULL BOTTLE (GREEN)
#_0985AD: db $FF ; FULL BOTTLE (BLUE)
#_0985AE: db $FF ; POTION REFILL (RED)
#_0985AF: db $FF ; POTION REFILL (GREEN)
#_0985B0: db $FF ; POTION REFILL (BLUE)
#_0985B1: db $FF ; 10 BOMBS
#_0985B2: db $FF ; BIG KEY
#_0985B3: db $FF ; MAP
#_0985B4: db $FF ; 1 RUPEE
#_0985B5: db $FB ; 5 RUPEES
#_0985B6: db $EC ; 20 RUPEES
#_0985B7: db $FF ; GREEN PENDANT
#_0985B8: db $FF ; BLUE PENDANT
#_0985B9: db $FF ; RED PENDANT
#_0985BA: db $01 ; TOSSED BOW
#_0985BB: db $03 ; SILVERS
#_0985BC: db $FF ; FULL BOTTLE (BEE)
#_0985BD: db $FF ; FULL BOTTLE (FAIRY)
#_0985BE: db $FF ; BOSS HC
#_0985BF: db $FF ; SANC HC
#_0985C0: db $9C ; 100 RUPEES
#_0985C1: db $CE ; 50 RUPEES
#_0985C2: db $FF ; HEART
#_0985C3: db $01 ; ARROW
#_0985C4: db $0A ; 10 ARROWS
#_0985C5: db $FF ; SMALL MAGIC
#_0985C6: db $FF ; 300 RUPEES
#_0985C7: db $FF ; 20 RUPEES GREEN
#_0985C8: db $FF ; FULL BOTTLE (GOOD BEE)
#_0985C9: db $01 ; TOSSED FIGHTER SWORD
#_0985CA: db $03 ; FLUTE (ACTIVATED)
#_0985CB: db $01 ; BOOTS

;===================================================================================================

.dungeon_masks
#_0985CC: dw $8000 ; Sewers
#_0985CE: dw $4000 ; Hyrule Castle
#_0985D0: dw $2000 ; Eastern Palace
#_0985D2: dw $1000 ; Desert Palace
#_0985D4: dw $0800 ; Agahnim's Tower
#_0985D6: dw $0400 ; Swamp Palace
#_0985D8: dw $0200 ; Palace of Darkness
#_0985DA: dw $0100 ; Misery Mire
#_0985DC: dw $0080 ; Skull Woods
#_0985DE: dw $0040 ; Ice Palace
#_0985E0: dw $0020 ; Tower of Hera
#_0985E2: dw $0010 ; Thieves' Town
#_0985E4: dw $0008 ; Turtle Rock
#_0985E6: dw $0004 ; Ganon's Tower

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_ItemReceipt:
#_0985E8: PHB
#_0985E9: PHK
#_0985EA: PLB

#_0985EB: JSR Ancilla_AddAncilla
#_0985EE: BCC .free_slot

#_0985F0: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_0985F3: LDA.w $02E9
#_0985F6: CMP.b #$01
#_0985F8: BNE .not_chest

#_0985FA: LDA.b $72
#_0985FC: PHA

#_0985FD: LDA.b $73
#_0985FF: PHA

.not_chest
#_098600: LDY.b #$01

#_098602: LDA.w $02D8
#_098605: CMP.b #$20 ; ITEMGET 20
#_098607: BNE .not_crystal

#_098609: LDY.b #$02

;---------------------------------------------------------------------------------------------------

.not_crystal
#_09860B: TYA
#_09860C: STA.w $02E4

#_09860F: PHX

#_098610: LDY.w $02D8
#_098613: BNE .not_uncle_gear

#_098615: LDX.b #$08 ; ITEMGET 04 but x2

#_098617: LDA.w .sram_write+0,X
#_09861A: STA.b $00

#_09861C: LDA.w .sram_write+1,X
#_09861F: STA.b $01

#_098621: LDA.b #$7E
#_098623: STA.b $02

#_098625: LDA.w .sram_value,Y
#_098628: STA.b [$00]

;---------------------------------------------------------------------------------------------------

.not_uncle_gear
#_09862A: TYA
#_09862B: ASL A
#_09862C: TAX

#_09862D: LDA.w .sram_write+0,X
#_098630: STA.b $00

#_098632: LDA.w .sram_write+1,X
#_098635: STA.b $01

#_098637: LDA.b #$7E
#_098639: STA.b $02

#_09863B: LDA.w .sram_value,Y
#_09863E: BMI .dont_write

#_098640: STA.b [$00]

.dont_write
#_098642: CPY.b #$1F ; ITEMGET 1F
#_098644: BNE .not_moon_pearl

#_098646: STZ.b $56

;---------------------------------------------------------------------------------------------------

.not_moon_pearl
#_098648: LDA.b #$04

#_09864A: CPY.b #$4B ; ITEMGET 4B
#_09864C: BEQ .boots

#_09864E: CPY.b #$1E ; ITEMGET 1E
#_098650: BNE .not_flippers

.flippers
#_098652: LDA.b #$02

;---------------------------------------------------------------------------------------------------

.boots
#_098654: ORA.l $7EF379
#_098658: STA.l $7EF379

;---------------------------------------------------------------------------------------------------

.not_flippers
#_09865C: CPY.b #$1B ; ITEMGET 1B
#_09865E: BEQ .power_glove

#_098660: CPY.b #$1C ; ITEMGET 1C
#_098662: BNE .not_mitts

.power_glove
#_098664: JSL Palettes_Load_LinkGloves

;---------------------------------------------------------------------------------------------------

.proceed_to_gfx
#_098668: BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_mitts
#_09866B: LDX.b #$04
#_09866D: CPY.b #$37 ; ITEMGET 37
#_09866F: BEQ .pendant

#_098671: LDX.b #$01
#_098673: CPY.b #$38 ; ITEMGET 38
#_098675: BEQ .pendant

#_098677: LDX.b #$02
#_098679: CPY.b #$39 ; ITEMGET 39
#_09867B: BNE .not_pendant

.pendant
#_09867D: TXA
#_09867E: ORA.b [$00]
#_098680: STA.b [$00]

#_098682: INC.w $0200
#_098685: AND.b #$07
#_098687: CMP.b #$07
#_098689: BNE .not_pendant

#_09868B: LDA.b #$04
#_09868D: STA.l $7EF3C7

;---------------------------------------------------------------------------------------------------

.not_pendant
#_098691: CPY.b #$22 ; ITEMGET 22
#_098693: BNE .not_blue_mail

#_098695: LDA.b [$00]
#_098697: BNE .we_have_good_mail

#_098699: LDA.b #$01
#_09869B: STA.b [$00]

.we_have_good_mail
#_09869D: BRA .proceed_to_gfx

;---------------------------------------------------------------------------------------------------

.not_blue_mail
#_09869F: CPY.b #$25 ; ITEMGET 25
#_0986A1: BEQ .dungeon_item

#_0986A3: CPY.b #$32 ; ITEMGET 32
#_0986A5: BEQ .dungeon_item

#_0986A7: CPY.b #$33 ; ITEMGET 33
#_0986A9: BNE .not_dungeon_item

.dungeon_item
#_0986AB: LDX.w $040C

#_0986AE: REP #$20

#_0986B0: LDA.w .dungeon_masks,X
#_0986B3: ORA.b [$00]
#_0986B5: STA.b [$00]

#_0986B7: SEP #$20

#_0986B9: BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_dungeon_item
#_0986BC: CPY.b #$3E ; ITEMGET 3E
#_0986BE: BNE .not_heart_container

#_0986C0: BIT.w $0308
#_0986C3: BPL .not_heart_container

#_0986C5: LDA.b #$02
#_0986C7: STA.w $0309

.not_heart_container
#_0986CA: CPY.b #$20 ; ITEMGET 20
#_0986CC: BNE .not_crystal_or_caping

#_0986CE: INC.w $0200

;---------------------------------------------------------------------------------------------------

#_0986D1: PHX

#_0986D2: LDX.b #$04

.next_ancilla_check
#_0986D4: LDA.w $0C4A,X
#_0986D7: CMP.b #$07 ; ANCILLA 07
#_0986D9: BEQ .bomb_ancilla

#_0986DB: CMP.b #$2C ; ANCILLA 2C
#_0986DD: BNE .not_somaria_block

.bomb_ancilla
#_0986DF: STZ.w $0C4A,X

#_0986E2: STZ.w $0308
#_0986E5: STZ.w $0309

.not_somaria_block
#_0986E8: DEX
#_0986E9: BPL .next_ancilla_check

#_0986EB: PLX

;---------------------------------------------------------------------------------------------------

#_0986EC: LDA.b $55
#_0986EE: BEQ .not_crystal_or_caping

#_0986F0: LDA.b #$20
#_0986F2: STA.w $02E2

#_0986F5: STZ.w $037B
#_0986F8: STZ.b $55

#_0986FA: PHY
#_0986FB: PHX

#_0986FC: LDY.b #$04
#_0986FE: LDA.b #$23 ; ANCILLA 23
#_098700: JSL AncillaAdd_CapePoof

#_098704: JSL Link_CalculateSFXPan
#_098708: ORA.b #$15 ; SFX2.15
#_09870A: STA.w $012E

#_09870D: PLX
#_09870E: PLY

#_09870F: BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_crystal_or_caping
#_098712: CPY.b #$29 ; ITEMGET 29
#_098714: BNE .dont_give_mushroom

#_098716: LDA.l $7EF344
#_09871A: CMP.b #$02
#_09871C: BEQ .dont_give_mushroom

#_09871E: LDA.b #$01
#_098720: STA.b [$00]
#_098722: BRA .refresh_hud

;---------------------------------------------------------------------------------------------------

.dont_give_mushroom
#_098724: LDX.b #$01

#_098726: CPY.b #$24 ; ITEMGET 24
#_098728: BEQ .add_to_stock

#_09872A: LDA.w $02E9
#_09872D: CMP.b #$02
#_09872F: BEQ .dont_add_to_stock

#_098731: CPY.b #$27 ; ITEMGET 27
#_098733: BEQ .add_to_stock

#_098735: LDX.b #$03

#_098737: CPY.b #$28 ; ITEMGET 28
#_098739: BEQ .add_to_stock

#_09873B: CPY.b #$31 ; ITEMGET 31
#_09873D: BNE .dont_add_to_stock

#_09873F: LDX.b #$0A

;---------------------------------------------------------------------------------------------------

.add_to_stock
#_098741: TXA
#_098742: CLC
#_098743: ADC.b [$00]
#_098745: STA.b [$00]

#_098747: CMP.b #99
#_098749: BCC .refresh_hud

#_09874B: LDA.b #99
#_09874D: STA.b [$00]

.refresh_hud
#_09874F: JSL RefreshIcon_long

#_098753: BRA .handle_gfx

;---------------------------------------------------------------------------------------------------

.dont_add_to_stock
#_098755: CPY.b #$17 ; ITEMGET 17
#_098757: BNE .not_heart_piece

#_098759: LDA.b [$00]
#_09875B: INC A
#_09875C: AND.b #$03
#_09875E: STA.b [$00]

#_098760: JSL Link_CalculateSFXPan
#_098764: ORA.b #$2D ; SFX3.2D
#_098766: STA.w $012F

#_098769: BRA .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_heart_piece
#_09876B: CPY.b #$01 ; ITEMGET 01
#_09876D: BNE .is_not_ms

#_09876F: PHY
#_098770: PHX

#_098771: JSL AdjustOverworldAmbiance

#_098775: PLX
#_098776: PLY

.is_not_ms
#_098777: JSR ItemReceipt_GiveBottledItem

;---------------------------------------------------------------------------------------------------

.handle_gfx
#_09877A: LDY.w $02D8

#_09877D: LDA.w .item_gfx_index,Y
#_098780: STA.b $72

#_098782: CMP.b #$FF
#_098784: BEQ .null

#_098786: CMP.b #$20
#_098788: BEQ .shield

#_09878A: CMP.b #$2D
#_09878C: BEQ .shield

#_09878E: CMP.b #$2E
#_098790: BNE .extract_graphics

.shield
#_098792: JSL DecompressShieldGraphics
#_098796: JSL Palettes_Load_Shield

#_09879A: LDA.b $72

#_09879C: BRA .extract_graphics

.null
#_09879E: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.extract_graphics
#_0987A0: JSL WriteTo4BPPBuffer_item_gfx

#_0987A4: LDA.b $72

#_0987A6: CMP.b #$06
#_0987A8: BEQ .sword

#_0987AA: CMP.b #$18
#_0987AC: BNE .not_sword

.sword
#_0987AE: LDA.w $02D8
#_0987B1: BEQ .not_sword

#_0987B3: JSL DecompressSwordGraphics
#_0987B7: JSL Palettes_Load_Sword

;---------------------------------------------------------------------------------------------------

.not_sword
#_0987BB: PLX

#_0987BC: LDA.w $02D8
#_0987BF: STA.w $0C5E,X

#_0987C2: TAY

#_0987C3: STZ.w $03A4,X

#_0987C6: LDA.b #$09
#_0987C8: CPY.b #$01 ; ITEMGET 01
#_0987CA: BNE .not_mastersword

;---------------------------------------------------------------------------------------------------

#_0987CC: STA.w $039F,X

#_0987CF: LDA.w $02E9
#_0987D2: CMP.b #$02
#_0987D4: BEQ .ms_from_sprite

#_0987D6: LDA.b #$A0
#_0987D8: STA.w $0C68,X

#_0987DB: LDA.b #$2B
#_0987DD: STA.b $11

#_0987DF: LDA.b #$00
#_0987E1: STA.l $7EC007

#_0987E5: PHX
#_0987E6: PHY

#_0987E7: LDY.b #$04
#_0987E9: LDA.b #$35 ; ANCILLA 35
#_0987EB: JSL AncillaAdd_MSCutscene

#_0987EF: PLY
#_0987F0: PLX

#_0987F1: LDA.b #$02

;---------------------------------------------------------------------------------------------------

.not_mastersword
#_0987F3: STA.w $039F,X

.ms_from_sprite
#_0987F6: LDA.b #$05
#_0987F8: STA.w $0BF0,X

#_0987FB: PHY

#_0987FC: LDY.b #$60

#_0987FE: LDA.w $02E9
#_098801: STA.w $0C54,X
#_098804: BEQ .was_from_text

#_098806: LDY.b #$38

.was_from_text
#_098808: LDA.w $0C5E,X

#_09880B: CMP.b #$20 ; ITEMGET 20
#_09880D: BEQ .dungeon_prize

#_09880F: CMP.b #$37 ; ITEMGET 37
#_098811: BEQ .dungeon_prize

#_098813: CMP.b #$38 ; ITEMGET 38
#_098815: BEQ .dungeon_prize

#_098817: CMP.b #$39 ; ITEMGET 39
#_098819: BEQ .dungeon_prize

#_09881B: CMP.b #$26 ; ITEMGET 26
#_09881D: BNE .not_44_heart

#_09881F: LDY.b #$02
#_098821: BRA .not_44_heart

.dungeon_prize
#_098823: LDY.b #$68

;---------------------------------------------------------------------------------------------------

.not_44_heart
#_098825: TYA
#_098826: STA.w $03B1,X

#_098829: PLY

#_09882A: LDA.w $02E9
#_09882D: CMP.b #$01
#_09882F: BNE .not_from_chest

;---------------------------------------------------------------------------------------------------

#_098831: PLA
#_098832: STA.b $73

#_098834: PLA
#_098835: STA.b $72

#_098837: REP #$20

#_098839: LDA.b $72
#_09883B: AND.w #$1F80

#_09883E: LSR A
#_09883F: LSR A
#_098840: LSR A
#_098841: LSR A

#_098842: STA.b $00

#_098844: LDA.b $72
#_098846: AND.w #$007E
#_098849: ASL A
#_09884A: ASL A
#_09884B: STA.b $02

;---------------------------------------------------------------------------------------------------

#_09884D: SEP #$20

#_09884F: LDA.b $01
#_098851: CLC
#_098852: ADC.w $062F
#_098855: STA.b $01

#_098857: LDA.b $03
#_098859: CLC
#_09885A: ADC.w $062D
#_09885D: STA.b $03

#_09885F: REP #$20

#_098861: LDA.w .offset_y,Y
#_098864: AND.w #$00FF
#_098867: ORA.w #$FF00

#_09886A: CLC
#_09886B: ADC.b $00
#_09886D: STA.b $00

#_09886F: LDA.w .offset_x,Y
#_098872: AND.w #$00FF
#_098875: CLC
#_098876: ADC.b $02

#_098878: BRL .proceed_to_finish_coords

;---------------------------------------------------------------------------------------------------

.not_from_chest
#_09887B: PHY

#_09887C: LDA.w $0C54,X
#_09887F: BNE .not_text_or_ms

#_098881: LDA.w $0C5E,X
#_098884: CMP.b #$01 ; ITEMGET 01
#_098886: BNE .not_text_or_ms

#_098888: JSL Link_CalculateSFXPan
#_09888C: ORA.b #$2C ; SFX2.2C
#_09888E: STA.w $012E

#_098891: BRA .done_with_sfx

;---------------------------------------------------------------------------------------------------

.not_text_or_ms
#_098893: LDA.w $0C5E,X

#_098896: CMP.b #$3E ; ITEMGET 3E
#_098898: BEQ .done_with_sfx

#_09889A: CMP.b #$17 ; ITEMGET 17
#_09889C: BEQ .done_with_sfx

#_09889E: CMP.b #$20 ; ITEMGET 20
#_0988A0: BEQ .dungeon_prize_sfx

#_0988A2: CMP.b #$37 ; ITEMGET 37
#_0988A4: BEQ .dungeon_prize_sfx

#_0988A6: CMP.b #$38 ; ITEMGET 38
#_0988A8: BEQ .dungeon_prize_sfx

#_0988AA: CMP.b #$39 ; ITEMGET 39
#_0988AC: BNE .not_dungeon_prize_sfx

;---------------------------------------------------------------------------------------------------

.dungeon_prize_sfx
#_0988AE: JSL Link_CalculateSFXPan
#_0988B2: ORA.b #$13 ; SONG 13
#_0988B4: STA.w $012C

#_0988B7: BRA .done_with_sfx

;---------------------------------------------------------------------------------------------------

.not_dungeon_prize_sfx
#_0988B9: JSL Link_CalculateSFXPan
#_0988BD: ORA.b #$0F ; SFX3.0F
#_0988BF: STA.w $012F

;---------------------------------------------------------------------------------------------------

.done_with_sfx
#_0988C2: LDA.b #$0A
#_0988C4: STA.b $02
#_0988C6: STZ.b $03

#_0988C8: LDY.w $0C5E,X

#_0988CB: LDA.w .width,Y
#_0988CE: BEQ .set_coordinates

#_0988D0: CPY.b #$20 ; ITEMGET 20
#_0988D2: BNE .aint_a_crystal

#_0988D4: STZ.b $02
#_0988D6: BRA .set_coordinates

;---------------------------------------------------------------------------------------------------

.aint_a_crystal
#_0988D8: LDA.b #$06
#_0988DA: STA.b $02

;---------------------------------------------------------------------------------------------------

.set_coordinates
#_0988DC: LDY.w $02E9

#_0988DF: CPY.b #$03
#_0988E1: BNE .not_from_ancilla

#_0988E3: LDY.b #$00

.not_from_ancilla
#_0988E5: STZ.b $08
#_0988E7: STZ.b $09

#_0988E9: CPY.b #$02
#_0988EB: BNE .dont_adjust_altitude

#_0988ED: LDA.b #$F8
#_0988EF: STA.b $08
#_0988F1: DEC.b $09

.dont_adjust_altitude
#_0988F3: STY.b $04
#_0988F5: STZ.b $05

;---------------------------------------------------------------------------------------------------

#_0988F7: PLY

#_0988F8: REP #$20

#_0988FA: LDA.w #$FFF2
#_0988FD: STA.b $00

#_0988FF: LDA.b $04
#_098901: BEQ .dont_adjust_y_for_text

#_098903: LDA.w .offset_y,Y
#_098906: AND.w #$00FF
#_098909: ORA.w #$FF00
#_09890C: STA.b $00

.dont_adjust_y_for_text
#_09890E: LDA.b $00
#_098910: CLC
#_098911: ADC.b $20

#_098913: CLC
#_098914: ADC.b $08
#_098916: STA.b $00

;---------------------------------------------------------------------------------------------------

#_098918: LDA.b $04
#_09891A: BEQ .dont_adjust_x_for_text

#_09891C: LDA.w .offset_x,Y
#_09891F: AND.w #$00FF
#_098922: STA.b $02

.dont_adjust_x_for_text
#_098924: LDA.b $02
#_098926: CLC
#_098927: ADC.b $22

;---------------------------------------------------------------------------------------------------

.proceed_to_finish_coords
#_098929: STA.b $02

#_09892B: SEP #$20

#_09892D: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_098930: PLB

#_098931: RTL

;===================================================================================================

pool ItemReceipt_GiveBottledItem

.bottle_id
#_098932: db $16 ; ITEMGET 16 - EMPTY BOTTLE
#_098933: db $2B ; ITEMGET 2B - FULL BOTTLE (RED)
#_098934: db $2C ; ITEMGET 2C - FULL BOTTLE (GREEN)
#_098935: db $2D ; ITEMGET 2D - FULL BOTTLE (BLUE)
#_098936: db $3D ; ITEMGET 3D - FULL BOTTLE (FAIRY)
#_098937: db $3C ; ITEMGET 3C - FULL BOTTLE (BEE)
#_098938: db $48 ; ITEMGET 48 - FULL BOTTLE (GOOD BEE)

.refill_id
#_098939: db $2E ; ITEMGET 2E - POTION REFILL (RED)
#_09893A: db $2F ; ITEMGET 2F - POTION REFILL (GREEN)
#_09893B: db $30 ; ITEMGET 30 - POTION REFILL (BLUE)
#_09893C: db $FF ; null
#_09893D: db $0E ; ITEMGET 0E - BOTTLE REFILL (BEE)

pool off

;---------------------------------------------------------------------------------------------------

ItemReceipt_GiveBottledItem:
#_09893E: STY.b $0C

#_098940: LDX.b #$06

.next_id_check
#_098942: LDA.w .bottle_id,X
#_098945: CMP.b $0C
#_098947: BEQ .contents_id_found

#_098949: DEX
#_09894A: BPL .next_id_check

#_09894C: BRA .not_new_bottle

;---------------------------------------------------------------------------------------------------

.contents_id_found
#_09894E: TXA
#_09894F: CLC
#_098950: ADC.b #$02
#_098952: STA.b $0C

#_098954: LDX.b #$00

.next_free_bottle_check
#_098956: LDA.l $7EF35C,X
#_09895A: CMP.b #$02
#_09895C: BCS .slot_occupied

#_09895E: LDA.b $0C
#_098960: STA.l $7EF35C,X

#_098964: BRL .exit

.slot_occupied
#_098967: INX
#_098968: CPX.b #$04
#_09896A: BNE .next_free_bottle_check

;---------------------------------------------------------------------------------------------------

.not_new_bottle
#_09896C: STY.b $0C

#_09896E: LDX.b #$04

.next_refill_check
#_098970: LDA.w .refill_id,X
#_098973: CMP.b $0C
#_098975: BEQ .refill_matched

#_098977: DEX
#_098978: BPL .next_refill_check

#_09897A: BRA .exit

;---------------------------------------------------------------------------------------------------

.refill_matched
#_09897C: TXA
#_09897D: CLC
#_09897E: ADC.b #$03
#_098980: STA.b $0C

#_098982: LDX.b #$00

.next_empty_bottle_check
#_098984: LDA.l $7EF35C,X
#_098988: CMP.b #$02
#_09898A: BNE .not_empty_bottle

#_09898C: LDA.b $0C
#_09898E: STA.l $7EF35C,X

#_098992: BRA .exit

.not_empty_bottle
#_098994: INX
#_098995: CPX.b #$04
#_098997: BNE .next_empty_bottle_check

;---------------------------------------------------------------------------------------------------

.exit
#_098999: RTS

;===================================================================================================

pool AncillaAdd_TossedPondItem

.offset_y
#_09899A: db -13, -13, -13, -13, -13, -12, -12, -13
#_0989A2: db -13, -12, -12, -12, -10, -12, -12, -12
#_0989AA: db -12, -12, -12, -12, -12, -12, -12, -12
#_0989B2: db -12, -12, -12, -12, -12, -12, -12, -12
#_0989BA: db -12, -12, -12, -13, -12, -12, -12, -12
#_0989C2: db -12, -12, -10, -12, -12, -12, -12, -12
#_0989CA: db -12, -12, -12, -12, -12, -12, -12, -12
#_0989D2: db -12, -12, -12, -12, -12, -12, -12, -12
#_0989DA: db -12, -12, -12, -12, -12, -12, -12, -12
#_0989E2: db -12, -13, -12, -12

.offset_x
#_0989E6: db   4,   4,   4,   4,   4,   0,   0,   4
#_0989EE: db   4,   4,   4,   4,   5,   0,   0,   0
#_0989F6: db   0,   0,   0,   4,   0,   4,   0,   0
#_0989FE: db   4,   0,   0,   0,   0,   0,   0,   0
#_098A06: db   0,   0,   0,   0,  11,   0,   0,   0
#_098A0E: db   2,   0,   5,   0,   0,   0,   0,   0
#_098A16: db   0,   0,   0,   0,   4,   4,   4,   0
#_098A1E: db   0,   0,   0,   0,   0,   0,   0,   0
#_098A26: db   0,   0,   4,   4,   0,   4,   0,   0
#_098A2E: db   0,   4,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_TossedPondItem:
#_098A32: PHB
#_098A33: PHK
#_098A34: PLB

#_098A35: STX.w $02D8

#_098A38: JSR Ancilla_AddAncilla
#_098A3B: BCS EXIT_098AB8

#_098A3D: JSL Link_CalculateSFXPan
#_098A41: ORA.b #$13 ; SFX3.13
#_098A43: STA.w $012F

#_098A46: PHX

#_098A47: LDY.w $02D8

#_098A4A: LDA.w AncillaAdd_ItemReceipt_item_gfx_index,Y
#_098A4D: STA.b $72

#_098A4F: CMP.b #$FF
#_098A51: BEQ .invalid

#_098A53: CMP.b #$20
#_098A55: BNE .continue

#_098A57: JSL DecompressShieldGraphics

#_098A5B: LDA.b $72
#_098A5D: BRA .continue

.invalid
#_098A5F: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue
#_098A61: JSL WriteTo4BPPBuffer_item_gfx

#_098A65: LDA.b $72
#_098A67: CMP.b #$06
#_098A69: BNE .not_fighter_sword

#_098A6B: JSL DecompressSwordGraphics

.not_fighter_sword
#_098A6F: PLX

#_098A70: LDA.b #$80
#_098A72: STA.w $0308
#_098A75: STZ.w $0309

#_098A78: STZ.b $2F
#_098A7A: STZ.b $2E

#_098A7C: LDA.b #$14
#_098A7E: STA.w $0294,X

#_098A81: LDA.b #$D8
#_098A83: STA.w $0C22,X

#_098A86: STZ.w $0C2C,X
#_098A89: STZ.w $029E,X

#_098A8C: LDA.b #$10
#_098A8E: STA.w $0C68,X

;---------------------------------------------------------------------------------------------------

#_098A91: LDA.w $02D8
#_098A94: STA.w $0C5E,X

#_098A97: TAY

#_098A98: REP #$20

#_098A9A: LDA.w .offset_y,Y
#_098A9D: AND.w #$00FF
#_098AA0: ORA.w #$FF00

#_098AA3: CLC
#_098AA4: ADC.b $20
#_098AA6: STA.b $00

#_098AA8: LDA.w .offset_x,Y
#_098AAB: AND.w #$00FF

#_098AAE: CLC
#_098AAF: ADC.b $22
#_098AB1: STA.b $02

#_098AB3: SEP #$20

#_098AB5: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_098AB8:
#_098AB8: PLB

#_098AB9: RTL

;===================================================================================================

pool AddHappinessPondRupees

.speed_z
#_098ABA: db $14, $14, $14, $14
#_098ABE: db $14, $10, $10, $10, $10
#_098AC3: db $10

.speed_y
#_098AC4: db $D8, $D8, $D8, $D8
#_098AC8: db $D8, $E0, $E0, $E0, $E0
#_098ACD: db $E0

.speed_x
#_098ACE: db $00, $F4, $FA, $06
#_098AD2: db $0C, $F7, $FB, $00, $05
#_098AD7: db $09

.start_index
#_098AD8: db $00
#_098AD9: db $04
#_098ADA: db $04
#_098ADB: db $09

.end_index
#_098ADC: db $FF
#_098ADD: db $00
#_098ADE: db $FF
#_098ADF: db $FF

pool off

;---------------------------------------------------------------------------------------------------

AddHappinessPondRupees:
#_098AE0: PHB
#_098AE1: PHK
#_098AE2: PLB

#_098AE3: PHX
#_098AE4: PHA

#_098AE5: LDY.b #$09
#_098AE7: LDA.b #$42 ; ANCILLA 42
#_098AE9: JSR Ancilla_AddAncilla
#_098AEC: BCC .free_slot

#_098AEE: PLA
#_098AEF: PLX

#_098AF0: BRA EXIT_098AB8

;---------------------------------------------------------------------------------------------------

.free_slot
#_098AF2: JSL Link_CalculateSFXPan
#_098AF6: ORA.b #$13 ; SFX3.13
#_098AF8: STA.w $012F

#_098AFB: LDY.b #$35 ; ITEMGET 35
#_098AFD: LDA.w AncillaAdd_ItemReceipt_item_gfx_index,Y
#_098B00: STA.b $72

#_098B02: JSL WriteTo4BPPBuffer_item_gfx

#_098B06: LDA.b #$80
#_098B08: STA.w $0308
#_098B0B: STZ.w $0309

#_098B0E: STZ.b $2F
#_098B10: STZ.b $2E

#_098B12: LDX.b #$09
#_098B14: LDA.b #$00

;---------------------------------------------------------------------------------------------------

.next_clear
#_098B16: STA.l $7F586C,X

#_098B1A: DEX
#_098B1B: BPL .next_clear

#_098B1D: PLA
#_098B1E: TAX

#_098B1F: LDA.w .end_index,X
#_098B22: STA.b $0F

#_098B24: LDA.w .start_index,X
#_098B27: TAY

;---------------------------------------------------------------------------------------------------

#_098B28: LDX.b #$09

.next_rupee
#_098B2A: LDA.b #$01
#_098B2C: STA.l $7F586C,X

#_098B30: LDA.w .speed_z,Y
#_098B33: STA.l $7F5818,X

#_098B37: LDA.w .speed_y,Y
#_098B3A: STA.l $7F5800,X

#_098B3E: LDA.w .speed_x,Y
#_098B41: STA.l $7F580C,X

#_098B45: LDA.b #$00
#_098B47: STA.l $7F5854,X
#_098B4B: STA.l $7F58AA,X

#_098B4F: LDA.b #$10
#_098B51: STA.l $7F5860,X

#_098B55: LDA.b #$35
#_098B57: STA.l $7F587A,X

#_098B5B: REP #$20

#_098B5D: LDA.b $20
#_098B5F: CLC
#_098B60: ADC.w #$FFF4
#_098B63: STA.b $00

#_098B65: LDA.b $22
#_098B67: CLC
#_098B68: ADC.w #$0004
#_098B6B: STA.b $02

#_098B6D: SEP #$20

#_098B6F: LDA.b $00
#_098B71: STA.l $7F5824,X

#_098B75: LDA.b $01
#_098B77: STA.l $7F5830,X

#_098B7B: LDA.b $02
#_098B7D: STA.l $7F583C,X

#_098B81: LDA.b $03
#_098B83: STA.l $7F5848,X

#_098B87: DEX

#_098B88: DEY
#_098B89: CPY.b $0F
#_098B8B: BNE .next_rupee

#_098B8D: PLX

;---------------------------------------------------------------------------------------------------

#EXIT_098B8E:
#_098B8E: PLB

#_098B8F: RTL

;===================================================================================================

pool AncillaAdd_FallingPrize

.receipt_ids

.ether_id
#_098B90: db $10 ; ITEMGET 10

.green_pendant_id
#_098B91: db $37 ; ITEMGET 37

.red_pendant_id
#_098B92: db $39 ; ITEMGET 39

.blue_pendant_id
#_098B93: db $38 ; ITEMGET 38

.heart_container_id
#_098B94: db $26 ; ITEMGET 26

.bombos_id
#_098B95: db $0F ; ITEMGET 0F

.crystal_id
#_098B96: db $20 ; ITEMGET 20

;---------------------------------------------------------------------------------------------------

.fall_height
#_098B97: db $60 ; ether
#_098B98: db $80 ; green pendant
#_098B99: db $80 ; red pendant
#_098B9A: db $80 ; blue pendant
#_098B9B: db $80 ; heart container
#_098B9C: db $80 ; bombos
#_098B9D: db $80 ; crystal

.fall_y
#_098B9E: dw $0048 ; ether
#_098BA0: dw $0078 ; green pendant
#_098BA2: dw $0078 ; red pendant
#_098BA4: dw $0078 ; blue pendant
#_098BA6: dw $0078 ; heart container
#_098BA8: dw $0068 ; bombos
#_098BAA: dw $0078 ; crystal

.fall_x
#_098BAC: dw $0078 ; ether
#_098BAE: dw $0078 ; green pendant
#_098BB0: dw $0078 ; red pendant
#_098BB2: dw $0078 ; blue pendant
#_098BB4: dw $0078 ; heart container
#_098BB6: dw $0080 ; bombos
#_098BB8: dw $0078 ; crystal

.fall_timer
#_098BBA: db  64 ; ether
#_098BBB: db   0 ; green pendant
#_098BBC: db   0 ; red pendant
#_098BBD: db   0 ; blue pendant
#_098BBE: db   0 ; heart container
#_098BBF: db $FF ; bombos
#_098BC0: db   0 ; crystal

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_FallingPrize:
#_098BC1: PHB
#_098BC2: PHK
#_098BC3: PLB

#_098BC4: STX.w $02D8

#_098BC7: JSR Ancilla_AddAncilla
#_098BCA: BCS EXIT_098B8E

#_098BCC: PHX

#_098BCD: LDY.w $02D8

#_098BD0: LDA.w .receipt_ids,Y
#_098BD3: STA.w $0C5E,X

#_098BD6: CMP.w .ether_id
#_098BD9: BEQ .is_ether

#_098BDB: CMP.w .bombos_id
#_098BDE: BNE .not_medallion

.is_ether
#_098BE0: TAY

#_098BE1: LDA.w AncillaAdd_ItemReceipt_item_gfx_index,Y
#_098BE4: STA.b $72

#_098BE6: JSL WriteTo4BPPBuffer_item_gfx

;---------------------------------------------------------------------------------------------------

.not_medallion
#_098BEA: PLX

#_098BEB: LDA.b #$D0
#_098BED: STA.w $0294,X

#_098BF0: STZ.w $0C22,X
#_098BF3: STZ.w $0C2C,X

#_098BF6: STZ.w $0C54,X

#_098BF9: LDY.w $02D8

#_098BFC: LDA.w .fall_height,Y
#_098BFF: STA.w $029E,X

#_098C02: LDA.b #$09
#_098C04: STA.w $03B1,X

#_098C07: STZ.w $039F,X
#_098C0A: STZ.w $0385,X

#_098C0D: LDA.w .fall_timer,Y
#_098C10: STA.w $0394,X

#_098C13: LDA.w $0C5E,X
#_098C16: STA.w $02D8

#_098C19: CPY.b #$00
#_098C1B: BEQ .was_medallion

#_098C1D: CPY.b #$05
#_098C1F: BEQ .was_medallion

#_098C21: LDA.w $040C
#_098C24: CMP.b #$14 ; DUNGEON 14
#_098C26: BNE .not_hera

;---------------------------------------------------------------------------------------------------

.hera
#_098C28: LDA.b $21
#_098C2A: AND.b #$FE
#_098C2C: INC A
#_098C2D: STA.b $01
#_098C2F: STZ.b $00

#_098C31: LDA.b $23
#_098C33: AND.b #$FE
#_098C35: INC A
#_098C36: STA.b $03
#_098C38: STZ.b $02

#_098C3A: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.not_hera
#_098C3D: TYA
#_098C3E: ASL A
#_098C3F: TAY

#_098C40: REP #$20

#_098C42: LDA.w .fall_y,Y
#_098C45: CLC
#_098C46: ADC.b $E8
#_098C48: STA.b $00

#_098C4A: LDA.w .fall_x,Y
#_098C4D: CLC
#_098C4E: ADC.b $E2
#_098C50: STA.b $02

#_098C52: SEP #$20

#_098C54: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.was_medallion
#_098C57: TYA
#_098C58: ASL A
#_098C59: TAY

#_098C5A: REP #$20

#_098C5C: LDA.w .fall_y,Y
#_098C5F: CLC
#_098C60: ADC.b $E8
#_098C62: STA.b $00

#_098C64: LDA.b $22
#_098C66: CLC
#_098C67: ADC.w #$0000
#_098C6A: STA.b $02

#_098C6C: SEP #$20

#_098C6E: BRL AncillaInit_SetCoordsAndExit

;===================================================================================================

UNREACHABLE_098C71:
#_098C71: PLB

#_098C72: RTL

;===================================================================================================

AncillaAdd_DugUpFlute:
#_098C73: PHB
#_098C74: PHK
#_098C75: PLB

#_098C76: JSR Ancilla_AddAncilla
#_098C79: BCS .exit

#_098C7B: STZ.w $0C54,X
#_098C7E: STZ.w $029E,X

#_098C81: LDA.l FluteBounce
#_098C85: STA.w $0294,X

#_098C88: LDY.b #$08
#_098C8A: LDA.b $2F

#_098C8C: CMP.b #$04
#_098C8E: BNE .not_facing_left

#_098C90: LDY.b #$F8

.not_facing_left
#_098C92: TYA
#_098C93: STA.w $0C2C,X

#_098C96: PHX

#_098C97: LDA.b #$0C
#_098C99: JSL WriteTo4BPPBuffer_item_gfx

#_098C9D: PLX

#_098C9E: REP #$20

#_098CA0: LDA.w #$0A8A
#_098CA3: STA.b $00

#_098CA5: LDA.w #$0490
#_098CA8: STA.b $02

#_098CAA: SEP #$20

#_098CAC: BRL AncillaInit_SetCoordsAndExit

.exit
#_098CAF: PLB

#_098CB0: RTL

;===================================================================================================

AncillaAdd_ChargedSpinAttackSparkle:
#_098CB1: PHB
#_098CB2: PHK
#_098CB3: PLB

#_098CB4: LDX.b #$09

.next_slot
#_098CB6: LDA.w $0C4A,X
#_098CB9: BEQ .free_slot

#_098CBB: CMP.b #$3C ; ANCILLA 3C
#_098CBD: BEQ .free_slot

#_098CBF: DEX
#_098CC0: BPL .next_slot

#_098CC2: BRA .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_098CC4: LDA.b #$0D ; ANCILLA 0D
#_098CC6: STA.w $0C4A,X

#_098CC9: LDA.b $EE
#_098CCB: STA.w $0C7C,X

#_098CCE: LDA.b #$06
#_098CD0: STA.w $0C68,X

.exit
#_098CD3: PLB

#_098CD4: RTL

;===================================================================================================

pool AncillaAdd_ExplodingWeatherVane

.speed_x
#_098CD5: db   8,  10,   9,   4
#_098CD9: db  11,  12, -10,  -8
#_098CDD: db   4,  -6, -10,  -4

.speed_z
#_098CE1: db  20,  22,  20,  20
#_098CE5: db  22,  20,  20,  22
#_098CE9: db  20,  22,  20,  20

;---------------------------------------------------------------------------------------------------

.position_y
#_098CED: db $B0, $A3, $A0, $A2
#_098CF1: db $A0, $A8, $A0, $A0
#_098CF5: db $A8, $A1, $B0, $A0

.position_x
#_098CF9: db $00, $02, $04, $06
#_098CFD: db $03, $08, $0E, $08
#_098D01: db $0C, $07, $0A, $08

.position_z
#_098D05: db $30, $12, $20, $14
#_098D09: db $16, $18, $20, $14
#_098D0D: db $18, $16, $14, $20

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_ExplodingWeatherVane:
#_098D11: PHB
#_098D12: PHK
#_098D13: PLB

#_098D14: JSR Ancilla_AddAncilla
#_098D17: BCS .exit

#_098D19: LDA.b #$0A
#_098D1B: STA.w $03B1,X

#_098D1E: LDA.b #$80
#_098D20: STA.w $0394,X

#_098D23: STZ.w $0C54,X
#_098D26: STZ.w $039F,X

#_098D29: STZ.w $012E

#_098D2C: LDA.b #$F2 ; SONG F2 - half volume
#_098D2E: STA.w $012C

#_098D31: LDA.b #$17 ; SFX1.17
#_098D33: STA.w $012D

#_098D36: LDA.b #$00
#_098D38: STA.l $7F58B8

#_098D3C: REP #$20

#_098D3E: LDA.w #$0280
#_098D41: STA.l $7F58B6

;---------------------------------------------------------------------------------------------------

#_098D45: SEP #$20

#_098D47: LDX.b #$0B

.next
#_098D49: LDA.b #$00
#_098D4B: STA.l $7F5800,X

#_098D4F: LDA.w .speed_x,X
#_098D52: STA.l $7F580C,X

#_098D56: LDA.w .speed_z,X
#_098D59: STA.l $7F5818,X

#_098D5D: LDA.w .position_y,X
#_098D60: STA.l $7F5824,X

#_098D64: LDA.b #$07
#_098D66: STA.l $7F5830,X

#_098D6A: LDA.w .position_x,X
#_098D6D: STA.l $7F583C,X

#_098D71: LDA.b #$02
#_098D73: STA.l $7F5848,X

#_098D77: LDA.w .position_z,X
#_098D7A: STA.l $7F5854,X

#_098D7E: LDA.b #$01
#_098D80: STA.l $7F5860,X

#_098D84: TXA
#_098D85: AND.b #$01
#_098D87: STA.l $7F586C,X

#_098D8B: DEX
#_098D8C: BPL .next

;---------------------------------------------------------------------------------------------------

.exit
#_098D8E: PLB

#_098D8F: RTL

;===================================================================================================

AncillaAdd_CutsceneDuck:
#_098D90: PHB
#_098D91: PHK
#_098D92: PLB

#_098D93: JSR AncillaAdd_CheckForPresence
#_098D96: BCS .exit

#_098D98: JSR Ancilla_AddAncilla
#_098D9B: BCS .exit

#_098D9D: LDA.b #$02
#_098D9F: STA.w $0C72,X

#_098DA2: INC A
#_098DA3: STA.w $039F,X

#_098DA6: STZ.w $0C54,X

#_098DA9: LDA.b #$20
#_098DAB: STA.w $03B1,X

#_098DAE: LDA.b #$74
#_098DB0: STA.w $0C5E,X

#_098DB3: STZ.w $0294,X
#_098DB6: STZ.w $0385,X
#_098DB9: STZ.w $029E,X
#_098DBC: STZ.w $03A9,X

#_098DBF: REP #$20
#_098DC1: LDA.w #$0788
#_098DC4: STA.b $00

#_098DC6: LDA.w #$0200
#_098DC9: STA.b $02

#_098DCB: SEP #$20

#_098DCD: BRL AncillaInit_SetCoordsAndExit

.exit
#_098DD0: PLB

#_098DD1: RTL

;===================================================================================================

AncillaAdd_SomariaPlatformPoof:
#_098DD2: LDA.b #$39 ; ANCILLA 39
#_098DD4: STA.w $0C4A,X

#_098DD7: LDA.b #$07
#_098DD9: STA.w $03B1,X

#_098DDC: PHX
#_098DDD: PHY

#_098DDE: LDY.b #$0F

.next_slot
#_098DE0: LDA.w $0E20,Y
#_098DE3: CMP.b #$ED ; SPRITE ED
#_098DE5: BNE .not_platform

#_098DE7: LDA.b #$00
#_098DE9: STA.w $0DD0,Y

#_098DEC: STA.w $02F5

.not_platform
#_098DEF: DEY
#_098DF0: BPL .next_slot

#_098DF2: JSL TileDetect_BigArea_long

#_098DF6: PLY
#_098DF7: PLX

#_098DF8: RTL

;===================================================================================================

AncillaAdd_SuperBombExplosion:
#_098DF9: PHB
#_098DFA: PHK
#_098DFB: PLB

#_098DFC: JSR Ancilla_AddAncilla
#_098DFF: BCC .free_slot

#_098E01: BRL .exit

.free_slot
#_098E04: STZ.w $03EA,X
#_098E07: STZ.w $0C54,X

#_098E0A: STZ.w $03C2,X
#_098E0D: STZ.w $0385,X

#_098E10: LDA.l Bomb_timer+1
#_098E14: STA.w $039F,X

#_098E17: LDA.b #$01
#_098E19: STA.w $0C5E,X

#_098E1C: PHX

#_098E1D: LDX.w $02CF

#_098E20: LDA.w $1A00,X
#_098E23: STA.b $00

#_098E25: LDA.w $1A14,X
#_098E28: STA.b $01

#_098E2A: LDA.w $1A28,X
#_098E2D: STA.b $02

#_098E2F: LDA.w $1A3C,X
#_098E32: STA.b $03

#_098E34: PLX

#_098E35: REP #$20

#_098E37: LDA.b $00
#_098E39: CLC
#_098E3A: ADC.w #$0010
#_098E3D: STA.b $00

#_098E3F: LDA.b $02
#_098E41: CLC
#_098E42: ADC.w #$0008
#_098E45: STA.b $02

#_098E47: SEP #$20

#_098E49: BRL AncillaInit_SetCoordsAndExit

.exit
#_098E4C: PLB

#_098E4D: RTL

;===================================================================================================

ConfigureRevivalAncillae:
#_098E4E: PHB
#_098E4F: PHK
#_098E50: PLB

#_098E51: LDA.b #$50
#_098E53: STA.w $0109

#_098E56: LDX.b #$00

#_098E58: LDA.b #$40
#_098E5A: STA.w $039F,X

#_098E5D: STZ.w $0C54,X

#_098E60: LDA.b #$08
#_098E62: STA.w $0294,X

#_098E65: STZ.w $0385,X

#_098E68: LDA.b #$05
#_098E6A: STA.w $0394,X

#_098E6D: STZ.w $0C5E,X
#_098E70: STZ.w $0380,X

#_098E73: REP #$20

#_098E75: LDA.b $20
#_098E77: STA.b $00

#_098E79: LDA.b $22
#_098E7B: STA.b $02

#_098E7D: SEP #$20

#_098E7F: JSR Ancilla_SetCoordinates

#_098E82: STZ.w $029E,X

#_098E85: INX

#_098E86: STZ.w $029E,X

#_098E89: LDA.b #$F0
#_098E8B: STA.w $039F,X

#_098E8E: STZ.w $0C54,X
#_098E91: STZ.w $0380,X

#_098E94: INX

#_098E95: LDA.b #$02
#_098E97: STA.w $0C5E,X
#_098E9A: STA.b $00

#_098E9C: INC A
#_098E9D: STA.w $03B1,X

#_098EA0: LDA.b #$08
#_098EA2: STA.w $039F,X

#_098EA5: STZ.w $0C54,X

;---------------------------------------------------------------------------------------------------

#_098EA8: PHX

#_098EA9: LDA.b #$03
#_098EAB: STA.w $0C72,X

#_098EAE: TAX

#_098EAF: LDA.l PowderDraw_group_offset,X
#_098EB3: CLC
#_098EB4: ADC.b $00
#_098EB6: TAX

#_098EB7: LDA.l PowderDraw_anim_step,X

#_098EBB: PLX

#_098EBC: STA.w $03C2,X

#_098EBF: LDY.b #$06

#_098EC1: REP #$20

#_098EC3: LDA.b $20
#_098EC5: CLC
#_098EC6: ADC.w AncillaAdd_MagicPowder_offset_y,Y

#_098EC9: CLC
#_098ECA: ADC.w #$FFEC
#_098ECD: STA.b $00

#_098ECF: LDA.b $22
#_098ED1: CLC
#_098ED2: ADC.w #$FFF8

#_098ED5: CLC
#_098ED6: ADC.w AncillaAdd_MagicPowder_offset_x,Y
#_098ED9: STA.b $02

#_098EDB: SEP #$20

#_098EDD: BRL AncillaInit_SetCoordsAndExit

;===================================================================================================

AncillaAdd_CaneOfByrnaInitSpark:
#_098EE0: PHB
#_098EE1: PHK
#_098EE2: PLB

#_098EE3: PHA

;---------------------------------------------------------------------------------------------------

#_098EE4: LDX.b #$04

.next_clear
#_098EE6: LDA.w $0C4A,X
#_098EE9: CMP.b #$31 ; ANCILLA 31
#_098EEB: BNE .not_spark

#_098EED: STZ.w $0C4A,X

.not_spark
#_098EF0: DEX
#_098EF1: BPL .next_clear

;---------------------------------------------------------------------------------------------------

#_098EF3: PLA
#_098EF4: JSR Ancilla_AddAncilla
#_098EF7: BCS .exit

#_098EF9: STZ.w $0C5E,X

#_098EFC: LDA.b #$09
#_098EFE: STA.w $03B1,X

#_098F01: LDA.b #$01
#_098F03: STA.w $037B

#_098F06: INC A
#_098F07: STA.w $039F,X

.exit
#_098F0A: PLB

#_098F0B: RTL

;===================================================================================================

pool AncillaAdd_LampFlame

.offset_y
#_098F0C: dw -16 ; up
#_098F0E: dw  24 ; down
#_098F10: dw   4 ; left
#_098F12: dw   4 ; right

.offset_x
#_098F14: dw   0 ; up
#_098F16: dw   0 ; down
#_098F18: dw -20 ; left
#_098F1A: dw  18 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_LampFlame:
#_098F1C: PHB
#_098F1D: PHK
#_098F1E: PLB

#_098F1F: JSR Ancilla_AddAncilla
#_098F22: BCS .exit

#_098F24: STZ.w $0C5E,X
#_098F27: STZ.w $03B1,X

#_098F2A: LDA.b #$17
#_098F2C: STA.w $0C68,X

#_098F2F: LDA.b $2F
#_098F31: LSR A
#_098F32: STA.w $0C72,X

#_098F35: LDY.b $2F

#_098F37: REP #$20

#_098F39: LDA.b $20
#_098F3B: CLC
#_098F3C: ADC.w .offset_y,Y
#_098F3F: STA.b $00

#_098F41: LDA.b $22
#_098F43: CLC
#_098F44: ADC.w .offset_x,Y
#_098F47: STA.b $02

#_098F49: SEP #$20

#_098F4B: JSR Ancilla_SetCoordinates
#_098F4E: JSL Ancilla_CalculateSFXPan

#_098F52: ORA.b #$2A ; SFX2.2A
#_098F54: STA.w $012E

#_098F57: PLB

#_098F58: RTL

.exit
#_098F59: PLB

#_098F5A: RTL

;===================================================================================================

AncillaAdd_ShovelDirt:
#_098F5B: PHB
#_098F5C: PHK
#_098F5D: PLB

#_098F5E: JSR Ancilla_AddAncilla
#_098F61: BCS .exit

#_098F63: STZ.w $0C5E,X

#_098F66: LDA.b #$14
#_098F68: STA.w $0C68,X

#_098F6B: REP #$20

#_098F6D: LDA.b $20
#_098F6F: STA.b $00

#_098F71: LDA.b $22
#_098F73: STA.b $02

#_098F75: SEP #$20

#_098F77: BRL AncillaInit_SetCoordsAndExit

.exit
#_098F7A: PLB

#_098F7B: RTL

;===================================================================================================

AncillaAdd_MSCutscene:
#_098F7C: PHB
#_098F7D: PHK
#_098F7E: PLB

#_098F7F: JSR Ancilla_AddAncilla
#_098F82: BCS .exit

#_098F84: STZ.w $0C5E,X

#_098F87: LDA.b #$02
#_098F89: STA.w $03B1,X

#_098F8C: LDA.b #$40
#_098F8E: STA.w $0C68,X

#_098F91: REP #$20

#_098F93: LDA.b $20
#_098F95: CLC
#_098F96: ADC.w #$FFF8
#_098F99: STA.b $00

#_098F9B: LDA.b $22
#_098F9D: CLC
#_098F9E: ADC.w #$0008
#_098FA1: STA.b $02

#_098FA3: SEP #$20

#_098FA5: BRL AncillaInit_SetCoordsAndExit

.exit
#_098FA8: PLB

#_098FA9: RTL

;===================================================================================================

pool AncillaAdd_DashDust

.offset_y
#_098FAA: dw $14 ; up
#_098FAC: dw $04 ; down
#_098FAE: dw $10 ; left
#_098FB0: dw $10 ; right

.offset_x
#_098FB2: dw $04 ; up
#_098FB4: dw $04 ; down
#_098FB6: dw $06 ; left
#_098FB8: dw $00 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_DashDust:
#_098FBA: PHB
#_098FBB: PHK
#_098FBC: PLB

#_098FBD: LDX.b #$01
#_098FBF: BRA .continue

;---------------------------------------------------------------------------------------------------

#AncillaAdd_DashDust_charging:
#_098FC1: PHB
#_098FC2: PHK
#_098FC3: PLB

#_098FC4: LDX.b #$00

.continue
#_098FC6: STX.b $72

#_098FC8: JSR Ancilla_AddAncilla
#_098FCB: BCS .exit

#_098FCD: LDA.b $72
#_098FCF: STA.w $0C54,X

#_098FD2: STZ.w $0C5E,X

#_098FD5: LDA.b #$03
#_098FD7: STA.w $0C68,X

#_098FDA: LDY.b $2F
#_098FDC: TYA
#_098FDD: LSR A
#_098FDE: STA.w $0C72,X

#_098FE1: LDA.b $72
#_098FE3: BNE .mobile

;---------------------------------------------------------------------------------------------------

.immobile
#_098FE5: REP #$20

#_098FE7: LDA.b $20
#_098FE9: CLC
#_098FEA: ADC.w #$0014
#_098FED: STA.b $00

#_098FEF: LDA.b $22
#_098FF1: STA.b $02

#_098FF3: SEP #$20

#_098FF5: JMP.w AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.mobile
#_098FF8: REP #$20

#_098FFA: LDA.b $20
#_098FFC: CLC
#_098FFD: ADC.w .offset_y,Y
#_099000: STA.b $00

#_099002: LDA.b $22
#_099004: CLC
#_099005: ADC.w .offset_x,Y
#_099008: STA.b $02

#_09900A: SEP #$20

#_09900C: JMP.w AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_09900F: PLB

#_099010: RTL

;===================================================================================================

pool AncillaAdd_BlastWallFireball

.speed
#_099011: db -64,   0
#_099013: db -22,  42
#_099015: db -38,  38
#_099017: db -42,  22
#_099019: db   0,  64
#_09901B: db  22,  42
#_09901D: db  38,  38
#_09901F: db  42,  22
#_099021: db  64,   0
#_099023: db  22, -42
#_099025: db  38, -38
#_099027: db  42, -22
#_099029: db   0, -64
#_09902B: db -22, -42
#_09902D: db -38, -38
#_09902F: db -42, -22

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_BlastWallFireball:
#_099031: PHB
#_099032: PHK
#_099033: PLB

#_099034: LDX.b #$0A

.check_next
#_099036: LDA.w $0C4A,X
#_099039: BEQ .free_slot

#_09903B: DEX
#_09903C: CPX.b #$04
#_09903E: BNE .check_next

#_099040: LDX.b #$FF

#_099042: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_099045: LDA.b #$32 ; ANCILLA 32
#_099047: STA.w $0C4A,X

#_09904A: LDA.b $EE
#_09904C: STA.w $0C7C,X

#_09904F: LDA.b #$10
#_099051: STA.l $7F0040,X

#_099055: LDA.b $1A
#_099057: AND.b #$0F
#_099059: ASL A
#_09905A: TAY

#_09905B: LDA.w .speed+0,Y
#_09905E: STA.w $0C22,X

#_099061: LDA.w .speed+1,Y
#_099064: STA.w $0C2C,X

#_099067: REP #$20

#_099069: PHX

#_09906A: LDX.b $04

#_09906C: LDA.l $7F0020,X
#_099070: CLC
#_099071: ADC.w #$0008
#_099074: STA.b $00

#_099076: LDA.l $7F0030,X
#_09907A: CLC
#_09907B: ADC.w #$0010
#_09907E: STA.b $02

#_099080: PLX

#_099081: SEP #$20

#_099083: BRL AncillaInit_SetCoordsAndExit

.exit
#_099086: PLB

#_099087: RTL

;===================================================================================================

pool AncillaAdd_Arrow

.speed_y
#_099088: db -48 ; up
#_099089: db  48 ; down
#_09908A: db   0 ; left
#_09908B: db   0 ; right

.speed_x
#_09908C: db   0 ; up
#_09908D: db   0 ; down
#_09908E: db -48 ; left
#_09908F: db  48 ; right

.unused
#_099090: db $08 ; up
#_099091: db $04 ; down
#_099092: db $02 ; left
#_099093: db $01 ; right

.offset_y
#_099094: dw  -4 ; up
#_099096: dw   3 ; down
#_099098: dw   4 ; left
#_09909A: dw   4 ; right

.offset_x
#_09909C: dw   4 ; up
#_09909E: dw   4 ; down
#_0990A0: dw   0 ; left
#_0990A2: dw   4 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_Arrow:
#_0990A4: PHB
#_0990A5: PHK
#_0990A6: PLB

#_0990A7: STX.b $76

#_0990A9: JSR AncillaAdd_CheckForPresence
#_0990AC: BCC .none_exist

#_0990AE: BRL .exit

.none_exist
#_0990B1: JSR AncillaAdd_ArrowFindSlot
#_0990B4: BCC .free_slot

#_0990B6: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_0990B9: JSL Link_CalculateSFXPan
#_0990BD: ORA.b #$07 ; SFX2.07
#_0990BF: STA.w $012E

#_0990C2: STZ.w $03C5,X

#_0990C5: LDA.b #$08
#_0990C7: STA.w $0C5E,X

#_0990CA: LDA.b $76
#_0990CC: LSR A
#_0990CD: TAY

#_0990CE: ORA.b #$04
#_0990D0: STA.w $0C72,X

#_0990D3: LDA.w .speed_y,Y
#_0990D6: STA.w $0C22,X

#_0990D9: LDA.w .speed_x,Y
#_0990DC: STA.w $0C2C,X

#_0990DF: LDY.b $76

#_0990E1: REP #$20

#_0990E3: LDA.b $72
#_0990E5: CLC
#_0990E6: ADC.w #$0008
#_0990E9: CLC
#_0990EA: ADC.w .offset_y,Y
#_0990ED: STA.b $00

#_0990EF: LDA.b $74
#_0990F1: CLC
#_0990F2: ADC.w .offset_x,Y
#_0990F5: STA.b $02

#_0990F7: SEP #$20

#_0990F9: JSR Ancilla_SetCoordinates

#_0990FC: SEC

#_0990FD: PLB

#_0990FE: RTL

;---------------------------------------------------------------------------------------------------

.exit
#_0990FF: CLC

#_099100: PLB

#_099101: RTL

;===================================================================================================

AncillaAdd_BunnyPoof:
#_099102: PHB
#_099103: PHK
#_099104: PLB

#_099105: JSR Ancilla_AddAncilla
#_099108: BCS EXIT_09915D

#_09910A: LDA.b #$0C
#_09910C: STA.b $4B

#_09910E: STZ.w $0C54,X

#_099111: LDA.w $02E0
#_099114: BNE .bunny

#_099116: JSL Link_CalculateSFXPan
#_09911A: ORA.b #$14 ; SFX2.14
#_09911C: STA.w $012E

#_09911F: BRA .proceed

.bunny
#_099121: JSL Link_CalculateSFXPan
#_099125: ORA.b #$15 ; SFX2.15
#_099127: STA.w $012E

.proceed
#_09912A: BRA AncillaAdd_ArbitraryPoof

;===================================================================================================

AncillaAdd_CapePoof:
#_09912C: PHB
#_09912D: PHK
#_09912E: PLB

#_09912F: JSR Ancilla_AddAncilla
#_099132: BCS EXIT_09915D

#_099134: LDA.b #$01
#_099136: STA.w $0C54,X
#_099139: STA.w $02E1

#_09913C: TSB.b $50

#_09913E: STZ.b $67
#_099140: STZ.b $26

;===================================================================================================

AncillaAdd_ArbitraryPoof:
#_099142: STZ.w $0C5E,X

#_099145: LDA.b #$07
#_099147: STA.w $03B1,X

#_09914A: REP #$20

#_09914C: LDA.b $20
#_09914E: CLC
#_09914F: ADC.w #$0004
#_099152: STA.b $00

#_099154: LDA.b $22
#_099156: STA.b $02

#_099158: SEP #$20

#_09915A: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_09915D:
#_09915D: PLB

#_09915E: RTL

;===================================================================================================

AncillaAdd_DwarfPoof:
#_09915F: PHB
#_099160: PHK
#_099161: PLB

#_099162: JSR Ancilla_AddAncilla
#_099165: BCS .exit

#_099167: LDA.l $7EF3CC
#_09916B: CMP.b #$08 ; FOLLOWER 08
#_09916D: BNE .not_dwarf

#_09916F: JSL Link_CalculateSFXPan
#_099173: ORA.b #$14 ; SFX2.14
#_099175: STA.w $012E

#_099178: BRA .continue

.not_dwarf
#_09917A: JSL Link_CalculateSFXPan
#_09917E: ORA.b #$15 ; SFX2.15
#_099180: STA.w $012E

;---------------------------------------------------------------------------------------------------

.continue
#_099183: STZ.w $0C5E,X
#_099186: STZ.w $0C54,X

#_099189: LDA.b #$07
#_09918B: STA.w $03B1,X

#_09918E: LDA.b #$01
#_099190: STA.w $02F9

#_099193: LDY.w $02CF

#_099196: LDA.w $1A00,Y
#_099199: STA.b $00

#_09919B: LDA.w $1A14,Y
#_09919E: STA.b $01

#_0991A0: LDA.w $1A28,Y
#_0991A3: STA.b $02

#_0991A5: LDA.w $1A3C,Y
#_0991A8: STA.b $03

#_0991AA: REP #$20

#_0991AC: LDA.b $00
#_0991AE: CLC
#_0991AF: ADC.w #$0004
#_0991B2: STA.b $00

#_0991B4: LDA.b $02
#_0991B6: CLC
#_0991B7: ADC.w #$0000
#_0991BA: STA.b $02

#_0991BC: SEP #$20

#_0991BE: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_0991C1: PLB

#_0991C2: RTL

;===================================================================================================

AncillaAdd_BushPoof:
#_0991C3: PHB
#_0991C4: PHK
#_0991C5: PLB

#_0991C6: LDA.w $0301
#_0991C9: AND.b #$40
#_0991CB: BEQ .exit

#_0991CD: LDY.b #$04
#_0991CF: LDA.b #$3F ; ANCILLA 3F
#_0991D1: JSR Ancilla_AddAncilla
#_0991D4: BCS .exit

#_0991D6: STZ.w $0C5E,X

#_0991D9: LDA.b #$07
#_0991DB: STA.w $0C68,X

#_0991DE: JSL Link_CalculateSFXPan
#_0991E2: ORA.b #$15 ; SFX2.15
#_0991E4: STA.w $012E

#_0991E7: REP #$20

#_0991E9: LDA.b $74
#_0991EB: CLC
#_0991EC: ADC.w #$FFFE
#_0991EF: STA.b $00

#_0991F1: LDA.b $72
#_0991F3: STA.b $02

#_0991F5: SEP #$20

#_0991F7: JMP.w AncillaInit_SetCoordsAndExit

.exit
#_0991FA: PLB

#_0991FB: RTL

;===================================================================================================

AncillaAdd_EtherSpell:
#_0991FC: PHB
#_0991FD: PHK
#_0991FE: PLB

#_0991FF: JSR Ancilla_AddAncilla
#_099202: BCC .free_slot

#_099204: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_099207: STZ.w $0C5E,X

#_09920A: STZ.w $03C2,X

#_09920D: STZ.w $0C54,X

#_099210: LDA.b #$01
#_099212: STA.w $0112

#_099215: INC A
#_099216: STA.w $03B1,X

#_099219: INC A
#_09921A: STA.w $039F,X

#_09921D: LDA.b #$7F
#_09921F: STA.w $0C22,X

#_099222: LDA.b #$28
#_099224: STA.l $7F5808

#_099228: LDA.b #$09
#_09922A: STA.w $0AAA

#_09922D: LDA.b #$40
#_09922F: STA.l $7F5812

#_099233: JSL Link_CalculateSFXPan
#_099237: ORA.b #$26 ; SFX3.26
#_099239: STA.w $012F

#_09923C: LDA.b #$00
#_09923E: STA.l $7F5800

#_099242: LDA.b #$08
#_099244: STA.l $7F5801

#_099248: LDA.b #$10
#_09924A: STA.l $7F5802

#_09924E: LDA.b #$18
#_099250: STA.l $7F5803

#_099254: LDA.b #$20
#_099256: STA.l $7F5804

#_09925A: LDA.b #$28
#_09925C: STA.l $7F5805

#_099260: LDA.b #$30
#_099262: STA.l $7F5806

#_099266: LDA.b #$38
#_099268: STA.l $7F5807

;---------------------------------------------------------------------------------------------------

#_09926C: REP #$20

#_09926E: LDA.b $20
#_099270: STA.l $7F5813

#_099274: LDA.w #$FFF0
#_099277: CLC
#_099278: ADC.b $E8
#_09927A: STA.b $00

#_09927C: AND.w #$00F0
#_09927F: STA.l $7F580C

#_099283: LDA.b $22
#_099285: STA.b $02
#_099287: STA.l $7F5815

#_09928B: CLC
#_09928C: ADC.w #$0008
#_09928F: STA.l $7F580E

#_099293: LDA.b $20
#_099295: SEC
#_099296: SBC.w #$0010

#_099299: STA.l $7F580A
#_09929D: CLC
#_09929E: ADC.w #$0024
#_0992A1: STA.l $7F5810

#_0992A5: SEP #$20

#_0992A7: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_0992AA: PLB

#_0992AB: RTL

;===================================================================================================

AncillaAdd_VictorySpin:
#_0992AC: PHB
#_0992AD: PHK
#_0992AE: PLB

#_0992AF: LDA.l $7EF359
#_0992B3: INC A
#_0992B4: AND.b #$FE
#_0992B6: BEQ .exit

#_0992B8: LDY.b #$00
#_0992BA: LDA.b #$3B ; ANCILLA 3B
#_0992BC: JSR Ancilla_AddAncilla
#_0992BF: BCS .exit

#_0992C1: STZ.w $0C5E,X

#_0992C4: LDA.b #$01
#_0992C6: STA.w $039F,X

#_0992C9: LDA.b #$22
#_0992CB: STA.w $03B1,X

.exit
#_0992CE: PLB

#_0992CF: RTL

;===================================================================================================

pool AncillaAdd_MagicPowder

.offset_y
#_0992D0: dw   1 ; up
#_0992D2: dw  40 ; down
#_0992D4: dw  22 ; left
#_0992D6: dw  22 ; right

.offset_x
#_0992D8: dw  10 ; up
#_0992DA: dw  10 ; down
#_0992DC: dw  -8 ; left
#_0992DE: dw  28 ; right

.tile_check_offset_y
#_0992E0: dw   0 ; up
#_0992E2: dw  20 ; down
#_0992E4: dw  16 ; left
#_0992E6: dw  16 ; right

.tile_check_offset_x
#_0992E8: dw  -2 ; up
#_0992EA: dw  -2 ; down
#_0992EC: dw -12 ; left
#_0992EE: dw  12 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_MagicPowder:
#_0992F0: PHB
#_0992F1: PHK
#_0992F2: PLB

#_0992F3: JSR Ancilla_AddAncilla
#_0992F6: BCC .free_slot

#_0992F8: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_0992FB: STZ.w $0C5E,X
#_0992FE: STZ.w $029E,X

#_099301: LDA.b #$01
#_099303: STA.w $03B1,X

#_099306: LDA.b #$50
#_099308: STA.w $0109

#_09930B: PHX

#_09930C: LDY.b $2F

#_09930E: TYA
#_09930F: LSR A
#_099310: STA.w $0C72,X

#_099313: TAX

#_099314: LDA.l PowderDraw_group_offset,X
#_099318: TAX

#_099319: LDA.l PowderDraw_anim_step,X

#_09931D: PLX

#_09931E: STA.w $03C2,X

;---------------------------------------------------------------------------------------------------

#_099321: LDY.b $2F

#_099323: REP #$20

#_099325: LDA.b $20
#_099327: CLC
#_099328: ADC.w .tile_check_offset_y,Y
#_09932B: STA.b $04

#_09932D: LDA.b $22
#_09932F: CLC
#_099330: ADC.w .tile_check_offset_x,Y
#_099333: STA.b $06

#_099335: SEP #$20

#_099337: LDA.b $04
#_099339: STA.w $0BFA,X

#_09933C: LDA.b $05
#_09933E: STA.w $0C0E,X

#_099341: LDA.b $06
#_099343: STA.w $0C04,X

#_099346: LDA.b $07
#_099348: STA.w $0C18,X

#_09934B: JSL Ancilla_CheckTileCollision_long

#_09934F: LDA.w $03E4,X
#_099352: STA.w $0333

;---------------------------------------------------------------------------------------------------

#_099355: LDA.w $0304
#_099358: CMP.b #$09
#_09935A: BNE .not_lamp

#_09935C: STZ.w $0C4A,X

#_09935F: BRA .exit

.not_lamp
#_099361: LDY.b $2F

#_099363: REP #$20

#_099365: LDA.b $20
#_099367: CLC
#_099368: ADC.w .offset_y,Y
#_09936B: STA.b $00

#_09936D: LDA.b $22
#_09936F: CLC
#_099370: ADC.w .offset_x,Y
#_099373: STA.b $02

#_099375: SEP #$20

#_099377: JSL Link_CalculateSFXPan
#_09937B: ORA.b #$0D ; SFX2.0D
#_09937D: STA.w $012E

#_099380: JMP.w AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_099383: PLB

#_099384: RTL

;===================================================================================================

pool AncillaAdd_WallTapSpark

.offset_y
#_099385: dw  -4 ; up
#_099387: dw  32 ; down
#_099389: dw  17 ; left
#_09938B: dw  17 ; right

.offset_x
#_09938D: dw  11 ; up
#_09938F: dw  10 ; down
#_099391: dw -12 ; left
#_099393: dw  29 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_WallTapSpark:
#_099395: PHB
#_099396: PHK
#_099397: PLB

#_099398: JSR Ancilla_AddAncilla
#_09939B: BCS .exit

#_09939D: LDA.b #$05
#_09939F: STA.w $0C5E,X

#_0993A2: LDA.b #$01
#_0993A4: STA.w $03B1,X

#_0993A7: LDY.b $2F

#_0993A9: REP #$20

#_0993AB: LDA.b $20
#_0993AD: CLC
#_0993AE: ADC.w .offset_y,Y
#_0993B1: STA.b $00

#_0993B3: LDA.b $22
#_0993B5: CLC
#_0993B6: ADC.w .offset_x,Y
#_0993B9: STA.b $02

#_0993BB: SEP #$20

#_0993BD: BRL AncillaInit_SetCoordsAndExit

.exit
#_0993C0: PLB

#_0993C1: RTL

;===================================================================================================

AncillaAdd_SwordSwingSparkle:
#_0993C2: PHB
#_0993C3: PHK
#_0993C4: PLB

#_0993C5: JSR Ancilla_AddAncilla
#_0993C8: BCS .exit

#_0993CA: STZ.w $0C5E,X

#_0993CD: LDA.b #$01
#_0993CF: STA.w $03B1,X

#_0993D2: LDA.b $2F
#_0993D4: LSR A
#_0993D5: STA.w $0C72,X

#_0993D8: REP #$20

#_0993DA: LDA.b $20
#_0993DC: STA.b $00

#_0993DE: LDA.b $22
#_0993E0: STA.b $02

#_0993E2: SEP #$20

#_0993E4: BRL AncillaInit_SetCoordsAndExit

.exit
#_0993E7: PLB

#_0993E8: RTL

;===================================================================================================

pool AncillaAdd_DashTremor

.directional_data_offset
#_0993E9: db $02 ; up
#_0993EA: db $02 ; down
#_0993EB: db $00 ; left
#_0993EC: db $00 ; right

.offset
#_0993ED: dw   3 ; vertical
#_0993EF: dw  -3 ; horizontal

.threshold
#_0993F1: db $80 ; vertical
#_0993F2: db $78 ; horizontal

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_DashTremor:
#_0993F3: PHB
#_0993F4: PHK
#_0993F5: PLB

#_0993F6: JSR AncillaAdd_CheckForPresence
#_0993F9: BCS .exit

#_0993FB: JSR Ancilla_AddAncilla
#_0993FE: BCS .exit

#_099400: LDA.b #$10
#_099402: STA.w $0C5E,X

#_099405: STZ.w $0385,X

#_099408: LDA.b $2F
#_09940A: LSR A
#_09940B: TAY

#_09940C: LDA.w .directional_data_offset,Y
#_09940F: STA.w $0C72,X

#_099412: TAY

#_099413: REP #$20

#_099415: LDA.b $20
#_099417: SEC
#_099418: SBC.b $E8
#_09941A: STA.b $02

#_09941C: LDA.b $22
#_09941E: SEC
#_09941F: SBC.b $E2
#_099421: STA.b $00

#_099423: SEP #$20

#_099425: PHX

#_099426: TYA
#_099427: LSR A
#_099428: TAX

#_099429: LDA.w .threshold,X
#_09942C: STA.b $06

#_09942E: TYX

#_09942F: LDY.b #$00

#_099431: LDA.b $00,X
#_099433: CMP.b $06
#_099435: BCC .left_or_up

#_099437: LDY.b #$02

.left_or_up
#_099439: PLX

#_09943A: LDA.w .offset+0,Y
#_09943D: STA.w $0BFA,X

#_099440: LDA.w .offset+1,Y
#_099443: STA.w $0C0E,X

.exit
#_099446: PLB

#_099447: RTL

;===================================================================================================

pool WallClink

.offset_y
#_099448: dw   0,   8,   8,   8
#_099450: dw   4,   8,  12,   8

.offset_x
#_099458: dw   8,   8,   0,  10
#_099460: dw  12,   8,   4,   0

.offset_index
#_099468: db $00, $06, $04, $00
#_09946C: db $02, $0A, $0C, $00
#_099470: db $00, $08, $0E, $00
#_099474: db $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_BoomerangWallClink:
#_099478: PHB
#_099479: PHK
#_09947A: PLB

#_09947B: LDA.w $0BFA,X
#_09947E: STA.w $0399

#_099481: LDA.w $0C0E,X
#_099484: STA.w $039A

#_099487: LDA.w $0C04,X
#_09948A: STA.w $039B

#_09948D: LDA.w $0C18,X
#_099490: STA.w $039C

;---------------------------------------------------------------------------------------------------

#_099493: LDY.b #$01
#_099495: LDA.b #$06 ; ANCILLA 06
#_099497: JSR Ancilla_AddAncilla
#_09949A: BCS EXIT_0994C4

#_09949C: STZ.w $0C5E,X

#_09949F: LDA.b #$01
#_0994A1: STA.w $039F,X

#_0994A4: LDY.w $039D

#_0994A7: LDA.w WallClink_offset_index,Y
#_0994AA: TAY

#_0994AB: REP #$20

#_0994AD: LDA.w $0399
#_0994B0: CLC
#_0994B1: ADC.w WallClink_offset_y,Y
#_0994B4: STA.b $00

#_0994B6: LDA.w $039B
#_0994B9: CLC
#_0994BA: ADC.w WallClink_offset_x,Y
#_0994BD: STA.b $02

#_0994BF: SEP #$20

#_0994C1: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_0994C4:
#_0994C4: PLB

#_0994C5: RTL

;===================================================================================================

AncillaAdd_HookshotWallClink:
#_0994C6: PHB
#_0994C7: PHK
#_0994C8: PLB

#_0994C9: STX.b $74

#_0994CB: JSR Ancilla_AddAncilla
#_0994CE: BCS EXIT_0994C4

;---------------------------------------------------------------------------------------------------

#_0994D0: STZ.w $0C5E,X

#_0994D3: LDA.b #$01
#_0994D5: STA.w $039F,X

#_0994D8: PHX

#_0994D9: LDX.b $74
#_0994DB: JSR Ancilla_GetCoordinates

#_0994DE: LDA.w $0C72,X
#_0994E1: ASL A
#_0994E2: TAY

#_0994E3: REP #$20

#_0994E5: LDA.b $00
#_0994E7: CLC
#_0994E8: ADC.w WallClink_offset_y,Y
#_0994EB: STA.b $00

#_0994ED: LDA.b $02
#_0994EF: CLC
#_0994F0: ADC.w WallClink_offset_x,Y
#_0994F3: STA.b $02

#_0994F5: SEP #$20

#_0994F7: PLX

#_0994F8: BRL AncillaInit_SetCoordsAndExit

;===================================================================================================

#EXIT_099587_bounce:
#_0994FB: BRL EXIT_099587

;===================================================================================================

AncillaAdd_Duck_take_off:
#_0994FE: PHB
#_0994FF: PHK
#_099500: PLB

#_099501: JSR AncillaAdd_CheckForPresence
#_099504: BCS EXIT_099587_bounce

#_099506: JSR Ancilla_AddAncilla
#_099509: BCS EXIT_099587_bounce

;---------------------------------------------------------------------------------------------------

#_09950B: LDA.b #$78
#_09950D: STA.w $0C68,X

#_099510: STZ.w $0385,X
#_099513: STZ.w $0294,X
#_099516: STZ.w $029E,X

#_099519: LDY.b #$00

#_09951B: BRA AncillaAdd_ArbitraryDuck

;===================================================================================================

AncillaAdd_Duck_drop_off:
#_09951D: PHB
#_09951E: PHK
#_09951F: PLB

#_099520: JSR AncillaAdd_CheckForPresence
#_099523: BCS EXIT_099587

#_099525: JSR Ancilla_AddAncilla
#_099528: BCS EXIT_099587

#_09952A: LDA.b #$00 ; LINKSTATE 00
#_09952C: STA.b $5D

#_09952E: STZ.b $5E

#_099530: LDA.b $3A
#_099532: AND.b #$7E
#_099534: STA.b $3A

#_099536: STZ.b $3C
#_099538: STZ.b $3D

#_09953A: LDA.b $50
#_09953C: AND.b #$FE
#_09953E: STA.b $50

#_099540: LDA.b #$01
#_099542: STA.w $0385,X

#_099545: LDA.b #$28
#_099547: STA.w $0294,X

#_09954A: LDA.b #$CD
#_09954C: STA.w $029E,X

#_09954F: LDY.b #$02

;===================================================================================================

AncillaAdd_ArbitraryDuck:
#_099551: TYA
#_099552: STA.w $0C54,X

#_099555: STZ.w $0C22,X
#_099558: STZ.w $0C5E,X

#_09955B: LDA.b #$01
#_09955D: STA.w $03B1,X

#_099560: LDA.b #$38
#_099562: STA.w $0C2C,X

#_099565: LDA.b #$03
#_099567: STA.w $039F,X

#_09956A: STZ.w $0380,X
#_09956D: STZ.w $0394,X

#_099570: REP #$20

#_099572: LDA.b $20
#_099574: SEC
#_099575: SBC.w #$0008
#_099578: STA.b $00

#_09957A: LDA.w #$FFF0
#_09957D: CLC
#_09957E: ADC.b $E2
#_099580: STA.b $02

#_099582: SEP #$20

#_099584: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_099587:
#_099587: PLB

#_099588: RTL

;===================================================================================================

AncillaAdd_QuakeSpell:
#_099589: PHB
#_09958A: PHK
#_09958B: PLB

#_09958C: JSR Ancilla_AddAncilla
#_09958F: BCC .free_slot

#_099591: BRL .exit

.free_slot
#_099594: STZ.w $0C54,X
#_099597: STZ.w $0C5E,X

#_09959A: LDA.b #$0D
#_09959C: STA.w $0AAA

#_09959F: LDA.b #$35 ; SFX2.35
#_0995A1: STA.w $012E

#_0995A4: LDA.b #$00
#_0995A6: STA.l $7F5805
#_0995AA: STA.l $7F5806
#_0995AE: STA.l $7F5807
#_0995B2: STA.l $7F5808
#_0995B6: STA.l $7F5809
#_0995BA: STA.l $7F580A

#_0995BE: INC A
#_0995BF: STA.l $7F5800
#_0995C3: STA.l $7F5801
#_0995C7: STA.l $7F5802
#_0995CB: STA.l $7F5803
#_0995CF: STA.l $7F5804

#_0995D3: STA.w $0112

#_0995D6: INC A
#_0995D7: STA.w $0C68,X

#_0995DA: REP #$20

#_0995DC: LDA.b $20
#_0995DE: CLC
#_0995DF: ADC.w #$001A
#_0995E2: STA.l $7F580B

#_0995E6: LDA.b $22
#_0995E8: CLC
#_0995E9: ADC.w #$0008
#_0995EC: STA.l $7F580D

#_0995F0: LDA.w #$0003
#_0995F3: STA.l $7F581E

#_0995F7: SEP #$20

.exit
#_0995F9: PLB

#_0995FA: RTL

;===================================================================================================

pool AncillaAdd_SpinAttackInitSpark

.offset_y
#_0995FB: dw  32 ; up
#_0995FD: dw  -8 ; down
#_0995FF: dw  10 ; left
#_099601: dw  20 ; right

.offset_x
#_099603: dw  10 ; up
#_099605: dw   7 ; down
#_099607: dw  28 ; left
#_099609: dw -10 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_SpinAttackInitSpark:
#_09960B: PHB
#_09960C: PHK
#_09960D: PLB

#_09960E: STX.b $72

#_099610: JSR Ancilla_AddAncilla
#_099613: BCS .exit

;---------------------------------------------------------------------------------------------------

#_099615: STX.b $00

#_099617: LDX.b #$04

.check_next
#_099619: LDA.w $0C4A,X
#_09961C: CMP.b #$31 ; ANCILLA 31
#_09961E: BNE .not_byrna_spark

#_099620: STZ.w $0C4A,X

.not_byrna_spark
#_099623: DEX
#_099624: BPL .check_next

;---------------------------------------------------------------------------------------------------

#_099626: LDX.b $00
#_099628: STZ.w $0C5E,X

#_09962B: LDY.b #$04

#_09962D: LDA.b $72
#_09962F: STA.w $0C54,X
#_099632: BEQ .useless

#_099634: LDY.b #$04

.useless
#_099636: TYA
#_099637: STA.w $0C68,X

#_09963A: LDA.b #$03
#_09963C: STA.w $03B1,X

#_09963F: LDY.b $2F

#_099641: REP #$20

#_099643: LDA.b $20
#_099645: CLC
#_099646: ADC.w .offset_y,Y
#_099649: STA.b $00

#_09964B: LDA.b $22
#_09964D: CLC
#_09964E: ADC.w .offset_x,Y
#_099651: STA.b $02

#_099653: SEP #$20

#_099655: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_099658: PLB

#_099659: RTL

;===================================================================================================

pool AncillaAdd_BlastWall
.offset_xy
#_09965A: dw  -8,   0 ; up
#_09965E: dw  -8,  16 ; down
#_099662: dw  16,   0 ; left
#_099666: dw  16,  16 ; right

#_09966A: dw   0,  -8 ; up
#_09966E: dw  16,  -8 ; down
#_099672: dw   0,  16 ; left
#_099676: dw  16,  16 ; right

.base_offset_y
#_09967A: dw -16 ; up
#_09967C: dw  16 ; down
#_09967E: dw   0 ; left
#_099680: dw   0 ; right

.base_offset_x
#_099682: dw   0 ; up
#_099684: dw   0 ; down
#_099686: dw -16 ; left
#_099688: dw  16 ; right

pool off

;===================================================================================================

AncillaPanValues:
#_09968A: db $80, $80, $80 ; left
#_09968D: db $00, $00      ; middle
#_09968F: db $40, $40, $40 ; right

;===================================================================================================

AncillaAdd_BlastWall:
#_099692: PHB
#_099693: PHK
#_099694: PLB

#_099695: LDA.b #$33 ; ANCILLA 33
#_099697: STA.w $0C4A
#_09969A: STA.w $0C4B

#_09969D: STZ.w $0C4C
#_0996A0: STZ.w $0C4D
#_0996A3: STZ.w $0C4E
#_0996A6: STZ.w $0C4F

#_0996A9: STZ.w $0C5E
#_0996AC: STZ.w $02EC

#_0996AF: STZ.w $0308
#_0996B2: STZ.b $50
#_0996B4: STZ.w $0380

;---------------------------------------------------------------------------------------------------

#_0996B7: LDA.b $EE
#_0996B9: STA.w $0C7C
#_0996BC: STA.w $0C7D

#_0996BF: LDA.w $0476
#_0996C2: STA.w $03CA

#_0996C5: LDA.b #$00
#_0996C7: STA.l $7F0010
#_0996CB: STA.l $7F0009
#_0996CF: STA.l $7F0001
#_0996D3: STA.l $7F0011

#_0996D7: INC A
#_0996D8: STA.l $7F0000
#_0996DC: STA.w $0112

#_0996DF: LDA.b #$03
#_0996E1: STA.l $7F0008

#_0996E5: LDA.l $7F001C
#_0996E9: TAY

#_0996EA: REP #$20

#_0996EC: LDA.w .base_offset_y,Y
#_0996EF: CLC
#_0996F0: ADC.l $7F0018
#_0996F4: STA.l $7F0018

#_0996F8: LDA.w .base_offset_x,Y
#_0996FB: CLC
#_0996FC: ADC.l $7F001A
#_099700: STA.l $7F001A

#_099704: SEP #$20

#_099706: LDY.b #$00

#_099708: LDA.l $7F001C
#_09970C: CMP.b #$04
#_09970E: BCS .use_second_set

#_099710: LDY.b #$10

.use_second_set
#_099712: LDX.b #$06

;---------------------------------------------------------------------------------------------------

.next
#_099714: REP #$20

#_099716: LDA.w .offset_xy+0,Y
#_099719: CLC
#_09971A: ADC.l $7F0018
#_09971E: STA.l $7F0020,X

#_099722: LDA.w .offset_xy+2,Y
#_099725: CLC
#_099726: ADC.l $7F001A
#_09972A: STA.l $7F0030,X

#_09972E: SEC
#_09972F: SBC.b $E2
#_099731: STA.b $00

#_099733: SEP #$20

#_099735: LDA.b $01
#_099737: BNE .to_next

#_099739: PHY
#_09973A: PHX

#_09973B: LDA.b $00
#_09973D: LSR A
#_09973E: LSR A
#_09973F: LSR A
#_099740: LSR A
#_099741: LSR A
#_099742: TAX

#_099743: LDA.w AncillaPanValues,X
#_099746: ORA.b #$0C ; SFX2.0C
#_099748: STA.w $012E

#_09974B: PLX
#_09974C: PLY

.to_next
#_09974D: INY
#_09974E: INY
#_09974F: INY
#_099750: INY

#_099751: DEX
#_099752: DEX
#_099753: BPL .next

;---------------------------------------------------------------------------------------------------

#_099755: PLB

#_099756: RTL

;===================================================================================================

AncillaAdd_SwordChargeSparkle:
#_099757: PHB
#_099758: PHK
#_099759: PLB

#_09975A: STX.b $72

#_09975C: LDX.b #$09

.check_next
#_09975E: LDA.w $0C4A,X
#_099761: BEQ .free_slot

#_099763: DEX
#_099764: BPL .check_next

#_099766: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_099769: LDA.b #$3C ; ANCILLA 3C
#_09976B: STA.w $0C4A,X

#_09976E: LDA.b $EE
#_099770: STA.w $0C7C,X

#_099773: STZ.w $0C5E,X

#_099776: LDA.b #$04
#_099778: STA.w $0C68,X

#_09977B: JSL GetRandomNumber
#_09977F: STA.b $08

#_099781: PHX

#_099782: LDX.b $72

#_099784: JSR Ancilla_GetCoordinates

#_099787: STZ.b $0B

#_099789: LDA.w $029E,X

#_09978C: CMP.b #$F8
#_09978E: BCC .dont_zero

#_099790: LDA.b #$00

.dont_zero
#_099792: STA.b $0A

#_099794: PLX

#_099795: LDA.b $08
#_099797: AND.b #$0F
#_099799: STA.b $04
#_09979B: STZ.b $05

#_09979D: LDA.b $08
#_09979F: LSR A
#_0997A0: LSR A
#_0997A1: LSR A
#_0997A2: LSR A
#_0997A3: LSR A
#_0997A4: STA.b $06
#_0997A6: STZ.b $07

#_0997A8: REP #$20

#_0997AA: LDA.b $0A
#_0997AC: EOR.w #$FFFF
#_0997AF: INC A
#_0997B0: CLC
#_0997B1: ADC.b $00
#_0997B3: CLC
#_0997B4: ADC.w #$FFFE
#_0997B7: CLC
#_0997B8: ADC.b $04
#_0997BA: STA.b $00

#_0997BC: LDA.b $02
#_0997BE: CLC
#_0997BF: ADC.b $06
#_0997C1: CLC
#_0997C2: ADC.w #$0002
#_0997C5: STA.b $02

#_0997C7: SEP #$20

#_0997C9: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_0997CC: PLB

#_0997CD: RTL

;===================================================================================================

pool AncillaAdd_SilverArrowSparkle

.offset_y
#_0997CE: dw   0
#_0997D0: dw   2
#_0997D2: dw  -4
#_0997D4: dw  -4

.offset_x
#_0997D6: dw  -4
#_0997D8: dw  -4
#_0997DA: dw   0
#_0997DC: dw   2

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_SilverArrowSparkle:
#_0997DE: PHB
#_0997DF: PHK
#_0997E0: PLB

#_0997E1: STX.b $72

#_0997E3: LDX.b #$09

.next_slot
#_0997E5: LDA.w $0C4A,X
#_0997E8: BEQ .free_slot

#_0997EA: DEX
#_0997EB: BPL .next_slot

#_0997ED: BRL EXIT_099849

;---------------------------------------------------------------------------------------------------

.free_slot
#_0997F0: LDA.b #$3C ; ANCILLA 3C
#_0997F2: STA.w $0C4A,X

#_0997F5: STZ.w $0C5E,X

#_0997F8: LDA.b #$04
#_0997FA: STA.w $0C68,X

#_0997FD: LDA.b $EE
#_0997FF: STA.w $0C7C,X

#_099802: JSL GetRandomNumber
#_099806: STA.b $08

#_099808: PHX

#_099809: LDX.b $72

#_09980B: JSR Ancilla_GetCoordinates

#_09980E: STZ.b $0B

#_099810: LDA.b $08
#_099812: AND.b #$07
#_099814: STA.b $04
#_099816: STZ.b $05

#_099818: LDA.b $08
#_09981A: AND.b #$70
#_09981C: LSR A
#_09981D: LSR A
#_09981E: LSR A
#_09981F: LSR A
#_099820: STA.b $06
#_099822: STZ.b $07

#_099824: LDA.w $0C72,X
#_099827: AND.b #$03
#_099829: ASL A
#_09982A: TAY

#_09982B: PLX

#_09982C: REP #$20

#_09982E: LDA.b $00
#_099830: CLC
#_099831: ADC.w .offset_y,Y
#_099834: CLC
#_099835: ADC.b $04
#_099837: STA.b $00

#_099839: LDA.b $02
#_09983B: CLC
#_09983C: ADC.w .offset_x,Y
#_09983F: CLC
#_099840: ADC.b $06
#_099842: STA.b $02

#_099844: SEP #$20

#_099846: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_099849:
#_099849: PLB

#_09984A: RTL

;===================================================================================================

pool AncillaAdd_IceRodShot

.offset_y
#_09984B: dw -16 ; up
#_09984D: dw  24 ; down
#_09984F: dw   8 ; left
#_099851: dw   8 ; right

.offset_x
#_099853: dw   0 ; up
#_099855: dw   0 ; down
#_099857: dw -20 ; left
#_099859: dw  20 ; right

.speed_y
#_09985B: db -48 ; up
#_09985C: db  48 ; down
#_09985D: db   0 ; left
#_09985E: db   0 ; right

.speed_x
#_09985F: db   0 ; up
#_099860: db   0 ; down
#_099861: db -48 ; left
#_099862: db  48 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_IceRodShot:
#_099863: PHB
#_099864: PHK
#_099865: PLB

#_099866: JSR Ancilla_AddAncilla
#_099869: BCC .free_slot

#_09986B: LDX.b #$00
#_09986D: JSL Refund_Magic

#_099871: BRA EXIT_099849

;---------------------------------------------------------------------------------------------------

.free_slot
#_099873: JSL Link_CalculateSFXPan
#_099877: ORA.b #$0F ; SFX2.0F
#_099879: STA.w $012E

#_09987C: STZ.w $0C54,X

#_09987F: STZ.w $03C2,X

#_099882: LDA.b #$FF
#_099884: STA.w $0C5E,X

#_099887: LDA.b #$01
#_099889: STA.w $0385,X

#_09988C: LDA.b #$03
#_09988E: STA.w $03B1,X

#_099891: LDA.b #$06
#_099893: STA.w $039F,X

;---------------------------------------------------------------------------------------------------

#_099896: LDA.b $2F
#_099898: LSR A
#_099899: STA.w $0C72,X

#_09989C: TAY

#_09989D: LDA.w .speed_y,Y
#_0998A0: STA.w $0C22,X

#_0998A3: LDA.w .speed_x,Y
#_0998A6: STA.w $0C2C,X

#_0998A9: PHY
#_0998AA: PHX

#_0998AB: JSL Ancilla_CheckInitialTile_A

#_0998AF: PLX
#_0998B0: PLY

#_0998B1: BCS .explode

;---------------------------------------------------------------------------------------------------

#_0998B3: LDY.b $2F

#_0998B5: REP #$20

#_0998B7: LDA.b $20
#_0998B9: CLC
#_0998BA: ADC.w .offset_y,Y
#_0998BD: STA.b $00

#_0998BF: SEC
#_0998C0: SBC.b $E8
#_0998C2: STA.b $04

#_0998C4: LDA.b $22
#_0998C6: CLC
#_0998C7: ADC.w .offset_x,Y
#_0998CA: STA.b $02

#_0998CC: SEC
#_0998CD: SBC.b $E2
#_0998CF: STA.b $06

#_0998D1: SEP #$20

#_0998D3: LDA.b $05
#_0998D5: ORA.b $07
#_0998D7: BEQ .onscreen

#_0998D9: STZ.w $0C4A,X

#_0998DC: BRA .exit

.onscreen
#_0998DE: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_0998E1: PLB

#_0998E2: RTL

;---------------------------------------------------------------------------------------------------

.explode
#_0998E3: PHX

#_0998E4: LDA.b #$11 ; ANCILLA 11
#_0998E6: STA.w $0C4A,X

#_0998E9: TAX

#_0998EA: LDA.l AncillaObjectAllocation,X

#_0998EE: PLX

#_0998EF: STA.w $0C90,X

#_0998F2: STZ.w $0C5E,X

#_0998F5: LDA.b #$04
#_0998F7: STA.w $03B1,X

#_0998FA: PLB

#_0998FB: RTL

;===================================================================================================

AncillaAdd_Splash:
#_0998FC: PHB
#_0998FD: PHK
#_0998FE: PLB

#_0998FF: JSR Ancilla_AddAncilla
#_099902: BCS .exit

#_099904: JSL Link_CalculateSFXPan
#_099908: ORA.b #$24 ; SFX2.24
#_09990A: STA.w $012E

#_09990D: STZ.w $0C5E,X

#_099910: LDA.b #$02
#_099912: STA.w $03B1,X

#_099915: LDA.b $1B
#_099917: BEQ .dont_reset_layer

#_099919: LDA.w $0345
#_09991C: BNE .dont_reset_layer

#_09991E: STZ.b $EE

.dont_reset_layer
#_099920: REP #$20

#_099922: LDA.b $20
#_099924: CLC
#_099925: ADC.w #$0008
#_099928: STA.b $00

#_09992A: LDA.b $22
#_09992C: CLC
#_09992D: ADC.w #$FFF5
#_099930: STA.b $02

#_099932: SEP #$20

#_099934: JSR Ancilla_SetCoordinates

#_099937: CLC

.exit
#_099938: PLB

#_099939: RTL

;===================================================================================================

pool AncillaAdd_GraveStone

.position_y
#_09993A: dw $0550
#_09993C: dw $0540
#_09993E: dw $0530
#_099940: dw $0520
#_099942: dw $0500
#_099944: dw $04E0
#_099946: dw $04C0
#_099948: dw $04B0

;---------------------------------------------------------------------------------------------------

.position_x
#_09994A: dw $08B0 ; Gravestone 0
#_09994C: dw $08F0 ; Gravestone 1
#_09994E: dw $0910 ; Gravestone 2
#_099950: dw $0950 ; Gravestone 3
#_099952: dw $0970 ; Gravestone 4
#_099954: dw $09A0 ; Gravestone 5 (unused)
#_099956: dw $0850 ; Gravestone 6
#_099958: dw $0870 ; Gravestone 7
#_09995A: dw $08B0 ; Gravestone 8
#_09995C: dw $08F0 ; Gravestone 9
#_09995E: dw $0920 ; Gravestone A
#_099960: dw $0950 ; Gravestone B
#_099962: dw $0880 ; Gravestone C
#_099964: dw $0990 ; Gravestone D
#_099966: dw $0840 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tilemap_y
#_099968: dw $0540 ; Gravestone 0
#_09996A: dw $0530 ; Gravestone 1
#_09996C: dw $0530 ; Gravestone 2
#_09996E: dw $0530 ; Gravestone 3
#_099970: dw $0520 ; Gravestone 4
#_099972: dw $0520 ; Gravestone 5 (unused)
#_099974: dw $0510 ; Gravestone 6
#_099976: dw $0510 ; Gravestone 7
#_099978: dw $04F0 ; Gravestone 8
#_09997A: dw $04F0 ; Gravestone 9
#_09997C: dw $04F0 ; Gravestone A
#_09997E: dw $04F0 ; Gravestone B
#_099980: dw $04D0 ; Gravestone C
#_099982: dw $04B0 ; Gravestone D
#_099984: dw $04A0 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tilemap_x
#_099986: dw $08B0 ; Gravestone 0
#_099988: dw $08F0 ; Gravestone 1
#_09998A: dw $0910 ; Gravestone 2
#_09998C: dw $0950 ; Gravestone 3
#_09998E: dw $0970 ; Gravestone 4
#_099990: dw $09A0 ; Gravestone 5 (unused)
#_099992: dw $0850 ; Gravestone 6
#_099994: dw $0870 ; Gravestone 7
#_099996: dw $08B0 ; Gravestone 8
#_099998: dw $08F0 ; Gravestone 9
#_09999A: dw $0920 ; Gravestone A
#_09999C: dw $0950 ; Gravestone B
#_09999E: dw $0880 ; Gravestone C
#_0999A0: dw $0990 ; Gravestone D
#_0999A2: dw $0840 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.gfx_write_addr
#_0999A4: dw $0A16 ; Gravestone 0
#_0999A6: dw $099E ; Gravestone 1
#_0999A8: dw $09A2 ; Gravestone 2
#_0999AA: dw $09AA ; Gravestone 3
#_0999AC: dw $092E ; Gravestone 4
#_0999AE: dw $0934 ; Gravestone 5 (unused)
#_0999B0: dw $088A ; Gravestone 6
#_0999B2: dw $088E ; Gravestone 7
#_0999B4: dw $0796 ; Gravestone 8
#_0999B6: dw $079E ; Gravestone 9
#_0999B8: dw $07A4 ; Gravestone A
#_0999BA: dw $07AA ; Gravestone B
#_0999BC: dw $0690 ; Gravestone C
#_0999BE: dw $05B2 ; Gravestone D
#_0999C0: dw $0508 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tile_revealed
#_0999C2: dw $0030 ; Gravestone 0 - skull
#_0999C4: dw $0030 ; Gravestone 1 - skull
#_0999C6: dw $0030 ; Gravestone 2 - skull
#_0999C8: dw $0030 ; Gravestone 3 - skull
#_0999CA: dw $0030 ; Gravestone 4 - skull
#_0999CC: dw $0030 ; Gravestone 5 - skull (unused)
#_0999CE: dw $0030 ; Gravestone 6 - skull
#_0999D0: dw $0030 ; Gravestone 7 - skull
#_0999D2: dw $0030 ; Gravestone 8 - skull
#_0999D4: dw $0030 ; Gravestone 9 - skull
#_0999D6: dw $0030 ; Gravestone A - skull
#_0999D8: dw $0030 ; Gravestone B - skull
#_0999DA: dw $0030 ; Gravestone C - skull
#_0999DC: dw $0038 ; Gravestone D - stairs
#_0999DE: dw $0058 ; Gravestone E - hole

;---------------------------------------------------------------------------------------------------

.offset_data_x
#_0999E0: db $00
#_0999E1: db $02
#_0999E2: db $08
#_0999E3: db $0C
#_0999E4: db $10
#_0999E5: db $18
#_0999E6: db $1A
#_0999E7: db $1C
#_0999E8: db $1E

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_GraveStone:
#_0999E9: PHB
#_0999EA: PHK
#_0999EB: PLB

#_0999EC: JSR Ancilla_AddAncilla
#_0999EF: BCC .free_slot

#_0999F1: BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
#_0999F4: REP #$30

#_0999F6: LDY.b $20
#_0999F8: TYA

#_0999F9: AND.w #$000F
#_0999FC: CMP.w #$0007
#_0999FF: BCS .round_tile

#_099A01: TYA

#_099A02: BRA .clip16px

.round_tile
#_099A04: TYA
#_099A05: CLC
#_099A06: ADC.w #$0010

;---------------------------------------------------------------------------------------------------

.clip16px
#_099A09: AND.w #$FFF0
#_099A0C: STA.b $00

;---------------------------------------------------------------------------------------------------

#_099A0E: LDY.w #$000E

.next_y
#_099A11: LDA.b $00
#_099A13: CMP.w .position_y,Y
#_099A16: BEQ .y_found

#_099A18: DEY
#_099A19: DEY
#_099A1A: BPL .next_y

#_099A1C: BRA .terminate

;---------------------------------------------------------------------------------------------------

.y_found
#_099A1E: TYA
#_099A1F: LSR A
#_099A20: TAY

#_099A21: LDA.w .offset_data_x+1,Y
#_099A24: AND.w #$00FF
#_099A27: STA.b $00

#_099A29: LDA.w .offset_data_x+0,Y
#_099A2C: AND.w #$00FF
#_099A2F: TAY

.next_x
#_099A30: LDA.w .position_x,Y
#_099A33: CMP.b $22
#_099A35: BCS .proceed_to_next

#_099A37: CLC
#_099A38: ADC.w #$000F
#_099A3B: CMP.b $22
#_099A3D: BCC .proceed_to_next

#_099A3F: CPY.w #$001A
#_099A42: BNE .not_dashable

#_099A44: LDA.w $0372
#_099A47: AND.w #$00FF
#_099A4A: BEQ .terminate

#_099A4C: BRA .succeed

;---------------------------------------------------------------------------------------------------

.not_dashable
#_099A4E: LDA.w $0372
#_099A51: AND.w #$00FF
#_099A54: BNE .terminate

#_099A56: BRA .succeed

;---------------------------------------------------------------------------------------------------

.proceed_to_next
#_099A58: INY
#_099A59: INY
#_099A5A: CPY.b $00
#_099A5C: BNE .next_x

;---------------------------------------------------------------------------------------------------

.terminate
#_099A5E: SEP #$30

#_099A60: STZ.w $0C4A,X

#_099A63: BRL .exit

;---------------------------------------------------------------------------------------------------

.succeed
#_099A66: LDA.w .gfx_write_addr,Y
#_099A69: STA.w $0698

#_099A6C: SEC
#_099A6D: SBC.w #$0080
#_099A70: STA.b $72

#_099A72: LDA.w .tile_revealed,Y
#_099A75: STA.w $0692

#_099A78: CMP.w #$0058
#_099A7B: BEQ .hole

#_099A7D: CMP.w #$0038
#_099A80: BNE .not_stairs

;---------------------------------------------------------------------------------------------------

#_099A82: SEP #$30

#_099A84: PHX

#_099A85: LDX.b $8A

#_099A87: LDA.l $7EF280,X
#_099A8B: ORA.b #$20
#_099A8D: STA.l $7EF280,X

#_099A91: PLX

;---------------------------------------------------------------------------------------------------

.hole
#_099A92: SEP #$30

#_099A94: JSL Link_CalculateSFXPan
#_099A98: ORA.b #$1B ; SFX3.1B
#_099A9A: STA.w $012F

;---------------------------------------------------------------------------------------------------

.not_stairs
#_099A9D: SEP #$30

#_099A9F: LDA.b $72
#_099AA1: STA.w $03BA,X

#_099AA4: LDA.b $73
#_099AA6: STA.w $03B6,X

#_099AA9: PHY
#_099AAA: PHX

#_099AAB: JSL Overworld_DoMapUpdate32x32_long

#_099AAF: PLX
#_099AB0: PLY

;---------------------------------------------------------------------------------------------------

#_099AB1: REP #$30

#_099AB3: TYA
#_099AB4: AND.w #$00FF
#_099AB7: TAY

#_099AB8: LDA.w .tilemap_y,Y
#_099ABB: CLC
#_099ABC: ADC.w #$FFFE
#_099ABF: STA.b $00

#_099AC1: CLC
#_099AC2: ADC.w #$FFF0
#_099AC5: STA.b $04

#_099AC7: LDA.w .tilemap_x,Y
#_099ACA: STA.b $02

;---------------------------------------------------------------------------------------------------

#_099ACC: SEP #$30

#_099ACE: LDA.w $012F
#_099AD1: AND.b #$3F
#_099AD3: CMP.b #$1B ; SFX3.1B
#_099AD5: BEQ .dont_overwrite_sfx

#_099AD7: JSL Link_CalculateSFXPan
#_099ADB: ORA.b #$22 ; SFX2.22
#_099ADD: STA.w $012E

.dont_overwrite_sfx
#_099AE0: LDA.b #$04
#_099AE2: STA.b $48

#_099AE4: LDA.b #$01
#_099AE6: STA.w $03E9

#_099AE9: LDA.b $04
#_099AEB: STA.w $038A,X

#_099AEE: LDA.b $05
#_099AF0: STA.w $038F,X

#_099AF3: BRL AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_099AF6: PLB

#_099AF7: RTL

;===================================================================================================

pool AncillaAdd_Hookshot

.speed_y
#_099AF8: db -64 ; up
#_099AF9: db  64 ; down
#_099AFA: db   0 ; left
#_099AFB: db   0 ; right

.speed_x
#_099AFC: db   0 ; up
#_099AFD: db   0 ; down
#_099AFE: db -64 ; left
#_099AFF: db  64 ; right

.offset_y
#_099B00: dw   4 ; up
#_099B02: dw  20 ; down
#_099B04: dw   8 ; left
#_099B06: dw   8 ; right

.offset_x
#_099B08: dw   0 ; up
#_099B0A: dw   0 ; down
#_099B0C: dw  -4 ; left
#_099B0E: dw  11 ; right

pool off

;---------------------------------------------------------------------------------------------------

AncillaAdd_Hookshot:
#_099B10: PHB
#_099B11: PHK
#_099B12: PLB

#_099B13: JSR Ancilla_AddAncilla
#_099B16: BCS .exit

#_099B18: LDA.b #$03
#_099B1A: STA.w $03B1,X

#_099B1D: STZ.w $0C5E,X
#_099B20: STZ.w $0C54,X
#_099B23: STZ.w $0385,X

#_099B26: STZ.w $037E
#_099B29: STX.w $039D

#_099B2C: STZ.w $0380,X

#_099B2F: LDA.b #$FF
#_099B31: STA.w $0394,X

#_099B34: STZ.w $03A4,X
#_099B37: STZ.w $0C68,X

#_099B3A: LDA.b $2F
#_099B3C: LSR A
#_099B3D: STA.w $0C72,X

#_099B40: TAY

#_099B41: LDA.w .speed_y,Y
#_099B44: STA.w $0C22,X

#_099B47: LDA.w .speed_x,Y
#_099B4A: STA.w $0C2C,X

#_099B4D: LDY.b $2F

#_099B4F: REP #$20

#_099B51: LDA.b $20
#_099B53: CLC
#_099B54: ADC.w .offset_y,Y
#_099B57: STA.b $00

#_099B59: LDA.b $22
#_099B5B: CLC
#_099B5C: ADC.w .offset_x,Y
#_099B5F: STA.b $02

#_099B61: SEP #$20

#_099B63: JMP.w AncillaInit_SetCoordsAndExit

;---------------------------------------------------------------------------------------------------

.exit
#_099B66: PLB

#_099B67: RTL

;===================================================================================================

AncillaAdd_WaterfallSplash:
#_099B68: PHB
#_099B69: PHK
#_099B6A: PLB

#_099B6B: LDY.b #$04
#_099B6D: LDA.b #$41 ; ANCILLA 41
#_099B6F: JSR AncillaAdd_CheckForPresence
#_099B72: BCS EXIT_099B81

#_099B74: JSR Ancilla_AddAncilla
#_099B77: BCS EXIT_099B81

#_099B79: LDA.b #$02
#_099B7B: STA.w $0C68,X

#_099B7E: STZ.w $0C5E,X

;---------------------------------------------------------------------------------------------------

#EXIT_099B81:
#_099B81: PLB

#_099B82: RTL

;===================================================================================================

AncillaAdd_GTCutscene:
#_099B83: PHB
#_099B84: PHK
#_099B85: PLB

#_099B86: LDA.w $0308
#_099B89: AND.b #$80
#_099B8B: ORA.b $4D
#_099B8D: BNE EXIT_099B81

#_099B8F: LDA.l $7EF37A
#_099B93: AND.b #$7F
#_099B95: CMP.b #$7F
#_099B97: BNE EXIT_099B81

#_099B99: LDA.l $7EF2C3
#_099B9D: AND.b #$20
#_099B9F: BNE EXIT_099B81

#_099BA1: JSL Ancilla_TerminateSparkleObjects

#_099BA5: LDY.b #$04
#_099BA7: LDA.b #$43 ; ANCILLA 43
#_099BA9: JSR AncillaAdd_CheckForPresence
#_099BAC: BCS EXIT_099B81

#_099BAE: JSR Ancilla_AddAncilla
#_099BB1: BCS EXIT_099B81

;---------------------------------------------------------------------------------------------------

#_099BB3: PHX
#_099BB4: LDX.b #$0F

.next_sprite
#_099BB6: LDA.w $0E20,X
#_099BB9: CMP.b #$37 ; SPRITE 37
#_099BBB: BNE .skip_sprite

#_099BBD: STZ.w $0DD0,X

.skip_sprite
#_099BC0: DEX
#_099BC1: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_099BC3: LDX.b #$17
#_099BC5: LDA.b #$FF

.next_clear
#_099BC7: STA.l $7F5837,X

#_099BCB: DEX
#_099BCC: BPL .next_clear

;---------------------------------------------------------------------------------------------------

#_099BCE: LDA.b #$28
#_099BD0: STA.b $72

#_099BD2: JSL WriteTo4BPPBuffer_item_gfx

#_099BD6: LDA.b #$04
#_099BD8: STA.w $0AB1

#_099BDB: LDA.b #$02
#_099BDD: STA.w $0AA9

#_099BE0: JSL Palettes_Load_SpriteEnvironment_Underworld

#_099BE4: INC.b $15

#_099BE6: PLX

#_099BE7: LDA.b #$01
#_099BE9: STA.w $02E4

#_099BEC: STZ.w $0C36,X
#_099BEF: STZ.w $0C40,X
#_099BF2: STZ.w $0C54,X

#_099BF5: LDA.b #$F0
#_099BF7: STA.l $7F5812

#_099BFB: LDA.b #$00
#_099BFD: STA.l $7F5800
#_099C01: STA.l $7F5808

#_099C05: LDA.b #$0A
#_099C07: STA.l $7F5801

#_099C0B: LDA.b #$16
#_099C0D: STA.l $7F5802

#_099C11: LDA.b #$20
#_099C13: STA.l $7F5803

#_099C17: LDA.b #$2A
#_099C19: STA.l $7F5804

#_099C1D: LDA.b #$36
#_099C1F: STA.l $7F5805

#_099C23: REP #$20

#_099C25: LDA.b $20
#_099C27: CLC
#_099C28: ADC.w #$FFF0
#_099C2B: STA.b $00

#_099C2D: LDA.b $22
#_099C2F: STA.b $02

#_099C31: SEP #$20

#_099C33: BRL AncillaInit_SetCoordsAndExit

;===================================================================================================

UNREACHABLE_099C36:
#_099C36: PLB

#_099C37: RTL

;===================================================================================================

AncillaAdd_DoorDebris:
#_099C38: PHB
#_099C39: PHK
#_099C3A: PLB

#_099C3B: LDY.b #$01
#_099C3D: LDA.b #$08 ; ANCILLA 08
#_099C3F: JSR Ancilla_AddAncilla
#_099C42: BCS EXIT_099C4D

#_099C44: STZ.w $03C2,X

#_099C47: LDA.b #$07
#_099C49: STA.w $03C0,X

#_099C4C: CLC

;---------------------------------------------------------------------------------------------------

#EXIT_099C4D:
#_099C4D: PLB

#_099C4E: RTL

;===================================================================================================

FireRodShot_BecomeSkullWoodsFire:
#_099C4F: PHB
#_099C50: PHK
#_099C51: PLB

#_099C52: LDA.b $1B
#_099C54: BNE EXIT_099C4D

#_099C56: LDA.b $8A
#_099C58: AND.b #$40
#_099C5A: BEQ EXIT_099C4D

#_099C5C: PHX

#_099C5D: LDY.b #$34 ; ANCILLA 34
#_099C5F: STY.w $0C4A
#_099C62: STZ.w $0C4B
#_099C65: STZ.w $0C4C
#_099C68: STZ.w $0C4D
#_099C6B: STZ.w $0C4E
#_099C6E: STZ.w $0C4F

#_099C71: STZ.w $035F

#_099C74: TYX

#_099C75: LDA.l AncillaObjectAllocation,X
#_099C79: STA.w $0C90

#_099C7C: PLX

#_099C7D: LDA.b #$FD
#_099C7F: STA.l $7F0000

#_099C83: INC A
#_099C84: STA.l $7F0001

#_099C88: INC A
#_099C89: STA.l $7F0002

#_099C8D: LDA.b #$00
#_099C8F: STA.l $7F0003
#_099C93: STA.l $7F0010

#_099C97: LDA.b #$05
#_099C99: STA.l $7F0008
#_099C9D: STA.l $7F0009
#_099CA1: STA.l $7F000A
#_099CA5: STA.l $7F000B

#_099CA9: STA.w $03B1

#_099CAC: REP #$20

#_099CAE: LDA.w #$0100
#_099CB1: STA.l $7F0018
#_099CB5: STA.l $7F0026

#_099CB9: LDA.w #$0098
#_099CBC: STA.l $7F001A
#_099CC0: STA.l $7F0036

#_099CC4: SEP #$20

#_099CC6: LDA.b #$02
#_099CC8: STA.w $04C6

#_099CCB: STZ.b $B0
#_099CCD: STZ.b $C8

#_099CCF: LDA.b $EE
#_099CD1: STA.w $0C7C

#_099CD4: LDA.w $0476
#_099CD7: STA.w $03CA

#_099CDA: STZ.w $0C5E
#_099CDD: STZ.w $0C54

#_099CE0: PLB

#_099CE1: RTL

;===================================================================================================

Ancilla_AddAncilla:
#_099CE2: PHA

#_099CE3: JSL Ancilla_CheckForAvailableSlot

#_099CE7: PLA

#_099CE8: TYX
#_099CE9: BMI .fail

#_099CEB: STA.w $0C4A,X

#_099CEE: TAY

#_099CEF: LDA.b $EE
#_099CF1: STA.w $0C7C,X

#_099CF4: LDA.w $0476
#_099CF7: STA.w $03CA,X

#_099CFA: STZ.w $0C22,X
#_099CFD: STZ.w $0C2C,X

#_099D00: STZ.w $0280,X
#_099D03: STZ.w $028A,X

#_099D06: PHX
#_099D07: TYX

#_099D08: LDA.l AncillaObjectAllocation,X
#_099D0C: STA.b $0E

#_099D0E: PLX

#_099D0F: LDA.b $0E
#_099D11: STA.w $0C90,X

#_099D14: CLC

#_099D15: RTS

.fail
#_099D16: SEC

#_099D17: RTS

;===================================================================================================

AncillaAdd_AddAncilla_Bank09:
#_099D18: PHB
#_099D19: PHK
#_099D1A: PLB

#_099D1B: JSR Ancilla_AddAncilla

#_099D1E: PLB

#_099D1F: RTL

;===================================================================================================

AncillaAdd_CheckForPresence:
#_099D20: LDX.b #$05

.next
#_099D22: CMP.w $0C4A,X
#_099D25: BEQ .match

#_099D27: DEX
#_099D28: BPL .next

#_099D2A: CLC

#_099D2B: RTS

.match
#_099D2C: SEC

#_099D2D: RTS

;===================================================================================================

AncillaAdd_CheckForPresence_long:
#_099D2E: PHB
#_099D2F: PHK
#_099D30: PLB

#_099D31: JSR AncillaAdd_CheckForPresence

#_099D34: PLB

#_099D35: RTL

;===================================================================================================

AncillaAdd_ArrowFindSlot:
#_099D36: PHA

#_099D37: INY
#_099D38: STY.b $0E

#_099D3A: LDY.b #$00
#_099D3C: LDX.b #$04

.next_tally
#_099D3E: LDA.b #$0A ; ANCILLA 0A
#_099D40: CMP.w $0C4A,X
#_099D43: BNE .dont_tally

#_099D45: INY

.dont_tally
#_099D46: DEX
#_099D47: BPL .next_tally

;---------------------------------------------------------------------------------------------------

#_099D49: CPY.b $0E
#_099D4B: BEQ .too_many

#_099D4D: LDY.b #$04

.next_free_check
#_099D4F: LDA.w $0C4A,Y
#_099D52: BEQ .replace_this

#_099D54: DEY
#_099D55: BPL .next_free_check

#_099D57: BRA .replace_this

;---------------------------------------------------------------------------------------------------

.too_many
#_099D59: DEC.w $03C4
#_099D5C: BPL .keep_index

.reset_index
#_099D5E: LDA.b #$04
#_099D60: STA.w $03C4

.keep_index
#_099D63: LDY.w $03C4

#_099D66: LDA.w $0C4A,Y
#_099D69: CMP.b #$0A ; ANCILLA 0A
#_099D6B: BEQ .replace_this

#_099D6D: DEY

#_099D6E: BPL .too_many

#_099D70: BRA .reset_index

;---------------------------------------------------------------------------------------------------

.replace_this
#_099D72: PLA

#_099D73: TYX
#_099D74: BMI .failed

#_099D76: STA.w $0C4A,X
#_099D79: TAY

#_099D7A: LDA.b $EE
#_099D7C: STA.w $0C7C,X

#_099D7F: LDA.w $0476
#_099D82: STA.w $03CA,X

#_099D85: STZ.w $0C22,X
#_099D88: STZ.w $0C2C,X

#_099D8B: STZ.w $0280,X
#_099D8E: STZ.w $028A,X

#_099D91: PHX

#_099D92: TYX

#_099D93: LDA.l AncillaObjectAllocation,X
#_099D97: STA.b $0E

#_099D99: PLX

#_099D9A: LDA.b $0E
#_099D9C: STA.w $0C90,X

#_099D9F: CLC

#_099DA0: RTS

;---------------------------------------------------------------------------------------------------

.failed
#_099DA1: SEC

#_099DA2: RTS

;===================================================================================================

pool Ancilla_CheckInitialTile_A

.offset_y
#_099DA3: dw   8,   0
#_099DA7: dw  -8,   8
#_099DAB: dw  16,  24
#_099DAF: dw   8,   8
#_099DB3: dw   8,   8
#_099DB7: dw   8,   8

.offset_x
#_099DBB: dw   0,   0
#_099DBF: dw   0,   0
#_099DC3: dw   0,   0
#_099DC7: dw   0,  -8
#_099DCB: dw -16,   0
#_099DCF: dw   8,  16

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_CheckInitialTile_A:
#_099DD3: PHB
#_099DD4: PHK
#_099DD5: PLB

#_099DD6: PHY

#_099DD7: LDA.b #$02
#_099DD9: STA.b $72

#_099DDB: LDA.w $0C72,X
#_099DDE: ASL A
#_099DDF: STA.b $02

#_099DE1: ASL A
#_099DE2: CLC
#_099DE3: ADC.b $02
#_099DE5: TAY

.next
#_099DE6: REP #$20

#_099DE8: LDA.w .offset_y,Y
#_099DEB: CLC
#_099DEC: ADC.b $20
#_099DEE: STA.b $02

#_099DF0: LDA.w .offset_x,Y
#_099DF3: CLC
#_099DF4: ADC.b $22
#_099DF6: STA.b $04

#_099DF8: SEP #$20

#_099DFA: LDA.b $02
#_099DFC: STA.w $0BFA,X

#_099DFF: LDA.b $03
#_099E01: STA.w $0C0E,X

#_099E04: LDA.b $04
#_099E06: STA.w $0C04,X

#_099E09: LDA.b $05
#_099E0B: STA.w $0C18,X

#_099E0E: PHY
#_099E0F: JSL Ancilla_CheckTileCollision_long
#_099E13: PLY

#_099E14: BCS .collided

#_099E16: INY
#_099E17: INY

#_099E18: DEC.b $72
#_099E1A: BPL .next

;---------------------------------------------------------------------------------------------------

#_099E1C: PLY

#_099E1D: CLC

#_099E1E: PLB

#_099E1F: RTL

;---------------------------------------------------------------------------------------------------

.collided
#_099E20: PLY

#_099E21: SEC

#_099E22: PLB

#_099E23: RTL

;===================================================================================================

pool Ancilla_CheckInitialTileCollision_Class2

.offset_y
#_099E24: dw  15,  16
#_099E28: dw  28,  24
#_099E2C: dw  12,  12
#_099E30: dw  12,  12

.offset_x
#_099E34: dw   8,   8
#_099E38: dw   8,   8
#_099E3C: dw  -1,   0
#_099E40: dw  17,  16

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_CheckInitialTileCollision_Class2:
#_099E44: PHB
#_099E45: PHK
#_099E46: PLB

#_099E47: PHY

#_099E48: LDA.b #$02
#_099E4A: STA.b $72

#_099E4C: LDA.w $0C72,X
#_099E4F: ASL A
#_099E50: ASL A
#_099E51: TAY

;---------------------------------------------------------------------------------------------------

.next
#_099E52: REP #$20

#_099E54: LDA.w .offset_y,Y
#_099E57: CLC
#_099E58: ADC.b $20
#_099E5A: STA.b $02

#_099E5C: LDA.w .offset_x,Y
#_099E5F: CLC
#_099E60: ADC.b $22
#_099E62: STA.b $04

#_099E64: SEP #$20

#_099E66: LDA.b $02
#_099E68: STA.w $0BFA,X

#_099E6B: LDA.b $03
#_099E6D: STA.w $0C0E,X

#_099E70: LDA.b $04
#_099E72: STA.w $0C04,X

#_099E75: LDA.b $05
#_099E77: STA.w $0C18,X

#_099E7A: PHY
#_099E7B: JSL Ancilla_CheckTileCollision_Class2_long
#_099E7F: PLY

#_099E80: BCS .collided

#_099E82: INY
#_099E83: INY

#_099E84: DEC.b $72
#_099E86: BPL .next

;---------------------------------------------------------------------------------------------------

#_099E88: PLY

#_099E89: CLC

#_099E8A: PLB

#_099E8B: RTL

;---------------------------------------------------------------------------------------------------

.collided
#_099E8C: PLY

#_099E8D: SEC

#_099E8E: PLB

#_099E8F: RTL

;===================================================================================================

Follower_CheckBlindTrigger:
#_099E90: PHB
#_099E91: PHK
#_099E92: PLB

#_099E93: LDX.w $02CF

#_099E96: LDA.w $1A00,X
#_099E99: STA.b $00

#_099E9B: LDA.w $1A14,X
#_099E9E: STA.b $01

#_099EA0: LDA.w $1A28,X
#_099EA3: STA.b $02

#_099EA5: LDA.w $1A3C,X
#_099EA8: STA.b $03

#_099EAA: STZ.b $0B

#_099EAC: LDA.w $1A50,X
#_099EAF: STA.b $0A
#_099EB1: BPL .positive_z

#_099EB3: LDA.b #$FF
#_099EB5: STA.b $0B

;---------------------------------------------------------------------------------------------------

.positive_z
#_099EB7: REP #$20

#_099EB9: LDA.b $00
#_099EBB: CLC
#_099EBC: ADC.b $0A
#_099EBE: CLC
#_099EBF: ADC.w #$000C
#_099EC2: STA.b $00

#_099EC4: LDA.b $02
#_099EC6: CLC
#_099EC7: ADC.w #$0008
#_099ECA: STA.b $02

#_099ECC: LDA.w #$1568
#_099ECF: SEC
#_099ED0: SBC.b $00
#_099ED2: BPL .positive_x

#_099ED4: EOR.w #$FFFF
#_099ED7: INC A

;---------------------------------------------------------------------------------------------------

.positive_x
#_099ED8: CMP.w #$0018
#_099EDB: BCS .fail

#_099EDD: LDA.w #$1980
#_099EE0: SEC
#_099EE1: SBC.b $02
#_099EE3: BPL .positive_y

#_099EE5: EOR.w #$FFFF
#_099EE8: INC A

;---------------------------------------------------------------------------------------------------

.positive_y
#_099EE9: CMP.w #$0018
#_099EEC: BCS .fail

.success
#_099EEE: SEP #$20

#_099EF0: PLB

#_099EF1: SEC

#_099EF2: RTL

;---------------------------------------------------------------------------------------------------

.fail
#_099EF3: SEP #$20

#_099EF5: PLB

#_099EF6: CLC

#_099EF7: RTL

;===================================================================================================

FollowerPriority:
#_099EF8: db $20, $10, $30, $20

;===================================================================================================

Follower_Initialize:
#_099EFC: PHB
#_099EFD: PHK
#_099EFE: PLB

#_099EFF: LDA.b $20
#_099F01: STA.w $1A00

#_099F04: LDA.b $21
#_099F06: STA.w $1A14

#_099F09: LDA.b $22
#_099F0B: STA.w $1A28

#_099F0E: LDA.b $23
#_099F10: STA.w $1A3C

#_099F13: LDA.b $2F
#_099F15: LSR A
#_099F16: STA.b $00

#_099F18: LDY.b $EE

#_099F1A: LDA.w FollowerPriority,Y
#_099F1D: LSR A
#_099F1E: LSR A
#_099F1F: ORA.b $00
#_099F21: STA.w $1A64

#_099F24: LDA.b #$40
#_099F26: STA.w $02D2

#_099F29: STZ.w $02CF
#_099F2C: STZ.w $02D3
#_099F2F: STZ.w $02D0
#_099F32: STZ.w $02D6

#_099F35: STZ.b $5E

#_099F37: PLB

#_099F38: RTL

;===================================================================================================

Sprite_BecomeFollower:
#_099F39: PHB
#_099F3A: PHK
#_099F3B: PLB

#_099F3C: PHX

#_099F3D: STZ.w $02F9

#_099F40: LDA.w $0D00,X
#_099F43: CLC
#_099F44: ADC.b #$FA
#_099F46: STA.w $1A00

#_099F49: LDA.w $0D20,X
#_099F4C: ADC.b #$FF
#_099F4E: STA.w $1A14

#_099F51: LDA.w $0D10,X
#_099F54: CLC
#_099F55: ADC.b #$01
#_099F57: STA.w $1A28

#_099F5A: LDA.w $0D30,X
#_099F5D: ADC.b #$00
#_099F5F: STA.w $1A3C

;---------------------------------------------------------------------------------------------------

#_099F62: LDY.b $EE

#_099F64: LDA.w FollowerPriority,Y
#_099F67: LSR A
#_099F68: LSR A
#_099F69: ORA.b #$01
#_099F6B: STA.w $1A64

#_099F6E: LDA.b #$40
#_099F70: STA.w $02D2
#_099F73: STZ.w $02D3

#_099F76: STZ.w $02CF

#_099F79: STZ.w $02D0
#_099F7C: STZ.w $02D6

#_099F7F: STZ.b $5E

#_099F81: STZ.w $02F9

#_099F84: LDA.b #$00
#_099F86: STA.l $7EF3D3

#_099F8A: JSL Follower_MoveTowardsLink

#_099F8E: PLX
#_099F8F: PLB

#_099F90: RTL

;===================================================================================================

Follower_Main:
#_099F91: PHB
#_099F92: PHK
#_099F93: PLB

#_099F94: JSR .execute

#_099F97: PLB

#_099F98: RTL

;===================================================================================================

#Follower_AIVectors:
#_099F99: dw Follower_BasicMover   ; 0x01 - Zelda
#_099F9B: dw Follower_OldMan       ; 0x02 - Old man that stops following you
#_099F9D: dw Follower_OldManUnused ; 0x03 - Unused old man
#_099F9F: dw Follower_OldMan       ; 0x04 - Normal old man
#_099FA1: dw Follower_Telepathy    ; 0x05 - Zelda rescue telepathy
#_099FA3: dw Follower_BasicMover   ; 0x06 - Blind maiden
#_099FA5: dw Follower_BasicMover   ; 0x07 - Frogsmith
#_099FA7: dw Follower_BasicMover   ; 0x08 - Smithy
#_099FA9: dw Follower_BasicMover   ; 0x09 - Locksmith
#_099FAB: dw Follower_BasicMover   ; 0x0A - Kiki
#_099FAD: dw Follower_OldManUnused ; 0x0B - Unused old man
#_099FAF: dw Follower_BasicMover   ; 0x0C - Purple chest
#_099FB1: dw Follower_BasicMover   ; 0x0D - Super bomb
#_099FB3: dw Follower_Telepathy    ; 0x0E - Master Sword telepathy

;===================================================================================================

.has_message
#_099FB5: db $05 ; FOLLOWER 05 - Zelda rescue telepathy
#_099FB6: db $09 ; FOLLOWER 09 - Locksmith
#_099FB7: db $0A ; FOLLOWER 0A - Kiki

.message_timer
#_099FB8: dw $0DF3 ; 3571
#_099FBA: dw $06F9 ; 1785
#_099FBC: dw $0DF3 ; 3571

.message_id
#_099FBE: dw $0020 ; MESSAGE 0020
#_099FC0: dw $0108 ; MESSAGE 0108
#_099FC2: dw $011D ; MESSAGE 011D

;===================================================================================================

.execute
#_099FC4: LDA.l $7EF3CC
#_099FC8: BNE .have_follower

#_099FCA: RTS

.have_follower
#_099FCB: CMP.b #$0E ; FOLLOWER 0E
#_099FCD: BNE .not_ms_telepathy

#_099FCF: BRL Follower_HandleTrigger

;---------------------------------------------------------------------------------------------------

.not_ms_telepathy
#_099FD2: LDY.b #$02

.next_check
#_099FD4: LDA.l $7EF3CC
#_099FD8: CMP.w .has_message,Y
#_099FDB: BEQ .has_timed_message

#_099FDD: DEY
#_099FDE: BPL .next_check

#_099FE0: BRL Follower_NoTimedMessage

;---------------------------------------------------------------------------------------------------

.has_timed_message
#_099FE3: LDA.b $11
#_099FE5: BNE .continue_a

#_099FE7: CPY.b #$02
#_099FE9: BNE .not_kiki

#_099FEB: LDA.b $8A
#_099FED: AND.b #$40
#_099FEF: BNE .continue_a

.not_kiki
#_099FF1: REP #$20

#_099FF3: DEC.w $02CD
#_099FF6: BPL .continue_a

;---------------------------------------------------------------------------------------------------

#_099FF8: SEP #$20

#_099FFA: JSL Follower_ValidateMessageFreedom
#_099FFE: BCS .display_timed_message

#_09A000: STZ.w $02CD
#_09A003: STZ.w $02CE
#_09A006: BRA .continue_a

;---------------------------------------------------------------------------------------------------

.display_timed_message
#_09A008: REP #$20

#_09A00A: PHY

#_09A00B: TYA
#_09A00C: AND.w #$00FF
#_09A00F: ASL A
#_09A010: TAY

#_09A011: LDA.w .message_timer,Y
#_09A014: STA.w $02CD

#_09A017: LDA.w .message_id,Y
#_09A01A: STA.w $1CF0

#_09A01D: SEP #$20

#_09A01F: JSL Interface_PrepAndDisplayMessage

#_09A023: PLY

;===================================================================================================

#Follower_Telepathy:
.continue_a
#_09A024: SEP #$20

#_09A026: CPY.b #$00
#_09A028: BNE Follower_NoTimedMessage

#_09A02A: RTS

;---------------------------------------------------------------------------------------------------

Follower_NoTimedMessage:
#_09A02B: SEP #$20

#_09A02D: LDA.l $7EF3D3
#_09A031: BEQ .follower_following

#_09A033: BRL .not_following_bounce

;---------------------------------------------------------------------------------------------------

.follower_following
#_09A036: LDA.l $7EF3CC
#_09A03A: CMP.b #$0C ; FOLLOWER 0C
#_09A03C: BNE .not_purple_chest_a

#_09A03E: LDA.b $4D
#_09A040: BNE .not_default_game_mode

#_09A042: BRA .continue_a

.not_purple_chest_a
#_09A044: LDA.l $7EF3CC
#_09A048: CMP.b #$0D ; FOLLOWER 0D
#_09A04A: BEQ .not_super_bomb_a

.not_default_game_mode
#_09A04C: BRL Follower_CheckGameMode

.not_super_bomb_a
#_09A04F: LDA.b $4D
#_09A051: CMP.b #$02
#_09A053: BEQ .recoiling_or_falling

#_09A055: LDA.b $5B
#_09A057: CMP.b #$02
#_09A059: BEQ .recoiling_or_falling

;---------------------------------------------------------------------------------------------------

.continue_a
#_09A05B: LDA.b $11
#_09A05D: BNE .not_default_game_mode

#_09A05F: LDA.b $4D
#_09A061: CMP.b #$01
#_09A063: BEQ Follower_CheckGameMode

#_09A065: BIT.w $0308
#_09A068: BMI Follower_CheckGameMode

#_09A06A: LDA.w $02F9
#_09A06D: BNE Follower_CheckGameMode

#_09A06F: LDA.w $02D0
#_09A072: BNE Follower_CheckGameMode

;---------------------------------------------------------------------------------------------------

#_09A074: LDX.w $02CF

#_09A077: LDA.w $1A50,X
#_09A07A: BEQ .zero_altitude

#_09A07C: BPL Follower_CheckGameMode

.zero_altitude
#_09A07E: LDA.b $F6
#_09A080: AND.b #$80
#_09A082: BEQ Follower_CheckGameMode

.recoiling_or_falling
#_09A084: LDA.l $7EF3CC
#_09A088: CMP.b #$0D ; FOLLOWER 0D
#_09A08A: BNE .not_superbomb_outdoors

#_09A08C: LDA.b $1B
#_09A08E: BNE .not_superbomb_outdoors

;---------------------------------------------------------------------------------------------------

#_09A090: LDA.b $5D
#_09A092: CMP.b #$08 ; LINKSTATE 08
#_09A094: BEQ Follower_CheckGameMode

#_09A096: CMP.b #$09 ; LINKSTATE 09
#_09A098: BEQ Follower_CheckGameMode

#_09A09A: CMP.b #$0A ; LINKSTATE 0A
#_09A09C: BEQ Follower_CheckGameMode

#_09A09E: LDA.b #$03
#_09A0A0: STA.w $04B4

#_09A0A3: LDA.b #$BB
#_09A0A5: STA.w $04B5

;---------------------------------------------------------------------------------------------------

.not_superbomb_outdoors
#_09A0A8: LDA.b #$80
#_09A0AA: STA.l $7EF3D3

#_09A0AE: LDA.b #$40
#_09A0B0: STA.w $02D2

#_09A0B3: LDX.w $02CF

#_09A0B6: LDA.w $1A00,X
#_09A0B9: STA.l $7EF3CD

#_09A0BD: LDA.w $1A14,X
#_09A0C0: STA.l $7EF3CE

#_09A0C4: LDA.w $1A28,X
#_09A0C7: STA.l $7EF3CF

#_09A0CB: LDA.w $1A3C,X
#_09A0CE: STA.l $7EF3D0

#_09A0D2: LDA.b $EE
#_09A0D4: STA.l $7EF3D2

#_09A0D8: LDA.b $1B
#_09A0DA: STA.l $7EF3D1

;---------------------------------------------------------------------------------------------------

.not_following_bounce
#_09A0DE: BRL Follower_NotFollowing

;===================================================================================================

Follower_CheckGameMode:
#_09A0E1: SEP #$20

#_09A0E3: LDA.w $02E4
#_09A0E6: BNE .dont_do_anything

#_09A0E8: LDX.b $10
#_09A0EA: LDY.b $11

#_09A0EC: CPY.b #$0A
#_09A0EE: BEQ .dont_do_anything

#_09A0F0: CPX.b #$09
#_09A0F2: BNE .not_overworld

#_09A0F4: CPY.b #$23
#_09A0F6: BEQ .dont_do_anything

;---------------------------------------------------------------------------------------------------

.not_overworld
#_09A0F8: CPX.b #$0E
#_09A0FA: BNE .not_text_mode

#_09A0FC: CPY.b #$01
#_09A0FE: BEQ .dont_do_anything

#_09A100: CPY.b #$02
#_09A102: BNE .not_text_mode

.dont_do_anything
#_09A104: BRL Follower_ExecuteAI

;---------------------------------------------------------------------------------------------------

.not_text_mode
#_09A107: LDA.b $30
#_09A109: ORA.b $31
#_09A10B: BEQ Follower_ExecuteAI

#_09A10D: LDX.w $02D3
#_09A110: INX
#_09A111: CPX.b #$14
#_09A113: BNE .dont_reset_movement_index

#_09A115: LDX.b #$00

.dont_reset_movement_index
#_09A117: STX.w $02D3

;---------------------------------------------------------------------------------------------------

#_09A11A: LDA.b $24
#_09A11C: CMP.b #$F0
#_09A11E: BCC .use_links_altitude

#_09A120: LDA.b #$00

.use_links_altitude
#_09A122: STA.b $00
#_09A124: STZ.b $01

#_09A126: LDA.b $00
#_09A128: STA.w $1A50,X

;---------------------------------------------------------------------------------------------------

#_09A12B: REP #$20

#_09A12D: LDA.b $20
#_09A12F: SEC
#_09A130: SBC.b $00
#_09A132: STA.b $00

#_09A134: SEP #$20

;---------------------------------------------------------------------------------------------------

#_09A136: LDA.b $00
#_09A138: STA.w $1A00,X

#_09A13B: LDA.b $01
#_09A13D: STA.w $1A14,X

#_09A140: LDA.b $22
#_09A142: STA.w $1A28,X

#_09A145: LDA.b $23
#_09A147: STA.w $1A3C,X

#_09A14A: LDA.b $2F
#_09A14C: LSR A
#_09A14D: STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

#_09A150: LDY.b $EE

#_09A152: LDA.w FollowerPriority,Y
#_09A155: LSR A
#_09A156: LSR A
#_09A157: ORA.w $1A64,X
#_09A15A: STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

#_09A15D: LDA.b $5D
#_09A15F: CMP.b #$04 ; LINKSTATE 04
#_09A161: BNE .not_swimming

#_09A163: LDY.b #$20

#_09A165: BRA .set_priority

.not_swimming
#_09A167: CMP.b #$13 ; LINKSTATE 13
#_09A169: BNE .not_hookshot_drag

#_09A16B: LDA.w $037E
#_09A16E: BEQ .not_hookshot_drag

#_09A170: LDA.b #$10
#_09A172: ORA.w $1A64,X
#_09A175: STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

.not_hookshot_drag
#_09A178: LDY.b #$80

#_09A17A: LDA.w $0351
#_09A17D: BEQ Follower_ExecuteAI

#_09A17F: CMP.b #$01
#_09A181: BEQ .set_priority

#_09A183: LDY.b #$40

.set_priority
#_09A185: TYA
#_09A186: ORA.w $1A64,X
#_09A189: STA.w $1A64,X

;===================================================================================================

Follower_ExecuteAI:
#_09A18C: LDA.l $7EF3CC
#_09A190: DEC A
#_09A191: ASL A
#_09A192: TAX

#_09A193: JMP.w (Follower_AIVectors,X)

;===================================================================================================

#UNREACHABLE_09A196:
#_09A196: RTS

;===================================================================================================

Follower_BasicMover:
#_09A197: LDA.w $02E4
#_09A19A: BNE .not_in_cutscene

#_09A19C: LDX.b $10
#_09A19E: LDY.b $11

#_09A1A0: CPY.b #$0A
#_09A1A2: BEQ .not_in_cutscene

#_09A1A4: CPX.b #$09
#_09A1A6: BNE .not_overworld

#_09A1A8: CPY.b #$23
#_09A1AA: BEQ .not_in_cutscene

.not_overworld
#_09A1AC: CPX.b #$0E
#_09A1AE: BNE .not_text_mode

#_09A1B0: CPY.b #$01
#_09A1B2: BEQ .not_in_cutscene

#_09A1B4: CPY.b #$02
#_09A1B6: BNE .not_text_mode

.not_in_cutscene
#_09A1B8: BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.not_text_mode
#_09A1BB: JSR Follower_HandleTrigger

#_09A1BE: LDA.l $7EF3CC
#_09A1C2: CMP.b #$0A ; FOLLOWER 0A
#_09A1C4: BNE .dont_scare_kiki

#_09A1C6: LDA.b $4D
#_09A1C8: BEQ .dont_scare_kiki

#_09A1CA: LDA.w $031F
#_09A1CD: BEQ .dont_scare_kiki

#_09A1CF: LDA.w $02CF
#_09A1D2: INC A
#_09A1D3: CMP.b #$14
#_09A1D5: BNE .no_index_wrap

#_09A1D7: LDA.b #$00

.no_index_wrap
#_09A1D9: JSL Kiki_SpawnHandler_B

#_09A1DD: LDA.b #$00
#_09A1DF: STA.l $7EF3CC

#_09A1E3: RTS

;===================================================================================================

.dont_scare_kiki
#_09A1E4: LDA.l $7EF3CC
#_09A1E8: CMP.b #$06 ; FOLLOWER 06
#_09A1EA: BNE .no_blind_transform

#_09A1EC: REP #$20

#_09A1EE: LDA.b $A0
#_09A1F0: CMP.w #$00AC ; ROOM 00AC
#_09A1F3: BNE .no_blind_transform

#_09A1F5: LDA.l $7EF0CA
#_09A1F9: AND.w #$0100
#_09A1FC: BEQ .no_blind_transform

#_09A1FE: SEP #$20

#_09A200: JSL Follower_CheckBlindTrigger
#_09A204: BCC .no_blind_transform

;---------------------------------------------------------------------------------------------------

.blind_transform
#_09A206: LDX.w $02CF

#_09A209: LDA.w $1A28,X
#_09A20C: STA.b $00

#_09A20E: LDA.w $1A3C,X
#_09A211: STA.b $01

#_09A213: LDA.w $1A00,X
#_09A216: STA.b $02

#_09A218: LDA.w $1A14,X
#_09A21B: STA.b $03

#_09A21D: LDA.b #$00
#_09A21F: STA.l $7EF3CC

#_09A223: JSL Blind_SpawnFromMaiden

#_09A227: INC.w $0468

#_09A22A: STZ.w $068E
#_09A22D: STZ.w $0690

#_09A230: LDA.b #$05
#_09A232: STA.b $11

#_09A234: LDA.b #$15 ; SONG 15
#_09A236: STA.w $012C

#_09A239: RTS

;---------------------------------------------------------------------------------------------------

.no_blind_transform
#_09A23A: SEP #$20

#_09A23C: LDY.b $5D

#_09A23E: LDA.w $02D0
#_09A241: BNE .ignore_hook

#_09A243: CPY.b #$13 ; LINKSTATE 13
#_09A245: BNE .no_hookshot_dragging

#_09A247: LDA.w $037E
#_09A24A: BEQ .no_hookshot_dragging

#_09A24C: LDA.b #$01
#_09A24E: STA.w $02D0

#_09A251: BRA .continue_from_hook

.ignore_hook
#_09A253: CPY.b #$13 ; LINKSTATE 13
#_09A255: BEQ .continue_from_hook

#_09A257: LDA.w $02D1
#_09A25A: CMP.w $02CF
#_09A25D: BNE .advance_movement_index

#_09A25F: STZ.w $02D0

;---------------------------------------------------------------------------------------------------

.no_hookshot_dragging
#_09A262: LDX.w $02CF

#_09A265: LDA.w $1A50,X
#_09A268: BEQ .nonpositive_z
#_09A26A: BMI .nonpositive_z

#_09A26C: LDA.w $02D3
#_09A26F: CMP.w $02CF
#_09A272: BNE .advance_movement_index

#_09A274: STZ.w $1A50,X

#_09A277: LDA.b $20
#_09A279: STA.w $1A00,X

#_09A27C: LDA.b $21
#_09A27E: STA.w $1A14,X

#_09A281: LDA.b $22
#_09A283: STA.w $1A28,X

#_09A286: LDA.b $23
#_09A288: STA.w $1A3C,X

;---------------------------------------------------------------------------------------------------

.nonpositive_z
#_09A28B: LDA.b $30
#_09A28D: ORA.b $31
#_09A28F: BEQ .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.continue_from_hook
#_09A291: LDA.w $02D3
#_09A294: SEC
#_09A295: SBC.b #$0F
#_09A297: BPL .dont_wrap_index_a

#_09A299: CLC
#_09A29A: ADC.b #$14

.dont_wrap_index_a
#_09A29C: CMP.w $02CF
#_09A29F: BNE .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.advance_movement_index
#_09A2A1: LDX.w $02CF
#_09A2A4: INX
#_09A2A5: CPX.b #$14
#_09A2A7: BNE .dont_wrap_index_b

#_09A2A9: LDX.b #$00

.dont_wrap_index_b
#_09A2AB: STX.w $02CF

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
#_09A2AE: BRL Follower_Draw

;===================================================================================================

#EXIT_09A2B1:
#_09A2B1: RTS

;---------------------------------------------------------------------------------------------------

Follower_NotFollowing:
#_09A2B2: LDA.l $7EF3D1
#_09A2B6: CMP.b $1B
#_09A2B8: BNE EXIT_09A2B1

#_09A2BA: LDA.w $0372
#_09A2BD: BNE .dont_reset_self

#_09A2BF: JSR Follower_CheckProximityToLink
#_09A2C2: BCS .dont_reset_self

#_09A2C4: JSL Follower_Initialize

#_09A2C8: LDA.b $1B
#_09A2CA: STA.l $7EF3D1

#_09A2CE: LDA.l $7EF3CC
#_09A2D2: CMP.b #$0D ; FOLLOWER 0D
#_09A2D4: BNE .not_superbomb

#_09A2D6: LDA.b #$FE
#_09A2D8: STA.w $04B4
#_09A2DB: STZ.w $04B5

.not_superbomb
#_09A2DE: LDA.b #$00
#_09A2E0: STA.l $7EF3D3

#_09A2E4: BRL Follower_Draw

;---------------------------------------------------------------------------------------------------

.dont_reset_self
#_09A2E7: LDA.l $7EF3CC
#_09A2EB: CMP.b #$0D ; FOLLOWER 0D
#_09A2ED: BNE .not_superbomb_exploding

#_09A2EF: LDA.b $1B
#_09A2F1: BNE .not_superbomb_exploding

#_09A2F3: LDA.w $04B4
#_09A2F6: BNE .not_superbomb_exploding

#_09A2F8: LDY.b #$00
#_09A2FA: LDA.b #$3A ; ANCILLA 3A
#_09A2FC: JSL AncillaAdd_SuperBombExplosion

#_09A300: LDA.b #$00
#_09A302: STA.l $7EF3D3

.not_superbomb_exploding
#_09A306: BRL Follower_DoLayers

;===================================================================================================

pool Follower_OldMan

.replacement_follower
#_09A309: db $00 ; 0x00 - No follower
#_09A30A: db $00 ; 0x01 - Zelda
#_09A30B: db $03 ; 0x02 - Old man that stops following you ⇒ FOLLOWER 03
#_09A30C: db $03 ; 0x03 - Unused old man ⇒ FOLLOWER 03
#_09A30D: db $04 ; 0x04 - Normal old man ⇒ FOLLOWER 04
#_09A30E: db $00 ; 0x05 - Zelda rescue telepathy
#_09A30F: db $00 ; 0x06 - Blind maiden
#_09A310: db $00 ; 0x07 - Frogsmith
#_09A311: db $00 ; 0x08 - Smithy
#_09A312: db $00 ; 0x09 - Locksmith
#_09A313: db $00 ; 0x0A - Kiki
#_09A314: db $00 ; 0x0B - Unused old man
#_09A315: db $00 ; 0x0C - Purple chest
#_09A316: db $00 ; 0x0D - Super bomb
#_09A317: db $00 ; 0x0E - Master Sword telepathy

pool off

;---------------------------------------------------------------------------------------------------

Follower_OldMan:
#_09A318: LDA.w $02E4
#_09A31B: BNE .proceed_to_just_draw

#_09A31D: LDX.b $10
#_09A31F: LDY.b $11
#_09A321: CPY.b #$0A
#_09A323: BEQ .proceed_to_just_draw

#_09A325: CPX.b #$09
#_09A327: BNE .not_overworld

#_09A329: CPY.b #$23
#_09A32B: BEQ .proceed_to_just_draw

.not_overworld
#_09A32D: CPX.b #$0E
#_09A32F: BNE .not_textbox

#_09A331: CPY.b #$01
#_09A333: BEQ .proceed_to_just_draw

#_09A335: CPY.b #$02
#_09A337: BNE .not_textbox

.proceed_to_just_draw
#_09A339: BRL .just_draw

;---------------------------------------------------------------------------------------------------

.not_textbox
#_09A33C: LDA.b $5E
#_09A33E: CMP.b #$04
#_09A340: BEQ .dont_reset_link_speed

#_09A342: LDA.b #$0C
#_09A344: STA.b $5E

.dont_reset_link_speed
#_09A346: JSR Follower_HandleTrigger

#_09A349: SEP #$30

#_09A34B: LDA.l $7EF3CC
#_09A34F: BNE .have_old_man_indeed

#_09A351: RTS

;---------------------------------------------------------------------------------------------------

.have_old_man_indeed
#_09A352: CMP.b #$04
#_09A354: BNE .not_normal_old_man

#_09A356: LDX.w $02CF

#_09A359: LDA.w $1A50,X
#_09A35C: BEQ .proceed_to_check_velocity
#_09A35E: BMI .proceed_to_check_velocity

#_09A360: LDA.w $02CF
#_09A363: CMP.w $02D3
#_09A366: BEQ .proceed_to_check_velocity

#_09A368: BRL .advance_movement_index

;---------------------------------------------------------------------------------------------------

.proceed_to_check_velocity
#_09A36B: BRL .check_link_velocity

;---------------------------------------------------------------------------------------------------

.not_normal_old_man
#_09A36E: LDA.b $4D
#_09A370: AND.b #$01
#_09A372: BEQ .check_for_recoiling

#_09A374: LDA.b $5D
#_09A376: CMP.b #$06 ; LINKSTATE 06
#_09A378: BNE .check_for_recoiling

#_09A37A: LDA.w $02D3
#_09A37D: CMP.w $02CF
#_09A380: BNE .replace_that_follower

#_09A382: DEX
#_09A383: STX.w $02CF
#_09A386: BPL .replace_that_follower

#_09A388: LDA.b #$13
#_09A38A: STA.w $02CF

.check_for_recoiling
#_09A38D: LDA.b $4D
#_09A38F: AND.b #$02
#_09A391: BEQ .check_link_velocity

.replace_that_follower
#_09A393: LDA.l $7EF3CC
#_09A397: TAX

#_09A398: LDA.w .replacement_follower,X
#_09A39B: STA.l $7EF3CC

#_09A39F: LDA.b #$40
#_09A3A1: STA.w $02D2

;---------------------------------------------------------------------------------------------------

#_09A3A4: LDX.w $02CF

#_09A3A7: LDA.w $1A00,X
#_09A3AA: STA.l $7EF3CD

#_09A3AE: LDA.w $1A14,X
#_09A3B1: STA.l $7EF3CE

#_09A3B5: LDA.w $1A28,X
#_09A3B8: STA.l $7EF3CF

#_09A3BC: LDA.w $1A3C,X
#_09A3BF: STA.l $7EF3D0

#_09A3C3: LDA.b $EE
#_09A3C5: STA.l $7EF3D2

#_09A3C9: BRA Follower_OldManUnused

;---------------------------------------------------------------------------------------------------

.check_link_velocity
#_09A3CB: LDA.b $30
#_09A3CD: ORA.b $31
#_09A3CF: BNE .link_moving

#_09A3D1: LDA.b $1A
#_09A3D3: AND.b #$03
#_09A3D5: BNE .just_draw

#_09A3D7: LDA.w $02D3
#_09A3DA: CMP.w $02CF
#_09A3DD: BEQ .just_draw

#_09A3DF: SEC
#_09A3E0: SBC.b #$09
#_09A3E2: BPL .no_back_wrap_a

#_09A3E4: CLC
#_09A3E5: ADC.b #$14

.no_back_wrap_a
#_09A3E7: CMP.w $02CF
#_09A3EA: BNE .advance_movement_index

#_09A3EC: BRL .just_draw

;---------------------------------------------------------------------------------------------------

.link_moving
#_09A3EF: LDA.w $02D3
#_09A3F2: SEC
#_09A3F3: SBC.b #$14
#_09A3F5: BPL .no_back_wrap_b

#_09A3F7: CLC
#_09A3F8: ADC.b #$14

.no_back_wrap_b
#_09A3FA: CMP.w $02CF
#_09A3FD: BNE .just_draw

;---------------------------------------------------------------------------------------------------

.advance_movement_index
#_09A3FF: LDX.w $02CF
#_09A402: INX
#_09A403: CPX.b #$14
#_09A405: BCC .no_wrap

#_09A407: LDX.b #$00

.no_wrap
#_09A409: STX.w $02CF

;---------------------------------------------------------------------------------------------------

.just_draw
#_09A40C: BRL Follower_Draw

;===================================================================================================

UNREACHABLE_09A40F:
#_09A40F: RTS

;===================================================================================================

pool Follower_OldManUnused

.replacement_follower
#_09A410: db $00 ; 0x00 - No follower
#_09A411: db $00 ; 0x01 - Zelda
#_09A412: db $00 ; 0x02 - Old man that stops following you
#_09A413: db $02 ; 0x03 - Unused old man ⇒ FOLLOWER 02
#_09A414: db $00 ; 0x04 - Normal old man
#_09A415: db $00 ; 0x05 - Zelda rescue telepathy
#_09A416: db $00 ; 0x06 - Blind maiden
#_09A417: db $00 ; 0x07 - Frogsmith
#_09A418: db $00 ; 0x08 - Smithy
#_09A419: db $00 ; 0x09 - Locksmith
#_09A41A: db $00 ; 0x0A - Kiki
#_09A41B: db $00 ; 0x0B - Unused old man
#_09A41C: db $00 ; 0x0C - Purple chest
#_09A41D: db $00 ; 0x0D - Super bomb
#_09A41E: db $00 ; 0x0E - Master Sword telepathy

pool off

;---------------------------------------------------------------------------------------------------

Follower_OldManUnused:
#_09A41F: LDA.b #$10
#_09A421: STA.b $5E

#_09A423: LDA.w $0372
#_09A426: BNE Follower_DoLayers

#_09A428: LDA.b $4D
#_09A42A: BNE Follower_DoLayers

#_09A42C: LDA.b $5D
#_09A42E: CMP.b #$04 ; LINKSTATE 04
#_09A430: BEQ Follower_DoLayers

#_09A432: STZ.b $5E

#_09A434: LDA.b $5D
#_09A436: CMP.b #$13 ; LINKSTATE 13
#_09A438: BEQ Follower_DoLayers

#_09A43A: JSR Follower_CheckProximityToLink
#_09A43D: BCS Follower_DoLayers

#_09A43F: JSL Follower_Initialize

#_09A443: LDA.l $7EF3CC
#_09A447: TAX

#_09A448: LDA.w .replacement_follower,X
#_09A44B: STA.l $7EF3CC

#_09A44F: RTS

;===================================================================================================

Follower_DoLayers:
#_09A450: LDA.l $7EF3D2
#_09A454: TAX

#_09A455: CPX.b $EE
#_09A457: BNE .layer_mismatch

#_09A459: LDX.b $EE

.layer_mismatch
#_09A45B: LDA.w FollowerPriority,X
#_09A45E: STA.b $65
#_09A460: STZ.b $64

#_09A462: LDA.l $7EF3CD
#_09A466: STA.b $00

#_09A468: LDA.l $7EF3CE
#_09A46C: STA.b $01

#_09A46E: LDA.l $7EF3CF
#_09A472: STA.b $02

#_09A474: LDA.l $7EF3D0
#_09A478: STA.b $03

#_09A47A: LDX.b #$02

#_09A47C: LDA.l $7EF3CC
#_09A480: CMP.b #$0D ; FOLLOWER 0D
#_09A482: BEQ .bomb_or_chest

#_09A484: CMP.b #$0C ; FOLLOWER 0C
#_09A486: BEQ .bomb_or_chest

#_09A488: LDX.b #$01

.bomb_or_chest
#_09A48A: TXA
#_09A48B: BRL Follower_AnimateMovement_preserved

;===================================================================================================

Follower_CheckProximityToLink:
#_09A48E: DEC.w $02D2
#_09A491: BPL .too_far

#_09A493: STZ.w $02D2

#_09A496: REP #$20

#_09A498: LDA.l $7EF3CD
#_09A49C: SEC
#_09A49D: SBC.w #$0001

#_09A4A0: CMP.b $20
#_09A4A2: BCS .too_far

#_09A4A4: CLC
#_09A4A5: ADC.w #$0014
#_09A4A8: CMP.b $20
#_09A4AA: BCC .too_far

#_09A4AC: LDA.l $7EF3CF
#_09A4B0: SEC
#_09A4B1: SBC.w #$0001
#_09A4B4: CMP.b $22
#_09A4B6: BCS .too_far

#_09A4B8: CLC
#_09A4B9: ADC.w #$0014
#_09A4BC: CMP.b $22
#_09A4BE: BCC .too_far

;---------------------------------------------------------------------------------------------------

.good
#_09A4C0: SEP #$20

#_09A4C2: CLC

#_09A4C3: RTS

.too_far
#_09A4C4: SEP #$20

#_09A4C6: SEC

#_09A4C7: RTS

;===================================================================================================

pool Follower_HandleTrigger

.room_id
#_09A4C8: dw $00F1 ; ROOM 00F1 - old man cave
#_09A4CA: dw $0061 ; ROOM 0061 - castle lobby
#_09A4CC: dw $0051 ; ROOM 0051 - castle throne room
#_09A4CE: dw $0002 ; ROOM 0002 - pre-sanc
#_09A4D0: dw $00DB ; ROOM 00DB - TT entrance
#_09A4D2: dw $00AB ; ROOM 00AB - to TT attic
#_09A4D4: dw $0022 ; ROOM 0022 - sewer rats

.coordinates_uw
#_09A4D6: dw $1EF0, $0288, $0001, $0099, $0004 ; Old man - MESSAGE 0099
#_09A4E0: dw $1E58, $02F0, $0002, $009A, $0004 ; Old man - MESSAGE 009A
#_09A4EA: dw $1EA8, $03B8, $0004, $009B, $0004 ; Old man - MESSAGE 009B

#_09A4F4: dw $0CF8, $025B, $0001, $0021, $0001 ; Zelda - MESSAGE 0021
#_09A4FE: dw $0CF8, $039D, $0002, $0021, $0001 ; Zelda - MESSAGE 0021
#_09A508: dw $0C78, $0238, $0004, $0021, $0001 ; Zelda - MESSAGE 0021

#_09A512: dw $0A30, $02F8, $0001, $0022, $0001 ; Zelda - MESSAGE 0022

#_09A51C: dw $0178, $0550, $0001, $0023, $0001 ; Zelda - MESSAGE 0023
#_09A526: dw $0168, $04F8, $0002, $002A, $0001 ; Zelda - MESSAGE 002A

#_09A530: dw $1BD8, $16FC, $0001, $0124, $0006 ; Blind maiden - MESSAGE 0124

#_09A53A: dw $1520, $167C, $0001, $0124, $0006 ; Blind maiden - MESSAGE 0124

#_09A544: dw $05AC, $04FC, $0001, $0029, $0001 ; Zelda - MESSAGE 0029

;---------------------------------------------------------------------------------------------------

.overworld_id
#_09A54E: dw $0003 ; OW 03 - West DM
#_09A550: dw $005E ; OW 5E - POD
#_09A552: dw $0000 ; OW 00 - Lost woods

.coordinates_ow
#_09A554: dw $03C0, $0730, $0001, $009D, $0004 ; Old man - MESSAGE 009D

#_09A55E: dw $0648, $0F50, $0000, $FFFF, $000A ; Kiki
#_09A568: dw $06C8, $0D78, $0001, $FFFF, $000A ; Kiki
#_09A572: dw $0688, $0C78, $0002, $FFFF, $000A ; Kiki

#_09A57C: dw $00E8, $0090, $0000, $0028, $000E ; MS telepathy - MESSAGE 0028

;---------------------------------------------------------------------------------------------------

.room_boundaries_check
#_09A586: dw $0000, $001E, $003C, $0046
#_09A58E: dw $005A, $0064, $006E, $0078

.ow_boundaries_check
#_09A596: dw $0000, $000A, $0028, $0032

pool off

;---------------------------------------------------------------------------------------------------

Follower_HandleTrigger:
#_09A59E: LDA.b $11
#_09A5A0: BNE .fail_fast

#_09A5A2: REP #$30

#_09A5A4: LDY.w #$0000

#_09A5A7: LDA.b $1B
#_09A5A9: AND.w #$00FF
#_09A5AC: BEQ .overworld

#_09A5AE: INY

#_09A5AF: LDX.w #$000C
#_09A5B2: LDA.b $A0

.next_room_check
#_09A5B4: CMP.w .room_id,X
#_09A5B7: BEQ .room_match

#_09A5B9: DEX
#_09A5BA: DEX
#_09A5BB: BPL .next_room_check

#_09A5BD: BRA .fail_fast

;---------------------------------------------------------------------------------------------------

.overworld
#_09A5BF: LDX.w #$0004

#_09A5C2: LDA.b $8A

.next_screen_check
#_09A5C4: CMP.w .overworld_id,X
#_09A5C7: BEQ .overworld_match

#_09A5C9: DEX
#_09A5CA: DEX
#_09A5CB: BPL .next_screen_check

.fail_fast
#_09A5CD: BRL .exit

;---------------------------------------------------------------------------------------------------

.room_match
#_09A5D0: LDA.w .room_boundaries_check+2,X
#_09A5D3: STA.b $08

#_09A5D5: LDA.w .room_boundaries_check+0,X
#_09A5D8: TAX

.next_follower_uw
#_09A5D9: STX.b $0C
#_09A5DB: STZ.b $0A

#_09A5DD: LDA.l $7EF3CC
#_09A5E1: AND.w #$00FF
#_09A5E4: CMP.w .coordinates_uw+8,X
#_09A5E7: BNE .wrong_follower_uw

#_09A5E9: LDA.w .coordinates_uw+0,X
#_09A5EC: STA.b $00

#_09A5EE: LDA.w .coordinates_uw+2,X
#_09A5F1: STA.b $02

#_09A5F3: LDA.w .coordinates_uw+4,X
#_09A5F6: STA.b $06

#_09A5F8: LDA.w .coordinates_uw+6,X
#_09A5FB: STA.b $04

#_09A5FD: SEP #$30

#_09A5FF: JSR Follower_CheckForTrigger
#_09A602: BCS .trigger_activated

#_09A604: REP #$30

.wrong_follower_uw
#_09A606: LDA.b $0C
#_09A608: CLC
#_09A609: ADC.w #$000A
#_09A60C: TAX

#_09A60D: CPX.b $08
#_09A60F: BNE .next_follower_uw

#_09A611: BRL .exit

;---------------------------------------------------------------------------------------------------

.overworld_match
#_09A614: LDA.w .ow_boundaries_check+2,X
#_09A617: STA.b $08

#_09A619: LDA.w .ow_boundaries_check+0,X
#_09A61C: TAX

.next_follower_ow
#_09A61D: STX.b $0C
#_09A61F: STZ.b $0A

#_09A621: LDA.l $7EF3CC
#_09A625: AND.w #$00FF
#_09A628: CMP.w .coordinates_ow+8,X
#_09A62B: BNE .wrong_follower_ow

#_09A62D: LDA.w .coordinates_ow+0,X
#_09A630: STA.b $00

#_09A632: LDA.w .coordinates_ow+2,X
#_09A635: STA.b $02

#_09A637: LDA.w .coordinates_ow+4,X
#_09A63A: STA.b $06

#_09A63C: LDA.w .coordinates_ow+6,X
#_09A63F: STA.b $04

#_09A641: SEP #$30

#_09A643: JSR Follower_CheckForTrigger
#_09A646: BCS .trigger_activated

#_09A648: REP #$30

.wrong_follower_ow
#_09A64A: LDA.b $0C
#_09A64C: CLC
#_09A64D: ADC.w #$000A
#_09A650: TAX

#_09A651: CPX.b $08
#_09A653: BNE .next_follower_ow

#_09A655: BRA .exit

;---------------------------------------------------------------------------------------------------

.trigger_activated
#_09A657: SEP #$10
#_09A659: REP #$20

#_09A65B: LDA.w $02F2
#_09A65E: AND.b $06
#_09A660: BNE .exit

#_09A662: LDA.b $06
#_09A664: TSB.w $02F2

#_09A667: LDA.b $04
#_09A669: STA.w $1CF0

#_09A66C: CMP.w #$FFFF
#_09A66F: BEQ .no_message

#_09A671: CMP.w #$009D ; MESSAGE 009D
#_09A674: BEQ .old_man_ow_message

#_09A676: CMP.w #$0028 ; MESSAGE 0028
#_09A679: BNE .continue_with_message_id

#_09A67B: SEP #$20

#_09A67D: LDA.b #$00
#_09A67F: STA.l $7EF3CC

#_09A683: BRA .continue_with_message_id

;---------------------------------------------------------------------------------------------------

.old_man_ow_message
#_09A685: SEP #$20

#_09A687: LDA.w $02CF
#_09A68A: INC A
#_09A68B: CMP.b #$14
#_09A68D: BNE .dont_reset_movement_index_geezer

#_09A68F: LDA.b #$00

.dont_reset_movement_index_geezer
#_09A691: JSL OldMan_RevertToSprite

.continue_with_message_id
#_09A695: SEP #$20

#_09A697: JSL Interface_PrepAndDisplayMessage

#_09A69B: BRA .exit

;---------------------------------------------------------------------------------------------------

.no_message
#_09A69D: SEP #$30

#_09A69F: LDA.w $02CF
#_09A6A2: INC A
#_09A6A3: CMP.b #$14
#_09A6A5: BNE .dont_reset_movement_index_kiki

#_09A6A7: LDA.b #$00

.dont_reset_movement_index_kiki
#_09A6A9: PHA

#_09A6AA: LDA.b $06
#_09A6AC: AND.b #$03
#_09A6AE: BNE .dont_revert_to_sprite

#_09A6B0: PLA
#_09A6B1: JSL Kiki_RevertToSprite

#_09A6B5: BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_revert_to_sprite
#_09A6B7: PLA
#_09A6B8: STA.b $00

#_09A6BA: LDX.b $8A

#_09A6BC: LDA.l $7EF280,X
#_09A6C0: AND.b #$01
#_09A6C2: BNE .exit

#_09A6C4: LDA.b $00
#_09A6C6: JSL Kiki_SpawnHandler_A

;---------------------------------------------------------------------------------------------------

.exit
#_09A6CA: SEP #$30

#_09A6CC: RTS

;===================================================================================================

pool FollowerDraw_Drawing

.props
#_09A6CD: db $20, $C0, $00 ; up
#_09A6D0: db $00, $A0, $00 ; down
#_09A6D3: db $40, $60, $00 ; left
#_09A6D6: db $40, $60, $44 ; right

#_09A6D9: db $20, $C0, $04 ; up
#_09A6DC: db $00, $A0, $04 ; down
#_09A6DF: db $40, $80, $00 ; left
#_09A6E2: db $40, $80, $44 ; right

#_09A6E5: db $20, $E0, $00 ; up
#_09A6E8: db $00, $E0, $00 ; down
#_09A6EB: db $40, $E0, $00 ; left
#_09A6EE: db $40, $E0, $44 ; right

#_09A6F1: db $20, $E0, $04 ; up
#_09A6F4: db $00, $E0, $04 ; down
#_09A6F7: db $40, $E0, $04 ; left
#_09A6FA: db $40, $E0, $40 ; right

;---------------------------------------------------------------------------------------------------

.char_offset
#_09A6FD: dw  -2,   0,   0,   0 ; up
#_09A705: dw  -2,   0,   0,   0
#_09A70D: dw  -2,   0,   0,   0 ; down
#_09A715: dw  -2,   0,   0,   0
#_09A71D: dw  -1,   0,   1,   0 ; left
#_09A725: dw  -1,   0,   1,   0
#_09A72D: dw  -1,   0,   1,   0 ; right
#_09A735: dw  -1,   0,   1,   0

#_09A73D: dw   0,   0,   0,   0 ; up
#_09A745: dw   0,   0,   0,   0
#_09A74D: dw   0,   0,   0,   0 ; down
#_09A755: dw   0,   0,   0,   0
#_09A75D: dw   1,   0,   0,   0 ; left
#_09A765: dw   1,   0,   0,   0
#_09A76D: dw   1,   0,   0,   0 ; right
#_09A775: dw   1,   0,   0,   0

#_09A77D: dw   0,   0,   0,   0 ; up
#_09A785: dw   0,   0,   0,   0
#_09A78D: dw   0,  -3,   0,   0 ; down
#_09A795: dw   0,   3,   0,   0
#_09A79D: dw   1,   0,   0,   0 ; left
#_09A7A5: dw   1,   0,   0,   0
#_09A7AD: dw   1,  -3,   1,   0 ; right
#_09A7B5: dw   1,   3,   1,   0

#_09A7BD: dw   0,   0,   0,   0 ; up
#_09A7C5: dw   0,   0,   0,   0
#_09A7CD: dw   0,   0,   0,   0 ; down
#_09A7D5: dw   0,   0,   0,   0
#_09A7DD: dw   0,   0,   1,   0 ; left
#_09A7E5: dw   0,   0,   1,   0
#_09A7ED: dw   0,   0,   1,   0 ; right
#_09A7F5: dw   0,   0,   1,   0

#_09A7FD: dw  -1,   0,   0,   0 ; up
#_09A805: dw  -1,   0,   0,   0
#_09A80D: dw  -1,   0,   0,   0 ; down
#_09A815: dw  -1,   0,   0,   0
#_09A81D: dw   0,   0,   1,   0 ; left
#_09A825: dw   0,   0,   1,   0
#_09A82D: dw   0,   0,   1,   0 ; right
#_09A835: dw   0,   0,   1,   0

#_09A83D: dw   0,   0,   0,   0
#_09A845: dw   0,   0,   0,   0
#_09A84D: dw   0,   0,   0,   0
#_09A855: dw   0,   0,   0,   0
#_09A85D: dw   0,   0,   0,   0
#_09A865: dw   0,   0,   0,   0
#_09A86D: dw   0,   0,   0,   0
#_09A875: dw   0,   0,   0,   0

#_09A87D: dw   2,   0,   0,   0 ; up
#_09A885: dw   2,   0,   0,   0
#_09A88D: dw   2,  -1,   0,   0 ; down
#_09A895: dw   2,   1,   0,   0
#_09A89D: dw   3,   0,   1,   0 ; left
#_09A8A5: dw   3,   0,   1,   0
#_09A8AD: dw   3,  -1,   1,   0 ; right
#_09A8B5: dw   3,   1,   1,   0

;---------------------------------------------------------------------------------------------------

.char_data_offset
#_09A8BD: dw $0000 ; 0x00 - No follower
#_09A8BF: dw $0000 ; 0x01 - Zelda
#_09A8C1: dw $0080 ; 0x02 - Old man that stops following you
#_09A8C3: dw $0080 ; 0x03 - Unused old man
#_09A8C5: dw $0080 ; 0x04 - Normal old man
#_09A8C7: dw $0000 ; 0x05 - Zelda rescue telepathy
#_09A8C9: dw $0000 ; 0x06 - Blind maiden
#_09A8CB: dw $00C0 ; 0x07 - Frogsmith
#_09A8CD: dw $00C0 ; 0x08 - Smithy
#_09A8CF: dw $0100 ; 0x09 - Locksmith
#_09A8D1: dw $0180 ; 0x0A - Kiki
#_09A8D3: dw $0180 ; 0x0B - Unused old man
#_09A8D5: dw $0140 ; 0x0C - Purple chest
#_09A8D7: dw $0140 ; 0x0D - Super bomb

.head_body_char
#_09A8D9: db $D8, $24, $D8, $64
#_09A8DD: db $D9, $24, $D9, $64
#_09A8E1: db $DA, $24, $DA, $64
#_09A8E5: db $C8, $22, $C8, $62
#_09A8E9: db $C9, $22, $C9, $62
#_09A8ED: db $CA, $22, $CA, $62

;---------------------------------------------------------------------------------------------------

.oam_region_offsets_a
#_09A8F1: dw $0170
#_09A8F3: dw $00C0

.oam_region_offsets_b
#_09A8F5: dw $01C0
#_09A8F7: dw $0110

;---------------------------------------------------------------------------------------------------

.palette
#_09A8F9: db $00 ; 0x00 - No follower
#_09A8FA: db $04 ; 0x01 - Zelda
#_09A8FB: db $04 ; 0x02 - Old man that stops following you
#_09A8FC: db $04 ; 0x03 - Unused old man
#_09A8FD: db $04 ; 0x04 - Normal old man
#_09A8FE: db $00 ; 0x05 - Zelda rescue telepathy
#_09A8FF: db $07 ; 0x06 - Blind maiden
#_09A900: db $04 ; 0x07 - Frogsmith
#_09A901: db $04 ; 0x08 - Smithy
#_09A902: db $03 ; 0x09 - Locksmith
#_09A903: db $04 ; 0x0A - Kiki
#_09A904: db $04 ; 0x0B - Unused old man
#_09A905: db $04 ; 0x0C - Purple chest
#_09A906: db $04 ; 0x0D - Super bomb

pool off

;---------------------------------------------------------------------------------------------------

Follower_Draw:
#_09A907: LDA.w $02F9
#_09A90A: BEQ .do_indeed_draw

#_09A90C: RTS

;---------------------------------------------------------------------------------------------------

.do_indeed_draw
#_09A90D: PHX
#_09A90E: PHY

#_09A90F: LDX.w $02CF

#_09A912: LDA.w $1A50,X
#_09A915: BEQ .not_floating_outdoors

#_09A917: LDA.b $1B
#_09A919: BNE .not_floating_outdoors

#_09A91B: LDA.b #$20
#_09A91D: BRA .continue

.not_floating_outdoors
#_09A91F: LDA.b $11
#_09A921: CMP.b #$0E
#_09A923: BNE .dont_copy_priority

#_09A925: LDY.b $EE
#_09A927: LDA.w FollowerPriority,Y

#_09A92A: BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_copy_priority
#_09A92C: LDA.w $1A64,X
#_09A92F: AND.b #$0C
#_09A931: ASL A
#_09A932: ASL A

.continue
#_09A933: STA.b $65
#_09A935: STZ.b $64

#_09A937: LDX.w $02CF
#_09A93A: BPL .no_back_wrap

#_09A93C: LDX.b #$00

.no_back_wrap
#_09A93E: LDA.w $1A00,X
#_09A941: STA.b $00

#_09A943: LDA.w $1A14,X
#_09A946: STA.b $01

#_09A948: LDA.w $1A28,X
#_09A94B: STA.b $02

#_09A94D: LDA.w $1A3C,X
#_09A950: STA.b $03

#_09A952: LDA.w $1A64,X

#_09A955: BRA Follower_AnimateMovement

;===================================================================================================

Follower_AnimateMovement_preserved:
#_09A957: PHX
#_09A958: PHY

;===================================================================================================

Follower_AnimateMovement:
#_09A959: STA.b $05

#_09A95B: AND.b #$20
#_09A95D: LSR A
#_09A95E: LSR A
#_09A95F: TAY

#_09A960: LDA.b $05
#_09A962: AND.b #$03
#_09A964: STA.b $04

#_09A966: STZ.b $72

#_09A968: CPY.b #$08
#_09A96A: BNE .low_priority

#_09A96C: LDY.b #$00

#_09A96E: LDA.l $7EF3CC
#_09A972: CMP.b #$06 ; FOLLOWER 06
#_09A974: BEQ .not_blind_maiden

#_09A976: CMP.b #$01 ; FOLLOWER 01
#_09A978: BNE .low_priority

.not_blind_maiden
#_09A97A: LDY.b #$08

#_09A97C: LDA.w $033C
#_09A97F: ORA.w $033D
#_09A982: ORA.w $033E
#_09A985: ORA.w $033F
#_09A988: BEQ .no_collision

#_09A98A: LDA.b $1A
#_09A98C: AND.b #$08
#_09A98E: LSR A
#_09A98F: BRA FollowerDraw_Drawing

.no_collision
#_09A991: LDA.b $1A
#_09A993: AND.b #$10
#_09A995: LSR A
#_09A996: LSR A

#_09A997: BRA FollowerDraw_Drawing

;---------------------------------------------------------------------------------------------------

.low_priority
#_09A999: LDA.b $11
#_09A99B: CMP.b #$0E
#_09A99D: BEQ .check_dashing

#_09A99F: CMP.b #$08
#_09A9A1: BEQ .check_dashing

#_09A9A3: CMP.b #$10
#_09A9A5: BEQ .check_dashing

#_09A9A7: LDA.l $7EF3CC
#_09A9AB: CMP.b #$0B ; FOLLOWER 0B
#_09A9AD: BEQ .not_dashing

#_09A9AF: CMP.b #$0D ; FOLLOWER 0D
#_09A9B1: BEQ .super_bomb

#_09A9B3: CMP.b #$0C ; FOLLOWER 0C
#_09A9B5: BNE .not_purple_chest

.super_bomb
#_09A9B7: LDA.l $7EF3D3
#_09A9BB: BNE .immobile

;---------------------------------------------------------------------------------------------------

.not_purple_chest
#_09A9BD: LDA.w $02E4
#_09A9C0: BNE .immobile

#_09A9C2: LDA.b $11
#_09A9C4: CMP.b #$0A
#_09A9C6: BEQ .immobile

#_09A9C8: LDA.b $10
#_09A9CA: CMP.b #$09
#_09A9CC: BNE .not_overworld

#_09A9CE: LDA.b $11
#_09A9D0: CMP.b #$23
#_09A9D2: BEQ .immobile

;---------------------------------------------------------------------------------------------------

.not_overworld
#_09A9D4: LDA.b $10
#_09A9D6: CMP.b #$0E
#_09A9D8: BNE .not_interface

#_09A9DA: LDA.b $11
#_09A9DC: CMP.b #$01
#_09A9DE: BEQ .immobile

#_09A9E0: CMP.b #$02
#_09A9E2: BEQ .immobile

;---------------------------------------------------------------------------------------------------

.not_interface
#_09A9E4: LDA.b $30
#_09A9E6: ORA.b $31
#_09A9E8: BNE .check_dashing

.immobile
#_09A9EA: LDA.b #$04
#_09A9EC: STA.b $72

#_09A9EE: BRA FollowerDraw_Drawing

;---------------------------------------------------------------------------------------------------

.check_dashing
#_09A9F0: LDA.w $0372
#_09A9F3: BEQ .not_dashing

#_09A9F5: LDA.b $1A
#_09A9F7: AND.b #$04
#_09A9F9: BRA FollowerDraw_Drawing

.not_dashing
#_09A9FB: LDA.b $1A
#_09A9FD: AND.b #$08
#_09A9FF: LSR A

;===================================================================================================

FollowerDraw_Drawing:
#_09AA00: CLC
#_09AA01: ADC.b $04
#_09AA03: STA.b $04

#_09AA05: TYA
#_09AA06: CLC
#_09AA07: ADC.b $04
#_09AA09: STA.b $04

;---------------------------------------------------------------------------------------------------

#_09AA0B: REP #$20

#_09AA0D: LDA.w $0FB3
#_09AA10: AND.w #$00FF
#_09AA13: ASL A
#_09AA14: TAY

#_09AA15: LDA.b $20
#_09AA17: CMP.b $00
#_09AA19: BEQ .check_priority_for_region
#_09AA1B: BCS .use_region_b

#_09AA1D: BRA .use_region_a

.check_priority_for_region
#_09AA1F: LDA.b $05
#_09AA21: AND.w #$0003
#_09AA24: BNE .use_region_b

.use_region_a
#_09AA26: LDA.w .oam_region_offsets_a,Y
#_09AA29: BRA .set_region

.use_region_b
#_09AA2B: LDA.w .oam_region_offsets_b,Y

.set_region
#_09AA2E: PHA

#_09AA2F: LSR A
#_09AA30: LSR A
#_09AA31: CLC
#_09AA32: ADC.w #$0A20
#_09AA35: STA.b $92

#_09AA37: PLA
#_09AA38: CLC
#_09AA39: ADC.w #$0800
#_09AA3C: STA.b $90

;---------------------------------------------------------------------------------------------------

#_09AA3E: LDA.b $00
#_09AA40: SEC
#_09AA41: SBC.b $E8
#_09AA43: STA.b $06

#_09AA45: LDA.b $02
#_09AA47: SEC
#_09AA48: SBC.b $E2
#_09AA4A: STA.b $08

#_09AA4C: SEP #$20

#_09AA4E: LDY.b #$00
#_09AA50: LDX.b #$00

#_09AA52: LDA.l $7EF3CC

#_09AA56: CMP.b #$01 ; FOLLOWER 01
#_09AA58: BEQ .girly_follower

#_09AA5A: CMP.b #$06 ; FOLLOWER 06
#_09AA5C: BEQ .girly_follower

#_09AA5E: LDA.b $05
#_09AA60: AND.b #$20
#_09AA62: BEQ .girly_follower

#_09AA64: BRA .not_girly_follower

.girly_follower
#_09AA66: LDA.b $05
#_09AA68: AND.b #$C0
#_09AA6A: BNE .some_flip

#_09AA6C: BRL .do_chars

.some_flip
#_09AA6F: LDA.b $05
#_09AA71: AND.b #$80
#_09AA73: BNE .not_girly_follower

#_09AA75: LDX.b #$0C

#_09AA77: LDA.b $72
#_09AA79: BEQ .not_girly_follower

#_09AA7B: LDA.b #$00
#_09AA7D: BRA .set_repri

.not_girly_follower
#_09AA7F: LDA.b $1A
#_09AA81: AND.b #$07
#_09AA83: BNE .dont_shimmy

#_09AA85: LDA.w $02D7
#_09AA88: INC A
#_09AA89: CMP.b #$03
#_09AA8B: BNE .set_repri

#_09AA8D: LDA.b #$00

.set_repri
#_09AA8F: STA.w $02D7

;---------------------------------------------------------------------------------------------------

.dont_shimmy
#_09AA92: LDA.w $02D7
#_09AA95: ASL A
#_09AA96: ASL A
#_09AA97: STA.b $05

#_09AA99: TXA
#_09AA9A: CLC
#_09AA9B: ADC.b $05
#_09AA9D: TAX

#_09AA9E: REP #$20

#_09AAA0: LDA.b $06
#_09AAA2: CLC
#_09AAA3: ADC.w #$0010
#_09AAA6: STA.b $00

#_09AAA8: LDA.b $08
#_09AAAA: STA.b $02

#_09AAAC: STZ.b $74

;---------------------------------------------------------------------------------------------------

#_09AAAE: SEP #$20

#_09AAB0: JSR FollowerDraw_CalculateOAMCoords

#_09AAB3: LDA.w .head_body_char+0,X
#_09AAB6: STA.b ($90),Y

#_09AAB8: INY

#_09AAB9: LDA.w .head_body_char+1,X
#_09AABC: STA.b ($90),Y

#_09AABE: INY

#_09AABF: PHY
#_09AAC0: TYA
#_09AAC1: SEC
#_09AAC2: SBC.b #$04

#_09AAC4: LSR A
#_09AAC5: LSR A
#_09AAC6: TAY

#_09AAC7: LDA.b #$00
#_09AAC9: ORA.b $75
#_09AACB: STA.b ($92),Y

#_09AACD: PLY

;---------------------------------------------------------------------------------------------------

#_09AACE: REP #$20

#_09AAD0: LDA.b $02
#_09AAD2: CLC
#_09AAD3: ADC.w #$0008
#_09AAD6: STA.b $02

#_09AAD8: STZ.b $74

#_09AADA: SEP #$20

#_09AADC: JSR FollowerDraw_CalculateOAMCoords

#_09AADF: LDA.w .head_body_char+2,X
#_09AAE2: STA.b ($90),Y

#_09AAE4: INY

#_09AAE5: LDA.w .head_body_char+3,X
#_09AAE8: STA.b ($90),Y

#_09AAEA: INY

#_09AAEB: PHY

#_09AAEC: TYA
#_09AAED: SEC
#_09AAEE: SBC.b #$04

#_09AAF0: LSR A
#_09AAF1: LSR A
#_09AAF2: TAY

#_09AAF3: LDA.b #$00
#_09AAF5: ORA.b $75
#_09AAF7: STA.b ($92),Y

#_09AAF9: PLY

;---------------------------------------------------------------------------------------------------

.do_chars
#_09AAFA: LDA.l $7EF3CC
#_09AAFE: TAX

#_09AAFF: LDA.w .palette,X
#_09AB02: CMP.b #$07
#_09AB04: BNE .not_link_palette_a

#_09AB06: TAX

#_09AB07: LDA.w $0ABD
#_09AB0A: BEQ .no_trans_a

#_09AB0C: LDX.b #$00

.no_trans_a
#_09AB0E: TXA

;---------------------------------------------------------------------------------------------------

.not_link_palette_a
#_09AB0F: ASL A
#_09AB10: STA.b $72

#_09AB12: LDA.l $7EF3CC
#_09AB16: CMP.b #$0D ; FOLLOWER 0D
#_09AB18: BNE .not_exploding_superbomb

#_09AB1A: LDA.w $04B4
#_09AB1D: CMP.b #$01
#_09AB1F: BNE .not_exploding_superbomb

#_09AB21: LDA.b $1A
#_09AB23: AND.b #$07
#_09AB25: ASL A
#_09AB26: STA.b $72

;---------------------------------------------------------------------------------------------------

.not_exploding_superbomb
#_09AB28: LDA.l $7EF3CC
#_09AB2C: CMP.b #$0D ; FOLLOWER 0D
#_09AB2E: BEQ .bomb_or_chest

#_09AB30: CMP.b #$0C ; FOLLOWER 0C
#_09AB32: BEQ .bomb_or_chest

;---------------------------------------------------------------------------------------------------

#_09AB34: REP #$30

#_09AB36: PHY

#_09AB37: LDA.b $04
#_09AB39: AND.w #$00FF
#_09AB3C: ASL A
#_09AB3D: ASL A
#_09AB3E: ASL A
#_09AB3F: TAY

#_09AB40: LDA.l $7EF3CC
#_09AB44: AND.w #$00FF
#_09AB47: ASL A
#_09AB48: TAX

#_09AB49: TYA
#_09AB4A: CLC
#_09AB4B: ADC.w .char_data_offset,X
#_09AB4E: TAX

#_09AB4F: LDA.w .char_offset+0,X
#_09AB52: CLC
#_09AB53: ADC.b $06
#_09AB55: STA.b $00

#_09AB57: LDA.w .char_offset+2,X
#_09AB5A: CLC
#_09AB5B: ADC.b $08
#_09AB5D: STA.b $02

#_09AB5F: PLY

;---------------------------------------------------------------------------------------------------

#_09AB60: SEP #$30

#_09AB62: JSR FollowerDraw_CalculateOAMCoords

#_09AB65: LDA.b #$20
#_09AB67: STA.b ($90),Y

#_09AB69: INY

#_09AB6A: LDA.b $04
#_09AB6C: ASL A
#_09AB6D: CLC
#_09AB6E: ADC.b $04
#_09AB70: TAX

#_09AB71: LDA.w .props+0,X
#_09AB74: STA.w $0AE8

#_09AB77: LDA.w .props+2,X
#_09AB7A: AND.b #$F0
#_09AB7C: ORA.b $72
#_09AB7E: ORA.b $65
#_09AB80: STA.b ($90),Y

#_09AB82: INY
#_09AB83: PHY

#_09AB84: TYA
#_09AB85: SEC
#_09AB86: SBC.b #$04
#_09AB88: LSR A
#_09AB89: LSR A
#_09AB8A: TAY

#_09AB8B: LDA.b #$02
#_09AB8D: ORA.b $75
#_09AB8F: STA.b ($92),Y

#_09AB91: PLY

;---------------------------------------------------------------------------------------------------

.bomb_or_chest
#_09AB92: REP #$30

#_09AB94: PHY

#_09AB95: LDA.b $04
#_09AB97: AND.w #$00FF
#_09AB9A: ASL A
#_09AB9B: ASL A
#_09AB9C: ASL A
#_09AB9D: TAY

#_09AB9E: LDA.l $7EF3CC
#_09ABA2: AND.w #$00FF
#_09ABA5: ASL A
#_09ABA6: TAX

#_09ABA7: TYA
#_09ABA8: CLC
#_09ABA9: ADC.w .char_data_offset,X
#_09ABAC: TAX

#_09ABAD: LDA.w .char_offset+4,X
#_09ABB0: CLC
#_09ABB1: ADC.b $06
#_09ABB3: CLC
#_09ABB4: ADC.w #$0008
#_09ABB7: STA.b $00

#_09ABB9: LDA.w .char_offset+6,X
#_09ABBC: CLC
#_09ABBD: ADC.b $08
#_09ABBF: STA.b $02

#_09ABC1: PLY

;---------------------------------------------------------------------------------------------------

#_09ABC2: SEP #$30

#_09ABC4: JSR FollowerDraw_CalculateOAMCoords

#_09ABC7: LDA.b #$22
#_09ABC9: STA.b ($90),Y

#_09ABCB: INY

#_09ABCC: LDA.b $04
#_09ABCE: ASL A
#_09ABCF: CLC
#_09ABD0: ADC.b $04
#_09ABD2: TAX

#_09ABD3: LDA.w .props+1,X
#_09ABD6: STA.w $0AEA

#_09ABD9: LDA.w .props+2,X
#_09ABDC: AND.b #$0F

#_09ABDE: ASL A
#_09ABDF: ASL A
#_09ABE0: ASL A
#_09ABE1: ASL A

#_09ABE2: ORA.b $72
#_09ABE4: ORA.b $65
#_09ABE6: STA.b ($90),Y

#_09ABE8: INY

#_09ABE9: TYA
#_09ABEA: SEC
#_09ABEB: SBC.b #$04
#_09ABED: LSR A
#_09ABEE: LSR A
#_09ABEF: TAY

#_09ABF0: LDA.b #$02
#_09ABF2: ORA.b $75
#_09ABF4: STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

#_09ABF6: PLY
#_09ABF7: PLX

#_09ABF8: RTS

;===================================================================================================

FollowerDraw_CalculateOAMCoords:
#_09ABF9: REP #$20

#_09ABFB: LDA.b $02
#_09ABFD: STA.b ($90),Y

#_09ABFF: INY

#_09AC00: CLC
#_09AC01: ADC.w #$0080
#_09AC04: CMP.w #$0180
#_09AC07: BCS .off_screen

#_09AC09: LDA.b $02
#_09AC0B: AND.w #$0100
#_09AC0E: STA.b $74

#_09AC10: LDA.b $00
#_09AC12: STA.b ($90),Y

#_09AC14: CLC
#_09AC15: ADC.w #$0010
#_09AC18: CMP.w #$0100
#_09AC1B: BCC .on_screen

.off_screen
#_09AC1D: LDA.w #$00F0
#_09AC20: STA.b ($90),Y

.on_screen
#_09AC22: SEP #$20

#_09AC24: INY

#_09AC25: RTS

;===================================================================================================

Follower_CheckForTrigger:
#_09AC26: REP #$20

#_09AC28: LDA.b $00
#_09AC2A: CLC
#_09AC2B: ADC.b $0A
#_09AC2D: CLC
#_09AC2E: ADC.w #$0008
#_09AC31: STA.b $00

#_09AC33: LDA.b $02
#_09AC35: CLC
#_09AC36: ADC.w #$0008
#_09AC39: STA.b $02

#_09AC3B: LDA.b $20
#_09AC3D: CLC
#_09AC3E: ADC.w #$000C
#_09AC41: SEC
#_09AC42: SBC.b $00
#_09AC44: BPL .positive_y

#_09AC46: EOR.w #$FFFF
#_09AC49: INC A

.positive_y
#_09AC4A: CMP.w #$001C
#_09AC4D: BCS .no_trigger

#_09AC4F: LDA.b $22
#_09AC51: CLC
#_09AC52: ADC.w #$000C
#_09AC55: SEC
#_09AC56: SBC.b $02
#_09AC58: BPL .positive_x

#_09AC5A: EOR.w #$FFFF
#_09AC5D: INC A

.positive_x
#_09AC5E: CMP.w #$0018
#_09AC61: BCS .no_trigger

;---------------------------------------------------------------------------------------------------

.trigger
#_09AC63: SEP #$20
#_09AC65: SEC

#_09AC66: RTS

.no_trigger
#_09AC67: SEP #$20
#_09AC69: CLC

#_09AC6A: RTS

;===================================================================================================

Ancilla_TerminateSelectInteractives:
#_09AC6B: PHB
#_09AC6C: PHK
#_09AC6D: PLB

#_09AC6E: LDX.b #$05

.next_slot
#_09AC70: LDA.w $0C4A,X
#_09AC73: CMP.b #$3E ; ANCILLA 3E
#_09AC75: BNE .not_crystal

#_09AC77: TXY

#_09AC78: BRA .check_carrying

.not_crystal
#_09AC7A: LDA.w $0C4A,X
#_09AC7D: CMP.b #$2C ; ANCILLA 2C
#_09AC7F: BNE .check_carrying

#_09AC81: STZ.w $0646

#_09AC84: LDA.b $48
#_09AC86: AND.b #$80
#_09AC88: BEQ .check_carrying

#_09AC8A: STZ.b $48
#_09AC8C: STZ.b $5E

.check_carrying
#_09AC8E: LDA.w $0308
#_09AC91: BPL .not_carrying

#_09AC93: TXA
#_09AC94: INC A
#_09AC95: CMP.w $02EC
#_09AC98: BEQ .nothing_nearby

#_09AC9A: BRA .delete_ancilla

;---------------------------------------------------------------------------------------------------

.not_carrying
#_09AC9C: TXA
#_09AC9D: INC A
#_09AC9E: CMP.w $02EC
#_09ACA1: BNE .delete_ancilla

#_09ACA3: STZ.w $02EC

.delete_ancilla
#_09ACA6: STZ.w $0C4A,X

.nothing_nearby
#_09ACA9: DEX
#_09ACAA: BPL .next_slot

;---------------------------------------------------------------------------------------------------

#_09ACAC: LDA.w $037A
#_09ACAF: AND.b #$10
#_09ACB1: BEQ .not_netting

#_09ACB3: STZ.b $46
#_09ACB5: STZ.w $037A

.not_netting
#_09ACB8: STZ.w $03F0

#_09ACBB: STZ.w $02F2
#_09ACBE: STZ.w $02F3

#_09ACC1: STZ.w $035F
#_09ACC4: STZ.w $03FC

#_09ACC7: STZ.w $037B
#_09ACCA: STZ.w $03FD

#_09ACCD: STZ.w $0360

;---------------------------------------------------------------------------------------------------

#_09ACD0: LDA.b $5D
#_09ACD2: CMP.b #$13 ; LINKSTATE 13
#_09ACD4: BNE .not_hooking

#_09ACD6: LDA.b #$00 ; LINKSTATE 00
#_09ACD8: STA.b $5D

#_09ACDA: LDA.b $3A
#_09ACDC: AND.b #$BF
#_09ACDE: STA.b $3A

#_09ACE0: LDA.b $50
#_09ACE2: AND.b #$FE
#_09ACE4: STA.b $50

#_09ACE6: LDA.w $037A
#_09ACE9: AND.b #$FB
#_09ACEB: STA.w $037A

#_09ACEE: STZ.w $037E

;---------------------------------------------------------------------------------------------------

.not_hooking
#_09ACF1: PLB

#_09ACF2: RTL

;===================================================================================================

Follower_Disable:
#_09ACF3: LDA.l $7EF3CC
#_09ACF7: CMP.b #$0A ; FOLLOWER 0A
#_09ACF9: BEQ .kiki

#_09ACFB: CMP.b #$09 ; FOLLOWER 09
#_09ACFD: BNE .exit

.kiki
#_09ACFF: LDA.b #$00
#_09AD01: STA.l $7EF3CC

.exit
#_09AD05: RTL

;===================================================================================================

Ancilla_SetCoordinates:
#_09AD06: LDA.b $00
#_09AD08: STA.w $0BFA,X

#_09AD0B: LDA.b $01
#_09AD0D: STA.w $0C0E,X

#_09AD10: LDA.b $02
#_09AD12: STA.w $0C04,X

#_09AD15: LDA.b $03
#_09AD17: STA.w $0C18,X

#_09AD1A: RTS

;===================================================================================================

Ancilla_GetCoordinates:
#_09AD1B: LDA.w $0BFA,X
#_09AD1E: STA.b $00

#_09AD20: LDA.w $0C0E,X
#_09AD23: STA.b $01

#_09AD25: LDA.w $0C04,X
#_09AD28: STA.b $02

#_09AD2A: LDA.w $0C18,X
#_09AD2D: STA.b $03

#_09AD2F: RTS

;===================================================================================================

AncillaAdd_ExplodingSomariaBlock:
#_09AD30: PHB
#_09AD31: PHK
#_09AD32: PLB

#_09AD33: LDA.b #$2E ; ANCILLA 2E
#_09AD35: STA.w $0C4A,X

#_09AD38: PHX

#_09AD39: TAX

#_09AD3A: LDA.l AncillaObjectAllocation,X

#_09AD3E: PLX

#_09AD3F: STA.w $0C90,X

#_09AD42: LDA.b #$03
#_09AD44: STA.w $03B1,X

#_09AD47: STZ.w $0C54,X
#_09AD4A: STZ.w $0C5E,X

#_09AD4D: STZ.w $039F,X
#_09AD50: STZ.w $03A4,X

#_09AD53: STZ.w $03EA,X
#_09AD56: STZ.w $0280,X

#_09AD59: STZ.w $0646

#_09AD5C: JSL Ancilla_CalculateSFXPan
#_09AD60: ORA.b #$01 ; SFX3.01
#_09AD62: STA.w $012F

#_09AD65: PLB

#_09AD66: RTL

;===================================================================================================

pool Ancilla_AddRupees

.value
#_09AD67: db   1
#_09AD68: db   5
#_09AD69: db  20
#_09AD6A: db 100
#_09AD6B: db  50

pool off

;---------------------------------------------------------------------------------------------------

Ancilla_AddRupees:
#_09AD6C: PHB
#_09AD6D: PHK
#_09AD6E: PLB

#_09AD6F: LDA.w $0C5E,X
#_09AD72: CMP.b #$34 ; ITEMGET 34
#_09AD74: BEQ .low

#_09AD76: CMP.b #$35 ; ITEMGET 35
#_09AD78: BEQ .low

#_09AD7A: CMP.b #$36 ; ITEMGET 36
#_09AD7C: BEQ .low

#_09AD7E: CMP.b #$40 ; ITEMGET 40
#_09AD80: BEQ .big

#_09AD82: CMP.b #$41 ; ITEMGET 41
#_09AD84: BEQ .big

#_09AD86: CMP.b #$46 ; ITEMGET 46
#_09AD88: BEQ .absolutely_massive

#_09AD8A: CMP.b #$47 ; ITEMGET 47
#_09AD8C: BNE .not_rupees

;---------------------------------------------------------------------------------------------------

.absolutely_massive
#_09AD8E: LDY.b #$02
#_09AD90: CMP.b #$47 ; ITEMGET 47
#_09AD92: BEQ .add_value

#_09AD94: LDA.b #$2C
#_09AD96: STA.b $00

#_09AD98: LDA.b #$01
#_09AD9A: STA.b $01

#_09AD9C: BRA .add_to_purse

;---------------------------------------------------------------------------------------------------

.big
#_09AD9E: SEC
#_09AD9F: SBC.b #$40 ; ITEMGET 40
#_09ADA1: CLC
#_09ADA2: ADC.b #$03
#_09ADA4: TAY

#_09ADA5: BRA .add_value

;---------------------------------------------------------------------------------------------------

.low
#_09ADA7: SEC
#_09ADA8: SBC.b #$34 ; ITEMGET 34
#_09ADAA: TAY

;---------------------------------------------------------------------------------------------------

.add_value
#_09ADAB: LDA.w .value,Y
#_09ADAE: STA.b $00
#_09ADB0: STZ.b $01

;---------------------------------------------------------------------------------------------------

.add_to_purse
#_09ADB2: REP #$20

#_09ADB4: LDA.l $7EF360
#_09ADB8: CLC
#_09ADB9: ADC.b $00
#_09ADBB: STA.l $7EF360

;---------------------------------------------------------------------------------------------------

#_09ADBF: SEP #$20
#_09ADC1: SEC

#_09ADC2: PLB

#_09ADC3: RTL

;---------------------------------------------------------------------------------------------------

.not_rupees
#_09ADC4: CLC

#_09ADC5: PLB

#_09ADC6: RTL

;===================================================================================================

Ancilla_TerminateSparkleObjects:
#_09ADC7: PHX

#_09ADC8: LDX.b #$04

.next_slot
#_09ADCA: LDA.w $0C4A,X

#_09ADCD: CMP.b #$2A ; ANCILLA 2A
#_09ADCF: BEQ .delete_this

#_09ADD1: CMP.b #$2B ; ANCILLA 2B
#_09ADD3: BEQ .delete_this

#_09ADD5: CMP.b #$30 ; ANCILLA 30
#_09ADD7: BEQ .delete_this

#_09ADD9: CMP.b #$31 ; ANCILLA 31
#_09ADDB: BEQ .delete_this

#_09ADDD: CMP.b #$18 ; ANCILLA 18
#_09ADDF: BEQ .delete_this

#_09ADE1: CMP.b #$19 ; ANCILLA 19
#_09ADE3: BEQ .delete_this

#_09ADE5: CMP.b #$0C ; ANCILLA 0C
#_09ADE7: BNE .skip

.delete_this
#_09ADE9: STZ.w $0C4A,X

.skip
#_09ADEC: DEX
#_09ADED: BPL .next_slot

;---------------------------------------------------------------------------------------------------

#_09ADEF: PLX

#_09ADF0: RTL

;===================================================================================================

pool DashDust_Motive

.char
#_09ADF1: db $A9, $CF, $DF

pool off

;---------------------------------------------------------------------------------------------------

DashDust_Motive:
#_09ADF4: PHB
#_09ADF5: PHK
#_09ADF6: PLB

#_09ADF7: LDA.w $0C68,X
#_09ADFA: BNE .delay

#_09ADFC: LDA.b #$03
#_09ADFE: STA.w $0C68,X

#_09AE01: INC.w $0C5E,X

#_09AE04: LDA.w $0C5E,X
#_09AE07: CMP.b #$03
#_09AE09: BNE .delay

#_09AE0B: STZ.w $0C4A,X

#_09AE0E: BRA .exit

.delay
#_09AE10: LDA.b $2F
#_09AE12: CMP.b #$02
#_09AE14: BNE .not_behind

#_09AE16: LDA.b #$04
#_09AE18: JSL SpriteDraw_AllocateOAMFromRegionB

.not_behind
#_09AE1C: JSL Ancilla_PrepOAMCoord_long

#_09AE20: PHX

#_09AE21: LDA.w $0C5E,X
#_09AE24: TAX

#_09AE25: LDY.b #$00

#_09AE27: JSL Ancilla_SetOAM_XY_long

#_09AE2B: LDA.w .char,X
#_09AE2E: STA.b ($90),Y

#_09AE30: INY

#_09AE31: LDA.b #$04
#_09AE33: ORA.b $65
#_09AE35: STA.b ($90),Y

#_09AE37: LDA.b #$00
#_09AE39: STA.b ($92)

#_09AE3B: PLX

.exit
#_09AE3C: PLB

#_09AE3D: RTL

;===================================================================================================
; FREE ROM: 0x02
;===================================================================================================
NULL_09AE3E:
#_09AE3E: db $FF, $FF

;===================================================================================================

Sprite_SpawnSuperficialBombBlast:
#_09AE40: LDA.b #$4A ; SPRITE 4A
#_09AE42: JSL Sprite_SpawnDynamically
#_09AE46: BMI .exit

#_09AE48: LDA.b #$06
#_09AE4A: STA.w $0DD0,Y

#_09AE4D: LDA.b #$1F
#_09AE4F: STA.w $0E00,Y

#_09AE52: LDA.b #$03
#_09AE54: STA.w $0DB0,Y
#_09AE57: STA.w $0E40,Y

#_09AE5A: INC A
#_09AE5B: STA.w $0F50,Y

#_09AE5E: LDA.b #$15 ; SFX2.15
#_09AE60: JSL SpriteSFX_QueueSFX2WithPan

;===================================================================================================

#Sprite_SetSpawnedCoordinates:
#_09AE64: LDA.b $00
#_09AE66: STA.w $0D10,Y

#_09AE69: LDA.b $01
#_09AE6B: STA.w $0D30,Y

#_09AE6E: LDA.b $02
#_09AE70: STA.w $0D00,Y

#_09AE73: LDA.b $03
#_09AE75: STA.w $0D20,Y

#_09AE78: LDA.b $04
#_09AE7A: STA.w $0F70,Y

.exit
#_09AE7D: RTL

;===================================================================================================

Sprite_SpawnDummyDeathAnimation:
#_09AE7E: LDA.b #$0B ; SPRITE 0B
#_09AE80: JSL Sprite_SpawnDynamically
#_09AE84: BMI .exit

#_09AE86: JSL Sprite_SetSpawnedCoordinates

#_09AE8A: LDA.b #$06
#_09AE8C: STA.w $0DD0,Y

#_09AE8F: LDA.b #$0F
#_09AE91: STA.w $0DF0,Y

#_09AE94: LDA.b #$14 ; SFX2.14
#_09AE96: JSL SpriteSFX_QueueSFX2WithPan

#_09AE9A: LDA.b #$02
#_09AE9C: STA.w $0F20,Y

.exit
#_09AE9F: RTL

;===================================================================================================

pool MagicBat_SpawnLightning

.speed_x
#_09AEA0: db  -8,  -4,   4,   8

.initial_cycle
#_09AEA4: db $00, $11, $22, $33

pool off

;---------------------------------------------------------------------------------------------------

MagicBat_SpawnLightning:
#_09AEA8: JSL .spawn_bolt
#_09AEAC: JSL .spawn_bolt
#_09AEB0: JSL .spawn_bolt

;---------------------------------------------------------------------------------------------------

.spawn_bolt
#_09AEB4: LDA.b #$3A ; SPRITE 3A
#_09AEB6: JSL Sprite_SpawnDynamically
#_09AEBA: BMI .exit

#_09AEBC: LDA.b #$01 ; SFX3.01
#_09AEBE: JSL SpriteSFX_QueueSFX3WithPan

;---------------------------------------------------------------------------------------------------

#_09AEC2: JSL Sprite_SetSpawnedCoordinates

#_09AEC6: LDA.b $00
#_09AEC8: CLC
#_09AEC9: ADC.b #$04
#_09AECB: STA.w $0D10,Y

#_09AECE: LDA.b $01
#_09AED0: ADC.b #$00
#_09AED2: STA.w $0D30,Y

#_09AED5: LDA.b $02
#_09AED7: CLC
#_09AED8: ADC.b #$0C
#_09AEDA: PHP

#_09AEDB: SEC
#_09AEDC: SBC.w $0F70,X
#_09AEDF: STA.w $0D00,Y

#_09AEE2: LDA.b $03
#_09AEE4: SBC.b #$00

#_09AEE6: PLP
#_09AEE7: ADC.b #$00
#_09AEE9: STA.w $0D20,Y

;---------------------------------------------------------------------------------------------------

#_09AEEC: LDA.b #$00
#_09AEEE: STA.w $0F70,Y

#_09AEF1: LDA.b #$18
#_09AEF3: STA.w $0D40,Y
#_09AEF6: STA.w $0EB0,Y
#_09AEF9: STA.w $0BA0,Y

#_09AEFC: LDA.b #$80
#_09AEFE: STA.w $0E40,Y

#_09AF01: LDA.b #$03
#_09AF03: STA.w $0E60,Y

#_09AF06: AND.b #$03
#_09AF08: STA.w $0F50,Y

#_09AF0B: LDA.b #$20
#_09AF0D: STA.w $0DF0,Y

#_09AF10: LDA.b #$02
#_09AF12: STA.w $0DC0,Y

;---------------------------------------------------------------------------------------------------

#_09AF15: PHX

#_09AF16: LDA.w $0ED0,X
#_09AF19: TAX

#_09AF1A: LDA.l .speed_x,X
#_09AF1E: STA.w $0D50,Y

#_09AF21: LDA.l .initial_cycle,X
#_09AF25: STA.w $0E80,Y

#_09AF28: LDA.b #$02
#_09AF2A: STA.w $0F20,Y

#_09AF2D: PLX

#_09AF2E: INC.w $0ED0,X

;---------------------------------------------------------------------------------------------------

.exit
#_09AF31: RTL

;===================================================================================================

CheckIfScreenIsClear:
#_09AF32: PHX
#_09AF33: LDX.b #$0F

.next_sprite
#_09AF35: LDA.w $0DD0,X
#_09AF38: BEQ .ignorable_sprite

#_09AF3A: LDA.w $0F60,X
#_09AF3D: AND.b #$40
#_09AF3F: BNE .ignorable_sprite

#_09AF41: LDA.w $0D10,X
#_09AF44: CMP.b $E2

#_09AF46: LDA.w $0D30,X
#_09AF49: SBC.b $E3
#_09AF4B: BNE .ignorable_sprite

#_09AF4D: LDA.w $0D00,X
#_09AF50: CMP.b $E8

#_09AF52: LDA.w $0D20,X
#_09AF55: SBC.b $E9
#_09AF57: BNE .ignorable_sprite

.fail
#_09AF59: PLX

#_09AF5A: CLC

#_09AF5B: RTL

.ignorable_sprite
#_09AF5C: DEX
#_09AF5D: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_09AF5F: BRA CheckIfOverlordsClear

;===================================================================================================

CheckIfRoomIsClear:
#_09AF61: PHX
#_09AF62: LDX.b #$0F

.next_sprite
#_09AF64: LDA.w $0DD0,X
#_09AF67: BEQ .ignorable_sprite

#_09AF69: LDA.w $0F60,X
#_09AF6C: AND.b #$40
#_09AF6E: BNE .ignorable_sprite

;---------------------------------------------------------------------------------------------------

#FailBecauseOverlordsNotClear:
#_09AF70: PLX
#_09AF71: CLC

#_09AF72: RTL

.ignorable_sprite
#_09AF73: DEX
#_09AF74: BPL .next_sprite

;===================================================================================================

CheckIfOverlordsClear:
#_09AF76: LDX.b #$07

.next_overlord
#_09AF78: LDA.w $0B00,X
#_09AF7B: CMP.b #$14 ; OVERLORD 14
#_09AF7D: BEQ FailBecauseOverlordsNotClear

#_09AF7F: CMP.b #$18 ; OVERLORD 18
#_09AF81: BEQ FailBecauseOverlordsNotClear

#_09AF83: DEX
#_09AF84: BPL .next_overlord

;---------------------------------------------------------------------------------------------------

#_09AF86: PLX

#_09AF87: SEC

#_09AF88: RTL

;===================================================================================================

InitializeMirrorPortal:
#_09AF89: PHB
#_09AF8A: PHK
#_09AF8B: PLB

#_09AF8C: LDX.b #$0F

.next_sprite
#_09AF8E: LDA.w $0DD0,X
#_09AF91: BEQ .skip_sprite

#_09AF93: LDA.w $0E20,X
#_09AF96: CMP.b #$6C ; SPRITE 6C
#_09AF98: BNE .skip_sprite

#_09AF9A: STZ.w $0DD0,X

.skip_sprite
#_09AF9D: DEX
#_09AF9E: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_09AFA0: LDA.b #$6C ; SPRITE 6C
#_09AFA2: JSL Sprite_SpawnDynamically
#_09AFA6: BPL .free_slot

#_09AFA8: LDY.b #$00

.free_slot
#_09AFAA: LDA.l $001ABF
#_09AFAE: STA.w $0D10,Y

#_09AFB1: LDA.l $001ACF
#_09AFB5: STA.w $0D30,Y

#_09AFB8: LDA.l $001ADF
#_09AFBC: CLC
#_09AFBD: ADC.b #$08
#_09AFBF: STA.w $0D00,Y

#_09AFC2: LDA.l $001AEF
#_09AFC6: ADC.b #$00
#_09AFC8: STA.w $0D20,Y

#_09AFCB: LDA.b #$00
#_09AFCD: STA.w $0F20,Y

#_09AFD0: INC A
#_09AFD1: STA.w $0BA0,Y

#_09AFD4: PLB

#_09AFD5: RTL

;===================================================================================================

Sprite_InitializeSlots:
#_09AFD6: PHB
#_09AFD7: PHK
#_09AFD8: PLB

#_09AFD9: LDX.b #$0F

.next_sprite
#_09AFDB: LDA.w $0DD0,X
#_09AFDE: BEQ .skip_sprite

#_09AFE0: LDY.w $0E20,X
#_09AFE3: CMP.b #$0A
#_09AFE5: BNE .not_carried

#_09AFE7: CPY.b #$EC ; SPRITE EC
#_09AFE9: BEQ .skip_sprite

#_09AFEB: CPY.b #$D2 ; SPRITE D2
#_09AFED: BEQ .skip_sprite

#_09AFEF: STZ.w $0309
#_09AFF2: STZ.w $0308

#_09AFF5: BRA .kill_sprite

.not_carried
#_09AFF7: CPY.b #$6C ; SPRITE 6C
#_09AFF9: BEQ .skip_sprite

#_09AFFB: LDA.w $0C9A,X
#_09AFFE: CMP.w $040A
#_09B001: BEQ .skip_sprite

.kill_sprite
#_09B003: STZ.w $0DD0,X

.skip_sprite
#_09B006: DEX
#_09B007: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_09B009: LDX.b #$07

.next_overlord
#_09B00B: LDA.w $0B00,X
#_09B00E: BEQ .skip_overlord

#_09B010: LDA.w $0CCA,X
#_09B013: CMP.w $040A
#_09B016: BEQ .skip_overlord

#_09B018: STZ.w $0B00,X

.skip_overlord
#_09B01B: DEX
#_09B01C: BPL .next_overlord

;---------------------------------------------------------------------------------------------------

#_09B01E: PLB

#_09B01F: RTL

;===================================================================================================

Fireball_SpawnTrailGarnish:
#_09B020: TXA
#_09B021: EOR.b $1A
#_09B023: AND.b #$03
#_09B025: BNE .exit

#_09B027: PHX

#_09B028: LDX.b #$1D

.next_check
#_09B02A: LDA.l $7FF800,X
#_09B02E: BEQ .free_slot

#_09B030: DEX
#_09B031: BPL .next_check

#_09B033: PLX

.exit
#_09B034: RTL

;---------------------------------------------------------------------------------------------------

.free_slot
#_09B035: LDA.b #$08 ; GARNISH 08
#_09B037: STA.l $7FF800,X
#_09B03B: STA.w $0FB4

#_09B03E: LDA.b #$0B
#_09B040: STA.l $7FF90E,X

#_09B044: LDA.w $0FD8
#_09B047: STA.l $7FF83C,X

#_09B04B: LDA.w $0FD9
#_09B04E: STA.l $7FF878,X

#_09B052: LDA.w $0FDA
#_09B055: CLC
#_09B056: ADC.b #$10
#_09B058: STA.l $7FF81E,X

#_09B05C: LDA.w $0FDB
#_09B05F: ADC.b #$00
#_09B061: STA.l $7FF85A,X

#_09B065: LDA.w $0FA0
#_09B068: STA.l $7FF92C,X

#_09B06C: PLX

#_09B06D: RTL

;===================================================================================================

Garnish_ExecuteUpperSlots_long:
#_09B06E: JSL HandleScreenFlash

#_09B072: LDA.w $0FB4
#_09B075: BEQ .exit

#_09B077: PHB
#_09B078: PHK
#_09B079: PLB

#_09B07A: JSR Garnish_ExecuteUpperSlots

#_09B07D: PLB

.exit
#_09B07E: RTL

;===================================================================================================

Garnish_ExecuteLowerSlots_long:
#_09B07F: LDA.w $0FB4
#_09B082: BEQ .exit

#_09B084: PHB
#_09B085: PHK
#_09B086: PLB

#_09B087: JSR Garnish_ExecuteLowerSlots

#_09B08A: PLB

.exit
#_09B08B: RTL

;===================================================================================================

Garnish_ExecuteUpperSlots:
#_09B08C: LDX.b #$1D

.next
#_09B08E: JSR Garnish_ExecuteSingle

#_09B091: DEX
#_09B092: CPX.b #$0E
#_09B094: BNE .next

#_09B096: RTS

;===================================================================================================

Garnish_ExecuteLowerSlots:
#_09B097: LDX.b #$0E

.next
#_09B099: JSR Garnish_ExecuteSingle

#_09B09C: DEX
#_09B09D: BPL .next

#_09B09F: RTS

;===================================================================================================

pool Garnish_ExecuteSingle

.object_allocation
#_09B0A0: db $04 ; Fire snake tail
#_09B0A1: db $04 ; Mothula beam trail
#_09B0A2: db $04 ; Falling tile
#_09B0A3: db $04 ; Laser trail
#_09B0A4: db $04 ; Sparkle
#_09B0A5: db $04 ; Zoro trail
#_09B0A6: db $04 ; Babasu flash
#_09B0A7: db $04 ; Kholdstare trail
#_09B0A8: db $04 ; Lightning trail
#_09B0A9: db $04 ; Cannon smoke
#_09B0AA: db $04 ; Water trail
#_09B0AB: db $04 ; Trinexx ice breath
#_09B0AC: db $04 ; Null pointer
#_09B0AD: db $04 ; Trinexx fire breath
#_09B0AE: db $04 ; Blind laser trail
#_09B0AF: db $04 ; Ganon bat flame
#_09B0B0: db $08 ; Withering bat flame
#_09B0B1: db $04 ; Sparkle
#_09B0B2: db $04 ; Pyramid debris
#_09B0B3: db $04 ; Running kid dash dust
#_09B0B4: db $08 ; Arrghus splash
#_09B0B5: db $10 ; Thrown item debris

pool off

;---------------------------------------------------------------------------------------------------

Garnish_ExecuteSingle:
#_09B0B6: STX.w $0FA0

#_09B0B9: LDA.l $7FF800,X
#_09B0BD: BEQ .exit

#_09B0BF: CMP.b #$05
#_09B0C1: BEQ .ignore_submodule

#_09B0C3: LDA.b $11
#_09B0C5: ORA.w $0FC1
#_09B0C8: BNE .dont_terminate

.ignore_submodule
#_09B0CA: LDA.l $7FF90E,X
#_09B0CE: BEQ .dont_terminate

#_09B0D0: DEC A
#_09B0D1: STA.l $7FF90E,X
#_09B0D5: BNE .dont_terminate

#_09B0D7: STA.l $7FF800,X

#_09B0DB: BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_terminate
#_09B0DD: LDY.w $0FB3
#_09B0E0: BEQ .ignore_layer

#_09B0E2: LDA.l $7FF968,X
#_09B0E6: BEQ .lower_layer

;---------------------------------------------------------------------------------------------------

#_09B0E8: LDA.l $7FF800,X
#_09B0EC: TAY

#_09B0ED: LDA.w .object_allocation-1,Y
#_09B0F0: JSL SpriteDraw_AllocateOAMFromRegionF

#_09B0F4: BRA .run_ai

;---------------------------------------------------------------------------------------------------

.lower_layer
#_09B0F6: LDA.l $7FF800,X
#_09B0FA: TAY

#_09B0FB: LDA.w .object_allocation-1,Y
#_09B0FE: JSL SpriteDraw_AllocateOAMFromRegionD

#_09B102: BRA .run_ai

;---------------------------------------------------------------------------------------------------

.ignore_layer
#_09B104: LDA.l $7FF800,X
#_09B108: TAY

#_09B109: LDA.w .object_allocation-1,Y
#_09B10C: JSL SpriteDraw_AllocateOAMFromRegionA

;---------------------------------------------------------------------------------------------------

.run_ai
#_09B110: LDA.l $7FF800,X
#_09B114: DEC A

#_09B115: REP #$30

#_09B117: AND.w #$00FF
#_09B11A: ASL A
#_09B11B: TAY

#_09B11C: LDA.w .vectors,Y
#_09B11F: DEC A
#_09B120: PHA

#_09B121: SEP #$30

.exit
#_09B123: RTS

;---------------------------------------------------------------------------------------------------

.vectors
#_09B124: dw Garnish01_FireSnakeTail
#_09B126: dw Garnish02_MothulaBeamTrail
#_09B128: dw Garnish03_FallingTile
#_09B12A: dw Garnish04_LaserTrail
#_09B12C: dw Garnish05_SimpleSparkle
#_09B12E: dw Garnish06_ZoroTrail
#_09B130: dw Garnish07_BabasuFlash
#_09B132: dw Garnish08_KholdstareTrail
#_09B134: dw Garnish09_LightningTrail
#_09B136: dw Garnish0A_CannonSmoke
#_09B138: dw Garnish0B_WaterTrail
#_09B13A: dw Garnish0C_TrinexxIceBreath
#_09B13C: dw $0000
#_09B13E: dw Garnish0E_TrinexxFireBreath
#_09B140: dw Garnish0F_BlindLaserTrail
#_09B142: dw Garnish10_GanonBatFlame
#_09B144: dw Garnish11_WitheringGanonBatFlame
#_09B146: dw Garnish12_Sparkle
#_09B148: dw Garnish13_PyramidDebris
#_09B14A: dw Garnish14_KakKidDashDust
#_09B14C: dw Garnish15_ArrghusSplash
#_09B14E: dw Garnish16_ThrownItemDebris

;===================================================================================================

pool Garnish15_ArrghusSplash

.offset_y
#_09B150: db -12,  20
#_09B152: db -10,  10
#_09B154: db  -8,   8
#_09B156: db  -4,   4

.offset_x
#_09B158: db  -4,  -4
#_09B15A: db  -2,  -2
#_09B15C: db   0,   0
#_09B15E: db   0,   0

.char
#_09B160: db $AE, $AE
#_09B162: db $AE, $AE
#_09B164: db $AE, $AE
#_09B166: db $AC, $AC

.prop
#_09B168: db $34, $74
#_09B16A: db $34, $74
#_09B16C: db $34, $74
#_09B16E: db $34, $74

.size
#_09B170: db $00, $00
#_09B172: db $02, $02
#_09B174: db $02, $02
#_09B176: db $02, $02

pool off

;---------------------------------------------------------------------------------------------------

Garnish15_ArrghusSplash:
#_09B178: JSR Garnish_PrepOAMCoord

#_09B17B: LDA.l $7FF90E,X
#_09B17F: LSR A
#_09B180: AND.b #$06
#_09B182: STA.b $06

#_09B184: LDA.b #$01
#_09B186: STA.b $07

#_09B188: PHX

;---------------------------------------------------------------------------------------------------

.next_object
#_09B189: LDA.b $06
#_09B18B: ORA.b $07
#_09B18D: TAX

#_09B18E: LDA.b $00
#_09B190: CLC
#_09B191: ADC.w .offset_y,X
#_09B194: STA.b ($90),Y

#_09B196: LDA.b $02
#_09B198: CLC
#_09B199: ADC.w .offset_x,X
#_09B19C: INY
#_09B19D: STA.b ($90),Y

#_09B19F: LDA.w .char,X
#_09B1A2: INY
#_09B1A3: STA.b ($90),Y

#_09B1A5: LDA.w .prop,X
#_09B1A8: INY
#_09B1A9: STA.b ($90),Y

#_09B1AB: PHY

#_09B1AC: TYA
#_09B1AD: LSR A
#_09B1AE: LSR A
#_09B1AF: TAY

#_09B1B0: LDA.w .size,X
#_09B1B3: STA.b ($92),Y

#_09B1B5: PLY
#_09B1B6: INY

#_09B1B7: DEC.b $07
#_09B1B9: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_09B1BB: PLX

#_09B1BC: RTS

;===================================================================================================

GarnishSpawn_PyramidDebris:
#_09B1BD: LDA.b #$03 ; SFX3.03
#_09B1BF: STA.w $012F

#_09B1C2: LDA.b #$1F ; SFX2.1F
#_09B1C4: STA.w $012E

#_09B1C7: LDA.b #$05 ; SFX1.05
#_09B1C9: STA.w $012D

#_09B1CC: PHX
#_09B1CD: TXY

#_09B1CE: LDX.b #$1D

.next_slot
#_09B1D0: LDA.l $7FF800,X
#_09B1D4: BEQ .open_slot

#_09B1D6: DEX
#_09B1D7: BPL .next_slot

#_09B1D9: INX

;---------------------------------------------------------------------------------------------------

.open_slot
#_09B1DA: LDA.b #$13 ; GARNISH 13
#_09B1DC: STA.l $7FF800,X
#_09B1E0: STA.w $0FB4

#_09B1E3: LDA.b #$E8
#_09B1E5: CLC
#_09B1E6: ADC.b $00
#_09B1E8: STA.l $7FF83C,X

#_09B1EC: LDA.b #$60
#_09B1EE: CLC
#_09B1EF: ADC.b $01
#_09B1F1: STA.l $7FF81E,X

#_09B1F5: LDA.b $02
#_09B1F7: STA.l $7FF8B4,X

#_09B1FB: LDA.b $03
#_09B1FD: STA.l $7FF896,X

#_09B201: JSL GetRandomNumber
#_09B205: AND.b #$1F
#_09B207: ADC.b #$30
#_09B209: STA.l $7FF90E,X

#_09B20D: PLX

#_09B20E: RTL

;===================================================================================================

PyramidDebris_DeleteSelf:
#_09B20F: LDA.b #$00
#_09B211: STA.l $7FF800,X

#_09B215: RTS

;===================================================================================================

Garnish13_PyramidDebris:
#_09B216: JSR Garnish_Move_XY

#_09B219: LDA.l $7FF896,X
#_09B21D: CLC
#_09B21E: ADC.b #$03
#_09B220: STA.l $7FF896,X

#_09B224: LDY.b #$00

#_09B226: LDA.l $7FF83C,X
#_09B22A: SEC
#_09B22B: SBC.b $E2
#_09B22D: CMP.b #$F8
#_09B22F: BCS PyramidDebris_DeleteSelf

;---------------------------------------------------------------------------------------------------

#_09B231: STA.b ($90),Y

#_09B233: LDA.l $7FF81E,X
#_09B237: SEC
#_09B238: SBC.b $E8
#_09B23A: CMP.b #$F0
#_09B23C: BCS PyramidDebris_DeleteSelf

#_09B23E: INY

#_09B23F: STA.b ($90),Y
#_09B241: LDA.b #$5C

#_09B243: INY

#_09B244: STA.b ($90),Y

#_09B246: LDA.b $1A
#_09B248: ASL A
#_09B249: ASL A
#_09B24A: ASL A
#_09B24B: AND.b #$C0
#_09B24D: ORA.b #$34

#_09B24F: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

Garnish_Move_XY:
#_09B252: PHX

#_09B253: TXA
#_09B254: CLC
#_09B255: ADC.b #$1E
#_09B257: TAX

#_09B258: JSR Garnish_Move_Y

#_09B25B: PLX

;===================================================================================================

Garnish_Move_Y:
#_09B25C: LDA.l $7FF896,X

#_09B260: ASL A
#_09B261: ASL A
#_09B262: ASL A
#_09B263: ASL A

#_09B264: CLC
#_09B265: ADC.l $7FF8D2,X
#_09B269: STA.l $7FF8D2,X

#_09B26D: LDA.l $7FF896,X
#_09B271: PHP

#_09B272: LSR A
#_09B273: LSR A
#_09B274: LSR A
#_09B275: LSR A

#_09B276: PLP
#_09B277: BPL .positive

#_09B279: ORA.b #$F0

.positive
#_09B27B: ADC.l $7FF81E,X
#_09B27F: STA.l $7FF81E,X

#_09B283: RTS

;===================================================================================================

pool Garnish10_GanonBatFlame

.char
#_09B284: db $AC, $AC, $66, $66, $8E, $A0, $A2

.prop
#_09B28B: db $01, $41, $01, $41, $00, $00, $00

.draw_step
#_09B292: db $07, $06, $05, $04
#_09B296: db $05, $04, $05, $04
#_09B29A: db $05, $04, $05, $04
#_09B29E: db $05, $04, $05, $04
#_09B2A2: db $05, $04, $05, $04
#_09B2A6: db $05, $04, $05, $04
#_09B2AA: db $05, $04, $05, $04
#_09B2AE: db $05, $04, $05, $04

pool off

;===================================================================================================

Garnish11_WitheringGanonBatFlame:
#_09B2B2: LDA.b $11
#_09B2B4: ORA.w $0FC1
#_09B2B7: BNE .just_draw

#_09B2B9: LDA.l $7FF81E,X
#_09B2BD: SEC
#_09B2BE: SBC.b #$01
#_09B2C0: STA.l $7FF81E,X

#_09B2C4: LDA.l $7FF85A,X
#_09B2C8: SBC.b #$00
#_09B2CA: STA.l $7FF85A,X

.just_draw
#_09B2CE: JSR Garnish_PrepOAMCoord

#_09B2D1: REP #$10

#_09B2D3: LDY.b $90

#_09B2D5: LDA.b $00
#_09B2D7: STA.w $0000,Y

#_09B2DA: CLC
#_09B2DB: ADC.b #$08
#_09B2DD: STA.w $0004,Y

#_09B2E0: LDA.b $02
#_09B2E2: STA.w $0001,Y
#_09B2E5: STA.w $0005,Y

#_09B2E8: LDA.b #$A4
#_09B2EA: STA.w $0002,Y

#_09B2ED: INC A
#_09B2EE: STA.w $0006,Y

#_09B2F1: LDA.b #$22
#_09B2F3: STA.w $0003,Y
#_09B2F6: STA.w $0007,Y

#_09B2F9: LDY.b $92

#_09B2FB: LDA.b #$00
#_09B2FD: STA.w $0000,Y
#_09B300: STA.w $0001,Y

#_09B303: SEP #$10

#_09B305: RTS

;===================================================================================================

Garnish10_GanonBatFlame:
#_09B306: LDA.l $7FF90E,X
#_09B30A: CMP.b #$08
#_09B30C: BNE .dont_transmute

#_09B30E: LDA.b #$11 ; GARNISH 11
#_09B310: STA.l $7FF800,X

.dont_transmute
#_09B314: JSR Garnish_PrepOAMCoord

#_09B317: LDA.b $00
#_09B319: STA.b ($90),Y

#_09B31B: LDA.b $02
#_09B31D: INY
#_09B31E: STA.b ($90),Y

#_09B320: LDA.l $7FF90E,X
#_09B324: LSR A
#_09B325: LSR A
#_09B326: LSR A

#_09B327: PHX

#_09B328: TAX

#_09B329: LDA.w .draw_step,X
#_09B32C: TAX

#_09B32D: LDA.w .char,X
#_09B330: INY
#_09B331: STA.b ($90),Y

#_09B333: LDA.b #$22
#_09B335: ORA.w .prop,X

#_09B338: PLX

#_09B339: JSR Garnish_FinalizeBigOAMObject

#_09B33C: JMP.w Garnish_CheckDamageToLink

;===================================================================================================

pool Garnish0C_TrinexxIceBreath

.char
#_09B33F: db $E8, $E8, $E6, $E6
#_09B343: db $E4, $E4, $E4, $E4
#_09B347: db $E4, $E4, $E4, $E4

.prop
#_09B34B: db $00, $40, $C0, $80

pool off

;---------------------------------------------------------------------------------------------------

Garnish0C_TrinexxIceBreath:
#_09B34F: LDA.l $7FF90E,X
#_09B353: CMP.b #$50
#_09B355: BNE .dont_change_tiles

#_09B357: LDA.b $11
#_09B359: ORA.w $0FC1
#_09B35C: BNE .dont_change_tiles

;---------------------------------------------------------------------------------------------------

#_09B35E: PHA

#_09B35F: LDA.l $7FF83C,X
#_09B363: STA.b $00

#_09B365: LDA.l $7FF878,X
#_09B369: STA.b $01

#_09B36B: LDA.l $7FF81E,X
#_09B36F: SEC
#_09B370: SBC.b #$10
#_09B372: STA.b $02

#_09B374: LDA.l $7FF85A,X
#_09B378: SBC.b #$00
#_09B37A: STA.b $03

#_09B37C: LDY.b #$12
#_09B37E: JSL Underworld_UpdateTilemapWithCommonTile

#_09B382: PLA

;---------------------------------------------------------------------------------------------------

.dont_change_tiles
#_09B383: LDA.l $7FF90E,X
#_09B387: LSR A
#_09B388: LSR A
#_09B389: AND.b #$03
#_09B38B: TAY

#_09B38C: LDA.w .prop,Y
#_09B38F: STA.b $04

#_09B391: JSR Garnish_PrepOAMCoord

#_09B394: LDA.b $00
#_09B396: STA.b ($90),Y

#_09B398: LDA.b $02
#_09B39A: INY
#_09B39B: STA.b ($90),Y

#_09B39D: LDA.l $7FF90E,X

#_09B3A1: LSR A
#_09B3A2: LSR A
#_09B3A3: LSR A
#_09B3A4: LSR A

#_09B3A5: NOP

#_09B3A6: PHX

#_09B3A7: TAX

#_09B3A8: LDA.w .char,X
#_09B3AB: INY
#_09B3AC: STA.b ($90),Y

#_09B3AE: LDA.b #$35
#_09B3B0: ORA.b $04

#_09B3B2: PLX

#_09B3B3: JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

UNREACHABLE_09B3B6:
#_09B3B6: JMP.w Garnish_CheckDamageToLink

;===================================================================================================

pool Garnish14_KakKidDashDust

.char
#_09B3B9: db $DF, $CF, $A9

pool off

;---------------------------------------------------------------------------------------------------

Garnish14_KakKidDashDust:
#_09B3BC: LDA.l $7FF90E,X

#_09B3C0: BRA .continue

;===================================================================================================

#Garnish0B_WaterTrail:
#_09B3C2: LDA.l $7FF90E,X
#_09B3C6: LSR A

;===================================================================================================

.continue
#_09B3C7: LSR A
#_09B3C8: LSR A
#_09B3C9: STA.w $0FB5

#_09B3CC: JSR Garnish_PrepOAMCoord

#_09B3CF: LDA.b $00
#_09B3D1: STA.b ($90),Y

#_09B3D3: LDA.b $02
#_09B3D5: INY
#_09B3D6: STA.b ($90),Y

#_09B3D8: PHX

#_09B3D9: LDX.w $0FB5

#_09B3DC: LDA.w .char,X
#_09B3DF: INY
#_09B3E0: STA.b ($90),Y

#_09B3E2: LDA.b #$24

#_09B3E4: PLX

#_09B3E5: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0A_CannonSmoke

.char
#_09B3E8: db $8A, $86

.priority
#_09B3EA: db $20, $10, $30, $30

pool off

;---------------------------------------------------------------------------------------------------

Garnish0A_CannonSmoke:
#_09B3EE: JSR Garnish_PrepOAMCoord

#_09B3F1: LDA.b $00
#_09B3F3: STA.b ($90),Y

#_09B3F5: LDA.b $02
#_09B3F7: INY
#_09B3F8: STA.b ($90),Y

#_09B3FA: LDA.l $7FF90E,X
#_09B3FE: LSR A
#_09B3FF: LSR A
#_09B400: LSR A

#_09B401: PHX

#_09B402: TAX

#_09B403: LDA.w .char,X
#_09B406: INY
#_09B407: STA.b ($90),Y

#_09B409: PLX
#_09B40A: PHX

#_09B40B: LDA.l $7FF92C,X
#_09B40F: TAX

#_09B410: LDA.w .priority,X
#_09B413: ORA.b #$04

#_09B415: PLX

#_09B416: JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

pool Garnish09_LightningTrail

.char
#_09B419: db $CC, $EC, $CE, $EE
#_09B41D: db $CC, $EC, $CE, $EE

.prop
#_09B421: db $31, $31, $31, $31
#_09B425: db $71, $71, $71, $71

pool off

;---------------------------------------------------------------------------------------------------

Garnish09_LightningTrail:
#_09B429: JSR Garnish_PrepOAMCoord

#_09B42C: LDA.b $00
#_09B42E: STA.b ($90),Y

#_09B430: LDA.b $02
#_09B432: INY
#_09B433: STA.b ($90),Y

#_09B435: LDA.l $7FF92C,X

#_09B439: PHX
#_09B43A: TAX

#_09B43B: LDA.w .char,X

#_09B43E: PHX

#_09B43F: LDX.w $048E
#_09B442: CPX.b #$20 ; ROOM 0020
#_09B444: BNE .not_aga1

#_09B446: SEC
#_09B447: SBC.b #$80

.not_aga1
#_09B449: PLX

#_09B44A: INY
#_09B44B: STA.b ($90),Y

#_09B44D: LDA.b $1A
#_09B44F: ASL A
#_09B450: AND.b #$0E
#_09B452: ORA.w .prop,X

#_09B455: PLX

#_09B456: JSR Garnish_FinalizeBigOAMObject

;===================================================================================================

Garnish_CheckDamageToLink:
#_09B459: TXA
#_09B45A: EOR.b $1A
#_09B45C: AND.b #$07
#_09B45E: ORA.w $031F
#_09B461: ORA.w $037B
#_09B464: BNE .exit

#_09B466: LDA.b $22
#_09B468: SBC.b $E2
#_09B46A: SBC.b $00
#_09B46C: ADC.b #$0C

#_09B46E: CMP.b #$18
#_09B470: BCS .exit

#_09B472: LDA.b $20
#_09B474: SBC.b $E8
#_09B476: SBC.b $02
#_09B478: ADC.b #$16

#_09B47A: CMP.b #$1C
#_09B47C: BCS .exit

#_09B47E: LDA.b #$01
#_09B480: STA.b $4D

#_09B482: LDA.b #$10
#_09B484: STA.b $46
#_09B486: STA.w $0373

#_09B489: LDA.b $28
#_09B48B: EOR.b #$FF
#_09B48D: STA.b $28

#_09B48F: LDA.b $27
#_09B491: EOR.b #$FF
#_09B493: STA.b $27

.exit
#_09B495: RTS

;===================================================================================================

pool Garnish07_BabasuFlash

.char
#_09B496: db $A8, $8A, $86, $86

.prop
#_09B49A: db $2D, $2C, $2C, $2C

pool off

;---------------------------------------------------------------------------------------------------

Garnish07_BabasuFlash:
#_09B49E: JSR Garnish_PrepOAMCoord

#_09B4A1: LDA.b $00
#_09B4A3: STA.b ($90),Y

#_09B4A5: LDA.b $02
#_09B4A7: INY
#_09B4A8: STA.b ($90),Y

#_09B4AA: LDA.l $7FF90E,X
#_09B4AE: LSR A
#_09B4AF: LSR A
#_09B4B0: LSR A

#_09B4B1: PHX

#_09B4B2: TAX

#_09B4B3: LDA.w .char,X
#_09B4B6: INY
#_09B4B7: STA.b ($90),Y

#_09B4B9: LDA.w .prop,X

#_09B4BC: PLX

#_09B4BD: JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

pool Garnish08_KholdstareTrail

.offset
#_09B4C0: db  -1,  -1,   0

.char
#_09B4C3: db $9C, $9D, $8D

pool off

;---------------------------------------------------------------------------------------------------

Garnish08_KholdstareTrail:
#_09B4C6: JSR Garnish_PrepOAMCoord

#_09B4C9: PHX

#_09B4CA: LDA.l $7FF90E,X
#_09B4CE: LSR A
#_09B4CF: LSR A
#_09B4D0: TAX

#_09B4D1: LDA.b $00
#_09B4D3: CLC
#_09B4D4: ADC.w .offset,X
#_09B4D7: STA.b ($90),Y

#_09B4D9: LDA.b $02
#_09B4DB: CLC
#_09B4DC: ADC.w .offset,X

#_09B4DF: INY

#_09B4E0: STA.b ($90),Y

#_09B4E2: LDA.w .char,X
#_09B4E5: INY
#_09B4E6: STA.b ($90),Y

#_09B4E8: PLX

#_09B4E9: PHY

#_09B4EA: LDA.l $7FF92C,X
#_09B4EE: TAY

#_09B4EF: LDA.w $0F50,Y
#_09B4F2: ORA.w $0B89,Y
#_09B4F5: AND.b #$FE

#_09B4F7: PLY

#_09B4F8: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

Garnish06_ZoroTrail:
#_09B4FB: JSR Garnish_PrepOAMCoord

#_09B4FE: LDA.b $00
#_09B500: STA.b ($90),Y

#_09B502: LDA.b $02
#_09B504: INY
#_09B505: STA.b ($90),Y

#_09B507: LDA.b #$75
#_09B509: INY
#_09B50A: STA.b ($90),Y

#_09B50C: PHY

#_09B50D: LDA.l $7FF92C,X
#_09B511: TAY

#_09B512: LDA.w $0F50,Y
#_09B515: ORA.w $0B89,Y

#_09B518: PLY

#_09B519: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool GarnishSparkle

.char
#_09B51C: db $83, $C7, $80, $B7

pool off

;===================================================================================================

Garnish12_Sparkle:
#_09B520: LDA.l $7FF90E,X
#_09B524: BRA GarnishSparkle

;===================================================================================================

Garnish05_SimpleSparkle:
#_09B526: LDA.l $7FF90E,X
#_09B52A: LSR A

;===================================================================================================

GarnishSparkle:
#_09B52B: LSR A
#_09B52C: LSR A
#_09B52D: STA.b $0F

#_09B52F: JSR Garnish_PrepOAMCoord

#_09B532: LDA.b $00
#_09B534: STA.b ($90),Y

#_09B536: LDA.b $02
#_09B538: INY
#_09B539: STA.b ($90),Y

#_09B53B: PHX

#_09B53C: LDX.b $0F
#_09B53E: LDA.w .char,X

#_09B541: PLX

#_09B542: INY
#_09B543: STA.b ($90),Y

#_09B545: PHY

#_09B546: LDA.l $7FF92C,X
#_09B54A: TAY

#_09B54B: LDA.w $0F50,Y
#_09B54E: ORA.w $0B89,Y
#_09B551: AND.b #$F0
#_09B553: ORA.b #$04

#_09B555: PLY

#_09B556: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0E_TrinexxFireBreath

.char
#_09B559: db $83, $C7, $80, $9D

pool off

;---------------------------------------------------------------------------------------------------

Garnish0E_TrinexxFireBreath:
#_09B55D: JSR Garnish_PrepOAMCoord

#_09B560: LDA.b $00
#_09B562: STA.b ($90),Y

#_09B564: LDA.b $02
#_09B566: INY
#_09B567: STA.b ($90),Y

#_09B569: LDA.l $7FF90E,X
#_09B56D: LSR A
#_09B56E: LSR A
#_09B56F: LSR A

#_09B570: PHX

#_09B571: TAX

#_09B572: LDA.w .char,X

#_09B575: PLX

#_09B576: INY
#_09B577: STA.b ($90),Y

#_09B579: PHY

#_09B57A: LDA.l $7FF92C,X
#_09B57E: TAY

#_09B57F: LDA.w $0F50,Y
#_09B582: ORA.w $0B89,Y
#_09B585: AND.b #$F0
#_09B587: ORA.b #$0E

#_09B589: PLY

#_09B58A: JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0F_BlindLaserTrail

.char
#_09B58D: db $61, $71, $70, $60

pool off

;---------------------------------------------------------------------------------------------------

Garnish0F_BlindLaserTrail:
#_09B591: JSR Garnish_PrepOAMCoord

#_09B594: LDA.b $00
#_09B596: STA.b ($90),Y

#_09B598: LDA.b $02
#_09B59A: INY
#_09B59B: STA.b ($90),Y

#_09B59D: PHY

#_09B59E: LDA.l $7FF9FE,X
#_09B5A2: TAY

#_09B5A3: LDA.w .char-7,Y

#_09B5A6: PLY
#_09B5A7: INY

#_09B5A8: STA.b ($90),Y

#_09B5AA: PHY

#_09B5AB: LDA.l $7FF92C,X
#_09B5AF: TAY

#_09B5B0: LDA.w $0F50,Y
#_09B5B3: ORA.w $0B89,Y

#_09B5B6: PLY

#_09B5B7: BRA Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish04_LaserTrail

.char
#_09B5B9: db $D2, $F3

pool off

;---------------------------------------------------------------------------------------------------

Garnish04_LaserTrail:
#_09B5BB: JSR Garnish_PrepOAMCoord

#_09B5BE: LDA.b $00
#_09B5C0: STA.b ($90),Y

#_09B5C2: LDA.b $02
#_09B5C4: INY
#_09B5C5: STA.b ($90),Y

#_09B5C7: PHY

#_09B5C8: LDA.l $7FF9FE,X
#_09B5CC: TAY

#_09B5CD: LDA.w .char,Y

#_09B5D0: PLY
#_09B5D1: INY

#_09B5D2: STA.b ($90),Y

#_09B5D4: LDA.b #$25

;===================================================================================================

Garnish_FinalizeSmallOAMObject:
#_09B5D6: INY

#_09B5D7: STA.b ($90),Y

#_09B5D9: LDA.b #$00
#_09B5DB: STA.b ($92)

#_09B5DD: RTS

;===================================================================================================

Garnish_PrepOAMCoord:
#_09B5DE: LDA.l $7FF83C,X
#_09B5E2: SEC
#_09B5E3: SBC.b $E2
#_09B5E5: STA.b $00

#_09B5E7: LDA.l $7FF878,X
#_09B5EB: SBC.b $E3
#_09B5ED: STA.b $01

#_09B5EF: BNE .off_screen

#_09B5F1: LDA.l $7FF81E,X
#_09B5F5: SEC
#_09B5F6: SBC.b $E8
#_09B5F8: PHA

#_09B5F9: LDA.l $7FF85A,X
#_09B5FD: SBC.b $E9
#_09B5FF: BEQ .on_screen

#_09B601: PLA

;---------------------------------------------------------------------------------------------------

.off_screen
#_09B602: LDA.b #$00
#_09B604: STA.l $7FF800,X

#_09B608: PLA
#_09B609: PLA

#_09B60A: RTS

;---------------------------------------------------------------------------------------------------

.on_screen
#_09B60B: PLA
#_09B60C: SBC.b #$10
#_09B60E: STA.b $02

#_09B610: LDY.b #$00

#_09B612: RTS

;===================================================================================================

pool Garnish03_FallingTile

.char
#_09B613: db $80, $CC, $CC, $EA, $CA

.prop
#_09B618: db $30, $31, $31, $31, $31

.size
#_09B61D: db $00, $02, $02, $02, $02

.offset
#_09B622: db   4,   0,   0,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Garnish03_FallingTile:
#_09B627: LDA.l $7FF90E,X
#_09B62B: CMP.b #$1E
#_09B62D: BNE .dont_place_pit

#_09B62F: LDA.b $11
#_09B631: ORA.w $0FC1
#_09B634: BNE .dont_place_pit

;---------------------------------------------------------------------------------------------------

#_09B636: PHA

#_09B637: LDA.l $7FF83C,X
#_09B63B: STA.b $00

#_09B63D: LDA.l $7FF878,X
#_09B641: STA.b $01

#_09B643: LDA.l $7FF81E,X
#_09B647: SEC
#_09B648: SBC.b #$10
#_09B64A: STA.b $02

#_09B64C: LDA.l $7FF85A,X
#_09B650: SBC.b #$00
#_09B652: STA.b $03

#_09B654: PHX

#_09B655: LDY.b #$04
#_09B657: JSL Underworld_UpdateTilemapWithCommonTile

#_09B65B: PLX

#_09B65C: PLA

;---------------------------------------------------------------------------------------------------

.dont_place_pit
#_09B65D: LSR A
#_09B65E: LSR A
#_09B65F: LSR A
#_09B660: TAY

#_09B661: LDA.w .char,Y
#_09B664: STA.b $03

#_09B666: LDA.w .prop,Y
#_09B669: STA.b $05

#_09B66B: LDA.w .size,Y
#_09B66E: STA.b $06

#_09B670: LDA.l $7FF83C,X
#_09B674: SEC
#_09B675: SBC.b $E2
#_09B677: PHP

#_09B678: CLC
#_09B679: ADC.w .offset,Y
#_09B67C: STA.b $00

#_09B67E: LDA.l $7FF878,X
#_09B682: ADC.b #$00
#_09B684: PLP
#_09B685: SBC.b $E3
#_09B687: BNE .exit

;---------------------------------------------------------------------------------------------------

#_09B689: LDA.l $7FF81E,X
#_09B68D: SEC
#_09B68E: SBC.b $E8
#_09B690: PHP

#_09B691: CLC
#_09B692: ADC.w .offset,Y
#_09B695: STA.b $02

#_09B697: LDA.l $7FF85A,X
#_09B69B: ADC.b #$00

#_09B69D: PLP
#_09B69E: SBC.b $E9
#_09B6A0: BEQ .draw

.exit
#_09B6A2: RTS

;---------------------------------------------------------------------------------------------------

.draw
#_09B6A3: LDY.b #$00

#_09B6A5: LDA.b $00
#_09B6A7: STA.b ($90),Y

#_09B6A9: LDA.b $02
#_09B6AB: SEC
#_09B6AC: SBC.b #$10

#_09B6AE: INY
#_09B6AF: STA.b ($90),Y

#_09B6B1: INY

#_09B6B2: LDA.b $03
#_09B6B4: STA.b ($90),Y

#_09B6B6: INY

#_09B6B7: LDA.b $05
#_09B6B9: STA.b ($90),Y

#_09B6BB: LDA.b $06
#_09B6BD: STA.b ($92)

#_09B6BF: RTS

;===================================================================================================

Garnish01_FireSnakeTail:
#_09B6C0: JSR Garnish_PrepOAMCoord

#_09B6C3: LDA.b $00
#_09B6C5: STA.b ($90),Y

#_09B6C7: LDA.b $02

#_09B6C9: INY
#_09B6CA: STA.b ($90),Y

#_09B6CC: INY

#_09B6CD: LDA.b #$28
#_09B6CF: STA.b ($90),Y

#_09B6D1: PHY

#_09B6D2: LDA.l $7FF92C,X
#_09B6D6: TAY

#_09B6D7: LDA.w $0F50,Y
#_09B6DA: ORA.w $0B89,Y

#_09B6DD: PLY

#_09B6DE: JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

Garnish02_MothulaBeamTrail:
#_09B6E1: LDY.b #$00

#_09B6E3: LDA.l $7FF83C,X
#_09B6E7: SEC
#_09B6E8: SBC.b $E2
#_09B6EA: STA.b ($90),Y

#_09B6EC: LDA.l $7FF81E,X
#_09B6F0: SEC
#_09B6F1: SBC.b $E8

#_09B6F3: INY
#_09B6F4: STA.b ($90),Y

#_09B6F6: INY

#_09B6F7: LDA.b #$AA
#_09B6F9: STA.b ($90),Y

#_09B6FB: LDA.l $7FF92C,X

#_09B6FF: PHY

#_09B700: LDA.l $7FF92C,X
#_09B704: TAY

#_09B705: LDA.w $0F50,Y
#_09B708: ORA.w $0B89,Y

#_09B70B: PLY

;===================================================================================================

Garnish_FinalizeBigOAMObject:
#_09B70C: INY

#_09B70D: STA.b ($90),Y

#_09B70F: LDA.b #$02
#_09B711: STA.b ($92)

#_09B713: RTS

;===================================================================================================

Overlord_SpawnBoulder:
#_09B714: LDA.b $1B
#_09B716: BNE .exit

#_09B718: LDA.w $0FFD
#_09B71B: BEQ .exit

#_09B71D: LDA.b $11
#_09B71F: ORA.w $0FC1
#_09B722: BNE .exit

#_09B724: INC.w $0FFE

#_09B727: LDA.w $0FFE
#_09B72A: AND.b #$3F
#_09B72C: BNE .exit

#_09B72E: LDA.b $E9
#_09B730: SEC
#_09B731: SBC.w $0FBF
#_09B734: CMP.b #$02
#_09B736: BMI .exit

;---------------------------------------------------------------------------------------------------

#_09B738: LDA.b #$C2 ; SPRITE C2
#_09B73A: LDY.b #$0D
#_09B73C: JSL Sprite_SpawnDynamically
#_09B740: BMI .exit

#_09B742: JSL GetRandomNumber
#_09B746: AND.b #$7F

#_09B748: CLC
#_09B749: ADC.b #$40

#_09B74B: CLC
#_09B74C: ADC.b $E2
#_09B74E: STA.w $0D10,Y

#_09B751: LDA.b $E3
#_09B753: ADC.b #$00
#_09B755: STA.w $0D30,Y

#_09B758: LDA.b $E8
#_09B75A: SEC
#_09B75B: SBC.b #$30
#_09B75D: STA.w $0D00,Y

#_09B760: LDA.b $E9
#_09B762: SBC.b #$00
#_09B764: STA.w $0D20,Y

#_09B767: LDA.b #$00
#_09B769: STA.w $0F20,Y
#_09B76C: STA.w $0DE0,Y
#_09B76F: STA.w $0F70,Y

.exit
#_09B772: RTS

;===================================================================================================

Overlord_Main:
#_09B773: PHB
#_09B774: PHK
#_09B775: PLB

#_09B776: JSR Overlord_ExecuteAll
#_09B779: JSR Overlord_SpawnBoulder

#_09B77C: PLB

#_09B77D: RTL

;===================================================================================================

Overlord_ExecuteAll:
#_09B77E: LDA.b $11
#_09B780: ORA.w $0FC1
#_09B783: BNE .exit

#_09B785: LDX.b #$07

.next
#_09B787: LDA.w $0B00,X
#_09B78A: BEQ .skip

#_09B78C: JSR Overlord_ExecuteSingle

.skip
#_09B78F: DEX
#_09B790: BPL .next

.exit
#_09B792: RTS

;===================================================================================================

Overlord_ExecuteSingle:
#_09B793: PHA

#_09B794: JSR Overlord_CheckIfActive

#_09B797: PLA

#_09B798: DEC A

#_09B799: REP #$30

#_09B79B: AND.w #$00FF
#_09B79E: ASL A
#_09B79F: TAY

#_09B7A0: LDA.w .vectors,Y
#_09B7A3: DEC A
#_09B7A4: PHA

#_09B7A5: SEP #$30

#_09B7A7: RTS

;---------------------------------------------------------------------------------------------------

.vectors
#_09B7A8: dw Overlord01_PositionTarget
#_09B7AA: dw Overlord02_FullRoomCannons
#_09B7AC: dw Overlord03_VerticalCannon
#_09B7AE: dw Overlord04_Unused
#_09B7B0: dw Overlord05_FallingStalfos
#_09B7B2: dw Overlord06_BadSwitchSnake
#_09B7B4: dw Overlord07_MovingFloor
#_09B7B6: dw Overlord08_BlobSpawner
#_09B7B8: dw Overlord09_WallmasterSpawner
#_09B7BA: dw Overlord0A_FallingSquare
#_09B7BC: dw Overlord0B_FallingBridge
#_09B7BE: dw Overlord0C_FallingTiles_WestToEast
#_09B7C0: dw Overlord0D_FallingTiles_NorthToSouth
#_09B7C2: dw Overlord0E_FallingTiles_EastToWest
#_09B7C4: dw Overlord0F_FallingTiles_SouthToNorth
#_09B7C6: dw Overlord10_PirogusuSpawner_left
#_09B7C8: dw Overlord11_PirogusuSpawner_right
#_09B7CA: dw Overlord12_PirogusuSpawner_top
#_09B7CC: dw Overlord13_PirogusuSpawner_bottom
#_09B7CE: dw Overlord14_TileRoom
#_09B7D0: dw Overlord15_WizzrobeSpawner
#_09B7D2: dw Overlord16_ZoroSpawner
#_09B7D4: dw Overlord17_PotTrap
#_09B7D6: dw Overlord18_InvisibleStalfos
#_09B7D8: dw Overlord19_ArmosCoordinator_bounce
#_09B7DA: dw Overlord1A_BadSwitchBomb

;===================================================================================================

Overlord19_ArmosCoordinator_bounce:
#_09B7DC: JSL Overlord19_ArmosCoordinator

#_09B7E0: RTS

;===================================================================================================

pool Overlord18_InvisibleStalfos

.offset_x_low
#_09B7E1: db   0,   0, -48,  48

.offset_x_high
#_09B7E5: db   0,   0,  -1,   0

.offset_y_low
#_09B7E9: db -40,  56,   8,   8

.offset_y_high
#_09B7ED: db  -1,   0,   0,   0

.timer
#_09B7F1: db  48,  80, 112, 144

pool off

;---------------------------------------------------------------------------------------------------

Overlord18_InvisibleStalfos:
#_09B7F5: LDA.w $0B08,X
#_09B7F8: STA.b $00

#_09B7FA: LDA.w $0B10,X
#_09B7FD: STA.b $01

#_09B7FF: LDA.w $0B18,X
#_09B802: STA.b $02

#_09B804: LDA.w $0B20,X
#_09B807: STA.b $03

#_09B809: REP #$20

#_09B80B: LDA.b $00
#_09B80D: SEC
#_09B80E: SBC.b $22
#_09B810: CLC
#_09B811: ADC.w #$0018
#_09B814: CMP.w #$0030
#_09B817: BCS .exit

#_09B819: LDA.b $02
#_09B81B: SEC
#_09B81C: SBC.b $20
#_09B81E: CLC
#_09B81F: ADC.w #$0018
#_09B822: CMP.w #$0030
#_09B825: BCS .exit

#_09B827: SEP #$20

#_09B829: STZ.w $0B00,X

;---------------------------------------------------------------------------------------------------

#_09B82C: LDA.b #$03
#_09B82E: STA.w $0FB5

.next
#_09B831: LDA.b #$A7 ; SPRITE A7
#_09B833: LDY.b #$0C
#_09B835: JSL Sprite_SpawnDynamically_slot_limited
#_09B839: BMI .skip

#_09B83B: PHX

#_09B83C: LDX.w $0FB5

#_09B83F: LDA.b $22
#_09B841: CLC
#_09B842: ADC.w .offset_x_low,X
#_09B845: STA.w $0D10,Y

#_09B848: LDA.b $23
#_09B84A: ADC.w .offset_x_high,X
#_09B84D: STA.w $0D30,Y

#_09B850: LDA.b $20
#_09B852: CLC
#_09B853: ADC.w .offset_y_low,X
#_09B856: STA.w $0D00,Y

#_09B859: LDA.b $21
#_09B85B: ADC.w .offset_y_high,X
#_09B85E: STA.w $0D20,Y

#_09B861: LDA.w .timer,X
#_09B864: STA.w $0DF0,Y

#_09B867: PLX

#_09B868: LDA.w $0B40,X
#_09B86B: STA.w $0F20,Y

#_09B86E: LDA.b #$01
#_09B870: STA.w $0E90,Y

#_09B873: LDA.b #$03
#_09B875: STA.w $0E40,Y

#_09B878: DEC A
#_09B879: STA.w $0DE0,Y

.skip
#_09B87C: DEC.w $0FB5
#_09B87F: BPL .next

;---------------------------------------------------------------------------------------------------

.exit
#_09B881: SEP #$20

#_09B883: RTS

;===================================================================================================

Overlord17_PotTrap:
#_09B884: LDA.w $0B08,X
#_09B887: STA.b $00

#_09B889: LDA.w $0B10,X
#_09B88C: STA.b $01

#_09B88E: LDA.w $0B18,X
#_09B891: STA.b $02

#_09B893: LDA.w $0B20,X
#_09B896: STA.b $03

#_09B898: REP #$20

#_09B89A: LDA.b $00
#_09B89C: SEC
#_09B89D: SBC.b $22
#_09B89F: CLC
#_09B8A0: ADC.w #$0020

#_09B8A3: CMP.w #$0040
#_09B8A6: BCS .exit

#_09B8A8: LDA.b $02
#_09B8AA: SEC
#_09B8AB: SBC.b $20
#_09B8AD: CLC
#_09B8AE: ADC.w #$0020

#_09B8B1: CMP.w #$0040
#_09B8B4: BCS .exit

#_09B8B6: SEP #$20

#_09B8B8: STZ.w $0B00,X

#_09B8BB: INC.w $0B9E

.exit
#_09B8BE: SEP #$20

#_09B8C0: RTS

;===================================================================================================

pool Overlord16_ZoroSpawner

.offset_x_low
#_09B8C1: db  -4,  -2,   0,   2
#_09B8C5: db   4,   6,   8,  12

.offset_x_high
#_09B8C9: db  -1,  -1,   0,   0
#_09B8CD: db   0,   0,   0,   0

pool off

;---------------------------------------------------------------------------------------------------

Overlord16_ZoroSpawner:
#_09B8D1: DEC.w $0B30,X

#_09B8D4: LDA.w $0B18,X
#_09B8D7: CLC
#_09B8D8: ADC.b #$08
#_09B8DA: STA.b $00

#_09B8DC: LDA.w $0B20,X
#_09B8DF: ADC.b #$00
#_09B8E1: STA.b $01

#_09B8E3: LDA.w $0B08,X
#_09B8E6: CLC
#_09B8E7: ADC.b #$08
#_09B8E9: STA.b $02

#_09B8EB: LDA.w $0B10,X
#_09B8EE: ADC.b #$00
#_09B8F0: STA.b $03

#_09B8F2: LDA.w $0B40,X
#_09B8F5: JSL GetTileType_long

#_09B8F9: CMP.b #$82 ; TILETYPE 82
#_09B8FB: BNE .exit

#_09B8FD: LDA.w $0B30,X
#_09B900: CMP.b #$18
#_09B902: BCS .exit

#_09B904: AND.b #$03
#_09B906: BNE .exit

;---------------------------------------------------------------------------------------------------

#_09B908: LDA.b #$9C ; SPRITE 9C
#_09B90A: LDY.b #$0C
#_09B90C: JSL Sprite_SpawnDynamically_slot_limited
#_09B910: BMI .exit

#_09B912: PHX

#_09B913: JSL GetRandomNumber
#_09B917: AND.b #$07
#_09B919: TAX

#_09B91A: LDA.b $05
#_09B91C: CLC
#_09B91D: ADC.w .offset_x_low,X
#_09B920: PHP

#_09B921: CLC
#_09B922: ADC.b #$08
#_09B924: STA.w $0D10,Y

#_09B927: LDA.b $06
#_09B929: ADC.b #$00
#_09B92B: PLP
#_09B92C: ADC.w .offset_x_high,X
#_09B92F: STA.w $0D30,Y

#_09B932: LDA.b $07
#_09B934: CLC
#_09B935: ADC.b #$08
#_09B937: STA.w $0D00,Y

#_09B93A: LDA.b $08
#_09B93C: STA.w $0D20,Y

#_09B93F: PLX

#_09B940: LDA.w $0B40,X
#_09B943: STA.w $0F20,Y

#_09B946: LDA.b #$01
#_09B948: STA.w $0F60,Y
#_09B94B: STA.w $0E90,Y
#_09B94E: STA.w $0BA0,Y

#_09B951: LDA.b #$10
#_09B953: STA.w $0D40,Y

#_09B956: LDA.b #$20
#_09B958: STA.w $0E40,Y

#_09B95B: LDA.b #$0D
#_09B95D: STA.w $0F50,Y

#_09B960: JSL GetRandomNumber
#_09B964: STA.w $0E80,Y

#_09B967: LDA.b #$30
#_09B969: STA.w $0DF0,Y

#_09B96C: LDA.b #$03
#_09B96E: STA.w $0CD2,Y

.exit
#_09B971: RTS

;===================================================================================================

pool Overlord15_WizzrobeSpawner

.offset_x_low
#_09B972: db  48, -48,   0,   0

.offset_x_high
#_09B976: db   0,  -1,   0,   0

.offset_y_low
#_09B97A: db  16,  16,  64, -32

.offset_y_high
#_09B97E: db   0,   0,   0,  -1

.timer
#_09B982: db   0,  16,  32,  48

pool off

;---------------------------------------------------------------------------------------------------

Overlord15_WizzrobeSpawner:
#_09B986: LDA.w $0B30,X
#_09B989: CMP.b #$80
#_09B98B: BEQ .spawn

#_09B98D: LDA.b $1A
#_09B98F: LSR A
#_09B990: BCC .exit

#_09B992: DEC.w $0B30,X

.exit
#_09B995: RTS

;---------------------------------------------------------------------------------------------------

.spawn
#_09B996: LDA.b #$7F
#_09B998: STA.w $0B30,X

#_09B99B: LDA.b #$03
#_09B99D: STA.w $0FB5

.next
#_09B9A0: LDA.b #$9B ; SPRITE 9B
#_09B9A2: LDY.b #$0C
#_09B9A4: JSL Sprite_SpawnDynamically_slot_limited
#_09B9A8: BMI .no_space

#_09B9AA: PHX

#_09B9AB: LDX.w $0FB5

#_09B9AE: LDA.b $22
#_09B9B0: CLC
#_09B9B1: ADC.w .offset_x_low,X
#_09B9B4: STA.w $0D10,Y

#_09B9B7: LDA.b $23
#_09B9B9: ADC.w .offset_x_high,X
#_09B9BC: STA.w $0D30,Y

#_09B9BF: LDA.b $20
#_09B9C1: CLC
#_09B9C2: ADC.w .offset_y_low,X
#_09B9C5: STA.w $0D00,Y

#_09B9C8: LDA.b $21
#_09B9CA: ADC.w .offset_y_high,X
#_09B9CD: STA.w $0D20,Y

#_09B9D0: LDA.w .timer,X
#_09B9D3: STA.w $0DF0,Y

#_09B9D6: PLX

#_09B9D7: LDA.w $0B40,X
#_09B9DA: STA.w $0F20,Y

#_09B9DD: LDA.b #$01
#_09B9DF: STA.w $0DA0,Y

.no_space
#_09B9E2: DEC.w $0FB5
#_09B9E5: BPL .next

#_09B9E7: RTS

;===================================================================================================

Overlord14_TileRoom:
#_09B9E8: LDA.w $0B08,X
#_09B9EB: CMP.b $E2

#_09B9ED: LDA.w $0B10,X
#_09B9F0: SBC.b $E3
#_09B9F2: BNE .exit

#_09B9F4: LDA.w $0B18,X
#_09B9F7: CMP.b $E8

#_09B9F9: LDA.w $0B20,X
#_09B9FC: SBC.b $E9
#_09B9FE: BNE .exit

#_09BA00: DEC.w $0B30,X

#_09BA03: LDA.w $0B30,X
#_09BA06: CMP.b #$80
#_09BA08: BEQ .continue

#_09BA0A: RTS

;---------------------------------------------------------------------------------------------------

.no_space
#_09BA0B: LDA.b #$81
#_09BA0D: STA.w $0B30,X

#_09BA10: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_09BA11: JSR TileRoom_SpawnTile
#_09BA14: BMI .no_space

#_09BA16: INC.w $0B28,X

#_09BA19: LDA.w $0B28,X
#_09BA1C: CMP.b #$16
#_09BA1E: BEQ .last_tile

#_09BA20: LDA.b #$E0
#_09BA22: STA.w $0B30,X

#_09BA25: RTS

.last_tile
#_09BA26: STZ.w $0B00,X

.exit
#_09BA29: RTS

;===================================================================================================

pool TileRoom_SpawnTile

.position_x
#_09BA2A: db $70, $80, $60, $90
#_09BA2E: db $90, $60, $70, $80
#_09BA32: db $80, $70, $50, $A0
#_09BA36: db $A0, $50, $50, $A0
#_09BA3A: db $A0, $50, $70, $80
#_09BA3E: db $80, $70

.position_y
#_09BA40: db $80, $80, $70, $90
#_09BA44: db $70, $90, $60, $A0
#_09BA48: db $60, $A0, $60, $B0
#_09BA4C: db $60, $B0, $80, $90
#_09BA50: db $80, $90, $70, $90
#_09BA54: db $70, $90

pool off

;---------------------------------------------------------------------------------------------------

TileRoom_SpawnTile:
#_09BA56: LDA.b #$94 ; SPRITE 94
#_09BA58: JSL Sprite_SpawnDynamically
#_09BA5C: BMI .exit

#_09BA5E: LDA.b #$01
#_09BA60: STA.w $0E90,Y

#_09BA63: PHX

#_09BA64: LDA.w $0B28,X
#_09BA67: TAX

#_09BA68: LDA.w .position_x,X
#_09BA6B: STA.w $0D10,Y

#_09BA6E: LDA.w .position_y,X
#_09BA71: SEC
#_09BA72: SBC.b #$08
#_09BA74: STA.w $0D00,Y

#_09BA77: PLX

#_09BA78: LDA.w $0B20,X
#_09BA7B: STA.w $0D20,Y

#_09BA7E: LDA.w $0B10,X
#_09BA81: STA.w $0D30,Y

#_09BA84: LDA.w $0B40,X
#_09BA87: STA.w $0F20,Y

#_09BA8A: LDA.b #$04
#_09BA8C: STA.w $0E50,Y

#_09BA8F: LDA.b #$00
#_09BA91: STA.w $0BE0,Y
#_09BA94: STA.w $0E50,Y

#_09BA97: LDA.b #$08
#_09BA99: STA.w $0CAA,Y

#_09BA9C: LDA.b #$04
#_09BA9E: STA.w $0E40,Y

#_09BAA1: LDA.b #$01
#_09BAA3: STA.w $0F50,Y

#_09BAA6: LDA.b #$04
#_09BAA8: STA.w $0CD2,Y

.exit
#_09BAAB: RTS

;===================================================================================================

Overlord10_PirogusuSpawner_left:
Overlord11_PirogusuSpawner_right:
Overlord12_PirogusuSpawner_top:
Overlord13_PirogusuSpawner_bottom:
#_09BAAC: LDA.w $0B00,X
#_09BAAF: SEC
#_09BAB0: SBC.b #$10
#_09BAB2: STA.w $0FB5

#_09BAB5: LDA.w $0B30,X
#_09BAB8: CMP.b #$80
#_09BABA: BEQ .spawn

#_09BABC: DEC.w $0B30,X

#_09BABF: RTS

;---------------------------------------------------------------------------------------------------

.direction
#_09BAC0: db $02
#_09BAC1: db $03
#_09BAC2: db $00
#_09BAC3: db $01

;---------------------------------------------------------------------------------------------------

.spawn
#_09BAC4: JSL GetRandomNumber
#_09BAC8: AND.b #$1F
#_09BACA: CLC
#_09BACB: ADC.b #$60
#_09BACD: STA.w $0B30,X

#_09BAD0: STZ.b $00

#_09BAD2: LDY.b #$0F

.next_check
#_09BAD4: LDA.w $0DD0,Y
#_09BAD7: BEQ .skip

#_09BAD9: LDA.w $0E20,Y
#_09BADC: CMP.b #$10 ; SPRITE 10
#_09BADE: BNE .skip

#_09BAE0: INC.b $00

.skip
#_09BAE2: DEY
#_09BAE3: BPL .next_check

;---------------------------------------------------------------------------------------------------

#_09BAE5: LDA.b $00
#_09BAE7: CMP.b #$05
#_09BAE9: BCS .exit

#_09BAEB: LDY.b #$0C
#_09BAED: LDA.b #$94 ; SPRITE 94
#_09BAEF: JSL Sprite_SpawnDynamically_slot_limited
#_09BAF3: BMI .exit

#_09BAF5: LDA.b $05
#_09BAF7: STA.w $0D10,Y

#_09BAFA: LDA.b $06
#_09BAFC: STA.w $0D30,Y

#_09BAFF: LDA.b $07
#_09BB01: STA.w $0D00,Y

#_09BB04: LDA.b $08
#_09BB06: STA.w $0D20,Y

#_09BB09: LDA.w $0B40,X
#_09BB0C: STA.w $0F20,Y

#_09BB0F: LDA.b #$20
#_09BB11: STA.w $0DF0,Y

#_09BB14: LDA.w $0FB5
#_09BB17: STA.w $0DE0,Y

#_09BB1A: PHX

#_09BB1B: TAX

#_09BB1C: LDA.w .direction,X
#_09BB1F: STA.w $0D90,Y

#_09BB22: PLX

.exit
#_09BB23: RTS

;===================================================================================================

FallingTilesPattern:

.rectangle
#_09BB24: db $02, $02, $02, $02
#_09BB28: db $02, $02, $01, $01
#_09BB2C: db $01, $01, $01, $01
#_09BB30: db $01, $03, $03, $03
#_09BB34: db $03, $03, $03, $00
#_09BB38: db $00, $00, $00, $00
#_09BB3C: db $00

;---------------------------------------------------------------------------------------------------

.bridge
#_09BB3D: db $00, $03, $01, $03
#_09BB41: db $00, $03, $01, $03
#_09BB45: db $00, $03, $01, $03
#_09BB49: db $00, $03, $01, $03
#_09BB4D: db $00, $03, $01, $03
#_09BB51: db $00, $03, $01, $03
#_09BB55: db $00, $03, $01, $03
#_09BB59: db $00, $03, $01, $03
#_09BB5D: db $00, $03, $01, $03
#_09BB61: db $00, $03, $01, $03
#_09BB65: db $00

;---------------------------------------------------------------------------------------------------

.west_to_east
#_09BB66: db $00, $00, $00, $00
#_09BB6A: db $00, $00, $00, $00
#_09BB6E: db $00, $00, $00

.north_to_south
#_09BB71: db $02, $02, $02, $02
#_09BB75: db $02, $02, $02, $02
#_09BB79: db $02, $02

.east_to_west
#_09BB7B: db $01, $01, $01, $01
#_09BB7F: db $01, $01, $01, $01
#_09BB83: db $01, $01, $01

.south_to_north
#_09BB86: db $03, $03, $03, $03
#_09BB8A: db $03, $03, $03, $03
#_09BB8E: db $03, $03

;---------------------------------------------------------------------------------------------------

.adjust_x_low
#_09BB90: db  16, -16,   0,   0

.adjust_x_high
#_09BB94: db   0,  -1,   0,   0

.adjust_y_low
#_09BB98: db   0,   0,  16, -16

.adjust_y_high
#_09BB9C: db   0,   0,   0,  -1

;---------------------------------------------------------------------------------------------------

.adjust_limit
#_09BBA0: db $1A
#_09BBA1: db $2A
#_09BBA2: db $0C
#_09BBA3: db $0B
#_09BBA4: db $0C
#_09BBA5: db $0B

;---------------------------------------------------------------------------------------------------

.pointers_low
#_09BBA6: db .rectangle>>0
#_09BBA7: db .bridge>>0
#_09BBA8: db .west_to_east>>0
#_09BBA9: db .north_to_south>>0
#_09BBAA: db .east_to_west>>0
#_09BBAB: db .south_to_north>>0

.pointers_high
#_09BBAC: db .rectangle>>8
#_09BBAD: db .bridge>>8
#_09BBAE: db .west_to_east>>8
#_09BBAF: db .north_to_south>>8
#_09BBB0: db .east_to_west>>8
#_09BBB1: db .south_to_north>>8

;===================================================================================================

Overlord0A_FallingSquare:
Overlord0B_FallingBridge:
Overlord0C_FallingTiles_WestToEast:
Overlord0D_FallingTiles_NorthToSouth:
Overlord0E_FallingTiles_EastToWest:
Overlord0F_FallingTiles_SouthToNorth:
#_09BBB2: LDA.w $0B30,X
#_09BBB5: BEQ .drop_tile

#_09BBB7: LDA.w $0B38,X
#_09BBBA: BEQ .check_activeness

#_09BBBC: DEC.w $0B30,X

#_09BBBF: RTS

;---------------------------------------------------------------------------------------------------

.check_activeness
#_09BBC0: LDA.w $0B08,X
#_09BBC3: CMP.b $E2

#_09BBC5: LDA.w $0B10,X
#_09BBC8: SBC.b $E3
#_09BBCA: BNE .exit

#_09BBCC: LDA.w $0B18,X
#_09BBCF: CMP.b $E8
#_09BBD1: LDA.w $0B20,X

#_09BBD4: SBC.b $E9
#_09BBD6: BNE .exit

#_09BBD8: INC.w $0B38,X

.exit
#_09BBDB: RTS

;---------------------------------------------------------------------------------------------------

.drop_tile
#_09BBDC: LDA.b #$10
#_09BBDE: STA.w $0B30,X

#_09BBE1: JSR SpawnFallingTile

#_09BBE4: INC.w $0B28,X

#_09BBE7: LDA.w $0B00,X
#_09BBEA: SEC
#_09BBEB: SBC.b #$0A
#_09BBED: TAY

#_09BBEE: LDA.w FallingTilesPattern_pointers_low,Y
#_09BBF1: STA.b $00

#_09BBF3: LDA.w FallingTilesPattern_pointers_high,Y
#_09BBF6: STA.b $01

#_09BBF8: LDA.w FallingTilesPattern_adjust_limit,Y
#_09BBFB: CMP.w $0B28,X
#_09BBFE: BNE .not_last_tile

#_09BC00: STZ.w $0B00,X

;---------------------------------------------------------------------------------------------------

.not_last_tile
#_09BC03: LDY.w $0B28,X
#_09BC06: DEY

#_09BC07: LDA.b ($00),Y
#_09BC09: TAY

#_09BC0A: LDA.w $0B08,X
#_09BC0D: CLC
#_09BC0E: ADC.w FallingTilesPattern_adjust_x_low,Y
#_09BC11: STA.w $0B08,X

#_09BC14: LDA.w $0B10,X
#_09BC17: ADC.w FallingTilesPattern_adjust_x_high,Y
#_09BC1A: STA.w $0B10,X

#_09BC1D: LDA.w $0B18,X
#_09BC20: CLC
#_09BC21: ADC.w FallingTilesPattern_adjust_y_low,Y
#_09BC24: STA.w $0B18,X

#_09BC27: LDA.w $0B20,X
#_09BC2A: ADC.w FallingTilesPattern_adjust_y_high,Y
#_09BC2D: STA.w $0B20,X

#_09BC30: RTS

;===================================================================================================

SpawnFallingTile:
#_09BC31: TXY
#_09BC32: PHX

#_09BC33: LDX.b #$1D

.next
#_09BC35: LDA.l $7FF800,X
#_09BC39: BNE .skip

#_09BC3B: LDA.b #$03 ; GARNISH 03
#_09BC3D: STA.l $7FF800,X

#_09BC41: LDA.w $0B08,Y
#_09BC44: STA.l $7FF83C,X

#_09BC48: JSL CalculateSFXPan_Arbitrary
#_09BC4C: ORA.b #$1F ; SFX2.1F
#_09BC4E: STA.w $012E

#_09BC51: LDA.w $0B10,Y
#_09BC54: STA.l $7FF878,X

#_09BC58: LDA.w $0B18,Y
#_09BC5B: CLC
#_09BC5C: ADC.b #$10
#_09BC5E: STA.l $7FF81E,X

#_09BC62: LDA.w $0B20,Y
#_09BC65: ADC.b #$00
#_09BC67: STA.l $7FF85A,X

#_09BC6B: LDA.b #$1F
#_09BC6D: STA.l $7FF90E,X

#_09BC71: STA.w $0FB4

#_09BC74: BRA .exit

.skip
#_09BC76: DEX
#_09BC77: BPL .next

;---------------------------------------------------------------------------------------------------

.exit
#_09BC79: PLX

#_09BC7A: RTS

;===================================================================================================

Overlord09_WallmasterSpawner:
#_09BC7B: LDA.w $0B30,X
#_09BC7E: CMP.b #$80
#_09BC80: BEQ .spawn_master

#_09BC82: LDA.b $1A
#_09BC84: AND.b #$01
#_09BC86: BNE .exit

#_09BC88: DEC.w $0B30,X

.exit
#_09BC8B: RTS

;---------------------------------------------------------------------------------------------------

.spawn_master
#_09BC8C: LDA.b #$7F
#_09BC8E: STA.w $0B30,X

#_09BC91: LDA.b #$90 ; SPRITE 90
#_09BC93: LDY.b #$0C
#_09BC95: JSL Sprite_SpawnDynamically_slot_limited
#_09BC99: BMI .no_space

#_09BC9B: LDA.b $22
#_09BC9D: STA.w $0D10,Y

#_09BCA0: LDA.b $23
#_09BCA2: STA.w $0D30,Y

#_09BCA5: LDA.b $20
#_09BCA7: STA.w $0D00,Y

#_09BCAA: LDA.b $21
#_09BCAC: STA.w $0D20,Y

#_09BCAF: LDA.b #$D0
#_09BCB1: STA.w $0F70,Y

#_09BCB4: PHX

#_09BCB5: TYX

#_09BCB6: LDA.b #$20 ; SFX2.20
#_09BCB8: JSL SpriteSFX_QueueSFX2WithPan

#_09BCBC: PLX

#_09BCBD: LDA.b $EE
#_09BCBF: STA.w $0F20,Y

.no_space
#_09BCC2: RTS

;===================================================================================================

Overlord08_BlobSpawner:
#_09BCC3: LDA.w $0B30,X
#_09BCC6: BEQ .spawn_blob

#_09BCC8: DEC.w $0B30,X

#_09BCCB: RTS

.spawn_blob
#_09BCCC: LDA.b #$A0
#_09BCCE: STA.w $0B30,X

#_09BCD1: STZ.b $00

#_09BCD3: LDY.b #$0F

.next_count
#_09BCD5: LDA.w $0DD0,Y
#_09BCD8: BEQ .dont_tally

#_09BCDA: LDA.w $0E20,Y
#_09BCDD: CMP.b #$8F ; SPRITE 8F
#_09BCDF: BNE .dont_tally

#_09BCE1: INC.b $00

.dont_tally
#_09BCE3: DEY
#_09BCE4: BPL .next_count

;---------------------------------------------------------------------------------------------------

#_09BCE6: LDA.b $00
#_09BCE8: CMP.b #$05
#_09BCEA: BCS .exit

#_09BCEC: LDA.b #$8F ; SPRITE 8F
#_09BCEE: LDY.b #$0C
#_09BCF0: JSL Sprite_SpawnDynamically_slot_limited
#_09BCF4: BMI .exit

#_09BCF6: PHX

#_09BCF7: LDA.b $2F
#_09BCF9: LSR A
#_09BCFA: TAX

#_09BCFB: LDA.b $22
#_09BCFD: CLC
#_09BCFE: ADC.w BlobSpawner_offset_x_low,X
#_09BD01: STA.w $0D10,Y

#_09BD04: LDA.b $23
#_09BD06: ADC.w BlobSpawner_offset_x_high,X
#_09BD09: STA.w $0D30,Y

#_09BD0C: LDA.b $20
#_09BD0E: CLC
#_09BD0F: ADC.w BlobSpawner_offset_y_low,X
#_09BD12: STA.w $0D00,Y

#_09BD15: LDA.b $21
#_09BD17: ADC.w BlobSpawner_offset_y_high,X
#_09BD1A: STA.w $0D20,Y

#_09BD1D: PLX

#_09BD1E: LDA.b #$C0
#_09BD20: STA.w $0F70,Y

#_09BD23: LDA.b $EE
#_09BD25: STA.w $0F20,Y

#_09BD28: LDA.b #$02
#_09BD2A: STA.w $0D80,Y
#_09BD2D: STA.w $0E90,Y
#_09BD30: STA.w $0DB0,Y

#_09BD33: JSL GetRandomNumber
#_09BD37: AND.b #$1F
#_09BD39: ORA.b #$10
#_09BD3B: STA.w $0EB0,Y

.exit
#_09BD3E: RTS

;===================================================================================================

Overlord07_MovingFloor:
#_09BD3F: LDA.w $0DD0
#_09BD42: CMP.b #$04
#_09BD44: BNE .boss_dying

#_09BD46: STZ.w $0B00,X
#_09BD49: BRA .stop_floor

.boss_dying
#_09BD4B: LDA.w $0B28,X
#_09BD4E: BNE .direction_lock

#_09BD50: INC.w $0B30,X

#_09BD53: LDA.w $0B30,X
#_09BD56: CMP.b #$20
#_09BD58: BNE .stop_floor

#_09BD5A: STZ.w $0B30,X

#_09BD5D: JSL GetRandomNumber
#_09BD61: AND.b #$03

#_09BD63: LDY.w $0B08,X
#_09BD66: BNE .omnidirectional

#_09BD68: AND.b #$01

.omnidirectional
#_09BD6A: ASL A
#_09BD6B: STA.w $041A

#_09BD6E: JSL GetRandomNumber
#_09BD72: AND.b #$7F
#_09BD74: ADC.b #$80
#_09BD76: STA.w $0B30,X

#_09BD79: INC.w $0B28,X

#_09BD7C: RTS

;---------------------------------------------------------------------------------------------------

.stop_floor
#_09BD7D: LDA.b #$01
#_09BD7F: STA.w $041A

#_09BD82: RTS

;---------------------------------------------------------------------------------------------------

.direction_lock
#_09BD83: DEC.w $0B30,X
#_09BD86: BNE .exit

#_09BD88: STZ.w $0B28,X

.exit
#_09BD8B: RTS

;===================================================================================================

UNREACHABLE_09BD8C:
#_09BD8C: RTS

;===================================================================================================

BlobSpawner:

.offset_x_low
#_09BD8D: db   0,   0, -48,  48

.offset_y_low
#_09BD91: db -40,  56,   8,   8

.offset_x_high
#_09BD95: db   0,   0,  -1,   0

.offset_y_high
#_09BD99: db  -1,   0,   0,   0

;===================================================================================================

Overlord04_Unused:
#_09BD9D: LDA.w $0B30,X
#_09BDA0: BEQ .spawn

#_09BDA2: LDA.b $1A
#_09BDA4: AND.b #$01
#_09BDA6: BNE .exit

#_09BDA8: DEC.w $0B30,X

.exit
#_09BDAB: RTS

;===================================================================================================

.spawn
#_09BDAC: LDA.b #$30
#_09BDAE: INC.w $0B28,X

#_09BDB1: LDY.w $0B28,X
#_09BDB4: CPY.b #$04
#_09BDB6: BNE .not_max_y_position

#_09BDB8: STZ.w $0B28,X

#_09BDBB: LDA.b #$D0

.not_max_y_position
#_09BDBD: STA.w $0B30,X

#_09BDC0: LDA.b #$85 ; SPRITE 85
#_09BDC2: LDY.b #$0C
#_09BDC4: JSL Sprite_SpawnDynamically_slot_limited
#_09BDC8: BMI .no_space

#_09BDCA: PHX

#_09BDCB: LDA.b $2F
#_09BDCD: LSR A
#_09BDCE: TAX

#_09BDCF: LDA.b $22
#_09BDD1: CLC
#_09BDD2: ADC.w BlobSpawner_offset_x_low,X
#_09BDD5: STA.w $0D10,Y

#_09BDD8: LDA.b $23
#_09BDDA: ADC.w BlobSpawner_offset_x_high,X
#_09BDDD: STA.w $0D30,Y

#_09BDE0: LDA.b $20
#_09BDE2: CLC
#_09BDE3: ADC.w BlobSpawner_offset_y_low,X
#_09BDE6: STA.w $0D00,Y

#_09BDE9: LDA.b $21
#_09BDEB: ADC.w BlobSpawner_offset_y_high,X
#_09BDEE: STA.w $0D20,Y

#_09BDF1: PLX

#_09BDF2: LDA.b #$90
#_09BDF4: STA.w $0F70,Y

#_09BDF7: LDA.b $EE
#_09BDF9: STA.w $0F20,Y

#_09BDFC: RTS

;===================================================================================================

#Overlord_PlayFallingSFX:
#_09BDFD: PHX
#_09BDFE: TYX

#_09BDFF: LDA.b #$20 ; SFX2.20
#_09BE01: JSL SpriteSFX_QueueSFX2WithPan

#_09BE05: PLX

.no_space
#_09BE06: RTS

;===================================================================================================

pool Overlord05_FallingStalfos

.timer
#_09BE07: db 255, 224, 192, 160
#_09BE0B: db 128,  96,  64,  32

pool off

;---------------------------------------------------------------------------------------------------

Overlord05_FallingStalfos:
#_09BE0F: LDA.w $0B08,X
#_09BE12: CMP.b $E2

#_09BE14: LDA.w $0B10,X
#_09BE17: SBC.b $E3
#_09BE19: BNE .exit_a

#_09BE1B: LDA.w $0B18,X
#_09BE1E: CMP.b $E8

#_09BE20: LDA.w $0B20,X
#_09BE23: SBC.b $E9
#_09BE25: BNE .exit_a

#_09BE27: LDA.w $0B28,X
#_09BE2A: BNE .triggered

#_09BE2C: LDA.w $0B9E
#_09BE2F: BEQ .exit_a

#_09BE31: INC.w $0B28,X

.exit_a
#_09BE34: RTS

;---------------------------------------------------------------------------------------------------

.triggered
#_09BE35: INC.w $0B28,X

#_09BE38: CMP.w .timer,X
#_09BE3B: BNE .exit_b

#_09BE3D: STZ.w $0B00,X

#_09BE40: LDA.b #$85 ; SPRITE 85
#_09BE42: LDY.b #$0C
#_09BE44: JSL Sprite_SpawnDynamically_slot_limited
#_09BE48: BMI .exit_b

#_09BE4A: LDA.b $05
#_09BE4C: STA.w $0D10,Y

#_09BE4F: LDA.b $06
#_09BE51: STA.w $0D30,Y

#_09BE54: LDA.b $07
#_09BE56: STA.w $0D00,Y

#_09BE59: LDA.b $08
#_09BE5B: STA.w $0D20,Y

#_09BE5E: LDA.b #$E0
#_09BE60: STA.w $0F70,Y

#_09BE63: LDA.w $0B40,X
#_09BE66: STA.w $0F20,Y

#_09BE69: JSR Overlord_PlayFallingSFX

.exit_b
#_09BE6C: RTS

;===================================================================================================

OverlordAmbushTimers:
#_09BE6D: db  32,  48,  64,  80
#_09BE71: db  96, 112, 128, 144

;===================================================================================================

Overlord06_BadSwitchSnake:
Overlord1A_BadSwitchBomb:
#_09BE75: LDA.w $0B28,X
#_09BE78: BNE .active

#_09BE7A: LDA.w $0CF4
#_09BE7D: BEQ .dont_activate_yet

#_09BE7F: INC.w $0B28,X

.dont_activate_yet
#_09BE82: RTS

;---------------------------------------------------------------------------------------------------

.active
#_09BE83: INC.w $0B28,X

#_09BE86: CMP.w OverlordAmbushTimers,X
#_09BE89: BNE .exit

#_09BE8B: LDA.b #$6E ; SPRITE 6E
#_09BE8D: JSL Sprite_SpawnDynamically
#_09BE91: BMI .exit

#_09BE93: LDA.b $05
#_09BE95: STA.w $0D10,Y

#_09BE98: LDA.b $06
#_09BE9A: STA.w $0D30,Y

#_09BE9D: LDA.b $07
#_09BE9F: STA.w $0D00,Y

#_09BEA2: LDA.b $08
#_09BEA4: STA.w $0D20,Y

#_09BEA7: LDA.b #$C0
#_09BEA9: STA.w $0F70,Y
#_09BEAC: STA.w $0E90,Y

#_09BEAF: LDA.w $0E60,Y
#_09BEB2: ORA.b #$10
#_09BEB4: STA.w $0E60,Y

#_09BEB7: LDA.w $0B40,X
#_09BEBA: STA.w $0F20,Y

#_09BEBD: JSR Overlord_PlayFallingSFX

#_09BEC0: LDA.w $0B00,X
#_09BEC3: STZ.w $0B00,X
#_09BEC6: CMP.b #$1A ; OVERLORD 1A
#_09BEC8: BNE .exit

#_09BECA: LDA.b #$4A ; SPRITE 4A
#_09BECC: STA.w $0E20,Y

#_09BECF: JSL Sprite_TransmuteToBomb

#_09BED3: LDA.b #$70
#_09BED5: STA.w $0E00,Y

.exit
#_09BED8: RTS

;===================================================================================================

pool Overlord02_FullRoomCannons

.coordinate_index
#_09BED9: db $02, $02, $02, $02
#_09BEDD: db $01, $01, $01, $01
#_09BEE1: db $03, $03, $03, $03
#_09BEE5: db $00, $00, $00, $00

.coordinate_x
#_09BEE9: db $40, $60, $90, $B0
#_09BEED: db $F0, $F0, $F0, $F0
#_09BEF1: db $B0, $90, $60, $40
#_09BEF5: db $00, $00, $00, $00

.coordinate_y
#_09BEF9: db $10, $10, $10, $10
#_09BEFD: db $40, $60, $A0, $C0
#_09BF01: db $F0, $F0, $F0, $F0
#_09BF05: db $C0, $A0, $60, $40

pool off

;---------------------------------------------------------------------------------------------------

Overlord02_FullRoomCannons:
#_09BF09: LDA.w $0B08,X
#_09BF0C: CMP.b $E2

#_09BF0E: LDA.w $0B10,X
#_09BF11: SBC.b $E3
#_09BF13: BNE .exit

#_09BF15: LDA.w $0B18,X
#_09BF18: CMP.b $E8

#_09BF1A: LDA.w $0B20,X
#_09BF1D: SBC.b $E9
#_09BF1F: BNE .exit

#_09BF21: LDA.b $1A
#_09BF23: AND.b #$0F
#_09BF25: BNE .exit

#_09BF27: STZ.b $0E
#_09BF29: STZ.w $0FB6

#_09BF2C: JSL GetRandomNumber
#_09BF30: AND.b #$0F
#_09BF32: TAY

#_09BF33: LDA.w .coordinate_index,Y
#_09BF36: STA.w $0FB5

#_09BF39: LDA.w .coordinate_x,Y
#_09BF3C: STA.w $0B08,X

#_09BF3F: LDA.b #$00
#_09BF41: CLC
#_09BF42: ADC.w $0FB0
#_09BF45: STA.w $0B10,X

#_09BF48: LDA.w .coordinate_y,Y
#_09BF4B: STA.w $0B18,X

#_09BF4E: LDA.b #$01
#_09BF50: CLC
#_09BF51: ADC.w $0FB1
#_09BF54: STA.w $0B20,X

#_09BF57: JSR Overlord_SpawnCannonBall

.exit
#_09BF5A: RTS

;===================================================================================================

Overlord03_VerticalCannon:
#_09BF5B: LDA.w $0B08,X
#_09BF5E: CMP.b $E2

#_09BF60: LDA.w $0B10,X
#_09BF63: SBC.b $E3
#_09BF65: BNE .inactive

#_09BF67: LDA.b $1A
#_09BF69: AND.b #$01
#_09BF6B: BNE .resist_tick

#_09BF6D: LDA.w $0B30,X
#_09BF70: BEQ .resist_tick

#_09BF72: DEC.w $0B30,X

.resist_tick
#_09BF75: LDA.b #$02
#_09BF77: STA.w $0FB5
#_09BF7A: STZ.w $0FB6

#_09BF7D: DEC.w $0B28,X
#_09BF80: BPL .exit

#_09BF82: LDA.b #$38
#_09BF84: STA.w $0B28,X

#_09BF87: LDA.w $0B30,X
#_09BF8A: BNE .fire_small_ball

;---------------------------------------------------------------------------------------------------

.fire_big_ball
#_09BF8C: LDA.b #$A0
#_09BF8E: STA.w $0B30,X
#_09BF91: STA.w $0FB6

#_09BF94: LDA.b #$08
#_09BF96: STA.b $0E

#_09BF98: BRA .fire_ball

;---------------------------------------------------------------------------------------------------

.fire_small_ball
#_09BF9A: JSL GetRandomNumber
#_09BF9E: AND.b #$02
#_09BFA0: ASL A
#_09BFA1: ASL A
#_09BFA2: ASL A
#_09BFA3: STA.b $0E

;---------------------------------------------------------------------------------------------------

.fire_ball
#_09BFA5: JSR Overlord_SpawnCannonBall

.exit
#_09BFA8: RTS

.inactive
#_09BFA9: LDA.b #$FF
#_09BFAB: STA.w $0B30,X

#_09BFAE: RTS

;===================================================================================================

Overlord_SpawnCannonBall:
#_09BFAF: LDA.b #$50 ; SPRITE 50
#_09BFB1: JSL Sprite_SpawnDynamically
#_09BFB5: BMI .exit

#_09BFB7: PHX

#_09BFB8: LDA.b $05
#_09BFBA: CLC
#_09BFBB: ADC.b $0E
#_09BFBD: STA.w $0D10,Y

#_09BFC0: LDA.b $06
#_09BFC2: ADC.b #$00
#_09BFC4: STA.w $0D30,Y

#_09BFC7: LDA.b $07
#_09BFC9: SEC
#_09BFCA: SBC.b #$01
#_09BFCC: STA.w $0D00,Y

#_09BFCF: LDA.b $08
#_09BFD1: SBC.b #$00
#_09BFD3: STA.w $0D20,Y

#_09BFD6: LDX.w $0FB5

#_09BFD9: LDA.w .speed_x,X
#_09BFDC: STA.w $0D50,Y

#_09BFDF: LDA.w .speed_y,X
#_09BFE2: STA.w $0D40,Y

#_09BFE5: PLX

#_09BFE6: LDA.w $0B40,X
#_09BFE9: STA.w $0F20,Y

#_09BFEC: LDA.w $0FB6
#_09BFEF: BEQ .small_ball

;---------------------------------------------------------------------------------------------------

.big_ball
#_09BFF1: STA.w $0D80,Y

#_09BFF4: LDA.w $0D00,Y
#_09BFF7: CLC
#_09BFF8: ADC.b #$08
#_09BFFA: STA.w $0D00,Y

#_09BFFD: LDA.b #$03
#_09BFFF: STA.w $0E40,Y

#_09C002: LDA.b #$09
#_09C004: STA.w $0F60,Y

;---------------------------------------------------------------------------------------------------

.small_ball
#_09C007: LDA.b #$40
#_09C009: STA.w $0E10,Y

#_09C00C: PHX
#_09C00D: TYX

#_09C00E: LDA.b #$07 ; SFX3.07
#_09C010: JSL SpriteSFX_QueueSFX3WithPan

#_09C014: PLX

.exit
#_09C015: RTS

;---------------------------------------------------------------------------------------------------

.speed_x
#_09C016: db  24, -24,   0,   0

.speed_y
#_09C01A: db   0,   0,  24, -24

;===================================================================================================

Overlord01_PositionTarget:
#_09C01E: TXA
#_09C01F: STA.w $0FDE

#_09C022: RTS

;===================================================================================================

pool Snitch_SpawnGuard

.position_x_low
#_09C023: db $20, $40, $E0

.position_x_high
#_09C026: db $01, $03, $02

.position_y_low
#_09C029: db $00, $B0, $60

.position_y_high
#_09C02C: db $01, $03, $01

pool off

;---------------------------------------------------------------------------------------------------

Snitch_SpawnGuard:
#_09C02F: PHB
#_09C030: PHK
#_09C031: PLB

#_09C032: LDA.b #$45 ; SPRITE 45
#_09C034: LDY.b #$00
#_09C036: JSL Sprite_SpawnDynamically_slot_limited
#_09C03A: BMI .exit

#_09C03C: PHX

#_09C03D: LDA.w $0E20,X

#_09C040: LDX.b #$00
#_09C042: CMP.b #$3D ; SPRITE 3D
#_09C044: BEQ .spawn_him_already_im_scared

#_09C046: INX
#_09C047: CMP.b #$35 ; SPRITE 35
#_09C049: BEQ .spawn_him_already_im_scared

#_09C04B: INX

.spawn_him_already_im_scared
#_09C04C: LDA.w .position_x_low,X
#_09C04F: STA.w $0D10,Y

#_09C052: LDA.w .position_x_high,X
#_09C055: CLC
#_09C056: ADC.w $0FBD
#_09C059: STA.w $0D30,Y

#_09C05C: LDA.w .position_y_low,X
#_09C05F: STA.w $0D00,Y

#_09C062: LDA.w .position_y_high,X
#_09C065: CLC
#_09C066: ADC.w $0FBF
#_09C069: STA.w $0D20,Y

#_09C06C: PLX

;---------------------------------------------------------------------------------------------------

#_09C06D: LDA.b #$00
#_09C06F: STA.w $0F20,Y

#_09C072: LDA.b #$04
#_09C074: STA.w $0E50,Y

#_09C077: LDA.b #$80
#_09C079: STA.w $0CAA,Y

#_09C07C: LDA.b #$90
#_09C07E: STA.w $0BE0,Y

#_09C081: LDA.b #$0B
#_09C083: STA.w $0F50,Y

;---------------------------------------------------------------------------------------------------

.exit
#_09C086: PLB

#_09C087: RTL

;===================================================================================================

pool Overlord_CheckIfActive

.offset_low
#_09C088: db $30, $C0

.offset_high
#_09C08A: db $01, $FF

pool off

;---------------------------------------------------------------------------------------------------

#EXIT_09C08C:
#_09C08C: RTS

;---------------------------------------------------------------------------------------------------

Overlord_CheckIfActive:
#_09C08D: LDA.b $1B
#_09C08F: BNE EXIT_09C08C

#_09C091: LDA.b $1A
#_09C093: AND.b #$01
#_09C095: STA.b $01
#_09C097: STA.b $02

#_09C099: TAY

#_09C09A: LDA.b $E2
#_09C09C: CLC
#_09C09D: ADC.w .offset_low,Y
#_09C0A0: ROL.b $00

#_09C0A2: CMP.w $0B08,X
#_09C0A5: PHP

#_09C0A6: LDA.b $E3
#_09C0A8: LSR.b $00
#_09C0AA: ADC.w .offset_high,Y

#_09C0AD: PLP
#_09C0AE: SBC.w $0B10,X
#_09C0B1: STA.b $00

#_09C0B3: LSR.b $01
#_09C0B5: BCC .positive_x

#_09C0B7: EOR.b #$80
#_09C0B9: STA.b $00

;---------------------------------------------------------------------------------------------------

.positive_x
#_09C0BB: LDA.b $00
#_09C0BD: BMI .negative_x

#_09C0BF: LDA.b $E8
#_09C0C1: CLC
#_09C0C2: ADC.w .offset_low,Y
#_09C0C5: ROL.b $00

#_09C0C7: CMP.w $0B18,X
#_09C0CA: PHP

#_09C0CB: LDA.b $E9
#_09C0CD: LSR.b $00
#_09C0CF: ADC.w .offset_high,Y

#_09C0D2: PLP
#_09C0D3: SBC.w $0B20,X
#_09C0D6: STA.b $00

#_09C0D8: LSR.b $02
#_09C0DA: BCC .negative_y

#_09C0DC: EOR.b #$80
#_09C0DE: STA.b $00

.negative_y
#_09C0E0: LDA.b $00
#_09C0E2: BPL .exit

;---------------------------------------------------------------------------------------------------

.negative_x
#_09C0E4: STZ.w $0B00,X

#_09C0E7: TXA
#_09C0E8: ASL A
#_09C0E9: TAY

#_09C0EA: REP #$20

#_09C0EC: LDA.w $0B48,Y
#_09C0EF: STA.b $00

#_09C0F1: CMP.w #$FFFF
#_09C0F4: PHP

#_09C0F5: LSR A
#_09C0F6: LSR A
#_09C0F7: LSR A
#_09C0F8: CLC
#_09C0F9: ADC.w #$7FEF80
#_09C0FC: STA.b $01

#_09C0FE: PLP
#_09C0FF: SEP #$20
#_09C101: BCS .exit

#_09C103: LDA.b #$7F
#_09C105: STA.b $03

#_09C107: LDA.b $00
#_09C109: AND.b #$07
#_09C10B: TAY

#_09C10C: LDA.b [$01]
#_09C10E: AND.w SpriteDeathMasks,Y
#_09C111: STA.b [$01]

.exit
#_09C113: RTS

;===================================================================================================

Underworld_ResetSprites:
#_09C114: PHB
#_09C115: PHK
#_09C116: PLB

#_09C117: JSR Underworld_CacheTransSprites

#_09C11A: STZ.w $0309
#_09C11D: STZ.w $0308

#_09C120: JSL Sprite_DisableAll

#_09C124: REP #$20

#_09C126: LDA.w #$FFFF
#_09C129: STA.w $0FBA
#_09C12C: STA.w $0FB8

;---------------------------------------------------------------------------------------------------

#_09C12F: LDX.b #$00

#_09C131: LDA.w $048E

.next_overlord
#_09C134: CMP.w $0B80,X
#_09C137: BEQ .finish_up

#_09C139: INX
#_09C13A: INX
#_09C13B: CPX.b #$07
#_09C13D: BCC .next_overlord

;---------------------------------------------------------------------------------------------------

#_09C13F: LDA.w $0B86
#_09C142: STA.b $00

#_09C144: LDA.w $0B84
#_09C147: STA.w $0B86

#_09C14A: LDA.w $0B82
#_09C14D: STA.w $0B84

#_09C150: LDA.w $0B80
#_09C153: STA.w $0B82

#_09C156: LDA.w $048E
#_09C159: STA.w $0B80

#_09C15C: REP #$10

#_09C15E: LDA.b $00
#_09C160: CMP.w #$FFFF
#_09C163: BEQ .finish_up

#_09C165: ASL A
#_09C166: TAX

#_09C167: LDA.w #$0000
#_09C16A: STA.l $7FDF80,X

.finish_up
#_09C16E: SEP #$30

#_09C170: JSR Underworld_LoadSprites

#_09C173: PLB

#_09C174: RTL

;===================================================================================================

#EXIT_09C175:
#_09C175: RTS

;===================================================================================================

Underworld_CacheTransSprites:
#_09C176: LDA.b $1B
#_09C178: BEQ EXIT_09C175

#_09C17A: STA.w $0FFA

#_09C17D: LDX.b #$0F

.next
#_09C17F: STZ.w $1D00,X

#_09C182: LDA.w $0E20,X
#_09C185: STA.w $1D10,X

#_09C188: LDA.w $0D10,X
#_09C18B: STA.w $1D20,X

#_09C18E: LDA.w $0DC0,X
#_09C191: STA.w $1D60,X

#_09C194: LDA.w $0D30,X
#_09C197: STA.w $1D30,X

#_09C19A: LDA.w $0D00,X
#_09C19D: STA.w $1D40,X

#_09C1A0: LDA.w $0D20,X
#_09C1A3: STA.w $1D50,X

#_09C1A6: LDA.w $0F00,X
#_09C1A9: BNE .skip

#_09C1AB: LDA.w $0DD0,X
#_09C1AE: CMP.b #$04
#_09C1B0: BEQ .skip

#_09C1B2: CMP.b #$0A
#_09C1B4: BEQ .skip

;---------------------------------------------------------------------------------------------------

#_09C1B6: STA.w $1D00,X

#_09C1B9: LDA.w $0D90,X
#_09C1BC: STA.w $1D70,X

#_09C1BF: LDA.w $0EB0,X
#_09C1C2: STA.w $1D80,X

#_09C1C5: LDA.w $0F50,X
#_09C1C8: STA.w $1D90,X

#_09C1CB: LDA.w $0B89,X
#_09C1CE: STA.w $1DA0,X

#_09C1D1: LDA.w $0DE0,X
#_09C1D4: STA.w $1DB0,X

#_09C1D7: LDA.w $0E40,X
#_09C1DA: STA.w $1DC0,X

#_09C1DD: LDA.w $0F20,X
#_09C1E0: STA.w $1DD0,X

#_09C1E3: LDA.w $0D80,X
#_09C1E6: STA.w $1DE0,X

#_09C1E9: LDA.w $0E60,X
#_09C1EC: STA.w $1DF0,X

#_09C1EF: LDA.w $0DA0,X
#_09C1F2: STA.l $7FFA5C,X

#_09C1F6: LDA.w $0DB0,X
#_09C1F9: STA.l $7FFA6C,X

#_09C1FD: LDA.w $0E90,X
#_09C200: STA.l $7FFA7C,X

#_09C204: LDA.w $0E80,X
#_09C207: STA.l $7FFA8C,X

#_09C20B: LDA.w $0F70,X
#_09C20E: STA.l $7FFA9C,X

#_09C212: LDA.w $0DF0,X
#_09C215: STA.l $7FFAAC,X

#_09C219: LDA.l $7FF9C2,X
#_09C21D: STA.l $7FFACC,X

#_09C221: LDA.w $0BA0,X
#_09C224: STA.l $7FFADC,X

;---------------------------------------------------------------------------------------------------

.skip
#_09C228: DEX
#_09C229: BMI .exit

#_09C22B: JMP.w .next

.exit
#_09C22E: RTS

;===================================================================================================

Sprite_DisableAll:
#_09C22F: LDX.b #$0F

.next_sprite
#_09C231: LDA.w $0DD0,X
#_09C234: BEQ .skip

#_09C236: LDA.b $1B
#_09C238: BNE .delete

#_09C23A: LDA.w $0E20,X
#_09C23D: CMP.b #$6C ; SPRITE 6C
#_09C23F: BEQ .skip

.delete
#_09C241: STZ.w $0DD0,X

.skip
#_09C244: DEX
#_09C245: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_09C247: LDX.b #$09

.next_ancilla
#_09C249: STZ.w $0C4A,X

#_09C24C: DEX
#_09C24D: BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

#_09C24F: STZ.w $02EC

#_09C252: STZ.w $0B6A
#_09C255: STZ.w $0B9B

#_09C258: STZ.w $0B88
#_09C25B: STZ.w $0B99

#_09C25E: STZ.w $0FB4

#_09C261: STZ.w $0B9E

#_09C264: STZ.w $0CF4

#_09C267: STZ.w $0FF9
#_09C26A: STZ.w $0FF8

#_09C26D: STZ.w $0FFB
#_09C270: STZ.w $0FFC
#_09C273: STZ.w $0FFD

#_09C276: STZ.w $0FC6

#_09C279: STZ.w $03FC

;---------------------------------------------------------------------------------------------------

#_09C27C: LDX.b #$07

.next_overlord
#_09C27E: STZ.w $0B00,X

#_09C281: DEX
#_09C282: BPL .next_overlord

;---------------------------------------------------------------------------------------------------

#_09C284: LDX.b #$1D

.next_garnish
#_09C286: LDA.b #$00
#_09C288: STA.l $7FF800,X

#_09C28C: DEX
#_09C28D: BPL .next_garnish

#_09C28F: RTL

;===================================================================================================

Underworld_LoadSprites:
#_09C290: REP #$30

#_09C292: LDA.w $048E
#_09C295: ASL A
#_09C296: TAY

#_09C297: LDA.w RoomData_SpritePointers,Y
#_09C29A: STA.b $00

#_09C29C: LDA.w $048E
#_09C29F: LSR A
#_09C2A0: LSR A
#_09C2A1: LSR A

#_09C2A2: SEP #$30

#_09C2A4: AND.b #$FE
#_09C2A6: STA.w $0FB1

#_09C2A9: LDA.w $048E
#_09C2AC: AND.b #$0F
#_09C2AE: ASL A
#_09C2AF: STA.w $0FB0

#_09C2B2: LDA.b ($00)
#_09C2B4: STA.w $0FB3

#_09C2B7: LDA.b #$01
#_09C2B9: STA.b $04

#_09C2BB: STZ.b $02
#_09C2BD: STZ.b $03

;---------------------------------------------------------------------------------------------------

.next_sprite
#_09C2BF: LDY.b $04

#_09C2C1: LDA.b ($00),Y
#_09C2C3: CMP.b #$FF
#_09C2C5: BEQ .done

#_09C2C7: JSR Underworld_LoadSingleSprite

#_09C2CA: INC.b $02

#_09C2CC: INC.b $04
#_09C2CE: INC.b $04
#_09C2D0: INC.b $04

#_09C2D2: BRA .next_sprite

.done
#_09C2D4: RTS

;===================================================================================================

SpriteSlotToDeathBit:
#_09C2D5: dw $0001, $0002, $0004, $0008
#_09C2DD: dw $0010, $0020, $0040, $0080
#_09C2E5: dw $0100, $0200, $0400, $0800
#_09C2ED: dw $1000, $2000, $4000, $8000

;---------------------------------------------------------------------------------------------------

Sprite_ManuallySetDeathFlagUW:
#_09C2F5: PHB
#_09C2F6: PHK
#_09C2F7: PLB

#_09C2F8: LDA.b $1B
#_09C2FA: BEQ .exit

#_09C2FC: LDA.w $0CAA,X
#_09C2FF: LSR A
#_09C300: BCS .exit

#_09C302: LDA.w $0BC0,X
#_09C305: BMI .exit

#_09C307: STA.b $02
#_09C309: STZ.b $03

#_09C30B: REP #$30

#_09C30D: PHX

#_09C30E: LDA.w $048E
#_09C311: ASL A
#_09C312: TAX

#_09C313: LDA.b $02
#_09C315: ASL A
#_09C316: TAY

#_09C317: LDA.l $7FDF80,X
#_09C31B: ORA.w SpriteSlotToDeathBit,Y
#_09C31E: STA.l $7FDF80,X

#_09C322: PLX

#_09C323: SEP #$30

.exit
#_09C325: PLB

#_09C326: RTL

;===================================================================================================

Underworld_LoadSingleSprite:
#_09C327: INY
#_09C328: INY

#_09C329: LDA.b ($00),Y
#_09C32B: TAX

#_09C32C: CPX.b #$E4 ; SPRITE E4
#_09C32E: BNE .not_key

#_09C330: DEY
#_09C331: DEY

#_09C332: LDA.b ($00),Y

#_09C334: INY
#_09C335: INY

#_09C336: CMP.b #$FE
#_09C338: BEQ .small_key

#_09C33A: CMP.b #$FD
#_09C33C: BNE .not_overlord_or_bigkey

#_09C33E: JSR .small_key

#_09C341: INC.w $0CBA,X

#_09C344: RTS

;---------------------------------------------------------------------------------------------------

.small_key
#_09C345: DEC.b $02

#_09C347: LDX.b $02

#_09C349: LDA.b #$01
#_09C34B: STA.w $0CBA,X

#_09C34E: RTS

;---------------------------------------------------------------------------------------------------

.not_key
#_09C34F: DEY

#_09C350: LDA.b ($00),Y
#_09C352: INY
#_09C353: CMP.b #$E0
#_09C355: BCC .not_overlord_or_bigkey

#_09C357: JSR Underworld_LoadSingleOverlord

#_09C35A: DEC.b $02

#_09C35C: RTS

;---------------------------------------------------------------------------------------------------

.not_overlord_or_bigkey
#_09C35D: LDA.l SpriteData_Deflection,X
#_09C361: AND.b #$01
#_09C363: BNE .spawn

#_09C365: REP #$30

#_09C367: PHY
#_09C368: PHX

#_09C369: LDA.w $048E
#_09C36C: ASL A
#_09C36D: TAX

#_09C36E: LDA.b $02
#_09C370: ASL A
#_09C371: TAY

#_09C372: LDA.l $7FDF80,X
#_09C376: AND.w SpriteSlotToDeathBit,Y

#_09C379: PLX
#_09C37A: PLY

#_09C37B: CMP.w #$0000

#_09C37E: SEP #$30
#_09C380: BEQ .spawn

#_09C382: RTS

;---------------------------------------------------------------------------------------------------

.spawn
#_09C383: LDX.b $02

#_09C385: DEY
#_09C386: DEY

#_09C387: LDA.b #$08
#_09C389: STA.w $0DD0,X

#_09C38C: LDA.b ($00),Y
#_09C38E: STA.w $0FB5

#_09C391: AND.b #$80
#_09C393: ASL A
#_09C394: ROL A
#_09C395: STA.w $0F20,X

#_09C398: LDA.b ($00),Y
#_09C39A: ASL A
#_09C39B: ASL A
#_09C39C: ASL A
#_09C39D: ASL A
#_09C39E: STA.w $0D00,X

#_09C3A1: LDA.w $0FB1
#_09C3A4: ADC.b #$00
#_09C3A6: STA.w $0D20,X

#_09C3A9: INY

#_09C3AA: LDA.b ($00),Y
#_09C3AC: STA.w $0FB6

#_09C3AF: ASL A
#_09C3B0: ASL A
#_09C3B1: ASL A
#_09C3B2: ASL A
#_09C3B3: STA.w $0D10,X

#_09C3B6: LDA.w $0FB0
#_09C3B9: ADC.b #$00
#_09C3BB: STA.w $0D30,X

#_09C3BE: INY

#_09C3BF: LDA.b ($00),Y
#_09C3C1: STA.w $0E20,X

#_09C3C4: STZ.w $0E30,X

#_09C3C7: LDA.w $0FB5
#_09C3CA: AND.b #$60
#_09C3CC: LSR A
#_09C3CD: LSR A
#_09C3CE: STA.w $0FB5

#_09C3D1: LDA.w $0FB6
#_09C3D4: LSR A
#_09C3D5: LSR A
#_09C3D6: LSR A
#_09C3D7: LSR A
#_09C3D8: LSR A
#_09C3D9: ORA.w $0FB5
#_09C3DC: STA.w $0E30,X

#_09C3DF: LDA.b $02
#_09C3E1: STA.w $0BC0,X

#_09C3E4: STZ.w $0CBA,X

#_09C3E7: RTS

;===================================================================================================

Underworld_LoadSingleOverlord:
#_09C3E8: LDX.b #$07

.next_slot
#_09C3EA: LDA.w $0B00,X
#_09C3ED: BEQ .open_slot

#_09C3EF: DEX
#_09C3F0: BPL .next_slot

#_09C3F2: RTS

;---------------------------------------------------------------------------------------------------

.open_slot
#_09C3F3: LDA.b ($00),Y
#_09C3F5: NOP
#_09C3F6: STA.w $0B00,X

#_09C3F9: DEY
#_09C3FA: DEY

#_09C3FB: LDA.b ($00),Y
#_09C3FD: AND.b #$80
#_09C3FF: ASL A
#_09C400: ROL A
#_09C401: STA.w $0B40,X

#_09C404: LDA.b ($00),Y
#_09C406: ASL A
#_09C407: ASL A
#_09C408: ASL A
#_09C409: ASL A
#_09C40A: STA.w $0B18,X

#_09C40D: LDA.w $0FB1
#_09C410: ADC.b #$00
#_09C412: STA.w $0B20,X

#_09C415: INY

#_09C416: LDA.b ($00),Y
#_09C418: ASL A
#_09C419: ASL A
#_09C41A: ASL A
#_09C41B: ASL A
#_09C41C: STA.w $0B08,X

;---------------------------------------------------------------------------------------------------

#_09C41F: LDA.w $0FB0
#_09C422: ADC.b #$00
#_09C424: STA.w $0B10,X

#_09C427: JSR InitSpawnedOevrlord

#_09C42A: LDA.w $0B00,X
#_09C42D: CMP.b #$0A ; OVERLORD 0A
#_09C42F: BEQ .position_overlord

#_09C431: CMP.b #$0B ; OVERLORD 0B
#_09C433: BEQ .position_overlord

#_09C435: CMP.b #$03 ; OVERLORD 03
#_09C437: BNE .exit

#_09C439: LDA.b #$FF
#_09C43B: STA.w $0B30,X

#_09C43E: LDA.w $0B08,X
#_09C441: SEC
#_09C442: SBC.b #$08
#_09C444: STA.w $0B08,X

.exit
#_09C447: RTS

;---------------------------------------------------------------------------------------------------

.position_overlord
#_09C448: LDA.b #$A0
#_09C44A: STA.w $0B30,X

#_09C44D: RTS

;===================================================================================================

Sprite_ResetAll:
#_09C44E: JSL Sprite_DisableAll

;===================================================================================================

Sprite_ResetBuffers:
#_09C452: STZ.w $0FDD
#_09C455: STZ.w $0FDC
#_09C458: STZ.w $0FFD

#_09C45B: STZ.w $02F0

#_09C45E: STZ.w $0FC6

#_09C461: STZ.w $0B6A

#_09C464: STZ.w $0FB3

#_09C467: LDA.l $7EF3CC
#_09C46B: CMP.b #$0D ; FOLLOWER 0D
#_09C46D: BEQ .not_superbomb

#_09C46F: LDA.b #$FE
#_09C471: STA.w $04B4

.not_superbomb
#_09C474: REP #$10

;---------------------------------------------------------------------------------------------------

#_09C476: LDX.w #$0FFF

#_09C479: LDA.b #$00

.next_room
#_09C47B: STA.l $7FDF80,X

#_09C47F: DEX
#_09C480: BPL .next_room

;---------------------------------------------------------------------------------------------------

#_09C482: LDX.w #$01FF

.next_screen
#_09C485: STA.l $7FEF80,X

#_09C489: DEX
#_09C48A: BPL .next_screen

;---------------------------------------------------------------------------------------------------

#_09C48C: SEP #$10

#_09C48E: LDY.b #$07
#_09C490: LDA.b #$FF

.next_visited_room
#_09C492: STA.w $0B80,Y

#_09C495: DEY
#_09C496: BPL .next_visited_room

#_09C498: RTL

;===================================================================================================

Sprite_ReloadAll_Overworld:
#_09C499: JSL Sprite_DisableAll

;===================================================================================================

Sprite_LoadAll_Overworld:
#_09C49D: JSL Sprite_ResetBuffers

#_09C4A1: PHB
#_09C4A2: PHK
#_09C4A3: PLB

#_09C4A4: JSR Overworld_LoadSprites
#_09C4A7: JSR Sprite_ActivateAllProxima

#_09C4AA: PLB

#_09C4AB: RTL

;===================================================================================================

Overworld_LoadSprites:
#_09C4AC: LDA.w $040A
#_09C4AF: AND.b #$07
#_09C4B1: ASL A

#_09C4B2: STZ.w $0FBC
#_09C4B5: STA.w $0FBD

#_09C4B8: LDA.w $040A
#_09C4BB: AND.b #$3F
#_09C4BD: LSR A
#_09C4BE: LSR A
#_09C4BF: AND.b #$0E
#_09C4C1: STA.w $0FBF
#_09C4C4: STZ.w $0FBE

#_09C4C7: LDA.w $040A
#_09C4CA: TAY

#_09C4CB: LDX.w OverworldScreenSizeForLoading,Y
#_09C4CE: STX.w $0FB9
#_09C4D1: STZ.w $0FB8

#_09C4D4: STX.w $0FBB
#_09C4D7: STZ.w $0FBA

#_09C4DA: REP #$30

#_09C4DC: LDA.w $040A
#_09C4DF: ASL A
#_09C4E0: TAY

#_09C4E1: SEP #$20

#_09C4E3: LDA.l $7EF3C5
#_09C4E7: CMP.b #$03
#_09C4E9: BEQ .aga_dead

#_09C4EB: CMP.b #$02
#_09C4ED: BEQ .zelda_rescued

;---------------------------------------------------------------------------------------------------

#_09C4EF: LDA.w Overworld_SpritePointers_state_0+0,Y
#_09C4F2: STA.b $00

#_09C4F4: LDA.w Overworld_SpritePointers_state_0+1,Y
#_09C4F7: BRA .start_loading

;---------------------------------------------------------------------------------------------------

.aga_dead
#_09C4F9: LDA.w Overworld_SpritePointers_state_2+0,Y
#_09C4FC: STA.b $00

#_09C4FE: LDA.w Overworld_SpritePointers_state_2+1,Y
#_09C501: BRA .start_loading

;---------------------------------------------------------------------------------------------------

.zelda_rescued
#_09C503: LDA.w Overworld_SpritePointers_state_1+0,Y
#_09C506: STA.b $00

#_09C508: LDA.w Overworld_SpritePointers_state_1+1,Y

;---------------------------------------------------------------------------------------------------

.start_loading
#_09C50B: STA.b $01

#_09C50D: LDY.w #$0000

.next_sprite
#_09C510: LDA.b ($00),Y
#_09C512: CMP.b #$FF
#_09C514: BEQ .done_sprites

#_09C516: INY
#_09C517: INY

#_09C518: LDA.b ($00),Y

#_09C51A: DEY
#_09C51B: DEY

#_09C51C: CMP.b #$F4
#_09C51E: BNE .not_boulder_spawner

#_09C520: INC.w $0FFD

#_09C523: INY
#_09C524: INY
#_09C525: INY

#_09C526: BRA .next_sprite

.not_boulder_spawner
#_09C528: LDA.b ($00),Y
#_09C52A: PHA

#_09C52B: LSR A
#_09C52C: LSR A
#_09C52D: LSR A
#_09C52E: LSR A

#_09C52F: ASL A
#_09C530: ASL A

#_09C531: STA.b $02

#_09C533: INY

#_09C534: LDA.b ($00),Y

#_09C536: LSR A
#_09C537: LSR A
#_09C538: LSR A
#_09C539: LSR A

#_09C53A: CLC
#_09C53B: ADC.b $02
#_09C53D: STA.b $06

#_09C53F: PLA

#_09C540: ASL A
#_09C541: ASL A
#_09C542: ASL A
#_09C543: ASL A

#_09C544: STA.b $07

#_09C546: LDA.b ($00),Y
#_09C548: AND.b #$0F
#_09C54A: ORA.b $07
#_09C54C: STA.b $05

#_09C54E: INY

#_09C54F: LDA.b ($00),Y

#_09C551: LDX.b $05

#_09C553: INC A
#_09C554: STA.l $7FDF80,X

#_09C558: INY

#_09C559: BRA .next_sprite

;---------------------------------------------------------------------------------------------------

.done_sprites
#_09C55B: SEP #$10

#_09C55D: RTS

;===================================================================================================

Sprite_ActivateAllProxima:
#_09C55E: LDA.b $E2
#_09C560: PHA

#_09C561: LDA.b $E3
#_09C563: PHA

#_09C564: LDA.w $069F
#_09C567: PHA

#_09C568: LDA.b #$FF
#_09C56A: STA.w $069F

#_09C56D: LDY.b #$15

;---------------------------------------------------------------------------------------------------

.next
#_09C56F: PHY

#_09C570: JSR Sprite_ActivateWhenProximal_Horizontal

#_09C573: PLY

#_09C574: LDA.b $E2
#_09C576: CLC
#_09C577: ADC.b #$10
#_09C579: STA.b $E2

#_09C57B: LDA.b $E3
#_09C57D: ADC.b #$00
#_09C57F: STA.b $E3

#_09C581: DEY
#_09C582: BPL .next

;---------------------------------------------------------------------------------------------------

#_09C584: PLA
#_09C585: STA.w $069F

#_09C588: PLA
#_09C589: STA.b $E3

#_09C58B: PLA
#_09C58C: STA.b $E2

#_09C58E: RTS

;===================================================================================================

Sprite_ProximityActivation:
#_09C58F: PHB
#_09C590: PHK
#_09C591: PLB

#_09C592: LDA.b $11
#_09C594: BEQ .good_submode

#_09C596: JSR Sprite_ActivateWhenProximal_Horizontal
#_09C599: JSR Sprite_ActivateWhenProximal_Vertical

#_09C59C: PLB

#_09C59D: RTL

;---------------------------------------------------------------------------------------------------

.good_submode
#_09C59E: LDA.w $0FB7
#_09C5A1: AND.b #$01
#_09C5A3: BNE .big_screen

#_09C5A5: JSR Sprite_ActivateWhenProximal_Horizontal

.big_screen
#_09C5A8: LDA.w $0FB7
#_09C5AB: AND.b #$01
#_09C5AD: BEQ .not_big

#_09C5AF: JSR Sprite_ActivateWhenProximal_Vertical

.not_big
#_09C5B2: INC.w $0FB7

#_09C5B5: PLB

#_09C5B6: RTL

;===================================================================================================

pool Sprite_ActivateWhenProximal_Horizontal

.offset_low
#_09C5B7: db  16, -16

.offset_high
#_09C5B9: db   1,  -1

pool off

;---------------------------------------------------------------------------------------------------

Sprite_ActivateWhenProximal_Horizontal:
#_09C5BB: LDY.b #$00

#_09C5BD: LDA.w $069F
#_09C5C0: BEQ .exit
#_09C5C2: BPL .good

#_09C5C4: INY

.good
#_09C5C5: LDA.b $E2
#_09C5C7: CLC
#_09C5C8: ADC.w .offset_low,Y
#_09C5CB: STA.b $0E

#_09C5CD: LDA.b $E3
#_09C5CF: ADC.w .offset_high,Y
#_09C5D2: STA.b $0F

#_09C5D4: LDA.b $E8
#_09C5D6: SEC
#_09C5D7: SBC.b #$30
#_09C5D9: STA.b $0C

#_09C5DB: LDA.b $E9
#_09C5DD: SBC.b #$00
#_09C5DF: STA.b $0D

;---------------------------------------------------------------------------------------------------

#_09C5E1: LDX.b #$15

.next
#_09C5E3: JSR Overworld_ProximityMotivatedLoad

#_09C5E6: REP #$20

#_09C5E8: LDA.b $0C
#_09C5EA: CLC
#_09C5EB: ADC.w #$0010
#_09C5EE: STA.b $0C

#_09C5F0: SEP #$20

#_09C5F2: DEX
#_09C5F3: BPL .next

.exit
#_09C5F5: RTS

;===================================================================================================

pool Sprite_ActivateWhenProximal_Vertical

.offset_low
#_09C5F6: db  16, -16

.offset_high
#_09C5F8: db   1,  -1

pool off

;---------------------------------------------------------------------------------------------------

Sprite_ActivateWhenProximal_Vertical:
#_09C5FA: LDY.b #$00

#_09C5FC: LDA.w $069E
#_09C5FF: BEQ .done

#_09C601: BPL .good

#_09C603: INY

.good
#_09C604: LDA.b $E8
#_09C606: CLC
#_09C607: ADC.w .offset_low,Y
#_09C60A: STA.b $0C

#_09C60C: LDA.b $E9
#_09C60E: ADC.w .offset_high,Y
#_09C611: STA.b $0D

#_09C613: LDA.b $E2
#_09C615: SEC
#_09C616: SBC.b #$30
#_09C618: STA.b $0E

#_09C61A: LDA.b $E3
#_09C61C: SBC.b #$00
#_09C61E: STA.b $0F

;---------------------------------------------------------------------------------------------------

#_09C620: LDX.b #$15

.next
#_09C622: JSR Overworld_ProximityMotivatedLoad

#_09C625: REP #$20

#_09C627: LDA.b $0E
#_09C629: CLC
#_09C62A: ADC.w #$0010
#_09C62D: STA.b $0E

#_09C62F: SEP #$20

#_09C631: DEX
#_09C632: BPL .next

.done
#_09C634: RTS

;===================================================================================================

OverworldScreenSizeForLoading:
#_09C635: db $04, $04, $02, $04, $04, $04, $04, $02
#_09C63D: db $04, $04, $04, $04, $04, $04, $04, $04
#_09C645: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C64D: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C655: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C65D: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C665: db $04, $04, $02, $02, $02, $04, $04, $02
#_09C66D: db $04, $04, $02, $02, $02, $04, $04, $02

#_09C675: db $04, $04, $02, $04, $04, $04, $04, $02
#_09C67D: db $04, $04, $04, $04, $04, $04, $04, $04
#_09C685: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C68D: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C695: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C69D: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C6A5: db $04, $04, $02, $02, $02, $04, $04, $02
#_09C6AD: db $04, $04, $02, $02, $02, $04, $04, $02

#_09C6B5: db $04, $04, $02, $04, $04, $04, $04, $02
#_09C6BD: db $04, $04, $04, $04, $04, $04, $04, $04
#_09C6C5: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C6CD: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C6D5: db $04, $04, $02, $04, $04, $02, $04, $04
#_09C6DD: db $02, $02, $02, $02, $02, $02, $02, $02
#_09C6E5: db $04, $04, $02, $02, $02, $04, $04, $02
#_09C6ED: db $04, $04, $02, $02, $02, $04, $04, $02

;===================================================================================================

Overworld_ProximityMotivatedLoad:
#_09C6F5: REP #$20

#_09C6F7: LDA.b $0E
#_09C6F9: SEC
#_09C6FA: SBC.w $0FBC
#_09C6FD: CMP.w $0FB8
#_09C700: BCS .exit

#_09C702: XBA
#_09C703: STA.b $00

#_09C705: LDA.b $0C
#_09C707: SEC
#_09C708: SBC.w $0FBE
#_09C70B: CMP.w $0FBA
#_09C70E: BCS .exit

;---------------------------------------------------------------------------------------------------

#_09C710: SEP #$20

#_09C712: XBA
#_09C713: ASL A
#_09C714: ASL A
#_09C715: ORA.b $00
#_09C717: STA.b $01

#_09C719: LDA.b $0C
#_09C71B: AND.b #$F0
#_09C71D: STA.b $00

#_09C71F: LDA.b $0E
#_09C721: LSR A
#_09C722: LSR A
#_09C723: LSR A
#_09C724: LSR A
#_09C725: ORA.b $00
#_09C727: STA.b $00

#_09C729: PHX

#_09C72A: JSR Overworld_LoadProximaSpriteIfAlive

#_09C72D: PLX

.exit
#_09C72E: SEP #$20

#_09C730: RTS

;===================================================================================================

Overworld_AliveStatusBits:
#_09C731: db $80, $40, $20, $10, $08, $04, $02, $01

;===================================================================================================

Overworld_LoadProximaSpriteIfAlive:
#_09C739: REP #$20

#_09C73B: LDA.b $00
#_09C73D: CLC
#_09C73E: ADC.w #$7FDF80>>0
#_09C741: STA.b $05

#_09C743: SEP #$20

#_09C745: LDA.b #$7FDF80>>16
#_09C747: STA.b $07

#_09C749: LDA.b [$05]
#_09C74B: BEQ .alive

#_09C74D: REP #$20

#_09C74F: LDA.b $00
#_09C751: LSR A
#_09C752: LSR A
#_09C753: LSR A
#_09C754: CLC
#_09C755: ADC.w #$7FEF80>>0
#_09C758: STA.b $02

#_09C75A: SEP #$20

#_09C75C: LDA.b #$7FEF80>>16
#_09C75E: STA.b $04

#_09C760: LDA.b $00
#_09C762: AND.b #$07
#_09C764: TAY

#_09C765: LDA.b [$02]
#_09C767: AND.w Overworld_AliveStatusBits,Y
#_09C76A: BNE .alive

#_09C76C: JSR Overworld_LoadSingleSprite

.alive
#_09C76F: RTS

;===================================================================================================

Overworld_LoadSingleSprite:
#_09C770: LDA.b [$05]
#_09C772: CMP.b #$F4
#_09C774: BCC .load_sprite

#_09C776: JSR Overworld_LoadSingleOverlord

#_09C779: RTS

;---------------------------------------------------------------------------------------------------

.load_sprite
#_09C77A: LDX.b #$04 ; barriers can only spawn in slots 0-4
#_09C77C: CMP.b #$58 ; SPRITE 57 +1
#_09C77E: BEQ .check_slot

#_09C780: LDX.b #$05 ; swamola can only spawn in slots 0-5
#_09C782: CMP.b #$D0 ; SPRITE CF +1
#_09C784: BEQ .check_slot

#_09C786: LDX.b #$0D
#_09C788: CMP.b #$58 ; SPRITE 57 +1
#_09C78A: BEQ .slot14

#_09C78C: CMP.b #$EB ; SPRITE EA +1
#_09C78E: BEQ .slot14

#_09C790: CMP.b #$53 ; SPRITE 52 +1
#_09C792: BEQ .slot14

#_09C794: CMP.b #$F3 ; SPRITE F2 +1
#_09C796: BNE .check_slot

.slot14
#_09C798: LDX.b #$0E

.check_slot
#_09C79A: LDA.w $0DD0,X
#_09C79D: BEQ .free_slot

#_09C79F: LDA.w $0E20,X
#_09C7A2: CMP.b #$41 ; SPRITE 41
#_09C7A4: BNE .not_even_a_probe

#_09C7A6: LDA.w $0DB0,X
#_09C7A9: BNE .free_slot

.not_even_a_probe
#_09C7AB: DEX
#_09C7AC: BPL .check_slot

#_09C7AE: RTS

;---------------------------------------------------------------------------------------------------

.free_slot
#_09C7AF: LDA.b [$02]
#_09C7B1: ORA.w Overworld_AliveStatusBits,Y
#_09C7B4: STA.b [$02]

#_09C7B6: PHX

#_09C7B7: TXA
#_09C7B8: ASL A
#_09C7B9: TAX

#_09C7BA: REP #$20

#_09C7BC: LDA.b $00
#_09C7BE: STA.w $0BC0,X

#_09C7C1: SEP #$20

#_09C7C3: PLX

#_09C7C4: LDA.b [$05]
#_09C7C6: DEC A
#_09C7C7: STA.w $0E20,X

#_09C7CA: LDA.b #$08
#_09C7CC: STA.w $0DD0,X

#_09C7CF: LDA.b $00
#_09C7D1: ASL A
#_09C7D2: ASL A
#_09C7D3: ASL A
#_09C7D4: ASL A
#_09C7D5: STA.w $0D10,X

#_09C7D8: LDA.b $00
#_09C7DA: AND.b #$F0
#_09C7DC: STA.w $0D00,X

#_09C7DF: LDA.b $01
#_09C7E1: AND.b #$03
#_09C7E3: STA.w $0D30,X

#_09C7E6: LDA.b $01
#_09C7E8: LSR A
#_09C7E9: LSR A
#_09C7EA: STA.w $0D20,X

#_09C7ED: LDA.w $0D30,X
#_09C7F0: CLC
#_09C7F1: ADC.w $0FBD
#_09C7F4: STA.w $0D30,X

#_09C7F7: LDA.w $0D20,X
#_09C7FA: CLC
#_09C7FB: ADC.w $0FBF
#_09C7FE: STA.w $0D20,X

#_09C801: STZ.w $0F20,X
#_09C804: STZ.w $0E30,X
#_09C807: STZ.w $0CBA,X

#_09C80A: RTS

;===================================================================================================

Overworld_LoadSingleOverlord:
#_09C80B: LDX.b #$07

.next_check
#_09C80D: LDA.w $0B00,X
#_09C810: BEQ .free_slot

#_09C812: DEX
#_09C813: BPL .next_check

#_09C815: RTS

;---------------------------------------------------------------------------------------------------

.free_slot
#_09C816: LDA.b [$02]
#_09C818: ORA.w Overworld_AliveStatusBits,Y
#_09C81B: STA.b [$02]

#_09C81D: PHX

#_09C81E: TXA
#_09C81F: ASL A
#_09C820: TAX

#_09C821: REP #$20

#_09C823: LDA.b $00
#_09C825: STA.w $0B48,X

#_09C828: SEP #$20

#_09C82A: PLX

#_09C82B: LDA.b [$05]
#_09C82D: SEC
#_09C82E: SBC.b #$F3
#_09C830: STA.w $0B00,X

#_09C833: PHA

#_09C834: LDA.b $00
#_09C836: ASL A
#_09C837: ASL A
#_09C838: ASL A
#_09C839: ASL A

#_09C83A: PLY
#_09C83B: CPY.b #$01
#_09C83D: BNE .no_adjustment

#_09C83F: CLC
#_09C840: ADC.b #$08

.no_adjustment
#_09C842: STA.w $0B08,X

#_09C845: LDA.b $00
#_09C847: AND.b #$F0
#_09C849: STA.w $0B18,X

#_09C84C: LDA.b $01
#_09C84E: AND.b #$03
#_09C850: STA.w $0B10,X

#_09C853: LDA.b $01
#_09C855: LSR A
#_09C856: LSR A
#_09C857: STA.w $0B20,X

#_09C85A: LDA.w $0B10,X
#_09C85D: CLC
#_09C85E: ADC.w $0FBD
#_09C861: STA.w $0B10,X

#_09C864: LDA.w $0B20,X
#_09C867: CLC
#_09C868: ADC.w $0FBF
#_09C86B: STA.w $0B20,X

#_09C86E: STZ.w $0B40,X

;===================================================================================================

InitSpawnedOevrlord:
#_09C871: LDA.w $040A
#_09C874: STA.w $0CCA,X

#_09C877: STZ.w $0B30,X
#_09C87A: STZ.w $0B28,X
#_09C87D: STZ.w $0B38,X

#_09C880: RTS

;===================================================================================================

Overworld_SpritePointers:
.state_0
#_09C881: dw Overworld_Sprites_EMPTY        ; 00 - Lost Woods
#_09C883: dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
#_09C885: dw Overworld_Sprites_EMPTY        ; 02 - Lumberjacks
#_09C887: dw Overworld_Sprites_EMPTY        ; 03 - West Death Mountain
#_09C889: dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
#_09C88B: dw Overworld_Sprites_EMPTY        ; 05 - East Death Mountain
#_09C88D: dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
#_09C88F: dw Overworld_Sprites_EMPTY        ; 07 - Turtle Rock Portalway
#_09C891: dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
#_09C893: dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
#_09C895: dw Overworld_Sprites_EMPTY        ; 0A - Death Mountain Foot
#_09C897: dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
#_09C899: dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
#_09C89B: dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
#_09C89D: dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
#_09C89F: dw Overworld_Sprites_EMPTY        ; 0F - Waterfall of Wishing
#_09C8A1: dw Overworld_Sprites_EMPTY        ; 10 - Lost Woods Alcove
#_09C8A3: dw Overworld_Sprites_EMPTY        ; 11 - North of Kakariko
#_09C8A5: dw Overworld_Sprites_EMPTY        ; 12 - Northwest Pond
#_09C8A7: dw Overworld_Sprites_EMPTY        ; 13 - Sanctuary
#_09C8A9: dw Overworld_Sprites_EMPTY        ; 14 - Graveyard
#_09C8AB: dw Overworld_Sprites_EMPTY        ; 15 - Hylia River Bend
#_09C8AD: dw Overworld_Sprites_EMPTY        ; 16 - Potion Shop
#_09C8AF: dw Overworld_Sprites_EMPTY        ; 17 - Octorok Pit
#_09C8B1: dw Overworld_Sprites_EMPTY        ; 18 - Kakariko Village
#_09C8B3: dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
#_09C8B5: dw Overworld_Sprites_EMPTY        ; 1A - Kakariko Orchard
#_09C8B7: dw Overworld_Sprites_Screen1B_0   ; 1B - Hyrule Castle
#_09C8B9: dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
#_09C8BB: dw Overworld_Sprites_Screen1D_0   ; 1D - Hylia River Peninsula
#_09C8BD: dw Overworld_Sprites_EMPTY        ; 1E - Eastern Ruins
#_09C8BF: dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
#_09C8C1: dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
#_09C8C3: dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
#_09C8C5: dw Overworld_Sprites_EMPTY        ; 22 - Smith's House
#_09C8C7: dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
#_09C8C9: dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
#_09C8CB: dw Overworld_Sprites_EMPTY        ; 25 - Boulder Field
#_09C8CD: dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
#_09C8CF: dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
#_09C8D1: dw Overworld_Sprites_EMPTY        ; 28 - Racing Game
#_09C8D3: dw Overworld_Sprites_EMPTY        ; 29 - South of Kakariko
#_09C8D5: dw Overworld_Sprites_EMPTY        ; 2A - Haunted Grove
#_09C8D7: dw Overworld_Sprites_Screen2B_0   ; 2B - West of Link's House
#_09C8D9: dw Overworld_Sprites_Screen2C_0   ; 2C - Link's House
#_09C8DB: dw Overworld_Sprites_EMPTY        ; 2D - Eastern Bridge
#_09C8DD: dw Overworld_Sprites_EMPTY        ; 2E - Lake Hylia River Bend
#_09C8DF: dw Overworld_Sprites_EMPTY        ; 2F - Eastern Portalway
#_09C8E1: dw Overworld_Sprites_EMPTY        ; 30 - Desert
#_09C8E3: dw Overworld_Sprites_EMPTY        ; 31 - Desert
#_09C8E5: dw Overworld_Sprites_Screen32_0   ; 32 - Haunted Grove Entrance
#_09C8E7: dw Overworld_Sprites_EMPTY        ; 33 - Marshlands Portalway
#_09C8E9: dw Overworld_Sprites_EMPTY        ; 34 - Marshlands Totems
#_09C8EB: dw Overworld_Sprites_EMPTY        ; 35 - Lake Hylia
#_09C8ED: dw Overworld_Sprites_EMPTY        ; 36 - Lake Hylia
#_09C8EF: dw Overworld_Sprites_EMPTY        ; 37 - Lake Hylia River End
#_09C8F1: dw Overworld_Sprites_EMPTY        ; 38 - Desert
#_09C8F3: dw Overworld_Sprites_EMPTY        ; 39 - Desert
#_09C8F5: dw Overworld_Sprites_EMPTY        ; 3A - Desert Pass
#_09C8F7: dw Overworld_Sprites_EMPTY        ; 3B - Marshlands Dam Entrance
#_09C8F9: dw Overworld_Sprites_EMPTY        ; 3C - Marshlands Ravine
#_09C8FB: dw Overworld_Sprites_EMPTY        ; 3D - Lake Hylia
#_09C8FD: dw Overworld_Sprites_EMPTY        ; 3E - Lake Hylia
#_09C8FF: dw Overworld_Sprites_EMPTY        ; 3F - Lake Hylia Waterfall

;---------------------------------------------------------------------------------------------------

.state_1
#_09C901: dw Overworld_Sprites_Screen00_1   ; 00 - Lost Woods
#_09C903: dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
#_09C905: dw Overworld_Sprites_Screen02_1   ; 02 - Lumberjacks
#_09C907: dw Overworld_Sprites_Screen03_1   ; 03 - West Death Mountain
#_09C909: dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
#_09C90B: dw Overworld_Sprites_Screen05_1   ; 05 - East Death Mountain
#_09C90D: dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
#_09C90F: dw Overworld_Sprites_Screen07_1   ; 07 - Turtle Rock Portalway
#_09C911: dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
#_09C913: dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
#_09C915: dw Overworld_Sprites_Screen0A_1   ; 0A - Death Mountain Foot
#_09C917: dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
#_09C919: dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
#_09C91B: dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
#_09C91D: dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
#_09C91F: dw Overworld_Sprites_Screen0F_1   ; 0F - Waterfall of Wishing
#_09C921: dw Overworld_Sprites_Screen10_1   ; 10 - Lost Woods Alcove
#_09C923: dw Overworld_Sprites_Screen11_1   ; 11 - North of Kakariko
#_09C925: dw Overworld_Sprites_Screen12_1   ; 12 - Northwest Pond
#_09C927: dw Overworld_Sprites_Screen13_1   ; 13 - Sanctuary
#_09C929: dw Overworld_Sprites_Screen14_1   ; 14 - Graveyard
#_09C92B: dw Overworld_Sprites_Screen15_1   ; 15 - Hylia River Bend
#_09C92D: dw Overworld_Sprites_Screen16_1   ; 16 - Potion Shop
#_09C92F: dw Overworld_Sprites_Screen17_1   ; 17 - Octorok Pit
#_09C931: dw Overworld_Sprites_Screen18_1   ; 18 - Kakariko Village
#_09C933: dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
#_09C935: dw Overworld_Sprites_Screen1A_1   ; 1A - Kakariko Orchard
#_09C937: dw Overworld_Sprites_Screen1B_1   ; 1B - Hyrule Castle
#_09C939: dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
#_09C93B: dw Overworld_Sprites_Screen1D_1   ; 1D - Hylia River Peninsula
#_09C93D: dw Overworld_Sprites_Screen1E_1   ; 1E - Eastern Ruins
#_09C93F: dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
#_09C941: dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
#_09C943: dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
#_09C945: dw Overworld_Sprites_Screen22_1   ; 22 - Smith's House
#_09C947: dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
#_09C949: dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
#_09C94B: dw Overworld_Sprites_Screen25_1   ; 25 - Boulder Field
#_09C94D: dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
#_09C94F: dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
#_09C951: dw Overworld_Sprites_Screen28_1   ; 28 - Racing Game
#_09C953: dw Overworld_Sprites_EMPTY        ; 29 - South of Kakariko
#_09C955: dw Overworld_Sprites_Screen2A_1   ; 2A - Haunted Grove
#_09C957: dw Overworld_Sprites_Screen2B_1   ; 2B - West of Link's House
#_09C959: dw Overworld_Sprites_Screen2C_1   ; 2C - Link's House
#_09C95B: dw Overworld_Sprites_Screen2D_1   ; 2D - Eastern Bridge
#_09C95D: dw Overworld_Sprites_Screen2E_1   ; 2E - Lake Hylia River Bend
#_09C95F: dw Overworld_Sprites_Screen2F_1   ; 2F - Eastern Portalway
#_09C961: dw Overworld_Sprites_Screen30_1   ; 30 - Desert
#_09C963: dw Overworld_Sprites_EMPTY        ; 31 - Desert
#_09C965: dw Overworld_Sprites_Screen32_1   ; 32 - Haunted Grove Entrance
#_09C967: dw Overworld_Sprites_Screen33_1   ; 33 - Marshlands Portalway
#_09C969: dw Overworld_Sprites_Screen34_1   ; 34 - Marshlands Totems
#_09C96B: dw Overworld_Sprites_Screen35_1   ; 35 - Lake Hylia
#_09C96D: dw Overworld_Sprites_EMPTY        ; 36 - Lake Hylia
#_09C96F: dw Overworld_Sprites_Screen37_1   ; 37 - Lake Hylia River End
#_09C971: dw Overworld_Sprites_EMPTY        ; 38 - Desert
#_09C973: dw Overworld_Sprites_EMPTY        ; 39 - Desert
#_09C975: dw Overworld_Sprites_Screen3A_1   ; 3A - Desert Pass
#_09C977: dw Overworld_Sprites_Screen3B_1   ; 3B - Marshlands Dam Entrance
#_09C979: dw Overworld_Sprites_Screen3C_1   ; 3C - Marshlands Ravine
#_09C97B: dw Overworld_Sprites_EMPTY        ; 3D - Lake Hylia
#_09C97D: dw Overworld_Sprites_EMPTY        ; 3E - Lake Hylia
#_09C97F: dw Overworld_Sprites_Screen3F_1   ; 3F - Lake Hylia Waterfall
#_09C981: dw Overworld_Sprites_Screen40     ; 40 - Skull Woods
#_09C983: dw Overworld_Sprites_Screen42     ; 41 - Skull Woods
#_09C985: dw Overworld_Sprites_Screen42     ; 42 - Dark Lumberjacks
#_09C987: dw Overworld_Sprites_Screen43     ; 43 - West Dark Death Mountain
#_09C989: dw Overworld_Sprites_Screen45     ; 44 - West Dark Death Mountain
#_09C98B: dw Overworld_Sprites_Screen45     ; 45 - East Dark Death Mountain
#_09C98D: dw Overworld_Sprites_EMPTY        ; 46 - East Dark Death Mountain
#_09C98F: dw Overworld_Sprites_Screen47     ; 47 - Turtle Rock
#_09C991: dw Overworld_Sprites_EMPTY        ; 48 - Skull Woods
#_09C993: dw Overworld_Sprites_EMPTY        ; 49 - Skull Woods
#_09C995: dw Overworld_Sprites_Screen4A     ; 4A - Bumper Ledge
#_09C997: dw Overworld_Sprites_EMPTY        ; 4B - West Dark Death Mountain
#_09C999: dw Overworld_Sprites_EMPTY        ; 4C - West Dark Death Mountain
#_09C99B: dw Overworld_Sprites_EMPTY        ; 4D - East Dark Death Mountain
#_09C99D: dw Overworld_Sprites_EMPTY        ; 4E - East Dark Death Mountain
#_09C99F: dw Overworld_Sprites_Screen4F     ; 4F - Lake of Bad Omens
#_09C9A1: dw Overworld_Sprites_Screen50     ; 50 - Skull Woods Alcove
#_09C9A3: dw Overworld_Sprites_Screen51     ; 51 - North of Outcasts
#_09C9A5: dw Overworld_Sprites_Screen52     ; 52 - Dark Northwest Pond
#_09C9A7: dw Overworld_Sprites_Screen53     ; 53 - Dark Sanctuary
#_09C9A9: dw Overworld_Sprites_Screen54     ; 54 - Dark Graveyard
#_09C9AB: dw Overworld_Sprites_Screen55     ; 55 - Dark Hylia River Bend
#_09C9AD: dw Overworld_Sprites_Screen56     ; 56 - Dark Northeast Shop
#_09C9AF: dw Overworld_Sprites_Screen57     ; 57 - Dark Octorok Pit
#_09C9B1: dw Overworld_Sprites_Screen58     ; 58 - Village of Outcasts
#_09C9B3: dw Overworld_Sprites_EMPTY        ; 59 - Village of Outcasts
#_09C9B5: dw Overworld_Sprites_Screen5A     ; 5A - Outcasts Orchard
#_09C9B7: dw Overworld_Sprites_Screen5B     ; 5B - Pyramid of Power
#_09C9B9: dw Overworld_Sprites_EMPTY        ; 5C - Pyramid of Power
#_09C9BB: dw Overworld_Sprites_Screen5D     ; 5D - Dark Hylia River Peninsula
#_09C9BD: dw Overworld_Sprites_Screen5E     ; 5E - Palace of Darkness Maze
#_09C9BF: dw Overworld_Sprites_EMPTY        ; 5F - Palace of Darkness Maze
#_09C9C1: dw Overworld_Sprites_EMPTY        ; 60 - Village of Outcasts
#_09C9C3: dw Overworld_Sprites_EMPTY        ; 61 - Village of Outcasts
#_09C9C5: dw Overworld_Sprites_Screen62     ; 62 - Stake Puzzle
#_09C9C7: dw Overworld_Sprites_EMPTY        ; 63 - Pyramid of Power
#_09C9C9: dw Overworld_Sprites_EMPTY        ; 64 - Pyramid of Power
#_09C9CB: dw Overworld_Sprites_Screen65     ; 65 - Boulder Field
#_09C9CD: dw Overworld_Sprites_EMPTY        ; 66 - Palace of Darkness Maze
#_09C9CF: dw Overworld_Sprites_EMPTY        ; 67 - Palace of Darkness Maze
#_09C9D1: dw Overworld_Sprites_Screen68     ; 68 - Digging Game
#_09C9D3: dw Overworld_Sprites_Screen69     ; 69 - South of Outcasts
#_09C9D5: dw Overworld_Sprites_Screen6A     ; 6A - Stumpy Grove
#_09C9D7: dw Overworld_Sprites_Screen6B     ; 6B - West of Bomb Shoppe
#_09C9D9: dw Overworld_Sprites_Screen6C     ; 6C - Bomb Shoppe
#_09C9DB: dw Overworld_Sprites_Screen6D     ; 6D - Hammer Bridge
#_09C9DD: dw Overworld_Sprites_Screen6E     ; 6E - Dark Lake Hylia River Bend
#_09C9DF: dw Overworld_Sprites_Screen6F     ; 6F - East Dark World Portalway
#_09C9E1: dw Overworld_Sprites_Screen70     ; 70 - Misery Mire
#_09C9E3: dw Overworld_Sprites_Screen72     ; 71 - Misery Mire
#_09C9E5: dw Overworld_Sprites_Screen72     ; 72 - Stumpy Grove Entrance
#_09C9E7: dw Overworld_Sprites_Screen73     ; 73 - Swamplands Portalway
#_09C9E9: dw Overworld_Sprites_Screen74     ; 74 - Swamplands Totems
#_09C9EB: dw Overworld_Sprites_Screen75     ; 75 - Dark Lake Hylia
#_09C9ED: dw Overworld_Sprites_Screen77     ; 76 - Dark Lake Hylia
#_09C9EF: dw Overworld_Sprites_Screen77     ; 77 - Dark Lake Hylia River End
#_09C9F1: dw Overworld_Sprites_EMPTY        ; 78 - Misery Mire
#_09C9F3: dw Overworld_Sprites_EMPTY        ; 79 - Misery Mire
#_09C9F5: dw Overworld_Sprites_Screen7A     ; 7A - West of Swamplands
#_09C9F7: dw Overworld_Sprites_Screen7B     ; 7B - Swamplands Palace Entrance
#_09C9F9: dw Overworld_Sprites_Screen7C     ; 7C - Swamplands Ravine
#_09C9FB: dw Overworld_Sprites_EMPTY        ; 7D - Dark Lake Hylia
#_09C9FD: dw Overworld_Sprites_EMPTY        ; 7E - Dark Lake Hylia
#_09C9FF: dw Overworld_Sprites_Screen7F     ; 7F - Dark Lake Hylia Waterfall
#_09CA01: dw Overworld_Sprites_Screen80     ; 80 - Master Sword Pedestal
#_09CA03: dw Overworld_Sprites_Screen81     ; 81 - Zora's Domain
#_09CA05: dw Overworld_Sprites_EMPTY        ;
#_09CA07: dw Overworld_Sprites_EMPTY        ;
#_09CA09: dw Overworld_Sprites_EMPTY        ;
#_09CA0B: dw Overworld_Sprites_EMPTY        ;
#_09CA0D: dw Overworld_Sprites_EMPTY        ;
#_09CA0F: dw Overworld_Sprites_EMPTY        ;
#_09CA11: dw Overworld_Sprites_EMPTY        ;
#_09CA13: dw Overworld_Sprites_EMPTY        ;
#_09CA15: dw Overworld_Sprites_EMPTY        ;
#_09CA17: dw Overworld_Sprites_EMPTY        ;
#_09CA19: dw Overworld_Sprites_EMPTY        ;
#_09CA1B: dw Overworld_Sprites_EMPTY        ;
#_09CA1D: dw Overworld_Sprites_EMPTY        ;
#_09CA1F: dw Overworld_Sprites_EMPTY        ;

;---------------------------------------------------------------------------------------------------

.state_2
#_09CA21: dw Overworld_Sprites_Screen00_2   ; 00 - Lost Woods
#_09CA23: dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
#_09CA25: dw Overworld_Sprites_Screen02_2   ; 02 - Lumberjacks
#_09CA27: dw Overworld_Sprites_Screen03_2   ; 03 - West Death Mountain
#_09CA29: dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
#_09CA2B: dw Overworld_Sprites_Screen05_2   ; 05 - East Death Mountain
#_09CA2D: dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
#_09CA2F: dw Overworld_Sprites_Screen07_2   ; 07 - Turtle Rock Portalway
#_09CA31: dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
#_09CA33: dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
#_09CA35: dw Overworld_Sprites_Screen0A_2   ; 0A - Death Mountain Foot
#_09CA37: dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
#_09CA39: dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
#_09CA3B: dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
#_09CA3D: dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
#_09CA3F: dw Overworld_Sprites_Screen0F_2   ; 0F - Waterfall of Wishing
#_09CA41: dw Overworld_Sprites_Screen10_2   ; 10 - Lost Woods Alcove
#_09CA43: dw Overworld_Sprites_Screen11_2   ; 11 - North of Kakariko
#_09CA45: dw Overworld_Sprites_Screen12_2   ; 12 - Northwest Pond
#_09CA47: dw Overworld_Sprites_Screen13_2   ; 13 - Sanctuary
#_09CA49: dw Overworld_Sprites_Screen14_2   ; 14 - Graveyard
#_09CA4B: dw Overworld_Sprites_Screen15_2   ; 15 - Hylia River Bend
#_09CA4D: dw Overworld_Sprites_Screen16_2   ; 16 - Potion Shop
#_09CA4F: dw Overworld_Sprites_Screen17_2   ; 17 - Octorok Pit
#_09CA51: dw Overworld_Sprites_Screen18_2   ; 18 - Kakariko Village
#_09CA53: dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
#_09CA55: dw Overworld_Sprites_Screen1A_2   ; 1A - Kakariko Orchard
#_09CA57: dw Overworld_Sprites_Screen1B_2   ; 1B - Hyrule Castle
#_09CA59: dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
#_09CA5B: dw Overworld_Sprites_Screen1D_2   ; 1D - Hylia River Peninsula
#_09CA5D: dw Overworld_Sprites_Screen1E_2   ; 1E - Eastern Ruins
#_09CA5F: dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
#_09CA61: dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
#_09CA63: dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
#_09CA65: dw Overworld_Sprites_Screen22_2   ; 22 - Smith's House
#_09CA67: dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
#_09CA69: dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
#_09CA6B: dw Overworld_Sprites_Screen25_2   ; 25 - Boulder Field
#_09CA6D: dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
#_09CA6F: dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
#_09CA71: dw Overworld_Sprites_Screen28_2   ; 28 - Racing Game
#_09CA73: dw Overworld_Sprites_Screen29_2   ; 29 - South of Kakariko
#_09CA75: dw Overworld_Sprites_Screen2A_2   ; 2A - Haunted Grove
#_09CA77: dw Overworld_Sprites_Screen2B_2   ; 2B - West of Link's House
#_09CA79: dw Overworld_Sprites_Screen2C_2   ; 2C - Link's House
#_09CA7B: dw Overworld_Sprites_Screen2D_2   ; 2D - Eastern Bridge
#_09CA7D: dw Overworld_Sprites_Screen2E_2   ; 2E - Lake Hylia River Bend
#_09CA7F: dw Overworld_Sprites_Screen2F_2   ; 2F - Eastern Portalway
#_09CA81: dw Overworld_Sprites_Screen30_2   ; 30 - Desert
#_09CA83: dw Overworld_Sprites_EMPTY        ; 31 - Desert
#_09CA85: dw Overworld_Sprites_Screen32_2   ; 32 - Haunted Grove Entrance
#_09CA87: dw Overworld_Sprites_Screen33_2   ; 33 - Marshlands Portalway
#_09CA89: dw Overworld_Sprites_Screen34_2   ; 34 - Marshlands Totems
#_09CA8B: dw Overworld_Sprites_Screen35_2   ; 35 - Lake Hylia
#_09CA8D: dw Overworld_Sprites_Screen37_2   ; 36 - Lake Hylia
#_09CA8F: dw Overworld_Sprites_Screen37_2   ; 37 - Lake Hylia River End
#_09CA91: dw Overworld_Sprites_Screen3A_2   ; 38 - Desert
#_09CA93: dw Overworld_Sprites_Screen3A_2   ; 39 - Desert
#_09CA95: dw Overworld_Sprites_Screen3A_2   ; 3A - Desert Pass
#_09CA97: dw Overworld_Sprites_Screen3B_2   ; 3B - Marshlands Dam Entrance
#_09CA99: dw Overworld_Sprites_Screen3C_2   ; 3C - Marshlands Ravine
#_09CA9B: dw Overworld_Sprites_Screen3F_2   ; 3D - Lake Hylia
#_09CA9D: dw Overworld_Sprites_Screen3F_2   ; 3E - Lake Hylia
#_09CA9F: dw Overworld_Sprites_Screen3F_2   ; 3F - Lake Hylia Waterfall
#_09CAA1: dw Overworld_Sprites_Screen40     ; 40 - Skull Woods
#_09CAA3: dw Overworld_Sprites_Screen42     ; 41 - Skull Woods
#_09CAA5: dw Overworld_Sprites_Screen42     ; 42 - Dark Lumberjacks
#_09CAA7: dw Overworld_Sprites_Screen43     ; 43 - West Dark Death Mountain
#_09CAA9: dw Overworld_Sprites_Screen45     ; 44 - West Dark Death Mountain
#_09CAAB: dw Overworld_Sprites_Screen45     ; 45 - East Dark Death Mountain
#_09CAAD: dw Overworld_Sprites_EMPTY        ; 46 - East Dark Death Mountain
#_09CAAF: dw Overworld_Sprites_Screen47     ; 47 - Turtle Rock
#_09CAB1: dw Overworld_Sprites_EMPTY        ; 48 - Skull Woods
#_09CAB3: dw Overworld_Sprites_EMPTY        ; 49 - Skull Woods
#_09CAB5: dw Overworld_Sprites_Screen4A     ; 4A - Bumper Ledge
#_09CAB7: dw Overworld_Sprites_EMPTY        ; 4B - West Dark Death Mountain
#_09CAB9: dw Overworld_Sprites_EMPTY        ; 4C - West Dark Death Mountain
#_09CABB: dw Overworld_Sprites_EMPTY        ; 4D - East Dark Death Mountain
#_09CABD: dw Overworld_Sprites_EMPTY        ; 4E - East Dark Death Mountain
#_09CABF: dw Overworld_Sprites_Screen4F     ; 4F - Lake of Bad Omens
#_09CAC1: dw Overworld_Sprites_Screen50     ; 50 - Skull Woods Alcove
#_09CAC3: dw Overworld_Sprites_Screen51     ; 51 - North of Outcasts
#_09CAC5: dw Overworld_Sprites_Screen52     ; 52 - Dark Northwest Pond
#_09CAC7: dw Overworld_Sprites_Screen53     ; 53 - Dark Sanctuary
#_09CAC9: dw Overworld_Sprites_Screen54     ; 54 - Dark Graveyard
#_09CACB: dw Overworld_Sprites_Screen55     ; 55 - Dark Hylia River Bend
#_09CACD: dw Overworld_Sprites_Screen56     ; 56 - Dark Northeast Shop
#_09CACF: dw Overworld_Sprites_Screen57     ; 57 - Dark Octorok Pit
#_09CAD1: dw Overworld_Sprites_Screen58     ; 58 - Village of Outcasts
#_09CAD3: dw Overworld_Sprites_EMPTY        ; 59 - Village of Outcasts
#_09CAD5: dw Overworld_Sprites_Screen5A     ; 5A - Outcasts Orchard
#_09CAD7: dw Overworld_Sprites_Screen5B     ; 5B - Pyramid of Power
#_09CAD9: dw Overworld_Sprites_EMPTY        ; 5C - Pyramid of Power
#_09CADB: dw Overworld_Sprites_Screen5D     ; 5D - Dark Hylia River Peninsula
#_09CADD: dw Overworld_Sprites_Screen5E     ; 5E - Palace of Darkness Maze
#_09CADF: dw Overworld_Sprites_EMPTY        ; 5F - Palace of Darkness Maze
#_09CAE1: dw Overworld_Sprites_EMPTY        ; 60 - Village of Outcasts
#_09CAE3: dw Overworld_Sprites_EMPTY        ; 61 - Village of Outcasts
#_09CAE5: dw Overworld_Sprites_Screen62     ; 62 - Stake Puzzle
#_09CAE7: dw Overworld_Sprites_EMPTY        ; 63 - Pyramid of Power
#_09CAE9: dw Overworld_Sprites_EMPTY        ; 64 - Pyramid of Power
#_09CAEB: dw Overworld_Sprites_Screen65     ; 65 - Boulder Field
#_09CAED: dw Overworld_Sprites_EMPTY        ; 66 - Palace of Darkness Maze
#_09CAEF: dw Overworld_Sprites_EMPTY        ; 67 - Palace of Darkness Maze
#_09CAF1: dw Overworld_Sprites_Screen68     ; 68 - Digging Game
#_09CAF3: dw Overworld_Sprites_Screen69     ; 69 - South of Outcasts
#_09CAF5: dw Overworld_Sprites_Screen6A     ; 6A - Stumpy Grove
#_09CAF7: dw Overworld_Sprites_Screen6B     ; 6B - West of Bomb Shoppe
#_09CAF9: dw Overworld_Sprites_Screen6C     ; 6C - Bomb Shoppe
#_09CAFB: dw Overworld_Sprites_Screen6D     ; 6D - Hammer Bridge
#_09CAFD: dw Overworld_Sprites_Screen6E     ; 6E - Dark Lake Hylia River Bend
#_09CAFF: dw Overworld_Sprites_Screen6F     ; 6F - East Dark World Portalway
#_09CB01: dw Overworld_Sprites_Screen70     ; 70 - Misery Mire
#_09CB03: dw Overworld_Sprites_Screen72     ; 71 - Misery Mire
#_09CB05: dw Overworld_Sprites_Screen72     ; 72 - Stumpy Grove Entrance
#_09CB07: dw Overworld_Sprites_Screen73     ; 73 - Swamplands Portalway
#_09CB09: dw Overworld_Sprites_Screen74     ; 74 - Swamplands Totems
#_09CB0B: dw Overworld_Sprites_Screen75     ; 75 - Dark Lake Hylia
#_09CB0D: dw Overworld_Sprites_Screen77     ; 76 - Dark Lake Hylia
#_09CB0F: dw Overworld_Sprites_Screen77     ; 77 - Dark Lake Hylia River End
#_09CB11: dw Overworld_Sprites_EMPTY        ; 78 - Misery Mire
#_09CB13: dw Overworld_Sprites_EMPTY        ; 79 - Misery Mire
#_09CB15: dw Overworld_Sprites_Screen7A     ; 7A - West of Swamplands
#_09CB17: dw Overworld_Sprites_Screen7B     ; 7B - Swamplands Palace Entrance
#_09CB19: dw Overworld_Sprites_Screen7C     ; 7C - Swamplands Ravine
#_09CB1B: dw Overworld_Sprites_EMPTY        ; 7D - Dark Lake Hylia
#_09CB1D: dw Overworld_Sprites_EMPTY        ; 7E - Dark Lake Hylia
#_09CB1F: dw Overworld_Sprites_Screen7F     ; 7F - Dark Lake Hylia Waterfall
#_09CB21: dw Overworld_Sprites_Screen80     ; 80 - Master Sword Pedestal
#_09CB23: dw Overworld_Sprites_Screen81     ; 81 - Zora's Domain
#_09CB25: dw Overworld_Sprites_EMPTY        ;
#_09CB27: dw Overworld_Sprites_EMPTY        ;
#_09CB29: dw Overworld_Sprites_EMPTY        ;
#_09CB2B: dw Overworld_Sprites_EMPTY        ;
#_09CB2D: dw Overworld_Sprites_EMPTY        ;
#_09CB2F: dw Overworld_Sprites_EMPTY        ;
#_09CB31: dw Overworld_Sprites_EMPTY        ;
#_09CB33: dw Overworld_Sprites_EMPTY        ;
#_09CB35: dw Overworld_Sprites_EMPTY        ;
#_09CB37: dw Overworld_Sprites_EMPTY        ;
#_09CB39: dw Overworld_Sprites_EMPTY        ;
#_09CB3B: dw Overworld_Sprites_EMPTY        ;
#_09CB3D: dw Overworld_Sprites_EMPTY        ;
#_09CB3F: dw Overworld_Sprites_EMPTY        ;

;===================================================================================================

Overworld_Sprites_EMPTY:
#_09CB41: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_0:
#_09CB42: db $06, $1F, $40 ; SPRITE 40   | xy: { 0x1F0, 0x060 }
#_09CB45: db $12, $01, $3F ; SPRITE 3F   | xy: { 0x010, 0x120 }
#_09CB48: db $14, $01, $3F ; SPRITE 3F   | xy: { 0x010, 0x140 }
#_09CB4B: db $13, $1F, $42 ; SPRITE 42   | xy: { 0x1F0, 0x130 }
#_09CB4E: db $1A, $1F, $4B ; SPRITE 4B   | xy: { 0x1F0, 0x1A0 }
#_09CB51: db $1A, $20, $4B ; SPRITE 4B   | xy: { 0x200, 0x1A0 }
#_09CB54: db $25, $2D, $3F ; SPRITE 3F   | xy: { 0x2D0, 0x250 }
#_09CB57: db $29, $20, $3F ; SPRITE 3F   | xy: { 0x200, 0x290 }
#_09CB5A: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_0:
#_09CB5B: db $06, $0B, $AC ; SPRITE AC   | xy: { 0x0B0, 0x060 }
#_09CB5E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_0:
#_09CB5F: db $1E, $09, $3F ; SPRITE 3F   | xy: { 0x090, 0x1E0 }
#_09CB62: db $1E, $0B, $3F ; SPRITE 3F   | xy: { 0x0B0, 0x1E0 }
#_09CB65: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_0:
#_09CB66: db $18, $1E, $3F ; SPRITE 3F   | xy: { 0x1E0, 0x180 }
#_09CB69: db $1A, $1E, $3F ; SPRITE 3F   | xy: { 0x1E0, 0x1A0 }
#_09CB6C: db $1E, $0D, $3F ; SPRITE 3F   | xy: { 0x0D0, 0x1E0 }
#_09CB6F: db $1E, $0F, $3F ; SPRITE 3F   | xy: { 0x0F0, 0x1E0 }
#_09CB72: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_0:
#_09CB73: db $09, $1A, $DC ; SPRITE DC   | xy: { 0x1A0, 0x090 }
#_09CB76: db $12, $18, $D8 ; SPRITE D8   | xy: { 0x180, 0x120 }
#_09CB79: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen40:
#_09CB7A: db $07, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x070 }
#_09CB7D: db $11, $12, $22 ; SPRITE 22   | xy: { 0x120, 0x110 }
#_09CB80: db $1E, $0A, $22 ; SPRITE 22   | xy: { 0x0A0, 0x1E0 }
#_09CB83: db $09, $2F, $22 ; SPRITE 22   | xy: { 0x2F0, 0x090 }
#_09CB86: db $0A, $31, $0E ; SPRITE 0E   | xy: { 0x310, 0x0A0 }
#_09CB89: db $0B, $33, $22 ; SPRITE 22   | xy: { 0x330, 0x0B0 }
#_09CB8C: db $14, $29, $22 ; SPRITE 22   | xy: { 0x290, 0x140 }
#_09CB8F: db $16, $23, $22 ; SPRITE 22   | xy: { 0x230, 0x160 }
#_09CB92: db $17, $39, $AA ; SPRITE AA   | xy: { 0x390, 0x170 }
#_09CB95: db $21, $0A, $22 ; SPRITE 22   | xy: { 0x0A0, 0x210 }
#_09CB98: db $25, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x250 }
#_09CB9B: db $28, $0B, $AA ; SPRITE AA   | xy: { 0x0B0, 0x280 }
#_09CB9E: db $30, $1E, $22 ; SPRITE 22   | xy: { 0x1E0, 0x300 }
#_09CBA1: db $38, $0E, $22 ; SPRITE 22   | xy: { 0x0E0, 0x380 }
#_09CBA4: db $38, $11, $22 ; SPRITE 22   | xy: { 0x110, 0x380 }
#_09CBA7: db $39, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x390 }
#_09CBAA: db $21, $2D, $22 ; SPRITE 22   | xy: { 0x2D0, 0x210 }
#_09CBAD: db $28, $32, $22 ; SPRITE 22   | xy: { 0x320, 0x280 }
#_09CBB0: db $32, $37, $22 ; SPRITE 22   | xy: { 0x370, 0x320 }
#_09CBB3: db $37, $28, $AA ; SPRITE AA   | xy: { 0x280, 0x370 }
#_09CBB6: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen42:
#_09CBB7: db $11, $0C, $0E ; SPRITE 0E   | xy: { 0x0C0, 0x110 }
#_09CBBA: db $13, $0C, $0E ; SPRITE 0E   | xy: { 0x0C0, 0x130 }
#_09CBBD: db $16, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x160 }
#_09CBC0: db $19, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x190 }
#_09CBC3: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen43:
#_09CBC4: db $0C, $2F, $37 ; SPRITE 37   | xy: { 0x2F0, 0x0C0 }
#_09CBC7: db $18, $20, $B9 ; SPRITE B9   | xy: { 0x200, 0x180 }
#_09CBCA: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen45:
#_09CBCB: db $0C, $06, $D0 ; SPRITE D0   | xy: { 0x060, 0x0C0 }
#_09CBCE: db $0E, $1D, $D0 ; SPRITE D0   | xy: { 0x1D0, 0x0E0 }
#_09CBD1: db $0B, $20, $D0 ; SPRITE D0   | xy: { 0x200, 0x0B0 }
#_09CBD4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen47:
#_09CBD5: db $14, $16, $33 ; SPRITE 33   | xy: { 0x160, 0x140 }
#_09CBD8: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen4A:
#_09CBD9: db $06, $0E, $33 ; SPRITE 33   | xy: { 0x0E0, 0x060 }
#_09CBDC: db $08, $18, $EB ; SPRITE EB   | xy: { 0x180, 0x080 }
#_09CBDF: db $0F, $0B, $12 ; SPRITE 12   | xy: { 0x0B0, 0x0F0 }
#_09CBE2: db $10, $08, $12 ; SPRITE 12   | xy: { 0x080, 0x100 }
#_09CBE5: db $13, $16, $12 ; SPRITE 12   | xy: { 0x160, 0x130 }
#_09CBE8: db $13, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x130 }
#_09CBEB: db $14, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x140 }
#_09CBEE: db $18, $0E, $22 ; SPRITE 22   | xy: { 0x0E0, 0x180 }
#_09CBF1: db $1A, $14, $D3 ; SPRITE D3   | xy: { 0x140, 0x1A0 }
#_09CBF4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen4F:
#_09CBF5: db $08, $19, $55 ; SPRITE 55   | xy: { 0x190, 0x080 }
#_09CBF8: db $0B, $04, $C0 ; SPRITE C0   | xy: { 0x040, 0x0B0 }
#_09CBFB: db $0D, $18, $D3 ; SPRITE D3   | xy: { 0x180, 0x0D0 }
#_09CBFE: db $11, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x110 }
#_09CC01: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen50:
#_09CC02: db $0B, $16, $19 ; SPRITE 19   | xy: { 0x160, 0x0B0 }
#_09CC05: db $0C, $05, $12 ; SPRITE 12   | xy: { 0x050, 0x0C0 }
#_09CC08: db $0E, $08, $25 ; SPRITE 25   | xy: { 0x080, 0x0E0 }
#_09CC0B: db $13, $19, $0B ; SPRITE 0B   | xy: { 0x190, 0x130 }
#_09CC0E: db $18, $08, $12 ; SPRITE 12   | xy: { 0x080, 0x180 }
#_09CC11: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen51:
#_09CC12: db $0E, $17, $45 ; SPRITE 45   | xy: { 0x170, 0x0E0 }
#_09CC15: db $10, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x100 }
#_09CC18: db $10, $09, $E3 ; SPRITE E3   | xy: { 0x090, 0x100 }
#_09CC1B: db $15, $1C, $D3 ; SPRITE D3   | xy: { 0x1C0, 0x150 }
#_09CC1E: db $16, $14, $12 ; SPRITE 12   | xy: { 0x140, 0x160 }
#_09CC21: db $17, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x170 }
#_09CC24: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen52:
#_09CC25: db $09, $12, $D3 ; SPRITE D3   | xy: { 0x120, 0x090 }
#_09CC28: db $0D, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0D0 }
#_09CC2B: db $10, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x100 }
#_09CC2E: db $17, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x170 }
#_09CC31: db $18, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x180 }
#_09CC34: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen53:
#_09CC35: db $0B, $06, $D3 ; SPRITE D3   | xy: { 0x060, 0x0B0 }
#_09CC38: db $0C, $15, $11 ; SPRITE 11   | xy: { 0x150, 0x0C0 }
#_09CC3B: db $0D, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x0D0 }
#_09CC3E: db $15, $0D, $12 ; SPRITE 12   | xy: { 0x0D0, 0x150 }
#_09CC41: db $18, $16, $0E ; SPRITE 0E   | xy: { 0x160, 0x180 }
#_09CC44: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen54:
#_09CC45: db $0D, $14, $22 ; SPRITE 22   | xy: { 0x140, 0x0D0 }
#_09CC48: db $0B, $05, $DC ; SPRITE DC   | xy: { 0x050, 0x0B0 }
#_09CC4B: db $0B, $19, $DB ; SPRITE DB   | xy: { 0x190, 0x0B0 }
#_09CC4E: db $0F, $07, $22 ; SPRITE 22   | xy: { 0x070, 0x0F0 }
#_09CC51: db $0E, $0F, $E3 ; SPRITE E3   | xy: { 0x0F0, 0x0E0 }
#_09CC54: db $10, $19, $22 ; SPRITE 22   | xy: { 0x190, 0x100 }
#_09CC57: db $14, $0D, $22 ; SPRITE 22   | xy: { 0x0D0, 0x140 }
#_09CC5A: db $19, $11, $11 ; SPRITE 11   | xy: { 0x110, 0x190 }
#_09CC5D: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen55:
#_09CC5E: db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
#_09CC61: db $0E, $16, $11 ; SPRITE 11   | xy: { 0x160, 0x0E0 }
#_09CC64: db $0E, $18, $D3 ; SPRITE D3   | xy: { 0x180, 0x0E0 }
#_09CC67: db $0F, $1B, $DA ; SPRITE DA   | xy: { 0x1B0, 0x0F0 }
#_09CC6A: db $17, $07, $11 ; SPRITE 11   | xy: { 0x070, 0x170 }
#_09CC6D: db $1A, $0A, $79 ; SPRITE 79   | xy: { 0x0A0, 0x1A0 }
#_09CC70: db $1B, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x1B0 }
#_09CC73: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen56:
#_09CC74: db $06, $0A, $55 ; SPRITE 55   | xy: { 0x0A0, 0x060 }
#_09CC77: db $0A, $13, $55 ; SPRITE 55   | xy: { 0x130, 0x0A0 }
#_09CC7A: db $0E, $04, $79 ; SPRITE 79   | xy: { 0x040, 0x0E0 }
#_09CC7D: db $17, $11, $22 ; SPRITE 22   | xy: { 0x110, 0x170 }
#_09CC80: db $1A, $05, $22 ; SPRITE 22   | xy: { 0x050, 0x1A0 }
#_09CC83: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen57:
#_09CC84: db $04, $0C, $55 ; SPRITE 55   | xy: { 0x0C0, 0x040 }
#_09CC87: db $08, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x080 }
#_09CC8A: db $0A, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x0A0 }
#_09CC8D: db $0E, $0E, $08 ; SPRITE 08   | xy: { 0x0E0, 0x0E0 }
#_09CC90: db $10, $0E, $D3 ; SPRITE D3   | xy: { 0x0E0, 0x100 }
#_09CC93: db $1A, $0E, $08 ; SPRITE 08   | xy: { 0x0E0, 0x1A0 }
#_09CC96: db $1B, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x1B0 }
#_09CC99: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen58:
#_09CC9A: db $06, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x060 }
#_09CC9D: db $0C, $18, $25 ; SPRITE 25   | xy: { 0x180, 0x0C0 }
#_09CCA0: db $1C, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x1C0 }
#_09CCA3: db $0A, $35, $12 ; SPRITE 12   | xy: { 0x350, 0x0A0 }
#_09CCA6: db $0C, $2B, $19 ; SPRITE 19   | xy: { 0x2B0, 0x0C0 }
#_09CCA9: db $17, $2E, $C4 ; SPRITE C4   | xy: { 0x2E0, 0x170 }
#_09CCAC: db $1C, $20, $14 ; SPRITE 14   | xy: { 0x200, 0x1C0 }
#_09CCAF: db $25, $18, $19 ; SPRITE 19   | xy: { 0x180, 0x250 }
#_09CCB2: db $27, $0D, $C4 ; SPRITE C4   | xy: { 0x0D0, 0x270 }
#_09CCB5: db $28, $1D, $19 ; SPRITE 19   | xy: { 0x1D0, 0x280 }
#_09CCB8: db $2E, $12, $12 ; SPRITE 12   | xy: { 0x120, 0x2E0 }
#_09CCBB: db $34, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x340 }
#_09CCBE: db $37, $15, $0B ; SPRITE 0B   | xy: { 0x150, 0x370 }
#_09CCC1: db $27, $28, $0B ; SPRITE 0B   | xy: { 0x280, 0x270 }
#_09CCC4: db $2F, $33, $41 ; SPRITE 41   | xy: { 0x330, 0x2F0 }
#_09CCC7: db $34, $2C, $19 ; SPRITE 19   | xy: { 0x2C0, 0x340 }
#_09CCCA: db $35, $37, $25 ; SPRITE 25   | xy: { 0x370, 0x350 }
#_09CCCD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5A:
#_09CCCE: db $08, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x080 }
#_09CCD1: db $08, $12, $25 ; SPRITE 25   | xy: { 0x120, 0x080 }
#_09CCD4: db $0D, $12, $D3 ; SPRITE D3   | xy: { 0x120, 0x0D0 }
#_09CCD7: db $0C, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0C0 }
#_09CCDA: db $0F, $0B, $11 ; SPRITE 11   | xy: { 0x0B0, 0x0F0 }
#_09CCDD: db $19, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x190 }
#_09CCE0: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5B:
#_09CCE1: db $17, $15, $22 ; SPRITE 22   | xy: { 0x150, 0x170 }
#_09CCE4: db $12, $34, $EB ; SPRITE EB   | xy: { 0x340, 0x120 }
#_09CCE7: db $24, $13, $33 ; SPRITE 33   | xy: { 0x130, 0x240 }
#_09CCEA: db $27, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x270 }
#_09CCED: db $2A, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x2A0 }
#_09CCF0: db $2A, $0C, $12 ; SPRITE 12   | xy: { 0x0C0, 0x2A0 }
#_09CCF3: db $2C, $1E, $11 ; SPRITE 11   | xy: { 0x1E0, 0x2C0 }
#_09CCF6: db $25, $34, $0E ; SPRITE 0E   | xy: { 0x340, 0x250 }
#_09CCF9: db $27, $32, $12 ; SPRITE 12   | xy: { 0x320, 0x270 }
#_09CCFC: db $29, $30, $12 ; SPRITE 12   | xy: { 0x300, 0x290 }
#_09CCFF: db $2C, $21, $11 ; SPRITE 11   | xy: { 0x210, 0x2C0 }
#_09CD02: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5D:
#_09CD03: db $08, $0B, $25 ; SPRITE 25   | xy: { 0x0B0, 0x080 }
#_09CD06: db $09, $07, $11 ; SPRITE 11   | xy: { 0x070, 0x090 }
#_09CD09: db $0B, $06, $0E ; SPRITE 0E   | xy: { 0x060, 0x0B0 }
#_09CD0C: db $0B, $18, $12 ; SPRITE 12   | xy: { 0x180, 0x0B0 }
#_09CD0F: db $0E, $17, $D3 ; SPRITE D3   | xy: { 0x170, 0x0E0 }
#_09CD12: db $10, $1A, $12 ; SPRITE 12   | xy: { 0x1A0, 0x100 }
#_09CD15: db $11, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x110 }
#_09CD18: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5E:
#_09CD19: db $04, $0D, $22 ; SPRITE 22   | xy: { 0x0D0, 0x040 }
#_09CD1C: db $11, $03, $22 ; SPRITE 22   | xy: { 0x030, 0x110 }
#_09CD1F: db $11, $15, $B6 ; SPRITE B6   | xy: { 0x150, 0x110 }
#_09CD22: db $1A, $12, $22 ; SPRITE 22   | xy: { 0x120, 0x1A0 }
#_09CD25: db $09, $27, $22 ; SPRITE 22   | xy: { 0x270, 0x090 }
#_09CD28: db $10, $2F, $22 ; SPRITE 22   | xy: { 0x2F0, 0x100 }
#_09CD2B: db $15, $25, $12 ; SPRITE 12   | xy: { 0x250, 0x150 }
#_09CD2E: db $17, $26, $11 ; SPRITE 11   | xy: { 0x260, 0x170 }
#_09CD31: db $18, $35, $22 ; SPRITE 22   | xy: { 0x350, 0x180 }
#_09CD34: db $1E, $2A, $22 ; SPRITE 22   | xy: { 0x2A0, 0x1E0 }
#_09CD37: db $26, $0A, $12 ; SPRITE 12   | xy: { 0x0A0, 0x260 }
#_09CD3A: db $2B, $0C, $12 ; SPRITE 12   | xy: { 0x0C0, 0x2B0 }
#_09CD3D: db $35, $07, $22 ; SPRITE 22   | xy: { 0x070, 0x350 }
#_09CD40: db $37, $16, $11 ; SPRITE 11   | xy: { 0x160, 0x370 }
#_09CD43: db $38, $09, $0E ; SPRITE 0E   | xy: { 0x090, 0x380 }
#_09CD46: db $24, $32, $12 ; SPRITE 12   | xy: { 0x320, 0x240 }
#_09CD49: db $28, $35, $0E ; SPRITE 0E   | xy: { 0x350, 0x280 }
#_09CD4C: db $30, $24, $22 ; SPRITE 22   | xy: { 0x240, 0x300 }
#_09CD4F: db $30, $30, $E3 ; SPRITE E3   | xy: { 0x300, 0x300 }
#_09CD52: db $36, $35, $11 ; SPRITE 11   | xy: { 0x350, 0x360 }
#_09CD55: db $37, $29, $00 ; SPRITE 00   | xy: { 0x290, 0x370 }
#_09CD58: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen62:
#_09CD59: db $05, $0D, $B4 ; SPRITE B4   | xy: { 0x0D0, 0x050 }
#_09CD5C: db $11, $13, $0B ; SPRITE 0B   | xy: { 0x130, 0x110 }
#_09CD5F: db $13, $11, $0B ; SPRITE 0B   | xy: { 0x110, 0x130 }
#_09CD62: db $15, $15, $0B ; SPRITE 0B   | xy: { 0x150, 0x150 }
#_09CD65: db $16, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x160 }
#_09CD68: db $17, $11, $0B ; SPRITE 0B   | xy: { 0x110, 0x170 }
#_09CD6B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen65:
#_09CD6C: db $07, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x070 }
#_09CD6F: db $0A, $0F, $D3 ; SPRITE D3   | xy: { 0x0F0, 0x0A0 }
#_09CD72: db $0C, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x0C0 }
#_09CD75: db $11, $05, $11 ; SPRITE 11   | xy: { 0x050, 0x110 }
#_09CD78: db $16, $0A, $12 ; SPRITE 12   | xy: { 0x0A0, 0x160 }
#_09CD7B: db $16, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x160 }
#_09CD7E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen68:
#_09CD7F: db $11, $0E, $D5 ; SPRITE D5   | xy: { 0x0E0, 0x110 }
#_09CD82: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen69:
#_09CD83: db $09, $06, $1A ; SPRITE 1A   | xy: { 0x060, 0x090 }
#_09CD86: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6A:
#_09CD87: db $0F, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0F0 }
#_09CD8A: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6B:
#_09CD8B: db $08, $16, $25 ; SPRITE 25   | xy: { 0x160, 0x080 }
#_09CD8E: db $09, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x090 }
#_09CD91: db $0F, $17, $25 ; SPRITE 25   | xy: { 0x170, 0x0F0 }
#_09CD94: db $16, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x160 }
#_09CD97: db $19, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x190 }
#_09CD9A: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6C:
#_09CD9B: db $06, $15, $0E ; SPRITE 0E   | xy: { 0x150, 0x060 }
#_09CD9E: db $0A, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0A0 }
#_09CDA1: db $0D, $14, $12 ; SPRITE 12   | xy: { 0x140, 0x0D0 }
#_09CDA4: db $16, $14, $11 ; SPRITE 11   | xy: { 0x140, 0x160 }
#_09CDA7: db $19, $09, $22 ; SPRITE 22   | xy: { 0x090, 0x190 }
#_09CDAA: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6D:
#_09CDAB: db $05, $0F, $22 ; SPRITE 22   | xy: { 0x0F0, 0x050 }
#_09CDAE: db $07, $0D, $11 ; SPRITE 11   | xy: { 0x0D0, 0x070 }
#_09CDB1: db $08, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x080 }
#_09CDB4: db $0A, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0A0 }
#_09CDB7: db $1A, $10, $D3 ; SPRITE D3   | xy: { 0x100, 0x1A0 }
#_09CDBA: db $1B, $13, $D3 ; SPRITE D3   | xy: { 0x130, 0x1B0 }
#_09CDBD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6E:
#_09CDBE: db $08, $0C, $DA ; SPRITE DA   | xy: { 0x0C0, 0x080 }
#_09CDC1: db $09, $10, $79 ; SPRITE 79   | xy: { 0x100, 0x090 }
#_09CDC4: db $0A, $14, $AC ; SPRITE AC   | xy: { 0x140, 0x0A0 }
#_09CDC7: db $0B, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x0B0 }
#_09CDCA: db $0E, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0E0 }
#_09CDCD: db $18, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x180 }
#_09CDD0: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6F:
#_09CDD1: db $08, $0D, $0E ; SPRITE 0E   | xy: { 0x0D0, 0x080 }
#_09CDD4: db $08, $0F, $0E ; SPRITE 0E   | xy: { 0x0F0, 0x080 }
#_09CDD7: db $0B, $0E, $0E ; SPRITE 0E   | xy: { 0x0E0, 0x0B0 }
#_09CDDA: db $0C, $17, $00 ; SPRITE 00   | xy: { 0x170, 0x0C0 }
#_09CDDD: db $17, $09, $D3 ; SPRITE D3   | xy: { 0x090, 0x170 }
#_09CDE0: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen70:
#_09CDE1: db $1B, $21, $00 ; SPRITE 00   | xy: { 0x210, 0x1B0 }
#_09CDE4: db $1C, $2B, $55 ; SPRITE 55   | xy: { 0x2B0, 0x1C0 }
#_09CDE7: db $21, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x210 }
#_09CDEA: db $24, $1B, $CF ; SPRITE CF   | xy: { 0x1B0, 0x240 }
#_09CDED: db $27, $10, $CF ; SPRITE CF   | xy: { 0x100, 0x270 }
#_09CDF0: db $28, $07, $00 ; SPRITE 00   | xy: { 0x070, 0x280 }
#_09CDF3: db $2B, $16, $55 ; SPRITE 55   | xy: { 0x160, 0x2B0 }
#_09CDF6: db $2E, $1E, $55 ; SPRITE 55   | xy: { 0x1E0, 0x2E0 }
#_09CDF9: db $33, $17, $CF ; SPRITE CF   | xy: { 0x170, 0x330 }
#_09CDFC: db $38, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x380 }
#_09CDFF: db $2B, $23, $55 ; SPRITE 55   | xy: { 0x230, 0x2B0 }
#_09CE02: db $2C, $27, $CF ; SPRITE CF   | xy: { 0x270, 0x2C0 }
#_09CE05: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen72:
#_09CE06: db $0B, $1B, $25 ; SPRITE 25   | xy: { 0x1B0, 0x0B0 }
#_09CE09: db $0D, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0D0 }
#_09CE0C: db $0E, $13, $41 ; SPRITE 41   | xy: { 0x130, 0x0E0 }
#_09CE0F: db $14, $1A, $25 ; SPRITE 25   | xy: { 0x1A0, 0x140 }
#_09CE12: db $17, $0B, $22 ; SPRITE 22   | xy: { 0x0B0, 0x170 }
#_09CE15: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen73:
#_09CE16: db $0C, $17, $AA ; SPRITE AA   | xy: { 0x170, 0x0C0 }
#_09CE19: db $0D, $09, $12 ; SPRITE 12   | xy: { 0x090, 0x0D0 }
#_09CE1C: db $0E, $14, $A8 ; SPRITE A8   | xy: { 0x140, 0x0E0 }
#_09CE1F: db $1A, $15, $A8 ; SPRITE A8   | xy: { 0x150, 0x1A0 }
#_09CE22: db $1B, $1B, $A9 ; SPRITE A9   | xy: { 0x1B0, 0x1B0 }
#_09CE25: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen74:
#_09CE26: db $0D, $0B, $12 ; SPRITE 12   | xy: { 0x0B0, 0x0D0 }
#_09CE29: db $0E, $17, $33 ; SPRITE 33   | xy: { 0x170, 0x0E0 }
#_09CE2C: db $11, $10, $A8 ; SPRITE A8   | xy: { 0x100, 0x110 }
#_09CE2F: db $11, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x110 }
#_09CE32: db $12, $0A, $AA ; SPRITE AA   | xy: { 0x0A0, 0x120 }
#_09CE35: db $14, $0E, $AC ; SPRITE AC   | xy: { 0x0E0, 0x140 }
#_09CE38: db $17, $11, $12 ; SPRITE 12   | xy: { 0x110, 0x170 }
#_09CE3B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen75:
#_09CE3C: db $05, $0A, $D3 ; SPRITE D3   | xy: { 0x0A0, 0x050 }
#_09CE3F: db $07, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x070 }
#_09CE42: db $09, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x090 }
#_09CE45: db $13, $07, $08 ; SPRITE 08   | xy: { 0x070, 0x130 }
#_09CE48: db $16, $18, $A8 ; SPRITE A8   | xy: { 0x180, 0x160 }
#_09CE4B: db $17, $09, $AA ; SPRITE AA   | xy: { 0x090, 0x170 }
#_09CE4E: db $0C, $30, $55 ; SPRITE 55   | xy: { 0x300, 0x0C0 }
#_09CE51: db $11, $29, $A9 ; SPRITE A9   | xy: { 0x290, 0x110 }
#_09CE54: db $15, $36, $A8 ; SPRITE A8   | xy: { 0x360, 0x150 }
#_09CE57: db $1F, $31, $AA ; SPRITE AA   | xy: { 0x310, 0x1F0 }
#_09CE5A: db $22, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x220 }
#_09CE5D: db $28, $14, $A8 ; SPRITE A8   | xy: { 0x140, 0x280 }
#_09CE60: db $2E, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x2E0 }
#_09CE63: db $32, $19, $A8 ; SPRITE A8   | xy: { 0x190, 0x320 }
#_09CE66: db $35, $0A, $A9 ; SPRITE A9   | xy: { 0x0A0, 0x350 }
#_09CE69: db $39, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x390 }
#_09CE6C: db $39, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x390 }
#_09CE6F: db $26, $2A, $AA ; SPRITE AA   | xy: { 0x2A0, 0x260 }
#_09CE72: db $28, $32, $A8 ; SPRITE A8   | xy: { 0x320, 0x280 }
#_09CE75: db $2C, $2A, $55 ; SPRITE 55   | xy: { 0x2A0, 0x2C0 }
#_09CE78: db $35, $32, $55 ; SPRITE 55   | xy: { 0x320, 0x350 }
#_09CE7B: db $39, $37, $08 ; SPRITE 08   | xy: { 0x370, 0x390 }
#_09CE7E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen77:
#_09CE7F: db $08, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x080 }
#_09CE82: db $0A, $09, $D3 ; SPRITE D3   | xy: { 0x090, 0x0A0 }
#_09CE85: db $0B, $0D, $A9 ; SPRITE A9   | xy: { 0x0D0, 0x0B0 }
#_09CE88: db $11, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x110 }
#_09CE8B: db $12, $07, $55 ; SPRITE 55   | xy: { 0x070, 0x120 }
#_09CE8E: db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
#_09CE91: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7A:
#_09CE92: db $07, $06, $11 ; SPRITE 11   | xy: { 0x060, 0x070 }
#_09CE95: db $09, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x090 }
#_09CE98: db $0B, $14, $22 ; SPRITE 22   | xy: { 0x140, 0x0B0 }
#_09CE9B: db $0B, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x0B0 }
#_09CE9E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7B:
#_09CE9F: db $06, $12, $A9 ; SPRITE A9   | xy: { 0x120, 0x060 }
#_09CEA2: db $0A, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x0A0 }
#_09CEA5: db $0F, $0D, $12 ; SPRITE 12   | xy: { 0x0D0, 0x0F0 }
#_09CEA8: db $10, $0A, $D3 ; SPRITE D3   | xy: { 0x0A0, 0x100 }
#_09CEAB: db $14, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x140 }
#_09CEAE: db $18, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x180 }
#_09CEB1: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7C:
#_09CEB2: db $05, $03, $D3 ; SPRITE D3   | xy: { 0x030, 0x050 }
#_09CEB5: db $06, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x060 }
#_09CEB8: db $06, $0F, $33 ; SPRITE 33   | xy: { 0x0F0, 0x060 }
#_09CEBB: db $11, $11, $11 ; SPRITE 11   | xy: { 0x110, 0x110 }
#_09CEBE: db $15, $18, $22 ; SPRITE 22   | xy: { 0x180, 0x150 }
#_09CEC1: db $19, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x190 }
#_09CEC4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7F:
#_09CEC5: db $06, $10, $A8 ; SPRITE A8   | xy: { 0x100, 0x060 }
#_09CEC8: db $06, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x060 }
#_09CECB: db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
#_09CECE: db $0E, $07, $55 ; SPRITE 55   | xy: { 0x070, 0x0E0 }
#_09CED1: db $13, $0D, $A8 ; SPRITE A8   | xy: { 0x0D0, 0x130 }
#_09CED4: db $14, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x140 }
#_09CED7: db $17, $0F, $08 ; SPRITE 08   | xy: { 0x0F0, 0x170 }
#_09CEDA: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen80:
#_09CEDB: db $08, $07, $62 ; SPRITE 62   | xy: { 0x070, 0x080 }
#_09CEDE: db $0A, $07, $B3 ; SPRITE B3   | xy: { 0x070, 0x0A0 }
#_09CEE1: db $14, $0F, $5A ; SPRITE 5A   | xy: { 0x0F0, 0x140 }
#_09CEE4: db $16, $00, $59 ; SPRITE 59   | xy: { 0x000, 0x160 }
#_09CEE7: db $18, $02, $5A ; SPRITE 5A   | xy: { 0x020, 0x180 }
#_09CEEA: db $1A, $0E, $59 ; SPRITE 59   | xy: { 0x0E0, 0x1A0 }
#_09CEED: db $1B, $0F, $5A ; SPRITE 5A   | xy: { 0x0F0, 0x1B0 }
#_09CEF0: db $04, $16, $2B ; SPRITE 2B   | xy: { 0x160, 0x040 }
#_09CEF3: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen81:
#_09CEF4: db $26, $1B, $EB ; SPRITE EB   | xy: { 0x1B0, 0x260 }
#_09CEF7: db $06, $0A, $56 ; SPRITE 56   | xy: { 0x0A0, 0x060 }
#_09CEFA: db $06, $1C, $56 ; SPRITE 56   | xy: { 0x1C0, 0x060 }
#_09CEFD: db $07, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x070 }
#_09CF00: db $0A, $16, $56 ; SPRITE 56   | xy: { 0x160, 0x0A0 }
#_09CF03: db $0A, $1A, $55 ; SPRITE 55   | xy: { 0x1A0, 0x0A0 }
#_09CF06: db $0C, $09, $55 ; SPRITE 55   | xy: { 0x090, 0x0C0 }
#_09CF09: db $0D, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x0D0 }
#_09CF0C: db $12, $1A, $56 ; SPRITE 56   | xy: { 0x1A0, 0x120 }
#_09CF0F: db $13, $07, $56 ; SPRITE 56   | xy: { 0x070, 0x130 }
#_09CF12: db $13, $14, $56 ; SPRITE 56   | xy: { 0x140, 0x130 }
#_09CF15: db $18, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x180 }
#_09CF18: db $1C, $04, $56 ; SPRITE 56   | xy: { 0x040, 0x1C0 }
#_09CF1B: db $04, $3B, $52 ; SPRITE 52   | xy: { 0x3B0, 0x040 }
#_09CF1E: db $08, $27, $55 ; SPRITE 55   | xy: { 0x270, 0x080 }
#_09CF21: db $08, $2D, $55 ; SPRITE 55   | xy: { 0x2D0, 0x080 }
#_09CF24: db $0E, $22, $56 ; SPRITE 56   | xy: { 0x220, 0x0E0 }
#_09CF27: db $0E, $2D, $55 ; SPRITE 55   | xy: { 0x2D0, 0x0E0 }
#_09CF2A: db $14, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x140 }
#_09CF2D: db $20, $0D, $56 ; SPRITE 56   | xy: { 0x0D0, 0x200 }
#_09CF30: db $31, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x310 }
#_09CF33: db $31, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x310 }
#_09CF36: db $33, $0C, $56 ; SPRITE 56   | xy: { 0x0C0, 0x330 }
#_09CF39: db $35, $0E, $55 ; SPRITE 55   | xy: { 0x0E0, 0x350 }
#_09CF3C: db $38, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x380 }
#_09CF3F: db $28, $3B, $56 ; SPRITE 56   | xy: { 0x3B0, 0x280 }
#_09CF42: db $2B, $3A, $56 ; SPRITE 56   | xy: { 0x3A0, 0x2B0 }
#_09CF45: db $35, $2D, $56 ; SPRITE 56   | xy: { 0x2D0, 0x350 }
#_09CF48: db $36, $37, $56 ; SPRITE 56   | xy: { 0x370, 0x360 }
#_09CF4B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen00_1:
#_09CF4C: db $12, $07, $E8 ; SPRITE E8   | xy: { 0x070, 0x120 }
#_09CF4F: db $0B, $12, $00 ; SPRITE 00   | xy: { 0x120, 0x0B0 }
#_09CF52: db $15, $1E, $E7 ; SPRITE E7   | xy: { 0x1E0, 0x150 }
#_09CF55: db $06, $28, $E8 ; SPRITE E8   | xy: { 0x280, 0x060 }
#_09CF58: db $0A, $31, $0D ; SPRITE 0D   | xy: { 0x310, 0x0A0 }
#_09CF5B: db $0A, $2D, $00 ; SPRITE 00   | xy: { 0x2D0, 0x0A0 }
#_09CF5E: db $10, $2A, $17 ; SPRITE 17   | xy: { 0x2A0, 0x100 }
#_09CF61: db $15, $39, $E8 ; SPRITE E8   | xy: { 0x390, 0x150 }
#_09CF64: db $22, $0E, $C4 ; SPRITE C4   | xy: { 0x0E0, 0x220 }
#_09CF67: db $2D, $1E, $17 ; SPRITE 17   | xy: { 0x1E0, 0x2D0 }
#_09CF6A: db $25, $29, $79 ; SPRITE 79   | xy: { 0x290, 0x250 }
#_09CF6D: db $27, $2A, $33 ; SPRITE 33   | xy: { 0x2A0, 0x270 }
#_09CF70: db $2D, $36, $00 ; SPRITE 00   | xy: { 0x360, 0x2D0 }
#_09CF73: db $35, $25, $E8 ; SPRITE E8   | xy: { 0x250, 0x350 }
#_09CF76: db $35, $29, $C4 ; SPRITE C4   | xy: { 0x290, 0x350 }
#_09CF79: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen02_1:
#_09CF7A: db $13, $04, $0D ; SPRITE 0D   | xy: { 0x040, 0x130 }
#_09CF7D: db $13, $0C, $2C ; SPRITE 2C   | xy: { 0x0C0, 0x130 }
#_09CF80: db $1A, $0D, $17 ; SPRITE 17   | xy: { 0x0D0, 0x1A0 }
#_09CF83: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen03_1:
#_09CF84: db $00, $00, $F4 ; OVERLORD 02 | xy: { 0x000, 0x000 }
#_09CF87: db $04, $0B, $F2 ; SPRITE F2   | xy: { 0x0B0, 0x040 }
#_09CF8A: db $0C, $27, $27 ; SPRITE 27   | xy: { 0x270, 0x0C0 }
#_09CF8D: db $16, $22, $EB ; SPRITE EB   | xy: { 0x220, 0x160 }
#_09CF90: db $35, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x350 }
#_09CF93: db $36, $06, $27 ; SPRITE 27   | xy: { 0x060, 0x360 }
#_09CF96: db $3B, $0D, $27 ; SPRITE 27   | xy: { 0x0D0, 0x3B0 }
#_09CF99: db $3B, $12, $F3 ; OVERLORD 01 | xy: { 0x120, 0x3B0 }
#_09CF9C: db $2D, $2C, $27 ; SPRITE 27   | xy: { 0x2C0, 0x2D0 }
#_09CF9F: db $33, $34, $27 ; SPRITE 27   | xy: { 0x340, 0x330 }
#_09CFA2: db $34, $2F, $27 ; SPRITE 27   | xy: { 0x2F0, 0x340 }
#_09CFA5: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen05_1:
#_09CFA6: db $0E, $1E, $27 ; SPRITE 27   | xy: { 0x1E0, 0x0E0 }
#_09CFA9: db $0F, $1F, $C9 ; SPRITE C9   | xy: { 0x1F0, 0x0F0 }
#_09CFAC: db $03, $2F, $EB ; SPRITE EB   | xy: { 0x2F0, 0x030 }
#_09CFAF: db $0D, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0D0 }
#_09CFB2: db $0F, $29, $C9 ; SPRITE C9   | xy: { 0x290, 0x0F0 }
#_09CFB5: db $0F, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0F0 }
#_09CFB8: db $10, $34, $E3 ; SPRITE E3   | xy: { 0x340, 0x100 }
#_09CFBB: db $31, $1E, $C9 ; SPRITE C9   | xy: { 0x1E0, 0x310 }
#_09CFBE: db $2A, $35, $C9 ; SPRITE C9   | xy: { 0x350, 0x2A0 }
#_09CFC1: db $2F, $2A, $27 ; SPRITE 27   | xy: { 0x2A0, 0x2F0 }
#_09CFC4: db $2F, $2F, $C9 ; SPRITE C9   | xy: { 0x2F0, 0x2F0 }
#_09CFC7: db $36, $29, $27 ; SPRITE 27   | xy: { 0x290, 0x360 }
#_09CFCA: db $36, $36, $27 ; SPRITE 27   | xy: { 0x360, 0x360 }
#_09CFCD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen07_1:
#_09CFCE: db $07, $0E, $27 ; SPRITE 27   | xy: { 0x0E0, 0x070 }
#_09CFD1: db $0D, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x0D0 }
#_09CFD4: db $15, $17, $27 ; SPRITE 27   | xy: { 0x170, 0x150 }
#_09CFD7: db $16, $0F, $27 ; SPRITE 27   | xy: { 0x0F0, 0x160 }
#_09CFDA: db $16, $12, $27 ; SPRITE 27   | xy: { 0x120, 0x160 }
#_09CFDD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0A_1:
#_09CFDE: db $04, $0E, $79 ; SPRITE 79   | xy: { 0x0E0, 0x040 }
#_09CFE1: db $06, $0E, $33 ; SPRITE 33   | xy: { 0x0E0, 0x060 }
#_09CFE4: db $09, $05, $00 ; SPRITE 00   | xy: { 0x050, 0x090 }
#_09CFE7: db $0D, $10, $0D ; SPRITE 0D   | xy: { 0x100, 0x0D0 }
#_09CFEA: db $0E, $0B, $0D ; SPRITE 0D   | xy: { 0x0B0, 0x0E0 }
#_09CFED: db $16, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x160 }
#_09CFF0: db $16, $0E, $17 ; SPRITE 17   | xy: { 0x0E0, 0x160 }
#_09CFF3: db $16, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x160 }
#_09CFF6: db $17, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x170 }
#_09CFF9: db $1A, $19, $AC ; SPRITE AC   | xy: { 0x190, 0x1A0 }
#_09CFFC: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0F_1:
#_09CFFD: db $02, $06, $37 ; SPRITE 37   | xy: { 0x060, 0x020 }
#_09D000: db $0D, $0D, $58 ; SPRITE 58   | xy: { 0x0D0, 0x0D0 }
#_09D003: db $10, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x100 }
#_09D006: db $12, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x120 }
#_09D009: db $13, $08, $BA ; SPRITE BA   | xy: { 0x080, 0x130 }
#_09D00C: db $15, $1C, $00 ; SPRITE 00   | xy: { 0x1C0, 0x150 }
#_09D00F: db $17, $0E, $0A ; SPRITE 0A   | xy: { 0x0E0, 0x170 }
#_09D012: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen10_1:
#_09D013: db $0C, $05, $42 ; SPRITE 42   | xy: { 0x050, 0x0C0 }
#_09D016: db $0C, $07, $AC ; SPRITE AC   | xy: { 0x070, 0x0C0 }
#_09D019: db $0F, $17, $E0 ; SPRITE E0   | xy: { 0x170, 0x0F0 }
#_09D01C: db $18, $08, $42 ; SPRITE 42   | xy: { 0x080, 0x180 }
#_09D01F: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen11_1:
#_09D020: db $0C, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x0C0 }
#_09D023: db $0D, $1A, $42 ; SPRITE 42   | xy: { 0x1A0, 0x0D0 }
#_09D026: db $10, $08, $DC ; SPRITE DC   | xy: { 0x080, 0x100 }
#_09D029: db $17, $08, $0B ; SPRITE 0B   | xy: { 0x080, 0x170 }
#_09D02C: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen12_1:
#_09D02D: db $0E, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x0E0 }
#_09D030: db $10, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x100 }
#_09D033: db $10, $0F, $BA ; SPRITE BA   | xy: { 0x0F0, 0x100 }
#_09D036: db $15, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x150 }
#_09D039: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen13_1:
#_09D03A: db $09, $18, $AC ; SPRITE AC   | xy: { 0x180, 0x090 }
#_09D03D: db $17, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x170 }
#_09D040: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen14_1:
#_09D041: db $11, $15, $48 ; SPRITE 48   | xy: { 0x150, 0x110 }
#_09D044: db $19, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x190 }
#_09D047: db $0C, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x0C0 }
#_09D04A: db $11, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x110 }
#_09D04D: db $0E, $12, $C5 ; SPRITE C5   | xy: { 0x120, 0x0E0 }
#_09D050: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen15_1:
#_09D051: db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
#_09D054: db $0E, $16, $41 ; SPRITE 41   | xy: { 0x160, 0x0E0 }
#_09D057: db $0F, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x0F0 }
#_09D05A: db $17, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x170 }
#_09D05D: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen16_1:
#_09D05E: db $0A, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0A0 }
#_09D061: db $15, $0F, $36 ; SPRITE 36   | xy: { 0x0F0, 0x150 }
#_09D064: db $18, $06, $0D ; SPRITE 0D   | xy: { 0x060, 0x180 }
#_09D067: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen17_1:
#_09D068: db $08, $18, $0D ; SPRITE 0D   | xy: { 0x180, 0x080 }
#_09D06B: db $0A, $17, $0D ; SPRITE 0D   | xy: { 0x170, 0x0A0 }
#_09D06E: db $0B, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0B0 }
#_09D071: db $0C, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x0C0 }
#_09D074: db $16, $08, $0D ; SPRITE 0D   | xy: { 0x080, 0x160 }
#_09D077: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen18_1:
#_09D078: db $0A, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x0A0 }
#_09D07B: db $17, $0C, $F3 ; OVERLORD 01 | xy: { 0x0C0, 0x170 }
#_09D07E: db $16, $18, $75 ; SPRITE 75   | xy: { 0x180, 0x160 }
#_09D081: db $1C, $0E, $3D ; SPRITE 3D   | xy: { 0x0E0, 0x1C0 }
#_09D084: db $18, $20, $1D ; SPRITE 1D   | xy: { 0x200, 0x180 }
#_09D087: db $1B, $34, $F3 ; OVERLORD 01 | xy: { 0x340, 0x1B0 }
#_09D08A: db $2E, $1D, $74 ; SPRITE 74   | xy: { 0x1D0, 0x2E0 }
#_09D08D: db $2C, $19, $2A ; SPRITE 2A   | xy: { 0x190, 0x2C0 }
#_09D090: db $31, $18, $3C ; SPRITE 3C   | xy: { 0x180, 0x310 }
#_09D093: db $35, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x350 }
#_09D096: db $36, $18, $0B ; SPRITE 0B   | xy: { 0x180, 0x360 }
#_09D099: db $20, $33, $34 ; SPRITE 34   | xy: { 0x330, 0x200 }
#_09D09C: db $33, $36, $DA ; SPRITE DA   | xy: { 0x360, 0x330 }
#_09D09F: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1A_1:
#_09D0A0: db $0C, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x0C0 }
#_09D0A3: db $0E, $0C, $42 ; SPRITE 42   | xy: { 0x0C0, 0x0E0 }
#_09D0A6: db $11, $0D, $E3 ; SPRITE E3   | xy: { 0x0D0, 0x110 }
#_09D0A9: db $17, $17, $DA ; SPRITE DA   | xy: { 0x170, 0x170 }
#_09D0AC: db $18, $0A, $D8 ; SPRITE D8   | xy: { 0x0A0, 0x180 }
#_09D0AF: db $18, $0F, $43 ; SPRITE 43   | xy: { 0x0F0, 0x180 }
#_09D0B2: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_1:
#_09D0B3: db $06, $1F, $40 ; SPRITE 40   | xy: { 0x1F0, 0x060 }
#_09D0B6: db $11, $09, $49 ; SPRITE 49   | xy: { 0x090, 0x110 }
#_09D0B9: db $13, $0A, $49 ; SPRITE 49   | xy: { 0x0A0, 0x130 }
#_09D0BC: db $14, $16, $AC ; SPRITE AC   | xy: { 0x160, 0x140 }
#_09D0BF: db $19, $0E, $4A ; SPRITE 4A   | xy: { 0x0E0, 0x190 }
#_09D0C2: db $1A, $1F, $41 ; SPRITE 41   | xy: { 0x1F0, 0x1A0 }
#_09D0C5: db $17, $29, $33 ; SPRITE 33   | xy: { 0x290, 0x170 }
#_09D0C8: db $19, $31, $4A ; SPRITE 4A   | xy: { 0x310, 0x190 }
#_09D0CB: db $1A, $20, $41 ; SPRITE 41   | xy: { 0x200, 0x1A0 }
#_09D0CE: db $25, $0E, $4A ; SPRITE 4A   | xy: { 0x0E0, 0x250 }
#_09D0D1: db $2D, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x2D0 }
#_09D0D4: db $2D, $26, $48 ; SPRITE 48   | xy: { 0x260, 0x2D0 }
#_09D0D7: db $32, $21, $48 ; SPRITE 48   | xy: { 0x210, 0x320 }
#_09D0DA: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_1:
#_09D0DB: db $06, $0B, $AC ; SPRITE AC   | xy: { 0x0B0, 0x060 }
#_09D0DE: db $0C, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0C0 }
#_09D0E1: db $0D, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x0D0 }
#_09D0E4: db $0F, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0F0 }
#_09D0E7: db $12, $07, $58 ; SPRITE 58   | xy: { 0x070, 0x120 }
#_09D0EA: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1E_1:
#_09D0EB: db $08, $13, $51 ; SPRITE 51   | xy: { 0x130, 0x080 }
#_09D0EE: db $0E, $0E, $51 ; SPRITE 51   | xy: { 0x0E0, 0x0E0 }
#_09D0F1: db $1A, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x1A0 }
#_09D0F4: db $1A, $19, $51 ; SPRITE 51   | xy: { 0x190, 0x1A0 }
#_09D0F7: db $09, $33, $51 ; SPRITE 51   | xy: { 0x330, 0x090 }
#_09D0FA: db $09, $37, $51 ; SPRITE 51   | xy: { 0x370, 0x090 }
#_09D0FD: db $10, $31, $41 ; SPRITE 41   | xy: { 0x310, 0x100 }
#_09D100: db $17, $2F, $51 ; SPRITE 51   | xy: { 0x2F0, 0x170 }
#_09D103: db $1D, $35, $0A ; SPRITE 0A   | xy: { 0x350, 0x1D0 }
#_09D106: db $25, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x250 }
#_09D109: db $28, $09, $08 ; SPRITE 08   | xy: { 0x090, 0x280 }
#_09D10C: db $2C, $15, $08 ; SPRITE 08   | xy: { 0x150, 0x2C0 }
#_09D10F: db $33, $14, $51 ; SPRITE 51   | xy: { 0x140, 0x330 }
#_09D112: db $33, $17, $51 ; SPRITE 51   | xy: { 0x170, 0x330 }
#_09D115: db $36, $09, $08 ; SPRITE 08   | xy: { 0x090, 0x360 }
#_09D118: db $25, $24, $51 ; SPRITE 51   | xy: { 0x240, 0x250 }
#_09D11B: db $29, $28, $51 ; SPRITE 51   | xy: { 0x280, 0x290 }
#_09D11E: db $29, $3D, $51 ; SPRITE 51   | xy: { 0x3D0, 0x290 }
#_09D121: db $3B, $2E, $08 ; SPRITE 08   | xy: { 0x2E0, 0x3B0 }
#_09D124: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen22_1:
#_09D125: db $04, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x040 }
#_09D128: db $12, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x120 }
#_09D12B: db $14, $12, $0B ; SPRITE 0B   | xy: { 0x120, 0x140 }
#_09D12E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen25_1:
#_09D12F: db $08, $0F, $08 ; SPRITE 08   | xy: { 0x0F0, 0x080 }
#_09D132: db $0C, $05, $08 ; SPRITE 08   | xy: { 0x050, 0x0C0 }
#_09D135: db $0C, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0C0 }
#_09D138: db $0D, $10, $08 ; SPRITE 08   | xy: { 0x100, 0x0D0 }
#_09D13B: db $11, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x110 }
#_09D13E: db $16, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x160 }
#_09D141: db $17, $08, $08 ; SPRITE 08   | xy: { 0x080, 0x170 }
#_09D144: db $17, $10, $08 ; SPRITE 08   | xy: { 0x100, 0x170 }
#_09D147: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen28_1:
#_09D148: db $13, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x130 }
#_09D14B: db $12, $08, $30 ; SPRITE 30   | xy: { 0x080, 0x120 }
#_09D14E: db $18, $19, $2F ; SPRITE 2F   | xy: { 0x190, 0x180 }
#_09D151: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2A_1:
#_09D152: db $09, $09, $1D ; SPRITE 1D   | xy: { 0x090, 0x090 }
#_09D155: db $0C, $0E, $9E ; SPRITE 9E   | xy: { 0x0E0, 0x0C0 }
#_09D158: db $0E, $0D, $A0 ; SPRITE A0   | xy: { 0x0D0, 0x0E0 }
#_09D15B: db $0E, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0E0 }
#_09D15E: db $0E, $11, $A0 ; SPRITE A0   | xy: { 0x110, 0x0E0 }
#_09D161: db $0F, $0C, $9F ; SPRITE 9F   | xy: { 0x0C0, 0x0F0 }
#_09D164: db $10, $11, $9F ; SPRITE 9F   | xy: { 0x110, 0x100 }
#_09D167: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_1:
#_09D168: db $0D, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x0D0 }
#_09D16B: db $11, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x110 }
#_09D16E: db $15, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x150 }
#_09D171: db $17, $10, $42 ; SPRITE 42   | xy: { 0x100, 0x170 }
#_09D174: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_1:
#_09D175: db $14, $18, $42 ; SPRITE 42   | xy: { 0x180, 0x140 }
#_09D178: db $19, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x190 }
#_09D17B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2D_1:
#_09D17C: db $0B, $13, $42 ; SPRITE 42   | xy: { 0x130, 0x0B0 }
#_09D17F: db $10, $10, $46 ; SPRITE 46   | xy: { 0x100, 0x100 }
#_09D182: db $16, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x160 }
#_09D185: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2E_1:
#_09D186: db $0C, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x0C0 }
#_09D189: db $0E, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0E0 }
#_09D18C: db $12, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x120 }
#_09D18F: db $17, $19, $08 ; SPRITE 08   | xy: { 0x190, 0x170 }
#_09D192: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2F_1:
#_09D193: db $0C, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x0C0 }
#_09D196: db $17, $07, $51 ; SPRITE 51   | xy: { 0x070, 0x170 }
#_09D199: db $17, $0C, $51 ; SPRITE 51   | xy: { 0x0C0, 0x170 }
#_09D19C: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen30_1:
#_09D19D: db $14, $12, $57 ; SPRITE 57   | xy: { 0x120, 0x140 }
#_09D1A0: db $19, $12, $B3 ; SPRITE B3   | xy: { 0x120, 0x190 }
#_09D1A3: db $1C, $0E, $57 ; SPRITE 57   | xy: { 0x0E0, 0x1C0 }
#_09D1A6: db $1C, $16, $57 ; SPRITE 57   | xy: { 0x160, 0x1C0 }
#_09D1A9: db $19, $27, $4C ; SPRITE 4C   | xy: { 0x270, 0x190 }
#_09D1AC: db $1C, $22, $01 ; SPRITE 01   | xy: { 0x220, 0x1C0 }
#_09D1AF: db $1F, $2A, $4C ; SPRITE 4C   | xy: { 0x2A0, 0x1F0 }
#_09D1B2: db $26, $1D, $4C ; SPRITE 4C   | xy: { 0x1D0, 0x260 }
#_09D1B5: db $29, $07, $01 ; SPRITE 01   | xy: { 0x070, 0x290 }
#_09D1B8: db $29, $0F, $4C ; SPRITE 4C   | xy: { 0x0F0, 0x290 }
#_09D1BB: db $2A, $06, $EB ; SPRITE EB   | xy: { 0x060, 0x2A0 }
#_09D1BE: db $2C, $1B, $4C ; SPRITE 4C   | xy: { 0x1B0, 0x2C0 }
#_09D1C1: db $30, $0A, $4C ; SPRITE 4C   | xy: { 0x0A0, 0x300 }
#_09D1C4: db $35, $14, $4C ; SPRITE 4C   | xy: { 0x140, 0x350 }
#_09D1C7: db $2B, $37, $F2 ; SPRITE F2   | xy: { 0x370, 0x2B0 }
#_09D1CA: db $21, $36, $D4 ; SPRITE D4   | xy: { 0x360, 0x210 }
#_09D1CD: db $24, $22, $4C ; SPRITE 4C   | xy: { 0x220, 0x240 }
#_09D1D0: db $25, $29, $D4 ; SPRITE D4   | xy: { 0x290, 0x250 }
#_09D1D3: db $2C, $20, $4C ; SPRITE 4C   | xy: { 0x200, 0x2C0 }
#_09D1D6: db $32, $23, $4C ; SPRITE 4C   | xy: { 0x230, 0x320 }
#_09D1D9: db $32, $30, $D4 ; SPRITE D4   | xy: { 0x300, 0x320 }
#_09D1DC: db $33, $34, $01 ; SPRITE 01   | xy: { 0x340, 0x330 }
#_09D1DF: db $3B, $2D, $D4 ; SPRITE D4   | xy: { 0x2D0, 0x3B0 }
#_09D1E2: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_1:
#_09D1E3: db $09, $1A, $D8 ; SPRITE D8   | xy: { 0x1A0, 0x090 }
#_09D1E6: db $0B, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x0B0 }
#_09D1E9: db $0B, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0B0 }
#_09D1EC: db $12, $19, $E3 ; SPRITE E3   | xy: { 0x190, 0x120 }
#_09D1EF: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen33_1:
#_09D1F0: db $0B, $15, $47 ; SPRITE 47   | xy: { 0x150, 0x0B0 }
#_09D1F3: db $0E, $09, $46 ; SPRITE 46   | xy: { 0x090, 0x0E0 }
#_09D1F6: db $12, $17, $BA ; SPRITE BA   | xy: { 0x170, 0x120 }
#_09D1F9: db $1B, $1A, $08 ; SPRITE 08   | xy: { 0x1A0, 0x1B0 }
#_09D1FC: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen34_1:
#_09D1FD: db $0D, $0B, $46 ; SPRITE 46   | xy: { 0x0B0, 0x0D0 }
#_09D200: db $11, $15, $4D ; SPRITE 4D   | xy: { 0x150, 0x110 }
#_09D203: db $12, $11, $47 ; SPRITE 47   | xy: { 0x110, 0x120 }
#_09D206: db $13, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x130 }
#_09D209: db $13, $0E, $E3 ; SPRITE E3   | xy: { 0x0E0, 0x130 }
#_09D20C: db $17, $15, $47 ; SPRITE 47   | xy: { 0x150, 0x170 }
#_09D20F: db $18, $0C, $46 ; SPRITE 46   | xy: { 0x0C0, 0x180 }
#_09D212: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen35_1:
#_09D213: db $07, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x070 }
#_09D216: db $09, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x090 }
#_09D219: db $0C, $0A, $46 ; SPRITE 46   | xy: { 0x0A0, 0x0C0 }
#_09D21C: db $13, $19, $EB ; SPRITE EB   | xy: { 0x190, 0x130 }
#_09D21F: db $14, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x140 }
#_09D222: db $17, $07, $58 ; SPRITE 58   | xy: { 0x070, 0x170 }
#_09D225: db $17, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x170 }
#_09D228: db $0D, $25, $55 ; SPRITE 55   | xy: { 0x250, 0x0D0 }
#_09D22B: db $1F, $27, $0D ; SPRITE 0D   | xy: { 0x270, 0x1F0 }
#_09D22E: db $1F, $2F, $0D ; SPRITE 0D   | xy: { 0x2F0, 0x1F0 }
#_09D231: db $35, $0A, $08 ; SPRITE 08   | xy: { 0x0A0, 0x350 }
#_09D234: db $35, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x350 }
#_09D237: db $35, $0F, $00 ; SPRITE 00   | xy: { 0x0F0, 0x350 }
#_09D23A: db $39, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x390 }
#_09D23D: db $3A, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x3A0 }
#_09D240: db $3B, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x3B0 }
#_09D243: db $2B, $24, $55 ; SPRITE 55   | xy: { 0x240, 0x2B0 }
#_09D246: db $2B, $29, $BA ; SPRITE BA   | xy: { 0x290, 0x2B0 }
#_09D249: db $31, $39, $55 ; SPRITE 55   | xy: { 0x390, 0x310 }
#_09D24C: db $36, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x360 }
#_09D24F: db $37, $32, $0D ; SPRITE 0D   | xy: { 0x320, 0x370 }
#_09D252: db $39, $34, $0D ; SPRITE 0D   | xy: { 0x340, 0x390 }
#_09D255: db $3A, $2E, $58 ; SPRITE 58   | xy: { 0x2E0, 0x3A0 }
#_09D258: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen37_1:
#_09D259: db $08, $08, $58 ; SPRITE 58   | xy: { 0x080, 0x080 }
#_09D25C: db $08, $10, $58 ; SPRITE 58   | xy: { 0x100, 0x080 }
#_09D25F: db $0B, $0F, $58 ; SPRITE 58   | xy: { 0x0F0, 0x0B0 }
#_09D262: db $11, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x110 }
#_09D265: db $15, $0C, $00 ; SPRITE 00   | xy: { 0x0C0, 0x150 }
#_09D268: db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
#_09D26B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3A_1:
#_09D26C: db $05, $17, $39 ; SPRITE 39   | xy: { 0x170, 0x050 }
#_09D26F: db $09, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x090 }
#_09D272: db $0A, $0B, $3E ; SPRITE 3E   | xy: { 0x0B0, 0x0A0 }
#_09D275: db $0E, $18, $3E ; SPRITE 3E   | xy: { 0x180, 0x0E0 }
#_09D278: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3B_1:
#_09D279: db $06, $13, $47 ; SPRITE 47   | xy: { 0x130, 0x060 }
#_09D27C: db $0A, $0C, $46 ; SPRITE 46   | xy: { 0x0C0, 0x0A0 }
#_09D27F: db $0D, $13, $D2 ; SPRITE D2   | xy: { 0x130, 0x0D0 }
#_09D282: db $0B, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x0B0 }
#_09D285: db $0E, $14, $EB ; SPRITE EB   | xy: { 0x140, 0x0E0 }
#_09D288: db $10, $1B, $D2 ; SPRITE D2   | xy: { 0x1B0, 0x100 }
#_09D28B: db $14, $0F, $4D ; SPRITE 4D   | xy: { 0x0F0, 0x140 }
#_09D28E: db $1B, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x1B0 }
#_09D291: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3C_1:
#_09D292: db $0C, $08, $47 ; SPRITE 47   | xy: { 0x080, 0x0C0 }
#_09D295: db $0F, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0F0 }
#_09D298: db $0F, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x0F0 }
#_09D29B: db $11, $09, $17 ; SPRITE 17   | xy: { 0x090, 0x110 }
#_09D29E: db $15, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x150 }
#_09D2A1: db $17, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x170 }
#_09D2A4: db $18, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x180 }
#_09D2A7: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3F_1:
#_09D2A8: db $04, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x040 }
#_09D2AB: db $05, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x050 }
#_09D2AE: db $0B, $08, $55 ; SPRITE 55   | xy: { 0x080, 0x0B0 }
#_09D2B1: db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
#_09D2B4: db $16, $10, $0F ; SPRITE 0F   | xy: { 0x100, 0x160 }
#_09D2B7: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen00_2:
#_09D2B8: db $11, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x110 }
#_09D2BB: db $12, $07, $E8 ; SPRITE E8   | xy: { 0x070, 0x120 }
#_09D2BE: db $15, $1E, $E7 ; SPRITE E7   | xy: { 0x1E0, 0x150 }
#_09D2C1: db $1F, $0D, $C4 ; SPRITE C4   | xy: { 0x0D0, 0x1F0 }
#_09D2C4: db $06, $28, $E8 ; SPRITE E8   | xy: { 0x280, 0x060 }
#_09D2C7: db $08, $2B, $33 ; SPRITE 33   | xy: { 0x2B0, 0x080 }
#_09D2CA: db $08, $33, $41 ; SPRITE 41   | xy: { 0x330, 0x080 }
#_09D2CD: db $0A, $2B, $C4 ; SPRITE C4   | xy: { 0x2B0, 0x0A0 }
#_09D2D0: db $0A, $31, $0D ; SPRITE 0D   | xy: { 0x310, 0x0A0 }
#_09D2D3: db $10, $2A, $17 ; SPRITE 17   | xy: { 0x2A0, 0x100 }
#_09D2D6: db $2C, $0D, $17 ; SPRITE 17   | xy: { 0x0D0, 0x2C0 }
#_09D2D9: db $33, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x330 }
#_09D2DC: db $25, $29, $79 ; SPRITE 79   | xy: { 0x290, 0x250 }
#_09D2DF: db $2F, $28, $17 ; SPRITE 17   | xy: { 0x280, 0x2F0 }
#_09D2E2: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen02_2:
#_09D2E3: db $12, $0D, $3B ; SPRITE 3B   | xy: { 0x0D0, 0x120 }
#_09D2E6: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen03_2:
#_09D2E7: db $00, $00, $F4 ; OVERLORD 02 | xy: { 0x000, 0x000 }
#_09D2EA: db $04, $0B, $F2 ; SPRITE F2   | xy: { 0x0B0, 0x040 }
#_09D2ED: db $1A, $10, $C9 ; SPRITE C9   | xy: { 0x100, 0x1A0 }
#_09D2F0: db $1E, $1A, $C9 ; SPRITE C9   | xy: { 0x1A0, 0x1E0 }
#_09D2F3: db $0C, $27, $27 ; SPRITE 27   | xy: { 0x270, 0x0C0 }
#_09D2F6: db $15, $2C, $C9 ; SPRITE C9   | xy: { 0x2C0, 0x150 }
#_09D2F9: db $16, $22, $EB ; SPRITE EB   | xy: { 0x220, 0x160 }
#_09D2FC: db $19, $28, $C9 ; SPRITE C9   | xy: { 0x280, 0x190 }
#_09D2FF: db $35, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x350 }
#_09D302: db $36, $06, $27 ; SPRITE 27   | xy: { 0x060, 0x360 }
#_09D305: db $3B, $0D, $27 ; SPRITE 27   | xy: { 0x0D0, 0x3B0 }
#_09D308: db $3B, $12, $F3 ; OVERLORD 01 | xy: { 0x120, 0x3B0 }
#_09D30B: db $2D, $2C, $27 ; SPRITE 27   | xy: { 0x2C0, 0x2D0 }
#_09D30E: db $33, $34, $27 ; SPRITE 27   | xy: { 0x340, 0x330 }
#_09D311: db $34, $2F, $27 ; SPRITE 27   | xy: { 0x2F0, 0x340 }
#_09D314: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen05_2:
#_09D315: db $0B, $07, $27 ; SPRITE 27   | xy: { 0x070, 0x0B0 }
#_09D318: db $0D, $08, $C9 ; SPRITE C9   | xy: { 0x080, 0x0D0 }
#_09D31B: db $0E, $1E, $27 ; SPRITE 27   | xy: { 0x1E0, 0x0E0 }
#_09D31E: db $0F, $1F, $C9 ; SPRITE C9   | xy: { 0x1F0, 0x0F0 }
#_09D321: db $03, $2F, $EB ; SPRITE EB   | xy: { 0x2F0, 0x030 }
#_09D324: db $0D, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0D0 }
#_09D327: db $0F, $29, $C9 ; SPRITE C9   | xy: { 0x290, 0x0F0 }
#_09D32A: db $0F, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0F0 }
#_09D32D: db $10, $34, $E3 ; SPRITE E3   | xy: { 0x340, 0x100 }
#_09D330: db $31, $1E, $C9 ; SPRITE C9   | xy: { 0x1E0, 0x310 }
#_09D333: db $2A, $35, $C9 ; SPRITE C9   | xy: { 0x350, 0x2A0 }
#_09D336: db $2F, $2A, $27 ; SPRITE 27   | xy: { 0x2A0, 0x2F0 }
#_09D339: db $2F, $2F, $C9 ; SPRITE C9   | xy: { 0x2F0, 0x2F0 }
#_09D33C: db $36, $29, $27 ; SPRITE 27   | xy: { 0x290, 0x360 }
#_09D33F: db $36, $36, $27 ; SPRITE 27   | xy: { 0x360, 0x360 }
#_09D342: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen07_2:
#_09D343: db $07, $0E, $27 ; SPRITE 27   | xy: { 0x0E0, 0x070 }
#_09D346: db $0D, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x0D0 }
#_09D349: db $15, $17, $27 ; SPRITE 27   | xy: { 0x170, 0x150 }
#_09D34C: db $16, $0F, $27 ; SPRITE 27   | xy: { 0x0F0, 0x160 }
#_09D34F: db $16, $12, $27 ; SPRITE 27   | xy: { 0x120, 0x160 }
#_09D352: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0A_2:
#_09D353: db $04, $0E, $79 ; SPRITE 79   | xy: { 0x0E0, 0x040 }
#_09D356: db $0D, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0D0 }
#_09D359: db $16, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x160 }
#_09D35C: db $16, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x160 }
#_09D35F: db $16, $0E, $17 ; SPRITE 17   | xy: { 0x0E0, 0x160 }
#_09D362: db $17, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x170 }
#_09D365: db $1A, $19, $AC ; SPRITE AC   | xy: { 0x190, 0x1A0 }
#_09D368: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0F_2:
#_09D369: db $02, $06, $37 ; SPRITE 37   | xy: { 0x060, 0x020 }
#_09D36C: db $0D, $0D, $58 ; SPRITE 58   | xy: { 0x0D0, 0x0D0 }
#_09D36F: db $10, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x100 }
#_09D372: db $11, $0A, $55 ; SPRITE 55   | xy: { 0x0A0, 0x110 }
#_09D375: db $12, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x120 }
#_09D378: db $13, $08, $BA ; SPRITE BA   | xy: { 0x080, 0x130 }
#_09D37B: db $17, $0E, $0A ; SPRITE 0A   | xy: { 0x0E0, 0x170 }
#_09D37E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen10_2:
#_09D37F: db $0C, $05, $41 ; SPRITE 41   | xy: { 0x050, 0x0C0 }
#_09D382: db $0C, $07, $AC ; SPRITE AC   | xy: { 0x070, 0x0C0 }
#_09D385: db $0F, $17, $E0 ; SPRITE E0   | xy: { 0x170, 0x0F0 }
#_09D388: db $12, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x120 }
#_09D38B: db $18, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x180 }
#_09D38E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen11_2:
#_09D38F: db $0C, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0C0 }
#_09D392: db $0D, $1A, $41 ; SPRITE 41   | xy: { 0x1A0, 0x0D0 }
#_09D395: db $10, $08, $DC ; SPRITE DC   | xy: { 0x080, 0x100 }
#_09D398: db $17, $08, $0B ; SPRITE 0B   | xy: { 0x080, 0x170 }
#_09D39B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen12_2:
#_09D39C: db $0A, $14, $E3 ; SPRITE E3   | xy: { 0x140, 0x0A0 }
#_09D39F: db $0E, $15, $41 ; SPRITE 41   | xy: { 0x150, 0x0E0 }
#_09D3A2: db $10, $0F, $BA ; SPRITE BA   | xy: { 0x0F0, 0x100 }
#_09D3A5: db $15, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x150 }
#_09D3A8: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen13_2:
#_09D3A9: db $09, $18, $79 ; SPRITE 79   | xy: { 0x180, 0x090 }
#_09D3AC: db $0C, $07, $DE ; SPRITE DE   | xy: { 0x070, 0x0C0 }
#_09D3AF: db $17, $0D, $41 ; SPRITE 41   | xy: { 0x0D0, 0x170 }
#_09D3B2: db $1A, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x1A0 }
#_09D3B5: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen14_2:
#_09D3B6: db $0D, $0D, $19 ; SPRITE 19   | xy: { 0x0D0, 0x0D0 }
#_09D3B9: db $0F, $19, $19 ; SPRITE 19   | xy: { 0x190, 0x0F0 }
#_09D3BC: db $10, $08, $19 ; SPRITE 19   | xy: { 0x080, 0x100 }
#_09D3BF: db $11, $14, $19 ; SPRITE 19   | xy: { 0x140, 0x110 }
#_09D3C2: db $14, $13, $19 ; SPRITE 19   | xy: { 0x130, 0x140 }
#_09D3C5: db $19, $11, $41 ; SPRITE 41   | xy: { 0x110, 0x190 }
#_09D3C8: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen15_2:
#_09D3C9: db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
#_09D3CC: db $0E, $16, $45 ; SPRITE 45   | xy: { 0x160, 0x0E0 }
#_09D3CF: db $0F, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x0F0 }
#_09D3D2: db $17, $0B, $43 ; SPRITE 43   | xy: { 0x0B0, 0x170 }
#_09D3D5: db $1A, $04, $AC ; SPRITE AC   | xy: { 0x040, 0x1A0 }
#_09D3D8: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen16_2:
#_09D3D9: db $0A, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0A0 }
#_09D3DC: db $15, $0F, $36 ; SPRITE 36   | xy: { 0x0F0, 0x150 }
#_09D3DF: db $18, $06, $0D ; SPRITE 0D   | xy: { 0x060, 0x180 }
#_09D3E2: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen17_2:
#_09D3E3: db $08, $18, $0D ; SPRITE 0D   | xy: { 0x180, 0x080 }
#_09D3E6: db $0A, $17, $0D ; SPRITE 0D   | xy: { 0x170, 0x0A0 }
#_09D3E9: db $0B, $0D, $45 ; SPRITE 45   | xy: { 0x0D0, 0x0B0 }
#_09D3EC: db $0C, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x0C0 }
#_09D3EF: db $16, $08, $0D ; SPRITE 0D   | xy: { 0x080, 0x160 }
#_09D3F2: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen18_2:
#_09D3F3: db $08, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x080 }
#_09D3F6: db $0A, $18, $DB ; SPRITE DB   | xy: { 0x180, 0x0A0 }
#_09D3F9: db $16, $18, $75 ; SPRITE 75   | xy: { 0x180, 0x160 }
#_09D3FC: db $1C, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x1C0 }
#_09D3FF: db $0B, $35, $41 ; SPRITE 41   | xy: { 0x350, 0x0B0 }
#_09D402: db $18, $20, $1D ; SPRITE 1D   | xy: { 0x200, 0x180 }
#_09D405: db $2E, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x2E0 }
#_09D408: db $34, $14, $0B ; SPRITE 0B   | xy: { 0x140, 0x340 }
#_09D40B: db $35, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x350 }
#_09D40E: db $22, $39, $43 ; SPRITE 43   | xy: { 0x390, 0x220 }
#_09D411: db $2E, $20, $41 ; SPRITE 41   | xy: { 0x200, 0x2E0 }
#_09D414: db $33, $36, $79 ; SPRITE 79   | xy: { 0x360, 0x330 }
#_09D417: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1A_2:
#_09D418: db $08, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x080 }
#_09D41B: db $0E, $0C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x0E0 }
#_09D41E: db $11, $0D, $E3 ; SPRITE E3   | xy: { 0x0D0, 0x110 }
#_09D421: db $18, $0A, $D8 ; SPRITE D8   | xy: { 0x0A0, 0x180 }
#_09D424: db $18, $0F, $45 ; SPRITE 45   | xy: { 0x0F0, 0x180 }
#_09D427: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_2:
#_09D428: db $0D, $06, $45 ; SPRITE 45   | xy: { 0x060, 0x0D0 }
#_09D42B: db $14, $16, $AC ; SPRITE AC   | xy: { 0x160, 0x140 }
#_09D42E: db $1A, $1F, $45 ; SPRITE 45   | xy: { 0x1F0, 0x1A0 }
#_09D431: db $13, $37, $41 ; SPRITE 41   | xy: { 0x370, 0x130 }
#_09D434: db $25, $1E, $BA ; SPRITE BA   | xy: { 0x1E0, 0x250 }
#_09D437: db $28, $08, $43 ; SPRITE 43   | xy: { 0x080, 0x280 }
#_09D43A: db $2B, $1F, $42 ; SPRITE 42   | xy: { 0x1F0, 0x2B0 }
#_09D43D: db $29, $38, $41 ; SPRITE 41   | xy: { 0x380, 0x290 }
#_09D440: db $2D, $21, $41 ; SPRITE 41   | xy: { 0x210, 0x2D0 }
#_09D443: db $32, $21, $45 ; SPRITE 45   | xy: { 0x210, 0x320 }
#_09D446: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_2:
#_09D447: db $06, $0B, $79 ; SPRITE 79   | xy: { 0x0B0, 0x060 }
#_09D44A: db $0C, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0C0 }
#_09D44D: db $0D, $07, $45 ; SPRITE 45   | xy: { 0x070, 0x0D0 }
#_09D450: db $0F, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0F0 }
#_09D453: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1E_2:
#_09D454: db $0E, $0E, $51 ; SPRITE 51   | xy: { 0x0E0, 0x0E0 }
#_09D457: db $1A, $11, $45 ; SPRITE 45   | xy: { 0x110, 0x1A0 }
#_09D45A: db $1A, $19, $51 ; SPRITE 51   | xy: { 0x190, 0x1A0 }
#_09D45D: db $04, $33, $33 ; SPRITE 33   | xy: { 0x330, 0x040 }
#_09D460: db $09, $33, $51 ; SPRITE 51   | xy: { 0x330, 0x090 }
#_09D463: db $09, $37, $51 ; SPRITE 51   | xy: { 0x370, 0x090 }
#_09D466: db $10, $31, $45 ; SPRITE 45   | xy: { 0x310, 0x100 }
#_09D469: db $17, $2F, $51 ; SPRITE 51   | xy: { 0x2F0, 0x170 }
#_09D46C: db $25, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x250 }
#_09D46F: db $28, $09, $45 ; SPRITE 45   | xy: { 0x090, 0x280 }
#_09D472: db $2C, $15, $43 ; SPRITE 43   | xy: { 0x150, 0x2C0 }
#_09D475: db $33, $14, $51 ; SPRITE 51   | xy: { 0x140, 0x330 }
#_09D478: db $33, $17, $51 ; SPRITE 51   | xy: { 0x170, 0x330 }
#_09D47B: db $25, $24, $51 ; SPRITE 51   | xy: { 0x240, 0x250 }
#_09D47E: db $28, $31, $51 ; SPRITE 51   | xy: { 0x310, 0x280 }
#_09D481: db $29, $28, $51 ; SPRITE 51   | xy: { 0x280, 0x290 }
#_09D484: db $29, $3A, $51 ; SPRITE 51   | xy: { 0x3A0, 0x290 }
#_09D487: db $29, $3D, $51 ; SPRITE 51   | xy: { 0x3D0, 0x290 }
#_09D48A: db $37, $22, $E3 ; SPRITE E3   | xy: { 0x220, 0x370 }
#_09D48D: db $3A, $2D, $45 ; SPRITE 45   | xy: { 0x2D0, 0x3A0 }
#_09D490: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen22_2:
#_09D491: db $04, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x040 }
#_09D494: db $14, $0C, $0B ; SPRITE 0B   | xy: { 0x0C0, 0x140 }
#_09D497: db $14, $12, $0B ; SPRITE 0B   | xy: { 0x120, 0x140 }
#_09D49A: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen25_2:
#_09D49B: db $08, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x080 }
#_09D49E: db $0C, $05, $41 ; SPRITE 41   | xy: { 0x050, 0x0C0 }
#_09D4A1: db $11, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x110 }
#_09D4A4: db $16, $19, $45 ; SPRITE 45   | xy: { 0x190, 0x160 }
#_09D4A7: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen28_2:
#_09D4A8: db $0C, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0C0 }
#_09D4AB: db $13, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x130 }
#_09D4AE: db $12, $08, $30 ; SPRITE 30   | xy: { 0x080, 0x120 }
#_09D4B1: db $18, $19, $2F ; SPRITE 2F   | xy: { 0x190, 0x180 }
#_09D4B4: db $19, $0C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x190 }
#_09D4B7: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen29_2:
#_09D4B8: db $05, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x050 }
#_09D4BB: db $0C, $0C, $45 ; SPRITE 45   | xy: { 0x0C0, 0x0C0 }
#_09D4BE: db $14, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x140 }
#_09D4C1: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2A_2:
#_09D4C2: db $09, $09, $1D ; SPRITE 1D   | xy: { 0x090, 0x090 }
#_09D4C5: db $0C, $0E, $9E ; SPRITE 9E   | xy: { 0x0E0, 0x0C0 }
#_09D4C8: db $0E, $0D, $A0 ; SPRITE A0   | xy: { 0x0D0, 0x0E0 }
#_09D4CB: db $0E, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0E0 }
#_09D4CE: db $0E, $11, $A0 ; SPRITE A0   | xy: { 0x110, 0x0E0 }
#_09D4D1: db $0F, $0C, $9F ; SPRITE 9F   | xy: { 0x0C0, 0x0F0 }
#_09D4D4: db $10, $11, $9F ; SPRITE 9F   | xy: { 0x110, 0x100 }
#_09D4D7: db $14, $15, $DB ; SPRITE DB   | xy: { 0x150, 0x140 }
#_09D4DA: db $18, $0F, $DB ; SPRITE DB   | xy: { 0x0F0, 0x180 }
#_09D4DD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_2:
#_09D4DE: db $06, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x060 }
#_09D4E1: db $0D, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x0D0 }
#_09D4E4: db $11, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x110 }
#_09D4E7: db $15, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x150 }
#_09D4EA: db $17, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x170 }
#_09D4ED: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_2:
#_09D4EE: db $14, $18, $41 ; SPRITE 41   | xy: { 0x180, 0x140 }
#_09D4F1: db $19, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x190 }
#_09D4F4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2D_2:
#_09D4F5: db $08, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x080 }
#_09D4F8: db $0B, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0B0 }
#_09D4FB: db $16, $12, $45 ; SPRITE 45   | xy: { 0x120, 0x160 }
#_09D4FE: db $17, $1C, $55 ; SPRITE 55   | xy: { 0x1C0, 0x170 }
#_09D501: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2E_2:
#_09D502: db $09, $0C, $E3 ; SPRITE E3   | xy: { 0x0C0, 0x090 }
#_09D505: db $0B, $14, $79 ; SPRITE 79   | xy: { 0x140, 0x0B0 }
#_09D508: db $0C, $0E, $45 ; SPRITE 45   | xy: { 0x0E0, 0x0C0 }
#_09D50B: db $0E, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0E0 }
#_09D50E: db $12, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x120 }
#_09D511: db $17, $19, $08 ; SPRITE 08   | xy: { 0x190, 0x170 }
#_09D514: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2F_2:
#_09D515: db $0C, $0F, $45 ; SPRITE 45   | xy: { 0x0F0, 0x0C0 }
#_09D518: db $17, $07, $51 ; SPRITE 51   | xy: { 0x070, 0x170 }
#_09D51B: db $17, $0C, $51 ; SPRITE 51   | xy: { 0x0C0, 0x170 }
#_09D51E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen30_2:
#_09D51F: db $14, $12, $57 ; SPRITE 57   | xy: { 0x120, 0x140 }
#_09D522: db $19, $12, $B3 ; SPRITE B3   | xy: { 0x120, 0x190 }
#_09D525: db $1C, $0E, $57 ; SPRITE 57   | xy: { 0x0E0, 0x1C0 }
#_09D528: db $1C, $16, $57 ; SPRITE 57   | xy: { 0x160, 0x1C0 }
#_09D52B: db $19, $27, $4C ; SPRITE 4C   | xy: { 0x270, 0x190 }
#_09D52E: db $1C, $22, $01 ; SPRITE 01   | xy: { 0x220, 0x1C0 }
#_09D531: db $1F, $2A, $4C ; SPRITE 4C   | xy: { 0x2A0, 0x1F0 }
#_09D534: db $23, $0C, $D4 ; SPRITE D4   | xy: { 0x0C0, 0x230 }
#_09D537: db $26, $1D, $4C ; SPRITE 4C   | xy: { 0x1D0, 0x260 }
#_09D53A: db $29, $07, $01 ; SPRITE 01   | xy: { 0x070, 0x290 }
#_09D53D: db $29, $0F, $4C ; SPRITE 4C   | xy: { 0x0F0, 0x290 }
#_09D540: db $2A, $06, $EB ; SPRITE EB   | xy: { 0x060, 0x2A0 }
#_09D543: db $2C, $1B, $4C ; SPRITE 4C   | xy: { 0x1B0, 0x2C0 }
#_09D546: db $30, $0A, $4C ; SPRITE 4C   | xy: { 0x0A0, 0x300 }
#_09D549: db $35, $14, $4C ; SPRITE 4C   | xy: { 0x140, 0x350 }
#_09D54C: db $2B, $37, $F2 ; SPRITE F2   | xy: { 0x370, 0x2B0 }
#_09D54F: db $24, $22, $4C ; SPRITE 4C   | xy: { 0x220, 0x240 }
#_09D552: db $2A, $28, $4C ; SPRITE 4C   | xy: { 0x280, 0x2A0 }
#_09D555: db $32, $23, $4C ; SPRITE 4C   | xy: { 0x230, 0x320 }
#_09D558: db $33, $34, $01 ; SPRITE 01   | xy: { 0x340, 0x330 }
#_09D55B: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_2:
#_09D55C: db $09, $1A, $D8 ; SPRITE D8   | xy: { 0x1A0, 0x090 }
#_09D55F: db $0C, $0B, $42 ; SPRITE 42   | xy: { 0x0B0, 0x0C0 }
#_09D562: db $0C, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0C0 }
#_09D565: db $10, $13, $42 ; SPRITE 42   | xy: { 0x130, 0x100 }
#_09D568: db $12, $19, $DD ; SPRITE DD   | xy: { 0x190, 0x120 }
#_09D56B: db $15, $08, $D4 ; SPRITE D4   | xy: { 0x080, 0x150 }
#_09D56E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen33_2:
#_09D56F: db $06, $13, $08 ; SPRITE 08   | xy: { 0x130, 0x060 }
#_09D572: db $0B, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x0B0 }
#_09D575: db $12, $17, $BA ; SPRITE BA   | xy: { 0x170, 0x120 }
#_09D578: db $16, $12, $08 ; SPRITE 08   | xy: { 0x120, 0x160 }
#_09D57B: db $1B, $1A, $08 ; SPRITE 08   | xy: { 0x1A0, 0x1B0 }
#_09D57E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen34_2:
#_09D57F: db $0E, $17, $33 ; SPRITE 33   | xy: { 0x170, 0x0E0 }
#_09D582: db $13, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x130 }
#_09D585: db $12, $11, $41 ; SPRITE 41   | xy: { 0x110, 0x120 }
#_09D588: db $13, $06, $08 ; SPRITE 08   | xy: { 0x060, 0x130 }
#_09D58B: db $18, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x180 }
#_09D58E: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen35_2:
#_09D58F: db $07, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x070 }
#_09D592: db $09, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x090 }
#_09D595: db $0C, $0A, $45 ; SPRITE 45   | xy: { 0x0A0, 0x0C0 }
#_09D598: db $13, $19, $EB ; SPRITE EB   | xy: { 0x190, 0x130 }
#_09D59B: db $14, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x140 }
#_09D59E: db $17, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x170 }
#_09D5A1: db $0A, $38, $0A ; SPRITE 0A   | xy: { 0x380, 0x0A0 }
#_09D5A4: db $0D, $25, $55 ; SPRITE 55   | xy: { 0x250, 0x0D0 }
#_09D5A7: db $19, $37, $55 ; SPRITE 55   | xy: { 0x370, 0x190 }
#_09D5AA: db $1F, $27, $0D ; SPRITE 0D   | xy: { 0x270, 0x1F0 }
#_09D5AD: db $1F, $2F, $0D ; SPRITE 0D   | xy: { 0x2F0, 0x1F0 }
#_09D5B0: db $26, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x260 }
#_09D5B3: db $2F, $0D, $00 ; SPRITE 00   | xy: { 0x0D0, 0x2F0 }
#_09D5B6: db $34, $06, $08 ; SPRITE 08   | xy: { 0x060, 0x340 }
#_09D5B9: db $35, $0A, $08 ; SPRITE 08   | xy: { 0x0A0, 0x350 }
#_09D5BC: db $35, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x350 }
#_09D5BF: db $39, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x390 }
#_09D5C2: db $3A, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x3A0 }
#_09D5C5: db $2B, $29, $BA ; SPRITE BA   | xy: { 0x290, 0x2B0 }
#_09D5C8: db $31, $39, $55 ; SPRITE 55   | xy: { 0x390, 0x310 }
#_09D5CB: db $36, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x360 }
#_09D5CE: db $37, $32, $0D ; SPRITE 0D   | xy: { 0x320, 0x370 }
#_09D5D1: db $39, $34, $0D ; SPRITE 0D   | xy: { 0x340, 0x390 }
#_09D5D4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen37_2:
#_09D5D5: db $08, $08, $58 ; SPRITE 58   | xy: { 0x080, 0x080 }
#_09D5D8: db $08, $10, $58 ; SPRITE 58   | xy: { 0x100, 0x080 }
#_09D5DB: db $0B, $0F, $58 ; SPRITE 58   | xy: { 0x0F0, 0x0B0 }
#_09D5DE: db $11, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x110 }
#_09D5E1: db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
#_09D5E4: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3A_2:
#_09D5E5: db $05, $17, $39 ; SPRITE 39   | xy: { 0x170, 0x050 }
#_09D5E8: db $0A, $0B, $3E ; SPRITE 3E   | xy: { 0x0B0, 0x0A0 }
#_09D5EB: db $0D, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x0D0 }
#_09D5EE: db $0E, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x0E0 }
#_09D5F1: db $0F, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x0F0 }
#_09D5F4: db $10, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x100 }
#_09D5F7: db $0F, $11, $45 ; SPRITE 45   | xy: { 0x110, 0x0F0 }
#_09D5FA: db $17, $17, $3E ; SPRITE 3E   | xy: { 0x170, 0x170 }
#_09D5FD: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3B_2:
#_09D5FE: db $0D, $13, $D2 ; SPRITE D2   | xy: { 0x130, 0x0D0 }
#_09D601: db $0F, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x0F0 }
#_09D604: db $0E, $14, $EB ; SPRITE EB   | xy: { 0x140, 0x0E0 }
#_09D607: db $14, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x140 }
#_09D60A: db $18, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x180 }
#_09D60D: db $1B, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x1B0 }
#_09D610: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3C_2:
#_09D611: db $09, $0B, $00 ; SPRITE 00   | xy: { 0x0B0, 0x090 }
#_09D614: db $0A, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x0A0 }
#_09D617: db $0F, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0F0 }
#_09D61A: db $11, $09, $45 ; SPRITE 45   | xy: { 0x090, 0x110 }
#_09D61D: db $15, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x150 }
#_09D620: db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3F_2:
#_09D621: db $05, $16, $0A ; SPRITE 0A   | xy: { 0x160, 0x050 }
#_09D624: db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
#_09D627: db $13, $06, $55 ; SPRITE 55   | xy: { 0x060, 0x130 }
#_09D62A: db $16, $11, $0F ; SPRITE 0F   | xy: { 0x110, 0x160 }
#_09D62D: db $FF ; END

;===================================================================================================
; Each room begins with 1 byte to designate the layering of OAM allocation.
; Following that, each sprite has 3 bytes of data
; The list is terminated when byte 1 is 0xFF
;
; lssyyyyy
; tttxxxxx
; iiiiiiii
;   x - x coordinate of sprite, in multiples of 16
;   y - y coordinate of sprite, in multiples of 16
;   l - sprite layer (0: upper | 1: lower)
;   i - sprite ID
;   s - aux part 1
;   t - aux part 2
;       if every bit of t is set, then the entry corresponds to an overlord or a key
;
;   s and t form a 5 bit auxiliary value written to $0E30,X
;     ...ssttt
;
; For entries with ID 0xE4, byte 1 doubles as a flag
;   0xFE - previous sprite entry is given a small key
;   0xFD - previous sprite entry is given a big key
;   All other values correspond to a regular key placed as a sprite
;
; This data is parsed and formatted as a comment for each entry as:
; xy: { X, Y, Z } | s: S
; where:
;   X and Y are pixel coordinates relative to the room's top-left corner
;   Z is the layer (U: upper layer | L: lower layer)
;   S is the auxiliary value
;===================================================================================================
RoomData_SpritePointers:
#_09D62E: dw RoomData_Sprites_Room0000
#_09D630: dw RoomData_Sprites_Empty
#_09D632: dw RoomData_Sprites_Room0002
#_09D634: dw RoomData_Sprites_Empty
#_09D636: dw RoomData_Sprites_Room0004
#_09D638: dw RoomData_Sprites_Empty
#_09D63A: dw RoomData_Sprites_Room0006
#_09D63C: dw RoomData_Sprites_Room0007
#_09D63E: dw RoomData_Sprites_Room0008
#_09D640: dw RoomData_Sprites_Room0009
#_09D642: dw RoomData_Sprites_Room000A
#_09D644: dw RoomData_Sprites_Room000B
#_09D646: dw RoomData_Sprites_Empty
#_09D648: dw RoomData_Sprites_Room000D
#_09D64A: dw RoomData_Sprites_Room000E
#_09D64C: dw RoomData_Sprites_Empty
#_09D64E: dw RoomData_Sprites_Empty
#_09D650: dw RoomData_Sprites_Room0011
#_09D652: dw RoomData_Sprites_Room0012
#_09D654: dw RoomData_Sprites_Room0013
#_09D656: dw RoomData_Sprites_Room0014
#_09D658: dw RoomData_Sprites_Room0015
#_09D65A: dw RoomData_Sprites_Room0016
#_09D65C: dw RoomData_Sprites_Room0017
#_09D65E: dw RoomData_Sprites_Empty
#_09D660: dw RoomData_Sprites_Room0019
#_09D662: dw RoomData_Sprites_Room001A
#_09D664: dw RoomData_Sprites_Room001B
#_09D666: dw RoomData_Sprites_Room001C
#_09D668: dw RoomData_Sprites_Empty
#_09D66A: dw RoomData_Sprites_Room001E
#_09D66C: dw RoomData_Sprites_Room001F
#_09D66E: dw RoomData_Sprites_Room0020
#_09D670: dw RoomData_Sprites_Room0021
#_09D672: dw RoomData_Sprites_Room0022
#_09D674: dw RoomData_Sprites_Room0023
#_09D676: dw RoomData_Sprites_Room0024
#_09D678: dw RoomData_Sprites_Room0025
#_09D67A: dw RoomData_Sprites_Room0026
#_09D67C: dw RoomData_Sprites_Room0027
#_09D67E: dw RoomData_Sprites_Room0028
#_09D680: dw RoomData_Sprites_Room0029
#_09D682: dw RoomData_Sprites_Room002A
#_09D684: dw RoomData_Sprites_Room002B
#_09D686: dw RoomData_Sprites_Room002C
#_09D688: dw RoomData_Sprites_Empty
#_09D68A: dw RoomData_Sprites_Room002E
#_09D68C: dw RoomData_Sprites_Empty
#_09D68E: dw RoomData_Sprites_Room0030
#_09D690: dw RoomData_Sprites_Room0031
#_09D692: dw RoomData_Sprites_Room0032
#_09D694: dw RoomData_Sprites_Room0033
#_09D696: dw RoomData_Sprites_Room0034
#_09D698: dw RoomData_Sprites_Room0035
#_09D69A: dw RoomData_Sprites_Room0036
#_09D69C: dw RoomData_Sprites_Room0037
#_09D69E: dw RoomData_Sprites_Room0038
#_09D6A0: dw RoomData_Sprites_Room0039
#_09D6A2: dw RoomData_Sprites_Room003A
#_09D6A4: dw RoomData_Sprites_Room003B
#_09D6A6: dw RoomData_Sprites_Room003C
#_09D6A8: dw RoomData_Sprites_Room003D
#_09D6AA: dw RoomData_Sprites_Room003E
#_09D6AC: dw RoomData_Sprites_Room003F
#_09D6AE: dw RoomData_Sprites_Room0040
#_09D6B0: dw RoomData_Sprites_Room0041
#_09D6B2: dw RoomData_Sprites_Room0042
#_09D6B4: dw RoomData_Sprites_Room0043
#_09D6B6: dw RoomData_Sprites_Room0044
#_09D6B8: dw RoomData_Sprites_Room0045
#_09D6BA: dw RoomData_Sprites_Room0046
#_09D6BC: dw RoomData_Sprites_Room0047
#_09D6BE: dw RoomData_Sprites_Empty
#_09D6C0: dw RoomData_Sprites_Room0049
#_09D6C2: dw RoomData_Sprites_Room004A
#_09D6C4: dw RoomData_Sprites_Room004B
#_09D6C6: dw RoomData_Sprites_Room004C
#_09D6C8: dw RoomData_Sprites_Room004D
#_09D6CA: dw RoomData_Sprites_Room004E
#_09D6CC: dw RoomData_Sprites_Room004F
#_09D6CE: dw RoomData_Sprites_Room0050
#_09D6D0: dw RoomData_Sprites_Room0051
#_09D6D2: dw RoomData_Sprites_Room0052
#_09D6D4: dw RoomData_Sprites_Room0053
#_09D6D6: dw RoomData_Sprites_Room0054
#_09D6D8: dw RoomData_Sprites_Room0055
#_09D6DA: dw RoomData_Sprites_Room0056
#_09D6DC: dw RoomData_Sprites_Room0057
#_09D6DE: dw RoomData_Sprites_Room0058
#_09D6E0: dw RoomData_Sprites_Room0059
#_09D6E2: dw RoomData_Sprites_Room005A
#_09D6E4: dw RoomData_Sprites_Room005B
#_09D6E6: dw RoomData_Sprites_Room005C
#_09D6E8: dw RoomData_Sprites_Room005D
#_09D6EA: dw RoomData_Sprites_Room005E
#_09D6EC: dw RoomData_Sprites_Room005F
#_09D6EE: dw RoomData_Sprites_Room0060
#_09D6F0: dw RoomData_Sprites_Room0061
#_09D6F2: dw RoomData_Sprites_Room0062
#_09D6F4: dw RoomData_Sprites_Room0063
#_09D6F6: dw RoomData_Sprites_Room0064
#_09D6F8: dw RoomData_Sprites_Room0065
#_09D6FA: dw RoomData_Sprites_Room0066
#_09D6FC: dw RoomData_Sprites_Room0067
#_09D6FE: dw RoomData_Sprites_Room0068
#_09D700: dw RoomData_Sprites_Empty
#_09D702: dw RoomData_Sprites_Room006A
#_09D704: dw RoomData_Sprites_Room006B
#_09D706: dw RoomData_Sprites_Room006C
#_09D708: dw RoomData_Sprites_Room006D
#_09D70A: dw RoomData_Sprites_Room006E
#_09D70C: dw RoomData_Sprites_Empty
#_09D70E: dw RoomData_Sprites_Empty
#_09D710: dw RoomData_Sprites_Room0071
#_09D712: dw RoomData_Sprites_Room0072
#_09D714: dw RoomData_Sprites_Room0073
#_09D716: dw RoomData_Sprites_Room0074
#_09D718: dw RoomData_Sprites_Room0075
#_09D71A: dw RoomData_Sprites_Room0076
#_09D71C: dw RoomData_Sprites_Room0077
#_09D71E: dw RoomData_Sprites_Empty
#_09D720: dw RoomData_Sprites_Empty
#_09D722: dw RoomData_Sprites_Empty
#_09D724: dw RoomData_Sprites_Room007B
#_09D726: dw RoomData_Sprites_Room007C
#_09D728: dw RoomData_Sprites_Room007D
#_09D72A: dw RoomData_Sprites_Room007E
#_09D72C: dw RoomData_Sprites_Room007F
#_09D72E: dw RoomData_Sprites_Room0080
#_09D730: dw RoomData_Sprites_Room0081
#_09D732: dw RoomData_Sprites_Room0082
#_09D734: dw RoomData_Sprites_Room0083
#_09D736: dw RoomData_Sprites_Room0084
#_09D738: dw RoomData_Sprites_Room0085
#_09D73A: dw RoomData_Sprites_Room0086
#_09D73C: dw RoomData_Sprites_Room0087
#_09D73E: dw RoomData_Sprites_Empty
#_09D740: dw RoomData_Sprites_Room0089
#_09D742: dw RoomData_Sprites_Empty
#_09D744: dw RoomData_Sprites_Room008B
#_09D746: dw RoomData_Sprites_Room008C
#_09D748: dw RoomData_Sprites_Room008D
#_09D74A: dw RoomData_Sprites_Room008E
#_09D74C: dw RoomData_Sprites_Empty
#_09D74E: dw RoomData_Sprites_Room0090
#_09D750: dw RoomData_Sprites_Room0091
#_09D752: dw RoomData_Sprites_Room0092
#_09D754: dw RoomData_Sprites_Room0093
#_09D756: dw RoomData_Sprites_Empty
#_09D758: dw RoomData_Sprites_Room0095
#_09D75A: dw RoomData_Sprites_Room0096
#_09D75C: dw RoomData_Sprites_Room0097
#_09D75E: dw RoomData_Sprites_Room0098
#_09D760: dw RoomData_Sprites_Room0099
#_09D762: dw RoomData_Sprites_Empty
#_09D764: dw RoomData_Sprites_Room009B
#_09D766: dw RoomData_Sprites_Room009C
#_09D768: dw RoomData_Sprites_Room009D
#_09D76A: dw RoomData_Sprites_Room009E
#_09D76C: dw RoomData_Sprites_Room009F
#_09D76E: dw RoomData_Sprites_Room00A0
#_09D770: dw RoomData_Sprites_Room00A1
#_09D772: dw RoomData_Sprites_Empty
#_09D774: dw RoomData_Sprites_Room00A3
#_09D776: dw RoomData_Sprites_Room00A4
#_09D778: dw RoomData_Sprites_Room00A5
#_09D77A: dw RoomData_Sprites_Room00A6
#_09D77C: dw RoomData_Sprites_Room00A7
#_09D77E: dw RoomData_Sprites_Room00A8
#_09D780: dw RoomData_Sprites_Room00A9
#_09D782: dw RoomData_Sprites_Room00AA
#_09D784: dw RoomData_Sprites_Room00AB
#_09D786: dw RoomData_Sprites_Room00AC
#_09D788: dw RoomData_Sprites_Empty
#_09D78A: dw RoomData_Sprites_Room00AE
#_09D78C: dw RoomData_Sprites_Room00AF
#_09D78E: dw RoomData_Sprites_Room00B0
#_09D790: dw RoomData_Sprites_Room00B1
#_09D792: dw RoomData_Sprites_Room00B2
#_09D794: dw RoomData_Sprites_Room00B3
#_09D796: dw RoomData_Sprites_Empty
#_09D798: dw RoomData_Sprites_Room00B5
#_09D79A: dw RoomData_Sprites_Room00B6
#_09D79C: dw RoomData_Sprites_Room00B7
#_09D79E: dw RoomData_Sprites_Room00B8
#_09D7A0: dw RoomData_Sprites_Room00B9
#_09D7A2: dw RoomData_Sprites_Room00BA
#_09D7A4: dw RoomData_Sprites_Room00BB
#_09D7A6: dw RoomData_Sprites_Room00BC
#_09D7A8: dw RoomData_Sprites_Room00BD
#_09D7AA: dw RoomData_Sprites_Room00BE
#_09D7AC: dw RoomData_Sprites_Room00BF
#_09D7AE: dw RoomData_Sprites_Room00C0
#_09D7B0: dw RoomData_Sprites_Room00C1
#_09D7B2: dw RoomData_Sprites_Room00C2
#_09D7B4: dw RoomData_Sprites_Room00C3
#_09D7B6: dw RoomData_Sprites_Room00C4
#_09D7B8: dw RoomData_Sprites_Room00C5
#_09D7BA: dw RoomData_Sprites_Room00C6
#_09D7BC: dw RoomData_Sprites_Empty
#_09D7BE: dw RoomData_Sprites_Room00C8
#_09D7C0: dw RoomData_Sprites_Room00C9
#_09D7C2: dw RoomData_Sprites_Empty
#_09D7C4: dw RoomData_Sprites_Room00CB
#_09D7C6: dw RoomData_Sprites_Room00CC
#_09D7C8: dw RoomData_Sprites_Empty
#_09D7CA: dw RoomData_Sprites_Room00CE
#_09D7CC: dw RoomData_Sprites_Empty
#_09D7CE: dw RoomData_Sprites_Room00D0
#_09D7D0: dw RoomData_Sprites_Room00D1
#_09D7D2: dw RoomData_Sprites_Room00D2
#_09D7D4: dw RoomData_Sprites_Empty
#_09D7D6: dw RoomData_Sprites_Empty
#_09D7D8: dw RoomData_Sprites_Room00D5
#_09D7DA: dw RoomData_Sprites_Room00D6
#_09D7DC: dw RoomData_Sprites_Empty
#_09D7DE: dw RoomData_Sprites_Room00D8
#_09D7E0: dw RoomData_Sprites_Room00D9
#_09D7E2: dw RoomData_Sprites_Room00DA
#_09D7E4: dw RoomData_Sprites_Room00DB
#_09D7E6: dw RoomData_Sprites_Room00DC
#_09D7E8: dw RoomData_Sprites_Empty
#_09D7EA: dw RoomData_Sprites_Room00DE
#_09D7EC: dw RoomData_Sprites_Room00DF
#_09D7EE: dw RoomData_Sprites_Room00E0
#_09D7F0: dw RoomData_Sprites_Room00E1
#_09D7F2: dw RoomData_Sprites_Room00E2
#_09D7F4: dw RoomData_Sprites_Room00E3
#_09D7F6: dw RoomData_Sprites_Room00E4
#_09D7F8: dw RoomData_Sprites_Room00E5
#_09D7FA: dw RoomData_Sprites_Room00E6
#_09D7FC: dw RoomData_Sprites_Room00E7
#_09D7FE: dw RoomData_Sprites_Room00E8
#_09D800: dw RoomData_Sprites_Empty
#_09D802: dw RoomData_Sprites_Room00EA
#_09D804: dw RoomData_Sprites_Room00EB
#_09D806: dw RoomData_Sprites_Empty
#_09D808: dw RoomData_Sprites_Empty
#_09D80A: dw RoomData_Sprites_Room00EE
#_09D80C: dw RoomData_Sprites_Room00EF
#_09D80E: dw RoomData_Sprites_Room00F0
#_09D810: dw RoomData_Sprites_Room00F1
#_09D812: dw RoomData_Sprites_Empty
#_09D814: dw RoomData_Sprites_Room00F3
#_09D816: dw RoomData_Sprites_Room00F4
#_09D818: dw RoomData_Sprites_Room00F5
#_09D81A: dw RoomData_Sprites_Empty
#_09D81C: dw RoomData_Sprites_Empty
#_09D81E: dw RoomData_Sprites_Empty
#_09D820: dw RoomData_Sprites_Room00F9
#_09D822: dw RoomData_Sprites_Room00FA
#_09D824: dw RoomData_Sprites_Room00FB
#_09D826: dw RoomData_Sprites_Room00FC
#_09D828: dw RoomData_Sprites_Room00FD
#_09D82A: dw RoomData_Sprites_Room00FE
#_09D82C: dw RoomData_Sprites_Room00FF
#_09D82E: dw RoomData_Sprites_Room0100
#_09D830: dw RoomData_Sprites_Room0101
#_09D832: dw RoomData_Sprites_Room0102
#_09D834: dw RoomData_Sprites_Room0103
#_09D836: dw RoomData_Sprites_Room0104
#_09D838: dw RoomData_Sprites_Room0105
#_09D83A: dw RoomData_Sprites_Room0106
#_09D83C: dw RoomData_Sprites_Room0107
#_09D83E: dw RoomData_Sprites_Room0108
#_09D840: dw RoomData_Sprites_Room0109
#_09D842: dw RoomData_Sprites_Room010A
#_09D844: dw RoomData_Sprites_Room010B
#_09D846: dw RoomData_Sprites_Room010C
#_09D848: dw RoomData_Sprites_Room010D
#_09D84A: dw RoomData_Sprites_Room010E
#_09D84C: dw RoomData_Sprites_Room010F
#_09D84E: dw RoomData_Sprites_Room0110
#_09D850: dw RoomData_Sprites_Room0111
#_09D852: dw RoomData_Sprites_Room0112
#_09D854: dw RoomData_Sprites_Empty
#_09D856: dw RoomData_Sprites_Room0114
#_09D858: dw RoomData_Sprites_Room0115
#_09D85A: dw RoomData_Sprites_Room0116
#_09D85C: dw RoomData_Sprites_Empty
#_09D85E: dw RoomData_Sprites_Room0118
#_09D860: dw RoomData_Sprites_Room0119
#_09D862: dw RoomData_Sprites_Room011A
#_09D864: dw RoomData_Sprites_Room011B
#_09D866: dw RoomData_Sprites_Room011C
#_09D868: dw RoomData_Sprites_Empty
#_09D86A: dw RoomData_Sprites_Room011E
#_09D86C: dw RoomData_Sprites_Room011F
#_09D86E: dw RoomData_Sprites_Room0120
#_09D870: dw RoomData_Sprites_Room0121
#_09D872: dw RoomData_Sprites_Room0122
#_09D874: dw RoomData_Sprites_Room0123
#_09D876: dw RoomData_Sprites_Room0124
#_09D878: dw RoomData_Sprites_Room0125
#_09D87A: dw RoomData_Sprites_Room0126
#_09D87C: dw RoomData_Sprites_Room0127
#_09D87E: dw RoomData_Sprites_Empty
#_09D880: dw RoomData_Sprites_Empty
#_09D882: dw RoomData_Sprites_Empty
#_09D884: dw RoomData_Sprites_Empty
#_09D886: dw RoomData_Sprites_Empty
#_09D888: dw RoomData_Sprites_Empty
#_09D88A: dw RoomData_Sprites_Empty
#_09D88C: dw RoomData_Sprites_Empty
#_09D88E: dw RoomData_Sprites_Empty
#_09D890: dw RoomData_Sprites_Empty
#_09D892: dw RoomData_Sprites_Empty
#_09D894: dw RoomData_Sprites_Empty
#_09D896: dw RoomData_Sprites_Empty
#_09D898: dw RoomData_Sprites_Empty
#_09D89A: dw RoomData_Sprites_Empty
#_09D89C: dw RoomData_Sprites_Empty
#_09D89E: dw RoomData_Sprites_Empty
#_09D8A0: dw RoomData_Sprites_Empty
#_09D8A2: dw RoomData_Sprites_Empty
#_09D8A4: dw RoomData_Sprites_Empty
#_09D8A6: dw RoomData_Sprites_Empty
#_09D8A8: dw RoomData_Sprites_Empty
#_09D8AA: dw RoomData_Sprites_Empty
#_09D8AC: dw RoomData_Sprites_Empty
#_09D8AE: dw RoomData_Sprites_Empty
#_09D8B0: dw RoomData_Sprites_Empty
#_09D8B2: dw RoomData_Sprites_Empty
#_09D8B4: dw RoomData_Sprites_Empty
#_09D8B6: dw RoomData_Sprites_Empty
#_09D8B8: dw RoomData_Sprites_Empty
#_09D8BA: dw RoomData_Sprites_Empty
#_09D8BC: dw RoomData_Sprites_Empty
#_09D8BE: dw RoomData_Sprites_Empty
#_09D8C0: dw RoomData_Sprites_Empty
#_09D8C2: dw RoomData_Sprites_Empty
#_09D8C4: dw RoomData_Sprites_Empty
#_09D8C6: dw RoomData_Sprites_Empty
#_09D8C8: dw RoomData_Sprites_Empty
#_09D8CA: dw RoomData_Sprites_Empty
#_09D8CC: dw RoomData_Sprites_Empty
#_09D8CE: dw RoomData_Sprites_Empty
#_09D8D0: dw RoomData_Sprites_Empty
#_09D8D2: dw RoomData_Sprites_Empty
#_09D8D4: dw RoomData_Sprites_Empty
#_09D8D6: dw RoomData_Sprites_Empty
#_09D8D8: dw RoomData_Sprites_Empty
#_09D8DA: dw RoomData_Sprites_Empty
#_09D8DC: dw RoomData_Sprites_Empty
#_09D8DE: dw RoomData_Sprites_Empty
#_09D8E0: dw RoomData_Sprites_Empty
#_09D8E2: dw RoomData_Sprites_Empty
#_09D8E4: dw RoomData_Sprites_Empty
#_09D8E6: dw RoomData_Sprites_Empty
#_09D8E8: dw RoomData_Sprites_Empty
#_09D8EA: dw RoomData_Sprites_Empty
#_09D8EC: dw RoomData_Sprites_Empty
#_09D8EE: dw RoomData_Sprites_Empty
#_09D8F0: dw RoomData_Sprites_Empty
#_09D8F2: dw RoomData_Sprites_Empty
#_09D8F4: dw RoomData_Sprites_Empty
#_09D8F6: dw RoomData_Sprites_Empty
#_09D8F8: dw RoomData_Sprites_Empty
#_09D8FA: dw RoomData_Sprites_Empty
#_09D8FC: dw RoomData_Sprites_Empty
#_09D8FE: dw RoomData_Sprites_Empty
#_09D900: dw RoomData_Sprites_Empty
#_09D902: dw RoomData_Sprites_Empty
#_09D904: dw RoomData_Sprites_Empty
#_09D906: dw RoomData_Sprites_Empty
#_09D908: dw RoomData_Sprites_Empty
#_09D90A: dw RoomData_Sprites_Empty
#_09D90C: dw RoomData_Sprites_Empty
#_09D90E: dw RoomData_Sprites_Empty
#_09D910: dw RoomData_Sprites_Empty
#_09D912: dw RoomData_Sprites_Empty
#_09D914: dw RoomData_Sprites_Empty
#_09D916: dw RoomData_Sprites_Empty
#_09D918: dw RoomData_Sprites_Empty
#_09D91A: dw RoomData_Sprites_Empty
#_09D91C: dw RoomData_Sprites_Empty
#_09D91E: dw RoomData_Sprites_Empty
#_09D920: dw RoomData_Sprites_Empty
#_09D922: dw RoomData_Sprites_Empty
#_09D924: dw RoomData_Sprites_Empty
#_09D926: dw RoomData_Sprites_Empty
#_09D928: dw RoomData_Sprites_Empty
#_09D92A: dw RoomData_Sprites_Empty
#_09D92C: dw RoomData_Sprites_Empty

;===================================================================================================

RoomData_Sprites_Room0000:
#_09D92E: db $00 ; Unlayered OAM
#_09D92F: db $05, $17, $D6 ; SPRITE D6   | xy: { 0x170, 0x050, U } | s: 0x00
#_09D932: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0002:
#_09D933: db $00 ; Unlayered OAM
#_09D934: db $85, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x050, L } | s: 0x00
#_09D937: db $86, $15, $6D ; SPRITE 6D   | xy: { 0x150, 0x060, L } | s: 0x00
#_09D93A: db $88, $0F, $6D ; SPRITE 6D   | xy: { 0x0F0, 0x080, L } | s: 0x00
#_09D93D: db $88, $10, $6D ; SPRITE 6D   | xy: { 0x100, 0x080, L } | s: 0x00
#_09D940: db $89, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x090, L } | s: 0x00
#_09D943: db $97, $EF, $06 ; OVERLORD 06 | xy: { 0x0F0, 0x170, L }
#_09D946: db $98, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x180, L }
#_09D949: db $98, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x180, L }
#_09D94C: db $99, $EA, $06 ; OVERLORD 06 | xy: { 0x0A0, 0x190, L }
#_09D94F: db $99, $EC, $06 ; OVERLORD 06 | xy: { 0x0C0, 0x190, L }
#_09D952: db $9A, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x1A0, L }
#_09D955: db $9B, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x1B0, L }
#_09D958: db $97, $0A, $06 ; SPRITE 06   | xy: { 0x0A0, 0x170, L } | s: 0x00
#_09D95B: db $97, $15, $04 ; SPRITE 04   | xy: { 0x150, 0x170, L } | s: 0x00
#_09D95E: db $9A, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x1A0, L } | s: 0x00
#_09D961: db $9A, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x1A0, L } | s: 0x00
#_09D964: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0004:
#_09D965: db $00 ; Unlayered OAM
#_09D966: db $04, $09, $1E ; SPRITE 1E   | xy: { 0x090, 0x040, U } | s: 0x00
#_09D969: db $04, $14, $5D ; SPRITE 5D   | xy: { 0x140, 0x040, U } | s: 0x00
#_09D96C: db $04, $1B, $60 ; SPRITE 60   | xy: { 0x1B0, 0x040, U } | s: 0x00
#_09D96F: db $07, $05, $5F ; SPRITE 5F   | xy: { 0x050, 0x070, U } | s: 0x00
#_09D972: db $09, $15, $5F ; SPRITE 5F   | xy: { 0x150, 0x090, U } | s: 0x00
#_09D975: db $12, $E7, $16 ; OVERLORD 16 | xy: { 0x070, 0x120, U }
#_09D978: db $15, $15, $04 ; SPRITE 04   | xy: { 0x150, 0x150, U } | s: 0x00
#_09D97B: db $15, $1A, $06 ; SPRITE 06   | xy: { 0x1A0, 0x150, U } | s: 0x00
#_09D97E: db $15, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x150, U }
#_09D981: db $15, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x150, U } | s: 0x00
#_09D984: db $17, $F6, $1A ; OVERLORD 1A | xy: { 0x160, 0x170, U }
#_09D987: db $17, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x170, U }
#_09D98A: db $18, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x180, U }
#_09D98D: db $1A, $1A, $8F ; SPRITE 8F   | xy: { 0x1A0, 0x1A0, U } | s: 0x00
#_09D990: db $1B, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x1B0, U } | s: 0x00
#_09D993: db $18, $07, $C7 ; SPRITE C7   | xy: { 0x070, 0x180, U } | s: 0x00
#_09D996: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0006:
#_09D997: db $00 ; Unlayered OAM
#_09D998: db $17, $07, $8C ; SPRITE 8C   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D99B: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D99E: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9A1: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9A4: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9A7: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9AA: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9AD: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9B0: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9B3: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9B6: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9B9: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9BC: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9BF: db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
#_09D9C2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0007:
#_09D9C3: db $00 ; Unlayered OAM
#_09D9C4: db $0E, $12, $09 ; SPRITE 09   | xy: { 0x120, 0x0E0, U } | s: 0x00
#_09D9C7: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0008:
#_09D9C8: db $00 ; Unlayered OAM
#_09D9C9: db $16, $07, $C8 ; SPRITE C8   | xy: { 0x070, 0x160, U } | s: 0x00
#_09D9CC: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0009:
#_09D9CD: db $00 ; Unlayered OAM
#_09D9CE: db $08, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x080, U } | s: 0x00
#_09D9D1: db $08, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x080, U } | s: 0x00
#_09D9D4: db $0B, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x0B0, U } | s: 0x00
#_09D9D7: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000A:
#_09D9D8: db $00 ; Unlayered OAM
#_09D9D9: db $08, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x080, U } | s: 0x00
#_09D9DC: db $09, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x090, U } | s: 0x00
#_09D9DF: db $09, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x090, U }
#_09D9E2: db $09, $F1, $05 ; OVERLORD 05 | xy: { 0x110, 0x090, U }
#_09D9E5: db $0B, $F3, $17 ; OVERLORD 17 | xy: { 0x130, 0x0B0, U }
#_09D9E8: db $0E, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x0E0, U }
#_09D9EB: db $0E, $F1, $05 ; OVERLORD 05 | xy: { 0x110, 0x0E0, U }
#_09D9EE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000B:
#_09D9EF: db $00 ; Unlayered OAM
#_09D9F0: db $04, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x040, U } | s: 0x00
#_09D9F3: db $08, $07, $8E ; SPRITE 8E   | xy: { 0x070, 0x080, U } | s: 0x00
#_09D9F6: db $0B, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x0B0, U } | s: 0x00
#_09D9F9: db $0B, $1B, $8E ; SPRITE 8E   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09D9FC: db $16, $05, $8E ; SPRITE 8E   | xy: { 0x050, 0x160, U } | s: 0x00
#_09D9FF: db $16, $0A, $8E ; SPRITE 8E   | xy: { 0x0A0, 0x160, U } | s: 0x00
#_09DA02: db $19, $07, $8E ; SPRITE 8E   | xy: { 0x070, 0x190, U } | s: 0x00
#_09DA05: db $19, $08, $8E ; SPRITE 8E   | xy: { 0x080, 0x190, U } | s: 0x00
#_09DA08: db $1B, $06, $8E ; SPRITE 8E   | xy: { 0x060, 0x1B0, U } | s: 0x00
#_09DA0B: db $1B, $09, $8E ; SPRITE 8E   | xy: { 0x090, 0x1B0, U } | s: 0x00
#_09DA0E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000D:
#_09DA0F: db $00 ; Unlayered OAM
#_09DA10: db $15, $07, $7A ; SPRITE 7A   | xy: { 0x070, 0x150, U } | s: 0x00
#_09DA13: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000E:
#_09DA14: db $00 ; Unlayered OAM
#_09DA15: db $12, $16, $A1 ; SPRITE A1   | xy: { 0x160, 0x120, U } | s: 0x00
#_09DA18: db $16, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x160, U } | s: 0x00
#_09DA1B: db $18, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x180, U } | s: 0x00
#_09DA1E: db $1A, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x1A0, U } | s: 0x00
#_09DA21: db $FE, $00, $E4 ; small key on above sprite
#_09DA24: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0011:
#_09DA25: db $00 ; Unlayered OAM
#_09DA26: db $0A, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x0A0, U } | s: 0x00
#_09DA29: db $0A, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09DA2C: db $0C, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x0C0, U } | s: 0x00
#_09DA2F: db $0C, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x0C0, U } | s: 0x00
#_09DA32: db $11, $1C, $6D ; SPRITE 6D   | xy: { 0x1C0, 0x110, U } | s: 0x00
#_09DA35: db $12, $1C, $6D ; SPRITE 6D   | xy: { 0x1C0, 0x120, U } | s: 0x00
#_09DA38: db $16, $1A, $6D ; SPRITE 6D   | xy: { 0x1A0, 0x160, U } | s: 0x00
#_09DA3B: db $16, $1B, $6D ; SPRITE 6D   | xy: { 0x1B0, 0x160, U } | s: 0x00
#_09DA3E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0012:
#_09DA3F: db $00 ; Unlayered OAM
#_09DA40: db $07, $0F, $73 ; SPRITE 73   | xy: { 0x0F0, 0x070, U } | s: 0x00
#_09DA43: db $06, $10, $76 ; SPRITE 76   | xy: { 0x100, 0x060, U } | s: 0x00
#_09DA46: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0013:
#_09DA47: db $00 ; Unlayered OAM
#_09DA48: db $11, $14, $1E ; SPRITE 1E   | xy: { 0x140, 0x110, U } | s: 0x00
#_09DA4B: db $04, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x040, U } | s: 0x00
#_09DA4E: db $04, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x040, U } | s: 0x00
#_09DA51: db $05, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x050, U } | s: 0x00
#_09DA54: db $05, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x050, U } | s: 0x00
#_09DA57: db $16, $1B, $7C ; SPRITE 7C   | xy: { 0x1B0, 0x160, U } | s: 0x00
#_09DA5A: db $18, $16, $C7 ; SPRITE C7   | xy: { 0x160, 0x180, U } | s: 0x00
#_09DA5D: db $FE, $00, $E4 ; small key on above sprite
#_09DA60: db $18, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x180, U } | s: 0x00
#_09DA63: db $1A, $14, $7C ; SPRITE 7C   | xy: { 0x140, 0x1A0, U } | s: 0x00
#_09DA66: db $1B, $1B, $D1 ; SPRITE D1   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
#_09DA69: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0014:
#_09DA6A: db $01 ; Layered OAM
#_09DA6B: db $84, $0C, $B0 ; SPRITE B0   | xy: { 0x0C0, 0x040, L } | s: 0x00
#_09DA6E: db $8A, $0F, $AF ; SPRITE AF   | xy: { 0x0F0, 0x0A0, L } | s: 0x00
#_09DA71: db $8A, $19, $AE ; SPRITE AE   | xy: { 0x190, 0x0A0, L } | s: 0x00
#_09DA74: db $8D, $03, $AE ; SPRITE AE   | xy: { 0x030, 0x0D0, L } | s: 0x00
#_09DA77: db $8D, $1B, $AE ; SPRITE AE   | xy: { 0x1B0, 0x0D0, L } | s: 0x00
#_09DA7A: db $93, $0F, $AE ; SPRITE AE   | xy: { 0x0F0, 0x130, L } | s: 0x00
#_09DA7D: db $98, $08, $B0 ; SPRITE B0   | xy: { 0x080, 0x180, L } | s: 0x00
#_09DA80: db $98, $17, $B1 ; SPRITE B1   | xy: { 0x170, 0x180, L } | s: 0x00
#_09DA83: db $9B, $0C, $B0 ; SPRITE B0   | xy: { 0x0C0, 0x1B0, L } | s: 0x00
#_09DA86: db $9B, $13, $B1 ; SPRITE B1   | xy: { 0x130, 0x1B0, L } | s: 0x00
#_09DA89: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0015:
#_09DA8A: db $01 ; Layered OAM
#_09DA8B: db $8C, $04, $AE ; SPRITE AE   | xy: { 0x040, 0x0C0, L } | s: 0x00
#_09DA8E: db $91, $11, $AE ; SPRITE AE   | xy: { 0x110, 0x110, L } | s: 0x00
#_09DA91: db $97, $04, $AF ; SPRITE AF   | xy: { 0x040, 0x170, L } | s: 0x00
#_09DA94: db $9B, $16, $B1 ; SPRITE B1   | xy: { 0x160, 0x1B0, L } | s: 0x00
#_09DA97: db $89, $0A, $8F ; SPRITE 8F   | xy: { 0x0A0, 0x090, L } | s: 0x00
#_09DA9A: db $89, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x090, L } | s: 0x00
#_09DA9D: db $8A, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x0A0, L } | s: 0x00
#_09DAA0: db $96, $18, $C7 ; SPRITE C7   | xy: { 0x180, 0x160, L } | s: 0x00
#_09DAA3: db $97, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x170, L } | s: 0x00
#_09DAA6: db $97, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x170, L } | s: 0x00
#_09DAA9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0016:
#_09DAAA: db $00 ; Unlayered OAM
#_09DAAB: db $07, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x070, U } | s: 0x00
#_09DAAE: db $08, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x080, U } | s: 0x00
#_09DAB1: db $09, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x090, U } | s: 0x00
#_09DAB4: db $0A, $10, $8F ; SPRITE 8F   | xy: { 0x100, 0x0A0, U } | s: 0x00
#_09DAB7: db $98, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x180, L } | s: 0x00
#_09DABA: db $9B, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x1B0, L } | s: 0x00
#_09DABD: db $9B, $14, $81 ; SPRITE 81   | xy: { 0x140, 0x1B0, L } | s: 0x00
#_09DAC0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0017:
#_09DAC1: db $00 ; Unlayered OAM
#_09DAC2: db $0B, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x0B0, U } | s: 0x00
#_09DAC5: db $0E, $10, $93 ; SPRITE 93   | xy: { 0x100, 0x0E0, U } | s: 0x00
#_09DAC8: db $16, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x160, U } | s: 0x00
#_09DACB: db $07, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x070, U } | s: 0x00
#_09DACE: db $09, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x090, U } | s: 0x00
#_09DAD1: db $11, $06, $7E ; SPRITE 7E   | xy: { 0x060, 0x110, U } | s: 0x00
#_09DAD4: db $11, $12, $26 ; SPRITE 26   | xy: { 0x120, 0x110, U } | s: 0x00
#_09DAD7: db $17, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x170, U } | s: 0x00
#_09DADA: db $17, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x170, U } | s: 0x00
#_09DADD: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0019:
#_09DADE: db $00 ; Unlayered OAM
#_09DADF: db $0A, $16, $86 ; SPRITE 86   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09DAE2: db $0E, $1A, $86 ; SPRITE 86   | xy: { 0x1A0, 0x0E0, U } | s: 0x00
#_09DAE5: db $10, $16, $86 ; SPRITE 86   | xy: { 0x160, 0x100, U } | s: 0x00
#_09DAE8: db $16, $18, $86 ; SPRITE 86   | xy: { 0x180, 0x160, U } | s: 0x00
#_09DAEB: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001A:
#_09DAEC: db $00 ; Unlayered OAM
#_09DAED: db $06, $08, $13 ; SPRITE 13   | xy: { 0x080, 0x060, U } | s: 0x00
#_09DAF0: db $06, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x060, U } | s: 0x00
#_09DAF3: db $06, $19, $8E ; SPRITE 8E   | xy: { 0x190, 0x060, U } | s: 0x00
#_09DAF6: db $0A, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09DAF9: db $0A, $19, $8E ; SPRITE 8E   | xy: { 0x190, 0x0A0, U } | s: 0x00
#_09DAFC: db $10, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x100, U } | s: 0x00
#_09DAFF: db $15, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x150, U } | s: 0x00
#_09DB02: db $17, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x170, U } | s: 0x00
#_09DB05: db $19, $15, $1C ; SPRITE 1C   | xy: { 0x150, 0x190, U } | s: 0x00
#_09DB08: db $19, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x190, U } | s: 0x00
#_09DB0B: db $1A, $E7, $0B ; OVERLORD 0B | xy: { 0x070, 0x1A0, U }
#_09DB0E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001B:
#_09DB0F: db $00 ; Unlayered OAM
#_09DB10: db $04, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x040, U } | s: 0x00
#_09DB13: db $04, $10, $38 ; SPRITE 38   | xy: { 0x100, 0x040, U } | s: 0x00
#_09DB16: db $0C, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x0C0, U } | s: 0x00
#_09DB19: db $14, $07, $84 ; SPRITE 84   | xy: { 0x070, 0x140, U } | s: 0x00
#_09DB1C: db $1C, $03, $83 ; SPRITE 83   | xy: { 0x030, 0x1C0, U } | s: 0x00
#_09DB1F: db $1C, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x1C0, U } | s: 0x00
#_09DB22: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001C:
#_09DB23: db $00 ; Unlayered OAM
#_09DB24: db $15, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x150, U } | s: 0x00
#_09DB27: db $15, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x150, U } | s: 0x00
#_09DB2A: db $15, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x150, U } | s: 0x00
#_09DB2D: db $18, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x180, U } | s: 0x00
#_09DB30: db $18, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x180, U } | s: 0x00
#_09DB33: db $18, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x180, U } | s: 0x00
#_09DB36: db $18, $F7, $19 ; OVERLORD 19 | xy: { 0x170, 0x180, U }
#_09DB39: db $07, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x070, U } | s: 0x00
#_09DB3C: db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
#_09DB3F: db $08, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x080, U } | s: 0x00
#_09DB42: db $08, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x080, U } | s: 0x00
#_09DB45: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001E:
#_09DB46: db $00 ; Unlayered OAM
#_09DB47: db $09, $1A, $1E ; SPRITE 1E   | xy: { 0x1A0, 0x090, U } | s: 0x00
#_09DB4A: db $05, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x050, U } | s: 0x00
#_09DB4D: db $05, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x050, U } | s: 0x00
#_09DB50: db $0A, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09DB53: db $0A, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x0A0, U } | s: 0x00
#_09DB56: db $18, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x180, U } | s: 0x00
#_09DB59: db $1C, $05, $8F ; SPRITE 8F   | xy: { 0x050, 0x1C0, U } | s: 0x00
#_09DB5C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001F:
#_09DB5D: db $00 ; Unlayered OAM
#_09DB5E: db $15, $04, $99 ; SPRITE 99   | xy: { 0x040, 0x150, U } | s: 0x00
#_09DB61: db $15, $09, $99 ; SPRITE 99   | xy: { 0x090, 0x150, U } | s: 0x00
#_09DB64: db $16, $06, $15 ; SPRITE 15   | xy: { 0x060, 0x160, U } | s: 0x00
#_09DB67: db $17, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x170, U } | s: 0x00
#_09DB6A: db $17, $0A, $99 ; SPRITE 99   | xy: { 0x0A0, 0x170, U } | s: 0x00
#_09DB6D: db $19, $0A, $99 ; SPRITE 99   | xy: { 0x0A0, 0x190, U } | s: 0x00
#_09DB70: db $1B, $04, $99 ; SPRITE 99   | xy: { 0x040, 0x1B0, U } | s: 0x00
#_09DB73: db $1B, $09, $99 ; SPRITE 99   | xy: { 0x090, 0x1B0, U } | s: 0x00
#_09DB76: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0020:
#_09DB77: db $00 ; Unlayered OAM
#_09DB78: db $15, $07, $7A ; SPRITE 7A   | xy: { 0x070, 0x150, U } | s: 0x00
#_09DB7B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0021:
#_09DB7C: db $00 ; Unlayered OAM
#_09DB7D: db $06, $05, $6D ; SPRITE 6D   | xy: { 0x050, 0x060, U } | s: 0x00
#_09DB80: db $FE, $00, $E4 ; small key on above sprite
#_09DB83: db $06, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x060, U } | s: 0x00
#_09DB86: db $06, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x060, U } | s: 0x00
#_09DB89: db $09, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x090, U } | s: 0x00
#_09DB8C: db $0A, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x0A0, U } | s: 0x00
#_09DB8F: db $14, $07, $6D ; SPRITE 6D   | xy: { 0x070, 0x140, U } | s: 0x00
#_09DB92: db $14, $0D, $6F ; SPRITE 6F   | xy: { 0x0D0, 0x140, U } | s: 0x00
#_09DB95: db $14, $12, $6F ; SPRITE 6F   | xy: { 0x120, 0x140, U } | s: 0x00
#_09DB98: db $18, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x180, U } | s: 0x00
#_09DB9B: db $1C, $0A, $6D ; SPRITE 6D   | xy: { 0x0A0, 0x1C0, U } | s: 0x00
#_09DB9E: db $1C, $13, $6D ; SPRITE 6D   | xy: { 0x130, 0x1C0, U } | s: 0x00
#_09DBA1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0022:
#_09DBA2: db $00 ; Unlayered OAM
#_09DBA3: db $14, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x140, U } | s: 0x00
#_09DBA6: db $14, $08, $6D ; SPRITE 6D   | xy: { 0x080, 0x140, U } | s: 0x00
#_09DBA9: db $14, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x140, U } | s: 0x00
#_09DBAC: db $14, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x140, U } | s: 0x00
#_09DBAF: db $15, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x150, U } | s: 0x00
#_09DBB2: db $15, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x150, U } | s: 0x00
#_09DBB5: db $18, $09, $6D ; SPRITE 6D   | xy: { 0x090, 0x180, U } | s: 0x00
#_09DBB8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0023:
#_09DBB9: db $00 ; Unlayered OAM
#_09DBBA: db $14, $15, $97 ; SPRITE 97   | xy: { 0x150, 0x140, U } | s: 0x00
#_09DBBD: db $14, $16, $97 ; SPRITE 97   | xy: { 0x160, 0x140, U } | s: 0x00
#_09DBC0: db $14, $17, $97 ; SPRITE 97   | xy: { 0x170, 0x140, U } | s: 0x00
#_09DBC3: db $14, $18, $97 ; SPRITE 97   | xy: { 0x180, 0x140, U } | s: 0x00
#_09DBC6: db $14, $19, $97 ; SPRITE 97   | xy: { 0x190, 0x140, U } | s: 0x00
#_09DBC9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0024:
#_09DBCA: db $00 ; Unlayered OAM
#_09DBCB: db $04, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x040, U } | s: 0x00
#_09DBCE: db $04, $1C, $C5 ; SPRITE C5   | xy: { 0x1C0, 0x040, U } | s: 0x00
#_09DBD1: db $06, $1B, $60 ; SPRITE 60   | xy: { 0x1B0, 0x060, U } | s: 0x00
#_09DBD4: db $08, $05, $C7 ; SPRITE C7   | xy: { 0x050, 0x080, U } | s: 0x00
#_09DBD7: db $08, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x080, U } | s: 0x00
#_09DBDA: db $08, $0A, $C7 ; SPRITE C7   | xy: { 0x0A0, 0x080, U } | s: 0x00
#_09DBDD: db $0C, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09DBE0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0025:
#_09DBE1: db $00 ; Unlayered OAM
#_09DBE2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0026:
#_09DBE3: db $00 ; Unlayered OAM
#_09DBE4: db $04, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x040, U } | s: 0x00
#_09DBE7: db $05, $1A, $23 ; SPRITE 23   | xy: { 0x1A0, 0x050, U } | s: 0x00
#_09DBEA: db $06, $05, $23 ; SPRITE 23   | xy: { 0x050, 0x060, U } | s: 0x00
#_09DBED: db $06, $09, $A7 ; SPRITE A7   | xy: { 0x090, 0x060, U } | s: 0x00
#_09DBF0: db $09, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x090, U } | s: 0x00
#_09DBF3: db $0C, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09DBF6: db $17, $06, $1C ; SPRITE 1C   | xy: { 0x060, 0x170, U } | s: 0x00
#_09DBF9: db $17, $19, $C6 ; SPRITE C6   | xy: { 0x190, 0x170, U } | s: 0x00
#_09DBFC: db $18, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x180, U } | s: 0x00
#_09DBFF: db $18, $15, $9A ; SPRITE 9A   | xy: { 0x150, 0x180, U } | s: 0x00
#_09DC02: db $19, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x190, U } | s: 0x00
#_09DC05: db $1A, $1C, $80 ; SPRITE 80   | xy: { 0x1C0, 0x1A0, U } | s: 0x00
#_09DC08: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0027:
#_09DC09: db $00 ; Unlayered OAM
#_09DC0A: db $09, $17, $18 ; SPRITE 18   | xy: { 0x170, 0x090, U } | s: 0x00
#_09DC0D: db $13, $18, $18 ; SPRITE 18   | xy: { 0x180, 0x130, U } | s: 0x00
#_09DC10: db $13, $1B, $18 ; SPRITE 18   | xy: { 0x1B0, 0x130, U } | s: 0x00
#_09DC13: db $1A, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
#_09DC16: db $06, $0F, $5B ; SPRITE 5B   | xy: { 0x0F0, 0x060, U } | s: 0x00
#_09DC19: db $0E, $05, $86 ; SPRITE 86   | xy: { 0x050, 0x0E0, U } | s: 0x00
#_09DC1C: db $16, $04, $86 ; SPRITE 86   | xy: { 0x040, 0x160, U } | s: 0x00
#_09DC1F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0028:
#_09DC20: db $00 ; Unlayered OAM
#_09DC21: db $06, $0A, $9A ; SPRITE 9A   | xy: { 0x0A0, 0x060, U } | s: 0x00
#_09DC24: db $08, $08, $81 ; SPRITE 81   | xy: { 0x080, 0x080, U } | s: 0x00
#_09DC27: db $0A, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
#_09DC2A: db $0D, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0D0, U } | s: 0x00
#_09DC2D: db $10, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x100, U } | s: 0x00
#_09DC30: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0029:
#_09DC31: db $00 ; Unlayered OAM
#_09DC32: db $16, $18, $88 ; SPRITE 88   | xy: { 0x180, 0x160, U } | s: 0x00
#_09DC35: db $16, $E7, $07 ; OVERLORD 07 | xy: { 0x070, 0x160, U }
#_09DC38: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002A:
#_09DC39: db $00 ; Unlayered OAM
#_09DC3A: db $17, $10, $1E ; SPRITE 1E   | xy: { 0x100, 0x170, U } | s: 0x00
#_09DC3D: db $0F, $0F, $93 ; SPRITE 93   | xy: { 0x0F0, 0x0F0, U } | s: 0x00
#_09DC40: db $08, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x080, U } | s: 0x00
#_09DC43: db $0C, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x0C0, U } | s: 0x00
#_09DC46: db $0C, $10, $26 ; SPRITE 26   | xy: { 0x100, 0x0C0, U } | s: 0x00
#_09DC49: db $0F, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x0F0, U } | s: 0x00
#_09DC4C: db $11, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x110, U } | s: 0x00
#_09DC4F: db $13, $0F, $26 ; SPRITE 26   | xy: { 0x0F0, 0x130, U } | s: 0x00
#_09DC52: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002B:
#_09DC53: db $00 ; Unlayered OAM
#_09DC54: db $11, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x110, U } | s: 0x00
#_09DC57: db $0A, $0A, $1C ; SPRITE 1C   | xy: { 0x0A0, 0x0A0, U } | s: 0x00
#_09DC5A: db $17, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x170, U } | s: 0x00
#_09DC5D: db $17, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x170, U } | s: 0x00
#_09DC60: db $18, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x180, U } | s: 0x00
#_09DC63: db $1A, $05, $23 ; SPRITE 23   | xy: { 0x050, 0x1A0, U } | s: 0x00
#_09DC66: db $1A, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
#_09DC69: db $1A, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09DC6C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002C:
#_09DC6D: db $00 ; Unlayered OAM
#_09DC6E: db $05, $17, $C8 ; SPRITE C8   | xy: { 0x170, 0x050, U } | s: 0x00
#_09DC71: db $04, $09, $E3 ; SPRITE E3   | xy: { 0x090, 0x040, U } | s: 0x00
#_09DC74: db $05, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x050, U } | s: 0x00
#_09DC77: db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
#_09DC7A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002E:
#_09DC7B: db $00 ; Unlayered OAM
#_09DC7C: db $06, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x060, U } | s: 0x00
#_09DC7F: db $06, $1C, $99 ; SPRITE 99   | xy: { 0x1C0, 0x060, U } | s: 0x00
#_09DC82: db $08, $16, $99 ; SPRITE 99   | xy: { 0x160, 0x080, U } | s: 0x00
#_09DC85: db $08, $19, $99 ; SPRITE 99   | xy: { 0x190, 0x080, U } | s: 0x00
#_09DC88: db $0B, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x0B0, U } | s: 0x00
#_09DC8B: db $0B, $1B, $99 ; SPRITE 99   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09DC8E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0030:
#_09DC8F: db $00 ; Unlayered OAM
#_09DC90: db $05, $07, $C1 ; SPRITE C1   | xy: { 0x070, 0x050, U } | s: 0x00
#_09DC93: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0031:
#_09DC94: db $00 ; Unlayered OAM
#_09DC95: db $1A, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x1A0, U } | s: 0x00
#_09DC98: db $0B, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x0B0, U } | s: 0x00
#_09DC9B: db $05, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x050, U } | s: 0x00
#_09DC9E: db $06, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x060, U } | s: 0x00
#_09DCA1: db $09, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x090, U } | s: 0x00
#_09DCA4: db $0C, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
#_09DCA7: db $15, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x150, U } | s: 0x00
#_09DCAA: db $15, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x150, U } | s: 0x00
#_09DCAD: db $16, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x160, U } | s: 0x00
#_09DCB0: db $18, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x180, U } | s: 0x00
#_09DCB3: db $19, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x190, U } | s: 0x00
#_09DCB6: db $1C, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x1C0, U } | s: 0x00
#_09DCB9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0032:
#_09DCBA: db $00 ; Unlayered OAM
#_09DCBB: db $0D, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0D0, U } | s: 0x00
#_09DCBE: db $0D, $0F, $6E ; SPRITE 6E   | xy: { 0x0F0, 0x0D0, U } | s: 0x00
#_09DCC1: db $0D, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x0D0, U } | s: 0x00
#_09DCC4: db $0E, $10, $6E ; SPRITE 6E   | xy: { 0x100, 0x0E0, U } | s: 0x00
#_09DCC7: db $0F, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x0F0, U } | s: 0x00
#_09DCCA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0033:
#_09DCCB: db $00 ; Unlayered OAM
#_09DCCC: db $17, $06, $54 ; SPRITE 54   | xy: { 0x060, 0x170, U } | s: 0x00
#_09DCCF: db $17, $09, $54 ; SPRITE 54   | xy: { 0x090, 0x170, U } | s: 0x00
#_09DCD2: db $19, $07, $54 ; SPRITE 54   | xy: { 0x070, 0x190, U } | s: 0x00
#_09DCD5: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0034:
#_09DCD6: db $00 ; Unlayered OAM
#_09DCD7: db $0B, $0F, $81 ; SPRITE 81   | xy: { 0x0F0, 0x0B0, U } | s: 0x00
#_09DCDA: db $12, $10, $81 ; SPRITE 81   | xy: { 0x100, 0x120, U } | s: 0x00
#_09DCDD: db $15, $0F, $9A ; SPRITE 9A   | xy: { 0x0F0, 0x150, U } | s: 0x00
#_09DCE0: db $17, $19, $80 ; SPRITE 80   | xy: { 0x190, 0x170, U } | s: 0x00
#_09DCE3: db $18, $03, $8F ; SPRITE 8F   | xy: { 0x030, 0x180, U } | s: 0x00
#_09DCE6: db $18, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x180, U } | s: 0x00
#_09DCE9: db $1A, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x1A0, U } | s: 0x00
#_09DCEC: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0035:
#_09DCED: db $00 ; Unlayered OAM
#_09DCEE: db $06, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x060, U } | s: 0x00
#_09DCF1: db $05, $14, $21 ; SPRITE 21   | xy: { 0x140, 0x050, U } | s: 0x00
#_09DCF4: db $05, $18, $23 ; SPRITE 23   | xy: { 0x180, 0x050, U } | s: 0x00
#_09DCF7: db $09, $13, $8A ; SPRITE 8A   | xy: { 0x130, 0x090, U } | s: 0x00
#_09DCFA: db $0B, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x0B0, U } | s: 0x00
#_09DCFD: db $14, $07, $8F ; SPRITE 8F   | xy: { 0x070, 0x140, U } | s: 0x00
#_09DD00: db $18, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x180, U } | s: 0x00
#_09DD03: db $19, $16, $80 ; SPRITE 80   | xy: { 0x160, 0x190, U } | s: 0x00
#_09DD06: db $1A, $17, $C6 ; SPRITE C6   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09DD09: db $1B, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09DD0C: db $1C, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
#_09DD0F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0036:
#_09DD10: db $00 ; Unlayered OAM
#_09DD11: db $02, $F7, $12 ; OVERLORD 12 | xy: { 0x170, 0x020, U }
#_09DD14: db $0A, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
#_09DD17: db $0A, $14, $81 ; SPRITE 81   | xy: { 0x140, 0x0A0, U } | s: 0x00
#_09DD1A: db $0B, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x0B0, U } | s: 0x00
#_09DD1D: db $0D, $E1, $10 ; OVERLORD 10 | xy: { 0x010, 0x0D0, U }
#_09DD20: db $13, $14, $9A ; SPRITE 9A   | xy: { 0x140, 0x130, U } | s: 0x00
#_09DD23: db $13, $FE, $11 ; OVERLORD 11 | xy: { 0x1E0, 0x130, U }
#_09DD26: db $14, $09, $81 ; SPRITE 81   | xy: { 0x090, 0x140, U } | s: 0x00
#_09DD29: db $17, $12, $81 ; SPRITE 81   | xy: { 0x120, 0x170, U } | s: 0x00
#_09DD2C: db $1E, $EA, $13 ; OVERLORD 13 | xy: { 0x0A0, 0x1E0, U }
#_09DD2F: db $1E, $F4, $13 ; OVERLORD 13 | xy: { 0x140, 0x1E0, U }
#_09DD32: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0037:
#_09DD33: db $00 ; Unlayered OAM
#_09DD34: db $04, $0B, $21 ; SPRITE 21   | xy: { 0x0B0, 0x040, U } | s: 0x00
#_09DD37: db $06, $05, $A7 ; SPRITE A7   | xy: { 0x050, 0x060, U } | s: 0x00
#_09DD3A: db $08, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x080, U } | s: 0x00
#_09DD3D: db $08, $1A, $8F ; SPRITE 8F   | xy: { 0x1A0, 0x080, U } | s: 0x00
#_09DD40: db $09, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x090, U } | s: 0x00
#_09DD43: db $14, $15, $80 ; SPRITE 80   | xy: { 0x150, 0x140, U } | s: 0x00
#_09DD46: db $17, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x170, U } | s: 0x00
#_09DD49: db $19, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x190, U } | s: 0x00
#_09DD4C: db $1A, $17, $C6 ; SPRITE C6   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09DD4F: db $1C, $15, $23 ; SPRITE 23   | xy: { 0x150, 0x1C0, U } | s: 0x00
#_09DD52: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0038:
#_09DD53: db $00 ; Unlayered OAM
#_09DD54: db $06, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x060, U } | s: 0x00
#_09DD57: db $0A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0A0, U } | s: 0x00
#_09DD5A: db $0C, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09DD5D: db $10, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x100, U } | s: 0x00
#_09DD60: db $14, $06, $9A ; SPRITE 9A   | xy: { 0x060, 0x140, U } | s: 0x00
#_09DD63: db $18, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x180, U } | s: 0x00
#_09DD66: db $1A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x1A0, U } | s: 0x00
#_09DD69: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0039:
#_09DD6A: db $00 ; Unlayered OAM
#_09DD6B: db $18, $04, $18 ; SPRITE 18   | xy: { 0x040, 0x180, U } | s: 0x00
#_09DD6E: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09DD71: db $15, $05, $8B ; SPRITE 8B   | xy: { 0x050, 0x150, U } | s: 0x00
#_09DD74: db $FE, $00, $E4 ; small key on above sprite
#_09DD77: db $15, $09, $13 ; SPRITE 13   | xy: { 0x090, 0x150, U } | s: 0x00
#_09DD7A: db $16, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x160, U } | s: 0x00
#_09DD7D: db $18, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09DD80: db $1A, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09DD83: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003A:
#_09DD84: db $00 ; Unlayered OAM
#_09DD85: db $11, $0E, $8E ; SPRITE 8E   | xy: { 0x0E0, 0x110, U } | s: 0x00
#_09DD88: db $11, $11, $8E ; SPRITE 8E   | xy: { 0x110, 0x110, U } | s: 0x00
#_09DD8B: db $14, $04, $C5 ; SPRITE C5   | xy: { 0x040, 0x140, U } | s: 0x00
#_09DD8E: db $14, $0A, $24 ; SPRITE 24   | xy: { 0x0A0, 0x140, U } | s: 0x00
#_09DD91: db $14, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x140, U } | s: 0x00
#_09DD94: db $14, $1B, $C5 ; SPRITE C5   | xy: { 0x1B0, 0x140, U } | s: 0x00
#_09DD97: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003B:
#_09DD98: db $00 ; Unlayered OAM
#_09DD99: db $06, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x060, U } | s: 0x00
#_09DD9C: db $09, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x090, U } | s: 0x00
#_09DD9F: db $0D, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x0D0, U } | s: 0x00
#_09DDA2: db $0F, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x0F0, U } | s: 0x00
#_09DDA5: db $13, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x130, U } | s: 0x00
#_09DDA8: db $16, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x160, U } | s: 0x00
#_09DDAB: db $1A, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
#_09DDAE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003C:
#_09DDAF: db $00 ; Unlayered OAM
#_09DDB0: db $08, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x080, U } | s: 0x00
#_09DDB3: db $14, $0A, $24 ; SPRITE 24   | xy: { 0x0A0, 0x140, U } | s: 0x00
#_09DDB6: db $14, $12, $24 ; SPRITE 24   | xy: { 0x120, 0x140, U } | s: 0x00
#_09DDB9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003D:
#_09DDBA: db $00 ; Unlayered OAM
#_09DDBB: db $17, $05, $1E ; SPRITE 1E   | xy: { 0x050, 0x170, U } | s: 0x00
#_09DDBE: db $19, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x190, U } | s: 0x00
#_09DDC1: db $07, $17, $13 ; SPRITE 13   | xy: { 0x170, 0x070, U } | s: 0x00
#_09DDC4: db $FE, $00, $E4 ; small key on above sprite
#_09DDC7: db $07, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x070, U } | s: 0x00
#_09DDCA: db $08, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x080, U } | s: 0x00
#_09DDCD: db $08, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x080, U } | s: 0x00
#_09DDD0: db $0A, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x0A0, U } | s: 0x00
#_09DDD3: db $0B, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x0B0, U } | s: 0x00
#_09DDD6: db $15, $FB, $0A ; OVERLORD 0A | xy: { 0x1B0, 0x150, U }
#_09DDD9: db $16, $13, $5C ; SPRITE 5C   | xy: { 0x130, 0x160, U } | s: 0x00
#_09DDDC: db $16, $1C, $5B ; SPRITE 5B   | xy: { 0x1C0, 0x160, U } | s: 0x00
#_09DDDF: db $16, $09, $5B ; SPRITE 5B   | xy: { 0x090, 0x160, U } | s: 0x00
#_09DDE2: db $17, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x170, U } | s: 0x00
#_09DDE5: db $17, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x170, U } | s: 0x00
#_09DDE8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003E:
#_09DDE9: db $00 ; Unlayered OAM
#_09DDEA: db $15, $06, $1E ; SPRITE 1E   | xy: { 0x060, 0x150, U } | s: 0x00
#_09DDED: db $04, $19, $91 ; SPRITE 91   | xy: { 0x190, 0x040, U } | s: 0x00
#_09DDF0: db $0B, $16, $91 ; SPRITE 91   | xy: { 0x160, 0x0B0, U } | s: 0x00
#_09DDF3: db $12, $05, $9D ; SPRITE 9D   | xy: { 0x050, 0x120, U } | s: 0x00
#_09DDF6: db $12, $0E, $9D ; SPRITE 9D   | xy: { 0x0E0, 0x120, U } | s: 0x00
#_09DDF9: db $12, $F0, $07 ; OVERLORD 07 | xy: { 0x100, 0x120, U }
#_09DDFC: db $12, $12, $9D ; SPRITE 9D   | xy: { 0x120, 0x120, U } | s: 0x00
#_09DDFF: db $12, $15, $9D ; SPRITE 9D   | xy: { 0x150, 0x120, U } | s: 0x00
#_09DE02: db $16, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x160, U } | s: 0x00
#_09DE05: db $18, $11, $24 ; SPRITE 24   | xy: { 0x110, 0x180, U } | s: 0x00
#_09DE08: db $FE, $00, $E4 ; small key on above sprite
#_09DE0B: db $19, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x190, U } | s: 0x00
#_09DE0E: db $1A, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
#_09DE11: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003F:
#_09DE12: db $00 ; Unlayered OAM
#_09DE13: db $15, $04, $04 ; SPRITE 04   | xy: { 0x040, 0x150, U } | s: 0x00
#_09DE16: db $16, $0C, $91 ; SPRITE 91   | xy: { 0x0C0, 0x160, U } | s: 0x00
#_09DE19: db $15, $13, $04 ; SPRITE 04   | xy: { 0x130, 0x150, U } | s: 0x00
#_09DE1C: db $17, $04, $91 ; SPRITE 91   | xy: { 0x040, 0x170, U } | s: 0x00
#_09DE1F: db $18, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x180, U } | s: 0x00
#_09DE22: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0040:
#_09DE23: db $00 ; Unlayered OAM
#_09DE24: db $88, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x080, L } | s: 0x00
#_09DE27: db $EF, $69, $41 ; SPRITE 41   | xy: { 0x090, 0x0F0, L } | s: 0x1B
#_09DE2A: db $95, $18, $1C ; SPRITE 1C   | xy: { 0x180, 0x150, L } | s: 0x00
#_09DE2D: db $98, $1B, $43 ; SPRITE 43   | xy: { 0x1B0, 0x180, L } | s: 0x00
#_09DE30: db $9A, $17, $46 ; SPRITE 46   | xy: { 0x170, 0x1A0, L } | s: 0x00
#_09DE33: db $9A, $19, $46 ; SPRITE 46   | xy: { 0x190, 0x1A0, L } | s: 0x00
#_09DE36: db $FF ; END

;===================================================================================================

UNREACHABLE_09DE37:
#_09DE37: db $00 ; Unlayered OAM
#_09DE38: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0041:
#_09DE39: db $00 ; Unlayered OAM
#_09DE3A: db $0A, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x0A0, U } | s: 0x00
#_09DE3D: db $0B, $1B, $6D ; SPRITE 6D   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09DE40: db $0D, $0F, $6D ; SPRITE 6D   | xy: { 0x0F0, 0x0D0, U } | s: 0x00
#_09DE43: db $15, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x150, U } | s: 0x00
#_09DE46: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0042:
#_09DE47: db $00 ; Unlayered OAM
#_09DE48: db $06, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x060, U } | s: 0x00
#_09DE4B: db $06, $13, $6E ; SPRITE 6E   | xy: { 0x130, 0x060, U } | s: 0x00
#_09DE4E: db $06, $14, $6E ; SPRITE 6E   | xy: { 0x140, 0x060, U } | s: 0x00
#_09DE51: db $07, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x070, U } | s: 0x00
#_09DE54: db $07, $13, $6E ; SPRITE 6E   | xy: { 0x130, 0x070, U } | s: 0x00
#_09DE57: db $07, $14, $6E ; SPRITE 6E   | xy: { 0x140, 0x070, U } | s: 0x00
#_09DE5A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0043:
#_09DE5B: db $00 ; Unlayered OAM
#_09DE5C: db $06, $0C, $84 ; SPRITE 84   | xy: { 0x0C0, 0x060, U } | s: 0x00
#_09DE5F: db $18, $F7, $14 ; OVERLORD 14 | xy: { 0x170, 0x180, U }
#_09DE62: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0044:
#_09DE63: db $00 ; Unlayered OAM
#_09DE64: db $06, $09, $93 ; SPRITE 93   | xy: { 0x090, 0x060, U } | s: 0x00
#_09DE67: db $08, $05, $93 ; SPRITE 93   | xy: { 0x050, 0x080, U } | s: 0x00
#_09DE6A: db $04, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x040, U } | s: 0x00
#_09DE6D: db $08, $03, $24 ; SPRITE 24   | xy: { 0x030, 0x080, U } | s: 0x00
#_09DE70: db $08, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x080, U } | s: 0x00
#_09DE73: db $0C, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x0C0, U } | s: 0x00
#_09DE76: db $0F, $17, $23 ; SPRITE 23   | xy: { 0x170, 0x0F0, U } | s: 0x00
#_09DE79: db $15, $EB, $0A ; OVERLORD 0A | xy: { 0x0B0, 0x150, U }
#_09DE7C: db $16, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x160, U } | s: 0x00
#_09DE7F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0045:
#_09DE80: db $00 ; Unlayered OAM
#_09DE81: db $06, $19, $B7 ; SPRITE B7   | xy: { 0x190, 0x060, U } | s: 0x00
#_09DE84: db $06, $06, $A6 ; SPRITE A6   | xy: { 0x060, 0x060, U } | s: 0x00
#_09DE87: db $0B, $04, $A5 ; SPRITE A5   | xy: { 0x040, 0x0B0, U } | s: 0x00
#_09DE8A: db $0B, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
#_09DE8D: db $0B, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x0B0, U } | s: 0x00
#_09DE90: db $0C, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x0C0, U } | s: 0x00
#_09DE93: db $0C, $1A, $A5 ; SPRITE A5   | xy: { 0x1A0, 0x0C0, U } | s: 0x00
#_09DE96: db $11, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x110, U } | s: 0x00
#_09DE99: db $18, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x180, U } | s: 0x00
#_09DE9C: db $1B, $19, $A6 ; SPRITE A6   | xy: { 0x190, 0x1B0, U } | s: 0x00
#_09DE9F: db $1C, $07, $A6 ; SPRITE A6   | xy: { 0x070, 0x1C0, U } | s: 0x00
#_09DEA2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0046:
#_09DEA3: db $00 ; Unlayered OAM
#_09DEA4: db $05, $16, $81 ; SPRITE 81   | xy: { 0x160, 0x050, U } | s: 0x00
#_09DEA7: db $06, $FB, $11 ; OVERLORD 11 | xy: { 0x1B0, 0x060, U }
#_09DEAA: db $1A, $09, $81 ; SPRITE 81   | xy: { 0x090, 0x1A0, U } | s: 0x00
#_09DEAD: db $1A, $FB, $11 ; OVERLORD 11 | xy: { 0x1B0, 0x1A0, U }
#_09DEB0: db $1B, $11, $81 ; SPRITE 81   | xy: { 0x110, 0x1B0, U } | s: 0x00
#_09DEB3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0047:
#_09DEB4: db $00 ; Unlayered OAM
#_09DEB5: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0049:
#_09DEB6: db $00 ; Unlayered OAM
#_09DEB7: db $05, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x050, U } | s: 0x00
#_09DEBA: db $0B, $04, $18 ; SPRITE 18   | xy: { 0x040, 0x0B0, U } | s: 0x00
#_09DEBD: db $0C, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x0C0, U } | s: 0x00
#_09DEC0: db $06, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x060, U } | s: 0x00
#_09DEC3: db $08, $07, $8B ; SPRITE 8B   | xy: { 0x070, 0x080, U } | s: 0x00
#_09DEC6: db $0B, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x0B0, U } | s: 0x00
#_09DEC9: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09DECC: db $10, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x100, U } | s: 0x00
#_09DECF: db $14, $16, $8B ; SPRITE 8B   | xy: { 0x160, 0x140, U } | s: 0x00
#_09DED2: db $16, $09, $24 ; SPRITE 24   | xy: { 0x090, 0x160, U } | s: 0x00
#_09DED5: db $17, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x170, U } | s: 0x00
#_09DED8: db $18, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x180, U } | s: 0x00
#_09DEDB: db $18, $1A, $8B ; SPRITE 8B   | xy: { 0x1A0, 0x180, U } | s: 0x00
#_09DEDE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004A:
#_09DEDF: db $00 ; Unlayered OAM
#_09DEE0: db $07, $14, $1C ; SPRITE 1C   | xy: { 0x140, 0x070, U } | s: 0x00
#_09DEE3: db $08, $08, $13 ; SPRITE 13   | xy: { 0x080, 0x080, U } | s: 0x00
#_09DEE6: db $08, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x080, U } | s: 0x00
#_09DEE9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004B:
#_09DEEA: db $00 ; Unlayered OAM
#_09DEEB: db $04, $07, $84 ; SPRITE 84   | xy: { 0x070, 0x040, U } | s: 0x00
#_09DEEE: db $05, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x050, U } | s: 0x00
#_09DEF1: db $06, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x060, U } | s: 0x00
#_09DEF4: db $08, $04, $83 ; SPRITE 83   | xy: { 0x040, 0x080, U } | s: 0x00
#_09DEF7: db $08, $0B, $83 ; SPRITE 83   | xy: { 0x0B0, 0x080, U } | s: 0x00
#_09DEFA: db $18, $0F, $24 ; SPRITE 24   | xy: { 0x0F0, 0x180, U } | s: 0x00
#_09DEFD: db $19, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x190, U } | s: 0x00
#_09DF00: db $19, $12, $24 ; SPRITE 24   | xy: { 0x120, 0x190, U } | s: 0x00
#_09DF03: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004C:
#_09DF04: db $00 ; Unlayered OAM
#_09DF05: db $11, $15, $93 ; SPRITE 93   | xy: { 0x150, 0x110, U } | s: 0x00
#_09DF08: db $12, $19, $93 ; SPRITE 93   | xy: { 0x190, 0x120, U } | s: 0x00
#_09DF0B: db $05, $15, $13 ; SPRITE 13   | xy: { 0x150, 0x050, U } | s: 0x00
#_09DF0E: db $05, $1A, $13 ; SPRITE 13   | xy: { 0x1A0, 0x050, U } | s: 0x00
#_09DF11: db $06, $17, $13 ; SPRITE 13   | xy: { 0x170, 0x060, U } | s: 0x00
#_09DF14: db $0A, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09DF17: db $15, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x150, U } | s: 0x00
#_09DF1A: db $18, $13, $8A ; SPRITE 8A   | xy: { 0x130, 0x180, U } | s: 0x00
#_09DF1D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004D:
#_09DF1E: db $00 ; Unlayered OAM
#_09DF1F: db $0E, $0E, $09 ; SPRITE 09   | xy: { 0x0E0, 0x0E0, U } | s: 0x00
#_09DF22: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004E:
#_09DF23: db $00 ; Unlayered OAM
#_09DF24: db $08, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x080, U } | s: 0x00
#_09DF27: db $08, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x080, U } | s: 0x00
#_09DF2A: db $08, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x080, U } | s: 0x00
#_09DF2D: db $09, $07, $7E ; SPRITE 7E   | xy: { 0x070, 0x090, U } | s: 0x00
#_09DF30: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004F:
#_09DF31: db $00 ; Unlayered OAM
#_09DF32: db $06, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x060, U } | s: 0x00
#_09DF35: db $08, $14, $E3 ; SPRITE E3   | xy: { 0x140, 0x080, U } | s: 0x00
#_09DF38: db $08, $1A, $E3 ; SPRITE E3   | xy: { 0x1A0, 0x080, U } | s: 0x00
#_09DF3B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0050:
#_09DF3C: db $00 ; Unlayered OAM
#_09DF3D: db $8E, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x0E0, L } | s: 0x00
#_09DF40: db $90, $18, $4B ; SPRITE 4B   | xy: { 0x180, 0x100, L } | s: 0x00
#_09DF43: db $92, $17, $4B ; SPRITE 4B   | xy: { 0x170, 0x120, L } | s: 0x00
#_09DF46: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0051:
#_09DF47: db $01 ; Layered OAM
#_09DF48: db $02, $0E, $EE ; SPRITE EE   | xy: { 0x0E0, 0x020, U } | s: 0x00
#_09DF4B: db $97, $29, $41 ; SPRITE 41   | xy: { 0x090, 0x170, L } | s: 0x01
#_09DF4E: db $97, $56, $41 ; SPRITE 41   | xy: { 0x160, 0x170, L } | s: 0x02
#_09DF51: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0052:
#_09DF52: db $00 ; Unlayered OAM
#_09DF53: db $8D, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x0D0, L } | s: 0x00
#_09DF56: db $8F, $08, $4B ; SPRITE 4B   | xy: { 0x080, 0x0F0, L } | s: 0x00
#_09DF59: db $92, $07, $4B ; SPRITE 4B   | xy: { 0x070, 0x120, L } | s: 0x00
#_09DF5C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0053:
#_09DF5D: db $00 ; Unlayered OAM
#_09DF5E: db $07, $17, $4E ; SPRITE 4E   | xy: { 0x170, 0x070, U } | s: 0x00
#_09DF61: db $09, $1C, $61 ; SPRITE 61   | xy: { 0x1C0, 0x090, U } | s: 0x00
#_09DF64: db $0C, $17, $4F ; SPRITE 4F   | xy: { 0x170, 0x0C0, U } | s: 0x00
#_09DF67: db $0C, $1A, $4F ; SPRITE 4F   | xy: { 0x1A0, 0x0C0, U } | s: 0x00
#_09DF6A: db $0E, $13, $61 ; SPRITE 61   | xy: { 0x130, 0x0E0, U } | s: 0x00
#_09DF6D: db $15, $05, $4E ; SPRITE 4E   | xy: { 0x050, 0x150, U } | s: 0x00
#_09DF70: db $16, $0B, $4E ; SPRITE 4E   | xy: { 0x0B0, 0x160, U } | s: 0x00
#_09DF73: db $17, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x170, U } | s: 0x00
#_09DF76: db $19, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x190, U } | s: 0x00
#_09DF79: db $1A, $04, $4E ; SPRITE 4E   | xy: { 0x040, 0x1A0, U } | s: 0x00
#_09DF7C: db $1A, $0B, $4E ; SPRITE 4E   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
#_09DF7F: db $1A, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
#_09DF82: db $1B, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x1B0, U } | s: 0x00
#_09DF85: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0054:
#_09DF86: db $00 ; Unlayered OAM
#_09DF87: db $05, $0E, $9A ; SPRITE 9A   | xy: { 0x0E0, 0x050, U } | s: 0x00
#_09DF8A: db $0B, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
#_09DF8D: db $0E, $0B, $C5 ; SPRITE C5   | xy: { 0x0B0, 0x0E0, U } | s: 0x00
#_09DF90: db $0E, $0F, $7E ; SPRITE 7E   | xy: { 0x0F0, 0x0E0, U } | s: 0x00
#_09DF93: db $0F, $10, $81 ; SPRITE 81   | xy: { 0x100, 0x0F0, U } | s: 0x00
#_09DF96: db $14, $12, $9A ; SPRITE 9A   | xy: { 0x120, 0x140, U } | s: 0x00
#_09DF99: db $15, $0F, $81 ; SPRITE 81   | xy: { 0x0F0, 0x150, U } | s: 0x00
#_09DF9C: db $17, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x170, U } | s: 0x00
#_09DF9F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0055:
#_09DFA0: db $00 ; Unlayered OAM
#_09DFA1: db $08, $0E, $73 ; SPRITE 73   | xy: { 0x0E0, 0x080, U } | s: 0x00
#_09DFA4: db $15, $14, $4B ; SPRITE 4B   | xy: { 0x140, 0x150, U } | s: 0x00
#_09DFA7: db $16, $0D, $4B ; SPRITE 4B   | xy: { 0x0D0, 0x160, U } | s: 0x00
#_09DFAA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0056:
#_09DFAB: db $00 ; Unlayered OAM
#_09DFAC: db $05, $EB, $0A ; OVERLORD 0A | xy: { 0x0B0, 0x050, U }
#_09DFAF: db $19, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x190, U } | s: 0x00
#_09DFB2: db $19, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x190, U } | s: 0x00
#_09DFB5: db $04, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x040, U } | s: 0x00
#_09DFB8: db $05, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x050, U } | s: 0x00
#_09DFBB: db $06, $03, $13 ; SPRITE 13   | xy: { 0x030, 0x060, U } | s: 0x00
#_09DFBE: db $06, $0C, $13 ; SPRITE 13   | xy: { 0x0C0, 0x060, U } | s: 0x00
#_09DFC1: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09DFC4: db $11, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x110, U } | s: 0x00
#_09DFC7: db $12, $18, $8A ; SPRITE 8A   | xy: { 0x180, 0x120, U } | s: 0x00
#_09DFCA: db $1B, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x1B0, U } | s: 0x00
#_09DFCD: db $1C, $13, $80 ; SPRITE 80   | xy: { 0x130, 0x1C0, U } | s: 0x00
#_09DFD0: db $1C, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x1C0, U } | s: 0x00
#_09DFD3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0057:
#_09DFD4: db $00 ; Unlayered OAM
#_09DFD5: db $04, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x040, U } | s: 0x00
#_09DFD8: db $04, $0C, $23 ; SPRITE 23   | xy: { 0x0C0, 0x040, U } | s: 0x00
#_09DFDB: db $05, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x050, U } | s: 0x00
#_09DFDE: db $07, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x070, U } | s: 0x00
#_09DFE1: db $0C, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x0C0, U } | s: 0x00
#_09DFE4: db $0C, $0C, $8B ; SPRITE 8B   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09DFE7: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09DFEA: db $14, $05, $8B ; SPRITE 8B   | xy: { 0x050, 0x140, U } | s: 0x00
#_09DFED: db $14, $0A, $8B ; SPRITE 8B   | xy: { 0x0A0, 0x140, U } | s: 0x00
#_09DFF0: db $14, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x140, U } | s: 0x00
#_09DFF3: db $14, $19, $8B ; SPRITE 8B   | xy: { 0x190, 0x140, U } | s: 0x00
#_09DFF6: db $15, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x150, U } | s: 0x00
#_09DFF9: db $17, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x170, U } | s: 0x00
#_09DFFC: db $18, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x180, U } | s: 0x00
#_09DFFF: db $18, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E002: db $18, $0B, $1C ; SPRITE 1C   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E005: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0058:
#_09E006: db $00 ; Unlayered OAM
#_09E007: db $14, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x140, U } | s: 0x00
#_09E00A: db $16, $06, $18 ; SPRITE 18   | xy: { 0x060, 0x160, U } | s: 0x00
#_09E00D: db $16, $16, $93 ; SPRITE 93   | xy: { 0x160, 0x160, U } | s: 0x00
#_09E010: db $04, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x040, U } | s: 0x00
#_09E013: db $06, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x060, U } | s: 0x00
#_09E016: db $0A, $08, $04 ; SPRITE 04   | xy: { 0x080, 0x0A0, U } | s: 0x00
#_09E019: db $0B, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09E01C: db $19, $16, $26 ; SPRITE 26   | xy: { 0x160, 0x190, U } | s: 0x00
#_09E01F: db $1A, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
#_09E022: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0059:
#_09E023: db $01 ; Layered OAM
#_09E024: db $10, $07, $18 ; SPRITE 18   | xy: { 0x070, 0x100, U } | s: 0x00
#_09E027: db $16, $08, $18 ; SPRITE 18   | xy: { 0x080, 0x160, U } | s: 0x00
#_09E02A: db $8F, $14, $93 ; SPRITE 93   | xy: { 0x140, 0x0F0, L } | s: 0x00
#_09E02D: db $8F, $1A, $93 ; SPRITE 93   | xy: { 0x1A0, 0x0F0, L } | s: 0x00
#_09E030: db $8A, $1A, $8A ; SPRITE 8A   | xy: { 0x1A0, 0x0A0, L } | s: 0x00
#_09E033: db $0B, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x0B0, U } | s: 0x00
#_09E036: db $8D, $15, $8A ; SPRITE 8A   | xy: { 0x150, 0x0D0, L } | s: 0x00
#_09E039: db $8E, $05, $5B ; SPRITE 5B   | xy: { 0x050, 0x0E0, L } | s: 0x00
#_09E03C: db $93, $1A, $D1 ; SPRITE D1   | xy: { 0x1A0, 0x130, L } | s: 0x00
#_09E03F: db $14, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x140, U } | s: 0x00
#_09E042: db $95, $15, $8B ; SPRITE 8B   | xy: { 0x150, 0x150, L } | s: 0x00
#_09E045: db $95, $1A, $8B ; SPRITE 8B   | xy: { 0x1A0, 0x150, L } | s: 0x00
#_09E048: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005A:
#_09E049: db $00 ; Unlayered OAM
#_09E04A: db $16, $17, $92 ; SPRITE 92   | xy: { 0x170, 0x160, U } | s: 0x00
#_09E04D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005B:
#_09E04E: db $01 ; Layered OAM
#_09E04F: db $8C, $17, $1E ; SPRITE 1E   | xy: { 0x170, 0x0C0, L } | s: 0x00
#_09E052: db $93, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x130, L } | s: 0x00
#_09E055: db $95, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x150, L } | s: 0x00
#_09E058: db $88, $16, $83 ; SPRITE 83   | xy: { 0x160, 0x080, L } | s: 0x00
#_09E05B: db $88, $19, $84 ; SPRITE 84   | xy: { 0x190, 0x080, L } | s: 0x00
#_09E05E: db $8E, $14, $8A ; SPRITE 8A   | xy: { 0x140, 0x0E0, L } | s: 0x00
#_09E061: db $90, $1B, $8A ; SPRITE 8A   | xy: { 0x1B0, 0x100, L } | s: 0x00
#_09E064: db $91, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x110, L } | s: 0x00
#_09E067: db $92, $14, $8A ; SPRITE 8A   | xy: { 0x140, 0x120, L } | s: 0x00
#_09E06A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005C:
#_09E06B: db $00 ; Unlayered OAM
#_09E06C: db $02, $0B, $68 ; SPRITE 68   | xy: { 0x0B0, 0x020, U } | s: 0x00
#_09E06F: db $0E, $05, $69 ; SPRITE 69   | xy: { 0x050, 0x0E0, U } | s: 0x00
#_09E072: db $0E, $0E, $69 ; SPRITE 69   | xy: { 0x0E0, 0x0E0, U } | s: 0x00
#_09E075: db $18, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E078: db $18, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E07B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005D:
#_09E07C: db $00 ; Unlayered OAM
#_09E07D: db $05, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x050, U } | s: 0x00
#_09E080: db $06, $08, $61 ; SPRITE 61   | xy: { 0x080, 0x060, U } | s: 0x00
#_09E083: db $08, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x080, U } | s: 0x00
#_09E086: db $08, $15, $A6 ; SPRITE A6   | xy: { 0x150, 0x080, U } | s: 0x00
#_09E089: db $08, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x080, U } | s: 0x00
#_09E08C: db $08, $19, $A5 ; SPRITE A5   | xy: { 0x190, 0x080, U } | s: 0x00
#_09E08F: db $08, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09E092: db $0B, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x0B0, U } | s: 0x00
#_09E095: db $15, $04, $61 ; SPRITE 61   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E098: db $15, $0B, $A5 ; SPRITE A5   | xy: { 0x0B0, 0x150, U } | s: 0x00
#_09E09B: db $1A, $04, $A5 ; SPRITE A5   | xy: { 0x040, 0x1A0, U } | s: 0x00
#_09E09E: db $1A, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x1A0, U } | s: 0x00
#_09E0A1: db $1A, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
#_09E0A4: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005E:
#_09E0A5: db $00 ; Unlayered OAM
#_09E0A6: db $05, $FB, $0A ; OVERLORD 0A | xy: { 0x1B0, 0x050, U }
#_09E0A9: db $05, $1C, $C5 ; SPRITE C5   | xy: { 0x1C0, 0x050, U } | s: 0x00
#_09E0AC: db $0B, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x0B0, U } | s: 0x00
#_09E0AF: db $14, $17, $7D ; SPRITE 7D   | xy: { 0x170, 0x140, U } | s: 0x00
#_09E0B2: db $18, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E0B5: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005F:
#_09E0B6: db $00 ; Unlayered OAM
#_09E0B7: db $18, $04, $24 ; SPRITE 24   | xy: { 0x040, 0x180, U } | s: 0x00
#_09E0BA: db $18, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E0BD: db $1B, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x1B0, U } | s: 0x00
#_09E0C0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0060:
#_09E0C1: db $01 ; Layered OAM
#_09E0C2: db $48, $73, $41 ; SPRITE 41   | xy: { 0x130, 0x080, U } | s: 0x13
#_09E0C5: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0061:
#_09E0C6: db $00 ; Unlayered OAM
#_09E0C7: db $0E, $2C, $42 ; SPRITE 42   | xy: { 0x0C0, 0x0E0, U } | s: 0x01
#_09E0CA: db $12, $0D, $4B ; SPRITE 4B   | xy: { 0x0D0, 0x120, U } | s: 0x00
#_09E0CD: db $12, $12, $4B ; SPRITE 4B   | xy: { 0x120, 0x120, U } | s: 0x00
#_09E0D0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0062:
#_09E0D1: db $01 ; Layered OAM
#_09E0D2: db $48, $6C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x080, U } | s: 0x13
#_09E0D5: db $8D, $0A, $42 ; SPRITE 42   | xy: { 0x0A0, 0x0D0, L } | s: 0x00
#_09E0D8: db $8E, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x0E0, L } | s: 0x00
#_09E0DB: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0063:
#_09E0DC: db $00 ; Unlayered OAM
#_09E0DD: db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
#_09E0E0: db $18, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E0E3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0064:
#_09E0E4: db $00 ; Unlayered OAM
#_09E0E5: db $12, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x120, U } | s: 0x00
#_09E0E8: db $13, $0B, $06 ; SPRITE 06   | xy: { 0x0B0, 0x130, U } | s: 0x00
#_09E0EB: db $13, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x130, U } | s: 0x00
#_09E0EE: db $16, $03, $D1 ; SPRITE D1   | xy: { 0x030, 0x160, U } | s: 0x00
#_09E0F1: db $17, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x170, U } | s: 0x00
#_09E0F4: db $19, $19, $6D ; SPRITE 6D   | xy: { 0x190, 0x190, U } | s: 0x00
#_09E0F7: db $1A, $05, $6D ; SPRITE 6D   | xy: { 0x050, 0x1A0, U } | s: 0x00
#_09E0FA: db $15, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x150, U }
#_09E0FD: db $17, $E7, $06 ; OVERLORD 06 | xy: { 0x070, 0x170, U }
#_09E100: db $17, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x170, U }
#_09E103: db $17, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x170, U }
#_09E106: db $19, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x190, U }
#_09E109: db $1B, $EC, $06 ; OVERLORD 06 | xy: { 0x0C0, 0x1B0, U }
#_09E10C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0065:
#_09E10D: db $00 ; Unlayered OAM
#_09E10E: db $15, $13, $6D ; SPRITE 6D   | xy: { 0x130, 0x150, U } | s: 0x00
#_09E111: db $17, $09, $6D ; SPRITE 6D   | xy: { 0x090, 0x170, U } | s: 0x00
#_09E114: db $18, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x180, U } | s: 0x00
#_09E117: db $19, $16, $6D ; SPRITE 6D   | xy: { 0x160, 0x190, U } | s: 0x00
#_09E11A: db $1C, $16, $6D ; SPRITE 6D   | xy: { 0x160, 0x1C0, U } | s: 0x00
#_09E11D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0066:
#_09E11E: db $00 ; Unlayered OAM
#_09E11F: db $85, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x050, L } | s: 0x00
#_09E122: db $86, $E4, $10 ; OVERLORD 10 | xy: { 0x040, 0x060, L }
#_09E125: db $06, $16, $24 ; SPRITE 24   | xy: { 0x160, 0x060, U } | s: 0x00
#_09E128: db $07, $1A, $24 ; SPRITE 24   | xy: { 0x1A0, 0x070, U } | s: 0x00
#_09E12B: db $94, $17, $37 ; SPRITE 37   | xy: { 0x170, 0x140, L } | s: 0x00
#_09E12E: db $96, $E1, $10 ; OVERLORD 10 | xy: { 0x010, 0x160, L }
#_09E131: db $96, $0F, $9A ; SPRITE 9A   | xy: { 0x0F0, 0x160, L } | s: 0x00
#_09E134: db $96, $13, $81 ; SPRITE 81   | xy: { 0x130, 0x160, L } | s: 0x00
#_09E137: db $98, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x180, L } | s: 0x00
#_09E13A: db $99, $0D, $81 ; SPRITE 81   | xy: { 0x0D0, 0x190, L } | s: 0x00
#_09E13D: db $99, $FE, $11 ; OVERLORD 11 | xy: { 0x1E0, 0x190, L }
#_09E140: db $9B, $17, $81 ; SPRITE 81   | xy: { 0x170, 0x1B0, L } | s: 0x00
#_09E143: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0067:
#_09E144: db $00 ; Unlayered OAM
#_09E145: db $0C, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x0C0, U } | s: 0x00
#_09E148: db $06, $04, $24 ; SPRITE 24   | xy: { 0x040, 0x060, U } | s: 0x00
#_09E14B: db $06, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x060, U } | s: 0x00
#_09E14E: db $0C, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x0C0, U } | s: 0x00
#_09E151: db $0F, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x0F0, U } | s: 0x00
#_09E154: db $13, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x130, U } | s: 0x00
#_09E157: db $13, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x130, U } | s: 0x00
#_09E15A: db $14, $18, $7E ; SPRITE 7E   | xy: { 0x180, 0x140, U } | s: 0x00
#_09E15D: db $17, $07, $7F ; SPRITE 7F   | xy: { 0x070, 0x170, U } | s: 0x00
#_09E160: db $1A, $18, $26 ; SPRITE 26   | xy: { 0x180, 0x1A0, U } | s: 0x00
#_09E163: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0068:
#_09E164: db $00 ; Unlayered OAM
#_09E165: db $07, $0E, $93 ; SPRITE 93   | xy: { 0x0E0, 0x070, U } | s: 0x00
#_09E168: db $07, $11, $93 ; SPRITE 93   | xy: { 0x110, 0x070, U } | s: 0x00
#_09E16B: db $0B, $0C, $93 ; SPRITE 93   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
#_09E16E: db $0B, $13, $93 ; SPRITE 93   | xy: { 0x130, 0x0B0, U } | s: 0x00
#_09E171: db $08, $14, $8B ; SPRITE 8B   | xy: { 0x140, 0x080, U } | s: 0x00
#_09E174: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09E177: db $12, $0E, $8B ; SPRITE 8B   | xy: { 0x0E0, 0x120, U } | s: 0x00
#_09E17A: db $12, $12, $8B ; SPRITE 8B   | xy: { 0x120, 0x120, U } | s: 0x00
#_09E17D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006A:
#_09E17E: db $00 ; Unlayered OAM
#_09E17F: db $0A, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x0A0, U } | s: 0x00
#_09E182: db $0A, $18, $8E ; SPRITE 8E   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09E185: db $0B, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x0B0, U } | s: 0x00
#_09E188: db $0B, $1C, $15 ; SPRITE 15   | xy: { 0x1C0, 0x0B0, U } | s: 0x00
#_09E18B: db $0E, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x0E0, U } | s: 0x00
#_09E18E: db $0E, $18, $8E ; SPRITE 8E   | xy: { 0x180, 0x0E0, U } | s: 0x00
#_09E191: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006B:
#_09E192: db $00 ; Unlayered OAM
#_09E193: db $04, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x040, U } | s: 0x00
#_09E196: db $04, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x040, U } | s: 0x00
#_09E199: db $06, $0A, $83 ; SPRITE 83   | xy: { 0x0A0, 0x060, U } | s: 0x00
#_09E19C: db $09, $06, $84 ; SPRITE 84   | xy: { 0x060, 0x090, U } | s: 0x00
#_09E19F: db $0A, $0C, $15 ; SPRITE 15   | xy: { 0x0C0, 0x0A0, U } | s: 0x00
#_09E1A2: db $15, $06, $1C ; SPRITE 1C   | xy: { 0x060, 0x150, U } | s: 0x00
#_09E1A5: db $18, $03, $84 ; SPRITE 84   | xy: { 0x030, 0x180, U } | s: 0x00
#_09E1A8: db $18, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x180, U } | s: 0x00
#_09E1AB: db $1B, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x1B0, U } | s: 0x00
#_09E1AE: db $1B, $0C, $84 ; SPRITE 84   | xy: { 0x0C0, 0x1B0, U } | s: 0x00
#_09E1B1: db $15, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x150, U } | s: 0x00
#_09E1B4: db $15, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x150, U } | s: 0x00
#_09E1B7: db $1B, $14, $61 ; SPRITE 61   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09E1BA: db $1B, $18, $84 ; SPRITE 84   | xy: { 0x180, 0x1B0, U } | s: 0x00
#_09E1BD: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006C:
#_09E1BE: db $00 ; Unlayered OAM
#_09E1BF: db $17, $06, $54 ; SPRITE 54   | xy: { 0x060, 0x170, U } | s: 0x00
#_09E1C2: db $17, $09, $54 ; SPRITE 54   | xy: { 0x090, 0x170, U } | s: 0x00
#_09E1C5: db $19, $07, $54 ; SPRITE 54   | xy: { 0x070, 0x190, U } | s: 0x00
#_09E1C8: db $18, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E1CB: db $1C, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x1C0, U } | s: 0x00
#_09E1CE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006D:
#_09E1CF: db $00 ; Unlayered OAM
#_09E1D0: db $06, $05, $A6 ; SPRITE A6   | xy: { 0x050, 0x060, U } | s: 0x00
#_09E1D3: db $06, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x060, U } | s: 0x00
#_09E1D6: db $09, $04, $61 ; SPRITE 61   | xy: { 0x040, 0x090, U } | s: 0x00
#_09E1D9: db $0B, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x0B0, U } | s: 0x00
#_09E1DC: db $15, $04, $C5 ; SPRITE C5   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E1DF: db $15, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x150, U } | s: 0x00
#_09E1E2: db $18, $05, $A7 ; SPRITE A7   | xy: { 0x050, 0x180, U } | s: 0x00
#_09E1E5: db $18, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x180, U } | s: 0x00
#_09E1E8: db $1A, $06, $5C ; SPRITE 5C   | xy: { 0x060, 0x1A0, U } | s: 0x00
#_09E1EB: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006E:
#_09E1EC: db $00 ; Unlayered OAM
#_09E1ED: db $08, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x080, U } | s: 0x00
#_09E1F0: db $09, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x090, U } | s: 0x00
#_09E1F3: db $0A, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0A0, U } | s: 0x00
#_09E1F6: db $0B, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0B0, U } | s: 0x00
#_09E1F9: db $0C, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0C0, U } | s: 0x00
#_09E1FC: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0071:
#_09E1FD: db $00 ; Unlayered OAM
#_09E1FE: db $98, $06, $42 ; SPRITE 42   | xy: { 0x060, 0x180, L } | s: 0x00
#_09E201: db $D8, $BA, $41 ; SPRITE 41   | xy: { 0x1A0, 0x180, L } | s: 0x15
#_09E204: db $FE, $00, $E4 ; small key on above sprite
#_09E207: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0072:
#_09E208: db $00 ; Unlayered OAM
#_09E209: db $06, $B1, $41 ; SPRITE 41   | xy: { 0x110, 0x060, U } | s: 0x05
#_09E20C: db $FE, $00, $E4 ; small key on above sprite
#_09E20F: db $99, $2A, $41 ; SPRITE 41   | xy: { 0x0A0, 0x190, L } | s: 0x01
#_09E212: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0073:
#_09E213: db $00 ; Unlayered OAM
#_09E214: db $18, $18, $64 ; SPRITE 64   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E217: db $09, $17, $61 ; SPRITE 61   | xy: { 0x170, 0x090, U } | s: 0x00
#_09E21A: db $15, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x150, U } | s: 0x00
#_09E21D: db $18, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x180, U } | s: 0x00
#_09E220: db $19, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x190, U } | s: 0x00
#_09E223: db $1B, $16, $71 ; SPRITE 71   | xy: { 0x160, 0x1B0, U } | s: 0x00
#_09E226: db $06, $14, $3B ; SPRITE 3B   | xy: { 0x140, 0x060, U } | s: 0x00
#_09E229: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0074:
#_09E22A: db $00 ; Unlayered OAM
#_09E22B: db $18, $08, $64 ; SPRITE 64   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E22E: db $18, $17, $64 ; SPRITE 64   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E231: db $05, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x050, U } | s: 0x00
#_09E234: db $05, $13, $83 ; SPRITE 83   | xy: { 0x130, 0x050, U } | s: 0x00
#_09E237: db $0A, $0C, $71 ; SPRITE 71   | xy: { 0x0C0, 0x0A0, U } | s: 0x00
#_09E23A: db $0A, $13, $71 ; SPRITE 71   | xy: { 0x130, 0x0A0, U } | s: 0x00
#_09E23D: db $1B, $0E, $71 ; SPRITE 71   | xy: { 0x0E0, 0x1B0, U } | s: 0x00
#_09E240: db $1B, $12, $71 ; SPRITE 71   | xy: { 0x120, 0x1B0, U } | s: 0x00
#_09E243: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0075:
#_09E244: db $00 ; Unlayered OAM
#_09E245: db $07, $08, $64 ; SPRITE 64   | xy: { 0x080, 0x070, U } | s: 0x00
#_09E248: db $1B, $04, $64 ; SPRITE 64   | xy: { 0x040, 0x1B0, U } | s: 0x00
#_09E24B: db $05, $06, $71 ; SPRITE 71   | xy: { 0x060, 0x050, U } | s: 0x00
#_09E24E: db $05, $0A, $71 ; SPRITE 71   | xy: { 0x0A0, 0x050, U } | s: 0x00
#_09E251: db $0A, $06, $71 ; SPRITE 71   | xy: { 0x060, 0x0A0, U } | s: 0x00
#_09E254: db $0A, $0A, $71 ; SPRITE 71   | xy: { 0x0A0, 0x0A0, U } | s: 0x00
#_09E257: db $0B, $11, $66 ; SPRITE 66   | xy: { 0x110, 0x0B0, U } | s: 0x00
#_09E25A: db $0B, $1E, $67 ; SPRITE 67   | xy: { 0x1E0, 0x0B0, U } | s: 0x00
#_09E25D: db $19, $07, $71 ; SPRITE 71   | xy: { 0x070, 0x190, U } | s: 0x00
#_09E260: db $19, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x190, U } | s: 0x00
#_09E263: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0076:
#_09E264: db $00 ; Unlayered OAM
#_09E265: db $03, $19, $21 ; SPRITE 21   | xy: { 0x190, 0x030, U } | s: 0x00
#_09E268: db $0A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0A0, U } | s: 0x00
#_09E26B: db $0F, $07, $9A ; SPRITE 9A   | xy: { 0x070, 0x0F0, U } | s: 0x00
#_09E26E: db $11, $08, $81 ; SPRITE 81   | xy: { 0x080, 0x110, U } | s: 0x00
#_09E271: db $19, $1B, $8F ; SPRITE 8F   | xy: { 0x1B0, 0x190, U } | s: 0x00
#_09E274: db $1C, $E8, $13 ; OVERLORD 13 | xy: { 0x080, 0x1C0, U }
#_09E277: db $1C, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
#_09E27A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0077:
#_09E27B: db $00 ; Unlayered OAM
#_09E27C: db $89, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x090, L } | s: 0x00
#_09E27F: db $98, $10, $1E ; SPRITE 1E   | xy: { 0x100, 0x180, L } | s: 0x00
#_09E282: db $9A, $09, $1E ; SPRITE 1E   | xy: { 0x090, 0x1A0, L } | s: 0x00
#_09E285: db $9A, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x1A0, L } | s: 0x00
#_09E288: db $8A, $07, $86 ; SPRITE 86   | xy: { 0x070, 0x0A0, L } | s: 0x00
#_09E28B: db $8A, $17, $86 ; SPRITE 86   | xy: { 0x170, 0x0A0, L } | s: 0x00
#_09E28E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007B:
#_09E28F: db $00 ; Unlayered OAM
#_09E290: db $07, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x070, U } | s: 0x00
#_09E293: db $09, $16, $24 ; SPRITE 24   | xy: { 0x160, 0x090, U } | s: 0x00
#_09E296: db $15, $04, $C6 ; SPRITE C6   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E299: db $15, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x150, U } | s: 0x00
#_09E29C: db $17, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x170, U } | s: 0x00
#_09E29F: db $17, $09, $C6 ; SPRITE C6   | xy: { 0x090, 0x170, U } | s: 0x00
#_09E2A2: db $18, $13, $1C ; SPRITE 1C   | xy: { 0x130, 0x180, U } | s: 0x00
#_09E2A5: db $18, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E2A8: db $19, $09, $A7 ; SPRITE A7   | xy: { 0x090, 0x190, U } | s: 0x00
#_09E2AB: db $1A, $05, $C6 ; SPRITE C6   | xy: { 0x050, 0x1A0, U } | s: 0x00
#_09E2AE: db $1B, $0B, $C6 ; SPRITE C6   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09E2B1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007C:
#_09E2B2: db $00 ; Unlayered OAM
#_09E2B3: db $1C, $19, $18 ; SPRITE 18   | xy: { 0x190, 0x1C0, U } | s: 0x00
#_09E2B6: db $0C, $06, $7F ; SPRITE 7F   | xy: { 0x060, 0x0C0, U } | s: 0x00
#_09E2B9: db $10, $07, $8A ; SPRITE 8A   | xy: { 0x070, 0x100, U } | s: 0x00
#_09E2BC: db $14, $09, $7E ; SPRITE 7E   | xy: { 0x090, 0x140, U } | s: 0x00
#_09E2BF: db $18, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E2C2: db $18, $17, $24 ; SPRITE 24   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E2C5: db $1A, $E7, $0B ; OVERLORD 0B | xy: { 0x070, 0x1A0, U }
#_09E2C8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007D:
#_09E2C9: db $00 ; Unlayered OAM
#_09E2CA: db $06, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x060, U } | s: 0x00
#_09E2CD: db $08, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x080, U } | s: 0x00
#_09E2D0: db $0A, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x0A0, U } | s: 0x00
#_09E2D3: db $0C, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x0C0, U } | s: 0x00
#_09E2D6: db $16, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x160, U } | s: 0x00
#_09E2D9: db $17, $18, $C6 ; SPRITE C6   | xy: { 0x180, 0x170, U } | s: 0x00
#_09E2DC: db $19, $1C, $80 ; SPRITE 80   | xy: { 0x1C0, 0x190, U } | s: 0x00
#_09E2DF: db $1A, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x1A0, U } | s: 0x00
#_09E2E2: db $1A, $17, $23 ; SPRITE 23   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09E2E5: db $1C, $0A, $80 ; SPRITE 80   | xy: { 0x0A0, 0x1C0, U } | s: 0x00
#_09E2E8: db $1C, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
#_09E2EB: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007E:
#_09E2EC: db $00 ; Unlayered OAM
#_09E2ED: db $11, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x110, U } | s: 0x00
#_09E2F0: db $0E, $18, $7F ; SPRITE 7F   | xy: { 0x180, 0x0E0, U } | s: 0x00
#_09E2F3: db $0F, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x0F0, U } | s: 0x00
#_09E2F6: db $12, $07, $A1 ; SPRITE A1   | xy: { 0x070, 0x120, U } | s: 0x00
#_09E2F9: db $12, $0A, $A1 ; SPRITE A1   | xy: { 0x0A0, 0x120, U } | s: 0x00
#_09E2FC: db $16, $1B, $99 ; SPRITE 99   | xy: { 0x1B0, 0x160, U } | s: 0x00
#_09E2FF: db $17, $17, $7F ; SPRITE 7F   | xy: { 0x170, 0x170, U } | s: 0x00
#_09E302: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007F:
#_09E303: db $00 ; Unlayered OAM
#_09E304: db $07, $06, $23 ; SPRITE 23   | xy: { 0x060, 0x070, U } | s: 0x00
#_09E307: db $07, $08, $23 ; SPRITE 23   | xy: { 0x080, 0x070, U } | s: 0x00
#_09E30A: db $08, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x080, U } | s: 0x00
#_09E30D: db $09, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x090, U } | s: 0x00
#_09E310: db $14, $0B, $7D ; SPRITE 7D   | xy: { 0x0B0, 0x140, U } | s: 0x00
#_09E313: db $17, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x170, U } | s: 0x00
#_09E316: db $19, $0B, $7D ; SPRITE 7D   | xy: { 0x0B0, 0x190, U } | s: 0x00
#_09E319: db $1B, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x1B0, U } | s: 0x00
#_09E31C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0080:
#_09E31D: db $00 ; Unlayered OAM
#_09E31E: db $03, $16, $76 ; SPRITE 76   | xy: { 0x160, 0x030, U } | s: 0x00
#_09E321: db $09, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x090, U } | s: 0x00
#_09E324: db $09, $1A, $6A ; SPRITE 6A   | xy: { 0x1A0, 0x090, U } | s: 0x00
#_09E327: db $FD, $00, $E4 ; big key on above sprite
#_09E32A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0081:
#_09E32B: db $01 ; Layered OAM
#_09E32C: db $EB, $6B, $42 ; SPRITE 42   | xy: { 0x0B0, 0x0B0, L } | s: 0x1B
#_09E32F: db $8B, $6E, $42 ; SPRITE 42   | xy: { 0x0E0, 0x0B0, L } | s: 0x03
#_09E332: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0082:
#_09E333: db $00 ; Unlayered OAM
#_09E334: db $E5, $69, $41 ; SPRITE 41   | xy: { 0x090, 0x050, L } | s: 0x1B
#_09E337: db $86, $70, $41 ; SPRITE 41   | xy: { 0x100, 0x060, L } | s: 0x03
#_09E33A: db $91, $75, $41 ; SPRITE 41   | xy: { 0x150, 0x110, L } | s: 0x03
#_09E33D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0083:
#_09E33E: db $00 ; Unlayered OAM
#_09E33F: db $08, $1B, $63 ; SPRITE 63   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09E342: db $10, $14, $63 ; SPRITE 63   | xy: { 0x140, 0x100, U } | s: 0x00
#_09E345: db $05, $14, $71 ; SPRITE 71   | xy: { 0x140, 0x050, U } | s: 0x00
#_09E348: db $06, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x060, U } | s: 0x00
#_09E34B: db $08, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x080, U } | s: 0x00
#_09E34E: db $0B, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09E351: db $10, $17, $71 ; SPRITE 71   | xy: { 0x170, 0x100, U } | s: 0x00
#_09E354: db $17, $08, $61 ; SPRITE 61   | xy: { 0x080, 0x170, U } | s: 0x00
#_09E357: db $18, $18, $71 ; SPRITE 71   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E35A: db $1B, $14, $71 ; SPRITE 71   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09E35D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0084:
#_09E35E: db $00 ; Unlayered OAM
#_09E35F: db $05, $03, $71 ; SPRITE 71   | xy: { 0x030, 0x050, U } | s: 0x00
#_09E362: db $05, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x050, U } | s: 0x00
#_09E365: db $07, $0F, $61 ; SPRITE 61   | xy: { 0x0F0, 0x070, U } | s: 0x00
#_09E368: db $12, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x120, U } | s: 0x00
#_09E36B: db $12, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x120, U } | s: 0x00
#_09E36E: db $1B, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x1B0, U } | s: 0x00
#_09E371: db $1B, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x1B0, U } | s: 0x00
#_09E374: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0085:
#_09E375: db $00 ; Unlayered OAM
#_09E376: db $0E, $07, $63 ; SPRITE 63   | xy: { 0x070, 0x0E0, U } | s: 0x00
#_09E379: db $1B, $09, $64 ; SPRITE 64   | xy: { 0x090, 0x1B0, U } | s: 0x00
#_09E37C: db $05, $14, $4F ; SPRITE 4F   | xy: { 0x140, 0x050, U } | s: 0x00
#_09E37F: db $05, $1B, $4F ; SPRITE 4F   | xy: { 0x1B0, 0x050, U } | s: 0x00
#_09E382: db $08, $16, $4F ; SPRITE 4F   | xy: { 0x160, 0x080, U } | s: 0x00
#_09E385: db $0A, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09E388: db $0E, $03, $71 ; SPRITE 71   | xy: { 0x030, 0x0E0, U } | s: 0x00
#_09E38B: db $15, $0C, $71 ; SPRITE 71   | xy: { 0x0C0, 0x150, U } | s: 0x00
#_09E38E: db $18, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E391: db $1C, $07, $71 ; SPRITE 71   | xy: { 0x070, 0x1C0, U } | s: 0x00
#_09E394: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0086:
#_09E395: db $01 ; Layered OAM
#_09E396: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0087:
#_09E397: db $00 ; Unlayered OAM
#_09E398: db $05, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x050, U } | s: 0x00
#_09E39B: db $07, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x070, U } | s: 0x00
#_09E39E: db $0B, $13, $18 ; SPRITE 18   | xy: { 0x130, 0x0B0, U } | s: 0x00
#_09E3A1: db $19, $06, $18 ; SPRITE 18   | xy: { 0x060, 0x190, U } | s: 0x00
#_09E3A4: db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
#_09E3A7: db $04, $17, $1E ; SPRITE 1E   | xy: { 0x170, 0x040, U } | s: 0x00
#_09E3AA: db $0C, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x0C0, U } | s: 0x00
#_09E3AD: db $15, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E3B0: db $17, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x170, U } | s: 0x00
#_09E3B3: db $18, $19, $A7 ; SPRITE A7   | xy: { 0x190, 0x180, U } | s: 0x00
#_09E3B6: db $19, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x190, U } | s: 0x00
#_09E3B9: db $1A, $08, $E4 ; SPRITE E4   | xy: { 0x080, 0x1A0, U } | s: 0x00
#_09E3BC: db $1C, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x1C0, U } | s: 0x00
#_09E3BF: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0089:
#_09E3C0: db $00 ; Unlayered OAM
#_09E3C1: db $0A, $10, $E3 ; SPRITE E3   | xy: { 0x100, 0x0A0, U } | s: 0x00
#_09E3C4: db $0B, $0F, $E3 ; SPRITE E3   | xy: { 0x0F0, 0x0B0, U } | s: 0x00
#_09E3C7: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008B:
#_09E3C8: db $00 ; Unlayered OAM
#_09E3C9: db $07, $15, $93 ; SPRITE 93   | xy: { 0x150, 0x070, U } | s: 0x00
#_09E3CC: db $18, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x180, U } | s: 0x00
#_09E3CF: db $18, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E3D2: db $04, $1A, $24 ; SPRITE 24   | xy: { 0x1A0, 0x040, U } | s: 0x00
#_09E3D5: db $12, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x120, U } | s: 0x00
#_09E3D8: db $18, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E3DB: db $18, $18, $7E ; SPRITE 7E   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E3DE: db $18, $18, $7F ; SPRITE 7F   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E3E1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008C:
#_09E3E2: db $00 ; Unlayered OAM
#_09E3E3: db $03, $1A, $06 ; SPRITE 06   | xy: { 0x1A0, 0x030, U } | s: 0x00
#_09E3E6: db $05, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x050, U }
#_09E3E9: db $06, $F5, $1A ; OVERLORD 1A | xy: { 0x150, 0x060, U }
#_09E3EC: db $06, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x060, U }
#_09E3EF: db $0A, $F5, $1A ; OVERLORD 1A | xy: { 0x150, 0x0A0, U }
#_09E3F2: db $0A, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x0A0, U }
#_09E3F5: db $08, $08, $5B ; SPRITE 5B   | xy: { 0x080, 0x080, U } | s: 0x00
#_09E3F8: db $08, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x080, U } | s: 0x00
#_09E3FB: db $09, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x090, U } | s: 0x00
#_09E3FE: db $0B, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x0B0, U } | s: 0x00
#_09E401: db $17, $05, $80 ; SPRITE 80   | xy: { 0x050, 0x170, U } | s: 0x00
#_09E404: db $17, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x170, U } | s: 0x00
#_09E407: db $18, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x180, U } | s: 0x00
#_09E40A: db $1B, $0B, $80 ; SPRITE 80   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09E40D: db $1C, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x1C0, U } | s: 0x00
#_09E410: db $07, $09, $3B ; SPRITE 3B   | xy: { 0x090, 0x070, U } | s: 0x00
#_09E413: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008D:
#_09E414: db $00 ; Unlayered OAM
#_09E415: db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
#_09E418: db $04, $07, $C6 ; SPRITE C6   | xy: { 0x070, 0x040, U } | s: 0x00
#_09E41B: db $08, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x080, U } | s: 0x00
#_09E41E: db $09, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x090, U } | s: 0x00
#_09E421: db $0C, $09, $C6 ; SPRITE C6   | xy: { 0x090, 0x0C0, U } | s: 0x00
#_09E424: db $0D, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x0D0, U } | s: 0x00
#_09E427: db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
#_09E42A: db $10, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x100, U } | s: 0x00
#_09E42D: db $14, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x140, U } | s: 0x00
#_09E430: db $18, $07, $7E ; SPRITE 7E   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E433: db $1B, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09E436: db $1C, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x1C0, U } | s: 0x00
#_09E439: db $1C, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1C0, U } | s: 0x00
#_09E43C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008E:
#_09E43D: db $00 ; Unlayered OAM
#_09E43E: db $02, $1B, $A1 ; SPRITE A1   | xy: { 0x1B0, 0x020, U } | s: 0x00
#_09E441: db $05, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x050, U } | s: 0x00
#_09E444: db $06, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x060, U } | s: 0x00
#_09E447: db $08, $1B, $8F ; SPRITE 8F   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09E44A: db $09, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x090, U } | s: 0x00
#_09E44D: db $0A, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09E450: db $0B, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x0B0, U } | s: 0x00
#_09E453: db $0B, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x0B0, U } | s: 0x00
#_09E456: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0090:
#_09E457: db $00 ; Unlayered OAM
#_09E458: db $15, $07, $BD ; SPRITE BD   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E45B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0091:
#_09E45C: db $00 ; Unlayered OAM
#_09E45D: db $04, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x040, U } | s: 0x00
#_09E460: db $0E, $1B, $8A ; SPRITE 8A   | xy: { 0x1B0, 0x0E0, U } | s: 0x00
#_09E463: db $0F, $F7, $08 ; OVERLORD 08 | xy: { 0x170, 0x0F0, U }
#_09E466: db $12, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x120, U } | s: 0x00
#_09E469: db $12, $18, $D1 ; SPRITE D1   | xy: { 0x180, 0x120, U } | s: 0x00
#_09E46C: db $12, $19, $15 ; SPRITE 15   | xy: { 0x190, 0x120, U } | s: 0x00
#_09E46F: db $18, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E472: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0092:
#_09E473: db $00 ; Unlayered OAM
#_09E474: db $09, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x090, U } | s: 0x00
#_09E477: db $0C, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x0C0, U } | s: 0x00
#_09E47A: db $04, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x040, U } | s: 0x00
#_09E47D: db $05, $0B, $C5 ; SPRITE C5   | xy: { 0x0B0, 0x050, U } | s: 0x00
#_09E480: db $08, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x080, U } | s: 0x00
#_09E483: db $09, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x090, U } | s: 0x00
#_09E486: db $0F, $15, $C6 ; SPRITE C6   | xy: { 0x150, 0x0F0, U } | s: 0x00
#_09E489: db $12, $E7, $16 ; OVERLORD 16 | xy: { 0x070, 0x120, U }
#_09E48C: db $12, $19, $8A ; SPRITE 8A   | xy: { 0x190, 0x120, U } | s: 0x00
#_09E48F: db $14, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x140, U } | s: 0x00
#_09E492: db $16, $0A, $A7 ; SPRITE A7   | xy: { 0x0A0, 0x160, U } | s: 0x00
#_09E495: db $1B, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x1B0, U } | s: 0x00
#_09E498: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0093:
#_09E499: db $00 ; Unlayered OAM
#_09E49A: db $09, $09, $C5 ; SPRITE C5   | xy: { 0x090, 0x090, U } | s: 0x00
#_09E49D: db $09, $16, $C5 ; SPRITE C5   | xy: { 0x160, 0x090, U } | s: 0x00
#_09E4A0: db $0C, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09E4A3: db $0C, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x0C0, U } | s: 0x00
#_09E4A6: db $0C, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x0C0, U } | s: 0x00
#_09E4A9: db $15, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E4AC: db $1C, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x1C0, U } | s: 0x00
#_09E4AF: db $1C, $04, $15 ; SPRITE 15   | xy: { 0x040, 0x1C0, U } | s: 0x00
#_09E4B2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0095:
#_09E4B3: db $00 ; Unlayered OAM
#_09E4B4: db $0C, $16, $43 ; SPRITE 43   | xy: { 0x160, 0x0C0, U } | s: 0x00
#_09E4B7: db $0C, $17, $43 ; SPRITE 43   | xy: { 0x170, 0x0C0, U } | s: 0x00
#_09E4BA: db $0C, $18, $43 ; SPRITE 43   | xy: { 0x180, 0x0C0, U } | s: 0x00
#_09E4BD: db $0C, $19, $43 ; SPRITE 43   | xy: { 0x190, 0x0C0, U } | s: 0x00
#_09E4C0: db $1A, $F7, $0B ; OVERLORD 0B | xy: { 0x170, 0x1A0, U }
#_09E4C3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0096:
#_09E4C4: db $00 ; Unlayered OAM
#_09E4C5: db $0B, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x0B0, U } | s: 0x00
#_09E4C8: db $15, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x150, U } | s: 0x00
#_09E4CB: db $17, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x170, U } | s: 0x00
#_09E4CE: db $19, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x190, U } | s: 0x00
#_09E4D1: db $1B, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x1B0, U } | s: 0x00
#_09E4D4: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0097:
#_09E4D5: db $00 ; Unlayered OAM
#_09E4D6: db $0F, $EF, $15 ; OVERLORD 15 | xy: { 0x0F0, 0x0F0, U }
#_09E4D9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0098:
#_09E4DA: db $00 ; Unlayered OAM
#_09E4DB: db $13, $10, $8F ; SPRITE 8F   | xy: { 0x100, 0x130, U } | s: 0x00
#_09E4DE: db $14, $09, $8F ; SPRITE 8F   | xy: { 0x090, 0x140, U } | s: 0x00
#_09E4E1: db $14, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x140, U } | s: 0x00
#_09E4E4: db $14, $0F, $8F ; SPRITE 8F   | xy: { 0x0F0, 0x140, U } | s: 0x00
#_09E4E7: db $17, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x170, U } | s: 0x00
#_09E4EA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0099:
#_09E4EB: db $00 ; Unlayered OAM
#_09E4EC: db $06, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x060, U } | s: 0x00
#_09E4EF: db $08, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x080, U } | s: 0x00
#_09E4F2: db $17, $0E, $83 ; SPRITE 83   | xy: { 0x0E0, 0x170, U } | s: 0x00
#_09E4F5: db $17, $11, $83 ; SPRITE 83   | xy: { 0x110, 0x170, U } | s: 0x00
#_09E4F8: db $FE, $00, $E4 ; small key on above sprite
#_09E4FB: db $18, $0D, $4E ; SPRITE 4E   | xy: { 0x0D0, 0x180, U } | s: 0x00
#_09E4FE: db $18, $12, $4E ; SPRITE 4E   | xy: { 0x120, 0x180, U } | s: 0x00
#_09E501: db $19, $0E, $4F ; SPRITE 4F   | xy: { 0x0E0, 0x190, U } | s: 0x00
#_09E504: db $19, $0F, $4F ; SPRITE 4F   | xy: { 0x0F0, 0x190, U } | s: 0x00
#_09E507: db $19, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x190, U } | s: 0x00
#_09E50A: db $19, $11, $4F ; SPRITE 4F   | xy: { 0x110, 0x190, U } | s: 0x00
#_09E50D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009B:
#_09E50E: db $00 ; Unlayered OAM
#_09E50F: db $08, $06, $1E ; SPRITE 1E   | xy: { 0x060, 0x080, U } | s: 0x00
#_09E512: db $08, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x080, U } | s: 0x00
#_09E515: db $08, $14, $1E ; SPRITE 1E   | xy: { 0x140, 0x080, U } | s: 0x00
#_09E518: db $05, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x050, U } | s: 0x00
#_09E51B: db $06, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x060, U } | s: 0x00
#_09E51E: db $07, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x070, U } | s: 0x00
#_09E521: db $08, $03, $C6 ; SPRITE C6   | xy: { 0x030, 0x080, U } | s: 0x00
#_09E524: db $08, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x080, U } | s: 0x00
#_09E527: db $09, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x090, U } | s: 0x00
#_09E52A: db $0A, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x0A0, U } | s: 0x00
#_09E52D: db $0B, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x0B0, U } | s: 0x00
#_09E530: db $1A, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09E533: db $1B, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x1B0, U } | s: 0x00
#_09E536: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009C:
#_09E537: db $00 ; Unlayered OAM
#_09E538: db $09, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x090, U } | s: 0x00
#_09E53B: db $0A, $0B, $13 ; SPRITE 13   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
#_09E53E: db $0F, $11, $26 ; SPRITE 26   | xy: { 0x110, 0x0F0, U } | s: 0x00
#_09E541: db $0E, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x0E0, U } | s: 0x00
#_09E544: db $12, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x120, U } | s: 0x00
#_09E547: db $13, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x130, U } | s: 0x00
#_09E54A: db $1C, $0F, $80 ; SPRITE 80   | xy: { 0x0F0, 0x1C0, U } | s: 0x00
#_09E54D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009D:
#_09E54E: db $00 ; Unlayered OAM
#_09E54F: db $06, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x060, U } | s: 0x00
#_09E552: db $04, $06, $26 ; SPRITE 26   | xy: { 0x060, 0x040, U } | s: 0x00
#_09E555: db $04, $14, $8B ; SPRITE 8B   | xy: { 0x140, 0x040, U } | s: 0x00
#_09E558: db $09, $18, $8B ; SPRITE 8B   | xy: { 0x180, 0x090, U } | s: 0x00
#_09E55B: db $0C, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x0C0, U } | s: 0x00
#_09E55E: db $0C, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x0C0, U } | s: 0x00
#_09E561: db $14, $10, $24 ; SPRITE 24   | xy: { 0x100, 0x140, U } | s: 0x00
#_09E564: db $18, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E567: db $1C, $11, $24 ; SPRITE 24   | xy: { 0x110, 0x1C0, U } | s: 0x00
#_09E56A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009E:
#_09E56B: db $00 ; Unlayered OAM
#_09E56C: db $05, $18, $23 ; SPRITE 23   | xy: { 0x180, 0x050, U } | s: 0x00
#_09E56F: db $08, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x080, U } | s: 0x00
#_09E572: db $08, $18, $91 ; SPRITE 91   | xy: { 0x180, 0x080, U } | s: 0x00
#_09E575: db $08, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x080, U } | s: 0x00
#_09E578: db $12, $14, $A1 ; SPRITE A1   | xy: { 0x140, 0x120, U } | s: 0x00
#_09E57B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009F:
#_09E57C: db $00 ; Unlayered OAM
#_09E57D: db $12, $04, $9D ; SPRITE 9D   | xy: { 0x040, 0x120, U } | s: 0x00
#_09E580: db $12, $06, $9D ; SPRITE 9D   | xy: { 0x060, 0x120, U } | s: 0x00
#_09E583: db $12, $09, $9D ; SPRITE 9D   | xy: { 0x090, 0x120, U } | s: 0x00
#_09E586: db $12, $0B, $9D ; SPRITE 9D   | xy: { 0x0B0, 0x120, U } | s: 0x00
#_09E589: db $17, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x170, U } | s: 0x00
#_09E58C: db $18, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E58F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A0:
#_09E590: db $00 ; Unlayered OAM
#_09E591: db $08, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x080, U } | s: 0x00
#_09E594: db $08, $0E, $15 ; SPRITE 15   | xy: { 0x0E0, 0x080, U } | s: 0x00
#_09E597: db $0C, $14, $80 ; SPRITE 80   | xy: { 0x140, 0x0C0, U } | s: 0x00
#_09E59A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A1:
#_09E59B: db $00 ; Unlayered OAM
#_09E59C: db $08, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x080, U } | s: 0x00
#_09E59F: db $07, $18, $5B ; SPRITE 5B   | xy: { 0x180, 0x070, U } | s: 0x00
#_09E5A2: db $0B, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x0B0, U } | s: 0x00
#_09E5A5: db $10, $19, $9B ; SPRITE 9B   | xy: { 0x190, 0x100, U } | s: 0x00
#_09E5A8: db $15, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x150, U } | s: 0x00
#_09E5AB: db $15, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x150, U } | s: 0x00
#_09E5AE: db $19, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x190, U } | s: 0x00
#_09E5B1: db $19, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x190, U } | s: 0x00
#_09E5B4: db $19, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x190, U } | s: 0x00
#_09E5B7: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A3:
#_09E5B8: db $00 ; Unlayered OAM
#_09E5B9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A4:
#_09E5BA: db $00 ; Unlayered OAM
#_09E5BB: db $15, $07, $CB ; SPRITE CB   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E5BE: db $15, $07, $CC ; SPRITE CC   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E5C1: db $15, $07, $CD ; SPRITE CD   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E5C4: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A5:
#_09E5C5: db $00 ; Unlayered OAM
#_09E5C6: db $05, $16, $9B ; SPRITE 9B   | xy: { 0x160, 0x050, U } | s: 0x00
#_09E5C9: db $05, $19, $9B ; SPRITE 9B   | xy: { 0x190, 0x050, U } | s: 0x00
#_09E5CC: db $07, $04, $9B ; SPRITE 9B   | xy: { 0x040, 0x070, U } | s: 0x00
#_09E5CF: db $07, $0B, $9B ; SPRITE 9B   | xy: { 0x0B0, 0x070, U } | s: 0x00
#_09E5D2: db $08, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x080, U } | s: 0x00
#_09E5D5: db $09, $15, $9B ; SPRITE 9B   | xy: { 0x150, 0x090, U } | s: 0x00
#_09E5D8: db $09, $1A, $9B ; SPRITE 9B   | xy: { 0x1A0, 0x090, U } | s: 0x00
#_09E5DB: db $0A, $08, $9B ; SPRITE 9B   | xy: { 0x080, 0x0A0, U } | s: 0x00
#_09E5DE: db $12, $0C, $97 ; SPRITE 97   | xy: { 0x0C0, 0x120, U } | s: 0x00
#_09E5E1: db $12, $12, $97 ; SPRITE 97   | xy: { 0x120, 0x120, U } | s: 0x00
#_09E5E4: db $17, $12, $43 ; SPRITE 43   | xy: { 0x120, 0x170, U } | s: 0x00
#_09E5E7: db $18, $13, $41 ; SPRITE 41   | xy: { 0x130, 0x180, U } | s: 0x00
#_09E5EA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A6:
#_09E5EB: db $00 ; Unlayered OAM
#_09E5EC: db $0F, $EF, $15 ; OVERLORD 15 | xy: { 0x0F0, 0x0F0, U }
#_09E5EF: db $0E, $0C, $15 ; SPRITE 15   | xy: { 0x0C0, 0x0E0, U } | s: 0x00
#_09E5F2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A7:
#_09E5F3: db $00 ; Unlayered OAM
#_09E5F4: db $08, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x080, U } | s: 0x00
#_09E5F7: db $09, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x090, U } | s: 0x00
#_09E5FA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A8:
#_09E5FB: db $01 ; Layered OAM
#_09E5FC: db $0E, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x0E0, U } | s: 0x00
#_09E5FF: db $0E, $1A, $A7 ; SPRITE A7   | xy: { 0x1A0, 0x0E0, U } | s: 0x00
#_09E602: db $12, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x120, U } | s: 0x00
#_09E605: db $12, $1A, $A7 ; SPRITE A7   | xy: { 0x1A0, 0x120, U } | s: 0x00
#_09E608: db $16, $E8, $18 ; OVERLORD 18 | xy: { 0x080, 0x160, U }
#_09E60B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A9:
#_09E60C: db $00 ; Unlayered OAM
#_09E60D: db $85, $09, $83 ; SPRITE 83   | xy: { 0x090, 0x050, L } | s: 0x00
#_09E610: db $85, $16, $83 ; SPRITE 83   | xy: { 0x160, 0x050, L } | s: 0x00
#_09E613: db $8C, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x0C0, L }
#_09E616: db $8C, $F2, $05 ; OVERLORD 05 | xy: { 0x120, 0x0C0, L }
#_09E619: db $92, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x120, L }
#_09E61C: db $92, $F2, $05 ; OVERLORD 05 | xy: { 0x120, 0x120, L }
#_09E61F: db $90, $0A, $A7 ; SPRITE A7   | xy: { 0x0A0, 0x100, L } | s: 0x00
#_09E622: db $90, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x100, L } | s: 0x00
#_09E625: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AA:
#_09E626: db $01 ; Layered OAM
#_09E627: db $06, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x060, U } | s: 0x00
#_09E62A: db $07, $0A, $4F ; SPRITE 4F   | xy: { 0x0A0, 0x070, U } | s: 0x00
#_09E62D: db $0B, $06, $A7 ; SPRITE A7   | xy: { 0x060, 0x0B0, U } | s: 0x00
#_09E630: db $0C, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
#_09E633: db $13, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x130, U } | s: 0x00
#_09E636: db $14, $0A, $4F ; SPRITE 4F   | xy: { 0x0A0, 0x140, U } | s: 0x00
#_09E639: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AB:
#_09E63A: db $00 ; Unlayered OAM
#_09E63B: db $18, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x180, U } | s: 0x00
#_09E63E: db $15, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x150, U } | s: 0x00
#_09E641: db $16, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x160, U } | s: 0x00
#_09E644: db $17, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x170, U } | s: 0x00
#_09E647: db $18, $06, $8F ; SPRITE 8F   | xy: { 0x060, 0x180, U } | s: 0x00
#_09E64A: db $19, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x190, U } | s: 0x00
#_09E64D: db $1A, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
#_09E650: db $1B, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x1B0, U } | s: 0x00
#_09E653: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AC:
#_09E654: db $00 ; Unlayered OAM
#_09E655: db $15, $19, $CE ; SPRITE CE   | xy: { 0x190, 0x150, U } | s: 0x00
#_09E658: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AE:
#_09E659: db $00 ; Unlayered OAM
#_09E65A: db $07, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x070, U } | s: 0x00
#_09E65D: db $07, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x070, U } | s: 0x00
#_09E660: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AF:
#_09E661: db $00 ; Unlayered OAM
#_09E662: db $08, $0A, $7E ; SPRITE 7E   | xy: { 0x0A0, 0x080, U } | s: 0x00
#_09E665: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B0:
#_09E666: db $00 ; Unlayered OAM
#_09E667: db $07, $07, $43 ; SPRITE 43   | xy: { 0x070, 0x070, U } | s: 0x00
#_09E66A: db $07, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x070, U } | s: 0x00
#_09E66D: db $07, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x070, U } | s: 0x00
#_09E670: db $08, $14, $48 ; SPRITE 48   | xy: { 0x140, 0x080, U } | s: 0x00
#_09E673: db $08, $1B, $48 ; SPRITE 48   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09E676: db $0B, $05, $43 ; SPRITE 43   | xy: { 0x050, 0x0B0, U } | s: 0x00
#_09E679: db $14, $16, $6A ; SPRITE 6A   | xy: { 0x160, 0x140, U } | s: 0x00
#_09E67C: db $16, $04, $6F ; SPRITE 6F   | xy: { 0x040, 0x160, U } | s: 0x00
#_09E67F: db $16, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x160, U } | s: 0x00
#_09E682: db $16, $0A, $43 ; SPRITE 43   | xy: { 0x0A0, 0x160, U } | s: 0x00
#_09E685: db $18, $08, $43 ; SPRITE 43   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E688: db $FE, $00, $E4 ; small key on above sprite
#_09E68B: db $1A, $1B, $44 ; SPRITE 44   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
#_09E68E: db $1C, $17, $48 ; SPRITE 48   | xy: { 0x170, 0x1C0, U } | s: 0x00
#_09E691: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B1:
#_09E692: db $00 ; Unlayered OAM
#_09E693: db $07, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x070, U } | s: 0x00
#_09E696: db $07, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x070, U } | s: 0x00
#_09E699: db $0E, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x0E0, U } | s: 0x00
#_09E69C: db $11, $19, $8A ; SPRITE 8A   | xy: { 0x190, 0x110, U } | s: 0x00
#_09E69F: db $17, $0C, $9B ; SPRITE 9B   | xy: { 0x0C0, 0x170, U } | s: 0x00
#_09E6A2: db $17, $1A, $7D ; SPRITE 7D   | xy: { 0x1A0, 0x170, U } | s: 0x00
#_09E6A5: db $18, $07, $C6 ; SPRITE C6   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E6A8: db $1A, $03, $9B ; SPRITE 9B   | xy: { 0x030, 0x1A0, U } | s: 0x00
#_09E6AB: db $1A, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x1A0, U } | s: 0x00
#_09E6AE: db $1C, $08, $9B ; SPRITE 9B   | xy: { 0x080, 0x1C0, U } | s: 0x00
#_09E6B1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B2:
#_09E6B2: db $01 ; Layered OAM
#_09E6B3: db $88, $14, $9B ; SPRITE 9B   | xy: { 0x140, 0x080, L } | s: 0x00
#_09E6B6: db $8A, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x0A0, L } | s: 0x00
#_09E6B9: db $8A, $12, $15 ; SPRITE 15   | xy: { 0x120, 0x0A0, L } | s: 0x00
#_09E6BC: db $8A, $13, $D1 ; SPRITE D1   | xy: { 0x130, 0x0A0, L } | s: 0x00
#_09E6BF: db $8B, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x0B0, L } | s: 0x00
#_09E6C2: db $15, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E6C5: db $15, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x150, U } | s: 0x00
#_09E6C8: db $16, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x160, U } | s: 0x00
#_09E6CB: db $18, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x180, U } | s: 0x00
#_09E6CE: db $18, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x180, U } | s: 0x00
#_09E6D1: db $1B, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x1B0, U } | s: 0x00
#_09E6D4: db $1B, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09E6D7: db $1B, $14, $4E ; SPRITE 4E   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09E6DA: db $1B, $1B, $4E ; SPRITE 4E   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
#_09E6DD: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B3:
#_09E6DE: db $00 ; Unlayered OAM
#_09E6DF: db $15, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x150, U } | s: 0x00
#_09E6E2: db $15, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x150, U } | s: 0x00
#_09E6E5: db $18, $06, $61 ; SPRITE 61   | xy: { 0x060, 0x180, U } | s: 0x00
#_09E6E8: db $1A, $0A, $C6 ; SPRITE C6   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
#_09E6EB: db $1C, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x1C0, U } | s: 0x00
#_09E6EE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B5:
#_09E6EF: db $00 ; Unlayered OAM
#_09E6F0: db $0A, $16, $7E ; SPRITE 7E   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09E6F3: db $0F, $09, $7E ; SPRITE 7E   | xy: { 0x090, 0x0F0, U } | s: 0x00
#_09E6F6: db $16, $16, $7E ; SPRITE 7E   | xy: { 0x160, 0x160, U } | s: 0x00
#_09E6F9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B6:
#_09E6FA: db $00 ; Unlayered OAM
#_09E6FB: db $07, $06, $CA ; SPRITE CA   | xy: { 0x060, 0x070, U } | s: 0x00
#_09E6FE: db $07, $0A, $CA ; SPRITE CA   | xy: { 0x0A0, 0x070, U } | s: 0x00
#_09E701: db $04, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x040, U } | s: 0x00
#_09E704: db $04, $0C, $1E ; SPRITE 1E   | xy: { 0x0C0, 0x040, U } | s: 0x00
#_09E707: db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
#_09E70A: db $15, $07, $C7 ; SPRITE C7   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E70D: db $FE, $00, $E4 ; small key on above sprite
#_09E710: db $18, $F7, $14 ; OVERLORD 14 | xy: { 0x170, 0x180, U }
#_09E713: db $1B, $07, $8F ; SPRITE 8F   | xy: { 0x070, 0x1B0, U } | s: 0x00
#_09E716: db $1B, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x1B0, U } | s: 0x00
#_09E719: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B7:
#_09E71A: db $00 ; Unlayered OAM
#_09E71B: db $09, $04, $5F ; SPRITE 5F   | xy: { 0x040, 0x090, U } | s: 0x00
#_09E71E: db $11, $04, $5D ; SPRITE 5D   | xy: { 0x040, 0x110, U } | s: 0x00
#_09E721: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B8:
#_09E722: db $00 ; Unlayered OAM
#_09E723: db $0B, $15, $4E ; SPRITE 4E   | xy: { 0x150, 0x0B0, U } | s: 0x00
#_09E726: db $0B, $1B, $4E ; SPRITE 4E   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09E729: db $0D, $18, $82 ; SPRITE 82   | xy: { 0x180, 0x0D0, U } | s: 0x00
#_09E72C: db $13, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x130, U } | s: 0x00
#_09E72F: db $16, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x160, U } | s: 0x00
#_09E732: db $16, $1C, $A7 ; SPRITE A7   | xy: { 0x1C0, 0x160, U } | s: 0x00
#_09E735: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B9:
#_09E736: db $01 ; Layered OAM
#_09E737: db $85, $F1, $03 ; OVERLORD 03 | xy: { 0x110, 0x050, L }
#_09E73A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BA:
#_09E73B: db $00 ; Unlayered OAM
#_09E73C: db $04, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x040, U } | s: 0x00
#_09E73F: db $06, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x060, U } | s: 0x00
#_09E742: db $06, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x060, U } | s: 0x00
#_09E745: db $09, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x090, U } | s: 0x00
#_09E748: db $09, $0C, $4F ; SPRITE 4F   | xy: { 0x0C0, 0x090, U } | s: 0x00
#_09E74B: db $0A, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09E74E: db $0C, $08, $4F ; SPRITE 4F   | xy: { 0x080, 0x0C0, U } | s: 0x00
#_09E751: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BB:
#_09E752: db $00 ; Unlayered OAM
#_09E753: db $04, $1B, $A6 ; SPRITE A6   | xy: { 0x1B0, 0x040, U } | s: 0x00
#_09E756: db $0A, $06, $C3 ; SPRITE C3   | xy: { 0x060, 0x0A0, U } | s: 0x00
#_09E759: db $0A, $16, $A6 ; SPRITE A6   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09E75C: db $0A, $19, $C3 ; SPRITE C3   | xy: { 0x190, 0x0A0, U } | s: 0x00
#_09E75F: db $0C, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x0C0, U } | s: 0x00
#_09E762: db $0E, $09, $C3 ; SPRITE C3   | xy: { 0x090, 0x0E0, U } | s: 0x00
#_09E765: db $10, $07, $80 ; SPRITE 80   | xy: { 0x070, 0x100, U } | s: 0x00
#_09E768: db $14, $08, $C3 ; SPRITE C3   | xy: { 0x080, 0x140, U } | s: 0x00
#_09E76B: db $15, $19, $C3 ; SPRITE C3   | xy: { 0x190, 0x150, U } | s: 0x00
#_09E76E: db $16, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x160, U } | s: 0x00
#_09E771: db $1A, $17, $C3 ; SPRITE C3   | xy: { 0x170, 0x1A0, U } | s: 0x00
#_09E774: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BC:
#_09E775: db $00 ; Unlayered OAM
#_09E776: db $05, $06, $A5 ; SPRITE A5   | xy: { 0x060, 0x050, U } | s: 0x00
#_09E779: db $05, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x050, U } | s: 0x00
#_09E77C: db $06, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x060, U } | s: 0x00
#_09E77F: db $09, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x090, U } | s: 0x00
#_09E782: db $0A, $09, $8A ; SPRITE 8A   | xy: { 0x090, 0x0A0, U } | s: 0x00
#_09E785: db $0B, $05, $A5 ; SPRITE A5   | xy: { 0x050, 0x0B0, U } | s: 0x00
#_09E788: db $0A, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x0A0, U } | s: 0x00
#_09E78B: db $11, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x110, U } | s: 0x00
#_09E78E: db $16, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x160, U } | s: 0x00
#_09E791: db $17, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x170, U } | s: 0x00
#_09E794: db $18, $07, $80 ; SPRITE 80   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E797: db $19, $08, $A6 ; SPRITE A6   | xy: { 0x080, 0x190, U } | s: 0x00
#_09E79A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BD:
#_09E79B: db $00 ; Unlayered OAM
#_09E79C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BE:
#_09E79D: db $00 ; Unlayered OAM
#_09E79E: db $08, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x080, U } | s: 0x00
#_09E7A1: db $12, $14, $A1 ; SPRITE A1   | xy: { 0x140, 0x120, U } | s: 0x00
#_09E7A4: db $15, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x150, U } | s: 0x00
#_09E7A7: db $15, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x150, U } | s: 0x00
#_09E7AA: db $16, $18, $91 ; SPRITE 91   | xy: { 0x180, 0x160, U } | s: 0x00
#_09E7AD: db $1A, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1A0, U } | s: 0x00
#_09E7B0: db $1A, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
#_09E7B3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BF:
#_09E7B4: db $00 ; Unlayered OAM
#_09E7B5: db $18, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x180, U } | s: 0x00
#_09E7B8: db $15, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x150, U } | s: 0x00
#_09E7BB: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C0:
#_09E7BC: db $00 ; Unlayered OAM
#_09E7BD: db $05, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x050, U } | s: 0x00
#_09E7C0: db $07, $1A, $46 ; SPRITE 46   | xy: { 0x1A0, 0x070, U } | s: 0x00
#_09E7C3: db $09, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x090, U } | s: 0x00
#_09E7C6: db $0B, $14, $46 ; SPRITE 46   | xy: { 0x140, 0x0B0, U } | s: 0x00
#_09E7C9: db $FE, $00, $E4 ; small key on above sprite
#_09E7CC: db $0E, $06, $41 ; SPRITE 41   | xy: { 0x060, 0x0E0, U } | s: 0x00
#_09E7CF: db $18, $04, $41 ; SPRITE 41   | xy: { 0x040, 0x180, U } | s: 0x00
#_09E7D2: db $1B, $14, $46 ; SPRITE 46   | xy: { 0x140, 0x1B0, U } | s: 0x00
#_09E7D5: db $1B, $1B, $41 ; SPRITE 41   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
#_09E7D8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C1:
#_09E7D9: db $00 ; Unlayered OAM
#_09E7DA: db $17, $15, $1E ; SPRITE 1E   | xy: { 0x150, 0x170, U } | s: 0x00
#_09E7DD: db $05, $14, $C5 ; SPRITE C5   | xy: { 0x140, 0x050, U } | s: 0x00
#_09E7E0: db $05, $1B, $C5 ; SPRITE C5   | xy: { 0x1B0, 0x050, U } | s: 0x00
#_09E7E3: db $0B, $06, $A7 ; SPRITE A7   | xy: { 0x060, 0x0B0, U } | s: 0x00
#_09E7E6: db $0B, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x0B0, U } | s: 0x00
#_09E7E9: db $15, $17, $7C ; SPRITE 7C   | xy: { 0x170, 0x150, U } | s: 0x00
#_09E7EC: db $16, $09, $C5 ; SPRITE C5   | xy: { 0x090, 0x160, U } | s: 0x00
#_09E7EF: db $18, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x180, U }
#_09E7F2: db $19, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x190, U } | s: 0x00
#_09E7F5: db $1A, $18, $C6 ; SPRITE C6   | xy: { 0x180, 0x1A0, U } | s: 0x00
#_09E7F8: db $1B, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x1B0, U } | s: 0x00
#_09E7FB: db $FE, $00, $E4 ; small key on above sprite
#_09E7FE: db $1B, $1B, $7C ; SPRITE 7C   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
#_09E801: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C2:
#_09E802: db $01 ; Layered OAM
#_09E803: db $8B, $15, $80 ; SPRITE 80   | xy: { 0x150, 0x0B0, L } | s: 0x00
#_09E806: db $0C, $0B, $80 ; SPRITE 80   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
#_09E809: db $10, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x100, U } | s: 0x00
#_09E80C: db $92, $10, $5B ; SPRITE 5B   | xy: { 0x100, 0x120, L } | s: 0x00
#_09E80F: db $92, $19, $5B ; SPRITE 5B   | xy: { 0x190, 0x120, L } | s: 0x00
#_09E812: db $94, $10, $D1 ; SPRITE D1   | xy: { 0x100, 0x140, L } | s: 0x00
#_09E815: db $96, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x160, L } | s: 0x00
#_09E818: db $96, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x160, L } | s: 0x00
#_09E81B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C3:
#_09E81C: db $00 ; Unlayered OAM
#_09E81D: db $06, $05, $C5 ; SPRITE C5   | xy: { 0x050, 0x060, U } | s: 0x00
#_09E820: db $09, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x090, U } | s: 0x00
#_09E823: db $0D, $11, $95 ; SPRITE 95   | xy: { 0x110, 0x0D0, U } | s: 0x00
#_09E826: db $11, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x110, U } | s: 0x00
#_09E829: db $15, $11, $95 ; SPRITE 95   | xy: { 0x110, 0x150, U } | s: 0x00
#_09E82C: db $1A, $F7, $0B ; OVERLORD 0B | xy: { 0x170, 0x1A0, U }
#_09E82F: db $1B, $0A, $15 ; SPRITE 15   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
#_09E832: db $1C, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x1C0, U } | s: 0x00
#_09E835: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C4:
#_09E836: db $00 ; Unlayered OAM
#_09E837: db $0A, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
#_09E83A: db $0F, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x0F0, U } | s: 0x00
#_09E83D: db $1B, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x1B0, U } | s: 0x00
#_09E840: db $15, $0F, $1E ; SPRITE 1E   | xy: { 0x0F0, 0x150, U } | s: 0x00
#_09E843: db $0E, $0F, $C7 ; SPRITE C7   | xy: { 0x0F0, 0x0E0, U } | s: 0x00
#_09E846: db $0F, $0B, $15 ; SPRITE 15   | xy: { 0x0B0, 0x0F0, U } | s: 0x00
#_09E849: db $14, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x140, U } | s: 0x00
#_09E84C: db $14, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x140, U } | s: 0x00
#_09E84F: db $1A, $0B, $15 ; SPRITE 15   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
#_09E852: db $1A, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x1A0, U } | s: 0x00
#_09E855: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C5:
#_09E856: db $00 ; Unlayered OAM
#_09E857: db $09, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x090, U } | s: 0x00
#_09E85A: db $0B, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0B0, U } | s: 0x00
#_09E85D: db $0D, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x0D0, U } | s: 0x00
#_09E860: db $0F, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0F0, U } | s: 0x00
#_09E863: db $11, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x110, U } | s: 0x00
#_09E866: db $13, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x130, U } | s: 0x00
#_09E869: db $15, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x150, U } | s: 0x00
#_09E86C: db $15, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x150, U } | s: 0x00
#_09E86F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C6:
#_09E870: db $00 ; Unlayered OAM
#_09E871: db $04, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x040, U } | s: 0x00
#_09E874: db $04, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x040, U } | s: 0x00
#_09E877: db $09, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x090, U } | s: 0x00
#_09E87A: db $09, $17, $24 ; SPRITE 24   | xy: { 0x170, 0x090, U } | s: 0x00
#_09E87D: db $0E, $10, $7C ; SPRITE 7C   | xy: { 0x100, 0x0E0, U } | s: 0x00
#_09E880: db $14, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x140, U } | s: 0x00
#_09E883: db $17, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x170, U } | s: 0x00
#_09E886: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C8:
#_09E887: db $00 ; Unlayered OAM
#_09E888: db $15, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x150, U } | s: 0x00
#_09E88B: db $15, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x150, U } | s: 0x00
#_09E88E: db $15, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x150, U } | s: 0x00
#_09E891: db $18, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x180, U } | s: 0x00
#_09E894: db $18, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x180, U } | s: 0x00
#_09E897: db $18, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x180, U } | s: 0x00
#_09E89A: db $18, $F7, $19 ; OVERLORD 19 | xy: { 0x170, 0x180, U }
#_09E89D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C9:
#_09E89E: db $00 ; Unlayered OAM
#_09E89F: db $05, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x050, U } | s: 0x00
#_09E8A2: db $06, $0F, $4F ; SPRITE 4F   | xy: { 0x0F0, 0x060, U } | s: 0x00
#_09E8A5: db $07, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x070, U } | s: 0x00
#_09E8A8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CB:
#_09E8A9: db $01 ; Layered OAM
#_09E8AA: db $04, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x040, U } | s: 0x00
#_09E8AD: db $89, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x090, L } | s: 0x00
#_09E8B0: db $8A, $10, $A5 ; SPRITE A5   | xy: { 0x100, 0x0A0, L } | s: 0x00
#_09E8B3: db $0A, $13, $8F ; SPRITE 8F   | xy: { 0x130, 0x0A0, U } | s: 0x00
#_09E8B6: db $8A, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x0A0, L } | s: 0x00
#_09E8B9: db $0A, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x0A0, U } | s: 0x00
#_09E8BC: db $10, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x100, U } | s: 0x00
#_09E8BF: db $95, $18, $A6 ; SPRITE A6   | xy: { 0x180, 0x150, L } | s: 0x00
#_09E8C2: db $97, $08, $A6 ; SPRITE A6   | xy: { 0x080, 0x170, L } | s: 0x00
#_09E8C5: db $17, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x170, U } | s: 0x00
#_09E8C8: db $18, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x180, U } | s: 0x00
#_09E8CB: db $1C, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x1C0, U } | s: 0x00
#_09E8CE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CC:
#_09E8CF: db $01 ; Layered OAM
#_09E8D0: db $04, $13, $80 ; SPRITE 80   | xy: { 0x130, 0x040, U } | s: 0x00
#_09E8D3: db $89, $0B, $D1 ; SPRITE D1   | xy: { 0x0B0, 0x090, L } | s: 0x00
#_09E8D6: db $8A, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x0A0, L } | s: 0x00
#_09E8D9: db $8A, $0E, $5B ; SPRITE 5B   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
#_09E8DC: db $0B, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
#_09E8DF: db $8C, $10, $A6 ; SPRITE A6   | xy: { 0x100, 0x0C0, L } | s: 0x00
#_09E8E2: db $8C, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x0C0, L } | s: 0x00
#_09E8E5: db $94, $0E, $80 ; SPRITE 80   | xy: { 0x0E0, 0x140, L } | s: 0x00
#_09E8E8: db $15, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x150, U } | s: 0x00
#_09E8EB: db $96, $06, $5B ; SPRITE 5B   | xy: { 0x060, 0x160, L } | s: 0x00
#_09E8EE: db $96, $09, $5B ; SPRITE 5B   | xy: { 0x090, 0x160, L } | s: 0x00
#_09E8F1: db $98, $09, $A6 ; SPRITE A6   | xy: { 0x090, 0x180, L } | s: 0x00
#_09E8F4: db $16, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x160, U } | s: 0x00
#_09E8F7: db $9C, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x1C0, L } | s: 0x00
#_09E8FA: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CE:
#_09E8FB: db $00 ; Unlayered OAM
#_09E8FC: db $05, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x050, U } | s: 0x00
#_09E8FF: db $05, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x050, U } | s: 0x00
#_09E902: db $05, $1C, $04 ; SPRITE 04   | xy: { 0x1C0, 0x050, U } | s: 0x00
#_09E905: db $09, $14, $1C ; SPRITE 1C   | xy: { 0x140, 0x090, U } | s: 0x00
#_09E908: db $08, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09E90B: db $08, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x080, U } | s: 0x00
#_09E90E: db $09, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x090, U } | s: 0x00
#_09E911: db $09, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x090, U } | s: 0x00
#_09E914: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D0:
#_09E915: db $00 ; Unlayered OAM
#_09E916: db $05, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x050, U } | s: 0x00
#_09E919: db $07, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x070, U } | s: 0x00
#_09E91C: db $07, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x070, U } | s: 0x00
#_09E91F: db $0B, $15, $44 ; SPRITE 44   | xy: { 0x150, 0x0B0, U } | s: 0x00
#_09E922: db $0C, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x0C0, U } | s: 0x00
#_09E925: db $0F, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x0F0, U } | s: 0x00
#_09E928: db $10, $63, $41 ; SPRITE 41   | xy: { 0x030, 0x100, U } | s: 0x03
#_09E92B: db $14, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x140, U } | s: 0x00
#_09E92E: db $16, $1B, $44 ; SPRITE 44   | xy: { 0x1B0, 0x160, U } | s: 0x00
#_09E931: db $19, $06, $6F ; SPRITE 6F   | xy: { 0x060, 0x190, U } | s: 0x00
#_09E934: db $19, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x190, U } | s: 0x00
#_09E937: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D1:
#_09E938: db $00 ; Unlayered OAM
#_09E939: db $06, $14, $61 ; SPRITE 61   | xy: { 0x140, 0x060, U } | s: 0x00
#_09E93C: db $06, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x060, U } | s: 0x00
#_09E93F: db $07, $04, $9B ; SPRITE 9B   | xy: { 0x040, 0x070, U } | s: 0x00
#_09E942: db $08, $0C, $23 ; SPRITE 23   | xy: { 0x0C0, 0x080, U } | s: 0x00
#_09E945: db $09, $05, $C6 ; SPRITE C6   | xy: { 0x050, 0x090, U } | s: 0x00
#_09E948: db $0B, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x0B0, U } | s: 0x00
#_09E94B: db $0B, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
#_09E94E: db $0B, $1B, $20 ; SPRITE 20   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09E951: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D2:
#_09E952: db $00 ; Unlayered OAM
#_09E953: db $06, $18, $9B ; SPRITE 9B   | xy: { 0x180, 0x060, U } | s: 0x00
#_09E956: db $07, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x070, U } | s: 0x00
#_09E959: db $08, $13, $9B ; SPRITE 9B   | xy: { 0x130, 0x080, U } | s: 0x00
#_09E95C: db $08, $1C, $9B ; SPRITE 9B   | xy: { 0x1C0, 0x080, U } | s: 0x00
#_09E95F: db $0A, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x0A0, U } | s: 0x00
#_09E962: db $0C, $16, $4E ; SPRITE 4E   | xy: { 0x160, 0x0C0, U } | s: 0x00
#_09E965: db $0D, $13, $4E ; SPRITE 4E   | xy: { 0x130, 0x0D0, U } | s: 0x00
#_09E968: db $10, $13, $9B ; SPRITE 9B   | xy: { 0x130, 0x100, U } | s: 0x00
#_09E96B: db $14, $14, $4E ; SPRITE 4E   | xy: { 0x140, 0x140, U } | s: 0x00
#_09E96E: db $14, $1C, $4E ; SPRITE 4E   | xy: { 0x1C0, 0x140, U } | s: 0x00
#_09E971: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D5:
#_09E972: db $00 ; Unlayered OAM
#_09E973: db $09, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x090, U } | s: 0x00
#_09E976: db $0D, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0D0, U } | s: 0x00
#_09E979: db $11, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x110, U } | s: 0x00
#_09E97C: db $15, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x150, U } | s: 0x00
#_09E97F: db $15, $04, $26 ; SPRITE 26   | xy: { 0x040, 0x150, U } | s: 0x00
#_09E982: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D6:
#_09E983: db $00 ; Unlayered OAM
#_09E984: db $02, $07, $97 ; SPRITE 97   | xy: { 0x070, 0x020, U } | s: 0x00
#_09E987: db $16, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x160, U } | s: 0x00
#_09E98A: db $16, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x160, U } | s: 0x00
#_09E98D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D8:
#_09E98E: db $00 ; Unlayered OAM
#_09E98F: db $05, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x050, U } | s: 0x00
#_09E992: db $05, $18, $84 ; SPRITE 84   | xy: { 0x180, 0x050, U } | s: 0x00
#_09E995: db $09, $17, $4F ; SPRITE 4F   | xy: { 0x170, 0x090, U } | s: 0x00
#_09E998: db $09, $18, $4F ; SPRITE 4F   | xy: { 0x180, 0x090, U } | s: 0x00
#_09E99B: db $0A, $16, $4F ; SPRITE 4F   | xy: { 0x160, 0x0A0, U } | s: 0x00
#_09E99E: db $0A, $19, $4F ; SPRITE 4F   | xy: { 0x190, 0x0A0, U } | s: 0x00
#_09E9A1: db $0B, $16, $4E ; SPRITE 4E   | xy: { 0x160, 0x0B0, U } | s: 0x00
#_09E9A4: db $0B, $19, $4E ; SPRITE 4E   | xy: { 0x190, 0x0B0, U } | s: 0x00
#_09E9A7: db $14, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x140, U } | s: 0x00
#_09E9AA: db $16, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x160, U } | s: 0x00
#_09E9AD: db $1B, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x1B0, U } | s: 0x00
#_09E9B0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D9:
#_09E9B1: db $00 ; Unlayered OAM
#_09E9B2: db $14, $EC, $02 ; OVERLORD 02 | xy: { 0x0C0, 0x140, U }
#_09E9B5: db $15, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x150, U } | s: 0x00
#_09E9B8: db $18, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x180, U } | s: 0x00
#_09E9BB: db $1B, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x1B0, U } | s: 0x00
#_09E9BE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DA:
#_09E9BF: db $00 ; Unlayered OAM
#_09E9C0: db $18, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x180, U } | s: 0x00
#_09E9C3: db $18, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x180, U } | s: 0x00
#_09E9C6: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DB:
#_09E9C7: db $01 ; Layered OAM
#_09E9C8: db $04, $03, $D1 ; SPRITE D1   | xy: { 0x030, 0x040, U } | s: 0x00
#_09E9CB: db $8A, $0E, $5B ; SPRITE 5B   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
#_09E9CE: db $8B, $17, $A6 ; SPRITE A6   | xy: { 0x170, 0x0B0, L } | s: 0x00
#_09E9D1: db $8C, $0F, $A5 ; SPRITE A5   | xy: { 0x0F0, 0x0C0, L } | s: 0x00
#_09E9D4: db $10, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x100, U } | s: 0x00
#_09E9D7: db $10, $14, $80 ; SPRITE 80   | xy: { 0x140, 0x100, U } | s: 0x00
#_09E9DA: db $95, $0F, $A5 ; SPRITE A5   | xy: { 0x0F0, 0x150, L } | s: 0x00
#_09E9DD: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DC:
#_09E9DE: db $01 ; Layered OAM
#_09E9DF: db $8A, $09, $A5 ; SPRITE A5   | xy: { 0x090, 0x0A0, L } | s: 0x00
#_09E9E2: db $8A, $0E, $5C ; SPRITE 5C   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
#_09E9E5: db $8C, $0F, $A6 ; SPRITE A6   | xy: { 0x0F0, 0x0C0, L } | s: 0x00
#_09E9E8: db $10, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x100, U } | s: 0x00
#_09E9EB: db $10, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x100, U } | s: 0x00
#_09E9EE: db $96, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x160, L } | s: 0x00
#_09E9F1: db $96, $0F, $A6 ; SPRITE A6   | xy: { 0x0F0, 0x160, L } | s: 0x00
#_09E9F4: db $97, $09, $A5 ; SPRITE A5   | xy: { 0x090, 0x170, L } | s: 0x00
#_09E9F7: db $97, $16, $80 ; SPRITE 80   | xy: { 0x160, 0x170, L } | s: 0x00
#_09E9FA: db $1C, $05, $80 ; SPRITE 80   | xy: { 0x050, 0x1C0, U } | s: 0x00
#_09E9FD: db $1C, $0F, $8F ; SPRITE 8F   | xy: { 0x0F0, 0x1C0, U } | s: 0x00
#_09EA00: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DE:
#_09EA01: db $00 ; Unlayered OAM
#_09EA02: db $05, $17, $A3 ; SPRITE A3   | xy: { 0x170, 0x050, U } | s: 0x00
#_09EA05: db $05, $17, $A4 ; SPRITE A4   | xy: { 0x170, 0x050, U } | s: 0x00
#_09EA08: db $05, $17, $A2 ; SPRITE A2   | xy: { 0x170, 0x050, U } | s: 0x00
#_09EA0B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DF:
#_09EA0C: db $00 ; Unlayered OAM
#_09EA0D: db $95, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x150, L } | s: 0x00
#_09EA10: db $96, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x160, L } | s: 0x00
#_09EA13: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E0:
#_09EA14: db $00 ; Unlayered OAM
#_09EA15: db $06, $04, $6A ; SPRITE 6A   | xy: { 0x040, 0x060, U } | s: 0x00
#_09EA18: db $06, $0B, $6A ; SPRITE 6A   | xy: { 0x0B0, 0x060, U } | s: 0x00
#_09EA1B: db $06, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x060, U } | s: 0x00
#_09EA1E: db $09, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x090, U } | s: 0x00
#_09EA21: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E1:
#_09EA22: db $00 ; Unlayered OAM
#_09EA23: db $0D, $17, $EB ; SPRITE EB   | xy: { 0x170, 0x0D0, U } | s: 0x00
#_09EA26: db $92, $07, $29 ; SPRITE 29   | xy: { 0x070, 0x120, L } | s: 0x00
#_09EA29: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E2:
#_09EA2A: db $00 ; Unlayered OAM
#_09EA2B: db $06, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x060, U } | s: 0x00
#_09EA2E: db $06, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x060, U } | s: 0x00
#_09EA31: db $07, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x070, U } | s: 0x00
#_09EA34: db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
#_09EA37: db $10, $13, $EB ; SPRITE EB   | xy: { 0x130, 0x100, U } | s: 0x00
#_09EA3A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E3:
#_09EA3B: db $00 ; Unlayered OAM
#_09EA3C: db $85, $17, $3A ; SPRITE 3A   | xy: { 0x170, 0x050, L } | s: 0x00
#_09EA3F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E4:
#_09EA40: db $00 ; Unlayered OAM
#_09EA41: db $07, $19, $6F ; SPRITE 6F   | xy: { 0x190, 0x070, U } | s: 0x00
#_09EA44: db $08, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x080, U } | s: 0x00
#_09EA47: db $09, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x090, U } | s: 0x00
#_09EA4A: db $16, $06, $AD ; SPRITE AD   | xy: { 0x060, 0x160, U } | s: 0x00
#_09EA4D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E5:
#_09EA4E: db $00 ; Unlayered OAM
#_09EA4F: db $09, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x090, U } | s: 0x00
#_09EA52: db $09, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x090, U } | s: 0x00
#_09EA55: db $09, $11, $6F ; SPRITE 6F   | xy: { 0x110, 0x090, U } | s: 0x00
#_09EA58: db $0E, $1B, $6F ; SPRITE 6F   | xy: { 0x1B0, 0x0E0, U } | s: 0x00
#_09EA5B: db $12, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x120, U } | s: 0x00
#_09EA5E: db $12, $11, $6F ; SPRITE 6F   | xy: { 0x110, 0x120, U } | s: 0x00
#_09EA61: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E6:
#_09EA62: db $00 ; Unlayered OAM
#_09EA63: db $0B, $1B, $6F ; SPRITE 6F   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
#_09EA66: db $0F, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x0F0, U } | s: 0x00
#_09EA69: db $13, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x130, U } | s: 0x00
#_09EA6C: db $17, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x170, U } | s: 0x00
#_09EA6F: db $1B, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09EA72: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E7:
#_09EA73: db $00 ; Unlayered OAM
#_09EA74: db $04, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x040, U } | s: 0x00
#_09EA77: db $04, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x040, U } | s: 0x00
#_09EA7A: db $0B, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0B0, U } | s: 0x00
#_09EA7D: db $0C, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
#_09EA80: db $0D, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0D0, U } | s: 0x00
#_09EA83: db $0D, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0D0, U } | s: 0x00
#_09EA86: db $0F, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0F0, U } | s: 0x00
#_09EA89: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E8:
#_09EA8A: db $00 ; Unlayered OAM
#_09EA8B: db $05, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x050, U } | s: 0x00
#_09EA8E: db $08, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x080, U } | s: 0x00
#_09EA91: db $0C, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x0C0, U } | s: 0x00
#_09EA94: db $0C, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x0C0, U } | s: 0x00
#_09EA97: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EA:
#_09EA98: db $00 ; Unlayered OAM
#_09EA99: db $0B, $0B, $EB ; SPRITE EB   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
#_09EA9C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EB:
#_09EA9D: db $00 ; Unlayered OAM
#_09EA9E: db $14, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x140, U } | s: 0x00
#_09EAA1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EE:
#_09EAA2: db $00 ; Unlayered OAM
#_09EAA3: db $04, $10, $18 ; SPRITE 18   | xy: { 0x100, 0x040, U } | s: 0x00
#_09EAA6: db $0E, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x0E0, U } | s: 0x00
#_09EAA9: db $1C, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x1C0, U } | s: 0x00
#_09EAAC: db $0B, $03, $24 ; SPRITE 24   | xy: { 0x030, 0x0B0, U } | s: 0x00
#_09EAAF: db $0C, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x0C0, U } | s: 0x00
#_09EAB2: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EF:
#_09EAB3: db $00 ; Unlayered OAM
#_09EAB4: db $09, $17, $18 ; SPRITE 18   | xy: { 0x170, 0x090, U } | s: 0x00
#_09EAB7: db $0A, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x0A0, U } | s: 0x00
#_09EABA: db $0A, $1B, $18 ; SPRITE 18   | xy: { 0x1B0, 0x0A0, U } | s: 0x00
#_09EABD: db $06, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x060, U } | s: 0x00
#_09EAC0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F0:
#_09EAC1: db $00 ; Unlayered OAM
#_09EAC2: db $03, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x030, U } | s: 0x00
#_09EAC5: db $03, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x030, U } | s: 0x00
#_09EAC8: db $04, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x040, U } | s: 0x00
#_09EACB: db $04, $0A, $6F ; SPRITE 6F   | xy: { 0x0A0, 0x040, U } | s: 0x00
#_09EACE: db $07, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x070, U } | s: 0x00
#_09EAD1: db $0A, $03, $6F ; SPRITE 6F   | xy: { 0x030, 0x0A0, U } | s: 0x00
#_09EAD4: db $0A, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x0A0, U } | s: 0x00
#_09EAD7: db $0C, $0E, $6F ; SPRITE 6F   | xy: { 0x0E0, 0x0C0, U } | s: 0x00
#_09EADA: db $10, $1B, $AD ; SPRITE AD   | xy: { 0x1B0, 0x100, U } | s: 0x00
#_09EADD: db $13, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x130, U } | s: 0x00
#_09EAE0: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F1:
#_09EAE1: db $00 ; Unlayered OAM
#_09EAE2: db $10, $19, $6F ; SPRITE 6F   | xy: { 0x190, 0x100, U } | s: 0x00
#_09EAE5: db $10, $1C, $6F ; SPRITE 6F   | xy: { 0x1C0, 0x100, U } | s: 0x00
#_09EAE8: db $11, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x110, U } | s: 0x00
#_09EAEB: db $11, $1D, $6F ; SPRITE 6F   | xy: { 0x1D0, 0x110, U } | s: 0x00
#_09EAEE: db $12, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x120, U } | s: 0x00
#_09EAF1: db $12, $1E, $6F ; SPRITE 6F   | xy: { 0x1E0, 0x120, U } | s: 0x00
#_09EAF4: db $1B, $06, $6F ; SPRITE 6F   | xy: { 0x060, 0x1B0, U } | s: 0x00
#_09EAF7: db $1B, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x1B0, U } | s: 0x00
#_09EAFA: db $1C, $07, $6F ; SPRITE 6F   | xy: { 0x070, 0x1C0, U } | s: 0x00
#_09EAFD: db $1C, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x1C0, U } | s: 0x00
#_09EB00: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F3:
#_09EB01: db $00 ; Unlayered OAM
#_09EB02: db $14, $06, $78 ; SPRITE 78   | xy: { 0x060, 0x140, U } | s: 0x00
#_09EB05: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F4:
#_09EB06: db $00 ; Unlayered OAM
#_09EB07: db $14, $17, $32 ; SPRITE 32   | xy: { 0x170, 0x140, U } | s: 0x00
#_09EB0A: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F5:
#_09EB0B: db $00 ; Unlayered OAM
#_09EB0C: db $14, $08, $32 ; SPRITE 32   | xy: { 0x080, 0x140, U } | s: 0x00
#_09EB0F: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F9:
#_09EB10: db $00 ; Unlayered OAM
#_09EB11: db $05, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x050, U } | s: 0x00
#_09EB14: db $0F, $15, $18 ; SPRITE 18   | xy: { 0x150, 0x0F0, U } | s: 0x00
#_09EB17: db $13, $11, $18 ; SPRITE 18   | xy: { 0x110, 0x130, U } | s: 0x00
#_09EB1A: db $17, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x170, U } | s: 0x00
#_09EB1D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FA:
#_09EB1E: db $00 ; Unlayered OAM
#_09EB1F: db $0E, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x0E0, U } | s: 0x00
#_09EB22: db $10, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x100, U } | s: 0x00
#_09EB25: db $11, $15, $E3 ; SPRITE E3   | xy: { 0x150, 0x110, U } | s: 0x00
#_09EB28: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FB:
#_09EB29: db $00 ; Unlayered OAM
#_09EB2A: db $0D, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x0D0, U } | s: 0x00
#_09EB2D: db $0A, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x0A0, U } | s: 0x00
#_09EB30: db $12, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x120, U } | s: 0x00
#_09EB33: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FC:
#_09EB34: db $00 ; Unlayered OAM
#_09EB35: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FD:
#_09EB36: db $00 ; Unlayered OAM
#_09EB37: db $0E, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x0E0, U } | s: 0x00
#_09EB3A: db $08, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x080, U } | s: 0x00
#_09EB3D: db $08, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x080, U } | s: 0x00
#_09EB40: db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
#_09EB43: db $11, $0F, $24 ; SPRITE 24   | xy: { 0x0F0, 0x110, U } | s: 0x00
#_09EB46: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FE:
#_09EB47: db $00 ; Unlayered OAM
#_09EB48: db $12, $16, $18 ; SPRITE 18   | xy: { 0x160, 0x120, U } | s: 0x00
#_09EB4B: db $16, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x160, U } | s: 0x00
#_09EB4E: db $16, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x160, U } | s: 0x00
#_09EB51: db $12, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x120, U } | s: 0x00
#_09EB54: db $18, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x180, U } | s: 0x00
#_09EB57: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FF:
#_09EB58: db $00 ; Unlayered OAM
#_09EB59: db $04, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x040, U } | s: 0x00
#_09EB5C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0100:
#_09EB5D: db $00 ; Unlayered OAM
#_09EB5E: db $1B, $0B, $BB ; SPRITE BB   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09EB61: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0101:
#_09EB62: db $00 ; Unlayered OAM
#_09EB63: db $13, $08, $33 ; SPRITE 33   | xy: { 0x080, 0x130, U } | s: 0x00
#_09EB66: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0102:
#_09EB67: db $00 ; Unlayered OAM
#_09EB68: db $18, $03, $1F ; SPRITE 1F   | xy: { 0x030, 0x180, U } | s: 0x00
#_09EB6B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0103:
#_09EB6C: db $00 ; Unlayered OAM
#_09EB6D: db $15, $06, $BC ; SPRITE BC   | xy: { 0x060, 0x150, U } | s: 0x00
#_09EB70: db $1B, $0A, $29 ; SPRITE 29   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
#_09EB73: db $17, $17, $35 ; SPRITE 35   | xy: { 0x170, 0x170, U } | s: 0x00
#_09EB76: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0104:
#_09EB77: db $00 ; Unlayered OAM
#_09EB78: db $17, $1A, $73 ; SPRITE 73   | xy: { 0x1A0, 0x170, U } | s: 0x00
#_09EB7B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0105:
#_09EB7C: db $00 ; Unlayered OAM
#_09EB7D: db $18, $07, $16 ; SPRITE 16   | xy: { 0x070, 0x180, U } | s: 0x00
#_09EB80: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0106:
#_09EB81: db $00 ; Unlayered OAM
#_09EB82: db $1B, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x1B0, U } | s: 0x00
#_09EB85: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0107:
#_09EB86: db $00 ; Unlayered OAM
#_09EB87: db $15, $03, $3B ; SPRITE 3B   | xy: { 0x030, 0x150, U } | s: 0x00
#_09EB8A: db $1B, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x1B0, U } | s: 0x00
#_09EB8D: db $1B, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x1B0, U } | s: 0x00
#_09EB90: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0108:
#_09EB91: db $00 ; Unlayered OAM
#_09EB92: db $16, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x160, U } | s: 0x00
#_09EB95: db $16, $0C, $0B ; SPRITE 0B   | xy: { 0x0C0, 0x160, U } | s: 0x00
#_09EB98: db $19, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x190, U } | s: 0x00
#_09EB9B: db $1A, $06, $0B ; SPRITE 0B   | xy: { 0x060, 0x1A0, U } | s: 0x00
#_09EB9E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0109:
#_09EB9F: db $00 ; Unlayered OAM
#_09EBA0: db $1B, $0A, $E9 ; SPRITE E9   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
#_09EBA3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010A:
#_09EBA4: db $00 ; Unlayered OAM
#_09EBA5: db $04, $19, $16 ; SPRITE 16   | xy: { 0x190, 0x040, U } | s: 0x00
#_09EBA8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010B:
#_09EBA9: db $00 ; Unlayered OAM
#_09EBAA: db $03, $0F, $06 ; SPRITE 06   | xy: { 0x0F0, 0x030, U } | s: 0x00
#_09EBAD: db $06, $ED, $1A ; OVERLORD 1A | xy: { 0x0D0, 0x060, U }
#_09EBB0: db $06, $F0, $1A ; OVERLORD 1A | xy: { 0x100, 0x060, U }
#_09EBB3: db $07, $F2, $1A ; OVERLORD 1A | xy: { 0x120, 0x070, U }
#_09EBB6: db $09, $EF, $1A ; OVERLORD 1A | xy: { 0x0F0, 0x090, U }
#_09EBB9: db $03, $12, $04 ; SPRITE 04   | xy: { 0x120, 0x030, U } | s: 0x00
#_09EBBC: db $07, $0D, $15 ; SPRITE 15   | xy: { 0x0D0, 0x070, U } | s: 0x00
#_09EBBF: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010C:
#_09EBC0: db $00 ; Unlayered OAM
#_09EBC1: db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
#_09EBC4: db $07, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x070, U } | s: 0x00
#_09EBC7: db $08, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x080, U } | s: 0x00
#_09EBCA: db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
#_09EBCD: db $14, $07, $83 ; SPRITE 83   | xy: { 0x070, 0x140, U } | s: 0x00
#_09EBD0: db $14, $08, $83 ; SPRITE 83   | xy: { 0x080, 0x140, U } | s: 0x00
#_09EBD3: db $14, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x140, U } | s: 0x00
#_09EBD6: db $1A, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
#_09EBD9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010D:
#_09EBDA: db $00 ; Unlayered OAM
#_09EBDB: db $16, $05, $5B ; SPRITE 5B   | xy: { 0x050, 0x160, U } | s: 0x00
#_09EBDE: db $16, $0A, $5C ; SPRITE 5C   | xy: { 0x0A0, 0x160, U } | s: 0x00
#_09EBE1: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010E:
#_09EBE2: db $00 ; Unlayered OAM
#_09EBE3: db $06, $06, $28 ; SPRITE 28   | xy: { 0x060, 0x060, U } | s: 0x00
#_09EBE6: db $06, $18, $28 ; SPRITE 28   | xy: { 0x180, 0x060, U } | s: 0x00
#_09EBE9: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010F:
#_09EBEA: db $00 ; Unlayered OAM
#_09EBEB: db $15, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x150, U } | s: 0x00
#_09EBEE: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0110:
#_09EBEF: db $00 ; Unlayered OAM
#_09EBF0: db $15, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x150, U } | s: 0x00
#_09EBF3: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0111:
#_09EBF4: db $00 ; Unlayered OAM
#_09EBF5: db $1B, $0B, $65 ; SPRITE 65   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
#_09EBF8: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0112:
#_09EBF9: db $00 ; Unlayered OAM
#_09EBFA: db $0A, $07, $28 ; SPRITE 28   | xy: { 0x070, 0x0A0, U } | s: 0x00
#_09EBFD: db $14, $17, $BB ; SPRITE BB   | xy: { 0x170, 0x140, U } | s: 0x00
#_09EC00: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0114:
#_09EC01: db $00 ; Unlayered OAM
#_09EC02: db $18, $07, $72 ; SPRITE 72   | xy: { 0x070, 0x180, U } | s: 0x00
#_09EC05: db $14, $19, $28 ; SPRITE 28   | xy: { 0x190, 0x140, U } | s: 0x00
#_09EC08: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0115:
#_09EC09: db $00 ; Unlayered OAM
#_09EC0A: db $16, $17, $C8 ; SPRITE C8   | xy: { 0x170, 0x160, U } | s: 0x00
#_09EC0D: db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
#_09EC10: db $07, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x070, U } | s: 0x00
#_09EC13: db $08, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x080, U } | s: 0x00
#_09EC16: db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
#_09EC19: db $09, $07, $72 ; SPRITE 72   | xy: { 0x070, 0x090, U } | s: 0x00
#_09EC1C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0116:
#_09EC1D: db $00 ; Unlayered OAM
#_09EC1E: db $18, $17, $72 ; SPRITE 72   | xy: { 0x170, 0x180, U } | s: 0x00
#_09EC21: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0118:
#_09EC22: db $00 ; Unlayered OAM
#_09EC23: db $1B, $19, $BB ; SPRITE BB   | xy: { 0x190, 0x1B0, U } | s: 0x00
#_09EC26: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0119:
#_09EC27: db $00 ; Unlayered OAM
#_09EC28: db $18, $0E, $29 ; SPRITE 29   | xy: { 0x0E0, 0x180, U } | s: 0x00
#_09EC2B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011A:
#_09EC2C: db $00 ; Unlayered OAM
#_09EC2D: db $17, $18, $28 ; SPRITE 28   | xy: { 0x180, 0x170, U } | s: 0x00
#_09EC30: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011B:
#_09EC31: db $00 ; Unlayered OAM
#_09EC32: db $09, $18, $EB ; SPRITE EB   | xy: { 0x180, 0x090, U } | s: 0x00
#_09EC35: db $96, $05, $EB ; SPRITE EB   | xy: { 0x050, 0x160, L } | s: 0x00
#_09EC38: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011C:
#_09EC39: db $00 ; Unlayered OAM
#_09EC3A: db $19, $09, $B5 ; SPRITE B5   | xy: { 0x090, 0x190, U } | s: 0x00
#_09EC3D: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011E:
#_09EC3E: db $00 ; Unlayered OAM
#_09EC3F: db $07, $05, $E3 ; SPRITE E3   | xy: { 0x050, 0x070, U } | s: 0x00
#_09EC42: db $07, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x070, U } | s: 0x00
#_09EC45: db $08, $05, $E3 ; SPRITE E3   | xy: { 0x050, 0x080, U } | s: 0x00
#_09EC48: db $08, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x080, U } | s: 0x00
#_09EC4B: db $16, $18, $BB ; SPRITE BB   | xy: { 0x180, 0x160, U } | s: 0x00
#_09EC4E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011F:
#_09EC4F: db $00 ; Unlayered OAM
#_09EC50: db $16, $17, $BB ; SPRITE BB   | xy: { 0x170, 0x160, U } | s: 0x00
#_09EC53: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0120:
#_09EC54: db $00 ; Unlayered OAM
#_09EC55: db $07, $17, $B2 ; SPRITE B2   | xy: { 0x170, 0x070, U } | s: 0x00
#_09EC58: db $08, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x080, U } | s: 0x00
#_09EC5B: db $09, $1A, $E3 ; SPRITE E3   | xy: { 0x1A0, 0x090, U } | s: 0x00
#_09EC5E: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0121:
#_09EC5F: db $00 ; Unlayered OAM
#_09EC60: db $17, $04, $1A ; SPRITE 1A   | xy: { 0x040, 0x170, U } | s: 0x00
#_09EC63: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0122:
#_09EC64: db $00 ; Unlayered OAM
#_09EC65: db $18, $07, $31 ; SPRITE 31   | xy: { 0x070, 0x180, U } | s: 0x00
#_09EC68: db $18, $17, $31 ; SPRITE 31   | xy: { 0x170, 0x180, U } | s: 0x00
#_09EC6B: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0123:
#_09EC6C: db $00 ; Unlayered OAM
#_09EC6D: db $16, $03, $18 ; SPRITE 18   | xy: { 0x030, 0x160, U } | s: 0x00
#_09EC70: db $16, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x160, U } | s: 0x00
#_09EC73: db $17, $08, $18 ; SPRITE 18   | xy: { 0x080, 0x170, U } | s: 0x00
#_09EC76: db $1A, $03, $18 ; SPRITE 18   | xy: { 0x030, 0x1A0, U } | s: 0x00
#_09EC79: db $05, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x050, U } | s: 0x00
#_09EC7C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0124:
#_09EC7D: db $00 ; Unlayered OAM
#_09EC7E: db $16, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x160, U } | s: 0x00
#_09EC81: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0125:
#_09EC82: db $00 ; Unlayered OAM
#_09EC83: db $16, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x160, U } | s: 0x00
#_09EC86: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0126:
#_09EC87: db $00 ; Unlayered OAM
#_09EC88: db $15, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x150, U } | s: 0x00
#_09EC8B: db $15, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x150, U } | s: 0x00
#_09EC8E: db $16, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x160, U } | s: 0x00
#_09EC91: db $16, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x160, U } | s: 0x00
#_09EC94: db $14, $1C, $EB ; SPRITE EB   | xy: { 0x1C0, 0x140, U } | s: 0x00
#_09EC97: db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0127:
#_09EC98: db $00 ; Unlayered OAM
#_09EC99: db $16, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x160, U } | s: 0x00
#_09EC9C: db $FF ; END

;===================================================================================================

RoomData_Sprites_Empty:
#_09EC9D: db $00 ; Unlayered OAM
#_09EC9E: db $FF ; END

;===================================================================================================

pool SpriteModule_Explode

.oam_groups
#_09EC9F: dw   0,   0 : db $60, $00, $00, $02
#_09ECA7: dw   0,   0 : db $60, $00, $00, $02
#_09ECAF: dw   0,   0 : db $60, $00, $00, $02
#_09ECB7: dw   0,   0 : db $60, $00, $00, $02

#_09ECBF: dw  -5,  -5 : db $62, $00, $00, $02
#_09ECC7: dw   5,  -5 : db $62, $40, $00, $02
#_09ECCF: dw  -5,   5 : db $62, $80, $00, $02
#_09ECD7: dw   5,   5 : db $62, $C0, $00, $02

#_09ECDF: dw  -8,  -8 : db $62, $00, $00, $02
#_09ECE7: dw   8,  -8 : db $62, $40, $00, $02
#_09ECEF: dw  -8,   8 : db $62, $80, $00, $02
#_09ECF7: dw   8,   8 : db $62, $C0, $00, $02

#_09ECFF: dw  -8,  -8 : db $64, $00, $00, $02
#_09ED07: dw   8,  -8 : db $64, $40, $00, $02
#_09ED0F: dw  -8,   8 : db $64, $80, $00, $02
#_09ED17: dw   8,   8 : db $64, $C0, $00, $02

#_09ED1F: dw  -8,  -8 : db $66, $00, $00, $02
#_09ED27: dw   8,  -8 : db $66, $40, $00, $02
#_09ED2F: dw  -8,   8 : db $66, $80, $00, $02
#_09ED37: dw   8,   8 : db $66, $C0, $00, $02

#_09ED3F: dw  -8,  -8 : db $68, $00, $00, $02
#_09ED47: dw   8,  -8 : db $68, $00, $00, $02
#_09ED4F: dw  -8,   8 : db $68, $00, $00, $02
#_09ED57: dw   8,   8 : db $68, $00, $00, $02

#_09ED5F: dw  -8,  -8 : db $6A, $00, $00, $02
#_09ED67: dw   8,  -8 : db $6A, $40, $00, $02
#_09ED6F: dw  -8,   8 : db $6A, $80, $00, $02
#_09ED77: dw   8,   8 : db $6A, $C0, $00, $02

#_09ED7F: dw  -8,  -8 : db $4E, $00, $00, $02
#_09ED87: dw   8,  -8 : db $4E, $40, $00, $02
#_09ED8F: dw  -8,   8 : db $4E, $80, $00, $02
#_09ED97: dw   8,   8 : db $4E, $C0, $00, $02

pool off

;---------------------------------------------------------------------------------------------------

SpriteModule_Explode:
#_09ED9F: PHB
#_09EDA0: PHK
#_09EDA1: PLB

#_09EDA2: JSR .main

#_09EDA5: PLB

#_09EDA6: RTL

;---------------------------------------------------------------------------------------------------

.main
#_09EDA7: LDA.w $0D90,X
#_09EDAA: BEQ Explode_VerifyPrizing

#_09EDAC: LDA.w $0DF0,X
#_09EDAF: BNE .draw

#_09EDB1: STZ.w $0DD0,X

;---------------------------------------------------------------------------------------------------

#_09EDB4: LDY.b #$0F

.next
#_09EDB6: LDA.w $0DD0,Y
#_09EDB9: CMP.b #$04
#_09EDBB: BEQ .exit

#_09EDBD: DEY
#_09EDBE: BPL .next

#_09EDC0: LDY.b #$01
#_09EDC2: STY.w $0AAA

#_09EDC5: JSL CheckIfScreenIsClear
#_09EDC9: BCS .exit

#_09EDCB: STZ.w $0FFC

.exit
#_09EDCE: RTS

;---------------------------------------------------------------------------------------------------

.draw
#_09EDCF: LSR A
#_09EDD0: LSR A
#_09EDD1: EOR.b #$07
#_09EDD3: STA.b $00

#_09EDD5: LDA.b #$00
#_09EDD7: XBA
#_09EDD8: LDA.b $00

#_09EDDA: REP #$20

#_09EDDC: ASL A
#_09EDDD: ASL A
#_09EDDE: ASL A
#_09EDDF: ASL A
#_09EDE0: ASL A

#_09EDE1: ADC.w #.oam_groups
#_09EDE4: STA.b $08

#_09EDE6: SEP #$20

#_09EDE8: LDA.b #$04
#_09EDEA: JSL SpriteDraw_Tabulated

#_09EDEE: RTS

;===================================================================================================

pool Explode_SpawnExplosion

.offset_low
#_09EDEF: db   0,   4,   8,  12
#_09EDF3: db  -4,  -8, -12,   0
#_09EDF7: db   0,   8,  16,  24
#_09EDFB: db -24, -16,  -8,   0

.offset_high
#_09EDFF: db   0,   0,   0,   0
#_09EE03: db  -1,  -1,  -1,   0
#_09EE07: db   0,   0,   0,   0
#_09EE0B: db  -1,  -1,  -1,   0

pool off

;---------------------------------------------------------------------------------------------------

Explode_VerifyPrizing:
#_09EE0F: LDA.b #$02
#_09EE11: STA.w $0F20,X

#_09EE14: LDA.w $0DF0,X
#_09EE17: CMP.b #$20
#_09EE19: BEQ .validate

#_09EE1B: JMP.w Explode_SpawnExplosion

;---------------------------------------------------------------------------------------------------

.validate
#_09EE1E: STZ.w $0DD0,X

#_09EE21: STZ.w $02E4

#_09EE24: LDA.b $5B
#_09EE26: CMP.b #$02
#_09EE28: BEQ .no_win

#_09EE2A: JSL CheckIfScreenIsClear
#_09EE2E: BCC .no_win

#_09EE30: LDY.w $0E20,X
#_09EE33: CPY.b #$D6 ; SPRITE D6
#_09EE35: BCS .ganon

#_09EE37: CPY.b #$7A ; SPRITE 7A
#_09EE39: BNE .not_agahnim

#_09EE3B: PHX

#_09EE3C: JSL PrepareDungeonExitFromBossFight

#_09EE40: PLX

;---------------------------------------------------------------------------------------------------

.no_win
#_09EE41: JMP.w Explode_SpawnExplosion

;---------------------------------------------------------------------------------------------------

.ganon
#_09EE44: LDA.b #$13 ; SONG 13
#_09EE46: STA.w $012C

#_09EE49: JMP.w Explode_SpawnExplosion

;---------------------------------------------------------------------------------------------------

.not_agahnim
#_09EE4C: STY.w $0FB5

#_09EE4F: LDA.b #$EA ; SPRITE EA
#_09EE51: LDY.b #$0E
#_09EE53: JSL Sprite_SpawnDynamically_slot_limited
#_09EE57: JSL Sprite_SetSpawnedCoordinates

#_09EE5B: LDA.b #$20
#_09EE5D: STA.w $0F80,Y

#_09EE60: LDA.b $EE
#_09EE62: STA.w $0F20,Y

#_09EE65: LDA.b #$02

#_09EE67: CPY.b #$09
#_09EE69: BEQ .not_slot9

#_09EE6B: LDA.b #$06

.not_slot9
#_09EE6D: STA.w $0D90,Y

#_09EE70: LDA.b $02
#_09EE72: CLC
#_09EE73: ADC.b #$03
#_09EE75: STA.w $0D00,Y

#_09EE78: LDA.b $03
#_09EE7A: ADC.b #$00
#_09EE7C: STA.w $0D20,Y

#_09EE7F: LDA.w $0FB5
#_09EE82: CMP.b #$CE
#_09EE84: BNE .check_cb

;---------------------------------------------------------------------------------------------------

#_09EE86: LDA.b $02
#_09EE88: CLC
#_09EE89: ADC.b #$10
#_09EE8B: STA.w $0D00,Y

#_09EE8E: LDA.b $03
#_09EE90: ADC.b #$00
#_09EE92: STA.w $0D20,Y

#_09EE95: RTS

;---------------------------------------------------------------------------------------------------

.check_cb
#_09EE96: CMP.b #$CB
#_09EE98: BNE .exit

#_09EE9A: LDA.b #$78
#_09EE9C: STA.w $0D10,Y
#_09EE9F: STA.w $0D00,Y

#_09EEA2: LDA.b $23
#_09EEA4: STA.w $0D30,Y

#_09EEA7: LDA.b $21
#_09EEA9: STA.w $0D20,Y

.exit
#_09EEAC: RTS

;===================================================================================================

Explode_SpawnExplosion:
#_09EEAD: CMP.b #$40
#_09EEAF: BCC .delay

#_09EEB1: CMP.b #$70
#_09EEB3: BCS .draw_sprite

#_09EEB5: AND.b #$01
#_09EEB7: BNE .delay

.draw_sprite
#_09EEB9: JSL SpriteModule_Active_long

.delay
#_09EEBD: LDA.b #$07
#_09EEBF: STA.b $0E

#_09EEC1: LDA.w $0E20,X
#_09EEC4: STA.b $0F

#_09EEC6: CMP.b #$92 ; SPRITE 92
#_09EEC8: BNE .not_king_helma

#_09EECA: LSR.b $0E

.not_king_helma
#_09EECC: LDA.w $0DF0,X
#_09EECF: CMP.b #$C0
#_09EED1: BCC .delay_more

#_09EED3: RTS

;---------------------------------------------------------------------------------------------------

.delay_more
#_09EED4: PHA

#_09EED5: AND.b #$03
#_09EED7: BNE .skip_sfx

#_09EED9: LDA.b #$0C ; SFX2.0C
#_09EEDB: JSL SpriteSFX_QueueSFX2WithPan

.skip_sfx
#_09EEDF: PLA
#_09EEE0: AND.b $0E
#_09EEE2: BNE .exit

#_09EEE4: LDA.b #$1C ; SPRITE 1C
#_09EEE6: JSL Sprite_SpawnDynamically
#_09EEEA: BMI .exit

#_09EEEC: LDA.b #$0B
#_09EEEE: STA.w $0AAA

#_09EEF1: LDA.b #$04
#_09EEF3: STA.w $0DD0,Y

#_09EEF6: LDA.b #$03
#_09EEF8: STA.w $0E40,Y

#_09EEFB: LDA.b #$0C
#_09EEFD: STA.w $0F50,Y

;---------------------------------------------------------------------------------------------------

#_09EF00: PHX

#_09EF01: JSL GetRandomNumber
#_09EF05: AND.b #$07
#_09EF07: TAX

#_09EF08: LDA.b $0F
#_09EF0A: CMP.b #$92 ; SPRITE 92
#_09EF0C: BNE .not_helma_king

#_09EF0E: TXA
#_09EF0F: ORA.b #$08
#_09EF11: TAX

.not_helma_king
#_09EF12: LDA.b $00
#_09EF14: CLC
#_09EF15: ADC.w .offset_low,X
#_09EF18: STA.w $0D10,Y

#_09EF1B: LDA.b $01
#_09EF1D: ADC.w .offset_high,X
#_09EF20: STA.w $0D30,Y

#_09EF23: JSL GetRandomNumber
#_09EF27: AND.b #$07
#_09EF29: TAX

#_09EF2A: LDA.b $0F
#_09EF2C: CMP.b #$92 ; SPRITE 92
#_09EF2E: BNE .not_helma

#_09EF30: TXA
#_09EF31: ORA.b #$08
#_09EF33: TAX

;---------------------------------------------------------------------------------------------------

.not_helma
#_09EF34: LDA.b $02
#_09EF36: CLC
#_09EF37: ADC.w .offset_low,X
#_09EF3A: PHP

#_09EF3B: SEC
#_09EF3C: SBC.b $04
#_09EF3E: STA.w $0D00,Y

#_09EF41: LDA.b $03
#_09EF43: SBC.b #$00

#_09EF45: PLP
#_09EF46: ADC.w .offset_high,X
#_09EF49: STA.w $0D20,Y

#_09EF4C: PLX

#_09EF4D: LDA.b #$1F
#_09EF4F: STA.w $0DF0,Y
#_09EF52: STA.w $0D90,Y

.exit
#_09EF55: RTS

;===================================================================================================

Sprite_KillFriends:
#_09EF56: LDY.b #$0F

.next
#_09EF58: CPY.w $0FA0
#_09EF5B: BEQ .skip

#_09EF5D: LDA.w $0DD0,Y
#_09EF60: BEQ .skip

#_09EF62: LDA.w $0CAA,Y
#_09EF65: AND.b #$02
#_09EF67: BNE .skip

#_09EF69: LDA.w $0E20,Y
#_09EF6C: CMP.b #$7A ; SPRITE 7A
#_09EF6E: BEQ .skip

#_09EF70: LDA.b #$06
#_09EF72: STA.w $0DD0,Y

#_09EF75: LDA.b #$0F
#_09EF77: STA.w $0DF0,Y

#_09EF7A: LDA.b #$00
#_09EF7C: STA.w $0E60,Y
#_09EF7F: STA.w $0BE0,Y

#_09EF82: LDA.b #$03
#_09EF84: STA.w $0E40,Y

.skip
#_09EF87: DEY
#_09EF88: BPL .next

#_09EF8A: RTL

;===================================================================================================

pool Garnish16_ThrownItemDebris

.offset_x
#_09EF8B: dw   0,   8,   0,   8
#_09EF93: dw  -2,   9,  -1,   9
#_09EF9B: dw  -4,   9,  -1,  10
#_09EFA3: dw  -6,   9,  -1,  12
#_09EFAB: dw  -7,   9,  -2,  13
#_09EFB3: dw  -9,   9,  -3,  14
#_09EFBB: dw  -4,  -4,   9,  15
#_09EFC3: dw  -3,  -3,  -3,   9
#_09EFCB: dw  -4,   4,   6,  10
#_09EFD3: dw  -1,   4,   6,   7
#_09EFDB: dw   0,   2,   4,   7
#_09EFE3: dw   1,   1,   5,   7
#_09EFEB: dw   0,  -2,   8,   9
#_09EFF3: dw  -1,  -6,   9,  10
#_09EFFB: dw  -2,  -7,  12,  11
#_09F003: dw  -3,  -9,   4,   6

;---------------------------------------------------------------------------------------------------

.offset_y
#_09F00B: db   0,   0,   8,   8
#_09F00F: db   0,  -1,  10,  10
#_09F013: db   0,  -3,  11,   7
#_09F017: db   1,  -4,  12,   8
#_09F01B: db   1,  -4,  13,   9
#_09F01F: db   2,  -4,  16,  10
#_09F023: db  14,  14,  -4,  11
#_09F027: db  16,  16,  16,  -1
#_09F02B: db   2,  -5,   5,   1
#_09F02F: db   3,  -7,   8,   2
#_09F033: db   4,  -8,   4,  10
#_09F037: db  -9,   4,   4,  12
#_09F03B: db -10,   4,   8,  14
#_09F03F: db -12,   4,   8,  15
#_09F043: db -15,   3,   8,  17
#_09F047: db -17,   1,  18,  15

;---------------------------------------------------------------------------------------------------

.char
#_09F04B: db $58, $58, $58, $58
#_09F04F: db $58, $58, $58, $58
#_09F053: db $58, $58, $58, $58
#_09F057: db $58, $58, $58, $58
#_09F05B: db $48, $58, $58, $58
#_09F05F: db $48, $58, $58, $48
#_09F063: db $48, $48, $58, $48
#_09F067: db $48, $48, $48, $48
#_09F06B: db $59, $59, $59, $59
#_09F06F: db $59, $59, $59, $59
#_09F073: db $59, $59, $59, $59
#_09F077: db $59, $59, $59, $59
#_09F07B: db $59, $59, $59, $59
#_09F07F: db $59, $59, $59, $59
#_09F083: db $59, $59, $59, $59
#_09F087: db $59, $59, $59, $59

;---------------------------------------------------------------------------------------------------

.prop
#_09F08B: db $80, $00, $80, $40
#_09F08F: db $80, $40, $80, $00
#_09F093: db $00, $C0, $00, $80
#_09F097: db $80, $40, $80, $00
#_09F09B: db $80, $C0, $00, $80
#_09F09F: db $00, $00, $80, $00
#_09F0A3: db $80, $80, $80, $80
#_09F0A7: db $00, $00, $00, $00
#_09F0AB: db $40, $40, $40, $00
#_09F0AF: db $40, $40, $40, $00
#_09F0B3: db $40, $40, $00, $00
#_09F0B7: db $80, $00, $40, $40
#_09F0BB: db $40, $00, $40, $40
#_09F0BF: db $40, $40, $40, $40
#_09F0C3: db $40, $40, $00, $00
#_09F0C7: db $40, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Garnish16_ThrownItemDebris:
#_09F0CB: JSR Garnish_PrepOAMCoord

#_09F0CE: LDA.l $7FF9FE,X
#_09F0D2: STA.b $05

#_09F0D4: LDA.w $0FC6
#_09F0D7: CMP.b #$03
#_09F0D9: BCS .exit

#_09F0DB: LDA.l $7FF92C,X
#_09F0DF: CMP.b #$03
#_09F0E1: BNE .special_draw

#_09F0E3: JSR GarnishDraw_ThrownItemDebris

.exit
#_09F0E6: RTS

;---------------------------------------------------------------------------------------------------

.special_draw
#_09F0E7: STA.w $0FB5

#_09F0EA: TAY

#_09F0EB: LDA.l $7FF90E,X
#_09F0EF: LSR A
#_09F0F0: LSR A
#_09F0F1: EOR.b #$07
#_09F0F3: ASL A
#_09F0F4: ASL A

#_09F0F5: CPY.b #$04
#_09F0F7: BEQ .do_offset

#_09F0F9: CPY.b #$02
#_09F0FB: BNE .not_outdoors_bush

#_09F0FD: LDY.b $1B
#_09F0FF: BNE .not_outdoors_bush

;---------------------------------------------------------------------------------------------------

.do_offset
#_09F101: CLC
#_09F102: ADC.b #$20

.not_outdoors_bush
#_09F104: STA.b $06

#_09F106: LDY.b #$00

#_09F108: PHX

#_09F109: LDX.b #$03

;---------------------------------------------------------------------------------------------------

.next_char
#_09F10B: PHX

#_09F10C: TXA
#_09F10D: CLC
#_09F10E: ADC.b $06
#_09F110: PHA

#_09F111: ASL A
#_09F112: TAX

#_09F113: REP #$20

#_09F115: LDA.b $00
#_09F117: CLC
#_09F118: ADC.w .offset_x,X
#_09F11B: STA.b ($90),Y

#_09F11D: AND.w #$0100
#_09F120: STA.b $0E

#_09F122: SEP #$20

#_09F124: PLX

#_09F125: LDA.b $02
#_09F127: CLC
#_09F128: ADC.w .offset_y,X
#_09F12B: INY

#_09F12C: STA.b ($90),Y

#_09F12E: LDA.w $0FB5
#_09F131: BNE .check_flip

#_09F133: LDA.b #$4E
#_09F135: BRA .use_char

.check_flip
#_09F137: CMP.b #$80
#_09F139: LDA.w .char,X
#_09F13C: BCC .use_char

#_09F13E: LDA.b #$F2

.use_char
#_09F140: INY
#_09F141: STA.b ($90),Y

#_09F143: LDA.w .prop,X

#_09F146: INY

#_09F147: ORA.b $05
#_09F149: STA.b ($90),Y

#_09F14B: PHY

#_09F14C: TYA
#_09F14D: LSR A
#_09F14E: LSR A
#_09F14F: TAY

#_09F150: LDA.b $0F
#_09F152: STA.b ($92),Y

#_09F154: PLY
#_09F155: INY

#_09F156: PLX
#_09F157: DEX
#_09F158: BPL .next_char

;---------------------------------------------------------------------------------------------------

#_09F15A: PLX

#_09F15B: RTS

;===================================================================================================

pool GarnishDraw_ThrownItemDebris

.offset_x
#_09F15C: dw  -8,   8,  16
#_09F162: dw  -5,   8,  15
#_09F168: dw  -1,   7,  11
#_09F16E: dw   1,   3,   8

.offset_y
#_09F174: db   7,   2,  12
#_09F177: db   9,   2,  10
#_09F17A: db  11,   2,  11
#_09F17D: db   7,   3,   8

.char
#_09F180: db $E2, $E2, $E2
#_09F183: db $E2, $F2, $F2
#_09F186: db $F2, $E2, $E2
#_09F189: db $F2, $E2, $E2

.prop
#_09F18C: db $00, $00, $00
#_09F18F: db $00, $80, $40
#_09F192: db $00, $80, $40
#_09F195: db $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

GarnishDraw_ThrownItemDebris:
#_09F198: LDA.l $7FF90E,X
#_09F19C: CMP.b #$10
#_09F19E: BNE .skip

#_09F1A0: LDA.b #$00
#_09F1A2: STA.l $7FF800,X

.skip
#_09F1A6: AND.b #$0F
#_09F1A8: LSR A
#_09F1A9: LSR A
#_09F1AA: STA.b $06

#_09F1AC: ASL A
#_09F1AD: ADC.b $06
#_09F1AF: STA.b $06

#_09F1B1: LDY.b #$00

#_09F1B3: PHX

;---------------------------------------------------------------------------------------------------

#_09F1B4: LDX.b #$02

.next_object
#_09F1B6: PHX

#_09F1B7: TXA
#_09F1B8: CLC
#_09F1B9: ADC.b $06
#_09F1BB: PHA

#_09F1BC: ASL A
#_09F1BD: TAX

#_09F1BE: REP #$20

#_09F1C0: LDA.b $00
#_09F1C2: CLC
#_09F1C3: ADC.w .offset_x,X
#_09F1C6: STA.b ($90),Y

#_09F1C8: AND.w #$0100
#_09F1CB: STA.b $0E

#_09F1CD: SEP #$20

#_09F1CF: PLX

#_09F1D0: LDA.b $02
#_09F1D2: CLC
#_09F1D3: ADC.w .offset_y,X

#_09F1D6: INY
#_09F1D7: STA.b ($90),Y

#_09F1D9: LDA.w .char,X
#_09F1DC: INY
#_09F1DD: STA.b ($90),Y

#_09F1DF: LDA.w .prop,X
#_09F1E2: INY
#_09F1E3: ORA.b #$22
#_09F1E5: STA.b ($90),Y

#_09F1E7: PHY

#_09F1E8: TYA
#_09F1E9: LSR A
#_09F1EA: LSR A
#_09F1EB: TAY

#_09F1EC: LDA.b $0F
#_09F1EE: STA.b ($92),Y

#_09F1F0: PLY
#_09F1F1: INY

#_09F1F2: PLX
#_09F1F3: DEX
#_09F1F4: BPL .next_object

;---------------------------------------------------------------------------------------------------

#_09F1F6: PLX

#_09F1F7: RTS

;===================================================================================================

Sprite_KillSelf:
#_09F1F8: LDA.w $0CAA,X
#_09F1FB: AND.b #$40
#_09F1FD: BNE .force_die

#_09F1FF: LDA.b $1B
#_09F201: BNE .exit

.force_die
#_09F203: STZ.w $0DD0,X

#_09F206: TXA
#_09F207: ASL A
#_09F208: TAY

#_09F209: REP #$20

#_09F20B: LDA.w $0BC0,Y
#_09F20E: STA.b $00

#_09F210: CMP.w #$FFFF
#_09F213: PHP

#_09F214: LSR A
#_09F215: LSR A
#_09F216: LSR A

#_09F217: CLC
#_09F218: ADC.w #$7FEF80
#_09F21B: STA.b $01

#_09F21D: PLP
#_09F21E: SEP #$20
#_09F220: BCS .out_of_range

#_09F222: LDA.b #$7F
#_09F224: STA.b $03

#_09F226: PHX

#_09F227: LDA.b $00
#_09F229: AND.b #$07
#_09F22B: TAX

#_09F22C: LDA.b [$01]
#_09F22E: AND.l SpriteDeathMasks,X
#_09F232: STA.b [$01]

#_09F234: PLX

;---------------------------------------------------------------------------------------------------

.out_of_range
#_09F235: LDA.b $1B
#_09F237: BNE .indoors

#_09F239: TXA
#_09F23A: ASL A
#_09F23B: TAY

#_09F23C: LDA.b #$FF
#_09F23E: STA.w $0BC0,Y
#_09F241: STA.w $0BC1,Y

#_09F244: RTL

;---------------------------------------------------------------------------------------------------

.indoors
#_09F245: LDA.b #$FF
#_09F247: STA.w $0BC0,X

;---------------------------------------------------------------------------------------------------

.exit
#_09F24A: RTL

;---------------------------------------------------------------------------------------------------

SpriteDeathMasks:
#_09F24B: db $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

;===================================================================================================
; FREE ROM: 0x1D
;===================================================================================================
NULL_09F253:
#_09F253: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F25B: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F263: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F26B: db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

pool Module12_GameOver

.vectors
#_09F270: dw GameOver_AdvanceImmediately      ; 0x00
#_09F272: dw GameOver_InitializeAndFadeMusic  ; 0x01
#_09F274: dw GameOver_DelayBeforeIris         ; 0x02
#_09F276: dw GameOver_IrisWipe                ; 0x03
#_09F278: dw Link_SpinAndDie_bounce           ; 0x04
#_09F27A: dw GameOver_SplatAndFade            ; 0x05
#_09F27C: dw GameOver_LoadGAMEOVR             ; 0x06
#_09F27E: dw Animate_GAMEOVER_Letters_bounce  ; 0x07
#_09F280: dw GameOver_Finalize_GAMEOVR        ; 0x08
#_09F282: dw GameOver_SaveAndOrContinue       ; 0x09
#_09F284: dw GameOver_InitializeRevivalFairy  ; 0x0A
#_09F286: dw RevivalFairy_Main_bounce         ; 0x0B
#_09F288: dw GameOver_RiseALittle             ; 0x0C
#_09F28A: dw GameOver_Restore0D               ; 0x0D
#_09F28C: dw GameOver_Restore0E               ; 0x0E
#_09F28E: dw GameOver_ResituateLink           ; 0x0F

pool off

;---------------------------------------------------------------------------------------------------

Module12_GameOver:
#_09F290: LDA.b $11
#_09F292: ASL A
#_09F293: TAX

#_09F294: JSR (.vectors,X)

#_09F297: LDA.b $11
#_09F299: CMP.b #$09
#_09F29B: BEQ .exit

#_09F29D: JSL LinkOAM_Main

.exit
#_09F2A1: RTL

;===================================================================================================

GameOver_AdvanceImmediately:
#_09F2A2: INC.b $11

;===================================================================================================

GameOver_InitializeAndFadeMusic:
#_09F2A4: LDA.w $0130
#_09F2A7: STA.l $7EC227

#_09F2AB: LDA.w $0131
#_09F2AE: STA.l $7EC228

#_09F2B2: LDA.b #$F1 ; SONG F1 - fade
#_09F2B4: STA.w $012C

#_09F2B7: LDA.b #$05 ; SFX1.05
#_09F2B9: STA.w $012D
#_09F2BC: STA.w $0200

#_09F2BF: STZ.w $03F3
#_09F2C2: STZ.w $0322

#_09F2C5: STZ.b $55

;---------------------------------------------------------------------------------------------------

#_09F2C7: REP #$20

#_09F2C9: LDA.l $7EC007
#_09F2CD: STA.l $7EC221

#_09F2D1: LDA.l $7EC009
#_09F2D5: STA.l $7EC223

;---------------------------------------------------------------------------------------------------

#_09F2D9: LDX.b #$00

.next
#_09F2DB: LDA.l $7EC300,X
#_09F2DF: STA.l $7FDD80,X

#_09F2E3: LDA.l $7EC340,X
#_09F2E7: STA.l $7FDDC0,X

#_09F2EB: LDA.l $7EC380,X
#_09F2EF: STA.l $7FDE00,X

#_09F2F3: LDA.l $7EC3C0,X
#_09F2F7: STA.l $7FDE40,X

#_09F2FB: LDA.w #$0000 ; RGB: #000000
#_09F2FE: STA.l $7EC340,X
#_09F302: STA.l $7EC380,X
#_09F306: STA.l $7EC3C0,X

#_09F30A: INX
#_09F30B: INX
#_09F30C: CPX.b #$40
#_09F30E: BNE .next

;---------------------------------------------------------------------------------------------------

#_09F310: STA.l $7EC007
#_09F314: STA.l $7EC009

#_09F318: STZ.w $011A
#_09F31B: STZ.w $011C

#_09F31E: LDA.b $99
#_09F320: STA.l $7EC225

#_09F324: SEP #$20

#_09F326: LDA.b #$20
#_09F328: STA.b $C8

#_09F32A: STZ.w $04A0

#_09F32D: JSL HUD_HandleFloorIndicator

#_09F331: INC.b $16

#_09F333: LDA.b #$05 ; SFX1.05
#_09F335: STA.w $012D

#_09F338: INC.b $11

#_09F33A: RTS

;===================================================================================================

GameOver_DelayBeforeIris:
#_09F33B: DEC.b $C8
#_09F33D: BNE .exit

#_09F33F: JSL GameOver_InitializeLetters
#_09F343: JSL IrisSpotlight_close

#_09F347: LDA.b #$30
#_09F349: STA.b $98
#_09F34B: STZ.b $97

#_09F34D: INC.b $11

.exit
#_09F34F: RTS

;===================================================================================================

GameOver_IrisWipe:
#_09F350: JSL PaletteFilter_RestoreBGSubstractiveStrict

#_09F354: LDA.l $7EC540
#_09F358: STA.l $7EC500

#_09F35C: LDA.l $7EC541
#_09F360: STA.l $7EC501

#_09F364: LDA.b $10

#_09F366: PHA

#_09F367: JSL IrisSpotlight_ConfigureTable

#_09F36B: PLA
#_09F36C: STA.b $10

#_09F36E: LDA.b $11
#_09F370: BNE .exit

;---------------------------------------------------------------------------------------------------

#_09F372: REP #$20

#_09F374: LDA.w #$0018 ; RGB: #C00000
#_09F377: LDX.b #$00

.next_red
#_09F379: STA.l $7EC540,X
#_09F37D: STA.l $7EC560,X

#_09F381: STA.l $7EC580,X
#_09F385: STA.l $7EC5A0,X

#_09F389: STA.l $7EC5C0,X
#_09F38D: STA.l $7EC5E0,X

#_09F391: INX
#_09F392: INX
#_09F393: CPX.b #$20
#_09F395: BNE .next_red

#_09F397: STA.l $7EC500
#_09F39B: STA.l $7EC540

;---------------------------------------------------------------------------------------------------

#_09F39F: SEP #$20

#_09F3A1: JSL IrisSpotlight_ResetTable

#_09F3A5: LDA.b #$20 ; Fixed color RGB: #000000
#_09F3A7: STA.b $9C

#_09F3A9: LDA.b #$40
#_09F3AB: STA.b $9D

#_09F3AD: LDA.b #$80
#_09F3AF: STA.b $9E

#_09F3B1: STZ.b $96
#_09F3B3: STZ.b $97
#_09F3B5: STZ.b $98

;---------------------------------------------------------------------------------------------------

#_09F3B7: LDA.b #$04
#_09F3B9: STA.b $11

#_09F3BB: INC.b $15

#_09F3BD: LDA.b #$0F
#_09F3BF: STA.b $13

#_09F3C1: LDA.b #$14
#_09F3C3: STA.b $1C
#_09F3C5: STZ.b $1D

#_09F3C7: LDA.b #$20
#_09F3C9: STA.b $9A

#_09F3CB: LDA.b #$40
#_09F3CD: STA.b $C8

;---------------------------------------------------------------------------------------------------

#_09F3CF: LDA.b #$00
#_09F3D1: STA.l $7EC007
#_09F3D5: STA.l $7EC009

#_09F3D9: JSL PrepareToDie

.exit
#_09F3DD: RTS

;===================================================================================================

GameOver_SplatAndFade:
#_09F3DE: LDA.b $C8
#_09F3E0: BNE .delay

#_09F3E2: JSL PaletteFilter_RestoreBGSubstractiveStrict

#_09F3E6: LDA.l $7EC540
#_09F3EA: STA.l $7EC500

#_09F3EE: LDA.l $7EC541
#_09F3F2: STA.l $7EC501

#_09F3F6: LDA.l $7EC009
#_09F3FA: CMP.b #$FF
#_09F3FC: BNE .exit

#_09F3FE: LDA.b #$00
#_09F400: STA.l $7EC011
#_09F404: STA.w $0647

#_09F407: LDA.b #$03
#_09F409: STA.b $95

;---------------------------------------------------------------------------------------------------

#_09F40B: LDX.b #$00

#_09F40D: LDA.b #$06
#_09F40F: CMP.l $7EF35C
#_09F413: BEQ .load_gfx

#_09F415: INX

#_09F416: CMP.l $7EF35D
#_09F41A: BEQ .load_gfx

#_09F41C: INX

#_09F41D: CMP.l $7EF35E
#_09F421: BEQ .load_gfx

#_09F423: INX

#_09F424: CMP.l $7EF35F
#_09F428: BEQ .load_gfx

;---------------------------------------------------------------------------------------------------

#_09F42A: STZ.w $05FC
#_09F42D: STZ.w $05FD

#_09F430: LDA.b #$16
#_09F432: STA.b $17
#_09F434: STA.w $0710
#_09F437: INC.b $11

.exit
#_09F439: RTS

;---------------------------------------------------------------------------------------------------

.delay
#_09F43A: DEC.b $C8

#_09F43C: RTS

;---------------------------------------------------------------------------------------------------

.load_gfx
#_09F43D: LDA.b #$02
#_09F43F: STA.l $7EF35C,X

#_09F443: LDA.b #$0C
#_09F445: STA.b $C8

#_09F447: LDA.b #$0F
#_09F449: STA.w $0AAA

#_09F44C: JSL Graphics_LoadChrHalfSlot

#_09F450: STZ.w $0AAA

#_09F453: LDA.b #$0A
#_09F455: STA.b $11

#_09F457: RTS

;===================================================================================================

GameOver_LoadGAMEOVR:
#_09F458: LDA.b #$0C
#_09F45A: STA.b $C8

#_09F45C: LDA.b #$0F
#_09F45E: STA.w $0AAA

#_09F461: JSL Graphics_LoadChrHalfSlot

#_09F465: STZ.w $0AAA

;---------------------------------------------------------------------------------------------------

#_09F468: LDA.b #$05
#_09F46A: STA.w $0AB1

#_09F46D: LDA.b #$02
#_09F46F: STA.w $0AA9

#_09F472: JSL Palettes_Load_SpriteEnvironment_Underworld
#_09F476: JSL Palettes_Load_SpriteMain

#_09F47A: INC.b $15
#_09F47C: INC.b $11

;===================================================================================================

Link_SpinAndDie_bounce:
#_09F47E: JSL Link_SpinAndDie

#_09F482: RTS

;===================================================================================================

Animate_GAMEOVER_Letters_bounce:
#_09F483: JSL Animate_GAMEOVER_Letters

#_09F487: RTS

;===================================================================================================

GameOver_Finalize_GAMEOVR:
#_09F488: JSL Animate_GAMEOVER_Letters

#_09F48C: LDA.b $10
#_09F48E: PHA

#_09F48F: LDA.b $11
#_09F491: PHA

#_09F492: LDA.b #$02
#_09F494: STA.w $1CD8

#_09F497: JSL RenderText

#_09F49B: PLA
#_09F49C: INC A
#_09F49D: STA.b $11

#_09F49F: PLA
#_09F4A0: STA.b $10

#_09F4A2: LDA.b #$02
#_09F4A4: STA.b $C8

#_09F4A6: LDA.b #$0B ; SONG 0B
#_09F4A8: STA.w $012C

;---------------------------------------------------------------------------------------------------

#EXIT_09F4AB:
#_09F4AB: RTS

;===================================================================================================

MaxHealthBasedSpawnHP:
#_09F4AC: db $18, $18, $18, $18, $18, $20, $20, $28
#_09F4B4: db $28, $30, $30, $38, $38, $38, $40, $40
#_09F4BC: db $40, $48, $48, $48, $50

;===================================================================================================

GameOver_SaveAndOrContinue:
#_09F4C1: JSR GameOver_AnimateChoiceFairy

#_09F4C4: LDA.w $0C4A
#_09F4C7: BEQ .no_more_gameover

#_09F4C9: JSL Animate_GAMEOVER_Letters

.no_more_gameover
#_09F4CD: LDA.b $F4
#_09F4CF: AND.b #$20
#_09F4D1: BNE .pressed_select

#_09F4D3: DEC.b $C8
#_09F4D5: BNE .check_for_choice_input

#_09F4D7: INC.b $C8

#_09F4D9: LDA.b $F0
#_09F4DB: AND.b #$0C
#_09F4DD: BEQ .check_for_choice_input

#_09F4DF: AND.b #$04
#_09F4E1: BEQ .pressed_down

.pressed_select
#_09F4E3: INC.b $B0

#_09F4E5: LDA.b $B0
#_09F4E7: CMP.b #$03
#_09F4E9: BMI .play_sfx

#_09F4EB: STZ.b $B0
#_09F4ED: BRA .play_sfx

.pressed_down
#_09F4EF: DEC.b $B0
#_09F4F1: BPL .play_sfx

#_09F4F3: LDA.b #$02
#_09F4F5: STA.b $B0

.play_sfx
#_09F4F7: LDA.b #$0C
#_09F4F9: STA.b $C8

#_09F4FB: LDA.b #$20 ; SFX3.20
#_09F4FD: STA.w $012F

;---------------------------------------------------------------------------------------------------

.check_for_choice_input
#_09F500: LDA.b $F6
#_09F502: AND.b #$C0

#_09F504: ORA.b $F4
#_09F506: AND.b #$D0
#_09F508: BEQ EXIT_09F4AB

#_09F50A: LDA.b #$2C ; SFX2.2C
#_09F50C: STA.w $012E

;===================================================================================================

GameOver_FadeAndRevive:
#_09F50F: LDA.b #$F1 ; SONG F1 - fade
#_09F511: STA.w $012C

#_09F514: LDA.b $1B
#_09F516: BEQ .outdoors

#_09F518: JSL Underworld_FlagRoomData_Quadrants

;---------------------------------------------------------------------------------------------------

.outdoors
#_09F51C: JSL AdjustLinkBunnyStatus

#_09F520: LDA.l $7EF3C5
#_09F524: CMP.b #$03
#_09F526: BCS .dont_skip_bunniness

#_09F528: LDA.b #$00
#_09F52A: STA.l $7EF3CA

#_09F52E: LDA.l $7EF357
#_09F532: BNE .dont_skip_bunniness

#_09F534: JSL ForceNonbunnyStatus

.dont_skip_bunniness
#_09F538: LDA.b $A0 ; ROOM 0000
#_09F53A: ORA.b $A1
#_09F53C: BNE .not_ganon

#_09F53E: STZ.b $1B

.not_ganon
#_09F540: JSL ResetSomeThingsAfterDeath

;---------------------------------------------------------------------------------------------------

#_09F544: LDA.l $7EF3CC
#_09F548: CMP.b #$06 ; FOLLOWER 06
#_09F54A: BEQ .lose_follower

#_09F54C: CMP.b #$0D ; FOLLOWER 0D
#_09F54E: BEQ .lose_follower

#_09F550: CMP.b #$0A ; FOLLOWER 0A
#_09F552: BEQ .lose_follower

#_09F554: CMP.b #$09 ; FOLLOWER 09
#_09F556: BNE .keep_follower

.lose_follower
#_09F558: LDA.b #$00
#_09F55A: STA.l $7EF3CC

;---------------------------------------------------------------------------------------------------

.keep_follower
#_09F55E: LDA.l $7EF36C
#_09F562: LSR A
#_09F563: LSR A
#_09F564: LSR A
#_09F565: TAX

#_09F566: LDA.l MaxHealthBasedSpawnHP,X
#_09F56A: STA.l $7EF36D
#_09F56E: STA.w $04AA

#_09F571: LDA.w $040C
#_09F574: CMP.b #$FF ; DUNGEON FF
#_09F576: BEQ .cave

#_09F578: CMP.b #$02 ; DUNGEON 02
#_09F57A: BNE .castle

#_09F57C: LDA.b #$00 ; DUNGEON 00

.castle
#_09F57E: LSR A
#_09F57F: TAX

#_09F580: LDA.l $7EF36F
#_09F584: STA.l $7EF37C,X

.cave
#_09F588: JSL Sprite_ResetAll

;---------------------------------------------------------------------------------------------------

#_09F58C: REP #$20

#_09F58E: LDA.l $7EF405
#_09F592: CMP.w #$FFFF
#_09F595: BNE .deaths_not_maxed

#_09F597: LDA.l $7EF403
#_09F59B: INC A
#_09F59C: STA.l $7EF403

.deaths_not_maxed
#_09F5A0: SEP #$20

#_09F5A2: INC.w $010A

#_09F5A5: LDA.b $B0
#_09F5A7: CMP.b #$01
#_09F5A9: BEQ GameOver_SaveAndQuit

;---------------------------------------------------------------------------------------------------

#_09F5AB: LDA.b $1B
#_09F5AD: BEQ .died_in_overworld

#_09F5AF: LDA.l $7EF3CC
#_09F5B3: CMP.b #$01 ; FOLLOWER 01
#_09F5B5: BEQ .use_this_spawn

#_09F5B7: LDA.w $040C
#_09F5BA: CMP.b #$FF ; DUNGEON FF
#_09F5BC: BEQ .died_in_cave

#_09F5BE: STZ.w $04AA
#_09F5C1: BRA .use_this_spawn

.died_in_cave
#_09F5C3: STZ.w $0132
#_09F5C6: STZ.b $1B

.died_in_overworld
#_09F5C8: LDA.l $7EF3CA
#_09F5CC: BEQ .use_this_spawn

#_09F5CE: LDA.b #$20
#_09F5D0: STA.b $A0
#_09F5D2: STZ.b $A1

.use_this_spawn
#_09F5D4: LDA.l $7EF3C5
#_09F5D8: BEQ .no_progress

#_09F5DA: LDA.b $B0
#_09F5DC: BNE .dont_save

#_09F5DE: JSL SaveGameFile

.dont_save
#_09F5E2: LDA.b #$05
#_09F5E4: STA.b $10

#_09F5E6: STZ.b $11
#_09F5E8: STZ.b $14

#_09F5EA: RTS

;---------------------------------------------------------------------------------------------------

.no_progress
#_09F5EB: REP #$20

#_09F5ED: LDA.l $701FFE
#_09F5F1: TAX

#_09F5F2: DEX
#_09F5F3: DEX

#_09F5F4: LDA.l SaveFileCopyOffsets,X
#_09F5F8: STA.b $00

#_09F5FA: SEP #$20

#_09F5FC: STZ.w $010A

#_09F5FF: JSL CopySaveToWRAM

#_09F603: RTS

;===================================================================================================

GameOver_SaveAndQuit:
#_09F604: LDA.l $7EF3C5
#_09F608: BEQ .no_progress

#_09F60A: JSL SaveGameFile

.no_progress
#_09F60E: LDA.b #$10
#_09F610: STA.b $1C
#_09F612: STZ.b $1B

#_09F614: JSL InitializeTriforceIntro

#_09F618: STZ.w $04AA
#_09F61B: STZ.w $010A
#_09F61E: STZ.w $0132

#_09F621: SEI

#_09F622: STZ.w NMITIMEN
#_09F625: STZ.w HDMAEN

#_09F628: REP #$30

#_09F62A: STZ.b $E0
#_09F62C: STZ.b $E2
#_09F62E: STZ.b $E4
#_09F630: STZ.b $E6
#_09F632: STZ.b $E8
#_09F634: STZ.b $EA

#_09F636: STZ.w $0120
#_09F639: STZ.w $011E
#_09F63C: STZ.w $0124
#_09F63F: STZ.w $0122

;---------------------------------------------------------------------------------------------------

#_09F642: LDX.w #$0000
#_09F645: TXA

.delete_next
#_09F646: STA.l $7EF000,X
#_09F64A: STA.l $7EF100,X
#_09F64E: STA.l $7EF200,X
#_09F652: STA.l $7EF300,X
#_09F656: STA.l $7EF400,X

#_09F65A: INX
#_09F65B: INX
#_09F65C: CPX.w #$0100
#_09F65F: BNE .delete_next

;---------------------------------------------------------------------------------------------------

#_09F661: SEP #$30

#_09F663: STZ.w $0136

#_09F666: LDA.b #$FF ; SONG FF - transfer
#_09F668: STA.w APUIO0

#_09F66B: JSL LoadOverworldSongs

#_09F66F: LDA.b #$81
#_09F671: STA.w NMITIMEN

#_09F674: RTS

;===================================================================================================

pool GameOver_AnimateChoiceFairy

.fairy_char
#_09F675: db $EA
#_09F676: db $EC

.fairy_height
#_09F677: db $7F
#_09F678: db $8F
#_09F679: db $9F

pool off

;---------------------------------------------------------------------------------------------------

GameOver_AnimateChoiceFairy:
#_09F67A: PHB
#_09F67B: PHK
#_09F67C: PLB

#_09F67D: LDX.b $B0

#_09F67F: LDA.b #$34
#_09F681: STA.w $0850

#_09F684: LDA.w .fairy_height,X
#_09F687: STA.w $0851

#_09F68A: LDA.b $1A
#_09F68C: AND.b #$08
#_09F68E: LSR A
#_09F68F: LSR A
#_09F690: LSR A
#_09F691: TAX

#_09F692: LDA.w .fairy_char,X
#_09F695: STA.w $0852

#_09F698: LDA.b #$78
#_09F69A: STA.w $0853

#_09F69D: LDA.b #$02
#_09F69F: STA.w $0A34

#_09F6A2: PLB

#_09F6A3: RTS

;===================================================================================================

GameOver_InitializeRevivalFairy:
#_09F6A4: JSL ConfigureRevivalAncillae

#_09F6A8: LDA.b #$38
#_09F6AA: STA.l $7EF372

#_09F6AE: INC.b $11

#_09F6B0: STZ.w $0200

#_09F6B3: RTS

;===================================================================================================

RevivalFairy_Main_bounce:
#_09F6B4: JSL RevivalFairy_Main

#_09F6B8: RTS

;===================================================================================================

GameOver_RiseALittle:
#_09F6B9: LDA.l $7EF372
#_09F6BD: BNE GameOver_RunFairyRefill

;---------------------------------------------------------------------------------------------------

#_09F6BF: REP #$20

#_09F6C1: LDX.b #$00

.next_color
#_09F6C3: LDA.l $7FDD80,X
#_09F6C7: STA.l $7EC300,X

#_09F6CB: LDA.l $7FDDC0,X
#_09F6CF: STA.l $7EC340,X

#_09F6D3: LDA.l $7FDE00,X
#_09F6D7: STA.l $7EC380,X

#_09F6DB: LDA.l $7FDE40,X
#_09F6DF: STA.l $7EC3C0,X

#_09F6E3: LDA.w #$0000 ; RGB: #000000
#_09F6E6: STA.l $7EC540,X
#_09F6EA: STA.l $7EC580,X
#_09F6EE: STA.l $7EC5C0,X

#_09F6F2: INX
#_09F6F3: INX
#_09F6F4: CPX.b #$40
#_09F6F6: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_09F6F8: STA.l $7EC500

#_09F6FC: LDA.w #$0000
#_09F6FF: STA.l $7EC007

#_09F703: LDA.w #$0002
#_09F706: STA.l $7EC009

#_09F70A: LDA.l $7EC225
#_09F70E: STA.b $99

#_09F710: SEP #$20

;===================================================================================================

GameOver_AriseAdvancement:
#_09F712: INC.b $11

;===================================================================================================

GameOver_RunFairyRefill:
#_09F714: JSL RevivalFairy_Main
#_09F718: JSL RefillLogic_long

#_09F71C: RTS

;===================================================================================================

GameOver_Restore0D:
#_09F71D: LDA.w $020A
#_09F720: BNE GameOver_RunFairyRefill

#_09F722: LDA.b #$01
#_09F724: STA.w $0AAA

#_09F727: JSL Graphics_LoadChrHalfSlot

#_09F72B: LDA.l $7EC017
#_09F72F: JSL ApplyGrayscaleFixed_Parameterized

#_09F733: BRA GameOver_AriseAdvancement

;===================================================================================================

GameOver_Restore0E:
#_09F735: JSL Graphics_LoadChrHalfSlot

#_09F739: LDA.l $7EC212
#_09F73D: STA.b $1D

#_09F73F: INC.b $11

#_09F741: RTS

;===================================================================================================

GameOver_ResituateLink:
#_09F742: JSL PaletteFilter_RestoreBGAdditiveStrict

#_09F746: LDA.l $7EC540
#_09F74A: STA.l $7EC500

#_09F74E: LDA.l $7EC541
#_09F752: STA.l $7EC501

#_09F756: LDA.l $7EC007
#_09F75A: CMP.b #$20
#_09F75C: BNE EXIT_09F79A

#_09F75E: LDA.b $1B
#_09F760: BNE .indoors

#_09F762: JSL Overworld_SetFixedColAndScroll

;---------------------------------------------------------------------------------------------------

.indoors
#_09F766: LDA.l $7EC212
#_09F76A: STA.b $1D

#_09F76C: LDA.w $010C
#_09F76F: STA.b $10
#_09F771: STZ.b $11

#_09F773: LDA.b #$90
#_09F775: STA.w $031F

#_09F778: LDA.l $7EC227
#_09F77C: STA.w $012C

#_09F77F: LDA.l $7EC228
#_09F783: STA.w $012D

#_09F786: REP #$20

#_09F788: LDA.l $7EC221
#_09F78C: STA.l $7EC007

#_09F790: LDA.l $7EC223
#_09F794: STA.l $7EC009

#_09F798: SEP #$20

;---------------------------------------------------------------------------------------------------

#EXIT_09F79A:
#_09F79A: RTS

;===================================================================================================

pool Module17_SaveAndQuit

.submodules
#_09F79B: dw Module17_00
#_09F79D: dw Module17_01

pool off

;---------------------------------------------------------------------------------------------------

Module17_SaveAndQuit:
#_09F79F: LDA.b $11
#_09F7A1: ASL A
#_09F7A2: TAX

#_09F7A3: JSR (.submodules,X)

#_09F7A6: JSL Sprite_Main
#_09F7AA: JSL LinkOAM_Main

#_09F7AE: RTL

;===================================================================================================

Module17_00:
#_09F7AF: INC.b $11

;===================================================================================================

Module17_01:
#_09F7B1: DEC.b $13
#_09F7B3: BNE EXIT_09F79A

#_09F7B5: LDA.b #$0F
#_09F7B7: STA.b $95

#_09F7B9: LDA.b #$01
#_09F7BB: STA.b $B0

#_09F7BD: JMP.w GameOver_FadeAndRevive

;===================================================================================================
; FREE ROM: 0x1E
;===================================================================================================
NULL_09F7C0:
#_09F7C0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F7C8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F7D0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_09F7D8: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Polyhedral_InitializeThread:
#_09F7DE: PHP
#_09F7DF: PHB

#_09F7E0: REP #$30

#_09F7E2: PHA
#_09F7E3: PHX
#_09F7E4: PHY

#_09F7E5: LDA.w #$0000
#_09F7E8: STA.l $001F00

#_09F7EC: LDX.w #$001F00
#_09F7EF: LDY.w #$001F02
#_09F7F2: LDA.w #$00FD
#_09F7F5: MVN $00, $00

#_09F7F8: LDA.w #$001F31
#_09F7FB: STA.w $1F0A

#_09F7FE: LDA.w #$000C
#_09F801: LDX.w #.registers
#_09F804: LDY.w #$001F32
#_09F807: %MVN(Polyhedral_InitializeThread>>16, $00) ; MVN $09, $00

#_09F80A: PLY
#_09F80B: PLX
#_09F80C: PLA

#_09F80D: PLB
#_09F80E: PLP

#_09F80F: RTL

;---------------------------------------------------------------------------------------------------

.registers
#_09F810: db Polyhedral_RunThread>>16   ; data bank
#_09F811: dw $1F00                      ; direct page
#_09F813: dw $0000                      ; Y
#_09F815: dw $0000                      ; X
#_09F817: dw $0000                      ; A
#_09F819: db $30                        ; P
#_09F81A: dl Polyhedral_RunThread

;===================================================================================================

Polyhedral_RunThread:

.wait
#_09F81D: LDA.b $001F00
#_09F81F: BEQ .wait

#_09F821: LDA.b $001F0C
#_09F823: BNE .wait

#_09F825: JSL Polyhedral_EmptyBitMapBuffer
#_09F829: JSR Polyhedral_SetShapePointer
#_09F82C: JSR Polyhedral_SetRotationMatrix
#_09F82F: JSR Polyhedral_OperateRotation
#_09F832: JSR Polyhedral_DrawPolyhedron

#_09F835: STZ.b $001F00

#_09F837: LDA.b #$FF
#_09F839: STA.b $001F0C

#_09F83B: BRA .wait

;===================================================================================================

Polyhedral_SetShapePointer:
#_09F83D: REP #$30

#_09F83F: LDA.b $001F02
#_09F841: AND.w #$00FF
#_09F844: ASL A
#_09F845: ADC.w #$0080
#_09F848: STA.b $001F08

#_09F84A: LDA.w $1F03
#_09F84D: AND.w #$00FF
#_09F850: ASL A
#_09F851: STA.b $001FB0

#_09F853: ASL A
#_09F854: ADC.b $001FB0
#_09F856: ADC.w #PolyhedralPropertyTable
#_09F859: TAX

#_09F85A: LDY.w #$001F3F
#_09F85D: LDA.w #$0005
#_09F860: MVN PolyhedralPropertyTable>>16, PolyhedralPropertyTable>>16 ; MVN $09, $09

#_09F863: RTS

;===================================================================================================

Polyhedral_SetRotationMatrix:
#_09F864: SEP #$30

#_09F866: LDY.b $001F04

#_09F868: LDA.w Polyhedral_SineFunction,Y
#_09F86B: STA.b $001F50

#_09F86D: CMP.b #$80
#_09F86F: SBC.b $001F50
#_09F871: EOR.b #$FF
#_09F873: STA.b $001F51

#_09F875: LDA.w Polyhedral_CosineFunction,Y
#_09F878: STA.b $001F52

#_09F87A: CMP.b #$80
#_09F87C: SBC.b $001F52
#_09F87E: EOR.b #$FF
#_09F880: STA.b $001F53

;---------------------------------------------------------------------------------------------------

#_09F882: LDY.b $001F05

#_09F884: LDA.w Polyhedral_SineFunction,Y
#_09F887: STA.b $001F54

#_09F889: CMP.b #$80
#_09F88B: SBC.b $001F54

#_09F88D: EOR.b #$FF
#_09F88F: STA.b $001F55

#_09F891: LDA.w Polyhedral_CosineFunction,Y
#_09F894: STA.b $001F56

#_09F896: CMP.b #$80
#_09F898: SBC.b $001F56

#_09F89A: EOR.b #$FF
#_09F89C: STA.b $001F57

;---------------------------------------------------------------------------------------------------

#_09F89E: REP #$20

#_09F8A0: SEI

#_09F8A1: LDX.b $001F54
#_09F8A3: STX.w PPUMULT16

#_09F8A6: LDX.b $001F55
#_09F8A8: STX.w PPUMULT16

#_09F8AB: LDX.b $001F50
#_09F8AD: STX.w PPUMULT8

#_09F8B0: LDA.w MPYM
#_09F8B3: ASL A
#_09F8B4: ASL A
#_09F8B5: STA.b $001F58

;---------------------------------------------------------------------------------------------------

#_09F8B7: LDX.b $001F56
#_09F8B9: STX.w PPUMULT16

#_09F8BC: LDX.b $001F57
#_09F8BE: STX.w PPUMULT16

#_09F8C1: LDX.b $001F52
#_09F8C3: STX.w PPUMULT8

#_09F8C6: LDA.w MPYM
#_09F8C9: ASL A
#_09F8CA: ASL A
#_09F8CB: STA.b $001F5E

;---------------------------------------------------------------------------------------------------

#_09F8CD: LDX.b $001F56
#_09F8CF: STX.w PPUMULT16

#_09F8D2: LDX.b $001F57
#_09F8D4: STX.w PPUMULT16

#_09F8D7: LDX.b $001F50
#_09F8D9: STX.w PPUMULT8

#_09F8DC: LDA.w MPYM
#_09F8DF: ASL A
#_09F8E0: ASL A
#_09F8E1: STA.b $001F5A

;---------------------------------------------------------------------------------------------------

#_09F8E3: LDX.b $001F54
#_09F8E5: STX.w PPUMULT16

#_09F8E8: LDX.b $001F55
#_09F8EA: STX.w PPUMULT16

#_09F8ED: LDX.b $001F52
#_09F8EF: STX.w PPUMULT8

#_09F8F2: LDA.w MPYM
#_09F8F5: ASL A
#_09F8F6: ASL A
#_09F8F7: STA.b $001F5C

;---------------------------------------------------------------------------------------------------

#_09F8F9: CLI

#_09F8FA: RTS

;===================================================================================================

Polyhedral_OperateRotation:
#_09F8FB: SEP #$30

#_09F8FD: LDA.b $001F3F
#_09F8FF: TAX

#_09F900: ASL A
#_09F901: ADC.b $001F3F
#_09F903: TAY

.next
#_09F904: DEX
#_09F905: DEY

#_09F906: LDA.b ($001F41),Y
#_09F908: STA.b $001F47

#_09F90A: DEY

#_09F90B: LDA.b ($001F41),Y
#_09F90D: STA.b $001F46

#_09F90F: DEY
#_09F910: LDA.b ($001F41),Y
#_09F912: STA.b $001F45

#_09F914: PHY

#_09F915: REP #$20

#_09F917: JSR Polyhedral_RotatePoint
#_09F91A: JSR Polyhedral_ProjectPoint

#_09F91D: SEP #$20
#_09F91F: CLC

#_09F920: LDA.b $001F06
#_09F922: ADC.b $001F48
#_09F924: STA.b $001F60,X

#_09F926: SEC

#_09F927: LDA.b $001F07
#_09F929: SBC.b $001F4A
#_09F92B: STA.b $001F88,X

#_09F92D: PLY
#_09F92E: BNE .next

#_09F930: RTS

;===================================================================================================

Polyhedral_RotatePoint:
#_09F931: LDY.b $001F56

#_09F933: SEI

#_09F934: STY.w PPUMULT16

#_09F937: LDY.b $001F57
#_09F939: STY.w PPUMULT16

#_09F93C: LDY.b $001F45
#_09F93E: STY.w PPUMULT8

#_09F941: LDA.w MPYL

#_09F944: LDY.b $001F54
#_09F946: STY.w PPUMULT16

#_09F949: LDY.b $001F55
#_09F94B: STY.w PPUMULT16

#_09F94E: LDY.b $001F47
#_09F950: STY.w PPUMULT8

#_09F953: SEC
#_09F954: SBC.w MPYL

#_09F957: CLI

#_09F958: STA.b $001F48

;---------------------------------------------------------------------------------------------------

#_09F95A: LDY.b $001F58

#_09F95C: SEI

#_09F95D: STY.w PPUMULT16

#_09F960: LDY.b $001F59
#_09F962: STY.w PPUMULT16

#_09F965: LDY.b $001F45
#_09F967: STY.w PPUMULT8

#_09F96A: LDA.w MPYL

#_09F96D: LDY.b $001F52
#_09F96F: STY.w PPUMULT16

#_09F972: LDY.b $001F53
#_09F974: STY.w PPUMULT16

#_09F977: LDY.b $001F46
#_09F979: STY.w PPUMULT8

#_09F97C: CLC
#_09F97D: ADC.w MPYL

#_09F980: LDY.b $001F5A
#_09F982: STY.w PPUMULT16

#_09F985: LDY.b $001F5B
#_09F987: STY.w PPUMULT16

#_09F98A: LDY.b $001F47
#_09F98C: STY.w PPUMULT8

#_09F98F: CLC
#_09F990: ADC.w MPYL

#_09F993: CLI

#_09F994: STA.b $001F4A

;---------------------------------------------------------------------------------------------------

#_09F996: LDY.b $001F5C

#_09F998: SEI

#_09F999: STY.w PPUMULT16

#_09F99C: LDY.b $001F5D
#_09F99E: STY.w PPUMULT16

#_09F9A1: LDY.b $001F45
#_09F9A3: STY.w PPUMULT8

#_09F9A6: LDA.w MPYM

#_09F9A9: LDY.b $001F50
#_09F9AB: STY.w PPUMULT16

#_09F9AE: LDY.b $001F51
#_09F9B0: STY.w PPUMULT16

#_09F9B3: LDY.b $001F46
#_09F9B5: STY.w PPUMULT8

#_09F9B8: SEC
#_09F9B9: SBC.w MPYM

#_09F9BC: LDY.b $001F5E
#_09F9BE: STY.w PPUMULT16

#_09F9C1: LDY.b $001F5F
#_09F9C3: STY.w PPUMULT16

#_09F9C6: LDY.b $001F47
#_09F9C8: STY.w PPUMULT8

#_09F9CB: CLC
#_09F9CC: ADC.w MPYM

#_09F9CF: REP #$05

#_09F9D1: ADC.b $001F08
#_09F9D3: STA.b $001F4C

#_09F9D5: RTS

;===================================================================================================

Polyhedral_ProjectPoint:
#_09F9D6: LDA.b $001F48
#_09F9D8: BPL .positive_a

#_09F9DA: EOR.w #$FFFF
#_09F9DD: INC A

.positive_a
#_09F9DE: STA.b $001FB2

#_09F9E0: LDA.b $001F4C
#_09F9E2: STA.b $001FB0

#_09F9E4: XBA
#_09F9E5: AND.w #$00FF
#_09F9E8: BEQ .zero_a

.shift_a
#_09F9EA: LSR.b $001FB2
#_09F9EC: LSR.b $001FB0
#_09F9EE: LSR A
#_09F9EF: BNE .shift_a

.zero_a
#_09F9F1: SEI

#_09F9F2: LDA.b $001FB2
#_09F9F4: STA.w WRDIVL

#_09F9F7: LDY.b $001FB0
#_09F9F9: STY.w WRDIVB

#_09F9FC: NOP
#_09F9FD: NOP

#_09F9FE: LDA.w #$0000
#_09FA01: LDY.b $001F49
#_09FA03: SEC
#_09FA04: BMI .negative_a

#_09FA06: NOP

#_09FA07: LDA.w RDDIV

#_09FA0A: BRA .continue

.negative_a
#_09FA0C: SBC.w RDDIV

;---------------------------------------------------------------------------------------------------

.continue
#_09FA0F: CLI

#_09FA10: STA.b $001F48

#_09FA12: LDA.b $001F4A
#_09FA14: BPL .positive_b

#_09FA16: EOR.w #$FFFF
#_09FA19: INC A

.positive_b
#_09FA1A: STA.b $001FB2

#_09FA1C: LDA.b $001F4C
#_09FA1E: STA.b $001FB0

#_09FA20: XBA
#_09FA21: AND.w #$00FF
#_09FA24: BEQ .zero_b

.shift_b
#_09FA26: LSR.b $001FB2
#_09FA28: LSR.b $001FB0
#_09FA2A: LSR A
#_09FA2B: BNE .shift_b

.zero_b
#_09FA2D: SEI

#_09FA2E: LDA.b $001FB2
#_09FA30: STA.w WRDIVL

#_09FA33: LDY.b $001FB0
#_09FA35: STY.w WRDIVB

#_09FA38: NOP
#_09FA39: NOP

#_09FA3A: LDA.w #$0000
#_09FA3D: LDY.b $001F4B
#_09FA3F: SEC
#_09FA40: BMI .negative_b

#_09FA42: NOP

#_09FA43: LDA.w RDDIV

#_09FA46: BRA .exit

.negative_b
#_09FA48: SBC.w RDDIV

;---------------------------------------------------------------------------------------------------

.exit
#_09FA4B: CLI

#_09FA4C: STA.b $001F4A

#_09FA4E: RTS

;===================================================================================================

Polyhedral_DrawPolyhedron:
#_09FA4F: SEP #$30

#_09FA51: LDY.b #$00

.next
#_09FA53: LDA.b ($001F43),Y
#_09FA55: STA.b $001F4E

#_09FA57: AND.b #$7F
#_09FA59: STA.b $001FB0

#_09FA5B: ASL A
#_09FA5C: STA.b $001FC0

#_09FA5E: INY

#_09FA5F: LDX.b #$01

;---------------------------------------------------------------------------------------------------

.next_point
#_09FA61: PHY

#_09FA62: LDA.b ($001F43),Y
#_09FA64: TAY

#_09FA65: LDA.w $1F60,Y
#_09FA68: STA.b $001FC0,X

#_09FA6A: INX

#_09FA6B: LDA.w $1F88,Y
#_09FA6E: STA.b $001FC0,X

#_09FA70: INX

#_09FA71: PLY
#_09FA72: INY

#_09FA73: DEC.b $001FB0
#_09FA75: BNE .next_point

;---------------------------------------------------------------------------------------------------

#_09FA77: LDA.b ($001F43),Y
#_09FA79: INY
#_09FA7A: STA.b $001F4F

#_09FA7C: PHY

#_09FA7D: LDA.b $001FC0
#_09FA7F: CMP.b #$06
#_09FA81: BCC .to_next

#_09FA83: JSR Polyhedral_CalculateCrossProduct
#_09FA86: BMI .draw_back

#_09FA88: BEQ .to_next

#_09FA8A: JSR Polyhedral_SetForegroundColor
#_09FA8D: JSL Polyhedral_DrawFace

.to_next
#_09FA91: PLY

#_09FA92: DEC.b $001F40
#_09FA94: BNE .next

#_09FA96: RTS

;---------------------------------------------------------------------------------------------------

.draw_back
#_09FA97: LDA.b $001F4E
#_09FA99: BPL .to_next

#_09FA9B: REP #$20

#_09FA9D: LDA.b $001FC0
#_09FA9F: AND.w #$00FF
#_09FAA2: TAY

#_09FAA3: DEY

#_09FAA4: LDX.b #$01

#_09FAA6: LSR A
#_09FAA7: LSR A
#_09FAA8: STA.b $001FB0

;---------------------------------------------------------------------------------------------------

.next_back
#_09FAAA: LDA.b $001FC0,X
#_09FAAC: PHA

#_09FAAD: LDA.w $1FC0,Y
#_09FAB0: STA.b $001FC0,X

#_09FAB2: PLA
#_09FAB3: STA.w $1FC0,Y

#_09FAB6: INX
#_09FAB7: INX

#_09FAB8: DEY
#_09FAB9: DEY

#_09FABA: DEC.b $001FB0
#_09FABC: BNE .next_back

;---------------------------------------------------------------------------------------------------

#_09FABE: SEP #$20

#_09FAC0: JSR Polyhedral_SetBackgroundColor
#_09FAC3: JSL Polyhedral_DrawFace

#_09FAC7: JMP.w .to_next

;===================================================================================================

Polyhedral_SetForegroundColor:
#_09FACA: LDA.b $001F01
#_09FACC: BNE Polyhedral_SetFGShadeColor

#_09FACE: LDA.b $001F4F
#_09FAD0: AND.b #$07
#_09FAD2: JSL Polyhedral_SetColorMask

#_09FAD6: RTS

;===================================================================================================

Polyhedral_SetBackgroundColor:
#_09FAD7: LDA.b $001F01
#_09FAD9: BNE Polyhedral_SetBGShadeColor

#_09FADB: LDA.b $001F4F
#_09FADD: LSR A
#_09FADE: LSR A
#_09FADF: LSR A
#_09FAE0: LSR A
#_09FAE1: AND.b #$07

#_09FAE3: JSL Polyhedral_SetColorMask

#_09FAE7: RTS

;===================================================================================================

Polyhedral_SetBGShadeColor:
#_09FAE8: REP #$20

#_09FAEA: LDA.b $001FB0
#_09FAEC: EOR.w #$FFFF
#_09FAEF: INC A

#_09FAF0: BRA Polyhedral_SetShadeColor

;===================================================================================================

Polyhedral_SetFGShadeColor:
#_09FAF2: REP #$20

#_09FAF4: LDA.b $001FB0

;===================================================================================================

Polyhedral_SetShadeColor:
#_09FAF6: PHA

#_09FAF7: LDA.w $1F03
#_09FAFA: AND.w #$00FF
#_09FAFD: BEQ .zero

#_09FAFF: LDA.w $1F02
#_09FB02: AND.w #$00FF

#_09FB05: LSR A
#_09FB06: LSR A
#_09FB07: LSR A
#_09FB08: LSR A
#_09FB09: LSR A

.zero
#_09FB0A: TAX
#_09FB0B: PLA

.shift
#_09FB0C: ASL A

#_09FB0D: DEX
#_09FB0E: BPL .shift

;---------------------------------------------------------------------------------------------------

#_09FB10: SEP #$20

#_09FB12: XBA
#_09FB13: BNE .non_zero

#_09FB15: LDA.b #$01
#_09FB17: BRA .set_color

.non_zero
#_09FB19: CMP.b #$08
#_09FB1B: BCC .set_color

#_09FB1D: LDA.b #$07

.set_color
#_09FB1F: JSL Polyhedral_SetColorMask

#_09FB23: RTS

;===================================================================================================

Polyhedral_CalculateCrossProduct:
#_09FB24: SEP #$05

#_09FB26: LDA.b $001FC3
#_09FB28: SBC.b $001FC1
#_09FB2A: STA.w PPUMULT16

#_09FB2D: LDA.b #$00
#_09FB2F: SBC.b #$00
#_09FB31: STA.w PPUMULT16

#_09FB34: SEC

#_09FB35: LDA.b $001FC6
#_09FB37: SBC.b $001FC4
#_09FB39: STA.w PPUMULT8

#_09FB3C: LDA.w MPYL
#_09FB3F: STA.b $001FB0

#_09FB41: LDA.w MPYM

#_09FB44: CLI
#_09FB45: STA.b $001FB1

;---------------------------------------------------------------------------------------------------

#_09FB47: SEP #$05

#_09FB49: LDA.b $001FC5
#_09FB4B: SBC.b $001FC3
#_09FB4D: STA.w PPUMULT16

#_09FB50: LDA.b #$00
#_09FB52: SBC.b #$00
#_09FB54: STA.w PPUMULT16

#_09FB57: SEC

#_09FB58: LDA.b $001FC4
#_09FB5A: SBC.b $001FC2
#_09FB5C: STA.w PPUMULT8

#_09FB5F: REP #$20

#_09FB61: SEC

#_09FB62: LDA.b $001FB0
#_09FB64: SBC.w MPYL
#_09FB67: STA.b $001FB0

;---------------------------------------------------------------------------------------------------

#_09FB69: SEP #$20

#_09FB6B: CLI

#_09FB6C: RTS

;===================================================================================================

Polyhedral_SineFunction:
#_09FB6D: db $00, $02, $03, $05, $06, $08, $09, $0B
#_09FB75: db $0C, $0E, $10, $11, $13, $14, $16, $17
#_09FB7D: db $18, $1A, $1B, $1D, $1E, $20, $21, $22
#_09FB85: db $24, $25, $26, $27, $29, $2A, $2B, $2C
#_09FB8D: db $2D, $2E, $2F, $30, $31, $32, $33, $34
#_09FB95: db $35, $36, $37, $38, $38, $39, $3A, $3B
#_09FB9D: db $3B, $3C, $3C, $3D, $3D, $3E, $3E, $3E
#_09FBA5: db $3F, $3F, $3F, $40, $40, $40, $40, $40

;===================================================================================================

Polyhedral_CosineFunction:
#_09FBAD: db $40, $40, $40, $40, $40, $40, $3F, $3F
#_09FBB5: db $3F, $3E, $3E, $3E, $3D, $3D, $3C, $3C
#_09FBBD: db $3B, $3B, $3A, $39, $38, $38, $37, $36
#_09FBC5: db $35, $34, $33, $32, $31, $30, $2F, $2E
#_09FBCD: db $2D, $2C, $2B, $2A, $29, $27, $26, $25
#_09FBD5: db $24, $22, $21, $20, $1E, $1D, $1B, $1A
#_09FBDD: db $18, $17, $16, $14, $13, $11, $10, $0E
#_09FBE5: db $0C, $0B, $09, $08, $06, $05, $03, $02
#_09FBED: db $00, $FE, $FD, $FB, $FA, $F8, $F7, $F5
#_09FBF5: db $F4, $F2, $F0, $EF, $ED, $EC, $EA, $E9
#_09FBFD: db $E8, $E6, $E5, $E3, $E2, $E0, $DF, $DE
#_09FC05: db $DC, $DB, $DA, $D9, $D7, $D6, $D5, $D4
#_09FC0D: db $D3, $D2, $D1, $D0, $CF, $CE, $CD, $CC
#_09FC15: db $CB, $CA, $C9, $C8, $C8, $C7, $C6, $C5
#_09FC1D: db $C5, $C4, $C4, $C3, $C3, $C2, $C2, $C2
#_09FC25: db $C1, $C1, $C1, $C0, $C0, $C0, $C0, $C0
#_09FC2D: db $C0, $C0, $C0, $C0, $C0, $C0, $C1, $C1
#_09FC35: db $C1, $C2, $C2, $C2, $C3, $C3, $C4, $C4
#_09FC3D: db $C5, $C5, $C6, $C7, $C8, $C8, $C9, $CA
#_09FC45: db $CB, $CC, $CD, $CE, $CF, $D0, $D1, $D2
#_09FC4D: db $D3, $D4, $D5, $D6, $D7, $D9, $DA, $DB
#_09FC55: db $DC, $DE, $DF, $E0, $E2, $E3, $E5, $E6
#_09FC5D: db $E8, $E9, $EA, $EC, $ED, $EF, $F0, $F2
#_09FC65: db $F4, $F5, $F7, $F8, $FA, $FB, $FD, $FE
#_09FC6D: db $00, $02, $03, $05, $06, $08, $09, $0B
#_09FC75: db $0C, $0E, $10, $11, $13, $14, $16, $17
#_09FC7D: db $18, $1A, $1B, $1D, $1E, $20, $21, $22
#_09FC85: db $24, $25, $26, $27, $29, $2A, $2B, $2C
#_09FC8D: db $2D, $2E, $2F, $30, $31, $32, $33, $34
#_09FC95: db $35, $36, $37, $38, $38, $39, $3A, $3B
#_09FC9D: db $3B, $3C, $3C, $3D, $3D, $3E, $3E, $3E
#_09FCA5: db $3F, $3F, $3F, $40, $40, $40, $40, $40

;===================================================================================================
; FREE ROM: 0x01
;===================================================================================================
NULL_09FCAD:
#_09FCAD: db $FF

;===================================================================================================

Polyhedral_SetColorMask:
#_09FCAE: PHP

#_09FCAF: SEP #$30

#_09FCB1: ASL A
#_09FCB2: ASL A
#_09FCB3: TAX

#_09FCB4: REP #$20

#_09FCB6: LDA.l .mask+0,X
#_09FCBA: STA.b $001FB5

#_09FCBC: LDA.l .mask+2,X
#_09FCC0: STA.b $001FB7

#_09FCC2: PLP

#_09FCC3: RTL

;---------------------------------------------------------------------------------------------------

.mask
#_09FCC4: dw $0000, $0000
#_09FCC8: dw $00FF, $0000
#_09FCCC: dw $FF00, $0000
#_09FCD0: dw $FFFF, $0000
#_09FCD4: dw $0000, $00FF
#_09FCD8: dw $00FF, $00FF
#_09FCDC: dw $FF00, $00FF
#_09FCE0: dw $FFFF, $00FF
#_09FCE4: dw $0000, $FF00
#_09FCE8: dw $00FF, $FF00
#_09FCEC: dw $FF00, $FF00
#_09FCF0: dw $FFFF, $FF00
#_09FCF4: dw $0000, $FFFF
#_09FCF8: dw $00FF, $FFFF
#_09FCFC: dw $FF00, $FFFF
#_09FD00: dw $FFFF, $FFFF

;===================================================================================================

Polyhedral_EmptyBitMapBuffer:
#_09FD04: PHP
#_09FD05: PHB

#_09FD06: REP #$30

#_09FD08: LDA.w #$0000
#_09FD0B: STA.l $7EE800

#_09FD0F: LDX.w #$7EE800
#_09FD12: LDY.w #$7EE802

#_09FD15: LDA.w #$07FD
#_09FD18: MVN $7E, $7E

#_09FD1B: PLB
#_09FD1C: PLP

#_09FD1D: RTL

;===================================================================================================

Polyhedral_DrawFace:
#_09FD1E: PHP
#_09FD1F: PHB

#_09FD20: SEP #$30

#_09FD22: LDA.b #$7E
#_09FD24: PHA
#_09FD25: PLB

#_09FD26: LDY.b $001FC0
#_09FD28: TYX

#_09FD29: LDA.b $001FC0,X

;---------------------------------------------------------------------------------------------------

.loop
#_09FD2B: DEX
#_09FD2C: DEX
#_09FD2D: BEQ .add_fill

#_09FD2F: CMP.b $001FC0,X
#_09FD31: BCC .loop
#_09FD33: BEQ .loop

#_09FD35: TXY
#_09FD36: LDA.b $001FC0,X

#_09FD38: BRA .loop

;---------------------------------------------------------------------------------------------------

.add_fill
#_09FD3A: AND.b #$07
#_09FD3C: ASL A
#_09FD3D: STA.b $001FB9

#_09FD3F: LDA.w $7E1FC0,Y
#_09FD42: AND.b #$38
#_09FD44: BIT.b #$20
#_09FD46: BEQ .no_swap

#_09FD48: EOR.b #$24

.no_swap
#_09FD4A: LSR A
#_09FD4B: LSR A
#_09FD4C: ADC.b #$E8
#_09FD4E: STA.b $001FBA

#_09FD50: STY.b $001FE9
#_09FD52: STY.b $001FF2

#_09FD54: LDA.b $001FC0
#_09FD56: LSR A
#_09FD57: STA.b $001FE0

#_09FD59: LDA.w $7E1FC0,Y
#_09FD5C: STA.b $001FE2
#_09FD5E: STA.b $001FEB

#_09FD60: LDA.w $7E1FBF,Y
#_09FD63: STA.b $001FE1
#_09FD65: STA.b $001FEA

#_09FD67: JSR Polyhedral_SetLeft
#_09FD6A: BCS EXIT_09FD71

#_09FD6C: JSR Polyhedral_SetRight
#_09FD6F: BCC Polyhedral_PaintBucket

;---------------------------------------------------------------------------------------------------

#EXIT_09FD71:
#_09FD71: PLB
#_09FD72: PLP

#_09FD73: RTL

;===================================================================================================

Polyhedral_PaintBucket:

.next
#_09FD74: JSR Polyhedral_FillLine

#_09FD77: LDA.b $001FB9
#_09FD79: INC A
#_09FD7A: INC A
#_09FD7B: CMP.b #$10
#_09FD7D: BEQ .big_a

#_09FD7F: STA.b $001FB9
#_09FD81: BRA .continue

.big_a
#_09FD83: LDA.b $001FBA
#_09FD85: INC A
#_09FD86: INC A
#_09FD87: BIT.b #$08
#_09FD89: BNE .dont_flip

#_09FD8B: EOR.b #$19

.dont_flip
#_09FD8D: STA.b $001FBA
#_09FD8F: STZ.b $001FB9

;---------------------------------------------------------------------------------------------------

.continue
#_09FD91: LDX.b $001FE2
#_09FD93: CPX.b $001FE4
#_09FD95: BNE .skip_left

#_09FD97: LDX.b $001FE3
#_09FD99: STX.b $001FE1

#_09FD9B: JSR Polyhedral_SetLeft
#_09FD9E: BCS EXIT_09FD71

#_09FDA0: LDX.b $001FE2

;---------------------------------------------------------------------------------------------------

.skip_left
#_09FDA2: INX
#_09FDA3: STX.b $001FE2

#_09FDA5: LDX.b $001FEB
#_09FDA7: CPX.b $001FED
#_09FDA9: BNE .skip_right

#_09FDAB: LDX.b $001FEC
#_09FDAD: STX.b $001FEA

#_09FDAF: JSR Polyhedral_SetRight
#_09FDB2: BCS EXIT_09FD71

#_09FDB4: LDX.b $001FEB

;---------------------------------------------------------------------------------------------------

.skip_right
#_09FDB6: INX
#_09FDB7: STX.b $001FEB

#_09FDB9: REP #$21

#_09FDBB: LDA.b $001FE5
#_09FDBD: ADC.b $001FE7
#_09FDBF: STA.b $001FE5

#_09FDC1: CLC

#_09FDC2: LDA.b $001FEE
#_09FDC4: ADC.b $001FF0
#_09FDC6: STA.b $001FEE

#_09FDC8: SEP #$20

#_09FDCA: BRA .next

;===================================================================================================

UNREACHABLE_09FDCC:
#_09FDCC: PLB
#_09FDCD: PLP

#_09FDCE: RTL

;===================================================================================================

Polyhedral_FillLine:
#_09FDCF: LDA.b $001FE6
#_09FDD1: AND.b #$07
#_09FDD3: ASL A
#_09FDD4: TAY

#_09FDD5: LDA.b $001FEF
#_09FDD7: AND.b #$07
#_09FDD9: ASL A
#_09FDDA: TAX

#_09FDDB: LDA.b $001FE6
#_09FDDD: AND.b #$38
#_09FDDF: STA.b $001FBC

#_09FDE1: LDA.b $001FEF
#_09FDE3: AND.b #$38
#_09FDE5: SEC
#_09FDE6: SBC.b $001FBC
#_09FDE8: BNE Polyhedral_FillBigLine

;---------------------------------------------------------------------------------------------------

#_09FDEA: REP #$30

#_09FDEC: LDA.l Polyhedral_LineFillMask_right,X
#_09FDF0: TYX

#_09FDF1: AND.l Polyhedral_LineFillMask_left,X
#_09FDF5: STA.b $001FB2

#_09FDF7: LDA.b $001FEF
#_09FDF9: AND.w #$0038
#_09FDFC: ASL A
#_09FDFD: ASL A

#_09FDFE: ORA.b $001FB9
#_09FE00: TAY

#_09FE01: LDA.b $001FB5
#_09FE03: EOR.w $7E0000,Y
#_09FE06: AND.b $001FB2
#_09FE08: EOR.w $7E0000,Y
#_09FE0B: STA.w $7E0000,Y

#_09FE0E: LDA.b $001FB7
#_09FE10: EOR.w $7E0010,Y
#_09FE13: AND.b $001FB2
#_09FE15: EOR.w $7E0010,Y
#_09FE18: STA.w $7E0010,Y

;---------------------------------------------------------------------------------------------------

EXIT_09FE1B:
#_09FE1B: SEP #$30

#_09FE1D: RTS

;===================================================================================================

Polyhedral_FillBigLine:
#_09FE1E: BCC EXIT_09FE1B

#_09FE20: LSR A
#_09FE21: LSR A
#_09FE22: LSR A
#_09FE23: STA.b $001FFA

#_09FE25: STZ.b $001FFB

;---------------------------------------------------------------------------------------------------

#_09FE27: REP #$30

#_09FE29: LDA.l Polyhedral_LineFillMask_right,X
#_09FE2D: STA.b $001FB2

#_09FE2F: TYX

#_09FE30: LDA.b $001FEF
#_09FE32: AND.w #$0038
#_09FE35: ASL A
#_09FE36: ASL A
#_09FE37: ORA.b $001FB9
#_09FE39: TAY

#_09FE3A: LDA.b $001FB5
#_09FE3C: EOR.w $7E0000,Y
#_09FE3F: AND.b $001FB2
#_09FE41: EOR.w $7E0000,Y
#_09FE44: STA.w $7E0000,Y

#_09FE47: LDA.b $001FB7
#_09FE49: EOR.w $7E0010,Y
#_09FE4C: AND.b $001FB2
#_09FE4E: EOR.w $7E0010,Y
#_09FE51: STA.w $7E0010,Y

;---------------------------------------------------------------------------------------------------

#_09FE54: SEC

#_09FE55: TYA
#_09FE56: SBC.w #$0020
#_09FE59: TAY

#_09FE5A: DEC.b $001FFA
#_09FE5C: BEQ .no_loop

;---------------------------------------------------------------------------------------------------

.loop
#_09FE5E: LDA.b $001FB5
#_09FE60: STA.w $7E0000,Y

#_09FE63: LDA.b $001FB7
#_09FE65: STA.w $7E0010,Y

#_09FE68: TYA
#_09FE69: SBC.w #$0020
#_09FE6C: TAY

#_09FE6D: DEC.b $001FFA
#_09FE6F: BNE .loop

;---------------------------------------------------------------------------------------------------

.no_loop
#_09FE71: LDA.l Polyhedral_LineFillMask_left,X
#_09FE75: STA.b $001FB2

#_09FE77: LDA.b $001FB5
#_09FE79: EOR.w $7E0000,Y
#_09FE7C: AND.b $001FB2
#_09FE7E: EOR.w $7E0000,Y
#_09FE81: STA.w $7E0000,Y

#_09FE84: LDA.b $001FB7
#_09FE86: EOR.w $7E0010,Y
#_09FE89: AND.b $001FB2
#_09FE8B: EOR.w $7E0010,Y
#_09FE8E: STA.w $7E0010,Y

#_09FE91: SEP #$30

#_09FE93: RTS

;===================================================================================================

Polyhedral_LineFillMask:

.left
#_09FE94: dw $FFFF
#_09FE96: dw $7F7F
#_09FE98: dw $3F3F
#_09FE9A: dw $1F1F
#_09FE9C: dw $0F0F
#_09FE9E: dw $0707
#_09FEA0: dw $0303
#_09FEA2: dw $0101

.right
#_09FEA4: dw $8080
#_09FEA6: dw $C0C0
#_09FEA8: dw $E0E0
#_09FEAA: dw $F0F0
#_09FEAC: dw $F8F8
#_09FEAE: dw $FCFC
#_09FEB0: dw $FEFE
#_09FEB2: dw $FFFF

;===================================================================================================

Polyhedral_SetLeft:

.restart
#_09FEB4: DEC.b $001FE0
#_09FEB6: BPL .continue

.fail
#_09FEB8: SEC

#_09FEB9: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_09FEBA: LDX.b $E9
#_09FEBC: DEX
#_09FEBD: DEX
#_09FEBE: BNE .dont_reload

#_09FEC0: LDX.b $C0

.dont_reload
#_09FEC2: LDA.b $C0,X
#_09FEC4: CMP.b $E2
#_09FEC6: BCC .fail
#_09FEC8: BNE .dont_restart

#_09FECA: LDA.b $BF,X
#_09FECC: STA.b $E1

#_09FECE: STX.b $E9

#_09FED0: BRA .restart

;---------------------------------------------------------------------------------------------------

.dont_restart
#_09FED2: STA.b $E4

#_09FED4: LDA.b $BF,X
#_09FED6: STA.b $E3

#_09FED8: STX.b $E9

#_09FEDA: LDX.b #$00
#_09FEDC: SEC
#_09FEDD: SBC.b $E1
#_09FEDF: BCS .positive

#_09FEE1: DEX

#_09FEE2: EOR.b #$FF
#_09FEE4: INC A

.positive
#_09FEE5: SEI

#_09FEE6: STA.l WRDIVH

#_09FEEA: LDA.b #$00
#_09FEEC: STA.l WRDIVL

#_09FEF0: SEC

#_09FEF1: LDA.b $E4
#_09FEF3: SBC.b $E2
#_09FEF5: STA.l WRDIVB

;---------------------------------------------------------------------------------------------------

#_09FEF9: REP #$20

#_09FEFB: LDA.b $E0
#_09FEFD: AND.w #$FF00
#_09FF00: ORA.w #$0080
#_09FF03: STA.b $E5

#_09FF05: LDA.w #$0000

#_09FF08: CPX.b #$00
#_09FF0A: BNE .nonzero

#_09FF0C: LDA.l RDDIV
#_09FF10: BRA .finished

.nonzero
#_09FF12: SEC
#_09FF13: SBC.l RDDIV

;---------------------------------------------------------------------------------------------------

.finished
#_09FF17: CLI

#_09FF18: STA.b $001FE7

#_09FF1A: SEP #$20
#_09FF1C: CLC

#_09FF1D: RTS

;===================================================================================================

Polyhedral_SetRight:
.restart
#_09FF1E: DEC.b $001FE0
#_09FF20: BPL .continue_a

.fail
#_09FF22: SEC

#_09FF23: RTS

;---------------------------------------------------------------------------------------------------

.continue_a
#_09FF24: LDX.b $001FF2
#_09FF26: CPX.b $001FC0
#_09FF28: BNE .dont_reload

#_09FF2A: LDX.b #$02
#_09FF2C: BRA .continue_b

.dont_reload
#_09FF2E: INX
#_09FF2F: INX

;---------------------------------------------------------------------------------------------------

.continue_b
#_09FF30: LDA.b $001FC0,X
#_09FF32: CMP.b $001FEB
#_09FF34: BCC .fail
#_09FF36: BNE .dont_restart

#_09FF38: LDA.b $001FBF,X
#_09FF3A: STA.b $001FEA

#_09FF3C: STX.b $001FF2

#_09FF3E: BRA .restart

;---------------------------------------------------------------------------------------------------

.dont_restart
#_09FF40: STA.b $001FED

#_09FF42: LDA.b $001FBF,X
#_09FF44: STA.b $001FEC

#_09FF46: STX.b $001FF2

#_09FF48: LDX.b #$00
#_09FF4A: SEC
#_09FF4B: SBC.b $001FEA
#_09FF4D: BCS .positive

#_09FF4F: DEX

#_09FF50: EOR.b #$FF
#_09FF52: INC A

.positive
#_09FF53: SEI

#_09FF54: STA.l WRDIVH
#_09FF58: LDA.b #$00
#_09FF5A: STA.l WRDIVL

#_09FF5E: SEC
#_09FF5F: LDA.b $001FED
#_09FF61: SBC.b $001FEB
#_09FF63: STA.l WRDIVB

;---------------------------------------------------------------------------------------------------

#_09FF67: REP #$20

#_09FF69: LDA.b $001FE9
#_09FF6B: AND.w #$FF00
#_09FF6E: ORA.w #$0080
#_09FF71: STA.b $001FEE

#_09FF73: LDA.w #$0000

#_09FF76: CPX.b #$00
#_09FF78: BNE .nonzero

#_09FF7A: LDA.l RDDIV
#_09FF7E: BRA .finished

.nonzero
#_09FF80: SEC
#_09FF81: SBC.l RDDIV

;---------------------------------------------------------------------------------------------------

.finished
#_09FF85: CLI

#_09FF86: STA.b $001FF0

#_09FF88: SEP #$20
#_09FF8A: CLC

#_09FF8B: RTS

;===================================================================================================

PolyhedralPropertyTable:

.crystal
#_09FF8C: db $06 ; vertices
#_09FF8D: db $08 ; faces
#_09FF8E: dw CrystalVertices
#_09FF90: dw CrystalFaces

.triforce
#_09FF92: db $06 ; vertices
#_09FF93: db $05 ; faces
#_09FF94: dw TriforceVertices
#_09FF96: dw TriforceFaces

;===================================================================================================

CrystalVertices:
#_09FF98: db   0,  65,   0
#_09FF9B: db   0, -65,   0
#_09FF9E: db   0,   0, -40
#_09FFA1: db -40,   0,   0
#_09FFA4: db   0,   0,  40
#_09FFA7: db  40,   0,   0

;---------------------------------------------------------------------------------------------------

CrystalFaces:
#_09FFAA: db   3,   0,   5,   2,   4
#_09FFAF: db   3,   0,   2,   3,   1
#_09FFB4: db   3,   0,   3,   4,   2
#_09FFB9: db   3,   0,   4,   5,   3

#_09FFBE: db   3,   1,   2,   5,   4
#_09FFC3: db   3,   1,   3,   2,   1
#_09FFC8: db   3,   1,   4,   3,   2
#_09FFCD: db   3,   1,   5,   4,   3

;===================================================================================================

TriforceVertices:
#_09FFD2: db   0,  40,  10
#_09FFD5: db  40, -40,  10
#_09FFD8: db -40, -40,  10
#_09FFDB: db   0,  40, -10
#_09FFDE: db -40, -40, -10
#_09FFE1: db  40, -40, -10

;---------------------------------------------------------------------------------------------------

TriforceFaces:
#_09FFE4: db   3,   0,   1,   2,   7
#_09FFE9: db   3,   3,   4,   5,   6

#_09FFEE: db   4,   0,   3,   5,   1,   5
#_09FFF4: db   4,   1,   5,   4,   2,   4
#_09FFFA: db   4,   3,   0,   2,   4,   3

;===================================================================================================
