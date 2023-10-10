org $0E8000

;===================================================================================================

TheFont:
#_0E8000: incbin "bin/gfx/font.2bpp"

.end

;===================================================================================================

CustomTileTypesOffset:
#_0E9000: dw $0000, $0000, $0000, $0080, $0080, $0100, $0100, $0100
#_0E9010: dw $0180, $0000, $0100, $0200, $0280, $0300, $0380, $0100
#_0E9020: dw $0100, $0080, $0100, $0380, $0100

;===================================================================================================

CustomUnderworldTileTypes:
#_0E902A: db $02, $02, $02, $02, $02, $02, $6E, $6F
#_0E9032: db $01, $6C, $02, $01, $01, $01, $01, $01
#_0E903A: db $02, $02, $02, $02, $02, $02, $00, $00
#_0E9042: db $00, $00, $02, $01, $01, $01, $01, $01
#_0E904A: db $01, $01, $01, $01, $01, $01, $6E, $6F
#_0E9052: db $01, $6C, $02, $02, $02, $02, $01, $02
#_0E905A: db $00, $00, $22, $00, $00, $00, $02, $02
#_0E9062: db $02, $02, $02, $02, $00, $00, $01, $00
#_0E906A: db $01, $01, $01, $01, $01, $01, $01, $02
#_0E9072: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E907A: db $01, $01, $01, $01, $01, $01, $01, $02
#_0E9082: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E908A: db $02, $02, $02, $02, $18, $00, $00, $00
#_0E9092: db $00, $00, $02, $02, $01, $01, $01, $01
#_0E909A: db $02, $02, $02, $01, $02, $02, $08, $08
#_0E90A2: db $08, $08, $09, $09, $09, $09, $09, $09

; set 01
#_0E90AA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E90B2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E90BA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E90C2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E90CA: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E90D2: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E90DA: db $00, $00, $22, $00, $00, $00, $02, $02
#_0E90E2: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E90EA: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E90F2: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E90FA: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E9102: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E910A: db $02, $02, $02, $02, $18, $00, $00, $00
#_0E9112: db $00, $00, $02, $02, $02, $02, $02, $02
#_0E911A: db $02, $02, $02, $01, $02, $02, $08, $08
#_0E9122: db $08, $08, $09, $09, $09, $09, $09, $09

; set 02
#_0E912A: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9132: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E913A: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9142: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E914A: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E9152: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E915A: db $00, $00, $22, $00, $00, $00, $00, $00
#_0E9162: db $00, $00, $02, $02, $00, $00, $02, $00
#_0E916A: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E9172: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E917A: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E9182: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E918A: db $02, $02, $02, $02, $00, $00, $00, $00
#_0E9192: db $00, $00, $02, $02, $02, $02, $02, $02
#_0E919A: db $6B, $6A, $02, $01, $02, $02, $08, $08
#_0E91A2: db $08, $08, $09, $09, $09, $09, $68, $69

; set 03
#_0E91AA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E91B2: db $09, $09, $02, $01, $01, $01, $01, $01
#_0E91BA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E91C2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E91CA: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E91D2: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E91DA: db $00, $00, $22, $00, $00, $00, $02, $02
#_0E91E2: db $02, $02, $02, $02, $00, $00, $00, $00
#_0E91EA: db $01, $01, $01, $00, $02, $02, $02, $02
#_0E91F2: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E91FA: db $01, $01, $01, $08, $02, $02, $02, $02
#_0E9202: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E920A: db $02, $02, $02, $02, $18, $00, $00, $00
#_0E9212: db $00, $00, $02, $02, $02, $02, $02, $02
#_0E921A: db $08, $08, $02, $01, $01, $09, $08, $08
#_0E9222: db $08, $08, $09, $09, $09, $09, $09, $09

; set 04
#_0E922A: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9232: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E923A: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9242: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E924A: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E9252: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E925A: db $00, $00, $22, $00, $00, $00, $02, $02
#_0E9262: db $02, $02, $02, $02, $00, $00, $00, $00
#_0E926A: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E9272: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E927A: db $01, $01, $01, $01, $02, $02, $02, $02
#_0E9282: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E928A: db $02, $02, $02, $02, $02, $00, $0F, $00
#_0E9292: db $00, $00, $02, $02, $02, $02, $02, $02
#_0E929A: db $02, $02, $02, $01, $02, $02, $08, $08
#_0E92A2: db $08, $08, $0E, $0E, $0E, $0E, $00, $00

; set 05
#_0E92AA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E92B2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E92BA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E92C2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E92CA: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E92D2: db $01, $02, $02, $02, $02, $02, $02, $02
#_0E92DA: db $00, $00, $22, $00, $00, $00, $00, $00
#_0E92E2: db $00, $00, $02, $02, $00, $00, $00, $00
#_0E92EA: db $01, $01, $01, $01, $02, $02, $02, $0D
#_0E92F2: db $0D, $02, $02, $02, $02, $02, $02, $02
#_0E92FA: db $01, $01, $01, $01, $02, $02, $02, $0D
#_0E9302: db $0D, $02, $02, $02, $02, $02, $02, $02
#_0E930A: db $02, $02, $02, $02, $02, $00, $00, $00
#_0E9312: db $00, $00, $02, $02, $02, $02, $02, $02
#_0E931A: db $6B, $6A, $02, $01, $02, $02, $08, $08
#_0E9322: db $08, $08, $09, $09, $09, $09, $68, $69

; set 06
#_0E932A: db $B2, $B4, $B1, $BB, $02, $02, $02, $02
#_0E9332: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E933A: db $B3, $B5, $B0, $B6, $02, $02, $02, $02
#_0E9342: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E934A: db $02, $01, $01, $01, $01, $01, $01, $01
#_0E9352: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E935A: db $00, $00, $22, $00, $00, $00, $02, $02
#_0E9362: db $02, $02, $02, $02, $00, $00, $00, $00
#_0E936A: db $B1, $B2, $B3, $B4, $B5, $B1, $B0, $02
#_0E9372: db $BE, $02, $02, $02, $02, $02, $B7, $B8
#_0E937A: db $B0, $B2, $B3, $B4, $B5, $02, $B0, $02
#_0E9382: db $00, $02, $B1, $BE, $00, $BD, $B9, $BA
#_0E938A: db $02, $02, $B1, $B0, $02, $00, $00, $00
#_0E9392: db $BD, $BC, $02, $02, $02, $02, $02, $02
#_0E939A: db $00, $00, $00, $00, $00, $0E, $00, $00
#_0E93A2: db $00, $00, $00, $00, $00, $00, $00, $00

; set 07
#_0E93AA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E93B2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E93BA: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E93C2: db $02, $02, $02, $01, $01, $01, $01, $01
#_0E93CA: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E93D2: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E93DA: db $00, $00, $22, $00, $00, $00, $00, $00
#_0E93E2: db $00, $00, $02, $02, $00, $00, $00, $00
#_0E93EA: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E93F2: db $00, $00, $00, $00, $00, $00, $02, $02
#_0E93FA: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E9402: db $00, $00, $00, $00, $00, $00, $02, $02
#_0E940A: db $02, $02, $02, $02, $18, $00, $00, $00
#_0E9412: db $00, $00, $00, $00, $01, $01, $01, $01
#_0E941A: db $6B, $6A, $02, $01, $02, $02, $08, $08
#_0E9422: db $08, $08, $0E, $0E, $0E, $0E, $68, $69

;===================================================================================================

Underworld_LoadCustomTileTypes:
#_0E942A: PHB
#_0E942B: PHK
#_0E942C: PLB

#_0E942D: REP #$30

#_0E942F: LDA.w $0AA2
#_0E9432: AND.w #$00FF
#_0E9435: ASL A
#_0E9436: TAX

#_0E9437: LDA.w CustomTileTypesOffset,X
#_0E943A: TAY

#_0E943B: LDX.w #$0000

.copy_next
#_0E943E: LDA.w CustomUnderworldTileTypes+$00,Y
#_0E9441: STA.l $7EFF40,X

#_0E9445: LDA.w CustomUnderworldTileTypes+$40,Y
#_0E9448: STA.l $7EFF80,X

#_0E944C: INY
#_0E944D: INY

#_0E944E: INX
#_0E944F: INX

#_0E9450: CPX.w #$0040
#_0E9453: BNE .copy_next

#_0E9455: SEP #$30

#_0E9457: PLB

#_0E9458: RTL

;===================================================================================================

OverworldTileTypes:
#_0E9459: db $27, $27, $27, $27, $27, $27, $02, $02
#_0E9461: db $01, $01, $01, $00, $00, $00, $00, $00
#_0E9469: db $27, $01, $01, $01, $01, $01, $02, $02
#_0E9471: db $27, $27, $27, $00, $00, $00, $00, $00
#_0E9479: db $27, $01, $01, $01, $20, $01, $02, $02
#_0E9481: db $27, $27, $27, $00, $00, $00, $00, $00
#_0E9489: db $27, $01, $01, $01, $01, $20, $02, $02
#_0E9491: db $02, $02, $02, $00, $00, $00, $00, $00
#_0E9499: db $01, $01, $01, $01, $1A, $01, $12, $01
#_0E94A1: db $01, $02, $01, $01, $28, $2E, $2A, $2B
#_0E94A9: db $01, $01, $18, $18, $1A, $01, $12, $01
#_0E94B1: db $01, $2C, $02, $2D, $29, $2F, $02, $02
#_0E94B9: db $01, $01, $01, $01, $01, $01, $02, $01
#_0E94C1: db $02, $2E, $00, $00, $2C, $00, $4E, $4F
#_0E94C9: db $01, $01, $01, $01, $01, $01, $02, $01
#_0E94D1: db $02, $00, $2E, $00, $00, $00, $02, $22
#_0E94D9: db $01, $01, $02, $00, $00, $00, $18, $12
#_0E94E1: db $02, $02, $00, $48, $00, $00, $00, $00
#_0E94E9: db $01, $01, $02, $00, $01, $01, $10, $1A
#_0E94F1: db $02, $00, $00, $48, $00, $00, $00, $00
#_0E94F9: db $10, $10, $02, $00, $01, $01, $01, $01
#_0E9501: db $00, $00, $48, $00, $00, $09, $00, $00
#_0E9509: db $02, $02, $02, $00, $01, $01, $2B, $00
#_0E9511: db $00, $09, $00, $00, $00, $00, $00, $00
#_0E9519: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E9521: db $02, $02, $02, $02, $02, $00, $00, $00
#_0E9529: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E9531: db $02, $02, $02, $02, $02, $00, $00, $00
#_0E9539: db $01, $01, $01, $46, $01, $01, $02, $02
#_0E9541: db $02, $02, $02, $02, $02, $00, $00, $00
#_0E9549: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E9551: db $02, $02, $02, $02, $02, $00, $00, $00
#_0E9559: db $02, $02, $42, $02, $02, $02, $02, $02
#_0E9561: db $02, $02, $29, $22, $00, $00, $00, $00
#_0E9569: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9571: db $02, $02, $29, $22, $00, $00, $00, $00
#_0E9579: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9581: db $02, $02, $00, $00, $00, $00, $00, $00
#_0E9589: db $02, $02, $02, $02, $02, $02, $02, $02
#_0E9591: db $02, $02, $00, $00, $00, $00, $00, $00
#_0E9599: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E95A1: db $01, $01, $01, $00, $00, $00, $02, $44
#_0E95A9: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E95B1: db $02, $02, $02, $00, $00, $00, $02, $44
#_0E95B9: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E95C1: db $02, $02, $02, $00, $00, $00, $00, $00
#_0E95C9: db $01, $01, $43, $01, $01, $01, $01, $01
#_0E95D1: db $02, $02, $02, $00, $00, $00, $00, $00
#_0E95D9: db $50, $02, $54, $51, $57, $57, $56, $56
#_0E95E1: db $27, $27, $27, $00, $40, $40, $48, $48
#_0E95E9: db $50, $02, $54, $51, $57, $2A, $56, $56
#_0E95F1: db $27, $27, $27, $00, $40, $40, $57, $48
#_0E95F9: db $27, $02, $52, $53, $02, $01, $12, $18
#_0E9601: db $55, $55, $00, $00, $48, $02, $02, $00
#_0E9609: db $27, $02, $52, $53, $09, $01, $1A, $10
#_0E9611: db $55, $55, $00, $00, $48, $02, $02, $00
#_0E9619: db $02, $02, $18, $08, $08, $08, $09, $09
#_0E9621: db $08, $08, $29, $02, $02, $02, $1A, $02
#_0E9629: db $08, $08, $10, $08, $12, $00, $09, $09
#_0E9631: db $09, $09, $09, $48, $09, $29, $00, $4B
#_0E9639: db $02, $02, $02, $00, $08, $02, $02, $00
#_0E9641: db $00, $00, $00, $01, $00, $00, $20, $00
#_0E9649: db $02, $02, $02, $02, $02, $02, $02, $00
#_0E9651: db $00, $01, $01, $01, $02, $00, $08, $00

;===================================================================================================

UnderworldTileTypes:
#_0E9659: db $01, $01, $01, $00, $02, $01, $02, $00
#_0E9661: db $01, $01, $02, $02, $02, $02, $02, $02
#_0E9669: db $02, $02, $02, $00, $00, $01, $00, $00
#_0E9671: db $02, $00, $00, $02, $02, $02, $02, $02
#_0E9679: db $02, $02, $02, $02, $01, $01, $01, $02
#_0E9681: db $02, $02, $02, $02, $01, $01, $00, $00
#_0E9689: db $02, $02, $02, $02, $02, $02, $01, $02
#_0E9691: db $02, $02, $02, $02, $01, $01, $00, $00
#_0E9699: db $00, $00, $00, $2A, $01, $20, $01, $01
#_0E96A1: db $04, $01, $01, $18, $01, $02, $1C, $01
#_0E96A9: db $28, $28, $2A, $2A, $01, $02, $01, $01
#_0E96B1: db $04, $00, $00, $00, $28, $01, $0A, $00
#_0E96B9: db $01, $01, $0C, $0C, $02, $02, $02, $02
#_0E96C1: db $28, $2A, $20, $20, $20, $02, $08, $00
#_0E96C9: db $04, $04, $01, $01, $01, $02, $02, $02
#_0E96D1: db $00, $00, $20, $20, $00, $02, $00, $00
#_0E96D9: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E96E1: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E96E9: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E96F1: db $01, $01, $18, $10, $10, $01, $01, $01
#_0E96F9: db $01, $01, $04, $04, $04, $04, $04, $04
#_0E9701: db $01, $02, $02, $00, $00, $00, $00, $00
#_0E9709: db $01, $01, $01, $01, $01, $01, $01, $01
#_0E9711: db $01, $01, $01, $01, $01, $01, $02, $02
#_0E9719: db $00, $00, $00, $00, $00, $00, $00, $00
#_0E9721: db $00, $00, $00, $00, $00, $00, $62, $62
#_0E9729: db $00, $00, $24, $24, $00, $00, $00, $00
#_0E9731: db $00, $00, $00, $00, $00, $00, $62, $62
#_0E9739: db $27, $02, $02, $02, $27, $27, $01, $00
#_0E9741: db $00, $00, $00, $24, $00, $00, $00, $00
#_0E9749: db $27, $27, $27, $27, $27, $10, $02, $01
#_0E9751: db $00, $00, $00, $24, $00, $00, $00, $00
#_0E9759: db $27, $02, $02, $02, $27, $27, $27, $27
#_0E9761: db $02, $02, $02, $24, $00, $00, $00, $00
#_0E9769: db $27, $27, $27, $27, $27, $20, $02, $02
#_0E9771: db $01, $02, $02, $23, $02, $00, $00, $00
#_0E9779: db $27, $27, $27, $27, $27, $20, $02, $27
#_0E9781: db $02, $54, $00, $00, $27, $02, $02, $02
#_0E9789: db $27, $27, $27, $27, $27, $27, $02, $27
#_0E9791: db $02, $54, $00, $00, $27, $02, $02, $02
#_0E9799: db $27, $27, $00, $27, $60, $60, $01, $01
#_0E97A1: db $01, $01, $02, $02, $0D, $00, $00, $4B
#_0E97A9: db $67, $67, $67, $67, $66, $66, $66, $66
#_0E97B1: db $00, $00, $20, $20, $20, $20, $20, $20
#_0E97B9: db $27, $63, $27, $55, $55, $01, $44, $00
#_0E97C1: db $01, $20, $02, $02, $1C, $3A, $3B, $00
#_0E97C9: db $27, $63, $27, $53, $53, $01, $44, $01
#_0E97D1: db $0D, $00, $00, $00, $09, $09, $09, $09

;===================================================================================================

LoadDefaultTileTypes:
#_0E97D9: REP #$20

#_0E97DB: LDX.b #$3E

.copy_next
#_0E97DD: LDA.l UnderworldTileTypes+$000,X
#_0E97E1: STA.l $7EFE00,X

#_0E97E5: LDA.l UnderworldTileTypes+$040,X
#_0E97E9: STA.l $7EFE40,X

#_0E97ED: LDA.l UnderworldTileTypes+$080,X
#_0E97F1: STA.l $7EFE80,X

#_0E97F5: LDA.l UnderworldTileTypes+$0C0,X
#_0E97F9: STA.l $7EFEC0,X

#_0E97FD: LDA.l UnderworldTileTypes+$100,X
#_0E9801: STA.l $7EFF00,X

#_0E9805: LDA.l UnderworldTileTypes+$140,X
#_0E9809: STA.l $7EFFC0,X

#_0E980D: DEX
#_0E980E: DEX
#_0E980F: BPL .copy_next

#_0E9811: SEP #$20

#_0E9813: RTL

;===================================================================================================
; FREE ROM: 0x0C
;===================================================================================================
NULL_0E9814:
#_0E9814: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0E981C: db $FF, $FF, $FF, $FF

;===================================================================================================

pool Module1A_Credits

.vectors
#_0E9820: dw Credits_LoadNextScene_Overworld    ; 0x00
#_0E9822: dw Credits_ScrollScene_Overworld      ; 0x01
#_0E9824: dw Credits_LoadNextScene_Underworld   ; 0x02
#_0E9826: dw Credits_ScrollScene_Underworld     ; 0x03
#_0E9828: dw Credits_LoadNextScene_Overworld    ; 0x04
#_0E982A: dw Credits_ScrollScene_Overworld      ; 0x05
#_0E982C: dw Credits_LoadNextScene_Overworld    ; 0x06
#_0E982E: dw Credits_ScrollScene_Overworld      ; 0x07
#_0E9830: dw Credits_LoadNextScene_Overworld    ; 0x08
#_0E9832: dw Credits_ScrollScene_Overworld      ; 0x09
#_0E9834: dw Credits_LoadNextScene_Overworld    ; 0x0A
#_0E9836: dw Credits_ScrollScene_Overworld      ; 0x0B
#_0E9838: dw Credits_LoadNextScene_Overworld    ; 0x0C
#_0E983A: dw Credits_ScrollScene_Overworld      ; 0x0D
#_0E983C: dw Credits_LoadNextScene_Overworld    ; 0x0E
#_0E983E: dw Credits_ScrollScene_Overworld      ; 0x0F
#_0E9840: dw Credits_LoadNextScene_Overworld    ; 0x10
#_0E9842: dw Credits_ScrollScene_Overworld      ; 0x11
#_0E9844: dw Credits_LoadNextScene_Overworld    ; 0x12
#_0E9846: dw Credits_ScrollScene_Overworld      ; 0x13
#_0E9848: dw Credits_LoadNextScene_Underworld   ; 0x14
#_0E984A: dw Credits_ScrollScene_Underworld     ; 0x15
#_0E984C: dw Credits_LoadNextScene_Underworld   ; 0x16
#_0E984E: dw Credits_ScrollScene_Underworld     ; 0x17
#_0E9850: dw Credits_LoadNextScene_Overworld    ; 0x18
#_0E9852: dw Credits_ScrollScene_Overworld      ; 0x19
#_0E9854: dw Credits_LoadNextScene_Overworld    ; 0x1A
#_0E9856: dw Credits_ScrollScene_Overworld      ; 0x1B
#_0E9858: dw Credits_LoadNextScene_Overworld    ; 0x1C
#_0E985A: dw Credits_ScrollScene_Overworld      ; 0x1D
#_0E985C: dw Credits_LoadNextScene_Overworld    ; 0x1E
#_0E985E: dw Credits_ScrollScene_Overworld      ; 0x1F
#_0E9860: dw Credits_InitializeTheActualCredits ; 0x20
#_0E9862: dw Credits_BrightenTriangles          ; 0x21
#_0E9864: dw Credits_FadeColorAndBeginAnimating ; 0x22
#_0E9866: dw Credits_StopCreditsScroll          ; 0x23
#_0E9868: dw Credits_FadeAndDisperseTriangles   ; 0x24
#_0E986A: dw Credits_FadeInTheEnd               ; 0x25
#_0E986C: dw Credits_HangForever

pool off

;---------------------------------------------------------------------------------------------------

Module1A_Credits:
#_0E986E: REP #$20

#_0E9870: LDA.w #$0030
#_0E9873: STA.w $0FE0

#_0E9876: LDA.w #$01D0
#_0E9879: STA.w $0FE2

#_0E987C: STZ.w $0FE4

#_0E987F: SEP #$20

#_0E9881: LDA.b $11
#_0E9883: ASL A
#_0E9884: TAX

#_0E9885: JSR (.vectors,X)

#_0E9888: RTL

;===================================================================================================

Credits_LoadNextScene_Overworld:
#_0E9889: JSL Credits_LoadScene_Overworld
#_0E988D: JSR Credits_AddEndingSequenceText

#_0E9890: RTS

;===================================================================================================

Credits_LoadNextScene_Underworld:
#_0E9891: JSL Credits_LoadScene_Underworld

#_0E9895: JSR Credits_AddEndingSequenceText

#_0E9898: RTS

;===================================================================================================

pool Credits_PrepAndLoadSprites

.vectors
#_0E9899: dw Credits_LoadSprites_GenericOW ; Hyrule Castle
#_0E989B: dw Credits_LoadSprites_GenericUW ; Sanctuary
#_0E989D: dw Credits_LoadSprites_Kakariko1 ; Kakariko
#_0E989F: dw Credits_LoadSprites_Desert    ; Desert
#_0E98A1: dw Credits_LoadSprites_GenericOW ; Tower of Hera
#_0E98A3: dw Credits_LoadSprites_GenericOW ; Link's house
#_0E98A5: dw Credits_LoadSprites_Zora      ; Zora's Domain
#_0E98A7: dw Credits_LoadSprites_Witch     ; Potion shop
#_0E98A9: dw Credits_LoadSprites_GenericOW ; Lumberjacks
#_0E98AB: dw Credits_LoadSprites_Grove     ; Haunted Grove
#_0E98AD: dw Credits_LoadSprites_Venus     ; Wishing Well
#_0E98AF: dw Credits_LoadSprites_Smithy    ; Smithery
#_0E98B1: dw Credits_LoadSprites_Kakariko2 ; Kakariko (bug net)
#_0E98B3: dw Credits_LoadSprites_GenericOW ; Death Mountain
#_0E98B5: dw Credits_LoadSprites_LostWoods ; Lost Woods
#_0E98B7: dw Credits_LoadSprites_Pedestal  ; Master Sword

pool off

;---------------------------------------------------------------------------------------------------

Credits_PrepAndLoadSprites:
#_0E98B9: PHB
#_0E98BA: PHK
#_0E98BB: PLB

#_0E98BC: LDX.b #$0F

.reset_next_sprite
#_0E98BE: JSL SpritePrep_ResetProperties

#_0E98C2: STZ.w $0DD0,X
#_0E98C5: STZ.w $0BE0,X
#_0E98C8: STZ.w $0CAA,X

#_0E98CB: DEX
#_0E98CC: BPL .reset_next_sprite

;---------------------------------------------------------------------------------------------------

#_0E98CE: LDA.b $11
#_0E98D0: AND.b #$FE
#_0E98D2: TAX

#_0E98D3: JSR (.vectors,X)

#_0E98D6: PLB

#_0E98D7: RTL

;===================================================================================================

pool Credits_ScrollScene

.target_y
#_0E98D8: dw $06F2 ; Hyrule Castle
#_0E98DA: dw $0210 ; Sanctuary
#_0E98DC: dw $072C ; Kakariko
#_0E98DE: dw $0C00 ; Desert
#_0E98E0: dw $010C ; Tower of Hera
#_0E98E2: dw $0A9B ; Link's house
#_0E98E4: dw $0010 ; Zora's Domain
#_0E98E6: dw $0510 ; Potion shop
#_0E98E8: dw $0089 ; Lumberjacks
#_0E98EA: dw $0A8E ; Haunted Grove
#_0E98EC: dw $222C ; Wishing Well
#_0E98EE: dw $2510 ; Smithery
#_0E98F0: dw $0826 ; Kakariko (bug net)
#_0E98F2: dw $005C ; Death Mountain
#_0E98F4: dw $020A ; Lost Woods
#_0E98F6: dw $0030 ; Master Sword

.target_x
#_0E98F8: dw $077F ; Hyrule Castle
#_0E98FA: dw $0480 ; Sanctuary
#_0E98FC: dw $0193 ; Kakariko
#_0E98FE: dw $00AA ; Desert
#_0E9900: dw $0878 ; Tower of Hera
#_0E9902: dw $0847 ; Link's house
#_0E9904: dw $04FD ; Zora's Domain
#_0E9906: dw $0C57 ; Potion shop
#_0E9908: dw $040F ; Lumberjacks
#_0E990A: dw $0478 ; Haunted Grove
#_0E990C: dw $0A00 ; Wishing Well
#_0E990E: dw $0200 ; Smithery
#_0E9910: dw $0201 ; Kakariko (bug net)
#_0E9912: dw $0AA1 ; Death Mountain
#_0E9914: dw $026F ; Lost Woods
#_0E9916: dw $0000 ; Master Sword

;---------------------------------------------------------------------------------------------------

.movement_y
#_0E9918: dw  -1   ; Hyrule Castle
#_0E991A: dw  -1   ; Sanctuary
#_0E991C: dw   1   ; Kakariko
#_0E991E: dw  -1   ; Desert
#_0E9920: dw   1   ; Tower of Hera
#_0E9922: dw   1   ; Link's house
#_0E9924: dw   0   ; Zora's Domain
#_0E9926: dw   1   ; Potion shop
#_0E9928: dw   0   ; Lumberjacks
#_0E992A: dw  -1   ; Haunted Grove
#_0E992C: dw  -1   ; Wishing Well
#_0E992E: dw   0   ; Smithery
#_0E9930: dw   0   ; Kakariko (bug net)
#_0E9932: dw   0   ; Death Mountain
#_0E9934: dw   1   ; Lost Woods
#_0E9936: dw  -1   ; Master Sword

.movement_x
#_0E9938: dw   0   ; Hyrule Castle
#_0E993A: dw   0   ; Sanctuary
#_0E993C: dw  -1   ; Kakariko
#_0E993E: dw   0   ; Desert
#_0E9940: dw   0   ; Tower of Hera
#_0E9942: dw  -1   ; Link's house
#_0E9944: dw   1   ; Zora's Domain
#_0E9946: dw   0   ; Potion shop
#_0E9948: dw  -1   ; Lumberjacks
#_0E994A: dw   0   ; Haunted Grove
#_0E994C: dw   0   ; Wishing Well
#_0E994E: dw   0   ; Smithery
#_0E9950: dw   1   ; Kakariko (bug net)
#_0E9952: dw  -1   ; Death Mountain
#_0E9954: dw   1   ; Lost Woods
#_0E9956: dw   0   ; Master Sword

pool off

;---------------------------------------------------------------------------------------------------

Credits_ScrollScene_Overworld:
#_0E9958: PHB
#_0E9959: PHK
#_0E995A: PLB

#_0E995B: LDX.b #$0F

.next_timer
#_0E995D: LDA.w $0DF0,X
#_0E9960: BEQ .timer_done

#_0E9962: DEC.w $0DF0,X

.timer_done
#_0E9965: DEX
#_0E9966: BPL .next_timer

;---------------------------------------------------------------------------------------------------

#_0E9968: LDA.b $11
#_0E996A: AND.b #$FE
#_0E996C: TAX

#_0E996D: STZ.b $30
#_0E996F: STZ.b $31

#_0E9971: REP #$20

#_0E9973: LDA.b $C8
#_0E9975: CMP.w #$0040
#_0E9978: BCC .no_scroll

#_0E997A: AND.w #$0001
#_0E997D: BNE .no_scroll

#_0E997F: LDA.b $E8
#_0E9981: CMP.w Credits_ScrollScene_target_y,X
#_0E9984: BEQ .at_vertical_target

#_0E9986: LDY.w Credits_ScrollScene_movement_y,X
#_0E9989: STY.b $30

.at_vertical_target
#_0E998B: LDA.b $E2
#_0E998D: CMP.w Credits_ScrollScene_target_x,X
#_0E9990: BEQ .no_scroll

#_0E9992: LDY.w Credits_ScrollScene_movement_x,X
#_0E9995: STY.b $31

;---------------------------------------------------------------------------------------------------

.no_scroll
#_0E9997: SEP #$20

#_0E9999: PHX
#_0E999A: JSL Credits_OperateScrollingAndTilemap
#_0E999E: PLX

#_0E999F: JSR (Credits_SpriteDraw_vectors,X)

#_0E99A2: JMP.w Credits_HandleSceneFade

;===================================================================================================

Credits_SpriteDraw_vectors:
#_0E99A5: dw Credits_SpriteDraw_Castle
#_0E99A7: dw Credits_SpriteDraw_Sanctuary
#_0E99A9: dw Credits_SpriteDraw_Kakariko1
#_0E99AB: dw Credits_SpriteDraw_Desert
#_0E99AD: dw Credits_SpriteDraw_Hera
#_0E99AF: dw Credits_SpriteDraw_House
#_0E99B1: dw Credits_SpriteDraw_Zora
#_0E99B3: dw Credits_SpriteDraw_Witch
#_0E99B5: dw Credits_SpriteDraw_Lumberjacks
#_0E99B7: dw Credits_SpriteDraw_Grove
#_0E99B9: dw Credits_SpriteDraw_Venus
#_0E99BB: dw Credits_SpriteDraw_Smithy
#_0E99BD: dw Credits_SpriteDraw_Kakariko2
#_0E99BF: dw Credits_SpriteDraw_DeathMountain
#_0E99C1: dw Credits_SpriteDraw_LostWoods
#_0E99C3: dw Credits_SpriteDraw_Pedestal

;===================================================================================================

Credits_ScrollScene_Underworld:
#_0E99C5: PHB
#_0E99C6: PHK
#_0E99C7: PLB

#_0E99C8: LDX.b #$0F

.next_timer
#_0E99CA: LDA.w $0DF0,X
#_0E99CD: BEQ .timer_done

#_0E99CF: DEC.w $0DF0,X

.timer_done
#_0E99D2: DEX
#_0E99D3: BPL .next_timer

;---------------------------------------------------------------------------------------------------

#_0E99D5: LDA.b $11
#_0E99D7: AND.b #$FE
#_0E99D9: TAX

#_0E99DA: REP #$20

#_0E99DC: LDA.b $C8
#_0E99DE: CMP.w #$0040
#_0E99E1: BCC .no_scroll

#_0E99E3: AND.w #$0001
#_0E99E6: BNE .no_scroll

#_0E99E8: LDA.b $E8
#_0E99EA: CMP.w Credits_ScrollScene_target_y,X
#_0E99ED: BEQ .at_vertical_target

#_0E99EF: CLC
#_0E99F0: ADC.w Credits_ScrollScene_movement_y,X
#_0E99F3: STA.b $E8

.at_vertical_target
#_0E99F5: LDA.b $E2
#_0E99F7: CMP.w Credits_ScrollScene_target_x,X
#_0E99FA: BEQ .no_scroll

#_0E99FC: CLC
#_0E99FD: ADC.w Credits_ScrollScene_movement_x,X
#_0E9A00: STA.b $E2

.no_scroll
#_0E9A02: SEP #$20

#_0E9A04: JSR (Credits_SpriteDraw_vectors,X)

#_0E9A07: JMP.w Credits_HandleSceneFade

;===================================================================================================

pool Credits_HandleSceneFade

.timer
#_0E9A0A: dw $0300 ;  768 - Hyrule Castle
#_0E9A0C: dw $0280 ;  640 - Sanctuary
#_0E9A0E: dw $0250 ;  592 - Kakariko
#_0E9A10: dw $02E0 ;  736 - Desert
#_0E9A12: dw $0280 ;  640 - Tower of Hera
#_0E9A14: dw $0250 ;  592 - Link's house
#_0E9A16: dw $02C0 ;  704 - Zora's Domain
#_0E9A18: dw $02C0 ;  704 - Potion shop
#_0E9A1A: dw $0250 ;  592 - Lumberjacks
#_0E9A1C: dw $0250 ;  592 - Haunted Grove
#_0E9A1E: dw $0280 ;  640 - Wishing Well
#_0E9A20: dw $0250 ;  592 - Smithery
#_0E9A22: dw $0480 ; 1152 - Kakariko (bug net)
#_0E9A24: dw $0400 ; 1024 - Death Mountain
#_0E9A26: dw $0250 ;  592 - Lost Woods
#_0E9A28: dw $0500 ; 1280 - Master Sword

pool off

;---------------------------------------------------------------------------------------------------

Credits_HandleSceneFade:
#_0E9A2A: LDA.b $11
#_0E9A2C: AND.b #$FE
#_0E9A2E: TAX

#_0E9A2F: REP #$20

#_0E9A31: LDA.b $C8
#_0E9A33: CMP.w .timer,X

#_0E9A36: SEP #$20
#_0E9A38: BCC .dont_fade

#_0E9A3A: LDA.b $C8
#_0E9A3C: AND.b #$01
#_0E9A3E: BNE .delay

#_0E9A40: DEC.b $13
#_0E9A42: BNE .delay

#_0E9A44: INC.b $11
#_0E9A46: BRA .continue

.dont_fade
#_0E9A48: LDA.b $C8
#_0E9A4A: AND.b #$01
#_0E9A4C: BNE .delay

#_0E9A4E: LDA.b $13
#_0E9A50: CMP.b #$0F
#_0E9A52: BEQ .delay

#_0E9A54: INC.b $13

.delay
#_0E9A56: REP #$20

#_0E9A58: INC.b $C8

#_0E9A5A: SEP #$20

;---------------------------------------------------------------------------------------------------

.continue
#_0E9A5C: REP #$20

#_0E9A5E: LDA.b $E2
#_0E9A60: STA.w $011E

#_0E9A63: LDA.b $E8
#_0E9A65: STA.w $0122

#_0E9A68: LDA.b $E0
#_0E9A6A: STA.w $0120

#_0E9A6D: LDA.b $E6
#_0E9A6F: STA.w $0124

#_0E9A72: SEP #$20

#_0E9A74: PLB

#_0E9A75: RTS

;===================================================================================================

pool Credits_SpriteData

.castle_position_x
#_0E9A76: dw $01E0 ; King
#_0E9A78: dw $0200 ; Zelda
#_0E9A7A: dw $01ED ; Maiden 3
#_0E9A7C: dw $0203 ; Maiden 4
#_0E9A7E: dw $01DA ; Maiden 2
#_0E9A80: dw $0216 ; Maiden 5
#_0E9A82: dw $01C8 ; Maiden 1
#_0E9A84: dw $0228 ; Maiden 6
#_0E9A86: dw $01C0 ; Guard 1
#_0E9A88: dw $01E0 ; Guard 2
#_0E9A8A: dw $0208 ; Guard 3
#_0E9A8C: dw $0228 ; Guard 4

.castle_position_y
#_0E9A8E: dw $0158 ; King
#_0E9A90: dw $0158 ; Zelda
#_0E9A92: dw $0138 ; Maiden 3
#_0E9A94: dw $0138 ; Maiden 4
#_0E9A96: dw $0140 ; Maiden 2
#_0E9A98: dw $0140 ; Maiden 5
#_0E9A9A: dw $0150 ; Maiden 1
#_0E9A9C: dw $0150 ; Maiden 6
#_0E9A9E: dw $0120 ; Guard 1
#_0E9AA0: dw $0120 ; Guard 2
#_0E9AA2: dw $0120 ; Guard 3
#_0E9AA4: dw $0120 ; Guard 4

;---------------------------------------------------------------------------------------------------

.kak1_position_x
#_0E9AA6: dw $0278
#_0E9AA8: dw $0298
#_0E9AAA: dw $01E0
#_0E9AAC: dw $0200
#_0E9AAE: dw $0220
#_0E9AB0: dw $0288
#_0E9AB2: dw $01E2

.kak1_position_y
#_0E9AB4: dw $00C2
#_0E9AB6: dw $00C2
#_0E9AB8: dw $016B
#_0E9ABA: dw $016C
#_0E9ABC: dw $016B
#_0E9ABE: dw $00B8
#_0E9AC0: dw $016B

;---------------------------------------------------------------------------------------------------

.hera_position_x
#_0E9AC2: dw $0335
#_0E9AC4: dw $0335
#_0E9AC6: dw $0300

.hera_position_y
#_0E9AC8: dw $0128
#_0E9ACA: dw $0128
#_0E9ACC: dw $016F

;---------------------------------------------------------------------------------------------------

.house_position_x
#_0E9ACE: dw $00B8
#_0E9AD0: dw $00CE
#_0E9AD2: dw $00AC
#_0E9AD4: dw $00C4

.house_position_y
#_0E9AD6: dw $00F5
#_0E9AD8: dw $00FC
#_0E9ADA: dw $010D
#_0E9ADC: dw $010D

;---------------------------------------------------------------------------------------------------

.mountain_position_x
#_0E9ADE: dw $0180

.mountain_position_y
#_0E9AE0: dw $00D8

;---------------------------------------------------------------------------------------------------

.bumpkin_position_x
#_0E9AE2: dw $0080

.bumpkin_position_y
#_0E9AE4: dw $00F4

;---------------------------------------------------------------------------------------------------

.venus_position_x
#_0E9AE6: dw $0070
#_0E9AE8: dw $0070
#_0E9AEA: dw $0070
#_0E9AEC: dw $0068
#_0E9AEE: dw $0088
#_0E9AF0: dw $0070

.venus_position_y
#_0E9AF2: dw $003C
#_0E9AF4: dw $003C
#_0E9AF6: dw $003C
#_0E9AF8: dw $0090
#_0E9AFA: dw $0080
#_0E9AFC: dw $003C

;---------------------------------------------------------------------------------------------------

.kak2_position_x
#_0E9AFE: dw $00C8
#_0E9B00: dw $0278
#_0E9B02: dw $0258
#_0E9B04: dw $01D8
#_0E9B06: dw $01C8
#_0E9B08: dw $0188
#_0E9B0A: dw $0270

.kak2_position_y
#_0E9B0C: dw $0250
#_0E9B0E: dw $02B0
#_0E9B10: dw $02B0
#_0E9B12: dw $02A0
#_0E9B14: dw $02B0
#_0E9B16: dw $02B0
#_0E9B18: dw $02B8

;---------------------------------------------------------------------------------------------------

.zora_position_x
#_0E9B1A: dw $03B0
#_0E9B1C: dw $0390
#_0E9B1E: dw $03D0

.zora_position_y
#_0E9B20: dw $0040
#_0E9B22: dw $0040
#_0E9B24: dw $0040

;---------------------------------------------------------------------------------------------------

.smithy_position_x
#_0E9B26: dw $0040
#_0E9B28: dw $0070
#_0E9B2A: dw $004F
#_0E9B2C: dw $0061
#_0E9B2E: dw $0037
#_0E9B30: dw $0079

.smithy_position_y
#_0E9B32: dw $016C
#_0E9B34: dw $016C
#_0E9B36: dw $0174
#_0E9B38: dw $0174
#_0E9B3A: dw $0175
#_0E9B3C: dw $0175

;---------------------------------------------------------------------------------------------------

.desert_position_x
#_0E9B3E: dw $00E0
#_0E9B40: dw $0150
#_0E9B42: dw $00E8
#_0E9B44: dw $0168
#_0E9B46: dw $0128
#_0E9B48: dw $0170
#_0E9B4A: dw $0170

.desert_position_y
#_0E9B4C: dw $0080
#_0E9B4E: dw $0060
#_0E9B50: dw $0146
#_0E9B52: dw $0146
#_0E9B54: dw $01C6
#_0E9B56: dw $0070
#_0E9B58: dw $0070

;---------------------------------------------------------------------------------------------------

.sanc_position_x
#_0E9B5A: dw $00F8
#_0E9B5C: dw $00F0

.sanc_position_y
#_0E9B5E: dw $0060
#_0E9B60: dw $0037

;---------------------------------------------------------------------------------------------------

.witch_position_x
#_0E9B62: dw $00F8
#_0E9B64: dw $00C8

.witch_position_y
#_0E9B66: dw $0150
#_0E9B68: dw $0158

;---------------------------------------------------------------------------------------------------

.grove_position_x
#_0E9B6A: dw $00F8
#_0E9B6C: dw $00F8
#_0E9B6E: dw $00F8
#_0E9B70: dw $00F8
#_0E9B72: dw $00F8
#_0E9B74: dw $00E8
#_0E9B76: dw $00F8
#_0E9B78: dw $00D8
#_0E9B7A: dw $00F8
#_0E9B7C: dw $00C8
#_0E9B7E: dw $0108

.grove_position_y
#_0E9B80: dw $0120
#_0E9B82: dw $0120
#_0E9B84: dw $0120
#_0E9B86: dw $0120
#_0E9B88: dw $0120
#_0E9B8A: dw $0108
#_0E9B8C: dw $0100
#_0E9B8E: dw $00D8
#_0E9B90: dw $00D8
#_0E9B92: dw $00F0
#_0E9B94: dw $00F0

;---------------------------------------------------------------------------------------------------

.lostwoods_position_x
#_0E9B96: dw $02E8
#_0E9B98: dw $0270
#_0E9B9A: dw $0270
#_0E9B9C: dw $02A0
#_0E9B9E: dw $02A0
#_0E9BA0: dw $02A4
#_0E9BA2: dw $02FC

.lostwoods_position_y
#_0E9BA4: dw $024B
#_0E9BA6: dw $01B0
#_0E9BA8: dw $01C8
#_0E9BAA: dw $01C8
#_0E9BAC: dw $01B0
#_0E9BAE: dw $0230
#_0E9BB0: dw $0230

;---------------------------------------------------------------------------------------------------

.pedestal_position_x
#_0E9BB2: dw $0076
#_0E9BB4: dw $0073
#_0E9BB6: dw $0076
#_0E9BB8: dw $0000
#_0E9BBA: dw $00D0
#_0E9BBC: dw $0080

.pedestal_position_y
#_0E9BBE: dw $008B
#_0E9BC0: dw $0083
#_0E9BC2: dw $0085
#_0E9BC4: dw $002C
#_0E9BC6: dw $00F8
#_0E9BC8: dw $0100

;---------------------------------------------------------------------------------------------------

.position_x_pointers
#_0E9BCA: dw .castle_position_x
#_0E9BCC: dw .sanc_position_x
#_0E9BCE: dw .kak1_position_x
#_0E9BD0: dw .desert_position_x
#_0E9BD2: dw .hera_position_x
#_0E9BD4: dw .house_position_x
#_0E9BD6: dw .zora_position_x
#_0E9BD8: dw .witch_position_x
#_0E9BDA: dw .bumpkin_position_x
#_0E9BDC: dw .grove_position_x
#_0E9BDE: dw .venus_position_x
#_0E9BE0: dw .smithy_position_x
#_0E9BE2: dw .kak2_position_x
#_0E9BE4: dw .mountain_position_x
#_0E9BE6: dw .lostwoods_position_x
#_0E9BE8: dw .pedestal_position_x

.position_y_pointers
#_0E9BEA: dw .castle_position_y
#_0E9BEC: dw .sanc_position_y
#_0E9BEE: dw .kak1_position_y
#_0E9BF0: dw .desert_position_y
#_0E9BF2: dw .hera_position_y
#_0E9BF4: dw .house_position_y
#_0E9BF6: dw .zora_position_y
#_0E9BF8: dw .witch_position_y
#_0E9BFA: dw .bumpkin_position_y
#_0E9BFC: dw .grove_position_y
#_0E9BFE: dw .venus_position_y
#_0E9C00: dw .smithy_position_y
#_0E9C02: dw .kak2_position_y
#_0E9C04: dw .mountain_position_y
#_0E9C06: dw .lostwoods_position_y
#_0E9C08: dw .pedestal_position_y

;---------------------------------------------------------------------------------------------------

.sprite_count
#_0E9C0A: db  11 ; Hyrule Castle
#_0E9C0B: db   1 ; Sanctuary
#_0E9C0C: db   6 ; Kakariko
#_0E9C0D: db   6 ; Desert
#_0E9C0E: db   2 ; Tower of Hera
#_0E9C0F: db   3 ; Link's house
#_0E9C10: db   2 ; Zora's Domain
#_0E9C11: db   1 ; Potion shop
#_0E9C12: db   0 ; Lumberjacks
#_0E9C13: db  10 ; Haunted Grove
#_0E9C14: db   5 ; Wishing Well
#_0E9C15: db   5 ; Smithery
#_0E9C16: db   6 ; Kakariko (bug net)
#_0E9C17: db   0 ; Death Mountain
#_0E9C18: db   6 ; Lost Woods
#_0E9C19: db   5 ; Master Sword

pool off

;===================================================================================================

Credits_LoadSprites_Zora:
#_0E9C1A: LDA.b #$FF
#_0E9C1C: STA.w $0DF0
#_0E9C1F: STA.w $0DF1
#_0E9C22: STA.w $0DF2

#_0E9C25: BRA ProceedToCreditsSpriteLoad

;===================================================================================================

Credits_LoadSprites_Kakariko1:
#_0E9C27: LDA.w CreditsSpriteSpeeds_neg16

#_0E9C2A: STA.w $0D46

#_0E9C2D: BRA ProceedToCreditsSpriteLoad

;===================================================================================================

Credits_LoadSprites_Desert:
#_0E9C2F: LDA.b #$16
#_0E9C31: STA.w $0D95

#_0E9C34: LDA.w CreditsSpriteSpeeds_neg16
#_0E9C37: STA.w $0D40

#_0E9C3A: LDA.w CreditsSpriteSpeeds_pos16
#_0E9C3D: STA.w $0D41

#_0E9C40: LDA.b #$01
#_0E9C42: STA.w $0EB1

;---------------------------------------------------------------------------------------------------

#_0E9C45: LDY.b #$02

.next_sprite
#_0E9C47: LDA.b #$57 ; SPRITE 57
#_0E9C49: STA.w $0E22,Y

#_0E9C4C: LDA.b #$31
#_0E9C4E: STA.w $0F52,Y

#_0E9C51: DEY
#_0E9C52: BPL .next_sprite

;===================================================================================================

ProceedToCreditsSpriteLoad:
#_0E9C54: BRA ProceedTo_Credits_LoadSprites_GenericOW

;===================================================================================================

pool Credits_LoadSprites_Grove

.sprite_timers
#_0E9C56: db $00, $13, $26, $39, $4C

pool off

;---------------------------------------------------------------------------------------------------

Credits_LoadSprites_Grove:
#_0E9C5B: LDY.b #$04

.init_next_sprite
#_0E9C5D: LDA.w .sprite_timers,Y
#_0E9C60: STA.w $0DF0,Y

#_0E9C63: LDA.b #$00
#_0E9C65: STA.w $0DD0,Y

#_0E9C68: DEY
#_0E9C69: BPL .init_next_sprite

;---------------------------------------------------------------------------------------------------

#_0E9C6B: LDA.b #$2E ; SPRITE 2E
#_0E9C6D: STA.w $0E25

;---------------------------------------------------------------------------------------------------

#_0E9C70: LDY.b #$01

.set_next_sprite
#_0E9C72: LDA.b #$9F ; SPRITE 9F
#_0E9C74: STA.w $0E27,Y

#_0E9C77: LDA.b #$A0 ; SPRITE A0
#_0E9C79: STA.w $0E29,Y

#_0E9C7C: LDA.b #$01
#_0E9C7E: STA.w $0E47,Y

#_0E9C81: INC A
#_0E9C82: STA.w $0E49,Y

#_0E9C85: LDA.b #$10
#_0E9C87: STA.w $0E67,Y
#_0E9C8A: STA.w $0E69,Y

#_0E9C8D: DEY
#_0E9C8E: BPL .set_next_sprite

;===================================================================================================

ProceedTo_Credits_LoadSprites_GenericOW:
#_0E9C90: BRA Credits_LoadSprites_GenericOW

;===================================================================================================

Credits_LoadSprites_LostWoods:
#_0E9C92: LDA.w CreditsSpriteSpeeds_neg16
#_0E9C95: STA.w $0D45

#_0E9C98: LDA.w CreditsSpriteSpeeds_pos16
#_0E9C9B: STA.w $0D46

#_0E9C9E: LDA.b #$01
#_0E9CA0: STA.w $0EB6

#_0E9CA3: LDA.b #$08
#_0E9CA5: STA.w $0D90

;---------------------------------------------------------------------------------------------------

#_0E9CA8: LDY.b #$03

.next_sprite_y
#_0E9CAA: LDA.b #$04
#_0E9CAC: STA.w $0D41,Y

#_0E9CAF: DEY
#_0E9CB0: BPL .next_sprite_y

;---------------------------------------------------------------------------------------------------

#_0E9CB2: BRA Credits_LoadSprites_GenericOW

;===================================================================================================

Credits_LoadSprites_Pedestal:
#_0E9CB4: LDA.b #$02
#_0E9CB6: STA.w $0DB4

#_0E9CB9: LDA.b #$08
#_0E9CBB: STA.w $0D45

#_0E9CBE: LDA.b #$13
#_0E9CC0: STA.w $0DF1

#_0E9CC3: LDA.b #$40
#_0E9CC5: STA.w $0DF4

#_0E9CC8: BRA Credits_LoadSprites_GenericOW

;===================================================================================================

Credits_LoadSprites_Witch:
#_0E9CCA: LDA.b #$FF
#_0E9CCC: STA.w $0DF1

#_0E9CCF: BRA Credits_LoadSprites_GenericOW

;===================================================================================================

Credits_LoadSprites_Kakariko2:
#_0E9CD1: LDY.b #$01

.next_sprite
#_0E9CD3: LDA.b #$39
#_0E9CD5: STA.w $0F53,Y

#_0E9CD8: LDA.b #$0B ; SPRITE 0B
#_0E9CDA: STA.w $0E23,Y

#_0E9CDD: LDA.b #$10
#_0E9CDF: STA.w $0E63,Y

#_0E9CE2: LDA.b #$01
#_0E9CE4: STA.w $0E43,Y

#_0E9CE7: DEY
#_0E9CE8: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0E9CEA: LDA.b #$2A ; SPRITE 2A
#_0E9CEC: STA.w $0E25

#_0E9CEF: LDA.b #$79 ; SPRITE 79
#_0E9CF1: STA.w $0E26

#_0E9CF4: LDA.b #$01
#_0E9CF6: STA.w $0D86

#_0E9CF9: LDA.b #$05
#_0E9CFB: STA.w $0F76

;===================================================================================================

Credits_LoadSprites_GenericOW:
#_0E9CFE: LDA.w Credits_SpriteData_position_x_pointers+0,X
#_0E9D01: STA.b $04

#_0E9D03: LDA.w Credits_SpriteData_position_x_pointers+1,X
#_0E9D06: STA.b $05

#_0E9D08: LDA.w Credits_SpriteData_position_y_pointers+0,X
#_0E9D0B: STA.b $06

#_0E9D0D: LDA.w Credits_SpriteData_position_y_pointers+1,X
#_0E9D10: STA.b $07

#_0E9D12: TXA
#_0E9D13: LSR A
#_0E9D14: TAX

#_0E9D15: LDA.w Credits_SpriteData_sprite_count,X
#_0E9D18: TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
#_0E9D19: TXA
#_0E9D1A: ASL A
#_0E9D1B: TAY

#_0E9D1C: REP #$20

#_0E9D1E: LDA.w #$FFFF
#_0E9D21: STA.w $0FBA
#_0E9D24: STA.w $0FB8

#_0E9D27: LDA.w $040A
#_0E9D2A: ASL A
#_0E9D2B: XBA
#_0E9D2C: AND.w #$0F00

#_0E9D2F: CLC
#_0E9D30: ADC.b ($04),Y
#_0E9D32: STA.b $00

#_0E9D34: LDA.w $040A
#_0E9D37: LSR A
#_0E9D38: LSR A
#_0E9D39: XBA
#_0E9D3A: AND.w #$0E00

#_0E9D3D: CLC
#_0E9D3E: ADC.b ($06),Y
#_0E9D40: STA.b $02

#_0E9D42: SEP #$20

#_0E9D44: LDA.b $00
#_0E9D46: STA.w $0D10,X

#_0E9D49: LDA.b $01
#_0E9D4B: STA.w $0D30,X

#_0E9D4E: LDA.b $02
#_0E9D50: STA.w $0D00,X

#_0E9D53: LDA.b $03
#_0E9D55: STA.w $0D20,X

#_0E9D58: DEX
#_0E9D59: BPL .next_sprite

#_0E9D5B: RTS

;===================================================================================================

Credits_LoadSprites_Venus:
#_0E9D5C: LDA.b #$10
#_0E9D5E: STA.w $0DF1

#_0E9D61: LDA.b #$20
#_0E9D63: STA.w $0DF2

#_0E9D66: LDA.b #$08
#_0E9D68: STA.w $0F53
#_0E9D6B: STA.w $0F54

#_0E9D6E: BRA Credits_LoadSprites_GenericUW

;===================================================================================================

Credits_LoadSprites_Smithy:
#_0E9D70: LDA.b #$79
#_0E9D72: STA.w $0F54

#_0E9D75: LDA.b #$39
#_0E9D77: STA.w $0F55

#_0E9D7A: LDA.b #$01
#_0E9D7C: STA.w $0DE1

#_0E9D7F: LDA.b #$04
#_0E9D81: STA.w $0D91

;===================================================================================================

Credits_LoadSprites_GenericUW:
#_0E9D84: REP #$20

#_0E9D86: LDA.w $048E
#_0E9D89: LSR A
#_0E9D8A: LSR A
#_0E9D8B: LSR A

#_0E9D8C: SEP #$20

#_0E9D8E: AND.b #$FE
#_0E9D90: STA.w $0FB1

#_0E9D93: LDA.w $048E
#_0E9D96: AND.b #$0F
#_0E9D98: ASL A
#_0E9D99: STA.w $0FB0

;---------------------------------------------------------------------------------------------------

#_0E9D9C: LDA.w Credits_SpriteData_position_x_pointers+0,X
#_0E9D9F: STA.b $04

#_0E9DA1: LDA.w Credits_SpriteData_position_x_pointers+1,X
#_0E9DA4: STA.b $05

#_0E9DA6: LDA.w Credits_SpriteData_position_y_pointers+0,X
#_0E9DA9: STA.b $06

#_0E9DAB: LDA.w Credits_SpriteData_position_y_pointers+1,X
#_0E9DAE: STA.b $07

#_0E9DB0: TXA
#_0E9DB1: LSR A
#_0E9DB2: TAX

#_0E9DB3: LDA.w Credits_SpriteData_sprite_count,X
#_0E9DB6: TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
#_0E9DB7: TXA
#_0E9DB8: ASL A
#_0E9DB9: TAY

#_0E9DBA: LDA.w $0FB1
#_0E9DBD: XBA
#_0E9DBE: LDA.b #$00

#_0E9DC0: REP #$20

#_0E9DC2: CLC
#_0E9DC3: ADC.b ($06),Y
#_0E9DC5: STA.b $02

#_0E9DC7: SEP #$20

#_0E9DC9: LDA.w $0FB0
#_0E9DCC: XBA
#_0E9DCD: LDA.b #$00

#_0E9DCF: REP #$20

#_0E9DD1: CLC
#_0E9DD2: ADC.b ($04),Y
#_0E9DD4: STA.b $00

#_0E9DD6: SEP #$20

#_0E9DD8: LDA.b $00
#_0E9DDA: STA.w $0D10,X

#_0E9DDD: LDA.b $01
#_0E9DDF: STA.w $0D30,X

#_0E9DE2: LDA.b $02
#_0E9DE4: STA.w $0D00,X

#_0E9DE7: LDA.b $03
#_0E9DE9: STA.w $0D20,X

#_0E9DEC: DEX
#_0E9DED: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0E9DEF: RTS

;===================================================================================================

CreditsOAMGroup_King:
#_0E9DF0: dw  -3,  17 : db $2B, $00, $00, $00
#_0E9DF8: dw  -3,  25 : db $3B, $00, $00, $00
#_0E9E00: dw   0,   0 : db $0E, $00, $00, $02
#_0E9E08: dw  16,   0 : db $0E, $40, $00, $02
#_0E9E10: dw   0,  16 : db $2E, $00, $00, $02
#_0E9E18: dw  16,  16 : db $2E, $40, $00, $02

;===================================================================================================

CreditsOAMGroup_Zelda:
#_0E9E20: dw   8,   5 : db $04, $0A, $00, $02
#_0E9E28: dw   0,  16 : db $06, $08, $00, $02
#_0E9E30: dw  16,  16 : db $06, $48, $00, $02

;===================================================================================================

CreditsOAMGroup_Maiden:
#_0E9E38: dw   0,   0 : db $00, $00, $00, $02
#_0E9E40: dw   0,  11 : db $02, $00, $00, $02

;===================================================================================================

CreditsOAMGroup_Guard:
#_0E9E48: dw   1,   4 : db $2A, $00, $00, $00
#_0E9E50: dw   1,  12 : db $3A, $00, $00, $00
#_0E9E58: dw   4,   0 : db $26, $00, $00, $02
#_0E9E60: dw   0,   9 : db $24, $00, $00, $02
#_0E9E68: dw   8,   9 : db $24, $40, $00, $02
#_0E9E70: dw   4,  20 : db $6C, $01, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Castle

.pointer_offset
#_0E9E78: db $1E ; King
#_0E9E79: db $20 ; Zelda
#_0E9E7A: db $22 ; Maiden 3
#_0E9E7B: db $22 ; Maiden 4
#_0E9E7C: db $22 ; Maiden 2
#_0E9E7D: db $22 ; Maiden 5
#_0E9E7E: db $22 ; Maiden 1
#_0E9E7F: db $22 ; Maiden 6
#_0E9E80: db $16 ; Guard 1
#_0E9E81: db $16 ; Guard 2
#_0E9E82: db $16 ; Guard 3
#_0E9E83: db $16 ; Guard 4

.group_size
#_0E9E84: db $06 ; King
#_0E9E85: db $03 ; Zelda
#_0E9E86: db $02 ; Maiden 3
#_0E9E87: db $02 ; Maiden 4
#_0E9E88: db $02 ; Maiden 2
#_0E9E89: db $02 ; Maiden 5
#_0E9E8A: db $02 ; Maiden 1
#_0E9E8B: db $02 ; Maiden 6
#_0E9E8C: db $06 ; Guard 1
#_0E9E8D: db $06 ; Guard 2
#_0E9E8E: db $06 ; Guard 3
#_0E9E8F: db $06 ; Guard 4

;---------------------------------------------------------------------------------------------------

.props
#_0E9E90: db $3B ; King
#_0E9E91: db $31 ; Zelda
#_0E9E92: db $3D ; Maiden 3
#_0E9E93: db $3F ; Maiden 4
#_0E9E94: db $39 ; Maiden 2
#_0E9E95: db $3B ; Maiden 5
#_0E9E96: db $37 ; Maiden 1
#_0E9E97: db $3D ; Maiden 6
#_0E9E98: db $39 ; Guard 1
#_0E9E99: db $37 ; Guard 2
#_0E9E9A: db $37 ; Guard 3
#_0E9E9B: db $39 ; Guard 4

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Castle:
#_0E9E9C: PHX

#_0E9E9D: LDX.b #$0B

.next_royalty
#_0E9E9F: LDA.w .props,X
#_0E9EA2: STA.w $0F50,X

#_0E9EA5: LDA.w .group_size,X
#_0E9EA8: LDY.w .pointer_offset,X
#_0E9EAB: JSR Credits_SpriteDraw_Single

#_0E9EAE: DEX
#_0E9EAF: CPX.b #$07
#_0E9EB1: BNE .next_royalty

;---------------------------------------------------------------------------------------------------

.next_maiden
#_0E9EB3: LDA.b $1A
#_0E9EB5: ASL A
#_0E9EB6: ASL A
#_0E9EB7: AND.b #$40
#_0E9EB9: ORA.w .props,X
#_0E9EBC: STA.w $0F50,X

#_0E9EBF: LDA.w .group_size,X
#_0E9EC2: LDY.w .pointer_offset,X
#_0E9EC5: JSR Credits_SpriteDraw_Single

#_0E9EC8: DEX
#_0E9EC9: CPX.b #$01
#_0E9ECB: BNE .next_maiden

;---------------------------------------------------------------------------------------------------

.next_guard
#_0E9ECD: LDA.w .props,X
#_0E9ED0: STA.w $0F50,X

#_0E9ED3: LDA.w .group_size,X
#_0E9ED6: LDY.w .pointer_offset,X
#_0E9ED9: JSR Credits_SpriteDraw_Single

#_0E9EDC: DEX
#_0E9EDD: BPL .next_guard

;---------------------------------------------------------------------------------------------------

#_0E9EDF: PLX

#_0E9EE0: RTS

;===================================================================================================

CreditsOAMGroup_Bully:
#_0E9EE1: dw   0, -10 : db $4C, $08, $00, $02
#_0E9EE9: dw   0,   0 : db $6C, $0A, $00, $02
#_0E9EF1: dw   0,  -9 : db $4C, $08, $00, $02
#_0E9EF9: dw   0,   0 : db $A8, $0A, $00, $02

;===================================================================================================

CreditsOAMGroup_Victim:
#_0E9F01: dw   0,  -7 : db $4A, $08, $00, $02
#_0E9F09: dw   0,   0 : db $6A, $0C, $00, $02
#_0E9F11: dw   0,  -7 : db $4A, $08, $00, $02
#_0E9F19: dw   0,   0 : db $A6, $0C, $00, $02

;===================================================================================================

CreditsOAMGroup_HeraPortal:
#_0E9F21: dw   0,   0 : db $86, $00, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Hera

.group_data_index
#_0E9F29: db $30 ; bully
#_0E9F2A: db $32 ; victim

.object_count
#_0E9F2B: db $02 ; bully
#_0E9F2C: db $02 ; victim

;---------------------------------------------------------------------------------------------------

.movement_control
#_0E9F2D: db $20, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.speed_x
#_0E9F31: db   0, -12

.speed_y
#_0E9F33: db -16, -12,   0,  12
#_0E9F37: db  16,  12,   0, -12

;---------------------------------------------------------------------------------------------------

.timer
#_0E9F3B: db  59,  20,  30,  29
#_0E9F3F: db  44,  43,  66,  32
#_0E9F43: db  39,  40

#_0E9F45: db  46,  56,  58,  76,  50,  68 ; This seems to be the only part of the data that's used.

#_0E9F4B: db  46,  47,  30,  40,  71,  53,  50,  48

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Hera:
#_0E9F53: PHX

#_0E9F54: LDX.b #$02

#_0E9F56: LDA.b #$35
#_0E9F58: STA.w $0F50,X

#_0E9F5B: LDA.b #$01
#_0E9F5D: LDY.b #$3C
#_0E9F5F: JSR Credits_SpriteDraw_Single

#_0E9F62: DEX

;---------------------------------------------------------------------------------------------------

.next_friend
#_0E9F63: LDA.w $0D50,X
#_0E9F66: DEC A
#_0E9F67: LSR A

#_0E9F68: AND.b #$40
#_0E9F6A: EOR.b #$71
#_0E9F6C: STA.w $0F50,X

#_0E9F6F: LDA.b $1A
#_0E9F71: LSR A
#_0E9F72: LSR A
#_0E9F73: LSR A
#_0E9F74: AND.b #$01
#_0E9F76: STA.w $0DC0,X

#_0E9F79: TXA
#_0E9F7A: ASL A
#_0E9F7B: TAY

;---------------------------------------------------------------------------------------------------

#_0E9F7C: REP #$20

#_0E9F7E: LDA.b $C8
#_0E9F80: CMP.w .movement_control,Y

#_0E9F83: SEP #$20
#_0E9F85: BCC .dont_turn

#_0E9F87: LDA.w $0DF0,X
#_0E9F8A: BNE .dont_turn

#_0E9F8C: LDY.w $0D90,X

#_0E9F8F: LDA.w .timer,Y
#_0E9F92: PHA

#_0E9F93: AND.b #$F8
#_0E9F95: STA.w $0DF0,X

#_0E9F98: PLA
#_0E9F99: AND.b #$07
#_0E9F9B: TAY

#_0E9F9C: LDA.w .speed_y,Y
#_0E9F9F: STA.w $0D40,X

#_0E9FA2: LDA.w .speed_x,Y
#_0E9FA5: STA.w $0D50,X

#_0E9FA8: INC.w $0D90,X

.dont_turn
#_0E9FAB: LDA.w .object_count,X
#_0E9FAE: LDY.w .group_data_index,X
#_0E9FB1: JSR Credits_SpriteDraw_Single
#_0E9FB4: JSR Credits_SpriteDraw_DrawShadow_priority_set

#_0E9FB7: JSL Sprite_Move_XY_Bank1D_long

#_0E9FBB: DEX
#_0E9FBC: BPL .next_friend

;---------------------------------------------------------------------------------------------------

#_0E9FBE: PLX

#_0E9FBF: RTS

;===================================================================================================

CreditsOAMGroup_Sahasrahla:
#_0E9FC0: dw  -4,   1 : db $68, $0C, $00, $00
#_0E9FC8: dw   0,  -8 : db $40, $0C, $00, $02
#_0E9FD0: dw   0,   1 : db $42, $0C, $00, $02
#_0E9FD8: dw  -4,   1 : db $78, $0C, $00, $00
#_0E9FE0: dw   0,  -8 : db $40, $0C, $00, $02
#_0E9FE8: dw   0,   1 : db $42, $0C, $00, $02

;===================================================================================================

CreditsOAMGroup_MrsSahasrahla:
#_0E9FF0: dw   8,   5 : db $79, $06, $00, $00
#_0E9FF8: dw   0, -10 : db $8E, $08, $00, $02
#_0EA000: dw   0,   0 : db $6E, $06, $00, $02
#_0EA008: dw   0, -10 : db $8E, $08, $00, $02
#_0EA010: dw   0, -10 : db $8E, $08, $00, $02
#_0EA018: dw   0,   0 : db $6E, $06, $00, $02

;===================================================================================================

CreditsOAMGroup_LittleKakBoy:
#_0EA020: dw   0,   0 : db $82, $08, $00, $02
#_0EA028: dw   0,   7 : db $4E, $0A, $00, $02
#_0EA030: dw   0,   0 : db $80, $48, $00, $02
#_0EA038: dw   0,   7 : db $4E, $0A, $00, $02
#_0EA040: dw   0,   0 : db $82, $08, $00, $02
#_0EA048: dw   0,   7 : db $4E, $0A, $00, $02
#_0EA050: dw   0,   0 : db $80, $08, $00, $02
#_0EA058: dw   0,   7 : db $4E, $0A, $00, $02

;===================================================================================================

CreditsOAMGroup_FightingBros:
#_0EA060: dw  11,  -3 : db $69, $08, $00, $00
#_0EA068: dw   0, -12 : db $04, $08, $00, $02
#_0EA070: dw   0,   0 : db $60, $08, $00, $02
#_0EA078: dw  10,  -3 : db $67, $08, $00, $00
#_0EA080: dw   0, -12 : db $04, $08, $00, $02
#_0EA088: dw   0,   0 : db $60, $08, $00, $02

;===================================================================================================

CreditsOAMGroup_YoungSnitch:
#_0EA090: dw  -2,   1 : db $68, $08, $00, $00
#_0EA098: dw   0,  -8 : db $C0, $08, $00, $02
#_0EA0A0: dw   0,   0 : db $C2, $08, $00, $02
#_0EA0A8: dw  -3,   1 : db $78, $08, $00, $00
#_0EA0B0: dw   0,  -8 : db $C0, $08, $00, $02
#_0EA0B8: dw   0,   0 : db $C2, $08, $00, $02

;===================================================================================================

CreditsOAMGroup_SwagDuck:
#_0EA0C0: dw   0,   0 : db $0E, $00, $00, $02
#_0EA0C8: dw   0,  64 : db $6C, $00, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Kakariko1

.kid_head_shake_timer
#_0EA0D0: db  48,  16

;---------------------------------------------------------------------------------------------------

.group_pointer_index
#_0EA0D2: db $28 ; Sahasrahla
#_0EA0D3: db $2A ; Mrs. Sahasrahla
#_0EA0D4: db $2C ; Angry Bro left
#_0EA0D5: db $2E ; Young Snitch
#_0EA0D6: db $2C ; Angry Bro right

.object_count
#_0EA0D7: db $03 ; Sahasrahla
#_0EA0D8: db $03 ; Mrs. Sahasrahla
#_0EA0D9: db $03 ; Angry Bro left
#_0EA0DA: db $03 ; Young Snitch
#_0EA0DB: db $03 ; Angry Bro right
#_0EA0DC: db $02 ; unused
#_0EA0DD: db $02 ; unused

;---------------------------------------------------------------------------------------------------

.duck_flap
#_0EA0DE: db $20, $40

.duck_flip
#_0EA0E0: db $10, $F0

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Kakariko1:
#_0EA0E2: PHX

#_0EA0E3: LDX.b #$06

#_0EA0E5: LDA.l $00001A
#_0EA0E9: LSR A
#_0EA0EA: LSR A
#_0EA0EB: AND.b #$01
#_0EA0ED: TAY

#_0EA0EE: LDA.w .duck_flap,Y
#_0EA0F1: STA.w $0AF4

;---------------------------------------------------------------------------------------------------

#_0EA0F4: LDA.w $0D50,X
#_0EA0F7: ROL A
#_0EA0F8: ROL A
#_0EA0F9: AND.b #$01
#_0EA0FB: TAY

#_0EA0FC: LDA.w $0D50,X
#_0EA0FF: CLC
#_0EA100: ADC.w .duck_flip,Y

#_0EA103: LSR A
#_0EA104: AND.b #$40
#_0EA106: ORA.b #$32
#_0EA108: STA.w $0F50,X

#_0EA10B: LDA.b #$02
#_0EA10D: LDY.b #$24
#_0EA10F: JSR Credits_SpriteDraw_Single
#_0EA112: JSR Credits_SpriteDraw_CirclingBirds

#_0EA115: DEX

;---------------------------------------------------------------------------------------------------

#_0EA116: LDA.b #$31
#_0EA118: STA.w $0F50,X

#_0EA11B: LDA.w $0DF0,X
#_0EA11E: BNE .delay_head_shake

#_0EA120: LDA.w $0D90,X
#_0EA123: TAY
#_0EA124: EOR.b #$01
#_0EA126: STA.w $0D90,X

#_0EA129: LDA.w .kid_head_shake_timer,Y
#_0EA12C: STA.w $0DF0,X

#_0EA12F: LDA.w $0DC0,X
#_0EA132: INC A
#_0EA133: AND.b #$03
#_0EA135: STA.w $0DC0,X

.delay_head_shake
#_0EA138: LDY.b #$26
#_0EA13A: LDA.b #$02
#_0EA13C: JSR Credits_SpriteDraw_Single

#_0EA13F: DEX

;---------------------------------------------------------------------------------------------------

.next_waving_sprite
#_0EA140: LDA.b $1A
#_0EA142: AND.b #$0F
#_0EA144: BNE .dont_flip_wave

#_0EA146: LDA.w $0DC0,X
#_0EA149: EOR.b #$01
#_0EA14B: STA.w $0DC0,X

.dont_flip_wave
#_0EA14E: LDA.b #$31
#_0EA150: STA.w $0F50,X

#_0EA153: LDY.w .group_pointer_index,X
#_0EA156: LDA.w .object_count,X
#_0EA159: JSR Credits_SpriteDraw_Single
#_0EA15C: JSR Credits_SpriteDraw_DrawShadow_priority_set

#_0EA15F: DEX
#_0EA160: BPL .next_waving_sprite

;---------------------------------------------------------------------------------------------------

#_0EA162: PLX

#_0EA163: RTS

;===================================================================================================

CreditsOAMGroup_Uncle:
#_0EA164: dw  10,   8 : db $32, $8A, $00, $00
#_0EA16C: dw  10,  16 : db $22, $8A, $00, $00
#_0EA174: dw   0, -10 : db $00, $08, $00, $02
#_0EA17C: dw   0,   0 : db $2C, $08, $00, $02
#_0EA184: dw  10, -14 : db $22, $0A, $00, $00
#_0EA18C: dw  10,  -6 : db $32, $0A, $00, $00

;===================================================================================================

CreditsOAMGroup_LinkBrandishing:
#_0EA194: dw   0, -10 : db $2A, $08, $00, $02
#_0EA19C: dw   0,   0 : db $28, $08, $00, $02

;===================================================================================================

CreditsOAMGroup_LinkAtHouse:
#_0EA1A4: dw  10,  16 : db $05, $8A, $00, $00
#_0EA1AC: dw  10,   8 : db $15, $8A, $00, $00
#_0EA1B4: dw  -4,   2 : db $07, $0A, $00, $02
#_0EA1BC: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA1C4: dw   0,   1 : db $02, $0E, $00, $02
#_0EA1CC: dw  10, -20 : db $05, $0A, $00, $00
#_0EA1D4: dw  10, -12 : db $15, $0A, $00, $00
#_0EA1DC: dw  -7,   1 : db $07, $4A, $00, $02
#_0EA1E4: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA1EC: dw   0,   1 : db $02, $0E, $00, $02

;===================================================================================================

CreditsOAMGroup_PedestalLink:
#_0EA1F4: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA1FC: dw   0,   1 : db $02, $4E, $00, $02
#_0EA204: dw   0,  -8 : db $00, $0E, $00, $02
#_0EA20C: dw   0,   1 : db $02, $0E, $00, $02
#_0EA214: dw   0,  -9 : db $00, $0E, $00, $02
#_0EA21C: dw   0,   1 : db $02, $0E, $00, $02
#_0EA224: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA22C: dw   0,   1 : db $02, $0E, $00, $02
#_0EA234: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA23C: dw   0,   1 : db $02, $4E, $00, $02
#_0EA244: dw   0,  -8 : db $00, $0E, $00, $02
#_0EA24C: dw   0,   1 : db $02, $4E, $00, $02
#_0EA254: dw   0,  -9 : db $00, $0E, $00, $02
#_0EA25C: dw   0,   1 : db $02, $4E, $00, $02
#_0EA264: dw   0,  -7 : db $00, $0E, $00, $02
#_0EA26C: dw   0,   1 : db $02, $4E, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_House

.link_gfx
#_0EA274: db $00 ; Link standing
#_0EA275: db $04 ; Link brandishing

.link_pose
#_0EA276: dw $000A ; Link standing
#_0EA278: dw $0224 ; Link brandishing

.group_data_index
#_0EA27A: db $0A ; Link standing
#_0EA27B: db $0E ; Link brandishing

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_House:
#_0EA27C: PHX

#_0EA27D: REP #$20

#_0EA27F: LDA.b $C8
#_0EA281: CMP.w #$0200
#_0EA284: BNE .not_slash_sfx

#_0EA286: LDY.b #$01 ; SFX2.01
#_0EA288: BRA .set_sfx

.not_slash_sfx
#_0EA28A: CMP.w #$0208
#_0EA28D: BNE .no_sfx_at_all

#_0EA28F: LDY.b #$2C ; SFX2.2C

.set_sfx
#_0EA291: STY.w $012E

;---------------------------------------------------------------------------------------------------

.no_sfx_at_all
#_0EA294: SEC
#_0EA295: SBC.w #$0208
#_0EA298: CMP.w #$0030

#_0EA29B: SEP #$20
#_0EA29D: BCS .delay_sparkle

#_0EA29F: LDY.b #$02
#_0EA2A1: JSR Credits_SpriteDraw_AddSparkle

.delay_sparkle
#_0EA2A4: LDX.b #$03

#_0EA2A6: REP #$20

#_0EA2A8: LDA.b $C8
#_0EA2AA: CMP.w #$0200

#_0EA2AD: SEP #$20
#_0EA2AF: BCC .delay_brandish

#_0EA2B1: LDA.b #$01
#_0EA2B3: STA.w $0DC0,X

.delay_brandish
#_0EA2B6: LDA.b #$31
#_0EA2B8: STA.w $0F50,X

#_0EA2BB: LDA.b #$04
#_0EA2BD: LDY.b #$08
#_0EA2BF: JSR Credits_SpriteDraw_Single
#_0EA2C2: JSR Credits_SpriteDraw_DrawShadow_priority_set

;---------------------------------------------------------------------------------------------------

#_0EA2C5: LDA.w $0DC0,X
#_0EA2C8: DEX
#_0EA2C9: STA.w $0DC0,X

#_0EA2CC: TAY

#_0EA2CD: STZ.w $0107

#_0EA2D0: LDA.w .link_gfx,Y
#_0EA2D3: STA.w $0108

#_0EA2D6: LDA.b #$30
#_0EA2D8: STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

#_0EA2DB: PHY

#_0EA2DC: TYA
#_0EA2DD: ASL A
#_0EA2DE: TAY

#_0EA2DF: REP #$20

#_0EA2E1: LDA.w .link_pose,Y
#_0EA2E4: STA.w $0100

#_0EA2E7: SEP #$20

#_0EA2E9: PLY

#_0EA2EA: LDA.w .group_data_index,Y
#_0EA2ED: TAY

#_0EA2EE: LDA.b #$05
#_0EA2F0: JSR Credits_SpriteDraw_Single
#_0EA2F3: JSR Credits_SpriteDraw_DrawShadow_priority_set

#_0EA2F6: PLX

#_0EA2F7: RTS

;===================================================================================================

CreditsOAMGroup_OldMan:
#_0EA2F8: dw -18, -24 : db $A4, $39, $00, $02
#_0EA300: dw -16, -16 : db $A8, $39, $00, $02
#_0EA308: dw -18, -24 : db $A4, $39, $00, $02
#_0EA310: dw -18, -24 : db $A4, $39, $00, $02
#_0EA318: dw -16, -16 : db $A6, $39, $00, $02
#_0EA320: dw -18, -24 : db $A4, $39, $00, $02
#_0EA328: dw  -6, -17 : db $2D, $39, $00, $00
#_0EA330: dw -16, -24 : db $A0, $39, $00, $02
#_0EA338: dw -16, -16 : db $AA, $39, $00, $02
#_0EA340: dw  -5, -17 : db $2C, $39, $00, $00
#_0EA348: dw -16, -24 : db $A0, $39, $00, $02
#_0EA350: dw -16, -16 : db $AA, $39, $00, $02

;===================================================================================================

Credits_SpriteDraw_DeathMountain:
#_0EA358: PHX

#_0EA359: LDX.b #$00

#_0EA35B: REP #$20

#_0EA35D: LDA.b $C8
#_0EA35F: CMP.w #$0200

#_0EA362: SEP #$20
#_0EA364: BNE .dont_move_yet

#_0EA366: LDA.b #$FC
#_0EA368: STA.w $0D50,X

.dont_move_yet
#_0EA36B: LDA.b $1A
#_0EA36D: AND.b #$10
#_0EA36F: LSR A
#_0EA370: LSR A
#_0EA371: LSR A
#_0EA372: LSR A
#_0EA373: STA.w $0DC0,X

#_0EA376: LDA.w $0D10,X
#_0EA379: CMP.b #$38
#_0EA37B: BNE .not_at_max

#_0EA37D: STZ.w $0D50,X

#_0EA380: INC.w $0DC0,X
#_0EA383: INC.w $0DC0,X

.not_at_max
#_0EA386: LDA.b #$03
#_0EA388: LDY.b #$34
#_0EA38A: JSR Credits_SpriteDraw_Single

#_0EA38D: JSL Sprite_Move_XY_Bank1D_long

#_0EA391: PLX
#_0EA392: RTS

;===================================================================================================

Credits_SpriteDraw_Lumberjacks:
#_0EA393: PHX

#_0EA394: LDX.b #$00

#_0EA396: LDA.b #$2C ; SPRITE 2C
#_0EA398: STA.w $0E20,X

#_0EA39B: LDA.b #$2C
#_0EA39D: JSL SpriteDraw_AllocateOAMFromRegionA

#_0EA3A1: LDA.b #$3B
#_0EA3A3: STA.w $0F50,X

#_0EA3A6: JSL Sprite_Get16BitCoords_long

#_0EA3AA: LDA.b #$02

;---------------------------------------------------------------------------------------------------

#_0EA3AC: REP #$10

#_0EA3AE: LDY.b $C8
#_0EA3B0: CPY.w #$01C0

#_0EA3B3: SEP #$10
#_0EA3B5: BCS .not_facing_camera

#_0EA3B7: TYA
#_0EA3B8: AND.b #$20
#_0EA3BA: ASL A
#_0EA3BB: ASL A
#_0EA3BC: ASL A
#_0EA3BD: ROL A

.not_facing_camera
#_0EA3BE: STA.w $0DC0,X

#_0EA3C1: JSL SpriteModule_Active_long

#_0EA3C5: PLX

#_0EA3C6: RTS

;===================================================================================================

Credits_SpriteDraw_Venus:
#_0EA3C7: PHX

#_0EA3C8: LDX.b #$05
#_0EA3CA: JSL Sprite_Get16BitCoords_long

#_0EA3CE: LDA.w $0F00,X
#_0EA3D1: BNE .skip_sparkles

;---------------------------------------------------------------------------------------------------

#_0EA3D3: JSL GetRandomNumber
#_0EA3D7: AND.b #$07
#_0EA3D9: TAX

#_0EA3DA: LDA.l FairyPond_offset_x,X
#_0EA3DE: CLC
#_0EA3DF: ADC.w $0FD8
#_0EA3E2: PHA

#_0EA3E3: JSL GetRandomNumber
#_0EA3E7: AND.b #$07
#_0EA3E9: TAX

#_0EA3EA: LDA.l FairyPond_offset_y,X
#_0EA3EE: CLC
#_0EA3EF: ADC.w $0FDA

#_0EA3F2: PLX

#_0EA3F3: LDY.b #$03
#_0EA3F5: JSR Credits_SpriteDraw_AddSparkle

;---------------------------------------------------------------------------------------------------

.skip_sparkles
#_0EA3F8: LDX.b #$03

.next_fairy
#_0EA3FA: LDA.w $0E00,X
#_0EA3FD: BEQ .fairy_delay

#_0EA3FF: DEC.w $0E00,X

.fairy_delay
#_0EA402: LDA.b #$E3 ; SPRITE E3
#_0EA404: STA.w $0E20,X

#_0EA407: LDA.b #$01
#_0EA409: JSR Credits_SpriteDraw_SetShadowProp
#_0EA40C: JSR Credits_SpriteDraw_ActivateAndRunSprite_allocate8

#_0EA40F: INX
#_0EA410: CPX.b #$05
#_0EA412: BNE .next_fairy

;---------------------------------------------------------------------------------------------------

#_0EA414: LDA.b #$72 ; SPRITE 72
#_0EA416: STA.w $0E20,X

#_0EA419: LDA.b #$3B
#_0EA41B: STA.w $0F50,X

#_0EA41E: LDA.b #$09
#_0EA420: STA.w $0DD0,X
#_0EA423: STA.w $0DA0,X

#_0EA426: LDA.b #$30
#_0EA428: JSR Credits_SpriteDraw_PreexistingSpriteDraw

#_0EA42B: PLX

#_0EA42C: RTS

;===================================================================================================

CreditsOAMGroup_RunningKid:
#_0EA42D: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA435: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA43D: dw   0,   0 : db $CA, $4F, $00, $02
#_0EA445: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA44D: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA455: dw   0,   0 : db $CA, $0F, $00, $02
#_0EA45D: dw  -2,   0 : db $77, $0F, $00, $00
#_0EA465: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA46D: dw   0,   0 : db $CA, $4F, $00, $02
#_0EA475: dw  -3,   0 : db $66, $0F, $00, $00
#_0EA47D: dw   0,  -8 : db $2A, $07, $00, $02
#_0EA485: dw   0,   0 : db $CA, $4F, $00, $02

;===================================================================================================

CreditsOAMGroup_SickKid:
#_0EA48D: dw  14,  -7 : db $48, $0D, $00, $02
#_0EA495: dw   0,  -6 : db $44, $09, $00, $02
#_0EA49D: dw   0,   0 : db $4E, $09, $00, $02
#_0EA4A5: dw  13, -14 : db $48, $0D, $00, $02
#_0EA4AD: dw   0,  -8 : db $44, $09, $00, $02
#_0EA4B5: dw   0,   0 : db $46, $09, $00, $02

;===================================================================================================

CreditsOAMGroup_SickParents:
#_0EA4BD: dw  -2, -16 : db $78, $3D, $00, $00
#_0EA4C5: dw   0, -24 : db $24, $3D, $00, $02
#_0EA4CD: dw   0, -16 : db $C2, $3D, $00, $02
#_0EA4D5: dw  61, -16 : db $77, $37, $00, $00
#_0EA4DD: dw  64, -24 : db $C4, $37, $00, $02
#_0EA4E5: dw  64, -16 : db $CA, $77, $00, $02
#_0EA4ED: dw   0,  -6 : db $6C, $32, $00, $02
#_0EA4F5: dw  64,  -6 : db $6C, $32, $00, $02
#_0EA4FD: dw  -2, -16 : db $68, $3D, $00, $00
#_0EA505: dw   0, -24 : db $24, $3D, $00, $02
#_0EA50D: dw   0, -16 : db $C2, $3D, $00, $02
#_0EA515: dw  61, -16 : db $66, $37, $00, $00
#_0EA51D: dw  64, -24 : db $C4, $37, $00, $02
#_0EA525: dw  64, -16 : db $CA, $77, $00, $02
#_0EA52D: dw   0,  -6 : db $6C, $32, $00, $02
#_0EA535: dw  64,  -6 : db $6C, $32, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Kakariko2

.object_count
#_0EA53D: db $03
#_0EA53E: db $03
#_0EA53F: db $08

.sick_kid_height
#_0EA540: db $02, $04, $05, $06, $06, $07, $07, $07
#_0EA548: db $07, $06, $06, $05, $04, $02, $00

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Kakariko2:
#_0EA54F: PHX

#_0EA550: LDX.b #$06

#_0EA552: LDA.b $1A
#_0EA554: AND.b #$01
#_0EA556: STA.w $0DC0,X
#_0EA559: BNE .dont_move_bee

#_0EA55B: LDA.b #$01

#_0EA55D: LDY.w $0D10,X
#_0EA560: CPY.b #$80
#_0EA562: BMI .move_right

#_0EA564: LDA.b #$FF

.move_right
#_0EA566: CLC
#_0EA567: ADC.w $0D50,X
#_0EA56A: STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

#_0EA56D: LDA.b #$01

#_0EA56F: LDY.w $0D00,X
#_0EA572: CPY.b #$B0
#_0EA574: BMI .move_down

#_0EA576: LDA.b #$FF

.move_down
#_0EA578: CLC
#_0EA579: ADC.w $0D40,X
#_0EA57C: STA.w $0D40,X

#_0EA57F: JSL Sprite_Move_XY_Bank1D_long

;---------------------------------------------------------------------------------------------------

.dont_move_bee
#_0EA583: LDA.w $0D50,X
#_0EA586: LSR A
#_0EA587: AND.b #$40
#_0EA589: EOR.b #$7E
#_0EA58B: STA.w $0F50,X

#_0EA58E: LDA.b #$01
#_0EA590: STA.w $0E40,X

#_0EA593: LDA.b #$30
#_0EA595: STA.w $0E60,X

#_0EA598: LDA.b #$10
#_0EA59A: STA.w $0F70,X

#_0EA59D: JSR Credits_SpriteDraw_PreexistingSpriteDraw_eight

#_0EA5A0: DEX

#_0EA5A1: LDA.b #$37
#_0EA5A3: STA.w $0F50,X

#_0EA5A6: LDA.b #$02
#_0EA5A8: JSR Credits_SpriteDraw_SetShadowProp

;---------------------------------------------------------------------------------------------------

#_0EA5AB: LDA.b #$0C
#_0EA5AD: JSR Credits_SpriteDraw_ActivateAndRunSprite

#_0EA5B0: DEX

#_0EA5B1: JSR Credits_SpriteDraw_ActivateAndRunSprite_allocate8

#_0EA5B4: DEX

#_0EA5B5: JSR Credits_SpriteDraw_ActivateAndRunSprite_allocate8

#_0EA5B8: DEX

;---------------------------------------------------------------------------------------------------

.next
#_0EA5B9: TXA
#_0EA5BA: ASL A
#_0EA5BB: TAY

#_0EA5BC: LDA.w .object_count,X
#_0EA5BF: JSR Credits_SpriteDraw_Single

#_0EA5C2: TXA
#_0EA5C3: BNE .not_running_kid_wave

#_0EA5C5: JSR Credits_SpriteDraw_AnimateRunningKidAndLocksmith

#_0EA5C8: BRA .to_next

;---------------------------------------------------------------------------------------------------

.not_running_kid_wave
#_0EA5CA: LSR A
#_0EA5CB: BEQ .skip_parents_waving

#_0EA5CD: LDA.b $1A
#_0EA5CF: LSR A
#_0EA5D0: LSR A
#_0EA5D1: LSR A
#_0EA5D2: AND.b #$01
#_0EA5D4: STA.w $0DC0,X

#_0EA5D7: BRA .to_next

;---------------------------------------------------------------------------------------------------

.skip_parents_waving
#_0EA5D9: LDY.b #$00

#_0EA5DB: LDA.b $1A
#_0EA5DD: AND.b #$1F
#_0EA5DF: CMP.b #$0F
#_0EA5E1: BCS .dont_adjust_jump

#_0EA5E3: TAY

#_0EA5E4: LDA.w .sick_kid_height,Y
#_0EA5E7: STA.w $0F70,X

#_0EA5EA: LDY.b #$01

.dont_adjust_jump
#_0EA5EC: TYA
#_0EA5ED: STA.w $0DC0,X

#_0EA5F0: JSR Credits_SpriteDraw_DrawShadow_high_prioritize

;---------------------------------------------------------------------------------------------------

.to_next
#_0EA5F3: DEX
#_0EA5F4: BPL .next

;---------------------------------------------------------------------------------------------------

#_0EA5F6: PLX

#_0EA5F7: RTS

;===================================================================================================

Credits_SpriteDraw_DrawShadow:
.high_prioritize
#_0EA5F8: LDA.b #$30

;===================================================================================================

.parameterized_priority
#_0EA5FA: STA.w $0F50,X

;===================================================================================================

.priority_set
#_0EA5FD: LDA.b #$00
#_0EA5FF: JSR Credits_SpriteDraw_SetShadowProp

#_0EA602: LDA.b #$04
#_0EA604: JSL SpriteDraw_AllocateOAMFromRegionA
#_0EA608: JSL SpriteDraw_Shadow_long

#_0EA60C: RTS

;===================================================================================================

pool Credits_SpriteDraw_AnimateLostWoodsThief

.timer
#_0EA60D: db $0A, $0A, $0A, $0A, $14, $08, $08, $00
#_0EA615: db $FF, $0C, $0C, $0C, $0C, $0C, $0C, $1E
#_0EA61D: db $08, $04, $04, $04, $00, $00, $FF, $FF
#_0EA625: db $90, $04, $00

.pose
#_0EA628: db $00, $01, $00, $01, $00, $02, $03, $00
#_0EA630: db $02, $00, $01, $00, $01, $00, $01, $02
#_0EA638: db $03, $04, $05, $06, $03, $00, $FF, $FF
#_0EA640: db $FF, $02, $03

pool off

;===================================================================================================

Credits_SpriteDraw_AnimateRunningKidAndLocksmith:
#_0EA643: LDA.b #$30

;===================================================================================================

Credits_SpriteDraw_AnimateLostWoodsThief:
#_0EA645: JSR Credits_SpriteDraw_DrawShadow_parameterized_priority

#_0EA648: LDY.w $0D90,X

#_0EA64B: LDA.w $0DF0,X
#_0EA64E: BNE .delay

#_0EA650: INY
#_0EA651: CPY.b #$08
#_0EA653: BNE .dont_step_back_to_06

#_0EA655: LDY.b #$06

.dont_step_back_to_06
#_0EA657: CPY.b #$16
#_0EA659: BNE .dont_step_back_to_15

#_0EA65B: LDY.b #$15

.dont_step_back_to_15
#_0EA65D: CPY.b #$1C
#_0EA65F: BNE .dont_step_back_to_1B

#_0EA661: LDY.b #$1B

.dont_step_back_to_1B
#_0EA663: TYA
#_0EA664: STA.w $0D90,X

#_0EA667: LDA.w .timer-1,Y
#_0EA66A: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.delay
#_0EA66D: LDA.w .pose-1,Y
#_0EA670: BPL .not_frame_based

#_0EA672: LDA.b $1A
#_0EA674: AND.b #$08
#_0EA676: LSR A
#_0EA677: LSR A
#_0EA678: LSR A

.not_frame_based
#_0EA679: STA.w $0DC0,X

#_0EA67C: CPY.b #$05
#_0EA67E: BCC .frame_rule_y_coord

#_0EA680: CPY.b #$0A
#_0EA682: BCC .exit

#_0EA684: CPY.b #$0F
#_0EA686: BCS .exit

.frame_rule_y_coord
#_0EA688: LDA.b $1A
#_0EA68A: AND.b #$01
#_0EA68C: BNE .exit

#_0EA68E: INC.w $0D00,X

.exit
#_0EA691: RTS

;===================================================================================================

Credits_SpriteDraw_ActivateAndRunSprite_allocate8:
#_0EA692: LDA.b #$08

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_ActivateAndRunSprite:
#_0EA694: STX.w $0FA0

#_0EA697: JSL SpriteDraw_AllocateOAMFromRegionA
#_0EA69B: JSL Sprite_Get16BitCoords_long

#_0EA69F: LDA.b $11
#_0EA6A1: PHA

#_0EA6A2: STZ.b $11

#_0EA6A4: LDA.b #$09
#_0EA6A6: STA.w $0DD0,X

#_0EA6A9: JSL SpriteModule_Active_long

#_0EA6AD: PLA
#_0EA6AE: STA.b $11

#_0EA6B0: RTS

;===================================================================================================

Credits_SpriteDraw_PreexistingSpriteDraw_eight:
#_0EA6B1: LDA.b #$08

;===================================================================================================

Credits_SpriteDraw_PreexistingSpriteDraw:
#_0EA6B3: JSL SpriteDraw_AllocateOAMFromRegionA

#_0EA6B7: STX.w $0FA0

#_0EA6BA: JSL Sprite_Get16BitCoords_long
#_0EA6BE: JSL SpriteModule_Active_long

#_0EA6C2: RTS

;===================================================================================================

pool Credits_SpriteDraw_Single

.group_pointers
#_0EA6C3: dw CreditsOAMGroup_RunningKid
#_0EA6C5: dw CreditsOAMGroup_SickKid
#_0EA6C7: dw CreditsOAMGroup_SickParents
#_0EA6C9: dw CreditsOAMGroup_SmithyBowing
#_0EA6CB: dw CreditsOAMGroup_Uncle
#_0EA6CD: dw CreditsOAMGroup_LinkAtHouse
#_0EA6CF: dw CreditsOAMGroup_Priest
#_0EA6D1: dw CreditsOAMGroup_LinkBrandishing
#_0EA6D3: dw CreditsOAMGroup_Quaver
#_0EA6D5: dw CreditsOAMGroup_FluteDad
#_0EA6D7: dw CreditsOAMGroup_PedestalSquirrel
#_0EA6D9: dw CreditsOAMGroup_Guard
#_0EA6DB: dw CreditsOAMGroup_WoodsThief
#_0EA6DD: dw CreditsOAMGroup_PedestalLink
#_0EA6DF: dw CreditsOAMGroup_SwordSparkle-8
#_0EA6E1: dw CreditsOAMGroup_King
#_0EA6E3: dw CreditsOAMGroup_Zelda
#_0EA6E5: dw CreditsOAMGroup_Maiden
#_0EA6E7: dw CreditsOAMGroup_SwagDuck
#_0EA6E9: dw CreditsOAMGroup_LittleKakBoy
#_0EA6EB: dw CreditsOAMGroup_Sahasrahla
#_0EA6ED: dw CreditsOAMGroup_MrsSahasrahla
#_0EA6EF: dw CreditsOAMGroup_FightingBros
#_0EA6F1: dw CreditsOAMGroup_YoungSnitch
#_0EA6F3: dw CreditsOAMGroup_Bully
#_0EA6F5: dw CreditsOAMGroup_Victim
#_0EA6F7: dw CreditsOAMGroup_OldMan
#_0EA6F9: dw CreditsOAMGroup_SmithSpark
#_0EA6FB: dw CreditsOAMGroup_DesertThief
#_0EA6FD: dw CreditsOAMGroup_DesertChests
#_0EA6FF: dw CreditsOAMGroup_HeraPortal
#_0EA701: dw CreditsOAMGroup_SmithHammer

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Single:
#_0EA703: PHA
#_0EA704: PHY
#_0EA705: PHA

#_0EA706: ASL A
#_0EA707: ASL A

#_0EA708: JSL SpriteDraw_AllocateOAMFromRegionA
#_0EA70C: JSL Sprite_Get16BitCoords_long

#_0EA710: PLA
#_0EA711: STA.w WRMPYA

#_0EA714: LDA.b #$08
#_0EA716: STA.w WRMPYB

#_0EA719: NOP
#_0EA71A: NOP
#_0EA71B: NOP
#_0EA71C: NOP

#_0EA71D: LDA.w RDMPY
#_0EA720: STA.w WRMPYA

#_0EA723: LDA.w $0DC0,X
#_0EA726: STA.w WRMPYB

#_0EA729: REP #$20

#_0EA72B: PLY
#_0EA72C: LDA.w .group_pointers,Y

#_0EA72F: CLC
#_0EA730: ADC.w RDMPY
#_0EA733: STA.b $08

#_0EA735: SEP #$20

#_0EA737: PLA
#_0EA738: JSL SpriteDraw_Tabulated

#_0EA73C: RTS

;===================================================================================================

pool Credits_SpriteDraw_Zora

.sprite_id
#_0EA73D: db $52 ; King Zora - SPRITE 52
#_0EA73E: db $55 ; Left zora - SPRITE 55
#_0EA73F: db $55 ; Right zora - SPRITE 55

.object_allocation
#_0EA740: db $20 ; King Zora
#_0EA741: db $08 ; Left zora
#_0EA742: db $08 ; Right zora

.sprite_ai
#_0EA743: db $03 ; King Zora
#_0EA744: db $01 ; Left zora
#_0EA745: db $01 ; Right zora

.pose
#_0EA746: db $00 ; King Zora
#_0EA747: db $05 ; Left zora
#_0EA748: db $05 ; Right zora

#_0EA749: db $01 ; King Zora
#_0EA74A: db $06 ; Left zora
#_0EA74B: db $06 ; Right zora

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Zora:
#_0EA74C: PHX

#_0EA74D: TXA
#_0EA74E: LSR A
#_0EA74F: TAX

#_0EA750: LDA.w Credits_SpriteData_sprite_count,X
#_0EA753: TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
#_0EA754: STX.w $0FA0

#_0EA757: LDA.w .sprite_id,X
#_0EA75A: STA.w $0E20,X

#_0EA75D: LDA.w .object_allocation,X
#_0EA760: JSL SpriteDraw_AllocateOAMFromRegionA

#_0EA764: LDA.w .sprite_ai,X
#_0EA767: STA.w $0D80,X

#_0EA76A: TXY

#_0EA76B: REP #$20

#_0EA76D: LDA.b $C8
#_0EA76F: CMP.w #$026F
#_0EA772: BNE .skip_sfx

#_0EA774: PHY

#_0EA775: LDY.b #$21 ; SFX3.21
#_0EA777: STY.w $012F

#_0EA77A: PLY

.skip_sfx
#_0EA77B: SEP #$20
#_0EA77D: BCC .closed_mouth

#_0EA77F: INY
#_0EA780: INY
#_0EA781: INY

.closed_mouth
#_0EA782: LDA.w .pose,Y
#_0EA785: STA.w $0DC0,X

#_0EA788: LDA.b #$33
#_0EA78A: STA.w $0F50,X

#_0EA78D: JSL Sprite_Get16BitCoords_long
#_0EA791: JSL SpriteModule_Active_long

#_0EA795: DEX
#_0EA796: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0EA798: PLX

#_0EA799: RTS

;===================================================================================================

CreditsOAMGroup_SmithyBowing:
#_0EA79A: dw   0,   0 : db $22, $00, $00, $02
#_0EA7A2: dw  48,   0 : db $64, $00, $00, $02
#_0EA7AA: dw   0,  10 : db $6C, $01, $00, $02
#_0EA7B2: dw  48,  10 : db $6C, $01, $00, $02
#_0EA7BA: dw   0,   0 : db $64, $00, $00, $02
#_0EA7C2: dw  48,   0 : db $22, $00, $00, $02
#_0EA7CA: dw   0,  10 : db $6C, $01, $00, $02
#_0EA7D2: dw  48,  10 : db $6C, $01, $00, $02
#_0EA7DA: dw   0,   0 : db $64, $00, $00, $02
#_0EA7E2: dw  48,   0 : db $64, $00, $00, $02
#_0EA7EA: dw   0,  10 : db $6C, $01, $00, $02
#_0EA7F2: dw  48,  10 : db $6C, $01, $00, $02

;===================================================================================================

CreditsOAMGroup_SmithHammer:
#_0EA7FA: dw   0,   0 : db $60, $80, $00, $02

;===================================================================================================

Credits_SpriteDraw_Smithy:
#_0EA802: PHX

#_0EA803: LDX.b #$00

#_0EA805: REP #$20

#_0EA807: LDA.b $C8
#_0EA809: CMP.w #$0170

#_0EA80C: SEP #$20
#_0EA80E: BCC .animate_smiths_hammering

;---------------------------------------------------------------------------------------------------

#_0EA810: LDX.b #$04

.draw_next
#_0EA812: LDA.b #$01
#_0EA814: LDY.b #$3E
#_0EA816: JSR Credits_SpriteDraw_Single

#_0EA819: INX
#_0EA81A: CPX.b #$06
#_0EA81C: BNE .draw_next

;---------------------------------------------------------------------------------------------------

#_0EA81E: LDX.b #$00

#_0EA820: LDA.b #$39
#_0EA822: STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

#_0EA825: REP #$20

#_0EA827: LDA.b $C8
#_0EA829: CMP.w #$01C0

#_0EA82C: SEP #$20
#_0EA82E: BCS .check_bow_timer

#_0EA830: LDA.b #$02
#_0EA832: BRA .set_bow_pose

.check_bow_timer
#_0EA834: LDA.w $0DF0,X
#_0EA837: BNE .delay_bow

#_0EA839: LDA.b #$20
#_0EA83B: STA.w $0DF0,X

#_0EA83E: LDA.w $0DC0,X
#_0EA841: EOR.b #$01
#_0EA843: AND.b #$01

.set_bow_pose
#_0EA845: STA.w $0DC0,X

;---------------------------------------------------------------------------------------------------

.delay_bow
#_0EA848: LDA.b #$04
#_0EA84A: LDY.b #$06
#_0EA84C: JSR Credits_SpriteDraw_Single

#_0EA84F: PLX

#_0EA850: RTS

;---------------------------------------------------------------------------------------------------

.animate_smiths_hammering
#_0EA851: LDA.b #$1A ; SPRITE 1A
#_0EA853: STA.w $0E20,X

#_0EA856: LDA.b #$39
#_0EA858: STA.w $0F50,X

#_0EA85B: LDA.b #$02
#_0EA85D: JSR Credits_SpriteDraw_SetShadowProp

#_0EA860: LDA.b $10
#_0EA862: PHA

#_0EA863: LDA.b #$0C
#_0EA865: JSR Credits_SpriteDraw_ActivateAndRunSprite

#_0EA868: PLA
#_0EA869: STA.b $10

#_0EA86B: LDA.w $0DA0,X
#_0EA86E: CMP.b #$0F
#_0EA870: BNE .dont_reset_timer

#_0EA872: LDA.w $0D90,X
#_0EA875: CMP.b #$04
#_0EA877: BNE .dont_reset_timer

#_0EA879: LDA.b #$0F
#_0EA87B: STA.w $0DF2,X

.dont_reset_timer
#_0EA87E: JSR Credits_SpriteDraw_DrawSmithSpark

#_0EA881: INX
#_0EA882: CPX.b #$02
#_0EA884: BNE .animate_smiths_hammering

#_0EA886: PLX

#_0EA887: RTS

;===================================================================================================

CreditsOAMGroup_SmithSpark:
#_0EA888: dw   0,  -4 : db $AA, $30, $00, $02
#_0EA890: dw   0,  -4 : db $AA, $30, $00, $02
#_0EA898: dw  -4,  -8 : db $90, $30, $00, $00
#_0EA8A0: dw  12,  -8 : db $90, $70, $00, $00
#_0EA8A8: dw  -6, -10 : db $91, $30, $00, $00
#_0EA8B0: dw  14, -10 : db $91, $70, $00, $00

;===================================================================================================

pool Credits_SpriteDraw_DrawSmithSpark

.anim_step
#_0EA8B8: db $01, $01, $02, $02
#_0EA8BC: db $01, $01, $01, $01
#_0EA8C0: db $02, $02, $02, $02
#_0EA8C4: db $00, $00, $00, $00

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_DrawSmithSpark:
#_0EA8C8: PHX

#_0EA8C9: INX
#_0EA8CA: INX

#_0EA8CB: LDA.w $0DF0,X
#_0EA8CE: BEQ .no_draw

#_0EA8D0: TAY

#_0EA8D1: LDA.b #$02
#_0EA8D3: STA.w $0F50,X

#_0EA8D6: LDA.w .anim_step,Y
#_0EA8D9: STA.w $0DC0,X

#_0EA8DC: LDA.b #$02
#_0EA8DE: LDY.b #$36
#_0EA8E0: JSR Credits_SpriteDraw_Single

.no_draw
#_0EA8E3: PLX

#_0EA8E4: RTS

;===================================================================================================

CreditsOAMGroup_DesertThief:
#_0EA8E5: dw   0,   0 : db $22, $07, $00, $02
#_0EA8ED: dw   0,  -8 : db $C2, $09, $00, $02
#_0EA8F5: dw   0,   0 : db $22, $47, $00, $02
#_0EA8FD: dw   0,  -8 : db $C2, $09, $00, $02
#_0EA905: dw   0,  -9 : db $C4, $09, $00, $02
#_0EA90D: dw   0,   0 : db $22, $07, $00, $02
#_0EA915: dw   0,  -9 : db $24, $09, $00, $02
#_0EA91D: dw   0,   0 : db $22, $07, $00, $02

;===================================================================================================

CreditsOAMGroup_DesertChests:
#_0EA925: dw -16, -12 : db $08, $3F, $00, $02
#_0EA92D: dw   0, -12 : db $20, $3F, $00, $02
#_0EA935: dw  16, -12 : db $20, $3F, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Desert

.vulture_pose
#_0EA93D: db $01, $02, $03, $02

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Desert:
#_0EA941: PHX

#_0EA942: LDX.b #$00

.next_sprite
#_0EA944: CPX.b #$02
#_0EA946: BCS .is_chest

;---------------------------------------------------------------------------------------------------

.is_vulture
#_0EA948: LDA.b #$01 ; SPRITE 01
#_0EA94A: STA.w $0E20,X

#_0EA94D: LDA.b #$0B
#_0EA94F: STA.w $0F50,X

#_0EA952: LDA.b #$02
#_0EA954: JSR Credits_SpriteDraw_SetShadowProp

#_0EA957: LDA.b #$30
#_0EA959: STA.w $0F70,X

#_0EA95C: LDA.b $1A
#_0EA95E: CLC

.this
#_0EA95F: ADC.w .this,X ; this is correct and dumb
#_0EA962: LSR A
#_0EA963: LSR A
#_0EA964: AND.b #$03
#_0EA966: TAY

#_0EA967: LDA.w .vulture_pose,Y
#_0EA96A: STA.w $0DC0,X

#_0EA96D: JSR Credits_SpriteDraw_CirclingBirds

#_0EA970: LDA.b #$0C
#_0EA972: JSR Credits_SpriteDraw_PreexistingSpriteDraw

#_0EA975: BRA .continue

;---------------------------------------------------------------------------------------------------

.is_chest
#_0EA977: LDA.b #$10
#_0EA979: JSR Credits_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

.continue
#_0EA97C: INX
#_0EA97D: CPX.b #$05
#_0EA97F: BCC .next_sprite

;---------------------------------------------------------------------------------------------------

#_0EA981: LDA.b #$02
#_0EA983: LDY.b #$38
#_0EA985: JSR Credits_SpriteDraw_Single

#_0EA988: JSR Credits_SpriteDraw_AnimateRunningKidAndLocksmith

#_0EA98B: INX

#_0EA98C: LDA.b #$03
#_0EA98E: LDY.b #$3A
#_0EA990: JSR Credits_SpriteDraw_Single

#_0EA993: PLX

#_0EA994: RTS

;===================================================================================================

CreditsOAMGroup_Priest:
#_0EA995: dw  -6,  -2 : db $06, $07, $00, $02 ; book
#_0EA99D: dw   0,  -9 : db $0E, $09, $00, $02 ; head
#_0EA9A5: dw   0,  -1 : db $08, $09, $00, $02 ; body

;===================================================================================================

Credits_SpriteDraw_Sanctuary:
#_0EA9AD: PHX

#_0EA9AE: LDX.b #$00

#_0EA9B0: LDY.b #$0C
#_0EA9B2: LDA.b #$03
#_0EA9B4: JSR Credits_SpriteDraw_Single
#_0EA9B7: JSR Credits_SpriteDraw_DrawShadow_high_prioritize

;---------------------------------------------------------------------------------------------------

#_0EA9BA: INX

#_0EA9BB: LDA.b #$73 ; SPRITE 73

#_0EA9BD: STA.w $0E20,X

#_0EA9C0: LDA.b #$27
#_0EA9C2: STA.w $0F50,X

#_0EA9C5: LDA.b #$02
#_0EA9C7: STA.w $0E90,X

#_0EA9CA: LDA.b #$10
#_0EA9CC: JSR Credits_SpriteDraw_PreexistingSpriteDraw

#_0EA9CF: PLX

#_0EA9D0: RTS

;===================================================================================================

pool Credits_SpriteDraw_Witch

.pose_mask
#_0EA9D1: db $01, $FF

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Witch:
#_0EA9D3: PHX

#_0EA9D4: LDX.b #$01
#_0EA9D6: LDA.b #$02
#_0EA9D8: JSR Credits_SpriteDraw_SetShadowProp

#_0EA9DB: LDA.b #$E9 ; SPRITE E9
#_0EA9DD: STA.w $0E20,X

#_0EA9E0: LDA.b #$0C
#_0EA9E2: JSL SpriteDraw_AllocateOAMFromRegionA

#_0EA9E6: LDA.b #$37
#_0EA9E8: STA.w $0F50,X

#_0EA9EB: JSL Sprite_Get16BitCoords_long

#_0EA9EF: LDA.b $1A
#_0EA9F1: AND.b #$0F
#_0EA9F3: BNE .delay_jiggle

#_0EA9F5: LDA.w $0DC0,X
#_0EA9F8: EOR.b #$01
#_0EA9FA: STA.w $0DC0,X

.delay_jiggle
#_0EA9FD: JSL SpriteModule_Active_long

;---------------------------------------------------------------------------------------------------

#_0EAA01: REP #$20

#_0EAA03: LDA.b $C8
#_0EAA05: CMP.w #$0180

#_0EAA08: SEP #$20
#_0EAA0A: BCC .dont_move

#_0EAA0C: LDA.b #$04
#_0EAA0E: STA.w $0D40,X

#_0EAA11: LDA.w $0D00,X
#_0EAA14: CMP.b #$7C
#_0EAA16: BEQ .dont_move

#_0EAA18: JSL Sprite_Move_XY_Bank1D_long

;---------------------------------------------------------------------------------------------------

.dont_move
#_0EAA1C: DEX

#_0EAA1D: LDA.b #$36 ; SPRITE 36
#_0EAA1F: STA.w $0E20,X

#_0EAA22: LDA.b #$18
#_0EAA24: JSL SpriteDraw_AllocateOAMFromRegionA

#_0EAA28: LDA.b #$39
#_0EAA2A: STA.w $0F50,X

#_0EAA2D: JSL Sprite_Get16BitCoords_long

#_0EAA31: LDA.w $0DF0,X
#_0EAA34: BNE .delay_stir

#_0EAA36: LDA.b #$04
#_0EAA38: STA.w $0DF0,X

#_0EAA3B: LDA.b $C9
#_0EAA3D: LSR A
#_0EAA3E: AND.b #$01
#_0EAA40: TAY

#_0EAA41: LDA.w $0DC0,X
#_0EAA44: CLC
#_0EAA45: ADC.w .pose_mask,Y
#_0EAA48: AND.b #$07
#_0EAA4A: STA.w $0DC0,X

.delay_stir
#_0EAA4D: JSL SpriteModule_Active_long

;---------------------------------------------------------------------------------------------------

#_0EAA51: PLX

#_0EAA52: RTS

;===================================================================================================

CreditsOAMGroup_FluteDad:
#_0EAA53: dw -16, -24 : db $04, $37, $00, $02
#_0EAA5B: dw -16, -16 : db $64, $37, $00, $02
#_0EAA63: dw -16, -24 : db $62, $37, $00, $02
#_0EAA6B: dw -16, -16 : db $64, $37, $00, $02

;===================================================================================================

CreditsOAMGroup_Quaver:
#_0EAA73: dw   0, -19 : db $AF, $39, $00, $00

;===================================================================================================

pool Credits_SpriteDraw_Grove

.quaver_speed_x
#_0EAA7B: db   1,  -1

.flute_kid_foot_tempo
#_0EAA7D: db  16,  14,  16,  18

.flute_dad_headbang_timer
#_0EAA81: db  20,  48,  20,  20

;---------------------------------------------------------------------------------------------------

.animal_object_allocation
#_0EAA85: db $08 ; left rabbit
#_0EAA86: db $08 ; right rabbit
#_0EAA87: db $0C ; left bird
#_0EAA88: db $0C ; right bird

.animal_props
#_0EAA89: db $37 ; left rabbit
#_0EAA8A: db $37 ; right rabbit
#_0EAA8B: db $3B ; left bird
#_0EAA8C: db $3D ; right bird

.animal_direction
#_0EAA8D: db $00 ; left rabbit
#_0EAA8E: db $01 ; right rabbit
#_0EAA8F: db $00 ; left bird
#_0EAA90: db $01 ; right bird

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_Grove:
#_0EAA91: PHX

#_0EAA92: LDX.b #$00

.next_quaver
#_0EAA94: LDA.w $0DF0,X
#_0EAA97: BNE .delay_quaver

#_0EAA99: LDA.b #$60
#_0EAA9B: STA.w $0DF0,X
#_0EAA9E: STA.w $0DD0,X

#_0EAAA1: STZ.w $0D50,X

#_0EAAA4: LDA.b #$EE
#_0EAAA6: STA.w $0D10,X

#_0EAAA9: LDA.b #$04
#_0EAAAB: STA.w $0D30,X

#_0EAAAE: LDA.b #$18
#_0EAAB0: STA.w $0D00,X

#_0EAAB3: LDA.b #$0B
#_0EAAB5: STA.w $0D20,X

;---------------------------------------------------------------------------------------------------

.delay_quaver
#_0EAAB8: LDA.w $0DD0,X
#_0EAABB: BEQ .eigth_rest

#_0EAABD: LDA.b #$F8
#_0EAABF: STA.w $0D40,X

#_0EAAC2: JSL Sprite_Move_XY_Bank1D_long

#_0EAAC6: LDA.b $1A
#_0EAAC8: LSR A
#_0EAAC9: BCS .no_crescendo

#_0EAACB: STX.b $00

#_0EAACD: LDA.b $1A

#_0EAACF: LSR A
#_0EAAD0: LSR A
#_0EAAD1: LSR A
#_0EAAD2: LSR A
#_0EAAD3: LSR A

#_0EAAD4: EOR.b $00
#_0EAAD6: AND.b #$01
#_0EAAD8: TAY

#_0EAAD9: LDA.w $0D50,X
#_0EAADC: CLC
#_0EAADD: ADC.w .quaver_speed_x,Y
#_0EAAE0: STA.w $0D50,X

.no_crescendo
#_0EAAE3: LDY.b #$10
#_0EAAE5: LDA.b #$01
#_0EAAE7: JSR Credits_SpriteDraw_Single

;---------------------------------------------------------------------------------------------------

.eigth_rest
#_0EAAEA: INX
#_0EAAEB: CPX.b #$05
#_0EAAED: BCC .next_quaver

;---------------------------------------------------------------------------------------------------

.next_human
#_0EAAEF: LDY.w $0D90,X

#_0EAAF2: LDA.w $0DF0,X
#_0EAAF5: BNE .delay_jamming

#_0EAAF7: LDA.w .flute_kid_foot_tempo,Y

#_0EAAFA: CPX.b #$05
#_0EAAFC: BEQ .flute_kid

#_0EAAFE: LDA.w .flute_dad_headbang_timer,Y

.flute_kid
#_0EAB01: STA.w $0DF0,X

#_0EAB04: TYA
#_0EAB05: INC A
#_0EAB06: AND.b #$03
#_0EAB08: STA.w $0D90,X

#_0EAB0B: LDA.w $0DC0,X
#_0EAB0E: EOR.b #$01
#_0EAB10: STA.w $0DC0,X

.delay_jamming
#_0EAB13: CPX.b #$05
#_0EAB15: BNE .not_flute_kid

#_0EAB17: LDA.b #$31
#_0EAB19: STA.w $0F50,X

#_0EAB1C: LDA.b #$10
#_0EAB1E: JSR Credits_SpriteDraw_PreexistingSpriteDraw

#_0EAB21: INX

#_0EAB22: BRA .next_human

;---------------------------------------------------------------------------------------------------

.not_flute_kid
#_0EAB24: LDY.b #$12
#_0EAB26: LDA.b #$02
#_0EAB28: JSR Credits_SpriteDraw_Single

#_0EAB2B: INX

;---------------------------------------------------------------------------------------------------

.next_animal
#_0EAB2C: LDA.w .animal_props-7,X
#_0EAB2F: STA.w $0F50,X

#_0EAB32: LDA.w .animal_direction-7,X
#_0EAB35: STA.w $0DE0,X

#_0EAB38: LDA.w .animal_object_allocation-7,X
#_0EAB3B: JSR Credits_SpriteDraw_ActivateAndRunSprite

#_0EAB3E: INX
#_0EAB3F: CPX.b #$0B
#_0EAB41: BCC .next_animal

;---------------------------------------------------------------------------------------------------

#_0EAB43: PLX

#_0EAB44: RTS

;===================================================================================================

CreditsOAMGroup_WoodsThief:
#_0EAB45: dw   0,  -7 : db $00, $0D, $00, $02
#_0EAB4D: dw   0,  -7 : db $00, $0D, $00, $02
#_0EAB55: dw   0,   0 : db $06, $0D, $00, $02
#_0EAB5D: dw   0,  -7 : db $00, $0D, $00, $02
#_0EAB65: dw   0,  -7 : db $00, $0D, $00, $02
#_0EAB6D: dw   0,   0 : db $06, $4D, $00, $02
#_0EAB75: dw   0,  -8 : db $00, $0D, $00, $02
#_0EAB7D: dw   0,  -8 : db $00, $0D, $00, $02
#_0EAB85: dw   0,   0 : db $20, $0D, $00, $02
#_0EAB8D: dw   0,  -8 : db $02, $0D, $00, $02
#_0EAB95: dw   0,  -8 : db $02, $0D, $00, $02
#_0EAB9D: dw   0,   0 : db $2C, $0D, $00, $02
#_0EABA5: dw  -3,   0 : db $2F, $0D, $00, $00
#_0EABAD: dw   0,  -7 : db $02, $0D, $00, $02
#_0EABB5: dw   0,   0 : db $2C, $0D, $00, $02
#_0EABBD: dw  -5,   2 : db $2F, $0D, $00, $00
#_0EABC5: dw   0,  -8 : db $02, $0D, $00, $02
#_0EABCD: dw   0,   0 : db $2C, $0D, $00, $02
#_0EABD5: dw  -5,   2 : db $3F, $0D, $00, $00
#_0EABDD: dw   0,  -8 : db $02, $0D, $00, $02
#_0EABE5: dw   0,   0 : db $2C, $0D, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_LostWoods

.pickle_pose
#_0EABED: db $00, $01, $00

.target_y
#_0EABF0: db $02, $08, $20, $20, $08

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_LostWoods:
#_0EABF5: PHX

#_0EABF6: LDX.b #$06

.next_sprite
#_0EABF8: CPX.b #$05
#_0EABFA: BCC .pickle

;---------------------------------------------------------------------------------------------------

.raven
#_0EABFC: LDA.b #$00 ; SPRITE 00
#_0EABFE: STA.w $0E20,X

#_0EAC01: LDA.b #$01
#_0EAC03: JSR Credits_SpriteDraw_SetShadowProp

#_0EAC06: LDA.b $1A
#_0EAC08: CLC

.this
#_0EAC09: ADC.w .this,X
#_0EAC0C: AND.b #$08
#_0EAC0E: LSR A
#_0EAC0F: LSR A
#_0EAC10: LSR A
#_0EAC11: STA.w $0DC0,X

#_0EAC14: LDA.b #$20
#_0EAC16: STA.w $0F70,X

#_0EAC19: JSR Credits_SpriteDraw_CirclingBirds

#_0EAC1C: LDA.w $0D50,X
#_0EAC1F: LSR A
#_0EAC20: AND.b #$40
#_0EAC22: EOR.b #$0F
#_0EAC24: STA.w $0F50,X

#_0EAC27: LDA.b #$08
#_0EAC29: JSR Credits_SpriteDraw_PreexistingSpriteDraw

#_0EAC2C: BRA .to_next

;---------------------------------------------------------------------------------------------------

.pickle
#_0EAC2E: LDA.b #$0D ; SPRITE 0D
#_0EAC30: STA.w $0E20,X

#_0EAC33: CPX.b #$01
#_0EAC35: BNE .normal_pickle

#_0EAC37: STA.w $0EB0,X

.normal_pickle
#_0EAC3A: LDA.b #$03
#_0EAC3C: JSR Credits_SpriteDraw_SetShadowProp

#_0EAC3F: LDA.b #$2B
#_0EAC41: STA.w $0F50,X

#_0EAC44: LDA.w $0DF0,X
#_0EAC47: BNE .pickle_DILLay

#_0EAC49: LDA.b #$C0
#_0EAC4B: STA.w $0DF0,X

.pickle_DILLay
#_0EAC4E: LSR A
#_0EAC4F: BNE .no_movement

#_0EAC51: STA.w $0D40,X
#_0EAC54: BRA .set_x_speed

.no_movement
#_0EAC56: CMP.w .target_y,X
#_0EAC59: BCS .move_pickle

#_0EAC5B: LDA.b $1A
#_0EAC5D: AND.b #$03
#_0EAC5F: BNE .move_pickle

#_0EAC61: LDA.w $0D40,X
#_0EAC64: BEQ .move_pickle

#_0EAC66: DEC A
#_0EAC67: STA.w $0D40,X

#_0EAC6A: CLC
#_0EAC6B: ADC.b #$FC

#_0EAC6D: CPX.b #$03
#_0EAC6F: BCS .set_x_speed

#_0EAC71: EOR.b #$FF
#_0EAC73: INC A

.set_x_speed
#_0EAC74: STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.move_pickle
#_0EAC77: JSL Sprite_Move_XY_Bank1D_long

#_0EAC7B: LDA.b $1A
#_0EAC7D: LSR A
#_0EAC7E: LSR A
#_0EAC7F: LSR A
#_0EAC80: AND.b #$03
#_0EAC82: TAY

#_0EAC83: LDA.w .pickle_pose,Y
#_0EAC86: STA.w $0DC0,X

#_0EAC89: LDA.b #$10
#_0EAC8B: JSR Credits_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

.to_next
#_0EAC8E: DEX
#_0EAC8F: BEQ .done

#_0EAC91: JMP.w .next_sprite

;---------------------------------------------------------------------------------------------------

.done
#_0EAC94: LDY.b #$18
#_0EAC96: LDA.b #$03
#_0EAC98: JSR Credits_SpriteDraw_Single

#_0EAC9B: LDA.b #$20
#_0EAC9D: JSR Credits_SpriteDraw_AnimateLostWoodsThief

#_0EACA0: PLX

#_0EACA1: RTS

;===================================================================================================

Credits_SpriteDraw_SetShadowProp:
#_0EACA2: STA.w $0E40,X

#_0EACA5: LDA.b #$10
#_0EACA7: STA.w $0E60,X

#_0EACAA: RTS

;===================================================================================================

CreditsOAMGroup_PedestalSquirrel:
#_0EACAB: dw   0,   0 : db $0C, $0C, $00, $02
#_0EACB3: dw   0,   0 : db $0A, $0C, $00, $02
#_0EACBB: dw   0,   0 : db $C5, $0C, $00, $02
#_0EACC3: dw   0,   0 : db $E1, $0C, $00, $02

;===================================================================================================

pool Credits_SpriteDraw_Pedestal

.props
#_0EACCB: db $61, $61, $3B, $39

.squirrel_timer
#_0EACCF: db   6,   6,   6,   6,   6,   6,  10,   8

;---------------------------------------------------------------------------------------------------

#Credits_SpriteDraw_AddSparkle_timer:
#_0EACD7: db  32,   4,   4,   4,   5,   6

;---------------------------------------------------------------------------------------------------

.sparkle_position_x
#_0EACDD: db $76, $73, $71, $78

.sparkle_position_y
#_0EACE1: db $8B, $83, $8D, $85

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_AddSparkle:
#_0EACE5: STX.b $00

#_0EACE7: STA.b $02

#_0EACE9: STY.w $0DB0

;---------------------------------------------------------------------------------------------------

#_0EACEC: LDX.b #$00

.next
#_0EACEE: LDY.w $0DC0,X

#_0EACF1: LDA.w $0DF0,X
#_0EACF4: BNE .delay

#_0EACF6: INY
#_0EACF7: CPY.b #$06
#_0EACF9: BCC .dont_set

#_0EACFB: LDA.b $00
#_0EACFD: STA.w $0D10,X

#_0EAD00: LDA.b $02
#_0EAD02: STA.w $0D00,X

#_0EAD05: LDY.b #$00

.dont_set
#_0EAD07: TYA
#_0EAD08: STA.w $0DC0,X

#_0EAD0B: LDA.w .timer,Y
#_0EAD0E: STA.w $0DF0,X

.delay
#_0EAD11: TYA
#_0EAD12: BEQ .no_draw

#_0EAD14: LDY.b #$1C
#_0EAD16: LDA.b #$01
#_0EAD18: JSR Credits_SpriteDraw_Single

.no_draw
#_0EAD1B: INX
#_0EAD1C: CPX.w $0DB0
#_0EAD1F: BCC .next

;---------------------------------------------------------------------------------------------------

#_0EAD21: RTS

;===================================================================================================

Credits_SpriteDraw_Pedestal:
#_0EAD22: PHX

#_0EAD23: LDY.b $1A

.this
#_0EAD25: LDA.w .this,Y
#_0EAD28: AND.b #$03
#_0EAD2A: TAY

#_0EAD2B: LDX.w .sparkle_position_x,Y
#_0EAD2E: LDA.w .sparkle_position_y,Y

#_0EAD31: LDY.b #$02
#_0EAD33: JSR Credits_SpriteDraw_AddSparkle

;---------------------------------------------------------------------------------------------------

#_0EAD36: LDA.b #$62 ; SPRITE 62
#_0EAD38: STA.w $0E20,X

#_0EAD3B: LDA.b #$39
#_0EAD3D: STA.w $0F50,X

#_0EAD40: LDA.b #$18
#_0EAD42: JSR Credits_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

#_0EAD45: LDY.b #$01

.next_sprite
#_0EAD47: INX

#_0EAD48: LDA.w $0E00,X
#_0EAD4B: BEQ .timer_ended

#_0EAD4D: DEC.w $0E00,X

.timer_ended
#_0EAD50: LDA.w $0D50,X
#_0EAD53: LSR A
#_0EAD54: AND.b #$40
#_0EAD56: EOR.w .props,Y
#_0EAD59: STA.w $0F50,X

#_0EAD5C: LDA.w $0DF0,X
#_0EAD5F: BNE .delay

#_0EAD61: LDA.b #$80
#_0EAD63: STA.w $0DF0,X

#_0EAD66: STZ.w $0D90,X

.delay
#_0EAD69: LDA.w $0D90,X
#_0EAD6C: BNE .dont_move

#_0EAD6E: LDA.b $1A
#_0EAD70: LSR A
#_0EAD71: LSR A
#_0EAD72: AND.b #$01
#_0EAD74: INC A
#_0EAD75: INC A
#_0EAD76: STA.w $0DC0,X

#_0EAD79: PHY

#_0EAD7A: JSR Credits_SpriteDraw_MoveSquirrel

#_0EAD7D: PLY

#_0EAD7E: BRA .do_draw

;---------------------------------------------------------------------------------------------------

.dont_move
#_0EAD80: LDA.w $0E00,X
#_0EAD83: BNE .do_draw

#_0EAD85: LDA.w $0DA0,X
#_0EAD88: CMP.b #$08
#_0EAD8A: BNE .dont_reset

#_0EAD8C: STZ.w $0DA0,X

.dont_reset
#_0EAD8F: PHY

#_0EAD90: LDA.w $0DA0,X
#_0EAD93: AND.b #$07
#_0EAD95: TAY

#_0EAD96: LDA.w .squirrel_timer,Y
#_0EAD99: STA.w $0E00,X

#_0EAD9C: PLY

#_0EAD9D: LDA.w $0DC0,X
#_0EADA0: AND.b #$01
#_0EADA2: EOR.b #$01
#_0EADA4: STA.w $0DC0,X

#_0EADA7: INC.w $0DA0,X

;---------------------------------------------------------------------------------------------------

.do_draw
#_0EADAA: PHY

#_0EADAB: LDA.b #$01
#_0EADAD: LDY.b #$14
#_0EADAF: JSR Credits_SpriteDraw_Single
#_0EADB2: JSR Credits_SpriteDraw_DrawShadow_priority_set

#_0EADB5: PLY
#_0EADB6: DEY
#_0EADB7: BPL .next_sprite

;---------------------------------------------------------------------------------------------------

#_0EADB9: INX

#_0EADBA: JSR Credits_SpriteDraw_WalkLinkAwayFromPedestal

#_0EADBD: PLX

#_0EADBE: RTS

;===================================================================================================

CreditsOAMGroup_SwordSparkle:
#_0EADBF: dw   0,   0 : db $C7, $34, $00, $00
#_0EADC7: dw   0,   0 : db $80, $34, $00, $00
#_0EADCF: dw   0,   0 : db $B6, $34, $00, $00
#_0EADD7: dw   0,   0 : db $B7, $34, $00, $00
#_0EADDF: dw   0,   0 : db $A6, $34, $00, $00

;===================================================================================================

pool Credits_SpriteDraw_WalkLinkAwayFromPedestal

.pose
#_0EADE7: dw $016C
#_0EADE9: dw $016E
#_0EADEB: dw $0170
#_0EADED: dw $0172
#_0EADEF: dw $016C
#_0EADF1: dw $0174
#_0EADF3: dw $0176
#_0EADF5: dw $0178

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_WalkLinkAwayFromPedestal:
#_0EADF7: LDA.w $0DF0,X
#_0EADFA: BNE .delay_step

#_0EADFC: LDA.w $0DC0,X
#_0EADFF: INC A
#_0EAE00: AND.b #$07
#_0EAE02: STA.w $0DC0,X

#_0EAE05: LDA.b #$04
#_0EAE07: STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.delay_step
#_0EAE0A: LDA.w $0DC0,X
#_0EAE0D: ASL A
#_0EAE0E: TAY

#_0EAE0F: REP #$20

#_0EAE11: LDA.w .pose,Y
#_0EAE14: STA.w $0100

#_0EAE17: SEP #$20

#_0EAE19: LDA.b #$20
#_0EAE1B: STA.w $0F50,X

#_0EAE1E: LDA.b #$02
#_0EAE20: LDY.b #$1A
#_0EAE22: JSR Credits_SpriteDraw_Single
#_0EAE25: JSR Credits_SpriteDraw_DrawShadow_priority_set

#_0EAE28: JSL Sprite_Move_XY_Bank1D_long

#_0EAE2C: RTS

;===================================================================================================

pool Credits_SpriteDraw_MoveSquirrel

.speed_x
#_0EAE2D: db  32,  24, -32, -24

.speed_y
#_0EAE31: db   8,  -8,  -8,   8

pool off

;---------------------------------------------------------------------------------------------------

Credits_SpriteDraw_MoveSquirrel:
#_0EAE35: LDA.w $0DF0,X
#_0EAE38: CMP.b #$40
#_0EAE3A: BCS .move

#_0EAE3C: LDA.w $0DB0,X
#_0EAE3F: INC A
#_0EAE40: AND.b #$03
#_0EAE42: STA.w $0DB0,X

#_0EAE45: INC.w $0D90,X

#_0EAE48: RTS

;---------------------------------------------------------------------------------------------------

.move
#_0EAE49: LDY.w $0DB0,X

#_0EAE4C: LDA.w .speed_x,Y
#_0EAE4F: STA.w $0D50,X

#_0EAE52: LDA.w .speed_y,Y
#_0EAE55: STA.w $0D40,X

#_0EAE58: JSL Sprite_Move_XY_Bank1D_long

#_0EAE5C: RTS

;===================================================================================================

pool CreditsSpriteSpeeds

.x1
#_0EAE5D: db   1,  -1

.x32
#_0EAE5F: db  32, -32

.pos16
#_0EAE61: db  16

.neg16
#_0EAE62: db -16

pool off

;===================================================================================================

Credits_SpriteDraw_CirclingBirds:
#_0EAE63: LDA.w $0DE0,X
#_0EAE66: AND.b #$01
#_0EAE68: TAY

#_0EAE69: LDA.w $0D50,X
#_0EAE6C: CLC
#_0EAE6D: ADC.w CreditsSpriteSpeeds_x1,Y
#_0EAE70: STA.w $0D50,X

#_0EAE73: CMP.w CreditsSpriteSpeeds_x32,Y
#_0EAE76: BNE .not_at_boundary_x

#_0EAE78: INC.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.not_at_boundary_x
#_0EAE7B: LDA.b $1A
#_0EAE7D: AND.b #$01
#_0EAE7F: BNE .dont_change_y_speed

#_0EAE81: LDA.w $0EB0,X
#_0EAE84: AND.b #$01
#_0EAE86: TAY

#_0EAE87: LDA.w $0D40,X
#_0EAE8A: CLC
#_0EAE8B: ADC.w CreditsSpriteSpeeds_x1,Y
#_0EAE8E: STA.w $0D40,X

#_0EAE91: CMP.w CreditsSpriteSpeeds_pos16,Y
#_0EAE94: BNE .dont_change_y_speed

#_0EAE96: INC.w $0EB0,X

;---------------------------------------------------------------------------------------------------

.dont_change_y_speed
#_0EAE99: JSL Sprite_Move_XY_Bank1D_long

#_0EAE9D: RTS

;===================================================================================================

pool Credits_SingleCameraScrollControl

.screen_masks
#_0EAE9E: dw $0008
#_0EAEA0: dw $0004 ; Old McDonald had a farm EAEA0
#_0EAEA2: dw $0002
#_0EAEA4: dw $0001

pool off

;===================================================================================================

Credits_HandleCameraScrollControl:
#_0EAEA6: PHB
#_0EAEA7: PHK
#_0EAEA8: PLB

#_0EAEA9: REP #$20

#_0EAEAB: LDA.w #$0001
#_0EAEAE: STA.b $00

#_0EAEB0: LDA.b $30
#_0EAEB2: AND.w #$00FF
#_0EAEB5: BNE .vertical_movement

#_0EAEB7: JMP.w .handle_horizontal

;---------------------------------------------------------------------------------------------------

.vertical_movement
#_0EAEBA: CMP.w #$0080
#_0EAEBD: BCC .positive_vertical

#_0EAEBF: EOR.w #$00FF
#_0EAEC2: INC A

#_0EAEC3: DEC.b $00
#_0EAEC5: DEC.b $00

#_0EAEC7: STA.b $02

#_0EAEC9: LDY.b #$00
#_0EAECB: BRA .continue_vertical

;---------------------------------------------------------------------------------------------------

.positive_vertical
#_0EAECD: STA.b $02

#_0EAECF: LDY.b #$02

;---------------------------------------------------------------------------------------------------

.continue_vertical
#_0EAED1: LDX.b #$06
#_0EAED3: JSR Credits_SingleCameraScrollControl

#_0EAED6: LDA.b $04
#_0EAED8: STA.w $069E

#_0EAEDB: LDX.b $8C
#_0EAEDD: CPX.b #$97 ; OW 97
#_0EAEDF: BEQ .handle_horizontal

#_0EAEE1: CPX.b #$9D ; OW 9D
#_0EAEE3: BEQ .handle_horizontal

#_0EAEE5: LDA.b $04
#_0EAEE7: BEQ .handle_horizontal

;---------------------------------------------------------------------------------------------------

#_0EAEE9: STZ.b $00
#_0EAEEB: LSR A
#_0EAEEC: ROR.b $00

#_0EAEEE: LDX.b $8C
#_0EAEF0: CPX.b #$B5 ; OW B5
#_0EAEF2: BEQ .unused_overlay

#_0EAEF4: CPX.b #$BE ; OW BE
#_0EAEF6: BNE .not_unused_overlay

.unused_overlay
#_0EAEF8: LSR A
#_0EAEF9: ROR.b $00
#_0EAEFB: CMP.w #$3000
#_0EAEFE: BCC .set_vertical_scroll

#_0EAF00: ORA.w #$F000
#_0EAF03: BRA .set_vertical_scroll

.not_unused_overlay
#_0EAF05: CMP.w #$7000
#_0EAF08: BCC .set_vertical_scroll

#_0EAF0A: ORA.w #$F000

;---------------------------------------------------------------------------------------------------

.set_vertical_scroll
#_0EAF0D: STA.b $06

#_0EAF0F: LDA.w $0622
#_0EAF12: CLC
#_0EAF13: ADC.b $00
#_0EAF15: STA.w $0622

#_0EAF18: LDA.b $E6
#_0EAF1A: ADC.b $06
#_0EAF1C: STA.b $E6

;---------------------------------------------------------------------------------------------------

.handle_horizontal
#_0EAF1E: LDA.w #$0001
#_0EAF21: STA.b $00

#_0EAF23: LDA.b $31
#_0EAF25: AND.w #$00FF
#_0EAF28: BNE .horizontal_movement

#_0EAF2A: JMP.w .horizontal_control_done

;---------------------------------------------------------------------------------------------------

.horizontal_movement
#_0EAF2D: CMP.w #$0080
#_0EAF30: BCC .positive_horizontal

#_0EAF32: EOR.w #$00FF
#_0EAF35: INC A

#_0EAF36: DEC.b $00
#_0EAF38: DEC.b $00

#_0EAF3A: STA.b $02

#_0EAF3C: LDY.b #$04
#_0EAF3E: BRA .continue_horizontal

;---------------------------------------------------------------------------------------------------

.positive_horizontal
#_0EAF40: STA.b $02

#_0EAF42: LDY.b #$06

;---------------------------------------------------------------------------------------------------

.continue_horizontal
#_0EAF44: LDX.b #$00
#_0EAF46: JSR Credits_SingleCameraScrollControl

#_0EAF49: LDA.b $04
#_0EAF4B: STA.w $069F

#_0EAF4E: LDX.b $8C
#_0EAF50: CPX.b #$97 ; OW 97
#_0EAF52: BEQ .horizontal_control_done

#_0EAF54: CPX.b #$9D ; OW 9D
#_0EAF56: BEQ .horizontal_control_done

#_0EAF58: LDA.b $04
#_0EAF5A: BEQ .horizontal_control_done

#_0EAF5C: STZ.b $00
#_0EAF5E: LSR A
#_0EAF5F: ROR.b $00

;---------------------------------------------------------------------------------------------------

#_0EAF61: LDX.b $8C
#_0EAF63: CPX.b #$95 ; OW 95
#_0EAF65: BEQ .dm_overlay

#_0EAF67: CPX.b #$9E ; OW 9E
#_0EAF69: BNE .not_dm_overlay

.dm_overlay
#_0EAF6B: LSR A
#_0EAF6C: ROR.b $00
#_0EAF6E: CMP.w #$3000
#_0EAF71: BCC .set_horizontal_scroll

#_0EAF73: ORA.w #$F000
#_0EAF76: BRA .set_horizontal_scroll

.not_dm_overlay
#_0EAF78: CMP.w #$7000
#_0EAF7B: BCC .set_horizontal_scroll

#_0EAF7D: ORA.w #$F000

;---------------------------------------------------------------------------------------------------

.set_horizontal_scroll
#_0EAF80: STA.b $06

#_0EAF82: LDA.w $0620
#_0EAF85: CLC
#_0EAF86: ADC.b $00
#_0EAF88: STA.w $0620

#_0EAF8B: LDA.b $E0
#_0EAF8D: ADC.b $06
#_0EAF8F: STA.b $E0

;---------------------------------------------------------------------------------------------------

.horizontal_control_done
#_0EAF91: LDX.b $8C
#_0EAF93: CPX.b #$9C ; OW 9C
#_0EAF95: BEQ .extra_adjust_bg2

#_0EAF97: CPX.b #$97 ; OW 97
#_0EAF99: BEQ .extra_adjust_bg1

#_0EAF9B: CPX.b #$9D ; OW 9D
#_0EAF9D: BNE .continue

;---------------------------------------------------------------------------------------------------

.extra_adjust_bg1
#_0EAF9F: LDA.w $0622
#_0EAFA2: CLC
#_0EAFA3: ADC.w #$2000
#_0EAFA6: STA.w $0622

#_0EAFA9: LDA.b $E6
#_0EAFAB: ADC.w #$0000
#_0EAFAE: STA.b $E6

#_0EAFB0: LDA.w $0620
#_0EAFB3: CLC
#_0EAFB4: ADC.w #$2000
#_0EAFB7: STA.w $0620

#_0EAFBA: LDA.b $E0
#_0EAFBC: ADC.w #$0000
#_0EAFBF: STA.b $E0

#_0EAFC1: BRA .continue

;---------------------------------------------------------------------------------------------------

.extra_adjust_bg2
#_0EAFC3: LDA.w $0622
#_0EAFC6: SEC
#_0EAFC7: SBC.w #$2000
#_0EAFCA: STA.w $0622

#_0EAFCD: LDA.b $E6
#_0EAFCF: SBC.w #$0000
#_0EAFD2: CLC
#_0EAFD3: ADC.w $069E
#_0EAFD6: STA.b $E6

#_0EAFD8: LDA.b $E2
#_0EAFDA: STA.b $E0

;---------------------------------------------------------------------------------------------------

.continue
#_0EAFDC: LDA.b $A0
#_0EAFDE: CMP.w #$0181 ; OW 81
#_0EAFE1: BNE .exit

#_0EAFE3: LDA.b $E8
#_0EAFE5: ORA.w #$0100
#_0EAFE8: STA.b $E6

#_0EAFEA: LDA.b $E2
#_0EAFEC: STA.b $E0

.exit
#_0EAFEE: SEP #$20

#_0EAFF0: PLB

#_0EAFF1: RTL

;===================================================================================================

Credits_SingleCameraScrollControl:
#_0EAFF2: STZ.b $04
#_0EAFF4: STZ.b $06

.next_scroll
#_0EAFF6: LDA.b $E2,X
#_0EAFF8: CLC
#_0EAFF9: ADC.b $00
#_0EAFFB: STA.b $E2,X

#_0EAFFD: INC.b $06

#_0EAFFF: LDA.b $04
#_0EB001: CLC
#_0EB002: ADC.b $00
#_0EB004: STA.b $04

#_0EB006: DEC.b $02
#_0EB008: BNE .next_scroll

;---------------------------------------------------------------------------------------------------

#_0EB00A: TYA
#_0EB00B: EOR.w #$0002
#_0EB00E: TAX

#_0EB00F: LDA.w $0624,Y
#_0EB012: CLC
#_0EB013: ADC.b $06
#_0EB015: STA.w $0624,Y

#_0EB018: CMP.w #$0010
#_0EB01B: BMI .dont_remask_for_tilemap

#_0EB01D: SEC
#_0EB01E: SBC.w #$0010
#_0EB021: STA.w $0624,Y

#_0EB024: LDA.w .screen_masks,Y
#_0EB027: ORA.w $0416
#_0EB02A: STA.w $0416

.dont_remask_for_tilemap
#_0EB02D: LDA.w #$0000
#_0EB030: SEC
#_0EB031: SBC.w $0624,Y
#_0EB034: STA.w $0624,X

#_0EB037: RTS

;===================================================================================================

Credits_CharacterToTile:
#_0EB038: dw $38C7
#_0EB03A: dw $38C8
#_0EB03C: dw $38C9
#_0EB03E: dw $38CA
#_0EB040: dw $38CB
#_0EB042: dw $38CC
#_0EB044: dw $38CD
#_0EB046: dw $38CE
#_0EB048: dw $38CF
#_0EB04A: dw $38D7
#_0EB04C: dw $38D8
#_0EB04E: dw $38D9
#_0EB050: dw $38DA
#_0EB052: dw $38DB
#_0EB054: dw $38DC
#_0EB056: dw $38DD
#_0EB058: dw $38DE
#_0EB05A: dw $38DF
#_0EB05C: dw $38E0
#_0EB05E: dw $38E1
#_0EB060: dw $38E2
#_0EB062: dw $38E3
#_0EB064: dw $38E4
#_0EB066: dw $38F0
#_0EB068: dw $38F1
#_0EB06A: dw $38F2
#_0EB06C: dw $2CC7
#_0EB06E: dw $2CC8
#_0EB070: dw $2CC9
#_0EB072: dw $2CCA
#_0EB074: dw $2CCB
#_0EB076: dw $2CCC
#_0EB078: dw $2CCD
#_0EB07A: dw $2CCE
#_0EB07C: dw $2CCF
#_0EB07E: dw $2CD7
#_0EB080: dw $2CD8
#_0EB082: dw $2CD9
#_0EB084: dw $2CDA
#_0EB086: dw $2CDB
#_0EB088: dw $2CDC
#_0EB08A: dw $2CDD
#_0EB08C: dw $2CDE
#_0EB08E: dw $2CDF
#_0EB090: dw $2CE0
#_0EB092: dw $2CE1
#_0EB094: dw $2CE2
#_0EB096: dw $2CE3
#_0EB098: dw $2CE4
#_0EB09A: dw $2CF0
#_0EB09C: dw $2CF1
#_0EB09E: dw $2CF2
#_0EB0A0: dw $2CE5
#_0EB0A2: dw $2CF5
#_0EB0A4: dw $2CF3
#_0EB0A6: dw $2CF4
#_0EB0A8: dw $28C7
#_0EB0AA: dw $28C8
#_0EB0AC: dw $28C9
#_0EB0AE: dw $28CA
#_0EB0B0: dw $28CB
#_0EB0B2: dw $28CC
#_0EB0B4: dw $28CD
#_0EB0B6: dw $28CE
#_0EB0B8: dw $28CF
#_0EB0BA: dw $28D7
#_0EB0BC: dw $28D8
#_0EB0BE: dw $28D9
#_0EB0C0: dw $28DA
#_0EB0C2: dw $28DB
#_0EB0C4: dw $28DC
#_0EB0C6: dw $28DD
#_0EB0C8: dw $28DE
#_0EB0CA: dw $28DF
#_0EB0CC: dw $28E0
#_0EB0CE: dw $28E1
#_0EB0D0: dw $28E2
#_0EB0D2: dw $28E3
#_0EB0D4: dw $28E4
#_0EB0D6: dw $28F0
#_0EB0D8: dw $28F1
#_0EB0DA: dw $28F2
#_0EB0DC: dw $28D6
#_0EB0DE: dw $3CE6
#_0EB0E0: dw $3CE7
#_0EB0E2: dw $3CE8
#_0EB0E4: dw $3CE9
#_0EB0E6: dw $3CEA
#_0EB0E8: dw $3CEB
#_0EB0EA: dw $3CEC
#_0EB0EC: dw $3CED
#_0EB0EE: dw $3CEE
#_0EB0F0: dw $3CEF
#_0EB0F2: dw $3C00
#_0EB0F4: dw $3C01
#_0EB0F6: dw $3C02
#_0EB0F8: dw $3C03
#_0EB0FA: dw $3C04
#_0EB0FC: dw $3C05
#_0EB0FE: dw $3C06
#_0EB100: dw $3C07
#_0EB102: dw $3CAF
#_0EB104: dw $3C09
#_0EB106: dw $3C0A
#_0EB108: dw $3C0B
#_0EB10A: dw $3C0C
#_0EB10C: dw $3C0D
#_0EB10E: dw $3C0E
#_0EB110: dw $3C0F
#_0EB112: dw $3C20
#_0EB114: dw $3C21
#_0EB116: dw $3C22
#_0EB118: dw $3C23
#_0EB11A: dw $3C24
#_0EB11C: dw $3C25
#_0EB11E: dw $3C26
#_0EB120: dw $3C27
#_0EB122: dw $3C28
#_0EB124: dw $3C29
#_0EB126: dw $3CA1
#_0EB128: dw $3C6E
#_0EB12A: dw $3CF6
#_0EB12C: dw $3CF7
#_0EB12E: dw $3CF8
#_0EB130: dw $3CF9
#_0EB132: dw $3CFA
#_0EB134: dw $3CFB
#_0EB136: dw $3CFC
#_0EB138: dw $3CFD
#_0EB13A: dw $3CFE
#_0EB13C: dw $3CFF
#_0EB13E: dw $3C10
#_0EB140: dw $3C11
#_0EB142: dw $3C12
#_0EB144: dw $3C13
#_0EB146: dw $3C14
#_0EB148: dw $3C15
#_0EB14A: dw $3C16
#_0EB14C: dw $3C17
#_0EB14E: dw $3CBF
#_0EB150: dw $3C19
#_0EB152: dw $3C1A
#_0EB154: dw $3C1B
#_0EB156: dw $3C1C
#_0EB158: dw $3C1D
#_0EB15A: dw $3C1E
#_0EB15C: dw $3C1F
#_0EB15E: dw $3C30
#_0EB160: dw $3C31
#_0EB162: dw $3C32
#_0EB164: dw $3C33
#_0EB166: dw $3C34
#_0EB168: dw $3C35
#_0EB16A: dw $3C36
#_0EB16C: dw $3C37
#_0EB16E: dw $3C38
#_0EB170: dw $3C39
#_0EB172: dw $3CB1
#_0EB174: dw $3C7E

;---------------------------------------------------------------------------------------------------

CreditsBlankFillTile:
#_0EB176: dw $3CA9 ; 0x9F - blank

;===================================================================================================

pool CreditsTextLine

.data

;---------------------------------------------------------------------------------------------------

; EXECUTIVE PRODUCER
.line00
#_0EB178: db $07, $23 ; spacing, 0x24 bytes
#_0EB17A: db $3C, $4F, $3C, $3A, $4C, $4B, $40, $4D
#_0EB182: db $3C, $9F, $47, $49, $46, $3B, $4C, $3A
#_0EB18A: db $3C, $49

;---------------------------------------------------------------------------------------------------

; Blank line
.line01
#_0EB18C: db $FF ; short circuit

;---------------------------------------------------------------------------------------------------

; HIROSHI YAMAUCHI
.line02
#_0EB18D: db $08, $1F ; spacing, 0x20 bytes
#_0EB18F: db $64, $65, $6E, $6B, $6F, $64, $65, $9F
#_0EB197: db $75, $5D, $69, $5D, $71, $5F, $64, $65

;---------------------------------------------------------------------------------------------------

; HIROSHI YAMAUCHI
.line03
#_0EB19F: db $08, $1F ; spacing, 0x20 bytes
#_0EB1A1: db $8A, $8B, $94, $91, $95, $8A, $8B, $9F
#_0EB1A9: db $9B, $83, $8F, $83, $97, $85, $8A, $8B

;---------------------------------------------------------------------------------------------------

; PRODUCER
.line04
#_0EB1B1: db $0C, $0F ; spacing, 0x10 bytes
#_0EB1B3: db $29, $2B, $28, $1D, $2E, $1C, $1E, $2B

;---------------------------------------------------------------------------------------------------

; SHIGERU MIYAMOTO
.line05
#_0EB1BB: db $08, $1F ; spacing, 0x20 bytes
#_0EB1BD: db $6F, $64, $65, $63, $61, $6E, $71, $9F
#_0EB1C5: db $69, $65, $75, $5D, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; SHIGERU MIYAMOTO
.line06
#_0EB1CD: db $08, $1F ; spacing, 0x20 bytes
#_0EB1CF: db $95, $8A, $8B, $89, $87, $94, $97, $9F
#_0EB1D7: db $8F, $8B, $9B, $83, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; DIRECTOR
.line07
#_0EB1DF: db $0C, $0F ; spacing, 0x10 bytes
#_0EB1E1: db $03, $08, $11, $04, $02, $13, $0E, $11

;---------------------------------------------------------------------------------------------------

; TAKASHI TEZUKA
.line08
#_0EB1E9: db $09, $1B ; spacing, 0x1C bytes
#_0EB1EB: db $70, $5D, $67, $5D, $6F, $64, $65, $9F
#_0EB1F3: db $70, $61, $76, $71, $67, $5D

;---------------------------------------------------------------------------------------------------

; TAKASHI TEZUKA
.line09
#_0EB1F9: db $09, $1B ; spacing, 0x1C bytes
#_0EB1FB: db $96, $83, $8D, $83, $95, $8A, $8B, $9F
#_0EB203: db $96, $87, $9C, $97, $8D, $83

;---------------------------------------------------------------------------------------------------

; SCRIPT WRITER
.line0A
#_0EB209: db $09, $19 ; spacing, 0x1A bytes
#_0EB20B: db $4A, $3A, $49, $40, $47, $4B, $9F, $4E
#_0EB213: db $49, $40, $4B, $3C, $49

;---------------------------------------------------------------------------------------------------

; KENSUKE TANABE
.line0B
#_0EB218: db $09, $1B ; spacing, 0x1C bytes
#_0EB21A: db $67, $61, $6A, $6F, $71, $67, $61, $9F
#_0EB222: db $70, $5D, $6A, $5D, $5E, $61

;---------------------------------------------------------------------------------------------------

; KENSUKE TANABE
.line0C
#_0EB228: db $09, $1B ; spacing, 0x1C bytes
#_0EB22A: db $8D, $87, $90, $95, $97, $8D, $87, $9F
#_0EB232: db $96, $83, $90, $83, $84, $87

;---------------------------------------------------------------------------------------------------

; ASSISTANT DIRECTORS
.line0D
#_0EB238: db $06, $25 ; spacing, 0x26 bytes
#_0EB23A: db $1A, $2C, $2C, $22, $2C, $2D, $1A, $27
#_0EB242: db $2D, $9F, $1D, $22, $2B, $1E, $1C, $2D
#_0EB24A: db $28, $2B, $2C

;---------------------------------------------------------------------------------------------------

; YASUHISA YAMAMURA
.line0E
#_0EB24D: db $07, $21 ; spacing, 0x22 bytes
#_0EB24F: db $75, $5D, $6F, $71, $64, $65, $6F, $5D
#_0EB257: db $9F, $75, $5D, $69, $5D, $69, $71, $6E
#_0EB25F: db $5D

;---------------------------------------------------------------------------------------------------

; YASUHISA YAMAMURA
.line0F
#_0EB260: db $07, $21 ; spacing, 0x22 bytes
#_0EB262: db $9B, $83, $95, $97, $8A, $8B, $95, $83
#_0EB26A: db $9F, $9B, $83, $8F, $83, $8F, $97, $94
#_0EB272: db $83

;---------------------------------------------------------------------------------------------------

; YOICHI YAMADA
.line10
#_0EB273: db $09, $19 ; spacing, 0x1A bytes
#_0EB275: db $75, $6B, $65, $5F, $64, $65, $9F, $75
#_0EB27D: db $5D, $69, $5D, $60, $5D

;---------------------------------------------------------------------------------------------------

; YOICHI YAMADA
.line11
#_0EB282: db $09, $19 ; spacing, 0x1A bytes
#_0EB284: db $9B, $91, $8B, $85, $8A, $8B, $9F, $9B
#_0EB28C: db $83, $8F, $83, $86, $83

;---------------------------------------------------------------------------------------------------

; SCREEN GRAPHICS DESIGNERS
.line12
#_0EB291: db $03, $31 ; spacing, 0x32 bytes
#_0EB293: db $4A, $3A, $49, $3C, $3C, $45, $9F, $3E
#_0EB29B: db $49, $38, $47, $3F, $40, $3A, $4A, $9F
#_0EB2A3: db $3B, $3C, $4A, $40, $3E, $45, $3C, $49
#_0EB2AB: db $4A

;---------------------------------------------------------------------------------------------------

; OBJECT DESIGNERS
.line13
#_0EB2AC: db $08, $1F ; spacing, 0x20 bytes
#_0EB2AE: db $28, $1B, $23, $1E, $1C, $2D, $9F, $1D
#_0EB2B6: db $1E, $2C, $22, $20, $27, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; SOICHIRO TOMITA
.line14
#_0EB2BE: db $08, $1D ; spacing, 0x1E bytes
#_0EB2C0: db $6F, $6B, $65, $5F, $64, $65, $6E, $6B
#_0EB2C8: db $9F, $70, $6B, $69, $65, $70, $5D

;---------------------------------------------------------------------------------------------------

; SOICHIRO TOMITA
.line15
#_0EB2CF: db $08, $1D ; spacing, 0x1E bytes
#_0EB2D1: db $95, $91, $8B, $85, $8A, $8B, $94, $91
#_0EB2D9: db $9F, $96, $91, $8F, $8B, $96, $83

;---------------------------------------------------------------------------------------------------

; TAKAYA IMAMURA
.line16
#_0EB2E0: db $09, $1B ; spacing, 0x1C bytes
#_0EB2E2: db $70, $5D, $67, $5D, $75, $5D, $9F, $65
#_0EB2EA: db $69, $5D, $69, $71, $6E, $5D

;---------------------------------------------------------------------------------------------------

; TAKAYA IMAMURA
.line17
#_0EB2F0: db $09, $1B ; spacing, 0x1C bytes
#_0EB2F2: db $96, $83, $8D, $83, $9B, $83, $9F, $8B
#_0EB2FA: db $8F, $83, $8F, $97, $94, $83

;---------------------------------------------------------------------------------------------------

; BACK GROUND DESIGNERS
.line18
#_0EB300: db $05, $29 ; spacing, 0x2A bytes
#_0EB302: db $1B, $1A, $1C, $24, $9F, $20, $2B, $28
#_0EB30A: db $2E, $27, $1D, $9F, $1D, $1E, $2C, $22
#_0EB312: db $20, $27, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; MASANAO ARIMOTO
.line19
#_0EB317: db $08, $1D ; spacing, 0x1E bytes
#_0EB319: db $69, $5D, $6F, $5D, $6A, $5D, $6B, $9F
#_0EB321: db $5D, $6E, $65, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; MASANAO ARIMOTO
.line1A
#_0EB328: db $08, $1D ; spacing, 0x1E bytes
#_0EB32A: db $8F, $83, $95, $83, $90, $83, $91, $9F
#_0EB332: db $83, $94, $8B, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; TSUYOSHI WATANABE
.line1B
#_0EB339: db $07, $21 ; spacing, 0x22 bytes
#_0EB33B: db $70, $6F, $71, $75, $6B, $6F, $64, $65
#_0EB343: db $9F, $73, $5D, $70, $5D, $6A, $5D, $5E
#_0EB34B: db $61

;---------------------------------------------------------------------------------------------------

; TSUYOSHI WATANABE
.line1C
#_0EB34C: db $07, $21 ; spacing, 0x22 bytes
#_0EB34E: db $96, $95, $97, $9B, $91, $95, $8A, $8B
#_0EB356: db $9F, $99, $83, $96, $83, $90, $83, $84
#_0EB35E: db $87

;---------------------------------------------------------------------------------------------------

; PROGRAM DIRECTOR
.line1D
#_0EB35F: db $08, $1F ; spacing, 0x20 bytes
#_0EB361: db $0F, $11, $0E, $06, $11, $00, $0C, $9F
#_0EB369: db $03, $08, $11, $04, $02, $13, $0E, $11

;---------------------------------------------------------------------------------------------------

; TOSHIHIKO NAKAGO
.line1E
#_0EB371: db $08, $1F ; spacing, 0x20 bytes
#_0EB373: db $70, $6B, $6F, $64, $65, $64, $65, $67
#_0EB37B: db $6B, $9F, $6A, $5D, $67, $5D, $63, $6B

;---------------------------------------------------------------------------------------------------

; TOSHIHIKO NAKAGO
.line1F
#_0EB383: db $08, $1F ; spacing, 0x20 bytes
#_0EB385: db $96, $91, $95, $8A, $8B, $8A, $8B, $8D
#_0EB38D: db $91, $9F, $90, $83, $8D, $83, $89, $91

;---------------------------------------------------------------------------------------------------

; MAIN PROGRAMMER
.line20
#_0EB395: db $08, $1D ; spacing, 0x1E bytes
#_0EB397: db $44, $38, $40, $45, $9F, $47, $49, $46
#_0EB39F: db $3E, $49, $38, $44, $44, $3C, $49

;---------------------------------------------------------------------------------------------------

; YASUNARI SOEJIMA
.line21
#_0EB3A6: db $08, $1F ; spacing, 0x20 bytes
#_0EB3A8: db $75, $5D, $6F, $71, $6A, $5D, $6E, $65
#_0EB3B0: db $9F, $6F, $6B, $61, $66, $65, $69, $5D

;---------------------------------------------------------------------------------------------------

; YASUNARI SOEJIMA
.line22
#_0EB3B8: db $08, $1F ; spacing, 0x20 bytes
#_0EB3BA: db $9B, $83, $95, $97, $90, $83, $94, $8B
#_0EB3C2: db $9F, $95, $91, $87, $8C, $8B, $8F, $83

;---------------------------------------------------------------------------------------------------

; KAZUAKI MORITA
.line24
#_0EB3CA: db $09, $1B ; spacing, 0x1C bytes
#_0EB3CC: db $67, $5D, $76, $71, $5D, $67, $65, $9F
#_0EB3D4: db $69, $6B, $6E, $65, $70, $5D

;---------------------------------------------------------------------------------------------------

; KAZUAKI MORITA
.line25
#_0EB3DA: db $09, $1B ; spacing, 0x1C bytes
#_0EB3DC: db $8D, $83, $9C, $97, $83, $8D, $8B, $9F
#_0EB3E4: db $8F, $91, $94, $8B, $96, $83

;---------------------------------------------------------------------------------------------------

; PROGRAMMERS
.line26
#_0EB3EA: db $0A, $15 ; spacing, 0x16 bytes
#_0EB3EC: db $29, $2B, $28, $20, $2B, $1A, $26, $26
#_0EB3F4: db $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; TATSUO NISHIYAMA
.line27
#_0EB3F7: db $08, $1F ; spacing, 0x20 bytes
#_0EB3F9: db $70, $5D, $70, $6F, $71, $6B, $9F, $6A
#_0EB401: db $65, $6F, $64, $65, $75, $5D, $69, $5D

;---------------------------------------------------------------------------------------------------

; TATSUO NISHIYAMA
.line28
#_0EB409: db $08, $1F ; spacing, 0x20 bytes
#_0EB40B: db $96, $83, $96, $95, $97, $91, $9F, $90
#_0EB413: db $8B, $95, $8A, $8B, $9B, $83, $8F, $83

;---------------------------------------------------------------------------------------------------

; YUICHI YAMAMOTO
.line29
#_0EB41B: db $08, $1D ; spacing, 0x1E bytes
#_0EB41D: db $75, $71, $65, $5F, $64, $65, $9F, $75
#_0EB425: db $5D, $69, $5D, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; YUICHI YAMAMOTO
.line2A
#_0EB42C: db $08, $1D ; spacing, 0x1E bytes
#_0EB42E: db $9B, $97, $8B, $85, $8A, $8B, $9F, $9B
#_0EB436: db $83, $8F, $83, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; YOSHIHIRO NOMOTO
.line2B
#_0EB43D: db $08, $1F ; spacing, 0x20 bytes
#_0EB43F: db $75, $6B, $6F, $64, $65, $64, $65, $6E
#_0EB447: db $6B, $9F, $6A, $6B, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; YOSHIHIRO NOMOTO
.line2C
#_0EB44F: db $08, $1F ; spacing, 0x20 bytes
#_0EB451: db $9B, $91, $95, $8A, $8B, $8A, $8B, $94
#_0EB459: db $91, $9F, $90, $91, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; EIJI NOTO
.line2D
#_0EB461: db $0B, $11 ; spacing, 0x12 bytes
#_0EB463: db $61, $65, $66, $65, $9F, $6A, $6B, $70
#_0EB46B: db $6B

;---------------------------------------------------------------------------------------------------

; EIJI NOTO
.line2E
#_0EB46C: db $0B, $11 ; spacing, 0x12 bytes
#_0EB46E: db $87, $8B, $8C, $8B, $9F, $90, $91, $96
#_0EB476: db $91

;---------------------------------------------------------------------------------------------------

; SATORU TAKAHATA
.line2F
#_0EB477: db $08, $1D ; spacing, 0x1E bytes
#_0EB479: db $6F, $5D, $70, $6B, $6E, $71, $9F, $70
#_0EB481: db $5D, $67, $5D, $64, $5D, $70, $5D

;---------------------------------------------------------------------------------------------------

; SATORU TAKAHATA
.line30
#_0EB488: db $08, $1D ; spacing, 0x1E bytes
#_0EB48A: db $95, $83, $96, $91, $94, $97, $9F, $96
#_0EB492: db $83, $8D, $83, $8A, $83, $96, $83

;---------------------------------------------------------------------------------------------------

; SOUND COMPOSER
.line37
#_0EB499: db $09, $1B ; spacing, 0x1C bytes
#_0EB49B: db $12, $0E, $14, $0D, $03, $9F, $02, $0E
#_0EB4A3: db $0C, $0F, $0E, $12, $04, $11

;---------------------------------------------------------------------------------------------------

; KOJI KONDO
.line38
#_0EB4A9: db $0B, $13 ; spacing, 0x14 bytes
#_0EB4AB: db $67, $6B, $66, $65, $9F, $67, $6B, $6A
#_0EB4B3: db $60, $6B

;---------------------------------------------------------------------------------------------------

; KOJI KONDO
.line39
#_0EB4B5: db $0B, $13 ; spacing, 0x14 bytes
#_0EB4B7: db $8D, $91, $8C, $8B, $9F, $8D, $91, $90
#_0EB4BF: db $86, $91

;---------------------------------------------------------------------------------------------------

; COORDINATORS
.line3A
#_0EB4C1: db $0A, $17 ; spacing, 0x18 bytes
#_0EB4C3: db $3A, $46, $46, $49, $3B, $40, $45, $38
#_0EB4CB: db $4B, $46, $49, $4A

;---------------------------------------------------------------------------------------------------

; KEIZO KATO
.line3B
#_0EB4CF: db $0B, $13 ; spacing, 0x14 bytes
#_0EB4D1: db $67, $61, $65, $76, $6B, $9F, $67, $5D
#_0EB4D9: db $70, $6B

;---------------------------------------------------------------------------------------------------

; KEIZO KATO
.line3C
#_0EB4DB: db $0B, $13 ; spacing, 0x14 bytes
#_0EB4DD: db $8D, $87, $8B, $9C, $91, $9F, $8D, $83
#_0EB4E5: db $96, $91

;---------------------------------------------------------------------------------------------------

; TAKAO SHIMIZU
.line3D
#_0EB4E7: db $0A, $19 ; spacing, 0x1A bytes
#_0EB4E9: db $70, $5D, $67, $5D, $6B, $9F, $6F, $64
#_0EB4F1: db $65, $69, $65, $76, $71

;---------------------------------------------------------------------------------------------------

; TAKAO SHIMIZU
.line3E
#_0EB4F6: db $0A, $19 ; spacing, 0x1A bytes
#_0EB4F8: db $96, $83, $8D, $83, $91, $9F, $95, $8A
#_0EB500: db $8B, $8F, $8B, $9C, $97

;---------------------------------------------------------------------------------------------------

; PRINTED ART WORK
.line3F
#_0EB505: db $08, $1F ; spacing, 0x20 bytes
#_0EB507: db $29, $2B, $22, $27, $2D, $1E, $1D, $9F
#_0EB50F: db $1A, $2B, $2D, $9F, $30, $28, $2B, $24

;---------------------------------------------------------------------------------------------------

; YOICHI KOTABE
.line40
#_0EB517: db $09, $19 ; spacing, 0x1A bytes
#_0EB519: db $75, $6B, $65, $5F, $64, $65, $9F, $67
#_0EB521: db $6B, $70, $5D, $5E, $61

;---------------------------------------------------------------------------------------------------

; YOICHI KOTABE
.line41
#_0EB526: db $09, $19 ; spacing, 0x1A bytes
#_0EB528: db $9B, $91, $8B, $85, $8A, $8B, $9F, $8D
#_0EB530: db $91, $96, $83, $84, $87

;---------------------------------------------------------------------------------------------------

; HIDEKI FUJII
.line42
#_0EB535: db $0A, $17 ; spacing, 0x18 bytes
#_0EB537: db $64, $65, $60, $61, $67, $65, $9F, $62
#_0EB53F: db $71, $66, $65, $65

;---------------------------------------------------------------------------------------------------

; HIDEKI FUJII
.line43
#_0EB543: db $0A, $17 ; spacing, 0x18 bytes
#_0EB545: db $8A, $8B, $86, $87, $8D, $8B, $9F, $88
#_0EB54D: db $97, $8C, $8B, $8B

;---------------------------------------------------------------------------------------------------

; YOSHIAKI KOIZUMI
.line44
#_0EB551: db $08, $1F ; spacing, 0x20 bytes
#_0EB553: db $75, $6B, $6F, $64, $65, $5D, $67, $65
#_0EB55B: db $9F, $67, $6B, $65, $76, $71, $69, $65

;---------------------------------------------------------------------------------------------------

; YOSHIAKI KOIZUMI
.line45
#_0EB563: db $08, $1F ; spacing, 0x20 bytes
#_0EB565: db $9B, $91, $95, $8A, $8B, $83, $8D, $8B
#_0EB56D: db $9F, $8D, $91, $8B, $9C, $97, $8F, $8B

;---------------------------------------------------------------------------------------------------

; YASUHIRO SAKAI
.line46
#_0EB575: db $09, $1B ; spacing, 0x1C bytes
#_0EB577: db $75, $5D, $6F, $71, $64, $65, $6E, $6B
#_0EB57F: db $9F, $6F, $5D, $67, $5D, $65

;---------------------------------------------------------------------------------------------------

; YASUHIRO SAKAI
.line47
#_0EB585: db $09, $1B ; spacing, 0x1C bytes
#_0EB587: db $9B, $83, $95, $97, $8A, $8B, $94, $91
#_0EB58F: db $9F, $95, $83, $8D, $83, $8B

;---------------------------------------------------------------------------------------------------

; TOMOAKI KUROUME
.line48
#_0EB595: db $08, $1D ; spacing, 0x1E bytes
#_0EB597: db $70, $6B, $69, $6B, $5D, $67, $65, $9F
#_0EB59F: db $67, $71, $6E, $6B, $71, $69, $61

;---------------------------------------------------------------------------------------------------

; TOMOAKI KUROUME
.line49
#_0EB5A6: db $08, $1D ; spacing, 0x1E bytes
#_0EB5A8: db $96, $91, $8F, $91, $83, $8D, $8B, $9F
#_0EB5B0: db $8D, $97, $94, $91, $97, $8F, $87

;---------------------------------------------------------------------------------------------------

; SPECIAL THANKS TO
.line4F
#_0EB5B7: db $07, $21 ; spacing, 0x22 bytes
#_0EB5B9: db $12, $0F, $04, $02, $08, $00, $0B, $9F
#_0EB5C1: db $13, $07, $00, $0D, $0A, $12, $9F, $13
#_0EB5C9: db $0E

;---------------------------------------------------------------------------------------------------

; NOBUO OKAJIMA
.line50
#_0EB5CA: db $09, $19 ; spacing, 0x1A bytes
#_0EB5CC: db $6A, $6B, $5E, $71, $6B, $9F, $6B, $67
#_0EB5D4: db $5D, $66, $65, $69, $5D

;---------------------------------------------------------------------------------------------------

; NOBUO OKAJIMA
.line51
#_0EB5D9: db $09, $19 ; spacing, 0x1A bytes
#_0EB5DB: db $90, $91, $84, $97, $91, $9F, $91, $8D
#_0EB5E3: db $83, $8C, $8B, $8F, $83

;---------------------------------------------------------------------------------------------------

; YASUNORI TAKETANI
.line52
#_0EB5E8: db $07, $21 ; spacing, 0x22 bytes
#_0EB5EA: db $75, $5D, $6F, $71, $6A, $6B, $6E, $65
#_0EB5F2: db $9F, $70, $5D, $67, $61, $70, $5D, $6A
#_0EB5FA: db $65

;---------------------------------------------------------------------------------------------------

; YASUNORI TAKETANI
.line53
#_0EB5FB: db $07, $21 ; spacing, 0x22 bytes
#_0EB5FD: db $9B, $83, $95, $97, $90, $91, $94, $8B
#_0EB605: db $9F, $96, $83, $8D, $87, $96, $83, $90
#_0EB60D: db $8B

;---------------------------------------------------------------------------------------------------

; KIYOSHI KODA
.line54
#_0EB60E: db $0A, $17 ; spacing, 0x18 bytes
#_0EB610: db $67, $65, $75, $6B, $6F, $64, $65, $9F
#_0EB618: db $67, $6B, $60, $5D

;---------------------------------------------------------------------------------------------------

; KIYOSHI KODA
.line55
#_0EB61C: db $0A, $17 ; spacing, 0x18 bytes
#_0EB61E: db $8D, $8B, $9B, $91, $95, $8A, $8B, $9F
#_0EB626: db $8D, $91, $86, $83

;---------------------------------------------------------------------------------------------------

; TAKAMITSU KUZUHARA
.line56
#_0EB62A: db $07, $23 ; spacing, 0x24 bytes
#_0EB62C: db $70, $5D, $67, $5D, $69, $65, $70, $6F
#_0EB634: db $71, $9F, $67, $71, $76, $71, $64, $5D
#_0EB63C: db $6E, $5D

;---------------------------------------------------------------------------------------------------

; TAKAMITSU KUZUHARA
.line57
#_0EB63E: db $07, $23 ; spacing, 0x24 bytes
#_0EB640: db $96, $83, $8D, $83, $8F, $8B, $96, $95
#_0EB648: db $97, $9F, $8D, $97, $9C, $97, $8A, $83
#_0EB650: db $94, $83

;---------------------------------------------------------------------------------------------------

; HIRONOBU KAKUI
.line58
#_0EB652: db $09, $1B ; spacing, 0x1C bytes
#_0EB654: db $64, $65, $6E, $6B, $6A, $6B, $5E, $71
#_0EB65C: db $9F, $67, $5D, $67, $71, $65

;---------------------------------------------------------------------------------------------------

; HIRONOBU KAKUI
.line59
#_0EB662: db $09, $1B ; spacing, 0x1C bytes
#_0EB664: db $8A, $8B, $94, $91, $90, $91, $84, $97
#_0EB66C: db $9F, $8D, $83, $8D, $97, $8B

;---------------------------------------------------------------------------------------------------

; SHIGEKI YAMASHIRO
.line5A
#_0EB672: db $07, $21 ; spacing, 0x22 bytes
#_0EB674: db $6F, $64, $65, $63, $61, $67, $65, $9F
#_0EB67C: db $75, $5D, $69, $5D, $6F, $64, $65, $6E
#_0EB684: db $6B

;---------------------------------------------------------------------------------------------------

; SHIGEKI YAMASHIRO
.line5B
#_0EB685: db $07, $21 ; spacing, 0x22 bytes
#_0EB687: db $95, $8A, $8B, $89, $87, $8D, $8B, $9F
#_0EB68F: db $9B, $83, $8F, $83, $95, $8A, $8B, $94
#_0EB697: db $91

;---------------------------------------------------------------------------------------------------

; OBJECT PROGRAMMER
.line23
#_0EB698: db $07, $21 ; spacing, 0x22 bytes
#_0EB69A: db $46, $39, $41, $3C, $3A, $4B, $9F, $47
#_0EB6A2: db $49, $46, $3E, $49, $38, $44, $44, $3C
#_0EB6AA: db $49

;---------------------------------------------------------------------------------------------------

; TOSHIO IWAWAKI
.line31
#_0EB6AB: db $09, $1B ; spacing, 0x1C bytes
#_0EB6AD: db $70, $6B, $6F, $64, $65, $6B, $9F, $65
#_0EB6B5: db $73, $5D, $73, $5D, $67, $65

;---------------------------------------------------------------------------------------------------

; TOSHIO IWAWAKI
.line32
#_0EB6BB: db $09, $1B ; spacing, 0x1C bytes
#_0EB6BD: db $96, $91, $95, $8A, $8B, $91, $9F, $8B
#_0EB6C5: db $99, $83, $99, $83, $8D, $8B

;---------------------------------------------------------------------------------------------------

; SHIGEHIRO KASAMATSU
.line33
#_0EB6CB: db $06, $25 ; spacing, 0x26 bytes
#_0EB6CD: db $6F, $64, $65, $63, $61, $64, $65, $6E
#_0EB6D5: db $6B, $9F, $67, $5D, $6F, $5D, $69, $5D
#_0EB6DD: db $70, $6F, $71

;---------------------------------------------------------------------------------------------------

; SHIGEHIRO KASAMATSU
.line34
#_0EB6E0: db $06, $25 ; spacing, 0x26 bytes
#_0EB6E2: db $95, $8A, $8B, $89, $87, $8A, $8B, $94
#_0EB6EA: db $91, $9F, $8D, $83, $95, $83, $8F, $83
#_0EB6F2: db $96, $95, $97

;---------------------------------------------------------------------------------------------------

; QUEST HISTORY
.line5C
#_0EB6F5: db $0A, $19 ; spacing, 0x1A bytes
#_0EB6F7: db $6D, $71, $61, $6F, $70, $9F, $64, $65
#_0EB6FF: db $6F, $70, $6B, $6E, $75

;---------------------------------------------------------------------------------------------------

; QUEST HISTORY
.line5D
#_0EB704: db $0A, $19 ; spacing, 0x1A bytes
#_0EB706: db $93, $97, $87, $95, $96, $9F, $8A, $8B
#_0EB70E: db $95, $96, $91, $94, $9B

;---------------------------------------------------------------------------------------------------

; LOCATION             GAMES
.line5E
#_0EB713: db $03, $33 ; spacing, 0x34 bytes
#_0EB715: db $0B, $0E, $02, $00, $13, $08, $0E, $0D
#_0EB71D: db $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F
#_0EB725: db $9F, $9F, $9F, $9F, $9F, $06, $00, $0C
#_0EB72D: db $04, $12

;---------------------------------------------------------------------------------------------------

; CASTLE OF HYRULE
.line5F
#_0EB72F: db $04, $1F ; spacing, 0x20 bytes
#_0EB731: db $1C, $1A, $2C, $2D, $25, $1E, $9F, $28
#_0EB739: db $1F, $9F, $21, $32, $2B, $2E, $25, $1E

;---------------------------------------------------------------------------------------------------

; CASTLE DUNGEON
.line60
#_0EB741: db $04, $1B ; spacing, 0x1C bytes
#_0EB743: db $3A, $38, $4A, $4B, $43, $3C, $9F, $3B
#_0EB74B: db $4C, $45, $3E, $3C, $46, $45

;---------------------------------------------------------------------------------------------------

; EAST PALACE
.line61
#_0EB751: db $04, $15 ; spacing, 0x16 bytes
#_0EB753: db $1E, $1A, $2C, $2D, $9F, $29, $1A, $25
#_0EB75B: db $1A, $1C, $1E

;---------------------------------------------------------------------------------------------------

; DESERT PALACE
.line62
#_0EB75E: db $04, $19 ; spacing, 0x1A bytes
#_0EB760: db $3B, $3C, $4A, $3C, $49, $4B, $9F, $47
#_0EB768: db $38, $43, $38, $3A, $3C

;---------------------------------------------------------------------------------------------------

; MOUNTAIN TOWER
.line63
#_0EB76D: db $04, $1B ; spacing, 0x1C bytes
#_0EB76F: db $26, $28, $2E, $27, $2D, $1A, $22, $27
#_0EB777: db $9F, $2D, $28, $30, $1E, $2B

;---------------------------------------------------------------------------------------------------

; 1 DARK PALACE
.line64
#_0EB77D: db $08, $19 ; spacing, 0x1A bytes
#_0EB77F: db $54, $9F, $60, $5D, $6E, $67, $9F, $6C
#_0EB787: db $5D, $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL1 DARK PALACE
.line65
#_0EB78C: db $03, $23 ; spacing, 0x24 bytes
#_0EB78E: db $0B, $04, $15, $04, $0B, $7A, $9F, $86
#_0EB796: db $83, $94, $8D, $9F, $92, $83, $8E, $83
#_0EB79E: db $85, $87

;---------------------------------------------------------------------------------------------------

; 2 SWAMP PALACE
.line66
#_0EB7A0: db $08, $1B ; spacing, 0x1C bytes
#_0EB7A2: db $55, $9F, $6F, $73, $5D, $69, $6C, $9F
#_0EB7AA: db $6C, $5D, $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL2 SWAMP PALACE
.line67
#_0EB7B0: db $03, $25 ; spacing, 0x26 bytes
#_0EB7B2: db $0B, $04, $15, $04, $0B, $7B, $9F, $95
#_0EB7BA: db $99, $83, $8F, $92, $9F, $92, $83, $8E
#_0EB7C2: db $83, $85, $87

;---------------------------------------------------------------------------------------------------

; 3 SKULL WOODS
.line68
#_0EB7C5: db $08, $19 ; spacing, 0x1A bytes
#_0EB7C7: db $56, $9F, $6F, $67, $71, $68, $68, $9F
#_0EB7CF: db $73, $6B, $6B, $60, $6F

;---------------------------------------------------------------------------------------------------

; LEVEL3 SKULL WOODS
.line69
#_0EB7D4: db $03, $23 ; spacing, 0x24 bytes
#_0EB7D6: db $0B, $04, $15, $04, $0B, $7C, $9F, $95
#_0EB7DE: db $8D, $97, $8E, $8E, $9F, $99, $91, $91
#_0EB7E6: db $86, $95

;---------------------------------------------------------------------------------------------------

; 4 THIEVES'TOWN
.line6A
#_0EB7E8: db $08, $1B ; spacing, 0x1C bytes
#_0EB7EA: db $57, $9F, $70, $64, $65, $61, $72, $61
#_0EB7F2: db $6F, $77, $70, $6B, $73, $6A

;---------------------------------------------------------------------------------------------------

; LEVEL4 THIEVES'TOWN
.line6B
#_0EB7F8: db $03, $25 ; spacing, 0x26 bytes
#_0EB7FA: db $0B, $04, $15, $04, $0B, $7D, $9F, $96
#_0EB802: db $8A, $8B, $87, $98, $87, $95, $9D, $96
#_0EB80A: db $91, $99, $90

;---------------------------------------------------------------------------------------------------

; 5 ICE PALACE
.line6C
#_0EB80D: db $08, $17 ; spacing, 0x18 bytes
#_0EB80F: db $58, $9F, $65, $5F, $61, $9F, $6C, $5D
#_0EB817: db $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL5 ICE PALACE
.line6D
#_0EB81B: db $03, $21 ; spacing, 0x22 bytes
#_0EB81D: db $0B, $04, $15, $04, $0B, $7E, $9F, $8B
#_0EB825: db $85, $87, $9F, $92, $83, $8E, $83, $85
#_0EB82D: db $87

;---------------------------------------------------------------------------------------------------

; 6 MISERY MIRE
.line6E
#_0EB82E: db $08, $19 ; spacing, 0x1A bytes
#_0EB830: db $59, $9F, $69, $65, $6F, $61, $6E, $75
#_0EB838: db $9F, $69, $65, $6E, $61

;---------------------------------------------------------------------------------------------------

; LEVEL6 MISERY MIRE
.line6F
#_0EB83D: db $03, $23 ; spacing, 0x24 bytes
#_0EB83F: db $0B, $04, $15, $04, $0B, $7F, $9F, $8F
#_0EB847: db $8B, $95, $87, $94, $9B, $9F, $8F, $8B
#_0EB84F: db $94, $87

;---------------------------------------------------------------------------------------------------

; 7 TURTLE ROCK
.line70
#_0EB851: db $08, $19 ; spacing, 0x1A bytes
#_0EB853: db $5A, $9F, $70, $71, $6E, $70, $68, $61
#_0EB85B: db $9F, $6E, $6B, $5F, $67

;---------------------------------------------------------------------------------------------------

; LEVEL7 TURTLE ROCK
.line71
#_0EB860: db $03, $23 ; spacing, 0x24 bytes
#_0EB862: db $0B, $04, $15, $04, $0B, $80, $9F, $96
#_0EB86A: db $97, $94, $96, $8E, $87, $9F, $94, $91
#_0EB872: db $85, $8D

;---------------------------------------------------------------------------------------------------

; 8 GANON'S TOWER
.line72
#_0EB874: db $08, $1D ; spacing, 0x1E bytes
#_0EB876: db $5B, $9F, $63, $5D, $6A, $6B, $6A, $77
#_0EB87E: db $6F, $9F, $70, $6B, $73, $61, $6E

;---------------------------------------------------------------------------------------------------

; LEVEL8 GANON'S TOWER
.line73
#_0EB885: db $03, $27 ; spacing, 0x28 bytes
#_0EB887: db $0B, $04, $15, $04, $0B, $81, $9F, $89
#_0EB88F: db $83, $90, $91, $90, $9D, $95, $9F, $96
#_0EB897: db $91, $99, $87, $94

;---------------------------------------------------------------------------------------------------

; TOTAL GAMES PLAYED
.line74
#_0EB89B: db $04, $23 ; spacing, 0x24 bytes
#_0EB89D: db $70, $6B, $70, $5D, $68, $9F, $63, $5D
#_0EB8A5: db $69, $61, $6F, $9F, $6C, $68, $5D, $75
#_0EB8AD: db $61, $60

;---------------------------------------------------------------------------------------------------

; TOTAL GAMES PLAYED
.line75
#_0EB8AF: db $04, $23 ; spacing, 0x24 bytes
#_0EB8B1: db $96, $91, $96, $83, $8E, $9F, $89, $83
#_0EB8B9: db $8F, $87, $95, $9F, $92, $8E, $83, $9B
#_0EB8C1: db $87, $86

;---------------------------------------------------------------------------------------------------

; YASUNARI NISHIDA
.line35
#_0EB8C3: db $08, $1F ; spacing, 0x20 bytes
#_0EB8C5: db $75, $5D, $6F, $71, $6A, $5D, $6E, $65
#_0EB8CD: db $9F, $6A, $65, $6F, $64, $65, $60, $5D

;---------------------------------------------------------------------------------------------------

; YASUNARI NISHIDA
.line36
#_0EB8D5: db $08, $1F ; spacing, 0x20 bytes
#_0EB8D7: db $9B, $83, $95, $97, $90, $83, $94, $8B
#_0EB8DF: db $9F, $90, $8B, $95, $8A, $8B, $86, $83

;---------------------------------------------------------------------------------------------------

; ENGLISH SCRIPT WRITERS
.line4A
#_0EB8E7: db $05, $2B ; spacing, 0x2C bytes
#_0EB8E9: db $1E, $27, $20, $25, $22, $2C, $21, $9F
#_0EB8F1: db $2C, $1C, $2B, $22, $29, $2D, $9F, $30
#_0EB8F9: db $2B, $22, $2D, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; DANIEL OWSEN
.line4B
#_0EB8FF: db $0A, $17 ; spacing, 0x18 bytes
#_0EB901: db $60, $5D, $6A, $65, $61, $68, $9F, $6B
#_0EB909: db $73, $6F, $61, $6A

;---------------------------------------------------------------------------------------------------

; DANIEL OWSEN
.line4C
#_0EB90D: db $0A, $17 ; spacing, 0x18 bytes
#_0EB90F: db $86, $83, $90, $8B, $87, $8E, $9F, $91
#_0EB917: db $99, $95, $87, $90

;---------------------------------------------------------------------------------------------------

; HIROYUKI YAMADA
.line4D
#_0EB91B: db $08, $1D ; spacing, 0x1E bytes
#_0EB91D: db $64, $65, $6E, $6B, $75, $71, $67, $65
#_0EB925: db $9F, $75, $5D, $69, $5D, $60, $5D

;---------------------------------------------------------------------------------------------------

; HIROYUKI YAMADA
.line4E
#_0EB92C: db $08, $1D ; spacing, 0x1E bytes
#_0EB92E: db $8A, $8B, $94, $91, $9B, $97, $8D, $8B
#_0EB936: db $9F, $9B, $83, $8F, $83, $86, $83

;---------------------------------------------------------------------------------------------------

.pointers
#_0EB93D: dw .line00-.data ; $0000
#_0EB93F: dw .line01-.data ; $0014
#_0EB941: dw .line01-.data ; $0014
#_0EB943: dw .line01-.data ; $0014
#_0EB945: dw .line02-.data ; $0015
#_0EB947: dw .line03-.data ; $0027
#_0EB949: dw .line01-.data ; $0014
#_0EB94B: dw .line01-.data ; $0014
#_0EB94D: dw .line01-.data ; $0014
#_0EB94F: dw .line01-.data ; $0014
#_0EB951: dw .line01-.data ; $0014
#_0EB953: dw .line01-.data ; $0014
#_0EB955: dw .line01-.data ; $0014
#_0EB957: dw .line01-.data ; $0014
#_0EB959: dw .line04-.data ; $0039
#_0EB95B: dw .line01-.data ; $0014
#_0EB95D: dw .line01-.data ; $0014
#_0EB95F: dw .line01-.data ; $0014
#_0EB961: dw .line05-.data ; $0043
#_0EB963: dw .line06-.data ; $0055
#_0EB965: dw .line01-.data ; $0014
#_0EB967: dw .line01-.data ; $0014
#_0EB969: dw .line01-.data ; $0014
#_0EB96B: dw .line01-.data ; $0014
#_0EB96D: dw .line01-.data ; $0014
#_0EB96F: dw .line01-.data ; $0014
#_0EB971: dw .line01-.data ; $0014
#_0EB973: dw .line01-.data ; $0014
#_0EB975: dw .line07-.data ; $0067
#_0EB977: dw .line01-.data ; $0014
#_0EB979: dw .line01-.data ; $0014
#_0EB97B: dw .line01-.data ; $0014
#_0EB97D: dw .line08-.data ; $0071
#_0EB97F: dw .line09-.data ; $0081
#_0EB981: dw .line01-.data ; $0014
#_0EB983: dw .line01-.data ; $0014
#_0EB985: dw .line01-.data ; $0014
#_0EB987: dw .line01-.data ; $0014
#_0EB989: dw .line01-.data ; $0014
#_0EB98B: dw .line01-.data ; $0014
#_0EB98D: dw .line01-.data ; $0014
#_0EB98F: dw .line01-.data ; $0014
#_0EB991: dw .line0A-.data ; $0091
#_0EB993: dw .line01-.data ; $0014
#_0EB995: dw .line01-.data ; $0014
#_0EB997: dw .line01-.data ; $0014
#_0EB999: dw .line0B-.data ; $00A0
#_0EB99B: dw .line0C-.data ; $00B0
#_0EB99D: dw .line01-.data ; $0014
#_0EB99F: dw .line01-.data ; $0014
#_0EB9A1: dw .line01-.data ; $0014
#_0EB9A3: dw .line01-.data ; $0014
#_0EB9A5: dw .line01-.data ; $0014
#_0EB9A7: dw .line01-.data ; $0014
#_0EB9A9: dw .line01-.data ; $0014
#_0EB9AB: dw .line01-.data ; $0014
#_0EB9AD: dw .line0D-.data ; $00C0
#_0EB9AF: dw .line01-.data ; $0014
#_0EB9B1: dw .line01-.data ; $0014
#_0EB9B3: dw .line01-.data ; $0014
#_0EB9B5: dw .line0E-.data ; $00D5
#_0EB9B7: dw .line0F-.data ; $00E8
#_0EB9B9: dw .line01-.data ; $0014
#_0EB9BB: dw .line01-.data ; $0014
#_0EB9BD: dw .line10-.data ; $00FB
#_0EB9BF: dw .line11-.data ; $010A
#_0EB9C1: dw .line01-.data ; $0014
#_0EB9C3: dw .line01-.data ; $0014
#_0EB9C5: dw .line01-.data ; $0014
#_0EB9C7: dw .line01-.data ; $0014
#_0EB9C9: dw .line01-.data ; $0014
#_0EB9CB: dw .line01-.data ; $0014
#_0EB9CD: dw .line01-.data ; $0014
#_0EB9CF: dw .line01-.data ; $0014
#_0EB9D1: dw .line12-.data ; $0119
#_0EB9D3: dw .line01-.data ; $0014
#_0EB9D5: dw .line13-.data ; $0134
#_0EB9D7: dw .line01-.data ; $0014
#_0EB9D9: dw .line01-.data ; $0014
#_0EB9DB: dw .line01-.data ; $0014
#_0EB9DD: dw .line14-.data ; $0146
#_0EB9DF: dw .line15-.data ; $0157
#_0EB9E1: dw .line01-.data ; $0014
#_0EB9E3: dw .line01-.data ; $0014
#_0EB9E5: dw .line16-.data ; $0168
#_0EB9E7: dw .line17-.data ; $0178
#_0EB9E9: dw .line01-.data ; $0014
#_0EB9EB: dw .line01-.data ; $0014
#_0EB9ED: dw .line01-.data ; $0014
#_0EB9EF: dw .line01-.data ; $0014
#_0EB9F1: dw .line01-.data ; $0014
#_0EB9F3: dw .line01-.data ; $0014
#_0EB9F5: dw .line01-.data ; $0014
#_0EB9F7: dw .line01-.data ; $0014
#_0EB9F9: dw .line18-.data ; $0188
#_0EB9FB: dw .line01-.data ; $0014
#_0EB9FD: dw .line01-.data ; $0014
#_0EB9FF: dw .line01-.data ; $0014
#_0EBA01: dw .line19-.data ; $019F
#_0EBA03: dw .line1A-.data ; $01B0
#_0EBA05: dw .line01-.data ; $0014
#_0EBA07: dw .line01-.data ; $0014
#_0EBA09: dw .line1B-.data ; $01C1
#_0EBA0B: dw .line1C-.data ; $01D4
#_0EBA0D: dw .line01-.data ; $0014
#_0EBA0F: dw .line01-.data ; $0014
#_0EBA11: dw .line01-.data ; $0014
#_0EBA13: dw .line01-.data ; $0014
#_0EBA15: dw .line01-.data ; $0014
#_0EBA17: dw .line01-.data ; $0014
#_0EBA19: dw .line01-.data ; $0014
#_0EBA1B: dw .line01-.data ; $0014
#_0EBA1D: dw .line01-.data ; $0014
#_0EBA1F: dw .line01-.data ; $0014
#_0EBA21: dw .line1D-.data ; $01E7
#_0EBA23: dw .line01-.data ; $0014
#_0EBA25: dw .line01-.data ; $0014
#_0EBA27: dw .line01-.data ; $0014
#_0EBA29: dw .line1E-.data ; $01F9
#_0EBA2B: dw .line1F-.data ; $020B
#_0EBA2D: dw .line01-.data ; $0014
#_0EBA2F: dw .line01-.data ; $0014
#_0EBA31: dw .line01-.data ; $0014
#_0EBA33: dw .line01-.data ; $0014
#_0EBA35: dw .line01-.data ; $0014
#_0EBA37: dw .line01-.data ; $0014
#_0EBA39: dw .line01-.data ; $0014
#_0EBA3B: dw .line01-.data ; $0014
#_0EBA3D: dw .line20-.data ; $021D
#_0EBA3F: dw .line01-.data ; $0014
#_0EBA41: dw .line01-.data ; $0014
#_0EBA43: dw .line01-.data ; $0014
#_0EBA45: dw .line21-.data ; $022E
#_0EBA47: dw .line22-.data ; $0240
#_0EBA49: dw .line01-.data ; $0014
#_0EBA4B: dw .line01-.data ; $0014
#_0EBA4D: dw .line01-.data ; $0014
#_0EBA4F: dw .line01-.data ; $0014
#_0EBA51: dw .line01-.data ; $0014
#_0EBA53: dw .line01-.data ; $0014
#_0EBA55: dw .line01-.data ; $0014
#_0EBA57: dw .line01-.data ; $0014
#_0EBA59: dw .line23-.data ; $0520
#_0EBA5B: dw .line01-.data ; $0014
#_0EBA5D: dw .line01-.data ; $0014
#_0EBA5F: dw .line01-.data ; $0014
#_0EBA61: dw .line24-.data ; $0252
#_0EBA63: dw .line25-.data ; $0262
#_0EBA65: dw .line01-.data ; $0014
#_0EBA67: dw .line01-.data ; $0014
#_0EBA69: dw .line01-.data ; $0014
#_0EBA6B: dw .line01-.data ; $0014
#_0EBA6D: dw .line01-.data ; $0014
#_0EBA6F: dw .line01-.data ; $0014
#_0EBA71: dw .line01-.data ; $0014
#_0EBA73: dw .line01-.data ; $0014
#_0EBA75: dw .line26-.data ; $0272
#_0EBA77: dw .line01-.data ; $0014
#_0EBA79: dw .line01-.data ; $0014
#_0EBA7B: dw .line01-.data ; $0014
#_0EBA7D: dw .line27-.data ; $027F
#_0EBA7F: dw .line28-.data ; $0291
#_0EBA81: dw .line01-.data ; $0014
#_0EBA83: dw .line01-.data ; $0014
#_0EBA85: dw .line29-.data ; $02A3
#_0EBA87: dw .line2A-.data ; $02B4
#_0EBA89: dw .line01-.data ; $0014
#_0EBA8B: dw .line01-.data ; $0014
#_0EBA8D: dw .line2B-.data ; $02C5
#_0EBA8F: dw .line2C-.data ; $02D7
#_0EBA91: dw .line01-.data ; $0014
#_0EBA93: dw .line01-.data ; $0014
#_0EBA95: dw .line2D-.data ; $02E9
#_0EBA97: dw .line2E-.data ; $02F4
#_0EBA99: dw .line01-.data ; $0014
#_0EBA9B: dw .line01-.data ; $0014
#_0EBA9D: dw .line2F-.data ; $02FF
#_0EBA9F: dw .line30-.data ; $0310
#_0EBAA1: dw .line01-.data ; $0014
#_0EBAA3: dw .line01-.data ; $0014
#_0EBAA5: dw .line31-.data ; $0533
#_0EBAA7: dw .line32-.data ; $0543
#_0EBAA9: dw .line01-.data ; $0014
#_0EBAAB: dw .line01-.data ; $0014
#_0EBAAD: dw .line33-.data ; $0553
#_0EBAAF: dw .line34-.data ; $0568
#_0EBAB1: dw .line01-.data ; $0014
#_0EBAB3: dw .line01-.data ; $0014
#_0EBAB5: dw .line35-.data ; $074B
#_0EBAB7: dw .line36-.data ; $075D
#_0EBAB9: dw .line01-.data ; $0014
#_0EBABB: dw .line01-.data ; $0014
#_0EBABD: dw .line01-.data ; $0014
#_0EBABF: dw .line01-.data ; $0014
#_0EBAC1: dw .line01-.data ; $0014
#_0EBAC3: dw .line01-.data ; $0014
#_0EBAC5: dw .line01-.data ; $0014
#_0EBAC7: dw .line01-.data ; $0014
#_0EBAC9: dw .line01-.data ; $0014
#_0EBACB: dw .line01-.data ; $0014
#_0EBACD: dw .line37-.data ; $0321
#_0EBACF: dw .line01-.data ; $0014
#_0EBAD1: dw .line01-.data ; $0014
#_0EBAD3: dw .line01-.data ; $0014
#_0EBAD5: dw .line38-.data ; $0331
#_0EBAD7: dw .line39-.data ; $033D
#_0EBAD9: dw .line01-.data ; $0014
#_0EBADB: dw .line01-.data ; $0014
#_0EBADD: dw .line01-.data ; $0014
#_0EBADF: dw .line01-.data ; $0014
#_0EBAE1: dw .line01-.data ; $0014
#_0EBAE3: dw .line01-.data ; $0014
#_0EBAE5: dw .line01-.data ; $0014
#_0EBAE7: dw .line01-.data ; $0014
#_0EBAE9: dw .line3A-.data ; $0349
#_0EBAEB: dw .line01-.data ; $0014
#_0EBAED: dw .line01-.data ; $0014
#_0EBAEF: dw .line01-.data ; $0014
#_0EBAF1: dw .line3B-.data ; $0357
#_0EBAF3: dw .line3C-.data ; $0363
#_0EBAF5: dw .line01-.data ; $0014
#_0EBAF7: dw .line01-.data ; $0014
#_0EBAF9: dw .line3D-.data ; $036F
#_0EBAFB: dw .line3E-.data ; $037E
#_0EBAFD: dw .line01-.data ; $0014
#_0EBAFF: dw .line01-.data ; $0014
#_0EBB01: dw .line01-.data ; $0014
#_0EBB03: dw .line01-.data ; $0014
#_0EBB05: dw .line01-.data ; $0014
#_0EBB07: dw .line01-.data ; $0014
#_0EBB09: dw .line01-.data ; $0014
#_0EBB0B: dw .line01-.data ; $0014
#_0EBB0D: dw .line3F-.data ; $038D
#_0EBB0F: dw .line01-.data ; $0014
#_0EBB11: dw .line01-.data ; $0014
#_0EBB13: dw .line01-.data ; $0014
#_0EBB15: dw .line40-.data ; $039F
#_0EBB17: dw .line41-.data ; $03AE
#_0EBB19: dw .line01-.data ; $0014
#_0EBB1B: dw .line01-.data ; $0014
#_0EBB1D: dw .line42-.data ; $03BD
#_0EBB1F: dw .line43-.data ; $03CB
#_0EBB21: dw .line01-.data ; $0014
#_0EBB23: dw .line01-.data ; $0014
#_0EBB25: dw .line44-.data ; $03D9
#_0EBB27: dw .line45-.data ; $03EB
#_0EBB29: dw .line01-.data ; $0014
#_0EBB2B: dw .line01-.data ; $0014
#_0EBB2D: dw .line46-.data ; $03FD
#_0EBB2F: dw .line47-.data ; $040D
#_0EBB31: dw .line01-.data ; $0014
#_0EBB33: dw .line01-.data ; $0014
#_0EBB35: dw .line48-.data ; $041D
#_0EBB37: dw .line49-.data ; $042E
#_0EBB39: dw .line01-.data ; $0014
#_0EBB3B: dw .line01-.data ; $0014
#_0EBB3D: dw .line01-.data ; $0014
#_0EBB3F: dw .line01-.data ; $0014
#_0EBB41: dw .line01-.data ; $0014
#_0EBB43: dw .line01-.data ; $0014
#_0EBB45: dw .line01-.data ; $0014
#_0EBB47: dw .line01-.data ; $0014
#_0EBB49: dw .line01-.data ; $0014
#_0EBB4B: dw .line01-.data ; $0014
#_0EBB4D: dw .line4A-.data ; $076F
#_0EBB4F: dw .line01-.data ; $0014
#_0EBB51: dw .line01-.data ; $0014
#_0EBB53: dw .line01-.data ; $0014
#_0EBB55: dw .line4B-.data ; $0787
#_0EBB57: dw .line4C-.data ; $0795
#_0EBB59: dw .line01-.data ; $0014
#_0EBB5B: dw .line01-.data ; $0014
#_0EBB5D: dw .line4D-.data ; $07A3
#_0EBB5F: dw .line4E-.data ; $07B4
#_0EBB61: dw .line01-.data ; $0014
#_0EBB63: dw .line01-.data ; $0014
#_0EBB65: dw .line01-.data ; $0014
#_0EBB67: dw .line01-.data ; $0014
#_0EBB69: dw .line01-.data ; $0014
#_0EBB6B: dw .line01-.data ; $0014
#_0EBB6D: dw .line01-.data ; $0014
#_0EBB6F: dw .line01-.data ; $0014
#_0EBB71: dw .line4F-.data ; $043F
#_0EBB73: dw .line01-.data ; $0014
#_0EBB75: dw .line01-.data ; $0014
#_0EBB77: dw .line01-.data ; $0014
#_0EBB79: dw .line50-.data ; $0452
#_0EBB7B: dw .line51-.data ; $0461
#_0EBB7D: dw .line01-.data ; $0014
#_0EBB7F: dw .line01-.data ; $0014
#_0EBB81: dw .line52-.data ; $0470
#_0EBB83: dw .line53-.data ; $0483
#_0EBB85: dw .line01-.data ; $0014
#_0EBB87: dw .line01-.data ; $0014
#_0EBB89: dw .line54-.data ; $0496
#_0EBB8B: dw .line55-.data ; $04A4
#_0EBB8D: dw .line01-.data ; $0014
#_0EBB8F: dw .line01-.data ; $0014
#_0EBB91: dw .line56-.data ; $04B2
#_0EBB93: dw .line57-.data ; $04C6
#_0EBB95: dw .line01-.data ; $0014
#_0EBB97: dw .line01-.data ; $0014
#_0EBB99: dw .line58-.data ; $04DA
#_0EBB9B: dw .line59-.data ; $04EA
#_0EBB9D: dw .line01-.data ; $0014
#_0EBB9F: dw .line01-.data ; $0014
#_0EBBA1: dw .line5A-.data ; $04FA
#_0EBBA3: dw .line5B-.data ; $050D
#_0EBBA5: dw .line01-.data ; $0014
#_0EBBA7: dw .line01-.data ; $0014
#_0EBBA9: dw .line01-.data ; $0014
#_0EBBAB: dw .line01-.data ; $0014
#_0EBBAD: dw .line01-.data ; $0014
#_0EBBAF: dw .line01-.data ; $0014
#_0EBBB1: dw .line01-.data ; $0014
#_0EBBB3: dw .line01-.data ; $0014
#_0EBBB5: dw .line01-.data ; $0014
#_0EBBB7: dw .line01-.data ; $0014
#_0EBBB9: dw .line01-.data ; $0014
#_0EBBBB: dw .line01-.data ; $0014
#_0EBBBD: dw .line01-.data ; $0014
#_0EBBBF: dw .line01-.data ; $0014
#_0EBBC1: dw .line5C-.data ; $057D
#_0EBBC3: dw .line5D-.data ; $058C
#_0EBBC5: dw .line01-.data ; $0014
#_0EBBC7: dw .line01-.data ; $0014
#_0EBBC9: dw .line5E-.data ; $059B
#_0EBBCB: dw .line01-.data ; $0014
#_0EBBCD: dw .line01-.data ; $0014
#_0EBBCF: dw .line5F-.data ; $05B7
#_0EBBD1: dw .line01-.data ; $0014
#_0EBBD3: dw .line01-.data ; $0014
#_0EBBD5: dw .line01-.data ; $0014
#_0EBBD7: dw .line60-.data ; $05C9
#_0EBBD9: dw .line01-.data ; $0014
#_0EBBDB: dw .line01-.data ; $0014
#_0EBBDD: dw .line01-.data ; $0014
#_0EBBDF: dw .line61-.data ; $05D9
#_0EBBE1: dw .line01-.data ; $0014
#_0EBBE3: dw .line01-.data ; $0014
#_0EBBE5: dw .line01-.data ; $0014
#_0EBBE7: dw .line62-.data ; $05E6
#_0EBBE9: dw .line01-.data ; $0014
#_0EBBEB: dw .line01-.data ; $0014
#_0EBBED: dw .line01-.data ; $0014
#_0EBBEF: dw .line63-.data ; $05F5
#_0EBBF1: dw .line01-.data ; $0014
#_0EBBF3: dw .line01-.data ; $0014
#_0EBBF5: dw .line01-.data ; $0014
#_0EBBF7: dw .line64-.data ; $0605
#_0EBBF9: dw .line65-.data ; $0614
#_0EBBFB: dw .line01-.data ; $0014
#_0EBBFD: dw .line01-.data ; $0014
#_0EBBFF: dw .line66-.data ; $0628
#_0EBC01: dw .line67-.data ; $0638
#_0EBC03: dw .line01-.data ; $0014
#_0EBC05: dw .line01-.data ; $0014
#_0EBC07: dw .line68-.data ; $064D
#_0EBC09: dw .line69-.data ; $065C
#_0EBC0B: dw .line01-.data ; $0014
#_0EBC0D: dw .line01-.data ; $0014
#_0EBC0F: dw .line6A-.data ; $0670
#_0EBC11: dw .line6B-.data ; $0680
#_0EBC13: dw .line01-.data ; $0014
#_0EBC15: dw .line01-.data ; $0014
#_0EBC17: dw .line6C-.data ; $0695
#_0EBC19: dw .line6D-.data ; $06A3
#_0EBC1B: dw .line01-.data ; $0014
#_0EBC1D: dw .line01-.data ; $0014
#_0EBC1F: dw .line6E-.data ; $06B6
#_0EBC21: dw .line6F-.data ; $06C5
#_0EBC23: dw .line01-.data ; $0014
#_0EBC25: dw .line01-.data ; $0014
#_0EBC27: dw .line70-.data ; $06D9
#_0EBC29: dw .line71-.data ; $06E8
#_0EBC2B: dw .line01-.data ; $0014
#_0EBC2D: dw .line01-.data ; $0014
#_0EBC2F: dw .line72-.data ; $06FC
#_0EBC31: dw .line73-.data ; $070D
#_0EBC33: dw .line01-.data ; $0014
#_0EBC35: dw .line01-.data ; $0014
#_0EBC37: dw .line01-.data ; $0014
#_0EBC39: dw .line01-.data ; $0014
#_0EBC3B: dw .line01-.data ; $0014
#_0EBC3D: dw .line01-.data ; $0014
#_0EBC3F: dw .line01-.data ; $0014
#_0EBC41: dw .line01-.data ; $0014
#_0EBC43: dw .line01-.data ; $0014
#_0EBC45: dw .line01-.data ; $0014
#_0EBC47: dw .line01-.data ; $0014
#_0EBC49: dw .line01-.data ; $0014
#_0EBC4B: dw .line01-.data ; $0014
#_0EBC4D: dw .line74-.data ; $0723
#_0EBC4F: dw .line75-.data ; $0737


;---------------------------------------------------------------------------------------------------

.stats_lines
#_0EBC51: dw $0290
#_0EBC53: dw $0298
#_0EBC55: dw $02A0
#_0EBC57: dw $02A8
#_0EBC59: dw $02B0
#_0EBC5B: dw $02BA
#_0EBC5D: dw $02C2
#_0EBC5F: dw $02CA
#_0EBC61: dw $02D2
#_0EBC63: dw $02DA
#_0EBC65: dw $02E2
#_0EBC67: dw $02EA
#_0EBC69: dw $02F2
#_0EBC6B: dw $0310

pool off

;===================================================================================================

Credits_InitializeTheActualCredits:
#_0EBC6D: JSL EnableForceBlank

#_0EBC71: JSL EraseTilemaps_triforce
#_0EBC75: JSL TransferFontToVRAM

#_0EBC79: JSL Credits_LoadCoolBackground
#_0EBC7D: JSL Credits_InitializePolyhedral

#_0EBC81: LDA.b #$80
#_0EBC83: STA.b $13

#_0EBC85: LDA.b #$02
#_0EBC87: STA.w $0AA9

#_0EBC8A: LDA.b #$01
#_0EBC8C: STA.w $0AB2

#_0EBC8F: JSL Palettes_Load_HUD

#_0EBC93: INC.b $15

;---------------------------------------------------------------------------------------------------

#_0EBC95: REP #$20

#_0EBC97: LDA.w #$0000
#_0EBC9A: STA.l $7EF3EF

#_0EBC9E: LDA.l $7EF403
#_0EBCA2: CLC
#_0EBCA3: ADC.l $7EF401
#_0EBCA7: STA.l $7EF401

#_0EBCAB: LDX.b #$18

.next_death:
#_0EBCAD: CLC
#_0EBCAE: ADC.l $7EF3E7,X
#_0EBCB2: STA.l $7EF405

#_0EBCB6: DEX
#_0EBCB7: DEX
#_0EBCB8: BPL .next_death

;---------------------------------------------------------------------------------------------------

#_0EBCBA: LDA.w #$0000
#_0EBCBD: STA.l $7EF403

#_0EBCC1: SEP #$20

#_0EBCC3: LDA.l $7EF36C
#_0EBCC7: LSR A
#_0EBCC8: LSR A
#_0EBCC9: LSR A
#_0EBCCA: TAX

#_0EBCCB: LDA.l MaxHealthBasedSpawnHP,X
#_0EBCCF: STA.l $7EF36D

#_0EBCD3: LDA.b #$40
#_0EBCD5: STA.l $7EF3CA

;---------------------------------------------------------------------------------------------------

#_0EBCD9: JSL SaveGameFile

#_0EBCDD: REP #$20

#_0EBCDF: LDA.w #$0000 ; RGB: #000000
#_0EBCE2: STA.l $7EC34C
#_0EBCE6: STA.l $7EC54C

#_0EBCEA: LDA.w #$0000 ; RGB: #000000
#_0EBCED: STA.l $7EC300
#_0EBCF1: STA.l $7EC500

#_0EBCF5: LDA.w #$0016
#_0EBCF8: STA.b $1C

#_0EBCFA: LDA.w #$6800
#_0EBCFD: STA.b $C8

#_0EBCFF: STZ.b $CA
#_0EBD01: STZ.b $CC

#_0EBD03: LDA.w #$FFB8
#_0EBD06: STA.b $E8

#_0EBD08: LDA.w #$0090
#_0EBD0B: STA.b $E2

#_0EBD0D: STZ.b $EA
#_0EBD0F: STZ.b $E4

;---------------------------------------------------------------------------------------------------

#_0EBD11: JSR Credits_AddNextAttribution

#_0EBD14: SEP #$20

#_0EBD16: LDA.b #$22 ; SONG 22
#_0EBD18: STA.w $012C

#_0EBD1B: STZ.b $99

#_0EBD1D: LDA.b #$A2
#_0EBD1F: STA.b $9A

#_0EBD21: LDA.b #$12
#_0EBD23: STA.w BG2SC

#_0EBD26: LDA.b #$3F ; Fixed color RGB: #F8F8F8
#_0EBD28: STA.b $9C

#_0EBD2A: LDA.b #$5F
#_0EBD2C: STA.b $9D

#_0EBD2E: LDA.b #$9F
#_0EBD30: STA.b $9E

#_0EBD32: LDA.b #$40
#_0EBD34: STA.b $B0

#_0EBD36: STZ.b $13

;---------------------------------------------------------------------------------------------------

#_0EBD38: LDX.b #$04

.next_prop
#_0EBD3A: LDA.l .hdma_data,X
#_0EBD3E: STA.w DMA7MODE,X

#_0EBD41: DEX
#_0EBD42: BPL .next_prop

#_0EBD44: STZ.w HDMA7INDIRECTB

#_0EBD47: LDA.b #$80
#_0EBD49: STA.b $9B

#_0EBD4B: BRL Credits_SyncBGScrolls

;---------------------------------------------------------------------------------------------------

.hdma_data
#_0EBD4E: db $42
#_0EBD4F: db BG2HOFS
#_0EBD50: dl .indirect_table

.indirect_table
#_0EBD53: db  82 : dw $000600
#_0EBD56: db   8 : dw $0000E2
#_0EBD59: db   8 : dw $000602
#_0EBD5C: db   5 : dw $000604
#_0EBD5F: db  16 : dw $000606
#_0EBD62: db $81 : dw $0000E2
#_0EBD65: db $00 ; end

;===================================================================================================

Credits_FadeOutFixedCol:
#_0EBD66: DEC.b $B0
#_0EBD68: BNE .exit

#_0EBD6A: LDA.b #$10
#_0EBD6C: STA.b $B0

#_0EBD6E: LDA.b $9C
#_0EBD70: CMP.b #$20
#_0EBD72: BEQ .zero_red

#_0EBD74: DEC.b $9C

#_0EBD76: BRA .exit

;---------------------------------------------------------------------------------------------------

.zero_red
#_0EBD78: LDA.b $9D
#_0EBD7A: CMP.b #$40
#_0EBD7C: BEQ .zero_green

#_0EBD7E: DEC.b $9D

#_0EBD80: BRA .exit

;---------------------------------------------------------------------------------------------------

.zero_green
#_0EBD82: LDA.b $9E
#_0EBD84: CMP.b #$80
#_0EBD86: BEQ .exit

#_0EBD88: DEC.b $9E

.exit
#_0EBD8A: RTS

;===================================================================================================

Credits_FadeColorAndBeginAnimating:
#_0EBD8B: JSR Credits_FadeOutFixedCol

#_0EBD8E: LDA.b #$01
#_0EBD90: STA.w $0710

#_0EBD93: SEP #$30

#_0EBD95: JSL Credits_AnimateTheTriangles

#_0EBD99: REP #$30

#_0EBD9B: LDA.b $1A
#_0EBD9D: AND.w #$0003
#_0EBDA0: BNE Credits_SyncBGScrolls

#_0EBDA2: INC.b $E2

#_0EBDA4: LDA.b $E2
#_0EBDA6: CMP.w #$0C00
#_0EBDA9: BNE .dont_set_scroll

#_0EBDAB: LDY.w #$1300
#_0EBDAE: STY.w BG1SC

.dont_set_scroll
#_0EBDB1: LSR A
#_0EBDB2: STA.w $0604

#_0EBDB5: CLC
#_0EBDB6: ADC.b $E2
#_0EBDB8: STA.w $0600

#_0EBDBB: LSR A
#_0EBDBC: STA.w $0602

#_0EBDBF: LDA.w $0604
#_0EBDC2: LSR A
#_0EBDC3: STA.w $0606

#_0EBDC6: LDA.b $EA
#_0EBDC8: CMP.w #$0CD8
#_0EBDCB: BNE .delay_next_submodule

#_0EBDCD: LDA.w #$0080
#_0EBDD0: STA.b $C8

#_0EBDD2: INC.b $11

#_0EBDD4: BRA Credits_SyncBGScrolls

;---------------------------------------------------------------------------------------------------

.delay_next_submodule
#_0EBDD6: CLC
#_0EBDD7: ADC.w #$0001
#_0EBDDA: STA.b $EA

#_0EBDDC: TAY
#_0EBDDD: AND.w #$0007
#_0EBDE0: BNE Credits_SyncBGScrolls

#_0EBDE2: TYA
#_0EBDE3: LSR A
#_0EBDE4: LSR A
#_0EBDE5: LSR A
#_0EBDE6: STA.b $CA

#_0EBDE8: JSR Credits_AddNextAttribution

;===================================================================================================

Credits_SyncBGScrolls:
#_0EBDEB: REP #$20

#_0EBDED: LDA.b $E2
#_0EBDEF: STA.w $011E

#_0EBDF2: LDA.b $E8
#_0EBDF4: STA.w $0122

#_0EBDF7: LDA.b $E0
#_0EBDF9: STA.w $0120

#_0EBDFC: LDA.b $E6
#_0EBDFE: STA.w $0124

#_0EBE01: SEP #$30

#_0EBE03: RTS

;===================================================================================================

pool Credits_AddNextAttribution

.digits
#_0EBE04: dw $3CE6
#_0EBE06: dw $3CF6

.stats_data_offset
#_0EBE08: dw $0002
#_0EBE0A: dw $0000
#_0EBE0C: dw $0004
#_0EBE0E: dw $0006
#_0EBE10: dw $0014
#_0EBE12: dw $000C
#_0EBE14: dw $000A
#_0EBE16: dw $0010
#_0EBE18: dw $0016
#_0EBE1A: dw $0012
#_0EBE1C: dw $000E
#_0EBE1E: dw $0018
#_0EBE20: dw $001A
#_0EBE22: dw $001E

pool off

;---------------------------------------------------------------------------------------------------

Credits_AddNextAttribution:
#_0EBE24: PHB
#_0EBE25: PHK
#_0EBE26: PLB

#_0EBE27: REP #$30

#_0EBE29: LDX.w $1000

#_0EBE2C: LDA.b $C8
#_0EBE2E: XBA
#_0EBE2F: STA.w $1002,X

#_0EBE32: LDA.w #$3E40
#_0EBE35: STA.w $1004,X

#_0EBE38: LDA.w CreditsBlankFillTile
#_0EBE3B: STA.w $1006,X

#_0EBE3E: TXA
#_0EBE3F: CLC
#_0EBE40: ADC.w #$0006
#_0EBE43: TAX

#_0EBE44: LDA.b $CA
#_0EBE46: ASL A
#_0EBE47: TAY

#_0EBE48: CPY.w #$0314
#_0EBE4B: BCC .continue

#_0EBE4D: BRL .close_stripe

;---------------------------------------------------------------------------------------------------

.continue
#_0EBE50: LDA.w CreditsTextLine_pointers,Y
#_0EBE53: TAY

#_0EBE54: LDA.w CreditsTextLine_data,Y
#_0EBE57: AND.w #$00FF
#_0EBE5A: CMP.w #$00FF
#_0EBE5D: BEQ .short_circuit_line

#_0EBE5F: CLC
#_0EBE60: ADC.b $C8
#_0EBE62: XBA
#_0EBE63: STA.w $1002,X

#_0EBE66: INY

#_0EBE67: LDA.w CreditsTextLine_data,Y
#_0EBE6A: AND.w #$00FF
#_0EBE6D: XBA
#_0EBE6E: STA.w $1004,X

#_0EBE71: XBA
#_0EBE72: INC A
#_0EBE73: LSR A
#_0EBE74: STA.b $02

#_0EBE76: INY
#_0EBE77: STY.b $00

;---------------------------------------------------------------------------------------------------

.next_letter
#_0EBE79: LDY.b $00

#_0EBE7B: LDA.w CreditsTextLine_data,Y
#_0EBE7E: AND.w #$00FF
#_0EBE81: ASL A
#_0EBE82: TAY

#_0EBE83: LDA.w Credits_CharacterToTile,Y
#_0EBE86: STA.w $1006,X

#_0EBE89: INC.b $00

#_0EBE8B: INX
#_0EBE8C: INX

#_0EBE8D: DEC.b $02
#_0EBE8F: BNE .next_letter

;---------------------------------------------------------------------------------------------------

#_0EBE91: INX
#_0EBE92: INX
#_0EBE93: INX
#_0EBE94: INX

.short_circuit_line
#_0EBE95: LDA.b $CC
#_0EBE97: AND.w #$0001
#_0EBE9A: TAY
#_0EBE9B: BNE .no_stats

#_0EBE9D: LDA.b $CC
#_0EBE9F: AND.w #$00FE
#_0EBEA2: TAY

#_0EBEA3: LDA.b $CA
#_0EBEA5: ASL A
#_0EBEA6: CMP.w CreditsTextLine_stats_lines,Y
#_0EBEA9: BNE .close_stripe

;---------------------------------------------------------------------------------------------------

.no_stats
#_0EBEAB: TYA
#_0EBEAC: AND.w #$0001
#_0EBEAF: ASL A
#_0EBEB0: TAY

#_0EBEB1: LDA.w .digits,Y
#_0EBEB4: STA.b $CE

#_0EBEB6: LDA.b $C8
#_0EBEB8: CLC
#_0EBEB9: ADC.w #$0019
#_0EBEBC: XBA
#_0EBEBD: STA.w $1002,X

#_0EBEC0: LDA.w #$0500
#_0EBEC3: STA.w $1004,X

#_0EBEC6: PHX

#_0EBEC7: LDA.b $CC
#_0EBEC9: LSR A
#_0EBECA: ASL A
#_0EBECB: TAX

#_0EBECC: LDA.w .stats_data_offset,X
#_0EBECF: TAX

#_0EBED0: LDA.l $7EF3E7,X

#_0EBED4: PLX

#_0EBED5: CMP.w #1000
#_0EBED8: BCC .sub1000

;---------------------------------------------------------------------------------------------------

#_0EBEDA: LDA.w #$0009
#_0EBEDD: CLC
#_0EBEDE: ADC.b $CE
#_0EBEE0: STA.w $1006,X
#_0EBEE3: STA.w $1008,X
#_0EBEE6: STA.w $100A,X

#_0EBEE9: BRA .number_done

;---------------------------------------------------------------------------------------------------

.sub1000
#_0EBEEB: LDY.w #$0000

.get_1e0
#_0EBEEE: CMP.w #$000A
#_0EBEF1: BMI .set_1e0

#_0EBEF3: SEC
#_0EBEF4: SBC.w #$000A

#_0EBEF7: INY

#_0EBEF8: BRA .get_1e0

.set_1e0
#_0EBEFA: CLC
#_0EBEFB: ADC.b $CE
#_0EBEFD: STA.w $100A,X

;---------------------------------------------------------------------------------------------------

#_0EBF00: TYA

#_0EBF01: LDY.w #$0000

.get_1e1
#_0EBF04: CMP.w #$000A
#_0EBF07: BMI .set_1e1

#_0EBF09: SEC
#_0EBF0A: SBC.w #$000A
#_0EBF0D: INY

#_0EBF0E: BRA .get_1e1

;---------------------------------------------------------------------------------------------------

.set_1e1
#_0EBF10: CLC
#_0EBF11: ADC.b $CE
#_0EBF13: STA.w $1008,X

#_0EBF16: TYA
#_0EBF17: CLC
#_0EBF18: ADC.b $CE
#_0EBF1A: STA.w $1006,X

;---------------------------------------------------------------------------------------------------

.number_done
#_0EBF1D: INC.b $CC

#_0EBF1F: TXA
#_0EBF20: CLC
#_0EBF21: ADC.w #$000A
#_0EBF24: TAX

;---------------------------------------------------------------------------------------------------

.close_stripe
#_0EBF25: STX.w $1000

#_0EBF28: LDA.b $C8
#_0EBF2A: CLC
#_0EBF2B: ADC.w #$0020
#_0EBF2E: TAY

#_0EBF2F: AND.w #$03FF
#_0EBF32: BNE .dont_reset_vram_addr

#_0EBF34: LDA.b $C8
#_0EBF36: AND.w #$6800
#_0EBF39: EOR.w #$0800
#_0EBF3C: TAY

.dont_reset_vram_addr
#_0EBF3D: STY.b $C8

#_0EBF3F: SEP #$30

#_0EBF41: LDA.b #$FF
#_0EBF43: STA.w $1002,X

#_0EBF46: LDA.b #$01
#_0EBF48: STA.b $14

#_0EBF4A: PLB

#_0EBF4B: RTS

;===================================================================================================

pool Credits_AddEndingSequenceText

.chargfx

;---------------------------------------------------------------------------------------------------

.chargfx_castle
; SMALL: THE RETURN OF THE KING
#_0EBF4C: dw $6562, $2B00 ; VRAM $C4CA | 44 bytes
#_0EBF50: db $2D, $21, $1E, $9F, $2B, $1E, $2D, $2E
#_0EBF58: db $2B, $27, $9F, $28, $1F, $9F, $2D, $21
#_0EBF60: db $1E, $9F, $24, $22, $27, $20

; TOP: HYRULE CASTLE
#_0EBF66: dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
#_0EBF6A: db $64, $75, $6E, $71, $68, $61, $9F, $5F
#_0EBF72: db $5D, $6F, $70, $68, $61

; BOTTOM: HYRULE CASTLE
#_0EBF77: dw $0963, $1900 ; VRAM $C612 | 26 bytes
#_0EBF7B: db $8A, $9B, $94, $97, $8E, $87, $9F, $85
#_0EBF83: db $83, $95, $96, $8E, $87

;---------------------------------------------------------------------------------------------------

.chargfx_sanc
; SMALL: THE LOYAL SAGE
#_0EBF88: dw $6862, $1B00 ; VRAM $C4D0 | 28 bytes
#_0EBF8C: db $2D, $21, $1E, $9F, $25, $28, $32, $1A
#_0EBF94: db $25, $9F, $2C, $1A, $20, $1E

; TOP: SANCTUARY
#_0EBF9A: dw $EB62, $1100 ; VRAM $C5D6 | 18 bytes
#_0EBF9E: db $6F, $5D, $6A, $5F, $70, $71, $5D, $6E
#_0EBFA6: db $75

; BOTTOM: SANCTUARY
#_0EBFA7: dw $0B63, $1100 ; VRAM $C616 | 18 bytes
#_0EBFAB: db $95, $83, $90, $85, $96, $97, $83, $94
#_0EBFB3: db $9B

;---------------------------------------------------------------------------------------------------

.chargfx_kak1
; SMALL: , (top of apostrophe)
#_0EBFB4: dw $4F62, $0100 ; VRAM $C49E | 2 bytes
#_0EBFB8: db $34

; SMALL: SAHASRALAH'S HOMECOMING
#_0EBFB9: dw $6562, $2D00 ; VRAM $C4CA | 46 bytes
#_0EBFBD: db $2C, $1A, $21, $1A, $2C, $2B, $1A, $25
#_0EBFC5: db $1A, $21, $35, $2C, $9F, $21, $28, $26
#_0EBFCD: db $1E, $1C, $28, $26, $22, $27, $20

; TOP: KAKARIKO TOWN
#_0EBFD4: dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
#_0EBFD8: db $67, $5D, $67, $5D, $6E, $65, $67, $6B
#_0EBFE0: db $9F, $70, $6B, $73, $6A

; BOTTOM: KAKARIKO TOWN
#_0EBFE5: dw $0963, $1900 ; VRAM $C612 | 26 bytes
#_0EBFE9: db $8D, $83, $8D, $83, $94, $8B, $8D, $91
#_0EBFF1: db $9F, $96, $91, $99, $90

;---------------------------------------------------------------------------------------------------

.chargfx_desert
; SMALL: VULTURES RULE THE DESERT
#_0EBFF6: dw $6462, $2F00 ; VRAM $C4C8 | 48 bytes
#_0EBFFA: db $2F, $2E, $25, $2D, $2E, $2B, $1E, $2C
#_0EC002: db $9F, $2B, $2E, $25, $1E, $9F, $2D, $21
#_0EC00A: db $1E, $9F, $1D, $1E, $2C, $1E, $2B, $2D

; TOP: DESERT PALACE
#_0EC012: dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
#_0EC016: db $60, $61, $6F, $61, $6E, $70, $9F, $6C
#_0EC01E: db $5D, $68, $5D, $5F, $61

; BOTTOM: DESERT PALACE
#_0EC023: dw $0963, $1900 ; VRAM $C612 | 26 bytes
#_0EC027: db $86, $87, $95, $87, $94, $96, $9F, $92
#_0EC02F: db $83, $8E, $83, $85, $87

;---------------------------------------------------------------------------------------------------

.chargfx_hera
; SMALL: THE BULLY MAKES A FRIEND
#_0EC034: dw $6462, $2F00 ; VRAM $C4C8 | 48 bytes
#_0EC038: db $2D, $21, $1E, $9F, $1B, $2E, $25, $25
#_0EC040: db $32, $9F, $26, $1A, $24, $1E, $2C, $9F
#_0EC048: db $1A, $9F, $1F, $2B, $22, $1E, $27, $1D

; TOP: MOUNTAIN TOWER
#_0EC050: dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
#_0EC054: db $69, $6B, $71, $6A, $70, $5D, $65, $6A
#_0EC05C: db $9F, $70, $6B, $73, $61, $6E

; BOTTOM: MOUNTAIN TOWER
#_0EC062: dw $0963, $1B00 ; VRAM $C612 | 28 bytes
#_0EC066: db $8F, $91, $97, $90, $96, $83, $8B, $90
#_0EC06E: db $9F, $96, $91, $99, $87, $94

;---------------------------------------------------------------------------------------------------

.chargfx_house
; SMALL: YOUR UNCLE RECOVERS
#_0EC074: dw $6662, $2500 ; VRAM $C4CC | 38 bytes
#_0EC078: db $32, $28, $2E, $2B, $9F, $2E, $27, $1C
#_0EC080: db $25, $1E, $9F, $2B, $1E, $1C, $28, $2F
#_0EC088: db $1E, $2B, $2C

; TOP: YOUR HOUSE
#_0EC08B: dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
#_0EC08F: db $75, $6B, $71, $6E, $9F, $64, $6B, $71
#_0EC097: db $6F, $61

; BOTTOM: YOUR HOUSE
#_0EC099: dw $0B63, $1300 ; VRAM $C616 | 20 bytes
#_0EC09D: db $9B, $91, $97, $94, $9F, $8A, $91, $97
#_0EC0A5: db $95, $87

;---------------------------------------------------------------------------------------------------

.chargfx_zora
; SMALL: FLIPPERS FOR SALE
#_0EC0A7: dw $6662, $2100 ; VRAM $C4CC | 34 bytes
#_0EC0AB: db $1F, $25, $22, $29, $29, $1E, $2B, $2C
#_0EC0B3: db $9F, $1F, $28, $2B, $9F, $2C, $1A, $25
#_0EC0BB: db $1E

; TOP: ZORA'S WATERFALL
#_0EC0BC: dw $E862, $1F00 ; VRAM $C5D0 | 32 bytes
#_0EC0C0: db $76, $6B, $6E, $5D, $77, $6F, $9F, $73
#_0EC0C8: db $5D, $70, $61, $6E, $62, $5D, $68, $68

; BOTTOM: ZORA'S WATERFALL
#_0EC0D0: dw $0863, $1F00 ; VRAM $C610 | 32 bytes
#_0EC0D4: db $9C, $91, $94, $83, $9D, $95, $9F, $99
#_0EC0DC: db $83, $96, $87, $94, $88, $83, $8E, $8E

;---------------------------------------------------------------------------------------------------

.chargfx_witch
; SMALL: THE WITCH AND ASSISTANT
#_0EC0E4: dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
#_0EC0E8: db $2D, $21, $1E, $9F, $30, $22, $2D, $1C
#_0EC0F0: db $21, $9F, $1A, $27, $1D, $9F, $1A, $2C
#_0EC0F8: db $2C, $22, $2C, $2D, $1A, $27, $2D

; TOP: MAGIC SHOP
#_0EC0FF: dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
#_0EC103: db $69, $5D, $63, $65, $5F, $9F, $6F, $64
#_0EC10B: db $6B, $6C

; BOTTOM: MAGIC SHOP
#_0EC10D: dw $0B63, $1300 ; VRAM $C616 | 20 bytes
#_0EC111: db $8F, $83, $89, $8B, $85, $9F, $95, $8A
#_0EC119: db $91, $92

;---------------------------------------------------------------------------------------------------

.chargfx_lumberjack
; SMALL: TWIN LUMBERJACKS
#_0EC11B: dw $6862, $1F00 ; VRAM $C4D0 | 32 bytes
#_0EC11F: db $2D, $30, $22, $27, $9F, $25, $2E, $26
#_0EC127: db $1B, $1E, $2B, $23, $1A, $1C, $24, $2C

; TOP: WOODSMEN'S HUT
#_0EC12F: dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
#_0EC133: db $73, $6B, $6B, $60, $6F, $69, $61, $6A
#_0EC13B: db $77, $6F, $9F, $64, $71, $70

; BOTTOM: WOODSMEN'S HUT
#_0EC141: dw $0963, $1B00 ; VRAM $C612 | 28 bytes
#_0EC145: db $99, $91, $91, $86, $95, $8F, $87, $90
#_0EC14D: db $9D, $95, $9F, $8A, $97, $96

;---------------------------------------------------------------------------------------------------

.chargfx_grove
; SMALL: FLUTE BOY PLAYS AGAIN
#_0EC153: dw $6462, $2900 ; VRAM $C4C8 | 42 bytes
#_0EC157: db $1F, $25, $2E, $2D, $1E, $9F, $1B, $28
#_0EC15F: db $32, $9F, $29, $25, $1A, $32, $2C, $9F
#_0EC167: db $1A, $20, $1A, $22, $27

; TOP: HAUNTED GROVE
#_0EC16C: dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
#_0EC170: db $64, $5D, $71, $6A, $70, $61, $60, $9F
#_0EC178: db $63, $6E, $6B, $72, $61

; BOTTOM: HAUNTED GROVE
#_0EC17D: dw $0963, $1900 ; VRAM $C612 | 26 bytes
#_0EC181: db $8A, $83, $97, $90, $96, $87, $86, $9F
#_0EC189: db $89, $94, $91, $98, $87

;---------------------------------------------------------------------------------------------------

.chargfx_venus
; SMALL: VENUS. QUEEN OF FAERIES
#_0EC18E: dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
#_0EC192: db $2F, $1E, $27, $2E, $2C, $37, $9F, $2A
#_0EC19A: db $2E, $1E, $1E, $27, $9F, $28, $1F, $9F
#_0EC1A2: db $1F, $1A, $1E, $2B, $22, $1E, $2C

; TOP: WISHING WELL
#_0EC1A9: dw $EA62, $1700 ; VRAM $C5D4 | 24 bytes
#_0EC1AD: db $73, $65, $6F, $64, $65, $6A, $63, $9F
#_0EC1B5: db $73, $61, $68, $68

; BOTTOM: WISHING WELL
#_0EC1B9: dw $0A63, $1700 ; VRAM $C614 | 24 bytes
#_0EC1BD: db $99, $8B, $95, $8A, $8B, $90, $89, $9F
#_0EC1C5: db $99, $87, $8E, $8E

;---------------------------------------------------------------------------------------------------

.chargfx_smithy
; SMALL: THE DWARVEN SWORDSMITHS
#_0EC1C9: dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
#_0EC1CD: db $2D, $21, $1E, $9F, $1D, $30, $1A, $2B
#_0EC1D5: db $2F, $1E, $27, $9F, $2C, $30, $28, $2B
#_0EC1DD: db $1D, $2C, $26, $22, $2D, $21, $2C

; TOP: SMITHERY
#_0EC1E4: dw $EC62, $0F00 ; VRAM $C5D8 | 16 bytes
#_0EC1E8: db $6F, $69, $65, $70, $64, $61, $6E, $75

; BOTTOM: SMITHERY
#_0EC1F0: dw $0C63, $0F00 ; VRAM $C618 | 16 bytes
#_0EC1F4: db $95, $8F, $8B, $96, $8A, $87, $94, $9B

;---------------------------------------------------------------------------------------------------

.chargfx_kak2
; SMALL: THE BUG-CATCHING KID
#_0EC1FC: dw $6662, $2700 ; VRAM $C4CC | 40 bytes
#_0EC200: db $2D, $21, $1E, $9F, $1B, $2E, $20, $36
#_0EC208: db $1C, $1A, $2D, $1C, $21, $22, $27, $20
#_0EC210: db $9F, $24, $22, $1D

; TOP: KAKARIKO TOWN
#_0EC214: dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
#_0EC218: db $67, $5D, $67, $5D, $6E, $65, $67, $6B
#_0EC220: db $9F, $70, $6B, $73, $6A

; BOTTOM: KAKARIKO TOWN
#_0EC225: dw $0963, $1900 ; VRAM $C612 | 26 bytes
#_0EC229: db $8D, $83, $8D, $83, $94, $8B, $8D, $91
#_0EC231: db $9F, $96, $91, $99, $90

;---------------------------------------------------------------------------------------------------

.chargfx_deathmountain
; SMALL: THE LOST OLD MAN
#_0EC236: dw $4862, $1F00 ; VRAM $C490 | 32 bytes
#_0EC23A: db $2D, $21, $1E, $9F, $25, $28, $2C, $2D
#_0EC242: db $9F, $28, $25, $1D, $9F, $26, $1A, $27

; TOP: DEATH MOUNTAIN
#_0EC24A: dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
#_0EC24E: db $60, $61, $5D, $70, $64, $9F, $69, $6B
#_0EC256: db $71, $6A, $70, $5D, $65, $6A

; BOTTOM: DEATH MOUNTAIN
#_0EC25C: dw $0963, $1B00 ; VRAM $C612 | 28 bytes
#_0EC260: db $86, $87, $83, $96, $8A, $9F, $8F, $91
#_0EC268: db $97, $90, $96, $83, $8B, $90

;---------------------------------------------------------------------------------------------------

.chargfx_lostwoods
; SMALL: THE FOREST THIEF
#_0EC26E: dw $6862, $1F00 ; VRAM $C4D0 | 32 bytes
#_0EC272: db $2D, $21, $1E, $9F, $1F, $28, $2B, $1E
#_0EC27A: db $2C, $2D, $9F, $2D, $21, $22, $1E, $1F

; TOP: LOST WOODS
#_0EC282: dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
#_0EC286: db $68, $6B, $6F, $70, $9F, $73, $6B, $6B
#_0EC28E: db $60, $6F

; BOTTOM: LOST WOODS
#_0EC290: dw $0B63, $1300 ; VRAM $C616 | 20 bytes
#_0EC294: db $8E, $91, $95, $96, $9F, $99, $91, $91
#_0EC29C: db $86, $95

;---------------------------------------------------------------------------------------------------

.chargfx_pedestal
; SMALL: AND THE MASTER SWORD
#_0EC29E: dw $6662, $2700 ; VRAM $C4CC | 40 bytes
#_0EC2A2: db $1A, $27, $1D, $9F, $2D, $21, $1E, $9F
#_0EC2AA: db $26, $1A, $2C, $2D, $1E, $2B, $9F, $2C
#_0EC2B2: db $30, $28, $2B, $1D

; SMALL: SLEEPS AGAIN...
#_0EC2B6: dw $A862, $1D00 ; VRAM $C550 | 30 bytes
#_0EC2BA: db $4A, $43, $3C, $3C, $47, $4A, $9F, $38
#_0EC2C2: db $3E, $38, $40, $45, $52, $52, $52

; TOP: FOREVER!
#_0EC2C9: dw $EC62, $0F00 ; VRAM $C5D8 | 16 bytes
#_0EC2CD: db $62, $6B, $6E, $61, $72, $61, $6E, $78

; BOTTOM: FOREVER!
#_0EC2D5: dw $0C63, $0F00 ; VRAM $C618 | 16 bytes
#_0EC2D9: db $88, $91, $94, $87, $98, $87, $94, $9E

;---------------------------------------------------------------------------------------------------

.offset
#_0EC2E1: dw .chargfx_castle-.chargfx        ; $0000
#_0EC2E3: dw .chargfx_sanc-.chargfx          ; $003C
#_0EC2E5: dw .chargfx_kak1-.chargfx          ; $0068
#_0EC2E7: dw .chargfx_desert-.chargfx        ; $00AA
#_0EC2E9: dw .chargfx_hera-.chargfx          ; $00E8
#_0EC2EB: dw .chargfx_house-.chargfx         ; $0128
#_0EC2ED: dw .chargfx_zora-.chargfx          ; $015B
#_0EC2EF: dw .chargfx_witch-.chargfx         ; $0198
#_0EC2F1: dw .chargfx_lumberjack-.chargfx    ; $01CF
#_0EC2F3: dw .chargfx_grove-.chargfx         ; $0207
#_0EC2F5: dw .chargfx_venus-.chargfx         ; $0242
#_0EC2F7: dw .chargfx_smithy-.chargfx        ; $027D
#_0EC2F9: dw .chargfx_kak2-.chargfx          ; $02B0
#_0EC2FB: dw .chargfx_deathmountain-.chargfx ; $02EA
#_0EC2FD: dw .chargfx_lostwoods-.chargfx     ; $0322
#_0EC2FF: dw .chargfx_pedestal-.chargfx      ; $0352
#_0EC301: dw .offset-.chargfx                ; $0395

pool off

;---------------------------------------------------------------------------------------------------

Credits_AddEndingSequenceText:
#_0EC303: PHB
#_0EC304: PHK
#_0EC305: PLB

#_0EC306: REP #$30

#_0EC308: LDA.w #$0060 ; VRAM $C000
#_0EC30B: STA.w $1002

#_0EC30E: LDA.w #$FE47
#_0EC311: STA.w $1004

#_0EC314: LDA.w CreditsBlankFillTile
#_0EC317: STA.w $1006

#_0EC31A: LDA.b $11
#_0EC31C: AND.w #$00FE
#_0EC31F: TAY

#_0EC320: LDA.w .offset+2,Y
#_0EC323: STA.b $04

#_0EC325: LDA.w .offset+0,Y
#_0EC328: TAY

;---------------------------------------------------------------------------------------------------

#_0EC329: LDX.w #$0000

.next_stripe
#_0EC32C: LDA.w .chargfx,Y
#_0EC32F: STA.w $1008,X

#_0EC332: INY
#_0EC333: INY

#_0EC334: INX
#_0EC335: INX

#_0EC336: LDA.w .chargfx,Y
#_0EC339: STA.w $1008,X

#_0EC33C: XBA
#_0EC33D: AND.w #$00FF
#_0EC340: LSR A
#_0EC341: STA.b $00

#_0EC343: INY
#_0EC344: INY

#_0EC345: INX
#_0EC346: INX

#_0EC347: STY.b $02

;---------------------------------------------------------------------------------------------------

.next_character
#_0EC349: LDY.b $02

#_0EC34B: LDA.w .chargfx,Y
#_0EC34E: AND.w #$00FF
#_0EC351: ASL A
#_0EC352: TAY

#_0EC353: LDA.w Credits_CharacterToTile,Y
#_0EC356: STA.w $1008,X

#_0EC359: INC.b $02

#_0EC35B: INX
#_0EC35C: INX

#_0EC35D: DEC.b $00
#_0EC35F: BPL .next_character

;---------------------------------------------------------------------------------------------------

#_0EC361: LDY.b $02
#_0EC363: CPY.b $04
#_0EC365: BNE .next_stripe

;---------------------------------------------------------------------------------------------------

#_0EC367: TXA
#_0EC368: CLC
#_0EC369: ADC.w #$0006
#_0EC36C: STA.w $1000

#_0EC36F: SEP #$30

#_0EC371: LDA.b #$FF
#_0EC373: STA.w $1008,X

#_0EC376: LDA.b #$01
#_0EC378: STA.b $14

#_0EC37A: PLB

#_0EC37B: RTS

;===================================================================================================

Credits_BrightenTriangles:
#_0EC37C: LDA.b $1A
#_0EC37E: AND.b #$0F
#_0EC380: BNE Credits_AnimateTheTriangles_bounce

#_0EC382: INC.b $13

#_0EC384: LDA.b $13
#_0EC386: CMP.b #$0F
#_0EC388: BNE Credits_AnimateTheTriangles_bounce

#_0EC38A: INC.b $11

;===================================================================================================

Credits_AnimateTheTriangles_bounce:
#_0EC38C: JSL Credits_AnimateTheTriangles

#_0EC390: RTS

;===================================================================================================

Credits_StopCreditsScroll:
#_0EC391: DEC.b $C8
#_0EC393: BNE .delay

#_0EC395: REP #$20

#_0EC397: STZ.w $0AA6

#_0EC39A: LDA.w #$0000
#_0EC39D: STA.l $7EC009
#_0EC3A1: STA.l $7EC007

#_0EC3A5: LDA.w #$001F
#_0EC3A8: STA.l $7EC00B

#_0EC3AC: SEP #$20

#_0EC3AE: INC.b $11

#_0EC3B0: LDA.b #$C0
#_0EC3B2: STA.b $C8

#_0EC3B4: STZ.b $CA

.delay
#_0EC3B6: BRA Credits_AnimateTheTriangles_bounce

;===================================================================================================

#Credits_FadeAndDisperseTriangles:
#_0EC3B8: DEC.b $C8

#_0EC3BA: LDA.b $CA
#_0EC3BC: BNE .skip_filter

#_0EC3BE: JSL ApplyPaletteFilter

#_0EC3C2: LDA.l $7EC007
#_0EC3C6: BNE .delay

#_0EC3C8: INC.b $CA

.skip_filter
#_0EC3CA: LDA.b $C8
#_0EC3CC: BNE .delay

#_0EC3CE: INC.b $11

#_0EC3D0: JSL PaletteFilter_TheEndSprite

#_0EC3D4: RTS

;===================================================================================================

Credits_FadeInTheEnd:
#_0EC3D5: LDA.b $1A
#_0EC3D7: AND.b #$07
#_0EC3D9: BNE .delay

#_0EC3DB: JSL PaletteFilter_SP5F

#_0EC3DF: LDA.l $7EC007
#_0EC3E3: BNE .delay

#_0EC3E5: INC.b $11

.delay
#_0EC3E7: JMP.w Credits_DrawTheEnd

;===================================================================================================

pool Credits_DrawTheEnd

.oam_data
#_0EC3EA: db $A0, $B8, $00, $3B
#_0EC3EE: db $B0, $B8, $02, $3B
#_0EC3F2: db $C0, $B8, $04, $3B
#_0EC3F6: db $D0, $B8, $06, $3B

pool off

;---------------------------------------------------------------------------------------------------

Credits_DrawTheEnd:
#_0EC3FA: REP #$20

#_0EC3FC: LDX.b #$0E

.copy_next
#_0EC3FE: LDA.l .oam_data,X
#_0EC402: STA.w $0800,X

#_0EC405: DEX
#_0EC406: DEX
#_0EC407: BPL .copy_next

#_0EC409: SEP #$20

#_0EC40B: LDA.b #$02
#_0EC40D: STA.w $0A20
#_0EC410: STA.w $0A21
#_0EC413: STA.w $0A22
#_0EC416: STA.w $0A23

#_0EC419: RTS

;===================================================================================================

Credits_HangForever:
#_0EC41A: BRA Credits_DrawTheEnd

;===================================================================================================
; FREE ROM: 0x24
;===================================================================================================
NULL_0EC41C:
#_0EC41C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EC424: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EC42C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EC434: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EC43C: db $FF, $FF, $FF, $FF

;===================================================================================================

RenderText:
#Module0E_02_RenderText:
#_0EC440: PHB
#_0EC441: PHK
#_0EC442: PLB

#_0EC443: JSR .main

#_0EC446: PLB
#_0EC447: RTL

;---------------------------------------------------------------------------------------------------

.main
#_0EC448: LDA.w $1CD8
#_0EC44B: JSL JumpTableLocal
#_0EC44F: dw RenderText_Initialize
#_0EC451: dw RenderText_Draw
#_0EC453: dw RenderText_PostDeathSaveOptions

;===================================================================================================

RenderText_PostDeathSaveOptions:
#_0EC455: LDA.b #$03 ; MESSAGE 0003
#_0EC457: STA.w $1CF0

#_0EC45A: LDA.b #$00
#_0EC45C: STA.w $1CF1

#_0EC45F: LDX.b #$00
#_0EC461: JSR RenderText_Initialize_IgnoreAttract

#_0EC464: LDA.b #$E8
#_0EC466: STA.w $1CD2

#_0EC469: LDA.b #$61
#_0EC46B: STA.w $1CD3

#_0EC46E: LDA.b #$02
#_0EC470: STA.w $1CD4

#_0EC473: JSR RenderText_Draw
#_0EC476: JSR RenderText_Draw
#_0EC479: JSR RenderText_Draw
#_0EC47C: JSR RenderText_Draw
#_0EC47F: JSR RenderText_Draw

#_0EC482: RTS

;===================================================================================================

RenderText_Initialize:
#_0EC483: LDA.b $10
#_0EC485: CMP.b #$14
#_0EC487: BNE .not_attract_mode

#_0EC489: JSL ResetHUDPalettes4and5

.not_attract_mode
#_0EC48D: JSL Attract_DecompressStoryGFX

#_0EC491: LDX.b #$00

;===================================================================================================

RenderText_Initialize_IgnoreAttract:
#_0EC493: LDA.w RenderText_InitialSettings,X
#_0EC496: STA.w $1CD0,X

#_0EC499: INX
#_0EC49A: CPX.b #$20
#_0EC49C: BCC RenderText_Initialize_IgnoreAttract

;---------------------------------------------------------------------------------------------------

#_0EC49E: JSR RenderText_InitializeVWF
#_0EC4A1: JSR RenderText_SetDefaultWindowPosition

#_0EC4A4: REP #$30

#_0EC4A6: LDA.w #$387F
#_0EC4A9: AND.w #$FF00
#_0EC4AC: ORA.w #$0180
#_0EC4AF: STA.w $1CE2

#_0EC4B2: SEP #$30

#_0EC4B4: JSR RenderText_ParseMessage
#_0EC4B7: JSR RenderText_EmptyBuffer

#_0EC4BA: REP #$30

#_0EC4BC: STZ.w $1CD9

#_0EC4BF: SEP #$30

#_0EC4C1: LDA.b #$02
#_0EC4C3: STA.b $17
#_0EC4C5: STA.w $0710

#_0EC4C8: RTS

;===================================================================================================

RenderText_InitializeVWF:
#_0EC4C9: STZ.w $0722
#_0EC4CC: STZ.w $0723
#_0EC4CF: STZ.w $0720
#_0EC4D2: STZ.w $0721

#_0EC4D5: STZ.w $0724
#_0EC4D8: STZ.w $0725
#_0EC4DB: STZ.w $0726
#_0EC4DE: STZ.w $0727

#_0EC4E1: RTS

;===================================================================================================

RenderText_ParseMessage:
#_0EC4E2: REP #$30

#_0EC4E4: LDA.w $1CF0
#_0EC4E7: ASL A
#_0EC4E8: ADC.w $1CF0
#_0EC4EB: TAX

#_0EC4EC: LDA.l $7F71C0,X
#_0EC4F0: STA.b $04

#_0EC4F2: LDA.l $7F71C2,X
#_0EC4F6: STA.b $06

#_0EC4F8: LDA.w #$7F7F ; initialize with a terminater for failsafe
#_0EC4FB: STA.l $7F1200

#_0EC4FF: LDY.w #$0000
#_0EC502: TYX

#_0EC503: STY.w $1CD9
#_0EC506: STY.w $1CDD

#_0EC509: SEP #$20

;---------------------------------------------------------------------------------------------------

.next_byte
#_0EC50B: LDA.b [$04],Y
#_0EC50D: BMI .word_lookup

#_0EC50F: CMP.b #$67
#_0EC511: BCS .command

#_0EC513: STA.l $7F1200,X

#_0EC517: INY
#_0EC518: STY.w $1CDD

#_0EC51B: INX
#_0EC51C: STX.w $1CD9

#_0EC51F: BRA .next_byte

;---------------------------------------------------------------------------------------------------

.command
#_0EC521: CMP.b #$7F
#_0EC523: BEQ .end_of_message

#_0EC525: JSR RenderText_ExecuteCommand

#_0EC528: LDX.w $1CD9
#_0EC52B: LDY.w $1CDD
#_0EC52E: BRA .next_byte

.word_lookup
#_0EC530: SEC
#_0EC531: SBC.b #$88
#_0EC533: JSR RenderText_LookupWord

#_0EC536: LDX.w $1CD9
#_0EC539: LDY.w $1CDD
#_0EC53C: BRA .next_byte

.end_of_message
#_0EC53E: LDA.b #$7F
#_0EC540: STA.l $7F1200,X

#_0EC544: SEP #$30

#_0EC546: RTS

;---------------------------------------------------------------------------------------------------

RenderText_ExecuteCommand:
#_0EC547: SEP #$31

#_0EC549: SBC.b #$67
#_0EC54B: JSL JumpTableLocal
#_0EC54F: dw ParseText_IgnoreCommand         ; 0x67
#_0EC551: dw ParseText_IgnoreCommand         ; 0x68
#_0EC553: dw ParseText_IgnoreCommand         ; 0x69
#_0EC555: dw ParseText_WritePlayerName       ; 0x6A
#_0EC557: dw ParseText_SetWindowType         ; 0x6B
#_0EC559: dw ParseText_WriteBCD              ; 0x6C
#_0EC55B: dw ParseText_SetWindowPosition     ; 0x6D
#_0EC55D: dw ParseText_IgnoreParameter       ; 0x6E
#_0EC55F: dw ParseText_IgnoreCommand         ; 0x6F
#_0EC561: dw ParseText_IgnoreCommand         ; 0x70
#_0EC563: dw ParseText_IgnoreCommand         ; 0x71
#_0EC565: dw ParseText_IgnoreCommand         ; 0x72
#_0EC567: dw ParseText_IgnoreCommand         ; 0x73
#_0EC569: dw ParseText_IgnoreCommand         ; 0x74
#_0EC56B: dw ParseText_IgnoreCommand         ; 0x75
#_0EC56D: dw ParseText_IgnoreCommand         ; 0x76
#_0EC56F: dw ParseText_SetColor              ; 0x77
#_0EC571: dw ParseText_IgnoreParameter       ; 0x78
#_0EC573: dw ParseText_IgnoreParameter       ; 0x79
#_0EC575: dw ParseText_IgnoreParameter       ; 0x7A
#_0EC577: dw ParseText_IgnoreCommand         ; 0x7B
#_0EC579: dw ParseText_IgnoreCommand         ; 0x7C
#_0EC57B: dw ParseText_IgnoreCommand         ; 0x7D
#_0EC57D: dw ParseText_IgnoreCommand         ; 0x7E
#_0EC57F: dw ParseText_IgnoreCommand         ; 0x7F

;===================================================================================================

ParseText_IgnoreCommand:
#_0EC581: REP #$10

#_0EC583: LDX.w $1CD9
#_0EC586: LDY.w $1CDD

#_0EC589: LDA.b [$04],Y
#_0EC58B: STA.l $7F1200,X

#_0EC58F: INY

#_0EC590: INX
#_0EC591: STX.w $1CD9

#_0EC594: STY.w $1CDD

#_0EC597: RTS

;===================================================================================================

ParseText_IgnoreParameter:
#_0EC598: REP #$30

#_0EC59A: LDX.w $1CD9
#_0EC59D: LDY.w $1CDD

#_0EC5A0: LDA.b [$04],Y
#_0EC5A2: STA.l $7F1200,X

#_0EC5A6: INY
#_0EC5A7: INY

#_0EC5A8: INX
#_0EC5A9: INX
#_0EC5AA: STX.w $1CD9

#_0EC5AD: STY.w $1CDD

#_0EC5B0: SEP #$20

#_0EC5B2: RTS

;===================================================================================================

ParseText_WritePlayerName:
#_0EC5B3: REP #$30

#_0EC5B5: LDA.l $701FFE
#_0EC5B9: TAX

#_0EC5BA: LDA.l SaveFileOffsets,X
#_0EC5BE: TAX

#_0EC5BF: LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.not_terminator_a
#_0EC5C2: LDA.l $7003D9,X
#_0EC5C6: PHA

#_0EC5C7: AND.w #$000F
#_0EC5CA: STA.w $0008,Y

#_0EC5CD: PLA
#_0EC5CE: LSR A
#_0EC5CF: AND.w #$FFF0
#_0EC5D2: ORA.w $0008,Y
#_0EC5D5: STA.w $0008,Y

#_0EC5D8: INX
#_0EC5D9: INX

#_0EC5DA: INY
#_0EC5DB: CPY.w #$0006
#_0EC5DE: BCC .not_terminator_a

;---------------------------------------------------------------------------------------------------

#_0EC5E0: SEP #$20

#_0EC5E2: LDY.w #$0000

.not_terminator_b
#_0EC5E5: LDA.w $0008,Y
#_0EC5E8: JSR RenderText_FilterName
#_0EC5EB: STA.w $0008,Y

#_0EC5EE: INY
#_0EC5EF: CPY.w #$0006
#_0EC5F2: BCC .not_terminator_b

;---------------------------------------------------------------------------------------------------

#_0EC5F4: REP #$30

#_0EC5F6: LDA.w $1CD9
#_0EC5F9: CLC
#_0EC5FA: ADC.w #$0006
#_0EC5FD: TAX

#_0EC5FE: INC.w $1CDD

#_0EC601: SEP #$20

#_0EC603: LDA.b $08
#_0EC605: STA.l $7F11FA,X

#_0EC609: LDA.b $09
#_0EC60B: STA.l $7F11FB,X

#_0EC60F: LDA.b $0A
#_0EC611: STA.l $7F11FC,X

#_0EC615: LDA.b $0B
#_0EC617: STA.l $7F11FD,X

#_0EC61B: LDA.b $0C
#_0EC61D: STA.l $7F11FE,X

#_0EC621: LDA.b $0D
#_0EC623: STA.l $7F11FF,X

;---------------------------------------------------------------------------------------------------

#_0EC627: LDY.w #$0005

.next
#_0EC62A: LDA.w $0008,Y
#_0EC62D: CMP.b #$59
#_0EC62F: BNE .done

#_0EC631: DEX

#_0EC632: DEY
#_0EC633: BPL .next

;---------------------------------------------------------------------------------------------------

.done
#_0EC635: STX.w $1CD9

#_0EC638: RTS

;===================================================================================================

RenderText_FilterName:
#_0EC639: CMP.b #$5F ; legit characters
#_0EC63B: BCC .exit

#_0EC63D: CMP.b #$76
#_0EC63F: BCS .encode_lower

#_0EC641: CMP.b #$5F
#_0EC643: BNE .not_this

#_0EC645: LDA.b #$08 ; uppercase I

.not_this
#_0EC647: CMP.b #$60
#_0EC649: BNE .nor_this

#_0EC64B: LDA.b #$22 ; lowercase i

.nor_this
#_0EC64D: CMP.b #$61
#_0EC64F: BNE .exit

#_0EC651: LDA.b #$3E ; exclamation point !

.exit
#_0EC653: RTS

.encode_lower
#_0EC654: SBC.b #$42

#_0EC656: RTS

;===================================================================================================

ParseText_SetWindowType:
#_0EC657: REP #$10

#_0EC659: LDY.w $1CDD
#_0EC65C: INY

#_0EC65D: LDA.b [$04],Y
#_0EC65F: STA.w $1CD4

#_0EC662: INY
#_0EC663: STY.w $1CDD

#_0EC666: RTS

;===================================================================================================

ParseText_WriteBCD:
#_0EC667: REP #$30

#_0EC669: LDX.w $1CD9
#_0EC66C: LDY.w $1CDD

#_0EC66F: LDA.b [$04],Y

#_0EC671: INY
#_0EC672: INY
#_0EC673: STY.w $1CDD

#_0EC676: XBA
#_0EC677: AND.w #$00FF
#_0EC67A: LSR A
#_0EC67B: PHP

#_0EC67C: TAY
#_0EC67D: LDA.w $1CF2,Y

#_0EC680: PLP
#_0EC681: BCC .low_nibble

#_0EC683: LSR A
#_0EC684: LSR A
#_0EC685: LSR A
#_0EC686: LSR A

.low_nibble
#_0EC687: AND.w #$000F
#_0EC68A: CLC
#_0EC68B: ADC.w #$0004
#_0EC68E: ORA.w #$0030
#_0EC691: STA.l $7F1200,X

#_0EC695: INX
#_0EC696: STX.w $1CD9

#_0EC699: SEP #$20

#_0EC69B: RTS

;===================================================================================================

ParseText_SetWindowPosition:
#_0EC69C: REP #$30

#_0EC69E: LDY.w $1CDD
#_0EC6A1: INY

#_0EC6A2: LDA.b [$04],Y
#_0EC6A4: AND.w #$00FF
#_0EC6A7: ASL A
#_0EC6A8: TAX

#_0EC6A9: LDA.w RenderText_TextPosition,X

#_0EC6AC: STA.w $1CD2

#_0EC6AF: INY
#_0EC6B0: STY.w $1CDD

#_0EC6B3: SEP #$20

#_0EC6B5: RTS

;===================================================================================================

ParseText_SetColor:
#_0EC6B6: REP #$30

#_0EC6B8: LDY.w $1CDD

#_0EC6BB: LDA.b [$04],Y
#_0EC6BD: ASL A
#_0EC6BE: ASL A
#_0EC6BF: AND.w #$3C00
#_0EC6C2: STA.b $00

#_0EC6C4: LDA.w #$387F
#_0EC6C7: AND.w #$E300
#_0EC6CA: ORA.w #$0180
#_0EC6CD: ORA.b $00
#_0EC6CF: STA.w $1CE2

#_0EC6D2: INY
#_0EC6D3: INY
#_0EC6D4: STY.w $1CDD

#_0EC6D7: SEP #$20

#_0EC6D9: RTS

;===================================================================================================

RenderText_LookupWord:
#_0EC6DA: REP #$30

#_0EC6DC: INC.w $1CDD

#_0EC6DF: LDX.w $1CD9
#_0EC6E2: ASL A
#_0EC6E3: AND.w #$00FF
#_0EC6E6: TAY

#_0EC6E7: LDA.w WordDictionary+2,Y
#_0EC6EA: STA.b $00

#_0EC6EC: LDA.w WordDictionary+0,Y
#_0EC6EF: TAY

#_0EC6F0: SEP #$20

;---------------------------------------------------------------------------------------------------

.next
#_0EC6F2: LDA.w $0000,Y
#_0EC6F5: STA.l $7F1200,X

#_0EC6F9: INX

#_0EC6FA: INY
#_0EC6FB: CPY.b $00
#_0EC6FD: BCC .next

;---------------------------------------------------------------------------------------------------

#_0EC6FF: STX.w $1CD9

#_0EC702: RTS

;===================================================================================================

WordDictionary:
#_0EC703: dw .entry_00
#_0EC705: dw .entry_01
#_0EC707: dw .entry_02
#_0EC709: dw .entry_03
#_0EC70B: dw .entry_04
#_0EC70D: dw .entry_05
#_0EC70F: dw .entry_06
#_0EC711: dw .entry_07
#_0EC713: dw .entry_08
#_0EC715: dw .entry_09
#_0EC717: dw .entry_0A
#_0EC719: dw .entry_0B
#_0EC71B: dw .entry_0C
#_0EC71D: dw .entry_0D
#_0EC71F: dw .entry_0E
#_0EC721: dw .entry_0F
#_0EC723: dw .entry_10
#_0EC725: dw .entry_11
#_0EC727: dw .entry_12
#_0EC729: dw .entry_13
#_0EC72B: dw .entry_14
#_0EC72D: dw .entry_15
#_0EC72F: dw .entry_16
#_0EC731: dw .entry_17
#_0EC733: dw .entry_18
#_0EC735: dw .entry_19
#_0EC737: dw .entry_1A
#_0EC739: dw .entry_1B
#_0EC73B: dw .entry_1C
#_0EC73D: dw .entry_1D
#_0EC73F: dw .entry_1E
#_0EC741: dw .entry_1F
#_0EC743: dw .entry_20
#_0EC745: dw .entry_21
#_0EC747: dw .entry_22
#_0EC749: dw .entry_23
#_0EC74B: dw .entry_24
#_0EC74D: dw .entry_25
#_0EC74F: dw .entry_26
#_0EC751: dw .entry_27
#_0EC753: dw .entry_28
#_0EC755: dw .entry_29
#_0EC757: dw .entry_2A
#_0EC759: dw .entry_2B
#_0EC75B: dw .entry_2C
#_0EC75D: dw .entry_2D
#_0EC75F: dw .entry_2E
#_0EC761: dw .entry_2F
#_0EC763: dw .entry_30
#_0EC765: dw .entry_31
#_0EC767: dw .entry_32
#_0EC769: dw .entry_33
#_0EC76B: dw .entry_34
#_0EC76D: dw .entry_35
#_0EC76F: dw .entry_36
#_0EC771: dw .entry_37
#_0EC773: dw .entry_38
#_0EC775: dw .entry_39
#_0EC777: dw .entry_3A
#_0EC779: dw .entry_3B
#_0EC77B: dw .entry_3C
#_0EC77D: dw .entry_3D
#_0EC77F: dw .entry_3E
#_0EC781: dw .entry_3F
#_0EC783: dw .entry_40
#_0EC785: dw .entry_41
#_0EC787: dw .entry_42
#_0EC789: dw .entry_43
#_0EC78B: dw .entry_44
#_0EC78D: dw .entry_45
#_0EC78F: dw .entry_46
#_0EC791: dw .entry_47
#_0EC793: dw .entry_48
#_0EC795: dw .entry_49
#_0EC797: dw .entry_4A
#_0EC799: dw .entry_4B
#_0EC79B: dw .entry_4C
#_0EC79D: dw .entry_4D
#_0EC79F: dw .entry_4E
#_0EC7A1: dw .entry_4F
#_0EC7A3: dw .entry_50
#_0EC7A5: dw .entry_51
#_0EC7A7: dw .entry_52
#_0EC7A9: dw .entry_53
#_0EC7AB: dw .entry_54
#_0EC7AD: dw .entry_55
#_0EC7AF: dw .entry_56
#_0EC7B1: dw .entry_57
#_0EC7B3: dw .entry_58
#_0EC7B5: dw .entry_59
#_0EC7B7: dw .entry_5A
#_0EC7B9: dw .entry_5B
#_0EC7BB: dw .entry_5C
#_0EC7BD: dw .entry_5D
#_0EC7BF: dw .entry_5E
#_0EC7C1: dw .entry_5F
#_0EC7C3: dw .entry_60
#_0EC7C5: dw .end

;---------------------------------------------------------------------------------------------------

.entry_00
#_0EC7C7: db $59, $59, $59, $59 ; ⎵⎵⎵⎵

.entry_01
#_0EC7CB: db $59, $59, $59 ; ⎵⎵⎵

.entry_02
#_0EC7CE: db $59, $59 ; ⎵⎵

.entry_03
#_0EC7D0: db $51, $2C, $59 ; 's⎵

.entry_04
#_0EC7D3: db $1A, $27, $1D, $59 ; and⎵

.entry_05
#_0EC7D7: db $1A, $2B, $1E, $59 ; are⎵

.entry_06
#_0EC7DB: db $1A, $25, $25, $59 ; all⎵

.entry_07
#_0EC7DF: db $1A, $22, $27 ; ain

.entry_08
#_0EC7E2: db $1A, $27, $1D ; and

.entry_09
#_0EC7E5: db $1A, $2D, $59 ; at⎵

.entry_0A
#_0EC7E8: db $1A, $2C, $2D ; ast

.entry_0B
#_0EC7EB: db $1A, $27 ; an

.entry_0C
#_0EC7ED: db $1A, $2D ; at

.entry_0D
#_0EC7EF: db $1B, $25, $1E ; ble

.entry_0E
#_0EC7F2: db $1B, $1A ; ba

.entry_0F
#_0EC7F4: db $1B, $1E ; be

.entry_10
#_0EC7F6: db $1B, $28 ; bo

.entry_11
#_0EC7F8: db $1C, $1A, $27, $59 ; can⎵

.entry_12
#_0EC7FC: db $1C, $21, $1E ; che

.entry_13
#_0EC7FF: db $1C, $28, $26 ; com

.entry_14
#_0EC802: db $1C, $24 ; ck

.entry_15
#_0EC804: db $1D, $1E, $2C ; des

.entry_16
#_0EC807: db $1D, $22 ; di

.entry_17
#_0EC809: db $1D, $28 ; do

.entry_18
#_0EC80B: db $1E, $27, $59 ; en⎵

.entry_19
#_0EC80E: db $1E, $2B, $59 ; er⎵

.entry_1A
#_0EC811: db $1E, $1A, $2B ; ear

.entry_1B
#_0EC814: db $1E, $27, $2D ; ent

.entry_1C
#_0EC817: db $1E, $1D, $59 ; ed⎵

.entry_1D
#_0EC81A: db $1E, $27 ; en

.entry_1E
#_0EC81C: db $1E, $2B ; er

.entry_1F
#_0EC81E: db $1E, $2F ; ev

.entry_20
#_0EC820: db $1F, $28, $2B ; for

.entry_21
#_0EC823: db $1F, $2B, $28 ; fro

.entry_22
#_0EC826: db $20, $22, $2F, $1E, $59 ; give⎵

.entry_23
#_0EC82B: db $20, $1E, $2D ; get

.entry_24
#_0EC82E: db $20, $28 ; go

.entry_25
#_0EC830: db $21, $1A, $2F, $1E ; have

.entry_26
#_0EC834: db $21, $1A, $2C ; has

.entry_27
#_0EC837: db $21, $1E, $2B ; her

.entry_28
#_0EC83A: db $21, $22 ; hi

.entry_29
#_0EC83C: db $21, $1A ; ha

.entry_2A
#_0EC83E: db $22, $20, $21, $2D, $59 ; ight⎵

.entry_2B
#_0EC843: db $22, $27, $20, $59 ; ing⎵

.entry_2C
#_0EC847: db $22, $27 ; in

.entry_2D
#_0EC849: db $22, $2C ; is

.entry_2E
#_0EC84B: db $22, $2D ; it

.entry_2F
#_0EC84D: db $23, $2E, $2C, $2D ; just

.entry_30
#_0EC851: db $24, $27, $28, $30 ; know

.entry_31
#_0EC855: db $25, $32, $59 ; ly⎵

.entry_32
#_0EC858: db $25, $1A ; la

.entry_33
#_0EC85A: db $25, $28 ; lo

.entry_34
#_0EC85C: db $26, $1A, $27 ; man

.entry_35
#_0EC85F: db $26, $1A ; ma

.entry_36
#_0EC861: db $26, $1E ; me

.entry_37
#_0EC863: db $26, $2E ; mu

.entry_38
#_0EC865: db $27, $51, $2D, $59 ; n't⎵

.entry_39
#_0EC869: db $27, $28, $27 ; non

.entry_3A
#_0EC86C: db $27, $28, $2D ; not

.entry_3B
#_0EC86F: db $28, $29, $1E, $27 ; open

.entry_3C
#_0EC873: db $28, $2E, $27, $1D ; ound

.entry_3D
#_0EC877: db $28, $2E, $2D, $59 ; out⎵

.entry_3E
#_0EC87B: db $28, $1F ; of

.entry_3F
#_0EC87D: db $28, $27 ; on

.entry_40
#_0EC87F: db $28, $2B ; or

.entry_41
#_0EC881: db $29, $1E, $2B ; per

.entry_42
#_0EC884: db $29, $25, $1E ; ple

.entry_43
#_0EC887: db $29, $28, $30 ; pow

.entry_44
#_0EC88A: db $29, $2B, $28 ; pro

.entry_45
#_0EC88D: db $2B, $1E, $59 ; re⎵

.entry_46
#_0EC890: db $2B, $1E ; re

.entry_47
#_0EC892: db $2C, $28, $26, $1E ; some

.entry_48
#_0EC896: db $2C, $1E ; se

.entry_49
#_0EC898: db $2C, $21 ; sh

.entry_4A
#_0EC89A: db $2C, $28 ; so

.entry_4B
#_0EC89C: db $2C, $2D ; st

.entry_4C
#_0EC89E: db $2D, $1E, $2B, $59 ; ter⎵

.entry_4D
#_0EC8A2: db $2D, $21, $22, $27 ; thin

.entry_4E
#_0EC8A6: db $2D, $1E, $2B ; ter

.entry_4F
#_0EC8A9: db $2D, $21, $1A ; tha

.entry_50
#_0EC8AC: db $2D, $21, $1E ; the

.entry_51
#_0EC8AF: db $2D, $21, $22 ; thi

.entry_52
#_0EC8B2: db $2D, $28 ; to

.entry_53
#_0EC8B4: db $2D, $2B ; tr

.entry_54
#_0EC8B6: db $2E, $29 ; up

.entry_55
#_0EC8B8: db $2F, $1E, $2B ; ver

.entry_56
#_0EC8BB: db $30, $22, $2D, $21 ; with

.entry_57
#_0EC8BF: db $30, $1A ; wa

.entry_58
#_0EC8C1: db $30, $1E ; we

.entry_59
#_0EC8C3: db $30, $21 ; wh

.entry_5A
#_0EC8C5: db $30, $22 ; wi

.entry_5B
#_0EC8C7: db $32, $28, $2E ; you

.entry_5C
#_0EC8CA: db $07, $1E, $2B ; Her

.entry_5D
#_0EC8CD: db $13, $21, $1A ; Tha

.entry_5E
#_0EC8D0: db $13, $21, $1E ; The

.entry_5F
#_0EC8D3: db $13, $21, $22 ; Thi

.entry_60
#_0EC8D6: db $18, $28, $2E ; You

.end

;===================================================================================================

RenderText_Draw:
#_0EC8D9: LDA.w $1CD4
#_0EC8DC: JSL JumpTableLocal
#_0EC8E0: dw RenderText_InitializeWindow
#_0EC8E2: dw RenderText_DrawBorderEdges
#_0EC8E4: dw RenderText_DrawCharacterTilemap
#_0EC8E6: dw RenderText_DrawMessageCharacters
#_0EC8E8: dw RenderText_FinalizeWindow

;===================================================================================================

RenderText_InitializeWindow:
#_0EC8EA: JSR RenderText_SetDrawParameters
#_0EC8ED: JSR RenderText_DrawBorderRow

#_0EC8F0: REP #$30

#_0EC8F2: LDA.w #$0006
#_0EC8F5: STA.b $00

.next_row
#_0EC8F7: LDY.w #$0006
#_0EC8FA: JSR RenderText_DrawBorderRow

#_0EC8FD: DEC.b $00
#_0EC8FF: BNE .next_row

;---------------------------------------------------------------------------------------------------

#_0EC901: LDY.w #$000C
#_0EC904: JSR RenderText_DrawBorderRow

#_0EC907: LDA.w #$FFFF
#_0EC90A: STA.w $1002,X

#_0EC90D: SEP #$30

#_0EC90F: LDA.b #$01
#_0EC911: STA.b $14

#_0EC913: LDA.b #$02
#_0EC915: STA.w $1CD4

#_0EC918: RTS

;===================================================================================================

RenderText_DrawBorderEdges:
#_0EC919: LDA.b #$01
#_0EC91B: STA.b $14

#_0EC91D: LDA.w $1CD7
#_0EC920: BEQ .continue

#_0EC922: CMP.b #$07
#_0EC924: BCC .option_1

#_0EC926: LDA.b #$02
#_0EC928: BRA .continue

.option_1
#_0EC92A: LDA.b #$01

.continue
#_0EC92C: JSL JumpTableLocal
#_0EC930: dw RenderText_DrawBorderEdgeTop
#_0EC932: dw RenderText_DrawBorderEdgeMiddle
#_0EC934: dw RenderText_DrawBorderEdgeBottom

;===================================================================================================

RenderText_DrawBorderEdgeTop:
#_0EC936: REP #$30

#_0EC938: JSR RenderText_SetDrawParameters
#_0EC93B: JSR RenderText_DrawBorderRow

#_0EC93E: LDA.w #$FFFF
#_0EC941: STA.w $1002,X

#_0EC944: SEP #$30

#_0EC946: INC.w $1CD7

#_0EC949: RTS

;===================================================================================================

RenderText_DrawBorderEdgeMiddle:
#_0EC94A: REP #$30

#_0EC94C: LDX.w #$0000
#_0EC94F: LDY.w #$0006
#_0EC952: JSR RenderText_DrawBorderRow

#_0EC955: LDA.w #$FFFF
#_0EC958: STA.w $1002,X

#_0EC95B: SEP #$30

#_0EC95D: INC.w $1CD7

#_0EC960: RTS

;===================================================================================================

RenderText_DrawBorderEdgeBottom:
#_0EC961: REP #$30

#_0EC963: LDX.w #$0000
#_0EC966: LDY.w #$000C
#_0EC969: JSR RenderText_DrawBorderRow

#_0EC96C: LDA.w #$FFFF
#_0EC96F: STA.w $1002,X

#_0EC972: SEP #$30

#_0EC974: INC.w $1CD7

#_0EC977: LDA.b #$02
#_0EC979: STA.w $1CD4

#_0EC97C: RTS

;===================================================================================================

RenderText_DrawCharacterTilemap:
#_0EC97D: JSR RenderText_BuildCharacterTilemap

#_0EC980: INC.w $1CD4

#_0EC983: RTS

;===================================================================================================

RenderText_DrawMessageCharacters:
#_0EC984: REP #$30

#_0EC986: LDA.w $1CDD

#_0EC989: LDY.w #$0000

#_0EC98C: CMP.w #$0063
#_0EC98F: BCC .under_99

#_0EC991: LDA.w #$0000
#_0EC994: STY.w $1CE6

#_0EC997: BRA .continue

;---------------------------------------------------------------------------------------------------

.under_99
#_0EC999: CMP.w #$003B
#_0EC99C: BCC .under_59

#_0EC99E: CMP.w #$0050
#_0EC9A1: BCS .under_59

#_0EC9A3: LDA.w #$0050
#_0EC9A6: STY.w $1CE6
#_0EC9A9: BRA .continue

;---------------------------------------------------------------------------------------------------

.under_59
#_0EC9AB: CMP.w #$0013 ; 19
#_0EC9AE: BCC .continue

#_0EC9B0: CMP.w #$0028 ; 40
#_0EC9B3: BCS .continue

#_0EC9B5: LDA.w #$0028
#_0EC9B8: STY.w $1CE6

;---------------------------------------------------------------------------------------------------

.continue
#_0EC9BB: STA.w $1CDD

#_0EC9BE: CMP.w #$0012
#_0EC9C1: BEQ .is_18_or_58

#_0EC9C3: CMP.w #$003A
#_0EC9C6: BEQ .is_18_or_58

#_0EC9C8: CMP.w #$0062
#_0EC9CB: BNE .dont_add_to_line

.is_18_or_58
#_0EC9CD: LDA.w $1CE6
#_0EC9D0: AND.w #$0007
#_0EC9D3: CMP.w #$0006
#_0EC9D6: BCC .dont_add_to_line

#_0EC9D8: INC.w $1CDD

#_0EC9DB: BRA RenderText_DrawMessageCharacters

;---------------------------------------------------------------------------------------------------

.dont_add_to_line
#_0EC9DD: LDX.w $1CD9

#_0EC9E0: LDA.l $7F1200,X
#_0EC9E4: AND.w #$007F
#_0EC9E7: SEC
#_0EC9E8: SBC.w #$0066
#_0EC9EB: BPL .didnt_overflow

#_0EC9ED: LDA.w #$0000

.didnt_overflow
#_0EC9F0: SEP #$30

#_0EC9F2: JSR RenderText_HandleNextDraw

#_0EC9F5: LDA.b #$02
#_0EC9F7: STA.b $17
#_0EC9F9: STA.w $0710

#_0EC9FC: RTS

;===================================================================================================

RenderText_HandleNextDraw:
#_0EC9FD: JSL JumpTableLocal
#_0ECA01: dw RenderText_DrawCharacter            ; 0x66
#_0ECA03: dw RenderText_NextImage                ; 0x67
#_0ECA05: dw RenderText_Choose2LowOr3            ; 0x68
#_0ECA07: dw RenderText_ChooseItem               ; 0x69
#_0ECA09: dw RenderText_IgnoreThis               ; 0x6A
#_0ECA0B: dw RenderText_IgnoreThis               ; 0x6B
#_0ECA0D: dw RenderText_IgnoreThis               ; 0x6C
#_0ECA0F: dw RenderText_IgnoreThis               ; 0x6D
#_0ECA11: dw RenderText_IgnoreThis               ; 0x6E
#_0ECA13: dw RenderText_Choose2HighOr3           ; 0x6F
#_0ECA15: dw Choose3_ArrowMessageID              ; 0x70 - bad pointer, but correct
#_0ECA17: dw RenderText_Choose3                  ; 0x71
#_0ECA19: dw RenderText_Choose1or2               ; 0x72
#_0ECA1B: dw RenderText_ScrollText               ; 0x73
#_0ECA1D: dw RenderText_SetLine                  ; 0x74
#_0ECA1F: dw RenderText_SetLine                  ; 0x75
#_0ECA21: dw RenderText_SetLine                  ; 0x76
#_0ECA23: dw RenderText_SetColor                 ; 0x77
#_0ECA25: dw RenderText_Wait                     ; 0x78
#_0ECA27: dw RenderText_PlaySFX                  ; 0x79
#_0ECA29: dw RenderText_SetSpeed                 ; 0x7A
#_0ECA2B: dw RenderText_Command7B                ; 0x7B
#_0ECA2D: dw RenderText_Command7C                ; 0x7C
#_0ECA2F: dw RenderText_EmptyBuffer              ; 0x7D
#_0ECA31: dw RenderText_PauseForInput            ; 0x7E
#_0ECA33: dw RenderText_Terminate                ; 0x7F

;===================================================================================================

RenderText_FinalizeWindow:
#_0ECA35: REP #$30

#_0ECA37: JSR RenderText_SetDrawParameters

#_0ECA3A: REP #$30

#_0ECA3C: LDA.w $1CD0
#_0ECA3F: XBA
#_0ECA40: STA.w $1002,X

#_0ECA43: INX
#_0ECA44: INX

#_0ECA45: LDA.w RenderText_ClearStripeDRILL
#_0ECA48: STA.w $1002,X

#_0ECA4B: INX
#_0ECA4C: INX

#_0ECA4D: LDA.w RenderText_ClearTileFill
#_0ECA50: STA.w $1002,X

#_0ECA53: INX
#_0ECA54: INX

#_0ECA55: LDA.w #$FFFF
#_0ECA58: STA.w $1002,X

#_0ECA5B: SEP #$30

#_0ECA5D: LDA.b #$01
#_0ECA5F: STA.b $14

#_0ECA61: STZ.w $1CD8

#_0ECA64: STZ.b $11

#_0ECA66: LDA.w $010C
#_0ECA69: STA.b $10

#_0ECA6B: RTS

;===================================================================================================

RenderText_DrawCharacter:
#_0ECA6C: LDA.w $1CD5
#_0ECA6F: CMP.b #$02

#_0ECA71: BCC .speed_is_fine

#_0ECA73: LDA.b #$02

.speed_is_fine
#_0ECA75: JSL JumpTableLocal
#_0ECA79: dw RenderText_DrawAllCharacters
#_0ECA7B: dw RenderText_DrawSingleCharacter
#_0ECA7D: dw RenderText_ReduceCharacterDrawSpeed
#_0ECA7F: dw RenderText_NullCharacterDraw
#_0ECA81: dw RenderText_NullCharacterDraw
#_0ECA83: dw RenderText_NullCharacterDraw
#_0ECA85: dw RenderText_NullCharacterDraw
#_0ECA87: dw RenderText_NullCharacterDraw
#_0ECA89: dw RenderText_NullCharacterDraw
#_0ECA8B: dw RenderText_NullCharacterDraw
#_0ECA8D: dw RenderText_NullCharacterDraw
#_0ECA8F: dw RenderText_NullCharacterDraw
#_0ECA91: dw RenderText_NullCharacterDraw
#_0ECA93: dw RenderText_NullCharacterDraw
#_0ECA95: dw RenderText_NullCharacterDraw
#_0ECA97: dw RenderText_NullCharacterDraw

;===================================================================================================

RenderText_DrawAllCharacters:
#_0ECA99: JSR RenderText_DrawSingleCharacter
#_0ECA9C: REP #$30

#_0ECA9E: LDA.w $1CDD
#_0ECAA1: CMP.w #$0013
#_0ECAA4: BEQ .exit

#_0ECAA6: CMP.w #$003B
#_0ECAA9: BEQ .exit

#_0ECAAB: CMP.w #$0063
#_0ECAAE: BEQ .exit

#_0ECAB0: SEP #$30

#_0ECAB2: JMP.w RenderText_DrawMessageCharacters

.exit
#_0ECAB5: SEP #$30

#_0ECAB7: RTS

;===================================================================================================

RenderText_DrawSingleCharacter:
#_0ECAB8: REP #$10
#_0ECABA: LDX.w $1CD9
#_0ECABD: LDA.l $7F1200,X
#_0ECAC1: CMP.b #$59
#_0ECAC3: BEQ .space

#_0ECAC5: SEP #$30

#_0ECAC7: LDA.b #$0C ; SFX3.0C
#_0ECAC9: STA.w $012F

.space
#_0ECACC: REP #$30

#_0ECACE: LDA.w $1CDD
#_0ECAD1: ASL A
#_0ECAD2: TAX

#_0ECAD3: SEP #$30

#_0ECAD5: JSR RenderText_PerformVWFing

#_0ECAD8: LDA.w $1CD6
#_0ECADB: STA.w $1CD5

#_0ECADE: RTS

;===================================================================================================

pool RenderText_PerformVWFing

.width
;              A   B   C   D   E   F   G   H   I
#_0ECADF: db   6,  6,  6,  6,  6,  6,  6,  6,  3

;              J   K   L   M   N   O   P   Q   R
#_0ECAE8: db   6,  6,  6,  7,  6,  6,  6,  6,  6

;              S   T   U   V   W   X   Y   Z
#_0ECAF1: db   6,  7,  6,  7,  7,  7,  7,  6

;              a   b   c   d   e   f   g   h   i
#_0ECAF9: db   6,  6,  6,  6,  6,  6,  6,  6,  3

;              j   k   l   m   n   o   p   q   r
#_0ECB02: db   5,  6,  3,  7,  6,  6,  6,  6,  5

;              s   t   u   v   w   x   y   z
#_0ECB0B: db   6,  6,  6,  7,  7,  7,  7,  6

;              0   1   2   3   4   5   6   7   8   9
#_0ECB13: db   6,  4,  6,  6,  6,  6,  6,  6,  6,  6

;              !   ?   -   .   ,   …
#_0ECB1D: db   3,  7,  6,  4,  4,  6

;              >   (   )   ☥   𓈗   Ƨ  LINKFACE
#_0ECB23: db   8,  6,  6,  6,  6,  6,  8,  8

;              "   ↑   ↓   ←   →   '
#_0ECB2B: db   8,  7,  7,  7,  7,  4

;  hearts     1L  2L  ER  3L  3R  4L  4R
#_0ECB31: db   8,  8,  8,  8,  8,  8,  8

;              ⎵  <   Ⓐ   Ⓑ  ⓧ   ⓨ
#_0ECB38: db   4,  8,  8,  8,  8,  8

;              |   ¡   ¡  ⎵
#_0ECB3E: db   8,  8,  8,  4

;---------------------------------------------------------------------------------------------------

.masks_on
#_0ECB42: db $80, $40, $20, $10, $08, $04, $02, $01

.render_offsets
#_0ECB4A: dw $0000, $02A0, $0540

.line_offsets
#_0ECB50: dw $0000, $0040, $0080

.masks_off
#_0ECB56: db $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

pool off

;---------------------------------------------------------------------------------------------------

RenderText_PerformVWFing:
#_0ECB5E: SEP #$30

#_0ECB60: PHB
#_0ECB61: PHK
#_0ECB62: PLB

#_0ECB63: REP #$20

#_0ECB65: LDA.w $0720
#_0ECB68: BEQ .same_row

#_0ECB6A: LDY.w $0722

#_0ECB6D: LDA.w .render_offsets,Y
#_0ECB70: STA.w $0726

#_0ECB73: LDA.w .line_offsets,Y
#_0ECB76: STA.w $0724

#_0ECB79: STZ.w $0720

.same_row
#_0ECB7C: SEP #$20
#_0ECB7E: REP #$10

#_0ECB80: STZ.b $03

;---------------------------------------------------------------------------------------------------

#_0ECB82: LDX.w $1CD9
#_0ECB85: LDA.l $7F1200,X

#_0ECB89: SEP #$10

#_0ECB8B: TAY

#_0ECB8C: LDA.w .width,Y
#_0ECB8F: STA.b $02

#_0ECB91: LDX.w $0724
#_0ECB94: CLC
#_0ECB95: ADC.l $7EC230,X
#_0ECB99: STA.l $7EC231,X

#_0ECB9D: INX
#_0ECB9E: STX.w $0724

#_0ECBA1: TYA
#_0ECBA2: AND.b #$F0
#_0ECBA4: ASL A
#_0ECBA5: STA.b $00

#_0ECBA7: TYA
#_0ECBA8: AND.b #$0F
#_0ECBAA: ORA.b $00
#_0ECBAC: STA.b $0A

#_0ECBAE: STZ.b $0B

;---------------------------------------------------------------------------------------------------

#_0ECBB0: REP #$20

#_0ECBB2: LDA.w #$8000
#_0ECBB5: STA.b $0D

#_0ECBB7: LDY.b #$0E
#_0ECBB9: STY.b $0F

#_0ECBBB: REP #$10

#_0ECBBD: LDA.l $7EC22F,X
#_0ECBC1: AND.w #$00FF
#_0ECBC4: ASL A
#_0ECBC5: STA.b $00

#_0ECBC7: LDX.w #$0000

#_0ECBCA: LDA.b $0A
#_0ECBCC: ASL A
#_0ECBCD: ASL A
#_0ECBCE: ASL A
#_0ECBCF: ASL A
#_0ECBD0: TAY

;---------------------------------------------------------------------------------------------------

.top_next_row
#_0ECBD1: LDA.b [$0D],Y
#_0ECBD3: STA.b $04

#_0ECBD5: PHY

#_0ECBD6: STX.b $06

#_0ECBD8: LDA.b $00
#_0ECBDA: CLC
#_0ECBDB: ADC.w $0726
#_0ECBDE: TAY

#_0ECBDF: AND.w #$0FF0
#_0ECBE2: CLC
#_0ECBE3: ADC.b $06
#_0ECBE5: TAX

#_0ECBE6: TYA
#_0ECBE7: LSR A
#_0ECBE8: AND.w #$0007
#_0ECBEB: TAY

#_0ECBEC: SEP #$20

#_0ECBEE: LDA.b $02
#_0ECBF0: STA.b $03

.top_not_boundary
#_0ECBF2: ASL.b $04
#_0ECBF4: BCC .top_unset_plane_0

#_0ECBF6: LDA.l $7F0000,X
#_0ECBFA: EOR.w .masks_on,Y
#_0ECBFD: STA.l $7F0000,X

#_0ECC01: BRA .top_plane_1

.top_unset_plane_0
#_0ECC03: LDA.l $7F0000,X
#_0ECC07: AND.w .masks_off,Y
#_0ECC0A: STA.l $7F0000,X

.top_plane_1
#_0ECC0E: ASL.b $05
#_0ECC10: BCC .top_unset_plane_1

#_0ECC12: LDA.l $7F0001,X
#_0ECC16: EOR.w .masks_on,Y
#_0ECC19: STA.l $7F0001,X

#_0ECC1D: BRA .top_dec_width

.top_unset_plane_1
#_0ECC1F: LDA.l $7F0001,X
#_0ECC23: AND.w .masks_off,Y
#_0ECC26: STA.l $7F0001,X

.top_dec_width
#_0ECC2A: DEC.b $03
#_0ECC2C: BEQ .top_width_zero

#_0ECC2E: INY
#_0ECC2F: CPY.w #$0008
#_0ECC32: BNE .top_not_boundary

.top_width_zero
#_0ECC34: REP #$20

#_0ECC36: TXA
#_0ECC37: CLC
#_0ECC38: ADC.w #$0010
#_0ECC3B: TAX

#_0ECC3C: LDA.b $04
#_0ECC3E: BEQ .top_none_left

#_0ECC40: STA.l $7F0000,X

.top_none_left
#_0ECC44: PLY
#_0ECC45: INY
#_0ECC46: INY

#_0ECC47: LDX.b $06
#_0ECC49: INX
#_0ECC4A: INX
#_0ECC4B: CPX.w #$0010
#_0ECC4E: BNE .top_next_row

;---------------------------------------------------------------------------------------------------

#_0ECC50: LDA.w $0726
#_0ECC53: CLC
#_0ECC54: ADC.w #$0150
#_0ECC57: STA.b $08

#_0ECC59: LDX.w #$0000

#_0ECC5C: LDA.b $0A
#_0ECC5E: CLC
#_0ECC5F: ADC.w #$0010
#_0ECC62: ASL A
#_0ECC63: ASL A
#_0ECC64: ASL A
#_0ECC65: ASL A
#_0ECC66: TAY

;---------------------------------------------------------------------------------------------------

.bottom_next_row
#_0ECC67: LDA.b [$0D],Y
#_0ECC69: STA.b $04

#_0ECC6B: PHY

#_0ECC6C: STX.b $06

#_0ECC6E: LDX.w $0724
#_0ECC71: LDA.l $7EC22F,X
#_0ECC75: AND.w #$00FF
#_0ECC78: ASL A
#_0ECC79: CLC
#_0ECC7A: ADC.b $08
#_0ECC7C: TAY

#_0ECC7D: AND.w #$0FF0
#_0ECC80: CLC
#_0ECC81: ADC.b $06
#_0ECC83: TAX

#_0ECC84: TYA
#_0ECC85: LSR A
#_0ECC86: AND.w #$0007
#_0ECC89: TAY

#_0ECC8A: SEP #$20

#_0ECC8C: LDA.b $02
#_0ECC8E: STA.b $03

.bottom_not_boundary
#_0ECC90: ASL.b $04
#_0ECC92: BCC .bottom_unset_plane_0

#_0ECC94: LDA.l $7F0000,X
#_0ECC98: EOR.w .masks_on,Y
#_0ECC9B: STA.l $7F0000,X

#_0ECC9F: BRA .bottom_plane_1

.bottom_unset_plane_0
#_0ECCA1: LDA.l $7F0000,X
#_0ECCA5: AND.w .masks_off,Y
#_0ECCA8: STA.l $7F0000,X

.bottom_plane_1
#_0ECCAC: ASL.b $05
#_0ECCAE: BCC .bottom_unset_plane_1

#_0ECCB0: LDA.l $7F0001,X
#_0ECCB4: EOR.w .masks_on,Y
#_0ECCB7: STA.l $7F0001,X

#_0ECCBB: BRA .bottom_dec_width

.bottom_unset_plane_1
#_0ECCBD: LDA.l $7F0001,X
#_0ECCC1: AND.w .masks_off,Y
#_0ECCC4: STA.l $7F0001,X

.bottom_dec_width
#_0ECCC8: DEC.b $03
#_0ECCCA: BEQ .bottom_width_zero

#_0ECCCC: INY
#_0ECCCD: CPY.w #$0008
#_0ECCD0: BNE .bottom_not_boundary

.bottom_width_zero
#_0ECCD2: REP #$20

#_0ECCD4: TXA
#_0ECCD5: CLC
#_0ECCD6: ADC.w #$0010
#_0ECCD9: TAX

#_0ECCDA: LDA.b $04
#_0ECCDC: BEQ .bottom_none_left

#_0ECCDE: STA.l $7F0000,X

.bottom_none_left
#_0ECCE2: PLY
#_0ECCE3: INY
#_0ECCE4: INY

#_0ECCE5: LDX.b $06
#_0ECCE7: INX
#_0ECCE8: INX
#_0ECCE9: CPX.w #$0010
#_0ECCEC: BEQ .bottom_done

#_0ECCEE: BRL .bottom_next_row

;---------------------------------------------------------------------------------------------------

.bottom_done
#_0ECCF1: INC.w $1CD9
#_0ECCF4: SEP #$30
#_0ECCF6: PLB
#_0ECCF7: RTS

#_0ECCF8: RTS

;===================================================================================================

RenderText_ReduceCharacterDrawSpeed:
#_0ECCF9: DEC.w $1CD5
#_0ECCFC: RTS

;===================================================================================================

RenderText_NullCharacterDraw:
#_0ECCFD: RTS

;===================================================================================================

RenderText_NextImage:
#_0ECCFE: LDA.b $10
#_0ECD00: CMP.b #$14
#_0ECD02: BNE .not_attract

#_0ECD04: JSL PaletteFilterHistory

#_0ECD08: LDA.l $7EC007
#_0ECD0C: BNE .exit

.not_attract
#_0ECD0E: REP #$30

#_0ECD10: INC.w $1CD9

#_0ECD13: SEP #$30

.exit
#_0ECD15: RTS

;===================================================================================================

pool RenderText_Choose2LowOr3

.arrow_messages
#_0ECD16: dw $0001 ; MESSAGE 0001
#_0ECD18: dw $0002 ; MESSAGE 0002

pool off

;---------------------------------------------------------------------------------------------------

RenderText_Choose2LowOr3:
#_0ECD1A: LDA.w $1CE9
#_0ECD1D: BEQ .delay_over

#_0ECD1F: DEC A
#_0ECD20: STA.w $1CE9

#_0ECD23: CMP.b #$01
#_0ECD25: BNE .exit

#_0ECD27: LDA.b #$24 ; SFX3.24
#_0ECD29: STA.w $012F

#_0ECD2C: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
#_0ECD2E: LDA.b $F4
#_0ECD30: TAY
#_0ECD31: ORA.b $F6
#_0ECD33: AND.b #$C0
#_0ECD35: BNE .pressed_face

#_0ECD37: TYA
#_0ECD38: AND.b #$08
#_0ECD3A: BNE .pressed_up

#_0ECD3C: TYA
#_0ECD3D: AND.b #$04
#_0ECD3F: BNE .pressed_down

.exit
#_0ECD41: RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
#_0ECD42: LDA.w $1CE8
#_0ECD45: BEQ .exit

#_0ECD47: STZ.w $1CE8

#_0ECD4A: BRA .continue_press

.pressed_down
#_0ECD4C: LDA.w $1CE8
#_0ECD4F: DEC A
#_0ECD50: BEQ .exit

#_0ECD52: LDA.b #$01
#_0ECD54: STA.w $1CE8

.continue_press
#_0ECD57: LDA.b #$20 ; SFX3.20
#_0ECD59: STA.w $012F

#_0ECD5C: LDA.w $1CE8
#_0ECD5F: ASL A
#_0ECD60: TAX

#_0ECD61: LDA.w .arrow_messages+0,X
#_0ECD64: STA.w $1CF0

#_0ECD67: LDA.w .arrow_messages+1,X
#_0ECD6A: STA.w $1CF1

#_0ECD6D: JSR RenderText_ParseMessage

#_0ECD70: STZ.w $1CE6
#_0ECD73: STZ.w $1CD9
#_0ECD76: STZ.w $1CDA

#_0ECD79: JSR RenderText_InitializeVWF

#_0ECD7C: RTS

;---------------------------------------------------------------------------------------------------

.pressed_face
#_0ECD7D: LDA.b #$2B
#_0ECD7F: STA.w $012E

#_0ECD82: LDA.b #$04
#_0ECD84: STA.w $1CD4

#_0ECD87: RTS

;===================================================================================================

RenderText_ChooseItem:
#_0ECD88: LDA.w $1CE9
#_0ECD8B: BEQ .delay_over

#_0ECD8D: DEC A
#_0ECD8E: STA.w $1CE9

#_0ECD91: CMP.b #$01
#_0ECD93: BEQ RenderText_FindNextItem

#_0ECD95: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
#_0ECD97: LDA.b $F4
#_0ECD99: ORA.b $F6
#_0ECD9B: AND.b #$C0
#_0ECD9D: BNE .made_selection

#_0ECD9F: LDA.b $F4
#_0ECDA1: AND.b #$05
#_0ECDA3: BEQ .pressed_down_or_right

#_0ECDA5: INC.w $1CE8

#_0ECDA8: BRA .adjust_selection

.pressed_down_or_right
#_0ECDAA: LDA.b $F4
#_0ECDAC: AND.b #$0A
#_0ECDAE: BEQ .adjust_selection

#_0ECDB0: DEC.w $1CE8

#_0ECDB3: JSR RenderText_FindPreviousItem
#_0ECDB6: JSR RenderText_DrawACharacter

#_0ECDB9: BRA .exit

.adjust_selection
#_0ECDBB: JSR RenderText_FindNextItem
#_0ECDBE: JSR RenderText_DrawACharacter

.exit
#_0ECDC1: RTS

;---------------------------------------------------------------------------------------------------

.made_selection
#_0ECDC2: LDA.b #$04
#_0ECDC4: STA.w $1CD4

#_0ECDC7: RTS

;===================================================================================================

RenderText_FindPreviousItem:
#_0ECDC8: LDX.w $1CE8
#_0ECDCB: BPL .no_wrap

#_0ECDCD: LDX.b #$1F
#_0ECDCF: STX.w $1CE8

.no_wrap
#_0ECDD2: CPX.b #$0F
#_0ECDD4: BEQ .check_next

#_0ECDD6: LDA.l $7EF340,X
#_0ECDDA: BMI .item_missing
#_0ECDDC: BNE RenderText_DrawSelectedItem

.item_missing
#_0ECDDE: CPX.b #$20
#_0ECDE0: BNE .check_next

#_0ECDE2: LDA.l $7EF341,X
#_0ECDE6: BNE RenderText_DrawSelectedItem

.check_next
#_0ECDE8: DEC.w $1CE8
#_0ECDEB: BRA RenderText_FindPreviousItem

;===================================================================================================

RenderText_FindNextItem:
#_0ECDED: LDX.w $1CE8
#_0ECDF0: CPX.b #$20
#_0ECDF2: BCC .no_wrap

#_0ECDF4: LDX.b #$00
#_0ECDF6: STX.w $1CE8

.no_wrap
#_0ECDF9: CPX.b #$0F
#_0ECDFB: BEQ .check_next

#_0ECDFD: LDA.l $7EF340,X
#_0ECE01: BMI .item_missing

#_0ECE03: BNE RenderText_DrawSelectedItem

.item_missing
#_0ECE05: CPX.b #$20
#_0ECE07: BNE .check_next

#_0ECE09: LDA.l $7EF341,X
#_0ECE0D: BNE RenderText_DrawSelectedItem

.check_next
#_0ECE0F: INC.w $1CE8
#_0ECE12: BRA RenderText_FindNextItem

;===================================================================================================

RenderText_DrawSelectedItem:
#_0ECE14: TXY

#_0ECE15: TXA
#_0ECE16: ASL A
#_0ECE17: TAX

#_0ECE18: LDA.l ItemMenu_ItemGFXPointers+0,X
#_0ECE1C: STA.b $00

#_0ECE1E: LDA.l ItemMenu_ItemGFXPointers+1,X
#_0ECE22: STA.b $01

#_0ECE24: LDA.b #ItemMenu_ItemGFXPointers>>16
#_0ECE26: STA.b $02

#_0ECE28: TYX

#_0ECE29: LDA.l $7EF340,X
#_0ECE2D: CPX.b #$20
#_0ECE2F: BEQ .draw_one

#_0ECE31: CPX.b #$03
#_0ECE33: BNE .not_bombs

.draw_one
#_0ECE35: LDA.b #$01

.not_bombs
#_0ECE37: ASL A
#_0ECE38: ASL A
#_0ECE39: ASL A
#_0ECE3A: TAY

#_0ECE3B: LDA.b [$00],Y
#_0ECE3D: STA.w $13C2

#_0ECE40: INY
#_0ECE41: LDA.b [$00],Y
#_0ECE43: STA.w $13C3

#_0ECE46: INY
#_0ECE47: LDA.b [$00],Y
#_0ECE49: STA.w $13C4

#_0ECE4C: INY
#_0ECE4D: LDA.b [$00],Y
#_0ECE4F: STA.w $13C5

#_0ECE52: INY
#_0ECE53: LDA.b [$00],Y
#_0ECE55: STA.w $13EC

#_0ECE58: INY
#_0ECE59: LDA.b [$00],Y
#_0ECE5B: STA.w $13ED

#_0ECE5E: INY
#_0ECE5F: LDA.b [$00],Y
#_0ECE61: STA.w $13EE

#_0ECE64: INY
#_0ECE65: LDA.b [$00],Y
#_0ECE67: STA.w $13EF

#_0ECE6A: RTS

;===================================================================================================

RenderText_IgnoreThis:
#_0ECE6B: REP #$10

#_0ECE6D: LDX.w $1CD9
#_0ECE70: INX

#_0ECE71: LDA.l $7F1200,X
#_0ECE75: STA.w $1CEA

#_0ECE78: INX
#_0ECE79: STX.w $1CD9

#_0ECE7C: SEP #$30

#_0ECE7E: RTS

;===================================================================================================

pool RenderText_Choose2HighOr3

.arrow_messages
#_0ECE7F: dw $000B ; MESSAGE 000B
#_0ECE81: dw $000C ; MESSAGE 000C

pool off

;---------------------------------------------------------------------------------------------------

RenderText_Choose2HighOr3:
#_0ECE83: LDA.w $1CE9
#_0ECE86: BEQ .delay_over

#_0ECE88: DEC A
#_0ECE89: STA.w $1CE9

#_0ECE8C: CMP.b #$01
#_0ECE8E: BNE .exit

#_0ECE90: LDA.b #$24 ; SFX3.24
#_0ECE92: STA.w $012F

#_0ECE95: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
#_0ECE97: LDA.b $F4
#_0ECE99: TAY

#_0ECE9A: ORA.b $F6
#_0ECE9C: AND.b #$C0
#_0ECE9E: BNE .made_selection

#_0ECEA0: TYA
#_0ECEA1: AND.b #$08
#_0ECEA3: BNE .pressed_up

#_0ECEA5: TYA
#_0ECEA6: AND.b #$04
#_0ECEA8: BNE .pressed_down

.exit
#_0ECEAA: RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
#_0ECEAB: LDA.w $1CE8
#_0ECEAE: BEQ .exit

#_0ECEB0: STZ.w $1CE8

#_0ECEB3: BRA .continue

;---------------------------------------------------------------------------------------------------

.pressed_down
#_0ECEB5: LDA.w $1CE8
#_0ECEB8: DEC A
#_0ECEB9: BEQ .exit

#_0ECEBB: LDA.b #$01
#_0ECEBD: STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
#_0ECEC0: LDA.b #$20 ; SFX3.20
#_0ECEC2: STA.w $012F

#_0ECEC5: LDA.w $1CE8
#_0ECEC8: ASL A
#_0ECEC9: TAX

#_0ECECA: LDA.w .arrow_messages+0,X
#_0ECECD: STA.w $1CF0

#_0ECED0: LDA.w .arrow_messages+1,X
#_0ECED3: STA.w $1CF1

#_0ECED6: JSR RenderText_ParseMessage

#_0ECED9: STZ.w $1CE6
#_0ECEDC: STZ.w $1CD9
#_0ECEDF: STZ.w $1CDA

#_0ECEE2: JSR RenderText_InitializeVWF

#_0ECEE5: RTS

;---------------------------------------------------------------------------------------------------

.made_selection
#_0ECEE6: LDA.b #$2B ; SFX2.2B
#_0ECEE8: STA.w $012E

#_0ECEEB: LDA.b #$04
#_0ECEED: STA.w $1CD4

#_0ECEF0: RTS

;===================================================================================================

Choose3_ArrowMessageID:
#_0ECEF1: dw $0006 ; MESSAGE 0006
#_0ECEF3: dw $0007 ; MESSAGE 0007
#_0ECEF5: dw $0008 ; MESSAGE 0008

;===================================================================================================

RenderText_Choose3:
#_0ECEF7: LDA.w $1CE9
#_0ECEFA: BEQ .delay_over

#_0ECEFC: DEC A
#_0ECEFD: STA.w $1CE9

#_0ECF00: CMP.b #$01
#_0ECF02: BNE .exit

#_0ECF04: LDA.b #$24 ; SFX3.24
#_0ECF06: STA.w $012F

#_0ECF09: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
#_0ECF0B: LDA.b $F6
#_0ECF0D: AND.b #$C0
#_0ECF0F: ORA.b $F4
#_0ECF11: TAY

#_0ECF12: AND.b #$D0
#_0ECF14: BNE .made_selection

#_0ECF16: TYA
#_0ECF17: AND.b #$08
#_0ECF19: BNE .pressed_up

#_0ECF1B: TYA
#_0ECF1C: AND.b #$04
#_0ECF1E: BNE .pressed_down

.exit
#_0ECF20: RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
#_0ECF21: LDA.w $1CE8
#_0ECF24: DEC A
#_0ECF25: CMP.b #$FF
#_0ECF27: BNE .no_up_wrap

#_0ECF29: LDA.b #$02

.no_up_wrap
#_0ECF2B: STA.w $1CE8

#_0ECF2E: BRA .continue

;---------------------------------------------------------------------------------------------------

.pressed_down
#_0ECF30: LDA.w $1CE8
#_0ECF33: INC A
#_0ECF34: CMP.b #$03
#_0ECF36: BNE .no_down_wrap

#_0ECF38: LDA.b #$00

.no_down_wrap
#_0ECF3A: STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
#_0ECF3D: LDA.b #$20 ; SFX3.20
#_0ECF3F: STA.w $012F

#_0ECF42: LDA.w $1CE8
#_0ECF45: ASL A
#_0ECF46: TAX

#_0ECF47: LDA.w Choose3_ArrowMessageID+0,X
#_0ECF4A: STA.w $1CF0

#_0ECF4D: LDA.w Choose3_ArrowMessageID+1,X
#_0ECF50: STA.w $1CF1

#_0ECF53: JSR RenderText_ParseMessage

#_0ECF56: STZ.w $1CE6
#_0ECF59: STZ.w $1CD9
#_0ECF5C: STZ.w $1CDA

#_0ECF5F: JSR RenderText_InitializeVWF

#_0ECF62: RTS

;---------------------------------------------------------------------------------------------------

.made_selection
#_0ECF63: LDA.b #$2B ; SFX2.2B
#_0ECF65: STA.w $012E

#_0ECF68: LDA.b #$04
#_0ECF6A: STA.w $1CD4

#_0ECF6D: RTS

;===================================================================================================

pool RenderText_Choose1or2

.pointer_message_id
#_0ECF6E: dw $0009 ; MESSAGE 0009
#_0ECF70: dw $000A ; MESSAGE 000A

pool off

;---------------------------------------------------------------------------------------------------

RenderText_Choose1or2:
#_0ECF72: LDA.w $1CE9
#_0ECF75: BEQ .delay_over

#_0ECF77: DEC A
#_0ECF78: STA.w $1CE9

#_0ECF7B: CMP.b #$01
#_0ECF7D: BNE .exit

#_0ECF7F: LDA.b #$24 ; SFX3.24
#_0ECF81: STA.w $012F

#_0ECF84: BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
#_0ECF86: LDA.b $F6
#_0ECF88: AND.b #$C0
#_0ECF8A: ORA.b $F4
#_0ECF8C: TAY

#_0ECF8D: AND.b #$D0
#_0ECF8F: BNE .made_selection

#_0ECF91: TYA
#_0ECF92: AND.b #$08
#_0ECF94: BNE .pressed_up

#_0ECF96: TYA
#_0ECF97: AND.b #$04
#_0ECF99: BNE .pressed_down

.exit
#_0ECF9B: RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
#_0ECF9C: LDA.w $1CE8
#_0ECF9F: BEQ .exit

#_0ECFA1: STZ.w $1CE8

#_0ECFA4: BRA .continue

.pressed_down
#_0ECFA6: LDA.w $1CE8
#_0ECFA9: DEC A
#_0ECFAA: BEQ .exit

#_0ECFAC: LDA.b #$01
#_0ECFAE: STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
#_0ECFB1: LDA.b #$20 ; SFX3.20
#_0ECFB3: STA.w $012F

#_0ECFB6: LDA.w $1CE8
#_0ECFB9: ASL A
#_0ECFBA: TAX

#_0ECFBB: LDA.w .pointer_message_id+0,X
#_0ECFBE: STA.w $1CF0

#_0ECFC1: LDA.w .pointer_message_id+1,X
#_0ECFC4: STA.w $1CF1

#_0ECFC7: JSR RenderText_ParseMessage

#_0ECFCA: STZ.w $1CE6
#_0ECFCD: STZ.w $1CD9
#_0ECFD0: STZ.w $1CDA

#_0ECFD3: JSR RenderText_InitializeVWF

#_0ECFD6: RTS

;---------------------------------------------------------------------------------------------------

.made_selection
#_0ECFD7: LDA.b #$2B ; SFX2.2B
#_0ECFD9: STA.w $012E

#_0ECFDC: LDA.b #$04
#_0ECFDE: STA.w $1CD4

#_0ECFE1: RTS

;===================================================================================================

RenderText_ScrollText:
#_0ECFE2: PHB

#_0ECFE3: LDA.b #$7F
#_0ECFE5: PHA
#_0ECFE6: PLB

#_0ECFE7: LDA.b $F2
#_0ECFE9: AND.b #$80
#_0ECFEB: BEQ .no_a_press

#_0ECFED: LDA.l $001CEA
#_0ECFF1: BRA .useless

.no_a_press
#_0ECFF3: LDA.l $001CEA

.useless
#_0ECFF7: STA.b $02

;---------------------------------------------------------------------------------------------------

.next
#_0ECFF9: REP #$30

#_0ECFFB: STZ.b $00

.copy_next
#_0ECFFD: LDX.b $00

#_0ECFFF: LDA.w $7F0002,X
#_0ED002: STA.w $7F0000,X

#_0ED005: LDA.w $7F0004,X
#_0ED008: STA.w $7F0002,X

#_0ED00B: LDA.w $7F0006,X
#_0ED00E: STA.w $7F0004,X

#_0ED011: LDA.w $7F0008,X
#_0ED014: STA.w $7F0006,X

#_0ED017: LDA.w $7F000A,X
#_0ED01A: STA.w $7F0008,X

#_0ED01D: LDA.w $7F000C,X
#_0ED020: STA.w $7F000A,X

#_0ED023: LDA.w $7F000E,X
#_0ED026: STA.w $7F000C,X

#_0ED029: LDA.w $7F0150,X
#_0ED02C: STA.w $7F000E,X

#_0ED02F: LDA.b $00
#_0ED031: CLC
#_0ED032: ADC.w #$0010
#_0ED035: STA.b $00

#_0ED037: CMP.w #$07E0
#_0ED03A: BCC .copy_next

;---------------------------------------------------------------------------------------------------

#_0ED03C: STZ.w $7F07DE
#_0ED03F: STZ.w $7F07CE
#_0ED042: STZ.w $7F07BE
#_0ED045: STZ.w $7F07AE

#_0ED048: STZ.w $7F079E
#_0ED04B: STZ.w $7F078E
#_0ED04E: STZ.w $7F077E
#_0ED051: STZ.w $7F076E

#_0ED054: STZ.w $7F075E
#_0ED057: STZ.w $7F074E
#_0ED05A: STZ.w $7F073E
#_0ED05D: STZ.w $7F072E

#_0ED060: STZ.w $7F071E
#_0ED063: STZ.w $7F070E
#_0ED066: STZ.w $7F06FE
#_0ED069: STZ.w $7F06EE

#_0ED06C: STZ.w $7F06DE
#_0ED06F: STZ.w $7F06CE
#_0ED072: STZ.w $7F06BE
#_0ED075: STZ.w $7F06AE
#_0ED078: STZ.w $7F069E

;---------------------------------------------------------------------------------------------------

#_0ED07B: SEP #$30

#_0ED07D: LDA.l $001CDF
#_0ED081: CLC
#_0ED082: ADC.b #$01
#_0ED084: STA.l $001CDF

#_0ED088: AND.b #$0F
#_0ED08A: BNE .proceed_to_next

#_0ED08C: REP #$30

#_0ED08E: LDA.l $001CD9
#_0ED092: CLC
#_0ED093: ADC.w #$0001
#_0ED096: STA.l $001CD9

#_0ED09A: LDA.w #$0050
#_0ED09D: STA.l $001CDD

#_0ED0A1: LDA.l RenderText_VWFRows+4
#_0ED0A5: STA.l $000722

#_0ED0A9: LDA.w #$0001
#_0ED0AC: STA.l $000720

#_0ED0B0: SEP #$30

#_0ED0B2: LDA.b #$00
#_0ED0B4: STA.l $001CE6

#_0ED0B8: STZ.b $02

.proceed_to_next
#_0ED0BA: DEC.b $02

#_0ED0BC: BMI .exit

#_0ED0BE: JMP.w .next

;---------------------------------------------------------------------------------------------------

.exit
#_0ED0C1: PLB

#_0ED0C2: RTS

;===================================================================================================

RenderText_VWFRows:
#_0ED0C3: dw $0000, $0002, $0004

;===================================================================================================

RenderText_SetLine:
#_0ED0C9: REP #$30

#_0ED0CB: LDX.w $1CD9

#_0ED0CE: LDA.l $7F1200,X
#_0ED0D2: AND.w #$0003
#_0ED0D5: ASL A
#_0ED0D6: TAX

#_0ED0D7: LDA.w RenderText_LinePositions,X
#_0ED0DA: STA.w $1CDD

#_0ED0DD: LDA.w RenderText_VWFRows+0,X
#_0ED0E0: STA.w $0722

#_0ED0E3: LDA.w #$0001
#_0ED0E6: STA.w $0720

#_0ED0E9: INC.w $1CD9

#_0ED0EC: SEP #$30

#_0ED0EE: STZ.w $1CE6

#_0ED0F1: RTS

;===================================================================================================

RenderText_SetColor:
#_0ED0F2: REP #$10

#_0ED0F4: LDA.w $1CDC
#_0ED0F7: AND.b #$E3
#_0ED0F9: STA.w $1CDC

#_0ED0FC: LDX.w $1CD9
#_0ED0FF: INX

#_0ED100: LDA.l $7F1200,X
#_0ED104: AND.b #$07
#_0ED106: ASL A
#_0ED107: ASL A
#_0ED108: ORA.w $1CDC
#_0ED10B: STA.w $1CDC

#_0ED10E: INX
#_0ED10F: STX.w $1CD9

#_0ED112: SEP #$30

#_0ED114: RTS

;===================================================================================================

RenderText_Wait:
#_0ED115: LDA.b $F2
#_0ED117: AND.b #$80
#_0ED119: BEQ .no_a_press

#_0ED11B: LDA.b #$01
#_0ED11D: BRA .continue

.no_a_press
#_0ED11F: REP #$30

#_0ED121: LDA.w $1CE0
#_0ED124: CMP.w #$0002
#_0ED127: BCC .continue

#_0ED129: LDA.w #$0002

.continue
#_0ED12C: SEP #$30

#_0ED12E: JSL JumpTableLocal
#_0ED132: dw RenderText_InitializeWait
#_0ED134: dw RenderText_TerminateWait
#_0ED136: dw RenderText_TickWaitClock

;===================================================================================================

RenderText_InitializeWait:
#_0ED138: REP #$30

#_0ED13A: LDX.w $1CD9

#_0ED13D: LDA.l $7F1201,X
#_0ED141: AND.w #$000F
#_0ED144: ASL A
#_0ED145: TAX

#_0ED146: LDA.w RenderText_WaitTimers,X
#_0ED149: STA.w $1CE0

;===================================================================================================

RenderText_TickWaitClock:
#_0ED14C: REP #$30

#_0ED14E: DEC.w $1CE0

#_0ED151: SEP #$30

#_0ED153: RTS

;===================================================================================================

RenderText_TerminateWait:
#_0ED154: REP #$30

#_0ED156: INC.w $1CD9
#_0ED159: INC.w $1CD9

#_0ED15C: SEP #$30

#_0ED15E: STZ.w $1CE0

#_0ED161: RTS

;===================================================================================================

RenderText_PlaySFX:
#_0ED162: REP #$10

#_0ED164: LDX.w $1CD9
#_0ED167: INX

#_0ED168: LDA.l $7F1200,X
#_0ED16C: STA.w $012F

#_0ED16F: INX
#_0ED170: STX.w $1CD9

#_0ED173: SEP #$30

#_0ED175: RTS

;===================================================================================================

RenderText_SetSpeed:
#_0ED176: REP #$10

#_0ED178: LDX.w $1CD9
#_0ED17B: INX

#_0ED17C: LDA.l $7F1200,X
#_0ED180: STA.w $1CD6
#_0ED183: STA.w $1CD5

#_0ED186: INX
#_0ED187: STX.w $1CD9

#_0ED18A: SEP #$30

#_0ED18C: RTS

;===================================================================================================

RenderText_Command7B:
#_0ED18D: REP #$30

#_0ED18F: INC.w $1CD9

#_0ED192: LDX.w $1CD9

#_0ED195: LDA.l $7F1200,X
#_0ED199: AND.w #$007F
#_0ED19C: ASL A
#_0ED19D: ASL A
#_0ED19E: TAX

#_0ED19F: LDY.w $1CDD

#_0ED1A2: LDA.w Command7BTiles,X
#_0ED1A5: STA.w $12D8,Y

#_0ED1A8: INX
#_0ED1A9: INX

#_0ED1AA: LDA.w Command7BTiles,X
#_0ED1AD: STA.w $1300,Y

#_0ED1B0: INY
#_0ED1B1: INY
#_0ED1B2: STY.w $1CDD

#_0ED1B5: INC.w $1CD9

#_0ED1B8: SEP #$30

#_0ED1BA: JMP.w RenderText_DrawMessageCharacters

;===================================================================================================

RenderText_Command7C:
#_0ED1BD: REP #$30

#_0ED1BF: INC.w $1CD9

#_0ED1C2: LDX.w $1CD9

#_0ED1C5: LDA.l $7F1200,X
#_0ED1C9: AND.w #$007F
#_0ED1CC: ASL A
#_0ED1CD: ASL A
#_0ED1CE: ASL A
#_0ED1CF: TAX

#_0ED1D0: LDA.w #$0002
#_0ED1D3: STA.b $00
#_0ED1D5: LDY.w $1CDD

.next
#_0ED1D8: LDA.w Command7CTiles,X
#_0ED1DB: STA.w $12D8,Y

#_0ED1DE: INX
#_0ED1DF: INX

#_0ED1E0: LDA.w Command7CTiles,X
#_0ED1E3: STA.w $1300,Y

#_0ED1E6: INX
#_0ED1E7: INX

#_0ED1E8: INY
#_0ED1E9: INY

#_0ED1EA: DEC.b $00
#_0ED1EC: BNE .next

;---------------------------------------------------------------------------------------------------

#_0ED1EE: STY.w $1CDD

#_0ED1F1: INC.w $1CD9

#_0ED1F4: SEP #$30

#_0ED1F6: JMP.w RenderText_DrawMessageCharacters

;===================================================================================================

RenderText_EmptyBuffer:
#_0ED1F9: PHB

#_0ED1FA: LDA.b #$7F
#_0ED1FC: PHA
#_0ED1FD: PLB

#_0ED1FE: REP #$30

#_0ED200: LDA.w #$07D0
#_0ED203: TAX

;---------------------------------------------------------------------------------------------------

.next
#_0ED204: STZ.w $7F0000,X
#_0ED207: STZ.w $7F0002,X
#_0ED20A: STZ.w $7F0004,X
#_0ED20D: STZ.w $7F0006,X

#_0ED210: STZ.w $7F0008,X
#_0ED213: STZ.w $7F000A,X
#_0ED216: STZ.w $7F000C,X
#_0ED219: STZ.w $7F000E,X

#_0ED21C: SEC
#_0ED21D: SBC.w #$0010
#_0ED220: TAX
#_0ED221: BPL .next

;---------------------------------------------------------------------------------------------------

#_0ED223: PLB

#_0ED224: STZ.w $1CDD

#_0ED227: INC.w $1CD9

#_0ED22A: SEP #$30

#_0ED22C: STZ.w $1CE6

#_0ED22F: RTS

;===================================================================================================

RenderText_PauseForInput:
#_0ED230: LDA.w $1CE9
#_0ED233: BEQ .delay

#_0ED235: DEC A
#_0ED236: STA.w $1CE9

#_0ED239: CMP.b #$01
#_0ED23B: BNE .exit

#_0ED23D: LDA.b #$24 ; SFX3.24
#_0ED23F: STA.w $012F

#_0ED242: BRA .exit

.delay
#_0ED244: LDA.w $00F4
#_0ED247: ORA.w $00F6
#_0ED24A: AND.b #$C0
#_0ED24C: BEQ .exit

#_0ED24E: REP #$30

#_0ED250: INC.w $1CD9

#_0ED253: SEP #$30

#_0ED255: LDA.b #$1C
#_0ED257: STA.w $1CE9

.exit
#_0ED25A: RTS

;===================================================================================================

RenderText_Terminate:
#_0ED25B: LDA.w $1CE9
#_0ED25E: BEQ .delay

#_0ED260: DEC A
#_0ED261: STA.w $1CE9

#_0ED264: CMP.b #$01
#_0ED266: BNE .exit

#_0ED268: LDA.b #$24 ; SFX3.24
#_0ED26A: STA.w $012F

#_0ED26D: BRA .exit

.delay
#_0ED26F: LDA.b $F4
#_0ED271: ORA.b $F6
#_0ED273: BEQ .exit

#_0ED275: LDA.b #$04
#_0ED277: STA.w $1CD4

#_0ED27A: LDA.b #$1C
#_0ED27C: STA.w $1CE9

.exit
#_0ED27F: RTS

;===================================================================================================

RenderText_SetDefaultWindowPosition:
#_0ED280: REP #$30

#_0ED282: LDA.b $20
#_0ED284: SEC
#_0ED285: SBC.b $E8
#_0ED287: CMP.w #$0078

#_0ED28A: ROL A
#_0ED28B: EOR.w #$0001
#_0ED28E: AND.w #$0001

#_0ED291: ASL A
#_0ED292: TAX

#_0ED293: LDA.w RenderText_TextPosition,X
#_0ED296: STA.w $1CD2

#_0ED299: SEP #$30

#_0ED29B: RTS

;===================================================================================================

RenderText_SetDrawParameters:
#_0ED29C: REP #$30

#_0ED29E: LDA.w $1CD2
#_0ED2A1: STA.w $1CD0

#_0ED2A4: LDX.w #$0000
#_0ED2A7: TXY

#_0ED2A8: SEP #$30

#_0ED2AA: RTS

;===================================================================================================

RenderText_DrawBorderRow:
#_0ED2AB: REP #$30

#_0ED2AD: LDA.w $1CD0
#_0ED2B0: XBA
#_0ED2B1: STA.w $1002,X

#_0ED2B4: INX
#_0ED2B5: INX

#_0ED2B6: XBA
#_0ED2B7: CLC
#_0ED2B8: ADC.w #$0020
#_0ED2BB: STA.w $1CD0

#_0ED2BE: LDA.w #$2F00
#_0ED2C1: STA.w $1002,X

#_0ED2C4: INX
#_0ED2C5: INX

#_0ED2C6: LDA.w RenderText_BorderTiles,Y
#_0ED2C9: STA.w $1002,X

#_0ED2CC: INX
#_0ED2CD: INX

#_0ED2CE: INY
#_0ED2CF: INY

#_0ED2D0: LDA.w #$0016
#_0ED2D3: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_0ED2D5: LDA.w RenderText_BorderTiles,Y

.next_row
#_0ED2D8: STA.w $1002,X

#_0ED2DB: INX
#_0ED2DC: INX

#_0ED2DD: DEC.b $0E
#_0ED2DF: BNE .next_row

;---------------------------------------------------------------------------------------------------

#_0ED2E1: INY
#_0ED2E2: INY

#_0ED2E3: LDA.w RenderText_BorderTiles,Y
#_0ED2E6: STA.w $1002,X

#_0ED2E9: INX
#_0ED2EA: INX

#_0ED2EB: RTS

;===================================================================================================

RenderText_BuildCharacterTilemap:
#_0ED2EC: REP #$30

#_0ED2EE: LDX.w #$0000

.next
#_0ED2F1: LDA.w $1CE2
#_0ED2F4: STA.w $1300,X

#_0ED2F7: INC.w $1CE2

#_0ED2FA: INX
#_0ED2FB: INX
#_0ED2FC: CPX.w #$00FC
#_0ED2FF: BCC .next

;---------------------------------------------------------------------------------------------------

#_0ED301: JSR RenderText_DrawACharacter

#_0ED304: SEP #$30

#_0ED306: RTS

;===================================================================================================

RenderText_DrawACharacter:
#_0ED307: REP #$30

#_0ED309: LDA.w #$0006
#_0ED30C: STA.b $0E

#_0ED30E: JSR RenderText_SetDrawParameters

#_0ED311: REP #$30

#_0ED313: LDA.w $1CD0
#_0ED316: CLC
#_0ED317: ADC.w #$0021
#_0ED31A: STA.w $1CD0

;---------------------------------------------------------------------------------------------------

.next
#_0ED31D: LDA.w $1CD0
#_0ED320: XBA
#_0ED321: STA.w $1002,X

#_0ED324: XBA
#_0ED325: CLC
#_0ED326: ADC.w #$0020
#_0ED329: STA.w $1CD0

#_0ED32C: INX
#_0ED32D: INX

#_0ED32E: LDA.w #$2900
#_0ED331: STA.w $1002,X

#_0ED334: INX
#_0ED335: INX
#_0ED336: LDA.w #$0015
#_0ED339: STA.b $0C

.copy
#_0ED33B: LDA.w $1300,Y
#_0ED33E: STA.w $1002,X

#_0ED341: INX
#_0ED342: INX

#_0ED343: INY
#_0ED344: INY

#_0ED345: DEC.b $0C
#_0ED347: BNE .copy

#_0ED349: DEC.b $0E
#_0ED34B: BNE .next

;---------------------------------------------------------------------------------------------------

#_0ED34D: LDA.w #$FFFF
#_0ED350: STA.w $1002,X

#_0ED353: SEP #$30

#_0ED355: LDA.b #$01
#_0ED357: STA.b $14

#_0ED359: RTS

;===================================================================================================

RenderText_InitialSettings:
#_0ED35A: db $00, $00, $00, $00, $00, $00, $00, $00
#_0ED362: db $01, $00, $00, $00, $39, $00, $00, $00
#_0ED36A: db $00

;---------------------------------------------------------------------------------------------------

RenderText_MoreInitialSettings:
#_0ED36B: db $00, $00, $00, $00, $00, $00, $00, $00
#_0ED373: db $1C, $04, $00, $00, $00, $00, $00, $00
#_0ED37B: db $00, $00, $00, $00

;===================================================================================================

RenderText_BorderTiles:
#_0ED37F: dw $28F3, $28F4, $68F3, $28C8
#_0ED387: dw $387F, $68C8, $A8F3, $A8F4
#_0ED38F: dw $E8F3

RenderText_TextPosition:
#_0ED391: dw $6125, $6244

RenderText_ClearStripeDRILL:
#_0ED395: dw $2E42

RenderText_ClearTileFill:
#_0ED397: dw $387F

RenderText_LinePositions:
#_0ED399: dw $0000, $0028, $0050

;===================================================================================================

Command7CTiles:
#_0ED39F: dw $24B8, $24BA, $24BC, $24BE

;---------------------------------------------------------------------------------------------------

Command7BTiles:
#_0ED3A7: dw $24B8, $24BA, $24BC, $24BE

;===================================================================================================

RenderText_WaitTimers:
#_0ED3AF: dw $001F, $003F, $005E, $007D
#_0ED3B7: dw $009C, $00BC, $00DB, $00FA
#_0ED3BF: dw $0119, $0139, $0158, $0177
#_0ED3C7: dw $0196, $01B6, $01D5, $01F4

;===================================================================================================

UNREACH_0ED3CF:
#_0ED3CF: db $08, $03

;===================================================================================================

TextCommandLengths:
#_0ED3D1: db $01, $01, $01, $01, $01, $02, $02, $02
#_0ED3D9: db $02, $01, $01, $01, $01, $01, $01, $01
#_0ED3E1: db $01, $02, $02, $02, $02, $01, $01, $01
#_0ED3E9: db $01, $01

;===================================================================================================

CreateMessagePointers:
#_0ED3EB: PHB
#_0ED3EC: PHK
#_0ED3ED: PLB

#_0ED3EE: LDA.b #Message_Data>>16
#_0ED3F0: STA.b $02

#_0ED3F2: REP #$30

#_0ED3F4: LDA.w #Message_Data
#_0ED3F7: STA.b $00

#_0ED3F9: LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.next_message
#_0ED3FC: LDA.b $00
#_0ED3FE: STA.l $7F71C0,X

#_0ED402: LDA.b $01
#_0ED404: STA.l $7F71C1,X

#_0ED408: INX
#_0ED409: INX
#_0ED40A: INX

.next_byte
#_0ED40B: LDA.b [$00]
#_0ED40D: AND.w #$00FF
#_0ED410: TAY

#_0ED411: LDA.w RenderText_MoreInitialSettings,Y
#_0ED414: AND.w #$00FF
#_0ED417: CPY.w #$0067
#_0ED41A: BCC .not_command

#_0ED41C: CPY.w #$0080
#_0ED41F: BCC .is_command

.not_command
#_0ED421: LDA.w #$0001

.is_command
#_0ED424: CLC
#_0ED425: ADC.b $00
#_0ED427: STA.b $00

#_0ED429: CPY.w #$007F
#_0ED42C: BEQ .next_message

#_0ED42E: CPY.w #$0080
#_0ED431: BNE .not_bank_change

#_0ED433: DEX
#_0ED434: DEX
#_0ED435: DEX

#_0ED436: LDA.w #Message_DataExtra
#_0ED439: STA.b $00

#_0ED43B: LDA.w #Message_DataExtra>>16
#_0ED43E: STA.b $02

#_0ED440: BRA .next_message

.not_bank_change
#_0ED442: CPY.w #$00FF
#_0ED445: BNE .next_byte

;---------------------------------------------------------------------------------------------------

#_0ED447: SEP #$30

#_0ED449: PLB

#_0ED44A: RTL

;===================================================================================================
; FREE ROM: 0x15
;===================================================================================================
NULL_0ED44B:
#_0ED44B: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED453: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED45B: db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

UnderworldPaletteSets:
#_0ED460: db $00, $00, $03, $01 ; 0x00
#_0ED464: db $02, $00, $03, $01 ; 0x01
#_0ED468: db $04, $00, $0A, $01 ; 0x02
#_0ED46C: db $06, $00, $01, $07 ; 0x03
#_0ED470: db $0A, $02, $02, $07 ; 0x04
#_0ED474: db $04, $04, $03, $0A ; 0x05
#_0ED478: db $0C, $05, $08, $14 ; 0x06
#_0ED47C: db $0E, $00, $03, $0A ; 0x07
#_0ED480: db $02, $00, $0F, $14 ; 0x08
#_0ED484: db $0A, $02, $00, $07 ; 0x09
#_0ED488: db $02, $00, $0F, $0C ; 0x0A
#_0ED48C: db $06, $00, $06, $07 ; 0x0B
#_0ED490: db $00, $00, $0E, $12 ; 0x0C
#_0ED494: db $12, $05, $05, $0B ; 0x0D
#_0ED498: db $12, $00, $02, $0C ; 0x0E
#_0ED49C: db $10, $05, $0A, $07 ; 0x0F
#_0ED4A0: db $10, $00, $10, $0C ; 0x10
#_0ED4A4: db $16, $07, $02, $07 ; 0x11
#_0ED4A8: db $16, $00, $07, $0F ; 0x12
#_0ED4AC: db $08, $00, $04, $0C ; 0x13
#_0ED4B0: db $08, $00, $04, $09 ; 0x14
#_0ED4B4: db $04, $00, $03, $01 ; 0x15
#_0ED4B8: db $14, $00, $04, $04 ; 0x16
#_0ED4BC: db $14, $00, $14, $0C ; 0x17
#_0ED4C0: db $18, $05, $07, $0B ; 0x18
#_0ED4C4: db $18, $06, $10, $0C ; 0x19
#_0ED4C8: db $1A, $05, $08, $14 ; 0x1A
#_0ED4CC: db $1A, $02, $00, $07 ; 0x1B
#_0ED4D0: db $06, $00, $03, $0A ; 0x1C
#_0ED4D4: db $1C, $00, $03, $01 ; 0x1D
#_0ED4D8: db $1E, $00, $0B, $11 ; 0x1E
#_0ED4DC: db $04, $00, $0B, $11 ; 0x1F
#_0ED4E0: db $0E, $00, $00, $02 ; 0x20
#_0ED4E4: db $20, $08, $13, $0D ; 0x21
#_0ED4E8: db $0A, $00, $03, $0A ; 0x22
#_0ED4EC: db $14, $00, $04, $04 ; 0x23
#_0ED4F0: db $1A, $02, $02, $07 ; 0x24
#_0ED4F4: db $1A, $0A, $00, $00 ; 0x25
#_0ED4F8: db $00, $00, $03, $02 ; 0x26
#_0ED4FC: db $0E, $00, $03, $07 ; 0x27
#_0ED500: db $1A, $05, $05, $0B ; 0x28

;===================================================================================================

OverworldPaletteSet:
#_0ED504: db $00, $FF, $07, $FF ; 0x00
#_0ED508: db $00, $01, $07, $FF ; 0x01
#_0ED50C: db $00, $02, $07, $FF ; 0x02
#_0ED510: db $00, $03, $07, $FF ; 0x03
#_0ED514: db $00, $04, $07, $FF ; 0x04
#_0ED518: db $00, $05, $07, $FF ; 0x05
#_0ED51C: db $00, $06, $07, $FF ; 0x06
#_0ED520: db $07, $06, $05, $FF ; 0x07
#_0ED524: db $00, $08, $07, $FF ; 0x08
#_0ED528: db $00, $09, $07, $FF ; 0x09
#_0ED52C: db $00, $0A, $07, $FF ; 0x0A
#_0ED530: db $00, $0B, $07, $FF ; 0x0B
#_0ED534: db $00, $FF, $07, $FF ; 0x0C
#_0ED538: db $00, $FF, $07, $FF ; 0x0D
#_0ED53C: db $03, $04, $07, $FF ; 0x0E
#_0ED540: db $04, $04, $03, $FF ; 0x0F
#_0ED544: db $10, $FF, $06, $FF ; 0x10
#_0ED548: db $10, $01, $06, $FF ; 0x11
#_0ED54C: db $10, $11, $06, $FF ; 0x12
#_0ED550: db $10, $03, $06, $FF ; 0x13
#_0ED554: db $10, $04, $06, $FF ; 0x14
#_0ED558: db $10, $05, $06, $FF ; 0x15
#_0ED55C: db $10, $06, $06, $FF ; 0x16
#_0ED560: db $12, $13, $04, $FF ; 0x17
#_0ED564: db $12, $05, $04, $FF ; 0x18
#_0ED568: db $10, $09, $06, $FF ; 0x19
#_0ED56C: db $10, $0B, $06, $FF ; 0x1A
#_0ED570: db $10, $0C, $06, $FF ; 0x1B
#_0ED574: db $10, $0D, $06, $FF ; 0x1C
#_0ED578: db $10, $0E, $06, $FF ; 0x1D
#_0ED57C: db $10, $0F, $06, $FF ; 0x1E

;===================================================================================================

OverworldSpritesPaletteSet:
#_0ED580: db $FF, $FF
#_0ED582: db $03, $0A
#_0ED584: db $03, $06
#_0ED586: db $03, $01
#_0ED588: db $00, $02
#_0ED58A: db $03, $0E
#_0ED58C: db $03, $02
#_0ED58E: db $13, $01
#_0ED590: db $0B, $0C
#_0ED592: db $11, $01
#_0ED594: db $07, $05
#_0ED596: db $11, $00
#_0ED598: db $09, $0B
#_0ED59A: db $0F, $05
#_0ED59C: db $03, $05
#_0ED59E: db $03, $07
#_0ED5A0: db $0F, $02
#_0ED5A2: db $0A, $02
#_0ED5A4: db $05, $01
#_0ED5A6: db $0C, $0E

;===================================================================================================

OverworldPalettesLoader:
#_0ED5A8: ASL A
#_0ED5A9: ASL A
#_0ED5AA: TAX

#_0ED5AB: STZ.w $0AA9

#_0ED5AE: LDA.l OverworldPaletteSet+0,X
#_0ED5B2: BMI .dont_change_a

#_0ED5B4: STA.w $0AB4

.dont_change_a
#_0ED5B7: LDA.l OverworldPaletteSet+1,X
#_0ED5BB: BMI .dont_change_b

#_0ED5BD: STA.w $0AB5

.dont_change_b
#_0ED5C0: LDA.l OverworldPaletteSet+2,X
#_0ED5C4: BMI .dont_change_c

#_0ED5C6: STA.w $0AB8

.dont_change_c
#_0ED5C9: LDA.b $00
#_0ED5CB: ASL A
#_0ED5CC: TAX

#_0ED5CD: LDA.l OverworldSpritesPaletteSet+0,X
#_0ED5D1: BMI .dont_change_d

#_0ED5D3: STA.w $0AAD

.dont_change_d
#_0ED5D6: LDA.l OverworldSpritesPaletteSet+1,X
#_0ED5DA: BMI .dont_change_e

#_0ED5DC: STA.w $0AAE

.dont_change_e
#_0ED5DF: JSL Palettes_Load_OWBG1
#_0ED5E3: JSL Palettes_Load_OWBG2
#_0ED5E7: JSL Palettes_Load_OWBG3

#_0ED5EB: JSL Palettes_Load_SpriteAux1
#_0ED5EF: JSL Palettes_Load_SpriteAux2

#_0ED5F3: RTL

;===================================================================================================

SetBGandFixedColorBlack:
#_0ED5F4: REP #$20

#_0ED5F6: LDA.w #$0000 ; RGB #000000

;===================================================================================================

SetBGColorMainBuffer:
#_0ED5F9: STA.l $7EC500
#_0ED5FD: STA.l $7EC540

;===================================================================================================

SetBGColorCacheOnly:
#_0ED601: STA.l $7EC300
#_0ED605: STA.l $7EC340

#_0ED609: SEP #$30

;===================================================================================================

FixedColorBlack:
#_0ED60B: LDA.b #$20 ; Fixed color RGB: #000000
#_0ED60D: STA.b $9C

#_0ED60F: LDA.b #$40
#_0ED611: STA.b $9D

#_0ED613: LDA.b #$80
#_0ED615: STA.b $9E

#_0ED617: RTL

;===================================================================================================

Overworld_SetScreenBGColor:
#_0ED618: JSR .do_ittttt

#_0ED61B: BRA SetBGColorMainBuffer

;---------------------------------------------------------------------------------------------------

#Overworld_SetScreenBGColorCacheOnly:
#_0ED61D: JSR .do_ittttt

#_0ED620: BRA SetBGColorCacheOnly

;---------------------------------------------------------------------------------------------------

.do_ittttt
#_0ED622: REP #$30

#_0ED624: LDX.w #$2669 ; RGB: #489848

#_0ED627: LDA.b $8A
#_0ED629: CMP.w #$0080 ; SPOW
#_0ED62C: BCC .normal_overworld

#_0ED62E: LDA.b $A0
#_0ED630: CMP.w #$0183 ; OW 83
#_0ED633: BEQ .special_area

#_0ED635: CMP.w #$0182 ; OW 82
#_0ED638: BEQ .special_area

#_0ED63A: CMP.w #$0180 ; OW 80
#_0ED63D: BNE .set_color

.special_area
#_0ED63F: LDX.w #$19C6 ; RGB: #307030
#_0ED642: BRA .set_color

.normal_overworld
#_0ED644: LDX.w #$2669 ; RGB: #489848

#_0ED647: LDA.b $8A

#_0ED649: AND.w #$0040
#_0ED64C: BEQ .set_color

#_0ED64E: LDX.w #$2A32 ; RGB: #908850

.set_color
#_0ED651: TXA

#_0ED652: RTS

;===================================================================================================

UNREACHABLE_0ED653:
#_0ED653: LDA.b #$01
#_0ED655: STA.b $EE

;===================================================================================================

Palette_AssertTranslucencySwap:
#_0ED657: LDA.b #$01
#_0ED659: STA.w $0ABD

.apply
#_0ED65C: REP #$21

#_0ED65E: LDX.b #$00

.copy_next
#_0ED660: LDA.l $7EC400,X
#_0ED664: PHA

#_0ED665: LDA.l $7EC4E0,X
#_0ED669: STA.l $7EC400,X
#_0ED66D: STA.l $7EC600,X

#_0ED671: PLA
#_0ED672: STA.l $7EC4E0,X
#_0ED676: STA.l $7EC6E0,X

#_0ED67A: LDA.l $7EC410,X
#_0ED67E: PHA

#_0ED67F: LDA.l $7EC4F0,X
#_0ED683: STA.l $7EC410,X
#_0ED687: STA.l $7EC610,X

#_0ED68B: PLA
#_0ED68C: STA.l $7EC4F0,X
#_0ED690: STA.l $7EC6F0,X

#_0ED694: LDA.l $7EC4B0,X
#_0ED698: PHA

#_0ED699: LDA.l $7EC470,X
#_0ED69D: STA.l $7EC4B0,X
#_0ED6A1: STA.l $7EC6B0,X

#_0ED6A5: PLA
#_0ED6A6: STA.l $7EC470,X
#_0ED6AA: STA.l $7EC670,X

#_0ED6AE: INX
#_0ED6AF: INX
#_0ED6B0: CPX.b #$10
#_0ED6B2: BNE .copy_next

;---------------------------------------------------------------------------------------------------

#_0ED6B4: SEP #$20

#_0ED6B6: INC.b $15

#_0ED6B8: RTL

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_0ED6B9:
#_0ED6B9: STZ.b $EE

;---------------------------------------------------------------------------------------------------

#Palette_RevertTranslucencySwap:
#_0ED6BB: STZ.w $0ABD

#_0ED6BE: BRA .apply

;===================================================================================================

RefreshLinkEquipmentPalettes_sword_and_mail:
#_0ED6C0: REP #$20

#_0ED6C2: LDA.l $7EF359
#_0ED6C6: STA.b $0C

#_0ED6C8: LDA.l $7EF35B
#_0ED6CC: AND.w #$00FF
#_0ED6CF: BRA RefreshLinkEquipmentPalettes

;===================================================================================================

RefreshLinkEquipmentPalettes_zap:
#_0ED6D1: REP #$20

#_0ED6D3: LDA.w #$0202
#_0ED6D6: STA.b $0C

#_0ED6D8: LDA.w #$0404
#_0ED6DB: BRA RefreshLinkEquipmentPalettes

;===================================================================================================

RefreshLinkEquipmentPalettes_bunny:
#_0ED6DD: REP #$20

#_0ED6DF: LDA.l $7EF359
#_0ED6E3: STA.b $0C

#_0ED6E5: LDA.w #$0303

;===================================================================================================

RefreshLinkEquipmentPalettes:
#_0ED6E8: STA.b $0E

#_0ED6EA: LDA.w #PaletteData>>16
#_0ED6ED: STA.b $02

#_0ED6EF: LDX.b $0C

#_0ED6F1: LDA.l SwordPaletteOffsets,X
#_0ED6F5: AND.w #$00FF
#_0ED6F8: CLC
#_0ED6F9: ADC.w #PaletteData_sword_00

#_0ED6FC: REP #$10

#_0ED6FE: LDX.w #$01B2
#_0ED701: LDY.w #$0002
#_0ED704: JSR .copy_palette

;---------------------------------------------------------------------------------------------------

#_0ED707: SEP #$10

#_0ED709: LDX.b $0D

#_0ED70B: LDA.l ShieldPaletteOffsets,X
#_0ED70F: AND.w #$00FF
#_0ED712: CLC
#_0ED713: ADC.w #PaletteData_shield_00

#_0ED716: REP #$10

#_0ED718: LDX.w #$01B8
#_0ED71B: LDY.w #$0003
#_0ED71E: JSR .copy_palette

;---------------------------------------------------------------------------------------------------

#_0ED721: SEP #$10

#_0ED723: LDX.b $0E

#_0ED725: LDA.l LinkMailPalettesOffsets,X
#_0ED729: AND.w #$00FF
#_0ED72C: ASL A
#_0ED72D: CLC
#_0ED72E: ADC.w #PaletteData_link_00

#_0ED731: REP #$10

#_0ED733: LDX.w #$01E2
#_0ED736: LDY.w #$000E
#_0ED739: JSR .copy_palette

;---------------------------------------------------------------------------------------------------

#_0ED73C: SEP #$30

#_0ED73E: INC.b $15

#_0ED740: RTL

;---------------------------------------------------------------------------------------------------

.copy_palette
#_0ED741: STA.b $00

.next_color
#_0ED743: LDA.b [$00]
#_0ED745: STA.l $7EC300,X
#_0ED749: STA.l $7EC500,X

#_0ED74D: INC.b $00
#_0ED74F: INC.b $00

#_0ED751: INX
#_0ED752: INX

#_0ED753: DEY
#_0ED754: BPL .next_color

#_0ED756: RTS

;===================================================================================================

PaletteFilter_Oversaturation:
#_0ED757: REP #$20

#_0ED759: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_color
#_0ED75B: LDA.l $7EC340,X
#_0ED75F: JSR OversaturateColor
#_0ED762: STA.l $7EC540,X

#_0ED766: LDA.l $7EC350,X
#_0ED76A: JSR OversaturateColor
#_0ED76D: STA.l $7EC550,X

#_0ED771: LDA.l $7EC360,X
#_0ED775: JSR OversaturateColor
#_0ED778: STA.l $7EC560,X

#_0ED77C: LDA.l $7EC370,X
#_0ED780: JSR OversaturateColor
#_0ED783: STA.l $7EC570,X

#_0ED787: LDA.l $7EC380,X
#_0ED78B: JSR OversaturateColor
#_0ED78E: STA.l $7EC580,X

#_0ED792: LDA.l $7EC390,X
#_0ED796: JSR OversaturateColor
#_0ED799: STA.l $7EC590,X

#_0ED79D: LDA.l $7EC3A0,X
#_0ED7A1: JSR OversaturateColor
#_0ED7A4: STA.l $7EC5A0,X

#_0ED7A8: LDA.l $7EC3B0,X
#_0ED7AC: JSR OversaturateColor
#_0ED7AF: STA.l $7EC5B0,X

#_0ED7B3: LDA.l $7EC3C0,X
#_0ED7B7: JSR OversaturateColor
#_0ED7BA: STA.l $7EC5C0,X

#_0ED7BE: LDA.l $7EC3D0,X
#_0ED7C2: JSR OversaturateColor
#_0ED7C5: STA.l $7EC5D0,X

#_0ED7C9: LDA.l $7EC3E0,X
#_0ED7CD: JSR OversaturateColor
#_0ED7D0: STA.l $7EC5E0,X

#_0ED7D4: LDA.l $7EC3F0,X
#_0ED7D8: JSR OversaturateColor
#_0ED7DB: STA.l $7EC5F0,X

#_0ED7DF: INX
#_0ED7E0: INX
#_0ED7E1: CPX.b #$10
#_0ED7E3: BEQ .done

#_0ED7E5: JMP.w .next_color

;---------------------------------------------------------------------------------------------------

.done
#_0ED7E8: REP #$10

#_0ED7EA: LDA.l $7EC540
#_0ED7EE: TAY

#_0ED7EF: LDA.l $7EC300
#_0ED7F3: BNE .dont_copy_that

#_0ED7F5: TAY

.dont_copy_that
#_0ED7F6: TYA
#_0ED7F7: STA.l $7EC500

#_0ED7FB: SEP #$30

#_0ED7FD: RTL

;===================================================================================================

OversaturateColor:
#_0ED7FE: STA.b $00

#_0ED800: AND.w #$001F
#_0ED803: CLC
#_0ED804: ADC.w #$000E

#_0ED807: CMP.w #$001F
#_0ED80A: BCC .oversaturated_r

#_0ED80C: LDA.w #$001F

.oversaturated_r
#_0ED80F: STA.b $02

#_0ED811: LDA.b $00
#_0ED813: AND.w #$03E0
#_0ED816: CLC
#_0ED817: ADC.w #$01C0

#_0ED81A: CMP.w #$03E0
#_0ED81D: BCC .oversaturated_g

#_0ED81F: LDA.w #$03E0

.oversaturated_g
#_0ED822: STA.b $04

#_0ED824: LDA.b $00
#_0ED826: AND.w #$7C00
#_0ED829: CLC
#_0ED82A: ADC.w #$3800

#_0ED82D: CMP.w #$7C00
#_0ED830: BCC .oversaturated_b

#_0ED832: LDA.w #$7C00

.oversaturated_b
#_0ED835: ORA.b $02
#_0ED837: ORA.b $04

#_0ED839: RTS

;===================================================================================================

Palette_RestoreBGFromFlash:
#_0ED83A: REP #$20

#_0ED83C: LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_color
#_0ED83E: LDA.l $7EC340,X
#_0ED842: STA.l $7EC540,X

#_0ED846: LDA.l $7EC350,X
#_0ED84A: STA.l $7EC550,X

#_0ED84E: LDA.l $7EC360,X
#_0ED852: STA.l $7EC560,X

#_0ED856: LDA.l $7EC370,X
#_0ED85A: STA.l $7EC570,X

#_0ED85E: LDA.l $7EC380,X
#_0ED862: STA.l $7EC580,X

#_0ED866: LDA.l $7EC390,X
#_0ED86A: STA.l $7EC590,X

#_0ED86E: LDA.l $7EC3A0,X
#_0ED872: STA.l $7EC5A0,X

#_0ED876: LDA.l $7EC3B0,X
#_0ED87A: STA.l $7EC5B0,X

#_0ED87E: LDA.l $7EC3C0,X
#_0ED882: STA.l $7EC5C0,X

#_0ED886: LDA.l $7EC3D0,X
#_0ED88A: STA.l $7EC5D0,X

#_0ED88E: LDA.l $7EC3E0,X
#_0ED892: STA.l $7EC5E0,X

#_0ED896: LDA.l $7EC3F0,X
#_0ED89A: STA.l $7EC5F0,X

#_0ED89E: INX
#_0ED89F: INX
#_0ED8A0: CPX.b #$10
#_0ED8A2: BNE .next_color

#_0ED8A4: LDA.l $7EC540
#_0ED8A8: STA.l $7EC500

#_0ED8AC: SEP #$30

;===================================================================================================

Palette_RestoreFixedColor:
#_0ED8AE: LDA.b $1B
#_0ED8B0: BNE .exit

#_0ED8B2: REP #$10

#_0ED8B4: LDX.w #$4020 ; Fixed color RGB: #000000
#_0ED8B7: STX.b $9C

#_0ED8B9: LDX.w #$8040
#_0ED8BC: STX.b $9D

#_0ED8BE: LDX.w #$4F33 ; Fixed color RGB: #987848
#_0ED8C1: LDY.w #$894F

#_0ED8C4: LDA.b $8A ; OW 00
#_0ED8C6: BEQ .exit

#_0ED8C8: CMP.b #$40 ; OW 40
#_0ED8CA: BEQ .exit

#_0ED8CC: CMP.b #$5B ; OW 5B
#_0ED8CE: BEQ .set_fixedcol

#_0ED8D0: LDX.w #$4C26 ; Fixed color RGB: #306060
#_0ED8D3: LDY.w #$8C4C

#_0ED8D6: CMP.b #$03 ; OW 03
#_0ED8D8: BEQ .set_fixedcol

#_0ED8DA: CMP.b #$05 ; OW 05
#_0ED8DC: BEQ .set_fixedcol

#_0ED8DE: CMP.b #$07 ; OW 07
#_0ED8E0: BEQ .set_fixedcol

#_0ED8E2: LDX.w #$4A26 ; Fixed color RGB: #305038
#_0ED8E5: LDY.w #$874A

#_0ED8E8: CMP.b #$43 ; OW 43
#_0ED8EA: BEQ .set_fixedcol

#_0ED8EC: CMP.b #$45 ; OW 45
#_0ED8EE: BEQ .set_fixedcol

#_0ED8F0: CMP.b #$47 ; OW 47
#_0ED8F2: BNE .exit

.set_fixedcol
#_0ED8F4: STX.b $9C
#_0ED8F6: STY.b $9D

.exit
#_0ED8F8: SEP #$10

#_0ED8FA: RTL

;===================================================================================================

Palette_RestoreBGAndHUD:
#_0ED8FB: REP #$20

#_0ED8FD: LDX.b #$7E

.next_color
#_0ED8FF: LDA.l $7EC300,X
#_0ED903: STA.l $7EC500,X

#_0ED907: LDA.l $7EC380,X
#_0ED90B: STA.l $7EC580,X

#_0ED90F: DEX
#_0ED910: DEX
#_0ED911: BPL .next_color

#_0ED913: SEP #$20

#_0ED915: INC.b $15

#_0ED917: JMP.w Palette_RestoreFixedColor

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_0ED91A:
#_0ED91A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED922: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED92A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED932: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0ED93A: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_03_02_BrightenMap:
#_0ED940: INC.b $13

#_0ED942: LDA.b $13
#_0ED944: CMP.b #$0F
#_0ED946: BNE EXIT_0ED94B

#_0ED948: INC.w $0200

;---------------------------------------------------------------------------------------------------

#EXIT_0ED94B:
#_0ED94B: RTL

;===================================================================================================

Module0E_03_00_DarkenAndPrep:
#_0ED94C: DEC.b $13
#_0ED94E: BNE EXIT_0ED94B

#_0ED950: LDA.b #$03
#_0ED952: STA.b $95

#_0ED954: LDA.b $9B
#_0ED956: STA.l $7EC229

#_0ED95A: JSL EnableForceBlank

#_0ED95E: INC.w $0200
#_0ED961: STZ.w $020D

#_0ED964: LDA.b #$20 ; Fixed color RGB: #000000
#_0ED966: STA.b $9C

#_0ED968: LDA.b #$40
#_0ED96A: STA.b $9D

#_0ED96C: LDA.b #$80
#_0ED96E: STA.b $9E

#_0ED970: REP #$20

#_0ED972: LDA.w #$0250
#_0ED975: STA.w $0100

;---------------------------------------------------------------------------------------------------

#_0ED978: LDX.b #$7E

.next_colors
#_0ED97A: LDA.l $7EC500,X
#_0ED97E: STA.l $7FDD80,X

#_0ED982: LDA.l $7EC580,X
#_0ED986: STA.l $7FDE00,X

#_0ED98A: LDA.l $7EC600,X
#_0ED98E: STA.l $7FDE80,X

#_0ED992: LDA.l $7EC680,X
#_0ED996: STA.l $7FDF00,X

#_0ED99A: DEX
#_0ED99B: DEX
#_0ED99C: BPL .next_colors

;---------------------------------------------------------------------------------------------------

#_0ED99E: LDA.w $011A
#_0ED9A1: STA.l $7EC221

#_0ED9A5: LDA.w $011C
#_0ED9A8: STA.l $7EC223

#_0ED9AC: STZ.w $011A
#_0ED9AF: STZ.w $011C

#_0ED9B2: LDA.b $E0
#_0ED9B4: STA.l $7EC200

#_0ED9B8: LDA.b $E2
#_0ED9BA: STA.l $7EC202

#_0ED9BE: LDA.b $E6
#_0ED9C0: STA.l $7EC204

#_0ED9C4: LDA.b $E8
#_0ED9C6: STA.l $7EC206

#_0ED9CA: STZ.b $E0
#_0ED9CC: STZ.b $E2
#_0ED9CE: STZ.b $E4
#_0ED9D0: STZ.b $E6
#_0ED9D2: STZ.b $E8
#_0ED9D4: STZ.b $EA

#_0ED9D6: LDA.b $99
#_0ED9D8: STA.l $7EC225

#_0ED9DC: LDA.w #$2002
#_0ED9DF: STA.b $99

#_0ED9E1: LDX.b #$00
#_0ED9E3: LDA.w #$0300

.tilemap_fill
#_0ED9E6: STA.l $7F0000,X
#_0ED9EA: STA.l $7F0100,X
#_0ED9EE: STA.l $7F0200,X
#_0ED9F2: STA.l $7F0300,X

#_0ED9F6: STA.l $7F0400,X
#_0ED9FA: STA.l $7F0500,X
#_0ED9FE: STA.l $7F0600,X
#_0EDA02: STA.l $7F0700,X

#_0EDA06: STA.l $7F0800,X
#_0EDA0A: STA.l $7F0900,X
#_0EDA0E: STA.l $7F0A00,X
#_0EDA12: STA.l $7F0B00,X

#_0EDA16: STA.l $7F0C00,X
#_0EDA1A: STA.l $7F0D00,X
#_0EDA1E: STA.l $7F0E00,X
#_0EDA22: STA.l $7F0F00,X

#_0EDA26: DEX
#_0EDA27: DEX
#_0EDA28: BNE .tilemap_fill

;---------------------------------------------------------------------------------------------------

#_0EDA2A: SEP #$20

#_0EDA2C: LDA.b #$10 ; SFX3.10
#_0EDA2E: STA.w $012F

#_0EDA31: LDA.b #$F2 ; SONG F2 - half volume
#_0EDA33: STA.w $012C

#_0EDA36: RTL

;===================================================================================================

UnderworldMap_RecoverRegisters:
#_0EDA37: DEC.b $13
#_0EDA39: BNE .exit

#_0EDA3B: JSL EnableForceBlank

#_0EDA3F: INC.w $0200

#_0EDA42: REP #$30

#_0EDA44: LDA.l $7EC225
#_0EDA48: STA.b $99

#_0EDA4A: LDA.l $7EC200
#_0EDA4E: STA.b $E0

#_0EDA50: LDA.l $7EC202
#_0EDA54: STA.b $E2

#_0EDA56: LDA.l $7EC204
#_0EDA5A: STA.b $E6

#_0EDA5C: LDA.l $7EC206
#_0EDA60: STA.b $E8

#_0EDA62: STZ.b $E4
#_0EDA64: STZ.b $EA

#_0EDA66: LDA.l $7EC221
#_0EDA6A: STA.w $011A

#_0EDA6D: LDA.l $7EC223
#_0EDA71: STA.w $011C

#_0EDA74: SEP #$30

#_0EDA76: INC.b $15

.exit
#_0EDA78: RTL

;===================================================================================================

UnderworldMap_RecoverLightCone:
#_0EDA79: JSL OrientLampLightCone

#_0EDA7D: INC.b $13

#_0EDA7F: LDA.b $13
#_0EDA81: CMP.b #$0F
#_0EDA83: BNE .exit

#_0EDA85: LDA.w $010C
#_0EDA88: STA.b $10

#_0EDA8A: STZ.b $11
#_0EDA8C: STZ.w $0200
#_0EDA8F: STZ.b $B0

#_0EDA91: LDA.b #$0F
#_0EDA93: STA.b $13

#_0EDA95: LDA.l $7EC229
#_0EDA99: STA.b $9B

.exit
#_0EDA9B: RTL

;===================================================================================================

DungeonMap_BG3Tilemap:
#_0EDA9C: dw $4260, $0100 ; VRAM $C084 | 2 bytes | Horizontal
#_0EDAA0: dw $2100

#_0EDAA2: dw $4360, $0E40 ; VRAM $C086 | 16 bytes | Fixed horizontal
#_0EDAA6: dw $2101

#_0EDAA8: dw $4B60, $0100 ; VRAM $C096 | 2 bytes | Horizontal
#_0EDAAC: dw $6100

#_0EDAAE: dw $6260, $2EC0 ; VRAM $C0C4 | 48 bytes | Fixed vertical
#_0EDAB2: dw $2110

#_0EDAB4: dw $6B60, $2EC0 ; VRAM $C0D6 | 48 bytes | Fixed vertical
#_0EDAB8: dw $6110

#_0EDABA: dw $6263, $0100 ; VRAM $C6C4 | 2 bytes | Horizontal
#_0EDABE: dw $A100

#_0EDAC0: dw $6363, $0E40 ; VRAM $C6C6 | 16 bytes | Fixed horizontal
#_0EDAC4: dw $A101

#_0EDAC6: dw $6B63, $0100 ; VRAM $C6D6 | 2 bytes | Horizontal
#_0EDACA: dw $E100

#_0EDACC: dw $8460, $0B00 ; VRAM $C108 | 12 bytes | Horizontal
#_0EDAD0: dw $2102, $2103, $2104, $2105, $2106, $2107

#_0EDADC: dw $A460, $0B00 ; VRAM $C148 | 12 bytes | Horizontal
#_0EDAE0: dw $2112, $2113, $2114, $2115, $2116, $2117

#_0EDAEC: dw $4E60, $0100 ; VRAM $C09C | 2 bytes | Horizontal
#_0EDAF0: dw $2100

#_0EDAF2: dw $4F60, $1A40 ; VRAM $C09E | 28 bytes | Fixed horizontal
#_0EDAF6: dw $2101

#_0EDAF8: dw $5D60, $0100 ; VRAM $C0BA | 2 bytes | Horizontal
#_0EDAFC: dw $6100

#_0EDAFE: dw $6E60, $2EC0 ; VRAM $C0DC | 48 bytes | Fixed vertical
#_0EDB02: dw $2110

#_0EDB04: dw $7D60, $2EC0 ; VRAM $C0FA | 48 bytes | Fixed vertical
#_0EDB08: dw $6110

#_0EDB0A: dw $6E63, $0100 ; VRAM $C6DC | 2 bytes | Horizontal
#_0EDB0E: dw $A100

#_0EDB10: dw $6F63, $1A40 ; VRAM $C6DE | 28 bytes | Fixed horizontal
#_0EDB14: dw $A101

#_0EDB16: dw $7D63, $0100 ; VRAM $C6FA | 2 bytes | Horizontal
#_0EDB1A: dw $E100

#_0EDB1C: dw $0060, $7E40 ; VRAM $C000 | 128 bytes | Fixed horizontal
#_0EDB20: dw $2111

#_0EDB22: dw $8063, $3E41 ; VRAM $C700 | 320 bytes | Fixed horizontal
#_0EDB26: dw $2111

#_0EDB28: dw $0060, $3EC0 ; VRAM $C000 | 64 bytes | Fixed vertical
#_0EDB2C: dw $2111

#_0EDB2E: dw $0160, $3EC0 ; VRAM $C002 | 64 bytes | Fixed vertical
#_0EDB32: dw $2111

#_0EDB34: dw $0C60, $3EC0 ; VRAM $C018 | 64 bytes | Fixed vertical
#_0EDB38: dw $2111

#_0EDB3A: dw $0D60, $3EC0 ; VRAM $C01A | 64 bytes | Fixed vertical
#_0EDB3E: dw $2111

#_0EDB40: dw $1E60, $3EC0 ; VRAM $C03C | 64 bytes | Fixed vertical
#_0EDB44: dw $2111

#_0EDB46: dw $1F60, $3EC0 ; VRAM $C03E | 64 bytes | Fixed vertical
#_0EDB4A: dw $2111

#_0EDB4C: dw $9110, $12C0 ; VRAM $2122 | 20 bytes | Fixed vertical
#_0EDB50: dw $0B12

#_0EDB52: dw $9210, $1300 ; VRAM $2124 | 20 bytes | Horizontal
#_0EDB56: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDB66: dw $0B06, $0B30

#_0EDB6A: dw $B310, $1100 ; VRAM $2166 | 18 bytes | Horizontal
#_0EDB6E: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDB7E: dw $0B12

#_0EDB80: dw $D210, $1300 ; VRAM $21A4 | 20 bytes | Horizontal
#_0EDB84: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDB94: dw $0B06, $0B30

#_0EDB98: dw $F310, $1100 ; VRAM $21E6 | 18 bytes | Horizontal
#_0EDB9C: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDBAC: dw $0B12

#_0EDBAE: dw $1211, $1300 ; VRAM $2224 | 20 bytes | Horizontal
#_0EDBB2: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDBC2: dw $0B06, $0B30

#_0EDBC6: dw $3311, $1100 ; VRAM $2266 | 18 bytes | Horizontal
#_0EDBCA: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDBDA: dw $0B12

#_0EDBDC: dw $5211, $1300 ; VRAM $22A4 | 20 bytes | Horizontal
#_0EDBE0: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDBF0: dw $0B06, $0B30

#_0EDBF4: dw $7311, $1100 ; VRAM $22E6 | 18 bytes | Horizontal
#_0EDBF8: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDC08: dw $0B12

#_0EDC0A: dw $9211, $1300 ; VRAM $2324 | 20 bytes | Horizontal
#_0EDC0E: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDC1E: dw $0B06, $0B30

#_0EDC22: dw $B311, $1100 ; VRAM $2366 | 18 bytes | Horizontal
#_0EDC26: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDC36: dw $0B12

#_0EDC38: dw $D211, $1240 ; VRAM $23A4 | 20 bytes | Fixed horizontal
#_0EDC3C: dw $0B06

#_0EDC3E: dw $1112, $12C0 ; VRAM $2422 | 20 bytes | Fixed vertical
#_0EDC42: dw $0B12

#_0EDC44: dw $1212, $1300 ; VRAM $2424 | 20 bytes | Horizontal
#_0EDC48: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDC58: dw $0B06, $0B30

#_0EDC5C: dw $3312, $1100 ; VRAM $2466 | 18 bytes | Horizontal
#_0EDC60: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDC70: dw $0B12

#_0EDC72: dw $5212, $1300 ; VRAM $24A4 | 20 bytes | Horizontal
#_0EDC76: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDC86: dw $0B06, $0B30

#_0EDC8A: dw $7312, $1100 ; VRAM $24E6 | 18 bytes | Horizontal
#_0EDC8E: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDC9E: dw $0B12

#_0EDCA0: dw $9212, $1300 ; VRAM $2524 | 20 bytes | Horizontal
#_0EDCA4: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDCB4: dw $0B06, $0B30

#_0EDCB8: dw $B312, $1100 ; VRAM $2566 | 18 bytes | Horizontal
#_0EDCBC: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDCCC: dw $0B12

#_0EDCCE: dw $D212, $1300 ; VRAM $25A4 | 20 bytes | Horizontal
#_0EDCD2: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDCE2: dw $0B06, $0B30

#_0EDCE6: dw $F312, $1100 ; VRAM $25E6 | 18 bytes | Horizontal
#_0EDCEA: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDCFA: dw $0B12

#_0EDCFC: dw $1213, $1300 ; VRAM $2624 | 20 bytes | Horizontal
#_0EDD00: dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
#_0EDD10: dw $0B06, $0B30

#_0EDD14: dw $3313, $1100 ; VRAM $2666 | 18 bytes | Horizontal
#_0EDD18: dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
#_0EDD28: dw $0B12

#_0EDD2A: dw $5213, $1240 ; VRAM $26A4 | 20 bytes | Fixed horizontal
#_0EDD2E: dw $0B06

#_0EDD30: db $FF ; end of stripes data

;===================================================================================================
; FREE ROM: 0x0F
;===================================================================================================
NULL_0EDD31:
#_0EDD31: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EDD39: db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Overworld_MemorizeMap16Change:
#_0EDD40: CMP.w #$0DC5 ; cut grass
#_0EDD43: BEQ .exit

#_0EDD45: CMP.w #$0DC9 ; dirt patch
#_0EDD48: BEQ .exit

#_0EDD4A: PHA
#_0EDD4B: PHX

#_0EDD4C: TXY

#_0EDD4D: LDX.w $04AC
#_0EDD50: STA.l $7EFA00,X

#_0EDD54: TYA
#_0EDD55: STA.l $7EF800,X

#_0EDD59: INX
#_0EDD5A: INX
#_0EDD5B: STX.w $04AC

#_0EDD5E: PLX
#_0EDD5F: PLA

.exit
#_0EDD60: RTL

;===================================================================================================

TRPegLocations:
#_0EDD61: dw $0826, $05A0, $081A

;---------------------------------------------------------------------------------------------------

HandlePegPuzzles:
#_0EDD67: LDA.b $8A
#_0EDD69: CMP.w #$0007 ; OW 07
#_0EDD6C: BNE HandleStakeField

#_0EDD6E: LDA.l $7EF287
#_0EDD72: AND.w #$0020
#_0EDD75: BNE .exit

#_0EDD77: STX.b $00

#_0EDD79: LDX.w $04C8
#_0EDD7C: CPX.w #$FFFF
#_0EDD7F: BEQ .fail

#_0EDD81: LDA.l TRPegLocations,X
#_0EDD85: CMP.b $00
#_0EDD87: BNE .fail

#_0EDD89: LDA.w #$2D00 ; SFX3.2D; Writes #$2D00, which unqueues SFX2.
#_0EDD8C: STA.w $012E

#_0EDD8F: INX
#_0EDD90: INX
#_0EDD91: STX.w $04C8

#_0EDD94: CPX.w #$0006
#_0EDD97: BNE .unsolved

#_0EDD99: LDA.w #$1B00 ; SFX3.1B; Writes #$1B00, which unqueues SFX2.
#_0EDD9C: STA.w $012E

#_0EDD9F: LDA.l $7EF287
#_0EDDA3: ORA.w #$0020
#_0EDDA6: STA.l $7EF287

#_0EDDAA: SEP #$20

#_0EDDAC: LDA.b #$2F
#_0EDDAE: STA.b $11

#_0EDDB0: REP #$20

.unsolved
#_0EDDB2: LDX.b $00

#_0EDDB4: RTL

;---------------------------------------------------------------------------------------------------

.fail
#_0EDDB5: LDA.w #$003C ; SFX2.3C; Writes #$003C, which unqueues SFX3.
#_0EDDB8: STA.w $012E

#_0EDDBB: LDA.w #$FFFF
#_0EDDBE: STA.w $04C8

#_0EDDC1: LDX.b $00

.exit
#_0EDDC3: RTL

;===================================================================================================

HandleStakeField:
#_0EDDC4: CMP.w #$0062
#_0EDDC7: BNE .exit

#_0EDDC9: INC.w $04C8

#_0EDDCC: LDA.w $04C8
#_0EDDCF: CMP.w #$0016
#_0EDDD2: BNE .exit

#_0EDDD4: PHX

#_0EDDD5: SEP #$20

#_0EDDD7: LDA.l $7EF2E2
#_0EDDDB: ORA.b #$20
#_0EDDDD: STA.l $7EF2E2

#_0EDDE1: LDA.b #$1B ; SFX3.1B
#_0EDDE3: STA.w $012F

#_0EDDE6: REP #$20

#_0EDDE8: LDA.w #$0050
#_0EDDEB: STA.w $0692

#_0EDDEE: LDA.w #$0D20
#_0EDDF1: STA.w $0698

#_0EDDF4: JSL Overworld_DoMapUpdate32x32_long

#_0EDDF8: REP #$30

#_0EDDFA: PLX

.exit
#_0EDDFB: RTL

;===================================================================================================

GanonsTower_FlashAfterCrystals:
#_0EDDFC: LDA.b $B0
#_0EDDFE: BNE .skip_sfx

#_0EDE00: LDA.b #$2E ; SFX2.2E
#_0EDE02: STA.w $012E

#_0EDE05: JML PaletteBlackAndWhiteSomething

;---------------------------------------------------------------------------------------------------

.skip_sfx
#_0EDE09: JSL PaletteFilter_BlindingWhite

#_0EDE0D: REP #$30

#_0EDE0F: LDA.l $7EC009
#_0EDE13: CMP.w #$00FF
#_0EDE16: BNE .dont_advance_step

#_0EDE18: STA.l $7EC007
#_0EDE1C: STA.l $7EC009

#_0EDE20: SEP #$30

#_0EDE22: INC.b $B0

#_0EDE24: RTL

;---------------------------------------------------------------------------------------------------

.dont_advance_step
#_0EDE25: JML RestorePalette

;===================================================================================================

pool Overworld_CheckForSpecialOverworldTrigger

.tile_type
#_0EDE29: dw $0105
#_0EDE2B: dw $01E4
#_0EDE2D: dw $00AD
#_0EDE2F: dw $00B9

.screen_id
#_0EDE31: dw $0000 ; OW 00
#_0EDE33: dw $002D ; OW 2D
#_0EDE35: dw $000F ; OW 0F
#_0EDE37: dw $0081 ; OW 81

.direction
#_0EDE39: dw $0008
#_0EDE3B: dw $0002
#_0EDE3D: dw $0008
#_0EDE3F: dw $0008

.special_id
#_0EDE41: dw $0180 ; OW 80
#_0EDE43: dw $0181 ; OW 81
#_0EDE45: dw $0182 ; OW 82
#_0EDE47: dw $0189 ; OW 89

pool off

;---------------------------------------------------------------------------------------------------

Overworld_CheckForSpecialOverworldTrigger:
#_0EDE49: REP #$31

#_0EDE4B: JSR GetMap16Tile

#_0EDE4E: LDA.l Map16Definitions,X
#_0EDE52: AND.w #$01FF
#_0EDE55: STA.b $00

#_0EDE57: LDX.w #$0008

.check_next_screen
#_0EDE5A: LDA.b $00

.check_next_tile
#_0EDE5C: DEX
#_0EDE5D: DEX
#_0EDE5E: BMI .exit

#_0EDE60: CMP.l .tile_type,X
#_0EDE64: BNE .check_next_tile

#_0EDE66: LDA.b $8A
#_0EDE68: CMP.l .screen_id,X
#_0EDE6C: BNE .check_next_screen

;---------------------------------------------------------------------------------------------------

#_0EDE6E: LDA.l .special_id,X
#_0EDE72: STA.b $A0

#_0EDE74: SEP #$20

#_0EDE76: LDA.l .direction,X
#_0EDE7A: STA.b $67

#_0EDE7C: STA.w $0410
#_0EDE7F: STA.w $0416

#_0EDE82: LDX.w #$0004

.continue_shifting
#_0EDE85: DEX

#_0EDE86: LSR A
#_0EDE87: BCC .continue_shifting

#_0EDE89: STX.w $0418
#_0EDE8C: STX.w $069C

#_0EDE8F: LDA.b #$17
#_0EDE91: STA.b $11

#_0EDE93: LDA.b #$0B
#_0EDE95: STA.b $10

.exit
#_0EDE97: SEP #$30

#_0EDE99: RTL

;===================================================================================================

GetMap16Tile:
#_0EDE9A: LDA.b $20
#_0EDE9C: CLC
#_0EDE9D: ADC.w #$000C
#_0EDEA0: STA.b $00

#_0EDEA2: SEC
#_0EDEA3: SBC.w $0708

#_0EDEA6: AND.w $070A
#_0EDEA9: ASL A
#_0EDEAA: ASL A
#_0EDEAB: ASL A
#_0EDEAC: STA.b $06

#_0EDEAE: LDA.b $22
#_0EDEB0: CLC
#_0EDEB1: ADC.w #$0008

#_0EDEB4: LSR A
#_0EDEB5: LSR A
#_0EDEB6: LSR A
#_0EDEB7: STA.b $02

#_0EDEB9: SEC
#_0EDEBA: SBC.w $070C

#_0EDEBD: AND.w $070E
#_0EDEC0: CLC
#_0EDEC1: ADC.b $06

#_0EDEC3: TAY
#_0EDEC4: TAX

#_0EDEC5: LDA.l $7E2000,X
#_0EDEC9: ASL A
#_0EDECA: ASL A
#_0EDECB: ASL A
#_0EDECC: TAX

#_0EDECD: RTS

;===================================================================================================

pool SpecialOverworld_CheckForReturnTrigger

.tile_type
#_0EDECE: dw $017C
#_0EDED0: dw $01E4
#_0EDED2: dw $00AD

.screen_id
#_0EDED4: dw $0080 ; OW 80
#_0EDED6: dw $0080 ; OW 80
#_0EDED8: dw $0081 ; OW 81

.direction
#_0EDEDA: dw $0004
#_0EDEDC: dw $0001
#_0EDEDE: dw $0004

pool off

;---------------------------------------------------------------------------------------------------

#EXIT_0EDEE0:
#_0EDEE0: SEP #$30

#_0EDEE2: RTL

;---------------------------------------------------------------------------------------------------

SpecialOverworld_CheckForReturnTrigger:
#_0EDEE3: REP #$31

#_0EDEE5: JSR GetMap16Tile

#_0EDEE8: LDA.l Map16Definitions,X
#_0EDEEC: AND.w #$01FF
#_0EDEEF: STA.b $00

#_0EDEF1: LDX.w #$0006

.check_next_screen
#_0EDEF4: LDA.b $00

.check_next_tile
#_0EDEF6: DEX
#_0EDEF7: DEX
#_0EDEF8: BMI EXIT_0EDEE0

#_0EDEFA: CMP.l .tile_type,X
#_0EDEFE: BNE .check_next_tile

#_0EDF00: LDA.b $8A
#_0EDF02: CMP.l .screen_id,X
#_0EDF06: BNE .check_next_screen

#_0EDF08: SEP #$30

#_0EDF0A: LDA.l .direction,X
#_0EDF0E: STA.b $67

#_0EDF10: LDX.b #$04

.keep_shifting
#_0EDF12: DEX

#_0EDF13: LSR A
#_0EDF14: BCC .keep_shifting

#_0EDF16: TXA
#_0EDF17: STA.w $0418

#_0EDF1A: LDA.b $67

#_0EDF1C: LDX.b #$04

.just_keep_shifting
#_0EDF1E: DEX

#_0EDF1F: LSR A
#_0EDF20: BCC .just_keep_shifting

#_0EDF22: TXA
#_0EDF23: STA.w $069C

#_0EDF26: LDA.b #$24
#_0EDF28: STA.b $11

#_0EDF2A: STZ.b $B0
#_0EDF2C: STZ.b $A0

#_0EDF2E: RTL

;===================================================================================================
; FREE ROM: 0x11
;===================================================================================================
NULL_0EDF2F:
#_0EDF2F: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EDF37: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EDF3F: db $FF

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
; see «text.asm»
;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================

org $0EEE21

;===================================================================================================
; FREE ROM: 0x05DF
;===================================================================================================
NULL_0EEE21:
#_0EEE21: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE29: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE31: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE39: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE41: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE49: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE51: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE59: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE61: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE69: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE71: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE79: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE81: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE89: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE91: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEE99: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEA1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEA9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEB1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEB9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEC1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEC9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEED1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEED9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEE1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEE9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEF1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEEF9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF01: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF09: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF11: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF19: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF21: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF29: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF31: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF39: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF41: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF49: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF51: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF59: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF61: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF69: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF71: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF79: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF81: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF89: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF91: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEF99: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFA1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFA9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFB1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFB9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFC1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFC9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFD1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFD9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFE1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFE9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFF1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EEFF9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF001: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF009: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF011: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF019: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF021: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF029: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF031: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF039: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF041: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF049: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF051: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF059: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF061: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF069: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF071: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF079: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF081: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF089: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF091: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF099: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0A1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0A9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0B1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0B9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0C1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0C9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0D1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0D9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0E1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0E9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0F1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF0F9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF101: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF109: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF111: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF119: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF121: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF129: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF131: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF139: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF141: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF149: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF151: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF159: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF161: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF169: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF171: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF179: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF181: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF189: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF191: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF199: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1A1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1A9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1B1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1B9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1C1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1C9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1D1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1D9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1E1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1E9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1F1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF1F9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF201: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF209: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF211: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF219: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF221: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF229: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF231: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF239: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF241: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF249: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF251: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF259: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF261: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF269: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF271: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF279: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF281: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF289: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF291: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF299: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2A1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2A9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2B1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2B9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2C1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2C9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2D1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2D9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2E1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2E9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2F1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF2F9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF301: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF309: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF311: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF319: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF321: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF329: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF331: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF339: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF341: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF349: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF351: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF359: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF361: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF369: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF371: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF379: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF381: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF389: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF391: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF399: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3A1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3A9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3B1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3B9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3C1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3C9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3D1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3D9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3E1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3E9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3F1: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EF3F9: db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

PaletteBlackAndWhiteSomething_Conditional:
#_0EF400: LDA.b $B0
#_0EF402: BNE PaletteBlackSomething

;===================================================================================================

PaletteBlackAndWhiteSomething:
#_0EF404: REP #$20

#_0EF406: LDX.b #$00

.next
#_0EF408: LDA.l $7EC300,X
#_0EF40C: STA.l $7FDD80,X

#_0EF410: LDA.l $7EC380,X
#_0EF414: STA.l $7FDE00,X

#_0EF418: LDA.l $7EC400,X
#_0EF41C: STA.l $7FDE80,X

#_0EF420: LDA.l $7EC480,X
#_0EF424: STA.l $7FDF00,X

#_0EF428: LDA.w #$7FFF ; RGB: #F8F8F8
#_0EF42B: STA.l $7EC300,X
#_0EF42F: STA.l $7EC380,X
#_0EF433: STA.l $7EC400,X
#_0EF437: STA.l $7EC480,X

#_0EF43B: INX
#_0EF43C: INX
#_0EF43D: CPX.b #$80
#_0EF43F: BNE .next

;---------------------------------------------------------------------------------------------------

#_0EF441: LDA.l $7EC500
#_0EF445: STA.l $7EC540

#_0EF449: LDA.w #$0000
#_0EF44C: STA.l $7EC007

#_0EF450: LDA.w #$0002
#_0EF453: STA.l $7EC009

#_0EF457: SEP #$20

#_0EF459: INC.b $B0

#_0EF45B: RTL

;===================================================================================================

PaletteBlackSomething:
#_0EF45C: JSL PaletteFilter_BlindingWhite

#_0EF460: REP #$30

#_0EF462: LDA.l $7EC009
#_0EF466: CMP.w #$00FF
#_0EF469: BNE RestorePalette

;---------------------------------------------------------------------------------------------------

#_0EF46B: LDX.w #$000E
#_0EF46E: LDA.w #$0000 ; RGB: #000000

.next_color
#_0EF471: STA.l $7EC3B0,X
#_0EF475: STA.l $7EC5B0,X

#_0EF479: DEX
#_0EF47A: DEX
#_0EF47B: BPL .next_color

;---------------------------------------------------------------------------------------------------

#_0EF47D: STA.l $7EC007
#_0EF481: STA.l $7EC009

#_0EF485: SEP #$20

#_0EF487: STZ.b $11

#_0EF489: SEP #$30

#_0EF48B: RTL

;===================================================================================================

RestorePalette:
#_0EF48C: CMP.w #$0000
#_0EF48F: BNE .exit

#_0EF491: LDA.l $7EC007
#_0EF495: CMP.w #$001F
#_0EF498: BNE .exit

;---------------------------------------------------------------------------------------------------

#_0EF49A: LDX.w #$0000

.next
#_0EF49D: LDA.l $7FDD80,X
#_0EF4A1: STA.l $7EC300,X

#_0EF4A5: LDA.l $7FDDC0,X
#_0EF4A9: STA.l $7EC340,X

#_0EF4AD: LDA.l $7FDE00,X
#_0EF4B1: STA.l $7EC380,X

#_0EF4B5: LDA.l $7FDE40,X
#_0EF4B9: STA.l $7EC3C0,X

#_0EF4BD: LDA.l $7FDE80,X
#_0EF4C1: STA.l $7EC400,X

#_0EF4C5: LDA.l $7FDEC0,X
#_0EF4C9: STA.l $7EC440,X

#_0EF4CD: LDA.l $7FDF00,X
#_0EF4D1: STA.l $7EC480,X

#_0EF4D5: LDA.l $7FDF40,X
#_0EF4D9: STA.l $7EC4C0,X

#_0EF4DD: INX
#_0EF4DE: INX
#_0EF4DF: CPX.w #$0040
#_0EF4E2: BNE .next

;---------------------------------------------------------------------------------------------------

#_0EF4E4: SEP #$20

#_0EF4E6: STZ.b $1D

.exit
#_0EF4E8: SEP #$30

#_0EF4EA: RTL

;===================================================================================================

Palettes_BlueThunder1:
#_0EF4EB: dw  $0884,  $0CC7,  $150A,  $154D,  $7FF6,  $5944,  $7AD1

Palettes_BlueThunder2:
#_0EF4F9: dw  $0884,  $0CC7,  $150A,  $154D,  $5BFF,  $7AD1,  $21AF

Palettes_BlueThunder3:
#_0EF507: dw  $1084,  $48C0,  $6186,  $7E6D,  $7FE0,  $5944,  $7E20

Palettes_BlueThunder4:
#_0EF515: dw  $1084,  $000E,  $1059,  $291F,  $7FE0,  $5944,  $7E20

Palettes_BlueThunder5:
#_0EF523: dw  $1084,  $1508,  $196C,  $21AF,  $7FF6,  $1D4C,  $7AD1

;---------------------------------------------------------------------------------------------------

Palettes_GanonTowerFlash:
#_0EF531: dw  $7FFF,  $0884,  $1CC8,  $1DCE,  $3694,  $4718,  $1D4A,  $18AC
#_0EF541: dw  $7FFF,  $1908,  $2D2F,  $3614,  $4EDA,  $471F,  $1D4A,  $390F
#_0EF551: dw  $7FFF,  $34CD,  $5971,  $5635,  $7F1B,  $7FFF,  $1D4A,  $3D54
#_0EF561: dw  $7FFF,  $1908,  $2D2F,  $3614,  $4EDA,  $471F,  $1D4A,  $390F
#_0EF571: dw  $7FFF,  $0884,  $052A,  $21EF,  $3AB5,  $4B39,  $1D4C,  $18AC

;===================================================================================================

#EXIT_0EF581:
#_0EF581: RTL

;===================================================================================================

FlashGanonTowerPalette:
#_0EF582: LDA.w $04C6
#_0EF585: BNE EXIT_0EF581

#_0EF587: LDA.b $8A
#_0EF589: CMP.b #$43 ; OW 43
#_0EF58B: BEQ .on_dark_dm

#_0EF58D: CMP.b #$45 ; OW 45
#_0EF58F: BEQ .on_dark_dm

#_0EF591: CMP.b #$47 ; OW 47
#_0EF593: BNE EXIT_0EF581

;---------------------------------------------------------------------------------------------------

.on_dark_dm
#_0EF595: PHB
#_0EF596: PHK
#_0EF597: PLB

#_0EF598: LDA.b $1A
#_0EF59A: CMP.b #$03
#_0EF59C: BEQ .normal_color

#_0EF59E: CMP.b #$05
#_0EF5A0: BEQ .pink

#_0EF5A2: CMP.b #$24
#_0EF5A4: BEQ .thunder

#_0EF5A6: CMP.b #$2C
#_0EF5A8: BEQ .pink

#_0EF5AA: CMP.b #$58
#_0EF5AC: BEQ .normal_color

#_0EF5AE: CMP.b #$5A
#_0EF5B0: BNE .bright_white

.pink
#_0EF5B2: REP #$20

;---------------------------------------------------------------------------------------------------

#_0EF5B4: LDX.b #$02

.restore_next
#_0EF5B6: LDA.l $7EC360,X
#_0EF5BA: STA.l $7EC560,X

#_0EF5BE: LDA.l $7EC370,X
#_0EF5C2: STA.l $7EC570,X

#_0EF5C6: LDA.l $7EC390,X
#_0EF5CA: STA.l $7EC590,X

#_0EF5CE: LDA.l $7EC3E0,X
#_0EF5D2: STA.l $7EC5E0,X

#_0EF5D6: LDA.l $7EC3F0,X
#_0EF5DA: STA.l $7EC5F0,X

#_0EF5DE: INX
#_0EF5DF: INX
#_0EF5E0: CPX.b #$10
#_0EF5E2: BNE .restore_next

#_0EF5E4: BRA .bright_white

;---------------------------------------------------------------------------------------------------

.thunder
#_0EF5E6: LDX.b #$36 ; SFX2.36
#_0EF5E8: STX.w $012E

;---------------------------------------------------------------------------------------------------

.normal_color
#_0EF5EB: REP #$20

#_0EF5ED: LDX.b #$02
#_0EF5EF: LDY.b #$00

.next_thunder
#_0EF5F1: LDA.w Palettes_BlueThunder1,Y
#_0EF5F4: STA.l $7EC560,X

#_0EF5F8: LDA.w Palettes_BlueThunder2,Y
#_0EF5FB: STA.l $7EC570,X

#_0EF5FF: LDA.w Palettes_BlueThunder3,Y
#_0EF602: STA.l $7EC590,X

#_0EF606: LDA.w Palettes_BlueThunder4,Y
#_0EF609: STA.l $7EC5E0,X

#_0EF60D: LDA.w Palettes_BlueThunder5,Y
#_0EF610: STA.l $7EC5F0,X

#_0EF614: INY
#_0EF615: INY

#_0EF616: INX
#_0EF617: INX
#_0EF618: CPX.b #$10
#_0EF61A: BNE .next_thunder

;---------------------------------------------------------------------------------------------------

.bright_white
#_0EF61C: SEP #$20

#_0EF61E: LDX.b #$00
#_0EF620: LDY.b #$40

#_0EF622: LDA.b $8A
#_0EF624: CMP.b #$43 ; OW 43
#_0EF626: BEQ .main_mountain

#_0EF628: CMP.b #$45 ; OW 45
#_0EF62A: BNE .next_gt

;---------------------------------------------------------------------------------------------------

.main_mountain
#_0EF62C: LDA.l $7EF2C3
#_0EF630: AND.b #$20
#_0EF632: BNE .gt_opened

#_0EF634: LDA.b $1A
#_0EF636: AND.b #$0C
#_0EF638: ASL A
#_0EF639: ASL A
#_0EF63A: TAY

;---------------------------------------------------------------------------------------------------

.next_gt
#_0EF63B: REP #$20

#_0EF63D: LDA.w Palettes_GanonTowerFlash,Y
#_0EF640: STA.l $7EC5D0,X

#_0EF644: INY
#_0EF645: INY

#_0EF646: INX
#_0EF647: INX
#_0EF648: CPX.b #$10
#_0EF64A: BNE .next_gt

;---------------------------------------------------------------------------------------------------

.gt_opened
#_0EF64C: SEP #$20

#_0EF64E: PLB

#_0EF64F: INC.b $15

#_0EF651: RTL

;===================================================================================================

ApplyOverworldOverlay:
#_0EF652: PHB

#_0EF653: LDA.b #$7E
#_0EF655: PHA
#_0EF656: PLB

#_0EF657: REP #$30

#_0EF659: LDA.b $8A
#_0EF65B: ASL A
#_0EF65C: TAX

#_0EF65D: JSR (.vectors,X)

#_0EF660: SEP #$30

#_0EF662: PLB

#_0EF663: RTL

;---------------------------------------------------------------------------------------------------

.vectors
#_0EF664: dw OverworldOverlay_LumberjackTree        ; 0x00
#_0EF666: dw OverworldOverlay_LumberjackTree        ; 0x01
#_0EF668: dw OverworldOverlay_LumberjackTree        ; 0x02
#_0EF66A: dw OverworldOverlay_TurtleRockPortal      ; 0x03
#_0EF66C: dw OverworldOverlay_TurtleRockPortal      ; 0x04
#_0EF66E: dw OverworldOverlay_TurtleRockPortal      ; 0x05
#_0EF670: dw OverworldOverlay_TurtleRockPortal      ; 0x06
#_0EF672: dw OverworldOverlay_TurtleRockPortal      ; 0x07
#_0EF674: dw OverworldOverlay_BonkRocks             ; 0x08
#_0EF676: dw OverworldOverlay_BonkRocks             ; 0x09
#_0EF678: dw OverworldOverlay_BonkRocks             ; 0x0A
#_0EF67A: dw OverworldOverlay_BonkRocks             ; 0x0B
#_0EF67C: dw OverworldOverlay_BonkRocks             ; 0x0C
#_0EF67E: dw OverworldOverlay_BonkRocks             ; 0x0D
#_0EF680: dw OverworldOverlay_BonkRocks             ; 0x0E
#_0EF682: dw OverworldOverlay_BonkRocks             ; 0x0F
#_0EF684: dw OverworldOverlay_BonkRocks             ; 0x10
#_0EF686: dw OverworldOverlay_BonkRocks             ; 0x11
#_0EF688: dw OverworldOverlay_BonkRocks             ; 0x12
#_0EF68A: dw OverworldOverlay_BonkRocks             ; 0x13
#_0EF68C: dw OverworldOverlay_KingsTomb             ; 0x14
#_0EF68E: dw OverworldOverlay_WeatherVane           ; 0x15
#_0EF690: dw OverworldOverlay_WeatherVane           ; 0x16
#_0EF692: dw OverworldOverlay_WeatherVane           ; 0x17
#_0EF694: dw OverworldOverlay_WeatherVane           ; 0x18
#_0EF696: dw OverworldOverlay_WeatherVane           ; 0x19
#_0EF698: dw OverworldOverlay_CastleGate            ; 0x1A
#_0EF69A: dw OverworldOverlay_CastleGate            ; 0x1B
#_0EF69C: dw OverworldOverlay_CastleGate            ; 0x1C
#_0EF69E: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1D
#_0EF6A0: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1E
#_0EF6A2: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1F
#_0EF6A4: dw OverworldOverlay_WeatherVane           ; 0x20
#_0EF6A6: dw OverworldOverlay_WeatherVane           ; 0x21
#_0EF6A8: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x22
#_0EF6AA: dw OverworldOverlay_CastleGate            ; 0x23
#_0EF6AC: dw OverworldOverlay_CastleGate            ; 0x24
#_0EF6AE: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x25
#_0EF6B0: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x26
#_0EF6B2: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x27
#_0EF6B4: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x28
#_0EF6B6: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x29
#_0EF6B8: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x2A
#_0EF6BA: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x2B
#_0EF6BC: dw OverworldOverlay_CheckerBoardCave      ; 0x2C
#_0EF6BE: dw OverworldOverlay_CheckerBoardCave      ; 0x2D
#_0EF6C0: dw OverworldOverlay_CheckerBoardCave      ; 0x2E
#_0EF6C2: dw OverworldOverlay_CheckerBoardCave      ; 0x2F
#_0EF6C4: dw OverworldOverlay_CheckerBoardCave      ; 0x30
#_0EF6C6: dw OverworldOverlay_CheckerBoardCave      ; 0x31
#_0EF6C8: dw OverworldOverlay_IceRodThief           ; 0x32
#_0EF6CA: dw OverworldOverlay_IceRodThief           ; 0x33
#_0EF6CC: dw OverworldOverlay_IceRodThief           ; 0x34
#_0EF6CE: dw OverworldOverlay_IceRodThief           ; 0x35
#_0EF6D0: dw OverworldOverlay_IceRodThief           ; 0x36
#_0EF6D2: dw OverworldOverlay_IceRodThief           ; 0x37
#_0EF6D4: dw OverworldOverlay_CheckerBoardCave      ; 0x38
#_0EF6D6: dw OverworldOverlay_CheckerBoardCave      ; 0x39
#_0EF6D8: dw OverworldOverlay_DesertThief           ; 0x3A
#_0EF6DA: dw OverworldOverlay_DrainedDam            ; 0x3B
#_0EF6DC: dw OverworldOverlay_SkullWoods            ; 0x3C
#_0EF6DE: dw OverworldOverlay_SkullWoods            ; 0x3D
#_0EF6E0: dw OverworldOverlay_SkullWoods            ; 0x3E
#_0EF6E2: dw OverworldOverlay_SkullWoods            ; 0x3F
#_0EF6E4: dw OverworldOverlay_SkullWoods            ; 0x40
#_0EF6E6: dw OverworldOverlay_SkullWoods            ; 0x41
#_0EF6E8: dw OverworldOverlay_GanonsTower           ; 0x42
#_0EF6EA: dw OverworldOverlay_GanonsTower           ; 0x43
#_0EF6EC: dw OverworldOverlay_GanonsTower           ; 0x44
#_0EF6EE: dw OverworldOverlay_HookshotCave          ; 0x45
#_0EF6F0: dw OverworldOverlay_HookshotCave          ; 0x46
#_0EF6F2: dw OverworldOverlay_TurtleRock            ; 0x47
#_0EF6F4: dw OverworldOverlay_SkullWoods            ; 0x48
#_0EF6F6: dw OverworldOverlay_SkullWoods            ; 0x49
#_0EF6F8: dw OverworldOverlay_GargoylesDomain       ; 0x4A
#_0EF6FA: dw OverworldOverlay_GanonsTower           ; 0x4B
#_0EF6FC: dw OverworldOverlay_GanonsTower           ; 0x4C
#_0EF6FE: dw OverworldOverlay_HookshotCave          ; 0x4D
#_0EF700: dw OverworldOverlay_HookshotCave          ; 0x4E
#_0EF702: dw OverworldOverlay_GargoylesDomain       ; 0x4F
#_0EF704: dw OverworldOverlay_GargoylesDomain       ; 0x50
#_0EF706: dw OverworldOverlay_GargoylesDomain       ; 0x51
#_0EF708: dw OverworldOverlay_GargoylesDomain       ; 0x52
#_0EF70A: dw OverworldOverlay_GargoylesDomain       ; 0x53
#_0EF70C: dw OverworldOverlay_GargoylesDomain       ; 0x54
#_0EF70E: dw OverworldOverlay_GargoylesDomain       ; 0x55
#_0EF710: dw OverworldOverlay_GargoylesDomain       ; 0x56
#_0EF712: dw OverworldOverlay_GargoylesDomain       ; 0x57
#_0EF714: dw OverworldOverlay_GargoylesDomain       ; 0x58
#_0EF716: dw OverworldOverlay_GargoylesDomain       ; 0x59
#_0EF718: dw OverworldOverlay_PyramidHole           ; 0x5A
#_0EF71A: dw OverworldOverlay_PyramidHole           ; 0x5B
#_0EF71C: dw OverworldOverlay_PyramidHole           ; 0x5C
#_0EF71E: dw OverworldOverlay_POD                   ; 0x5D
#_0EF720: dw OverworldOverlay_POD                   ; 0x5E
#_0EF722: dw OverworldOverlay_POD                   ; 0x5F
#_0EF724: dw OverworldOverlay_GargoylesDomain       ; 0x60
#_0EF726: dw OverworldOverlay_GargoylesDomain       ; 0x61
#_0EF728: dw OverworldOverlay_PegPuzzle             ; 0x62
#_0EF72A: dw OverworldOverlay_PyramidHole           ; 0x63
#_0EF72C: dw OverworldOverlay_PyramidHole           ; 0x64
#_0EF72E: dw OverworldOverlay_MiseryMire            ; 0x65
#_0EF730: dw OverworldOverlay_POD                   ; 0x66
#_0EF732: dw OverworldOverlay_POD                   ; 0x67
#_0EF734: dw OverworldOverlay_MiseryMire            ; 0x68
#_0EF736: dw OverworldOverlay_MiseryMire            ; 0x69
#_0EF738: dw OverworldOverlay_MiseryMire            ; 0x6A
#_0EF73A: dw OverworldOverlay_LinksHouseBonkRocks   ; 0x6B
#_0EF73C: dw OverworldOverlay_MiseryMire            ; 0x6C
#_0EF73E: dw OverworldOverlay_MiseryMire            ; 0x6D
#_0EF740: dw OverworldOverlay_MiseryMire            ; 0x6E
#_0EF742: dw OverworldOverlay_MiseryMire            ; 0x6F
#_0EF744: dw OverworldOverlay_MiseryMire            ; 0x70
#_0EF746: dw OverworldOverlay_MiseryMire            ; 0x71
#_0EF748: dw NULL_0EFB64                            ; 0x72
#_0EF74A: dw NULL_0EFB64                            ; 0x73
#_0EF74C: dw NULL_0EFB64                            ; 0x74
#_0EF74E: dw NULL_0EFB64                            ; 0x75
#_0EF750: dw NULL_0EFB64                            ; 0x76
#_0EF752: dw OverworldOverlay_IceRodThief           ; 0x77
#_0EF754: dw OverworldOverlay_MiseryMire            ; 0x78
#_0EF756: dw OverworldOverlay_MiseryMire            ; 0x79
#_0EF758: dw NULL_0EFB64                            ; 0x7A
#_0EF75A: dw OverworldOverlay_DrainedDam            ; 0x7B
#_0EF75C: dw NULL_0EFB64                            ; 0x7C
#_0EF75E: dw NULL_0EFB64                            ; 0x7D
#_0EF760: dw NULL_0EFB64                            ; 0x7E
#_0EF762: dw NULL_0EFB64                            ; 0x7F

;===================================================================================================

OverworldOverlay_LumberjackTree:
#_0EF764: LDA.w #$0E32
#_0EF767: STA.w $7E2816
#_0EF76A: STA.w $7E2818
#_0EF76D: STA.w $7E281A
#_0EF770: STA.w $7E281C
#_0EF773: STA.w $7E2896
#_0EF776: STA.w $7E289C

#_0EF779: INC A
#_0EF77A: STA.w $7E2898

#_0EF77D: INC A
#_0EF77E: STA.w $7E289A

#_0EF781: INC A
#_0EF782: STA.w $7E2916

#_0EF785: INC A
#_0EF786: STA.w $7E2918

#_0EF789: INC A
#_0EF78A: STA.w $7E291A

#_0EF78D: INC A
#_0EF78E: STA.w $7E291C

#_0EF791: INC A
#_0EF792: STA.w $7E2996

#_0EF795: INC A
#_0EF796: STA.w $7E2998

#_0EF799: INC A
#_0EF79A: STA.w $7E299A

#_0EF79D: INC A
#_0EF79E: STA.w $7E299C

#_0EF7A1: INC A
#_0EF7A2: STA.w $7E2A18

#_0EF7A5: INC A
#_0EF7A6: STA.w $7E2A1A

#_0EF7A9: RTS

;===================================================================================================

OverworldOverlay_TurtleRockPortal:
#_0EF7AA: LDA.w #$0212
#_0EF7AD: STA.w $7E2720

#_0EF7B0: RTS

;===================================================================================================

OverworldOverlay_BonkRocks:
#_0EF7B1: LDX.w #$0506

;===================================================================================================

OverworldOverlay_DrawRevealedStairs:
#_0EF7B4: LDA.w #$0918
#_0EF7B7: STA.w $7E2000,X

#_0EF7BA: INC A
#_0EF7BB: STA.w $7E2002,X

#_0EF7BE: INC A
#_0EF7BF: STA.w $7E2080,X

#_0EF7C2: INC A
#_0EF7C3: STA.w $7E2082,X

#_0EF7C6: RTS

;===================================================================================================

OverworldOverlay_KingsTomb:
#_0EF7C7: LDA.w #$0DD1
#_0EF7CA: STA.w $7E2532

#_0EF7CD: INC A
#_0EF7CE: STA.w $7E2534

#_0EF7D1: LDA.w #$0DD7
#_0EF7D4: STA.w $7E25B2

#_0EF7D7: INC A
#_0EF7D8: STA.w $7E25B4

#_0EF7DB: INC A
#_0EF7DC: STA.w $7E2632

#_0EF7DF: INC A
#_0EF7E0: STA.w $7E2634

#_0EF7E3: RTS

;===================================================================================================

OverworldOverlay_WeatherVane:
#_0EF7E4: LDA.w #$0E21
#_0EF7E7: STA.w $7E2C3E

#_0EF7EA: STA.w $7E2C42

#_0EF7ED: INC A
#_0EF7EE: STA.w $7E2C40

#_0EF7F1: INC A
#_0EF7F2: STA.w $7E2CBE

#_0EF7F5: INC A
#_0EF7F6: STA.w $7E2CC0

#_0EF7F9: INC A
#_0EF7FA: STA.w $7E2CC2

#_0EF7FD: RTS

;===================================================================================================

OverworldOverlay_CastleGate:
#_0EF7FE: LDA.w #$0DC1
#_0EF801: STA.w $7E33BC

#_0EF804: INC A
#_0EF805: STA.w $7E33BE

#_0EF808: LDA.w #$0DBE
#_0EF80B: STA.w $7E343C

#_0EF80E: INC A
#_0EF80F: STA.w $7E343E

#_0EF812: LDA.w #$0DC2
#_0EF815: STA.w $7E33C0

#_0EF818: INC A
#_0EF819: STA.w $7E33C2

#_0EF81C: LDA.w #$0DBF
#_0EF81F: STA.w $7E3440

#_0EF822: INC A
#_0EF823: STA.w $7E3442

#_0EF826: RTS

;===================================================================================================

OverworldOverlay_LinksHouseBonkRocks:
#_0EF827: LDX.w #$0330
#_0EF82A: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_CheckerBoardCave:
#_0EF82D: LDX.w #$0358
#_0EF830: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_IceRodThief:
#_0EF833: LDX.w #$040C
#_0EF836: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_DesertThief:
#_0EF839: LDX.w #$0A1E
#_0EF83C: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_DrainedDam:
#_0EF83F: LDA.w #$0DDF
#_0EF842: STA.w $7E23AC
#_0EF845: STA.w $7E2424
#_0EF848: STA.w $7E24A0
#_0EF84B: STA.w $7E251E
#_0EF84E: STA.w $7E261C
#_0EF851: STA.w $7E2734

#_0EF854: INC A
#_0EF855: STA.w $7E23AE
#_0EF858: STA.w $7E24A2

#_0EF85B: INC A
#_0EF85C: STA.w $7E23B0
#_0EF85F: STA.w $7E2438
#_0EF862: STA.w $7E24BA
#_0EF865: STA.w $7E25AA
#_0EF868: STA.w $7E273A

#_0EF86B: INC A
#_0EF86C: STA.w $7E2426
#_0EF86F: STA.w $7E2428
#_0EF872: STA.w $7E242A
#_0EF875: STA.w $7E2432
#_0EF878: STA.w $7E2434
#_0EF87B: STA.w $7E2436

#_0EF87E: INC A
#_0EF87F: STA.w $7E242C
#_0EF882: STA.w $7E24A4
#_0EF885: STA.w $7E2520
#_0EF888: STA.w $7E261E

#_0EF88B: INC A
#_0EF88C: STA.w $7E242E
#_0EF88F: STA.w $7E24A6
#_0EF892: STA.w $7E24A8
#_0EF895: STA.w $7E24B0
#_0EF898: STA.w $7E24B6
#_0EF89B: STA.w $7E2522
#_0EF89E: STA.w $7E2524
#_0EF8A1: STA.w $7E2526
#_0EF8A4: STA.w $7E2538
#_0EF8A7: STA.w $7E25A0
#_0EF8AA: STA.w $7E25A2
#_0EF8AD: STA.w $7E25A4
#_0EF8B0: STA.w $7E25A6
#_0EF8B3: STA.w $7E2620
#_0EF8B6: STA.w $7E2622
#_0EF8B9: STA.w $7E269E
#_0EF8BC: STA.w $7E26A0
#_0EF8BF: STA.w $7E271E
#_0EF8C2: STA.w $7E2720
#_0EF8C5: STA.w $7E2826
#_0EF8C8: STA.w $7E28A6
#_0EF8CB: STA.w $7E28A8
#_0EF8CE: STA.w $7E2926

#_0EF8D1: INC A
#_0EF8D2: STA.w $7E2430
#_0EF8D5: STA.w $7E24B8
#_0EF8D8: STA.w $7E25A8
#_0EF8DB: STA.w $7E262A

#_0EF8DE: INC A
#_0EF8DF: STA.w $7E24AA
#_0EF8E2: STA.w $7E24B2
#_0EF8E5: STA.w $7E2528
#_0EF8E8: STA.w $7E25B8
#_0EF8EB: STA.w $7E28AA
#_0EF8EE: STA.w $7E2928

#_0EF8F1: INC A
#_0EF8F2: STA.w $7E24AC
#_0EF8F5: STA.w $7E2530
#_0EF8F8: STA.w $7E279E
#_0EF8FB: STA.w $7E27A0
#_0EF8FE: STA.w $7E29A6
#_0EF901: STA.w $7E29B8

#_0EF904: INC A
#_0EF905: STA.w $7E24AE
#_0EF908: STA.w $7E24B4
#_0EF90B: STA.w $7E2536
#_0EF90E: STA.w $7E27A2
#_0EF911: STA.w $7E2824

#_0EF914: INC A
#_0EF915: STA.w $7E252E
#_0EF918: STA.w $7E2534
#_0EF91B: STA.w $7E279C
#_0EF91E: STA.w $7E2822
#_0EF921: STA.w $7E2934
#_0EF924: STA.w $7E29B6

#_0EF927: INC A
#_0EF928: STA.w $7E253A
#_0EF92B: STA.w $7E2638
#_0EF92E: STA.w $7E26B8
#_0EF931: STA.w $7E293A

#_0EF934: INC A
#_0EF935: STA.w $7E259E
#_0EF938: STA.w $7E25B6
#_0EF93B: STA.w $7E2636
#_0EF93E: STA.w $7E269C
#_0EF941: STA.w $7E26B6
#_0EF944: STA.w $7E271C
#_0EF947: STA.w $7E28A4
#_0EF94A: STA.w $7E2924

#_0EF94D: INC A
#_0EF94E: STA.w $7E2624
#_0EF951: STA.w $7E26A2

#_0EF954: INC A
#_0EF955: STA.w $7E2626

#_0EF958: INC A
#_0EF959: STA.w $7E2628

#_0EF95C: INC A
#_0EF95D: STA.w $7E26A4

#_0EF960: STA.w $7E27B6

#_0EF963: INC A
#_0EF964: STA.w $7E26A6
#_0EF967: STA.w $7E2726
#_0EF96A: STA.w $7E2728
#_0EF96D: STA.w $7E272A
#_0EF970: STA.w $7E27AA
#_0EF973: STA.w $7E2836
#_0EF976: STA.w $7E2838

#_0EF979: INC A
#_0EF97A: STA.w $7E26A8
#_0EF97D: STA.w $7E27B8

#_0EF980: INC A
#_0EF981: STA.w $7E26AA

#_0EF984: INC A
#_0EF985: STA.w $7E2722
#_0EF988: STA.w $7E27A4
#_0EF98B: STA.w $7E2828

#_0EF98E: INC A
#_0EF98F: STA.w $7E2724

#_0EF992: INC A
#_0EF993: STA.w $7E27A6

#_0EF996: INC A
#_0EF997: STA.w $7E27A8

#_0EF99A: STA.w $7E28B6

#_0EF99D: INC A
#_0EF99E: STA.w $7E27B4

#_0EF9A1: INC A
#_0EF9A2: STA.w $7E27BA

#_0EF9A5: INC A
#_0EF9A6: STA.w $7E282A

#_0EF9A9: INC A
#_0EF9AA: STA.w $7E2834

#_0EF9AD: INC A
#_0EF9AE: STA.w $7E283A

#_0EF9B1: INC A
#_0EF9B2: STA.w $7E28B4

#_0EF9B5: INC A
#_0EF9B6: STA.w $7E28B8

#_0EF9B9: INC A
#_0EF9BA: STA.w $7E28BA

#_0EF9BD: INC A
#_0EF9BE: STA.w $7E2936

#_0EF9C1: INC A
#_0EF9C2: STA.w $7E2938

#_0EF9C5: INC A
#_0EF9C6: STA.w $7E252A
#_0EF9C9: STA.w $7E2532
#_0EF9CC: STA.w $7E292A

#_0EF9CF: INC A
#_0EF9D0: STA.w $7E25BA
#_0EF9D3: STA.w $7E29A8
#_0EF9D6: STA.w $7E29BA

#_0EF9D9: INC A
#_0EF9DA: STA.w $7E29A4

#_0EF9DD: INC A
#_0EF9DE: STA.w $7E2736

#_0EF9E1: INC A
#_0EF9E2: STA.w $7E2738

#_0EF9E5: RTS

;===================================================================================================

OverworldOverlay_SkullWoods:
#_0EF9E6: LDA.w #$0E13
#_0EF9E9: STA.w $7E2590

#_0EF9EC: INC A
#_0EF9ED: STA.w $7E2596

#_0EF9F0: INC A
#_0EF9F1: STA.w $7E2610

#_0EF9F4: INC A
#_0EF9F5: STA.w $7E2612

#_0EF9F8: INC A
#_0EF9F9: STA.w $7E2614

#_0EF9FC: INC A
#_0EF9FD: STA.w $7E2616

#_0EFA00: INC A
#_0EFA01: STA.w $7E2692

#_0EFA04: INC A
#_0EFA05: STA.w $7E2694

#_0EFA08: LDA.w #$0E06
#_0EFA0B: STA.w $7E2812
#_0EFA0E: STA.w $7E2814

#_0EFA11: INC A
#_0EFA12: STA.w $7E2710
#_0EFA15: STA.w $7E2790

#_0EFA18: INC A
#_0EFA19: STA.w $7E2712
#_0EFA1C: STA.w $7E2792

#_0EFA1F: INC A
#_0EFA20: STA.w $7E2714
#_0EFA23: STA.w $7E2794

#_0EFA26: INC A
#_0EFA27: STA.w $7E2716
#_0EFA2A: STA.w $7E2796

#_0EFA2D: RTS

;===================================================================================================

OverworldOverlay_GanonsTower:
#_0EFA2E: LDA.w #$0E96
#_0EFA31: STA.l $7E245E

#_0EFA35: INC A
#_0EFA36: STA.l $7E2460

#_0EFA3A: LDA.w #$0E9C
#_0EFA3D: STA.l $7E24DE

#_0EFA41: STA.l $7E255E

#_0EFA45: INC A
#_0EFA46: STA.l $7E24E0

#_0EFA4A: STA.l $7E2560

#_0EFA4E: LDA.w #$0E9A
#_0EFA51: STA.l $7E25DE

#_0EFA55: INC A
#_0EFA56: STA.l $7E25E0

#_0EFA5A: RTS

;===================================================================================================

OverworldOverlay_HookshotCave:
#_0EFA5B: LDX.w #$0868
#_0EFA5E: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_TurtleRock:
#_0EFA61: LDA.w #$0E78
#_0EFA64: STA.l $7E299E

#_0EFA68: INC A
#_0EFA69: STA.l $7E29A0

#_0EFA6D: INC A
#_0EFA6E: STA.l $7E29A2

#_0EFA72: INC A
#_0EFA73: STA.l $7E29A4

#_0EFA77: INC A
#_0EFA78: STA.l $7E2A1E

#_0EFA7C: INC A
#_0EFA7D: STA.l $7E2A20

#_0EFA81: INC A
#_0EFA82: STA.l $7E2A22

#_0EFA86: INC A
#_0EFA87: STA.l $7E2A24

#_0EFA8B: INC A
#_0EFA8C: STA.l $7E2A9E

#_0EFA90: INC A
#_0EFA91: STA.l $7E2AA0

#_0EFA95: INC A
#_0EFA96: STA.l $7E2AA2

#_0EFA9A: INC A
#_0EFA9B: STA.l $7E2AA4

#_0EFA9F: INC A
#_0EFAA0: STA.l $7E2B1E

#_0EFAA4: INC A
#_0EFAA5: STA.l $7E2B20

#_0EFAA9: INC A
#_0EFAAA: STA.l $7E2B22

#_0EFAAE: INC A
#_0EFAAF: STA.l $7E2B24

#_0EFAB3: RTS

;===================================================================================================

OverworldOverlay_GargoylesDomain:
#_0EFAB4: LDA.w #$0E1B
#_0EFAB7: STA.w $7E2D3E

#_0EFABA: INC A
#_0EFABB: STA.w $7E2D40

#_0EFABE: INC A
#_0EFABF: STA.w $7E2DBE

#_0EFAC2: INC A
#_0EFAC3: STA.w $7E2DC0

#_0EFAC6: INC A
#_0EFAC7: STA.w $7E2E3E

#_0EFACA: INC A
#_0EFACB: STA.w $7E2E40

#_0EFACE: RTS

;===================================================================================================

OverworldOverlay_PyramidHole:
#_0EFACF: LDA.w #$0E3F
#_0EFAD2: STA.w $7E23BC

#_0EFAD5: INC A
#_0EFAD6: STA.w $7E23BE

#_0EFAD9: INC A
#_0EFADA: STA.w $7E23C0

#_0EFADD: INC A
#_0EFADE: STA.w $7E243C

#_0EFAE1: INC A
#_0EFAE2: STA.w $7E243E

#_0EFAE5: INC A
#_0EFAE6: STA.w $7E2440

#_0EFAE9: INC A
#_0EFAEA: STA.w $7E24BC

#_0EFAED: INC A
#_0EFAEE: STA.w $7E24BE

#_0EFAF1: INC A
#_0EFAF2: STA.w $7E24C0

#_0EFAF5: RTS

;===================================================================================================

OverworldOverlay_POD:
#_0EFAF6: LDA.w #$0E31
#_0EFAF9: STA.w $7E21E6

#_0EFAFC: LDA.w #$0E2D
#_0EFAFF: STA.w $7E226A

#_0EFB02: INC A
#_0EFB03: STA.w $7E22EA

#_0EFB06: INC A
#_0EFB07: STA.w $7E236A

#_0EFB0A: RTS

;===================================================================================================

OverworldOverlay_PegPuzzle:
#_0EFB0B: LDX.w #$0D20
#_0EFB0E: JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_MiseryMire:
#_0EFB11: LDA.w #$0E64
#_0EFB14: STA.w $7E2522

#_0EFB17: INC A
#_0EFB18: STA.w $7E2524

#_0EFB1B: INC A
#_0EFB1C: STA.w $7E2526

#_0EFB1F: INC A
#_0EFB20: STA.w $7E2528

#_0EFB23: INC A
#_0EFB24: STA.w $7E25A2

#_0EFB27: INC A
#_0EFB28: STA.w $7E25A4

#_0EFB2B: INC A
#_0EFB2C: STA.w $7E25A6

#_0EFB2F: INC A
#_0EFB30: STA.w $7E25A8

#_0EFB33: INC A
#_0EFB34: STA.w $7E2622

#_0EFB37: INC A
#_0EFB38: STA.w $7E2624

#_0EFB3B: INC A
#_0EFB3C: STA.w $7E2626

#_0EFB3F: INC A
#_0EFB40: STA.w $7E2628

#_0EFB43: INC A
#_0EFB44: STA.w $7E26A2

#_0EFB47: INC A
#_0EFB48: STA.w $7E26A4

#_0EFB4B: INC A
#_0EFB4C: STA.w $7E26A6

#_0EFB4F: INC A
#_0EFB50: STA.w $7E26A8

#_0EFB53: INC A
#_0EFB54: STA.w $7E2722

#_0EFB57: INC A
#_0EFB58: STA.w $7E2724

#_0EFB5B: INC A
#_0EFB5C: STA.w $7E2726

#_0EFB5F: INC A
#_0EFB60: STA.w $7E2728

#_0EFB63: RTS

;===================================================================================================
; FREE ROM: 0x049C
;===================================================================================================
NULL_0EFB64:
#_0EFB64: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB6C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB74: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB7C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB84: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB8C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB94: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFB9C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBA4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBAC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBB4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBBC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBC4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBCC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBD4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBDC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBE4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBEC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBF4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFBFC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC04: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC0C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC14: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC1C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC24: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC2C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC34: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC3C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC44: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC4C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC54: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC5C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC64: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC6C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC74: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC7C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC84: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC8C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC94: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFC9C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCA4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCAC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCB4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCBC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCC4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCCC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCD4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCDC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCE4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCEC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCF4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFCFC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD04: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD0C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD14: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD1C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD24: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD2C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD34: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD3C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD44: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD4C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD54: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD5C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD64: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD6C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD74: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD7C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD84: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD8C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD94: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFD9C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDA4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDAC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDB4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDBC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDC4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDCC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDD4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDDC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDE4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDEC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDF4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFDFC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE04: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE0C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE14: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE1C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE24: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE2C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE34: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE3C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE44: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE4C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE54: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE5C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE64: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE6C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE74: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE7C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE84: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE8C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE94: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFE9C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEA4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEAC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEB4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEBC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEC4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFECC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFED4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEDC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEE4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEEC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEF4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFEFC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF04: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF0C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF14: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF1C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF24: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF2C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF34: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF3C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF44: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF4C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF54: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF5C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF64: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF6C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF74: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF7C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF84: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF8C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF94: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFF9C: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFA4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFAC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFB4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFBC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFC4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFCC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFD4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFDC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFE4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFEC: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFF4: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0EFFFC: db $FF, $FF, $FF, $FF

;===================================================================================================
