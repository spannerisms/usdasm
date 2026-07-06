; see «overworlds.asm»

org $0BFE5E

;===================================================================================================
; FREE ROM: 0x12
;===================================================================================================
NULL_0BFE5E:
|0BFE5E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0BFE66| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0BFE6E| db $FF, $FF

;===================================================================================================

Overworld_SetFixedColAndScroll:
|0BFE70| STZ.b $1D

|0BFE72| REP #$30

|0BFE74| LDX.w #$19C6 ; RGB: #307030

|0BFE77| LDA.b $8A
|0BFE79| CMP.w #$0080 ; OW 80
|0BFE7C| BNE .not_ms_grove

|0BFE7E| LDA.b $A0
|0BFE80| CMP.w #$0181 ; OW 81
|0BFE83| BNE .use_this_color

|0BFE85| INC.b $1D
|0BFE87| BRA .check_world

;---------------------------------------------------------------------------------------------------

.not_ms_grove
|0BFE89| CMP.w #$0081
|0BFE8C| BEQ .use_this_color

|0BFE8E| LDX.w #$0000 ; RGB: #000000
|0BFE91| CMP.w #$005B
|0BFE94| BEQ .use_this_color

|0BFE96| AND.w #$00BF
|0BFE99| CMP.w #$0003
|0BFE9C| BEQ .use_this_color

|0BFE9E| CMP.w #$0005
|0BFEA1| BEQ .use_this_color

|0BFEA3| CMP.w #$0007
|0BFEA6| BEQ .use_this_color

;---------------------------------------------------------------------------------------------------

.check_world
|0BFEA8| LDX.w #$2669 ; RGB: #489848

|0BFEAB| LDA.b $8A
|0BFEAD| AND.w #$0040
|0BFEB0| BEQ .use_this_color

|0BFEB2| LDX.w #$2A32 ; RGB: #908850

;---------------------------------------------------------------------------------------------------

.use_this_color
|0BFEB5| TXA
|0BFEB6| STA.l $7EC500
|0BFEBA| STA.l $7EC300
|0BFEBE| STA.l $7EC540
|0BFEC2| STA.l $7EC340

|0BFEC6| LDA.w #$4020 ; Fixed color RGB: #000000
|0BFEC9| STA.b $9C

|0BFECB| LDA.w #$8040
|0BFECE| STA.b $9D

|0BFED0| LDA.b $8A ; OW 00
|0BFED2| BEQ .is_woods_or_pyramid

|0BFED4| CMP.w #$0070 ; OW 70
|0BFED7| BNE .not_mire

|0BFED9| JMP.w .exit_and_trigger

.not_mire
|0BFEDC| CMP.w #$0040 ; OW 40
|0BFEDF| BEQ .is_woods_or_pyramid

|0BFEE1| CMP.w #$005B ; OW 5B
|0BFEE4| BEQ .is_woods_or_pyramid

|0BFEE6| LDX.w #$4C26 ; Fixed color RGB: #306060
|0BFEE9| LDY.w #$8C4C

|0BFEEC| CMP.w #$0003 ; OW 03
|0BFEEF| BEQ .use_this_fixed_col

|0BFEF1| CMP.w #$0005 ; OW 05
|0BFEF4| BEQ .use_this_fixed_col

|0BFEF6| CMP.w #$0007 ; OW 07
|0BFEF9| BEQ .use_this_fixed_col

|0BFEFB| LDX.w #$4A26 ; Fixed color RGB: #305038
|0BFEFE| LDY.w #$874A

|0BFF01| CMP.w #$0043 ; OW 43
|0BFF04| BEQ .use_this_fixed_col

|0BFF06| CMP.w #$0045 ; OW 45
|0BFF09| BEQ .use_this_fixed_col

|0BFF0B| SEP #$30

|0BFF0D| INC.b $15

|0BFF0F| RTL

;---------------------------------------------------------------------------------------------------

.use_this_fixed_col
|0BFF10| STX.b $9C
|0BFF12| STY.b $9D

.is_woods_or_pyramid
|0BFF14| LDA.b $11
|0BFF16| AND.w #$00FF
|0BFF19| CMP.w #$0004
|0BFF1C| BEQ .transitioning

|0BFF1E| LDA.b $E8
|0BFF20| STA.b $E6

|0BFF22| LDA.b $E2
|0BFF24| STA.b $E0

|0BFF26| LDA.b $8A
|0BFF28| AND.w #$003F
|0BFF2B| CMP.w #$001B ; OW 1B, OW 5B
|0BFF2E| BNE .exit_and_trigger

|0BFF30| LDA.b $E2
|0BFF32| SEC
|0BFF33| SBC.w #$0778
|0BFF36| LSR A
|0BFF37| TAY

|0BFF38| AND.w #$4000
|0BFF3B| BEQ .positive_a

|0BFF3D| TYA
|0BFF3E| ORA.w #$8000
|0BFF41| TAY

.positive_a
|0BFF42| STY.b $00

|0BFF44| LDA.b $E2
|0BFF46| SEC
|0BFF47| SBC.b $00
|0BFF49| STA.b $E0

|0BFF4B| LDA.b $E6
|0BFF4D| CMP.w #$06C0
|0BFF50| BCC .offset_type_c

|0BFF52| SEC
|0BFF53| SBC.w #$0600
|0BFF56| AND.w #$03FF
|0BFF59| CMP.w #$0180
|0BFF5C| BCS .offset_type_b

|0BFF5E| LSR A
|0BFF5F| ORA.w #$0600
|0BFF62| BRA .use_this_bg1vofs

.offset_type_b
|0BFF64| LDA.w #$06C0

|0BFF67| BRA .use_this_bg1vofs

.offset_type_c
|0BFF69| LDA.b $E6
|0BFF6B| AND.w #$00FF
|0BFF6E| LSR A
|0BFF6F| ORA.w #$0600

;---------------------------------------------------------------------------------------------------

.use_this_bg1vofs
|0BFF72| STA.b $E6

|0BFF74| BRA .exit_and_trigger

;---------------------------------------------------------------------------------------------------

.transitioning
|0BFF76| LDA.b $8A
|0BFF78| AND.w #$003F
|0BFF7B| CMP.w #$001B ; OW 1B, OW 5B
|0BFF7E| BNE .exit_and_trigger

|0BFF80| LDA.b $E8
|0BFF82| STA.b $E6

|0BFF84| LDA.b $E2
|0BFF86| STA.b $E0

|0BFF88| LDA.w $0410
|0BFF8B| AND.w #$00FF
|0BFF8E| CMP.w #$0008
|0BFF91| BEQ .do_vertical

|0BFF93| LDA.w #$0838
|0BFF96| STA.b $E0

.do_vertical
|0BFF98| LDA.w #$06C0
|0BFF9B| STA.b $E6

;---------------------------------------------------------------------------------------------------

.exit_and_trigger
|0BFF9D| SEP #$20

|0BFF9F| LDA.b #$01
|0BFFA1| STA.b $1D

|0BFFA3| SEP #$30

|0BFFA5| INC.b $15

|0BFFA7| RTL

;===================================================================================================

DragToLastEntrance:
|0BFFA8| JSL SaveDungeonKeys
|0BFFAC| JSL FullyUpdateRoomFlags
|0BFFB0| JSL ResetAllSprites

|0BFFB4| STZ.w $04AA

|0BFFB7| LDA.b #$11
|0BFFB9| STA.b $10
|0BFFBB| STZ.b $11

|0BFFBD| STZ.b $14

;===================================================================================================

ResetSomeThingsAfterDeath:
|0BFFBF| STZ.w $0345

|0BFFC2| STA.w $005E

|0BFFC5| STZ.w $03F3
|0BFFC8| STZ.w $0322

|0BFFCB| STZ.w $02E4
|0BFFCE| STZ.w $0ABD
|0BFFD1| STZ.w $036B
|0BFFD4| STZ.w $0373

|0BFFD7| STZ.b $27
|0BFFD9| STZ.b $28
|0BFFDB| STZ.b $29
|0BFFDD| STZ.b $24

|0BFFDF| STZ.w $0351
|0BFFE2| STZ.w $0316
|0BFFE5| STZ.w $031F

|0BFFE8| LDA.b #$00 ; LINKSTATE 00
|0BFFEA| STA.b $5D

|0BFFEC| STZ.b $4B

;===================================================================================================

ResetAncillaAndLink:
|0BFFEE| JSL TerminateSelectInteractives

|0BFFF2| JML ResetLinkProperties_A

;===================================================================================================
; FREE ROM: 0x0A
;===================================================================================================
NULL_0BFFF6:
|0BFFF6| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0BFFFE| db $FF, $FF

;===================================================================================================
