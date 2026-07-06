org $098000

;===================================================================================================

pool Ancilla_AddHitStars

.offset
|098000| dw  21, -11
|098004| dw  21,  11
|098008| dw   3,  -6
|09800C| dw  21,   5
|098010| dw  16, -14
|098014| dw  16,  14

.unknown_offsets
|098018| dw  -3,  19
|09801C| dw   2,  13
|098020| dw  -6,  22

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_AddHitStars:
|098024| PHB
|098025| PHK
|098026| PLB

|098027| JSR AddAncilla
|09802A| BCS .spawn_failed

|09802C| STZ.w $0C5E,X

|09802F| LDA.b #$02
|098031| STA.w $03B1,X

|098034| LDA.b #$01
|098036| STA.w $039F,X

|098039| STZ.w $0C22,X
|09803C| STZ.w $0C2C,X

|09803F| LDA.w $0301
|098042| BEQ .nothing_in_hand

|098044| LDA.b $2F
|098046| LSR A

|098047| CLC
|098048| ADC.b #$02
|09804A| TAY

|09804B| BRA .continue

.nothing_in_hand
|09804D| LDA.w $037A
|098050| BEQ .continue

|098052| LDY.b #$00

|098054| LDA.b $2F
|098056| CMP.b #$04
|098058| BEQ .continue

|09805A| LDY.b #$01

;---------------------------------------------------------------------------------------------------

.continue
|09805C| TYA
|09805D| STA.w $0C54,X

|098060| ASL A
|098061| ASL A
|098062| TAY

|098063| REP #$20

|098065| LDA.w .offset,Y
|098068| CLC
|098069| ADC.b $20
|09806B| STA.b $00

|09806D| LDA.w .offset+2,Y
|098070| CLC
|098071| ADC.b $22
|098073| STA.b $02

|098075| TYA
|098076| LSR A
|098077| TAY

|098078| LDA.b $22
|09807A| CLC
|09807B| ADC.w .unknown_offsets,Y
|09807E| STA.b $04

|098080| SEP #$20

|098082| LDA.b $04
|098084| STA.w $038A,X

|098087| LDA.b $05
|098089| STA.w $038F,X

|09808C| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.spawn_failed
|09808F| PLB

|098090| RTL

;===================================================================================================

AncillaAdd_Blanket:
|098091| PHB
|098092| PHK
|098093| PLB

|098094| LDX.b #$00

|098096| STA.w $0C4A,X

|098099| PHX

|09809A| TAX

|09809B| LDA.l AncillaObjectAllocation,X
|09809F| STA.b $0E

|0980A1| PLX

|0980A2| LDA.b $0E
|0980A4| STA.w $0C90,X

|0980A7| LDA.b $EE
|0980A9| STA.w $0C7C,X

|0980AC| LDA.w $0476
|0980AF| STA.w $03CA,X

|0980B2| STZ.w $0280,X

|0980B5| REP #$20

|0980B7| LDA.w #$2162
|0980BA| STA.b $00

|0980BC| LDA.w #$0938
|0980BF| STA.b $02

|0980C1| SEP #$20

;===================================================================================================

SetAncillaCoordinatesAndExit:
|0980C3| JSR SetAncillaCoordinates

|0980C6| PLB

|0980C7| RTL

;===================================================================================================

AncillaAdd_Snoring:
|0980C8| PHB
|0980C9| PHK
|0980CA| PLB

|0980CB| JSR AddAncilla
|0980CE| BCS EXIT_0980FD

;---------------------------------------------------------------------------------------------------

|0980D0| STZ.w $0C5E,X

|0980D3| LDA.b #$F8
|0980D5| STA.w $0C22,X

|0980D8| LDA.b #$07
|0980DA| STA.w $03B1,X

|0980DD| INC A
|0980DE| STA.w $0C2C,X

|0980E1| LDA.b #$FF
|0980E3| STA.w $0C54,X

|0980E6| REP #$20

|0980E8| LDA.b $20
|0980EA| CLC
|0980EB| ADC.w #$0004
|0980EE| STA.b $00

|0980F0| LDA.b $22
|0980F2| CLC
|0980F3| ADC.w #$0010
|0980F6| STA.b $02

|0980F8| SEP #$20

|0980FA| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_0980FD:
|0980FD| PLB

|0980FE| RTL

;===================================================================================================

pool AncillaAdd_Bomb

.offset_y_close
|0980FF| dw   4 ; up
|098101| dw  28 ; down
|098103| dw  12 ; left
|098105| dw  12 ; right

.offset_x_close
|098107| dw   8 ; up
|098109| dw   8 ; down
|09810B| dw  -6 ; left
|09810D| dw  22 ; right

;---------------------------------------------------------------------------------------------------

.offset_y
|09810F| dw   0 ; up
|098111| dw  24 ; down
|098113| dw  12 ; left
|098115| dw  12 ; right

.offset_x
|098117| dw   8 ; up
|098119| dw   8 ; down
|09811B| dw   0 ; left
|09811D| dw  16 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_Bomb:
|09811F| PHB
|098120| PHK
|098121| PLB

|098122| JSR AddAncilla
|098125| BCS EXIT_0980FD

|098127| LDA.l $7EF343
|09812B| BNE .we_have_bombs

|09812D| STZ.w $0C4A,X

|098130| BRA .exit

;---------------------------------------------------------------------------------------------------

.we_have_bombs
|098132| DEC A
|098133| STA.l $7EF343
|098137| BNE .we_have_more_bombs_too

|098139| PHX

|09813A| JSL RefreshItemIcon

|09813E| PLX

.we_have_more_bombs_too
|09813F| STZ.w $03EA,X

|098142| STZ.w $0C54,X
|098145| STZ.w $0C5E,X

|098148| STZ.w $03C2,X

|09814B| STZ.w $0385,X

|09814E| LDA.l BombTimers
|098152| STA.w $039F,X

|098155| LDA.b #$07
|098157| STA.w $03C0,X

|09815A| STZ.w $029E,X

|09815D| LDA.b #$08
|09815F| STA.w $0C68,X

|098162| LDA.b $2F
|098164| LSR A
|098165| STA.w $0C72,X

|098168| STZ.w $03D5,X
|09816B| STZ.w $03D2,X
|09816E| STZ.w $03E1,X

|098171| JSL Ancilla_CheckInitialTileCollision_Class2
|098175| BCC .use_closer_offsets

;---------------------------------------------------------------------------------------------------

|098177| LDY.b $2F

|098179| REP #$20

|09817B| LDA.b $20
|09817D| CLC
|09817E| ADC.w .offset_y,Y
|098181| STA.b $00

|098183| LDA.b $22
|098185| CLC
|098186| ADC.w .offset_x,Y
|098189| STA.b $02

|09818B| SEP #$20

|09818D| BRA .finish_up

;---------------------------------------------------------------------------------------------------

.use_closer_offsets
|09818F| LDY.b $2F

|098191| REP #$20

|098193| LDA.b $20
|098195| CLC
|098196| ADC.w .offset_y_close,Y
|098199| STA.b $00

|09819B| LDA.b $22
|09819D| CLC
|09819E| ADC.w .offset_x_close,Y
|0981A1| STA.b $02

|0981A3| SEP #$20

;---------------------------------------------------------------------------------------------------

.finish_up
|0981A5| JSL CalculateLinkSFXPan
|0981A9| ORA.b #$0B ; SFX2.0B
|0981AB| STA.w $012E

|0981AE| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|0981B1| PLB

|0981B2| RTL

;===================================================================================================

pool AncillaAdd_Boomerang

.speed
|0981B3| db $20, $18 ; blue
|0981B5| db $30, $28 ; red

.distance
|0981B7| db $20 ; blue
|0981B8| db $60 ; red

.rotation_speed
|0981B9| db $03 ; blue
|0981BA| db $02 ; red

;---------------------------------------------------------------------------------------------------

.direction_component
|0981BB| db $08 ; up
|0981BC| db $04 ; down
|0981BD| db $02 ; left
|0981BE| db $01 ; right

;---------------------------------------------------------------------------------------------------

.valid_throw_dpad
|0981BF| db $08 ; up
|0981C0| db $04 ; down
|0981C1| db $02 ; left
|0981C2| db $01 ; right
|0981C3| db $09 ; up-right
|0981C4| db $05 ; down-right
|0981C5| db $0A ; up-left
|0981C6| db $06 ; down-left

.initial_rotation
|0981C7| db $02 ; up
|0981C8| db $03 ; down
|0981C9| db $03 ; left
|0981CA| db $02 ; right
|0981CB| db $02 ; up-right
|0981CC| db $03 ; down-right
|0981CD| db $03 ; up-left
|0981CE| db $03 ; down-left

;---------------------------------------------------------------------------------------------------

.offset_y_standard
|0981CF| dw -10 ; up
|0981D1| dw  -8 ; down
|0981D3| dw  -9 ; left
|0981D5| dw  -9 ; right
|0981D7| dw -10 ; up-right
|0981D9| dw  -8 ; down-right
|0981DB| dw  -9 ; up-left
|0981DD| dw  -9 ; down-left

.offset_x_standard
|0981DF| dw -10 ; up
|0981E1| dw  11 ; down
|0981E3| dw   8 ; left
|0981E5| dw  -8 ; right
|0981E7| dw -10 ; up-right
|0981E9| dw  11 ; down-right
|0981EB| dw   8 ; up-left
|0981ED| dw  -8 ; down-left

;---------------------------------------------------------------------------------------------------

.offset_y_sword
|0981EF| dw -16 ; up
|0981F1| dw   6 ; down
|0981F3| dw   0 ; left
|0981F5| dw   0 ; right
|0981F7| dw  -8 ; up-right
|0981F9| dw   8 ; down-right
|0981FB| dw  -8 ; up-left
|0981FD| dw   8 ; down-left

.offset_x_sword
|0981FF| dw   0 ; up
|098201| dw   0 ; down
|098203| dw  -8 ; left
|098205| dw   8 ; right
|098207| dw   8 ; up-right
|098209| dw   8 ; down-right
|09820B| dw  -8 ; up-left
|09820D| dw  -8 ; down-left

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_Boomerang:
|09820F| PHB
|098210| PHK
|098211| PLB

|098212| JSR AddAncilla
|098215| BCC .open_slot

|098217| BRL .exit

;---------------------------------------------------------------------------------------------------

.open_slot
|09821A| STZ.w $03B1,X

|09821D| STZ.w $0C5E,X
|098220| STZ.w $0380,X

|098223| STZ.w $029E,X
|098226| STA.w $0385,X

|098229| LDA.b #$01
|09822B| STA.w $035F

|09822E| LDA.l $7EF341
|098232| DEC A
|098233| STA.w $0394,X

|098236| TAY

|098237| LDA.w .distance,Y
|09823A| STA.w $0C54,X

|09823D| LDA.w .rotation_speed,Y
|098240| STA.w $039F,X

;---------------------------------------------------------------------------------------------------

|098243| LDY.b #$00

|098245| LDA.b $F0
|098247| AND.b #$0C
|098249| BEQ .not_diagonal

|09824B| LDA.b $F0
|09824D| AND.b #$03
|09824F| BEQ .not_diagonal

|098251| INY

.not_diagonal
|098252| STY.b $00

|098254| LDA.w $0394,X
|098257| ASL A
|098258| CLC
|098259| ADC.b $00
|09825B| TAY

|09825C| LDA.w .speed,Y
|09825F| STA.b $00
|098261| STA.w $03C5,X

|098264| STY.b $72

;---------------------------------------------------------------------------------------------------

|098266| LDA.b $F0
|098268| AND.b #$0F
|09826A| BNE .not_directional

|09826C| LDA.b $2F
|09826E| LSR A
|09826F| TAY

|098270| LDA.w .direction_component,Y

;---------------------------------------------------------------------------------------------------

.not_directional
|098273| STA.b $01

|098275| STZ.w $039D

|098278| LDY.b $00

|09827A| LDA.b $01
|09827C| AND.b #$0C
|09827E| BEQ .nonvertical

|098280| AND.b #$08
|098282| BEQ .down_throw

;---------------------------------------------------------------------------------------------------

.up_throw
|098284| TYA
|098285| EOR.b #$FF
|098287| INC A
|098288| TAY

;---------------------------------------------------------------------------------------------------

.down_throw
|098289| TYA
|09828A| STA.w $0C22,X

|09828D| LDY.b #$00

|09828F| LDA.w $0C22,X
|098292| BMI .was_up_throw

|098294| INY

.was_up_throw
|098295| TYA
|098296| STA.w $0C72,X

|098299| LDA.w .direction_component,Y
|09829C| STA.w $039D

;---------------------------------------------------------------------------------------------------

.nonvertical
|09829F| STZ.w $03A9,X

|0982A2| LDY.b $00

|0982A4| LDA.b $01
|0982A6| AND.b #$03
|0982A8| BEQ .nonhorizontal

|0982AA| AND.b #$02
|0982AC| BEQ .right_throw

;---------------------------------------------------------------------------------------------------

.left_throw
|0982AE| TYA
|0982AF| EOR.b #$FF
|0982B1| INC A
|0982B2| TAY

|0982B3| BRA .continue_horizontal

;---------------------------------------------------------------------------------------------------

.right_throw
|0982B5| INC.w $03A9,X

.continue_horizontal
|0982B8| TYA
|0982B9| STA.w $0C2C,X

|0982BC| LDY.b #$02

|0982BE| LDA.w $0C2C,X
|0982C1| BMI .was_left_throw

|0982C3| LDY.b #$03

.was_left_throw
|0982C5| TYA
|0982C6| STA.w $0C72,X

|0982C9| LDA.w .direction_component,Y
|0982CC| ORA.w $039D
|0982CF| STA.w $039D

;---------------------------------------------------------------------------------------------------

.nonhorizontal
|0982D2| LDY.b #$07

.next_direction_check
|0982D4| LDA.w .valid_throw_dpad,Y
|0982D7| CMP.b $01
|0982D9| BEQ .valid_dpad_press

|0982DB| DEY
|0982DC| BPL .next_direction_check


|0982DE| INY

;---------------------------------------------------------------------------------------------------

.valid_dpad_press
|0982DF| LDA.w .initial_rotation,Y
|0982E2| STA.w $03A4,X

|0982E5| TYA
|0982E6| ASL A
|0982E7| TAY

|0982E8| STA.w $03CF,X

|0982EB| LDA.b $3C
|0982ED| CMP.b #$09
|0982EF| BCC .spin_not_charged

|0982F1| INC.w $03B1,X

|0982F4| BRA .check_tile_collision

.spin_not_charged
|0982F6| LDA.b $72
|0982F8| BNE .magic_or_diagonal

|0982FA| LDA.b $F0
|0982FC| AND.b #$0F
|0982FE| BNE .check_tile_collision

.magic_or_diagonal
|098300| LDY.b $2F

;---------------------------------------------------------------------------------------------------

.check_tile_collision
|098302| JSL Ancilla_CheckInitialTile_A
|098306| BCS AncillaAdd_BoomerangAsClink

|098308| LDA.w $03B1,X
|09830B| BEQ .wasnt_during_spin

|09830D| REP #$20

|09830F| LDA.b $20
|098311| CLC
|098312| ADC.w #$0008
|098315| CLC
|098316| ADC.w .offset_y_sword,Y
|098319| STA.b $00

|09831B| LDA.b $22
|09831D| CLC
|09831E| ADC.w .offset_x_sword,Y
|098321| STA.b $02

|098323| SEP #$20

|098325| BRL .proceed_to_set_coods

;---------------------------------------------------------------------------------------------------

.wasnt_during_spin
|098328| REP #$20

|09832A| LDA.b $20
|09832C| CLC
|09832D| ADC.w #$0008
|098330| CLC
|098331| ADC.w .offset_y_standard,Y
|098334| STA.b $00

|098336| LDA.b $22
|098338| CLC
|098339| ADC.w .offset_x_standard,Y
|09833C| STA.b $02

|09833E| SEP #$20

;---------------------------------------------------------------------------------------------------

.proceed_to_set_coods
|098340| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|098343| PLB

|098344| RTL

;---------------------------------------------------------------------------------------------------

AncillaAdd_BoomerangAsClink:
|098345| STZ.w $0C4A,X
|098348| STZ.w $035F

|09834B| LDA.w $03E4,X
|09834E| CMP.b #$F0 ; TILETYPE F0
|098350| BEQ .shut_door

|098352| JSL CalculateAncillaSFXPan
|098356| ORA.b #$05 ; SFX2.05
|098358| STA.w $012E

|09835B| BRA .continue

;---------------------------------------------------------------------------------------------------

.shut_door
|09835D| JSL CalculateAncillaSFXPan
|098361| ORA.b #$06 ; SFX2.06
|098363| STA.w $012E

;---------------------------------------------------------------------------------------------------

.continue
|098366| JSL AncillaAdd_BoomerangWallClink

|09836A| PLB

|09836B| RTL

;===================================================================================================

pool AncillaAdd_ItemReceipt

.offset_y
|09836C| db  -5 ; FIGHTER SWORD
|09836D| db  -5 ; MASTER SWORD
|09836E| db  -5 ; TEMPERED SWORD
|09836F| db  -5 ; BUTTER SWORD
|098370| db  -5 ; FIGHTER SHIELD
|098371| db  -4 ; FIRE SHIELD
|098372| db  -4 ; MIRROR SHIELD
|098373| db  -5 ; FIRE ROD
|098374| db  -5 ; ICE ROD
|098375| db  -4 ; HAMMER
|098376| db  -4 ; HOOKSHOT
|098377| db  -4 ; BOW
|098378| db  -2 ; BOOMERANG
|098379| db  -4 ; POWDER
|09837A| db  -4 ; BOTTLE REFILL (BEE)
|09837B| db  -4 ; BOMBOS
|09837C| db  -4 ; ETHER
|09837D| db  -4 ; QUAKE
|09837E| db  -4 ; LAMP
|09837F| db  -4 ; SHOVEL
|098380| db  -4 ; FLUTE
|098381| db  -4 ; SOMARIA
|098382| db  -4 ; BOTTLE
|098383| db  -4 ; HEART PIECE
|098384| db  -4 ; BYRNA
|098385| db  -4 ; CAPE
|098386| db  -4 ; MIRROR
|098387| db  -4 ; GLOVE
|098388| db  -4 ; MITTS
|098389| db  -4 ; BOOK
|09838A| db  -4 ; FLIPPERS
|09838B| db  -4 ; PEARL
|09838C| db  -4 ; CRYSTAL
|09838D| db  -4 ; NET
|09838E| db  -4 ; BLUE MAIL
|09838F| db  -5 ; RED MAIL
|098390| db  -4 ; SMALL KEY
|098391| db  -4 ; COMPASS
|098392| db  -4 ; HEART CONTAINER FROM 4/4
|098393| db  -4 ; BOMB
|098394| db  -4 ; 3 BOMBS
|098395| db  -4 ; MUSHROOM
|098396| db  -2 ; RED BOOMERANG
|098397| db  -4 ; FULL BOTTLE (RED)
|098398| db  -4 ; FULL BOTTLE (GREEN)
|098399| db  -4 ; FULL BOTTLE (BLUE)
|09839A| db  -4 ; POTION REFILL (RED)
|09839B| db  -4 ; POTION REFILL (GREEN)
|09839C| db  -4 ; POTION REFILL (BLUE)
|09839D| db  -4 ; 10 BOMBS
|09839E| db  -4 ; BIG KEY
|09839F| db  -4 ; MAP
|0983A0| db  -2 ; 1 RUPEE
|0983A1| db  -2 ; 5 RUPEES
|0983A2| db  -2 ; 20 RUPEES
|0983A3| db  -4 ; GREEN PENDANT
|0983A4| db  -4 ; BLUE PENDANT
|0983A5| db  -4 ; RED PENDANT
|0983A6| db  -4 ; TOSSED BOW
|0983A7| db  -4 ; SILVERS
|0983A8| db  -4 ; FULL BOTTLE (BEE)
|0983A9| db  -4 ; FULL BOTTLE (FAIRY)
|0983AA| db  -4 ; BOSS HC
|0983AB| db  -4 ; SANC HC
|0983AC| db  -4 ; 100 RUPEES
|0983AD| db  -4 ; 50 RUPEES
|0983AE| db  -2 ; HEART
|0983AF| db  -2 ; ARROW
|0983B0| db  -4 ; 10 ARROWS
|0983B1| db  -2 ; SMALL MAGIC
|0983B2| db  -4 ; 300 RUPEES
|0983B3| db  -4 ; 20 RUPEES GREEN
|0983B4| db  -4 ; FULL BOTTLE (GOOD BEE)
|0983B5| db  -5 ; TOSSED FIGHTER SWORD
|0983B6| db  -4 ; FLUTE (ACTIVATED)
|0983B7| db  -4 ; BOOTS

;---------------------------------------------------------------------------------------------------

.offset_x
|0983B8| db   4 ; FIGHTER SWORD
|0983B9| db   4 ; MASTER SWORD
|0983BA| db   4 ; TEMPERED SWORD
|0983BB| db   4 ; BUTTER SWORD
|0983BC| db   4 ; FIGHTER SHIELD
|0983BD| db   0 ; FIRE SHIELD
|0983BE| db   0 ; MIRROR SHIELD
|0983BF| db   4 ; FIRE ROD
|0983C0| db   4 ; ICE ROD
|0983C1| db   4 ; HAMMER
|0983C2| db   4 ; HOOKSHOT
|0983C3| db   4 ; BOW
|0983C4| db   5 ; BOOMERANG
|0983C5| db   0 ; POWDER
|0983C6| db   0 ; BOTTLE REFILL (BEE)
|0983C7| db   0 ; BOMBOS
|0983C8| db   0 ; ETHER
|0983C9| db   0 ; QUAKE
|0983CA| db   0 ; LAMP
|0983CB| db   4 ; SHOVEL
|0983CC| db   0 ; FLUTE
|0983CD| db   4 ; SOMARIA
|0983CE| db   0 ; BOTTLE
|0983CF| db   0 ; HEART PIECE
|0983D0| db   4 ; BYRNA
|0983D1| db   0 ; CAPE
|0983D2| db   0 ; MIRROR
|0983D3| db   0 ; GLOVE
|0983D4| db   0 ; MITTS
|0983D5| db   0 ; BOOK
|0983D6| db   0 ; FLIPPERS
|0983D7| db   0 ; PEARL
|0983D8| db   0 ; CRYSTAL
|0983D9| db   0 ; NET
|0983DA| db   0 ; BLUE MAIL
|0983DB| db   0 ; RED MAIL
|0983DC| db   4 ; SMALL KEY
|0983DD| db   0 ; COMPASS
|0983DE| db   0 ; HEART CONTAINER FROM 4/4
|0983DF| db   0 ; BOMB
|0983E0| db   0 ; 3 BOMBS
|0983E1| db   0 ; MUSHROOM
|0983E2| db   5 ; RED BOOMERANG
|0983E3| db   0 ; FULL BOTTLE (RED)
|0983E4| db   0 ; FULL BOTTLE (GREEN)
|0983E5| db   0 ; FULL BOTTLE (BLUE)
|0983E6| db   0 ; POTION REFILL (RED)
|0983E7| db   0 ; POTION REFILL (GREEN)
|0983E8| db   0 ; POTION REFILL (BLUE)
|0983E9| db   0 ; 10 BOMBS
|0983EA| db   0 ; BIG KEY
|0983EB| db   0 ; MAP
|0983EC| db   4 ; 1 RUPEE
|0983ED| db   4 ; 5 RUPEES
|0983EE| db   4 ; 20 RUPEES
|0983EF| db   0 ; GREEN PENDANT
|0983F0| db   0 ; BLUE PENDANT
|0983F1| db   0 ; RED PENDANT
|0983F2| db   0 ; TOSSED BOW
|0983F3| db   0 ; SILVERS
|0983F4| db   0 ; FULL BOTTLE (BEE)
|0983F5| db   0 ; FULL BOTTLE (FAIRY)
|0983F6| db   0 ; BOSS HC
|0983F7| db   0 ; SANC HC
|0983F8| db   0 ; 100 RUPEES
|0983F9| db   0 ; 50 RUPEES
|0983FA| db   4 ; HEART
|0983FB| db   4 ; ARROW
|0983FC| db   0 ; 10 ARROWS
|0983FD| db   4 ; SMALL MAGIC
|0983FE| db   0 ; 300 RUPEES
|0983FF| db   0 ; 20 RUPEES GREEN
|098400| db   0 ; FULL BOTTLE (GOOD BEE)
|098401| db   4 ; TOSSED FIGHTER SWORD
|098402| db   0 ; FLUTE (ACTIVATED)
|098403| db   0 ; BOOTS

;---------------------------------------------------------------------------------------------------

.item_gfx_index
|098404| db $06 ; FIGHTER SWORD
|098405| db $18 ; MASTER SWORD
|098406| db $18 ; TEMPERED SWORD
|098407| db $18 ; BUTTER SWORD
|098408| db $2D ; FIGHTER SHIELD
|098409| db $20 ; FIRE SHIELD
|09840A| db $2E ; MIRROR SHIELD
|09840B| db $09 ; FIRE ROD
|09840C| db $09 ; ICE ROD
|09840D| db $0A ; HAMMER
|09840E| db $08 ; HOOKSHOT
|09840F| db $05 ; BOW
|098410| db $10 ; BOOMERANG
|098411| db $0B ; POWDER
|098412| db $2C ; BOTTLE REFILL (BEE)
|098413| db $1B ; BOMBOS
|098414| db $1A ; ETHER
|098415| db $1C ; QUAKE
|098416| db $14 ; LAMP
|098417| db $19 ; SHOVEL
|098418| db $0C ; FLUTE
|098419| db $07 ; SOMARIA
|09841A| db $1D ; BOTTLE
|09841B| db $2F ; HEART PIECE
|09841C| db $07 ; BYRNA
|09841D| db $15 ; CAPE
|09841E| db $12 ; MIRROR
|09841F| db $0D ; GLOVE
|098420| db $0D ; MITTS
|098421| db $0E ; BOOK
|098422| db $11 ; FLIPPERS
|098423| db $17 ; PEARL
|098424| db $28 ; CRYSTAL
|098425| db $27 ; NET
|098426| db $04 ; BLUE MAIL
|098427| db $04 ; RED MAIL
|098428| db $0F ; SMALL KEY
|098429| db $16 ; COMPASS
|09842A| db $03 ; HEART CONTAINER FROM 4/4
|09842B| db $13 ; BOMB
|09842C| db $01 ; 3 BOMBS
|09842D| db $1E ; MUSHROOM
|09842E| db $10 ; RED BOOMERANG
|09842F| db $00 ; FULL BOTTLE (RED)
|098430| db $00 ; FULL BOTTLE (GREEN)
|098431| db $00 ; FULL BOTTLE (BLUE)
|098432| db $00 ; POTION REFILL (RED)
|098433| db $00 ; POTION REFILL (GREEN)
|098434| db $00 ; POTION REFILL (BLUE)
|098435| db $30 ; 10 BOMBS
|098436| db $22 ; BIG KEY
|098437| db $21 ; MAP
|098438| db $24 ; 1 RUPEE
|098439| db $24 ; 5 RUPEES
|09843A| db $24 ; 20 RUPEES
|09843B| db $23 ; GREEN PENDANT
|09843C| db $23 ; BLUE PENDANT
|09843D| db $23 ; RED PENDANT
|09843E| db $29 ; TOSSED BOW
|09843F| db $2A ; SILVERS
|098440| db $2C ; FULL BOTTLE (BEE)
|098441| db $2B ; FULL BOTTLE (FAIRY)
|098442| db $03 ; BOSS HC
|098443| db $03 ; SANC HC
|098444| db $34 ; 100 RUPEES
|098445| db $35 ; 50 RUPEES
|098446| db $31 ; HEART
|098447| db $33 ; ARROW
|098448| db $02 ; 10 ARROWS
|098449| db $32 ; SMALL MAGIC
|09844A| db $36 ; 300 RUPEES
|09844B| db $37 ; 20 RUPEES GREEN
|09844C| db $2C ; FULL BOTTLE (GOOD BEE)
|09844D| db $06 ; TOSSED FIGHTER SWORD
|09844E| db $0C ; FLUTE (ACTIVATED)
|09844F| db $38 ; BOOTS

;---------------------------------------------------------------------------------------------------

.width
|098450| db $00 ; FIGHTER SWORD
|098451| db $00 ; MASTER SWORD
|098452| db $00 ; TEMPERED SWORD
|098453| db $00 ; BUTTER SWORD
|098454| db $00 ; FIGHTER SHIELD
|098455| db $02 ; FIRE SHIELD
|098456| db $02 ; MIRROR SHIELD
|098457| db $00 ; FIRE ROD
|098458| db $00 ; ICE ROD
|098459| db $00 ; HAMMER
|09845A| db $00 ; HOOKSHOT
|09845B| db $00 ; BOW
|09845C| db $00 ; BOOMERANG
|09845D| db $02 ; POWDER
|09845E| db $02 ; BOTTLE REFILL (BEE)
|09845F| db $02 ; BOMBOS
|098460| db $02 ; ETHER
|098461| db $02 ; QUAKE
|098462| db $02 ; LAMP
|098463| db $00 ; SHOVEL
|098464| db $02 ; FLUTE
|098465| db $00 ; SOMARIA
|098466| db $02 ; BOTTLE
|098467| db $02 ; HEART PIECE
|098468| db $00 ; BYRNA
|098469| db $02 ; CAPE
|09846A| db $02 ; MIRROR
|09846B| db $02 ; GLOVE
|09846C| db $02 ; MITTS
|09846D| db $02 ; BOOK
|09846E| db $02 ; FLIPPERS
|09846F| db $02 ; PEARL
|098470| db $02 ; CRYSTAL
|098471| db $02 ; NET
|098472| db $02 ; BLUE MAIL
|098473| db $02 ; RED MAIL
|098474| db $00 ; SMALL KEY
|098475| db $02 ; COMPASS
|098476| db $02 ; HEART CONTAINER FROM 4/4
|098477| db $02 ; BOMB
|098478| db $02 ; 3 BOMBS
|098479| db $02 ; MUSHROOM
|09847A| db $00 ; RED BOOMERANG
|09847B| db $02 ; FULL BOTTLE (RED)
|09847C| db $02 ; FULL BOTTLE (GREEN)
|09847D| db $02 ; FULL BOTTLE (BLUE)
|09847E| db $02 ; POTION REFILL (RED)
|09847F| db $02 ; POTION REFILL (GREEN)
|098480| db $02 ; POTION REFILL (BLUE)
|098481| db $02 ; 10 BOMBS
|098482| db $02 ; BIG KEY
|098483| db $02 ; MAP
|098484| db $00 ; 1 RUPEE
|098485| db $00 ; 5 RUPEES
|098486| db $00 ; 20 RUPEES
|098487| db $02 ; GREEN PENDANT
|098488| db $02 ; BLUE PENDANT
|098489| db $02 ; RED PENDANT
|09848A| db $02 ; TOSSED BOW
|09848B| db $02 ; SILVERS
|09848C| db $02 ; FULL BOTTLE (BEE)
|09848D| db $02 ; FULL BOTTLE (FAIRY)
|09848E| db $02 ; BOSS HC
|09848F| db $02 ; SANC HC
|098490| db $02 ; 100 RUPEES
|098491| db $02 ; 50 RUPEES
|098492| db $00 ; HEART
|098493| db $00 ; ARROW
|098494| db $02 ; 10 ARROWS
|098495| db $00 ; SMALL MAGIC
|098496| db $02 ; 300 RUPEES
|098497| db $02 ; 20 RUPEES GREEN
|098498| db $02 ; FULL BOTTLE (GOOD BEE)
|098499| db $00 ; TOSSED FIGHTER SWORD
|09849A| db $02 ; FLUTE (ACTIVATED)
|09849B| db $02 ; BOOTS

;---------------------------------------------------------------------------------------------------

.prop
|09849C| db $05 ; FIGHTER SWORD
|09849D| db $FF ; MASTER SWORD
|09849E| db $05 ; TEMPERED SWORD
|09849F| db $05 ; BUTTER SWORD
|0984A0| db $05 ; FIGHTER SHIELD
|0984A1| db $05 ; FIRE SHIELD
|0984A2| db $05 ; MIRROR SHIELD
|0984A3| db $01 ; FIRE ROD
|0984A4| db $02 ; ICE ROD
|0984A5| db $01 ; HAMMER
|0984A6| db $01 ; HOOKSHOT
|0984A7| db $01 ; BOW
|0984A8| db $02 ; BOOMERANG
|0984A9| db $02 ; POWDER
|0984AA| db $02 ; BOTTLE REFILL (BEE)
|0984AB| db $04 ; BOMBOS
|0984AC| db $04 ; ETHER
|0984AD| db $04 ; QUAKE
|0984AE| db $01 ; LAMP
|0984AF| db $01 ; SHOVEL
|0984B0| db $02 ; FLUTE
|0984B1| db $01 ; SOMARIA
|0984B2| db $01 ; BOTTLE
|0984B3| db $01 ; HEART PIECE
|0984B4| db $02 ; BYRNA
|0984B5| db $01 ; CAPE
|0984B6| db $02 ; MIRROR
|0984B7| db $01 ; GLOVE
|0984B8| db $04 ; MITTS
|0984B9| db $04 ; BOOK
|0984BA| db $02 ; FLIPPERS
|0984BB| db $01 ; PEARL
|0984BC| db $06 ; CRYSTAL
|0984BD| db $01 ; NET
|0984BE| db $02 ; BLUE MAIL
|0984BF| db $01 ; RED MAIL
|0984C0| db $02 ; SMALL KEY
|0984C1| db $02 ; COMPASS
|0984C2| db $01 ; HEART CONTAINER FROM 4/4
|0984C3| db $02 ; BOMB
|0984C4| db $02 ; 3 BOMBS
|0984C5| db $04 ; MUSHROOM
|0984C6| db $01 ; RED BOOMERANG
|0984C7| db $01 ; FULL BOTTLE (RED)
|0984C8| db $04 ; FULL BOTTLE (GREEN)
|0984C9| db $02 ; FULL BOTTLE (BLUE)
|0984CA| db $01 ; POTION REFILL (RED)
|0984CB| db $04 ; POTION REFILL (GREEN)
|0984CC| db $02 ; POTION REFILL (BLUE)
|0984CD| db $02 ; 10 BOMBS
|0984CE| db $04 ; BIG KEY
|0984CF| db $04 ; MAP
|0984D0| db $04 ; 1 RUPEE
|0984D1| db $02 ; 5 RUPEES
|0984D2| db $01 ; 20 RUPEES
|0984D3| db $04 ; GREEN PENDANT
|0984D4| db $01 ; BLUE PENDANT
|0984D5| db $02 ; RED PENDANT
|0984D6| db $02 ; TOSSED BOW
|0984D7| db $01 ; SILVERS
|0984D8| db $02 ; FULL BOTTLE (BEE)
|0984D9| db $02 ; FULL BOTTLE (FAIRY)
|0984DA| db $01 ; BOSS HC
|0984DB| db $01 ; SANC HC
|0984DC| db $04 ; 100 RUPEES
|0984DD| db $04 ; 50 RUPEES
|0984DE| db $01 ; HEART
|0984DF| db $02 ; ARROW
|0984E0| db $02 ; 10 ARROWS
|0984E1| db $04 ; SMALL MAGIC
|0984E2| db $04 ; 300 RUPEES
|0984E3| db $04 ; 20 RUPEES GREEN
|0984E4| db $02 ; FULL BOTTLE (GOOD BEE)
|0984E5| db $05 ; TOSSED FIGHTER SWORD
|0984E6| db $02 ; FLUTE (ACTIVATED)
|0984E7| db $01 ; BOOTS

;---------------------------------------------------------------------------------------------------

.sram_write
|0984E8| dw $7EF359 ; FIGHTER SWORD
|0984EA| dw $7EF359 ; MASTER SWORD
|0984EC| dw $7EF359 ; TEMPERED SWORD
|0984EE| dw $7EF359 ; BUTTER SWORD
|0984F0| dw $7EF35A ; FIGHTER SHIELD
|0984F2| dw $7EF35A ; FIRE SHIELD
|0984F4| dw $7EF35A ; MIRROR SHIELD
|0984F6| dw $7EF345 ; FIRE ROD
|0984F8| dw $7EF346 ; ICE ROD
|0984FA| dw $7EF34B ; HAMMER
|0984FC| dw $7EF342 ; HOOKSHOT
|0984FE| dw $7EF340 ; BOW
|098500| dw $7EF341 ; BOOMERANG
|098502| dw $7EF344 ; POWDER
|098504| dw $7EF35C ; BOTTLE REFILL (BEE)
|098506| dw $7EF347 ; BOMBOS
|098508| dw $7EF348 ; ETHER
|09850A| dw $7EF349 ; QUAKE
|09850C| dw $7EF34A ; LAMP
|09850E| dw $7EF34C ; SHOVEL
|098510| dw $7EF34C ; FLUTE
|098512| dw $7EF350 ; SOMARIA
|098514| dw $7EF35C ; BOTTLE
|098516| dw $7EF36B ; HEART PIECE
|098518| dw $7EF351 ; BYRNA
|09851A| dw $7EF352 ; CAPE
|09851C| dw $7EF353 ; MIRROR
|09851E| dw $7EF354 ; GLOVE
|098520| dw $7EF354 ; MITTS
|098522| dw $7EF34E ; BOOK
|098524| dw $7EF356 ; FLIPPERS
|098526| dw $7EF357 ; PEARL
|098528| dw $7EF37A ; CRYSTAL
|09852A| dw $7EF34D ; NET
|09852C| dw $7EF35B ; BLUE MAIL
|09852E| dw $7EF35B ; RED MAIL
|098530| dw $7EF36F ; SMALL KEY
|098532| dw $7EF364 ; COMPASS
|098534| dw $7EF36C ; HEART CONTAINER FROM 4/4
|098536| dw $7EF375 ; BOMB
|098538| dw $7EF375 ; 3 BOMBS
|09853A| dw $7EF344 ; MUSHROOM
|09853C| dw $7EF341 ; RED BOOMERANG
|09853E| dw $7EF35C ; FULL BOTTLE (RED)
|098540| dw $7EF35C ; FULL BOTTLE (GREEN)
|098542| dw $7EF35C ; FULL BOTTLE (BLUE)
|098544| dw $7EF36D ; POTION REFILL (RED)
|098546| dw $7EF36E ; POTION REFILL (GREEN)
|098548| dw $7EF36E ; POTION REFILL (BLUE)
|09854A| dw $7EF375 ; 10 BOMBS
|09854C| dw $7EF366 ; BIG KEY
|09854E| dw $7EF368 ; MAP
|098550| dw $7EF360 ; 1 RUPEE
|098552| dw $7EF360 ; 5 RUPEES
|098554| dw $7EF360 ; 20 RUPEES
|098556| dw $7EF374 ; GREEN PENDANT
|098558| dw $7EF374 ; BLUE PENDANT
|09855A| dw $7EF374 ; RED PENDANT
|09855C| dw $7EF340 ; TOSSED BOW
|09855E| dw $7EF340 ; SILVERS
|098560| dw $7EF35C ; FULL BOTTLE (BEE)
|098562| dw $7EF35C ; FULL BOTTLE (FAIRY)
|098564| dw $7EF36C ; BOSS HC
|098566| dw $7EF36C ; SANC HC
|098568| dw $7EF360 ; 100 RUPEES
|09856A| dw $7EF360 ; 50 RUPEES
|09856C| dw $7EF372 ; HEART
|09856E| dw $7EF376 ; ARROW
|098570| dw $7EF376 ; 10 ARROWS
|098572| dw $7EF373 ; SMALL MAGIC
|098574| dw $7EF360 ; 300 RUPEES
|098576| dw $7EF360 ; 20 RUPEES GREEN
|098578| dw $7EF35C ; FULL BOTTLE (GOOD BEE)
|09857A| dw $7EF359 ; TOSSED FIGHTER SWORD
|09857C| dw $7EF34C ; FLUTE (ACTIVATED)
|09857E| dw $7EF355 ; BOOTS

;---------------------------------------------------------------------------------------------------

.sram_value
|098580| db $01 ; FIGHTER SWORD
|098581| db $02 ; MASTER SWORD
|098582| db $03 ; TEMPERED SWORD
|098583| db $04 ; BUTTER SWORD
|098584| db $01 ; FIGHTER SHIELD
|098585| db $02 ; FIRE SHIELD
|098586| db $03 ; MIRROR SHIELD
|098587| db $01 ; FIRE ROD
|098588| db $01 ; ICE ROD
|098589| db $01 ; HAMMER
|09858A| db $01 ; HOOKSHOT
|09858B| db $01 ; BOW
|09858C| db $01 ; BOOMERANG
|09858D| db $02 ; POWDER
|09858E| db $FF ; BOTTLE REFILL (BEE)
|09858F| db $01 ; BOMBOS
|098590| db $01 ; ETHER
|098591| db $01 ; QUAKE
|098592| db $01 ; LAMP
|098593| db $01 ; SHOVEL
|098594| db $02 ; FLUTE
|098595| db $01 ; SOMARIA
|098596| db $FF ; BOTTLE
|098597| db $FF ; HEART PIECE
|098598| db $01 ; BYRNA
|098599| db $01 ; CAPE
|09859A| db $02 ; MIRROR
|09859B| db $01 ; GLOVE
|09859C| db $02 ; MITTS
|09859D| db $01 ; BOOK
|09859E| db $01 ; FLIPPERS
|09859F| db $01 ; PEARL
|0985A0| db $FF ; CRYSTAL
|0985A1| db $01 ; NET
|0985A2| db $FF ; BLUE MAIL
|0985A3| db $02 ; RED MAIL
|0985A4| db $FF ; SMALL KEY
|0985A5| db $FF ; COMPASS
|0985A6| db $FF ; HEART CONTAINER FROM 4/4
|0985A7| db $FF ; BOMB
|0985A8| db $FF ; 3 BOMBS
|0985A9| db $FF ; MUSHROOM
|0985AA| db $02 ; RED BOOMERANG
|0985AB| db $FF ; FULL BOTTLE (RED)
|0985AC| db $FF ; FULL BOTTLE (GREEN)
|0985AD| db $FF ; FULL BOTTLE (BLUE)
|0985AE| db $FF ; POTION REFILL (RED)
|0985AF| db $FF ; POTION REFILL (GREEN)
|0985B0| db $FF ; POTION REFILL (BLUE)
|0985B1| db $FF ; 10 BOMBS
|0985B2| db $FF ; BIG KEY
|0985B3| db $FF ; MAP
|0985B4| db $FF ; 1 RUPEE
|0985B5| db $FB ; 5 RUPEES
|0985B6| db $EC ; 20 RUPEES
|0985B7| db $FF ; GREEN PENDANT
|0985B8| db $FF ; BLUE PENDANT
|0985B9| db $FF ; RED PENDANT
|0985BA| db $01 ; TOSSED BOW
|0985BB| db $03 ; SILVERS
|0985BC| db $FF ; FULL BOTTLE (BEE)
|0985BD| db $FF ; FULL BOTTLE (FAIRY)
|0985BE| db $FF ; BOSS HC
|0985BF| db $FF ; SANC HC
|0985C0| db $9C ; 100 RUPEES
|0985C1| db $CE ; 50 RUPEES
|0985C2| db $FF ; HEART
|0985C3| db $01 ; ARROW
|0985C4| db $0A ; 10 ARROWS
|0985C5| db $FF ; SMALL MAGIC
|0985C6| db $FF ; 300 RUPEES
|0985C7| db $FF ; 20 RUPEES GREEN
|0985C8| db $FF ; FULL BOTTLE (GOOD BEE)
|0985C9| db $01 ; TOSSED FIGHTER SWORD
|0985CA| db $03 ; FLUTE (ACTIVATED)
|0985CB| db $01 ; BOOTS

;===================================================================================================

.dungeon_masks
|0985CC| dw $8000 ; Sewers
|0985CE| dw $4000 ; Hyrule Castle
|0985D0| dw $2000 ; Eastern Palace
|0985D2| dw $1000 ; Desert Palace
|0985D4| dw $0800 ; Agahnim's Tower
|0985D6| dw $0400 ; Swamp Palace
|0985D8| dw $0200 ; Palace of Darkness
|0985DA| dw $0100 ; Misery Mire
|0985DC| dw $0080 ; Skull Woods
|0985DE| dw $0040 ; Ice Palace
|0985E0| dw $0020 ; Tower of Hera
|0985E2| dw $0010 ; Thieves' Town
|0985E4| dw $0008 ; Turtle Rock
|0985E6| dw $0004 ; Ganon's Tower

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_ItemReceipt:
|0985E8| PHB
|0985E9| PHK
|0985EA| PLB

|0985EB| JSR AddAncilla
|0985EE| BCC .free_slot

|0985F0| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|0985F3| LDA.w $02E9
|0985F6| CMP.b #$01
|0985F8| BNE .not_chest

|0985FA| LDA.b $72
|0985FC| PHA

|0985FD| LDA.b $73
|0985FF| PHA

.not_chest
|098600| LDY.b #$01

|098602| LDA.w $02D8
|098605| CMP.b #$20 ; ITEMGET 20
|098607| BNE .not_crystal

|098609| LDY.b #$02

;---------------------------------------------------------------------------------------------------

.not_crystal
|09860B| TYA
|09860C| STA.w $02E4

|09860F| PHX

|098610| LDY.w $02D8
|098613| BNE .not_uncle_gear

|098615| LDX.b #$08 ; ITEMGET 04 but x2

|098617| LDA.w .sram_write+0,X
|09861A| STA.b $00

|09861C| LDA.w .sram_write+1,X
|09861F| STA.b $01

|098621| LDA.b #$7E
|098623| STA.b $02

|098625| LDA.w .sram_value,Y
|098628| STA.b [$00]

;---------------------------------------------------------------------------------------------------

.not_uncle_gear
|09862A| TYA
|09862B| ASL A
|09862C| TAX

|09862D| LDA.w .sram_write+0,X
|098630| STA.b $00

|098632| LDA.w .sram_write+1,X
|098635| STA.b $01

|098637| LDA.b #$7E
|098639| STA.b $02

|09863B| LDA.w .sram_value,Y
|09863E| BMI .dont_write

|098640| STA.b [$00]

.dont_write
|098642| CPY.b #$1F ; ITEMGET 1F
|098644| BNE .not_moon_pearl

|098646| STZ.b $56

;---------------------------------------------------------------------------------------------------

.not_moon_pearl
|098648| LDA.b #$04

|09864A| CPY.b #$4B ; ITEMGET 4B
|09864C| BEQ .boots

|09864E| CPY.b #$1E ; ITEMGET 1E
|098650| BNE .not_flippers

.flippers
|098652| LDA.b #$02

;---------------------------------------------------------------------------------------------------

.boots
|098654| ORA.l $7EF379
|098658| STA.l $7EF379

;---------------------------------------------------------------------------------------------------

.not_flippers
|09865C| CPY.b #$1B ; ITEMGET 1B
|09865E| BEQ .power_glove

|098660| CPY.b #$1C ; ITEMGET 1C
|098662| BNE .not_mitts

.power_glove
|098664| JSL PaletteLoad_LinkGloves

;---------------------------------------------------------------------------------------------------

.proceed_to_gfx
|098668| BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_mitts
|09866B| LDX.b #$04
|09866D| CPY.b #$37 ; ITEMGET 37
|09866F| BEQ .pendant

|098671| LDX.b #$01
|098673| CPY.b #$38 ; ITEMGET 38
|098675| BEQ .pendant

|098677| LDX.b #$02
|098679| CPY.b #$39 ; ITEMGET 39
|09867B| BNE .not_pendant

.pendant
|09867D| TXA
|09867E| ORA.b [$00]
|098680| STA.b [$00]

|098682| INC.w $0200
|098685| AND.b #$07
|098687| CMP.b #$07
|098689| BNE .not_pendant

|09868B| LDA.b #$04
|09868D| STA.l $7EF3C7

;---------------------------------------------------------------------------------------------------

.not_pendant
|098691| CPY.b #$22 ; ITEMGET 22
|098693| BNE .not_blue_mail

|098695| LDA.b [$00]
|098697| BNE .we_have_good_mail

|098699| LDA.b #$01
|09869B| STA.b [$00]

.we_have_good_mail
|09869D| BRA .proceed_to_gfx

;---------------------------------------------------------------------------------------------------

.not_blue_mail
|09869F| CPY.b #$25 ; ITEMGET 25
|0986A1| BEQ .dungeon_item

|0986A3| CPY.b #$32 ; ITEMGET 32
|0986A5| BEQ .dungeon_item

|0986A7| CPY.b #$33 ; ITEMGET 33
|0986A9| BNE .not_dungeon_item

.dungeon_item
|0986AB| LDX.w $040C

|0986AE| REP #$20

|0986B0| LDA.w .dungeon_masks,X
|0986B3| ORA.b [$00]
|0986B5| STA.b [$00]

|0986B7| SEP #$20

|0986B9| BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_dungeon_item
|0986BC| CPY.b #$3E ; ITEMGET 3E
|0986BE| BNE .not_heart_container

|0986C0| BIT.w $0308
|0986C3| BPL .not_heart_container

|0986C5| LDA.b #$02
|0986C7| STA.w $0309

.not_heart_container
|0986CA| CPY.b #$20 ; ITEMGET 20
|0986CC| BNE .not_crystal_or_caping

|0986CE| INC.w $0200

;---------------------------------------------------------------------------------------------------

|0986D1| PHX

|0986D2| LDX.b #$04

.next_ancilla_check
|0986D4| LDA.w $0C4A,X
|0986D7| CMP.b #$07 ; ANCILLA 07
|0986D9| BEQ .bomb_ancilla

|0986DB| CMP.b #$2C ; ANCILLA 2C
|0986DD| BNE .not_somaria_block

.bomb_ancilla
|0986DF| STZ.w $0C4A,X

|0986E2| STZ.w $0308
|0986E5| STZ.w $0309

.not_somaria_block
|0986E8| DEX
|0986E9| BPL .next_ancilla_check

|0986EB| PLX

;---------------------------------------------------------------------------------------------------

|0986EC| LDA.b $55
|0986EE| BEQ .not_crystal_or_caping

|0986F0| LDA.b #$20
|0986F2| STA.w $02E2

|0986F5| STZ.w $037B
|0986F8| STZ.b $55

|0986FA| PHY
|0986FB| PHX

|0986FC| LDY.b #$04
|0986FE| LDA.b #$23 ; ANCILLA 23
|098700| JSL AncillaAdd_CapePoof

|098704| JSL CalculateLinkSFXPan
|098708| ORA.b #$15 ; SFX2.15
|09870A| STA.w $012E

|09870D| PLX
|09870E| PLY

|09870F| BRL .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_crystal_or_caping
|098712| CPY.b #$29 ; ITEMGET 29
|098714| BNE .dont_give_mushroom

|098716| LDA.l $7EF344
|09871A| CMP.b #$02
|09871C| BEQ .dont_give_mushroom

|09871E| LDA.b #$01
|098720| STA.b [$00]
|098722| BRA .refresh_hud

;---------------------------------------------------------------------------------------------------

.dont_give_mushroom
|098724| LDX.b #$01

|098726| CPY.b #$24 ; ITEMGET 24
|098728| BEQ .add_to_stock

|09872A| LDA.w $02E9
|09872D| CMP.b #$02
|09872F| BEQ .dont_add_to_stock

|098731| CPY.b #$27 ; ITEMGET 27
|098733| BEQ .add_to_stock

|098735| LDX.b #$03

|098737| CPY.b #$28 ; ITEMGET 28
|098739| BEQ .add_to_stock

|09873B| CPY.b #$31 ; ITEMGET 31
|09873D| BNE .dont_add_to_stock

|09873F| LDX.b #$0A

;---------------------------------------------------------------------------------------------------

.add_to_stock
|098741| TXA
|098742| CLC
|098743| ADC.b [$00]
|098745| STA.b [$00]

|098747| CMP.b #99
|098749| BCC .refresh_hud

|09874B| LDA.b #99
|09874D| STA.b [$00]

.refresh_hud
|09874F| JSL RefreshItemIcon

|098753| BRA .handle_gfx

;---------------------------------------------------------------------------------------------------

.dont_add_to_stock
|098755| CPY.b #$17 ; ITEMGET 17
|098757| BNE .not_heart_piece

|098759| LDA.b [$00]
|09875B| INC A
|09875C| AND.b #$03
|09875E| STA.b [$00]

|098760| JSL CalculateLinkSFXPan
|098764| ORA.b #$2D ; SFX3.2D
|098766| STA.w $012F

|098769| BRA .handle_gfx

;---------------------------------------------------------------------------------------------------

.not_heart_piece
|09876B| CPY.b #$01 ; ITEMGET 01
|09876D| BNE .is_not_ms

|09876F| PHY
|098770| PHX

|098771| JSL AdjustOverworldAmbiance

|098775| PLX
|098776| PLY

.is_not_ms
|098777| JSR ItemReceipt_GiveBottledItem

;---------------------------------------------------------------------------------------------------

.handle_gfx
|09877A| LDY.w $02D8

|09877D| LDA.w .item_gfx_index,Y
|098780| STA.b $72

|098782| CMP.b #$FF
|098784| BEQ .null

|098786| CMP.b #$20
|098788| BEQ .shield

|09878A| CMP.b #$2D
|09878C| BEQ .shield

|09878E| CMP.b #$2E
|098790| BNE .extract_graphics

.shield
|098792| JSL DecompressShieldGraphics
|098796| JSL PaletteLoad_Shield

|09879A| LDA.b $72

|09879C| BRA .extract_graphics

.null
|09879E| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.extract_graphics
|0987A0| JSL WriteTo4BPPBuffer_item_gfx

|0987A4| LDA.b $72

|0987A6| CMP.b #$06
|0987A8| BEQ .sword

|0987AA| CMP.b #$18
|0987AC| BNE .not_sword

.sword
|0987AE| LDA.w $02D8
|0987B1| BEQ .not_sword

|0987B3| JSL DecompressSwordGraphics
|0987B7| JSL PaletteLoad_Sword

;---------------------------------------------------------------------------------------------------

.not_sword
|0987BB| PLX

|0987BC| LDA.w $02D8
|0987BF| STA.w $0C5E,X

|0987C2| TAY

|0987C3| STZ.w $03A4,X

|0987C6| LDA.b #$09
|0987C8| CPY.b #$01 ; ITEMGET 01
|0987CA| BNE .not_mastersword

;---------------------------------------------------------------------------------------------------

|0987CC| STA.w $039F,X

|0987CF| LDA.w $02E9
|0987D2| CMP.b #$02
|0987D4| BEQ .ms_from_sprite

|0987D6| LDA.b #$A0
|0987D8| STA.w $0C68,X

|0987DB| LDA.b #$2B
|0987DD| STA.b $11

|0987DF| LDA.b #$00
|0987E1| STA.l $7EC007

|0987E5| PHX
|0987E6| PHY

|0987E7| LDY.b #$04
|0987E9| LDA.b #$35 ; ANCILLA 35
|0987EB| JSL AncillaAdd_MasterSwordCutscene

|0987EF| PLY
|0987F0| PLX

|0987F1| LDA.b #$02

;---------------------------------------------------------------------------------------------------

.not_mastersword
|0987F3| STA.w $039F,X

.ms_from_sprite
|0987F6| LDA.b #$05
|0987F8| STA.w $0BF0,X

|0987FB| PHY

|0987FC| LDY.b #$60

|0987FE| LDA.w $02E9
|098801| STA.w $0C54,X
|098804| BEQ .was_from_text

|098806| LDY.b #$38

.was_from_text
|098808| LDA.w $0C5E,X

|09880B| CMP.b #$20 ; ITEMGET 20
|09880D| BEQ .dungeon_prize

|09880F| CMP.b #$37 ; ITEMGET 37
|098811| BEQ .dungeon_prize

|098813| CMP.b #$38 ; ITEMGET 38
|098815| BEQ .dungeon_prize

|098817| CMP.b #$39 ; ITEMGET 39
|098819| BEQ .dungeon_prize

|09881B| CMP.b #$26 ; ITEMGET 26
|09881D| BNE .not_44_heart

|09881F| LDY.b #$02
|098821| BRA .not_44_heart

.dungeon_prize
|098823| LDY.b #$68

;---------------------------------------------------------------------------------------------------

.not_44_heart
|098825| TYA
|098826| STA.w $03B1,X

|098829| PLY

|09882A| LDA.w $02E9
|09882D| CMP.b #$01
|09882F| BNE .not_from_chest

;---------------------------------------------------------------------------------------------------

|098831| PLA
|098832| STA.b $73

|098834| PLA
|098835| STA.b $72

|098837| REP #$20

|098839| LDA.b $72
|09883B| AND.w #$1F80

|09883E| LSR A
|09883F| LSR A
|098840| LSR A
|098841| LSR A

|098842| STA.b $00

|098844| LDA.b $72
|098846| AND.w #$007E
|098849| ASL A
|09884A| ASL A
|09884B| STA.b $02

;---------------------------------------------------------------------------------------------------

|09884D| SEP #$20

|09884F| LDA.b $01
|098851| CLC
|098852| ADC.w $062F
|098855| STA.b $01

|098857| LDA.b $03
|098859| CLC
|09885A| ADC.w $062D
|09885D| STA.b $03

|09885F| REP #$20

|098861| LDA.w .offset_y,Y
|098864| AND.w #$00FF
|098867| ORA.w #$FF00

|09886A| CLC
|09886B| ADC.b $00
|09886D| STA.b $00

|09886F| LDA.w .offset_x,Y
|098872| AND.w #$00FF
|098875| CLC
|098876| ADC.b $02

|098878| BRL .proceed_to_finish_coords

;---------------------------------------------------------------------------------------------------

.not_from_chest
|09887B| PHY

|09887C| LDA.w $0C54,X
|09887F| BNE .not_text_or_ms

|098881| LDA.w $0C5E,X
|098884| CMP.b #$01 ; ITEMGET 01
|098886| BNE .not_text_or_ms

|098888| JSL CalculateLinkSFXPan
|09888C| ORA.b #$2C ; SFX2.2C
|09888E| STA.w $012E

|098891| BRA .done_with_sfx

;---------------------------------------------------------------------------------------------------

.not_text_or_ms
|098893| LDA.w $0C5E,X

|098896| CMP.b #$3E ; ITEMGET 3E
|098898| BEQ .done_with_sfx

|09889A| CMP.b #$17 ; ITEMGET 17
|09889C| BEQ .done_with_sfx

|09889E| CMP.b #$20 ; ITEMGET 20
|0988A0| BEQ .dungeon_prize_sfx

|0988A2| CMP.b #$37 ; ITEMGET 37
|0988A4| BEQ .dungeon_prize_sfx

|0988A6| CMP.b #$38 ; ITEMGET 38
|0988A8| BEQ .dungeon_prize_sfx

|0988AA| CMP.b #$39 ; ITEMGET 39
|0988AC| BNE .not_dungeon_prize_sfx

;---------------------------------------------------------------------------------------------------

.dungeon_prize_sfx
|0988AE| JSL CalculateLinkSFXPan
|0988B2| ORA.b #$13 ; SONG 13
|0988B4| STA.w $012C

|0988B7| BRA .done_with_sfx

;---------------------------------------------------------------------------------------------------

.not_dungeon_prize_sfx
|0988B9| JSL CalculateLinkSFXPan
|0988BD| ORA.b #$0F ; SFX3.0F
|0988BF| STA.w $012F

;---------------------------------------------------------------------------------------------------

.done_with_sfx
|0988C2| LDA.b #$0A
|0988C4| STA.b $02
|0988C6| STZ.b $03

|0988C8| LDY.w $0C5E,X

|0988CB| LDA.w .width,Y
|0988CE| BEQ .set_coordinates

|0988D0| CPY.b #$20 ; ITEMGET 20
|0988D2| BNE .aint_a_crystal

|0988D4| STZ.b $02
|0988D6| BRA .set_coordinates

;---------------------------------------------------------------------------------------------------

.aint_a_crystal
|0988D8| LDA.b #$06
|0988DA| STA.b $02

;---------------------------------------------------------------------------------------------------

.set_coordinates
|0988DC| LDY.w $02E9

|0988DF| CPY.b #$03
|0988E1| BNE .not_from_ancilla

|0988E3| LDY.b #$00

.not_from_ancilla
|0988E5| STZ.b $08
|0988E7| STZ.b $09

|0988E9| CPY.b #$02
|0988EB| BNE .dont_adjust_altitude

|0988ED| LDA.b #$F8
|0988EF| STA.b $08
|0988F1| DEC.b $09

.dont_adjust_altitude
|0988F3| STY.b $04
|0988F5| STZ.b $05

;---------------------------------------------------------------------------------------------------

|0988F7| PLY

|0988F8| REP #$20

|0988FA| LDA.w #$FFF2
|0988FD| STA.b $00

|0988FF| LDA.b $04
|098901| BEQ .dont_adjust_y_for_text

|098903| LDA.w .offset_y,Y
|098906| AND.w #$00FF
|098909| ORA.w #$FF00
|09890C| STA.b $00

.dont_adjust_y_for_text
|09890E| LDA.b $00
|098910| CLC
|098911| ADC.b $20

|098913| CLC
|098914| ADC.b $08
|098916| STA.b $00

;---------------------------------------------------------------------------------------------------

|098918| LDA.b $04
|09891A| BEQ .dont_adjust_x_for_text

|09891C| LDA.w .offset_x,Y
|09891F| AND.w #$00FF
|098922| STA.b $02

.dont_adjust_x_for_text
|098924| LDA.b $02
|098926| CLC
|098927| ADC.b $22

;---------------------------------------------------------------------------------------------------

.proceed_to_finish_coords
|098929| STA.b $02

|09892B| SEP #$20

|09892D| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|098930| PLB

|098931| RTL

;===================================================================================================

pool ItemReceipt_GiveBottledItem

.bottle_id
|098932| db $16 ; ITEMGET 16 - EMPTY BOTTLE
|098933| db $2B ; ITEMGET 2B - FULL BOTTLE (RED)
|098934| db $2C ; ITEMGET 2C - FULL BOTTLE (GREEN)
|098935| db $2D ; ITEMGET 2D - FULL BOTTLE (BLUE)
|098936| db $3D ; ITEMGET 3D - FULL BOTTLE (FAIRY)
|098937| db $3C ; ITEMGET 3C - FULL BOTTLE (BEE)
|098938| db $48 ; ITEMGET 48 - FULL BOTTLE (GOOD BEE)

.refill_id
|098939| db $2E ; ITEMGET 2E - POTION REFILL (RED)
|09893A| db $2F ; ITEMGET 2F - POTION REFILL (GREEN)
|09893B| db $30 ; ITEMGET 30 - POTION REFILL (BLUE)
|09893C| db $FF ; null
|09893D| db $0E ; ITEMGET 0E - BOTTLE REFILL (BEE)

endpool

;---------------------------------------------------------------------------------------------------

ItemReceipt_GiveBottledItem:
|09893E| STY.b $0C

|098940| LDX.b #$06

.next_id_check
|098942| LDA.w .bottle_id,X
|098945| CMP.b $0C
|098947| BEQ .contents_id_found

|098949| DEX
|09894A| BPL .next_id_check

|09894C| BRA .not_new_bottle

;---------------------------------------------------------------------------------------------------

.contents_id_found
|09894E| TXA
|09894F| CLC
|098950| ADC.b #$02
|098952| STA.b $0C

|098954| LDX.b #$00

.next_free_bottle_check
|098956| LDA.l $7EF35C,X
|09895A| CMP.b #$02
|09895C| BCS .slot_occupied

|09895E| LDA.b $0C
|098960| STA.l $7EF35C,X

|098964| BRL .exit

.slot_occupied
|098967| INX
|098968| CPX.b #$04
|09896A| BNE .next_free_bottle_check

;---------------------------------------------------------------------------------------------------

.not_new_bottle
|09896C| STY.b $0C

|09896E| LDX.b #$04

.next_refill_check
|098970| LDA.w .refill_id,X
|098973| CMP.b $0C
|098975| BEQ .refill_matched

|098977| DEX
|098978| BPL .next_refill_check

|09897A| BRA .exit

;---------------------------------------------------------------------------------------------------

.refill_matched
|09897C| TXA
|09897D| CLC
|09897E| ADC.b #$03
|098980| STA.b $0C

|098982| LDX.b #$00

.next_empty_bottle_check
|098984| LDA.l $7EF35C,X
|098988| CMP.b #$02
|09898A| BNE .not_empty_bottle

|09898C| LDA.b $0C
|09898E| STA.l $7EF35C,X

|098992| BRA .exit

.not_empty_bottle
|098994| INX
|098995| CPX.b #$04
|098997| BNE .next_empty_bottle_check

;---------------------------------------------------------------------------------------------------

.exit
|098999| RTS

;===================================================================================================

pool AncillaAdd_TossedPondItem

.offset_y
|09899A| db -13, -13, -13, -13, -13, -12, -12, -13
|0989A2| db -13, -12, -12, -12, -10, -12, -12, -12
|0989AA| db -12, -12, -12, -12, -12, -12, -12, -12
|0989B2| db -12, -12, -12, -12, -12, -12, -12, -12
|0989BA| db -12, -12, -12, -13, -12, -12, -12, -12
|0989C2| db -12, -12, -10, -12, -12, -12, -12, -12
|0989CA| db -12, -12, -12, -12, -12, -12, -12, -12
|0989D2| db -12, -12, -12, -12, -12, -12, -12, -12
|0989DA| db -12, -12, -12, -12, -12, -12, -12, -12
|0989E2| db -12, -13, -12, -12

.offset_x
|0989E6| db   4,   4,   4,   4,   4,   0,   0,   4
|0989EE| db   4,   4,   4,   4,   5,   0,   0,   0
|0989F6| db   0,   0,   0,   4,   0,   4,   0,   0
|0989FE| db   4,   0,   0,   0,   0,   0,   0,   0
|098A06| db   0,   0,   0,   0,  11,   0,   0,   0
|098A0E| db   2,   0,   5,   0,   0,   0,   0,   0
|098A16| db   0,   0,   0,   0,   4,   4,   4,   0
|098A1E| db   0,   0,   0,   0,   0,   0,   0,   0
|098A26| db   0,   0,   4,   4,   0,   4,   0,   0
|098A2E| db   0,   4,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_TossedPondItem:
|098A32| PHB
|098A33| PHK
|098A34| PLB

|098A35| STX.w $02D8

|098A38| JSR AddAncilla
|098A3B| BCS EXIT_098AB8

|098A3D| JSL CalculateLinkSFXPan
|098A41| ORA.b #$13 ; SFX3.13
|098A43| STA.w $012F

|098A46| PHX

|098A47| LDY.w $02D8

|098A4A| LDA.w AncillaAdd_ItemReceipt.item_gfx_index,Y
|098A4D| STA.b $72

|098A4F| CMP.b #$FF
|098A51| BEQ .invalid

|098A53| CMP.b #$20
|098A55| BNE .continue

|098A57| JSL DecompressShieldGraphics

|098A5B| LDA.b $72
|098A5D| BRA .continue

.invalid
|098A5F| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.continue
|098A61| JSL WriteTo4BPPBuffer_item_gfx

|098A65| LDA.b $72
|098A67| CMP.b #$06
|098A69| BNE .not_fighter_sword

|098A6B| JSL DecompressSwordGraphics

.not_fighter_sword
|098A6F| PLX

|098A70| LDA.b #$80
|098A72| STA.w $0308
|098A75| STZ.w $0309

|098A78| STZ.b $2F
|098A7A| STZ.b $2E

|098A7C| LDA.b #$14
|098A7E| STA.w $0294,X

|098A81| LDA.b #$D8
|098A83| STA.w $0C22,X

|098A86| STZ.w $0C2C,X
|098A89| STZ.w $029E,X

|098A8C| LDA.b #$10
|098A8E| STA.w $0C68,X

|098A91| LDA.w $02D8
|098A94| STA.w $0C5E,X

|098A97| TAY

|098A98| REP #$20

|098A9A| LDA.w .offset_y,Y
|098A9D| AND.w #$00FF
|098AA0| ORA.w #$FF00
|098AA3| CLC
|098AA4| ADC.b $20
|098AA6| STA.b $00

|098AA8| LDA.w .offset_x,Y
|098AAB| AND.w #$00FF
|098AAE| CLC
|098AAF| ADC.b $22
|098AB1| STA.b $02

|098AB3| SEP #$20

|098AB5| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_098AB8:
|098AB8| PLB

|098AB9| RTL

;===================================================================================================

pool AddHappinessPondRupees

.speed_z
|098ABA| db $14, $14, $14, $14
|098ABE| db $14, $10, $10, $10, $10
|098AC3| db $10

.speed_y
|098AC4| db $D8, $D8, $D8, $D8
|098AC8| db $D8, $E0, $E0, $E0, $E0
|098ACD| db $E0

.speed_x
|098ACE| db $00, $F4, $FA, $06
|098AD2| db $0C, $F7, $FB, $00, $05
|098AD7| db $09

.start_index
|098AD8| db $00
|098AD9| db $04
|098ADA| db $04
|098ADB| db $09

.end_index
|098ADC| db $FF
|098ADD| db $00
|098ADE| db $FF
|098ADF| db $FF

endpool

;---------------------------------------------------------------------------------------------------

AddHappinessPondRupees:
|098AE0| PHB
|098AE1| PHK
|098AE2| PLB

|098AE3| PHX
|098AE4| PHA

|098AE5| LDY.b #$09
|098AE7| LDA.b #$42 ; ANCILLA 42
|098AE9| JSR AddAncilla
|098AEC| BCC .free_slot

|098AEE| PLA
|098AEF| PLX

|098AF0| BRA EXIT_098AB8

;---------------------------------------------------------------------------------------------------

.free_slot
|098AF2| JSL CalculateLinkSFXPan
|098AF6| ORA.b #$13 ; SFX3.13
|098AF8| STA.w $012F

|098AFB| LDY.b #$35 ; ITEMGET 35
|098AFD| LDA.w AncillaAdd_ItemReceipt.item_gfx_index,Y
|098B00| STA.b $72

|098B02| JSL WriteTo4BPPBuffer_item_gfx

|098B06| LDA.b #$80
|098B08| STA.w $0308
|098B0B| STZ.w $0309

|098B0E| STZ.b $2F
|098B10| STZ.b $2E

|098B12| LDX.b #$09
|098B14| LDA.b #$00

;---------------------------------------------------------------------------------------------------

.next_clear
|098B16| STA.l $7F586C,X

|098B1A| DEX
|098B1B| BPL .next_clear

|098B1D| PLA
|098B1E| TAX

|098B1F| LDA.w .end_index,X
|098B22| STA.b $0F

|098B24| LDA.w .start_index,X
|098B27| TAY

;---------------------------------------------------------------------------------------------------

|098B28| LDX.b #$09

.next_rupee
|098B2A| LDA.b #$01
|098B2C| STA.l $7F586C,X

|098B30| LDA.w .speed_z,Y
|098B33| STA.l $7F5818,X

|098B37| LDA.w .speed_y,Y
|098B3A| STA.l $7F5800,X

|098B3E| LDA.w .speed_x,Y
|098B41| STA.l $7F580C,X

|098B45| LDA.b #$00
|098B47| STA.l $7F5854,X
|098B4B| STA.l $7F58AA,X

|098B4F| LDA.b #$10
|098B51| STA.l $7F5860,X

|098B55| LDA.b #$35
|098B57| STA.l $7F587A,X

|098B5B| REP #$20

|098B5D| LDA.b $20
|098B5F| CLC
|098B60| ADC.w #$FFF4
|098B63| STA.b $00

|098B65| LDA.b $22
|098B67| CLC
|098B68| ADC.w #$0004
|098B6B| STA.b $02

|098B6D| SEP #$20

|098B6F| LDA.b $00
|098B71| STA.l $7F5824,X

|098B75| LDA.b $01
|098B77| STA.l $7F5830,X

|098B7B| LDA.b $02
|098B7D| STA.l $7F583C,X

|098B81| LDA.b $03
|098B83| STA.l $7F5848,X

|098B87| DEX

|098B88| DEY
|098B89| CPY.b $0F
|098B8B| BNE .next_rupee

|098B8D| PLX

;---------------------------------------------------------------------------------------------------

#EXIT_098B8E:
|098B8E| PLB

|098B8F| RTL

;===================================================================================================

pool AncillaAdd_FallingPrize

.receipt_ids

.ether_id
|098B90| db $10 ; ITEMGET 10

.green_pendant_id
|098B91| db $37 ; ITEMGET 37

.red_pendant_id
|098B92| db $39 ; ITEMGET 39

.blue_pendant_id
|098B93| db $38 ; ITEMGET 38

.heart_container_id
|098B94| db $26 ; ITEMGET 26

.bombos_id
|098B95| db $0F ; ITEMGET 0F

.crystal_id
|098B96| db $20 ; ITEMGET 20

;---------------------------------------------------------------------------------------------------

.fall_height
|098B97| db $60 ; ether
|098B98| db $80 ; green pendant
|098B99| db $80 ; red pendant
|098B9A| db $80 ; blue pendant
|098B9B| db $80 ; heart container
|098B9C| db $80 ; bombos
|098B9D| db $80 ; crystal

.fall_y
|098B9E| dw $0048 ; ether
|098BA0| dw $0078 ; green pendant
|098BA2| dw $0078 ; red pendant
|098BA4| dw $0078 ; blue pendant
|098BA6| dw $0078 ; heart container
|098BA8| dw $0068 ; bombos
|098BAA| dw $0078 ; crystal

.fall_x
|098BAC| dw $0078 ; ether
|098BAE| dw $0078 ; green pendant
|098BB0| dw $0078 ; red pendant
|098BB2| dw $0078 ; blue pendant
|098BB4| dw $0078 ; heart container
|098BB6| dw $0080 ; bombos
|098BB8| dw $0078 ; crystal

.fall_timer
|098BBA| db  64 ; ether
|098BBB| db   0 ; green pendant
|098BBC| db   0 ; red pendant
|098BBD| db   0 ; blue pendant
|098BBE| db   0 ; heart container
|098BBF| db $FF ; bombos
|098BC0| db   0 ; crystal

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_FallingPrize:
|098BC1| PHB
|098BC2| PHK
|098BC3| PLB

|098BC4| STX.w $02D8

|098BC7| JSR AddAncilla
|098BCA| BCS EXIT_098B8E

|098BCC| PHX

|098BCD| LDY.w $02D8

|098BD0| LDA.w .receipt_ids,Y
|098BD3| STA.w $0C5E,X

|098BD6| CMP.w .ether_id
|098BD9| BEQ .is_ether

|098BDB| CMP.w .bombos_id
|098BDE| BNE .not_medallion

.is_ether
|098BE0| TAY

|098BE1| LDA.w AncillaAdd_ItemReceipt.item_gfx_index,Y
|098BE4| STA.b $72

|098BE6| JSL WriteTo4BPPBuffer_item_gfx

;---------------------------------------------------------------------------------------------------

.not_medallion
|098BEA| PLX

|098BEB| LDA.b #$D0
|098BED| STA.w $0294,X

|098BF0| STZ.w $0C22,X
|098BF3| STZ.w $0C2C,X

|098BF6| STZ.w $0C54,X

|098BF9| LDY.w $02D8

|098BFC| LDA.w .fall_height,Y
|098BFF| STA.w $029E,X

|098C02| LDA.b #$09
|098C04| STA.w $03B1,X

|098C07| STZ.w $039F,X
|098C0A| STZ.w $0385,X

|098C0D| LDA.w .fall_timer,Y
|098C10| STA.w $0394,X

|098C13| LDA.w $0C5E,X
|098C16| STA.w $02D8

|098C19| CPY.b #$00
|098C1B| BEQ .was_medallion

|098C1D| CPY.b #$05
|098C1F| BEQ .was_medallion

|098C21| LDA.w $040C
|098C24| CMP.b #$14 ; DUNGEON 14
|098C26| BNE .not_hera

;---------------------------------------------------------------------------------------------------

.hera
|098C28| LDA.b $21
|098C2A| AND.b #$FE
|098C2C| INC A
|098C2D| STA.b $01
|098C2F| STZ.b $00

|098C31| LDA.b $23
|098C33| AND.b #$FE
|098C35| INC A
|098C36| STA.b $03
|098C38| STZ.b $02

|098C3A| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.not_hera
|098C3D| TYA
|098C3E| ASL A
|098C3F| TAY

|098C40| REP #$20

|098C42| LDA.w .fall_y,Y
|098C45| CLC
|098C46| ADC.b $E8
|098C48| STA.b $00

|098C4A| LDA.w .fall_x,Y
|098C4D| CLC
|098C4E| ADC.b $E2
|098C50| STA.b $02

|098C52| SEP #$20

|098C54| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.was_medallion
|098C57| TYA
|098C58| ASL A
|098C59| TAY

|098C5A| REP #$20

|098C5C| LDA.w .fall_y,Y
|098C5F| CLC
|098C60| ADC.b $E8
|098C62| STA.b $00

|098C64| LDA.b $22
|098C66| CLC
|098C67| ADC.w #$0000
|098C6A| STA.b $02

|098C6C| SEP #$20

|098C6E| BRL SetAncillaCoordinatesAndExit

;===================================================================================================

UNREACHABLE_098C71:
|098C71| PLB

|098C72| RTL

;===================================================================================================

AncillaAdd_DugUpFlute:
|098C73| PHB
|098C74| PHK
|098C75| PLB

|098C76| JSR AddAncilla
|098C79| BCS .exit

|098C7B| STZ.w $0C54,X
|098C7E| STZ.w $029E,X

|098C81| LDA.l FluteBounce
|098C85| STA.w $0294,X

|098C88| LDY.b #$08
|098C8A| LDA.b $2F

|098C8C| CMP.b #$04
|098C8E| BNE .not_facing_left

|098C90| LDY.b #$F8

.not_facing_left
|098C92| TYA
|098C93| STA.w $0C2C,X

|098C96| PHX

|098C97| LDA.b #$0C
|098C99| JSL WriteTo4BPPBuffer_item_gfx

|098C9D| PLX

|098C9E| REP #$20

|098CA0| LDA.w #$0A8A
|098CA3| STA.b $00

|098CA5| LDA.w #$0490
|098CA8| STA.b $02

|098CAA| SEP #$20

|098CAC| BRL SetAncillaCoordinatesAndExit

.exit
|098CAF| PLB

|098CB0| RTL

;===================================================================================================

AncillaAdd_ChargedSpinAttackSparkle:
|098CB1| PHB
|098CB2| PHK
|098CB3| PLB

|098CB4| LDX.b #$09

.next_slot
|098CB6| LDA.w $0C4A,X
|098CB9| BEQ .free_slot

|098CBB| CMP.b #$3C ; ANCILLA 3C
|098CBD| BEQ .free_slot

|098CBF| DEX
|098CC0| BPL .next_slot

|098CC2| BRA .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|098CC4| LDA.b #$0D ; ANCILLA 0D
|098CC6| STA.w $0C4A,X

|098CC9| LDA.b $EE
|098CCB| STA.w $0C7C,X

|098CCE| LDA.b #$06
|098CD0| STA.w $0C68,X

.exit
|098CD3| PLB

|098CD4| RTL

;===================================================================================================

pool AncillaAdd_ExplodingWeatherVane

.speed_x
|098CD5| db   8,  10,   9,   4
|098CD9| db  11,  12, -10,  -8
|098CDD| db   4,  -6, -10,  -4

.speed_z
|098CE1| db  20,  22,  20,  20
|098CE5| db  22,  20,  20,  22
|098CE9| db  20,  22,  20,  20

;---------------------------------------------------------------------------------------------------

.position_y
|098CED| db $B0, $A3, $A0, $A2
|098CF1| db $A0, $A8, $A0, $A0
|098CF5| db $A8, $A1, $B0, $A0

.position_x
|098CF9| db $00, $02, $04, $06
|098CFD| db $03, $08, $0E, $08
|098D01| db $0C, $07, $0A, $08

.position_z
|098D05| db $30, $12, $20, $14
|098D09| db $16, $18, $20, $14
|098D0D| db $18, $16, $14, $20

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_ExplodingWeatherVane:
|098D11| PHB
|098D12| PHK
|098D13| PLB

|098D14| JSR AddAncilla
|098D17| BCS .exit

|098D19| LDA.b #$0A
|098D1B| STA.w $03B1,X

|098D1E| LDA.b #$80
|098D20| STA.w $0394,X

|098D23| STZ.w $0C54,X
|098D26| STZ.w $039F,X

|098D29| STZ.w $012E

|098D2C| LDA.b #$F2 ; SONG F2 - half volume
|098D2E| STA.w $012C

|098D31| LDA.b #$17 ; SFX1.17
|098D33| STA.w $012D

|098D36| LDA.b #$00
|098D38| STA.l $7F58B8

|098D3C| REP #$20

|098D3E| LDA.w #$0280
|098D41| STA.l $7F58B6

;---------------------------------------------------------------------------------------------------

|098D45| SEP #$20

|098D47| LDX.b #$0B

.next
|098D49| LDA.b #$00
|098D4B| STA.l $7F5800,X

|098D4F| LDA.w .speed_x,X
|098D52| STA.l $7F580C,X

|098D56| LDA.w .speed_z,X
|098D59| STA.l $7F5818,X

|098D5D| LDA.w .position_y,X
|098D60| STA.l $7F5824,X

|098D64| LDA.b #$07
|098D66| STA.l $7F5830,X

|098D6A| LDA.w .position_x,X
|098D6D| STA.l $7F583C,X

|098D71| LDA.b #$02
|098D73| STA.l $7F5848,X

|098D77| LDA.w .position_z,X
|098D7A| STA.l $7F5854,X

|098D7E| LDA.b #$01
|098D80| STA.l $7F5860,X

|098D84| TXA
|098D85| AND.b #$01
|098D87| STA.l $7F586C,X

|098D8B| DEX
|098D8C| BPL .next

;---------------------------------------------------------------------------------------------------

.exit
|098D8E| PLB

|098D8F| RTL

;===================================================================================================

AncillaAdd_CutsceneDuck:
|098D90| PHB
|098D91| PHK
|098D92| PLB

|098D93| JSR CheckAncillaPresence
|098D96| BCS .exit

|098D98| JSR AddAncilla
|098D9B| BCS .exit

|098D9D| LDA.b #$02
|098D9F| STA.w $0C72,X

|098DA2| INC A
|098DA3| STA.w $039F,X

|098DA6| STZ.w $0C54,X

|098DA9| LDA.b #$20
|098DAB| STA.w $03B1,X

|098DAE| LDA.b #$74
|098DB0| STA.w $0C5E,X

|098DB3| STZ.w $0294,X
|098DB6| STZ.w $0385,X
|098DB9| STZ.w $029E,X
|098DBC| STZ.w $03A9,X

|098DBF| REP #$20
|098DC1| LDA.w #$0788
|098DC4| STA.b $00

|098DC6| LDA.w #$0200
|098DC9| STA.b $02

|098DCB| SEP #$20

|098DCD| BRL SetAncillaCoordinatesAndExit

.exit
|098DD0| PLB

|098DD1| RTL

;===================================================================================================

AncillaAdd_SomariaPlatformPoof:
|098DD2| LDA.b #$39 ; ANCILLA 39
|098DD4| STA.w $0C4A,X

|098DD7| LDA.b #$07
|098DD9| STA.w $03B1,X

|098DDC| PHX
|098DDD| PHY

|098DDE| LDY.b #$0F

.next_slot
|098DE0| LDA.w $0E20,Y
|098DE3| CMP.b #$ED ; SPRITE ED
|098DE5| BNE .not_platform

|098DE7| LDA.b #$00
|098DE9| STA.w $0DD0,Y

|098DEC| STA.w $02F5

.not_platform
|098DEF| DEY
|098DF0| BPL .next_slot

|098DF2| JSL TileDetect_BigArea_long

|098DF6| PLY
|098DF7| PLX

|098DF8| RTL

;===================================================================================================

AncillaAdd_SuperBombExplosion:
|098DF9| PHB
|098DFA| PHK
|098DFB| PLB

|098DFC| JSR AddAncilla
|098DFF| BCC .free_slot

|098E01| BRL .exit

.free_slot
|098E04| STZ.w $03EA,X
|098E07| STZ.w $0C54,X

|098E0A| STZ.w $03C2,X
|098E0D| STZ.w $0385,X

|098E10| LDA.l BombTimers+1
|098E14| STA.w $039F,X

|098E17| LDA.b #$01
|098E19| STA.w $0C5E,X

|098E1C| PHX

|098E1D| LDX.w $02CF

|098E20| LDA.w $1A00,X
|098E23| STA.b $00

|098E25| LDA.w $1A14,X
|098E28| STA.b $01

|098E2A| LDA.w $1A28,X
|098E2D| STA.b $02

|098E2F| LDA.w $1A3C,X
|098E32| STA.b $03

|098E34| PLX

|098E35| REP #$20

|098E37| LDA.b $00
|098E39| CLC
|098E3A| ADC.w #$0010
|098E3D| STA.b $00

|098E3F| LDA.b $02
|098E41| CLC
|098E42| ADC.w #$0008
|098E45| STA.b $02

|098E47| SEP #$20

|098E49| BRL SetAncillaCoordinatesAndExit

.exit
|098E4C| PLB

|098E4D| RTL

;===================================================================================================

ConfigureRevivalAncillae:
|098E4E| PHB
|098E4F| PHK
|098E50| PLB

|098E51| LDA.b #$50
|098E53| STA.w $0109

|098E56| LDX.b #$00

|098E58| LDA.b #$40
|098E5A| STA.w $039F,X

|098E5D| STZ.w $0C54,X

|098E60| LDA.b #$08
|098E62| STA.w $0294,X

|098E65| STZ.w $0385,X

|098E68| LDA.b #$05
|098E6A| STA.w $0394,X

|098E6D| STZ.w $0C5E,X
|098E70| STZ.w $0380,X

|098E73| REP #$20

|098E75| LDA.b $20
|098E77| STA.b $00

|098E79| LDA.b $22
|098E7B| STA.b $02

|098E7D| SEP #$20

|098E7F| JSR SetAncillaCoordinates

|098E82| STZ.w $029E,X

|098E85| INX

|098E86| STZ.w $029E,X

|098E89| LDA.b #$F0
|098E8B| STA.w $039F,X

|098E8E| STZ.w $0C54,X
|098E91| STZ.w $0380,X

|098E94| INX

|098E95| LDA.b #$02
|098E97| STA.w $0C5E,X
|098E9A| STA.b $00

|098E9C| INC A
|098E9D| STA.w $03B1,X

|098EA0| LDA.b #$08
|098EA2| STA.w $039F,X

|098EA5| STZ.w $0C54,X

;---------------------------------------------------------------------------------------------------

|098EA8| PHX

|098EA9| LDA.b #$03
|098EAB| STA.w $0C72,X

|098EAE| TAX

|098EAF| LDA.l PowderDraw.group_offset,X
|098EB3| CLC
|098EB4| ADC.b $00
|098EB6| TAX

|098EB7| LDA.l PowderDraw.anim_step,X

|098EBB| PLX

|098EBC| STA.w $03C2,X

|098EBF| LDY.b #$06

|098EC1| REP #$20

|098EC3| LDA.b $20
|098EC5| CLC
|098EC6| ADC.w AncillaAdd_MagicPowder.offset_y,Y
|098EC9| CLC
|098ECA| ADC.w #$FFEC
|098ECD| STA.b $00

|098ECF| LDA.b $22
|098ED1| CLC
|098ED2| ADC.w #$FFF8
|098ED5| CLC
|098ED6| ADC.w AncillaAdd_MagicPowder.offset_x,Y
|098ED9| STA.b $02

|098EDB| SEP #$20

|098EDD| BRL SetAncillaCoordinatesAndExit

;===================================================================================================

AncillaAdd_CaneOfByrnaInitSpark:
|098EE0| PHB
|098EE1| PHK
|098EE2| PLB

|098EE3| PHA

;---------------------------------------------------------------------------------------------------

|098EE4| LDX.b #$04

.next_clear
|098EE6| LDA.w $0C4A,X
|098EE9| CMP.b #$31 ; ANCILLA 31
|098EEB| BNE .not_spark

|098EED| STZ.w $0C4A,X

.not_spark
|098EF0| DEX
|098EF1| BPL .next_clear

;---------------------------------------------------------------------------------------------------

|098EF3| PLA
|098EF4| JSR AddAncilla
|098EF7| BCS .exit

|098EF9| STZ.w $0C5E,X

|098EFC| LDA.b #$09
|098EFE| STA.w $03B1,X

|098F01| LDA.b #$01
|098F03| STA.w $037B

|098F06| INC A
|098F07| STA.w $039F,X

.exit
|098F0A| PLB

|098F0B| RTL

;===================================================================================================

pool AncillaAdd_LampFlame

.offset_y
|098F0C| dw -16 ; up
|098F0E| dw  24 ; down
|098F10| dw   4 ; left
|098F12| dw   4 ; right

.offset_x
|098F14| dw   0 ; up
|098F16| dw   0 ; down
|098F18| dw -20 ; left
|098F1A| dw  18 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_LampFlame:
|098F1C| PHB
|098F1D| PHK
|098F1E| PLB

|098F1F| JSR AddAncilla
|098F22| BCS .exit

|098F24| STZ.w $0C5E,X
|098F27| STZ.w $03B1,X

|098F2A| LDA.b #$17
|098F2C| STA.w $0C68,X

|098F2F| LDA.b $2F
|098F31| LSR A
|098F32| STA.w $0C72,X

|098F35| LDY.b $2F

|098F37| REP #$20

|098F39| LDA.b $20
|098F3B| CLC
|098F3C| ADC.w .offset_y,Y
|098F3F| STA.b $00

|098F41| LDA.b $22
|098F43| CLC
|098F44| ADC.w .offset_x,Y
|098F47| STA.b $02

|098F49| SEP #$20

|098F4B| JSR SetAncillaCoordinates
|098F4E| JSL CalculateAncillaSFXPan

|098F52| ORA.b #$2A ; SFX2.2A
|098F54| STA.w $012E

|098F57| PLB

|098F58| RTL

.exit
|098F59| PLB

|098F5A| RTL

;===================================================================================================

AncillaAdd_ShovelDirt:
|098F5B| PHB
|098F5C| PHK
|098F5D| PLB

|098F5E| JSR AddAncilla
|098F61| BCS .exit

|098F63| STZ.w $0C5E,X

|098F66| LDA.b #$14
|098F68| STA.w $0C68,X

|098F6B| REP #$20

|098F6D| LDA.b $20
|098F6F| STA.b $00

|098F71| LDA.b $22
|098F73| STA.b $02

|098F75| SEP #$20

|098F77| BRL SetAncillaCoordinatesAndExit

.exit
|098F7A| PLB

|098F7B| RTL

;===================================================================================================

AncillaAdd_MasterSwordCutscene:
|098F7C| PHB
|098F7D| PHK
|098F7E| PLB

|098F7F| JSR AddAncilla
|098F82| BCS .exit

|098F84| STZ.w $0C5E,X

|098F87| LDA.b #$02
|098F89| STA.w $03B1,X

|098F8C| LDA.b #$40
|098F8E| STA.w $0C68,X

|098F91| REP #$20

|098F93| LDA.b $20
|098F95| CLC
|098F96| ADC.w #$FFF8
|098F99| STA.b $00

|098F9B| LDA.b $22
|098F9D| CLC
|098F9E| ADC.w #$0008
|098FA1| STA.b $02

|098FA3| SEP #$20

|098FA5| BRL SetAncillaCoordinatesAndExit

.exit
|098FA8| PLB

|098FA9| RTL

;===================================================================================================

pool AncillaAdd_DashDust

.offset_y
|098FAA| dw $14 ; up
|098FAC| dw $04 ; down
|098FAE| dw $10 ; left
|098FB0| dw $10 ; right

.offset_x
|098FB2| dw $04 ; up
|098FB4| dw $04 ; down
|098FB6| dw $06 ; left
|098FB8| dw $00 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_DashDust:
|098FBA| PHB
|098FBB| PHK
|098FBC| PLB

|098FBD| LDX.b #$01
|098FBF| BRA .continue

;---------------------------------------------------------------------------------------------------

#AncillaAdd_DashDust_charging:
|098FC1| PHB
|098FC2| PHK
|098FC3| PLB

|098FC4| LDX.b #$00

.continue
|098FC6| STX.b $72

|098FC8| JSR AddAncilla
|098FCB| BCS .exit

|098FCD| LDA.b $72
|098FCF| STA.w $0C54,X

|098FD2| STZ.w $0C5E,X

|098FD5| LDA.b #$03
|098FD7| STA.w $0C68,X

|098FDA| LDY.b $2F
|098FDC| TYA
|098FDD| LSR A
|098FDE| STA.w $0C72,X

|098FE1| LDA.b $72
|098FE3| BNE .mobile

;---------------------------------------------------------------------------------------------------

.immobile
|098FE5| REP #$20

|098FE7| LDA.b $20
|098FE9| CLC
|098FEA| ADC.w #$0014
|098FED| STA.b $00

|098FEF| LDA.b $22
|098FF1| STA.b $02

|098FF3| SEP #$20

|098FF5| JMP.w SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.mobile
|098FF8| REP #$20

|098FFA| LDA.b $20
|098FFC| CLC
|098FFD| ADC.w .offset_y,Y
|099000| STA.b $00

|099002| LDA.b $22
|099004| CLC
|099005| ADC.w .offset_x,Y
|099008| STA.b $02

|09900A| SEP #$20

|09900C| JMP.w SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|09900F| PLB

|099010| RTL

;===================================================================================================

pool AncillaAdd_BlastWallFireball

.speed
|099011| db -64,   0
|099013| db -22,  42
|099015| db -38,  38
|099017| db -42,  22
|099019| db   0,  64
|09901B| db  22,  42
|09901D| db  38,  38
|09901F| db  42,  22
|099021| db  64,   0
|099023| db  22, -42
|099025| db  38, -38
|099027| db  42, -22
|099029| db   0, -64
|09902B| db -22, -42
|09902D| db -38, -38
|09902F| db -42, -22

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_BlastWallFireball:
|099031| PHB
|099032| PHK
|099033| PLB

|099034| LDX.b #$0A

.check_next
|099036| LDA.w $0C4A,X
|099039| BEQ .free_slot

|09903B| DEX
|09903C| CPX.b #$04
|09903E| BNE .check_next

|099040| LDX.b #$FF

|099042| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|099045| LDA.b #$32 ; ANCILLA 32
|099047| STA.w $0C4A,X

|09904A| LDA.b $EE
|09904C| STA.w $0C7C,X

|09904F| LDA.b #$10
|099051| STA.l $7F0040,X

|099055| LDA.b $1A
|099057| AND.b #$0F
|099059| ASL A
|09905A| TAY

|09905B| LDA.w .speed+0,Y
|09905E| STA.w $0C22,X

|099061| LDA.w .speed+1,Y
|099064| STA.w $0C2C,X

|099067| REP #$20

|099069| PHX

|09906A| LDX.b $04

|09906C| LDA.l $7F0020,X
|099070| CLC
|099071| ADC.w #$0008
|099074| STA.b $00

|099076| LDA.l $7F0030,X
|09907A| CLC
|09907B| ADC.w #$0010
|09907E| STA.b $02

|099080| PLX

|099081| SEP #$20

|099083| BRL SetAncillaCoordinatesAndExit

.exit
|099086| PLB

|099087| RTL

;===================================================================================================

pool AncillaAdd_Arrow

.speed_y
|099088| db -48 ; up
|099089| db  48 ; down
|09908A| db   0 ; left
|09908B| db   0 ; right

.speed_x
|09908C| db   0 ; up
|09908D| db   0 ; down
|09908E| db -48 ; left
|09908F| db  48 ; right

.unused
|099090| db $08 ; up
|099091| db $04 ; down
|099092| db $02 ; left
|099093| db $01 ; right

.offset_y
|099094| dw  -4 ; up
|099096| dw   3 ; down
|099098| dw   4 ; left
|09909A| dw   4 ; right

.offset_x
|09909C| dw   4 ; up
|09909E| dw   4 ; down
|0990A0| dw   0 ; left
|0990A2| dw   4 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_Arrow:
|0990A4| PHB
|0990A5| PHK
|0990A6| PLB

|0990A7| STX.b $76

|0990A9| JSR CheckAncillaPresence
|0990AC| BCC .none_exist

|0990AE| BRL .exit

.none_exist
|0990B1| JSR FindArrowAncillaSlot
|0990B4| BCC .free_slot

|0990B6| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|0990B9| JSL CalculateLinkSFXPan
|0990BD| ORA.b #$07 ; SFX2.07
|0990BF| STA.w $012E

|0990C2| STZ.w $03C5,X

|0990C5| LDA.b #$08
|0990C7| STA.w $0C5E,X

|0990CA| LDA.b $76
|0990CC| LSR A
|0990CD| TAY

|0990CE| ORA.b #$04
|0990D0| STA.w $0C72,X

|0990D3| LDA.w .speed_y,Y
|0990D6| STA.w $0C22,X

|0990D9| LDA.w .speed_x,Y
|0990DC| STA.w $0C2C,X

|0990DF| LDY.b $76

|0990E1| REP #$20

|0990E3| LDA.b $72
|0990E5| CLC
|0990E6| ADC.w #$0008
|0990E9| CLC
|0990EA| ADC.w .offset_y,Y
|0990ED| STA.b $00

|0990EF| LDA.b $74
|0990F1| CLC
|0990F2| ADC.w .offset_x,Y
|0990F5| STA.b $02

|0990F7| SEP #$20

|0990F9| JSR SetAncillaCoordinates

|0990FC| SEC

|0990FD| PLB

|0990FE| RTL

;---------------------------------------------------------------------------------------------------

.exit
|0990FF| CLC

|099100| PLB

|099101| RTL

;===================================================================================================

AncillaAdd_BunnyPoof:
|099102| PHB
|099103| PHK
|099104| PLB

|099105| JSR AddAncilla
|099108| BCS EXIT_09915D

|09910A| LDA.b #$0C
|09910C| STA.b $4B

|09910E| STZ.w $0C54,X

|099111| LDA.w $02E0
|099114| BNE .bunny

|099116| JSL CalculateLinkSFXPan
|09911A| ORA.b #$14 ; SFX2.14
|09911C| STA.w $012E

|09911F| BRA .proceed

.bunny
|099121| JSL CalculateLinkSFXPan
|099125| ORA.b #$15 ; SFX2.15
|099127| STA.w $012E

.proceed
|09912A| BRA AncillaAdd_ArbitraryPoof

;===================================================================================================

AncillaAdd_CapePoof:
|09912C| PHB
|09912D| PHK
|09912E| PLB

|09912F| JSR AddAncilla
|099132| BCS EXIT_09915D

|099134| LDA.b #$01
|099136| STA.w $0C54,X
|099139| STA.w $02E1

|09913C| TSB.b $50

|09913E| STZ.b $67
|099140| STZ.b $26

;===================================================================================================

AncillaAdd_ArbitraryPoof:
|099142| STZ.w $0C5E,X

|099145| LDA.b #$07
|099147| STA.w $03B1,X

|09914A| REP #$20

|09914C| LDA.b $20
|09914E| CLC
|09914F| ADC.w #$0004
|099152| STA.b $00

|099154| LDA.b $22
|099156| STA.b $02

|099158| SEP #$20

|09915A| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_09915D:
|09915D| PLB

|09915E| RTL

;===================================================================================================

AncillaAdd_DwarfPoof:
|09915F| PHB
|099160| PHK
|099161| PLB

|099162| JSR AddAncilla
|099165| BCS .exit

|099167| LDA.l $7EF3CC
|09916B| CMP.b #$08 ; FOLLOWER 08
|09916D| BNE .not_dwarf

|09916F| JSL CalculateLinkSFXPan
|099173| ORA.b #$14 ; SFX2.14
|099175| STA.w $012E

|099178| BRA .continue

.not_dwarf
|09917A| JSL CalculateLinkSFXPan
|09917E| ORA.b #$15 ; SFX2.15
|099180| STA.w $012E

;---------------------------------------------------------------------------------------------------

.continue
|099183| STZ.w $0C5E,X
|099186| STZ.w $0C54,X

|099189| LDA.b #$07
|09918B| STA.w $03B1,X

|09918E| LDA.b #$01
|099190| STA.w $02F9

|099193| LDY.w $02CF

|099196| LDA.w $1A00,Y
|099199| STA.b $00

|09919B| LDA.w $1A14,Y
|09919E| STA.b $01

|0991A0| LDA.w $1A28,Y
|0991A3| STA.b $02

|0991A5| LDA.w $1A3C,Y
|0991A8| STA.b $03

|0991AA| REP #$20

|0991AC| LDA.b $00
|0991AE| CLC
|0991AF| ADC.w #$0004
|0991B2| STA.b $00

|0991B4| LDA.b $02
|0991B6| CLC
|0991B7| ADC.w #$0000
|0991BA| STA.b $02

|0991BC| SEP #$20

|0991BE| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|0991C1| PLB

|0991C2| RTL

;===================================================================================================

AncillaAdd_BushPoof:
|0991C3| PHB
|0991C4| PHK
|0991C5| PLB

|0991C6| LDA.w $0301
|0991C9| AND.b #$40
|0991CB| BEQ .exit

|0991CD| LDY.b #$04
|0991CF| LDA.b #$3F ; ANCILLA 3F
|0991D1| JSR AddAncilla
|0991D4| BCS .exit

|0991D6| STZ.w $0C5E,X

|0991D9| LDA.b #$07
|0991DB| STA.w $0C68,X

|0991DE| JSL CalculateLinkSFXPan
|0991E2| ORA.b #$15 ; SFX2.15
|0991E4| STA.w $012E

|0991E7| REP #$20

|0991E9| LDA.b $74
|0991EB| CLC
|0991EC| ADC.w #$FFFE
|0991EF| STA.b $00

|0991F1| LDA.b $72
|0991F3| STA.b $02

|0991F5| SEP #$20

|0991F7| JMP.w SetAncillaCoordinatesAndExit

.exit
|0991FA| PLB

|0991FB| RTL

;===================================================================================================

AncillaAdd_EtherSpell:
|0991FC| PHB
|0991FD| PHK
|0991FE| PLB

|0991FF| JSR AddAncilla
|099202| BCC .free_slot

|099204| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|099207| STZ.w $0C5E,X

|09920A| STZ.w $03C2,X

|09920D| STZ.w $0C54,X

|099210| LDA.b #$01
|099212| STA.w $0112

|099215| INC A
|099216| STA.w $03B1,X

|099219| INC A
|09921A| STA.w $039F,X

|09921D| LDA.b #$7F
|09921F| STA.w $0C22,X

|099222| LDA.b #$28
|099224| STA.l $7F5808

|099228| LDA.b #$09
|09922A| STA.w $0AAA

|09922D| LDA.b #$40
|09922F| STA.l $7F5812

|099233| JSL CalculateLinkSFXPan
|099237| ORA.b #$26 ; SFX3.26
|099239| STA.w $012F

|09923C| LDA.b #$00
|09923E| STA.l $7F5800

|099242| LDA.b #$08
|099244| STA.l $7F5801

|099248| LDA.b #$10
|09924A| STA.l $7F5802

|09924E| LDA.b #$18
|099250| STA.l $7F5803

|099254| LDA.b #$20
|099256| STA.l $7F5804

|09925A| LDA.b #$28
|09925C| STA.l $7F5805

|099260| LDA.b #$30
|099262| STA.l $7F5806

|099266| LDA.b #$38
|099268| STA.l $7F5807

;---------------------------------------------------------------------------------------------------

|09926C| REP #$20

|09926E| LDA.b $20
|099270| STA.l $7F5813

|099274| LDA.w #$FFF0
|099277| CLC
|099278| ADC.b $E8
|09927A| STA.b $00

|09927C| AND.w #$00F0
|09927F| STA.l $7F580C

|099283| LDA.b $22
|099285| STA.b $02
|099287| STA.l $7F5815

|09928B| CLC
|09928C| ADC.w #$0008
|09928F| STA.l $7F580E

|099293| LDA.b $20
|099295| SEC
|099296| SBC.w #$0010
|099299| STA.l $7F580A

|09929D| CLC
|09929E| ADC.w #$0024
|0992A1| STA.l $7F5810

|0992A5| SEP #$20

|0992A7| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|0992AA| PLB

|0992AB| RTL

;===================================================================================================

AncillaAdd_SwordUpSparkle:
|0992AC| PHB
|0992AD| PHK
|0992AE| PLB

|0992AF| LDA.l $7EF359
|0992B3| INC A
|0992B4| AND.b #$FE
|0992B6| BEQ .exit

|0992B8| LDY.b #$00
|0992BA| LDA.b #$3B ; ANCILLA 3B
|0992BC| JSR AddAncilla
|0992BF| BCS .exit

|0992C1| STZ.w $0C5E,X

|0992C4| LDA.b #$01
|0992C6| STA.w $039F,X

|0992C9| LDA.b #$22
|0992CB| STA.w $03B1,X

.exit
|0992CE| PLB

|0992CF| RTL

;===================================================================================================

pool AncillaAdd_MagicPowder

.offset_y
|0992D0| dw   1 ; up
|0992D2| dw  40 ; down
|0992D4| dw  22 ; left
|0992D6| dw  22 ; right

.offset_x
|0992D8| dw  10 ; up
|0992DA| dw  10 ; down
|0992DC| dw  -8 ; left
|0992DE| dw  28 ; right

.tile_check_offset_y
|0992E0| dw   0 ; up
|0992E2| dw  20 ; down
|0992E4| dw  16 ; left
|0992E6| dw  16 ; right

.tile_check_offset_x
|0992E8| dw  -2 ; up
|0992EA| dw  -2 ; down
|0992EC| dw -12 ; left
|0992EE| dw  12 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_MagicPowder:
|0992F0| PHB
|0992F1| PHK
|0992F2| PLB

|0992F3| JSR AddAncilla
|0992F6| BCC .free_slot

|0992F8| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|0992FB| STZ.w $0C5E,X
|0992FE| STZ.w $029E,X

|099301| LDA.b #$01
|099303| STA.w $03B1,X

|099306| LDA.b #$50
|099308| STA.w $0109

|09930B| PHX

|09930C| LDY.b $2F

|09930E| TYA
|09930F| LSR A
|099310| STA.w $0C72,X

|099313| TAX

|099314| LDA.l PowderDraw.group_offset,X
|099318| TAX

|099319| LDA.l PowderDraw.anim_step,X

|09931D| PLX

|09931E| STA.w $03C2,X

;---------------------------------------------------------------------------------------------------

|099321| LDY.b $2F

|099323| REP #$20

|099325| LDA.b $20
|099327| CLC
|099328| ADC.w .tile_check_offset_y,Y
|09932B| STA.b $04

|09932D| LDA.b $22
|09932F| CLC
|099330| ADC.w .tile_check_offset_x,Y
|099333| STA.b $06

|099335| SEP #$20

|099337| LDA.b $04
|099339| STA.w $0BFA,X

|09933C| LDA.b $05
|09933E| STA.w $0C0E,X

|099341| LDA.b $06
|099343| STA.w $0C04,X

|099346| LDA.b $07
|099348| STA.w $0C18,X

|09934B| JSL Ancilla_CheckTileCollision_long

|09934F| LDA.w $03E4,X
|099352| STA.w $0333

;---------------------------------------------------------------------------------------------------

|099355| LDA.w $0304
|099358| CMP.b #$09
|09935A| BNE .not_lamp

|09935C| STZ.w $0C4A,X

|09935F| BRA .exit

.not_lamp
|099361| LDY.b $2F

|099363| REP #$20

|099365| LDA.b $20
|099367| CLC
|099368| ADC.w .offset_y,Y
|09936B| STA.b $00

|09936D| LDA.b $22
|09936F| CLC
|099370| ADC.w .offset_x,Y
|099373| STA.b $02

|099375| SEP #$20

|099377| JSL CalculateLinkSFXPan
|09937B| ORA.b #$0D ; SFX2.0D
|09937D| STA.w $012E

|099380| JMP.w SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|099383| PLB

|099384| RTL

;===================================================================================================

pool AncillaAdd_WallTapSpark

.offset_y
|099385| dw  -4 ; up
|099387| dw  32 ; down
|099389| dw  17 ; left
|09938B| dw  17 ; right

.offset_x
|09938D| dw  11 ; up
|09938F| dw  10 ; down
|099391| dw -12 ; left
|099393| dw  29 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_WallTapSpark:
|099395| PHB
|099396| PHK
|099397| PLB

|099398| JSR AddAncilla
|09939B| BCS .exit

|09939D| LDA.b #$05
|09939F| STA.w $0C5E,X

|0993A2| LDA.b #$01
|0993A4| STA.w $03B1,X

|0993A7| LDY.b $2F

|0993A9| REP #$20

|0993AB| LDA.b $20
|0993AD| CLC
|0993AE| ADC.w .offset_y,Y
|0993B1| STA.b $00

|0993B3| LDA.b $22
|0993B5| CLC
|0993B6| ADC.w .offset_x,Y
|0993B9| STA.b $02

|0993BB| SEP #$20

|0993BD| BRL SetAncillaCoordinatesAndExit

.exit
|0993C0| PLB

|0993C1| RTL

;===================================================================================================

AncillaAdd_SwordSwingSparkle:
|0993C2| PHB
|0993C3| PHK
|0993C4| PLB

|0993C5| JSR AddAncilla
|0993C8| BCS .exit

|0993CA| STZ.w $0C5E,X

|0993CD| LDA.b #$01
|0993CF| STA.w $03B1,X

|0993D2| LDA.b $2F
|0993D4| LSR A
|0993D5| STA.w $0C72,X

|0993D8| REP #$20

|0993DA| LDA.b $20
|0993DC| STA.b $00

|0993DE| LDA.b $22
|0993E0| STA.b $02

|0993E2| SEP #$20

|0993E4| BRL SetAncillaCoordinatesAndExit

.exit
|0993E7| PLB

|0993E8| RTL

;===================================================================================================

pool AncillaAdd_DashTremor

.directional_data_offset
|0993E9| db $02 ; up
|0993EA| db $02 ; down
|0993EB| db $00 ; left
|0993EC| db $00 ; right

.offset
|0993ED| dw   3 ; vertical
|0993EF| dw  -3 ; horizontal

.threshold
|0993F1| db $80 ; vertical
|0993F2| db $78 ; horizontal

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_DashTremor:
|0993F3| PHB
|0993F4| PHK
|0993F5| PLB

|0993F6| JSR CheckAncillaPresence
|0993F9| BCS .exit

|0993FB| JSR AddAncilla
|0993FE| BCS .exit

|099400| LDA.b #$10
|099402| STA.w $0C5E,X

|099405| STZ.w $0385,X

|099408| LDA.b $2F
|09940A| LSR A
|09940B| TAY

|09940C| LDA.w .directional_data_offset,Y
|09940F| STA.w $0C72,X

|099412| TAY

|099413| REP #$20

|099415| LDA.b $20
|099417| SEC
|099418| SBC.b $E8
|09941A| STA.b $02

|09941C| LDA.b $22
|09941E| SEC
|09941F| SBC.b $E2
|099421| STA.b $00

|099423| SEP #$20

|099425| PHX

|099426| TYA
|099427| LSR A
|099428| TAX

|099429| LDA.w .threshold,X
|09942C| STA.b $06

|09942E| TYX

|09942F| LDY.b #$00

|099431| LDA.b $00,X
|099433| CMP.b $06
|099435| BCC .left_or_up

|099437| LDY.b #$02

.left_or_up
|099439| PLX

|09943A| LDA.w .offset+0,Y
|09943D| STA.w $0BFA,X

|099440| LDA.w .offset+1,Y
|099443| STA.w $0C0E,X

.exit
|099446| PLB

|099447| RTL

;===================================================================================================

pool WallClink

.offset_y
|099448| dw   0,   8,   8,   8
|099450| dw   4,   8,  12,   8

.offset_x
|099458| dw   8,   8,   0,  10
|099460| dw  12,   8,   4,   0

.offset_index
|099468| db $00, $06, $04, $00
|09946C| db $02, $0A, $0C, $00
|099470| db $00, $08, $0E, $00
|099474| db $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_BoomerangWallClink:
|099478| PHB
|099479| PHK
|09947A| PLB

|09947B| LDA.w $0BFA,X
|09947E| STA.w $0399

|099481| LDA.w $0C0E,X
|099484| STA.w $039A

|099487| LDA.w $0C04,X
|09948A| STA.w $039B

|09948D| LDA.w $0C18,X
|099490| STA.w $039C

;---------------------------------------------------------------------------------------------------

|099493| LDY.b #$01
|099495| LDA.b #$06 ; ANCILLA 06
|099497| JSR AddAncilla
|09949A| BCS EXIT_0994C4

|09949C| STZ.w $0C5E,X

|09949F| LDA.b #$01
|0994A1| STA.w $039F,X

|0994A4| LDY.w $039D

|0994A7| LDA.w WallClink.offset_index,Y
|0994AA| TAY

|0994AB| REP #$20

|0994AD| LDA.w $0399
|0994B0| CLC
|0994B1| ADC.w WallClink.offset_y,Y
|0994B4| STA.b $00

|0994B6| LDA.w $039B
|0994B9| CLC
|0994BA| ADC.w WallClink.offset_x,Y
|0994BD| STA.b $02

|0994BF| SEP #$20

|0994C1| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_0994C4:
|0994C4| PLB

|0994C5| RTL

;===================================================================================================

AncillaAdd_HookshotWallClink:
|0994C6| PHB
|0994C7| PHK
|0994C8| PLB

|0994C9| STX.b $74

|0994CB| JSR AddAncilla
|0994CE| BCS EXIT_0994C4

;---------------------------------------------------------------------------------------------------

|0994D0| STZ.w $0C5E,X

|0994D3| LDA.b #$01
|0994D5| STA.w $039F,X

|0994D8| PHX

|0994D9| LDX.b $74
|0994DB| JSR CopyAncillaCoordinates

|0994DE| LDA.w $0C72,X
|0994E1| ASL A
|0994E2| TAY

|0994E3| REP #$20

|0994E5| LDA.b $00
|0994E7| CLC
|0994E8| ADC.w WallClink.offset_y,Y
|0994EB| STA.b $00

|0994ED| LDA.b $02
|0994EF| CLC
|0994F0| ADC.w WallClink.offset_x,Y
|0994F3| STA.b $02

|0994F5| SEP #$20

|0994F7| PLX

|0994F8| BRL SetAncillaCoordinatesAndExit

;===================================================================================================

#EXIT_099587_bounce:
|0994FB| BRL EXIT_099587

;===================================================================================================

AncillaAdd_Duck_take_off:
|0994FE| PHB
|0994FF| PHK
|099500| PLB

|099501| JSR CheckAncillaPresence
|099504| BCS EXIT_099587_bounce

|099506| JSR AddAncilla
|099509| BCS EXIT_099587_bounce

;---------------------------------------------------------------------------------------------------

|09950B| LDA.b #$78
|09950D| STA.w $0C68,X

|099510| STZ.w $0385,X
|099513| STZ.w $0294,X
|099516| STZ.w $029E,X

|099519| LDY.b #$00

|09951B| BRA AncillaAdd_ArbitraryDuck

;===================================================================================================

AncillaAdd_Duck_drop_off:
|09951D| PHB
|09951E| PHK
|09951F| PLB

|099520| JSR CheckAncillaPresence
|099523| BCS EXIT_099587

|099525| JSR AddAncilla
|099528| BCS EXIT_099587

|09952A| LDA.b #$00 ; LINKSTATE 00
|09952C| STA.b $5D

|09952E| STZ.b $5E

|099530| LDA.b $3A
|099532| AND.b #$7E
|099534| STA.b $3A

|099536| STZ.b $3C
|099538| STZ.b $3D

|09953A| LDA.b $50
|09953C| AND.b #$FE
|09953E| STA.b $50

|099540| LDA.b #$01
|099542| STA.w $0385,X

|099545| LDA.b #$28
|099547| STA.w $0294,X

|09954A| LDA.b #$CD
|09954C| STA.w $029E,X

|09954F| LDY.b #$02

;===================================================================================================

AncillaAdd_ArbitraryDuck:
|099551| TYA
|099552| STA.w $0C54,X

|099555| STZ.w $0C22,X
|099558| STZ.w $0C5E,X

|09955B| LDA.b #$01
|09955D| STA.w $03B1,X

|099560| LDA.b #$38
|099562| STA.w $0C2C,X

|099565| LDA.b #$03
|099567| STA.w $039F,X

|09956A| STZ.w $0380,X
|09956D| STZ.w $0394,X

|099570| REP #$20

|099572| LDA.b $20
|099574| SEC
|099575| SBC.w #$0008
|099578| STA.b $00

|09957A| LDA.w #$FFF0
|09957D| CLC
|09957E| ADC.b $E2
|099580| STA.b $02

|099582| SEP #$20

|099584| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_099587:
|099587| PLB

|099588| RTL

;===================================================================================================

AncillaAdd_QuakeSpell:
|099589| PHB
|09958A| PHK
|09958B| PLB

|09958C| JSR AddAncilla
|09958F| BCC .free_slot

|099591| BRL .exit

.free_slot
|099594| STZ.w $0C54,X
|099597| STZ.w $0C5E,X

|09959A| LDA.b #$0D
|09959C| STA.w $0AAA

|09959F| LDA.b #$35 ; SFX2.35
|0995A1| STA.w $012E

|0995A4| LDA.b #$00
|0995A6| STA.l $7F5805
|0995AA| STA.l $7F5806
|0995AE| STA.l $7F5807
|0995B2| STA.l $7F5808
|0995B6| STA.l $7F5809
|0995BA| STA.l $7F580A

|0995BE| INC A
|0995BF| STA.l $7F5800
|0995C3| STA.l $7F5801
|0995C7| STA.l $7F5802
|0995CB| STA.l $7F5803
|0995CF| STA.l $7F5804

|0995D3| STA.w $0112

|0995D6| INC A
|0995D7| STA.w $0C68,X

|0995DA| REP #$20

|0995DC| LDA.b $20
|0995DE| CLC
|0995DF| ADC.w #$001A
|0995E2| STA.l $7F580B

|0995E6| LDA.b $22
|0995E8| CLC
|0995E9| ADC.w #$0008
|0995EC| STA.l $7F580D

|0995F0| LDA.w #$0003
|0995F3| STA.l $7F581E

|0995F7| SEP #$20

.exit
|0995F9| PLB

|0995FA| RTL

;===================================================================================================

pool AncillaAdd_SpinAttackInitSpark

.offset_y
|0995FB| dw  32 ; up
|0995FD| dw  -8 ; down
|0995FF| dw  10 ; left
|099601| dw  20 ; right

.offset_x
|099603| dw  10 ; up
|099605| dw   7 ; down
|099607| dw  28 ; left
|099609| dw -10 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_SpinAttackInitSpark:
|09960B| PHB
|09960C| PHK
|09960D| PLB

|09960E| STX.b $72

|099610| JSR AddAncilla
|099613| BCS .exit

;---------------------------------------------------------------------------------------------------

|099615| STX.b $00

|099617| LDX.b #$04

.check_next
|099619| LDA.w $0C4A,X
|09961C| CMP.b #$31 ; ANCILLA 31
|09961E| BNE .not_byrna_spark

|099620| STZ.w $0C4A,X

.not_byrna_spark
|099623| DEX
|099624| BPL .check_next

;---------------------------------------------------------------------------------------------------

|099626| LDX.b $00
|099628| STZ.w $0C5E,X

|09962B| LDY.b #$04

|09962D| LDA.b $72
|09962F| STA.w $0C54,X
|099632| BEQ .useless

|099634| LDY.b #$04

.useless
|099636| TYA
|099637| STA.w $0C68,X

|09963A| LDA.b #$03
|09963C| STA.w $03B1,X

|09963F| LDY.b $2F

|099641| REP #$20

|099643| LDA.b $20
|099645| CLC
|099646| ADC.w .offset_y,Y
|099649| STA.b $00

|09964B| LDA.b $22
|09964D| CLC
|09964E| ADC.w .offset_x,Y
|099651| STA.b $02

|099653| SEP #$20

|099655| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|099658| PLB

|099659| RTL

;===================================================================================================

pool AncillaAdd_BlastWall
.offset_xy
|09965A| dw  -8,   0 ; up
|09965E| dw  -8,  16 ; down
|099662| dw  16,   0 ; left
|099666| dw  16,  16 ; right

|09966A| dw   0,  -8 ; up
|09966E| dw  16,  -8 ; down
|099672| dw   0,  16 ; left
|099676| dw  16,  16 ; right

.base_offset_y
|09967A| dw -16 ; up
|09967C| dw  16 ; down
|09967E| dw   0 ; left
|099680| dw   0 ; right

.base_offset_x
|099682| dw   0 ; up
|099684| dw   0 ; down
|099686| dw -16 ; left
|099688| dw  16 ; right

endpool

;===================================================================================================

AncillaPanValues:
|09968A| db $80, $80, $80 ; left
|09968D| db $00, $00      ; middle
|09968F| db $40, $40, $40 ; right

;===================================================================================================

AncillaAdd_BlastWall:
|099692| PHB
|099693| PHK
|099694| PLB

|099695| LDA.b #$33 ; ANCILLA 33
|099697| STA.w $0C4A
|09969A| STA.w $0C4B

|09969D| STZ.w $0C4C
|0996A0| STZ.w $0C4D
|0996A3| STZ.w $0C4E
|0996A6| STZ.w $0C4F

|0996A9| STZ.w $0C5E
|0996AC| STZ.w $02EC

|0996AF| STZ.w $0308
|0996B2| STZ.b $50
|0996B4| STZ.w $0380

;---------------------------------------------------------------------------------------------------

|0996B7| LDA.b $EE
|0996B9| STA.w $0C7C
|0996BC| STA.w $0C7D

|0996BF| LDA.w $0476
|0996C2| STA.w $03CA

|0996C5| LDA.b #$00
|0996C7| STA.l $7F0010
|0996CB| STA.l $7F0009
|0996CF| STA.l $7F0001
|0996D3| STA.l $7F0011

|0996D7| INC A
|0996D8| STA.l $7F0000
|0996DC| STA.w $0112

|0996DF| LDA.b #$03
|0996E1| STA.l $7F0008

|0996E5| LDA.l $7F001C
|0996E9| TAY

|0996EA| REP #$20

|0996EC| LDA.w .base_offset_y,Y
|0996EF| CLC
|0996F0| ADC.l $7F0018
|0996F4| STA.l $7F0018

|0996F8| LDA.w .base_offset_x,Y
|0996FB| CLC
|0996FC| ADC.l $7F001A
|099700| STA.l $7F001A

|099704| SEP #$20

|099706| LDY.b #$00

|099708| LDA.l $7F001C
|09970C| CMP.b #$04
|09970E| BCS .use_first_set

|099710| LDY.b #$10

.use_first_set
|099712| LDX.b #$06

;---------------------------------------------------------------------------------------------------

.next
|099714| REP #$20

|099716| LDA.w .offset_xy+0,Y
|099719| CLC
|09971A| ADC.l $7F0018
|09971E| STA.l $7F0020,X

|099722| LDA.w .offset_xy+2,Y
|099725| CLC
|099726| ADC.l $7F001A
|09972A| STA.l $7F0030,X

|09972E| SEC
|09972F| SBC.b $E2
|099731| STA.b $00

|099733| SEP #$20

|099735| LDA.b $01
|099737| BNE .to_next

|099739| PHY
|09973A| PHX

|09973B| LDA.b $00
|09973D| LSR A
|09973E| LSR A
|09973F| LSR A
|099740| LSR A
|099741| LSR A
|099742| TAX

|099743| LDA.w AncillaPanValues,X
|099746| ORA.b #$0C ; SFX2.0C
|099748| STA.w $012E

|09974B| PLX
|09974C| PLY

.to_next
|09974D| INY
|09974E| INY
|09974F| INY
|099750| INY

|099751| DEX
|099752| DEX
|099753| BPL .next

;---------------------------------------------------------------------------------------------------

|099755| PLB

|099756| RTL

;===================================================================================================

AncillaAdd_SwordChargeSparkle:
|099757| PHB
|099758| PHK
|099759| PLB

|09975A| STX.b $72

|09975C| LDX.b #$09

.check_next
|09975E| LDA.w $0C4A,X
|099761| BEQ .free_slot

|099763| DEX
|099764| BPL .check_next

|099766| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|099769| LDA.b #$3C ; ANCILLA 3C
|09976B| STA.w $0C4A,X

|09976E| LDA.b $EE
|099770| STA.w $0C7C,X

|099773| STZ.w $0C5E,X

|099776| LDA.b #$04
|099778| STA.w $0C68,X

|09977B| JSL GetRandomNumber
|09977F| STA.b $08

|099781| PHX

|099782| LDX.b $72

|099784| JSR CopyAncillaCoordinates

|099787| STZ.b $0B

|099789| LDA.w $029E,X
|09978C| CMP.b #$F8
|09978E| BCC .dont_zero

|099790| LDA.b #$00

.dont_zero
|099792| STA.b $0A

|099794| PLX

|099795| LDA.b $08
|099797| AND.b #$0F
|099799| STA.b $04
|09979B| STZ.b $05

|09979D| LDA.b $08
|09979F| LSR A
|0997A0| LSR A
|0997A1| LSR A
|0997A2| LSR A
|0997A3| LSR A
|0997A4| STA.b $06
|0997A6| STZ.b $07

|0997A8| REP #$20

|0997AA| LDA.b $0A
|0997AC| EOR.w #$FFFF
|0997AF| INC A
|0997B0| CLC
|0997B1| ADC.b $00
|0997B3| CLC
|0997B4| ADC.w #$FFFE
|0997B7| CLC
|0997B8| ADC.b $04
|0997BA| STA.b $00

|0997BC| LDA.b $02
|0997BE| CLC
|0997BF| ADC.b $06
|0997C1| CLC
|0997C2| ADC.w #$0002
|0997C5| STA.b $02

|0997C7| SEP #$20

|0997C9| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|0997CC| PLB

|0997CD| RTL

;===================================================================================================

pool AncillaAdd_SilverArrowSparkle

.offset_y
|0997CE| dw   0
|0997D0| dw   2
|0997D2| dw  -4
|0997D4| dw  -4

.offset_x
|0997D6| dw  -4
|0997D8| dw  -4
|0997DA| dw   0
|0997DC| dw   2

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_SilverArrowSparkle:
|0997DE| PHB
|0997DF| PHK
|0997E0| PLB

|0997E1| STX.b $72

|0997E3| LDX.b #$09

.next_slot
|0997E5| LDA.w $0C4A,X
|0997E8| BEQ .free_slot

|0997EA| DEX
|0997EB| BPL .next_slot

|0997ED| BRL EXIT_099849

;---------------------------------------------------------------------------------------------------

.free_slot
|0997F0| LDA.b #$3C ; ANCILLA 3C
|0997F2| STA.w $0C4A,X

|0997F5| STZ.w $0C5E,X

|0997F8| LDA.b #$04
|0997FA| STA.w $0C68,X

|0997FD| LDA.b $EE
|0997FF| STA.w $0C7C,X

|099802| JSL GetRandomNumber
|099806| STA.b $08

|099808| PHX

|099809| LDX.b $72

|09980B| JSR CopyAncillaCoordinates

|09980E| STZ.b $0B

|099810| LDA.b $08
|099812| AND.b #$07
|099814| STA.b $04
|099816| STZ.b $05

|099818| LDA.b $08
|09981A| AND.b #$70
|09981C| LSR A
|09981D| LSR A
|09981E| LSR A
|09981F| LSR A
|099820| STA.b $06
|099822| STZ.b $07

|099824| LDA.w $0C72,X
|099827| AND.b #$03
|099829| ASL A
|09982A| TAY

|09982B| PLX

|09982C| REP #$20

|09982E| LDA.b $00
|099830| CLC
|099831| ADC.w .offset_y,Y
|099834| CLC
|099835| ADC.b $04
|099837| STA.b $00

|099839| LDA.b $02
|09983B| CLC
|09983C| ADC.w .offset_x,Y
|09983F| CLC
|099840| ADC.b $06
|099842| STA.b $02

|099844| SEP #$20

|099846| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

#EXIT_099849:
|099849| PLB

|09984A| RTL

;===================================================================================================

pool AncillaAdd_IceRodShot

.offset_y
|09984B| dw -16 ; up
|09984D| dw  24 ; down
|09984F| dw   8 ; left
|099851| dw   8 ; right

.offset_x
|099853| dw   0 ; up
|099855| dw   0 ; down
|099857| dw -20 ; left
|099859| dw  20 ; right

.speed_y
|09985B| db -48 ; up
|09985C| db  48 ; down
|09985D| db   0 ; left
|09985E| db   0 ; right

.speed_x
|09985F| db   0 ; up
|099860| db   0 ; down
|099861| db -48 ; left
|099862| db  48 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_IceRodShot:
|099863| PHB
|099864| PHK
|099865| PLB

|099866| JSR AddAncilla
|099869| BCC .free_slot

|09986B| LDX.b #$00
|09986D| JSL RefundMagic

|099871| BRA EXIT_099849

;---------------------------------------------------------------------------------------------------

.free_slot
|099873| JSL CalculateLinkSFXPan
|099877| ORA.b #$0F ; SFX2.0F
|099879| STA.w $012E

|09987C| STZ.w $0C54,X

|09987F| STZ.w $03C2,X

|099882| LDA.b #$FF
|099884| STA.w $0C5E,X

|099887| LDA.b #$01
|099889| STA.w $0385,X

|09988C| LDA.b #$03
|09988E| STA.w $03B1,X

|099891| LDA.b #$06
|099893| STA.w $039F,X

;---------------------------------------------------------------------------------------------------

|099896| LDA.b $2F
|099898| LSR A
|099899| STA.w $0C72,X

|09989C| TAY

|09989D| LDA.w .speed_y,Y
|0998A0| STA.w $0C22,X

|0998A3| LDA.w .speed_x,Y
|0998A6| STA.w $0C2C,X

|0998A9| PHY
|0998AA| PHX

|0998AB| JSL Ancilla_CheckInitialTile_A

|0998AF| PLX
|0998B0| PLY

|0998B1| BCS .explode

;---------------------------------------------------------------------------------------------------

|0998B3| LDY.b $2F

|0998B5| REP #$20

|0998B7| LDA.b $20
|0998B9| CLC
|0998BA| ADC.w .offset_y,Y
|0998BD| STA.b $00

|0998BF| SEC
|0998C0| SBC.b $E8
|0998C2| STA.b $04

|0998C4| LDA.b $22
|0998C6| CLC
|0998C7| ADC.w .offset_x,Y
|0998CA| STA.b $02

|0998CC| SEC
|0998CD| SBC.b $E2
|0998CF| STA.b $06

|0998D1| SEP #$20

|0998D3| LDA.b $05
|0998D5| ORA.b $07
|0998D7| BEQ .onscreen

|0998D9| STZ.w $0C4A,X

|0998DC| BRA .exit

.onscreen
|0998DE| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|0998E1| PLB

|0998E2| RTL

;---------------------------------------------------------------------------------------------------

.explode
|0998E3| PHX

|0998E4| LDA.b #$11 ; ANCILLA 11
|0998E6| STA.w $0C4A,X

|0998E9| TAX

|0998EA| LDA.l AncillaObjectAllocation,X

|0998EE| PLX

|0998EF| STA.w $0C90,X

|0998F2| STZ.w $0C5E,X

|0998F5| LDA.b #$04
|0998F7| STA.w $03B1,X

|0998FA| PLB

|0998FB| RTL

;===================================================================================================

AncillaAdd_Splash:
|0998FC| PHB
|0998FD| PHK
|0998FE| PLB

|0998FF| JSR AddAncilla
|099902| BCS .exit

|099904| JSL CalculateLinkSFXPan
|099908| ORA.b #$24 ; SFX2.24
|09990A| STA.w $012E

|09990D| STZ.w $0C5E,X

|099910| LDA.b #$02
|099912| STA.w $03B1,X

|099915| LDA.b $1B
|099917| BEQ .dont_reset_layer

|099919| LDA.w $0345
|09991C| BNE .dont_reset_layer

|09991E| STZ.b $EE

.dont_reset_layer
|099920| REP #$20

|099922| LDA.b $20
|099924| CLC
|099925| ADC.w #$0008
|099928| STA.b $00

|09992A| LDA.b $22
|09992C| CLC
|09992D| ADC.w #$FFF5
|099930| STA.b $02

|099932| SEP #$20

|099934| JSR SetAncillaCoordinates

|099937| CLC

.exit
|099938| PLB

|099939| RTL

;===================================================================================================

pool AncillaAdd_GraveStone

.position_y
|09993A| dw $0550
|09993C| dw $0540
|09993E| dw $0530
|099940| dw $0520
|099942| dw $0500
|099944| dw $04E0
|099946| dw $04C0
|099948| dw $04B0

;---------------------------------------------------------------------------------------------------

.position_x
|09994A| dw $08B0 ; Gravestone 0
|09994C| dw $08F0 ; Gravestone 1
|09994E| dw $0910 ; Gravestone 2
|099950| dw $0950 ; Gravestone 3
|099952| dw $0970 ; Gravestone 4
|099954| dw $09A0 ; Gravestone 5 (unused)
|099956| dw $0850 ; Gravestone 6
|099958| dw $0870 ; Gravestone 7
|09995A| dw $08B0 ; Gravestone 8
|09995C| dw $08F0 ; Gravestone 9
|09995E| dw $0920 ; Gravestone A
|099960| dw $0950 ; Gravestone B
|099962| dw $0880 ; Gravestone C
|099964| dw $0990 ; Gravestone D
|099966| dw $0840 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tilemap_y
|099968| dw $0540 ; Gravestone 0
|09996A| dw $0530 ; Gravestone 1
|09996C| dw $0530 ; Gravestone 2
|09996E| dw $0530 ; Gravestone 3
|099970| dw $0520 ; Gravestone 4
|099972| dw $0520 ; Gravestone 5 (unused)
|099974| dw $0510 ; Gravestone 6
|099976| dw $0510 ; Gravestone 7
|099978| dw $04F0 ; Gravestone 8
|09997A| dw $04F0 ; Gravestone 9
|09997C| dw $04F0 ; Gravestone A
|09997E| dw $04F0 ; Gravestone B
|099980| dw $04D0 ; Gravestone C
|099982| dw $04B0 ; Gravestone D
|099984| dw $04A0 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tilemap_x
|099986| dw $08B0 ; Gravestone 0
|099988| dw $08F0 ; Gravestone 1
|09998A| dw $0910 ; Gravestone 2
|09998C| dw $0950 ; Gravestone 3
|09998E| dw $0970 ; Gravestone 4
|099990| dw $09A0 ; Gravestone 5 (unused)
|099992| dw $0850 ; Gravestone 6
|099994| dw $0870 ; Gravestone 7
|099996| dw $08B0 ; Gravestone 8
|099998| dw $08F0 ; Gravestone 9
|09999A| dw $0920 ; Gravestone A
|09999C| dw $0950 ; Gravestone B
|09999E| dw $0880 ; Gravestone C
|0999A0| dw $0990 ; Gravestone D
|0999A2| dw $0840 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.gfx_write_addr
|0999A4| dw $0A16 ; Gravestone 0
|0999A6| dw $099E ; Gravestone 1
|0999A8| dw $09A2 ; Gravestone 2
|0999AA| dw $09AA ; Gravestone 3
|0999AC| dw $092E ; Gravestone 4
|0999AE| dw $0934 ; Gravestone 5 (unused)
|0999B0| dw $088A ; Gravestone 6
|0999B2| dw $088E ; Gravestone 7
|0999B4| dw $0796 ; Gravestone 8
|0999B6| dw $079E ; Gravestone 9
|0999B8| dw $07A4 ; Gravestone A
|0999BA| dw $07AA ; Gravestone B
|0999BC| dw $0690 ; Gravestone C
|0999BE| dw $05B2 ; Gravestone D
|0999C0| dw $0508 ; Gravestone E

;---------------------------------------------------------------------------------------------------

.tile_revealed
|0999C2| dw $0030 ; Gravestone 0 - skull
|0999C4| dw $0030 ; Gravestone 1 - skull
|0999C6| dw $0030 ; Gravestone 2 - skull
|0999C8| dw $0030 ; Gravestone 3 - skull
|0999CA| dw $0030 ; Gravestone 4 - skull
|0999CC| dw $0030 ; Gravestone 5 - skull (unused)
|0999CE| dw $0030 ; Gravestone 6 - skull
|0999D0| dw $0030 ; Gravestone 7 - skull
|0999D2| dw $0030 ; Gravestone 8 - skull
|0999D4| dw $0030 ; Gravestone 9 - skull
|0999D6| dw $0030 ; Gravestone A - skull
|0999D8| dw $0030 ; Gravestone B - skull
|0999DA| dw $0030 ; Gravestone C - skull
|0999DC| dw $0038 ; Gravestone D - stairs
|0999DE| dw $0058 ; Gravestone E - hole

;---------------------------------------------------------------------------------------------------

.offset_data_x
|0999E0| db $00
|0999E1| db $02
|0999E2| db $08
|0999E3| db $0C
|0999E4| db $10
|0999E5| db $18
|0999E6| db $1A
|0999E7| db $1C
|0999E8| db $1E

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_GraveStone:
|0999E9| PHB
|0999EA| PHK
|0999EB| PLB

|0999EC| JSR AddAncilla
|0999EF| BCC .free_slot

|0999F1| BRL .exit

;---------------------------------------------------------------------------------------------------

.free_slot
|0999F4| REP #$30

|0999F6| LDY.b $20
|0999F8| TYA

|0999F9| AND.w #$000F
|0999FC| CMP.w #$0007
|0999FF| BCS .round_tile

|099A01| TYA

|099A02| BRA .clip16px

.round_tile
|099A04| TYA
|099A05| CLC
|099A06| ADC.w #$0010

.clip16px
|099A09| AND.w #$FFF0
|099A0C| STA.b $00

;---------------------------------------------------------------------------------------------------

|099A0E| LDY.w #$000E

.next_y
|099A11| LDA.b $00
|099A13| CMP.w .position_y,Y
|099A16| BEQ .y_found

|099A18| DEY
|099A19| DEY
|099A1A| BPL .next_y

|099A1C| BRA .terminate

;---------------------------------------------------------------------------------------------------

.y_found
|099A1E| TYA
|099A1F| LSR A
|099A20| TAY

|099A21| LDA.w .offset_data_x+1,Y
|099A24| AND.w #$00FF
|099A27| STA.b $00

|099A29| LDA.w .offset_data_x+0,Y
|099A2C| AND.w #$00FF
|099A2F| TAY

.next_x
|099A30| LDA.w .position_x,Y
|099A33| CMP.b $22
|099A35| BCS .proceed_to_next

|099A37| CLC
|099A38| ADC.w #$000F
|099A3B| CMP.b $22
|099A3D| BCC .proceed_to_next

|099A3F| CPY.w #$001A
|099A42| BNE .not_dashable

|099A44| LDA.w $0372
|099A47| AND.w #$00FF
|099A4A| BEQ .terminate

|099A4C| BRA .succeed

;---------------------------------------------------------------------------------------------------

.not_dashable
|099A4E| LDA.w $0372
|099A51| AND.w #$00FF
|099A54| BNE .terminate

|099A56| BRA .succeed

;---------------------------------------------------------------------------------------------------

.proceed_to_next
|099A58| INY
|099A59| INY
|099A5A| CPY.b $00
|099A5C| BNE .next_x

;---------------------------------------------------------------------------------------------------

.terminate
|099A5E| SEP #$30

|099A60| STZ.w $0C4A,X

|099A63| BRL .exit

;---------------------------------------------------------------------------------------------------

.succeed
|099A66| LDA.w .gfx_write_addr,Y
|099A69| STA.w $0698

|099A6C| SEC
|099A6D| SBC.w #$0080
|099A70| STA.b $72

|099A72| LDA.w .tile_revealed,Y
|099A75| STA.w $0692

|099A78| CMP.w #$0058
|099A7B| BEQ .hole

|099A7D| CMP.w #$0038
|099A80| BNE .not_stairs

;---------------------------------------------------------------------------------------------------

|099A82| SEP #$30

|099A84| PHX

|099A85| LDX.b $8A

|099A87| LDA.l $7EF280,X
|099A8B| ORA.b #$20
|099A8D| STA.l $7EF280,X

|099A91| PLX

;---------------------------------------------------------------------------------------------------

.hole
|099A92| SEP #$30

|099A94| JSL CalculateLinkSFXPan
|099A98| ORA.b #$1B ; SFX3.1B
|099A9A| STA.w $012F

;---------------------------------------------------------------------------------------------------

.not_stairs
|099A9D| SEP #$30

|099A9F| LDA.b $72
|099AA1| STA.w $03BA,X

|099AA4| LDA.b $73
|099AA6| STA.w $03B6,X

|099AA9| PHY
|099AAA| PHX

|099AAB| JSL BigMap16Update_long

|099AAF| PLX
|099AB0| PLY

;---------------------------------------------------------------------------------------------------

|099AB1| REP #$30

|099AB3| TYA
|099AB4| AND.w #$00FF
|099AB7| TAY

|099AB8| LDA.w .tilemap_y,Y
|099ABB| CLC
|099ABC| ADC.w #$FFFE
|099ABF| STA.b $00

|099AC1| CLC
|099AC2| ADC.w #$FFF0
|099AC5| STA.b $04

|099AC7| LDA.w .tilemap_x,Y
|099ACA| STA.b $02

;---------------------------------------------------------------------------------------------------

|099ACC| SEP #$30

|099ACE| LDA.w $012F
|099AD1| AND.b #$3F
|099AD3| CMP.b #$1B ; SFX3.1B
|099AD5| BEQ .dont_overwrite_sfx

|099AD7| JSL CalculateLinkSFXPan
|099ADB| ORA.b #$22 ; SFX2.22
|099ADD| STA.w $012E

.dont_overwrite_sfx
|099AE0| LDA.b #$04
|099AE2| STA.b $48

|099AE4| LDA.b #$01
|099AE6| STA.w $03E9

|099AE9| LDA.b $04
|099AEB| STA.w $038A,X

|099AEE| LDA.b $05
|099AF0| STA.w $038F,X

|099AF3| BRL SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|099AF6| PLB

|099AF7| RTL

;===================================================================================================

pool AncillaAdd_Hookshot

.speed_y
|099AF8| db -64 ; up
|099AF9| db  64 ; down
|099AFA| db   0 ; left
|099AFB| db   0 ; right

.speed_x
|099AFC| db   0 ; up
|099AFD| db   0 ; down
|099AFE| db -64 ; left
|099AFF| db  64 ; right

.offset_y
|099B00| dw   4 ; up
|099B02| dw  20 ; down
|099B04| dw   8 ; left
|099B06| dw   8 ; right

.offset_x
|099B08| dw   0 ; up
|099B0A| dw   0 ; down
|099B0C| dw  -4 ; left
|099B0E| dw  11 ; right

endpool

;---------------------------------------------------------------------------------------------------

AncillaAdd_Hookshot:
|099B10| PHB
|099B11| PHK
|099B12| PLB

|099B13| JSR AddAncilla
|099B16| BCS .exit

|099B18| LDA.b #$03
|099B1A| STA.w $03B1,X

|099B1D| STZ.w $0C5E,X
|099B20| STZ.w $0C54,X
|099B23| STZ.w $0385,X

|099B26| STZ.w $037E
|099B29| STX.w $039D

|099B2C| STZ.w $0380,X

|099B2F| LDA.b #$FF
|099B31| STA.w $0394,X

|099B34| STZ.w $03A4,X
|099B37| STZ.w $0C68,X

|099B3A| LDA.b $2F
|099B3C| LSR A
|099B3D| STA.w $0C72,X

|099B40| TAY

|099B41| LDA.w .speed_y,Y
|099B44| STA.w $0C22,X

|099B47| LDA.w .speed_x,Y
|099B4A| STA.w $0C2C,X

|099B4D| LDY.b $2F

|099B4F| REP #$20

|099B51| LDA.b $20
|099B53| CLC
|099B54| ADC.w .offset_y,Y
|099B57| STA.b $00

|099B59| LDA.b $22
|099B5B| CLC
|099B5C| ADC.w .offset_x,Y
|099B5F| STA.b $02

|099B61| SEP #$20

|099B63| JMP.w SetAncillaCoordinatesAndExit

;---------------------------------------------------------------------------------------------------

.exit
|099B66| PLB

|099B67| RTL

;===================================================================================================

AncillaAdd_WaterfallSplash:
|099B68| PHB
|099B69| PHK
|099B6A| PLB

|099B6B| LDY.b #$04
|099B6D| LDA.b #$41 ; ANCILLA 41
|099B6F| JSR CheckAncillaPresence
|099B72| BCS EXIT_099B81

|099B74| JSR AddAncilla
|099B77| BCS EXIT_099B81

|099B79| LDA.b #$02
|099B7B| STA.w $0C68,X

|099B7E| STZ.w $0C5E,X

;---------------------------------------------------------------------------------------------------

#EXIT_099B81:
|099B81| PLB

|099B82| RTL

;===================================================================================================

AncillaAdd_GTCutscene:
|099B83| PHB
|099B84| PHK
|099B85| PLB

|099B86| LDA.w $0308
|099B89| AND.b #$80
|099B8B| ORA.b $4D
|099B8D| BNE EXIT_099B81

|099B8F| LDA.l $7EF37A
|099B93| AND.b #$7F
|099B95| CMP.b #$7F
|099B97| BNE EXIT_099B81

|099B99| LDA.l $7EF2C3
|099B9D| AND.b #$20
|099B9F| BNE EXIT_099B81

|099BA1| JSL TerminateSparkles

|099BA5| LDY.b #$04
|099BA7| LDA.b #$43 ; ANCILLA 43
|099BA9| JSR CheckAncillaPresence
|099BAC| BCS EXIT_099B81

|099BAE| JSR AddAncilla
|099BB1| BCS EXIT_099B81

;---------------------------------------------------------------------------------------------------

|099BB3| PHX
|099BB4| LDX.b #$0F

.next_sprite
|099BB6| LDA.w $0E20,X
|099BB9| CMP.b #$37 ; SPRITE 37
|099BBB| BNE .skip_sprite

|099BBD| STZ.w $0DD0,X

.skip_sprite
|099BC0| DEX
|099BC1| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|099BC3| LDX.b #$17
|099BC5| LDA.b #$FF

.next_clear
|099BC7| STA.l $7F5837,X

|099BCB| DEX
|099BCC| BPL .next_clear

;---------------------------------------------------------------------------------------------------

|099BCE| LDA.b #$28
|099BD0| STA.b $72

|099BD2| JSL WriteTo4BPPBuffer_item_gfx

|099BD6| LDA.b #$04
|099BD8| STA.w $0AB1

|099BDB| LDA.b #$02
|099BDD| STA.w $0AA9

|099BE0| JSL PaletteLoad_SpriteEnvironment_Underworld

|099BE4| INC.b $15

|099BE6| PLX

|099BE7| LDA.b #$01
|099BE9| STA.w $02E4

|099BEC| STZ.w $0C36,X
|099BEF| STZ.w $0C40,X
|099BF2| STZ.w $0C54,X

|099BF5| LDA.b #$F0
|099BF7| STA.l $7F5812

|099BFB| LDA.b #$00
|099BFD| STA.l $7F5800
|099C01| STA.l $7F5808

|099C05| LDA.b #$0A
|099C07| STA.l $7F5801

|099C0B| LDA.b #$16
|099C0D| STA.l $7F5802

|099C11| LDA.b #$20
|099C13| STA.l $7F5803

|099C17| LDA.b #$2A
|099C19| STA.l $7F5804

|099C1D| LDA.b #$36
|099C1F| STA.l $7F5805

|099C23| REP #$20

|099C25| LDA.b $20
|099C27| CLC
|099C28| ADC.w #$FFF0
|099C2B| STA.b $00

|099C2D| LDA.b $22
|099C2F| STA.b $02

|099C31| SEP #$20

|099C33| BRL SetAncillaCoordinatesAndExit

;===================================================================================================

UNREACHABLE_099C36:
|099C36| PLB

|099C37| RTL

;===================================================================================================

AncillaAdd_DoorDebris:
|099C38| PHB
|099C39| PHK
|099C3A| PLB

|099C3B| LDY.b #$01
|099C3D| LDA.b #$08 ; ANCILLA 08
|099C3F| JSR AddAncilla
|099C42| BCS EXIT_099C4D

|099C44| STZ.w $03C2,X

|099C47| LDA.b #$07
|099C49| STA.w $03C0,X

|099C4C| CLC

;---------------------------------------------------------------------------------------------------

#EXIT_099C4D:
|099C4D| PLB

|099C4E| RTL

;===================================================================================================

BecomeSkullWoodsFire:
|099C4F| PHB
|099C50| PHK
|099C51| PLB

|099C52| LDA.b $1B
|099C54| BNE EXIT_099C4D

|099C56| LDA.b $8A
|099C58| AND.b #$40
|099C5A| BEQ EXIT_099C4D

|099C5C| PHX

|099C5D| LDY.b #$34 ; ANCILLA 34
|099C5F| STY.w $0C4A
|099C62| STZ.w $0C4B
|099C65| STZ.w $0C4C
|099C68| STZ.w $0C4D
|099C6B| STZ.w $0C4E
|099C6E| STZ.w $0C4F

|099C71| STZ.w $035F

|099C74| TYX

|099C75| LDA.l AncillaObjectAllocation,X
|099C79| STA.w $0C90

|099C7C| PLX

|099C7D| LDA.b #$FD
|099C7F| STA.l $7F0000

|099C83| INC A
|099C84| STA.l $7F0001

|099C88| INC A
|099C89| STA.l $7F0002

|099C8D| LDA.b #$00
|099C8F| STA.l $7F0003
|099C93| STA.l $7F0010

|099C97| LDA.b #$05
|099C99| STA.l $7F0008
|099C9D| STA.l $7F0009
|099CA1| STA.l $7F000A
|099CA5| STA.l $7F000B

|099CA9| STA.w $03B1

|099CAC| REP #$20

|099CAE| LDA.w #$0100
|099CB1| STA.l $7F0018
|099CB5| STA.l $7F0026

|099CB9| LDA.w #$0098
|099CBC| STA.l $7F001A
|099CC0| STA.l $7F0036

|099CC4| SEP #$20

|099CC6| LDA.b #$02
|099CC8| STA.w $04C6

|099CCB| STZ.b $B0
|099CCD| STZ.b $C8

|099CCF| LDA.b $EE
|099CD1| STA.w $0C7C

|099CD4| LDA.w $0476
|099CD7| STA.w $03CA

|099CDA| STZ.w $0C5E
|099CDD| STZ.w $0C54

|099CE0| PLB

|099CE1| RTL

;===================================================================================================

AddAncilla:
|099CE2| PHA

|099CE3| JSL FindAncillaSlot

|099CE7| PLA

|099CE8| TYX
|099CE9| BMI .fail

|099CEB| STA.w $0C4A,X

|099CEE| TAY

|099CEF| LDA.b $EE
|099CF1| STA.w $0C7C,X

|099CF4| LDA.w $0476
|099CF7| STA.w $03CA,X

|099CFA| STZ.w $0C22,X
|099CFD| STZ.w $0C2C,X

|099D00| STZ.w $0280,X
|099D03| STZ.w $028A,X

|099D06| PHX
|099D07| TYX

|099D08| LDA.l AncillaObjectAllocation,X
|099D0C| STA.b $0E

|099D0E| PLX

|099D0F| LDA.b $0E
|099D11| STA.w $0C90,X

|099D14| CLC

|099D15| RTS

.fail
|099D16| SEC

|099D17| RTS

;===================================================================================================

AddAncilla_bank09:
|099D18| PHB
|099D19| PHK
|099D1A| PLB

|099D1B| JSR AddAncilla

|099D1E| PLB

|099D1F| RTL

;===================================================================================================

CheckAncillaPresence:
|099D20| LDX.b #$05

.next
|099D22| CMP.w $0C4A,X
|099D25| BEQ .match

|099D27| DEX
|099D28| BPL .next

|099D2A| CLC

|099D2B| RTS

.match
|099D2C| SEC

|099D2D| RTS

;===================================================================================================

CheckAncillaPresence_long:
|099D2E| PHB
|099D2F| PHK
|099D30| PLB

|099D31| JSR CheckAncillaPresence

|099D34| PLB

|099D35| RTL

;===================================================================================================

FindArrowAncillaSlot:
|099D36| PHA

|099D37| INY
|099D38| STY.b $0E

|099D3A| LDY.b #$00
|099D3C| LDX.b #$04

.next_tally
|099D3E| LDA.b #$0A ; ANCILLA 0A
|099D40| CMP.w $0C4A,X
|099D43| BNE .dont_tally

|099D45| INY

.dont_tally
|099D46| DEX
|099D47| BPL .next_tally

;---------------------------------------------------------------------------------------------------

|099D49| CPY.b $0E
|099D4B| BEQ .too_many

|099D4D| LDY.b #$04

.next_free_check
|099D4F| LDA.w $0C4A,Y
|099D52| BEQ .replace_this

|099D54| DEY
|099D55| BPL .next_free_check

|099D57| BRA .replace_this

;---------------------------------------------------------------------------------------------------

.too_many
|099D59| DEC.w $03C4
|099D5C| BPL .keep_index

.reset_index
|099D5E| LDA.b #$04
|099D60| STA.w $03C4

.keep_index
|099D63| LDY.w $03C4

|099D66| LDA.w $0C4A,Y
|099D69| CMP.b #$0A ; ANCILLA 0A
|099D6B| BEQ .replace_this

|099D6D| DEY

|099D6E| BPL .too_many

|099D70| BRA .reset_index

;---------------------------------------------------------------------------------------------------

.replace_this
|099D72| PLA

|099D73| TYX
|099D74| BMI .failed

|099D76| STA.w $0C4A,X
|099D79| TAY

|099D7A| LDA.b $EE
|099D7C| STA.w $0C7C,X

|099D7F| LDA.w $0476
|099D82| STA.w $03CA,X

|099D85| STZ.w $0C22,X
|099D88| STZ.w $0C2C,X

|099D8B| STZ.w $0280,X
|099D8E| STZ.w $028A,X

|099D91| PHX

|099D92| TYX

|099D93| LDA.l AncillaObjectAllocation,X
|099D97| STA.b $0E

|099D99| PLX

|099D9A| LDA.b $0E
|099D9C| STA.w $0C90,X

|099D9F| CLC

|099DA0| RTS

;---------------------------------------------------------------------------------------------------

.failed
|099DA1| SEC

|099DA2| RTS

;===================================================================================================

pool Ancilla_CheckInitialTile_A

.offset_y
|099DA3| dw   8,   0
|099DA7| dw  -8,   8
|099DAB| dw  16,  24
|099DAF| dw   8,   8
|099DB3| dw   8,   8
|099DB7| dw   8,   8

.offset_x
|099DBB| dw   0,   0
|099DBF| dw   0,   0
|099DC3| dw   0,   0
|099DC7| dw   0,  -8
|099DCB| dw -16,   0
|099DCF| dw   8,  16

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_CheckInitialTile_A:
|099DD3| PHB
|099DD4| PHK
|099DD5| PLB

|099DD6| PHY

|099DD7| LDA.b #$02
|099DD9| STA.b $72

|099DDB| LDA.w $0C72,X
|099DDE| ASL A
|099DDF| STA.b $02

|099DE1| ASL A
|099DE2| CLC
|099DE3| ADC.b $02
|099DE5| TAY

.next
|099DE6| REP #$20

|099DE8| LDA.w .offset_y,Y
|099DEB| CLC
|099DEC| ADC.b $20
|099DEE| STA.b $02

|099DF0| LDA.w .offset_x,Y
|099DF3| CLC
|099DF4| ADC.b $22
|099DF6| STA.b $04

|099DF8| SEP #$20

|099DFA| LDA.b $02
|099DFC| STA.w $0BFA,X

|099DFF| LDA.b $03
|099E01| STA.w $0C0E,X

|099E04| LDA.b $04
|099E06| STA.w $0C04,X

|099E09| LDA.b $05
|099E0B| STA.w $0C18,X

|099E0E| PHY
|099E0F| JSL Ancilla_CheckTileCollision_long
|099E13| PLY

|099E14| BCS .collided

|099E16| INY
|099E17| INY

|099E18| DEC.b $72
|099E1A| BPL .next

;---------------------------------------------------------------------------------------------------

|099E1C| PLY

|099E1D| CLC

|099E1E| PLB

|099E1F| RTL

;---------------------------------------------------------------------------------------------------

.collided
|099E20| PLY

|099E21| SEC

|099E22| PLB

|099E23| RTL

;===================================================================================================

pool Ancilla_CheckInitialTileCollision_Class2

.offset_y
|099E24| dw  15,  16
|099E28| dw  28,  24
|099E2C| dw  12,  12
|099E30| dw  12,  12

.offset_x
|099E34| dw   8,   8
|099E38| dw   8,   8
|099E3C| dw  -1,   0
|099E40| dw  17,  16

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_CheckInitialTileCollision_Class2:
|099E44| PHB
|099E45| PHK
|099E46| PLB

|099E47| PHY

|099E48| LDA.b #$02
|099E4A| STA.b $72

|099E4C| LDA.w $0C72,X
|099E4F| ASL A
|099E50| ASL A
|099E51| TAY

;---------------------------------------------------------------------------------------------------

.next
|099E52| REP #$20

|099E54| LDA.w .offset_y,Y
|099E57| CLC
|099E58| ADC.b $20
|099E5A| STA.b $02

|099E5C| LDA.w .offset_x,Y
|099E5F| CLC
|099E60| ADC.b $22
|099E62| STA.b $04

|099E64| SEP #$20

|099E66| LDA.b $02
|099E68| STA.w $0BFA,X

|099E6B| LDA.b $03
|099E6D| STA.w $0C0E,X

|099E70| LDA.b $04
|099E72| STA.w $0C04,X

|099E75| LDA.b $05
|099E77| STA.w $0C18,X

|099E7A| PHY
|099E7B| JSL Ancilla_CheckTileCollision_Class2_long
|099E7F| PLY

|099E80| BCS .collided

|099E82| INY
|099E83| INY

|099E84| DEC.b $72
|099E86| BPL .next

;---------------------------------------------------------------------------------------------------

|099E88| PLY

|099E89| CLC

|099E8A| PLB

|099E8B| RTL

;---------------------------------------------------------------------------------------------------

.collided
|099E8C| PLY

|099E8D| SEC

|099E8E| PLB

|099E8F| RTL

;===================================================================================================

CheckBlindMaidenTrigger:
|099E90| PHB
|099E91| PHK
|099E92| PLB

|099E93| LDX.w $02CF

|099E96| LDA.w $1A00,X
|099E99| STA.b $00

|099E9B| LDA.w $1A14,X
|099E9E| STA.b $01

|099EA0| LDA.w $1A28,X
|099EA3| STA.b $02

|099EA5| LDA.w $1A3C,X
|099EA8| STA.b $03

|099EAA| STZ.b $0B

|099EAC| LDA.w $1A50,X
|099EAF| STA.b $0A
|099EB1| BPL .positive_z

|099EB3| LDA.b #$FF
|099EB5| STA.b $0B

;---------------------------------------------------------------------------------------------------

.positive_z
|099EB7| REP #$20

|099EB9| LDA.b $00
|099EBB| CLC
|099EBC| ADC.b $0A
|099EBE| CLC
|099EBF| ADC.w #$000C
|099EC2| STA.b $00

|099EC4| LDA.b $02
|099EC6| CLC
|099EC7| ADC.w #$0008
|099ECA| STA.b $02

|099ECC| LDA.w #$1568
|099ECF| SEC
|099ED0| SBC.b $00
|099ED2| BPL .positive_x

|099ED4| EOR.w #$FFFF
|099ED7| INC A

;---------------------------------------------------------------------------------------------------

.positive_x
|099ED8| CMP.w #$0018
|099EDB| BCS .fail

|099EDD| LDA.w #$1980
|099EE0| SEC
|099EE1| SBC.b $02
|099EE3| BPL .positive_y

|099EE5| EOR.w #$FFFF
|099EE8| INC A

;---------------------------------------------------------------------------------------------------

.positive_y
|099EE9| CMP.w #$0018
|099EEC| BCS .fail

.success
|099EEE| SEP #$20

|099EF0| PLB

|099EF1| SEC

|099EF2| RTL

;---------------------------------------------------------------------------------------------------

.fail
|099EF3| SEP #$20

|099EF5| PLB

|099EF6| CLC

|099EF7| RTL

;===================================================================================================

FollowerPriority:
|099EF8| db $20, $10, $30, $20

;===================================================================================================

InitializeFollower:
|099EFC| PHB
|099EFD| PHK
|099EFE| PLB

|099EFF| LDA.b $20
|099F01| STA.w $1A00

|099F04| LDA.b $21
|099F06| STA.w $1A14

|099F09| LDA.b $22
|099F0B| STA.w $1A28

|099F0E| LDA.b $23
|099F10| STA.w $1A3C

|099F13| LDA.b $2F
|099F15| LSR A
|099F16| STA.b $00

|099F18| LDY.b $EE

|099F1A| LDA.w FollowerPriority,Y
|099F1D| LSR A
|099F1E| LSR A
|099F1F| ORA.b $00
|099F21| STA.w $1A64

|099F24| LDA.b #$40
|099F26| STA.w $02D2

|099F29| STZ.w $02CF
|099F2C| STZ.w $02D3
|099F2F| STZ.w $02D0
|099F32| STZ.w $02D6

|099F35| STZ.b $5E

|099F37| PLB

|099F38| RTL

;===================================================================================================

BecomeFollower:
|099F39| PHB
|099F3A| PHK
|099F3B| PLB

|099F3C| PHX

|099F3D| STZ.w $02F9

|099F40| LDA.w $0D00,X
|099F43| CLC
|099F44| ADC.b #$FA
|099F46| STA.w $1A00

|099F49| LDA.w $0D20,X
|099F4C| ADC.b #$FF
|099F4E| STA.w $1A14

|099F51| LDA.w $0D10,X
|099F54| CLC
|099F55| ADC.b #$01
|099F57| STA.w $1A28

|099F5A| LDA.w $0D30,X
|099F5D| ADC.b #$00
|099F5F| STA.w $1A3C

;---------------------------------------------------------------------------------------------------

|099F62| LDY.b $EE

|099F64| LDA.w FollowerPriority,Y
|099F67| LSR A
|099F68| LSR A
|099F69| ORA.b #$01
|099F6B| STA.w $1A64

|099F6E| LDA.b #$40
|099F70| STA.w $02D2
|099F73| STZ.w $02D3

|099F76| STZ.w $02CF

|099F79| STZ.w $02D0
|099F7C| STZ.w $02D6

|099F7F| STZ.b $5E

|099F81| STZ.w $02F9

|099F84| LDA.b #$00
|099F86| STA.l $7EF3D3

|099F8A| JSL StepTowardsLink

|099F8E| PLX
|099F8F| PLB

|099F90| RTL

;===================================================================================================

HandleFollower:
|099F91| PHB
|099F92| PHK
|099F93| PLB

|099F94| JSR .execute

|099F97| PLB

|099F98| RTL

;===================================================================================================

#FollowerVectors:
|099F99| dw Follower_BasicMover   ; 0x01 - Zelda
|099F9B| dw Follower_OldMan       ; 0x02 - Old man that stops following you
|099F9D| dw Follower_OldManUnused ; 0x03 - Unused old man
|099F9F| dw Follower_OldMan       ; 0x04 - Normal old man
|099FA1| dw Follower_Telepathy    ; 0x05 - Zelda rescue telepathy
|099FA3| dw Follower_BasicMover   ; 0x06 - Blind maiden
|099FA5| dw Follower_BasicMover   ; 0x07 - Frogsmith
|099FA7| dw Follower_BasicMover   ; 0x08 - Smithy
|099FA9| dw Follower_BasicMover   ; 0x09 - Locksmith
|099FAB| dw Follower_BasicMover   ; 0x0A - Kiki
|099FAD| dw Follower_OldManUnused ; 0x0B - Unused old man
|099FAF| dw Follower_BasicMover   ; 0x0C - Purple chest
|099FB1| dw Follower_BasicMover   ; 0x0D - Super bomb
|099FB3| dw Follower_Telepathy    ; 0x0E - Master Sword telepathy

;===================================================================================================

.has_message
|099FB5| db $05 ; FOLLOWER 05 - Zelda rescue telepathy
|099FB6| db $09 ; FOLLOWER 09 - Locksmith
|099FB7| db $0A ; FOLLOWER 0A - Kiki

.message_timer
|099FB8| dw $0DF3 ; 3571
|099FBA| dw $06F9 ; 1785
|099FBC| dw $0DF3 ; 3571

.message_id
|099FBE| dw $0020 ; MESSAGE 0020
|099FC0| dw $0108 ; MESSAGE 0108
|099FC2| dw $011D ; MESSAGE 011D

;===================================================================================================

.execute
|099FC4| LDA.l $7EF3CC
|099FC8| BNE .have_follower

|099FCA| RTS

.have_follower
|099FCB| CMP.b #$0E ; FOLLOWER 0E
|099FCD| BNE .not_ms_telepathy

|099FCF| BRL HandleFollowerMessageTrigger

;---------------------------------------------------------------------------------------------------

.not_ms_telepathy
|099FD2| LDY.b #$02

.next_check
|099FD4| LDA.l $7EF3CC
|099FD8| CMP.w .has_message,Y
|099FDB| BEQ .has_timed_message

|099FDD| DEY
|099FDE| BPL .next_check

|099FE0| BRL Follower_NoTimedMessage

;---------------------------------------------------------------------------------------------------

.has_timed_message
|099FE3| LDA.b $11
|099FE5| BNE .continue_a

|099FE7| CPY.b #$02
|099FE9| BNE .not_kiki

|099FEB| LDA.b $8A
|099FED| AND.b #$40
|099FEF| BNE .continue_a

.not_kiki
|099FF1| REP #$20

|099FF3| DEC.w $02CD
|099FF6| BPL .continue_a

;---------------------------------------------------------------------------------------------------

|099FF8| SEP #$20

|099FFA| JSL ValidateAbilityToNag
|099FFE| BCS .display_timed_message

|09A000| STZ.w $02CD
|09A003| STZ.w $02CE
|09A006| BRA .continue_a

;---------------------------------------------------------------------------------------------------

.display_timed_message
|09A008| REP #$20

|09A00A| PHY

|09A00B| TYA
|09A00C| AND.w #$00FF
|09A00F| ASL A
|09A010| TAY

|09A011| LDA.w .message_timer,Y
|09A014| STA.w $02CD

|09A017| LDA.w .message_id,Y
|09A01A| STA.w $1CF0

|09A01D| SEP #$20

|09A01F| JSL PrepAndDisplayMessage

|09A023| PLY

;===================================================================================================

#Follower_Telepathy:
.continue_a
|09A024| SEP #$20

|09A026| CPY.b #$00
|09A028| BNE Follower_NoTimedMessage

|09A02A| RTS

;---------------------------------------------------------------------------------------------------

Follower_NoTimedMessage:
|09A02B| SEP #$20

|09A02D| LDA.l $7EF3D3
|09A031| BEQ .follower_following

|09A033| BRL .not_following_bounce

;---------------------------------------------------------------------------------------------------

.follower_following
|09A036| LDA.l $7EF3CC
|09A03A| CMP.b #$0C ; FOLLOWER 0C
|09A03C| BNE .is_purple_chest

|09A03E| LDA.b $4D
|09A040| BNE .not_default_game_mode

|09A042| BRA .continue_a

.is_purple_chest
|09A044| LDA.l $7EF3CC
|09A048| CMP.b #$0D ; FOLLOWER 0D
|09A04A| BEQ .is_super_bomb

.not_default_game_mode
|09A04C| BRL FollowerGameModeTest

.is_super_bomb
|09A04F| LDA.b $4D
|09A051| CMP.b #$02
|09A053| BEQ .recoiling_or_falling

|09A055| LDA.b $5B
|09A057| CMP.b #$02
|09A059| BEQ .recoiling_or_falling

;---------------------------------------------------------------------------------------------------

.continue_a
|09A05B| LDA.b $11
|09A05D| BNE .not_default_game_mode

|09A05F| LDA.b $4D
|09A061| CMP.b #$01
|09A063| BEQ FollowerGameModeTest

|09A065| BIT.w $0308
|09A068| BMI FollowerGameModeTest

|09A06A| LDA.w $02F9
|09A06D| BNE FollowerGameModeTest

|09A06F| LDA.w $02D0
|09A072| BNE FollowerGameModeTest

;---------------------------------------------------------------------------------------------------

|09A074| LDX.w $02CF

|09A077| LDA.w $1A50,X
|09A07A| BEQ .zero_altitude

|09A07C| BPL FollowerGameModeTest

.zero_altitude
|09A07E| LDA.b $F6
|09A080| AND.b #$80
|09A082| BEQ FollowerGameModeTest

.recoiling_or_falling
|09A084| LDA.l $7EF3CC
|09A088| CMP.b #$0D ; FOLLOWER 0D
|09A08A| BNE .not_superbomb_outdoors

|09A08C| LDA.b $1B
|09A08E| BNE .not_superbomb_outdoors

;---------------------------------------------------------------------------------------------------

|09A090| LDA.b $5D
|09A092| CMP.b #$08 ; LINKSTATE 08
|09A094| BEQ FollowerGameModeTest

|09A096| CMP.b #$09 ; LINKSTATE 09
|09A098| BEQ FollowerGameModeTest

|09A09A| CMP.b #$0A ; LINKSTATE 0A
|09A09C| BEQ FollowerGameModeTest

|09A09E| LDA.b #$03
|09A0A0| STA.w $04B4

|09A0A3| LDA.b #$BB
|09A0A5| STA.w $04B5

;---------------------------------------------------------------------------------------------------

.not_superbomb_outdoors
|09A0A8| LDA.b #$80
|09A0AA| STA.l $7EF3D3

|09A0AE| LDA.b #$40
|09A0B0| STA.w $02D2

|09A0B3| LDX.w $02CF

|09A0B6| LDA.w $1A00,X
|09A0B9| STA.l $7EF3CD

|09A0BD| LDA.w $1A14,X
|09A0C0| STA.l $7EF3CE

|09A0C4| LDA.w $1A28,X
|09A0C7| STA.l $7EF3CF

|09A0CB| LDA.w $1A3C,X
|09A0CE| STA.l $7EF3D0

|09A0D2| LDA.b $EE
|09A0D4| STA.l $7EF3D2

|09A0D8| LDA.b $1B
|09A0DA| STA.l $7EF3D1

;---------------------------------------------------------------------------------------------------

.not_following_bounce
|09A0DE| BRL NotLiterallyFollowing

;===================================================================================================

FollowerGameModeTest:
|09A0E1| SEP #$20

|09A0E3| LDA.w $02E4
|09A0E6| BNE .dont_do_anything

|09A0E8| LDX.b $10
|09A0EA| LDY.b $11

|09A0EC| CPY.b #$0A
|09A0EE| BEQ .dont_do_anything

|09A0F0| CPX.b #$09
|09A0F2| BNE .not_overworld

|09A0F4| CPY.b #$23
|09A0F6| BEQ .dont_do_anything

;---------------------------------------------------------------------------------------------------

.not_overworld
|09A0F8| CPX.b #$0E
|09A0FA| BNE .not_text_mode

|09A0FC| CPY.b #$01
|09A0FE| BEQ .dont_do_anything

|09A100| CPY.b #$02
|09A102| BNE .not_text_mode

.dont_do_anything
|09A104| BRL RunFollower

;---------------------------------------------------------------------------------------------------

.not_text_mode
|09A107| LDA.b $30
|09A109| ORA.b $31
|09A10B| BEQ RunFollower

|09A10D| LDX.w $02D3
|09A110| INX
|09A111| CPX.b #$14
|09A113| BNE .dont_reset_movement_index

|09A115| LDX.b #$00

.dont_reset_movement_index
|09A117| STX.w $02D3

;---------------------------------------------------------------------------------------------------

|09A11A| LDA.b $24
|09A11C| CMP.b #$F0
|09A11E| BCC .use_links_altitude

|09A120| LDA.b #$00

.use_links_altitude
|09A122| STA.b $00
|09A124| STZ.b $01

|09A126| LDA.b $00
|09A128| STA.w $1A50,X

;---------------------------------------------------------------------------------------------------

|09A12B| REP #$20

|09A12D| LDA.b $20
|09A12F| SEC
|09A130| SBC.b $00
|09A132| STA.b $00

|09A134| SEP #$20

;---------------------------------------------------------------------------------------------------

|09A136| LDA.b $00
|09A138| STA.w $1A00,X

|09A13B| LDA.b $01
|09A13D| STA.w $1A14,X

|09A140| LDA.b $22
|09A142| STA.w $1A28,X

|09A145| LDA.b $23
|09A147| STA.w $1A3C,X

|09A14A| LDA.b $2F
|09A14C| LSR A
|09A14D| STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

|09A150| LDY.b $EE

|09A152| LDA.w FollowerPriority,Y
|09A155| LSR A
|09A156| LSR A
|09A157| ORA.w $1A64,X
|09A15A| STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

|09A15D| LDA.b $5D
|09A15F| CMP.b #$04 ; LINKSTATE 04
|09A161| BNE .not_swimming

|09A163| LDY.b #$20

|09A165| BRA .set_priority

.not_swimming
|09A167| CMP.b #$13 ; LINKSTATE 13
|09A169| BNE .not_hookshot_drag

|09A16B| LDA.w $037E
|09A16E| BEQ .not_hookshot_drag

|09A170| LDA.b #$10
|09A172| ORA.w $1A64,X
|09A175| STA.w $1A64,X

;---------------------------------------------------------------------------------------------------

.not_hookshot_drag
|09A178| LDY.b #$80

|09A17A| LDA.w $0351
|09A17D| BEQ RunFollower

|09A17F| CMP.b #$01
|09A181| BEQ .set_priority

|09A183| LDY.b #$40

.set_priority
|09A185| TYA
|09A186| ORA.w $1A64,X
|09A189| STA.w $1A64,X

;===================================================================================================

RunFollower:
|09A18C| LDA.l $7EF3CC
|09A190| DEC A
|09A191| ASL A
|09A192| TAX

|09A193| JMP.w (FollowerVectors,X)

;===================================================================================================

UNREACHABLE_09A196:
|09A196| RTS

;===================================================================================================

Follower_BasicMover:
|09A197| LDA.w $02E4
|09A19A| BNE .not_in_cutscene

|09A19C| LDX.b $10
|09A19E| LDY.b $11

|09A1A0| CPY.b #$0A
|09A1A2| BEQ .not_in_cutscene

|09A1A4| CPX.b #$09
|09A1A6| BNE .not_overworld

|09A1A8| CPY.b #$23
|09A1AA| BEQ .not_in_cutscene

.not_overworld
|09A1AC| CPX.b #$0E
|09A1AE| BNE .not_text_mode

|09A1B0| CPY.b #$01
|09A1B2| BEQ .not_in_cutscene

|09A1B4| CPY.b #$02
|09A1B6| BNE .not_text_mode

.not_in_cutscene
|09A1B8| BRL .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.not_text_mode
|09A1BB| JSR HandleFollowerMessageTrigger

|09A1BE| LDA.l $7EF3CC
|09A1C2| CMP.b #$0A ; FOLLOWER 0A
|09A1C4| BNE .dont_scare_kiki

|09A1C6| LDA.b $4D
|09A1C8| BEQ .dont_scare_kiki

|09A1CA| LDA.w $031F
|09A1CD| BEQ .dont_scare_kiki

|09A1CF| LDA.w $02CF
|09A1D2| INC A
|09A1D3| CMP.b #$14
|09A1D5| BNE .no_index_wrap

|09A1D7| LDA.b #$00

.no_index_wrap
|09A1D9| JSL Kiki_SpawnHandler_B

|09A1DD| LDA.b #$00
|09A1DF| STA.l $7EF3CC

|09A1E3| RTS

;===================================================================================================

.dont_scare_kiki
|09A1E4| LDA.l $7EF3CC
|09A1E8| CMP.b #$06 ; FOLLOWER 06
|09A1EA| BNE .no_blind_transform

|09A1EC| REP #$20

|09A1EE| LDA.b $A0
|09A1F0| CMP.w #$00AC ; ROOM 00AC
|09A1F3| BNE .no_blind_transform

|09A1F5| LDA.l $7EF0CA
|09A1F9| AND.w #$0100
|09A1FC| BEQ .no_blind_transform

|09A1FE| SEP #$20

|09A200| JSL CheckBlindMaidenTrigger
|09A204| BCC .no_blind_transform

;---------------------------------------------------------------------------------------------------

.blind_transform
|09A206| LDX.w $02CF

|09A209| LDA.w $1A28,X
|09A20C| STA.b $00

|09A20E| LDA.w $1A3C,X
|09A211| STA.b $01

|09A213| LDA.w $1A00,X
|09A216| STA.b $02

|09A218| LDA.w $1A14,X
|09A21B| STA.b $03

|09A21D| LDA.b #$00
|09A21F| STA.l $7EF3CC

|09A223| JSL Blind_SpawnFromMaiden

|09A227| INC.w $0468

|09A22A| STZ.w $068E
|09A22D| STZ.w $0690

|09A230| LDA.b #$05
|09A232| STA.b $11

|09A234| LDA.b #$15 ; SONG 15
|09A236| STA.w $012C

|09A239| RTS

;---------------------------------------------------------------------------------------------------

.no_blind_transform
|09A23A| SEP #$20

|09A23C| LDY.b $5D

|09A23E| LDA.w $02D0
|09A241| BNE .ignore_hook

|09A243| CPY.b #$13 ; LINKSTATE 13
|09A245| BNE .no_hookshot_dragging

|09A247| LDA.w $037E
|09A24A| BEQ .no_hookshot_dragging

|09A24C| LDA.b #$01
|09A24E| STA.w $02D0

|09A251| BRA .continue_from_hook

.ignore_hook
|09A253| CPY.b #$13 ; LINKSTATE 13
|09A255| BEQ .continue_from_hook

|09A257| LDA.w $02D1
|09A25A| CMP.w $02CF
|09A25D| BNE .advance_movement_index

|09A25F| STZ.w $02D0

;---------------------------------------------------------------------------------------------------

.no_hookshot_dragging
|09A262| LDX.w $02CF

|09A265| LDA.w $1A50,X
|09A268| BEQ .nonpositive_z
|09A26A| BMI .nonpositive_z

|09A26C| LDA.w $02D3
|09A26F| CMP.w $02CF
|09A272| BNE .advance_movement_index

|09A274| STZ.w $1A50,X

|09A277| LDA.b $20
|09A279| STA.w $1A00,X

|09A27C| LDA.b $21
|09A27E| STA.w $1A14,X

|09A281| LDA.b $22
|09A283| STA.w $1A28,X

|09A286| LDA.b $23
|09A288| STA.w $1A3C,X

;---------------------------------------------------------------------------------------------------

.nonpositive_z
|09A28B| LDA.b $30
|09A28D| ORA.b $31
|09A28F| BEQ .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.continue_from_hook
|09A291| LDA.w $02D3
|09A294| SEC
|09A295| SBC.b #$0F
|09A297| BPL .dont_wrap_index_a

|09A299| CLC
|09A29A| ADC.b #$14

.dont_wrap_index_a
|09A29C| CMP.w $02CF
|09A29F| BNE .proceed_to_draw

;---------------------------------------------------------------------------------------------------

.advance_movement_index
|09A2A1| LDX.w $02CF
|09A2A4| INX
|09A2A5| CPX.b #$14
|09A2A7| BNE .dont_wrap_index_b

|09A2A9| LDX.b #$00

.dont_wrap_index_b
|09A2AB| STX.w $02CF

;---------------------------------------------------------------------------------------------------

.proceed_to_draw
|09A2AE| BRL AnimateAndDrawFollower

;===================================================================================================

#EXIT_09A2B1:
|09A2B1| RTS

;---------------------------------------------------------------------------------------------------

NotLiterallyFollowing:
|09A2B2| LDA.l $7EF3D1
|09A2B6| CMP.b $1B
|09A2B8| BNE EXIT_09A2B1

|09A2BA| LDA.w $0372
|09A2BD| BNE .dont_reset_self

|09A2BF| JSR CheckFollowerProximityToLink
|09A2C2| BCS .dont_reset_self

|09A2C4| JSL InitializeFollower

|09A2C8| LDA.b $1B
|09A2CA| STA.l $7EF3D1

|09A2CE| LDA.l $7EF3CC
|09A2D2| CMP.b #$0D ; FOLLOWER 0D
|09A2D4| BNE .not_superbomb

|09A2D6| LDA.b #$FE
|09A2D8| STA.w $04B4
|09A2DB| STZ.w $04B5

.not_superbomb
|09A2DE| LDA.b #$00
|09A2E0| STA.l $7EF3D3

|09A2E4| BRL AnimateAndDrawFollower

;---------------------------------------------------------------------------------------------------

.dont_reset_self
|09A2E7| LDA.l $7EF3CC
|09A2EB| CMP.b #$0D ; FOLLOWER 0D
|09A2ED| BNE .not_superbomb_exploding

|09A2EF| LDA.b $1B
|09A2F1| BNE .not_superbomb_exploding

|09A2F3| LDA.w $04B4
|09A2F6| BNE .not_superbomb_exploding

|09A2F8| LDY.b #$00
|09A2FA| LDA.b #$3A ; ANCILLA 3A
|09A2FC| JSL AncillaAdd_SuperBombExplosion

|09A300| LDA.b #$00
|09A302| STA.l $7EF3D3

.not_superbomb_exploding
|09A306| BRL DoFollowerLayers

;===================================================================================================

pool Follower_OldMan

.replacement_follower
|09A309| db $00 ; 0x00 - No follower
|09A30A| db $00 ; 0x01 - Zelda
|09A30B| db $03 ; 0x02 - Old man that stops following you ⇒ FOLLOWER 03
|09A30C| db $03 ; 0x03 - Unused old man ⇒ FOLLOWER 03
|09A30D| db $04 ; 0x04 - Normal old man ⇒ FOLLOWER 04
|09A30E| db $00 ; 0x05 - Zelda rescue telepathy
|09A30F| db $00 ; 0x06 - Blind maiden
|09A310| db $00 ; 0x07 - Frogsmith
|09A311| db $00 ; 0x08 - Smithy
|09A312| db $00 ; 0x09 - Locksmith
|09A313| db $00 ; 0x0A - Kiki
|09A314| db $00 ; 0x0B - Unused old man
|09A315| db $00 ; 0x0C - Purple chest
|09A316| db $00 ; 0x0D - Super bomb
|09A317| db $00 ; 0x0E - Master Sword telepathy

endpool

;---------------------------------------------------------------------------------------------------

Follower_OldMan:
|09A318| LDA.w $02E4
|09A31B| BNE .proceed_to_just_draw

|09A31D| LDX.b $10
|09A31F| LDY.b $11
|09A321| CPY.b #$0A
|09A323| BEQ .proceed_to_just_draw

|09A325| CPX.b #$09
|09A327| BNE .not_overworld

|09A329| CPY.b #$23
|09A32B| BEQ .proceed_to_just_draw

.not_overworld
|09A32D| CPX.b #$0E
|09A32F| BNE .not_textbox

|09A331| CPY.b #$01
|09A333| BEQ .proceed_to_just_draw

|09A335| CPY.b #$02
|09A337| BNE .not_textbox

.proceed_to_just_draw
|09A339| BRL .just_draw

;---------------------------------------------------------------------------------------------------

.not_textbox
|09A33C| LDA.b $5E
|09A33E| CMP.b #$04
|09A340| BEQ .dont_reset_link_speed

|09A342| LDA.b #$0C
|09A344| STA.b $5E

.dont_reset_link_speed
|09A346| JSR HandleFollowerMessageTrigger

|09A349| SEP #$30

|09A34B| LDA.l $7EF3CC
|09A34F| BNE .have_old_man_indeed

|09A351| RTS

;---------------------------------------------------------------------------------------------------

.have_old_man_indeed
|09A352| CMP.b #$04
|09A354| BNE .not_normal_old_man

|09A356| LDX.w $02CF

|09A359| LDA.w $1A50,X
|09A35C| BEQ .proceed_to_check_velocity
|09A35E| BMI .proceed_to_check_velocity

|09A360| LDA.w $02CF
|09A363| CMP.w $02D3
|09A366| BEQ .proceed_to_check_velocity

|09A368| BRL .advance_movement_index

;---------------------------------------------------------------------------------------------------

.proceed_to_check_velocity
|09A36B| BRL .check_link_velocity

;---------------------------------------------------------------------------------------------------

.not_normal_old_man
|09A36E| LDA.b $4D
|09A370| AND.b #$01
|09A372| BEQ .check_for_recoiling

|09A374| LDA.b $5D
|09A376| CMP.b #$06 ; LINKSTATE 06
|09A378| BNE .check_for_recoiling

|09A37A| LDA.w $02D3
|09A37D| CMP.w $02CF
|09A380| BNE .replace_that_follower

|09A382| DEX
|09A383| STX.w $02CF
|09A386| BPL .replace_that_follower

|09A388| LDA.b #$13
|09A38A| STA.w $02CF

.check_for_recoiling
|09A38D| LDA.b $4D
|09A38F| AND.b #$02
|09A391| BEQ .check_link_velocity

.replace_that_follower
|09A393| LDA.l $7EF3CC
|09A397| TAX

|09A398| LDA.w .replacement_follower,X
|09A39B| STA.l $7EF3CC

|09A39F| LDA.b #$40
|09A3A1| STA.w $02D2

;---------------------------------------------------------------------------------------------------

|09A3A4| LDX.w $02CF

|09A3A7| LDA.w $1A00,X
|09A3AA| STA.l $7EF3CD

|09A3AE| LDA.w $1A14,X
|09A3B1| STA.l $7EF3CE

|09A3B5| LDA.w $1A28,X
|09A3B8| STA.l $7EF3CF

|09A3BC| LDA.w $1A3C,X
|09A3BF| STA.l $7EF3D0

|09A3C3| LDA.b $EE
|09A3C5| STA.l $7EF3D2

|09A3C9| BRA Follower_OldManUnused

;---------------------------------------------------------------------------------------------------

.check_link_velocity
|09A3CB| LDA.b $30
|09A3CD| ORA.b $31
|09A3CF| BNE .link_moving

|09A3D1| LDA.b $1A
|09A3D3| AND.b #$03
|09A3D5| BNE .just_draw

|09A3D7| LDA.w $02D3
|09A3DA| CMP.w $02CF
|09A3DD| BEQ .just_draw

|09A3DF| SEC
|09A3E0| SBC.b #$09
|09A3E2| BPL .no_back_wrap_a

|09A3E4| CLC
|09A3E5| ADC.b #$14

.no_back_wrap_a
|09A3E7| CMP.w $02CF
|09A3EA| BNE .advance_movement_index

|09A3EC| BRL .just_draw

;---------------------------------------------------------------------------------------------------

.link_moving
|09A3EF| LDA.w $02D3
|09A3F2| SEC
|09A3F3| SBC.b #$14
|09A3F5| BPL .no_back_wrap_b

|09A3F7| CLC
|09A3F8| ADC.b #$14

.no_back_wrap_b
|09A3FA| CMP.w $02CF
|09A3FD| BNE .just_draw

;---------------------------------------------------------------------------------------------------

.advance_movement_index
|09A3FF| LDX.w $02CF
|09A402| INX
|09A403| CPX.b #$14
|09A405| BCC .no_wrap

|09A407| LDX.b #$00

.no_wrap
|09A409| STX.w $02CF

;---------------------------------------------------------------------------------------------------

.just_draw
|09A40C| BRL AnimateAndDrawFollower

;===================================================================================================

UNREACHABLE_09A40F:
|09A40F| RTS

;===================================================================================================

pool Follower_OldManUnused

.replacement_follower
|09A410| db $00 ; 0x00 - No follower
|09A411| db $00 ; 0x01 - Zelda
|09A412| db $00 ; 0x02 - Old man that stops following you
|09A413| db $02 ; 0x03 - Unused old man ⇒ FOLLOWER 02
|09A414| db $00 ; 0x04 - Normal old man
|09A415| db $00 ; 0x05 - Zelda rescue telepathy
|09A416| db $00 ; 0x06 - Blind maiden
|09A417| db $00 ; 0x07 - Frogsmith
|09A418| db $00 ; 0x08 - Smithy
|09A419| db $00 ; 0x09 - Locksmith
|09A41A| db $00 ; 0x0A - Kiki
|09A41B| db $00 ; 0x0B - Unused old man
|09A41C| db $00 ; 0x0C - Purple chest
|09A41D| db $00 ; 0x0D - Super bomb
|09A41E| db $00 ; 0x0E - Master Sword telepathy

endpool

;---------------------------------------------------------------------------------------------------

Follower_OldManUnused:
|09A41F| LDA.b #$10
|09A421| STA.b $5E

|09A423| LDA.w $0372
|09A426| BNE DoFollowerLayers

|09A428| LDA.b $4D
|09A42A| BNE DoFollowerLayers

|09A42C| LDA.b $5D
|09A42E| CMP.b #$04 ; LINKSTATE 04
|09A430| BEQ DoFollowerLayers

|09A432| STZ.b $5E

|09A434| LDA.b $5D
|09A436| CMP.b #$13 ; LINKSTATE 13
|09A438| BEQ DoFollowerLayers

|09A43A| JSR CheckFollowerProximityToLink
|09A43D| BCS DoFollowerLayers

|09A43F| JSL InitializeFollower

|09A443| LDA.l $7EF3CC
|09A447| TAX

|09A448| LDA.w .replacement_follower,X
|09A44B| STA.l $7EF3CC

|09A44F| RTS

;===================================================================================================

DoFollowerLayers:
|09A450| LDA.l $7EF3D2
|09A454| TAX

|09A455| CPX.b $EE
|09A457| BNE .layer_mismatch

|09A459| LDX.b $EE

.layer_mismatch
|09A45B| LDA.w FollowerPriority,X
|09A45E| STA.b $65
|09A460| STZ.b $64

|09A462| LDA.l $7EF3CD
|09A466| STA.b $00

|09A468| LDA.l $7EF3CE
|09A46C| STA.b $01

|09A46E| LDA.l $7EF3CF
|09A472| STA.b $02

|09A474| LDA.l $7EF3D0
|09A478| STA.b $03

|09A47A| LDX.b #$02

|09A47C| LDA.l $7EF3CC
|09A480| CMP.b #$0D ; FOLLOWER 0D
|09A482| BEQ .bomb_or_chest

|09A484| CMP.b #$0C ; FOLLOWER 0C
|09A486| BEQ .bomb_or_chest

|09A488| LDX.b #$01

.bomb_or_chest
|09A48A| TXA
|09A48B| BRL AnimateFollower_preserved

;===================================================================================================

CheckFollowerProximityToLink:
|09A48E| DEC.w $02D2
|09A491| BPL .too_far

|09A493| STZ.w $02D2

|09A496| REP #$20

|09A498| LDA.l $7EF3CD
|09A49C| SEC
|09A49D| SBC.w #$0001

|09A4A0| CMP.b $20
|09A4A2| BCS .too_far

|09A4A4| CLC
|09A4A5| ADC.w #$0014
|09A4A8| CMP.b $20
|09A4AA| BCC .too_far

|09A4AC| LDA.l $7EF3CF
|09A4B0| SEC
|09A4B1| SBC.w #$0001
|09A4B4| CMP.b $22
|09A4B6| BCS .too_far

|09A4B8| CLC
|09A4B9| ADC.w #$0014
|09A4BC| CMP.b $22
|09A4BE| BCC .too_far

;---------------------------------------------------------------------------------------------------

.good
|09A4C0| SEP #$20

|09A4C2| CLC

|09A4C3| RTS

.too_far
|09A4C4| SEP #$20

|09A4C6| SEC

|09A4C7| RTS

;===================================================================================================

pool HandleFollowerMessageTrigger

.room_id
|09A4C8| dw $00F1 ; ROOM 00F1 - old man cave
|09A4CA| dw $0061 ; ROOM 0061 - castle lobby
|09A4CC| dw $0051 ; ROOM 0051 - castle throne room
|09A4CE| dw $0002 ; ROOM 0002 - pre-sanc
|09A4D0| dw $00DB ; ROOM 00DB - TT entrance
|09A4D2| dw $00AB ; ROOM 00AB - to TT attic
|09A4D4| dw $0022 ; ROOM 0022 - sewer rats

.coordinates_uw
;              Y      X     ID     MSG   Follower
|09A4D6| dw $1EF0, $0288, $0001, $0099, $0004 ; Old man - MESSAGE 0099
|09A4E0| dw $1E58, $02F0, $0002, $009A, $0004 ; Old man - MESSAGE 009A
|09A4EA| dw $1EA8, $03B8, $0004, $009B, $0004 ; Old man - MESSAGE 009B

|09A4F4| dw $0CF8, $025B, $0001, $0021, $0001 ; Zelda - MESSAGE 0021
|09A4FE| dw $0CF8, $039D, $0002, $0021, $0001 ; Zelda - MESSAGE 0021
|09A508| dw $0C78, $0238, $0004, $0021, $0001 ; Zelda - MESSAGE 0021

|09A512| dw $0A30, $02F8, $0001, $0022, $0001 ; Zelda - MESSAGE 0022

|09A51C| dw $0178, $0550, $0001, $0023, $0001 ; Zelda - MESSAGE 0023
|09A526| dw $0168, $04F8, $0002, $002A, $0001 ; Zelda - MESSAGE 002A

|09A530| dw $1BD8, $16FC, $0001, $0124, $0006 ; Blind maiden - MESSAGE 0124

|09A53A| dw $1520, $167C, $0001, $0124, $0006 ; Blind maiden - MESSAGE 0124

|09A544| dw $05AC, $04FC, $0001, $0029, $0001 ; Zelda - MESSAGE 0029

;---------------------------------------------------------------------------------------------------

.overworld_id
|09A54E| dw $0003 ; OW 03 - West DM
|09A550| dw $005E ; OW 5E - POD
|09A552| dw $0000 ; OW 00 - Lost woods

.coordinates_ow
;              Y      X     ID     MSG   Follower
|09A554| dw $03C0, $0730, $0001, $009D, $0004 ; Old man - MESSAGE 009D

|09A55E| dw $0648, $0F50, $0000, $FFFF, $000A ; Kiki
|09A568| dw $06C8, $0D78, $0001, $FFFF, $000A ; Kiki
|09A572| dw $0688, $0C78, $0002, $FFFF, $000A ; Kiki

|09A57C| dw $00E8, $0090, $0000, $0028, $000E ; MS telepathy - MESSAGE 0028

;---------------------------------------------------------------------------------------------------

.room_boundaries_check
|09A586| dw $0000, $001E, $003C, $0046
|09A58E| dw $005A, $0064, $006E, $0078

.ow_boundaries_check
|09A596| dw $0000, $000A, $0028, $0032

endpool

;---------------------------------------------------------------------------------------------------

HandleFollowerMessageTrigger:
|09A59E| LDA.b $11
|09A5A0| BNE .fail_fast

|09A5A2| REP #$30

|09A5A4| LDY.w #$0000

|09A5A7| LDA.b $1B
|09A5A9| AND.w #$00FF
|09A5AC| BEQ .overworld

|09A5AE| INY

|09A5AF| LDX.w #$000C
|09A5B2| LDA.b $A0

.next_room_check
|09A5B4| CMP.w .room_id,X
|09A5B7| BEQ .room_match

|09A5B9| DEX
|09A5BA| DEX
|09A5BB| BPL .next_room_check

|09A5BD| BRA .fail_fast

;---------------------------------------------------------------------------------------------------

.overworld
|09A5BF| LDX.w #$0004

|09A5C2| LDA.b $8A

.next_screen_check
|09A5C4| CMP.w .overworld_id,X
|09A5C7| BEQ .overworld_match

|09A5C9| DEX
|09A5CA| DEX
|09A5CB| BPL .next_screen_check

.fail_fast
|09A5CD| BRL .exit

;---------------------------------------------------------------------------------------------------

.room_match
|09A5D0| LDA.w .room_boundaries_check+2,X
|09A5D3| STA.b $08

|09A5D5| LDA.w .room_boundaries_check+0,X
|09A5D8| TAX

.next_follower_uw
|09A5D9| STX.b $0C
|09A5DB| STZ.b $0A

|09A5DD| LDA.l $7EF3CC
|09A5E1| AND.w #$00FF
|09A5E4| CMP.w .coordinates_uw+8,X
|09A5E7| BNE .wrong_follower_uw

|09A5E9| LDA.w .coordinates_uw+0,X
|09A5EC| STA.b $00

|09A5EE| LDA.w .coordinates_uw+2,X
|09A5F1| STA.b $02

|09A5F3| LDA.w .coordinates_uw+4,X
|09A5F6| STA.b $06

|09A5F8| LDA.w .coordinates_uw+6,X
|09A5FB| STA.b $04

|09A5FD| SEP #$30

|09A5FF| JSR CheckForMessageTrigger
|09A602| BCS .trigger_activated

|09A604| REP #$30

.wrong_follower_uw
|09A606| LDA.b $0C
|09A608| CLC
|09A609| ADC.w #$000A
|09A60C| TAX

|09A60D| CPX.b $08
|09A60F| BNE .next_follower_uw

|09A611| BRL .exit

;---------------------------------------------------------------------------------------------------

.overworld_match
|09A614| LDA.w .ow_boundaries_check+2,X
|09A617| STA.b $08

|09A619| LDA.w .ow_boundaries_check+0,X
|09A61C| TAX

.next_follower_ow
|09A61D| STX.b $0C
|09A61F| STZ.b $0A

|09A621| LDA.l $7EF3CC
|09A625| AND.w #$00FF
|09A628| CMP.w .coordinates_ow+8,X
|09A62B| BNE .wrong_follower_ow

|09A62D| LDA.w .coordinates_ow+0,X
|09A630| STA.b $00

|09A632| LDA.w .coordinates_ow+2,X
|09A635| STA.b $02

|09A637| LDA.w .coordinates_ow+4,X
|09A63A| STA.b $06

|09A63C| LDA.w .coordinates_ow+6,X
|09A63F| STA.b $04

|09A641| SEP #$30

|09A643| JSR CheckForMessageTrigger
|09A646| BCS .trigger_activated

|09A648| REP #$30

.wrong_follower_ow
|09A64A| LDA.b $0C
|09A64C| CLC
|09A64D| ADC.w #$000A
|09A650| TAX

|09A651| CPX.b $08
|09A653| BNE .next_follower_ow

|09A655| BRA .exit

;---------------------------------------------------------------------------------------------------

.trigger_activated
|09A657| SEP #$10
|09A659| REP #$20

|09A65B| LDA.w $02F2
|09A65E| AND.b $06
|09A660| BNE .exit

|09A662| LDA.b $06
|09A664| TSB.w $02F2

|09A667| LDA.b $04
|09A669| STA.w $1CF0

|09A66C| CMP.w #$FFFF
|09A66F| BEQ .no_message

|09A671| CMP.w #$009D ; MESSAGE 009D
|09A674| BEQ .old_man_ow_message

|09A676| CMP.w #$0028 ; MESSAGE 0028
|09A679| BNE .continue_with_message_id

|09A67B| SEP #$20

|09A67D| LDA.b #$00
|09A67F| STA.l $7EF3CC

|09A683| BRA .continue_with_message_id

;---------------------------------------------------------------------------------------------------

.old_man_ow_message
|09A685| SEP #$20

|09A687| LDA.w $02CF
|09A68A| INC A
|09A68B| CMP.b #$14
|09A68D| BNE .dont_reset_movement_index_geezer

|09A68F| LDA.b #$00

.dont_reset_movement_index_geezer
|09A691| JSL OldMan_RevertToSprite

.continue_with_message_id
|09A695| SEP #$20

|09A697| JSL PrepAndDisplayMessage

|09A69B| BRA .exit

;---------------------------------------------------------------------------------------------------

.no_message
|09A69D| SEP #$30

|09A69F| LDA.w $02CF
|09A6A2| INC A
|09A6A3| CMP.b #$14
|09A6A5| BNE .dont_reset_movement_index_kiki

|09A6A7| LDA.b #$00

.dont_reset_movement_index_kiki
|09A6A9| PHA

|09A6AA| LDA.b $06
|09A6AC| AND.b #$03
|09A6AE| BNE .dont_revert_to_sprite

|09A6B0| PLA
|09A6B1| JSL Kiki_RevertToSprite

|09A6B5| BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_revert_to_sprite
|09A6B7| PLA
|09A6B8| STA.b $00

|09A6BA| LDX.b $8A

|09A6BC| LDA.l $7EF280,X
|09A6C0| AND.b #$01
|09A6C2| BNE .exit

|09A6C4| LDA.b $00
|09A6C6| JSL Kiki_SpawnHandler_A

;---------------------------------------------------------------------------------------------------

.exit
|09A6CA| SEP #$30

|09A6CC| RTS

;===================================================================================================

pool ActuallyDrawFollower

.props
|09A6CD| db $20, $C0, $00 ; up
|09A6D0| db $00, $A0, $00 ; down
|09A6D3| db $40, $60, $00 ; left
|09A6D6| db $40, $60, $44 ; right

|09A6D9| db $20, $C0, $04 ; up
|09A6DC| db $00, $A0, $04 ; down
|09A6DF| db $40, $80, $00 ; left
|09A6E2| db $40, $80, $44 ; right

|09A6E5| db $20, $E0, $00 ; up
|09A6E8| db $00, $E0, $00 ; down
|09A6EB| db $40, $E0, $00 ; left
|09A6EE| db $40, $E0, $44 ; right

|09A6F1| db $20, $E0, $04 ; up
|09A6F4| db $00, $E0, $04 ; down
|09A6F7| db $40, $E0, $04 ; left
|09A6FA| db $40, $E0, $40 ; right

;---------------------------------------------------------------------------------------------------

.char_offset
|09A6FD| dw  -2,   0,   0,   0 ; up
|09A705| dw  -2,   0,   0,   0
|09A70D| dw  -2,   0,   0,   0 ; down
|09A715| dw  -2,   0,   0,   0
|09A71D| dw  -1,   0,   1,   0 ; left
|09A725| dw  -1,   0,   1,   0
|09A72D| dw  -1,   0,   1,   0 ; right
|09A735| dw  -1,   0,   1,   0

|09A73D| dw   0,   0,   0,   0 ; up
|09A745| dw   0,   0,   0,   0
|09A74D| dw   0,   0,   0,   0 ; down
|09A755| dw   0,   0,   0,   0
|09A75D| dw   1,   0,   0,   0 ; left
|09A765| dw   1,   0,   0,   0
|09A76D| dw   1,   0,   0,   0 ; right
|09A775| dw   1,   0,   0,   0

|09A77D| dw   0,   0,   0,   0 ; up
|09A785| dw   0,   0,   0,   0
|09A78D| dw   0,  -3,   0,   0 ; down
|09A795| dw   0,   3,   0,   0
|09A79D| dw   1,   0,   0,   0 ; left
|09A7A5| dw   1,   0,   0,   0
|09A7AD| dw   1,  -3,   1,   0 ; right
|09A7B5| dw   1,   3,   1,   0

|09A7BD| dw   0,   0,   0,   0 ; up
|09A7C5| dw   0,   0,   0,   0
|09A7CD| dw   0,   0,   0,   0 ; down
|09A7D5| dw   0,   0,   0,   0
|09A7DD| dw   0,   0,   1,   0 ; left
|09A7E5| dw   0,   0,   1,   0
|09A7ED| dw   0,   0,   1,   0 ; right
|09A7F5| dw   0,   0,   1,   0

|09A7FD| dw  -1,   0,   0,   0 ; up
|09A805| dw  -1,   0,   0,   0
|09A80D| dw  -1,   0,   0,   0 ; down
|09A815| dw  -1,   0,   0,   0
|09A81D| dw   0,   0,   1,   0 ; left
|09A825| dw   0,   0,   1,   0
|09A82D| dw   0,   0,   1,   0 ; right
|09A835| dw   0,   0,   1,   0

|09A83D| dw   0,   0,   0,   0
|09A845| dw   0,   0,   0,   0
|09A84D| dw   0,   0,   0,   0
|09A855| dw   0,   0,   0,   0
|09A85D| dw   0,   0,   0,   0
|09A865| dw   0,   0,   0,   0
|09A86D| dw   0,   0,   0,   0
|09A875| dw   0,   0,   0,   0

|09A87D| dw   2,   0,   0,   0 ; up
|09A885| dw   2,   0,   0,   0
|09A88D| dw   2,  -1,   0,   0 ; down
|09A895| dw   2,   1,   0,   0
|09A89D| dw   3,   0,   1,   0 ; left
|09A8A5| dw   3,   0,   1,   0
|09A8AD| dw   3,  -1,   1,   0 ; right
|09A8B5| dw   3,   1,   1,   0

;---------------------------------------------------------------------------------------------------

.char_data_offset
|09A8BD| dw $0000 ; 0x00 - No follower
|09A8BF| dw $0000 ; 0x01 - Zelda
|09A8C1| dw $0080 ; 0x02 - Old man that stops following you
|09A8C3| dw $0080 ; 0x03 - Unused old man
|09A8C5| dw $0080 ; 0x04 - Normal old man
|09A8C7| dw $0000 ; 0x05 - Zelda rescue telepathy
|09A8C9| dw $0000 ; 0x06 - Blind maiden
|09A8CB| dw $00C0 ; 0x07 - Frogsmith
|09A8CD| dw $00C0 ; 0x08 - Smithy
|09A8CF| dw $0100 ; 0x09 - Locksmith
|09A8D1| dw $0180 ; 0x0A - Kiki
|09A8D3| dw $0180 ; 0x0B - Unused old man
|09A8D5| dw $0140 ; 0x0C - Purple chest
|09A8D7| dw $0140 ; 0x0D - Super bomb

.head_body_char
|09A8D9| db $D8, $24, $D8, $64
|09A8DD| db $D9, $24, $D9, $64
|09A8E1| db $DA, $24, $DA, $64
|09A8E5| db $C8, $22, $C8, $62
|09A8E9| db $C9, $22, $C9, $62
|09A8ED| db $CA, $22, $CA, $62

;---------------------------------------------------------------------------------------------------

.oam_region_offsets_a
|09A8F1| dw $0170
|09A8F3| dw $00C0

.oam_region_offsets_b
|09A8F5| dw $01C0
|09A8F7| dw $0110

;---------------------------------------------------------------------------------------------------

.palette
|09A8F9| db $00 ; 0x00 - No follower
|09A8FA| db $04 ; 0x01 - Zelda
|09A8FB| db $04 ; 0x02 - Old man that stops following you
|09A8FC| db $04 ; 0x03 - Unused old man
|09A8FD| db $04 ; 0x04 - Normal old man
|09A8FE| db $00 ; 0x05 - Zelda rescue telepathy
|09A8FF| db $07 ; 0x06 - Blind maiden
|09A900| db $04 ; 0x07 - Frogsmith
|09A901| db $04 ; 0x08 - Smithy
|09A902| db $03 ; 0x09 - Locksmith
|09A903| db $04 ; 0x0A - Kiki
|09A904| db $04 ; 0x0B - Unused old man
|09A905| db $04 ; 0x0C - Purple chest
|09A906| db $04 ; 0x0D - Super bomb

endpool

;---------------------------------------------------------------------------------------------------

AnimateAndDrawFollower:
|09A907| LDA.w $02F9
|09A90A| BEQ .do_indeed_draw

|09A90C| RTS

;---------------------------------------------------------------------------------------------------

.do_indeed_draw
|09A90D| PHX
|09A90E| PHY

|09A90F| LDX.w $02CF

|09A912| LDA.w $1A50,X
|09A915| BEQ .not_floating_outdoors

|09A917| LDA.b $1B
|09A919| BNE .not_floating_outdoors

|09A91B| LDA.b #$20
|09A91D| BRA .continue

.not_floating_outdoors
|09A91F| LDA.b $11
|09A921| CMP.b #$0E
|09A923| BNE .dont_copy_priority

|09A925| LDY.b $EE
|09A927| LDA.w FollowerPriority,Y

|09A92A| BRA .continue

;---------------------------------------------------------------------------------------------------

.dont_copy_priority
|09A92C| LDA.w $1A64,X
|09A92F| AND.b #$0C
|09A931| ASL A
|09A932| ASL A

.continue
|09A933| STA.b $65
|09A935| STZ.b $64

|09A937| LDX.w $02CF
|09A93A| BPL .no_back_wrap

|09A93C| LDX.b #$00

.no_back_wrap
|09A93E| LDA.w $1A00,X
|09A941| STA.b $00

|09A943| LDA.w $1A14,X
|09A946| STA.b $01

|09A948| LDA.w $1A28,X
|09A94B| STA.b $02

|09A94D| LDA.w $1A3C,X
|09A950| STA.b $03

|09A952| LDA.w $1A64,X

|09A955| BRA AnimateFollower

;===================================================================================================

AnimateFollower_preserved:
|09A957| PHX
|09A958| PHY

;===================================================================================================

AnimateFollower:
|09A959| STA.b $05

|09A95B| AND.b #$20
|09A95D| LSR A
|09A95E| LSR A
|09A95F| TAY

|09A960| LDA.b $05
|09A962| AND.b #$03
|09A964| STA.b $04

|09A966| STZ.b $72

|09A968| CPY.b #$08
|09A96A| BNE .low_priority

|09A96C| LDY.b #$00

|09A96E| LDA.l $7EF3CC
|09A972| CMP.b #$06 ; FOLLOWER 06
|09A974| BEQ .is_maiden

|09A976| CMP.b #$01 ; FOLLOWER 01
|09A978| BNE .low_priority

.is_maiden
|09A97A| LDY.b #$08

|09A97C| LDA.w $033C
|09A97F| ORA.w $033D
|09A982| ORA.w $033E
|09A985| ORA.w $033F
|09A988| BEQ .no_collision

|09A98A| LDA.b $1A
|09A98C| AND.b #$08
|09A98E| LSR A
|09A98F| BRA ActuallyDrawFollower

.no_collision
|09A991| LDA.b $1A
|09A993| AND.b #$10
|09A995| LSR A
|09A996| LSR A

|09A997| BRA ActuallyDrawFollower

;---------------------------------------------------------------------------------------------------

.low_priority
|09A999| LDA.b $11
|09A99B| CMP.b #$0E
|09A99D| BEQ .check_dashing

|09A99F| CMP.b #$08
|09A9A1| BEQ .check_dashing

|09A9A3| CMP.b #$10
|09A9A5| BEQ .check_dashing

|09A9A7| LDA.l $7EF3CC
|09A9AB| CMP.b #$0B ; FOLLOWER 0B
|09A9AD| BEQ .not_dashing

|09A9AF| CMP.b #$0D ; FOLLOWER 0D
|09A9B1| BEQ .super_bomb

|09A9B3| CMP.b #$0C ; FOLLOWER 0C
|09A9B5| BNE .not_purple_chest

.super_bomb
|09A9B7| LDA.l $7EF3D3
|09A9BB| BNE .immobile

;---------------------------------------------------------------------------------------------------

.not_purple_chest
|09A9BD| LDA.w $02E4
|09A9C0| BNE .immobile

|09A9C2| LDA.b $11
|09A9C4| CMP.b #$0A
|09A9C6| BEQ .immobile

|09A9C8| LDA.b $10
|09A9CA| CMP.b #$09
|09A9CC| BNE .not_overworld

|09A9CE| LDA.b $11
|09A9D0| CMP.b #$23
|09A9D2| BEQ .immobile

;---------------------------------------------------------------------------------------------------

.not_overworld
|09A9D4| LDA.b $10
|09A9D6| CMP.b #$0E
|09A9D8| BNE .not_interface

|09A9DA| LDA.b $11
|09A9DC| CMP.b #$01
|09A9DE| BEQ .immobile

|09A9E0| CMP.b #$02
|09A9E2| BEQ .immobile

;---------------------------------------------------------------------------------------------------

.not_interface
|09A9E4| LDA.b $30
|09A9E6| ORA.b $31
|09A9E8| BNE .check_dashing

.immobile
|09A9EA| LDA.b #$04
|09A9EC| STA.b $72

|09A9EE| BRA ActuallyDrawFollower

;---------------------------------------------------------------------------------------------------

.check_dashing
|09A9F0| LDA.w $0372
|09A9F3| BEQ .not_dashing

|09A9F5| LDA.b $1A
|09A9F7| AND.b #$04
|09A9F9| BRA ActuallyDrawFollower

.not_dashing
|09A9FB| LDA.b $1A
|09A9FD| AND.b #$08
|09A9FF| LSR A

;===================================================================================================

ActuallyDrawFollower:
|09AA00| CLC
|09AA01| ADC.b $04
|09AA03| STA.b $04

|09AA05| TYA
|09AA06| CLC
|09AA07| ADC.b $04
|09AA09| STA.b $04

;---------------------------------------------------------------------------------------------------

|09AA0B| REP #$20

|09AA0D| LDA.w $0FB3
|09AA10| AND.w #$00FF
|09AA13| ASL A
|09AA14| TAY

|09AA15| LDA.b $20
|09AA17| CMP.b $00
|09AA19| BEQ .check_priority_for_region
|09AA1B| BCS .use_region_b

|09AA1D| BRA .use_region_a

.check_priority_for_region
|09AA1F| LDA.b $05
|09AA21| AND.w #$0003
|09AA24| BNE .use_region_b

.use_region_a
|09AA26| LDA.w .oam_region_offsets_a,Y
|09AA29| BRA .set_region

.use_region_b
|09AA2B| LDA.w .oam_region_offsets_b,Y

.set_region
|09AA2E| PHA

|09AA2F| LSR A
|09AA30| LSR A
|09AA31| CLC
|09AA32| ADC.w #$0A20
|09AA35| STA.b $92

|09AA37| PLA
|09AA38| CLC
|09AA39| ADC.w #$0800
|09AA3C| STA.b $90

;---------------------------------------------------------------------------------------------------

|09AA3E| LDA.b $00
|09AA40| SEC
|09AA41| SBC.b $E8
|09AA43| STA.b $06

|09AA45| LDA.b $02
|09AA47| SEC
|09AA48| SBC.b $E2
|09AA4A| STA.b $08

|09AA4C| SEP #$20

|09AA4E| LDY.b #$00
|09AA50| LDX.b #$00

|09AA52| LDA.l $7EF3CC

|09AA56| CMP.b #$01 ; FOLLOWER 01
|09AA58| BEQ .girly_follower

|09AA5A| CMP.b #$06 ; FOLLOWER 06
|09AA5C| BEQ .girly_follower

|09AA5E| LDA.b $05
|09AA60| AND.b #$20
|09AA62| BEQ .girly_follower

|09AA64| BRA .not_girly_follower

.girly_follower
|09AA66| LDA.b $05
|09AA68| AND.b #$C0
|09AA6A| BNE .some_flip

|09AA6C| BRL .do_chars

.some_flip
|09AA6F| LDA.b $05
|09AA71| AND.b #$80
|09AA73| BNE .not_girly_follower

|09AA75| LDX.b #$0C

|09AA77| LDA.b $72
|09AA79| BEQ .not_girly_follower

|09AA7B| LDA.b #$00
|09AA7D| BRA .set_repri

.not_girly_follower
|09AA7F| LDA.b $1A
|09AA81| AND.b #$07
|09AA83| BNE .dont_shimmy

|09AA85| LDA.w $02D7
|09AA88| INC A
|09AA89| CMP.b #$03
|09AA8B| BNE .set_repri

|09AA8D| LDA.b #$00

.set_repri
|09AA8F| STA.w $02D7

;---------------------------------------------------------------------------------------------------

.dont_shimmy
|09AA92| LDA.w $02D7
|09AA95| ASL A
|09AA96| ASL A
|09AA97| STA.b $05

|09AA99| TXA
|09AA9A| CLC
|09AA9B| ADC.b $05
|09AA9D| TAX

|09AA9E| REP #$20

|09AAA0| LDA.b $06
|09AAA2| CLC
|09AAA3| ADC.w #$0010
|09AAA6| STA.b $00

|09AAA8| LDA.b $08
|09AAAA| STA.b $02

|09AAAC| STZ.b $74

;---------------------------------------------------------------------------------------------------

|09AAAE| SEP #$20

|09AAB0| JSR CalculateFollowerOAMCoords

|09AAB3| LDA.w .head_body_char+0,X
|09AAB6| STA.b ($90),Y

|09AAB8| INY

|09AAB9| LDA.w .head_body_char+1,X
|09AABC| STA.b ($90),Y

|09AABE| INY

|09AABF| PHY
|09AAC0| TYA
|09AAC1| SEC
|09AAC2| SBC.b #$04

|09AAC4| LSR A
|09AAC5| LSR A
|09AAC6| TAY

|09AAC7| LDA.b #$00
|09AAC9| ORA.b $75
|09AACB| STA.b ($92),Y

|09AACD| PLY

;---------------------------------------------------------------------------------------------------

|09AACE| REP #$20

|09AAD0| LDA.b $02
|09AAD2| CLC
|09AAD3| ADC.w #$0008
|09AAD6| STA.b $02

|09AAD8| STZ.b $74

|09AADA| SEP #$20

|09AADC| JSR CalculateFollowerOAMCoords

|09AADF| LDA.w .head_body_char+2,X
|09AAE2| STA.b ($90),Y

|09AAE4| INY

|09AAE5| LDA.w .head_body_char+3,X
|09AAE8| STA.b ($90),Y

|09AAEA| INY

|09AAEB| PHY

|09AAEC| TYA
|09AAED| SEC
|09AAEE| SBC.b #$04

|09AAF0| LSR A
|09AAF1| LSR A
|09AAF2| TAY

|09AAF3| LDA.b #$00
|09AAF5| ORA.b $75
|09AAF7| STA.b ($92),Y

|09AAF9| PLY

;---------------------------------------------------------------------------------------------------

.do_chars
|09AAFA| LDA.l $7EF3CC
|09AAFE| TAX

|09AAFF| LDA.w .palette,X
|09AB02| CMP.b #$07
|09AB04| BNE .not_link_palette_a

|09AB06| TAX

|09AB07| LDA.w $0ABD
|09AB0A| BEQ .no_trans_a

|09AB0C| LDX.b #$00

.no_trans_a
|09AB0E| TXA

;---------------------------------------------------------------------------------------------------

.not_link_palette_a
|09AB0F| ASL A
|09AB10| STA.b $72

|09AB12| LDA.l $7EF3CC
|09AB16| CMP.b #$0D ; FOLLOWER 0D
|09AB18| BNE .not_exploding_superbomb

|09AB1A| LDA.w $04B4
|09AB1D| CMP.b #$01
|09AB1F| BNE .not_exploding_superbomb

|09AB21| LDA.b $1A
|09AB23| AND.b #$07
|09AB25| ASL A
|09AB26| STA.b $72

;---------------------------------------------------------------------------------------------------

.not_exploding_superbomb
|09AB28| LDA.l $7EF3CC
|09AB2C| CMP.b #$0D ; FOLLOWER 0D
|09AB2E| BEQ .bomb_or_chest

|09AB30| CMP.b #$0C ; FOLLOWER 0C
|09AB32| BEQ .bomb_or_chest

;---------------------------------------------------------------------------------------------------

|09AB34| REP #$30

|09AB36| PHY

|09AB37| LDA.b $04
|09AB39| AND.w #$00FF
|09AB3C| ASL A
|09AB3D| ASL A
|09AB3E| ASL A
|09AB3F| TAY

|09AB40| LDA.l $7EF3CC
|09AB44| AND.w #$00FF
|09AB47| ASL A
|09AB48| TAX

|09AB49| TYA
|09AB4A| CLC
|09AB4B| ADC.w .char_data_offset,X
|09AB4E| TAX

|09AB4F| LDA.w .char_offset+0,X
|09AB52| CLC
|09AB53| ADC.b $06
|09AB55| STA.b $00

|09AB57| LDA.w .char_offset+2,X
|09AB5A| CLC
|09AB5B| ADC.b $08
|09AB5D| STA.b $02

|09AB5F| PLY

;---------------------------------------------------------------------------------------------------

|09AB60| SEP #$30

|09AB62| JSR CalculateFollowerOAMCoords

|09AB65| LDA.b #$20
|09AB67| STA.b ($90),Y

|09AB69| INY

|09AB6A| LDA.b $04
|09AB6C| ASL A
|09AB6D| CLC
|09AB6E| ADC.b $04
|09AB70| TAX

|09AB71| LDA.w .props+0,X
|09AB74| STA.w $0AE8

|09AB77| LDA.w .props+2,X
|09AB7A| AND.b #$F0
|09AB7C| ORA.b $72
|09AB7E| ORA.b $65
|09AB80| STA.b ($90),Y

|09AB82| INY
|09AB83| PHY

|09AB84| TYA
|09AB85| SEC
|09AB86| SBC.b #$04
|09AB88| LSR A
|09AB89| LSR A
|09AB8A| TAY

|09AB8B| LDA.b #$02
|09AB8D| ORA.b $75
|09AB8F| STA.b ($92),Y

|09AB91| PLY

;---------------------------------------------------------------------------------------------------

.bomb_or_chest
|09AB92| REP #$30

|09AB94| PHY

|09AB95| LDA.b $04
|09AB97| AND.w #$00FF
|09AB9A| ASL A
|09AB9B| ASL A
|09AB9C| ASL A
|09AB9D| TAY

|09AB9E| LDA.l $7EF3CC
|09ABA2| AND.w #$00FF
|09ABA5| ASL A
|09ABA6| TAX

|09ABA7| TYA
|09ABA8| CLC
|09ABA9| ADC.w .char_data_offset,X
|09ABAC| TAX

|09ABAD| LDA.w .char_offset+4,X
|09ABB0| CLC
|09ABB1| ADC.b $06
|09ABB3| CLC
|09ABB4| ADC.w #$0008
|09ABB7| STA.b $00

|09ABB9| LDA.w .char_offset+6,X
|09ABBC| CLC
|09ABBD| ADC.b $08
|09ABBF| STA.b $02

|09ABC1| PLY

;---------------------------------------------------------------------------------------------------

|09ABC2| SEP #$30

|09ABC4| JSR CalculateFollowerOAMCoords

|09ABC7| LDA.b #$22
|09ABC9| STA.b ($90),Y

|09ABCB| INY

|09ABCC| LDA.b $04
|09ABCE| ASL A
|09ABCF| CLC
|09ABD0| ADC.b $04
|09ABD2| TAX

|09ABD3| LDA.w .props+1,X
|09ABD6| STA.w $0AEA

|09ABD9| LDA.w .props+2,X
|09ABDC| AND.b #$0F

|09ABDE| ASL A
|09ABDF| ASL A
|09ABE0| ASL A
|09ABE1| ASL A

|09ABE2| ORA.b $72
|09ABE4| ORA.b $65
|09ABE6| STA.b ($90),Y

|09ABE8| INY

|09ABE9| TYA
|09ABEA| SEC
|09ABEB| SBC.b #$04
|09ABED| LSR A
|09ABEE| LSR A
|09ABEF| TAY

|09ABF0| LDA.b #$02
|09ABF2| ORA.b $75
|09ABF4| STA.b ($92),Y

;---------------------------------------------------------------------------------------------------

|09ABF6| PLY
|09ABF7| PLX

|09ABF8| RTS

;===================================================================================================

CalculateFollowerOAMCoords:
|09ABF9| REP #$20

|09ABFB| LDA.b $02
|09ABFD| STA.b ($90),Y

|09ABFF| INY

|09AC00| CLC
|09AC01| ADC.w #$0080
|09AC04| CMP.w #$0180
|09AC07| BCS .off_screen

|09AC09| LDA.b $02
|09AC0B| AND.w #$0100
|09AC0E| STA.b $74

|09AC10| LDA.b $00
|09AC12| STA.b ($90),Y

|09AC14| CLC
|09AC15| ADC.w #$0010
|09AC18| CMP.w #$0100
|09AC1B| BCC .on_screen

.off_screen
|09AC1D| LDA.w #$00F0
|09AC20| STA.b ($90),Y

.on_screen
|09AC22| SEP #$20

|09AC24| INY

|09AC25| RTS

;===================================================================================================

CheckForMessageTrigger:
|09AC26| REP #$20

|09AC28| LDA.b $00
|09AC2A| CLC
|09AC2B| ADC.b $0A
|09AC2D| CLC
|09AC2E| ADC.w #$0008
|09AC31| STA.b $00

|09AC33| LDA.b $02
|09AC35| CLC
|09AC36| ADC.w #$0008
|09AC39| STA.b $02

|09AC3B| LDA.b $20
|09AC3D| CLC
|09AC3E| ADC.w #$000C
|09AC41| SEC
|09AC42| SBC.b $00
|09AC44| BPL .positive_y

|09AC46| EOR.w #$FFFF
|09AC49| INC A

.positive_y
|09AC4A| CMP.w #$001C
|09AC4D| BCS .no_trigger

|09AC4F| LDA.b $22
|09AC51| CLC
|09AC52| ADC.w #$000C
|09AC55| SEC
|09AC56| SBC.b $02
|09AC58| BPL .positive_x

|09AC5A| EOR.w #$FFFF
|09AC5D| INC A

.positive_x
|09AC5E| CMP.w #$0018
|09AC61| BCS .no_trigger

;---------------------------------------------------------------------------------------------------

.trigger
|09AC63| SEP #$20
|09AC65| SEC

|09AC66| RTS

.no_trigger
|09AC67| SEP #$20
|09AC69| CLC

|09AC6A| RTS

;===================================================================================================

TerminateSelectInteractives:
|09AC6B| PHB
|09AC6C| PHK
|09AC6D| PLB

|09AC6E| LDX.b #$05

.next_slot
|09AC70| LDA.w $0C4A,X
|09AC73| CMP.b #$3E ; ANCILLA 3E
|09AC75| BNE .not_crystal

|09AC77| TXY

|09AC78| BRA .check_carrying

.not_crystal
|09AC7A| LDA.w $0C4A,X
|09AC7D| CMP.b #$2C ; ANCILLA 2C
|09AC7F| BNE .check_carrying

|09AC81| STZ.w $0646

|09AC84| LDA.b $48
|09AC86| AND.b #$80
|09AC88| BEQ .check_carrying

|09AC8A| STZ.b $48
|09AC8C| STZ.b $5E

.check_carrying
|09AC8E| LDA.w $0308
|09AC91| BPL .not_carrying

|09AC93| TXA
|09AC94| INC A
|09AC95| CMP.w $02EC
|09AC98| BEQ .nothing_nearby

|09AC9A| BRA .delete_ancilla

;---------------------------------------------------------------------------------------------------

.not_carrying
|09AC9C| TXA
|09AC9D| INC A
|09AC9E| CMP.w $02EC
|09ACA1| BNE .delete_ancilla

|09ACA3| STZ.w $02EC

.delete_ancilla
|09ACA6| STZ.w $0C4A,X

.nothing_nearby
|09ACA9| DEX
|09ACAA| BPL .next_slot

;---------------------------------------------------------------------------------------------------

|09ACAC| LDA.w $037A
|09ACAF| AND.b #$10
|09ACB1| BEQ .not_netting

|09ACB3| STZ.b $46
|09ACB5| STZ.w $037A

.not_netting
|09ACB8| STZ.w $03F0

|09ACBB| STZ.w $02F2
|09ACBE| STZ.w $02F3

|09ACC1| STZ.w $035F
|09ACC4| STZ.w $03FC

|09ACC7| STZ.w $037B
|09ACCA| STZ.w $03FD

|09ACCD| STZ.w $0360

;---------------------------------------------------------------------------------------------------

|09ACD0| LDA.b $5D
|09ACD2| CMP.b #$13 ; LINKSTATE 13
|09ACD4| BNE .not_hooking

|09ACD6| LDA.b #$00 ; LINKSTATE 00
|09ACD8| STA.b $5D

|09ACDA| LDA.b $3A
|09ACDC| AND.b #$BF
|09ACDE| STA.b $3A

|09ACE0| LDA.b $50
|09ACE2| AND.b #$FE
|09ACE4| STA.b $50

|09ACE6| LDA.w $037A
|09ACE9| AND.b #$FB
|09ACEB| STA.w $037A

|09ACEE| STZ.w $037E

;---------------------------------------------------------------------------------------------------

.not_hooking
|09ACF1| PLB

|09ACF2| RTL

;===================================================================================================

RemoveKikiAndLocksmith:
|09ACF3| LDA.l $7EF3CC
|09ACF7| CMP.b #$0A ; FOLLOWER 0A
|09ACF9| BEQ .kiki

|09ACFB| CMP.b #$09 ; FOLLOWER 09
|09ACFD| BNE .exit

.kiki
|09ACFF| LDA.b #$00
|09AD01| STA.l $7EF3CC

.exit
|09AD05| RTL

;===================================================================================================

SetAncillaCoordinates:
|09AD06| LDA.b $00
|09AD08| STA.w $0BFA,X

|09AD0B| LDA.b $01
|09AD0D| STA.w $0C0E,X

|09AD10| LDA.b $02
|09AD12| STA.w $0C04,X

|09AD15| LDA.b $03
|09AD17| STA.w $0C18,X

|09AD1A| RTS

;===================================================================================================

CopyAncillaCoordinates:
|09AD1B| LDA.w $0BFA,X
|09AD1E| STA.b $00

|09AD20| LDA.w $0C0E,X
|09AD23| STA.b $01

|09AD25| LDA.w $0C04,X
|09AD28| STA.b $02

|09AD2A| LDA.w $0C18,X
|09AD2D| STA.b $03

|09AD2F| RTS

;===================================================================================================

AncillaAdd_ExplodingSomariaBlock:
|09AD30| PHB
|09AD31| PHK
|09AD32| PLB

|09AD33| LDA.b #$2E ; ANCILLA 2E
|09AD35| STA.w $0C4A,X

|09AD38| PHX

|09AD39| TAX

|09AD3A| LDA.l AncillaObjectAllocation,X

|09AD3E| PLX

|09AD3F| STA.w $0C90,X

|09AD42| LDA.b #$03
|09AD44| STA.w $03B1,X

|09AD47| STZ.w $0C54,X
|09AD4A| STZ.w $0C5E,X

|09AD4D| STZ.w $039F,X
|09AD50| STZ.w $03A4,X

|09AD53| STZ.w $03EA,X
|09AD56| STZ.w $0280,X

|09AD59| STZ.w $0646

|09AD5C| JSL CalculateAncillaSFXPan
|09AD60| ORA.b #$01 ; SFX3.01
|09AD62| STA.w $012F

|09AD65| PLB

|09AD66| RTL

;===================================================================================================

pool Ancilla_AddRupees

.value
|09AD67| db   1
|09AD68| db   5
|09AD69| db  20
|09AD6A| db 100
|09AD6B| db  50

endpool

;---------------------------------------------------------------------------------------------------

Ancilla_AddRupees:
|09AD6C| PHB
|09AD6D| PHK
|09AD6E| PLB

|09AD6F| LDA.w $0C5E,X
|09AD72| CMP.b #$34 ; ITEMGET 34
|09AD74| BEQ .low

|09AD76| CMP.b #$35 ; ITEMGET 35
|09AD78| BEQ .low

|09AD7A| CMP.b #$36 ; ITEMGET 36
|09AD7C| BEQ .low

|09AD7E| CMP.b #$40 ; ITEMGET 40
|09AD80| BEQ .big

|09AD82| CMP.b #$41 ; ITEMGET 41
|09AD84| BEQ .big

|09AD86| CMP.b #$46 ; ITEMGET 46
|09AD88| BEQ .absolutely_massive

|09AD8A| CMP.b #$47 ; ITEMGET 47
|09AD8C| BNE .not_rupees

;---------------------------------------------------------------------------------------------------

.absolutely_massive
|09AD8E| LDY.b #$02
|09AD90| CMP.b #$47 ; ITEMGET 47
|09AD92| BEQ .add_value

|09AD94| LDA.b #$2C
|09AD96| STA.b $00

|09AD98| LDA.b #$01
|09AD9A| STA.b $01

|09AD9C| BRA .add_to_purse

;---------------------------------------------------------------------------------------------------

.big
|09AD9E| SEC
|09AD9F| SBC.b #$40 ; ITEMGET 40
|09ADA1| CLC
|09ADA2| ADC.b #$03
|09ADA4| TAY

|09ADA5| BRA .add_value

;---------------------------------------------------------------------------------------------------

.low
|09ADA7| SEC
|09ADA8| SBC.b #$34 ; ITEMGET 34
|09ADAA| TAY

;---------------------------------------------------------------------------------------------------

.add_value
|09ADAB| LDA.w .value,Y
|09ADAE| STA.b $00
|09ADB0| STZ.b $01

;---------------------------------------------------------------------------------------------------

.add_to_purse
|09ADB2| REP #$20

|09ADB4| LDA.l $7EF360
|09ADB8| CLC
|09ADB9| ADC.b $00
|09ADBB| STA.l $7EF360

;---------------------------------------------------------------------------------------------------

|09ADBF| SEP #$20
|09ADC1| SEC

|09ADC2| PLB

|09ADC3| RTL

;---------------------------------------------------------------------------------------------------

.not_rupees
|09ADC4| CLC

|09ADC5| PLB

|09ADC6| RTL

;===================================================================================================

TerminateSparkles:
|09ADC7| PHX

|09ADC8| LDX.b #$04

.next_slot
|09ADCA| LDA.w $0C4A,X

|09ADCD| CMP.b #$2A ; ANCILLA 2A
|09ADCF| BEQ .delete_this

|09ADD1| CMP.b #$2B ; ANCILLA 2B
|09ADD3| BEQ .delete_this

|09ADD5| CMP.b #$30 ; ANCILLA 30
|09ADD7| BEQ .delete_this

|09ADD9| CMP.b #$31 ; ANCILLA 31
|09ADDB| BEQ .delete_this

|09ADDD| CMP.b #$18 ; ANCILLA 18
|09ADDF| BEQ .delete_this

|09ADE1| CMP.b #$19 ; ANCILLA 19
|09ADE3| BEQ .delete_this

|09ADE5| CMP.b #$0C ; ANCILLA 0C
|09ADE7| BNE .skip

.delete_this
|09ADE9| STZ.w $0C4A,X

.skip
|09ADEC| DEX
|09ADED| BPL .next_slot

;---------------------------------------------------------------------------------------------------

|09ADEF| PLX

|09ADF0| RTL

;===================================================================================================

pool DashDust_Motive

.char
|09ADF1| db $A9, $CF, $DF

endpool

;---------------------------------------------------------------------------------------------------

DashDust_Motive:
|09ADF4| PHB
|09ADF5| PHK
|09ADF6| PLB

|09ADF7| LDA.w $0C68,X
|09ADFA| BNE .delay

|09ADFC| LDA.b #$03
|09ADFE| STA.w $0C68,X

|09AE01| INC.w $0C5E,X

|09AE04| LDA.w $0C5E,X
|09AE07| CMP.b #$03
|09AE09| BNE .delay

|09AE0B| STZ.w $0C4A,X

|09AE0E| BRA .exit

.delay
|09AE10| LDA.b $2F
|09AE12| CMP.b #$02
|09AE14| BNE .not_behind

|09AE16| LDA.b #$04
|09AE18| JSL AllocateOAMInRegionB

.not_behind
|09AE1C| JSL Ancilla_PrepOAMCoord_long

|09AE20| PHX

|09AE21| LDA.w $0C5E,X
|09AE24| TAX

|09AE25| LDY.b #$00

|09AE27| JSL Ancilla_SetOAM_XY_long

|09AE2B| LDA.w .char,X
|09AE2E| STA.b ($90),Y

|09AE30| INY

|09AE31| LDA.b #$04
|09AE33| ORA.b $65
|09AE35| STA.b ($90),Y

|09AE37| LDA.b #$00
|09AE39| STA.b ($92)

|09AE3B| PLX

.exit
|09AE3C| PLB

|09AE3D| RTL

;===================================================================================================
; FREE ROM: 0x02
;===================================================================================================
NULL_09AE3E:
|09AE3E| db $FF, $FF

;===================================================================================================

SpawnSuperficialExplosion:
|09AE40| LDA.b #$4A ; SPRITE 4A
|09AE42| JSL SpawnSpriteDynamically
|09AE46| BMI .exit

|09AE48| LDA.b #$06
|09AE4A| STA.w $0DD0,Y

|09AE4D| LDA.b #$1F
|09AE4F| STA.w $0E00,Y

|09AE52| LDA.b #$03
|09AE54| STA.w $0DB0,Y
|09AE57| STA.w $0E40,Y

|09AE5A| INC A
|09AE5B| STA.w $0F50,Y

|09AE5E| LDA.b #$15 ; SFX2.15
|09AE60| JSL QueueSpriteSFX2WithPan

;===================================================================================================

#SetSpawnedSpriteCoordinates:
|09AE64| LDA.b $00
|09AE66| STA.w $0D10,Y

|09AE69| LDA.b $01
|09AE6B| STA.w $0D30,Y

|09AE6E| LDA.b $02
|09AE70| STA.w $0D00,Y

|09AE73| LDA.b $03
|09AE75| STA.w $0D20,Y

|09AE78| LDA.b $04
|09AE7A| STA.w $0F70,Y

.exit
|09AE7D| RTL

;===================================================================================================

SpawnDummyDeathAnimation:
|09AE7E| LDA.b #$0B ; SPRITE 0B
|09AE80| JSL SpawnSpriteDynamically
|09AE84| BMI .exit

|09AE86| JSL SetSpawnedSpriteCoordinates

|09AE8A| LDA.b #$06
|09AE8C| STA.w $0DD0,Y

|09AE8F| LDA.b #$0F
|09AE91| STA.w $0DF0,Y

|09AE94| LDA.b #$14 ; SFX2.14
|09AE96| JSL QueueSpriteSFX2WithPan

|09AE9A| LDA.b #$02
|09AE9C| STA.w $0F20,Y

.exit
|09AE9F| RTL

;===================================================================================================

pool SpawnCursedLightning

.speed_x
|09AEA0| db  -8,  -4,   4,   8

.initial_cycle
|09AEA4| db $00, $11, $22, $33

endpool

;---------------------------------------------------------------------------------------------------

SpawnCursedLightning:
|09AEA8| JSL .spawn_bolt
|09AEAC| JSL .spawn_bolt
|09AEB0| JSL .spawn_bolt

;---------------------------------------------------------------------------------------------------

.spawn_bolt
|09AEB4| LDA.b #$3A ; SPRITE 3A
|09AEB6| JSL SpawnSpriteDynamically
|09AEBA| BMI .exit

|09AEBC| LDA.b #$01 ; SFX3.01
|09AEBE| JSL QueueSpriteSFX3WithPan

;---------------------------------------------------------------------------------------------------

|09AEC2| JSL SetSpawnedSpriteCoordinates

|09AEC6| LDA.b $00
|09AEC8| CLC
|09AEC9| ADC.b #$04
|09AECB| STA.w $0D10,Y

|09AECE| LDA.b $01
|09AED0| ADC.b #$00
|09AED2| STA.w $0D30,Y

|09AED5| LDA.b $02
|09AED7| CLC
|09AED8| ADC.b #$0C
|09AEDA| PHP

|09AEDB| SEC
|09AEDC| SBC.w $0F70,X
|09AEDF| STA.w $0D00,Y

|09AEE2| LDA.b $03
|09AEE4| SBC.b #$00

|09AEE6| PLP
|09AEE7| ADC.b #$00
|09AEE9| STA.w $0D20,Y

;---------------------------------------------------------------------------------------------------

|09AEEC| LDA.b #$00
|09AEEE| STA.w $0F70,Y

|09AEF1| LDA.b #$18
|09AEF3| STA.w $0D40,Y
|09AEF6| STA.w $0EB0,Y
|09AEF9| STA.w $0BA0,Y

|09AEFC| LDA.b #$80
|09AEFE| STA.w $0E40,Y

|09AF01| LDA.b #$03
|09AF03| STA.w $0E60,Y

|09AF06| AND.b #$03
|09AF08| STA.w $0F50,Y

|09AF0B| LDA.b #$20
|09AF0D| STA.w $0DF0,Y

|09AF10| LDA.b #$02
|09AF12| STA.w $0DC0,Y

;---------------------------------------------------------------------------------------------------

|09AF15| PHX

|09AF16| LDA.w $0ED0,X
|09AF19| TAX

|09AF1A| LDA.l .speed_x,X
|09AF1E| STA.w $0D50,Y

|09AF21| LDA.l .initial_cycle,X
|09AF25| STA.w $0E80,Y

|09AF28| LDA.b #$02
|09AF2A| STA.w $0F20,Y

|09AF2D| PLX

|09AF2E| INC.w $0ED0,X

;---------------------------------------------------------------------------------------------------

.exit
|09AF31| RTL

;===================================================================================================

CheckIfScreenIsClear:
|09AF32| PHX
|09AF33| LDX.b #$0F

.next_sprite
|09AF35| LDA.w $0DD0,X
|09AF38| BEQ .ignorable_sprite

|09AF3A| LDA.w $0F60,X
|09AF3D| AND.b #$40
|09AF3F| BNE .ignorable_sprite

|09AF41| LDA.w $0D10,X
|09AF44| CMP.b $E2

|09AF46| LDA.w $0D30,X
|09AF49| SBC.b $E3
|09AF4B| BNE .ignorable_sprite

|09AF4D| LDA.w $0D00,X
|09AF50| CMP.b $E8

|09AF52| LDA.w $0D20,X
|09AF55| SBC.b $E9
|09AF57| BNE .ignorable_sprite

.fail
|09AF59| PLX

|09AF5A| CLC

|09AF5B| RTL

.ignorable_sprite
|09AF5C| DEX
|09AF5D| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|09AF5F| BRA CheckIfOverlordsClear

;===================================================================================================

CheckIfRoomIsClear:
|09AF61| PHX
|09AF62| LDX.b #$0F

.next_sprite
|09AF64| LDA.w $0DD0,X
|09AF67| BEQ .ignorable_sprite

|09AF69| LDA.w $0F60,X
|09AF6C| AND.b #$40
|09AF6E| BNE .ignorable_sprite

;---------------------------------------------------------------------------------------------------

#FailBecauseOverlordsNotClear:
|09AF70| PLX
|09AF71| CLC

|09AF72| RTL

.ignorable_sprite
|09AF73| DEX
|09AF74| BPL .next_sprite

;===================================================================================================

CheckIfOverlordsClear:
|09AF76| LDX.b #$07

.next_overlord
|09AF78| LDA.w $0B00,X
|09AF7B| CMP.b #$14 ; OVERLORD 14
|09AF7D| BEQ FailBecauseOverlordsNotClear

|09AF7F| CMP.b #$18 ; OVERLORD 18
|09AF81| BEQ FailBecauseOverlordsNotClear

|09AF83| DEX
|09AF84| BPL .next_overlord

;---------------------------------------------------------------------------------------------------

|09AF86| PLX

|09AF87| SEC

|09AF88| RTL

;===================================================================================================

InitializeMirrorPortal:
|09AF89| PHB
|09AF8A| PHK
|09AF8B| PLB

|09AF8C| LDX.b #$0F

.next_sprite
|09AF8E| LDA.w $0DD0,X
|09AF91| BEQ .skip_sprite

|09AF93| LDA.w $0E20,X
|09AF96| CMP.b #$6C ; SPRITE 6C
|09AF98| BNE .skip_sprite

|09AF9A| STZ.w $0DD0,X

.skip_sprite
|09AF9D| DEX
|09AF9E| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|09AFA0| LDA.b #$6C ; SPRITE 6C
|09AFA2| JSL SpawnSpriteDynamically
|09AFA6| BPL .free_slot

|09AFA8| LDY.b #$00

.free_slot
|09AFAA| LDA.l $001ABF
|09AFAE| STA.w $0D10,Y

|09AFB1| LDA.l $001ACF
|09AFB5| STA.w $0D30,Y

|09AFB8| LDA.l $001ADF
|09AFBC| CLC
|09AFBD| ADC.b #$08
|09AFBF| STA.w $0D00,Y

|09AFC2| LDA.l $001AEF
|09AFC6| ADC.b #$00
|09AFC8| STA.w $0D20,Y

|09AFCB| LDA.b #$00
|09AFCD| STA.w $0F20,Y

|09AFD0| INC A
|09AFD1| STA.w $0BA0,Y

|09AFD4| PLB

|09AFD5| RTL

;===================================================================================================

InitializeSpriteSlots:
|09AFD6| PHB
|09AFD7| PHK
|09AFD8| PLB

|09AFD9| LDX.b #$0F

.next_sprite
|09AFDB| LDA.w $0DD0,X
|09AFDE| BEQ .skip_sprite

|09AFE0| LDY.w $0E20,X
|09AFE3| CMP.b #$0A
|09AFE5| BNE .not_carried

|09AFE7| CPY.b #$EC ; SPRITE EC
|09AFE9| BEQ .skip_sprite

|09AFEB| CPY.b #$D2 ; SPRITE D2
|09AFED| BEQ .skip_sprite

|09AFEF| STZ.w $0309
|09AFF2| STZ.w $0308

|09AFF5| BRA .kill_sprite

.not_carried
|09AFF7| CPY.b #$6C ; SPRITE 6C
|09AFF9| BEQ .skip_sprite

|09AFFB| LDA.w $0C9A,X
|09AFFE| CMP.w $040A
|09B001| BEQ .skip_sprite

.kill_sprite
|09B003| STZ.w $0DD0,X

.skip_sprite
|09B006| DEX
|09B007| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|09B009| LDX.b #$07

.next_overlord
|09B00B| LDA.w $0B00,X
|09B00E| BEQ .skip_overlord

|09B010| LDA.w $0CCA,X
|09B013| CMP.w $040A
|09B016| BEQ .skip_overlord

|09B018| STZ.w $0B00,X

.skip_overlord
|09B01B| DEX
|09B01C| BPL .next_overlord

;---------------------------------------------------------------------------------------------------

|09B01E| PLB

|09B01F| RTL

;===================================================================================================

SpawnFireballTail:
|09B020| TXA
|09B021| EOR.b $1A
|09B023| AND.b #$03
|09B025| BNE .exit

|09B027| PHX

|09B028| LDX.b #$1D

.next_check
|09B02A| LDA.l $7FF800,X
|09B02E| BEQ .free_slot

|09B030| DEX
|09B031| BPL .next_check

|09B033| PLX

.exit
|09B034| RTL

;---------------------------------------------------------------------------------------------------

.free_slot
|09B035| LDA.b #$08 ; GARNISH 08
|09B037| STA.l $7FF800,X
|09B03B| STA.w $0FB4

|09B03E| LDA.b #$0B
|09B040| STA.l $7FF90E,X

|09B044| LDA.w $0FD8
|09B047| STA.l $7FF83C,X

|09B04B| LDA.w $0FD9
|09B04E| STA.l $7FF878,X

|09B052| LDA.w $0FDA
|09B055| CLC
|09B056| ADC.b #$10
|09B058| STA.l $7FF81E,X

|09B05C| LDA.w $0FDB
|09B05F| ADC.b #$00
|09B061| STA.l $7FF85A,X

|09B065| LDA.w $0FA0
|09B068| STA.l $7FF92C,X

|09B06C| PLX

|09B06D| RTL

;===================================================================================================

HandleUpperGarnishSlots_long:
|09B06E| JSL HandleScreenFlash

|09B072| LDA.w $0FB4
|09B075| BEQ .exit

|09B077| PHB
|09B078| PHK
|09B079| PLB

|09B07A| JSR HandleUpperGarnishSlots

|09B07D| PLB

.exit
|09B07E| RTL

;===================================================================================================

HandleLowerGarnishSlots_long:
|09B07F| LDA.w $0FB4
|09B082| BEQ .exit

|09B084| PHB
|09B085| PHK
|09B086| PLB

|09B087| JSR HandleLowerGarnishSlots

|09B08A| PLB

.exit
|09B08B| RTL

;===================================================================================================

HandleUpperGarnishSlots:
|09B08C| LDX.b #$1D

.next
|09B08E| JSR HandleSingleGarnish

|09B091| DEX
|09B092| CPX.b #$0E
|09B094| BNE .next

|09B096| RTS

;===================================================================================================

HandleLowerGarnishSlots:
|09B097| LDX.b #$0E

.next
|09B099| JSR HandleSingleGarnish

|09B09C| DEX
|09B09D| BPL .next

|09B09F| RTS

;===================================================================================================

pool HandleSingleGarnish

.object_allocation
|09B0A0| db $04 ; Fire snake tail
|09B0A1| db $04 ; Mothula beam trail
|09B0A2| db $04 ; Falling tile
|09B0A3| db $04 ; Laser trail
|09B0A4| db $04 ; Sparkle
|09B0A5| db $04 ; Zoro trail
|09B0A6| db $04 ; Babasu flash
|09B0A7| db $04 ; Kholdstare trail
|09B0A8| db $04 ; Lightning trail
|09B0A9| db $04 ; Cannon smoke
|09B0AA| db $04 ; Water trail
|09B0AB| db $04 ; Trinexx ice breath
|09B0AC| db $04 ; Null pointer
|09B0AD| db $04 ; Trinexx fire breath
|09B0AE| db $04 ; Blind laser trail
|09B0AF| db $04 ; Ganon bat flame
|09B0B0| db $08 ; Withering bat flame
|09B0B1| db $04 ; Sparkle
|09B0B2| db $04 ; Pyramid debris
|09B0B3| db $04 ; Running kid dash dust
|09B0B4| db $08 ; Arrghus splash
|09B0B5| db $10 ; Thrown item debris

endpool

;---------------------------------------------------------------------------------------------------

HandleSingleGarnish:
|09B0B6| STX.w $0FA0

|09B0B9| LDA.l $7FF800,X
|09B0BD| BEQ .exit

|09B0BF| CMP.b #$05
|09B0C1| BEQ .ignore_submodule

|09B0C3| LDA.b $11
|09B0C5| ORA.w $0FC1
|09B0C8| BNE .dont_terminate

.ignore_submodule
|09B0CA| LDA.l $7FF90E,X
|09B0CE| BEQ .dont_terminate

|09B0D0| DEC A
|09B0D1| STA.l $7FF90E,X
|09B0D5| BNE .dont_terminate

|09B0D7| STA.l $7FF800,X

|09B0DB| BRA .exit

;---------------------------------------------------------------------------------------------------

.dont_terminate
|09B0DD| LDY.w $0FB3
|09B0E0| BEQ .ignore_layer

|09B0E2| LDA.l $7FF968,X
|09B0E6| BEQ .lower_layer

;---------------------------------------------------------------------------------------------------

|09B0E8| LDA.l $7FF800,X
|09B0EC| TAY

|09B0ED| LDA.w .object_allocation-1,Y
|09B0F0| JSL AllocateOAMInRegionF

|09B0F4| BRA .run_ai

;---------------------------------------------------------------------------------------------------

.lower_layer
|09B0F6| LDA.l $7FF800,X
|09B0FA| TAY

|09B0FB| LDA.w .object_allocation-1,Y
|09B0FE| JSL AllocateOAMInRegionD

|09B102| BRA .run_ai

;---------------------------------------------------------------------------------------------------

.ignore_layer
|09B104| LDA.l $7FF800,X
|09B108| TAY

|09B109| LDA.w .object_allocation-1,Y
|09B10C| JSL AllocateOAMInRegionA

;---------------------------------------------------------------------------------------------------

.run_ai
|09B110| LDA.l $7FF800,X
|09B114| DEC A

|09B115| REP #$30

|09B117| AND.w #$00FF
|09B11A| ASL A
|09B11B| TAY

|09B11C| LDA.w .vectors,Y
|09B11F| DEC A
|09B120| PHA

|09B121| SEP #$30

.exit
|09B123| RTS

;---------------------------------------------------------------------------------------------------

.vectors
|09B124| dw Garnish01_FireSnakeTail
|09B126| dw Garnish02_MothulaBeamTrail
|09B128| dw Garnish03_FallingTile
|09B12A| dw Garnish04_LaserTrail
|09B12C| dw Garnish05_SimpleSparkle
|09B12E| dw Garnish06_ZoroTrail
|09B130| dw Garnish07_BabasuFlash
|09B132| dw Garnish08_KholdstareTrail
|09B134| dw Garnish09_LightningTrail
|09B136| dw Garnish0A_CannonSmoke
|09B138| dw Garnish0B_WaterTrail
|09B13A| dw Garnish0C_TrinexxIceBreath
|09B13C| dw $0000
|09B13E| dw Garnish0E_TrinexxFireBreath
|09B140| dw Garnish0F_BlindLaserTrail
|09B142| dw Garnish10_GanonBatFlame
|09B144| dw Garnish11_WitheringGanonBatFlame
|09B146| dw Garnish12_Sparkle
|09B148| dw Garnish13_PyramidDebris
|09B14A| dw Garnish14_KakKidDashDust
|09B14C| dw Garnish15_ArrghusSplash
|09B14E| dw Garnish16_ThrownItemDebris

;===================================================================================================

pool Garnish15_ArrghusSplash

.offset_y
|09B150| db -12,  20
|09B152| db -10,  10
|09B154| db  -8,   8
|09B156| db  -4,   4

.offset_x
|09B158| db  -4,  -4
|09B15A| db  -2,  -2
|09B15C| db   0,   0
|09B15E| db   0,   0

.char
|09B160| db $AE, $AE
|09B162| db $AE, $AE
|09B164| db $AE, $AE
|09B166| db $AC, $AC

.prop
|09B168| db $34, $74
|09B16A| db $34, $74
|09B16C| db $34, $74
|09B16E| db $34, $74

.size
|09B170| db $00, $00
|09B172| db $02, $02
|09B174| db $02, $02
|09B176| db $02, $02

endpool

;---------------------------------------------------------------------------------------------------

Garnish15_ArrghusSplash:
|09B178| JSR Garnish_PrepOAMCoord

|09B17B| LDA.l $7FF90E,X
|09B17F| LSR A
|09B180| AND.b #$06
|09B182| STA.b $06

|09B184| LDA.b #$01
|09B186| STA.b $07

|09B188| PHX

;---------------------------------------------------------------------------------------------------

.next_object
|09B189| LDA.b $06
|09B18B| ORA.b $07
|09B18D| TAX

|09B18E| LDA.b $00
|09B190| CLC
|09B191| ADC.w .offset_y,X
|09B194| STA.b ($90),Y

|09B196| LDA.b $02
|09B198| CLC
|09B199| ADC.w .offset_x,X
|09B19C| INY
|09B19D| STA.b ($90),Y

|09B19F| LDA.w .char,X
|09B1A2| INY
|09B1A3| STA.b ($90),Y

|09B1A5| LDA.w .prop,X
|09B1A8| INY
|09B1A9| STA.b ($90),Y

|09B1AB| PHY

|09B1AC| TYA
|09B1AD| LSR A
|09B1AE| LSR A
|09B1AF| TAY

|09B1B0| LDA.w .size,X
|09B1B3| STA.b ($92),Y

|09B1B5| PLY
|09B1B6| INY

|09B1B7| DEC.b $07
|09B1B9| BPL .next_object

;---------------------------------------------------------------------------------------------------

|09B1BB| PLX

|09B1BC| RTS

;===================================================================================================

GarnishSpawn_PyramidDebris:
|09B1BD| LDA.b #$03 ; SFX3.03
|09B1BF| STA.w $012F

|09B1C2| LDA.b #$1F ; SFX2.1F
|09B1C4| STA.w $012E

|09B1C7| LDA.b #$05 ; SFX1.05
|09B1C9| STA.w $012D

|09B1CC| PHX
|09B1CD| TXY

|09B1CE| LDX.b #$1D

.next_slot
|09B1D0| LDA.l $7FF800,X
|09B1D4| BEQ .open_slot

|09B1D6| DEX
|09B1D7| BPL .next_slot

|09B1D9| INX

;---------------------------------------------------------------------------------------------------

.open_slot
|09B1DA| LDA.b #$13 ; GARNISH 13
|09B1DC| STA.l $7FF800,X
|09B1E0| STA.w $0FB4

|09B1E3| LDA.b #$E8
|09B1E5| CLC
|09B1E6| ADC.b $00
|09B1E8| STA.l $7FF83C,X

|09B1EC| LDA.b #$60
|09B1EE| CLC
|09B1EF| ADC.b $01
|09B1F1| STA.l $7FF81E,X

|09B1F5| LDA.b $02
|09B1F7| STA.l $7FF8B4,X

|09B1FB| LDA.b $03
|09B1FD| STA.l $7FF896,X

|09B201| JSL GetRandomNumber
|09B205| AND.b #$1F
|09B207| ADC.b #$30
|09B209| STA.l $7FF90E,X

|09B20D| PLX

|09B20E| RTL

;===================================================================================================

PyramidDebris_DeleteSelf:
|09B20F| LDA.b #$00
|09B211| STA.l $7FF800,X

|09B215| RTS

;===================================================================================================

Garnish13_PyramidDebris:
|09B216| JSR Garnish_MoveXY

|09B219| LDA.l $7FF896,X
|09B21D| CLC
|09B21E| ADC.b #$03
|09B220| STA.l $7FF896,X

|09B224| LDY.b #$00

|09B226| LDA.l $7FF83C,X
|09B22A| SEC
|09B22B| SBC.b $E2
|09B22D| CMP.b #$F8
|09B22F| BCS PyramidDebris_DeleteSelf

;---------------------------------------------------------------------------------------------------

|09B231| STA.b ($90),Y

|09B233| LDA.l $7FF81E,X
|09B237| SEC
|09B238| SBC.b $E8
|09B23A| CMP.b #$F0
|09B23C| BCS PyramidDebris_DeleteSelf

|09B23E| INY

|09B23F| STA.b ($90),Y
|09B241| LDA.b #$5C

|09B243| INY

|09B244| STA.b ($90),Y

|09B246| LDA.b $1A
|09B248| ASL A
|09B249| ASL A
|09B24A| ASL A
|09B24B| AND.b #$C0
|09B24D| ORA.b #$34

|09B24F| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

Garnish_MoveXY:
|09B252| PHX

|09B253| TXA
|09B254| CLC
|09B255| ADC.b #$1E
|09B257| TAX

|09B258| JSR Garnish_MoveY

|09B25B| PLX

;===================================================================================================

Garnish_MoveY:
|09B25C| LDA.l $7FF896,X

|09B260| ASL A
|09B261| ASL A
|09B262| ASL A
|09B263| ASL A

|09B264| CLC
|09B265| ADC.l $7FF8D2,X
|09B269| STA.l $7FF8D2,X

|09B26D| LDA.l $7FF896,X
|09B271| PHP

|09B272| LSR A
|09B273| LSR A
|09B274| LSR A
|09B275| LSR A

|09B276| PLP
|09B277| BPL .positive

|09B279| ORA.b #$F0

.positive
|09B27B| ADC.l $7FF81E,X
|09B27F| STA.l $7FF81E,X

|09B283| RTS

;===================================================================================================

pool Garnish10_GanonBatFlame

.char
|09B284| db $AC, $AC, $66, $66, $8E, $A0, $A2

.prop
|09B28B| db $01, $41, $01, $41, $00, $00, $00

.draw_step
|09B292| db $07, $06, $05, $04
|09B296| db $05, $04, $05, $04
|09B29A| db $05, $04, $05, $04
|09B29E| db $05, $04, $05, $04
|09B2A2| db $05, $04, $05, $04
|09B2A6| db $05, $04, $05, $04
|09B2AA| db $05, $04, $05, $04
|09B2AE| db $05, $04, $05, $04

endpool

;===================================================================================================

Garnish11_WitheringGanonBatFlame:
|09B2B2| LDA.b $11
|09B2B4| ORA.w $0FC1
|09B2B7| BNE .just_draw

|09B2B9| LDA.l $7FF81E,X
|09B2BD| SEC
|09B2BE| SBC.b #$01
|09B2C0| STA.l $7FF81E,X

|09B2C4| LDA.l $7FF85A,X
|09B2C8| SBC.b #$00
|09B2CA| STA.l $7FF85A,X

.just_draw
|09B2CE| JSR Garnish_PrepOAMCoord

|09B2D1| REP #$10

|09B2D3| LDY.b $90

|09B2D5| LDA.b $00
|09B2D7| STA.w $0000,Y

|09B2DA| CLC
|09B2DB| ADC.b #$08
|09B2DD| STA.w $0004,Y

|09B2E0| LDA.b $02
|09B2E2| STA.w $0001,Y
|09B2E5| STA.w $0005,Y

|09B2E8| LDA.b #$A4
|09B2EA| STA.w $0002,Y

|09B2ED| INC A
|09B2EE| STA.w $0006,Y

|09B2F1| LDA.b #$22
|09B2F3| STA.w $0003,Y
|09B2F6| STA.w $0007,Y

|09B2F9| LDY.b $92

|09B2FB| LDA.b #$00
|09B2FD| STA.w $0000,Y
|09B300| STA.w $0001,Y

|09B303| SEP #$10

|09B305| RTS

;===================================================================================================

Garnish10_GanonBatFlame:
|09B306| LDA.l $7FF90E,X
|09B30A| CMP.b #$08
|09B30C| BNE .dont_transmute

|09B30E| LDA.b #$11 ; GARNISH 11
|09B310| STA.l $7FF800,X

.dont_transmute
|09B314| JSR Garnish_PrepOAMCoord

|09B317| LDA.b $00
|09B319| STA.b ($90),Y

|09B31B| LDA.b $02
|09B31D| INY
|09B31E| STA.b ($90),Y

|09B320| LDA.l $7FF90E,X
|09B324| LSR A
|09B325| LSR A
|09B326| LSR A

|09B327| PHX

|09B328| TAX

|09B329| LDA.w .draw_step,X
|09B32C| TAX

|09B32D| LDA.w .char,X
|09B330| INY
|09B331| STA.b ($90),Y

|09B333| LDA.b #$22
|09B335| ORA.w .prop,X

|09B338| PLX

|09B339| JSR Garnish_FinalizeBigOAMObject

|09B33C| JMP.w Garnish_CheckDamageToLink

;===================================================================================================

pool Garnish0C_TrinexxIceBreath

.char
|09B33F| db $E8, $E8, $E6, $E6
|09B343| db $E4, $E4, $E4, $E4
|09B347| db $E4, $E4, $E4, $E4

.prop
|09B34B| db $00, $40, $C0, $80

endpool

;---------------------------------------------------------------------------------------------------

Garnish0C_TrinexxIceBreath:
|09B34F| LDA.l $7FF90E,X
|09B353| CMP.b #$50
|09B355| BNE .dont_change_tiles

|09B357| LDA.b $11
|09B359| ORA.w $0FC1
|09B35C| BNE .dont_change_tiles

;---------------------------------------------------------------------------------------------------

|09B35E| PHA

|09B35F| LDA.l $7FF83C,X
|09B363| STA.b $00

|09B365| LDA.l $7FF878,X
|09B369| STA.b $01

|09B36B| LDA.l $7FF81E,X
|09B36F| SEC
|09B370| SBC.b #$10
|09B372| STA.b $02

|09B374| LDA.l $7FF85A,X
|09B378| SBC.b #$00
|09B37A| STA.b $03

|09B37C| LDY.b #$12
|09B37E| JSL UpdateTilemapWithCommonObject

|09B382| PLA

;---------------------------------------------------------------------------------------------------

.dont_change_tiles
|09B383| LDA.l $7FF90E,X
|09B387| LSR A
|09B388| LSR A
|09B389| AND.b #$03
|09B38B| TAY

|09B38C| LDA.w .prop,Y
|09B38F| STA.b $04

|09B391| JSR Garnish_PrepOAMCoord

|09B394| LDA.b $00
|09B396| STA.b ($90),Y

|09B398| LDA.b $02
|09B39A| INY
|09B39B| STA.b ($90),Y

|09B39D| LDA.l $7FF90E,X

|09B3A1| LSR A
|09B3A2| LSR A
|09B3A3| LSR A
|09B3A4| LSR A

|09B3A5| NOP

|09B3A6| PHX

|09B3A7| TAX

|09B3A8| LDA.w .char,X
|09B3AB| INY
|09B3AC| STA.b ($90),Y

|09B3AE| LDA.b #$35
|09B3B0| ORA.b $04

|09B3B2| PLX

|09B3B3| JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

UNREACHABLE_09B3B6:
|09B3B6| JMP.w Garnish_CheckDamageToLink

;===================================================================================================

pool Garnish14_KakKidDashDust

.char
|09B3B9| db $DF, $CF, $A9

endpool

;---------------------------------------------------------------------------------------------------

Garnish14_KakKidDashDust:
|09B3BC| LDA.l $7FF90E,X

|09B3C0| BRA .continue

;===================================================================================================

#Garnish0B_WaterTrail:
|09B3C2| LDA.l $7FF90E,X
|09B3C6| LSR A

;===================================================================================================

.continue
|09B3C7| LSR A
|09B3C8| LSR A
|09B3C9| STA.w $0FB5

|09B3CC| JSR Garnish_PrepOAMCoord

|09B3CF| LDA.b $00
|09B3D1| STA.b ($90),Y

|09B3D3| LDA.b $02
|09B3D5| INY
|09B3D6| STA.b ($90),Y

|09B3D8| PHX

|09B3D9| LDX.w $0FB5

|09B3DC| LDA.w .char,X
|09B3DF| INY
|09B3E0| STA.b ($90),Y

|09B3E2| LDA.b #$24

|09B3E4| PLX

|09B3E5| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0A_CannonSmoke

.char
|09B3E8| db $8A, $86

.priority
|09B3EA| db $20, $10, $30, $30

endpool

;---------------------------------------------------------------------------------------------------

Garnish0A_CannonSmoke:
|09B3EE| JSR Garnish_PrepOAMCoord

|09B3F1| LDA.b $00
|09B3F3| STA.b ($90),Y

|09B3F5| LDA.b $02
|09B3F7| INY
|09B3F8| STA.b ($90),Y

|09B3FA| LDA.l $7FF90E,X
|09B3FE| LSR A
|09B3FF| LSR A
|09B400| LSR A

|09B401| PHX

|09B402| TAX

|09B403| LDA.w .char,X
|09B406| INY
|09B407| STA.b ($90),Y

|09B409| PLX
|09B40A| PHX

|09B40B| LDA.l $7FF92C,X
|09B40F| TAX

|09B410| LDA.w .priority,X
|09B413| ORA.b #$04

|09B415| PLX

|09B416| JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

pool Garnish09_LightningTrail

.char
|09B419| db $CC, $EC, $CE, $EE
|09B41D| db $CC, $EC, $CE, $EE

.prop
|09B421| db $31, $31, $31, $31
|09B425| db $71, $71, $71, $71

endpool

;---------------------------------------------------------------------------------------------------

Garnish09_LightningTrail:
|09B429| JSR Garnish_PrepOAMCoord

|09B42C| LDA.b $00
|09B42E| STA.b ($90),Y

|09B430| LDA.b $02
|09B432| INY
|09B433| STA.b ($90),Y

|09B435| LDA.l $7FF92C,X

|09B439| PHX
|09B43A| TAX

|09B43B| LDA.w .char,X

|09B43E| PHX

|09B43F| LDX.w $048E
|09B442| CPX.b #$20 ; ROOM 0020
|09B444| BNE .not_aga1

|09B446| SEC
|09B447| SBC.b #$80

.not_aga1
|09B449| PLX

|09B44A| INY
|09B44B| STA.b ($90),Y

|09B44D| LDA.b $1A
|09B44F| ASL A
|09B450| AND.b #$0E
|09B452| ORA.w .prop,X

|09B455| PLX

|09B456| JSR Garnish_FinalizeBigOAMObject

;===================================================================================================

Garnish_CheckDamageToLink:
|09B459| TXA
|09B45A| EOR.b $1A
|09B45C| AND.b #$07
|09B45E| ORA.w $031F
|09B461| ORA.w $037B
|09B464| BNE .exit

|09B466| LDA.b $22
|09B468| SBC.b $E2
|09B46A| SBC.b $00
|09B46C| ADC.b #$0C

|09B46E| CMP.b #$18
|09B470| BCS .exit

|09B472| LDA.b $20
|09B474| SBC.b $E8
|09B476| SBC.b $02
|09B478| ADC.b #$16

|09B47A| CMP.b #$1C
|09B47C| BCS .exit

|09B47E| LDA.b #$01
|09B480| STA.b $4D

|09B482| LDA.b #$10
|09B484| STA.b $46
|09B486| STA.w $0373

|09B489| LDA.b $28
|09B48B| EOR.b #$FF
|09B48D| STA.b $28

|09B48F| LDA.b $27
|09B491| EOR.b #$FF
|09B493| STA.b $27

.exit
|09B495| RTS

;===================================================================================================

pool Garnish07_BabasuFlash

.char
|09B496| db $A8, $8A, $86, $86

.prop
|09B49A| db $2D, $2C, $2C, $2C

endpool

;---------------------------------------------------------------------------------------------------

Garnish07_BabasuFlash:
|09B49E| JSR Garnish_PrepOAMCoord

|09B4A1| LDA.b $00
|09B4A3| STA.b ($90),Y

|09B4A5| LDA.b $02
|09B4A7| INY
|09B4A8| STA.b ($90),Y

|09B4AA| LDA.l $7FF90E,X
|09B4AE| LSR A
|09B4AF| LSR A
|09B4B0| LSR A

|09B4B1| PHX

|09B4B2| TAX

|09B4B3| LDA.w .char,X
|09B4B6| INY
|09B4B7| STA.b ($90),Y

|09B4B9| LDA.w .prop,X

|09B4BC| PLX

|09B4BD| JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

pool Garnish08_KholdstareTrail

.offset
|09B4C0| db  -1,  -1,   0

.char
|09B4C3| db $9C, $9D, $8D

endpool

;---------------------------------------------------------------------------------------------------

Garnish08_KholdstareTrail:
|09B4C6| JSR Garnish_PrepOAMCoord

|09B4C9| PHX

|09B4CA| LDA.l $7FF90E,X
|09B4CE| LSR A
|09B4CF| LSR A
|09B4D0| TAX

|09B4D1| LDA.b $00
|09B4D3| CLC
|09B4D4| ADC.w .offset,X
|09B4D7| STA.b ($90),Y

|09B4D9| LDA.b $02
|09B4DB| CLC
|09B4DC| ADC.w .offset,X

|09B4DF| INY

|09B4E0| STA.b ($90),Y

|09B4E2| LDA.w .char,X
|09B4E5| INY
|09B4E6| STA.b ($90),Y

|09B4E8| PLX

|09B4E9| PHY

|09B4EA| LDA.l $7FF92C,X
|09B4EE| TAY

|09B4EF| LDA.w $0F50,Y
|09B4F2| ORA.w $0B89,Y
|09B4F5| AND.b #$FE

|09B4F7| PLY

|09B4F8| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

Garnish06_ZoroTrail:
|09B4FB| JSR Garnish_PrepOAMCoord

|09B4FE| LDA.b $00
|09B500| STA.b ($90),Y

|09B502| LDA.b $02
|09B504| INY
|09B505| STA.b ($90),Y

|09B507| LDA.b #$75
|09B509| INY
|09B50A| STA.b ($90),Y

|09B50C| PHY

|09B50D| LDA.l $7FF92C,X
|09B511| TAY

|09B512| LDA.w $0F50,Y
|09B515| ORA.w $0B89,Y

|09B518| PLY

|09B519| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool GarnishSparkle

.char
|09B51C| db $83, $C7, $80, $B7

endpool

;===================================================================================================

Garnish12_Sparkle:
|09B520| LDA.l $7FF90E,X
|09B524| BRA GarnishSparkle

;===================================================================================================

Garnish05_SimpleSparkle:
|09B526| LDA.l $7FF90E,X
|09B52A| LSR A

;===================================================================================================

GarnishSparkle:
|09B52B| LSR A
|09B52C| LSR A
|09B52D| STA.b $0F

|09B52F| JSR Garnish_PrepOAMCoord

|09B532| LDA.b $00
|09B534| STA.b ($90),Y

|09B536| LDA.b $02
|09B538| INY
|09B539| STA.b ($90),Y

|09B53B| PHX

|09B53C| LDX.b $0F
|09B53E| LDA.w .char,X

|09B541| PLX

|09B542| INY
|09B543| STA.b ($90),Y

|09B545| PHY

|09B546| LDA.l $7FF92C,X
|09B54A| TAY

|09B54B| LDA.w $0F50,Y
|09B54E| ORA.w $0B89,Y
|09B551| AND.b #$F0
|09B553| ORA.b #$04

|09B555| PLY

|09B556| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0E_TrinexxFireBreath

.char
|09B559| db $83, $C7, $80, $9D

endpool

;---------------------------------------------------------------------------------------------------

Garnish0E_TrinexxFireBreath:
|09B55D| JSR Garnish_PrepOAMCoord

|09B560| LDA.b $00
|09B562| STA.b ($90),Y

|09B564| LDA.b $02
|09B566| INY
|09B567| STA.b ($90),Y

|09B569| LDA.l $7FF90E,X
|09B56D| LSR A
|09B56E| LSR A
|09B56F| LSR A

|09B570| PHX

|09B571| TAX

|09B572| LDA.w .char,X

|09B575| PLX

|09B576| INY
|09B577| STA.b ($90),Y

|09B579| PHY

|09B57A| LDA.l $7FF92C,X
|09B57E| TAY

|09B57F| LDA.w $0F50,Y
|09B582| ORA.w $0B89,Y
|09B585| AND.b #$F0
|09B587| ORA.b #$0E

|09B589| PLY

|09B58A| JMP.w Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish0F_BlindLaserTrail

.char
|09B58D| db $61, $71, $70, $60

endpool

;---------------------------------------------------------------------------------------------------

Garnish0F_BlindLaserTrail:
|09B591| JSR Garnish_PrepOAMCoord

|09B594| LDA.b $00
|09B596| STA.b ($90),Y

|09B598| LDA.b $02
|09B59A| INY
|09B59B| STA.b ($90),Y

|09B59D| PHY

|09B59E| LDA.l $7FF9FE,X
|09B5A2| TAY

|09B5A3| LDA.w .char-7,Y

|09B5A6| PLY
|09B5A7| INY

|09B5A8| STA.b ($90),Y

|09B5AA| PHY

|09B5AB| LDA.l $7FF92C,X
|09B5AF| TAY

|09B5B0| LDA.w $0F50,Y
|09B5B3| ORA.w $0B89,Y

|09B5B6| PLY

|09B5B7| BRA Garnish_FinalizeSmallOAMObject

;===================================================================================================

pool Garnish04_LaserTrail

.char
|09B5B9| db $D2, $F3

endpool

;---------------------------------------------------------------------------------------------------

Garnish04_LaserTrail:
|09B5BB| JSR Garnish_PrepOAMCoord

|09B5BE| LDA.b $00
|09B5C0| STA.b ($90),Y

|09B5C2| LDA.b $02
|09B5C4| INY
|09B5C5| STA.b ($90),Y

|09B5C7| PHY

|09B5C8| LDA.l $7FF9FE,X
|09B5CC| TAY

|09B5CD| LDA.w .char,Y

|09B5D0| PLY
|09B5D1| INY

|09B5D2| STA.b ($90),Y

|09B5D4| LDA.b #$25

;===================================================================================================

Garnish_FinalizeSmallOAMObject:
|09B5D6| INY

|09B5D7| STA.b ($90),Y

|09B5D9| LDA.b #$00
|09B5DB| STA.b ($92)

|09B5DD| RTS

;===================================================================================================

Garnish_PrepOAMCoord:
|09B5DE| LDA.l $7FF83C,X
|09B5E2| SEC
|09B5E3| SBC.b $E2
|09B5E5| STA.b $00

|09B5E7| LDA.l $7FF878,X
|09B5EB| SBC.b $E3
|09B5ED| STA.b $01

|09B5EF| BNE .off_screen

|09B5F1| LDA.l $7FF81E,X
|09B5F5| SEC
|09B5F6| SBC.b $E8
|09B5F8| PHA

|09B5F9| LDA.l $7FF85A,X
|09B5FD| SBC.b $E9
|09B5FF| BEQ .on_screen

|09B601| PLA

;---------------------------------------------------------------------------------------------------

.off_screen
|09B602| LDA.b #$00
|09B604| STA.l $7FF800,X

|09B608| PLA
|09B609| PLA

|09B60A| RTS

;---------------------------------------------------------------------------------------------------

.on_screen
|09B60B| PLA
|09B60C| SBC.b #$10
|09B60E| STA.b $02

|09B610| LDY.b #$00

|09B612| RTS

;===================================================================================================

pool Garnish03_FallingTile

.char
|09B613| db $80, $CC, $CC, $EA, $CA

.prop
|09B618| db $30, $31, $31, $31, $31

.size
|09B61D| db $00, $02, $02, $02, $02

.offset
|09B622| db   4,   0,   0,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Garnish03_FallingTile:
|09B627| LDA.l $7FF90E,X
|09B62B| CMP.b #$1E
|09B62D| BNE .dont_place_pit

|09B62F| LDA.b $11
|09B631| ORA.w $0FC1
|09B634| BNE .dont_place_pit

;---------------------------------------------------------------------------------------------------

|09B636| PHA

|09B637| LDA.l $7FF83C,X
|09B63B| STA.b $00

|09B63D| LDA.l $7FF878,X
|09B641| STA.b $01

|09B643| LDA.l $7FF81E,X
|09B647| SEC
|09B648| SBC.b #$10
|09B64A| STA.b $02

|09B64C| LDA.l $7FF85A,X
|09B650| SBC.b #$00
|09B652| STA.b $03

|09B654| PHX

|09B655| LDY.b #$04
|09B657| JSL UpdateTilemapWithCommonObject

|09B65B| PLX

|09B65C| PLA

;---------------------------------------------------------------------------------------------------

.dont_place_pit
|09B65D| LSR A
|09B65E| LSR A
|09B65F| LSR A
|09B660| TAY

|09B661| LDA.w .char,Y
|09B664| STA.b $03

|09B666| LDA.w .prop,Y
|09B669| STA.b $05

|09B66B| LDA.w .size,Y
|09B66E| STA.b $06

|09B670| LDA.l $7FF83C,X
|09B674| SEC
|09B675| SBC.b $E2
|09B677| PHP

|09B678| CLC
|09B679| ADC.w .offset,Y
|09B67C| STA.b $00

|09B67E| LDA.l $7FF878,X
|09B682| ADC.b #$00
|09B684| PLP
|09B685| SBC.b $E3
|09B687| BNE .exit

;---------------------------------------------------------------------------------------------------

|09B689| LDA.l $7FF81E,X
|09B68D| SEC
|09B68E| SBC.b $E8
|09B690| PHP

|09B691| CLC
|09B692| ADC.w .offset,Y
|09B695| STA.b $02

|09B697| LDA.l $7FF85A,X
|09B69B| ADC.b #$00

|09B69D| PLP
|09B69E| SBC.b $E9
|09B6A0| BEQ .draw

.exit
|09B6A2| RTS

;---------------------------------------------------------------------------------------------------

.draw
|09B6A3| LDY.b #$00

|09B6A5| LDA.b $00
|09B6A7| STA.b ($90),Y

|09B6A9| LDA.b $02
|09B6AB| SEC
|09B6AC| SBC.b #$10

|09B6AE| INY
|09B6AF| STA.b ($90),Y

|09B6B1| INY

|09B6B2| LDA.b $03
|09B6B4| STA.b ($90),Y

|09B6B6| INY

|09B6B7| LDA.b $05
|09B6B9| STA.b ($90),Y

|09B6BB| LDA.b $06
|09B6BD| STA.b ($92)

|09B6BF| RTS

;===================================================================================================

Garnish01_FireSnakeTail:
|09B6C0| JSR Garnish_PrepOAMCoord

|09B6C3| LDA.b $00
|09B6C5| STA.b ($90),Y

|09B6C7| LDA.b $02

|09B6C9| INY
|09B6CA| STA.b ($90),Y

|09B6CC| INY

|09B6CD| LDA.b #$28
|09B6CF| STA.b ($90),Y

|09B6D1| PHY

|09B6D2| LDA.l $7FF92C,X
|09B6D6| TAY

|09B6D7| LDA.w $0F50,Y
|09B6DA| ORA.w $0B89,Y

|09B6DD| PLY

|09B6DE| JMP.w Garnish_FinalizeBigOAMObject

;===================================================================================================

Garnish02_MothulaBeamTrail:
|09B6E1| LDY.b #$00

|09B6E3| LDA.l $7FF83C,X
|09B6E7| SEC
|09B6E8| SBC.b $E2
|09B6EA| STA.b ($90),Y

|09B6EC| LDA.l $7FF81E,X
|09B6F0| SEC
|09B6F1| SBC.b $E8

|09B6F3| INY
|09B6F4| STA.b ($90),Y

|09B6F6| INY

|09B6F7| LDA.b #$AA
|09B6F9| STA.b ($90),Y

|09B6FB| LDA.l $7FF92C,X

|09B6FF| PHY

|09B700| LDA.l $7FF92C,X
|09B704| TAY

|09B705| LDA.w $0F50,Y
|09B708| ORA.w $0B89,Y

|09B70B| PLY

;===================================================================================================

Garnish_FinalizeBigOAMObject:
|09B70C| INY

|09B70D| STA.b ($90),Y

|09B70F| LDA.b #$02
|09B711| STA.b ($92)

|09B713| RTS

;===================================================================================================

SpawnBoulder:
|09B714| LDA.b $1B
|09B716| BNE .exit

|09B718| LDA.w $0FFD
|09B71B| BEQ .exit

|09B71D| LDA.b $11
|09B71F| ORA.w $0FC1
|09B722| BNE .exit

|09B724| INC.w $0FFE

|09B727| LDA.w $0FFE
|09B72A| AND.b #$3F
|09B72C| BNE .exit

|09B72E| LDA.b $E9
|09B730| SEC
|09B731| SBC.w $0FBF
|09B734| CMP.b #$02
|09B736| BMI .exit

;---------------------------------------------------------------------------------------------------

|09B738| LDA.b #$C2 ; SPRITE C2
|09B73A| LDY.b #$0D
|09B73C| JSL SpawnSpriteDynamically
|09B740| BMI .exit

|09B742| JSL GetRandomNumber
|09B746| AND.b #$7F

|09B748| CLC
|09B749| ADC.b #$40

|09B74B| CLC
|09B74C| ADC.b $E2
|09B74E| STA.w $0D10,Y

|09B751| LDA.b $E3
|09B753| ADC.b #$00
|09B755| STA.w $0D30,Y

|09B758| LDA.b $E8
|09B75A| SEC
|09B75B| SBC.b #$30
|09B75D| STA.w $0D00,Y

|09B760| LDA.b $E9
|09B762| SBC.b #$00
|09B764| STA.w $0D20,Y

|09B767| LDA.b #$00
|09B769| STA.w $0F20,Y
|09B76C| STA.w $0DE0,Y
|09B76F| STA.w $0F70,Y

.exit
|09B772| RTS

;===================================================================================================

HandleAllOverlords:
|09B773| PHB
|09B774| PHK
|09B775| PLB

|09B776| JSR .main
|09B779| JSR SpawnBoulder

|09B77C| PLB

|09B77D| RTL

;---------------------------------------------------------------------------------------------------

.main
|09B77E| LDA.b $11
|09B780| ORA.w $0FC1
|09B783| BNE .exit

|09B785| LDX.b #$07

.next
|09B787| LDA.w $0B00,X
|09B78A| BEQ .skip

|09B78C| JSR Overlord_ExecuteSingle

.skip
|09B78F| DEX
|09B790| BPL .next

.exit
|09B792| RTS

;===================================================================================================

Overlord_ExecuteSingle:
|09B793| PHA

|09B794| JSR Overlord_CheckIfActive

|09B797| PLA

|09B798| DEC A

|09B799| REP #$30

|09B79B| AND.w #$00FF
|09B79E| ASL A
|09B79F| TAY

|09B7A0| LDA.w .vectors,Y
|09B7A3| DEC A
|09B7A4| PHA

|09B7A5| SEP #$30

|09B7A7| RTS

;---------------------------------------------------------------------------------------------------

.vectors
|09B7A8| dw Overlord01_PositionTarget
|09B7AA| dw Overlord02_FullRoomCannons
|09B7AC| dw Overlord03_VerticalCannon
|09B7AE| dw Overlord04_Unused
|09B7B0| dw Overlord05_FallingStalfos
|09B7B2| dw Overlord06_BadSwitchSnake
|09B7B4| dw Overlord07_MovingFloor
|09B7B6| dw Overlord08_BlobSpawner
|09B7B8| dw Overlord09_WallmasterSpawner
|09B7BA| dw Overlord0A_FallingSquare
|09B7BC| dw Overlord0B_FallingBridge
|09B7BE| dw Overlord0C_FallingTiles_WestToEast
|09B7C0| dw Overlord0D_FallingTiles_NorthToSouth
|09B7C2| dw Overlord0E_FallingTiles_EastToWest
|09B7C4| dw Overlord0F_FallingTiles_SouthToNorth
|09B7C6| dw Overlord10_PirogusuSpawner_left
|09B7C8| dw Overlord11_PirogusuSpawner_right
|09B7CA| dw Overlord12_PirogusuSpawner_top
|09B7CC| dw Overlord13_PirogusuSpawner_bottom
|09B7CE| dw Overlord14_TileRoom
|09B7D0| dw Overlord15_WizzrobeSpawner
|09B7D2| dw Overlord16_ZoroSpawner
|09B7D4| dw Overlord17_PotTrap
|09B7D6| dw Overlord18_InvisibleStalfos
|09B7D8| dw Overlord19_ArmosCoordinator_bounce
|09B7DA| dw Overlord1A_BadSwitchBomb

;===================================================================================================

Overlord19_ArmosCoordinator_bounce:
|09B7DC| JSL Overlord19_ArmosCoordinator

|09B7E0| RTS

;===================================================================================================

pool Overlord18_InvisibleStalfos

.offset_x_low
|09B7E1| db   0,   0, -48,  48

.offset_x_high
|09B7E5| db   0,   0,  -1,   0

.offset_y_low
|09B7E9| db -40,  56,   8,   8

.offset_y_high
|09B7ED| db  -1,   0,   0,   0

.timer
|09B7F1| db  48,  80, 112, 144

endpool

;---------------------------------------------------------------------------------------------------

Overlord18_InvisibleStalfos:
|09B7F5| LDA.w $0B08,X
|09B7F8| STA.b $00

|09B7FA| LDA.w $0B10,X
|09B7FD| STA.b $01

|09B7FF| LDA.w $0B18,X
|09B802| STA.b $02

|09B804| LDA.w $0B20,X
|09B807| STA.b $03

|09B809| REP #$20

|09B80B| LDA.b $00
|09B80D| SEC
|09B80E| SBC.b $22
|09B810| CLC
|09B811| ADC.w #$0018
|09B814| CMP.w #$0030
|09B817| BCS .exit

|09B819| LDA.b $02
|09B81B| SEC
|09B81C| SBC.b $20
|09B81E| CLC
|09B81F| ADC.w #$0018
|09B822| CMP.w #$0030
|09B825| BCS .exit

|09B827| SEP #$20

|09B829| STZ.w $0B00,X

;---------------------------------------------------------------------------------------------------

|09B82C| LDA.b #$03
|09B82E| STA.w $0FB5

.next
|09B831| LDA.b #$A7 ; SPRITE A7
|09B833| LDY.b #$0C
|09B835| JSL SpawnSpriteDynamically.slot_limited
|09B839| BMI .skip

|09B83B| PHX

|09B83C| LDX.w $0FB5

|09B83F| LDA.b $22
|09B841| CLC
|09B842| ADC.w .offset_x_low,X
|09B845| STA.w $0D10,Y

|09B848| LDA.b $23
|09B84A| ADC.w .offset_x_high,X
|09B84D| STA.w $0D30,Y

|09B850| LDA.b $20
|09B852| CLC
|09B853| ADC.w .offset_y_low,X
|09B856| STA.w $0D00,Y

|09B859| LDA.b $21
|09B85B| ADC.w .offset_y_high,X
|09B85E| STA.w $0D20,Y

|09B861| LDA.w .timer,X
|09B864| STA.w $0DF0,Y

|09B867| PLX

|09B868| LDA.w $0B40,X
|09B86B| STA.w $0F20,Y

|09B86E| LDA.b #$01
|09B870| STA.w $0E90,Y

|09B873| LDA.b #$03
|09B875| STA.w $0E40,Y

|09B878| DEC A
|09B879| STA.w $0DE0,Y

.skip
|09B87C| DEC.w $0FB5
|09B87F| BPL .next

;---------------------------------------------------------------------------------------------------

.exit
|09B881| SEP #$20

|09B883| RTS

;===================================================================================================

Overlord17_PotTrap:
|09B884| LDA.w $0B08,X
|09B887| STA.b $00

|09B889| LDA.w $0B10,X
|09B88C| STA.b $01

|09B88E| LDA.w $0B18,X
|09B891| STA.b $02

|09B893| LDA.w $0B20,X
|09B896| STA.b $03

|09B898| REP #$20

|09B89A| LDA.b $00
|09B89C| SEC
|09B89D| SBC.b $22
|09B89F| CLC
|09B8A0| ADC.w #$0020

|09B8A3| CMP.w #$0040
|09B8A6| BCS .exit

|09B8A8| LDA.b $02
|09B8AA| SEC
|09B8AB| SBC.b $20
|09B8AD| CLC
|09B8AE| ADC.w #$0020

|09B8B1| CMP.w #$0040
|09B8B4| BCS .exit

|09B8B6| SEP #$20

|09B8B8| STZ.w $0B00,X

|09B8BB| INC.w $0B9E

.exit
|09B8BE| SEP #$20

|09B8C0| RTS

;===================================================================================================

pool Overlord16_ZoroSpawner

.offset_x_low
|09B8C1| db  -4,  -2,   0,   2
|09B8C5| db   4,   6,   8,  12

.offset_x_high
|09B8C9| db  -1,  -1,   0,   0
|09B8CD| db   0,   0,   0,   0

endpool

;---------------------------------------------------------------------------------------------------

Overlord16_ZoroSpawner:
|09B8D1| DEC.w $0B30,X

|09B8D4| LDA.w $0B18,X
|09B8D7| CLC
|09B8D8| ADC.b #$08
|09B8DA| STA.b $00

|09B8DC| LDA.w $0B20,X
|09B8DF| ADC.b #$00
|09B8E1| STA.b $01

|09B8E3| LDA.w $0B08,X
|09B8E6| CLC
|09B8E7| ADC.b #$08
|09B8E9| STA.b $02

|09B8EB| LDA.w $0B10,X
|09B8EE| ADC.b #$00
|09B8F0| STA.b $03

|09B8F2| LDA.w $0B40,X
|09B8F5| JSL GetTileType_long

|09B8F9| CMP.b #$82 ; TILETYPE 82
|09B8FB| BNE .exit

|09B8FD| LDA.w $0B30,X
|09B900| CMP.b #$18
|09B902| BCS .exit

|09B904| AND.b #$03
|09B906| BNE .exit

;---------------------------------------------------------------------------------------------------

|09B908| LDA.b #$9C ; SPRITE 9C
|09B90A| LDY.b #$0C
|09B90C| JSL SpawnSpriteDynamically.slot_limited
|09B910| BMI .exit

|09B912| PHX

|09B913| JSL GetRandomNumber
|09B917| AND.b #$07
|09B919| TAX

|09B91A| LDA.b $05
|09B91C| CLC
|09B91D| ADC.w .offset_x_low,X
|09B920| PHP

|09B921| CLC
|09B922| ADC.b #$08
|09B924| STA.w $0D10,Y

|09B927| LDA.b $06
|09B929| ADC.b #$00
|09B92B| PLP
|09B92C| ADC.w .offset_x_high,X
|09B92F| STA.w $0D30,Y

|09B932| LDA.b $07
|09B934| CLC
|09B935| ADC.b #$08
|09B937| STA.w $0D00,Y

|09B93A| LDA.b $08
|09B93C| STA.w $0D20,Y

|09B93F| PLX

|09B940| LDA.w $0B40,X
|09B943| STA.w $0F20,Y

|09B946| LDA.b #$01
|09B948| STA.w $0F60,Y
|09B94B| STA.w $0E90,Y
|09B94E| STA.w $0BA0,Y

|09B951| LDA.b #$10
|09B953| STA.w $0D40,Y

|09B956| LDA.b #$20
|09B958| STA.w $0E40,Y

|09B95B| LDA.b #$0D
|09B95D| STA.w $0F50,Y

|09B960| JSL GetRandomNumber
|09B964| STA.w $0E80,Y

|09B967| LDA.b #$30
|09B969| STA.w $0DF0,Y

|09B96C| LDA.b #$03
|09B96E| STA.w $0CD2,Y

.exit
|09B971| RTS

;===================================================================================================

pool Overlord15_WizzrobeSpawner

.offset_x_low
|09B972| db  48, -48,   0,   0

.offset_x_high
|09B976| db   0,  -1,   0,   0

.offset_y_low
|09B97A| db  16,  16,  64, -32

.offset_y_high
|09B97E| db   0,   0,   0,  -1

.timer
|09B982| db   0,  16,  32,  48

endpool

;---------------------------------------------------------------------------------------------------

Overlord15_WizzrobeSpawner:
|09B986| LDA.w $0B30,X
|09B989| CMP.b #$80
|09B98B| BEQ .spawn

|09B98D| LDA.b $1A
|09B98F| LSR A
|09B990| BCC .exit

|09B992| DEC.w $0B30,X

.exit
|09B995| RTS

;---------------------------------------------------------------------------------------------------

.spawn
|09B996| LDA.b #$7F
|09B998| STA.w $0B30,X

|09B99B| LDA.b #$03
|09B99D| STA.w $0FB5

.next
|09B9A0| LDA.b #$9B ; SPRITE 9B
|09B9A2| LDY.b #$0C
|09B9A4| JSL SpawnSpriteDynamically.slot_limited
|09B9A8| BMI .no_space

|09B9AA| PHX

|09B9AB| LDX.w $0FB5

|09B9AE| LDA.b $22
|09B9B0| CLC
|09B9B1| ADC.w .offset_x_low,X
|09B9B4| STA.w $0D10,Y

|09B9B7| LDA.b $23
|09B9B9| ADC.w .offset_x_high,X
|09B9BC| STA.w $0D30,Y

|09B9BF| LDA.b $20
|09B9C1| CLC
|09B9C2| ADC.w .offset_y_low,X
|09B9C5| STA.w $0D00,Y

|09B9C8| LDA.b $21
|09B9CA| ADC.w .offset_y_high,X
|09B9CD| STA.w $0D20,Y

|09B9D0| LDA.w .timer,X
|09B9D3| STA.w $0DF0,Y

|09B9D6| PLX

|09B9D7| LDA.w $0B40,X
|09B9DA| STA.w $0F20,Y

|09B9DD| LDA.b #$01
|09B9DF| STA.w $0DA0,Y

.no_space
|09B9E2| DEC.w $0FB5
|09B9E5| BPL .next

|09B9E7| RTS

;===================================================================================================

Overlord14_TileRoom:
|09B9E8| LDA.w $0B08,X
|09B9EB| CMP.b $E2

|09B9ED| LDA.w $0B10,X
|09B9F0| SBC.b $E3
|09B9F2| BNE .exit

|09B9F4| LDA.w $0B18,X
|09B9F7| CMP.b $E8

|09B9F9| LDA.w $0B20,X
|09B9FC| SBC.b $E9
|09B9FE| BNE .exit

|09BA00| DEC.w $0B30,X

|09BA03| LDA.w $0B30,X
|09BA06| CMP.b #$80
|09BA08| BEQ .continue

|09BA0A| RTS

;---------------------------------------------------------------------------------------------------

.no_space
|09BA0B| LDA.b #$81
|09BA0D| STA.w $0B30,X

|09BA10| RTS

;---------------------------------------------------------------------------------------------------

.continue
|09BA11| JSR SpawnFlyingTile
|09BA14| BMI .no_space

|09BA16| INC.w $0B28,X

|09BA19| LDA.w $0B28,X
|09BA1C| CMP.b #$16
|09BA1E| BEQ .last_tile

|09BA20| LDA.b #$E0
|09BA22| STA.w $0B30,X

|09BA25| RTS

.last_tile
|09BA26| STZ.w $0B00,X

.exit
|09BA29| RTS

;===================================================================================================

pool SpawnFlyingTile

.position_x
|09BA2A| db $70, $80, $60, $90
|09BA2E| db $90, $60, $70, $80
|09BA32| db $80, $70, $50, $A0
|09BA36| db $A0, $50, $50, $A0
|09BA3A| db $A0, $50, $70, $80
|09BA3E| db $80, $70

.position_y
|09BA40| db $80, $80, $70, $90
|09BA44| db $70, $90, $60, $A0
|09BA48| db $60, $A0, $60, $B0
|09BA4C| db $60, $B0, $80, $90
|09BA50| db $80, $90, $70, $90
|09BA54| db $70, $90

endpool

;---------------------------------------------------------------------------------------------------

SpawnFlyingTile:
|09BA56| LDA.b #$94 ; SPRITE 94
|09BA58| JSL SpawnSpriteDynamically
|09BA5C| BMI .exit

|09BA5E| LDA.b #$01
|09BA60| STA.w $0E90,Y

|09BA63| PHX

|09BA64| LDA.w $0B28,X
|09BA67| TAX

|09BA68| LDA.w .position_x,X
|09BA6B| STA.w $0D10,Y

|09BA6E| LDA.w .position_y,X
|09BA71| SEC
|09BA72| SBC.b #$08
|09BA74| STA.w $0D00,Y

|09BA77| PLX

|09BA78| LDA.w $0B20,X
|09BA7B| STA.w $0D20,Y

|09BA7E| LDA.w $0B10,X
|09BA81| STA.w $0D30,Y

|09BA84| LDA.w $0B40,X
|09BA87| STA.w $0F20,Y

|09BA8A| LDA.b #$04
|09BA8C| STA.w $0E50,Y

|09BA8F| LDA.b #$00
|09BA91| STA.w $0BE0,Y
|09BA94| STA.w $0E50,Y

|09BA97| LDA.b #$08
|09BA99| STA.w $0CAA,Y

|09BA9C| LDA.b #$04
|09BA9E| STA.w $0E40,Y

|09BAA1| LDA.b #$01
|09BAA3| STA.w $0F50,Y

|09BAA6| LDA.b #$04
|09BAA8| STA.w $0CD2,Y

.exit
|09BAAB| RTS

;===================================================================================================

Overlord10_PirogusuSpawner_left:
Overlord11_PirogusuSpawner_right:
Overlord12_PirogusuSpawner_top:
Overlord13_PirogusuSpawner_bottom:
|09BAAC| LDA.w $0B00,X
|09BAAF| SEC
|09BAB0| SBC.b #$10
|09BAB2| STA.w $0FB5

|09BAB5| LDA.w $0B30,X
|09BAB8| CMP.b #$80
|09BABA| BEQ .spawn

|09BABC| DEC.w $0B30,X

|09BABF| RTS

;---------------------------------------------------------------------------------------------------

.direction
|09BAC0| db $02
|09BAC1| db $03
|09BAC2| db $00
|09BAC3| db $01

;---------------------------------------------------------------------------------------------------

.spawn
|09BAC4| JSL GetRandomNumber
|09BAC8| AND.b #$1F
|09BACA| CLC
|09BACB| ADC.b #$60
|09BACD| STA.w $0B30,X

|09BAD0| STZ.b $00

|09BAD2| LDY.b #$0F

.next_check
|09BAD4| LDA.w $0DD0,Y
|09BAD7| BEQ .skip

|09BAD9| LDA.w $0E20,Y
|09BADC| CMP.b #$10 ; SPRITE 10
|09BADE| BNE .skip

|09BAE0| INC.b $00

.skip
|09BAE2| DEY
|09BAE3| BPL .next_check

;---------------------------------------------------------------------------------------------------

|09BAE5| LDA.b $00
|09BAE7| CMP.b #$05
|09BAE9| BCS .exit

|09BAEB| LDY.b #$0C
|09BAED| LDA.b #$94 ; SPRITE 94
|09BAEF| JSL SpawnSpriteDynamically.slot_limited
|09BAF3| BMI .exit

|09BAF5| LDA.b $05
|09BAF7| STA.w $0D10,Y

|09BAFA| LDA.b $06
|09BAFC| STA.w $0D30,Y

|09BAFF| LDA.b $07
|09BB01| STA.w $0D00,Y

|09BB04| LDA.b $08
|09BB06| STA.w $0D20,Y

|09BB09| LDA.w $0B40,X
|09BB0C| STA.w $0F20,Y

|09BB0F| LDA.b #$20
|09BB11| STA.w $0DF0,Y

|09BB14| LDA.w $0FB5
|09BB17| STA.w $0DE0,Y

|09BB1A| PHX

|09BB1B| TAX

|09BB1C| LDA.w .direction,X
|09BB1F| STA.w $0D90,Y

|09BB22| PLX

.exit
|09BB23| RTS

;===================================================================================================

FallingTilesPattern:

.rectangle
|09BB24| db $02, $02, $02, $02
|09BB28| db $02, $02, $01, $01
|09BB2C| db $01, $01, $01, $01
|09BB30| db $01, $03, $03, $03
|09BB34| db $03, $03, $03, $00
|09BB38| db $00, $00, $00, $00
|09BB3C| db $00

;---------------------------------------------------------------------------------------------------

.bridge
|09BB3D| db $00, $03, $01, $03
|09BB41| db $00, $03, $01, $03
|09BB45| db $00, $03, $01, $03
|09BB49| db $00, $03, $01, $03
|09BB4D| db $00, $03, $01, $03
|09BB51| db $00, $03, $01, $03
|09BB55| db $00, $03, $01, $03
|09BB59| db $00, $03, $01, $03
|09BB5D| db $00, $03, $01, $03
|09BB61| db $00, $03, $01, $03
|09BB65| db $00

;---------------------------------------------------------------------------------------------------

.west_to_east
|09BB66| db $00, $00, $00, $00
|09BB6A| db $00, $00, $00, $00
|09BB6E| db $00, $00, $00

.north_to_south
|09BB71| db $02, $02, $02, $02
|09BB75| db $02, $02, $02, $02
|09BB79| db $02, $02

.east_to_west
|09BB7B| db $01, $01, $01, $01
|09BB7F| db $01, $01, $01, $01
|09BB83| db $01, $01, $01

.south_to_north
|09BB86| db $03, $03, $03, $03
|09BB8A| db $03, $03, $03, $03
|09BB8E| db $03, $03

;---------------------------------------------------------------------------------------------------

.move_x_low
|09BB90| db  16, -16,   0,   0

.move_x_high
|09BB94| db   0,  -1,   0,   0

.move_y_low
|09BB98| db   0,   0,  16, -16

.move_y_high
|09BB9C| db   0,   0,   0,  -1

;---------------------------------------------------------------------------------------------------

.tile_count
|09BBA0| db $1A
|09BBA1| db $2A
|09BBA2| db $0C
|09BBA3| db $0B
|09BBA4| db $0C
|09BBA5| db $0B

;---------------------------------------------------------------------------------------------------

.pointers_low
|09BBA6| db .rectangle
|09BBA7| db .bridge
|09BBA8| db .west_to_east
|09BBA9| db .north_to_south
|09BBAA| db .east_to_west
|09BBAB| db .south_to_north

.pointers_high
|09BBAC| db >.rectangle
|09BBAD| db >.bridge
|09BBAE| db >.west_to_east
|09BBAF| db >.north_to_south
|09BBB0| db >.east_to_west
|09BBB1| db >.south_to_north

;===================================================================================================

Overlord0A_FallingSquare:
Overlord0B_FallingBridge:
Overlord0C_FallingTiles_WestToEast:
Overlord0D_FallingTiles_NorthToSouth:
Overlord0E_FallingTiles_EastToWest:
Overlord0F_FallingTiles_SouthToNorth:
|09BBB2| LDA.w $0B30,X
|09BBB5| BEQ .drop_tile

|09BBB7| LDA.w $0B38,X
|09BBBA| BEQ .check_activeness

|09BBBC| DEC.w $0B30,X

|09BBBF| RTS

;---------------------------------------------------------------------------------------------------

.check_activeness
|09BBC0| LDA.w $0B08,X
|09BBC3| CMP.b $E2

|09BBC5| LDA.w $0B10,X
|09BBC8| SBC.b $E3
|09BBCA| BNE .exit

|09BBCC| LDA.w $0B18,X
|09BBCF| CMP.b $E8
|09BBD1| LDA.w $0B20,X

|09BBD4| SBC.b $E9
|09BBD6| BNE .exit

|09BBD8| INC.w $0B38,X

.exit
|09BBDB| RTS

;---------------------------------------------------------------------------------------------------

.drop_tile
|09BBDC| LDA.b #$10
|09BBDE| STA.w $0B30,X

|09BBE1| JSR SpawnFallingTile

|09BBE4| INC.w $0B28,X

|09BBE7| LDA.w $0B00,X
|09BBEA| SEC
|09BBEB| SBC.b #$0A
|09BBED| TAY

|09BBEE| LDA.w FallingTilesPattern.pointers_low,Y
|09BBF1| STA.b $00

|09BBF3| LDA.w FallingTilesPattern.pointers_high,Y
|09BBF6| STA.b $01

|09BBF8| LDA.w FallingTilesPattern.tile_count,Y
|09BBFB| CMP.w $0B28,X
|09BBFE| BNE .not_last_tile

|09BC00| STZ.w $0B00,X

;---------------------------------------------------------------------------------------------------

.not_last_tile
|09BC03| LDY.w $0B28,X
|09BC06| DEY

|09BC07| LDA.b ($00),Y
|09BC09| TAY

|09BC0A| LDA.w $0B08,X
|09BC0D| CLC
|09BC0E| ADC.w FallingTilesPattern.move_x_low,Y
|09BC11| STA.w $0B08,X

|09BC14| LDA.w $0B10,X
|09BC17| ADC.w FallingTilesPattern.move_x_high,Y
|09BC1A| STA.w $0B10,X

|09BC1D| LDA.w $0B18,X
|09BC20| CLC
|09BC21| ADC.w FallingTilesPattern.move_y_low,Y
|09BC24| STA.w $0B18,X

|09BC27| LDA.w $0B20,X
|09BC2A| ADC.w FallingTilesPattern.move_y_high,Y
|09BC2D| STA.w $0B20,X

|09BC30| RTS

;===================================================================================================

SpawnFallingTile:
|09BC31| TXY
|09BC32| PHX

|09BC33| LDX.b #$1D

.next
|09BC35| LDA.l $7FF800,X
|09BC39| BNE .skip

|09BC3B| LDA.b #$03 ; GARNISH 03
|09BC3D| STA.l $7FF800,X

|09BC41| LDA.w $0B08,Y
|09BC44| STA.l $7FF83C,X

|09BC48| JSL CalculateArbitrarySFXPan
|09BC4C| ORA.b #$1F ; SFX2.1F
|09BC4E| STA.w $012E

|09BC51| LDA.w $0B10,Y
|09BC54| STA.l $7FF878,X

|09BC58| LDA.w $0B18,Y
|09BC5B| CLC
|09BC5C| ADC.b #$10
|09BC5E| STA.l $7FF81E,X

|09BC62| LDA.w $0B20,Y
|09BC65| ADC.b #$00
|09BC67| STA.l $7FF85A,X

|09BC6B| LDA.b #$1F
|09BC6D| STA.l $7FF90E,X

|09BC71| STA.w $0FB4

|09BC74| BRA .exit

.skip
|09BC76| DEX
|09BC77| BPL .next

;---------------------------------------------------------------------------------------------------

.exit
|09BC79| PLX

|09BC7A| RTS

;===================================================================================================

Overlord09_WallmasterSpawner:
|09BC7B| LDA.w $0B30,X
|09BC7E| CMP.b #$80
|09BC80| BEQ .spawn_master

|09BC82| LDA.b $1A
|09BC84| AND.b #$01
|09BC86| BNE .exit

|09BC88| DEC.w $0B30,X

.exit
|09BC8B| RTS

;---------------------------------------------------------------------------------------------------

.spawn_master
|09BC8C| LDA.b #$7F
|09BC8E| STA.w $0B30,X

|09BC91| LDA.b #$90 ; SPRITE 90
|09BC93| LDY.b #$0C
|09BC95| JSL SpawnSpriteDynamically.slot_limited
|09BC99| BMI .no_space

|09BC9B| LDA.b $22
|09BC9D| STA.w $0D10,Y

|09BCA0| LDA.b $23
|09BCA2| STA.w $0D30,Y

|09BCA5| LDA.b $20
|09BCA7| STA.w $0D00,Y

|09BCAA| LDA.b $21
|09BCAC| STA.w $0D20,Y

|09BCAF| LDA.b #$D0
|09BCB1| STA.w $0F70,Y

|09BCB4| PHX

|09BCB5| TYX

|09BCB6| LDA.b #$20 ; SFX2.20
|09BCB8| JSL QueueSpriteSFX2WithPan

|09BCBC| PLX

|09BCBD| LDA.b $EE
|09BCBF| STA.w $0F20,Y

.no_space
|09BCC2| RTS

;===================================================================================================

Overlord08_BlobSpawner:
|09BCC3| LDA.w $0B30,X
|09BCC6| BEQ .spawn_blob

|09BCC8| DEC.w $0B30,X

|09BCCB| RTS

.spawn_blob
|09BCCC| LDA.b #$A0
|09BCCE| STA.w $0B30,X

|09BCD1| STZ.b $00

|09BCD3| LDY.b #$0F

.next_count
|09BCD5| LDA.w $0DD0,Y
|09BCD8| BEQ .dont_tally

|09BCDA| LDA.w $0E20,Y
|09BCDD| CMP.b #$8F ; SPRITE 8F
|09BCDF| BNE .dont_tally

|09BCE1| INC.b $00

.dont_tally
|09BCE3| DEY
|09BCE4| BPL .next_count

;---------------------------------------------------------------------------------------------------

|09BCE6| LDA.b $00
|09BCE8| CMP.b #$05
|09BCEA| BCS .exit

|09BCEC| LDA.b #$8F ; SPRITE 8F
|09BCEE| LDY.b #$0C
|09BCF0| JSL SpawnSpriteDynamically.slot_limited
|09BCF4| BMI .exit

|09BCF6| PHX

|09BCF7| LDA.b $2F
|09BCF9| LSR A
|09BCFA| TAX

|09BCFB| LDA.b $22
|09BCFD| CLC
|09BCFE| ADC.w BlobSpawner.offset_x_low,X
|09BD01| STA.w $0D10,Y

|09BD04| LDA.b $23
|09BD06| ADC.w BlobSpawner.offset_x_high,X
|09BD09| STA.w $0D30,Y

|09BD0C| LDA.b $20
|09BD0E| CLC
|09BD0F| ADC.w BlobSpawner.offset_y_low,X
|09BD12| STA.w $0D00,Y

|09BD15| LDA.b $21
|09BD17| ADC.w BlobSpawner.offset_y_high,X
|09BD1A| STA.w $0D20,Y

|09BD1D| PLX

|09BD1E| LDA.b #$C0
|09BD20| STA.w $0F70,Y

|09BD23| LDA.b $EE
|09BD25| STA.w $0F20,Y

|09BD28| LDA.b #$02
|09BD2A| STA.w $0D80,Y
|09BD2D| STA.w $0E90,Y
|09BD30| STA.w $0DB0,Y

|09BD33| JSL GetRandomNumber
|09BD37| AND.b #$1F
|09BD39| ORA.b #$10
|09BD3B| STA.w $0EB0,Y

.exit
|09BD3E| RTS

;===================================================================================================

Overlord07_MovingFloor:
|09BD3F| LDA.w $0DD0
|09BD42| CMP.b #$04
|09BD44| BNE .boss_not_dying

|09BD46| STZ.w $0B00,X
|09BD49| BRA .stop_floor

.boss_not_dying
|09BD4B| LDA.w $0B28,X
|09BD4E| BNE .direction_lock

|09BD50| INC.w $0B30,X

|09BD53| LDA.w $0B30,X
|09BD56| CMP.b #$20
|09BD58| BNE .stop_floor

|09BD5A| STZ.w $0B30,X

|09BD5D| JSL GetRandomNumber
|09BD61| AND.b #$03

|09BD63| LDY.w $0B08,X
|09BD66| BNE .omnidirectional

|09BD68| AND.b #$01

.omnidirectional
|09BD6A| ASL A
|09BD6B| STA.w $041A

|09BD6E| JSL GetRandomNumber
|09BD72| AND.b #$7F
|09BD74| ADC.b #$80
|09BD76| STA.w $0B30,X

|09BD79| INC.w $0B28,X

|09BD7C| RTS

;---------------------------------------------------------------------------------------------------

.stop_floor
|09BD7D| LDA.b #$01
|09BD7F| STA.w $041A

|09BD82| RTS

;---------------------------------------------------------------------------------------------------

.direction_lock
|09BD83| DEC.w $0B30,X
|09BD86| BNE .exit

|09BD88| STZ.w $0B28,X

.exit
|09BD8B| RTS

;===================================================================================================

UNREACHABLE_09BD8C:
|09BD8C| RTS

;===================================================================================================

BlobSpawner:

.offset_x_low
|09BD8D| db   0,   0, -48,  48

.offset_y_low
|09BD91| db -40,  56,   8,   8

.offset_x_high
|09BD95| db   0,   0,  -1,   0

.offset_y_high
|09BD99| db  -1,   0,   0,   0

;===================================================================================================

Overlord04_Unused:
|09BD9D| LDA.w $0B30,X
|09BDA0| BEQ .spawn

|09BDA2| LDA.b $1A
|09BDA4| AND.b #$01
|09BDA6| BNE .exit

|09BDA8| DEC.w $0B30,X

.exit
|09BDAB| RTS

;===================================================================================================

.spawn
|09BDAC| LDA.b #$30
|09BDAE| INC.w $0B28,X

|09BDB1| LDY.w $0B28,X
|09BDB4| CPY.b #$04
|09BDB6| BNE .not_max_y_position

|09BDB8| STZ.w $0B28,X

|09BDBB| LDA.b #$D0

.not_max_y_position
|09BDBD| STA.w $0B30,X

|09BDC0| LDA.b #$85 ; SPRITE 85
|09BDC2| LDY.b #$0C
|09BDC4| JSL SpawnSpriteDynamically.slot_limited
|09BDC8| BMI .no_space

|09BDCA| PHX

|09BDCB| LDA.b $2F
|09BDCD| LSR A
|09BDCE| TAX

|09BDCF| LDA.b $22
|09BDD1| CLC
|09BDD2| ADC.w BlobSpawner.offset_x_low,X
|09BDD5| STA.w $0D10,Y

|09BDD8| LDA.b $23
|09BDDA| ADC.w BlobSpawner.offset_x_high,X
|09BDDD| STA.w $0D30,Y

|09BDE0| LDA.b $20
|09BDE2| CLC
|09BDE3| ADC.w BlobSpawner.offset_y_low,X
|09BDE6| STA.w $0D00,Y

|09BDE9| LDA.b $21
|09BDEB| ADC.w BlobSpawner.offset_y_high,X
|09BDEE| STA.w $0D20,Y

|09BDF1| PLX

|09BDF2| LDA.b #$90
|09BDF4| STA.w $0F70,Y

|09BDF7| LDA.b $EE
|09BDF9| STA.w $0F20,Y

|09BDFC| RTS

;===================================================================================================

#Overlord_PlayFallingSFX:
|09BDFD| PHX
|09BDFE| TYX

|09BDFF| LDA.b #$20 ; SFX2.20
|09BE01| JSL QueueSpriteSFX2WithPan

|09BE05| PLX

.no_space
|09BE06| RTS

;===================================================================================================

pool Overlord05_FallingStalfos

.timer
|09BE07| db 255, 224, 192, 160
|09BE0B| db 128,  96,  64,  32

endpool

;---------------------------------------------------------------------------------------------------

Overlord05_FallingStalfos:
|09BE0F| LDA.w $0B08,X
|09BE12| CMP.b $E2

|09BE14| LDA.w $0B10,X
|09BE17| SBC.b $E3
|09BE19| BNE .exit_a

|09BE1B| LDA.w $0B18,X
|09BE1E| CMP.b $E8

|09BE20| LDA.w $0B20,X
|09BE23| SBC.b $E9
|09BE25| BNE .exit_a

|09BE27| LDA.w $0B28,X
|09BE2A| BNE .triggered

|09BE2C| LDA.w $0B9E
|09BE2F| BEQ .exit_a

|09BE31| INC.w $0B28,X

.exit_a
|09BE34| RTS

;---------------------------------------------------------------------------------------------------

.triggered
|09BE35| INC.w $0B28,X

|09BE38| CMP.w .timer,X
|09BE3B| BNE .exit_b

|09BE3D| STZ.w $0B00,X

|09BE40| LDA.b #$85 ; SPRITE 85
|09BE42| LDY.b #$0C
|09BE44| JSL SpawnSpriteDynamically.slot_limited
|09BE48| BMI .exit_b

|09BE4A| LDA.b $05
|09BE4C| STA.w $0D10,Y

|09BE4F| LDA.b $06
|09BE51| STA.w $0D30,Y

|09BE54| LDA.b $07
|09BE56| STA.w $0D00,Y

|09BE59| LDA.b $08
|09BE5B| STA.w $0D20,Y

|09BE5E| LDA.b #$E0
|09BE60| STA.w $0F70,Y

|09BE63| LDA.w $0B40,X
|09BE66| STA.w $0F20,Y

|09BE69| JSR Overlord_PlayFallingSFX

.exit_b
|09BE6C| RTS

;===================================================================================================

OverlordAmbushTimers:
|09BE6D| db  32,  48,  64,  80
|09BE71| db  96, 112, 128, 144

;===================================================================================================

Overlord06_BadSwitchSnake:
Overlord1A_BadSwitchBomb:
|09BE75| LDA.w $0B28,X
|09BE78| BNE .active

|09BE7A| LDA.w $0CF4
|09BE7D| BEQ .dont_activate_yet

|09BE7F| INC.w $0B28,X

.dont_activate_yet
|09BE82| RTS

;---------------------------------------------------------------------------------------------------

.active
|09BE83| INC.w $0B28,X

|09BE86| CMP.w OverlordAmbushTimers,X
|09BE89| BNE .exit

|09BE8B| LDA.b #$6E ; SPRITE 6E
|09BE8D| JSL SpawnSpriteDynamically
|09BE91| BMI .exit

|09BE93| LDA.b $05
|09BE95| STA.w $0D10,Y

|09BE98| LDA.b $06
|09BE9A| STA.w $0D30,Y

|09BE9D| LDA.b $07
|09BE9F| STA.w $0D00,Y

|09BEA2| LDA.b $08
|09BEA4| STA.w $0D20,Y

|09BEA7| LDA.b #$C0
|09BEA9| STA.w $0F70,Y
|09BEAC| STA.w $0E90,Y

|09BEAF| LDA.w $0E60,Y
|09BEB2| ORA.b #$10
|09BEB4| STA.w $0E60,Y

|09BEB7| LDA.w $0B40,X
|09BEBA| STA.w $0F20,Y

|09BEBD| JSR Overlord_PlayFallingSFX

|09BEC0| LDA.w $0B00,X
|09BEC3| STZ.w $0B00,X
|09BEC6| CMP.b #$1A ; OVERLORD 1A
|09BEC8| BNE .exit

|09BECA| LDA.b #$4A ; SPRITE 4A
|09BECC| STA.w $0E20,Y

|09BECF| JSL TransmuteSpriteToBomb

|09BED3| LDA.b #$70
|09BED5| STA.w $0E00,Y

.exit
|09BED8| RTS

;===================================================================================================

pool Overlord02_FullRoomCannons

.coordinate_index
|09BED9| db $02, $02, $02, $02
|09BEDD| db $01, $01, $01, $01
|09BEE1| db $03, $03, $03, $03
|09BEE5| db $00, $00, $00, $00

.coordinate_x
|09BEE9| db $40, $60, $90, $B0
|09BEED| db $F0, $F0, $F0, $F0
|09BEF1| db $B0, $90, $60, $40
|09BEF5| db $00, $00, $00, $00

.coordinate_y
|09BEF9| db $10, $10, $10, $10
|09BEFD| db $40, $60, $A0, $C0
|09BF01| db $F0, $F0, $F0, $F0
|09BF05| db $C0, $A0, $60, $40

endpool

;---------------------------------------------------------------------------------------------------

Overlord02_FullRoomCannons:
|09BF09| LDA.w $0B08,X
|09BF0C| CMP.b $E2

|09BF0E| LDA.w $0B10,X
|09BF11| SBC.b $E3
|09BF13| BNE .exit

|09BF15| LDA.w $0B18,X
|09BF18| CMP.b $E8

|09BF1A| LDA.w $0B20,X
|09BF1D| SBC.b $E9
|09BF1F| BNE .exit

|09BF21| LDA.b $1A
|09BF23| AND.b #$0F
|09BF25| BNE .exit

|09BF27| STZ.b $0E
|09BF29| STZ.w $0FB6

|09BF2C| JSL GetRandomNumber
|09BF30| AND.b #$0F
|09BF32| TAY

|09BF33| LDA.w .coordinate_index,Y
|09BF36| STA.w $0FB5

|09BF39| LDA.w .coordinate_x,Y
|09BF3C| STA.w $0B08,X

|09BF3F| LDA.b #$00
|09BF41| CLC
|09BF42| ADC.w $0FB0
|09BF45| STA.w $0B10,X

|09BF48| LDA.w .coordinate_y,Y
|09BF4B| STA.w $0B18,X

|09BF4E| LDA.b #$01
|09BF50| CLC
|09BF51| ADC.w $0FB1
|09BF54| STA.w $0B20,X

|09BF57| JSR Overlord_SpawnCannonBall

.exit
|09BF5A| RTS

;===================================================================================================

Overlord03_VerticalCannon:
|09BF5B| LDA.w $0B08,X
|09BF5E| CMP.b $E2

|09BF60| LDA.w $0B10,X
|09BF63| SBC.b $E3
|09BF65| BNE .inactive

|09BF67| LDA.b $1A
|09BF69| AND.b #$01
|09BF6B| BNE .resist_tick

|09BF6D| LDA.w $0B30,X
|09BF70| BEQ .resist_tick

|09BF72| DEC.w $0B30,X

.resist_tick
|09BF75| LDA.b #$02
|09BF77| STA.w $0FB5
|09BF7A| STZ.w $0FB6

|09BF7D| DEC.w $0B28,X
|09BF80| BPL .exit

|09BF82| LDA.b #$38
|09BF84| STA.w $0B28,X

|09BF87| LDA.w $0B30,X
|09BF8A| BNE .fire_small_ball

;---------------------------------------------------------------------------------------------------

.fire_big_ball
|09BF8C| LDA.b #$A0
|09BF8E| STA.w $0B30,X
|09BF91| STA.w $0FB6

|09BF94| LDA.b #$08
|09BF96| STA.b $0E

|09BF98| BRA .fire_ball

;---------------------------------------------------------------------------------------------------

.fire_small_ball
|09BF9A| JSL GetRandomNumber
|09BF9E| AND.b #$02
|09BFA0| ASL A
|09BFA1| ASL A
|09BFA2| ASL A
|09BFA3| STA.b $0E

;---------------------------------------------------------------------------------------------------

.fire_ball
|09BFA5| JSR Overlord_SpawnCannonBall

.exit
|09BFA8| RTS

.inactive
|09BFA9| LDA.b #$FF
|09BFAB| STA.w $0B30,X

|09BFAE| RTS

;===================================================================================================

Overlord_SpawnCannonBall:
|09BFAF| LDA.b #$50 ; SPRITE 50
|09BFB1| JSL SpawnSpriteDynamically
|09BFB5| BMI .exit

|09BFB7| PHX

|09BFB8| LDA.b $05
|09BFBA| CLC
|09BFBB| ADC.b $0E
|09BFBD| STA.w $0D10,Y

|09BFC0| LDA.b $06
|09BFC2| ADC.b #$00
|09BFC4| STA.w $0D30,Y

|09BFC7| LDA.b $07
|09BFC9| SEC
|09BFCA| SBC.b #$01
|09BFCC| STA.w $0D00,Y

|09BFCF| LDA.b $08
|09BFD1| SBC.b #$00
|09BFD3| STA.w $0D20,Y

|09BFD6| LDX.w $0FB5

|09BFD9| LDA.w .speed_x,X
|09BFDC| STA.w $0D50,Y

|09BFDF| LDA.w .speed_y,X
|09BFE2| STA.w $0D40,Y

|09BFE5| PLX

|09BFE6| LDA.w $0B40,X
|09BFE9| STA.w $0F20,Y

|09BFEC| LDA.w $0FB6
|09BFEF| BEQ .small_ball

;---------------------------------------------------------------------------------------------------

.big_ball
|09BFF1| STA.w $0D80,Y

|09BFF4| LDA.w $0D00,Y
|09BFF7| CLC
|09BFF8| ADC.b #$08
|09BFFA| STA.w $0D00,Y

|09BFFD| LDA.b #$03
|09BFFF| STA.w $0E40,Y

|09C002| LDA.b #$09
|09C004| STA.w $0F60,Y

;---------------------------------------------------------------------------------------------------

.small_ball
|09C007| LDA.b #$40
|09C009| STA.w $0E10,Y

|09C00C| PHX
|09C00D| TYX

|09C00E| LDA.b #$07 ; SFX3.07
|09C010| JSL QueueSpriteSFX3WithPan

|09C014| PLX

.exit
|09C015| RTS

;---------------------------------------------------------------------------------------------------

.speed_x
|09C016| db  24, -24,   0,   0

.speed_y
|09C01A| db   0,   0,  24, -24

;===================================================================================================

Overlord01_PositionTarget:
|09C01E| TXA
|09C01F| STA.w $0FDE

|09C022| RTS

;===================================================================================================

pool CallThePolice

.position_x_low
|09C023| db $20, $40, $E0

.position_x_high
|09C026| db $01, $03, $02

.position_y_low
|09C029| db $00, $B0, $60

.position_y_high
|09C02C| db $01, $03, $01

endpool

;---------------------------------------------------------------------------------------------------

CallThePolice:
|09C02F| PHB
|09C030| PHK
|09C031| PLB

|09C032| LDA.b #$45 ; SPRITE 45
|09C034| LDY.b #$00
|09C036| JSL SpawnSpriteDynamically.slot_limited
|09C03A| BMI .exit

|09C03C| PHX

|09C03D| LDA.w $0E20,X

|09C040| LDX.b #$00
|09C042| CMP.b #$3D ; SPRITE 3D
|09C044| BEQ .spawn_him_already_im_scared

|09C046| INX
|09C047| CMP.b #$35 ; SPRITE 35
|09C049| BEQ .spawn_him_already_im_scared

|09C04B| INX

.spawn_him_already_im_scared
|09C04C| LDA.w .position_x_low,X
|09C04F| STA.w $0D10,Y

|09C052| LDA.w .position_x_high,X
|09C055| CLC
|09C056| ADC.w $0FBD
|09C059| STA.w $0D30,Y

|09C05C| LDA.w .position_y_low,X
|09C05F| STA.w $0D00,Y

|09C062| LDA.w .position_y_high,X
|09C065| CLC
|09C066| ADC.w $0FBF
|09C069| STA.w $0D20,Y

|09C06C| PLX

;---------------------------------------------------------------------------------------------------

|09C06D| LDA.b #$00
|09C06F| STA.w $0F20,Y

|09C072| LDA.b #$04
|09C074| STA.w $0E50,Y

|09C077| LDA.b #$80
|09C079| STA.w $0CAA,Y

|09C07C| LDA.b #$90
|09C07E| STA.w $0BE0,Y

|09C081| LDA.b #$0B
|09C083| STA.w $0F50,Y

;---------------------------------------------------------------------------------------------------

.exit
|09C086| PLB

|09C087| RTL

;===================================================================================================

pool Overlord_CheckIfActive

.offset_low
|09C088| db $30, $C0

.offset_high
|09C08A| db $01, $FF

endpool

;---------------------------------------------------------------------------------------------------

#EXIT_09C08C:
|09C08C| RTS

;---------------------------------------------------------------------------------------------------

Overlord_CheckIfActive:
|09C08D| LDA.b $1B
|09C08F| BNE EXIT_09C08C

|09C091| LDA.b $1A
|09C093| AND.b #$01
|09C095| STA.b $01
|09C097| STA.b $02

|09C099| TAY

|09C09A| LDA.b $E2
|09C09C| CLC
|09C09D| ADC.w .offset_low,Y
|09C0A0| ROL.b $00

|09C0A2| CMP.w $0B08,X
|09C0A5| PHP

|09C0A6| LDA.b $E3
|09C0A8| LSR.b $00
|09C0AA| ADC.w .offset_high,Y

|09C0AD| PLP
|09C0AE| SBC.w $0B10,X
|09C0B1| STA.b $00

|09C0B3| LSR.b $01
|09C0B5| BCC .positive_x

|09C0B7| EOR.b #$80
|09C0B9| STA.b $00

;---------------------------------------------------------------------------------------------------

.positive_x
|09C0BB| LDA.b $00
|09C0BD| BMI .negative_x

|09C0BF| LDA.b $E8
|09C0C1| CLC
|09C0C2| ADC.w .offset_low,Y
|09C0C5| ROL.b $00

|09C0C7| CMP.w $0B18,X
|09C0CA| PHP

|09C0CB| LDA.b $E9
|09C0CD| LSR.b $00
|09C0CF| ADC.w .offset_high,Y

|09C0D2| PLP
|09C0D3| SBC.w $0B20,X
|09C0D6| STA.b $00

|09C0D8| LSR.b $02
|09C0DA| BCC .negative_y

|09C0DC| EOR.b #$80
|09C0DE| STA.b $00

.negative_y
|09C0E0| LDA.b $00
|09C0E2| BPL .exit

;---------------------------------------------------------------------------------------------------

.negative_x
|09C0E4| STZ.w $0B00,X

|09C0E7| TXA
|09C0E8| ASL A
|09C0E9| TAY

|09C0EA| REP #$20

|09C0EC| LDA.w $0B48,Y
|09C0EF| STA.b $00

|09C0F1| CMP.w #$FFFF
|09C0F4| PHP

|09C0F5| LSR A
|09C0F6| LSR A
|09C0F7| LSR A
|09C0F8| CLC
|09C0F9| ADC.w #$7FEF80
|09C0FC| STA.b $01

|09C0FE| PLP
|09C0FF| SEP #$20
|09C101| BCS .exit

|09C103| LDA.b #$7F
|09C105| STA.b $03

|09C107| LDA.b $00
|09C109| AND.b #$07
|09C10B| TAY

|09C10C| LDA.b [$01]
|09C10E| AND.w SpriteDeathMasks,Y
|09C111| STA.b [$01]

.exit
|09C113| RTS

;===================================================================================================

Underworld_ResetSprites:
|09C114| PHB
|09C115| PHK
|09C116| PLB

|09C117| JSR Underworld_CacheTransSprites

|09C11A| STZ.w $0309
|09C11D| STZ.w $0308

|09C120| JSL DisableAllEntities

|09C124| REP #$20

|09C126| LDA.w #$FFFF
|09C129| STA.w $0FBA
|09C12C| STA.w $0FB8

;---------------------------------------------------------------------------------------------------

|09C12F| LDX.b #$00

|09C131| LDA.w $048E

.check_next_room
|09C134| CMP.w $0B80,X
|09C137| BEQ .finish_up

|09C139| INX
|09C13A| INX
|09C13B| CPX.b #$07
|09C13D| BCC .check_next_room

;---------------------------------------------------------------------------------------------------

|09C13F| LDA.w $0B86
|09C142| STA.b $00

|09C144| LDA.w $0B84
|09C147| STA.w $0B86

|09C14A| LDA.w $0B82
|09C14D| STA.w $0B84

|09C150| LDA.w $0B80
|09C153| STA.w $0B82

|09C156| LDA.w $048E
|09C159| STA.w $0B80

|09C15C| REP #$10

|09C15E| LDA.b $00
|09C160| CMP.w #$FFFF
|09C163| BEQ .finish_up

|09C165| ASL A
|09C166| TAX

|09C167| LDA.w #$0000
|09C16A| STA.l $7FDF80,X

.finish_up
|09C16E| SEP #$30

|09C170| JSR LoadUnderworldSprites

|09C173| PLB

|09C174| RTL

;===================================================================================================

#EXIT_09C175:
|09C175| RTS

;===================================================================================================

Underworld_CacheTransSprites:
|09C176| LDA.b $1B
|09C178| BEQ EXIT_09C175

|09C17A| STA.w $0FFA

|09C17D| LDX.b #$0F

.next
|09C17F| STZ.w $1D00,X

|09C182| LDA.w $0E20,X
|09C185| STA.w $1D10,X

|09C188| LDA.w $0D10,X
|09C18B| STA.w $1D20,X

|09C18E| LDA.w $0DC0,X
|09C191| STA.w $1D60,X

|09C194| LDA.w $0D30,X
|09C197| STA.w $1D30,X

|09C19A| LDA.w $0D00,X
|09C19D| STA.w $1D40,X

|09C1A0| LDA.w $0D20,X
|09C1A3| STA.w $1D50,X

|09C1A6| LDA.w $0F00,X
|09C1A9| BNE .skip

|09C1AB| LDA.w $0DD0,X
|09C1AE| CMP.b #$04
|09C1B0| BEQ .skip

|09C1B2| CMP.b #$0A
|09C1B4| BEQ .skip

;---------------------------------------------------------------------------------------------------

|09C1B6| STA.w $1D00,X

|09C1B9| LDA.w $0D90,X
|09C1BC| STA.w $1D70,X

|09C1BF| LDA.w $0EB0,X
|09C1C2| STA.w $1D80,X

|09C1C5| LDA.w $0F50,X
|09C1C8| STA.w $1D90,X

|09C1CB| LDA.w $0B89,X
|09C1CE| STA.w $1DA0,X

|09C1D1| LDA.w $0DE0,X
|09C1D4| STA.w $1DB0,X

|09C1D7| LDA.w $0E40,X
|09C1DA| STA.w $1DC0,X

|09C1DD| LDA.w $0F20,X
|09C1E0| STA.w $1DD0,X

|09C1E3| LDA.w $0D80,X
|09C1E6| STA.w $1DE0,X

|09C1E9| LDA.w $0E60,X
|09C1EC| STA.w $1DF0,X

|09C1EF| LDA.w $0DA0,X
|09C1F2| STA.l $7FFA5C,X

|09C1F6| LDA.w $0DB0,X
|09C1F9| STA.l $7FFA6C,X

|09C1FD| LDA.w $0E90,X
|09C200| STA.l $7FFA7C,X

|09C204| LDA.w $0E80,X
|09C207| STA.l $7FFA8C,X

|09C20B| LDA.w $0F70,X
|09C20E| STA.l $7FFA9C,X

|09C212| LDA.w $0DF0,X
|09C215| STA.l $7FFAAC,X

|09C219| LDA.l $7FF9C2,X
|09C21D| STA.l $7FFACC,X

|09C221| LDA.w $0BA0,X
|09C224| STA.l $7FFADC,X

;---------------------------------------------------------------------------------------------------

.skip
|09C228| DEX
|09C229| BMI .exit

|09C22B| JMP.w .next

.exit
|09C22E| RTS

;===================================================================================================

DisableAllEntities:
|09C22F| LDX.b #$0F

.next_sprite
|09C231| LDA.w $0DD0,X
|09C234| BEQ .skip

|09C236| LDA.b $1B
|09C238| BNE .delete

|09C23A| LDA.w $0E20,X
|09C23D| CMP.b #$6C ; SPRITE 6C
|09C23F| BEQ .skip

.delete
|09C241| STZ.w $0DD0,X

.skip
|09C244| DEX
|09C245| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|09C247| LDX.b #$09

.next_ancilla
|09C249| STZ.w $0C4A,X

|09C24C| DEX
|09C24D| BPL .next_ancilla

;---------------------------------------------------------------------------------------------------

|09C24F| STZ.w $02EC

|09C252| STZ.w $0B6A
|09C255| STZ.w $0B9B

|09C258| STZ.w $0B88
|09C25B| STZ.w $0B99

|09C25E| STZ.w $0FB4

|09C261| STZ.w $0B9E

|09C264| STZ.w $0CF4

|09C267| STZ.w $0FF9
|09C26A| STZ.w $0FF8

|09C26D| STZ.w $0FFB
|09C270| STZ.w $0FFC
|09C273| STZ.w $0FFD

|09C276| STZ.w $0FC6

|09C279| STZ.w $03FC

;---------------------------------------------------------------------------------------------------

|09C27C| LDX.b #$07

.next_overlord
|09C27E| STZ.w $0B00,X

|09C281| DEX
|09C282| BPL .next_overlord

;---------------------------------------------------------------------------------------------------

|09C284| LDX.b #$1D

.next_garnish
|09C286| LDA.b #$00
|09C288| STA.l $7FF800,X

|09C28C| DEX
|09C28D| BPL .next_garnish

|09C28F| RTL

;===================================================================================================

LoadUnderworldSprites:
|09C290| REP #$30

|09C292| LDA.w $048E
|09C295| ASL A
|09C296| TAY

|09C297| LDA.w RoomData_SpritePointers,Y
|09C29A| STA.b $00

|09C29C| LDA.w $048E
|09C29F| LSR A
|09C2A0| LSR A
|09C2A1| LSR A

|09C2A2| SEP #$30

|09C2A4| AND.b #$FE
|09C2A6| STA.w $0FB1

|09C2A9| LDA.w $048E
|09C2AC| AND.b #$0F
|09C2AE| ASL A
|09C2AF| STA.w $0FB0

|09C2B2| LDA.b ($00)
|09C2B4| STA.w $0FB3

|09C2B7| LDA.b #$01
|09C2B9| STA.b $04

|09C2BB| STZ.b $02
|09C2BD| STZ.b $03

;---------------------------------------------------------------------------------------------------

.next_sprite
|09C2BF| LDY.b $04

|09C2C1| LDA.b ($00),Y
|09C2C3| CMP.b #$FF
|09C2C5| BEQ .done

|09C2C7| JSR LoadSingleUnderworldSprite

|09C2CA| INC.b $02

|09C2CC| INC.b $04
|09C2CE| INC.b $04
|09C2D0| INC.b $04

|09C2D2| BRA .next_sprite

.done
|09C2D4| RTS

;===================================================================================================

SpriteSlotToDeathBit:
|09C2D5| dw $0001, $0002, $0004, $0008
|09C2DD| dw $0010, $0020, $0040, $0080
|09C2E5| dw $0100, $0200, $0400, $0800
|09C2ED| dw $1000, $2000, $4000, $8000

;---------------------------------------------------------------------------------------------------

ManuallySetDeathFlagUW:
|09C2F5| PHB
|09C2F6| PHK
|09C2F7| PLB

|09C2F8| LDA.b $1B
|09C2FA| BEQ .exit

|09C2FC| LDA.w $0CAA,X
|09C2FF| LSR A
|09C300| BCS .exit

|09C302| LDA.w $0BC0,X
|09C305| BMI .exit

|09C307| STA.b $02
|09C309| STZ.b $03

|09C30B| REP #$30

|09C30D| PHX

|09C30E| LDA.w $048E
|09C311| ASL A
|09C312| TAX

|09C313| LDA.b $02
|09C315| ASL A
|09C316| TAY

|09C317| LDA.l $7FDF80,X
|09C31B| ORA.w SpriteSlotToDeathBit,Y
|09C31E| STA.l $7FDF80,X

|09C322| PLX

|09C323| SEP #$30

.exit
|09C325| PLB

|09C326| RTL

;===================================================================================================

LoadSingleUnderworldSprite:
|09C327| INY
|09C328| INY

|09C329| LDA.b ($00),Y
|09C32B| TAX

|09C32C| CPX.b #$E4 ; SPRITE E4
|09C32E| BNE .not_key

|09C330| DEY
|09C331| DEY

|09C332| LDA.b ($00),Y

|09C334| INY
|09C335| INY

|09C336| CMP.b #$FE
|09C338| BEQ .small_key

|09C33A| CMP.b #$FD
|09C33C| BNE .not_overlord_or_bigkey

|09C33E| JSR .small_key

|09C341| INC.w $0CBA,X

|09C344| RTS

;---------------------------------------------------------------------------------------------------

.small_key
|09C345| DEC.b $02

|09C347| LDX.b $02

|09C349| LDA.b #$01
|09C34B| STA.w $0CBA,X

|09C34E| RTS

;---------------------------------------------------------------------------------------------------

.not_key
|09C34F| DEY

|09C350| LDA.b ($00),Y
|09C352| INY
|09C353| CMP.b #$E0
|09C355| BCC .not_overlord_or_bigkey

|09C357| JSR LoadSingleUnderworldOverlord

|09C35A| DEC.b $02

|09C35C| RTS

;---------------------------------------------------------------------------------------------------

.not_overlord_or_bigkey
|09C35D| LDA.l SpriteData_Deflection,X
|09C361| AND.b #$01
|09C363| BNE .spawn

|09C365| REP #$30

|09C367| PHY
|09C368| PHX

|09C369| LDA.w $048E
|09C36C| ASL A
|09C36D| TAX

|09C36E| LDA.b $02
|09C370| ASL A
|09C371| TAY

|09C372| LDA.l $7FDF80,X
|09C376| AND.w SpriteSlotToDeathBit,Y

|09C379| PLX
|09C37A| PLY

|09C37B| CMP.w #$0000

|09C37E| SEP #$30
|09C380| BEQ .spawn

|09C382| RTS

;---------------------------------------------------------------------------------------------------

.spawn
|09C383| LDX.b $02

|09C385| DEY
|09C386| DEY

|09C387| LDA.b #$08
|09C389| STA.w $0DD0,X

|09C38C| LDA.b ($00),Y
|09C38E| STA.w $0FB5

|09C391| AND.b #$80
|09C393| ASL A
|09C394| ROL A
|09C395| STA.w $0F20,X

|09C398| LDA.b ($00),Y
|09C39A| ASL A
|09C39B| ASL A
|09C39C| ASL A
|09C39D| ASL A
|09C39E| STA.w $0D00,X

|09C3A1| LDA.w $0FB1
|09C3A4| ADC.b #$00
|09C3A6| STA.w $0D20,X

|09C3A9| INY

|09C3AA| LDA.b ($00),Y
|09C3AC| STA.w $0FB6

|09C3AF| ASL A
|09C3B0| ASL A
|09C3B1| ASL A
|09C3B2| ASL A
|09C3B3| STA.w $0D10,X

|09C3B6| LDA.w $0FB0
|09C3B9| ADC.b #$00
|09C3BB| STA.w $0D30,X

|09C3BE| INY

|09C3BF| LDA.b ($00),Y
|09C3C1| STA.w $0E20,X

|09C3C4| STZ.w $0E30,X

|09C3C7| LDA.w $0FB5
|09C3CA| AND.b #$60
|09C3CC| LSR A
|09C3CD| LSR A
|09C3CE| STA.w $0FB5

|09C3D1| LDA.w $0FB6
|09C3D4| LSR A
|09C3D5| LSR A
|09C3D6| LSR A
|09C3D7| LSR A
|09C3D8| LSR A
|09C3D9| ORA.w $0FB5
|09C3DC| STA.w $0E30,X

|09C3DF| LDA.b $02
|09C3E1| STA.w $0BC0,X

|09C3E4| STZ.w $0CBA,X

|09C3E7| RTS

;===================================================================================================

LoadSingleUnderworldOverlord:
|09C3E8| LDX.b #$07

.next_slot
|09C3EA| LDA.w $0B00,X
|09C3ED| BEQ .open_slot

|09C3EF| DEX
|09C3F0| BPL .next_slot

|09C3F2| RTS

;---------------------------------------------------------------------------------------------------

.open_slot
|09C3F3| LDA.b ($00),Y
|09C3F5| NOP
|09C3F6| STA.w $0B00,X

|09C3F9| DEY
|09C3FA| DEY

|09C3FB| LDA.b ($00),Y
|09C3FD| AND.b #$80
|09C3FF| ASL A
|09C400| ROL A
|09C401| STA.w $0B40,X

|09C404| LDA.b ($00),Y
|09C406| ASL A
|09C407| ASL A
|09C408| ASL A
|09C409| ASL A
|09C40A| STA.w $0B18,X

|09C40D| LDA.w $0FB1
|09C410| ADC.b #$00
|09C412| STA.w $0B20,X

|09C415| INY

|09C416| LDA.b ($00),Y
|09C418| ASL A
|09C419| ASL A
|09C41A| ASL A
|09C41B| ASL A
|09C41C| STA.w $0B08,X

|09C41F| LDA.w $0FB0
|09C422| ADC.b #$00
|09C424| STA.w $0B10,X

;---------------------------------------------------------------------------------------------------

|09C427| JSR InitSpawnedOverlord

|09C42A| LDA.w $0B00,X
|09C42D| CMP.b #$0A ; OVERLORD 0A
|09C42F| BEQ .position_overlord

|09C431| CMP.b #$0B ; OVERLORD 0B
|09C433| BEQ .position_overlord

|09C435| CMP.b #$03 ; OVERLORD 03
|09C437| BNE .exit

|09C439| LDA.b #$FF
|09C43B| STA.w $0B30,X

|09C43E| LDA.w $0B08,X
|09C441| SEC
|09C442| SBC.b #$08
|09C444| STA.w $0B08,X

.exit
|09C447| RTS

;---------------------------------------------------------------------------------------------------

.position_overlord
|09C448| LDA.b #$A0
|09C44A| STA.w $0B30,X

|09C44D| RTS

;===================================================================================================

ResetAllSprites:
|09C44E| JSL DisableAllEntities

;===================================================================================================

ResetSpriteBuffers:
|09C452| STZ.w $0FDD
|09C455| STZ.w $0FDC
|09C458| STZ.w $0FFD

|09C45B| STZ.w $02F0

|09C45E| STZ.w $0FC6

|09C461| STZ.w $0B6A

|09C464| STZ.w $0FB3

|09C467| LDA.l $7EF3CC
|09C46B| CMP.b #$0D ; FOLLOWER 0D
|09C46D| BEQ .is_super_bomb

|09C46F| LDA.b #$FE
|09C471| STA.w $04B4

.is_super_bomb
|09C474| REP #$10

;---------------------------------------------------------------------------------------------------

|09C476| LDX.w #$0FFF

|09C479| LDA.b #$00

.next_room
|09C47B| STA.l $7FDF80,X

|09C47F| DEX
|09C480| BPL .next_room

;---------------------------------------------------------------------------------------------------

|09C482| LDX.w #$01FF

.next_screen
|09C485| STA.l $7FEF80,X

|09C489| DEX
|09C48A| BPL .next_screen

;---------------------------------------------------------------------------------------------------

|09C48C| SEP #$10

|09C48E| LDY.b #$07
|09C490| LDA.b #$FF

.next_visited_room
|09C492| STA.w $0B80,Y

|09C495| DEY
|09C496| BPL .next_visited_room

|09C498| RTL

;===================================================================================================

ResetAndReloadOverworldSprites:
|09C499| JSL DisableAllEntities

;===================================================================================================

ReloadOverworldSprites:
|09C49D| JSL ResetSpriteBuffers

|09C4A1| PHB
|09C4A2| PHK
|09C4A3| PLB

|09C4A4| JSR LoadOverworldSprites
|09C4A7| JSR ActivateAllNearbySprites

|09C4AA| PLB

|09C4AB| RTL

;===================================================================================================

LoadOverworldSprites:
|09C4AC| LDA.w $040A
|09C4AF| AND.b #$07
|09C4B1| ASL A

|09C4B2| STZ.w $0FBC
|09C4B5| STA.w $0FBD

|09C4B8| LDA.w $040A
|09C4BB| AND.b #$3F
|09C4BD| LSR A
|09C4BE| LSR A
|09C4BF| AND.b #$0E
|09C4C1| STA.w $0FBF
|09C4C4| STZ.w $0FBE

|09C4C7| LDA.w $040A
|09C4CA| TAY

|09C4CB| LDX.w OverworldScreenSizeForLoading,Y
|09C4CE| STX.w $0FB9
|09C4D1| STZ.w $0FB8

|09C4D4| STX.w $0FBB
|09C4D7| STZ.w $0FBA

|09C4DA| REP #$30

|09C4DC| LDA.w $040A
|09C4DF| ASL A
|09C4E0| TAY

|09C4E1| SEP #$20

|09C4E3| LDA.l $7EF3C5
|09C4E7| CMP.b #$03
|09C4E9| BEQ .aga_dead

|09C4EB| CMP.b #$02
|09C4ED| BEQ .zelda_rescued

;---------------------------------------------------------------------------------------------------

|09C4EF| LDA.w Overworld_SpritePointers.state_0+0,Y
|09C4F2| STA.b $00

|09C4F4| LDA.w Overworld_SpritePointers.state_0+1,Y
|09C4F7| BRA .start_loading

;---------------------------------------------------------------------------------------------------

.aga_dead
|09C4F9| LDA.w Overworld_SpritePointers.state_2+0,Y
|09C4FC| STA.b $00

|09C4FE| LDA.w Overworld_SpritePointers.state_2+1,Y
|09C501| BRA .start_loading

;---------------------------------------------------------------------------------------------------

.zelda_rescued
|09C503| LDA.w Overworld_SpritePointers.state_1+0,Y
|09C506| STA.b $00

|09C508| LDA.w Overworld_SpritePointers.state_1+1,Y

;---------------------------------------------------------------------------------------------------

.start_loading
|09C50B| STA.b $01

|09C50D| LDY.w #$0000

.next_sprite
|09C510| LDA.b ($00),Y
|09C512| CMP.b #$FF
|09C514| BEQ .done_sprites

|09C516| INY
|09C517| INY

|09C518| LDA.b ($00),Y

|09C51A| DEY
|09C51B| DEY

|09C51C| CMP.b #$F4
|09C51E| BNE .not_boulder_spawner

|09C520| INC.w $0FFD

|09C523| INY
|09C524| INY
|09C525| INY

|09C526| BRA .next_sprite

.not_boulder_spawner
|09C528| LDA.b ($00),Y
|09C52A| PHA

|09C52B| LSR A
|09C52C| LSR A
|09C52D| LSR A
|09C52E| LSR A

|09C52F| ASL A
|09C530| ASL A

|09C531| STA.b $02

|09C533| INY

|09C534| LDA.b ($00),Y

|09C536| LSR A
|09C537| LSR A
|09C538| LSR A
|09C539| LSR A

|09C53A| CLC
|09C53B| ADC.b $02
|09C53D| STA.b $06

|09C53F| PLA

|09C540| ASL A
|09C541| ASL A
|09C542| ASL A
|09C543| ASL A

|09C544| STA.b $07

|09C546| LDA.b ($00),Y
|09C548| AND.b #$0F
|09C54A| ORA.b $07
|09C54C| STA.b $05

|09C54E| INY

|09C54F| LDA.b ($00),Y

|09C551| LDX.b $05

|09C553| INC A
|09C554| STA.l $7FDF80,X

|09C558| INY

|09C559| BRA .next_sprite

;---------------------------------------------------------------------------------------------------

.done_sprites
|09C55B| SEP #$10

|09C55D| RTS

;===================================================================================================

ActivateAllNearbySprites:
|09C55E| LDA.b $E2
|09C560| PHA

|09C561| LDA.b $E3
|09C563| PHA

|09C564| LDA.w $069F
|09C567| PHA

|09C568| LDA.b #$FF
|09C56A| STA.w $069F

|09C56D| LDY.b #$15

;---------------------------------------------------------------------------------------------------

.next
|09C56F| PHY

|09C570| JSR ActivateSpriteWhenProximal_Horizontal

|09C573| PLY

|09C574| LDA.b $E2
|09C576| CLC
|09C577| ADC.b #$10
|09C579| STA.b $E2

|09C57B| LDA.b $E3
|09C57D| ADC.b #$00
|09C57F| STA.b $E3

|09C581| DEY
|09C582| BPL .next

;---------------------------------------------------------------------------------------------------

|09C584| PLA
|09C585| STA.w $069F

|09C588| PLA
|09C589| STA.b $E3

|09C58B| PLA
|09C58C| STA.b $E2

|09C58E| RTS

;===================================================================================================

ProximalSpriteActivation:
|09C58F| PHB
|09C590| PHK
|09C591| PLB

|09C592| LDA.b $11
|09C594| BEQ .good_submode

|09C596| JSR ActivateSpriteWhenProximal_Horizontal
|09C599| JSR ActivateSpriteWhenProximal_Vertical

|09C59C| PLB

|09C59D| RTL

;---------------------------------------------------------------------------------------------------

.good_submode
|09C59E| LDA.w $0FB7
|09C5A1| AND.b #$01
|09C5A3| BNE .big_screen

|09C5A5| JSR ActivateSpriteWhenProximal_Horizontal

.big_screen
|09C5A8| LDA.w $0FB7
|09C5AB| AND.b #$01
|09C5AD| BEQ .not_big

|09C5AF| JSR ActivateSpriteWhenProximal_Vertical

.not_big
|09C5B2| INC.w $0FB7

|09C5B5| PLB

|09C5B6| RTL

;===================================================================================================

pool ActivateSpriteWhenProximal_Horizontal

.offset_low
|09C5B7| db $10, $F0

.offset_high
|09C5B9| db $01, $FF

endpool

;---------------------------------------------------------------------------------------------------

ActivateSpriteWhenProximal_Horizontal:
|09C5BB| LDY.b #$00

|09C5BD| LDA.w $069F
|09C5C0| BEQ .exit
|09C5C2| BPL .good

|09C5C4| INY

.good
|09C5C5| LDA.b $E2
|09C5C7| CLC
|09C5C8| ADC.w .offset_low,Y
|09C5CB| STA.b $0E

|09C5CD| LDA.b $E3
|09C5CF| ADC.w .offset_high,Y
|09C5D2| STA.b $0F

|09C5D4| LDA.b $E8
|09C5D6| SEC
|09C5D7| SBC.b #$30
|09C5D9| STA.b $0C

|09C5DB| LDA.b $E9
|09C5DD| SBC.b #$00
|09C5DF| STA.b $0D

;---------------------------------------------------------------------------------------------------

|09C5E1| LDX.b #$15

.next
|09C5E3| JSR ProximityMotivatedLoad

|09C5E6| REP #$20

|09C5E8| LDA.b $0C
|09C5EA| CLC
|09C5EB| ADC.w #$0010
|09C5EE| STA.b $0C

|09C5F0| SEP #$20

|09C5F2| DEX
|09C5F3| BPL .next

.exit
|09C5F5| RTS

;===================================================================================================

pool ActivateSpriteWhenProximal_Vertical

.offset_low
|09C5F6| db $10, $F0

.offset_high
|09C5F8| db $01, $FF

endpool

;---------------------------------------------------------------------------------------------------

ActivateSpriteWhenProximal_Vertical:
|09C5FA| LDY.b #$00

|09C5FC| LDA.w $069E
|09C5FF| BEQ .done

|09C601| BPL .good

|09C603| INY

.good
|09C604| LDA.b $E8
|09C606| CLC
|09C607| ADC.w .offset_low,Y
|09C60A| STA.b $0C

|09C60C| LDA.b $E9
|09C60E| ADC.w .offset_high,Y
|09C611| STA.b $0D

|09C613| LDA.b $E2
|09C615| SEC
|09C616| SBC.b #$30
|09C618| STA.b $0E

|09C61A| LDA.b $E3
|09C61C| SBC.b #$00
|09C61E| STA.b $0F

;---------------------------------------------------------------------------------------------------

|09C620| LDX.b #$15

.next
|09C622| JSR ProximityMotivatedLoad

|09C625| REP #$20

|09C627| LDA.b $0E
|09C629| CLC
|09C62A| ADC.w #$0010
|09C62D| STA.b $0E

|09C62F| SEP #$20

|09C631| DEX
|09C632| BPL .next

.done
|09C634| RTS

;===================================================================================================

OverworldScreenSizeForLoading:
|09C635| db $04, $04, $02, $04, $04, $04, $04, $02
|09C63D| db $04, $04, $04, $04, $04, $04, $04, $04
|09C645| db $02, $02, $02, $02, $02, $02, $02, $02
|09C64D| db $04, $04, $02, $04, $04, $02, $04, $04
|09C655| db $04, $04, $02, $04, $04, $02, $04, $04
|09C65D| db $02, $02, $02, $02, $02, $02, $02, $02
|09C665| db $04, $04, $02, $02, $02, $04, $04, $02
|09C66D| db $04, $04, $02, $02, $02, $04, $04, $02

|09C675| db $04, $04, $02, $04, $04, $04, $04, $02
|09C67D| db $04, $04, $04, $04, $04, $04, $04, $04
|09C685| db $02, $02, $02, $02, $02, $02, $02, $02
|09C68D| db $04, $04, $02, $04, $04, $02, $04, $04
|09C695| db $04, $04, $02, $04, $04, $02, $04, $04
|09C69D| db $02, $02, $02, $02, $02, $02, $02, $02
|09C6A5| db $04, $04, $02, $02, $02, $04, $04, $02
|09C6AD| db $04, $04, $02, $02, $02, $04, $04, $02

|09C6B5| db $04, $04, $02, $04, $04, $04, $04, $02
|09C6BD| db $04, $04, $04, $04, $04, $04, $04, $04
|09C6C5| db $02, $02, $02, $02, $02, $02, $02, $02
|09C6CD| db $04, $04, $02, $04, $04, $02, $04, $04
|09C6D5| db $04, $04, $02, $04, $04, $02, $04, $04
|09C6DD| db $02, $02, $02, $02, $02, $02, $02, $02
|09C6E5| db $04, $04, $02, $02, $02, $04, $04, $02
|09C6ED| db $04, $04, $02, $02, $02, $04, $04, $02

;===================================================================================================

ProximityMotivatedLoad:
|09C6F5| REP #$20

|09C6F7| LDA.b $0E
|09C6F9| SEC
|09C6FA| SBC.w $0FBC
|09C6FD| CMP.w $0FB8
|09C700| BCS .exit

|09C702| XBA
|09C703| STA.b $00

|09C705| LDA.b $0C
|09C707| SEC
|09C708| SBC.w $0FBE
|09C70B| CMP.w $0FBA
|09C70E| BCS .exit

;---------------------------------------------------------------------------------------------------

|09C710| SEP #$20

|09C712| XBA
|09C713| ASL A
|09C714| ASL A
|09C715| ORA.b $00
|09C717| STA.b $01

|09C719| LDA.b $0C
|09C71B| AND.b #$F0
|09C71D| STA.b $00

|09C71F| LDA.b $0E
|09C721| LSR A
|09C722| LSR A
|09C723| LSR A
|09C724| LSR A
|09C725| ORA.b $00
|09C727| STA.b $00

|09C729| PHX

|09C72A| JSR LoadProximaSpriteIfAlive

|09C72D| PLX

.exit
|09C72E| SEP #$20

|09C730| RTS

;===================================================================================================

OverworldAlivenessMasks:
|09C731| db $80, $40, $20, $10, $08, $04, $02, $01

;===================================================================================================

LoadProximaSpriteIfAlive:
|09C739| REP #$20

|09C73B| LDA.b $00
|09C73D| CLC
|09C73E| ADC.w #$7FDF80
|09C741| STA.b $05

|09C743| SEP #$20

|09C745| LDA.b #^$7FDF80
|09C747| STA.b $07

|09C749| LDA.b [$05]
|09C74B| BEQ .alive

|09C74D| REP #$20

|09C74F| LDA.b $00
|09C751| LSR A
|09C752| LSR A
|09C753| LSR A
|09C754| CLC
|09C755| ADC.w #$7FEF80
|09C758| STA.b $02

|09C75A| SEP #$20

|09C75C| LDA.b #^$7FEF80
|09C75E| STA.b $04

|09C760| LDA.b $00
|09C762| AND.b #$07
|09C764| TAY

|09C765| LDA.b [$02]
|09C767| AND.w OverworldAlivenessMasks,Y
|09C76A| BNE .alive

|09C76C| JSR LoadSingleOverworldSprite

.alive
|09C76F| RTS

;===================================================================================================

LoadSingleOverworldSprite:
|09C770| LDA.b [$05]
|09C772| CMP.b #$F4
|09C774| BCC .load_sprite

|09C776| JSR LoadSingleOverworldOverlord

|09C779| RTS

;---------------------------------------------------------------------------------------------------

.load_sprite
|09C77A| LDX.b #$04 ; barriers can only spawn in slots 0-4
|09C77C| CMP.b #$58 ; SPRITE 57 +1
|09C77E| BEQ .check_slot

|09C780| LDX.b #$05 ; swamola can only spawn in slots 0-5
|09C782| CMP.b #$D0 ; SPRITE CF +1
|09C784| BEQ .check_slot

|09C786| LDX.b #$0D
|09C788| CMP.b #$58 ; SPRITE 57 +1
|09C78A| BEQ .slot14

|09C78C| CMP.b #$EB ; SPRITE EA +1
|09C78E| BEQ .slot14

|09C790| CMP.b #$53 ; SPRITE 52 +1
|09C792| BEQ .slot14

|09C794| CMP.b #$F3 ; SPRITE F2 +1
|09C796| BNE .check_slot

.slot14
|09C798| LDX.b #$0E

.check_slot
|09C79A| LDA.w $0DD0,X
|09C79D| BEQ .free_slot

|09C79F| LDA.w $0E20,X
|09C7A2| CMP.b #$41 ; SPRITE 41
|09C7A4| BNE .not_even_a_probe

|09C7A6| LDA.w $0DB0,X
|09C7A9| BNE .free_slot

.not_even_a_probe
|09C7AB| DEX
|09C7AC| BPL .check_slot

|09C7AE| RTS

;---------------------------------------------------------------------------------------------------

.free_slot
|09C7AF| LDA.b [$02]
|09C7B1| ORA.w OverworldAlivenessMasks,Y
|09C7B4| STA.b [$02]

|09C7B6| PHX

|09C7B7| TXA
|09C7B8| ASL A
|09C7B9| TAX

|09C7BA| REP #$20

|09C7BC| LDA.b $00
|09C7BE| STA.w $0BC0,X

|09C7C1| SEP #$20

|09C7C3| PLX

|09C7C4| LDA.b [$05]
|09C7C6| DEC A
|09C7C7| STA.w $0E20,X

|09C7CA| LDA.b #$08
|09C7CC| STA.w $0DD0,X

|09C7CF| LDA.b $00
|09C7D1| ASL A
|09C7D2| ASL A
|09C7D3| ASL A
|09C7D4| ASL A
|09C7D5| STA.w $0D10,X

|09C7D8| LDA.b $00
|09C7DA| AND.b #$F0
|09C7DC| STA.w $0D00,X

|09C7DF| LDA.b $01
|09C7E1| AND.b #$03
|09C7E3| STA.w $0D30,X

|09C7E6| LDA.b $01
|09C7E8| LSR A
|09C7E9| LSR A
|09C7EA| STA.w $0D20,X

|09C7ED| LDA.w $0D30,X
|09C7F0| CLC
|09C7F1| ADC.w $0FBD
|09C7F4| STA.w $0D30,X

|09C7F7| LDA.w $0D20,X
|09C7FA| CLC
|09C7FB| ADC.w $0FBF
|09C7FE| STA.w $0D20,X

|09C801| STZ.w $0F20,X
|09C804| STZ.w $0E30,X
|09C807| STZ.w $0CBA,X

|09C80A| RTS

;===================================================================================================

LoadSingleOverworldOverlord:
|09C80B| LDX.b #$07

.next_check
|09C80D| LDA.w $0B00,X
|09C810| BEQ .free_slot

|09C812| DEX
|09C813| BPL .next_check

|09C815| RTS

;---------------------------------------------------------------------------------------------------

.free_slot
|09C816| LDA.b [$02]
|09C818| ORA.w OverworldAlivenessMasks,Y
|09C81B| STA.b [$02]

|09C81D| PHX

|09C81E| TXA
|09C81F| ASL A
|09C820| TAX

|09C821| REP #$20

|09C823| LDA.b $00
|09C825| STA.w $0B48,X

|09C828| SEP #$20

|09C82A| PLX

|09C82B| LDA.b [$05]
|09C82D| SEC
|09C82E| SBC.b #$F3
|09C830| STA.w $0B00,X

|09C833| PHA

|09C834| LDA.b $00
|09C836| ASL A
|09C837| ASL A
|09C838| ASL A
|09C839| ASL A

|09C83A| PLY
|09C83B| CPY.b #$01
|09C83D| BNE .no_adjustment

|09C83F| CLC
|09C840| ADC.b #$08

.no_adjustment
|09C842| STA.w $0B08,X

|09C845| LDA.b $00
|09C847| AND.b #$F0
|09C849| STA.w $0B18,X

|09C84C| LDA.b $01
|09C84E| AND.b #$03
|09C850| STA.w $0B10,X

|09C853| LDA.b $01
|09C855| LSR A
|09C856| LSR A
|09C857| STA.w $0B20,X

|09C85A| LDA.w $0B10,X
|09C85D| CLC
|09C85E| ADC.w $0FBD
|09C861| STA.w $0B10,X

|09C864| LDA.w $0B20,X
|09C867| CLC
|09C868| ADC.w $0FBF
|09C86B| STA.w $0B20,X

|09C86E| STZ.w $0B40,X

;===================================================================================================

InitSpawnedOverlord:
|09C871| LDA.w $040A
|09C874| STA.w $0CCA,X

|09C877| STZ.w $0B30,X
|09C87A| STZ.w $0B28,X
|09C87D| STZ.w $0B38,X

|09C880| RTS

;===================================================================================================

Overworld_SpritePointers:
.state_0
|09C881| dw Overworld_Sprites_EMPTY        ; 00 - Lost Woods
|09C883| dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
|09C885| dw Overworld_Sprites_EMPTY        ; 02 - Lumberjacks
|09C887| dw Overworld_Sprites_EMPTY        ; 03 - West Death Mountain
|09C889| dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
|09C88B| dw Overworld_Sprites_EMPTY        ; 05 - East Death Mountain
|09C88D| dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
|09C88F| dw Overworld_Sprites_EMPTY        ; 07 - Turtle Rock Portalway
|09C891| dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
|09C893| dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
|09C895| dw Overworld_Sprites_EMPTY        ; 0A - Death Mountain Foot
|09C897| dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
|09C899| dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
|09C89B| dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
|09C89D| dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
|09C89F| dw Overworld_Sprites_EMPTY        ; 0F - Waterfall of Wishing
|09C8A1| dw Overworld_Sprites_EMPTY        ; 10 - Lost Woods Alcove
|09C8A3| dw Overworld_Sprites_EMPTY        ; 11 - North of Kakariko
|09C8A5| dw Overworld_Sprites_EMPTY        ; 12 - Northwest Pond
|09C8A7| dw Overworld_Sprites_EMPTY        ; 13 - Sanctuary
|09C8A9| dw Overworld_Sprites_EMPTY        ; 14 - Graveyard
|09C8AB| dw Overworld_Sprites_EMPTY        ; 15 - Hylia River Bend
|09C8AD| dw Overworld_Sprites_EMPTY        ; 16 - Potion Shop
|09C8AF| dw Overworld_Sprites_EMPTY        ; 17 - Octorok Pit
|09C8B1| dw Overworld_Sprites_EMPTY        ; 18 - Kakariko Village
|09C8B3| dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
|09C8B5| dw Overworld_Sprites_EMPTY        ; 1A - Kakariko Orchard
|09C8B7| dw Overworld_Sprites_Screen1B_0   ; 1B - Hyrule Castle
|09C8B9| dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
|09C8BB| dw Overworld_Sprites_Screen1D_0   ; 1D - Hylia River Peninsula
|09C8BD| dw Overworld_Sprites_EMPTY        ; 1E - Eastern Ruins
|09C8BF| dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
|09C8C1| dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
|09C8C3| dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
|09C8C5| dw Overworld_Sprites_EMPTY        ; 22 - Smith's House
|09C8C7| dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
|09C8C9| dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
|09C8CB| dw Overworld_Sprites_EMPTY        ; 25 - Boulder Field
|09C8CD| dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
|09C8CF| dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
|09C8D1| dw Overworld_Sprites_EMPTY        ; 28 - Racing Game
|09C8D3| dw Overworld_Sprites_EMPTY        ; 29 - South of Kakariko
|09C8D5| dw Overworld_Sprites_EMPTY        ; 2A - Haunted Grove
|09C8D7| dw Overworld_Sprites_Screen2B_0   ; 2B - West of Link's House
|09C8D9| dw Overworld_Sprites_Screen2C_0   ; 2C - Link's House
|09C8DB| dw Overworld_Sprites_EMPTY        ; 2D - Eastern Bridge
|09C8DD| dw Overworld_Sprites_EMPTY        ; 2E - Lake Hylia River Bend
|09C8DF| dw Overworld_Sprites_EMPTY        ; 2F - Eastern Portalway
|09C8E1| dw Overworld_Sprites_EMPTY        ; 30 - Desert
|09C8E3| dw Overworld_Sprites_EMPTY        ; 31 - Desert
|09C8E5| dw Overworld_Sprites_Screen32_0   ; 32 - Haunted Grove Entrance
|09C8E7| dw Overworld_Sprites_EMPTY        ; 33 - Marshlands Portalway
|09C8E9| dw Overworld_Sprites_EMPTY        ; 34 - Marshlands Totems
|09C8EB| dw Overworld_Sprites_EMPTY        ; 35 - Lake Hylia
|09C8ED| dw Overworld_Sprites_EMPTY        ; 36 - Lake Hylia
|09C8EF| dw Overworld_Sprites_EMPTY        ; 37 - Lake Hylia River End
|09C8F1| dw Overworld_Sprites_EMPTY        ; 38 - Desert
|09C8F3| dw Overworld_Sprites_EMPTY        ; 39 - Desert
|09C8F5| dw Overworld_Sprites_EMPTY        ; 3A - Desert Pass
|09C8F7| dw Overworld_Sprites_EMPTY        ; 3B - Marshlands Dam Entrance
|09C8F9| dw Overworld_Sprites_EMPTY        ; 3C - Marshlands Ravine
|09C8FB| dw Overworld_Sprites_EMPTY        ; 3D - Lake Hylia
|09C8FD| dw Overworld_Sprites_EMPTY        ; 3E - Lake Hylia
|09C8FF| dw Overworld_Sprites_EMPTY        ; 3F - Lake Hylia Waterfall

;---------------------------------------------------------------------------------------------------

.state_1
|09C901| dw Overworld_Sprites_Screen00_1   ; 00 - Lost Woods
|09C903| dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
|09C905| dw Overworld_Sprites_Screen02_1   ; 02 - Lumberjacks
|09C907| dw Overworld_Sprites_Screen03_1   ; 03 - West Death Mountain
|09C909| dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
|09C90B| dw Overworld_Sprites_Screen05_1   ; 05 - East Death Mountain
|09C90D| dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
|09C90F| dw Overworld_Sprites_Screen07_1   ; 07 - Turtle Rock Portalway
|09C911| dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
|09C913| dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
|09C915| dw Overworld_Sprites_Screen0A_1   ; 0A - Death Mountain Foot
|09C917| dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
|09C919| dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
|09C91B| dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
|09C91D| dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
|09C91F| dw Overworld_Sprites_Screen0F_1   ; 0F - Waterfall of Wishing
|09C921| dw Overworld_Sprites_Screen10_1   ; 10 - Lost Woods Alcove
|09C923| dw Overworld_Sprites_Screen11_1   ; 11 - North of Kakariko
|09C925| dw Overworld_Sprites_Screen12_1   ; 12 - Northwest Pond
|09C927| dw Overworld_Sprites_Screen13_1   ; 13 - Sanctuary
|09C929| dw Overworld_Sprites_Screen14_1   ; 14 - Graveyard
|09C92B| dw Overworld_Sprites_Screen15_1   ; 15 - Hylia River Bend
|09C92D| dw Overworld_Sprites_Screen16_1   ; 16 - Potion Shop
|09C92F| dw Overworld_Sprites_Screen17_1   ; 17 - Octorok Pit
|09C931| dw Overworld_Sprites_Screen18_1   ; 18 - Kakariko Village
|09C933| dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
|09C935| dw Overworld_Sprites_Screen1A_1   ; 1A - Kakariko Orchard
|09C937| dw Overworld_Sprites_Screen1B_1   ; 1B - Hyrule Castle
|09C939| dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
|09C93B| dw Overworld_Sprites_Screen1D_1   ; 1D - Hylia River Peninsula
|09C93D| dw Overworld_Sprites_Screen1E_1   ; 1E - Eastern Ruins
|09C93F| dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
|09C941| dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
|09C943| dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
|09C945| dw Overworld_Sprites_Screen22_1   ; 22 - Smith's House
|09C947| dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
|09C949| dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
|09C94B| dw Overworld_Sprites_Screen25_1   ; 25 - Boulder Field
|09C94D| dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
|09C94F| dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
|09C951| dw Overworld_Sprites_Screen28_1   ; 28 - Racing Game
|09C953| dw Overworld_Sprites_EMPTY        ; 29 - South of Kakariko
|09C955| dw Overworld_Sprites_Screen2A_1   ; 2A - Haunted Grove
|09C957| dw Overworld_Sprites_Screen2B_1   ; 2B - West of Link's House
|09C959| dw Overworld_Sprites_Screen2C_1   ; 2C - Link's House
|09C95B| dw Overworld_Sprites_Screen2D_1   ; 2D - Eastern Bridge
|09C95D| dw Overworld_Sprites_Screen2E_1   ; 2E - Lake Hylia River Bend
|09C95F| dw Overworld_Sprites_Screen2F_1   ; 2F - Eastern Portalway
|09C961| dw Overworld_Sprites_Screen30_1   ; 30 - Desert
|09C963| dw Overworld_Sprites_EMPTY        ; 31 - Desert
|09C965| dw Overworld_Sprites_Screen32_1   ; 32 - Haunted Grove Entrance
|09C967| dw Overworld_Sprites_Screen33_1   ; 33 - Marshlands Portalway
|09C969| dw Overworld_Sprites_Screen34_1   ; 34 - Marshlands Totems
|09C96B| dw Overworld_Sprites_Screen35_1   ; 35 - Lake Hylia
|09C96D| dw Overworld_Sprites_EMPTY        ; 36 - Lake Hylia
|09C96F| dw Overworld_Sprites_Screen37_1   ; 37 - Lake Hylia River End
|09C971| dw Overworld_Sprites_EMPTY        ; 38 - Desert
|09C973| dw Overworld_Sprites_EMPTY        ; 39 - Desert
|09C975| dw Overworld_Sprites_Screen3A_1   ; 3A - Desert Pass
|09C977| dw Overworld_Sprites_Screen3B_1   ; 3B - Marshlands Dam Entrance
|09C979| dw Overworld_Sprites_Screen3C_1   ; 3C - Marshlands Ravine
|09C97B| dw Overworld_Sprites_EMPTY        ; 3D - Lake Hylia
|09C97D| dw Overworld_Sprites_EMPTY        ; 3E - Lake Hylia
|09C97F| dw Overworld_Sprites_Screen3F_1   ; 3F - Lake Hylia Waterfall
|09C981| dw Overworld_Sprites_Screen40     ; 40 - Skull Woods
|09C983| dw Overworld_Sprites_Screen42     ; 41 - Skull Woods
|09C985| dw Overworld_Sprites_Screen42     ; 42 - Dark Lumberjacks
|09C987| dw Overworld_Sprites_Screen43     ; 43 - West Dark Death Mountain
|09C989| dw Overworld_Sprites_Screen45     ; 44 - West Dark Death Mountain
|09C98B| dw Overworld_Sprites_Screen45     ; 45 - East Dark Death Mountain
|09C98D| dw Overworld_Sprites_EMPTY        ; 46 - East Dark Death Mountain
|09C98F| dw Overworld_Sprites_Screen47     ; 47 - Turtle Rock
|09C991| dw Overworld_Sprites_EMPTY        ; 48 - Skull Woods
|09C993| dw Overworld_Sprites_EMPTY        ; 49 - Skull Woods
|09C995| dw Overworld_Sprites_Screen4A     ; 4A - Bumper Ledge
|09C997| dw Overworld_Sprites_EMPTY        ; 4B - West Dark Death Mountain
|09C999| dw Overworld_Sprites_EMPTY        ; 4C - West Dark Death Mountain
|09C99B| dw Overworld_Sprites_EMPTY        ; 4D - East Dark Death Mountain
|09C99D| dw Overworld_Sprites_EMPTY        ; 4E - East Dark Death Mountain
|09C99F| dw Overworld_Sprites_Screen4F     ; 4F - Lake of Ill Omen
|09C9A1| dw Overworld_Sprites_Screen50     ; 50 - Skull Woods Alcove
|09C9A3| dw Overworld_Sprites_Screen51     ; 51 - North of Outcasts
|09C9A5| dw Overworld_Sprites_Screen52     ; 52 - Dark Northwest Pond
|09C9A7| dw Overworld_Sprites_Screen53     ; 53 - Dark Sanctuary
|09C9A9| dw Overworld_Sprites_Screen54     ; 54 - Dark Graveyard
|09C9AB| dw Overworld_Sprites_Screen55     ; 55 - Dark Hylia River Bend
|09C9AD| dw Overworld_Sprites_Screen56     ; 56 - Dark Northeast Shop
|09C9AF| dw Overworld_Sprites_Screen57     ; 57 - Dark Octorok Pit
|09C9B1| dw Overworld_Sprites_Screen58     ; 58 - Village of Outcasts
|09C9B3| dw Overworld_Sprites_EMPTY        ; 59 - Village of Outcasts
|09C9B5| dw Overworld_Sprites_Screen5A     ; 5A - Outcasts Orchard
|09C9B7| dw Overworld_Sprites_Screen5B     ; 5B - Pyramid of Power
|09C9B9| dw Overworld_Sprites_EMPTY        ; 5C - Pyramid of Power
|09C9BB| dw Overworld_Sprites_Screen5D     ; 5D - Dark Hylia River Peninsula
|09C9BD| dw Overworld_Sprites_Screen5E     ; 5E - Palace of Darkness Maze
|09C9BF| dw Overworld_Sprites_EMPTY        ; 5F - Palace of Darkness Maze
|09C9C1| dw Overworld_Sprites_EMPTY        ; 60 - Village of Outcasts
|09C9C3| dw Overworld_Sprites_EMPTY        ; 61 - Village of Outcasts
|09C9C5| dw Overworld_Sprites_Screen62     ; 62 - Stake Puzzle
|09C9C7| dw Overworld_Sprites_EMPTY        ; 63 - Pyramid of Power
|09C9C9| dw Overworld_Sprites_EMPTY        ; 64 - Pyramid of Power
|09C9CB| dw Overworld_Sprites_Screen65     ; 65 - Boulder Field
|09C9CD| dw Overworld_Sprites_EMPTY        ; 66 - Palace of Darkness Maze
|09C9CF| dw Overworld_Sprites_EMPTY        ; 67 - Palace of Darkness Maze
|09C9D1| dw Overworld_Sprites_Screen68     ; 68 - Digging Game
|09C9D3| dw Overworld_Sprites_Screen69     ; 69 - South of Outcasts
|09C9D5| dw Overworld_Sprites_Screen6A     ; 6A - Stumpy Grove
|09C9D7| dw Overworld_Sprites_Screen6B     ; 6B - West of Bomb Shop
|09C9D9| dw Overworld_Sprites_Screen6C     ; 6C - Bomb Shop
|09C9DB| dw Overworld_Sprites_Screen6D     ; 6D - Hammer Bridge
|09C9DD| dw Overworld_Sprites_Screen6E     ; 6E - Dark Lake Hylia River Bend
|09C9DF| dw Overworld_Sprites_Screen6F     ; 6F - East Dark World Portalway
|09C9E1| dw Overworld_Sprites_Screen70     ; 70 - Misery Mire
|09C9E3| dw Overworld_Sprites_Screen72     ; 71 - Misery Mire
|09C9E5| dw Overworld_Sprites_Screen72     ; 72 - Stumpy Grove Entrance
|09C9E7| dw Overworld_Sprites_Screen73     ; 73 - Swamplands Portalway
|09C9E9| dw Overworld_Sprites_Screen74     ; 74 - Swamplands Totems
|09C9EB| dw Overworld_Sprites_Screen75     ; 75 - Dark Lake Hylia
|09C9ED| dw Overworld_Sprites_Screen77     ; 76 - Dark Lake Hylia
|09C9EF| dw Overworld_Sprites_Screen77     ; 77 - Dark Lake Hylia River End
|09C9F1| dw Overworld_Sprites_EMPTY        ; 78 - Misery Mire
|09C9F3| dw Overworld_Sprites_EMPTY        ; 79 - Misery Mire
|09C9F5| dw Overworld_Sprites_Screen7A     ; 7A - West of Swamplands
|09C9F7| dw Overworld_Sprites_Screen7B     ; 7B - Swamplands Palace Entrance
|09C9F9| dw Overworld_Sprites_Screen7C     ; 7C - Swamplands Ravine
|09C9FB| dw Overworld_Sprites_EMPTY        ; 7D - Dark Lake Hylia
|09C9FD| dw Overworld_Sprites_EMPTY        ; 7E - Dark Lake Hylia
|09C9FF| dw Overworld_Sprites_Screen7F     ; 7F - Dark Lake Hylia Waterfall
|09CA01| dw Overworld_Sprites_Screen80     ; 80 - Master Sword Pedestal
|09CA03| dw Overworld_Sprites_Screen81     ; 81 - Zora's Domain
|09CA05| dw Overworld_Sprites_EMPTY        ;
|09CA07| dw Overworld_Sprites_EMPTY        ;
|09CA09| dw Overworld_Sprites_EMPTY        ;
|09CA0B| dw Overworld_Sprites_EMPTY        ;
|09CA0D| dw Overworld_Sprites_EMPTY        ;
|09CA0F| dw Overworld_Sprites_EMPTY        ;
|09CA11| dw Overworld_Sprites_EMPTY        ;
|09CA13| dw Overworld_Sprites_EMPTY        ;
|09CA15| dw Overworld_Sprites_EMPTY        ;
|09CA17| dw Overworld_Sprites_EMPTY        ;
|09CA19| dw Overworld_Sprites_EMPTY        ;
|09CA1B| dw Overworld_Sprites_EMPTY        ;
|09CA1D| dw Overworld_Sprites_EMPTY        ;
|09CA1F| dw Overworld_Sprites_EMPTY        ;

;---------------------------------------------------------------------------------------------------

.state_2
|09CA21| dw Overworld_Sprites_Screen00_2   ; 00 - Lost Woods
|09CA23| dw Overworld_Sprites_EMPTY        ; 01 - Lost Woods
|09CA25| dw Overworld_Sprites_Screen02_2   ; 02 - Lumberjacks
|09CA27| dw Overworld_Sprites_Screen03_2   ; 03 - West Death Mountain
|09CA29| dw Overworld_Sprites_EMPTY        ; 04 - West Death Mountain
|09CA2B| dw Overworld_Sprites_Screen05_2   ; 05 - East Death Mountain
|09CA2D| dw Overworld_Sprites_EMPTY        ; 06 - East Death Mountain
|09CA2F| dw Overworld_Sprites_Screen07_2   ; 07 - Turtle Rock Portalway
|09CA31| dw Overworld_Sprites_EMPTY        ; 08 - Lost Woods
|09CA33| dw Overworld_Sprites_EMPTY        ; 09 - Lost Woods
|09CA35| dw Overworld_Sprites_Screen0A_2   ; 0A - Death Mountain Foot
|09CA37| dw Overworld_Sprites_EMPTY        ; 0B - West Death Mountain
|09CA39| dw Overworld_Sprites_EMPTY        ; 0C - West Death Mountain
|09CA3B| dw Overworld_Sprites_EMPTY        ; 0D - East Death Mountain
|09CA3D| dw Overworld_Sprites_EMPTY        ; 0E - East Death Mountain
|09CA3F| dw Overworld_Sprites_Screen0F_2   ; 0F - Waterfall of Wishing
|09CA41| dw Overworld_Sprites_Screen10_2   ; 10 - Lost Woods Alcove
|09CA43| dw Overworld_Sprites_Screen11_2   ; 11 - North of Kakariko
|09CA45| dw Overworld_Sprites_Screen12_2   ; 12 - Northwest Pond
|09CA47| dw Overworld_Sprites_Screen13_2   ; 13 - Sanctuary
|09CA49| dw Overworld_Sprites_Screen14_2   ; 14 - Graveyard
|09CA4B| dw Overworld_Sprites_Screen15_2   ; 15 - Hylia River Bend
|09CA4D| dw Overworld_Sprites_Screen16_2   ; 16 - Potion Shop
|09CA4F| dw Overworld_Sprites_Screen17_2   ; 17 - Octorok Pit
|09CA51| dw Overworld_Sprites_Screen18_2   ; 18 - Kakariko Village
|09CA53| dw Overworld_Sprites_EMPTY        ; 19 - Kakariko Village
|09CA55| dw Overworld_Sprites_Screen1A_2   ; 1A - Kakariko Orchard
|09CA57| dw Overworld_Sprites_Screen1B_2   ; 1B - Hyrule Castle
|09CA59| dw Overworld_Sprites_EMPTY        ; 1C - Hyrule Castle
|09CA5B| dw Overworld_Sprites_Screen1D_2   ; 1D - Hylia River Peninsula
|09CA5D| dw Overworld_Sprites_Screen1E_2   ; 1E - Eastern Ruins
|09CA5F| dw Overworld_Sprites_EMPTY        ; 1F - Eastern Ruins
|09CA61| dw Overworld_Sprites_EMPTY        ; 20 - Kakariko Village
|09CA63| dw Overworld_Sprites_EMPTY        ; 21 - Kakariko Village
|09CA65| dw Overworld_Sprites_Screen22_2   ; 22 - Smith's House
|09CA67| dw Overworld_Sprites_EMPTY        ; 23 - Hyrule Castle
|09CA69| dw Overworld_Sprites_EMPTY        ; 24 - Hyrule Castle
|09CA6B| dw Overworld_Sprites_Screen25_2   ; 25 - Boulder Field
|09CA6D| dw Overworld_Sprites_EMPTY        ; 26 - Eastern Ruins
|09CA6F| dw Overworld_Sprites_EMPTY        ; 27 - Eastern Ruins
|09CA71| dw Overworld_Sprites_Screen28_2   ; 28 - Racing Game
|09CA73| dw Overworld_Sprites_Screen29_2   ; 29 - South of Kakariko
|09CA75| dw Overworld_Sprites_Screen2A_2   ; 2A - Haunted Grove
|09CA77| dw Overworld_Sprites_Screen2B_2   ; 2B - West of Link's House
|09CA79| dw Overworld_Sprites_Screen2C_2   ; 2C - Link's House
|09CA7B| dw Overworld_Sprites_Screen2D_2   ; 2D - Eastern Bridge
|09CA7D| dw Overworld_Sprites_Screen2E_2   ; 2E - Lake Hylia River Bend
|09CA7F| dw Overworld_Sprites_Screen2F_2   ; 2F - Eastern Portalway
|09CA81| dw Overworld_Sprites_Screen30_2   ; 30 - Desert
|09CA83| dw Overworld_Sprites_EMPTY        ; 31 - Desert
|09CA85| dw Overworld_Sprites_Screen32_2   ; 32 - Haunted Grove Entrance
|09CA87| dw Overworld_Sprites_Screen33_2   ; 33 - Marshlands Portalway
|09CA89| dw Overworld_Sprites_Screen34_2   ; 34 - Marshlands Totems
|09CA8B| dw Overworld_Sprites_Screen35_2   ; 35 - Lake Hylia
|09CA8D| dw Overworld_Sprites_Screen37_2   ; 36 - Lake Hylia
|09CA8F| dw Overworld_Sprites_Screen37_2   ; 37 - Lake Hylia River End
|09CA91| dw Overworld_Sprites_Screen3A_2   ; 38 - Desert
|09CA93| dw Overworld_Sprites_Screen3A_2   ; 39 - Desert
|09CA95| dw Overworld_Sprites_Screen3A_2   ; 3A - Desert Pass
|09CA97| dw Overworld_Sprites_Screen3B_2   ; 3B - Marshlands Dam Entrance
|09CA99| dw Overworld_Sprites_Screen3C_2   ; 3C - Marshlands Ravine
|09CA9B| dw Overworld_Sprites_Screen3F_2   ; 3D - Lake Hylia
|09CA9D| dw Overworld_Sprites_Screen3F_2   ; 3E - Lake Hylia
|09CA9F| dw Overworld_Sprites_Screen3F_2   ; 3F - Lake Hylia Waterfall
|09CAA1| dw Overworld_Sprites_Screen40     ; 40 - Skull Woods
|09CAA3| dw Overworld_Sprites_Screen42     ; 41 - Skull Woods
|09CAA5| dw Overworld_Sprites_Screen42     ; 42 - Dark Lumberjacks
|09CAA7| dw Overworld_Sprites_Screen43     ; 43 - West Dark Death Mountain
|09CAA9| dw Overworld_Sprites_Screen45     ; 44 - West Dark Death Mountain
|09CAAB| dw Overworld_Sprites_Screen45     ; 45 - East Dark Death Mountain
|09CAAD| dw Overworld_Sprites_EMPTY        ; 46 - East Dark Death Mountain
|09CAAF| dw Overworld_Sprites_Screen47     ; 47 - Turtle Rock
|09CAB1| dw Overworld_Sprites_EMPTY        ; 48 - Skull Woods
|09CAB3| dw Overworld_Sprites_EMPTY        ; 49 - Skull Woods
|09CAB5| dw Overworld_Sprites_Screen4A     ; 4A - Bumper Ledge
|09CAB7| dw Overworld_Sprites_EMPTY        ; 4B - West Dark Death Mountain
|09CAB9| dw Overworld_Sprites_EMPTY        ; 4C - West Dark Death Mountain
|09CABB| dw Overworld_Sprites_EMPTY        ; 4D - East Dark Death Mountain
|09CABD| dw Overworld_Sprites_EMPTY        ; 4E - East Dark Death Mountain
|09CABF| dw Overworld_Sprites_Screen4F     ; 4F - Lake of Ill Omen
|09CAC1| dw Overworld_Sprites_Screen50     ; 50 - Skull Woods Alcove
|09CAC3| dw Overworld_Sprites_Screen51     ; 51 - North of Outcasts
|09CAC5| dw Overworld_Sprites_Screen52     ; 52 - Dark Northwest Pond
|09CAC7| dw Overworld_Sprites_Screen53     ; 53 - Dark Sanctuary
|09CAC9| dw Overworld_Sprites_Screen54     ; 54 - Dark Graveyard
|09CACB| dw Overworld_Sprites_Screen55     ; 55 - Dark Hylia River Bend
|09CACD| dw Overworld_Sprites_Screen56     ; 56 - Dark Northeast Shop
|09CACF| dw Overworld_Sprites_Screen57     ; 57 - Dark Octorok Pit
|09CAD1| dw Overworld_Sprites_Screen58     ; 58 - Village of Outcasts
|09CAD3| dw Overworld_Sprites_EMPTY        ; 59 - Village of Outcasts
|09CAD5| dw Overworld_Sprites_Screen5A     ; 5A - Outcasts Orchard
|09CAD7| dw Overworld_Sprites_Screen5B     ; 5B - Pyramid of Power
|09CAD9| dw Overworld_Sprites_EMPTY        ; 5C - Pyramid of Power
|09CADB| dw Overworld_Sprites_Screen5D     ; 5D - Dark Hylia River Peninsula
|09CADD| dw Overworld_Sprites_Screen5E     ; 5E - Palace of Darkness Maze
|09CADF| dw Overworld_Sprites_EMPTY        ; 5F - Palace of Darkness Maze
|09CAE1| dw Overworld_Sprites_EMPTY        ; 60 - Village of Outcasts
|09CAE3| dw Overworld_Sprites_EMPTY        ; 61 - Village of Outcasts
|09CAE5| dw Overworld_Sprites_Screen62     ; 62 - Stake Puzzle
|09CAE7| dw Overworld_Sprites_EMPTY        ; 63 - Pyramid of Power
|09CAE9| dw Overworld_Sprites_EMPTY        ; 64 - Pyramid of Power
|09CAEB| dw Overworld_Sprites_Screen65     ; 65 - Boulder Field
|09CAED| dw Overworld_Sprites_EMPTY        ; 66 - Palace of Darkness Maze
|09CAEF| dw Overworld_Sprites_EMPTY        ; 67 - Palace of Darkness Maze
|09CAF1| dw Overworld_Sprites_Screen68     ; 68 - Digging Game
|09CAF3| dw Overworld_Sprites_Screen69     ; 69 - South of Outcasts
|09CAF5| dw Overworld_Sprites_Screen6A     ; 6A - Stumpy Grove
|09CAF7| dw Overworld_Sprites_Screen6B     ; 6B - West of Bomb Shop
|09CAF9| dw Overworld_Sprites_Screen6C     ; 6C - Bomb Shop
|09CAFB| dw Overworld_Sprites_Screen6D     ; 6D - Hammer Bridge
|09CAFD| dw Overworld_Sprites_Screen6E     ; 6E - Dark Lake Hylia River Bend
|09CAFF| dw Overworld_Sprites_Screen6F     ; 6F - East Dark World Portalway
|09CB01| dw Overworld_Sprites_Screen70     ; 70 - Misery Mire
|09CB03| dw Overworld_Sprites_Screen72     ; 71 - Misery Mire
|09CB05| dw Overworld_Sprites_Screen72     ; 72 - Stumpy Grove Entrance
|09CB07| dw Overworld_Sprites_Screen73     ; 73 - Swamplands Portalway
|09CB09| dw Overworld_Sprites_Screen74     ; 74 - Swamplands Totems
|09CB0B| dw Overworld_Sprites_Screen75     ; 75 - Dark Lake Hylia
|09CB0D| dw Overworld_Sprites_Screen77     ; 76 - Dark Lake Hylia
|09CB0F| dw Overworld_Sprites_Screen77     ; 77 - Dark Lake Hylia River End
|09CB11| dw Overworld_Sprites_EMPTY        ; 78 - Misery Mire
|09CB13| dw Overworld_Sprites_EMPTY        ; 79 - Misery Mire
|09CB15| dw Overworld_Sprites_Screen7A     ; 7A - West of Swamplands
|09CB17| dw Overworld_Sprites_Screen7B     ; 7B - Swamplands Palace Entrance
|09CB19| dw Overworld_Sprites_Screen7C     ; 7C - Swamplands Ravine
|09CB1B| dw Overworld_Sprites_EMPTY        ; 7D - Dark Lake Hylia
|09CB1D| dw Overworld_Sprites_EMPTY        ; 7E - Dark Lake Hylia
|09CB1F| dw Overworld_Sprites_Screen7F     ; 7F - Dark Lake Hylia Waterfall
|09CB21| dw Overworld_Sprites_Screen80     ; 80 - Master Sword Pedestal
|09CB23| dw Overworld_Sprites_Screen81     ; 81 - Zora's Domain
|09CB25| dw Overworld_Sprites_EMPTY        ;
|09CB27| dw Overworld_Sprites_EMPTY        ;
|09CB29| dw Overworld_Sprites_EMPTY        ;
|09CB2B| dw Overworld_Sprites_EMPTY        ;
|09CB2D| dw Overworld_Sprites_EMPTY        ;
|09CB2F| dw Overworld_Sprites_EMPTY        ;
|09CB31| dw Overworld_Sprites_EMPTY        ;
|09CB33| dw Overworld_Sprites_EMPTY        ;
|09CB35| dw Overworld_Sprites_EMPTY        ;
|09CB37| dw Overworld_Sprites_EMPTY        ;
|09CB39| dw Overworld_Sprites_EMPTY        ;
|09CB3B| dw Overworld_Sprites_EMPTY        ;
|09CB3D| dw Overworld_Sprites_EMPTY        ;
|09CB3F| dw Overworld_Sprites_EMPTY        ;

;===================================================================================================

Overworld_Sprites_EMPTY:
|09CB41| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_0:
|09CB42| db $06, $1F, $40 ; SPRITE 40   | xy: { 0x1F0, 0x060 }
|09CB45| db $12, $01, $3F ; SPRITE 3F   | xy: { 0x010, 0x120 }
|09CB48| db $14, $01, $3F ; SPRITE 3F   | xy: { 0x010, 0x140 }
|09CB4B| db $13, $1F, $42 ; SPRITE 42   | xy: { 0x1F0, 0x130 }
|09CB4E| db $1A, $1F, $4B ; SPRITE 4B   | xy: { 0x1F0, 0x1A0 }
|09CB51| db $1A, $20, $4B ; SPRITE 4B   | xy: { 0x200, 0x1A0 }
|09CB54| db $25, $2D, $3F ; SPRITE 3F   | xy: { 0x2D0, 0x250 }
|09CB57| db $29, $20, $3F ; SPRITE 3F   | xy: { 0x200, 0x290 }
|09CB5A| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_0:
|09CB5B| db $06, $0B, $AC ; SPRITE AC   | xy: { 0x0B0, 0x060 }
|09CB5E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_0:
|09CB5F| db $1E, $09, $3F ; SPRITE 3F   | xy: { 0x090, 0x1E0 }
|09CB62| db $1E, $0B, $3F ; SPRITE 3F   | xy: { 0x0B0, 0x1E0 }
|09CB65| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_0:
|09CB66| db $18, $1E, $3F ; SPRITE 3F   | xy: { 0x1E0, 0x180 }
|09CB69| db $1A, $1E, $3F ; SPRITE 3F   | xy: { 0x1E0, 0x1A0 }
|09CB6C| db $1E, $0D, $3F ; SPRITE 3F   | xy: { 0x0D0, 0x1E0 }
|09CB6F| db $1E, $0F, $3F ; SPRITE 3F   | xy: { 0x0F0, 0x1E0 }
|09CB72| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_0:
|09CB73| db $09, $1A, $DC ; SPRITE DC   | xy: { 0x1A0, 0x090 }
|09CB76| db $12, $18, $D8 ; SPRITE D8   | xy: { 0x180, 0x120 }
|09CB79| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen40:
|09CB7A| db $07, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x070 }
|09CB7D| db $11, $12, $22 ; SPRITE 22   | xy: { 0x120, 0x110 }
|09CB80| db $1E, $0A, $22 ; SPRITE 22   | xy: { 0x0A0, 0x1E0 }
|09CB83| db $09, $2F, $22 ; SPRITE 22   | xy: { 0x2F0, 0x090 }
|09CB86| db $0A, $31, $0E ; SPRITE 0E   | xy: { 0x310, 0x0A0 }
|09CB89| db $0B, $33, $22 ; SPRITE 22   | xy: { 0x330, 0x0B0 }
|09CB8C| db $14, $29, $22 ; SPRITE 22   | xy: { 0x290, 0x140 }
|09CB8F| db $16, $23, $22 ; SPRITE 22   | xy: { 0x230, 0x160 }
|09CB92| db $17, $39, $AA ; SPRITE AA   | xy: { 0x390, 0x170 }
|09CB95| db $21, $0A, $22 ; SPRITE 22   | xy: { 0x0A0, 0x210 }
|09CB98| db $25, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x250 }
|09CB9B| db $28, $0B, $AA ; SPRITE AA   | xy: { 0x0B0, 0x280 }
|09CB9E| db $30, $1E, $22 ; SPRITE 22   | xy: { 0x1E0, 0x300 }
|09CBA1| db $38, $0E, $22 ; SPRITE 22   | xy: { 0x0E0, 0x380 }
|09CBA4| db $38, $11, $22 ; SPRITE 22   | xy: { 0x110, 0x380 }
|09CBA7| db $39, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x390 }
|09CBAA| db $21, $2D, $22 ; SPRITE 22   | xy: { 0x2D0, 0x210 }
|09CBAD| db $28, $32, $22 ; SPRITE 22   | xy: { 0x320, 0x280 }
|09CBB0| db $32, $37, $22 ; SPRITE 22   | xy: { 0x370, 0x320 }
|09CBB3| db $37, $28, $AA ; SPRITE AA   | xy: { 0x280, 0x370 }
|09CBB6| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen42:
|09CBB7| db $11, $0C, $0E ; SPRITE 0E   | xy: { 0x0C0, 0x110 }
|09CBBA| db $13, $0C, $0E ; SPRITE 0E   | xy: { 0x0C0, 0x130 }
|09CBBD| db $16, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x160 }
|09CBC0| db $19, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x190 }
|09CBC3| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen43:
|09CBC4| db $0C, $2F, $37 ; SPRITE 37   | xy: { 0x2F0, 0x0C0 }
|09CBC7| db $18, $20, $B9 ; SPRITE B9   | xy: { 0x200, 0x180 }
|09CBCA| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen45:
|09CBCB| db $0C, $06, $D0 ; SPRITE D0   | xy: { 0x060, 0x0C0 }
|09CBCE| db $0E, $1D, $D0 ; SPRITE D0   | xy: { 0x1D0, 0x0E0 }
|09CBD1| db $0B, $20, $D0 ; SPRITE D0   | xy: { 0x200, 0x0B0 }
|09CBD4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen47:
|09CBD5| db $14, $16, $33 ; SPRITE 33   | xy: { 0x160, 0x140 }
|09CBD8| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen4A:
|09CBD9| db $06, $0E, $33 ; SPRITE 33   | xy: { 0x0E0, 0x060 }
|09CBDC| db $08, $18, $EB ; SPRITE EB   | xy: { 0x180, 0x080 }
|09CBDF| db $0F, $0B, $12 ; SPRITE 12   | xy: { 0x0B0, 0x0F0 }
|09CBE2| db $10, $08, $12 ; SPRITE 12   | xy: { 0x080, 0x100 }
|09CBE5| db $13, $16, $12 ; SPRITE 12   | xy: { 0x160, 0x130 }
|09CBE8| db $13, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x130 }
|09CBEB| db $14, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x140 }
|09CBEE| db $18, $0E, $22 ; SPRITE 22   | xy: { 0x0E0, 0x180 }
|09CBF1| db $1A, $14, $D3 ; SPRITE D3   | xy: { 0x140, 0x1A0 }
|09CBF4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen4F:
|09CBF5| db $08, $19, $55 ; SPRITE 55   | xy: { 0x190, 0x080 }
|09CBF8| db $0B, $04, $C0 ; SPRITE C0   | xy: { 0x040, 0x0B0 }
|09CBFB| db $0D, $18, $D3 ; SPRITE D3   | xy: { 0x180, 0x0D0 }
|09CBFE| db $11, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x110 }
|09CC01| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen50:
|09CC02| db $0B, $16, $19 ; SPRITE 19   | xy: { 0x160, 0x0B0 }
|09CC05| db $0C, $05, $12 ; SPRITE 12   | xy: { 0x050, 0x0C0 }
|09CC08| db $0E, $08, $25 ; SPRITE 25   | xy: { 0x080, 0x0E0 }
|09CC0B| db $13, $19, $0B ; SPRITE 0B   | xy: { 0x190, 0x130 }
|09CC0E| db $18, $08, $12 ; SPRITE 12   | xy: { 0x080, 0x180 }
|09CC11| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen51:
|09CC12| db $0E, $17, $45 ; SPRITE 45   | xy: { 0x170, 0x0E0 }
|09CC15| db $10, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x100 }
|09CC18| db $10, $09, $E3 ; SPRITE E3   | xy: { 0x090, 0x100 }
|09CC1B| db $15, $1C, $D3 ; SPRITE D3   | xy: { 0x1C0, 0x150 }
|09CC1E| db $16, $14, $12 ; SPRITE 12   | xy: { 0x140, 0x160 }
|09CC21| db $17, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x170 }
|09CC24| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen52:
|09CC25| db $09, $12, $D3 ; SPRITE D3   | xy: { 0x120, 0x090 }
|09CC28| db $0D, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0D0 }
|09CC2B| db $10, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x100 }
|09CC2E| db $17, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x170 }
|09CC31| db $18, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x180 }
|09CC34| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen53:
|09CC35| db $0B, $06, $D3 ; SPRITE D3   | xy: { 0x060, 0x0B0 }
|09CC38| db $0C, $15, $11 ; SPRITE 11   | xy: { 0x150, 0x0C0 }
|09CC3B| db $0D, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x0D0 }
|09CC3E| db $15, $0D, $12 ; SPRITE 12   | xy: { 0x0D0, 0x150 }
|09CC41| db $18, $16, $0E ; SPRITE 0E   | xy: { 0x160, 0x180 }
|09CC44| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen54:
|09CC45| db $0D, $14, $22 ; SPRITE 22   | xy: { 0x140, 0x0D0 }
|09CC48| db $0B, $05, $DC ; SPRITE DC   | xy: { 0x050, 0x0B0 }
|09CC4B| db $0B, $19, $DB ; SPRITE DB   | xy: { 0x190, 0x0B0 }
|09CC4E| db $0F, $07, $22 ; SPRITE 22   | xy: { 0x070, 0x0F0 }
|09CC51| db $0E, $0F, $E3 ; SPRITE E3   | xy: { 0x0F0, 0x0E0 }
|09CC54| db $10, $19, $22 ; SPRITE 22   | xy: { 0x190, 0x100 }
|09CC57| db $14, $0D, $22 ; SPRITE 22   | xy: { 0x0D0, 0x140 }
|09CC5A| db $19, $11, $11 ; SPRITE 11   | xy: { 0x110, 0x190 }
|09CC5D| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen55:
|09CC5E| db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
|09CC61| db $0E, $16, $11 ; SPRITE 11   | xy: { 0x160, 0x0E0 }
|09CC64| db $0E, $18, $D3 ; SPRITE D3   | xy: { 0x180, 0x0E0 }
|09CC67| db $0F, $1B, $DA ; SPRITE DA   | xy: { 0x1B0, 0x0F0 }
|09CC6A| db $17, $07, $11 ; SPRITE 11   | xy: { 0x070, 0x170 }
|09CC6D| db $1A, $0A, $79 ; SPRITE 79   | xy: { 0x0A0, 0x1A0 }
|09CC70| db $1B, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x1B0 }
|09CC73| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen56:
|09CC74| db $06, $0A, $55 ; SPRITE 55   | xy: { 0x0A0, 0x060 }
|09CC77| db $0A, $13, $55 ; SPRITE 55   | xy: { 0x130, 0x0A0 }
|09CC7A| db $0E, $04, $79 ; SPRITE 79   | xy: { 0x040, 0x0E0 }
|09CC7D| db $17, $11, $22 ; SPRITE 22   | xy: { 0x110, 0x170 }
|09CC80| db $1A, $05, $22 ; SPRITE 22   | xy: { 0x050, 0x1A0 }
|09CC83| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen57:
|09CC84| db $04, $0C, $55 ; SPRITE 55   | xy: { 0x0C0, 0x040 }
|09CC87| db $08, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x080 }
|09CC8A| db $0A, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x0A0 }
|09CC8D| db $0E, $0E, $08 ; SPRITE 08   | xy: { 0x0E0, 0x0E0 }
|09CC90| db $10, $0E, $D3 ; SPRITE D3   | xy: { 0x0E0, 0x100 }
|09CC93| db $1A, $0E, $08 ; SPRITE 08   | xy: { 0x0E0, 0x1A0 }
|09CC96| db $1B, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x1B0 }
|09CC99| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen58:
|09CC9A| db $06, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x060 }
|09CC9D| db $0C, $18, $25 ; SPRITE 25   | xy: { 0x180, 0x0C0 }
|09CCA0| db $1C, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x1C0 }
|09CCA3| db $0A, $35, $12 ; SPRITE 12   | xy: { 0x350, 0x0A0 }
|09CCA6| db $0C, $2B, $19 ; SPRITE 19   | xy: { 0x2B0, 0x0C0 }
|09CCA9| db $17, $2E, $C4 ; SPRITE C4   | xy: { 0x2E0, 0x170 }
|09CCAC| db $1C, $20, $14 ; SPRITE 14   | xy: { 0x200, 0x1C0 }
|09CCAF| db $25, $18, $19 ; SPRITE 19   | xy: { 0x180, 0x250 }
|09CCB2| db $27, $0D, $C4 ; SPRITE C4   | xy: { 0x0D0, 0x270 }
|09CCB5| db $28, $1D, $19 ; SPRITE 19   | xy: { 0x1D0, 0x280 }
|09CCB8| db $2E, $12, $12 ; SPRITE 12   | xy: { 0x120, 0x2E0 }
|09CCBB| db $34, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x340 }
|09CCBE| db $37, $15, $0B ; SPRITE 0B   | xy: { 0x150, 0x370 }
|09CCC1| db $27, $28, $0B ; SPRITE 0B   | xy: { 0x280, 0x270 }
|09CCC4| db $2F, $33, $41 ; SPRITE 41   | xy: { 0x330, 0x2F0 }
|09CCC7| db $34, $2C, $19 ; SPRITE 19   | xy: { 0x2C0, 0x340 }
|09CCCA| db $35, $37, $25 ; SPRITE 25   | xy: { 0x370, 0x350 }
|09CCCD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5A:
|09CCCE| db $08, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x080 }
|09CCD1| db $08, $12, $25 ; SPRITE 25   | xy: { 0x120, 0x080 }
|09CCD4| db $0D, $12, $D3 ; SPRITE D3   | xy: { 0x120, 0x0D0 }
|09CCD7| db $0C, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0C0 }
|09CCDA| db $0F, $0B, $11 ; SPRITE 11   | xy: { 0x0B0, 0x0F0 }
|09CCDD| db $19, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x190 }
|09CCE0| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5B:
|09CCE1| db $17, $15, $22 ; SPRITE 22   | xy: { 0x150, 0x170 }
|09CCE4| db $12, $34, $EB ; SPRITE EB   | xy: { 0x340, 0x120 }
|09CCE7| db $24, $13, $33 ; SPRITE 33   | xy: { 0x130, 0x240 }
|09CCEA| db $27, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x270 }
|09CCED| db $2A, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x2A0 }
|09CCF0| db $2A, $0C, $12 ; SPRITE 12   | xy: { 0x0C0, 0x2A0 }
|09CCF3| db $2C, $1E, $11 ; SPRITE 11   | xy: { 0x1E0, 0x2C0 }
|09CCF6| db $25, $34, $0E ; SPRITE 0E   | xy: { 0x340, 0x250 }
|09CCF9| db $27, $32, $12 ; SPRITE 12   | xy: { 0x320, 0x270 }
|09CCFC| db $29, $30, $12 ; SPRITE 12   | xy: { 0x300, 0x290 }
|09CCFF| db $2C, $21, $11 ; SPRITE 11   | xy: { 0x210, 0x2C0 }
|09CD02| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5D:
|09CD03| db $08, $0B, $25 ; SPRITE 25   | xy: { 0x0B0, 0x080 }
|09CD06| db $09, $07, $11 ; SPRITE 11   | xy: { 0x070, 0x090 }
|09CD09| db $0B, $06, $0E ; SPRITE 0E   | xy: { 0x060, 0x0B0 }
|09CD0C| db $0B, $18, $12 ; SPRITE 12   | xy: { 0x180, 0x0B0 }
|09CD0F| db $0E, $17, $D3 ; SPRITE D3   | xy: { 0x170, 0x0E0 }
|09CD12| db $10, $1A, $12 ; SPRITE 12   | xy: { 0x1A0, 0x100 }
|09CD15| db $11, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x110 }
|09CD18| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen5E:
|09CD19| db $04, $0D, $22 ; SPRITE 22   | xy: { 0x0D0, 0x040 }
|09CD1C| db $11, $03, $22 ; SPRITE 22   | xy: { 0x030, 0x110 }
|09CD1F| db $11, $15, $B6 ; SPRITE B6   | xy: { 0x150, 0x110 }
|09CD22| db $1A, $12, $22 ; SPRITE 22   | xy: { 0x120, 0x1A0 }
|09CD25| db $09, $27, $22 ; SPRITE 22   | xy: { 0x270, 0x090 }
|09CD28| db $10, $2F, $22 ; SPRITE 22   | xy: { 0x2F0, 0x100 }
|09CD2B| db $15, $25, $12 ; SPRITE 12   | xy: { 0x250, 0x150 }
|09CD2E| db $17, $26, $11 ; SPRITE 11   | xy: { 0x260, 0x170 }
|09CD31| db $18, $35, $22 ; SPRITE 22   | xy: { 0x350, 0x180 }
|09CD34| db $1E, $2A, $22 ; SPRITE 22   | xy: { 0x2A0, 0x1E0 }
|09CD37| db $26, $0A, $12 ; SPRITE 12   | xy: { 0x0A0, 0x260 }
|09CD3A| db $2B, $0C, $12 ; SPRITE 12   | xy: { 0x0C0, 0x2B0 }
|09CD3D| db $35, $07, $22 ; SPRITE 22   | xy: { 0x070, 0x350 }
|09CD40| db $37, $16, $11 ; SPRITE 11   | xy: { 0x160, 0x370 }
|09CD43| db $38, $09, $0E ; SPRITE 0E   | xy: { 0x090, 0x380 }
|09CD46| db $24, $32, $12 ; SPRITE 12   | xy: { 0x320, 0x240 }
|09CD49| db $28, $35, $0E ; SPRITE 0E   | xy: { 0x350, 0x280 }
|09CD4C| db $30, $24, $22 ; SPRITE 22   | xy: { 0x240, 0x300 }
|09CD4F| db $30, $30, $E3 ; SPRITE E3   | xy: { 0x300, 0x300 }
|09CD52| db $36, $35, $11 ; SPRITE 11   | xy: { 0x350, 0x360 }
|09CD55| db $37, $29, $00 ; SPRITE 00   | xy: { 0x290, 0x370 }
|09CD58| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen62:
|09CD59| db $05, $0D, $B4 ; SPRITE B4   | xy: { 0x0D0, 0x050 }
|09CD5C| db $11, $13, $0B ; SPRITE 0B   | xy: { 0x130, 0x110 }
|09CD5F| db $13, $11, $0B ; SPRITE 0B   | xy: { 0x110, 0x130 }
|09CD62| db $15, $15, $0B ; SPRITE 0B   | xy: { 0x150, 0x150 }
|09CD65| db $16, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x160 }
|09CD68| db $17, $11, $0B ; SPRITE 0B   | xy: { 0x110, 0x170 }
|09CD6B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen65:
|09CD6C| db $07, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x070 }
|09CD6F| db $0A, $0F, $D3 ; SPRITE D3   | xy: { 0x0F0, 0x0A0 }
|09CD72| db $0C, $0E, $12 ; SPRITE 12   | xy: { 0x0E0, 0x0C0 }
|09CD75| db $11, $05, $11 ; SPRITE 11   | xy: { 0x050, 0x110 }
|09CD78| db $16, $0A, $12 ; SPRITE 12   | xy: { 0x0A0, 0x160 }
|09CD7B| db $16, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x160 }
|09CD7E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen68:
|09CD7F| db $11, $0E, $D5 ; SPRITE D5   | xy: { 0x0E0, 0x110 }
|09CD82| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen69:
|09CD83| db $09, $06, $1A ; SPRITE 1A   | xy: { 0x060, 0x090 }
|09CD86| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6A:
|09CD87| db $0F, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0F0 }
|09CD8A| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6B:
|09CD8B| db $08, $16, $25 ; SPRITE 25   | xy: { 0x160, 0x080 }
|09CD8E| db $09, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x090 }
|09CD91| db $0F, $17, $25 ; SPRITE 25   | xy: { 0x170, 0x0F0 }
|09CD94| db $16, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x160 }
|09CD97| db $19, $0F, $12 ; SPRITE 12   | xy: { 0x0F0, 0x190 }
|09CD9A| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6C:
|09CD9B| db $06, $15, $0E ; SPRITE 0E   | xy: { 0x150, 0x060 }
|09CD9E| db $0A, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x0A0 }
|09CDA1| db $0D, $14, $12 ; SPRITE 12   | xy: { 0x140, 0x0D0 }
|09CDA4| db $16, $14, $11 ; SPRITE 11   | xy: { 0x140, 0x160 }
|09CDA7| db $19, $09, $22 ; SPRITE 22   | xy: { 0x090, 0x190 }
|09CDAA| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6D:
|09CDAB| db $05, $0F, $22 ; SPRITE 22   | xy: { 0x0F0, 0x050 }
|09CDAE| db $07, $0D, $11 ; SPRITE 11   | xy: { 0x0D0, 0x070 }
|09CDB1| db $08, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x080 }
|09CDB4| db $0A, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0A0 }
|09CDB7| db $1A, $10, $D3 ; SPRITE D3   | xy: { 0x100, 0x1A0 }
|09CDBA| db $1B, $13, $D3 ; SPRITE D3   | xy: { 0x130, 0x1B0 }
|09CDBD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6E:
|09CDBE| db $08, $0C, $DA ; SPRITE DA   | xy: { 0x0C0, 0x080 }
|09CDC1| db $09, $10, $79 ; SPRITE 79   | xy: { 0x100, 0x090 }
|09CDC4| db $0A, $14, $AC ; SPRITE AC   | xy: { 0x140, 0x0A0 }
|09CDC7| db $0B, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x0B0 }
|09CDCA| db $0E, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0E0 }
|09CDCD| db $18, $1A, $22 ; SPRITE 22   | xy: { 0x1A0, 0x180 }
|09CDD0| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen6F:
|09CDD1| db $08, $0D, $0E ; SPRITE 0E   | xy: { 0x0D0, 0x080 }
|09CDD4| db $08, $0F, $0E ; SPRITE 0E   | xy: { 0x0F0, 0x080 }
|09CDD7| db $0B, $0E, $0E ; SPRITE 0E   | xy: { 0x0E0, 0x0B0 }
|09CDDA| db $0C, $17, $00 ; SPRITE 00   | xy: { 0x170, 0x0C0 }
|09CDDD| db $17, $09, $D3 ; SPRITE D3   | xy: { 0x090, 0x170 }
|09CDE0| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen70:
|09CDE1| db $1B, $21, $00 ; SPRITE 00   | xy: { 0x210, 0x1B0 }
|09CDE4| db $1C, $2B, $55 ; SPRITE 55   | xy: { 0x2B0, 0x1C0 }
|09CDE7| db $21, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x210 }
|09CDEA| db $24, $1B, $CF ; SPRITE CF   | xy: { 0x1B0, 0x240 }
|09CDED| db $27, $10, $CF ; SPRITE CF   | xy: { 0x100, 0x270 }
|09CDF0| db $28, $07, $00 ; SPRITE 00   | xy: { 0x070, 0x280 }
|09CDF3| db $2B, $16, $55 ; SPRITE 55   | xy: { 0x160, 0x2B0 }
|09CDF6| db $2E, $1E, $55 ; SPRITE 55   | xy: { 0x1E0, 0x2E0 }
|09CDF9| db $33, $17, $CF ; SPRITE CF   | xy: { 0x170, 0x330 }
|09CDFC| db $38, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x380 }
|09CDFF| db $2B, $23, $55 ; SPRITE 55   | xy: { 0x230, 0x2B0 }
|09CE02| db $2C, $27, $CF ; SPRITE CF   | xy: { 0x270, 0x2C0 }
|09CE05| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen72:
|09CE06| db $0B, $1B, $25 ; SPRITE 25   | xy: { 0x1B0, 0x0B0 }
|09CE09| db $0D, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0D0 }
|09CE0C| db $0E, $13, $41 ; SPRITE 41   | xy: { 0x130, 0x0E0 }
|09CE0F| db $14, $1A, $25 ; SPRITE 25   | xy: { 0x1A0, 0x140 }
|09CE12| db $17, $0B, $22 ; SPRITE 22   | xy: { 0x0B0, 0x170 }
|09CE15| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen73:
|09CE16| db $0C, $17, $AA ; SPRITE AA   | xy: { 0x170, 0x0C0 }
|09CE19| db $0D, $09, $12 ; SPRITE 12   | xy: { 0x090, 0x0D0 }
|09CE1C| db $0E, $14, $A8 ; SPRITE A8   | xy: { 0x140, 0x0E0 }
|09CE1F| db $1A, $15, $A8 ; SPRITE A8   | xy: { 0x150, 0x1A0 }
|09CE22| db $1B, $1B, $A9 ; SPRITE A9   | xy: { 0x1B0, 0x1B0 }
|09CE25| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen74:
|09CE26| db $0D, $0B, $12 ; SPRITE 12   | xy: { 0x0B0, 0x0D0 }
|09CE29| db $0E, $17, $33 ; SPRITE 33   | xy: { 0x170, 0x0E0 }
|09CE2C| db $11, $10, $A8 ; SPRITE A8   | xy: { 0x100, 0x110 }
|09CE2F| db $11, $15, $12 ; SPRITE 12   | xy: { 0x150, 0x110 }
|09CE32| db $12, $0A, $AA ; SPRITE AA   | xy: { 0x0A0, 0x120 }
|09CE35| db $14, $0E, $AC ; SPRITE AC   | xy: { 0x0E0, 0x140 }
|09CE38| db $17, $11, $12 ; SPRITE 12   | xy: { 0x110, 0x170 }
|09CE3B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen75:
|09CE3C| db $05, $0A, $D3 ; SPRITE D3   | xy: { 0x0A0, 0x050 }
|09CE3F| db $07, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x070 }
|09CE42| db $09, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x090 }
|09CE45| db $13, $07, $08 ; SPRITE 08   | xy: { 0x070, 0x130 }
|09CE48| db $16, $18, $A8 ; SPRITE A8   | xy: { 0x180, 0x160 }
|09CE4B| db $17, $09, $AA ; SPRITE AA   | xy: { 0x090, 0x170 }
|09CE4E| db $0C, $30, $55 ; SPRITE 55   | xy: { 0x300, 0x0C0 }
|09CE51| db $11, $29, $A9 ; SPRITE A9   | xy: { 0x290, 0x110 }
|09CE54| db $15, $36, $A8 ; SPRITE A8   | xy: { 0x360, 0x150 }
|09CE57| db $1F, $31, $AA ; SPRITE AA   | xy: { 0x310, 0x1F0 }
|09CE5A| db $22, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x220 }
|09CE5D| db $28, $14, $A8 ; SPRITE A8   | xy: { 0x140, 0x280 }
|09CE60| db $2E, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x2E0 }
|09CE63| db $32, $19, $A8 ; SPRITE A8   | xy: { 0x190, 0x320 }
|09CE66| db $35, $0A, $A9 ; SPRITE A9   | xy: { 0x0A0, 0x350 }
|09CE69| db $39, $08, $22 ; SPRITE 22   | xy: { 0x080, 0x390 }
|09CE6C| db $39, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x390 }
|09CE6F| db $26, $2A, $AA ; SPRITE AA   | xy: { 0x2A0, 0x260 }
|09CE72| db $28, $32, $A8 ; SPRITE A8   | xy: { 0x320, 0x280 }
|09CE75| db $2C, $2A, $55 ; SPRITE 55   | xy: { 0x2A0, 0x2C0 }
|09CE78| db $35, $32, $55 ; SPRITE 55   | xy: { 0x320, 0x350 }
|09CE7B| db $39, $37, $08 ; SPRITE 08   | xy: { 0x370, 0x390 }
|09CE7E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen77:
|09CE7F| db $08, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x080 }
|09CE82| db $0A, $09, $D3 ; SPRITE D3   | xy: { 0x090, 0x0A0 }
|09CE85| db $0B, $0D, $A9 ; SPRITE A9   | xy: { 0x0D0, 0x0B0 }
|09CE88| db $11, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x110 }
|09CE8B| db $12, $07, $55 ; SPRITE 55   | xy: { 0x070, 0x120 }
|09CE8E| db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
|09CE91| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7A:
|09CE92| db $07, $06, $11 ; SPRITE 11   | xy: { 0x060, 0x070 }
|09CE95| db $09, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x090 }
|09CE98| db $0B, $14, $22 ; SPRITE 22   | xy: { 0x140, 0x0B0 }
|09CE9B| db $0B, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x0B0 }
|09CE9E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7B:
|09CE9F| db $06, $12, $A9 ; SPRITE A9   | xy: { 0x120, 0x060 }
|09CEA2| db $0A, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x0A0 }
|09CEA5| db $0F, $0D, $12 ; SPRITE 12   | xy: { 0x0D0, 0x0F0 }
|09CEA8| db $10, $0A, $D3 ; SPRITE D3   | xy: { 0x0A0, 0x100 }
|09CEAB| db $14, $13, $12 ; SPRITE 12   | xy: { 0x130, 0x140 }
|09CEAE| db $18, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x180 }
|09CEB1| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7C:
|09CEB2| db $05, $03, $D3 ; SPRITE D3   | xy: { 0x030, 0x050 }
|09CEB5| db $06, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x060 }
|09CEB8| db $06, $0F, $33 ; SPRITE 33   | xy: { 0x0F0, 0x060 }
|09CEBB| db $11, $11, $11 ; SPRITE 11   | xy: { 0x110, 0x110 }
|09CEBE| db $15, $18, $22 ; SPRITE 22   | xy: { 0x180, 0x150 }
|09CEC1| db $19, $16, $22 ; SPRITE 22   | xy: { 0x160, 0x190 }
|09CEC4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen7F:
|09CEC5| db $06, $10, $A8 ; SPRITE A8   | xy: { 0x100, 0x060 }
|09CEC8| db $06, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x060 }
|09CECB| db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
|09CECE| db $0E, $07, $55 ; SPRITE 55   | xy: { 0x070, 0x0E0 }
|09CED1| db $13, $0D, $A8 ; SPRITE A8   | xy: { 0x0D0, 0x130 }
|09CED4| db $14, $16, $AA ; SPRITE AA   | xy: { 0x160, 0x140 }
|09CED7| db $17, $0F, $08 ; SPRITE 08   | xy: { 0x0F0, 0x170 }
|09CEDA| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen80:
|09CEDB| db $08, $07, $62 ; SPRITE 62   | xy: { 0x070, 0x080 }
|09CEDE| db $0A, $07, $B3 ; SPRITE B3   | xy: { 0x070, 0x0A0 }
|09CEE1| db $14, $0F, $5A ; SPRITE 5A   | xy: { 0x0F0, 0x140 }
|09CEE4| db $16, $00, $59 ; SPRITE 59   | xy: { 0x000, 0x160 }
|09CEE7| db $18, $02, $5A ; SPRITE 5A   | xy: { 0x020, 0x180 }
|09CEEA| db $1A, $0E, $59 ; SPRITE 59   | xy: { 0x0E0, 0x1A0 }
|09CEED| db $1B, $0F, $5A ; SPRITE 5A   | xy: { 0x0F0, 0x1B0 }
|09CEF0| db $04, $16, $2B ; SPRITE 2B   | xy: { 0x160, 0x040 }
|09CEF3| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen81:
|09CEF4| db $26, $1B, $EB ; SPRITE EB   | xy: { 0x1B0, 0x260 }
|09CEF7| db $06, $0A, $56 ; SPRITE 56   | xy: { 0x0A0, 0x060 }
|09CEFA| db $06, $1C, $56 ; SPRITE 56   | xy: { 0x1C0, 0x060 }
|09CEFD| db $07, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x070 }
|09CF00| db $0A, $16, $56 ; SPRITE 56   | xy: { 0x160, 0x0A0 }
|09CF03| db $0A, $1A, $55 ; SPRITE 55   | xy: { 0x1A0, 0x0A0 }
|09CF06| db $0C, $09, $55 ; SPRITE 55   | xy: { 0x090, 0x0C0 }
|09CF09| db $0D, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x0D0 }
|09CF0C| db $12, $1A, $56 ; SPRITE 56   | xy: { 0x1A0, 0x120 }
|09CF0F| db $13, $07, $56 ; SPRITE 56   | xy: { 0x070, 0x130 }
|09CF12| db $13, $14, $56 ; SPRITE 56   | xy: { 0x140, 0x130 }
|09CF15| db $18, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x180 }
|09CF18| db $1C, $04, $56 ; SPRITE 56   | xy: { 0x040, 0x1C0 }
|09CF1B| db $04, $3B, $52 ; SPRITE 52   | xy: { 0x3B0, 0x040 }
|09CF1E| db $08, $27, $55 ; SPRITE 55   | xy: { 0x270, 0x080 }
|09CF21| db $08, $2D, $55 ; SPRITE 55   | xy: { 0x2D0, 0x080 }
|09CF24| db $0E, $22, $56 ; SPRITE 56   | xy: { 0x220, 0x0E0 }
|09CF27| db $0E, $2D, $55 ; SPRITE 55   | xy: { 0x2D0, 0x0E0 }
|09CF2A| db $14, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x140 }
|09CF2D| db $20, $0D, $56 ; SPRITE 56   | xy: { 0x0D0, 0x200 }
|09CF30| db $31, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x310 }
|09CF33| db $31, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x310 }
|09CF36| db $33, $0C, $56 ; SPRITE 56   | xy: { 0x0C0, 0x330 }
|09CF39| db $35, $0E, $55 ; SPRITE 55   | xy: { 0x0E0, 0x350 }
|09CF3C| db $38, $08, $56 ; SPRITE 56   | xy: { 0x080, 0x380 }
|09CF3F| db $28, $3B, $56 ; SPRITE 56   | xy: { 0x3B0, 0x280 }
|09CF42| db $2B, $3A, $56 ; SPRITE 56   | xy: { 0x3A0, 0x2B0 }
|09CF45| db $35, $2D, $56 ; SPRITE 56   | xy: { 0x2D0, 0x350 }
|09CF48| db $36, $37, $56 ; SPRITE 56   | xy: { 0x370, 0x360 }
|09CF4B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen00_1:
|09CF4C| db $12, $07, $E8 ; SPRITE E8   | xy: { 0x070, 0x120 }
|09CF4F| db $0B, $12, $00 ; SPRITE 00   | xy: { 0x120, 0x0B0 }
|09CF52| db $15, $1E, $E7 ; SPRITE E7   | xy: { 0x1E0, 0x150 }
|09CF55| db $06, $28, $E8 ; SPRITE E8   | xy: { 0x280, 0x060 }
|09CF58| db $0A, $31, $0D ; SPRITE 0D   | xy: { 0x310, 0x0A0 }
|09CF5B| db $0A, $2D, $00 ; SPRITE 00   | xy: { 0x2D0, 0x0A0 }
|09CF5E| db $10, $2A, $17 ; SPRITE 17   | xy: { 0x2A0, 0x100 }
|09CF61| db $15, $39, $E8 ; SPRITE E8   | xy: { 0x390, 0x150 }
|09CF64| db $22, $0E, $C4 ; SPRITE C4   | xy: { 0x0E0, 0x220 }
|09CF67| db $2D, $1E, $17 ; SPRITE 17   | xy: { 0x1E0, 0x2D0 }
|09CF6A| db $25, $29, $79 ; SPRITE 79   | xy: { 0x290, 0x250 }
|09CF6D| db $27, $2A, $33 ; SPRITE 33   | xy: { 0x2A0, 0x270 }
|09CF70| db $2D, $36, $00 ; SPRITE 00   | xy: { 0x360, 0x2D0 }
|09CF73| db $35, $25, $E8 ; SPRITE E8   | xy: { 0x250, 0x350 }
|09CF76| db $35, $29, $C4 ; SPRITE C4   | xy: { 0x290, 0x350 }
|09CF79| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen02_1:
|09CF7A| db $13, $04, $0D ; SPRITE 0D   | xy: { 0x040, 0x130 }
|09CF7D| db $13, $0C, $2C ; SPRITE 2C   | xy: { 0x0C0, 0x130 }
|09CF80| db $1A, $0D, $17 ; SPRITE 17   | xy: { 0x0D0, 0x1A0 }
|09CF83| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen03_1:
|09CF84| db $00, $00, $F4 ; OVERLORD 02 | xy: { 0x000, 0x000 }
|09CF87| db $04, $0B, $F2 ; SPRITE F2   | xy: { 0x0B0, 0x040 }
|09CF8A| db $0C, $27, $27 ; SPRITE 27   | xy: { 0x270, 0x0C0 }
|09CF8D| db $16, $22, $EB ; SPRITE EB   | xy: { 0x220, 0x160 }
|09CF90| db $35, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x350 }
|09CF93| db $36, $06, $27 ; SPRITE 27   | xy: { 0x060, 0x360 }
|09CF96| db $3B, $0D, $27 ; SPRITE 27   | xy: { 0x0D0, 0x3B0 }
|09CF99| db $3B, $12, $F3 ; OVERLORD 01 | xy: { 0x120, 0x3B0 }
|09CF9C| db $2D, $2C, $27 ; SPRITE 27   | xy: { 0x2C0, 0x2D0 }
|09CF9F| db $33, $34, $27 ; SPRITE 27   | xy: { 0x340, 0x330 }
|09CFA2| db $34, $2F, $27 ; SPRITE 27   | xy: { 0x2F0, 0x340 }
|09CFA5| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen05_1:
|09CFA6| db $0E, $1E, $27 ; SPRITE 27   | xy: { 0x1E0, 0x0E0 }
|09CFA9| db $0F, $1F, $C9 ; SPRITE C9   | xy: { 0x1F0, 0x0F0 }
|09CFAC| db $03, $2F, $EB ; SPRITE EB   | xy: { 0x2F0, 0x030 }
|09CFAF| db $0D, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0D0 }
|09CFB2| db $0F, $29, $C9 ; SPRITE C9   | xy: { 0x290, 0x0F0 }
|09CFB5| db $0F, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0F0 }
|09CFB8| db $10, $34, $E3 ; SPRITE E3   | xy: { 0x340, 0x100 }
|09CFBB| db $31, $1E, $C9 ; SPRITE C9   | xy: { 0x1E0, 0x310 }
|09CFBE| db $2A, $35, $C9 ; SPRITE C9   | xy: { 0x350, 0x2A0 }
|09CFC1| db $2F, $2A, $27 ; SPRITE 27   | xy: { 0x2A0, 0x2F0 }
|09CFC4| db $2F, $2F, $C9 ; SPRITE C9   | xy: { 0x2F0, 0x2F0 }
|09CFC7| db $36, $29, $27 ; SPRITE 27   | xy: { 0x290, 0x360 }
|09CFCA| db $36, $36, $27 ; SPRITE 27   | xy: { 0x360, 0x360 }
|09CFCD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen07_1:
|09CFCE| db $07, $0E, $27 ; SPRITE 27   | xy: { 0x0E0, 0x070 }
|09CFD1| db $0D, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x0D0 }
|09CFD4| db $15, $17, $27 ; SPRITE 27   | xy: { 0x170, 0x150 }
|09CFD7| db $16, $0F, $27 ; SPRITE 27   | xy: { 0x0F0, 0x160 }
|09CFDA| db $16, $12, $27 ; SPRITE 27   | xy: { 0x120, 0x160 }
|09CFDD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0A_1:
|09CFDE| db $04, $0E, $79 ; SPRITE 79   | xy: { 0x0E0, 0x040 }
|09CFE1| db $06, $0E, $33 ; SPRITE 33   | xy: { 0x0E0, 0x060 }
|09CFE4| db $09, $05, $00 ; SPRITE 00   | xy: { 0x050, 0x090 }
|09CFE7| db $0D, $10, $0D ; SPRITE 0D   | xy: { 0x100, 0x0D0 }
|09CFEA| db $0E, $0B, $0D ; SPRITE 0D   | xy: { 0x0B0, 0x0E0 }
|09CFED| db $16, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x160 }
|09CFF0| db $16, $0E, $17 ; SPRITE 17   | xy: { 0x0E0, 0x160 }
|09CFF3| db $16, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x160 }
|09CFF6| db $17, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x170 }
|09CFF9| db $1A, $19, $AC ; SPRITE AC   | xy: { 0x190, 0x1A0 }
|09CFFC| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0F_1:
|09CFFD| db $02, $06, $37 ; SPRITE 37   | xy: { 0x060, 0x020 }
|09D000| db $0D, $0D, $58 ; SPRITE 58   | xy: { 0x0D0, 0x0D0 }
|09D003| db $10, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x100 }
|09D006| db $12, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x120 }
|09D009| db $13, $08, $BA ; SPRITE BA   | xy: { 0x080, 0x130 }
|09D00C| db $15, $1C, $00 ; SPRITE 00   | xy: { 0x1C0, 0x150 }
|09D00F| db $17, $0E, $0A ; SPRITE 0A   | xy: { 0x0E0, 0x170 }
|09D012| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen10_1:
|09D013| db $0C, $05, $42 ; SPRITE 42   | xy: { 0x050, 0x0C0 }
|09D016| db $0C, $07, $AC ; SPRITE AC   | xy: { 0x070, 0x0C0 }
|09D019| db $0F, $17, $E0 ; SPRITE E0   | xy: { 0x170, 0x0F0 }
|09D01C| db $18, $08, $42 ; SPRITE 42   | xy: { 0x080, 0x180 }
|09D01F| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen11_1:
|09D020| db $0C, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x0C0 }
|09D023| db $0D, $1A, $42 ; SPRITE 42   | xy: { 0x1A0, 0x0D0 }
|09D026| db $10, $08, $DC ; SPRITE DC   | xy: { 0x080, 0x100 }
|09D029| db $17, $08, $0B ; SPRITE 0B   | xy: { 0x080, 0x170 }
|09D02C| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen12_1:
|09D02D| db $0E, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x0E0 }
|09D030| db $10, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x100 }
|09D033| db $10, $0F, $BA ; SPRITE BA   | xy: { 0x0F0, 0x100 }
|09D036| db $15, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x150 }
|09D039| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen13_1:
|09D03A| db $09, $18, $AC ; SPRITE AC   | xy: { 0x180, 0x090 }
|09D03D| db $17, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x170 }
|09D040| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen14_1:
|09D041| db $11, $15, $48 ; SPRITE 48   | xy: { 0x150, 0x110 }
|09D044| db $19, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x190 }
|09D047| db $0C, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x0C0 }
|09D04A| db $11, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x110 }
|09D04D| db $0E, $12, $C5 ; SPRITE C5   | xy: { 0x120, 0x0E0 }
|09D050| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen15_1:
|09D051| db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
|09D054| db $0E, $16, $41 ; SPRITE 41   | xy: { 0x160, 0x0E0 }
|09D057| db $0F, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x0F0 }
|09D05A| db $17, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x170 }
|09D05D| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen16_1:
|09D05E| db $0A, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0A0 }
|09D061| db $15, $0F, $36 ; SPRITE 36   | xy: { 0x0F0, 0x150 }
|09D064| db $18, $06, $0D ; SPRITE 0D   | xy: { 0x060, 0x180 }
|09D067| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen17_1:
|09D068| db $08, $18, $0D ; SPRITE 0D   | xy: { 0x180, 0x080 }
|09D06B| db $0A, $17, $0D ; SPRITE 0D   | xy: { 0x170, 0x0A0 }
|09D06E| db $0B, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0B0 }
|09D071| db $0C, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x0C0 }
|09D074| db $16, $08, $0D ; SPRITE 0D   | xy: { 0x080, 0x160 }
|09D077| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen18_1:
|09D078| db $0A, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x0A0 }
|09D07B| db $17, $0C, $F3 ; OVERLORD 01 | xy: { 0x0C0, 0x170 }
|09D07E| db $16, $18, $75 ; SPRITE 75   | xy: { 0x180, 0x160 }
|09D081| db $1C, $0E, $3D ; SPRITE 3D   | xy: { 0x0E0, 0x1C0 }
|09D084| db $18, $20, $1D ; SPRITE 1D   | xy: { 0x200, 0x180 }
|09D087| db $1B, $34, $F3 ; OVERLORD 01 | xy: { 0x340, 0x1B0 }
|09D08A| db $2E, $1D, $74 ; SPRITE 74   | xy: { 0x1D0, 0x2E0 }
|09D08D| db $2C, $19, $2A ; SPRITE 2A   | xy: { 0x190, 0x2C0 }
|09D090| db $31, $18, $3C ; SPRITE 3C   | xy: { 0x180, 0x310 }
|09D093| db $35, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x350 }
|09D096| db $36, $18, $0B ; SPRITE 0B   | xy: { 0x180, 0x360 }
|09D099| db $20, $33, $34 ; SPRITE 34   | xy: { 0x330, 0x200 }
|09D09C| db $33, $36, $DA ; SPRITE DA   | xy: { 0x360, 0x330 }
|09D09F| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1A_1:
|09D0A0| db $0C, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x0C0 }
|09D0A3| db $0E, $0C, $42 ; SPRITE 42   | xy: { 0x0C0, 0x0E0 }
|09D0A6| db $11, $0D, $E3 ; SPRITE E3   | xy: { 0x0D0, 0x110 }
|09D0A9| db $17, $17, $DA ; SPRITE DA   | xy: { 0x170, 0x170 }
|09D0AC| db $18, $0A, $D8 ; SPRITE D8   | xy: { 0x0A0, 0x180 }
|09D0AF| db $18, $0F, $43 ; SPRITE 43   | xy: { 0x0F0, 0x180 }
|09D0B2| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_1:
|09D0B3| db $06, $1F, $40 ; SPRITE 40   | xy: { 0x1F0, 0x060 }
|09D0B6| db $11, $09, $49 ; SPRITE 49   | xy: { 0x090, 0x110 }
|09D0B9| db $13, $0A, $49 ; SPRITE 49   | xy: { 0x0A0, 0x130 }
|09D0BC| db $14, $16, $AC ; SPRITE AC   | xy: { 0x160, 0x140 }
|09D0BF| db $19, $0E, $4A ; SPRITE 4A   | xy: { 0x0E0, 0x190 }
|09D0C2| db $1A, $1F, $41 ; SPRITE 41   | xy: { 0x1F0, 0x1A0 }
|09D0C5| db $17, $29, $33 ; SPRITE 33   | xy: { 0x290, 0x170 }
|09D0C8| db $19, $31, $4A ; SPRITE 4A   | xy: { 0x310, 0x190 }
|09D0CB| db $1A, $20, $41 ; SPRITE 41   | xy: { 0x200, 0x1A0 }
|09D0CE| db $25, $0E, $4A ; SPRITE 4A   | xy: { 0x0E0, 0x250 }
|09D0D1| db $2D, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x2D0 }
|09D0D4| db $2D, $26, $48 ; SPRITE 48   | xy: { 0x260, 0x2D0 }
|09D0D7| db $32, $21, $48 ; SPRITE 48   | xy: { 0x210, 0x320 }
|09D0DA| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_1:
|09D0DB| db $06, $0B, $AC ; SPRITE AC   | xy: { 0x0B0, 0x060 }
|09D0DE| db $0C, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0C0 }
|09D0E1| db $0D, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x0D0 }
|09D0E4| db $0F, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0F0 }
|09D0E7| db $12, $07, $58 ; SPRITE 58   | xy: { 0x070, 0x120 }
|09D0EA| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1E_1:
|09D0EB| db $08, $13, $51 ; SPRITE 51   | xy: { 0x130, 0x080 }
|09D0EE| db $0E, $0E, $51 ; SPRITE 51   | xy: { 0x0E0, 0x0E0 }
|09D0F1| db $1A, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x1A0 }
|09D0F4| db $1A, $19, $51 ; SPRITE 51   | xy: { 0x190, 0x1A0 }
|09D0F7| db $09, $33, $51 ; SPRITE 51   | xy: { 0x330, 0x090 }
|09D0FA| db $09, $37, $51 ; SPRITE 51   | xy: { 0x370, 0x090 }
|09D0FD| db $10, $31, $41 ; SPRITE 41   | xy: { 0x310, 0x100 }
|09D100| db $17, $2F, $51 ; SPRITE 51   | xy: { 0x2F0, 0x170 }
|09D103| db $1D, $35, $0A ; SPRITE 0A   | xy: { 0x350, 0x1D0 }
|09D106| db $25, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x250 }
|09D109| db $28, $09, $08 ; SPRITE 08   | xy: { 0x090, 0x280 }
|09D10C| db $2C, $15, $08 ; SPRITE 08   | xy: { 0x150, 0x2C0 }
|09D10F| db $33, $14, $51 ; SPRITE 51   | xy: { 0x140, 0x330 }
|09D112| db $33, $17, $51 ; SPRITE 51   | xy: { 0x170, 0x330 }
|09D115| db $36, $09, $08 ; SPRITE 08   | xy: { 0x090, 0x360 }
|09D118| db $25, $24, $51 ; SPRITE 51   | xy: { 0x240, 0x250 }
|09D11B| db $29, $28, $51 ; SPRITE 51   | xy: { 0x280, 0x290 }
|09D11E| db $29, $3D, $51 ; SPRITE 51   | xy: { 0x3D0, 0x290 }
|09D121| db $3B, $2E, $08 ; SPRITE 08   | xy: { 0x2E0, 0x3B0 }
|09D124| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen22_1:
|09D125| db $04, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x040 }
|09D128| db $12, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x120 }
|09D12B| db $14, $12, $0B ; SPRITE 0B   | xy: { 0x120, 0x140 }
|09D12E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen25_1:
|09D12F| db $08, $0F, $08 ; SPRITE 08   | xy: { 0x0F0, 0x080 }
|09D132| db $0C, $05, $08 ; SPRITE 08   | xy: { 0x050, 0x0C0 }
|09D135| db $0C, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0C0 }
|09D138| db $0D, $10, $08 ; SPRITE 08   | xy: { 0x100, 0x0D0 }
|09D13B| db $11, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x110 }
|09D13E| db $16, $18, $08 ; SPRITE 08   | xy: { 0x180, 0x160 }
|09D141| db $17, $08, $08 ; SPRITE 08   | xy: { 0x080, 0x170 }
|09D144| db $17, $10, $08 ; SPRITE 08   | xy: { 0x100, 0x170 }
|09D147| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen28_1:
|09D148| db $13, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x130 }
|09D14B| db $12, $08, $30 ; SPRITE 30   | xy: { 0x080, 0x120 }
|09D14E| db $18, $19, $2F ; SPRITE 2F   | xy: { 0x190, 0x180 }
|09D151| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2A_1:
|09D152| db $09, $09, $1D ; SPRITE 1D   | xy: { 0x090, 0x090 }
|09D155| db $0C, $0E, $9E ; SPRITE 9E   | xy: { 0x0E0, 0x0C0 }
|09D158| db $0E, $0D, $A0 ; SPRITE A0   | xy: { 0x0D0, 0x0E0 }
|09D15B| db $0E, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0E0 }
|09D15E| db $0E, $11, $A0 ; SPRITE A0   | xy: { 0x110, 0x0E0 }
|09D161| db $0F, $0C, $9F ; SPRITE 9F   | xy: { 0x0C0, 0x0F0 }
|09D164| db $10, $11, $9F ; SPRITE 9F   | xy: { 0x110, 0x100 }
|09D167| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_1:
|09D168| db $0D, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x0D0 }
|09D16B| db $11, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x110 }
|09D16E| db $15, $14, $42 ; SPRITE 42   | xy: { 0x140, 0x150 }
|09D171| db $17, $10, $42 ; SPRITE 42   | xy: { 0x100, 0x170 }
|09D174| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_1:
|09D175| db $14, $18, $42 ; SPRITE 42   | xy: { 0x180, 0x140 }
|09D178| db $19, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x190 }
|09D17B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2D_1:
|09D17C| db $0B, $13, $42 ; SPRITE 42   | xy: { 0x130, 0x0B0 }
|09D17F| db $10, $10, $46 ; SPRITE 46   | xy: { 0x100, 0x100 }
|09D182| db $16, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x160 }
|09D185| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2E_1:
|09D186| db $0C, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x0C0 }
|09D189| db $0E, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0E0 }
|09D18C| db $12, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x120 }
|09D18F| db $17, $19, $08 ; SPRITE 08   | xy: { 0x190, 0x170 }
|09D192| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2F_1:
|09D193| db $0C, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x0C0 }
|09D196| db $17, $07, $51 ; SPRITE 51   | xy: { 0x070, 0x170 }
|09D199| db $17, $0C, $51 ; SPRITE 51   | xy: { 0x0C0, 0x170 }
|09D19C| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen30_1:
|09D19D| db $14, $12, $57 ; SPRITE 57   | xy: { 0x120, 0x140 }
|09D1A0| db $19, $12, $B3 ; SPRITE B3   | xy: { 0x120, 0x190 }
|09D1A3| db $1C, $0E, $57 ; SPRITE 57   | xy: { 0x0E0, 0x1C0 }
|09D1A6| db $1C, $16, $57 ; SPRITE 57   | xy: { 0x160, 0x1C0 }
|09D1A9| db $19, $27, $4C ; SPRITE 4C   | xy: { 0x270, 0x190 }
|09D1AC| db $1C, $22, $01 ; SPRITE 01   | xy: { 0x220, 0x1C0 }
|09D1AF| db $1F, $2A, $4C ; SPRITE 4C   | xy: { 0x2A0, 0x1F0 }
|09D1B2| db $26, $1D, $4C ; SPRITE 4C   | xy: { 0x1D0, 0x260 }
|09D1B5| db $29, $07, $01 ; SPRITE 01   | xy: { 0x070, 0x290 }
|09D1B8| db $29, $0F, $4C ; SPRITE 4C   | xy: { 0x0F0, 0x290 }
|09D1BB| db $2A, $06, $EB ; SPRITE EB   | xy: { 0x060, 0x2A0 }
|09D1BE| db $2C, $1B, $4C ; SPRITE 4C   | xy: { 0x1B0, 0x2C0 }
|09D1C1| db $30, $0A, $4C ; SPRITE 4C   | xy: { 0x0A0, 0x300 }
|09D1C4| db $35, $14, $4C ; SPRITE 4C   | xy: { 0x140, 0x350 }
|09D1C7| db $2B, $37, $F2 ; SPRITE F2   | xy: { 0x370, 0x2B0 }
|09D1CA| db $21, $36, $D4 ; SPRITE D4   | xy: { 0x360, 0x210 }
|09D1CD| db $24, $22, $4C ; SPRITE 4C   | xy: { 0x220, 0x240 }
|09D1D0| db $25, $29, $D4 ; SPRITE D4   | xy: { 0x290, 0x250 }
|09D1D3| db $2C, $20, $4C ; SPRITE 4C   | xy: { 0x200, 0x2C0 }
|09D1D6| db $32, $23, $4C ; SPRITE 4C   | xy: { 0x230, 0x320 }
|09D1D9| db $32, $30, $D4 ; SPRITE D4   | xy: { 0x300, 0x320 }
|09D1DC| db $33, $34, $01 ; SPRITE 01   | xy: { 0x340, 0x330 }
|09D1DF| db $3B, $2D, $D4 ; SPRITE D4   | xy: { 0x2D0, 0x3B0 }
|09D1E2| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_1:
|09D1E3| db $09, $1A, $D8 ; SPRITE D8   | xy: { 0x1A0, 0x090 }
|09D1E6| db $0B, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x0B0 }
|09D1E9| db $0B, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0B0 }
|09D1EC| db $12, $19, $E3 ; SPRITE E3   | xy: { 0x190, 0x120 }
|09D1EF| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen33_1:
|09D1F0| db $0B, $15, $47 ; SPRITE 47   | xy: { 0x150, 0x0B0 }
|09D1F3| db $0E, $09, $46 ; SPRITE 46   | xy: { 0x090, 0x0E0 }
|09D1F6| db $12, $17, $BA ; SPRITE BA   | xy: { 0x170, 0x120 }
|09D1F9| db $1B, $1A, $08 ; SPRITE 08   | xy: { 0x1A0, 0x1B0 }
|09D1FC| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen34_1:
|09D1FD| db $0D, $0B, $46 ; SPRITE 46   | xy: { 0x0B0, 0x0D0 }
|09D200| db $11, $15, $4D ; SPRITE 4D   | xy: { 0x150, 0x110 }
|09D203| db $12, $11, $47 ; SPRITE 47   | xy: { 0x110, 0x120 }
|09D206| db $13, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x130 }
|09D209| db $13, $0E, $E3 ; SPRITE E3   | xy: { 0x0E0, 0x130 }
|09D20C| db $17, $15, $47 ; SPRITE 47   | xy: { 0x150, 0x170 }
|09D20F| db $18, $0C, $46 ; SPRITE 46   | xy: { 0x0C0, 0x180 }
|09D212| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen35_1:
|09D213| db $07, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x070 }
|09D216| db $09, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x090 }
|09D219| db $0C, $0A, $46 ; SPRITE 46   | xy: { 0x0A0, 0x0C0 }
|09D21C| db $13, $19, $EB ; SPRITE EB   | xy: { 0x190, 0x130 }
|09D21F| db $14, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x140 }
|09D222| db $17, $07, $58 ; SPRITE 58   | xy: { 0x070, 0x170 }
|09D225| db $17, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x170 }
|09D228| db $0D, $25, $55 ; SPRITE 55   | xy: { 0x250, 0x0D0 }
|09D22B| db $1F, $27, $0D ; SPRITE 0D   | xy: { 0x270, 0x1F0 }
|09D22E| db $1F, $2F, $0D ; SPRITE 0D   | xy: { 0x2F0, 0x1F0 }
|09D231| db $35, $0A, $08 ; SPRITE 08   | xy: { 0x0A0, 0x350 }
|09D234| db $35, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x350 }
|09D237| db $35, $0F, $00 ; SPRITE 00   | xy: { 0x0F0, 0x350 }
|09D23A| db $39, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x390 }
|09D23D| db $3A, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x3A0 }
|09D240| db $3B, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x3B0 }
|09D243| db $2B, $24, $55 ; SPRITE 55   | xy: { 0x240, 0x2B0 }
|09D246| db $2B, $29, $BA ; SPRITE BA   | xy: { 0x290, 0x2B0 }
|09D249| db $31, $39, $55 ; SPRITE 55   | xy: { 0x390, 0x310 }
|09D24C| db $36, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x360 }
|09D24F| db $37, $32, $0D ; SPRITE 0D   | xy: { 0x320, 0x370 }
|09D252| db $39, $34, $0D ; SPRITE 0D   | xy: { 0x340, 0x390 }
|09D255| db $3A, $2E, $58 ; SPRITE 58   | xy: { 0x2E0, 0x3A0 }
|09D258| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen37_1:
|09D259| db $08, $08, $58 ; SPRITE 58   | xy: { 0x080, 0x080 }
|09D25C| db $08, $10, $58 ; SPRITE 58   | xy: { 0x100, 0x080 }
|09D25F| db $0B, $0F, $58 ; SPRITE 58   | xy: { 0x0F0, 0x0B0 }
|09D262| db $11, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x110 }
|09D265| db $15, $0C, $00 ; SPRITE 00   | xy: { 0x0C0, 0x150 }
|09D268| db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
|09D26B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3A_1:
|09D26C| db $05, $17, $39 ; SPRITE 39   | xy: { 0x170, 0x050 }
|09D26F| db $09, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x090 }
|09D272| db $0A, $0B, $3E ; SPRITE 3E   | xy: { 0x0B0, 0x0A0 }
|09D275| db $0E, $18, $3E ; SPRITE 3E   | xy: { 0x180, 0x0E0 }
|09D278| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3B_1:
|09D279| db $06, $13, $47 ; SPRITE 47   | xy: { 0x130, 0x060 }
|09D27C| db $0A, $0C, $46 ; SPRITE 46   | xy: { 0x0C0, 0x0A0 }
|09D27F| db $0D, $13, $D2 ; SPRITE D2   | xy: { 0x130, 0x0D0 }
|09D282| db $0B, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x0B0 }
|09D285| db $0E, $14, $EB ; SPRITE EB   | xy: { 0x140, 0x0E0 }
|09D288| db $10, $1B, $D2 ; SPRITE D2   | xy: { 0x1B0, 0x100 }
|09D28B| db $14, $0F, $4D ; SPRITE 4D   | xy: { 0x0F0, 0x140 }
|09D28E| db $1B, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x1B0 }
|09D291| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3C_1:
|09D292| db $0C, $08, $47 ; SPRITE 47   | xy: { 0x080, 0x0C0 }
|09D295| db $0F, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0F0 }
|09D298| db $0F, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x0F0 }
|09D29B| db $11, $09, $17 ; SPRITE 17   | xy: { 0x090, 0x110 }
|09D29E| db $15, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x150 }
|09D2A1| db $17, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x170 }
|09D2A4| db $18, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x180 }
|09D2A7| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3F_1:
|09D2A8| db $04, $11, $08 ; SPRITE 08   | xy: { 0x110, 0x040 }
|09D2AB| db $05, $16, $08 ; SPRITE 08   | xy: { 0x160, 0x050 }
|09D2AE| db $0B, $08, $55 ; SPRITE 55   | xy: { 0x080, 0x0B0 }
|09D2B1| db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
|09D2B4| db $16, $10, $0F ; SPRITE 0F   | xy: { 0x100, 0x160 }
|09D2B7| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen00_2:
|09D2B8| db $11, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x110 }
|09D2BB| db $12, $07, $E8 ; SPRITE E8   | xy: { 0x070, 0x120 }
|09D2BE| db $15, $1E, $E7 ; SPRITE E7   | xy: { 0x1E0, 0x150 }
|09D2C1| db $1F, $0D, $C4 ; SPRITE C4   | xy: { 0x0D0, 0x1F0 }
|09D2C4| db $06, $28, $E8 ; SPRITE E8   | xy: { 0x280, 0x060 }
|09D2C7| db $08, $2B, $33 ; SPRITE 33   | xy: { 0x2B0, 0x080 }
|09D2CA| db $08, $33, $41 ; SPRITE 41   | xy: { 0x330, 0x080 }
|09D2CD| db $0A, $2B, $C4 ; SPRITE C4   | xy: { 0x2B0, 0x0A0 }
|09D2D0| db $0A, $31, $0D ; SPRITE 0D   | xy: { 0x310, 0x0A0 }
|09D2D3| db $10, $2A, $17 ; SPRITE 17   | xy: { 0x2A0, 0x100 }
|09D2D6| db $2C, $0D, $17 ; SPRITE 17   | xy: { 0x0D0, 0x2C0 }
|09D2D9| db $33, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x330 }
|09D2DC| db $25, $29, $79 ; SPRITE 79   | xy: { 0x290, 0x250 }
|09D2DF| db $2F, $28, $17 ; SPRITE 17   | xy: { 0x280, 0x2F0 }
|09D2E2| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen02_2:
|09D2E3| db $12, $0D, $3B ; SPRITE 3B   | xy: { 0x0D0, 0x120 }
|09D2E6| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen03_2:
|09D2E7| db $00, $00, $F4 ; OVERLORD 02 | xy: { 0x000, 0x000 }
|09D2EA| db $04, $0B, $F2 ; SPRITE F2   | xy: { 0x0B0, 0x040 }
|09D2ED| db $1A, $10, $C9 ; SPRITE C9   | xy: { 0x100, 0x1A0 }
|09D2F0| db $1E, $1A, $C9 ; SPRITE C9   | xy: { 0x1A0, 0x1E0 }
|09D2F3| db $0C, $27, $27 ; SPRITE 27   | xy: { 0x270, 0x0C0 }
|09D2F6| db $15, $2C, $C9 ; SPRITE C9   | xy: { 0x2C0, 0x150 }
|09D2F9| db $16, $22, $EB ; SPRITE EB   | xy: { 0x220, 0x160 }
|09D2FC| db $19, $28, $C9 ; SPRITE C9   | xy: { 0x280, 0x190 }
|09D2FF| db $35, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x350 }
|09D302| db $36, $06, $27 ; SPRITE 27   | xy: { 0x060, 0x360 }
|09D305| db $3B, $0D, $27 ; SPRITE 27   | xy: { 0x0D0, 0x3B0 }
|09D308| db $3B, $12, $F3 ; OVERLORD 01 | xy: { 0x120, 0x3B0 }
|09D30B| db $2D, $2C, $27 ; SPRITE 27   | xy: { 0x2C0, 0x2D0 }
|09D30E| db $33, $34, $27 ; SPRITE 27   | xy: { 0x340, 0x330 }
|09D311| db $34, $2F, $27 ; SPRITE 27   | xy: { 0x2F0, 0x340 }
|09D314| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen05_2:
|09D315| db $0B, $07, $27 ; SPRITE 27   | xy: { 0x070, 0x0B0 }
|09D318| db $0D, $08, $C9 ; SPRITE C9   | xy: { 0x080, 0x0D0 }
|09D31B| db $0E, $1E, $27 ; SPRITE 27   | xy: { 0x1E0, 0x0E0 }
|09D31E| db $0F, $1F, $C9 ; SPRITE C9   | xy: { 0x1F0, 0x0F0 }
|09D321| db $03, $2F, $EB ; SPRITE EB   | xy: { 0x2F0, 0x030 }
|09D324| db $0D, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0D0 }
|09D327| db $0F, $29, $C9 ; SPRITE C9   | xy: { 0x290, 0x0F0 }
|09D32A| db $0F, $35, $27 ; SPRITE 27   | xy: { 0x350, 0x0F0 }
|09D32D| db $10, $34, $E3 ; SPRITE E3   | xy: { 0x340, 0x100 }
|09D330| db $31, $1E, $C9 ; SPRITE C9   | xy: { 0x1E0, 0x310 }
|09D333| db $2A, $35, $C9 ; SPRITE C9   | xy: { 0x350, 0x2A0 }
|09D336| db $2F, $2A, $27 ; SPRITE 27   | xy: { 0x2A0, 0x2F0 }
|09D339| db $2F, $2F, $C9 ; SPRITE C9   | xy: { 0x2F0, 0x2F0 }
|09D33C| db $36, $29, $27 ; SPRITE 27   | xy: { 0x290, 0x360 }
|09D33F| db $36, $36, $27 ; SPRITE 27   | xy: { 0x360, 0x360 }
|09D342| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen07_2:
|09D343| db $07, $0E, $27 ; SPRITE 27   | xy: { 0x0E0, 0x070 }
|09D346| db $0D, $0A, $27 ; SPRITE 27   | xy: { 0x0A0, 0x0D0 }
|09D349| db $15, $17, $27 ; SPRITE 27   | xy: { 0x170, 0x150 }
|09D34C| db $16, $0F, $27 ; SPRITE 27   | xy: { 0x0F0, 0x160 }
|09D34F| db $16, $12, $27 ; SPRITE 27   | xy: { 0x120, 0x160 }
|09D352| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0A_2:
|09D353| db $04, $0E, $79 ; SPRITE 79   | xy: { 0x0E0, 0x040 }
|09D356| db $0D, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x0D0 }
|09D359| db $16, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x160 }
|09D35C| db $16, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x160 }
|09D35F| db $16, $0E, $17 ; SPRITE 17   | xy: { 0x0E0, 0x160 }
|09D362| db $17, $11, $00 ; SPRITE 00   | xy: { 0x110, 0x170 }
|09D365| db $1A, $19, $AC ; SPRITE AC   | xy: { 0x190, 0x1A0 }
|09D368| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen0F_2:
|09D369| db $02, $06, $37 ; SPRITE 37   | xy: { 0x060, 0x020 }
|09D36C| db $0D, $0D, $58 ; SPRITE 58   | xy: { 0x0D0, 0x0D0 }
|09D36F| db $10, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x100 }
|09D372| db $11, $0A, $55 ; SPRITE 55   | xy: { 0x0A0, 0x110 }
|09D375| db $12, $11, $58 ; SPRITE 58   | xy: { 0x110, 0x120 }
|09D378| db $13, $08, $BA ; SPRITE BA   | xy: { 0x080, 0x130 }
|09D37B| db $17, $0E, $0A ; SPRITE 0A   | xy: { 0x0E0, 0x170 }
|09D37E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen10_2:
|09D37F| db $0C, $05, $41 ; SPRITE 41   | xy: { 0x050, 0x0C0 }
|09D382| db $0C, $07, $AC ; SPRITE AC   | xy: { 0x070, 0x0C0 }
|09D385| db $0F, $17, $E0 ; SPRITE E0   | xy: { 0x170, 0x0F0 }
|09D388| db $12, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x120 }
|09D38B| db $18, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x180 }
|09D38E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen11_2:
|09D38F| db $0C, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0C0 }
|09D392| db $0D, $1A, $41 ; SPRITE 41   | xy: { 0x1A0, 0x0D0 }
|09D395| db $10, $08, $DC ; SPRITE DC   | xy: { 0x080, 0x100 }
|09D398| db $17, $08, $0B ; SPRITE 0B   | xy: { 0x080, 0x170 }
|09D39B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen12_2:
|09D39C| db $0A, $14, $E3 ; SPRITE E3   | xy: { 0x140, 0x0A0 }
|09D39F| db $0E, $15, $41 ; SPRITE 41   | xy: { 0x150, 0x0E0 }
|09D3A2| db $10, $0F, $BA ; SPRITE BA   | xy: { 0x0F0, 0x100 }
|09D3A5| db $15, $15, $42 ; SPRITE 42   | xy: { 0x150, 0x150 }
|09D3A8| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen13_2:
|09D3A9| db $09, $18, $79 ; SPRITE 79   | xy: { 0x180, 0x090 }
|09D3AC| db $0C, $07, $DE ; SPRITE DE   | xy: { 0x070, 0x0C0 }
|09D3AF| db $17, $0D, $41 ; SPRITE 41   | xy: { 0x0D0, 0x170 }
|09D3B2| db $1A, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x1A0 }
|09D3B5| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen14_2:
|09D3B6| db $0D, $0D, $19 ; SPRITE 19   | xy: { 0x0D0, 0x0D0 }
|09D3B9| db $0F, $19, $19 ; SPRITE 19   | xy: { 0x190, 0x0F0 }
|09D3BC| db $10, $08, $19 ; SPRITE 19   | xy: { 0x080, 0x100 }
|09D3BF| db $11, $14, $19 ; SPRITE 19   | xy: { 0x140, 0x110 }
|09D3C2| db $14, $13, $19 ; SPRITE 19   | xy: { 0x130, 0x140 }
|09D3C5| db $19, $11, $41 ; SPRITE 41   | xy: { 0x110, 0x190 }
|09D3C8| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen15_2:
|09D3C9| db $09, $11, $BA ; SPRITE BA   | xy: { 0x110, 0x090 }
|09D3CC| db $0E, $16, $45 ; SPRITE 45   | xy: { 0x160, 0x0E0 }
|09D3CF| db $0F, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x0F0 }
|09D3D2| db $17, $0B, $43 ; SPRITE 43   | xy: { 0x0B0, 0x170 }
|09D3D5| db $1A, $04, $AC ; SPRITE AC   | xy: { 0x040, 0x1A0 }
|09D3D8| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen16_2:
|09D3D9| db $0A, $0D, $0D ; SPRITE 0D   | xy: { 0x0D0, 0x0A0 }
|09D3DC| db $15, $0F, $36 ; SPRITE 36   | xy: { 0x0F0, 0x150 }
|09D3DF| db $18, $06, $0D ; SPRITE 0D   | xy: { 0x060, 0x180 }
|09D3E2| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen17_2:
|09D3E3| db $08, $18, $0D ; SPRITE 0D   | xy: { 0x180, 0x080 }
|09D3E6| db $0A, $17, $0D ; SPRITE 0D   | xy: { 0x170, 0x0A0 }
|09D3E9| db $0B, $0D, $45 ; SPRITE 45   | xy: { 0x0D0, 0x0B0 }
|09D3EC| db $0C, $16, $0D ; SPRITE 0D   | xy: { 0x160, 0x0C0 }
|09D3EF| db $16, $08, $0D ; SPRITE 0D   | xy: { 0x080, 0x160 }
|09D3F2| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen18_2:
|09D3F3| db $08, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x080 }
|09D3F6| db $0A, $18, $DB ; SPRITE DB   | xy: { 0x180, 0x0A0 }
|09D3F9| db $16, $18, $75 ; SPRITE 75   | xy: { 0x180, 0x160 }
|09D3FC| db $1C, $07, $41 ; SPRITE 41   | xy: { 0x070, 0x1C0 }
|09D3FF| db $0B, $35, $41 ; SPRITE 41   | xy: { 0x350, 0x0B0 }
|09D402| db $18, $20, $1D ; SPRITE 1D   | xy: { 0x200, 0x180 }
|09D405| db $2E, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x2E0 }
|09D408| db $34, $14, $0B ; SPRITE 0B   | xy: { 0x140, 0x340 }
|09D40B| db $35, $16, $0B ; SPRITE 0B   | xy: { 0x160, 0x350 }
|09D40E| db $22, $39, $43 ; SPRITE 43   | xy: { 0x390, 0x220 }
|09D411| db $2E, $20, $41 ; SPRITE 41   | xy: { 0x200, 0x2E0 }
|09D414| db $33, $36, $79 ; SPRITE 79   | xy: { 0x360, 0x330 }
|09D417| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1A_2:
|09D418| db $08, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x080 }
|09D41B| db $0E, $0C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x0E0 }
|09D41E| db $11, $0D, $E3 ; SPRITE E3   | xy: { 0x0D0, 0x110 }
|09D421| db $18, $0A, $D8 ; SPRITE D8   | xy: { 0x0A0, 0x180 }
|09D424| db $18, $0F, $45 ; SPRITE 45   | xy: { 0x0F0, 0x180 }
|09D427| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1B_2:
|09D428| db $0D, $06, $45 ; SPRITE 45   | xy: { 0x060, 0x0D0 }
|09D42B| db $14, $16, $AC ; SPRITE AC   | xy: { 0x160, 0x140 }
|09D42E| db $1A, $1F, $45 ; SPRITE 45   | xy: { 0x1F0, 0x1A0 }
|09D431| db $13, $37, $41 ; SPRITE 41   | xy: { 0x370, 0x130 }
|09D434| db $25, $1E, $BA ; SPRITE BA   | xy: { 0x1E0, 0x250 }
|09D437| db $28, $08, $43 ; SPRITE 43   | xy: { 0x080, 0x280 }
|09D43A| db $2B, $1F, $42 ; SPRITE 42   | xy: { 0x1F0, 0x2B0 }
|09D43D| db $29, $38, $41 ; SPRITE 41   | xy: { 0x380, 0x290 }
|09D440| db $2D, $21, $41 ; SPRITE 41   | xy: { 0x210, 0x2D0 }
|09D443| db $32, $21, $45 ; SPRITE 45   | xy: { 0x210, 0x320 }
|09D446| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1D_2:
|09D447| db $06, $0B, $79 ; SPRITE 79   | xy: { 0x0B0, 0x060 }
|09D44A| db $0C, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0C0 }
|09D44D| db $0D, $07, $45 ; SPRITE 45   | xy: { 0x070, 0x0D0 }
|09D450| db $0F, $1B, $46 ; SPRITE 46   | xy: { 0x1B0, 0x0F0 }
|09D453| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen1E_2:
|09D454| db $0E, $0E, $51 ; SPRITE 51   | xy: { 0x0E0, 0x0E0 }
|09D457| db $1A, $11, $45 ; SPRITE 45   | xy: { 0x110, 0x1A0 }
|09D45A| db $1A, $19, $51 ; SPRITE 51   | xy: { 0x190, 0x1A0 }
|09D45D| db $04, $33, $33 ; SPRITE 33   | xy: { 0x330, 0x040 }
|09D460| db $09, $33, $51 ; SPRITE 51   | xy: { 0x330, 0x090 }
|09D463| db $09, $37, $51 ; SPRITE 51   | xy: { 0x370, 0x090 }
|09D466| db $10, $31, $45 ; SPRITE 45   | xy: { 0x310, 0x100 }
|09D469| db $17, $2F, $51 ; SPRITE 51   | xy: { 0x2F0, 0x170 }
|09D46C| db $25, $0F, $41 ; SPRITE 41   | xy: { 0x0F0, 0x250 }
|09D46F| db $28, $09, $45 ; SPRITE 45   | xy: { 0x090, 0x280 }
|09D472| db $2C, $15, $43 ; SPRITE 43   | xy: { 0x150, 0x2C0 }
|09D475| db $33, $14, $51 ; SPRITE 51   | xy: { 0x140, 0x330 }
|09D478| db $33, $17, $51 ; SPRITE 51   | xy: { 0x170, 0x330 }
|09D47B| db $25, $24, $51 ; SPRITE 51   | xy: { 0x240, 0x250 }
|09D47E| db $28, $31, $51 ; SPRITE 51   | xy: { 0x310, 0x280 }
|09D481| db $29, $28, $51 ; SPRITE 51   | xy: { 0x280, 0x290 }
|09D484| db $29, $3A, $51 ; SPRITE 51   | xy: { 0x3A0, 0x290 }
|09D487| db $29, $3D, $51 ; SPRITE 51   | xy: { 0x3D0, 0x290 }
|09D48A| db $37, $22, $E3 ; SPRITE E3   | xy: { 0x220, 0x370 }
|09D48D| db $3A, $2D, $45 ; SPRITE 45   | xy: { 0x2D0, 0x3A0 }
|09D490| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen22_2:
|09D491| db $04, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x040 }
|09D494| db $14, $0C, $0B ; SPRITE 0B   | xy: { 0x0C0, 0x140 }
|09D497| db $14, $12, $0B ; SPRITE 0B   | xy: { 0x120, 0x140 }
|09D49A| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen25_2:
|09D49B| db $08, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x080 }
|09D49E| db $0C, $05, $41 ; SPRITE 41   | xy: { 0x050, 0x0C0 }
|09D4A1| db $11, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x110 }
|09D4A4| db $16, $19, $45 ; SPRITE 45   | xy: { 0x190, 0x160 }
|09D4A7| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen28_2:
|09D4A8| db $0C, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0C0 }
|09D4AB| db $13, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x130 }
|09D4AE| db $12, $08, $30 ; SPRITE 30   | xy: { 0x080, 0x120 }
|09D4B1| db $18, $19, $2F ; SPRITE 2F   | xy: { 0x190, 0x180 }
|09D4B4| db $19, $0C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x190 }
|09D4B7| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen29_2:
|09D4B8| db $05, $0E, $41 ; SPRITE 41   | xy: { 0x0E0, 0x050 }
|09D4BB| db $0C, $0C, $45 ; SPRITE 45   | xy: { 0x0C0, 0x0C0 }
|09D4BE| db $14, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x140 }
|09D4C1| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2A_2:
|09D4C2| db $09, $09, $1D ; SPRITE 1D   | xy: { 0x090, 0x090 }
|09D4C5| db $0C, $0E, $9E ; SPRITE 9E   | xy: { 0x0E0, 0x0C0 }
|09D4C8| db $0E, $0D, $A0 ; SPRITE A0   | xy: { 0x0D0, 0x0E0 }
|09D4CB| db $0E, $0E, $2E ; SPRITE 2E   | xy: { 0x0E0, 0x0E0 }
|09D4CE| db $0E, $11, $A0 ; SPRITE A0   | xy: { 0x110, 0x0E0 }
|09D4D1| db $0F, $0C, $9F ; SPRITE 9F   | xy: { 0x0C0, 0x0F0 }
|09D4D4| db $10, $11, $9F ; SPRITE 9F   | xy: { 0x110, 0x100 }
|09D4D7| db $14, $15, $DB ; SPRITE DB   | xy: { 0x150, 0x140 }
|09D4DA| db $18, $0F, $DB ; SPRITE DB   | xy: { 0x0F0, 0x180 }
|09D4DD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2B_2:
|09D4DE| db $06, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x060 }
|09D4E1| db $0D, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x0D0 }
|09D4E4| db $11, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x110 }
|09D4E7| db $15, $14, $41 ; SPRITE 41   | xy: { 0x140, 0x150 }
|09D4EA| db $17, $10, $41 ; SPRITE 41   | xy: { 0x100, 0x170 }
|09D4ED| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2C_2:
|09D4EE| db $14, $18, $41 ; SPRITE 41   | xy: { 0x180, 0x140 }
|09D4F1| db $19, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x190 }
|09D4F4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2D_2:
|09D4F5| db $08, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x080 }
|09D4F8| db $0B, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0B0 }
|09D4FB| db $16, $12, $45 ; SPRITE 45   | xy: { 0x120, 0x160 }
|09D4FE| db $17, $1C, $55 ; SPRITE 55   | xy: { 0x1C0, 0x170 }
|09D501| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2E_2:
|09D502| db $09, $0C, $E3 ; SPRITE E3   | xy: { 0x0C0, 0x090 }
|09D505| db $0B, $14, $79 ; SPRITE 79   | xy: { 0x140, 0x0B0 }
|09D508| db $0C, $0E, $45 ; SPRITE 45   | xy: { 0x0E0, 0x0C0 }
|09D50B| db $0E, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x0E0 }
|09D50E| db $12, $05, $55 ; SPRITE 55   | xy: { 0x050, 0x120 }
|09D511| db $17, $19, $08 ; SPRITE 08   | xy: { 0x190, 0x170 }
|09D514| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen2F_2:
|09D515| db $0C, $0F, $45 ; SPRITE 45   | xy: { 0x0F0, 0x0C0 }
|09D518| db $17, $07, $51 ; SPRITE 51   | xy: { 0x070, 0x170 }
|09D51B| db $17, $0C, $51 ; SPRITE 51   | xy: { 0x0C0, 0x170 }
|09D51E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen30_2:
|09D51F| db $14, $12, $57 ; SPRITE 57   | xy: { 0x120, 0x140 }
|09D522| db $19, $12, $B3 ; SPRITE B3   | xy: { 0x120, 0x190 }
|09D525| db $1C, $0E, $57 ; SPRITE 57   | xy: { 0x0E0, 0x1C0 }
|09D528| db $1C, $16, $57 ; SPRITE 57   | xy: { 0x160, 0x1C0 }
|09D52B| db $19, $27, $4C ; SPRITE 4C   | xy: { 0x270, 0x190 }
|09D52E| db $1C, $22, $01 ; SPRITE 01   | xy: { 0x220, 0x1C0 }
|09D531| db $1F, $2A, $4C ; SPRITE 4C   | xy: { 0x2A0, 0x1F0 }
|09D534| db $23, $0C, $D4 ; SPRITE D4   | xy: { 0x0C0, 0x230 }
|09D537| db $26, $1D, $4C ; SPRITE 4C   | xy: { 0x1D0, 0x260 }
|09D53A| db $29, $07, $01 ; SPRITE 01   | xy: { 0x070, 0x290 }
|09D53D| db $29, $0F, $4C ; SPRITE 4C   | xy: { 0x0F0, 0x290 }
|09D540| db $2A, $06, $EB ; SPRITE EB   | xy: { 0x060, 0x2A0 }
|09D543| db $2C, $1B, $4C ; SPRITE 4C   | xy: { 0x1B0, 0x2C0 }
|09D546| db $30, $0A, $4C ; SPRITE 4C   | xy: { 0x0A0, 0x300 }
|09D549| db $35, $14, $4C ; SPRITE 4C   | xy: { 0x140, 0x350 }
|09D54C| db $2B, $37, $F2 ; SPRITE F2   | xy: { 0x370, 0x2B0 }
|09D54F| db $24, $22, $4C ; SPRITE 4C   | xy: { 0x220, 0x240 }
|09D552| db $2A, $28, $4C ; SPRITE 4C   | xy: { 0x280, 0x2A0 }
|09D555| db $32, $23, $4C ; SPRITE 4C   | xy: { 0x230, 0x320 }
|09D558| db $33, $34, $01 ; SPRITE 01   | xy: { 0x340, 0x330 }
|09D55B| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen32_2:
|09D55C| db $09, $1A, $D8 ; SPRITE D8   | xy: { 0x1A0, 0x090 }
|09D55F| db $0C, $0B, $42 ; SPRITE 42   | xy: { 0x0B0, 0x0C0 }
|09D562| db $0C, $12, $41 ; SPRITE 41   | xy: { 0x120, 0x0C0 }
|09D565| db $10, $13, $42 ; SPRITE 42   | xy: { 0x130, 0x100 }
|09D568| db $12, $19, $DD ; SPRITE DD   | xy: { 0x190, 0x120 }
|09D56B| db $15, $08, $D4 ; SPRITE D4   | xy: { 0x080, 0x150 }
|09D56E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen33_2:
|09D56F| db $06, $13, $08 ; SPRITE 08   | xy: { 0x130, 0x060 }
|09D572| db $0B, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x0B0 }
|09D575| db $12, $17, $BA ; SPRITE BA   | xy: { 0x170, 0x120 }
|09D578| db $16, $12, $08 ; SPRITE 08   | xy: { 0x120, 0x160 }
|09D57B| db $1B, $1A, $08 ; SPRITE 08   | xy: { 0x1A0, 0x1B0 }
|09D57E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen34_2:
|09D57F| db $0E, $17, $33 ; SPRITE 33   | xy: { 0x170, 0x0E0 }
|09D582| db $13, $08, $00 ; SPRITE 00   | xy: { 0x080, 0x130 }
|09D585| db $12, $11, $41 ; SPRITE 41   | xy: { 0x110, 0x120 }
|09D588| db $13, $06, $08 ; SPRITE 08   | xy: { 0x060, 0x130 }
|09D58B| db $18, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x180 }
|09D58E| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen35_2:
|09D58F| db $07, $0E, $00 ; SPRITE 00   | xy: { 0x0E0, 0x070 }
|09D592| db $09, $0D, $08 ; SPRITE 08   | xy: { 0x0D0, 0x090 }
|09D595| db $0C, $0A, $45 ; SPRITE 45   | xy: { 0x0A0, 0x0C0 }
|09D598| db $13, $19, $EB ; SPRITE EB   | xy: { 0x190, 0x130 }
|09D59B| db $14, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x140 }
|09D59E| db $17, $11, $55 ; SPRITE 55   | xy: { 0x110, 0x170 }
|09D5A1| db $0A, $38, $0A ; SPRITE 0A   | xy: { 0x380, 0x0A0 }
|09D5A4| db $0D, $25, $55 ; SPRITE 55   | xy: { 0x250, 0x0D0 }
|09D5A7| db $19, $37, $55 ; SPRITE 55   | xy: { 0x370, 0x190 }
|09D5AA| db $1F, $27, $0D ; SPRITE 0D   | xy: { 0x270, 0x1F0 }
|09D5AD| db $1F, $2F, $0D ; SPRITE 0D   | xy: { 0x2F0, 0x1F0 }
|09D5B0| db $26, $1B, $55 ; SPRITE 55   | xy: { 0x1B0, 0x260 }
|09D5B3| db $2F, $0D, $00 ; SPRITE 00   | xy: { 0x0D0, 0x2F0 }
|09D5B6| db $34, $06, $08 ; SPRITE 08   | xy: { 0x060, 0x340 }
|09D5B9| db $35, $0A, $08 ; SPRITE 08   | xy: { 0x0A0, 0x350 }
|09D5BC| db $35, $14, $55 ; SPRITE 55   | xy: { 0x140, 0x350 }
|09D5BF| db $39, $0B, $08 ; SPRITE 08   | xy: { 0x0B0, 0x390 }
|09D5C2| db $3A, $19, $0D ; SPRITE 0D   | xy: { 0x190, 0x3A0 }
|09D5C5| db $2B, $29, $BA ; SPRITE BA   | xy: { 0x290, 0x2B0 }
|09D5C8| db $31, $39, $55 ; SPRITE 55   | xy: { 0x390, 0x310 }
|09D5CB| db $36, $21, $55 ; SPRITE 55   | xy: { 0x210, 0x360 }
|09D5CE| db $37, $32, $0D ; SPRITE 0D   | xy: { 0x320, 0x370 }
|09D5D1| db $39, $34, $0D ; SPRITE 0D   | xy: { 0x340, 0x390 }
|09D5D4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen37_2:
|09D5D5| db $08, $08, $58 ; SPRITE 58   | xy: { 0x080, 0x080 }
|09D5D8| db $08, $10, $58 ; SPRITE 58   | xy: { 0x100, 0x080 }
|09D5DB| db $0B, $0F, $58 ; SPRITE 58   | xy: { 0x0F0, 0x0B0 }
|09D5DE| db $11, $16, $58 ; SPRITE 58   | xy: { 0x160, 0x110 }
|09D5E1| db $19, $12, $55 ; SPRITE 55   | xy: { 0x120, 0x190 }
|09D5E4| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3A_2:
|09D5E5| db $05, $17, $39 ; SPRITE 39   | xy: { 0x170, 0x050 }
|09D5E8| db $0A, $0B, $3E ; SPRITE 3E   | xy: { 0x0B0, 0x0A0 }
|09D5EB| db $0D, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x0D0 }
|09D5EE| db $0E, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x0E0 }
|09D5F1| db $0F, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x0F0 }
|09D5F4| db $10, $13, $00 ; SPRITE 00   | xy: { 0x130, 0x100 }
|09D5F7| db $0F, $11, $45 ; SPRITE 45   | xy: { 0x110, 0x0F0 }
|09D5FA| db $17, $17, $3E ; SPRITE 3E   | xy: { 0x170, 0x170 }
|09D5FD| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3B_2:
|09D5FE| db $0D, $13, $D2 ; SPRITE D2   | xy: { 0x130, 0x0D0 }
|09D601| db $0F, $0C, $08 ; SPRITE 08   | xy: { 0x0C0, 0x0F0 }
|09D604| db $0E, $14, $EB ; SPRITE EB   | xy: { 0x140, 0x0E0 }
|09D607| db $14, $0F, $0A ; SPRITE 0A   | xy: { 0x0F0, 0x140 }
|09D60A| db $18, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x180 }
|09D60D| db $1B, $14, $00 ; SPRITE 00   | xy: { 0x140, 0x1B0 }
|09D610| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3C_2:
|09D611| db $09, $0B, $00 ; SPRITE 00   | xy: { 0x0B0, 0x090 }
|09D614| db $0A, $08, $41 ; SPRITE 41   | xy: { 0x080, 0x0A0 }
|09D617| db $0F, $14, $08 ; SPRITE 08   | xy: { 0x140, 0x0F0 }
|09D61A| db $11, $09, $45 ; SPRITE 45   | xy: { 0x090, 0x110 }
|09D61D| db $15, $14, $0A ; SPRITE 0A   | xy: { 0x140, 0x150 }
|09D620| db $FF ; END

;===================================================================================================

Overworld_Sprites_Screen3F_2:
|09D621| db $05, $16, $0A ; SPRITE 0A   | xy: { 0x160, 0x050 }
|09D624| db $0C, $07, $BA ; SPRITE BA   | xy: { 0x070, 0x0C0 }
|09D627| db $13, $06, $55 ; SPRITE 55   | xy: { 0x060, 0x130 }
|09D62A| db $16, $11, $0F ; SPRITE 0F   | xy: { 0x110, 0x160 }
|09D62D| db $FF ; END

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
;       if every bit of t is set, then the entry corresponds to an overlord
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
|09D62E| dw RoomData_Sprites_Room0000
|09D630| dw RoomData_Sprites_Empty
|09D632| dw RoomData_Sprites_Room0002
|09D634| dw RoomData_Sprites_Empty
|09D636| dw RoomData_Sprites_Room0004
|09D638| dw RoomData_Sprites_Empty
|09D63A| dw RoomData_Sprites_Room0006
|09D63C| dw RoomData_Sprites_Room0007
|09D63E| dw RoomData_Sprites_Room0008
|09D640| dw RoomData_Sprites_Room0009
|09D642| dw RoomData_Sprites_Room000A
|09D644| dw RoomData_Sprites_Room000B
|09D646| dw RoomData_Sprites_Empty
|09D648| dw RoomData_Sprites_Room000D
|09D64A| dw RoomData_Sprites_Room000E
|09D64C| dw RoomData_Sprites_Empty
|09D64E| dw RoomData_Sprites_Empty
|09D650| dw RoomData_Sprites_Room0011
|09D652| dw RoomData_Sprites_Room0012
|09D654| dw RoomData_Sprites_Room0013
|09D656| dw RoomData_Sprites_Room0014
|09D658| dw RoomData_Sprites_Room0015
|09D65A| dw RoomData_Sprites_Room0016
|09D65C| dw RoomData_Sprites_Room0017
|09D65E| dw RoomData_Sprites_Empty
|09D660| dw RoomData_Sprites_Room0019
|09D662| dw RoomData_Sprites_Room001A
|09D664| dw RoomData_Sprites_Room001B
|09D666| dw RoomData_Sprites_Room001C
|09D668| dw RoomData_Sprites_Empty
|09D66A| dw RoomData_Sprites_Room001E
|09D66C| dw RoomData_Sprites_Room001F
|09D66E| dw RoomData_Sprites_Room0020
|09D670| dw RoomData_Sprites_Room0021
|09D672| dw RoomData_Sprites_Room0022
|09D674| dw RoomData_Sprites_Room0023
|09D676| dw RoomData_Sprites_Room0024
|09D678| dw RoomData_Sprites_Room0025
|09D67A| dw RoomData_Sprites_Room0026
|09D67C| dw RoomData_Sprites_Room0027
|09D67E| dw RoomData_Sprites_Room0028
|09D680| dw RoomData_Sprites_Room0029
|09D682| dw RoomData_Sprites_Room002A
|09D684| dw RoomData_Sprites_Room002B
|09D686| dw RoomData_Sprites_Room002C
|09D688| dw RoomData_Sprites_Empty
|09D68A| dw RoomData_Sprites_Room002E
|09D68C| dw RoomData_Sprites_Empty
|09D68E| dw RoomData_Sprites_Room0030
|09D690| dw RoomData_Sprites_Room0031
|09D692| dw RoomData_Sprites_Room0032
|09D694| dw RoomData_Sprites_Room0033
|09D696| dw RoomData_Sprites_Room0034
|09D698| dw RoomData_Sprites_Room0035
|09D69A| dw RoomData_Sprites_Room0036
|09D69C| dw RoomData_Sprites_Room0037
|09D69E| dw RoomData_Sprites_Room0038
|09D6A0| dw RoomData_Sprites_Room0039
|09D6A2| dw RoomData_Sprites_Room003A
|09D6A4| dw RoomData_Sprites_Room003B
|09D6A6| dw RoomData_Sprites_Room003C
|09D6A8| dw RoomData_Sprites_Room003D
|09D6AA| dw RoomData_Sprites_Room003E
|09D6AC| dw RoomData_Sprites_Room003F
|09D6AE| dw RoomData_Sprites_Room0040
|09D6B0| dw RoomData_Sprites_Room0041
|09D6B2| dw RoomData_Sprites_Room0042
|09D6B4| dw RoomData_Sprites_Room0043
|09D6B6| dw RoomData_Sprites_Room0044
|09D6B8| dw RoomData_Sprites_Room0045
|09D6BA| dw RoomData_Sprites_Room0046
|09D6BC| dw RoomData_Sprites_Room0047
|09D6BE| dw RoomData_Sprites_Empty
|09D6C0| dw RoomData_Sprites_Room0049
|09D6C2| dw RoomData_Sprites_Room004A
|09D6C4| dw RoomData_Sprites_Room004B
|09D6C6| dw RoomData_Sprites_Room004C
|09D6C8| dw RoomData_Sprites_Room004D
|09D6CA| dw RoomData_Sprites_Room004E
|09D6CC| dw RoomData_Sprites_Room004F
|09D6CE| dw RoomData_Sprites_Room0050
|09D6D0| dw RoomData_Sprites_Room0051
|09D6D2| dw RoomData_Sprites_Room0052
|09D6D4| dw RoomData_Sprites_Room0053
|09D6D6| dw RoomData_Sprites_Room0054
|09D6D8| dw RoomData_Sprites_Room0055
|09D6DA| dw RoomData_Sprites_Room0056
|09D6DC| dw RoomData_Sprites_Room0057
|09D6DE| dw RoomData_Sprites_Room0058
|09D6E0| dw RoomData_Sprites_Room0059
|09D6E2| dw RoomData_Sprites_Room005A
|09D6E4| dw RoomData_Sprites_Room005B
|09D6E6| dw RoomData_Sprites_Room005C
|09D6E8| dw RoomData_Sprites_Room005D
|09D6EA| dw RoomData_Sprites_Room005E
|09D6EC| dw RoomData_Sprites_Room005F
|09D6EE| dw RoomData_Sprites_Room0060
|09D6F0| dw RoomData_Sprites_Room0061
|09D6F2| dw RoomData_Sprites_Room0062
|09D6F4| dw RoomData_Sprites_Room0063
|09D6F6| dw RoomData_Sprites_Room0064
|09D6F8| dw RoomData_Sprites_Room0065
|09D6FA| dw RoomData_Sprites_Room0066
|09D6FC| dw RoomData_Sprites_Room0067
|09D6FE| dw RoomData_Sprites_Room0068
|09D700| dw RoomData_Sprites_Empty
|09D702| dw RoomData_Sprites_Room006A
|09D704| dw RoomData_Sprites_Room006B
|09D706| dw RoomData_Sprites_Room006C
|09D708| dw RoomData_Sprites_Room006D
|09D70A| dw RoomData_Sprites_Room006E
|09D70C| dw RoomData_Sprites_Empty
|09D70E| dw RoomData_Sprites_Empty
|09D710| dw RoomData_Sprites_Room0071
|09D712| dw RoomData_Sprites_Room0072
|09D714| dw RoomData_Sprites_Room0073
|09D716| dw RoomData_Sprites_Room0074
|09D718| dw RoomData_Sprites_Room0075
|09D71A| dw RoomData_Sprites_Room0076
|09D71C| dw RoomData_Sprites_Room0077
|09D71E| dw RoomData_Sprites_Empty
|09D720| dw RoomData_Sprites_Empty
|09D722| dw RoomData_Sprites_Empty
|09D724| dw RoomData_Sprites_Room007B
|09D726| dw RoomData_Sprites_Room007C
|09D728| dw RoomData_Sprites_Room007D
|09D72A| dw RoomData_Sprites_Room007E
|09D72C| dw RoomData_Sprites_Room007F
|09D72E| dw RoomData_Sprites_Room0080
|09D730| dw RoomData_Sprites_Room0081
|09D732| dw RoomData_Sprites_Room0082
|09D734| dw RoomData_Sprites_Room0083
|09D736| dw RoomData_Sprites_Room0084
|09D738| dw RoomData_Sprites_Room0085
|09D73A| dw RoomData_Sprites_Room0086
|09D73C| dw RoomData_Sprites_Room0087
|09D73E| dw RoomData_Sprites_Empty
|09D740| dw RoomData_Sprites_Room0089
|09D742| dw RoomData_Sprites_Empty
|09D744| dw RoomData_Sprites_Room008B
|09D746| dw RoomData_Sprites_Room008C
|09D748| dw RoomData_Sprites_Room008D
|09D74A| dw RoomData_Sprites_Room008E
|09D74C| dw RoomData_Sprites_Empty
|09D74E| dw RoomData_Sprites_Room0090
|09D750| dw RoomData_Sprites_Room0091
|09D752| dw RoomData_Sprites_Room0092
|09D754| dw RoomData_Sprites_Room0093
|09D756| dw RoomData_Sprites_Empty
|09D758| dw RoomData_Sprites_Room0095
|09D75A| dw RoomData_Sprites_Room0096
|09D75C| dw RoomData_Sprites_Room0097
|09D75E| dw RoomData_Sprites_Room0098
|09D760| dw RoomData_Sprites_Room0099
|09D762| dw RoomData_Sprites_Empty
|09D764| dw RoomData_Sprites_Room009B
|09D766| dw RoomData_Sprites_Room009C
|09D768| dw RoomData_Sprites_Room009D
|09D76A| dw RoomData_Sprites_Room009E
|09D76C| dw RoomData_Sprites_Room009F
|09D76E| dw RoomData_Sprites_Room00A0
|09D770| dw RoomData_Sprites_Room00A1
|09D772| dw RoomData_Sprites_Empty
|09D774| dw RoomData_Sprites_Room00A3
|09D776| dw RoomData_Sprites_Room00A4
|09D778| dw RoomData_Sprites_Room00A5
|09D77A| dw RoomData_Sprites_Room00A6
|09D77C| dw RoomData_Sprites_Room00A7
|09D77E| dw RoomData_Sprites_Room00A8
|09D780| dw RoomData_Sprites_Room00A9
|09D782| dw RoomData_Sprites_Room00AA
|09D784| dw RoomData_Sprites_Room00AB
|09D786| dw RoomData_Sprites_Room00AC
|09D788| dw RoomData_Sprites_Empty
|09D78A| dw RoomData_Sprites_Room00AE
|09D78C| dw RoomData_Sprites_Room00AF
|09D78E| dw RoomData_Sprites_Room00B0
|09D790| dw RoomData_Sprites_Room00B1
|09D792| dw RoomData_Sprites_Room00B2
|09D794| dw RoomData_Sprites_Room00B3
|09D796| dw RoomData_Sprites_Empty
|09D798| dw RoomData_Sprites_Room00B5
|09D79A| dw RoomData_Sprites_Room00B6
|09D79C| dw RoomData_Sprites_Room00B7
|09D79E| dw RoomData_Sprites_Room00B8
|09D7A0| dw RoomData_Sprites_Room00B9
|09D7A2| dw RoomData_Sprites_Room00BA
|09D7A4| dw RoomData_Sprites_Room00BB
|09D7A6| dw RoomData_Sprites_Room00BC
|09D7A8| dw RoomData_Sprites_Room00BD
|09D7AA| dw RoomData_Sprites_Room00BE
|09D7AC| dw RoomData_Sprites_Room00BF
|09D7AE| dw RoomData_Sprites_Room00C0
|09D7B0| dw RoomData_Sprites_Room00C1
|09D7B2| dw RoomData_Sprites_Room00C2
|09D7B4| dw RoomData_Sprites_Room00C3
|09D7B6| dw RoomData_Sprites_Room00C4
|09D7B8| dw RoomData_Sprites_Room00C5
|09D7BA| dw RoomData_Sprites_Room00C6
|09D7BC| dw RoomData_Sprites_Empty
|09D7BE| dw RoomData_Sprites_Room00C8
|09D7C0| dw RoomData_Sprites_Room00C9
|09D7C2| dw RoomData_Sprites_Empty
|09D7C4| dw RoomData_Sprites_Room00CB
|09D7C6| dw RoomData_Sprites_Room00CC
|09D7C8| dw RoomData_Sprites_Empty
|09D7CA| dw RoomData_Sprites_Room00CE
|09D7CC| dw RoomData_Sprites_Empty
|09D7CE| dw RoomData_Sprites_Room00D0
|09D7D0| dw RoomData_Sprites_Room00D1
|09D7D2| dw RoomData_Sprites_Room00D2
|09D7D4| dw RoomData_Sprites_Empty
|09D7D6| dw RoomData_Sprites_Empty
|09D7D8| dw RoomData_Sprites_Room00D5
|09D7DA| dw RoomData_Sprites_Room00D6
|09D7DC| dw RoomData_Sprites_Empty
|09D7DE| dw RoomData_Sprites_Room00D8
|09D7E0| dw RoomData_Sprites_Room00D9
|09D7E2| dw RoomData_Sprites_Room00DA
|09D7E4| dw RoomData_Sprites_Room00DB
|09D7E6| dw RoomData_Sprites_Room00DC
|09D7E8| dw RoomData_Sprites_Empty
|09D7EA| dw RoomData_Sprites_Room00DE
|09D7EC| dw RoomData_Sprites_Room00DF
|09D7EE| dw RoomData_Sprites_Room00E0
|09D7F0| dw RoomData_Sprites_Room00E1
|09D7F2| dw RoomData_Sprites_Room00E2
|09D7F4| dw RoomData_Sprites_Room00E3
|09D7F6| dw RoomData_Sprites_Room00E4
|09D7F8| dw RoomData_Sprites_Room00E5
|09D7FA| dw RoomData_Sprites_Room00E6
|09D7FC| dw RoomData_Sprites_Room00E7
|09D7FE| dw RoomData_Sprites_Room00E8
|09D800| dw RoomData_Sprites_Empty
|09D802| dw RoomData_Sprites_Room00EA
|09D804| dw RoomData_Sprites_Room00EB
|09D806| dw RoomData_Sprites_Empty
|09D808| dw RoomData_Sprites_Empty
|09D80A| dw RoomData_Sprites_Room00EE
|09D80C| dw RoomData_Sprites_Room00EF
|09D80E| dw RoomData_Sprites_Room00F0
|09D810| dw RoomData_Sprites_Room00F1
|09D812| dw RoomData_Sprites_Empty
|09D814| dw RoomData_Sprites_Room00F3
|09D816| dw RoomData_Sprites_Room00F4
|09D818| dw RoomData_Sprites_Room00F5
|09D81A| dw RoomData_Sprites_Empty
|09D81C| dw RoomData_Sprites_Empty
|09D81E| dw RoomData_Sprites_Empty
|09D820| dw RoomData_Sprites_Room00F9
|09D822| dw RoomData_Sprites_Room00FA
|09D824| dw RoomData_Sprites_Room00FB
|09D826| dw RoomData_Sprites_Room00FC
|09D828| dw RoomData_Sprites_Room00FD
|09D82A| dw RoomData_Sprites_Room00FE
|09D82C| dw RoomData_Sprites_Room00FF
|09D82E| dw RoomData_Sprites_Room0100
|09D830| dw RoomData_Sprites_Room0101
|09D832| dw RoomData_Sprites_Room0102
|09D834| dw RoomData_Sprites_Room0103
|09D836| dw RoomData_Sprites_Room0104
|09D838| dw RoomData_Sprites_Room0105
|09D83A| dw RoomData_Sprites_Room0106
|09D83C| dw RoomData_Sprites_Room0107
|09D83E| dw RoomData_Sprites_Room0108
|09D840| dw RoomData_Sprites_Room0109
|09D842| dw RoomData_Sprites_Room010A
|09D844| dw RoomData_Sprites_Room010B
|09D846| dw RoomData_Sprites_Room010C
|09D848| dw RoomData_Sprites_Room010D
|09D84A| dw RoomData_Sprites_Room010E
|09D84C| dw RoomData_Sprites_Room010F
|09D84E| dw RoomData_Sprites_Room0110
|09D850| dw RoomData_Sprites_Room0111
|09D852| dw RoomData_Sprites_Room0112
|09D854| dw RoomData_Sprites_Empty
|09D856| dw RoomData_Sprites_Room0114
|09D858| dw RoomData_Sprites_Room0115
|09D85A| dw RoomData_Sprites_Room0116
|09D85C| dw RoomData_Sprites_Empty
|09D85E| dw RoomData_Sprites_Room0118
|09D860| dw RoomData_Sprites_Room0119
|09D862| dw RoomData_Sprites_Room011A
|09D864| dw RoomData_Sprites_Room011B
|09D866| dw RoomData_Sprites_Room011C
|09D868| dw RoomData_Sprites_Empty
|09D86A| dw RoomData_Sprites_Room011E
|09D86C| dw RoomData_Sprites_Room011F
|09D86E| dw RoomData_Sprites_Room0120
|09D870| dw RoomData_Sprites_Room0121
|09D872| dw RoomData_Sprites_Room0122
|09D874| dw RoomData_Sprites_Room0123
|09D876| dw RoomData_Sprites_Room0124
|09D878| dw RoomData_Sprites_Room0125
|09D87A| dw RoomData_Sprites_Room0126
|09D87C| dw RoomData_Sprites_Room0127
|09D87E| dw RoomData_Sprites_Empty
|09D880| dw RoomData_Sprites_Empty
|09D882| dw RoomData_Sprites_Empty
|09D884| dw RoomData_Sprites_Empty
|09D886| dw RoomData_Sprites_Empty
|09D888| dw RoomData_Sprites_Empty
|09D88A| dw RoomData_Sprites_Empty
|09D88C| dw RoomData_Sprites_Empty
|09D88E| dw RoomData_Sprites_Empty
|09D890| dw RoomData_Sprites_Empty
|09D892| dw RoomData_Sprites_Empty
|09D894| dw RoomData_Sprites_Empty
|09D896| dw RoomData_Sprites_Empty
|09D898| dw RoomData_Sprites_Empty
|09D89A| dw RoomData_Sprites_Empty
|09D89C| dw RoomData_Sprites_Empty
|09D89E| dw RoomData_Sprites_Empty
|09D8A0| dw RoomData_Sprites_Empty
|09D8A2| dw RoomData_Sprites_Empty
|09D8A4| dw RoomData_Sprites_Empty
|09D8A6| dw RoomData_Sprites_Empty
|09D8A8| dw RoomData_Sprites_Empty
|09D8AA| dw RoomData_Sprites_Empty
|09D8AC| dw RoomData_Sprites_Empty
|09D8AE| dw RoomData_Sprites_Empty
|09D8B0| dw RoomData_Sprites_Empty
|09D8B2| dw RoomData_Sprites_Empty
|09D8B4| dw RoomData_Sprites_Empty
|09D8B6| dw RoomData_Sprites_Empty
|09D8B8| dw RoomData_Sprites_Empty
|09D8BA| dw RoomData_Sprites_Empty
|09D8BC| dw RoomData_Sprites_Empty
|09D8BE| dw RoomData_Sprites_Empty
|09D8C0| dw RoomData_Sprites_Empty
|09D8C2| dw RoomData_Sprites_Empty
|09D8C4| dw RoomData_Sprites_Empty
|09D8C6| dw RoomData_Sprites_Empty
|09D8C8| dw RoomData_Sprites_Empty
|09D8CA| dw RoomData_Sprites_Empty
|09D8CC| dw RoomData_Sprites_Empty
|09D8CE| dw RoomData_Sprites_Empty
|09D8D0| dw RoomData_Sprites_Empty
|09D8D2| dw RoomData_Sprites_Empty
|09D8D4| dw RoomData_Sprites_Empty
|09D8D6| dw RoomData_Sprites_Empty
|09D8D8| dw RoomData_Sprites_Empty
|09D8DA| dw RoomData_Sprites_Empty
|09D8DC| dw RoomData_Sprites_Empty
|09D8DE| dw RoomData_Sprites_Empty
|09D8E0| dw RoomData_Sprites_Empty
|09D8E2| dw RoomData_Sprites_Empty
|09D8E4| dw RoomData_Sprites_Empty
|09D8E6| dw RoomData_Sprites_Empty
|09D8E8| dw RoomData_Sprites_Empty
|09D8EA| dw RoomData_Sprites_Empty
|09D8EC| dw RoomData_Sprites_Empty
|09D8EE| dw RoomData_Sprites_Empty
|09D8F0| dw RoomData_Sprites_Empty
|09D8F2| dw RoomData_Sprites_Empty
|09D8F4| dw RoomData_Sprites_Empty
|09D8F6| dw RoomData_Sprites_Empty
|09D8F8| dw RoomData_Sprites_Empty
|09D8FA| dw RoomData_Sprites_Empty
|09D8FC| dw RoomData_Sprites_Empty
|09D8FE| dw RoomData_Sprites_Empty
|09D900| dw RoomData_Sprites_Empty
|09D902| dw RoomData_Sprites_Empty
|09D904| dw RoomData_Sprites_Empty
|09D906| dw RoomData_Sprites_Empty
|09D908| dw RoomData_Sprites_Empty
|09D90A| dw RoomData_Sprites_Empty
|09D90C| dw RoomData_Sprites_Empty
|09D90E| dw RoomData_Sprites_Empty
|09D910| dw RoomData_Sprites_Empty
|09D912| dw RoomData_Sprites_Empty
|09D914| dw RoomData_Sprites_Empty
|09D916| dw RoomData_Sprites_Empty
|09D918| dw RoomData_Sprites_Empty
|09D91A| dw RoomData_Sprites_Empty
|09D91C| dw RoomData_Sprites_Empty
|09D91E| dw RoomData_Sprites_Empty
|09D920| dw RoomData_Sprites_Empty
|09D922| dw RoomData_Sprites_Empty
|09D924| dw RoomData_Sprites_Empty
|09D926| dw RoomData_Sprites_Empty
|09D928| dw RoomData_Sprites_Empty
|09D92A| dw RoomData_Sprites_Empty
|09D92C| dw RoomData_Sprites_Empty

;===================================================================================================

RoomData_Sprites_Room0000:
|09D92E| db $00 ; Unlayered OAM
|09D92F| db $05, $17, $D6 ; SPRITE D6   | xy: { 0x170, 0x050, U } | s: 0x00
|09D932| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0002:
|09D933| db $00 ; Unlayered OAM
|09D934| db $85, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x050, L } | s: 0x00
|09D937| db $86, $15, $6D ; SPRITE 6D   | xy: { 0x150, 0x060, L } | s: 0x00
|09D93A| db $88, $0F, $6D ; SPRITE 6D   | xy: { 0x0F0, 0x080, L } | s: 0x00
|09D93D| db $88, $10, $6D ; SPRITE 6D   | xy: { 0x100, 0x080, L } | s: 0x00
|09D940| db $89, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x090, L } | s: 0x00
|09D943| db $97, $EF, $06 ; OVERLORD 06 | xy: { 0x0F0, 0x170, L }
|09D946| db $98, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x180, L }
|09D949| db $98, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x180, L }
|09D94C| db $99, $EA, $06 ; OVERLORD 06 | xy: { 0x0A0, 0x190, L }
|09D94F| db $99, $EC, $06 ; OVERLORD 06 | xy: { 0x0C0, 0x190, L }
|09D952| db $9A, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x1A0, L }
|09D955| db $9B, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x1B0, L }
|09D958| db $97, $0A, $06 ; SPRITE 06   | xy: { 0x0A0, 0x170, L } | s: 0x00
|09D95B| db $97, $15, $04 ; SPRITE 04   | xy: { 0x150, 0x170, L } | s: 0x00
|09D95E| db $9A, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x1A0, L } | s: 0x00
|09D961| db $9A, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x1A0, L } | s: 0x00
|09D964| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0004:
|09D965| db $00 ; Unlayered OAM
|09D966| db $04, $09, $1E ; SPRITE 1E   | xy: { 0x090, 0x040, U } | s: 0x00
|09D969| db $04, $14, $5D ; SPRITE 5D   | xy: { 0x140, 0x040, U } | s: 0x00
|09D96C| db $04, $1B, $60 ; SPRITE 60   | xy: { 0x1B0, 0x040, U } | s: 0x00
|09D96F| db $07, $05, $5F ; SPRITE 5F   | xy: { 0x050, 0x070, U } | s: 0x00
|09D972| db $09, $15, $5F ; SPRITE 5F   | xy: { 0x150, 0x090, U } | s: 0x00
|09D975| db $12, $E7, $16 ; OVERLORD 16 | xy: { 0x070, 0x120, U }
|09D978| db $15, $15, $04 ; SPRITE 04   | xy: { 0x150, 0x150, U } | s: 0x00
|09D97B| db $15, $1A, $06 ; SPRITE 06   | xy: { 0x1A0, 0x150, U } | s: 0x00
|09D97E| db $15, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x150, U }
|09D981| db $15, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x150, U } | s: 0x00
|09D984| db $17, $F6, $1A ; OVERLORD 1A | xy: { 0x160, 0x170, U }
|09D987| db $17, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x170, U }
|09D98A| db $18, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x180, U }
|09D98D| db $1A, $1A, $8F ; SPRITE 8F   | xy: { 0x1A0, 0x1A0, U } | s: 0x00
|09D990| db $1B, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x1B0, U } | s: 0x00
|09D993| db $18, $07, $C7 ; SPRITE C7   | xy: { 0x070, 0x180, U } | s: 0x00
|09D996| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0006:
|09D997| db $00 ; Unlayered OAM
|09D998| db $17, $07, $8C ; SPRITE 8C   | xy: { 0x070, 0x170, U } | s: 0x00
|09D99B| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D99E| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9A1| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9A4| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9A7| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9AA| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9AD| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9B0| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9B3| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9B6| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9B9| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9BC| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9BF| db $17, $07, $8D ; SPRITE 8D   | xy: { 0x070, 0x170, U } | s: 0x00
|09D9C2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0007:
|09D9C3| db $00 ; Unlayered OAM
|09D9C4| db $0E, $12, $09 ; SPRITE 09   | xy: { 0x120, 0x0E0, U } | s: 0x00
|09D9C7| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0008:
|09D9C8| db $00 ; Unlayered OAM
|09D9C9| db $16, $07, $C8 ; SPRITE C8   | xy: { 0x070, 0x160, U } | s: 0x00
|09D9CC| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0009:
|09D9CD| db $00 ; Unlayered OAM
|09D9CE| db $08, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x080, U } | s: 0x00
|09D9D1| db $08, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x080, U } | s: 0x00
|09D9D4| db $0B, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x0B0, U } | s: 0x00
|09D9D7| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000A:
|09D9D8| db $00 ; Unlayered OAM
|09D9D9| db $08, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x080, U } | s: 0x00
|09D9DC| db $09, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x090, U } | s: 0x00
|09D9DF| db $09, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x090, U }
|09D9E2| db $09, $F1, $05 ; OVERLORD 05 | xy: { 0x110, 0x090, U }
|09D9E5| db $0B, $F3, $17 ; OVERLORD 17 | xy: { 0x130, 0x0B0, U }
|09D9E8| db $0E, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x0E0, U }
|09D9EB| db $0E, $F1, $05 ; OVERLORD 05 | xy: { 0x110, 0x0E0, U }
|09D9EE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000B:
|09D9EF| db $00 ; Unlayered OAM
|09D9F0| db $04, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x040, U } | s: 0x00
|09D9F3| db $08, $07, $8E ; SPRITE 8E   | xy: { 0x070, 0x080, U } | s: 0x00
|09D9F6| db $0B, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x0B0, U } | s: 0x00
|09D9F9| db $0B, $1B, $8E ; SPRITE 8E   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09D9FC| db $16, $05, $8E ; SPRITE 8E   | xy: { 0x050, 0x160, U } | s: 0x00
|09D9FF| db $16, $0A, $8E ; SPRITE 8E   | xy: { 0x0A0, 0x160, U } | s: 0x00
|09DA02| db $19, $07, $8E ; SPRITE 8E   | xy: { 0x070, 0x190, U } | s: 0x00
|09DA05| db $19, $08, $8E ; SPRITE 8E   | xy: { 0x080, 0x190, U } | s: 0x00
|09DA08| db $1B, $06, $8E ; SPRITE 8E   | xy: { 0x060, 0x1B0, U } | s: 0x00
|09DA0B| db $1B, $09, $8E ; SPRITE 8E   | xy: { 0x090, 0x1B0, U } | s: 0x00
|09DA0E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000D:
|09DA0F| db $00 ; Unlayered OAM
|09DA10| db $15, $07, $7A ; SPRITE 7A   | xy: { 0x070, 0x150, U } | s: 0x00
|09DA13| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room000E:
|09DA14| db $00 ; Unlayered OAM
|09DA15| db $12, $16, $A1 ; SPRITE A1   | xy: { 0x160, 0x120, U } | s: 0x00
|09DA18| db $16, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x160, U } | s: 0x00
|09DA1B| db $18, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x180, U } | s: 0x00
|09DA1E| db $1A, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x1A0, U } | s: 0x00
|09DA21| db $FE, $00, $E4 ; small key on above sprite
|09DA24| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0011:
|09DA25| db $00 ; Unlayered OAM
|09DA26| db $0A, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x0A0, U } | s: 0x00
|09DA29| db $0A, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09DA2C| db $0C, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x0C0, U } | s: 0x00
|09DA2F| db $0C, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x0C0, U } | s: 0x00
|09DA32| db $11, $1C, $6D ; SPRITE 6D   | xy: { 0x1C0, 0x110, U } | s: 0x00
|09DA35| db $12, $1C, $6D ; SPRITE 6D   | xy: { 0x1C0, 0x120, U } | s: 0x00
|09DA38| db $16, $1A, $6D ; SPRITE 6D   | xy: { 0x1A0, 0x160, U } | s: 0x00
|09DA3B| db $16, $1B, $6D ; SPRITE 6D   | xy: { 0x1B0, 0x160, U } | s: 0x00
|09DA3E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0012:
|09DA3F| db $00 ; Unlayered OAM
|09DA40| db $07, $0F, $73 ; SPRITE 73   | xy: { 0x0F0, 0x070, U } | s: 0x00
|09DA43| db $06, $10, $76 ; SPRITE 76   | xy: { 0x100, 0x060, U } | s: 0x00
|09DA46| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0013:
|09DA47| db $00 ; Unlayered OAM
|09DA48| db $11, $14, $1E ; SPRITE 1E   | xy: { 0x140, 0x110, U } | s: 0x00
|09DA4B| db $04, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x040, U } | s: 0x00
|09DA4E| db $04, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x040, U } | s: 0x00
|09DA51| db $05, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x050, U } | s: 0x00
|09DA54| db $05, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x050, U } | s: 0x00
|09DA57| db $16, $1B, $7C ; SPRITE 7C   | xy: { 0x1B0, 0x160, U } | s: 0x00
|09DA5A| db $18, $16, $C7 ; SPRITE C7   | xy: { 0x160, 0x180, U } | s: 0x00
|09DA5D| db $FE, $00, $E4 ; small key on above sprite
|09DA60| db $18, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x180, U } | s: 0x00
|09DA63| db $1A, $14, $7C ; SPRITE 7C   | xy: { 0x140, 0x1A0, U } | s: 0x00
|09DA66| db $1B, $1B, $D1 ; SPRITE D1   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
|09DA69| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0014:
|09DA6A| db $01 ; Layered OAM
|09DA6B| db $84, $0C, $B0 ; SPRITE B0   | xy: { 0x0C0, 0x040, L } | s: 0x00
|09DA6E| db $8A, $0F, $AF ; SPRITE AF   | xy: { 0x0F0, 0x0A0, L } | s: 0x00
|09DA71| db $8A, $19, $AE ; SPRITE AE   | xy: { 0x190, 0x0A0, L } | s: 0x00
|09DA74| db $8D, $03, $AE ; SPRITE AE   | xy: { 0x030, 0x0D0, L } | s: 0x00
|09DA77| db $8D, $1B, $AE ; SPRITE AE   | xy: { 0x1B0, 0x0D0, L } | s: 0x00
|09DA7A| db $93, $0F, $AE ; SPRITE AE   | xy: { 0x0F0, 0x130, L } | s: 0x00
|09DA7D| db $98, $08, $B0 ; SPRITE B0   | xy: { 0x080, 0x180, L } | s: 0x00
|09DA80| db $98, $17, $B1 ; SPRITE B1   | xy: { 0x170, 0x180, L } | s: 0x00
|09DA83| db $9B, $0C, $B0 ; SPRITE B0   | xy: { 0x0C0, 0x1B0, L } | s: 0x00
|09DA86| db $9B, $13, $B1 ; SPRITE B1   | xy: { 0x130, 0x1B0, L } | s: 0x00
|09DA89| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0015:
|09DA8A| db $01 ; Layered OAM
|09DA8B| db $8C, $04, $AE ; SPRITE AE   | xy: { 0x040, 0x0C0, L } | s: 0x00
|09DA8E| db $91, $11, $AE ; SPRITE AE   | xy: { 0x110, 0x110, L } | s: 0x00
|09DA91| db $97, $04, $AF ; SPRITE AF   | xy: { 0x040, 0x170, L } | s: 0x00
|09DA94| db $9B, $16, $B1 ; SPRITE B1   | xy: { 0x160, 0x1B0, L } | s: 0x00
|09DA97| db $89, $0A, $8F ; SPRITE 8F   | xy: { 0x0A0, 0x090, L } | s: 0x00
|09DA9A| db $89, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x090, L } | s: 0x00
|09DA9D| db $8A, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x0A0, L } | s: 0x00
|09DAA0| db $96, $18, $C7 ; SPRITE C7   | xy: { 0x180, 0x160, L } | s: 0x00
|09DAA3| db $97, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x170, L } | s: 0x00
|09DAA6| db $97, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x170, L } | s: 0x00
|09DAA9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0016:
|09DAAA| db $00 ; Unlayered OAM
|09DAAB| db $07, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x070, U } | s: 0x00
|09DAAE| db $08, $15, $8F ; SPRITE 8F   | xy: { 0x150, 0x080, U } | s: 0x00
|09DAB1| db $09, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x090, U } | s: 0x00
|09DAB4| db $0A, $10, $8F ; SPRITE 8F   | xy: { 0x100, 0x0A0, U } | s: 0x00
|09DAB7| db $98, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x180, L } | s: 0x00
|09DABA| db $9B, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x1B0, L } | s: 0x00
|09DABD| db $9B, $14, $81 ; SPRITE 81   | xy: { 0x140, 0x1B0, L } | s: 0x00
|09DAC0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0017:
|09DAC1| db $00 ; Unlayered OAM
|09DAC2| db $0B, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x0B0, U } | s: 0x00
|09DAC5| db $0E, $10, $93 ; SPRITE 93   | xy: { 0x100, 0x0E0, U } | s: 0x00
|09DAC8| db $16, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x160, U } | s: 0x00
|09DACB| db $07, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x070, U } | s: 0x00
|09DACE| db $09, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x090, U } | s: 0x00
|09DAD1| db $11, $06, $7E ; SPRITE 7E   | xy: { 0x060, 0x110, U } | s: 0x00
|09DAD4| db $11, $12, $26 ; SPRITE 26   | xy: { 0x120, 0x110, U } | s: 0x00
|09DAD7| db $17, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x170, U } | s: 0x00
|09DADA| db $17, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x170, U } | s: 0x00
|09DADD| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0019:
|09DADE| db $00 ; Unlayered OAM
|09DADF| db $0A, $16, $86 ; SPRITE 86   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09DAE2| db $0E, $1A, $86 ; SPRITE 86   | xy: { 0x1A0, 0x0E0, U } | s: 0x00
|09DAE5| db $10, $16, $86 ; SPRITE 86   | xy: { 0x160, 0x100, U } | s: 0x00
|09DAE8| db $16, $18, $86 ; SPRITE 86   | xy: { 0x180, 0x160, U } | s: 0x00
|09DAEB| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001A:
|09DAEC| db $00 ; Unlayered OAM
|09DAED| db $06, $08, $13 ; SPRITE 13   | xy: { 0x080, 0x060, U } | s: 0x00
|09DAF0| db $06, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x060, U } | s: 0x00
|09DAF3| db $06, $19, $8E ; SPRITE 8E   | xy: { 0x190, 0x060, U } | s: 0x00
|09DAF6| db $0A, $16, $8E ; SPRITE 8E   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09DAF9| db $0A, $19, $8E ; SPRITE 8E   | xy: { 0x190, 0x0A0, U } | s: 0x00
|09DAFC| db $10, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x100, U } | s: 0x00
|09DAFF| db $15, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x150, U } | s: 0x00
|09DB02| db $17, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x170, U } | s: 0x00
|09DB05| db $19, $15, $1C ; SPRITE 1C   | xy: { 0x150, 0x190, U } | s: 0x00
|09DB08| db $19, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x190, U } | s: 0x00
|09DB0B| db $1A, $E7, $0B ; OVERLORD 0B | xy: { 0x070, 0x1A0, U }
|09DB0E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001B:
|09DB0F| db $00 ; Unlayered OAM
|09DB10| db $04, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x040, U } | s: 0x00
|09DB13| db $04, $10, $38 ; SPRITE 38   | xy: { 0x100, 0x040, U } | s: 0x00
|09DB16| db $0C, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x0C0, U } | s: 0x00
|09DB19| db $14, $07, $84 ; SPRITE 84   | xy: { 0x070, 0x140, U } | s: 0x00
|09DB1C| db $1C, $03, $83 ; SPRITE 83   | xy: { 0x030, 0x1C0, U } | s: 0x00
|09DB1F| db $1C, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x1C0, U } | s: 0x00
|09DB22| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001C:
|09DB23| db $00 ; Unlayered OAM
|09DB24| db $15, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x150, U } | s: 0x00
|09DB27| db $15, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x150, U } | s: 0x00
|09DB2A| db $15, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x150, U } | s: 0x00
|09DB2D| db $18, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x180, U } | s: 0x00
|09DB30| db $18, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x180, U } | s: 0x00
|09DB33| db $18, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x180, U } | s: 0x00
|09DB36| db $18, $F7, $19 ; OVERLORD 19 | xy: { 0x170, 0x180, U }
|09DB39| db $07, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x070, U } | s: 0x00
|09DB3C| db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
|09DB3F| db $08, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x080, U } | s: 0x00
|09DB42| db $08, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x080, U } | s: 0x00
|09DB45| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001E:
|09DB46| db $00 ; Unlayered OAM
|09DB47| db $09, $1A, $1E ; SPRITE 1E   | xy: { 0x1A0, 0x090, U } | s: 0x00
|09DB4A| db $05, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x050, U } | s: 0x00
|09DB4D| db $05, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x050, U } | s: 0x00
|09DB50| db $0A, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09DB53| db $0A, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x0A0, U } | s: 0x00
|09DB56| db $18, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x180, U } | s: 0x00
|09DB59| db $1C, $05, $8F ; SPRITE 8F   | xy: { 0x050, 0x1C0, U } | s: 0x00
|09DB5C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room001F:
|09DB5D| db $00 ; Unlayered OAM
|09DB5E| db $15, $04, $99 ; SPRITE 99   | xy: { 0x040, 0x150, U } | s: 0x00
|09DB61| db $15, $09, $99 ; SPRITE 99   | xy: { 0x090, 0x150, U } | s: 0x00
|09DB64| db $16, $06, $15 ; SPRITE 15   | xy: { 0x060, 0x160, U } | s: 0x00
|09DB67| db $17, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x170, U } | s: 0x00
|09DB6A| db $17, $0A, $99 ; SPRITE 99   | xy: { 0x0A0, 0x170, U } | s: 0x00
|09DB6D| db $19, $0A, $99 ; SPRITE 99   | xy: { 0x0A0, 0x190, U } | s: 0x00
|09DB70| db $1B, $04, $99 ; SPRITE 99   | xy: { 0x040, 0x1B0, U } | s: 0x00
|09DB73| db $1B, $09, $99 ; SPRITE 99   | xy: { 0x090, 0x1B0, U } | s: 0x00
|09DB76| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0020:
|09DB77| db $00 ; Unlayered OAM
|09DB78| db $15, $07, $7A ; SPRITE 7A   | xy: { 0x070, 0x150, U } | s: 0x00
|09DB7B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0021:
|09DB7C| db $00 ; Unlayered OAM
|09DB7D| db $06, $05, $6D ; SPRITE 6D   | xy: { 0x050, 0x060, U } | s: 0x00
|09DB80| db $FE, $00, $E4 ; small key on above sprite
|09DB83| db $06, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x060, U } | s: 0x00
|09DB86| db $06, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x060, U } | s: 0x00
|09DB89| db $09, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x090, U } | s: 0x00
|09DB8C| db $0A, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x0A0, U } | s: 0x00
|09DB8F| db $14, $07, $6D ; SPRITE 6D   | xy: { 0x070, 0x140, U } | s: 0x00
|09DB92| db $14, $0D, $6F ; SPRITE 6F   | xy: { 0x0D0, 0x140, U } | s: 0x00
|09DB95| db $14, $12, $6F ; SPRITE 6F   | xy: { 0x120, 0x140, U } | s: 0x00
|09DB98| db $18, $0D, $6D ; SPRITE 6D   | xy: { 0x0D0, 0x180, U } | s: 0x00
|09DB9B| db $1C, $0A, $6D ; SPRITE 6D   | xy: { 0x0A0, 0x1C0, U } | s: 0x00
|09DB9E| db $1C, $13, $6D ; SPRITE 6D   | xy: { 0x130, 0x1C0, U } | s: 0x00
|09DBA1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0022:
|09DBA2| db $00 ; Unlayered OAM
|09DBA3| db $14, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x140, U } | s: 0x00
|09DBA6| db $14, $08, $6D ; SPRITE 6D   | xy: { 0x080, 0x140, U } | s: 0x00
|09DBA9| db $14, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x140, U } | s: 0x00
|09DBAC| db $14, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x140, U } | s: 0x00
|09DBAF| db $15, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x150, U } | s: 0x00
|09DBB2| db $15, $12, $6D ; SPRITE 6D   | xy: { 0x120, 0x150, U } | s: 0x00
|09DBB5| db $18, $09, $6D ; SPRITE 6D   | xy: { 0x090, 0x180, U } | s: 0x00
|09DBB8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0023:
|09DBB9| db $00 ; Unlayered OAM
|09DBBA| db $14, $15, $97 ; SPRITE 97   | xy: { 0x150, 0x140, U } | s: 0x00
|09DBBD| db $14, $16, $97 ; SPRITE 97   | xy: { 0x160, 0x140, U } | s: 0x00
|09DBC0| db $14, $17, $97 ; SPRITE 97   | xy: { 0x170, 0x140, U } | s: 0x00
|09DBC3| db $14, $18, $97 ; SPRITE 97   | xy: { 0x180, 0x140, U } | s: 0x00
|09DBC6| db $14, $19, $97 ; SPRITE 97   | xy: { 0x190, 0x140, U } | s: 0x00
|09DBC9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0024:
|09DBCA| db $00 ; Unlayered OAM
|09DBCB| db $04, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x040, U } | s: 0x00
|09DBCE| db $04, $1C, $C5 ; SPRITE C5   | xy: { 0x1C0, 0x040, U } | s: 0x00
|09DBD1| db $06, $1B, $60 ; SPRITE 60   | xy: { 0x1B0, 0x060, U } | s: 0x00
|09DBD4| db $08, $05, $C7 ; SPRITE C7   | xy: { 0x050, 0x080, U } | s: 0x00
|09DBD7| db $08, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x080, U } | s: 0x00
|09DBDA| db $08, $0A, $C7 ; SPRITE C7   | xy: { 0x0A0, 0x080, U } | s: 0x00
|09DBDD| db $0C, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09DBE0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0025:
|09DBE1| db $00 ; Unlayered OAM
|09DBE2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0026:
|09DBE3| db $00 ; Unlayered OAM
|09DBE4| db $04, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x040, U } | s: 0x00
|09DBE7| db $05, $1A, $23 ; SPRITE 23   | xy: { 0x1A0, 0x050, U } | s: 0x00
|09DBEA| db $06, $05, $23 ; SPRITE 23   | xy: { 0x050, 0x060, U } | s: 0x00
|09DBED| db $06, $09, $A7 ; SPRITE A7   | xy: { 0x090, 0x060, U } | s: 0x00
|09DBF0| db $09, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x090, U } | s: 0x00
|09DBF3| db $0C, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09DBF6| db $17, $06, $1C ; SPRITE 1C   | xy: { 0x060, 0x170, U } | s: 0x00
|09DBF9| db $17, $19, $C6 ; SPRITE C6   | xy: { 0x190, 0x170, U } | s: 0x00
|09DBFC| db $18, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x180, U } | s: 0x00
|09DBFF| db $18, $15, $9A ; SPRITE 9A   | xy: { 0x150, 0x180, U } | s: 0x00
|09DC02| db $19, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x190, U } | s: 0x00
|09DC05| db $1A, $1C, $80 ; SPRITE 80   | xy: { 0x1C0, 0x1A0, U } | s: 0x00
|09DC08| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0027:
|09DC09| db $00 ; Unlayered OAM
|09DC0A| db $09, $17, $18 ; SPRITE 18   | xy: { 0x170, 0x090, U } | s: 0x00
|09DC0D| db $13, $18, $18 ; SPRITE 18   | xy: { 0x180, 0x130, U } | s: 0x00
|09DC10| db $13, $1B, $18 ; SPRITE 18   | xy: { 0x1B0, 0x130, U } | s: 0x00
|09DC13| db $1A, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
|09DC16| db $06, $0F, $5B ; SPRITE 5B   | xy: { 0x0F0, 0x060, U } | s: 0x00
|09DC19| db $0E, $05, $86 ; SPRITE 86   | xy: { 0x050, 0x0E0, U } | s: 0x00
|09DC1C| db $16, $04, $86 ; SPRITE 86   | xy: { 0x040, 0x160, U } | s: 0x00
|09DC1F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0028:
|09DC20| db $00 ; Unlayered OAM
|09DC21| db $06, $0A, $9A ; SPRITE 9A   | xy: { 0x0A0, 0x060, U } | s: 0x00
|09DC24| db $08, $08, $81 ; SPRITE 81   | xy: { 0x080, 0x080, U } | s: 0x00
|09DC27| db $0A, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
|09DC2A| db $0D, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0D0, U } | s: 0x00
|09DC2D| db $10, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x100, U } | s: 0x00
|09DC30| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0029:
|09DC31| db $00 ; Unlayered OAM
|09DC32| db $16, $18, $88 ; SPRITE 88   | xy: { 0x180, 0x160, U } | s: 0x00
|09DC35| db $16, $E7, $07 ; OVERLORD 07 | xy: { 0x070, 0x160, U }
|09DC38| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002A:
|09DC39| db $00 ; Unlayered OAM
|09DC3A| db $17, $10, $1E ; SPRITE 1E   | xy: { 0x100, 0x170, U } | s: 0x00
|09DC3D| db $0F, $0F, $93 ; SPRITE 93   | xy: { 0x0F0, 0x0F0, U } | s: 0x00
|09DC40| db $08, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x080, U } | s: 0x00
|09DC43| db $0C, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x0C0, U } | s: 0x00
|09DC46| db $0C, $10, $26 ; SPRITE 26   | xy: { 0x100, 0x0C0, U } | s: 0x00
|09DC49| db $0F, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x0F0, U } | s: 0x00
|09DC4C| db $11, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x110, U } | s: 0x00
|09DC4F| db $13, $0F, $26 ; SPRITE 26   | xy: { 0x0F0, 0x130, U } | s: 0x00
|09DC52| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002B:
|09DC53| db $00 ; Unlayered OAM
|09DC54| db $11, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x110, U } | s: 0x00
|09DC57| db $0A, $0A, $1C ; SPRITE 1C   | xy: { 0x0A0, 0x0A0, U } | s: 0x00
|09DC5A| db $17, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x170, U } | s: 0x00
|09DC5D| db $17, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x170, U } | s: 0x00
|09DC60| db $18, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x180, U } | s: 0x00
|09DC63| db $1A, $05, $23 ; SPRITE 23   | xy: { 0x050, 0x1A0, U } | s: 0x00
|09DC66| db $1A, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
|09DC69| db $1A, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09DC6C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002C:
|09DC6D| db $00 ; Unlayered OAM
|09DC6E| db $05, $17, $C8 ; SPRITE C8   | xy: { 0x170, 0x050, U } | s: 0x00
|09DC71| db $04, $09, $E3 ; SPRITE E3   | xy: { 0x090, 0x040, U } | s: 0x00
|09DC74| db $05, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x050, U } | s: 0x00
|09DC77| db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
|09DC7A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room002E:
|09DC7B| db $00 ; Unlayered OAM
|09DC7C| db $06, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x060, U } | s: 0x00
|09DC7F| db $06, $1C, $99 ; SPRITE 99   | xy: { 0x1C0, 0x060, U } | s: 0x00
|09DC82| db $08, $16, $99 ; SPRITE 99   | xy: { 0x160, 0x080, U } | s: 0x00
|09DC85| db $08, $19, $99 ; SPRITE 99   | xy: { 0x190, 0x080, U } | s: 0x00
|09DC88| db $0B, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x0B0, U } | s: 0x00
|09DC8B| db $0B, $1B, $99 ; SPRITE 99   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09DC8E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0030:
|09DC8F| db $00 ; Unlayered OAM
|09DC90| db $05, $07, $C1 ; SPRITE C1   | xy: { 0x070, 0x050, U } | s: 0x00
|09DC93| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0031:
|09DC94| db $00 ; Unlayered OAM
|09DC95| db $1A, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x1A0, U } | s: 0x00
|09DC98| db $0B, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x0B0, U } | s: 0x00
|09DC9B| db $05, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x050, U } | s: 0x00
|09DC9E| db $06, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x060, U } | s: 0x00
|09DCA1| db $09, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x090, U } | s: 0x00
|09DCA4| db $0C, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
|09DCA7| db $15, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x150, U } | s: 0x00
|09DCAA| db $15, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x150, U } | s: 0x00
|09DCAD| db $16, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x160, U } | s: 0x00
|09DCB0| db $18, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x180, U } | s: 0x00
|09DCB3| db $19, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x190, U } | s: 0x00
|09DCB6| db $1C, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x1C0, U } | s: 0x00
|09DCB9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0032:
|09DCBA| db $00 ; Unlayered OAM
|09DCBB| db $0D, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0D0, U } | s: 0x00
|09DCBE| db $0D, $0F, $6E ; SPRITE 6E   | xy: { 0x0F0, 0x0D0, U } | s: 0x00
|09DCC1| db $0D, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x0D0, U } | s: 0x00
|09DCC4| db $0E, $10, $6E ; SPRITE 6E   | xy: { 0x100, 0x0E0, U } | s: 0x00
|09DCC7| db $0F, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x0F0, U } | s: 0x00
|09DCCA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0033:
|09DCCB| db $00 ; Unlayered OAM
|09DCCC| db $17, $06, $54 ; SPRITE 54   | xy: { 0x060, 0x170, U } | s: 0x00
|09DCCF| db $17, $09, $54 ; SPRITE 54   | xy: { 0x090, 0x170, U } | s: 0x00
|09DCD2| db $19, $07, $54 ; SPRITE 54   | xy: { 0x070, 0x190, U } | s: 0x00
|09DCD5| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0034:
|09DCD6| db $00 ; Unlayered OAM
|09DCD7| db $0B, $0F, $81 ; SPRITE 81   | xy: { 0x0F0, 0x0B0, U } | s: 0x00
|09DCDA| db $12, $10, $81 ; SPRITE 81   | xy: { 0x100, 0x120, U } | s: 0x00
|09DCDD| db $15, $0F, $9A ; SPRITE 9A   | xy: { 0x0F0, 0x150, U } | s: 0x00
|09DCE0| db $17, $19, $80 ; SPRITE 80   | xy: { 0x190, 0x170, U } | s: 0x00
|09DCE3| db $18, $03, $8F ; SPRITE 8F   | xy: { 0x030, 0x180, U } | s: 0x00
|09DCE6| db $18, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x180, U } | s: 0x00
|09DCE9| db $1A, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x1A0, U } | s: 0x00
|09DCEC| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0035:
|09DCED| db $00 ; Unlayered OAM
|09DCEE| db $06, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x060, U } | s: 0x00
|09DCF1| db $05, $14, $21 ; SPRITE 21   | xy: { 0x140, 0x050, U } | s: 0x00
|09DCF4| db $05, $18, $23 ; SPRITE 23   | xy: { 0x180, 0x050, U } | s: 0x00
|09DCF7| db $09, $13, $8A ; SPRITE 8A   | xy: { 0x130, 0x090, U } | s: 0x00
|09DCFA| db $0B, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x0B0, U } | s: 0x00
|09DCFD| db $14, $07, $8F ; SPRITE 8F   | xy: { 0x070, 0x140, U } | s: 0x00
|09DD00| db $18, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x180, U } | s: 0x00
|09DD03| db $19, $16, $80 ; SPRITE 80   | xy: { 0x160, 0x190, U } | s: 0x00
|09DD06| db $1A, $17, $C6 ; SPRITE C6   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09DD09| db $1B, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09DD0C| db $1C, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
|09DD0F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0036:
|09DD10| db $00 ; Unlayered OAM
|09DD11| db $02, $F7, $12 ; OVERLORD 12 | xy: { 0x170, 0x020, U }
|09DD14| db $0A, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
|09DD17| db $0A, $14, $81 ; SPRITE 81   | xy: { 0x140, 0x0A0, U } | s: 0x00
|09DD1A| db $0B, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x0B0, U } | s: 0x00
|09DD1D| db $0D, $E1, $10 ; OVERLORD 10 | xy: { 0x010, 0x0D0, U }
|09DD20| db $13, $14, $9A ; SPRITE 9A   | xy: { 0x140, 0x130, U } | s: 0x00
|09DD23| db $13, $FE, $11 ; OVERLORD 11 | xy: { 0x1E0, 0x130, U }
|09DD26| db $14, $09, $81 ; SPRITE 81   | xy: { 0x090, 0x140, U } | s: 0x00
|09DD29| db $17, $12, $81 ; SPRITE 81   | xy: { 0x120, 0x170, U } | s: 0x00
|09DD2C| db $1E, $EA, $13 ; OVERLORD 13 | xy: { 0x0A0, 0x1E0, U }
|09DD2F| db $1E, $F4, $13 ; OVERLORD 13 | xy: { 0x140, 0x1E0, U }
|09DD32| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0037:
|09DD33| db $00 ; Unlayered OAM
|09DD34| db $04, $0B, $21 ; SPRITE 21   | xy: { 0x0B0, 0x040, U } | s: 0x00
|09DD37| db $06, $05, $A7 ; SPRITE A7   | xy: { 0x050, 0x060, U } | s: 0x00
|09DD3A| db $08, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x080, U } | s: 0x00
|09DD3D| db $08, $1A, $8F ; SPRITE 8F   | xy: { 0x1A0, 0x080, U } | s: 0x00
|09DD40| db $09, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x090, U } | s: 0x00
|09DD43| db $14, $15, $80 ; SPRITE 80   | xy: { 0x150, 0x140, U } | s: 0x00
|09DD46| db $17, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x170, U } | s: 0x00
|09DD49| db $19, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x190, U } | s: 0x00
|09DD4C| db $1A, $17, $C6 ; SPRITE C6   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09DD4F| db $1C, $15, $23 ; SPRITE 23   | xy: { 0x150, 0x1C0, U } | s: 0x00
|09DD52| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0038:
|09DD53| db $00 ; Unlayered OAM
|09DD54| db $06, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x060, U } | s: 0x00
|09DD57| db $0A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0A0, U } | s: 0x00
|09DD5A| db $0C, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09DD5D| db $10, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x100, U } | s: 0x00
|09DD60| db $14, $06, $9A ; SPRITE 9A   | xy: { 0x060, 0x140, U } | s: 0x00
|09DD63| db $18, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x180, U } | s: 0x00
|09DD66| db $1A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x1A0, U } | s: 0x00
|09DD69| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0039:
|09DD6A| db $00 ; Unlayered OAM
|09DD6B| db $18, $04, $18 ; SPRITE 18   | xy: { 0x040, 0x180, U } | s: 0x00
|09DD6E| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09DD71| db $15, $05, $8B ; SPRITE 8B   | xy: { 0x050, 0x150, U } | s: 0x00
|09DD74| db $FE, $00, $E4 ; small key on above sprite
|09DD77| db $15, $09, $13 ; SPRITE 13   | xy: { 0x090, 0x150, U } | s: 0x00
|09DD7A| db $16, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x160, U } | s: 0x00
|09DD7D| db $18, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09DD80| db $1A, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09DD83| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003A:
|09DD84| db $00 ; Unlayered OAM
|09DD85| db $11, $0E, $8E ; SPRITE 8E   | xy: { 0x0E0, 0x110, U } | s: 0x00
|09DD88| db $11, $11, $8E ; SPRITE 8E   | xy: { 0x110, 0x110, U } | s: 0x00
|09DD8B| db $14, $04, $C5 ; SPRITE C5   | xy: { 0x040, 0x140, U } | s: 0x00
|09DD8E| db $14, $0A, $24 ; SPRITE 24   | xy: { 0x0A0, 0x140, U } | s: 0x00
|09DD91| db $14, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x140, U } | s: 0x00
|09DD94| db $14, $1B, $C5 ; SPRITE C5   | xy: { 0x1B0, 0x140, U } | s: 0x00
|09DD97| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003B:
|09DD98| db $00 ; Unlayered OAM
|09DD99| db $06, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x060, U } | s: 0x00
|09DD9C| db $09, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x090, U } | s: 0x00
|09DD9F| db $0D, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x0D0, U } | s: 0x00
|09DDA2| db $0F, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x0F0, U } | s: 0x00
|09DDA5| db $13, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x130, U } | s: 0x00
|09DDA8| db $16, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x160, U } | s: 0x00
|09DDAB| db $1A, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
|09DDAE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003C:
|09DDAF| db $00 ; Unlayered OAM
|09DDB0| db $08, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x080, U } | s: 0x00
|09DDB3| db $14, $0A, $24 ; SPRITE 24   | xy: { 0x0A0, 0x140, U } | s: 0x00
|09DDB6| db $14, $12, $24 ; SPRITE 24   | xy: { 0x120, 0x140, U } | s: 0x00
|09DDB9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003D:
|09DDBA| db $00 ; Unlayered OAM
|09DDBB| db $17, $05, $1E ; SPRITE 1E   | xy: { 0x050, 0x170, U } | s: 0x00
|09DDBE| db $19, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x190, U } | s: 0x00
|09DDC1| db $07, $17, $13 ; SPRITE 13   | xy: { 0x170, 0x070, U } | s: 0x00
|09DDC4| db $FE, $00, $E4 ; small key on above sprite
|09DDC7| db $07, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x070, U } | s: 0x00
|09DDCA| db $08, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x080, U } | s: 0x00
|09DDCD| db $08, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x080, U } | s: 0x00
|09DDD0| db $0A, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x0A0, U } | s: 0x00
|09DDD3| db $0B, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x0B0, U } | s: 0x00
|09DDD6| db $15, $FB, $0A ; OVERLORD 0A | xy: { 0x1B0, 0x150, U }
|09DDD9| db $16, $13, $5C ; SPRITE 5C   | xy: { 0x130, 0x160, U } | s: 0x00
|09DDDC| db $16, $1C, $5B ; SPRITE 5B   | xy: { 0x1C0, 0x160, U } | s: 0x00
|09DDDF| db $16, $09, $5B ; SPRITE 5B   | xy: { 0x090, 0x160, U } | s: 0x00
|09DDE2| db $17, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x170, U } | s: 0x00
|09DDE5| db $17, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x170, U } | s: 0x00
|09DDE8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003E:
|09DDE9| db $00 ; Unlayered OAM
|09DDEA| db $15, $06, $1E ; SPRITE 1E   | xy: { 0x060, 0x150, U } | s: 0x00
|09DDED| db $04, $19, $91 ; SPRITE 91   | xy: { 0x190, 0x040, U } | s: 0x00
|09DDF0| db $0B, $16, $91 ; SPRITE 91   | xy: { 0x160, 0x0B0, U } | s: 0x00
|09DDF3| db $12, $05, $9D ; SPRITE 9D   | xy: { 0x050, 0x120, U } | s: 0x00
|09DDF6| db $12, $0E, $9D ; SPRITE 9D   | xy: { 0x0E0, 0x120, U } | s: 0x00
|09DDF9| db $12, $F0, $07 ; OVERLORD 07 | xy: { 0x100, 0x120, U }
|09DDFC| db $12, $12, $9D ; SPRITE 9D   | xy: { 0x120, 0x120, U } | s: 0x00
|09DDFF| db $12, $15, $9D ; SPRITE 9D   | xy: { 0x150, 0x120, U } | s: 0x00
|09DE02| db $16, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x160, U } | s: 0x00
|09DE05| db $18, $11, $24 ; SPRITE 24   | xy: { 0x110, 0x180, U } | s: 0x00
|09DE08| db $FE, $00, $E4 ; small key on above sprite
|09DE0B| db $19, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x190, U } | s: 0x00
|09DE0E| db $1A, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
|09DE11| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room003F:
|09DE12| db $00 ; Unlayered OAM
|09DE13| db $15, $04, $04 ; SPRITE 04   | xy: { 0x040, 0x150, U } | s: 0x00
|09DE16| db $16, $0C, $91 ; SPRITE 91   | xy: { 0x0C0, 0x160, U } | s: 0x00
|09DE19| db $15, $13, $04 ; SPRITE 04   | xy: { 0x130, 0x150, U } | s: 0x00
|09DE1C| db $17, $04, $91 ; SPRITE 91   | xy: { 0x040, 0x170, U } | s: 0x00
|09DE1F| db $18, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x180, U } | s: 0x00
|09DE22| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0040:
|09DE23| db $00 ; Unlayered OAM
|09DE24| db $88, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x080, L } | s: 0x00
|09DE27| db $EF, $69, $41 ; SPRITE 41   | xy: { 0x090, 0x0F0, L } | s: 0x1B
|09DE2A| db $95, $18, $1C ; SPRITE 1C   | xy: { 0x180, 0x150, L } | s: 0x00
|09DE2D| db $98, $1B, $43 ; SPRITE 43   | xy: { 0x1B0, 0x180, L } | s: 0x00
|09DE30| db $9A, $17, $46 ; SPRITE 46   | xy: { 0x170, 0x1A0, L } | s: 0x00
|09DE33| db $9A, $19, $46 ; SPRITE 46   | xy: { 0x190, 0x1A0, L } | s: 0x00
|09DE36| db $FF ; END

;===================================================================================================

UNREACHABLE_09DE37:
|09DE37| db $00 ; Unlayered OAM
|09DE38| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0041:
|09DE39| db $00 ; Unlayered OAM
|09DE3A| db $0A, $11, $6D ; SPRITE 6D   | xy: { 0x110, 0x0A0, U } | s: 0x00
|09DE3D| db $0B, $1B, $6D ; SPRITE 6D   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09DE40| db $0D, $0F, $6D ; SPRITE 6D   | xy: { 0x0F0, 0x0D0, U } | s: 0x00
|09DE43| db $15, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x150, U } | s: 0x00
|09DE46| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0042:
|09DE47| db $00 ; Unlayered OAM
|09DE48| db $06, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x060, U } | s: 0x00
|09DE4B| db $06, $13, $6E ; SPRITE 6E   | xy: { 0x130, 0x060, U } | s: 0x00
|09DE4E| db $06, $14, $6E ; SPRITE 6E   | xy: { 0x140, 0x060, U } | s: 0x00
|09DE51| db $07, $12, $6E ; SPRITE 6E   | xy: { 0x120, 0x070, U } | s: 0x00
|09DE54| db $07, $13, $6E ; SPRITE 6E   | xy: { 0x130, 0x070, U } | s: 0x00
|09DE57| db $07, $14, $6E ; SPRITE 6E   | xy: { 0x140, 0x070, U } | s: 0x00
|09DE5A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0043:
|09DE5B| db $00 ; Unlayered OAM
|09DE5C| db $06, $0C, $84 ; SPRITE 84   | xy: { 0x0C0, 0x060, U } | s: 0x00
|09DE5F| db $18, $F7, $14 ; OVERLORD 14 | xy: { 0x170, 0x180, U }
|09DE62| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0044:
|09DE63| db $00 ; Unlayered OAM
|09DE64| db $06, $09, $93 ; SPRITE 93   | xy: { 0x090, 0x060, U } | s: 0x00
|09DE67| db $08, $05, $93 ; SPRITE 93   | xy: { 0x050, 0x080, U } | s: 0x00
|09DE6A| db $04, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x040, U } | s: 0x00
|09DE6D| db $08, $03, $24 ; SPRITE 24   | xy: { 0x030, 0x080, U } | s: 0x00
|09DE70| db $08, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x080, U } | s: 0x00
|09DE73| db $0C, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x0C0, U } | s: 0x00
|09DE76| db $0F, $17, $23 ; SPRITE 23   | xy: { 0x170, 0x0F0, U } | s: 0x00
|09DE79| db $15, $EB, $0A ; OVERLORD 0A | xy: { 0x0B0, 0x150, U }
|09DE7C| db $16, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x160, U } | s: 0x00
|09DE7F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0045:
|09DE80| db $00 ; Unlayered OAM
|09DE81| db $06, $19, $B7 ; SPRITE B7   | xy: { 0x190, 0x060, U } | s: 0x00
|09DE84| db $06, $06, $A6 ; SPRITE A6   | xy: { 0x060, 0x060, U } | s: 0x00
|09DE87| db $0B, $04, $A5 ; SPRITE A5   | xy: { 0x040, 0x0B0, U } | s: 0x00
|09DE8A| db $0B, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
|09DE8D| db $0B, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x0B0, U } | s: 0x00
|09DE90| db $0C, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x0C0, U } | s: 0x00
|09DE93| db $0C, $1A, $A5 ; SPRITE A5   | xy: { 0x1A0, 0x0C0, U } | s: 0x00
|09DE96| db $11, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x110, U } | s: 0x00
|09DE99| db $18, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x180, U } | s: 0x00
|09DE9C| db $1B, $19, $A6 ; SPRITE A6   | xy: { 0x190, 0x1B0, U } | s: 0x00
|09DE9F| db $1C, $07, $A6 ; SPRITE A6   | xy: { 0x070, 0x1C0, U } | s: 0x00
|09DEA2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0046:
|09DEA3| db $00 ; Unlayered OAM
|09DEA4| db $05, $16, $81 ; SPRITE 81   | xy: { 0x160, 0x050, U } | s: 0x00
|09DEA7| db $06, $FB, $11 ; OVERLORD 11 | xy: { 0x1B0, 0x060, U }
|09DEAA| db $1A, $09, $81 ; SPRITE 81   | xy: { 0x090, 0x1A0, U } | s: 0x00
|09DEAD| db $1A, $FB, $11 ; OVERLORD 11 | xy: { 0x1B0, 0x1A0, U }
|09DEB0| db $1B, $11, $81 ; SPRITE 81   | xy: { 0x110, 0x1B0, U } | s: 0x00
|09DEB3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0047:
|09DEB4| db $00 ; Unlayered OAM
|09DEB5| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0049:
|09DEB6| db $00 ; Unlayered OAM
|09DEB7| db $05, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x050, U } | s: 0x00
|09DEBA| db $0B, $04, $18 ; SPRITE 18   | xy: { 0x040, 0x0B0, U } | s: 0x00
|09DEBD| db $0C, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x0C0, U } | s: 0x00
|09DEC0| db $06, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x060, U } | s: 0x00
|09DEC3| db $08, $07, $8B ; SPRITE 8B   | xy: { 0x070, 0x080, U } | s: 0x00
|09DEC6| db $0B, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x0B0, U } | s: 0x00
|09DEC9| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09DECC| db $10, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x100, U } | s: 0x00
|09DECF| db $14, $16, $8B ; SPRITE 8B   | xy: { 0x160, 0x140, U } | s: 0x00
|09DED2| db $16, $09, $24 ; SPRITE 24   | xy: { 0x090, 0x160, U } | s: 0x00
|09DED5| db $17, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x170, U } | s: 0x00
|09DED8| db $18, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x180, U } | s: 0x00
|09DEDB| db $18, $1A, $8B ; SPRITE 8B   | xy: { 0x1A0, 0x180, U } | s: 0x00
|09DEDE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004A:
|09DEDF| db $00 ; Unlayered OAM
|09DEE0| db $07, $14, $1C ; SPRITE 1C   | xy: { 0x140, 0x070, U } | s: 0x00
|09DEE3| db $08, $08, $13 ; SPRITE 13   | xy: { 0x080, 0x080, U } | s: 0x00
|09DEE6| db $08, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x080, U } | s: 0x00
|09DEE9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004B:
|09DEEA| db $00 ; Unlayered OAM
|09DEEB| db $04, $07, $84 ; SPRITE 84   | xy: { 0x070, 0x040, U } | s: 0x00
|09DEEE| db $05, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x050, U } | s: 0x00
|09DEF1| db $06, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x060, U } | s: 0x00
|09DEF4| db $08, $04, $83 ; SPRITE 83   | xy: { 0x040, 0x080, U } | s: 0x00
|09DEF7| db $08, $0B, $83 ; SPRITE 83   | xy: { 0x0B0, 0x080, U } | s: 0x00
|09DEFA| db $18, $0F, $24 ; SPRITE 24   | xy: { 0x0F0, 0x180, U } | s: 0x00
|09DEFD| db $19, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x190, U } | s: 0x00
|09DF00| db $19, $12, $24 ; SPRITE 24   | xy: { 0x120, 0x190, U } | s: 0x00
|09DF03| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004C:
|09DF04| db $00 ; Unlayered OAM
|09DF05| db $11, $15, $93 ; SPRITE 93   | xy: { 0x150, 0x110, U } | s: 0x00
|09DF08| db $12, $19, $93 ; SPRITE 93   | xy: { 0x190, 0x120, U } | s: 0x00
|09DF0B| db $05, $15, $13 ; SPRITE 13   | xy: { 0x150, 0x050, U } | s: 0x00
|09DF0E| db $05, $1A, $13 ; SPRITE 13   | xy: { 0x1A0, 0x050, U } | s: 0x00
|09DF11| db $06, $17, $13 ; SPRITE 13   | xy: { 0x170, 0x060, U } | s: 0x00
|09DF14| db $0A, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09DF17| db $15, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x150, U } | s: 0x00
|09DF1A| db $18, $13, $8A ; SPRITE 8A   | xy: { 0x130, 0x180, U } | s: 0x00
|09DF1D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004D:
|09DF1E| db $00 ; Unlayered OAM
|09DF1F| db $0E, $0E, $09 ; SPRITE 09   | xy: { 0x0E0, 0x0E0, U } | s: 0x00
|09DF22| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004E:
|09DF23| db $00 ; Unlayered OAM
|09DF24| db $08, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x080, U } | s: 0x00
|09DF27| db $08, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x080, U } | s: 0x00
|09DF2A| db $08, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x080, U } | s: 0x00
|09DF2D| db $09, $07, $7E ; SPRITE 7E   | xy: { 0x070, 0x090, U } | s: 0x00
|09DF30| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room004F:
|09DF31| db $00 ; Unlayered OAM
|09DF32| db $06, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x060, U } | s: 0x00
|09DF35| db $08, $14, $E3 ; SPRITE E3   | xy: { 0x140, 0x080, U } | s: 0x00
|09DF38| db $08, $1A, $E3 ; SPRITE E3   | xy: { 0x1A0, 0x080, U } | s: 0x00
|09DF3B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0050:
|09DF3C| db $00 ; Unlayered OAM
|09DF3D| db $8E, $17, $42 ; SPRITE 42   | xy: { 0x170, 0x0E0, L } | s: 0x00
|09DF40| db $90, $18, $4B ; SPRITE 4B   | xy: { 0x180, 0x100, L } | s: 0x00
|09DF43| db $92, $17, $4B ; SPRITE 4B   | xy: { 0x170, 0x120, L } | s: 0x00
|09DF46| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0051:
|09DF47| db $01 ; Layered OAM
|09DF48| db $02, $0E, $EE ; SPRITE EE   | xy: { 0x0E0, 0x020, U } | s: 0x00
|09DF4B| db $97, $29, $41 ; SPRITE 41   | xy: { 0x090, 0x170, L } | s: 0x01
|09DF4E| db $97, $56, $41 ; SPRITE 41   | xy: { 0x160, 0x170, L } | s: 0x02
|09DF51| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0052:
|09DF52| db $00 ; Unlayered OAM
|09DF53| db $8D, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x0D0, L } | s: 0x00
|09DF56| db $8F, $08, $4B ; SPRITE 4B   | xy: { 0x080, 0x0F0, L } | s: 0x00
|09DF59| db $92, $07, $4B ; SPRITE 4B   | xy: { 0x070, 0x120, L } | s: 0x00
|09DF5C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0053:
|09DF5D| db $00 ; Unlayered OAM
|09DF5E| db $07, $17, $4E ; SPRITE 4E   | xy: { 0x170, 0x070, U } | s: 0x00
|09DF61| db $09, $1C, $61 ; SPRITE 61   | xy: { 0x1C0, 0x090, U } | s: 0x00
|09DF64| db $0C, $17, $4F ; SPRITE 4F   | xy: { 0x170, 0x0C0, U } | s: 0x00
|09DF67| db $0C, $1A, $4F ; SPRITE 4F   | xy: { 0x1A0, 0x0C0, U } | s: 0x00
|09DF6A| db $0E, $13, $61 ; SPRITE 61   | xy: { 0x130, 0x0E0, U } | s: 0x00
|09DF6D| db $15, $05, $4E ; SPRITE 4E   | xy: { 0x050, 0x150, U } | s: 0x00
|09DF70| db $16, $0B, $4E ; SPRITE 4E   | xy: { 0x0B0, 0x160, U } | s: 0x00
|09DF73| db $17, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x170, U } | s: 0x00
|09DF76| db $19, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x190, U } | s: 0x00
|09DF79| db $1A, $04, $4E ; SPRITE 4E   | xy: { 0x040, 0x1A0, U } | s: 0x00
|09DF7C| db $1A, $0B, $4E ; SPRITE 4E   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
|09DF7F| db $1A, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
|09DF82| db $1B, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x1B0, U } | s: 0x00
|09DF85| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0054:
|09DF86| db $00 ; Unlayered OAM
|09DF87| db $05, $0E, $9A ; SPRITE 9A   | xy: { 0x0E0, 0x050, U } | s: 0x00
|09DF8A| db $0B, $0C, $81 ; SPRITE 81   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
|09DF8D| db $0E, $0B, $C5 ; SPRITE C5   | xy: { 0x0B0, 0x0E0, U } | s: 0x00
|09DF90| db $0E, $0F, $7E ; SPRITE 7E   | xy: { 0x0F0, 0x0E0, U } | s: 0x00
|09DF93| db $0F, $10, $81 ; SPRITE 81   | xy: { 0x100, 0x0F0, U } | s: 0x00
|09DF96| db $14, $12, $9A ; SPRITE 9A   | xy: { 0x120, 0x140, U } | s: 0x00
|09DF99| db $15, $0F, $81 ; SPRITE 81   | xy: { 0x0F0, 0x150, U } | s: 0x00
|09DF9C| db $17, $0C, $9A ; SPRITE 9A   | xy: { 0x0C0, 0x170, U } | s: 0x00
|09DF9F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0055:
|09DFA0| db $00 ; Unlayered OAM
|09DFA1| db $08, $0E, $73 ; SPRITE 73   | xy: { 0x0E0, 0x080, U } | s: 0x00
|09DFA4| db $15, $14, $4B ; SPRITE 4B   | xy: { 0x140, 0x150, U } | s: 0x00
|09DFA7| db $16, $0D, $4B ; SPRITE 4B   | xy: { 0x0D0, 0x160, U } | s: 0x00
|09DFAA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0056:
|09DFAB| db $00 ; Unlayered OAM
|09DFAC| db $05, $EB, $0A ; OVERLORD 0A | xy: { 0x0B0, 0x050, U }
|09DFAF| db $19, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x190, U } | s: 0x00
|09DFB2| db $19, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x190, U } | s: 0x00
|09DFB5| db $04, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x040, U } | s: 0x00
|09DFB8| db $05, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x050, U } | s: 0x00
|09DFBB| db $06, $03, $13 ; SPRITE 13   | xy: { 0x030, 0x060, U } | s: 0x00
|09DFBE| db $06, $0C, $13 ; SPRITE 13   | xy: { 0x0C0, 0x060, U } | s: 0x00
|09DFC1| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09DFC4| db $11, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x110, U } | s: 0x00
|09DFC7| db $12, $18, $8A ; SPRITE 8A   | xy: { 0x180, 0x120, U } | s: 0x00
|09DFCA| db $1B, $03, $26 ; SPRITE 26   | xy: { 0x030, 0x1B0, U } | s: 0x00
|09DFCD| db $1C, $13, $80 ; SPRITE 80   | xy: { 0x130, 0x1C0, U } | s: 0x00
|09DFD0| db $1C, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x1C0, U } | s: 0x00
|09DFD3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0057:
|09DFD4| db $00 ; Unlayered OAM
|09DFD5| db $04, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x040, U } | s: 0x00
|09DFD8| db $04, $0C, $23 ; SPRITE 23   | xy: { 0x0C0, 0x040, U } | s: 0x00
|09DFDB| db $05, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x050, U } | s: 0x00
|09DFDE| db $07, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x070, U } | s: 0x00
|09DFE1| db $0C, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x0C0, U } | s: 0x00
|09DFE4| db $0C, $0C, $8B ; SPRITE 8B   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09DFE7| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09DFEA| db $14, $05, $8B ; SPRITE 8B   | xy: { 0x050, 0x140, U } | s: 0x00
|09DFED| db $14, $0A, $8B ; SPRITE 8B   | xy: { 0x0A0, 0x140, U } | s: 0x00
|09DFF0| db $14, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x140, U } | s: 0x00
|09DFF3| db $14, $19, $8B ; SPRITE 8B   | xy: { 0x190, 0x140, U } | s: 0x00
|09DFF6| db $15, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x150, U } | s: 0x00
|09DFF9| db $17, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x170, U } | s: 0x00
|09DFFC| db $18, $07, $24 ; SPRITE 24   | xy: { 0x070, 0x180, U } | s: 0x00
|09DFFF| db $18, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x180, U } | s: 0x00
|09E002| db $18, $0B, $1C ; SPRITE 1C   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E005| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0058:
|09E006| db $00 ; Unlayered OAM
|09E007| db $14, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x140, U } | s: 0x00
|09E00A| db $16, $06, $18 ; SPRITE 18   | xy: { 0x060, 0x160, U } | s: 0x00
|09E00D| db $16, $16, $93 ; SPRITE 93   | xy: { 0x160, 0x160, U } | s: 0x00
|09E010| db $04, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x040, U } | s: 0x00
|09E013| db $06, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x060, U } | s: 0x00
|09E016| db $0A, $08, $04 ; SPRITE 04   | xy: { 0x080, 0x0A0, U } | s: 0x00
|09E019| db $0B, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09E01C| db $19, $16, $26 ; SPRITE 26   | xy: { 0x160, 0x190, U } | s: 0x00
|09E01F| db $1A, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
|09E022| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0059:
|09E023| db $01 ; Layered OAM
|09E024| db $10, $07, $18 ; SPRITE 18   | xy: { 0x070, 0x100, U } | s: 0x00
|09E027| db $16, $08, $18 ; SPRITE 18   | xy: { 0x080, 0x160, U } | s: 0x00
|09E02A| db $8F, $14, $93 ; SPRITE 93   | xy: { 0x140, 0x0F0, L } | s: 0x00
|09E02D| db $8F, $1A, $93 ; SPRITE 93   | xy: { 0x1A0, 0x0F0, L } | s: 0x00
|09E030| db $8A, $1A, $8A ; SPRITE 8A   | xy: { 0x1A0, 0x0A0, L } | s: 0x00
|09E033| db $0B, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x0B0, U } | s: 0x00
|09E036| db $8D, $15, $8A ; SPRITE 8A   | xy: { 0x150, 0x0D0, L } | s: 0x00
|09E039| db $8E, $05, $5B ; SPRITE 5B   | xy: { 0x050, 0x0E0, L } | s: 0x00
|09E03C| db $93, $1A, $D1 ; SPRITE D1   | xy: { 0x1A0, 0x130, L } | s: 0x00
|09E03F| db $14, $17, $8B ; SPRITE 8B   | xy: { 0x170, 0x140, U } | s: 0x00
|09E042| db $95, $15, $8B ; SPRITE 8B   | xy: { 0x150, 0x150, L } | s: 0x00
|09E045| db $95, $1A, $8B ; SPRITE 8B   | xy: { 0x1A0, 0x150, L } | s: 0x00
|09E048| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005A:
|09E049| db $00 ; Unlayered OAM
|09E04A| db $16, $17, $92 ; SPRITE 92   | xy: { 0x170, 0x160, U } | s: 0x00
|09E04D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005B:
|09E04E| db $01 ; Layered OAM
|09E04F| db $8C, $17, $1E ; SPRITE 1E   | xy: { 0x170, 0x0C0, L } | s: 0x00
|09E052| db $93, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x130, L } | s: 0x00
|09E055| db $95, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x150, L } | s: 0x00
|09E058| db $88, $16, $83 ; SPRITE 83   | xy: { 0x160, 0x080, L } | s: 0x00
|09E05B| db $88, $19, $84 ; SPRITE 84   | xy: { 0x190, 0x080, L } | s: 0x00
|09E05E| db $8E, $14, $8A ; SPRITE 8A   | xy: { 0x140, 0x0E0, L } | s: 0x00
|09E061| db $90, $1B, $8A ; SPRITE 8A   | xy: { 0x1B0, 0x100, L } | s: 0x00
|09E064| db $91, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x110, L } | s: 0x00
|09E067| db $92, $14, $8A ; SPRITE 8A   | xy: { 0x140, 0x120, L } | s: 0x00
|09E06A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005C:
|09E06B| db $00 ; Unlayered OAM
|09E06C| db $02, $0B, $68 ; SPRITE 68   | xy: { 0x0B0, 0x020, U } | s: 0x00
|09E06F| db $0E, $05, $69 ; SPRITE 69   | xy: { 0x050, 0x0E0, U } | s: 0x00
|09E072| db $0E, $0E, $69 ; SPRITE 69   | xy: { 0x0E0, 0x0E0, U } | s: 0x00
|09E075| db $18, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x180, U } | s: 0x00
|09E078| db $18, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x180, U } | s: 0x00
|09E07B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005D:
|09E07C| db $00 ; Unlayered OAM
|09E07D| db $05, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x050, U } | s: 0x00
|09E080| db $06, $08, $61 ; SPRITE 61   | xy: { 0x080, 0x060, U } | s: 0x00
|09E083| db $08, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x080, U } | s: 0x00
|09E086| db $08, $15, $A6 ; SPRITE A6   | xy: { 0x150, 0x080, U } | s: 0x00
|09E089| db $08, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x080, U } | s: 0x00
|09E08C| db $08, $19, $A5 ; SPRITE A5   | xy: { 0x190, 0x080, U } | s: 0x00
|09E08F| db $08, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09E092| db $0B, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x0B0, U } | s: 0x00
|09E095| db $15, $04, $61 ; SPRITE 61   | xy: { 0x040, 0x150, U } | s: 0x00
|09E098| db $15, $0B, $A5 ; SPRITE A5   | xy: { 0x0B0, 0x150, U } | s: 0x00
|09E09B| db $1A, $04, $A5 ; SPRITE A5   | xy: { 0x040, 0x1A0, U } | s: 0x00
|09E09E| db $1A, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x1A0, U } | s: 0x00
|09E0A1| db $1A, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
|09E0A4| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005E:
|09E0A5| db $00 ; Unlayered OAM
|09E0A6| db $05, $FB, $0A ; OVERLORD 0A | xy: { 0x1B0, 0x050, U }
|09E0A9| db $05, $1C, $C5 ; SPRITE C5   | xy: { 0x1C0, 0x050, U } | s: 0x00
|09E0AC| db $0B, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x0B0, U } | s: 0x00
|09E0AF| db $14, $17, $7D ; SPRITE 7D   | xy: { 0x170, 0x140, U } | s: 0x00
|09E0B2| db $18, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x180, U } | s: 0x00
|09E0B5| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room005F:
|09E0B6| db $00 ; Unlayered OAM
|09E0B7| db $18, $04, $24 ; SPRITE 24   | xy: { 0x040, 0x180, U } | s: 0x00
|09E0BA| db $18, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E0BD| db $1B, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x1B0, U } | s: 0x00
|09E0C0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0060:
|09E0C1| db $01 ; Layered OAM
|09E0C2| db $48, $73, $41 ; SPRITE 41   | xy: { 0x130, 0x080, U } | s: 0x13
|09E0C5| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0061:
|09E0C6| db $00 ; Unlayered OAM
|09E0C7| db $0E, $2C, $42 ; SPRITE 42   | xy: { 0x0C0, 0x0E0, U } | s: 0x01
|09E0CA| db $12, $0D, $4B ; SPRITE 4B   | xy: { 0x0D0, 0x120, U } | s: 0x00
|09E0CD| db $12, $12, $4B ; SPRITE 4B   | xy: { 0x120, 0x120, U } | s: 0x00
|09E0D0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0062:
|09E0D1| db $01 ; Layered OAM
|09E0D2| db $48, $6C, $41 ; SPRITE 41   | xy: { 0x0C0, 0x080, U } | s: 0x13
|09E0D5| db $8D, $0A, $42 ; SPRITE 42   | xy: { 0x0A0, 0x0D0, L } | s: 0x00
|09E0D8| db $8E, $11, $42 ; SPRITE 42   | xy: { 0x110, 0x0E0, L } | s: 0x00
|09E0DB| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0063:
|09E0DC| db $00 ; Unlayered OAM
|09E0DD| db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
|09E0E0| db $18, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x180, U } | s: 0x00
|09E0E3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0064:
|09E0E4| db $00 ; Unlayered OAM
|09E0E5| db $12, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x120, U } | s: 0x00
|09E0E8| db $13, $0B, $06 ; SPRITE 06   | xy: { 0x0B0, 0x130, U } | s: 0x00
|09E0EB| db $13, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x130, U } | s: 0x00
|09E0EE| db $16, $03, $D1 ; SPRITE D1   | xy: { 0x030, 0x160, U } | s: 0x00
|09E0F1| db $17, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x170, U } | s: 0x00
|09E0F4| db $19, $19, $6D ; SPRITE 6D   | xy: { 0x190, 0x190, U } | s: 0x00
|09E0F7| db $1A, $05, $6D ; SPRITE 6D   | xy: { 0x050, 0x1A0, U } | s: 0x00
|09E0FA| db $15, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x150, U }
|09E0FD| db $17, $E7, $06 ; OVERLORD 06 | xy: { 0x070, 0x170, U }
|09E100| db $17, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x170, U }
|09E103| db $17, $EB, $06 ; OVERLORD 06 | xy: { 0x0B0, 0x170, U }
|09E106| db $19, $E9, $06 ; OVERLORD 06 | xy: { 0x090, 0x190, U }
|09E109| db $1B, $EC, $06 ; OVERLORD 06 | xy: { 0x0C0, 0x1B0, U }
|09E10C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0065:
|09E10D| db $00 ; Unlayered OAM
|09E10E| db $15, $13, $6D ; SPRITE 6D   | xy: { 0x130, 0x150, U } | s: 0x00
|09E111| db $17, $09, $6D ; SPRITE 6D   | xy: { 0x090, 0x170, U } | s: 0x00
|09E114| db $18, $06, $6D ; SPRITE 6D   | xy: { 0x060, 0x180, U } | s: 0x00
|09E117| db $19, $16, $6D ; SPRITE 6D   | xy: { 0x160, 0x190, U } | s: 0x00
|09E11A| db $1C, $16, $6D ; SPRITE 6D   | xy: { 0x160, 0x1C0, U } | s: 0x00
|09E11D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0066:
|09E11E| db $00 ; Unlayered OAM
|09E11F| db $85, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x050, L } | s: 0x00
|09E122| db $86, $E4, $10 ; OVERLORD 10 | xy: { 0x040, 0x060, L }
|09E125| db $06, $16, $24 ; SPRITE 24   | xy: { 0x160, 0x060, U } | s: 0x00
|09E128| db $07, $1A, $24 ; SPRITE 24   | xy: { 0x1A0, 0x070, U } | s: 0x00
|09E12B| db $94, $17, $37 ; SPRITE 37   | xy: { 0x170, 0x140, L } | s: 0x00
|09E12E| db $96, $E1, $10 ; OVERLORD 10 | xy: { 0x010, 0x160, L }
|09E131| db $96, $0F, $9A ; SPRITE 9A   | xy: { 0x0F0, 0x160, L } | s: 0x00
|09E134| db $96, $13, $81 ; SPRITE 81   | xy: { 0x130, 0x160, L } | s: 0x00
|09E137| db $98, $0B, $81 ; SPRITE 81   | xy: { 0x0B0, 0x180, L } | s: 0x00
|09E13A| db $99, $0D, $81 ; SPRITE 81   | xy: { 0x0D0, 0x190, L } | s: 0x00
|09E13D| db $99, $FE, $11 ; OVERLORD 11 | xy: { 0x1E0, 0x190, L }
|09E140| db $9B, $17, $81 ; SPRITE 81   | xy: { 0x170, 0x1B0, L } | s: 0x00
|09E143| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0067:
|09E144| db $00 ; Unlayered OAM
|09E145| db $0C, $07, $93 ; SPRITE 93   | xy: { 0x070, 0x0C0, U } | s: 0x00
|09E148| db $06, $04, $24 ; SPRITE 24   | xy: { 0x040, 0x060, U } | s: 0x00
|09E14B| db $06, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x060, U } | s: 0x00
|09E14E| db $0C, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x0C0, U } | s: 0x00
|09E151| db $0F, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x0F0, U } | s: 0x00
|09E154| db $13, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x130, U } | s: 0x00
|09E157| db $13, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x130, U } | s: 0x00
|09E15A| db $14, $18, $7E ; SPRITE 7E   | xy: { 0x180, 0x140, U } | s: 0x00
|09E15D| db $17, $07, $7F ; SPRITE 7F   | xy: { 0x070, 0x170, U } | s: 0x00
|09E160| db $1A, $18, $26 ; SPRITE 26   | xy: { 0x180, 0x1A0, U } | s: 0x00
|09E163| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0068:
|09E164| db $00 ; Unlayered OAM
|09E165| db $07, $0E, $93 ; SPRITE 93   | xy: { 0x0E0, 0x070, U } | s: 0x00
|09E168| db $07, $11, $93 ; SPRITE 93   | xy: { 0x110, 0x070, U } | s: 0x00
|09E16B| db $0B, $0C, $93 ; SPRITE 93   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
|09E16E| db $0B, $13, $93 ; SPRITE 93   | xy: { 0x130, 0x0B0, U } | s: 0x00
|09E171| db $08, $14, $8B ; SPRITE 8B   | xy: { 0x140, 0x080, U } | s: 0x00
|09E174| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09E177| db $12, $0E, $8B ; SPRITE 8B   | xy: { 0x0E0, 0x120, U } | s: 0x00
|09E17A| db $12, $12, $8B ; SPRITE 8B   | xy: { 0x120, 0x120, U } | s: 0x00
|09E17D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006A:
|09E17E| db $00 ; Unlayered OAM
|09E17F| db $0A, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x0A0, U } | s: 0x00
|09E182| db $0A, $18, $8E ; SPRITE 8E   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09E185| db $0B, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x0B0, U } | s: 0x00
|09E188| db $0B, $1C, $15 ; SPRITE 15   | xy: { 0x1C0, 0x0B0, U } | s: 0x00
|09E18B| db $0E, $17, $8E ; SPRITE 8E   | xy: { 0x170, 0x0E0, U } | s: 0x00
|09E18E| db $0E, $18, $8E ; SPRITE 8E   | xy: { 0x180, 0x0E0, U } | s: 0x00
|09E191| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006B:
|09E192| db $00 ; Unlayered OAM
|09E193| db $04, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x040, U } | s: 0x00
|09E196| db $04, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x040, U } | s: 0x00
|09E199| db $06, $0A, $83 ; SPRITE 83   | xy: { 0x0A0, 0x060, U } | s: 0x00
|09E19C| db $09, $06, $84 ; SPRITE 84   | xy: { 0x060, 0x090, U } | s: 0x00
|09E19F| db $0A, $0C, $15 ; SPRITE 15   | xy: { 0x0C0, 0x0A0, U } | s: 0x00
|09E1A2| db $15, $06, $1C ; SPRITE 1C   | xy: { 0x060, 0x150, U } | s: 0x00
|09E1A5| db $18, $03, $84 ; SPRITE 84   | xy: { 0x030, 0x180, U } | s: 0x00
|09E1A8| db $18, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x180, U } | s: 0x00
|09E1AB| db $1B, $04, $8A ; SPRITE 8A   | xy: { 0x040, 0x1B0, U } | s: 0x00
|09E1AE| db $1B, $0C, $84 ; SPRITE 84   | xy: { 0x0C0, 0x1B0, U } | s: 0x00
|09E1B1| db $15, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x150, U } | s: 0x00
|09E1B4| db $15, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x150, U } | s: 0x00
|09E1B7| db $1B, $14, $61 ; SPRITE 61   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09E1BA| db $1B, $18, $84 ; SPRITE 84   | xy: { 0x180, 0x1B0, U } | s: 0x00
|09E1BD| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006C:
|09E1BE| db $00 ; Unlayered OAM
|09E1BF| db $17, $06, $54 ; SPRITE 54   | xy: { 0x060, 0x170, U } | s: 0x00
|09E1C2| db $17, $09, $54 ; SPRITE 54   | xy: { 0x090, 0x170, U } | s: 0x00
|09E1C5| db $19, $07, $54 ; SPRITE 54   | xy: { 0x070, 0x190, U } | s: 0x00
|09E1C8| db $18, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x180, U } | s: 0x00
|09E1CB| db $1C, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x1C0, U } | s: 0x00
|09E1CE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006D:
|09E1CF| db $00 ; Unlayered OAM
|09E1D0| db $06, $05, $A6 ; SPRITE A6   | xy: { 0x050, 0x060, U } | s: 0x00
|09E1D3| db $06, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x060, U } | s: 0x00
|09E1D6| db $09, $04, $61 ; SPRITE 61   | xy: { 0x040, 0x090, U } | s: 0x00
|09E1D9| db $0B, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x0B0, U } | s: 0x00
|09E1DC| db $15, $04, $C5 ; SPRITE C5   | xy: { 0x040, 0x150, U } | s: 0x00
|09E1DF| db $15, $0B, $61 ; SPRITE 61   | xy: { 0x0B0, 0x150, U } | s: 0x00
|09E1E2| db $18, $05, $A7 ; SPRITE A7   | xy: { 0x050, 0x180, U } | s: 0x00
|09E1E5| db $18, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x180, U } | s: 0x00
|09E1E8| db $1A, $06, $5C ; SPRITE 5C   | xy: { 0x060, 0x1A0, U } | s: 0x00
|09E1EB| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room006E:
|09E1EC| db $00 ; Unlayered OAM
|09E1ED| db $08, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x080, U } | s: 0x00
|09E1F0| db $09, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x090, U } | s: 0x00
|09E1F3| db $0A, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0A0, U } | s: 0x00
|09E1F6| db $0B, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0B0, U } | s: 0x00
|09E1F9| db $0C, $13, $99 ; SPRITE 99   | xy: { 0x130, 0x0C0, U } | s: 0x00
|09E1FC| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0071:
|09E1FD| db $00 ; Unlayered OAM
|09E1FE| db $98, $06, $42 ; SPRITE 42   | xy: { 0x060, 0x180, L } | s: 0x00
|09E201| db $D8, $BA, $41 ; SPRITE 41   | xy: { 0x1A0, 0x180, L } | s: 0x15
|09E204| db $FE, $00, $E4 ; small key on above sprite
|09E207| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0072:
|09E208| db $00 ; Unlayered OAM
|09E209| db $06, $B1, $41 ; SPRITE 41   | xy: { 0x110, 0x060, U } | s: 0x05
|09E20C| db $FE, $00, $E4 ; small key on above sprite
|09E20F| db $99, $2A, $41 ; SPRITE 41   | xy: { 0x0A0, 0x190, L } | s: 0x01
|09E212| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0073:
|09E213| db $00 ; Unlayered OAM
|09E214| db $18, $18, $64 ; SPRITE 64   | xy: { 0x180, 0x180, U } | s: 0x00
|09E217| db $09, $17, $61 ; SPRITE 61   | xy: { 0x170, 0x090, U } | s: 0x00
|09E21A| db $15, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x150, U } | s: 0x00
|09E21D| db $18, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x180, U } | s: 0x00
|09E220| db $19, $07, $61 ; SPRITE 61   | xy: { 0x070, 0x190, U } | s: 0x00
|09E223| db $1B, $16, $71 ; SPRITE 71   | xy: { 0x160, 0x1B0, U } | s: 0x00
|09E226| db $06, $14, $3B ; SPRITE 3B   | xy: { 0x140, 0x060, U } | s: 0x00
|09E229| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0074:
|09E22A| db $00 ; Unlayered OAM
|09E22B| db $18, $08, $64 ; SPRITE 64   | xy: { 0x080, 0x180, U } | s: 0x00
|09E22E| db $18, $17, $64 ; SPRITE 64   | xy: { 0x170, 0x180, U } | s: 0x00
|09E231| db $05, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x050, U } | s: 0x00
|09E234| db $05, $13, $83 ; SPRITE 83   | xy: { 0x130, 0x050, U } | s: 0x00
|09E237| db $0A, $0C, $71 ; SPRITE 71   | xy: { 0x0C0, 0x0A0, U } | s: 0x00
|09E23A| db $0A, $13, $71 ; SPRITE 71   | xy: { 0x130, 0x0A0, U } | s: 0x00
|09E23D| db $1B, $0E, $71 ; SPRITE 71   | xy: { 0x0E0, 0x1B0, U } | s: 0x00
|09E240| db $1B, $12, $71 ; SPRITE 71   | xy: { 0x120, 0x1B0, U } | s: 0x00
|09E243| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0075:
|09E244| db $00 ; Unlayered OAM
|09E245| db $07, $08, $64 ; SPRITE 64   | xy: { 0x080, 0x070, U } | s: 0x00
|09E248| db $1B, $04, $64 ; SPRITE 64   | xy: { 0x040, 0x1B0, U } | s: 0x00
|09E24B| db $05, $06, $71 ; SPRITE 71   | xy: { 0x060, 0x050, U } | s: 0x00
|09E24E| db $05, $0A, $71 ; SPRITE 71   | xy: { 0x0A0, 0x050, U } | s: 0x00
|09E251| db $0A, $06, $71 ; SPRITE 71   | xy: { 0x060, 0x0A0, U } | s: 0x00
|09E254| db $0A, $0A, $71 ; SPRITE 71   | xy: { 0x0A0, 0x0A0, U } | s: 0x00
|09E257| db $0B, $11, $66 ; SPRITE 66   | xy: { 0x110, 0x0B0, U } | s: 0x00
|09E25A| db $0B, $1E, $67 ; SPRITE 67   | xy: { 0x1E0, 0x0B0, U } | s: 0x00
|09E25D| db $19, $07, $71 ; SPRITE 71   | xy: { 0x070, 0x190, U } | s: 0x00
|09E260| db $19, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x190, U } | s: 0x00
|09E263| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0076:
|09E264| db $00 ; Unlayered OAM
|09E265| db $03, $19, $21 ; SPRITE 21   | xy: { 0x190, 0x030, U } | s: 0x00
|09E268| db $0A, $07, $81 ; SPRITE 81   | xy: { 0x070, 0x0A0, U } | s: 0x00
|09E26B| db $0F, $07, $9A ; SPRITE 9A   | xy: { 0x070, 0x0F0, U } | s: 0x00
|09E26E| db $11, $08, $81 ; SPRITE 81   | xy: { 0x080, 0x110, U } | s: 0x00
|09E271| db $19, $1B, $8F ; SPRITE 8F   | xy: { 0x1B0, 0x190, U } | s: 0x00
|09E274| db $1C, $E8, $13 ; OVERLORD 13 | xy: { 0x080, 0x1C0, U }
|09E277| db $1C, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
|09E27A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0077:
|09E27B| db $00 ; Unlayered OAM
|09E27C| db $89, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x090, L } | s: 0x00
|09E27F| db $98, $10, $1E ; SPRITE 1E   | xy: { 0x100, 0x180, L } | s: 0x00
|09E282| db $9A, $09, $1E ; SPRITE 1E   | xy: { 0x090, 0x1A0, L } | s: 0x00
|09E285| db $9A, $16, $1E ; SPRITE 1E   | xy: { 0x160, 0x1A0, L } | s: 0x00
|09E288| db $8A, $07, $86 ; SPRITE 86   | xy: { 0x070, 0x0A0, L } | s: 0x00
|09E28B| db $8A, $17, $86 ; SPRITE 86   | xy: { 0x170, 0x0A0, L } | s: 0x00
|09E28E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007B:
|09E28F| db $00 ; Unlayered OAM
|09E290| db $07, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x070, U } | s: 0x00
|09E293| db $09, $16, $24 ; SPRITE 24   | xy: { 0x160, 0x090, U } | s: 0x00
|09E296| db $15, $04, $C6 ; SPRITE C6   | xy: { 0x040, 0x150, U } | s: 0x00
|09E299| db $15, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x150, U } | s: 0x00
|09E29C| db $17, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x170, U } | s: 0x00
|09E29F| db $17, $09, $C6 ; SPRITE C6   | xy: { 0x090, 0x170, U } | s: 0x00
|09E2A2| db $18, $13, $1C ; SPRITE 1C   | xy: { 0x130, 0x180, U } | s: 0x00
|09E2A5| db $18, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x180, U } | s: 0x00
|09E2A8| db $19, $09, $A7 ; SPRITE A7   | xy: { 0x090, 0x190, U } | s: 0x00
|09E2AB| db $1A, $05, $C6 ; SPRITE C6   | xy: { 0x050, 0x1A0, U } | s: 0x00
|09E2AE| db $1B, $0B, $C6 ; SPRITE C6   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09E2B1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007C:
|09E2B2| db $00 ; Unlayered OAM
|09E2B3| db $1C, $19, $18 ; SPRITE 18   | xy: { 0x190, 0x1C0, U } | s: 0x00
|09E2B6| db $0C, $06, $7F ; SPRITE 7F   | xy: { 0x060, 0x0C0, U } | s: 0x00
|09E2B9| db $10, $07, $8A ; SPRITE 8A   | xy: { 0x070, 0x100, U } | s: 0x00
|09E2BC| db $14, $09, $7E ; SPRITE 7E   | xy: { 0x090, 0x140, U } | s: 0x00
|09E2BF| db $18, $0B, $26 ; SPRITE 26   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E2C2| db $18, $17, $24 ; SPRITE 24   | xy: { 0x170, 0x180, U } | s: 0x00
|09E2C5| db $1A, $E7, $0B ; OVERLORD 0B | xy: { 0x070, 0x1A0, U }
|09E2C8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007D:
|09E2C9| db $00 ; Unlayered OAM
|09E2CA| db $06, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x060, U } | s: 0x00
|09E2CD| db $08, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x080, U } | s: 0x00
|09E2D0| db $0A, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x0A0, U } | s: 0x00
|09E2D3| db $0C, $11, $80 ; SPRITE 80   | xy: { 0x110, 0x0C0, U } | s: 0x00
|09E2D6| db $16, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x160, U } | s: 0x00
|09E2D9| db $17, $18, $C6 ; SPRITE C6   | xy: { 0x180, 0x170, U } | s: 0x00
|09E2DC| db $19, $1C, $80 ; SPRITE 80   | xy: { 0x1C0, 0x190, U } | s: 0x00
|09E2DF| db $1A, $14, $13 ; SPRITE 13   | xy: { 0x140, 0x1A0, U } | s: 0x00
|09E2E2| db $1A, $17, $23 ; SPRITE 23   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09E2E5| db $1C, $0A, $80 ; SPRITE 80   | xy: { 0x0A0, 0x1C0, U } | s: 0x00
|09E2E8| db $1C, $1B, $26 ; SPRITE 26   | xy: { 0x1B0, 0x1C0, U } | s: 0x00
|09E2EB| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007E:
|09E2EC| db $00 ; Unlayered OAM
|09E2ED| db $11, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x110, U } | s: 0x00
|09E2F0| db $0E, $18, $7F ; SPRITE 7F   | xy: { 0x180, 0x0E0, U } | s: 0x00
|09E2F3| db $0F, $14, $99 ; SPRITE 99   | xy: { 0x140, 0x0F0, U } | s: 0x00
|09E2F6| db $12, $07, $A1 ; SPRITE A1   | xy: { 0x070, 0x120, U } | s: 0x00
|09E2F9| db $12, $0A, $A1 ; SPRITE A1   | xy: { 0x0A0, 0x120, U } | s: 0x00
|09E2FC| db $16, $1B, $99 ; SPRITE 99   | xy: { 0x1B0, 0x160, U } | s: 0x00
|09E2FF| db $17, $17, $7F ; SPRITE 7F   | xy: { 0x170, 0x170, U } | s: 0x00
|09E302| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room007F:
|09E303| db $00 ; Unlayered OAM
|09E304| db $07, $06, $23 ; SPRITE 23   | xy: { 0x060, 0x070, U } | s: 0x00
|09E307| db $07, $08, $23 ; SPRITE 23   | xy: { 0x080, 0x070, U } | s: 0x00
|09E30A| db $08, $0A, $23 ; SPRITE 23   | xy: { 0x0A0, 0x080, U } | s: 0x00
|09E30D| db $09, $07, $23 ; SPRITE 23   | xy: { 0x070, 0x090, U } | s: 0x00
|09E310| db $14, $0B, $7D ; SPRITE 7D   | xy: { 0x0B0, 0x140, U } | s: 0x00
|09E313| db $17, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x170, U } | s: 0x00
|09E316| db $19, $0B, $7D ; SPRITE 7D   | xy: { 0x0B0, 0x190, U } | s: 0x00
|09E319| db $1B, $03, $7D ; SPRITE 7D   | xy: { 0x030, 0x1B0, U } | s: 0x00
|09E31C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0080:
|09E31D| db $00 ; Unlayered OAM
|09E31E| db $03, $16, $76 ; SPRITE 76   | xy: { 0x160, 0x030, U } | s: 0x00
|09E321| db $09, $07, $42 ; SPRITE 42   | xy: { 0x070, 0x090, U } | s: 0x00
|09E324| db $09, $1A, $6A ; SPRITE 6A   | xy: { 0x1A0, 0x090, U } | s: 0x00
|09E327| db $FD, $00, $E4 ; big key on above sprite
|09E32A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0081:
|09E32B| db $01 ; Layered OAM
|09E32C| db $EB, $6B, $42 ; SPRITE 42   | xy: { 0x0B0, 0x0B0, L } | s: 0x1B
|09E32F| db $8B, $6E, $42 ; SPRITE 42   | xy: { 0x0E0, 0x0B0, L } | s: 0x03
|09E332| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0082:
|09E333| db $00 ; Unlayered OAM
|09E334| db $E5, $69, $41 ; SPRITE 41   | xy: { 0x090, 0x050, L } | s: 0x1B
|09E337| db $86, $70, $41 ; SPRITE 41   | xy: { 0x100, 0x060, L } | s: 0x03
|09E33A| db $91, $75, $41 ; SPRITE 41   | xy: { 0x150, 0x110, L } | s: 0x03
|09E33D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0083:
|09E33E| db $00 ; Unlayered OAM
|09E33F| db $08, $1B, $63 ; SPRITE 63   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09E342| db $10, $14, $63 ; SPRITE 63   | xy: { 0x140, 0x100, U } | s: 0x00
|09E345| db $05, $14, $71 ; SPRITE 71   | xy: { 0x140, 0x050, U } | s: 0x00
|09E348| db $06, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x060, U } | s: 0x00
|09E34B| db $08, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x080, U } | s: 0x00
|09E34E| db $0B, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09E351| db $10, $17, $71 ; SPRITE 71   | xy: { 0x170, 0x100, U } | s: 0x00
|09E354| db $17, $08, $61 ; SPRITE 61   | xy: { 0x080, 0x170, U } | s: 0x00
|09E357| db $18, $18, $71 ; SPRITE 71   | xy: { 0x180, 0x180, U } | s: 0x00
|09E35A| db $1B, $14, $71 ; SPRITE 71   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09E35D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0084:
|09E35E| db $00 ; Unlayered OAM
|09E35F| db $05, $03, $71 ; SPRITE 71   | xy: { 0x030, 0x050, U } | s: 0x00
|09E362| db $05, $1B, $71 ; SPRITE 71   | xy: { 0x1B0, 0x050, U } | s: 0x00
|09E365| db $07, $0F, $61 ; SPRITE 61   | xy: { 0x0F0, 0x070, U } | s: 0x00
|09E368| db $12, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x120, U } | s: 0x00
|09E36B| db $12, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x120, U } | s: 0x00
|09E36E| db $1B, $09, $71 ; SPRITE 71   | xy: { 0x090, 0x1B0, U } | s: 0x00
|09E371| db $1B, $15, $71 ; SPRITE 71   | xy: { 0x150, 0x1B0, U } | s: 0x00
|09E374| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0085:
|09E375| db $00 ; Unlayered OAM
|09E376| db $0E, $07, $63 ; SPRITE 63   | xy: { 0x070, 0x0E0, U } | s: 0x00
|09E379| db $1B, $09, $64 ; SPRITE 64   | xy: { 0x090, 0x1B0, U } | s: 0x00
|09E37C| db $05, $14, $4F ; SPRITE 4F   | xy: { 0x140, 0x050, U } | s: 0x00
|09E37F| db $05, $1B, $4F ; SPRITE 4F   | xy: { 0x1B0, 0x050, U } | s: 0x00
|09E382| db $08, $16, $4F ; SPRITE 4F   | xy: { 0x160, 0x080, U } | s: 0x00
|09E385| db $0A, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09E388| db $0E, $03, $71 ; SPRITE 71   | xy: { 0x030, 0x0E0, U } | s: 0x00
|09E38B| db $15, $0C, $71 ; SPRITE 71   | xy: { 0x0C0, 0x150, U } | s: 0x00
|09E38E| db $18, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x180, U } | s: 0x00
|09E391| db $1C, $07, $71 ; SPRITE 71   | xy: { 0x070, 0x1C0, U } | s: 0x00
|09E394| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0086:
|09E395| db $01 ; Layered OAM
|09E396| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0087:
|09E397| db $00 ; Unlayered OAM
|09E398| db $05, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x050, U } | s: 0x00
|09E39B| db $07, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x070, U } | s: 0x00
|09E39E| db $0B, $13, $18 ; SPRITE 18   | xy: { 0x130, 0x0B0, U } | s: 0x00
|09E3A1| db $19, $06, $18 ; SPRITE 18   | xy: { 0x060, 0x190, U } | s: 0x00
|09E3A4| db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
|09E3A7| db $04, $17, $1E ; SPRITE 1E   | xy: { 0x170, 0x040, U } | s: 0x00
|09E3AA| db $0C, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x0C0, U } | s: 0x00
|09E3AD| db $15, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x150, U } | s: 0x00
|09E3B0| db $17, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x170, U } | s: 0x00
|09E3B3| db $18, $19, $A7 ; SPRITE A7   | xy: { 0x190, 0x180, U } | s: 0x00
|09E3B6| db $19, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x190, U } | s: 0x00
|09E3B9| db $1A, $08, $E4 ; SPRITE E4   | xy: { 0x080, 0x1A0, U } | s: 0x00
|09E3BC| db $1C, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x1C0, U } | s: 0x00
|09E3BF| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0089:
|09E3C0| db $00 ; Unlayered OAM
|09E3C1| db $0A, $10, $E3 ; SPRITE E3   | xy: { 0x100, 0x0A0, U } | s: 0x00
|09E3C4| db $0B, $0F, $E3 ; SPRITE E3   | xy: { 0x0F0, 0x0B0, U } | s: 0x00
|09E3C7| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008B:
|09E3C8| db $00 ; Unlayered OAM
|09E3C9| db $07, $15, $93 ; SPRITE 93   | xy: { 0x150, 0x070, U } | s: 0x00
|09E3CC| db $18, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x180, U } | s: 0x00
|09E3CF| db $18, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E3D2| db $04, $1A, $24 ; SPRITE 24   | xy: { 0x1A0, 0x040, U } | s: 0x00
|09E3D5| db $12, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x120, U } | s: 0x00
|09E3D8| db $18, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x180, U } | s: 0x00
|09E3DB| db $18, $18, $7E ; SPRITE 7E   | xy: { 0x180, 0x180, U } | s: 0x00
|09E3DE| db $18, $18, $7F ; SPRITE 7F   | xy: { 0x180, 0x180, U } | s: 0x00
|09E3E1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008C:
|09E3E2| db $00 ; Unlayered OAM
|09E3E3| db $03, $1A, $06 ; SPRITE 06   | xy: { 0x1A0, 0x030, U } | s: 0x00
|09E3E6| db $05, $F8, $1A ; OVERLORD 1A | xy: { 0x180, 0x050, U }
|09E3E9| db $06, $F5, $1A ; OVERLORD 1A | xy: { 0x150, 0x060, U }
|09E3EC| db $06, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x060, U }
|09E3EF| db $0A, $F5, $1A ; OVERLORD 1A | xy: { 0x150, 0x0A0, U }
|09E3F2| db $0A, $FA, $1A ; OVERLORD 1A | xy: { 0x1A0, 0x0A0, U }
|09E3F5| db $08, $08, $5B ; SPRITE 5B   | xy: { 0x080, 0x080, U } | s: 0x00
|09E3F8| db $08, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x080, U } | s: 0x00
|09E3FB| db $09, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x090, U } | s: 0x00
|09E3FE| db $0B, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x0B0, U } | s: 0x00
|09E401| db $17, $05, $80 ; SPRITE 80   | xy: { 0x050, 0x170, U } | s: 0x00
|09E404| db $17, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x170, U } | s: 0x00
|09E407| db $18, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x180, U } | s: 0x00
|09E40A| db $1B, $0B, $80 ; SPRITE 80   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09E40D| db $1C, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x1C0, U } | s: 0x00
|09E410| db $07, $09, $3B ; SPRITE 3B   | xy: { 0x090, 0x070, U } | s: 0x00
|09E413| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008D:
|09E414| db $00 ; Unlayered OAM
|09E415| db $08, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x080, U }
|09E418| db $04, $07, $C6 ; SPRITE C6   | xy: { 0x070, 0x040, U } | s: 0x00
|09E41B| db $08, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x080, U } | s: 0x00
|09E41E| db $09, $08, $D1 ; SPRITE D1   | xy: { 0x080, 0x090, U } | s: 0x00
|09E421| db $0C, $09, $C6 ; SPRITE C6   | xy: { 0x090, 0x0C0, U } | s: 0x00
|09E424| db $0D, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x0D0, U } | s: 0x00
|09E427| db $0F, $EF, $09 ; OVERLORD 09 | xy: { 0x0F0, 0x0F0, U }
|09E42A| db $10, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x100, U } | s: 0x00
|09E42D| db $14, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x140, U } | s: 0x00
|09E430| db $18, $07, $7E ; SPRITE 7E   | xy: { 0x070, 0x180, U } | s: 0x00
|09E433| db $1B, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09E436| db $1C, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x1C0, U } | s: 0x00
|09E439| db $1C, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1C0, U } | s: 0x00
|09E43C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room008E:
|09E43D| db $00 ; Unlayered OAM
|09E43E| db $02, $1B, $A1 ; SPRITE A1   | xy: { 0x1B0, 0x020, U } | s: 0x00
|09E441| db $05, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x050, U } | s: 0x00
|09E444| db $06, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x060, U } | s: 0x00
|09E447| db $08, $1B, $8F ; SPRITE 8F   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09E44A| db $09, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x090, U } | s: 0x00
|09E44D| db $0A, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09E450| db $0B, $14, $8F ; SPRITE 8F   | xy: { 0x140, 0x0B0, U } | s: 0x00
|09E453| db $0B, $18, $8F ; SPRITE 8F   | xy: { 0x180, 0x0B0, U } | s: 0x00
|09E456| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0090:
|09E457| db $00 ; Unlayered OAM
|09E458| db $15, $07, $BD ; SPRITE BD   | xy: { 0x070, 0x150, U } | s: 0x00
|09E45B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0091:
|09E45C| db $00 ; Unlayered OAM
|09E45D| db $04, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x040, U } | s: 0x00
|09E460| db $0E, $1B, $8A ; SPRITE 8A   | xy: { 0x1B0, 0x0E0, U } | s: 0x00
|09E463| db $0F, $F7, $08 ; OVERLORD 08 | xy: { 0x170, 0x0F0, U }
|09E466| db $12, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x120, U } | s: 0x00
|09E469| db $12, $18, $D1 ; SPRITE D1   | xy: { 0x180, 0x120, U } | s: 0x00
|09E46C| db $12, $19, $15 ; SPRITE 15   | xy: { 0x190, 0x120, U } | s: 0x00
|09E46F| db $18, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x180, U } | s: 0x00
|09E472| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0092:
|09E473| db $00 ; Unlayered OAM
|09E474| db $09, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x090, U } | s: 0x00
|09E477| db $0C, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x0C0, U } | s: 0x00
|09E47A| db $04, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x040, U } | s: 0x00
|09E47D| db $05, $0B, $C5 ; SPRITE C5   | xy: { 0x0B0, 0x050, U } | s: 0x00
|09E480| db $08, $09, $15 ; SPRITE 15   | xy: { 0x090, 0x080, U } | s: 0x00
|09E483| db $09, $17, $C5 ; SPRITE C5   | xy: { 0x170, 0x090, U } | s: 0x00
|09E486| db $0F, $15, $C6 ; SPRITE C6   | xy: { 0x150, 0x0F0, U } | s: 0x00
|09E489| db $12, $E7, $16 ; OVERLORD 16 | xy: { 0x070, 0x120, U }
|09E48C| db $12, $19, $8A ; SPRITE 8A   | xy: { 0x190, 0x120, U } | s: 0x00
|09E48F| db $14, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x140, U } | s: 0x00
|09E492| db $16, $0A, $A7 ; SPRITE A7   | xy: { 0x0A0, 0x160, U } | s: 0x00
|09E495| db $1B, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x1B0, U } | s: 0x00
|09E498| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0093:
|09E499| db $00 ; Unlayered OAM
|09E49A| db $09, $09, $C5 ; SPRITE C5   | xy: { 0x090, 0x090, U } | s: 0x00
|09E49D| db $09, $16, $C5 ; SPRITE C5   | xy: { 0x160, 0x090, U } | s: 0x00
|09E4A0| db $0C, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09E4A3| db $0C, $13, $C5 ; SPRITE C5   | xy: { 0x130, 0x0C0, U } | s: 0x00
|09E4A6| db $0C, $17, $8F ; SPRITE 8F   | xy: { 0x170, 0x0C0, U } | s: 0x00
|09E4A9| db $15, $04, $A7 ; SPRITE A7   | xy: { 0x040, 0x150, U } | s: 0x00
|09E4AC| db $1C, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x1C0, U } | s: 0x00
|09E4AF| db $1C, $04, $15 ; SPRITE 15   | xy: { 0x040, 0x1C0, U } | s: 0x00
|09E4B2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0095:
|09E4B3| db $00 ; Unlayered OAM
|09E4B4| db $0C, $16, $43 ; SPRITE 43   | xy: { 0x160, 0x0C0, U } | s: 0x00
|09E4B7| db $0C, $17, $43 ; SPRITE 43   | xy: { 0x170, 0x0C0, U } | s: 0x00
|09E4BA| db $0C, $18, $43 ; SPRITE 43   | xy: { 0x180, 0x0C0, U } | s: 0x00
|09E4BD| db $0C, $19, $43 ; SPRITE 43   | xy: { 0x190, 0x0C0, U } | s: 0x00
|09E4C0| db $1A, $F7, $0B ; OVERLORD 0B | xy: { 0x170, 0x1A0, U }
|09E4C3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0096:
|09E4C4| db $00 ; Unlayered OAM
|09E4C5| db $0B, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x0B0, U } | s: 0x00
|09E4C8| db $15, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x150, U } | s: 0x00
|09E4CB| db $17, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x170, U } | s: 0x00
|09E4CE| db $19, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x190, U } | s: 0x00
|09E4D1| db $1B, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x1B0, U } | s: 0x00
|09E4D4| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0097:
|09E4D5| db $00 ; Unlayered OAM
|09E4D6| db $0F, $EF, $15 ; OVERLORD 15 | xy: { 0x0F0, 0x0F0, U }
|09E4D9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0098:
|09E4DA| db $00 ; Unlayered OAM
|09E4DB| db $13, $10, $8F ; SPRITE 8F   | xy: { 0x100, 0x130, U } | s: 0x00
|09E4DE| db $14, $09, $8F ; SPRITE 8F   | xy: { 0x090, 0x140, U } | s: 0x00
|09E4E1| db $14, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x140, U } | s: 0x00
|09E4E4| db $14, $0F, $8F ; SPRITE 8F   | xy: { 0x0F0, 0x140, U } | s: 0x00
|09E4E7| db $17, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x170, U } | s: 0x00
|09E4EA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0099:
|09E4EB| db $00 ; Unlayered OAM
|09E4EC| db $06, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x060, U } | s: 0x00
|09E4EF| db $08, $1A, $15 ; SPRITE 15   | xy: { 0x1A0, 0x080, U } | s: 0x00
|09E4F2| db $17, $0E, $83 ; SPRITE 83   | xy: { 0x0E0, 0x170, U } | s: 0x00
|09E4F5| db $17, $11, $83 ; SPRITE 83   | xy: { 0x110, 0x170, U } | s: 0x00
|09E4F8| db $FE, $00, $E4 ; small key on above sprite
|09E4FB| db $18, $0D, $4E ; SPRITE 4E   | xy: { 0x0D0, 0x180, U } | s: 0x00
|09E4FE| db $18, $12, $4E ; SPRITE 4E   | xy: { 0x120, 0x180, U } | s: 0x00
|09E501| db $19, $0E, $4F ; SPRITE 4F   | xy: { 0x0E0, 0x190, U } | s: 0x00
|09E504| db $19, $0F, $4F ; SPRITE 4F   | xy: { 0x0F0, 0x190, U } | s: 0x00
|09E507| db $19, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x190, U } | s: 0x00
|09E50A| db $19, $11, $4F ; SPRITE 4F   | xy: { 0x110, 0x190, U } | s: 0x00
|09E50D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009B:
|09E50E| db $00 ; Unlayered OAM
|09E50F| db $08, $06, $1E ; SPRITE 1E   | xy: { 0x060, 0x080, U } | s: 0x00
|09E512| db $08, $07, $1E ; SPRITE 1E   | xy: { 0x070, 0x080, U } | s: 0x00
|09E515| db $08, $14, $1E ; SPRITE 1E   | xy: { 0x140, 0x080, U } | s: 0x00
|09E518| db $05, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x050, U } | s: 0x00
|09E51B| db $06, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x060, U } | s: 0x00
|09E51E| db $07, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x070, U } | s: 0x00
|09E521| db $08, $03, $C6 ; SPRITE C6   | xy: { 0x030, 0x080, U } | s: 0x00
|09E524| db $08, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x080, U } | s: 0x00
|09E527| db $09, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x090, U } | s: 0x00
|09E52A| db $0A, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x0A0, U } | s: 0x00
|09E52D| db $0B, $1C, $8A ; SPRITE 8A   | xy: { 0x1C0, 0x0B0, U } | s: 0x00
|09E530| db $1A, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09E533| db $1B, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x1B0, U } | s: 0x00
|09E536| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009C:
|09E537| db $00 ; Unlayered OAM
|09E538| db $09, $13, $26 ; SPRITE 26   | xy: { 0x130, 0x090, U } | s: 0x00
|09E53B| db $0A, $0B, $13 ; SPRITE 13   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
|09E53E| db $0F, $11, $26 ; SPRITE 26   | xy: { 0x110, 0x0F0, U } | s: 0x00
|09E541| db $0E, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x0E0, U } | s: 0x00
|09E544| db $12, $0D, $26 ; SPRITE 26   | xy: { 0x0D0, 0x120, U } | s: 0x00
|09E547| db $13, $09, $26 ; SPRITE 26   | xy: { 0x090, 0x130, U } | s: 0x00
|09E54A| db $1C, $0F, $80 ; SPRITE 80   | xy: { 0x0F0, 0x1C0, U } | s: 0x00
|09E54D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009D:
|09E54E| db $00 ; Unlayered OAM
|09E54F| db $06, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x060, U } | s: 0x00
|09E552| db $04, $06, $26 ; SPRITE 26   | xy: { 0x060, 0x040, U } | s: 0x00
|09E555| db $04, $14, $8B ; SPRITE 8B   | xy: { 0x140, 0x040, U } | s: 0x00
|09E558| db $09, $18, $8B ; SPRITE 8B   | xy: { 0x180, 0x090, U } | s: 0x00
|09E55B| db $0C, $05, $26 ; SPRITE 26   | xy: { 0x050, 0x0C0, U } | s: 0x00
|09E55E| db $0C, $13, $8B ; SPRITE 8B   | xy: { 0x130, 0x0C0, U } | s: 0x00
|09E561| db $14, $10, $24 ; SPRITE 24   | xy: { 0x100, 0x140, U } | s: 0x00
|09E564| db $18, $0B, $24 ; SPRITE 24   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E567| db $1C, $11, $24 ; SPRITE 24   | xy: { 0x110, 0x1C0, U } | s: 0x00
|09E56A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009E:
|09E56B| db $00 ; Unlayered OAM
|09E56C| db $05, $18, $23 ; SPRITE 23   | xy: { 0x180, 0x050, U } | s: 0x00
|09E56F| db $08, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x080, U } | s: 0x00
|09E572| db $08, $18, $91 ; SPRITE 91   | xy: { 0x180, 0x080, U } | s: 0x00
|09E575| db $08, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x080, U } | s: 0x00
|09E578| db $12, $14, $A1 ; SPRITE A1   | xy: { 0x140, 0x120, U } | s: 0x00
|09E57B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room009F:
|09E57C| db $00 ; Unlayered OAM
|09E57D| db $12, $04, $9D ; SPRITE 9D   | xy: { 0x040, 0x120, U } | s: 0x00
|09E580| db $12, $06, $9D ; SPRITE 9D   | xy: { 0x060, 0x120, U } | s: 0x00
|09E583| db $12, $09, $9D ; SPRITE 9D   | xy: { 0x090, 0x120, U } | s: 0x00
|09E586| db $12, $0B, $9D ; SPRITE 9D   | xy: { 0x0B0, 0x120, U } | s: 0x00
|09E589| db $17, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x170, U } | s: 0x00
|09E58C| db $18, $08, $7E ; SPRITE 7E   | xy: { 0x080, 0x180, U } | s: 0x00
|09E58F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A0:
|09E590| db $00 ; Unlayered OAM
|09E591| db $08, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x080, U } | s: 0x00
|09E594| db $08, $0E, $15 ; SPRITE 15   | xy: { 0x0E0, 0x080, U } | s: 0x00
|09E597| db $0C, $14, $80 ; SPRITE 80   | xy: { 0x140, 0x0C0, U } | s: 0x00
|09E59A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A1:
|09E59B| db $00 ; Unlayered OAM
|09E59C| db $08, $0A, $1E ; SPRITE 1E   | xy: { 0x0A0, 0x080, U } | s: 0x00
|09E59F| db $07, $18, $5B ; SPRITE 5B   | xy: { 0x180, 0x070, U } | s: 0x00
|09E5A2| db $0B, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x0B0, U } | s: 0x00
|09E5A5| db $10, $19, $9B ; SPRITE 9B   | xy: { 0x190, 0x100, U } | s: 0x00
|09E5A8| db $15, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x150, U } | s: 0x00
|09E5AB| db $15, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x150, U } | s: 0x00
|09E5AE| db $19, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x190, U } | s: 0x00
|09E5B1| db $19, $17, $D1 ; SPRITE D1   | xy: { 0x170, 0x190, U } | s: 0x00
|09E5B4| db $19, $1B, $A7 ; SPRITE A7   | xy: { 0x1B0, 0x190, U } | s: 0x00
|09E5B7| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A3:
|09E5B8| db $00 ; Unlayered OAM
|09E5B9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A4:
|09E5BA| db $00 ; Unlayered OAM
|09E5BB| db $15, $07, $CB ; SPRITE CB   | xy: { 0x070, 0x150, U } | s: 0x00
|09E5BE| db $15, $07, $CC ; SPRITE CC   | xy: { 0x070, 0x150, U } | s: 0x00
|09E5C1| db $15, $07, $CD ; SPRITE CD   | xy: { 0x070, 0x150, U } | s: 0x00
|09E5C4| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A5:
|09E5C5| db $00 ; Unlayered OAM
|09E5C6| db $05, $16, $9B ; SPRITE 9B   | xy: { 0x160, 0x050, U } | s: 0x00
|09E5C9| db $05, $19, $9B ; SPRITE 9B   | xy: { 0x190, 0x050, U } | s: 0x00
|09E5CC| db $07, $04, $9B ; SPRITE 9B   | xy: { 0x040, 0x070, U } | s: 0x00
|09E5CF| db $07, $0B, $9B ; SPRITE 9B   | xy: { 0x0B0, 0x070, U } | s: 0x00
|09E5D2| db $08, $17, $8A ; SPRITE 8A   | xy: { 0x170, 0x080, U } | s: 0x00
|09E5D5| db $09, $15, $9B ; SPRITE 9B   | xy: { 0x150, 0x090, U } | s: 0x00
|09E5D8| db $09, $1A, $9B ; SPRITE 9B   | xy: { 0x1A0, 0x090, U } | s: 0x00
|09E5DB| db $0A, $08, $9B ; SPRITE 9B   | xy: { 0x080, 0x0A0, U } | s: 0x00
|09E5DE| db $12, $0C, $97 ; SPRITE 97   | xy: { 0x0C0, 0x120, U } | s: 0x00
|09E5E1| db $12, $12, $97 ; SPRITE 97   | xy: { 0x120, 0x120, U } | s: 0x00
|09E5E4| db $17, $12, $43 ; SPRITE 43   | xy: { 0x120, 0x170, U } | s: 0x00
|09E5E7| db $18, $13, $41 ; SPRITE 41   | xy: { 0x130, 0x180, U } | s: 0x00
|09E5EA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A6:
|09E5EB| db $00 ; Unlayered OAM
|09E5EC| db $0F, $EF, $15 ; OVERLORD 15 | xy: { 0x0F0, 0x0F0, U }
|09E5EF| db $0E, $0C, $15 ; SPRITE 15   | xy: { 0x0C0, 0x0E0, U } | s: 0x00
|09E5F2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A7:
|09E5F3| db $00 ; Unlayered OAM
|09E5F4| db $08, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x080, U } | s: 0x00
|09E5F7| db $09, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x090, U } | s: 0x00
|09E5FA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A8:
|09E5FB| db $01 ; Layered OAM
|09E5FC| db $0E, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x0E0, U } | s: 0x00
|09E5FF| db $0E, $1A, $A7 ; SPRITE A7   | xy: { 0x1A0, 0x0E0, U } | s: 0x00
|09E602| db $12, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x120, U } | s: 0x00
|09E605| db $12, $1A, $A7 ; SPRITE A7   | xy: { 0x1A0, 0x120, U } | s: 0x00
|09E608| db $16, $E8, $18 ; OVERLORD 18 | xy: { 0x080, 0x160, U }
|09E60B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00A9:
|09E60C| db $00 ; Unlayered OAM
|09E60D| db $85, $09, $83 ; SPRITE 83   | xy: { 0x090, 0x050, L } | s: 0x00
|09E610| db $85, $16, $83 ; SPRITE 83   | xy: { 0x160, 0x050, L } | s: 0x00
|09E613| db $8C, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x0C0, L }
|09E616| db $8C, $F2, $05 ; OVERLORD 05 | xy: { 0x120, 0x0C0, L }
|09E619| db $92, $ED, $05 ; OVERLORD 05 | xy: { 0x0D0, 0x120, L }
|09E61C| db $92, $F2, $05 ; OVERLORD 05 | xy: { 0x120, 0x120, L }
|09E61F| db $90, $0A, $A7 ; SPRITE A7   | xy: { 0x0A0, 0x100, L } | s: 0x00
|09E622| db $90, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x100, L } | s: 0x00
|09E625| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AA:
|09E626| db $01 ; Layered OAM
|09E627| db $06, $18, $15 ; SPRITE 15   | xy: { 0x180, 0x060, U } | s: 0x00
|09E62A| db $07, $0A, $4F ; SPRITE 4F   | xy: { 0x0A0, 0x070, U } | s: 0x00
|09E62D| db $0B, $06, $A7 ; SPRITE A7   | xy: { 0x060, 0x0B0, U } | s: 0x00
|09E630| db $0C, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x0C0, U } | s: 0x00
|09E633| db $13, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x130, U } | s: 0x00
|09E636| db $14, $0A, $4F ; SPRITE 4F   | xy: { 0x0A0, 0x140, U } | s: 0x00
|09E639| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AB:
|09E63A| db $00 ; Unlayered OAM
|09E63B| db $18, $04, $1E ; SPRITE 1E   | xy: { 0x040, 0x180, U } | s: 0x00
|09E63E| db $15, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x150, U } | s: 0x00
|09E641| db $16, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x160, U } | s: 0x00
|09E644| db $17, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x170, U } | s: 0x00
|09E647| db $18, $06, $8F ; SPRITE 8F   | xy: { 0x060, 0x180, U } | s: 0x00
|09E64A| db $19, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x190, U } | s: 0x00
|09E64D| db $1A, $0C, $8A ; SPRITE 8A   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
|09E650| db $1B, $03, $8A ; SPRITE 8A   | xy: { 0x030, 0x1B0, U } | s: 0x00
|09E653| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AC:
|09E654| db $00 ; Unlayered OAM
|09E655| db $15, $19, $CE ; SPRITE CE   | xy: { 0x190, 0x150, U } | s: 0x00
|09E658| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AE:
|09E659| db $00 ; Unlayered OAM
|09E65A| db $07, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x070, U } | s: 0x00
|09E65D| db $07, $15, $24 ; SPRITE 24   | xy: { 0x150, 0x070, U } | s: 0x00
|09E660| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00AF:
|09E661| db $00 ; Unlayered OAM
|09E662| db $08, $0A, $7E ; SPRITE 7E   | xy: { 0x0A0, 0x080, U } | s: 0x00
|09E665| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B0:
|09E666| db $00 ; Unlayered OAM
|09E667| db $07, $07, $43 ; SPRITE 43   | xy: { 0x070, 0x070, U } | s: 0x00
|09E66A| db $07, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x070, U } | s: 0x00
|09E66D| db $07, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x070, U } | s: 0x00
|09E670| db $08, $14, $48 ; SPRITE 48   | xy: { 0x140, 0x080, U } | s: 0x00
|09E673| db $08, $1B, $48 ; SPRITE 48   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09E676| db $0B, $05, $43 ; SPRITE 43   | xy: { 0x050, 0x0B0, U } | s: 0x00
|09E679| db $14, $16, $6A ; SPRITE 6A   | xy: { 0x160, 0x140, U } | s: 0x00
|09E67C| db $16, $04, $6F ; SPRITE 6F   | xy: { 0x040, 0x160, U } | s: 0x00
|09E67F| db $16, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x160, U } | s: 0x00
|09E682| db $16, $0A, $43 ; SPRITE 43   | xy: { 0x0A0, 0x160, U } | s: 0x00
|09E685| db $18, $08, $43 ; SPRITE 43   | xy: { 0x080, 0x180, U } | s: 0x00
|09E688| db $FE, $00, $E4 ; small key on above sprite
|09E68B| db $1A, $1B, $44 ; SPRITE 44   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
|09E68E| db $1C, $17, $48 ; SPRITE 48   | xy: { 0x170, 0x1C0, U } | s: 0x00
|09E691| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B1:
|09E692| db $00 ; Unlayered OAM
|09E693| db $07, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x070, U } | s: 0x00
|09E696| db $07, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x070, U } | s: 0x00
|09E699| db $0E, $16, $8A ; SPRITE 8A   | xy: { 0x160, 0x0E0, U } | s: 0x00
|09E69C| db $11, $19, $8A ; SPRITE 8A   | xy: { 0x190, 0x110, U } | s: 0x00
|09E69F| db $17, $0C, $9B ; SPRITE 9B   | xy: { 0x0C0, 0x170, U } | s: 0x00
|09E6A2| db $17, $1A, $7D ; SPRITE 7D   | xy: { 0x1A0, 0x170, U } | s: 0x00
|09E6A5| db $18, $07, $C6 ; SPRITE C6   | xy: { 0x070, 0x180, U } | s: 0x00
|09E6A8| db $1A, $03, $9B ; SPRITE 9B   | xy: { 0x030, 0x1A0, U } | s: 0x00
|09E6AB| db $1A, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x1A0, U } | s: 0x00
|09E6AE| db $1C, $08, $9B ; SPRITE 9B   | xy: { 0x080, 0x1C0, U } | s: 0x00
|09E6B1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B2:
|09E6B2| db $01 ; Layered OAM
|09E6B3| db $88, $14, $9B ; SPRITE 9B   | xy: { 0x140, 0x080, L } | s: 0x00
|09E6B6| db $8A, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x0A0, L } | s: 0x00
|09E6B9| db $8A, $12, $15 ; SPRITE 15   | xy: { 0x120, 0x0A0, L } | s: 0x00
|09E6BC| db $8A, $13, $D1 ; SPRITE D1   | xy: { 0x130, 0x0A0, L } | s: 0x00
|09E6BF| db $8B, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x0B0, L } | s: 0x00
|09E6C2| db $15, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x150, U } | s: 0x00
|09E6C5| db $15, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x150, U } | s: 0x00
|09E6C8| db $16, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x160, U } | s: 0x00
|09E6CB| db $18, $15, $C5 ; SPRITE C5   | xy: { 0x150, 0x180, U } | s: 0x00
|09E6CE| db $18, $1A, $C5 ; SPRITE C5   | xy: { 0x1A0, 0x180, U } | s: 0x00
|09E6D1| db $1B, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x1B0, U } | s: 0x00
|09E6D4| db $1B, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09E6D7| db $1B, $14, $4E ; SPRITE 4E   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09E6DA| db $1B, $1B, $4E ; SPRITE 4E   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
|09E6DD| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B3:
|09E6DE| db $00 ; Unlayered OAM
|09E6DF| db $15, $03, $A7 ; SPRITE A7   | xy: { 0x030, 0x150, U } | s: 0x00
|09E6E2| db $15, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x150, U } | s: 0x00
|09E6E5| db $18, $06, $61 ; SPRITE 61   | xy: { 0x060, 0x180, U } | s: 0x00
|09E6E8| db $1A, $0A, $C6 ; SPRITE C6   | xy: { 0x0A0, 0x1A0, U } | s: 0x00
|09E6EB| db $1C, $07, $A7 ; SPRITE A7   | xy: { 0x070, 0x1C0, U } | s: 0x00
|09E6EE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B5:
|09E6EF| db $00 ; Unlayered OAM
|09E6F0| db $0A, $16, $7E ; SPRITE 7E   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09E6F3| db $0F, $09, $7E ; SPRITE 7E   | xy: { 0x090, 0x0F0, U } | s: 0x00
|09E6F6| db $16, $16, $7E ; SPRITE 7E   | xy: { 0x160, 0x160, U } | s: 0x00
|09E6F9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B6:
|09E6FA| db $00 ; Unlayered OAM
|09E6FB| db $07, $06, $CA ; SPRITE CA   | xy: { 0x060, 0x070, U } | s: 0x00
|09E6FE| db $07, $0A, $CA ; SPRITE CA   | xy: { 0x0A0, 0x070, U } | s: 0x00
|09E701| db $04, $03, $1E ; SPRITE 1E   | xy: { 0x030, 0x040, U } | s: 0x00
|09E704| db $04, $0C, $1E ; SPRITE 1E   | xy: { 0x0C0, 0x040, U } | s: 0x00
|09E707| db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
|09E70A| db $15, $07, $C7 ; SPRITE C7   | xy: { 0x070, 0x150, U } | s: 0x00
|09E70D| db $FE, $00, $E4 ; small key on above sprite
|09E710| db $18, $F7, $14 ; OVERLORD 14 | xy: { 0x170, 0x180, U }
|09E713| db $1B, $07, $8F ; SPRITE 8F   | xy: { 0x070, 0x1B0, U } | s: 0x00
|09E716| db $1B, $08, $8F ; SPRITE 8F   | xy: { 0x080, 0x1B0, U } | s: 0x00
|09E719| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B7:
|09E71A| db $00 ; Unlayered OAM
|09E71B| db $09, $04, $5F ; SPRITE 5F   | xy: { 0x040, 0x090, U } | s: 0x00
|09E71E| db $11, $04, $5D ; SPRITE 5D   | xy: { 0x040, 0x110, U } | s: 0x00
|09E721| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B8:
|09E722| db $00 ; Unlayered OAM
|09E723| db $0B, $15, $4E ; SPRITE 4E   | xy: { 0x150, 0x0B0, U } | s: 0x00
|09E726| db $0B, $1B, $4E ; SPRITE 4E   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09E729| db $0D, $18, $82 ; SPRITE 82   | xy: { 0x180, 0x0D0, U } | s: 0x00
|09E72C| db $13, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x130, U } | s: 0x00
|09E72F| db $16, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x160, U } | s: 0x00
|09E732| db $16, $1C, $A7 ; SPRITE A7   | xy: { 0x1C0, 0x160, U } | s: 0x00
|09E735| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00B9:
|09E736| db $01 ; Layered OAM
|09E737| db $85, $F1, $03 ; OVERLORD 03 | xy: { 0x110, 0x050, L }
|09E73A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BA:
|09E73B| db $00 ; Unlayered OAM
|09E73C| db $04, $14, $A7 ; SPRITE A7   | xy: { 0x140, 0x040, U } | s: 0x00
|09E73F| db $06, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x060, U } | s: 0x00
|09E742| db $06, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x060, U } | s: 0x00
|09E745| db $09, $03, $15 ; SPRITE 15   | xy: { 0x030, 0x090, U } | s: 0x00
|09E748| db $09, $0C, $4F ; SPRITE 4F   | xy: { 0x0C0, 0x090, U } | s: 0x00
|09E74B| db $0A, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09E74E| db $0C, $08, $4F ; SPRITE 4F   | xy: { 0x080, 0x0C0, U } | s: 0x00
|09E751| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BB:
|09E752| db $00 ; Unlayered OAM
|09E753| db $04, $1B, $A6 ; SPRITE A6   | xy: { 0x1B0, 0x040, U } | s: 0x00
|09E756| db $0A, $06, $C3 ; SPRITE C3   | xy: { 0x060, 0x0A0, U } | s: 0x00
|09E759| db $0A, $16, $A6 ; SPRITE A6   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09E75C| db $0A, $19, $C3 ; SPRITE C3   | xy: { 0x190, 0x0A0, U } | s: 0x00
|09E75F| db $0C, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x0C0, U } | s: 0x00
|09E762| db $0E, $09, $C3 ; SPRITE C3   | xy: { 0x090, 0x0E0, U } | s: 0x00
|09E765| db $10, $07, $80 ; SPRITE 80   | xy: { 0x070, 0x100, U } | s: 0x00
|09E768| db $14, $08, $C3 ; SPRITE C3   | xy: { 0x080, 0x140, U } | s: 0x00
|09E76B| db $15, $19, $C3 ; SPRITE C3   | xy: { 0x190, 0x150, U } | s: 0x00
|09E76E| db $16, $15, $15 ; SPRITE 15   | xy: { 0x150, 0x160, U } | s: 0x00
|09E771| db $1A, $17, $C3 ; SPRITE C3   | xy: { 0x170, 0x1A0, U } | s: 0x00
|09E774| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BC:
|09E775| db $00 ; Unlayered OAM
|09E776| db $05, $06, $A5 ; SPRITE A5   | xy: { 0x060, 0x050, U } | s: 0x00
|09E779| db $05, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x050, U } | s: 0x00
|09E77C| db $06, $08, $8A ; SPRITE 8A   | xy: { 0x080, 0x060, U } | s: 0x00
|09E77F| db $09, $0A, $A6 ; SPRITE A6   | xy: { 0x0A0, 0x090, U } | s: 0x00
|09E782| db $0A, $09, $8A ; SPRITE 8A   | xy: { 0x090, 0x0A0, U } | s: 0x00
|09E785| db $0B, $05, $A5 ; SPRITE A5   | xy: { 0x050, 0x0B0, U } | s: 0x00
|09E788| db $0A, $17, $A7 ; SPRITE A7   | xy: { 0x170, 0x0A0, U } | s: 0x00
|09E78B| db $11, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x110, U } | s: 0x00
|09E78E| db $16, $16, $A7 ; SPRITE A7   | xy: { 0x160, 0x160, U } | s: 0x00
|09E791| db $17, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x170, U } | s: 0x00
|09E794| db $18, $07, $80 ; SPRITE 80   | xy: { 0x070, 0x180, U } | s: 0x00
|09E797| db $19, $08, $A6 ; SPRITE A6   | xy: { 0x080, 0x190, U } | s: 0x00
|09E79A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BD:
|09E79B| db $00 ; Unlayered OAM
|09E79C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BE:
|09E79D| db $00 ; Unlayered OAM
|09E79E| db $08, $17, $15 ; SPRITE 15   | xy: { 0x170, 0x080, U } | s: 0x00
|09E7A1| db $12, $14, $A1 ; SPRITE A1   | xy: { 0x140, 0x120, U } | s: 0x00
|09E7A4| db $15, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x150, U } | s: 0x00
|09E7A7| db $15, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x150, U } | s: 0x00
|09E7AA| db $16, $18, $91 ; SPRITE 91   | xy: { 0x180, 0x160, U } | s: 0x00
|09E7AD| db $1A, $14, $24 ; SPRITE 24   | xy: { 0x140, 0x1A0, U } | s: 0x00
|09E7B0| db $1A, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x1A0, U } | s: 0x00
|09E7B3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00BF:
|09E7B4| db $00 ; Unlayered OAM
|09E7B5| db $18, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x180, U } | s: 0x00
|09E7B8| db $15, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x150, U } | s: 0x00
|09E7BB| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C0:
|09E7BC| db $00 ; Unlayered OAM
|09E7BD| db $05, $17, $41 ; SPRITE 41   | xy: { 0x170, 0x050, U } | s: 0x00
|09E7C0| db $07, $1A, $46 ; SPRITE 46   | xy: { 0x1A0, 0x070, U } | s: 0x00
|09E7C3| db $09, $0B, $41 ; SPRITE 41   | xy: { 0x0B0, 0x090, U } | s: 0x00
|09E7C6| db $0B, $14, $46 ; SPRITE 46   | xy: { 0x140, 0x0B0, U } | s: 0x00
|09E7C9| db $FE, $00, $E4 ; small key on above sprite
|09E7CC| db $0E, $06, $41 ; SPRITE 41   | xy: { 0x060, 0x0E0, U } | s: 0x00
|09E7CF| db $18, $04, $41 ; SPRITE 41   | xy: { 0x040, 0x180, U } | s: 0x00
|09E7D2| db $1B, $14, $46 ; SPRITE 46   | xy: { 0x140, 0x1B0, U } | s: 0x00
|09E7D5| db $1B, $1B, $41 ; SPRITE 41   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
|09E7D8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C1:
|09E7D9| db $00 ; Unlayered OAM
|09E7DA| db $17, $15, $1E ; SPRITE 1E   | xy: { 0x150, 0x170, U } | s: 0x00
|09E7DD| db $05, $14, $C5 ; SPRITE C5   | xy: { 0x140, 0x050, U } | s: 0x00
|09E7E0| db $05, $1B, $C5 ; SPRITE C5   | xy: { 0x1B0, 0x050, U } | s: 0x00
|09E7E3| db $0B, $06, $A7 ; SPRITE A7   | xy: { 0x060, 0x0B0, U } | s: 0x00
|09E7E6| db $0B, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x0B0, U } | s: 0x00
|09E7E9| db $15, $17, $7C ; SPRITE 7C   | xy: { 0x170, 0x150, U } | s: 0x00
|09E7EC| db $16, $09, $C5 ; SPRITE C5   | xy: { 0x090, 0x160, U } | s: 0x00
|09E7EF| db $18, $E7, $14 ; OVERLORD 14 | xy: { 0x070, 0x180, U }
|09E7F2| db $19, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x190, U } | s: 0x00
|09E7F5| db $1A, $18, $C6 ; SPRITE C6   | xy: { 0x180, 0x1A0, U } | s: 0x00
|09E7F8| db $1B, $13, $24 ; SPRITE 24   | xy: { 0x130, 0x1B0, U } | s: 0x00
|09E7FB| db $FE, $00, $E4 ; small key on above sprite
|09E7FE| db $1B, $1B, $7C ; SPRITE 7C   | xy: { 0x1B0, 0x1B0, U } | s: 0x00
|09E801| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C2:
|09E802| db $01 ; Layered OAM
|09E803| db $8B, $15, $80 ; SPRITE 80   | xy: { 0x150, 0x0B0, L } | s: 0x00
|09E806| db $0C, $0B, $80 ; SPRITE 80   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
|09E809| db $10, $08, $C5 ; SPRITE C5   | xy: { 0x080, 0x100, U } | s: 0x00
|09E80C| db $92, $10, $5B ; SPRITE 5B   | xy: { 0x100, 0x120, L } | s: 0x00
|09E80F| db $92, $19, $5B ; SPRITE 5B   | xy: { 0x190, 0x120, L } | s: 0x00
|09E812| db $94, $10, $D1 ; SPRITE D1   | xy: { 0x100, 0x140, L } | s: 0x00
|09E815| db $96, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x160, L } | s: 0x00
|09E818| db $96, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x160, L } | s: 0x00
|09E81B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C3:
|09E81C| db $00 ; Unlayered OAM
|09E81D| db $06, $05, $C5 ; SPRITE C5   | xy: { 0x050, 0x060, U } | s: 0x00
|09E820| db $09, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x090, U } | s: 0x00
|09E823| db $0D, $11, $95 ; SPRITE 95   | xy: { 0x110, 0x0D0, U } | s: 0x00
|09E826| db $11, $1E, $96 ; SPRITE 96   | xy: { 0x1E0, 0x110, U } | s: 0x00
|09E829| db $15, $11, $95 ; SPRITE 95   | xy: { 0x110, 0x150, U } | s: 0x00
|09E82C| db $1A, $F7, $0B ; OVERLORD 0B | xy: { 0x170, 0x1A0, U }
|09E82F| db $1B, $0A, $15 ; SPRITE 15   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
|09E832| db $1C, $07, $C5 ; SPRITE C5   | xy: { 0x070, 0x1C0, U } | s: 0x00
|09E835| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C4:
|09E836| db $00 ; Unlayered OAM
|09E837| db $0A, $0B, $1E ; SPRITE 1E   | xy: { 0x0B0, 0x0A0, U } | s: 0x00
|09E83A| db $0F, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x0F0, U } | s: 0x00
|09E83D| db $1B, $1C, $1E ; SPRITE 1E   | xy: { 0x1C0, 0x1B0, U } | s: 0x00
|09E840| db $15, $0F, $1E ; SPRITE 1E   | xy: { 0x0F0, 0x150, U } | s: 0x00
|09E843| db $0E, $0F, $C7 ; SPRITE C7   | xy: { 0x0F0, 0x0E0, U } | s: 0x00
|09E846| db $0F, $0B, $15 ; SPRITE 15   | xy: { 0x0B0, 0x0F0, U } | s: 0x00
|09E849| db $14, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x140, U } | s: 0x00
|09E84C| db $14, $18, $13 ; SPRITE 13   | xy: { 0x180, 0x140, U } | s: 0x00
|09E84F| db $1A, $0B, $15 ; SPRITE 15   | xy: { 0x0B0, 0x1A0, U } | s: 0x00
|09E852| db $1A, $14, $15 ; SPRITE 15   | xy: { 0x140, 0x1A0, U } | s: 0x00
|09E855| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C5:
|09E856| db $00 ; Unlayered OAM
|09E857| db $09, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x090, U } | s: 0x00
|09E85A| db $0B, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0B0, U } | s: 0x00
|09E85D| db $0D, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x0D0, U } | s: 0x00
|09E860| db $0F, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0F0, U } | s: 0x00
|09E863| db $11, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x110, U } | s: 0x00
|09E866| db $13, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x130, U } | s: 0x00
|09E869| db $15, $07, $13 ; SPRITE 13   | xy: { 0x070, 0x150, U } | s: 0x00
|09E86C| db $15, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x150, U } | s: 0x00
|09E86F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C6:
|09E870| db $00 ; Unlayered OAM
|09E871| db $04, $0B, $A7 ; SPRITE A7   | xy: { 0x0B0, 0x040, U } | s: 0x00
|09E874| db $04, $15, $A7 ; SPRITE A7   | xy: { 0x150, 0x040, U } | s: 0x00
|09E877| db $09, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x090, U } | s: 0x00
|09E87A| db $09, $17, $24 ; SPRITE 24   | xy: { 0x170, 0x090, U } | s: 0x00
|09E87D| db $0E, $10, $7C ; SPRITE 7C   | xy: { 0x100, 0x0E0, U } | s: 0x00
|09E880| db $14, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x140, U } | s: 0x00
|09E883| db $17, $08, $24 ; SPRITE 24   | xy: { 0x080, 0x170, U } | s: 0x00
|09E886| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C8:
|09E887| db $00 ; Unlayered OAM
|09E888| db $15, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x150, U } | s: 0x00
|09E88B| db $15, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x150, U } | s: 0x00
|09E88E| db $15, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x150, U } | s: 0x00
|09E891| db $18, $1A, $53 ; SPRITE 53   | xy: { 0x1A0, 0x180, U } | s: 0x00
|09E894| db $18, $17, $53 ; SPRITE 53   | xy: { 0x170, 0x180, U } | s: 0x00
|09E897| db $18, $14, $53 ; SPRITE 53   | xy: { 0x140, 0x180, U } | s: 0x00
|09E89A| db $18, $F7, $19 ; OVERLORD 19 | xy: { 0x170, 0x180, U }
|09E89D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00C9:
|09E89E| db $00 ; Unlayered OAM
|09E89F| db $05, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x050, U } | s: 0x00
|09E8A2| db $06, $0F, $4F ; SPRITE 4F   | xy: { 0x0F0, 0x060, U } | s: 0x00
|09E8A5| db $07, $10, $4F ; SPRITE 4F   | xy: { 0x100, 0x070, U } | s: 0x00
|09E8A8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CB:
|09E8A9| db $01 ; Layered OAM
|09E8AA| db $04, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x040, U } | s: 0x00
|09E8AD| db $89, $08, $80 ; SPRITE 80   | xy: { 0x080, 0x090, L } | s: 0x00
|09E8B0| db $8A, $10, $A5 ; SPRITE A5   | xy: { 0x100, 0x0A0, L } | s: 0x00
|09E8B3| db $0A, $13, $8F ; SPRITE 8F   | xy: { 0x130, 0x0A0, U } | s: 0x00
|09E8B6| db $8A, $16, $5B ; SPRITE 5B   | xy: { 0x160, 0x0A0, L } | s: 0x00
|09E8B9| db $0A, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x0A0, U } | s: 0x00
|09E8BC| db $10, $0C, $A7 ; SPRITE A7   | xy: { 0x0C0, 0x100, U } | s: 0x00
|09E8BF| db $95, $18, $A6 ; SPRITE A6   | xy: { 0x180, 0x150, L } | s: 0x00
|09E8C2| db $97, $08, $A6 ; SPRITE A6   | xy: { 0x080, 0x170, L } | s: 0x00
|09E8C5| db $17, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x170, U } | s: 0x00
|09E8C8| db $18, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x180, U } | s: 0x00
|09E8CB| db $1C, $14, $D1 ; SPRITE D1   | xy: { 0x140, 0x1C0, U } | s: 0x00
|09E8CE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CC:
|09E8CF| db $01 ; Layered OAM
|09E8D0| db $04, $13, $80 ; SPRITE 80   | xy: { 0x130, 0x040, U } | s: 0x00
|09E8D3| db $89, $0B, $D1 ; SPRITE D1   | xy: { 0x0B0, 0x090, L } | s: 0x00
|09E8D6| db $8A, $08, $A5 ; SPRITE A5   | xy: { 0x080, 0x0A0, L } | s: 0x00
|09E8D9| db $8A, $0E, $5B ; SPRITE 5B   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
|09E8DC| db $0B, $0C, $8F ; SPRITE 8F   | xy: { 0x0C0, 0x0B0, U } | s: 0x00
|09E8DF| db $8C, $10, $A6 ; SPRITE A6   | xy: { 0x100, 0x0C0, L } | s: 0x00
|09E8E2| db $8C, $18, $A5 ; SPRITE A5   | xy: { 0x180, 0x0C0, L } | s: 0x00
|09E8E5| db $94, $0E, $80 ; SPRITE 80   | xy: { 0x0E0, 0x140, L } | s: 0x00
|09E8E8| db $15, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x150, U } | s: 0x00
|09E8EB| db $96, $06, $5B ; SPRITE 5B   | xy: { 0x060, 0x160, L } | s: 0x00
|09E8EE| db $96, $09, $5B ; SPRITE 5B   | xy: { 0x090, 0x160, L } | s: 0x00
|09E8F1| db $98, $09, $A6 ; SPRITE A6   | xy: { 0x090, 0x180, L } | s: 0x00
|09E8F4| db $16, $1C, $8F ; SPRITE 8F   | xy: { 0x1C0, 0x160, U } | s: 0x00
|09E8F7| db $9C, $07, $D1 ; SPRITE D1   | xy: { 0x070, 0x1C0, L } | s: 0x00
|09E8FA| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00CE:
|09E8FB| db $00 ; Unlayered OAM
|09E8FC| db $05, $16, $23 ; SPRITE 23   | xy: { 0x160, 0x050, U } | s: 0x00
|09E8FF| db $05, $19, $23 ; SPRITE 23   | xy: { 0x190, 0x050, U } | s: 0x00
|09E902| db $05, $1C, $04 ; SPRITE 04   | xy: { 0x1C0, 0x050, U } | s: 0x00
|09E905| db $09, $14, $1C ; SPRITE 1C   | xy: { 0x140, 0x090, U } | s: 0x00
|09E908| db $08, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09E90B| db $08, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x080, U } | s: 0x00
|09E90E| db $09, $1B, $24 ; SPRITE 24   | xy: { 0x1B0, 0x090, U } | s: 0x00
|09E911| db $09, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x090, U } | s: 0x00
|09E914| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D0:
|09E915| db $00 ; Unlayered OAM
|09E916| db $05, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x050, U } | s: 0x00
|09E919| db $07, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x070, U } | s: 0x00
|09E91C| db $07, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x070, U } | s: 0x00
|09E91F| db $0B, $15, $44 ; SPRITE 44   | xy: { 0x150, 0x0B0, U } | s: 0x00
|09E922| db $0C, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x0C0, U } | s: 0x00
|09E925| db $0F, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x0F0, U } | s: 0x00
|09E928| db $10, $63, $41 ; SPRITE 41   | xy: { 0x030, 0x100, U } | s: 0x03
|09E92B| db $14, $09, $41 ; SPRITE 41   | xy: { 0x090, 0x140, U } | s: 0x00
|09E92E| db $16, $1B, $44 ; SPRITE 44   | xy: { 0x1B0, 0x160, U } | s: 0x00
|09E931| db $19, $06, $6F ; SPRITE 6F   | xy: { 0x060, 0x190, U } | s: 0x00
|09E934| db $19, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x190, U } | s: 0x00
|09E937| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D1:
|09E938| db $00 ; Unlayered OAM
|09E939| db $06, $14, $61 ; SPRITE 61   | xy: { 0x140, 0x060, U } | s: 0x00
|09E93C| db $06, $1B, $61 ; SPRITE 61   | xy: { 0x1B0, 0x060, U } | s: 0x00
|09E93F| db $07, $04, $9B ; SPRITE 9B   | xy: { 0x040, 0x070, U } | s: 0x00
|09E942| db $08, $0C, $23 ; SPRITE 23   | xy: { 0x0C0, 0x080, U } | s: 0x00
|09E945| db $09, $05, $C6 ; SPRITE C6   | xy: { 0x050, 0x090, U } | s: 0x00
|09E948| db $0B, $04, $20 ; SPRITE 20   | xy: { 0x040, 0x0B0, U } | s: 0x00
|09E94B| db $0B, $0B, $20 ; SPRITE 20   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
|09E94E| db $0B, $1B, $20 ; SPRITE 20   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09E951| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D2:
|09E952| db $00 ; Unlayered OAM
|09E953| db $06, $18, $9B ; SPRITE 9B   | xy: { 0x180, 0x060, U } | s: 0x00
|09E956| db $07, $1A, $4E ; SPRITE 4E   | xy: { 0x1A0, 0x070, U } | s: 0x00
|09E959| db $08, $13, $9B ; SPRITE 9B   | xy: { 0x130, 0x080, U } | s: 0x00
|09E95C| db $08, $1C, $9B ; SPRITE 9B   | xy: { 0x1C0, 0x080, U } | s: 0x00
|09E95F| db $0A, $18, $61 ; SPRITE 61   | xy: { 0x180, 0x0A0, U } | s: 0x00
|09E962| db $0C, $16, $4E ; SPRITE 4E   | xy: { 0x160, 0x0C0, U } | s: 0x00
|09E965| db $0D, $13, $4E ; SPRITE 4E   | xy: { 0x130, 0x0D0, U } | s: 0x00
|09E968| db $10, $13, $9B ; SPRITE 9B   | xy: { 0x130, 0x100, U } | s: 0x00
|09E96B| db $14, $14, $4E ; SPRITE 4E   | xy: { 0x140, 0x140, U } | s: 0x00
|09E96E| db $14, $1C, $4E ; SPRITE 4E   | xy: { 0x1C0, 0x140, U } | s: 0x00
|09E971| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D5:
|09E972| db $00 ; Unlayered OAM
|09E973| db $09, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x090, U } | s: 0x00
|09E976| db $0D, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x0D0, U } | s: 0x00
|09E979| db $11, $0E, $96 ; SPRITE 96   | xy: { 0x0E0, 0x110, U } | s: 0x00
|09E97C| db $15, $01, $95 ; SPRITE 95   | xy: { 0x010, 0x150, U } | s: 0x00
|09E97F| db $15, $04, $26 ; SPRITE 26   | xy: { 0x040, 0x150, U } | s: 0x00
|09E982| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D6:
|09E983| db $00 ; Unlayered OAM
|09E984| db $02, $07, $97 ; SPRITE 97   | xy: { 0x070, 0x020, U } | s: 0x00
|09E987| db $16, $03, $C5 ; SPRITE C5   | xy: { 0x030, 0x160, U } | s: 0x00
|09E98A| db $16, $0C, $C5 ; SPRITE C5   | xy: { 0x0C0, 0x160, U } | s: 0x00
|09E98D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D8:
|09E98E| db $00 ; Unlayered OAM
|09E98F| db $05, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x050, U } | s: 0x00
|09E992| db $05, $18, $84 ; SPRITE 84   | xy: { 0x180, 0x050, U } | s: 0x00
|09E995| db $09, $17, $4F ; SPRITE 4F   | xy: { 0x170, 0x090, U } | s: 0x00
|09E998| db $09, $18, $4F ; SPRITE 4F   | xy: { 0x180, 0x090, U } | s: 0x00
|09E99B| db $0A, $16, $4F ; SPRITE 4F   | xy: { 0x160, 0x0A0, U } | s: 0x00
|09E99E| db $0A, $19, $4F ; SPRITE 4F   | xy: { 0x190, 0x0A0, U } | s: 0x00
|09E9A1| db $0B, $16, $4E ; SPRITE 4E   | xy: { 0x160, 0x0B0, U } | s: 0x00
|09E9A4| db $0B, $19, $4E ; SPRITE 4E   | xy: { 0x190, 0x0B0, U } | s: 0x00
|09E9A7| db $14, $17, $84 ; SPRITE 84   | xy: { 0x170, 0x140, U } | s: 0x00
|09E9AA| db $16, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x160, U } | s: 0x00
|09E9AD| db $1B, $18, $A7 ; SPRITE A7   | xy: { 0x180, 0x1B0, U } | s: 0x00
|09E9B0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00D9:
|09E9B1| db $00 ; Unlayered OAM
|09E9B2| db $14, $EC, $02 ; OVERLORD 02 | xy: { 0x0C0, 0x140, U }
|09E9B5| db $15, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x150, U } | s: 0x00
|09E9B8| db $18, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x180, U } | s: 0x00
|09E9BB| db $1B, $18, $83 ; SPRITE 83   | xy: { 0x180, 0x1B0, U } | s: 0x00
|09E9BE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DA:
|09E9BF| db $00 ; Unlayered OAM
|09E9C0| db $18, $07, $15 ; SPRITE 15   | xy: { 0x070, 0x180, U } | s: 0x00
|09E9C3| db $18, $08, $15 ; SPRITE 15   | xy: { 0x080, 0x180, U } | s: 0x00
|09E9C6| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DB:
|09E9C7| db $01 ; Layered OAM
|09E9C8| db $04, $03, $D1 ; SPRITE D1   | xy: { 0x030, 0x040, U } | s: 0x00
|09E9CB| db $8A, $0E, $5B ; SPRITE 5B   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
|09E9CE| db $8B, $17, $A6 ; SPRITE A6   | xy: { 0x170, 0x0B0, L } | s: 0x00
|09E9D1| db $8C, $0F, $A5 ; SPRITE A5   | xy: { 0x0F0, 0x0C0, L } | s: 0x00
|09E9D4| db $10, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x100, U } | s: 0x00
|09E9D7| db $10, $14, $80 ; SPRITE 80   | xy: { 0x140, 0x100, U } | s: 0x00
|09E9DA| db $95, $0F, $A5 ; SPRITE A5   | xy: { 0x0F0, 0x150, L } | s: 0x00
|09E9DD| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DC:
|09E9DE| db $01 ; Layered OAM
|09E9DF| db $8A, $09, $A5 ; SPRITE A5   | xy: { 0x090, 0x0A0, L } | s: 0x00
|09E9E2| db $8A, $0E, $5C ; SPRITE 5C   | xy: { 0x0E0, 0x0A0, L } | s: 0x00
|09E9E5| db $8C, $0F, $A6 ; SPRITE A6   | xy: { 0x0F0, 0x0C0, L } | s: 0x00
|09E9E8| db $10, $0B, $8F ; SPRITE 8F   | xy: { 0x0B0, 0x100, U } | s: 0x00
|09E9EB| db $10, $16, $8F ; SPRITE 8F   | xy: { 0x160, 0x100, U } | s: 0x00
|09E9EE| db $96, $0C, $D1 ; SPRITE D1   | xy: { 0x0C0, 0x160, L } | s: 0x00
|09E9F1| db $96, $0F, $A6 ; SPRITE A6   | xy: { 0x0F0, 0x160, L } | s: 0x00
|09E9F4| db $97, $09, $A5 ; SPRITE A5   | xy: { 0x090, 0x170, L } | s: 0x00
|09E9F7| db $97, $16, $80 ; SPRITE 80   | xy: { 0x160, 0x170, L } | s: 0x00
|09E9FA| db $1C, $05, $80 ; SPRITE 80   | xy: { 0x050, 0x1C0, U } | s: 0x00
|09E9FD| db $1C, $0F, $8F ; SPRITE 8F   | xy: { 0x0F0, 0x1C0, U } | s: 0x00
|09EA00| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DE:
|09EA01| db $00 ; Unlayered OAM
|09EA02| db $05, $17, $A3 ; SPRITE A3   | xy: { 0x170, 0x050, U } | s: 0x00
|09EA05| db $05, $17, $A4 ; SPRITE A4   | xy: { 0x170, 0x050, U } | s: 0x00
|09EA08| db $05, $17, $A2 ; SPRITE A2   | xy: { 0x170, 0x050, U } | s: 0x00
|09EA0B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00DF:
|09EA0C| db $00 ; Unlayered OAM
|09EA0D| db $95, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x150, L } | s: 0x00
|09EA10| db $96, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x160, L } | s: 0x00
|09EA13| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E0:
|09EA14| db $00 ; Unlayered OAM
|09EA15| db $06, $04, $6A ; SPRITE 6A   | xy: { 0x040, 0x060, U } | s: 0x00
|09EA18| db $06, $0B, $6A ; SPRITE 6A   | xy: { 0x0B0, 0x060, U } | s: 0x00
|09EA1B| db $06, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x060, U } | s: 0x00
|09EA1E| db $09, $1A, $44 ; SPRITE 44   | xy: { 0x1A0, 0x090, U } | s: 0x00
|09EA21| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E1:
|09EA22| db $00 ; Unlayered OAM
|09EA23| db $0D, $17, $EB ; SPRITE EB   | xy: { 0x170, 0x0D0, U } | s: 0x00
|09EA26| db $92, $07, $29 ; SPRITE 29   | xy: { 0x070, 0x120, L } | s: 0x00
|09EA29| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E2:
|09EA2A| db $00 ; Unlayered OAM
|09EA2B| db $06, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x060, U } | s: 0x00
|09EA2E| db $06, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x060, U } | s: 0x00
|09EA31| db $07, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x070, U } | s: 0x00
|09EA34| db $07, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x070, U } | s: 0x00
|09EA37| db $10, $13, $EB ; SPRITE EB   | xy: { 0x130, 0x100, U } | s: 0x00
|09EA3A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E3:
|09EA3B| db $00 ; Unlayered OAM
|09EA3C| db $85, $17, $3A ; SPRITE 3A   | xy: { 0x170, 0x050, L } | s: 0x00
|09EA3F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E4:
|09EA40| db $00 ; Unlayered OAM
|09EA41| db $07, $19, $6F ; SPRITE 6F   | xy: { 0x190, 0x070, U } | s: 0x00
|09EA44| db $08, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x080, U } | s: 0x00
|09EA47| db $09, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x090, U } | s: 0x00
|09EA4A| db $16, $06, $AD ; SPRITE AD   | xy: { 0x060, 0x160, U } | s: 0x00
|09EA4D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E5:
|09EA4E| db $00 ; Unlayered OAM
|09EA4F| db $09, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x090, U } | s: 0x00
|09EA52| db $09, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x090, U } | s: 0x00
|09EA55| db $09, $11, $6F ; SPRITE 6F   | xy: { 0x110, 0x090, U } | s: 0x00
|09EA58| db $0E, $1B, $6F ; SPRITE 6F   | xy: { 0x1B0, 0x0E0, U } | s: 0x00
|09EA5B| db $12, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x120, U } | s: 0x00
|09EA5E| db $12, $11, $6F ; SPRITE 6F   | xy: { 0x110, 0x120, U } | s: 0x00
|09EA61| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E6:
|09EA62| db $00 ; Unlayered OAM
|09EA63| db $0B, $1B, $6F ; SPRITE 6F   | xy: { 0x1B0, 0x0B0, U } | s: 0x00
|09EA66| db $0F, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x0F0, U } | s: 0x00
|09EA69| db $13, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x130, U } | s: 0x00
|09EA6C| db $17, $0F, $6F ; SPRITE 6F   | xy: { 0x0F0, 0x170, U } | s: 0x00
|09EA6F| db $1B, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09EA72| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E7:
|09EA73| db $00 ; Unlayered OAM
|09EA74| db $04, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x040, U } | s: 0x00
|09EA77| db $04, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x040, U } | s: 0x00
|09EA7A| db $0B, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0B0, U } | s: 0x00
|09EA7D| db $0C, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0C0, U } | s: 0x00
|09EA80| db $0D, $0B, $6F ; SPRITE 6F   | xy: { 0x0B0, 0x0D0, U } | s: 0x00
|09EA83| db $0D, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0D0, U } | s: 0x00
|09EA86| db $0F, $15, $6F ; SPRITE 6F   | xy: { 0x150, 0x0F0, U } | s: 0x00
|09EA89| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00E8:
|09EA8A| db $00 ; Unlayered OAM
|09EA8B| db $05, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x050, U } | s: 0x00
|09EA8E| db $08, $17, $26 ; SPRITE 26   | xy: { 0x170, 0x080, U } | s: 0x00
|09EA91| db $0C, $07, $26 ; SPRITE 26   | xy: { 0x070, 0x0C0, U } | s: 0x00
|09EA94| db $0C, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x0C0, U } | s: 0x00
|09EA97| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EA:
|09EA98| db $00 ; Unlayered OAM
|09EA99| db $0B, $0B, $EB ; SPRITE EB   | xy: { 0x0B0, 0x0B0, U } | s: 0x00
|09EA9C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EB:
|09EA9D| db $00 ; Unlayered OAM
|09EA9E| db $14, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x140, U } | s: 0x00
|09EAA1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EE:
|09EAA2| db $00 ; Unlayered OAM
|09EAA3| db $04, $10, $18 ; SPRITE 18   | xy: { 0x100, 0x040, U } | s: 0x00
|09EAA6| db $0E, $0B, $18 ; SPRITE 18   | xy: { 0x0B0, 0x0E0, U } | s: 0x00
|09EAA9| db $1C, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x1C0, U } | s: 0x00
|09EAAC| db $0B, $03, $24 ; SPRITE 24   | xy: { 0x030, 0x0B0, U } | s: 0x00
|09EAAF| db $0C, $1C, $24 ; SPRITE 24   | xy: { 0x1C0, 0x0C0, U } | s: 0x00
|09EAB2| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00EF:
|09EAB3| db $00 ; Unlayered OAM
|09EAB4| db $09, $17, $18 ; SPRITE 18   | xy: { 0x170, 0x090, U } | s: 0x00
|09EAB7| db $0A, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x0A0, U } | s: 0x00
|09EABA| db $0A, $1B, $18 ; SPRITE 18   | xy: { 0x1B0, 0x0A0, U } | s: 0x00
|09EABD| db $06, $18, $1E ; SPRITE 1E   | xy: { 0x180, 0x060, U } | s: 0x00
|09EAC0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F0:
|09EAC1| db $00 ; Unlayered OAM
|09EAC2| db $03, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x030, U } | s: 0x00
|09EAC5| db $03, $10, $6F ; SPRITE 6F   | xy: { 0x100, 0x030, U } | s: 0x00
|09EAC8| db $04, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x040, U } | s: 0x00
|09EACB| db $04, $0A, $6F ; SPRITE 6F   | xy: { 0x0A0, 0x040, U } | s: 0x00
|09EACE| db $07, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x070, U } | s: 0x00
|09EAD1| db $0A, $03, $6F ; SPRITE 6F   | xy: { 0x030, 0x0A0, U } | s: 0x00
|09EAD4| db $0A, $05, $6F ; SPRITE 6F   | xy: { 0x050, 0x0A0, U } | s: 0x00
|09EAD7| db $0C, $0E, $6F ; SPRITE 6F   | xy: { 0x0E0, 0x0C0, U } | s: 0x00
|09EADA| db $10, $1B, $AD ; SPRITE AD   | xy: { 0x1B0, 0x100, U } | s: 0x00
|09EADD| db $13, $13, $6F ; SPRITE 6F   | xy: { 0x130, 0x130, U } | s: 0x00
|09EAE0| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F1:
|09EAE1| db $00 ; Unlayered OAM
|09EAE2| db $10, $19, $6F ; SPRITE 6F   | xy: { 0x190, 0x100, U } | s: 0x00
|09EAE5| db $10, $1C, $6F ; SPRITE 6F   | xy: { 0x1C0, 0x100, U } | s: 0x00
|09EAE8| db $11, $18, $6F ; SPRITE 6F   | xy: { 0x180, 0x110, U } | s: 0x00
|09EAEB| db $11, $1D, $6F ; SPRITE 6F   | xy: { 0x1D0, 0x110, U } | s: 0x00
|09EAEE| db $12, $17, $6F ; SPRITE 6F   | xy: { 0x170, 0x120, U } | s: 0x00
|09EAF1| db $12, $1E, $6F ; SPRITE 6F   | xy: { 0x1E0, 0x120, U } | s: 0x00
|09EAF4| db $1B, $06, $6F ; SPRITE 6F   | xy: { 0x060, 0x1B0, U } | s: 0x00
|09EAF7| db $1B, $09, $6F ; SPRITE 6F   | xy: { 0x090, 0x1B0, U } | s: 0x00
|09EAFA| db $1C, $07, $6F ; SPRITE 6F   | xy: { 0x070, 0x1C0, U } | s: 0x00
|09EAFD| db $1C, $08, $6F ; SPRITE 6F   | xy: { 0x080, 0x1C0, U } | s: 0x00
|09EB00| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F3:
|09EB01| db $00 ; Unlayered OAM
|09EB02| db $14, $06, $78 ; SPRITE 78   | xy: { 0x060, 0x140, U } | s: 0x00
|09EB05| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F4:
|09EB06| db $00 ; Unlayered OAM
|09EB07| db $14, $17, $32 ; SPRITE 32   | xy: { 0x170, 0x140, U } | s: 0x00
|09EB0A| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F5:
|09EB0B| db $00 ; Unlayered OAM
|09EB0C| db $14, $08, $32 ; SPRITE 32   | xy: { 0x080, 0x140, U } | s: 0x00
|09EB0F| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00F9:
|09EB10| db $00 ; Unlayered OAM
|09EB11| db $05, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x050, U } | s: 0x00
|09EB14| db $0F, $15, $18 ; SPRITE 18   | xy: { 0x150, 0x0F0, U } | s: 0x00
|09EB17| db $13, $11, $18 ; SPRITE 18   | xy: { 0x110, 0x130, U } | s: 0x00
|09EB1A| db $17, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x170, U } | s: 0x00
|09EB1D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FA:
|09EB1E| db $00 ; Unlayered OAM
|09EB1F| db $0E, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x0E0, U } | s: 0x00
|09EB22| db $10, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x100, U } | s: 0x00
|09EB25| db $11, $15, $E3 ; SPRITE E3   | xy: { 0x150, 0x110, U } | s: 0x00
|09EB28| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FB:
|09EB29| db $00 ; Unlayered OAM
|09EB2A| db $0D, $17, $93 ; SPRITE 93   | xy: { 0x170, 0x0D0, U } | s: 0x00
|09EB2D| db $0A, $19, $26 ; SPRITE 26   | xy: { 0x190, 0x0A0, U } | s: 0x00
|09EB30| db $12, $15, $26 ; SPRITE 26   | xy: { 0x150, 0x120, U } | s: 0x00
|09EB33| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FC:
|09EB34| db $00 ; Unlayered OAM
|09EB35| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FD:
|09EB36| db $00 ; Unlayered OAM
|09EB37| db $0E, $09, $18 ; SPRITE 18   | xy: { 0x090, 0x0E0, U } | s: 0x00
|09EB3A| db $08, $05, $24 ; SPRITE 24   | xy: { 0x050, 0x080, U } | s: 0x00
|09EB3D| db $08, $16, $E3 ; SPRITE E3   | xy: { 0x160, 0x080, U } | s: 0x00
|09EB40| db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
|09EB43| db $11, $0F, $24 ; SPRITE 24   | xy: { 0x0F0, 0x110, U } | s: 0x00
|09EB46| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FE:
|09EB47| db $00 ; Unlayered OAM
|09EB48| db $12, $16, $18 ; SPRITE 18   | xy: { 0x160, 0x120, U } | s: 0x00
|09EB4B| db $16, $14, $18 ; SPRITE 18   | xy: { 0x140, 0x160, U } | s: 0x00
|09EB4E| db $16, $1A, $18 ; SPRITE 18   | xy: { 0x1A0, 0x160, U } | s: 0x00
|09EB51| db $12, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x120, U } | s: 0x00
|09EB54| db $18, $18, $24 ; SPRITE 24   | xy: { 0x180, 0x180, U } | s: 0x00
|09EB57| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room00FF:
|09EB58| db $00 ; Unlayered OAM
|09EB59| db $04, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x040, U } | s: 0x00
|09EB5C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0100:
|09EB5D| db $00 ; Unlayered OAM
|09EB5E| db $1B, $0B, $BB ; SPRITE BB   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09EB61| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0101:
|09EB62| db $00 ; Unlayered OAM
|09EB63| db $13, $08, $33 ; SPRITE 33   | xy: { 0x080, 0x130, U } | s: 0x00
|09EB66| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0102:
|09EB67| db $00 ; Unlayered OAM
|09EB68| db $18, $03, $1F ; SPRITE 1F   | xy: { 0x030, 0x180, U } | s: 0x00
|09EB6B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0103:
|09EB6C| db $00 ; Unlayered OAM
|09EB6D| db $15, $06, $BC ; SPRITE BC   | xy: { 0x060, 0x150, U } | s: 0x00
|09EB70| db $1B, $0A, $29 ; SPRITE 29   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
|09EB73| db $17, $17, $35 ; SPRITE 35   | xy: { 0x170, 0x170, U } | s: 0x00
|09EB76| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0104:
|09EB77| db $00 ; Unlayered OAM
|09EB78| db $17, $1A, $73 ; SPRITE 73   | xy: { 0x1A0, 0x170, U } | s: 0x00
|09EB7B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0105:
|09EB7C| db $00 ; Unlayered OAM
|09EB7D| db $18, $07, $16 ; SPRITE 16   | xy: { 0x070, 0x180, U } | s: 0x00
|09EB80| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0106:
|09EB81| db $00 ; Unlayered OAM
|09EB82| db $1B, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x1B0, U } | s: 0x00
|09EB85| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0107:
|09EB86| db $00 ; Unlayered OAM
|09EB87| db $15, $03, $3B ; SPRITE 3B   | xy: { 0x030, 0x150, U } | s: 0x00
|09EB8A| db $1B, $17, $6D ; SPRITE 6D   | xy: { 0x170, 0x1B0, U } | s: 0x00
|09EB8D| db $1B, $18, $6D ; SPRITE 6D   | xy: { 0x180, 0x1B0, U } | s: 0x00
|09EB90| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0108:
|09EB91| db $00 ; Unlayered OAM
|09EB92| db $16, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x160, U } | s: 0x00
|09EB95| db $16, $0C, $0B ; SPRITE 0B   | xy: { 0x0C0, 0x160, U } | s: 0x00
|09EB98| db $19, $09, $0B ; SPRITE 0B   | xy: { 0x090, 0x190, U } | s: 0x00
|09EB9B| db $1A, $06, $0B ; SPRITE 0B   | xy: { 0x060, 0x1A0, U } | s: 0x00
|09EB9E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0109:
|09EB9F| db $00 ; Unlayered OAM
|09EBA0| db $1B, $0A, $E9 ; SPRITE E9   | xy: { 0x0A0, 0x1B0, U } | s: 0x00
|09EBA3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010A:
|09EBA4| db $00 ; Unlayered OAM
|09EBA5| db $04, $19, $16 ; SPRITE 16   | xy: { 0x190, 0x040, U } | s: 0x00
|09EBA8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010B:
|09EBA9| db $00 ; Unlayered OAM
|09EBAA| db $03, $0F, $06 ; SPRITE 06   | xy: { 0x0F0, 0x030, U } | s: 0x00
|09EBAD| db $06, $ED, $1A ; OVERLORD 1A | xy: { 0x0D0, 0x060, U }
|09EBB0| db $06, $F0, $1A ; OVERLORD 1A | xy: { 0x100, 0x060, U }
|09EBB3| db $07, $F2, $1A ; OVERLORD 1A | xy: { 0x120, 0x070, U }
|09EBB6| db $09, $EF, $1A ; OVERLORD 1A | xy: { 0x0F0, 0x090, U }
|09EBB9| db $03, $12, $04 ; SPRITE 04   | xy: { 0x120, 0x030, U } | s: 0x00
|09EBBC| db $07, $0D, $15 ; SPRITE 15   | xy: { 0x0D0, 0x070, U } | s: 0x00
|09EBBF| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010C:
|09EBC0| db $00 ; Unlayered OAM
|09EBC1| db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
|09EBC4| db $07, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x070, U } | s: 0x00
|09EBC7| db $08, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x080, U } | s: 0x00
|09EBCA| db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
|09EBCD| db $14, $07, $83 ; SPRITE 83   | xy: { 0x070, 0x140, U } | s: 0x00
|09EBD0| db $14, $08, $83 ; SPRITE 83   | xy: { 0x080, 0x140, U } | s: 0x00
|09EBD3| db $14, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x140, U } | s: 0x00
|09EBD6| db $1A, $0C, $83 ; SPRITE 83   | xy: { 0x0C0, 0x1A0, U } | s: 0x00
|09EBD9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010D:
|09EBDA| db $00 ; Unlayered OAM
|09EBDB| db $16, $05, $5B ; SPRITE 5B   | xy: { 0x050, 0x160, U } | s: 0x00
|09EBDE| db $16, $0A, $5C ; SPRITE 5C   | xy: { 0x0A0, 0x160, U } | s: 0x00
|09EBE1| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010E:
|09EBE2| db $00 ; Unlayered OAM
|09EBE3| db $06, $06, $28 ; SPRITE 28   | xy: { 0x060, 0x060, U } | s: 0x00
|09EBE6| db $06, $18, $28 ; SPRITE 28   | xy: { 0x180, 0x060, U } | s: 0x00
|09EBE9| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room010F:
|09EBEA| db $00 ; Unlayered OAM
|09EBEB| db $15, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x150, U } | s: 0x00
|09EBEE| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0110:
|09EBEF| db $00 ; Unlayered OAM
|09EBF0| db $15, $07, $BB ; SPRITE BB   | xy: { 0x070, 0x150, U } | s: 0x00
|09EBF3| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0111:
|09EBF4| db $00 ; Unlayered OAM
|09EBF5| db $1B, $0B, $65 ; SPRITE 65   | xy: { 0x0B0, 0x1B0, U } | s: 0x00
|09EBF8| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0112:
|09EBF9| db $00 ; Unlayered OAM
|09EBFA| db $0A, $07, $28 ; SPRITE 28   | xy: { 0x070, 0x0A0, U } | s: 0x00
|09EBFD| db $14, $17, $BB ; SPRITE BB   | xy: { 0x170, 0x140, U } | s: 0x00
|09EC00| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0114:
|09EC01| db $00 ; Unlayered OAM
|09EC02| db $18, $07, $72 ; SPRITE 72   | xy: { 0x070, 0x180, U } | s: 0x00
|09EC05| db $14, $19, $28 ; SPRITE 28   | xy: { 0x190, 0x140, U } | s: 0x00
|09EC08| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0115:
|09EC09| db $00 ; Unlayered OAM
|09EC0A| db $16, $17, $C8 ; SPRITE C8   | xy: { 0x170, 0x160, U } | s: 0x00
|09EC0D| db $07, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x070, U } | s: 0x00
|09EC10| db $07, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x070, U } | s: 0x00
|09EC13| db $08, $17, $E3 ; SPRITE E3   | xy: { 0x170, 0x080, U } | s: 0x00
|09EC16| db $08, $18, $E3 ; SPRITE E3   | xy: { 0x180, 0x080, U } | s: 0x00
|09EC19| db $09, $07, $72 ; SPRITE 72   | xy: { 0x070, 0x090, U } | s: 0x00
|09EC1C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0116:
|09EC1D| db $00 ; Unlayered OAM
|09EC1E| db $18, $17, $72 ; SPRITE 72   | xy: { 0x170, 0x180, U } | s: 0x00
|09EC21| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0118:
|09EC22| db $00 ; Unlayered OAM
|09EC23| db $1B, $19, $BB ; SPRITE BB   | xy: { 0x190, 0x1B0, U } | s: 0x00
|09EC26| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0119:
|09EC27| db $00 ; Unlayered OAM
|09EC28| db $18, $0E, $29 ; SPRITE 29   | xy: { 0x0E0, 0x180, U } | s: 0x00
|09EC2B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011A:
|09EC2C| db $00 ; Unlayered OAM
|09EC2D| db $17, $18, $28 ; SPRITE 28   | xy: { 0x180, 0x170, U } | s: 0x00
|09EC30| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011B:
|09EC31| db $00 ; Unlayered OAM
|09EC32| db $09, $18, $EB ; SPRITE EB   | xy: { 0x180, 0x090, U } | s: 0x00
|09EC35| db $96, $05, $EB ; SPRITE EB   | xy: { 0x050, 0x160, L } | s: 0x00
|09EC38| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011C:
|09EC39| db $00 ; Unlayered OAM
|09EC3A| db $19, $09, $B5 ; SPRITE B5   | xy: { 0x090, 0x190, U } | s: 0x00
|09EC3D| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011E:
|09EC3E| db $00 ; Unlayered OAM
|09EC3F| db $07, $05, $E3 ; SPRITE E3   | xy: { 0x050, 0x070, U } | s: 0x00
|09EC42| db $07, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x070, U } | s: 0x00
|09EC45| db $08, $05, $E3 ; SPRITE E3   | xy: { 0x050, 0x080, U } | s: 0x00
|09EC48| db $08, $06, $E3 ; SPRITE E3   | xy: { 0x060, 0x080, U } | s: 0x00
|09EC4B| db $16, $18, $BB ; SPRITE BB   | xy: { 0x180, 0x160, U } | s: 0x00
|09EC4E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room011F:
|09EC4F| db $00 ; Unlayered OAM
|09EC50| db $16, $17, $BB ; SPRITE BB   | xy: { 0x170, 0x160, U } | s: 0x00
|09EC53| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0120:
|09EC54| db $00 ; Unlayered OAM
|09EC55| db $07, $17, $B2 ; SPRITE B2   | xy: { 0x170, 0x070, U } | s: 0x00
|09EC58| db $08, $1B, $E3 ; SPRITE E3   | xy: { 0x1B0, 0x080, U } | s: 0x00
|09EC5B| db $09, $1A, $E3 ; SPRITE E3   | xy: { 0x1A0, 0x090, U } | s: 0x00
|09EC5E| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0121:
|09EC5F| db $00 ; Unlayered OAM
|09EC60| db $17, $04, $1A ; SPRITE 1A   | xy: { 0x040, 0x170, U } | s: 0x00
|09EC63| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0122:
|09EC64| db $00 ; Unlayered OAM
|09EC65| db $18, $07, $31 ; SPRITE 31   | xy: { 0x070, 0x180, U } | s: 0x00
|09EC68| db $18, $17, $31 ; SPRITE 31   | xy: { 0x170, 0x180, U } | s: 0x00
|09EC6B| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0123:
|09EC6C| db $00 ; Unlayered OAM
|09EC6D| db $16, $03, $18 ; SPRITE 18   | xy: { 0x030, 0x160, U } | s: 0x00
|09EC70| db $16, $0C, $18 ; SPRITE 18   | xy: { 0x0C0, 0x160, U } | s: 0x00
|09EC73| db $17, $08, $18 ; SPRITE 18   | xy: { 0x080, 0x170, U } | s: 0x00
|09EC76| db $1A, $03, $18 ; SPRITE 18   | xy: { 0x030, 0x1A0, U } | s: 0x00
|09EC79| db $05, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x050, U } | s: 0x00
|09EC7C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0124:
|09EC7D| db $00 ; Unlayered OAM
|09EC7E| db $16, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x160, U } | s: 0x00
|09EC81| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0125:
|09EC82| db $00 ; Unlayered OAM
|09EC83| db $16, $08, $BB ; SPRITE BB   | xy: { 0x080, 0x160, U } | s: 0x00
|09EC86| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0126:
|09EC87| db $00 ; Unlayered OAM
|09EC88| db $15, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x150, U } | s: 0x00
|09EC8B| db $15, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x150, U } | s: 0x00
|09EC8E| db $16, $07, $E3 ; SPRITE E3   | xy: { 0x070, 0x160, U } | s: 0x00
|09EC91| db $16, $08, $E3 ; SPRITE E3   | xy: { 0x080, 0x160, U } | s: 0x00
|09EC94| db $14, $1C, $EB ; SPRITE EB   | xy: { 0x1C0, 0x140, U } | s: 0x00
|09EC97| db $FF ; END

;===================================================================================================

RoomData_Sprites_Room0127:
|09EC98| db $00 ; Unlayered OAM
|09EC99| db $16, $07, $EB ; SPRITE EB   | xy: { 0x070, 0x160, U } | s: 0x00
|09EC9C| db $FF ; END

;===================================================================================================

RoomData_Sprites_Empty:
|09EC9D| db $00 ; Unlayered OAM
|09EC9E| db $FF ; END

;===================================================================================================

pool SpriteModule_Explode

.oam_groups
|09EC9F| dw   0,   0 : db $60, $00, $00, $02
|09ECA7| dw   0,   0 : db $60, $00, $00, $02
|09ECAF| dw   0,   0 : db $60, $00, $00, $02
|09ECB7| dw   0,   0 : db $60, $00, $00, $02

|09ECBF| dw  -5,  -5 : db $62, $00, $00, $02
|09ECC7| dw   5,  -5 : db $62, $40, $00, $02
|09ECCF| dw  -5,   5 : db $62, $80, $00, $02
|09ECD7| dw   5,   5 : db $62, $C0, $00, $02

|09ECDF| dw  -8,  -8 : db $62, $00, $00, $02
|09ECE7| dw   8,  -8 : db $62, $40, $00, $02
|09ECEF| dw  -8,   8 : db $62, $80, $00, $02
|09ECF7| dw   8,   8 : db $62, $C0, $00, $02

|09ECFF| dw  -8,  -8 : db $64, $00, $00, $02
|09ED07| dw   8,  -8 : db $64, $40, $00, $02
|09ED0F| dw  -8,   8 : db $64, $80, $00, $02
|09ED17| dw   8,   8 : db $64, $C0, $00, $02

|09ED1F| dw  -8,  -8 : db $66, $00, $00, $02
|09ED27| dw   8,  -8 : db $66, $40, $00, $02
|09ED2F| dw  -8,   8 : db $66, $80, $00, $02
|09ED37| dw   8,   8 : db $66, $C0, $00, $02

|09ED3F| dw  -8,  -8 : db $68, $00, $00, $02
|09ED47| dw   8,  -8 : db $68, $00, $00, $02
|09ED4F| dw  -8,   8 : db $68, $00, $00, $02
|09ED57| dw   8,   8 : db $68, $00, $00, $02

|09ED5F| dw  -8,  -8 : db $6A, $00, $00, $02
|09ED67| dw   8,  -8 : db $6A, $40, $00, $02
|09ED6F| dw  -8,   8 : db $6A, $80, $00, $02
|09ED77| dw   8,   8 : db $6A, $C0, $00, $02

|09ED7F| dw  -8,  -8 : db $4E, $00, $00, $02
|09ED87| dw   8,  -8 : db $4E, $40, $00, $02
|09ED8F| dw  -8,   8 : db $4E, $80, $00, $02
|09ED97| dw   8,   8 : db $4E, $C0, $00, $02

endpool

;---------------------------------------------------------------------------------------------------

SpriteModule_Explode:
|09ED9F| PHB
|09EDA0| PHK
|09EDA1| PLB

|09EDA2| JSR .main

|09EDA5| PLB

|09EDA6| RTL

;---------------------------------------------------------------------------------------------------

.main
|09EDA7| LDA.w $0D90,X
|09EDAA| BEQ VerifyExplosionPrize

|09EDAC| LDA.w $0DF0,X
|09EDAF| BNE .draw

|09EDB1| STZ.w $0DD0,X

;---------------------------------------------------------------------------------------------------

|09EDB4| LDY.b #$0F

.next
|09EDB6| LDA.w $0DD0,Y
|09EDB9| CMP.b #$04
|09EDBB| BEQ .exit

|09EDBD| DEY
|09EDBE| BPL .next

|09EDC0| LDY.b #$01
|09EDC2| STY.w $0AAA

|09EDC5| JSL CheckIfScreenIsClear
|09EDC9| BCS .exit

|09EDCB| STZ.w $0FFC

.exit
|09EDCE| RTS

;---------------------------------------------------------------------------------------------------

.draw
|09EDCF| LSR A
|09EDD0| LSR A
|09EDD1| EOR.b #$07
|09EDD3| STA.b $00

|09EDD5| LDA.b #$00
|09EDD7| XBA
|09EDD8| LDA.b $00

|09EDDA| REP #$20

|09EDDC| ASL A
|09EDDD| ASL A
|09EDDE| ASL A
|09EDDF| ASL A
|09EDE0| ASL A

|09EDE1| ADC.w #.oam_groups
|09EDE4| STA.b $08

|09EDE6| SEP #$20

|09EDE8| LDA.b #$04
|09EDEA| JSL TabulatedSpriteDraw

|09EDEE| RTS

;===================================================================================================

pool SpawnExplosion

.offset_low
|09EDEF| db   0,   4,   8,  12
|09EDF3| db  -4,  -8, -12,   0
|09EDF7| db   0,   8,  16,  24
|09EDFB| db -24, -16,  -8,   0

.offset_high
|09EDFF| db   0,   0,   0,   0
|09EE03| db  -1,  -1,  -1,   0
|09EE07| db   0,   0,   0,   0
|09EE0B| db  -1,  -1,  -1,   0

endpool

;---------------------------------------------------------------------------------------------------

VerifyExplosionPrize:
|09EE0F| LDA.b #$02
|09EE11| STA.w $0F20,X

|09EE14| LDA.w $0DF0,X
|09EE17| CMP.b #$20
|09EE19| BEQ .validate

|09EE1B| JMP.w SpawnExplosion

;---------------------------------------------------------------------------------------------------

.validate
|09EE1E| STZ.w $0DD0,X

|09EE21| STZ.w $02E4

|09EE24| LDA.b $5B
|09EE26| CMP.b #$02
|09EE28| BEQ .no_win

|09EE2A| JSL CheckIfScreenIsClear
|09EE2E| BCC .no_win

|09EE30| LDY.w $0E20,X
|09EE33| CPY.b #$D6 ; SPRITE D6
|09EE35| BCS .ganon

|09EE37| CPY.b #$7A ; SPRITE 7A
|09EE39| BNE .not_agahnim

|09EE3B| PHX

|09EE3C| JSL PrepareDungeonExitFromBossFight

|09EE40| PLX

;---------------------------------------------------------------------------------------------------

.no_win
|09EE41| JMP.w SpawnExplosion

;---------------------------------------------------------------------------------------------------

.ganon
|09EE44| LDA.b #$13 ; SONG 13
|09EE46| STA.w $012C

|09EE49| JMP.w SpawnExplosion

;---------------------------------------------------------------------------------------------------

.not_agahnim
|09EE4C| STY.w $0FB5

|09EE4F| LDA.b #$EA ; SPRITE EA
|09EE51| LDY.b #$0E
|09EE53| JSL SpawnSpriteDynamically.slot_limited
|09EE57| JSL SetSpawnedSpriteCoordinates

|09EE5B| LDA.b #$20
|09EE5D| STA.w $0F80,Y

|09EE60| LDA.b $EE
|09EE62| STA.w $0F20,Y

|09EE65| LDA.b #$02

|09EE67| CPY.b #$09
|09EE69| BEQ .not_slot9

|09EE6B| LDA.b #$06

.not_slot9
|09EE6D| STA.w $0D90,Y

|09EE70| LDA.b $02
|09EE72| CLC
|09EE73| ADC.b #$03
|09EE75| STA.w $0D00,Y

|09EE78| LDA.b $03
|09EE7A| ADC.b #$00
|09EE7C| STA.w $0D20,Y

|09EE7F| LDA.w $0FB5
|09EE82| CMP.b #$CE
|09EE84| BNE .check_cb

;---------------------------------------------------------------------------------------------------

|09EE86| LDA.b $02
|09EE88| CLC
|09EE89| ADC.b #$10
|09EE8B| STA.w $0D00,Y

|09EE8E| LDA.b $03
|09EE90| ADC.b #$00
|09EE92| STA.w $0D20,Y

|09EE95| RTS

;---------------------------------------------------------------------------------------------------

.check_cb
|09EE96| CMP.b #$CB
|09EE98| BNE .exit

|09EE9A| LDA.b #$78
|09EE9C| STA.w $0D10,Y
|09EE9F| STA.w $0D00,Y

|09EEA2| LDA.b $23
|09EEA4| STA.w $0D30,Y

|09EEA7| LDA.b $21
|09EEA9| STA.w $0D20,Y

.exit
|09EEAC| RTS

;===================================================================================================

SpawnExplosion:
|09EEAD| CMP.b #$40
|09EEAF| BCC .delay

|09EEB1| CMP.b #$70
|09EEB3| BCS .draw_sprite

|09EEB5| AND.b #$01
|09EEB7| BNE .delay

.draw_sprite
|09EEB9| JSL SpriteModule_Active_long

.delay
|09EEBD| LDA.b #$07
|09EEBF| STA.b $0E

|09EEC1| LDA.w $0E20,X
|09EEC4| STA.b $0F

|09EEC6| CMP.b #$92 ; SPRITE 92
|09EEC8| BNE .not_king_helma

|09EECA| LSR.b $0E

.not_king_helma
|09EECC| LDA.w $0DF0,X
|09EECF| CMP.b #$C0
|09EED1| BCC .delay_more

|09EED3| RTS

;---------------------------------------------------------------------------------------------------

.delay_more
|09EED4| PHA

|09EED5| AND.b #$03
|09EED7| BNE .skip_sfx

|09EED9| LDA.b #$0C ; SFX2.0C
|09EEDB| JSL QueueSpriteSFX2WithPan

.skip_sfx
|09EEDF| PLA
|09EEE0| AND.b $0E
|09EEE2| BNE .exit

|09EEE4| LDA.b #$1C ; SPRITE 1C
|09EEE6| JSL SpawnSpriteDynamically
|09EEEA| BMI .exit

|09EEEC| LDA.b #$0B
|09EEEE| STA.w $0AAA

|09EEF1| LDA.b #$04
|09EEF3| STA.w $0DD0,Y

|09EEF6| LDA.b #$03
|09EEF8| STA.w $0E40,Y

|09EEFB| LDA.b #$0C
|09EEFD| STA.w $0F50,Y

;---------------------------------------------------------------------------------------------------

|09EF00| PHX

|09EF01| JSL GetRandomNumber
|09EF05| AND.b #$07
|09EF07| TAX

|09EF08| LDA.b $0F
|09EF0A| CMP.b #$92 ; SPRITE 92
|09EF0C| BNE .not_helma_king

|09EF0E| TXA
|09EF0F| ORA.b #$08
|09EF11| TAX

.not_helma_king
|09EF12| LDA.b $00
|09EF14| CLC
|09EF15| ADC.w .offset_low,X
|09EF18| STA.w $0D10,Y

|09EF1B| LDA.b $01
|09EF1D| ADC.w .offset_high,X
|09EF20| STA.w $0D30,Y

|09EF23| JSL GetRandomNumber
|09EF27| AND.b #$07
|09EF29| TAX

|09EF2A| LDA.b $0F
|09EF2C| CMP.b #$92 ; SPRITE 92
|09EF2E| BNE .not_helma

|09EF30| TXA
|09EF31| ORA.b #$08
|09EF33| TAX

;---------------------------------------------------------------------------------------------------

.not_helma
|09EF34| LDA.b $02
|09EF36| CLC
|09EF37| ADC.w .offset_low,X
|09EF3A| PHP

|09EF3B| SEC
|09EF3C| SBC.b $04
|09EF3E| STA.w $0D00,Y

|09EF41| LDA.b $03
|09EF43| SBC.b #$00

|09EF45| PLP
|09EF46| ADC.w .offset_high,X
|09EF49| STA.w $0D20,Y

|09EF4C| PLX

|09EF4D| LDA.b #$1F
|09EF4F| STA.w $0DF0,Y
|09EF52| STA.w $0D90,Y

.exit
|09EF55| RTS

;===================================================================================================

KillFellowSprites:
|09EF56| LDY.b #$0F

.next
|09EF58| CPY.w $0FA0
|09EF5B| BEQ .skip

|09EF5D| LDA.w $0DD0,Y
|09EF60| BEQ .skip

|09EF62| LDA.w $0CAA,Y
|09EF65| AND.b #$02
|09EF67| BNE .skip

|09EF69| LDA.w $0E20,Y
|09EF6C| CMP.b #$7A ; SPRITE 7A
|09EF6E| BEQ .skip

|09EF70| LDA.b #$06
|09EF72| STA.w $0DD0,Y

|09EF75| LDA.b #$0F
|09EF77| STA.w $0DF0,Y

|09EF7A| LDA.b #$00
|09EF7C| STA.w $0E60,Y
|09EF7F| STA.w $0BE0,Y

|09EF82| LDA.b #$03
|09EF84| STA.w $0E40,Y

.skip
|09EF87| DEY
|09EF88| BPL .next

|09EF8A| RTL

;===================================================================================================

pool Garnish16_ThrownItemDebris

.offset_x
|09EF8B| dw   0,   8,   0,   8
|09EF93| dw  -2,   9,  -1,   9
|09EF9B| dw  -4,   9,  -1,  10
|09EFA3| dw  -6,   9,  -1,  12
|09EFAB| dw  -7,   9,  -2,  13
|09EFB3| dw  -9,   9,  -3,  14
|09EFBB| dw  -4,  -4,   9,  15
|09EFC3| dw  -3,  -3,  -3,   9
|09EFCB| dw  -4,   4,   6,  10
|09EFD3| dw  -1,   4,   6,   7
|09EFDB| dw   0,   2,   4,   7
|09EFE3| dw   1,   1,   5,   7
|09EFEB| dw   0,  -2,   8,   9
|09EFF3| dw  -1,  -6,   9,  10
|09EFFB| dw  -2,  -7,  12,  11
|09F003| dw  -3,  -9,   4,   6

;---------------------------------------------------------------------------------------------------

.offset_y
|09F00B| db   0,   0,   8,   8
|09F00F| db   0,  -1,  10,  10
|09F013| db   0,  -3,  11,   7
|09F017| db   1,  -4,  12,   8
|09F01B| db   1,  -4,  13,   9
|09F01F| db   2,  -4,  16,  10
|09F023| db  14,  14,  -4,  11
|09F027| db  16,  16,  16,  -1
|09F02B| db   2,  -5,   5,   1
|09F02F| db   3,  -7,   8,   2
|09F033| db   4,  -8,   4,  10
|09F037| db  -9,   4,   4,  12
|09F03B| db -10,   4,   8,  14
|09F03F| db -12,   4,   8,  15
|09F043| db -15,   3,   8,  17
|09F047| db -17,   1,  18,  15

;---------------------------------------------------------------------------------------------------

.char
|09F04B| db $58, $58, $58, $58
|09F04F| db $58, $58, $58, $58
|09F053| db $58, $58, $58, $58
|09F057| db $58, $58, $58, $58
|09F05B| db $48, $58, $58, $58
|09F05F| db $48, $58, $58, $48
|09F063| db $48, $48, $58, $48
|09F067| db $48, $48, $48, $48
|09F06B| db $59, $59, $59, $59
|09F06F| db $59, $59, $59, $59
|09F073| db $59, $59, $59, $59
|09F077| db $59, $59, $59, $59
|09F07B| db $59, $59, $59, $59
|09F07F| db $59, $59, $59, $59
|09F083| db $59, $59, $59, $59
|09F087| db $59, $59, $59, $59

;---------------------------------------------------------------------------------------------------

.prop
|09F08B| db $80, $00, $80, $40
|09F08F| db $80, $40, $80, $00
|09F093| db $00, $C0, $00, $80
|09F097| db $80, $40, $80, $00
|09F09B| db $80, $C0, $00, $80
|09F09F| db $00, $00, $80, $00
|09F0A3| db $80, $80, $80, $80
|09F0A7| db $00, $00, $00, $00
|09F0AB| db $40, $40, $40, $00
|09F0AF| db $40, $40, $40, $00
|09F0B3| db $40, $40, $00, $00
|09F0B7| db $80, $00, $40, $40
|09F0BB| db $40, $00, $40, $40
|09F0BF| db $40, $40, $40, $40
|09F0C3| db $40, $40, $00, $00
|09F0C7| db $40, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Garnish16_ThrownItemDebris:
|09F0CB| JSR Garnish_PrepOAMCoord

|09F0CE| LDA.l $7FF9FE,X
|09F0D2| STA.b $05

|09F0D4| LDA.w $0FC6
|09F0D7| CMP.b #$03
|09F0D9| BCS .exit

|09F0DB| LDA.l $7FF92C,X
|09F0DF| CMP.b #$03
|09F0E1| BNE .special_draw

|09F0E3| JSR GarnishDraw_ThrownItemDebris

.exit
|09F0E6| RTS

;---------------------------------------------------------------------------------------------------

.special_draw
|09F0E7| STA.w $0FB5

|09F0EA| TAY

|09F0EB| LDA.l $7FF90E,X
|09F0EF| LSR A
|09F0F0| LSR A
|09F0F1| EOR.b #$07
|09F0F3| ASL A
|09F0F4| ASL A

|09F0F5| CPY.b #$04
|09F0F7| BEQ .do_offset

|09F0F9| CPY.b #$02
|09F0FB| BNE .not_outdoors_bush

|09F0FD| LDY.b $1B
|09F0FF| BNE .not_outdoors_bush

;---------------------------------------------------------------------------------------------------

.do_offset
|09F101| CLC
|09F102| ADC.b #$20

.not_outdoors_bush
|09F104| STA.b $06

|09F106| LDY.b #$00

|09F108| PHX

|09F109| LDX.b #$03

;---------------------------------------------------------------------------------------------------

.next_char
|09F10B| PHX

|09F10C| TXA
|09F10D| CLC
|09F10E| ADC.b $06
|09F110| PHA

|09F111| ASL A
|09F112| TAX

|09F113| REP #$20

|09F115| LDA.b $00
|09F117| CLC
|09F118| ADC.w .offset_x,X
|09F11B| STA.b ($90),Y

|09F11D| AND.w #$0100
|09F120| STA.b $0E

|09F122| SEP #$20

|09F124| PLX

|09F125| LDA.b $02
|09F127| CLC
|09F128| ADC.w .offset_y,X
|09F12B| INY

|09F12C| STA.b ($90),Y

|09F12E| LDA.w $0FB5
|09F131| BNE .check_flip

|09F133| LDA.b #$4E
|09F135| BRA .use_char

.check_flip
|09F137| CMP.b #$80
|09F139| LDA.w .char,X
|09F13C| BCC .use_char

|09F13E| LDA.b #$F2

.use_char
|09F140| INY
|09F141| STA.b ($90),Y

|09F143| LDA.w .prop,X

|09F146| INY

|09F147| ORA.b $05
|09F149| STA.b ($90),Y

|09F14B| PHY

|09F14C| TYA
|09F14D| LSR A
|09F14E| LSR A
|09F14F| TAY

|09F150| LDA.b $0F
|09F152| STA.b ($92),Y

|09F154| PLY
|09F155| INY

|09F156| PLX
|09F157| DEX
|09F158| BPL .next_char

;---------------------------------------------------------------------------------------------------

|09F15A| PLX

|09F15B| RTS

;===================================================================================================

pool GarnishDraw_ThrownItemDebris

.offset_x
|09F15C| dw  -8,   8,  16
|09F162| dw  -5,   8,  15
|09F168| dw  -1,   7,  11
|09F16E| dw   1,   3,   8

.offset_y
|09F174| db   7,   2,  12
|09F177| db   9,   2,  10
|09F17A| db  11,   2,  11
|09F17D| db   7,   3,   8

.char
|09F180| db $E2, $E2, $E2
|09F183| db $E2, $F2, $F2
|09F186| db $F2, $E2, $E2
|09F189| db $F2, $E2, $E2

.prop
|09F18C| db $00, $00, $00
|09F18F| db $00, $80, $40
|09F192| db $00, $80, $40
|09F195| db $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

GarnishDraw_ThrownItemDebris:
|09F198| LDA.l $7FF90E,X
|09F19C| CMP.b #$10
|09F19E| BNE .skip

|09F1A0| LDA.b #$00
|09F1A2| STA.l $7FF800,X

.skip
|09F1A6| AND.b #$0F
|09F1A8| LSR A
|09F1A9| LSR A
|09F1AA| STA.b $06

|09F1AC| ASL A
|09F1AD| ADC.b $06
|09F1AF| STA.b $06

|09F1B1| LDY.b #$00

|09F1B3| PHX

;---------------------------------------------------------------------------------------------------

|09F1B4| LDX.b #$02

.next_object
|09F1B6| PHX

|09F1B7| TXA
|09F1B8| CLC
|09F1B9| ADC.b $06
|09F1BB| PHA

|09F1BC| ASL A
|09F1BD| TAX

|09F1BE| REP #$20

|09F1C0| LDA.b $00
|09F1C2| CLC
|09F1C3| ADC.w .offset_x,X
|09F1C6| STA.b ($90),Y

|09F1C8| AND.w #$0100
|09F1CB| STA.b $0E

|09F1CD| SEP #$20

|09F1CF| PLX

|09F1D0| LDA.b $02
|09F1D2| CLC
|09F1D3| ADC.w .offset_y,X

|09F1D6| INY
|09F1D7| STA.b ($90),Y

|09F1D9| LDA.w .char,X
|09F1DC| INY
|09F1DD| STA.b ($90),Y

|09F1DF| LDA.w .prop,X
|09F1E2| INY
|09F1E3| ORA.b #$22
|09F1E5| STA.b ($90),Y

|09F1E7| PHY

|09F1E8| TYA
|09F1E9| LSR A
|09F1EA| LSR A
|09F1EB| TAY

|09F1EC| LDA.b $0F
|09F1EE| STA.b ($92),Y

|09F1F0| PLY
|09F1F1| INY

|09F1F2| PLX
|09F1F3| DEX
|09F1F4| BPL .next_object

;---------------------------------------------------------------------------------------------------

|09F1F6| PLX

|09F1F7| RTS

;===================================================================================================

KillThisSprite:
|09F1F8| LDA.w $0CAA,X
|09F1FB| AND.b #$40
|09F1FD| BNE .force_die

|09F1FF| LDA.b $1B
|09F201| BNE .exit

.force_die
|09F203| STZ.w $0DD0,X

|09F206| TXA
|09F207| ASL A
|09F208| TAY

|09F209| REP #$20

|09F20B| LDA.w $0BC0,Y
|09F20E| STA.b $00

|09F210| CMP.w #$FFFF
|09F213| PHP

|09F214| LSR A
|09F215| LSR A
|09F216| LSR A

|09F217| CLC
|09F218| ADC.w #$7FEF80
|09F21B| STA.b $01

|09F21D| PLP
|09F21E| SEP #$20
|09F220| BCS .out_of_range

|09F222| LDA.b #$7F
|09F224| STA.b $03

|09F226| PHX

|09F227| LDA.b $00
|09F229| AND.b #$07
|09F22B| TAX

|09F22C| LDA.b [$01]
|09F22E| AND.l SpriteDeathMasks,X
|09F232| STA.b [$01]

|09F234| PLX

;---------------------------------------------------------------------------------------------------

.out_of_range
|09F235| LDA.b $1B
|09F237| BNE .indoors

|09F239| TXA
|09F23A| ASL A
|09F23B| TAY

|09F23C| LDA.b #$FF
|09F23E| STA.w $0BC0,Y
|09F241| STA.w $0BC1,Y

|09F244| RTL

;---------------------------------------------------------------------------------------------------

.indoors
|09F245| LDA.b #$FF
|09F247| STA.w $0BC0,X

;---------------------------------------------------------------------------------------------------

.exit
|09F24A| RTL

;---------------------------------------------------------------------------------------------------

SpriteDeathMasks:
|09F24B| db $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

;===================================================================================================
; FREE ROM: 0x1D
;===================================================================================================
NULL_09F253:
|09F253| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F25B| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F263| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F26B| db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

pool Module12_GameOver

.vectors
|09F270| dw GameOver_AdvanceImmediately      ; 0x00
|09F272| dw GameOver_InitializeAndFadeMusic  ; 0x01
|09F274| dw GameOver_DelayBeforeIris         ; 0x02
|09F276| dw GameOver_IrisWipe                ; 0x03
|09F278| dw SpinAndDie_bounce                ; 0x04
|09F27A| dw GameOver_SplatAndFade            ; 0x05
|09F27C| dw GameOver_LoadGAMEOVR             ; 0x06
|09F27E| dw Animate_GAMEOVER_Letters_bounce  ; 0x07
|09F280| dw GameOver_Finalize_GAMEOVR        ; 0x08
|09F282| dw GameOver_SaveAndOrContinue       ; 0x09
|09F284| dw GameOver_InitializeRevivalFairy  ; 0x0A
|09F286| dw RevivalFairy_bounce              ; 0x0B
|09F288| dw GameOver_RiseALittle             ; 0x0C
|09F28A| dw GameOver_Restore0D               ; 0x0D
|09F28C| dw GameOver_Restore0E               ; 0x0E
|09F28E| dw GameOver_ResituateLink           ; 0x0F

endpool

;---------------------------------------------------------------------------------------------------

Module12_GameOver:
|09F290| LDA.b $11
|09F292| ASL A
|09F293| TAX

|09F294| JSR (.vectors,X)

|09F297| LDA.b $11
|09F299| CMP.b #$09
|09F29B| BEQ .exit

|09F29D| JSL DrawLink

.exit
|09F2A1| RTL

;===================================================================================================

GameOver_AdvanceImmediately:
|09F2A2| INC.b $11

;===================================================================================================

GameOver_InitializeAndFadeMusic:
|09F2A4| LDA.w $0130
|09F2A7| STA.l $7EC227

|09F2AB| LDA.w $0131
|09F2AE| STA.l $7EC228

|09F2B2| LDA.b #$F1 ; SONG F1 - fade
|09F2B4| STA.w $012C

|09F2B7| LDA.b #$05 ; SFX1.05
|09F2B9| STA.w $012D
|09F2BC| STA.w $0200

|09F2BF| STZ.w $03F3
|09F2C2| STZ.w $0322

|09F2C5| STZ.b $55

;---------------------------------------------------------------------------------------------------

|09F2C7| REP #$20

|09F2C9| LDA.l $7EC007
|09F2CD| STA.l $7EC221

|09F2D1| LDA.l $7EC009
|09F2D5| STA.l $7EC223

;---------------------------------------------------------------------------------------------------

|09F2D9| LDX.b #$00

.next
|09F2DB| LDA.l $7EC300,X
|09F2DF| STA.l $7FDD80,X

|09F2E3| LDA.l $7EC340,X
|09F2E7| STA.l $7FDDC0,X

|09F2EB| LDA.l $7EC380,X
|09F2EF| STA.l $7FDE00,X

|09F2F3| LDA.l $7EC3C0,X
|09F2F7| STA.l $7FDE40,X

|09F2FB| LDA.w #$0000 ; RGB: #000000
|09F2FE| STA.l $7EC340,X
|09F302| STA.l $7EC380,X
|09F306| STA.l $7EC3C0,X

|09F30A| INX
|09F30B| INX
|09F30C| CPX.b #$40
|09F30E| BNE .next

;---------------------------------------------------------------------------------------------------

|09F310| STA.l $7EC007
|09F314| STA.l $7EC009

|09F318| STZ.w $011A
|09F31B| STZ.w $011C

|09F31E| LDA.b $99
|09F320| STA.l $7EC225

|09F324| SEP #$20

|09F326| LDA.b #$20
|09F328| STA.b $C8

|09F32A| STZ.w $04A0

|09F32D| JSL HandleFloorIndicator

|09F331| INC.b $16

|09F333| LDA.b #$05 ; SFX1.05
|09F335| STA.w $012D

|09F338| INC.b $11

|09F33A| RTS

;===================================================================================================

GameOver_DelayBeforeIris:
|09F33B| DEC.b $C8
|09F33D| BNE .exit

|09F33F| JSL InitializeGAMEOVERLetters
|09F343| JSL IrisSpotlight_close

|09F347| LDA.b #$30
|09F349| STA.b $98
|09F34B| STZ.b $97

|09F34D| INC.b $11

.exit
|09F34F| RTS

;===================================================================================================

GameOver_IrisWipe:
|09F350| JSL PaletteFilter_RestoreBGSubstractiveStrict

|09F354| LDA.l $7EC540
|09F358| STA.l $7EC500

|09F35C| LDA.l $7EC541
|09F360| STA.l $7EC501

|09F364| LDA.b $10

|09F366| PHA

|09F367| JSL IrisSpotlight_ConfigureTable

|09F36B| PLA
|09F36C| STA.b $10

|09F36E| LDA.b $11
|09F370| BNE .exit

;---------------------------------------------------------------------------------------------------

|09F372| REP #$20

|09F374| LDA.w #$0018 ; RGB: #C00000
|09F377| LDX.b #$00

.next_red
|09F379| STA.l $7EC540,X
|09F37D| STA.l $7EC560,X

|09F381| STA.l $7EC580,X
|09F385| STA.l $7EC5A0,X

|09F389| STA.l $7EC5C0,X
|09F38D| STA.l $7EC5E0,X

|09F391| INX
|09F392| INX
|09F393| CPX.b #$20
|09F395| BNE .next_red

|09F397| STA.l $7EC500
|09F39B| STA.l $7EC540

;---------------------------------------------------------------------------------------------------

|09F39F| SEP #$20

|09F3A1| JSL IrisSpotlight_ResetTable

|09F3A5| LDA.b #$20 ; Fixed color RGB: #000000
|09F3A7| STA.b $9C

|09F3A9| LDA.b #$40
|09F3AB| STA.b $9D

|09F3AD| LDA.b #$80
|09F3AF| STA.b $9E

|09F3B1| STZ.b $96
|09F3B3| STZ.b $97
|09F3B5| STZ.b $98

;---------------------------------------------------------------------------------------------------

|09F3B7| LDA.b #$04
|09F3B9| STA.b $11

|09F3BB| INC.b $15

|09F3BD| LDA.b #$0F
|09F3BF| STA.b $13

|09F3C1| LDA.b #$14
|09F3C3| STA.b $1C
|09F3C5| STZ.b $1D

|09F3C7| LDA.b #$20
|09F3C9| STA.b $9A

|09F3CB| LDA.b #$40
|09F3CD| STA.b $C8

;---------------------------------------------------------------------------------------------------

|09F3CF| LDA.b #$00
|09F3D1| STA.l $7EC007
|09F3D5| STA.l $7EC009

|09F3D9| JSL PrepareToDie

.exit
|09F3DD| RTS

;===================================================================================================

GameOver_SplatAndFade:
|09F3DE| LDA.b $C8
|09F3E0| BNE .delay

|09F3E2| JSL PaletteFilter_RestoreBGSubstractiveStrict

|09F3E6| LDA.l $7EC540
|09F3EA| STA.l $7EC500

|09F3EE| LDA.l $7EC541
|09F3F2| STA.l $7EC501

|09F3F6| LDA.l $7EC009
|09F3FA| CMP.b #$FF
|09F3FC| BNE .exit

|09F3FE| LDA.b #$00
|09F400| STA.l $7EC011
|09F404| STA.w $0647

|09F407| LDA.b #$03
|09F409| STA.b $95

;---------------------------------------------------------------------------------------------------

|09F40B| LDX.b #$00

|09F40D| LDA.b #$06
|09F40F| CMP.l $7EF35C
|09F413| BEQ .load_gfx

|09F415| INX

|09F416| CMP.l $7EF35D
|09F41A| BEQ .load_gfx

|09F41C| INX

|09F41D| CMP.l $7EF35E
|09F421| BEQ .load_gfx

|09F423| INX

|09F424| CMP.l $7EF35F
|09F428| BEQ .load_gfx

;---------------------------------------------------------------------------------------------------

|09F42A| STZ.w $05FC
|09F42D| STZ.w $05FD

|09F430| LDA.b #$16
|09F432| STA.b $17
|09F434| STA.w $0710

|09F437| INC.b $11

.exit
|09F439| RTS

;---------------------------------------------------------------------------------------------------

.delay
|09F43A| DEC.b $C8

|09F43C| RTS

;---------------------------------------------------------------------------------------------------

.load_gfx
|09F43D| LDA.b #$02
|09F43F| STA.l $7EF35C,X

|09F443| LDA.b #$0C
|09F445| STA.b $C8

|09F447| LDA.b #$0F
|09F449| STA.w $0AAA

|09F44C| JSL LoadChrHalfSlot

|09F450| STZ.w $0AAA

|09F453| LDA.b #$0A
|09F455| STA.b $11

|09F457| RTS

;===================================================================================================

GameOver_LoadGAMEOVR:
|09F458| LDA.b #$0C
|09F45A| STA.b $C8

|09F45C| LDA.b #$0F
|09F45E| STA.w $0AAA

|09F461| JSL LoadChrHalfSlot

|09F465| STZ.w $0AAA

;---------------------------------------------------------------------------------------------------

|09F468| LDA.b #$05
|09F46A| STA.w $0AB1

|09F46D| LDA.b #$02
|09F46F| STA.w $0AA9

|09F472| JSL PaletteLoad_SpriteEnvironment_Underworld
|09F476| JSL PaletteLoad_SpriteMain

|09F47A| INC.b $15
|09F47C| INC.b $11

;===================================================================================================

SpinAndDie_bounce:
|09F47E| JSL SpinAndDie

|09F482| RTS

;===================================================================================================

Animate_GAMEOVER_Letters_bounce:
|09F483| JSL Animate_GAMEOVER_Letters

|09F487| RTS

;===================================================================================================

GameOver_Finalize_GAMEOVR:
|09F488| JSL Animate_GAMEOVER_Letters

|09F48C| LDA.b $10
|09F48E| PHA

|09F48F| LDA.b $11
|09F491| PHA

|09F492| LDA.b #$02
|09F494| STA.w $1CD8

|09F497| JSL RenderText

|09F49B| PLA
|09F49C| INC A
|09F49D| STA.b $11

|09F49F| PLA
|09F4A0| STA.b $10

|09F4A2| LDA.b #$02
|09F4A4| STA.b $C8

|09F4A6| LDA.b #$0B ; SONG 0B
|09F4A8| STA.w $012C

;---------------------------------------------------------------------------------------------------

#EXIT_09F4AB:
|09F4AB| RTS

;===================================================================================================

MaxHealthBasedSpawnHP:
|09F4AC| db $18, $18, $18, $18, $18, $20, $20, $28
|09F4B4| db $28, $30, $30, $38, $38, $38, $40, $40
|09F4BC| db $40, $48, $48, $48, $50

;===================================================================================================

GameOver_SaveAndOrContinue:
|09F4C1| JSR GameOver_AnimateChoiceFairy

|09F4C4| LDA.w $0C4A
|09F4C7| BEQ .no_more_gameover

|09F4C9| JSL Animate_GAMEOVER_Letters

.no_more_gameover
|09F4CD| LDA.b $F4
|09F4CF| AND.b #$20
|09F4D1| BNE .pressed_select

|09F4D3| DEC.b $C8
|09F4D5| BNE .check_for_choice_input

|09F4D7| INC.b $C8

|09F4D9| LDA.b $F0
|09F4DB| AND.b #$0C
|09F4DD| BEQ .check_for_choice_input

|09F4DF| AND.b #$04
|09F4E1| BEQ .pressed_down

.pressed_select
|09F4E3| INC.b $B0

|09F4E5| LDA.b $B0
|09F4E7| CMP.b #$03
|09F4E9| BMI .play_sfx

|09F4EB| STZ.b $B0
|09F4ED| BRA .play_sfx

.pressed_down
|09F4EF| DEC.b $B0
|09F4F1| BPL .play_sfx

|09F4F3| LDA.b #$02
|09F4F5| STA.b $B0

.play_sfx
|09F4F7| LDA.b #$0C
|09F4F9| STA.b $C8

|09F4FB| LDA.b #$20 ; SFX3.20
|09F4FD| STA.w $012F

;---------------------------------------------------------------------------------------------------

.check_for_choice_input
|09F500| LDA.b $F6
|09F502| AND.b #$C0

|09F504| ORA.b $F4
|09F506| AND.b #$D0
|09F508| BEQ EXIT_09F4AB

|09F50A| LDA.b #$2C ; SFX2.2C
|09F50C| STA.w $012E

;===================================================================================================

GameOver_FadeAndRevive:
|09F50F| LDA.b #$F1 ; SONG F1 - fade
|09F511| STA.w $012C

|09F514| LDA.b $1B
|09F516| BEQ .outdoors

|09F518| JSL FullyUpdateRoomFlags

;---------------------------------------------------------------------------------------------------

.outdoors
|09F51C| JSL AdjustLinkBunnyStatus

|09F520| LDA.l $7EF3C5
|09F524| CMP.b #$03
|09F526| BCS .dont_skip_bunniness

|09F528| LDA.b #$00
|09F52A| STA.l $7EF3CA

|09F52E| LDA.l $7EF357
|09F532| BNE .dont_skip_bunniness

|09F534| JSL ForceNonbunnyStatus

.dont_skip_bunniness
|09F538| LDA.b $A0 ; ROOM 0000
|09F53A| ORA.b $A1
|09F53C| BNE .not_ganon

|09F53E| STZ.b $1B

.not_ganon
|09F540| JSL ResetSomeThingsAfterDeath

;---------------------------------------------------------------------------------------------------

|09F544| LDA.l $7EF3CC
|09F548| CMP.b #$06 ; FOLLOWER 06
|09F54A| BEQ .lose_follower

|09F54C| CMP.b #$0D ; FOLLOWER 0D
|09F54E| BEQ .lose_follower

|09F550| CMP.b #$0A ; FOLLOWER 0A
|09F552| BEQ .lose_follower

|09F554| CMP.b #$09 ; FOLLOWER 09
|09F556| BNE .keep_follower

.lose_follower
|09F558| LDA.b #$00
|09F55A| STA.l $7EF3CC

;---------------------------------------------------------------------------------------------------

.keep_follower
|09F55E| LDA.l $7EF36C
|09F562| LSR A
|09F563| LSR A
|09F564| LSR A
|09F565| TAX

|09F566| LDA.l MaxHealthBasedSpawnHP,X
|09F56A| STA.l $7EF36D
|09F56E| STA.w $04AA

|09F571| LDA.w $040C
|09F574| CMP.b #$FF ; DUNGEON FF
|09F576| BEQ .cave

|09F578| CMP.b #$02 ; DUNGEON 02
|09F57A| BNE .castle

|09F57C| LDA.b #$00 ; DUNGEON 00

.castle
|09F57E| LSR A
|09F57F| TAX

|09F580| LDA.l $7EF36F
|09F584| STA.l $7EF37C,X

.cave
|09F588| JSL ResetAllSprites

;---------------------------------------------------------------------------------------------------

|09F58C| REP #$20

|09F58E| LDA.l $7EF405
|09F592| CMP.w #$FFFF
|09F595| BNE .deaths_not_maxed

|09F597| LDA.l $7EF403
|09F59B| INC A
|09F59C| STA.l $7EF403

.deaths_not_maxed
|09F5A0| SEP #$20

|09F5A2| INC.w $010A

|09F5A5| LDA.b $B0
|09F5A7| CMP.b #$01
|09F5A9| BEQ GameOver_SaveAndQuit

;---------------------------------------------------------------------------------------------------

|09F5AB| LDA.b $1B
|09F5AD| BEQ .died_in_overworld

|09F5AF| LDA.l $7EF3CC
|09F5B3| CMP.b #$01 ; FOLLOWER 01
|09F5B5| BEQ .use_this_spawn

|09F5B7| LDA.w $040C
|09F5BA| CMP.b #$FF ; DUNGEON FF
|09F5BC| BEQ .died_in_cave

|09F5BE| STZ.w $04AA
|09F5C1| BRA .use_this_spawn

.died_in_cave
|09F5C3| STZ.w $0132
|09F5C6| STZ.b $1B

.died_in_overworld
|09F5C8| LDA.l $7EF3CA
|09F5CC| BEQ .use_this_spawn

|09F5CE| LDA.b #$20
|09F5D0| STA.b $A0
|09F5D2| STZ.b $A1

.use_this_spawn
|09F5D4| LDA.l $7EF3C5
|09F5D8| BEQ .no_progress

|09F5DA| LDA.b $B0
|09F5DC| BNE .dont_save

|09F5DE| JSL SaveGameFile

.dont_save
|09F5E2| LDA.b #$05
|09F5E4| STA.b $10

|09F5E6| STZ.b $11
|09F5E8| STZ.b $14

|09F5EA| RTS

;---------------------------------------------------------------------------------------------------

.no_progress
|09F5EB| REP #$20

|09F5ED| LDA.l $701FFE
|09F5F1| TAX

|09F5F2| DEX
|09F5F3| DEX

|09F5F4| LDA.l SaveFileCopyOffsets,X
|09F5F8| STA.b $00

|09F5FA| SEP #$20

|09F5FC| STZ.w $010A

|09F5FF| JSL CopySaveToWRAM

|09F603| RTS

;===================================================================================================

GameOver_SaveAndQuit:
|09F604| LDA.l $7EF3C5
|09F608| BEQ .no_progress

|09F60A| JSL SaveGameFile

.no_progress
|09F60E| LDA.b #$10
|09F610| STA.b $1C
|09F612| STZ.b $1B

|09F614| JSL InitializeTriforceIntro

|09F618| STZ.w $04AA
|09F61B| STZ.w $010A
|09F61E| STZ.w $0132

|09F621| SEI

|09F622| STZ.w NMITIMEN
|09F625| STZ.w HDMAEN

|09F628| REP #$30

|09F62A| STZ.b $E0
|09F62C| STZ.b $E2
|09F62E| STZ.b $E4
|09F630| STZ.b $E6
|09F632| STZ.b $E8
|09F634| STZ.b $EA

|09F636| STZ.w $0120
|09F639| STZ.w $011E
|09F63C| STZ.w $0124
|09F63F| STZ.w $0122

;---------------------------------------------------------------------------------------------------

|09F642| LDX.w #$0000
|09F645| TXA

.delete_next
|09F646| STA.l $7EF000,X
|09F64A| STA.l $7EF100,X
|09F64E| STA.l $7EF200,X
|09F652| STA.l $7EF300,X
|09F656| STA.l $7EF400,X

|09F65A| INX
|09F65B| INX
|09F65C| CPX.w #$0100
|09F65F| BNE .delete_next

;---------------------------------------------------------------------------------------------------

|09F661| SEP #$30

|09F663| STZ.w $0136

|09F666| LDA.b #$FF ; SONG FF - transfer
|09F668| STA.w APUIO0

|09F66B| JSL LoadOverworldSongs

|09F66F| LDA.b #$81
|09F671| STA.w NMITIMEN

|09F674| RTS

;===================================================================================================

pool GameOver_AnimateChoiceFairy

.fairy_char
|09F675| db $EA
|09F676| db $EC

.fairy_height
|09F677| db $7F
|09F678| db $8F
|09F679| db $9F

endpool

;---------------------------------------------------------------------------------------------------

GameOver_AnimateChoiceFairy:
|09F67A| PHB
|09F67B| PHK
|09F67C| PLB

|09F67D| LDX.b $B0

|09F67F| LDA.b #$34
|09F681| STA.w $0850

|09F684| LDA.w .fairy_height,X
|09F687| STA.w $0851

|09F68A| LDA.b $1A
|09F68C| AND.b #$08
|09F68E| LSR A
|09F68F| LSR A
|09F690| LSR A
|09F691| TAX

|09F692| LDA.w .fairy_char,X
|09F695| STA.w $0852

|09F698| LDA.b #$78
|09F69A| STA.w $0853

|09F69D| LDA.b #$02
|09F69F| STA.w $0A34

|09F6A2| PLB

|09F6A3| RTS

;===================================================================================================

GameOver_InitializeRevivalFairy:
|09F6A4| JSL ConfigureRevivalAncillae

|09F6A8| LDA.b #$38
|09F6AA| STA.l $7EF372

|09F6AE| INC.b $11

|09F6B0| STZ.w $0200

|09F6B3| RTS

;===================================================================================================

RevivalFairy_bounce:
|09F6B4| JSL RevivalFairy

|09F6B8| RTS

;===================================================================================================

GameOver_RiseALittle:
|09F6B9| LDA.l $7EF372
|09F6BD| BNE GameOver_RunFairyRefill

;---------------------------------------------------------------------------------------------------

|09F6BF| REP #$20

|09F6C1| LDX.b #$00

.next_color
|09F6C3| LDA.l $7FDD80,X
|09F6C7| STA.l $7EC300,X

|09F6CB| LDA.l $7FDDC0,X
|09F6CF| STA.l $7EC340,X

|09F6D3| LDA.l $7FDE00,X
|09F6D7| STA.l $7EC380,X

|09F6DB| LDA.l $7FDE40,X
|09F6DF| STA.l $7EC3C0,X

|09F6E3| LDA.w #$0000 ; RGB: #000000
|09F6E6| STA.l $7EC540,X
|09F6EA| STA.l $7EC580,X
|09F6EE| STA.l $7EC5C0,X

|09F6F2| INX
|09F6F3| INX
|09F6F4| CPX.b #$40
|09F6F6| BNE .next_color

;---------------------------------------------------------------------------------------------------

|09F6F8| STA.l $7EC500

|09F6FC| LDA.w #$0000
|09F6FF| STA.l $7EC007

|09F703| LDA.w #$0002
|09F706| STA.l $7EC009

|09F70A| LDA.l $7EC225
|09F70E| STA.b $99

|09F710| SEP #$20

;===================================================================================================

GameOver_AriseAdvancement:
|09F712| INC.b $11

;===================================================================================================

GameOver_RunFairyRefill:
|09F714| JSL RevivalFairy
|09F718| JSL HandleItemRefills

|09F71C| RTS

;===================================================================================================

GameOver_Restore0D:
|09F71D| LDA.w $020A
|09F720| BNE GameOver_RunFairyRefill

|09F722| LDA.b #$01
|09F724| STA.w $0AAA

|09F727| JSL LoadChrHalfSlot

|09F72B| LDA.l $7EC017
|09F72F| JSL ApplyGrayscaleFixed_Parameterized

|09F733| BRA GameOver_AriseAdvancement

;===================================================================================================

GameOver_Restore0E:
|09F735| JSL LoadChrHalfSlot

|09F739| LDA.l $7EC212
|09F73D| STA.b $1D

|09F73F| INC.b $11

|09F741| RTS

;===================================================================================================

GameOver_ResituateLink:
|09F742| JSL PaletteFilter_RestoreBGAdditiveStrict

|09F746| LDA.l $7EC540
|09F74A| STA.l $7EC500

|09F74E| LDA.l $7EC541
|09F752| STA.l $7EC501

|09F756| LDA.l $7EC007
|09F75A| CMP.b #$20
|09F75C| BNE EXIT_09F79A

|09F75E| LDA.b $1B
|09F760| BNE .indoors

|09F762| JSL Overworld_SetFixedColAndScroll

;---------------------------------------------------------------------------------------------------

.indoors
|09F766| LDA.l $7EC212
|09F76A| STA.b $1D

|09F76C| LDA.w $010C
|09F76F| STA.b $10
|09F771| STZ.b $11

|09F773| LDA.b #$90
|09F775| STA.w $031F

|09F778| LDA.l $7EC227
|09F77C| STA.w $012C

|09F77F| LDA.l $7EC228
|09F783| STA.w $012D

|09F786| REP #$20

|09F788| LDA.l $7EC221
|09F78C| STA.l $7EC007

|09F790| LDA.l $7EC223
|09F794| STA.l $7EC009

|09F798| SEP #$20

;---------------------------------------------------------------------------------------------------

#EXIT_09F79A:
|09F79A| RTS

;===================================================================================================

pool Module17_SaveAndQuit

.submodules
|09F79B| dw Module17_00
|09F79D| dw Module17_01

endpool

;---------------------------------------------------------------------------------------------------

Module17_SaveAndQuit:
|09F79F| LDA.b $11
|09F7A1| ASL A
|09F7A2| TAX

|09F7A3| JSR (.submodules,X)

|09F7A6| JSL HandleAllSprites
|09F7AA| JSL DrawLink

|09F7AE| RTL

;===================================================================================================

Module17_00:
|09F7AF| INC.b $11

;===================================================================================================

Module17_01:
|09F7B1| DEC.b $13
|09F7B3| BNE EXIT_09F79A

|09F7B5| LDA.b #$0F
|09F7B7| STA.b $95

|09F7B9| LDA.b #$01
|09F7BB| STA.b $B0

|09F7BD| JMP.w GameOver_FadeAndRevive

;===================================================================================================
; FREE ROM: 0x1E
;===================================================================================================
NULL_09F7C0:
|09F7C0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F7C8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F7D0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|09F7D8| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Polyhedral_InitializeThread:
|09F7DE| PHP
|09F7DF| PHB

|09F7E0| REP #$30

|09F7E2| PHA
|09F7E3| PHX
|09F7E4| PHY

|09F7E5| LDA.w #$0000
|09F7E8| STA.l $001F00

|09F7EC| LDX.w #$001F00
|09F7EF| LDY.w #$001F02
|09F7F2| LDA.w #$00FD
|09F7F5| MVN $00, $00

|09F7F8| LDA.w #$001F31
|09F7FB| STA.w $1F0A

|09F7FE| LDA.w #$000C
|09F801| LDX.w #.registers
|09F804| LDY.w #$001F32
|09F807| MVN ^Polyhedral_InitializeThread, $00

|09F80A| PLY
|09F80B| PLX
|09F80C| PLA

|09F80D| PLB
|09F80E| PLP

|09F80F| RTL

;---------------------------------------------------------------------------------------------------

.registers
|09F810| db ^Polyhedral_RunThread      ; data bank
|09F811| dw $1F00                      ; direct page
|09F813| dw $0000                      ; Y
|09F815| dw $0000                      ; X
|09F817| dw $0000                      ; A
|09F819| db $30                        ; P
|09F81A| dl Polyhedral_RunThread

;===================================================================================================

Polyhedral_RunThread:

.wait
|09F81D| LDA.b $001F00
|09F81F| BEQ .wait

|09F821| LDA.b $001F0C
|09F823| BNE .wait

|09F825| JSL Polyhedral_EmptyBitMapBuffer
|09F829| JSR Polyhedral_SetShapePointer
|09F82C| JSR Polyhedral_SetRotationMatrix
|09F82F| JSR Polyhedral_OperateRotation
|09F832| JSR Polyhedral_DrawPolyhedron

|09F835| STZ.b $001F00

|09F837| LDA.b #$FF
|09F839| STA.b $001F0C

|09F83B| BRA .wait

;===================================================================================================

Polyhedral_SetShapePointer:
|09F83D| REP #$30

|09F83F| LDA.b $001F02
|09F841| AND.w #$00FF
|09F844| ASL A
|09F845| ADC.w #$0080
|09F848| STA.b $001F08

|09F84A| LDA.w $1F03
|09F84D| AND.w #$00FF
|09F850| ASL A
|09F851| STA.b $001FB0

|09F853| ASL A
|09F854| ADC.b $001FB0
|09F856| ADC.w #PolyhedralPropertyTable
|09F859| TAX

|09F85A| LDY.w #$001F3F
|09F85D| LDA.w #$0005
|09F860| MVN ^PolyhedralPropertyTable, ^PolyhedralPropertyTable

|09F863| RTS

;===================================================================================================

Polyhedral_SetRotationMatrix:
|09F864| SEP #$30

|09F866| LDY.b $001F04

|09F868| LDA.w Polyhedral_SineTable,Y
|09F86B| STA.b $001F50

|09F86D| CMP.b #$80
|09F86F| SBC.b $001F50
|09F871| EOR.b #$FF
|09F873| STA.b $001F51

|09F875| LDA.w Polyhedral_CosineTable,Y
|09F878| STA.b $001F52

|09F87A| CMP.b #$80
|09F87C| SBC.b $001F52
|09F87E| EOR.b #$FF
|09F880| STA.b $001F53

;---------------------------------------------------------------------------------------------------

|09F882| LDY.b $001F05

|09F884| LDA.w Polyhedral_SineTable,Y
|09F887| STA.b $001F54

|09F889| CMP.b #$80
|09F88B| SBC.b $001F54

|09F88D| EOR.b #$FF
|09F88F| STA.b $001F55

|09F891| LDA.w Polyhedral_CosineTable,Y
|09F894| STA.b $001F56

|09F896| CMP.b #$80
|09F898| SBC.b $001F56

|09F89A| EOR.b #$FF
|09F89C| STA.b $001F57

;---------------------------------------------------------------------------------------------------

|09F89E| REP #$20

|09F8A0| SEI

|09F8A1| LDX.b $001F54
|09F8A3| STX.w PPUMULT16

|09F8A6| LDX.b $001F55
|09F8A8| STX.w PPUMULT16

|09F8AB| LDX.b $001F50
|09F8AD| STX.w PPUMULT8

|09F8B0| LDA.w MPYM
|09F8B3| ASL A
|09F8B4| ASL A
|09F8B5| STA.b $001F58

;---------------------------------------------------------------------------------------------------

|09F8B7| LDX.b $001F56
|09F8B9| STX.w PPUMULT16

|09F8BC| LDX.b $001F57
|09F8BE| STX.w PPUMULT16

|09F8C1| LDX.b $001F52
|09F8C3| STX.w PPUMULT8

|09F8C6| LDA.w MPYM
|09F8C9| ASL A
|09F8CA| ASL A
|09F8CB| STA.b $001F5E

;---------------------------------------------------------------------------------------------------

|09F8CD| LDX.b $001F56
|09F8CF| STX.w PPUMULT16

|09F8D2| LDX.b $001F57
|09F8D4| STX.w PPUMULT16

|09F8D7| LDX.b $001F50
|09F8D9| STX.w PPUMULT8

|09F8DC| LDA.w MPYM
|09F8DF| ASL A
|09F8E0| ASL A
|09F8E1| STA.b $001F5A

;---------------------------------------------------------------------------------------------------

|09F8E3| LDX.b $001F54
|09F8E5| STX.w PPUMULT16

|09F8E8| LDX.b $001F55
|09F8EA| STX.w PPUMULT16

|09F8ED| LDX.b $001F52
|09F8EF| STX.w PPUMULT8

|09F8F2| LDA.w MPYM
|09F8F5| ASL A
|09F8F6| ASL A
|09F8F7| STA.b $001F5C

;---------------------------------------------------------------------------------------------------

|09F8F9| CLI

|09F8FA| RTS

;===================================================================================================

Polyhedral_OperateRotation:
|09F8FB| SEP #$30

|09F8FD| LDA.b $001F3F
|09F8FF| TAX

|09F900| ASL A
|09F901| ADC.b $001F3F
|09F903| TAY

.next
|09F904| DEX
|09F905| DEY

|09F906| LDA.b ($001F41),Y
|09F908| STA.b $001F47

|09F90A| DEY

|09F90B| LDA.b ($001F41),Y
|09F90D| STA.b $001F46

|09F90F| DEY
|09F910| LDA.b ($001F41),Y
|09F912| STA.b $001F45

|09F914| PHY

|09F915| REP #$20

|09F917| JSR Polyhedral_RotatePoint
|09F91A| JSR Polyhedral_ProjectPoint

|09F91D| SEP #$20
|09F91F| CLC

|09F920| LDA.b $001F06
|09F922| ADC.b $001F48
|09F924| STA.b $001F60,X

|09F926| SEC

|09F927| LDA.b $001F07
|09F929| SBC.b $001F4A
|09F92B| STA.b $001F88,X

|09F92D| PLY
|09F92E| BNE .next

|09F930| RTS

;===================================================================================================

Polyhedral_RotatePoint:
|09F931| LDY.b $001F56

|09F933| SEI

|09F934| STY.w PPUMULT16

|09F937| LDY.b $001F57
|09F939| STY.w PPUMULT16

|09F93C| LDY.b $001F45
|09F93E| STY.w PPUMULT8

|09F941| LDA.w MPYL

|09F944| LDY.b $001F54
|09F946| STY.w PPUMULT16

|09F949| LDY.b $001F55
|09F94B| STY.w PPUMULT16

|09F94E| LDY.b $001F47
|09F950| STY.w PPUMULT8

|09F953| SEC
|09F954| SBC.w MPYL

|09F957| CLI

|09F958| STA.b $001F48

;---------------------------------------------------------------------------------------------------

|09F95A| LDY.b $001F58

|09F95C| SEI

|09F95D| STY.w PPUMULT16

|09F960| LDY.b $001F59
|09F962| STY.w PPUMULT16

|09F965| LDY.b $001F45
|09F967| STY.w PPUMULT8

|09F96A| LDA.w MPYL

|09F96D| LDY.b $001F52
|09F96F| STY.w PPUMULT16

|09F972| LDY.b $001F53
|09F974| STY.w PPUMULT16

|09F977| LDY.b $001F46
|09F979| STY.w PPUMULT8

|09F97C| CLC
|09F97D| ADC.w MPYL

|09F980| LDY.b $001F5A
|09F982| STY.w PPUMULT16

|09F985| LDY.b $001F5B
|09F987| STY.w PPUMULT16

|09F98A| LDY.b $001F47
|09F98C| STY.w PPUMULT8

|09F98F| CLC
|09F990| ADC.w MPYL

|09F993| CLI

|09F994| STA.b $001F4A

;---------------------------------------------------------------------------------------------------

|09F996| LDY.b $001F5C

|09F998| SEI

|09F999| STY.w PPUMULT16

|09F99C| LDY.b $001F5D
|09F99E| STY.w PPUMULT16

|09F9A1| LDY.b $001F45
|09F9A3| STY.w PPUMULT8

|09F9A6| LDA.w MPYM

|09F9A9| LDY.b $001F50
|09F9AB| STY.w PPUMULT16

|09F9AE| LDY.b $001F51
|09F9B0| STY.w PPUMULT16

|09F9B3| LDY.b $001F46
|09F9B5| STY.w PPUMULT8

|09F9B8| SEC
|09F9B9| SBC.w MPYM

|09F9BC| LDY.b $001F5E
|09F9BE| STY.w PPUMULT16

|09F9C1| LDY.b $001F5F
|09F9C3| STY.w PPUMULT16

|09F9C6| LDY.b $001F47
|09F9C8| STY.w PPUMULT8

|09F9CB| CLC
|09F9CC| ADC.w MPYM

|09F9CF| REP #$05

|09F9D1| ADC.b $001F08
|09F9D3| STA.b $001F4C

|09F9D5| RTS

;===================================================================================================

Polyhedral_ProjectPoint:
|09F9D6| LDA.b $001F48
|09F9D8| BPL .positive_a

|09F9DA| EOR.w #$FFFF
|09F9DD| INC A

.positive_a
|09F9DE| STA.b $001FB2

|09F9E0| LDA.b $001F4C
|09F9E2| STA.b $001FB0

|09F9E4| XBA
|09F9E5| AND.w #$00FF
|09F9E8| BEQ .zero_a

.shift_a
|09F9EA| LSR.b $001FB2
|09F9EC| LSR.b $001FB0
|09F9EE| LSR A
|09F9EF| BNE .shift_a

.zero_a
|09F9F1| SEI

|09F9F2| LDA.b $001FB2
|09F9F4| STA.w WRDIVL

|09F9F7| LDY.b $001FB0
|09F9F9| STY.w WRDIVB

|09F9FC| NOP
|09F9FD| NOP

|09F9FE| LDA.w #$0000
|09FA01| LDY.b $001F49
|09FA03| SEC
|09FA04| BMI .negative_a

|09FA06| NOP

|09FA07| LDA.w RDDIV

|09FA0A| BRA .continue

.negative_a
|09FA0C| SBC.w RDDIV

;---------------------------------------------------------------------------------------------------

.continue
|09FA0F| CLI

|09FA10| STA.b $001F48

|09FA12| LDA.b $001F4A
|09FA14| BPL .positive_b

|09FA16| EOR.w #$FFFF
|09FA19| INC A

.positive_b
|09FA1A| STA.b $001FB2

|09FA1C| LDA.b $001F4C
|09FA1E| STA.b $001FB0

|09FA20| XBA
|09FA21| AND.w #$00FF
|09FA24| BEQ .zero_b

.shift_b
|09FA26| LSR.b $001FB2
|09FA28| LSR.b $001FB0
|09FA2A| LSR A
|09FA2B| BNE .shift_b

.zero_b
|09FA2D| SEI

|09FA2E| LDA.b $001FB2
|09FA30| STA.w WRDIVL

|09FA33| LDY.b $001FB0
|09FA35| STY.w WRDIVB

|09FA38| NOP
|09FA39| NOP

|09FA3A| LDA.w #$0000
|09FA3D| LDY.b $001F4B
|09FA3F| SEC
|09FA40| BMI .negative_b

|09FA42| NOP

|09FA43| LDA.w RDDIV

|09FA46| BRA .exit

.negative_b
|09FA48| SBC.w RDDIV

;---------------------------------------------------------------------------------------------------

.exit
|09FA4B| CLI

|09FA4C| STA.b $001F4A

|09FA4E| RTS

;===================================================================================================

Polyhedral_DrawPolyhedron:
|09FA4F| SEP #$30

|09FA51| LDY.b #$00

.next
|09FA53| LDA.b ($001F43),Y
|09FA55| STA.b $001F4E

|09FA57| AND.b #$7F
|09FA59| STA.b $001FB0

|09FA5B| ASL A
|09FA5C| STA.b $001FC0

|09FA5E| INY

|09FA5F| LDX.b #$01

;---------------------------------------------------------------------------------------------------

.next_point
|09FA61| PHY

|09FA62| LDA.b ($001F43),Y
|09FA64| TAY

|09FA65| LDA.w $1F60,Y
|09FA68| STA.b $001FC0,X

|09FA6A| INX

|09FA6B| LDA.w $1F88,Y
|09FA6E| STA.b $001FC0,X

|09FA70| INX

|09FA71| PLY
|09FA72| INY

|09FA73| DEC.b $001FB0
|09FA75| BNE .next_point

;---------------------------------------------------------------------------------------------------

|09FA77| LDA.b ($001F43),Y
|09FA79| INY
|09FA7A| STA.b $001F4F

|09FA7C| PHY

|09FA7D| LDA.b $001FC0
|09FA7F| CMP.b #$06
|09FA81| BCC .to_next

|09FA83| JSR Polyhedral_CalculateCrossProduct
|09FA86| BMI .draw_back

|09FA88| BEQ .to_next

|09FA8A| JSR Polyhedral_SetForegroundColor
|09FA8D| JSL Polyhedral_DrawFace

.to_next
|09FA91| PLY

|09FA92| DEC.b $001F40
|09FA94| BNE .next

|09FA96| RTS

;---------------------------------------------------------------------------------------------------

.draw_back
|09FA97| LDA.b $001F4E
|09FA99| BPL .to_next

|09FA9B| REP #$20

|09FA9D| LDA.b $001FC0
|09FA9F| AND.w #$00FF
|09FAA2| TAY

|09FAA3| DEY

|09FAA4| LDX.b #$01

|09FAA6| LSR A
|09FAA7| LSR A
|09FAA8| STA.b $001FB0

;---------------------------------------------------------------------------------------------------

.next_back
|09FAAA| LDA.b $001FC0,X
|09FAAC| PHA

|09FAAD| LDA.w $1FC0,Y
|09FAB0| STA.b $001FC0,X

|09FAB2| PLA
|09FAB3| STA.w $1FC0,Y

|09FAB6| INX
|09FAB7| INX

|09FAB8| DEY
|09FAB9| DEY

|09FABA| DEC.b $001FB0
|09FABC| BNE .next_back

;---------------------------------------------------------------------------------------------------

|09FABE| SEP #$20

|09FAC0| JSR Polyhedral_SetBackgroundColor
|09FAC3| JSL Polyhedral_DrawFace

|09FAC7| JMP.w .to_next

;===================================================================================================

Polyhedral_SetForegroundColor:
|09FACA| LDA.b $001F01
|09FACC| BNE Polyhedral_SetFGShadeColor

|09FACE| LDA.b $001F4F
|09FAD0| AND.b #$07
|09FAD2| JSL Polyhedral_SetColorMask

|09FAD6| RTS

;===================================================================================================

Polyhedral_SetBackgroundColor:
|09FAD7| LDA.b $001F01
|09FAD9| BNE Polyhedral_SetBGShadeColor

|09FADB| LDA.b $001F4F
|09FADD| LSR A
|09FADE| LSR A
|09FADF| LSR A
|09FAE0| LSR A
|09FAE1| AND.b #$07

|09FAE3| JSL Polyhedral_SetColorMask

|09FAE7| RTS

;===================================================================================================

Polyhedral_SetBGShadeColor:
|09FAE8| REP #$20

|09FAEA| LDA.b $001FB0
|09FAEC| EOR.w #$FFFF
|09FAEF| INC A

|09FAF0| BRA Polyhedral_SetShadeColor

;===================================================================================================

Polyhedral_SetFGShadeColor:
|09FAF2| REP #$20

|09FAF4| LDA.b $001FB0

;===================================================================================================

Polyhedral_SetShadeColor:
|09FAF6| PHA

|09FAF7| LDA.w $1F03
|09FAFA| AND.w #$00FF
|09FAFD| BEQ .zero

|09FAFF| LDA.w $1F02
|09FB02| AND.w #$00FF

|09FB05| LSR A
|09FB06| LSR A
|09FB07| LSR A
|09FB08| LSR A
|09FB09| LSR A

.zero
|09FB0A| TAX
|09FB0B| PLA

.shift
|09FB0C| ASL A

|09FB0D| DEX
|09FB0E| BPL .shift

;---------------------------------------------------------------------------------------------------

|09FB10| SEP #$20

|09FB12| XBA
|09FB13| BNE .non_zero

|09FB15| LDA.b #$01
|09FB17| BRA .set_color

.non_zero
|09FB19| CMP.b #$08
|09FB1B| BCC .set_color

|09FB1D| LDA.b #$07

.set_color
|09FB1F| JSL Polyhedral_SetColorMask

|09FB23| RTS

;===================================================================================================

Polyhedral_CalculateCrossProduct:
|09FB24| SEP #$05

|09FB26| LDA.b $001FC3
|09FB28| SBC.b $001FC1
|09FB2A| STA.w PPUMULT16

|09FB2D| LDA.b #$00
|09FB2F| SBC.b #$00
|09FB31| STA.w PPUMULT16

|09FB34| SEC

|09FB35| LDA.b $001FC6
|09FB37| SBC.b $001FC4
|09FB39| STA.w PPUMULT8

|09FB3C| LDA.w MPYL
|09FB3F| STA.b $001FB0

|09FB41| LDA.w MPYM

|09FB44| CLI
|09FB45| STA.b $001FB1

;---------------------------------------------------------------------------------------------------

|09FB47| SEP #$05

|09FB49| LDA.b $001FC5
|09FB4B| SBC.b $001FC3
|09FB4D| STA.w PPUMULT16

|09FB50| LDA.b #$00
|09FB52| SBC.b #$00
|09FB54| STA.w PPUMULT16

|09FB57| SEC

|09FB58| LDA.b $001FC4
|09FB5A| SBC.b $001FC2
|09FB5C| STA.w PPUMULT8

|09FB5F| REP #$20

|09FB61| SEC

|09FB62| LDA.b $001FB0
|09FB64| SBC.w MPYL
|09FB67| STA.b $001FB0

;---------------------------------------------------------------------------------------------------

|09FB69| SEP #$20

|09FB6B| CLI

|09FB6C| RTS

;===================================================================================================

Polyhedral_SineTable:
|09FB6D| db $00, $02, $03, $05, $06, $08, $09, $0B
|09FB75| db $0C, $0E, $10, $11, $13, $14, $16, $17
|09FB7D| db $18, $1A, $1B, $1D, $1E, $20, $21, $22
|09FB85| db $24, $25, $26, $27, $29, $2A, $2B, $2C
|09FB8D| db $2D, $2E, $2F, $30, $31, $32, $33, $34
|09FB95| db $35, $36, $37, $38, $38, $39, $3A, $3B
|09FB9D| db $3B, $3C, $3C, $3D, $3D, $3E, $3E, $3E
|09FBA5| db $3F, $3F, $3F, $40, $40, $40, $40, $40

;===================================================================================================

Polyhedral_CosineTable:
|09FBAD| db $40, $40, $40, $40, $40, $40, $3F, $3F
|09FBB5| db $3F, $3E, $3E, $3E, $3D, $3D, $3C, $3C
|09FBBD| db $3B, $3B, $3A, $39, $38, $38, $37, $36
|09FBC5| db $35, $34, $33, $32, $31, $30, $2F, $2E
|09FBCD| db $2D, $2C, $2B, $2A, $29, $27, $26, $25
|09FBD5| db $24, $22, $21, $20, $1E, $1D, $1B, $1A
|09FBDD| db $18, $17, $16, $14, $13, $11, $10, $0E
|09FBE5| db $0C, $0B, $09, $08, $06, $05, $03, $02
|09FBED| db $00, $FE, $FD, $FB, $FA, $F8, $F7, $F5
|09FBF5| db $F4, $F2, $F0, $EF, $ED, $EC, $EA, $E9
|09FBFD| db $E8, $E6, $E5, $E3, $E2, $E0, $DF, $DE
|09FC05| db $DC, $DB, $DA, $D9, $D7, $D6, $D5, $D4
|09FC0D| db $D3, $D2, $D1, $D0, $CF, $CE, $CD, $CC
|09FC15| db $CB, $CA, $C9, $C8, $C8, $C7, $C6, $C5
|09FC1D| db $C5, $C4, $C4, $C3, $C3, $C2, $C2, $C2
|09FC25| db $C1, $C1, $C1, $C0, $C0, $C0, $C0, $C0
|09FC2D| db $C0, $C0, $C0, $C0, $C0, $C0, $C1, $C1
|09FC35| db $C1, $C2, $C2, $C2, $C3, $C3, $C4, $C4
|09FC3D| db $C5, $C5, $C6, $C7, $C8, $C8, $C9, $CA
|09FC45| db $CB, $CC, $CD, $CE, $CF, $D0, $D1, $D2
|09FC4D| db $D3, $D4, $D5, $D6, $D7, $D9, $DA, $DB
|09FC55| db $DC, $DE, $DF, $E0, $E2, $E3, $E5, $E6
|09FC5D| db $E8, $E9, $EA, $EC, $ED, $EF, $F0, $F2
|09FC65| db $F4, $F5, $F7, $F8, $FA, $FB, $FD, $FE
|09FC6D| db $00, $02, $03, $05, $06, $08, $09, $0B
|09FC75| db $0C, $0E, $10, $11, $13, $14, $16, $17
|09FC7D| db $18, $1A, $1B, $1D, $1E, $20, $21, $22
|09FC85| db $24, $25, $26, $27, $29, $2A, $2B, $2C
|09FC8D| db $2D, $2E, $2F, $30, $31, $32, $33, $34
|09FC95| db $35, $36, $37, $38, $38, $39, $3A, $3B
|09FC9D| db $3B, $3C, $3C, $3D, $3D, $3E, $3E, $3E
|09FCA5| db $3F, $3F, $3F, $40, $40, $40, $40, $40

;===================================================================================================
; FREE ROM: 0x01
;===================================================================================================
NULL_09FCAD:
|09FCAD| db $FF

;===================================================================================================

Polyhedral_SetColorMask:
|09FCAE| PHP

|09FCAF| SEP #$30

|09FCB1| ASL A
|09FCB2| ASL A
|09FCB3| TAX

|09FCB4| REP #$20

|09FCB6| LDA.l .mask+0,X
|09FCBA| STA.b $001FB5

|09FCBC| LDA.l .mask+2,X
|09FCC0| STA.b $001FB7

|09FCC2| PLP

|09FCC3| RTL

;---------------------------------------------------------------------------------------------------

.mask
|09FCC4| dw $0000, $0000
|09FCC8| dw $00FF, $0000
|09FCCC| dw $FF00, $0000
|09FCD0| dw $FFFF, $0000
|09FCD4| dw $0000, $00FF
|09FCD8| dw $00FF, $00FF
|09FCDC| dw $FF00, $00FF
|09FCE0| dw $FFFF, $00FF
|09FCE4| dw $0000, $FF00
|09FCE8| dw $00FF, $FF00
|09FCEC| dw $FF00, $FF00
|09FCF0| dw $FFFF, $FF00
|09FCF4| dw $0000, $FFFF
|09FCF8| dw $00FF, $FFFF
|09FCFC| dw $FF00, $FFFF
|09FD00| dw $FFFF, $FFFF

;===================================================================================================

Polyhedral_EmptyBitMapBuffer:
|09FD04| PHP
|09FD05| PHB

|09FD06| REP #$30

|09FD08| LDA.w #$0000
|09FD0B| STA.l $7EE800

|09FD0F| LDX.w #$7EE800
|09FD12| LDY.w #$7EE802

|09FD15| LDA.w #$07FD
|09FD18| MVN $7E, $7E

|09FD1B| PLB
|09FD1C| PLP

|09FD1D| RTL

;===================================================================================================

Polyhedral_DrawFace:
|09FD1E| PHP
|09FD1F| PHB

|09FD20| SEP #$30

|09FD22| LDA.b #$7E
|09FD24| PHA
|09FD25| PLB

|09FD26| LDY.b $001FC0
|09FD28| TYX

|09FD29| LDA.b $001FC0,X

;---------------------------------------------------------------------------------------------------

.loop
|09FD2B| DEX
|09FD2C| DEX
|09FD2D| BEQ .add_fill

|09FD2F| CMP.b $001FC0,X
|09FD31| BCC .loop
|09FD33| BEQ .loop

|09FD35| TXY
|09FD36| LDA.b $001FC0,X

|09FD38| BRA .loop

;---------------------------------------------------------------------------------------------------

.add_fill
|09FD3A| AND.b #$07
|09FD3C| ASL A
|09FD3D| STA.b $001FB9

|09FD3F| LDA.w $7E1FC0,Y
|09FD42| AND.b #$38
|09FD44| BIT.b #$20
|09FD46| BEQ .no_swap

|09FD48| EOR.b #$24

.no_swap
|09FD4A| LSR A
|09FD4B| LSR A
|09FD4C| ADC.b #$E8
|09FD4E| STA.b $001FBA

|09FD50| STY.b $001FE9
|09FD52| STY.b $001FF2

|09FD54| LDA.b $001FC0
|09FD56| LSR A
|09FD57| STA.b $001FE0

|09FD59| LDA.w $7E1FC0,Y
|09FD5C| STA.b $001FE2
|09FD5E| STA.b $001FEB

|09FD60| LDA.w $7E1FBF,Y
|09FD63| STA.b $001FE1
|09FD65| STA.b $001FEA

|09FD67| JSR Polyhedral_SetLeft
|09FD6A| BCS EXIT_09FD71

|09FD6C| JSR Polyhedral_SetRight
|09FD6F| BCC Polyhedral_PaintBucket

;---------------------------------------------------------------------------------------------------

#EXIT_09FD71:
|09FD71| PLB
|09FD72| PLP

|09FD73| RTL

;===================================================================================================

Polyhedral_PaintBucket:

.next
|09FD74| JSR Polyhedral_FillLine

|09FD77| LDA.b $001FB9
|09FD79| INC A
|09FD7A| INC A
|09FD7B| CMP.b #$10
|09FD7D| BEQ .big_a

|09FD7F| STA.b $001FB9
|09FD81| BRA .continue

.big_a
|09FD83| LDA.b $001FBA
|09FD85| INC A
|09FD86| INC A
|09FD87| BIT.b #$08
|09FD89| BNE .dont_flip

|09FD8B| EOR.b #$19

.dont_flip
|09FD8D| STA.b $001FBA
|09FD8F| STZ.b $001FB9

;---------------------------------------------------------------------------------------------------

.continue
|09FD91| LDX.b $001FE2
|09FD93| CPX.b $001FE4
|09FD95| BNE .skip_left

|09FD97| LDX.b $001FE3
|09FD99| STX.b $001FE1

|09FD9B| JSR Polyhedral_SetLeft
|09FD9E| BCS EXIT_09FD71

|09FDA0| LDX.b $001FE2

;---------------------------------------------------------------------------------------------------

.skip_left
|09FDA2| INX
|09FDA3| STX.b $001FE2

|09FDA5| LDX.b $001FEB
|09FDA7| CPX.b $001FED
|09FDA9| BNE .skip_right

|09FDAB| LDX.b $001FEC
|09FDAD| STX.b $001FEA

|09FDAF| JSR Polyhedral_SetRight
|09FDB2| BCS EXIT_09FD71

|09FDB4| LDX.b $001FEB

;---------------------------------------------------------------------------------------------------

.skip_right
|09FDB6| INX
|09FDB7| STX.b $001FEB

|09FDB9| REP #$21

|09FDBB| LDA.b $001FE5
|09FDBD| ADC.b $001FE7
|09FDBF| STA.b $001FE5

|09FDC1| CLC

|09FDC2| LDA.b $001FEE
|09FDC4| ADC.b $001FF0
|09FDC6| STA.b $001FEE

|09FDC8| SEP #$20

|09FDCA| BRA .next

;===================================================================================================

UNREACHABLE_09FDCC:
|09FDCC| PLB
|09FDCD| PLP

|09FDCE| RTL

;===================================================================================================

Polyhedral_FillLine:
|09FDCF| LDA.b $001FE6
|09FDD1| AND.b #$07
|09FDD3| ASL A
|09FDD4| TAY

|09FDD5| LDA.b $001FEF
|09FDD7| AND.b #$07
|09FDD9| ASL A
|09FDDA| TAX

|09FDDB| LDA.b $001FE6
|09FDDD| AND.b #$38
|09FDDF| STA.b $001FBC

|09FDE1| LDA.b $001FEF
|09FDE3| AND.b #$38
|09FDE5| SEC
|09FDE6| SBC.b $001FBC
|09FDE8| BNE Polyhedral_FillBigLine

;---------------------------------------------------------------------------------------------------

|09FDEA| REP #$30

|09FDEC| LDA.l Polyhedral_LineFillMask.right,X
|09FDF0| TYX

|09FDF1| AND.l Polyhedral_LineFillMask.left,X
|09FDF5| STA.b $001FB2

|09FDF7| LDA.b $001FEF
|09FDF9| AND.w #$0038
|09FDFC| ASL A
|09FDFD| ASL A

|09FDFE| ORA.b $001FB9
|09FE00| TAY

|09FE01| LDA.b $001FB5
|09FE03| EOR.w $7E0000,Y
|09FE06| AND.b $001FB2
|09FE08| EOR.w $7E0000,Y
|09FE0B| STA.w $7E0000,Y

|09FE0E| LDA.b $001FB7
|09FE10| EOR.w $7E0010,Y
|09FE13| AND.b $001FB2
|09FE15| EOR.w $7E0010,Y
|09FE18| STA.w $7E0010,Y

;---------------------------------------------------------------------------------------------------

EXIT_09FE1B:
|09FE1B| SEP #$30

|09FE1D| RTS

;===================================================================================================

Polyhedral_FillBigLine:
|09FE1E| BCC EXIT_09FE1B

|09FE20| LSR A
|09FE21| LSR A
|09FE22| LSR A
|09FE23| STA.b $001FFA

|09FE25| STZ.b $001FFB

;---------------------------------------------------------------------------------------------------

|09FE27| REP #$30

|09FE29| LDA.l Polyhedral_LineFillMask.right,X
|09FE2D| STA.b $001FB2

|09FE2F| TYX

|09FE30| LDA.b $001FEF
|09FE32| AND.w #$0038
|09FE35| ASL A
|09FE36| ASL A
|09FE37| ORA.b $001FB9
|09FE39| TAY

|09FE3A| LDA.b $001FB5
|09FE3C| EOR.w $7E0000,Y
|09FE3F| AND.b $001FB2
|09FE41| EOR.w $7E0000,Y
|09FE44| STA.w $7E0000,Y

|09FE47| LDA.b $001FB7
|09FE49| EOR.w $7E0010,Y
|09FE4C| AND.b $001FB2
|09FE4E| EOR.w $7E0010,Y
|09FE51| STA.w $7E0010,Y

;---------------------------------------------------------------------------------------------------

|09FE54| SEC

|09FE55| TYA
|09FE56| SBC.w #$0020
|09FE59| TAY

|09FE5A| DEC.b $001FFA
|09FE5C| BEQ .no_loop

;---------------------------------------------------------------------------------------------------

.loop
|09FE5E| LDA.b $001FB5
|09FE60| STA.w $7E0000,Y

|09FE63| LDA.b $001FB7
|09FE65| STA.w $7E0010,Y

|09FE68| TYA
|09FE69| SBC.w #$0020
|09FE6C| TAY

|09FE6D| DEC.b $001FFA
|09FE6F| BNE .loop

;---------------------------------------------------------------------------------------------------

.no_loop
|09FE71| LDA.l Polyhedral_LineFillMask.left,X
|09FE75| STA.b $001FB2

|09FE77| LDA.b $001FB5
|09FE79| EOR.w $7E0000,Y
|09FE7C| AND.b $001FB2
|09FE7E| EOR.w $7E0000,Y
|09FE81| STA.w $7E0000,Y

|09FE84| LDA.b $001FB7
|09FE86| EOR.w $7E0010,Y
|09FE89| AND.b $001FB2
|09FE8B| EOR.w $7E0010,Y
|09FE8E| STA.w $7E0010,Y

|09FE91| SEP #$30

|09FE93| RTS

;===================================================================================================

Polyhedral_LineFillMask:

.left
|09FE94| dw $FFFF
|09FE96| dw $7F7F
|09FE98| dw $3F3F
|09FE9A| dw $1F1F
|09FE9C| dw $0F0F
|09FE9E| dw $0707
|09FEA0| dw $0303
|09FEA2| dw $0101

.right
|09FEA4| dw $8080
|09FEA6| dw $C0C0
|09FEA8| dw $E0E0
|09FEAA| dw $F0F0
|09FEAC| dw $F8F8
|09FEAE| dw $FCFC
|09FEB0| dw $FEFE
|09FEB2| dw $FFFF

;===================================================================================================

Polyhedral_SetLeft:

.restart
|09FEB4| DEC.b $001FE0
|09FEB6| BPL .continue

.fail
|09FEB8| SEC

|09FEB9| RTS

;---------------------------------------------------------------------------------------------------

.continue
|09FEBA| LDX.b $001FE9
|09FEBC| DEX
|09FEBD| DEX
|09FEBE| BNE .dont_reload

|09FEC0| LDX.b $001FC0

.dont_reload
|09FEC2| LDA.b $001FC0,X
|09FEC4| CMP.b $001FE2
|09FEC6| BCC .fail
|09FEC8| BNE .dont_restart

|09FECA| LDA.b $001FBF,X
|09FECC| STA.b $001FE1

|09FECE| STX.b $001FE9

|09FED0| BRA .restart

;---------------------------------------------------------------------------------------------------

.dont_restart
|09FED2| STA.b $001FE4

|09FED4| LDA.b $001FBF,X
|09FED6| STA.b $001FE3

|09FED8| STX.b $001FE9

|09FEDA| LDX.b #$00
|09FEDC| SEC
|09FEDD| SBC.b $001FE1
|09FEDF| BCS .positive

|09FEE1| DEX

|09FEE2| EOR.b #$FF
|09FEE4| INC A

.positive
|09FEE5| SEI

|09FEE6| STA.l WRDIVH

|09FEEA| LDA.b #$00
|09FEEC| STA.l WRDIVL

|09FEF0| SEC

|09FEF1| LDA.b $001FE4
|09FEF3| SBC.b $001FE2
|09FEF5| STA.l WRDIVB

;---------------------------------------------------------------------------------------------------

|09FEF9| REP #$20

|09FEFB| LDA.b $001FE0
|09FEFD| AND.w #$FF00
|09FF00| ORA.w #$0080
|09FF03| STA.b $001FE5

|09FF05| LDA.w #$0000

|09FF08| CPX.b #$00
|09FF0A| BNE .nonzero

|09FF0C| LDA.l RDDIV
|09FF10| BRA .finished

.nonzero
|09FF12| SEC
|09FF13| SBC.l RDDIV

;---------------------------------------------------------------------------------------------------

.finished
|09FF17| CLI

|09FF18| STA.b $001FE7

|09FF1A| SEP #$20
|09FF1C| CLC

|09FF1D| RTS

;===================================================================================================

Polyhedral_SetRight:
.restart
|09FF1E| DEC.b $001FE0
|09FF20| BPL .continue_a

.fail
|09FF22| SEC

|09FF23| RTS

;---------------------------------------------------------------------------------------------------

.continue_a
|09FF24| LDX.b $001FF2
|09FF26| CPX.b $001FC0
|09FF28| BNE .dont_reload

|09FF2A| LDX.b #$02
|09FF2C| BRA .continue_b

.dont_reload
|09FF2E| INX
|09FF2F| INX

;---------------------------------------------------------------------------------------------------

.continue_b
|09FF30| LDA.b $001FC0,X
|09FF32| CMP.b $001FEB
|09FF34| BCC .fail
|09FF36| BNE .dont_restart

|09FF38| LDA.b $001FBF,X
|09FF3A| STA.b $001FEA

|09FF3C| STX.b $001FF2

|09FF3E| BRA .restart

;---------------------------------------------------------------------------------------------------

.dont_restart
|09FF40| STA.b $001FED

|09FF42| LDA.b $001FBF,X
|09FF44| STA.b $001FEC

|09FF46| STX.b $001FF2

|09FF48| LDX.b #$00
|09FF4A| SEC
|09FF4B| SBC.b $001FEA
|09FF4D| BCS .positive

|09FF4F| DEX

|09FF50| EOR.b #$FF
|09FF52| INC A

.positive
|09FF53| SEI

|09FF54| STA.l WRDIVH
|09FF58| LDA.b #$00
|09FF5A| STA.l WRDIVL

|09FF5E| SEC
|09FF5F| LDA.b $001FED
|09FF61| SBC.b $001FEB
|09FF63| STA.l WRDIVB

;---------------------------------------------------------------------------------------------------

|09FF67| REP #$20

|09FF69| LDA.b $001FE9
|09FF6B| AND.w #$FF00
|09FF6E| ORA.w #$0080
|09FF71| STA.b $001FEE

|09FF73| LDA.w #$0000

|09FF76| CPX.b #$00
|09FF78| BNE .nonzero

|09FF7A| LDA.l RDDIV
|09FF7E| BRA .finished

.nonzero
|09FF80| SEC
|09FF81| SBC.l RDDIV

;---------------------------------------------------------------------------------------------------

.finished
|09FF85| CLI

|09FF86| STA.b $001FF0

|09FF88| SEP #$20
|09FF8A| CLC

|09FF8B| RTS

;===================================================================================================

PolyhedralPropertyTable:

.crystal
|09FF8C| db $06 ; vertices
|09FF8D| db $08 ; faces
|09FF8E| dw CrystalVertices
|09FF90| dw CrystalFaces

.triforce
|09FF92| db $06 ; vertices
|09FF93| db $05 ; faces
|09FF94| dw TriforceVertices
|09FF96| dw TriforceFaces

;===================================================================================================

CrystalVertices:
|09FF98| db   0,  65,   0
|09FF9B| db   0, -65,   0
|09FF9E| db   0,   0, -40
|09FFA1| db -40,   0,   0
|09FFA4| db   0,   0,  40
|09FFA7| db  40,   0,   0

;---------------------------------------------------------------------------------------------------

CrystalFaces:
|09FFAA| db   3,   0,   5,   2,   4
|09FFAF| db   3,   0,   2,   3,   1
|09FFB4| db   3,   0,   3,   4,   2
|09FFB9| db   3,   0,   4,   5,   3

|09FFBE| db   3,   1,   2,   5,   4
|09FFC3| db   3,   1,   3,   2,   1
|09FFC8| db   3,   1,   4,   3,   2
|09FFCD| db   3,   1,   5,   4,   3

;===================================================================================================

TriforceVertices:
|09FFD2| db   0,  40,  10
|09FFD5| db  40, -40,  10
|09FFD8| db -40, -40,  10
|09FFDB| db   0,  40, -10
|09FFDE| db -40, -40, -10
|09FFE1| db  40, -40, -10

;---------------------------------------------------------------------------------------------------

TriforceFaces:
|09FFE4| db   3,   0,   1,   2,   7
|09FFE9| db   3,   3,   4,   5,   6

|09FFEE| db   4,   0,   3,   5,   1,   5
|09FFF4| db   4,   1,   5,   4,   2,   4
|09FFFA| db   4,   3,   0,   2,   4,   3

;===================================================================================================
