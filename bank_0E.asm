org $0E8000

;===================================================================================================

TheFont:
|0E8000| incbin "bin/gfx/font.2bpp"

^.size

;===================================================================================================

CustomTileTypesOffset:
|0E9000| dw $0000, $0000, $0000, $0080, $0080, $0100, $0100, $0100
|0E9010| dw $0180, $0000, $0100, $0200, $0280, $0300, $0380, $0100
|0E9020| dw $0100, $0080, $0100, $0380, $0100

;===================================================================================================

CustomUnderworldTileTypes:
|0E902A| db $02, $02, $02, $02, $02, $02, $6E, $6F
|0E9032| db $01, $6C, $02, $01, $01, $01, $01, $01
|0E903A| db $02, $02, $02, $02, $02, $02, $00, $00
|0E9042| db $00, $00, $02, $01, $01, $01, $01, $01
|0E904A| db $01, $01, $01, $01, $01, $01, $6E, $6F
|0E9052| db $01, $6C, $02, $02, $02, $02, $01, $02
|0E905A| db $00, $00, $22, $00, $00, $00, $02, $02
|0E9062| db $02, $02, $02, $02, $00, $00, $01, $00
|0E906A| db $01, $01, $01, $01, $01, $01, $01, $02
|0E9072| db $02, $02, $02, $02, $02, $02, $02, $02
|0E907A| db $01, $01, $01, $01, $01, $01, $01, $02
|0E9082| db $02, $02, $02, $02, $02, $02, $02, $02
|0E908A| db $02, $02, $02, $02, $18, $00, $00, $00
|0E9092| db $00, $00, $02, $02, $01, $01, $01, $01
|0E909A| db $02, $02, $02, $01, $02, $02, $08, $08
|0E90A2| db $08, $08, $09, $09, $09, $09, $09, $09

; set 01
|0E90AA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E90B2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E90BA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E90C2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E90CA| db $01, $01, $01, $01, $01, $01, $01, $01
|0E90D2| db $01, $01, $02, $02, $02, $02, $02, $02
|0E90DA| db $00, $00, $22, $00, $00, $00, $02, $02
|0E90E2| db $02, $02, $02, $02, $02, $02, $02, $02
|0E90EA| db $01, $01, $01, $01, $02, $02, $02, $02
|0E90F2| db $02, $02, $02, $02, $02, $02, $02, $02
|0E90FA| db $01, $01, $01, $01, $02, $02, $02, $02
|0E9102| db $02, $02, $02, $02, $02, $02, $02, $02
|0E910A| db $02, $02, $02, $02, $18, $00, $00, $00
|0E9112| db $00, $00, $02, $02, $02, $02, $02, $02
|0E911A| db $02, $02, $02, $01, $02, $02, $08, $08
|0E9122| db $08, $08, $09, $09, $09, $09, $09, $09

; set 02
|0E912A| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9132| db $02, $02, $02, $01, $01, $01, $01, $01
|0E913A| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9142| db $02, $02, $02, $01, $01, $01, $01, $01
|0E914A| db $01, $01, $01, $01, $01, $01, $01, $01
|0E9152| db $01, $01, $02, $02, $02, $02, $02, $02
|0E915A| db $00, $00, $22, $00, $00, $00, $00, $00
|0E9162| db $00, $00, $02, $02, $00, $00, $02, $00
|0E916A| db $01, $01, $01, $01, $02, $02, $02, $02
|0E9172| db $02, $02, $02, $02, $02, $02, $02, $02
|0E917A| db $01, $01, $01, $01, $02, $02, $02, $02
|0E9182| db $02, $02, $02, $02, $02, $02, $02, $02
|0E918A| db $02, $02, $02, $02, $00, $00, $00, $00
|0E9192| db $00, $00, $02, $02, $02, $02, $02, $02
|0E919A| db $6B, $6A, $02, $01, $02, $02, $08, $08
|0E91A2| db $08, $08, $09, $09, $09, $09, $68, $69

; set 03
|0E91AA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E91B2| db $09, $09, $02, $01, $01, $01, $01, $01
|0E91BA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E91C2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E91CA| db $01, $01, $01, $01, $01, $01, $01, $01
|0E91D2| db $01, $01, $02, $02, $02, $02, $02, $02
|0E91DA| db $00, $00, $22, $00, $00, $00, $02, $02
|0E91E2| db $02, $02, $02, $02, $00, $00, $00, $00
|0E91EA| db $01, $01, $01, $00, $02, $02, $02, $02
|0E91F2| db $02, $02, $02, $02, $02, $02, $02, $02
|0E91FA| db $01, $01, $01, $08, $02, $02, $02, $02
|0E9202| db $02, $02, $02, $02, $02, $02, $02, $02
|0E920A| db $02, $02, $02, $02, $18, $00, $00, $00
|0E9212| db $00, $00, $02, $02, $02, $02, $02, $02
|0E921A| db $08, $08, $02, $01, $01, $09, $08, $08
|0E9222| db $08, $08, $09, $09, $09, $09, $09, $09

; set 04
|0E922A| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9232| db $02, $02, $02, $01, $01, $01, $01, $01
|0E923A| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9242| db $02, $02, $02, $01, $01, $01, $01, $01
|0E924A| db $01, $01, $01, $01, $01, $01, $01, $01
|0E9252| db $01, $01, $02, $02, $02, $02, $02, $02
|0E925A| db $00, $00, $22, $00, $00, $00, $02, $02
|0E9262| db $02, $02, $02, $02, $00, $00, $00, $00
|0E926A| db $01, $01, $01, $01, $02, $02, $02, $02
|0E9272| db $02, $02, $02, $02, $02, $02, $02, $02
|0E927A| db $01, $01, $01, $01, $02, $02, $02, $02
|0E9282| db $02, $02, $02, $02, $02, $02, $02, $02
|0E928A| db $02, $02, $02, $02, $02, $00, $0F, $00
|0E9292| db $00, $00, $02, $02, $02, $02, $02, $02
|0E929A| db $02, $02, $02, $01, $02, $02, $08, $08
|0E92A2| db $08, $08, $0E, $0E, $0E, $0E, $00, $00

; set 05
|0E92AA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E92B2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E92BA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E92C2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E92CA| db $01, $01, $01, $01, $01, $01, $02, $02
|0E92D2| db $01, $02, $02, $02, $02, $02, $02, $02
|0E92DA| db $00, $00, $22, $00, $00, $00, $00, $00
|0E92E2| db $00, $00, $02, $02, $00, $00, $00, $00
|0E92EA| db $01, $01, $01, $01, $02, $02, $02, $0D
|0E92F2| db $0D, $02, $02, $02, $02, $02, $02, $02
|0E92FA| db $01, $01, $01, $01, $02, $02, $02, $0D
|0E9302| db $0D, $02, $02, $02, $02, $02, $02, $02
|0E930A| db $02, $02, $02, $02, $02, $00, $00, $00
|0E9312| db $00, $00, $02, $02, $02, $02, $02, $02
|0E931A| db $6B, $6A, $02, $01, $02, $02, $08, $08
|0E9322| db $08, $08, $09, $09, $09, $09, $68, $69

; set 06
|0E932A| db $B2, $B4, $B1, $BB, $02, $02, $02, $02
|0E9332| db $02, $02, $02, $01, $01, $01, $01, $01
|0E933A| db $B3, $B5, $B0, $B6, $02, $02, $02, $02
|0E9342| db $02, $02, $02, $01, $01, $01, $01, $01
|0E934A| db $02, $01, $01, $01, $01, $01, $01, $01
|0E9352| db $01, $01, $02, $02, $02, $02, $02, $02
|0E935A| db $00, $00, $22, $00, $00, $00, $02, $02
|0E9362| db $02, $02, $02, $02, $00, $00, $00, $00
|0E936A| db $B1, $B2, $B3, $B4, $B5, $B1, $B0, $02
|0E9372| db $BE, $02, $02, $02, $02, $02, $B7, $B8
|0E937A| db $B0, $B2, $B3, $B4, $B5, $02, $B0, $02
|0E9382| db $00, $02, $B1, $BE, $00, $BD, $B9, $BA
|0E938A| db $02, $02, $B1, $B0, $02, $00, $00, $00
|0E9392| db $BD, $BC, $02, $02, $02, $02, $02, $02
|0E939A| db $00, $00, $00, $00, $00, $0E, $00, $00
|0E93A2| db $00, $00, $00, $00, $00, $00, $00, $00

; set 07
|0E93AA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E93B2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E93BA| db $02, $02, $02, $02, $02, $02, $02, $02
|0E93C2| db $02, $02, $02, $01, $01, $01, $01, $01
|0E93CA| db $01, $01, $01, $01, $01, $01, $01, $01
|0E93D2| db $01, $01, $02, $02, $02, $02, $02, $02
|0E93DA| db $00, $00, $22, $00, $00, $00, $00, $00
|0E93E2| db $00, $00, $02, $02, $00, $00, $00, $00
|0E93EA| db $01, $01, $01, $01, $01, $01, $01, $01
|0E93F2| db $00, $00, $00, $00, $00, $00, $02, $02
|0E93FA| db $01, $01, $01, $01, $01, $01, $01, $01
|0E9402| db $00, $00, $00, $00, $00, $00, $02, $02
|0E940A| db $02, $02, $02, $02, $18, $00, $00, $00
|0E9412| db $00, $00, $00, $00, $01, $01, $01, $01
|0E941A| db $6B, $6A, $02, $01, $02, $02, $08, $08
|0E9422| db $08, $08, $0E, $0E, $0E, $0E, $68, $69

;===================================================================================================

LoadUnderworldTileTypes:
|0E942A| PHB
|0E942B| PHK
|0E942C| PLB

|0E942D| REP #$30

|0E942F| LDA.w $0AA2
|0E9432| AND.w #$00FF
|0E9435| ASL A
|0E9436| TAX

|0E9437| LDA.w CustomTileTypesOffset,X
|0E943A| TAY

|0E943B| LDX.w #$0000

.copy_next
|0E943E| LDA.w CustomUnderworldTileTypes+$00,Y
|0E9441| STA.l $7EFF40,X

|0E9445| LDA.w CustomUnderworldTileTypes+$40,Y
|0E9448| STA.l $7EFF80,X

|0E944C| INY
|0E944D| INY

|0E944E| INX
|0E944F| INX

|0E9450| CPX.w #$0040
|0E9453| BNE .copy_next

|0E9455| SEP #$30

|0E9457| PLB

|0E9458| RTL

;===================================================================================================

OverworldTileTypes:
|0E9459| db $27, $27, $27, $27, $27, $27, $02, $02
|0E9461| db $01, $01, $01, $00, $00, $00, $00, $00
|0E9469| db $27, $01, $01, $01, $01, $01, $02, $02
|0E9471| db $27, $27, $27, $00, $00, $00, $00, $00
|0E9479| db $27, $01, $01, $01, $20, $01, $02, $02
|0E9481| db $27, $27, $27, $00, $00, $00, $00, $00
|0E9489| db $27, $01, $01, $01, $01, $20, $02, $02
|0E9491| db $02, $02, $02, $00, $00, $00, $00, $00
|0E9499| db $01, $01, $01, $01, $1A, $01, $12, $01
|0E94A1| db $01, $02, $01, $01, $28, $2E, $2A, $2B
|0E94A9| db $01, $01, $18, $18, $1A, $01, $12, $01
|0E94B1| db $01, $2C, $02, $2D, $29, $2F, $02, $02
|0E94B9| db $01, $01, $01, $01, $01, $01, $02, $01
|0E94C1| db $02, $2E, $00, $00, $2C, $00, $4E, $4F
|0E94C9| db $01, $01, $01, $01, $01, $01, $02, $01
|0E94D1| db $02, $00, $2E, $00, $00, $00, $02, $22
|0E94D9| db $01, $01, $02, $00, $00, $00, $18, $12
|0E94E1| db $02, $02, $00, $48, $00, $00, $00, $00
|0E94E9| db $01, $01, $02, $00, $01, $01, $10, $1A
|0E94F1| db $02, $00, $00, $48, $00, $00, $00, $00
|0E94F9| db $10, $10, $02, $00, $01, $01, $01, $01
|0E9501| db $00, $00, $48, $00, $00, $09, $00, $00
|0E9509| db $02, $02, $02, $00, $01, $01, $2B, $00
|0E9511| db $00, $09, $00, $00, $00, $00, $00, $00
|0E9519| db $01, $01, $01, $01, $01, $01, $02, $02
|0E9521| db $02, $02, $02, $02, $02, $00, $00, $00
|0E9529| db $01, $01, $01, $01, $01, $01, $02, $02
|0E9531| db $02, $02, $02, $02, $02, $00, $00, $00
|0E9539| db $01, $01, $01, $46, $01, $01, $02, $02
|0E9541| db $02, $02, $02, $02, $02, $00, $00, $00
|0E9549| db $01, $01, $01, $01, $01, $01, $02, $02
|0E9551| db $02, $02, $02, $02, $02, $00, $00, $00
|0E9559| db $02, $02, $42, $02, $02, $02, $02, $02
|0E9561| db $02, $02, $29, $22, $00, $00, $00, $00
|0E9569| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9571| db $02, $02, $29, $22, $00, $00, $00, $00
|0E9579| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9581| db $02, $02, $00, $00, $00, $00, $00, $00
|0E9589| db $02, $02, $02, $02, $02, $02, $02, $02
|0E9591| db $02, $02, $00, $00, $00, $00, $00, $00
|0E9599| db $01, $01, $01, $01, $01, $01, $01, $01
|0E95A1| db $01, $01, $01, $00, $00, $00, $02, $44
|0E95A9| db $01, $01, $01, $01, $01, $01, $01, $01
|0E95B1| db $02, $02, $02, $00, $00, $00, $02, $44
|0E95B9| db $01, $01, $01, $01, $01, $01, $01, $01
|0E95C1| db $02, $02, $02, $00, $00, $00, $00, $00
|0E95C9| db $01, $01, $43, $01, $01, $01, $01, $01
|0E95D1| db $02, $02, $02, $00, $00, $00, $00, $00
|0E95D9| db $50, $02, $54, $51, $57, $57, $56, $56
|0E95E1| db $27, $27, $27, $00, $40, $40, $48, $48
|0E95E9| db $50, $02, $54, $51, $57, $2A, $56, $56
|0E95F1| db $27, $27, $27, $00, $40, $40, $57, $48
|0E95F9| db $27, $02, $52, $53, $02, $01, $12, $18
|0E9601| db $55, $55, $00, $00, $48, $02, $02, $00
|0E9609| db $27, $02, $52, $53, $09, $01, $1A, $10
|0E9611| db $55, $55, $00, $00, $48, $02, $02, $00
|0E9619| db $02, $02, $18, $08, $08, $08, $09, $09
|0E9621| db $08, $08, $29, $02, $02, $02, $1A, $02
|0E9629| db $08, $08, $10, $08, $12, $00, $09, $09
|0E9631| db $09, $09, $09, $48, $09, $29, $00, $4B
|0E9639| db $02, $02, $02, $00, $08, $02, $02, $00
|0E9641| db $00, $00, $00, $01, $00, $00, $20, $00
|0E9649| db $02, $02, $02, $02, $02, $02, $02, $00
|0E9651| db $00, $01, $01, $01, $02, $00, $08, $00

;===================================================================================================

UnderworldTileTypes:
|0E9659| db $01, $01, $01, $00, $02, $01, $02, $00
|0E9661| db $01, $01, $02, $02, $02, $02, $02, $02
|0E9669| db $02, $02, $02, $00, $00, $01, $00, $00
|0E9671| db $02, $00, $00, $02, $02, $02, $02, $02
|0E9679| db $02, $02, $02, $02, $01, $01, $01, $02
|0E9681| db $02, $02, $02, $02, $01, $01, $00, $00
|0E9689| db $02, $02, $02, $02, $02, $02, $01, $02
|0E9691| db $02, $02, $02, $02, $01, $01, $00, $00
|0E9699| db $00, $00, $00, $2A, $01, $20, $01, $01
|0E96A1| db $04, $01, $01, $18, $01, $02, $1C, $01
|0E96A9| db $28, $28, $2A, $2A, $01, $02, $01, $01
|0E96B1| db $04, $00, $00, $00, $28, $01, $0A, $00
|0E96B9| db $01, $01, $0C, $0C, $02, $02, $02, $02
|0E96C1| db $28, $2A, $20, $20, $20, $02, $08, $00
|0E96C9| db $04, $04, $01, $01, $01, $02, $02, $02
|0E96D1| db $00, $00, $20, $20, $00, $02, $00, $00
|0E96D9| db $01, $01, $01, $01, $01, $01, $01, $01
|0E96E1| db $01, $01, $01, $01, $01, $01, $02, $02
|0E96E9| db $01, $01, $01, $01, $01, $01, $01, $01
|0E96F1| db $01, $01, $18, $10, $10, $01, $01, $01
|0E96F9| db $01, $01, $04, $04, $04, $04, $04, $04
|0E9701| db $01, $02, $02, $00, $00, $00, $00, $00
|0E9709| db $01, $01, $01, $01, $01, $01, $01, $01
|0E9711| db $01, $01, $01, $01, $01, $01, $02, $02
|0E9719| db $00, $00, $00, $00, $00, $00, $00, $00
|0E9721| db $00, $00, $00, $00, $00, $00, $62, $62
|0E9729| db $00, $00, $24, $24, $00, $00, $00, $00
|0E9731| db $00, $00, $00, $00, $00, $00, $62, $62
|0E9739| db $27, $02, $02, $02, $27, $27, $01, $00
|0E9741| db $00, $00, $00, $24, $00, $00, $00, $00
|0E9749| db $27, $27, $27, $27, $27, $10, $02, $01
|0E9751| db $00, $00, $00, $24, $00, $00, $00, $00
|0E9759| db $27, $02, $02, $02, $27, $27, $27, $27
|0E9761| db $02, $02, $02, $24, $00, $00, $00, $00
|0E9769| db $27, $27, $27, $27, $27, $20, $02, $02
|0E9771| db $01, $02, $02, $23, $02, $00, $00, $00
|0E9779| db $27, $27, $27, $27, $27, $20, $02, $27
|0E9781| db $02, $54, $00, $00, $27, $02, $02, $02
|0E9789| db $27, $27, $27, $27, $27, $27, $02, $27
|0E9791| db $02, $54, $00, $00, $27, $02, $02, $02
|0E9799| db $27, $27, $00, $27, $60, $60, $01, $01
|0E97A1| db $01, $01, $02, $02, $0D, $00, $00, $4B
|0E97A9| db $67, $67, $67, $67, $66, $66, $66, $66
|0E97B1| db $00, $00, $20, $20, $20, $20, $20, $20
|0E97B9| db $27, $63, $27, $55, $55, $01, $44, $00
|0E97C1| db $01, $20, $02, $02, $1C, $3A, $3B, $00
|0E97C9| db $27, $63, $27, $53, $53, $01, $44, $01
|0E97D1| db $0D, $00, $00, $00, $09, $09, $09, $09

;===================================================================================================

LoadDefaultTileTypes:
|0E97D9| REP #$20

|0E97DB| LDX.b #$3E

.copy_next
|0E97DD| LDA.l UnderworldTileTypes+$000,X
|0E97E1| STA.l $7EFE00,X

|0E97E5| LDA.l UnderworldTileTypes+$040,X
|0E97E9| STA.l $7EFE40,X

|0E97ED| LDA.l UnderworldTileTypes+$080,X
|0E97F1| STA.l $7EFE80,X

|0E97F5| LDA.l UnderworldTileTypes+$0C0,X
|0E97F9| STA.l $7EFEC0,X

|0E97FD| LDA.l UnderworldTileTypes+$100,X
|0E9801| STA.l $7EFF00,X

|0E9805| LDA.l UnderworldTileTypes+$140,X
|0E9809| STA.l $7EFFC0,X

|0E980D| DEX
|0E980E| DEX
|0E980F| BPL .copy_next

|0E9811| SEP #$20

|0E9813| RTL

;===================================================================================================
; FREE ROM: 0x0C
;===================================================================================================
NULL_0E9814:
|0E9814| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0E981C| db $FF, $FF, $FF, $FF

;===================================================================================================

pool Module1A_Credits

.vectors
|0E9820| dw Epilogue_LoadNextScene_Overworld    ; 0x00
|0E9822| dw Epilogue_ScrollScene_Overworld      ; 0x01
|0E9824| dw Epilogue_LoadNextScene_Underworld   ; 0x02
|0E9826| dw Epilogue_ScrollScene_Underworld     ; 0x03
|0E9828| dw Epilogue_LoadNextScene_Overworld    ; 0x04
|0E982A| dw Epilogue_ScrollScene_Overworld      ; 0x05
|0E982C| dw Epilogue_LoadNextScene_Overworld    ; 0x06
|0E982E| dw Epilogue_ScrollScene_Overworld      ; 0x07
|0E9830| dw Epilogue_LoadNextScene_Overworld    ; 0x08
|0E9832| dw Epilogue_ScrollScene_Overworld      ; 0x09
|0E9834| dw Epilogue_LoadNextScene_Overworld    ; 0x0A
|0E9836| dw Epilogue_ScrollScene_Overworld      ; 0x0B
|0E9838| dw Epilogue_LoadNextScene_Overworld    ; 0x0C
|0E983A| dw Epilogue_ScrollScene_Overworld      ; 0x0D
|0E983C| dw Epilogue_LoadNextScene_Overworld    ; 0x0E
|0E983E| dw Epilogue_ScrollScene_Overworld      ; 0x0F
|0E9840| dw Epilogue_LoadNextScene_Overworld    ; 0x10
|0E9842| dw Epilogue_ScrollScene_Overworld      ; 0x11
|0E9844| dw Epilogue_LoadNextScene_Overworld    ; 0x12
|0E9846| dw Epilogue_ScrollScene_Overworld      ; 0x13
|0E9848| dw Epilogue_LoadNextScene_Underworld   ; 0x14
|0E984A| dw Epilogue_ScrollScene_Underworld     ; 0x15
|0E984C| dw Epilogue_LoadNextScene_Underworld   ; 0x16
|0E984E| dw Epilogue_ScrollScene_Underworld     ; 0x17
|0E9850| dw Epilogue_LoadNextScene_Overworld    ; 0x18
|0E9852| dw Epilogue_ScrollScene_Overworld      ; 0x19
|0E9854| dw Epilogue_LoadNextScene_Overworld    ; 0x1A
|0E9856| dw Epilogue_ScrollScene_Overworld      ; 0x1B
|0E9858| dw Epilogue_LoadNextScene_Overworld    ; 0x1C
|0E985A| dw Epilogue_ScrollScene_Overworld      ; 0x1D
|0E985C| dw Epilogue_LoadNextScene_Overworld    ; 0x1E
|0E985E| dw Epilogue_ScrollScene_Overworld      ; 0x1F
|0E9860| dw Credits_InitializeTheActualCredits  ; 0x20
|0E9862| dw Credits_BrightenTriangles           ; 0x21
|0E9864| dw Credits_FadeColorAndBeginAnimating  ; 0x22
|0E9866| dw Credits_StopCreditsScroll           ; 0x23
|0E9868| dw Credits_FadeAndDisperseTriangles    ; 0x24
|0E986A| dw Credits_FadeInTheEnd                ; 0x25
|0E986C| dw Credits_HangForever                 ; 0x26

endpool

;---------------------------------------------------------------------------------------------------

Module1A_Credits:
|0E986E| REP #$20

|0E9870| LDA.w #$0030
|0E9873| STA.w $0FE0

|0E9876| LDA.w #$01D0
|0E9879| STA.w $0FE2

|0E987C| STZ.w $0FE4

|0E987F| SEP #$20

|0E9881| LDA.b $11
|0E9883| ASL A
|0E9884| TAX

|0E9885| JSR (.vectors,X)

|0E9888| RTL

;===================================================================================================

Epilogue_LoadNextScene_Overworld:
|0E9889| JSL Epilogue_LoadOverworldScene
|0E988D| JSR Epilogue_AddEndingSequenceText

|0E9890| RTS

;===================================================================================================

Epilogue_LoadNextScene_Underworld:
|0E9891| JSL Epilogue_LoadUnderworldScene

|0E9895| JSR Epilogue_AddEndingSequenceText

|0E9898| RTS

;===================================================================================================

pool Epilogue_PrepAndLoadSprites

.vectors
|0E9899| dw Epilogue_LoadSprites_GenericOW ; Hyrule Castle
|0E989B| dw Epilogue_LoadSprites_GenericUW ; Sanctuary
|0E989D| dw Epilogue_LoadSprites_Kakariko1 ; Kakariko
|0E989F| dw Epilogue_LoadSprites_Desert    ; Desert
|0E98A1| dw Epilogue_LoadSprites_GenericOW ; Tower of Hera
|0E98A3| dw Epilogue_LoadSprites_GenericOW ; Link's house
|0E98A5| dw Epilogue_LoadSprites_Zora      ; Zora's Domain
|0E98A7| dw Epilogue_LoadSprites_Witch     ; Potion shop
|0E98A9| dw Epilogue_LoadSprites_GenericOW ; Lumberjacks
|0E98AB| dw Epilogue_LoadSprites_Grove     ; Haunted Grove
|0E98AD| dw Epilogue_LoadSprites_Venus     ; Wishing Well
|0E98AF| dw Epilogue_LoadSprites_Smithy    ; Smithery
|0E98B1| dw Epilogue_LoadSprites_Kakariko2 ; Kakariko (bug net)
|0E98B3| dw Epilogue_LoadSprites_GenericOW ; Death Mountain
|0E98B5| dw Epilogue_LoadSprites_LostWoods ; Lost Woods
|0E98B7| dw Epilogue_LoadSprites_Pedestal  ; Master Sword

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_PrepAndLoadSprites:
|0E98B9| PHB
|0E98BA| PHK
|0E98BB| PLB

|0E98BC| LDX.b #$0F

.reset_next_sprite
|0E98BE| JSL ResetSpriteProperties

|0E98C2| STZ.w $0DD0,X
|0E98C5| STZ.w $0BE0,X
|0E98C8| STZ.w $0CAA,X

|0E98CB| DEX
|0E98CC| BPL .reset_next_sprite

;---------------------------------------------------------------------------------------------------

|0E98CE| LDA.b $11
|0E98D0| AND.b #$FE
|0E98D2| TAX

|0E98D3| JSR (.vectors,X)

|0E98D6| PLB

|0E98D7| RTL

;===================================================================================================

pool Epilogue_ScrollScene

.target_y
|0E98D8| dw $06F2 ; Hyrule Castle
|0E98DA| dw $0210 ; Sanctuary
|0E98DC| dw $072C ; Kakariko
|0E98DE| dw $0C00 ; Desert
|0E98E0| dw $010C ; Tower of Hera
|0E98E2| dw $0A9B ; Link's house
|0E98E4| dw $0010 ; Zora's Domain
|0E98E6| dw $0510 ; Potion shop
|0E98E8| dw $0089 ; Lumberjacks
|0E98EA| dw $0A8E ; Haunted Grove
|0E98EC| dw $222C ; Wishing Well
|0E98EE| dw $2510 ; Smithery
|0E98F0| dw $0826 ; Kakariko (bug net)
|0E98F2| dw $005C ; Death Mountain
|0E98F4| dw $020A ; Lost Woods
|0E98F6| dw $0030 ; Master Sword

.target_x
|0E98F8| dw $077F ; Hyrule Castle
|0E98FA| dw $0480 ; Sanctuary
|0E98FC| dw $0193 ; Kakariko
|0E98FE| dw $00AA ; Desert
|0E9900| dw $0878 ; Tower of Hera
|0E9902| dw $0847 ; Link's house
|0E9904| dw $04FD ; Zora's Domain
|0E9906| dw $0C57 ; Potion shop
|0E9908| dw $040F ; Lumberjacks
|0E990A| dw $0478 ; Haunted Grove
|0E990C| dw $0A00 ; Wishing Well
|0E990E| dw $0200 ; Smithery
|0E9910| dw $0201 ; Kakariko (bug net)
|0E9912| dw $0AA1 ; Death Mountain
|0E9914| dw $026F ; Lost Woods
|0E9916| dw $0000 ; Master Sword

;---------------------------------------------------------------------------------------------------

.movement_y
|0E9918| dw  -1   ; Hyrule Castle
|0E991A| dw  -1   ; Sanctuary
|0E991C| dw   1   ; Kakariko
|0E991E| dw  -1   ; Desert
|0E9920| dw   1   ; Tower of Hera
|0E9922| dw   1   ; Link's house
|0E9924| dw   0   ; Zora's Domain
|0E9926| dw   1   ; Potion shop
|0E9928| dw   0   ; Lumberjacks
|0E992A| dw  -1   ; Haunted Grove
|0E992C| dw  -1   ; Wishing Well
|0E992E| dw   0   ; Smithery
|0E9930| dw   0   ; Kakariko (bug net)
|0E9932| dw   0   ; Death Mountain
|0E9934| dw   1   ; Lost Woods
|0E9936| dw  -1   ; Master Sword

.movement_x
|0E9938| dw   0   ; Hyrule Castle
|0E993A| dw   0   ; Sanctuary
|0E993C| dw  -1   ; Kakariko
|0E993E| dw   0   ; Desert
|0E9940| dw   0   ; Tower of Hera
|0E9942| dw  -1   ; Link's house
|0E9944| dw   1   ; Zora's Domain
|0E9946| dw   0   ; Potion shop
|0E9948| dw  -1   ; Lumberjacks
|0E994A| dw   0   ; Haunted Grove
|0E994C| dw   0   ; Wishing Well
|0E994E| dw   0   ; Smithery
|0E9950| dw   1   ; Kakariko (bug net)
|0E9952| dw  -1   ; Death Mountain
|0E9954| dw   1   ; Lost Woods
|0E9956| dw   0   ; Master Sword

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_ScrollScene_Overworld:
|0E9958| PHB
|0E9959| PHK
|0E995A| PLB

|0E995B| LDX.b #$0F

.next_timer
|0E995D| LDA.w $0DF0,X
|0E9960| BEQ .timer_done

|0E9962| DEC.w $0DF0,X

.timer_done
|0E9965| DEX
|0E9966| BPL .next_timer

;---------------------------------------------------------------------------------------------------

|0E9968| LDA.b $11
|0E996A| AND.b #$FE
|0E996C| TAX

|0E996D| STZ.b $30
|0E996F| STZ.b $31

|0E9971| REP #$20

|0E9973| LDA.b $C8
|0E9975| CMP.w #$0040
|0E9978| BCC .no_scroll

|0E997A| AND.w #$0001
|0E997D| BNE .no_scroll

|0E997F| LDA.b $E8
|0E9981| CMP.w Epilogue_ScrollScene.target_y,X
|0E9984| BEQ .at_vertical_target

|0E9986| LDY.w Epilogue_ScrollScene.movement_y,X
|0E9989| STY.b $30

.at_vertical_target
|0E998B| LDA.b $E2
|0E998D| CMP.w Epilogue_ScrollScene.target_x,X
|0E9990| BEQ .no_scroll

|0E9992| LDY.w Epilogue_ScrollScene.movement_x,X
|0E9995| STY.b $31

;---------------------------------------------------------------------------------------------------

.no_scroll
|0E9997| SEP #$20

|0E9999| PHX
|0E999A| JSL Epilogue_OperateScrollingAndTilemap
|0E999E| PLX

|0E999F| JSR (Epilogue_SpriteDraw_vectors,X)

|0E99A2| JMP.w Epilogue_HandleSceneFade

;===================================================================================================

Epilogue_SpriteDraw_vectors:
|0E99A5| dw Epilogue_SpriteDraw_Castle
|0E99A7| dw Epilogue_SpriteDraw_Sanctuary
|0E99A9| dw Epilogue_SpriteDraw_Kakariko1
|0E99AB| dw Epilogue_SpriteDraw_Desert
|0E99AD| dw Epilogue_SpriteDraw_Hera
|0E99AF| dw Epilogue_SpriteDraw_House
|0E99B1| dw Epilogue_SpriteDraw_Zora
|0E99B3| dw Epilogue_SpriteDraw_Witch
|0E99B5| dw Epilogue_SpriteDraw_Lumberjacks
|0E99B7| dw Epilogue_SpriteDraw_Grove
|0E99B9| dw Epilogue_SpriteDraw_Venus
|0E99BB| dw Epilogue_SpriteDraw_Smithy
|0E99BD| dw Epilogue_SpriteDraw_Kakariko2
|0E99BF| dw Epilogue_SpriteDraw_DeathMountain
|0E99C1| dw Epilogue_SpriteDraw_LostWoods
|0E99C3| dw Epilogue_SpriteDraw_Pedestal

;===================================================================================================

Epilogue_ScrollScene_Underworld:
|0E99C5| PHB
|0E99C6| PHK
|0E99C7| PLB

|0E99C8| LDX.b #$0F

.next_timer
|0E99CA| LDA.w $0DF0,X
|0E99CD| BEQ .timer_done

|0E99CF| DEC.w $0DF0,X

.timer_done
|0E99D2| DEX
|0E99D3| BPL .next_timer

;---------------------------------------------------------------------------------------------------

|0E99D5| LDA.b $11
|0E99D7| AND.b #$FE
|0E99D9| TAX

|0E99DA| REP #$20

|0E99DC| LDA.b $C8
|0E99DE| CMP.w #$0040
|0E99E1| BCC .no_scroll

|0E99E3| AND.w #$0001
|0E99E6| BNE .no_scroll

|0E99E8| LDA.b $E8
|0E99EA| CMP.w Epilogue_ScrollScene.target_y,X
|0E99ED| BEQ .at_vertical_target

|0E99EF| CLC
|0E99F0| ADC.w Epilogue_ScrollScene.movement_y,X
|0E99F3| STA.b $E8

.at_vertical_target
|0E99F5| LDA.b $E2
|0E99F7| CMP.w Epilogue_ScrollScene.target_x,X
|0E99FA| BEQ .no_scroll

|0E99FC| CLC
|0E99FD| ADC.w Epilogue_ScrollScene.movement_x,X
|0E9A00| STA.b $E2

.no_scroll
|0E9A02| SEP #$20

|0E9A04| JSR (Epilogue_SpriteDraw_vectors,X)

|0E9A07| JMP.w Epilogue_HandleSceneFade

;===================================================================================================

pool Epilogue_HandleSceneFade

.timer
|0E9A0A| dw $0300 ;  768 - Hyrule Castle
|0E9A0C| dw $0280 ;  640 - Sanctuary
|0E9A0E| dw $0250 ;  592 - Kakariko
|0E9A10| dw $02E0 ;  736 - Desert
|0E9A12| dw $0280 ;  640 - Tower of Hera
|0E9A14| dw $0250 ;  592 - Link's house
|0E9A16| dw $02C0 ;  704 - Zora's Domain
|0E9A18| dw $02C0 ;  704 - Potion shop
|0E9A1A| dw $0250 ;  592 - Lumberjacks
|0E9A1C| dw $0250 ;  592 - Haunted Grove
|0E9A1E| dw $0280 ;  640 - Wishing Well
|0E9A20| dw $0250 ;  592 - Smithery
|0E9A22| dw $0480 ; 1152 - Kakariko (bug net)
|0E9A24| dw $0400 ; 1024 - Death Mountain
|0E9A26| dw $0250 ;  592 - Lost Woods
|0E9A28| dw $0500 ; 1280 - Master Sword

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_HandleSceneFade:
|0E9A2A| LDA.b $11
|0E9A2C| AND.b #$FE
|0E9A2E| TAX

|0E9A2F| REP #$20

|0E9A31| LDA.b $C8
|0E9A33| CMP.w .timer,X

|0E9A36| SEP #$20
|0E9A38| BCC .dont_fade

|0E9A3A| LDA.b $C8
|0E9A3C| AND.b #$01
|0E9A3E| BNE .delay

|0E9A40| DEC.b $13
|0E9A42| BNE .delay

|0E9A44| INC.b $11
|0E9A46| BRA .continue

.dont_fade
|0E9A48| LDA.b $C8
|0E9A4A| AND.b #$01
|0E9A4C| BNE .delay

|0E9A4E| LDA.b $13
|0E9A50| CMP.b #$0F
|0E9A52| BEQ .delay

|0E9A54| INC.b $13

.delay
|0E9A56| REP #$20

|0E9A58| INC.b $C8

|0E9A5A| SEP #$20

;---------------------------------------------------------------------------------------------------

.continue
|0E9A5C| REP #$20

|0E9A5E| LDA.b $E2
|0E9A60| STA.w $011E

|0E9A63| LDA.b $E8
|0E9A65| STA.w $0122

|0E9A68| LDA.b $E0
|0E9A6A| STA.w $0120

|0E9A6D| LDA.b $E6
|0E9A6F| STA.w $0124

|0E9A72| SEP #$20

|0E9A74| PLB

|0E9A75| RTS

;===================================================================================================

pool Epilogue_SpriteData

.castle_position_x
|0E9A76| dw $01E0 ; King
|0E9A78| dw $0200 ; Zelda
|0E9A7A| dw $01ED ; Maiden 3
|0E9A7C| dw $0203 ; Maiden 4
|0E9A7E| dw $01DA ; Maiden 2
|0E9A80| dw $0216 ; Maiden 5
|0E9A82| dw $01C8 ; Maiden 1
|0E9A84| dw $0228 ; Maiden 6
|0E9A86| dw $01C0 ; Guard 1
|0E9A88| dw $01E0 ; Guard 2
|0E9A8A| dw $0208 ; Guard 3
|0E9A8C| dw $0228 ; Guard 4

.castle_position_y
|0E9A8E| dw $0158 ; King
|0E9A90| dw $0158 ; Zelda
|0E9A92| dw $0138 ; Maiden 3
|0E9A94| dw $0138 ; Maiden 4
|0E9A96| dw $0140 ; Maiden 2
|0E9A98| dw $0140 ; Maiden 5
|0E9A9A| dw $0150 ; Maiden 1
|0E9A9C| dw $0150 ; Maiden 6
|0E9A9E| dw $0120 ; Guard 1
|0E9AA0| dw $0120 ; Guard 2
|0E9AA2| dw $0120 ; Guard 3
|0E9AA4| dw $0120 ; Guard 4

;---------------------------------------------------------------------------------------------------

.kak1_position_x
|0E9AA6| dw $0278
|0E9AA8| dw $0298
|0E9AAA| dw $01E0
|0E9AAC| dw $0200
|0E9AAE| dw $0220
|0E9AB0| dw $0288
|0E9AB2| dw $01E2

.kak1_position_y
|0E9AB4| dw $00C2
|0E9AB6| dw $00C2
|0E9AB8| dw $016B
|0E9ABA| dw $016C
|0E9ABC| dw $016B
|0E9ABE| dw $00B8
|0E9AC0| dw $016B

;---------------------------------------------------------------------------------------------------

.hera_position_x
|0E9AC2| dw $0335
|0E9AC4| dw $0335
|0E9AC6| dw $0300

.hera_position_y
|0E9AC8| dw $0128
|0E9ACA| dw $0128
|0E9ACC| dw $016F

;---------------------------------------------------------------------------------------------------

.house_position_x
|0E9ACE| dw $00B8
|0E9AD0| dw $00CE
|0E9AD2| dw $00AC
|0E9AD4| dw $00C4

.house_position_y
|0E9AD6| dw $00F5
|0E9AD8| dw $00FC
|0E9ADA| dw $010D
|0E9ADC| dw $010D

;---------------------------------------------------------------------------------------------------

.mountain_position_x
|0E9ADE| dw $0180

.mountain_position_y
|0E9AE0| dw $00D8

;---------------------------------------------------------------------------------------------------

.bumpkin_position_x
|0E9AE2| dw $0080

.bumpkin_position_y
|0E9AE4| dw $00F4

;---------------------------------------------------------------------------------------------------

.venus_position_x
|0E9AE6| dw $0070
|0E9AE8| dw $0070
|0E9AEA| dw $0070
|0E9AEC| dw $0068
|0E9AEE| dw $0088
|0E9AF0| dw $0070

.venus_position_y
|0E9AF2| dw $003C
|0E9AF4| dw $003C
|0E9AF6| dw $003C
|0E9AF8| dw $0090
|0E9AFA| dw $0080
|0E9AFC| dw $003C

;---------------------------------------------------------------------------------------------------

.kak2_position_x
|0E9AFE| dw $00C8
|0E9B00| dw $0278
|0E9B02| dw $0258
|0E9B04| dw $01D8
|0E9B06| dw $01C8
|0E9B08| dw $0188
|0E9B0A| dw $0270

.kak2_position_y
|0E9B0C| dw $0250
|0E9B0E| dw $02B0
|0E9B10| dw $02B0
|0E9B12| dw $02A0
|0E9B14| dw $02B0
|0E9B16| dw $02B0
|0E9B18| dw $02B8

;---------------------------------------------------------------------------------------------------

.zora_position_x
|0E9B1A| dw $03B0
|0E9B1C| dw $0390
|0E9B1E| dw $03D0

.zora_position_y
|0E9B20| dw $0040
|0E9B22| dw $0040
|0E9B24| dw $0040

;---------------------------------------------------------------------------------------------------

.smithy_position_x
|0E9B26| dw $0040
|0E9B28| dw $0070
|0E9B2A| dw $004F
|0E9B2C| dw $0061
|0E9B2E| dw $0037
|0E9B30| dw $0079

.smithy_position_y
|0E9B32| dw $016C
|0E9B34| dw $016C
|0E9B36| dw $0174
|0E9B38| dw $0174
|0E9B3A| dw $0175
|0E9B3C| dw $0175

;---------------------------------------------------------------------------------------------------

.desert_position_x
|0E9B3E| dw $00E0
|0E9B40| dw $0150
|0E9B42| dw $00E8
|0E9B44| dw $0168
|0E9B46| dw $0128
|0E9B48| dw $0170
|0E9B4A| dw $0170

.desert_position_y
|0E9B4C| dw $0080
|0E9B4E| dw $0060
|0E9B50| dw $0146
|0E9B52| dw $0146
|0E9B54| dw $01C6
|0E9B56| dw $0070
|0E9B58| dw $0070

;---------------------------------------------------------------------------------------------------

.sanc_position_x
|0E9B5A| dw $00F8
|0E9B5C| dw $00F0

.sanc_position_y
|0E9B5E| dw $0060
|0E9B60| dw $0037

;---------------------------------------------------------------------------------------------------

.witch_position_x
|0E9B62| dw $00F8
|0E9B64| dw $00C8

.witch_position_y
|0E9B66| dw $0150
|0E9B68| dw $0158

;---------------------------------------------------------------------------------------------------

.grove_position_x
|0E9B6A| dw $00F8
|0E9B6C| dw $00F8
|0E9B6E| dw $00F8
|0E9B70| dw $00F8
|0E9B72| dw $00F8
|0E9B74| dw $00E8
|0E9B76| dw $00F8
|0E9B78| dw $00D8
|0E9B7A| dw $00F8
|0E9B7C| dw $00C8
|0E9B7E| dw $0108

.grove_position_y
|0E9B80| dw $0120
|0E9B82| dw $0120
|0E9B84| dw $0120
|0E9B86| dw $0120
|0E9B88| dw $0120
|0E9B8A| dw $0108
|0E9B8C| dw $0100
|0E9B8E| dw $00D8
|0E9B90| dw $00D8
|0E9B92| dw $00F0
|0E9B94| dw $00F0

;---------------------------------------------------------------------------------------------------

.lostwoods_position_x
|0E9B96| dw $02E8
|0E9B98| dw $0270
|0E9B9A| dw $0270
|0E9B9C| dw $02A0
|0E9B9E| dw $02A0
|0E9BA0| dw $02A4
|0E9BA2| dw $02FC

.lostwoods_position_y
|0E9BA4| dw $024B
|0E9BA6| dw $01B0
|0E9BA8| dw $01C8
|0E9BAA| dw $01C8
|0E9BAC| dw $01B0
|0E9BAE| dw $0230
|0E9BB0| dw $0230

;---------------------------------------------------------------------------------------------------

.pedestal_position_x
|0E9BB2| dw $0076
|0E9BB4| dw $0073
|0E9BB6| dw $0076
|0E9BB8| dw $0000
|0E9BBA| dw $00D0
|0E9BBC| dw $0080

.pedestal_position_y
|0E9BBE| dw $008B
|0E9BC0| dw $0083
|0E9BC2| dw $0085
|0E9BC4| dw $002C
|0E9BC6| dw $00F8
|0E9BC8| dw $0100

;---------------------------------------------------------------------------------------------------

.position_x_pointers
|0E9BCA| dw .castle_position_x
|0E9BCC| dw .sanc_position_x
|0E9BCE| dw .kak1_position_x
|0E9BD0| dw .desert_position_x
|0E9BD2| dw .hera_position_x
|0E9BD4| dw .house_position_x
|0E9BD6| dw .zora_position_x
|0E9BD8| dw .witch_position_x
|0E9BDA| dw .bumpkin_position_x
|0E9BDC| dw .grove_position_x
|0E9BDE| dw .venus_position_x
|0E9BE0| dw .smithy_position_x
|0E9BE2| dw .kak2_position_x
|0E9BE4| dw .mountain_position_x
|0E9BE6| dw .lostwoods_position_x
|0E9BE8| dw .pedestal_position_x

.position_y_pointers
|0E9BEA| dw .castle_position_y
|0E9BEC| dw .sanc_position_y
|0E9BEE| dw .kak1_position_y
|0E9BF0| dw .desert_position_y
|0E9BF2| dw .hera_position_y
|0E9BF4| dw .house_position_y
|0E9BF6| dw .zora_position_y
|0E9BF8| dw .witch_position_y
|0E9BFA| dw .bumpkin_position_y
|0E9BFC| dw .grove_position_y
|0E9BFE| dw .venus_position_y
|0E9C00| dw .smithy_position_y
|0E9C02| dw .kak2_position_y
|0E9C04| dw .mountain_position_y
|0E9C06| dw .lostwoods_position_y
|0E9C08| dw .pedestal_position_y

;---------------------------------------------------------------------------------------------------

.sprite_count
|0E9C0A| db  11 ; Hyrule Castle
|0E9C0B| db   1 ; Sanctuary
|0E9C0C| db   6 ; Kakariko
|0E9C0D| db   6 ; Desert
|0E9C0E| db   2 ; Tower of Hera
|0E9C0F| db   3 ; Link's house
|0E9C10| db   2 ; Zora's Domain
|0E9C11| db   1 ; Potion shop
|0E9C12| db   0 ; Lumberjacks
|0E9C13| db  10 ; Haunted Grove
|0E9C14| db   5 ; Wishing Well
|0E9C15| db   5 ; Smithery
|0E9C16| db   6 ; Kakariko (bug net)
|0E9C17| db   0 ; Death Mountain
|0E9C18| db   6 ; Lost Woods
|0E9C19| db   5 ; Master Sword

endpool

;===================================================================================================

Epilogue_LoadSprites_Zora:
|0E9C1A| LDA.b #$FF
|0E9C1C| STA.w $0DF0
|0E9C1F| STA.w $0DF1
|0E9C22| STA.w $0DF2

|0E9C25| BRA ProceedToEpilogueSpriteLoad

;===================================================================================================

Epilogue_LoadSprites_Kakariko1:
|0E9C27| LDA.w EpilogueSpriteSpeeds.neg16

|0E9C2A| STA.w $0D46

|0E9C2D| BRA ProceedToEpilogueSpriteLoad

;===================================================================================================

Epilogue_LoadSprites_Desert:
|0E9C2F| LDA.b #$16
|0E9C31| STA.w $0D95

|0E9C34| LDA.w EpilogueSpriteSpeeds.neg16
|0E9C37| STA.w $0D40

|0E9C3A| LDA.w EpilogueSpriteSpeeds.pos16
|0E9C3D| STA.w $0D41

|0E9C40| LDA.b #$01
|0E9C42| STA.w $0EB1

;---------------------------------------------------------------------------------------------------

|0E9C45| LDY.b #$02

.next_sprite
|0E9C47| LDA.b #$57 ; SPRITE 57
|0E9C49| STA.w $0E22,Y

|0E9C4C| LDA.b #$31
|0E9C4E| STA.w $0F52,Y

|0E9C51| DEY
|0E9C52| BPL .next_sprite

;===================================================================================================

ProceedToEpilogueSpriteLoad:
|0E9C54| BRA ProceedTo_Epilogue_LoadSprites_GenericOW

;===================================================================================================

pool Epilogue_LoadSprites_Grove

.sprite_timers
|0E9C56| db $00, $13, $26, $39, $4C

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_LoadSprites_Grove:
|0E9C5B| LDY.b #$04

.init_next_sprite
|0E9C5D| LDA.w .sprite_timers,Y
|0E9C60| STA.w $0DF0,Y

|0E9C63| LDA.b #$00
|0E9C65| STA.w $0DD0,Y

|0E9C68| DEY
|0E9C69| BPL .init_next_sprite

;---------------------------------------------------------------------------------------------------

|0E9C6B| LDA.b #$2E ; SPRITE 2E
|0E9C6D| STA.w $0E25

;---------------------------------------------------------------------------------------------------

|0E9C70| LDY.b #$01

.set_next_sprite
|0E9C72| LDA.b #$9F ; SPRITE 9F
|0E9C74| STA.w $0E27,Y

|0E9C77| LDA.b #$A0 ; SPRITE A0
|0E9C79| STA.w $0E29,Y

|0E9C7C| LDA.b #$01
|0E9C7E| STA.w $0E47,Y

|0E9C81| INC A
|0E9C82| STA.w $0E49,Y

|0E9C85| LDA.b #$10
|0E9C87| STA.w $0E67,Y
|0E9C8A| STA.w $0E69,Y

|0E9C8D| DEY
|0E9C8E| BPL .set_next_sprite

;===================================================================================================

ProceedTo_Epilogue_LoadSprites_GenericOW:
|0E9C90| BRA Epilogue_LoadSprites_GenericOW

;===================================================================================================

Epilogue_LoadSprites_LostWoods:
|0E9C92| LDA.w EpilogueSpriteSpeeds.neg16
|0E9C95| STA.w $0D45

|0E9C98| LDA.w EpilogueSpriteSpeeds.pos16
|0E9C9B| STA.w $0D46

|0E9C9E| LDA.b #$01
|0E9CA0| STA.w $0EB6

|0E9CA3| LDA.b #$08
|0E9CA5| STA.w $0D90

;---------------------------------------------------------------------------------------------------

|0E9CA8| LDY.b #$03

.next_sprite_y
|0E9CAA| LDA.b #$04
|0E9CAC| STA.w $0D41,Y

|0E9CAF| DEY
|0E9CB0| BPL .next_sprite_y

;---------------------------------------------------------------------------------------------------

|0E9CB2| BRA Epilogue_LoadSprites_GenericOW

;===================================================================================================

Epilogue_LoadSprites_Pedestal:
|0E9CB4| LDA.b #$02
|0E9CB6| STA.w $0DB4

|0E9CB9| LDA.b #$08
|0E9CBB| STA.w $0D45

|0E9CBE| LDA.b #$13
|0E9CC0| STA.w $0DF1

|0E9CC3| LDA.b #$40
|0E9CC5| STA.w $0DF4

|0E9CC8| BRA Epilogue_LoadSprites_GenericOW

;===================================================================================================

Epilogue_LoadSprites_Witch:
|0E9CCA| LDA.b #$FF
|0E9CCC| STA.w $0DF1

|0E9CCF| BRA Epilogue_LoadSprites_GenericOW

;===================================================================================================

Epilogue_LoadSprites_Kakariko2:
|0E9CD1| LDY.b #$01

.next_sprite
|0E9CD3| LDA.b #$39
|0E9CD5| STA.w $0F53,Y

|0E9CD8| LDA.b #$0B ; SPRITE 0B
|0E9CDA| STA.w $0E23,Y

|0E9CDD| LDA.b #$10
|0E9CDF| STA.w $0E63,Y

|0E9CE2| LDA.b #$01
|0E9CE4| STA.w $0E43,Y

|0E9CE7| DEY
|0E9CE8| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0E9CEA| LDA.b #$2A ; SPRITE 2A
|0E9CEC| STA.w $0E25

|0E9CEF| LDA.b #$79 ; SPRITE 79
|0E9CF1| STA.w $0E26

|0E9CF4| LDA.b #$01
|0E9CF6| STA.w $0D86

|0E9CF9| LDA.b #$05
|0E9CFB| STA.w $0F76

;===================================================================================================

Epilogue_LoadSprites_GenericOW:
|0E9CFE| LDA.w Epilogue_SpriteData.position_x_pointers+0,X
|0E9D01| STA.b $04

|0E9D03| LDA.w Epilogue_SpriteData.position_x_pointers+1,X
|0E9D06| STA.b $05

|0E9D08| LDA.w Epilogue_SpriteData.position_y_pointers+0,X
|0E9D0B| STA.b $06

|0E9D0D| LDA.w Epilogue_SpriteData.position_y_pointers+1,X
|0E9D10| STA.b $07

|0E9D12| TXA
|0E9D13| LSR A
|0E9D14| TAX

|0E9D15| LDA.w Epilogue_SpriteData.sprite_count,X
|0E9D18| TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
|0E9D19| TXA
|0E9D1A| ASL A
|0E9D1B| TAY

|0E9D1C| REP #$20

|0E9D1E| LDA.w #$FFFF
|0E9D21| STA.w $0FBA
|0E9D24| STA.w $0FB8

|0E9D27| LDA.w $040A
|0E9D2A| ASL A
|0E9D2B| XBA
|0E9D2C| AND.w #$0F00

|0E9D2F| CLC
|0E9D30| ADC.b ($04),Y
|0E9D32| STA.b $00

|0E9D34| LDA.w $040A
|0E9D37| LSR A
|0E9D38| LSR A
|0E9D39| XBA
|0E9D3A| AND.w #$0E00

|0E9D3D| CLC
|0E9D3E| ADC.b ($06),Y
|0E9D40| STA.b $02

|0E9D42| SEP #$20

|0E9D44| LDA.b $00
|0E9D46| STA.w $0D10,X

|0E9D49| LDA.b $01
|0E9D4B| STA.w $0D30,X

|0E9D4E| LDA.b $02
|0E9D50| STA.w $0D00,X

|0E9D53| LDA.b $03
|0E9D55| STA.w $0D20,X

|0E9D58| DEX
|0E9D59| BPL .next_sprite

|0E9D5B| RTS

;===================================================================================================

Epilogue_LoadSprites_Venus:
|0E9D5C| LDA.b #$10
|0E9D5E| STA.w $0DF1

|0E9D61| LDA.b #$20
|0E9D63| STA.w $0DF2

|0E9D66| LDA.b #$08
|0E9D68| STA.w $0F53
|0E9D6B| STA.w $0F54

|0E9D6E| BRA Epilogue_LoadSprites_GenericUW

;===================================================================================================

Epilogue_LoadSprites_Smithy:
|0E9D70| LDA.b #$79
|0E9D72| STA.w $0F54

|0E9D75| LDA.b #$39
|0E9D77| STA.w $0F55

|0E9D7A| LDA.b #$01
|0E9D7C| STA.w $0DE1

|0E9D7F| LDA.b #$04
|0E9D81| STA.w $0D91

;===================================================================================================

Epilogue_LoadSprites_GenericUW:
|0E9D84| REP #$20

|0E9D86| LDA.w $048E
|0E9D89| LSR A
|0E9D8A| LSR A
|0E9D8B| LSR A

|0E9D8C| SEP #$20

|0E9D8E| AND.b #$FE
|0E9D90| STA.w $0FB1

|0E9D93| LDA.w $048E
|0E9D96| AND.b #$0F
|0E9D98| ASL A
|0E9D99| STA.w $0FB0

;---------------------------------------------------------------------------------------------------

|0E9D9C| LDA.w Epilogue_SpriteData.position_x_pointers+0,X
|0E9D9F| STA.b $04

|0E9DA1| LDA.w Epilogue_SpriteData.position_x_pointers+1,X
|0E9DA4| STA.b $05

|0E9DA6| LDA.w Epilogue_SpriteData.position_y_pointers+0,X
|0E9DA9| STA.b $06

|0E9DAB| LDA.w Epilogue_SpriteData.position_y_pointers+1,X
|0E9DAE| STA.b $07

|0E9DB0| TXA
|0E9DB1| LSR A
|0E9DB2| TAX

|0E9DB3| LDA.w Epilogue_SpriteData.sprite_count,X
|0E9DB6| TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
|0E9DB7| TXA
|0E9DB8| ASL A
|0E9DB9| TAY

|0E9DBA| LDA.w $0FB1
|0E9DBD| XBA
|0E9DBE| LDA.b #$00

|0E9DC0| REP #$20

|0E9DC2| CLC
|0E9DC3| ADC.b ($06),Y
|0E9DC5| STA.b $02

|0E9DC7| SEP #$20

|0E9DC9| LDA.w $0FB0
|0E9DCC| XBA
|0E9DCD| LDA.b #$00

|0E9DCF| REP #$20

|0E9DD1| CLC
|0E9DD2| ADC.b ($04),Y
|0E9DD4| STA.b $00

|0E9DD6| SEP #$20

|0E9DD8| LDA.b $00
|0E9DDA| STA.w $0D10,X

|0E9DDD| LDA.b $01
|0E9DDF| STA.w $0D30,X

|0E9DE2| LDA.b $02
|0E9DE4| STA.w $0D00,X

|0E9DE7| LDA.b $03
|0E9DE9| STA.w $0D20,X

|0E9DEC| DEX
|0E9DED| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0E9DEF| RTS

;===================================================================================================

EpilogueOAMGroup_King:
|0E9DF0| dw  -3,  17 : db $2B, $00, $00, $00
|0E9DF8| dw  -3,  25 : db $3B, $00, $00, $00
|0E9E00| dw   0,   0 : db $0E, $00, $00, $02
|0E9E08| dw  16,   0 : db $0E, $40, $00, $02
|0E9E10| dw   0,  16 : db $2E, $00, $00, $02
|0E9E18| dw  16,  16 : db $2E, $40, $00, $02

;===================================================================================================

EpilogueOAMGroup_Zelda:
|0E9E20| dw   8,   5 : db $04, $0A, $00, $02
|0E9E28| dw   0,  16 : db $06, $08, $00, $02
|0E9E30| dw  16,  16 : db $06, $48, $00, $02

;===================================================================================================

EpilogueOAMGroup_Maiden:
|0E9E38| dw   0,   0 : db $00, $00, $00, $02
|0E9E40| dw   0,  11 : db $02, $00, $00, $02

;===================================================================================================

EpilogueOAMGroup_Guard:
|0E9E48| dw   1,   4 : db $2A, $00, $00, $00
|0E9E50| dw   1,  12 : db $3A, $00, $00, $00
|0E9E58| dw   4,   0 : db $26, $00, $00, $02
|0E9E60| dw   0,   9 : db $24, $00, $00, $02
|0E9E68| dw   8,   9 : db $24, $40, $00, $02
|0E9E70| dw   4,  20 : db $6C, $01, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Castle

.pointer_offset
|0E9E78| db $1E ; King
|0E9E79| db $20 ; Zelda
|0E9E7A| db $22 ; Maiden 3
|0E9E7B| db $22 ; Maiden 4
|0E9E7C| db $22 ; Maiden 2
|0E9E7D| db $22 ; Maiden 5
|0E9E7E| db $22 ; Maiden 1
|0E9E7F| db $22 ; Maiden 6
|0E9E80| db $16 ; Guard 1
|0E9E81| db $16 ; Guard 2
|0E9E82| db $16 ; Guard 3
|0E9E83| db $16 ; Guard 4

.group_size
|0E9E84| db $06 ; King
|0E9E85| db $03 ; Zelda
|0E9E86| db $02 ; Maiden 3
|0E9E87| db $02 ; Maiden 4
|0E9E88| db $02 ; Maiden 2
|0E9E89| db $02 ; Maiden 5
|0E9E8A| db $02 ; Maiden 1
|0E9E8B| db $02 ; Maiden 6
|0E9E8C| db $06 ; Guard 1
|0E9E8D| db $06 ; Guard 2
|0E9E8E| db $06 ; Guard 3
|0E9E8F| db $06 ; Guard 4

;---------------------------------------------------------------------------------------------------

.props
|0E9E90| db $3B ; King
|0E9E91| db $31 ; Zelda
|0E9E92| db $3D ; Maiden 3
|0E9E93| db $3F ; Maiden 4
|0E9E94| db $39 ; Maiden 2
|0E9E95| db $3B ; Maiden 5
|0E9E96| db $37 ; Maiden 1
|0E9E97| db $3D ; Maiden 6
|0E9E98| db $39 ; Guard 1
|0E9E99| db $37 ; Guard 2
|0E9E9A| db $37 ; Guard 3
|0E9E9B| db $39 ; Guard 4

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Castle:
|0E9E9C| PHX

|0E9E9D| LDX.b #$0B

.next_royalty
|0E9E9F| LDA.w .props,X
|0E9EA2| STA.w $0F50,X

|0E9EA5| LDA.w .group_size,X
|0E9EA8| LDY.w .pointer_offset,X
|0E9EAB| JSR Epilogue_SpriteDraw_Single

|0E9EAE| DEX
|0E9EAF| CPX.b #$07
|0E9EB1| BNE .next_royalty

;---------------------------------------------------------------------------------------------------

.next_maiden
|0E9EB3| LDA.b $1A
|0E9EB5| ASL A
|0E9EB6| ASL A
|0E9EB7| AND.b #$40
|0E9EB9| ORA.w .props,X
|0E9EBC| STA.w $0F50,X

|0E9EBF| LDA.w .group_size,X
|0E9EC2| LDY.w .pointer_offset,X
|0E9EC5| JSR Epilogue_SpriteDraw_Single

|0E9EC8| DEX
|0E9EC9| CPX.b #$01
|0E9ECB| BNE .next_maiden

;---------------------------------------------------------------------------------------------------

.next_guard
|0E9ECD| LDA.w .props,X
|0E9ED0| STA.w $0F50,X

|0E9ED3| LDA.w .group_size,X
|0E9ED6| LDY.w .pointer_offset,X
|0E9ED9| JSR Epilogue_SpriteDraw_Single

|0E9EDC| DEX
|0E9EDD| BPL .next_guard

;---------------------------------------------------------------------------------------------------

|0E9EDF| PLX

|0E9EE0| RTS

;===================================================================================================

EpilogueOAMGroup_Bully:
|0E9EE1| dw   0, -10 : db $4C, $08, $00, $02
|0E9EE9| dw   0,   0 : db $6C, $0A, $00, $02
|0E9EF1| dw   0,  -9 : db $4C, $08, $00, $02
|0E9EF9| dw   0,   0 : db $A8, $0A, $00, $02

;===================================================================================================

EpilogueOAMGroup_Victim:
|0E9F01| dw   0,  -7 : db $4A, $08, $00, $02
|0E9F09| dw   0,   0 : db $6A, $0C, $00, $02
|0E9F11| dw   0,  -7 : db $4A, $08, $00, $02
|0E9F19| dw   0,   0 : db $A6, $0C, $00, $02

;===================================================================================================

EpilogueOAMGroup_HeraPortal:
|0E9F21| dw   0,   0 : db $86, $00, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Hera

.group_data_index
|0E9F29| db $30 ; bully
|0E9F2A| db $32 ; victim

.object_count
|0E9F2B| db $02 ; bully
|0E9F2C| db $02 ; victim

;---------------------------------------------------------------------------------------------------

.movement_control
|0E9F2D| db $20, $00, $00, $00

;---------------------------------------------------------------------------------------------------

.speed_x
|0E9F31| db   0, -12

.speed_y
|0E9F33| db -16, -12,   0,  12
|0E9F37| db  16,  12,   0, -12

;---------------------------------------------------------------------------------------------------

.timer
|0E9F3B| db  59,  20,  30,  29
|0E9F3F| db  44,  43,  66,  32
|0E9F43| db  39,  40

|0E9F45| db  46,  56,  58,  76,  50,  68 ; This seems to be the only part of the data that's used.

|0E9F4B| db  46,  47,  30,  40,  71,  53,  50,  48

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Hera:
|0E9F53| PHX

|0E9F54| LDX.b #$02

|0E9F56| LDA.b #$35
|0E9F58| STA.w $0F50,X

|0E9F5B| LDA.b #$01
|0E9F5D| LDY.b #$3C
|0E9F5F| JSR Epilogue_SpriteDraw_Single

|0E9F62| DEX

;---------------------------------------------------------------------------------------------------

.next_friend
|0E9F63| LDA.w $0D50,X
|0E9F66| DEC A
|0E9F67| LSR A

|0E9F68| AND.b #$40
|0E9F6A| EOR.b #$71
|0E9F6C| STA.w $0F50,X

|0E9F6F| LDA.b $1A
|0E9F71| LSR A
|0E9F72| LSR A
|0E9F73| LSR A
|0E9F74| AND.b #$01
|0E9F76| STA.w $0DC0,X

|0E9F79| TXA
|0E9F7A| ASL A
|0E9F7B| TAY

;---------------------------------------------------------------------------------------------------

|0E9F7C| REP #$20

|0E9F7E| LDA.b $C8
|0E9F80| CMP.w .movement_control,Y

|0E9F83| SEP #$20
|0E9F85| BCC .dont_turn

|0E9F87| LDA.w $0DF0,X
|0E9F8A| BNE .dont_turn

|0E9F8C| LDY.w $0D90,X

|0E9F8F| LDA.w .timer,Y
|0E9F92| PHA

|0E9F93| AND.b #$F8
|0E9F95| STA.w $0DF0,X

|0E9F98| PLA
|0E9F99| AND.b #$07
|0E9F9B| TAY

|0E9F9C| LDA.w .speed_y,Y
|0E9F9F| STA.w $0D40,X

|0E9FA2| LDA.w .speed_x,Y
|0E9FA5| STA.w $0D50,X

|0E9FA8| INC.w $0D90,X

.dont_turn
|0E9FAB| LDA.w .object_count,X
|0E9FAE| LDY.w .group_data_index,X
|0E9FB1| JSR Epilogue_SpriteDraw_Single
|0E9FB4| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

|0E9FB7| JSL MoveSpriteXY_bank1D_long

|0E9FBB| DEX
|0E9FBC| BPL .next_friend

;---------------------------------------------------------------------------------------------------

|0E9FBE| PLX

|0E9FBF| RTS

;===================================================================================================

EpilogueOAMGroup_Sahasrahla:
|0E9FC0| dw  -4,   1 : db $68, $0C, $00, $00
|0E9FC8| dw   0,  -8 : db $40, $0C, $00, $02
|0E9FD0| dw   0,   1 : db $42, $0C, $00, $02
|0E9FD8| dw  -4,   1 : db $78, $0C, $00, $00
|0E9FE0| dw   0,  -8 : db $40, $0C, $00, $02
|0E9FE8| dw   0,   1 : db $42, $0C, $00, $02

;===================================================================================================

EpilogueOAMGroup_MrsSahasrahla:
|0E9FF0| dw   8,   5 : db $79, $06, $00, $00
|0E9FF8| dw   0, -10 : db $8E, $08, $00, $02
|0EA000| dw   0,   0 : db $6E, $06, $00, $02
|0EA008| dw   0, -10 : db $8E, $08, $00, $02
|0EA010| dw   0, -10 : db $8E, $08, $00, $02
|0EA018| dw   0,   0 : db $6E, $06, $00, $02

;===================================================================================================

EpilogueOAMGroup_LittleKakBoy:
|0EA020| dw   0,   0 : db $82, $08, $00, $02
|0EA028| dw   0,   7 : db $4E, $0A, $00, $02
|0EA030| dw   0,   0 : db $80, $48, $00, $02
|0EA038| dw   0,   7 : db $4E, $0A, $00, $02
|0EA040| dw   0,   0 : db $82, $08, $00, $02
|0EA048| dw   0,   7 : db $4E, $0A, $00, $02
|0EA050| dw   0,   0 : db $80, $08, $00, $02
|0EA058| dw   0,   7 : db $4E, $0A, $00, $02

;===================================================================================================

EpilogueOAMGroup_FightingBros:
|0EA060| dw  11,  -3 : db $69, $08, $00, $00
|0EA068| dw   0, -12 : db $04, $08, $00, $02
|0EA070| dw   0,   0 : db $60, $08, $00, $02
|0EA078| dw  10,  -3 : db $67, $08, $00, $00
|0EA080| dw   0, -12 : db $04, $08, $00, $02
|0EA088| dw   0,   0 : db $60, $08, $00, $02

;===================================================================================================

EpilogueOAMGroup_YoungSnitch:
|0EA090| dw  -2,   1 : db $68, $08, $00, $00
|0EA098| dw   0,  -8 : db $C0, $08, $00, $02
|0EA0A0| dw   0,   0 : db $C2, $08, $00, $02
|0EA0A8| dw  -3,   1 : db $78, $08, $00, $00
|0EA0B0| dw   0,  -8 : db $C0, $08, $00, $02
|0EA0B8| dw   0,   0 : db $C2, $08, $00, $02

;===================================================================================================

EpilogueOAMGroup_SwagDuck:
|0EA0C0| dw   0,   0 : db $0E, $00, $00, $02
|0EA0C8| dw   0,  64 : db $6C, $00, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Kakariko1

.kid_head_shake_timer
|0EA0D0| db  48,  16

;---------------------------------------------------------------------------------------------------

.group_pointer_index
|0EA0D2| db $28 ; Sahasrahla
|0EA0D3| db $2A ; Mrs. Sahasrahla
|0EA0D4| db $2C ; Angry Bro left
|0EA0D5| db $2E ; Young Snitch
|0EA0D6| db $2C ; Angry Bro right

.object_count
|0EA0D7| db $03 ; Sahasrahla
|0EA0D8| db $03 ; Mrs. Sahasrahla
|0EA0D9| db $03 ; Angry Bro left
|0EA0DA| db $03 ; Young Snitch
|0EA0DB| db $03 ; Angry Bro right
|0EA0DC| db $02 ; unused
|0EA0DD| db $02 ; unused

;---------------------------------------------------------------------------------------------------

.duck_flap
|0EA0DE| db $20, $40

.duck_flip
|0EA0E0| db $10, $F0

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Kakariko1:
|0EA0E2| PHX

|0EA0E3| LDX.b #$06

|0EA0E5| LDA.l $00001A
|0EA0E9| LSR A
|0EA0EA| LSR A
|0EA0EB| AND.b #$01
|0EA0ED| TAY

|0EA0EE| LDA.w .duck_flap,Y
|0EA0F1| STA.w $0AF4

;---------------------------------------------------------------------------------------------------

|0EA0F4| LDA.w $0D50,X
|0EA0F7| ROL A
|0EA0F8| ROL A
|0EA0F9| AND.b #$01
|0EA0FB| TAY

|0EA0FC| LDA.w $0D50,X
|0EA0FF| CLC
|0EA100| ADC.w .duck_flip,Y

|0EA103| LSR A
|0EA104| AND.b #$40
|0EA106| ORA.b #$32
|0EA108| STA.w $0F50,X

|0EA10B| LDA.b #$02
|0EA10D| LDY.b #$24
|0EA10F| JSR Epilogue_SpriteDraw_Single
|0EA112| JSR Epilogue_SpriteDraw_CirclingBirds

|0EA115| DEX

;---------------------------------------------------------------------------------------------------

|0EA116| LDA.b #$31
|0EA118| STA.w $0F50,X

|0EA11B| LDA.w $0DF0,X
|0EA11E| BNE .delay_head_shake

|0EA120| LDA.w $0D90,X
|0EA123| TAY
|0EA124| EOR.b #$01
|0EA126| STA.w $0D90,X

|0EA129| LDA.w .kid_head_shake_timer,Y
|0EA12C| STA.w $0DF0,X

|0EA12F| LDA.w $0DC0,X
|0EA132| INC A
|0EA133| AND.b #$03
|0EA135| STA.w $0DC0,X

.delay_head_shake
|0EA138| LDY.b #$26
|0EA13A| LDA.b #$02
|0EA13C| JSR Epilogue_SpriteDraw_Single

|0EA13F| DEX

;---------------------------------------------------------------------------------------------------

.next_waving_sprite
|0EA140| LDA.b $1A
|0EA142| AND.b #$0F
|0EA144| BNE .dont_flip_wave

|0EA146| LDA.w $0DC0,X
|0EA149| EOR.b #$01
|0EA14B| STA.w $0DC0,X

.dont_flip_wave
|0EA14E| LDA.b #$31
|0EA150| STA.w $0F50,X

|0EA153| LDY.w .group_pointer_index,X
|0EA156| LDA.w .object_count,X
|0EA159| JSR Epilogue_SpriteDraw_Single
|0EA15C| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

|0EA15F| DEX
|0EA160| BPL .next_waving_sprite

;---------------------------------------------------------------------------------------------------

|0EA162| PLX

|0EA163| RTS

;===================================================================================================

EpilogueOAMGroup_Uncle:
|0EA164| dw  10,   8 : db $32, $8A, $00, $00
|0EA16C| dw  10,  16 : db $22, $8A, $00, $00
|0EA174| dw   0, -10 : db $00, $08, $00, $02
|0EA17C| dw   0,   0 : db $2C, $08, $00, $02
|0EA184| dw  10, -14 : db $22, $0A, $00, $00
|0EA18C| dw  10,  -6 : db $32, $0A, $00, $00

;===================================================================================================

EpilogueOAMGroup_LinkBrandishing:
|0EA194| dw   0, -10 : db $2A, $08, $00, $02
|0EA19C| dw   0,   0 : db $28, $08, $00, $02

;===================================================================================================

EpilogueOAMGroup_LinkAtHouse:
|0EA1A4| dw  10,  16 : db $05, $8A, $00, $00
|0EA1AC| dw  10,   8 : db $15, $8A, $00, $00
|0EA1B4| dw  -4,   2 : db $07, $0A, $00, $02
|0EA1BC| dw   0,  -7 : db $00, $0E, $00, $02
|0EA1C4| dw   0,   1 : db $02, $0E, $00, $02
|0EA1CC| dw  10, -20 : db $05, $0A, $00, $00
|0EA1D4| dw  10, -12 : db $15, $0A, $00, $00
|0EA1DC| dw  -7,   1 : db $07, $4A, $00, $02
|0EA1E4| dw   0,  -7 : db $00, $0E, $00, $02
|0EA1EC| dw   0,   1 : db $02, $0E, $00, $02

;===================================================================================================

EpilogueOAMGroup_PedestalLink:
|0EA1F4| dw   0,  -7 : db $00, $0E, $00, $02
|0EA1FC| dw   0,   1 : db $02, $4E, $00, $02
|0EA204| dw   0,  -8 : db $00, $0E, $00, $02
|0EA20C| dw   0,   1 : db $02, $0E, $00, $02
|0EA214| dw   0,  -9 : db $00, $0E, $00, $02
|0EA21C| dw   0,   1 : db $02, $0E, $00, $02
|0EA224| dw   0,  -7 : db $00, $0E, $00, $02
|0EA22C| dw   0,   1 : db $02, $0E, $00, $02
|0EA234| dw   0,  -7 : db $00, $0E, $00, $02
|0EA23C| dw   0,   1 : db $02, $4E, $00, $02
|0EA244| dw   0,  -8 : db $00, $0E, $00, $02
|0EA24C| dw   0,   1 : db $02, $4E, $00, $02
|0EA254| dw   0,  -9 : db $00, $0E, $00, $02
|0EA25C| dw   0,   1 : db $02, $4E, $00, $02
|0EA264| dw   0,  -7 : db $00, $0E, $00, $02
|0EA26C| dw   0,   1 : db $02, $4E, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_House

.link_gfx
|0EA274| db $00 ; Link standing
|0EA275| db $04 ; Link brandishing

.link_pose
|0EA276| dw $000A ; Link standing
|0EA278| dw $0224 ; Link brandishing

.group_data_index
|0EA27A| db $0A ; Link standing
|0EA27B| db $0E ; Link brandishing

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_House:
|0EA27C| PHX

|0EA27D| REP #$20

|0EA27F| LDA.b $C8
|0EA281| CMP.w #$0200
|0EA284| BNE .not_slash_sfx

|0EA286| LDY.b #$01 ; SFX2.01
|0EA288| BRA .set_sfx

.not_slash_sfx
|0EA28A| CMP.w #$0208
|0EA28D| BNE .no_sfx_at_all

|0EA28F| LDY.b #$2C ; SFX2.2C

.set_sfx
|0EA291| STY.w $012E

;---------------------------------------------------------------------------------------------------

.no_sfx_at_all
|0EA294| SEC
|0EA295| SBC.w #$0208
|0EA298| CMP.w #$0030

|0EA29B| SEP #$20
|0EA29D| BCS .delay_sparkle

|0EA29F| LDY.b #$02
|0EA2A1| JSR Epilogue_SpriteDraw_AddSparkle

.delay_sparkle
|0EA2A4| LDX.b #$03

|0EA2A6| REP #$20

|0EA2A8| LDA.b $C8
|0EA2AA| CMP.w #$0200

|0EA2AD| SEP #$20
|0EA2AF| BCC .delay_brandish

|0EA2B1| LDA.b #$01
|0EA2B3| STA.w $0DC0,X

.delay_brandish
|0EA2B6| LDA.b #$31
|0EA2B8| STA.w $0F50,X

|0EA2BB| LDA.b #$04
|0EA2BD| LDY.b #$08
|0EA2BF| JSR Epilogue_SpriteDraw_Single
|0EA2C2| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

;---------------------------------------------------------------------------------------------------

|0EA2C5| LDA.w $0DC0,X
|0EA2C8| DEX
|0EA2C9| STA.w $0DC0,X

|0EA2CC| TAY

|0EA2CD| STZ.w $0107

|0EA2D0| LDA.w .link_gfx,Y
|0EA2D3| STA.w $0108

|0EA2D6| LDA.b #$30
|0EA2D8| STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

|0EA2DB| PHY

|0EA2DC| TYA
|0EA2DD| ASL A
|0EA2DE| TAY

|0EA2DF| REP #$20

|0EA2E1| LDA.w .link_pose,Y
|0EA2E4| STA.w $0100

|0EA2E7| SEP #$20

|0EA2E9| PLY

|0EA2EA| LDA.w .group_data_index,Y
|0EA2ED| TAY

|0EA2EE| LDA.b #$05
|0EA2F0| JSR Epilogue_SpriteDraw_Single
|0EA2F3| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

|0EA2F6| PLX

|0EA2F7| RTS

;===================================================================================================

EpilogueOAMGroup_OldMan:
|0EA2F8| dw -18, -24 : db $A4, $39, $00, $02
|0EA300| dw -16, -16 : db $A8, $39, $00, $02
|0EA308| dw -18, -24 : db $A4, $39, $00, $02
|0EA310| dw -18, -24 : db $A4, $39, $00, $02
|0EA318| dw -16, -16 : db $A6, $39, $00, $02
|0EA320| dw -18, -24 : db $A4, $39, $00, $02
|0EA328| dw  -6, -17 : db $2D, $39, $00, $00
|0EA330| dw -16, -24 : db $A0, $39, $00, $02
|0EA338| dw -16, -16 : db $AA, $39, $00, $02
|0EA340| dw  -5, -17 : db $2C, $39, $00, $00
|0EA348| dw -16, -24 : db $A0, $39, $00, $02
|0EA350| dw -16, -16 : db $AA, $39, $00, $02

;===================================================================================================

Epilogue_SpriteDraw_DeathMountain:
|0EA358| PHX

|0EA359| LDX.b #$00

|0EA35B| REP #$20

|0EA35D| LDA.b $C8
|0EA35F| CMP.w #$0200

|0EA362| SEP #$20
|0EA364| BNE .dont_move_yet

|0EA366| LDA.b #$FC
|0EA368| STA.w $0D50,X

.dont_move_yet
|0EA36B| LDA.b $1A
|0EA36D| AND.b #$10
|0EA36F| LSR A
|0EA370| LSR A
|0EA371| LSR A
|0EA372| LSR A
|0EA373| STA.w $0DC0,X

|0EA376| LDA.w $0D10,X
|0EA379| CMP.b #$38
|0EA37B| BNE .not_at_max

|0EA37D| STZ.w $0D50,X

|0EA380| INC.w $0DC0,X
|0EA383| INC.w $0DC0,X

.not_at_max
|0EA386| LDA.b #$03
|0EA388| LDY.b #$34
|0EA38A| JSR Epilogue_SpriteDraw_Single

|0EA38D| JSL MoveSpriteXY_bank1D_long

|0EA391| PLX
|0EA392| RTS

;===================================================================================================

Epilogue_SpriteDraw_Lumberjacks:
|0EA393| PHX

|0EA394| LDX.b #$00

|0EA396| LDA.b #$2C ; SPRITE 2C
|0EA398| STA.w $0E20,X

|0EA39B| LDA.b #$2C
|0EA39D| JSL AllocateOAMInRegionA

|0EA3A1| LDA.b #$3B
|0EA3A3| STA.w $0F50,X

|0EA3A6| JSL Get16BitSpriteCoords_long

|0EA3AA| LDA.b #$02

;---------------------------------------------------------------------------------------------------

|0EA3AC| REP #$10

|0EA3AE| LDY.b $C8
|0EA3B0| CPY.w #$01C0

|0EA3B3| SEP #$10
|0EA3B5| BCS .not_facing_camera

|0EA3B7| TYA
|0EA3B8| AND.b #$20
|0EA3BA| ASL A
|0EA3BB| ASL A
|0EA3BC| ASL A
|0EA3BD| ROL A

.not_facing_camera
|0EA3BE| STA.w $0DC0,X

|0EA3C1| JSL SpriteModule_Active_long

|0EA3C5| PLX

|0EA3C6| RTS

;===================================================================================================

Epilogue_SpriteDraw_Venus:
|0EA3C7| PHX

|0EA3C8| LDX.b #$05
|0EA3CA| JSL Get16BitSpriteCoords_long

|0EA3CE| LDA.w $0F00,X
|0EA3D1| BNE .skip_sparkles

;---------------------------------------------------------------------------------------------------

|0EA3D3| JSL GetRandomNumber
|0EA3D7| AND.b #$07
|0EA3D9| TAX

|0EA3DA| LDA.l FairyPond_offset_x,X
|0EA3DE| CLC
|0EA3DF| ADC.w $0FD8
|0EA3E2| PHA

|0EA3E3| JSL GetRandomNumber
|0EA3E7| AND.b #$07
|0EA3E9| TAX

|0EA3EA| LDA.l FairyPond_offset_y,X
|0EA3EE| CLC
|0EA3EF| ADC.w $0FDA

|0EA3F2| PLX

|0EA3F3| LDY.b #$03
|0EA3F5| JSR Epilogue_SpriteDraw_AddSparkle

;---------------------------------------------------------------------------------------------------

.skip_sparkles
|0EA3F8| LDX.b #$03

.next_fairy
|0EA3FA| LDA.w $0E00,X
|0EA3FD| BEQ .fairy_delay

|0EA3FF| DEC.w $0E00,X

.fairy_delay
|0EA402| LDA.b #$E3 ; SPRITE E3
|0EA404| STA.w $0E20,X

|0EA407| LDA.b #$01
|0EA409| JSR Epilogue_SpriteDraw_SetShadowProp
|0EA40C| JSR Epilogue_SpriteDraw_ActivateAndRunSprite_allocate8

|0EA40F| INX
|0EA410| CPX.b #$05
|0EA412| BNE .next_fairy

;---------------------------------------------------------------------------------------------------

|0EA414| LDA.b #$72 ; SPRITE 72
|0EA416| STA.w $0E20,X

|0EA419| LDA.b #$3B
|0EA41B| STA.w $0F50,X

|0EA41E| LDA.b #$09
|0EA420| STA.w $0DD0,X
|0EA423| STA.w $0DA0,X

|0EA426| LDA.b #$30
|0EA428| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

|0EA42B| PLX

|0EA42C| RTS

;===================================================================================================

EpilogueOAMGroup_RunningKid:
|0EA42D| dw   0,  -8 : db $2A, $07, $00, $02
|0EA435| dw   0,  -8 : db $2A, $07, $00, $02
|0EA43D| dw   0,   0 : db $CA, $4F, $00, $02
|0EA445| dw   0,  -8 : db $2A, $07, $00, $02
|0EA44D| dw   0,  -8 : db $2A, $07, $00, $02
|0EA455| dw   0,   0 : db $CA, $0F, $00, $02
|0EA45D| dw  -2,   0 : db $77, $0F, $00, $00
|0EA465| dw   0,  -8 : db $2A, $07, $00, $02
|0EA46D| dw   0,   0 : db $CA, $4F, $00, $02
|0EA475| dw  -3,   0 : db $66, $0F, $00, $00
|0EA47D| dw   0,  -8 : db $2A, $07, $00, $02
|0EA485| dw   0,   0 : db $CA, $4F, $00, $02

;===================================================================================================

EpilogueOAMGroup_SickKid:
|0EA48D| dw  14,  -7 : db $48, $0D, $00, $02
|0EA495| dw   0,  -6 : db $44, $09, $00, $02
|0EA49D| dw   0,   0 : db $4E, $09, $00, $02
|0EA4A5| dw  13, -14 : db $48, $0D, $00, $02
|0EA4AD| dw   0,  -8 : db $44, $09, $00, $02
|0EA4B5| dw   0,   0 : db $46, $09, $00, $02

;===================================================================================================

EpilogueOAMGroup_SickParents:
|0EA4BD| dw  -2, -16 : db $78, $3D, $00, $00
|0EA4C5| dw   0, -24 : db $24, $3D, $00, $02
|0EA4CD| dw   0, -16 : db $C2, $3D, $00, $02
|0EA4D5| dw  61, -16 : db $77, $37, $00, $00
|0EA4DD| dw  64, -24 : db $C4, $37, $00, $02
|0EA4E5| dw  64, -16 : db $CA, $77, $00, $02
|0EA4ED| dw   0,  -6 : db $6C, $32, $00, $02
|0EA4F5| dw  64,  -6 : db $6C, $32, $00, $02
|0EA4FD| dw  -2, -16 : db $68, $3D, $00, $00
|0EA505| dw   0, -24 : db $24, $3D, $00, $02
|0EA50D| dw   0, -16 : db $C2, $3D, $00, $02
|0EA515| dw  61, -16 : db $66, $37, $00, $00
|0EA51D| dw  64, -24 : db $C4, $37, $00, $02
|0EA525| dw  64, -16 : db $CA, $77, $00, $02
|0EA52D| dw   0,  -6 : db $6C, $32, $00, $02
|0EA535| dw  64,  -6 : db $6C, $32, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Kakariko2

.object_count
|0EA53D| db $03
|0EA53E| db $03
|0EA53F| db $08

.sick_kid_height
|0EA540| db $02, $04, $05, $06, $06, $07, $07, $07
|0EA548| db $07, $06, $06, $05, $04, $02, $00

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Kakariko2:
|0EA54F| PHX

|0EA550| LDX.b #$06

|0EA552| LDA.b $1A
|0EA554| AND.b #$01
|0EA556| STA.w $0DC0,X
|0EA559| BNE .dont_move_bee

|0EA55B| LDA.b #$01

|0EA55D| LDY.w $0D10,X
|0EA560| CPY.b #$80
|0EA562| BMI .move_right

|0EA564| LDA.b #$FF

.move_right
|0EA566| CLC
|0EA567| ADC.w $0D50,X
|0EA56A| STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

|0EA56D| LDA.b #$01

|0EA56F| LDY.w $0D00,X
|0EA572| CPY.b #$B0
|0EA574| BMI .move_down

|0EA576| LDA.b #$FF

.move_down
|0EA578| CLC
|0EA579| ADC.w $0D40,X
|0EA57C| STA.w $0D40,X

|0EA57F| JSL MoveSpriteXY_bank1D_long

;---------------------------------------------------------------------------------------------------

.dont_move_bee
|0EA583| LDA.w $0D50,X
|0EA586| LSR A
|0EA587| AND.b #$40
|0EA589| EOR.b #$7E
|0EA58B| STA.w $0F50,X

|0EA58E| LDA.b #$01
|0EA590| STA.w $0E40,X

|0EA593| LDA.b #$30
|0EA595| STA.w $0E60,X

|0EA598| LDA.b #$10
|0EA59A| STA.w $0F70,X

|0EA59D| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw_eight

|0EA5A0| DEX

|0EA5A1| LDA.b #$37
|0EA5A3| STA.w $0F50,X

|0EA5A6| LDA.b #$02
|0EA5A8| JSR Epilogue_SpriteDraw_SetShadowProp

;---------------------------------------------------------------------------------------------------

|0EA5AB| LDA.b #$0C
|0EA5AD| JSR Epilogue_SpriteDraw_ActivateAndRunSprite

|0EA5B0| DEX

|0EA5B1| JSR Epilogue_SpriteDraw_ActivateAndRunSprite_allocate8

|0EA5B4| DEX

|0EA5B5| JSR Epilogue_SpriteDraw_ActivateAndRunSprite_allocate8

|0EA5B8| DEX

;---------------------------------------------------------------------------------------------------

.next
|0EA5B9| TXA
|0EA5BA| ASL A
|0EA5BB| TAY

|0EA5BC| LDA.w .object_count,X
|0EA5BF| JSR Epilogue_SpriteDraw_Single

|0EA5C2| TXA
|0EA5C3| BNE .not_running_kid_wave

|0EA5C5| JSR Epilogue_SpriteDraw_AnimateRunningKidAndLocksmith

|0EA5C8| BRA .to_next

;---------------------------------------------------------------------------------------------------

.not_running_kid_wave
|0EA5CA| LSR A
|0EA5CB| BEQ .skip_parents_waving

|0EA5CD| LDA.b $1A
|0EA5CF| LSR A
|0EA5D0| LSR A
|0EA5D1| LSR A
|0EA5D2| AND.b #$01
|0EA5D4| STA.w $0DC0,X

|0EA5D7| BRA .to_next

;---------------------------------------------------------------------------------------------------

.skip_parents_waving
|0EA5D9| LDY.b #$00

|0EA5DB| LDA.b $1A
|0EA5DD| AND.b #$1F
|0EA5DF| CMP.b #$0F
|0EA5E1| BCS .dont_adjust_jump

|0EA5E3| TAY

|0EA5E4| LDA.w .sick_kid_height,Y
|0EA5E7| STA.w $0F70,X

|0EA5EA| LDY.b #$01

.dont_adjust_jump
|0EA5EC| TYA
|0EA5ED| STA.w $0DC0,X

|0EA5F0| JSR Epilogue_SpriteDraw_DrawShadow.high_prioritize

;---------------------------------------------------------------------------------------------------

.to_next
|0EA5F3| DEX
|0EA5F4| BPL .next

;---------------------------------------------------------------------------------------------------

|0EA5F6| PLX

|0EA5F7| RTS

;===================================================================================================

Epilogue_SpriteDraw_DrawShadow:
.high_prioritize
|0EA5F8| LDA.b #$30

;===================================================================================================

.parameterized_priority
|0EA5FA| STA.w $0F50,X

;===================================================================================================

.priority_set
|0EA5FD| LDA.b #$00
|0EA5FF| JSR Epilogue_SpriteDraw_SetShadowProp

|0EA602| LDA.b #$04
|0EA604| JSL AllocateOAMInRegionA
|0EA608| JSL DrawSpriteShadow_long

|0EA60C| RTS

;===================================================================================================

pool Epilogue_SpriteDraw_AnimateLostWoodsThief

.timer
|0EA60D| db $0A, $0A, $0A, $0A, $14, $08, $08, $00
|0EA615| db $FF, $0C, $0C, $0C, $0C, $0C, $0C, $1E
|0EA61D| db $08, $04, $04, $04, $00, $00, $FF, $FF
|0EA625| db $90, $04, $00

.pose
|0EA628| db $00, $01, $00, $01, $00, $02, $03, $00
|0EA630| db $02, $00, $01, $00, $01, $00, $01, $02
|0EA638| db $03, $04, $05, $06, $03, $00, $FF, $FF
|0EA640| db $FF, $02, $03

endpool

;===================================================================================================

Epilogue_SpriteDraw_AnimateRunningKidAndLocksmith:
|0EA643| LDA.b #$30

;===================================================================================================

Epilogue_SpriteDraw_AnimateLostWoodsThief:
|0EA645| JSR Epilogue_SpriteDraw_DrawShadow.parameterized_priority

|0EA648| LDY.w $0D90,X

|0EA64B| LDA.w $0DF0,X
|0EA64E| BNE .delay

|0EA650| INY
|0EA651| CPY.b #$08
|0EA653| BNE .dont_step_back_to_06

|0EA655| LDY.b #$06

.dont_step_back_to_06
|0EA657| CPY.b #$16
|0EA659| BNE .dont_step_back_to_15

|0EA65B| LDY.b #$15

.dont_step_back_to_15
|0EA65D| CPY.b #$1C
|0EA65F| BNE .dont_step_back_to_1B

|0EA661| LDY.b #$1B

.dont_step_back_to_1B
|0EA663| TYA
|0EA664| STA.w $0D90,X

|0EA667| LDA.w .timer-1,Y
|0EA66A| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.delay
|0EA66D| LDA.w .pose-1,Y
|0EA670| BPL .not_frame_based

|0EA672| LDA.b $1A
|0EA674| AND.b #$08
|0EA676| LSR A
|0EA677| LSR A
|0EA678| LSR A

.not_frame_based
|0EA679| STA.w $0DC0,X

|0EA67C| CPY.b #$05
|0EA67E| BCC .frame_rule_y_coord

|0EA680| CPY.b #$0A
|0EA682| BCC .exit

|0EA684| CPY.b #$0F
|0EA686| BCS .exit

.frame_rule_y_coord
|0EA688| LDA.b $1A
|0EA68A| AND.b #$01
|0EA68C| BNE .exit

|0EA68E| INC.w $0D00,X

.exit
|0EA691| RTS

;===================================================================================================

Epilogue_SpriteDraw_ActivateAndRunSprite_allocate8:
|0EA692| LDA.b #$08

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_ActivateAndRunSprite:
|0EA694| STX.w $0FA0

|0EA697| JSL AllocateOAMInRegionA
|0EA69B| JSL Get16BitSpriteCoords_long

|0EA69F| LDA.b $11
|0EA6A1| PHA

|0EA6A2| STZ.b $11

|0EA6A4| LDA.b #$09
|0EA6A6| STA.w $0DD0,X

|0EA6A9| JSL SpriteModule_Active_long

|0EA6AD| PLA
|0EA6AE| STA.b $11

|0EA6B0| RTS

;===================================================================================================

Epilogue_SpriteDraw_PreexistingSpriteDraw_eight:
|0EA6B1| LDA.b #$08

;===================================================================================================

Epilogue_SpriteDraw_PreexistingSpriteDraw:
|0EA6B3| JSL AllocateOAMInRegionA

|0EA6B7| STX.w $0FA0

|0EA6BA| JSL Get16BitSpriteCoords_long
|0EA6BE| JSL SpriteModule_Active_long

|0EA6C2| RTS

;===================================================================================================

pool Epilogue_SpriteDraw_Single

.group_pointers
|0EA6C3| dw EpilogueOAMGroup_RunningKid
|0EA6C5| dw EpilogueOAMGroup_SickKid
|0EA6C7| dw EpilogueOAMGroup_SickParents
|0EA6C9| dw EpilogueOAMGroup_SmithyBowing
|0EA6CB| dw EpilogueOAMGroup_Uncle
|0EA6CD| dw EpilogueOAMGroup_LinkAtHouse
|0EA6CF| dw EpilogueOAMGroup_Priest
|0EA6D1| dw EpilogueOAMGroup_LinkBrandishing
|0EA6D3| dw EpilogueOAMGroup_Quaver
|0EA6D5| dw EpilogueOAMGroup_FluteDad
|0EA6D7| dw EpilogueOAMGroup_PedestalSquirrel
|0EA6D9| dw EpilogueOAMGroup_Guard
|0EA6DB| dw EpilogueOAMGroup_WoodsThief
|0EA6DD| dw EpilogueOAMGroup_PedestalLink
|0EA6DF| dw EpilogueOAMGroup_SwordSparkle-8
|0EA6E1| dw EpilogueOAMGroup_King
|0EA6E3| dw EpilogueOAMGroup_Zelda
|0EA6E5| dw EpilogueOAMGroup_Maiden
|0EA6E7| dw EpilogueOAMGroup_SwagDuck
|0EA6E9| dw EpilogueOAMGroup_LittleKakBoy
|0EA6EB| dw EpilogueOAMGroup_Sahasrahla
|0EA6ED| dw EpilogueOAMGroup_MrsSahasrahla
|0EA6EF| dw EpilogueOAMGroup_FightingBros
|0EA6F1| dw EpilogueOAMGroup_YoungSnitch
|0EA6F3| dw EpilogueOAMGroup_Bully
|0EA6F5| dw EpilogueOAMGroup_Victim
|0EA6F7| dw EpilogueOAMGroup_OldMan
|0EA6F9| dw EpilogueOAMGroup_SmithSpark
|0EA6FB| dw EpilogueOAMGroup_DesertThief
|0EA6FD| dw EpilogueOAMGroup_DesertChests
|0EA6FF| dw EpilogueOAMGroup_HeraPortal
|0EA701| dw EpilogueOAMGroup_SmithHammer

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Single:
|0EA703| PHA
|0EA704| PHY
|0EA705| PHA

|0EA706| ASL A
|0EA707| ASL A

|0EA708| JSL AllocateOAMInRegionA
|0EA70C| JSL Get16BitSpriteCoords_long

|0EA710| PLA
|0EA711| STA.w WRMPYA

|0EA714| LDA.b #$08
|0EA716| STA.w WRMPYB

|0EA719| NOP
|0EA71A| NOP
|0EA71B| NOP
|0EA71C| NOP

|0EA71D| LDA.w RDMPY
|0EA720| STA.w WRMPYA

|0EA723| LDA.w $0DC0,X
|0EA726| STA.w WRMPYB

|0EA729| REP #$20

|0EA72B| PLY
|0EA72C| LDA.w .group_pointers,Y

|0EA72F| CLC
|0EA730| ADC.w RDMPY
|0EA733| STA.b $08

|0EA735| SEP #$20

|0EA737| PLA
|0EA738| JSL TabulatedSpriteDraw

|0EA73C| RTS

;===================================================================================================

pool Epilogue_SpriteDraw_Zora

.sprite_id
|0EA73D| db $52 ; King Zora - SPRITE 52
|0EA73E| db $55 ; Left zora - SPRITE 55
|0EA73F| db $55 ; Right zora - SPRITE 55

.object_allocation
|0EA740| db $20 ; King Zora
|0EA741| db $08 ; Left zora
|0EA742| db $08 ; Right zora

.sprite_ai
|0EA743| db $03 ; King Zora
|0EA744| db $01 ; Left zora
|0EA745| db $01 ; Right zora

.pose
|0EA746| db $00 ; King Zora
|0EA747| db $05 ; Left zora
|0EA748| db $05 ; Right zora

|0EA749| db $01 ; King Zora
|0EA74A| db $06 ; Left zora
|0EA74B| db $06 ; Right zora

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Zora:
|0EA74C| PHX

|0EA74D| TXA
|0EA74E| LSR A
|0EA74F| TAX

|0EA750| LDA.w Epilogue_SpriteData.sprite_count,X
|0EA753| TAX

;---------------------------------------------------------------------------------------------------

.next_sprite
|0EA754| STX.w $0FA0

|0EA757| LDA.w .sprite_id,X
|0EA75A| STA.w $0E20,X

|0EA75D| LDA.w .object_allocation,X
|0EA760| JSL AllocateOAMInRegionA

|0EA764| LDA.w .sprite_ai,X
|0EA767| STA.w $0D80,X

|0EA76A| TXY

|0EA76B| REP #$20

|0EA76D| LDA.b $C8
|0EA76F| CMP.w #$026F
|0EA772| BNE .skip_sfx

|0EA774| PHY

|0EA775| LDY.b #$21 ; SFX3.21
|0EA777| STY.w $012F

|0EA77A| PLY

.skip_sfx
|0EA77B| SEP #$20
|0EA77D| BCC .closed_mouth

|0EA77F| INY
|0EA780| INY
|0EA781| INY

.closed_mouth
|0EA782| LDA.w .pose,Y
|0EA785| STA.w $0DC0,X

|0EA788| LDA.b #$33
|0EA78A| STA.w $0F50,X

|0EA78D| JSL Get16BitSpriteCoords_long
|0EA791| JSL SpriteModule_Active_long

|0EA795| DEX
|0EA796| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0EA798| PLX

|0EA799| RTS

;===================================================================================================

EpilogueOAMGroup_SmithyBowing:
|0EA79A| dw   0,   0 : db $22, $00, $00, $02
|0EA7A2| dw  48,   0 : db $64, $00, $00, $02
|0EA7AA| dw   0,  10 : db $6C, $01, $00, $02
|0EA7B2| dw  48,  10 : db $6C, $01, $00, $02
|0EA7BA| dw   0,   0 : db $64, $00, $00, $02
|0EA7C2| dw  48,   0 : db $22, $00, $00, $02
|0EA7CA| dw   0,  10 : db $6C, $01, $00, $02
|0EA7D2| dw  48,  10 : db $6C, $01, $00, $02
|0EA7DA| dw   0,   0 : db $64, $00, $00, $02
|0EA7E2| dw  48,   0 : db $64, $00, $00, $02
|0EA7EA| dw   0,  10 : db $6C, $01, $00, $02
|0EA7F2| dw  48,  10 : db $6C, $01, $00, $02

;===================================================================================================

EpilogueOAMGroup_SmithHammer:
|0EA7FA| dw   0,   0 : db $60, $80, $00, $02

;===================================================================================================

Epilogue_SpriteDraw_Smithy:
|0EA802| PHX

|0EA803| LDX.b #$00

|0EA805| REP #$20

|0EA807| LDA.b $C8
|0EA809| CMP.w #$0170

|0EA80C| SEP #$20
|0EA80E| BCC .animate_smiths_hammering

;---------------------------------------------------------------------------------------------------

|0EA810| LDX.b #$04

.draw_next
|0EA812| LDA.b #$01
|0EA814| LDY.b #$3E
|0EA816| JSR Epilogue_SpriteDraw_Single

|0EA819| INX
|0EA81A| CPX.b #$06
|0EA81C| BNE .draw_next

;---------------------------------------------------------------------------------------------------

|0EA81E| LDX.b #$00

|0EA820| LDA.b #$39
|0EA822| STA.w $0F50,X

;---------------------------------------------------------------------------------------------------

|0EA825| REP #$20

|0EA827| LDA.b $C8
|0EA829| CMP.w #$01C0

|0EA82C| SEP #$20
|0EA82E| BCS .check_bow_timer

|0EA830| LDA.b #$02
|0EA832| BRA .set_bow_pose

.check_bow_timer
|0EA834| LDA.w $0DF0,X
|0EA837| BNE .delay_bow

|0EA839| LDA.b #$20
|0EA83B| STA.w $0DF0,X

|0EA83E| LDA.w $0DC0,X
|0EA841| EOR.b #$01
|0EA843| AND.b #$01

.set_bow_pose
|0EA845| STA.w $0DC0,X

;---------------------------------------------------------------------------------------------------

.delay_bow
|0EA848| LDA.b #$04
|0EA84A| LDY.b #$06
|0EA84C| JSR Epilogue_SpriteDraw_Single

|0EA84F| PLX

|0EA850| RTS

;---------------------------------------------------------------------------------------------------

.animate_smiths_hammering
|0EA851| LDA.b #$1A ; SPRITE 1A
|0EA853| STA.w $0E20,X

|0EA856| LDA.b #$39
|0EA858| STA.w $0F50,X

|0EA85B| LDA.b #$02
|0EA85D| JSR Epilogue_SpriteDraw_SetShadowProp

|0EA860| LDA.b $10
|0EA862| PHA

|0EA863| LDA.b #$0C
|0EA865| JSR Epilogue_SpriteDraw_ActivateAndRunSprite

|0EA868| PLA
|0EA869| STA.b $10

|0EA86B| LDA.w $0DA0,X
|0EA86E| CMP.b #$0F
|0EA870| BNE .dont_reset_timer

|0EA872| LDA.w $0D90,X
|0EA875| CMP.b #$04
|0EA877| BNE .dont_reset_timer

|0EA879| LDA.b #$0F
|0EA87B| STA.w $0DF2,X

.dont_reset_timer
|0EA87E| JSR Epilogue_SpriteDraw_DrawSmithSpark

|0EA881| INX
|0EA882| CPX.b #$02
|0EA884| BNE .animate_smiths_hammering

|0EA886| PLX

|0EA887| RTS

;===================================================================================================

EpilogueOAMGroup_SmithSpark:
|0EA888| dw   0,  -4 : db $AA, $30, $00, $02
|0EA890| dw   0,  -4 : db $AA, $30, $00, $02
|0EA898| dw  -4,  -8 : db $90, $30, $00, $00
|0EA8A0| dw  12,  -8 : db $90, $70, $00, $00
|0EA8A8| dw  -6, -10 : db $91, $30, $00, $00
|0EA8B0| dw  14, -10 : db $91, $70, $00, $00

;===================================================================================================

pool Epilogue_SpriteDraw_DrawSmithSpark

.anim_step
|0EA8B8| db $01, $01, $02, $02
|0EA8BC| db $01, $01, $01, $01
|0EA8C0| db $02, $02, $02, $02
|0EA8C4| db $00, $00, $00, $00

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_DrawSmithSpark:
|0EA8C8| PHX

|0EA8C9| INX
|0EA8CA| INX

|0EA8CB| LDA.w $0DF0,X
|0EA8CE| BEQ .no_draw

|0EA8D0| TAY

|0EA8D1| LDA.b #$02
|0EA8D3| STA.w $0F50,X

|0EA8D6| LDA.w .anim_step,Y
|0EA8D9| STA.w $0DC0,X

|0EA8DC| LDA.b #$02
|0EA8DE| LDY.b #$36
|0EA8E0| JSR Epilogue_SpriteDraw_Single

.no_draw
|0EA8E3| PLX

|0EA8E4| RTS

;===================================================================================================

EpilogueOAMGroup_DesertThief:
|0EA8E5| dw   0,   0 : db $22, $07, $00, $02
|0EA8ED| dw   0,  -8 : db $C2, $09, $00, $02
|0EA8F5| dw   0,   0 : db $22, $47, $00, $02
|0EA8FD| dw   0,  -8 : db $C2, $09, $00, $02
|0EA905| dw   0,  -9 : db $C4, $09, $00, $02
|0EA90D| dw   0,   0 : db $22, $07, $00, $02
|0EA915| dw   0,  -9 : db $24, $09, $00, $02
|0EA91D| dw   0,   0 : db $22, $07, $00, $02

;===================================================================================================

EpilogueOAMGroup_DesertChests:
|0EA925| dw -16, -12 : db $08, $3F, $00, $02
|0EA92D| dw   0, -12 : db $20, $3F, $00, $02
|0EA935| dw  16, -12 : db $20, $3F, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Desert

.vulture_pose
|0EA93D| db $01, $02, $03, $02

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Desert:
|0EA941| PHX

|0EA942| LDX.b #$00

.next_sprite
|0EA944| CPX.b #$02
|0EA946| BCS .is_chest

;---------------------------------------------------------------------------------------------------

.is_vulture
|0EA948| LDA.b #$01 ; SPRITE 01
|0EA94A| STA.w $0E20,X

|0EA94D| LDA.b #$0B
|0EA94F| STA.w $0F50,X

|0EA952| LDA.b #$02
|0EA954| JSR Epilogue_SpriteDraw_SetShadowProp

|0EA957| LDA.b #$30
|0EA959| STA.w $0F70,X

|0EA95C| LDA.b $1A
|0EA95E| CLC

.this
|0EA95F| ADC.w .this,X ; this is correct and dumb
|0EA962| LSR A
|0EA963| LSR A
|0EA964| AND.b #$03
|0EA966| TAY

|0EA967| LDA.w .vulture_pose,Y
|0EA96A| STA.w $0DC0,X

|0EA96D| JSR Epilogue_SpriteDraw_CirclingBirds

|0EA970| LDA.b #$0C
|0EA972| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

|0EA975| BRA .continue

;---------------------------------------------------------------------------------------------------

.is_chest
|0EA977| LDA.b #$10
|0EA979| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

.continue
|0EA97C| INX
|0EA97D| CPX.b #$05
|0EA97F| BCC .next_sprite

;---------------------------------------------------------------------------------------------------

|0EA981| LDA.b #$02
|0EA983| LDY.b #$38
|0EA985| JSR Epilogue_SpriteDraw_Single

|0EA988| JSR Epilogue_SpriteDraw_AnimateRunningKidAndLocksmith

|0EA98B| INX

|0EA98C| LDA.b #$03
|0EA98E| LDY.b #$3A
|0EA990| JSR Epilogue_SpriteDraw_Single

|0EA993| PLX

|0EA994| RTS

;===================================================================================================

EpilogueOAMGroup_Priest:
|0EA995| dw  -6,  -2 : db $06, $07, $00, $02 ; book
|0EA99D| dw   0,  -9 : db $0E, $09, $00, $02 ; head
|0EA9A5| dw   0,  -1 : db $08, $09, $00, $02 ; body

;===================================================================================================

Epilogue_SpriteDraw_Sanctuary:
|0EA9AD| PHX

|0EA9AE| LDX.b #$00

|0EA9B0| LDY.b #$0C
|0EA9B2| LDA.b #$03
|0EA9B4| JSR Epilogue_SpriteDraw_Single
|0EA9B7| JSR Epilogue_SpriteDraw_DrawShadow.high_prioritize

;---------------------------------------------------------------------------------------------------

|0EA9BA| INX

|0EA9BB| LDA.b #$73 ; SPRITE 73

|0EA9BD| STA.w $0E20,X

|0EA9C0| LDA.b #$27
|0EA9C2| STA.w $0F50,X

|0EA9C5| LDA.b #$02
|0EA9C7| STA.w $0E90,X

|0EA9CA| LDA.b #$10
|0EA9CC| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

|0EA9CF| PLX

|0EA9D0| RTS

;===================================================================================================

pool Epilogue_SpriteDraw_Witch

.pose_mask
|0EA9D1| db $01, $FF

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Witch:
|0EA9D3| PHX

|0EA9D4| LDX.b #$01
|0EA9D6| LDA.b #$02
|0EA9D8| JSR Epilogue_SpriteDraw_SetShadowProp

|0EA9DB| LDA.b #$E9 ; SPRITE E9
|0EA9DD| STA.w $0E20,X

|0EA9E0| LDA.b #$0C
|0EA9E2| JSL AllocateOAMInRegionA

|0EA9E6| LDA.b #$37
|0EA9E8| STA.w $0F50,X

|0EA9EB| JSL Get16BitSpriteCoords_long

|0EA9EF| LDA.b $1A
|0EA9F1| AND.b #$0F
|0EA9F3| BNE .delay_jiggle

|0EA9F5| LDA.w $0DC0,X
|0EA9F8| EOR.b #$01
|0EA9FA| STA.w $0DC0,X

.delay_jiggle
|0EA9FD| JSL SpriteModule_Active_long

;---------------------------------------------------------------------------------------------------

|0EAA01| REP #$20

|0EAA03| LDA.b $C8
|0EAA05| CMP.w #$0180

|0EAA08| SEP #$20
|0EAA0A| BCC .dont_move

|0EAA0C| LDA.b #$04
|0EAA0E| STA.w $0D40,X

|0EAA11| LDA.w $0D00,X
|0EAA14| CMP.b #$7C
|0EAA16| BEQ .dont_move

|0EAA18| JSL MoveSpriteXY_bank1D_long

;---------------------------------------------------------------------------------------------------

.dont_move
|0EAA1C| DEX

|0EAA1D| LDA.b #$36 ; SPRITE 36
|0EAA1F| STA.w $0E20,X

|0EAA22| LDA.b #$18
|0EAA24| JSL AllocateOAMInRegionA

|0EAA28| LDA.b #$39
|0EAA2A| STA.w $0F50,X

|0EAA2D| JSL Get16BitSpriteCoords_long

|0EAA31| LDA.w $0DF0,X
|0EAA34| BNE .delay_stir

|0EAA36| LDA.b #$04
|0EAA38| STA.w $0DF0,X

|0EAA3B| LDA.b $C9
|0EAA3D| LSR A
|0EAA3E| AND.b #$01
|0EAA40| TAY

|0EAA41| LDA.w $0DC0,X
|0EAA44| CLC
|0EAA45| ADC.w .pose_mask,Y
|0EAA48| AND.b #$07
|0EAA4A| STA.w $0DC0,X

.delay_stir
|0EAA4D| JSL SpriteModule_Active_long

;---------------------------------------------------------------------------------------------------

|0EAA51| PLX

|0EAA52| RTS

;===================================================================================================

EpilogueOAMGroup_FluteDad:
|0EAA53| dw -16, -24 : db $04, $37, $00, $02
|0EAA5B| dw -16, -16 : db $64, $37, $00, $02
|0EAA63| dw -16, -24 : db $62, $37, $00, $02
|0EAA6B| dw -16, -16 : db $64, $37, $00, $02

;===================================================================================================

EpilogueOAMGroup_Quaver:
|0EAA73| dw   0, -19 : db $AF, $39, $00, $00

;===================================================================================================

pool Epilogue_SpriteDraw_Grove

.quaver_speed_x
|0EAA7B| db   1,  -1

.flute_kid_foot_tempo
|0EAA7D| db  16,  14,  16,  18

.flute_dad_headbang_timer
|0EAA81| db  20,  48,  20,  20

;---------------------------------------------------------------------------------------------------

.animal_object_allocation
|0EAA85| db $08 ; left rabbit
|0EAA86| db $08 ; right rabbit
|0EAA87| db $0C ; left bird
|0EAA88| db $0C ; right bird

.animal_props
|0EAA89| db $37 ; left rabbit
|0EAA8A| db $37 ; right rabbit
|0EAA8B| db $3B ; left bird
|0EAA8C| db $3D ; right bird

.animal_direction
|0EAA8D| db $00 ; left rabbit
|0EAA8E| db $01 ; right rabbit
|0EAA8F| db $00 ; left bird
|0EAA90| db $01 ; right bird

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_Grove:
|0EAA91| PHX

|0EAA92| LDX.b #$00

.next_quaver
|0EAA94| LDA.w $0DF0,X
|0EAA97| BNE .delay_quaver

|0EAA99| LDA.b #$60
|0EAA9B| STA.w $0DF0,X
|0EAA9E| STA.w $0DD0,X

|0EAAA1| STZ.w $0D50,X

|0EAAA4| LDA.b #$EE
|0EAAA6| STA.w $0D10,X

|0EAAA9| LDA.b #$04
|0EAAAB| STA.w $0D30,X

|0EAAAE| LDA.b #$18
|0EAAB0| STA.w $0D00,X

|0EAAB3| LDA.b #$0B
|0EAAB5| STA.w $0D20,X

;---------------------------------------------------------------------------------------------------

.delay_quaver
|0EAAB8| LDA.w $0DD0,X
|0EAABB| BEQ .eigth_rest

|0EAABD| LDA.b #$F8
|0EAABF| STA.w $0D40,X

|0EAAC2| JSL MoveSpriteXY_bank1D_long

|0EAAC6| LDA.b $1A
|0EAAC8| LSR A
|0EAAC9| BCS .no_crescendo

|0EAACB| STX.b $00

|0EAACD| LDA.b $1A

|0EAACF| LSR A
|0EAAD0| LSR A
|0EAAD1| LSR A
|0EAAD2| LSR A
|0EAAD3| LSR A

|0EAAD4| EOR.b $00
|0EAAD6| AND.b #$01
|0EAAD8| TAY

|0EAAD9| LDA.w $0D50,X
|0EAADC| CLC
|0EAADD| ADC.w .quaver_speed_x,Y
|0EAAE0| STA.w $0D50,X

.no_crescendo
|0EAAE3| LDY.b #$10
|0EAAE5| LDA.b #$01
|0EAAE7| JSR Epilogue_SpriteDraw_Single

;---------------------------------------------------------------------------------------------------

.eigth_rest
|0EAAEA| INX
|0EAAEB| CPX.b #$05
|0EAAED| BCC .next_quaver

;---------------------------------------------------------------------------------------------------

.next_human
|0EAAEF| LDY.w $0D90,X

|0EAAF2| LDA.w $0DF0,X
|0EAAF5| BNE .delay_jamming

|0EAAF7| LDA.w .flute_kid_foot_tempo,Y

|0EAAFA| CPX.b #$05
|0EAAFC| BEQ .flute_kid

|0EAAFE| LDA.w .flute_dad_headbang_timer,Y

.flute_kid
|0EAB01| STA.w $0DF0,X

|0EAB04| TYA
|0EAB05| INC A
|0EAB06| AND.b #$03
|0EAB08| STA.w $0D90,X

|0EAB0B| LDA.w $0DC0,X
|0EAB0E| EOR.b #$01
|0EAB10| STA.w $0DC0,X

.delay_jamming
|0EAB13| CPX.b #$05
|0EAB15| BNE .not_flute_kid

|0EAB17| LDA.b #$31
|0EAB19| STA.w $0F50,X

|0EAB1C| LDA.b #$10
|0EAB1E| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

|0EAB21| INX

|0EAB22| BRA .next_human

;---------------------------------------------------------------------------------------------------

.not_flute_kid
|0EAB24| LDY.b #$12
|0EAB26| LDA.b #$02
|0EAB28| JSR Epilogue_SpriteDraw_Single

|0EAB2B| INX

;---------------------------------------------------------------------------------------------------

.next_animal
|0EAB2C| LDA.w .animal_props-7,X
|0EAB2F| STA.w $0F50,X

|0EAB32| LDA.w .animal_direction-7,X
|0EAB35| STA.w $0DE0,X

|0EAB38| LDA.w .animal_object_allocation-7,X
|0EAB3B| JSR Epilogue_SpriteDraw_ActivateAndRunSprite

|0EAB3E| INX
|0EAB3F| CPX.b #$0B
|0EAB41| BCC .next_animal

;---------------------------------------------------------------------------------------------------

|0EAB43| PLX

|0EAB44| RTS

;===================================================================================================

EpilogueOAMGroup_WoodsThief:
|0EAB45| dw   0,  -7 : db $00, $0D, $00, $02
|0EAB4D| dw   0,  -7 : db $00, $0D, $00, $02
|0EAB55| dw   0,   0 : db $06, $0D, $00, $02
|0EAB5D| dw   0,  -7 : db $00, $0D, $00, $02
|0EAB65| dw   0,  -7 : db $00, $0D, $00, $02
|0EAB6D| dw   0,   0 : db $06, $4D, $00, $02
|0EAB75| dw   0,  -8 : db $00, $0D, $00, $02
|0EAB7D| dw   0,  -8 : db $00, $0D, $00, $02
|0EAB85| dw   0,   0 : db $20, $0D, $00, $02
|0EAB8D| dw   0,  -8 : db $02, $0D, $00, $02
|0EAB95| dw   0,  -8 : db $02, $0D, $00, $02
|0EAB9D| dw   0,   0 : db $2C, $0D, $00, $02
|0EABA5| dw  -3,   0 : db $2F, $0D, $00, $00
|0EABAD| dw   0,  -7 : db $02, $0D, $00, $02
|0EABB5| dw   0,   0 : db $2C, $0D, $00, $02
|0EABBD| dw  -5,   2 : db $2F, $0D, $00, $00
|0EABC5| dw   0,  -8 : db $02, $0D, $00, $02
|0EABCD| dw   0,   0 : db $2C, $0D, $00, $02
|0EABD5| dw  -5,   2 : db $3F, $0D, $00, $00
|0EABDD| dw   0,  -8 : db $02, $0D, $00, $02
|0EABE5| dw   0,   0 : db $2C, $0D, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_LostWoods

.pickle_pose
|0EABED| db $00, $01, $00

.target_y
|0EABF0| db $02, $08, $20, $20, $08

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_LostWoods:
|0EABF5| PHX

|0EABF6| LDX.b #$06

.next_sprite
|0EABF8| CPX.b #$05
|0EABFA| BCC .pickle

;---------------------------------------------------------------------------------------------------

.raven
|0EABFC| LDA.b #$00 ; SPRITE 00
|0EABFE| STA.w $0E20,X

|0EAC01| LDA.b #$01
|0EAC03| JSR Epilogue_SpriteDraw_SetShadowProp

|0EAC06| LDA.b $1A
|0EAC08| CLC

.this
|0EAC09| ADC.w .this,X
|0EAC0C| AND.b #$08
|0EAC0E| LSR A
|0EAC0F| LSR A
|0EAC10| LSR A
|0EAC11| STA.w $0DC0,X

|0EAC14| LDA.b #$20
|0EAC16| STA.w $0F70,X

|0EAC19| JSR Epilogue_SpriteDraw_CirclingBirds

|0EAC1C| LDA.w $0D50,X
|0EAC1F| LSR A
|0EAC20| AND.b #$40
|0EAC22| EOR.b #$0F
|0EAC24| STA.w $0F50,X

|0EAC27| LDA.b #$08
|0EAC29| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

|0EAC2C| BRA .to_next

;---------------------------------------------------------------------------------------------------

.pickle
|0EAC2E| LDA.b #$0D ; SPRITE 0D
|0EAC30| STA.w $0E20,X

|0EAC33| CPX.b #$01
|0EAC35| BNE .normal_pickle

|0EAC37| STA.w $0EB0,X

.normal_pickle
|0EAC3A| LDA.b #$03
|0EAC3C| JSR Epilogue_SpriteDraw_SetShadowProp

|0EAC3F| LDA.b #$2B
|0EAC41| STA.w $0F50,X

|0EAC44| LDA.w $0DF0,X
|0EAC47| BNE .pickle_DILLay

|0EAC49| LDA.b #$C0
|0EAC4B| STA.w $0DF0,X

.pickle_DILLay
|0EAC4E| LSR A
|0EAC4F| BNE .no_movement

|0EAC51| STA.w $0D40,X
|0EAC54| BRA .set_x_speed

.no_movement
|0EAC56| CMP.w .target_y,X
|0EAC59| BCS .move_pickle

|0EAC5B| LDA.b $1A
|0EAC5D| AND.b #$03
|0EAC5F| BNE .move_pickle

|0EAC61| LDA.w $0D40,X
|0EAC64| BEQ .move_pickle

|0EAC66| DEC A
|0EAC67| STA.w $0D40,X

|0EAC6A| CLC
|0EAC6B| ADC.b #$FC

|0EAC6D| CPX.b #$03
|0EAC6F| BCS .set_x_speed

|0EAC71| EOR.b #$FF
|0EAC73| INC A

.set_x_speed
|0EAC74| STA.w $0D50,X

;---------------------------------------------------------------------------------------------------

.move_pickle
|0EAC77| JSL MoveSpriteXY_bank1D_long

|0EAC7B| LDA.b $1A
|0EAC7D| LSR A
|0EAC7E| LSR A
|0EAC7F| LSR A
|0EAC80| AND.b #$03
|0EAC82| TAY

|0EAC83| LDA.w .pickle_pose,Y
|0EAC86| STA.w $0DC0,X

|0EAC89| LDA.b #$10
|0EAC8B| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

.to_next
|0EAC8E| DEX
|0EAC8F| BEQ .done

|0EAC91| JMP.w .next_sprite

;---------------------------------------------------------------------------------------------------

.done
|0EAC94| LDY.b #$18
|0EAC96| LDA.b #$03
|0EAC98| JSR Epilogue_SpriteDraw_Single

|0EAC9B| LDA.b #$20
|0EAC9D| JSR Epilogue_SpriteDraw_AnimateLostWoodsThief

|0EACA0| PLX

|0EACA1| RTS

;===================================================================================================

Epilogue_SpriteDraw_SetShadowProp:
|0EACA2| STA.w $0E40,X

|0EACA5| LDA.b #$10
|0EACA7| STA.w $0E60,X

|0EACAA| RTS

;===================================================================================================

EpilogueOAMGroup_PedestalSquirrel:
|0EACAB| dw   0,   0 : db $0C, $0C, $00, $02
|0EACB3| dw   0,   0 : db $0A, $0C, $00, $02
|0EACBB| dw   0,   0 : db $C5, $0C, $00, $02
|0EACC3| dw   0,   0 : db $E1, $0C, $00, $02

;===================================================================================================

pool Epilogue_SpriteDraw_Pedestal

.props
|0EACCB| db $61, $61, $3B, $39

.squirrel_timer
|0EACCF| db   6,   6,   6,   6,   6,   6,  10,   8

;---------------------------------------------------------------------------------------------------

.sparkle_timer
|0EACD7| db  32,   4,   4,   4,   5,   6

;---------------------------------------------------------------------------------------------------

.sparkle_position_x
|0EACDD| db $76, $73, $71, $78

.sparkle_position_y
|0EACE1| db $8B, $83, $8D, $85

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_AddSparkle:
|0EACE5| STX.b $00

|0EACE7| STA.b $02

|0EACE9| STY.w $0DB0

;---------------------------------------------------------------------------------------------------

|0EACEC| LDX.b #$00

.next
|0EACEE| LDY.w $0DC0,X

|0EACF1| LDA.w $0DF0,X
|0EACF4| BNE .delay

|0EACF6| INY
|0EACF7| CPY.b #$06
|0EACF9| BCC .dont_set

|0EACFB| LDA.b $00
|0EACFD| STA.w $0D10,X

|0EAD00| LDA.b $02
|0EAD02| STA.w $0D00,X

|0EAD05| LDY.b #$00

.dont_set
|0EAD07| TYA
|0EAD08| STA.w $0DC0,X

|0EAD0B| LDA.w Epilogue_SpriteDraw_Pedestal.sparkle_timer,Y
|0EAD0E| STA.w $0DF0,X

.delay
|0EAD11| TYA
|0EAD12| BEQ .no_draw

|0EAD14| LDY.b #$1C
|0EAD16| LDA.b #$01
|0EAD18| JSR Epilogue_SpriteDraw_Single

.no_draw
|0EAD1B| INX
|0EAD1C| CPX.w $0DB0
|0EAD1F| BCC .next

;---------------------------------------------------------------------------------------------------

|0EAD21| RTS

;===================================================================================================

Epilogue_SpriteDraw_Pedestal:
|0EAD22| PHX

|0EAD23| LDY.b $1A

.this
|0EAD25| LDA.w .this,Y
|0EAD28| AND.b #$03
|0EAD2A| TAY

|0EAD2B| LDX.w .sparkle_position_x,Y
|0EAD2E| LDA.w .sparkle_position_y,Y

|0EAD31| LDY.b #$02
|0EAD33| JSR Epilogue_SpriteDraw_AddSparkle

;---------------------------------------------------------------------------------------------------

|0EAD36| LDA.b #$62 ; SPRITE 62
|0EAD38| STA.w $0E20,X

|0EAD3B| LDA.b #$39
|0EAD3D| STA.w $0F50,X

|0EAD40| LDA.b #$18
|0EAD42| JSR Epilogue_SpriteDraw_PreexistingSpriteDraw

;---------------------------------------------------------------------------------------------------

|0EAD45| LDY.b #$01

.next_sprite
|0EAD47| INX

|0EAD48| LDA.w $0E00,X
|0EAD4B| BEQ .timer_ended

|0EAD4D| DEC.w $0E00,X

.timer_ended
|0EAD50| LDA.w $0D50,X
|0EAD53| LSR A
|0EAD54| AND.b #$40
|0EAD56| EOR.w .props,Y
|0EAD59| STA.w $0F50,X

|0EAD5C| LDA.w $0DF0,X
|0EAD5F| BNE .delay

|0EAD61| LDA.b #$80
|0EAD63| STA.w $0DF0,X

|0EAD66| STZ.w $0D90,X

.delay
|0EAD69| LDA.w $0D90,X
|0EAD6C| BNE .dont_move

|0EAD6E| LDA.b $1A
|0EAD70| LSR A
|0EAD71| LSR A
|0EAD72| AND.b #$01
|0EAD74| INC A
|0EAD75| INC A
|0EAD76| STA.w $0DC0,X

|0EAD79| PHY

|0EAD7A| JSR Epilogue_SpriteDraw_MoveSquirrel

|0EAD7D| PLY

|0EAD7E| BRA .do_draw

;---------------------------------------------------------------------------------------------------

.dont_move
|0EAD80| LDA.w $0E00,X
|0EAD83| BNE .do_draw

|0EAD85| LDA.w $0DA0,X
|0EAD88| CMP.b #$08
|0EAD8A| BNE .dont_reset

|0EAD8C| STZ.w $0DA0,X

.dont_reset
|0EAD8F| PHY

|0EAD90| LDA.w $0DA0,X
|0EAD93| AND.b #$07
|0EAD95| TAY

|0EAD96| LDA.w .squirrel_timer,Y
|0EAD99| STA.w $0E00,X

|0EAD9C| PLY

|0EAD9D| LDA.w $0DC0,X
|0EADA0| AND.b #$01
|0EADA2| EOR.b #$01
|0EADA4| STA.w $0DC0,X

|0EADA7| INC.w $0DA0,X

;---------------------------------------------------------------------------------------------------

.do_draw
|0EADAA| PHY

|0EADAB| LDA.b #$01
|0EADAD| LDY.b #$14
|0EADAF| JSR Epilogue_SpriteDraw_Single
|0EADB2| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

|0EADB5| PLY
|0EADB6| DEY
|0EADB7| BPL .next_sprite

;---------------------------------------------------------------------------------------------------

|0EADB9| INX

|0EADBA| JSR Epilogue_SpriteDraw_WalkLinkAwayFromPedestal

|0EADBD| PLX

|0EADBE| RTS

;===================================================================================================

EpilogueOAMGroup_SwordSparkle:
|0EADBF| dw   0,   0 : db $C7, $34, $00, $00
|0EADC7| dw   0,   0 : db $80, $34, $00, $00
|0EADCF| dw   0,   0 : db $B6, $34, $00, $00
|0EADD7| dw   0,   0 : db $B7, $34, $00, $00
|0EADDF| dw   0,   0 : db $A6, $34, $00, $00

;===================================================================================================

pool Epilogue_SpriteDraw_WalkLinkAwayFromPedestal

.pose
|0EADE7| dw $016C
|0EADE9| dw $016E
|0EADEB| dw $0170
|0EADED| dw $0172
|0EADEF| dw $016C
|0EADF1| dw $0174
|0EADF3| dw $0176
|0EADF5| dw $0178

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_WalkLinkAwayFromPedestal:
|0EADF7| LDA.w $0DF0,X
|0EADFA| BNE .delay_step

|0EADFC| LDA.w $0DC0,X
|0EADFF| INC A
|0EAE00| AND.b #$07
|0EAE02| STA.w $0DC0,X

|0EAE05| LDA.b #$04
|0EAE07| STA.w $0DF0,X

;---------------------------------------------------------------------------------------------------

.delay_step
|0EAE0A| LDA.w $0DC0,X
|0EAE0D| ASL A
|0EAE0E| TAY

|0EAE0F| REP #$20

|0EAE11| LDA.w .pose,Y
|0EAE14| STA.w $0100

|0EAE17| SEP #$20

|0EAE19| LDA.b #$20
|0EAE1B| STA.w $0F50,X

|0EAE1E| LDA.b #$02
|0EAE20| LDY.b #$1A
|0EAE22| JSR Epilogue_SpriteDraw_Single
|0EAE25| JSR Epilogue_SpriteDraw_DrawShadow.priority_set

|0EAE28| JSL MoveSpriteXY_bank1D_long

|0EAE2C| RTS

;===================================================================================================

pool Epilogue_SpriteDraw_MoveSquirrel

.speed_x
|0EAE2D| db  32,  24, -32, -24

.speed_y
|0EAE31| db   8,  -8,  -8,   8

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_SpriteDraw_MoveSquirrel:
|0EAE35| LDA.w $0DF0,X
|0EAE38| CMP.b #$40
|0EAE3A| BCS .move

|0EAE3C| LDA.w $0DB0,X
|0EAE3F| INC A
|0EAE40| AND.b #$03
|0EAE42| STA.w $0DB0,X

|0EAE45| INC.w $0D90,X

|0EAE48| RTS

;---------------------------------------------------------------------------------------------------

.move
|0EAE49| LDY.w $0DB0,X

|0EAE4C| LDA.w .speed_x,Y
|0EAE4F| STA.w $0D50,X

|0EAE52| LDA.w .speed_y,Y
|0EAE55| STA.w $0D40,X

|0EAE58| JSL MoveSpriteXY_bank1D_long

|0EAE5C| RTS

;===================================================================================================

pool EpilogueSpriteSpeeds

.x1
|0EAE5D| db   1,  -1

.x32
|0EAE5F| db  32, -32

.pos16
|0EAE61| db  16

.neg16
|0EAE62| db -16

endpool

;===================================================================================================

Epilogue_SpriteDraw_CirclingBirds:
|0EAE63| LDA.w $0DE0,X
|0EAE66| AND.b #$01
|0EAE68| TAY

|0EAE69| LDA.w $0D50,X
|0EAE6C| CLC
|0EAE6D| ADC.w EpilogueSpriteSpeeds.x1,Y
|0EAE70| STA.w $0D50,X

|0EAE73| CMP.w EpilogueSpriteSpeeds.x32,Y
|0EAE76| BNE .not_at_boundary_x

|0EAE78| INC.w $0DE0,X

;---------------------------------------------------------------------------------------------------

.not_at_boundary_x
|0EAE7B| LDA.b $1A
|0EAE7D| AND.b #$01
|0EAE7F| BNE .dont_change_y_speed

|0EAE81| LDA.w $0EB0,X
|0EAE84| AND.b #$01
|0EAE86| TAY

|0EAE87| LDA.w $0D40,X
|0EAE8A| CLC
|0EAE8B| ADC.w EpilogueSpriteSpeeds.x1,Y
|0EAE8E| STA.w $0D40,X

|0EAE91| CMP.w EpilogueSpriteSpeeds.pos16,Y
|0EAE94| BNE .dont_change_y_speed

|0EAE96| INC.w $0EB0,X

;---------------------------------------------------------------------------------------------------

.dont_change_y_speed
|0EAE99| JSL MoveSpriteXY_bank1D_long

|0EAE9D| RTS

;===================================================================================================

pool Epilogue_SingleCameraScrollControl

.screen_masks
|0EAE9E| dw $0008
|0EAEA0| dw $0004 ; Old McDonald had a farm EAEA0
|0EAEA2| dw $0002
|0EAEA4| dw $0001

endpool

;===================================================================================================

Epilogue_HandleCameraScrollControl:
|0EAEA6| PHB
|0EAEA7| PHK
|0EAEA8| PLB

|0EAEA9| REP #$20

|0EAEAB| LDA.w #$0001
|0EAEAE| STA.b $00

|0EAEB0| LDA.b $30
|0EAEB2| AND.w #$00FF
|0EAEB5| BNE .vertical_movement

|0EAEB7| JMP.w .handle_horizontal

;---------------------------------------------------------------------------------------------------

.vertical_movement
|0EAEBA| CMP.w #$0080
|0EAEBD| BCC .positive_vertical

|0EAEBF| EOR.w #$00FF
|0EAEC2| INC A

|0EAEC3| DEC.b $00
|0EAEC5| DEC.b $00

|0EAEC7| STA.b $02

|0EAEC9| LDY.b #$00
|0EAECB| BRA .continue_vertical

;---------------------------------------------------------------------------------------------------

.positive_vertical
|0EAECD| STA.b $02

|0EAECF| LDY.b #$02

;---------------------------------------------------------------------------------------------------

.continue_vertical
|0EAED1| LDX.b #$06
|0EAED3| JSR Epilogue_SingleCameraScrollControl

|0EAED6| LDA.b $04
|0EAED8| STA.w $069E

|0EAEDB| LDX.b $8C
|0EAEDD| CPX.b #$97 ; OW 97
|0EAEDF| BEQ .handle_horizontal

|0EAEE1| CPX.b #$9D ; OW 9D
|0EAEE3| BEQ .handle_horizontal

|0EAEE5| LDA.b $04
|0EAEE7| BEQ .handle_horizontal

;---------------------------------------------------------------------------------------------------

|0EAEE9| STZ.b $00
|0EAEEB| LSR A
|0EAEEC| ROR.b $00

|0EAEEE| LDX.b $8C
|0EAEF0| CPX.b #$B5 ; OW B5
|0EAEF2| BEQ .unused_overlay

|0EAEF4| CPX.b #$BE ; OW BE
|0EAEF6| BNE .not_unused_overlay

.unused_overlay
|0EAEF8| LSR A
|0EAEF9| ROR.b $00
|0EAEFB| CMP.w #$3000
|0EAEFE| BCC .set_vertical_scroll

|0EAF00| ORA.w #$F000
|0EAF03| BRA .set_vertical_scroll

.not_unused_overlay
|0EAF05| CMP.w #$7000
|0EAF08| BCC .set_vertical_scroll

|0EAF0A| ORA.w #$F000

;---------------------------------------------------------------------------------------------------

.set_vertical_scroll
|0EAF0D| STA.b $06

|0EAF0F| LDA.w $0622
|0EAF12| CLC
|0EAF13| ADC.b $00
|0EAF15| STA.w $0622

|0EAF18| LDA.b $E6
|0EAF1A| ADC.b $06
|0EAF1C| STA.b $E6

;---------------------------------------------------------------------------------------------------

.handle_horizontal
|0EAF1E| LDA.w #$0001
|0EAF21| STA.b $00

|0EAF23| LDA.b $31
|0EAF25| AND.w #$00FF
|0EAF28| BNE .horizontal_movement

|0EAF2A| JMP.w .horizontal_control_done

;---------------------------------------------------------------------------------------------------

.horizontal_movement
|0EAF2D| CMP.w #$0080
|0EAF30| BCC .positive_horizontal

|0EAF32| EOR.w #$00FF
|0EAF35| INC A

|0EAF36| DEC.b $00
|0EAF38| DEC.b $00

|0EAF3A| STA.b $02

|0EAF3C| LDY.b #$04
|0EAF3E| BRA .continue_horizontal

;---------------------------------------------------------------------------------------------------

.positive_horizontal
|0EAF40| STA.b $02

|0EAF42| LDY.b #$06

;---------------------------------------------------------------------------------------------------

.continue_horizontal
|0EAF44| LDX.b #$00
|0EAF46| JSR Epilogue_SingleCameraScrollControl

|0EAF49| LDA.b $04
|0EAF4B| STA.w $069F

|0EAF4E| LDX.b $8C
|0EAF50| CPX.b #$97 ; OW 97
|0EAF52| BEQ .horizontal_control_done

|0EAF54| CPX.b #$9D ; OW 9D
|0EAF56| BEQ .horizontal_control_done

|0EAF58| LDA.b $04
|0EAF5A| BEQ .horizontal_control_done

|0EAF5C| STZ.b $00
|0EAF5E| LSR A
|0EAF5F| ROR.b $00

;---------------------------------------------------------------------------------------------------

|0EAF61| LDX.b $8C
|0EAF63| CPX.b #$95 ; OW 95
|0EAF65| BEQ .dm_overlay

|0EAF67| CPX.b #$9E ; OW 9E
|0EAF69| BNE .not_dm_overlay

.dm_overlay
|0EAF6B| LSR A
|0EAF6C| ROR.b $00
|0EAF6E| CMP.w #$3000
|0EAF71| BCC .set_horizontal_scroll

|0EAF73| ORA.w #$F000
|0EAF76| BRA .set_horizontal_scroll

.not_dm_overlay
|0EAF78| CMP.w #$7000
|0EAF7B| BCC .set_horizontal_scroll

|0EAF7D| ORA.w #$F000

;---------------------------------------------------------------------------------------------------

.set_horizontal_scroll
|0EAF80| STA.b $06

|0EAF82| LDA.w $0620
|0EAF85| CLC
|0EAF86| ADC.b $00
|0EAF88| STA.w $0620

|0EAF8B| LDA.b $E0
|0EAF8D| ADC.b $06
|0EAF8F| STA.b $E0

;---------------------------------------------------------------------------------------------------

.horizontal_control_done
|0EAF91| LDX.b $8C
|0EAF93| CPX.b #$9C ; OW 9C
|0EAF95| BEQ .extra_adjust_bg2

|0EAF97| CPX.b #$97 ; OW 97
|0EAF99| BEQ .extra_adjust_bg1

|0EAF9B| CPX.b #$9D ; OW 9D
|0EAF9D| BNE .continue

;---------------------------------------------------------------------------------------------------

.extra_adjust_bg1
|0EAF9F| LDA.w $0622
|0EAFA2| CLC
|0EAFA3| ADC.w #$2000
|0EAFA6| STA.w $0622

|0EAFA9| LDA.b $E6
|0EAFAB| ADC.w #$0000
|0EAFAE| STA.b $E6

|0EAFB0| LDA.w $0620
|0EAFB3| CLC
|0EAFB4| ADC.w #$2000
|0EAFB7| STA.w $0620

|0EAFBA| LDA.b $E0
|0EAFBC| ADC.w #$0000
|0EAFBF| STA.b $E0

|0EAFC1| BRA .continue

;---------------------------------------------------------------------------------------------------

.extra_adjust_bg2
|0EAFC3| LDA.w $0622
|0EAFC6| SEC
|0EAFC7| SBC.w #$2000
|0EAFCA| STA.w $0622

|0EAFCD| LDA.b $E6
|0EAFCF| SBC.w #$0000
|0EAFD2| CLC
|0EAFD3| ADC.w $069E
|0EAFD6| STA.b $E6

|0EAFD8| LDA.b $E2
|0EAFDA| STA.b $E0

;---------------------------------------------------------------------------------------------------

.continue
|0EAFDC| LDA.b $A0
|0EAFDE| CMP.w #$0181 ; OW 81
|0EAFE1| BNE .exit

|0EAFE3| LDA.b $E8
|0EAFE5| ORA.w #$0100
|0EAFE8| STA.b $E6

|0EAFEA| LDA.b $E2
|0EAFEC| STA.b $E0

.exit
|0EAFEE| SEP #$20

|0EAFF0| PLB

|0EAFF1| RTL

;===================================================================================================

Epilogue_SingleCameraScrollControl:
|0EAFF2| STZ.b $04
|0EAFF4| STZ.b $06

.next_scroll
|0EAFF6| LDA.b $E2,X
|0EAFF8| CLC
|0EAFF9| ADC.b $00
|0EAFFB| STA.b $E2,X

|0EAFFD| INC.b $06

|0EAFFF| LDA.b $04
|0EB001| CLC
|0EB002| ADC.b $00
|0EB004| STA.b $04

|0EB006| DEC.b $02
|0EB008| BNE .next_scroll

;---------------------------------------------------------------------------------------------------

|0EB00A| TYA
|0EB00B| EOR.w #$0002
|0EB00E| TAX

|0EB00F| LDA.w $0624,Y
|0EB012| CLC
|0EB013| ADC.b $06
|0EB015| STA.w $0624,Y

|0EB018| CMP.w #$0010
|0EB01B| BMI .dont_remask_for_tilemap

|0EB01D| SEC
|0EB01E| SBC.w #$0010
|0EB021| STA.w $0624,Y

|0EB024| LDA.w .screen_masks,Y
|0EB027| ORA.w $0416
|0EB02A| STA.w $0416

.dont_remask_for_tilemap
|0EB02D| LDA.w #$0000
|0EB030| SEC
|0EB031| SBC.w $0624,Y
|0EB034| STA.w $0624,X

|0EB037| RTS

;===================================================================================================

Credits_CharacterToTile:
|0EB038| dw $38C7
|0EB03A| dw $38C8
|0EB03C| dw $38C9
|0EB03E| dw $38CA
|0EB040| dw $38CB
|0EB042| dw $38CC
|0EB044| dw $38CD
|0EB046| dw $38CE
|0EB048| dw $38CF
|0EB04A| dw $38D7
|0EB04C| dw $38D8
|0EB04E| dw $38D9
|0EB050| dw $38DA
|0EB052| dw $38DB
|0EB054| dw $38DC
|0EB056| dw $38DD
|0EB058| dw $38DE
|0EB05A| dw $38DF
|0EB05C| dw $38E0
|0EB05E| dw $38E1
|0EB060| dw $38E2
|0EB062| dw $38E3
|0EB064| dw $38E4
|0EB066| dw $38F0
|0EB068| dw $38F1
|0EB06A| dw $38F2
|0EB06C| dw $2CC7
|0EB06E| dw $2CC8
|0EB070| dw $2CC9
|0EB072| dw $2CCA
|0EB074| dw $2CCB
|0EB076| dw $2CCC
|0EB078| dw $2CCD
|0EB07A| dw $2CCE
|0EB07C| dw $2CCF
|0EB07E| dw $2CD7
|0EB080| dw $2CD8
|0EB082| dw $2CD9
|0EB084| dw $2CDA
|0EB086| dw $2CDB
|0EB088| dw $2CDC
|0EB08A| dw $2CDD
|0EB08C| dw $2CDE
|0EB08E| dw $2CDF
|0EB090| dw $2CE0
|0EB092| dw $2CE1
|0EB094| dw $2CE2
|0EB096| dw $2CE3
|0EB098| dw $2CE4
|0EB09A| dw $2CF0
|0EB09C| dw $2CF1
|0EB09E| dw $2CF2
|0EB0A0| dw $2CE5
|0EB0A2| dw $2CF5
|0EB0A4| dw $2CF3
|0EB0A6| dw $2CF4
|0EB0A8| dw $28C7
|0EB0AA| dw $28C8
|0EB0AC| dw $28C9
|0EB0AE| dw $28CA
|0EB0B0| dw $28CB
|0EB0B2| dw $28CC
|0EB0B4| dw $28CD
|0EB0B6| dw $28CE
|0EB0B8| dw $28CF
|0EB0BA| dw $28D7
|0EB0BC| dw $28D8
|0EB0BE| dw $28D9
|0EB0C0| dw $28DA
|0EB0C2| dw $28DB
|0EB0C4| dw $28DC
|0EB0C6| dw $28DD
|0EB0C8| dw $28DE
|0EB0CA| dw $28DF
|0EB0CC| dw $28E0
|0EB0CE| dw $28E1
|0EB0D0| dw $28E2
|0EB0D2| dw $28E3
|0EB0D4| dw $28E4
|0EB0D6| dw $28F0
|0EB0D8| dw $28F1
|0EB0DA| dw $28F2
|0EB0DC| dw $28D6
|0EB0DE| dw $3CE6
|0EB0E0| dw $3CE7
|0EB0E2| dw $3CE8
|0EB0E4| dw $3CE9
|0EB0E6| dw $3CEA
|0EB0E8| dw $3CEB
|0EB0EA| dw $3CEC
|0EB0EC| dw $3CED
|0EB0EE| dw $3CEE
|0EB0F0| dw $3CEF
|0EB0F2| dw $3C00
|0EB0F4| dw $3C01
|0EB0F6| dw $3C02
|0EB0F8| dw $3C03
|0EB0FA| dw $3C04
|0EB0FC| dw $3C05
|0EB0FE| dw $3C06
|0EB100| dw $3C07
|0EB102| dw $3CAF
|0EB104| dw $3C09
|0EB106| dw $3C0A
|0EB108| dw $3C0B
|0EB10A| dw $3C0C
|0EB10C| dw $3C0D
|0EB10E| dw $3C0E
|0EB110| dw $3C0F
|0EB112| dw $3C20
|0EB114| dw $3C21
|0EB116| dw $3C22
|0EB118| dw $3C23
|0EB11A| dw $3C24
|0EB11C| dw $3C25
|0EB11E| dw $3C26
|0EB120| dw $3C27
|0EB122| dw $3C28
|0EB124| dw $3C29
|0EB126| dw $3CA1
|0EB128| dw $3C6E
|0EB12A| dw $3CF6
|0EB12C| dw $3CF7
|0EB12E| dw $3CF8
|0EB130| dw $3CF9
|0EB132| dw $3CFA
|0EB134| dw $3CFB
|0EB136| dw $3CFC
|0EB138| dw $3CFD
|0EB13A| dw $3CFE
|0EB13C| dw $3CFF
|0EB13E| dw $3C10
|0EB140| dw $3C11
|0EB142| dw $3C12
|0EB144| dw $3C13
|0EB146| dw $3C14
|0EB148| dw $3C15
|0EB14A| dw $3C16
|0EB14C| dw $3C17
|0EB14E| dw $3CBF
|0EB150| dw $3C19
|0EB152| dw $3C1A
|0EB154| dw $3C1B
|0EB156| dw $3C1C
|0EB158| dw $3C1D
|0EB15A| dw $3C1E
|0EB15C| dw $3C1F
|0EB15E| dw $3C30
|0EB160| dw $3C31
|0EB162| dw $3C32
|0EB164| dw $3C33
|0EB166| dw $3C34
|0EB168| dw $3C35
|0EB16A| dw $3C36
|0EB16C| dw $3C37
|0EB16E| dw $3C38
|0EB170| dw $3C39
|0EB172| dw $3CB1
|0EB174| dw $3C7E

;---------------------------------------------------------------------------------------------------

CreditsBlankFillTile:
|0EB176| dw $3CA9 ; 0x9F - blank

;===================================================================================================

CreditsTextLine:

; EXECUTIVE PRODUCER
^.line00
|0EB178| db $07, $23 ; spacing, 0x24 bytes
|0EB17A| db $3C, $4F, $3C, $3A, $4C, $4B, $40, $4D
|0EB182| db $3C, $9F, $47, $49, $46, $3B, $4C, $3A
|0EB18A| db $3C, $49

;---------------------------------------------------------------------------------------------------

; Blank line
^.line01
|0EB18C| db $FF ; short circuit

;---------------------------------------------------------------------------------------------------

; HIROSHI YAMAUCHI
^.line02
|0EB18D| db $08, $1F ; spacing, 0x20 bytes
|0EB18F| db $64, $65, $6E, $6B, $6F, $64, $65, $9F
|0EB197| db $75, $5D, $69, $5D, $71, $5F, $64, $65

;---------------------------------------------------------------------------------------------------

; HIROSHI YAMAUCHI
^.line03
|0EB19F| db $08, $1F ; spacing, 0x20 bytes
|0EB1A1| db $8A, $8B, $94, $91, $95, $8A, $8B, $9F
|0EB1A9| db $9B, $83, $8F, $83, $97, $85, $8A, $8B

;---------------------------------------------------------------------------------------------------

; PRODUCER
^.line04
|0EB1B1| db $0C, $0F ; spacing, 0x10 bytes
|0EB1B3| db $29, $2B, $28, $1D, $2E, $1C, $1E, $2B

;---------------------------------------------------------------------------------------------------

; SHIGERU MIYAMOTO
^.line05
|0EB1BB| db $08, $1F ; spacing, 0x20 bytes
|0EB1BD| db $6F, $64, $65, $63, $61, $6E, $71, $9F
|0EB1C5| db $69, $65, $75, $5D, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; SHIGERU MIYAMOTO
^.line06
|0EB1CD| db $08, $1F ; spacing, 0x20 bytes
|0EB1CF| db $95, $8A, $8B, $89, $87, $94, $97, $9F
|0EB1D7| db $8F, $8B, $9B, $83, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; DIRECTOR
^.line07
|0EB1DF| db $0C, $0F ; spacing, 0x10 bytes
|0EB1E1| db $03, $08, $11, $04, $02, $13, $0E, $11

;---------------------------------------------------------------------------------------------------

; TAKASHI TEZUKA
^.line08
|0EB1E9| db $09, $1B ; spacing, 0x1C bytes
|0EB1EB| db $70, $5D, $67, $5D, $6F, $64, $65, $9F
|0EB1F3| db $70, $61, $76, $71, $67, $5D

;---------------------------------------------------------------------------------------------------

; TAKASHI TEZUKA
^.line09
|0EB1F9| db $09, $1B ; spacing, 0x1C bytes
|0EB1FB| db $96, $83, $8D, $83, $95, $8A, $8B, $9F
|0EB203| db $96, $87, $9C, $97, $8D, $83

;---------------------------------------------------------------------------------------------------

; SCRIPT WRITER
^.line0A
|0EB209| db $09, $19 ; spacing, 0x1A bytes
|0EB20B| db $4A, $3A, $49, $40, $47, $4B, $9F, $4E
|0EB213| db $49, $40, $4B, $3C, $49

;---------------------------------------------------------------------------------------------------

; KENSUKE TANABE
^.line0B
|0EB218| db $09, $1B ; spacing, 0x1C bytes
|0EB21A| db $67, $61, $6A, $6F, $71, $67, $61, $9F
|0EB222| db $70, $5D, $6A, $5D, $5E, $61

;---------------------------------------------------------------------------------------------------

; KENSUKE TANABE
^.line0C
|0EB228| db $09, $1B ; spacing, 0x1C bytes
|0EB22A| db $8D, $87, $90, $95, $97, $8D, $87, $9F
|0EB232| db $96, $83, $90, $83, $84, $87

;---------------------------------------------------------------------------------------------------

; ASSISTANT DIRECTORS
^.line0D
|0EB238| db $06, $25 ; spacing, 0x26 bytes
|0EB23A| db $1A, $2C, $2C, $22, $2C, $2D, $1A, $27
|0EB242| db $2D, $9F, $1D, $22, $2B, $1E, $1C, $2D
|0EB24A| db $28, $2B, $2C

;---------------------------------------------------------------------------------------------------

; YASUHISA YAMAMURA
^.line0E
|0EB24D| db $07, $21 ; spacing, 0x22 bytes
|0EB24F| db $75, $5D, $6F, $71, $64, $65, $6F, $5D
|0EB257| db $9F, $75, $5D, $69, $5D, $69, $71, $6E
|0EB25F| db $5D

;---------------------------------------------------------------------------------------------------

; YASUHISA YAMAMURA
^.line0F
|0EB260| db $07, $21 ; spacing, 0x22 bytes
|0EB262| db $9B, $83, $95, $97, $8A, $8B, $95, $83
|0EB26A| db $9F, $9B, $83, $8F, $83, $8F, $97, $94
|0EB272| db $83

;---------------------------------------------------------------------------------------------------

; YOICHI YAMADA
^.line10
|0EB273| db $09, $19 ; spacing, 0x1A bytes
|0EB275| db $75, $6B, $65, $5F, $64, $65, $9F, $75
|0EB27D| db $5D, $69, $5D, $60, $5D

;---------------------------------------------------------------------------------------------------

; YOICHI YAMADA
^.line11
|0EB282| db $09, $19 ; spacing, 0x1A bytes
|0EB284| db $9B, $91, $8B, $85, $8A, $8B, $9F, $9B
|0EB28C| db $83, $8F, $83, $86, $83

;---------------------------------------------------------------------------------------------------

; SCREEN GRAPHICS DESIGNERS
^.line12
|0EB291| db $03, $31 ; spacing, 0x32 bytes
|0EB293| db $4A, $3A, $49, $3C, $3C, $45, $9F, $3E
|0EB29B| db $49, $38, $47, $3F, $40, $3A, $4A, $9F
|0EB2A3| db $3B, $3C, $4A, $40, $3E, $45, $3C, $49
|0EB2AB| db $4A

;---------------------------------------------------------------------------------------------------

; OBJECT DESIGNERS
^.line13
|0EB2AC| db $08, $1F ; spacing, 0x20 bytes
|0EB2AE| db $28, $1B, $23, $1E, $1C, $2D, $9F, $1D
|0EB2B6| db $1E, $2C, $22, $20, $27, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; SOICHIRO TOMITA
^.line14
|0EB2BE| db $08, $1D ; spacing, 0x1E bytes
|0EB2C0| db $6F, $6B, $65, $5F, $64, $65, $6E, $6B
|0EB2C8| db $9F, $70, $6B, $69, $65, $70, $5D

;---------------------------------------------------------------------------------------------------

; SOICHIRO TOMITA
^.line15
|0EB2CF| db $08, $1D ; spacing, 0x1E bytes
|0EB2D1| db $95, $91, $8B, $85, $8A, $8B, $94, $91
|0EB2D9| db $9F, $96, $91, $8F, $8B, $96, $83

;---------------------------------------------------------------------------------------------------

; TAKAYA IMAMURA
^.line16
|0EB2E0| db $09, $1B ; spacing, 0x1C bytes
|0EB2E2| db $70, $5D, $67, $5D, $75, $5D, $9F, $65
|0EB2EA| db $69, $5D, $69, $71, $6E, $5D

;---------------------------------------------------------------------------------------------------

; TAKAYA IMAMURA
^.line17
|0EB2F0| db $09, $1B ; spacing, 0x1C bytes
|0EB2F2| db $96, $83, $8D, $83, $9B, $83, $9F, $8B
|0EB2FA| db $8F, $83, $8F, $97, $94, $83

;---------------------------------------------------------------------------------------------------

; BACK GROUND DESIGNERS
^.line18
|0EB300| db $05, $29 ; spacing, 0x2A bytes
|0EB302| db $1B, $1A, $1C, $24, $9F, $20, $2B, $28
|0EB30A| db $2E, $27, $1D, $9F, $1D, $1E, $2C, $22
|0EB312| db $20, $27, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; MASANAO ARIMOTO
^.line19
|0EB317| db $08, $1D ; spacing, 0x1E bytes
|0EB319| db $69, $5D, $6F, $5D, $6A, $5D, $6B, $9F
|0EB321| db $5D, $6E, $65, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; MASANAO ARIMOTO
^.line1A
|0EB328| db $08, $1D ; spacing, 0x1E bytes
|0EB32A| db $8F, $83, $95, $83, $90, $83, $91, $9F
|0EB332| db $83, $94, $8B, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; TSUYOSHI WATANABE
^.line1B
|0EB339| db $07, $21 ; spacing, 0x22 bytes
|0EB33B| db $70, $6F, $71, $75, $6B, $6F, $64, $65
|0EB343| db $9F, $73, $5D, $70, $5D, $6A, $5D, $5E
|0EB34B| db $61

;---------------------------------------------------------------------------------------------------

; TSUYOSHI WATANABE
^.line1C
|0EB34C| db $07, $21 ; spacing, 0x22 bytes
|0EB34E| db $96, $95, $97, $9B, $91, $95, $8A, $8B
|0EB356| db $9F, $99, $83, $96, $83, $90, $83, $84
|0EB35E| db $87

;---------------------------------------------------------------------------------------------------

; PROGRAM DIRECTOR
^.line1D
|0EB35F| db $08, $1F ; spacing, 0x20 bytes
|0EB361| db $0F, $11, $0E, $06, $11, $00, $0C, $9F
|0EB369| db $03, $08, $11, $04, $02, $13, $0E, $11

;---------------------------------------------------------------------------------------------------

; TOSHIHIKO NAKAGO
^.line1E
|0EB371| db $08, $1F ; spacing, 0x20 bytes
|0EB373| db $70, $6B, $6F, $64, $65, $64, $65, $67
|0EB37B| db $6B, $9F, $6A, $5D, $67, $5D, $63, $6B

;---------------------------------------------------------------------------------------------------

; TOSHIHIKO NAKAGO
^.line1F
|0EB383| db $08, $1F ; spacing, 0x20 bytes
|0EB385| db $96, $91, $95, $8A, $8B, $8A, $8B, $8D
|0EB38D| db $91, $9F, $90, $83, $8D, $83, $89, $91

;---------------------------------------------------------------------------------------------------

; MAIN PROGRAMMER
^.line20
|0EB395| db $08, $1D ; spacing, 0x1E bytes
|0EB397| db $44, $38, $40, $45, $9F, $47, $49, $46
|0EB39F| db $3E, $49, $38, $44, $44, $3C, $49

;---------------------------------------------------------------------------------------------------

; YASUNARI SOEJIMA
^.line21
|0EB3A6| db $08, $1F ; spacing, 0x20 bytes
|0EB3A8| db $75, $5D, $6F, $71, $6A, $5D, $6E, $65
|0EB3B0| db $9F, $6F, $6B, $61, $66, $65, $69, $5D

;---------------------------------------------------------------------------------------------------

; YASUNARI SOEJIMA
^.line22
|0EB3B8| db $08, $1F ; spacing, 0x20 bytes
|0EB3BA| db $9B, $83, $95, $97, $90, $83, $94, $8B
|0EB3C2| db $9F, $95, $91, $87, $8C, $8B, $8F, $83

;---------------------------------------------------------------------------------------------------

; KAZUAKI MORITA
^.line24
|0EB3CA| db $09, $1B ; spacing, 0x1C bytes
|0EB3CC| db $67, $5D, $76, $71, $5D, $67, $65, $9F
|0EB3D4| db $69, $6B, $6E, $65, $70, $5D

;---------------------------------------------------------------------------------------------------

; KAZUAKI MORITA
^.line25
|0EB3DA| db $09, $1B ; spacing, 0x1C bytes
|0EB3DC| db $8D, $83, $9C, $97, $83, $8D, $8B, $9F
|0EB3E4| db $8F, $91, $94, $8B, $96, $83

;---------------------------------------------------------------------------------------------------

; PROGRAMMERS
^.line26
|0EB3EA| db $0A, $15 ; spacing, 0x16 bytes
|0EB3EC| db $29, $2B, $28, $20, $2B, $1A, $26, $26
|0EB3F4| db $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; TATSUO NISHIYAMA
^.line27
|0EB3F7| db $08, $1F ; spacing, 0x20 bytes
|0EB3F9| db $70, $5D, $70, $6F, $71, $6B, $9F, $6A
|0EB401| db $65, $6F, $64, $65, $75, $5D, $69, $5D

;---------------------------------------------------------------------------------------------------

; TATSUO NISHIYAMA
^.line28
|0EB409| db $08, $1F ; spacing, 0x20 bytes
|0EB40B| db $96, $83, $96, $95, $97, $91, $9F, $90
|0EB413| db $8B, $95, $8A, $8B, $9B, $83, $8F, $83

;---------------------------------------------------------------------------------------------------

; YUICHI YAMAMOTO
^.line29
|0EB41B| db $08, $1D ; spacing, 0x1E bytes
|0EB41D| db $75, $71, $65, $5F, $64, $65, $9F, $75
|0EB425| db $5D, $69, $5D, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; YUICHI YAMAMOTO
^.line2A
|0EB42C| db $08, $1D ; spacing, 0x1E bytes
|0EB42E| db $9B, $97, $8B, $85, $8A, $8B, $9F, $9B
|0EB436| db $83, $8F, $83, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; YOSHIHIRO NOMOTO
^.line2B
|0EB43D| db $08, $1F ; spacing, 0x20 bytes
|0EB43F| db $75, $6B, $6F, $64, $65, $64, $65, $6E
|0EB447| db $6B, $9F, $6A, $6B, $69, $6B, $70, $6B

;---------------------------------------------------------------------------------------------------

; YOSHIHIRO NOMOTO
^.line2C
|0EB44F| db $08, $1F ; spacing, 0x20 bytes
|0EB451| db $9B, $91, $95, $8A, $8B, $8A, $8B, $94
|0EB459| db $91, $9F, $90, $91, $8F, $91, $96, $91

;---------------------------------------------------------------------------------------------------

; EIJI NOTO
^.line2D
|0EB461| db $0B, $11 ; spacing, 0x12 bytes
|0EB463| db $61, $65, $66, $65, $9F, $6A, $6B, $70
|0EB46B| db $6B

;---------------------------------------------------------------------------------------------------

; EIJI NOTO
^.line2E
|0EB46C| db $0B, $11 ; spacing, 0x12 bytes
|0EB46E| db $87, $8B, $8C, $8B, $9F, $90, $91, $96
|0EB476| db $91

;---------------------------------------------------------------------------------------------------

; SATORU TAKAHATA
^.line2F
|0EB477| db $08, $1D ; spacing, 0x1E bytes
|0EB479| db $6F, $5D, $70, $6B, $6E, $71, $9F, $70
|0EB481| db $5D, $67, $5D, $64, $5D, $70, $5D

;---------------------------------------------------------------------------------------------------

; SATORU TAKAHATA
^.line30
|0EB488| db $08, $1D ; spacing, 0x1E bytes
|0EB48A| db $95, $83, $96, $91, $94, $97, $9F, $96
|0EB492| db $83, $8D, $83, $8A, $83, $96, $83

;---------------------------------------------------------------------------------------------------

; SOUND COMPOSER
^.line37
|0EB499| db $09, $1B ; spacing, 0x1C bytes
|0EB49B| db $12, $0E, $14, $0D, $03, $9F, $02, $0E
|0EB4A3| db $0C, $0F, $0E, $12, $04, $11

;---------------------------------------------------------------------------------------------------

; KOJI KONDO
^.line38
|0EB4A9| db $0B, $13 ; spacing, 0x14 bytes
|0EB4AB| db $67, $6B, $66, $65, $9F, $67, $6B, $6A
|0EB4B3| db $60, $6B

;---------------------------------------------------------------------------------------------------

; KOJI KONDO
^.line39
|0EB4B5| db $0B, $13 ; spacing, 0x14 bytes
|0EB4B7| db $8D, $91, $8C, $8B, $9F, $8D, $91, $90
|0EB4BF| db $86, $91

;---------------------------------------------------------------------------------------------------

; COORDINATORS
^.line3A
|0EB4C1| db $0A, $17 ; spacing, 0x18 bytes
|0EB4C3| db $3A, $46, $46, $49, $3B, $40, $45, $38
|0EB4CB| db $4B, $46, $49, $4A

;---------------------------------------------------------------------------------------------------

; KEIZO KATO
^.line3B
|0EB4CF| db $0B, $13 ; spacing, 0x14 bytes
|0EB4D1| db $67, $61, $65, $76, $6B, $9F, $67, $5D
|0EB4D9| db $70, $6B

;---------------------------------------------------------------------------------------------------

; KEIZO KATO
^.line3C
|0EB4DB| db $0B, $13 ; spacing, 0x14 bytes
|0EB4DD| db $8D, $87, $8B, $9C, $91, $9F, $8D, $83
|0EB4E5| db $96, $91

;---------------------------------------------------------------------------------------------------

; TAKAO SHIMIZU
^.line3D
|0EB4E7| db $0A, $19 ; spacing, 0x1A bytes
|0EB4E9| db $70, $5D, $67, $5D, $6B, $9F, $6F, $64
|0EB4F1| db $65, $69, $65, $76, $71

;---------------------------------------------------------------------------------------------------

; TAKAO SHIMIZU
^.line3E
|0EB4F6| db $0A, $19 ; spacing, 0x1A bytes
|0EB4F8| db $96, $83, $8D, $83, $91, $9F, $95, $8A
|0EB500| db $8B, $8F, $8B, $9C, $97

;---------------------------------------------------------------------------------------------------

; PRINTED ART WORK
^.line3F
|0EB505| db $08, $1F ; spacing, 0x20 bytes
|0EB507| db $29, $2B, $22, $27, $2D, $1E, $1D, $9F
|0EB50F| db $1A, $2B, $2D, $9F, $30, $28, $2B, $24

;---------------------------------------------------------------------------------------------------

; YOICHI KOTABE
^.line40
|0EB517| db $09, $19 ; spacing, 0x1A bytes
|0EB519| db $75, $6B, $65, $5F, $64, $65, $9F, $67
|0EB521| db $6B, $70, $5D, $5E, $61

;---------------------------------------------------------------------------------------------------

; YOICHI KOTABE
^.line41
|0EB526| db $09, $19 ; spacing, 0x1A bytes
|0EB528| db $9B, $91, $8B, $85, $8A, $8B, $9F, $8D
|0EB530| db $91, $96, $83, $84, $87

;---------------------------------------------------------------------------------------------------

; HIDEKI FUJII
^.line42
|0EB535| db $0A, $17 ; spacing, 0x18 bytes
|0EB537| db $64, $65, $60, $61, $67, $65, $9F, $62
|0EB53F| db $71, $66, $65, $65

;---------------------------------------------------------------------------------------------------

; HIDEKI FUJII
^.line43
|0EB543| db $0A, $17 ; spacing, 0x18 bytes
|0EB545| db $8A, $8B, $86, $87, $8D, $8B, $9F, $88
|0EB54D| db $97, $8C, $8B, $8B

;---------------------------------------------------------------------------------------------------

; YOSHIAKI KOIZUMI
^.line44
|0EB551| db $08, $1F ; spacing, 0x20 bytes
|0EB553| db $75, $6B, $6F, $64, $65, $5D, $67, $65
|0EB55B| db $9F, $67, $6B, $65, $76, $71, $69, $65

;---------------------------------------------------------------------------------------------------

; YOSHIAKI KOIZUMI
^.line45
|0EB563| db $08, $1F ; spacing, 0x20 bytes
|0EB565| db $9B, $91, $95, $8A, $8B, $83, $8D, $8B
|0EB56D| db $9F, $8D, $91, $8B, $9C, $97, $8F, $8B

;---------------------------------------------------------------------------------------------------

; YASUHIRO SAKAI
^.line46
|0EB575| db $09, $1B ; spacing, 0x1C bytes
|0EB577| db $75, $5D, $6F, $71, $64, $65, $6E, $6B
|0EB57F| db $9F, $6F, $5D, $67, $5D, $65

;---------------------------------------------------------------------------------------------------

; YASUHIRO SAKAI
^.line47
|0EB585| db $09, $1B ; spacing, 0x1C bytes
|0EB587| db $9B, $83, $95, $97, $8A, $8B, $94, $91
|0EB58F| db $9F, $95, $83, $8D, $83, $8B

;---------------------------------------------------------------------------------------------------

; TOMOAKI KUROUME
^.line48
|0EB595| db $08, $1D ; spacing, 0x1E bytes
|0EB597| db $70, $6B, $69, $6B, $5D, $67, $65, $9F
|0EB59F| db $67, $71, $6E, $6B, $71, $69, $61

;---------------------------------------------------------------------------------------------------

; TOMOAKI KUROUME
^.line49
|0EB5A6| db $08, $1D ; spacing, 0x1E bytes
|0EB5A8| db $96, $91, $8F, $91, $83, $8D, $8B, $9F
|0EB5B0| db $8D, $97, $94, $91, $97, $8F, $87

;---------------------------------------------------------------------------------------------------

; SPECIAL THANKS TO
^.line4F
|0EB5B7| db $07, $21 ; spacing, 0x22 bytes
|0EB5B9| db $12, $0F, $04, $02, $08, $00, $0B, $9F
|0EB5C1| db $13, $07, $00, $0D, $0A, $12, $9F, $13
|0EB5C9| db $0E

;---------------------------------------------------------------------------------------------------

; NOBUO OKAJIMA
^.line50
|0EB5CA| db $09, $19 ; spacing, 0x1A bytes
|0EB5CC| db $6A, $6B, $5E, $71, $6B, $9F, $6B, $67
|0EB5D4| db $5D, $66, $65, $69, $5D

;---------------------------------------------------------------------------------------------------

; NOBUO OKAJIMA
^.line51
|0EB5D9| db $09, $19 ; spacing, 0x1A bytes
|0EB5DB| db $90, $91, $84, $97, $91, $9F, $91, $8D
|0EB5E3| db $83, $8C, $8B, $8F, $83

;---------------------------------------------------------------------------------------------------

; YASUNORI TAKETANI
^.line52
|0EB5E8| db $07, $21 ; spacing, 0x22 bytes
|0EB5EA| db $75, $5D, $6F, $71, $6A, $6B, $6E, $65
|0EB5F2| db $9F, $70, $5D, $67, $61, $70, $5D, $6A
|0EB5FA| db $65

;---------------------------------------------------------------------------------------------------

; YASUNORI TAKETANI
^.line53
|0EB5FB| db $07, $21 ; spacing, 0x22 bytes
|0EB5FD| db $9B, $83, $95, $97, $90, $91, $94, $8B
|0EB605| db $9F, $96, $83, $8D, $87, $96, $83, $90
|0EB60D| db $8B

;---------------------------------------------------------------------------------------------------

; KIYOSHI KODA
^.line54
|0EB60E| db $0A, $17 ; spacing, 0x18 bytes
|0EB610| db $67, $65, $75, $6B, $6F, $64, $65, $9F
|0EB618| db $67, $6B, $60, $5D

;---------------------------------------------------------------------------------------------------

; KIYOSHI KODA
^.line55
|0EB61C| db $0A, $17 ; spacing, 0x18 bytes
|0EB61E| db $8D, $8B, $9B, $91, $95, $8A, $8B, $9F
|0EB626| db $8D, $91, $86, $83

;---------------------------------------------------------------------------------------------------

; TAKAMITSU KUZUHARA
^.line56
|0EB62A| db $07, $23 ; spacing, 0x24 bytes
|0EB62C| db $70, $5D, $67, $5D, $69, $65, $70, $6F
|0EB634| db $71, $9F, $67, $71, $76, $71, $64, $5D
|0EB63C| db $6E, $5D

;---------------------------------------------------------------------------------------------------

; TAKAMITSU KUZUHARA
^.line57
|0EB63E| db $07, $23 ; spacing, 0x24 bytes
|0EB640| db $96, $83, $8D, $83, $8F, $8B, $96, $95
|0EB648| db $97, $9F, $8D, $97, $9C, $97, $8A, $83
|0EB650| db $94, $83

;---------------------------------------------------------------------------------------------------

; HIRONOBU KAKUI
^.line58
|0EB652| db $09, $1B ; spacing, 0x1C bytes
|0EB654| db $64, $65, $6E, $6B, $6A, $6B, $5E, $71
|0EB65C| db $9F, $67, $5D, $67, $71, $65

;---------------------------------------------------------------------------------------------------

; HIRONOBU KAKUI
^.line59
|0EB662| db $09, $1B ; spacing, 0x1C bytes
|0EB664| db $8A, $8B, $94, $91, $90, $91, $84, $97
|0EB66C| db $9F, $8D, $83, $8D, $97, $8B

;---------------------------------------------------------------------------------------------------

; SHIGEKI YAMASHIRO
^.line5A
|0EB672| db $07, $21 ; spacing, 0x22 bytes
|0EB674| db $6F, $64, $65, $63, $61, $67, $65, $9F
|0EB67C| db $75, $5D, $69, $5D, $6F, $64, $65, $6E
|0EB684| db $6B

;---------------------------------------------------------------------------------------------------

; SHIGEKI YAMASHIRO
^.line5B
|0EB685| db $07, $21 ; spacing, 0x22 bytes
|0EB687| db $95, $8A, $8B, $89, $87, $8D, $8B, $9F
|0EB68F| db $9B, $83, $8F, $83, $95, $8A, $8B, $94
|0EB697| db $91

;---------------------------------------------------------------------------------------------------

; OBJECT PROGRAMMER
^.line23
|0EB698| db $07, $21 ; spacing, 0x22 bytes
|0EB69A| db $46, $39, $41, $3C, $3A, $4B, $9F, $47
|0EB6A2| db $49, $46, $3E, $49, $38, $44, $44, $3C
|0EB6AA| db $49

;---------------------------------------------------------------------------------------------------

; TOSHIO IWAWAKI
^.line31
|0EB6AB| db $09, $1B ; spacing, 0x1C bytes
|0EB6AD| db $70, $6B, $6F, $64, $65, $6B, $9F, $65
|0EB6B5| db $73, $5D, $73, $5D, $67, $65

;---------------------------------------------------------------------------------------------------

; TOSHIO IWAWAKI
^.line32
|0EB6BB| db $09, $1B ; spacing, 0x1C bytes
|0EB6BD| db $96, $91, $95, $8A, $8B, $91, $9F, $8B
|0EB6C5| db $99, $83, $99, $83, $8D, $8B

;---------------------------------------------------------------------------------------------------

; SHIGEHIRO KASAMATSU
^.line33
|0EB6CB| db $06, $25 ; spacing, 0x26 bytes
|0EB6CD| db $6F, $64, $65, $63, $61, $64, $65, $6E
|0EB6D5| db $6B, $9F, $67, $5D, $6F, $5D, $69, $5D
|0EB6DD| db $70, $6F, $71

;---------------------------------------------------------------------------------------------------

; SHIGEHIRO KASAMATSU
^.line34
|0EB6E0| db $06, $25 ; spacing, 0x26 bytes
|0EB6E2| db $95, $8A, $8B, $89, $87, $8A, $8B, $94
|0EB6EA| db $91, $9F, $8D, $83, $95, $83, $8F, $83
|0EB6F2| db $96, $95, $97

;---------------------------------------------------------------------------------------------------

; QUEST HISTORY
^.line5C
|0EB6F5| db $0A, $19 ; spacing, 0x1A bytes
|0EB6F7| db $6D, $71, $61, $6F, $70, $9F, $64, $65
|0EB6FF| db $6F, $70, $6B, $6E, $75

;---------------------------------------------------------------------------------------------------

; QUEST HISTORY
^.line5D
|0EB704| db $0A, $19 ; spacing, 0x1A bytes
|0EB706| db $93, $97, $87, $95, $96, $9F, $8A, $8B
|0EB70E| db $95, $96, $91, $94, $9B

;---------------------------------------------------------------------------------------------------

; LOCATION             GAMES
^.line5E
|0EB713| db $03, $33 ; spacing, 0x34 bytes
|0EB715| db $0B, $0E, $02, $00, $13, $08, $0E, $0D
|0EB71D| db $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F
|0EB725| db $9F, $9F, $9F, $9F, $9F, $06, $00, $0C
|0EB72D| db $04, $12

;---------------------------------------------------------------------------------------------------

; CASTLE OF HYRULE
^.line5F
|0EB72F| db $04, $1F ; spacing, 0x20 bytes
|0EB731| db $1C, $1A, $2C, $2D, $25, $1E, $9F, $28
|0EB739| db $1F, $9F, $21, $32, $2B, $2E, $25, $1E

;---------------------------------------------------------------------------------------------------

; CASTLE DUNGEON
^.line60
|0EB741| db $04, $1B ; spacing, 0x1C bytes
|0EB743| db $3A, $38, $4A, $4B, $43, $3C, $9F, $3B
|0EB74B| db $4C, $45, $3E, $3C, $46, $45

;---------------------------------------------------------------------------------------------------

; EAST PALACE
^.line61
|0EB751| db $04, $15 ; spacing, 0x16 bytes
|0EB753| db $1E, $1A, $2C, $2D, $9F, $29, $1A, $25
|0EB75B| db $1A, $1C, $1E

;---------------------------------------------------------------------------------------------------

; DESERT PALACE
^.line62
|0EB75E| db $04, $19 ; spacing, 0x1A bytes
|0EB760| db $3B, $3C, $4A, $3C, $49, $4B, $9F, $47
|0EB768| db $38, $43, $38, $3A, $3C

;---------------------------------------------------------------------------------------------------

; MOUNTAIN TOWER
^.line63
|0EB76D| db $04, $1B ; spacing, 0x1C bytes
|0EB76F| db $26, $28, $2E, $27, $2D, $1A, $22, $27
|0EB777| db $9F, $2D, $28, $30, $1E, $2B

;---------------------------------------------------------------------------------------------------

; 1 DARK PALACE
^.line64
|0EB77D| db $08, $19 ; spacing, 0x1A bytes
|0EB77F| db $54, $9F, $60, $5D, $6E, $67, $9F, $6C
|0EB787| db $5D, $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL1 DARK PALACE
^.line65
|0EB78C| db $03, $23 ; spacing, 0x24 bytes
|0EB78E| db $0B, $04, $15, $04, $0B, $7A, $9F, $86
|0EB796| db $83, $94, $8D, $9F, $92, $83, $8E, $83
|0EB79E| db $85, $87

;---------------------------------------------------------------------------------------------------

; 2 SWAMP PALACE
^.line66
|0EB7A0| db $08, $1B ; spacing, 0x1C bytes
|0EB7A2| db $55, $9F, $6F, $73, $5D, $69, $6C, $9F
|0EB7AA| db $6C, $5D, $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL2 SWAMP PALACE
^.line67
|0EB7B0| db $03, $25 ; spacing, 0x26 bytes
|0EB7B2| db $0B, $04, $15, $04, $0B, $7B, $9F, $95
|0EB7BA| db $99, $83, $8F, $92, $9F, $92, $83, $8E
|0EB7C2| db $83, $85, $87

;---------------------------------------------------------------------------------------------------

; 3 SKULL WOODS
^.line68
|0EB7C5| db $08, $19 ; spacing, 0x1A bytes
|0EB7C7| db $56, $9F, $6F, $67, $71, $68, $68, $9F
|0EB7CF| db $73, $6B, $6B, $60, $6F

;---------------------------------------------------------------------------------------------------

; LEVEL3 SKULL WOODS
^.line69
|0EB7D4| db $03, $23 ; spacing, 0x24 bytes
|0EB7D6| db $0B, $04, $15, $04, $0B, $7C, $9F, $95
|0EB7DE| db $8D, $97, $8E, $8E, $9F, $99, $91, $91
|0EB7E6| db $86, $95

;---------------------------------------------------------------------------------------------------

; 4 THIEVES'TOWN
^.line6A
|0EB7E8| db $08, $1B ; spacing, 0x1C bytes
|0EB7EA| db $57, $9F, $70, $64, $65, $61, $72, $61
|0EB7F2| db $6F, $77, $70, $6B, $73, $6A

;---------------------------------------------------------------------------------------------------

; LEVEL4 THIEVES'TOWN
^.line6B
|0EB7F8| db $03, $25 ; spacing, 0x26 bytes
|0EB7FA| db $0B, $04, $15, $04, $0B, $7D, $9F, $96
|0EB802| db $8A, $8B, $87, $98, $87, $95, $9D, $96
|0EB80A| db $91, $99, $90

;---------------------------------------------------------------------------------------------------

; 5 ICE PALACE
^.line6C
|0EB80D| db $08, $17 ; spacing, 0x18 bytes
|0EB80F| db $58, $9F, $65, $5F, $61, $9F, $6C, $5D
|0EB817| db $68, $5D, $5F, $61

;---------------------------------------------------------------------------------------------------

; LEVEL5 ICE PALACE
^.line6D
|0EB81B| db $03, $21 ; spacing, 0x22 bytes
|0EB81D| db $0B, $04, $15, $04, $0B, $7E, $9F, $8B
|0EB825| db $85, $87, $9F, $92, $83, $8E, $83, $85
|0EB82D| db $87

;---------------------------------------------------------------------------------------------------

; 6 MISERY MIRE
^.line6E
|0EB82E| db $08, $19 ; spacing, 0x1A bytes
|0EB830| db $59, $9F, $69, $65, $6F, $61, $6E, $75
|0EB838| db $9F, $69, $65, $6E, $61

;---------------------------------------------------------------------------------------------------

; LEVEL6 MISERY MIRE
^.line6F
|0EB83D| db $03, $23 ; spacing, 0x24 bytes
|0EB83F| db $0B, $04, $15, $04, $0B, $7F, $9F, $8F
|0EB847| db $8B, $95, $87, $94, $9B, $9F, $8F, $8B
|0EB84F| db $94, $87

;---------------------------------------------------------------------------------------------------

; 7 TURTLE ROCK
^.line70
|0EB851| db $08, $19 ; spacing, 0x1A bytes
|0EB853| db $5A, $9F, $70, $71, $6E, $70, $68, $61
|0EB85B| db $9F, $6E, $6B, $5F, $67

;---------------------------------------------------------------------------------------------------

; LEVEL7 TURTLE ROCK
^.line71
|0EB860| db $03, $23 ; spacing, 0x24 bytes
|0EB862| db $0B, $04, $15, $04, $0B, $80, $9F, $96
|0EB86A| db $97, $94, $96, $8E, $87, $9F, $94, $91
|0EB872| db $85, $8D

;---------------------------------------------------------------------------------------------------

; 8 GANON'S TOWER
^.line72
|0EB874| db $08, $1D ; spacing, 0x1E bytes
|0EB876| db $5B, $9F, $63, $5D, $6A, $6B, $6A, $77
|0EB87E| db $6F, $9F, $70, $6B, $73, $61, $6E

;---------------------------------------------------------------------------------------------------

; LEVEL8 GANON'S TOWER
^.line73
|0EB885| db $03, $27 ; spacing, 0x28 bytes
|0EB887| db $0B, $04, $15, $04, $0B, $81, $9F, $89
|0EB88F| db $83, $90, $91, $90, $9D, $95, $9F, $96
|0EB897| db $91, $99, $87, $94

;---------------------------------------------------------------------------------------------------

; TOTAL GAMES PLAYED
^.line74
|0EB89B| db $04, $23 ; spacing, 0x24 bytes
|0EB89D| db $70, $6B, $70, $5D, $68, $9F, $63, $5D
|0EB8A5| db $69, $61, $6F, $9F, $6C, $68, $5D, $75
|0EB8AD| db $61, $60

;---------------------------------------------------------------------------------------------------

; TOTAL GAMES PLAYED
^.line75
|0EB8AF| db $04, $23 ; spacing, 0x24 bytes
|0EB8B1| db $96, $91, $96, $83, $8E, $9F, $89, $83
|0EB8B9| db $8F, $87, $95, $9F, $92, $8E, $83, $9B
|0EB8C1| db $87, $86

;---------------------------------------------------------------------------------------------------

; YASUNARI NISHIDA
^.line35
|0EB8C3| db $08, $1F ; spacing, 0x20 bytes
|0EB8C5| db $75, $5D, $6F, $71, $6A, $5D, $6E, $65
|0EB8CD| db $9F, $6A, $65, $6F, $64, $65, $60, $5D

;---------------------------------------------------------------------------------------------------

; YASUNARI NISHIDA
^.line36
|0EB8D5| db $08, $1F ; spacing, 0x20 bytes
|0EB8D7| db $9B, $83, $95, $97, $90, $83, $94, $8B
|0EB8DF| db $9F, $90, $8B, $95, $8A, $8B, $86, $83

;---------------------------------------------------------------------------------------------------

; ENGLISH SCRIPT WRITERS
^.line4A
|0EB8E7| db $05, $2B ; spacing, 0x2C bytes
|0EB8E9| db $1E, $27, $20, $25, $22, $2C, $21, $9F
|0EB8F1| db $2C, $1C, $2B, $22, $29, $2D, $9F, $30
|0EB8F9| db $2B, $22, $2D, $1E, $2B, $2C

;---------------------------------------------------------------------------------------------------

; DANIEL OWSEN
^.line4B
|0EB8FF| db $0A, $17 ; spacing, 0x18 bytes
|0EB901| db $60, $5D, $6A, $65, $61, $68, $9F, $6B
|0EB909| db $73, $6F, $61, $6A

;---------------------------------------------------------------------------------------------------

; DANIEL OWSEN
^.line4C
|0EB90D| db $0A, $17 ; spacing, 0x18 bytes
|0EB90F| db $86, $83, $90, $8B, $87, $8E, $9F, $91
|0EB917| db $99, $95, $87, $90

;---------------------------------------------------------------------------------------------------

; HIROYUKI YAMADA
^.line4D
|0EB91B| db $08, $1D ; spacing, 0x1E bytes
|0EB91D| db $64, $65, $6E, $6B, $75, $71, $67, $65
|0EB925| db $9F, $75, $5D, $69, $5D, $60, $5D

;---------------------------------------------------------------------------------------------------

; HIROYUKI YAMADA
^.line4E
|0EB92C| db $08, $1D ; spacing, 0x1E bytes
|0EB92E| db $8A, $8B, $94, $91, $9B, $97, $8D, $8B
|0EB936| db $9F, $9B, $83, $8F, $83, $86, $83

;---------------------------------------------------------------------------------------------------

.pointers
|0EB93D| dw .line00 ; $0000
|0EB93F| dw .line01 ; $0014
|0EB941| dw .line01 ; $0014
|0EB943| dw .line01 ; $0014
|0EB945| dw .line02 ; $0015
|0EB947| dw .line03 ; $0027
|0EB949| dw .line01 ; $0014
|0EB94B| dw .line01 ; $0014
|0EB94D| dw .line01 ; $0014
|0EB94F| dw .line01 ; $0014
|0EB951| dw .line01 ; $0014
|0EB953| dw .line01 ; $0014
|0EB955| dw .line01 ; $0014
|0EB957| dw .line01 ; $0014
|0EB959| dw .line04 ; $0039
|0EB95B| dw .line01 ; $0014
|0EB95D| dw .line01 ; $0014
|0EB95F| dw .line01 ; $0014
|0EB961| dw .line05 ; $0043
|0EB963| dw .line06 ; $0055
|0EB965| dw .line01 ; $0014
|0EB967| dw .line01 ; $0014
|0EB969| dw .line01 ; $0014
|0EB96B| dw .line01 ; $0014
|0EB96D| dw .line01 ; $0014
|0EB96F| dw .line01 ; $0014
|0EB971| dw .line01 ; $0014
|0EB973| dw .line01 ; $0014
|0EB975| dw .line07 ; $0067
|0EB977| dw .line01 ; $0014
|0EB979| dw .line01 ; $0014
|0EB97B| dw .line01 ; $0014
|0EB97D| dw .line08 ; $0071
|0EB97F| dw .line09 ; $0081
|0EB981| dw .line01 ; $0014
|0EB983| dw .line01 ; $0014
|0EB985| dw .line01 ; $0014
|0EB987| dw .line01 ; $0014
|0EB989| dw .line01 ; $0014
|0EB98B| dw .line01 ; $0014
|0EB98D| dw .line01 ; $0014
|0EB98F| dw .line01 ; $0014
|0EB991| dw .line0A ; $0091
|0EB993| dw .line01 ; $0014
|0EB995| dw .line01 ; $0014
|0EB997| dw .line01 ; $0014
|0EB999| dw .line0B ; $00A0
|0EB99B| dw .line0C ; $00B0
|0EB99D| dw .line01 ; $0014
|0EB99F| dw .line01 ; $0014
|0EB9A1| dw .line01 ; $0014
|0EB9A3| dw .line01 ; $0014
|0EB9A5| dw .line01 ; $0014
|0EB9A7| dw .line01 ; $0014
|0EB9A9| dw .line01 ; $0014
|0EB9AB| dw .line01 ; $0014
|0EB9AD| dw .line0D ; $00C0
|0EB9AF| dw .line01 ; $0014
|0EB9B1| dw .line01 ; $0014
|0EB9B3| dw .line01 ; $0014
|0EB9B5| dw .line0E ; $00D5
|0EB9B7| dw .line0F ; $00E8
|0EB9B9| dw .line01 ; $0014
|0EB9BB| dw .line01 ; $0014
|0EB9BD| dw .line10 ; $00FB
|0EB9BF| dw .line11 ; $010A
|0EB9C1| dw .line01 ; $0014
|0EB9C3| dw .line01 ; $0014
|0EB9C5| dw .line01 ; $0014
|0EB9C7| dw .line01 ; $0014
|0EB9C9| dw .line01 ; $0014
|0EB9CB| dw .line01 ; $0014
|0EB9CD| dw .line01 ; $0014
|0EB9CF| dw .line01 ; $0014
|0EB9D1| dw .line12 ; $0119
|0EB9D3| dw .line01 ; $0014
|0EB9D5| dw .line13 ; $0134
|0EB9D7| dw .line01 ; $0014
|0EB9D9| dw .line01 ; $0014
|0EB9DB| dw .line01 ; $0014
|0EB9DD| dw .line14 ; $0146
|0EB9DF| dw .line15 ; $0157
|0EB9E1| dw .line01 ; $0014
|0EB9E3| dw .line01 ; $0014
|0EB9E5| dw .line16 ; $0168
|0EB9E7| dw .line17 ; $0178
|0EB9E9| dw .line01 ; $0014
|0EB9EB| dw .line01 ; $0014
|0EB9ED| dw .line01 ; $0014
|0EB9EF| dw .line01 ; $0014
|0EB9F1| dw .line01 ; $0014
|0EB9F3| dw .line01 ; $0014
|0EB9F5| dw .line01 ; $0014
|0EB9F7| dw .line01 ; $0014
|0EB9F9| dw .line18 ; $0188
|0EB9FB| dw .line01 ; $0014
|0EB9FD| dw .line01 ; $0014
|0EB9FF| dw .line01 ; $0014
|0EBA01| dw .line19 ; $019F
|0EBA03| dw .line1A ; $01B0
|0EBA05| dw .line01 ; $0014
|0EBA07| dw .line01 ; $0014
|0EBA09| dw .line1B ; $01C1
|0EBA0B| dw .line1C ; $01D4
|0EBA0D| dw .line01 ; $0014
|0EBA0F| dw .line01 ; $0014
|0EBA11| dw .line01 ; $0014
|0EBA13| dw .line01 ; $0014
|0EBA15| dw .line01 ; $0014
|0EBA17| dw .line01 ; $0014
|0EBA19| dw .line01 ; $0014
|0EBA1B| dw .line01 ; $0014
|0EBA1D| dw .line01 ; $0014
|0EBA1F| dw .line01 ; $0014
|0EBA21| dw .line1D ; $01E7
|0EBA23| dw .line01 ; $0014
|0EBA25| dw .line01 ; $0014
|0EBA27| dw .line01 ; $0014
|0EBA29| dw .line1E ; $01F9
|0EBA2B| dw .line1F ; $020B
|0EBA2D| dw .line01 ; $0014
|0EBA2F| dw .line01 ; $0014
|0EBA31| dw .line01 ; $0014
|0EBA33| dw .line01 ; $0014
|0EBA35| dw .line01 ; $0014
|0EBA37| dw .line01 ; $0014
|0EBA39| dw .line01 ; $0014
|0EBA3B| dw .line01 ; $0014
|0EBA3D| dw .line20 ; $021D
|0EBA3F| dw .line01 ; $0014
|0EBA41| dw .line01 ; $0014
|0EBA43| dw .line01 ; $0014
|0EBA45| dw .line21 ; $022E
|0EBA47| dw .line22 ; $0240
|0EBA49| dw .line01 ; $0014
|0EBA4B| dw .line01 ; $0014
|0EBA4D| dw .line01 ; $0014
|0EBA4F| dw .line01 ; $0014
|0EBA51| dw .line01 ; $0014
|0EBA53| dw .line01 ; $0014
|0EBA55| dw .line01 ; $0014
|0EBA57| dw .line01 ; $0014
|0EBA59| dw .line23 ; $0520
|0EBA5B| dw .line01 ; $0014
|0EBA5D| dw .line01 ; $0014
|0EBA5F| dw .line01 ; $0014
|0EBA61| dw .line24 ; $0252
|0EBA63| dw .line25 ; $0262
|0EBA65| dw .line01 ; $0014
|0EBA67| dw .line01 ; $0014
|0EBA69| dw .line01 ; $0014
|0EBA6B| dw .line01 ; $0014
|0EBA6D| dw .line01 ; $0014
|0EBA6F| dw .line01 ; $0014
|0EBA71| dw .line01 ; $0014
|0EBA73| dw .line01 ; $0014
|0EBA75| dw .line26 ; $0272
|0EBA77| dw .line01 ; $0014
|0EBA79| dw .line01 ; $0014
|0EBA7B| dw .line01 ; $0014
|0EBA7D| dw .line27 ; $027F
|0EBA7F| dw .line28 ; $0291
|0EBA81| dw .line01 ; $0014
|0EBA83| dw .line01 ; $0014
|0EBA85| dw .line29 ; $02A3
|0EBA87| dw .line2A ; $02B4
|0EBA89| dw .line01 ; $0014
|0EBA8B| dw .line01 ; $0014
|0EBA8D| dw .line2B ; $02C5
|0EBA8F| dw .line2C ; $02D7
|0EBA91| dw .line01 ; $0014
|0EBA93| dw .line01 ; $0014
|0EBA95| dw .line2D ; $02E9
|0EBA97| dw .line2E ; $02F4
|0EBA99| dw .line01 ; $0014
|0EBA9B| dw .line01 ; $0014
|0EBA9D| dw .line2F ; $02FF
|0EBA9F| dw .line30 ; $0310
|0EBAA1| dw .line01 ; $0014
|0EBAA3| dw .line01 ; $0014
|0EBAA5| dw .line31 ; $0533
|0EBAA7| dw .line32 ; $0543
|0EBAA9| dw .line01 ; $0014
|0EBAAB| dw .line01 ; $0014
|0EBAAD| dw .line33 ; $0553
|0EBAAF| dw .line34 ; $0568
|0EBAB1| dw .line01 ; $0014
|0EBAB3| dw .line01 ; $0014
|0EBAB5| dw .line35 ; $074B
|0EBAB7| dw .line36 ; $075D
|0EBAB9| dw .line01 ; $0014
|0EBABB| dw .line01 ; $0014
|0EBABD| dw .line01 ; $0014
|0EBABF| dw .line01 ; $0014
|0EBAC1| dw .line01 ; $0014
|0EBAC3| dw .line01 ; $0014
|0EBAC5| dw .line01 ; $0014
|0EBAC7| dw .line01 ; $0014
|0EBAC9| dw .line01 ; $0014
|0EBACB| dw .line01 ; $0014
|0EBACD| dw .line37 ; $0321
|0EBACF| dw .line01 ; $0014
|0EBAD1| dw .line01 ; $0014
|0EBAD3| dw .line01 ; $0014
|0EBAD5| dw .line38 ; $0331
|0EBAD7| dw .line39 ; $033D
|0EBAD9| dw .line01 ; $0014
|0EBADB| dw .line01 ; $0014
|0EBADD| dw .line01 ; $0014
|0EBADF| dw .line01 ; $0014
|0EBAE1| dw .line01 ; $0014
|0EBAE3| dw .line01 ; $0014
|0EBAE5| dw .line01 ; $0014
|0EBAE7| dw .line01 ; $0014
|0EBAE9| dw .line3A ; $0349
|0EBAEB| dw .line01 ; $0014
|0EBAED| dw .line01 ; $0014
|0EBAEF| dw .line01 ; $0014
|0EBAF1| dw .line3B ; $0357
|0EBAF3| dw .line3C ; $0363
|0EBAF5| dw .line01 ; $0014
|0EBAF7| dw .line01 ; $0014
|0EBAF9| dw .line3D ; $036F
|0EBAFB| dw .line3E ; $037E
|0EBAFD| dw .line01 ; $0014
|0EBAFF| dw .line01 ; $0014
|0EBB01| dw .line01 ; $0014
|0EBB03| dw .line01 ; $0014
|0EBB05| dw .line01 ; $0014
|0EBB07| dw .line01 ; $0014
|0EBB09| dw .line01 ; $0014
|0EBB0B| dw .line01 ; $0014
|0EBB0D| dw .line3F ; $038D
|0EBB0F| dw .line01 ; $0014
|0EBB11| dw .line01 ; $0014
|0EBB13| dw .line01 ; $0014
|0EBB15| dw .line40 ; $039F
|0EBB17| dw .line41 ; $03AE
|0EBB19| dw .line01 ; $0014
|0EBB1B| dw .line01 ; $0014
|0EBB1D| dw .line42 ; $03BD
|0EBB1F| dw .line43 ; $03CB
|0EBB21| dw .line01 ; $0014
|0EBB23| dw .line01 ; $0014
|0EBB25| dw .line44 ; $03D9
|0EBB27| dw .line45 ; $03EB
|0EBB29| dw .line01 ; $0014
|0EBB2B| dw .line01 ; $0014
|0EBB2D| dw .line46 ; $03FD
|0EBB2F| dw .line47 ; $040D
|0EBB31| dw .line01 ; $0014
|0EBB33| dw .line01 ; $0014
|0EBB35| dw .line48 ; $041D
|0EBB37| dw .line49 ; $042E
|0EBB39| dw .line01 ; $0014
|0EBB3B| dw .line01 ; $0014
|0EBB3D| dw .line01 ; $0014
|0EBB3F| dw .line01 ; $0014
|0EBB41| dw .line01 ; $0014
|0EBB43| dw .line01 ; $0014
|0EBB45| dw .line01 ; $0014
|0EBB47| dw .line01 ; $0014
|0EBB49| dw .line01 ; $0014
|0EBB4B| dw .line01 ; $0014
|0EBB4D| dw .line4A ; $076F
|0EBB4F| dw .line01 ; $0014
|0EBB51| dw .line01 ; $0014
|0EBB53| dw .line01 ; $0014
|0EBB55| dw .line4B ; $0787
|0EBB57| dw .line4C ; $0795
|0EBB59| dw .line01 ; $0014
|0EBB5B| dw .line01 ; $0014
|0EBB5D| dw .line4D ; $07A3
|0EBB5F| dw .line4E ; $07B4
|0EBB61| dw .line01 ; $0014
|0EBB63| dw .line01 ; $0014
|0EBB65| dw .line01 ; $0014
|0EBB67| dw .line01 ; $0014
|0EBB69| dw .line01 ; $0014
|0EBB6B| dw .line01 ; $0014
|0EBB6D| dw .line01 ; $0014
|0EBB6F| dw .line01 ; $0014
|0EBB71| dw .line4F ; $043F
|0EBB73| dw .line01 ; $0014
|0EBB75| dw .line01 ; $0014
|0EBB77| dw .line01 ; $0014
|0EBB79| dw .line50 ; $0452
|0EBB7B| dw .line51 ; $0461
|0EBB7D| dw .line01 ; $0014
|0EBB7F| dw .line01 ; $0014
|0EBB81| dw .line52 ; $0470
|0EBB83| dw .line53 ; $0483
|0EBB85| dw .line01 ; $0014
|0EBB87| dw .line01 ; $0014
|0EBB89| dw .line54 ; $0496
|0EBB8B| dw .line55 ; $04A4
|0EBB8D| dw .line01 ; $0014
|0EBB8F| dw .line01 ; $0014
|0EBB91| dw .line56 ; $04B2
|0EBB93| dw .line57 ; $04C6
|0EBB95| dw .line01 ; $0014
|0EBB97| dw .line01 ; $0014
|0EBB99| dw .line58 ; $04DA
|0EBB9B| dw .line59 ; $04EA
|0EBB9D| dw .line01 ; $0014
|0EBB9F| dw .line01 ; $0014
|0EBBA1| dw .line5A ; $04FA
|0EBBA3| dw .line5B ; $050D
|0EBBA5| dw .line01 ; $0014
|0EBBA7| dw .line01 ; $0014
|0EBBA9| dw .line01 ; $0014
|0EBBAB| dw .line01 ; $0014
|0EBBAD| dw .line01 ; $0014
|0EBBAF| dw .line01 ; $0014
|0EBBB1| dw .line01 ; $0014
|0EBBB3| dw .line01 ; $0014
|0EBBB5| dw .line01 ; $0014
|0EBBB7| dw .line01 ; $0014
|0EBBB9| dw .line01 ; $0014
|0EBBBB| dw .line01 ; $0014
|0EBBBD| dw .line01 ; $0014
|0EBBBF| dw .line01 ; $0014
|0EBBC1| dw .line5C ; $057D
|0EBBC3| dw .line5D ; $058C
|0EBBC5| dw .line01 ; $0014
|0EBBC7| dw .line01 ; $0014
|0EBBC9| dw .line5E ; $059B
|0EBBCB| dw .line01 ; $0014
|0EBBCD| dw .line01 ; $0014
|0EBBCF| dw .line5F ; $05B7
|0EBBD1| dw .line01 ; $0014
|0EBBD3| dw .line01 ; $0014
|0EBBD5| dw .line01 ; $0014
|0EBBD7| dw .line60 ; $05C9
|0EBBD9| dw .line01 ; $0014
|0EBBDB| dw .line01 ; $0014
|0EBBDD| dw .line01 ; $0014
|0EBBDF| dw .line61 ; $05D9
|0EBBE1| dw .line01 ; $0014
|0EBBE3| dw .line01 ; $0014
|0EBBE5| dw .line01 ; $0014
|0EBBE7| dw .line62 ; $05E6
|0EBBE9| dw .line01 ; $0014
|0EBBEB| dw .line01 ; $0014
|0EBBED| dw .line01 ; $0014
|0EBBEF| dw .line63 ; $05F5
|0EBBF1| dw .line01 ; $0014
|0EBBF3| dw .line01 ; $0014
|0EBBF5| dw .line01 ; $0014
|0EBBF7| dw .line64 ; $0605
|0EBBF9| dw .line65 ; $0614
|0EBBFB| dw .line01 ; $0014
|0EBBFD| dw .line01 ; $0014
|0EBBFF| dw .line66 ; $0628
|0EBC01| dw .line67 ; $0638
|0EBC03| dw .line01 ; $0014
|0EBC05| dw .line01 ; $0014
|0EBC07| dw .line68 ; $064D
|0EBC09| dw .line69 ; $065C
|0EBC0B| dw .line01 ; $0014
|0EBC0D| dw .line01 ; $0014
|0EBC0F| dw .line6A ; $0670
|0EBC11| dw .line6B ; $0680
|0EBC13| dw .line01 ; $0014
|0EBC15| dw .line01 ; $0014
|0EBC17| dw .line6C ; $0695
|0EBC19| dw .line6D ; $06A3
|0EBC1B| dw .line01 ; $0014
|0EBC1D| dw .line01 ; $0014
|0EBC1F| dw .line6E ; $06B6
|0EBC21| dw .line6F ; $06C5
|0EBC23| dw .line01 ; $0014
|0EBC25| dw .line01 ; $0014
|0EBC27| dw .line70 ; $06D9
|0EBC29| dw .line71 ; $06E8
|0EBC2B| dw .line01 ; $0014
|0EBC2D| dw .line01 ; $0014
|0EBC2F| dw .line72 ; $06FC
|0EBC31| dw .line73 ; $070D
|0EBC33| dw .line01 ; $0014
|0EBC35| dw .line01 ; $0014
|0EBC37| dw .line01 ; $0014
|0EBC39| dw .line01 ; $0014
|0EBC3B| dw .line01 ; $0014
|0EBC3D| dw .line01 ; $0014
|0EBC3F| dw .line01 ; $0014
|0EBC41| dw .line01 ; $0014
|0EBC43| dw .line01 ; $0014
|0EBC45| dw .line01 ; $0014
|0EBC47| dw .line01 ; $0014
|0EBC49| dw .line01 ; $0014
|0EBC4B| dw .line01 ; $0014
|0EBC4D| dw .line74 ; $0723
|0EBC4F| dw .line75 ; $0737


;---------------------------------------------------------------------------------------------------

.stats_lines
|0EBC51| dw $0290
|0EBC53| dw $0298
|0EBC55| dw $02A0
|0EBC57| dw $02A8
|0EBC59| dw $02B0
|0EBC5B| dw $02BA
|0EBC5D| dw $02C2
|0EBC5F| dw $02CA
|0EBC61| dw $02D2
|0EBC63| dw $02DA
|0EBC65| dw $02E2
|0EBC67| dw $02EA
|0EBC69| dw $02F2
|0EBC6B| dw $0310

;===================================================================================================

Credits_InitializeTheActualCredits:
|0EBC6D| JSL EnableForceBlank

|0EBC71| JSL EraseTilemaps_bg3
|0EBC75| JSL TransferFontToVRAM

|0EBC79| JSL Credits_LoadCoolBackground
|0EBC7D| JSL Credits_InitializePolyhedral

|0EBC81| LDA.b #$80
|0EBC83| STA.b $13

|0EBC85| LDA.b #$02
|0EBC87| STA.w $0AA9

|0EBC8A| LDA.b #$01
|0EBC8C| STA.w $0AB2

|0EBC8F| JSL PaletteLoad_HUD

|0EBC93| INC.b $15

;---------------------------------------------------------------------------------------------------

|0EBC95| REP #$20

|0EBC97| LDA.w #$0000
|0EBC9A| STA.l $7EF3EF

|0EBC9E| LDA.l $7EF403
|0EBCA2| CLC
|0EBCA3| ADC.l $7EF401
|0EBCA7| STA.l $7EF401

|0EBCAB| LDX.b #$18

.next_death
|0EBCAD| CLC
|0EBCAE| ADC.l $7EF3E7,X
|0EBCB2| STA.l $7EF405

|0EBCB6| DEX
|0EBCB7| DEX
|0EBCB8| BPL .next_death

;---------------------------------------------------------------------------------------------------

|0EBCBA| LDA.w #$0000
|0EBCBD| STA.l $7EF403

|0EBCC1| SEP #$20

|0EBCC3| LDA.l $7EF36C
|0EBCC7| LSR A
|0EBCC8| LSR A
|0EBCC9| LSR A
|0EBCCA| TAX

|0EBCCB| LDA.l MaxHealthBasedSpawnHP,X
|0EBCCF| STA.l $7EF36D

|0EBCD3| LDA.b #$40
|0EBCD5| STA.l $7EF3CA

;---------------------------------------------------------------------------------------------------

|0EBCD9| JSL SaveGameFile

|0EBCDD| REP #$20

|0EBCDF| LDA.w #$0000 ; RGB: #000000
|0EBCE2| STA.l $7EC34C
|0EBCE6| STA.l $7EC54C

|0EBCEA| LDA.w #$0000 ; RGB: #000000
|0EBCED| STA.l $7EC300
|0EBCF1| STA.l $7EC500

|0EBCF5| LDA.w #$0016
|0EBCF8| STA.b $1C

|0EBCFA| LDA.w #$6800
|0EBCFD| STA.b $C8

|0EBCFF| STZ.b $CA
|0EBD01| STZ.b $CC

|0EBD03| LDA.w #$FFB8
|0EBD06| STA.b $E8

|0EBD08| LDA.w #$0090
|0EBD0B| STA.b $E2

|0EBD0D| STZ.b $EA
|0EBD0F| STZ.b $E4

;---------------------------------------------------------------------------------------------------

|0EBD11| JSR Credits_AddNextAttribution

|0EBD14| SEP #$20

|0EBD16| LDA.b #$22 ; SONG 22
|0EBD18| STA.w $012C

|0EBD1B| STZ.b $99

|0EBD1D| LDA.b #$A2
|0EBD1F| STA.b $9A

|0EBD21| LDA.b #$12
|0EBD23| STA.w BG2SC

|0EBD26| LDA.b #$3F ; Fixed color RGB: #F8F8F8
|0EBD28| STA.b $9C

|0EBD2A| LDA.b #$5F
|0EBD2C| STA.b $9D

|0EBD2E| LDA.b #$9F
|0EBD30| STA.b $9E

|0EBD32| LDA.b #$40
|0EBD34| STA.b $B0

|0EBD36| STZ.b $13

;---------------------------------------------------------------------------------------------------

|0EBD38| LDX.b #$04

.next_prop
|0EBD3A| LDA.l .hdma_data,X
|0EBD3E| STA.w DMA7MODE,X

|0EBD41| DEX
|0EBD42| BPL .next_prop

|0EBD44| STZ.w HDMA7ITBLB

|0EBD47| LDA.b #$80
|0EBD49| STA.b $9B

|0EBD4B| BRL Credits_SyncBGScrolls

;---------------------------------------------------------------------------------------------------

.hdma_data
|0EBD4E| db $42
|0EBD4F| db BG2HOFS
|0EBD50| dl .indirect_table

.indirect_table
|0EBD53| db  82 : dw $000600
|0EBD56| db   8 : dw $0000E2
|0EBD59| db   8 : dw $000602
|0EBD5C| db   5 : dw $000604
|0EBD5F| db  16 : dw $000606
|0EBD62| db $81 : dw $0000E2
|0EBD65| db $00 ; end

;===================================================================================================

Credits_FadeOutFixedCol:
|0EBD66| DEC.b $B0
|0EBD68| BNE .exit

|0EBD6A| LDA.b #$10
|0EBD6C| STA.b $B0

|0EBD6E| LDA.b $9C
|0EBD70| CMP.b #$20
|0EBD72| BEQ .zero_red

|0EBD74| DEC.b $9C

|0EBD76| BRA .exit

;---------------------------------------------------------------------------------------------------

.zero_red
|0EBD78| LDA.b $9D
|0EBD7A| CMP.b #$40
|0EBD7C| BEQ .zero_green

|0EBD7E| DEC.b $9D

|0EBD80| BRA .exit

;---------------------------------------------------------------------------------------------------

.zero_green
|0EBD82| LDA.b $9E
|0EBD84| CMP.b #$80
|0EBD86| BEQ .exit

|0EBD88| DEC.b $9E

.exit
|0EBD8A| RTS

;===================================================================================================

Credits_FadeColorAndBeginAnimating:
|0EBD8B| JSR Credits_FadeOutFixedCol

|0EBD8E| LDA.b #$01
|0EBD90| STA.w $0710

|0EBD93| SEP #$30

|0EBD95| JSL Credits_AnimateTheTriangles

|0EBD99| REP #$30

|0EBD9B| LDA.b $1A
|0EBD9D| AND.w #$0003
|0EBDA0| BNE Credits_SyncBGScrolls

|0EBDA2| INC.b $E2

|0EBDA4| LDA.b $E2
|0EBDA6| CMP.w #$0C00
|0EBDA9| BNE .dont_set_scroll

|0EBDAB| LDY.w #$1300
|0EBDAE| STY.w BG1SC

.dont_set_scroll
|0EBDB1| LSR A
|0EBDB2| STA.w $0604

|0EBDB5| CLC
|0EBDB6| ADC.b $E2
|0EBDB8| STA.w $0600

|0EBDBB| LSR A
|0EBDBC| STA.w $0602

|0EBDBF| LDA.w $0604
|0EBDC2| LSR A
|0EBDC3| STA.w $0606

|0EBDC6| LDA.b $EA
|0EBDC8| CMP.w #$0CD8
|0EBDCB| BNE .delay_next_submodule

|0EBDCD| LDA.w #$0080
|0EBDD0| STA.b $C8

|0EBDD2| INC.b $11

|0EBDD4| BRA Credits_SyncBGScrolls

;---------------------------------------------------------------------------------------------------

.delay_next_submodule
|0EBDD6| CLC
|0EBDD7| ADC.w #$0001
|0EBDDA| STA.b $EA

|0EBDDC| TAY
|0EBDDD| AND.w #$0007
|0EBDE0| BNE Credits_SyncBGScrolls

|0EBDE2| TYA
|0EBDE3| LSR A
|0EBDE4| LSR A
|0EBDE5| LSR A
|0EBDE6| STA.b $CA

|0EBDE8| JSR Credits_AddNextAttribution

;===================================================================================================

Credits_SyncBGScrolls:
|0EBDEB| REP #$20

|0EBDED| LDA.b $E2
|0EBDEF| STA.w $011E

|0EBDF2| LDA.b $E8
|0EBDF4| STA.w $0122

|0EBDF7| LDA.b $E0
|0EBDF9| STA.w $0120

|0EBDFC| LDA.b $E6
|0EBDFE| STA.w $0124

|0EBE01| SEP #$30

|0EBE03| RTS

;===================================================================================================

pool Credits_AddNextAttribution

.digits
|0EBE04| dw $3CE6
|0EBE06| dw $3CF6

.stats_data_offset
|0EBE08| dw $0002
|0EBE0A| dw $0000
|0EBE0C| dw $0004
|0EBE0E| dw $0006
|0EBE10| dw $0014
|0EBE12| dw $000C
|0EBE14| dw $000A
|0EBE16| dw $0010
|0EBE18| dw $0016
|0EBE1A| dw $0012
|0EBE1C| dw $000E
|0EBE1E| dw $0018
|0EBE20| dw $001A
|0EBE22| dw $001E

endpool

;---------------------------------------------------------------------------------------------------

Credits_AddNextAttribution:
|0EBE24| PHB
|0EBE25| PHK
|0EBE26| PLB

|0EBE27| REP #$30

|0EBE29| LDX.w $1000

|0EBE2C| LDA.b $C8
|0EBE2E| XBA
|0EBE2F| STA.w $1002,X

|0EBE32| LDA.w #$3E40
|0EBE35| STA.w $1004,X

|0EBE38| LDA.w CreditsBlankFillTile
|0EBE3B| STA.w $1006,X

|0EBE3E| TXA
|0EBE3F| CLC
|0EBE40| ADC.w #$0006
|0EBE43| TAX

|0EBE44| LDA.b $CA
|0EBE46| ASL A
|0EBE47| TAY

|0EBE48| CPY.w #$0314
|0EBE4B| BCC .continue

|0EBE4D| BRL .close_stripe

;---------------------------------------------------------------------------------------------------

.continue
|0EBE50| LDA.w CreditsTextLine.pointers,Y
|0EBE53| TAY

|0EBE54| LDA.w CreditsTextLine,Y
|0EBE57| AND.w #$00FF
|0EBE5A| CMP.w #$00FF
|0EBE5D| BEQ .short_circuit_line

|0EBE5F| CLC
|0EBE60| ADC.b $C8
|0EBE62| XBA
|0EBE63| STA.w $1002,X

|0EBE66| INY

|0EBE67| LDA.w CreditsTextLine,Y
|0EBE6A| AND.w #$00FF
|0EBE6D| XBA
|0EBE6E| STA.w $1004,X

|0EBE71| XBA
|0EBE72| INC A
|0EBE73| LSR A
|0EBE74| STA.b $02

|0EBE76| INY
|0EBE77| STY.b $00

;---------------------------------------------------------------------------------------------------

.next_letter
|0EBE79| LDY.b $00

|0EBE7B| LDA.w CreditsTextLine,Y
|0EBE7E| AND.w #$00FF
|0EBE81| ASL A
|0EBE82| TAY

|0EBE83| LDA.w Credits_CharacterToTile,Y
|0EBE86| STA.w $1006,X

|0EBE89| INC.b $00

|0EBE8B| INX
|0EBE8C| INX

|0EBE8D| DEC.b $02
|0EBE8F| BNE .next_letter

;---------------------------------------------------------------------------------------------------

|0EBE91| INX
|0EBE92| INX
|0EBE93| INX
|0EBE94| INX

.short_circuit_line
|0EBE95| LDA.b $CC
|0EBE97| AND.w #$0001
|0EBE9A| TAY
|0EBE9B| BNE .no_stats

|0EBE9D| LDA.b $CC
|0EBE9F| AND.w #$00FE
|0EBEA2| TAY

|0EBEA3| LDA.b $CA
|0EBEA5| ASL A
|0EBEA6| CMP.w CreditsTextLine.stats_lines,Y
|0EBEA9| BNE .close_stripe

;---------------------------------------------------------------------------------------------------

.no_stats
|0EBEAB| TYA
|0EBEAC| AND.w #$0001
|0EBEAF| ASL A
|0EBEB0| TAY

|0EBEB1| LDA.w .digits,Y
|0EBEB4| STA.b $CE

|0EBEB6| LDA.b $C8
|0EBEB8| CLC
|0EBEB9| ADC.w #$0019
|0EBEBC| XBA
|0EBEBD| STA.w $1002,X

|0EBEC0| LDA.w #$0500
|0EBEC3| STA.w $1004,X

|0EBEC6| PHX

|0EBEC7| LDA.b $CC
|0EBEC9| LSR A
|0EBECA| ASL A
|0EBECB| TAX

|0EBECC| LDA.w .stats_data_offset,X
|0EBECF| TAX

|0EBED0| LDA.l $7EF3E7,X

|0EBED4| PLX

|0EBED5| CMP.w #1000
|0EBED8| BCC .sub1000

;---------------------------------------------------------------------------------------------------

|0EBEDA| LDA.w #$0009
|0EBEDD| CLC
|0EBEDE| ADC.b $CE
|0EBEE0| STA.w $1006,X
|0EBEE3| STA.w $1008,X
|0EBEE6| STA.w $100A,X

|0EBEE9| BRA .number_done

;---------------------------------------------------------------------------------------------------

.sub1000
|0EBEEB| LDY.w #$0000

.get_1e2
|0EBEEE| CMP.w #$000A
|0EBEF1| BMI .set_1e2

|0EBEF3| SEC
|0EBEF4| SBC.w #$000A

|0EBEF7| INY

|0EBEF8| BRA .get_1e2

.set_1e2
|0EBEFA| CLC
|0EBEFB| ADC.b $CE
|0EBEFD| STA.w $100A,X

;---------------------------------------------------------------------------------------------------

|0EBF00| TYA

|0EBF01| LDY.w #$0000

.get_1e1
|0EBF04| CMP.w #$000A
|0EBF07| BMI .set_1e1

|0EBF09| SEC
|0EBF0A| SBC.w #$000A
|0EBF0D| INY

|0EBF0E| BRA .get_1e1

;---------------------------------------------------------------------------------------------------

.set_1e1
|0EBF10| CLC
|0EBF11| ADC.b $CE
|0EBF13| STA.w $1008,X

|0EBF16| TYA
|0EBF17| CLC
|0EBF18| ADC.b $CE
|0EBF1A| STA.w $1006,X

;---------------------------------------------------------------------------------------------------

.number_done
|0EBF1D| INC.b $CC

|0EBF1F| TXA
|0EBF20| CLC
|0EBF21| ADC.w #$000A
|0EBF24| TAX

;---------------------------------------------------------------------------------------------------

.close_stripe
|0EBF25| STX.w $1000

|0EBF28| LDA.b $C8
|0EBF2A| CLC
|0EBF2B| ADC.w #$0020
|0EBF2E| TAY

|0EBF2F| AND.w #$03FF
|0EBF32| BNE .dont_reset_vram_addr

|0EBF34| LDA.b $C8
|0EBF36| AND.w #$6800
|0EBF39| EOR.w #$0800
|0EBF3C| TAY

.dont_reset_vram_addr
|0EBF3D| STY.b $C8

|0EBF3F| SEP #$30

|0EBF41| LDA.b #$FF
|0EBF43| STA.w $1002,X

|0EBF46| LDA.b #$01
|0EBF48| STA.b $14

|0EBF4A| PLB

|0EBF4B| RTS

;===================================================================================================

pool Epilogue_AddEndingSequenceText

.chargfx

;---------------------------------------------------------------------------------------------------

.chargfx_castle
; SMALL: THE RETURN OF THE KING
|0EBF4C| dw $6562, $2B00 ; VRAM $C4CA | 44 bytes
|0EBF50| db $2D, $21, $1E, $9F, $2B, $1E, $2D, $2E
|0EBF58| db $2B, $27, $9F, $28, $1F, $9F, $2D, $21
|0EBF60| db $1E, $9F, $24, $22, $27, $20

; TOP: HYRULE CASTLE
|0EBF66| dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
|0EBF6A| db $64, $75, $6E, $71, $68, $61, $9F, $5F
|0EBF72| db $5D, $6F, $70, $68, $61

; BOTTOM: HYRULE CASTLE
|0EBF77| dw $0963, $1900 ; VRAM $C612 | 26 bytes
|0EBF7B| db $8A, $9B, $94, $97, $8E, $87, $9F, $85
|0EBF83| db $83, $95, $96, $8E, $87

;---------------------------------------------------------------------------------------------------

.chargfx_sanc
; SMALL: THE LOYAL SAGE
|0EBF88| dw $6862, $1B00 ; VRAM $C4D0 | 28 bytes
|0EBF8C| db $2D, $21, $1E, $9F, $25, $28, $32, $1A
|0EBF94| db $25, $9F, $2C, $1A, $20, $1E

; TOP: SANCTUARY
|0EBF9A| dw $EB62, $1100 ; VRAM $C5D6 | 18 bytes
|0EBF9E| db $6F, $5D, $6A, $5F, $70, $71, $5D, $6E
|0EBFA6| db $75

; BOTTOM: SANCTUARY
|0EBFA7| dw $0B63, $1100 ; VRAM $C616 | 18 bytes
|0EBFAB| db $95, $83, $90, $85, $96, $97, $83, $94
|0EBFB3| db $9B

;---------------------------------------------------------------------------------------------------

.chargfx_kak1
; SMALL: , (top of apostrophe)
|0EBFB4| dw $4F62, $0100 ; VRAM $C49E | 2 bytes
|0EBFB8| db $34

; SMALL: SAHASRALAH'S HOMECOMING
|0EBFB9| dw $6562, $2D00 ; VRAM $C4CA | 46 bytes
|0EBFBD| db $2C, $1A, $21, $1A, $2C, $2B, $1A, $25
|0EBFC5| db $1A, $21, $35, $2C, $9F, $21, $28, $26
|0EBFCD| db $1E, $1C, $28, $26, $22, $27, $20

; TOP: KAKARIKO TOWN
|0EBFD4| dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
|0EBFD8| db $67, $5D, $67, $5D, $6E, $65, $67, $6B
|0EBFE0| db $9F, $70, $6B, $73, $6A

; BOTTOM: KAKARIKO TOWN
|0EBFE5| dw $0963, $1900 ; VRAM $C612 | 26 bytes
|0EBFE9| db $8D, $83, $8D, $83, $94, $8B, $8D, $91
|0EBFF1| db $9F, $96, $91, $99, $90

;---------------------------------------------------------------------------------------------------

.chargfx_desert
; SMALL: VULTURES RULE THE DESERT
|0EBFF6| dw $6462, $2F00 ; VRAM $C4C8 | 48 bytes
|0EBFFA| db $2F, $2E, $25, $2D, $2E, $2B, $1E, $2C
|0EC002| db $9F, $2B, $2E, $25, $1E, $9F, $2D, $21
|0EC00A| db $1E, $9F, $1D, $1E, $2C, $1E, $2B, $2D

; TOP: DESERT PALACE
|0EC012| dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
|0EC016| db $60, $61, $6F, $61, $6E, $70, $9F, $6C
|0EC01E| db $5D, $68, $5D, $5F, $61

; BOTTOM: DESERT PALACE
|0EC023| dw $0963, $1900 ; VRAM $C612 | 26 bytes
|0EC027| db $86, $87, $95, $87, $94, $96, $9F, $92
|0EC02F| db $83, $8E, $83, $85, $87

;---------------------------------------------------------------------------------------------------

.chargfx_hera
; SMALL: THE BULLY MAKES A FRIEND
|0EC034| dw $6462, $2F00 ; VRAM $C4C8 | 48 bytes
|0EC038| db $2D, $21, $1E, $9F, $1B, $2E, $25, $25
|0EC040| db $32, $9F, $26, $1A, $24, $1E, $2C, $9F
|0EC048| db $1A, $9F, $1F, $2B, $22, $1E, $27, $1D

; TOP: MOUNTAIN TOWER
|0EC050| dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
|0EC054| db $69, $6B, $71, $6A, $70, $5D, $65, $6A
|0EC05C| db $9F, $70, $6B, $73, $61, $6E

; BOTTOM: MOUNTAIN TOWER
|0EC062| dw $0963, $1B00 ; VRAM $C612 | 28 bytes
|0EC066| db $8F, $91, $97, $90, $96, $83, $8B, $90
|0EC06E| db $9F, $96, $91, $99, $87, $94

;---------------------------------------------------------------------------------------------------

.chargfx_house
; SMALL: YOUR UNCLE RECOVERS
|0EC074| dw $6662, $2500 ; VRAM $C4CC | 38 bytes
|0EC078| db $32, $28, $2E, $2B, $9F, $2E, $27, $1C
|0EC080| db $25, $1E, $9F, $2B, $1E, $1C, $28, $2F
|0EC088| db $1E, $2B, $2C

; TOP: YOUR HOUSE
|0EC08B| dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
|0EC08F| db $75, $6B, $71, $6E, $9F, $64, $6B, $71
|0EC097| db $6F, $61

; BOTTOM: YOUR HOUSE
|0EC099| dw $0B63, $1300 ; VRAM $C616 | 20 bytes
|0EC09D| db $9B, $91, $97, $94, $9F, $8A, $91, $97
|0EC0A5| db $95, $87

;---------------------------------------------------------------------------------------------------

.chargfx_zora
; SMALL: FLIPPERS FOR SALE
|0EC0A7| dw $6662, $2100 ; VRAM $C4CC | 34 bytes
|0EC0AB| db $1F, $25, $22, $29, $29, $1E, $2B, $2C
|0EC0B3| db $9F, $1F, $28, $2B, $9F, $2C, $1A, $25
|0EC0BB| db $1E

; TOP: ZORA'S WATERFALL
|0EC0BC| dw $E862, $1F00 ; VRAM $C5D0 | 32 bytes
|0EC0C0| db $76, $6B, $6E, $5D, $77, $6F, $9F, $73
|0EC0C8| db $5D, $70, $61, $6E, $62, $5D, $68, $68

; BOTTOM: ZORA'S WATERFALL
|0EC0D0| dw $0863, $1F00 ; VRAM $C610 | 32 bytes
|0EC0D4| db $9C, $91, $94, $83, $9D, $95, $9F, $99
|0EC0DC| db $83, $96, $87, $94, $88, $83, $8E, $8E

;---------------------------------------------------------------------------------------------------

.chargfx_witch
; SMALL: THE WITCH AND ASSISTANT
|0EC0E4| dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
|0EC0E8| db $2D, $21, $1E, $9F, $30, $22, $2D, $1C
|0EC0F0| db $21, $9F, $1A, $27, $1D, $9F, $1A, $2C
|0EC0F8| db $2C, $22, $2C, $2D, $1A, $27, $2D

; TOP: MAGIC SHOP
|0EC0FF| dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
|0EC103| db $69, $5D, $63, $65, $5F, $9F, $6F, $64
|0EC10B| db $6B, $6C

; BOTTOM: MAGIC SHOP
|0EC10D| dw $0B63, $1300 ; VRAM $C616 | 20 bytes
|0EC111| db $8F, $83, $89, $8B, $85, $9F, $95, $8A
|0EC119| db $91, $92

;---------------------------------------------------------------------------------------------------

.chargfx_lumberjack
; SMALL: TWIN LUMBERJACKS
|0EC11B| dw $6862, $1F00 ; VRAM $C4D0 | 32 bytes
|0EC11F| db $2D, $30, $22, $27, $9F, $25, $2E, $26
|0EC127| db $1B, $1E, $2B, $23, $1A, $1C, $24, $2C

; TOP: WOODSMEN'S HUT
|0EC12F| dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
|0EC133| db $73, $6B, $6B, $60, $6F, $69, $61, $6A
|0EC13B| db $77, $6F, $9F, $64, $71, $70

; BOTTOM: WOODSMEN'S HUT
|0EC141| dw $0963, $1B00 ; VRAM $C612 | 28 bytes
|0EC145| db $99, $91, $91, $86, $95, $8F, $87, $90
|0EC14D| db $9D, $95, $9F, $8A, $97, $96

;---------------------------------------------------------------------------------------------------

.chargfx_grove
; SMALL: FLUTE BOY PLAYS AGAIN
|0EC153| dw $6462, $2900 ; VRAM $C4C8 | 42 bytes
|0EC157| db $1F, $25, $2E, $2D, $1E, $9F, $1B, $28
|0EC15F| db $32, $9F, $29, $25, $1A, $32, $2C, $9F
|0EC167| db $1A, $20, $1A, $22, $27

; TOP: HAUNTED GROVE
|0EC16C| dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
|0EC170| db $64, $5D, $71, $6A, $70, $61, $60, $9F
|0EC178| db $63, $6E, $6B, $72, $61

; BOTTOM: HAUNTED GROVE
|0EC17D| dw $0963, $1900 ; VRAM $C612 | 26 bytes
|0EC181| db $8A, $83, $97, $90, $96, $87, $86, $9F
|0EC189| db $89, $94, $91, $98, $87

;---------------------------------------------------------------------------------------------------

.chargfx_venus
; SMALL: VENUS. QUEEN OF FAERIES
|0EC18E| dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
|0EC192| db $2F, $1E, $27, $2E, $2C, $37, $9F, $2A
|0EC19A| db $2E, $1E, $1E, $27, $9F, $28, $1F, $9F
|0EC1A2| db $1F, $1A, $1E, $2B, $22, $1E, $2C

; TOP: WISHING WELL
|0EC1A9| dw $EA62, $1700 ; VRAM $C5D4 | 24 bytes
|0EC1AD| db $73, $65, $6F, $64, $65, $6A, $63, $9F
|0EC1B5| db $73, $61, $68, $68

; BOTTOM: WISHING WELL
|0EC1B9| dw $0A63, $1700 ; VRAM $C614 | 24 bytes
|0EC1BD| db $99, $8B, $95, $8A, $8B, $90, $89, $9F
|0EC1C5| db $99, $87, $8E, $8E

;---------------------------------------------------------------------------------------------------

.chargfx_smithy
; SMALL: THE DWARVEN SWORDSMITHS
|0EC1C9| dw $6462, $2D00 ; VRAM $C4C8 | 46 bytes
|0EC1CD| db $2D, $21, $1E, $9F, $1D, $30, $1A, $2B
|0EC1D5| db $2F, $1E, $27, $9F, $2C, $30, $28, $2B
|0EC1DD| db $1D, $2C, $26, $22, $2D, $21, $2C

; TOP: SMITHERY
|0EC1E4| dw $EC62, $0F00 ; VRAM $C5D8 | 16 bytes
|0EC1E8| db $6F, $69, $65, $70, $64, $61, $6E, $75

; BOTTOM: SMITHERY
|0EC1F0| dw $0C63, $0F00 ; VRAM $C618 | 16 bytes
|0EC1F4| db $95, $8F, $8B, $96, $8A, $87, $94, $9B

;---------------------------------------------------------------------------------------------------

.chargfx_kak2
; SMALL: THE BUG-CATCHING KID
|0EC1FC| dw $6662, $2700 ; VRAM $C4CC | 40 bytes
|0EC200| db $2D, $21, $1E, $9F, $1B, $2E, $20, $36
|0EC208| db $1C, $1A, $2D, $1C, $21, $22, $27, $20
|0EC210| db $9F, $24, $22, $1D

; TOP: KAKARIKO TOWN
|0EC214| dw $E962, $1900 ; VRAM $C5D2 | 26 bytes
|0EC218| db $67, $5D, $67, $5D, $6E, $65, $67, $6B
|0EC220| db $9F, $70, $6B, $73, $6A

; BOTTOM: KAKARIKO TOWN
|0EC225| dw $0963, $1900 ; VRAM $C612 | 26 bytes
|0EC229| db $8D, $83, $8D, $83, $94, $8B, $8D, $91
|0EC231| db $9F, $96, $91, $99, $90

;---------------------------------------------------------------------------------------------------

.chargfx_deathmountain
; SMALL: THE LOST OLD MAN
|0EC236| dw $4862, $1F00 ; VRAM $C490 | 32 bytes
|0EC23A| db $2D, $21, $1E, $9F, $25, $28, $2C, $2D
|0EC242| db $9F, $28, $25, $1D, $9F, $26, $1A, $27

; TOP: DEATH MOUNTAIN
|0EC24A| dw $E962, $1B00 ; VRAM $C5D2 | 28 bytes
|0EC24E| db $60, $61, $5D, $70, $64, $9F, $69, $6B
|0EC256| db $71, $6A, $70, $5D, $65, $6A

; BOTTOM: DEATH MOUNTAIN
|0EC25C| dw $0963, $1B00 ; VRAM $C612 | 28 bytes
|0EC260| db $86, $87, $83, $96, $8A, $9F, $8F, $91
|0EC268| db $97, $90, $96, $83, $8B, $90

;---------------------------------------------------------------------------------------------------

.chargfx_lostwoods
; SMALL: THE FOREST THIEF
|0EC26E| dw $6862, $1F00 ; VRAM $C4D0 | 32 bytes
|0EC272| db $2D, $21, $1E, $9F, $1F, $28, $2B, $1E
|0EC27A| db $2C, $2D, $9F, $2D, $21, $22, $1E, $1F

; TOP: LOST WOODS
|0EC282| dw $EB62, $1300 ; VRAM $C5D6 | 20 bytes
|0EC286| db $68, $6B, $6F, $70, $9F, $73, $6B, $6B
|0EC28E| db $60, $6F

; BOTTOM: LOST WOODS
|0EC290| dw $0B63, $1300 ; VRAM $C616 | 20 bytes
|0EC294| db $8E, $91, $95, $96, $9F, $99, $91, $91
|0EC29C| db $86, $95

;---------------------------------------------------------------------------------------------------

.chargfx_pedestal
; SMALL: AND THE MASTER SWORD
|0EC29E| dw $6662, $2700 ; VRAM $C4CC | 40 bytes
|0EC2A2| db $1A, $27, $1D, $9F, $2D, $21, $1E, $9F
|0EC2AA| db $26, $1A, $2C, $2D, $1E, $2B, $9F, $2C
|0EC2B2| db $30, $28, $2B, $1D

; SMALL: SLEEPS AGAIN...
|0EC2B6| dw $A862, $1D00 ; VRAM $C550 | 30 bytes
|0EC2BA| db $4A, $43, $3C, $3C, $47, $4A, $9F, $38
|0EC2C2| db $3E, $38, $40, $45, $52, $52, $52

; TOP: FOREVER!
|0EC2C9| dw $EC62, $0F00 ; VRAM $C5D8 | 16 bytes
|0EC2CD| db $62, $6B, $6E, $61, $72, $61, $6E, $78

; BOTTOM: FOREVER!
|0EC2D5| dw $0C63, $0F00 ; VRAM $C618 | 16 bytes
|0EC2D9| db $88, $91, $94, $87, $98, $87, $94, $9E

;---------------------------------------------------------------------------------------------------

.offset
|0EC2E1| dw .chargfx_castle-.chargfx        ; $0000
|0EC2E3| dw .chargfx_sanc-.chargfx          ; $003C
|0EC2E5| dw .chargfx_kak1-.chargfx          ; $0068
|0EC2E7| dw .chargfx_desert-.chargfx        ; $00AA
|0EC2E9| dw .chargfx_hera-.chargfx          ; $00E8
|0EC2EB| dw .chargfx_house-.chargfx         ; $0128
|0EC2ED| dw .chargfx_zora-.chargfx          ; $015B
|0EC2EF| dw .chargfx_witch-.chargfx         ; $0198
|0EC2F1| dw .chargfx_lumberjack-.chargfx    ; $01CF
|0EC2F3| dw .chargfx_grove-.chargfx         ; $0207
|0EC2F5| dw .chargfx_venus-.chargfx         ; $0242
|0EC2F7| dw .chargfx_smithy-.chargfx        ; $027D
|0EC2F9| dw .chargfx_kak2-.chargfx          ; $02B0
|0EC2FB| dw .chargfx_deathmountain-.chargfx ; $02EA
|0EC2FD| dw .chargfx_lostwoods-.chargfx     ; $0322
|0EC2FF| dw .chargfx_pedestal-.chargfx      ; $0352
|0EC301| dw .offset-.chargfx                ; $0395

endpool

;---------------------------------------------------------------------------------------------------

Epilogue_AddEndingSequenceText:
|0EC303| PHB
|0EC304| PHK
|0EC305| PLB

|0EC306| REP #$30

|0EC308| LDA.w #$0060 ; VRAM $C000
|0EC30B| STA.w $1002

|0EC30E| LDA.w #$FE47
|0EC311| STA.w $1004

|0EC314| LDA.w CreditsBlankFillTile
|0EC317| STA.w $1006

|0EC31A| LDA.b $11
|0EC31C| AND.w #$00FE
|0EC31F| TAY

|0EC320| LDA.w .offset+2,Y
|0EC323| STA.b $04

|0EC325| LDA.w .offset+0,Y
|0EC328| TAY

;---------------------------------------------------------------------------------------------------

|0EC329| LDX.w #$0000

.next_stripe
|0EC32C| LDA.w .chargfx,Y
|0EC32F| STA.w $1008,X

|0EC332| INY
|0EC333| INY

|0EC334| INX
|0EC335| INX

|0EC336| LDA.w .chargfx,Y
|0EC339| STA.w $1008,X

|0EC33C| XBA
|0EC33D| AND.w #$00FF
|0EC340| LSR A
|0EC341| STA.b $00

|0EC343| INY
|0EC344| INY

|0EC345| INX
|0EC346| INX

|0EC347| STY.b $02

;---------------------------------------------------------------------------------------------------

.next_character
|0EC349| LDY.b $02

|0EC34B| LDA.w .chargfx,Y
|0EC34E| AND.w #$00FF
|0EC351| ASL A
|0EC352| TAY

|0EC353| LDA.w Credits_CharacterToTile,Y
|0EC356| STA.w $1008,X

|0EC359| INC.b $02

|0EC35B| INX
|0EC35C| INX

|0EC35D| DEC.b $00
|0EC35F| BPL .next_character

;---------------------------------------------------------------------------------------------------

|0EC361| LDY.b $02
|0EC363| CPY.b $04
|0EC365| BNE .next_stripe

;---------------------------------------------------------------------------------------------------

|0EC367| TXA
|0EC368| CLC
|0EC369| ADC.w #$0006
|0EC36C| STA.w $1000

|0EC36F| SEP #$30

|0EC371| LDA.b #$FF
|0EC373| STA.w $1008,X

|0EC376| LDA.b #$01
|0EC378| STA.b $14

|0EC37A| PLB

|0EC37B| RTS

;===================================================================================================

Credits_BrightenTriangles:
|0EC37C| LDA.b $1A
|0EC37E| AND.b #$0F
|0EC380| BNE Credits_AnimateTheTriangles_bounce

|0EC382| INC.b $13

|0EC384| LDA.b $13
|0EC386| CMP.b #$0F
|0EC388| BNE Credits_AnimateTheTriangles_bounce

|0EC38A| INC.b $11

;===================================================================================================

Credits_AnimateTheTriangles_bounce:
|0EC38C| JSL Credits_AnimateTheTriangles

|0EC390| RTS

;===================================================================================================

Credits_StopCreditsScroll:
|0EC391| DEC.b $C8
|0EC393| BNE .delay

|0EC395| REP #$20

|0EC397| STZ.w $0AA6

|0EC39A| LDA.w #$0000
|0EC39D| STA.l $7EC009
|0EC3A1| STA.l $7EC007

|0EC3A5| LDA.w #$001F
|0EC3A8| STA.l $7EC00B

|0EC3AC| SEP #$20

|0EC3AE| INC.b $11

|0EC3B0| LDA.b #$C0
|0EC3B2| STA.b $C8

|0EC3B4| STZ.b $CA

.delay
|0EC3B6| BRA Credits_AnimateTheTriangles_bounce

;===================================================================================================

#Credits_FadeAndDisperseTriangles:
|0EC3B8| DEC.b $C8

|0EC3BA| LDA.b $CA
|0EC3BC| BNE .skip_filter

|0EC3BE| JSL ApplyPaletteFilter

|0EC3C2| LDA.l $7EC007
|0EC3C6| BNE .delay

|0EC3C8| INC.b $CA

.skip_filter
|0EC3CA| LDA.b $C8
|0EC3CC| BNE .delay

|0EC3CE| INC.b $11

|0EC3D0| JSL PaletteFilter_TheEndSprite

|0EC3D4| RTS

;===================================================================================================

Credits_FadeInTheEnd:
|0EC3D5| LDA.b $1A
|0EC3D7| AND.b #$07
|0EC3D9| BNE .delay

|0EC3DB| JSL PaletteFilter_Sprite5Left

|0EC3DF| LDA.l $7EC007
|0EC3E3| BNE .delay

|0EC3E5| INC.b $11

.delay
|0EC3E7| JMP.w Credits_DrawTheEnd

;===================================================================================================

pool Credits_DrawTheEnd

.oam_data
|0EC3EA| db $A0, $B8, $00, $3B
|0EC3EE| db $B0, $B8, $02, $3B
|0EC3F2| db $C0, $B8, $04, $3B
|0EC3F6| db $D0, $B8, $06, $3B

endpool

;---------------------------------------------------------------------------------------------------

Credits_DrawTheEnd:
|0EC3FA| REP #$20

|0EC3FC| LDX.b #$0E

.copy_next
|0EC3FE| LDA.l .oam_data,X
|0EC402| STA.w $0800,X

|0EC405| DEX
|0EC406| DEX
|0EC407| BPL .copy_next

|0EC409| SEP #$20

|0EC40B| LDA.b #$02
|0EC40D| STA.w $0A20
|0EC410| STA.w $0A21
|0EC413| STA.w $0A22
|0EC416| STA.w $0A23

|0EC419| RTS

;===================================================================================================

Credits_HangForever:
|0EC41A| BRA Credits_DrawTheEnd

;===================================================================================================
; FREE ROM: 0x24
;===================================================================================================
NULL_0EC41C:
|0EC41C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EC424| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EC42C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EC434| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EC43C| db $FF, $FF, $FF, $FF

;===================================================================================================

RenderText:
#Module0E_02_RenderText:
|0EC440| PHB
|0EC441| PHK
|0EC442| PLB

|0EC443| JSR .main

|0EC446| PLB
|0EC447| RTL

;---------------------------------------------------------------------------------------------------

.main
|0EC448| LDA.w $1CD8
|0EC44B| JSL JumpTableLocal
|0EC44F| dw RenderText_Initialize
|0EC451| dw RenderText_Draw
|0EC453| dw RenderText_PostDeathSaveOptions

;===================================================================================================

RenderText_PostDeathSaveOptions:
|0EC455| LDA.b #$03 ; MESSAGE 0003
|0EC457| STA.w $1CF0

|0EC45A| LDA.b #$00
|0EC45C| STA.w $1CF1

|0EC45F| LDX.b #$00
|0EC461| JSR RenderText_Initialize_IgnoreAttract

|0EC464| LDA.b #$E8
|0EC466| STA.w $1CD2

|0EC469| LDA.b #$61
|0EC46B| STA.w $1CD3

|0EC46E| LDA.b #$02
|0EC470| STA.w $1CD4

|0EC473| JSR RenderText_Draw
|0EC476| JSR RenderText_Draw
|0EC479| JSR RenderText_Draw
|0EC47C| JSR RenderText_Draw
|0EC47F| JSR RenderText_Draw

|0EC482| RTS

;===================================================================================================

RenderText_Initialize:
|0EC483| LDA.b $10
|0EC485| CMP.b #$14
|0EC487| BNE .not_attract_mode

|0EC489| JSL ResetHUDPalettes4and5

.not_attract_mode
|0EC48D| JSL DecompressAttractPlaques

|0EC491| LDX.b #$00

;===================================================================================================

RenderText_Initialize_IgnoreAttract:
|0EC493| LDA.w RenderText_InitialSettings,X
|0EC496| STA.w $1CD0,X

|0EC499| INX
|0EC49A| CPX.b #$20
|0EC49C| BCC RenderText_Initialize_IgnoreAttract

;---------------------------------------------------------------------------------------------------

|0EC49E| JSR RenderText_InitializeVWF
|0EC4A1| JSR RenderText_SetDefaultWindowPosition

|0EC4A4| REP #$30

|0EC4A6| LDA.w #$387F
|0EC4A9| AND.w #$FF00
|0EC4AC| ORA.w #$0180
|0EC4AF| STA.w $1CE2

|0EC4B2| SEP #$30

|0EC4B4| JSR RenderText_ParseMessage
|0EC4B7| JSR RenderText_EmptyBuffer

|0EC4BA| REP #$30

|0EC4BC| STZ.w $1CD9

|0EC4BF| SEP #$30

|0EC4C1| LDA.b #$02
|0EC4C3| STA.b $17
|0EC4C5| STA.w $0710

|0EC4C8| RTS

;===================================================================================================

RenderText_InitializeVWF:
|0EC4C9| STZ.w $0722
|0EC4CC| STZ.w $0723
|0EC4CF| STZ.w $0720
|0EC4D2| STZ.w $0721

|0EC4D5| STZ.w $0724
|0EC4D8| STZ.w $0725
|0EC4DB| STZ.w $0726
|0EC4DE| STZ.w $0727

|0EC4E1| RTS

;===================================================================================================

RenderText_ParseMessage:
|0EC4E2| REP #$30

|0EC4E4| LDA.w $1CF0
|0EC4E7| ASL A
|0EC4E8| ADC.w $1CF0
|0EC4EB| TAX

|0EC4EC| LDA.l $7F71C0,X
|0EC4F0| STA.b $04

|0EC4F2| LDA.l $7F71C2,X
|0EC4F6| STA.b $06

|0EC4F8| LDA.w #$7F7F ; initialize with a terminator for failsafe
|0EC4FB| STA.l $7F1200

|0EC4FF| LDY.w #$0000
|0EC502| TYX

|0EC503| STY.w $1CD9
|0EC506| STY.w $1CDD

|0EC509| SEP #$20

;---------------------------------------------------------------------------------------------------

.next_byte
|0EC50B| LDA.b [$04],Y
|0EC50D| BMI .word_lookup

|0EC50F| CMP.b #$67
|0EC511| BCS .command

|0EC513| STA.l $7F1200,X

|0EC517| INY
|0EC518| STY.w $1CDD

|0EC51B| INX
|0EC51C| STX.w $1CD9

|0EC51F| BRA .next_byte

;---------------------------------------------------------------------------------------------------

.command
|0EC521| CMP.b #$7F
|0EC523| BEQ .end_of_message

|0EC525| JSR RenderText_ExecuteCommand

|0EC528| LDX.w $1CD9
|0EC52B| LDY.w $1CDD
|0EC52E| BRA .next_byte

.word_lookup
|0EC530| SEC
|0EC531| SBC.b #$88
|0EC533| JSR RenderText_LookupWord

|0EC536| LDX.w $1CD9
|0EC539| LDY.w $1CDD
|0EC53C| BRA .next_byte

.end_of_message
|0EC53E| LDA.b #$7F
|0EC540| STA.l $7F1200,X

|0EC544| SEP #$30

|0EC546| RTS

;---------------------------------------------------------------------------------------------------

RenderText_ExecuteCommand:
|0EC547| SEP #$31

|0EC549| SBC.b #$67
|0EC54B| JSL JumpTableLocal
|0EC54F| dw ParseText_IgnoreCommand         ; 0x67
|0EC551| dw ParseText_IgnoreCommand         ; 0x68
|0EC553| dw ParseText_IgnoreCommand         ; 0x69
|0EC555| dw ParseText_WritePlayerName       ; 0x6A
|0EC557| dw ParseText_SetWindowType         ; 0x6B
|0EC559| dw ParseText_WriteBCD              ; 0x6C
|0EC55B| dw ParseText_SetWindowPosition     ; 0x6D
|0EC55D| dw ParseText_IgnoreParameter       ; 0x6E
|0EC55F| dw ParseText_IgnoreCommand         ; 0x6F
|0EC561| dw ParseText_IgnoreCommand         ; 0x70
|0EC563| dw ParseText_IgnoreCommand         ; 0x71
|0EC565| dw ParseText_IgnoreCommand         ; 0x72
|0EC567| dw ParseText_IgnoreCommand         ; 0x73
|0EC569| dw ParseText_IgnoreCommand         ; 0x74
|0EC56B| dw ParseText_IgnoreCommand         ; 0x75
|0EC56D| dw ParseText_IgnoreCommand         ; 0x76
|0EC56F| dw ParseText_SetColor              ; 0x77
|0EC571| dw ParseText_IgnoreParameter       ; 0x78
|0EC573| dw ParseText_IgnoreParameter       ; 0x79
|0EC575| dw ParseText_IgnoreParameter       ; 0x7A
|0EC577| dw ParseText_IgnoreCommand         ; 0x7B
|0EC579| dw ParseText_IgnoreCommand         ; 0x7C
|0EC57B| dw ParseText_IgnoreCommand         ; 0x7D
|0EC57D| dw ParseText_IgnoreCommand         ; 0x7E
|0EC57F| dw ParseText_IgnoreCommand         ; 0x7F

;===================================================================================================

ParseText_IgnoreCommand:
|0EC581| REP #$10

|0EC583| LDX.w $1CD9
|0EC586| LDY.w $1CDD

|0EC589| LDA.b [$04],Y
|0EC58B| STA.l $7F1200,X

|0EC58F| INY

|0EC590| INX
|0EC591| STX.w $1CD9

|0EC594| STY.w $1CDD

|0EC597| RTS

;===================================================================================================

ParseText_IgnoreParameter:
|0EC598| REP #$30

|0EC59A| LDX.w $1CD9
|0EC59D| LDY.w $1CDD

|0EC5A0| LDA.b [$04],Y
|0EC5A2| STA.l $7F1200,X

|0EC5A6| INY
|0EC5A7| INY

|0EC5A8| INX
|0EC5A9| INX
|0EC5AA| STX.w $1CD9

|0EC5AD| STY.w $1CDD

|0EC5B0| SEP #$20

|0EC5B2| RTS

;===================================================================================================

ParseText_WritePlayerName:
|0EC5B3| REP #$30

|0EC5B5| LDA.l $701FFE
|0EC5B9| TAX

|0EC5BA| LDA.l SaveFileOffsets,X
|0EC5BE| TAX

|0EC5BF| LDY.w #$0000

;---------------------------------------------------------------------------------------------------

.not_terminator_a
|0EC5C2| LDA.l $7003D9,X
|0EC5C6| PHA

|0EC5C7| AND.w #$000F
|0EC5CA| STA.w $0008,Y

|0EC5CD| PLA
|0EC5CE| LSR A
|0EC5CF| AND.w #$FFF0
|0EC5D2| ORA.w $0008,Y
|0EC5D5| STA.w $0008,Y

|0EC5D8| INX
|0EC5D9| INX

|0EC5DA| INY
|0EC5DB| CPY.w #$0006
|0EC5DE| BCC .not_terminator_a

;---------------------------------------------------------------------------------------------------

|0EC5E0| SEP #$20

|0EC5E2| LDY.w #$0000

.not_terminator_b
|0EC5E5| LDA.w $0008,Y
|0EC5E8| JSR RenderText_FilterName
|0EC5EB| STA.w $0008,Y

|0EC5EE| INY
|0EC5EF| CPY.w #$0006
|0EC5F2| BCC .not_terminator_b

;---------------------------------------------------------------------------------------------------

|0EC5F4| REP #$30

|0EC5F6| LDA.w $1CD9
|0EC5F9| CLC
|0EC5FA| ADC.w #$0006
|0EC5FD| TAX

|0EC5FE| INC.w $1CDD

|0EC601| SEP #$20

|0EC603| LDA.b $08
|0EC605| STA.l $7F11FA,X

|0EC609| LDA.b $09
|0EC60B| STA.l $7F11FB,X

|0EC60F| LDA.b $0A
|0EC611| STA.l $7F11FC,X

|0EC615| LDA.b $0B
|0EC617| STA.l $7F11FD,X

|0EC61B| LDA.b $0C
|0EC61D| STA.l $7F11FE,X

|0EC621| LDA.b $0D
|0EC623| STA.l $7F11FF,X

;---------------------------------------------------------------------------------------------------

|0EC627| LDY.w #$0005

.next
|0EC62A| LDA.w $0008,Y
|0EC62D| CMP.b #$59
|0EC62F| BNE .done

|0EC631| DEX

|0EC632| DEY
|0EC633| BPL .next

;---------------------------------------------------------------------------------------------------

.done
|0EC635| STX.w $1CD9

|0EC638| RTS

;===================================================================================================
; I hate this thing...
;===================================================================================================
RenderText_FilterName:
|0EC639| CMP.b #$5F ; legit characters
|0EC63B| BCC .exit

|0EC63D| CMP.b #$76
|0EC63F| BCS .encode_lower

|0EC641| CMP.b #$5F
|0EC643| BNE .not_this

|0EC645| LDA.b #$08 ; uppercase I

.not_this
|0EC647| CMP.b #$60
|0EC649| BNE .nor_this

|0EC64B| LDA.b #$22 ; lowercase i

.nor_this
|0EC64D| CMP.b #$61
|0EC64F| BNE .exit

|0EC651| LDA.b #$3E ; exclamation point !

.exit
|0EC653| RTS

.encode_lower
|0EC654| SBC.b #$42

|0EC656| RTS

;===================================================================================================

ParseText_SetWindowType:
|0EC657| REP #$10

|0EC659| LDY.w $1CDD
|0EC65C| INY

|0EC65D| LDA.b [$04],Y
|0EC65F| STA.w $1CD4

|0EC662| INY
|0EC663| STY.w $1CDD

|0EC666| RTS

;===================================================================================================

ParseText_WriteBCD:
|0EC667| REP #$30

|0EC669| LDX.w $1CD9
|0EC66C| LDY.w $1CDD

|0EC66F| LDA.b [$04],Y

|0EC671| INY
|0EC672| INY
|0EC673| STY.w $1CDD

|0EC676| XBA
|0EC677| AND.w #$00FF
|0EC67A| LSR A
|0EC67B| PHP

|0EC67C| TAY
|0EC67D| LDA.w $1CF2,Y

|0EC680| PLP
|0EC681| BCC .low_nibble

|0EC683| LSR A
|0EC684| LSR A
|0EC685| LSR A
|0EC686| LSR A

.low_nibble
|0EC687| AND.w #$000F
|0EC68A| CLC
|0EC68B| ADC.w #$0004
|0EC68E| ORA.w #$0030
|0EC691| STA.l $7F1200,X

|0EC695| INX
|0EC696| STX.w $1CD9

|0EC699| SEP #$20

|0EC69B| RTS

;===================================================================================================

ParseText_SetWindowPosition:
|0EC69C| REP #$30

|0EC69E| LDY.w $1CDD
|0EC6A1| INY

|0EC6A2| LDA.b [$04],Y
|0EC6A4| AND.w #$00FF
|0EC6A7| ASL A
|0EC6A8| TAX

|0EC6A9| LDA.w RenderText_TextPosition,X

|0EC6AC| STA.w $1CD2

|0EC6AF| INY
|0EC6B0| STY.w $1CDD

|0EC6B3| SEP #$20

|0EC6B5| RTS

;===================================================================================================

ParseText_SetColor:
|0EC6B6| REP #$30

|0EC6B8| LDY.w $1CDD

|0EC6BB| LDA.b [$04],Y
|0EC6BD| ASL A
|0EC6BE| ASL A
|0EC6BF| AND.w #$3C00
|0EC6C2| STA.b $00

|0EC6C4| LDA.w #$387F
|0EC6C7| AND.w #$E300
|0EC6CA| ORA.w #$0180
|0EC6CD| ORA.b $00
|0EC6CF| STA.w $1CE2

|0EC6D2| INY
|0EC6D3| INY
|0EC6D4| STY.w $1CDD

|0EC6D7| SEP #$20

|0EC6D9| RTS

;===================================================================================================

RenderText_LookupWord:
|0EC6DA| REP #$30

|0EC6DC| INC.w $1CDD

|0EC6DF| LDX.w $1CD9
|0EC6E2| ASL A
|0EC6E3| AND.w #$00FF
|0EC6E6| TAY

|0EC6E7| LDA.w WordDictionary+2,Y
|0EC6EA| STA.b $00

|0EC6EC| LDA.w WordDictionary+0,Y
|0EC6EF| TAY

|0EC6F0| SEP #$20

;---------------------------------------------------------------------------------------------------

.next
|0EC6F2| LDA.w $0000,Y
|0EC6F5| STA.l $7F1200,X

|0EC6F9| INX

|0EC6FA| INY
|0EC6FB| CPY.b $00
|0EC6FD| BCC .next

;---------------------------------------------------------------------------------------------------

|0EC6FF| STX.w $1CD9

|0EC702| RTS

;===================================================================================================

WordDictionary:
|0EC703| dw .entry_00
|0EC705| dw .entry_01
|0EC707| dw .entry_02
|0EC709| dw .entry_03
|0EC70B| dw .entry_04
|0EC70D| dw .entry_05
|0EC70F| dw .entry_06
|0EC711| dw .entry_07
|0EC713| dw .entry_08
|0EC715| dw .entry_09
|0EC717| dw .entry_0A
|0EC719| dw .entry_0B
|0EC71B| dw .entry_0C
|0EC71D| dw .entry_0D
|0EC71F| dw .entry_0E
|0EC721| dw .entry_0F
|0EC723| dw .entry_10
|0EC725| dw .entry_11
|0EC727| dw .entry_12
|0EC729| dw .entry_13
|0EC72B| dw .entry_14
|0EC72D| dw .entry_15
|0EC72F| dw .entry_16
|0EC731| dw .entry_17
|0EC733| dw .entry_18
|0EC735| dw .entry_19
|0EC737| dw .entry_1A
|0EC739| dw .entry_1B
|0EC73B| dw .entry_1C
|0EC73D| dw .entry_1D
|0EC73F| dw .entry_1E
|0EC741| dw .entry_1F
|0EC743| dw .entry_20
|0EC745| dw .entry_21
|0EC747| dw .entry_22
|0EC749| dw .entry_23
|0EC74B| dw .entry_24
|0EC74D| dw .entry_25
|0EC74F| dw .entry_26
|0EC751| dw .entry_27
|0EC753| dw .entry_28
|0EC755| dw .entry_29
|0EC757| dw .entry_2A
|0EC759| dw .entry_2B
|0EC75B| dw .entry_2C
|0EC75D| dw .entry_2D
|0EC75F| dw .entry_2E
|0EC761| dw .entry_2F
|0EC763| dw .entry_30
|0EC765| dw .entry_31
|0EC767| dw .entry_32
|0EC769| dw .entry_33
|0EC76B| dw .entry_34
|0EC76D| dw .entry_35
|0EC76F| dw .entry_36
|0EC771| dw .entry_37
|0EC773| dw .entry_38
|0EC775| dw .entry_39
|0EC777| dw .entry_3A
|0EC779| dw .entry_3B
|0EC77B| dw .entry_3C
|0EC77D| dw .entry_3D
|0EC77F| dw .entry_3E
|0EC781| dw .entry_3F
|0EC783| dw .entry_40
|0EC785| dw .entry_41
|0EC787| dw .entry_42
|0EC789| dw .entry_43
|0EC78B| dw .entry_44
|0EC78D| dw .entry_45
|0EC78F| dw .entry_46
|0EC791| dw .entry_47
|0EC793| dw .entry_48
|0EC795| dw .entry_49
|0EC797| dw .entry_4A
|0EC799| dw .entry_4B
|0EC79B| dw .entry_4C
|0EC79D| dw .entry_4D
|0EC79F| dw .entry_4E
|0EC7A1| dw .entry_4F
|0EC7A3| dw .entry_50
|0EC7A5| dw .entry_51
|0EC7A7| dw .entry_52
|0EC7A9| dw .entry_53
|0EC7AB| dw .entry_54
|0EC7AD| dw .entry_55
|0EC7AF| dw .entry_56
|0EC7B1| dw .entry_57
|0EC7B3| dw .entry_58
|0EC7B5| dw .entry_59
|0EC7B7| dw .entry_5A
|0EC7B9| dw .entry_5B
|0EC7BB| dw .entry_5C
|0EC7BD| dw .entry_5D
|0EC7BF| dw .entry_5E
|0EC7C1| dw .entry_5F
|0EC7C3| dw .entry_60
|0EC7C5| dw .end

;---------------------------------------------------------------------------------------------------

.entry_00
|0EC7C7| db $59, $59, $59, $59 ; ⎵⎵⎵⎵

.entry_01
|0EC7CB| db $59, $59, $59 ; ⎵⎵⎵

.entry_02
|0EC7CE| db $59, $59 ; ⎵⎵

.entry_03
|0EC7D0| db $51, $2C, $59 ; 's⎵

.entry_04
|0EC7D3| db $1A, $27, $1D, $59 ; and⎵

.entry_05
|0EC7D7| db $1A, $2B, $1E, $59 ; are⎵

.entry_06
|0EC7DB| db $1A, $25, $25, $59 ; all⎵

.entry_07
|0EC7DF| db $1A, $22, $27 ; ain

.entry_08
|0EC7E2| db $1A, $27, $1D ; and

.entry_09
|0EC7E5| db $1A, $2D, $59 ; at⎵

.entry_0A
|0EC7E8| db $1A, $2C, $2D ; ast

.entry_0B
|0EC7EB| db $1A, $27 ; an

.entry_0C
|0EC7ED| db $1A, $2D ; at

.entry_0D
|0EC7EF| db $1B, $25, $1E ; ble

.entry_0E
|0EC7F2| db $1B, $1A ; ba

.entry_0F
|0EC7F4| db $1B, $1E ; be

.entry_10
|0EC7F6| db $1B, $28 ; bo

.entry_11
|0EC7F8| db $1C, $1A, $27, $59 ; can⎵

.entry_12
|0EC7FC| db $1C, $21, $1E ; che

.entry_13
|0EC7FF| db $1C, $28, $26 ; com

.entry_14
|0EC802| db $1C, $24 ; ck

.entry_15
|0EC804| db $1D, $1E, $2C ; des

.entry_16
|0EC807| db $1D, $22 ; di

.entry_17
|0EC809| db $1D, $28 ; do

.entry_18
|0EC80B| db $1E, $27, $59 ; en⎵

.entry_19
|0EC80E| db $1E, $2B, $59 ; er⎵

.entry_1A
|0EC811| db $1E, $1A, $2B ; ear

.entry_1B
|0EC814| db $1E, $27, $2D ; ent

.entry_1C
|0EC817| db $1E, $1D, $59 ; ed⎵

.entry_1D
|0EC81A| db $1E, $27 ; en

.entry_1E
|0EC81C| db $1E, $2B ; er

.entry_1F
|0EC81E| db $1E, $2F ; ev

.entry_20
|0EC820| db $1F, $28, $2B ; for

.entry_21
|0EC823| db $1F, $2B, $28 ; fro

.entry_22
|0EC826| db $20, $22, $2F, $1E, $59 ; give⎵

.entry_23
|0EC82B| db $20, $1E, $2D ; get

.entry_24
|0EC82E| db $20, $28 ; go

.entry_25
|0EC830| db $21, $1A, $2F, $1E ; have

.entry_26
|0EC834| db $21, $1A, $2C ; has

.entry_27
|0EC837| db $21, $1E, $2B ; her

.entry_28
|0EC83A| db $21, $22 ; hi

.entry_29
|0EC83C| db $21, $1A ; ha

.entry_2A
|0EC83E| db $22, $20, $21, $2D, $59 ; ight⎵

.entry_2B
|0EC843| db $22, $27, $20, $59 ; ing⎵

.entry_2C
|0EC847| db $22, $27 ; in

.entry_2D
|0EC849| db $22, $2C ; is

.entry_2E
|0EC84B| db $22, $2D ; it

.entry_2F
|0EC84D| db $23, $2E, $2C, $2D ; just

.entry_30
|0EC851| db $24, $27, $28, $30 ; know

.entry_31
|0EC855| db $25, $32, $59 ; ly⎵

.entry_32
|0EC858| db $25, $1A ; la

.entry_33
|0EC85A| db $25, $28 ; lo

.entry_34
|0EC85C| db $26, $1A, $27 ; man

.entry_35
|0EC85F| db $26, $1A ; ma

.entry_36
|0EC861| db $26, $1E ; me

.entry_37
|0EC863| db $26, $2E ; mu

.entry_38
|0EC865| db $27, $51, $2D, $59 ; n't⎵

.entry_39
|0EC869| db $27, $28, $27 ; non

.entry_3A
|0EC86C| db $27, $28, $2D ; not

.entry_3B
|0EC86F| db $28, $29, $1E, $27 ; open

.entry_3C
|0EC873| db $28, $2E, $27, $1D ; ound

.entry_3D
|0EC877| db $28, $2E, $2D, $59 ; out⎵

.entry_3E
|0EC87B| db $28, $1F ; of

.entry_3F
|0EC87D| db $28, $27 ; on

.entry_40
|0EC87F| db $28, $2B ; or

.entry_41
|0EC881| db $29, $1E, $2B ; per

.entry_42
|0EC884| db $29, $25, $1E ; ple

.entry_43
|0EC887| db $29, $28, $30 ; pow

.entry_44
|0EC88A| db $29, $2B, $28 ; pro

.entry_45
|0EC88D| db $2B, $1E, $59 ; re⎵

.entry_46
|0EC890| db $2B, $1E ; re

.entry_47
|0EC892| db $2C, $28, $26, $1E ; some

.entry_48
|0EC896| db $2C, $1E ; se

.entry_49
|0EC898| db $2C, $21 ; sh

.entry_4A
|0EC89A| db $2C, $28 ; so

.entry_4B
|0EC89C| db $2C, $2D ; st

.entry_4C
|0EC89E| db $2D, $1E, $2B, $59 ; ter⎵

.entry_4D
|0EC8A2| db $2D, $21, $22, $27 ; thin

.entry_4E
|0EC8A6| db $2D, $1E, $2B ; ter

.entry_4F
|0EC8A9| db $2D, $21, $1A ; tha

.entry_50
|0EC8AC| db $2D, $21, $1E ; the

.entry_51
|0EC8AF| db $2D, $21, $22 ; thi

.entry_52
|0EC8B2| db $2D, $28 ; to

.entry_53
|0EC8B4| db $2D, $2B ; tr

.entry_54
|0EC8B6| db $2E, $29 ; up

.entry_55
|0EC8B8| db $2F, $1E, $2B ; ver

.entry_56
|0EC8BB| db $30, $22, $2D, $21 ; with

.entry_57
|0EC8BF| db $30, $1A ; wa

.entry_58
|0EC8C1| db $30, $1E ; we

.entry_59
|0EC8C3| db $30, $21 ; wh

.entry_5A
|0EC8C5| db $30, $22 ; wi

.entry_5B
|0EC8C7| db $32, $28, $2E ; you

.entry_5C
|0EC8CA| db $07, $1E, $2B ; Her

.entry_5D
|0EC8CD| db $13, $21, $1A ; Tha

.entry_5E
|0EC8D0| db $13, $21, $1E ; The

.entry_5F
|0EC8D3| db $13, $21, $22 ; Thi

.entry_60
|0EC8D6| db $18, $28, $2E ; You

.end

;===================================================================================================

RenderText_Draw:
|0EC8D9| LDA.w $1CD4
|0EC8DC| JSL JumpTableLocal
|0EC8E0| dw RenderText_InitializeWindow
|0EC8E2| dw RenderText_DrawBorderEdges
|0EC8E4| dw RenderText_DrawCharacterTilemap
|0EC8E6| dw RenderText_DrawMessageCharacters
|0EC8E8| dw RenderText_FinalizeWindow

;===================================================================================================

RenderText_InitializeWindow:
|0EC8EA| JSR RenderText_SetDrawParameters
|0EC8ED| JSR RenderText_DrawBorderRow

|0EC8F0| REP #$30

|0EC8F2| LDA.w #$0006
|0EC8F5| STA.b $00

.next_row
|0EC8F7| LDY.w #$0006
|0EC8FA| JSR RenderText_DrawBorderRow

|0EC8FD| DEC.b $00
|0EC8FF| BNE .next_row

;---------------------------------------------------------------------------------------------------

|0EC901| LDY.w #$000C
|0EC904| JSR RenderText_DrawBorderRow

|0EC907| LDA.w #$FFFF
|0EC90A| STA.w $1002,X

|0EC90D| SEP #$30

|0EC90F| LDA.b #$01
|0EC911| STA.b $14

|0EC913| LDA.b #$02
|0EC915| STA.w $1CD4

|0EC918| RTS

;===================================================================================================

RenderText_DrawBorderEdges:
|0EC919| LDA.b #$01
|0EC91B| STA.b $14

|0EC91D| LDA.w $1CD7
|0EC920| BEQ .continue

|0EC922| CMP.b #$07
|0EC924| BCC .option_1

|0EC926| LDA.b #$02
|0EC928| BRA .continue

.option_1
|0EC92A| LDA.b #$01

.continue
|0EC92C| JSL JumpTableLocal
|0EC930| dw RenderText_DrawBorderEdgeTop
|0EC932| dw RenderText_DrawBorderEdgeMiddle
|0EC934| dw RenderText_DrawBorderEdgeBottom

;===================================================================================================

RenderText_DrawBorderEdgeTop:
|0EC936| REP #$30

|0EC938| JSR RenderText_SetDrawParameters
|0EC93B| JSR RenderText_DrawBorderRow

|0EC93E| LDA.w #$FFFF
|0EC941| STA.w $1002,X

|0EC944| SEP #$30

|0EC946| INC.w $1CD7

|0EC949| RTS

;===================================================================================================

RenderText_DrawBorderEdgeMiddle:
|0EC94A| REP #$30

|0EC94C| LDX.w #$0000
|0EC94F| LDY.w #$0006
|0EC952| JSR RenderText_DrawBorderRow

|0EC955| LDA.w #$FFFF
|0EC958| STA.w $1002,X

|0EC95B| SEP #$30

|0EC95D| INC.w $1CD7

|0EC960| RTS

;===================================================================================================

RenderText_DrawBorderEdgeBottom:
|0EC961| REP #$30

|0EC963| LDX.w #$0000
|0EC966| LDY.w #$000C
|0EC969| JSR RenderText_DrawBorderRow

|0EC96C| LDA.w #$FFFF
|0EC96F| STA.w $1002,X

|0EC972| SEP #$30

|0EC974| INC.w $1CD7

|0EC977| LDA.b #$02
|0EC979| STA.w $1CD4

|0EC97C| RTS

;===================================================================================================

RenderText_DrawCharacterTilemap:
|0EC97D| JSR RenderText_BuildCharacterTilemap

|0EC980| INC.w $1CD4

|0EC983| RTS

;===================================================================================================

RenderText_DrawMessageCharacters:
|0EC984| REP #$30

|0EC986| LDA.w $1CDD

|0EC989| LDY.w #$0000

|0EC98C| CMP.w #$0063
|0EC98F| BCC .under_99

|0EC991| LDA.w #$0000
|0EC994| STY.w $1CE6

|0EC997| BRA .continue

;---------------------------------------------------------------------------------------------------

.under_99
|0EC999| CMP.w #$003B
|0EC99C| BCC .under_59

|0EC99E| CMP.w #$0050
|0EC9A1| BCS .under_59

|0EC9A3| LDA.w #$0050
|0EC9A6| STY.w $1CE6
|0EC9A9| BRA .continue

;---------------------------------------------------------------------------------------------------

.under_59
|0EC9AB| CMP.w #$0013 ; 19
|0EC9AE| BCC .continue

|0EC9B0| CMP.w #$0028 ; 40
|0EC9B3| BCS .continue

|0EC9B5| LDA.w #$0028
|0EC9B8| STY.w $1CE6

;---------------------------------------------------------------------------------------------------

.continue
|0EC9BB| STA.w $1CDD

|0EC9BE| CMP.w #$0012
|0EC9C1| BEQ .is_18_or_58

|0EC9C3| CMP.w #$003A
|0EC9C6| BEQ .is_18_or_58

|0EC9C8| CMP.w #$0062
|0EC9CB| BNE .dont_add_to_line

.is_18_or_58
|0EC9CD| LDA.w $1CE6
|0EC9D0| AND.w #$0007
|0EC9D3| CMP.w #$0006
|0EC9D6| BCC .dont_add_to_line

|0EC9D8| INC.w $1CDD

|0EC9DB| BRA RenderText_DrawMessageCharacters

;---------------------------------------------------------------------------------------------------

.dont_add_to_line
|0EC9DD| LDX.w $1CD9

|0EC9E0| LDA.l $7F1200,X
|0EC9E4| AND.w #$007F
|0EC9E7| SEC
|0EC9E8| SBC.w #$0066
|0EC9EB| BPL .didnt_overflow

|0EC9ED| LDA.w #$0000

.didnt_overflow
|0EC9F0| SEP #$30

|0EC9F2| JSR RenderText_HandleNextDraw

|0EC9F5| LDA.b #$02
|0EC9F7| STA.b $17
|0EC9F9| STA.w $0710

|0EC9FC| RTS

;===================================================================================================

RenderText_HandleNextDraw:
|0EC9FD| JSL JumpTableLocal
|0ECA01| dw RenderText_DrawCharacter            ; 0x66
|0ECA03| dw RenderText_NextImage                ; 0x67
|0ECA05| dw RenderText_Choose2LowOr3            ; 0x68
|0ECA07| dw RenderText_ChooseItem               ; 0x69
|0ECA09| dw RenderText_IgnoreThis               ; 0x6A
|0ECA0B| dw RenderText_IgnoreThis               ; 0x6B
|0ECA0D| dw RenderText_IgnoreThis               ; 0x6C
|0ECA0F| dw RenderText_IgnoreThis               ; 0x6D
|0ECA11| dw RenderText_IgnoreThis               ; 0x6E
|0ECA13| dw RenderText_Choose2HighOr3           ; 0x6F
|0ECA15| dw Choose3_ArrowMessageID              ; 0x70 - bad pointer, but correct
|0ECA17| dw RenderText_Choose3                  ; 0x71
|0ECA19| dw RenderText_Choose1or2               ; 0x72
|0ECA1B| dw RenderText_ScrollText               ; 0x73
|0ECA1D| dw RenderText_SetLine                  ; 0x74
|0ECA1F| dw RenderText_SetLine                  ; 0x75
|0ECA21| dw RenderText_SetLine                  ; 0x76
|0ECA23| dw RenderText_SetColor                 ; 0x77
|0ECA25| dw RenderText_Wait                     ; 0x78
|0ECA27| dw RenderText_PlaySFX                  ; 0x79
|0ECA29| dw RenderText_SetSpeed                 ; 0x7A
|0ECA2B| dw RenderText_Command7B                ; 0x7B
|0ECA2D| dw RenderText_Command7C                ; 0x7C
|0ECA2F| dw RenderText_EmptyBuffer              ; 0x7D
|0ECA31| dw RenderText_PauseForInput            ; 0x7E
|0ECA33| dw RenderText_Terminate                ; 0x7F

;===================================================================================================

RenderText_FinalizeWindow:
|0ECA35| REP #$30

|0ECA37| JSR RenderText_SetDrawParameters

|0ECA3A| REP #$30

|0ECA3C| LDA.w $1CD0
|0ECA3F| XBA
|0ECA40| STA.w $1002,X

|0ECA43| INX
|0ECA44| INX

|0ECA45| LDA.w RenderText_ClearStripeDRILL
|0ECA48| STA.w $1002,X

|0ECA4B| INX
|0ECA4C| INX

|0ECA4D| LDA.w RenderText_ClearTileFill
|0ECA50| STA.w $1002,X

|0ECA53| INX
|0ECA54| INX

|0ECA55| LDA.w #$FFFF
|0ECA58| STA.w $1002,X

|0ECA5B| SEP #$30

|0ECA5D| LDA.b #$01
|0ECA5F| STA.b $14

|0ECA61| STZ.w $1CD8

|0ECA64| STZ.b $11

|0ECA66| LDA.w $010C
|0ECA69| STA.b $10

|0ECA6B| RTS

;===================================================================================================

RenderText_DrawCharacter:
|0ECA6C| LDA.w $1CD5
|0ECA6F| CMP.b #$02
|0ECA71| BCC .dont_force

|0ECA73| LDA.b #$02

.dont_force
|0ECA75| JSL JumpTableLocal
|0ECA79| dw RenderText_DrawAllCharacters
|0ECA7B| dw RenderText_DrawSingleCharacter
|0ECA7D| dw RenderText_TickDownDrawDelay
|0ECA7F| dw RenderText_NullCharacterDraw
|0ECA81| dw RenderText_NullCharacterDraw
|0ECA83| dw RenderText_NullCharacterDraw
|0ECA85| dw RenderText_NullCharacterDraw
|0ECA87| dw RenderText_NullCharacterDraw
|0ECA89| dw RenderText_NullCharacterDraw
|0ECA8B| dw RenderText_NullCharacterDraw
|0ECA8D| dw RenderText_NullCharacterDraw
|0ECA8F| dw RenderText_NullCharacterDraw
|0ECA91| dw RenderText_NullCharacterDraw
|0ECA93| dw RenderText_NullCharacterDraw
|0ECA95| dw RenderText_NullCharacterDraw
|0ECA97| dw RenderText_NullCharacterDraw

;===================================================================================================

RenderText_DrawAllCharacters:
|0ECA99| JSR RenderText_DrawSingleCharacter

|0ECA9C| REP #$30

|0ECA9E| LDA.w $1CDD
|0ECAA1| CMP.w #$0013
|0ECAA4| BEQ .exit

|0ECAA6| CMP.w #$003B
|0ECAA9| BEQ .exit

|0ECAAB| CMP.w #$0063
|0ECAAE| BEQ .exit

|0ECAB0| SEP #$30

|0ECAB2| JMP.w RenderText_DrawMessageCharacters

.exit
|0ECAB5| SEP #$30

|0ECAB7| RTS

;===================================================================================================

RenderText_DrawSingleCharacter:
|0ECAB8| REP #$10

|0ECABA| LDX.w $1CD9

|0ECABD| LDA.l $7F1200,X
|0ECAC1| CMP.b #$59
|0ECAC3| BEQ .space

|0ECAC5| SEP #$30

|0ECAC7| LDA.b #$0C ; SFX3.0C
|0ECAC9| STA.w $012F

.space
|0ECACC| REP #$30 ; THIS DOESN'T DO ANYTHIIIIIIIIIIIING

|0ECACE| LDA.w $1CDD
|0ECAD1| ASL A
|0ECAD2| TAX

|0ECAD3| SEP #$30

|0ECAD5| JSR RenderText_PerformVWFing

|0ECAD8| LDA.w $1CD6
|0ECADB| STA.w $1CD5

|0ECADE| RTS

;===================================================================================================

pool RenderText_PerformVWFing

.width
;             A   B   C   D   E   F   G   H   I
|0ECADF| db   6,  6,  6,  6,  6,  6,  6,  6,  3

;             J   K   L   M   N   O   P   Q   R
|0ECAE8| db   6,  6,  6,  7,  6,  6,  6,  6,  6

;             S   T   U   V   W   X   Y   Z
|0ECAF1| db   6,  7,  6,  7,  7,  7,  7,  6

;             a   b   c   d   e   f   g   h   i
|0ECAF9| db   6,  6,  6,  6,  6,  6,  6,  6,  3

;             j   k   l   m   n   o   p   q   r
|0ECB02| db   5,  6,  3,  7,  6,  6,  6,  6,  5

;             s   t   u   v   w   x   y   z
|0ECB0B| db   6,  6,  6,  7,  7,  7,  7,  6

;             0   1   2   3   4   5   6   7   8   9
|0ECB13| db   6,  4,  6,  6,  6,  6,  6,  6,  6,  6

;             !   ?   -   .   ,   …
|0ECB1D| db   3,  7,  6,  4,  4,  6

;             >   (   )   ☥   𓈗   Ƨ  LINKFACE
|0ECB23| db   8,  6,  6,  6,  6,  6,  8,  8

;             "   ↑   ↓   ←   →   '
|0ECB2B| db   8,  7,  7,  7,  7,  4

;  hearts     1L  2L  ER  3L  3R  4L  4R
|0ECB31| db   8,  8,  8,  8,  8,  8,  8

;              ⎵  <   Ⓐ   Ⓑ  ⓧ   ⓨ
|0ECB38| db   4,  8,  8,  8,  8,  8

;             I   i   !  ⎵
|0ECB3E| db   8,  8,  8,  4

;---------------------------------------------------------------------------------------------------

.masks_on
|0ECB42| db $80, $40, $20, $10, $08, $04, $02, $01

.render_offsets
|0ECB4A| dw $0000, $02A0, $0540

.line_offsets
|0ECB50| dw $0000, $0040, $0080

.masks_off
|0ECB56| db $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

endpool

;---------------------------------------------------------------------------------------------------

RenderText_PerformVWFing:
|0ECB5E| SEP #$30

|0ECB60| PHB
|0ECB61| PHK
|0ECB62| PLB

|0ECB63| REP #$20

|0ECB65| LDA.w $0720
|0ECB68| BEQ .same_row

|0ECB6A| LDY.w $0722

|0ECB6D| LDA.w .render_offsets,Y
|0ECB70| STA.w $0726

|0ECB73| LDA.w .line_offsets,Y
|0ECB76| STA.w $0724

|0ECB79| STZ.w $0720

;---------------------------------------------------------------------------------------------------

.same_row
|0ECB7C| SEP #$20
|0ECB7E| REP #$10

|0ECB80| STZ.b $03

|0ECB82| LDX.w $1CD9
|0ECB85| LDA.l $7F1200,X

|0ECB89| SEP #$10

|0ECB8B| TAY

|0ECB8C| LDA.w .width,Y
|0ECB8F| STA.b $02

|0ECB91| LDX.w $0724
|0ECB94| CLC
|0ECB95| ADC.l $7EC230,X
|0ECB99| STA.l $7EC231,X

|0ECB9D| INX
|0ECB9E| STX.w $0724

|0ECBA1| TYA
|0ECBA2| AND.b #$F0
|0ECBA4| ASL A
|0ECBA5| STA.b $00

|0ECBA7| TYA
|0ECBA8| AND.b #$0F
|0ECBAA| ORA.b $00
|0ECBAC| STA.b $0A

|0ECBAE| STZ.b $0B

;---------------------------------------------------------------------------------------------------

|0ECBB0| REP #$20

|0ECBB2| LDA.w #TheFont
|0ECBB5| STA.b $0D

|0ECBB7| LDY.b #^TheFont
|0ECBB9| STY.b $0F

|0ECBBB| REP #$10

|0ECBBD| LDA.l $7EC22F,X
|0ECBC1| AND.w #$00FF
|0ECBC4| ASL A
|0ECBC5| STA.b $00

|0ECBC7| LDX.w #$0000

|0ECBCA| LDA.b $0A
|0ECBCC| ASL A
|0ECBCD| ASL A
|0ECBCE| ASL A
|0ECBCF| ASL A
|0ECBD0| TAY

;---------------------------------------------------------------------------------------------------

.top_next_row
|0ECBD1| LDA.b [$0D],Y
|0ECBD3| STA.b $04

|0ECBD5| PHY

|0ECBD6| STX.b $06

|0ECBD8| LDA.b $00
|0ECBDA| CLC
|0ECBDB| ADC.w $0726
|0ECBDE| TAY

|0ECBDF| AND.w #$0FF0
|0ECBE2| CLC
|0ECBE3| ADC.b $06
|0ECBE5| TAX

|0ECBE6| TYA
|0ECBE7| LSR A
|0ECBE8| AND.w #$0007
|0ECBEB| TAY

|0ECBEC| SEP #$20

|0ECBEE| LDA.b $02
|0ECBF0| STA.b $03

.top_not_boundary
|0ECBF2| ASL.b $04
|0ECBF4| BCC .top_unset_plane_0

|0ECBF6| LDA.l $7F0000,X
|0ECBFA| EOR.w .masks_on,Y
|0ECBFD| STA.l $7F0000,X

|0ECC01| BRA .top_plane_1

.top_unset_plane_0
|0ECC03| LDA.l $7F0000,X
|0ECC07| AND.w .masks_off,Y
|0ECC0A| STA.l $7F0000,X

.top_plane_1
|0ECC0E| ASL.b $05
|0ECC10| BCC .top_unset_plane_1

|0ECC12| LDA.l $7F0001,X
|0ECC16| EOR.w .masks_on,Y
|0ECC19| STA.l $7F0001,X

|0ECC1D| BRA .top_dec_width

.top_unset_plane_1
|0ECC1F| LDA.l $7F0001,X
|0ECC23| AND.w .masks_off,Y
|0ECC26| STA.l $7F0001,X

.top_dec_width
|0ECC2A| DEC.b $03
|0ECC2C| BEQ .top_width_zero

|0ECC2E| INY
|0ECC2F| CPY.w #$0008
|0ECC32| BNE .top_not_boundary

.top_width_zero
|0ECC34| REP #$20

|0ECC36| TXA
|0ECC37| CLC
|0ECC38| ADC.w #$0010
|0ECC3B| TAX

|0ECC3C| LDA.b $04
|0ECC3E| BEQ .top_none_left

|0ECC40| STA.l $7F0000,X

.top_none_left
|0ECC44| PLY
|0ECC45| INY
|0ECC46| INY

|0ECC47| LDX.b $06
|0ECC49| INX
|0ECC4A| INX
|0ECC4B| CPX.w #$0010
|0ECC4E| BNE .top_next_row

;---------------------------------------------------------------------------------------------------

|0ECC50| LDA.w $0726
|0ECC53| CLC
|0ECC54| ADC.w #$0150
|0ECC57| STA.b $08

|0ECC59| LDX.w #$0000

|0ECC5C| LDA.b $0A
|0ECC5E| CLC
|0ECC5F| ADC.w #$0010
|0ECC62| ASL A
|0ECC63| ASL A
|0ECC64| ASL A
|0ECC65| ASL A
|0ECC66| TAY

;---------------------------------------------------------------------------------------------------

.bottom_next_row
|0ECC67| LDA.b [$0D],Y
|0ECC69| STA.b $04

|0ECC6B| PHY

|0ECC6C| STX.b $06

|0ECC6E| LDX.w $0724
|0ECC71| LDA.l $7EC22F,X
|0ECC75| AND.w #$00FF
|0ECC78| ASL A
|0ECC79| CLC
|0ECC7A| ADC.b $08
|0ECC7C| TAY

|0ECC7D| AND.w #$0FF0
|0ECC80| CLC
|0ECC81| ADC.b $06
|0ECC83| TAX

|0ECC84| TYA
|0ECC85| LSR A
|0ECC86| AND.w #$0007
|0ECC89| TAY

|0ECC8A| SEP #$20

|0ECC8C| LDA.b $02
|0ECC8E| STA.b $03

.bottom_not_boundary
|0ECC90| ASL.b $04
|0ECC92| BCC .bottom_unset_plane_0

|0ECC94| LDA.l $7F0000,X
|0ECC98| EOR.w .masks_on,Y
|0ECC9B| STA.l $7F0000,X

|0ECC9F| BRA .bottom_plane_1

.bottom_unset_plane_0
|0ECCA1| LDA.l $7F0000,X
|0ECCA5| AND.w .masks_off,Y
|0ECCA8| STA.l $7F0000,X

.bottom_plane_1
|0ECCAC| ASL.b $05
|0ECCAE| BCC .bottom_unset_plane_1

|0ECCB0| LDA.l $7F0001,X
|0ECCB4| EOR.w .masks_on,Y
|0ECCB7| STA.l $7F0001,X

|0ECCBB| BRA .bottom_dec_width

.bottom_unset_plane_1
|0ECCBD| LDA.l $7F0001,X
|0ECCC1| AND.w .masks_off,Y
|0ECCC4| STA.l $7F0001,X

.bottom_dec_width
|0ECCC8| DEC.b $03
|0ECCCA| BEQ .bottom_width_zero

|0ECCCC| INY
|0ECCCD| CPY.w #$0008
|0ECCD0| BNE .bottom_not_boundary

.bottom_width_zero
|0ECCD2| REP #$20

|0ECCD4| TXA
|0ECCD5| CLC
|0ECCD6| ADC.w #$0010
|0ECCD9| TAX

|0ECCDA| LDA.b $04
|0ECCDC| BEQ .bottom_none_left

|0ECCDE| STA.l $7F0000,X

.bottom_none_left
|0ECCE2| PLY
|0ECCE3| INY
|0ECCE4| INY

|0ECCE5| LDX.b $06
|0ECCE7| INX
|0ECCE8| INX
|0ECCE9| CPX.w #$0010
|0ECCEC| BEQ .bottom_done

|0ECCEE| BRL .bottom_next_row

;---------------------------------------------------------------------------------------------------

.bottom_done
|0ECCF1| INC.w $1CD9

|0ECCF4| SEP #$30

|0ECCF6| PLB

|0ECCF7| RTS

;===================================================================================================

UNREACHABLE_0ECCF8:
|0ECCF8| RTS

;===================================================================================================

RenderText_TickDownDrawDelay:
|0ECCF9| DEC.w $1CD5
|0ECCFC| RTS

;===================================================================================================

RenderText_NullCharacterDraw:
|0ECCFD| RTS

;===================================================================================================

RenderText_NextImage:
|0ECCFE| LDA.b $10
|0ECD00| CMP.b #$14
|0ECD02| BNE .not_attract

|0ECD04| JSL PaletteFilter_AttractPlaque

|0ECD08| LDA.l $7EC007
|0ECD0C| BNE .exit

.not_attract
|0ECD0E| REP #$30

|0ECD10| INC.w $1CD9

|0ECD13| SEP #$30

.exit
|0ECD15| RTS

;===================================================================================================

pool RenderText_Choose2LowOr3

.arrow_messages
|0ECD16| dw $0001 ; MESSAGE 0001
|0ECD18| dw $0002 ; MESSAGE 0002

endpool

;---------------------------------------------------------------------------------------------------

RenderText_Choose2LowOr3:
|0ECD1A| LDA.w $1CE9
|0ECD1D| BEQ .delay_over

|0ECD1F| DEC A
|0ECD20| STA.w $1CE9

|0ECD23| CMP.b #$01
|0ECD25| BNE .exit

|0ECD27| LDA.b #$24 ; SFX3.24
|0ECD29| STA.w $012F

|0ECD2C| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
|0ECD2E| LDA.b $F4
|0ECD30| TAY
|0ECD31| ORA.b $F6
|0ECD33| AND.b #$C0
|0ECD35| BNE .pressed_face

|0ECD37| TYA
|0ECD38| AND.b #$08
|0ECD3A| BNE .pressed_up

|0ECD3C| TYA
|0ECD3D| AND.b #$04
|0ECD3F| BNE .pressed_down

.exit
|0ECD41| RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
|0ECD42| LDA.w $1CE8
|0ECD45| BEQ .exit

|0ECD47| STZ.w $1CE8

|0ECD4A| BRA .continue_press

.pressed_down
|0ECD4C| LDA.w $1CE8
|0ECD4F| DEC A
|0ECD50| BEQ .exit

|0ECD52| LDA.b #$01
|0ECD54| STA.w $1CE8

.continue_press
|0ECD57| LDA.b #$20 ; SFX3.20
|0ECD59| STA.w $012F

|0ECD5C| LDA.w $1CE8
|0ECD5F| ASL A
|0ECD60| TAX

|0ECD61| LDA.w .arrow_messages+0,X
|0ECD64| STA.w $1CF0

|0ECD67| LDA.w .arrow_messages+1,X
|0ECD6A| STA.w $1CF1

|0ECD6D| JSR RenderText_ParseMessage

|0ECD70| STZ.w $1CE6
|0ECD73| STZ.w $1CD9
|0ECD76| STZ.w $1CDA

|0ECD79| JSR RenderText_InitializeVWF

|0ECD7C| RTS

;---------------------------------------------------------------------------------------------------

.pressed_face
|0ECD7D| LDA.b #$2B
|0ECD7F| STA.w $012E

|0ECD82| LDA.b #$04
|0ECD84| STA.w $1CD4

|0ECD87| RTS

;===================================================================================================

RenderText_ChooseItem:
|0ECD88| LDA.w $1CE9
|0ECD8B| BEQ .delay_over

|0ECD8D| DEC A
|0ECD8E| STA.w $1CE9

|0ECD91| CMP.b #$01
|0ECD93| BEQ RenderText_FindNextItem

|0ECD95| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
|0ECD97| LDA.b $F4
|0ECD99| ORA.b $F6
|0ECD9B| AND.b #$C0
|0ECD9D| BNE .made_selection

|0ECD9F| LDA.b $F4
|0ECDA1| AND.b #$05
|0ECDA3| BEQ .pressed_down_or_right

|0ECDA5| INC.w $1CE8

|0ECDA8| BRA .adjust_selection

.pressed_down_or_right
|0ECDAA| LDA.b $F4
|0ECDAC| AND.b #$0A
|0ECDAE| BEQ .adjust_selection

|0ECDB0| DEC.w $1CE8

|0ECDB3| JSR RenderText_FindPreviousItem
|0ECDB6| JSR RenderText_DrawACharacter

|0ECDB9| BRA .exit

.adjust_selection
|0ECDBB| JSR RenderText_FindNextItem
|0ECDBE| JSR RenderText_DrawACharacter

.exit
|0ECDC1| RTS

;---------------------------------------------------------------------------------------------------

.made_selection
|0ECDC2| LDA.b #$04
|0ECDC4| STA.w $1CD4

|0ECDC7| RTS

;===================================================================================================

RenderText_FindPreviousItem:
|0ECDC8| LDX.w $1CE8
|0ECDCB| BPL .no_wrap

|0ECDCD| LDX.b #$1F
|0ECDCF| STX.w $1CE8

.no_wrap
|0ECDD2| CPX.b #$0F
|0ECDD4| BEQ .check_next

|0ECDD6| LDA.l $7EF340,X
|0ECDDA| BMI .item_missing
|0ECDDC| BNE RenderText_DrawSelectedItem

.item_missing
|0ECDDE| CPX.b #$20
|0ECDE0| BNE .check_next

|0ECDE2| LDA.l $7EF341,X
|0ECDE6| BNE RenderText_DrawSelectedItem

.check_next
|0ECDE8| DEC.w $1CE8
|0ECDEB| BRA RenderText_FindPreviousItem

;===================================================================================================

RenderText_FindNextItem:
|0ECDED| LDX.w $1CE8
|0ECDF0| CPX.b #$20
|0ECDF2| BCC .no_wrap

|0ECDF4| LDX.b #$00
|0ECDF6| STX.w $1CE8

.no_wrap
|0ECDF9| CPX.b #$0F
|0ECDFB| BEQ .check_next

|0ECDFD| LDA.l $7EF340,X
|0ECE01| BMI .item_missing

|0ECE03| BNE RenderText_DrawSelectedItem

.item_missing
|0ECE05| CPX.b #$20
|0ECE07| BNE .check_next

|0ECE09| LDA.l $7EF341,X
|0ECE0D| BNE RenderText_DrawSelectedItem

.check_next
|0ECE0F| INC.w $1CE8
|0ECE12| BRA RenderText_FindNextItem

;===================================================================================================

RenderText_DrawSelectedItem:
|0ECE14| TXY

|0ECE15| TXA
|0ECE16| ASL A
|0ECE17| TAX

|0ECE18| LDA.l ItemIconPointers+0,X
|0ECE1C| STA.b $00

|0ECE1E| LDA.l ItemIconPointers+1,X
|0ECE22| STA.b $01

|0ECE24| LDA.b #^ItemIconPointers
|0ECE26| STA.b $02

|0ECE28| TYX

|0ECE29| LDA.l $7EF340,X
|0ECE2D| CPX.b #$20
|0ECE2F| BEQ .draw_one

|0ECE31| CPX.b #$03
|0ECE33| BNE .not_bombs

.draw_one
|0ECE35| LDA.b #$01

.not_bombs
|0ECE37| ASL A
|0ECE38| ASL A
|0ECE39| ASL A
|0ECE3A| TAY

|0ECE3B| LDA.b [$00],Y
|0ECE3D| STA.w $13C2

|0ECE40| INY
|0ECE41| LDA.b [$00],Y
|0ECE43| STA.w $13C3

|0ECE46| INY
|0ECE47| LDA.b [$00],Y
|0ECE49| STA.w $13C4

|0ECE4C| INY
|0ECE4D| LDA.b [$00],Y
|0ECE4F| STA.w $13C5

|0ECE52| INY
|0ECE53| LDA.b [$00],Y
|0ECE55| STA.w $13EC

|0ECE58| INY
|0ECE59| LDA.b [$00],Y
|0ECE5B| STA.w $13ED

|0ECE5E| INY
|0ECE5F| LDA.b [$00],Y
|0ECE61| STA.w $13EE

|0ECE64| INY
|0ECE65| LDA.b [$00],Y
|0ECE67| STA.w $13EF

|0ECE6A| RTS

;===================================================================================================

RenderText_IgnoreThis:
|0ECE6B| REP #$10

|0ECE6D| LDX.w $1CD9
|0ECE70| INX

|0ECE71| LDA.l $7F1200,X
|0ECE75| STA.w $1CEA

|0ECE78| INX
|0ECE79| STX.w $1CD9

|0ECE7C| SEP #$30

|0ECE7E| RTS

;===================================================================================================

pool RenderText_Choose2HighOr3

.arrow_messages
|0ECE7F| dw $000B ; MESSAGE 000B
|0ECE81| dw $000C ; MESSAGE 000C

endpool

;---------------------------------------------------------------------------------------------------

RenderText_Choose2HighOr3:
|0ECE83| LDA.w $1CE9
|0ECE86| BEQ .delay_over

|0ECE88| DEC A
|0ECE89| STA.w $1CE9

|0ECE8C| CMP.b #$01
|0ECE8E| BNE .exit

|0ECE90| LDA.b #$24 ; SFX3.24
|0ECE92| STA.w $012F

|0ECE95| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
|0ECE97| LDA.b $F4
|0ECE99| TAY

|0ECE9A| ORA.b $F6
|0ECE9C| AND.b #$C0
|0ECE9E| BNE .made_selection

|0ECEA0| TYA
|0ECEA1| AND.b #$08
|0ECEA3| BNE .pressed_up

|0ECEA5| TYA
|0ECEA6| AND.b #$04
|0ECEA8| BNE .pressed_down

.exit
|0ECEAA| RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
|0ECEAB| LDA.w $1CE8
|0ECEAE| BEQ .exit

|0ECEB0| STZ.w $1CE8

|0ECEB3| BRA .continue

;---------------------------------------------------------------------------------------------------

.pressed_down
|0ECEB5| LDA.w $1CE8
|0ECEB8| DEC A
|0ECEB9| BEQ .exit

|0ECEBB| LDA.b #$01
|0ECEBD| STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
|0ECEC0| LDA.b #$20 ; SFX3.20
|0ECEC2| STA.w $012F

|0ECEC5| LDA.w $1CE8
|0ECEC8| ASL A
|0ECEC9| TAX

|0ECECA| LDA.w .arrow_messages+0,X
|0ECECD| STA.w $1CF0

|0ECED0| LDA.w .arrow_messages+1,X
|0ECED3| STA.w $1CF1

|0ECED6| JSR RenderText_ParseMessage

|0ECED9| STZ.w $1CE6
|0ECEDC| STZ.w $1CD9
|0ECEDF| STZ.w $1CDA

|0ECEE2| JSR RenderText_InitializeVWF

|0ECEE5| RTS

;---------------------------------------------------------------------------------------------------

.made_selection
|0ECEE6| LDA.b #$2B ; SFX2.2B
|0ECEE8| STA.w $012E

|0ECEEB| LDA.b #$04
|0ECEED| STA.w $1CD4

|0ECEF0| RTS

;===================================================================================================

Choose3_ArrowMessageID:
|0ECEF1| dw $0006 ; MESSAGE 0006
|0ECEF3| dw $0007 ; MESSAGE 0007
|0ECEF5| dw $0008 ; MESSAGE 0008

;===================================================================================================

RenderText_Choose3:
|0ECEF7| LDA.w $1CE9
|0ECEFA| BEQ .delay_over

|0ECEFC| DEC A
|0ECEFD| STA.w $1CE9

|0ECF00| CMP.b #$01
|0ECF02| BNE .exit

|0ECF04| LDA.b #$24 ; SFX3.24
|0ECF06| STA.w $012F

|0ECF09| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
|0ECF0B| LDA.b $F6
|0ECF0D| AND.b #$C0
|0ECF0F| ORA.b $F4
|0ECF11| TAY

|0ECF12| AND.b #$D0
|0ECF14| BNE .made_selection

|0ECF16| TYA
|0ECF17| AND.b #$08
|0ECF19| BNE .pressed_up

|0ECF1B| TYA
|0ECF1C| AND.b #$04
|0ECF1E| BNE .pressed_down

.exit
|0ECF20| RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
|0ECF21| LDA.w $1CE8
|0ECF24| DEC A
|0ECF25| CMP.b #$FF
|0ECF27| BNE .no_up_wrap

|0ECF29| LDA.b #$02

.no_up_wrap
|0ECF2B| STA.w $1CE8

|0ECF2E| BRA .continue

;---------------------------------------------------------------------------------------------------

.pressed_down
|0ECF30| LDA.w $1CE8
|0ECF33| INC A
|0ECF34| CMP.b #$03
|0ECF36| BNE .no_down_wrap

|0ECF38| LDA.b #$00

.no_down_wrap
|0ECF3A| STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
|0ECF3D| LDA.b #$20 ; SFX3.20
|0ECF3F| STA.w $012F

|0ECF42| LDA.w $1CE8
|0ECF45| ASL A
|0ECF46| TAX

|0ECF47| LDA.w Choose3_ArrowMessageID+0,X
|0ECF4A| STA.w $1CF0

|0ECF4D| LDA.w Choose3_ArrowMessageID+1,X
|0ECF50| STA.w $1CF1

|0ECF53| JSR RenderText_ParseMessage

|0ECF56| STZ.w $1CE6
|0ECF59| STZ.w $1CD9
|0ECF5C| STZ.w $1CDA

|0ECF5F| JSR RenderText_InitializeVWF

|0ECF62| RTS

;---------------------------------------------------------------------------------------------------

.made_selection
|0ECF63| LDA.b #$2B ; SFX2.2B
|0ECF65| STA.w $012E

|0ECF68| LDA.b #$04
|0ECF6A| STA.w $1CD4

|0ECF6D| RTS

;===================================================================================================

pool RenderText_Choose1or2

.pointer_message_id
|0ECF6E| dw $0009 ; MESSAGE 0009
|0ECF70| dw $000A ; MESSAGE 000A

endpool

;---------------------------------------------------------------------------------------------------

RenderText_Choose1or2:
|0ECF72| LDA.w $1CE9
|0ECF75| BEQ .delay_over

|0ECF77| DEC A
|0ECF78| STA.w $1CE9

|0ECF7B| CMP.b #$01
|0ECF7D| BNE .exit

|0ECF7F| LDA.b #$24 ; SFX3.24
|0ECF81| STA.w $012F

|0ECF84| BRA .exit

;---------------------------------------------------------------------------------------------------

.delay_over
|0ECF86| LDA.b $F6
|0ECF88| AND.b #$C0
|0ECF8A| ORA.b $F4
|0ECF8C| TAY

|0ECF8D| AND.b #$D0
|0ECF8F| BNE .made_selection

|0ECF91| TYA
|0ECF92| AND.b #$08
|0ECF94| BNE .pressed_up

|0ECF96| TYA
|0ECF97| AND.b #$04
|0ECF99| BNE .pressed_down

.exit
|0ECF9B| RTS

;---------------------------------------------------------------------------------------------------

.pressed_up
|0ECF9C| LDA.w $1CE8
|0ECF9F| BEQ .exit

|0ECFA1| STZ.w $1CE8

|0ECFA4| BRA .continue

.pressed_down
|0ECFA6| LDA.w $1CE8
|0ECFA9| DEC A
|0ECFAA| BEQ .exit

|0ECFAC| LDA.b #$01
|0ECFAE| STA.w $1CE8

;---------------------------------------------------------------------------------------------------

.continue
|0ECFB1| LDA.b #$20 ; SFX3.20
|0ECFB3| STA.w $012F

|0ECFB6| LDA.w $1CE8
|0ECFB9| ASL A
|0ECFBA| TAX

|0ECFBB| LDA.w .pointer_message_id+0,X
|0ECFBE| STA.w $1CF0

|0ECFC1| LDA.w .pointer_message_id+1,X
|0ECFC4| STA.w $1CF1

|0ECFC7| JSR RenderText_ParseMessage

|0ECFCA| STZ.w $1CE6
|0ECFCD| STZ.w $1CD9
|0ECFD0| STZ.w $1CDA

|0ECFD3| JSR RenderText_InitializeVWF

|0ECFD6| RTS

;---------------------------------------------------------------------------------------------------

.made_selection
|0ECFD7| LDA.b #$2B ; SFX2.2B
|0ECFD9| STA.w $012E

|0ECFDC| LDA.b #$04
|0ECFDE| STA.w $1CD4

|0ECFE1| RTS

;===================================================================================================

RenderText_ScrollText:
|0ECFE2| PHB

|0ECFE3| LDA.b #$7F
|0ECFE5| PHA
|0ECFE6| PLB

|0ECFE7| LDA.b $F2
|0ECFE9| AND.b #$80
|0ECFEB| BEQ .no_a_press

|0ECFED| LDA.l $001CEA
|0ECFF1| BRA .useless

.no_a_press
|0ECFF3| LDA.l $001CEA

.useless
|0ECFF7| STA.b $02

;---------------------------------------------------------------------------------------------------

.next
|0ECFF9| REP #$30

|0ECFFB| STZ.b $00

.copy_next
|0ECFFD| LDX.b $00

|0ECFFF| LDA.w $7F0002,X
|0ED002| STA.w $7F0000,X

|0ED005| LDA.w $7F0004,X
|0ED008| STA.w $7F0002,X

|0ED00B| LDA.w $7F0006,X
|0ED00E| STA.w $7F0004,X

|0ED011| LDA.w $7F0008,X
|0ED014| STA.w $7F0006,X

|0ED017| LDA.w $7F000A,X
|0ED01A| STA.w $7F0008,X

|0ED01D| LDA.w $7F000C,X
|0ED020| STA.w $7F000A,X

|0ED023| LDA.w $7F000E,X
|0ED026| STA.w $7F000C,X

|0ED029| LDA.w $7F0150,X
|0ED02C| STA.w $7F000E,X

|0ED02F| LDA.b $00
|0ED031| CLC
|0ED032| ADC.w #$0010
|0ED035| STA.b $00

|0ED037| CMP.w #$07E0
|0ED03A| BCC .copy_next

;---------------------------------------------------------------------------------------------------

|0ED03C| STZ.w $7F07DE
|0ED03F| STZ.w $7F07CE
|0ED042| STZ.w $7F07BE
|0ED045| STZ.w $7F07AE

|0ED048| STZ.w $7F079E
|0ED04B| STZ.w $7F078E
|0ED04E| STZ.w $7F077E
|0ED051| STZ.w $7F076E

|0ED054| STZ.w $7F075E
|0ED057| STZ.w $7F074E
|0ED05A| STZ.w $7F073E
|0ED05D| STZ.w $7F072E

|0ED060| STZ.w $7F071E
|0ED063| STZ.w $7F070E
|0ED066| STZ.w $7F06FE
|0ED069| STZ.w $7F06EE

|0ED06C| STZ.w $7F06DE
|0ED06F| STZ.w $7F06CE
|0ED072| STZ.w $7F06BE
|0ED075| STZ.w $7F06AE
|0ED078| STZ.w $7F069E

;---------------------------------------------------------------------------------------------------

|0ED07B| SEP #$30

|0ED07D| LDA.l $001CDF
|0ED081| CLC
|0ED082| ADC.b #$01
|0ED084| STA.l $001CDF

|0ED088| AND.b #$0F
|0ED08A| BNE .proceed_to_next

|0ED08C| REP #$30

|0ED08E| LDA.l $001CD9
|0ED092| CLC
|0ED093| ADC.w #$0001
|0ED096| STA.l $001CD9

|0ED09A| LDA.w #$0050
|0ED09D| STA.l $001CDD

|0ED0A1| LDA.l RenderText_VWFRows+4
|0ED0A5| STA.l $000722

|0ED0A9| LDA.w #$0001
|0ED0AC| STA.l $000720

|0ED0B0| SEP #$30

|0ED0B2| LDA.b #$00
|0ED0B4| STA.l $001CE6

|0ED0B8| STZ.b $02

.proceed_to_next
|0ED0BA| DEC.b $02

|0ED0BC| BMI .exit

|0ED0BE| JMP.w .next

;---------------------------------------------------------------------------------------------------

.exit
|0ED0C1| PLB

|0ED0C2| RTS

;===================================================================================================

RenderText_VWFRows:
|0ED0C3| dw $0000, $0002, $0004

;===================================================================================================

RenderText_SetLine:
|0ED0C9| REP #$30

|0ED0CB| LDX.w $1CD9

|0ED0CE| LDA.l $7F1200,X
|0ED0D2| AND.w #$0003
|0ED0D5| ASL A
|0ED0D6| TAX

|0ED0D7| LDA.w RenderText_LinePositions,X
|0ED0DA| STA.w $1CDD

|0ED0DD| LDA.w RenderText_VWFRows+0,X
|0ED0E0| STA.w $0722

|0ED0E3| LDA.w #$0001
|0ED0E6| STA.w $0720

|0ED0E9| INC.w $1CD9

|0ED0EC| SEP #$30

|0ED0EE| STZ.w $1CE6

|0ED0F1| RTS

;===================================================================================================

RenderText_SetColor:
|0ED0F2| REP #$10

|0ED0F4| LDA.w $1CDC
|0ED0F7| AND.b #$E3
|0ED0F9| STA.w $1CDC

|0ED0FC| LDX.w $1CD9
|0ED0FF| INX

|0ED100| LDA.l $7F1200,X
|0ED104| AND.b #$07
|0ED106| ASL A
|0ED107| ASL A
|0ED108| ORA.w $1CDC
|0ED10B| STA.w $1CDC

|0ED10E| INX
|0ED10F| STX.w $1CD9

|0ED112| SEP #$30

|0ED114| RTS

;===================================================================================================

RenderText_Wait:
|0ED115| LDA.b $F2
|0ED117| AND.b #$80
|0ED119| BEQ .no_a_press

|0ED11B| LDA.b #$01
|0ED11D| BRA .continue

.no_a_press
|0ED11F| REP #$30

|0ED121| LDA.w $1CE0
|0ED124| CMP.w #$0002
|0ED127| BCC .continue

|0ED129| LDA.w #$0002

.continue
|0ED12C| SEP #$30

|0ED12E| JSL JumpTableLocal
|0ED132| dw RenderText_InitializeWait
|0ED134| dw RenderText_TerminateWait
|0ED136| dw RenderText_TickWaitClock

;===================================================================================================

RenderText_InitializeWait:
|0ED138| REP #$30

|0ED13A| LDX.w $1CD9

|0ED13D| LDA.l $7F1201,X
|0ED141| AND.w #$000F
|0ED144| ASL A
|0ED145| TAX

|0ED146| LDA.w RenderText_WaitTimers,X
|0ED149| STA.w $1CE0

;===================================================================================================

RenderText_TickWaitClock:
|0ED14C| REP #$30

|0ED14E| DEC.w $1CE0

|0ED151| SEP #$30

|0ED153| RTS

;===================================================================================================

RenderText_TerminateWait:
|0ED154| REP #$30

|0ED156| INC.w $1CD9
|0ED159| INC.w $1CD9

|0ED15C| SEP #$30

|0ED15E| STZ.w $1CE0

|0ED161| RTS

;===================================================================================================

RenderText_PlaySFX:
|0ED162| REP #$10

|0ED164| LDX.w $1CD9
|0ED167| INX

|0ED168| LDA.l $7F1200,X
|0ED16C| STA.w $012F

|0ED16F| INX
|0ED170| STX.w $1CD9

|0ED173| SEP #$30

|0ED175| RTS

;===================================================================================================

RenderText_SetSpeed:
|0ED176| REP #$10

|0ED178| LDX.w $1CD9
|0ED17B| INX

|0ED17C| LDA.l $7F1200,X
|0ED180| STA.w $1CD6
|0ED183| STA.w $1CD5

|0ED186| INX
|0ED187| STX.w $1CD9

|0ED18A| SEP #$30

|0ED18C| RTS

;===================================================================================================

RenderText_Command7B:
|0ED18D| REP #$30

|0ED18F| INC.w $1CD9

|0ED192| LDX.w $1CD9

|0ED195| LDA.l $7F1200,X
|0ED199| AND.w #$007F
|0ED19C| ASL A
|0ED19D| ASL A
|0ED19E| TAX

|0ED19F| LDY.w $1CDD

|0ED1A2| LDA.w Command7BTiles,X
|0ED1A5| STA.w $12D8,Y

|0ED1A8| INX
|0ED1A9| INX

|0ED1AA| LDA.w Command7BTiles,X
|0ED1AD| STA.w $1300,Y

|0ED1B0| INY
|0ED1B1| INY
|0ED1B2| STY.w $1CDD

|0ED1B5| INC.w $1CD9

|0ED1B8| SEP #$30

|0ED1BA| JMP.w RenderText_DrawMessageCharacters

;===================================================================================================

RenderText_Command7C:
|0ED1BD| REP #$30

|0ED1BF| INC.w $1CD9

|0ED1C2| LDX.w $1CD9

|0ED1C5| LDA.l $7F1200,X
|0ED1C9| AND.w #$007F
|0ED1CC| ASL A
|0ED1CD| ASL A
|0ED1CE| ASL A
|0ED1CF| TAX

|0ED1D0| LDA.w #$0002
|0ED1D3| STA.b $00
|0ED1D5| LDY.w $1CDD

.next
|0ED1D8| LDA.w Command7CTiles,X
|0ED1DB| STA.w $12D8,Y

|0ED1DE| INX
|0ED1DF| INX

|0ED1E0| LDA.w Command7CTiles,X
|0ED1E3| STA.w $1300,Y

|0ED1E6| INX
|0ED1E7| INX

|0ED1E8| INY
|0ED1E9| INY

|0ED1EA| DEC.b $00
|0ED1EC| BNE .next

;---------------------------------------------------------------------------------------------------

|0ED1EE| STY.w $1CDD

|0ED1F1| INC.w $1CD9

|0ED1F4| SEP #$30

|0ED1F6| JMP.w RenderText_DrawMessageCharacters

;===================================================================================================

RenderText_EmptyBuffer:
|0ED1F9| PHB

|0ED1FA| LDA.b #$7F
|0ED1FC| PHA
|0ED1FD| PLB

|0ED1FE| REP #$30

|0ED200| LDA.w #$07D0
|0ED203| TAX

;---------------------------------------------------------------------------------------------------

.next
|0ED204| STZ.w $7F0000,X
|0ED207| STZ.w $7F0002,X
|0ED20A| STZ.w $7F0004,X
|0ED20D| STZ.w $7F0006,X

|0ED210| STZ.w $7F0008,X
|0ED213| STZ.w $7F000A,X
|0ED216| STZ.w $7F000C,X
|0ED219| STZ.w $7F000E,X

|0ED21C| SEC
|0ED21D| SBC.w #$0010
|0ED220| TAX
|0ED221| BPL .next

;---------------------------------------------------------------------------------------------------

|0ED223| PLB

|0ED224| STZ.w $1CDD

|0ED227| INC.w $1CD9

|0ED22A| SEP #$30

|0ED22C| STZ.w $1CE6

|0ED22F| RTS

;===================================================================================================

RenderText_PauseForInput:
|0ED230| LDA.w $1CE9
|0ED233| BEQ .delay

|0ED235| DEC A
|0ED236| STA.w $1CE9

|0ED239| CMP.b #$01
|0ED23B| BNE .exit

|0ED23D| LDA.b #$24 ; SFX3.24
|0ED23F| STA.w $012F

|0ED242| BRA .exit

.delay
|0ED244| LDA.w $00F4
|0ED247| ORA.w $00F6
|0ED24A| AND.b #$C0
|0ED24C| BEQ .exit

|0ED24E| REP #$30

|0ED250| INC.w $1CD9

|0ED253| SEP #$30

|0ED255| LDA.b #$1C
|0ED257| STA.w $1CE9

.exit
|0ED25A| RTS

;===================================================================================================

RenderText_Terminate:
|0ED25B| LDA.w $1CE9
|0ED25E| BEQ .delay

|0ED260| DEC A
|0ED261| STA.w $1CE9

|0ED264| CMP.b #$01
|0ED266| BNE .exit

|0ED268| LDA.b #$24 ; SFX3.24
|0ED26A| STA.w $012F

|0ED26D| BRA .exit

.delay
|0ED26F| LDA.b $F4
|0ED271| ORA.b $F6
|0ED273| BEQ .exit

|0ED275| LDA.b #$04
|0ED277| STA.w $1CD4

|0ED27A| LDA.b #$1C
|0ED27C| STA.w $1CE9

.exit
|0ED27F| RTS

;===================================================================================================

RenderText_SetDefaultWindowPosition:
|0ED280| REP #$30

|0ED282| LDA.b $20
|0ED284| SEC
|0ED285| SBC.b $E8
|0ED287| CMP.w #$0078

|0ED28A| ROL A
|0ED28B| EOR.w #$0001
|0ED28E| AND.w #$0001

|0ED291| ASL A
|0ED292| TAX

|0ED293| LDA.w RenderText_TextPosition,X
|0ED296| STA.w $1CD2

|0ED299| SEP #$30

|0ED29B| RTS

;===================================================================================================

RenderText_SetDrawParameters:
|0ED29C| REP #$30

|0ED29E| LDA.w $1CD2
|0ED2A1| STA.w $1CD0

|0ED2A4| LDX.w #$0000
|0ED2A7| TXY

|0ED2A8| SEP #$30

|0ED2AA| RTS

;===================================================================================================

RenderText_DrawBorderRow:
|0ED2AB| REP #$30

|0ED2AD| LDA.w $1CD0
|0ED2B0| XBA
|0ED2B1| STA.w $1002,X

|0ED2B4| INX
|0ED2B5| INX

|0ED2B6| XBA
|0ED2B7| CLC
|0ED2B8| ADC.w #$0020
|0ED2BB| STA.w $1CD0

|0ED2BE| LDA.w #$2F00
|0ED2C1| STA.w $1002,X

|0ED2C4| INX
|0ED2C5| INX

|0ED2C6| LDA.w RenderText_BorderTiles,Y
|0ED2C9| STA.w $1002,X

|0ED2CC| INX
|0ED2CD| INX

|0ED2CE| INY
|0ED2CF| INY

|0ED2D0| LDA.w #$0016
|0ED2D3| STA.b $0E

;---------------------------------------------------------------------------------------------------

|0ED2D5| LDA.w RenderText_BorderTiles,Y

.next_row
|0ED2D8| STA.w $1002,X

|0ED2DB| INX
|0ED2DC| INX

|0ED2DD| DEC.b $0E
|0ED2DF| BNE .next_row

;---------------------------------------------------------------------------------------------------

|0ED2E1| INY
|0ED2E2| INY

|0ED2E3| LDA.w RenderText_BorderTiles,Y
|0ED2E6| STA.w $1002,X

|0ED2E9| INX
|0ED2EA| INX

|0ED2EB| RTS

;===================================================================================================

RenderText_BuildCharacterTilemap:
|0ED2EC| REP #$30

|0ED2EE| LDX.w #$0000

.next
|0ED2F1| LDA.w $1CE2
|0ED2F4| STA.w $1300,X

|0ED2F7| INC.w $1CE2

|0ED2FA| INX
|0ED2FB| INX
|0ED2FC| CPX.w #$00FC
|0ED2FF| BCC .next

;---------------------------------------------------------------------------------------------------

|0ED301| JSR RenderText_DrawACharacter

|0ED304| SEP #$30

|0ED306| RTS

;===================================================================================================

RenderText_DrawACharacter:
|0ED307| REP #$30

|0ED309| LDA.w #$0006
|0ED30C| STA.b $0E

|0ED30E| JSR RenderText_SetDrawParameters

|0ED311| REP #$30

|0ED313| LDA.w $1CD0
|0ED316| CLC
|0ED317| ADC.w #$0021
|0ED31A| STA.w $1CD0

;---------------------------------------------------------------------------------------------------

.next
|0ED31D| LDA.w $1CD0
|0ED320| XBA
|0ED321| STA.w $1002,X

|0ED324| XBA
|0ED325| CLC
|0ED326| ADC.w #$0020
|0ED329| STA.w $1CD0

|0ED32C| INX
|0ED32D| INX

|0ED32E| LDA.w #$2900
|0ED331| STA.w $1002,X

|0ED334| INX
|0ED335| INX
|0ED336| LDA.w #$0015
|0ED339| STA.b $0C

.copy
|0ED33B| LDA.w $1300,Y
|0ED33E| STA.w $1002,X

|0ED341| INX
|0ED342| INX

|0ED343| INY
|0ED344| INY

|0ED345| DEC.b $0C
|0ED347| BNE .copy

|0ED349| DEC.b $0E
|0ED34B| BNE .next

;---------------------------------------------------------------------------------------------------

|0ED34D| LDA.w #$FFFF
|0ED350| STA.w $1002,X

|0ED353| SEP #$30

|0ED355| LDA.b #$01
|0ED357| STA.b $14

|0ED359| RTS

;===================================================================================================

RenderText_InitialSettings:
|0ED35A| db $00, $00, $00, $00, $00, $00, $00, $00
|0ED362| db $01, $00, $00, $00, $39, $00, $00, $00
|0ED36A| db $00

;---------------------------------------------------------------------------------------------------

RenderText_MoreInitialSettings:
|0ED36B| db $00, $00, $00, $00, $00, $00, $00, $00
|0ED373| db $1C, $04, $00, $00, $00, $00, $00, $00
|0ED37B| db $00, $00, $00, $00

;===================================================================================================

RenderText_BorderTiles:
|0ED37F| dw $28F3, $28F4, $68F3
|0ED385| dw $28C8, $387F, $68C8
|0ED38B| dw $A8F3, $A8F4, $E8F3

RenderText_TextPosition:
|0ED391| dw $6125, $6244

RenderText_ClearStripeDRILL:
|0ED395| dw $2E42

RenderText_ClearTileFill:
|0ED397| dw $387F

RenderText_LinePositions:
|0ED399| dw $0000, $0028, $0050

;===================================================================================================

Command7CTiles:
|0ED39F| dw $24B8, $24BA, $24BC, $24BE

;---------------------------------------------------------------------------------------------------

Command7BTiles:
|0ED3A7| dw $24B8, $24BA, $24BC, $24BE

;===================================================================================================

RenderText_WaitTimers:
|0ED3AF| dw $001F, $003F, $005E, $007D
|0ED3B7| dw $009C, $00BC, $00DB, $00FA
|0ED3BF| dw $0119, $0139, $0158, $0177
|0ED3C7| dw $0196, $01B6, $01D5, $01F4

;===================================================================================================

UNREACHABLE_0ED3CF:
|0ED3CF| db $08, $03

;===================================================================================================

TextCommandLengths:
|0ED3D1| db $01, $01, $01, $01, $01, $02, $02, $02
|0ED3D9| db $02, $01, $01, $01, $01, $01, $01, $01
|0ED3E1| db $01, $02, $02, $02, $02, $01, $01, $01
|0ED3E9| db $01, $01

;===================================================================================================

CreateMessagePointers:
|0ED3EB| PHB
|0ED3EC| PHK
|0ED3ED| PLB

|0ED3EE| LDA.b #^Message_Data
|0ED3F0| STA.b $02

|0ED3F2| REP #$30

|0ED3F4| LDA.w #Message_Data
|0ED3F7| STA.b $00

|0ED3F9| LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.next_message
|0ED3FC| LDA.b $00
|0ED3FE| STA.l $7F71C0,X

|0ED402| LDA.b $01
|0ED404| STA.l $7F71C1,X

|0ED408| INX
|0ED409| INX
|0ED40A| INX

.next_byte
|0ED40B| LDA.b [$00]
|0ED40D| AND.w #$00FF
|0ED410| TAY

|0ED411| LDA.w RenderText_MoreInitialSettings,Y
|0ED414| AND.w #$00FF
|0ED417| CPY.w #$0067
|0ED41A| BCC .not_command

|0ED41C| CPY.w #$0080
|0ED41F| BCC .is_command

.not_command
|0ED421| LDA.w #$0001

.is_command
|0ED424| CLC
|0ED425| ADC.b $00
|0ED427| STA.b $00

|0ED429| CPY.w #$007F
|0ED42C| BEQ .next_message

|0ED42E| CPY.w #$0080
|0ED431| BNE .not_bank_change

|0ED433| DEX
|0ED434| DEX
|0ED435| DEX

|0ED436| LDA.w #Message_DataExtra
|0ED439| STA.b $00

|0ED43B| LDA.w #^Message_DataExtra
|0ED43E| STA.b $02

|0ED440| BRA .next_message

.not_bank_change
|0ED442| CPY.w #$00FF
|0ED445| BNE .next_byte

;---------------------------------------------------------------------------------------------------

|0ED447| SEP #$30

|0ED449| PLB

|0ED44A| RTL

;===================================================================================================
; FREE ROM: 0x15
;===================================================================================================
NULL_0ED44B:
|0ED44B| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED453| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED45B| db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

UnderworldPaletteSets:
|0ED460| db $00, $00, $03, $01 ; 0x00
|0ED464| db $02, $00, $03, $01 ; 0x01
|0ED468| db $04, $00, $0A, $01 ; 0x02
|0ED46C| db $06, $00, $01, $07 ; 0x03
|0ED470| db $0A, $02, $02, $07 ; 0x04
|0ED474| db $04, $04, $03, $0A ; 0x05
|0ED478| db $0C, $05, $08, $14 ; 0x06
|0ED47C| db $0E, $00, $03, $0A ; 0x07
|0ED480| db $02, $00, $0F, $14 ; 0x08
|0ED484| db $0A, $02, $00, $07 ; 0x09
|0ED488| db $02, $00, $0F, $0C ; 0x0A
|0ED48C| db $06, $00, $06, $07 ; 0x0B
|0ED490| db $00, $00, $0E, $12 ; 0x0C
|0ED494| db $12, $05, $05, $0B ; 0x0D
|0ED498| db $12, $00, $02, $0C ; 0x0E
|0ED49C| db $10, $05, $0A, $07 ; 0x0F
|0ED4A0| db $10, $00, $10, $0C ; 0x10
|0ED4A4| db $16, $07, $02, $07 ; 0x11
|0ED4A8| db $16, $00, $07, $0F ; 0x12
|0ED4AC| db $08, $00, $04, $0C ; 0x13
|0ED4B0| db $08, $00, $04, $09 ; 0x14
|0ED4B4| db $04, $00, $03, $01 ; 0x15
|0ED4B8| db $14, $00, $04, $04 ; 0x16
|0ED4BC| db $14, $00, $14, $0C ; 0x17
|0ED4C0| db $18, $05, $07, $0B ; 0x18
|0ED4C4| db $18, $06, $10, $0C ; 0x19
|0ED4C8| db $1A, $05, $08, $14 ; 0x1A
|0ED4CC| db $1A, $02, $00, $07 ; 0x1B
|0ED4D0| db $06, $00, $03, $0A ; 0x1C
|0ED4D4| db $1C, $00, $03, $01 ; 0x1D
|0ED4D8| db $1E, $00, $0B, $11 ; 0x1E
|0ED4DC| db $04, $00, $0B, $11 ; 0x1F
|0ED4E0| db $0E, $00, $00, $02 ; 0x20
|0ED4E4| db $20, $08, $13, $0D ; 0x21
|0ED4E8| db $0A, $00, $03, $0A ; 0x22
|0ED4EC| db $14, $00, $04, $04 ; 0x23
|0ED4F0| db $1A, $02, $02, $07 ; 0x24
|0ED4F4| db $1A, $0A, $00, $00 ; 0x25
|0ED4F8| db $00, $00, $03, $02 ; 0x26
|0ED4FC| db $0E, $00, $03, $07 ; 0x27
|0ED500| db $1A, $05, $05, $0B ; 0x28

;===================================================================================================

OverworldPaletteSet:
|0ED504| db $00, $FF, $07, $FF ; 0x00
|0ED508| db $00, $01, $07, $FF ; 0x01
|0ED50C| db $00, $02, $07, $FF ; 0x02
|0ED510| db $00, $03, $07, $FF ; 0x03
|0ED514| db $00, $04, $07, $FF ; 0x04
|0ED518| db $00, $05, $07, $FF ; 0x05
|0ED51C| db $00, $06, $07, $FF ; 0x06
|0ED520| db $07, $06, $05, $FF ; 0x07
|0ED524| db $00, $08, $07, $FF ; 0x08
|0ED528| db $00, $09, $07, $FF ; 0x09
|0ED52C| db $00, $0A, $07, $FF ; 0x0A
|0ED530| db $00, $0B, $07, $FF ; 0x0B
|0ED534| db $00, $FF, $07, $FF ; 0x0C
|0ED538| db $00, $FF, $07, $FF ; 0x0D
|0ED53C| db $03, $04, $07, $FF ; 0x0E
|0ED540| db $04, $04, $03, $FF ; 0x0F
|0ED544| db $10, $FF, $06, $FF ; 0x10
|0ED548| db $10, $01, $06, $FF ; 0x11
|0ED54C| db $10, $11, $06, $FF ; 0x12
|0ED550| db $10, $03, $06, $FF ; 0x13
|0ED554| db $10, $04, $06, $FF ; 0x14
|0ED558| db $10, $05, $06, $FF ; 0x15
|0ED55C| db $10, $06, $06, $FF ; 0x16
|0ED560| db $12, $13, $04, $FF ; 0x17
|0ED564| db $12, $05, $04, $FF ; 0x18
|0ED568| db $10, $09, $06, $FF ; 0x19
|0ED56C| db $10, $0B, $06, $FF ; 0x1A
|0ED570| db $10, $0C, $06, $FF ; 0x1B
|0ED574| db $10, $0D, $06, $FF ; 0x1C
|0ED578| db $10, $0E, $06, $FF ; 0x1D
|0ED57C| db $10, $0F, $06, $FF ; 0x1E

;===================================================================================================

OverworldSpritesPaletteSet:
|0ED580| db $FF, $FF
|0ED582| db $03, $0A
|0ED584| db $03, $06
|0ED586| db $03, $01
|0ED588| db $00, $02
|0ED58A| db $03, $0E
|0ED58C| db $03, $02
|0ED58E| db $13, $01
|0ED590| db $0B, $0C
|0ED592| db $11, $01
|0ED594| db $07, $05
|0ED596| db $11, $00
|0ED598| db $09, $0B
|0ED59A| db $0F, $05
|0ED59C| db $03, $05
|0ED59E| db $03, $07
|0ED5A0| db $0F, $02
|0ED5A2| db $0A, $02
|0ED5A4| db $05, $01
|0ED5A6| db $0C, $0E

;===================================================================================================

OverworldPalettesLoader:
|0ED5A8| ASL A
|0ED5A9| ASL A
|0ED5AA| TAX

|0ED5AB| STZ.w $0AA9

|0ED5AE| LDA.l OverworldPaletteSet+0,X
|0ED5B2| BMI .dont_change_a

|0ED5B4| STA.w $0AB4

.dont_change_a
|0ED5B7| LDA.l OverworldPaletteSet+1,X
|0ED5BB| BMI .dont_change_b

|0ED5BD| STA.w $0AB5

.dont_change_b
|0ED5C0| LDA.l OverworldPaletteSet+2,X
|0ED5C4| BMI .dont_change_c

|0ED5C6| STA.w $0AB8

.dont_change_c
|0ED5C9| LDA.b $00
|0ED5CB| ASL A
|0ED5CC| TAX

|0ED5CD| LDA.l OverworldSpritesPaletteSet+0,X
|0ED5D1| BMI .dont_change_d

|0ED5D3| STA.w $0AAD

.dont_change_d
|0ED5D6| LDA.l OverworldSpritesPaletteSet+1,X
|0ED5DA| BMI .dont_change_e

|0ED5DC| STA.w $0AAE

.dont_change_e
|0ED5DF| JSL PaletteLoad_OWBG1
|0ED5E3| JSL PaletteLoad_OWBG2
|0ED5E7| JSL PaletteLoad_OWBG3

|0ED5EB| JSL PaletteLoad_SpriteAux1
|0ED5EF| JSL PaletteLoad_SpriteAux2

|0ED5F3| RTL

;===================================================================================================

SetBGandFixedColorBlack:
|0ED5F4| REP #$20

|0ED5F6| LDA.w #$0000 ; RGB #000000

;===================================================================================================

SetBGColorMainBuffer:
|0ED5F9| STA.l $7EC500
|0ED5FD| STA.l $7EC540

;===================================================================================================

SetBGColorCacheOnly:
|0ED601| STA.l $7EC300
|0ED605| STA.l $7EC340

|0ED609| SEP #$30

;===================================================================================================

FixedColorBlack:
|0ED60B| LDA.b #$20 ; Fixed color RGB: #000000
|0ED60D| STA.b $9C

|0ED60F| LDA.b #$40
|0ED611| STA.b $9D

|0ED613| LDA.b #$80
|0ED615| STA.b $9E

|0ED617| RTL

;===================================================================================================

SetOverworldBackgroundColor:
|0ED618| JSR .do_ittttt

|0ED61B| BRA SetBGColorMainBuffer

;---------------------------------------------------------------------------------------------------

#SetOverworldBackgroundColorCacheOnly:
|0ED61D| JSR .do_ittttt

|0ED620| BRA SetBGColorCacheOnly

;---------------------------------------------------------------------------------------------------

.do_ittttt
|0ED622| REP #$30

|0ED624| LDX.w #$2669 ; RGB: #489848

|0ED627| LDA.b $8A
|0ED629| CMP.w #$0080 ; SPOW
|0ED62C| BCC .normal_overworld

|0ED62E| LDA.b $A0
|0ED630| CMP.w #$0183 ; OW 83
|0ED633| BEQ .special_area

|0ED635| CMP.w #$0182 ; OW 82
|0ED638| BEQ .special_area

|0ED63A| CMP.w #$0180 ; OW 80
|0ED63D| BNE .set_color

.special_area
|0ED63F| LDX.w #$19C6 ; RGB: #307030
|0ED642| BRA .set_color

.normal_overworld
|0ED644| LDX.w #$2669 ; RGB: #489848

|0ED647| LDA.b $8A

|0ED649| AND.w #$0040
|0ED64C| BEQ .set_color

|0ED64E| LDX.w #$2A32 ; RGB: #908850

.set_color
|0ED651| TXA

|0ED652| RTS

;===================================================================================================

UNREACHABLE_0ED653:
|0ED653| LDA.b #$01
|0ED655| STA.b $EE

;===================================================================================================

AssertTranslucencySwap:
|0ED657| LDA.b #$01
|0ED659| STA.w $0ABD

.apply
|0ED65C| REP #$21

|0ED65E| LDX.b #$00

.copy_next
|0ED660| LDA.l $7EC400,X
|0ED664| PHA

|0ED665| LDA.l $7EC4E0,X
|0ED669| STA.l $7EC400,X
|0ED66D| STA.l $7EC600,X

|0ED671| PLA
|0ED672| STA.l $7EC4E0,X
|0ED676| STA.l $7EC6E0,X

|0ED67A| LDA.l $7EC410,X
|0ED67E| PHA

|0ED67F| LDA.l $7EC4F0,X
|0ED683| STA.l $7EC410,X
|0ED687| STA.l $7EC610,X

|0ED68B| PLA
|0ED68C| STA.l $7EC4F0,X
|0ED690| STA.l $7EC6F0,X

|0ED694| LDA.l $7EC4B0,X
|0ED698| PHA

|0ED699| LDA.l $7EC470,X
|0ED69D| STA.l $7EC4B0,X
|0ED6A1| STA.l $7EC6B0,X

|0ED6A5| PLA
|0ED6A6| STA.l $7EC470,X
|0ED6AA| STA.l $7EC670,X

|0ED6AE| INX
|0ED6AF| INX
|0ED6B0| CPX.b #$10
|0ED6B2| BNE .copy_next

;---------------------------------------------------------------------------------------------------

|0ED6B4| SEP #$20

|0ED6B6| INC.b $15

|0ED6B8| RTL

;---------------------------------------------------------------------------------------------------

#UNREACHABLE_0ED6B9:
|0ED6B9| STZ.b $EE

;---------------------------------------------------------------------------------------------------

#RevertTranslucencySwap:
|0ED6BB| STZ.w $0ABD

|0ED6BE| BRA .apply

;===================================================================================================

RefreshEquipmentPalettes_sword_and_mail:
|0ED6C0| REP #$20

|0ED6C2| LDA.l $7EF359
|0ED6C6| STA.b $0C

|0ED6C8| LDA.l $7EF35B
|0ED6CC| AND.w #$00FF
|0ED6CF| BRA RefreshEquipmentPalettes

;===================================================================================================

RefreshEquipmentPalettes_zap:
|0ED6D1| REP #$20

|0ED6D3| LDA.w #$0202
|0ED6D6| STA.b $0C

|0ED6D8| LDA.w #$0404
|0ED6DB| BRA RefreshEquipmentPalettes

;===================================================================================================

RefreshEquipmentPalettes_bunny:
|0ED6DD| REP #$20

|0ED6DF| LDA.l $7EF359
|0ED6E3| STA.b $0C

|0ED6E5| LDA.w #$0303

;===================================================================================================

RefreshEquipmentPalettes:
|0ED6E8| STA.b $0E

|0ED6EA| LDA.w #^PaletteData
|0ED6ED| STA.b $02

|0ED6EF| LDX.b $0C

|0ED6F1| LDA.l SwordPaletteOffsets,X
|0ED6F5| AND.w #$00FF
|0ED6F8| CLC
|0ED6F9| ADC.w #PaletteData.sword_00

|0ED6FC| REP #$10

|0ED6FE| LDX.w #$01B2
|0ED701| LDY.w #$0002
|0ED704| JSR .copy_palette

;---------------------------------------------------------------------------------------------------

|0ED707| SEP #$10

|0ED709| LDX.b $0D

|0ED70B| LDA.l ShieldPaletteOffsets,X
|0ED70F| AND.w #$00FF
|0ED712| CLC
|0ED713| ADC.w #PaletteData.shield_00

|0ED716| REP #$10

|0ED718| LDX.w #$01B8
|0ED71B| LDY.w #$0003
|0ED71E| JSR .copy_palette

;---------------------------------------------------------------------------------------------------

|0ED721| SEP #$10

|0ED723| LDX.b $0E

|0ED725| LDA.l LinkMailPalettesOffsets,X
|0ED729| AND.w #$00FF
|0ED72C| ASL A
|0ED72D| CLC
|0ED72E| ADC.w #PaletteData.link_00

|0ED731| REP #$10

|0ED733| LDX.w #$01E2
|0ED736| LDY.w #$000E
|0ED739| JSR .copy_palette

;---------------------------------------------------------------------------------------------------

|0ED73C| SEP #$30

|0ED73E| INC.b $15

|0ED740| RTL

;---------------------------------------------------------------------------------------------------

.copy_palette
|0ED741| STA.b $00

.next_color
|0ED743| LDA.b [$00]
|0ED745| STA.l $7EC300,X
|0ED749| STA.l $7EC500,X

|0ED74D| INC.b $00
|0ED74F| INC.b $00

|0ED751| INX
|0ED752| INX

|0ED753| DEY
|0ED754| BPL .next_color

|0ED756| RTS

;===================================================================================================

PaletteFilter_Oversaturation:
|0ED757| REP #$20

|0ED759| LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_color
|0ED75B| LDA.l $7EC340,X
|0ED75F| JSR OversaturateColor
|0ED762| STA.l $7EC540,X

|0ED766| LDA.l $7EC350,X
|0ED76A| JSR OversaturateColor
|0ED76D| STA.l $7EC550,X

|0ED771| LDA.l $7EC360,X
|0ED775| JSR OversaturateColor
|0ED778| STA.l $7EC560,X

|0ED77C| LDA.l $7EC370,X
|0ED780| JSR OversaturateColor
|0ED783| STA.l $7EC570,X

|0ED787| LDA.l $7EC380,X
|0ED78B| JSR OversaturateColor
|0ED78E| STA.l $7EC580,X

|0ED792| LDA.l $7EC390,X
|0ED796| JSR OversaturateColor
|0ED799| STA.l $7EC590,X

|0ED79D| LDA.l $7EC3A0,X
|0ED7A1| JSR OversaturateColor
|0ED7A4| STA.l $7EC5A0,X

|0ED7A8| LDA.l $7EC3B0,X
|0ED7AC| JSR OversaturateColor
|0ED7AF| STA.l $7EC5B0,X

|0ED7B3| LDA.l $7EC3C0,X
|0ED7B7| JSR OversaturateColor
|0ED7BA| STA.l $7EC5C0,X

|0ED7BE| LDA.l $7EC3D0,X
|0ED7C2| JSR OversaturateColor
|0ED7C5| STA.l $7EC5D0,X

|0ED7C9| LDA.l $7EC3E0,X
|0ED7CD| JSR OversaturateColor
|0ED7D0| STA.l $7EC5E0,X

|0ED7D4| LDA.l $7EC3F0,X
|0ED7D8| JSR OversaturateColor
|0ED7DB| STA.l $7EC5F0,X

|0ED7DF| INX
|0ED7E0| INX
|0ED7E1| CPX.b #$10
|0ED7E3| BEQ .done

|0ED7E5| JMP.w .next_color

;---------------------------------------------------------------------------------------------------

.done
|0ED7E8| REP #$10

|0ED7EA| LDA.l $7EC540
|0ED7EE| TAY

|0ED7EF| LDA.l $7EC300
|0ED7F3| BNE .dont_copy_that

|0ED7F5| TAY

.dont_copy_that
|0ED7F6| TYA
|0ED7F7| STA.l $7EC500

|0ED7FB| SEP #$30

|0ED7FD| RTL

;===================================================================================================

OversaturateColor:
|0ED7FE| STA.b $00

|0ED800| AND.w #$001F
|0ED803| CLC
|0ED804| ADC.w #$000E

|0ED807| CMP.w #$001F
|0ED80A| BCC .oversaturated_r

|0ED80C| LDA.w #$001F

.oversaturated_r
|0ED80F| STA.b $02

|0ED811| LDA.b $00
|0ED813| AND.w #$03E0
|0ED816| CLC
|0ED817| ADC.w #$01C0

|0ED81A| CMP.w #$03E0
|0ED81D| BCC .oversaturated_g

|0ED81F| LDA.w #$03E0

.oversaturated_g
|0ED822| STA.b $04

|0ED824| LDA.b $00
|0ED826| AND.w #$7C00
|0ED829| CLC
|0ED82A| ADC.w #$3800

|0ED82D| CMP.w #$7C00
|0ED830| BCC .oversaturated_b

|0ED832| LDA.w #$7C00

.oversaturated_b
|0ED835| ORA.b $02
|0ED837| ORA.b $04

|0ED839| RTS

;===================================================================================================

RestorePalettesAfterFlash:
|0ED83A| REP #$20

|0ED83C| LDX.b #$00

;---------------------------------------------------------------------------------------------------

.next_color
|0ED83E| LDA.l $7EC340,X
|0ED842| STA.l $7EC540,X

|0ED846| LDA.l $7EC350,X
|0ED84A| STA.l $7EC550,X

|0ED84E| LDA.l $7EC360,X
|0ED852| STA.l $7EC560,X

|0ED856| LDA.l $7EC370,X
|0ED85A| STA.l $7EC570,X

|0ED85E| LDA.l $7EC380,X
|0ED862| STA.l $7EC580,X

|0ED866| LDA.l $7EC390,X
|0ED86A| STA.l $7EC590,X

|0ED86E| LDA.l $7EC3A0,X
|0ED872| STA.l $7EC5A0,X

|0ED876| LDA.l $7EC3B0,X
|0ED87A| STA.l $7EC5B0,X

|0ED87E| LDA.l $7EC3C0,X
|0ED882| STA.l $7EC5C0,X

|0ED886| LDA.l $7EC3D0,X
|0ED88A| STA.l $7EC5D0,X

|0ED88E| LDA.l $7EC3E0,X
|0ED892| STA.l $7EC5E0,X

|0ED896| LDA.l $7EC3F0,X
|0ED89A| STA.l $7EC5F0,X

|0ED89E| INX
|0ED89F| INX
|0ED8A0| CPX.b #$10
|0ED8A2| BNE .next_color

|0ED8A4| LDA.l $7EC540
|0ED8A8| STA.l $7EC500

|0ED8AC| SEP #$30

;===================================================================================================

RestoreFixedColor:
|0ED8AE| LDA.b $1B
|0ED8B0| BNE .exit

|0ED8B2| REP #$10

|0ED8B4| LDX.w #$4020 ; Fixed color RGB: #000000
|0ED8B7| STX.b $9C

|0ED8B9| LDX.w #$8040
|0ED8BC| STX.b $9D

|0ED8BE| LDX.w #$4F33 ; Fixed color RGB: #987848
|0ED8C1| LDY.w #$894F

|0ED8C4| LDA.b $8A ; OW 00
|0ED8C6| BEQ .exit

|0ED8C8| CMP.b #$40 ; OW 40
|0ED8CA| BEQ .exit

|0ED8CC| CMP.b #$5B ; OW 5B
|0ED8CE| BEQ .set_fixedcol

|0ED8D0| LDX.w #$4C26 ; Fixed color RGB: #306060
|0ED8D3| LDY.w #$8C4C

|0ED8D6| CMP.b #$03 ; OW 03
|0ED8D8| BEQ .set_fixedcol

|0ED8DA| CMP.b #$05 ; OW 05
|0ED8DC| BEQ .set_fixedcol

|0ED8DE| CMP.b #$07 ; OW 07
|0ED8E0| BEQ .set_fixedcol

|0ED8E2| LDX.w #$4A26 ; Fixed color RGB: #305038
|0ED8E5| LDY.w #$874A

|0ED8E8| CMP.b #$43 ; OW 43
|0ED8EA| BEQ .set_fixedcol

|0ED8EC| CMP.b #$45 ; OW 45
|0ED8EE| BEQ .set_fixedcol

|0ED8F0| CMP.b #$47 ; OW 47
|0ED8F2| BNE .exit

.set_fixedcol
|0ED8F4| STX.b $9C
|0ED8F6| STY.b $9D

.exit
|0ED8F8| SEP #$10

|0ED8FA| RTL

;===================================================================================================

RestoreBackgroundPalettes:
|0ED8FB| REP #$20

|0ED8FD| LDX.b #$7E

.next_color
|0ED8FF| LDA.l $7EC300,X
|0ED903| STA.l $7EC500,X

|0ED907| LDA.l $7EC380,X
|0ED90B| STA.l $7EC580,X

|0ED90F| DEX
|0ED910| DEX
|0ED911| BPL .next_color

|0ED913| SEP #$20

|0ED915| INC.b $15

|0ED917| JMP.w RestoreFixedColor

;===================================================================================================
; FREE ROM: 0x26
;===================================================================================================
NULL_0ED91A:
|0ED91A| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED922| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED92A| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED932| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0ED93A| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_03_02_BrightenMap:
|0ED940| INC.b $13

|0ED942| LDA.b $13
|0ED944| CMP.b #$0F
|0ED946| BNE EXIT_0ED94B

|0ED948| INC.w $0200

;---------------------------------------------------------------------------------------------------

#EXIT_0ED94B:
|0ED94B| RTL

;===================================================================================================

Module0E_03_00_DarkenAndPrep:
|0ED94C| DEC.b $13
|0ED94E| BNE EXIT_0ED94B

|0ED950| LDA.b #$03
|0ED952| STA.b $95

|0ED954| LDA.b $9B
|0ED956| STA.l $7EC229

|0ED95A| JSL EnableForceBlank

|0ED95E| INC.w $0200
|0ED961| STZ.w $020D

|0ED964| LDA.b #$20 ; Fixed color RGB: #000000
|0ED966| STA.b $9C

|0ED968| LDA.b #$40
|0ED96A| STA.b $9D

|0ED96C| LDA.b #$80
|0ED96E| STA.b $9E

|0ED970| REP #$20

|0ED972| LDA.w #$0250
|0ED975| STA.w $0100

;---------------------------------------------------------------------------------------------------

|0ED978| LDX.b #$7E

.next_colors
|0ED97A| LDA.l $7EC500,X
|0ED97E| STA.l $7FDD80,X

|0ED982| LDA.l $7EC580,X
|0ED986| STA.l $7FDE00,X

|0ED98A| LDA.l $7EC600,X
|0ED98E| STA.l $7FDE80,X

|0ED992| LDA.l $7EC680,X
|0ED996| STA.l $7FDF00,X

|0ED99A| DEX
|0ED99B| DEX
|0ED99C| BPL .next_colors

;---------------------------------------------------------------------------------------------------

|0ED99E| LDA.w $011A
|0ED9A1| STA.l $7EC221

|0ED9A5| LDA.w $011C
|0ED9A8| STA.l $7EC223

|0ED9AC| STZ.w $011A
|0ED9AF| STZ.w $011C

|0ED9B2| LDA.b $E0
|0ED9B4| STA.l $7EC200

|0ED9B8| LDA.b $E2
|0ED9BA| STA.l $7EC202

|0ED9BE| LDA.b $E6
|0ED9C0| STA.l $7EC204

|0ED9C4| LDA.b $E8
|0ED9C6| STA.l $7EC206

|0ED9CA| STZ.b $E0
|0ED9CC| STZ.b $E2
|0ED9CE| STZ.b $E4
|0ED9D0| STZ.b $E6
|0ED9D2| STZ.b $E8
|0ED9D4| STZ.b $EA

|0ED9D6| LDA.b $99
|0ED9D8| STA.l $7EC225

|0ED9DC| LDA.w #$2002
|0ED9DF| STA.b $99

|0ED9E1| LDX.b #$00
|0ED9E3| LDA.w #$0300

.tilemap_fill
|0ED9E6| STA.l $7F0000,X
|0ED9EA| STA.l $7F0100,X
|0ED9EE| STA.l $7F0200,X
|0ED9F2| STA.l $7F0300,X

|0ED9F6| STA.l $7F0400,X
|0ED9FA| STA.l $7F0500,X
|0ED9FE| STA.l $7F0600,X
|0EDA02| STA.l $7F0700,X

|0EDA06| STA.l $7F0800,X
|0EDA0A| STA.l $7F0900,X
|0EDA0E| STA.l $7F0A00,X
|0EDA12| STA.l $7F0B00,X

|0EDA16| STA.l $7F0C00,X
|0EDA1A| STA.l $7F0D00,X
|0EDA1E| STA.l $7F0E00,X
|0EDA22| STA.l $7F0F00,X

|0EDA26| DEX
|0EDA27| DEX
|0EDA28| BNE .tilemap_fill

;---------------------------------------------------------------------------------------------------

|0EDA2A| SEP #$20

|0EDA2C| LDA.b #$10 ; SFX3.10
|0EDA2E| STA.w $012F

|0EDA31| LDA.b #$F2 ; SONG F2 - half volume
|0EDA33| STA.w $012C

|0EDA36| RTL

;===================================================================================================

UnderworldMap_RecoverRegisters:
|0EDA37| DEC.b $13
|0EDA39| BNE .exit

|0EDA3B| JSL EnableForceBlank

|0EDA3F| INC.w $0200

|0EDA42| REP #$30

|0EDA44| LDA.l $7EC225
|0EDA48| STA.b $99

|0EDA4A| LDA.l $7EC200
|0EDA4E| STA.b $E0

|0EDA50| LDA.l $7EC202
|0EDA54| STA.b $E2

|0EDA56| LDA.l $7EC204
|0EDA5A| STA.b $E6

|0EDA5C| LDA.l $7EC206
|0EDA60| STA.b $E8

|0EDA62| STZ.b $E4
|0EDA64| STZ.b $EA

|0EDA66| LDA.l $7EC221
|0EDA6A| STA.w $011A

|0EDA6D| LDA.l $7EC223
|0EDA71| STA.w $011C

|0EDA74| SEP #$30

|0EDA76| INC.b $15

.exit
|0EDA78| RTL

;===================================================================================================

UnderworldMap_RecoverLightCone:
|0EDA79| JSL OrientLampLightCone

|0EDA7D| INC.b $13

|0EDA7F| LDA.b $13
|0EDA81| CMP.b #$0F
|0EDA83| BNE .exit

|0EDA85| LDA.w $010C
|0EDA88| STA.b $10

|0EDA8A| STZ.b $11
|0EDA8C| STZ.w $0200
|0EDA8F| STZ.b $B0

|0EDA91| LDA.b #$0F
|0EDA93| STA.b $13

|0EDA95| LDA.l $7EC229
|0EDA99| STA.b $9B

.exit
|0EDA9B| RTL

;===================================================================================================

DungeonMap_BG3Tilemap:
|0EDA9C| dw $4260, $0100 ; VRAM $C084 | 2 bytes | Horizontal
|0EDAA0| dw $2100

|0EDAA2| dw $4360, $0E40 ; VRAM $C086 | 16 bytes | Fixed horizontal
|0EDAA6| dw $2101

|0EDAA8| dw $4B60, $0100 ; VRAM $C096 | 2 bytes | Horizontal
|0EDAAC| dw $6100

|0EDAAE| dw $6260, $2EC0 ; VRAM $C0C4 | 48 bytes | Fixed vertical
|0EDAB2| dw $2110

|0EDAB4| dw $6B60, $2EC0 ; VRAM $C0D6 | 48 bytes | Fixed vertical
|0EDAB8| dw $6110

|0EDABA| dw $6263, $0100 ; VRAM $C6C4 | 2 bytes | Horizontal
|0EDABE| dw $A100

|0EDAC0| dw $6363, $0E40 ; VRAM $C6C6 | 16 bytes | Fixed horizontal
|0EDAC4| dw $A101

|0EDAC6| dw $6B63, $0100 ; VRAM $C6D6 | 2 bytes | Horizontal
|0EDACA| dw $E100

|0EDACC| dw $8460, $0B00 ; VRAM $C108 | 12 bytes | Horizontal
|0EDAD0| dw $2102, $2103, $2104, $2105, $2106, $2107

|0EDADC| dw $A460, $0B00 ; VRAM $C148 | 12 bytes | Horizontal
|0EDAE0| dw $2112, $2113, $2114, $2115, $2116, $2117

|0EDAEC| dw $4E60, $0100 ; VRAM $C09C | 2 bytes | Horizontal
|0EDAF0| dw $2100

|0EDAF2| dw $4F60, $1A40 ; VRAM $C09E | 28 bytes | Fixed horizontal
|0EDAF6| dw $2101

|0EDAF8| dw $5D60, $0100 ; VRAM $C0BA | 2 bytes | Horizontal
|0EDAFC| dw $6100

|0EDAFE| dw $6E60, $2EC0 ; VRAM $C0DC | 48 bytes | Fixed vertical
|0EDB02| dw $2110

|0EDB04| dw $7D60, $2EC0 ; VRAM $C0FA | 48 bytes | Fixed vertical
|0EDB08| dw $6110

|0EDB0A| dw $6E63, $0100 ; VRAM $C6DC | 2 bytes | Horizontal
|0EDB0E| dw $A100

|0EDB10| dw $6F63, $1A40 ; VRAM $C6DE | 28 bytes | Fixed horizontal
|0EDB14| dw $A101

|0EDB16| dw $7D63, $0100 ; VRAM $C6FA | 2 bytes | Horizontal
|0EDB1A| dw $E100

|0EDB1C| dw $0060, $7E40 ; VRAM $C000 | 128 bytes | Fixed horizontal
|0EDB20| dw $2111

|0EDB22| dw $8063, $3E41 ; VRAM $C700 | 320 bytes | Fixed horizontal
|0EDB26| dw $2111

|0EDB28| dw $0060, $3EC0 ; VRAM $C000 | 64 bytes | Fixed vertical
|0EDB2C| dw $2111

|0EDB2E| dw $0160, $3EC0 ; VRAM $C002 | 64 bytes | Fixed vertical
|0EDB32| dw $2111

|0EDB34| dw $0C60, $3EC0 ; VRAM $C018 | 64 bytes | Fixed vertical
|0EDB38| dw $2111

|0EDB3A| dw $0D60, $3EC0 ; VRAM $C01A | 64 bytes | Fixed vertical
|0EDB3E| dw $2111

|0EDB40| dw $1E60, $3EC0 ; VRAM $C03C | 64 bytes | Fixed vertical
|0EDB44| dw $2111

|0EDB46| dw $1F60, $3EC0 ; VRAM $C03E | 64 bytes | Fixed vertical
|0EDB4A| dw $2111

|0EDB4C| dw $9110, $12C0 ; VRAM $2122 | 20 bytes | Fixed vertical
|0EDB50| dw $0B12

|0EDB52| dw $9210, $1300 ; VRAM $2124 | 20 bytes | Horizontal
|0EDB56| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDB66| dw $0B06, $0B30

|0EDB6A| dw $B310, $1100 ; VRAM $2166 | 18 bytes | Horizontal
|0EDB6E| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDB7E| dw $0B12

|0EDB80| dw $D210, $1300 ; VRAM $21A4 | 20 bytes | Horizontal
|0EDB84| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDB94| dw $0B06, $0B30

|0EDB98| dw $F310, $1100 ; VRAM $21E6 | 18 bytes | Horizontal
|0EDB9C| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDBAC| dw $0B12

|0EDBAE| dw $1211, $1300 ; VRAM $2224 | 20 bytes | Horizontal
|0EDBB2| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDBC2| dw $0B06, $0B30

|0EDBC6| dw $3311, $1100 ; VRAM $2266 | 18 bytes | Horizontal
|0EDBCA| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDBDA| dw $0B12

|0EDBDC| dw $5211, $1300 ; VRAM $22A4 | 20 bytes | Horizontal
|0EDBE0| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDBF0| dw $0B06, $0B30

|0EDBF4| dw $7311, $1100 ; VRAM $22E6 | 18 bytes | Horizontal
|0EDBF8| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDC08| dw $0B12

|0EDC0A| dw $9211, $1300 ; VRAM $2324 | 20 bytes | Horizontal
|0EDC0E| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDC1E| dw $0B06, $0B30

|0EDC22| dw $B311, $1100 ; VRAM $2366 | 18 bytes | Horizontal
|0EDC26| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDC36| dw $0B12

|0EDC38| dw $D211, $1240 ; VRAM $23A4 | 20 bytes | Fixed horizontal
|0EDC3C| dw $0B06

|0EDC3E| dw $1112, $12C0 ; VRAM $2422 | 20 bytes | Fixed vertical
|0EDC42| dw $0B12

|0EDC44| dw $1212, $1300 ; VRAM $2424 | 20 bytes | Horizontal
|0EDC48| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDC58| dw $0B06, $0B30

|0EDC5C| dw $3312, $1100 ; VRAM $2466 | 18 bytes | Horizontal
|0EDC60| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDC70| dw $0B12

|0EDC72| dw $5212, $1300 ; VRAM $24A4 | 20 bytes | Horizontal
|0EDC76| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDC86| dw $0B06, $0B30

|0EDC8A| dw $7312, $1100 ; VRAM $24E6 | 18 bytes | Horizontal
|0EDC8E| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDC9E| dw $0B12

|0EDCA0| dw $9212, $1300 ; VRAM $2524 | 20 bytes | Horizontal
|0EDCA4| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDCB4| dw $0B06, $0B30

|0EDCB8| dw $B312, $1100 ; VRAM $2566 | 18 bytes | Horizontal
|0EDCBC| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDCCC| dw $0B12

|0EDCCE| dw $D212, $1300 ; VRAM $25A4 | 20 bytes | Horizontal
|0EDCD2| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDCE2| dw $0B06, $0B30

|0EDCE6| dw $F312, $1100 ; VRAM $25E6 | 18 bytes | Horizontal
|0EDCEA| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDCFA| dw $0B12

|0EDCFC| dw $1213, $1300 ; VRAM $2624 | 20 bytes | Horizontal
|0EDD00| dw $0B06, $0B30, $0B06, $0B30, $0B06, $0B30, $0B06, $0B30
|0EDD10| dw $0B06, $0B30

|0EDD14| dw $3313, $1100 ; VRAM $2666 | 18 bytes | Horizontal
|0EDD18| dw $0B12, $0B00, $0B12, $0B00, $0B12, $0B00, $0B12, $0B00
|0EDD28| dw $0B12

|0EDD2A| dw $5213, $1240 ; VRAM $26A4 | 20 bytes | Fixed horizontal
|0EDD2E| dw $0B06

|0EDD30| db $FF ; end of stripes data

;===================================================================================================
; FREE ROM: 0x0F
;===================================================================================================
NULL_0EDD31:
|0EDD31| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EDD39| db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

MemorizeMap16Change:
|0EDD40| CMP.w #$0DC5 ; cut grass
|0EDD43| BEQ .exit

|0EDD45| CMP.w #$0DC9 ; dirt patch
|0EDD48| BEQ .exit

|0EDD4A| PHA
|0EDD4B| PHX

|0EDD4C| TXY

|0EDD4D| LDX.w $04AC
|0EDD50| STA.l $7EFA00,X

|0EDD54| TYA
|0EDD55| STA.l $7EF800,X

|0EDD59| INX
|0EDD5A| INX
|0EDD5B| STX.w $04AC

|0EDD5E| PLX
|0EDD5F| PLA

.exit
|0EDD60| RTL

;===================================================================================================

TRPegLocations:
|0EDD61| dw $0826, $05A0, $081A

;---------------------------------------------------------------------------------------------------

HandlePegPuzzles:
|0EDD67| LDA.b $8A
|0EDD69| CMP.w #$0007 ; OW 07
|0EDD6C| BNE HandleStakeField

|0EDD6E| LDA.l $7EF287
|0EDD72| AND.w #$0020
|0EDD75| BNE .exit

|0EDD77| STX.b $00

|0EDD79| LDX.w $04C8
|0EDD7C| CPX.w #$FFFF
|0EDD7F| BEQ .fail

|0EDD81| LDA.l TRPegLocations,X
|0EDD85| CMP.b $00
|0EDD87| BNE .fail

|0EDD89| LDA.w #$2D00 ; SFX3.2D; Writes #$2D00, which unqueues SFX2.
|0EDD8C| STA.w $012E

|0EDD8F| INX
|0EDD90| INX
|0EDD91| STX.w $04C8

|0EDD94| CPX.w #$0006
|0EDD97| BNE .unsolved

|0EDD99| LDA.w #$1B00 ; SFX3.1B; Writes #$1B00, which unqueues SFX2.
|0EDD9C| STA.w $012E

|0EDD9F| LDA.l $7EF287
|0EDDA3| ORA.w #$0020
|0EDDA6| STA.l $7EF287

|0EDDAA| SEP #$20

|0EDDAC| LDA.b #$2F
|0EDDAE| STA.b $11

|0EDDB0| REP #$20

.unsolved
|0EDDB2| LDX.b $00

|0EDDB4| RTL

;---------------------------------------------------------------------------------------------------

.fail
|0EDDB5| LDA.w #$003C ; SFX2.3C; Writes #$003C, which unqueues SFX3.
|0EDDB8| STA.w $012E

|0EDDBB| LDA.w #$FFFF
|0EDDBE| STA.w $04C8

|0EDDC1| LDX.b $00

.exit
|0EDDC3| RTL

;===================================================================================================

HandleStakeField:
|0EDDC4| CMP.w #$0062 ; OW 62
|0EDDC7| BNE .exit

|0EDDC9| INC.w $04C8

|0EDDCC| LDA.w $04C8
|0EDDCF| CMP.w #$0016
|0EDDD2| BNE .exit

|0EDDD4| PHX

|0EDDD5| SEP #$20

|0EDDD7| LDA.l $7EF2E2
|0EDDDB| ORA.b #$20
|0EDDDD| STA.l $7EF2E2

|0EDDE1| LDA.b #$1B ; SFX3.1B
|0EDDE3| STA.w $012F

|0EDDE6| REP #$20

|0EDDE8| LDA.w #$0050
|0EDDEB| STA.w $0692

|0EDDEE| LDA.w #$0D20
|0EDDF1| STA.w $0698

|0EDDF4| JSL BigMap16Update_long

|0EDDF8| REP #$30

|0EDDFA| PLX

.exit
|0EDDFB| RTL

;===================================================================================================

FlashTowerAfterCrystals:
|0EDDFC| LDA.b $B0
|0EDDFE| BNE .skip_sfx

|0EDE00| LDA.b #$2E ; SFX2.2E
|0EDE02| STA.w $012E

|0EDE05| JML PaletteBlackAndWhiteSomething

;---------------------------------------------------------------------------------------------------

.skip_sfx
|0EDE09| JSL PaletteFilter_BlindingWhite

|0EDE0D| REP #$30

|0EDE0F| LDA.l $7EC009
|0EDE13| CMP.w #$00FF
|0EDE16| BNE .dont_advance_step

|0EDE18| STA.l $7EC007
|0EDE1C| STA.l $7EC009

|0EDE20| SEP #$30

|0EDE22| INC.b $B0

|0EDE24| RTL

;---------------------------------------------------------------------------------------------------

.dont_advance_step
|0EDE25| JML RestorePalette

;===================================================================================================

pool CheckForSpecialOverworldTrigger

.tile_type
|0EDE29| dw $0105
|0EDE2B| dw $01E4
|0EDE2D| dw $00AD
|0EDE2F| dw $00B9

.screen_id
|0EDE31| dw $0000 ; OW 00
|0EDE33| dw $002D ; OW 2D
|0EDE35| dw $000F ; OW 0F
|0EDE37| dw $0081 ; OW 81

.direction
|0EDE39| dw $0008
|0EDE3B| dw $0002
|0EDE3D| dw $0008
|0EDE3F| dw $0008

.special_id
|0EDE41| dw $0180 ; OW 80
|0EDE43| dw $0181 ; OW 81
|0EDE45| dw $0182 ; OW 82
|0EDE47| dw $0189 ; OW 89

endpool

;---------------------------------------------------------------------------------------------------

CheckForSpecialOverworldTrigger:
|0EDE49| REP #$31

|0EDE4B| JSR GetMap16Object

|0EDE4E| LDA.l Map16Definitions,X
|0EDE52| AND.w #$01FF
|0EDE55| STA.b $00

|0EDE57| LDX.w #$0008

.check_next_screen
|0EDE5A| LDA.b $00

.check_next_tile
|0EDE5C| DEX
|0EDE5D| DEX
|0EDE5E| BMI .exit

|0EDE60| CMP.l .tile_type,X
|0EDE64| BNE .check_next_tile

|0EDE66| LDA.b $8A
|0EDE68| CMP.l .screen_id,X
|0EDE6C| BNE .check_next_screen

;---------------------------------------------------------------------------------------------------

|0EDE6E| LDA.l .special_id,X
|0EDE72| STA.b $A0

|0EDE74| SEP #$20

|0EDE76| LDA.l .direction,X
|0EDE7A| STA.b $67

|0EDE7C| STA.w $0410
|0EDE7F| STA.w $0416

|0EDE82| LDX.w #$0004

.continue_shifting
|0EDE85| DEX

|0EDE86| LSR A
|0EDE87| BCC .continue_shifting

|0EDE89| STX.w $0418
|0EDE8C| STX.w $069C

|0EDE8F| LDA.b #$17
|0EDE91| STA.b $11

|0EDE93| LDA.b #$0B
|0EDE95| STA.b $10

.exit
|0EDE97| SEP #$30

|0EDE99| RTL

;===================================================================================================

GetMap16Object:
|0EDE9A| LDA.b $20
|0EDE9C| CLC
|0EDE9D| ADC.w #$000C
|0EDEA0| STA.b $00

|0EDEA2| SEC
|0EDEA3| SBC.w $0708

|0EDEA6| AND.w $070A
|0EDEA9| ASL A
|0EDEAA| ASL A
|0EDEAB| ASL A
|0EDEAC| STA.b $06

|0EDEAE| LDA.b $22
|0EDEB0| CLC
|0EDEB1| ADC.w #$0008

|0EDEB4| LSR A
|0EDEB5| LSR A
|0EDEB6| LSR A
|0EDEB7| STA.b $02

|0EDEB9| SEC
|0EDEBA| SBC.w $070C

|0EDEBD| AND.w $070E
|0EDEC0| CLC
|0EDEC1| ADC.b $06

|0EDEC3| TAY
|0EDEC4| TAX

|0EDEC5| LDA.l $7E2000,X
|0EDEC9| ASL A
|0EDECA| ASL A
|0EDECB| ASL A
|0EDECC| TAX

|0EDECD| RTS

;===================================================================================================

pool CheckForReturnTrigger

.tile_type
|0EDECE| dw $017C
|0EDED0| dw $01E4
|0EDED2| dw $00AD

.screen_id
|0EDED4| dw $0080 ; OW 80
|0EDED6| dw $0080 ; OW 80
|0EDED8| dw $0081 ; OW 81

.direction
|0EDEDA| dw $0004
|0EDEDC| dw $0001
|0EDEDE| dw $0004

endpool

;---------------------------------------------------------------------------------------------------

#EXIT_0EDEE0:
|0EDEE0| SEP #$30

|0EDEE2| RTL

;---------------------------------------------------------------------------------------------------

CheckForReturnTrigger:
|0EDEE3| REP #$31

|0EDEE5| JSR GetMap16Object

|0EDEE8| LDA.l Map16Definitions,X
|0EDEEC| AND.w #$01FF
|0EDEEF| STA.b $00

|0EDEF1| LDX.w #$0006

.check_next_screen
|0EDEF4| LDA.b $00

.check_next_tile
|0EDEF6| DEX
|0EDEF7| DEX
|0EDEF8| BMI EXIT_0EDEE0

|0EDEFA| CMP.l .tile_type,X
|0EDEFE| BNE .check_next_tile

|0EDF00| LDA.b $8A
|0EDF02| CMP.l .screen_id,X
|0EDF06| BNE .check_next_screen

|0EDF08| SEP #$30

|0EDF0A| LDA.l .direction,X
|0EDF0E| STA.b $67

|0EDF10| LDX.b #$04

.keep_shifting
|0EDF12| DEX

|0EDF13| LSR A
|0EDF14| BCC .keep_shifting

|0EDF16| TXA
|0EDF17| STA.w $0418

|0EDF1A| LDA.b $67

|0EDF1C| LDX.b #$04

.just_keep_shifting
|0EDF1E| DEX

|0EDF1F| LSR A
|0EDF20| BCC .just_keep_shifting

|0EDF22| TXA
|0EDF23| STA.w $069C

|0EDF26| LDA.b #$24
|0EDF28| STA.b $11

|0EDF2A| STZ.b $B0
|0EDF2C| STZ.b $A0

|0EDF2E| RTL

;===================================================================================================
; FREE ROM: 0x11
;===================================================================================================
NULL_0EDF2F:
|0EDF2F| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EDF37| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EDF3F| db $FF

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
|0EEE21| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE29| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE31| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE39| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE41| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE49| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE51| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE59| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE61| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE69| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE71| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE79| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE81| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE89| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE91| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEE99| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEA1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEA9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEB1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEB9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEC1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEC9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEED1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEED9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEE1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEE9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEF1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEEF9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF01| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF09| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF11| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF19| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF21| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF29| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF31| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF39| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF41| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF49| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF51| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF59| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF61| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF69| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF71| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF79| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF81| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF89| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF91| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEF99| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFA1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFA9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFB1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFB9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFC1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFC9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFD1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFD9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFE1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFE9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFF1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EEFF9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF001| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF009| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF011| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF019| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF021| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF029| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF031| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF039| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF041| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF049| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF051| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF059| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF061| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF069| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF071| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF079| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF081| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF089| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF091| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF099| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0A1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0A9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0B1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0B9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0C1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0C9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0D1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0D9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0E1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0E9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0F1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF0F9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF101| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF109| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF111| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF119| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF121| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF129| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF131| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF139| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF141| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF149| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF151| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF159| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF161| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF169| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF171| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF179| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF181| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF189| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF191| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF199| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1A1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1A9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1B1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1B9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1C1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1C9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1D1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1D9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1E1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1E9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1F1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF1F9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF201| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF209| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF211| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF219| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF221| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF229| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF231| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF239| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF241| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF249| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF251| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF259| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF261| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF269| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF271| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF279| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF281| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF289| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF291| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF299| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2A1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2A9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2B1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2B9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2C1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2C9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2D1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2D9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2E1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2E9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2F1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF2F9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF301| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF309| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF311| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF319| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF321| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF329| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF331| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF339| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF341| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF349| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF351| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF359| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF361| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF369| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF371| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF379| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF381| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF389| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF391| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF399| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3A1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3A9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3B1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3B9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3C1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3C9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3D1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3D9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3E1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3E9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3F1| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EF3F9| db $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

PaletteBlackAndWhiteSomething_Conditional:
|0EF400| LDA.b $B0
|0EF402| BNE PaletteBlackSomething

;===================================================================================================

PaletteBlackAndWhiteSomething:
|0EF404| REP #$20

|0EF406| LDX.b #$00

.next
|0EF408| LDA.l $7EC300,X
|0EF40C| STA.l $7FDD80,X

|0EF410| LDA.l $7EC380,X
|0EF414| STA.l $7FDE00,X

|0EF418| LDA.l $7EC400,X
|0EF41C| STA.l $7FDE80,X

|0EF420| LDA.l $7EC480,X
|0EF424| STA.l $7FDF00,X

|0EF428| LDA.w #$7FFF ; RGB: #F8F8F8
|0EF42B| STA.l $7EC300,X
|0EF42F| STA.l $7EC380,X
|0EF433| STA.l $7EC400,X
|0EF437| STA.l $7EC480,X

|0EF43B| INX
|0EF43C| INX
|0EF43D| CPX.b #$80
|0EF43F| BNE .next

;---------------------------------------------------------------------------------------------------

|0EF441| LDA.l $7EC500
|0EF445| STA.l $7EC540

|0EF449| LDA.w #$0000
|0EF44C| STA.l $7EC007

|0EF450| LDA.w #$0002
|0EF453| STA.l $7EC009

|0EF457| SEP #$20

|0EF459| INC.b $B0

|0EF45B| RTL

;===================================================================================================

PaletteBlackSomething:
|0EF45C| JSL PaletteFilter_BlindingWhite

|0EF460| REP #$30

|0EF462| LDA.l $7EC009
|0EF466| CMP.w #$00FF
|0EF469| BNE RestorePalette

;---------------------------------------------------------------------------------------------------

|0EF46B| LDX.w #$000E
|0EF46E| LDA.w #$0000 ; RGB: #000000

.next_color
|0EF471| STA.l $7EC3B0,X
|0EF475| STA.l $7EC5B0,X

|0EF479| DEX
|0EF47A| DEX
|0EF47B| BPL .next_color

;---------------------------------------------------------------------------------------------------

|0EF47D| STA.l $7EC007
|0EF481| STA.l $7EC009

|0EF485| SEP #$20

|0EF487| STZ.b $11

|0EF489| SEP #$30

|0EF48B| RTL

;===================================================================================================

RestorePalette:
|0EF48C| CMP.w #$0000
|0EF48F| BNE .exit

|0EF491| LDA.l $7EC007
|0EF495| CMP.w #$001F
|0EF498| BNE .exit

;---------------------------------------------------------------------------------------------------

|0EF49A| LDX.w #$0000

.next
|0EF49D| LDA.l $7FDD80,X
|0EF4A1| STA.l $7EC300,X

|0EF4A5| LDA.l $7FDDC0,X
|0EF4A9| STA.l $7EC340,X

|0EF4AD| LDA.l $7FDE00,X
|0EF4B1| STA.l $7EC380,X

|0EF4B5| LDA.l $7FDE40,X
|0EF4B9| STA.l $7EC3C0,X

|0EF4BD| LDA.l $7FDE80,X
|0EF4C1| STA.l $7EC400,X

|0EF4C5| LDA.l $7FDEC0,X
|0EF4C9| STA.l $7EC440,X

|0EF4CD| LDA.l $7FDF00,X
|0EF4D1| STA.l $7EC480,X

|0EF4D5| LDA.l $7FDF40,X
|0EF4D9| STA.l $7EC4C0,X

|0EF4DD| INX
|0EF4DE| INX
|0EF4DF| CPX.w #$0040
|0EF4E2| BNE .next

;---------------------------------------------------------------------------------------------------

|0EF4E4| SEP #$20

|0EF4E6| STZ.b $1D

.exit
|0EF4E8| SEP #$30

|0EF4EA| RTL

;===================================================================================================

Palettes_BlueThunder1:
|0EF4EB| dw  $0884,  $0CC7,  $150A,  $154D,  $7FF6,  $5944,  $7AD1

Palettes_BlueThunder2:
|0EF4F9| dw  $0884,  $0CC7,  $150A,  $154D,  $5BFF,  $7AD1,  $21AF

Palettes_BlueThunder3:
|0EF507| dw  $1084,  $48C0,  $6186,  $7E6D,  $7FE0,  $5944,  $7E20

Palettes_BlueThunder4:
|0EF515| dw  $1084,  $000E,  $1059,  $291F,  $7FE0,  $5944,  $7E20

Palettes_BlueThunder5:
|0EF523| dw  $1084,  $1508,  $196C,  $21AF,  $7FF6,  $1D4C,  $7AD1

;---------------------------------------------------------------------------------------------------

Palettes_GanonTowerFlash:
|0EF531| dw  $7FFF,  $0884,  $1CC8,  $1DCE,  $3694,  $4718,  $1D4A,  $18AC
|0EF541| dw  $7FFF,  $1908,  $2D2F,  $3614,  $4EDA,  $471F,  $1D4A,  $390F
|0EF551| dw  $7FFF,  $34CD,  $5971,  $5635,  $7F1B,  $7FFF,  $1D4A,  $3D54
|0EF561| dw  $7FFF,  $1908,  $2D2F,  $3614,  $4EDA,  $471F,  $1D4A,  $390F
|0EF571| dw  $7FFF,  $0884,  $052A,  $21EF,  $3AB5,  $4B39,  $1D4C,  $18AC

;===================================================================================================

#EXIT_0EF581:
|0EF581| RTL

;===================================================================================================

FlashGanonTowerPalette:
|0EF582| LDA.w $04C6
|0EF585| BNE EXIT_0EF581

|0EF587| LDA.b $8A
|0EF589| CMP.b #$43 ; OW 43
|0EF58B| BEQ .on_dark_dm

|0EF58D| CMP.b #$45 ; OW 45
|0EF58F| BEQ .on_dark_dm

|0EF591| CMP.b #$47 ; OW 47
|0EF593| BNE EXIT_0EF581

;---------------------------------------------------------------------------------------------------

.on_dark_dm
|0EF595| PHB
|0EF596| PHK
|0EF597| PLB

|0EF598| LDA.b $1A
|0EF59A| CMP.b #$03
|0EF59C| BEQ .normal_color

|0EF59E| CMP.b #$05
|0EF5A0| BEQ .pink

|0EF5A2| CMP.b #$24
|0EF5A4| BEQ .thunder

|0EF5A6| CMP.b #$2C
|0EF5A8| BEQ .pink

|0EF5AA| CMP.b #$58
|0EF5AC| BEQ .normal_color

|0EF5AE| CMP.b #$5A
|0EF5B0| BNE .bright_white

.pink
|0EF5B2| REP #$20

;---------------------------------------------------------------------------------------------------

|0EF5B4| LDX.b #$02

.restore_next
|0EF5B6| LDA.l $7EC360,X
|0EF5BA| STA.l $7EC560,X

|0EF5BE| LDA.l $7EC370,X
|0EF5C2| STA.l $7EC570,X

|0EF5C6| LDA.l $7EC390,X
|0EF5CA| STA.l $7EC590,X

|0EF5CE| LDA.l $7EC3E0,X
|0EF5D2| STA.l $7EC5E0,X

|0EF5D6| LDA.l $7EC3F0,X
|0EF5DA| STA.l $7EC5F0,X

|0EF5DE| INX
|0EF5DF| INX
|0EF5E0| CPX.b #$10
|0EF5E2| BNE .restore_next

|0EF5E4| BRA .bright_white

;---------------------------------------------------------------------------------------------------

.thunder
|0EF5E6| LDX.b #$36 ; SFX2.36
|0EF5E8| STX.w $012E

;---------------------------------------------------------------------------------------------------

.normal_color
|0EF5EB| REP #$20

|0EF5ED| LDX.b #$02
|0EF5EF| LDY.b #$00

.next_thunder
|0EF5F1| LDA.w Palettes_BlueThunder1,Y
|0EF5F4| STA.l $7EC560,X

|0EF5F8| LDA.w Palettes_BlueThunder2,Y
|0EF5FB| STA.l $7EC570,X

|0EF5FF| LDA.w Palettes_BlueThunder3,Y
|0EF602| STA.l $7EC590,X

|0EF606| LDA.w Palettes_BlueThunder4,Y
|0EF609| STA.l $7EC5E0,X

|0EF60D| LDA.w Palettes_BlueThunder5,Y
|0EF610| STA.l $7EC5F0,X

|0EF614| INY
|0EF615| INY

|0EF616| INX
|0EF617| INX
|0EF618| CPX.b #$10
|0EF61A| BNE .next_thunder

;---------------------------------------------------------------------------------------------------

.bright_white
|0EF61C| SEP #$20

|0EF61E| LDX.b #$00
|0EF620| LDY.b #$40

|0EF622| LDA.b $8A
|0EF624| CMP.b #$43 ; OW 43
|0EF626| BEQ .main_mountain

|0EF628| CMP.b #$45 ; OW 45
|0EF62A| BNE .next_gt

;---------------------------------------------------------------------------------------------------

.main_mountain
|0EF62C| LDA.l $7EF2C3
|0EF630| AND.b #$20
|0EF632| BNE .gt_opened

|0EF634| LDA.b $1A
|0EF636| AND.b #$0C
|0EF638| ASL A
|0EF639| ASL A
|0EF63A| TAY

;---------------------------------------------------------------------------------------------------

.next_gt
|0EF63B| REP #$20

|0EF63D| LDA.w Palettes_GanonTowerFlash,Y
|0EF640| STA.l $7EC5D0,X

|0EF644| INY
|0EF645| INY

|0EF646| INX
|0EF647| INX
|0EF648| CPX.b #$10
|0EF64A| BNE .next_gt

;---------------------------------------------------------------------------------------------------

.gt_opened
|0EF64C| SEP #$20

|0EF64E| PLB

|0EF64F| INC.b $15

|0EF651| RTL

;===================================================================================================

ApplyOverworldOverlay:
|0EF652| PHB

|0EF653| LDA.b #$7E
|0EF655| PHA
|0EF656| PLB

|0EF657| REP #$30

|0EF659| LDA.b $8A
|0EF65B| ASL A
|0EF65C| TAX

|0EF65D| JSR (.vectors,X)

|0EF660| SEP #$30

|0EF662| PLB

|0EF663| RTL

;---------------------------------------------------------------------------------------------------

.vectors
|0EF664| dw OverworldOverlay_LumberjackTree        ; 0x00
|0EF666| dw OverworldOverlay_LumberjackTree        ; 0x01
|0EF668| dw OverworldOverlay_LumberjackTree        ; 0x02
|0EF66A| dw OverworldOverlay_TurtleRockPortal      ; 0x03
|0EF66C| dw OverworldOverlay_TurtleRockPortal      ; 0x04
|0EF66E| dw OverworldOverlay_TurtleRockPortal      ; 0x05
|0EF670| dw OverworldOverlay_TurtleRockPortal      ; 0x06
|0EF672| dw OverworldOverlay_TurtleRockPortal      ; 0x07
|0EF674| dw OverworldOverlay_BonkRocks             ; 0x08
|0EF676| dw OverworldOverlay_BonkRocks             ; 0x09
|0EF678| dw OverworldOverlay_BonkRocks             ; 0x0A
|0EF67A| dw OverworldOverlay_BonkRocks             ; 0x0B
|0EF67C| dw OverworldOverlay_BonkRocks             ; 0x0C
|0EF67E| dw OverworldOverlay_BonkRocks             ; 0x0D
|0EF680| dw OverworldOverlay_BonkRocks             ; 0x0E
|0EF682| dw OverworldOverlay_BonkRocks             ; 0x0F
|0EF684| dw OverworldOverlay_BonkRocks             ; 0x10
|0EF686| dw OverworldOverlay_BonkRocks             ; 0x11
|0EF688| dw OverworldOverlay_BonkRocks             ; 0x12
|0EF68A| dw OverworldOverlay_BonkRocks             ; 0x13
|0EF68C| dw OverworldOverlay_KingsTomb             ; 0x14
|0EF68E| dw OverworldOverlay_WeatherVane           ; 0x15
|0EF690| dw OverworldOverlay_WeatherVane           ; 0x16
|0EF692| dw OverworldOverlay_WeatherVane           ; 0x17
|0EF694| dw OverworldOverlay_WeatherVane           ; 0x18
|0EF696| dw OverworldOverlay_WeatherVane           ; 0x19
|0EF698| dw OverworldOverlay_CastleGate            ; 0x1A
|0EF69A| dw OverworldOverlay_CastleGate            ; 0x1B
|0EF69C| dw OverworldOverlay_CastleGate            ; 0x1C
|0EF69E| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1D
|0EF6A0| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1E
|0EF6A2| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x1F
|0EF6A4| dw OverworldOverlay_WeatherVane           ; 0x20
|0EF6A6| dw OverworldOverlay_WeatherVane           ; 0x21
|0EF6A8| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x22
|0EF6AA| dw OverworldOverlay_CastleGate            ; 0x23
|0EF6AC| dw OverworldOverlay_CastleGate            ; 0x24
|0EF6AE| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x25
|0EF6B0| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x26
|0EF6B2| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x27
|0EF6B4| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x28
|0EF6B6| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x29
|0EF6B8| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x2A
|0EF6BA| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x2B
|0EF6BC| dw OverworldOverlay_CheckerBoardCave      ; 0x2C
|0EF6BE| dw OverworldOverlay_CheckerBoardCave      ; 0x2D
|0EF6C0| dw OverworldOverlay_CheckerBoardCave      ; 0x2E
|0EF6C2| dw OverworldOverlay_CheckerBoardCave      ; 0x2F
|0EF6C4| dw OverworldOverlay_CheckerBoardCave      ; 0x30
|0EF6C6| dw OverworldOverlay_CheckerBoardCave      ; 0x31
|0EF6C8| dw OverworldOverlay_IceRodThief           ; 0x32
|0EF6CA| dw OverworldOverlay_IceRodThief           ; 0x33
|0EF6CC| dw OverworldOverlay_IceRodThief           ; 0x34
|0EF6CE| dw OverworldOverlay_IceRodThief           ; 0x35
|0EF6D0| dw OverworldOverlay_IceRodThief           ; 0x36
|0EF6D2| dw OverworldOverlay_IceRodThief           ; 0x37
|0EF6D4| dw OverworldOverlay_CheckerBoardCave      ; 0x38
|0EF6D6| dw OverworldOverlay_CheckerBoardCave      ; 0x39
|0EF6D8| dw OverworldOverlay_DesertThief           ; 0x3A
|0EF6DA| dw OverworldOverlay_DrainedDam            ; 0x3B
|0EF6DC| dw OverworldOverlay_SkullWoods            ; 0x3C
|0EF6DE| dw OverworldOverlay_SkullWoods            ; 0x3D
|0EF6E0| dw OverworldOverlay_SkullWoods            ; 0x3E
|0EF6E2| dw OverworldOverlay_SkullWoods            ; 0x3F
|0EF6E4| dw OverworldOverlay_SkullWoods            ; 0x40
|0EF6E6| dw OverworldOverlay_SkullWoods            ; 0x41
|0EF6E8| dw OverworldOverlay_GanonsTower           ; 0x42
|0EF6EA| dw OverworldOverlay_GanonsTower           ; 0x43
|0EF6EC| dw OverworldOverlay_GanonsTower           ; 0x44
|0EF6EE| dw OverworldOverlay_HookshotCave          ; 0x45
|0EF6F0| dw OverworldOverlay_HookshotCave          ; 0x46
|0EF6F2| dw OverworldOverlay_TurtleRock            ; 0x47
|0EF6F4| dw OverworldOverlay_SkullWoods            ; 0x48
|0EF6F6| dw OverworldOverlay_SkullWoods            ; 0x49
|0EF6F8| dw OverworldOverlay_GargoylesDomain       ; 0x4A
|0EF6FA| dw OverworldOverlay_GanonsTower           ; 0x4B
|0EF6FC| dw OverworldOverlay_GanonsTower           ; 0x4C
|0EF6FE| dw OverworldOverlay_HookshotCave          ; 0x4D
|0EF700| dw OverworldOverlay_HookshotCave          ; 0x4E
|0EF702| dw OverworldOverlay_GargoylesDomain       ; 0x4F
|0EF704| dw OverworldOverlay_GargoylesDomain       ; 0x50
|0EF706| dw OverworldOverlay_GargoylesDomain       ; 0x51
|0EF708| dw OverworldOverlay_GargoylesDomain       ; 0x52
|0EF70A| dw OverworldOverlay_GargoylesDomain       ; 0x53
|0EF70C| dw OverworldOverlay_GargoylesDomain       ; 0x54
|0EF70E| dw OverworldOverlay_GargoylesDomain       ; 0x55
|0EF710| dw OverworldOverlay_GargoylesDomain       ; 0x56
|0EF712| dw OverworldOverlay_GargoylesDomain       ; 0x57
|0EF714| dw OverworldOverlay_GargoylesDomain       ; 0x58
|0EF716| dw OverworldOverlay_GargoylesDomain       ; 0x59
|0EF718| dw OverworldOverlay_PyramidHole           ; 0x5A
|0EF71A| dw OverworldOverlay_PyramidHole           ; 0x5B
|0EF71C| dw OverworldOverlay_PyramidHole           ; 0x5C
|0EF71E| dw OverworldOverlay_POD                   ; 0x5D
|0EF720| dw OverworldOverlay_POD                   ; 0x5E
|0EF722| dw OverworldOverlay_POD                   ; 0x5F
|0EF724| dw OverworldOverlay_GargoylesDomain       ; 0x60
|0EF726| dw OverworldOverlay_GargoylesDomain       ; 0x61
|0EF728| dw OverworldOverlay_PegPuzzle             ; 0x62
|0EF72A| dw OverworldOverlay_PyramidHole           ; 0x63
|0EF72C| dw OverworldOverlay_PyramidHole           ; 0x64
|0EF72E| dw OverworldOverlay_MiseryMire            ; 0x65
|0EF730| dw OverworldOverlay_POD                   ; 0x66
|0EF732| dw OverworldOverlay_POD                   ; 0x67
|0EF734| dw OverworldOverlay_MiseryMire            ; 0x68
|0EF736| dw OverworldOverlay_MiseryMire            ; 0x69
|0EF738| dw OverworldOverlay_MiseryMire            ; 0x6A
|0EF73A| dw OverworldOverlay_LinksHouseBonkRocks   ; 0x6B
|0EF73C| dw OverworldOverlay_MiseryMire            ; 0x6C
|0EF73E| dw OverworldOverlay_MiseryMire            ; 0x6D
|0EF740| dw OverworldOverlay_MiseryMire            ; 0x6E
|0EF742| dw OverworldOverlay_MiseryMire            ; 0x6F
|0EF744| dw OverworldOverlay_MiseryMire            ; 0x70
|0EF746| dw OverworldOverlay_MiseryMire            ; 0x71
|0EF748| dw NULL_0EFB64                            ; 0x72
|0EF74A| dw NULL_0EFB64                            ; 0x73
|0EF74C| dw NULL_0EFB64                            ; 0x74
|0EF74E| dw NULL_0EFB64                            ; 0x75
|0EF750| dw NULL_0EFB64                            ; 0x76
|0EF752| dw OverworldOverlay_IceRodThief           ; 0x77
|0EF754| dw OverworldOverlay_MiseryMire            ; 0x78
|0EF756| dw OverworldOverlay_MiseryMire            ; 0x79
|0EF758| dw NULL_0EFB64                            ; 0x7A
|0EF75A| dw OverworldOverlay_DrainedDam            ; 0x7B
|0EF75C| dw NULL_0EFB64                            ; 0x7C
|0EF75E| dw NULL_0EFB64                            ; 0x7D
|0EF760| dw NULL_0EFB64                            ; 0x7E
|0EF762| dw NULL_0EFB64                            ; 0x7F

;===================================================================================================

OverworldOverlay_LumberjackTree:
|0EF764| LDA.w #$0E32
|0EF767| STA.w $7E2816
|0EF76A| STA.w $7E2818
|0EF76D| STA.w $7E281A
|0EF770| STA.w $7E281C
|0EF773| STA.w $7E2896
|0EF776| STA.w $7E289C

|0EF779| INC A
|0EF77A| STA.w $7E2898

|0EF77D| INC A
|0EF77E| STA.w $7E289A

|0EF781| INC A
|0EF782| STA.w $7E2916

|0EF785| INC A
|0EF786| STA.w $7E2918

|0EF789| INC A
|0EF78A| STA.w $7E291A

|0EF78D| INC A
|0EF78E| STA.w $7E291C

|0EF791| INC A
|0EF792| STA.w $7E2996

|0EF795| INC A
|0EF796| STA.w $7E2998

|0EF799| INC A
|0EF79A| STA.w $7E299A

|0EF79D| INC A
|0EF79E| STA.w $7E299C

|0EF7A1| INC A
|0EF7A2| STA.w $7E2A18

|0EF7A5| INC A
|0EF7A6| STA.w $7E2A1A

|0EF7A9| RTS

;===================================================================================================

OverworldOverlay_TurtleRockPortal:
|0EF7AA| LDA.w #$0212
|0EF7AD| STA.w $7E2720

|0EF7B0| RTS

;===================================================================================================

OverworldOverlay_BonkRocks:
|0EF7B1| LDX.w #$0506

;===================================================================================================

OverworldOverlay_DrawRevealedStairs:
|0EF7B4| LDA.w #$0918
|0EF7B7| STA.w $7E2000,X

|0EF7BA| INC A
|0EF7BB| STA.w $7E2002,X

|0EF7BE| INC A
|0EF7BF| STA.w $7E2080,X

|0EF7C2| INC A
|0EF7C3| STA.w $7E2082,X

|0EF7C6| RTS

;===================================================================================================

OverworldOverlay_KingsTomb:
|0EF7C7| LDA.w #$0DD1
|0EF7CA| STA.w $7E2532

|0EF7CD| INC A
|0EF7CE| STA.w $7E2534

|0EF7D1| LDA.w #$0DD7
|0EF7D4| STA.w $7E25B2

|0EF7D7| INC A
|0EF7D8| STA.w $7E25B4

|0EF7DB| INC A
|0EF7DC| STA.w $7E2632

|0EF7DF| INC A
|0EF7E0| STA.w $7E2634

|0EF7E3| RTS

;===================================================================================================

OverworldOverlay_WeatherVane:
|0EF7E4| LDA.w #$0E21
|0EF7E7| STA.w $7E2C3E

|0EF7EA| STA.w $7E2C42

|0EF7ED| INC A
|0EF7EE| STA.w $7E2C40

|0EF7F1| INC A
|0EF7F2| STA.w $7E2CBE

|0EF7F5| INC A
|0EF7F6| STA.w $7E2CC0

|0EF7F9| INC A
|0EF7FA| STA.w $7E2CC2

|0EF7FD| RTS

;===================================================================================================

OverworldOverlay_CastleGate:
|0EF7FE| LDA.w #$0DC1
|0EF801| STA.w $7E33BC

|0EF804| INC A
|0EF805| STA.w $7E33BE

|0EF808| LDA.w #$0DBE
|0EF80B| STA.w $7E343C

|0EF80E| INC A
|0EF80F| STA.w $7E343E

|0EF812| LDA.w #$0DC2
|0EF815| STA.w $7E33C0

|0EF818| INC A
|0EF819| STA.w $7E33C2

|0EF81C| LDA.w #$0DBF
|0EF81F| STA.w $7E3440

|0EF822| INC A
|0EF823| STA.w $7E3442

|0EF826| RTS

;===================================================================================================

OverworldOverlay_LinksHouseBonkRocks:
|0EF827| LDX.w #$0330
|0EF82A| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_CheckerBoardCave:
|0EF82D| LDX.w #$0358
|0EF830| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_IceRodThief:
|0EF833| LDX.w #$040C
|0EF836| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_DesertThief:
|0EF839| LDX.w #$0A1E
|0EF83C| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_DrainedDam:
|0EF83F| LDA.w #$0DDF
|0EF842| STA.w $7E23AC
|0EF845| STA.w $7E2424
|0EF848| STA.w $7E24A0
|0EF84B| STA.w $7E251E
|0EF84E| STA.w $7E261C
|0EF851| STA.w $7E2734

|0EF854| INC A
|0EF855| STA.w $7E23AE
|0EF858| STA.w $7E24A2

|0EF85B| INC A
|0EF85C| STA.w $7E23B0
|0EF85F| STA.w $7E2438
|0EF862| STA.w $7E24BA
|0EF865| STA.w $7E25AA
|0EF868| STA.w $7E273A

|0EF86B| INC A
|0EF86C| STA.w $7E2426
|0EF86F| STA.w $7E2428
|0EF872| STA.w $7E242A
|0EF875| STA.w $7E2432
|0EF878| STA.w $7E2434
|0EF87B| STA.w $7E2436

|0EF87E| INC A
|0EF87F| STA.w $7E242C
|0EF882| STA.w $7E24A4
|0EF885| STA.w $7E2520
|0EF888| STA.w $7E261E

|0EF88B| INC A
|0EF88C| STA.w $7E242E
|0EF88F| STA.w $7E24A6
|0EF892| STA.w $7E24A8
|0EF895| STA.w $7E24B0
|0EF898| STA.w $7E24B6
|0EF89B| STA.w $7E2522
|0EF89E| STA.w $7E2524
|0EF8A1| STA.w $7E2526
|0EF8A4| STA.w $7E2538
|0EF8A7| STA.w $7E25A0
|0EF8AA| STA.w $7E25A2
|0EF8AD| STA.w $7E25A4
|0EF8B0| STA.w $7E25A6
|0EF8B3| STA.w $7E2620
|0EF8B6| STA.w $7E2622
|0EF8B9| STA.w $7E269E
|0EF8BC| STA.w $7E26A0
|0EF8BF| STA.w $7E271E
|0EF8C2| STA.w $7E2720
|0EF8C5| STA.w $7E2826
|0EF8C8| STA.w $7E28A6
|0EF8CB| STA.w $7E28A8
|0EF8CE| STA.w $7E2926

|0EF8D1| INC A
|0EF8D2| STA.w $7E2430
|0EF8D5| STA.w $7E24B8
|0EF8D8| STA.w $7E25A8
|0EF8DB| STA.w $7E262A

|0EF8DE| INC A
|0EF8DF| STA.w $7E24AA
|0EF8E2| STA.w $7E24B2
|0EF8E5| STA.w $7E2528
|0EF8E8| STA.w $7E25B8
|0EF8EB| STA.w $7E28AA
|0EF8EE| STA.w $7E2928

|0EF8F1| INC A
|0EF8F2| STA.w $7E24AC
|0EF8F5| STA.w $7E2530
|0EF8F8| STA.w $7E279E
|0EF8FB| STA.w $7E27A0
|0EF8FE| STA.w $7E29A6
|0EF901| STA.w $7E29B8

|0EF904| INC A
|0EF905| STA.w $7E24AE
|0EF908| STA.w $7E24B4
|0EF90B| STA.w $7E2536
|0EF90E| STA.w $7E27A2
|0EF911| STA.w $7E2824

|0EF914| INC A
|0EF915| STA.w $7E252E
|0EF918| STA.w $7E2534
|0EF91B| STA.w $7E279C
|0EF91E| STA.w $7E2822
|0EF921| STA.w $7E2934
|0EF924| STA.w $7E29B6

|0EF927| INC A
|0EF928| STA.w $7E253A
|0EF92B| STA.w $7E2638
|0EF92E| STA.w $7E26B8
|0EF931| STA.w $7E293A

|0EF934| INC A
|0EF935| STA.w $7E259E
|0EF938| STA.w $7E25B6
|0EF93B| STA.w $7E2636
|0EF93E| STA.w $7E269C
|0EF941| STA.w $7E26B6
|0EF944| STA.w $7E271C
|0EF947| STA.w $7E28A4
|0EF94A| STA.w $7E2924

|0EF94D| INC A
|0EF94E| STA.w $7E2624
|0EF951| STA.w $7E26A2

|0EF954| INC A
|0EF955| STA.w $7E2626

|0EF958| INC A
|0EF959| STA.w $7E2628

|0EF95C| INC A
|0EF95D| STA.w $7E26A4

|0EF960| STA.w $7E27B6

|0EF963| INC A
|0EF964| STA.w $7E26A6
|0EF967| STA.w $7E2726
|0EF96A| STA.w $7E2728
|0EF96D| STA.w $7E272A
|0EF970| STA.w $7E27AA
|0EF973| STA.w $7E2836
|0EF976| STA.w $7E2838

|0EF979| INC A
|0EF97A| STA.w $7E26A8
|0EF97D| STA.w $7E27B8

|0EF980| INC A
|0EF981| STA.w $7E26AA

|0EF984| INC A
|0EF985| STA.w $7E2722
|0EF988| STA.w $7E27A4
|0EF98B| STA.w $7E2828

|0EF98E| INC A
|0EF98F| STA.w $7E2724

|0EF992| INC A
|0EF993| STA.w $7E27A6

|0EF996| INC A
|0EF997| STA.w $7E27A8

|0EF99A| STA.w $7E28B6

|0EF99D| INC A
|0EF99E| STA.w $7E27B4

|0EF9A1| INC A
|0EF9A2| STA.w $7E27BA

|0EF9A5| INC A
|0EF9A6| STA.w $7E282A

|0EF9A9| INC A
|0EF9AA| STA.w $7E2834

|0EF9AD| INC A
|0EF9AE| STA.w $7E283A

|0EF9B1| INC A
|0EF9B2| STA.w $7E28B4

|0EF9B5| INC A
|0EF9B6| STA.w $7E28B8

|0EF9B9| INC A
|0EF9BA| STA.w $7E28BA

|0EF9BD| INC A
|0EF9BE| STA.w $7E2936

|0EF9C1| INC A
|0EF9C2| STA.w $7E2938

|0EF9C5| INC A
|0EF9C6| STA.w $7E252A
|0EF9C9| STA.w $7E2532
|0EF9CC| STA.w $7E292A

|0EF9CF| INC A
|0EF9D0| STA.w $7E25BA
|0EF9D3| STA.w $7E29A8
|0EF9D6| STA.w $7E29BA

|0EF9D9| INC A
|0EF9DA| STA.w $7E29A4

|0EF9DD| INC A
|0EF9DE| STA.w $7E2736

|0EF9E1| INC A
|0EF9E2| STA.w $7E2738

|0EF9E5| RTS

;===================================================================================================

OverworldOverlay_SkullWoods:
|0EF9E6| LDA.w #$0E13
|0EF9E9| STA.w $7E2590

|0EF9EC| INC A
|0EF9ED| STA.w $7E2596

|0EF9F0| INC A
|0EF9F1| STA.w $7E2610

|0EF9F4| INC A
|0EF9F5| STA.w $7E2612

|0EF9F8| INC A
|0EF9F9| STA.w $7E2614

|0EF9FC| INC A
|0EF9FD| STA.w $7E2616

|0EFA00| INC A
|0EFA01| STA.w $7E2692

|0EFA04| INC A
|0EFA05| STA.w $7E2694

|0EFA08| LDA.w #$0E06
|0EFA0B| STA.w $7E2812
|0EFA0E| STA.w $7E2814

|0EFA11| INC A
|0EFA12| STA.w $7E2710
|0EFA15| STA.w $7E2790

|0EFA18| INC A
|0EFA19| STA.w $7E2712
|0EFA1C| STA.w $7E2792

|0EFA1F| INC A
|0EFA20| STA.w $7E2714
|0EFA23| STA.w $7E2794

|0EFA26| INC A
|0EFA27| STA.w $7E2716
|0EFA2A| STA.w $7E2796

|0EFA2D| RTS

;===================================================================================================

OverworldOverlay_GanonsTower:
|0EFA2E| LDA.w #$0E96
|0EFA31| STA.l $7E245E

|0EFA35| INC A
|0EFA36| STA.l $7E2460

|0EFA3A| LDA.w #$0E9C
|0EFA3D| STA.l $7E24DE

|0EFA41| STA.l $7E255E

|0EFA45| INC A
|0EFA46| STA.l $7E24E0

|0EFA4A| STA.l $7E2560

|0EFA4E| LDA.w #$0E9A
|0EFA51| STA.l $7E25DE

|0EFA55| INC A
|0EFA56| STA.l $7E25E0

|0EFA5A| RTS

;===================================================================================================

OverworldOverlay_HookshotCave:
|0EFA5B| LDX.w #$0868
|0EFA5E| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_TurtleRock:
|0EFA61| LDA.w #$0E78
|0EFA64| STA.l $7E299E

|0EFA68| INC A
|0EFA69| STA.l $7E29A0

|0EFA6D| INC A
|0EFA6E| STA.l $7E29A2

|0EFA72| INC A
|0EFA73| STA.l $7E29A4

|0EFA77| INC A
|0EFA78| STA.l $7E2A1E

|0EFA7C| INC A
|0EFA7D| STA.l $7E2A20

|0EFA81| INC A
|0EFA82| STA.l $7E2A22

|0EFA86| INC A
|0EFA87| STA.l $7E2A24

|0EFA8B| INC A
|0EFA8C| STA.l $7E2A9E

|0EFA90| INC A
|0EFA91| STA.l $7E2AA0

|0EFA95| INC A
|0EFA96| STA.l $7E2AA2

|0EFA9A| INC A
|0EFA9B| STA.l $7E2AA4

|0EFA9F| INC A
|0EFAA0| STA.l $7E2B1E

|0EFAA4| INC A
|0EFAA5| STA.l $7E2B20

|0EFAA9| INC A
|0EFAAA| STA.l $7E2B22

|0EFAAE| INC A
|0EFAAF| STA.l $7E2B24

|0EFAB3| RTS

;===================================================================================================

OverworldOverlay_GargoylesDomain:
|0EFAB4| LDA.w #$0E1B
|0EFAB7| STA.w $7E2D3E

|0EFABA| INC A
|0EFABB| STA.w $7E2D40

|0EFABE| INC A
|0EFABF| STA.w $7E2DBE

|0EFAC2| INC A
|0EFAC3| STA.w $7E2DC0

|0EFAC6| INC A
|0EFAC7| STA.w $7E2E3E

|0EFACA| INC A
|0EFACB| STA.w $7E2E40

|0EFACE| RTS

;===================================================================================================

OverworldOverlay_PyramidHole:
|0EFACF| LDA.w #$0E3F
|0EFAD2| STA.w $7E23BC

|0EFAD5| INC A
|0EFAD6| STA.w $7E23BE

|0EFAD9| INC A
|0EFADA| STA.w $7E23C0

|0EFADD| INC A
|0EFADE| STA.w $7E243C

|0EFAE1| INC A
|0EFAE2| STA.w $7E243E

|0EFAE5| INC A
|0EFAE6| STA.w $7E2440

|0EFAE9| INC A
|0EFAEA| STA.w $7E24BC

|0EFAED| INC A
|0EFAEE| STA.w $7E24BE

|0EFAF1| INC A
|0EFAF2| STA.w $7E24C0

|0EFAF5| RTS

;===================================================================================================

OverworldOverlay_POD:
|0EFAF6| LDA.w #$0E31
|0EFAF9| STA.w $7E21E6

|0EFAFC| LDA.w #$0E2D
|0EFAFF| STA.w $7E226A

|0EFB02| INC A
|0EFB03| STA.w $7E22EA

|0EFB06| INC A
|0EFB07| STA.w $7E236A

|0EFB0A| RTS

;===================================================================================================

OverworldOverlay_PegPuzzle:
|0EFB0B| LDX.w #$0D20
|0EFB0E| JMP.w OverworldOverlay_DrawRevealedStairs

;===================================================================================================

OverworldOverlay_MiseryMire:
|0EFB11| LDA.w #$0E64
|0EFB14| STA.w $7E2522

|0EFB17| INC A
|0EFB18| STA.w $7E2524

|0EFB1B| INC A
|0EFB1C| STA.w $7E2526

|0EFB1F| INC A
|0EFB20| STA.w $7E2528

|0EFB23| INC A
|0EFB24| STA.w $7E25A2

|0EFB27| INC A
|0EFB28| STA.w $7E25A4

|0EFB2B| INC A
|0EFB2C| STA.w $7E25A6

|0EFB2F| INC A
|0EFB30| STA.w $7E25A8

|0EFB33| INC A
|0EFB34| STA.w $7E2622

|0EFB37| INC A
|0EFB38| STA.w $7E2624

|0EFB3B| INC A
|0EFB3C| STA.w $7E2626

|0EFB3F| INC A
|0EFB40| STA.w $7E2628

|0EFB43| INC A
|0EFB44| STA.w $7E26A2

|0EFB47| INC A
|0EFB48| STA.w $7E26A4

|0EFB4B| INC A
|0EFB4C| STA.w $7E26A6

|0EFB4F| INC A
|0EFB50| STA.w $7E26A8

|0EFB53| INC A
|0EFB54| STA.w $7E2722

|0EFB57| INC A
|0EFB58| STA.w $7E2724

|0EFB5B| INC A
|0EFB5C| STA.w $7E2726

|0EFB5F| INC A
|0EFB60| STA.w $7E2728

|0EFB63| RTS

;===================================================================================================
; FREE ROM: 0x049C
;===================================================================================================
NULL_0EFB64:
|0EFB64| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB6C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB74| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB7C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB84| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB8C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB94| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFB9C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBA4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBAC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBB4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBBC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBC4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBCC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBD4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBDC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBE4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBEC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBF4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFBFC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC04| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC0C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC14| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC1C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC24| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC2C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC34| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC3C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC44| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC4C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC54| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC5C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC64| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC6C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC74| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC7C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC84| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC8C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC94| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFC9C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCA4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCAC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCB4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCBC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCC4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCCC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCD4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCDC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCE4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCEC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCF4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFCFC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD04| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD0C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD14| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD1C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD24| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD2C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD34| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD3C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD44| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD4C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD54| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD5C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD64| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD6C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD74| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD7C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD84| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD8C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD94| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFD9C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDA4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDAC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDB4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDBC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDC4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDCC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDD4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDDC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDE4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDEC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDF4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFDFC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE04| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE0C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE14| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE1C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE24| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE2C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE34| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE3C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE44| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE4C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE54| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE5C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE64| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE6C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE74| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE7C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE84| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE8C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE94| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFE9C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEA4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEAC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEB4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEBC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEC4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFECC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFED4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEDC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEE4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEEC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEF4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFEFC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF04| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF0C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF14| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF1C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF24| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF2C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF34| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF3C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF44| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF4C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF54| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF5C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF64| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF6C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF74| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF7C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF84| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF8C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF94| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFF9C| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFA4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFAC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFB4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFBC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFC4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFCC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFD4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFDC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFE4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFEC| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFF4| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0EFFFC| db $FF, $FF, $FF, $FF

;===================================================================================================
