; see «overworlds.asm»

org $0BFE5E

;===================================================================================================
; FREE ROM: 0x12
;===================================================================================================
NULL_0BFE5E:
#_0BFE5E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0BFE66: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0BFE6E: db $FF, $FF

;===================================================================================================

Overworld_SetFixedColAndScroll:
#_0BFE70: STZ.b $1D

#_0BFE72: REP #$30

#_0BFE74: LDX.w #$19C6 ; RGB: #307030

#_0BFE77: LDA.b $8A
#_0BFE79: CMP.w #$0080 ; OW 80
#_0BFE7C: BNE .not_ms_grove

#_0BFE7E: LDA.b $A0
#_0BFE80: CMP.w #$0181 ; OW 81
#_0BFE83: BNE .use_this_color

#_0BFE85: INC.b $1D
#_0BFE87: BRA .check_world

;---------------------------------------------------------------------------------------------------

.not_ms_grove
#_0BFE89: CMP.w #$0081
#_0BFE8C: BEQ .use_this_color

#_0BFE8E: LDX.w #$0000 ; RGB: #000000
#_0BFE91: CMP.w #$005B
#_0BFE94: BEQ .use_this_color

#_0BFE96: AND.w #$00BF
#_0BFE99: CMP.w #$0003
#_0BFE9C: BEQ .use_this_color

#_0BFE9E: CMP.w #$0005
#_0BFEA1: BEQ .use_this_color

#_0BFEA3: CMP.w #$0007
#_0BFEA6: BEQ .use_this_color

;---------------------------------------------------------------------------------------------------

.check_world
#_0BFEA8: LDX.w #$2669 ; RGB: #489848

#_0BFEAB: LDA.b $8A
#_0BFEAD: AND.w #$0040
#_0BFEB0: BEQ .use_this_color

#_0BFEB2: LDX.w #$2A32 ; RGB: #908850

;---------------------------------------------------------------------------------------------------

.use_this_color
#_0BFEB5: TXA
#_0BFEB6: STA.l $7EC500
#_0BFEBA: STA.l $7EC300
#_0BFEBE: STA.l $7EC540
#_0BFEC2: STA.l $7EC340

#_0BFEC6: LDA.w #$4020 ; Fixed color RGB: #000000
#_0BFEC9: STA.b $9C

#_0BFECB: LDA.w #$8040
#_0BFECE: STA.b $9D

#_0BFED0: LDA.b $8A ; OW 00
#_0BFED2: BEQ .is_woods_or_pyramid

#_0BFED4: CMP.w #$0070 ; OW 70
#_0BFED7: BNE .not_mire

#_0BFED9: JMP.w .exit_and_trigger

.not_mire
#_0BFEDC: CMP.w #$0040 ; OW 40
#_0BFEDF: BEQ .is_woods_or_pyramid

#_0BFEE1: CMP.w #$005B ; OW 5B
#_0BFEE4: BEQ .is_woods_or_pyramid

#_0BFEE6: LDX.w #$4C26 ; Fixed color RGB: #306060
#_0BFEE9: LDY.w #$8C4C

#_0BFEEC: CMP.w #$0003 ; OW 03
#_0BFEEF: BEQ .use_this_fixed_col

#_0BFEF1: CMP.w #$0005 ; OW 05
#_0BFEF4: BEQ .use_this_fixed_col

#_0BFEF6: CMP.w #$0007 ; OW 07
#_0BFEF9: BEQ .use_this_fixed_col

#_0BFEFB: LDX.w #$4A26 ; Fixed color RGB: #305038
#_0BFEFE: LDY.w #$874A

#_0BFF01: CMP.w #$0043 ; OW 43
#_0BFF04: BEQ .use_this_fixed_col

#_0BFF06: CMP.w #$0045 ; OW 45
#_0BFF09: BEQ .use_this_fixed_col

#_0BFF0B: SEP #$30

#_0BFF0D: INC.b $15

#_0BFF0F: RTL

;---------------------------------------------------------------------------------------------------

.use_this_fixed_col
#_0BFF10: STX.b $9C
#_0BFF12: STY.b $9D

.is_woods_or_pyramid
#_0BFF14: LDA.b $11
#_0BFF16: AND.w #$00FF
#_0BFF19: CMP.w #$0004
#_0BFF1C: BEQ .transitioning

#_0BFF1E: LDA.b $E8
#_0BFF20: STA.b $E6

#_0BFF22: LDA.b $E2
#_0BFF24: STA.b $E0

#_0BFF26: LDA.b $8A
#_0BFF28: AND.w #$003F
#_0BFF2B: CMP.w #$001B ; OW 1B, OW 5B
#_0BFF2E: BNE .exit_and_trigger

#_0BFF30: LDA.b $E2
#_0BFF32: SEC
#_0BFF33: SBC.w #$0778
#_0BFF36: LSR A
#_0BFF37: TAY

#_0BFF38: AND.w #$4000
#_0BFF3B: BEQ .positive_a

#_0BFF3D: TYA
#_0BFF3E: ORA.w #$8000
#_0BFF41: TAY

.positive_a
#_0BFF42: STY.b $00

#_0BFF44: LDA.b $E2
#_0BFF46: SEC
#_0BFF47: SBC.b $00
#_0BFF49: STA.b $E0

#_0BFF4B: LDA.b $E6
#_0BFF4D: CMP.w #$06C0
#_0BFF50: BCC .offset_type_c

#_0BFF52: SEC
#_0BFF53: SBC.w #$0600
#_0BFF56: AND.w #$03FF
#_0BFF59: CMP.w #$0180
#_0BFF5C: BCS .offset_type_b

#_0BFF5E: LSR A
#_0BFF5F: ORA.w #$0600
#_0BFF62: BRA .use_this_bg1vofs

.offset_type_b
#_0BFF64: LDA.w #$06C0

#_0BFF67: BRA .use_this_bg1vofs

.offset_type_c
#_0BFF69: LDA.b $E6
#_0BFF6B: AND.w #$00FF
#_0BFF6E: LSR A
#_0BFF6F: ORA.w #$0600

;---------------------------------------------------------------------------------------------------

.use_this_bg1vofs
#_0BFF72: STA.b $E6

#_0BFF74: BRA .exit_and_trigger

;---------------------------------------------------------------------------------------------------

.transitioning
#_0BFF76: LDA.b $8A
#_0BFF78: AND.w #$003F
#_0BFF7B: CMP.w #$001B ; OW 1B, OW 5B
#_0BFF7E: BNE .exit_and_trigger

#_0BFF80: LDA.b $E8
#_0BFF82: STA.b $E6

#_0BFF84: LDA.b $E2
#_0BFF86: STA.b $E0

#_0BFF88: LDA.w $0410
#_0BFF8B: AND.w #$00FF
#_0BFF8E: CMP.w #$0008
#_0BFF91: BEQ .do_vertical

#_0BFF93: LDA.w #$0838
#_0BFF96: STA.b $E0

.do_vertical
#_0BFF98: LDA.w #$06C0
#_0BFF9B: STA.b $E6

;---------------------------------------------------------------------------------------------------

.exit_and_trigger
#_0BFF9D: SEP #$20

#_0BFF9F: LDA.b #$01
#_0BFFA1: STA.b $1D

#_0BFFA3: SEP #$30

#_0BFFA5: INC.b $15

#_0BFFA7: RTL

;===================================================================================================

WallMaster_SendPlayerToLastEntrance:
#_0BFFA8: JSL SaveDungeonKeys
#_0BFFAC: JSL Underworld_FlagRoomData_Quadrants
#_0BFFB0: JSL Sprite_ResetAll

#_0BFFB4: STZ.w $04AA

#_0BFFB7: LDA.b #$11
#_0BFFB9: STA.b $10
#_0BFFBB: STZ.b $11

#_0BFFBD: STZ.b $14

;===================================================================================================

ResetSomeThingsAfterDeath:
#_0BFFBF: STZ.w $0345

#_0BFFC2: STA.w $005E

#_0BFFC5: STZ.w $03F3
#_0BFFC8: STZ.w $0322

#_0BFFCB: STZ.w $02E4
#_0BFFCE: STZ.w $0ABD
#_0BFFD1: STZ.w $036B
#_0BFFD4: STZ.w $0373

#_0BFFD7: STZ.b $27
#_0BFFD9: STZ.b $28
#_0BFFDB: STZ.b $29
#_0BFFDD: STZ.b $24

#_0BFFDF: STZ.w $0351
#_0BFFE2: STZ.w $0316
#_0BFFE5: STZ.w $031F

#_0BFFE8: LDA.b #$00 ; LINKSTATE 00
#_0BFFEA: STA.b $5D

#_0BFFEC: STZ.b $4B

;===================================================================================================

ResetAncillaAndLink:
#_0BFFEE: JSL Ancilla_TerminateSelectInteractives

#_0BFFF2: JML Link_ResetProperties_A

;===================================================================================================
; FREE ROM: 0x0A
;===================================================================================================
NULL_0BFFF6:
#_0BFFF6: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0BFFFE: db $FF, $FF

;===================================================================================================
