org $1C8000

Message_Data:

;===================================================================================================
;---------------------------------------------------------------------------------------------------
Message_0000:
#_1C8000: db $7F ; end of message

;===================================================================================================
;     >
;       
;---------------------------------------------------------------------------------------------------
Message_0001:
#_1C8001: db $7A, $00 ; set draw speed
#_1C8003: db $76 ; line 3
#_1C8004: db $88, $8A ; [    ][  ]
#_1C8006: db $75 ; line 2
#_1C8007: db $88, $44 ; [    ]>
#_1C8009: db $68 ; choose 2 indented
#_1C800A: db $7F ; end of message

;===================================================================================================
;       
;     >
;---------------------------------------------------------------------------------------------------
Message_0002:
#_1C800B: db $7A, $00 ; set draw speed
#_1C800D: db $75 ; line 2
#_1C800E: db $88, $8A ; [    ][  ]
#_1C8010: db $76 ; line 3
#_1C8011: db $88, $44 ; [    ]>
#_1C8013: db $68 ; choose 2 indented
#_1C8014: db $7F ; end of message

;===================================================================================================
; Save And Continue
; Save And Quit
; Do Not Save And Continue
;---------------------------------------------------------------------------------------------------
Message_0003:
#_1C8015: db $7A, $00 ; set draw speed
#_1C8017: db $12, $1A, $2F, $1E, $59, $00, $27, $1D ; Save⎵And
#_1C801F: db $59, $02, $C7, $2D, $B4, $2E, $1E ; ⎵C[on]t[in]ue
#_1C8026: db $75 ; line 2
#_1C8027: db $12, $1A, $2F, $1E, $59, $00, $27, $1D ; Save⎵And
#_1C802F: db $59, $10, $2E, $B6 ; ⎵Qu[it]
#_1C8033: db $76 ; line 3
#_1C8034: db $03, $28, $59, $0D, $28, $2D, $59, $12 ; Do⎵Not⎵S
#_1C803C: db $1A, $2F, $1E, $59, $00, $27, $1D, $59 ; ave⎵And⎵
#_1C8044: db $02, $C7, $2D, $B4, $2E, $1E ; C[on]t[in]ue
#_1C804A: db $7F ; end of message

;===================================================================================================
; 0- [#0]. 1- [#1]
; 2- [#2]. 3- [#3]
;---------------------------------------------------------------------------------------------------
Message_0004:
#_1C804B: db $7A, $00 ; set draw speed
#_1C804D: db $34, $40, $59, $6C, $00, $41, $59, $35 ; 0-⎵[#0].⎵1
#_1C8055: db $40, $59, $6C, $01 ; -⎵[#1]
#_1C8059: db $75 ; line 2
#_1C805A: db $36, $40, $59, $6C, $02, $41, $59, $37 ; 2-⎵[#2].⎵3
#_1C8062: db $40, $59, $6C, $03 ; -⎵[#3]
#_1C8066: db $7F ; end of message

;===================================================================================================
; You can't enter with something
; following you.
;---------------------------------------------------------------------------------------------------
Message_0005:
#_1C8067: db $E8, $59, $1C, $93, $51, $2D, $59, $A3 ; [You]⎵c[an]'t⎵[ent]
#_1C806F: db $A1, $DE, $59, $CF, $D5, $20 ; [er ][with]⎵[some][thin]g
#_1C8075: db $75 ; line 2
#_1C8076: db $1F, $28, $25, $BB, $E2, $27, $20, $59 ; fol[lo][wi]ng⎵
#_1C807E: db $E3, $41 ; [you].
#_1C8080: db $7F ; end of message

;===================================================================================================
; >
;   
;   
;---------------------------------------------------------------------------------------------------
Message_0006:
#_1C8081: db $7A, $00 ; set draw speed
#_1C8083: db $74 ; line 1
#_1C8084: db $44 ; >
#_1C8085: db $75 ; line 2
#_1C8086: db $8A ; [  ]
#_1C8087: db $76 ; line 3
#_1C8088: db $8A ; [  ]
#_1C8089: db $71 ; choose 3
#_1C808A: db $7F ; end of message

;===================================================================================================
;   
; >
;   
;---------------------------------------------------------------------------------------------------
Message_0007:
#_1C808B: db $7A, $00 ; set draw speed
#_1C808D: db $74 ; line 1
#_1C808E: db $8A ; [  ]
#_1C808F: db $75 ; line 2
#_1C8090: db $44 ; >
#_1C8091: db $76 ; line 3
#_1C8092: db $8A ; [  ]
#_1C8093: db $71 ; choose 3
#_1C8094: db $7F ; end of message

;===================================================================================================
;   
;   
; >
;---------------------------------------------------------------------------------------------------
Message_0008:
#_1C8095: db $7A, $00 ; set draw speed
#_1C8097: db $74 ; line 1
#_1C8098: db $8A ; [  ]
#_1C8099: db $75 ; line 2
#_1C809A: db $8A ; [  ]
#_1C809B: db $76 ; line 3
#_1C809C: db $44 ; >
#_1C809D: db $71 ; choose 3
#_1C809E: db $7F ; end of message

;===================================================================================================
; >
;   
;---------------------------------------------------------------------------------------------------
Message_0009:
#_1C809F: db $7A, $00 ; set draw speed
#_1C80A1: db $74 ; line 1
#_1C80A2: db $44 ; >
#_1C80A3: db $75 ; line 2
#_1C80A4: db $8A ; [  ]
#_1C80A5: db $72 ; choose 2 high
#_1C80A6: db $7F ; end of message

;===================================================================================================
;   
; >
;---------------------------------------------------------------------------------------------------
Message_000A:
#_1C80A7: db $7A, $00 ; set draw speed
#_1C80A9: db $74 ; line 1
#_1C80AA: db $8A ; [  ]
#_1C80AB: db $75 ; line 2
#_1C80AC: db $44 ; >
#_1C80AD: db $72 ; choose 2 high
#_1C80AE: db $7F ; end of message

;===================================================================================================
;     
;   >
;---------------------------------------------------------------------------------------------------
Message_000B:
#_1C80AF: db $7A, $00 ; set draw speed
#_1C80B1: db $76 ; line 3
#_1C80B2: db $88 ; [    ]
#_1C80B3: db $75 ; line 2
#_1C80B4: db $8A, $44 ; [  ]>
#_1C80B6: db $6F ; choose 2 low
#_1C80B7: db $7F ; end of message

;===================================================================================================
;     
;   >
;---------------------------------------------------------------------------------------------------
Message_000C:
#_1C80B8: db $7A, $00 ; set draw speed
#_1C80BA: db $75 ; line 2
#_1C80BB: db $88 ; [    ]
#_1C80BC: db $76 ; line 3
#_1C80BD: db $8A, $44 ; [  ]>
#_1C80BF: db $6F ; choose 2 low
#_1C80C0: db $7F ; end of message

;===================================================================================================
; [LINK], I'm going out for a
; while.  I'll be back by morning.
; Don't leave the house.
;---------------------------------------------------------------------------------------------------
Message_000D:
#_1C80C1: db $6A, $42, $59, $08, $51, $26, $59, $AC ; [LINK],⎵I'm⎵[go]
#_1C80C9: db $B3, $C5, $A8, $59, $1A ; [ing ][out ][for]⎵a
#_1C80CE: db $75 ; line 2
#_1C80CF: db $E1, $22, $25, $1E, $41, $8A, $08, $51 ; [wh]ile.[  ]I'
#_1C80D7: db $25, $25, $59, $97, $59, $96, $9C, $59 ; ll⎵[be]⎵[ba][ck]⎵
#_1C80DF: db $1B, $32, $59, $26, $C8, $27, $B4, $20 ; by⎵m[or]n[in]g
#_1C80E7: db $41 ; .
#_1C80E8: db $76 ; line 3
#_1C80E9: db $03, $C7, $51, $2D, $59, $25, $1E, $1A ; D[on]'t⎵lea
#_1C80F1: db $2F, $1E, $59, $D8, $59, $21, $28, $2E ; ve⎵[the]⎵hou
#_1C80F9: db $D0, $41 ; [se].
#_1C80FB: db $7F ; end of message

;===================================================================================================
; Unnh… [LINK], I didn't want
; you involved in this…  I told
; you not to leave the house…
; Take my sword and shield and
; listen.  You can focus power in
; the blade (hold the Ⓑ Button).
; …Then release it using the
; secret technique handed down
; by our people…
; [LINK], you can do it!
; Save the Princess…
; Zelda is your… … …
;---------------------------------------------------------------------------------------------------
Message_000E:
#_1C80FC: db $14, $27, $27, $21, $43, $59, $6A, $42 ; Unnh…⎵[LINK],
#_1C8104: db $59, $08, $59, $9E, $1D, $C0, $DF, $27 ; ⎵I⎵[di]d[n't ][wa]n
#_1C810C: db $2D ; t
#_1C810D: db $75 ; line 2
#_1C810E: db $E3, $59, $B4, $2F, $28, $25, $2F, $A4 ; [you]⎵[in]volv[ed ]
#_1C8116: db $B4, $59, $D9, $2C, $43, $8A, $08, $59 ; [in]⎵[thi]s…[  ]I⎵
#_1C811E: db $DA, $25, $1D ; [to]ld
#_1C8121: db $76 ; line 3
#_1C8122: db $E3, $59, $C2, $59, $DA, $59, $25, $1E ; [you]⎵[not]⎵[to]⎵le
#_1C812A: db $1A, $2F, $1E, $59, $D8, $59, $21, $28 ; ave⎵[the]⎵ho
#_1C8132: db $2E, $D0, $43 ; u[se]…
#_1C8135: db $7E ; wait for key
#_1C8136: db $73 ; scroll text
#_1C8137: db $13, $1A, $24, $1E, $59, $26, $32, $59 ; Take⎵my⎵
#_1C813F: db $2C, $30, $C8, $1D, $59, $8C, $D1, $22 ; sw[or]d⎵[and ][sh]i
#_1C8147: db $1E, $25, $1D, $59, $90 ; eld⎵[and]
#_1C814C: db $73 ; scroll text
#_1C814D: db $25, $B5, $2D, $A5, $41, $8A, $E8, $59 ; l[is]t[en].[  ][You]⎵
#_1C8155: db $99, $1F, $28, $1C, $2E, $2C, $59, $CB ; [can ]focus⎵[pow]
#_1C815D: db $A1, $B4 ; [er ][in]
#_1C815F: db $73 ; scroll text
#_1C8160: db $D8, $59, $1B, $BA, $1D, $1E, $59, $45 ; [the]⎵b[la]de⎵(
#_1C8168: db $21, $28, $25, $1D, $59, $D8, $59, $5C ; hold⎵[the]⎵Ⓑ
#_1C8170: db $59, $01, $2E, $2D, $DA, $27, $46, $41 ; ⎵But[to]n).
#_1C8178: db $7E ; wait for key
#_1C8179: db $73 ; scroll text
#_1C817A: db $43, $E6, $27, $59, $CE, $25, $1E, $1A ; …[The]n⎵[re]lea
#_1C8182: db $D0, $59, $B6, $59, $2E, $2C, $B3, $D8 ; [se]⎵[it]⎵us[ing ][the]
#_1C818A: db $73 ; scroll text
#_1C818B: db $D0, $1C, $CE, $2D, $59, $2D, $1E, $1C ; [se]c[re]t⎵tec
#_1C8193: db $21, $27, $22, $2A, $2E, $1E, $59, $B1 ; hnique⎵[ha]
#_1C819B: db $27, $1D, $A4, $9F, $30, $27 ; nd[ed ][do]wn
#_1C81A1: db $73 ; scroll text
#_1C81A2: db $1B, $32, $59, $28, $2E, $2B, $59, $29 ; by⎵our⎵p
#_1C81AA: db $1E, $28, $CA, $43 ; eo[ple]…
#_1C81AE: db $7E ; wait for key
#_1C81AF: db $73 ; scroll text
#_1C81B0: db $6A, $42, $59, $E3, $59, $99, $9F, $59 ; [LINK],⎵[you]⎵[can ][do]⎵
#_1C81B8: db $B6, $3E ; [it]!
#_1C81BA: db $73 ; scroll text
#_1C81BB: db $12, $1A, $2F, $1E, $59, $D8, $59, $0F ; Save⎵[the]⎵P
#_1C81C3: db $2B, $B4, $1C, $1E, $2C, $2C, $43 ; r[in]cess…
#_1C81CA: db $73 ; scroll text
#_1C81CB: db $19, $1E, $25, $1D, $1A, $59, $B5, $59 ; Zelda⎵[is]⎵
#_1C81D3: db $E3, $2B, $43, $59, $43, $59, $43 ; [you]r…⎵…⎵…
#_1C81DA: db $7F ; end of message

;===================================================================================================
; What're you doing up this late,
; kid?  You can stay up when
; you're grown up!  Now go home!
;---------------------------------------------------------------------------------------------------
Message_000F:
#_1C81DB: db $16, $B1, $2D, $51, $CD, $E3, $59, $9F ; W[ha]t'[re ][you]⎵[do]
#_1C81E3: db $B3, $DC, $59, $D9, $2C, $59, $BA, $2D ; [ing ][up]⎵[thi]s⎵[la]t
#_1C81EB: db $1E, $42 ; e,
#_1C81ED: db $75 ; line 2
#_1C81EE: db $24, $22, $1D, $3F, $8A, $E8, $59, $99 ; kid?[  ][You]⎵[can ]
#_1C81F6: db $D3, $1A, $32, $59, $DC, $59, $E1, $A5 ; [st]ay⎵[up]⎵[wh][en]
#_1C81FE: db $76 ; line 3
#_1C81FF: db $E3, $51, $CD, $20, $2B, $28, $30, $27 ; [you]'[re ]grown
#_1C8207: db $59, $DC, $3E, $8A, $0D, $28, $30, $59 ; ⎵[up]![  ]Now⎵
#_1C820F: db $AC, $59, $21, $28, $BE, $3E ; [go]⎵ho[me]!
#_1C8215: db $7F ; end of message

;===================================================================================================
; I see you brought a map so you
; don't get lost.  (Press the
; ⓧ Button to see your map).
;---------------------------------------------------------------------------------------------------
Message_0010:
#_1C8216: db $08, $59, $D0, $1E, $59, $E3, $59, $1B ; I⎵[se]e⎵[you]⎵b
#_1C821E: db $2B, $28, $2E, $20, $21, $2D, $59, $1A ; rought⎵a
#_1C8226: db $59, $BD, $29, $59, $D2, $59, $E3 ; ⎵[ma]p⎵[so]⎵[you]
#_1C822D: db $75 ; line 2
#_1C822E: db $9F, $C0, $AB, $59, $BB, $D3, $41, $8A ; [do][n't ][get]⎵[lo][st].[  ]
#_1C8236: db $45, $0F, $CE, $2C, $2C, $59, $D8 ; (P[re]ss⎵[the]
#_1C823D: db $76 ; line 3
#_1C823E: db $5D, $59, $01, $2E, $2D, $DA, $27, $59 ; ⓧ⎵But[to]n⎵
#_1C8246: db $DA, $59, $D0, $1E, $59, $E3, $2B, $59 ; [to]⎵[se]e⎵[you]r⎵
#_1C824E: db $BD, $29, $46, $41 ; [ma]p).
#_1C8252: db $7F ; end of message

;===================================================================================================
; You look strong for a kid.  How
; much can you lift?  (Press the
; Ⓐ Button while touching a thing
; to lift it.)
;---------------------------------------------------------------------------------------------------
Message_0011:
#_1C8253: db $E8, $59, $BB, $28, $24, $59, $D3, $2B ; [You]⎵[lo]ok⎵[st]r
#_1C825B: db $C7, $20, $59, $A8, $59, $1A, $59, $24 ; [on]g⎵[for]⎵a⎵k
#_1C8263: db $22, $1D, $41, $8A, $07, $28, $30 ; id.[  ]How
#_1C826A: db $75 ; line 2
#_1C826B: db $BF, $1C, $21, $59, $99, $E3, $59, $25 ; [mu]ch⎵[can ][you]⎵l
#_1C8273: db $22, $1F, $2D, $3F, $8A, $45, $0F, $CE ; ift?[  ](P[re]
#_1C827B: db $2C, $2C, $59, $D8 ; ss⎵[the]
#_1C827F: db $76 ; line 3
#_1C8280: db $5B, $59, $01, $2E, $2D, $DA, $27, $59 ; Ⓐ⎵But[to]n⎵
#_1C8288: db $E1, $22, $25, $1E, $59, $DA, $2E, $1C ; [wh]ile⎵[to]uc
#_1C8290: db $B0, $27, $20, $59, $1A, $59, $D5, $20 ; [hi]ng⎵a⎵[thin]g
#_1C8298: db $7E ; wait for key
#_1C8299: db $73 ; scroll text
#_1C829A: db $DA, $59, $25, $22, $1F, $2D, $59, $B6 ; [to]⎵lift⎵[it]
#_1C82A2: db $41, $46 ; .)
#_1C82A4: db $7F ; end of message

;===================================================================================================
; I'll bet you can't wait until you
; are old enough to use a sword!
; (Press the Ⓑ Button to use
; your sword when you get it.)
;---------------------------------------------------------------------------------------------------
Message_0012:
#_1C82A5: db $08, $51, $25, $25, $59, $97, $2D, $59 ; I'll⎵[be]t⎵
#_1C82AD: db $E3, $59, $1C, $93, $51, $2D, $59, $DF ; [you]⎵c[an]'t⎵[wa]
#_1C82B5: db $B6, $59, $2E, $27, $2D, $22, $25, $59 ; [it]⎵until⎵
#_1C82BD: db $E3 ; [you]
#_1C82BE: db $75 ; line 2
#_1C82BF: db $8D, $28, $25, $1D, $59, $A5, $28, $2E ; [are ]old⎵[en]ou
#_1C82C7: db $20, $21, $59, $DA, $59, $2E, $D0, $59 ; gh⎵[to]⎵u[se]⎵
#_1C82CF: db $1A, $59, $2C, $30, $C8, $1D, $3E ; a⎵sw[or]d!
#_1C82D6: db $76 ; line 3
#_1C82D7: db $45, $0F, $CE, $2C, $2C, $59, $D8, $59 ; (P[re]ss⎵[the]⎵
#_1C82DF: db $5C, $59, $01, $2E, $2D, $DA, $27, $59 ; Ⓑ⎵But[to]n⎵
#_1C82E7: db $DA, $59, $2E, $D0 ; [to]⎵u[se]
#_1C82EB: db $7E ; wait for key
#_1C82EC: db $73 ; scroll text
#_1C82ED: db $E3, $2B, $59, $2C, $30, $C8, $1D, $59 ; [you]r⎵sw[or]d⎵
#_1C82F5: db $E1, $A0, $E3, $59, $AB, $59, $B6, $41 ; [wh][en ][you]⎵[get]⎵[it].
#_1C82FD: db $46 ; )
#_1C82FE: db $7F ; end of message

;===================================================================================================
; That mark on your map must be
; your destination.
;---------------------------------------------------------------------------------------------------
Message_0013:
#_1C82FF: db $E5, $2D, $59, $BD, $2B, $24, $59, $C7 ; [Tha]t⎵[ma]rk⎵[on]
#_1C8307: db $59, $E3, $2B, $59, $BD, $29, $59, $BF ; ⎵[you]r⎵[ma]p⎵[mu]
#_1C830F: db $D3, $59, $97 ; [st]⎵[be]
#_1C8312: db $75 ; line 2
#_1C8313: db $E3, $2B, $59, $9D, $2D, $B4, $94, $22 ; [you]r⎵[des]t[in][at]i
#_1C831B: db $C7, $41 ; [on].
#_1C831D: db $7F ; end of message

;===================================================================================================
; You can often find valuables
; in chests.  (Press the Ⓐ
; Button in front of a chest to
; open it.)
;---------------------------------------------------------------------------------------------------
Message_0014:
#_1C831E: db $E8, $59, $99, $C6, $2D, $A0, $1F, $B4 ; [You]⎵[can ][of]t[en ]f[in]
#_1C8326: db $1D, $59, $2F, $1A, $25, $2E, $1A, $95 ; d⎵valua[ble]
#_1C832E: db $2C ; s
#_1C832F: db $75 ; line 2
#_1C8330: db $B4, $59, $9A, $D3, $2C, $41, $8A, $45 ; [in]⎵[che][st]s.[  ](
#_1C8338: db $0F, $CE, $2C, $2C, $59, $D8, $59, $5B ; P[re]ss⎵[the]⎵Ⓐ
#_1C8340: db $76 ; line 3
#_1C8341: db $01, $2E, $2D, $DA, $27, $59, $B4, $59 ; But[to]n⎵[in]⎵
#_1C8349: db $A9, $27, $2D, $59, $C6, $59, $1A, $59 ; [fro]nt⎵[of]⎵a⎵
#_1C8351: db $9A, $D3, $59, $DA ; [che][st]⎵[to]
#_1C8355: db $7E ; wait for key
#_1C8356: db $73 ; scroll text
#_1C8357: db $C3, $59, $B6, $41, $46 ; [open]⎵[it].)
#_1C835C: db $7F ; end of message

;===================================================================================================
; Us soldiers have been around,
; kid.  You can learn a lot from
; us.  But you already know that!
;---------------------------------------------------------------------------------------------------
Message_0015:
#_1C835D: db $14, $2C, $59, $D2, $25, $9E, $A6, $2C ; Us⎵[so]l[di][er]s
#_1C8365: db $59, $AD, $59, $97, $A0, $1A, $2B, $C4 ; ⎵[have]⎵[be][en ]ar[ound]
#_1C836D: db $42 ; ,
#_1C836E: db $75 ; line 2
#_1C836F: db $24, $22, $1D, $41, $8A, $E8, $59, $99 ; kid.[  ][You]⎵[can ]
#_1C8377: db $25, $A2, $27, $59, $1A, $59, $BB, $2D ; l[ear]n⎵a⎵[lo]t
#_1C837F: db $59, $A9, $26 ; ⎵[fro]m
#_1C8382: db $76 ; line 3
#_1C8383: db $2E, $2C, $41, $8A, $01, $2E, $2D, $59 ; us.[  ]But⎵
#_1C838B: db $E3, $59, $1A, $25, $CE, $1A, $1D, $32 ; [you]⎵al[re]ady
#_1C8393: db $59, $B8, $59, $D7, $2D, $3E ; ⎵[know]⎵[tha]t!
#_1C8399: db $7F ; end of message

;===================================================================================================
; Meet the elder of the village
; and get the Master Sword.
;---------------------------------------------------------------------------------------------------
Message_0016:
#_1C839A: db $0C, $1E, $1E, $2D, $59, $D8, $59, $1E ; Meet⎵[the]⎵e
#_1C83A2: db $25, $1D, $A1, $C6, $59, $D8, $59, $2F ; ld[er ][of]⎵[the]⎵v
#_1C83AA: db $22, $25, $BA, $20, $1E ; il[la]ge
#_1C83AF: db $75 ; line 2
#_1C83B0: db $8C, $AB, $59, $D8, $59, $0C, $92, $A1 ; [and ][get]⎵[the]⎵M[ast][er ]
#_1C83B8: db $12, $30, $C8, $1D, $41 ; Sw[or]d.
#_1C83BD: db $7F ; end of message

;===================================================================================================
; Princess Zelda, you are safe!
; Is this your doing, [LINK]?
;---------------------------------------------------------------------------------------------------
Message_0017:
#_1C83BE: db $0F, $2B, $B4, $1C, $1E, $2C, $2C, $59 ; Pr[in]cess⎵
#_1C83C6: db $19, $1E, $25, $1D, $1A, $42, $59, $E3 ; Zelda,⎵[you]
#_1C83CE: db $59, $8D, $2C, $1A, $1F, $1E, $3E ; ⎵[are ]safe!
#_1C83D5: db $75 ; line 2
#_1C83D6: db $08, $2C, $59, $D9, $2C, $59, $E3, $2B ; Is⎵[thi]s⎵[you]r
#_1C83DE: db $59, $9F, $B4, $20, $42, $59, $6A, $3F ; ⎵[do][in]g,⎵[LINK]?
#_1C83E6: db $7F ; end of message

;===================================================================================================
; I sense that a mighty evil
; force guides the wizard's
; actions and augments his
; magical power.  The only
; weapon potent enough to
; defeat the wizard is the
; legendary Master Sword.
; It is said that the village elder
; is a descendant of one of the
; seven wise men.  Maybe
; he can tell you more…
; I will mark his house on your
; map.  But watch your every
; move!  I am certain that the
; castle soldiers will be looking
; for you now!  …    …    …
; I will hide Princess Zelda here.
; Do not worry!  Seek the elder!
; …    …    …
; Do you understand?
;     > Yes
;        Not at all
;---------------------------------------------------------------------------------------------------
Message_0018:
#_1C83E7: db $08, $59, $D0, $27, $D0, $59, $D7, $2D ; I⎵[se]n[se]⎵[tha]t
#_1C83EF: db $59, $1A, $59, $26, $22, $20, $21, $2D ; ⎵a⎵might
#_1C83F7: db $32, $59, $A7, $22, $25 ; y⎵[ev]il
#_1C83FC: db $75 ; line 2
#_1C83FD: db $A8, $1C, $1E, $59, $20, $2E, $22, $9D ; [for]ce⎵gui[des]
#_1C8405: db $59, $D8, $59, $E2, $33, $1A, $2B, $1D ; ⎵[the]⎵[wi]zard
#_1C840D: db $51, $2C ; 's
#_1C840F: db $76 ; line 3
#_1C8410: db $1A, $1C, $2D, $22, $C7, $2C, $59, $8C ; acti[on]s⎵[and ]
#_1C8418: db $1A, $2E, $20, $BE, $27, $2D, $2C, $59 ; aug[me]nts⎵
#_1C8420: db $B0, $2C ; [hi]s
#_1C8422: db $7E ; wait for key
#_1C8423: db $73 ; scroll text
#_1C8424: db $BD, $20, $22, $1C, $1A, $25, $59, $CB ; [ma]gical⎵[pow]
#_1C842C: db $A6, $41, $8A, $E6, $59, $C7, $25, $32 ; [er].[  ][The]⎵[on]ly
#_1C8434: db $73 ; scroll text
#_1C8435: db $E0, $1A, $29, $C7, $59, $29, $28, $2D ; [we]ap[on]⎵pot
#_1C843D: db $A3, $59, $A5, $28, $2E, $20, $21, $59 ; [ent]⎵[en]ough⎵
#_1C8445: db $DA ; [to]
#_1C8446: db $73 ; scroll text
#_1C8447: db $1D, $1E, $1F, $1E, $91, $D8, $59, $E2 ; defe[at ][the]⎵[wi]
#_1C844F: db $33, $1A, $2B, $1D, $59, $B5, $59, $D8 ; zard⎵[is]⎵[the]
#_1C8457: db $7E ; wait for key
#_1C8458: db $73 ; scroll text
#_1C8459: db $25, $1E, $20, $A5, $1D, $1A, $2B, $32 ; leg[en]dary
#_1C8461: db $59, $0C, $92, $A1, $12, $30, $C8, $1D ; ⎵M[ast][er ]Sw[or]d
#_1C8469: db $41 ; .
#_1C846A: db $73 ; scroll text
#_1C846B: db $08, $2D, $59, $B5, $59, $2C, $1A, $22 ; It⎵[is]⎵sai
#_1C8473: db $1D, $59, $D7, $2D, $59, $D8, $59, $2F ; d⎵[tha]t⎵[the]⎵v
#_1C847B: db $22, $25, $BA, $20, $1E, $59, $1E, $25 ; il[la]ge⎵el
#_1C8483: db $1D, $A6 ; d[er]
#_1C8485: db $73 ; scroll text
#_1C8486: db $B5, $59, $1A, $59, $9D, $1C, $A5, $1D ; [is]⎵a⎵[des]c[en]d
#_1C848E: db $93, $2D, $59, $C6, $59, $C7, $1E, $59 ; [an]t⎵[of]⎵[on]e⎵
#_1C8496: db $C6, $59, $D8 ; [of]⎵[the]
#_1C8499: db $7E ; wait for key
#_1C849A: db $73 ; scroll text
#_1C849B: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1C84A3: db $41, $8A, $0C, $1A, $32, $97 ; .[  ]May[be]
#_1C84A9: db $73 ; scroll text
#_1C84AA: db $21, $1E, $59, $99, $2D, $1E, $25, $25 ; he⎵[can ]tell
#_1C84B2: db $59, $E3, $59, $26, $C8, $1E, $43 ; ⎵[you]⎵m[or]e…
#_1C84B9: db $73 ; scroll text
#_1C84BA: db $08, $59, $E2, $25, $25, $59, $BD, $2B ; I⎵[wi]ll⎵[ma]r
#_1C84C2: db $24, $59, $B0, $2C, $59, $21, $28, $2E ; k⎵[hi]s⎵hou
#_1C84CA: db $D0, $59, $C7, $59, $E3, $2B ; [se]⎵[on]⎵[you]r
#_1C84D0: db $7E ; wait for key
#_1C84D1: db $73 ; scroll text
#_1C84D2: db $BD, $29, $41, $8A, $01, $2E, $2D, $59 ; [ma]p.[  ]But⎵
#_1C84DA: db $DF, $2D, $1C, $21, $59, $E3, $2B, $59 ; [wa]tch⎵[you]r⎵
#_1C84E2: db $A7, $A6, $32 ; [ev][er]y
#_1C84E5: db $73 ; scroll text
#_1C84E6: db $26, $28, $2F, $1E, $3E, $8A, $08, $59 ; move![  ]I⎵
#_1C84EE: db $1A, $26, $59, $1C, $A6, $2D, $8F, $59 ; am⎵c[er]t[ain]⎵
#_1C84F6: db $D7, $2D, $59, $D8 ; [tha]t⎵[the]
#_1C84FA: db $73 ; scroll text
#_1C84FB: db $1C, $92, $25, $1E, $59, $D2, $25, $9E ; c[ast]le⎵[so]l[di]
#_1C8503: db $A6, $2C, $59, $E2, $25, $25, $59, $97 ; [er]s⎵[wi]ll⎵[be]
#_1C850B: db $59, $BB, $28, $24, $B4, $20 ; ⎵[lo]ok[in]g
#_1C8511: db $7E ; wait for key
#_1C8512: db $73 ; scroll text
#_1C8513: db $A8, $59, $E3, $59, $27, $28, $30, $3E ; [for]⎵[you]⎵now!
#_1C851B: db $8A, $43, $88, $43, $88, $43 ; [  ]…[    ]…[    ]…
#_1C8521: db $79, $2D ; play sfx
#_1C8523: db $73 ; scroll text
#_1C8524: db $08, $59, $E2, $25, $25, $59, $B0, $1D ; I⎵[wi]ll⎵[hi]d
#_1C852C: db $1E, $59, $0F, $2B, $B4, $1C, $1E, $2C ; e⎵Pr[in]ces
#_1C8534: db $2C, $59, $19, $1E, $25, $1D, $1A, $59 ; s⎵Zelda⎵
#_1C853C: db $AF, $1E, $41 ; [her]e.
#_1C853F: db $73 ; scroll text
#_1C8540: db $03, $28, $59, $C2, $59, $30, $C8, $2B ; Do⎵[not]⎵w[or]r
#_1C8548: db $32, $3E, $8A, $12, $1E, $1E, $24, $59 ; y![  ]Seek⎵
#_1C8550: db $D8, $59, $1E, $25, $1D, $A6, $3E ; [the]⎵eld[er]!
#_1C8557: db $7E ; wait for key
#_1C8558: db $73 ; scroll text
#_1C8559: db $43, $88, $43, $88, $43 ; …[    ]…[    ]…
#_1C855E: db $73 ; scroll text
#_1C855F: db $03, $28, $59, $E3, $59, $2E, $27, $1D ; Do⎵[you]⎵und
#_1C8567: db $A6, $D3, $90, $3F ; [er][st][and]?
#_1C856B: db $73 ; scroll text
#_1C856C: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1C8572: db $73 ; scroll text
#_1C8573: db $88, $89, $0D, $28, $2D, $59, $91, $1A ; [    ][   ]Not⎵[at ]a
#_1C857B: db $25, $25 ; ll
#_1C857D: db $68 ; choose 2 indented
#_1C857E: db $7F ; end of message

;===================================================================================================
; If you defeat the wizard, the
; soldiers may regain
; their sanity.
; Go, seek the Pendants!
;---------------------------------------------------------------------------------------------------
Message_0019:
#_1C857F: db $08, $1F, $59, $E3, $59, $1D, $1E, $1F ; If⎵[you]⎵def
#_1C8587: db $1E, $91, $D8, $59, $E2, $33, $1A, $2B ; e[at ][the]⎵[wi]zar
#_1C858F: db $1D, $42, $59, $D8 ; d,⎵[the]
#_1C8593: db $75 ; line 2
#_1C8594: db $D2, $25, $9E, $A6, $2C, $59, $BD, $32 ; [so]l[di][er]s⎵[ma]y
#_1C859C: db $59, $CE, $20, $8F ; ⎵[re]g[ain]
#_1C85A0: db $76 ; line 3
#_1C85A1: db $D8, $22, $2B, $59, $2C, $93, $B6, $32 ; [the]ir⎵s[an][it]y
#_1C85A9: db $41 ; .
#_1C85AA: db $7E ; wait for key
#_1C85AB: db $73 ; scroll text
#_1C85AC: db $06, $28, $42, $59, $D0, $1E, $24, $59 ; Go,⎵[se]ek⎵
#_1C85B4: db $D8, $59, $0F, $A5, $1D, $93, $2D, $2C ; [the]⎵P[en]d[an]ts
#_1C85BC: db $3E ; !
#_1C85BD: db $7F ; end of message

;===================================================================================================
; Take the three Pendants into
; the Lost Woods.  The Master
; Sword awaits you there.
;---------------------------------------------------------------------------------------------------
Message_001A:
#_1C85BE: db $13, $1A, $24, $1E, $59, $D8, $59, $2D ; Take⎵[the]⎵t
#_1C85C6: db $21, $CE, $1E, $59, $0F, $A5, $1D, $93 ; h[re]e⎵P[en]d[an]
#_1C85CE: db $2D, $2C, $59, $B4, $DA ; ts⎵[in][to]
#_1C85D3: db $75 ; line 2
#_1C85D4: db $D8, $59, $0B, $28, $D3, $59, $16, $28 ; [the]⎵Lo[st]⎵Wo
#_1C85DC: db $28, $1D, $2C, $41, $8A, $E6, $59, $0C ; ods.[  ][The]⎵M
#_1C85E4: db $92, $A6 ; [ast][er]
#_1C85E6: db $76 ; line 3
#_1C85E7: db $12, $30, $C8, $1D, $59, $1A, $DF, $B6 ; Sw[or]d⎵a[wa][it]
#_1C85EF: db $2C, $59, $E3, $59, $D8, $CE, $41 ; s⎵[you]⎵[the][re].
#_1C85F6: db $7F ; end of message

;===================================================================================================
; [LINK]!  You are a second too
; late.  I have failed… Zelda…
; The soldiers have
; abducted her.
; They have taken her to
; the castle.
; You must find her before the
; wizard works his magic.
; Please…You are our only hope…
;---------------------------------------------------------------------------------------------------
Message_001B:
#_1C85F7: db $6A, $3E, $8A, $E8, $59, $8D, $1A, $59 ; [LINK]![  ][You]⎵[are ]a⎵
#_1C85FF: db $D0, $1C, $C7, $1D, $59, $DA, $28 ; [se]c[on]d⎵[to]o
#_1C8606: db $75 ; line 2
#_1C8607: db $BA, $2D, $1E, $41, $8A, $08, $59, $AD ; [la]te.[  ]I⎵[have]
#_1C860F: db $59, $1F, $1A, $22, $25, $1E, $1D, $43 ; ⎵failed…
#_1C8617: db $59, $19, $1E, $25, $1D, $1A, $43 ; ⎵Zelda…
#_1C861E: db $76 ; line 3
#_1C861F: db $E6, $59, $D2, $25, $9E, $A6, $2C, $59 ; [The]⎵[so]l[di][er]s⎵
#_1C8627: db $AD ; [have]
#_1C8628: db $7E ; wait for key
#_1C8629: db $73 ; scroll text
#_1C862A: db $1A, $1B, $1D, $2E, $1C, $2D, $A4, $AF ; abduct[ed ][her]
#_1C8632: db $41 ; .
#_1C8633: db $73 ; scroll text
#_1C8634: db $E6, $32, $59, $AD, $59, $2D, $1A, $24 ; [The]y⎵[have]⎵tak
#_1C863C: db $A0, $AF, $59, $DA ; [en ][her]⎵[to]
#_1C8640: db $73 ; scroll text
#_1C8641: db $D8, $59, $1C, $92, $25, $1E, $41 ; [the]⎵c[ast]le.
#_1C8648: db $7E ; wait for key
#_1C8649: db $73 ; scroll text
#_1C864A: db $E8, $59, $BF, $D3, $59, $1F, $B4, $1D ; [You]⎵[mu][st]⎵f[in]d
#_1C8652: db $59, $AF, $59, $97, $A8, $1E, $59, $D8 ; ⎵[her]⎵[be][for]e⎵[the]
#_1C865A: db $73 ; scroll text
#_1C865B: db $E2, $33, $1A, $2B, $1D, $59, $30, $C8 ; [wi]zard⎵w[or]
#_1C8663: db $24, $2C, $59, $B0, $2C, $59, $BD, $20 ; ks⎵[hi]s⎵[ma]g
#_1C866B: db $22, $1C, $41 ; ic.
#_1C866E: db $73 ; scroll text
#_1C866F: db $0F, $25, $1E, $1A, $D0, $43, $E8, $59 ; Plea[se]…[You]⎵
#_1C8677: db $8D, $28, $2E, $2B, $59, $C7, $B9, $21 ; [are ]our⎵[on][ly ]h
#_1C867F: db $28, $29, $1E, $43 ; ope…
#_1C8683: db $7F ; end of message

;===================================================================================================
; Thank you, [LINK].  I had a
; feeling you were getting close.
;---------------------------------------------------------------------------------------------------
Message_001C:
#_1C8684: db $E5, $27, $24, $59, $E3, $42, $59, $6A ; [Tha]nk⎵[you],⎵[LINK]
#_1C868C: db $41, $8A, $08, $59, $B1, $1D, $59, $1A ; .[  ]I⎵[ha]d⎵a
#_1C8694: db $75 ; line 2
#_1C8695: db $1F, $1E, $1E, $25, $B3, $E3, $59, $E0 ; feel[ing ][you]⎵[we]
#_1C869D: db $CD, $AB, $2D, $B3, $1C, $BB, $D0, $41 ; [re ][get]t[ing ]c[lo][se].
#_1C86A5: db $7F ; end of message

;===================================================================================================
; Yes, it was [LINK] who helped
; me escape from the dungeon!
; When I was captive the wizard
; said, "Once I have finished with
; you, the final one, the seal of
; the wise men will open."
; …    …    …
; [LINK], you must not let the
; land of Hyrule fall into the
; wizard's clutches.
; If he releases the seal of the
; seven wise men, evil power will
; overwhelm this land.
; Before that happens…
; before it's too late… destroy
; the wizard before he destroys
; all of Hyrule!  You can do it!
; You can…
;---------------------------------------------------------------------------------------------------
Message_001D:
#_1C86A6: db $18, $1E, $2C, $42, $59, $B6, $59, $DF ; Yes,⎵[it]⎵[wa]
#_1C86AE: db $2C, $59, $6A, $59, $E1, $28, $59, $21 ; s⎵[LINK]⎵[wh]o⎵h
#_1C86B6: db $1E, $25, $29, $1E, $1D ; elped
#_1C86BB: db $75 ; line 2
#_1C86BC: db $BE, $59, $1E, $2C, $1C, $1A, $29, $1E ; [me]⎵escape
#_1C86C4: db $59, $A9, $26, $59, $D8, $59, $1D, $2E ; ⎵[fro]m⎵[the]⎵du
#_1C86CC: db $27, $20, $1E, $C7, $3E ; nge[on]!
#_1C86D1: db $76 ; line 3
#_1C86D2: db $16, $21, $A0, $08, $59, $DF, $2C, $59 ; Wh[en ]I⎵[wa]s⎵
#_1C86DA: db $1C, $1A, $29, $2D, $22, $2F, $1E, $59 ; captive⎵
#_1C86E2: db $D8, $59, $E2, $33, $1A, $2B, $1D ; [the]⎵[wi]zard
#_1C86E9: db $7E ; wait for key
#_1C86EA: db $73 ; scroll text
#_1C86EB: db $2C, $1A, $22, $1D, $42, $59, $4C, $0E ; said,⎵"O
#_1C86F3: db $27, $1C, $1E, $59, $08, $59, $AD, $59 ; nce⎵I⎵[have]⎵
#_1C86FB: db $1F, $B4, $B5, $21, $A4, $DE ; f[in][is]h[ed ][with]
#_1C8701: db $73 ; scroll text
#_1C8702: db $E3, $42, $59, $D8, $59, $1F, $B4, $1A ; [you],⎵[the]⎵f[in]a
#_1C870A: db $25, $59, $C7, $1E, $42, $59, $D8, $59 ; l⎵[on]e,⎵[the]⎵
#_1C8712: db $D0, $1A, $25, $59, $C6 ; [se]al⎵[of]
#_1C8717: db $73 ; scroll text
#_1C8718: db $D8, $59, $E2, $D0, $59, $BE, $27, $59 ; [the]⎵[wi][se]⎵[me]n⎵
#_1C8720: db $E2, $25, $25, $59, $C3, $41, $4C ; [wi]ll⎵[open]."
#_1C8727: db $7E ; wait for key
#_1C8728: db $73 ; scroll text
#_1C8729: db $43, $88, $43, $88, $43 ; …[    ]…[    ]…
#_1C872E: db $73 ; scroll text
#_1C872F: db $6A, $42, $59, $E3, $59, $BF, $D3, $59 ; [LINK],⎵[you]⎵[mu][st]⎵
#_1C8737: db $C2, $59, $25, $1E, $2D, $59, $D8 ; [not]⎵let⎵[the]
#_1C873E: db $73 ; scroll text
#_1C873F: db $BA, $27, $1D, $59, $C6, $59, $07, $32 ; [la]nd⎵[of]⎵Hy
#_1C8747: db $2B, $2E, $25, $1E, $59, $1F, $8E, $B4 ; rule⎵f[all ][in]
#_1C874F: db $DA, $59, $D8 ; [to]⎵[the]
#_1C8752: db $7E ; wait for key
#_1C8753: db $73 ; scroll text
#_1C8754: db $E2, $33, $1A, $2B, $1D, $8B, $1C, $25 ; [wi]zard['s ]cl
#_1C875C: db $2E, $2D, $9A, $2C, $41 ; ut[che]s.
#_1C8761: db $73 ; scroll text
#_1C8762: db $08, $1F, $59, $21, $1E, $59, $CE, $25 ; If⎵he⎵[re]l
#_1C876A: db $1E, $1A, $D0, $2C, $59, $D8, $59, $D0 ; ea[se]s⎵[the]⎵[se]
#_1C8772: db $1A, $25, $59, $C6, $59, $D8 ; al⎵[of]⎵[the]
#_1C8778: db $73 ; scroll text
#_1C8779: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1C8781: db $42, $59, $A7, $22, $25, $59, $CB, $A1 ; ,⎵[ev]il⎵[pow][er ]
#_1C8789: db $E2, $25, $25 ; [wi]ll
#_1C878C: db $7E ; wait for key
#_1C878D: db $73 ; scroll text
#_1C878E: db $28, $DD, $E1, $1E, $25, $26, $59, $D9 ; o[ver][wh]elm⎵[thi]
#_1C8796: db $2C, $59, $BA, $27, $1D, $41 ; s⎵[la]nd.
#_1C879C: db $73 ; scroll text
#_1C879D: db $01, $1E, $A8, $1E, $59, $D7, $2D, $59 ; Be[for]e⎵[tha]t⎵
#_1C87A5: db $B1, $29, $29, $A5, $2C, $43 ; [ha]pp[en]s…
#_1C87AB: db $73 ; scroll text
#_1C87AC: db $97, $A8, $1E, $59, $B6, $8B, $DA, $28 ; [be][for]e⎵[it]['s ][to]o
#_1C87B4: db $59, $BA, $2D, $1E, $43, $59, $9D, $DB ; ⎵[la]te…⎵[des][tr]
#_1C87BC: db $28, $32 ; oy
#_1C87BE: db $7E ; wait for key
#_1C87BF: db $73 ; scroll text
#_1C87C0: db $D8, $59, $E2, $33, $1A, $2B, $1D, $59 ; [the]⎵[wi]zard⎵
#_1C87C8: db $97, $A8, $1E, $59, $21, $1E, $59, $9D ; [be][for]e⎵he⎵[des]
#_1C87D0: db $DB, $28, $32, $2C ; [tr]oys
#_1C87D4: db $73 ; scroll text
#_1C87D5: db $8E, $C6, $59, $07, $32, $2B, $2E, $25 ; [all ][of]⎵Hyrul
#_1C87DD: db $1E, $3E, $8A, $E8, $59, $99, $9F, $59 ; e![  ][You]⎵[can ][do]⎵
#_1C87E5: db $B6, $3E ; [it]!
#_1C87E7: db $73 ; scroll text
#_1C87E8: db $E8, $59, $1C, $93, $43 ; [You]⎵c[an]…
#_1C87ED: db $7F ; end of message

;===================================================================================================
; [LINK], be careful out there!
; I know you can save Hyrule!
;---------------------------------------------------------------------------------------------------
Message_001E:
#_1C87EE: db $6A, $42, $59, $97, $59, $1C, $1A, $CE ; [LINK],⎵[be]⎵ca[re]
#_1C87F6: db $1F, $2E, $25, $59, $C5, $D8, $CE, $3E ; ful⎵[out ][the][re]!
#_1C87FE: db $75 ; line 2
#_1C87FF: db $08, $59, $B8, $59, $E3, $59, $99, $2C ; I⎵[know]⎵[you]⎵[can ]s
#_1C8807: db $1A, $2F, $1E, $59, $07, $32, $2B, $2E ; ave⎵Hyru
#_1C880F: db $25, $1E, $3E ; le!
#_1C8812: db $7F ; end of message

;===================================================================================================
; Help me…
; Please help me…
; I am a prisoner in the dungeon
; of the castle.
; My name is Zelda.
; The wizard, Agahnim, has done…
; something to the other missing
; girls.  Now only I remain…
; Agahnim has seized control of
; the castle and is now trying to
; open the seven wise men's
; seal.  …   …
; I am in the dungeon of the
; castle.
; Please help me…
;---------------------------------------------------------------------------------------------------
Message_001F:
#_1C8813: db $6B, $02 ; set window border
#_1C8815: db $7A, $03 ; set draw speed
#_1C8817: db $07, $1E, $25, $29, $59, $BE, $43 ; Help⎵[me]…
#_1C881E: db $78, $01 ; delay
#_1C8820: db $76 ; line 3
#_1C8821: db $0F, $25, $1E, $1A, $D0, $59, $21, $1E ; Plea[se]⎵he
#_1C8829: db $25, $29, $59, $BE, $43 ; lp⎵[me]…
#_1C882E: db $7E ; wait for key
#_1C882F: db $73 ; scroll text
#_1C8830: db $08, $59, $1A, $26, $59, $1A, $59, $29 ; I⎵am⎵a⎵p
#_1C8838: db $2B, $B5, $C7, $A1, $B4, $59, $D8, $59 ; r[is][on][er ][in]⎵[the]⎵
#_1C8840: db $1D, $2E, $27, $20, $1E, $C7 ; dunge[on]
#_1C8846: db $73 ; scroll text
#_1C8847: db $C6, $59, $D8, $59, $1C, $92, $25, $1E ; [of]⎵[the]⎵c[ast]le
#_1C884F: db $41 ; .
#_1C8850: db $73 ; scroll text
#_1C8851: db $0C, $32, $59, $27, $1A, $BE, $59, $B5 ; My⎵na[me]⎵[is]
#_1C8859: db $59, $19, $1E, $25, $1D, $1A, $41 ; ⎵Zelda.
#_1C8860: db $7E ; wait for key
#_1C8861: db $73 ; scroll text
#_1C8862: db $E6, $59, $E2, $33, $1A, $2B, $1D, $42 ; [The]⎵[wi]zard,
#_1C886A: db $59, $00, $20, $1A, $21, $27, $22, $26 ; ⎵Agahnim
#_1C8872: db $42, $59, $AE, $59, $9F, $27, $1E, $43 ; ,⎵[has]⎵[do]ne…
#_1C887A: db $73 ; scroll text
#_1C887B: db $CF, $D5, $20, $59, $DA, $59, $D8, $59 ; [some][thin]g⎵[to]⎵[the]⎵
#_1C8883: db $28, $D8, $2B, $59, $26, $B5, $2C, $B4 ; o[the]r⎵m[is]s[in]
#_1C888B: db $20 ; g
#_1C888C: db $73 ; scroll text
#_1C888D: db $20, $22, $2B, $25, $2C, $41, $8A, $0D ; girls.[  ]N
#_1C8895: db $28, $30, $59, $C7, $B9, $08, $59, $CE ; ow⎵[on][ly ]I⎵[re]
#_1C889D: db $BD, $B4, $43 ; [ma][in]…
#_1C88A0: db $7E ; wait for key
#_1C88A1: db $73 ; scroll text
#_1C88A2: db $00, $20, $1A, $21, $27, $22, $26, $59 ; Agahnim⎵
#_1C88AA: db $AE, $59, $D0, $22, $33, $A4, $1C, $C7 ; [has]⎵[se]iz[ed ]c[on]
#_1C88B2: db $DB, $28, $25, $59, $C6 ; [tr]ol⎵[of]
#_1C88B7: db $73 ; scroll text
#_1C88B8: db $D8, $59, $1C, $92, $25, $1E, $59, $8C ; [the]⎵c[ast]le⎵[and ]
#_1C88C0: db $B5, $59, $27, $28, $30, $59, $DB, $32 ; [is]⎵now⎵[tr]y
#_1C88C8: db $B3, $DA ; [ing ][to]
#_1C88CA: db $73 ; scroll text
#_1C88CB: db $C3, $59, $D8, $59, $D0, $2F, $A0, $E2 ; [open]⎵[the]⎵[se]v[en ][wi]
#_1C88D3: db $D0, $59, $BE, $27, $51, $2C ; [se]⎵[me]n's
#_1C88D9: db $7E ; wait for key
#_1C88DA: db $73 ; scroll text
#_1C88DB: db $D0, $1A, $25, $41, $8A, $43, $89, $43 ; [se]al.[  ]…[   ]…
#_1C88E3: db $73 ; scroll text
#_1C88E4: db $08, $59, $1A, $26, $59, $B4, $59, $D8 ; I⎵am⎵[in]⎵[the]
#_1C88EC: db $59, $1D, $2E, $27, $20, $1E, $C7, $59 ; ⎵dunge[on]⎵
#_1C88F4: db $C6, $59, $D8 ; [of]⎵[the]
#_1C88F7: db $73 ; scroll text
#_1C88F8: db $1C, $92, $25, $1E, $41 ; c[ast]le.
#_1C88FD: db $7E ; wait for key
#_1C88FE: db $73 ; scroll text
#_1C88FF: db $0F, $25, $1E, $1A, $D0, $59, $21, $1E ; Plea[se]⎵he
#_1C8907: db $25, $29, $59, $BE, $43 ; lp⎵[me]…
#_1C890C: db $7F ; end of message

;===================================================================================================
; Help me…
; I am in the dungeon of the
; castle.
; I know there is a hidden path
; from outside of  the castle to
; the garden inside.
;---------------------------------------------------------------------------------------------------
Message_0020:
#_1C890D: db $6B, $02 ; set window border
#_1C890F: db $7A, $03 ; set draw speed
#_1C8911: db $07, $1E, $25, $29, $59, $BE, $43 ; Help⎵[me]…
#_1C8918: db $75 ; line 2
#_1C8919: db $08, $59, $1A, $26, $59, $B4, $59, $D8 ; I⎵am⎵[in]⎵[the]
#_1C8921: db $59, $1D, $2E, $27, $20, $1E, $C7, $59 ; ⎵dunge[on]⎵
#_1C8929: db $C6, $59, $D8 ; [of]⎵[the]
#_1C892C: db $76 ; line 3
#_1C892D: db $1C, $92, $25, $1E, $41 ; c[ast]le.
#_1C8932: db $7E ; wait for key
#_1C8933: db $73 ; scroll text
#_1C8934: db $08, $59, $B8, $59, $D8, $CD, $B5, $59 ; I⎵[know]⎵[the][re ][is]⎵
#_1C893C: db $1A, $59, $B0, $1D, $1D, $A0, $29, $94 ; a⎵[hi]dd[en ]p[at]
#_1C8944: db $21 ; h
#_1C8945: db $73 ; scroll text
#_1C8946: db $A9, $26, $59, $28, $2E, $2D, $2C, $22 ; [fro]m⎵outsi
#_1C894E: db $1D, $1E, $59, $C6, $8A, $D8, $59, $1C ; de⎵[of][  ][the]⎵c
#_1C8956: db $92, $25, $1E, $59, $DA ; [ast]le⎵[to]
#_1C895B: db $73 ; scroll text
#_1C895C: db $D8, $59, $20, $1A, $2B, $1D, $A0, $B4 ; [the]⎵gard[en ][in]
#_1C8964: db $2C, $22, $1D, $1E, $41 ; side.
#_1C8969: db $7F ; end of message

;===================================================================================================
; There is a secret passage in
; the throne room that leads to
; Sanctuary.  I'm sure the old
; man there will help us.
;---------------------------------------------------------------------------------------------------
Message_0021:
#_1C896A: db $E6, $CD, $B5, $59, $1A, $59, $D0, $1C ; [The][re ][is]⎵a⎵[se]c
#_1C8972: db $CE, $2D, $59, $29, $1A, $2C, $2C, $1A ; [re]t⎵passa
#_1C897A: db $20, $1E, $59, $B4 ; ge⎵[in]
#_1C897E: db $75 ; line 2
#_1C897F: db $D8, $59, $2D, $21, $2B, $C7, $1E, $59 ; [the]⎵thr[on]e⎵
#_1C8987: db $2B, $28, $28, $26, $59, $D7, $2D, $59 ; room⎵[tha]t⎵
#_1C898F: db $25, $1E, $1A, $1D, $2C, $59, $DA ; leads⎵[to]
#_1C8996: db $76 ; line 3
#_1C8997: db $12, $93, $1C, $2D, $2E, $1A, $2B, $32 ; S[an]ctuary
#_1C899F: db $41, $8A, $08, $51, $26, $59, $2C, $2E ; .[  ]I'm⎵su
#_1C89A7: db $CD, $D8, $59, $28, $25, $1D ; [re ][the]⎵old
#_1C89AD: db $7E ; wait for key
#_1C89AE: db $73 ; scroll text
#_1C89AF: db $BC, $59, $D8, $CD, $E2, $25, $25, $59 ; [man]⎵[the][re ][wi]ll⎵
#_1C89B7: db $21, $1E, $25, $29, $59, $2E, $2C, $41 ; help⎵us.
#_1C89BF: db $7F ; end of message

;===================================================================================================
; That ornamental shelf should
; open.  Do you have a light?
; It's pitch dark inside and you
; can't see without one.
; If you're ready, let's go!
; Help me push it from the left!
;---------------------------------------------------------------------------------------------------
Message_0022:
#_1C89C0: db $E5, $2D, $59, $C8, $27, $1A, $BE, $27 ; [Tha]t⎵[or]na[me]n
#_1C89C8: db $2D, $1A, $25, $59, $D1, $1E, $25, $1F ; tal⎵[sh]elf
#_1C89D0: db $59, $D1, $28, $2E, $25, $1D ; ⎵[sh]ould
#_1C89D6: db $75 ; line 2
#_1C89D7: db $C3, $41, $8A, $03, $28, $59, $E3, $59 ; [open].[  ]Do⎵[you]⎵
#_1C89DF: db $AD, $59, $1A, $59, $25, $22, $20, $21 ; [have]⎵a⎵ligh
#_1C89E7: db $2D, $3F ; t?
#_1C89E9: db $76 ; line 3
#_1C89EA: db $08, $2D, $8B, $29, $B6, $1C, $21, $59 ; It['s ]p[it]ch⎵
#_1C89F2: db $1D, $1A, $2B, $24, $59, $B4, $2C, $22 ; dark⎵[in]si
#_1C89FA: db $1D, $1E, $59, $8C, $E3 ; de⎵[and ][you]
#_1C89FF: db $7E ; wait for key
#_1C8A00: db $73 ; scroll text
#_1C8A01: db $1C, $93, $51, $2D, $59, $D0, $1E, $59 ; c[an]'t⎵[se]e⎵
#_1C8A09: db $DE, $C5, $C7, $1E, $41 ; [with][out ][on]e.
#_1C8A0E: db $73 ; scroll text
#_1C8A0F: db $08, $1F, $59, $E3, $51, $CD, $CE, $1A ; If⎵[you]'[re ][re]a
#_1C8A17: db $1D, $32, $42, $59, $25, $1E, $2D, $8B ; dy,⎵let['s ]
#_1C8A1F: db $AC, $3E ; [go]!
#_1C8A21: db $73 ; scroll text
#_1C8A22: db $07, $1E, $25, $29, $59, $BE, $59, $29 ; Help⎵[me]⎵p
#_1C8A2A: db $2E, $D1, $59, $B6, $59, $A9, $26, $59 ; u[sh]⎵[it]⎵[fro]m⎵
#_1C8A32: db $D8, $59, $25, $1E, $1F, $2D, $3E ; [the]⎵left!
#_1C8A39: db $7F ; end of message

;===================================================================================================
; You have to pull the lever to
; open the door.  (Press the Ⓐ
; Button and hold Down on the
; Control Pad. )
;---------------------------------------------------------------------------------------------------
Message_0023:
#_1C8A3A: db $E8, $59, $AD, $59, $DA, $59, $29, $2E ; [You]⎵[have]⎵[to]⎵pu
#_1C8A42: db $25, $25, $59, $D8, $59, $25, $A7, $A1 ; ll⎵[the]⎵l[ev][er ]
#_1C8A4A: db $DA ; [to]
#_1C8A4B: db $75 ; line 2
#_1C8A4C: db $C3, $59, $D8, $59, $9F, $C8, $41, $8A ; [open]⎵[the]⎵[do][or].[  ]
#_1C8A54: db $45, $0F, $CE, $2C, $2C, $59, $D8, $59 ; (P[re]ss⎵[the]⎵
#_1C8A5C: db $5B ; Ⓐ
#_1C8A5D: db $76 ; line 3
#_1C8A5E: db $01, $2E, $2D, $DA, $27, $59, $8C, $21 ; But[to]n⎵[and ]h
#_1C8A66: db $28, $25, $1D, $59, $03, $28, $30, $27 ; old⎵Down
#_1C8A6E: db $59, $C7, $59, $D8 ; ⎵[on]⎵[the]
#_1C8A72: db $7E ; wait for key
#_1C8A73: db $73 ; scroll text
#_1C8A74: db $02, $C7, $DB, $28, $25, $59, $0F, $1A ; C[on][tr]ol⎵Pa
#_1C8A7C: db $1D, $41, $59, $46 ; d.⎵)
#_1C8A80: db $7F ; end of message

;===================================================================================================
; All right,  let's get out of here
; before the wizard notices.  I
; know a secret path, but first
; we have to go to the
; first floor.  Let's  go!
;---------------------------------------------------------------------------------------------------
Message_0024:
#_1C8A81: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_1C8A89: db $2D, $42, $8A, $25, $1E, $2D, $8B, $AB ; t,[  ]let['s ][get]
#_1C8A91: db $59, $C5, $C6, $59, $AF, $1E ; ⎵[out ][of]⎵[her]e
#_1C8A97: db $75 ; line 2
#_1C8A98: db $97, $A8, $1E, $59, $D8, $59, $E2, $33 ; [be][for]e⎵[the]⎵[wi]z
#_1C8AA0: db $1A, $2B, $1D, $59, $C2, $22, $1C, $1E ; ard⎵[not]ice
#_1C8AA8: db $2C, $41, $8A, $08 ; s.[  ]I
#_1C8AAC: db $76 ; line 3
#_1C8AAD: db $B8, $59, $1A, $59, $D0, $1C, $CE, $2D ; [know]⎵a⎵[se]c[re]t
#_1C8AB5: db $59, $29, $94, $21, $42, $59, $1B, $2E ; ⎵p[at]h,⎵bu
#_1C8ABD: db $2D, $59, $1F, $22, $2B, $D3 ; t⎵fir[st]
#_1C8AC3: db $7E ; wait for key
#_1C8AC4: db $73 ; scroll text
#_1C8AC5: db $E0, $59, $AD, $59, $DA, $59, $AC, $59 ; [we]⎵[have]⎵[to]⎵[go]⎵
#_1C8ACD: db $DA, $59, $D8 ; [to]⎵[the]
#_1C8AD0: db $73 ; scroll text
#_1C8AD1: db $1F, $22, $2B, $D3, $59, $1F, $BB, $C8 ; fir[st]⎵f[lo][or]
#_1C8AD9: db $41, $8A, $0B, $1E, $2D, $8B, $59, $AC ; .[  ]Let['s ]⎵[go]
#_1C8AE1: db $3E ; !
#_1C8AE2: db $7F ; end of message

;===================================================================================================
; [LINK], listen carefully.  The
; wizard is magically controlling
; all the soldiers in the castle.
; I fear the worst for
; my father…
; The wizard is an inhuman fiend
; with strong magical powers!
; …   …   …
; Do you understand?
;     > Yes
;        Not at all
;---------------------------------------------------------------------------------------------------
Message_0025:
#_1C8AE3: db $6A, $42, $59, $25, $B5, $2D, $A0, $1C ; [LINK],⎵l[is]t[en ]c
#_1C8AEB: db $1A, $CE, $1F, $2E, $25, $25, $32, $41 ; a[re]fully.
#_1C8AF3: db $8A, $E6 ; [  ][The]
#_1C8AF5: db $75 ; line 2
#_1C8AF6: db $E2, $33, $1A, $2B, $1D, $59, $B5, $59 ; [wi]zard⎵[is]⎵
#_1C8AFE: db $BD, $20, $22, $1C, $1A, $25, $B9, $1C ; [ma]gical[ly ]c
#_1C8B06: db $C7, $DB, $28, $25, $25, $B4, $20 ; [on][tr]oll[in]g
#_1C8B0D: db $76 ; line 3
#_1C8B0E: db $8E, $D8, $59, $D2, $25, $9E, $A6, $2C ; [all ][the]⎵[so]l[di][er]s
#_1C8B16: db $59, $B4, $59, $D8, $59, $1C, $92, $25 ; ⎵[in]⎵[the]⎵c[ast]l
#_1C8B1E: db $1E, $41 ; e.
#_1C8B20: db $7E ; wait for key
#_1C8B21: db $73 ; scroll text
#_1C8B22: db $08, $59, $1F, $A2, $59, $D8, $59, $30 ; I⎵f[ear]⎵[the]⎵w
#_1C8B2A: db $C8, $D3, $59, $A8 ; [or][st]⎵[for]
#_1C8B2E: db $73 ; scroll text
#_1C8B2F: db $26, $32, $59, $1F, $94, $AF, $43 ; my⎵f[at][her]…
#_1C8B36: db $73 ; scroll text
#_1C8B37: db $E6, $59, $E2, $33, $1A, $2B, $1D, $59 ; [The]⎵[wi]zard⎵
#_1C8B3F: db $B5, $59, $93, $59, $B4, $21, $2E, $BC ; [is]⎵[an]⎵[in]hu[man]
#_1C8B47: db $59, $1F, $22, $A5, $1D ; ⎵fi[en]d
#_1C8B4C: db $7E ; wait for key
#_1C8B4D: db $73 ; scroll text
#_1C8B4E: db $DE, $59, $D3, $2B, $C7, $20, $59, $BD ; [with]⎵[st]r[on]g⎵[ma]
#_1C8B56: db $20, $22, $1C, $1A, $25, $59, $CB, $A6 ; gical⎵[pow][er]
#_1C8B5E: db $2C, $3E ; s!
#_1C8B60: db $73 ; scroll text
#_1C8B61: db $43, $89, $43, $89, $43 ; …[   ]…[   ]…
#_1C8B66: db $7E ; wait for key
#_1C8B67: db $73 ; scroll text
#_1C8B68: db $03, $28, $59, $E3, $59, $2E, $27, $1D ; Do⎵[you]⎵und
#_1C8B70: db $A6, $D3, $90, $3F ; [er][st][and]?
#_1C8B74: db $73 ; scroll text
#_1C8B75: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1C8B7B: db $73 ; scroll text
#_1C8B7C: db $88, $89, $0D, $28, $2D, $59, $91, $1A ; [    ][   ]Not⎵[at ]a
#_1C8B84: db $25, $25 ; ll
#_1C8B86: db $68 ; choose 2 indented
#_1C8B87: db $7F ; end of message

;===================================================================================================
; You should follow the marks
; the elder made on your map
; when you explore.
; If you don't know what to do
; next, you can also visit a
; fortune teller.
;---------------------------------------------------------------------------------------------------
Message_0026:
#_1C8B88: db $E8, $59, $D1, $28, $2E, $25, $1D, $59 ; [You]⎵[sh]ould⎵
#_1C8B90: db $1F, $28, $25, $BB, $30, $59, $D8, $59 ; fol[lo]w⎵[the]⎵
#_1C8B98: db $BD, $2B, $24, $2C ; [ma]rks
#_1C8B9C: db $75 ; line 2
#_1C8B9D: db $D8, $59, $1E, $25, $1D, $A1, $BD, $1D ; [the]⎵eld[er ][ma]d
#_1C8BA5: db $1E, $59, $C7, $59, $E3, $2B, $59, $BD ; e⎵[on]⎵[you]r⎵[ma]
#_1C8BAD: db $29 ; p
#_1C8BAE: db $76 ; line 3
#_1C8BAF: db $E1, $A0, $E3, $59, $1E, $31, $29, $BB ; [wh][en ][you]⎵exp[lo]
#_1C8BB7: db $CE, $41 ; [re].
#_1C8BB9: db $7E ; wait for key
#_1C8BBA: db $73 ; scroll text
#_1C8BBB: db $08, $1F, $59, $E3, $59, $9F, $C0, $B8 ; If⎵[you]⎵[do][n't ][know]
#_1C8BC3: db $59, $E1, $91, $DA, $59, $9F ; ⎵[wh][at ][to]⎵[do]
#_1C8BC9: db $73 ; scroll text
#_1C8BCA: db $27, $1E, $31, $2D, $42, $59, $E3, $59 ; next,⎵[you]⎵
#_1C8BD2: db $99, $1A, $25, $D2, $59, $2F, $B5, $B6 ; [can ]al[so]⎵v[is][it]
#_1C8BDA: db $59, $1A ; ⎵a
#_1C8BDC: db $73 ; scroll text
#_1C8BDD: db $A8, $2D, $2E, $27, $1E, $59, $2D, $1E ; [for]tune⎵te
#_1C8BE5: db $25, $25, $A6, $41 ; ll[er].
#_1C8BE9: db $7F ; end of message

;===================================================================================================
; [LINK], you are wonderful!
; As I thought, you have the
; power of the Hero inside you!
; Now, you should get the Master
; Sword.  I am confident that you
; can defeat the evil wizard!
;---------------------------------------------------------------------------------------------------
Message_0027:
#_1C8BEA: db $6A, $42, $59, $E3, $59, $8D, $30, $C7 ; [LINK],⎵[you]⎵[are ]w[on]
#_1C8BF2: db $1D, $A6, $1F, $2E, $25, $3E ; d[er]ful!
#_1C8BF8: db $75 ; line 2
#_1C8BF9: db $00, $2C, $59, $08, $59, $2D, $21, $28 ; As⎵I⎵tho
#_1C8C01: db $2E, $20, $21, $2D, $42, $59, $E3, $59 ; ught,⎵[you]⎵
#_1C8C09: db $AD, $59, $D8 ; [have]⎵[the]
#_1C8C0C: db $76 ; line 3
#_1C8C0D: db $CB, $A1, $C6, $59, $D8, $59, $E4, $28 ; [pow][er ][of]⎵[the]⎵[Her]o
#_1C8C15: db $59, $B4, $2C, $22, $1D, $1E, $59, $E3 ; ⎵[in]side⎵[you]
#_1C8C1D: db $3E ; !
#_1C8C1E: db $7E ; wait for key
#_1C8C1F: db $73 ; scroll text
#_1C8C20: db $0D, $28, $30, $42, $59, $E3, $59, $D1 ; Now,⎵[you]⎵[sh]
#_1C8C28: db $28, $2E, $25, $1D, $59, $AB, $59, $D8 ; ould⎵[get]⎵[the]
#_1C8C30: db $59, $0C, $92, $A6 ; ⎵M[ast][er]
#_1C8C34: db $73 ; scroll text
#_1C8C35: db $12, $30, $C8, $1D, $41, $8A, $08, $59 ; Sw[or]d.[  ]I⎵
#_1C8C3D: db $1A, $26, $59, $1C, $C7, $1F, $22, $1D ; am⎵c[on]fid
#_1C8C45: db $A3, $59, $D7, $2D, $59, $E3 ; [ent]⎵[tha]t⎵[you]
#_1C8C4B: db $73 ; scroll text
#_1C8C4C: db $99, $1D, $1E, $1F, $1E, $91, $D8, $59 ; [can ]defe[at ][the]⎵
#_1C8C54: db $A7, $22, $25, $59, $E2, $33, $1A, $2B ; [ev]il⎵[wi]zar
#_1C8C5C: db $1D, $3E ; d!
#_1C8C5E: db $7F ; end of message

;===================================================================================================
; [LINK]!  Help!  The soldiers
; are coming to Sanctuary!
; AIEEEEEEE!
; … … …
;---------------------------------------------------------------------------------------------------
Message_0028:
#_1C8C5F: db $6B, $02 ; set window border
#_1C8C61: db $7A, $03 ; set draw speed
#_1C8C63: db $6A, $3E, $8A, $07, $1E, $25, $29, $3E ; [LINK]![  ]Help!
#_1C8C6B: db $8A, $E6, $59, $D2, $25, $9E, $A6, $2C ; [  ][The]⎵[so]l[di][er]s
#_1C8C73: db $75 ; line 2
#_1C8C74: db $8D, $9B, $B3, $DA, $59, $12, $93, $1C ; [are ][com][ing ][to]⎵S[an]c
#_1C8C7C: db $2D, $2E, $1A, $2B, $32, $3E ; tuary!
#_1C8C82: db $76 ; line 3
#_1C8C83: db $00, $08, $04, $04, $04, $04, $04, $04 ; AIEEEEEE
#_1C8C8B: db $04, $3E ; E!
#_1C8C8D: db $7E ; wait for key
#_1C8C8E: db $73 ; scroll text
#_1C8C8F: db $43, $59, $43, $59, $43 ; …⎵…⎵…
#_1C8C94: db $7F ; end of message

;===================================================================================================
; After passing through these
; sewers, we will be very close
; to Sanctuary!
; Let's be careful!
;---------------------------------------------------------------------------------------------------
Message_0029:
#_1C8C95: db $00, $1F, $D4, $29, $1A, $2C, $2C, $B3 ; Af[ter ]pass[ing ]
#_1C8C9D: db $2D, $21, $2B, $28, $2E, $20, $21, $59 ; through⎵
#_1C8CA5: db $D8, $D0 ; [the][se]
#_1C8CA7: db $75 ; line 2
#_1C8CA8: db $D0, $E0, $2B, $2C, $42, $59, $E0, $59 ; [se][we]rs,⎵[we]⎵
#_1C8CB0: db $E2, $25, $25, $59, $97, $59, $DD, $32 ; [wi]ll⎵[be]⎵[ver]y
#_1C8CB8: db $59, $1C, $BB, $D0 ; ⎵c[lo][se]
#_1C8CBC: db $76 ; line 3
#_1C8CBD: db $DA, $59, $12, $93, $1C, $2D, $2E, $1A ; [to]⎵S[an]ctua
#_1C8CC5: db $2B, $32, $3E ; ry!
#_1C8CC8: db $7E ; wait for key
#_1C8CC9: db $73 ; scroll text
#_1C8CCA: db $0B, $1E, $2D, $8B, $97, $59, $1C, $1A ; Let['s ][be]⎵ca
#_1C8CD2: db $CE, $1F, $2E, $25, $3E ; [re]ful!
#_1C8CD7: db $7F ; end of message

;===================================================================================================
; Sanctuary is just beyond that
; door.  Pull the switch over
; there.
;---------------------------------------------------------------------------------------------------
Message_002A:
#_1C8CD8: db $12, $93, $1C, $2D, $2E, $1A, $2B, $32 ; S[an]ctuary
#_1C8CE0: db $59, $B5, $59, $B7, $59, $97, $32, $C7 ; ⎵[is]⎵[just]⎵[be]y[on]
#_1C8CE8: db $1D, $59, $D7, $2D ; d⎵[tha]t
#_1C8CEC: db $75 ; line 2
#_1C8CED: db $9F, $C8, $41, $8A, $0F, $2E, $25, $25 ; [do][or].[  ]Pull
#_1C8CF5: db $59, $D8, $59, $2C, $E2, $2D, $1C, $21 ; ⎵[the]⎵s[wi]tch
#_1C8CFD: db $59, $28, $DD ; ⎵o[ver]
#_1C8D00: db $76 ; line 3
#_1C8D01: db $D8, $CE, $41 ; [the][re].
#_1C8D04: db $7F ; end of message

;===================================================================================================
; Who? Oh, it's you, [LINK]!
; What can I do for you, young
; man?  The elder?  Oh, no one
; has seen him since the wizard
; began collecting victims…
; …   …   …
; What?  Master Sword?  Well, I
; don't remember the details
; exactly, but…
;---------------------------------------------------------------------------------------------------
Message_002B:
#_1C8D05: db $16, $21, $28, $3F, $59, $0E, $21, $42 ; Who?⎵Oh,
#_1C8D0D: db $59, $B6, $8B, $E3, $42, $59, $6A, $3E ; ⎵[it]['s ][you],⎵[LINK]!
#_1C8D15: db $75 ; line 2
#_1C8D16: db $16, $B1, $2D, $59, $99, $08, $59, $9F ; W[ha]t⎵[can ]I⎵[do]
#_1C8D1E: db $59, $A8, $59, $E3, $42, $59, $E3, $27 ; ⎵[for]⎵[you],⎵[you]n
#_1C8D26: db $20 ; g
#_1C8D27: db $76 ; line 3
#_1C8D28: db $BC, $3F, $8A, $E6, $59, $1E, $25, $1D ; [man]?[  ][The]⎵eld
#_1C8D30: db $A6, $3F, $8A, $0E, $21, $42, $59, $27 ; [er]?[  ]Oh,⎵n
#_1C8D38: db $28, $59, $C7, $1E ; o⎵[on]e
#_1C8D3C: db $7E ; wait for key
#_1C8D3D: db $73 ; scroll text
#_1C8D3E: db $AE, $59, $D0, $A0, $B0, $26, $59, $2C ; [has]⎵[se][en ][hi]m⎵s
#_1C8D46: db $B4, $1C, $1E, $59, $D8, $59, $E2, $33 ; [in]ce⎵[the]⎵[wi]z
#_1C8D4E: db $1A, $2B, $1D ; ard
#_1C8D51: db $73 ; scroll text
#_1C8D52: db $97, $20, $93, $59, $1C, $28, $25, $25 ; [be]g[an]⎵coll
#_1C8D5A: db $1E, $1C, $2D, $B3, $2F, $22, $1C, $2D ; ect[ing ]vict
#_1C8D62: db $22, $26, $2C, $43 ; ims…
#_1C8D66: db $73 ; scroll text
#_1C8D67: db $43, $89, $43, $89, $43 ; …[   ]…[   ]…
#_1C8D6C: db $7E ; wait for key
#_1C8D6D: db $73 ; scroll text
#_1C8D6E: db $16, $B1, $2D, $3F, $8A, $0C, $92, $A1 ; W[ha]t?[  ]M[ast][er ]
#_1C8D76: db $12, $30, $C8, $1D, $3F, $8A, $16, $1E ; Sw[or]d?[  ]We
#_1C8D7E: db $25, $25, $42, $59, $08 ; ll,⎵I
#_1C8D83: db $73 ; scroll text
#_1C8D84: db $9F, $C0, $CE, $BE, $26, $97, $2B, $59 ; [do][n't ][re][me]m[be]r⎵
#_1C8D8C: db $D8, $59, $1D, $1E, $2D, $1A, $22, $25 ; [the]⎵detail
#_1C8D94: db $2C ; s
#_1C8D95: db $73 ; scroll text
#_1C8D96: db $1E, $31, $1A, $1C, $2D, $25, $32, $42 ; exactly,
#_1C8D9E: db $59, $1B, $2E, $2D, $43 ; ⎵but…
#_1C8DA3: db $7F ; end of message

;===================================================================================================
; Long ago, a prosperous people
; known as the Hylia inhabited
; this land…
; Legends tell of many treasures
; that the Hylia hid throughout
; the land…
; The Master Sword, a mighty
; blade forged against those
; with evil hearts, is one of
; them.  People say that now it
; is sleeping deep in the forest…
; … … …
; Do you understand the legend?
;     > Yes
;        Not at all
;---------------------------------------------------------------------------------------------------
Message_002C:
#_1C8DA4: db $0B, $C7, $20, $59, $1A, $AC, $42, $59 ; L[on]g⎵a[go],⎵
#_1C8DAC: db $1A, $59, $CC, $2C, $C9, $28, $2E, $2C ; a⎵[pro]s[per]ous
#_1C8DB4: db $59, $29, $1E, $28, $CA ; ⎵peo[ple]
#_1C8DB9: db $75 ; line 2
#_1C8DBA: db $B8, $27, $59, $1A, $2C, $59, $D8, $59 ; [know]n⎵as⎵[the]⎵
#_1C8DC2: db $07, $32, $25, $22, $1A, $59, $B4, $B1 ; Hylia⎵[in][ha]
#_1C8DCA: db $1B, $B6, $1E, $1D ; b[it]ed
#_1C8DCE: db $76 ; line 3
#_1C8DCF: db $D9, $2C, $59, $BA, $27, $1D, $43 ; [thi]s⎵[la]nd…
#_1C8DD6: db $7E ; wait for key
#_1C8DD7: db $73 ; scroll text
#_1C8DD8: db $0B, $1E, $20, $A5, $1D, $2C, $59, $2D ; Leg[en]ds⎵t
#_1C8DE0: db $1E, $25, $25, $59, $C6, $59, $BC, $32 ; ell⎵[of]⎵[man]y
#_1C8DE8: db $59, $DB, $1E, $1A, $2C, $2E, $CE, $2C ; ⎵[tr]easu[re]s
#_1C8DF0: db $73 ; scroll text
#_1C8DF1: db $D7, $2D, $59, $D8, $59, $07, $32, $25 ; [tha]t⎵[the]⎵Hyl
#_1C8DF9: db $22, $1A, $59, $B0, $1D, $59, $2D, $21 ; ia⎵[hi]d⎵th
#_1C8E01: db $2B, $28, $2E, $20, $21, $28, $2E, $2D ; roughout
#_1C8E09: db $73 ; scroll text
#_1C8E0A: db $D8, $59, $BA, $27, $1D, $43 ; [the]⎵[la]nd…
#_1C8E10: db $7E ; wait for key
#_1C8E11: db $73 ; scroll text
#_1C8E12: db $E6, $59, $0C, $92, $A1, $12, $30, $C8 ; [The]⎵M[ast][er ]Sw[or]
#_1C8E1A: db $1D, $42, $59, $1A, $59, $26, $22, $20 ; d,⎵a⎵mig
#_1C8E22: db $21, $2D, $32 ; hty
#_1C8E25: db $73 ; scroll text
#_1C8E26: db $1B, $BA, $1D, $1E, $59, $A8, $20, $A4 ; b[la]de⎵[for]g[ed ]
#_1C8E2E: db $1A, $20, $8F, $D3, $59, $2D, $21, $28 ; ag[ain][st]⎵tho
#_1C8E36: db $D0 ; [se]
#_1C8E37: db $73 ; scroll text
#_1C8E38: db $DE, $59, $A7, $22, $25, $59, $21, $A2 ; [with]⎵[ev]il⎵h[ear]
#_1C8E40: db $2D, $2C, $42, $59, $B5, $59, $C7, $1E ; ts,⎵[is]⎵[on]e
#_1C8E48: db $59, $C6 ; ⎵[of]
#_1C8E4A: db $7E ; wait for key
#_1C8E4B: db $73 ; scroll text
#_1C8E4C: db $D8, $26, $41, $8A, $0F, $1E, $28, $CA ; [the]m.[  ]Peo[ple]
#_1C8E54: db $59, $2C, $1A, $32, $59, $D7, $2D, $59 ; ⎵say⎵[tha]t⎵
#_1C8E5C: db $27, $28, $30, $59, $B6 ; now⎵[it]
#_1C8E61: db $73 ; scroll text
#_1C8E62: db $B5, $59, $2C, $25, $1E, $1E, $29, $B3 ; [is]⎵sleep[ing ]
#_1C8E6A: db $1D, $1E, $1E, $29, $59, $B4, $59, $D8 ; deep⎵[in]⎵[the]
#_1C8E72: db $59, $A8, $1E, $D3, $43 ; ⎵[for]e[st]…
#_1C8E77: db $73 ; scroll text
#_1C8E78: db $43, $59, $43, $59, $43 ; …⎵…⎵…
#_1C8E7D: db $7E ; wait for key
#_1C8E7E: db $73 ; scroll text
#_1C8E7F: db $03, $28, $59, $E3, $59, $2E, $27, $1D ; Do⎵[you]⎵und
#_1C8E87: db $A6, $D3, $8C, $D8, $59, $25, $1E, $20 ; [er][st][and ][the]⎵leg
#_1C8E8F: db $A5, $1D, $3F ; [en]d?
#_1C8E92: db $73 ; scroll text
#_1C8E93: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1C8E99: db $73 ; scroll text
#_1C8E9A: db $88, $89, $0D, $28, $2D, $59, $91, $1A ; [    ][   ]Not⎵[at ]a
#_1C8EA2: db $25, $25 ; ll
#_1C8EA4: db $68 ; choose 2 indented
#_1C8EA5: db $7F ; end of message

;===================================================================================================
; Anyway, look for the elder.
; There must be someone in the
; village who knows where he is.
; You take care now, [LINK]…
;---------------------------------------------------------------------------------------------------
Message_002D:
#_1C8EA6: db $00, $27, $32, $DF, $32, $42, $59, $BB ; Any[wa]y,⎵[lo]
#_1C8EAE: db $28, $24, $59, $A8, $59, $D8, $59, $1E ; ok⎵[for]⎵[the]⎵e
#_1C8EB6: db $25, $1D, $A6, $41 ; ld[er].
#_1C8EBA: db $75 ; line 2
#_1C8EBB: db $E6, $CD, $BF, $D3, $59, $97, $59, $CF ; [The][re ][mu][st]⎵[be]⎵[some]
#_1C8EC3: db $C7, $1E, $59, $B4, $59, $D8 ; [on]e⎵[in]⎵[the]
#_1C8EC9: db $76 ; line 3
#_1C8ECA: db $2F, $22, $25, $BA, $20, $1E, $59, $E1 ; vil[la]ge⎵[wh]
#_1C8ED2: db $28, $59, $B8, $2C, $59, $E1, $A6, $1E ; o⎵[know]s⎵[wh][er]e
#_1C8EDA: db $59, $21, $1E, $59, $B5, $41 ; ⎵he⎵[is].
#_1C8EE0: db $7E ; wait for key
#_1C8EE1: db $73 ; scroll text
#_1C8EE2: db $E8, $59, $2D, $1A, $24, $1E, $59, $1C ; [You]⎵take⎵c
#_1C8EEA: db $8D, $27, $28, $30, $42, $59, $6A, $43 ; [are ]now,⎵[LINK]…
#_1C8EF2: db $7F ; end of message

;===================================================================================================
; Ohhh,[LINK].  You've changed!
; You look marvelous…  Please
; save us from Agahnim
; the wizard!
;---------------------------------------------------------------------------------------------------
Message_002E:
#_1C8EF3: db $0E, $21, $21, $21, $42, $6A, $41, $8A ; Ohhh,[LINK].[  ]
#_1C8EFB: db $E8, $51, $2F, $1E, $59, $1C, $B1, $27 ; [You]'ve⎵c[ha]n
#_1C8F03: db $20, $1E, $1D, $3E ; ged!
#_1C8F07: db $75 ; line 2
#_1C8F08: db $E8, $59, $BB, $28, $24, $59, $BD, $2B ; [You]⎵[lo]ok⎵[ma]r
#_1C8F10: db $2F, $1E, $BB, $2E, $2C, $43, $8A, $0F ; ve[lo]us…[  ]P
#_1C8F18: db $25, $1E, $1A, $D0 ; lea[se]
#_1C8F1C: db $76 ; line 3
#_1C8F1D: db $2C, $1A, $2F, $1E, $59, $2E, $2C, $59 ; save⎵us⎵
#_1C8F25: db $A9, $26, $59, $00, $20, $1A, $21, $27 ; [fro]m⎵Agahn
#_1C8F2D: db $22, $26 ; im
#_1C8F2F: db $7E ; wait for key
#_1C8F30: db $73 ; scroll text
#_1C8F31: db $D8, $59, $E2, $33, $1A, $2B, $1D, $3E ; [the]⎵[wi]zard!
#_1C8F39: db $7F ; end of message

;===================================================================================================
; Hey!  Here is [LINK], the
; wanted man!  Soldiers!  Anyone!
; Come quickly!
;---------------------------------------------------------------------------------------------------
Message_002F:
#_1C8F3A: db $07, $1E, $32, $3E, $8A, $E4, $1E, $59 ; Hey![  ][Her]e⎵
#_1C8F42: db $B5, $59, $6A, $42, $59, $D8 ; [is]⎵[LINK],⎵[the]
#_1C8F48: db $75 ; line 2
#_1C8F49: db $DF, $27, $2D, $A4, $BC, $3E, $8A, $12 ; [wa]nt[ed ][man]![  ]S
#_1C8F51: db $28, $25, $9E, $A6, $2C, $3E, $8A, $00 ; ol[di][er]s![  ]A
#_1C8F59: db $27, $32, $C7, $1E, $3E ; ny[on]e!
#_1C8F5E: db $76 ; line 3
#_1C8F5F: db $02, $28, $BE, $59, $2A, $2E, $22, $9C ; Co[me]⎵qui[ck]
#_1C8F67: db $25, $32, $3E ; ly!
#_1C8F6A: db $7F ; end of message

;===================================================================================================
; Incredible!  At last you have
; the three Pendants…  Now, you
; should go to the Lost Woods.
; If you are the true Hero, the
; sword itself will select you.
; … … …
;---------------------------------------------------------------------------------------------------
Message_0030:
#_1C8F6B: db $08, $27, $1C, $CE, $9E, $95, $3E, $8A ; Inc[re][di][ble]![  ]
#_1C8F73: db $00, $2D, $59, $BA, $D3, $59, $E3, $59 ; At⎵[la][st]⎵[you]⎵
#_1C8F7B: db $AD ; [have]
#_1C8F7C: db $75 ; line 2
#_1C8F7D: db $D8, $59, $2D, $21, $CE, $1E, $59, $0F ; [the]⎵th[re]e⎵P
#_1C8F85: db $A5, $1D, $93, $2D, $2C, $43, $8A, $0D ; [en]d[an]ts…[  ]N
#_1C8F8D: db $28, $30, $42, $59, $E3 ; ow,⎵[you]
#_1C8F92: db $76 ; line 3
#_1C8F93: db $D1, $28, $2E, $25, $1D, $59, $AC, $59 ; [sh]ould⎵[go]⎵
#_1C8F9B: db $DA, $59, $D8, $59, $0B, $28, $D3, $59 ; [to]⎵[the]⎵Lo[st]⎵
#_1C8FA3: db $16, $28, $28, $1D, $2C, $41 ; Woods.
#_1C8FA9: db $7E ; wait for key
#_1C8FAA: db $73 ; scroll text
#_1C8FAB: db $08, $1F, $59, $E3, $59, $8D, $D8, $59 ; If⎵[you]⎵[are ][the]⎵
#_1C8FB3: db $DB, $2E, $1E, $59, $E4, $28, $42, $59 ; [tr]ue⎵[Her]o,⎵
#_1C8FBB: db $D8 ; [the]
#_1C8FBC: db $73 ; scroll text
#_1C8FBD: db $2C, $30, $C8, $1D, $59, $B6, $D0, $25 ; sw[or]d⎵[it][se]l
#_1C8FC5: db $1F, $59, $E2, $25, $25, $59, $D0, $25 ; f⎵[wi]ll⎵[se]l
#_1C8FCD: db $1E, $1C, $2D, $59, $E3, $41 ; ect⎵[you].
#_1C8FD3: db $73 ; scroll text
#_1C8FD4: db $43, $59, $43, $59, $43 ; …⎵…⎵…
#_1C8FD9: db $7F ; end of message

;===================================================================================================
; I am too old to fight.
; I can only rely on you.
;---------------------------------------------------------------------------------------------------
Message_0031:
#_1C8FDA: db $08, $59, $1A, $26, $59, $DA, $28, $59 ; I⎵am⎵[to]o⎵
#_1C8FE2: db $28, $25, $1D, $59, $DA, $59, $1F, $22 ; old⎵[to]⎵fi
#_1C8FEA: db $20, $21, $2D, $41 ; ght.
#_1C8FEE: db $75 ; line 2
#_1C8FEF: db $08, $59, $99, $C7, $B9, $CE, $B9, $C7 ; I⎵[can ][on][ly ][re][ly ][on]
#_1C8FF7: db $59, $E3, $41 ; ⎵[you].
#_1C8FFA: db $7F ; end of message

;===================================================================================================
; I am, indeed, Sahasrahla, the
; village elder and a descendent
; of the seven wise men.
; …   …     Oh really?
; [LINK], I am surprised a young
; man like you is searching for
; the sword of evil's bane.
; Not just anyone can use that
; weapon.  Legends say only the
; Hero who has won the three
; Pendants can wield the sword.
; …   …   …
; Do you really want to find it?
;     > Yeah!
;        Of Course!
;---------------------------------------------------------------------------------------------------
Message_0032:
#_1C8FFB: db $08, $59, $1A, $26, $42, $59, $B4, $1D ; I⎵am,⎵[in]d
#_1C9003: db $1E, $1E, $1D, $42, $59, $12, $1A, $AE ; eed,⎵Sa[has]
#_1C900B: db $2B, $1A, $21, $BA, $42, $59, $D8 ; rah[la],⎵[the]
#_1C9012: db $75 ; line 2
#_1C9013: db $2F, $22, $25, $BA, $20, $1E, $59, $1E ; vil[la]ge⎵e
#_1C901B: db $25, $1D, $A1, $8C, $1A, $59, $9D, $1C ; ld[er ][and ]a⎵[des]c
#_1C9023: db $A5, $1D, $A3 ; [en]d[ent]
#_1C9026: db $76 ; line 3
#_1C9027: db $C6, $59, $D8, $59, $D0, $2F, $A0, $E2 ; [of]⎵[the]⎵[se]v[en ][wi]
#_1C902F: db $D0, $59, $BE, $27, $41 ; [se]⎵[me]n.
#_1C9034: db $7E ; wait for key
#_1C9035: db $73 ; scroll text
#_1C9036: db $43, $89, $43, $88, $59, $0E, $21, $59 ; …[   ]…[    ]⎵Oh⎵
#_1C903E: db $CE, $1A, $25, $25, $32, $3F ; [re]ally?
#_1C9044: db $73 ; scroll text
#_1C9045: db $6A, $42, $59, $08, $59, $1A, $26, $59 ; [LINK],⎵I⎵am⎵
#_1C904D: db $2C, $2E, $2B, $29, $2B, $B5, $A4, $1A ; surpr[is][ed ]a
#_1C9055: db $59, $E3, $27, $20 ; ⎵[you]ng
#_1C9059: db $73 ; scroll text
#_1C905A: db $BC, $59, $25, $22, $24, $1E, $59, $E3 ; [man]⎵like⎵[you]
#_1C9062: db $59, $B5, $59, $D0, $1A, $2B, $1C, $B0 ; ⎵[is]⎵[se]arc[hi]
#_1C906A: db $27, $20, $59, $A8 ; ng⎵[for]
#_1C906E: db $7E ; wait for key
#_1C906F: db $73 ; scroll text
#_1C9070: db $D8, $59, $2C, $30, $C8, $1D, $59, $C6 ; [the]⎵sw[or]d⎵[of]
#_1C9078: db $59, $A7, $22, $25, $8B, $96, $27, $1E ; ⎵[ev]il['s ][ba]ne
#_1C9080: db $41 ; .
#_1C9081: db $73 ; scroll text
#_1C9082: db $0D, $28, $2D, $59, $B7, $59, $93, $32 ; Not⎵[just]⎵[an]y
#_1C908A: db $C7, $1E, $59, $99, $2E, $D0, $59, $D7 ; [on]e⎵[can ]u[se]⎵[tha]
#_1C9092: db $2D ; t
#_1C9093: db $73 ; scroll text
#_1C9094: db $E0, $1A, $29, $C7, $41, $8A, $0B, $1E ; [we]ap[on].[  ]Le
#_1C909C: db $20, $A5, $1D, $2C, $59, $2C, $1A, $32 ; g[en]ds⎵say
#_1C90A4: db $59, $C7, $B9, $D8 ; ⎵[on][ly ][the]
#_1C90A8: db $7E ; wait for key
#_1C90A9: db $73 ; scroll text
#_1C90AA: db $E4, $28, $59, $E1, $28, $59, $AE, $59 ; [Her]o⎵[wh]o⎵[has]⎵
#_1C90B2: db $30, $C7, $59, $D8, $59, $2D, $21, $CE ; w[on]⎵[the]⎵th[re]
#_1C90BA: db $1E ; e
#_1C90BB: db $73 ; scroll text
#_1C90BC: db $0F, $A5, $1D, $93, $2D, $2C, $59, $99 ; P[en]d[an]ts⎵[can ]
#_1C90C4: db $E2, $1E, $25, $1D, $59, $D8, $59, $2C ; [wi]eld⎵[the]⎵s
#_1C90CC: db $30, $C8, $1D, $41 ; w[or]d.
#_1C90D0: db $73 ; scroll text
#_1C90D1: db $43, $89, $43, $89, $43 ; …[   ]…[   ]…
#_1C90D6: db $7E ; wait for key
#_1C90D7: db $73 ; scroll text
#_1C90D8: db $03, $28, $59, $E3, $59, $CE, $1A, $25 ; Do⎵[you]⎵[re]al
#_1C90E0: db $B9, $DF, $27, $2D, $59, $DA, $59, $1F ; [ly ][wa]nt⎵[to]⎵f
#_1C90E8: db $B4, $1D, $59, $B6, $3F ; [in]d⎵[it]?
#_1C90ED: db $73 ; scroll text
#_1C90EE: db $88, $44, $59, $18, $1E, $1A, $21, $3E ; [    ]>⎵Yeah!
#_1C90F6: db $73 ; scroll text
#_1C90F7: db $88, $89, $0E, $1F, $59, $02, $28, $2E ; [    ][   ]Of⎵Cou
#_1C90FF: db $2B, $D0, $3E ; r[se]!
#_1C9102: db $68 ; choose 2 indented
#_1C9103: db $7F ; end of message

;===================================================================================================
; Good.  As a test, can you
; retrieve the Pendant Of
; Courage from the East Palace?
; If you bring it here, I will tell
; you more of the legend and
; give you a magical artifact.
; Now, go forward to the palace.
;---------------------------------------------------------------------------------------------------
Message_0033:
#_1C9104: db $06, $28, $28, $1D, $41, $8A, $00, $2C ; Good.[  ]As
#_1C910C: db $59, $1A, $59, $2D, $1E, $D3, $42, $59 ; ⎵a⎵te[st],⎵
#_1C9114: db $99, $E3 ; [can ][you]
#_1C9116: db $75 ; line 2
#_1C9117: db $CE, $DB, $22, $A7, $1E, $59, $D8, $59 ; [re][tr]i[ev]e⎵[the]⎵
#_1C911F: db $0F, $A5, $1D, $93, $2D, $59, $0E, $1F ; P[en]d[an]t⎵Of
#_1C9127: db $76 ; line 3
#_1C9128: db $02, $28, $2E, $2B, $1A, $20, $1E, $59 ; Courage⎵
#_1C9130: db $A9, $26, $59, $D8, $59, $04, $92, $59 ; [fro]m⎵[the]⎵E[ast]⎵
#_1C9138: db $0F, $1A, $BA, $1C, $1E, $3F ; Pa[la]ce?
#_1C913E: db $7E ; wait for key
#_1C913F: db $73 ; scroll text
#_1C9140: db $08, $1F, $59, $E3, $59, $1B, $2B, $B3 ; If⎵[you]⎵br[ing ]
#_1C9148: db $B6, $59, $AF, $1E, $42, $59, $08, $59 ; [it]⎵[her]e,⎵I⎵
#_1C9150: db $E2, $25, $25, $59, $2D, $1E, $25, $25 ; [wi]ll⎵tell
#_1C9158: db $73 ; scroll text
#_1C9159: db $E3, $59, $26, $C8, $1E, $59, $C6, $59 ; [you]⎵m[or]e⎵[of]⎵
#_1C9161: db $D8, $59, $25, $1E, $20, $A5, $1D, $59 ; [the]⎵leg[en]d⎵
#_1C9169: db $90 ; [and]
#_1C916A: db $73 ; scroll text
#_1C916B: db $AA, $E3, $59, $1A, $59, $BD, $20, $22 ; [give ][you]⎵a⎵[ma]gi
#_1C9173: db $1C, $1A, $25, $59, $1A, $2B, $2D, $22 ; cal⎵arti
#_1C917B: db $1F, $1A, $1C, $2D, $41 ; fact.
#_1C9180: db $79, $2D ; play sfx
#_1C9182: db $7E ; wait for key
#_1C9183: db $73 ; scroll text
#_1C9184: db $0D, $28, $30, $42, $59, $AC, $59, $A8 ; Now,⎵[go]⎵[for]
#_1C918C: db $DF, $2B, $1D, $59, $DA, $59, $D8, $59 ; [wa]rd⎵[to]⎵[the]⎵
#_1C9194: db $29, $1A, $BA, $1C, $1E, $41 ; pa[la]ce.
#_1C919A: db $7F ; end of message

;===================================================================================================
; Other relatives of the wise men
; are hiding from the evil
; wizard's followers.
; You should find them.
;---------------------------------------------------------------------------------------------------
Message_0034:
#_1C919B: db $0E, $D8, $2B, $59, $CE, $BA, $2D, $22 ; O[the]r⎵[re][la]ti
#_1C91A3: db $2F, $1E, $2C, $59, $C6, $59, $D8, $59 ; ves⎵[of]⎵[the]⎵
#_1C91AB: db $E2, $D0, $59, $BE, $27 ; [wi][se]⎵[me]n
#_1C91B0: db $75 ; line 2
#_1C91B1: db $8D, $B0, $9E, $27, $20, $59, $A9, $26 ; [are ][hi][di]ng⎵[fro]m
#_1C91B9: db $59, $D8, $59, $A7, $22, $25 ; ⎵[the]⎵[ev]il
#_1C91BF: db $76 ; line 3
#_1C91C0: db $E2, $33, $1A, $2B, $1D, $8B, $1F, $28 ; [wi]zard['s ]fo
#_1C91C8: db $25, $BB, $E0, $2B, $2C, $41 ; l[lo][we]rs.
#_1C91CE: db $7E ; wait for key
#_1C91CF: db $73 ; scroll text
#_1C91D0: db $E8, $59, $D1, $28, $2E, $25, $1D, $59 ; [You]⎵[sh]ould⎵
#_1C91D8: db $1F, $B4, $1D, $59, $D8, $26, $41 ; f[in]d⎵[the]m.
#_1C91DF: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla.
; I am communicating to you
; across the void through
; telepathy…  The place where
; you now stand was the Golden
; Land, but evil power turned it
; into the Dark World.  The
; wizard has broken the wise
; men's seal and opened a gate
; to link the worlds
; at Hyrule Castle.  In
; order to save this half of the
; world, the Light World, you
; must win back the Golden
; Power.  You must also rescue
; the seven maidens who Agahnim
; sent to the Dark World.  As
; members of the blood-line of
; the seven wise men, they have
; power that will surely help you.
; The maidens are locked in
; hidden dungeons full of evil
; creatures and dangerous traps.
; The Palace of Darkness should
; be your first goal in this world!
; [LINK], I can rely on only
; you.  Please make this old
; man's wishes come true.
; I beg you!
;---------------------------------------------------------------------------------------------------
Message_0035:
#_1C91E0: db $6B, $02 ; set window border
#_1C91E2: db $7A, $03 ; set draw speed
#_1C91E4: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1C91EC: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1C91F4: db $BA, $41 ; [la].
#_1C91F6: db $75 ; line 2
#_1C91F7: db $08, $59, $1A, $26, $59, $9B, $BF, $27 ; I⎵am⎵[com][mu]n
#_1C91FF: db $22, $1C, $94, $B3, $DA, $59, $E3 ; ic[at][ing ][to]⎵[you]
#_1C9206: db $76 ; line 3
#_1C9207: db $1A, $1C, $2B, $28, $2C, $2C, $59, $D8 ; across⎵[the]
#_1C920F: db $59, $2F, $28, $22, $1D, $59, $2D, $21 ; ⎵void⎵th
#_1C9217: db $2B, $28, $2E, $20, $21 ; rough
#_1C921C: db $7E ; wait for key
#_1C921D: db $73 ; scroll text
#_1C921E: db $2D, $1E, $25, $1E, $29, $94, $21, $32 ; telep[at]hy
#_1C9226: db $43, $8A, $E6, $59, $29, $BA, $1C, $1E ; …[  ][The]⎵p[la]ce
#_1C922E: db $59, $E1, $A6, $1E ; ⎵[wh][er]e
#_1C9232: db $73 ; scroll text
#_1C9233: db $E3, $59, $27, $28, $30, $59, $D3, $8C ; [you]⎵now⎵[st][and ]
#_1C923B: db $DF, $2C, $59, $D8, $59, $06, $28, $25 ; [wa]s⎵[the]⎵Gol
#_1C9243: db $1D, $A5 ; d[en]
#_1C9245: db $73 ; scroll text
#_1C9246: db $0B, $90, $42, $59, $1B, $2E, $2D, $59 ; L[and],⎵but⎵
#_1C924E: db $A7, $22, $25, $59, $CB, $A1, $2D, $2E ; [ev]il⎵[pow][er ]tu
#_1C9256: db $2B, $27, $A4, $B6 ; rn[ed ][it]
#_1C925A: db $7E ; wait for key
#_1C925B: db $73 ; scroll text
#_1C925C: db $B4, $DA, $59, $D8, $59, $03, $1A, $2B ; [in][to]⎵[the]⎵Dar
#_1C9264: db $24, $59, $16, $C8, $25, $1D, $41, $8A ; k⎵W[or]ld.[  ]
#_1C926C: db $E6 ; [The]
#_1C926D: db $73 ; scroll text
#_1C926E: db $E2, $33, $1A, $2B, $1D, $59, $AE, $59 ; [wi]zard⎵[has]⎵
#_1C9276: db $1B, $2B, $28, $24, $A0, $D8, $59, $E2 ; brok[en ][the]⎵[wi]
#_1C927E: db $D0 ; [se]
#_1C927F: db $73 ; scroll text
#_1C9280: db $BE, $27, $8B, $D0, $1A, $25, $59, $8C ; [me]n['s ][se]al⎵[and ]
#_1C9288: db $C3, $A4, $1A, $59, $20, $94, $1E ; [open][ed ]a⎵g[at]e
#_1C928F: db $7E ; wait for key
#_1C9290: db $73 ; scroll text
#_1C9291: db $DA, $59, $25, $B4, $24, $59, $D8, $59 ; [to]⎵l[in]k⎵[the]⎵
#_1C9299: db $30, $C8, $25, $1D, $2C ; w[or]lds
#_1C929E: db $73 ; scroll text
#_1C929F: db $91, $07, $32, $2B, $2E, $25, $1E, $59 ; [at ]Hyrule⎵
#_1C92A7: db $02, $92, $25, $1E, $41, $8A, $08, $27 ; C[ast]le.[  ]In
#_1C92AF: db $73 ; scroll text
#_1C92B0: db $C8, $1D, $A1, $DA, $59, $2C, $1A, $2F ; [or]d[er ][to]⎵sav
#_1C92B8: db $1E, $59, $D9, $2C, $59, $B1, $25, $1F ; e⎵[thi]s⎵[ha]lf
#_1C92C0: db $59, $C6, $59, $D8 ; ⎵[of]⎵[the]
#_1C92C4: db $7E ; wait for key
#_1C92C5: db $73 ; scroll text
#_1C92C6: db $30, $C8, $25, $1D, $42, $59, $D8, $59 ; w[or]ld,⎵[the]⎵
#_1C92CE: db $0B, $B2, $16, $C8, $25, $1D, $42, $59 ; L[ight ]W[or]ld,⎵
#_1C92D6: db $E3 ; [you]
#_1C92D7: db $73 ; scroll text
#_1C92D8: db $BF, $D3, $59, $E2, $27, $59, $96, $9C ; [mu][st]⎵[wi]n⎵[ba][ck]
#_1C92E0: db $59, $D8, $59, $06, $28, $25, $1D, $A5 ; ⎵[the]⎵Gold[en]
#_1C92E8: db $73 ; scroll text
#_1C92E9: db $0F, $28, $E0, $2B, $41, $8A, $E8, $59 ; Po[we]r.[  ][You]⎵
#_1C92F1: db $BF, $D3, $59, $1A, $25, $D2, $59, $CE ; [mu][st]⎵al[so]⎵[re]
#_1C92F9: db $2C, $1C, $2E, $1E ; scue
#_1C92FD: db $7E ; wait for key
#_1C92FE: db $73 ; scroll text
#_1C92FF: db $D8, $59, $D0, $2F, $A0, $BD, $22, $1D ; [the]⎵[se]v[en ][ma]id
#_1C9307: db $A5, $2C, $59, $E1, $28, $59, $00, $20 ; [en]s⎵[wh]o⎵Ag
#_1C930F: db $1A, $21, $27, $22, $26 ; ahnim
#_1C9314: db $73 ; scroll text
#_1C9315: db $D0, $27, $2D, $59, $DA, $59, $D8, $59 ; [se]nt⎵[to]⎵[the]⎵
#_1C931D: db $03, $1A, $2B, $24, $59, $16, $C8, $25 ; Dark⎵W[or]l
#_1C9325: db $1D, $41, $8A, $00, $2C ; d.[  ]As
#_1C932A: db $73 ; scroll text
#_1C932B: db $BE, $26, $97, $2B, $2C, $59, $C6, $59 ; [me]m[be]rs⎵[of]⎵
#_1C9333: db $D8, $59, $1B, $BB, $28, $1D, $40, $25 ; [the]⎵b[lo]od-l
#_1C933B: db $B4, $1E, $59, $C6 ; [in]e⎵[of]
#_1C933F: db $7E ; wait for key
#_1C9340: db $73 ; scroll text
#_1C9341: db $D8, $59, $D0, $2F, $A0, $E2, $D0, $59 ; [the]⎵[se]v[en ][wi][se]⎵
#_1C9349: db $BE, $27, $42, $59, $D8, $32, $59, $AD ; [me]n,⎵[the]y⎵[have]
#_1C9351: db $73 ; scroll text
#_1C9352: db $CB, $A1, $D7, $2D, $59, $E2, $25, $25 ; [pow][er ][tha]t⎵[wi]ll
#_1C935A: db $59, $2C, $2E, $CE, $B9, $21, $1E, $25 ; ⎵su[re][ly ]hel
#_1C9362: db $29, $59, $E3, $41 ; p⎵[you].
#_1C9366: db $73 ; scroll text
#_1C9367: db $E6, $59, $BD, $22, $1D, $A5, $2C, $59 ; [The]⎵[ma]id[en]s⎵
#_1C936F: db $8D, $BB, $9C, $A4, $B4 ; [are ][lo][ck][ed ][in]
#_1C9374: db $7E ; wait for key
#_1C9375: db $73 ; scroll text
#_1C9376: db $B0, $1D, $1D, $A0, $1D, $2E, $27, $20 ; [hi]dd[en ]dung
#_1C937E: db $1E, $C7, $2C, $59, $1F, $2E, $25, $25 ; e[on]s⎵full
#_1C9386: db $59, $C6, $59, $A7, $22, $25 ; ⎵[of]⎵[ev]il
#_1C938C: db $73 ; scroll text
#_1C938D: db $1C, $CE, $94, $2E, $CE, $2C, $59, $8C ; c[re][at]u[re]s⎵[and ]
#_1C9395: db $1D, $93, $20, $A6, $28, $2E, $2C, $59 ; d[an]g[er]ous⎵
#_1C939D: db $DB, $1A, $29, $2C, $41 ; [tr]aps.
#_1C93A2: db $73 ; scroll text
#_1C93A3: db $E6, $59, $0F, $1A, $BA, $1C, $1E, $59 ; [The]⎵Pa[la]ce⎵
#_1C93AB: db $C6, $59, $03, $1A, $2B, $24, $27, $1E ; [of]⎵Darkne
#_1C93B3: db $2C, $2C, $59, $D1, $28, $2E, $25, $1D ; ss⎵[sh]ould
#_1C93BB: db $7E ; wait for key
#_1C93BC: db $73 ; scroll text
#_1C93BD: db $97, $59, $E3, $2B, $59, $1F, $22, $2B ; [be]⎵[you]r⎵fir
#_1C93C5: db $D3, $59, $AC, $1A, $25, $59, $B4, $59 ; [st]⎵[go]al⎵[in]⎵
#_1C93CD: db $D9, $2C, $59, $30, $C8, $25, $1D, $3E ; [thi]s⎵w[or]ld!
#_1C93D5: db $79, $2D ; play sfx
#_1C93D7: db $73 ; scroll text
#_1C93D8: db $6A, $42, $59, $08, $59, $99, $CE, $B9 ; [LINK],⎵I⎵[can ][re][ly ]
#_1C93E0: db $C7, $59, $C7, $25, $32 ; [on]⎵[on]ly
#_1C93E5: db $73 ; scroll text
#_1C93E6: db $E3, $41, $8A, $0F, $25, $1E, $1A, $D0 ; [you].[  ]Plea[se]
#_1C93EE: db $59, $BD, $24, $1E, $59, $D9, $2C, $59 ; ⎵[ma]ke⎵[thi]s⎵
#_1C93F6: db $28, $25, $1D ; old
#_1C93F9: db $7E ; wait for key
#_1C93FA: db $73 ; scroll text
#_1C93FB: db $BC, $8B, $E2, $D1, $1E, $2C, $59, $9B ; [man]['s ][wi][sh]es⎵[com]
#_1C9403: db $1E, $59, $DB, $2E, $1E, $41 ; e⎵[tr]ue.
#_1C9409: db $73 ; scroll text
#_1C940A: db $08, $59, $97, $20, $59, $E3, $3E ; I⎵[be]g⎵[you]!
#_1C9411: db $7F ; end of message

;===================================================================================================
; But I sense your helplessness…
; Before you go any further,
; find the Moon Pearl on
; Death Mountain.  It will protect
; you from the Dark World's
; magic so you can keep your
; heroic figure.
;---------------------------------------------------------------------------------------------------
Message_0036:
#_1C9412: db $6B, $02 ; set window border
#_1C9414: db $7A, $03 ; set draw speed
#_1C9416: db $01, $2E, $2D, $59, $08, $59, $D0, $27 ; But⎵I⎵[se]n
#_1C941E: db $D0, $59, $E3, $2B, $59, $21, $1E, $25 ; [se]⎵[you]r⎵hel
#_1C9426: db $CA, $2C, $2C, $27, $1E, $2C, $2C, $43 ; [ple]ssness…
#_1C942E: db $75 ; line 2
#_1C942F: db $01, $1E, $A8, $1E, $59, $E3, $59, $AC ; Be[for]e⎵[you]⎵[go]
#_1C9437: db $59, $93, $32, $59, $1F, $2E, $2B, $D8 ; ⎵[an]y⎵fur[the]
#_1C943F: db $2B, $42 ; r,
#_1C9441: db $76 ; line 3
#_1C9442: db $1F, $B4, $1D, $59, $D8, $59, $0C, $28 ; f[in]d⎵[the]⎵Mo
#_1C944A: db $C7, $59, $0F, $A2, $25, $59, $C7 ; [on]⎵P[ear]l⎵[on]
#_1C9451: db $7E ; wait for key
#_1C9452: db $73 ; scroll text
#_1C9453: db $03, $1E, $94, $21, $59, $0C, $28, $2E ; De[at]h⎵Mou
#_1C945B: db $27, $2D, $8F, $41, $8A, $08, $2D, $59 ; nt[ain].[  ]It⎵
#_1C9463: db $E2, $25, $25, $59, $CC, $2D, $1E, $1C ; [wi]ll⎵[pro]tec
#_1C946B: db $2D ; t
#_1C946C: db $73 ; scroll text
#_1C946D: db $E3, $59, $A9, $26, $59, $D8, $59, $03 ; [you]⎵[fro]m⎵[the]⎵D
#_1C9475: db $1A, $2B, $24, $59, $16, $C8, $25, $1D ; ark⎵W[or]ld
#_1C947D: db $51, $2C ; 's
#_1C947F: db $73 ; scroll text
#_1C9480: db $BD, $20, $22, $1C, $59, $D2, $59, $E3 ; [ma]gic⎵[so]⎵[you]
#_1C9488: db $59, $99, $24, $1E, $1E, $29, $59, $E3 ; ⎵[can ]keep⎵[you]
#_1C9490: db $2B ; r
#_1C9491: db $7E ; wait for key
#_1C9492: db $73 ; scroll text
#_1C9493: db $AF, $28, $22, $1C, $59, $1F, $22, $20 ; [her]oic⎵fig
#_1C949B: db $2E, $CE, $41 ; u[re].
#_1C949E: db $7F ; end of message

;===================================================================================================
; A helpful item is hidden in the
; cave on the east side of Lake
; Hylia.  Get it!
;---------------------------------------------------------------------------------------------------
Message_0037:
#_1C949F: db $00, $59, $21, $1E, $25, $29, $1F, $2E ; A⎵helpfu
#_1C94A7: db $25, $59, $B6, $1E, $26, $59, $B5, $59 ; l⎵[it]em⎵[is]⎵
#_1C94AF: db $B0, $1D, $1D, $A0, $B4, $59, $D8 ; [hi]dd[en ][in]⎵[the]
#_1C94B6: db $75 ; line 2
#_1C94B7: db $1C, $1A, $2F, $1E, $59, $C7, $59, $D8 ; cave⎵[on]⎵[the]
#_1C94BF: db $59, $1E, $92, $59, $2C, $22, $1D, $1E ; ⎵e[ast]⎵side
#_1C94C7: db $59, $C6, $59, $0B, $1A, $24, $1E ; ⎵[of]⎵Lake
#_1C94CE: db $76 ; line 3
#_1C94CF: db $07, $32, $25, $22, $1A, $41, $8A, $06 ; Hylia.[  ]G
#_1C94D7: db $1E, $2D, $59, $B6, $3E ; et⎵[it]!
#_1C94DC: db $7F ; end of message

;===================================================================================================
; Oh!?  You got the Pendant Of
; Courage!  Now I will tell you
; more of the legend…
; Three or four generations ago,
; an order of knights protected
; the royalty of the Hylia.
; These Knights Of Hyrule were
; also guardians of the Pendant
; Of Courage.
; Unfortunately, most of them
; were destroyed in the great
; war against evil that took
; place when the seven wise men
; created their seal.  Among the
; descendants of the Knights Of
; Hyrule a hero must appear.
; …I see.  [LINK], I believe you.
; You should get the remaining
; Pendants.
; And carry this with you.
; This is a treasure passed down
; by the families of the wise
; men.  I want you to have it.
;---------------------------------------------------------------------------------------------------
Message_0038:
#_1C94DD: db $0E, $21, $3E, $3F, $8A, $E8, $59, $AC ; Oh!?[  ][You]⎵[go]
#_1C94E5: db $2D, $59, $D8, $59, $0F, $A5, $1D, $93 ; t⎵[the]⎵P[en]d[an]
#_1C94ED: db $2D, $59, $0E, $1F ; t⎵Of
#_1C94F1: db $75 ; line 2
#_1C94F2: db $02, $28, $2E, $2B, $1A, $20, $1E, $3E ; Courage!
#_1C94FA: db $8A, $0D, $28, $30, $59, $08, $59, $E2 ; [  ]Now⎵I⎵[wi]
#_1C9502: db $25, $25, $59, $2D, $1E, $25, $25, $59 ; ll⎵tell⎵
#_1C950A: db $E3 ; [you]
#_1C950B: db $76 ; line 3
#_1C950C: db $26, $C8, $1E, $59, $C6, $59, $D8, $59 ; m[or]e⎵[of]⎵[the]⎵
#_1C9514: db $25, $1E, $20, $A5, $1D, $43 ; leg[en]d…
#_1C951A: db $7E ; wait for key
#_1C951B: db $73 ; scroll text
#_1C951C: db $13, $21, $CE, $1E, $59, $C8, $59, $1F ; Th[re]e⎵[or]⎵f
#_1C9524: db $28, $2E, $2B, $59, $20, $A5, $A6, $94 ; our⎵g[en][er][at]
#_1C952C: db $22, $C7, $2C, $59, $1A, $AC, $42 ; i[on]s⎵a[go],
#_1C9533: db $73 ; scroll text
#_1C9534: db $93, $59, $C8, $1D, $A1, $C6, $59, $24 ; [an]⎵[or]d[er ][of]⎵k
#_1C953C: db $27, $22, $20, $21, $2D, $2C, $59, $CC ; nights⎵[pro]
#_1C9544: db $2D, $1E, $1C, $2D, $1E, $1D ; tected
#_1C954A: db $73 ; scroll text
#_1C954B: db $D8, $59, $2B, $28, $32, $1A, $25, $2D ; [the]⎵royalt
#_1C9553: db $32, $59, $C6, $59, $D8, $59, $07, $32 ; y⎵[of]⎵[the]⎵Hy
#_1C955B: db $25, $22, $1A, $41 ; lia.
#_1C955F: db $7E ; wait for key
#_1C9560: db $73 ; scroll text
#_1C9561: db $E6, $D0, $59, $0A, $27, $22, $20, $21 ; [The][se]⎵Knigh
#_1C9569: db $2D, $2C, $59, $0E, $1F, $59, $07, $32 ; ts⎵Of⎵Hy
#_1C9571: db $2B, $2E, $25, $1E, $59, $E0, $CE ; rule⎵[we][re]
#_1C9578: db $73 ; scroll text
#_1C9579: db $1A, $25, $D2, $59, $20, $2E, $1A, $2B ; al[so]⎵guar
#_1C9581: db $9E, $93, $2C, $59, $C6, $59, $D8, $59 ; [di][an]s⎵[of]⎵[the]⎵
#_1C9589: db $0F, $A5, $1D, $93, $2D ; P[en]d[an]t
#_1C958E: db $73 ; scroll text
#_1C958F: db $0E, $1F, $59, $02, $28, $2E, $2B, $1A ; Of⎵Coura
#_1C9597: db $20, $1E, $41 ; ge.
#_1C959A: db $7E ; wait for key
#_1C959B: db $73 ; scroll text
#_1C959C: db $14, $27, $A8, $2D, $2E, $27, $94, $1E ; Un[for]tun[at]e
#_1C95A4: db $25, $32, $42, $59, $26, $28, $D3, $59 ; ly,⎵mo[st]⎵
#_1C95AC: db $C6, $59, $D8, $26 ; [of]⎵[the]m
#_1C95B0: db $73 ; scroll text
#_1C95B1: db $E0, $CD, $9D, $DB, $28, $32, $A4, $B4 ; [we][re ][des][tr]oy[ed ][in]
#_1C95B9: db $59, $D8, $59, $20, $CE, $94 ; ⎵[the]⎵g[re][at]
#_1C95BF: db $73 ; scroll text
#_1C95C0: db $DF, $2B, $59, $1A, $20, $8F, $D3, $59 ; [wa]r⎵ag[ain][st]⎵
#_1C95C8: db $A7, $22, $25, $59, $D7, $2D, $59, $DA ; [ev]il⎵[tha]t⎵[to]
#_1C95D0: db $28, $24 ; ok
#_1C95D2: db $7E ; wait for key
#_1C95D3: db $73 ; scroll text
#_1C95D4: db $29, $BA, $1C, $1E, $59, $E1, $A0, $D8 ; p[la]ce⎵[wh][en ][the]
#_1C95DC: db $59, $D0, $2F, $A0, $E2, $D0, $59, $BE ; ⎵[se]v[en ][wi][se]⎵[me]
#_1C95E4: db $27 ; n
#_1C95E5: db $73 ; scroll text
#_1C95E6: db $1C, $CE, $94, $A4, $D8, $22, $2B, $59 ; c[re][at][ed ][the]ir⎵
#_1C95EE: db $D0, $1A, $25, $41, $8A, $00, $26, $C7 ; [se]al.[  ]Am[on]
#_1C95F6: db $20, $59, $D8 ; g⎵[the]
#_1C95F9: db $73 ; scroll text
#_1C95FA: db $9D, $1C, $A5, $1D, $93, $2D, $2C, $59 ; [des]c[en]d[an]ts⎵
#_1C9602: db $C6, $59, $D8, $59, $0A, $27, $22, $20 ; [of]⎵[the]⎵Knig
#_1C960A: db $21, $2D, $2C, $59, $0E, $1F ; hts⎵Of
#_1C9610: db $7E ; wait for key
#_1C9611: db $73 ; scroll text
#_1C9612: db $07, $32, $2B, $2E, $25, $1E, $59, $1A ; Hyrule⎵a
#_1C961A: db $59, $AF, $28, $59, $BF, $D3, $59, $1A ; ⎵[her]o⎵[mu][st]⎵a
#_1C9622: db $29, $29, $A2, $41 ; pp[ear].
#_1C9626: db $73 ; scroll text
#_1C9627: db $43, $08, $59, $D0, $1E, $41, $8A, $6A ; …I⎵[se]e.[  ][LINK]
#_1C962F: db $42, $59, $08, $59, $97, $25, $22, $A7 ; ,⎵I⎵[be]li[ev]
#_1C9637: db $1E, $59, $E3, $41 ; e⎵[you].
#_1C963B: db $73 ; scroll text
#_1C963C: db $E8, $59, $D1, $28, $2E, $25, $1D, $59 ; [You]⎵[sh]ould⎵
#_1C9644: db $AB, $59, $D8, $59, $CE, $BD, $B4, $B4 ; [get]⎵[the]⎵[re][ma][in][in]
#_1C964C: db $20 ; g
#_1C964D: db $7E ; wait for key
#_1C964E: db $73 ; scroll text
#_1C964F: db $0F, $A5, $1D, $93, $2D, $2C, $41 ; P[en]d[an]ts.
#_1C9656: db $73 ; scroll text
#_1C9657: db $00, $27, $1D, $59, $1C, $1A, $2B, $2B ; And⎵carr
#_1C965F: db $32, $59, $D9, $2C, $59, $DE, $59, $E3 ; y⎵[thi]s⎵[with]⎵[you]
#_1C9667: db $41 ; .
#_1C9668: db $73 ; scroll text
#_1C9669: db $E7, $2C, $59, $B5, $59, $1A, $59, $DB ; [Thi]s⎵[is]⎵a⎵[tr]
#_1C9671: db $1E, $1A, $2C, $2E, $CD, $29, $1A, $2C ; easu[re ]pas
#_1C9679: db $D0, $1D, $59, $9F, $30, $27 ; [se]d⎵[do]wn
#_1C967F: db $7E ; wait for key
#_1C9680: db $73 ; scroll text
#_1C9681: db $1B, $32, $59, $D8, $59, $1F, $1A, $26 ; by⎵[the]⎵fam
#_1C9689: db $22, $25, $22, $1E, $2C, $59, $C6, $59 ; ilies⎵[of]⎵
#_1C9691: db $D8, $59, $E2, $D0 ; [the]⎵[wi][se]
#_1C9695: db $73 ; scroll text
#_1C9696: db $BE, $27, $41, $8A, $08, $59, $DF, $27 ; [me]n.[  ]I⎵[wa]n
#_1C969E: db $2D, $59, $E3, $59, $DA, $59, $AD, $59 ; t⎵[you]⎵[to]⎵[have]⎵
#_1C96A6: db $B6, $41 ; [it].
#_1C96A8: db $7F ; end of message

;===================================================================================================
; You are correct, young man!
; I am Sahasrahla, the village
; elder and a descendent of the
; seven wise men.
; … … … What?
; [LINK], I'm surprised a young
; man like you is looking for the
; sword of evil's bane.  Not just
; anyone can use that sword.
; According to the tales handed
; down by the Hylia, only the
; Hero who has destroyed three
; great evils and won the three
; Pendants can wield the sword…
; … … …
; I see you have acquired the
; Pendant of Courage.  I will tell
; you about the legend behind it.
; Three or four generations ago,
; an order of knights protected
; the royalty of the Hylia.
; These Knights Of Hyrule were
; also guardians of the Pendant
; Of Courage.
; Unfortunately, most of them
; were destroyed in the great
; war against evil that took
; place when the seven wise men
; created their seal.  Among the
; descendants of the Knights Of
; Hyrule a hero must appear.
; …I see.  [LINK], I believe you.
; You should get the remaining
; Pendants.
; And carry this with you.
; This is a treasure passed down
; by the families of the wise
; men.  I want you to have it.
;---------------------------------------------------------------------------------------------------
Message_0039:
#_1C96A9: db $E8, $59, $8D, $1C, $C8, $CE, $1C, $2D ; [You]⎵[are ]c[or][re]ct
#_1C96B1: db $42, $59, $E3, $27, $20, $59, $BC, $3E ; ,⎵[you]ng⎵[man]!
#_1C96B9: db $75 ; line 2
#_1C96BA: db $08, $59, $1A, $26, $59, $12, $1A, $AE ; I⎵am⎵Sa[has]
#_1C96C2: db $2B, $1A, $21, $BA, $42, $59, $D8, $59 ; rah[la],⎵[the]⎵
#_1C96CA: db $2F, $22, $25, $BA, $20, $1E ; vil[la]ge
#_1C96D0: db $76 ; line 3
#_1C96D1: db $1E, $25, $1D, $A1, $8C, $1A, $59, $9D ; eld[er ][and ]a⎵[des]
#_1C96D9: db $1C, $A5, $1D, $A3, $59, $C6, $59, $D8 ; c[en]d[ent]⎵[of]⎵[the]
#_1C96E1: db $7E ; wait for key
#_1C96E2: db $73 ; scroll text
#_1C96E3: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1C96EB: db $41 ; .
#_1C96EC: db $73 ; scroll text
#_1C96ED: db $43, $59, $43, $59, $43, $59, $16, $B1 ; …⎵…⎵…⎵W[ha]
#_1C96F5: db $2D, $3F ; t?
#_1C96F7: db $73 ; scroll text
#_1C96F8: db $6A, $42, $59, $08, $51, $26, $59, $2C ; [LINK],⎵I'm⎵s
#_1C9700: db $2E, $2B, $29, $2B, $B5, $A4, $1A, $59 ; urpr[is][ed ]a⎵
#_1C9708: db $E3, $27, $20 ; [you]ng
#_1C970B: db $7E ; wait for key
#_1C970C: db $73 ; scroll text
#_1C970D: db $BC, $59, $25, $22, $24, $1E, $59, $E3 ; [man]⎵like⎵[you]
#_1C9715: db $59, $B5, $59, $BB, $28, $24, $B3, $A8 ; ⎵[is]⎵[lo]ok[ing ][for]
#_1C971D: db $59, $D8 ; ⎵[the]
#_1C971F: db $73 ; scroll text
#_1C9720: db $2C, $30, $C8, $1D, $59, $C6, $59, $A7 ; sw[or]d⎵[of]⎵[ev]
#_1C9728: db $22, $25, $8B, $96, $27, $1E, $41, $8A ; il['s ][ba]ne.[  ]
#_1C9730: db $0D, $28, $2D, $59, $B7 ; Not⎵[just]
#_1C9735: db $73 ; scroll text
#_1C9736: db $93, $32, $C7, $1E, $59, $99, $2E, $D0 ; [an]y[on]e⎵[can ]u[se]
#_1C973E: db $59, $D7, $2D, $59, $2C, $30, $C8, $1D ; ⎵[tha]t⎵sw[or]d
#_1C9746: db $41 ; .
#_1C9747: db $7E ; wait for key
#_1C9748: db $73 ; scroll text
#_1C9749: db $00, $1C, $1C, $C8, $9E, $27, $20, $59 ; Acc[or][di]ng⎵
#_1C9751: db $DA, $59, $D8, $59, $2D, $1A, $25, $1E ; [to]⎵[the]⎵tale
#_1C9759: db $2C, $59, $B1, $27, $1D, $1E, $1D ; s⎵[ha]nded
#_1C9760: db $73 ; scroll text
#_1C9761: db $9F, $30, $27, $59, $1B, $32, $59, $D8 ; [do]wn⎵by⎵[the]
#_1C9769: db $59, $07, $32, $25, $22, $1A, $42, $59 ; ⎵Hylia,⎵
#_1C9771: db $C7, $B9, $D8 ; [on][ly ][the]
#_1C9774: db $73 ; scroll text
#_1C9775: db $E4, $28, $59, $E1, $28, $59, $AE, $59 ; [Her]o⎵[wh]o⎵[has]⎵
#_1C977D: db $9D, $DB, $28, $32, $A4, $2D, $21, $CE ; [des][tr]oy[ed ]th[re]
#_1C9785: db $1E ; e
#_1C9786: db $7E ; wait for key
#_1C9787: db $73 ; scroll text
#_1C9788: db $20, $CE, $91, $A7, $22, $25, $2C, $59 ; g[re][at ][ev]ils⎵
#_1C9790: db $8C, $30, $C7, $59, $D8, $59, $2D, $21 ; [and ]w[on]⎵[the]⎵th
#_1C9798: db $CE, $1E ; [re]e
#_1C979A: db $73 ; scroll text
#_1C979B: db $0F, $A5, $1D, $93, $2D, $2C, $59, $99 ; P[en]d[an]ts⎵[can ]
#_1C97A3: db $E2, $1E, $25, $1D, $59, $D8, $59, $2C ; [wi]eld⎵[the]⎵s
#_1C97AB: db $30, $C8, $1D, $43 ; w[or]d…
#_1C97AF: db $73 ; scroll text
#_1C97B0: db $43, $59, $43, $59, $43 ; …⎵…⎵…
#_1C97B5: db $7E ; wait for key
#_1C97B6: db $73 ; scroll text
#_1C97B7: db $08, $59, $D0, $1E, $59, $E3, $59, $AD ; I⎵[se]e⎵[you]⎵[have]
#_1C97BF: db $59, $1A, $1C, $2A, $2E, $22, $CE, $1D ; ⎵acqui[re]d
#_1C97C7: db $59, $D8 ; ⎵[the]
#_1C97C9: db $73 ; scroll text
#_1C97CA: db $0F, $A5, $1D, $93, $2D, $59, $C6, $59 ; P[en]d[an]t⎵[of]⎵
#_1C97D2: db $02, $28, $2E, $2B, $1A, $20, $1E, $41 ; Courage.
#_1C97DA: db $8A, $08, $59, $E2, $25, $25, $59, $2D ; [  ]I⎵[wi]ll⎵t
#_1C97E2: db $1E, $25, $25 ; ell
#_1C97E5: db $73 ; scroll text
#_1C97E6: db $E3, $59, $1A, $98, $2E, $2D, $59, $D8 ; [you]⎵a[bo]ut⎵[the]
#_1C97EE: db $59, $25, $1E, $20, $A5, $1D, $59, $97 ; ⎵leg[en]d⎵[be]
#_1C97F6: db $B0, $27, $1D, $59, $B6, $41 ; [hi]nd⎵[it].
#_1C97FC: db $7E ; wait for key
#_1C97FD: db $73 ; scroll text
#_1C97FE: db $13, $21, $CE, $1E, $59, $C8, $59, $1F ; Th[re]e⎵[or]⎵f
#_1C9806: db $28, $2E, $2B, $59, $20, $A5, $A6, $94 ; our⎵g[en][er][at]
#_1C980E: db $22, $C7, $2C, $59, $1A, $AC, $42 ; i[on]s⎵a[go],
#_1C9815: db $73 ; scroll text
#_1C9816: db $93, $59, $C8, $1D, $A1, $C6, $59, $24 ; [an]⎵[or]d[er ][of]⎵k
#_1C981E: db $27, $22, $20, $21, $2D, $2C, $59, $CC ; nights⎵[pro]
#_1C9826: db $2D, $1E, $1C, $2D, $1E, $1D ; tected
#_1C982C: db $73 ; scroll text
#_1C982D: db $D8, $59, $2B, $28, $32, $1A, $25, $2D ; [the]⎵royalt
#_1C9835: db $32, $59, $C6, $59, $D8, $59, $07, $32 ; y⎵[of]⎵[the]⎵Hy
#_1C983D: db $25, $22, $1A, $41 ; lia.
#_1C9841: db $7E ; wait for key
#_1C9842: db $73 ; scroll text
#_1C9843: db $E6, $D0, $59, $0A, $27, $22, $20, $21 ; [The][se]⎵Knigh
#_1C984B: db $2D, $2C, $59, $0E, $1F, $59, $07, $32 ; ts⎵Of⎵Hy
#_1C9853: db $2B, $2E, $25, $1E, $59, $E0, $CE ; rule⎵[we][re]
#_1C985A: db $73 ; scroll text
#_1C985B: db $1A, $25, $D2, $59, $20, $2E, $1A, $2B ; al[so]⎵guar
#_1C9863: db $9E, $93, $2C, $59, $C6, $59, $D8, $59 ; [di][an]s⎵[of]⎵[the]⎵
#_1C986B: db $0F, $A5, $1D, $93, $2D ; P[en]d[an]t
#_1C9870: db $73 ; scroll text
#_1C9871: db $0E, $1F, $59, $02, $28, $2E, $2B, $1A ; Of⎵Coura
#_1C9879: db $20, $1E, $41 ; ge.
#_1C987C: db $7E ; wait for key
#_1C987D: db $73 ; scroll text
#_1C987E: db $14, $27, $A8, $2D, $2E, $27, $94, $1E ; Un[for]tun[at]e
#_1C9886: db $25, $32, $42, $59, $26, $28, $D3, $59 ; ly,⎵mo[st]⎵
#_1C988E: db $C6, $59, $D8, $26 ; [of]⎵[the]m
#_1C9892: db $73 ; scroll text
#_1C9893: db $E0, $CD, $9D, $DB, $28, $32, $A4, $B4 ; [we][re ][des][tr]oy[ed ][in]
#_1C989B: db $59, $D8, $59, $20, $CE, $94 ; ⎵[the]⎵g[re][at]
#_1C98A1: db $73 ; scroll text
#_1C98A2: db $DF, $2B, $59, $1A, $20, $8F, $D3, $59 ; [wa]r⎵ag[ain][st]⎵
#_1C98AA: db $A7, $22, $25, $59, $D7, $2D, $59, $DA ; [ev]il⎵[tha]t⎵[to]
#_1C98B2: db $28, $24 ; ok
#_1C98B4: db $7E ; wait for key
#_1C98B5: db $73 ; scroll text
#_1C98B6: db $29, $BA, $1C, $1E, $59, $E1, $A0, $D8 ; p[la]ce⎵[wh][en ][the]
#_1C98BE: db $59, $D0, $2F, $A0, $E2, $D0, $59, $BE ; ⎵[se]v[en ][wi][se]⎵[me]
#_1C98C6: db $27 ; n
#_1C98C7: db $73 ; scroll text
#_1C98C8: db $1C, $CE, $94, $A4, $D8, $22, $2B, $59 ; c[re][at][ed ][the]ir⎵
#_1C98D0: db $D0, $1A, $25, $41, $8A, $00, $26, $C7 ; [se]al.[  ]Am[on]
#_1C98D8: db $20, $59, $D8 ; g⎵[the]
#_1C98DB: db $73 ; scroll text
#_1C98DC: db $9D, $1C, $A5, $1D, $93, $2D, $2C, $59 ; [des]c[en]d[an]ts⎵
#_1C98E4: db $C6, $59, $D8, $59, $0A, $27, $22, $20 ; [of]⎵[the]⎵Knig
#_1C98EC: db $21, $2D, $2C, $59, $0E, $1F ; hts⎵Of
#_1C98F2: db $7E ; wait for key
#_1C98F3: db $73 ; scroll text
#_1C98F4: db $07, $32, $2B, $2E, $25, $1E, $59, $1A ; Hyrule⎵a
#_1C98FC: db $59, $AF, $28, $59, $BF, $D3, $59, $1A ; ⎵[her]o⎵[mu][st]⎵a
#_1C9904: db $29, $29, $A2, $41 ; pp[ear].
#_1C9908: db $73 ; scroll text
#_1C9909: db $43, $08, $59, $D0, $1E, $41, $8A, $6A ; …I⎵[se]e.[  ][LINK]
#_1C9911: db $42, $59, $08, $59, $97, $25, $22, $A7 ; ,⎵I⎵[be]li[ev]
#_1C9919: db $1E, $59, $E3, $41 ; e⎵[you].
#_1C991D: db $73 ; scroll text
#_1C991E: db $E8, $59, $D1, $28, $2E, $25, $1D, $59 ; [You]⎵[sh]ould⎵
#_1C9926: db $AB, $59, $D8, $59, $CE, $BD, $B4, $B4 ; [get]⎵[the]⎵[re][ma][in][in]
#_1C992E: db $20 ; g
#_1C992F: db $7E ; wait for key
#_1C9930: db $73 ; scroll text
#_1C9931: db $0F, $A5, $1D, $93, $2D, $2C, $41 ; P[en]d[an]ts.
#_1C9938: db $73 ; scroll text
#_1C9939: db $00, $27, $1D, $59, $1C, $1A, $2B, $2B ; And⎵carr
#_1C9941: db $32, $59, $D9, $2C, $59, $DE, $59, $E3 ; y⎵[thi]s⎵[with]⎵[you]
#_1C9949: db $41 ; .
#_1C994A: db $73 ; scroll text
#_1C994B: db $E7, $2C, $59, $B5, $59, $1A, $59, $DB ; [Thi]s⎵[is]⎵a⎵[tr]
#_1C9953: db $1E, $1A, $2C, $2E, $CD, $29, $1A, $2C ; easu[re ]pas
#_1C995B: db $D0, $1D, $59, $9F, $30, $27 ; [se]d⎵[do]wn
#_1C9961: db $7E ; wait for key
#_1C9962: db $73 ; scroll text
#_1C9963: db $1B, $32, $59, $D8, $59, $1F, $1A, $26 ; by⎵[the]⎵fam
#_1C996B: db $22, $25, $22, $1E, $2C, $59, $C6, $59 ; ilies⎵[of]⎵
#_1C9973: db $D8, $59, $E2, $D0 ; [the]⎵[wi][se]
#_1C9977: db $73 ; scroll text
#_1C9978: db $BE, $27, $41, $8A, $08, $59, $DF, $27 ; [me]n.[  ]I⎵[wa]n
#_1C9980: db $2D, $59, $E3, $59, $DA, $59, $AD, $59 ; t⎵[you]⎵[to]⎵[have]⎵
#_1C9988: db $B6, $41 ; [it].
#_1C998A: db $7F ; end of message

;===================================================================================================
; I will give 100 Rupees to the
; man who finds the descendants
; of the wise men.   THE KING
;---------------------------------------------------------------------------------------------------
Message_003A:
#_1C998B: db $08, $59, $E2, $25, $25, $59, $AA, $35 ; I⎵[wi]ll⎵[give ]1
#_1C9993: db $34, $34, $59, $11, $DC, $1E, $1E, $2C ; 00⎵R[up]ees
#_1C999B: db $59, $DA, $59, $D8 ; ⎵[to]⎵[the]
#_1C999F: db $75 ; line 2
#_1C99A0: db $BC, $59, $E1, $28, $59, $1F, $B4, $1D ; [man]⎵[wh]o⎵f[in]d
#_1C99A8: db $2C, $59, $D8, $59, $9D, $1C, $A5, $1D ; s⎵[the]⎵[des]c[en]d
#_1C99B0: db $93, $2D, $2C ; [an]ts
#_1C99B3: db $76 ; line 3
#_1C99B4: db $C6, $59, $D8, $59, $E2, $D0, $59, $BE ; [of]⎵[the]⎵[wi][se]⎵[me]
#_1C99BC: db $27, $41, $89, $13, $07, $04, $59, $0A ; n.[   ]THE⎵K
#_1C99C4: db $08, $0D, $06 ; ING
#_1C99C7: db $7F ; end of message

;===================================================================================================
;   😬  WANTED!  This is the
; criminal who kidnapped Zelda.
; Call a soldier if you see him!
;---------------------------------------------------------------------------------------------------
Message_003B:
#_1C99C8: db $8A, $4A, $4B, $8A, $16, $00, $0D, $13 ; [  ]😬[  ]WANT
#_1C99D0: db $04, $03, $3E, $8A, $E7, $2C, $59, $B5 ; ED![  ][Thi]s⎵[is]
#_1C99D8: db $59, $D8 ; ⎵[the]
#_1C99DA: db $75 ; line 2
#_1C99DB: db $1C, $2B, $22, $26, $B4, $1A, $25, $59 ; crim[in]al⎵
#_1C99E3: db $E1, $28, $59, $24, $22, $1D, $27, $1A ; [wh]o⎵kidna
#_1C99EB: db $29, $29, $A4, $19, $1E, $25, $1D, $1A ; pp[ed ]Zelda
#_1C99F3: db $41 ; .
#_1C99F4: db $76 ; line 3
#_1C99F5: db $02, $8E, $1A, $59, $D2, $25, $9E, $A1 ; C[all ]a⎵[so]l[di][er ]
#_1C99FD: db $22, $1F, $59, $E3, $59, $D0, $1E, $59 ; if⎵[you]⎵[se]e⎵
#_1C9A05: db $B0, $26, $3E ; [hi]m!
#_1C9A08: db $7F ; end of message

;===================================================================================================
;      DANGER!
; Do not enter Death Mountain
; without the King's permission!
;---------------------------------------------------------------------------------------------------
Message_003C:
#_1C9A09: db $88, $59, $03, $00, $0D, $06, $04, $11 ; [    ]⎵DANGER
#_1C9A11: db $3E ; !
#_1C9A12: db $75 ; line 2
#_1C9A13: db $03, $28, $59, $C2, $59, $A3, $A1, $03 ; Do⎵[not]⎵[ent][er ]D
#_1C9A1B: db $1E, $94, $21, $59, $0C, $28, $2E, $27 ; e[at]h⎵Moun
#_1C9A23: db $2D, $8F ; t[ain]
#_1C9A25: db $76 ; line 3
#_1C9A26: db $DE, $C5, $D8, $59, $0A, $B4, $20, $8B ; [with][out ][the]⎵K[in]g['s ]
#_1C9A2E: db $C9, $26, $B5, $2C, $22, $C7, $3E ; [per]m[is]si[on]!
#_1C9A35: db $7F ; end of message

;===================================================================================================
; This way to the
;      Lost Woods
;---------------------------------------------------------------------------------------------------
Message_003D:
#_1C9A36: db $E7, $2C, $59, $DF, $32, $59, $DA, $59 ; [Thi]s⎵[wa]y⎵[to]⎵
#_1C9A3E: db $D8 ; [the]
#_1C9A3F: db $75 ; line 2
#_1C9A40: db $88, $59, $0B, $28, $D3, $59, $16, $28 ; [    ]⎵Lo[st]⎵Wo
#_1C9A48: db $28, $1D, $2C ; ods
#_1C9A4B: db $7F ; end of message

;===================================================================================================
;            DANGER!
; Beware of deep water and Zora!
;---------------------------------------------------------------------------------------------------
Message_003E:
#_1C9A4C: db $88, $88, $89, $03, $00, $0D, $06, $04 ; [    ][    ][   ]DANGE
#_1C9A54: db $11, $3E ; R!
#_1C9A56: db $75 ; line 2
#_1C9A57: db $01, $1E, $DF, $CD, $C6, $59, $1D, $1E ; Be[wa][re ][of]⎵de
#_1C9A5F: db $1E, $29, $59, $DF, $D4, $8C, $19, $C8 ; ep⎵[wa][ter ][and ]Z[or]
#_1C9A67: db $1A, $3E ; a!
#_1C9A69: db $7F ; end of message

;===================================================================================================
; Welcome to the Magic Shop.
; The Waterfall Of Wishing is
; just ahead.  
;---------------------------------------------------------------------------------------------------
Message_003F:
#_1C9A6A: db $16, $1E, $25, $9B, $1E, $59, $DA, $59 ; Wel[com]e⎵[to]⎵
#_1C9A72: db $D8, $59, $0C, $1A, $20, $22, $1C, $59 ; [the]⎵Magic⎵
#_1C9A7A: db $12, $21, $28, $29, $41 ; Shop.
#_1C9A7F: db $75 ; line 2
#_1C9A80: db $E6, $59, $16, $94, $A6, $1F, $8E, $0E ; [The]⎵W[at][er]f[all ]O
#_1C9A88: db $1F, $59, $16, $B5, $B0, $27, $20, $59 ; f⎵W[is][hi]ng⎵
#_1C9A90: db $B5 ; [is]
#_1C9A91: db $76 ; line 3
#_1C9A92: db $B7, $59, $1A, $21, $1E, $1A, $1D, $41 ; [just]⎵ahead.
#_1C9A9A: db $8A ; [  ]
#_1C9A9B: db $7F ; end of message

;===================================================================================================
; This cave leads to the path
; back to Kakariko Village.
;---------------------------------------------------------------------------------------------------
Message_0040:
#_1C9A9C: db $E7, $2C, $59, $1C, $1A, $2F, $1E, $59 ; [Thi]s⎵cave⎵
#_1C9AA4: db $25, $1E, $1A, $1D, $2C, $59, $DA, $59 ; leads⎵[to]⎵
#_1C9AAC: db $D8, $59, $29, $94, $21 ; [the]⎵p[at]h
#_1C9AB1: db $75 ; line 2
#_1C9AB2: db $96, $9C, $59, $DA, $59, $0A, $1A, $24 ; [ba][ck]⎵[to]⎵Kak
#_1C9ABA: db $1A, $2B, $22, $24, $28, $59, $15, $22 ; ariko⎵Vi
#_1C9AC2: db $25, $BA, $20, $1E, $41 ; l[la]ge.
#_1C9AC7: db $7F ; end of message

;===================================================================================================
; This way ↓
;          Lake Hylia
;          Shop
;---------------------------------------------------------------------------------------------------
Message_0041:
#_1C9AC8: db $E7, $2C, $59, $DF, $32, $59, $4E ; [Thi]s⎵[wa]y⎵↓
#_1C9ACF: db $75 ; line 2
#_1C9AD0: db $88, $88, $59, $0B, $1A, $24, $1E, $59 ; [    ][    ]⎵Lake⎵
#_1C9AD8: db $07, $32, $25, $22, $1A ; Hylia
#_1C9ADD: db $76 ; line 3
#_1C9ADE: db $88, $88, $59, $12, $21, $28, $29 ; [    ][    ]⎵Shop
#_1C9AE5: db $7F ; end of message

;===================================================================================================
; This way ←
;          Kakariko Village
;---------------------------------------------------------------------------------------------------
Message_0042:
#_1C9AE6: db $E7, $2C, $59, $DF, $32, $59, $4F ; [Thi]s⎵[wa]y⎵←
#_1C9AED: db $75 ; line 2
#_1C9AEE: db $88, $88, $59, $0A, $1A, $24, $1A, $2B ; [    ][    ]⎵Kakar
#_1C9AF6: db $22, $24, $28, $59, $15, $22, $25, $BA ; iko⎵Vil[la]
#_1C9AFE: db $20, $1E ; ge
#_1C9B00: db $7F ; end of message

;===================================================================================================
; This way ←
;          Desert Of Mystery
;---------------------------------------------------------------------------------------------------
Message_0043:
#_1C9B01: db $E7, $2C, $59, $DF, $32, $59, $4F ; [Thi]s⎵[wa]y⎵←
#_1C9B08: db $75 ; line 2
#_1C9B09: db $88, $88, $59, $03, $1E, $D0, $2B, $2D ; [    ][    ]⎵De[se]rt
#_1C9B11: db $59, $0E, $1F, $59, $0C, $32, $D3, $A6 ; ⎵Of⎵My[st][er]
#_1C9B19: db $32 ; y
#_1C9B1A: db $7F ; end of message

;===================================================================================================
; This way ↑ →
;          Magic Shop
;          Waterfall Of Wishing
;---------------------------------------------------------------------------------------------------
Message_0044:
#_1C9B1B: db $E7, $2C, $59, $DF, $32, $59, $4D, $59 ; [Thi]s⎵[wa]y⎵↑⎵
#_1C9B23: db $50 ; →
#_1C9B24: db $75 ; line 2
#_1C9B25: db $88, $88, $59, $0C, $1A, $20, $22, $1C ; [    ][    ]⎵Magic
#_1C9B2D: db $59, $12, $21, $28, $29 ; ⎵Shop
#_1C9B32: db $76 ; line 3
#_1C9B33: db $88, $88, $59, $16, $94, $A6, $1F, $8E ; [    ][    ]⎵W[at][er]f[all ]
#_1C9B3B: db $0E, $1F, $59, $16, $B5, $B0, $27, $20 ; Of⎵W[is][hi]ng
#_1C9B43: db $7F ; end of message

;===================================================================================================
; This way → Eastern Palace
; This way ← Hyrule Castle
;---------------------------------------------------------------------------------------------------
Message_0045:
#_1C9B44: db $E7, $2C, $59, $DF, $32, $59, $50, $59 ; [Thi]s⎵[wa]y⎵→⎵
#_1C9B4C: db $04, $92, $A6, $27, $59, $0F, $1A, $BA ; E[ast][er]n⎵Pa[la]
#_1C9B54: db $1C, $1E ; ce
#_1C9B56: db $76 ; line 3
#_1C9B57: db $E7, $2C, $59, $DF, $32, $59, $4F, $59 ; [Thi]s⎵[wa]y⎵←⎵
#_1C9B5F: db $07, $32, $2B, $2E, $25, $1E, $59, $02 ; Hyrule⎵C
#_1C9B67: db $92, $25, $1E ; [ast]le
#_1C9B6A: db $7F ; end of message

;===================================================================================================
;         Lake Hylia
;---------------------------------------------------------------------------------------------------
Message_0046:
#_1C9B6B: db $75 ; line 2
#_1C9B6C: db $88, $88, $0B, $1A, $24, $1E, $59, $07 ; [    ][    ]Lake⎵H
#_1C9B74: db $32, $25, $22, $1A ; ylia
#_1C9B78: db $7F ; end of message

;===================================================================================================
; Pay no attention to the
; average middle-aged man
; standing by this sign.
; Leave him alone!
;---------------------------------------------------------------------------------------------------
Message_0047:
#_1C9B79: db $0F, $1A, $32, $59, $27, $28, $59, $94 ; Pay⎵no⎵[at]
#_1C9B81: db $2D, $A3, $22, $C7, $59, $DA, $59, $D8 ; t[ent]i[on]⎵[to]⎵[the]
#_1C9B89: db $75 ; line 2
#_1C9B8A: db $1A, $DD, $1A, $20, $1E, $59, $26, $22 ; a[ver]age⎵mi
#_1C9B92: db $1D, $1D, $25, $1E, $40, $1A, $20, $A4 ; ddle-ag[ed ]
#_1C9B9A: db $BC ; [man]
#_1C9B9B: db $76 ; line 3
#_1C9B9C: db $D3, $90, $B3, $1B, $32, $59, $D9, $2C ; [st][and][ing ]by⎵[thi]s
#_1C9BA4: db $59, $2C, $22, $20, $27, $41 ; ⎵sign.
#_1C9BAA: db $7E ; wait for key
#_1C9BAB: db $73 ; scroll text
#_1C9BAC: db $0B, $1E, $1A, $2F, $1E, $59, $B0, $26 ; Leave⎵[hi]m
#_1C9BB4: db $59, $1A, $BB, $27, $1E, $3E ; ⎵a[lo]ne!
#_1C9BBA: db $7F ; end of message

;===================================================================================================
; The House Of Lumberjacks
; A. Bumpkin and B. Bumpkin
;---------------------------------------------------------------------------------------------------
Message_0048:
#_1C9BBB: db $75 ; line 2
#_1C9BBC: db $E6, $59, $07, $28, $2E, $D0, $59, $0E ; [The]⎵Hou[se]⎵O
#_1C9BC4: db $1F, $59, $0B, $2E, $26, $97, $2B, $23 ; f⎵Lum[be]rj
#_1C9BCC: db $1A, $9C, $2C ; a[ck]s
#_1C9BCF: db $76 ; line 3
#_1C9BD0: db $00, $41, $59, $01, $2E, $26, $29, $24 ; A.⎵Bumpk
#_1C9BD8: db $B4, $59, $8C, $01, $41, $59, $01, $2E ; [in]⎵[and ]B.⎵Bu
#_1C9BE0: db $26, $29, $24, $B4 ; mpk[in]
#_1C9BE4: db $7F ; end of message

;===================================================================================================
; This way ↓
;        Kakariko Village
;---------------------------------------------------------------------------------------------------
Message_0049:
#_1C9BE5: db $E7, $2C, $59, $DF, $32, $59, $4E ; [Thi]s⎵[wa]y⎵↓
#_1C9BEC: db $75 ; line 2
#_1C9BED: db $88, $89, $0A, $1A, $24, $1A, $2B, $22 ; [    ][   ]Kakari
#_1C9BF5: db $24, $28, $59, $15, $22, $25, $BA, $20 ; ko⎵Vil[la]g
#_1C9BFD: db $1E ; e
#_1C9BFE: db $7F ; end of message

;===================================================================================================
; Double, double toil and trouble,
; fire burn and cauldron bubble…
; Making mushroom brew, I am…
;---------------------------------------------------------------------------------------------------
Message_004A:
#_1C9BFF: db $03, $28, $2E, $95, $42, $59, $9F, $2E ; Dou[ble],⎵[do]u
#_1C9C07: db $95, $59, $DA, $22, $25, $59, $8C, $DB ; [ble]⎵[to]il⎵[and ][tr]
#_1C9C0F: db $28, $2E, $95, $42 ; ou[ble],
#_1C9C13: db $75 ; line 2
#_1C9C14: db $1F, $22, $CD, $1B, $2E, $2B, $27, $59 ; fi[re ]burn⎵
#_1C9C1C: db $8C, $1C, $1A, $2E, $25, $1D, $2B, $C7 ; [and ]cauldr[on]
#_1C9C24: db $59, $1B, $2E, $1B, $95, $43 ; ⎵bub[ble]…
#_1C9C2A: db $76 ; line 3
#_1C9C2B: db $0C, $1A, $24, $B3, $BF, $D1, $2B, $28 ; Mak[ing ][mu][sh]ro
#_1C9C33: db $28, $26, $59, $1B, $CE, $30, $42, $59 ; om⎵b[re]w,⎵
#_1C9C3B: db $08, $59, $1A, $26, $43 ; I⎵am…
#_1C9C40: db $7F ; end of message

;===================================================================================================
; Heh heh…  Thank you, young
; man…  Come back to the shop
; later for something good…
; Heh heh…
;---------------------------------------------------------------------------------------------------
Message_004B:
#_1C9C41: db $07, $1E, $21, $59, $21, $1E, $21, $43 ; Heh⎵heh…
#_1C9C49: db $8A, $E5, $27, $24, $59, $E3, $42, $59 ; [  ][Tha]nk⎵[you],⎵
#_1C9C51: db $E3, $27, $20 ; [you]ng
#_1C9C54: db $75 ; line 2
#_1C9C55: db $BC, $43, $8A, $02, $28, $BE, $59, $96 ; [man]…[  ]Co[me]⎵[ba]
#_1C9C5D: db $9C, $59, $DA, $59, $D8, $59, $D1, $28 ; [ck]⎵[to]⎵[the]⎵[sh]o
#_1C9C65: db $29 ; p
#_1C9C66: db $76 ; line 3
#_1C9C67: db $BA, $D4, $A8, $59, $CF, $D5, $20, $59 ; [la][ter ][for]⎵[some][thin]g⎵
#_1C9C6F: db $AC, $28, $1D, $43 ; [go]od…
#_1C9C73: db $7E ; wait for key
#_1C9C74: db $73 ; scroll text
#_1C9C75: db $07, $1E, $21, $59, $21, $1E, $21, $43 ; Heh⎵heh…
#_1C9C7D: db $7F ; end of message

;===================================================================================================
; Mmmmm…  The smell of rotten
; fruit…  If you give me that
; Mushroom, I can finish my brew.
; Heh heh…
;---------------------------------------------------------------------------------------------------
Message_004C:
#_1C9C7E: db $0C, $26, $26, $26, $26, $43, $8A, $E6 ; Mmmmm…[  ][The]
#_1C9C86: db $59, $2C, $BE, $25, $25, $59, $C6, $59 ; ⎵s[me]ll⎵[of]⎵
#_1C9C8E: db $2B, $28, $2D, $2D, $A5 ; rott[en]
#_1C9C93: db $75 ; line 2
#_1C9C94: db $1F, $2B, $2E, $B6, $43, $8A, $08, $1F ; fru[it]…[  ]If
#_1C9C9C: db $59, $E3, $59, $AA, $BE, $59, $D7, $2D ; ⎵[you]⎵[give ][me]⎵[tha]t
#_1C9CA4: db $76 ; line 3
#_1C9CA5: db $0C, $2E, $D1, $2B, $28, $28, $26, $42 ; Mu[sh]room,
#_1C9CAD: db $59, $08, $59, $99, $1F, $B4, $B5, $21 ; ⎵I⎵[can ]f[in][is]h
#_1C9CB5: db $59, $26, $32, $59, $1B, $CE, $30, $41 ; ⎵my⎵b[re]w.
#_1C9CBD: db $7E ; wait for key
#_1C9CBE: db $73 ; scroll text
#_1C9CBF: db $07, $1E, $21, $59, $21, $1E, $21, $43 ; Heh⎵heh…
#_1C9CC7: db $7F ; end of message

;===================================================================================================
; If you want to buy the potion,
; you should bring a bottle to
; put it in…  He he he!
;---------------------------------------------------------------------------------------------------
Message_004D:
#_1C9CC8: db $08, $1F, $59, $E3, $59, $DF, $27, $2D ; If⎵[you]⎵[wa]nt
#_1C9CD0: db $59, $DA, $59, $1B, $2E, $32, $59, $D8 ; ⎵[to]⎵buy⎵[the]
#_1C9CD8: db $59, $29, $28, $2D, $22, $C7, $42 ; ⎵poti[on],
#_1C9CDF: db $75 ; line 2
#_1C9CE0: db $E3, $59, $D1, $28, $2E, $25, $1D, $59 ; [you]⎵[sh]ould⎵
#_1C9CE8: db $1B, $2B, $B3, $1A, $59, $98, $2D, $2D ; br[ing ]a⎵[bo]tt
#_1C9CF0: db $25, $1E, $59, $DA ; le⎵[to]
#_1C9CF4: db $76 ; line 3
#_1C9CF5: db $29, $2E, $2D, $59, $B6, $59, $B4, $43 ; put⎵[it]⎵[in]…
#_1C9CFD: db $8A, $07, $1E, $59, $21, $1E, $59, $21 ; [  ]He⎵he⎵h
#_1C9D05: db $1E, $3E ; e!
#_1C9D07: db $7F ; end of message

;===================================================================================================
; Red is the medicine of life.
; Green is the medicine of magic.
; Blue renews both life and
; magic.
; Here, taste a sample of the
; Red Potion…  He he!
;---------------------------------------------------------------------------------------------------
Message_004E:
#_1C9D08: db $11, $A4, $B5, $59, $D8, $59, $BE, $9E ; R[ed ][is]⎵[the]⎵[me][di]
#_1C9D10: db $1C, $B4, $1E, $59, $C6, $59, $25, $22 ; c[in]e⎵[of]⎵li
#_1C9D18: db $1F, $1E, $41 ; fe.
#_1C9D1B: db $75 ; line 2
#_1C9D1C: db $06, $CE, $A0, $B5, $59, $D8, $59, $BE ; G[re][en ][is]⎵[the]⎵[me]
#_1C9D24: db $9E, $1C, $B4, $1E, $59, $C6, $59, $BD ; [di]c[in]e⎵[of]⎵[ma]
#_1C9D2C: db $20, $22, $1C, $41 ; gic.
#_1C9D30: db $76 ; line 3
#_1C9D31: db $01, $25, $2E, $1E, $59, $CE, $27, $1E ; Blue⎵[re]ne
#_1C9D39: db $30, $2C, $59, $98, $2D, $21, $59, $25 ; ws⎵[bo]th⎵l
#_1C9D41: db $22, $1F, $1E, $59, $90 ; ife⎵[and]
#_1C9D46: db $7E ; wait for key
#_1C9D47: db $73 ; scroll text
#_1C9D48: db $BD, $20, $22, $1C, $41 ; [ma]gic.
#_1C9D4D: db $73 ; scroll text
#_1C9D4E: db $E4, $1E, $42, $59, $2D, $92, $1E, $59 ; [Her]e,⎵t[ast]e⎵
#_1C9D56: db $1A, $59, $2C, $1A, $26, $CA, $59, $C6 ; a⎵sam[ple]⎵[of]
#_1C9D5E: db $59, $D8 ; ⎵[the]
#_1C9D60: db $73 ; scroll text
#_1C9D61: db $11, $A4, $0F, $28, $2D, $22, $C7, $43 ; R[ed ]Poti[on]…
#_1C9D69: db $8A, $07, $1E, $59, $21, $1E, $3E ; [  ]He⎵he!
#_1C9D70: db $7F ; end of message

;===================================================================================================
; Without a magic bottle, you can
; not buy any potions.
; He he he!
;---------------------------------------------------------------------------------------------------
Message_004F:
#_1C9D71: db $16, $B6, $21, $C5, $1A, $59, $BD, $20 ; W[it]h[out ]a⎵[ma]g
#_1C9D79: db $22, $1C, $59, $98, $2D, $2D, $25, $1E ; ic⎵[bo]ttle
#_1C9D81: db $42, $59, $E3, $59, $1C, $93 ; ,⎵[you]⎵c[an]
#_1C9D87: db $75 ; line 2
#_1C9D88: db $C2, $59, $1B, $2E, $32, $59, $93, $32 ; [not]⎵buy⎵[an]y
#_1C9D90: db $59, $29, $28, $2D, $22, $C7, $2C, $41 ; ⎵poti[on]s.
#_1C9D98: db $76 ; line 3
#_1C9D99: db $07, $1E, $59, $21, $1E, $59, $21, $1E ; He⎵he⎵he
#_1C9DA1: db $3E ; !
#_1C9DA2: db $7F ; end of message

;===================================================================================================
; No,  no,  no…  I can't put
; anything into a full bottle.
; He he he!
;---------------------------------------------------------------------------------------------------
Message_0050:
#_1C9DA3: db $0D, $28, $42, $8A, $27, $28, $42, $8A ; No,[  ]no,[  ]
#_1C9DAB: db $27, $28, $43, $8A, $08, $59, $1C, $93 ; no…[  ]I⎵c[an]
#_1C9DB3: db $51, $2D, $59, $29, $2E, $2D ; 't⎵put
#_1C9DB9: db $75 ; line 2
#_1C9DBA: db $93, $32, $D5, $20, $59, $B4, $DA, $59 ; [an]y[thin]g⎵[in][to]⎵
#_1C9DC2: db $1A, $59, $1F, $2E, $25, $25, $59, $98 ; a⎵full⎵[bo]
#_1C9DCA: db $2D, $2D, $25, $1E, $41 ; ttle.
#_1C9DCF: db $76 ; line 3
#_1C9DD0: db $07, $1E, $59, $21, $1E, $59, $21, $1E ; He⎵he⎵he
#_1C9DD8: db $3E ; !
#_1C9DD9: db $7F ; end of message

;===================================================================================================
; You got the Lamp!
; Now you can light torches and
; see your way in darkness.
;---------------------------------------------------------------------------------------------------
Message_0051:
#_1C9DDA: db $E8, $59, $AC, $2D, $59, $D8, $59, $0B ; [You]⎵[go]t⎵[the]⎵L
#_1C9DE2: db $1A, $26, $29, $3E ; amp!
#_1C9DE6: db $75 ; line 2
#_1C9DE7: db $0D, $28, $30, $59, $E3, $59, $99, $25 ; Now⎵[you]⎵[can ]l
#_1C9DEF: db $B2, $DA, $2B, $9A, $2C, $59, $90 ; [ight ][to]r[che]s⎵[and]
#_1C9DF6: db $76 ; line 3
#_1C9DF7: db $D0, $1E, $59, $E3, $2B, $59, $DF, $32 ; [se]e⎵[you]r⎵[wa]y
#_1C9DFF: db $59, $B4, $59, $1D, $1A, $2B, $24, $27 ; ⎵[in]⎵darkn
#_1C9E07: db $1E, $2C, $2C, $41 ; ess.
#_1C9E0B: db $7F ; end of message

;===================================================================================================
; You got the Boomerang!
; Give it a try!  (To select an
; item, press the Start Button. )
;---------------------------------------------------------------------------------------------------
Message_0052:
#_1C9E0C: db $E8, $59, $AC, $2D, $59, $D8, $59, $01 ; [You]⎵[go]t⎵[the]⎵B
#_1C9E14: db $28, $28, $BE, $2B, $93, $20, $3E ; oo[me]r[an]g!
#_1C9E1B: db $75 ; line 2
#_1C9E1C: db $06, $22, $2F, $1E, $59, $B6, $59, $1A ; Give⎵[it]⎵a
#_1C9E24: db $59, $DB, $32, $3E, $8A, $45, $13, $28 ; ⎵[tr]y![  ](To
#_1C9E2C: db $59, $D0, $25, $1E, $1C, $2D, $59, $93 ; ⎵[se]lect⎵[an]
#_1C9E34: db $76 ; line 3
#_1C9E35: db $B6, $1E, $26, $42, $59, $29, $CE, $2C ; [it]em,⎵p[re]s
#_1C9E3D: db $2C, $59, $D8, $59, $12, $2D, $1A, $2B ; s⎵[the]⎵Star
#_1C9E45: db $2D, $59, $01, $2E, $2D, $DA, $27, $41 ; t⎵But[to]n.
#_1C9E4D: db $59, $46 ; ⎵)
#_1C9E4F: db $7F ; end of message

;===================================================================================================
; You found the Bow!
; You can shoot arrows until you
; run out!
;---------------------------------------------------------------------------------------------------
Message_0053:
#_1C9E50: db $E8, $59, $1F, $C4, $59, $D8, $59, $01 ; [You]⎵f[ound]⎵[the]⎵B
#_1C9E58: db $28, $30, $3E ; ow!
#_1C9E5B: db $75 ; line 2
#_1C9E5C: db $E8, $59, $99, $D1, $28, $28, $2D, $59 ; [You]⎵[can ][sh]oot⎵
#_1C9E64: db $1A, $2B, $2B, $28, $30, $2C, $59, $2E ; arrows⎵u
#_1C9E6C: db $27, $2D, $22, $25, $59, $E3 ; ntil⎵[you]
#_1C9E72: db $76 ; line 3
#_1C9E73: db $2B, $2E, $27, $59, $28, $2E, $2D, $3E ; run⎵out!
#_1C9E7B: db $7F ; end of message

;===================================================================================================
; You borrowed a shovel!
; You can dig in many places.
; You never know what you'll
; find!
;---------------------------------------------------------------------------------------------------
Message_0054:
#_1C9E7C: db $E8, $59, $98, $2B, $2B, $28, $E0, $1D ; [You]⎵[bo]rro[we]d
#_1C9E84: db $59, $1A, $59, $D1, $28, $2F, $1E, $25 ; ⎵a⎵[sh]ovel
#_1C9E8C: db $3E ; !
#_1C9E8D: db $75 ; line 2
#_1C9E8E: db $E8, $59, $99, $9E, $20, $59, $B4, $59 ; [You]⎵[can ][di]g⎵[in]⎵
#_1C9E96: db $BC, $32, $59, $29, $BA, $1C, $1E, $2C ; [man]y⎵p[la]ces
#_1C9E9E: db $41 ; .
#_1C9E9F: db $76 ; line 3
#_1C9EA0: db $E8, $59, $27, $A7, $A1, $B8, $59, $E1 ; [You]⎵n[ev][er ][know]⎵[wh]
#_1C9EA8: db $91, $E3, $51, $25, $25 ; [at ][you]'ll
#_1C9EAD: db $7E ; wait for key
#_1C9EAE: db $73 ; scroll text
#_1C9EAF: db $1F, $B4, $1D, $3E ; f[in]d!
#_1C9EB3: db $7F ; end of message

;===================================================================================================
; This is the Magic Cape!
; You are invisible when you wear
; it! Watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0055:
#_1C9EB4: db $E7, $2C, $59, $B5, $59, $D8, $59, $0C ; [Thi]s⎵[is]⎵[the]⎵M
#_1C9EBC: db $1A, $20, $22, $1C, $59, $02, $1A, $29 ; agic⎵Cap
#_1C9EC4: db $1E, $3E ; e!
#_1C9EC6: db $75 ; line 2
#_1C9EC7: db $E8, $59, $8D, $B4, $2F, $B5, $22, $95 ; [You]⎵[are ][in]v[is]i[ble]
#_1C9ECF: db $59, $E1, $A0, $E3, $59, $E0, $1A, $2B ; ⎵[wh][en ][you]⎵[we]ar
#_1C9ED7: db $76 ; line 3
#_1C9ED8: db $B6, $3E, $59, $16, $94, $1C, $21, $59 ; [it]!⎵W[at]ch⎵
#_1C9EE0: db $E3, $2B, $59, $0C, $1A, $20, $22, $1C ; [you]r⎵Magic
#_1C9EE8: db $59, $0C, $1E, $D6, $3E ; ⎵Me[ter]!
#_1C9EED: db $7F ; end of message

;===================================================================================================
; This is Magic Powder!
; Try to sprinkle it on enemies
; and many other things!
;---------------------------------------------------------------------------------------------------
Message_0056:
#_1C9EEE: db $E7, $2C, $59, $B5, $59, $0C, $1A, $20 ; [Thi]s⎵[is]⎵Mag
#_1C9EF6: db $22, $1C, $59, $0F, $28, $30, $1D, $A6 ; ic⎵Powd[er]
#_1C9EFE: db $3E ; !
#_1C9EFF: db $75 ; line 2
#_1C9F00: db $13, $2B, $32, $59, $DA, $59, $2C, $29 ; Try⎵[to]⎵sp
#_1C9F08: db $2B, $B4, $24, $25, $1E, $59, $B6, $59 ; r[in]kle⎵[it]⎵
#_1C9F10: db $C7, $59, $A5, $1E, $26, $22, $1E, $2C ; [on]⎵[en]emies
#_1C9F18: db $76 ; line 3
#_1C9F19: db $8C, $BC, $32, $59, $28, $D8, $2B, $59 ; [and ][man]y⎵o[the]r⎵
#_1C9F21: db $D5, $20, $2C, $3E ; [thin]gs!
#_1C9F25: db $7F ; end of message

;===================================================================================================
; You bought Zora's Flippers!
; With these you should be able
; to swim even in deep water!
;---------------------------------------------------------------------------------------------------
Message_0057:
#_1C9F26: db $E8, $59, $98, $2E, $20, $21, $2D, $59 ; [You]⎵[bo]ught⎵
#_1C9F2E: db $19, $C8, $1A, $8B, $05, $25, $22, $29 ; Z[or]a['s ]Flip
#_1C9F36: db $C9, $2C, $3E ; [per]s!
#_1C9F39: db $75 ; line 2
#_1C9F3A: db $16, $B6, $21, $59, $D8, $D0, $59, $E3 ; W[it]h⎵[the][se]⎵[you]
#_1C9F42: db $59, $D1, $28, $2E, $25, $1D, $59, $97 ; ⎵[sh]ould⎵[be]
#_1C9F4A: db $59, $1A, $95 ; ⎵a[ble]
#_1C9F4D: db $76 ; line 3
#_1C9F4E: db $DA, $59, $2C, $E2, $26, $59, $A7, $A0 ; [to]⎵s[wi]m⎵[ev][en ]
#_1C9F56: db $B4, $59, $1D, $1E, $1E, $29, $59, $DF ; [in]⎵deep⎵[wa]
#_1C9F5E: db $D6, $3E ; [ter]!
#_1C9F60: db $7F ; end of message

;===================================================================================================
; You got the Power Glove!
; You can feel strength in both
; hands!  You can pick up and
; carry stones now!
;---------------------------------------------------------------------------------------------------
Message_0058:
#_1C9F61: db $E8, $59, $AC, $2D, $59, $D8, $59, $0F ; [You]⎵[go]t⎵[the]⎵P
#_1C9F69: db $28, $E0, $2B, $59, $06, $BB, $2F, $1E ; o[we]r⎵G[lo]ve
#_1C9F71: db $3E ; !
#_1C9F72: db $75 ; line 2
#_1C9F73: db $E8, $59, $99, $1F, $1E, $1E, $25, $59 ; [You]⎵[can ]feel⎵
#_1C9F7B: db $D3, $CE, $27, $20, $2D, $21, $59, $B4 ; [st][re]ngth⎵[in]
#_1C9F83: db $59, $98, $2D, $21 ; ⎵[bo]th
#_1C9F87: db $76 ; line 3
#_1C9F88: db $B1, $27, $1D, $2C, $3E, $8A, $E8, $59 ; [ha]nds![  ][You]⎵
#_1C9F90: db $99, $29, $22, $9C, $59, $DC, $59, $90 ; [can ]pi[ck]⎵[up]⎵[and]
#_1C9F98: db $7E ; wait for key
#_1C9F99: db $73 ; scroll text
#_1C9F9A: db $1C, $1A, $2B, $2B, $32, $59, $D3, $C7 ; carry⎵[st][on]
#_1C9FA2: db $1E, $2C, $59, $27, $28, $30, $3E ; es⎵now!
#_1C9FA9: db $7F ; end of message

;===================================================================================================
; You won the Pendant Of
; Courage!  Take it to
; Sahasrahla!
; Two Pendants remain!
;---------------------------------------------------------------------------------------------------
Message_0059:
#_1C9FAA: db $E8, $59, $30, $C7, $59, $D8, $59, $0F ; [You]⎵w[on]⎵[the]⎵P
#_1C9FB2: db $A5, $1D, $93, $2D, $59, $0E, $1F ; [en]d[an]t⎵Of
#_1C9FB9: db $75 ; line 2
#_1C9FBA: db $02, $28, $2E, $2B, $1A, $20, $1E, $3E ; Courage!
#_1C9FC2: db $8A, $13, $1A, $24, $1E, $59, $B6, $59 ; [  ]Take⎵[it]⎵
#_1C9FCA: db $DA ; [to]
#_1C9FCB: db $76 ; line 3
#_1C9FCC: db $12, $1A, $AE, $2B, $1A, $21, $BA, $3E ; Sa[has]rah[la]!
#_1C9FD4: db $7E ; wait for key
#_1C9FD5: db $73 ; scroll text
#_1C9FD6: db $13, $30, $28, $59, $0F, $A5, $1D, $93 ; Two⎵P[en]d[an]
#_1C9FDE: db $2D, $2C, $59, $CE, $BD, $B4, $3E ; ts⎵[re][ma][in]!
#_1C9FE5: db $7F ; end of message

;===================================================================================================
; You won the Pendant Of Power!
; Your goal of finding three
; Pendants is in sight!
; Go for the last one!
;---------------------------------------------------------------------------------------------------
Message_005A:
#_1C9FE6: db $E8, $59, $30, $C7, $59, $D8, $59, $0F ; [You]⎵w[on]⎵[the]⎵P
#_1C9FEE: db $A5, $1D, $93, $2D, $59, $0E, $1F, $59 ; [en]d[an]t⎵Of⎵
#_1C9FF6: db $0F, $28, $E0, $2B, $3E ; Po[we]r!
#_1C9FFB: db $75 ; line 2
#_1C9FFC: db $E8, $2B, $59, $AC, $1A, $25, $59, $C6 ; [You]r⎵[go]al⎵[of]
#_1CA004: db $59, $1F, $B4, $9E, $27, $20, $59, $2D ; ⎵f[in][di]ng⎵t
#_1CA00C: db $21, $CE, $1E ; h[re]e
#_1CA00F: db $76 ; line 3
#_1CA010: db $0F, $A5, $1D, $93, $2D, $2C, $59, $B5 ; P[en]d[an]ts⎵[is]
#_1CA018: db $59, $B4, $59, $2C, $22, $20, $21, $2D ; ⎵[in]⎵sight
#_1CA020: db $3E ; !
#_1CA021: db $7E ; wait for key
#_1CA022: db $73 ; scroll text
#_1CA023: db $06, $28, $59, $A8, $59, $D8, $59, $BA ; Go⎵[for]⎵[the]⎵[la]
#_1CA02B: db $D3, $59, $C7, $1E, $3E ; [st]⎵[on]e!
#_1CA030: db $7F ; end of message

;===================================================================================================
; You won the Pendant Of Wisdom!
; With this, you have collected
; all three Pendants!  Go now to
; the Lost Woods to get
; the Master Sword!
;---------------------------------------------------------------------------------------------------
Message_005B:
#_1CA031: db $E8, $59, $30, $C7, $59, $D8, $59, $0F ; [You]⎵w[on]⎵[the]⎵P
#_1CA039: db $A5, $1D, $93, $2D, $59, $0E, $1F, $59 ; [en]d[an]t⎵Of⎵
#_1CA041: db $16, $B5, $9F, $26, $3E ; W[is][do]m!
#_1CA046: db $75 ; line 2
#_1CA047: db $16, $B6, $21, $59, $D9, $2C, $42, $59 ; W[it]h⎵[thi]s,⎵
#_1CA04F: db $E3, $59, $AD, $59, $1C, $28, $25, $25 ; [you]⎵[have]⎵coll
#_1CA057: db $1E, $1C, $2D, $1E, $1D ; ected
#_1CA05C: db $76 ; line 3
#_1CA05D: db $8E, $2D, $21, $CE, $1E, $59, $0F, $A5 ; [all ]th[re]e⎵P[en]
#_1CA065: db $1D, $93, $2D, $2C, $3E, $8A, $06, $28 ; d[an]ts![  ]Go
#_1CA06D: db $59, $27, $28, $30, $59, $DA ; ⎵now⎵[to]
#_1CA073: db $7E ; wait for key
#_1CA074: db $73 ; scroll text
#_1CA075: db $D8, $59, $0B, $28, $D3, $59, $16, $28 ; [the]⎵Lo[st]⎵Wo
#_1CA07D: db $28, $1D, $2C, $59, $DA, $59, $AB ; ods⎵[to]⎵[get]
#_1CA084: db $73 ; scroll text
#_1CA085: db $D8, $59, $0C, $92, $A1, $12, $30, $C8 ; [the]⎵M[ast][er ]Sw[or]
#_1CA08D: db $1D, $3E ; d!
#_1CA08F: db $7F ; end of message

;===================================================================================================
; This Mushroom smells like sweet
; rotten fruit…
; You can give this to anyone
; who wants it (Select it and
; press the ⓨ Button).
;---------------------------------------------------------------------------------------------------
Message_005C:
#_1CA090: db $E7, $2C, $59, $0C, $2E, $D1, $2B, $28 ; [Thi]s⎵Mu[sh]ro
#_1CA098: db $28, $26, $59, $2C, $BE, $25, $25, $2C ; om⎵s[me]lls
#_1CA0A0: db $59, $25, $22, $24, $1E, $59, $2C, $E0 ; ⎵like⎵s[we]
#_1CA0A8: db $1E, $2D ; et
#_1CA0AA: db $75 ; line 2
#_1CA0AB: db $2B, $28, $2D, $2D, $A0, $1F, $2B, $2E ; rott[en ]fru
#_1CA0B3: db $B6, $43 ; [it]…
#_1CA0B5: db $76 ; line 3
#_1CA0B6: db $E8, $59, $99, $AA, $D9, $2C, $59, $DA ; [You]⎵[can ][give ][thi]s⎵[to]
#_1CA0BE: db $59, $93, $32, $C7, $1E ; ⎵[an]y[on]e
#_1CA0C3: db $7E ; wait for key
#_1CA0C4: db $73 ; scroll text
#_1CA0C5: db $E1, $28, $59, $DF, $27, $2D, $2C, $59 ; [wh]o⎵[wa]nts⎵
#_1CA0CD: db $B6, $59, $45, $12, $1E, $25, $1E, $1C ; [it]⎵(Selec
#_1CA0D5: db $2D, $59, $B6, $59, $90 ; t⎵[it]⎵[and]
#_1CA0DA: db $73 ; scroll text
#_1CA0DB: db $29, $CE, $2C, $2C, $59, $D8, $59, $5E ; p[re]ss⎵[the]⎵ⓨ
#_1CA0E3: db $59, $01, $2E, $2D, $DA, $27, $46, $41 ; ⎵But[to]n).
#_1CA0EB: db $7F ; end of message

;===================================================================================================
; You found the Book of Mudora!
; You can use it to read the
; ancient language of the Hylia!
;---------------------------------------------------------------------------------------------------
Message_005D:
#_1CA0EC: db $E8, $59, $1F, $C4, $59, $D8, $59, $01 ; [You]⎵f[ound]⎵[the]⎵B
#_1CA0F4: db $28, $28, $24, $59, $C6, $59, $0C, $2E ; ook⎵[of]⎵Mu
#_1CA0FC: db $9F, $2B, $1A, $3E ; [do]ra!
#_1CA100: db $75 ; line 2
#_1CA101: db $E8, $59, $99, $2E, $D0, $59, $B6, $59 ; [You]⎵[can ]u[se]⎵[it]⎵
#_1CA109: db $DA, $59, $CE, $1A, $1D, $59, $D8 ; [to]⎵[re]ad⎵[the]
#_1CA110: db $76 ; line 3
#_1CA111: db $93, $1C, $22, $A3, $59, $BA, $27, $20 ; [an]ci[ent]⎵[la]ng
#_1CA119: db $2E, $1A, $20, $1E, $59, $C6, $59, $D8 ; uage⎵[of]⎵[the]
#_1CA121: db $59, $07, $32, $25, $22, $1A, $3E ; ⎵Hylia!
#_1CA128: db $7F ; end of message

;===================================================================================================
; You found the Moon Pearl!
; This protects The Hero from
; the changing effects of the
; Golden Power.
;---------------------------------------------------------------------------------------------------
Message_005E:
#_1CA129: db $E8, $59, $1F, $C4, $59, $D8, $59, $0C ; [You]⎵f[ound]⎵[the]⎵M
#_1CA131: db $28, $C7, $59, $0F, $A2, $25, $3E ; o[on]⎵P[ear]l!
#_1CA138: db $75 ; line 2
#_1CA139: db $E7, $2C, $59, $CC, $2D, $1E, $1C, $2D ; [Thi]s⎵[pro]tect
#_1CA141: db $2C, $59, $E6, $59, $E4, $28, $59, $A9 ; s⎵[The]⎵[Her]o⎵[fro]
#_1CA149: db $26 ; m
#_1CA14A: db $76 ; line 3
#_1CA14B: db $D8, $59, $1C, $B1, $27, $20, $B3, $1E ; [the]⎵c[ha]ng[ing ]e
#_1CA153: db $1F, $1F, $1E, $1C, $2D, $2C, $59, $C6 ; ffects⎵[of]
#_1CA15B: db $59, $D8 ; ⎵[the]
#_1CA15D: db $7E ; wait for key
#_1CA15E: db $73 ; scroll text
#_1CA15F: db $06, $28, $25, $1D, $A0, $0F, $28, $E0 ; Gold[en ]Po[we]
#_1CA167: db $2B, $41 ; r.
#_1CA169: db $7F ; end of message

;===================================================================================================
; You found the Compass!
; Now you can pinpoint the
; lair of the dungeon's evil
; master!
;---------------------------------------------------------------------------------------------------
Message_005F:
#_1CA16A: db $E8, $59, $1F, $C4, $59, $D8, $59, $02 ; [You]⎵f[ound]⎵[the]⎵C
#_1CA172: db $28, $26, $29, $1A, $2C, $2C, $3E ; ompass!
#_1CA179: db $75 ; line 2
#_1CA17A: db $0D, $28, $30, $59, $E3, $59, $99, $29 ; Now⎵[you]⎵[can ]p
#_1CA182: db $B4, $29, $28, $B4, $2D, $59, $D8 ; [in]po[in]t⎵[the]
#_1CA189: db $76 ; line 3
#_1CA18A: db $BA, $22, $2B, $59, $C6, $59, $D8, $59 ; [la]ir⎵[of]⎵[the]⎵
#_1CA192: db $1D, $2E, $27, $20, $1E, $C7, $8B, $A7 ; dunge[on]['s ][ev]
#_1CA19A: db $22, $25 ; il
#_1CA19C: db $7E ; wait for key
#_1CA19D: db $73 ; scroll text
#_1CA19E: db $BD, $D3, $A6, $3E ; [ma][st][er]!
#_1CA1A2: db $7F ; end of message

;===================================================================================================
; You got the Map!
; You can use it to see your
; current position and the rest
; of the dungeon (Press ⓧ).
;---------------------------------------------------------------------------------------------------
Message_0060:
#_1CA1A3: db $E8, $59, $AC, $2D, $59, $D8, $59, $0C ; [You]⎵[go]t⎵[the]⎵M
#_1CA1AB: db $1A, $29, $3E ; ap!
#_1CA1AE: db $75 ; line 2
#_1CA1AF: db $E8, $59, $99, $2E, $D0, $59, $B6, $59 ; [You]⎵[can ]u[se]⎵[it]⎵
#_1CA1B7: db $DA, $59, $D0, $1E, $59, $E3, $2B ; [to]⎵[se]e⎵[you]r
#_1CA1BE: db $76 ; line 3
#_1CA1BF: db $1C, $2E, $2B, $CE, $27, $2D, $59, $29 ; cur[re]nt⎵p
#_1CA1C7: db $28, $2C, $B6, $22, $C7, $59, $8C, $D8 ; os[it]i[on]⎵[and ][the]
#_1CA1CF: db $59, $CE, $D3 ; ⎵[re][st]
#_1CA1D2: db $7E ; wait for key
#_1CA1D3: db $73 ; scroll text
#_1CA1D4: db $C6, $59, $D8, $59, $1D, $2E, $27, $20 ; [of]⎵[the]⎵dung
#_1CA1DC: db $1E, $C7, $59, $45, $0F, $CE, $2C, $2C ; e[on]⎵(P[re]ss
#_1CA1E4: db $59, $5D, $46, $41 ; ⎵ⓧ).
#_1CA1E8: db $7F ; end of message

;===================================================================================================
; You found the Ice Rod!
; Its chill magic blasts the air!
; But watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0061:
#_1CA1E9: db $E8, $59, $1F, $C4, $59, $D8, $59, $08 ; [You]⎵f[ound]⎵[the]⎵I
#_1CA1F1: db $1C, $1E, $59, $11, $28, $1D, $3E ; ce⎵Rod!
#_1CA1F8: db $75 ; line 2
#_1CA1F9: db $08, $2D, $2C, $59, $1C, $B0, $25, $25 ; Its⎵c[hi]ll
#_1CA201: db $59, $BD, $20, $22, $1C, $59, $1B, $BA ; ⎵[ma]gic⎵b[la]
#_1CA209: db $D3, $2C, $59, $D8, $59, $1A, $22, $2B ; [st]s⎵[the]⎵air
#_1CA211: db $3E ; !
#_1CA212: db $76 ; line 3
#_1CA213: db $01, $2E, $2D, $59, $DF, $2D, $1C, $21 ; But⎵[wa]tch
#_1CA21B: db $59, $E3, $2B, $59, $0C, $1A, $20, $22 ; ⎵[you]r⎵Magi
#_1CA223: db $1C, $59, $0C, $1E, $D6, $3E ; c⎵Me[ter]!
#_1CA229: db $7F ; end of message

;===================================================================================================
; You found the Fire Rod!
; This rod commands the red fire!
; But watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0062:
#_1CA22A: db $E8, $59, $1F, $C4, $59, $D8, $59, $05 ; [You]⎵f[ound]⎵[the]⎵F
#_1CA232: db $22, $CD, $11, $28, $1D, $3E ; i[re ]Rod!
#_1CA238: db $75 ; line 2
#_1CA239: db $E7, $2C, $59, $2B, $28, $1D, $59, $9B ; [Thi]s⎵rod⎵[com]
#_1CA241: db $BC, $1D, $2C, $59, $D8, $59, $CE, $1D ; [man]ds⎵[the]⎵[re]d
#_1CA249: db $59, $1F, $22, $CE, $3E ; ⎵fi[re]!
#_1CA24E: db $76 ; line 3
#_1CA24F: db $01, $2E, $2D, $59, $DF, $2D, $1C, $21 ; But⎵[wa]tch
#_1CA257: db $59, $E3, $2B, $59, $0C, $1A, $20, $22 ; ⎵[you]r⎵Magi
#_1CA25F: db $1C, $59, $0C, $1E, $D6, $3E ; c⎵Me[ter]!
#_1CA265: db $7F ; end of message

;===================================================================================================
; This is the Ether Medallion!
; Its magic controls the upper
; atmosphere and polar wind!
; Watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0063:
#_1CA266: db $E7, $2C, $59, $B5, $59, $D8, $59, $04 ; [Thi]s⎵[is]⎵[the]⎵E
#_1CA26E: db $D8, $2B, $59, $0C, $1E, $1D, $1A, $25 ; [the]r⎵Medal
#_1CA276: db $25, $22, $C7, $3E ; li[on]!
#_1CA27A: db $75 ; line 2
#_1CA27B: db $08, $2D, $2C, $59, $BD, $20, $22, $1C ; Its⎵[ma]gic
#_1CA283: db $59, $1C, $C7, $DB, $28, $25, $2C, $59 ; ⎵c[on][tr]ols⎵
#_1CA28B: db $D8, $59, $DC, $C9 ; [the]⎵[up][per]
#_1CA28F: db $76 ; line 3
#_1CA290: db $94, $26, $28, $2C, $29, $AF, $1E, $59 ; [at]mosp[her]e⎵
#_1CA298: db $8C, $29, $28, $BA, $2B, $59, $E2, $27 ; [and ]po[la]r⎵[wi]n
#_1CA2A0: db $1D, $3E ; d!
#_1CA2A2: db $7E ; wait for key
#_1CA2A3: db $73 ; scroll text
#_1CA2A4: db $16, $94, $1C, $21, $59, $E3, $2B, $59 ; W[at]ch⎵[you]r⎵
#_1CA2AC: db $0C, $1A, $20, $22, $1C, $59, $0C, $1E ; Magic⎵Me
#_1CA2B4: db $D6, $3E ; [ter]!
#_1CA2B6: db $7F ; end of message

;===================================================================================================
; This is the Bombos Medallion!
; Its magic makes the ground
; explode with power!
; Watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0064:
#_1CA2B7: db $E7, $2C, $59, $B5, $59, $D8, $59, $01 ; [Thi]s⎵[is]⎵[the]⎵B
#_1CA2BF: db $28, $26, $98, $2C, $59, $0C, $1E, $1D ; om[bo]s⎵Med
#_1CA2C7: db $1A, $25, $25, $22, $C7, $3E ; alli[on]!
#_1CA2CD: db $75 ; line 2
#_1CA2CE: db $08, $2D, $2C, $59, $BD, $20, $22, $1C ; Its⎵[ma]gic
#_1CA2D6: db $59, $BD, $24, $1E, $2C, $59, $D8, $59 ; ⎵[ma]kes⎵[the]⎵
#_1CA2DE: db $20, $2B, $C4 ; gr[ound]
#_1CA2E1: db $76 ; line 3
#_1CA2E2: db $1E, $31, $29, $BB, $1D, $1E, $59, $DE ; exp[lo]de⎵[with]
#_1CA2EA: db $59, $CB, $A6, $3E ; ⎵[pow][er]!
#_1CA2EE: db $7E ; wait for key
#_1CA2EF: db $73 ; scroll text
#_1CA2F0: db $16, $94, $1C, $21, $59, $E3, $2B, $59 ; W[at]ch⎵[you]r⎵
#_1CA2F8: db $0C, $1A, $20, $22, $1C, $59, $0C, $1E ; Magic⎵Me
#_1CA300: db $D6, $3E ; [ter]!
#_1CA302: db $7F ; end of message

;===================================================================================================
; This is the Quake Medallion!
; Its magic causes the ground
; to shake and defeats
; nearby enemies!
; Watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_0065:
#_1CA303: db $E7, $2C, $59, $B5, $59, $D8, $59, $10 ; [Thi]s⎵[is]⎵[the]⎵Q
#_1CA30B: db $2E, $1A, $24, $1E, $59, $0C, $1E, $1D ; uake⎵Med
#_1CA313: db $1A, $25, $25, $22, $C7, $3E ; alli[on]!
#_1CA319: db $75 ; line 2
#_1CA31A: db $08, $2D, $2C, $59, $BD, $20, $22, $1C ; Its⎵[ma]gic
#_1CA322: db $59, $1C, $1A, $2E, $D0, $2C, $59, $D8 ; ⎵cau[se]s⎵[the]
#_1CA32A: db $59, $20, $2B, $C4 ; ⎵gr[ound]
#_1CA32E: db $76 ; line 3
#_1CA32F: db $DA, $59, $D1, $1A, $24, $1E, $59, $8C ; [to]⎵[sh]ake⎵[and ]
#_1CA337: db $1D, $1E, $1F, $1E, $94, $2C ; defe[at]s
#_1CA33D: db $7E ; wait for key
#_1CA33E: db $73 ; scroll text
#_1CA33F: db $27, $A2, $1B, $32, $59, $A5, $1E, $26 ; n[ear]by⎵[en]em
#_1CA347: db $22, $1E, $2C, $3E ; ies!
#_1CA34B: db $73 ; scroll text
#_1CA34C: db $16, $94, $1C, $21, $59, $E3, $2B, $59 ; W[at]ch⎵[you]r⎵
#_1CA354: db $0C, $1A, $20, $22, $1C, $59, $0C, $1E ; Magic⎵Me
#_1CA35C: db $D6, $3E ; [ter]!
#_1CA35E: db $7F ; end of message

;===================================================================================================
; You got the Magic Hammer!
; You can drive the wooden
; stakes down into the ground!
; You can use it to pound on
; other things too!
;---------------------------------------------------------------------------------------------------
Message_0066:
#_1CA35F: db $E8, $59, $AC, $2D, $59, $D8, $59, $0C ; [You]⎵[go]t⎵[the]⎵M
#_1CA367: db $1A, $20, $22, $1C, $59, $07, $1A, $26 ; agic⎵Ham
#_1CA36F: db $BE, $2B, $3E ; [me]r!
#_1CA372: db $75 ; line 2
#_1CA373: db $E8, $59, $99, $1D, $2B, $22, $2F, $1E ; [You]⎵[can ]drive
#_1CA37B: db $59, $D8, $59, $30, $28, $28, $1D, $A5 ; ⎵[the]⎵wood[en]
#_1CA383: db $76 ; line 3
#_1CA384: db $D3, $1A, $24, $1E, $2C, $59, $9F, $30 ; [st]akes⎵[do]w
#_1CA38C: db $27, $59, $B4, $DA, $59, $D8, $59, $20 ; n⎵[in][to]⎵[the]⎵g
#_1CA394: db $2B, $C4, $3E ; r[ound]!
#_1CA397: db $7E ; wait for key
#_1CA398: db $73 ; scroll text
#_1CA399: db $E8, $59, $99, $2E, $D0, $59, $B6, $59 ; [You]⎵[can ]u[se]⎵[it]⎵
#_1CA3A1: db $DA, $59, $29, $C4, $59, $C7 ; [to]⎵p[ound]⎵[on]
#_1CA3A7: db $73 ; scroll text
#_1CA3A8: db $28, $D8, $2B, $59, $D5, $20, $2C, $59 ; o[the]r⎵[thin]gs⎵
#_1CA3B0: db $DA, $28, $3E ; [to]o!
#_1CA3B3: db $7F ; end of message

;===================================================================================================
; Oh!  Here is the Flute!
; Its music surely has some
; mysterious power!
;---------------------------------------------------------------------------------------------------
Message_0067:
#_1CA3B4: db $0E, $21, $3E, $8A, $E4, $1E, $59, $B5 ; Oh![  ][Her]e⎵[is]
#_1CA3BC: db $59, $D8, $59, $05, $25, $2E, $2D, $1E ; ⎵[the]⎵Flute
#_1CA3C4: db $3E ; !
#_1CA3C5: db $75 ; line 2
#_1CA3C6: db $08, $2D, $2C, $59, $BF, $2C, $22, $1C ; Its⎵[mu]sic
#_1CA3CE: db $59, $2C, $2E, $CE, $B9, $AE, $59, $CF ; ⎵su[re][ly ][has]⎵[some]
#_1CA3D6: db $76 ; line 3
#_1CA3D7: db $26, $32, $D3, $A6, $22, $28, $2E, $2C ; my[st][er]ious
#_1CA3DF: db $59, $CB, $A6, $3E ; ⎵[pow][er]!
#_1CA3E3: db $7F ; end of message

;===================================================================================================
; You got the Cane Of Somaria!
; It will be very helpful if you
; make proper use of it!
; What a mysterious cane!
;---------------------------------------------------------------------------------------------------
Message_0068:
#_1CA3E4: db $E8, $59, $AC, $2D, $59, $D8, $59, $02 ; [You]⎵[go]t⎵[the]⎵C
#_1CA3EC: db $93, $1E, $59, $0E, $1F, $59, $12, $28 ; [an]e⎵Of⎵So
#_1CA3F4: db $BD, $2B, $22, $1A, $3E ; [ma]ria!
#_1CA3F9: db $75 ; line 2
#_1CA3FA: db $08, $2D, $59, $E2, $25, $25, $59, $97 ; It⎵[wi]ll⎵[be]
#_1CA402: db $59, $DD, $32, $59, $21, $1E, $25, $29 ; ⎵[ver]y⎵help
#_1CA40A: db $1F, $2E, $25, $59, $22, $1F, $59, $E3 ; ful⎵if⎵[you]
#_1CA412: db $76 ; line 3
#_1CA413: db $BD, $24, $1E, $59, $CC, $C9, $59, $2E ; [ma]ke⎵[pro][per]⎵u
#_1CA41B: db $D0, $59, $C6, $59, $B6, $3E ; [se]⎵[of]⎵[it]!
#_1CA421: db $7E ; wait for key
#_1CA422: db $73 ; scroll text
#_1CA423: db $16, $B1, $2D, $59, $1A, $59, $26, $32 ; W[ha]t⎵a⎵my
#_1CA42B: db $D3, $A6, $22, $28, $2E, $2C, $59, $1C ; [st][er]ious⎵c
#_1CA433: db $93, $1E, $3E ; [an]e!
#_1CA436: db $7F ; end of message

;===================================================================================================
; BOING!  This is the Hook Shot!
; It extends and contracts and…
; BOING!  It can grapple many
; things!
;---------------------------------------------------------------------------------------------------
Message_0069:
#_1CA437: db $01, $0E, $08, $0D, $06, $3E, $8A, $E7 ; BOING![  ][Thi]
#_1CA43F: db $2C, $59, $B5, $59, $D8, $59, $07, $28 ; s⎵[is]⎵[the]⎵Ho
#_1CA447: db $28, $24, $59, $12, $21, $28, $2D, $3E ; ok⎵Shot!
#_1CA44F: db $75 ; line 2
#_1CA450: db $08, $2D, $59, $1E, $31, $2D, $A5, $1D ; It⎵ext[en]d
#_1CA458: db $2C, $59, $8C, $1C, $C7, $DB, $1A, $1C ; s⎵[and ]c[on][tr]ac
#_1CA460: db $2D, $2C, $59, $90, $43 ; ts⎵[and]…
#_1CA465: db $76 ; line 3
#_1CA466: db $01, $0E, $08, $0D, $06, $3E, $8A, $08 ; BOING![  ]I
#_1CA46E: db $2D, $59, $99, $20, $2B, $1A, $29, $CA ; t⎵[can ]grap[ple]
#_1CA476: db $59, $BC, $32 ; ⎵[man]y
#_1CA479: db $7E ; wait for key
#_1CA47A: db $73 ; scroll text
#_1CA47B: db $D5, $20, $2C, $3E ; [thin]gs!
#_1CA47F: db $7F ; end of message

;===================================================================================================
; You got some Bombs!
; You can pick up and throw
; a Bomb you placed
; (Press the Ⓐ Button)!
;---------------------------------------------------------------------------------------------------
Message_006A:
#_1CA480: db $E8, $59, $AC, $2D, $59, $CF, $59, $01 ; [You]⎵[go]t⎵[some]⎵B
#_1CA488: db $28, $26, $1B, $2C, $3E ; ombs!
#_1CA48D: db $75 ; line 2
#_1CA48E: db $E8, $59, $99, $29, $22, $9C, $59, $DC ; [You]⎵[can ]pi[ck]⎵[up]
#_1CA496: db $59, $8C, $2D, $21, $2B, $28, $30 ; ⎵[and ]throw
#_1CA49D: db $76 ; line 3
#_1CA49E: db $1A, $59, $01, $28, $26, $1B, $59, $E3 ; a⎵Bomb⎵[you]
#_1CA4A6: db $59, $29, $BA, $1C, $1E, $1D ; ⎵p[la]ced
#_1CA4AC: db $7E ; wait for key
#_1CA4AD: db $73 ; scroll text
#_1CA4AE: db $45, $0F, $CE, $2C, $2C, $59, $D8, $59 ; (P[re]ss⎵[the]⎵
#_1CA4B6: db $5B, $59, $01, $2E, $2D, $DA, $27, $46 ; Ⓐ⎵But[to]n)
#_1CA4BE: db $3E ; !
#_1CA4BF: db $7F ; end of message

;===================================================================================================
; This is a Magic Bottle!
; You can store an item
; inside and then use it later!
;---------------------------------------------------------------------------------------------------
Message_006B:
#_1CA4C0: db $E7, $2C, $59, $B5, $59, $1A, $59, $0C ; [Thi]s⎵[is]⎵a⎵M
#_1CA4C8: db $1A, $20, $22, $1C, $59, $01, $28, $2D ; agic⎵Bot
#_1CA4D0: db $2D, $25, $1E, $3E ; tle!
#_1CA4D4: db $75 ; line 2
#_1CA4D5: db $E8, $59, $99, $D3, $C8, $1E, $59, $93 ; [You]⎵[can ][st][or]e⎵[an]
#_1CA4DD: db $59, $B6, $1E, $26 ; ⎵[it]em
#_1CA4E1: db $76 ; line 3
#_1CA4E2: db $B4, $2C, $22, $1D, $1E, $59, $8C, $D8 ; [in]side⎵[and ][the]
#_1CA4EA: db $27, $59, $2E, $D0, $59, $B6, $59, $BA ; n⎵u[se]⎵[it]⎵[la]
#_1CA4F2: db $D6, $3E ; [ter]!
#_1CA4F4: db $7F ; end of message

;===================================================================================================
; You got the Big Key!
; This is the master key of the
; dungeon.  It can open many
; locks that small keys cannot.
;---------------------------------------------------------------------------------------------------
Message_006C:
#_1CA4F5: db $E8, $59, $AC, $2D, $59, $D8, $59, $01 ; [You]⎵[go]t⎵[the]⎵B
#_1CA4FD: db $22, $20, $59, $0A, $1E, $32, $3E ; ig⎵Key!
#_1CA504: db $75 ; line 2
#_1CA505: db $E7, $2C, $59, $B5, $59, $D8, $59, $BD ; [Thi]s⎵[is]⎵[the]⎵[ma]
#_1CA50D: db $D3, $A1, $24, $1E, $32, $59, $C6, $59 ; [st][er ]key⎵[of]⎵
#_1CA515: db $D8 ; [the]
#_1CA516: db $76 ; line 3
#_1CA517: db $1D, $2E, $27, $20, $1E, $C7, $41, $8A ; dunge[on].[  ]
#_1CA51F: db $08, $2D, $59, $99, $C3, $59, $BC, $32 ; It⎵[can ][open]⎵[man]y
#_1CA527: db $7E ; wait for key
#_1CA528: db $73 ; scroll text
#_1CA529: db $BB, $9C, $2C, $59, $D7, $2D, $59, $2C ; [lo][ck]s⎵[tha]t⎵s
#_1CA531: db $BD, $25, $25, $59, $24, $1E, $32, $2C ; [ma]ll⎵keys
#_1CA539: db $59, $1C, $93, $C2, $41 ; ⎵c[an][not].
#_1CA53E: db $7F ; end of message

;===================================================================================================
; You got the Titan's Mitt!
; Now you can lift the heaviest
; stones that were once
; impossible to budge.
;---------------------------------------------------------------------------------------------------
Message_006D:
#_1CA53F: db $E8, $59, $AC, $2D, $59, $D8, $59, $13 ; [You]⎵[go]t⎵[the]⎵T
#_1CA547: db $B6, $93, $8B, $0C, $B6, $2D, $3E ; [it][an]['s ]M[it]t!
#_1CA54E: db $75 ; line 2
#_1CA54F: db $0D, $28, $30, $59, $E3, $59, $99, $25 ; Now⎵[you]⎵[can ]l
#_1CA557: db $22, $1F, $2D, $59, $D8, $59, $21, $1E ; ift⎵[the]⎵he
#_1CA55F: db $1A, $2F, $22, $1E, $D3 ; avie[st]
#_1CA564: db $76 ; line 3
#_1CA565: db $D3, $C7, $1E, $2C, $59, $D7, $2D, $59 ; [st][on]es⎵[tha]t⎵
#_1CA56D: db $E0, $CD, $C7, $1C, $1E ; [we][re ][on]ce
#_1CA572: db $7E ; wait for key
#_1CA573: db $73 ; scroll text
#_1CA574: db $22, $26, $29, $28, $2C, $2C, $22, $95 ; impossi[ble]
#_1CA57C: db $59, $DA, $59, $1B, $2E, $1D, $20, $1E ; ⎵[to]⎵budge
#_1CA584: db $41 ; .
#_1CA585: db $7F ; end of message

;===================================================================================================
; He gave you the Magic Mirror!
; This mirror is blue, clear and
; beautiful…
; You feel like it is going to
; absorb you into another world…
;---------------------------------------------------------------------------------------------------
Message_006E:
#_1CA586: db $07, $1E, $59, $20, $1A, $2F, $1E, $59 ; He⎵gave⎵
#_1CA58E: db $E3, $59, $D8, $59, $0C, $1A, $20, $22 ; [you]⎵[the]⎵Magi
#_1CA596: db $1C, $59, $0C, $22, $2B, $2B, $C8, $3E ; c⎵Mirr[or]!
#_1CA59E: db $75 ; line 2
#_1CA59F: db $E7, $2C, $59, $26, $22, $2B, $2B, $C8 ; [Thi]s⎵mirr[or]
#_1CA5A7: db $59, $B5, $59, $1B, $25, $2E, $1E, $42 ; ⎵[is]⎵blue,
#_1CA5AF: db $59, $1C, $25, $A2, $59, $90 ; ⎵cl[ear]⎵[and]
#_1CA5B5: db $76 ; line 3
#_1CA5B6: db $97, $1A, $2E, $2D, $22, $1F, $2E, $25 ; [be]autiful
#_1CA5BE: db $43 ; …
#_1CA5BF: db $7E ; wait for key
#_1CA5C0: db $73 ; scroll text
#_1CA5C1: db $E8, $59, $1F, $1E, $1E, $25, $59, $25 ; [You]⎵feel⎵l
#_1CA5C9: db $22, $24, $1E, $59, $B6, $59, $B5, $59 ; ike⎵[it]⎵[is]⎵
#_1CA5D1: db $AC, $B3, $DA ; [go][ing ][to]
#_1CA5D4: db $73 ; scroll text
#_1CA5D5: db $1A, $1B, $D2, $2B, $1B, $59, $E3, $59 ; ab[so]rb⎵[you]⎵
#_1CA5DD: db $B4, $DA, $59, $93, $28, $D8, $2B, $59 ; [in][to]⎵[an]o[the]r⎵
#_1CA5E5: db $30, $C8, $25, $1D, $43 ; w[or]ld…
#_1CA5EA: db $7F ; end of message

;===================================================================================================
; This is it!  The Master Sword!
; …  …  …
; No, this can't be it… Too bad.
;---------------------------------------------------------------------------------------------------
Message_006F:
#_1CA5EB: db $E7, $2C, $59, $B5, $59, $B6, $3E, $8A ; [Thi]s⎵[is]⎵[it]![  ]
#_1CA5F3: db $E6, $59, $0C, $92, $A1, $12, $30, $C8 ; [The]⎵M[ast][er ]Sw[or]
#_1CA5FB: db $1D, $3E ; d!
#_1CA5FD: db $75 ; line 2
#_1CA5FE: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CA603: db $76 ; line 3
#_1CA604: db $0D, $28, $42, $59, $D9, $2C, $59, $1C ; No,⎵[thi]s⎵c
#_1CA60C: db $93, $51, $2D, $59, $97, $59, $B6, $43 ; [an]'t⎵[be]⎵[it]…
#_1CA614: db $59, $13, $28, $28, $59, $96, $1D, $41 ; ⎵Too⎵[ba]d.
#_1CA61C: db $7F ; end of message

;===================================================================================================
; Suddenly, Sahasrahla contacts
; you telepathically…
; …  …  …
; [LINK], it is extraordinary
; that you won the Master Sword
; that makes evil retreat…
; With this shining sword, I
; believe you can deflect the
; wizard's evil powers.
; 
; The destiny of this land
; is in your hands.
; Please, [LINK]…
;---------------------------------------------------------------------------------------------------
Message_0070:
#_1CA61D: db $6B, $02 ; set window border
#_1CA61F: db $7A, $03 ; set draw speed
#_1CA621: db $12, $2E, $1D, $1D, $A5, $25, $32, $42 ; Sudd[en]ly,
#_1CA629: db $59, $12, $1A, $AE, $2B, $1A, $21, $BA ; ⎵Sa[has]rah[la]
#_1CA631: db $59, $1C, $C7, $2D, $1A, $1C, $2D, $2C ; ⎵c[on]tacts
#_1CA639: db $75 ; line 2
#_1CA63A: db $E3, $59, $2D, $1E, $25, $1E, $29, $94 ; [you]⎵telep[at]
#_1CA642: db $B0, $1C, $1A, $25, $25, $32, $43 ; [hi]cally…
#_1CA649: db $76 ; line 3
#_1CA64A: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CA64F: db $7E ; wait for key
#_1CA650: db $73 ; scroll text
#_1CA651: db $6A, $42, $59, $B6, $59, $B5, $59, $1E ; [LINK],⎵[it]⎵[is]⎵e
#_1CA659: db $31, $DB, $1A, $C8, $9E, $27, $1A, $2B ; x[tr]a[or][di]nar
#_1CA661: db $32 ; y
#_1CA662: db $73 ; scroll text
#_1CA663: db $D7, $2D, $59, $E3, $59, $30, $C7, $59 ; [tha]t⎵[you]⎵w[on]⎵
#_1CA66B: db $D8, $59, $0C, $92, $A1, $12, $30, $C8 ; [the]⎵M[ast][er ]Sw[or]
#_1CA673: db $1D ; d
#_1CA674: db $73 ; scroll text
#_1CA675: db $D7, $2D, $59, $BD, $24, $1E, $2C, $59 ; [tha]t⎵[ma]kes⎵
#_1CA67D: db $A7, $22, $25, $59, $CE, $DB, $1E, $94 ; [ev]il⎵[re][tr]e[at]
#_1CA685: db $43 ; …
#_1CA686: db $7E ; wait for key
#_1CA687: db $73 ; scroll text
#_1CA688: db $16, $B6, $21, $59, $D9, $2C, $59, $D1 ; W[it]h⎵[thi]s⎵[sh]
#_1CA690: db $B4, $B3, $2C, $30, $C8, $1D, $42, $59 ; [in][ing ]sw[or]d,⎵
#_1CA698: db $08 ; I
#_1CA699: db $73 ; scroll text
#_1CA69A: db $97, $25, $22, $A7, $1E, $59, $E3, $59 ; [be]li[ev]e⎵[you]⎵
#_1CA6A2: db $99, $1D, $1E, $1F, $25, $1E, $1C, $2D ; [can ]deflect
#_1CA6AA: db $59, $D8 ; ⎵[the]
#_1CA6AC: db $73 ; scroll text
#_1CA6AD: db $E2, $33, $1A, $2B, $1D, $8B, $A7, $22 ; [wi]zard['s ][ev]i
#_1CA6B5: db $25, $59, $CB, $A6, $2C, $41 ; l⎵[pow][er]s.
#_1CA6BB: db $7E ; wait for key
#_1CA6BC: db $73 ; scroll text
#_1CA6BD: db $73 ; scroll text
#_1CA6BE: db $E6, $59, $9D, $2D, $B4, $32, $59, $C6 ; [The]⎵[des]t[in]y⎵[of]
#_1CA6C6: db $59, $D9, $2C, $59, $BA, $27, $1D ; ⎵[thi]s⎵[la]nd
#_1CA6CD: db $73 ; scroll text
#_1CA6CE: db $B5, $59, $B4, $59, $E3, $2B, $59, $B1 ; [is]⎵[in]⎵[you]r⎵[ha]
#_1CA6D6: db $27, $1D, $2C, $41 ; nds.
#_1CA6DA: db $7E ; wait for key
#_1CA6DB: db $73 ; scroll text
#_1CA6DC: db $0F, $25, $1E, $1A, $D0, $42, $59, $6A ; Plea[se],⎵[LINK]
#_1CA6E4: db $43 ; …
#_1CA6E5: db $7F ; end of message

;===================================================================================================
; Heh heh heh…  Thank you!
; This is the Medicine of Life.
; Use it to regain your Life
; power.
;---------------------------------------------------------------------------------------------------
Message_0071:
#_1CA6E6: db $07, $1E, $21, $59, $21, $1E, $21, $59 ; Heh⎵heh⎵
#_1CA6EE: db $21, $1E, $21, $43, $8A, $E5, $27, $24 ; heh…[  ][Tha]nk
#_1CA6F6: db $59, $E3, $3E ; ⎵[you]!
#_1CA6F9: db $75 ; line 2
#_1CA6FA: db $E7, $2C, $59, $B5, $59, $D8, $59, $0C ; [Thi]s⎵[is]⎵[the]⎵M
#_1CA702: db $1E, $9E, $1C, $B4, $1E, $59, $C6, $59 ; e[di]c[in]e⎵[of]⎵
#_1CA70A: db $0B, $22, $1F, $1E, $41 ; Life.
#_1CA70F: db $76 ; line 3
#_1CA710: db $14, $D0, $59, $B6, $59, $DA, $59, $CE ; U[se]⎵[it]⎵[to]⎵[re]
#_1CA718: db $20, $8F, $59, $E3, $2B, $59, $0B, $22 ; g[ain]⎵[you]r⎵Li
#_1CA720: db $1F, $1E ; fe
#_1CA722: db $7E ; wait for key
#_1CA723: db $73 ; scroll text
#_1CA724: db $CB, $A6, $41 ; [pow][er].
#_1CA727: db $7F ; end of message

;===================================================================================================
; Heh heh heh…  Thank you!
; This is the Medicine of Magic.
; You can recharge your mystic
; energy with it.
;---------------------------------------------------------------------------------------------------
Message_0072:
#_1CA728: db $07, $1E, $21, $59, $21, $1E, $21, $59 ; Heh⎵heh⎵
#_1CA730: db $21, $1E, $21, $43, $8A, $E5, $27, $24 ; heh…[  ][Tha]nk
#_1CA738: db $59, $E3, $3E ; ⎵[you]!
#_1CA73B: db $75 ; line 2
#_1CA73C: db $E7, $2C, $59, $B5, $59, $D8, $59, $0C ; [Thi]s⎵[is]⎵[the]⎵M
#_1CA744: db $1E, $9E, $1C, $B4, $1E, $59, $C6, $59 ; e[di]c[in]e⎵[of]⎵
#_1CA74C: db $0C, $1A, $20, $22, $1C, $41 ; Magic.
#_1CA752: db $76 ; line 3
#_1CA753: db $E8, $59, $99, $CE, $1C, $B1, $2B, $20 ; [You]⎵[can ][re]c[ha]rg
#_1CA75B: db $1E, $59, $E3, $2B, $59, $26, $32, $D3 ; e⎵[you]r⎵my[st]
#_1CA763: db $22, $1C ; ic
#_1CA765: db $7E ; wait for key
#_1CA766: db $73 ; scroll text
#_1CA767: db $A5, $A6, $20, $32, $59, $DE, $59, $B6 ; [en][er]gy⎵[with]⎵[it]
#_1CA76F: db $41 ; .
#_1CA770: db $7F ; end of message

;===================================================================================================
; Heh heh heh…  Thank you!
; This is the Medicine of Life and
; Magic!  You can recover both!
;---------------------------------------------------------------------------------------------------
Message_0073:
#_1CA771: db $07, $1E, $21, $59, $21, $1E, $21, $59 ; Heh⎵heh⎵
#_1CA779: db $21, $1E, $21, $43, $8A, $E5, $27, $24 ; heh…[  ][Tha]nk
#_1CA781: db $59, $E3, $3E ; ⎵[you]!
#_1CA784: db $75 ; line 2
#_1CA785: db $E7, $2C, $59, $B5, $59, $D8, $59, $0C ; [Thi]s⎵[is]⎵[the]⎵M
#_1CA78D: db $1E, $9E, $1C, $B4, $1E, $59, $C6, $59 ; e[di]c[in]e⎵[of]⎵
#_1CA795: db $0B, $22, $1F, $1E, $59, $90 ; Life⎵[and]
#_1CA79B: db $76 ; line 3
#_1CA79C: db $0C, $1A, $20, $22, $1C, $3E, $8A, $E8 ; Magic![  ][You]
#_1CA7A4: db $59, $99, $CE, $1C, $28, $DD, $59, $98 ; ⎵[can ][re]co[ver]⎵[bo]
#_1CA7AC: db $2D, $21, $3E ; th!
#_1CA7AF: db $7F ; end of message

;===================================================================================================
; You borrowed the Bug Catching
; Net!  There may be some other
; things you can catch with it,
; too.
;---------------------------------------------------------------------------------------------------
Message_0074:
#_1CA7B0: db $E8, $59, $98, $2B, $2B, $28, $E0, $1D ; [You]⎵[bo]rro[we]d
#_1CA7B8: db $59, $D8, $59, $01, $2E, $20, $59, $02 ; ⎵[the]⎵Bug⎵C
#_1CA7C0: db $94, $1C, $B0, $27, $20 ; [at]c[hi]ng
#_1CA7C5: db $75 ; line 2
#_1CA7C6: db $0D, $1E, $2D, $3E, $8A, $E6, $CD, $BD ; Net![  ][The][re ][ma]
#_1CA7CE: db $32, $59, $97, $59, $CF, $59, $28, $D8 ; y⎵[be]⎵[some]⎵o[the]
#_1CA7D6: db $2B ; r
#_1CA7D7: db $76 ; line 3
#_1CA7D8: db $D5, $20, $2C, $59, $E3, $59, $99, $1C ; [thin]gs⎵[you]⎵[can ]c
#_1CA7E0: db $94, $1C, $21, $59, $DE, $59, $B6, $42 ; [at]ch⎵[with]⎵[it],
#_1CA7E8: db $7E ; wait for key
#_1CA7E9: db $73 ; scroll text
#_1CA7EA: db $DA, $28, $41 ; [to]o.
#_1CA7ED: db $7F ; end of message

;===================================================================================================
; You found the Blue Mail!
; This armor reduces the damage
; that you take from enemies!
;---------------------------------------------------------------------------------------------------
Message_0075:
#_1CA7EE: db $E8, $59, $1F, $C4, $59, $D8, $59, $01 ; [You]⎵f[ound]⎵[the]⎵B
#_1CA7F6: db $25, $2E, $1E, $59, $0C, $1A, $22, $25 ; lue⎵Mail
#_1CA7FE: db $3E ; !
#_1CA7FF: db $75 ; line 2
#_1CA800: db $E7, $2C, $59, $1A, $2B, $26, $C8, $59 ; [Thi]s⎵arm[or]⎵
#_1CA808: db $CE, $1D, $2E, $1C, $1E, $2C, $59, $D8 ; [re]duces⎵[the]
#_1CA810: db $59, $1D, $1A, $BD, $20, $1E ; ⎵da[ma]ge
#_1CA816: db $76 ; line 3
#_1CA817: db $D7, $2D, $59, $E3, $59, $2D, $1A, $24 ; [tha]t⎵[you]⎵tak
#_1CA81F: db $1E, $59, $A9, $26, $59, $A5, $1E, $26 ; e⎵[fro]m⎵[en]em
#_1CA827: db $22, $1E, $2C, $3E ; ies!
#_1CA82B: db $7F ; end of message

;===================================================================================================
; You found the Red Mail!
; This provides even better
; protection than the Blue Mail!
;---------------------------------------------------------------------------------------------------
Message_0076:
#_1CA82C: db $E8, $59, $1F, $C4, $59, $D8, $59, $11 ; [You]⎵f[ound]⎵[the]⎵R
#_1CA834: db $A4, $0C, $1A, $22, $25, $3E ; [ed ]Mail!
#_1CA83A: db $75 ; line 2
#_1CA83B: db $E7, $2C, $59, $CC, $2F, $22, $9D, $59 ; [Thi]s⎵[pro]vi[des]⎵
#_1CA843: db $A7, $A0, $97, $2D, $D6 ; [ev][en ][be]t[ter]
#_1CA848: db $76 ; line 3
#_1CA849: db $CC, $2D, $1E, $1C, $2D, $22, $C7, $59 ; [pro]tecti[on]⎵
#_1CA851: db $D7, $27, $59, $D8, $59, $01, $25, $2E ; [tha]n⎵[the]⎵Blu
#_1CA859: db $1E, $59, $0C, $1A, $22, $25, $3E ; e⎵Mail!
#_1CA860: db $7F ; end of message

;===================================================================================================
; Great!  Your sword is stronger!
; You can feel the sheer power
; flowing through your body!
;---------------------------------------------------------------------------------------------------
Message_0077:
#_1CA861: db $06, $CE, $94, $3E, $8A, $E8, $2B, $59 ; G[re][at]![  ][You]r⎵
#_1CA869: db $2C, $30, $C8, $1D, $59, $B5, $59, $D3 ; sw[or]d⎵[is]⎵[st]
#_1CA871: db $2B, $C7, $20, $A6, $3E ; r[on]g[er]!
#_1CA876: db $75 ; line 2
#_1CA877: db $E8, $59, $99, $1F, $1E, $1E, $25, $59 ; [You]⎵[can ]feel⎵
#_1CA87F: db $D8, $59, $D1, $1E, $A1, $CB, $A6 ; [the]⎵[sh]e[er ][pow][er]
#_1CA886: db $76 ; line 3
#_1CA887: db $1F, $BB, $E2, $27, $20, $59, $2D, $21 ; f[lo][wi]ng⎵th
#_1CA88F: db $2B, $28, $2E, $20, $21, $59, $E3, $2B ; rough⎵[you]r
#_1CA897: db $59, $98, $1D, $32, $3E ; ⎵[bo]dy!
#_1CA89C: db $7F ; end of message

;===================================================================================================
; You found the Mirror Shield!
; You can now reflect beams
; that your old shield
; couldn't block!
;---------------------------------------------------------------------------------------------------
Message_0078:
#_1CA89D: db $E8, $59, $1F, $C4, $59, $D8, $59, $0C ; [You]⎵f[ound]⎵[the]⎵M
#_1CA8A5: db $22, $2B, $2B, $C8, $59, $12, $B0, $1E ; irr[or]⎵S[hi]e
#_1CA8AD: db $25, $1D, $3E ; ld!
#_1CA8B0: db $75 ; line 2
#_1CA8B1: db $E8, $59, $99, $27, $28, $30, $59, $CE ; [You]⎵[can ]now⎵[re]
#_1CA8B9: db $1F, $25, $1E, $1C, $2D, $59, $97, $1A ; flect⎵[be]a
#_1CA8C1: db $26, $2C ; ms
#_1CA8C3: db $76 ; line 3
#_1CA8C4: db $D7, $2D, $59, $E3, $2B, $59, $28, $25 ; [tha]t⎵[you]r⎵ol
#_1CA8CC: db $1D, $59, $D1, $22, $1E, $25, $1D ; d⎵[sh]ield
#_1CA8D3: db $7E ; wait for key
#_1CA8D4: db $73 ; scroll text
#_1CA8D5: db $1C, $28, $2E, $25, $1D, $C0, $1B, $BB ; could[n't ]b[lo]
#_1CA8DD: db $9C, $3E ; [ck]!
#_1CA8DF: db $7F ; end of message

;===================================================================================================
; You got the Cane Of Byrna!
; If you swing it once, a ring of
; light will protect you!
;---------------------------------------------------------------------------------------------------
Message_0079:
#_1CA8E0: db $E8, $59, $AC, $2D, $59, $D8, $59, $02 ; [You]⎵[go]t⎵[the]⎵C
#_1CA8E8: db $93, $1E, $59, $0E, $1F, $59, $01, $32 ; [an]e⎵Of⎵By
#_1CA8F0: db $2B, $27, $1A, $3E ; rna!
#_1CA8F4: db $75 ; line 2
#_1CA8F5: db $08, $1F, $59, $E3, $59, $2C, $E2, $27 ; If⎵[you]⎵s[wi]n
#_1CA8FD: db $20, $59, $B6, $59, $C7, $1C, $1E, $42 ; g⎵[it]⎵[on]ce,
#_1CA905: db $59, $1A, $59, $2B, $B3, $C6 ; ⎵a⎵r[ing ][of]
#_1CA90B: db $76 ; line 3
#_1CA90C: db $25, $B2, $E2, $25, $25, $59, $CC, $2D ; l[ight ][wi]ll⎵[pro]t
#_1CA914: db $1E, $1C, $2D, $59, $E3, $3E ; ect⎵[you]!
#_1CA91A: db $7F ; end of message

;===================================================================================================
; Eh?  It's locked!
; If you had the Big Key, you
; might be able to open it!
;---------------------------------------------------------------------------------------------------
Message_007A:
#_1CA91B: db $04, $21, $3F, $8A, $08, $2D, $8B, $BB ; Eh?[  ]It['s ][lo]
#_1CA923: db $9C, $1E, $1D, $3E ; [ck]ed!
#_1CA927: db $75 ; line 2
#_1CA928: db $08, $1F, $59, $E3, $59, $B1, $1D, $59 ; If⎵[you]⎵[ha]d⎵
#_1CA930: db $D8, $59, $01, $22, $20, $59, $0A, $1E ; [the]⎵Big⎵Ke
#_1CA938: db $32, $42, $59, $E3 ; y,⎵[you]
#_1CA93C: db $76 ; line 3
#_1CA93D: db $26, $B2, $97, $59, $1A, $95, $59, $DA ; m[ight ][be]⎵a[ble]⎵[to]
#_1CA945: db $59, $C3, $59, $B6, $3E ; ⎵[open]⎵[it]!
#_1CA94A: db $7F ; end of message

;===================================================================================================
; You are short on Magic Power!
; You can't use this item now.
; Watch your Magic Meter!
;---------------------------------------------------------------------------------------------------
Message_007B:
#_1CA94B: db $E8, $59, $8D, $D1, $C8, $2D, $59, $C7 ; [You]⎵[are ][sh][or]t⎵[on]
#_1CA953: db $59, $0C, $1A, $20, $22, $1C, $59, $0F ; ⎵Magic⎵P
#_1CA95B: db $28, $E0, $2B, $3E ; o[we]r!
#_1CA95F: db $75 ; line 2
#_1CA960: db $E8, $59, $1C, $93, $51, $2D, $59, $2E ; [You]⎵c[an]'t⎵u
#_1CA968: db $D0, $59, $D9, $2C, $59, $B6, $1E, $26 ; [se]⎵[thi]s⎵[it]em
#_1CA970: db $59, $27, $28, $30, $41 ; ⎵now.
#_1CA975: db $76 ; line 3
#_1CA976: db $16, $94, $1C, $21, $59, $E3, $2B, $59 ; W[at]ch⎵[you]r⎵
#_1CA97E: db $0C, $1A, $20, $22, $1C, $59, $0C, $1E ; Magic⎵Me
#_1CA986: db $D6, $3E ; [ter]!
#_1CA988: db $7F ; end of message

;===================================================================================================
; He gives you the Pegasus
; Shoes!  Now you can execute a
; devastating dash attack!
; (Hold the Ⓐ Button
; for a short time.)
;---------------------------------------------------------------------------------------------------
Message_007C:
#_1CA989: db $07, $1E, $59, $20, $22, $2F, $1E, $2C ; He⎵gives
#_1CA991: db $59, $E3, $59, $D8, $59, $0F, $1E, $20 ; ⎵[you]⎵[the]⎵Peg
#_1CA999: db $1A, $2C, $2E, $2C ; asus
#_1CA99D: db $75 ; line 2
#_1CA99E: db $12, $21, $28, $1E, $2C, $3E, $8A, $0D ; Shoes![  ]N
#_1CA9A6: db $28, $30, $59, $E3, $59, $99, $1E, $31 ; ow⎵[you]⎵[can ]ex
#_1CA9AE: db $1E, $1C, $2E, $2D, $1E, $59, $1A ; ecute⎵a
#_1CA9B5: db $76 ; line 3
#_1CA9B6: db $1D, $A7, $92, $94, $B3, $1D, $1A, $D1 ; d[ev][ast][at][ing ]da[sh]
#_1CA9BE: db $59, $94, $2D, $1A, $9C, $3E ; ⎵[at]ta[ck]!
#_1CA9C4: db $7E ; wait for key
#_1CA9C5: db $73 ; scroll text
#_1CA9C6: db $45, $07, $28, $25, $1D, $59, $D8, $59 ; (Hold⎵[the]⎵
#_1CA9CE: db $5B, $59, $01, $2E, $2D, $DA, $27 ; Ⓐ⎵But[to]n
#_1CA9D5: db $73 ; scroll text
#_1CA9D6: db $A8, $59, $1A, $59, $D1, $C8, $2D, $59 ; [for]⎵a⎵[sh][or]t⎵
#_1CA9DE: db $2D, $22, $BE, $41, $46 ; ti[me].)
#_1CA9E3: db $7F ; end of message

;===================================================================================================
; Wow!  I haven't seen a normal
; person in a few hundred years!
; Let me talk to you for a while.
;---------------------------------------------------------------------------------------------------
Message_007D:
#_1CA9E4: db $16, $28, $30, $3E, $8A, $08, $59, $AD ; Wow![  ]I⎵[have]
#_1CA9EC: db $C0, $D0, $A0, $1A, $59, $27, $C8, $BD ; [n't ][se][en ]a⎵n[or][ma]
#_1CA9F4: db $25 ; l
#_1CA9F5: db $75 ; line 2
#_1CA9F6: db $C9, $D2, $27, $59, $B4, $59, $1A, $59 ; [per][so]n⎵[in]⎵a⎵
#_1CA9FE: db $1F, $1E, $30, $59, $21, $2E, $27, $1D ; few⎵hund
#_1CAA06: db $CE, $1D, $59, $32, $A2, $2C, $3E ; [re]d⎵y[ear]s!
#_1CAA0D: db $76 ; line 3
#_1CAA0E: db $0B, $1E, $2D, $59, $BE, $59, $2D, $1A ; Let⎵[me]⎵ta
#_1CAA16: db $25, $24, $59, $DA, $59, $E3, $59, $A8 ; lk⎵[to]⎵[you]⎵[for]
#_1CAA1E: db $59, $1A, $59, $E1, $22, $25, $1E, $41 ; ⎵a⎵[wh]ile.
#_1CAA26: db $7F ; end of message

;===================================================================================================
; Do you know about the
; Gargoyle statue in the village?
; People say they can hear a girl
; calling for help from under the
; statue.  Isn't that a strange
; story…
;---------------------------------------------------------------------------------------------------
Message_007E:
#_1CAA27: db $03, $28, $59, $E3, $59, $B8, $59, $1A ; Do⎵[you]⎵[know]⎵a
#_1CAA2F: db $98, $2E, $2D, $59, $D8 ; [bo]ut⎵[the]
#_1CAA34: db $75 ; line 2
#_1CAA35: db $06, $1A, $2B, $AC, $32, $25, $1E, $59 ; Gar[go]yle⎵
#_1CAA3D: db $D3, $94, $2E, $1E, $59, $B4, $59, $D8 ; [st][at]ue⎵[in]⎵[the]
#_1CAA45: db $59, $2F, $22, $25, $BA, $20, $1E, $3F ; ⎵vil[la]ge?
#_1CAA4D: db $76 ; line 3
#_1CAA4E: db $0F, $1E, $28, $CA, $59, $2C, $1A, $32 ; Peo[ple]⎵say
#_1CAA56: db $59, $D8, $32, $59, $99, $21, $A2, $59 ; ⎵[the]y⎵[can ]h[ear]⎵
#_1CAA5E: db $1A, $59, $20, $22, $2B, $25 ; a⎵girl
#_1CAA64: db $7E ; wait for key
#_1CAA65: db $73 ; scroll text
#_1CAA66: db $1C, $1A, $25, $25, $B3, $A8, $59, $21 ; call[ing ][for]⎵h
#_1CAA6E: db $1E, $25, $29, $59, $A9, $26, $59, $2E ; elp⎵[fro]m⎵u
#_1CAA76: db $27, $1D, $A1, $D8 ; nd[er ][the]
#_1CAA7A: db $73 ; scroll text
#_1CAA7B: db $D3, $94, $2E, $1E, $41, $8A, $08, $2C ; [st][at]ue.[  ]Is
#_1CAA83: db $C0, $D7, $2D, $59, $1A, $59, $D3, $2B ; [n't ][tha]t⎵a⎵[st]r
#_1CAA8B: db $93, $20, $1E ; [an]ge
#_1CAA8E: db $73 ; scroll text
#_1CAA8F: db $D3, $C8, $32, $43 ; [st][or]y…
#_1CAA93: db $7F ; end of message

;===================================================================================================
; Surprisingly, the Triforce
; created this world to fulfill
; Ganon's wish.
; What is Ganon's wish,
; you ask?  It is to rule the
; entire cosmos!  Don't you think
; it might be possible with the
; power of the Triforce
; behind you?
;---------------------------------------------------------------------------------------------------
Message_007F:
#_1CAA94: db $12, $2E, $2B, $29, $2B, $B5, $B4, $20 ; Surpr[is][in]g
#_1CAA9C: db $25, $32, $42, $59, $D8, $59, $13, $2B ; ly,⎵[the]⎵Tr
#_1CAAA4: db $22, $A8, $1C, $1E ; i[for]ce
#_1CAAA8: db $75 ; line 2
#_1CAAA9: db $1C, $CE, $94, $A4, $D9, $2C, $59, $30 ; c[re][at][ed ][thi]s⎵w
#_1CAAB1: db $C8, $25, $1D, $59, $DA, $59, $1F, $2E ; [or]ld⎵[to]⎵fu
#_1CAAB9: db $25, $1F, $22, $25, $25 ; lfill
#_1CAABE: db $76 ; line 3
#_1CAABF: db $06, $93, $C7, $8B, $E2, $D1, $41 ; G[an][on]['s ][wi][sh].
#_1CAAC6: db $7E ; wait for key
#_1CAAC7: db $73 ; scroll text
#_1CAAC8: db $16, $B1, $2D, $59, $B5, $59, $06, $93 ; W[ha]t⎵[is]⎵G[an]
#_1CAAD0: db $C7, $8B, $E2, $D1, $42 ; [on]['s ][wi][sh],
#_1CAAD5: db $73 ; scroll text
#_1CAAD6: db $E3, $59, $1A, $2C, $24, $3F, $8A, $08 ; [you]⎵ask?[  ]I
#_1CAADE: db $2D, $59, $B5, $59, $DA, $59, $2B, $2E ; t⎵[is]⎵[to]⎵ru
#_1CAAE6: db $25, $1E, $59, $D8 ; le⎵[the]
#_1CAAEA: db $73 ; scroll text
#_1CAAEB: db $A3, $22, $CD, $1C, $28, $2C, $26, $28 ; [ent]i[re ]cosmo
#_1CAAF3: db $2C, $3E, $8A, $03, $C7, $51, $2D, $59 ; s![  ]D[on]'t⎵
#_1CAAFB: db $E3, $59, $D5, $24 ; [you]⎵[thin]k
#_1CAAFF: db $7E ; wait for key
#_1CAB00: db $73 ; scroll text
#_1CAB01: db $B6, $59, $26, $B2, $97, $59, $29, $28 ; [it]⎵m[ight ][be]⎵po
#_1CAB09: db $2C, $2C, $22, $95, $59, $DE, $59, $D8 ; ssi[ble]⎵[with]⎵[the]
#_1CAB11: db $73 ; scroll text
#_1CAB12: db $CB, $A1, $C6, $59, $D8, $59, $13, $2B ; [pow][er ][of]⎵[the]⎵Tr
#_1CAB1A: db $22, $A8, $1C, $1E ; i[for]ce
#_1CAB1E: db $73 ; scroll text
#_1CAB1F: db $97, $B0, $27, $1D, $59, $E3, $3F ; [be][hi]nd⎵[you]?
#_1CAB26: db $7F ; end of message

;===================================================================================================
; I once lived in the Lost Woods,
; until the day I wandered into a
; magic transporter…
; The power of the Dark World
; quickly turned me into this
; tree shape…
; I guess the two forests are
; connected with each other…
;---------------------------------------------------------------------------------------------------
Message_0080:
#_1CAB27: db $08, $59, $C7, $1C, $1E, $59, $25, $22 ; I⎵[on]ce⎵li
#_1CAB2F: db $2F, $A4, $B4, $59, $D8, $59, $0B, $28 ; v[ed ][in]⎵[the]⎵Lo
#_1CAB37: db $D3, $59, $16, $28, $28, $1D, $2C, $42 ; [st]⎵Woods,
#_1CAB3F: db $75 ; line 2
#_1CAB40: db $2E, $27, $2D, $22, $25, $59, $D8, $59 ; until⎵[the]⎵
#_1CAB48: db $1D, $1A, $32, $59, $08, $59, $DF, $27 ; day⎵I⎵[wa]n
#_1CAB50: db $1D, $A6, $A4, $B4, $DA, $59, $1A ; d[er][ed ][in][to]⎵a
#_1CAB57: db $76 ; line 3
#_1CAB58: db $BD, $20, $22, $1C, $59, $DB, $93, $2C ; [ma]gic⎵[tr][an]s
#_1CAB60: db $29, $C8, $D6, $43 ; p[or][ter]…
#_1CAB64: db $7E ; wait for key
#_1CAB65: db $73 ; scroll text
#_1CAB66: db $E6, $59, $CB, $A1, $C6, $59, $D8, $59 ; [The]⎵[pow][er ][of]⎵[the]⎵
#_1CAB6E: db $03, $1A, $2B, $24, $59, $16, $C8, $25 ; Dark⎵W[or]l
#_1CAB76: db $1D ; d
#_1CAB77: db $73 ; scroll text
#_1CAB78: db $2A, $2E, $22, $9C, $B9, $2D, $2E, $2B ; qui[ck][ly ]tur
#_1CAB80: db $27, $A4, $BE, $59, $B4, $DA, $59, $D9 ; n[ed ][me]⎵[in][to]⎵[thi]
#_1CAB88: db $2C ; s
#_1CAB89: db $73 ; scroll text
#_1CAB8A: db $DB, $1E, $1E, $59, $D1, $1A, $29, $1E ; [tr]ee⎵[sh]ape
#_1CAB92: db $43 ; …
#_1CAB93: db $7E ; wait for key
#_1CAB94: db $73 ; scroll text
#_1CAB95: db $08, $59, $20, $2E, $1E, $2C, $2C, $59 ; I⎵guess⎵
#_1CAB9D: db $D8, $59, $2D, $30, $28, $59, $A8, $1E ; [the]⎵two⎵[for]e
#_1CABA5: db $D3, $2C, $59, $1A, $CE ; [st]s⎵a[re]
#_1CABAA: db $73 ; scroll text
#_1CABAB: db $1C, $C7, $27, $1E, $1C, $2D, $A4, $DE ; c[on]nect[ed ][with]
#_1CABB3: db $59, $1E, $1A, $1C, $21, $59, $28, $D8 ; ⎵each⎵o[the]
#_1CABBB: db $2B, $43 ; r…
#_1CABBD: db $7F ; end of message

;===================================================================================================
; I heard that using Bombs is the
; best way to defeat the
; one-eyed giants.
; That's all I know!
;---------------------------------------------------------------------------------------------------
Message_0081:
#_1CABBE: db $08, $59, $21, $A2, $1D, $59, $D7, $2D ; I⎵h[ear]d⎵[tha]t
#_1CABC6: db $59, $2E, $2C, $B3, $01, $28, $26, $1B ; ⎵us[ing ]Bomb
#_1CABCE: db $2C, $59, $B5, $59, $D8 ; s⎵[is]⎵[the]
#_1CABD3: db $75 ; line 2
#_1CABD4: db $97, $D3, $59, $DF, $32, $59, $DA, $59 ; [be][st]⎵[wa]y⎵[to]⎵
#_1CABDC: db $1D, $1E, $1F, $1E, $91, $D8 ; defe[at ][the]
#_1CABE2: db $76 ; line 3
#_1CABE3: db $C7, $1E, $40, $1E, $32, $A4, $20, $22 ; [on]e-ey[ed ]gi
#_1CABEB: db $93, $2D, $2C, $41 ; [an]ts.
#_1CABEF: db $7E ; wait for key
#_1CABF0: db $73 ; scroll text
#_1CABF1: db $E5, $2D, $8B, $8E, $08, $59, $B8, $3E ; [Tha]t['s ][all ]I⎵[know]!
#_1CABF9: db $7F ; end of message

;===================================================================================================
; Quit bothering me!  And watch
; where you're going when you
; dash around!
;---------------------------------------------------------------------------------------------------
Message_0082:
#_1CABFA: db $10, $2E, $B6, $59, $98, $D8, $2B, $B3 ; Qu[it]⎵[bo][the]r[ing ]
#_1CAC02: db $BE, $3E, $8A, $00, $27, $1D, $59, $DF ; [me]![  ]And⎵[wa]
#_1CAC0A: db $2D, $1C, $21 ; tch
#_1CAC0D: db $75 ; line 2
#_1CAC0E: db $E1, $A6, $1E, $59, $E3, $51, $CD, $AC ; [wh][er]e⎵[you]'[re ][go]
#_1CAC16: db $B3, $E1, $A0, $E3 ; [ing ][wh][en ][you]
#_1CAC1A: db $76 ; line 3
#_1CAC1B: db $1D, $1A, $D1, $59, $1A, $2B, $C4, $3E ; da[sh]⎵ar[ound]!
#_1CAC23: db $7F ; end of message

;===================================================================================================
; You got the Pendant Of Power!
; You have now collected all
; three Pendants!  Go forth now
; to the Lost Woods for the
; Master Sword!
;---------------------------------------------------------------------------------------------------
Message_0083:
#_1CAC24: db $E8, $59, $AC, $2D, $59, $D8, $59, $0F ; [You]⎵[go]t⎵[the]⎵P
#_1CAC2C: db $A5, $1D, $93, $2D, $59, $0E, $1F, $59 ; [en]d[an]t⎵Of⎵
#_1CAC34: db $0F, $28, $E0, $2B, $3E ; Po[we]r!
#_1CAC39: db $75 ; line 2
#_1CAC3A: db $E8, $59, $AD, $59, $27, $28, $30, $59 ; [You]⎵[have]⎵now⎵
#_1CAC42: db $1C, $28, $25, $25, $1E, $1C, $2D, $A4 ; collect[ed ]
#_1CAC4A: db $1A, $25, $25 ; all
#_1CAC4D: db $76 ; line 3
#_1CAC4E: db $2D, $21, $CE, $1E, $59, $0F, $A5, $1D ; th[re]e⎵P[en]d
#_1CAC56: db $93, $2D, $2C, $3E, $8A, $06, $28, $59 ; [an]ts![  ]Go⎵
#_1CAC5E: db $A8, $2D, $21, $59, $27, $28, $30 ; [for]th⎵now
#_1CAC65: db $7E ; wait for key
#_1CAC66: db $73 ; scroll text
#_1CAC67: db $DA, $59, $D8, $59, $0B, $28, $D3, $59 ; [to]⎵[the]⎵Lo[st]⎵
#_1CAC6F: db $16, $28, $28, $1D, $2C, $59, $A8, $59 ; Woods⎵[for]⎵
#_1CAC77: db $D8 ; [the]
#_1CAC78: db $73 ; scroll text
#_1CAC79: db $0C, $92, $A1, $12, $30, $C8, $1D, $3E ; M[ast][er ]Sw[or]d!
#_1CAC81: db $7F ; end of message

;===================================================================================================
; You got the Pendant Of Wisdom!
; Again your power has increased!
; Now, go for the last one!
;---------------------------------------------------------------------------------------------------
Message_0084:
#_1CAC82: db $E8, $59, $AC, $2D, $59, $D8, $59, $0F ; [You]⎵[go]t⎵[the]⎵P
#_1CAC8A: db $A5, $1D, $93, $2D, $59, $0E, $1F, $59 ; [en]d[an]t⎵Of⎵
#_1CAC92: db $16, $B5, $9F, $26, $3E ; W[is][do]m!
#_1CAC97: db $75 ; line 2
#_1CAC98: db $00, $20, $8F, $59, $E3, $2B, $59, $CB ; Ag[ain]⎵[you]r⎵[pow]
#_1CACA0: db $A1, $AE, $59, $B4, $1C, $CE, $1A, $D0 ; [er ][has]⎵[in]c[re]a[se]
#_1CACA8: db $1D, $3E ; d!
#_1CACAA: db $76 ; line 3
#_1CACAB: db $0D, $28, $30, $42, $59, $AC, $59, $A8 ; Now,⎵[go]⎵[for]
#_1CACB3: db $59, $D8, $59, $BA, $D3, $59, $C7, $1E ; ⎵[the]⎵[la][st]⎵[on]e
#_1CACBB: db $3E ; !
#_1CACBC: db $7F ; end of message

;===================================================================================================
; Well howdy, Light Worlder!
; You look like a straight
; shooter…  Want to try your
; skill in my shooting gallery?
; I'll give you five shots for 20
; Rupees.  If you're as sharp
; as I think you are, you stand
; to rake in the Rupees.
; How about it, stranger?
;     > Play
;        No way
;---------------------------------------------------------------------------------------------------
Message_0085:
#_1CACBD: db $16, $1E, $25, $25, $59, $21, $28, $30 ; Well⎵how
#_1CACC5: db $1D, $32, $42, $59, $0B, $B2, $16, $C8 ; dy,⎵L[ight ]W[or]
#_1CACCD: db $25, $1D, $A6, $3E ; ld[er]!
#_1CACD1: db $75 ; line 2
#_1CACD2: db $E8, $59, $BB, $28, $24, $59, $25, $22 ; [You]⎵[lo]ok⎵li
#_1CACDA: db $24, $1E, $59, $1A, $59, $D3, $2B, $1A ; ke⎵a⎵[st]ra
#_1CACE2: db $22, $20, $21, $2D ; ight
#_1CACE6: db $76 ; line 3
#_1CACE7: db $D1, $28, $28, $D6, $43, $8A, $16, $93 ; [sh]oo[ter]…[  ]W[an]
#_1CACEF: db $2D, $59, $DA, $59, $DB, $32, $59, $E3 ; t⎵[to]⎵[tr]y⎵[you]
#_1CACF7: db $2B ; r
#_1CACF8: db $7E ; wait for key
#_1CACF9: db $73 ; scroll text
#_1CACFA: db $2C, $24, $22, $25, $25, $59, $B4, $59 ; skill⎵[in]⎵
#_1CAD02: db $26, $32, $59, $D1, $28, $28, $2D, $B3 ; my⎵[sh]oot[ing ]
#_1CAD0A: db $20, $1A, $25, $25, $A6, $32, $3F ; gall[er]y?
#_1CAD11: db $73 ; scroll text
#_1CAD12: db $08, $51, $25, $25, $59, $AA, $E3, $59 ; I'll⎵[give ][you]⎵
#_1CAD1A: db $1F, $22, $2F, $1E, $59, $D1, $28, $2D ; five⎵[sh]ot
#_1CAD22: db $2C, $59, $A8, $59, $36, $34 ; s⎵[for]⎵20
#_1CAD28: db $73 ; scroll text
#_1CAD29: db $11, $DC, $1E, $1E, $2C, $41, $8A, $08 ; R[up]ees.[  ]I
#_1CAD31: db $1F, $59, $E3, $51, $CD, $1A, $2C, $59 ; f⎵[you]'[re ]as⎵
#_1CAD39: db $D1, $1A, $2B, $29 ; [sh]arp
#_1CAD3D: db $7E ; wait for key
#_1CAD3E: db $73 ; scroll text
#_1CAD3F: db $1A, $2C, $59, $08, $59, $D5, $24, $59 ; as⎵I⎵[thin]k⎵
#_1CAD47: db $E3, $59, $1A, $CE, $42, $59, $E3, $59 ; [you]⎵a[re],⎵[you]⎵
#_1CAD4F: db $D3, $90 ; [st][and]
#_1CAD51: db $73 ; scroll text
#_1CAD52: db $DA, $59, $2B, $1A, $24, $1E, $59, $B4 ; [to]⎵rake⎵[in]
#_1CAD5A: db $59, $D8, $59, $11, $DC, $1E, $1E, $2C ; ⎵[the]⎵R[up]ees
#_1CAD62: db $41 ; .
#_1CAD63: db $7E ; wait for key
#_1CAD64: db $73 ; scroll text
#_1CAD65: db $07, $28, $30, $59, $1A, $98, $2E, $2D ; How⎵a[bo]ut
#_1CAD6D: db $59, $B6, $42, $59, $D3, $2B, $93, $20 ; ⎵[it],⎵[st]r[an]g
#_1CAD75: db $A6, $3F ; [er]?
#_1CAD77: db $73 ; scroll text
#_1CAD78: db $88, $44, $59, $0F, $BA, $32 ; [    ]>⎵P[la]y
#_1CAD7E: db $73 ; scroll text
#_1CAD7F: db $88, $89, $0D, $28, $59, $DF, $32 ; [    ][   ]No⎵[wa]y
#_1CAD86: db $68 ; choose 2 indented
#_1CAD87: db $7F ; end of message

;===================================================================================================
; All right!  Aim carefully!
; Ready?  GO!
;---------------------------------------------------------------------------------------------------
Message_0086:
#_1CAD88: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_1CAD90: db $2D, $3E, $8A, $00, $22, $26, $59, $1C ; t![  ]Aim⎵c
#_1CAD98: db $1A, $CE, $1F, $2E, $25, $25, $32, $3E ; a[re]fully!
#_1CADA0: db $75 ; line 2
#_1CADA1: db $11, $1E, $1A, $1D, $32, $3F, $8A, $06 ; Ready?[  ]G
#_1CADA9: db $0E, $3E ; O!
#_1CADAB: db $7F ; end of message

;===================================================================================================
; Well little partner, you can
; turn yourself right around and
; leave the same way you 
; came in.
; See you later!  Have a nice day!
;---------------------------------------------------------------------------------------------------
Message_0087:
#_1CADAC: db $16, $1E, $25, $25, $59, $25, $B6, $2D ; Well⎵l[it]t
#_1CADB4: db $25, $1E, $59, $29, $1A, $2B, $2D, $27 ; le⎵partn
#_1CADBC: db $A6, $42, $59, $E3, $59, $1C, $93 ; [er],⎵[you]⎵c[an]
#_1CADC3: db $75 ; line 2
#_1CADC4: db $2D, $2E, $2B, $27, $59, $E3, $2B, $D0 ; turn⎵[you]r[se]
#_1CADCC: db $25, $1F, $59, $2B, $B2, $1A, $2B, $C4 ; lf⎵r[ight ]ar[ound]
#_1CADD4: db $59, $90 ; ⎵[and]
#_1CADD6: db $76 ; line 3
#_1CADD7: db $25, $1E, $1A, $2F, $1E, $59, $D8, $59 ; leave⎵[the]⎵
#_1CADDF: db $2C, $1A, $BE, $59, $DF, $32, $59, $E3 ; sa[me]⎵[wa]y⎵[you]
#_1CADE7: db $59 ; ⎵
#_1CADE8: db $7E ; wait for key
#_1CADE9: db $73 ; scroll text
#_1CADEA: db $1C, $1A, $BE, $59, $B4, $41 ; ca[me]⎵[in].
#_1CADF0: db $73 ; scroll text
#_1CADF1: db $12, $1E, $1E, $59, $E3, $59, $BA, $D6 ; See⎵[you]⎵[la][ter]
#_1CADF9: db $3E, $8A, $07, $1A, $2F, $1E, $59, $1A ; ![  ]Have⎵a
#_1CAE01: db $59, $27, $22, $1C, $1E, $59, $1D, $1A ; ⎵nice⎵da
#_1CAE09: db $32, $3E ; y!
#_1CAE0B: db $7F ; end of message

;===================================================================================================
; Want to shoot again?
;     > Continue
;        Quit
;---------------------------------------------------------------------------------------------------
Message_0088:
#_1CAE0C: db $16, $93, $2D, $59, $DA, $59, $D1, $28 ; W[an]t⎵[to]⎵[sh]o
#_1CAE14: db $28, $2D, $59, $1A, $20, $8F, $3F ; ot⎵ag[ain]?
#_1CAE1B: db $75 ; line 2
#_1CAE1C: db $88, $44, $59, $02, $C7, $2D, $B4, $2E ; [    ]>⎵C[on]t[in]u
#_1CAE24: db $1E ; e
#_1CAE25: db $76 ; line 3
#_1CAE26: db $88, $89, $10, $2E, $B6 ; [    ][   ]Qu[it]
#_1CAE2B: db $68 ; choose 2 indented
#_1CAE2C: db $7F ; end of message

;===================================================================================================
; --POND OF HAPPINESS--
; Throw some Rupees in and your
; wishes will surely come true.
; Do you want to throw Rupees?
;     > Throw a few
;        Don't feel like it
;---------------------------------------------------------------------------------------------------
Message_0089:
#_1CAE2D: db $40, $40, $0F, $0E, $0D, $03, $59, $0E ; --POND⎵O
#_1CAE35: db $05, $59, $07, $00, $0F, $0F, $08, $0D ; F⎵HAPPIN
#_1CAE3D: db $04, $12, $12, $40, $40 ; ESS--
#_1CAE42: db $75 ; line 2
#_1CAE43: db $13, $21, $2B, $28, $30, $59, $CF, $59 ; Throw⎵[some]⎵
#_1CAE4B: db $11, $DC, $1E, $1E, $2C, $59, $B4, $59 ; R[up]ees⎵[in]⎵
#_1CAE53: db $8C, $E3, $2B ; [and ][you]r
#_1CAE56: db $76 ; line 3
#_1CAE57: db $E2, $D1, $1E, $2C, $59, $E2, $25, $25 ; [wi][sh]es⎵[wi]ll
#_1CAE5F: db $59, $2C, $2E, $CE, $B9, $9B, $1E, $59 ; ⎵su[re][ly ][com]e⎵
#_1CAE67: db $DB, $2E, $1E, $41 ; [tr]ue.
#_1CAE6B: db $7E ; wait for key
#_1CAE6C: db $73 ; scroll text
#_1CAE6D: db $03, $28, $59, $E3, $59, $DF, $27, $2D ; Do⎵[you]⎵[wa]nt
#_1CAE75: db $59, $DA, $59, $2D, $21, $2B, $28, $30 ; ⎵[to]⎵throw
#_1CAE7D: db $59, $11, $DC, $1E, $1E, $2C, $3F ; ⎵R[up]ees?
#_1CAE84: db $73 ; scroll text
#_1CAE85: db $88, $44, $59, $13, $21, $2B, $28, $30 ; [    ]>⎵Throw
#_1CAE8D: db $59, $1A, $59, $1F, $1E, $30 ; ⎵a⎵few
#_1CAE93: db $73 ; scroll text
#_1CAE94: db $88, $89, $03, $C7, $51, $2D, $59, $1F ; [    ][   ]D[on]'t⎵f
#_1CAE9C: db $1E, $1E, $25, $59, $25, $22, $24, $1E ; eel⎵like
#_1CAEA4: db $59, $B6 ; ⎵[it]
#_1CAEA6: db $68 ; choose 2 indented
#_1CAEA7: db $7F ; end of message

;===================================================================================================
; Select an item using the
; Control Pad and throw it using
; the ⓨ Button.
;---------------------------------------------------------------------------------------------------
Message_008A:
#_1CAEA8: db $12, $1E, $25, $1E, $1C, $2D, $59, $93 ; Select⎵[an]
#_1CAEB0: db $59, $B6, $1E, $26, $59, $2E, $2C, $B3 ; ⎵[it]em⎵us[ing ]
#_1CAEB8: db $D8 ; [the]
#_1CAEB9: db $75 ; line 2
#_1CAEBA: db $02, $C7, $DB, $28, $25, $59, $0F, $1A ; C[on][tr]ol⎵Pa
#_1CAEC2: db $1D, $59, $8C, $2D, $21, $2B, $28, $30 ; d⎵[and ]throw
#_1CAECA: db $59, $B6, $59, $2E, $2C, $B4, $20 ; ⎵[it]⎵us[in]g
#_1CAED1: db $76 ; line 3
#_1CAED2: db $D8, $59, $5E, $59, $01, $2E, $2D, $DA ; [the]⎵ⓨ⎵But[to]
#_1CAEDA: db $27, $41 ; n.
#_1CAEDC: db $69 ; choose item
#_1CAEDD: db $7F ; end of message

;===================================================================================================
; Hello there.  Did you drop this?
;     > Yes
;        No, I didn't
;---------------------------------------------------------------------------------------------------
Message_008B:
#_1CAEDE: db $07, $1E, $25, $BB, $59, $D8, $CE, $41 ; Hel[lo]⎵[the][re].
#_1CAEE6: db $8A, $03, $22, $1D, $59, $E3, $59, $1D ; [  ]Did⎵[you]⎵d
#_1CAEEE: db $2B, $28, $29, $59, $D9, $2C, $3F ; rop⎵[thi]s?
#_1CAEF5: db $75 ; line 2
#_1CAEF6: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1CAEFC: db $76 ; line 3
#_1CAEFD: db $88, $89, $0D, $28, $42, $59, $08, $59 ; [    ][   ]No,⎵I⎵
#_1CAF05: db $9E, $1D, $27, $51, $2D ; [di]dn't
#_1CAF0A: db $68 ; choose 2 indented
#_1CAF0B: db $7F ; end of message

;===================================================================================================
; I like an honest person.
; I will give you something better
; in return.
;---------------------------------------------------------------------------------------------------
Message_008C:
#_1CAF0C: db $08, $59, $25, $22, $24, $1E, $59, $93 ; I⎵like⎵[an]
#_1CAF14: db $59, $21, $C7, $1E, $D3, $59, $C9, $D2 ; ⎵h[on]e[st]⎵[per][so]
#_1CAF1C: db $27, $41 ; n.
#_1CAF1E: db $75 ; line 2
#_1CAF1F: db $08, $59, $E2, $25, $25, $59, $AA, $E3 ; I⎵[wi]ll⎵[give ][you]
#_1CAF27: db $59, $CF, $D5, $20, $59, $97, $2D, $D6 ; ⎵[some][thin]g⎵[be]t[ter]
#_1CAF2F: db $76 ; line 3
#_1CAF30: db $B4, $59, $CE, $2D, $2E, $2B, $27, $41 ; [in]⎵[re]turn.
#_1CAF38: db $7F ; end of message

;===================================================================================================
; Are you sure this is not yours?
;     > Really, it isn't
;        To tell the truth, it is
;---------------------------------------------------------------------------------------------------
Message_008D:
#_1CAF39: db $00, $CD, $E3, $59, $2C, $2E, $CD, $D9 ; A[re ][you]⎵su[re ][thi]
#_1CAF41: db $2C, $59, $B5, $59, $C2, $59, $E3, $2B ; s⎵[is]⎵[not]⎵[you]r
#_1CAF49: db $2C, $3F ; s?
#_1CAF4B: db $75 ; line 2
#_1CAF4C: db $88, $44, $59, $11, $1E, $1A, $25, $25 ; [    ]>⎵Reall
#_1CAF54: db $32, $42, $59, $B6, $59, $B5, $27, $51 ; y,⎵[it]⎵[is]n'
#_1CAF5C: db $2D ; t
#_1CAF5D: db $76 ; line 3
#_1CAF5E: db $88, $89, $13, $28, $59, $2D, $1E, $25 ; [    ][   ]To⎵tel
#_1CAF66: db $25, $59, $D8, $59, $DB, $2E, $2D, $21 ; l⎵[the]⎵[tr]uth
#_1CAF6E: db $42, $59, $B6, $59, $B5 ; ,⎵[it]⎵[is]
#_1CAF73: db $68 ; choose 2 indented
#_1CAF74: db $7F ; end of message

;===================================================================================================
; Now,  now, don't tell me a lie.
; Please take it back.
;---------------------------------------------------------------------------------------------------
Message_008E:
#_1CAF75: db $0D, $28, $30, $42, $8A, $27, $28, $30 ; Now,[  ]now
#_1CAF7D: db $42, $59, $9F, $C0, $2D, $1E, $25, $25 ; ,⎵[do][n't ]tell
#_1CAF85: db $59, $BE, $59, $1A, $59, $25, $22, $1E ; ⎵[me]⎵a⎵lie
#_1CAF8D: db $41 ; .
#_1CAF8E: db $75 ; line 2
#_1CAF8F: db $0F, $25, $1E, $1A, $D0, $59, $2D, $1A ; Plea[se]⎵ta
#_1CAF97: db $24, $1E, $59, $B6, $59, $96, $9C, $41 ; ke⎵[it]⎵[ba][ck].
#_1CAF9F: db $7F ; end of message

;===================================================================================================
; You got the Magical Boomerang!
; You can throw this faster and
; farther than your old one!
;---------------------------------------------------------------------------------------------------
Message_008F:
#_1CAFA0: db $E8, $59, $AC, $2D, $59, $D8, $59, $0C ; [You]⎵[go]t⎵[the]⎵M
#_1CAFA8: db $1A, $20, $22, $1C, $1A, $25, $59, $01 ; agical⎵B
#_1CAFB0: db $28, $28, $BE, $2B, $93, $20, $3E ; oo[me]r[an]g!
#_1CAFB7: db $75 ; line 2
#_1CAFB8: db $E8, $59, $99, $2D, $21, $2B, $28, $30 ; [You]⎵[can ]throw
#_1CAFC0: db $59, $D9, $2C, $59, $1F, $92, $A1, $90 ; ⎵[thi]s⎵f[ast][er ][and]
#_1CAFC8: db $76 ; line 3
#_1CAFC9: db $1F, $1A, $2B, $D8, $2B, $59, $D7, $27 ; far[the]r⎵[tha]n
#_1CAFD1: db $59, $E3, $2B, $59, $28, $25, $1D, $59 ; ⎵[you]r⎵old⎵
#_1CAFD9: db $C7, $1E, $3E ; [on]e!
#_1CAFDC: db $7F ; end of message

;===================================================================================================
; Your shield is improved!
; Now you can defend yourself
; against fireballs!
;---------------------------------------------------------------------------------------------------
Message_0090:
#_1CAFDD: db $E8, $2B, $59, $D1, $22, $1E, $25, $1D ; [You]r⎵[sh]ield
#_1CAFE5: db $59, $B5, $59, $22, $26, $CC, $2F, $1E ; ⎵[is]⎵im[pro]ve
#_1CAFED: db $1D, $3E ; d!
#_1CAFEF: db $75 ; line 2
#_1CAFF0: db $0D, $28, $30, $59, $E3, $59, $99, $1D ; Now⎵[you]⎵[can ]d
#_1CAFF8: db $1E, $1F, $A5, $1D, $59, $E3, $2B, $D0 ; ef[en]d⎵[you]r[se]
#_1CB000: db $25, $1F ; lf
#_1CB002: db $76 ; line 3
#_1CB003: db $1A, $20, $8F, $D3, $59, $1F, $22, $CE ; ag[ain][st]⎵fi[re]
#_1CB00B: db $96, $25, $25, $2C, $3E ; [ba]lls!
#_1CB010: db $7F ; end of message

;===================================================================================================
; These are the Silver Arrows
; you need to defeat Ganon!
;---------------------------------------------------------------------------------------------------
Message_0091:
#_1CB011: db $E6, $D0, $59, $8D, $D8, $59, $12, $22 ; [The][se]⎵[are ][the]⎵Si
#_1CB019: db $25, $DD, $59, $00, $2B, $2B, $28, $30 ; l[ver]⎵Arrow
#_1CB021: db $2C ; s
#_1CB022: db $75 ; line 2
#_1CB023: db $E3, $59, $27, $1E, $A4, $DA, $59, $1D ; [you]⎵ne[ed ][to]⎵d
#_1CB02B: db $1E, $1F, $1E, $91, $06, $93, $C7, $3E ; efe[at ]G[an][on]!
#_1CB033: db $7F ; end of message

;===================================================================================================
; She filled your bottle with the
; Medicine Of Magic.  To get such
; a potion free is quite
; a bargain!
;---------------------------------------------------------------------------------------------------
Message_0092:
#_1CB034: db $12, $21, $1E, $59, $1F, $22, $25, $25 ; She⎵fill
#_1CB03C: db $A4, $E3, $2B, $59, $98, $2D, $2D, $25 ; [ed ][you]r⎵[bo]ttl
#_1CB044: db $1E, $59, $DE, $59, $D8 ; e⎵[with]⎵[the]
#_1CB049: db $75 ; line 2
#_1CB04A: db $0C, $1E, $9E, $1C, $B4, $1E, $59, $0E ; Me[di]c[in]e⎵O
#_1CB052: db $1F, $59, $0C, $1A, $20, $22, $1C, $41 ; f⎵Magic.
#_1CB05A: db $8A, $13, $28, $59, $AB, $59, $2C, $2E ; [  ]To⎵[get]⎵su
#_1CB062: db $1C, $21 ; ch
#_1CB064: db $76 ; line 3
#_1CB065: db $1A, $59, $29, $28, $2D, $22, $C7, $59 ; a⎵poti[on]⎵
#_1CB06D: db $1F, $CE, $1E, $59, $B5, $59, $2A, $2E ; f[re]e⎵[is]⎵qu
#_1CB075: db $B6, $1E ; [it]e
#_1CB077: db $7E ; wait for key
#_1CB078: db $73 ; scroll text
#_1CB079: db $1A, $59, $96, $2B, $20, $8F, $3E ; a⎵[ba]rg[ain]!
#_1CB080: db $7F ; end of message

;===================================================================================================
; Your sword is stronger!
; You can feel its power
; throbbing in your hand!
;---------------------------------------------------------------------------------------------------
Message_0093:
#_1CB081: db $E8, $2B, $59, $2C, $30, $C8, $1D, $59 ; [You]r⎵sw[or]d⎵
#_1CB089: db $B5, $59, $D3, $2B, $C7, $20, $A6, $3E ; [is]⎵[st]r[on]g[er]!
#_1CB091: db $75 ; line 2
#_1CB092: db $E8, $59, $99, $1F, $1E, $1E, $25, $59 ; [You]⎵[can ]feel⎵
#_1CB09A: db $B6, $2C, $59, $CB, $A6 ; [it]s⎵[pow][er]
#_1CB09F: db $76 ; line 3
#_1CB0A0: db $2D, $21, $2B, $28, $1B, $1B, $B3, $B4 ; throbb[ing ][in]
#_1CB0A8: db $59, $E3, $2B, $59, $B1, $27, $1D, $3E ; ⎵[you]r⎵[ha]nd!
#_1CB0B0: db $7F ; end of message

;===================================================================================================
; Happiness increased [#3][#2] Rupees.
; In total, your Happiness is [#1][#0].
; You became happier by one
; step.
;---------------------------------------------------------------------------------------------------
Message_0094:
#_1CB0B1: db $07, $1A, $29, $29, $B4, $1E, $2C, $2C ; Happ[in]ess
#_1CB0B9: db $59, $B4, $1C, $CE, $1A, $D0, $1D, $59 ; ⎵[in]c[re]a[se]d⎵
#_1CB0C1: db $6C, $03, $6C, $02, $59, $11, $DC, $1E ; [#3][#2]⎵R[up]e
#_1CB0C9: db $1E, $2C, $41 ; es.
#_1CB0CC: db $75 ; line 2
#_1CB0CD: db $08, $27, $59, $DA, $2D, $1A, $25, $42 ; In⎵[to]tal,
#_1CB0D5: db $59, $E3, $2B, $59, $07, $1A, $29, $29 ; ⎵[you]r⎵Happ
#_1CB0DD: db $B4, $1E, $2C, $2C, $59, $B5, $59 ; [in]ess⎵[is]⎵
#_1CB0E4: db $6C, $01, $6C, $00, $41 ; [#1][#0].
#_1CB0E9: db $76 ; line 3
#_1CB0EA: db $E8, $59, $97, $1C, $1A, $BE, $59, $B1 ; [You]⎵[be]ca[me]⎵[ha]
#_1CB0F2: db $29, $29, $22, $A1, $1B, $32, $59, $C7 ; ppi[er ]by⎵[on]
#_1CB0FA: db $1E ; e
#_1CB0FB: db $7E ; wait for key
#_1CB0FC: db $73 ; scroll text
#_1CB0FD: db $D3, $1E, $29, $41 ; [st]ep.
#_1CB101: db $7F ; end of message

;===================================================================================================
; I will make your wish come true.
;   >I want to carry more Bombs
;     I want to carry more Arrows
;---------------------------------------------------------------------------------------------------
Message_0095:
#_1CB102: db $08, $59, $E2, $25, $25, $59, $BD, $24 ; I⎵[wi]ll⎵[ma]k
#_1CB10A: db $1E, $59, $E3, $2B, $59, $E2, $D1, $59 ; e⎵[you]r⎵[wi][sh]⎵
#_1CB112: db $9B, $1E, $59, $DB, $2E, $1E, $41 ; [com]e⎵[tr]ue.
#_1CB119: db $75 ; line 2
#_1CB11A: db $8A, $44, $08, $59, $DF, $27, $2D, $59 ; [  ]>I⎵[wa]nt⎵
#_1CB122: db $DA, $59, $1C, $1A, $2B, $2B, $32, $59 ; [to]⎵carry⎵
#_1CB12A: db $26, $C8, $1E, $59, $01, $28, $26, $1B ; m[or]e⎵Bomb
#_1CB132: db $2C ; s
#_1CB133: db $76 ; line 3
#_1CB134: db $88, $08, $59, $DF, $27, $2D, $59, $DA ; [    ]I⎵[wa]nt⎵[to]
#_1CB13C: db $59, $1C, $1A, $2B, $2B, $32, $59, $26 ; ⎵carry⎵m
#_1CB144: db $C8, $1E, $59, $00, $2B, $2B, $28, $30 ; [or]e⎵Arrow
#_1CB14C: db $2C ; s
#_1CB14D: db $6F ; choose 2 low
#_1CB14E: db $7F ; end of message

;===================================================================================================
; Then I will increase your
; carrying ability so you can
; carry [#1][#0] Bombs at maximum.
; This is just a small happiness
; I can give to you.
;---------------------------------------------------------------------------------------------------
Message_0096:
#_1CB14F: db $E6, $27, $59, $08, $59, $E2, $25, $25 ; [The]n⎵I⎵[wi]ll
#_1CB157: db $59, $B4, $1C, $CE, $1A, $D0, $59, $E3 ; ⎵[in]c[re]a[se]⎵[you]
#_1CB15F: db $2B ; r
#_1CB160: db $75 ; line 2
#_1CB161: db $1C, $1A, $2B, $2B, $32, $B3, $1A, $1B ; carry[ing ]ab
#_1CB169: db $22, $25, $B6, $32, $59, $D2, $59, $E3 ; il[it]y⎵[so]⎵[you]
#_1CB171: db $59, $1C, $93 ; ⎵c[an]
#_1CB174: db $76 ; line 3
#_1CB175: db $1C, $1A, $2B, $2B, $32, $59, $6C, $01 ; carry⎵[#1]
#_1CB17D: db $6C, $00, $59, $01, $28, $26, $1B, $2C ; [#0]⎵Bombs
#_1CB185: db $59, $91, $BD, $31, $22, $BF, $26, $41 ; ⎵[at ][ma]xi[mu]m.
#_1CB18D: db $7E ; wait for key
#_1CB18E: db $73 ; scroll text
#_1CB18F: db $E7, $2C, $59, $B5, $59, $B7, $59, $1A ; [Thi]s⎵[is]⎵[just]⎵a
#_1CB197: db $59, $2C, $BD, $25, $25, $59, $B1, $29 ; ⎵s[ma]ll⎵[ha]p
#_1CB19F: db $29, $B4, $1E, $2C, $2C ; p[in]ess
#_1CB1A4: db $73 ; scroll text
#_1CB1A5: db $08, $59, $99, $AA, $DA, $59, $E3, $41 ; I⎵[can ][give ][to]⎵[you].
#_1CB1AD: db $7F ; end of message

;===================================================================================================
; Then I will increase your
; carrying ability so you can
; carry [#1][#0] Arrows at maximum.
; This is just a small happiness
; I can give to you.
;---------------------------------------------------------------------------------------------------
Message_0097:
#_1CB1AE: db $E6, $27, $59, $08, $59, $E2, $25, $25 ; [The]n⎵I⎵[wi]ll
#_1CB1B6: db $59, $B4, $1C, $CE, $1A, $D0, $59, $E3 ; ⎵[in]c[re]a[se]⎵[you]
#_1CB1BE: db $2B ; r
#_1CB1BF: db $75 ; line 2
#_1CB1C0: db $1C, $1A, $2B, $2B, $32, $B3, $1A, $1B ; carry[ing ]ab
#_1CB1C8: db $22, $25, $B6, $32, $59, $D2, $59, $E3 ; il[it]y⎵[so]⎵[you]
#_1CB1D0: db $59, $1C, $93 ; ⎵c[an]
#_1CB1D3: db $76 ; line 3
#_1CB1D4: db $1C, $1A, $2B, $2B, $32, $59, $6C, $01 ; carry⎵[#1]
#_1CB1DC: db $6C, $00, $59, $00, $2B, $2B, $28, $30 ; [#0]⎵Arrow
#_1CB1E4: db $2C, $59, $91, $BD, $31, $22, $BF, $26 ; s⎵[at ][ma]xi[mu]m
#_1CB1EC: db $41 ; .
#_1CB1ED: db $7E ; wait for key
#_1CB1EE: db $73 ; scroll text
#_1CB1EF: db $E7, $2C, $59, $B5, $59, $B7, $59, $1A ; [Thi]s⎵[is]⎵[just]⎵a
#_1CB1F7: db $59, $2C, $BD, $25, $25, $59, $B1, $29 ; ⎵s[ma]ll⎵[ha]p
#_1CB1FF: db $29, $B4, $1E, $2C, $2C ; p[in]ess
#_1CB204: db $73 ; scroll text
#_1CB205: db $08, $59, $99, $AA, $DA, $59, $E3, $41 ; I⎵[can ][give ][to]⎵[you].
#_1CB20D: db $7F ; end of message

;===================================================================================================
; I cannot grant any more wishes
; for you, but a friend of mine
; might be able to…
; She lives in the Waterfall Of
; Wishing near Zora's lake.
; I will return your Rupees to
; you.  May you be happy…
;---------------------------------------------------------------------------------------------------
Message_0098:
#_1CB20E: db $08, $59, $1C, $93, $C2, $59, $20, $2B ; I⎵c[an][not]⎵gr
#_1CB216: db $93, $2D, $59, $93, $32, $59, $26, $C8 ; [an]t⎵[an]y⎵m[or]
#_1CB21E: db $1E, $59, $E2, $D1, $1E, $2C ; e⎵[wi][sh]es
#_1CB224: db $75 ; line 2
#_1CB225: db $A8, $59, $E3, $42, $59, $1B, $2E, $2D ; [for]⎵[you],⎵but
#_1CB22D: db $59, $1A, $59, $1F, $2B, $22, $A5, $1D ; ⎵a⎵fri[en]d
#_1CB235: db $59, $C6, $59, $26, $B4, $1E ; ⎵[of]⎵m[in]e
#_1CB23B: db $76 ; line 3
#_1CB23C: db $26, $B2, $97, $59, $1A, $95, $59, $DA ; m[ight ][be]⎵a[ble]⎵[to]
#_1CB244: db $43 ; …
#_1CB245: db $7E ; wait for key
#_1CB246: db $73 ; scroll text
#_1CB247: db $12, $21, $1E, $59, $25, $22, $2F, $1E ; She⎵live
#_1CB24F: db $2C, $59, $B4, $59, $D8, $59, $16, $94 ; s⎵[in]⎵[the]⎵W[at]
#_1CB257: db $A6, $1F, $8E, $0E, $1F ; [er]f[all ]Of
#_1CB25C: db $73 ; scroll text
#_1CB25D: db $16, $B5, $B0, $27, $20, $59, $27, $A2 ; W[is][hi]ng⎵n[ear]
#_1CB265: db $59, $19, $C8, $1A, $8B, $BA, $24, $1E ; ⎵Z[or]a['s ][la]ke
#_1CB26D: db $41 ; .
#_1CB26E: db $73 ; scroll text
#_1CB26F: db $08, $59, $E2, $25, $25, $59, $CE, $2D ; I⎵[wi]ll⎵[re]t
#_1CB277: db $2E, $2B, $27, $59, $E3, $2B, $59, $11 ; urn⎵[you]r⎵R
#_1CB27F: db $DC, $1E, $1E, $2C, $59, $DA ; [up]ees⎵[to]
#_1CB285: db $7E ; wait for key
#_1CB286: db $73 ; scroll text
#_1CB287: db $E3, $41, $8A, $0C, $1A, $32, $59, $E3 ; [you].[  ]May⎵[you]
#_1CB28F: db $59, $97, $59, $B1, $29, $29, $32, $43 ; ⎵[be]⎵[ha]ppy…
#_1CB297: db $7F ; end of message

;===================================================================================================
; Uhhh…  Watch your step.
; There are holes in the ground.
; Could you turn right here?
; Young man, are you also going
; to the mountain to look for the
; Golden Power?
; Just ahead is a mountain full
; of monsters.  Many people have
; vanished in this mountain while
; looking for the Golden Power.
; 
; 
; I don't want to steer you
; wrong, so please don't get too
; involved in such a mad quest.
;---------------------------------------------------------------------------------------------------
Message_0099:
#_1CB298: db $14, $21, $21, $21, $43, $8A, $16, $94 ; Uhhh…[  ]W[at]
#_1CB2A0: db $1C, $21, $59, $E3, $2B, $59, $D3, $1E ; ch⎵[you]r⎵[st]e
#_1CB2A8: db $29, $41 ; p.
#_1CB2AA: db $75 ; line 2
#_1CB2AB: db $E6, $CD, $8D, $21, $28, $25, $1E, $2C ; [The][re ][are ]holes
#_1CB2B3: db $59, $B4, $59, $D8, $59, $20, $2B, $C4 ; ⎵[in]⎵[the]⎵gr[ound]
#_1CB2BB: db $41 ; .
#_1CB2BC: db $76 ; line 3
#_1CB2BD: db $02, $28, $2E, $25, $1D, $59, $E3, $59 ; Could⎵[you]⎵
#_1CB2C5: db $2D, $2E, $2B, $27, $59, $2B, $B2, $AF ; turn⎵r[ight ][her]
#_1CB2CD: db $1E, $3F ; e?
#_1CB2CF: db $7E ; wait for key
#_1CB2D0: db $73 ; scroll text
#_1CB2D1: db $E8, $27, $20, $59, $BC, $42, $59, $8D ; [You]ng⎵[man],⎵[are ]
#_1CB2D9: db $E3, $59, $1A, $25, $D2, $59, $AC, $B4 ; [you]⎵al[so]⎵[go][in]
#_1CB2E1: db $20 ; g
#_1CB2E2: db $73 ; scroll text
#_1CB2E3: db $DA, $59, $D8, $59, $26, $28, $2E, $27 ; [to]⎵[the]⎵moun
#_1CB2EB: db $2D, $8F, $59, $DA, $59, $BB, $28, $24 ; t[ain]⎵[to]⎵[lo]ok
#_1CB2F3: db $59, $A8, $59, $D8 ; ⎵[for]⎵[the]
#_1CB2F7: db $73 ; scroll text
#_1CB2F8: db $06, $28, $25, $1D, $A0, $0F, $28, $E0 ; Gold[en ]Po[we]
#_1CB300: db $2B, $3F ; r?
#_1CB302: db $7E ; wait for key
#_1CB303: db $73 ; scroll text
#_1CB304: db $09, $2E, $D3, $59, $1A, $21, $1E, $1A ; Ju[st]⎵ahea
#_1CB30C: db $1D, $59, $B5, $59, $1A, $59, $26, $28 ; d⎵[is]⎵a⎵mo
#_1CB314: db $2E, $27, $2D, $8F, $59, $1F, $2E, $25 ; unt[ain]⎵ful
#_1CB31C: db $25 ; l
#_1CB31D: db $73 ; scroll text
#_1CB31E: db $C6, $59, $26, $C7, $D3, $A6, $2C, $41 ; [of]⎵m[on][st][er]s.
#_1CB326: db $8A, $0C, $93, $32, $59, $29, $1E, $28 ; [  ]M[an]y⎵peo
#_1CB32E: db $CA, $59, $AD ; [ple]⎵[have]
#_1CB331: db $73 ; scroll text
#_1CB332: db $2F, $93, $B5, $21, $A4, $B4, $59, $D9 ; v[an][is]h[ed ][in]⎵[thi]
#_1CB33A: db $2C, $59, $26, $28, $2E, $27, $2D, $8F ; s⎵mount[ain]
#_1CB342: db $59, $E1, $22, $25, $1E ; ⎵[wh]ile
#_1CB347: db $7E ; wait for key
#_1CB348: db $73 ; scroll text
#_1CB349: db $BB, $28, $24, $B3, $A8, $59, $D8, $59 ; [lo]ok[ing ][for]⎵[the]⎵
#_1CB351: db $06, $28, $25, $1D, $A0, $0F, $28, $E0 ; Gold[en ]Po[we]
#_1CB359: db $2B, $41 ; r.
#_1CB35B: db $73 ; scroll text
#_1CB35C: db $73 ; scroll text
#_1CB35D: db $7E ; wait for key
#_1CB35E: db $73 ; scroll text
#_1CB35F: db $08, $59, $9F, $C0, $DF, $27, $2D, $59 ; I⎵[do][n't ][wa]nt⎵
#_1CB367: db $DA, $59, $D3, $1E, $A1, $E3 ; [to]⎵[st]e[er ][you]
#_1CB36D: db $73 ; scroll text
#_1CB36E: db $30, $2B, $C7, $20, $42, $59, $D2, $59 ; wr[on]g,⎵[so]⎵
#_1CB376: db $CA, $1A, $D0, $59, $9F, $C0, $AB, $59 ; [ple]a[se]⎵[do][n't ][get]⎵
#_1CB37E: db $DA, $28 ; [to]o
#_1CB380: db $73 ; scroll text
#_1CB381: db $B4, $2F, $28, $25, $2F, $A4, $B4, $59 ; [in]volv[ed ][in]⎵
#_1CB389: db $2C, $2E, $1C, $21, $59, $1A, $59, $BD ; such⎵a⎵[ma]
#_1CB391: db $1D, $59, $2A, $2E, $1E, $D3, $41 ; d⎵que[st].
#_1CB398: db $7F ; end of message

;===================================================================================================
; Uhh…  There must be a Heart in
; the bottle.
;---------------------------------------------------------------------------------------------------
Message_009A:
#_1CB399: db $14, $21, $21, $43, $8A, $E6, $CD, $BF ; Uhh…[  ][The][re ][mu]
#_1CB3A1: db $D3, $59, $97, $59, $1A, $59, $07, $A2 ; [st]⎵[be]⎵a⎵H[ear]
#_1CB3A9: db $2D, $59, $B4 ; t⎵[in]
#_1CB3AC: db $75 ; line 2
#_1CB3AD: db $D8, $59, $98, $2D, $2D, $25, $1E, $41 ; [the]⎵[bo]ttle.
#_1CB3B5: db $7F ; end of message

;===================================================================================================
; Uhh…  Turn right here…   …
; You know, I have a
; granddaughter who is your
; age…  The King took her to the
; castle and she never returned.
; Kidnapping those maidens must
; be part of the wizard's plot!
; I'm sure he is trying to
; somehow use the power of the
; descendants of the wise
; men…
;---------------------------------------------------------------------------------------------------
Message_009B:
#_1CB3B6: db $14, $21, $21, $43, $8A, $13, $2E, $2B ; Uhh…[  ]Tur
#_1CB3BE: db $27, $59, $2B, $B2, $AF, $1E, $43, $89 ; n⎵r[ight ][her]e…[   ]
#_1CB3C6: db $43 ; …
#_1CB3C7: db $75 ; line 2
#_1CB3C8: db $E8, $59, $B8, $42, $59, $08, $59, $AD ; [You]⎵[know],⎵I⎵[have]
#_1CB3D0: db $59, $1A ; ⎵a
#_1CB3D2: db $76 ; line 3
#_1CB3D3: db $20, $2B, $90, $1D, $1A, $2E, $20, $21 ; gr[and]daugh
#_1CB3DB: db $D4, $E1, $28, $59, $B5, $59, $E3, $2B ; [ter ][wh]o⎵[is]⎵[you]r
#_1CB3E3: db $7E ; wait for key
#_1CB3E4: db $73 ; scroll text
#_1CB3E5: db $1A, $20, $1E, $43, $8A, $E6, $59, $0A ; age…[  ][The]⎵K
#_1CB3ED: db $B3, $DA, $28, $24, $59, $AF, $59, $DA ; [ing ][to]ok⎵[her]⎵[to]
#_1CB3F5: db $59, $D8 ; ⎵[the]
#_1CB3F7: db $73 ; scroll text
#_1CB3F8: db $1C, $92, $25, $1E, $59, $8C, $D1, $1E ; c[ast]le⎵[and ][sh]e
#_1CB400: db $59, $27, $A7, $A1, $CE, $2D, $2E, $2B ; ⎵n[ev][er ][re]tur
#_1CB408: db $27, $1E, $1D, $41 ; ned.
#_1CB40C: db $73 ; scroll text
#_1CB40D: db $0A, $22, $1D, $27, $1A, $29, $29, $B3 ; Kidnapp[ing ]
#_1CB415: db $2D, $21, $28, $D0, $59, $BD, $22, $1D ; tho[se]⎵[ma]id
#_1CB41D: db $A5, $2C, $59, $BF, $D3 ; [en]s⎵[mu][st]
#_1CB422: db $7E ; wait for key
#_1CB423: db $73 ; scroll text
#_1CB424: db $97, $59, $29, $1A, $2B, $2D, $59, $C6 ; [be]⎵part⎵[of]
#_1CB42C: db $59, $D8, $59, $E2, $33, $1A, $2B, $1D ; ⎵[the]⎵[wi]zard
#_1CB434: db $8B, $29, $BB, $2D, $3E ; ['s ]p[lo]t!
#_1CB439: db $73 ; scroll text
#_1CB43A: db $08, $51, $26, $59, $2C, $2E, $CD, $21 ; I'm⎵su[re ]h
#_1CB442: db $1E, $59, $B5, $59, $DB, $32, $B3, $DA ; e⎵[is]⎵[tr]y[ing ][to]
#_1CB44A: db $73 ; scroll text
#_1CB44B: db $CF, $21, $28, $30, $59, $2E, $D0, $59 ; [some]how⎵u[se]⎵
#_1CB453: db $D8, $59, $CB, $A1, $C6, $59, $D8 ; [the]⎵[pow][er ][of]⎵[the]
#_1CB45A: db $7E ; wait for key
#_1CB45B: db $73 ; scroll text
#_1CB45C: db $9D, $1C, $A5, $1D, $93, $2D, $2C, $59 ; [des]c[en]d[an]ts⎵
#_1CB464: db $C6, $59, $D8, $59, $E2, $D0 ; [of]⎵[the]⎵[wi][se]
#_1CB46A: db $73 ; scroll text
#_1CB46B: db $BE, $27, $43 ; [me]n…
#_1CB46E: db $7F ; end of message

;===================================================================================================
; I don't know who you are, but
; if you are going to go up
; the mountain, will you take me
; with you?  I lost my lamp,
; so…
;---------------------------------------------------------------------------------------------------
Message_009C:
#_1CB46F: db $08, $59, $9F, $C0, $B8, $59, $E1, $28 ; I⎵[do][n't ][know]⎵[wh]o
#_1CB477: db $59, $E3, $59, $1A, $CE, $42, $59, $1B ; ⎵[you]⎵a[re],⎵b
#_1CB47F: db $2E, $2D ; ut
#_1CB481: db $75 ; line 2
#_1CB482: db $22, $1F, $59, $E3, $59, $8D, $AC, $B3 ; if⎵[you]⎵[are ][go][ing ]
#_1CB48A: db $DA, $59, $AC, $59, $DC ; [to]⎵[go]⎵[up]
#_1CB48F: db $76 ; line 3
#_1CB490: db $D8, $59, $26, $28, $2E, $27, $2D, $8F ; [the]⎵mount[ain]
#_1CB498: db $42, $59, $E2, $25, $25, $59, $E3, $59 ; ,⎵[wi]ll⎵[you]⎵
#_1CB4A0: db $2D, $1A, $24, $1E, $59, $BE ; take⎵[me]
#_1CB4A6: db $7E ; wait for key
#_1CB4A7: db $73 ; scroll text
#_1CB4A8: db $DE, $59, $E3, $3F, $8A, $08, $59, $BB ; [with]⎵[you]?[  ]I⎵[lo]
#_1CB4B0: db $D3, $59, $26, $32, $59, $BA, $26, $29 ; [st]⎵my⎵[la]mp
#_1CB4B8: db $42 ; ,
#_1CB4B9: db $73 ; scroll text
#_1CB4BA: db $D2, $43 ; [so]…
#_1CB4BC: db $7F ; end of message

;===================================================================================================
; The missing maidens are still
; alive somewhere.  I believe that
; a Hero will rescue them…
; I wait for that day…
; Uhh…  These are dangerous
; times…  I talked too much.
; Anyway…  Thank you for your
; kindness to an old man like me.
; Uhh…  I wanted to give you
; this.  If you wander into
; a magical transporter, gaze
; into this mirror.
;---------------------------------------------------------------------------------------------------
Message_009D:
#_1CB4BD: db $E6, $59, $26, $B5, $2C, $B3, $BD, $22 ; [The]⎵m[is]s[ing ][ma]i
#_1CB4C5: db $1D, $A5, $2C, $59, $8D, $D3, $22, $25 ; d[en]s⎵[are ][st]il
#_1CB4CD: db $25 ; l
#_1CB4CE: db $75 ; line 2
#_1CB4CF: db $1A, $25, $22, $2F, $1E, $59, $CF, $E1 ; alive⎵[some][wh]
#_1CB4D7: db $A6, $1E, $41, $8A, $08, $59, $97, $25 ; [er]e.[  ]I⎵[be]l
#_1CB4DF: db $22, $A7, $1E, $59, $D7, $2D ; i[ev]e⎵[tha]t
#_1CB4E5: db $76 ; line 3
#_1CB4E6: db $1A, $59, $E4, $28, $59, $E2, $25, $25 ; a⎵[Her]o⎵[wi]ll
#_1CB4EE: db $59, $CE, $2C, $1C, $2E, $1E, $59, $D8 ; ⎵[re]scue⎵[the]
#_1CB4F6: db $26, $43 ; m…
#_1CB4F8: db $7E ; wait for key
#_1CB4F9: db $73 ; scroll text
#_1CB4FA: db $08, $59, $DF, $B6, $59, $A8, $59, $D7 ; I⎵[wa][it]⎵[for]⎵[tha]
#_1CB502: db $2D, $59, $1D, $1A, $32, $43 ; t⎵day…
#_1CB508: db $73 ; scroll text
#_1CB509: db $14, $21, $21, $43, $8A, $E6, $D0, $59 ; Uhh…[  ][The][se]⎵
#_1CB511: db $8D, $1D, $93, $20, $A6, $28, $2E, $2C ; [are ]d[an]g[er]ous
#_1CB519: db $73 ; scroll text
#_1CB51A: db $2D, $22, $BE, $2C, $43, $8A, $08, $59 ; ti[me]s…[  ]I⎵
#_1CB522: db $2D, $1A, $25, $24, $A4, $DA, $28, $59 ; talk[ed ][to]o⎵
#_1CB52A: db $BF, $1C, $21, $41 ; [mu]ch.
#_1CB52E: db $7E ; wait for key
#_1CB52F: db $73 ; scroll text
#_1CB530: db $00, $27, $32, $DF, $32, $43, $8A, $E5 ; Any[wa]y…[  ][Tha]
#_1CB538: db $27, $24, $59, $E3, $59, $A8, $59, $E3 ; nk⎵[you]⎵[for]⎵[you]
#_1CB540: db $2B ; r
#_1CB541: db $73 ; scroll text
#_1CB542: db $24, $B4, $1D, $27, $1E, $2C, $2C, $59 ; k[in]dness⎵
#_1CB54A: db $DA, $59, $93, $59, $28, $25, $1D, $59 ; [to]⎵[an]⎵old⎵
#_1CB552: db $BC, $59, $25, $22, $24, $1E, $59, $BE ; [man]⎵like⎵[me]
#_1CB55A: db $41 ; .
#_1CB55B: db $73 ; scroll text
#_1CB55C: db $14, $21, $21, $43, $8A, $08, $59, $DF ; Uhh…[  ]I⎵[wa]
#_1CB564: db $27, $2D, $A4, $DA, $59, $AA, $E3 ; nt[ed ][to]⎵[give ][you]
#_1CB56B: db $7E ; wait for key
#_1CB56C: db $73 ; scroll text
#_1CB56D: db $D9, $2C, $41, $8A, $08, $1F, $59, $E3 ; [thi]s.[  ]If⎵[you]
#_1CB575: db $59, $DF, $27, $1D, $A1, $B4, $DA ; ⎵[wa]nd[er ][in][to]
#_1CB57C: db $73 ; scroll text
#_1CB57D: db $1A, $59, $BD, $20, $22, $1C, $1A, $25 ; a⎵[ma]gical
#_1CB585: db $59, $DB, $93, $2C, $29, $C8, $D6, $42 ; ⎵[tr][an]sp[or][ter],
#_1CB58D: db $59, $20, $1A, $33, $1E ; ⎵gaze
#_1CB592: db $73 ; scroll text
#_1CB593: db $B4, $DA, $59, $D9, $2C, $59, $26, $22 ; [in][to]⎵[thi]s⎵mi
#_1CB59B: db $2B, $2B, $C8, $41 ; rr[or].
#_1CB59F: db $7F ; end of message

;===================================================================================================
; The wizard has deceived the
; King, and now he is trying to
; open the way to the
; Dark World.  To complete
; your quest, you will need
; the Moon Pearl, which is in the
; tower on top of the mountain.
; All I can do for you now is to
; comfort your weariness…
; Come back here any time.
;---------------------------------------------------------------------------------------------------
Message_009E:
#_1CB5A0: db $E6, $59, $E2, $33, $1A, $2B, $1D, $59 ; [The]⎵[wi]zard⎵
#_1CB5A8: db $AE, $59, $1D, $1E, $1C, $1E, $22, $2F ; [has]⎵deceiv
#_1CB5B0: db $A4, $D8 ; [ed ][the]
#_1CB5B2: db $75 ; line 2
#_1CB5B3: db $0A, $B4, $20, $42, $59, $8C, $27, $28 ; K[in]g,⎵[and ]no
#_1CB5BB: db $30, $59, $21, $1E, $59, $B5, $59, $DB ; w⎵he⎵[is]⎵[tr]
#_1CB5C3: db $32, $B3, $DA ; y[ing ][to]
#_1CB5C6: db $76 ; line 3
#_1CB5C7: db $C3, $59, $D8, $59, $DF, $32, $59, $DA ; [open]⎵[the]⎵[wa]y⎵[to]
#_1CB5CF: db $59, $D8 ; ⎵[the]
#_1CB5D1: db $7E ; wait for key
#_1CB5D2: db $73 ; scroll text
#_1CB5D3: db $03, $1A, $2B, $24, $59, $16, $C8, $25 ; Dark⎵W[or]l
#_1CB5DB: db $1D, $41, $8A, $13, $28, $59, $9B, $CA ; d.[  ]To⎵[com][ple]
#_1CB5E3: db $2D, $1E ; te
#_1CB5E5: db $73 ; scroll text
#_1CB5E6: db $E3, $2B, $59, $2A, $2E, $1E, $D3, $42 ; [you]r⎵que[st],
#_1CB5EE: db $59, $E3, $59, $E2, $25, $25, $59, $27 ; ⎵[you]⎵[wi]ll⎵n
#_1CB5F6: db $1E, $1E, $1D ; eed
#_1CB5F9: db $73 ; scroll text
#_1CB5FA: db $D8, $59, $0C, $28, $C7, $59, $0F, $A2 ; [the]⎵Mo[on]⎵P[ear]
#_1CB602: db $25, $42, $59, $E1, $22, $1C, $21, $59 ; l,⎵[wh]ich⎵
#_1CB60A: db $B5, $59, $B4, $59, $D8 ; [is]⎵[in]⎵[the]
#_1CB60F: db $7E ; wait for key
#_1CB610: db $73 ; scroll text
#_1CB611: db $DA, $E0, $2B, $59, $C7, $59, $DA, $29 ; [to][we]r⎵[on]⎵[to]p
#_1CB619: db $59, $C6, $59, $D8, $59, $26, $28, $2E ; ⎵[of]⎵[the]⎵mou
#_1CB621: db $27, $2D, $8F, $41 ; nt[ain].
#_1CB625: db $73 ; scroll text
#_1CB626: db $00, $25, $25, $59, $08, $59, $99, $9F ; All⎵I⎵[can ][do]
#_1CB62E: db $59, $A8, $59, $E3, $59, $27, $28, $30 ; ⎵[for]⎵[you]⎵now
#_1CB636: db $59, $B5, $59, $DA ; ⎵[is]⎵[to]
#_1CB63A: db $73 ; scroll text
#_1CB63B: db $9B, $A8, $2D, $59, $E3, $2B, $59, $E0 ; [com][for]t⎵[you]r⎵[we]
#_1CB643: db $1A, $2B, $B4, $1E, $2C, $2C, $43 ; ar[in]ess…
#_1CB64A: db $7E ; wait for key
#_1CB64B: db $73 ; scroll text
#_1CB64C: db $02, $28, $BE, $59, $96, $9C, $59, $AF ; Co[me]⎵[ba][ck]⎵[her]
#_1CB654: db $1E, $59, $93, $32, $59, $2D, $22, $BE ; e⎵[an]y⎵ti[me]
#_1CB65C: db $41 ; .
#_1CB65D: db $7F ; end of message

;===================================================================================================
; The Moon Pearl will protect its
; bearer from the magical air of
; the Golden Land, so you can
; keep your human shape there.
; All I can do for you now is
; comfort your weariness… 
; Come back here any time.
;---------------------------------------------------------------------------------------------------
Message_009F:
#_1CB65E: db $74 ; line 1
#_1CB65F: db $E6, $59, $0C, $28, $C7, $59, $0F, $A2 ; [The]⎵Mo[on]⎵P[ear]
#_1CB667: db $25, $59, $E2, $25, $25, $59, $CC, $2D ; l⎵[wi]ll⎵[pro]t
#_1CB66F: db $1E, $1C, $2D, $59, $B6, $2C ; ect⎵[it]s
#_1CB675: db $75 ; line 2
#_1CB676: db $97, $1A, $CE, $2B, $59, $A9, $26, $59 ; [be]a[re]r⎵[fro]m⎵
#_1CB67E: db $D8, $59, $BD, $20, $22, $1C, $1A, $25 ; [the]⎵[ma]gical
#_1CB686: db $59, $1A, $22, $2B, $59, $C6 ; ⎵air⎵[of]
#_1CB68C: db $76 ; line 3
#_1CB68D: db $D8, $59, $06, $28, $25, $1D, $A0, $0B ; [the]⎵Gold[en ]L
#_1CB695: db $90, $42, $59, $D2, $59, $E3, $59, $1C ; [and],⎵[so]⎵[you]⎵c
#_1CB69D: db $93 ; [an]
#_1CB69E: db $7E ; wait for key
#_1CB69F: db $73 ; scroll text
#_1CB6A0: db $24, $1E, $1E, $29, $59, $E3, $2B, $59 ; keep⎵[you]r⎵
#_1CB6A8: db $21, $2E, $BC, $59, $D1, $1A, $29, $1E ; hu[man]⎵[sh]ape
#_1CB6B0: db $59, $D8, $CE, $41 ; ⎵[the][re].
#_1CB6B4: db $73 ; scroll text
#_1CB6B5: db $00, $25, $25, $59, $08, $59, $99, $9F ; All⎵I⎵[can ][do]
#_1CB6BD: db $59, $A8, $59, $E3, $59, $27, $28, $30 ; ⎵[for]⎵[you]⎵now
#_1CB6C5: db $59, $B5 ; ⎵[is]
#_1CB6C7: db $73 ; scroll text
#_1CB6C8: db $9B, $A8, $2D, $59, $E3, $2B, $59, $E0 ; [com][for]t⎵[you]r⎵[we]
#_1CB6D0: db $1A, $2B, $B4, $1E, $2C, $2C, $43, $59 ; ar[in]ess…⎵
#_1CB6D8: db $7E ; wait for key
#_1CB6D9: db $73 ; scroll text
#_1CB6DA: db $02, $28, $BE, $59, $96, $9C, $59, $AF ; Co[me]⎵[ba][ck]⎵[her]
#_1CB6E2: db $1E, $59, $93, $32, $59, $2D, $22, $BE ; e⎵[an]y⎵ti[me]
#_1CB6EA: db $41 ; .
#_1CB6EB: db $7F ; end of message

;===================================================================================================
; [LINK], I think the wizard
; connected the two worlds
; somewhere around the castle.
; All I can do for you now is to
; comfort your weariness…
; Come back here any time.
;---------------------------------------------------------------------------------------------------
Message_00A0:
#_1CB6EC: db $6A, $42, $59, $08, $59, $D5, $24, $59 ; [LINK],⎵I⎵[thin]k⎵
#_1CB6F4: db $D8, $59, $E2, $33, $1A, $2B, $1D ; [the]⎵[wi]zard
#_1CB6FB: db $75 ; line 2
#_1CB6FC: db $1C, $C7, $27, $1E, $1C, $2D, $A4, $D8 ; c[on]nect[ed ][the]
#_1CB704: db $59, $2D, $30, $28, $59, $30, $C8, $25 ; ⎵two⎵w[or]l
#_1CB70C: db $1D, $2C ; ds
#_1CB70E: db $76 ; line 3
#_1CB70F: db $CF, $E1, $A6, $1E, $59, $1A, $2B, $C4 ; [some][wh][er]e⎵ar[ound]
#_1CB717: db $59, $D8, $59, $1C, $92, $25, $1E, $41 ; ⎵[the]⎵c[ast]le.
#_1CB71F: db $7E ; wait for key
#_1CB720: db $73 ; scroll text
#_1CB721: db $00, $25, $25, $59, $08, $59, $99, $9F ; All⎵I⎵[can ][do]
#_1CB729: db $59, $A8, $59, $E3, $59, $27, $28, $30 ; ⎵[for]⎵[you]⎵now
#_1CB731: db $59, $B5, $59, $DA ; ⎵[is]⎵[to]
#_1CB735: db $73 ; scroll text
#_1CB736: db $9B, $A8, $2D, $59, $E3, $2B, $59, $E0 ; [com][for]t⎵[you]r⎵[we]
#_1CB73E: db $1A, $2B, $B4, $1E, $2C, $2C, $43 ; ar[in]ess…
#_1CB745: db $73 ; scroll text
#_1CB746: db $02, $28, $BE, $59, $96, $9C, $59, $AF ; Co[me]⎵[ba][ck]⎵[her]
#_1CB74E: db $1E, $59, $93, $32, $59, $2D, $22, $BE ; e⎵[an]y⎵ti[me]
#_1CB756: db $41 ; .
#_1CB757: db $7F ; end of message

;===================================================================================================
; …mumble mumble…  My son
; really liked to play the flute,
; but he went to look for the
; Golden Power and has not
; returned… … …
; I wonder where he is and what
; he is doing now?…
; …  Zzzzzz  Zzzzzz
;---------------------------------------------------------------------------------------------------
Message_00A1:
#_1CB758: db $43, $BF, $26, $95, $59, $BF, $26, $95 ; …[mu]m[ble]⎵[mu]m[ble]
#_1CB760: db $43, $8A, $0C, $32, $59, $D2, $27 ; …[  ]My⎵[so]n
#_1CB767: db $75 ; line 2
#_1CB768: db $CE, $1A, $25, $B9, $25, $22, $24, $A4 ; [re]al[ly ]lik[ed ]
#_1CB770: db $DA, $59, $29, $BA, $32, $59, $D8, $59 ; [to]⎵p[la]y⎵[the]⎵
#_1CB778: db $1F, $25, $2E, $2D, $1E, $42 ; flute,
#_1CB77E: db $76 ; line 3
#_1CB77F: db $1B, $2E, $2D, $59, $21, $1E, $59, $E0 ; but⎵he⎵[we]
#_1CB787: db $27, $2D, $59, $DA, $59, $BB, $28, $24 ; nt⎵[to]⎵[lo]ok
#_1CB78F: db $59, $A8, $59, $D8 ; ⎵[for]⎵[the]
#_1CB793: db $7E ; wait for key
#_1CB794: db $73 ; scroll text
#_1CB795: db $06, $28, $25, $1D, $A0, $0F, $28, $E0 ; Gold[en ]Po[we]
#_1CB79D: db $2B, $59, $8C, $AE, $59, $C2 ; r⎵[and ][has]⎵[not]
#_1CB7A3: db $73 ; scroll text
#_1CB7A4: db $CE, $2D, $2E, $2B, $27, $1E, $1D, $43 ; [re]turned…
#_1CB7AC: db $59, $43, $59, $43 ; ⎵…⎵…
#_1CB7B0: db $73 ; scroll text
#_1CB7B1: db $08, $59, $30, $C7, $1D, $A1, $E1, $A6 ; I⎵w[on]d[er ][wh][er]
#_1CB7B9: db $1E, $59, $21, $1E, $59, $B5, $59, $8C ; e⎵he⎵[is]⎵[and ]
#_1CB7C1: db $E1, $94 ; [wh][at]
#_1CB7C3: db $7E ; wait for key
#_1CB7C4: db $73 ; scroll text
#_1CB7C5: db $21, $1E, $59, $B5, $59, $9F, $B3, $27 ; he⎵[is]⎵[do][ing ]n
#_1CB7CD: db $28, $30, $3F, $43 ; ow?…
#_1CB7D1: db $73 ; scroll text
#_1CB7D2: db $43, $8A, $19, $33, $33, $33, $33, $33 ; …[  ]Zzzzzz
#_1CB7DA: db $8A, $19, $33, $33, $33, $33, $33 ; [  ]Zzzzzz
#_1CB7E1: db $7F ; end of message

;===================================================================================================
; …mumble mumble…  Oh?  This
; is my son's flute…!
; Did you meet my son?
; Where is he?  Is he all right?
; … … … …
; 
; Oh, I see…  Well, I can tell
; what you want to say by the
; look in your eyes…
;---------------------------------------------------------------------------------------------------
Message_00A2:
#_1CB7E2: db $43, $BF, $26, $95, $59, $BF, $26, $95 ; …[mu]m[ble]⎵[mu]m[ble]
#_1CB7EA: db $43, $8A, $0E, $21, $3F, $8A, $E7, $2C ; …[  ]Oh?[  ][Thi]s
#_1CB7F2: db $75 ; line 2
#_1CB7F3: db $B5, $59, $26, $32, $59, $D2, $27, $8B ; [is]⎵my⎵[so]n['s ]
#_1CB7FB: db $1F, $25, $2E, $2D, $1E, $43, $3E ; flute…!
#_1CB802: db $76 ; line 3
#_1CB803: db $03, $22, $1D, $59, $E3, $59, $BE, $1E ; Did⎵[you]⎵[me]e
#_1CB80B: db $2D, $59, $26, $32, $59, $D2, $27, $3F ; t⎵my⎵[so]n?
#_1CB813: db $7E ; wait for key
#_1CB814: db $73 ; scroll text
#_1CB815: db $16, $AF, $1E, $59, $B5, $59, $21, $1E ; W[her]e⎵[is]⎵he
#_1CB81D: db $3F, $8A, $08, $2C, $59, $21, $1E, $59 ; ?[  ]Is⎵he⎵
#_1CB825: db $8E, $2B, $22, $20, $21, $2D, $3F ; [all ]right?
#_1CB82C: db $73 ; scroll text
#_1CB82D: db $43, $59, $43, $59, $43, $59, $43 ; …⎵…⎵…⎵…
#_1CB834: db $73 ; scroll text
#_1CB835: db $7E ; wait for key
#_1CB836: db $73 ; scroll text
#_1CB837: db $0E, $21, $42, $59, $08, $59, $D0, $1E ; Oh,⎵I⎵[se]e
#_1CB83F: db $43, $8A, $16, $1E, $25, $25, $42, $59 ; …[  ]Well,⎵
#_1CB847: db $08, $59, $99, $2D, $1E, $25, $25 ; I⎵[can ]tell
#_1CB84E: db $73 ; scroll text
#_1CB84F: db $E1, $91, $E3, $59, $DF, $27, $2D, $59 ; [wh][at ][you]⎵[wa]nt⎵
#_1CB857: db $DA, $59, $2C, $1A, $32, $59, $1B, $32 ; [to]⎵say⎵by
#_1CB85F: db $59, $D8 ; ⎵[the]
#_1CB861: db $73 ; scroll text
#_1CB862: db $BB, $28, $24, $59, $B4, $59, $E3, $2B ; [lo]ok⎵[in]⎵[you]r
#_1CB86A: db $59, $1E, $32, $1E, $2C, $43 ; ⎵eyes…
#_1CB870: db $7F ; end of message

;===================================================================================================
; Would you keep the flute?
; And will you play its sweet
; melody for the bird in the
; village square?
; I beg of you, please!
; My son would probably want it
; this way…
; …But still, I wish I could
; see him once more…
;---------------------------------------------------------------------------------------------------
Message_00A3:
#_1CB871: db $16, $28, $2E, $25, $1D, $59, $E3, $59 ; Would⎵[you]⎵
#_1CB879: db $24, $1E, $1E, $29, $59, $D8, $59, $1F ; keep⎵[the]⎵f
#_1CB881: db $25, $2E, $2D, $1E, $3F ; lute?
#_1CB886: db $75 ; line 2
#_1CB887: db $00, $27, $1D, $59, $E2, $25, $25, $59 ; And⎵[wi]ll⎵
#_1CB88F: db $E3, $59, $29, $BA, $32, $59, $B6, $2C ; [you]⎵p[la]y⎵[it]s
#_1CB897: db $59, $2C, $E0, $1E, $2D ; ⎵s[we]et
#_1CB89C: db $76 ; line 3
#_1CB89D: db $BE, $BB, $1D, $32, $59, $A8, $59, $D8 ; [me][lo]dy⎵[for]⎵[the]
#_1CB8A5: db $59, $1B, $22, $2B, $1D, $59, $B4, $59 ; ⎵bird⎵[in]⎵
#_1CB8AD: db $D8 ; [the]
#_1CB8AE: db $7E ; wait for key
#_1CB8AF: db $73 ; scroll text
#_1CB8B0: db $2F, $22, $25, $BA, $20, $1E, $59, $2C ; vil[la]ge⎵s
#_1CB8B8: db $2A, $2E, $1A, $CE, $3F ; qua[re]?
#_1CB8BD: db $73 ; scroll text
#_1CB8BE: db $08, $59, $97, $20, $59, $C6, $59, $E3 ; I⎵[be]g⎵[of]⎵[you]
#_1CB8C6: db $42, $59, $CA, $1A, $D0, $3E ; ,⎵[ple]a[se]!
#_1CB8CC: db $73 ; scroll text
#_1CB8CD: db $0C, $32, $59, $D2, $27, $59, $30, $28 ; My⎵[so]n⎵wo
#_1CB8D5: db $2E, $25, $1D, $59, $CC, $96, $1B, $B9 ; uld⎵[pro][ba]b[ly ]
#_1CB8DD: db $DF, $27, $2D, $59, $B6 ; [wa]nt⎵[it]
#_1CB8E2: db $7E ; wait for key
#_1CB8E3: db $73 ; scroll text
#_1CB8E4: db $D9, $2C, $59, $DF, $32, $43 ; [thi]s⎵[wa]y…
#_1CB8EA: db $73 ; scroll text
#_1CB8EB: db $43, $01, $2E, $2D, $59, $D3, $22, $25 ; …But⎵[st]il
#_1CB8F3: db $25, $42, $59, $08, $59, $E2, $D1, $59 ; l,⎵I⎵[wi][sh]⎵
#_1CB8FB: db $08, $59, $1C, $28, $2E, $25, $1D ; I⎵could
#_1CB902: db $73 ; scroll text
#_1CB903: db $D0, $1E, $59, $B0, $26, $59, $C7, $1C ; [se]e⎵[hi]m⎵[on]c
#_1CB90B: db $1E, $59, $26, $C8, $1E, $43 ; e⎵m[or]e…
#_1CB911: db $7F ; end of message

;===================================================================================================
; Zzzzzzz  Zzzzzzzz
; …  …  …
; Snore  Zzzzzz  Zzzzzz
;---------------------------------------------------------------------------------------------------
Message_00A4:
#_1CB912: db $19, $33, $33, $33, $33, $33, $33, $8A ; Zzzzzzz[  ]
#_1CB91A: db $19, $33, $33, $33, $33, $33, $33, $33 ; Zzzzzzzz
#_1CB922: db $75 ; line 2
#_1CB923: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CB928: db $76 ; line 3
#_1CB929: db $12, $27, $C8, $1E, $8A, $19, $33, $33 ; Sn[or]e[  ]Zzz
#_1CB931: db $33, $33, $33, $8A, $19, $33, $33, $33 ; zzz[  ]Zzzz
#_1CB939: db $33, $33 ; zz
#_1CB93B: db $7F ; end of message

;===================================================================================================
; Oh, [LINK].  The rumors say
; you kidnapped the Princess,
; but I still trust you.
;---------------------------------------------------------------------------------------------------
Message_00A5:
#_1CB93C: db $0E, $21, $42, $59, $6A, $41, $8A, $E6 ; Oh,⎵[LINK].[  ][The]
#_1CB944: db $59, $2B, $2E, $26, $C8, $2C, $59, $2C ; ⎵rum[or]s⎵s
#_1CB94C: db $1A, $32 ; ay
#_1CB94E: db $75 ; line 2
#_1CB94F: db $E3, $59, $24, $22, $1D, $27, $1A, $29 ; [you]⎵kidnap
#_1CB957: db $29, $A4, $D8, $59, $0F, $2B, $B4, $1C ; p[ed ][the]⎵Pr[in]c
#_1CB95F: db $1E, $2C, $2C, $42 ; ess,
#_1CB963: db $76 ; line 3
#_1CB964: db $1B, $2E, $2D, $59, $08, $59, $D3, $22 ; but⎵I⎵[st]i
#_1CB96C: db $25, $25, $59, $DB, $2E, $D3, $59, $E3 ; ll⎵[tr]u[st]⎵[you]
#_1CB974: db $41 ; .
#_1CB975: db $7F ; end of message

;===================================================================================================
; I can't believe you caught me!
; With your speed it must have
; been easy to kidnap Zelda…
; You don't look like such a bad
; guy, though…
; Anyway, because you have
; such quick feet, it might be a
; good idea to run and bash into
; many things…
; For example, the trees in this
; village have many useful things
; hanging in their branches…
; Well, just try it, OK?!
;---------------------------------------------------------------------------------------------------
Message_00A6:
#_1CB976: db $08, $59, $1C, $93, $51, $2D, $59, $97 ; I⎵c[an]'t⎵[be]
#_1CB97E: db $25, $22, $A7, $1E, $59, $E3, $59, $1C ; li[ev]e⎵[you]⎵c
#_1CB986: db $1A, $2E, $20, $21, $2D, $59, $BE, $3E ; aught⎵[me]!
#_1CB98E: db $75 ; line 2
#_1CB98F: db $16, $B6, $21, $59, $E3, $2B, $59, $2C ; W[it]h⎵[you]r⎵s
#_1CB997: db $29, $1E, $A4, $B6, $59, $BF, $D3, $59 ; pe[ed ][it]⎵[mu][st]⎵
#_1CB99F: db $AD ; [have]
#_1CB9A0: db $76 ; line 3
#_1CB9A1: db $97, $A0, $1E, $1A, $2C, $32, $59, $DA ; [be][en ]easy⎵[to]
#_1CB9A9: db $59, $24, $22, $1D, $27, $1A, $29, $59 ; ⎵kidnap⎵
#_1CB9B1: db $19, $1E, $25, $1D, $1A, $43 ; Zelda…
#_1CB9B7: db $7E ; wait for key
#_1CB9B8: db $73 ; scroll text
#_1CB9B9: db $E8, $59, $9F, $C0, $BB, $28, $24, $59 ; [You]⎵[do][n't ][lo]ok⎵
#_1CB9C1: db $25, $22, $24, $1E, $59, $2C, $2E, $1C ; like⎵suc
#_1CB9C9: db $21, $59, $1A, $59, $96, $1D ; h⎵a⎵[ba]d
#_1CB9CF: db $73 ; scroll text
#_1CB9D0: db $20, $2E, $32, $42, $59, $2D, $21, $28 ; guy,⎵tho
#_1CB9D8: db $2E, $20, $21, $43 ; ugh…
#_1CB9DC: db $73 ; scroll text
#_1CB9DD: db $00, $27, $32, $DF, $32, $42, $59, $97 ; Any[wa]y,⎵[be]
#_1CB9E5: db $1C, $1A, $2E, $D0, $59, $E3, $59, $AD ; cau[se]⎵[you]⎵[have]
#_1CB9ED: db $7E ; wait for key
#_1CB9EE: db $73 ; scroll text
#_1CB9EF: db $2C, $2E, $1C, $21, $59, $2A, $2E, $22 ; such⎵qui
#_1CB9F7: db $9C, $59, $1F, $1E, $1E, $2D, $42, $59 ; [ck]⎵feet,⎵
#_1CB9FF: db $B6, $59, $26, $B2, $97, $59, $1A ; [it]⎵m[ight ][be]⎵a
#_1CBA06: db $73 ; scroll text
#_1CBA07: db $AC, $28, $1D, $59, $22, $1D, $1E, $1A ; [go]od⎵idea
#_1CBA0F: db $59, $DA, $59, $2B, $2E, $27, $59, $8C ; ⎵[to]⎵run⎵[and ]
#_1CBA17: db $96, $D1, $59, $B4, $DA ; [ba][sh]⎵[in][to]
#_1CBA1C: db $73 ; scroll text
#_1CBA1D: db $BC, $32, $59, $D5, $20, $2C, $43 ; [man]y⎵[thin]gs…
#_1CBA24: db $7E ; wait for key
#_1CBA25: db $73 ; scroll text
#_1CBA26: db $05, $C8, $59, $1E, $31, $1A, $26, $CA ; F[or]⎵exam[ple]
#_1CBA2E: db $42, $59, $D8, $59, $DB, $1E, $1E, $2C ; ,⎵[the]⎵[tr]ees
#_1CBA36: db $59, $B4, $59, $D9, $2C ; ⎵[in]⎵[thi]s
#_1CBA3B: db $73 ; scroll text
#_1CBA3C: db $2F, $22, $25, $BA, $20, $1E, $59, $AD ; vil[la]ge⎵[have]
#_1CBA44: db $59, $BC, $32, $59, $2E, $D0, $1F, $2E ; ⎵[man]y⎵u[se]fu
#_1CBA4C: db $25, $59, $D5, $20, $2C ; l⎵[thin]gs
#_1CBA51: db $73 ; scroll text
#_1CBA52: db $B1, $27, $20, $B3, $B4, $59, $D8, $22 ; [ha]ng[ing ][in]⎵[the]i
#_1CBA5A: db $2B, $59, $1B, $2B, $93, $9A, $2C, $43 ; r⎵br[an][che]s…
#_1CBA62: db $7E ; wait for key
#_1CBA63: db $73 ; scroll text
#_1CBA64: db $16, $1E, $25, $25, $42, $59, $B7, $59 ; Well,⎵[just]⎵
#_1CBA6C: db $DB, $32, $59, $B6, $42, $59, $0E, $0A ; [tr]y⎵[it],⎵OK
#_1CBA74: db $3F, $3E ; ?!
#_1CBA76: db $7F ; end of message

;===================================================================================================
; If you have enough time to
; read this sign, you should go
; to the goal immediately!
;---------------------------------------------------------------------------------------------------
Message_00A7:
#_1CBA77: db $08, $1F, $59, $E3, $59, $AD, $59, $A5 ; If⎵[you]⎵[have]⎵[en]
#_1CBA7F: db $28, $2E, $20, $21, $59, $2D, $22, $BE ; ough⎵ti[me]
#_1CBA87: db $59, $DA ; ⎵[to]
#_1CBA89: db $75 ; line 2
#_1CBA8A: db $CE, $1A, $1D, $59, $D9, $2C, $59, $2C ; [re]ad⎵[thi]s⎵s
#_1CBA92: db $22, $20, $27, $42, $59, $E3, $59, $D1 ; ign,⎵[you]⎵[sh]
#_1CBA9A: db $28, $2E, $25, $1D, $59, $AC ; ould⎵[go]
#_1CBAA0: db $76 ; line 3
#_1CBAA1: db $DA, $59, $D8, $59, $AC, $1A, $25, $59 ; [to]⎵[the]⎵[go]al⎵
#_1CBAA9: db $22, $26, $BE, $9E, $94, $1E, $25, $32 ; im[me][di][at]ely
#_1CBAB1: db $3E ; !
#_1CBAB2: db $7F ; end of message

;===================================================================================================
; I'll give a piece of Heart to
; the person who wears the Cape.
;---------------------------------------------------------------------------------------------------
Message_00A8:
#_1CBAB3: db $08, $51, $25, $25, $59, $AA, $1A, $59 ; I'll⎵[give ]a⎵
#_1CBABB: db $29, $22, $1E, $1C, $1E, $59, $C6, $59 ; piece⎵[of]⎵
#_1CBAC3: db $07, $A2, $2D, $59, $DA ; H[ear]t⎵[to]
#_1CBAC8: db $75 ; line 2
#_1CBAC9: db $D8, $59, $C9, $D2, $27, $59, $E1, $28 ; [the]⎵[per][so]n⎵[wh]o
#_1CBAD1: db $59, $E0, $1A, $2B, $2C, $59, $D8, $59 ; ⎵[we]ars⎵[the]⎵
#_1CBAD9: db $02, $1A, $29, $1E, $41 ; Cape.
#_1CBADE: db $7F ; end of message

;===================================================================================================
; Curses to anyone who throws
; something into my circle of
; stones.
;---------------------------------------------------------------------------------------------------
Message_00A9:
#_1CBADF: db $02, $2E, $2B, $D0, $2C, $59, $DA, $59 ; Cur[se]s⎵[to]⎵
#_1CBAE7: db $93, $32, $C7, $1E, $59, $E1, $28, $59 ; [an]y[on]e⎵[wh]o⎵
#_1CBAEF: db $2D, $21, $2B, $28, $30, $2C ; throws
#_1CBAF5: db $75 ; line 2
#_1CBAF6: db $CF, $D5, $20, $59, $B4, $DA, $59, $26 ; [some][thin]g⎵[in][to]⎵m
#_1CBAFE: db $32, $59, $1C, $22, $2B, $1C, $25, $1E ; y⎵circle
#_1CBB06: db $59, $C6 ; ⎵[of]
#_1CBB08: db $76 ; line 3
#_1CBB09: db $D3, $C7, $1E, $2C, $41 ; [st][on]es.
#_1CBB0E: db $7F ; end of message

;===================================================================================================
; This way ↑ Skeleton Forest
; This way ↓ Village Of Outcasts
;---------------------------------------------------------------------------------------------------
Message_00AA:
#_1CBB0F: db $E7, $2C, $59, $DF, $32, $59, $4D, $59 ; [Thi]s⎵[wa]y⎵↑⎵
#_1CBB17: db $12, $24, $1E, $25, $1E, $DA, $27, $59 ; Skele[to]n⎵
#_1CBB1F: db $05, $C8, $1E, $D3 ; F[or]e[st]
#_1CBB23: db $76 ; line 3
#_1CBB24: db $E7, $2C, $59, $DF, $32, $59, $4E, $59 ; [Thi]s⎵[wa]y⎵↓⎵
#_1CBB2C: db $15, $22, $25, $BA, $20, $1E, $59, $0E ; Vil[la]ge⎵O
#_1CBB34: db $1F, $59, $0E, $2E, $2D, $1C, $92, $2C ; f⎵Outc[ast]s
#_1CBB3C: db $7F ; end of message

;===================================================================================================
; This way → Cave
;---------------------------------------------------------------------------------------------------
Message_00AB:
#_1CBB3D: db $75 ; line 2
#_1CBB3E: db $E7, $2C, $59, $DF, $32, $59, $50, $59 ; [Thi]s⎵[wa]y⎵→⎵
#_1CBB46: db $02, $1A, $2F, $1E ; Cave
#_1CBB4A: db $7F ; end of message

;===================================================================================================
; This way → Palace Of Darkness
;---------------------------------------------------------------------------------------------------
Message_00AC:
#_1CBB4B: db $75 ; line 2
#_1CBB4C: db $E7, $2C, $59, $DF, $32, $59, $50, $59 ; [Thi]s⎵[wa]y⎵→⎵
#_1CBB54: db $0F, $1A, $BA, $1C, $1E, $59, $0E, $1F ; Pa[la]ce⎵Of
#_1CBB5C: db $59, $03, $1A, $2B, $24, $27, $1E, $2C ; ⎵Darknes
#_1CBB64: db $2C ; s
#_1CBB65: db $7F ; end of message

;===================================================================================================
; This way ← Bomb Shop
;---------------------------------------------------------------------------------------------------
Message_00AD:
#_1CBB66: db $75 ; line 2
#_1CBB67: db $E7, $2C, $59, $DF, $32, $59, $4F, $59 ; [Thi]s⎵[wa]y⎵←⎵
#_1CBB6F: db $01, $28, $26, $1B, $59, $12, $21, $28 ; Bomb⎵Sho
#_1CBB77: db $29 ; p
#_1CBB78: db $7F ; end of message

;===================================================================================================
; ←  Swamp Of Evil
;          No Entrance
;          No Escape
;---------------------------------------------------------------------------------------------------
Message_00AE:
#_1CBB79: db $4F, $8A, $12, $DF, $26, $29, $59, $0E ; ←[  ]S[wa]mp⎵O
#_1CBB81: db $1F, $59, $04, $2F, $22, $25 ; f⎵Evil
#_1CBB87: db $75 ; line 2
#_1CBB88: db $88, $88, $59, $0D, $28, $59, $04, $27 ; [    ][    ]⎵No⎵En
#_1CBB90: db $DB, $93, $1C, $1E ; [tr][an]ce
#_1CBB94: db $76 ; line 3
#_1CBB95: db $88, $88, $59, $0D, $28, $59, $04, $2C ; [    ][    ]⎵No⎵Es
#_1CBB9D: db $1C, $1A, $29, $1E ; cape
#_1CBBA1: db $7F ; end of message

;===================================================================================================
; This is the Village Of Outcasts.
; People without Rupees are not
; welcome here.
;---------------------------------------------------------------------------------------------------
Message_00AF:
#_1CBBA2: db $E7, $2C, $59, $B5, $59, $D8, $59, $15 ; [Thi]s⎵[is]⎵[the]⎵V
#_1CBBAA: db $22, $25, $BA, $20, $1E, $59, $0E, $1F ; il[la]ge⎵Of
#_1CBBB2: db $59, $0E, $2E, $2D, $1C, $92, $2C, $41 ; ⎵Outc[ast]s.
#_1CBBBA: db $75 ; line 2
#_1CBBBB: db $0F, $1E, $28, $CA, $59, $DE, $C5, $11 ; Peo[ple]⎵[with][out ]R
#_1CBBC3: db $DC, $1E, $1E, $2C, $59, $8D, $C2 ; [up]ees⎵[are ][not]
#_1CBBCA: db $76 ; line 3
#_1CBBCB: db $E0, $25, $9B, $1E, $59, $AF, $1E, $41 ; [we]l[com]e⎵[her]e.
#_1CBBD3: db $7F ; end of message

;===================================================================================================
; The Waterfall Of Wishing is just
; around the corner.
;---------------------------------------------------------------------------------------------------
Message_00B0:
#_1CBBD4: db $E6, $59, $16, $94, $A6, $1F, $8E, $0E ; [The]⎵W[at][er]f[all ]O
#_1CBBDC: db $1F, $59, $16, $B5, $B0, $27, $20, $59 ; f⎵W[is][hi]ng⎵
#_1CBBE4: db $B5, $59, $B7 ; [is]⎵[just]
#_1CBBE7: db $75 ; line 2
#_1CBBE8: db $1A, $2B, $C4, $59, $D8, $59, $1C, $C8 ; ar[ound]⎵[the]⎵c[or]
#_1CBBF0: db $27, $A6, $41 ; n[er].
#_1CBBF3: db $7F ; end of message

;===================================================================================================
; This way →↑
; Lake Of Ill Omen
;---------------------------------------------------------------------------------------------------
Message_00B1:
#_1CBBF4: db $E7, $2C, $59, $DF, $32, $59, $50, $4D ; [Thi]s⎵[wa]y⎵→↑
#_1CBBFC: db $75 ; line 2
#_1CBBFD: db $0B, $1A, $24, $1E, $59, $0E, $1F, $59 ; Lake⎵Of⎵
#_1CBC05: db $08, $25, $25, $59, $0E, $BE, $27 ; Ill⎵O[me]n
#_1CBC0C: db $7F ; end of message

;===================================================================================================
; After Agahnim took over,
; everyone began to act
; strangely.
; I suppose it's only
; a matter of time before
; I'm affected, too.
;---------------------------------------------------------------------------------------------------
Message_00B2:
#_1CBC0D: db $00, $1F, $D4, $00, $20, $1A, $21, $27 ; Af[ter ]Agahn
#_1CBC15: db $22, $26, $59, $DA, $28, $24, $59, $28 ; im⎵[to]ok⎵o
#_1CBC1D: db $DD, $42 ; [ver],
#_1CBC1F: db $75 ; line 2
#_1CBC20: db $A7, $A6, $32, $C7, $1E, $59, $97, $20 ; [ev][er]y[on]e⎵[be]g
#_1CBC28: db $93, $59, $DA, $59, $1A, $1C, $2D ; [an]⎵[to]⎵act
#_1CBC2F: db $76 ; line 3
#_1CBC30: db $D3, $2B, $93, $20, $1E, $25, $32, $41 ; [st]r[an]gely.
#_1CBC38: db $7E ; wait for key
#_1CBC39: db $73 ; scroll text
#_1CBC3A: db $08, $59, $2C, $DC, $29, $28, $D0, $59 ; I⎵s[up]po[se]⎵
#_1CBC42: db $B6, $8B, $C7, $25, $32 ; [it]['s ][on]ly
#_1CBC47: db $73 ; scroll text
#_1CBC48: db $1A, $59, $BD, $2D, $D4, $C6, $59, $2D ; a⎵[ma]t[ter ][of]⎵t
#_1CBC50: db $22, $BE, $59, $97, $A8, $1E ; i[me]⎵[be][for]e
#_1CBC56: db $73 ; scroll text
#_1CBC57: db $08, $51, $26, $59, $1A, $1F, $1F, $1E ; I'm⎵affe
#_1CBC5F: db $1C, $2D, $1E, $1D, $42, $59, $DA, $28 ; cted,⎵[to]o
#_1CBC67: db $41 ; .
#_1CBC68: db $7F ; end of message

;===================================================================================================
; Hey hey!  You're not allowed in
; the castle, son!
; Go home and get some sleep!
;---------------------------------------------------------------------------------------------------
Message_00B3:
#_1CBC69: db $07, $1E, $32, $59, $21, $1E, $32, $3E ; Hey⎵hey!
#_1CBC71: db $8A, $E8, $51, $CD, $C2, $59, $1A, $25 ; [  ][You]'[re ][not]⎵al
#_1CBC79: db $BB, $E0, $1D, $59, $B4 ; [lo][we]d⎵[in]
#_1CBC7E: db $75 ; line 2
#_1CBC7F: db $D8, $59, $1C, $92, $25, $1E, $42, $59 ; [the]⎵c[ast]le,⎵
#_1CBC87: db $D2, $27, $3E ; [so]n!
#_1CBC8A: db $76 ; line 3
#_1CBC8B: db $06, $28, $59, $21, $28, $BE, $59, $8C ; Go⎵ho[me]⎵[and ]
#_1CBC93: db $AB, $59, $CF, $59, $2C, $25, $1E, $1E ; [get]⎵[some]⎵slee
#_1CBC9B: db $29, $3E ; p!
#_1CBC9D: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla.  I
; can talk to you telepathically
; when you touch these tiles.
; Here is a hint.  You can use the
; treasure hidden in this palace
; to defeat armored foes.
;---------------------------------------------------------------------------------------------------
Message_00B4:
#_1CBC9E: db $6B, $02 ; set window border
#_1CBCA0: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CBCA8: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CBCB0: db $BA, $41, $8A, $08 ; [la].[  ]I
#_1CBCB4: db $75 ; line 2
#_1CBCB5: db $99, $2D, $1A, $25, $24, $59, $DA, $59 ; [can ]talk⎵[to]⎵
#_1CBCBD: db $E3, $59, $2D, $1E, $25, $1E, $29, $94 ; [you]⎵telep[at]
#_1CBCC5: db $B0, $1C, $1A, $25, $25, $32 ; [hi]cally
#_1CBCCB: db $76 ; line 3
#_1CBCCC: db $E1, $A0, $E3, $59, $DA, $2E, $1C, $21 ; [wh][en ][you]⎵[to]uch
#_1CBCD4: db $59, $D8, $D0, $59, $2D, $22, $25, $1E ; ⎵[the][se]⎵tile
#_1CBCDC: db $2C, $41 ; s.
#_1CBCDE: db $7E ; wait for key
#_1CBCDF: db $73 ; scroll text
#_1CBCE0: db $E4, $1E, $59, $B5, $59, $1A, $59, $B0 ; [Her]e⎵[is]⎵a⎵[hi]
#_1CBCE8: db $27, $2D, $41, $8A, $E8, $59, $99, $2E ; nt.[  ][You]⎵[can ]u
#_1CBCF0: db $D0, $59, $D8 ; [se]⎵[the]
#_1CBCF3: db $73 ; scroll text
#_1CBCF4: db $DB, $1E, $1A, $2C, $2E, $CD, $B0, $1D ; [tr]easu[re ][hi]d
#_1CBCFC: db $1D, $A0, $B4, $59, $D9, $2C, $59, $29 ; d[en ][in]⎵[thi]s⎵p
#_1CBD04: db $1A, $BA, $1C, $1E ; a[la]ce
#_1CBD08: db $73 ; scroll text
#_1CBD09: db $DA, $59, $1D, $1E, $1F, $1E, $91, $1A ; [to]⎵defe[at ]a
#_1CBD11: db $2B, $26, $C8, $A4, $1F, $28, $1E, $2C ; rm[or][ed ]foes
#_1CBD19: db $41 ; .
#_1CBD1A: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla the
; elder.  An orb known as the
; Moon Pearl is in this tower.
; Whoever holds the Moon Pearl is
; protected so that his form will
; not change in the Dark World.
; You must find it and escape
; from the tower!
; Don't forget the Moon Pearl…
;---------------------------------------------------------------------------------------------------
Message_00B5:
#_1CBD1B: db $6B, $02 ; set window border
#_1CBD1D: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CBD25: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CBD2D: db $BA, $59, $D8 ; [la]⎵[the]
#_1CBD30: db $75 ; line 2
#_1CBD31: db $1E, $25, $1D, $A6, $41, $8A, $00, $27 ; eld[er].[  ]An
#_1CBD39: db $59, $C8, $1B, $59, $B8, $27, $59, $1A ; ⎵[or]b⎵[know]n⎵a
#_1CBD41: db $2C, $59, $D8 ; s⎵[the]
#_1CBD44: db $76 ; line 3
#_1CBD45: db $0C, $28, $C7, $59, $0F, $A2, $25, $59 ; Mo[on]⎵P[ear]l⎵
#_1CBD4D: db $B5, $59, $B4, $59, $D9, $2C, $59, $DA ; [is]⎵[in]⎵[thi]s⎵[to]
#_1CBD55: db $E0, $2B, $41 ; [we]r.
#_1CBD58: db $7E ; wait for key
#_1CBD59: db $73 ; scroll text
#_1CBD5A: db $16, $21, $28, $A7, $A1, $21, $28, $25 ; Who[ev][er ]hol
#_1CBD62: db $1D, $2C, $59, $D8, $59, $0C, $28, $C7 ; ds⎵[the]⎵Mo[on]
#_1CBD6A: db $59, $0F, $A2, $25, $59, $B5 ; ⎵P[ear]l⎵[is]
#_1CBD70: db $73 ; scroll text
#_1CBD71: db $CC, $2D, $1E, $1C, $2D, $A4, $D2, $59 ; [pro]tect[ed ][so]⎵
#_1CBD79: db $D7, $2D, $59, $B0, $2C, $59, $A8, $26 ; [tha]t⎵[hi]s⎵[for]m
#_1CBD81: db $59, $E2, $25, $25 ; ⎵[wi]ll
#_1CBD85: db $73 ; scroll text
#_1CBD86: db $C2, $59, $1C, $B1, $27, $20, $1E, $59 ; [not]⎵c[ha]nge⎵
#_1CBD8E: db $B4, $59, $D8, $59, $03, $1A, $2B, $24 ; [in]⎵[the]⎵Dark
#_1CBD96: db $59, $16, $C8, $25, $1D, $41 ; ⎵W[or]ld.
#_1CBD9C: db $7E ; wait for key
#_1CBD9D: db $73 ; scroll text
#_1CBD9E: db $E8, $59, $BF, $D3, $59, $1F, $B4, $1D ; [You]⎵[mu][st]⎵f[in]d
#_1CBDA6: db $59, $B6, $59, $8C, $1E, $2C, $1C, $1A ; ⎵[it]⎵[and ]esca
#_1CBDAE: db $29, $1E ; pe
#_1CBDB0: db $73 ; scroll text
#_1CBDB1: db $A9, $26, $59, $D8, $59, $DA, $E0, $2B ; [fro]m⎵[the]⎵[to][we]r
#_1CBDB9: db $3E ; !
#_1CBDBA: db $73 ; scroll text
#_1CBDBB: db $03, $C7, $51, $2D, $59, $A8, $AB, $59 ; D[on]'t⎵[for][get]⎵
#_1CBDC3: db $D8, $59, $0C, $28, $C7, $59, $0F, $A2 ; [the]⎵Mo[on]⎵P[ear]
#_1CBDCB: db $25, $43 ; l…
#_1CBDCD: db $7F ; end of message

;===================================================================================================
; ☥𓈗☥Ƨ☥𓈗☥Ƨ☥𓈗𓈗𓈗𓈗☥Ƨ☥𓈗☥Ƨ
; ☥Ƨ☥☥𓈗☥Ƨ☥𓈗☥Ƨ
; ☥𓈗☥Ƨ☥☥𓈗☥ƧƧ𓈗☥☥Ƨ
;---------------------------------------------------------------------------------------------------
Message_00B6:
#_1CBDCE: db $47, $48, $47, $49, $47, $48, $47, $49 ; ☥𓈗☥Ƨ☥𓈗☥Ƨ
#_1CBDD6: db $47, $48, $48, $48, $48, $47, $49, $47 ; ☥𓈗𓈗𓈗𓈗☥Ƨ☥
#_1CBDDE: db $48, $47, $49 ; 𓈗☥Ƨ
#_1CBDE1: db $75 ; line 2
#_1CBDE2: db $47, $49, $47, $47, $48, $47, $49, $47 ; ☥Ƨ☥☥𓈗☥Ƨ☥
#_1CBDEA: db $48, $47, $49 ; 𓈗☥Ƨ
#_1CBDED: db $76 ; line 3
#_1CBDEE: db $47, $48, $47, $49, $47, $47, $48, $47 ; ☥𓈗☥Ƨ☥☥𓈗☥
#_1CBDF6: db $49, $49, $48, $47, $47, $49 ; ƧƧ𓈗☥☥Ƨ
#_1CBDFC: db $7F ; end of message

;===================================================================================================
; The Hero's triumph on
; Cataclysm's Eve
; Wins three symbols of virtue.
; The Master Sword he will then
; retrieve,
; Keeping the Knight's line true.
;---------------------------------------------------------------------------------------------------
Message_00B7:
#_1CBDFD: db $E6, $59, $E4, $28, $8B, $DB, $22, $2E ; [The]⎵[Her]o['s ][tr]iu
#_1CBE05: db $26, $29, $21, $59, $C7 ; mph⎵[on]
#_1CBE0A: db $75 ; line 2
#_1CBE0B: db $02, $94, $1A, $1C, $25, $32, $2C, $26 ; C[at]aclysm
#_1CBE13: db $8B, $04, $2F, $1E ; ['s ]Eve
#_1CBE17: db $76 ; line 3
#_1CBE18: db $16, $B4, $2C, $59, $2D, $21, $CE, $1E ; W[in]s⎵th[re]e
#_1CBE20: db $59, $2C, $32, $26, $98, $25, $2C, $59 ; ⎵sym[bo]ls⎵
#_1CBE28: db $C6, $59, $2F, $22, $2B, $2D, $2E, $1E ; [of]⎵virtue
#_1CBE30: db $41 ; .
#_1CBE31: db $7E ; wait for key
#_1CBE32: db $73 ; scroll text
#_1CBE33: db $E6, $59, $0C, $92, $A1, $12, $30, $C8 ; [The]⎵M[ast][er ]Sw[or]
#_1CBE3B: db $1D, $59, $21, $1E, $59, $E2, $25, $25 ; d⎵he⎵[wi]ll
#_1CBE43: db $59, $D8, $27 ; ⎵[the]n
#_1CBE46: db $73 ; scroll text
#_1CBE47: db $CE, $DB, $22, $A7, $1E, $42 ; [re][tr]i[ev]e,
#_1CBE4D: db $73 ; scroll text
#_1CBE4E: db $0A, $1E, $1E, $29, $B3, $D8, $59, $0A ; Keep[ing ][the]⎵K
#_1CBE56: db $27, $22, $20, $21, $2D, $8B, $25, $B4 ; night['s ]l[in]
#_1CBE5E: db $1E, $59, $DB, $2E, $1E, $41 ; e⎵[tr]ue.
#_1CBE64: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla.
; You must somehow make your
; way to the top of Spectacle
; Rock.  From there you can
; reach the Tower of Hera on
; top of Death Mountain.
;---------------------------------------------------------------------------------------------------
Message_00B8:
#_1CBE65: db $6B, $02 ; set window border
#_1CBE67: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CBE6F: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CBE77: db $BA, $41 ; [la].
#_1CBE79: db $75 ; line 2
#_1CBE7A: db $E8, $59, $BF, $D3, $59, $CF, $21, $28 ; [You]⎵[mu][st]⎵[some]ho
#_1CBE82: db $30, $59, $BD, $24, $1E, $59, $E3, $2B ; w⎵[ma]ke⎵[you]r
#_1CBE8A: db $76 ; line 3
#_1CBE8B: db $DF, $32, $59, $DA, $59, $D8, $59, $DA ; [wa]y⎵[to]⎵[the]⎵[to]
#_1CBE93: db $29, $59, $C6, $59, $12, $29, $1E, $1C ; p⎵[of]⎵Spec
#_1CBE9B: db $2D, $1A, $1C, $25, $1E ; tacle
#_1CBEA0: db $7E ; wait for key
#_1CBEA1: db $73 ; scroll text
#_1CBEA2: db $11, $28, $9C, $41, $8A, $05, $2B, $28 ; Ro[ck].[  ]Fro
#_1CBEAA: db $26, $59, $D8, $CD, $E3, $59, $1C, $93 ; m⎵[the][re ][you]⎵c[an]
#_1CBEB2: db $73 ; scroll text
#_1CBEB3: db $CE, $1A, $1C, $21, $59, $D8, $59, $13 ; [re]ach⎵[the]⎵T
#_1CBEBB: db $28, $E0, $2B, $59, $C6, $59, $E4, $1A ; o[we]r⎵[of]⎵[Her]a
#_1CBEC3: db $59, $C7 ; ⎵[on]
#_1CBEC5: db $73 ; scroll text
#_1CBEC6: db $DA, $29, $59, $C6, $59, $03, $1E, $94 ; [to]p⎵[of]⎵De[at]
#_1CBECE: db $21, $59, $0C, $28, $2E, $27, $2D, $8F ; h⎵Mount[ain]
#_1CBED6: db $41 ; .
#_1CBED7: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla.
; Objects exist simultaneously in
; both worlds with similar shapes.
; If the form of a thing changes,
; it will affect the shape of its
; twin in the other world.
;---------------------------------------------------------------------------------------------------
Message_00B9:
#_1CBED8: db $6B, $02 ; set window border
#_1CBEDA: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CBEE2: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CBEEA: db $BA, $41 ; [la].
#_1CBEEC: db $75 ; line 2
#_1CBEED: db $0E, $1B, $23, $1E, $1C, $2D, $2C, $59 ; Objects⎵
#_1CBEF5: db $1E, $31, $B5, $2D, $59, $2C, $22, $BF ; ex[is]t⎵si[mu]
#_1CBEFD: db $25, $2D, $93, $1E, $28, $2E, $2C, $B9 ; lt[an]eous[ly ]
#_1CBF05: db $B4 ; [in]
#_1CBF06: db $76 ; line 3
#_1CBF07: db $98, $2D, $21, $59, $30, $C8, $25, $1D ; [bo]th⎵w[or]ld
#_1CBF0F: db $2C, $59, $DE, $59, $2C, $22, $26, $22 ; s⎵[with]⎵simi
#_1CBF17: db $BA, $2B, $59, $D1, $1A, $29, $1E, $2C ; [la]r⎵[sh]apes
#_1CBF1F: db $41 ; .
#_1CBF20: db $7E ; wait for key
#_1CBF21: db $73 ; scroll text
#_1CBF22: db $08, $1F, $59, $D8, $59, $A8, $26, $59 ; If⎵[the]⎵[for]m⎵
#_1CBF2A: db $C6, $59, $1A, $59, $D5, $20, $59, $1C ; [of]⎵a⎵[thin]g⎵c
#_1CBF32: db $B1, $27, $20, $1E, $2C, $42 ; [ha]nges,
#_1CBF38: db $73 ; scroll text
#_1CBF39: db $B6, $59, $E2, $25, $25, $59, $1A, $1F ; [it]⎵[wi]ll⎵af
#_1CBF41: db $1F, $1E, $1C, $2D, $59, $D8, $59, $D1 ; fect⎵[the]⎵[sh]
#_1CBF49: db $1A, $29, $1E, $59, $C6, $59, $B6, $2C ; ape⎵[of]⎵[it]s
#_1CBF51: db $73 ; scroll text
#_1CBF52: db $2D, $E2, $27, $59, $B4, $59, $D8, $59 ; t[wi]n⎵[in]⎵[the]⎵
#_1CBF5A: db $28, $D8, $2B, $59, $30, $C8, $25, $1D ; o[the]r⎵w[or]ld
#_1CBF62: db $41 ; .
#_1CBF63: db $7F ; end of message

;===================================================================================================
; [LINK]…  It's me, Zelda…
; Don't be deceived by the magic
; of Blind the Thief!  Be careful!
;---------------------------------------------------------------------------------------------------
Message_00BA:
#_1CBF64: db $6B, $02 ; set window border
#_1CBF66: db $6A, $43, $8A, $08, $2D, $8B, $BE, $42 ; [LINK]…[  ]It['s ][me],
#_1CBF6E: db $59, $19, $1E, $25, $1D, $1A, $43 ; ⎵Zelda…
#_1CBF75: db $75 ; line 2
#_1CBF76: db $03, $C7, $51, $2D, $59, $97, $59, $1D ; D[on]'t⎵[be]⎵d
#_1CBF7E: db $1E, $1C, $1E, $22, $2F, $A4, $1B, $32 ; eceiv[ed ]by
#_1CBF86: db $59, $D8, $59, $BD, $20, $22, $1C ; ⎵[the]⎵[ma]gic
#_1CBF8D: db $76 ; line 3
#_1CBF8E: db $C6, $59, $01, $25, $B4, $1D, $59, $D8 ; [of]⎵Bl[in]d⎵[the]
#_1CBF96: db $59, $E7, $1E, $1F, $3E, $8A, $01, $1E ; ⎵[Thi]ef![  ]Be
#_1CBF9E: db $59, $1C, $1A, $CE, $1F, $2E, $25, $3E ; ⎵ca[re]ful!
#_1CBFA6: db $7F ; end of message

;===================================================================================================
; [LINK],  it is I, Sahasrahla
; the elder!  You must set fire
; to four torches to open
; the way forward.
;---------------------------------------------------------------------------------------------------
Message_00BB:
#_1CBFA7: db $6B, $02 ; set window border
#_1CBFA9: db $6A, $42, $8A, $B6, $59, $B5, $59, $08 ; [LINK],[  ][it]⎵[is]⎵I
#_1CBFB1: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CBFB9: db $BA ; [la]
#_1CBFBA: db $75 ; line 2
#_1CBFBB: db $D8, $59, $1E, $25, $1D, $A6, $3E, $8A ; [the]⎵eld[er]![  ]
#_1CBFC3: db $E8, $59, $BF, $D3, $59, $D0, $2D, $59 ; [You]⎵[mu][st]⎵[se]t⎵
#_1CBFCB: db $1F, $22, $CE ; fi[re]
#_1CBFCE: db $76 ; line 3
#_1CBFCF: db $DA, $59, $1F, $28, $2E, $2B, $59, $DA ; [to]⎵four⎵[to]
#_1CBFD7: db $2B, $9A, $2C, $59, $DA, $59, $C3 ; r[che]s⎵[to]⎵[open]
#_1CBFDE: db $7E ; wait for key
#_1CBFDF: db $73 ; scroll text
#_1CBFE0: db $D8, $59, $DF, $32, $59, $A8, $DF, $2B ; [the]⎵[wa]y⎵[for][wa]r
#_1CBFE8: db $1D, $41 ; d.
#_1CBFEA: db $7F ; end of message

;===================================================================================================
; ☥Ƨ☥𓈗☥Ƨ☥𓈗☥𓈗☥
; ☥𓈗☥Ƨ☥Ƨ☥𓈗☥Ƨ
; ☥𓈗☥Ƨ☥Ƨ☥𓈗☥Ƨ☥
;---------------------------------------------------------------------------------------------------
Message_00BC:
#_1CBFEB: db $47, $49, $47, $48, $47, $49, $47, $48 ; ☥Ƨ☥𓈗☥Ƨ☥𓈗
#_1CBFF3: db $47, $48, $47 ; ☥𓈗☥
#_1CBFF6: db $75 ; line 2
#_1CBFF7: db $47, $48, $47, $49, $47, $49, $47, $48 ; ☥𓈗☥Ƨ☥Ƨ☥𓈗
#_1CBFFF: db $47, $49 ; ☥Ƨ
#_1CC001: db $76 ; line 3
#_1CC002: db $47, $48, $47, $49, $47, $49, $47, $48 ; ☥𓈗☥Ƨ☥Ƨ☥𓈗
#_1CC00A: db $47, $49, $47 ; ☥Ƨ☥
#_1CC00D: db $7F ; end of message

;===================================================================================================
; To open the way to go forward,
; Make your wish here
; And it will be granted.
;---------------------------------------------------------------------------------------------------
Message_00BD:
#_1CC00E: db $13, $28, $59, $C3, $59, $D8, $59, $DF ; To⎵[open]⎵[the]⎵[wa]
#_1CC016: db $32, $59, $DA, $59, $AC, $59, $A8, $DF ; y⎵[to]⎵[go]⎵[for][wa]
#_1CC01E: db $2B, $1D, $42 ; rd,
#_1CC021: db $75 ; line 2
#_1CC022: db $0C, $1A, $24, $1E, $59, $E3, $2B, $59 ; Make⎵[you]r⎵
#_1CC02A: db $E2, $D1, $59, $AF, $1E ; [wi][sh]⎵[her]e
#_1CC02F: db $76 ; line 3
#_1CC030: db $00, $27, $1D, $59, $B6, $59, $E2, $25 ; And⎵[it]⎵[wi]l
#_1CC038: db $25, $59, $97, $59, $20, $2B, $93, $2D ; l⎵[be]⎵gr[an]t
#_1CC040: db $1E, $1D, $41 ; ed.
#_1CC043: db $7F ; end of message

;===================================================================================================
; When Ganon is stunned, give
; him his last moment with a
; Silver Arrow!
; Do you understand, [LINK]?
;---------------------------------------------------------------------------------------------------
Message_00BE:
#_1CC044: db $6B, $02 ; set window border
#_1CC046: db $16, $21, $A0, $06, $93, $C7, $59, $B5 ; Wh[en ]G[an][on]⎵[is]
#_1CC04E: db $59, $D3, $2E, $27, $27, $1E, $1D, $42 ; ⎵[st]unned,
#_1CC056: db $59, $20, $22, $2F, $1E ; ⎵give
#_1CC05B: db $75 ; line 2
#_1CC05C: db $B0, $26, $59, $B0, $2C, $59, $BA, $D3 ; [hi]m⎵[hi]s⎵[la][st]
#_1CC064: db $59, $26, $28, $BE, $27, $2D, $59, $DE ; ⎵mo[me]nt⎵[with]
#_1CC06C: db $59, $1A ; ⎵a
#_1CC06E: db $76 ; line 3
#_1CC06F: db $12, $22, $25, $DD, $59, $00, $2B, $2B ; Sil[ver]⎵Arr
#_1CC077: db $28, $30, $3E ; ow!
#_1CC07A: db $7E ; wait for key
#_1CC07B: db $73 ; scroll text
#_1CC07C: db $03, $28, $59, $E3, $59, $2E, $27, $1D ; Do⎵[you]⎵und
#_1CC084: db $A6, $D3, $90, $42, $59, $6A, $3F ; [er][st][and],⎵[LINK]?
#_1CC08B: db $7F ; end of message

;===================================================================================================
; [LINK], can you hear me?
; It's me, Zelda.  I am locked in
; Turtle Rock on top of Death
; Mountain.  I know you are doing
; your best, but please hurry…
;---------------------------------------------------------------------------------------------------
Message_00BF:
#_1CC08C: db $6B, $02 ; set window border
#_1CC08E: db $6A, $42, $59, $99, $E3, $59, $21, $A2 ; [LINK],⎵[can ][you]⎵h[ear]
#_1CC096: db $59, $BE, $3F ; ⎵[me]?
#_1CC099: db $75 ; line 2
#_1CC09A: db $08, $2D, $8B, $BE, $42, $59, $19, $1E ; It['s ][me],⎵Ze
#_1CC0A2: db $25, $1D, $1A, $41, $8A, $08, $59, $1A ; lda.[  ]I⎵a
#_1CC0AA: db $26, $59, $BB, $9C, $A4, $B4 ; m⎵[lo][ck][ed ][in]
#_1CC0B0: db $76 ; line 3
#_1CC0B1: db $13, $2E, $2B, $2D, $25, $1E, $59, $11 ; Turtle⎵R
#_1CC0B9: db $28, $9C, $59, $C7, $59, $DA, $29, $59 ; o[ck]⎵[on]⎵[to]p⎵
#_1CC0C1: db $C6, $59, $03, $1E, $94, $21 ; [of]⎵De[at]h
#_1CC0C7: db $7E ; wait for key
#_1CC0C8: db $73 ; scroll text
#_1CC0C9: db $0C, $28, $2E, $27, $2D, $8F, $41, $8A ; Mount[ain].[  ]
#_1CC0D1: db $08, $59, $B8, $59, $E3, $59, $8D, $9F ; I⎵[know]⎵[you]⎵[are ][do]
#_1CC0D9: db $B4, $20 ; [in]g
#_1CC0DB: db $73 ; scroll text
#_1CC0DC: db $E3, $2B, $59, $97, $D3, $42, $59, $1B ; [you]r⎵[be][st],⎵b
#_1CC0E4: db $2E, $2D, $59, $CA, $1A, $D0, $59, $21 ; ut⎵[ple]a[se]⎵h
#_1CC0EC: db $2E, $2B, $2B, $32, $43 ; urry…
#_1CC0F1: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla.
; You must never fail to find all
; the treasures in each dungeon.
;---------------------------------------------------------------------------------------------------
Message_00C0:
#_1CC0F2: db $6B, $02 ; set window border
#_1CC0F4: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CC0FC: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CC104: db $BA, $41 ; [la].
#_1CC106: db $75 ; line 2
#_1CC107: db $E8, $59, $BF, $D3, $59, $27, $A7, $A1 ; [You]⎵[mu][st]⎵n[ev][er ]
#_1CC10F: db $1F, $1A, $22, $25, $59, $DA, $59, $1F ; fail⎵[to]⎵f
#_1CC117: db $B4, $1D, $59, $1A, $25, $25 ; [in]d⎵all
#_1CC11D: db $76 ; line 3
#_1CC11E: db $D8, $59, $DB, $1E, $1A, $2C, $2E, $CE ; [the]⎵[tr]easu[re]
#_1CC126: db $2C, $59, $B4, $59, $1E, $1A, $1C, $21 ; s⎵[in]⎵each
#_1CC12E: db $59, $1D, $2E, $27, $20, $1E, $C7, $41 ; ⎵dunge[on].
#_1CC136: db $7F ; end of message

;===================================================================================================
; Listen well, [LINK].
; Even with the Master Sword,
; you cannot inflict physical
; harm on the wizard.
; You must find a way to return
; his own evil magic power to him.
;---------------------------------------------------------------------------------------------------
Message_00C1:
#_1CC137: db $6B, $02 ; set window border
#_1CC139: db $0B, $B5, $2D, $A0, $E0, $25, $25, $42 ; L[is]t[en ][we]ll,
#_1CC141: db $59, $6A, $41 ; ⎵[LINK].
#_1CC144: db $75 ; line 2
#_1CC145: db $04, $2F, $A0, $DE, $59, $D8, $59, $0C ; Ev[en ][with]⎵[the]⎵M
#_1CC14D: db $92, $A1, $12, $30, $C8, $1D, $42 ; [ast][er ]Sw[or]d,
#_1CC154: db $76 ; line 3
#_1CC155: db $E3, $59, $1C, $93, $C2, $59, $B4, $1F ; [you]⎵c[an][not]⎵[in]f
#_1CC15D: db $25, $22, $1C, $2D, $59, $29, $21, $32 ; lict⎵phy
#_1CC165: db $2C, $22, $1C, $1A, $25 ; sical
#_1CC16A: db $7E ; wait for key
#_1CC16B: db $73 ; scroll text
#_1CC16C: db $B1, $2B, $26, $59, $C7, $59, $D8, $59 ; [ha]rm⎵[on]⎵[the]⎵
#_1CC174: db $E2, $33, $1A, $2B, $1D, $41 ; [wi]zard.
#_1CC17A: db $73 ; scroll text
#_1CC17B: db $E8, $59, $BF, $D3, $59, $1F, $B4, $1D ; [You]⎵[mu][st]⎵f[in]d
#_1CC183: db $59, $1A, $59, $DF, $32, $59, $DA, $59 ; ⎵a⎵[wa]y⎵[to]⎵
#_1CC18B: db $CE, $2D, $2E, $2B, $27 ; [re]turn
#_1CC190: db $73 ; scroll text
#_1CC191: db $B0, $2C, $59, $28, $30, $27, $59, $A7 ; [hi]s⎵own⎵[ev]
#_1CC199: db $22, $25, $59, $BD, $20, $22, $1C, $59 ; il⎵[ma]gic⎵
#_1CC1A1: db $CB, $A1, $DA, $59, $B0, $26, $41 ; [pow][er ][to]⎵[hi]m.
#_1CC1A8: db $7F ; end of message

;===================================================================================================
; [LINK], do not use all your
; magic power if you do not
; possess the Medicine Of Magic.
; Now, get ready to go into the
; depths of this dungeon.
;---------------------------------------------------------------------------------------------------
Message_00C2:
#_1CC1A9: db $6B, $02 ; set window border
#_1CC1AB: db $6A, $42, $59, $9F, $59, $C2, $59, $2E ; [LINK],⎵[do]⎵[not]⎵u
#_1CC1B3: db $D0, $59, $8E, $E3, $2B ; [se]⎵[all ][you]r
#_1CC1B8: db $75 ; line 2
#_1CC1B9: db $BD, $20, $22, $1C, $59, $CB, $A1, $22 ; [ma]gic⎵[pow][er ]i
#_1CC1C1: db $1F, $59, $E3, $59, $9F, $59, $C2 ; f⎵[you]⎵[do]⎵[not]
#_1CC1C8: db $76 ; line 3
#_1CC1C9: db $29, $28, $2C, $D0, $2C, $2C, $59, $D8 ; pos[se]ss⎵[the]
#_1CC1D1: db $59, $0C, $1E, $9E, $1C, $B4, $1E, $59 ; ⎵Me[di]c[in]e⎵
#_1CC1D9: db $0E, $1F, $59, $0C, $1A, $20, $22, $1C ; Of⎵Magic
#_1CC1E1: db $41 ; .
#_1CC1E2: db $7E ; wait for key
#_1CC1E3: db $73 ; scroll text
#_1CC1E4: db $0D, $28, $30, $42, $59, $AB, $59, $CE ; Now,⎵[get]⎵[re]
#_1CC1EC: db $1A, $1D, $32, $59, $DA, $59, $AC, $59 ; ady⎵[to]⎵[go]⎵
#_1CC1F4: db $B4, $DA, $59, $D8 ; [in][to]⎵[the]
#_1CC1F8: db $73 ; scroll text
#_1CC1F9: db $1D, $1E, $29, $2D, $21, $2C, $59, $C6 ; depths⎵[of]
#_1CC201: db $59, $D9, $2C, $59, $1D, $2E, $27, $20 ; ⎵[thi]s⎵dung
#_1CC209: db $1E, $C7, $41 ; e[on].
#_1CC20C: db $7F ; end of message

;===================================================================================================
; [LINK], do you possess the
; Medicine of Magic?  If not, I
; recommend against going any
; further.
;---------------------------------------------------------------------------------------------------
Message_00C3:
#_1CC20D: db $6B, $02 ; set window border
#_1CC20F: db $6A, $42, $59, $9F, $59, $E3, $59, $29 ; [LINK],⎵[do]⎵[you]⎵p
#_1CC217: db $28, $2C, $D0, $2C, $2C, $59, $D8 ; os[se]ss⎵[the]
#_1CC21E: db $75 ; line 2
#_1CC21F: db $0C, $1E, $9E, $1C, $B4, $1E, $59, $C6 ; Me[di]c[in]e⎵[of]
#_1CC227: db $59, $0C, $1A, $20, $22, $1C, $3F, $8A ; ⎵Magic?[  ]
#_1CC22F: db $08, $1F, $59, $C2, $42, $59, $08 ; If⎵[not],⎵I
#_1CC236: db $76 ; line 3
#_1CC237: db $CE, $9B, $BE, $27, $1D, $59, $1A, $20 ; [re][com][me]nd⎵ag
#_1CC23F: db $8F, $D3, $59, $AC, $B3, $93, $32 ; [ain][st]⎵[go][ing ][an]y
#_1CC246: db $7E ; wait for key
#_1CC247: db $73 ; scroll text
#_1CC248: db $1F, $2E, $2B, $D8, $2B, $41 ; fur[the]r.
#_1CC24E: db $7F ; end of message

;===================================================================================================
; [LINK], the magic flames will
; protect you inside this icy
; dungeon.
;---------------------------------------------------------------------------------------------------
Message_00C4:
#_1CC24F: db $6B, $02 ; set window border
#_1CC251: db $6A, $42, $59, $D8, $59, $BD, $20, $22 ; [LINK],⎵[the]⎵[ma]gi
#_1CC259: db $1C, $59, $1F, $BA, $BE, $2C, $59, $E2 ; c⎵f[la][me]s⎵[wi]
#_1CC261: db $25, $25 ; ll
#_1CC263: db $75 ; line 2
#_1CC264: db $CC, $2D, $1E, $1C, $2D, $59, $E3, $59 ; [pro]tect⎵[you]⎵
#_1CC26C: db $B4, $2C, $22, $1D, $1E, $59, $D9, $2C ; [in]side⎵[thi]s
#_1CC274: db $59, $22, $1C, $32 ; ⎵icy
#_1CC278: db $76 ; line 3
#_1CC279: db $1D, $2E, $27, $20, $1E, $C7, $41 ; dunge[on].
#_1CC280: db $7F ; end of message

;===================================================================================================
; You cannot destroy the
; Skeleton Knight with the sword
; alone.  When he collapses, he is
; vulnerable to another weapon.
;---------------------------------------------------------------------------------------------------
Message_00C5:
#_1CC281: db $6B, $02 ; set window border
#_1CC283: db $E8, $59, $1C, $93, $C2, $59, $9D, $DB ; [You]⎵c[an][not]⎵[des][tr]
#_1CC28B: db $28, $32, $59, $D8 ; oy⎵[the]
#_1CC28F: db $75 ; line 2
#_1CC290: db $12, $24, $1E, $25, $1E, $DA, $27, $59 ; Skele[to]n⎵
#_1CC298: db $0A, $27, $B2, $DE, $59, $D8, $59, $2C ; Kn[ight ][with]⎵[the]⎵s
#_1CC2A0: db $30, $C8, $1D ; w[or]d
#_1CC2A3: db $76 ; line 3
#_1CC2A4: db $1A, $BB, $27, $1E, $41, $8A, $16, $21 ; a[lo]ne.[  ]Wh
#_1CC2AC: db $A0, $21, $1E, $59, $1C, $28, $25, $BA ; [en ]he⎵col[la]
#_1CC2B4: db $29, $D0, $2C, $42, $59, $21, $1E, $59 ; p[se]s,⎵he⎵
#_1CC2BC: db $B5 ; [is]
#_1CC2BD: db $7E ; wait for key
#_1CC2BE: db $73 ; scroll text
#_1CC2BF: db $2F, $2E, $25, $27, $A6, $1A, $95, $59 ; vuln[er]a[ble]⎵
#_1CC2C7: db $DA, $59, $93, $28, $D8, $2B, $59, $E0 ; [to]⎵[an]o[the]r⎵[we]
#_1CC2CF: db $1A, $29, $C7, $41 ; ap[on].
#_1CC2D3: db $7F ; end of message

;===================================================================================================
; [LINK], it is I, Sahasrahla the
; elder.  I have some advice…
; In the dungeons, you can gaze
; into the Magic Mirror to return
; to the entrance at any time.
; Do not forget this!
;---------------------------------------------------------------------------------------------------
Message_00C6:
#_1CC2D4: db $6B, $02 ; set window border
#_1CC2D6: db $6A, $42, $59, $B6, $59, $B5, $59, $08 ; [LINK],⎵[it]⎵[is]⎵I
#_1CC2DE: db $42, $59, $12, $1A, $AE, $2B, $1A, $21 ; ,⎵Sa[has]rah
#_1CC2E6: db $BA, $59, $D8 ; [la]⎵[the]
#_1CC2E9: db $75 ; line 2
#_1CC2EA: db $1E, $25, $1D, $A6, $41, $8A, $08, $59 ; eld[er].[  ]I⎵
#_1CC2F2: db $AD, $59, $CF, $59, $1A, $1D, $2F, $22 ; [have]⎵[some]⎵advi
#_1CC2FA: db $1C, $1E, $43 ; ce…
#_1CC2FD: db $76 ; line 3
#_1CC2FE: db $08, $27, $59, $D8, $59, $1D, $2E, $27 ; In⎵[the]⎵dun
#_1CC306: db $20, $1E, $C7, $2C, $42, $59, $E3, $59 ; ge[on]s,⎵[you]⎵
#_1CC30E: db $99, $20, $1A, $33, $1E ; [can ]gaze
#_1CC313: db $7E ; wait for key
#_1CC314: db $73 ; scroll text
#_1CC315: db $B4, $DA, $59, $D8, $59, $0C, $1A, $20 ; [in][to]⎵[the]⎵Mag
#_1CC31D: db $22, $1C, $59, $0C, $22, $2B, $2B, $C8 ; ic⎵Mirr[or]
#_1CC325: db $59, $DA, $59, $CE, $2D, $2E, $2B, $27 ; ⎵[to]⎵[re]turn
#_1CC32D: db $73 ; scroll text
#_1CC32E: db $DA, $59, $D8, $59, $A3, $2B, $93, $1C ; [to]⎵[the]⎵[ent]r[an]c
#_1CC336: db $1E, $59, $91, $93, $32, $59, $2D, $22 ; e⎵[at ][an]y⎵ti
#_1CC33E: db $BE, $41 ; [me].
#_1CC340: db $73 ; scroll text
#_1CC341: db $03, $28, $59, $C2, $59, $A8, $AB, $59 ; Do⎵[not]⎵[for][get]⎵
#_1CC349: db $D9, $2C, $3E ; [thi]s!
#_1CC34C: db $7F ; end of message

;===================================================================================================
; My name is Chris Houlihan.
; This is my top secret room.
; Keep it between us, OK?
;---------------------------------------------------------------------------------------------------
Message_00C7:
#_1CC34D: db $0C, $32, $59, $27, $1A, $BE, $59, $B5 ; My⎵na[me]⎵[is]
#_1CC355: db $59, $02, $21, $2B, $B5, $59, $07, $28 ; ⎵Chr[is]⎵Ho
#_1CC35D: db $2E, $25, $22, $B1, $27, $41 ; uli[ha]n.
#_1CC363: db $75 ; line 2
#_1CC364: db $E7, $2C, $59, $B5, $59, $26, $32, $59 ; [Thi]s⎵[is]⎵my⎵
#_1CC36C: db $DA, $29, $59, $D0, $1C, $CE, $2D, $59 ; [to]p⎵[se]c[re]t⎵
#_1CC374: db $2B, $28, $28, $26, $41 ; room.
#_1CC379: db $76 ; line 3
#_1CC37A: db $0A, $1E, $1E, $29, $59, $B6, $59, $97 ; Keep⎵[it]⎵[be]
#_1CC382: db $2D, $E0, $A0, $2E, $2C, $42, $59, $0E ; t[we][en ]us,⎵O
#_1CC38A: db $0A, $3F ; K?
#_1CC38C: db $7F ; end of message

;===================================================================================================
; You caught a bee!
; What will you do?
;     > Keep it in a bottle
;        Set it free
;---------------------------------------------------------------------------------------------------
Message_00C8:
#_1CC38D: db $E8, $59, $1C, $1A, $2E, $20, $21, $2D ; [You]⎵caught
#_1CC395: db $59, $1A, $59, $97, $1E, $3E ; ⎵a⎵[be]e!
#_1CC39B: db $7E ; wait for key
#_1CC39C: db $75 ; line 2
#_1CC39D: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_1CC3A5: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_1CC3A9: db $76 ; line 3
#_1CC3AA: db $88, $44, $59, $0A, $1E, $1E, $29, $59 ; [    ]>⎵Keep⎵
#_1CC3B2: db $B6, $59, $B4, $59, $1A, $59, $98, $2D ; [it]⎵[in]⎵a⎵[bo]t
#_1CC3BA: db $2D, $25, $1E ; tle
#_1CC3BD: db $73 ; scroll text
#_1CC3BE: db $88, $89, $12, $1E, $2D, $59, $B6, $59 ; [    ][   ]Set⎵[it]⎵
#_1CC3C6: db $1F, $CE, $1E ; f[re]e
#_1CC3C9: db $68 ; choose 2 indented
#_1CC3CA: db $7F ; end of message

;===================================================================================================
; You caught a faerie!
; What will you do?
;     > Keep it in a bottle
;        Set it free
;---------------------------------------------------------------------------------------------------
Message_00C9:
#_1CC3CB: db $E8, $59, $1C, $1A, $2E, $20, $21, $2D ; [You]⎵caught
#_1CC3D3: db $59, $1A, $59, $1F, $1A, $A6, $22, $1E ; ⎵a⎵fa[er]ie
#_1CC3DB: db $3E ; !
#_1CC3DC: db $7E ; wait for key
#_1CC3DD: db $75 ; line 2
#_1CC3DE: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_1CC3E6: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_1CC3EA: db $76 ; line 3
#_1CC3EB: db $88, $44, $59, $0A, $1E, $1E, $29, $59 ; [    ]>⎵Keep⎵
#_1CC3F3: db $B6, $59, $B4, $59, $1A, $59, $98, $2D ; [it]⎵[in]⎵a⎵[bo]t
#_1CC3FB: db $2D, $25, $1E ; tle
#_1CC3FE: db $73 ; scroll text
#_1CC3FF: db $88, $89, $12, $1E, $2D, $59, $B6, $59 ; [    ][   ]Set⎵[it]⎵
#_1CC407: db $1F, $CE, $1E ; f[re]e
#_1CC40A: db $68 ; choose 2 indented
#_1CC40B: db $7F ; end of message

;===================================================================================================
; You don't have any empty
; bottles.  You have no choice…
; Just set it free.
;---------------------------------------------------------------------------------------------------
Message_00CA:
#_1CC40C: db $E8, $59, $9F, $C0, $AD, $59, $93, $32 ; [You]⎵[do][n't ][have]⎵[an]y
#_1CC414: db $59, $1E, $26, $29, $2D, $32 ; ⎵empty
#_1CC41A: db $75 ; line 2
#_1CC41B: db $98, $2D, $2D, $25, $1E, $2C, $41, $8A ; [bo]ttles.[  ]
#_1CC423: db $E8, $59, $AD, $59, $27, $28, $59, $1C ; [You]⎵[have]⎵no⎵c
#_1CC42B: db $21, $28, $22, $1C, $1E, $43 ; hoice…
#_1CC431: db $76 ; line 3
#_1CC432: db $09, $2E, $D3, $59, $D0, $2D, $59, $B6 ; Ju[st]⎵[se]t⎵[it]
#_1CC43A: db $59, $1F, $CE, $1E, $41 ; ⎵f[re]e.
#_1CC43F: db $7F ; end of message

;===================================================================================================
; This try your time was
; [#3][#2] minutes [#1][#0] seconds.
;---------------------------------------------------------------------------------------------------
Message_00CB:
#_1CC440: db $E7, $2C, $59, $DB, $32, $59, $E3, $2B ; [Thi]s⎵[tr]y⎵[you]r
#_1CC448: db $59, $2D, $22, $BE, $59, $DF, $2C ; ⎵ti[me]⎵[wa]s
#_1CC44F: db $75 ; line 2
#_1CC450: db $6C, $03, $6C, $02, $59, $26, $B4, $2E ; [#3][#2]⎵m[in]u
#_1CC458: db $2D, $1E, $2C, $59, $6C, $01, $6C, $00 ; tes⎵[#1][#0]
#_1CC460: db $59, $D0, $1C, $C7, $1D, $2C, $41 ; ⎵[se]c[on]ds.
#_1CC467: db $7F ; end of message

;===================================================================================================
; If you can reach the goal
; within 15 seconds, we will give
; you something good.
; Ready, Set… …  GO!
;---------------------------------------------------------------------------------------------------
Message_00CC:
#_1CC468: db $08, $1F, $59, $E3, $59, $99, $CE, $1A ; If⎵[you]⎵[can ][re]a
#_1CC470: db $1C, $21, $59, $D8, $59, $AC, $1A, $25 ; ch⎵[the]⎵[go]al
#_1CC478: db $75 ; line 2
#_1CC479: db $DE, $B4, $59, $35, $39, $59, $D0, $1C ; [with][in]⎵15⎵[se]c
#_1CC481: db $C7, $1D, $2C, $42, $59, $E0, $59, $E2 ; [on]ds,⎵[we]⎵[wi]
#_1CC489: db $25, $25, $59, $20, $22, $2F, $1E ; ll⎵give
#_1CC490: db $76 ; line 3
#_1CC491: db $E3, $59, $CF, $D5, $20, $59, $AC, $28 ; [you]⎵[some][thin]g⎵[go]o
#_1CC499: db $1D, $41 ; d.
#_1CC49B: db $7E ; wait for key
#_1CC49C: db $73 ; scroll text
#_1CC49D: db $11, $1E, $1A, $1D, $32, $42, $59, $12 ; Ready,⎵S
#_1CC4A5: db $1E, $2D, $43, $59, $43, $8A, $06, $0E ; et…⎵…[  ]GO
#_1CC4AD: db $3E ; !
#_1CC4AE: db $7F ; end of message

;===================================================================================================
; You qualified!
; Congratulations!
; I present you with a piece of
; Heart!
;---------------------------------------------------------------------------------------------------
Message_00CD:
#_1CC4AF: db $E8, $59, $2A, $2E, $1A, $25, $22, $1F ; [You]⎵qualif
#_1CC4B7: db $22, $1E, $1D, $3E ; ied!
#_1CC4BB: db $75 ; line 2
#_1CC4BC: db $02, $C7, $20, $2B, $94, $2E, $BA, $2D ; C[on]gr[at]u[la]t
#_1CC4C4: db $22, $C7, $2C, $3E ; i[on]s!
#_1CC4C8: db $76 ; line 3
#_1CC4C9: db $08, $59, $29, $CE, $D0, $27, $2D, $59 ; I⎵p[re][se]nt⎵
#_1CC4D1: db $E3, $59, $DE, $59, $1A, $59, $29, $22 ; [you]⎵[with]⎵a⎵pi
#_1CC4D9: db $1E, $1C, $1E, $59, $C6 ; ece⎵[of]
#_1CC4DE: db $7E ; wait for key
#_1CC4DF: db $73 ; scroll text
#_1CC4E0: db $07, $A2, $2D, $3E ; H[ear]t!
#_1CC4E4: db $7F ; end of message

;===================================================================================================
; You're not qualified.
; Too bad!
; Why don't you try again?
;---------------------------------------------------------------------------------------------------
Message_00CE:
#_1CC4E5: db $E8, $51, $CD, $C2, $59, $2A, $2E, $1A ; [You]'[re ][not]⎵qua
#_1CC4ED: db $25, $22, $1F, $22, $1E, $1D, $41 ; lified.
#_1CC4F4: db $75 ; line 2
#_1CC4F5: db $13, $28, $28, $59, $96, $1D, $3E ; Too⎵[ba]d!
#_1CC4FC: db $76 ; line 3
#_1CC4FD: db $16, $21, $32, $59, $9F, $C0, $E3, $59 ; Why⎵[do][n't ][you]⎵
#_1CC505: db $DB, $32, $59, $1A, $20, $8F, $3F ; [tr]y⎵ag[ain]?
#_1CC50C: db $7F ; end of message

;===================================================================================================
; I don't have anything more to
; give you.
; I'm sorry!
;---------------------------------------------------------------------------------------------------
Message_00CF:
#_1CC50D: db $08, $59, $9F, $C0, $AD, $59, $93, $32 ; I⎵[do][n't ][have]⎵[an]y
#_1CC515: db $D5, $20, $59, $26, $C8, $1E, $59, $DA ; [thin]g⎵m[or]e⎵[to]
#_1CC51D: db $75 ; line 2
#_1CC51E: db $AA, $E3, $41 ; [give ][you].
#_1CC521: db $76 ; line 3
#_1CC522: db $08, $51, $26, $59, $D2, $2B, $2B, $32 ; I'm⎵[so]rry
#_1CC52A: db $3E ; !
#_1CC52B: db $7F ; end of message

;===================================================================================================
; You have to enter the maze
; from the proper entrance or I
; can't clock your time…
;---------------------------------------------------------------------------------------------------
Message_00D0:
#_1CC52C: db $E8, $59, $AD, $59, $DA, $59, $A3, $A1 ; [You]⎵[have]⎵[to]⎵[ent][er ]
#_1CC534: db $D8, $59, $BD, $33, $1E ; [the]⎵[ma]ze
#_1CC539: db $75 ; line 2
#_1CC53A: db $A9, $26, $59, $D8, $59, $CC, $C9, $59 ; [fro]m⎵[the]⎵[pro][per]⎵
#_1CC542: db $A3, $2B, $93, $1C, $1E, $59, $C8, $59 ; [ent]r[an]ce⎵[or]⎵
#_1CC54A: db $08 ; I
#_1CC54B: db $76 ; line 3
#_1CC54C: db $1C, $93, $51, $2D, $59, $1C, $BB, $9C ; c[an]'t⎵c[lo][ck]
#_1CC554: db $59, $E3, $2B, $59, $2D, $22, $BE, $43 ; ⎵[you]r⎵ti[me]…
#_1CC55C: db $7F ; end of message

;===================================================================================================
; You, sir!  Have you been going
; through life without one of my
; hold-anything bottles?
; Well step right up and make
; your life complete!  I've got
; one on sale now for the low,
; low price of 100 Rupees!
; What do you say?  Interested?
;     > I'll take one
;        Don't need it
;---------------------------------------------------------------------------------------------------
Message_00D1:
#_1CC55D: db $E8, $42, $59, $2C, $22, $2B, $3E, $8A ; [You],⎵sir![  ]
#_1CC565: db $07, $1A, $2F, $1E, $59, $E3, $59, $97 ; Have⎵[you]⎵[be]
#_1CC56D: db $A0, $AC, $B4, $20 ; [en ][go][in]g
#_1CC571: db $75 ; line 2
#_1CC572: db $2D, $21, $2B, $28, $2E, $20, $21, $59 ; through⎵
#_1CC57A: db $25, $22, $1F, $1E, $59, $DE, $C5, $C7 ; life⎵[with][out ][on]
#_1CC582: db $1E, $59, $C6, $59, $26, $32 ; e⎵[of]⎵my
#_1CC588: db $76 ; line 3
#_1CC589: db $21, $28, $25, $1D, $40, $93, $32, $D5 ; hold-[an]y[thin]
#_1CC591: db $20, $59, $98, $2D, $2D, $25, $1E, $2C ; g⎵[bo]ttles
#_1CC599: db $3F ; ?
#_1CC59A: db $7E ; wait for key
#_1CC59B: db $73 ; scroll text
#_1CC59C: db $16, $1E, $25, $25, $59, $D3, $1E, $29 ; Well⎵[st]ep
#_1CC5A4: db $59, $2B, $B2, $DC, $59, $8C, $BD, $24 ; ⎵r[ight ][up]⎵[and ][ma]k
#_1CC5AC: db $1E ; e
#_1CC5AD: db $73 ; scroll text
#_1CC5AE: db $E3, $2B, $59, $25, $22, $1F, $1E, $59 ; [you]r⎵life⎵
#_1CC5B6: db $9B, $CA, $2D, $1E, $3E, $8A, $08, $51 ; [com][ple]te![  ]I'
#_1CC5BE: db $2F, $1E, $59, $AC, $2D ; ve⎵[go]t
#_1CC5C3: db $73 ; scroll text
#_1CC5C4: db $C7, $1E, $59, $C7, $59, $2C, $1A, $25 ; [on]e⎵[on]⎵sal
#_1CC5CC: db $1E, $59, $27, $28, $30, $59, $A8, $59 ; e⎵now⎵[for]⎵
#_1CC5D4: db $D8, $59, $BB, $30, $42 ; [the]⎵[lo]w,
#_1CC5D9: db $7E ; wait for key
#_1CC5DA: db $73 ; scroll text
#_1CC5DB: db $BB, $30, $59, $29, $2B, $22, $1C, $1E ; [lo]w⎵price
#_1CC5E3: db $59, $C6, $59, $35, $34, $34, $59, $11 ; ⎵[of]⎵100⎵R
#_1CC5EB: db $DC, $1E, $1E, $2C, $3E ; [up]ees!
#_1CC5F0: db $7E ; wait for key
#_1CC5F1: db $73 ; scroll text
#_1CC5F2: db $16, $B1, $2D, $59, $9F, $59, $E3, $59 ; W[ha]t⎵[do]⎵[you]⎵
#_1CC5FA: db $2C, $1A, $32, $3F, $8A, $08, $27, $D6 ; say?[  ]In[ter]
#_1CC602: db $1E, $D3, $1E, $1D, $3F ; e[st]ed?
#_1CC607: db $73 ; scroll text
#_1CC608: db $88, $44, $59, $08, $51, $25, $25, $59 ; [    ]>⎵I'll⎵
#_1CC610: db $2D, $1A, $24, $1E, $59, $C7, $1E ; take⎵[on]e
#_1CC617: db $73 ; scroll text
#_1CC618: db $88, $89, $03, $C7, $51, $2D, $59, $27 ; [    ][   ]D[on]'t⎵n
#_1CC620: db $1E, $A4, $B6 ; e[ed ][it]
#_1CC623: db $68 ; choose 2 indented
#_1CC624: db $7F ; end of message

;===================================================================================================
; Good buy!  Thanks a lot!
; Now, hold it above your head
; for the whole world to see, OK?
; It's good for business!
;---------------------------------------------------------------------------------------------------
Message_00D2:
#_1CC625: db $06, $28, $28, $1D, $59, $1B, $2E, $32 ; Good⎵buy
#_1CC62D: db $3E, $8A, $E5, $27, $24, $2C, $59, $1A ; ![  ][Tha]nks⎵a
#_1CC635: db $59, $BB, $2D, $3E ; ⎵[lo]t!
#_1CC639: db $75 ; line 2
#_1CC63A: db $0D, $28, $30, $42, $59, $21, $28, $25 ; Now,⎵hol
#_1CC642: db $1D, $59, $B6, $59, $1A, $98, $2F, $1E ; d⎵[it]⎵a[bo]ve
#_1CC64A: db $59, $E3, $2B, $59, $21, $1E, $1A, $1D ; ⎵[you]r⎵head
#_1CC652: db $76 ; line 3
#_1CC653: db $A8, $59, $D8, $59, $E1, $28, $25, $1E ; [for]⎵[the]⎵[wh]ole
#_1CC65B: db $59, $30, $C8, $25, $1D, $59, $DA, $59 ; ⎵w[or]ld⎵[to]⎵
#_1CC663: db $D0, $1E, $42, $59, $0E, $0A, $3F ; [se]e,⎵OK?
#_1CC66A: db $7E ; wait for key
#_1CC66B: db $73 ; scroll text
#_1CC66C: db $08, $2D, $8B, $AC, $28, $1D, $59, $A8 ; It['s ][go]od⎵[for]
#_1CC674: db $59, $1B, $2E, $2C, $B4, $1E, $2C, $2C ; ⎵bus[in]ess
#_1CC67C: db $3E ; !
#_1CC67D: db $7F ; end of message

;===================================================================================================
; So you're broke, eh?  Too bad…
; Come back after you earn more
; Rupees.  It might still be here.
;---------------------------------------------------------------------------------------------------
Message_00D3:
#_1CC67E: db $12, $28, $59, $E3, $51, $CD, $1B, $2B ; So⎵[you]'[re ]br
#_1CC686: db $28, $24, $1E, $42, $59, $1E, $21, $3F ; oke,⎵eh?
#_1CC68E: db $8A, $13, $28, $28, $59, $96, $1D, $43 ; [  ]Too⎵[ba]d…
#_1CC696: db $75 ; line 2
#_1CC697: db $02, $28, $BE, $59, $96, $9C, $59, $1A ; Co[me]⎵[ba][ck]⎵a
#_1CC69F: db $1F, $D4, $E3, $59, $A2, $27, $59, $26 ; f[ter ][you]⎵[ear]n⎵m
#_1CC6A7: db $C8, $1E ; [or]e
#_1CC6A9: db $76 ; line 3
#_1CC6AA: db $11, $DC, $1E, $1E, $2C, $41, $8A, $08 ; R[up]ees.[  ]I
#_1CC6B2: db $2D, $59, $26, $B2, $D3, $22, $25, $25 ; t⎵m[ight ][st]ill
#_1CC6BA: db $59, $97, $59, $AF, $1E, $41 ; ⎵[be]⎵[her]e.
#_1CC6C0: db $7F ; end of message

;===================================================================================================
; I'm all sold out of bottles.
; Come back later, OK? 
;  … … …
;---------------------------------------------------------------------------------------------------
Message_00D4:
#_1CC6C1: db $08, $51, $26, $59, $8E, $D2, $25, $1D ; I'm⎵[all ][so]ld
#_1CC6C9: db $59, $C5, $C6, $59, $98, $2D, $2D, $25 ; ⎵[out ][of]⎵[bo]ttl
#_1CC6D1: db $1E, $2C, $41 ; es.
#_1CC6D4: db $75 ; line 2
#_1CC6D5: db $02, $28, $BE, $59, $96, $9C, $59, $BA ; Co[me]⎵[ba][ck]⎵[la]
#_1CC6DD: db $D6, $42, $59, $0E, $0A, $3F, $59 ; [ter],⎵OK?⎵
#_1CC6E4: db $76 ; line 3
#_1CC6E5: db $59, $43, $59, $43, $59, $43 ; ⎵…⎵…⎵…
#_1CC6EB: db $7F ; end of message

;===================================================================================================
; Wow!  I've never seen such a
; rare bug!  I'll buy it for
; 100 Rupees, OK?  Done!
;---------------------------------------------------------------------------------------------------
Message_00D5:
#_1CC6EC: db $16, $28, $30, $3E, $8A, $08, $51, $2F ; Wow![  ]I'v
#_1CC6F4: db $1E, $59, $27, $A7, $A1, $D0, $A0, $2C ; e⎵n[ev][er ][se][en ]s
#_1CC6FC: db $2E, $1C, $21, $59, $1A ; uch⎵a
#_1CC701: db $75 ; line 2
#_1CC702: db $2B, $8D, $1B, $2E, $20, $3E, $8A, $08 ; r[are ]bug![  ]I
#_1CC70A: db $51, $25, $25, $59, $1B, $2E, $32, $59 ; 'll⎵buy⎵
#_1CC712: db $B6, $59, $A8 ; [it]⎵[for]
#_1CC715: db $76 ; line 3
#_1CC716: db $35, $34, $34, $59, $11, $DC, $1E, $1E ; 100⎵R[up]ee
#_1CC71E: db $2C, $42, $59, $0E, $0A, $3F, $8A, $03 ; s,⎵OK?[  ]D
#_1CC726: db $C7, $1E, $3E ; [on]e!
#_1CC729: db $7F ; end of message

;===================================================================================================
; Hey!  They say eating fish
; makes you smart.  You have to
; give me this fish for this
; stuff, OK?  Done!
;---------------------------------------------------------------------------------------------------
Message_00D6:
#_1CC72A: db $07, $1E, $32, $3E, $8A, $E6, $32, $59 ; Hey![  ][The]y⎵
#_1CC732: db $2C, $1A, $32, $59, $1E, $94, $B3, $1F ; say⎵e[at][ing ]f
#_1CC73A: db $B5, $21 ; [is]h
#_1CC73C: db $75 ; line 2
#_1CC73D: db $BD, $24, $1E, $2C, $59, $E3, $59, $2C ; [ma]kes⎵[you]⎵s
#_1CC745: db $BD, $2B, $2D, $41, $8A, $E8, $59, $AD ; [ma]rt.[  ][You]⎵[have]
#_1CC74D: db $59, $DA ; ⎵[to]
#_1CC74F: db $76 ; line 3
#_1CC750: db $AA, $BE, $59, $D9, $2C, $59, $1F, $B5 ; [give ][me]⎵[thi]s⎵f[is]
#_1CC758: db $21, $59, $A8, $59, $D9, $2C ; h⎵[for]⎵[thi]s
#_1CC75E: db $7E ; wait for key
#_1CC75F: db $73 ; scroll text
#_1CC760: db $D3, $2E, $1F, $1F, $42, $59, $0E, $0A ; [st]uff,⎵OK
#_1CC768: db $3F, $8A, $03, $C7, $1E, $3E ; ?[  ]D[on]e!
#_1CC76E: db $7F ; end of message

;===================================================================================================
; Yo!  [LINK]! You seem to be in
; a heap of trouble, but this is
; all I can give you.
;---------------------------------------------------------------------------------------------------
Message_00D7:
#_1CC76F: db $18, $28, $3E, $8A, $6A, $3E, $59, $E8 ; Yo![  ][LINK]!⎵[You]
#_1CC777: db $59, $D0, $1E, $26, $59, $DA, $59, $97 ; ⎵[se]em⎵[to]⎵[be]
#_1CC77F: db $59, $B4 ; ⎵[in]
#_1CC781: db $75 ; line 2
#_1CC782: db $1A, $59, $21, $1E, $1A, $29, $59, $C6 ; a⎵heap⎵[of]
#_1CC78A: db $59, $DB, $28, $2E, $95, $42, $59, $1B ; ⎵[tr]ou[ble],⎵b
#_1CC792: db $2E, $2D, $59, $D9, $2C, $59, $B5 ; ut⎵[thi]s⎵[is]
#_1CC799: db $76 ; line 3
#_1CC79A: db $8E, $08, $59, $99, $AA, $E3, $41 ; [all ]I⎵[can ][give ][you].
#_1CC7A1: db $7F ; end of message

;===================================================================================================
; Hey you!
; Welcome!
; 
; Ask us to do anything!
;     > Temper my sword
;        I just dropped by
;---------------------------------------------------------------------------------------------------
Message_00D8:
#_1CC7A2: db $07, $1E, $32, $59, $E3, $3E ; Hey⎵[you]!
#_1CC7A8: db $75 ; line 2
#_1CC7A9: db $16, $1E, $25, $9B, $1E, $3E ; Wel[com]e!
#_1CC7AF: db $76 ; line 3
#_1CC7B0: db $7E ; wait for key
#_1CC7B1: db $73 ; scroll text
#_1CC7B2: db $00, $2C, $24, $59, $2E, $2C, $59, $DA ; Ask⎵us⎵[to]
#_1CC7BA: db $59, $9F, $59, $93, $32, $D5, $20, $3E ; ⎵[do]⎵[an]y[thin]g!
#_1CC7C2: db $73 ; scroll text
#_1CC7C3: db $88, $44, $59, $13, $1E, $26, $C9, $59 ; [    ]>⎵Tem[per]⎵
#_1CC7CB: db $26, $32, $59, $2C, $30, $C8, $1D ; my⎵sw[or]d
#_1CC7D2: db $73 ; scroll text
#_1CC7D3: db $88, $89, $08, $59, $B7, $59, $1D, $2B ; [    ][   ]I⎵[just]⎵dr
#_1CC7DB: db $28, $29, $29, $A4, $1B, $32 ; opp[ed ]by
#_1CC7E1: db $68 ; choose 2 indented
#_1CC7E2: db $7F ; end of message

;===================================================================================================
; I'll give you a big discount!
;     >Sword Tempered… 10 Rupees
;       Wait a minute
;---------------------------------------------------------------------------------------------------
Message_00D9:
#_1CC7E3: db $08, $51, $25, $25, $59, $AA, $E3, $59 ; I'll⎵[give ][you]⎵
#_1CC7EB: db $1A, $59, $1B, $22, $20, $59, $9E, $2C ; a⎵big⎵[di]s
#_1CC7F3: db $1C, $28, $2E, $27, $2D, $3E ; count!
#_1CC7F9: db $75 ; line 2
#_1CC7FA: db $88, $44, $12, $30, $C8, $1D, $59, $13 ; [    ]>Sw[or]d⎵T
#_1CC802: db $1E, $26, $C9, $1E, $1D, $43, $59, $35 ; em[per]ed…⎵1
#_1CC80A: db $34, $59, $11, $DC, $1E, $1E, $2C ; 0⎵R[up]ees
#_1CC811: db $76 ; line 3
#_1CC812: db $88, $8A, $16, $1A, $B6, $59, $1A, $59 ; [    ][  ]Wa[it]⎵a⎵
#_1CC81A: db $26, $B4, $2E, $2D, $1E ; m[in]ute
#_1CC81F: db $68 ; choose 2 indented
#_1CC820: db $7F ; end of message

;===================================================================================================
; Tempered, eh?  Are you sure?
;     > Yes
;        I changed my mind
;---------------------------------------------------------------------------------------------------
Message_00DA:
#_1CC821: db $13, $1E, $26, $C9, $1E, $1D, $42, $59 ; Tem[per]ed,⎵
#_1CC829: db $1E, $21, $3F, $8A, $00, $CD, $E3, $59 ; eh?[  ]A[re ][you]⎵
#_1CC831: db $2C, $2E, $CE, $3F ; su[re]?
#_1CC835: db $75 ; line 2
#_1CC836: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1CC83C: db $76 ; line 3
#_1CC83D: db $88, $89, $08, $59, $1C, $B1, $27, $20 ; [    ][   ]I⎵c[ha]ng
#_1CC845: db $A4, $26, $32, $59, $26, $B4, $1D ; [ed ]my⎵m[in]d
#_1CC84C: db $68 ; choose 2 indented
#_1CC84D: db $7F ; end of message

;===================================================================================================
; Well, we can't make it any
; stronger than that… Sorry!
;---------------------------------------------------------------------------------------------------
Message_00DB:
#_1CC84E: db $16, $1E, $25, $25, $42, $59, $E0, $59 ; Well,⎵[we]⎵
#_1CC856: db $1C, $93, $51, $2D, $59, $BD, $24, $1E ; c[an]'t⎵[ma]ke
#_1CC85E: db $59, $B6, $59, $93, $32 ; ⎵[it]⎵[an]y
#_1CC863: db $75 ; line 2
#_1CC864: db $D3, $2B, $C7, $20, $A1, $D7, $27, $59 ; [st]r[on]g[er ][tha]n⎵
#_1CC86C: db $D7, $2D, $43, $59, $12, $C8, $2B, $32 ; [tha]t…⎵S[or]ry
#_1CC874: db $3E ; !
#_1CC875: db $7F ; end of message

;===================================================================================================
; Drop by again anytime you
; want to.  Hi ho!  Hi ho!
; We're off to work!
;---------------------------------------------------------------------------------------------------
Message_00DC:
#_1CC876: db $03, $2B, $28, $29, $59, $1B, $32, $59 ; Drop⎵by⎵
#_1CC87E: db $1A, $20, $8F, $59, $93, $32, $2D, $22 ; ag[ain]⎵[an]yti
#_1CC886: db $BE, $59, $E3 ; [me]⎵[you]
#_1CC889: db $75 ; line 2
#_1CC88A: db $DF, $27, $2D, $59, $DA, $41, $8A, $07 ; [wa]nt⎵[to].[  ]H
#_1CC892: db $22, $59, $21, $28, $3E, $8A, $07, $22 ; i⎵ho![  ]Hi
#_1CC89A: db $59, $21, $28, $3E ; ⎵ho!
#_1CC89E: db $76 ; line 3
#_1CC89F: db $16, $1E, $51, $CD, $C6, $1F, $59, $DA ; We'[re ][of]f⎵[to]
#_1CC8A7: db $59, $30, $C8, $24, $3E ; ⎵w[or]k!
#_1CC8AC: db $7F ; end of message

;===================================================================================================
; All right, no problem.
; We'll have to keep your sword
; for a while.
;---------------------------------------------------------------------------------------------------
Message_00DD:
#_1CC8AD: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_1CC8B5: db $2D, $42, $59, $27, $28, $59, $CC, $95 ; t,⎵no⎵[pro][ble]
#_1CC8BD: db $26, $41 ; m.
#_1CC8BF: db $75 ; line 2
#_1CC8C0: db $16, $1E, $51, $25, $25, $59, $AD, $59 ; We'll⎵[have]⎵
#_1CC8C8: db $DA, $59, $24, $1E, $1E, $29, $59, $E3 ; [to]⎵keep⎵[you]
#_1CC8D0: db $2B, $59, $2C, $30, $C8, $1D ; r⎵sw[or]d
#_1CC8D6: db $76 ; line 3
#_1CC8D7: db $A8, $59, $1A, $59, $E1, $22, $25, $1E ; [for]⎵a⎵[wh]ile
#_1CC8DF: db $41 ; .
#_1CC8E0: db $7F ; end of message

;===================================================================================================
; Your sword is tempered-up!
; Now hold it!
;---------------------------------------------------------------------------------------------------
Message_00DE:
#_1CC8E1: db $E8, $2B, $59, $2C, $30, $C8, $1D, $59 ; [You]r⎵sw[or]d⎵
#_1CC8E9: db $B5, $59, $2D, $1E, $26, $C9, $1E, $1D ; [is]⎵tem[per]ed
#_1CC8F1: db $40, $DC, $3E ; -[up]!
#_1CC8F4: db $75 ; line 2
#_1CC8F5: db $0D, $28, $30, $59, $21, $28, $25, $1D ; Now⎵hold
#_1CC8FD: db $59, $B6, $3E ; ⎵[it]!
#_1CC900: db $7F ; end of message

;===================================================================================================
; If my lost partner returns,
; we can temper your sword,
; but now, I can't do
; anything for you.
;---------------------------------------------------------------------------------------------------
Message_00DF:
#_1CC901: db $08, $1F, $59, $26, $32, $59, $BB, $D3 ; If⎵my⎵[lo][st]
#_1CC909: db $59, $29, $1A, $2B, $2D, $27, $A1, $CE ; ⎵partn[er ][re]
#_1CC911: db $2D, $2E, $2B, $27, $2C, $42 ; turns,
#_1CC917: db $75 ; line 2
#_1CC918: db $E0, $59, $99, $2D, $1E, $26, $C9, $59 ; [we]⎵[can ]tem[per]⎵
#_1CC920: db $E3, $2B, $59, $2C, $30, $C8, $1D, $42 ; [you]r⎵sw[or]d,
#_1CC928: db $76 ; line 3
#_1CC929: db $1B, $2E, $2D, $59, $27, $28, $30, $42 ; but⎵now,
#_1CC931: db $59, $08, $59, $1C, $93, $51, $2D, $59 ; ⎵I⎵c[an]'t⎵
#_1CC939: db $9F ; [do]
#_1CC93A: db $7E ; wait for key
#_1CC93B: db $73 ; scroll text
#_1CC93C: db $93, $32, $D5, $20, $59, $A8, $59, $E3 ; [an]y[thin]g⎵[for]⎵[you]
#_1CC944: db $41 ; .
#_1CC945: db $7F ; end of message

;===================================================================================================
; Oh!  Happy days are here again!
; You found my partner!
; …  We are very happy now…
; Drop by here again!
; At that time, we will temper
; your sword perfectly!
;---------------------------------------------------------------------------------------------------
Message_00E0:
#_1CC946: db $0E, $21, $3E, $8A, $07, $1A, $29, $29 ; Oh![  ]Happ
#_1CC94E: db $32, $59, $1D, $1A, $32, $2C, $59, $8D ; y⎵days⎵[are ]
#_1CC956: db $AF, $1E, $59, $1A, $20, $8F, $3E ; [her]e⎵ag[ain]!
#_1CC95D: db $75 ; line 2
#_1CC95E: db $E8, $59, $1F, $C4, $59, $26, $32, $59 ; [You]⎵f[ound]⎵my⎵
#_1CC966: db $29, $1A, $2B, $2D, $27, $A6, $3E ; partn[er]!
#_1CC96D: db $76 ; line 3
#_1CC96E: db $43, $8A, $16, $1E, $59, $8D, $DD, $32 ; …[  ]We⎵[are ][ver]y
#_1CC976: db $59, $B1, $29, $29, $32, $59, $27, $28 ; ⎵[ha]ppy⎵no
#_1CC97E: db $30, $43 ; w…
#_1CC980: db $7E ; wait for key
#_1CC981: db $73 ; scroll text
#_1CC982: db $03, $2B, $28, $29, $59, $1B, $32, $59 ; Drop⎵by⎵
#_1CC98A: db $AF, $1E, $59, $1A, $20, $8F, $3E ; [her]e⎵ag[ain]!
#_1CC991: db $73 ; scroll text
#_1CC992: db $00, $2D, $59, $D7, $2D, $59, $2D, $22 ; At⎵[tha]t⎵ti
#_1CC99A: db $BE, $42, $59, $E0, $59, $E2, $25, $25 ; [me],⎵[we]⎵[wi]ll
#_1CC9A2: db $59, $2D, $1E, $26, $C9 ; ⎵tem[per]
#_1CC9A7: db $73 ; scroll text
#_1CC9A8: db $E3, $2B, $59, $2C, $30, $C8, $1D, $59 ; [you]r⎵sw[or]d⎵
#_1CC9B0: db $C9, $1F, $1E, $1C, $2D, $25, $32, $3E ; [per]fectly!
#_1CC9B8: db $7F ; end of message

;===================================================================================================
; Ribbit ribbit…  Your body did
; not change!  You are not just
; an ordinary guy, are you?
; I used to live in Kakariko Town.
; I wonder what my partner is
; doing there without me…
; Ribbit!  I have a request of
; you.
; Please take me to my partner!
; Please!  Ribbit!  Please!
;---------------------------------------------------------------------------------------------------
Message_00E1:
#_1CC9B9: db $11, $22, $1B, $1B, $B6, $59, $2B, $22 ; Ribb[it]⎵ri
#_1CC9C1: db $1B, $1B, $B6, $43, $8A, $E8, $2B, $59 ; bb[it]…[  ][You]r⎵
#_1CC9C9: db $98, $1D, $32, $59, $9E, $1D ; [bo]dy⎵[di]d
#_1CC9CF: db $75 ; line 2
#_1CC9D0: db $C2, $59, $1C, $B1, $27, $20, $1E, $3E ; [not]⎵c[ha]nge!
#_1CC9D8: db $8A, $E8, $59, $8D, $C2, $59, $B7 ; [  ][You]⎵[are ][not]⎵[just]
#_1CC9DF: db $76 ; line 3
#_1CC9E0: db $93, $59, $C8, $9E, $27, $1A, $2B, $32 ; [an]⎵[or][di]nary
#_1CC9E8: db $59, $20, $2E, $32, $42, $59, $8D, $E3 ; ⎵guy,⎵[are ][you]
#_1CC9F0: db $3F ; ?
#_1CC9F1: db $7E ; wait for key
#_1CC9F2: db $73 ; scroll text
#_1CC9F3: db $08, $59, $2E, $D0, $1D, $59, $DA, $59 ; I⎵u[se]d⎵[to]⎵
#_1CC9FB: db $25, $22, $2F, $1E, $59, $B4, $59, $0A ; live⎵[in]⎵K
#_1CCA03: db $1A, $24, $1A, $2B, $22, $24, $28, $59 ; akariko⎵
#_1CCA0B: db $13, $28, $30, $27, $41 ; Town.
#_1CCA10: db $73 ; scroll text
#_1CCA11: db $08, $59, $30, $C7, $1D, $A1, $E1, $91 ; I⎵w[on]d[er ][wh][at ]
#_1CCA19: db $26, $32, $59, $29, $1A, $2B, $2D, $27 ; my⎵partn
#_1CCA21: db $A1, $B5 ; [er ][is]
#_1CCA23: db $73 ; scroll text
#_1CCA24: db $9F, $B3, $D8, $CD, $DE, $C5, $BE, $43 ; [do][ing ][the][re ][with][out ][me]…
#_1CCA2C: db $7E ; wait for key
#_1CCA2D: db $73 ; scroll text
#_1CCA2E: db $11, $22, $1B, $1B, $B6, $3E, $8A, $08 ; Ribb[it]![  ]I
#_1CCA36: db $59, $AD, $59, $1A, $59, $CE, $2A, $2E ; ⎵[have]⎵a⎵[re]qu
#_1CCA3E: db $1E, $D3, $59, $C6 ; e[st]⎵[of]
#_1CCA42: db $73 ; scroll text
#_1CCA43: db $E3, $41 ; [you].
#_1CCA45: db $73 ; scroll text
#_1CCA46: db $0F, $25, $1E, $1A, $D0, $59, $2D, $1A ; Plea[se]⎵ta
#_1CCA4E: db $24, $1E, $59, $BE, $59, $DA, $59, $26 ; ke⎵[me]⎵[to]⎵m
#_1CCA56: db $32, $59, $29, $1A, $2B, $2D, $27, $A6 ; y⎵partn[er]
#_1CCA5E: db $3E ; !
#_1CCA5F: db $7E ; wait for key
#_1CCA60: db $73 ; scroll text
#_1CCA61: db $0F, $25, $1E, $1A, $D0, $3E, $8A, $11 ; Plea[se]![  ]R
#_1CCA69: db $22, $1B, $1B, $B6, $3E, $8A, $0F, $25 ; ibb[it]![  ]Pl
#_1CCA71: db $1E, $1A, $D0, $3E ; ea[se]!
#_1CCA75: db $7F ; end of message

;===================================================================================================
; I'm sorry, we're not done yet.
; Come back after a while.
;---------------------------------------------------------------------------------------------------
Message_00E2:
#_1CCA76: db $08, $51, $26, $59, $D2, $2B, $2B, $32 ; I'm⎵[so]rry
#_1CCA7E: db $42, $59, $E0, $51, $CD, $C2, $59, $9F ; ,⎵[we]'[re ][not]⎵[do]
#_1CCA86: db $27, $1E, $59, $32, $1E, $2D, $41 ; ne⎵yet.
#_1CCA8D: db $75 ; line 2
#_1CCA8E: db $02, $28, $BE, $59, $96, $9C, $59, $1A ; Co[me]⎵[ba][ck]⎵a
#_1CCA96: db $1F, $D4, $1A, $59, $E1, $22, $25, $1E ; f[ter ]a⎵[wh]ile
#_1CCA9E: db $41 ; .
#_1CCA9F: db $7F ; end of message

;===================================================================================================
; Thank you!
; 
; Thank you!
;---------------------------------------------------------------------------------------------------
Message_00E3:
#_1CCAA0: db $E5, $27, $24, $59, $E3, $3E ; [Tha]nk⎵[you]!
#_1CCAA6: db $75 ; line 2
#_1CCAA7: db $76 ; line 3
#_1CCAA8: db $E5, $27, $24, $59, $E3, $3E ; [Tha]nk⎵[you]!
#_1CCAAE: db $7F ; end of message

;===================================================================================================
; Hey hey, amateurs shouldn't
; try to do this.  You're just
; getting in the way!
;---------------------------------------------------------------------------------------------------
Message_00E4:
#_1CCAAF: db $07, $1E, $32, $59, $21, $1E, $32, $42 ; Hey⎵hey,
#_1CCAB7: db $59, $1A, $BD, $2D, $1E, $2E, $2B, $2C ; ⎵a[ma]teurs
#_1CCABF: db $59, $D1, $28, $2E, $25, $1D, $27, $51 ; ⎵[sh]ouldn'
#_1CCAC7: db $2D ; t
#_1CCAC8: db $75 ; line 2
#_1CCAC9: db $DB, $32, $59, $DA, $59, $9F, $59, $D9 ; [tr]y⎵[to]⎵[do]⎵[thi]
#_1CCAD1: db $2C, $41, $8A, $E8, $51, $CD, $B7 ; s.[  ][You]'[re ][just]
#_1CCAD8: db $76 ; line 3
#_1CCAD9: db $AB, $2D, $B3, $B4, $59, $D8, $59, $DF ; [get]t[ing ][in]⎵[the]⎵[wa]
#_1CCAE1: db $32, $3E ; y!
#_1CCAE3: db $7F ; end of message

;===================================================================================================
; After wandering into this world
; I turned into this shape.
; …  …  …
; I enjoyed playing the flute in
; the original world…
; …  …  …
; There was a small grove where
; many animals gathered.  I want
; to see that place again…
; I buried my flute there with
; some flower seeds.
; 
; Will you try to find it for me?
;     > Yes
;        No way
;---------------------------------------------------------------------------------------------------
Message_00E5:
#_1CCAE4: db $00, $1F, $D4, $DF, $27, $1D, $A6, $B3 ; Af[ter ][wa]nd[er][ing ]
#_1CCAEC: db $B4, $DA, $59, $D9, $2C, $59, $30, $C8 ; [in][to]⎵[thi]s⎵w[or]
#_1CCAF4: db $25, $1D ; ld
#_1CCAF6: db $75 ; line 2
#_1CCAF7: db $08, $59, $2D, $2E, $2B, $27, $A4, $B4 ; I⎵turn[ed ][in]
#_1CCAFF: db $DA, $59, $D9, $2C, $59, $D1, $1A, $29 ; [to]⎵[thi]s⎵[sh]ap
#_1CCB07: db $1E, $41 ; e.
#_1CCB09: db $76 ; line 3
#_1CCB0A: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CCB0F: db $7E ; wait for key
#_1CCB10: db $73 ; scroll text
#_1CCB11: db $08, $59, $A5, $23, $28, $32, $A4, $29 ; I⎵[en]joy[ed ]p
#_1CCB19: db $BA, $32, $B3, $D8, $59, $1F, $25, $2E ; [la]y[ing ][the]⎵flu
#_1CCB21: db $2D, $1E, $59, $B4 ; te⎵[in]
#_1CCB25: db $73 ; scroll text
#_1CCB26: db $D8, $59, $C8, $22, $20, $B4, $1A, $25 ; [the]⎵[or]ig[in]al
#_1CCB2E: db $59, $30, $C8, $25, $1D, $43 ; ⎵w[or]ld…
#_1CCB34: db $73 ; scroll text
#_1CCB35: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CCB3A: db $7E ; wait for key
#_1CCB3B: db $73 ; scroll text
#_1CCB3C: db $E6, $CD, $DF, $2C, $59, $1A, $59, $2C ; [The][re ][wa]s⎵a⎵s
#_1CCB44: db $BD, $25, $25, $59, $20, $2B, $28, $2F ; [ma]ll⎵grov
#_1CCB4C: db $1E, $59, $E1, $A6, $1E ; e⎵[wh][er]e
#_1CCB51: db $73 ; scroll text
#_1CCB52: db $BC, $32, $59, $93, $22, $BD, $25, $2C ; [man]y⎵[an]i[ma]ls
#_1CCB5A: db $59, $20, $94, $AF, $1E, $1D, $41, $8A ; ⎵g[at][her]ed.[  ]
#_1CCB62: db $08, $59, $DF, $27, $2D ; I⎵[wa]nt
#_1CCB67: db $73 ; scroll text
#_1CCB68: db $DA, $59, $D0, $1E, $59, $D7, $2D, $59 ; [to]⎵[se]e⎵[tha]t⎵
#_1CCB70: db $29, $BA, $1C, $1E, $59, $1A, $20, $8F ; p[la]ce⎵ag[ain]
#_1CCB78: db $43 ; …
#_1CCB79: db $7E ; wait for key
#_1CCB7A: db $73 ; scroll text
#_1CCB7B: db $08, $59, $1B, $2E, $2B, $22, $A4, $26 ; I⎵buri[ed ]m
#_1CCB83: db $32, $59, $1F, $25, $2E, $2D, $1E, $59 ; y⎵flute⎵
#_1CCB8B: db $D8, $CD, $DE ; [the][re ][with]
#_1CCB8E: db $73 ; scroll text
#_1CCB8F: db $CF, $59, $1F, $BB, $E0, $2B, $59, $D0 ; [some]⎵f[lo][we]r⎵[se]
#_1CCB97: db $1E, $1D, $2C, $41 ; eds.
#_1CCB9B: db $73 ; scroll text
#_1CCB9C: db $7E ; wait for key
#_1CCB9D: db $73 ; scroll text
#_1CCB9E: db $16, $22, $25, $25, $59, $E3, $59, $DB ; Will⎵[you]⎵[tr]
#_1CCBA6: db $32, $59, $DA, $59, $1F, $B4, $1D, $59 ; y⎵[to]⎵f[in]d⎵
#_1CCBAE: db $B6, $59, $A8, $59, $BE, $3F ; [it]⎵[for]⎵[me]?
#_1CCBB4: db $73 ; scroll text
#_1CCBB5: db $88, $44, $59, $18, $1E, $2C ; [    ]>⎵Yes
#_1CCBBB: db $73 ; scroll text
#_1CCBBC: db $88, $89, $0D, $28, $59, $DF, $32 ; [    ][   ]No⎵[wa]y
#_1CCBC3: db $68 ; choose 2 indented
#_1CCBC4: db $7F ; end of message

;===================================================================================================
; Then I will lend you my shovel.
; Good luck!
;---------------------------------------------------------------------------------------------------
Message_00E6:
#_1CCBC5: db $E6, $27, $59, $08, $59, $E2, $25, $25 ; [The]n⎵I⎵[wi]ll
#_1CCBCD: db $59, $25, $A5, $1D, $59, $E3, $59, $26 ; ⎵l[en]d⎵[you]⎵m
#_1CCBD5: db $32, $59, $D1, $28, $2F, $1E, $25, $41 ; y⎵[sh]ovel.
#_1CCBDD: db $75 ; line 2
#_1CCBDE: db $06, $28, $28, $1D, $59, $25, $2E, $9C ; Good⎵lu[ck]
#_1CCBE6: db $3E ; !
#_1CCBE7: db $7F ; end of message

;===================================================================================================
; …  …  …
; I see.  I won't ask you again…
; Good bye.
;---------------------------------------------------------------------------------------------------
Message_00E7:
#_1CCBE8: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CCBED: db $75 ; line 2
#_1CCBEE: db $08, $59, $D0, $1E, $41, $8A, $08, $59 ; I⎵[se]e.[  ]I⎵
#_1CCBF6: db $30, $C7, $51, $2D, $59, $1A, $2C, $24 ; w[on]'t⎵ask
#_1CCBFE: db $59, $E3, $59, $1A, $20, $8F, $43 ; ⎵[you]⎵ag[ain]…
#_1CCC05: db $76 ; line 3
#_1CCC06: db $06, $28, $28, $1D, $59, $1B, $32, $1E ; Good⎵bye
#_1CCC0E: db $41 ; .
#_1CCC0F: db $7F ; end of message

;===================================================================================================
; Did you find my flute?
; …  …  …
; Please keep looking for it…
;---------------------------------------------------------------------------------------------------
Message_00E8:
#_1CCC10: db $03, $22, $1D, $59, $E3, $59, $1F, $B4 ; Did⎵[you]⎵f[in]
#_1CCC18: db $1D, $59, $26, $32, $59, $1F, $25, $2E ; d⎵my⎵flu
#_1CCC20: db $2D, $1E, $3F ; te?
#_1CCC23: db $75 ; line 2
#_1CCC24: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CCC29: db $76 ; line 3
#_1CCC2A: db $0F, $25, $1E, $1A, $D0, $59, $24, $1E ; Plea[se]⎵ke
#_1CCC32: db $1E, $29, $59, $BB, $28, $24, $B3, $A8 ; ep⎵[lo]ok[ing ][for]
#_1CCC3A: db $59, $B6, $43 ; ⎵[it]…
#_1CCC3D: db $7F ; end of message

;===================================================================================================
; Thank you, [LINK].  But it
; looks like I can't play my flute
; any more.  Please take it.
; If by chance you go to the
; village I lived in, please give
; it to a tired old man you will
; find there.
; …  …  …
; Well,  my mind is getting
; hazy…
; Please let me hear the sound of
; the flute one last time…
;---------------------------------------------------------------------------------------------------
Message_00E9:
#_1CCC3E: db $E5, $27, $24, $59, $E3, $42, $59, $6A ; [Tha]nk⎵[you],⎵[LINK]
#_1CCC46: db $41, $8A, $01, $2E, $2D, $59, $B6 ; .[  ]But⎵[it]
#_1CCC4D: db $75 ; line 2
#_1CCC4E: db $BB, $28, $24, $2C, $59, $25, $22, $24 ; [lo]oks⎵lik
#_1CCC56: db $1E, $59, $08, $59, $1C, $93, $51, $2D ; e⎵I⎵c[an]'t
#_1CCC5E: db $59, $29, $BA, $32, $59, $26, $32, $59 ; ⎵p[la]y⎵my⎵
#_1CCC66: db $1F, $25, $2E, $2D, $1E ; flute
#_1CCC6B: db $76 ; line 3
#_1CCC6C: db $93, $32, $59, $26, $C8, $1E, $41, $8A ; [an]y⎵m[or]e.[  ]
#_1CCC74: db $0F, $25, $1E, $1A, $D0, $59, $2D, $1A ; Plea[se]⎵ta
#_1CCC7C: db $24, $1E, $59, $B6, $41 ; ke⎵[it].
#_1CCC81: db $7E ; wait for key
#_1CCC82: db $73 ; scroll text
#_1CCC83: db $08, $1F, $59, $1B, $32, $59, $1C, $B1 ; If⎵by⎵c[ha]
#_1CCC8B: db $27, $1C, $1E, $59, $E3, $59, $AC, $59 ; nce⎵[you]⎵[go]⎵
#_1CCC93: db $DA, $59, $D8 ; [to]⎵[the]
#_1CCC96: db $73 ; scroll text
#_1CCC97: db $2F, $22, $25, $BA, $20, $1E, $59, $08 ; vil[la]ge⎵I
#_1CCC9F: db $59, $25, $22, $2F, $A4, $B4, $42, $59 ; ⎵liv[ed ][in],⎵
#_1CCCA7: db $CA, $1A, $D0, $59, $20, $22, $2F, $1E ; [ple]a[se]⎵give
#_1CCCAF: db $73 ; scroll text
#_1CCCB0: db $B6, $59, $DA, $59, $1A, $59, $2D, $22 ; [it]⎵[to]⎵a⎵ti
#_1CCCB8: db $CE, $1D, $59, $28, $25, $1D, $59, $BC ; [re]d⎵old⎵[man]
#_1CCCC0: db $59, $E3, $59, $E2, $25, $25 ; ⎵[you]⎵[wi]ll
#_1CCCC6: db $7E ; wait for key
#_1CCCC7: db $73 ; scroll text
#_1CCCC8: db $1F, $B4, $1D, $59, $D8, $CE, $41 ; f[in]d⎵[the][re].
#_1CCCCF: db $73 ; scroll text
#_1CCCD0: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CCCD5: db $73 ; scroll text
#_1CCCD6: db $16, $1E, $25, $25, $42, $8A, $26, $32 ; Well,[  ]my
#_1CCCDE: db $59, $26, $B4, $1D, $59, $B5, $59, $AB ; ⎵m[in]d⎵[is]⎵[get]
#_1CCCE6: db $2D, $B4, $20 ; t[in]g
#_1CCCE9: db $7E ; wait for key
#_1CCCEA: db $73 ; scroll text
#_1CCCEB: db $B1, $33, $32, $43 ; [ha]zy…
#_1CCCEF: db $73 ; scroll text
#_1CCCF0: db $0F, $25, $1E, $1A, $D0, $59, $25, $1E ; Plea[se]⎵le
#_1CCCF8: db $2D, $59, $BE, $59, $21, $A2, $59, $D8 ; t⎵[me]⎵h[ear]⎵[the]
#_1CCD00: db $59, $D2, $2E, $27, $1D, $59, $C6 ; ⎵[so]und⎵[of]
#_1CCD07: db $73 ; scroll text
#_1CCD08: db $D8, $59, $1F, $25, $2E, $2D, $1E, $59 ; [the]⎵flute⎵
#_1CCD10: db $C7, $1E, $59, $BA, $D3, $59, $2D, $22 ; [on]e⎵[la][st]⎵ti
#_1CCD18: db $BE, $43 ; [me]…
#_1CCD1A: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will find the elder
; Sahasrahla…
;---------------------------------------------------------------------------------------------------
Message_00EA:
#_1CCD1B: db $6D, $01 ; set window position
#_1CCD1D: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CCD25: db $1C, $2E, $2C, $3E ; cus!
#_1CCD29: db $75 ; line 2
#_1CCD2A: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CCD32: db $1D, $59, $D8, $59, $1E, $25, $1D, $A6 ; d⎵[the]⎵eld[er]
#_1CCD3A: db $76 ; line 3
#_1CCD3B: db $12, $1A, $AE, $2B, $1A, $21, $BA, $43 ; Sa[has]rah[la]…
#_1CCD43: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; You will open a desert lock with
; the Book of Mudora.
;---------------------------------------------------------------------------------------------------
Message_00EB:
#_1CCD44: db $6D, $01 ; set window position
#_1CCD46: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CCD4E: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CCD56: db $33, $1A, $26, $3E ; zam!
#_1CCD5A: db $75 ; line 2
#_1CCD5B: db $E8, $59, $E2, $25, $25, $59, $C3, $59 ; [You]⎵[wi]ll⎵[open]⎵
#_1CCD63: db $1A, $59, $9D, $A6, $2D, $59, $BB, $9C ; a⎵[des][er]t⎵[lo][ck]
#_1CCD6B: db $59, $DE ; ⎵[with]
#_1CCD6D: db $76 ; line 3
#_1CCD6E: db $D8, $59, $01, $28, $28, $24, $59, $C6 ; [the]⎵Book⎵[of]
#_1CCD76: db $59, $0C, $2E, $9F, $2B, $1A, $41 ; ⎵Mu[do]ra.
#_1CCD7D: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will find a member of the
; wise men's line in the desert.
;---------------------------------------------------------------------------------------------------
Message_00EC:
#_1CCD7E: db $6D, $01 ; set window position
#_1CCD80: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CCD88: db $1C, $2E, $2C, $3E ; cus!
#_1CCD8C: db $75 ; line 2
#_1CCD8D: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CCD95: db $1D, $59, $1A, $59, $BE, $26, $97, $2B ; d⎵a⎵[me]m[be]r
#_1CCD9D: db $59, $C6, $59, $D8 ; ⎵[of]⎵[the]
#_1CCDA1: db $76 ; line 3
#_1CCDA2: db $E2, $D0, $59, $BE, $27, $8B, $25, $B4 ; [wi][se]⎵[me]n['s ]l[in]
#_1CCDAA: db $1E, $59, $B4, $59, $D8, $59, $9D, $A6 ; e⎵[in]⎵[the]⎵[des][er]
#_1CCDB2: db $2D, $41 ; t.
#_1CCDB4: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; You will find a mushroom lover
; at the Magic Shop…
;---------------------------------------------------------------------------------------------------
Message_00ED:
#_1CCDB5: db $6D, $01 ; set window position
#_1CCDB7: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CCDBF: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CCDC7: db $33, $1A, $26, $3E ; zam!
#_1CCDCB: db $75 ; line 2
#_1CCDCC: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CCDD4: db $1D, $59, $1A, $59, $BF, $D1, $2B, $28 ; d⎵a⎵[mu][sh]ro
#_1CCDDC: db $28, $26, $59, $BB, $DD ; om⎵[lo][ver]
#_1CCDE1: db $76 ; line 3
#_1CCDE2: db $91, $D8, $59, $0C, $1A, $20, $22, $1C ; [at ][the]⎵Magic
#_1CCDEA: db $59, $12, $21, $28, $29, $43 ; ⎵Shop…
#_1CCDF0: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will meet Zora living in a
; lake at the river's source…
;---------------------------------------------------------------------------------------------------
Message_00EE:
#_1CCDF1: db $6D, $01 ; set window position
#_1CCDF3: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CCDFB: db $1C, $2E, $2C, $3E ; cus!
#_1CCDFF: db $75 ; line 2
#_1CCE00: db $E8, $59, $E2, $25, $25, $59, $BE, $1E ; [You]⎵[wi]ll⎵[me]e
#_1CCE08: db $2D, $59, $19, $C8, $1A, $59, $25, $22 ; t⎵Z[or]a⎵li
#_1CCE10: db $2F, $B3, $B4, $59, $1A ; v[ing ][in]⎵a
#_1CCE15: db $76 ; line 3
#_1CCE16: db $BA, $24, $1E, $59, $91, $D8, $59, $2B ; [la]ke⎵[at ][the]⎵r
#_1CCE1E: db $22, $DD, $8B, $D2, $2E, $2B, $1C, $1E ; i[ver]['s ][so]urce
#_1CCE26: db $43 ; …
#_1CCE27: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; The true Hero will find the
; Moon Pearl in the
; mountain tower.
;---------------------------------------------------------------------------------------------------
Message_00EF:
#_1CCE28: db $6D, $01 ; set window position
#_1CCE2A: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CCE32: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CCE3A: db $33, $1A, $26, $3E ; zam!
#_1CCE3E: db $75 ; line 2
#_1CCE3F: db $E6, $59, $DB, $2E, $1E, $59, $E4, $28 ; [The]⎵[tr]ue⎵[Her]o
#_1CCE47: db $59, $E2, $25, $25, $59, $1F, $B4, $1D ; ⎵[wi]ll⎵f[in]d
#_1CCE4F: db $59, $D8 ; ⎵[the]
#_1CCE51: db $76 ; line 3
#_1CCE52: db $0C, $28, $C7, $59, $0F, $A2, $25, $59 ; Mo[on]⎵P[ear]l⎵
#_1CCE5A: db $B4, $59, $D8 ; [in]⎵[the]
#_1CCE5D: db $7E ; wait for key
#_1CCE5E: db $73 ; scroll text
#_1CCE5F: db $26, $28, $2E, $27, $2D, $8F, $59, $DA ; mount[ain]⎵[to]
#_1CCE67: db $E0, $2B, $41 ; [we]r.
#_1CCE6A: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; Even the mighty Master Sword
; cannot harm the wizard's body.
;---------------------------------------------------------------------------------------------------
Message_00F0:
#_1CCE6B: db $6D, $01 ; set window position
#_1CCE6D: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CCE75: db $1C, $2E, $2C, $3E ; cus!
#_1CCE79: db $75 ; line 2
#_1CCE7A: db $04, $2F, $A0, $D8, $59, $26, $22, $20 ; Ev[en ][the]⎵mig
#_1CCE82: db $21, $2D, $32, $59, $0C, $92, $A1, $12 ; hty⎵M[ast][er ]S
#_1CCE8A: db $30, $C8, $1D ; w[or]d
#_1CCE8D: db $76 ; line 3
#_1CCE8E: db $1C, $93, $C2, $59, $B1, $2B, $26, $59 ; c[an][not]⎵[ha]rm⎵
#_1CCE96: db $D8, $59, $E2, $33, $1A, $2B, $1D, $8B ; [the]⎵[wi]zard['s ]
#_1CCE9E: db $98, $1D, $32, $41 ; [bo]dy.
#_1CCEA2: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; The true Hero will jump into the
; well near the smithy's shop.
;---------------------------------------------------------------------------------------------------
Message_00F1:
#_1CCEA3: db $6D, $01 ; set window position
#_1CCEA5: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CCEAD: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CCEB5: db $33, $1A, $26, $3E ; zam!
#_1CCEB9: db $75 ; line 2
#_1CCEBA: db $E6, $59, $DB, $2E, $1E, $59, $E4, $28 ; [The]⎵[tr]ue⎵[Her]o
#_1CCEC2: db $59, $E2, $25, $25, $59, $23, $2E, $26 ; ⎵[wi]ll⎵jum
#_1CCECA: db $29, $59, $B4, $DA, $59, $D8 ; p⎵[in][to]⎵[the]
#_1CCED0: db $76 ; line 3
#_1CCED1: db $E0, $25, $25, $59, $27, $A2, $59, $D8 ; [we]ll⎵n[ear]⎵[the]
#_1CCED9: db $59, $2C, $26, $B6, $21, $32, $8B, $D1 ; ⎵sm[it]hy['s ][sh]
#_1CCEE1: db $28, $29, $41 ; op.
#_1CCEE4: db $7F ; end of message

;===================================================================================================
; Well, I have to say my condition
; isn't very good today.  But I
; want you to come back again…
;---------------------------------------------------------------------------------------------------
Message_00F2:
#_1CCEE5: db $6D, $01 ; set window position
#_1CCEE7: db $16, $1E, $25, $25, $42, $59, $08, $59 ; Well,⎵I⎵
#_1CCEEF: db $AD, $59, $DA, $59, $2C, $1A, $32, $59 ; [have]⎵[to]⎵say⎵
#_1CCEF7: db $26, $32, $59, $1C, $C7, $9E, $2D, $22 ; my⎵c[on][di]ti
#_1CCEFF: db $C7 ; [on]
#_1CCF00: db $75 ; line 2
#_1CCF01: db $B5, $C0, $DD, $32, $59, $AC, $28, $1D ; [is][n't ][ver]y⎵[go]od
#_1CCF09: db $59, $DA, $1D, $1A, $32, $41, $8A, $01 ; ⎵[to]day.[  ]B
#_1CCF11: db $2E, $2D, $59, $08 ; ut⎵I
#_1CCF15: db $76 ; line 3
#_1CCF16: db $DF, $27, $2D, $59, $E3, $59, $DA, $59 ; [wa]nt⎵[you]⎵[to]⎵
#_1CCF1E: db $9B, $1E, $59, $96, $9C, $59, $1A, $20 ; [com]e⎵[ba][ck]⎵ag
#_1CCF26: db $8F, $43 ; [ain]…
#_1CCF28: db $7F ; end of message

;===================================================================================================
; Hmmm…  You look like you might
; have an interesting destiny…
; May I tell your fortune?
; I'll make it cheap…
;     > Ask him to tell it
;        Not interested
;---------------------------------------------------------------------------------------------------
Message_00F3:
#_1CCF29: db $6D, $01 ; set window position
#_1CCF2B: db $07, $26, $26, $26, $43, $8A, $E8, $59 ; Hmmm…[  ][You]⎵
#_1CCF33: db $BB, $28, $24, $59, $25, $22, $24, $1E ; [lo]ok⎵like
#_1CCF3B: db $59, $E3, $59, $26, $22, $20, $21, $2D ; ⎵[you]⎵might
#_1CCF43: db $75 ; line 2
#_1CCF44: db $AD, $59, $93, $59, $B4, $D6, $1E, $D3 ; [have]⎵[an]⎵[in][ter]e[st]
#_1CCF4C: db $B3, $9D, $2D, $B4, $32, $43 ; [ing ][des]t[in]y…
#_1CCF52: db $76 ; line 3
#_1CCF53: db $0C, $1A, $32, $59, $08, $59, $2D, $1E ; May⎵I⎵te
#_1CCF5B: db $25, $25, $59, $E3, $2B, $59, $A8, $2D ; ll⎵[you]r⎵[for]t
#_1CCF63: db $2E, $27, $1E, $3F ; une?
#_1CCF67: db $7E ; wait for key
#_1CCF68: db $73 ; scroll text
#_1CCF69: db $08, $51, $25, $25, $59, $BD, $24, $1E ; I'll⎵[ma]ke
#_1CCF71: db $59, $B6, $59, $9A, $1A, $29, $43 ; ⎵[it]⎵[che]ap…
#_1CCF78: db $73 ; scroll text
#_1CCF79: db $88, $44, $59, $00, $2C, $24, $59, $B0 ; [    ]>⎵Ask⎵[hi]
#_1CCF81: db $26, $59, $DA, $59, $2D, $1E, $25, $25 ; m⎵[to]⎵tell
#_1CCF89: db $59, $B6 ; ⎵[it]
#_1CCF8B: db $73 ; scroll text
#_1CCF8C: db $88, $89, $0D, $28, $2D, $59, $B4, $D6 ; [    ][   ]Not⎵[in][ter]
#_1CCF94: db $1E, $D3, $1E, $1D ; e[st]ed
#_1CCF98: db $68 ; choose 2 indented
#_1CCF99: db $7F ; end of message

;===================================================================================================
; Now I will take [#0][#1] Rupees.
; I hope you will be healthy.
; Yeehah ha hah!
;---------------------------------------------------------------------------------------------------
Message_00F4:
#_1CCF9A: db $6D, $01 ; set window position
#_1CCF9C: db $0D, $28, $30, $59, $08, $59, $E2, $25 ; Now⎵I⎵[wi]l
#_1CCFA4: db $25, $59, $2D, $1A, $24, $1E, $59 ; l⎵take⎵
#_1CCFAB: db $6C, $00, $6C, $01, $59, $11, $DC, $1E ; [#0][#1]⎵R[up]e
#_1CCFB3: db $1E, $2C, $41 ; es.
#_1CCFB6: db $75 ; line 2
#_1CCFB7: db $08, $59, $21, $28, $29, $1E, $59, $E3 ; I⎵hope⎵[you]
#_1CCFBF: db $59, $E2, $25, $25, $59, $97, $59, $21 ; ⎵[wi]ll⎵[be]⎵h
#_1CCFC7: db $1E, $1A, $25, $2D, $21, $32, $41 ; ealthy.
#_1CCFCE: db $76 ; line 3
#_1CCFCF: db $18, $1E, $1E, $B1, $21, $59, $B1, $59 ; Yee[ha]h⎵[ha]⎵
#_1CCFD7: db $B1, $21, $3E ; [ha]h!
#_1CCFDA: db $7F ; end of message

;===================================================================================================
; It is indeed a poor man who is
; not interested in his future…
; I'll be waiting for your return.
;---------------------------------------------------------------------------------------------------
Message_00F5:
#_1CCFDB: db $6D, $01 ; set window position
#_1CCFDD: db $08, $2D, $59, $B5, $59, $B4, $1D, $1E ; It⎵[is]⎵[in]de
#_1CCFE5: db $A4, $1A, $59, $29, $28, $C8, $59, $BC ; [ed ]a⎵po[or]⎵[man]
#_1CCFED: db $59, $E1, $28, $59, $B5 ; ⎵[wh]o⎵[is]
#_1CCFF2: db $75 ; line 2
#_1CCFF3: db $C2, $59, $B4, $D6, $1E, $D3, $A4, $B4 ; [not]⎵[in][ter]e[st][ed ][in]
#_1CCFFB: db $59, $B0, $2C, $59, $1F, $2E, $2D, $2E ; ⎵[hi]s⎵futu
#_1CD003: db $CE, $43 ; [re]…
#_1CD005: db $76 ; line 3
#_1CD006: db $08, $51, $25, $25, $59, $97, $59, $DF ; I'll⎵[be]⎵[wa]
#_1CD00E: db $B6, $B3, $A8, $59, $E3, $2B, $59, $CE ; [it][ing ][for]⎵[you]r⎵[re]
#_1CD016: db $2D, $2E, $2B, $27, $41 ; turn.
#_1CD01B: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will meet a strange man
; standing in the desert…
;---------------------------------------------------------------------------------------------------
Message_00F6:
#_1CD01C: db $6D, $01 ; set window position
#_1CD01E: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CD026: db $1C, $2E, $2C, $3E ; cus!
#_1CD02A: db $75 ; line 2
#_1CD02B: db $E8, $59, $E2, $25, $25, $59, $BE, $1E ; [You]⎵[wi]ll⎵[me]e
#_1CD033: db $2D, $59, $1A, $59, $D3, $2B, $93, $20 ; t⎵a⎵[st]r[an]g
#_1CD03B: db $1E, $59, $BC ; e⎵[man]
#_1CD03E: db $76 ; line 3
#_1CD03F: db $D3, $90, $B3, $B4, $59, $D8, $59, $9D ; [st][and][ing ][in]⎵[the]⎵[des]
#_1CD047: db $A6, $2D, $43 ; [er]t…
#_1CD04A: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; The gossip shop in the Dark
; World has treasure for the
; asking…
;---------------------------------------------------------------------------------------------------
Message_00F7:
#_1CD04B: db $6D, $01 ; set window position
#_1CD04D: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CD055: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CD05D: db $33, $1A, $26, $3E ; zam!
#_1CD061: db $75 ; line 2
#_1CD062: db $E6, $59, $AC, $2C, $2C, $22, $29, $59 ; [The]⎵[go]ssip⎵
#_1CD06A: db $D1, $28, $29, $59, $B4, $59, $D8, $59 ; [sh]op⎵[in]⎵[the]⎵
#_1CD072: db $03, $1A, $2B, $24 ; Dark
#_1CD076: db $76 ; line 3
#_1CD077: db $16, $C8, $25, $1D, $59, $AE, $59, $DB ; W[or]ld⎵[has]⎵[tr]
#_1CD07F: db $1E, $1A, $2C, $2E, $CD, $A8, $59, $D8 ; easu[re ][for]⎵[the]
#_1CD087: db $7E ; wait for key
#_1CD088: db $73 ; scroll text
#_1CD089: db $1A, $2C, $24, $B4, $20, $43 ; ask[in]g…
#_1CD08F: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will find the smith's
; partner in the
; Village Of Outcasts.
;---------------------------------------------------------------------------------------------------
Message_00F8:
#_1CD090: db $6D, $01 ; set window position
#_1CD092: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CD09A: db $1C, $2E, $2C, $3E ; cus!
#_1CD09E: db $75 ; line 2
#_1CD09F: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CD0A7: db $1D, $59, $D8, $59, $2C, $26, $B6, $21 ; d⎵[the]⎵sm[it]h
#_1CD0AF: db $51, $2C ; 's
#_1CD0B1: db $76 ; line 3
#_1CD0B2: db $29, $1A, $2B, $2D, $27, $A1, $B4, $59 ; partn[er ][in]⎵
#_1CD0BA: db $D8 ; [the]
#_1CD0BB: db $7E ; wait for key
#_1CD0BC: db $73 ; scroll text
#_1CD0BD: db $15, $22, $25, $BA, $20, $1E, $59, $0E ; Vil[la]ge⎵O
#_1CD0C5: db $1F, $59, $0E, $2E, $2D, $1C, $92, $2C ; f⎵Outc[ast]s
#_1CD0CD: db $41 ; .
#_1CD0CE: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; You will find a treasure resting
; in peace in the graveyard.
;---------------------------------------------------------------------------------------------------
Message_00F9:
#_1CD0CF: db $6D, $01 ; set window position
#_1CD0D1: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CD0D9: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CD0E1: db $33, $1A, $26, $3E ; zam!
#_1CD0E5: db $75 ; line 2
#_1CD0E6: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CD0EE: db $1D, $59, $1A, $59, $DB, $1E, $1A, $2C ; d⎵a⎵[tr]eas
#_1CD0F6: db $2E, $CD, $CE, $D3, $B4, $20 ; u[re ][re][st][in]g
#_1CD0FC: db $76 ; line 3
#_1CD0FD: db $B4, $59, $29, $1E, $1A, $1C, $1E, $59 ; [in]⎵peace⎵
#_1CD105: db $B4, $59, $D8, $59, $20, $2B, $1A, $2F ; [in]⎵[the]⎵grav
#_1CD10D: db $1E, $32, $1A, $2B, $1D, $41 ; eyard.
#_1CD113: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will buy a new kind of bomb
; in the Bomb Shop.
;---------------------------------------------------------------------------------------------------
Message_00FA:
#_1CD114: db $6D, $01 ; set window position
#_1CD116: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CD11E: db $1C, $2E, $2C, $3E ; cus!
#_1CD122: db $75 ; line 2
#_1CD123: db $E8, $59, $E2, $25, $25, $59, $1B, $2E ; [You]⎵[wi]ll⎵bu
#_1CD12B: db $32, $59, $1A, $59, $27, $1E, $30, $59 ; y⎵a⎵new⎵
#_1CD133: db $24, $B4, $1D, $59, $C6, $59, $98, $26 ; k[in]d⎵[of]⎵[bo]m
#_1CD13B: db $1B ; b
#_1CD13C: db $76 ; line 3
#_1CD13D: db $B4, $59, $D8, $59, $01, $28, $26, $1B ; [in]⎵[the]⎵Bomb
#_1CD145: db $59, $12, $21, $28, $29, $41 ; ⎵Shop.
#_1CD14B: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; You will find something inside
; the pyramid of the Dark World.
;---------------------------------------------------------------------------------------------------
Message_00FB:
#_1CD14C: db $6D, $01 ; set window position
#_1CD14E: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CD156: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CD15E: db $33, $1A, $26, $3E ; zam!
#_1CD162: db $75 ; line 2
#_1CD163: db $E8, $59, $E2, $25, $25, $59, $1F, $B4 ; [You]⎵[wi]ll⎵f[in]
#_1CD16B: db $1D, $59, $CF, $D5, $20, $59, $B4, $2C ; d⎵[some][thin]g⎵[in]s
#_1CD173: db $22, $1D, $1E ; ide
#_1CD176: db $76 ; line 3
#_1CD177: db $D8, $59, $29, $32, $2B, $1A, $26, $22 ; [the]⎵pyrami
#_1CD17F: db $1D, $59, $C6, $59, $D8, $59, $03, $1A ; d⎵[of]⎵[the]⎵Da
#_1CD187: db $2B, $24, $59, $16, $C8, $25, $1D, $41 ; rk⎵W[or]ld.
#_1CD18F: db $7F ; end of message

;===================================================================================================
; Hocus pocus!
; You will run into a barrier if
; you try to enter
; Ganon's tower.
;---------------------------------------------------------------------------------------------------
Message_00FC:
#_1CD190: db $6D, $01 ; set window position
#_1CD192: db $07, $28, $1C, $2E, $2C, $59, $29, $28 ; Hocus⎵po
#_1CD19A: db $1C, $2E, $2C, $3E ; cus!
#_1CD19E: db $75 ; line 2
#_1CD19F: db $E8, $59, $E2, $25, $25, $59, $2B, $2E ; [You]⎵[wi]ll⎵ru
#_1CD1A7: db $27, $59, $B4, $DA, $59, $1A, $59, $96 ; n⎵[in][to]⎵a⎵[ba]
#_1CD1AF: db $2B, $2B, $22, $A1, $22, $1F ; rri[er ]if
#_1CD1B5: db $76 ; line 3
#_1CD1B6: db $E3, $59, $DB, $32, $59, $DA, $59, $A3 ; [you]⎵[tr]y⎵[to]⎵[ent]
#_1CD1BE: db $A6 ; [er]
#_1CD1BF: db $7E ; wait for key
#_1CD1C0: db $73 ; scroll text
#_1CD1C1: db $06, $93, $C7, $8B, $DA, $E0, $2B, $41 ; G[an][on]['s ][to][we]r.
#_1CD1C9: db $7F ; end of message

;===================================================================================================
; Abracadabra alakazam!
; You will need Silver Arrows to
; give Ganon his last moment.
;---------------------------------------------------------------------------------------------------
Message_00FD:
#_1CD1CA: db $6D, $01 ; set window position
#_1CD1CC: db $00, $1B, $2B, $1A, $1C, $1A, $1D, $1A ; Abracada
#_1CD1D4: db $1B, $2B, $1A, $59, $1A, $BA, $24, $1A ; bra⎵a[la]ka
#_1CD1DC: db $33, $1A, $26, $3E ; zam!
#_1CD1E0: db $75 ; line 2
#_1CD1E1: db $E8, $59, $E2, $25, $25, $59, $27, $1E ; [You]⎵[wi]ll⎵ne
#_1CD1E9: db $A4, $12, $22, $25, $DD, $59, $00, $2B ; [ed ]Sil[ver]⎵Ar
#_1CD1F1: db $2B, $28, $30, $2C, $59, $DA ; rows⎵[to]
#_1CD1F7: db $76 ; line 3
#_1CD1F8: db $AA, $06, $93, $C7, $59, $B0, $2C, $59 ; [give ]G[an][on]⎵[hi]s⎵
#_1CD200: db $BA, $D3, $59, $26, $28, $BE, $27, $2D ; [la][st]⎵mo[me]nt
#_1CD208: db $41 ; .
#_1CD209: db $7F ; end of message

;===================================================================================================
; Hey!  I'll tell you a profitable
; story if you pay me 20 Rupees.
; How about it?
;     > Pay Rupees
;        Don't want to hear it
;---------------------------------------------------------------------------------------------------
Message_00FE:
#_1CD20A: db $07, $1E, $32, $3E, $8A, $08, $51, $25 ; Hey![  ]I'l
#_1CD212: db $25, $59, $2D, $1E, $25, $25, $59, $E3 ; l⎵tell⎵[you]
#_1CD21A: db $59, $1A, $59, $CC, $1F, $B6, $1A, $95 ; ⎵a⎵[pro]f[it]a[ble]
#_1CD222: db $75 ; line 2
#_1CD223: db $D3, $C8, $32, $59, $22, $1F, $59, $E3 ; [st][or]y⎵if⎵[you]
#_1CD22B: db $59, $29, $1A, $32, $59, $BE, $59, $36 ; ⎵pay⎵[me]⎵2
#_1CD233: db $34, $59, $11, $DC, $1E, $1E, $2C, $41 ; 0⎵R[up]ees.
#_1CD23B: db $7E ; wait for key
#_1CD23C: db $73 ; scroll text
#_1CD23D: db $07, $28, $30, $59, $1A, $98, $2E, $2D ; How⎵a[bo]ut
#_1CD245: db $59, $B6, $3F ; ⎵[it]?
#_1CD248: db $73 ; scroll text
#_1CD249: db $88, $44, $59, $0F, $1A, $32, $59, $11 ; [    ]>⎵Pay⎵R
#_1CD251: db $DC, $1E, $1E, $2C ; [up]ees
#_1CD255: db $73 ; scroll text
#_1CD256: db $88, $89, $03, $C7, $51, $2D, $59, $DF ; [    ][   ]D[on]'t⎵[wa]
#_1CD25E: db $27, $2D, $59, $DA, $59, $21, $A2, $59 ; nt⎵[to]⎵h[ear]⎵
#_1CD266: db $B6 ; [it]
#_1CD267: db $68 ; choose 2 indented
#_1CD268: db $7F ; end of message

;===================================================================================================
; Hah!  Thank you.  They say
; there is a tiny circle of rocks
; in the lake at the source of
; the river.  I don't know what
; will happen, but it might be fun
; to throw something into it…
; Heh heh.  See you…
;---------------------------------------------------------------------------------------------------
Message_00FF:
#_1CD269: db $07, $1A, $21, $3E, $8A, $E5, $27, $24 ; Hah![  ][Tha]nk
#_1CD271: db $59, $E3, $41, $8A, $E6, $32, $59, $2C ; ⎵[you].[  ][The]y⎵s
#_1CD279: db $1A, $32 ; ay
#_1CD27B: db $75 ; line 2
#_1CD27C: db $D8, $CD, $B5, $59, $1A, $59, $2D, $B4 ; [the][re ][is]⎵a⎵t[in]
#_1CD284: db $32, $59, $1C, $22, $2B, $1C, $25, $1E ; y⎵circle
#_1CD28C: db $59, $C6, $59, $2B, $28, $9C, $2C ; ⎵[of]⎵ro[ck]s
#_1CD293: db $76 ; line 3
#_1CD294: db $B4, $59, $D8, $59, $BA, $24, $1E, $59 ; [in]⎵[the]⎵[la]ke⎵
#_1CD29C: db $91, $D8, $59, $D2, $2E, $2B, $1C, $1E ; [at ][the]⎵[so]urce
#_1CD2A4: db $59, $C6 ; ⎵[of]
#_1CD2A6: db $7E ; wait for key
#_1CD2A7: db $73 ; scroll text
#_1CD2A8: db $D8, $59, $2B, $22, $DD, $41, $8A, $08 ; [the]⎵ri[ver].[  ]I
#_1CD2B0: db $59, $9F, $C0, $B8, $59, $E1, $94 ; ⎵[do][n't ][know]⎵[wh][at]
#_1CD2B7: db $73 ; scroll text
#_1CD2B8: db $E2, $25, $25, $59, $B1, $29, $29, $A5 ; [wi]ll⎵[ha]pp[en]
#_1CD2C0: db $42, $59, $1B, $2E, $2D, $59, $B6, $59 ; ,⎵but⎵[it]⎵
#_1CD2C8: db $26, $B2, $97, $59, $1F, $2E, $27 ; m[ight ][be]⎵fun
#_1CD2CF: db $73 ; scroll text
#_1CD2D0: db $DA, $59, $2D, $21, $2B, $28, $30, $59 ; [to]⎵throw⎵
#_1CD2D8: db $CF, $D5, $20, $59, $B4, $DA, $59, $B6 ; [some][thin]g⎵[in][to]⎵[it]
#_1CD2E0: db $43 ; …
#_1CD2E1: db $7E ; wait for key
#_1CD2E2: db $73 ; scroll text
#_1CD2E3: db $07, $1E, $21, $59, $21, $1E, $21, $41 ; Heh⎵heh.
#_1CD2EB: db $8A, $12, $1E, $1E, $59, $E3, $43 ; [  ]See⎵[you]…
#_1CD2F2: db $7F ; end of message

;===================================================================================================
; Heh heh.  I see.  I'm not
; interested in talking to people
; who don't have Rupees…
;---------------------------------------------------------------------------------------------------
Message_0100:
#_1CD2F3: db $07, $1E, $21, $59, $21, $1E, $21, $41 ; Heh⎵heh.
#_1CD2FB: db $8A, $08, $59, $D0, $1E, $41, $8A, $08 ; [  ]I⎵[se]e.[  ]I
#_1CD303: db $51, $26, $59, $C2 ; 'm⎵[not]
#_1CD307: db $75 ; line 2
#_1CD308: db $B4, $D6, $1E, $D3, $A4, $B4, $59, $2D ; [in][ter]e[st][ed ][in]⎵t
#_1CD310: db $1A, $25, $24, $B3, $DA, $59, $29, $1E ; alk[ing ][to]⎵pe
#_1CD318: db $28, $CA ; o[ple]
#_1CD31A: db $76 ; line 3
#_1CD31B: db $E1, $28, $59, $9F, $C0, $AD, $59, $11 ; [wh]o⎵[do][n't ][have]⎵R
#_1CD323: db $DC, $1E, $1E, $2C, $43 ; [up]ees…
#_1CD328: db $7F ; end of message

;===================================================================================================
; Heh heh.  Thank you.  To tell
; you the truth, I used to be a
; thief in the Light World…
; some of my fellow thieves went
; into hiding because they were
; afraid of being caught.
; One of them was a master
; locksmith, but now he is hiding
; the fact that he was a thief…
; …by pretending to be a
; strange middle-aged guy!
; Ha ha ha…
;---------------------------------------------------------------------------------------------------
Message_0101:
#_1CD329: db $07, $1E, $21, $59, $21, $1E, $21, $41 ; Heh⎵heh.
#_1CD331: db $8A, $E5, $27, $24, $59, $E3, $41, $8A ; [  ][Tha]nk⎵[you].[  ]
#_1CD339: db $13, $28, $59, $2D, $1E, $25, $25 ; To⎵tell
#_1CD340: db $75 ; line 2
#_1CD341: db $E3, $59, $D8, $59, $DB, $2E, $2D, $21 ; [you]⎵[the]⎵[tr]uth
#_1CD349: db $42, $59, $08, $59, $2E, $D0, $1D, $59 ; ,⎵I⎵u[se]d⎵
#_1CD351: db $DA, $59, $97, $59, $1A ; [to]⎵[be]⎵a
#_1CD356: db $76 ; line 3
#_1CD357: db $D9, $1E, $1F, $59, $B4, $59, $D8, $59 ; [thi]ef⎵[in]⎵[the]⎵
#_1CD35F: db $0B, $B2, $16, $C8, $25, $1D, $43 ; L[ight ]W[or]ld…
#_1CD366: db $7E ; wait for key
#_1CD367: db $73 ; scroll text
#_1CD368: db $CF, $59, $C6, $59, $26, $32, $59, $1F ; [some]⎵[of]⎵my⎵f
#_1CD370: db $1E, $25, $BB, $30, $59, $D9, $A7, $1E ; el[lo]w⎵[thi][ev]e
#_1CD378: db $2C, $59, $E0, $27, $2D ; s⎵[we]nt
#_1CD37D: db $73 ; scroll text
#_1CD37E: db $B4, $DA, $59, $B0, $9E, $27, $20, $59 ; [in][to]⎵[hi][di]ng⎵
#_1CD386: db $97, $1C, $1A, $2E, $D0, $59, $D8, $32 ; [be]cau[se]⎵[the]y
#_1CD38E: db $59, $E0, $CE ; ⎵[we][re]
#_1CD391: db $73 ; scroll text
#_1CD392: db $1A, $1F, $2B, $1A, $22, $1D, $59, $C6 ; afraid⎵[of]
#_1CD39A: db $59, $97, $B3, $1C, $1A, $2E, $20, $21 ; ⎵[be][ing ]caugh
#_1CD3A2: db $2D, $41 ; t.
#_1CD3A4: db $7E ; wait for key
#_1CD3A5: db $73 ; scroll text
#_1CD3A6: db $0E, $27, $1E, $59, $C6, $59, $D8, $26 ; One⎵[of]⎵[the]m
#_1CD3AE: db $59, $DF, $2C, $59, $1A, $59, $BD, $D3 ; ⎵[wa]s⎵a⎵[ma][st]
#_1CD3B6: db $A6 ; [er]
#_1CD3B7: db $73 ; scroll text
#_1CD3B8: db $BB, $9C, $2C, $26, $B6, $21, $42, $59 ; [lo][ck]sm[it]h,⎵
#_1CD3C0: db $1B, $2E, $2D, $59, $27, $28, $30, $59 ; but⎵now⎵
#_1CD3C8: db $21, $1E, $59, $B5, $59, $B0, $9E, $27 ; he⎵[is]⎵[hi][di]n
#_1CD3D0: db $20 ; g
#_1CD3D1: db $73 ; scroll text
#_1CD3D2: db $D8, $59, $1F, $1A, $1C, $2D, $59, $D7 ; [the]⎵fact⎵[tha]
#_1CD3DA: db $2D, $59, $21, $1E, $59, $DF, $2C, $59 ; t⎵he⎵[wa]s⎵
#_1CD3E2: db $1A, $59, $D9, $1E, $1F, $43 ; a⎵[thi]ef…
#_1CD3E8: db $7E ; wait for key
#_1CD3E9: db $73 ; scroll text
#_1CD3EA: db $43, $1B, $32, $59, $29, $CE, $2D, $A5 ; …by⎵p[re]t[en]
#_1CD3F2: db $9E, $27, $20, $59, $DA, $59, $97, $59 ; [di]ng⎵[to]⎵[be]⎵
#_1CD3FA: db $1A ; a
#_1CD3FB: db $73 ; scroll text
#_1CD3FC: db $D3, $2B, $93, $20, $1E, $59, $26, $22 ; [st]r[an]ge⎵mi
#_1CD404: db $1D, $1D, $25, $1E, $40, $1A, $20, $A4 ; ddle-ag[ed ]
#_1CD40C: db $20, $2E, $32, $3E ; guy!
#_1CD410: db $73 ; scroll text
#_1CD411: db $07, $1A, $59, $B1, $59, $B1, $43 ; Ha⎵[ha]⎵[ha]…
#_1CD418: db $7F ; end of message

;===================================================================================================
; Hah!  Thank you.  To tell you
; the truth, I found incredible
; beauty inside the pyramid,
; but someone sealed the door.
; You can't do anything with a
; standard bomb, they say…
;---------------------------------------------------------------------------------------------------
Message_0102:
#_1CD419: db $07, $1A, $21, $3E, $8A, $E5, $27, $24 ; Hah![  ][Tha]nk
#_1CD421: db $59, $E3, $41, $8A, $13, $28, $59, $2D ; ⎵[you].[  ]To⎵t
#_1CD429: db $1E, $25, $25, $59, $E3 ; ell⎵[you]
#_1CD42E: db $75 ; line 2
#_1CD42F: db $D8, $59, $DB, $2E, $2D, $21, $42, $59 ; [the]⎵[tr]uth,⎵
#_1CD437: db $08, $59, $1F, $C4, $59, $B4, $1C, $CE ; I⎵f[ound]⎵[in]c[re]
#_1CD43F: db $9E, $95 ; [di][ble]
#_1CD441: db $76 ; line 3
#_1CD442: db $97, $1A, $2E, $2D, $32, $59, $B4, $2C ; [be]auty⎵[in]s
#_1CD44A: db $22, $1D, $1E, $59, $D8, $59, $29, $32 ; ide⎵[the]⎵py
#_1CD452: db $2B, $1A, $26, $22, $1D, $42 ; ramid,
#_1CD458: db $7E ; wait for key
#_1CD459: db $73 ; scroll text
#_1CD45A: db $1B, $2E, $2D, $59, $CF, $C7, $1E, $59 ; but⎵[some][on]e⎵
#_1CD462: db $D0, $1A, $25, $A4, $D8, $59, $9F, $C8 ; [se]al[ed ][the]⎵[do][or]
#_1CD46A: db $41 ; .
#_1CD46B: db $73 ; scroll text
#_1CD46C: db $E8, $59, $1C, $93, $51, $2D, $59, $9F ; [You]⎵c[an]'t⎵[do]
#_1CD474: db $59, $93, $32, $D5, $20, $59, $DE, $59 ; ⎵[an]y[thin]g⎵[with]⎵
#_1CD47C: db $1A ; a
#_1CD47D: db $73 ; scroll text
#_1CD47E: db $D3, $90, $1A, $2B, $1D, $59, $98, $26 ; [st][and]ard⎵[bo]m
#_1CD486: db $1B, $42, $59, $D8, $32, $59, $2C, $1A ; b,⎵[the]y⎵sa
#_1CD48E: db $32, $43 ; y…
#_1CD490: db $7F ; end of message

;===================================================================================================
; Heh heh.  Thank you.  As a
; matter of fact, monster magic
; is making it rain in the swamp.
; If you can move the air with
; more force than the monsters,
; the rain may stop.
;---------------------------------------------------------------------------------------------------
Message_0103:
#_1CD491: db $07, $1E, $21, $59, $21, $1E, $21, $41 ; Heh⎵heh.
#_1CD499: db $8A, $E5, $27, $24, $59, $E3, $41, $8A ; [  ][Tha]nk⎵[you].[  ]
#_1CD4A1: db $00, $2C, $59, $1A ; As⎵a
#_1CD4A5: db $75 ; line 2
#_1CD4A6: db $BD, $2D, $D4, $C6, $59, $1F, $1A, $1C ; [ma]t[ter ][of]⎵fac
#_1CD4AE: db $2D, $42, $59, $26, $C7, $D3, $A1, $BD ; t,⎵m[on][st][er ][ma]
#_1CD4B6: db $20, $22, $1C ; gic
#_1CD4B9: db $76 ; line 3
#_1CD4BA: db $B5, $59, $BD, $24, $B3, $B6, $59, $2B ; [is]⎵[ma]k[ing ][it]⎵r
#_1CD4C2: db $8F, $59, $B4, $59, $D8, $59, $2C, $DF ; [ain]⎵[in]⎵[the]⎵s[wa]
#_1CD4CA: db $26, $29, $41 ; mp.
#_1CD4CD: db $7E ; wait for key
#_1CD4CE: db $73 ; scroll text
#_1CD4CF: db $08, $1F, $59, $E3, $59, $99, $26, $28 ; If⎵[you]⎵[can ]mo
#_1CD4D7: db $2F, $1E, $59, $D8, $59, $1A, $22, $2B ; ve⎵[the]⎵air
#_1CD4DF: db $59, $DE ; ⎵[with]
#_1CD4E1: db $73 ; scroll text
#_1CD4E2: db $26, $C8, $1E, $59, $A8, $1C, $1E, $59 ; m[or]e⎵[for]ce⎵
#_1CD4EA: db $D7, $27, $59, $D8, $59, $26, $C7, $D3 ; [tha]n⎵[the]⎵m[on][st]
#_1CD4F2: db $A6, $2C, $42 ; [er]s,
#_1CD4F5: db $73 ; scroll text
#_1CD4F6: db $D8, $59, $2B, $8F, $59, $BD, $32, $59 ; [the]⎵r[ain]⎵[ma]y⎵
#_1CD4FE: db $D3, $28, $29, $41 ; [st]op.
#_1CD502: db $7F ; end of message

;===================================================================================================
; Sniffle… Hey brother [LINK]!
; Do you have a bottle to keep
; a bug in?
; …
; I see.  You don't have one…
; Cough cough…
;---------------------------------------------------------------------------------------------------
Message_0104:
#_1CD503: db $12, $27, $22, $1F, $1F, $25, $1E, $43 ; Sniffle…
#_1CD50B: db $59, $07, $1E, $32, $59, $1B, $2B, $28 ; ⎵Hey⎵bro
#_1CD513: db $D8, $2B, $59, $6A, $3E ; [the]r⎵[LINK]!
#_1CD518: db $75 ; line 2
#_1CD519: db $03, $28, $59, $E3, $59, $AD, $59, $1A ; Do⎵[you]⎵[have]⎵a
#_1CD521: db $59, $98, $2D, $2D, $25, $1E, $59, $DA ; ⎵[bo]ttle⎵[to]
#_1CD529: db $59, $24, $1E, $1E, $29 ; ⎵keep
#_1CD52E: db $76 ; line 3
#_1CD52F: db $1A, $59, $1B, $2E, $20, $59, $B4, $3F ; a⎵bug⎵[in]?
#_1CD537: db $7E ; wait for key
#_1CD538: db $73 ; scroll text
#_1CD539: db $43 ; …
#_1CD53A: db $73 ; scroll text
#_1CD53B: db $08, $59, $D0, $1E, $41, $8A, $E8, $59 ; I⎵[se]e.[  ][You]⎵
#_1CD543: db $9F, $C0, $AD, $59, $C7, $1E, $43 ; [do][n't ][have]⎵[on]e…
#_1CD54A: db $73 ; scroll text
#_1CD54B: db $02, $28, $2E, $20, $21, $59, $1C, $28 ; Cough⎵co
#_1CD553: db $2E, $20, $21, $43 ; ugh…
#_1CD557: db $7F ; end of message

;===================================================================================================
; I can't go out 'cause I'm sick…
; Cough cough…
; People say I caught this cold
; from the evil air that is coming
; down off the mountain…
; Sniff sniff…
; This is my bug-catching net.
; I'll use it when I'm better, but
; for now, I'll lend it to you.
;---------------------------------------------------------------------------------------------------
Message_0105:
#_1CD558: db $08, $59, $1C, $93, $51, $2D, $59, $AC ; I⎵c[an]'t⎵[go]
#_1CD560: db $59, $C5, $51, $1C, $1A, $2E, $D0, $59 ; ⎵[out ]'cau[se]⎵
#_1CD568: db $08, $51, $26, $59, $2C, $22, $9C, $43 ; I'm⎵si[ck]…
#_1CD570: db $75 ; line 2
#_1CD571: db $02, $28, $2E, $20, $21, $59, $1C, $28 ; Cough⎵co
#_1CD579: db $2E, $20, $21, $43 ; ugh…
#_1CD57D: db $76 ; line 3
#_1CD57E: db $0F, $1E, $28, $CA, $59, $2C, $1A, $32 ; Peo[ple]⎵say
#_1CD586: db $59, $08, $59, $1C, $1A, $2E, $20, $21 ; ⎵I⎵caugh
#_1CD58E: db $2D, $59, $D9, $2C, $59, $1C, $28, $25 ; t⎵[thi]s⎵col
#_1CD596: db $1D ; d
#_1CD597: db $7E ; wait for key
#_1CD598: db $73 ; scroll text
#_1CD599: db $A9, $26, $59, $D8, $59, $A7, $22, $25 ; [fro]m⎵[the]⎵[ev]il
#_1CD5A1: db $59, $1A, $22, $2B, $59, $D7, $2D, $59 ; ⎵air⎵[tha]t⎵
#_1CD5A9: db $B5, $59, $9B, $B4, $20 ; [is]⎵[com][in]g
#_1CD5AE: db $73 ; scroll text
#_1CD5AF: db $9F, $30, $27, $59, $C6, $1F, $59, $D8 ; [do]wn⎵[of]f⎵[the]
#_1CD5B7: db $59, $26, $28, $2E, $27, $2D, $8F, $43 ; ⎵mount[ain]…
#_1CD5BF: db $73 ; scroll text
#_1CD5C0: db $12, $27, $22, $1F, $1F, $59, $2C, $27 ; Sniff⎵sn
#_1CD5C8: db $22, $1F, $1F, $43 ; iff…
#_1CD5CC: db $7E ; wait for key
#_1CD5CD: db $73 ; scroll text
#_1CD5CE: db $E7, $2C, $59, $B5, $59, $26, $32, $59 ; [Thi]s⎵[is]⎵my⎵
#_1CD5D6: db $1B, $2E, $20, $40, $1C, $94, $1C, $B0 ; bug-c[at]c[hi]
#_1CD5DE: db $27, $20, $59, $27, $1E, $2D, $41 ; ng⎵net.
#_1CD5E5: db $73 ; scroll text
#_1CD5E6: db $08, $51, $25, $25, $59, $2E, $D0, $59 ; I'll⎵u[se]⎵
#_1CD5EE: db $B6, $59, $E1, $A0, $08, $51, $26, $59 ; [it]⎵[wh][en ]I'm⎵
#_1CD5F6: db $97, $2D, $D6, $42, $59, $1B, $2E, $2D ; [be]t[ter],⎵but
#_1CD5FE: db $73 ; scroll text
#_1CD5FF: db $A8, $59, $27, $28, $30, $42, $59, $08 ; [for]⎵now,⎵I
#_1CD607: db $51, $25, $25, $59, $25, $A5, $1D, $59 ; 'll⎵l[en]d⎵
#_1CD60F: db $B6, $59, $DA, $59, $E3, $41 ; [it]⎵[to]⎵[you].
#_1CD615: db $7F ; end of message

;===================================================================================================
; Sniffle… I hope I get well
; soon…
; Cough cough…
;---------------------------------------------------------------------------------------------------
Message_0106:
#_1CD616: db $12, $27, $22, $1F, $1F, $25, $1E, $43 ; Sniffle…
#_1CD61E: db $59, $08, $59, $21, $28, $29, $1E, $59 ; ⎵I⎵hope⎵
#_1CD626: db $08, $59, $AB, $59, $E0, $25, $25 ; I⎵[get]⎵[we]ll
#_1CD62D: db $75 ; line 2
#_1CD62E: db $D2, $C7, $43 ; [so][on]…
#_1CD631: db $76 ; line 3
#_1CD632: db $02, $28, $2E, $20, $21, $59, $1C, $28 ; Cough⎵co
#_1CD63A: db $2E, $20, $21, $43 ; ugh…
#_1CD63E: db $7F ; end of message

;===================================================================================================
; …  …  …  …  …  …
; …  …  …
;---------------------------------------------------------------------------------------------------
Message_0107:
#_1CD63F: db $43, $8A, $43, $8A, $43, $8A, $43, $8A ; …[  ]…[  ]…[  ]…[  ]
#_1CD647: db $43, $8A, $43 ; …[  ]…
#_1CD64A: db $75 ; line 2
#_1CD64B: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CD650: db $7F ; end of message

;===================================================================================================
; Why did you take my sign?  It
; says plain as day to just leave
; me alone!  Sheeesh!
;---------------------------------------------------------------------------------------------------
Message_0108:
#_1CD651: db $16, $21, $32, $59, $9E, $1D, $59, $E3 ; Why⎵[di]d⎵[you]
#_1CD659: db $59, $2D, $1A, $24, $1E, $59, $26, $32 ; ⎵take⎵my
#_1CD661: db $59, $2C, $22, $20, $27, $3F, $8A, $08 ; ⎵sign?[  ]I
#_1CD669: db $2D ; t
#_1CD66A: db $75 ; line 2
#_1CD66B: db $2C, $1A, $32, $2C, $59, $29, $BA, $B4 ; says⎵p[la][in]
#_1CD673: db $59, $1A, $2C, $59, $1D, $1A, $32, $59 ; ⎵as⎵day⎵
#_1CD67B: db $DA, $59, $B7, $59, $25, $1E, $1A, $2F ; [to]⎵[just]⎵leav
#_1CD683: db $1E ; e
#_1CD684: db $76 ; line 3
#_1CD685: db $BE, $59, $1A, $BB, $27, $1E, $3E, $8A ; [me]⎵a[lo]ne![  ]
#_1CD68D: db $12, $21, $1E, $1E, $1E, $D1, $3E ; Sheee[sh]!
#_1CD694: db $7F ; end of message

;===================================================================================================
; I heard that you know I used to
; be a thief, right?
; 
; Well, I'll open a chest for you.
; Will you keep it secret from
; everyone else?
; Would you please promise ?
;     > Promise not to tell
;        Tell it to everyone
;---------------------------------------------------------------------------------------------------
Message_0109:
#_1CD695: db $08, $59, $21, $A2, $1D, $59, $D7, $2D ; I⎵h[ear]d⎵[tha]t
#_1CD69D: db $59, $E3, $59, $B8, $59, $08, $59, $2E ; ⎵[you]⎵[know]⎵I⎵u
#_1CD6A5: db $D0, $1D, $59, $DA ; [se]d⎵[to]
#_1CD6A9: db $75 ; line 2
#_1CD6AA: db $97, $59, $1A, $59, $D9, $1E, $1F, $42 ; [be]⎵a⎵[thi]ef,
#_1CD6B2: db $59, $2B, $22, $20, $21, $2D, $3F ; ⎵right?
#_1CD6B9: db $76 ; line 3
#_1CD6BA: db $7E ; wait for key
#_1CD6BB: db $73 ; scroll text
#_1CD6BC: db $16, $1E, $25, $25, $42, $59, $08, $51 ; Well,⎵I'
#_1CD6C4: db $25, $25, $59, $C3, $59, $1A, $59, $9A ; ll⎵[open]⎵a⎵[che]
#_1CD6CC: db $D3, $59, $A8, $59, $E3, $41 ; [st]⎵[for]⎵[you].
#_1CD6D2: db $73 ; scroll text
#_1CD6D3: db $16, $22, $25, $25, $59, $E3, $59, $24 ; Will⎵[you]⎵k
#_1CD6DB: db $1E, $1E, $29, $59, $B6, $59, $D0, $1C ; eep⎵[it]⎵[se]c
#_1CD6E3: db $CE, $2D, $59, $A9, $26 ; [re]t⎵[fro]m
#_1CD6E8: db $73 ; scroll text
#_1CD6E9: db $A7, $A6, $32, $C7, $1E, $59, $1E, $25 ; [ev][er]y[on]e⎵el
#_1CD6F1: db $D0, $3F ; [se]?
#_1CD6F3: db $7E ; wait for key
#_1CD6F4: db $73 ; scroll text
#_1CD6F5: db $16, $28, $2E, $25, $1D, $59, $E3, $59 ; Would⎵[you]⎵
#_1CD6FD: db $CA, $1A, $D0, $59, $CC, $26, $B5, $1E ; [ple]a[se]⎵[pro]m[is]e
#_1CD705: db $59, $3F ; ⎵?
#_1CD707: db $73 ; scroll text
#_1CD708: db $88, $44, $59, $0F, $2B, $28, $26, $B5 ; [    ]>⎵Prom[is]
#_1CD710: db $1E, $59, $C2, $59, $DA, $59, $2D, $1E ; e⎵[not]⎵[to]⎵te
#_1CD718: db $25, $25 ; ll
#_1CD71A: db $73 ; scroll text
#_1CD71B: db $88, $89, $13, $1E, $25, $25, $59, $B6 ; [    ][   ]Tell⎵[it]
#_1CD723: db $59, $DA, $59, $A7, $A6, $32, $C7, $1E ; ⎵[to]⎵[ev][er]y[on]e
#_1CD72B: db $68 ; choose 2 indented
#_1CD72C: db $7F ; end of message

;===================================================================================================
; OK, if that's the way you want
; it, I hope you drag that chest
; around forever!
;---------------------------------------------------------------------------------------------------
Message_010A:
#_1CD72D: db $0E, $0A, $42, $59, $22, $1F, $59, $D7 ; OK,⎵if⎵[tha]
#_1CD735: db $2D, $8B, $D8, $59, $DF, $32, $59, $E3 ; t['s ][the]⎵[wa]y⎵[you]
#_1CD73D: db $59, $DF, $27, $2D ; ⎵[wa]nt
#_1CD741: db $75 ; line 2
#_1CD742: db $B6, $42, $59, $08, $59, $21, $28, $29 ; [it],⎵I⎵hop
#_1CD74A: db $1E, $59, $E3, $59, $1D, $2B, $1A, $20 ; e⎵[you]⎵drag
#_1CD752: db $59, $D7, $2D, $59, $9A, $D3 ; ⎵[tha]t⎵[che][st]
#_1CD758: db $76 ; line 3
#_1CD759: db $1A, $2B, $C4, $59, $A8, $A7, $A6, $3E ; ar[ound]⎵[for][ev][er]!
#_1CD761: db $7F ; end of message

;===================================================================================================
; Remember, you promised…
; Don't tell anyone.
;---------------------------------------------------------------------------------------------------
Message_010B:
#_1CD762: db $11, $1E, $BE, $26, $97, $2B, $42, $59 ; Re[me]m[be]r,⎵
#_1CD76A: db $E3, $59, $CC, $26, $B5, $1E, $1D, $43 ; [you]⎵[pro]m[is]ed…
#_1CD772: db $75 ; line 2
#_1CD773: db $03, $C7, $51, $2D, $59, $2D, $1E, $25 ; D[on]'t⎵tel
#_1CD77B: db $25, $59, $93, $32, $C7, $1E, $41 ; l⎵[an]y[on]e.
#_1CD782: db $7F ; end of message

;===================================================================================================
; All right, bring that chest over
; here…  Seriously, keep this a
; secret from everyone.
;---------------------------------------------------------------------------------------------------
Message_010C:
#_1CD783: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_1CD78B: db $2D, $42, $59, $1B, $2B, $B3, $D7, $2D ; t,⎵br[ing ][tha]t
#_1CD793: db $59, $9A, $D3, $59, $28, $DD ; ⎵[che][st]⎵o[ver]
#_1CD799: db $75 ; line 2
#_1CD79A: db $AF, $1E, $43, $8A, $12, $A6, $22, $28 ; [her]e…[  ]S[er]io
#_1CD7A2: db $2E, $2C, $25, $32, $42, $59, $24, $1E ; usly,⎵ke
#_1CD7AA: db $1E, $29, $59, $D9, $2C, $59, $1A ; ep⎵[thi]s⎵a
#_1CD7B1: db $76 ; line 3
#_1CD7B2: db $D0, $1C, $CE, $2D, $59, $A9, $26, $59 ; [se]c[re]t⎵[fro]m⎵
#_1CD7BA: db $A7, $A6, $32, $C7, $1E, $41 ; [ev][er]y[on]e.
#_1CD7C0: db $7F ; end of message

;===================================================================================================
; 𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗𓈗𓈗Ƨ
; 𓈗☥ƧƧ☥𓈗☥Ƨ𓈗☥Ƨ𓈗☥Ƨ𓈗☥
; 𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗☥𓈗☥
;---------------------------------------------------------------------------------------------------
Message_010D:
#_1CD7C1: db $48, $49, $48, $49, $48, $49, $48, $49 ; 𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗Ƨ
#_1CD7C9: db $48, $49, $48, $48, $48, $49 ; 𓈗Ƨ𓈗𓈗𓈗Ƨ
#_1CD7CF: db $75 ; line 2
#_1CD7D0: db $48, $47, $49, $49, $47, $48, $47, $49 ; 𓈗☥ƧƧ☥𓈗☥Ƨ
#_1CD7D8: db $48, $47, $49, $48, $47, $49, $48, $47 ; 𓈗☥Ƨ𓈗☥Ƨ𓈗☥
#_1CD7E0: db $76 ; line 3
#_1CD7E1: db $48, $49, $48, $49, $48, $49, $48, $47 ; 𓈗Ƨ𓈗Ƨ𓈗Ƨ𓈗☥
#_1CD7E9: db $48, $47 ; 𓈗☥
#_1CD7EB: db $7F ; end of message

;===================================================================================================
; Hold up the Master Sword and
; you will get the magic of
; Ether.
;---------------------------------------------------------------------------------------------------
Message_010E:
#_1CD7EC: db $07, $28, $25, $1D, $59, $DC, $59, $D8 ; Hold⎵[up]⎵[the]
#_1CD7F4: db $59, $0C, $92, $A1, $12, $30, $C8, $1D ; ⎵M[ast][er ]Sw[or]d
#_1CD7FC: db $59, $90 ; ⎵[and]
#_1CD7FE: db $75 ; line 2
#_1CD7FF: db $E3, $59, $E2, $25, $25, $59, $AB, $59 ; [you]⎵[wi]ll⎵[get]⎵
#_1CD807: db $D8, $59, $BD, $20, $22, $1C, $59, $C6 ; [the]⎵[ma]gic⎵[of]
#_1CD80F: db $76 ; line 3
#_1CD810: db $04, $D8, $2B, $41 ; E[the]r.
#_1CD814: db $7F ; end of message

;===================================================================================================
; Hold up the Master Sword and
; you will get the magic of
; Bombos.
;---------------------------------------------------------------------------------------------------
Message_010F:
#_1CD815: db $07, $28, $25, $1D, $59, $DC, $59, $D8 ; Hold⎵[up]⎵[the]
#_1CD81D: db $59, $0C, $92, $A1, $12, $30, $C8, $1D ; ⎵M[ast][er ]Sw[or]d
#_1CD825: db $59, $90 ; ⎵[and]
#_1CD827: db $75 ; line 2
#_1CD828: db $E3, $59, $E2, $25, $25, $59, $AB, $59 ; [you]⎵[wi]ll⎵[get]⎵
#_1CD830: db $D8, $59, $BD, $20, $22, $1C, $59, $C6 ; [the]⎵[ma]gic⎵[of]
#_1CD838: db $76 ; line 3
#_1CD839: db $01, $28, $26, $98, $2C, $41 ; Bom[bo]s.
#_1CD83F: db $7F ; end of message

;===================================================================================================
; Hey!  Blast you for waking me
; from my deep, dark sleep!
; …I mean, thanks a lot, sir!
; But now I will get my revenge
; on you.  Get ready for it!
; …Err, is that OK with you,
; sir?
;---------------------------------------------------------------------------------------------------
Message_0110:
#_1CD840: db $07, $1E, $32, $3E, $8A, $01, $BA, $D3 ; Hey![  ]B[la][st]
#_1CD848: db $59, $E3, $59, $A8, $59, $DF, $24, $B3 ; ⎵[you]⎵[for]⎵[wa]k[ing ]
#_1CD850: db $BE ; [me]
#_1CD851: db $75 ; line 2
#_1CD852: db $A9, $26, $59, $26, $32, $59, $1D, $1E ; [fro]m⎵my⎵de
#_1CD85A: db $1E, $29, $42, $59, $1D, $1A, $2B, $24 ; ep,⎵dark
#_1CD862: db $59, $2C, $25, $1E, $1E, $29, $3E ; ⎵sleep!
#_1CD869: db $76 ; line 3
#_1CD86A: db $43, $08, $59, $BE, $93, $42, $59, $D7 ; …I⎵[me][an],⎵[tha]
#_1CD872: db $27, $24, $2C, $59, $1A, $59, $BB, $2D ; nks⎵a⎵[lo]t
#_1CD87A: db $42, $59, $2C, $22, $2B, $3E ; ,⎵sir!
#_1CD880: db $7E ; wait for key
#_1CD881: db $73 ; scroll text
#_1CD882: db $01, $2E, $2D, $59, $27, $28, $30, $59 ; But⎵now⎵
#_1CD88A: db $08, $59, $E2, $25, $25, $59, $AB, $59 ; I⎵[wi]ll⎵[get]⎵
#_1CD892: db $26, $32, $59, $CE, $2F, $A5, $20, $1E ; my⎵[re]v[en]ge
#_1CD89A: db $73 ; scroll text
#_1CD89B: db $C7, $59, $E3, $41, $8A, $06, $1E, $2D ; [on]⎵[you].[  ]Get
#_1CD8A3: db $59, $CE, $1A, $1D, $32, $59, $A8, $59 ; ⎵[re]ady⎵[for]⎵
#_1CD8AB: db $B6, $3E ; [it]!
#_1CD8AD: db $73 ; scroll text
#_1CD8AE: db $43, $04, $2B, $2B, $42, $59, $B5, $59 ; …Err,⎵[is]⎵
#_1CD8B6: db $D7, $2D, $59, $0E, $0A, $59, $DE, $59 ; [tha]t⎵OK⎵[with]⎵
#_1CD8BE: db $E3, $42 ; [you],
#_1CD8C0: db $7E ; wait for key
#_1CD8C1: db $73 ; scroll text
#_1CD8C2: db $2C, $22, $2B, $3F ; sir?
#_1CD8C6: db $7F ; end of message

;===================================================================================================
; Heh heh heh!  I laugh at your
; misfortune!  Now your magic
; power will drop by one half!
; Congratulations!
; Now, do your best, even though
; I'm sure it won't be enough!
; Have a nice day!  See you!
;---------------------------------------------------------------------------------------------------
Message_0111:
#_1CD8C7: db $07, $1E, $21, $59, $21, $1E, $21, $59 ; Heh⎵heh⎵
#_1CD8CF: db $21, $1E, $21, $3E, $8A, $08, $59, $BA ; heh![  ]I⎵[la]
#_1CD8D7: db $2E, $20, $21, $59, $91, $E3, $2B ; ugh⎵[at ][you]r
#_1CD8DE: db $75 ; line 2
#_1CD8DF: db $26, $B5, $A8, $2D, $2E, $27, $1E, $3E ; m[is][for]tune!
#_1CD8E7: db $8A, $0D, $28, $30, $59, $E3, $2B, $59 ; [  ]Now⎵[you]r⎵
#_1CD8EF: db $BD, $20, $22, $1C ; [ma]gic
#_1CD8F3: db $76 ; line 3
#_1CD8F4: db $CB, $A1, $E2, $25, $25, $59, $1D, $2B ; [pow][er ][wi]ll⎵dr
#_1CD8FC: db $28, $29, $59, $1B, $32, $59, $C7, $1E ; op⎵by⎵[on]e
#_1CD904: db $59, $B1, $25, $1F, $3E ; ⎵[ha]lf!
#_1CD909: db $7E ; wait for key
#_1CD90A: db $73 ; scroll text
#_1CD90B: db $02, $C7, $20, $2B, $94, $2E, $BA, $2D ; C[on]gr[at]u[la]t
#_1CD913: db $22, $C7, $2C, $3E ; i[on]s!
#_1CD917: db $73 ; scroll text
#_1CD918: db $0D, $28, $30, $42, $59, $9F, $59, $E3 ; Now,⎵[do]⎵[you]
#_1CD920: db $2B, $59, $97, $D3, $42, $59, $A7, $A0 ; r⎵[be][st],⎵[ev][en ]
#_1CD928: db $2D, $21, $28, $2E, $20, $21 ; though
#_1CD92E: db $73 ; scroll text
#_1CD92F: db $08, $51, $26, $59, $2C, $2E, $CD, $B6 ; I'm⎵su[re ][it]
#_1CD937: db $59, $30, $C7, $51, $2D, $59, $97, $59 ; ⎵w[on]'t⎵[be]⎵
#_1CD93F: db $A5, $28, $2E, $20, $21, $3E ; [en]ough!
#_1CD945: db $7E ; wait for key
#_1CD946: db $73 ; scroll text
#_1CD947: db $07, $1A, $2F, $1E, $59, $1A, $59, $27 ; Have⎵a⎵n
#_1CD94F: db $22, $1C, $1E, $59, $1D, $1A, $32, $3E ; ice⎵day!
#_1CD957: db $8A, $12, $1E, $1E, $59, $E3, $3E ; [  ]See⎵[you]!
#_1CD95E: db $7F ; end of message

;===================================================================================================
; Long ago, in the beautiful
; kingdom of Hyrule surrounded
; by mountains and forests…
; legends told of an omnipotent
; and omniscient Golden Power
; that resided in a hidden land.
; Many people aggressively
; sought to enter the hidden
; Golden Land…
; But no one ever returned.
; One day evil power began to
; flow from the Golden Land…
; So the King commanded seven
; wise men to seal the gate to
; the Land of the Golden Power.
; That seal should have remained
; for all time…
; 
; …  …But, when these events
; were obscured by the mists of
; time and became legend…
;---------------------------------------------------------------------------------------------------
Message_0112:
#_1CD95F: db $6E, $00 ; set scroll speed
#_1CD961: db $77, $07 ; set text color
#_1CD963: db $7A, $03 ; set draw speed
#_1CD965: db $6B, $02 ; set window border
#_1CD967: db $67 ; next image
#_1CD968: db $0B, $C7, $20, $59, $1A, $AC, $42, $59 ; L[on]g⎵a[go],⎵
#_1CD970: db $B4, $59, $D8, $59, $97, $1A, $2E, $2D ; [in]⎵[the]⎵[be]aut
#_1CD978: db $22, $1F, $2E, $25 ; iful
#_1CD97C: db $75 ; line 2
#_1CD97D: db $24, $B4, $20, $9F, $26, $59, $C6, $59 ; k[in]g[do]m⎵[of]⎵
#_1CD985: db $07, $32, $2B, $2E, $25, $1E, $59, $2C ; Hyrule⎵s
#_1CD98D: db $2E, $2B, $2B, $C4, $1E, $1D ; urr[ound]ed
#_1CD993: db $76 ; line 3
#_1CD994: db $1B, $32, $59, $26, $28, $2E, $27, $2D ; by⎵mount
#_1CD99C: db $8F, $2C, $59, $8C, $A8, $1E, $D3, $2C ; [ain]s⎵[and ][for]e[st]s
#_1CD9A4: db $43 ; …
#_1CD9A5: db $78, $09 ; delay
#_1CD9A7: db $73 ; scroll text
#_1CD9A8: db $25, $1E, $20, $A5, $1D, $2C, $59, $DA ; leg[en]ds⎵[to]
#_1CD9B0: db $25, $1D, $59, $C6, $59, $93, $59, $28 ; ld⎵[of]⎵[an]⎵o
#_1CD9B8: db $26, $27, $22, $29, $28, $2D, $A3 ; mnipot[ent]
#_1CD9BF: db $73 ; scroll text
#_1CD9C0: db $8C, $28, $26, $27, $B5, $1C, $22, $A3 ; [and ]omn[is]ci[ent]
#_1CD9C8: db $59, $06, $28, $25, $1D, $A0, $0F, $28 ; ⎵Gold[en ]Po
#_1CD9D0: db $E0, $2B ; [we]r
#_1CD9D2: db $73 ; scroll text
#_1CD9D3: db $D7, $2D, $59, $CE, $2C, $22, $1D, $A4 ; [tha]t⎵[re]sid[ed ]
#_1CD9DB: db $B4, $59, $1A, $59, $B0, $1D, $1D, $A0 ; [in]⎵a⎵[hi]dd[en ]
#_1CD9E3: db $BA, $27, $1D, $41 ; [la]nd.
#_1CD9E7: db $78, $09 ; delay
#_1CD9E9: db $67 ; next image
#_1CD9EA: db $67 ; next image
#_1CD9EB: db $73 ; scroll text
#_1CD9EC: db $0C, $93, $32, $59, $29, $1E, $28, $CA ; M[an]y⎵peo[ple]
#_1CD9F4: db $59, $1A, $20, $20, $CE, $2C, $2C, $22 ; ⎵agg[re]ssi
#_1CD9FC: db $2F, $1E, $25, $32 ; vely
#_1CDA00: db $73 ; scroll text
#_1CDA01: db $D2, $2E, $20, $21, $2D, $59, $DA, $59 ; [so]ught⎵[to]⎵
#_1CDA09: db $A3, $A1, $D8, $59, $B0, $1D, $1D, $A5 ; [ent][er ][the]⎵[hi]dd[en]
#_1CDA11: db $73 ; scroll text
#_1CDA12: db $06, $28, $25, $1D, $A0, $0B, $90, $43 ; Gold[en ]L[and]…
#_1CDA1A: db $78, $07 ; delay
#_1CDA1C: db $73 ; scroll text
#_1CDA1D: db $01, $2E, $2D, $59, $27, $28, $59, $C7 ; But⎵no⎵[on]
#_1CDA25: db $1E, $59, $A7, $A1, $CE, $2D, $2E, $2B ; e⎵[ev][er ][re]tur
#_1CDA2D: db $27, $1E, $1D, $41 ; ned.
#_1CDA31: db $73 ; scroll text
#_1CDA32: db $0E, $27, $1E, $59, $1D, $1A, $32, $59 ; One⎵day⎵
#_1CDA3A: db $A7, $22, $25, $59, $CB, $A1, $97, $20 ; [ev]il⎵[pow][er ][be]g
#_1CDA42: db $93, $59, $DA ; [an]⎵[to]
#_1CDA45: db $73 ; scroll text
#_1CDA46: db $1F, $BB, $30, $59, $A9, $26, $59, $D8 ; f[lo]w⎵[fro]m⎵[the]
#_1CDA4E: db $59, $06, $28, $25, $1D, $A0, $0B, $90 ; ⎵Gold[en ]L[and]
#_1CDA56: db $43 ; …
#_1CDA57: db $78, $07 ; delay
#_1CDA59: db $73 ; scroll text
#_1CDA5A: db $12, $28, $59, $D8, $59, $0A, $B3, $9B ; So⎵[the]⎵K[ing ][com]
#_1CDA62: db $BC, $1D, $A4, $D0, $2F, $A5 ; [man]d[ed ][se]v[en]
#_1CDA68: db $73 ; scroll text
#_1CDA69: db $E2, $D0, $59, $BE, $27, $59, $DA, $59 ; [wi][se]⎵[me]n⎵[to]⎵
#_1CDA71: db $D0, $1A, $25, $59, $D8, $59, $20, $94 ; [se]al⎵[the]⎵g[at]
#_1CDA79: db $1E, $59, $DA ; e⎵[to]
#_1CDA7C: db $73 ; scroll text
#_1CDA7D: db $D8, $59, $0B, $8C, $C6, $59, $D8, $59 ; [the]⎵L[and ][of]⎵[the]⎵
#_1CDA85: db $06, $28, $25, $1D, $A0, $0F, $28, $E0 ; Gold[en ]Po[we]
#_1CDA8D: db $2B, $41 ; r.
#_1CDA8F: db $78, $09 ; delay
#_1CDA91: db $67 ; next image
#_1CDA92: db $67 ; next image
#_1CDA93: db $73 ; scroll text
#_1CDA94: db $E5, $2D, $59, $D0, $1A, $25, $59, $D1 ; [Tha]t⎵[se]al⎵[sh]
#_1CDA9C: db $28, $2E, $25, $1D, $59, $AD, $59, $CE ; ould⎵[have]⎵[re]
#_1CDAA4: db $BD, $B4, $1E, $1D ; [ma][in]ed
#_1CDAA8: db $73 ; scroll text
#_1CDAA9: db $A8, $59, $8E, $2D, $22, $BE, $43 ; [for]⎵[all ]ti[me]…
#_1CDAB0: db $73 ; scroll text
#_1CDAB1: db $78, $09 ; delay
#_1CDAB3: db $67 ; next image
#_1CDAB4: db $67 ; next image
#_1CDAB5: db $73 ; scroll text
#_1CDAB6: db $43, $8A, $43, $01, $2E, $2D, $42, $59 ; …[  ]…But,⎵
#_1CDABE: db $E1, $A0, $D8, $D0, $59, $A7, $A3, $2C ; [wh][en ][the][se]⎵[ev][ent]s
#_1CDAC6: db $73 ; scroll text
#_1CDAC7: db $E0, $CD, $28, $1B, $2C, $1C, $2E, $CE ; [we][re ]obscu[re]
#_1CDACF: db $1D, $59, $1B, $32, $59, $D8, $59, $26 ; d⎵by⎵[the]⎵m
#_1CDAD7: db $B5, $2D, $2C, $59, $C6 ; [is]ts⎵[of]
#_1CDADC: db $73 ; scroll text
#_1CDADD: db $2D, $22, $BE, $59, $8C, $97, $1C, $1A ; ti[me]⎵[and ][be]ca
#_1CDAE5: db $BE, $59, $25, $1E, $20, $A5, $1D, $43 ; [me]⎵leg[en]d…
#_1CDAED: db $7F ; end of message

;===================================================================================================
; A mysterious wizard known as
; Agahnim came to Hyrule to
; release the seal.  He eliminated
; the good King of Hyrule…
;---------------------------------------------------------------------------------------------------
Message_0113:
#_1CDAEE: db $6B, $02 ; set window border
#_1CDAF0: db $77, $07 ; set text color
#_1CDAF2: db $7A, $03 ; set draw speed
#_1CDAF4: db $74 ; line 1
#_1CDAF5: db $00, $59, $26, $32, $D3, $A6, $22, $28 ; A⎵my[st][er]io
#_1CDAFD: db $2E, $2C, $59, $E2, $33, $1A, $2B, $1D ; us⎵[wi]zard
#_1CDB05: db $59, $B8, $27, $59, $1A, $2C ; ⎵[know]n⎵as
#_1CDB0B: db $75 ; line 2
#_1CDB0C: db $00, $20, $1A, $21, $27, $22, $26, $59 ; Agahnim⎵
#_1CDB14: db $1C, $1A, $BE, $59, $DA, $59, $07, $32 ; ca[me]⎵[to]⎵Hy
#_1CDB1C: db $2B, $2E, $25, $1E, $59, $DA ; rule⎵[to]
#_1CDB22: db $76 ; line 3
#_1CDB23: db $CE, $25, $1E, $1A, $D0, $59, $D8, $59 ; [re]lea[se]⎵[the]⎵
#_1CDB2B: db $D0, $1A, $25, $41, $8A, $07, $1E, $59 ; [se]al.[  ]He⎵
#_1CDB33: db $1E, $25, $22, $26, $B4, $94, $1E, $1D ; elim[in][at]ed
#_1CDB3B: db $78, $05 ; delay
#_1CDB3D: db $73 ; scroll text
#_1CDB3E: db $D8, $59, $AC, $28, $1D, $59, $0A, $B3 ; [the]⎵[go]od⎵K[ing ]
#_1CDB46: db $C6, $59, $07, $32, $2B, $2E, $25, $1E ; [of]⎵Hyrule
#_1CDB4E: db $43 ; …
#_1CDB4F: db $78, $05 ; delay
#_1CDB51: db $7F ; end of message

;===================================================================================================
; Through evil magic, he began
; to make descendants of the
; seven wise men vanish, one
; after another.
;---------------------------------------------------------------------------------------------------
Message_0114:
#_1CDB52: db $6B, $02 ; set window border
#_1CDB54: db $77, $07 ; set text color
#_1CDB56: db $7A, $03 ; set draw speed
#_1CDB58: db $74 ; line 1
#_1CDB59: db $13, $21, $2B, $28, $2E, $20, $21, $59 ; Through⎵
#_1CDB61: db $A7, $22, $25, $59, $BD, $20, $22, $1C ; [ev]il⎵[ma]gic
#_1CDB69: db $42, $59, $21, $1E, $59, $97, $20, $93 ; ,⎵he⎵[be]g[an]
#_1CDB71: db $75 ; line 2
#_1CDB72: db $DA, $59, $BD, $24, $1E, $59, $9D, $1C ; [to]⎵[ma]ke⎵[des]c
#_1CDB7A: db $A5, $1D, $93, $2D, $2C, $59, $C6, $59 ; [en]d[an]ts⎵[of]⎵
#_1CDB82: db $D8 ; [the]
#_1CDB83: db $76 ; line 3
#_1CDB84: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1CDB8C: db $59, $2F, $93, $B5, $21, $42, $59, $C7 ; ⎵v[an][is]h,⎵[on]
#_1CDB94: db $1E ; e
#_1CDB95: db $78, $05 ; delay
#_1CDB97: db $73 ; scroll text
#_1CDB98: db $1A, $1F, $D4, $93, $28, $D8, $2B, $41 ; af[ter ][an]o[the]r.
#_1CDBA0: db $78, $05 ; delay
#_1CDBA2: db $7F ; end of message

;===================================================================================================
; And the time of destiny for
; Princess Zelda is drawing
; near.
;---------------------------------------------------------------------------------------------------
Message_0115:
#_1CDBA3: db $6B, $02 ; set window border
#_1CDBA5: db $77, $07 ; set text color
#_1CDBA7: db $7A, $03 ; set draw speed
#_1CDBA9: db $74 ; line 1
#_1CDBAA: db $00, $27, $1D, $59, $D8, $59, $2D, $22 ; And⎵[the]⎵ti
#_1CDBB2: db $BE, $59, $C6, $59, $9D, $2D, $B4, $32 ; [me]⎵[of]⎵[des]t[in]y
#_1CDBBA: db $59, $A8 ; ⎵[for]
#_1CDBBC: db $75 ; line 2
#_1CDBBD: db $0F, $2B, $B4, $1C, $1E, $2C, $2C, $59 ; Pr[in]cess⎵
#_1CDBC5: db $19, $1E, $25, $1D, $1A, $59, $B5, $59 ; Zelda⎵[is]⎵
#_1CDBCD: db $1D, $2B, $1A, $E2, $27, $20 ; dra[wi]ng
#_1CDBD3: db $76 ; line 3
#_1CDBD4: db $27, $A2, $41 ; n[ear].
#_1CDBD7: db $78, $05 ; delay
#_1CDBD9: db $7F ; end of message

;===================================================================================================
; Because the key is locked
; inside this chest, you can
; never open it.
; Just take it with you.
;---------------------------------------------------------------------------------------------------
Message_0116:
#_1CDBDA: db $01, $1E, $1C, $1A, $2E, $D0, $59, $D8 ; Becau[se]⎵[the]
#_1CDBE2: db $59, $24, $1E, $32, $59, $B5, $59, $BB ; ⎵key⎵[is]⎵[lo]
#_1CDBEA: db $9C, $1E, $1D ; [ck]ed
#_1CDBED: db $75 ; line 2
#_1CDBEE: db $B4, $2C, $22, $1D, $1E, $59, $D9, $2C ; [in]side⎵[thi]s
#_1CDBF6: db $59, $9A, $D3, $42, $59, $E3, $59, $1C ; ⎵[che][st],⎵[you]⎵c
#_1CDBFE: db $93 ; [an]
#_1CDBFF: db $76 ; line 3
#_1CDC00: db $27, $A7, $A1, $C3, $59, $B6, $41 ; n[ev][er ][open]⎵[it].
#_1CDC07: db $7E ; wait for key
#_1CDC08: db $73 ; scroll text
#_1CDC09: db $09, $2E, $D3, $59, $2D, $1A, $24, $1E ; Ju[st]⎵take
#_1CDC11: db $59, $B6, $59, $DE, $59, $E3, $41 ; ⎵[it]⎵[with]⎵[you].
#_1CDC18: db $7F ; end of message

;===================================================================================================
; 100 Rupees for 30 Bombs!  30
; Bombs for just 100 Rupees!
; Please buy 'em, mister!
;---------------------------------------------------------------------------------------------------
Message_0117:
#_1CDC19: db $35, $34, $34, $59, $11, $DC, $1E, $1E ; 100⎵R[up]ee
#_1CDC21: db $2C, $59, $A8, $59, $37, $34, $59, $01 ; s⎵[for]⎵30⎵B
#_1CDC29: db $28, $26, $1B, $2C, $3E, $8A, $37, $34 ; ombs![  ]30
#_1CDC31: db $75 ; line 2
#_1CDC32: db $01, $28, $26, $1B, $2C, $59, $A8, $59 ; Bombs⎵[for]⎵
#_1CDC3A: db $B7, $59, $35, $34, $34, $59, $11, $DC ; [just]⎵100⎵R[up]
#_1CDC42: db $1E, $1E, $2C, $3E ; ees!
#_1CDC46: db $76 ; line 3
#_1CDC47: db $0F, $25, $1E, $1A, $D0, $59, $1B, $2E ; Plea[se]⎵bu
#_1CDC4F: db $32, $59, $51, $1E, $26, $42, $59, $26 ; y⎵'em,⎵m
#_1CDC57: db $B5, $D6, $3E ; [is][ter]!
#_1CDC5A: db $7F ; end of message

;===================================================================================================
; 100 Rupees for 30 Bombs!  I also
; have a new Super Bomb in stock
; for only 100 Rupees!  Please
; buy it too, mister!
;---------------------------------------------------------------------------------------------------
Message_0118:
#_1CDC5B: db $35, $34, $34, $59, $11, $DC, $1E, $1E ; 100⎵R[up]ee
#_1CDC63: db $2C, $59, $A8, $59, $37, $34, $59, $01 ; s⎵[for]⎵30⎵B
#_1CDC6B: db $28, $26, $1B, $2C, $3E, $8A, $08, $59 ; ombs![  ]I⎵
#_1CDC73: db $1A, $25, $D2 ; al[so]
#_1CDC76: db $75 ; line 2
#_1CDC77: db $AD, $59, $1A, $59, $27, $1E, $30, $59 ; [have]⎵a⎵new⎵
#_1CDC7F: db $12, $DC, $A1, $01, $28, $26, $1B, $59 ; S[up][er ]Bomb⎵
#_1CDC87: db $B4, $59, $D3, $28, $9C ; [in]⎵[st]o[ck]
#_1CDC8C: db $76 ; line 3
#_1CDC8D: db $A8, $59, $C7, $B9, $35, $34, $34, $59 ; [for]⎵[on][ly ]100⎵
#_1CDC95: db $11, $DC, $1E, $1E, $2C, $3E, $8A, $0F ; R[up]ees![  ]P
#_1CDC9D: db $25, $1E, $1A, $D0 ; lea[se]
#_1CDCA1: db $7E ; wait for key
#_1CDCA2: db $73 ; scroll text
#_1CDCA3: db $1B, $2E, $32, $59, $B6, $59, $DA, $28 ; buy⎵[it]⎵[to]o
#_1CDCAB: db $42, $59, $26, $B5, $D6, $3E ; ,⎵m[is][ter]!
#_1CDCB1: db $7F ; end of message

;===================================================================================================
; Thank you very much.
; Thank you very much.
;---------------------------------------------------------------------------------------------------
Message_0119:
#_1CDCB2: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_1CDCBA: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_1CDCBF: db $75 ; line 2
#_1CDCC0: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_1CDCC8: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_1CDCCD: db $7F ; end of message

;===================================================================================================
; Thank you very much.  You can
; drop this Bomb off anywhere.
; (Press the Ⓐ Button.)
; Please don't forget it.
;---------------------------------------------------------------------------------------------------
Message_011A:
#_1CDCCE: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_1CDCD6: db $59, $BF, $1C, $21, $41, $8A, $E8, $59 ; ⎵[mu]ch.[  ][You]⎵
#_1CDCDE: db $1C, $93 ; c[an]
#_1CDCE0: db $75 ; line 2
#_1CDCE1: db $1D, $2B, $28, $29, $59, $D9, $2C, $59 ; drop⎵[thi]s⎵
#_1CDCE9: db $01, $28, $26, $1B, $59, $C6, $1F, $59 ; Bomb⎵[of]f⎵
#_1CDCF1: db $93, $32, $E1, $A6, $1E, $41 ; [an]y[wh][er]e.
#_1CDCF7: db $76 ; line 3
#_1CDCF8: db $45, $0F, $CE, $2C, $2C, $59, $D8, $59 ; (P[re]ss⎵[the]⎵
#_1CDD00: db $5B, $59, $01, $2E, $2D, $DA, $27, $41 ; Ⓐ⎵But[to]n.
#_1CDD08: db $46 ; )
#_1CDD09: db $7E ; wait for key
#_1CDD0A: db $73 ; scroll text
#_1CDD0B: db $0F, $25, $1E, $1A, $D0, $59, $9F, $C0 ; Plea[se]⎵[do][n't ]
#_1CDD13: db $A8, $AB, $59, $B6, $41 ; [for][get]⎵[it].
#_1CDD18: db $7F ; end of message

;===================================================================================================
; Ki ki ki!  If you give me 100
; Rupees,  I will open the
; entrance for you.  Ki ki ki!
;   What will you do?
;     > Ask him to open it
;        Try to open it yourself
;---------------------------------------------------------------------------------------------------
Message_011B:
#_1CDD19: db $0A, $22, $59, $24, $22, $59, $24, $22 ; Ki⎵ki⎵ki
#_1CDD21: db $3E, $8A, $08, $1F, $59, $E3, $59, $AA ; ![  ]If⎵[you]⎵[give ]
#_1CDD29: db $BE, $59, $35, $34, $34 ; [me]⎵100
#_1CDD2E: db $75 ; line 2
#_1CDD2F: db $11, $DC, $1E, $1E, $2C, $42, $8A, $08 ; R[up]ees,[  ]I
#_1CDD37: db $59, $E2, $25, $25, $59, $C3, $59, $D8 ; ⎵[wi]ll⎵[open]⎵[the]
#_1CDD3F: db $76 ; line 3
#_1CDD40: db $A3, $2B, $93, $1C, $1E, $59, $A8, $59 ; [ent]r[an]ce⎵[for]⎵
#_1CDD48: db $E3, $41, $8A, $0A, $22, $59, $24, $22 ; [you].[  ]Ki⎵ki
#_1CDD50: db $59, $24, $22, $3E ; ⎵ki!
#_1CDD54: db $7E ; wait for key
#_1CDD55: db $73 ; scroll text
#_1CDD56: db $8A, $16, $B1, $2D, $59, $E2, $25, $25 ; [  ]W[ha]t⎵[wi]ll
#_1CDD5E: db $59, $E3, $59, $9F, $3F ; ⎵[you]⎵[do]?
#_1CDD63: db $73 ; scroll text
#_1CDD64: db $88, $44, $59, $00, $2C, $24, $59, $B0 ; [    ]>⎵Ask⎵[hi]
#_1CDD6C: db $26, $59, $DA, $59, $C3, $59, $B6 ; m⎵[to]⎵[open]⎵[it]
#_1CDD73: db $73 ; scroll text
#_1CDD74: db $88, $89, $13, $2B, $32, $59, $DA, $59 ; [    ][   ]Try⎵[to]⎵
#_1CDD7C: db $C3, $59, $B6, $59, $E3, $2B, $D0, $25 ; [open]⎵[it]⎵[you]r[se]l
#_1CDD84: db $1F ; f
#_1CDD85: db $68 ; choose 2 indented
#_1CDD86: db $7F ; end of message

;===================================================================================================
; Ki ki ki!  Hmph!
; Do it yourself, then!
; Kik ki ki!
;---------------------------------------------------------------------------------------------------
Message_011C:
#_1CDD87: db $0A, $22, $59, $24, $22, $59, $24, $22 ; Ki⎵ki⎵ki
#_1CDD8F: db $3E, $8A, $07, $26, $29, $21, $3E ; ![  ]Hmph!
#_1CDD96: db $75 ; line 2
#_1CDD97: db $03, $28, $59, $B6, $59, $E3, $2B, $D0 ; Do⎵[it]⎵[you]r[se]
#_1CDD9F: db $25, $1F, $42, $59, $D8, $27, $3E ; lf,⎵[the]n!
#_1CDDA6: db $76 ; line 3
#_1CDDA7: db $0A, $22, $24, $59, $24, $22, $59, $24 ; Kik⎵ki⎵k
#_1CDDAF: db $22, $3E ; i!
#_1CDDB1: db $7F ; end of message

;===================================================================================================
; Ki ki!  Good choice!  Then I get
; 100 of your Rupees.  Kik ki ki!
;---------------------------------------------------------------------------------------------------
Message_011D:
#_1CDDB2: db $0A, $22, $59, $24, $22, $3E, $8A, $06 ; Ki⎵ki![  ]G
#_1CDDBA: db $28, $28, $1D, $59, $1C, $21, $28, $22 ; ood⎵choi
#_1CDDC2: db $1C, $1E, $3E, $8A, $E6, $27, $59, $08 ; ce![  ][The]n⎵I
#_1CDDCA: db $59, $AB ; ⎵[get]
#_1CDDCC: db $75 ; line 2
#_1CDDCD: db $35, $34, $34, $59, $C6, $59, $E3, $2B ; 100⎵[of]⎵[you]r
#_1CDDD5: db $59, $11, $DC, $1E, $1E, $2C, $41, $8A ; ⎵R[up]ees.[  ]
#_1CDDDD: db $0A, $22, $24, $59, $24, $22, $59, $24 ; Kik⎵ki⎵k
#_1CDDE5: db $22, $3E ; i!
#_1CDDE7: db $7F ; end of message

;===================================================================================================
; I'm Kiki the monkey ki ki!
; I love Rupees more than
; anything.  Can you spare me
; 10 Rupees?
;  What will you do?
;     > Give him 10 Rupees
;        Never give him anything
;---------------------------------------------------------------------------------------------------
Message_011E:
#_1CDDE8: db $08, $51, $26, $59, $0A, $22, $24, $22 ; I'm⎵Kiki
#_1CDDF0: db $59, $D8, $59, $26, $C7, $24, $1E, $32 ; ⎵[the]⎵m[on]key
#_1CDDF8: db $59, $24, $22, $59, $24, $22, $3E ; ⎵ki⎵ki!
#_1CDDFF: db $75 ; line 2
#_1CDE00: db $08, $59, $BB, $2F, $1E, $59, $11, $DC ; I⎵[lo]ve⎵R[up]
#_1CDE08: db $1E, $1E, $2C, $59, $26, $C8, $1E, $59 ; ees⎵m[or]e⎵
#_1CDE10: db $D7, $27 ; [tha]n
#_1CDE12: db $76 ; line 3
#_1CDE13: db $93, $32, $D5, $20, $41, $8A, $02, $93 ; [an]y[thin]g.[  ]C[an]
#_1CDE1B: db $59, $E3, $59, $2C, $29, $8D, $BE ; ⎵[you]⎵sp[are ][me]
#_1CDE22: db $7E ; wait for key
#_1CDE23: db $73 ; scroll text
#_1CDE24: db $35, $34, $59, $11, $DC, $1E, $1E, $2C ; 10⎵R[up]ees
#_1CDE2C: db $3F ; ?
#_1CDE2D: db $7E ; wait for key
#_1CDE2E: db $73 ; scroll text
#_1CDE2F: db $59, $16, $B1, $2D, $59, $E2, $25, $25 ; ⎵W[ha]t⎵[wi]ll
#_1CDE37: db $59, $E3, $59, $9F, $3F ; ⎵[you]⎵[do]?
#_1CDE3C: db $73 ; scroll text
#_1CDE3D: db $88, $44, $59, $06, $22, $2F, $1E, $59 ; [    ]>⎵Give⎵
#_1CDE45: db $B0, $26, $59, $35, $34, $59, $11, $DC ; [hi]m⎵10⎵R[up]
#_1CDE4D: db $1E, $1E, $2C ; ees
#_1CDE50: db $73 ; scroll text
#_1CDE51: db $88, $89, $0D, $A7, $A1, $AA, $B0, $26 ; [    ][   ]N[ev][er ][give ][hi]m
#_1CDE59: db $59, $93, $32, $D5, $20 ; ⎵[an]y[thin]g
#_1CDE5E: db $68 ; choose 2 indented
#_1CDE5F: db $7F ; end of message

;===================================================================================================
; Ki ki ki ki!  Good choice!  I
; will accompany you for a while.
; Kik kiki!
;---------------------------------------------------------------------------------------------------
Message_011F:
#_1CDE60: db $0A, $22, $59, $24, $22, $59, $24, $22 ; Ki⎵ki⎵ki
#_1CDE68: db $59, $24, $22, $3E, $8A, $06, $28, $28 ; ⎵ki![  ]Goo
#_1CDE70: db $1D, $59, $1C, $21, $28, $22, $1C, $1E ; d⎵choice
#_1CDE78: db $3E, $8A, $08 ; ![  ]I
#_1CDE7B: db $75 ; line 2
#_1CDE7C: db $E2, $25, $25, $59, $1A, $1C, $9B, $29 ; [wi]ll⎵ac[com]p
#_1CDE84: db $93, $32, $59, $E3, $59, $A8, $59, $1A ; [an]y⎵[you]⎵[for]⎵a
#_1CDE8C: db $59, $E1, $22, $25, $1E, $41 ; ⎵[wh]ile.
#_1CDE92: db $76 ; line 3
#_1CDE93: db $0A, $22, $24, $59, $24, $22, $24, $22 ; Kik⎵kiki
#_1CDE9B: db $3E ; !
#_1CDE9C: db $7F ; end of message

;===================================================================================================
; Ki ki!  Harumph!  I have no
; reason to talk to you, then.
; Bye bye!  Kik ki ki!
;---------------------------------------------------------------------------------------------------
Message_0120:
#_1CDE9D: db $0A, $22, $59, $24, $22, $3E, $8A, $07 ; Ki⎵ki![  ]H
#_1CDEA5: db $1A, $2B, $2E, $26, $29, $21, $3E, $8A ; arumph![  ]
#_1CDEAD: db $08, $59, $AD, $59, $27, $28 ; I⎵[have]⎵no
#_1CDEB3: db $75 ; line 2
#_1CDEB4: db $CE, $1A, $D2, $27, $59, $DA, $59, $2D ; [re]a[so]n⎵[to]⎵t
#_1CDEBC: db $1A, $25, $24, $59, $DA, $59, $E3, $42 ; alk⎵[to]⎵[you],
#_1CDEC4: db $59, $D8, $27, $41 ; ⎵[the]n.
#_1CDEC8: db $76 ; line 3
#_1CDEC9: db $01, $32, $1E, $59, $1B, $32, $1E, $3E ; Bye⎵bye!
#_1CDED1: db $8A, $0A, $22, $24, $59, $24, $22, $59 ; [  ]Kik⎵ki⎵
#_1CDED9: db $24, $22, $3E ; ki!
#_1CDEDC: db $7F ; end of message

;===================================================================================================
; Ki ki?  What are you doing?
; I don't want to go there!
;---------------------------------------------------------------------------------------------------
Message_0121:
#_1CDEDD: db $0A, $22, $59, $24, $22, $3F, $8A, $16 ; Ki⎵ki?[  ]W
#_1CDEE5: db $B1, $2D, $59, $8D, $E3, $59, $9F, $B4 ; [ha]t⎵[are ][you]⎵[do][in]
#_1CDEED: db $20, $3F ; g?
#_1CDEEF: db $75 ; line 2
#_1CDEF0: db $08, $59, $9F, $C0, $DF, $27, $2D, $59 ; I⎵[do][n't ][wa]nt⎵
#_1CDEF8: db $DA, $59, $AC, $59, $D8, $CE, $3E ; [to]⎵[go]⎵[the][re]!
#_1CDEFF: db $7F ; end of message

;===================================================================================================
; Ohh, thank you very much!
; You saved my life.  Please take
; me outside.
;---------------------------------------------------------------------------------------------------
Message_0122:
#_1CDF00: db $0E, $21, $21, $42, $59, $D7, $27, $24 ; Ohh,⎵[tha]nk
#_1CDF08: db $59, $E3, $59, $DD, $32, $59, $BF, $1C ; ⎵[you]⎵[ver]y⎵[mu]c
#_1CDF10: db $21, $3E ; h!
#_1CDF12: db $75 ; line 2
#_1CDF13: db $E8, $59, $2C, $1A, $2F, $A4, $26, $32 ; [You]⎵sav[ed ]my
#_1CDF1B: db $59, $25, $22, $1F, $1E, $41, $8A, $0F ; ⎵life.[  ]P
#_1CDF23: db $25, $1E, $1A, $D0, $59, $2D, $1A, $24 ; lea[se]⎵tak
#_1CDF2B: db $1E ; e
#_1CDF2C: db $76 ; line 3
#_1CDF2D: db $BE, $59, $28, $2E, $2D, $2C, $22, $1D ; [me]⎵outsid
#_1CDF35: db $1E, $41 ; e.
#_1CDF37: db $7F ; end of message

;===================================================================================================
; Gyaaah!
; Too bright!
;---------------------------------------------------------------------------------------------------
Message_0123:
#_1CDF38: db $06, $32, $1A, $1A, $1A, $21, $3E ; Gyaaah!
#_1CDF3F: db $75 ; line 2
#_1CDF40: db $13, $28, $28, $59, $1B, $2B, $22, $20 ; Too⎵brig
#_1CDF48: db $21, $2D, $3E ; ht!
#_1CDF4B: db $7F ; end of message

;===================================================================================================
; Err…  Wait a minute…
; Please don't go this way.
;---------------------------------------------------------------------------------------------------
Message_0124:
#_1CDF4C: db $04, $2B, $2B, $43, $8A, $16, $1A, $B6 ; Err…[  ]Wa[it]
#_1CDF54: db $59, $1A, $59, $26, $B4, $2E, $2D, $1E ; ⎵a⎵m[in]ute
#_1CDF5C: db $43 ; …
#_1CDF5D: db $75 ; line 2
#_1CDF5E: db $0F, $25, $1E, $1A, $D0, $59, $9F, $C0 ; Plea[se]⎵[do][n't ]
#_1CDF66: db $AC, $59, $D9, $2C, $59, $DF, $32, $41 ; [go]⎵[thi]s⎵[wa]y.
#_1CDF6E: db $7F ; end of message

;===================================================================================================
; I am Aginah.  I sense something
; is happening in the Golden Land
; the seven wise men sealed…
; This must be an omen of the
; Great Cataclysm foretold by
; the people of Hylian blood…
; … … …
; The prophecy says, "The Hero
; will stand in the desert holding
; the Book Of Mudora."
; If you have the Book Of Mudora
; you can read the language of
; the Hylia People.
; It should be in the house of
; books in the village…
; You must get it!
; If you are the person who will
; be The Hero…
;---------------------------------------------------------------------------------------------------
Message_0125:
#_1CDF6F: db $08, $59, $1A, $26, $59, $00, $20, $B4 ; I⎵am⎵Ag[in]
#_1CDF77: db $1A, $21, $41, $8A, $08, $59, $D0, $27 ; ah.[  ]I⎵[se]n
#_1CDF7F: db $D0, $59, $CF, $D5, $20 ; [se]⎵[some][thin]g
#_1CDF84: db $75 ; line 2
#_1CDF85: db $B5, $59, $B1, $29, $29, $A5, $B3, $B4 ; [is]⎵[ha]pp[en][ing ][in]
#_1CDF8D: db $59, $D8, $59, $06, $28, $25, $1D, $A0 ; ⎵[the]⎵Gold[en ]
#_1CDF95: db $0B, $90 ; L[and]
#_1CDF97: db $76 ; line 3
#_1CDF98: db $D8, $59, $D0, $2F, $A0, $E2, $D0, $59 ; [the]⎵[se]v[en ][wi][se]⎵
#_1CDFA0: db $BE, $27, $59, $D0, $1A, $25, $1E, $1D ; [me]n⎵[se]aled
#_1CDFA8: db $43 ; …
#_1CDFA9: db $7E ; wait for key
#_1CDFAA: db $73 ; scroll text
#_1CDFAB: db $E7, $2C, $59, $BF, $D3, $59, $97, $59 ; [Thi]s⎵[mu][st]⎵[be]⎵
#_1CDFB3: db $93, $59, $28, $BE, $27, $59, $C6, $59 ; [an]⎵o[me]n⎵[of]⎵
#_1CDFBB: db $D8 ; [the]
#_1CDFBC: db $73 ; scroll text
#_1CDFBD: db $06, $CE, $91, $02, $94, $1A, $1C, $25 ; G[re][at ]C[at]acl
#_1CDFC5: db $32, $2C, $26, $59, $A8, $1E, $DA, $25 ; ysm⎵[for]e[to]l
#_1CDFCD: db $1D, $59, $1B, $32 ; d⎵by
#_1CDFD1: db $73 ; scroll text
#_1CDFD2: db $D8, $59, $29, $1E, $28, $CA, $59, $C6 ; [the]⎵peo[ple]⎵[of]
#_1CDFDA: db $59, $07, $32, $25, $22, $93, $59, $1B ; ⎵Hyli[an]⎵b
#_1CDFE2: db $BB, $28, $1D, $43 ; [lo]od…
#_1CDFE6: db $7E ; wait for key
#_1CDFE7: db $73 ; scroll text
#_1CDFE8: db $43, $59, $43, $59, $43 ; …⎵…⎵…
#_1CDFED: db $73 ; scroll text
#_1CDFEE: db $E6, $59, $CC, $29, $21, $1E, $1C, $32 ; [The]⎵[pro]phecy
#_1CDFF6: db $59, $2C, $1A, $32, $2C, $42, $59, $4C ; ⎵says,⎵"
#_1CDFFE: db $E6, $59, $E4, $28 ; [The]⎵[Her]o
#_1CE002: db $73 ; scroll text
#_1CE003: db $E2, $25, $25, $59, $D3, $8C, $B4, $59 ; [wi]ll⎵[st][and ][in]⎵
#_1CE00B: db $D8, $59, $9D, $A6, $2D, $59, $21, $28 ; [the]⎵[des][er]t⎵ho
#_1CE013: db $25, $9E, $27, $20 ; l[di]ng
#_1CE017: db $7E ; wait for key
#_1CE018: db $73 ; scroll text
#_1CE019: db $D8, $59, $01, $28, $28, $24, $59, $0E ; [the]⎵Book⎵O
#_1CE021: db $1F, $59, $0C, $2E, $9F, $2B, $1A, $41 ; f⎵Mu[do]ra.
#_1CE029: db $4C ; "
#_1CE02A: db $73 ; scroll text
#_1CE02B: db $08, $1F, $59, $E3, $59, $AD, $59, $D8 ; If⎵[you]⎵[have]⎵[the]
#_1CE033: db $59, $01, $28, $28, $24, $59, $0E, $1F ; ⎵Book⎵Of
#_1CE03B: db $59, $0C, $2E, $9F, $2B, $1A ; ⎵Mu[do]ra
#_1CE041: db $73 ; scroll text
#_1CE042: db $E3, $59, $99, $CE, $1A, $1D, $59, $D8 ; [you]⎵[can ][re]ad⎵[the]
#_1CE04A: db $59, $BA, $27, $20, $2E, $1A, $20, $1E ; ⎵[la]nguage
#_1CE052: db $59, $C6 ; ⎵[of]
#_1CE054: db $7E ; wait for key
#_1CE055: db $73 ; scroll text
#_1CE056: db $D8, $59, $07, $32, $25, $22, $1A, $59 ; [the]⎵Hylia⎵
#_1CE05E: db $0F, $1E, $28, $CA, $41 ; Peo[ple].
#_1CE063: db $73 ; scroll text
#_1CE064: db $08, $2D, $59, $D1, $28, $2E, $25, $1D ; It⎵[sh]ould
#_1CE06C: db $59, $97, $59, $B4, $59, $D8, $59, $21 ; ⎵[be]⎵[in]⎵[the]⎵h
#_1CE074: db $28, $2E, $D0, $59, $C6 ; ou[se]⎵[of]
#_1CE079: db $73 ; scroll text
#_1CE07A: db $98, $28, $24, $2C, $59, $B4, $59, $D8 ; [bo]oks⎵[in]⎵[the]
#_1CE082: db $59, $2F, $22, $25, $BA, $20, $1E, $43 ; ⎵vil[la]ge…
#_1CE08A: db $7E ; wait for key
#_1CE08B: db $73 ; scroll text
#_1CE08C: db $E8, $59, $BF, $D3, $59, $AB, $59, $B6 ; [You]⎵[mu][st]⎵[get]⎵[it]
#_1CE094: db $3E ; !
#_1CE095: db $73 ; scroll text
#_1CE096: db $08, $1F, $59, $E3, $59, $8D, $D8, $59 ; If⎵[you]⎵[are ][the]⎵
#_1CE09E: db $C9, $D2, $27, $59, $E1, $28, $59, $E2 ; [per][so]n⎵[wh]o⎵[wi]
#_1CE0A6: db $25, $25 ; ll
#_1CE0A8: db $73 ; scroll text
#_1CE0A9: db $97, $59, $E6, $59, $E4, $28, $43 ; [be]⎵[The]⎵[Her]o…
#_1CE0B0: db $7F ; end of message

;===================================================================================================
; You have collected the three
; Pendants.
; If you are indeed the Hero who
; has Wisdom, Courage and Power,
; the Master Sword sleeping in
; the forest will be yours.
;---------------------------------------------------------------------------------------------------
Message_0126:
#_1CE0B1: db $E8, $59, $AD, $59, $1C, $28, $25, $25 ; [You]⎵[have]⎵coll
#_1CE0B9: db $1E, $1C, $2D, $A4, $D8, $59, $2D, $21 ; ect[ed ][the]⎵th
#_1CE0C1: db $CE, $1E ; [re]e
#_1CE0C3: db $75 ; line 2
#_1CE0C4: db $0F, $A5, $1D, $93, $2D, $2C, $41 ; P[en]d[an]ts.
#_1CE0CB: db $76 ; line 3
#_1CE0CC: db $08, $1F, $59, $E3, $59, $8D, $B4, $1D ; If⎵[you]⎵[are ][in]d
#_1CE0D4: db $1E, $A4, $D8, $59, $E4, $28, $59, $E1 ; e[ed ][the]⎵[Her]o⎵[wh]
#_1CE0DC: db $28 ; o
#_1CE0DD: db $7E ; wait for key
#_1CE0DE: db $73 ; scroll text
#_1CE0DF: db $AE, $59, $16, $B5, $9F, $26, $42, $59 ; [has]⎵W[is][do]m,⎵
#_1CE0E7: db $02, $28, $2E, $2B, $1A, $20, $1E, $59 ; Courage⎵
#_1CE0EF: db $8C, $0F, $28, $E0, $2B, $42 ; [and ]Po[we]r,
#_1CE0F5: db $73 ; scroll text
#_1CE0F6: db $D8, $59, $0C, $92, $A1, $12, $30, $C8 ; [the]⎵M[ast][er ]Sw[or]
#_1CE0FE: db $1D, $59, $2C, $25, $1E, $1E, $29, $B3 ; d⎵sleep[ing ]
#_1CE106: db $B4 ; [in]
#_1CE107: db $73 ; scroll text
#_1CE108: db $D8, $59, $A8, $1E, $D3, $59, $E2, $25 ; [the]⎵[for]e[st]⎵[wi]l
#_1CE110: db $25, $59, $97, $59, $E3, $2B, $2C, $41 ; l⎵[be]⎵[you]rs.
#_1CE118: db $7F ; end of message

;===================================================================================================
; Aha!  It is the Book Of Mudora.
; With it, you can read the
; language of the Hylia people.
;---------------------------------------------------------------------------------------------------
Message_0127:
#_1CE119: db $00, $B1, $3E, $8A, $08, $2D, $59, $B5 ; A[ha]![  ]It⎵[is]
#_1CE121: db $59, $D8, $59, $01, $28, $28, $24, $59 ; ⎵[the]⎵Book⎵
#_1CE129: db $0E, $1F, $59, $0C, $2E, $9F, $2B, $1A ; Of⎵Mu[do]ra
#_1CE131: db $41 ; .
#_1CE132: db $75 ; line 2
#_1CE133: db $16, $B6, $21, $59, $B6, $42, $59, $E3 ; W[it]h⎵[it],⎵[you]
#_1CE13B: db $59, $99, $CE, $1A, $1D, $59, $D8 ; ⎵[can ][re]ad⎵[the]
#_1CE142: db $76 ; line 3
#_1CE143: db $BA, $27, $20, $2E, $1A, $20, $1E, $59 ; [la]nguage⎵
#_1CE14B: db $C6, $59, $D8, $59, $07, $32, $25, $22 ; [of]⎵[the]⎵Hyli
#_1CE153: db $1A, $59, $29, $1E, $28, $CA, $41 ; a⎵peo[ple].
#_1CE15A: db $7F ; end of message

;===================================================================================================
; You are the true Hero…
; I believe that you will return
; peace to this land again.
;---------------------------------------------------------------------------------------------------
Message_0128:
#_1CE15B: db $E8, $59, $8D, $D8, $59, $DB, $2E, $1E ; [You]⎵[are ][the]⎵[tr]ue
#_1CE163: db $59, $E4, $28, $43 ; ⎵[Her]o…
#_1CE167: db $75 ; line 2
#_1CE168: db $08, $59, $97, $25, $22, $A7, $1E, $59 ; I⎵[be]li[ev]e⎵
#_1CE170: db $D7, $2D, $59, $E3, $59, $E2, $25, $25 ; [tha]t⎵[you]⎵[wi]ll
#_1CE178: db $59, $CE, $2D, $2E, $2B, $27 ; ⎵[re]turn
#_1CE17E: db $76 ; line 3
#_1CE17F: db $29, $1E, $1A, $1C, $1E, $59, $DA, $59 ; peace⎵[to]⎵
#_1CE187: db $D9, $2C, $59, $BA, $27, $1D, $59, $1A ; [thi]s⎵[la]nd⎵a
#_1CE18F: db $20, $8F, $41 ; g[ain].
#_1CE192: db $7F ; end of message

;===================================================================================================
; Your trial in the desert has
; made you stronger.  The blood
; of the Hero must be in your
; veins…
;---------------------------------------------------------------------------------------------------
Message_0129:
#_1CE193: db $E8, $2B, $59, $DB, $22, $1A, $25, $59 ; [You]r⎵[tr]ial⎵
#_1CE19B: db $B4, $59, $D8, $59, $9D, $A6, $2D, $59 ; [in]⎵[the]⎵[des][er]t⎵
#_1CE1A3: db $AE ; [has]
#_1CE1A4: db $75 ; line 2
#_1CE1A5: db $BD, $1D, $1E, $59, $E3, $59, $D3, $2B ; [ma]de⎵[you]⎵[st]r
#_1CE1AD: db $C7, $20, $A6, $41, $8A, $E6, $59, $1B ; [on]g[er].[  ][The]⎵b
#_1CE1B5: db $BB, $28, $1D ; [lo]od
#_1CE1B8: db $76 ; line 3
#_1CE1B9: db $C6, $59, $D8, $59, $E4, $28, $59, $BF ; [of]⎵[the]⎵[Her]o⎵[mu]
#_1CE1C1: db $D3, $59, $97, $59, $B4, $59, $E3, $2B ; [st]⎵[be]⎵[in]⎵[you]r
#_1CE1C9: db $7E ; wait for key
#_1CE1CA: db $73 ; scroll text
#_1CE1CB: db $2F, $1E, $B4, $2C, $43 ; ve[in]s…
#_1CE1D0: db $7F ; end of message

;===================================================================================================
; Was it you who disturbed my
; peaceful nap?  I will give this
; to you if you go away!
;---------------------------------------------------------------------------------------------------
Message_012A:
#_1CE1D1: db $16, $1A, $2C, $59, $B6, $59, $E3, $59 ; Was⎵[it]⎵[you]⎵
#_1CE1D9: db $E1, $28, $59, $9E, $D3, $2E, $2B, $97 ; [wh]o⎵[di][st]ur[be]
#_1CE1E1: db $1D, $59, $26, $32 ; d⎵my
#_1CE1E5: db $75 ; line 2
#_1CE1E6: db $29, $1E, $1A, $1C, $1E, $1F, $2E, $25 ; peaceful
#_1CE1EE: db $59, $27, $1A, $29, $3F, $8A, $08, $59 ; ⎵nap?[  ]I⎵
#_1CE1F6: db $E2, $25, $25, $59, $AA, $D9, $2C ; [wi]ll⎵[give ][thi]s
#_1CE1FD: db $76 ; line 3
#_1CE1FE: db $DA, $59, $E3, $59, $22, $1F, $59, $E3 ; [to]⎵[you]⎵if⎵[you]
#_1CE206: db $59, $AC, $59, $1A, $DF, $32, $3E ; ⎵[go]⎵a[wa]y!
#_1CE20D: db $7F ; end of message

;===================================================================================================
; I don't have any more good
; presents for you.  Take this
; instead, pest!
;---------------------------------------------------------------------------------------------------
Message_012B:
#_1CE20E: db $08, $59, $9F, $C0, $AD, $59, $93, $32 ; I⎵[do][n't ][have]⎵[an]y
#_1CE216: db $59, $26, $C8, $1E, $59, $AC, $28, $1D ; ⎵m[or]e⎵[go]od
#_1CE21E: db $75 ; line 2
#_1CE21F: db $29, $CE, $D0, $27, $2D, $2C, $59, $A8 ; p[re][se]nts⎵[for]
#_1CE227: db $59, $E3, $41, $8A, $13, $1A, $24, $1E ; ⎵[you].[  ]Take
#_1CE22F: db $59, $D9, $2C ; ⎵[thi]s
#_1CE232: db $76 ; line 3
#_1CE233: db $B4, $D3, $1E, $1A, $1D, $42, $59, $29 ; [in][st]ead,⎵p
#_1CE23B: db $1E, $D3, $3E ; e[st]!
#_1CE23E: db $7F ; end of message

;===================================================================================================
; Yo [LINK]!  A mysterious fog
; has recently fallen over the
; forest.  We have to be careful!
;---------------------------------------------------------------------------------------------------
Message_012C:
#_1CE23F: db $18, $28, $59, $6A, $3E, $8A, $00, $59 ; Yo⎵[LINK]![  ]A⎵
#_1CE247: db $26, $32, $D3, $A6, $22, $28, $2E, $2C ; my[st][er]ious
#_1CE24F: db $59, $1F, $28, $20 ; ⎵fog
#_1CE253: db $75 ; line 2
#_1CE254: db $AE, $59, $CE, $1C, $A3, $B9, $1F, $1A ; [has]⎵[re]c[ent][ly ]fa
#_1CE25C: db $25, $25, $A0, $28, $DD, $59, $D8 ; ll[en ]o[ver]⎵[the]
#_1CE263: db $76 ; line 3
#_1CE264: db $A8, $1E, $D3, $41, $8A, $16, $1E, $59 ; [for]e[st].[  ]We⎵
#_1CE26C: db $AD, $59, $DA, $59, $97, $59, $1C, $1A ; [have]⎵[to]⎵[be]⎵ca
#_1CE274: db $CE, $1F, $2E, $25, $3E ; [re]ful!
#_1CE279: db $7F ; end of message

;===================================================================================================
; Maybe it's nothing, but this
; tree feels kind of strange as
; we cut it…
;---------------------------------------------------------------------------------------------------
Message_012D:
#_1CE27A: db $0C, $1A, $32, $97, $59, $B6, $8B, $C2 ; May[be]⎵[it]['s ][not]
#_1CE282: db $B0, $27, $20, $42, $59, $1B, $2E, $2D ; [hi]ng,⎵but
#_1CE28A: db $59, $D9, $2C ; ⎵[thi]s
#_1CE28D: db $75 ; line 2
#_1CE28E: db $DB, $1E, $1E, $59, $1F, $1E, $1E, $25 ; [tr]ee⎵feel
#_1CE296: db $2C, $59, $24, $B4, $1D, $59, $C6, $59 ; s⎵k[in]d⎵[of]⎵
#_1CE29E: db $D3, $2B, $93, $20, $1E, $59, $1A, $2C ; [st]r[an]ge⎵as
#_1CE2A6: db $76 ; line 3
#_1CE2A7: db $E0, $59, $1C, $2E, $2D, $59, $B6, $43 ; [we]⎵cut⎵[it]…
#_1CE2AF: db $7F ; end of message

;===================================================================================================
; Yo!  The fog in the forest is
; clearing.  Thank you!  We can
; go there again!  Hey brother!
;---------------------------------------------------------------------------------------------------
Message_012E:
#_1CE2B0: db $18, $28, $3E, $8A, $E6, $59, $1F, $28 ; Yo![  ][The]⎵fo
#_1CE2B8: db $20, $59, $B4, $59, $D8, $59, $A8, $1E ; g⎵[in]⎵[the]⎵[for]e
#_1CE2C0: db $D3, $59, $B5 ; [st]⎵[is]
#_1CE2C3: db $75 ; line 2
#_1CE2C4: db $1C, $25, $A2, $B4, $20, $41, $8A, $E5 ; cl[ear][in]g.[  ][Tha]
#_1CE2CC: db $27, $24, $59, $E3, $3E, $8A, $16, $1E ; nk⎵[you]![  ]We
#_1CE2D4: db $59, $1C, $93 ; ⎵c[an]
#_1CE2D7: db $76 ; line 3
#_1CE2D8: db $AC, $59, $D8, $CD, $1A, $20, $8F, $3E ; [go]⎵[the][re ]ag[ain]!
#_1CE2E0: db $8A, $07, $1E, $32, $59, $1B, $2B, $28 ; [  ]Hey⎵bro
#_1CE2E8: db $D8, $2B, $3E ; [the]r!
#_1CE2EB: db $7F ; end of message

;===================================================================================================
; Yeah [LINK], now I'm
; quarreling with my younger
; brother.  I sealed the door to
; his room.
;---------------------------------------------------------------------------------------------------
Message_012F:
#_1CE2EC: db $18, $1E, $1A, $21, $59, $6A, $42, $59 ; Yeah⎵[LINK],⎵
#_1CE2F4: db $27, $28, $30, $59, $08, $51, $26 ; now⎵I'm
#_1CE2FB: db $75 ; line 2
#_1CE2FC: db $2A, $2E, $1A, $2B, $CE, $25, $B3, $DE ; quar[re]l[ing ][with]
#_1CE304: db $59, $26, $32, $59, $E3, $27, $20, $A6 ; ⎵my⎵[you]ng[er]
#_1CE30C: db $76 ; line 3
#_1CE30D: db $1B, $2B, $28, $D8, $2B, $41, $8A, $08 ; bro[the]r.[  ]I
#_1CE315: db $59, $D0, $1A, $25, $A4, $D8, $59, $9F ; ⎵[se]al[ed ][the]⎵[do]
#_1CE31D: db $C8, $59, $DA ; [or]⎵[to]
#_1CE320: db $7E ; wait for key
#_1CE321: db $73 ; scroll text
#_1CE322: db $B0, $2C, $59, $2B, $28, $28, $26, $41 ; [hi]s⎵room.
#_1CE32A: db $7F ; end of message

;===================================================================================================
; So the doorway is open again…
; OK OK, maybe I should make up
; with my brother…
;---------------------------------------------------------------------------------------------------
Message_0130:
#_1CE32B: db $12, $28, $59, $D8, $59, $9F, $C8, $DF ; So⎵[the]⎵[do][or][wa]
#_1CE333: db $32, $59, $B5, $59, $C3, $59, $1A, $20 ; y⎵[is]⎵[open]⎵ag
#_1CE33B: db $8F, $43 ; [ain]…
#_1CE33D: db $75 ; line 2
#_1CE33E: db $0E, $0A, $59, $0E, $0A, $42, $59, $BD ; OK⎵OK,⎵[ma]
#_1CE346: db $32, $97, $59, $08, $59, $D1, $28, $2E ; y[be]⎵I⎵[sh]ou
#_1CE34E: db $25, $1D, $59, $BD, $24, $1E, $59, $DC ; ld⎵[ma]ke⎵[up]
#_1CE356: db $76 ; line 3
#_1CE357: db $DE, $59, $26, $32, $59, $1B, $2B, $28 ; [with]⎵my⎵bro
#_1CE35F: db $D8, $2B, $43 ; [the]r…
#_1CE362: db $7F ; end of message

;===================================================================================================
; Hey [LINK], did you come from
; my older brother's room?  Is he
; still angry?
;---------------------------------------------------------------------------------------------------
Message_0131:
#_1CE363: db $07, $1E, $32, $59, $6A, $42, $59, $9E ; Hey⎵[LINK],⎵[di]
#_1CE36B: db $1D, $59, $E3, $59, $9B, $1E, $59, $A9 ; d⎵[you]⎵[com]e⎵[fro]
#_1CE373: db $26 ; m
#_1CE374: db $75 ; line 2
#_1CE375: db $26, $32, $59, $28, $25, $1D, $A1, $1B ; my⎵old[er ]b
#_1CE37D: db $2B, $28, $D8, $2B, $8B, $2B, $28, $28 ; ro[the]r['s ]roo
#_1CE385: db $26, $3F, $8A, $08, $2C, $59, $21, $1E ; m?[  ]Is⎵he
#_1CE38D: db $76 ; line 3
#_1CE38E: db $D3, $22, $25, $25, $59, $93, $20, $2B ; [st]ill⎵[an]gr
#_1CE396: db $32, $3F ; y?
#_1CE398: db $7F ; end of message

;===================================================================================================
; [LINK], because of you,  I can
; escape from the clutches of
; the evil monsters.  Thank you!
; …This world used to be the
; Golden Land where the Triforce
; was hidden.
; But because Ganon, the boss
; of thieves, wished it the world
; was transformed…
; I'm sure he's intending to
; conquer even our Light World
; after building his power here.
; He is trying to open a larger
; gate between worlds near the
; castle using our powers.
; But the gate is not open
; completely yet…
; If we seven maidens come
; together, we can break the
; barrier around Ganon's hiding
; place.
; I will tell you where the other
; girls are held.  I believe you
; will destroy Ganon.
; I will return to my original
; form at that time.
;  … … … … …
;---------------------------------------------------------------------------------------------------
Message_0132:
#_1CE399: db $7A, $02 ; set draw speed
#_1CE39B: db $6D, $01 ; set window position
#_1CE39D: db $6B, $02 ; set window border
#_1CE39F: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CE3A7: db $59, $C6, $59, $E3, $42, $8A, $08, $59 ; ⎵[of]⎵[you],[  ]I⎵
#_1CE3AF: db $1C, $93 ; c[an]
#_1CE3B1: db $75 ; line 2
#_1CE3B2: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CE3BA: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CE3C2: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CE3C6: db $76 ; line 3
#_1CE3C7: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CE3CF: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CE3D7: db $59, $E3, $3E ; ⎵[you]!
#_1CE3DA: db $7E ; wait for key
#_1CE3DB: db $73 ; scroll text
#_1CE3DC: db $43, $E7, $2C, $59, $30, $C8, $25, $1D ; …[Thi]s⎵w[or]ld
#_1CE3E4: db $59, $2E, $D0, $1D, $59, $DA, $59, $97 ; ⎵u[se]d⎵[to]⎵[be]
#_1CE3EC: db $59, $D8 ; ⎵[the]
#_1CE3EE: db $73 ; scroll text
#_1CE3EF: db $06, $28, $25, $1D, $A0, $0B, $8C, $E1 ; Gold[en ]L[and ][wh]
#_1CE3F7: db $A6, $1E, $59, $D8, $59, $13, $2B, $22 ; [er]e⎵[the]⎵Tri
#_1CE3FF: db $A8, $1C, $1E ; [for]ce
#_1CE402: db $73 ; scroll text
#_1CE403: db $DF, $2C, $59, $B0, $1D, $1D, $A5, $41 ; [wa]s⎵[hi]dd[en].
#_1CE40B: db $7E ; wait for key
#_1CE40C: db $73 ; scroll text
#_1CE40D: db $01, $2E, $2D, $59, $97, $1C, $1A, $2E ; But⎵[be]cau
#_1CE415: db $D0, $59, $06, $93, $C7, $42, $59, $D8 ; [se]⎵G[an][on],⎵[the]
#_1CE41D: db $59, $98, $2C, $2C ; ⎵[bo]ss
#_1CE421: db $73 ; scroll text
#_1CE422: db $C6, $59, $D9, $A7, $1E, $2C, $42, $59 ; [of]⎵[thi][ev]es,⎵
#_1CE42A: db $E2, $D1, $A4, $B6, $59, $D8, $59, $30 ; [wi][sh][ed ][it]⎵[the]⎵w
#_1CE432: db $C8, $25, $1D ; [or]ld
#_1CE435: db $73 ; scroll text
#_1CE436: db $DF, $2C, $59, $DB, $93, $2C, $A8, $BE ; [wa]s⎵[tr][an]s[for][me]
#_1CE43E: db $1D, $43 ; d…
#_1CE440: db $7E ; wait for key
#_1CE441: db $73 ; scroll text
#_1CE442: db $08, $51, $26, $59, $2C, $2E, $CD, $21 ; I'm⎵su[re ]h
#_1CE44A: db $1E, $8B, $B4, $2D, $A5, $9E, $27, $20 ; e['s ][in]t[en][di]ng
#_1CE452: db $59, $DA ; ⎵[to]
#_1CE454: db $73 ; scroll text
#_1CE455: db $1C, $C7, $2A, $2E, $A1, $A7, $A0, $28 ; c[on]qu[er ][ev][en ]o
#_1CE45D: db $2E, $2B, $59, $0B, $B2, $16, $C8, $25 ; ur⎵L[ight ]W[or]l
#_1CE465: db $1D ; d
#_1CE466: db $73 ; scroll text
#_1CE467: db $1A, $1F, $D4, $1B, $2E, $22, $25, $9E ; af[ter ]buil[di]
#_1CE46F: db $27, $20, $59, $B0, $2C, $59, $CB, $A1 ; ng⎵[hi]s⎵[pow][er ]
#_1CE477: db $AF, $1E, $41 ; [her]e.
#_1CE47A: db $7E ; wait for key
#_1CE47B: db $73 ; scroll text
#_1CE47C: db $07, $1E, $59, $B5, $59, $DB, $32, $B3 ; He⎵[is]⎵[tr]y[ing ]
#_1CE484: db $DA, $59, $C3, $59, $1A, $59, $BA, $2B ; [to]⎵[open]⎵a⎵[la]r
#_1CE48C: db $20, $A6 ; g[er]
#_1CE48E: db $73 ; scroll text
#_1CE48F: db $20, $94, $1E, $59, $97, $2D, $E0, $A0 ; g[at]e⎵[be]t[we][en ]
#_1CE497: db $30, $C8, $25, $1D, $2C, $59, $27, $A2 ; w[or]lds⎵n[ear]
#_1CE49F: db $59, $D8 ; ⎵[the]
#_1CE4A1: db $73 ; scroll text
#_1CE4A2: db $1C, $92, $25, $1E, $59, $2E, $2C, $B3 ; c[ast]le⎵us[ing ]
#_1CE4AA: db $28, $2E, $2B, $59, $CB, $A6, $2C, $41 ; our⎵[pow][er]s.
#_1CE4B2: db $7E ; wait for key
#_1CE4B3: db $73 ; scroll text
#_1CE4B4: db $01, $2E, $2D, $59, $D8, $59, $20, $94 ; But⎵[the]⎵g[at]
#_1CE4BC: db $1E, $59, $B5, $59, $C2, $59, $C3 ; e⎵[is]⎵[not]⎵[open]
#_1CE4C3: db $73 ; scroll text
#_1CE4C4: db $9B, $CA, $2D, $1E, $B9, $32, $1E, $2D ; [com][ple]te[ly ]yet
#_1CE4CC: db $43 ; …
#_1CE4CD: db $73 ; scroll text
#_1CE4CE: db $08, $1F, $59, $E0, $59, $D0, $2F, $A0 ; If⎵[we]⎵[se]v[en ]
#_1CE4D6: db $BD, $22, $1D, $A5, $2C, $59, $9B, $1E ; [ma]id[en]s⎵[com]e
#_1CE4DE: db $7E ; wait for key
#_1CE4DF: db $73 ; scroll text
#_1CE4E0: db $DA, $AB, $AF, $42, $59, $E0, $59, $99 ; [to][get][her],⎵[we]⎵[can ]
#_1CE4E8: db $1B, $CE, $1A, $24, $59, $D8 ; b[re]ak⎵[the]
#_1CE4EE: db $73 ; scroll text
#_1CE4EF: db $96, $2B, $2B, $22, $A1, $1A, $2B, $C4 ; [ba]rri[er ]ar[ound]
#_1CE4F7: db $59, $06, $93, $C7, $8B, $B0, $9E, $27 ; ⎵G[an][on]['s ][hi][di]n
#_1CE4FF: db $20 ; g
#_1CE500: db $73 ; scroll text
#_1CE501: db $29, $BA, $1C, $1E, $41 ; p[la]ce.
#_1CE506: db $7E ; wait for key
#_1CE507: db $73 ; scroll text
#_1CE508: db $08, $59, $E2, $25, $25, $59, $2D, $1E ; I⎵[wi]ll⎵te
#_1CE510: db $25, $25, $59, $E3, $59, $E1, $A6, $1E ; ll⎵[you]⎵[wh][er]e
#_1CE518: db $59, $D8, $59, $28, $D8, $2B ; ⎵[the]⎵o[the]r
#_1CE51E: db $73 ; scroll text
#_1CE51F: db $20, $22, $2B, $25, $2C, $59, $8D, $21 ; girls⎵[are ]h
#_1CE527: db $1E, $25, $1D, $41, $8A, $08, $59, $97 ; eld.[  ]I⎵[be]
#_1CE52F: db $25, $22, $A7, $1E, $59, $E3 ; li[ev]e⎵[you]
#_1CE535: db $73 ; scroll text
#_1CE536: db $E2, $25, $25, $59, $9D, $DB, $28, $32 ; [wi]ll⎵[des][tr]oy
#_1CE53E: db $59, $06, $93, $C7, $41 ; ⎵G[an][on].
#_1CE543: db $7E ; wait for key
#_1CE544: db $73 ; scroll text
#_1CE545: db $08, $59, $E2, $25, $25, $59, $CE, $2D ; I⎵[wi]ll⎵[re]t
#_1CE54D: db $2E, $2B, $27, $59, $DA, $59, $26, $32 ; urn⎵[to]⎵my
#_1CE555: db $59, $C8, $22, $20, $B4, $1A, $25 ; ⎵[or]ig[in]al
#_1CE55C: db $73 ; scroll text
#_1CE55D: db $A8, $26, $59, $91, $D7, $2D, $59, $2D ; [for]m⎵[at ][tha]t⎵t
#_1CE565: db $22, $BE, $41 ; i[me].
#_1CE568: db $73 ; scroll text
#_1CE569: db $59, $43, $59, $43, $59, $43, $59, $43 ; ⎵…⎵…⎵…⎵…
#_1CE571: db $59, $43 ; ⎵…
#_1CE573: db $79, $2D ; play sfx
#_1CE575: db $7F ; end of message

;===================================================================================================
; [LINK], because of you, I can
; escape from the clutches of
; the evil monsters.  Thank you!
; …The Triforce will grant the
; wishes of whoever touches it,
; as long as that person lives…
; That is why it was hidden in
; the Golden Land.  Only a select
; few knew of its location,
; but at some point that
; knowledge was lost…
; The person who rediscovered
; the Golden Land was
; Ganondorf the evil thief.
; Luckily, he couldn't figure out
; how to return to the Light
; World…
; …Well, remember that you
; have magical powers, which only
; The Hero can make the most of!
; There are some other magical
; warping points like the one you
; saw on Death Mountain.
; By using them you can go
; between the two worlds and
; find the evils hidden in the
; Dark World.  You are the only
; one who can destroy
; Ganondorf, the thief-no,
; Ganon, the evil King Of
; Darkness!
;---------------------------------------------------------------------------------------------------
Message_0133:
#_1CE576: db $7A, $02 ; set draw speed
#_1CE578: db $6D, $01 ; set window position
#_1CE57A: db $6B, $02 ; set window border
#_1CE57C: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CE584: db $59, $C6, $59, $E3, $42, $59, $08, $59 ; ⎵[of]⎵[you],⎵I⎵
#_1CE58C: db $1C, $93 ; c[an]
#_1CE58E: db $75 ; line 2
#_1CE58F: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CE597: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CE59F: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CE5A3: db $76 ; line 3
#_1CE5A4: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CE5AC: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CE5B4: db $59, $E3, $3E ; ⎵[you]!
#_1CE5B7: db $7E ; wait for key
#_1CE5B8: db $73 ; scroll text
#_1CE5B9: db $43, $E6, $59, $13, $2B, $22, $A8, $1C ; …[The]⎵Tri[for]c
#_1CE5C1: db $1E, $59, $E2, $25, $25, $59, $20, $2B ; e⎵[wi]ll⎵gr
#_1CE5C9: db $93, $2D, $59, $D8 ; [an]t⎵[the]
#_1CE5CD: db $73 ; scroll text
#_1CE5CE: db $E2, $D1, $1E, $2C, $59, $C6, $59, $E1 ; [wi][sh]es⎵[of]⎵[wh]
#_1CE5D6: db $28, $A7, $A1, $DA, $2E, $9A, $2C, $59 ; o[ev][er ][to]u[che]s⎵
#_1CE5DE: db $B6, $42 ; [it],
#_1CE5E0: db $73 ; scroll text
#_1CE5E1: db $1A, $2C, $59, $BB, $27, $20, $59, $1A ; as⎵[lo]ng⎵a
#_1CE5E9: db $2C, $59, $D7, $2D, $59, $C9, $D2, $27 ; s⎵[tha]t⎵[per][so]n
#_1CE5F1: db $59, $25, $22, $2F, $1E, $2C, $43 ; ⎵lives…
#_1CE5F8: db $7E ; wait for key
#_1CE5F9: db $73 ; scroll text
#_1CE5FA: db $E5, $2D, $59, $B5, $59, $E1, $32, $59 ; [Tha]t⎵[is]⎵[wh]y⎵
#_1CE602: db $B6, $59, $DF, $2C, $59, $B0, $1D, $1D ; [it]⎵[wa]s⎵[hi]dd
#_1CE60A: db $A0, $B4 ; [en ][in]
#_1CE60C: db $73 ; scroll text
#_1CE60D: db $D8, $59, $06, $28, $25, $1D, $A0, $0B ; [the]⎵Gold[en ]L
#_1CE615: db $90, $41, $8A, $0E, $27, $B9, $1A, $59 ; [and].[  ]On[ly ]a⎵
#_1CE61D: db $D0, $25, $1E, $1C, $2D ; [se]lect
#_1CE622: db $73 ; scroll text
#_1CE623: db $1F, $1E, $30, $59, $24, $27, $1E, $30 ; few⎵knew
#_1CE62B: db $59, $C6, $59, $B6, $2C, $59, $BB, $1C ; ⎵[of]⎵[it]s⎵[lo]c
#_1CE633: db $94, $22, $C7, $42 ; [at]i[on],
#_1CE637: db $7E ; wait for key
#_1CE638: db $73 ; scroll text
#_1CE639: db $1B, $2E, $2D, $59, $91, $CF, $59, $29 ; but⎵[at ][some]⎵p
#_1CE641: db $28, $B4, $2D, $59, $D7, $2D ; o[in]t⎵[tha]t
#_1CE647: db $73 ; scroll text
#_1CE648: db $B8, $25, $1E, $1D, $20, $1E, $59, $DF ; [know]ledge⎵[wa]
#_1CE650: db $2C, $59, $BB, $D3, $43 ; s⎵[lo][st]…
#_1CE655: db $73 ; scroll text
#_1CE656: db $E6, $59, $C9, $D2, $27, $59, $E1, $28 ; [The]⎵[per][so]n⎵[wh]o
#_1CE65E: db $59, $CE, $9E, $2C, $1C, $28, $DD, $1E ; ⎵[re][di]sco[ver]e
#_1CE666: db $1D ; d
#_1CE667: db $7E ; wait for key
#_1CE668: db $73 ; scroll text
#_1CE669: db $D8, $59, $06, $28, $25, $1D, $A0, $0B ; [the]⎵Gold[en ]L
#_1CE671: db $8C, $DF, $2C ; [and ][wa]s
#_1CE674: db $73 ; scroll text
#_1CE675: db $06, $93, $C7, $9F, $2B, $1F, $59, $D8 ; G[an][on][do]rf⎵[the]
#_1CE67D: db $59, $A7, $22, $25, $59, $D9, $1E, $1F ; ⎵[ev]il⎵[thi]ef
#_1CE685: db $41 ; .
#_1CE686: db $73 ; scroll text
#_1CE687: db $0B, $2E, $9C, $22, $25, $32, $42, $59 ; Lu[ck]ily,⎵
#_1CE68F: db $21, $1E, $59, $1C, $28, $2E, $25, $1D ; he⎵could
#_1CE697: db $C0, $1F, $22, $20, $2E, $CD, $28, $2E ; [n't ]figu[re ]ou
#_1CE69F: db $2D ; t
#_1CE6A0: db $7E ; wait for key
#_1CE6A1: db $73 ; scroll text
#_1CE6A2: db $21, $28, $30, $59, $DA, $59, $CE, $2D ; how⎵[to]⎵[re]t
#_1CE6AA: db $2E, $2B, $27, $59, $DA, $59, $D8, $59 ; urn⎵[to]⎵[the]⎵
#_1CE6B2: db $0B, $22, $20, $21, $2D ; Light
#_1CE6B7: db $73 ; scroll text
#_1CE6B8: db $16, $C8, $25, $1D, $43 ; W[or]ld…
#_1CE6BD: db $73 ; scroll text
#_1CE6BE: db $43, $16, $1E, $25, $25, $42, $59, $CE ; …Well,⎵[re]
#_1CE6C6: db $BE, $26, $97, $2B, $59, $D7, $2D, $59 ; [me]m[be]r⎵[tha]t⎵
#_1CE6CE: db $E3 ; [you]
#_1CE6CF: db $7E ; wait for key
#_1CE6D0: db $73 ; scroll text
#_1CE6D1: db $AD, $59, $BD, $20, $22, $1C, $1A, $25 ; [have]⎵[ma]gical
#_1CE6D9: db $59, $CB, $A6, $2C, $42, $59, $E1, $22 ; ⎵[pow][er]s,⎵[wh]i
#_1CE6E1: db $1C, $21, $59, $C7, $25, $32 ; ch⎵[on]ly
#_1CE6E7: db $73 ; scroll text
#_1CE6E8: db $E6, $59, $E4, $28, $59, $99, $BD, $24 ; [The]⎵[Her]o⎵[can ][ma]k
#_1CE6F0: db $1E, $59, $D8, $59, $26, $28, $D3, $59 ; e⎵[the]⎵mo[st]⎵
#_1CE6F8: db $C6, $3E ; [of]!
#_1CE6FA: db $73 ; scroll text
#_1CE6FB: db $E6, $CD, $8D, $CF, $59, $28, $D8, $2B ; [The][re ][are ][some]⎵o[the]r
#_1CE703: db $59, $BD, $20, $22, $1C, $1A, $25 ; ⎵[ma]gical
#_1CE70A: db $7E ; wait for key
#_1CE70B: db $73 ; scroll text
#_1CE70C: db $DF, $2B, $29, $B3, $29, $28, $B4, $2D ; [wa]rp[ing ]po[in]t
#_1CE714: db $2C, $59, $25, $22, $24, $1E, $59, $D8 ; s⎵like⎵[the]
#_1CE71C: db $59, $C7, $1E, $59, $E3 ; ⎵[on]e⎵[you]
#_1CE721: db $73 ; scroll text
#_1CE722: db $2C, $1A, $30, $59, $C7, $59, $03, $1E ; saw⎵[on]⎵De
#_1CE72A: db $94, $21, $59, $0C, $28, $2E, $27, $2D ; [at]h⎵Mount
#_1CE732: db $8F, $41 ; [ain].
#_1CE734: db $73 ; scroll text
#_1CE735: db $01, $32, $59, $2E, $2C, $B3, $D8, $26 ; By⎵us[ing ][the]m
#_1CE73D: db $59, $E3, $59, $99, $AC ; ⎵[you]⎵[can ][go]
#_1CE742: db $7E ; wait for key
#_1CE743: db $73 ; scroll text
#_1CE744: db $97, $2D, $E0, $A0, $D8, $59, $2D, $30 ; [be]t[we][en ][the]⎵tw
#_1CE74C: db $28, $59, $30, $C8, $25, $1D, $2C, $59 ; o⎵w[or]lds⎵
#_1CE754: db $90 ; [and]
#_1CE755: db $73 ; scroll text
#_1CE756: db $1F, $B4, $1D, $59, $D8, $59, $A7, $22 ; f[in]d⎵[the]⎵[ev]i
#_1CE75E: db $25, $2C, $59, $B0, $1D, $1D, $A0, $B4 ; ls⎵[hi]dd[en ][in]
#_1CE766: db $59, $D8 ; ⎵[the]
#_1CE768: db $73 ; scroll text
#_1CE769: db $03, $1A, $2B, $24, $59, $16, $C8, $25 ; Dark⎵W[or]l
#_1CE771: db $1D, $41, $8A, $E8, $59, $8D, $D8, $59 ; d.[  ][You]⎵[are ][the]⎵
#_1CE779: db $C7, $25, $32 ; [on]ly
#_1CE77C: db $7E ; wait for key
#_1CE77D: db $73 ; scroll text
#_1CE77E: db $C7, $1E, $59, $E1, $28, $59, $99, $9D ; [on]e⎵[wh]o⎵[can ][des]
#_1CE786: db $DB, $28, $32 ; [tr]oy
#_1CE789: db $73 ; scroll text
#_1CE78A: db $06, $93, $C7, $9F, $2B, $1F, $42, $59 ; G[an][on][do]rf,⎵
#_1CE792: db $D8, $59, $D9, $1E, $1F, $40, $27, $28 ; [the]⎵[thi]ef-no
#_1CE79A: db $42 ; ,
#_1CE79B: db $73 ; scroll text
#_1CE79C: db $06, $93, $C7, $42, $59, $D8, $59, $A7 ; G[an][on],⎵[the]⎵[ev]
#_1CE7A4: db $22, $25, $59, $0A, $B3, $0E, $1F ; il⎵K[ing ]Of
#_1CE7AB: db $7E ; wait for key
#_1CE7AC: db $73 ; scroll text
#_1CE7AD: db $03, $1A, $2B, $24, $27, $1E, $2C, $2C ; Darkness
#_1CE7B5: db $3E ; !
#_1CE7B6: db $7F ; end of message

;===================================================================================================
; [LINK], because of you, I can
; escape from the clutches of
; the evil monsters.  Thank you!
; …Do you know the prophecy of
; the Great Cataclysm?
; This is the way I heard it…
; If a person who has an evil
; heart gets the Triforce, a Hero
; is destined to appear…
; …and he alone must face the
; person who began the Great
; Cataclysm.
; If the evil one destroys the
; Hero, nothing can save the
; world from his wicked reign.
; Only a person of the Knights Of
; Hyrule, who protected the
; royalty of Hylia, can become
; the Hero…  You are of their
; blood-line, aren't you?  Then
; you must rescue
; Zelda without fail.
;---------------------------------------------------------------------------------------------------
Message_0134:
#_1CE7B7: db $7A, $02 ; set draw speed
#_1CE7B9: db $6D, $01 ; set window position
#_1CE7BB: db $6B, $02 ; set window border
#_1CE7BD: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CE7C5: db $59, $C6, $59, $E3, $42, $59, $08, $59 ; ⎵[of]⎵[you],⎵I⎵
#_1CE7CD: db $1C, $93 ; c[an]
#_1CE7CF: db $75 ; line 2
#_1CE7D0: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CE7D8: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CE7E0: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CE7E4: db $76 ; line 3
#_1CE7E5: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CE7ED: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CE7F5: db $59, $E3, $3E ; ⎵[you]!
#_1CE7F8: db $7E ; wait for key
#_1CE7F9: db $73 ; scroll text
#_1CE7FA: db $43, $03, $28, $59, $E3, $59, $B8, $59 ; …Do⎵[you]⎵[know]⎵
#_1CE802: db $D8, $59, $CC, $29, $21, $1E, $1C, $32 ; [the]⎵[pro]phecy
#_1CE80A: db $59, $C6 ; ⎵[of]
#_1CE80C: db $73 ; scroll text
#_1CE80D: db $D8, $59, $06, $CE, $91, $02, $94, $1A ; [the]⎵G[re][at ]C[at]a
#_1CE815: db $1C, $25, $32, $2C, $26, $3F ; clysm?
#_1CE81B: db $73 ; scroll text
#_1CE81C: db $E7, $2C, $59, $B5, $59, $D8, $59, $DF ; [Thi]s⎵[is]⎵[the]⎵[wa]
#_1CE824: db $32, $59, $08, $59, $21, $A2, $1D, $59 ; y⎵I⎵h[ear]d⎵
#_1CE82C: db $B6, $43 ; [it]…
#_1CE82E: db $7E ; wait for key
#_1CE82F: db $73 ; scroll text
#_1CE830: db $08, $1F, $59, $1A, $59, $C9, $D2, $27 ; If⎵a⎵[per][so]n
#_1CE838: db $59, $E1, $28, $59, $AE, $59, $93, $59 ; ⎵[wh]o⎵[has]⎵[an]⎵
#_1CE840: db $A7, $22, $25 ; [ev]il
#_1CE843: db $73 ; scroll text
#_1CE844: db $21, $A2, $2D, $59, $AB, $2C, $59, $D8 ; h[ear]t⎵[get]s⎵[the]
#_1CE84C: db $59, $13, $2B, $22, $A8, $1C, $1E, $42 ; ⎵Tri[for]ce,
#_1CE854: db $59, $1A, $59, $E4, $28 ; ⎵a⎵[Her]o
#_1CE859: db $73 ; scroll text
#_1CE85A: db $B5, $59, $9D, $2D, $B4, $A4, $DA, $59 ; [is]⎵[des]t[in][ed ][to]⎵
#_1CE862: db $1A, $29, $29, $A2, $43 ; app[ear]…
#_1CE867: db $7E ; wait for key
#_1CE868: db $73 ; scroll text
#_1CE869: db $43, $8C, $21, $1E, $59, $1A, $BB, $27 ; …[and ]he⎵a[lo]n
#_1CE871: db $1E, $59, $BF, $D3, $59, $1F, $1A, $1C ; e⎵[mu][st]⎵fac
#_1CE879: db $1E, $59, $D8 ; e⎵[the]
#_1CE87C: db $73 ; scroll text
#_1CE87D: db $C9, $D2, $27, $59, $E1, $28, $59, $97 ; [per][so]n⎵[wh]o⎵[be]
#_1CE885: db $20, $93, $59, $D8, $59, $06, $CE, $94 ; g[an]⎵[the]⎵G[re][at]
#_1CE88D: db $73 ; scroll text
#_1CE88E: db $02, $94, $1A, $1C, $25, $32, $2C, $26 ; C[at]aclysm
#_1CE896: db $41 ; .
#_1CE897: db $7E ; wait for key
#_1CE898: db $73 ; scroll text
#_1CE899: db $08, $1F, $59, $D8, $59, $A7, $22, $25 ; If⎵[the]⎵[ev]il
#_1CE8A1: db $59, $C7, $1E, $59, $9D, $DB, $28, $32 ; ⎵[on]e⎵[des][tr]oy
#_1CE8A9: db $2C, $59, $D8 ; s⎵[the]
#_1CE8AC: db $73 ; scroll text
#_1CE8AD: db $E4, $28, $42, $59, $C2, $B0, $27, $20 ; [Her]o,⎵[not][hi]ng
#_1CE8B5: db $59, $99, $2C, $1A, $2F, $1E, $59, $D8 ; ⎵[can ]save⎵[the]
#_1CE8BD: db $73 ; scroll text
#_1CE8BE: db $30, $C8, $25, $1D, $59, $A9, $26, $59 ; w[or]ld⎵[fro]m⎵
#_1CE8C6: db $B0, $2C, $59, $E2, $9C, $A4, $CE, $22 ; [hi]s⎵[wi][ck][ed ][re]i
#_1CE8CE: db $20, $27, $41 ; gn.
#_1CE8D1: db $7E ; wait for key
#_1CE8D2: db $73 ; scroll text
#_1CE8D3: db $0E, $27, $B9, $1A, $59, $C9, $D2, $27 ; On[ly ]a⎵[per][so]n
#_1CE8DB: db $59, $C6, $59, $D8, $59, $0A, $27, $22 ; ⎵[of]⎵[the]⎵Kni
#_1CE8E3: db $20, $21, $2D, $2C, $59, $0E, $1F ; ghts⎵Of
#_1CE8EA: db $73 ; scroll text
#_1CE8EB: db $07, $32, $2B, $2E, $25, $1E, $42, $59 ; Hyrule,⎵
#_1CE8F3: db $E1, $28, $59, $CC, $2D, $1E, $1C, $2D ; [wh]o⎵[pro]tect
#_1CE8FB: db $A4, $D8 ; [ed ][the]
#_1CE8FD: db $73 ; scroll text
#_1CE8FE: db $2B, $28, $32, $1A, $25, $2D, $32, $59 ; royalty⎵
#_1CE906: db $C6, $59, $07, $32, $25, $22, $1A, $42 ; [of]⎵Hylia,
#_1CE90E: db $59, $99, $97, $9B, $1E ; ⎵[can ][be][com]e
#_1CE913: db $7E ; wait for key
#_1CE914: db $73 ; scroll text
#_1CE915: db $D8, $59, $E4, $28, $43, $8A, $E8, $59 ; [the]⎵[Her]o…[  ][You]⎵
#_1CE91D: db $8D, $C6, $59, $D8, $22, $2B ; [are ][of]⎵[the]ir
#_1CE923: db $73 ; scroll text
#_1CE924: db $1B, $BB, $28, $1D, $40, $25, $B4, $1E ; b[lo]od-l[in]e
#_1CE92C: db $42, $59, $1A, $CE, $C0, $E3, $3F, $8A ; ,⎵a[re][n't ][you]?[  ]
#_1CE934: db $E6, $27 ; [The]n
#_1CE936: db $73 ; scroll text
#_1CE937: db $E3, $59, $BF, $D3, $59, $CE, $2C, $1C ; [you]⎵[mu][st]⎵[re]sc
#_1CE93F: db $2E, $1E ; ue
#_1CE941: db $7E ; wait for key
#_1CE942: db $73 ; scroll text
#_1CE943: db $19, $1E, $25, $1D, $1A, $59, $DE, $C5 ; Zelda⎵[with][out ]
#_1CE94B: db $1F, $1A, $22, $25, $41 ; fail.
#_1CE950: db $7F ; end of message

;===================================================================================================
; [LINK], because of you, I can
; escape from the clutches of
; the evil monsters.  Thank you!
; As the wise men sealed the way
; to the Dark World, the Knights
; Of Hyrule defended them from
; the attacks of evil monsters.
; I heard that the Knights Of
; Hyrule were nearly wiped out in
; that battle…
; You are perhaps the last one
; to carry on the blood-line of
; the Knights…
; It is ironic that the last one in
; the line has the potential to
; become the Hero of legend.
; Surely you can destroy Ganon!
;---------------------------------------------------------------------------------------------------
Message_0135:
#_1CE951: db $7A, $02 ; set draw speed
#_1CE953: db $6D, $01 ; set window position
#_1CE955: db $6B, $02 ; set window border
#_1CE957: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CE95F: db $59, $C6, $59, $E3, $42, $59, $08, $59 ; ⎵[of]⎵[you],⎵I⎵
#_1CE967: db $1C, $93 ; c[an]
#_1CE969: db $75 ; line 2
#_1CE96A: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CE972: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CE97A: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CE97E: db $76 ; line 3
#_1CE97F: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CE987: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CE98F: db $59, $E3, $3E ; ⎵[you]!
#_1CE992: db $7E ; wait for key
#_1CE993: db $73 ; scroll text
#_1CE994: db $00, $2C, $59, $D8, $59, $E2, $D0, $59 ; As⎵[the]⎵[wi][se]⎵
#_1CE99C: db $BE, $27, $59, $D0, $1A, $25, $A4, $D8 ; [me]n⎵[se]al[ed ][the]
#_1CE9A4: db $59, $DF, $32 ; ⎵[wa]y
#_1CE9A7: db $73 ; scroll text
#_1CE9A8: db $DA, $59, $D8, $59, $03, $1A, $2B, $24 ; [to]⎵[the]⎵Dark
#_1CE9B0: db $59, $16, $C8, $25, $1D, $42, $59, $D8 ; ⎵W[or]ld,⎵[the]
#_1CE9B8: db $59, $0A, $27, $22, $20, $21, $2D, $2C ; ⎵Knights
#_1CE9C0: db $73 ; scroll text
#_1CE9C1: db $0E, $1F, $59, $07, $32, $2B, $2E, $25 ; Of⎵Hyrul
#_1CE9C9: db $1E, $59, $1D, $1E, $1F, $A5, $1D, $A4 ; e⎵def[en]d[ed ]
#_1CE9D1: db $D8, $26, $59, $A9, $26 ; [the]m⎵[fro]m
#_1CE9D6: db $7E ; wait for key
#_1CE9D7: db $73 ; scroll text
#_1CE9D8: db $D8, $59, $94, $2D, $1A, $9C, $2C, $59 ; [the]⎵[at]ta[ck]s⎵
#_1CE9E0: db $C6, $59, $A7, $22, $25, $59, $26, $C7 ; [of]⎵[ev]il⎵m[on]
#_1CE9E8: db $D3, $A6, $2C, $41 ; [st][er]s.
#_1CE9EC: db $7E ; wait for key
#_1CE9ED: db $73 ; scroll text
#_1CE9EE: db $08, $59, $21, $A2, $1D, $59, $D7, $2D ; I⎵h[ear]d⎵[tha]t
#_1CE9F6: db $59, $D8, $59, $0A, $27, $22, $20, $21 ; ⎵[the]⎵Knigh
#_1CE9FE: db $2D, $2C, $59, $0E, $1F ; ts⎵Of
#_1CEA03: db $73 ; scroll text
#_1CEA04: db $07, $32, $2B, $2E, $25, $1E, $59, $E0 ; Hyrule⎵[we]
#_1CEA0C: db $CD, $27, $A2, $B9, $E2, $29, $A4, $C5 ; [re ]n[ear][ly ][wi]p[ed ][out ]
#_1CEA14: db $B4 ; [in]
#_1CEA15: db $73 ; scroll text
#_1CEA16: db $D7, $2D, $59, $96, $2D, $2D, $25, $1E ; [tha]t⎵[ba]ttle
#_1CEA1E: db $43 ; …
#_1CEA1F: db $7E ; wait for key
#_1CEA20: db $73 ; scroll text
#_1CEA21: db $E8, $59, $8D, $C9, $B1, $29, $2C, $59 ; [You]⎵[are ][per][ha]ps⎵
#_1CEA29: db $D8, $59, $BA, $D3, $59, $C7, $1E ; [the]⎵[la][st]⎵[on]e
#_1CEA30: db $73 ; scroll text
#_1CEA31: db $DA, $59, $1C, $1A, $2B, $2B, $32, $59 ; [to]⎵carry⎵
#_1CEA39: db $C7, $59, $D8, $59, $1B, $BB, $28, $1D ; [on]⎵[the]⎵b[lo]od
#_1CEA41: db $40, $25, $B4, $1E, $59, $C6 ; -l[in]e⎵[of]
#_1CEA47: db $73 ; scroll text
#_1CEA48: db $D8, $59, $0A, $27, $22, $20, $21, $2D ; [the]⎵Knight
#_1CEA50: db $2C, $43 ; s…
#_1CEA52: db $7E ; wait for key
#_1CEA53: db $73 ; scroll text
#_1CEA54: db $08, $2D, $59, $B5, $59, $22, $2B, $C7 ; It⎵[is]⎵ir[on]
#_1CEA5C: db $22, $1C, $59, $D7, $2D, $59, $D8, $59 ; ic⎵[tha]t⎵[the]⎵
#_1CEA64: db $BA, $D3, $59, $C7, $1E, $59, $B4 ; [la][st]⎵[on]e⎵[in]
#_1CEA6B: db $73 ; scroll text
#_1CEA6C: db $D8, $59, $25, $B4, $1E, $59, $AE, $59 ; [the]⎵l[in]e⎵[has]⎵
#_1CEA74: db $D8, $59, $29, $28, $2D, $A3, $22, $1A ; [the]⎵pot[ent]ia
#_1CEA7C: db $25, $59, $DA ; l⎵[to]
#_1CEA7F: db $73 ; scroll text
#_1CEA80: db $97, $9B, $1E, $59, $D8, $59, $E4, $28 ; [be][com]e⎵[the]⎵[Her]o
#_1CEA88: db $59, $C6, $59, $25, $1E, $20, $A5, $1D ; ⎵[of]⎵leg[en]d
#_1CEA90: db $41 ; .
#_1CEA91: db $7E ; wait for key
#_1CEA92: db $73 ; scroll text
#_1CEA93: db $12, $2E, $CE, $B9, $E3, $59, $99, $9D ; Su[re][ly ][you]⎵[can ][des]
#_1CEA9B: db $DB, $28, $32, $59, $06, $93, $C7, $3E ; [tr]oy⎵G[an][on]!
#_1CEAA3: db $7F ; end of message

;===================================================================================================
; [LINK], because of you, I can
; escape from the clutches of
; the evil monsters.  Thank you!
; They say the Hylia people
; controlled mysterious powers,
; as did the seven wise men.
; But the blood of the Hylia has
; become thin over time.  We who
; carry the blood of the seven
; wise men do not possess strong
; power any more, either.
; Our powers will increase if we
; mix the courage of the Knights
; with the wisdom of the wise
; men.  Only a short time remains
; until the gate at the castle
; linking the worlds opens
; completely.  If you defeat
; Ganon, this world will vanish
; and the Triforce will wait for
; a new holder.
; I believe in you…
; Good luck!
;---------------------------------------------------------------------------------------------------
Message_0136:
#_1CEAA4: db $7A, $02 ; set draw speed
#_1CEAA6: db $6D, $01 ; set window position
#_1CEAA8: db $6B, $02 ; set window border
#_1CEAAA: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CEAB2: db $59, $C6, $59, $E3, $42, $59, $08, $59 ; ⎵[of]⎵[you],⎵I⎵
#_1CEABA: db $1C, $93 ; c[an]
#_1CEABC: db $75 ; line 2
#_1CEABD: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CEAC5: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CEACD: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CEAD1: db $76 ; line 3
#_1CEAD2: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CEADA: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CEAE2: db $59, $E3, $3E ; ⎵[you]!
#_1CEAE5: db $7E ; wait for key
#_1CEAE6: db $73 ; scroll text
#_1CEAE7: db $E6, $32, $59, $2C, $1A, $32, $59, $D8 ; [The]y⎵say⎵[the]
#_1CEAEF: db $59, $07, $32, $25, $22, $1A, $59, $29 ; ⎵Hylia⎵p
#_1CEAF7: db $1E, $28, $CA ; eo[ple]
#_1CEAFA: db $73 ; scroll text
#_1CEAFB: db $1C, $C7, $DB, $28, $25, $25, $A4, $26 ; c[on][tr]oll[ed ]m
#_1CEB03: db $32, $D3, $A6, $22, $28, $2E, $2C, $59 ; y[st][er]ious⎵
#_1CEB0B: db $CB, $A6, $2C, $42 ; [pow][er]s,
#_1CEB0F: db $73 ; scroll text
#_1CEB10: db $1A, $2C, $59, $9E, $1D, $59, $D8, $59 ; as⎵[di]d⎵[the]⎵
#_1CEB18: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1CEB20: db $41 ; .
#_1CEB21: db $7E ; wait for key
#_1CEB22: db $73 ; scroll text
#_1CEB23: db $01, $2E, $2D, $59, $D8, $59, $1B, $BB ; But⎵[the]⎵b[lo]
#_1CEB2B: db $28, $1D, $59, $C6, $59, $D8, $59, $07 ; od⎵[of]⎵[the]⎵H
#_1CEB33: db $32, $25, $22, $1A, $59, $AE ; ylia⎵[has]
#_1CEB39: db $73 ; scroll text
#_1CEB3A: db $97, $9B, $1E, $59, $D5, $59, $28, $DD ; [be][com]e⎵[thin]⎵o[ver]
#_1CEB42: db $59, $2D, $22, $BE, $41, $8A, $16, $1E ; ⎵ti[me].[  ]We
#_1CEB4A: db $59, $E1, $28 ; ⎵[wh]o
#_1CEB4D: db $73 ; scroll text
#_1CEB4E: db $1C, $1A, $2B, $2B, $32, $59, $D8, $59 ; carry⎵[the]⎵
#_1CEB56: db $1B, $BB, $28, $1D, $59, $C6, $59, $D8 ; b[lo]od⎵[of]⎵[the]
#_1CEB5E: db $59, $D0, $2F, $A5 ; ⎵[se]v[en]
#_1CEB62: db $7E ; wait for key
#_1CEB63: db $73 ; scroll text
#_1CEB64: db $E2, $D0, $59, $BE, $27, $59, $9F, $59 ; [wi][se]⎵[me]n⎵[do]⎵
#_1CEB6C: db $C2, $59, $29, $28, $2C, $D0, $2C, $2C ; [not]⎵pos[se]ss
#_1CEB74: db $59, $D3, $2B, $C7, $20 ; ⎵[st]r[on]g
#_1CEB79: db $73 ; scroll text
#_1CEB7A: db $CB, $A1, $93, $32, $59, $26, $C8, $1E ; [pow][er ][an]y⎵m[or]e
#_1CEB82: db $42, $59, $1E, $B6, $AF, $41 ; ,⎵e[it][her].
#_1CEB88: db $7E ; wait for key
#_1CEB89: db $73 ; scroll text
#_1CEB8A: db $0E, $2E, $2B, $59, $CB, $A6, $2C, $59 ; Our⎵[pow][er]s⎵
#_1CEB92: db $E2, $25, $25, $59, $B4, $1C, $CE, $1A ; [wi]ll⎵[in]c[re]a
#_1CEB9A: db $D0, $59, $22, $1F, $59, $E0 ; [se]⎵if⎵[we]
#_1CEBA0: db $73 ; scroll text
#_1CEBA1: db $26, $22, $31, $59, $D8, $59, $1C, $28 ; mix⎵[the]⎵co
#_1CEBA9: db $2E, $2B, $1A, $20, $1E, $59, $C6, $59 ; urage⎵[of]⎵
#_1CEBB1: db $D8, $59, $0A, $27, $22, $20, $21, $2D ; [the]⎵Knight
#_1CEBB9: db $2C ; s
#_1CEBBA: db $73 ; scroll text
#_1CEBBB: db $DE, $59, $D8, $59, $E2, $2C, $9F, $26 ; [with]⎵[the]⎵[wi]s[do]m
#_1CEBC3: db $59, $C6, $59, $D8, $59, $E2, $D0 ; ⎵[of]⎵[the]⎵[wi][se]
#_1CEBCA: db $7E ; wait for key
#_1CEBCB: db $73 ; scroll text
#_1CEBCC: db $BE, $27, $41, $8A, $0E, $27, $B9, $1A ; [me]n.[  ]On[ly ]a
#_1CEBD4: db $59, $D1, $C8, $2D, $59, $2D, $22, $BE ; ⎵[sh][or]t⎵ti[me]
#_1CEBDC: db $59, $CE, $BD, $B4, $2C ; ⎵[re][ma][in]s
#_1CEBE1: db $73 ; scroll text
#_1CEBE2: db $2E, $27, $2D, $22, $25, $59, $D8, $59 ; until⎵[the]⎵
#_1CEBEA: db $20, $94, $1E, $59, $91, $D8, $59, $1C ; g[at]e⎵[at ][the]⎵c
#_1CEBF2: db $92, $25, $1E ; [ast]le
#_1CEBF5: db $73 ; scroll text
#_1CEBF6: db $25, $B4, $24, $B3, $D8, $59, $30, $C8 ; l[in]k[ing ][the]⎵w[or]
#_1CEBFE: db $25, $1D, $2C, $59, $C3, $2C ; lds⎵[open]s
#_1CEC04: db $7E ; wait for key
#_1CEC05: db $73 ; scroll text
#_1CEC06: db $9B, $CA, $2D, $1E, $25, $32, $41, $8A ; [com][ple]tely.[  ]
#_1CEC0E: db $08, $1F, $59, $E3, $59, $1D, $1E, $1F ; If⎵[you]⎵def
#_1CEC16: db $1E, $94 ; e[at]
#_1CEC18: db $73 ; scroll text
#_1CEC19: db $06, $93, $C7, $42, $59, $D9, $2C, $59 ; G[an][on],⎵[thi]s⎵
#_1CEC21: db $30, $C8, $25, $1D, $59, $E2, $25, $25 ; w[or]ld⎵[wi]ll
#_1CEC29: db $59, $2F, $93, $B5, $21 ; ⎵v[an][is]h
#_1CEC2E: db $73 ; scroll text
#_1CEC2F: db $8C, $D8, $59, $13, $2B, $22, $A8, $1C ; [and ][the]⎵Tri[for]c
#_1CEC37: db $1E, $59, $E2, $25, $25, $59, $DF, $B6 ; e⎵[wi]ll⎵[wa][it]
#_1CEC3F: db $59, $A8 ; ⎵[for]
#_1CEC41: db $7E ; wait for key
#_1CEC42: db $73 ; scroll text
#_1CEC43: db $1A, $59, $27, $1E, $30, $59, $21, $28 ; a⎵new⎵ho
#_1CEC4B: db $25, $1D, $A6, $41 ; ld[er].
#_1CEC4F: db $73 ; scroll text
#_1CEC50: db $08, $59, $97, $25, $22, $A7, $1E, $59 ; I⎵[be]li[ev]e⎵
#_1CEC58: db $B4, $59, $E3, $43 ; [in]⎵[you]…
#_1CEC5C: db $73 ; scroll text
#_1CEC5D: db $06, $28, $28, $1D, $59, $25, $2E, $9C ; Good⎵lu[ck]
#_1CEC65: db $3E ; !
#_1CEC66: db $7F ; end of message

;===================================================================================================
; [LINK], because of you, I can
; escape from the clutches of
; the evil monsters.  Thank you!
; Ganon captured us because he
; couldn't break the seal of the
; wise men with his power alone.
; And then, using the wizard
; Agahnim as his pawn, he drew us
; to the Dark World.
; After cracking the seal with
; our powers, he sealed us inside
; of these crystals.
; He then gave us to his loyal
; monsters.  But Ganon didn't
; plan on your getting this far.
; Now, Princess Zelda is waiting
; for you inside of Turtle Rock.
; Please hurry!
;---------------------------------------------------------------------------------------------------
Message_0137:
#_1CEC67: db $7A, $02 ; set draw speed
#_1CEC69: db $6D, $01 ; set window position
#_1CEC6B: db $6B, $02 ; set window border
#_1CEC6D: db $6A, $42, $59, $97, $1C, $1A, $2E, $D0 ; [LINK],⎵[be]cau[se]
#_1CEC75: db $59, $C6, $59, $E3, $42, $59, $08, $59 ; ⎵[of]⎵[you],⎵I⎵
#_1CEC7D: db $1C, $93 ; c[an]
#_1CEC7F: db $75 ; line 2
#_1CEC80: db $1E, $2C, $1C, $1A, $29, $1E, $59, $A9 ; escape⎵[fro]
#_1CEC88: db $26, $59, $D8, $59, $1C, $25, $2E, $2D ; m⎵[the]⎵clut
#_1CEC90: db $9A, $2C, $59, $C6 ; [che]s⎵[of]
#_1CEC94: db $76 ; line 3
#_1CEC95: db $D8, $59, $A7, $22, $25, $59, $26, $C7 ; [the]⎵[ev]il⎵m[on]
#_1CEC9D: db $D3, $A6, $2C, $41, $8A, $E5, $27, $24 ; [st][er]s.[  ][Tha]nk
#_1CECA5: db $59, $E3, $3E ; ⎵[you]!
#_1CECA8: db $7E ; wait for key
#_1CECA9: db $73 ; scroll text
#_1CECAA: db $06, $93, $C7, $59, $1C, $1A, $29, $2D ; G[an][on]⎵capt
#_1CECB2: db $2E, $CE, $1D, $59, $2E, $2C, $59, $97 ; u[re]d⎵us⎵[be]
#_1CECBA: db $1C, $1A, $2E, $D0, $59, $21, $1E ; cau[se]⎵he
#_1CECC1: db $73 ; scroll text
#_1CECC2: db $1C, $28, $2E, $25, $1D, $C0, $1B, $CE ; could[n't ]b[re]
#_1CECCA: db $1A, $24, $59, $D8, $59, $D0, $1A, $25 ; ak⎵[the]⎵[se]al
#_1CECD2: db $59, $C6, $59, $D8 ; ⎵[of]⎵[the]
#_1CECD6: db $73 ; scroll text
#_1CECD7: db $E2, $D0, $59, $BE, $27, $59, $DE, $59 ; [wi][se]⎵[me]n⎵[with]⎵
#_1CECDF: db $B0, $2C, $59, $CB, $A1, $1A, $BB, $27 ; [hi]s⎵[pow][er ]a[lo]n
#_1CECE7: db $1E, $41 ; e.
#_1CECE9: db $7E ; wait for key
#_1CECEA: db $73 ; scroll text
#_1CECEB: db $00, $27, $1D, $59, $D8, $27, $42, $59 ; And⎵[the]n,⎵
#_1CECF3: db $2E, $2C, $B3, $D8, $59, $E2, $33, $1A ; us[ing ][the]⎵[wi]za
#_1CECFB: db $2B, $1D ; rd
#_1CECFD: db $73 ; scroll text
#_1CECFE: db $00, $20, $1A, $21, $27, $22, $26, $59 ; Agahnim⎵
#_1CED06: db $1A, $2C, $59, $B0, $2C, $59, $29, $1A ; as⎵[hi]s⎵pa
#_1CED0E: db $30, $27, $42, $59, $21, $1E, $59, $1D ; wn,⎵he⎵d
#_1CED16: db $CE, $30, $59, $2E, $2C ; [re]w⎵us
#_1CED1B: db $73 ; scroll text
#_1CED1C: db $DA, $59, $D8, $59, $03, $1A, $2B, $24 ; [to]⎵[the]⎵Dark
#_1CED24: db $59, $16, $C8, $25, $1D, $41 ; ⎵W[or]ld.
#_1CED2A: db $7E ; wait for key
#_1CED2B: db $73 ; scroll text
#_1CED2C: db $00, $1F, $D4, $1C, $2B, $1A, $9C, $B3 ; Af[ter ]cra[ck][ing ]
#_1CED34: db $D8, $59, $D0, $1A, $25, $59, $DE ; [the]⎵[se]al⎵[with]
#_1CED3B: db $73 ; scroll text
#_1CED3C: db $28, $2E, $2B, $59, $CB, $A6, $2C, $42 ; our⎵[pow][er]s,
#_1CED44: db $59, $21, $1E, $59, $D0, $1A, $25, $A4 ; ⎵he⎵[se]al[ed ]
#_1CED4C: db $2E, $2C, $59, $B4, $2C, $22, $1D, $1E ; us⎵[in]side
#_1CED54: db $73 ; scroll text
#_1CED55: db $C6, $59, $D8, $D0, $59, $1C, $2B, $32 ; [of]⎵[the][se]⎵cry
#_1CED5D: db $D3, $1A, $25, $2C, $41 ; [st]als.
#_1CED62: db $7E ; wait for key
#_1CED63: db $73 ; scroll text
#_1CED64: db $07, $1E, $59, $D8, $27, $59, $20, $1A ; He⎵[the]n⎵ga
#_1CED6C: db $2F, $1E, $59, $2E, $2C, $59, $DA, $59 ; ve⎵us⎵[to]⎵
#_1CED74: db $B0, $2C, $59, $BB, $32, $1A, $25 ; [hi]s⎵[lo]yal
#_1CED7B: db $73 ; scroll text
#_1CED7C: db $26, $C7, $D3, $A6, $2C, $41, $8A, $01 ; m[on][st][er]s.[  ]B
#_1CED84: db $2E, $2D, $59, $06, $93, $C7, $59, $9E ; ut⎵G[an][on]⎵[di]
#_1CED8C: db $1D, $27, $51, $2D ; dn't
#_1CED90: db $73 ; scroll text
#_1CED91: db $29, $BA, $27, $59, $C7, $59, $E3, $2B ; p[la]n⎵[on]⎵[you]r
#_1CED99: db $59, $AB, $2D, $B3, $D9, $2C, $59, $1F ; ⎵[get]t[ing ][thi]s⎵f
#_1CEDA1: db $1A, $2B, $41 ; ar.
#_1CEDA4: db $7E ; wait for key
#_1CEDA5: db $73 ; scroll text
#_1CEDA6: db $0D, $28, $30, $42, $59, $0F, $2B, $B4 ; Now,⎵Pr[in]
#_1CEDAE: db $1C, $1E, $2C, $2C, $59, $19, $1E, $25 ; cess⎵Zel
#_1CEDB6: db $1D, $1A, $59, $B5, $59, $DF, $B6, $B4 ; da⎵[is]⎵[wa][it][in]
#_1CEDBE: db $20 ; g
#_1CEDBF: db $73 ; scroll text
#_1CEDC0: db $A8, $59, $E3, $59, $B4, $2C, $22, $1D ; [for]⎵[you]⎵[in]sid
#_1CEDC8: db $1E, $59, $C6, $59, $13, $2E, $2B, $2D ; e⎵[of]⎵Turt
#_1CEDD0: db $25, $1E, $59, $11, $28, $9C, $41 ; le⎵Ro[ck].
#_1CEDD7: db $73 ; scroll text
#_1CEDD8: db $0F, $25, $1E, $1A, $D0, $59, $21, $2E ; Plea[se]⎵hu
#_1CEDE0: db $2B, $2B, $32, $3E ; rry!
#_1CEDE4: db $7F ; end of message

;===================================================================================================
; I appreciate your coming so far
; to rescue me.  As I thought,
; you are the legendary Hero.
; I have felt this from the first
; time we met.
; …  …  …
; Ganon is waiting inside of his
; tower to pass through the
; gate linking the two worlds.
; Once Ganon enters the Light
; World, it is unlikely that
; anyone can stop him.
; But if he stays in the closed
; space of this world, you can
; find him wherever he runs.
; Now, go to the Tower Of
; Ganon!  We will use our
; combined powers to break the
; barrier.  Let's return peace to
; the country without fail…
; …  …  …
;---------------------------------------------------------------------------------------------------
Message_0138:
#_1CEDE5: db $7A, $02 ; set draw speed
#_1CEDE7: db $6D, $01 ; set window position
#_1CEDE9: db $6B, $02 ; set window border
#_1CEDEB: db $08, $59, $1A, $29, $29, $CE, $1C, $22 ; I⎵app[re]ci
#_1CEDF3: db $94, $1E, $59, $E3, $2B, $59, $9B, $B3 ; [at]e⎵[you]r⎵[com][ing ]
#_1CEDFB: db $D2, $59, $1F, $1A, $2B ; [so]⎵far
#_1CEE00: db $75 ; line 2
#_1CEE01: db $DA, $59, $CE, $2C, $1C, $2E, $1E, $59 ; [to]⎵[re]scue⎵
#_1CEE09: db $BE, $41, $8A, $00, $2C, $59, $08, $59 ; [me].[  ]As⎵I⎵
#_1CEE11: db $2D, $21, $28, $2E, $20, $21, $2D, $42 ; thought,
#_1CEE19: db $76 ; line 3
#_1CEE1A: db $E3, $59, $8D, $D8, $59, $25, $1E, $20 ; [you]⎵[are ][the]⎵leg
#_1CEE22: db $A5, $1D, $1A, $2B, $32, $59, $E4, $28 ; [en]dary⎵[Her]o
#_1CEE2A: db $41 ; .
#_1CEE2B: db $7E ; wait for key
#_1CEE2C: db $73 ; scroll text
#_1CEE2D: db $08, $59, $AD, $59, $1F, $1E, $25, $2D ; I⎵[have]⎵felt
#_1CEE35: db $59, $D9, $2C, $59, $A9, $26, $59, $D8 ; ⎵[thi]s⎵[fro]m⎵[the]
#_1CEE3D: db $59, $1F, $22, $2B, $D3 ; ⎵fir[st]
#_1CEE42: db $73 ; scroll text
#_1CEE43: db $2D, $22, $BE, $59, $E0, $59, $BE, $2D ; ti[me]⎵[we]⎵[me]t
#_1CEE4B: db $41 ; .
#_1CEE4C: db $73 ; scroll text
#_1CEE4D: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CEE52: db $7E ; wait for key
#_1CEE53: db $73 ; scroll text
#_1CEE54: db $06, $93, $C7, $59, $B5, $59, $DF, $B6 ; G[an][on]⎵[is]⎵[wa][it]
#_1CEE5C: db $B3, $B4, $2C, $22, $1D, $1E, $59, $C6 ; [ing ][in]side⎵[of]
#_1CEE64: db $59, $B0, $2C ; ⎵[hi]s
#_1CEE67: db $73 ; scroll text
#_1CEE68: db $DA, $E0, $2B, $59, $DA, $59, $29, $1A ; [to][we]r⎵[to]⎵pa
#_1CEE70: db $2C, $2C, $59, $2D, $21, $2B, $28, $2E ; ss⎵throu
#_1CEE78: db $20, $21, $59, $D8 ; gh⎵[the]
#_1CEE7C: db $73 ; scroll text
#_1CEE7D: db $20, $94, $1E, $59, $25, $B4, $24, $B3 ; g[at]e⎵l[in]k[ing ]
#_1CEE85: db $D8, $59, $2D, $30, $28, $59, $30, $C8 ; [the]⎵two⎵w[or]
#_1CEE8D: db $25, $1D, $2C, $41 ; lds.
#_1CEE91: db $7E ; wait for key
#_1CEE92: db $73 ; scroll text
#_1CEE93: db $0E, $27, $1C, $1E, $59, $06, $93, $C7 ; Once⎵G[an][on]
#_1CEE9B: db $59, $A3, $A6, $2C, $59, $D8, $59, $0B ; ⎵[ent][er]s⎵[the]⎵L
#_1CEEA3: db $22, $20, $21, $2D ; ight
#_1CEEA7: db $73 ; scroll text
#_1CEEA8: db $16, $C8, $25, $1D, $42, $59, $B6, $59 ; W[or]ld,⎵[it]⎵
#_1CEEB0: db $B5, $59, $2E, $27, $25, $22, $24, $1E ; [is]⎵unlike
#_1CEEB8: db $B9, $D7, $2D ; [ly ][tha]t
#_1CEEBB: db $73 ; scroll text
#_1CEEBC: db $93, $32, $C7, $1E, $59, $99, $D3, $28 ; [an]y[on]e⎵[can ][st]o
#_1CEEC4: db $29, $59, $B0, $26, $41 ; p⎵[hi]m.
#_1CEEC9: db $7E ; wait for key
#_1CEECA: db $73 ; scroll text
#_1CEECB: db $01, $2E, $2D, $59, $22, $1F, $59, $21 ; But⎵if⎵h
#_1CEED3: db $1E, $59, $D3, $1A, $32, $2C, $59, $B4 ; e⎵[st]ays⎵[in]
#_1CEEDB: db $59, $D8, $59, $1C, $BB, $D0, $1D ; ⎵[the]⎵c[lo][se]d
#_1CEEE2: db $73 ; scroll text
#_1CEEE3: db $2C, $29, $1A, $1C, $1E, $59, $C6, $59 ; space⎵[of]⎵
#_1CEEEB: db $D9, $2C, $59, $30, $C8, $25, $1D, $42 ; [thi]s⎵w[or]ld,
#_1CEEF3: db $59, $E3, $59, $1C, $93 ; ⎵[you]⎵c[an]
#_1CEEF8: db $73 ; scroll text
#_1CEEF9: db $1F, $B4, $1D, $59, $B0, $26, $59, $E1 ; f[in]d⎵[hi]m⎵[wh]
#_1CEF01: db $A6, $A7, $A1, $21, $1E, $59, $2B, $2E ; [er][ev][er ]he⎵ru
#_1CEF09: db $27, $2C, $41 ; ns.
#_1CEF0C: db $7E ; wait for key
#_1CEF0D: db $73 ; scroll text
#_1CEF0E: db $0D, $28, $30, $42, $59, $AC, $59, $DA ; Now,⎵[go]⎵[to]
#_1CEF16: db $59, $D8, $59, $13, $28, $E0, $2B, $59 ; ⎵[the]⎵To[we]r⎵
#_1CEF1E: db $0E, $1F ; Of
#_1CEF20: db $73 ; scroll text
#_1CEF21: db $06, $93, $C7, $3E, $8A, $16, $1E, $59 ; G[an][on]![  ]We⎵
#_1CEF29: db $E2, $25, $25, $59, $2E, $D0, $59, $28 ; [wi]ll⎵u[se]⎵o
#_1CEF31: db $2E, $2B ; ur
#_1CEF33: db $73 ; scroll text
#_1CEF34: db $9B, $1B, $B4, $A4, $CB, $A6, $2C, $59 ; [com]b[in][ed ][pow][er]s⎵
#_1CEF3C: db $DA, $59, $1B, $CE, $1A, $24, $59, $D8 ; [to]⎵b[re]ak⎵[the]
#_1CEF44: db $7E ; wait for key
#_1CEF45: db $73 ; scroll text
#_1CEF46: db $96, $2B, $2B, $22, $A6, $41, $8A, $0B ; [ba]rri[er].[  ]L
#_1CEF4E: db $1E, $2D, $8B, $CE, $2D, $2E, $2B, $27 ; et['s ][re]turn
#_1CEF56: db $59, $29, $1E, $1A, $1C, $1E, $59, $DA ; ⎵peace⎵[to]
#_1CEF5E: db $73 ; scroll text
#_1CEF5F: db $D8, $59, $1C, $28, $2E, $27, $DB, $32 ; [the]⎵coun[tr]y
#_1CEF67: db $59, $DE, $C5, $1F, $1A, $22, $25, $43 ; ⎵[with][out ]fail…
#_1CEF6F: db $73 ; scroll text
#_1CEF70: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CEF75: db $79, $2D ; play sfx
#_1CEF77: db $7F ; end of message

;===================================================================================================
; May the way of the Hero lead
; to the Triforce.
;---------------------------------------------------------------------------------------------------
Message_0139:
#_1CEF78: db $7A, $02 ; set draw speed
#_1CEF7A: db $6D, $01 ; set window position
#_1CEF7C: db $6B, $02 ; set window border
#_1CEF7E: db $0C, $1A, $32, $59, $D8, $59, $DF, $32 ; May⎵[the]⎵[wa]y
#_1CEF86: db $59, $C6, $59, $D8, $59, $E4, $28, $59 ; ⎵[of]⎵[the]⎵[Her]o⎵
#_1CEF8E: db $25, $1E, $1A, $1D ; lead
#_1CEF92: db $75 ; line 2
#_1CEF93: db $DA, $59, $D8, $59, $13, $2B, $22, $A8 ; [to]⎵[the]⎵Tri[for]
#_1CEF9B: db $1C, $1E, $41 ; ce.
#_1CEF9E: db $7F ; end of message

;===================================================================================================
; Do you understand?
;     >  Yes
;         Not at all
;---------------------------------------------------------------------------------------------------
Message_013A:
#_1CEF9F: db $7A, $02 ; set draw speed
#_1CEFA1: db $6D, $01 ; set window position
#_1CEFA3: db $6B, $02 ; set window border
#_1CEFA5: db $03, $28, $59, $E3, $59, $2E, $27, $1D ; Do⎵[you]⎵und
#_1CEFAD: db $A6, $D3, $90, $3F ; [er][st][and]?
#_1CEFB1: db $75 ; line 2
#_1CEFB2: db $88, $44, $8A, $18, $1E, $2C ; [    ]>[  ]Yes
#_1CEFB8: db $76 ; line 3
#_1CEFB9: db $88, $88, $0D, $28, $2D, $59, $91, $1A ; [    ][    ]Not⎵[at ]a
#_1CEFC1: db $25, $25 ; ll
#_1CEFC3: db $68 ; choose 2 indented
#_1CEFC4: db $7F ; end of message

;===================================================================================================
; [LINK], we are going to break
; the barrier of Ganon's Tower
; with our power.
;---------------------------------------------------------------------------------------------------
Message_013B:
#_1CEFC5: db $6A, $42, $59, $E0, $59, $8D, $AC, $B3 ; [LINK],⎵[we]⎵[are ][go][ing ]
#_1CEFCD: db $DA, $59, $1B, $CE, $1A, $24 ; [to]⎵b[re]ak
#_1CEFD3: db $75 ; line 2
#_1CEFD4: db $D8, $59, $96, $2B, $2B, $22, $A1, $C6 ; [the]⎵[ba]rri[er ][of]
#_1CEFDC: db $59, $06, $93, $C7, $8B, $13, $28, $E0 ; ⎵G[an][on]['s ]To[we]
#_1CEFE4: db $2B ; r
#_1CEFE5: db $76 ; line 3
#_1CEFE6: db $DE, $59, $28, $2E, $2B, $59, $CB, $A6 ; [with]⎵our⎵[pow][er]
#_1CEFEE: db $41 ; .
#_1CEFEF: db $7F ; end of message

;===================================================================================================
; I appreciate your coming so far
; to rescue me.  As I thought,
; you are the legendary Hero.
; I have felt this from the first
; time we met.
; …  …  …
; Ganon is waiting inside of his
; tower to pass through the
; gate linking the two worlds.
; Once Ganon enters the Light
; World, it is unlikely that
; anyone can stop him.
; But if he stays in the closed
; space of this world, you can
; find him wherever he runs.
; Some maidens still need your
; help, though.  Once you rescue
; them all, go to Ganon's Tower.
; We who are of the blood-line of
; the wise men will then use our
; power to break
; Ganon's barrier!  
; [LINK]…  You must return
; peace to this country…
;---------------------------------------------------------------------------------------------------
Message_013C:
#_1CEFF0: db $7A, $02 ; set draw speed
#_1CEFF2: db $6D, $01 ; set window position
#_1CEFF4: db $6B, $02 ; set window border
#_1CEFF6: db $08, $59, $1A, $29, $29, $CE, $1C, $22 ; I⎵app[re]ci
#_1CEFFE: db $94, $1E, $59, $E3, $2B, $59, $9B, $B3 ; [at]e⎵[you]r⎵[com][ing ]
#_1CF006: db $D2, $59, $1F, $1A, $2B ; [so]⎵far
#_1CF00B: db $75 ; line 2
#_1CF00C: db $DA, $59, $CE, $2C, $1C, $2E, $1E, $59 ; [to]⎵[re]scue⎵
#_1CF014: db $BE, $41, $8A, $00, $2C, $59, $08, $59 ; [me].[  ]As⎵I⎵
#_1CF01C: db $2D, $21, $28, $2E, $20, $21, $2D, $42 ; thought,
#_1CF024: db $76 ; line 3
#_1CF025: db $E3, $59, $8D, $D8, $59, $25, $1E, $20 ; [you]⎵[are ][the]⎵leg
#_1CF02D: db $A5, $1D, $1A, $2B, $32, $59, $E4, $28 ; [en]dary⎵[Her]o
#_1CF035: db $41 ; .
#_1CF036: db $7E ; wait for key
#_1CF037: db $73 ; scroll text
#_1CF038: db $08, $59, $AD, $59, $1F, $1E, $25, $2D ; I⎵[have]⎵felt
#_1CF040: db $59, $D9, $2C, $59, $A9, $26, $59, $D8 ; ⎵[thi]s⎵[fro]m⎵[the]
#_1CF048: db $59, $1F, $22, $2B, $D3 ; ⎵fir[st]
#_1CF04D: db $73 ; scroll text
#_1CF04E: db $2D, $22, $BE, $59, $E0, $59, $BE, $2D ; ti[me]⎵[we]⎵[me]t
#_1CF056: db $41 ; .
#_1CF057: db $73 ; scroll text
#_1CF058: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_1CF05D: db $7E ; wait for key
#_1CF05E: db $73 ; scroll text
#_1CF05F: db $06, $93, $C7, $59, $B5, $59, $DF, $B6 ; G[an][on]⎵[is]⎵[wa][it]
#_1CF067: db $B3, $B4, $2C, $22, $1D, $1E, $59, $C6 ; [ing ][in]side⎵[of]
#_1CF06F: db $59, $B0, $2C ; ⎵[hi]s
#_1CF072: db $73 ; scroll text
#_1CF073: db $DA, $E0, $2B, $59, $DA, $59, $29, $1A ; [to][we]r⎵[to]⎵pa
#_1CF07B: db $2C, $2C, $59, $2D, $21, $2B, $28, $2E ; ss⎵throu
#_1CF083: db $20, $21, $59, $D8 ; gh⎵[the]
#_1CF087: db $73 ; scroll text
#_1CF088: db $20, $94, $1E, $59, $25, $B4, $24, $B3 ; g[at]e⎵l[in]k[ing ]
#_1CF090: db $D8, $59, $2D, $30, $28, $59, $30, $C8 ; [the]⎵two⎵w[or]
#_1CF098: db $25, $1D, $2C, $41 ; lds.
#_1CF09C: db $7E ; wait for key
#_1CF09D: db $73 ; scroll text
#_1CF09E: db $0E, $27, $1C, $1E, $59, $06, $93, $C7 ; Once⎵G[an][on]
#_1CF0A6: db $59, $A3, $A6, $2C, $59, $D8, $59, $0B ; ⎵[ent][er]s⎵[the]⎵L
#_1CF0AE: db $22, $20, $21, $2D ; ight
#_1CF0B2: db $73 ; scroll text
#_1CF0B3: db $16, $C8, $25, $1D, $42, $59, $B6, $59 ; W[or]ld,⎵[it]⎵
#_1CF0BB: db $B5, $59, $2E, $27, $25, $22, $24, $1E ; [is]⎵unlike
#_1CF0C3: db $B9, $D7, $2D ; [ly ][tha]t
#_1CF0C6: db $73 ; scroll text
#_1CF0C7: db $93, $32, $C7, $1E, $59, $99, $D3, $28 ; [an]y[on]e⎵[can ][st]o
#_1CF0CF: db $29, $59, $B0, $26, $41 ; p⎵[hi]m.
#_1CF0D4: db $7E ; wait for key
#_1CF0D5: db $73 ; scroll text
#_1CF0D6: db $01, $2E, $2D, $59, $22, $1F, $59, $21 ; But⎵if⎵h
#_1CF0DE: db $1E, $59, $D3, $1A, $32, $2C, $59, $B4 ; e⎵[st]ays⎵[in]
#_1CF0E6: db $59, $D8, $59, $1C, $BB, $D0, $1D ; ⎵[the]⎵c[lo][se]d
#_1CF0ED: db $73 ; scroll text
#_1CF0EE: db $2C, $29, $1A, $1C, $1E, $59, $C6, $59 ; space⎵[of]⎵
#_1CF0F6: db $D9, $2C, $59, $30, $C8, $25, $1D, $42 ; [thi]s⎵w[or]ld,
#_1CF0FE: db $59, $E3, $59, $1C, $93 ; ⎵[you]⎵c[an]
#_1CF103: db $73 ; scroll text
#_1CF104: db $1F, $B4, $1D, $59, $B0, $26, $59, $E1 ; f[in]d⎵[hi]m⎵[wh]
#_1CF10C: db $A6, $A7, $A1, $21, $1E, $59, $2B, $2E ; [er][ev][er ]he⎵ru
#_1CF114: db $27, $2C, $41 ; ns.
#_1CF117: db $7E ; wait for key
#_1CF118: db $73 ; scroll text
#_1CF119: db $12, $28, $BE, $59, $BD, $22, $1D, $A5 ; So[me]⎵[ma]id[en]
#_1CF121: db $2C, $59, $D3, $22, $25, $25, $59, $27 ; s⎵[st]ill⎵n
#_1CF129: db $1E, $A4, $E3, $2B ; e[ed ][you]r
#_1CF12D: db $73 ; scroll text
#_1CF12E: db $21, $1E, $25, $29, $42, $59, $2D, $21 ; help,⎵th
#_1CF136: db $28, $2E, $20, $21, $41, $8A, $0E, $27 ; ough.[  ]On
#_1CF13E: db $1C, $1E, $59, $E3, $59, $CE, $2C, $1C ; ce⎵[you]⎵[re]sc
#_1CF146: db $2E, $1E ; ue
#_1CF148: db $73 ; scroll text
#_1CF149: db $D8, $26, $59, $1A, $25, $25, $42, $59 ; [the]m⎵all,⎵
#_1CF151: db $AC, $59, $DA, $59, $06, $93, $C7, $8B ; [go]⎵[to]⎵G[an][on]['s ]
#_1CF159: db $13, $28, $E0, $2B, $41 ; To[we]r.
#_1CF15E: db $7E ; wait for key
#_1CF15F: db $73 ; scroll text
#_1CF160: db $16, $1E, $59, $E1, $28, $59, $8D, $C6 ; We⎵[wh]o⎵[are ][of]
#_1CF168: db $59, $D8, $59, $1B, $BB, $28, $1D, $40 ; ⎵[the]⎵b[lo]od-
#_1CF170: db $25, $B4, $1E, $59, $C6 ; l[in]e⎵[of]
#_1CF175: db $73 ; scroll text
#_1CF176: db $D8, $59, $E2, $D0, $59, $BE, $27, $59 ; [the]⎵[wi][se]⎵[me]n⎵
#_1CF17E: db $E2, $25, $25, $59, $D8, $27, $59, $2E ; [wi]ll⎵[the]n⎵u
#_1CF186: db $D0, $59, $28, $2E, $2B ; [se]⎵our
#_1CF18B: db $73 ; scroll text
#_1CF18C: db $CB, $A1, $DA, $59, $1B, $CE, $1A, $24 ; [pow][er ][to]⎵b[re]ak
#_1CF194: db $7E ; wait for key
#_1CF195: db $73 ; scroll text
#_1CF196: db $06, $93, $C7, $8B, $96, $2B, $2B, $22 ; G[an][on]['s ][ba]rri
#_1CF19E: db $A6, $3E, $8A ; [er]![  ]
#_1CF1A1: db $73 ; scroll text
#_1CF1A2: db $6A, $43, $8A, $E8, $59, $BF, $D3, $59 ; [LINK]…[  ][You]⎵[mu][st]⎵
#_1CF1AA: db $CE, $2D, $2E, $2B, $27 ; [re]turn
#_1CF1AF: db $73 ; scroll text
#_1CF1B0: db $29, $1E, $1A, $1C, $1E, $59, $DA, $59 ; peace⎵[to]⎵
#_1CF1B8: db $D9, $2C, $59, $1C, $28, $2E, $27, $DB ; [thi]s⎵coun[tr]
#_1CF1C0: db $32, $43 ; y…
#_1CF1C2: db $7F ; end of message

;===================================================================================================
; Ahah… [LINK]!
; I have been waiting for you!
; Heh heh heh…
; I was hoping I could make Zelda
; vanish in front of your eyes.
; Behold!  The last moment of
; Princess Zelda!
;---------------------------------------------------------------------------------------------------
Message_013D:
#_1CF1C3: db $00, $B1, $21, $43, $59, $6A, $3E ; A[ha]h…⎵[LINK]!
#_1CF1CA: db $75 ; line 2
#_1CF1CB: db $08, $59, $AD, $59, $97, $A0, $DF, $B6 ; I⎵[have]⎵[be][en ][wa][it]
#_1CF1D3: db $B3, $A8, $59, $E3, $3E ; [ing ][for]⎵[you]!
#_1CF1D8: db $76 ; line 3
#_1CF1D9: db $07, $1E, $21, $59, $21, $1E, $21, $59 ; Heh⎵heh⎵
#_1CF1E1: db $21, $1E, $21, $43 ; heh…
#_1CF1E5: db $7E ; wait for key
#_1CF1E6: db $73 ; scroll text
#_1CF1E7: db $08, $59, $DF, $2C, $59, $21, $28, $29 ; I⎵[wa]s⎵hop
#_1CF1EF: db $B3, $08, $59, $1C, $28, $2E, $25, $1D ; [ing ]I⎵could
#_1CF1F7: db $59, $BD, $24, $1E, $59, $19, $1E, $25 ; ⎵[ma]ke⎵Zel
#_1CF1FF: db $1D, $1A ; da
#_1CF201: db $73 ; scroll text
#_1CF202: db $2F, $93, $B5, $21, $59, $B4, $59, $A9 ; v[an][is]h⎵[in]⎵[fro]
#_1CF20A: db $27, $2D, $59, $C6, $59, $E3, $2B, $59 ; nt⎵[of]⎵[you]r⎵
#_1CF212: db $1E, $32, $1E, $2C, $41 ; eyes.
#_1CF217: db $73 ; scroll text
#_1CF218: db $01, $1E, $21, $28, $25, $1D, $3E, $8A ; Behold![  ]
#_1CF220: db $E6, $59, $BA, $D3, $59, $26, $28, $BE ; [The]⎵[la][st]⎵mo[me]
#_1CF228: db $27, $2D, $59, $C6 ; nt⎵[of]
#_1CF22C: db $7E ; wait for key
#_1CF22D: db $73 ; scroll text
#_1CF22E: db $0F, $2B, $B4, $1C, $1E, $2C, $2C, $59 ; Pr[in]cess⎵
#_1CF236: db $19, $1E, $25, $1D, $1A, $3E ; Zelda!
#_1CF23C: db $7F ; end of message

;===================================================================================================
; Ho ho ho…  With this, the
; seal of the seven wise men is
; at last broken.
; It is now only a matter of time
; before evil power covers this
; land…
; After all, the legendary Hero
; cannot defeat us, the tribe of
; evil, when we are armed with
; the Power of Gold.
; Ho ho ho… Now, I must go!
;---------------------------------------------------------------------------------------------------
Message_013E:
#_1CF23D: db $07, $28, $59, $21, $28, $59, $21, $28 ; Ho⎵ho⎵ho
#_1CF245: db $43, $8A, $16, $B6, $21, $59, $D9, $2C ; …[  ]W[it]h⎵[thi]s
#_1CF24D: db $42, $59, $D8 ; ,⎵[the]
#_1CF250: db $75 ; line 2
#_1CF251: db $D0, $1A, $25, $59, $C6, $59, $D8, $59 ; [se]al⎵[of]⎵[the]⎵
#_1CF259: db $D0, $2F, $A0, $E2, $D0, $59, $BE, $27 ; [se]v[en ][wi][se]⎵[me]n
#_1CF261: db $59, $B5 ; ⎵[is]
#_1CF263: db $76 ; line 3
#_1CF264: db $91, $BA, $D3, $59, $1B, $2B, $28, $24 ; [at ][la][st]⎵brok
#_1CF26C: db $A5, $41 ; [en].
#_1CF26E: db $7E ; wait for key
#_1CF26F: db $73 ; scroll text
#_1CF270: db $08, $2D, $59, $B5, $59, $27, $28, $30 ; It⎵[is]⎵now
#_1CF278: db $59, $C7, $B9, $1A, $59, $BD, $2D, $D4 ; ⎵[on][ly ]a⎵[ma]t[ter ]
#_1CF280: db $C6, $59, $2D, $22, $BE ; [of]⎵ti[me]
#_1CF285: db $73 ; scroll text
#_1CF286: db $97, $A8, $1E, $59, $A7, $22, $25, $59 ; [be][for]e⎵[ev]il⎵
#_1CF28E: db $CB, $A1, $1C, $28, $DD, $2C, $59, $D9 ; [pow][er ]co[ver]s⎵[thi]
#_1CF296: db $2C ; s
#_1CF297: db $73 ; scroll text
#_1CF298: db $BA, $27, $1D, $43 ; [la]nd…
#_1CF29C: db $7E ; wait for key
#_1CF29D: db $73 ; scroll text
#_1CF29E: db $00, $1F, $D4, $1A, $25, $25, $42, $59 ; Af[ter ]all,⎵
#_1CF2A6: db $D8, $59, $25, $1E, $20, $A5, $1D, $1A ; [the]⎵leg[en]da
#_1CF2AE: db $2B, $32, $59, $E4, $28 ; ry⎵[Her]o
#_1CF2B3: db $73 ; scroll text
#_1CF2B4: db $1C, $93, $C2, $59, $1D, $1E, $1F, $1E ; c[an][not]⎵defe
#_1CF2BC: db $91, $2E, $2C, $42, $59, $D8, $59, $DB ; [at ]us,⎵[the]⎵[tr]
#_1CF2C4: db $22, $97, $59, $C6 ; i[be]⎵[of]
#_1CF2C8: db $73 ; scroll text
#_1CF2C9: db $A7, $22, $25, $42, $59, $E1, $A0, $E0 ; [ev]il,⎵[wh][en ][we]
#_1CF2D1: db $59, $8D, $1A, $2B, $BE, $1D, $59, $DE ; ⎵[are ]ar[me]d⎵[with]
#_1CF2D9: db $7E ; wait for key
#_1CF2DA: db $73 ; scroll text
#_1CF2DB: db $D8, $59, $0F, $28, $E0, $2B, $59, $C6 ; [the]⎵Po[we]r⎵[of]
#_1CF2E3: db $59, $06, $28, $25, $1D, $41 ; ⎵Gold.
#_1CF2E9: db $73 ; scroll text
#_1CF2EA: db $07, $28, $59, $21, $28, $59, $21, $28 ; Ho⎵ho⎵ho
#_1CF2F2: db $43, $59, $0D, $28, $30, $42, $59, $08 ; …⎵Now,⎵I
#_1CF2FA: db $59, $BF, $D3, $59, $AC, $3E ; ⎵[mu][st]⎵[go]!
#_1CF300: db $7F ; end of message

;===================================================================================================
; Oh, so?…  You mean to say you
; would like to be totally
; destroyed?  Well, I can make
; your wish come true!
;---------------------------------------------------------------------------------------------------
Message_013F:
#_1CF301: db $0E, $21, $42, $59, $D2, $3F, $43, $8A ; Oh,⎵[so]?…[  ]
#_1CF309: db $E8, $59, $BE, $93, $59, $DA, $59, $2C ; [You]⎵[me][an]⎵[to]⎵s
#_1CF311: db $1A, $32, $59, $E3 ; ay⎵[you]
#_1CF315: db $75 ; line 2
#_1CF316: db $30, $28, $2E, $25, $1D, $59, $25, $22 ; would⎵li
#_1CF31E: db $24, $1E, $59, $DA, $59, $97, $59, $DA ; ke⎵[to]⎵[be]⎵[to]
#_1CF326: db $2D, $1A, $25, $25, $32 ; tally
#_1CF32B: db $76 ; line 3
#_1CF32C: db $9D, $DB, $28, $32, $1E, $1D, $3F, $8A ; [des][tr]oyed?[  ]
#_1CF334: db $16, $1E, $25, $25, $42, $59, $08, $59 ; Well,⎵I⎵
#_1CF33C: db $99, $BD, $24, $1E ; [can ][ma]ke
#_1CF340: db $7E ; wait for key
#_1CF341: db $73 ; scroll text
#_1CF342: db $E3, $2B, $59, $E2, $D1, $59, $9B, $1E ; [you]r⎵[wi][sh]⎵[com]e
#_1CF34A: db $59, $DB, $2E, $1E, $3E ; ⎵[tr]ue!
#_1CF34F: db $7F ; end of message

;===================================================================================================
; Grrrrugh!  Well met!  Like the
; true Hero that you are…
; But I am not ready to admit
; defeat yet.  I will draw you
; into the Dark World!
;---------------------------------------------------------------------------------------------------
Message_0140:
#_1CF350: db $06, $2B, $2B, $2B, $2B, $2E, $20, $21 ; Grrrrugh
#_1CF358: db $3E, $8A, $16, $1E, $25, $25, $59, $BE ; ![  ]Well⎵[me]
#_1CF360: db $2D, $3E, $8A, $0B, $22, $24, $1E, $59 ; t![  ]Like⎵
#_1CF368: db $D8 ; [the]
#_1CF369: db $75 ; line 2
#_1CF36A: db $DB, $2E, $1E, $59, $E4, $28, $59, $D7 ; [tr]ue⎵[Her]o⎵[tha]
#_1CF372: db $2D, $59, $E3, $59, $1A, $CE, $43 ; t⎵[you]⎵a[re]…
#_1CF379: db $76 ; line 3
#_1CF37A: db $01, $2E, $2D, $59, $08, $59, $1A, $26 ; But⎵I⎵am
#_1CF382: db $59, $C2, $59, $CE, $1A, $1D, $32, $59 ; ⎵[not]⎵[re]ady⎵
#_1CF38A: db $DA, $59, $1A, $1D, $26, $B6 ; [to]⎵adm[it]
#_1CF390: db $7E ; wait for key
#_1CF391: db $73 ; scroll text
#_1CF392: db $1D, $1E, $1F, $1E, $91, $32, $1E, $2D ; defe[at ]yet
#_1CF39A: db $41, $8A, $08, $59, $E2, $25, $25, $59 ; .[  ]I⎵[wi]ll⎵
#_1CF3A2: db $1D, $2B, $1A, $30, $59, $E3 ; draw⎵[you]
#_1CF3A8: db $73 ; scroll text
#_1CF3A9: db $B4, $DA, $59, $D8, $59, $03, $1A, $2B ; [in][to]⎵[the]⎵Dar
#_1CF3B1: db $24, $59, $16, $C8, $25, $1D, $3E ; k⎵W[or]ld!
#_1CF3B8: db $7F ; end of message

;===================================================================================================
; Ho ho ho!  It's great that you
; could come all the way here,
; [LINK].
; I'm very happy to see you
; again, but
; you'd better believe that we
; will not have a third meeting!
; Prepare to meet your doom!
;---------------------------------------------------------------------------------------------------
Message_0141:
#_1CF3B9: db $07, $28, $59, $21, $28, $59, $21, $28 ; Ho⎵ho⎵ho
#_1CF3C1: db $3E, $8A, $08, $2D, $8B, $20, $CE, $91 ; ![  ]It['s ]g[re][at ]
#_1CF3C9: db $D7, $2D, $59, $E3 ; [tha]t⎵[you]
#_1CF3CD: db $75 ; line 2
#_1CF3CE: db $1C, $28, $2E, $25, $1D, $59, $9B, $1E ; could⎵[com]e
#_1CF3D6: db $59, $8E, $D8, $59, $DF, $32, $59, $AF ; ⎵[all ][the]⎵[wa]y⎵[her]
#_1CF3DE: db $1E, $42 ; e,
#_1CF3E0: db $76 ; line 3
#_1CF3E1: db $6A, $41 ; [LINK].
#_1CF3E3: db $7E ; wait for key
#_1CF3E4: db $73 ; scroll text
#_1CF3E5: db $08, $51, $26, $59, $DD, $32, $59, $B1 ; I'm⎵[ver]y⎵[ha]
#_1CF3ED: db $29, $29, $32, $59, $DA, $59, $D0, $1E ; ppy⎵[to]⎵[se]e
#_1CF3F5: db $59, $E3 ; ⎵[you]
#_1CF3F7: db $73 ; scroll text
#_1CF3F8: db $1A, $20, $8F, $42, $59, $1B, $2E, $2D ; ag[ain],⎵but
#_1CF400: db $73 ; scroll text
#_1CF401: db $E3, $51, $1D, $59, $97, $2D, $D4, $97 ; [you]'d⎵[be]t[ter ][be]
#_1CF409: db $25, $22, $A7, $1E, $59, $D7, $2D, $59 ; li[ev]e⎵[tha]t⎵
#_1CF411: db $E0 ; [we]
#_1CF412: db $7E ; wait for key
#_1CF413: db $73 ; scroll text
#_1CF414: db $E2, $25, $25, $59, $C2, $59, $AD, $59 ; [wi]ll⎵[not]⎵[have]⎵
#_1CF41C: db $1A, $59, $D9, $2B, $1D, $59, $BE, $1E ; a⎵[thi]rd⎵[me]e
#_1CF424: db $2D, $B4, $20, $3E ; t[in]g!
#_1CF428: db $73 ; scroll text
#_1CF429: db $0F, $CE, $29, $8D, $DA, $59, $BE, $1E ; P[re]p[are ][to]⎵[me]e
#_1CF431: db $2D, $59, $E3, $2B, $59, $9F, $28, $26 ; t⎵[you]r⎵[do]om
#_1CF439: db $3E ; !
#_1CF43A: db $7F ; end of message

;===================================================================================================
; Wah ha ha!  What do you want,
; little man?  Do you have
; something to ask me?
;     >  I want the flippers
;         I just dropped by
;---------------------------------------------------------------------------------------------------
Message_0142:
#_1CF43B: db $16, $1A, $21, $59, $B1, $59, $B1, $3E ; Wah⎵[ha]⎵[ha]!
#_1CF443: db $8A, $16, $B1, $2D, $59, $9F, $59, $E3 ; [  ]W[ha]t⎵[do]⎵[you]
#_1CF44B: db $59, $DF, $27, $2D, $42 ; ⎵[wa]nt,
#_1CF450: db $75 ; line 2
#_1CF451: db $25, $B6, $2D, $25, $1E, $59, $BC, $3F ; l[it]tle⎵[man]?
#_1CF459: db $8A, $03, $28, $59, $E3, $59, $AD ; [  ]Do⎵[you]⎵[have]
#_1CF460: db $76 ; line 3
#_1CF461: db $CF, $D5, $20, $59, $DA, $59, $1A, $2C ; [some][thin]g⎵[to]⎵as
#_1CF469: db $24, $59, $BE, $3F ; k⎵[me]?
#_1CF46D: db $7E ; wait for key
#_1CF46E: db $73 ; scroll text
#_1CF46F: db $88, $44, $8A, $08, $59, $DF, $27, $2D ; [    ]>[  ]I⎵[wa]nt
#_1CF477: db $59, $D8, $59, $1F, $25, $22, $29, $C9 ; ⎵[the]⎵flip[per]
#_1CF47F: db $2C ; s
#_1CF480: db $73 ; scroll text
#_1CF481: db $88, $88, $08, $59, $B7, $59, $1D, $2B ; [    ][    ]I⎵[just]⎵dr
#_1CF489: db $28, $29, $29, $A4, $1B, $32 ; opp[ed ]by
#_1CF48F: db $68 ; choose 2 indented
#_1CF490: db $7F ; end of message

;===================================================================================================
; Wah ha ha!  But I don't just
; give flippers away for free.
; I sell them for 500 Rupees a
; pair.
; What do you do?
;     >  Pay 500 Rupees
;         Quit after all
;---------------------------------------------------------------------------------------------------
Message_0143:
#_1CF491: db $16, $1A, $21, $59, $B1, $59, $B1, $3E ; Wah⎵[ha]⎵[ha]!
#_1CF499: db $8A, $01, $2E, $2D, $59, $08, $59, $9F ; [  ]But⎵I⎵[do]
#_1CF4A1: db $C0, $B7 ; [n't ][just]
#_1CF4A3: db $75 ; line 2
#_1CF4A4: db $AA, $1F, $25, $22, $29, $C9, $2C, $59 ; [give ]flip[per]s⎵
#_1CF4AC: db $1A, $DF, $32, $59, $A8, $59, $1F, $CE ; a[wa]y⎵[for]⎵f[re]
#_1CF4B4: db $1E, $41 ; e.
#_1CF4B6: db $76 ; line 3
#_1CF4B7: db $08, $59, $D0, $25, $25, $59, $D8, $26 ; I⎵[se]ll⎵[the]m
#_1CF4BF: db $59, $A8, $59, $39, $34, $34, $59, $11 ; ⎵[for]⎵500⎵R
#_1CF4C7: db $DC, $1E, $1E, $2C, $59, $1A ; [up]ees⎵a
#_1CF4CD: db $7E ; wait for key
#_1CF4CE: db $73 ; scroll text
#_1CF4CF: db $29, $1A, $22, $2B, $41 ; pair.
#_1CF4D4: db $7E ; wait for key
#_1CF4D5: db $73 ; scroll text
#_1CF4D6: db $16, $B1, $2D, $59, $9F, $59, $E3, $59 ; W[ha]t⎵[do]⎵[you]⎵
#_1CF4DE: db $9F, $3F ; [do]?
#_1CF4E0: db $73 ; scroll text
#_1CF4E1: db $88, $44, $8A, $0F, $1A, $32, $59, $39 ; [    ]>[  ]Pay⎵5
#_1CF4E9: db $34, $34, $59, $11, $DC, $1E, $1E, $2C ; 00⎵R[up]ees
#_1CF4F1: db $73 ; scroll text
#_1CF4F2: db $88, $88, $10, $2E, $B6, $59, $1A, $1F ; [    ][    ]Qu[it]⎵af
#_1CF4FA: db $D4, $1A, $25, $25 ; [ter ]all
#_1CF4FE: db $68 ; choose 2 indented
#_1CF4FF: db $7F ; end of message

;===================================================================================================
; Wah ha ha!  One pair of
; flippers coming up.  I will
; give you a free bonus with
; your purchase.
; I will let you use the magic
; water ways of the sea folk
; which link lakes and rivers.
; When you see a whirlpool, dive
; into it.  You never know where
; you'll surface!  Wah ha ha!
;---------------------------------------------------------------------------------------------------
Message_0144:
#_1CF500: db $16, $1A, $21, $59, $B1, $59, $B1, $3E ; Wah⎵[ha]⎵[ha]!
#_1CF508: db $8A, $0E, $27, $1E, $59, $29, $1A, $22 ; [  ]One⎵pai
#_1CF510: db $2B, $59, $C6 ; r⎵[of]
#_1CF513: db $75 ; line 2
#_1CF514: db $1F, $25, $22, $29, $C9, $2C, $59, $9B ; flip[per]s⎵[com]
#_1CF51C: db $B3, $DC, $41, $8A, $08, $59, $E2, $25 ; [ing ][up].[  ]I⎵[wi]l
#_1CF524: db $25 ; l
#_1CF525: db $76 ; line 3
#_1CF526: db $AA, $E3, $59, $1A, $59, $1F, $CE, $1E ; [give ][you]⎵a⎵f[re]e
#_1CF52E: db $59, $98, $27, $2E, $2C, $59, $DE ; ⎵[bo]nus⎵[with]
#_1CF535: db $7E ; wait for key
#_1CF536: db $73 ; scroll text
#_1CF537: db $E3, $2B, $59, $29, $2E, $2B, $1C, $AE ; [you]r⎵purc[has]
#_1CF53F: db $1E, $41 ; e.
#_1CF541: db $73 ; scroll text
#_1CF542: db $08, $59, $E2, $25, $25, $59, $25, $1E ; I⎵[wi]ll⎵le
#_1CF54A: db $2D, $59, $E3, $59, $2E, $D0, $59, $D8 ; t⎵[you]⎵u[se]⎵[the]
#_1CF552: db $59, $BD, $20, $22, $1C ; ⎵[ma]gic
#_1CF557: db $73 ; scroll text
#_1CF558: db $DF, $D4, $DF, $32, $2C, $59, $C6, $59 ; [wa][ter ][wa]ys⎵[of]⎵
#_1CF560: db $D8, $59, $D0, $1A, $59, $1F, $28, $25 ; [the]⎵[se]a⎵fol
#_1CF568: db $24 ; k
#_1CF569: db $7E ; wait for key
#_1CF56A: db $73 ; scroll text
#_1CF56B: db $E1, $22, $1C, $21, $59, $25, $B4, $24 ; [wh]ich⎵l[in]k
#_1CF573: db $59, $BA, $24, $1E, $2C, $59, $8C, $2B ; ⎵[la]kes⎵[and ]r
#_1CF57B: db $22, $DD, $2C, $41 ; i[ver]s.
#_1CF57F: db $73 ; scroll text
#_1CF580: db $16, $21, $A0, $E3, $59, $D0, $1E, $59 ; Wh[en ][you]⎵[se]e⎵
#_1CF588: db $1A, $59, $E1, $22, $2B, $25, $29, $28 ; a⎵[wh]irlpo
#_1CF590: db $28, $25, $42, $59, $9E, $2F, $1E ; ol,⎵[di]ve
#_1CF597: db $73 ; scroll text
#_1CF598: db $B4, $DA, $59, $B6, $41, $8A, $E8, $59 ; [in][to]⎵[it].[  ][You]⎵
#_1CF5A0: db $27, $A7, $A1, $B8, $59, $E1, $A6, $1E ; n[ev][er ][know]⎵[wh][er]e
#_1CF5A8: db $7E ; wait for key
#_1CF5A9: db $73 ; scroll text
#_1CF5AA: db $E3, $51, $25, $25, $59, $2C, $2E, $2B ; [you]'ll⎵sur
#_1CF5B2: db $1F, $1A, $1C, $1E, $3E, $8A, $16, $1A ; face![  ]Wa
#_1CF5BA: db $21, $59, $B1, $59, $B1, $3E ; h⎵[ha]⎵[ha]!
#_1CF5C0: db $7F ; end of message

;===================================================================================================
; Wade back this way when you
; have more Rupees…
; Wah ha ha!  I'll see you again!
;---------------------------------------------------------------------------------------------------
Message_0145:
#_1CF5C1: db $16, $1A, $1D, $1E, $59, $96, $9C, $59 ; Wade⎵[ba][ck]⎵
#_1CF5C9: db $D9, $2C, $59, $DF, $32, $59, $E1, $A0 ; [thi]s⎵[wa]y⎵[wh][en ]
#_1CF5D1: db $E3 ; [you]
#_1CF5D2: db $75 ; line 2
#_1CF5D3: db $AD, $59, $26, $C8, $1E, $59, $11, $DC ; [have]⎵m[or]e⎵R[up]
#_1CF5DB: db $1E, $1E, $2C, $43 ; ees…
#_1CF5DF: db $76 ; line 3
#_1CF5E0: db $16, $1A, $21, $59, $B1, $59, $B1, $3E ; Wah⎵[ha]⎵[ha]!
#_1CF5E8: db $8A, $08, $51, $25, $25, $59, $D0, $1E ; [  ]I'll⎵[se]e
#_1CF5F0: db $59, $E3, $59, $1A, $20, $8F, $3E ; ⎵[you]⎵ag[ain]!
#_1CF5F7: db $7F ; end of message

;===================================================================================================
; Great!  Whenever you want to
; see my fishy face, you are
; welcome here.
; …
; Wah ha ha!  Good bye…!
;---------------------------------------------------------------------------------------------------
Message_0146:
#_1CF5F8: db $06, $CE, $94, $3E, $8A, $16, $21, $A5 ; G[re][at]![  ]Wh[en]
#_1CF600: db $A7, $A1, $E3, $59, $DF, $27, $2D, $59 ; [ev][er ][you]⎵[wa]nt⎵
#_1CF608: db $DA ; [to]
#_1CF609: db $75 ; line 2
#_1CF60A: db $D0, $1E, $59, $26, $32, $59, $1F, $B5 ; [se]e⎵my⎵f[is]
#_1CF612: db $21, $32, $59, $1F, $1A, $1C, $1E, $42 ; hy⎵face,
#_1CF61A: db $59, $E3, $59, $1A, $CE ; ⎵[you]⎵a[re]
#_1CF61F: db $76 ; line 3
#_1CF620: db $E0, $25, $9B, $1E, $59, $AF, $1E, $41 ; [we]l[com]e⎵[her]e.
#_1CF628: db $7E ; wait for key
#_1CF629: db $73 ; scroll text
#_1CF62A: db $43 ; …
#_1CF62B: db $73 ; scroll text
#_1CF62C: db $16, $1A, $21, $59, $B1, $59, $B1, $3E ; Wah⎵[ha]⎵[ha]!
#_1CF634: db $8A, $06, $28, $28, $1D, $59, $1B, $32 ; [  ]Good⎵by
#_1CF63C: db $1E, $43, $3E ; e…!
#_1CF63F: db $7F ; end of message

;===================================================================================================
; Hi [LINK]!
; Elder?  Are you talking about
; the grandpa?  OK,  but don't
; tell any of the bad people
; about this.
; He's hiding in the palace past
; the castle.
; I will mark the spot on your
; map.  Here you are…
;---------------------------------------------------------------------------------------------------
Message_0147:
#_1CF640: db $07, $22, $59, $6A, $3E ; Hi⎵[LINK]!
#_1CF645: db $75 ; line 2
#_1CF646: db $04, $25, $1D, $A6, $3F, $8A, $00, $CD ; Eld[er]?[  ]A[re ]
#_1CF64E: db $E3, $59, $2D, $1A, $25, $24, $B3, $1A ; [you]⎵talk[ing ]a
#_1CF656: db $98, $2E, $2D ; [bo]ut
#_1CF659: db $76 ; line 3
#_1CF65A: db $D8, $59, $20, $2B, $90, $29, $1A, $3F ; [the]⎵gr[and]pa?
#_1CF662: db $8A, $0E, $0A, $42, $8A, $1B, $2E, $2D ; [  ]OK,[  ]but
#_1CF66A: db $59, $9F, $27, $51, $2D ; ⎵[do]n't
#_1CF66F: db $7E ; wait for key
#_1CF670: db $73 ; scroll text
#_1CF671: db $2D, $1E, $25, $25, $59, $93, $32, $59 ; tell⎵[an]y⎵
#_1CF679: db $C6, $59, $D8, $59, $96, $1D, $59, $29 ; [of]⎵[the]⎵[ba]d⎵p
#_1CF681: db $1E, $28, $CA ; eo[ple]
#_1CF684: db $73 ; scroll text
#_1CF685: db $1A, $98, $2E, $2D, $59, $D9, $2C, $41 ; a[bo]ut⎵[thi]s.
#_1CF68D: db $73 ; scroll text
#_1CF68E: db $07, $1E, $8B, $B0, $9E, $27, $20, $59 ; He['s ][hi][di]ng⎵
#_1CF696: db $B4, $59, $D8, $59, $29, $1A, $BA, $1C ; [in]⎵[the]⎵pa[la]c
#_1CF69E: db $1E, $59, $29, $92 ; e⎵p[ast]
#_1CF6A2: db $7E ; wait for key
#_1CF6A3: db $73 ; scroll text
#_1CF6A4: db $D8, $59, $1C, $92, $25, $1E, $41 ; [the]⎵c[ast]le.
#_1CF6AB: db $73 ; scroll text
#_1CF6AC: db $08, $59, $E2, $25, $25, $59, $BD, $2B ; I⎵[wi]ll⎵[ma]r
#_1CF6B4: db $24, $59, $D8, $59, $2C, $29, $28, $2D ; k⎵[the]⎵spot
#_1CF6BC: db $59, $C7, $59, $E3, $2B ; ⎵[on]⎵[you]r
#_1CF6C1: db $73 ; scroll text
#_1CF6C2: db $BD, $29, $41, $8A, $E4, $1E, $59, $E3 ; [ma]p.[  ][Her]e⎵[you]
#_1CF6CA: db $59, $1A, $CE, $43 ; ⎵a[re]…
#_1CF6CE: db $79, $2D ; play sfx
#_1CF6D0: db $7F ; end of message

;===================================================================================================
; Did you meet the grandpa?  If
; all the bad people go away, he
; can come back to the village.
;---------------------------------------------------------------------------------------------------
Message_0148:
#_1CF6D1: db $03, $22, $1D, $59, $E3, $59, $BE, $1E ; Did⎵[you]⎵[me]e
#_1CF6D9: db $2D, $59, $D8, $59, $20, $2B, $90, $29 ; t⎵[the]⎵gr[and]p
#_1CF6E1: db $1A, $3F, $8A, $08, $1F ; a?[  ]If
#_1CF6E6: db $75 ; line 2
#_1CF6E7: db $8E, $D8, $59, $96, $1D, $59, $29, $1E ; [all ][the]⎵[ba]d⎵pe
#_1CF6EF: db $28, $CA, $59, $AC, $59, $1A, $DF, $32 ; o[ple]⎵[go]⎵a[wa]y
#_1CF6F7: db $42, $59, $21, $1E ; ,⎵he
#_1CF6FB: db $76 ; line 3
#_1CF6FC: db $99, $9B, $1E, $59, $96, $9C, $59, $DA ; [can ][com]e⎵[ba][ck]⎵[to]
#_1CF704: db $59, $D8, $59, $2F, $22, $25, $BA, $20 ; ⎵[the]⎵vil[la]g
#_1CF70C: db $1E, $41 ; e.
#_1CF70E: db $7F ; end of message

;===================================================================================================
; You're new here, aren't you?
; Did you come here looking for
; the Power Of Gold?
; Well, you're too late.  It will
; obey only the first person who
; touches it.
; The man who last claimed the
; Power Of Gold wished for this
; world.  It reflects his heart.
; Yes, I came here because of
; greed for the Golden Power,
; and look what happened to me… 
; To restore the Golden Land, a
; person worthy of the Golden
; Power must defeat the man who
; created this place…
; Until that time, I am stuck in
; this bizarre shape.
; But what a mischievous thing
; to leave lying around…
; The Power Of Gold…
; Triforce…
;---------------------------------------------------------------------------------------------------
Message_0149:
#_1CF70F: db $E8, $51, $CD, $27, $1E, $30, $59, $AF ; [You]'[re ]new⎵[her]
#_1CF717: db $1E, $42, $59, $1A, $CE, $C0, $E3, $3F ; e,⎵a[re][n't ][you]?
#_1CF71F: db $75 ; line 2
#_1CF720: db $03, $22, $1D, $59, $E3, $59, $9B, $1E ; Did⎵[you]⎵[com]e
#_1CF728: db $59, $AF, $1E, $59, $BB, $28, $24, $B3 ; ⎵[her]e⎵[lo]ok[ing ]
#_1CF730: db $A8 ; [for]
#_1CF731: db $76 ; line 3
#_1CF732: db $D8, $59, $0F, $28, $E0, $2B, $59, $0E ; [the]⎵Po[we]r⎵O
#_1CF73A: db $1F, $59, $06, $28, $25, $1D, $3F ; f⎵Gold?
#_1CF741: db $7E ; wait for key
#_1CF742: db $73 ; scroll text
#_1CF743: db $16, $1E, $25, $25, $42, $59, $E3, $51 ; Well,⎵[you]'
#_1CF74B: db $CD, $DA, $28, $59, $BA, $2D, $1E, $41 ; [re ][to]o⎵[la]te.
#_1CF753: db $8A, $08, $2D, $59, $E2, $25, $25 ; [  ]It⎵[wi]ll
#_1CF75A: db $73 ; scroll text
#_1CF75B: db $28, $97, $32, $59, $C7, $B9, $D8, $59 ; o[be]y⎵[on][ly ][the]⎵
#_1CF763: db $1F, $22, $2B, $D3, $59, $C9, $D2, $27 ; fir[st]⎵[per][so]n
#_1CF76B: db $59, $E1, $28 ; ⎵[wh]o
#_1CF76E: db $73 ; scroll text
#_1CF76F: db $DA, $2E, $9A, $2C, $59, $B6, $41 ; [to]u[che]s⎵[it].
#_1CF776: db $7E ; wait for key
#_1CF777: db $73 ; scroll text
#_1CF778: db $E6, $59, $BC, $59, $E1, $28, $59, $BA ; [The]⎵[man]⎵[wh]o⎵[la]
#_1CF780: db $D3, $59, $1C, $BA, $22, $BE, $1D, $59 ; [st]⎵c[la]i[me]d⎵
#_1CF788: db $D8 ; [the]
#_1CF789: db $73 ; scroll text
#_1CF78A: db $0F, $28, $E0, $2B, $59, $0E, $1F, $59 ; Po[we]r⎵Of⎵
#_1CF792: db $06, $28, $25, $1D, $59, $E2, $D1, $A4 ; Gold⎵[wi][sh][ed ]
#_1CF79A: db $A8, $59, $D9, $2C ; [for]⎵[thi]s
#_1CF79E: db $73 ; scroll text
#_1CF79F: db $30, $C8, $25, $1D, $41, $8A, $08, $2D ; w[or]ld.[  ]It
#_1CF7A7: db $59, $CE, $1F, $25, $1E, $1C, $2D, $2C ; ⎵[re]flects
#_1CF7AF: db $59, $B0, $2C, $59, $21, $A2, $2D, $41 ; ⎵[hi]s⎵h[ear]t.
#_1CF7B7: db $7E ; wait for key
#_1CF7B8: db $73 ; scroll text
#_1CF7B9: db $18, $1E, $2C, $42, $59, $08, $59, $1C ; Yes,⎵I⎵c
#_1CF7C1: db $1A, $BE, $59, $AF, $1E, $59, $97, $1C ; a[me]⎵[her]e⎵[be]c
#_1CF7C9: db $1A, $2E, $D0, $59, $C6 ; au[se]⎵[of]
#_1CF7CE: db $73 ; scroll text
#_1CF7CF: db $20, $CE, $A4, $A8, $59, $D8, $59, $06 ; g[re][ed ][for]⎵[the]⎵G
#_1CF7D7: db $28, $25, $1D, $A0, $0F, $28, $E0, $2B ; old[en ]Po[we]r
#_1CF7DF: db $42 ; ,
#_1CF7E0: db $73 ; scroll text
#_1CF7E1: db $8C, $BB, $28, $24, $59, $E1, $91, $B1 ; [and ][lo]ok⎵[wh][at ][ha]
#_1CF7E9: db $29, $29, $A5, $A4, $DA, $59, $BE, $43 ; pp[en][ed ][to]⎵[me]…
#_1CF7F1: db $59 ; ⎵
#_1CF7F2: db $7E ; wait for key
#_1CF7F3: db $73 ; scroll text
#_1CF7F4: db $13, $28, $59, $CE, $D3, $C8, $1E, $59 ; To⎵[re][st][or]e⎵
#_1CF7FC: db $D8, $59, $06, $28, $25, $1D, $A0, $0B ; [the]⎵Gold[en ]L
#_1CF804: db $90, $42, $59, $1A ; [and],⎵a
#_1CF808: db $73 ; scroll text
#_1CF809: db $C9, $D2, $27, $59, $30, $C8, $2D, $21 ; [per][so]n⎵w[or]th
#_1CF811: db $32, $59, $C6, $59, $D8, $59, $06, $28 ; y⎵[of]⎵[the]⎵Go
#_1CF819: db $25, $1D, $A5 ; ld[en]
#_1CF81C: db $73 ; scroll text
#_1CF81D: db $0F, $28, $E0, $2B, $59, $BF, $D3, $59 ; Po[we]r⎵[mu][st]⎵
#_1CF825: db $1D, $1E, $1F, $1E, $91, $D8, $59, $BC ; defe[at ][the]⎵[man]
#_1CF82D: db $59, $E1, $28 ; ⎵[wh]o
#_1CF830: db $7E ; wait for key
#_1CF831: db $73 ; scroll text
#_1CF832: db $1C, $CE, $94, $A4, $D9, $2C, $59, $29 ; c[re][at][ed ][thi]s⎵p
#_1CF83A: db $BA, $1C, $1E, $43 ; [la]ce…
#_1CF83E: db $73 ; scroll text
#_1CF83F: db $14, $27, $2D, $22, $25, $59, $D7, $2D ; Until⎵[tha]t
#_1CF847: db $59, $2D, $22, $BE, $42, $59, $08, $59 ; ⎵ti[me],⎵I⎵
#_1CF84F: db $1A, $26, $59, $D3, $2E, $9C, $59, $B4 ; am⎵[st]u[ck]⎵[in]
#_1CF857: db $73 ; scroll text
#_1CF858: db $D9, $2C, $59, $1B, $22, $33, $1A, $2B ; [thi]s⎵bizar
#_1CF860: db $CD, $D1, $1A, $29, $1E, $41 ; [re ][sh]ape.
#_1CF866: db $7E ; wait for key
#_1CF867: db $73 ; scroll text
#_1CF868: db $01, $2E, $2D, $59, $E1, $91, $1A, $59 ; But⎵[wh][at ]a⎵
#_1CF870: db $26, $B5, $1C, $B0, $A7, $28, $2E, $2C ; m[is]c[hi][ev]ous
#_1CF878: db $59, $D5, $20 ; ⎵[thin]g
#_1CF87B: db $73 ; scroll text
#_1CF87C: db $DA, $59, $25, $1E, $1A, $2F, $1E, $59 ; [to]⎵leave⎵
#_1CF884: db $25, $32, $B3, $1A, $2B, $C4, $43 ; ly[ing ]ar[ound]…
#_1CF88B: db $73 ; scroll text
#_1CF88C: db $E6, $59, $0F, $28, $E0, $2B, $59, $0E ; [The]⎵Po[we]r⎵O
#_1CF894: db $1F, $59, $06, $28, $25, $1D, $43 ; f⎵Gold…
#_1CF89B: db $7E ; wait for key
#_1CF89C: db $73 ; scroll text
#_1CF89D: db $13, $2B, $22, $A8, $1C, $1E, $43 ; Tri[for]ce…
#_1CF8A4: db $7F ; end of message

;===================================================================================================
;      -Mysterious Pond-
; Won't you throw something in?
; 
; What will you do?
;     > Throw an item
;        Don't try it
;---------------------------------------------------------------------------------------------------
Message_014A:
#_1CF8A5: db $88, $59, $40, $0C, $32, $D3, $A6, $22 ; [    ]⎵-My[st][er]i
#_1CF8AD: db $28, $2E, $2C, $59, $0F, $C7, $1D, $40 ; ous⎵P[on]d-
#_1CF8B5: db $75 ; line 2
#_1CF8B6: db $16, $C7, $51, $2D, $59, $E3, $59, $2D ; W[on]'t⎵[you]⎵t
#_1CF8BE: db $21, $2B, $28, $30, $59, $CF, $D5, $20 ; hrow⎵[some][thin]g
#_1CF8C6: db $59, $B4, $3F ; ⎵[in]?
#_1CF8C9: db $76 ; line 3
#_1CF8CA: db $7E ; wait for key
#_1CF8CB: db $73 ; scroll text
#_1CF8CC: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_1CF8D4: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_1CF8D8: db $73 ; scroll text
#_1CF8D9: db $88, $44, $59, $13, $21, $2B, $28, $30 ; [    ]>⎵Throw
#_1CF8E1: db $59, $93, $59, $B6, $1E, $26 ; ⎵[an]⎵[it]em
#_1CF8E7: db $73 ; scroll text
#_1CF8E8: db $88, $89, $03, $C7, $51, $2D, $59, $DB ; [    ][   ]D[on]'t⎵[tr]
#_1CF8F0: db $32, $59, $B6 ; y⎵[it]
#_1CF8F3: db $68 ; choose 2 indented
#_1CF8F4: db $7F ; end of message

;===================================================================================================
; Don't do it!
;---------------------------------------------------------------------------------------------------
Message_014B:
#_1CF8F5: db $03, $C7, $51, $2D, $59, $9F, $59, $B6 ; D[on]'t⎵[do]⎵[it]
#_1CF8FD: db $3E ; !
#_1CF8FE: db $7F ; end of message

;===================================================================================================
; Don't do it!
;---------------------------------------------------------------------------------------------------
Message_014C:
#_1CF8FF: db $03, $C7, $51, $2D, $59, $9F, $59, $B6 ; D[on]'t⎵[do]⎵[it]
#_1CF907: db $3E ; !
#_1CF908: db $7F ; end of message

;===================================================================================================
; I will give this back to you
; then.  Don't drop it again.
;---------------------------------------------------------------------------------------------------
Message_014D:
#_1CF909: db $08, $59, $E2, $25, $25, $59, $AA, $D9 ; I⎵[wi]ll⎵[give ][thi]
#_1CF911: db $2C, $59, $96, $9C, $59, $DA, $59, $E3 ; s⎵[ba][ck]⎵[to]⎵[you]
#_1CF919: db $75 ; line 2
#_1CF91A: db $D8, $27, $41, $8A, $03, $C7, $51, $2D ; [the]n.[  ]D[on]'t
#_1CF922: db $59, $1D, $2B, $28, $29, $59, $B6, $59 ; ⎵drop⎵[it]⎵
#_1CF92A: db $1A, $20, $8F, $41 ; ag[ain].
#_1CF92E: db $7F ; end of message

;===================================================================================================
; How many Rupees will you toss?
;     > [#1][#0] Rupees
;        [#3][#2] Rupees
;---------------------------------------------------------------------------------------------------
Message_014E:
#_1CF92F: db $07, $28, $30, $59, $BC, $32, $59, $11 ; How⎵[man]y⎵R
#_1CF937: db $DC, $1E, $1E, $2C, $59, $E2, $25, $25 ; [up]ees⎵[wi]ll
#_1CF93F: db $59, $E3, $59, $DA, $2C, $2C, $3F ; ⎵[you]⎵[to]ss?
#_1CF946: db $75 ; line 2
#_1CF947: db $88, $44, $59, $6C, $01, $6C, $00, $59 ; [    ]>⎵[#1][#0]⎵
#_1CF94F: db $11, $DC, $1E, $1E, $2C ; R[up]ees
#_1CF954: db $76 ; line 3
#_1CF955: db $88, $89, $6C, $03, $6C, $02, $59, $11 ; [    ][   ][#3][#2]⎵R
#_1CF95D: db $DC, $1E, $1E, $2C ; [up]ees
#_1CF961: db $68 ; choose 2 indented
#_1CF962: db $7F ; end of message

;===================================================================================================
; You are an honest person.
; I like you.
; I will give you something
; important…
; These are the Silver Arrows.
; To give Ganon his last
; moment, you definitely need
; them!  I know I don't quite have
; the figure of a faerie.
; Ganon's cruel power
; is to blame!
; You must defeat Ganon!
;---------------------------------------------------------------------------------------------------
Message_014F:
#_1CF963: db $E8, $59, $8D, $93, $59, $21, $C7, $1E ; [You]⎵[are ][an]⎵h[on]e
#_1CF96B: db $D3, $59, $C9, $D2, $27, $41 ; [st]⎵[per][so]n.
#_1CF971: db $75 ; line 2
#_1CF972: db $08, $59, $25, $22, $24, $1E, $59, $E3 ; I⎵like⎵[you]
#_1CF97A: db $41 ; .
#_1CF97B: db $76 ; line 3
#_1CF97C: db $08, $59, $E2, $25, $25, $59, $AA, $E3 ; I⎵[wi]ll⎵[give ][you]
#_1CF984: db $59, $CF, $D5, $20 ; ⎵[some][thin]g
#_1CF988: db $7E ; wait for key
#_1CF989: db $73 ; scroll text
#_1CF98A: db $22, $26, $29, $C8, $2D, $93, $2D, $43 ; imp[or]t[an]t…
#_1CF992: db $73 ; scroll text
#_1CF993: db $E6, $D0, $59, $8D, $D8, $59, $12, $22 ; [The][se]⎵[are ][the]⎵Si
#_1CF99B: db $25, $DD, $59, $00, $2B, $2B, $28, $30 ; l[ver]⎵Arrow
#_1CF9A3: db $2C, $41 ; s.
#_1CF9A5: db $73 ; scroll text
#_1CF9A6: db $13, $28, $59, $AA, $06, $93, $C7, $59 ; To⎵[give ]G[an][on]⎵
#_1CF9AE: db $B0, $2C, $59, $BA, $D3 ; [hi]s⎵[la][st]
#_1CF9B3: db $7E ; wait for key
#_1CF9B4: db $73 ; scroll text
#_1CF9B5: db $26, $28, $BE, $27, $2D, $42, $59, $E3 ; mo[me]nt,⎵[you]
#_1CF9BD: db $59, $1D, $1E, $1F, $B4, $B6, $1E, $B9 ; ⎵def[in][it]e[ly ]
#_1CF9C5: db $27, $1E, $1E, $1D ; need
#_1CF9C9: db $73 ; scroll text
#_1CF9CA: db $D8, $26, $3E, $8A, $08, $59, $B8, $59 ; [the]m![  ]I⎵[know]⎵
#_1CF9D2: db $08, $59, $9F, $C0, $2A, $2E, $B6, $1E ; I⎵[do][n't ]qu[it]e
#_1CF9DA: db $59, $AD ; ⎵[have]
#_1CF9DC: db $73 ; scroll text
#_1CF9DD: db $D8, $59, $1F, $22, $20, $2E, $CD, $C6 ; [the]⎵figu[re ][of]
#_1CF9E5: db $59, $1A, $59, $1F, $1A, $A6, $22, $1E ; ⎵a⎵fa[er]ie
#_1CF9ED: db $41 ; .
#_1CF9EE: db $7E ; wait for key
#_1CF9EF: db $73 ; scroll text
#_1CF9F0: db $06, $93, $C7, $8B, $1C, $2B, $2E, $1E ; G[an][on]['s ]crue
#_1CF9F8: db $25, $59, $CB, $A6 ; l⎵[pow][er]
#_1CF9FC: db $73 ; scroll text
#_1CF9FD: db $B5, $59, $DA, $59, $1B, $BA, $BE, $3E ; [is]⎵[to]⎵b[la][me]!
#_1CFA05: db $73 ; scroll text
#_1CFA06: db $E8, $59, $BF, $D3, $59, $1D, $1E, $1F ; [You]⎵[mu][st]⎵def
#_1CFA0E: db $1E, $91, $06, $93, $C7, $3E ; e[at ]G[an][on]!
#_1CFA14: db $7F ; end of message

;===================================================================================================
;    Great Luck.
;---------------------------------------------------------------------------------------------------
Message_0150:
#_1CFA15: db $75 ; line 2
#_1CFA16: db $89, $06, $CE, $91, $0B, $2E, $9C, $41 ; [   ]G[re][at ]Lu[ck].
#_1CFA1E: db $7F ; end of message

;===================================================================================================
;    Good Luck.
;---------------------------------------------------------------------------------------------------
Message_0151:
#_1CFA1F: db $75 ; line 2
#_1CFA20: db $89, $06, $28, $28, $1D, $59, $0B, $2E ; [   ]Good⎵Lu
#_1CFA28: db $9C, $41 ; [ck].
#_1CFA2A: db $7F ; end of message

;===================================================================================================
;    A Little Luck.
;---------------------------------------------------------------------------------------------------
Message_0152:
#_1CFA2B: db $75 ; line 2
#_1CFA2C: db $89, $00, $59, $0B, $B6, $2D, $25, $1E ; [   ]A⎵L[it]tle
#_1CFA34: db $59, $0B, $2E, $9C, $41 ; ⎵Lu[ck].
#_1CFA39: db $7F ; end of message

;===================================================================================================
;    Big Trouble.
;---------------------------------------------------------------------------------------------------
Message_0153:
#_1CFA3A: db $75 ; line 2
#_1CFA3B: db $89, $01, $22, $20, $59, $13, $2B, $28 ; [   ]Big⎵Tro
#_1CFA43: db $2E, $95, $41 ; u[ble].
#_1CFA46: db $7F ; end of message

;===================================================================================================
; For your reference, today you
; will have
;---------------------------------------------------------------------------------------------------
Message_0154:
#_1CFA47: db $05, $C8, $59, $E3, $2B, $59, $CE, $1F ; F[or]⎵[you]r⎵[re]f
#_1CFA4F: db $A6, $A5, $1C, $1E, $42, $59, $DA, $1D ; [er][en]ce,⎵[to]d
#_1CFA57: db $1A, $32, $59, $E3 ; ay⎵[you]
#_1CFA5B: db $75 ; line 2
#_1CFA5C: db $E2, $25, $25, $59, $AD ; [wi]ll⎵[have]
#_1CFA61: db $7F ; end of message

;===================================================================================================
; You found a piece of Heart!
;                  ♥♥
;---------------------------------------------------------------------------------------------------
Message_0155:
#_1CFA62: db $E8, $59, $1F, $C4, $59, $1A, $59, $29 ; [You]⎵f[ound]⎵a⎵p
#_1CFA6A: db $22, $1E, $1C, $1E, $59, $C6, $59, $07 ; iece⎵[of]⎵H
#_1CFA72: db $A2, $2D, $3E ; [ear]t!
#_1CFA75: db $75 ; line 2
#_1CFA76: db $88, $88, $88, $88, $59, $52, $53 ; [    ][    ][    ][    ]⎵♥♥
#_1CFA7D: db $7F ; end of message

;===================================================================================================
; You found a piece of Heart!
;                  ♥♥
;---------------------------------------------------------------------------------------------------
Message_0156:
#_1CFA7E: db $E8, $59, $1F, $C4, $59, $1A, $59, $29 ; [You]⎵f[ound]⎵a⎵p
#_1CFA86: db $22, $1E, $1C, $1E, $59, $C6, $59, $07 ; iece⎵[of]⎵H
#_1CFA8E: db $A2, $2D, $3E ; [ear]t!
#_1CFA91: db $75 ; line 2
#_1CFA92: db $88, $88, $88, $88, $59, $54, $53 ; [    ][    ][    ][    ]⎵♥♥
#_1CFA99: db $7F ; end of message

;===================================================================================================
; You found a piece of Heart!
;                  ♥♥
;---------------------------------------------------------------------------------------------------
Message_0157:
#_1CFA9A: db $E8, $59, $1F, $C4, $59, $1A, $59, $29 ; [You]⎵f[ound]⎵a⎵p
#_1CFAA2: db $22, $1E, $1C, $1E, $59, $C6, $59, $07 ; iece⎵[of]⎵H
#_1CFAAA: db $A2, $2D, $3E ; [ear]t!
#_1CFAAD: db $75 ; line 2
#_1CFAAE: db $88, $88, $88, $88, $59, $55, $56 ; [    ][    ][    ][    ]⎵♥♥
#_1CFAB5: db $7F ; end of message

;===================================================================================================
; You found a piece of Heart!
;                  ♥♥
; Your Heart level increased!
;---------------------------------------------------------------------------------------------------
Message_0158:
#_1CFAB6: db $E8, $59, $1F, $C4, $59, $1A, $59, $29 ; [You]⎵f[ound]⎵a⎵p
#_1CFABE: db $22, $1E, $1C, $1E, $59, $C6, $59, $07 ; iece⎵[of]⎵H
#_1CFAC6: db $A2, $2D, $3E ; [ear]t!
#_1CFAC9: db $75 ; line 2
#_1CFACA: db $88, $88, $88, $88, $59, $57, $58 ; [    ][    ][    ][    ]⎵♥♥
#_1CFAD1: db $76 ; line 3
#_1CFAD2: db $E8, $2B, $59, $07, $A2, $2D, $59, $25 ; [You]r⎵H[ear]t⎵l
#_1CFADA: db $A7, $1E, $25, $59, $B4, $1C, $CE, $1A ; [ev]el⎵[in]c[re]a
#_1CFAE2: db $D0, $1D, $3E ; [se]d!
#_1CFAE5: db $7F ; end of message

;===================================================================================================
; You found a Heart Container!
;                  ♥♥
; Your Heart level increased!
;---------------------------------------------------------------------------------------------------
Message_0159:
#_1CFAE6: db $E8, $59, $1F, $C4, $59, $1A, $59, $07 ; [You]⎵f[ound]⎵a⎵H
#_1CFAEE: db $A2, $2D, $59, $02, $C7, $2D, $8F, $A6 ; [ear]t⎵C[on]t[ain][er]
#_1CFAF6: db $3E ; !
#_1CFAF7: db $75 ; line 2
#_1CFAF8: db $88, $88, $88, $88, $59, $57, $58 ; [    ][    ][    ][    ]⎵♥♥
#_1CFAFF: db $76 ; line 3
#_1CFB00: db $E8, $2B, $59, $07, $A2, $2D, $59, $25 ; [You]r⎵H[ear]t⎵l
#_1CFB08: db $A7, $1E, $25, $59, $B4, $1C, $CE, $1A ; [ev]el⎵[in]c[re]a
#_1CFB10: db $D0, $1D, $3E ; [se]d!
#_1CFB13: db $7F ; end of message

;===================================================================================================
; I will sooth your wounds and
; comfort your weariness…
; Close your eyes and relax…
;---------------------------------------------------------------------------------------------------
Message_015A:
#_1CFB14: db $08, $59, $E2, $25, $25, $59, $D2, $28 ; I⎵[wi]ll⎵[so]o
#_1CFB1C: db $2D, $21, $59, $E3, $2B, $59, $30, $C4 ; th⎵[you]r⎵w[ound]
#_1CFB24: db $2C, $59, $90 ; s⎵[and]
#_1CFB27: db $75 ; line 2
#_1CFB28: db $9B, $A8, $2D, $59, $E3, $2B, $59, $E0 ; [com][for]t⎵[you]r⎵[we]
#_1CFB30: db $1A, $2B, $B4, $1E, $2C, $2C, $43 ; ar[in]ess…
#_1CFB37: db $76 ; line 3
#_1CFB38: db $02, $BB, $D0, $59, $E3, $2B, $59, $1E ; C[lo][se]⎵[you]r⎵e
#_1CFB40: db $32, $1E, $2C, $59, $8C, $CE, $BA, $31 ; yes⎵[and ][re][la]x
#_1CFB48: db $43 ; …
#_1CFB49: db $7F ; end of message

;===================================================================================================
; Oh?  Who are you, Mr. Bunny?
; This world is like the real
; world, but evil has twisted it.
; The Golden Power is what
; changed your shape to reflect
; what is in your heart and mind.
; I am always changing my mind,
; so I turned into a ball…
; But if you have a ball called
; the Moon Pearl, you can keep
; your original shape here.
;---------------------------------------------------------------------------------------------------
Message_015B:
#_1CFB4A: db $0E, $21, $3F, $8A, $16, $21, $28, $59 ; Oh?[  ]Who⎵
#_1CFB52: db $8D, $E3, $42, $59, $0C, $2B, $41, $59 ; [are ][you],⎵Mr.⎵
#_1CFB5A: db $01, $2E, $27, $27, $32, $3F ; Bunny?
#_1CFB60: db $75 ; line 2
#_1CFB61: db $E7, $2C, $59, $30, $C8, $25, $1D, $59 ; [Thi]s⎵w[or]ld⎵
#_1CFB69: db $B5, $59, $25, $22, $24, $1E, $59, $D8 ; [is]⎵like⎵[the]
#_1CFB71: db $59, $CE, $1A, $25 ; ⎵[re]al
#_1CFB75: db $76 ; line 3
#_1CFB76: db $30, $C8, $25, $1D, $42, $59, $1B, $2E ; w[or]ld,⎵bu
#_1CFB7E: db $2D, $59, $A7, $22, $25, $59, $AE, $59 ; t⎵[ev]il⎵[has]⎵
#_1CFB86: db $2D, $E2, $D3, $A4, $B6, $41 ; t[wi][st][ed ][it].
#_1CFB8C: db $7E ; wait for key
#_1CFB8D: db $73 ; scroll text
#_1CFB8E: db $E6, $59, $06, $28, $25, $1D, $A0, $0F ; [The]⎵Gold[en ]P
#_1CFB96: db $28, $E0, $2B, $59, $B5, $59, $E1, $94 ; o[we]r⎵[is]⎵[wh][at]
#_1CFB9E: db $73 ; scroll text
#_1CFB9F: db $1C, $B1, $27, $20, $A4, $E3, $2B, $59 ; c[ha]ng[ed ][you]r⎵
#_1CFBA7: db $D1, $1A, $29, $1E, $59, $DA, $59, $CE ; [sh]ape⎵[to]⎵[re]
#_1CFBAF: db $1F, $25, $1E, $1C, $2D ; flect
#_1CFBB4: db $73 ; scroll text
#_1CFBB5: db $E1, $91, $B5, $59, $B4, $59, $E3, $2B ; [wh][at ][is]⎵[in]⎵[you]r
#_1CFBBD: db $59, $21, $A2, $2D, $59, $8C, $26, $B4 ; ⎵h[ear]t⎵[and ]m[in]
#_1CFBC5: db $1D, $41 ; d.
#_1CFBC7: db $7E ; wait for key
#_1CFBC8: db $73 ; scroll text
#_1CFBC9: db $08, $59, $1A, $26, $59, $1A, $25, $DF ; I⎵am⎵al[wa]
#_1CFBD1: db $32, $2C, $59, $1C, $B1, $27, $20, $B3 ; ys⎵c[ha]ng[ing ]
#_1CFBD9: db $26, $32, $59, $26, $B4, $1D, $42 ; my⎵m[in]d,
#_1CFBE0: db $73 ; scroll text
#_1CFBE1: db $D2, $59, $08, $59, $2D, $2E, $2B, $27 ; [so]⎵I⎵turn
#_1CFBE9: db $A4, $B4, $DA, $59, $1A, $59, $96, $25 ; [ed ][in][to]⎵a⎵[ba]l
#_1CFBF1: db $25, $43 ; l…
#_1CFBF3: db $73 ; scroll text
#_1CFBF4: db $01, $2E, $2D, $59, $22, $1F, $59, $E3 ; But⎵if⎵[you]
#_1CFBFC: db $59, $AD, $59, $1A, $59, $96, $25, $25 ; ⎵[have]⎵a⎵[ba]ll
#_1CFC04: db $59, $1C, $1A, $25, $25, $1E, $1D ; ⎵called
#_1CFC0B: db $7E ; wait for key
#_1CFC0C: db $73 ; scroll text
#_1CFC0D: db $D8, $59, $0C, $28, $C7, $59, $0F, $A2 ; [the]⎵Mo[on]⎵P[ear]
#_1CFC15: db $25, $42, $59, $E3, $59, $99, $24, $1E ; l,⎵[you]⎵[can ]ke
#_1CFC1D: db $1E, $29 ; ep
#_1CFC1F: db $73 ; scroll text
#_1CFC20: db $E3, $2B, $59, $C8, $22, $20, $B4, $1A ; [you]r⎵[or]ig[in]a
#_1CFC28: db $25, $59, $D1, $1A, $29, $1E, $59, $AF ; l⎵[sh]ape⎵[her]
#_1CFC30: db $1E, $41 ; e.
#_1CFC32: db $7F ; end of message

;===================================================================================================
; You didn't change your shape?
; You aren't just a normal guy,
; are you?
;---------------------------------------------------------------------------------------------------
Message_015C:
#_1CFC33: db $E8, $59, $9E, $1D, $C0, $1C, $B1, $27 ; [You]⎵[di]d[n't ]c[ha]n
#_1CFC3B: db $20, $1E, $59, $E3, $2B, $59, $D1, $1A ; ge⎵[you]r⎵[sh]a
#_1CFC43: db $29, $1E, $3F ; pe?
#_1CFC46: db $75 ; line 2
#_1CFC47: db $E8, $59, $1A, $CE, $C0, $B7, $59, $1A ; [You]⎵a[re][n't ][just]⎵a
#_1CFC4F: db $59, $27, $C8, $BD, $25, $59, $20, $2E ; ⎵n[or][ma]l⎵gu
#_1CFC57: db $32, $42 ; y,
#_1CFC59: db $76 ; line 3
#_1CFC5A: db $8D, $E3, $3F ; [are ][you]?
#_1CFC5D: db $7F ; end of message

;===================================================================================================
; What do you want?!
; Do you have something to say
; to me, silly rabbit?!
; I came here to get the Power
; Of Gold but now I'm a freak and
; I can't go back to the real
; world!  If I only had the Moon
; Pearl from the Tower Of Hera, I
; could go back to my original
; shape!  I've got good reason
; to be stressed out!
; So back off!  Shoo shoo!
;---------------------------------------------------------------------------------------------------
Message_015D:
#_1CFC5E: db $16, $B1, $2D, $59, $9F, $59, $E3, $59 ; W[ha]t⎵[do]⎵[you]⎵
#_1CFC66: db $DF, $27, $2D, $3F, $3E ; [wa]nt?!
#_1CFC6B: db $75 ; line 2
#_1CFC6C: db $03, $28, $59, $E3, $59, $AD, $59, $CF ; Do⎵[you]⎵[have]⎵[some]
#_1CFC74: db $D5, $20, $59, $DA, $59, $2C, $1A, $32 ; [thin]g⎵[to]⎵say
#_1CFC7C: db $76 ; line 3
#_1CFC7D: db $DA, $59, $BE, $42, $59, $2C, $22, $25 ; [to]⎵[me],⎵sil
#_1CFC85: db $B9, $2B, $1A, $1B, $1B, $B6, $3F, $3E ; [ly ]rabb[it]?!
#_1CFC8D: db $7E ; wait for key
#_1CFC8E: db $73 ; scroll text
#_1CFC8F: db $08, $59, $1C, $1A, $BE, $59, $AF, $1E ; I⎵ca[me]⎵[her]e
#_1CFC97: db $59, $DA, $59, $AB, $59, $D8, $59, $0F ; ⎵[to]⎵[get]⎵[the]⎵P
#_1CFC9F: db $28, $E0, $2B ; o[we]r
#_1CFCA2: db $73 ; scroll text
#_1CFCA3: db $0E, $1F, $59, $06, $28, $25, $1D, $59 ; Of⎵Gold⎵
#_1CFCAB: db $1B, $2E, $2D, $59, $27, $28, $30, $59 ; but⎵now⎵
#_1CFCB3: db $08, $51, $26, $59, $1A, $59, $1F, $CE ; I'm⎵a⎵f[re]
#_1CFCBB: db $1A, $24, $59, $90 ; ak⎵[and]
#_1CFCBF: db $73 ; scroll text
#_1CFCC0: db $08, $59, $1C, $93, $51, $2D, $59, $AC ; I⎵c[an]'t⎵[go]
#_1CFCC8: db $59, $96, $9C, $59, $DA, $59, $D8, $59 ; ⎵[ba][ck]⎵[to]⎵[the]⎵
#_1CFCD0: db $CE, $1A, $25 ; [re]al
#_1CFCD3: db $7E ; wait for key
#_1CFCD4: db $73 ; scroll text
#_1CFCD5: db $30, $C8, $25, $1D, $3E, $8A, $08, $1F ; w[or]ld![  ]If
#_1CFCDD: db $59, $08, $59, $C7, $B9, $B1, $1D, $59 ; ⎵I⎵[on][ly ][ha]d⎵
#_1CFCE5: db $D8, $59, $0C, $28, $C7 ; [the]⎵Mo[on]
#_1CFCEA: db $73 ; scroll text
#_1CFCEB: db $0F, $A2, $25, $59, $A9, $26, $59, $D8 ; P[ear]l⎵[fro]m⎵[the]
#_1CFCF3: db $59, $13, $28, $E0, $2B, $59, $0E, $1F ; ⎵To[we]r⎵Of
#_1CFCFB: db $59, $E4, $1A, $42, $59, $08 ; ⎵[Her]a,⎵I
#_1CFD01: db $73 ; scroll text
#_1CFD02: db $1C, $28, $2E, $25, $1D, $59, $AC, $59 ; could⎵[go]⎵
#_1CFD0A: db $96, $9C, $59, $DA, $59, $26, $32, $59 ; [ba][ck]⎵[to]⎵my⎵
#_1CFD12: db $C8, $22, $20, $B4, $1A, $25 ; [or]ig[in]al
#_1CFD18: db $7E ; wait for key
#_1CFD19: db $73 ; scroll text
#_1CFD1A: db $D1, $1A, $29, $1E, $3E, $8A, $08, $51 ; [sh]ape![  ]I'
#_1CFD22: db $2F, $1E, $59, $AC, $2D, $59, $AC, $28 ; ve⎵[go]t⎵[go]o
#_1CFD2A: db $1D, $59, $CE, $1A, $D2, $27 ; d⎵[re]a[so]n
#_1CFD30: db $73 ; scroll text
#_1CFD31: db $DA, $59, $97, $59, $D3, $CE, $2C, $D0 ; [to]⎵[be]⎵[st][re]s[se]
#_1CFD39: db $1D, $59, $28, $2E, $2D, $3E ; d⎵out!
#_1CFD3F: db $73 ; scroll text
#_1CFD40: db $12, $28, $59, $96, $9C, $59, $C6, $1F ; So⎵[ba][ck]⎵[of]f
#_1CFD48: db $3E, $8A, $12, $21, $28, $28, $59, $D1 ; ![  ]Shoo⎵[sh]
#_1CFD50: db $28, $28, $3E ; oo!
#_1CFD53: db $7F ; end of message

;===================================================================================================
; WOW!  Your shape didn't change!
; You got the Moon Pearl, huh?
;---------------------------------------------------------------------------------------------------
Message_015E:
#_1CFD54: db $16, $0E, $16, $3E, $8A, $E8, $2B, $59 ; WOW![  ][You]r⎵
#_1CFD5C: db $D1, $1A, $29, $1E, $59, $9E, $1D, $C0 ; [sh]ape⎵[di]d[n't ]
#_1CFD64: db $1C, $B1, $27, $20, $1E, $3E ; c[ha]nge!
#_1CFD6A: db $75 ; line 2
#_1CFD6B: db $E8, $59, $AC, $2D, $59, $D8, $59, $0C ; [You]⎵[go]t⎵[the]⎵M
#_1CFD73: db $28, $C7, $59, $0F, $A2, $25, $42, $59 ; o[on]⎵P[ear]l,⎵
#_1CFD7B: db $21, $2E, $21, $3F ; huh?
#_1CFD7F: db $7F ; end of message

;===================================================================================================
; In such a dangerous world you
; may need many things.  Select
; something that you like…
;---------------------------------------------------------------------------------------------------
Message_015F:
#_1CFD80: db $08, $27, $59, $2C, $2E, $1C, $21, $59 ; In⎵such⎵
#_1CFD88: db $1A, $59, $1D, $93, $20, $A6, $28, $2E ; a⎵d[an]g[er]ou
#_1CFD90: db $2C, $59, $30, $C8, $25, $1D, $59, $E3 ; s⎵w[or]ld⎵[you]
#_1CFD98: db $75 ; line 2
#_1CFD99: db $BD, $32, $59, $27, $1E, $A4, $BC, $32 ; [ma]y⎵ne[ed ][man]y
#_1CFDA1: db $59, $D5, $20, $2C, $41, $8A, $12, $1E ; ⎵[thin]gs.[  ]Se
#_1CFDA9: db $25, $1E, $1C, $2D ; lect
#_1CFDAD: db $76 ; line 3
#_1CFDAE: db $CF, $D5, $20, $59, $D7, $2D, $59, $E3 ; [some][thin]g⎵[tha]t⎵[you]
#_1CFDB6: db $59, $25, $22, $24, $1E, $43 ; ⎵like…
#_1CFDBC: db $7F ; end of message

;===================================================================================================
; Hi, may I help you?  You can
; open two chests for 30 Rupees.
; Why don't you play?
; What will you do?
;     > Play here
;        Maybe next time
;---------------------------------------------------------------------------------------------------
Message_0160:
#_1CFDBD: db $07, $22, $42, $59, $BD, $32, $59, $08 ; Hi,⎵[ma]y⎵I
#_1CFDC5: db $59, $21, $1E, $25, $29, $59, $E3, $3F ; ⎵help⎵[you]?
#_1CFDCD: db $8A, $E8, $59, $1C, $93 ; [  ][You]⎵c[an]
#_1CFDD2: db $75 ; line 2
#_1CFDD3: db $C3, $59, $2D, $30, $28, $59, $9A, $D3 ; [open]⎵two⎵[che][st]
#_1CFDDB: db $2C, $59, $A8, $59, $37, $34, $59, $11 ; s⎵[for]⎵30⎵R
#_1CFDE3: db $DC, $1E, $1E, $2C, $41 ; [up]ees.
#_1CFDE8: db $76 ; line 3
#_1CFDE9: db $16, $21, $32, $59, $9F, $C0, $E3, $59 ; Why⎵[do][n't ][you]⎵
#_1CFDF1: db $29, $BA, $32, $3F ; p[la]y?
#_1CFDF5: db $7E ; wait for key
#_1CFDF6: db $73 ; scroll text
#_1CFDF7: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_1CFDFF: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_1CFE03: db $73 ; scroll text
#_1CFE04: db $88, $44, $59, $0F, $BA, $32, $59, $AF ; [    ]>⎵P[la]y⎵[her]
#_1CFE0C: db $1E ; e
#_1CFE0D: db $73 ; scroll text
#_1CFE0E: db $88, $89, $0C, $1A, $32, $97, $59, $27 ; [    ][   ]May[be]⎵n
#_1CFE16: db $1E, $31, $2D, $59, $2D, $22, $BE ; ext⎵ti[me]
#_1CFE1D: db $68 ; choose 2 indented
#_1CFE1E: db $7F ; end of message

;===================================================================================================
; Well, come back and play some
; time.  I'll be waiting for you.
; Until then, good bye!
;---------------------------------------------------------------------------------------------------
Message_0161:
#_1CFE1F: db $16, $1E, $25, $25, $42, $59, $9B, $1E ; Well,⎵[com]e
#_1CFE27: db $59, $96, $9C, $59, $8C, $29, $BA, $32 ; ⎵[ba][ck]⎵[and ]p[la]y
#_1CFE2F: db $59, $CF ; ⎵[some]
#_1CFE31: db $75 ; line 2
#_1CFE32: db $2D, $22, $BE, $41, $8A, $08, $51, $25 ; ti[me].[  ]I'l
#_1CFE3A: db $25, $59, $97, $59, $DF, $B6, $B3, $A8 ; l⎵[be]⎵[wa][it][ing ][for]
#_1CFE42: db $59, $E3, $41 ; ⎵[you].
#_1CFE45: db $76 ; line 3
#_1CFE46: db $14, $27, $2D, $22, $25, $59, $D8, $27 ; Until⎵[the]n
#_1CFE4E: db $42, $59, $AC, $28, $1D, $59, $1B, $32 ; ,⎵[go]od⎵by
#_1CFE56: db $1E, $3E ; e!
#_1CFE58: db $7F ; end of message

;===================================================================================================
; Hey kid!
; You can open a chest after
; paying Rupees!
;---------------------------------------------------------------------------------------------------
Message_0162:
#_1CFE59: db $07, $1E, $32, $59, $24, $22, $1D, $3E ; Hey⎵kid!
#_1CFE61: db $75 ; line 2
#_1CFE62: db $E8, $59, $99, $C3, $59, $1A, $59, $9A ; [You]⎵[can ][open]⎵a⎵[che]
#_1CFE6A: db $D3, $59, $1A, $1F, $D6 ; [st]⎵af[ter]
#_1CFE6F: db $76 ; line 3
#_1CFE70: db $29, $1A, $32, $B3, $11, $DC, $1E, $1E ; pay[ing ]R[up]ee
#_1CFE78: db $2C, $3E ; s!
#_1CFE7A: db $7F ; end of message

;===================================================================================================
; You can't open any more
; chests.  The game is over.
;---------------------------------------------------------------------------------------------------
Message_0163:
#_1CFE7B: db $E8, $59, $1C, $93, $51, $2D, $59, $C3 ; [You]⎵c[an]'t⎵[open]
#_1CFE83: db $59, $93, $32, $59, $26, $C8, $1E ; ⎵[an]y⎵m[or]e
#_1CFE8A: db $75 ; line 2
#_1CFE8B: db $9A, $D3, $2C, $41, $8A, $E6, $59, $20 ; [che][st]s.[  ][The]⎵g
#_1CFE93: db $1A, $BE, $59, $B5, $59, $28, $DD, $41 ; a[me]⎵[is]⎵o[ver].
#_1CFE9B: db $7F ; end of message

;===================================================================================================
; All right, kid.
; Choose well!  Good luck!
;---------------------------------------------------------------------------------------------------
Message_0164:
#_1CFE9C: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_1CFEA4: db $2D, $42, $59, $24, $22, $1D, $41 ; t,⎵kid.
#_1CFEAB: db $75 ; line 2
#_1CFEAC: db $02, $21, $28, $28, $D0, $59, $E0, $25 ; Choo[se]⎵[we]l
#_1CFEB4: db $25, $3E, $8A, $06, $28, $28, $1D, $59 ; l![  ]Good⎵
#_1CFEBC: db $25, $2E, $9C, $3E ; lu[ck]!
#_1CFEC0: db $7F ; end of message

;===================================================================================================
; May I help you?  Select the
; thing you like (Press the Ⓐ
; Button).  Prices as marked!
;---------------------------------------------------------------------------------------------------
Message_0165:
#_1CFEC1: db $0C, $1A, $32, $59, $08, $59, $21, $1E ; May⎵I⎵he
#_1CFEC9: db $25, $29, $59, $E3, $3F, $8A, $12, $1E ; lp⎵[you]?[  ]Se
#_1CFED1: db $25, $1E, $1C, $2D, $59, $D8 ; lect⎵[the]
#_1CFED7: db $75 ; line 2
#_1CFED8: db $D5, $20, $59, $E3, $59, $25, $22, $24 ; [thin]g⎵[you]⎵lik
#_1CFEE0: db $1E, $59, $45, $0F, $CE, $2C, $2C, $59 ; e⎵(P[re]ss⎵
#_1CFEE8: db $D8, $59, $5B ; [the]⎵Ⓐ
#_1CFEEB: db $76 ; line 3
#_1CFEEC: db $01, $2E, $2D, $DA, $27, $46, $41, $8A ; But[to]n).[  ]
#_1CFEF4: db $0F, $2B, $22, $1C, $1E, $2C, $59, $1A ; Prices⎵a
#_1CFEFC: db $2C, $59, $BD, $2B, $24, $1E, $1D, $3E ; s⎵[ma]rked!
#_1CFF04: db $7F ; end of message

;===================================================================================================
; You don't need that item…
; Why not select something else?
;---------------------------------------------------------------------------------------------------
Message_0166:
#_1CFF05: db $E8, $59, $9F, $C0, $27, $1E, $A4, $D7 ; [You]⎵[do][n't ]ne[ed ][tha]
#_1CFF0D: db $2D, $59, $B6, $1E, $26, $43 ; t⎵[it]em…
#_1CFF13: db $75 ; line 2
#_1CFF14: db $16, $21, $32, $59, $C2, $59, $D0, $25 ; Why⎵[not]⎵[se]l
#_1CFF1C: db $1E, $1C, $2D, $59, $CF, $D5, $20, $59 ; ect⎵[some][thin]g⎵
#_1CFF24: db $1E, $25, $D0, $3F ; el[se]?
#_1CFF28: db $7F ; end of message

;---------------------------------------------------------------------------------------------------

#_1CFF29: db $80 ; change banks

;---------------------------------------------------------------------------------------------------

;===================================================================================================
; FREE ROM: 0xD6
;===================================================================================================
NULL_1CFF2A:
#_1CFF2A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF32: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF3A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF42: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF4A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF52: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF5A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF62: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF6A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF72: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF7A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF82: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF8A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF92: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFF9A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFA2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFAA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFB2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFBA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFC2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFCA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFD2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFDA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFE2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFEA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFF2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_1CFFFA: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; Text bank change
;---------------------------------------------------------------------------------------------------
;===================================================================================================

org $0EDF40

Message_DataExtra:

;===================================================================================================
; Thank you very much.
; Whenever you lose your shield,
; come back here again.
;---------------------------------------------------------------------------------------------------
Message_0167:
#_0EDF40: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_0EDF48: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_0EDF4D: db $75 ; line 2
#_0EDF4E: db $16, $21, $A5, $A7, $A1, $E3, $59, $BB ; Wh[en][ev][er ][you]⎵[lo]
#_0EDF56: db $D0, $59, $E3, $2B, $59, $D1, $22, $1E ; [se]⎵[you]r⎵[sh]ie
#_0EDF5E: db $25, $1D, $42 ; ld,
#_0EDF61: db $76 ; line 3
#_0EDF62: db $9B, $1E, $59, $96, $9C, $59, $AF, $1E ; [com]e⎵[ba][ck]⎵[her]e
#_0EDF6A: db $59, $1A, $20, $8F, $41 ; ⎵ag[ain].
#_0EDF6F: db $7F ; end of message

;===================================================================================================
; Thank you very much.
; This is the Medicine of Life.
; It helps you recover your Life.
;---------------------------------------------------------------------------------------------------
Message_0168:
#_0EDF70: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_0EDF78: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_0EDF7D: db $75 ; line 2
#_0EDF7E: db $E7, $2C, $59, $B5, $59, $D8, $59, $0C ; [Thi]s⎵[is]⎵[the]⎵M
#_0EDF86: db $1E, $9E, $1C, $B4, $1E, $59, $C6, $59 ; e[di]c[in]e⎵[of]⎵
#_0EDF8E: db $0B, $22, $1F, $1E, $41 ; Life.
#_0EDF93: db $76 ; line 3
#_0EDF94: db $08, $2D, $59, $21, $1E, $25, $29, $2C ; It⎵helps
#_0EDF9C: db $59, $E3, $59, $CE, $1C, $28, $DD, $59 ; ⎵[you]⎵[re]co[ver]⎵
#_0EDFA4: db $E3, $2B, $59, $0B, $22, $1F, $1E, $41 ; [you]r⎵Life.
#_0EDFAC: db $7F ; end of message

;===================================================================================================
; Thank you very much.
; These are Arrows.  You can't
; use them without a Bow.
;---------------------------------------------------------------------------------------------------
Message_0169:
#_0EDFAD: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_0EDFB5: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_0EDFBA: db $75 ; line 2
#_0EDFBB: db $E6, $D0, $59, $8D, $00, $2B, $2B, $28 ; [The][se]⎵[are ]Arro
#_0EDFC3: db $30, $2C, $41, $8A, $E8, $59, $1C, $93 ; ws.[  ][You]⎵c[an]
#_0EDFCB: db $51, $2D ; 't
#_0EDFCD: db $76 ; line 3
#_0EDFCE: db $2E, $D0, $59, $D8, $26, $59, $DE, $C5 ; u[se]⎵[the]m⎵[with][out ]
#_0EDFD6: db $1A, $59, $01, $28, $30, $41 ; a⎵Bow.
#_0EDFDC: db $7F ; end of message

;===================================================================================================
; These are Bombs.
; Did you know you can pick up
; a Bomb you already placed ?
; (Press the Ⓐ Button).
;---------------------------------------------------------------------------------------------------
Message_016A:
#_0EDFDD: db $E6, $D0, $59, $8D, $01, $28, $26, $1B ; [The][se]⎵[are ]Bomb
#_0EDFE5: db $2C, $41 ; s.
#_0EDFE7: db $75 ; line 2
#_0EDFE8: db $03, $22, $1D, $59, $E3, $59, $B8, $59 ; Did⎵[you]⎵[know]⎵
#_0EDFF0: db $E3, $59, $99, $29, $22, $9C, $59, $DC ; [you]⎵[can ]pi[ck]⎵[up]
#_0EDFF8: db $76 ; line 3
#_0EDFF9: db $1A, $59, $01, $28, $26, $1B, $59, $E3 ; a⎵Bomb⎵[you]
#_0EE001: db $59, $1A, $25, $CE, $1A, $1D, $32, $59 ; ⎵al[re]ady⎵
#_0EE009: db $29, $BA, $1C, $A4, $3F ; p[la]c[ed ]?
#_0EE00E: db $7E ; wait for key
#_0EE00F: db $73 ; scroll text
#_0EE010: db $45, $0F, $CE, $2C, $2C, $59, $D8, $59 ; (P[re]ss⎵[the]⎵
#_0EE018: db $5B, $59, $01, $2E, $2D, $DA, $27, $46 ; Ⓐ⎵But[to]n)
#_0EE020: db $41 ; .
#_0EE021: db $7F ; end of message

;===================================================================================================
; Thank you very much.
; That is a Bee.  Don't ask me
; what it is used for, either.
;---------------------------------------------------------------------------------------------------
Message_016B:
#_0EE022: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_0EE02A: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_0EE02F: db $75 ; line 2
#_0EE030: db $E5, $2D, $59, $B5, $59, $1A, $59, $01 ; [Tha]t⎵[is]⎵a⎵B
#_0EE038: db $1E, $1E, $41, $8A, $03, $C7, $51, $2D ; ee.[  ]D[on]'t
#_0EE040: db $59, $1A, $2C, $24, $59, $BE ; ⎵ask⎵[me]
#_0EE046: db $76 ; line 3
#_0EE047: db $E1, $91, $B6, $59, $B5, $59, $2E, $D0 ; [wh][at ][it]⎵[is]⎵u[se]
#_0EE04F: db $1D, $59, $A8, $42, $59, $1E, $B6, $AF ; d⎵[for],⎵e[it][her]
#_0EE057: db $41 ; .
#_0EE058: db $7F ; end of message

;===================================================================================================
; Thank you very much.
; You can recover one Heart.
;---------------------------------------------------------------------------------------------------
Message_016C:
#_0EE059: db $E5, $27, $24, $59, $E3, $59, $DD, $32 ; [Tha]nk⎵[you]⎵[ver]y
#_0EE061: db $59, $BF, $1C, $21, $41 ; ⎵[mu]ch.
#_0EE066: db $75 ; line 2
#_0EE067: db $E8, $59, $99, $CE, $1C, $28, $DD, $59 ; [You]⎵[can ][re]co[ver]⎵
#_0EE06F: db $C7, $1E, $59, $07, $A2, $2D, $41 ; [on]e⎵H[ear]t.
#_0EE076: db $7F ; end of message

;===================================================================================================
; No no no…  I can't sell the
; merchandise because you don't
; have an empty bottle.
;---------------------------------------------------------------------------------------------------
Message_016D:
#_0EE077: db $0D, $28, $59, $27, $28, $59, $27, $28 ; No⎵no⎵no
#_0EE07F: db $43, $8A, $08, $59, $1C, $93, $51, $2D ; …[  ]I⎵c[an]'t
#_0EE087: db $59, $D0, $25, $25, $59, $D8 ; ⎵[se]ll⎵[the]
#_0EE08D: db $75 ; line 2
#_0EE08E: db $BE, $2B, $1C, $B1, $27, $9E, $D0, $59 ; [me]rc[ha]n[di][se]⎵
#_0EE096: db $97, $1C, $1A, $2E, $D0, $59, $E3, $59 ; [be]cau[se]⎵[you]⎵
#_0EE09E: db $9F, $27, $51, $2D ; [do]n't
#_0EE0A2: db $76 ; line 3
#_0EE0A3: db $AD, $59, $93, $59, $1E, $26, $29, $2D ; [have]⎵[an]⎵empt
#_0EE0AB: db $32, $59, $98, $2D, $2D, $25, $1E, $41 ; y⎵[bo]ttle.
#_0EE0B3: db $7F ; end of message

;===================================================================================================
; You can't carry any more
; now, but you may need
; some later!
;---------------------------------------------------------------------------------------------------
Message_016E:
#_0EE0B4: db $E8, $59, $1C, $93, $51, $2D, $59, $1C ; [You]⎵c[an]'t⎵c
#_0EE0BC: db $1A, $2B, $2B, $32, $59, $93, $32, $59 ; arry⎵[an]y⎵
#_0EE0C4: db $26, $C8, $1E ; m[or]e
#_0EE0C7: db $75 ; line 2
#_0EE0C8: db $27, $28, $30, $42, $59, $1B, $2E, $2D ; now,⎵but
#_0EE0D0: db $59, $E3, $59, $BD, $32, $59, $27, $1E ; ⎵[you]⎵[ma]y⎵ne
#_0EE0D8: db $1E, $1D ; ed
#_0EE0DA: db $76 ; line 3
#_0EE0DB: db $CF, $59, $BA, $D6, $3E ; [some]⎵[la][ter]!
#_0EE0E0: db $7F ; end of message

;===================================================================================================
; I never imagined a boy like you
; could give me so much trouble.
; It's unbelievable that you
; defeated my alterego, Agahnim
; the Dark Wizard, twice!
; But I will never give you the
; Triforce.  I will destroy you
; and make my wish to conquer
; both Light and Dark Worlds
; come true without delay.
;---------------------------------------------------------------------------------------------------
Message_016F:
#_0EE0E1: db $08, $59, $27, $A7, $A1, $22, $BD, $20 ; I⎵n[ev][er ]i[ma]g
#_0EE0E9: db $B4, $A4, $1A, $59, $98, $32, $59, $25 ; [in][ed ]a⎵[bo]y⎵l
#_0EE0F1: db $22, $24, $1E, $59, $E3 ; ike⎵[you]
#_0EE0F6: db $75 ; line 2
#_0EE0F7: db $1C, $28, $2E, $25, $1D, $59, $AA, $BE ; could⎵[give ][me]
#_0EE0FF: db $59, $D2, $59, $BF, $1C, $21, $59, $DB ; ⎵[so]⎵[mu]ch⎵[tr]
#_0EE107: db $28, $2E, $95, $41 ; ou[ble].
#_0EE10B: db $76 ; line 3
#_0EE10C: db $08, $2D, $8B, $2E, $27, $97, $25, $22 ; It['s ]un[be]li
#_0EE114: db $A7, $1A, $95, $59, $D7, $2D, $59, $E3 ; [ev]a[ble]⎵[tha]t⎵[you]
#_0EE11C: db $7E ; wait for key
#_0EE11D: db $73 ; scroll text
#_0EE11E: db $1D, $1E, $1F, $1E, $94, $A4, $26, $32 ; defe[at][ed ]my
#_0EE126: db $59, $1A, $25, $D6, $1E, $AC, $42, $59 ; ⎵al[ter]e[go],⎵
#_0EE12E: db $00, $20, $1A, $21, $27, $22, $26 ; Agahnim
#_0EE135: db $73 ; scroll text
#_0EE136: db $D8, $59, $03, $1A, $2B, $24, $59, $16 ; [the]⎵Dark⎵W
#_0EE13E: db $22, $33, $1A, $2B, $1D, $42, $59, $2D ; izard,⎵t
#_0EE146: db $E2, $1C, $1E, $3E ; [wi]ce!
#_0EE14A: db $7E ; wait for key
#_0EE14B: db $73 ; scroll text
#_0EE14C: db $01, $2E, $2D, $59, $08, $59, $E2, $25 ; But⎵I⎵[wi]l
#_0EE154: db $25, $59, $27, $A7, $A1, $AA, $E3, $59 ; l⎵n[ev][er ][give ][you]⎵
#_0EE15C: db $D8 ; [the]
#_0EE15D: db $73 ; scroll text
#_0EE15E: db $13, $2B, $22, $A8, $1C, $1E, $41, $8A ; Tri[for]ce.[  ]
#_0EE166: db $08, $59, $E2, $25, $25, $59, $9D, $DB ; I⎵[wi]ll⎵[des][tr]
#_0EE16E: db $28, $32, $59, $E3 ; oy⎵[you]
#_0EE172: db $73 ; scroll text
#_0EE173: db $8C, $BD, $24, $1E, $59, $26, $32, $59 ; [and ][ma]ke⎵my⎵
#_0EE17B: db $E2, $D1, $59, $DA, $59, $1C, $C7, $2A ; [wi][sh]⎵[to]⎵c[on]q
#_0EE183: db $2E, $A6 ; u[er]
#_0EE185: db $7E ; wait for key
#_0EE186: db $73 ; scroll text
#_0EE187: db $98, $2D, $21, $59, $0B, $B2, $8C, $03 ; [bo]th⎵L[ight ][and ]D
#_0EE18F: db $1A, $2B, $24, $59, $16, $C8, $25, $1D ; ark⎵W[or]ld
#_0EE197: db $2C ; s
#_0EE198: db $73 ; scroll text
#_0EE199: db $9B, $1E, $59, $DB, $2E, $1E, $59, $DE ; [com]e⎵[tr]ue⎵[with]
#_0EE1A1: db $C5, $1D, $1E, $BA, $32, $41 ; [out ]de[la]y.
#_0EE1A7: db $7F ; end of message

;===================================================================================================
; You are doing well, lad.  But
; can you break through this
; secret technique of Darkness?
; En Garde!
;---------------------------------------------------------------------------------------------------
Message_0170:
#_0EE1A8: db $E8, $59, $8D, $9F, $B3, $E0, $25, $25 ; [You]⎵[are ][do][ing ][we]ll
#_0EE1B0: db $42, $59, $BA, $1D, $41, $8A, $01, $2E ; ,⎵[la]d.[  ]Bu
#_0EE1B8: db $2D ; t
#_0EE1B9: db $75 ; line 2
#_0EE1BA: db $99, $E3, $59, $1B, $CE, $1A, $24, $59 ; [can ][you]⎵b[re]ak⎵
#_0EE1C2: db $2D, $21, $2B, $28, $2E, $20, $21, $59 ; through⎵
#_0EE1CA: db $D9, $2C ; [thi]s
#_0EE1CC: db $76 ; line 3
#_0EE1CD: db $D0, $1C, $CE, $2D, $59, $2D, $1E, $1C ; [se]c[re]t⎵tec
#_0EE1D5: db $21, $27, $22, $2A, $2E, $1E, $59, $C6 ; hnique⎵[of]
#_0EE1DD: db $59, $03, $1A, $2B, $24, $27, $1E, $2C ; ⎵Darknes
#_0EE1E5: db $2C, $3F ; s?
#_0EE1E7: db $7E ; wait for key
#_0EE1E8: db $73 ; scroll text
#_0EE1E9: db $04, $27, $59, $06, $1A, $2B, $1D, $1E ; En⎵Garde
#_0EE1F1: db $3E ; !
#_0EE1F2: db $7F ; end of message

;===================================================================================================
; Hey kid, this is a secret hide-
; out for a gang of thieves!
; Don't enter without permission!
; By the way, I heard that one
; of our ex-members is staying
; at the entrance to the Desert.
;---------------------------------------------------------------------------------------------------
Message_0171:
#_0EE1F3: db $07, $1E, $32, $59, $24, $22, $1D, $42 ; Hey⎵kid,
#_0EE1FB: db $59, $D9, $2C, $59, $B5, $59, $1A, $59 ; ⎵[thi]s⎵[is]⎵a⎵
#_0EE203: db $D0, $1C, $CE, $2D, $59, $B0, $1D, $1E ; [se]c[re]t⎵[hi]de
#_0EE20B: db $40 ; -
#_0EE20C: db $75 ; line 2
#_0EE20D: db $C5, $A8, $59, $1A, $59, $20, $93, $20 ; [out ][for]⎵a⎵g[an]g
#_0EE215: db $59, $C6, $59, $D9, $A7, $1E, $2C, $3E ; ⎵[of]⎵[thi][ev]es!
#_0EE21D: db $76 ; line 3
#_0EE21E: db $03, $C7, $51, $2D, $59, $A3, $A1, $DE ; D[on]'t⎵[ent][er ][with]
#_0EE226: db $C5, $C9, $26, $B5, $2C, $22, $C7, $3E ; [out ][per]m[is]si[on]!
#_0EE22E: db $7E ; wait for key
#_0EE22F: db $73 ; scroll text
#_0EE230: db $01, $32, $59, $D8, $59, $DF, $32, $42 ; By⎵[the]⎵[wa]y,
#_0EE238: db $59, $08, $59, $21, $A2, $1D, $59, $D7 ; ⎵I⎵h[ear]d⎵[tha]
#_0EE240: db $2D, $59, $C7, $1E ; t⎵[on]e
#_0EE244: db $73 ; scroll text
#_0EE245: db $C6, $59, $28, $2E, $2B, $59, $1E, $31 ; [of]⎵our⎵ex
#_0EE24D: db $40, $BE, $26, $97, $2B, $2C, $59, $B5 ; -[me]m[be]rs⎵[is]
#_0EE255: db $59, $D3, $1A, $32, $B4, $20 ; ⎵[st]ay[in]g
#_0EE25B: db $73 ; scroll text
#_0EE25C: db $91, $D8, $59, $A3, $2B, $93, $1C, $1E ; [at ][the]⎵[ent]r[an]ce
#_0EE264: db $59, $DA, $59, $D8, $59, $03, $1E, $D0 ; ⎵[to]⎵[the]⎵De[se]
#_0EE26C: db $2B, $2D, $41 ; rt.
#_0EE26F: db $7F ; end of message

;===================================================================================================
; Yo [LINK]!  This house used
; to be a hideout for a gang of
; thieves.
; What was their leader's name…
; Oh yeah, his name was Blind and
; he hated bright light a lot.
;---------------------------------------------------------------------------------------------------
Message_0172:
#_0EE270: db $18, $28, $59, $6A, $3E, $8A, $E7, $2C ; Yo⎵[LINK]![  ][Thi]s
#_0EE278: db $59, $21, $28, $2E, $D0, $59, $2E, $D0 ; ⎵hou[se]⎵u[se]
#_0EE280: db $1D ; d
#_0EE281: db $75 ; line 2
#_0EE282: db $DA, $59, $97, $59, $1A, $59, $B0, $1D ; [to]⎵[be]⎵a⎵[hi]d
#_0EE28A: db $1E, $C5, $A8, $59, $1A, $59, $20, $93 ; e[out ][for]⎵a⎵g[an]
#_0EE292: db $20, $59, $C6 ; g⎵[of]
#_0EE295: db $76 ; line 3
#_0EE296: db $D9, $A7, $1E, $2C, $41 ; [thi][ev]es.
#_0EE29B: db $7E ; wait for key
#_0EE29C: db $73 ; scroll text
#_0EE29D: db $16, $B1, $2D, $59, $DF, $2C, $59, $D8 ; W[ha]t⎵[wa]s⎵[the]
#_0EE2A5: db $22, $2B, $59, $25, $1E, $1A, $1D, $A6 ; ir⎵lead[er]
#_0EE2AD: db $8B, $27, $1A, $BE, $43 ; ['s ]na[me]…
#_0EE2B2: db $73 ; scroll text
#_0EE2B3: db $0E, $21, $59, $32, $1E, $1A, $21, $42 ; Oh⎵yeah,
#_0EE2BB: db $59, $B0, $2C, $59, $27, $1A, $BE, $59 ; ⎵[hi]s⎵na[me]⎵
#_0EE2C3: db $DF, $2C, $59, $01, $25, $B4, $1D, $59 ; [wa]s⎵Bl[in]d⎵
#_0EE2CB: db $90 ; [and]
#_0EE2CC: db $73 ; scroll text
#_0EE2CD: db $21, $1E, $59, $B1, $2D, $A4, $1B, $2B ; he⎵[ha]t[ed ]br
#_0EE2D5: db $B2, $25, $B2, $1A, $59, $BB, $2D, $41 ; [ight ]l[ight ]a⎵[lo]t.
#_0EE2DD: db $7F ; end of message

;===================================================================================================
; Welcome, [LINK]…
; I   am   the   Essence   Of   The
; Triforce.
; …   …   …
;                                           
;                                           
;                                           
; The Triforce will grant the
; wishes in the heart and mind of
; the person who touches it.
;                                           
;                                           
;                                           
; If a person with a good heart
; touches it, it will make his good
; wishes come true…  If an evil-
; hearted person touches it, it
; grants his evil wishes.
;                                           
;                                           
;                                           
; The stronger the wish, the
; more powerful the Triforce's
; expression of that wish.
;                                           
;                                           
;                                           
; Ganon's wish was to conquer
; the world.  That wish changed
; the Golden Land to the Dark
; World.
;                                           
;                                           
;                                           
; Ganon was building up his
; power here so he could conquer
; the Light World and make his
; wish come completely true.
;                                           
;                                           
;                                           
; But now, you have totally
; destroyed Ganon.  His Dark
; World will vanish.
;                                           
;                                           
;                                           
; The Triforce is waiting for a
; new owner.  Its Golden Power is
; in your hands…
;                                           
;                                           
;                                           
; Now, touch it with a wish in
; your heart.
; …  …  …  …
;---------------------------------------------------------------------------------------------------
Message_0173:
#_0EE2DE: db $7A, $02 ; set draw speed
#_0EE2E0: db $6D, $00 ; set window position
#_0EE2E2: db $6B, $02 ; set window border
#_0EE2E4: db $16, $1E, $25, $9B, $1E, $42, $59, $6A ; Wel[com]e,⎵[LINK]
#_0EE2EC: db $43 ; …
#_0EE2ED: db $75 ; line 2
#_0EE2EE: db $08, $89, $1A, $26, $89, $D8, $89, $04 ; I[   ]am[   ][the][   ]E
#_0EE2F6: db $2C, $D0, $27, $1C, $1E, $89, $0E, $1F ; s[se]nce[   ]Of
#_0EE2FE: db $89, $E6 ; [   ][The]
#_0EE300: db $76 ; line 3
#_0EE301: db $13, $2B, $22, $A8, $1C, $1E, $41 ; Tri[for]ce.
#_0EE308: db $7E ; wait for key
#_0EE309: db $73 ; scroll text
#_0EE30A: db $43, $89, $43, $89, $43 ; …[   ]…[   ]…
#_0EE30F: db $7A, $01 ; set draw speed
#_0EE311: db $7E ; wait for key
#_0EE312: db $74 ; line 1
#_0EE313: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE31B: db $88, $88, $8A ; [    ][    ][  ]
#_0EE31E: db $75 ; line 2
#_0EE31F: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE327: db $88, $88, $8A ; [    ][    ][  ]
#_0EE32A: db $76 ; line 3
#_0EE32B: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE333: db $88, $88, $8A ; [    ][    ][  ]
#_0EE336: db $7A, $02 ; set draw speed
#_0EE338: db $74 ; line 1
#_0EE339: db $E6, $59, $13, $2B, $22, $A8, $1C, $1E ; [The]⎵Tri[for]ce
#_0EE341: db $59, $E2, $25, $25, $59, $20, $2B, $93 ; ⎵[wi]ll⎵gr[an]
#_0EE349: db $2D, $59, $D8 ; t⎵[the]
#_0EE34C: db $75 ; line 2
#_0EE34D: db $E2, $D1, $1E, $2C, $59, $B4, $59, $D8 ; [wi][sh]es⎵[in]⎵[the]
#_0EE355: db $59, $21, $A2, $2D, $59, $8C, $26, $B4 ; ⎵h[ear]t⎵[and ]m[in]
#_0EE35D: db $1D, $59, $C6 ; d⎵[of]
#_0EE360: db $76 ; line 3
#_0EE361: db $D8, $59, $C9, $D2, $27, $59, $E1, $28 ; [the]⎵[per][so]n⎵[wh]o
#_0EE369: db $59, $DA, $2E, $9A, $2C, $59, $B6, $41 ; ⎵[to]u[che]s⎵[it].
#_0EE371: db $7A, $01 ; set draw speed
#_0EE373: db $7E ; wait for key
#_0EE374: db $74 ; line 1
#_0EE375: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE37D: db $88, $88, $8A ; [    ][    ][  ]
#_0EE380: db $75 ; line 2
#_0EE381: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE389: db $88, $88, $8A ; [    ][    ][  ]
#_0EE38C: db $76 ; line 3
#_0EE38D: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE395: db $88, $88, $8A ; [    ][    ][  ]
#_0EE398: db $7A, $02 ; set draw speed
#_0EE39A: db $74 ; line 1
#_0EE39B: db $08, $1F, $59, $1A, $59, $C9, $D2, $27 ; If⎵a⎵[per][so]n
#_0EE3A3: db $59, $DE, $59, $1A, $59, $AC, $28, $1D ; ⎵[with]⎵a⎵[go]od
#_0EE3AB: db $59, $21, $A2, $2D ; ⎵h[ear]t
#_0EE3AF: db $75 ; line 2
#_0EE3B0: db $DA, $2E, $9A, $2C, $59, $B6, $42, $59 ; [to]u[che]s⎵[it],⎵
#_0EE3B8: db $B6, $59, $E2, $25, $25, $59, $BD, $24 ; [it]⎵[wi]ll⎵[ma]k
#_0EE3C0: db $1E, $59, $B0, $2C, $59, $AC, $28, $1D ; e⎵[hi]s⎵[go]od
#_0EE3C8: db $76 ; line 3
#_0EE3C9: db $E2, $D1, $1E, $2C, $59, $9B, $1E, $59 ; [wi][sh]es⎵[com]e⎵
#_0EE3D1: db $DB, $2E, $1E, $43, $8A, $08, $1F, $59 ; [tr]ue…[  ]If⎵
#_0EE3D9: db $93, $59, $A7, $22, $25, $40 ; [an]⎵[ev]il-
#_0EE3DF: db $7E ; wait for key
#_0EE3E0: db $73 ; scroll text
#_0EE3E1: db $21, $A2, $2D, $A4, $C9, $D2, $27, $59 ; h[ear]t[ed ][per][so]n⎵
#_0EE3E9: db $DA, $2E, $9A, $2C, $59, $B6, $42, $59 ; [to]u[che]s⎵[it],⎵
#_0EE3F1: db $B6 ; [it]
#_0EE3F2: db $73 ; scroll text
#_0EE3F3: db $20, $2B, $93, $2D, $2C, $59, $B0, $2C ; gr[an]ts⎵[hi]s
#_0EE3FB: db $59, $A7, $22, $25, $59, $E2, $D1, $1E ; ⎵[ev]il⎵[wi][sh]e
#_0EE403: db $2C, $41 ; s.
#_0EE405: db $7A, $01 ; set draw speed
#_0EE407: db $7E ; wait for key
#_0EE408: db $74 ; line 1
#_0EE409: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE411: db $88, $88, $8A ; [    ][    ][  ]
#_0EE414: db $75 ; line 2
#_0EE415: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE41D: db $88, $88, $8A ; [    ][    ][  ]
#_0EE420: db $76 ; line 3
#_0EE421: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE429: db $88, $88, $8A ; [    ][    ][  ]
#_0EE42C: db $7A, $02 ; set draw speed
#_0EE42E: db $74 ; line 1
#_0EE42F: db $E6, $59, $D3, $2B, $C7, $20, $A1, $D8 ; [The]⎵[st]r[on]g[er ][the]
#_0EE437: db $59, $E2, $D1, $42, $59, $D8 ; ⎵[wi][sh],⎵[the]
#_0EE43D: db $75 ; line 2
#_0EE43E: db $26, $C8, $1E, $59, $CB, $A6, $1F, $2E ; m[or]e⎵[pow][er]fu
#_0EE446: db $25, $59, $D8, $59, $13, $2B, $22, $A8 ; l⎵[the]⎵Tri[for]
#_0EE44E: db $1C, $1E, $51, $2C ; ce's
#_0EE452: db $76 ; line 3
#_0EE453: db $1E, $31, $29, $CE, $2C, $2C, $22, $C7 ; exp[re]ssi[on]
#_0EE45B: db $59, $C6, $59, $D7, $2D, $59, $E2, $D1 ; ⎵[of]⎵[tha]t⎵[wi][sh]
#_0EE463: db $41 ; .
#_0EE464: db $7A, $01 ; set draw speed
#_0EE466: db $7E ; wait for key
#_0EE467: db $74 ; line 1
#_0EE468: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE470: db $88, $88, $8A ; [    ][    ][  ]
#_0EE473: db $75 ; line 2
#_0EE474: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE47C: db $88, $88, $8A ; [    ][    ][  ]
#_0EE47F: db $76 ; line 3
#_0EE480: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE488: db $88, $88, $8A ; [    ][    ][  ]
#_0EE48B: db $7A, $02 ; set draw speed
#_0EE48D: db $74 ; line 1
#_0EE48E: db $06, $93, $C7, $8B, $E2, $D1, $59, $DF ; G[an][on]['s ][wi][sh]⎵[wa]
#_0EE496: db $2C, $59, $DA, $59, $1C, $C7, $2A, $2E ; s⎵[to]⎵c[on]qu
#_0EE49E: db $A6 ; [er]
#_0EE49F: db $75 ; line 2
#_0EE4A0: db $D8, $59, $30, $C8, $25, $1D, $41, $8A ; [the]⎵w[or]ld.[  ]
#_0EE4A8: db $E5, $2D, $59, $E2, $D1, $59, $1C, $B1 ; [Tha]t⎵[wi][sh]⎵c[ha]
#_0EE4B0: db $27, $20, $1E, $1D ; nged
#_0EE4B4: db $76 ; line 3
#_0EE4B5: db $D8, $59, $06, $28, $25, $1D, $A0, $0B ; [the]⎵Gold[en ]L
#_0EE4BD: db $8C, $DA, $59, $D8, $59, $03, $1A, $2B ; [and ][to]⎵[the]⎵Dar
#_0EE4C5: db $24 ; k
#_0EE4C6: db $7E ; wait for key
#_0EE4C7: db $73 ; scroll text
#_0EE4C8: db $16, $C8, $25, $1D, $41 ; W[or]ld.
#_0EE4CD: db $7A, $01 ; set draw speed
#_0EE4CF: db $7E ; wait for key
#_0EE4D0: db $74 ; line 1
#_0EE4D1: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE4D9: db $88, $88, $8A ; [    ][    ][  ]
#_0EE4DC: db $75 ; line 2
#_0EE4DD: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE4E5: db $88, $88, $8A ; [    ][    ][  ]
#_0EE4E8: db $76 ; line 3
#_0EE4E9: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE4F1: db $88, $88, $8A ; [    ][    ][  ]
#_0EE4F4: db $7A, $02 ; set draw speed
#_0EE4F6: db $74 ; line 1
#_0EE4F7: db $06, $93, $C7, $59, $DF, $2C, $59, $1B ; G[an][on]⎵[wa]s⎵b
#_0EE4FF: db $2E, $22, $25, $9E, $27, $20, $59, $DC ; uil[di]ng⎵[up]
#_0EE507: db $59, $B0, $2C ; ⎵[hi]s
#_0EE50A: db $75 ; line 2
#_0EE50B: db $CB, $A1, $AF, $1E, $59, $D2, $59, $21 ; [pow][er ][her]e⎵[so]⎵h
#_0EE513: db $1E, $59, $1C, $28, $2E, $25, $1D, $59 ; e⎵could⎵
#_0EE51B: db $1C, $C7, $2A, $2E, $A6 ; c[on]qu[er]
#_0EE520: db $76 ; line 3
#_0EE521: db $D8, $59, $0B, $B2, $16, $C8, $25, $1D ; [the]⎵L[ight ]W[or]ld
#_0EE529: db $59, $8C, $BD, $24, $1E, $59, $B0, $2C ; ⎵[and ][ma]ke⎵[hi]s
#_0EE531: db $7E ; wait for key
#_0EE532: db $73 ; scroll text
#_0EE533: db $E2, $D1, $59, $9B, $1E, $59, $9B, $CA ; [wi][sh]⎵[com]e⎵[com][ple]
#_0EE53B: db $2D, $1E, $B9, $DB, $2E, $1E, $41 ; te[ly ][tr]ue.
#_0EE542: db $7A, $01 ; set draw speed
#_0EE544: db $7E ; wait for key
#_0EE545: db $74 ; line 1
#_0EE546: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE54E: db $88, $88, $8A ; [    ][    ][  ]
#_0EE551: db $75 ; line 2
#_0EE552: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE55A: db $88, $88, $8A ; [    ][    ][  ]
#_0EE55D: db $76 ; line 3
#_0EE55E: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE566: db $88, $88, $8A ; [    ][    ][  ]
#_0EE569: db $7A, $02 ; set draw speed
#_0EE56B: db $74 ; line 1
#_0EE56C: db $01, $2E, $2D, $59, $27, $28, $30, $42 ; But⎵now,
#_0EE574: db $59, $E3, $59, $AD, $59, $DA, $2D, $1A ; ⎵[you]⎵[have]⎵[to]ta
#_0EE57C: db $25, $25, $32 ; lly
#_0EE57F: db $75 ; line 2
#_0EE580: db $9D, $DB, $28, $32, $A4, $06, $93, $C7 ; [des][tr]oy[ed ]G[an][on]
#_0EE588: db $41, $8A, $07, $B5, $59, $03, $1A, $2B ; .[  ]H[is]⎵Dar
#_0EE590: db $24 ; k
#_0EE591: db $76 ; line 3
#_0EE592: db $16, $C8, $25, $1D, $59, $E2, $25, $25 ; W[or]ld⎵[wi]ll
#_0EE59A: db $59, $2F, $93, $B5, $21, $41 ; ⎵v[an][is]h.
#_0EE5A0: db $7A, $01 ; set draw speed
#_0EE5A2: db $7E ; wait for key
#_0EE5A3: db $74 ; line 1
#_0EE5A4: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE5AC: db $88, $88, $8A ; [    ][    ][  ]
#_0EE5AF: db $75 ; line 2
#_0EE5B0: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE5B8: db $88, $88, $8A ; [    ][    ][  ]
#_0EE5BB: db $76 ; line 3
#_0EE5BC: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE5C4: db $88, $88, $8A ; [    ][    ][  ]
#_0EE5C7: db $7A, $02 ; set draw speed
#_0EE5C9: db $74 ; line 1
#_0EE5CA: db $E6, $59, $13, $2B, $22, $A8, $1C, $1E ; [The]⎵Tri[for]ce
#_0EE5D2: db $59, $B5, $59, $DF, $B6, $B3, $A8, $59 ; ⎵[is]⎵[wa][it][ing ][for]⎵
#_0EE5DA: db $1A ; a
#_0EE5DB: db $75 ; line 2
#_0EE5DC: db $27, $1E, $30, $59, $28, $30, $27, $A6 ; new⎵own[er]
#_0EE5E4: db $41, $8A, $08, $2D, $2C, $59, $06, $28 ; .[  ]Its⎵Go
#_0EE5EC: db $25, $1D, $A0, $0F, $28, $E0, $2B, $59 ; ld[en ]Po[we]r⎵
#_0EE5F4: db $B5 ; [is]
#_0EE5F5: db $76 ; line 3
#_0EE5F6: db $B4, $59, $E3, $2B, $59, $B1, $27, $1D ; [in]⎵[you]r⎵[ha]nd
#_0EE5FE: db $2C, $43 ; s…
#_0EE600: db $7A, $01 ; set draw speed
#_0EE602: db $7E ; wait for key
#_0EE603: db $74 ; line 1
#_0EE604: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE60C: db $88, $88, $8A ; [    ][    ][  ]
#_0EE60F: db $75 ; line 2
#_0EE610: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE618: db $88, $88, $8A ; [    ][    ][  ]
#_0EE61B: db $76 ; line 3
#_0EE61C: db $88, $88, $88, $88, $88, $88, $88, $88 ; [    ][    ][    ][    ][    ][    ][    ][    ]
#_0EE624: db $88, $88, $8A ; [    ][    ][  ]
#_0EE627: db $7A, $02 ; set draw speed
#_0EE629: db $74 ; line 1
#_0EE62A: db $0D, $28, $30, $42, $59, $DA, $2E, $1C ; Now,⎵[to]uc
#_0EE632: db $21, $59, $B6, $59, $DE, $59, $1A, $59 ; h⎵[it]⎵[with]⎵a⎵
#_0EE63A: db $E2, $D1, $59, $B4 ; [wi][sh]⎵[in]
#_0EE63E: db $75 ; line 2
#_0EE63F: db $E3, $2B, $59, $21, $A2, $2D, $41 ; [you]r⎵h[ear]t.
#_0EE646: db $76 ; line 3
#_0EE647: db $43, $8A, $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…[  ]…
#_0EE64E: db $7F ; end of message

;===================================================================================================
; All right! Take it, thief!
;---------------------------------------------------------------------------------------------------
Message_0174:
#_0EE64F: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_0EE657: db $2D, $3E, $59, $13, $1A, $24, $1E, $59 ; t!⎵Take⎵
#_0EE65F: db $B6, $42, $59, $D9, $1E, $1F, $3E ; [it],⎵[thi]ef!
#_0EE666: db $7F ; end of message

;===================================================================================================
; Whoa…  I saw her.
; A very nice young lady at the
; Waterfall Of Wishing in the
; hills where the river
; begins…
; [LINK], you should meet her
; at least once.  I'm sure you will
; like her.
;---------------------------------------------------------------------------------------------------
Message_0175:
#_0EE667: db $16, $21, $28, $1A, $43, $8A, $08, $59 ; Whoa…[  ]I⎵
#_0EE66F: db $2C, $1A, $30, $59, $AF, $41 ; saw⎵[her].
#_0EE675: db $75 ; line 2
#_0EE676: db $00, $59, $DD, $32, $59, $27, $22, $1C ; A⎵[ver]y⎵nic
#_0EE67E: db $1E, $59, $E3, $27, $20, $59, $BA, $1D ; e⎵[you]ng⎵[la]d
#_0EE686: db $32, $59, $91, $D8 ; y⎵[at ][the]
#_0EE68A: db $76 ; line 3
#_0EE68B: db $16, $94, $A6, $1F, $8E, $0E, $1F, $59 ; W[at][er]f[all ]Of⎵
#_0EE693: db $16, $B5, $B0, $27, $20, $59, $B4, $59 ; W[is][hi]ng⎵[in]⎵
#_0EE69B: db $D8 ; [the]
#_0EE69C: db $7E ; wait for key
#_0EE69D: db $73 ; scroll text
#_0EE69E: db $B0, $25, $25, $2C, $59, $E1, $A6, $1E ; [hi]lls⎵[wh][er]e
#_0EE6A6: db $59, $D8, $59, $2B, $22, $DD ; ⎵[the]⎵ri[ver]
#_0EE6AC: db $73 ; scroll text
#_0EE6AD: db $97, $20, $B4, $2C, $43 ; [be]g[in]s…
#_0EE6B2: db $73 ; scroll text
#_0EE6B3: db $6A, $42, $59, $E3, $59, $D1, $28, $2E ; [LINK],⎵[you]⎵[sh]ou
#_0EE6BB: db $25, $1D, $59, $BE, $1E, $2D, $59, $AF ; ld⎵[me]et⎵[her]
#_0EE6C3: db $7E ; wait for key
#_0EE6C4: db $73 ; scroll text
#_0EE6C5: db $91, $25, $1E, $92, $59, $C7, $1C, $1E ; [at ]le[ast]⎵[on]ce
#_0EE6CD: db $41, $8A, $08, $51, $26, $59, $2C, $2E ; .[  ]I'm⎵su
#_0EE6D5: db $CD, $E3, $59, $E2, $25, $25 ; [re ][you]⎵[wi]ll
#_0EE6DB: db $73 ; scroll text
#_0EE6DC: db $25, $22, $24, $1E, $59, $AF, $41 ; like⎵[her].
#_0EE6E3: db $7F ; end of message

;===================================================================================================
; Take some Rupees, but don't
; tell anyone I gave them to you.
; Keep it between us, OK?
;---------------------------------------------------------------------------------------------------
Message_0176:
#_0EE6E4: db $13, $1A, $24, $1E, $59, $CF, $59, $11 ; Take⎵[some]⎵R
#_0EE6EC: db $DC, $1E, $1E, $2C, $42, $59, $1B, $2E ; [up]ees,⎵bu
#_0EE6F4: db $2D, $59, $9F, $27, $51, $2D ; t⎵[do]n't
#_0EE6FA: db $75 ; line 2
#_0EE6FB: db $2D, $1E, $25, $25, $59, $93, $32, $C7 ; tell⎵[an]y[on]
#_0EE703: db $1E, $59, $08, $59, $20, $1A, $2F, $1E ; e⎵I⎵gave
#_0EE70B: db $59, $D8, $26, $59, $DA, $59, $E3, $41 ; ⎵[the]m⎵[to]⎵[you].
#_0EE713: db $76 ; line 3
#_0EE714: db $0A, $1E, $1E, $29, $59, $B6, $59, $97 ; Keep⎵[it]⎵[be]
#_0EE71C: db $2D, $E0, $A0, $2E, $2C, $42, $59, $0E ; t[we][en ]us,⎵O
#_0EE724: db $0A, $3F ; K?
#_0EE726: db $7F ; end of message

;===================================================================================================
; Check out the cave east of
; Lake Hylia.  Strange and
; wonderful things live in it…
;---------------------------------------------------------------------------------------------------
Message_0177:
#_0EE727: db $02, $21, $1E, $9C, $59, $C5, $D8, $59 ; Che[ck]⎵[out ][the]⎵
#_0EE72F: db $1C, $1A, $2F, $1E, $59, $1E, $92, $59 ; cave⎵e[ast]⎵
#_0EE737: db $C6 ; [of]
#_0EE738: db $75 ; line 2
#_0EE739: db $0B, $1A, $24, $1E, $59, $07, $32, $25 ; Lake⎵Hyl
#_0EE741: db $22, $1A, $41, $8A, $12, $DB, $93, $20 ; ia.[  ]S[tr][an]g
#_0EE749: db $1E, $59, $90 ; e⎵[and]
#_0EE74C: db $76 ; line 3
#_0EE74D: db $30, $C7, $1D, $A6, $1F, $2E, $25, $59 ; w[on]d[er]ful⎵
#_0EE755: db $D5, $20, $2C, $59, $25, $22, $2F, $1E ; [thin]gs⎵live
#_0EE75D: db $59, $B4, $59, $B6, $43 ; ⎵[in]⎵[it]…
#_0EE762: db $7F ; end of message

;===================================================================================================
; You can earn a lot of Rupees
; by defeating enemies.  It's
; the secret of my success…
;---------------------------------------------------------------------------------------------------
Message_0178:
#_0EE763: db $E8, $59, $99, $A2, $27, $59, $1A, $59 ; [You]⎵[can ][ear]n⎵a⎵
#_0EE76B: db $BB, $2D, $59, $C6, $59, $11, $DC, $1E ; [lo]t⎵[of]⎵R[up]e
#_0EE773: db $1E, $2C ; es
#_0EE775: db $75 ; line 2
#_0EE776: db $1B, $32, $59, $1D, $1E, $1F, $1E, $94 ; by⎵defe[at]
#_0EE77E: db $B3, $A5, $1E, $26, $22, $1E, $2C, $41 ; [ing ][en]emies.
#_0EE786: db $8A, $08, $2D, $51, $2C ; [  ]It's
#_0EE78B: db $76 ; line 3
#_0EE78C: db $D8, $59, $D0, $1C, $CE, $2D, $59, $C6 ; [the]⎵[se]c[re]t⎵[of]
#_0EE794: db $59, $26, $32, $59, $2C, $2E, $1C, $1C ; ⎵my⎵succ
#_0EE79C: db $1E, $2C, $2C, $43 ; ess…
#_0EE7A0: db $7F ; end of message

;===================================================================================================
; [LINK], did you know that if
; you destroy frozen enemies
; with the Hammer, you will often
; get a Magic Decanter?
;---------------------------------------------------------------------------------------------------
Message_0179:
#_0EE7A1: db $6A, $42, $59, $9E, $1D, $59, $E3, $59 ; [LINK],⎵[di]d⎵[you]⎵
#_0EE7A9: db $B8, $59, $D7, $2D, $59, $22, $1F ; [know]⎵[tha]t⎵if
#_0EE7B0: db $75 ; line 2
#_0EE7B1: db $E3, $59, $9D, $DB, $28, $32, $59, $A9 ; [you]⎵[des][tr]oy⎵[fro]
#_0EE7B9: db $33, $A0, $A5, $1E, $26, $22, $1E, $2C ; z[en ][en]emies
#_0EE7C1: db $76 ; line 3
#_0EE7C2: db $DE, $59, $D8, $59, $07, $1A, $26, $BE ; [with]⎵[the]⎵Ham[me]
#_0EE7CA: db $2B, $42, $59, $E3, $59, $E2, $25, $25 ; r,⎵[you]⎵[wi]ll
#_0EE7D2: db $59, $C6, $2D, $A5 ; ⎵[of]t[en]
#_0EE7D6: db $7E ; wait for key
#_0EE7D7: db $73 ; scroll text
#_0EE7D8: db $AB, $59, $1A, $59, $0C, $1A, $20, $22 ; [get]⎵a⎵Magi
#_0EE7E0: db $1C, $59, $03, $1E, $1C, $93, $D6, $3F ; c⎵Dec[an][ter]?
#_0EE7E8: db $7F ; end of message

;===================================================================================================
; Tra la la, look for
; Sahasrahla.
; …  …  …
;---------------------------------------------------------------------------------------------------
Message_017A:
#_0EE7E9: db $13, $2B, $1A, $59, $BA, $59, $BA, $42 ; Tra⎵[la]⎵[la],
#_0EE7F1: db $59, $BB, $28, $24, $59, $A8 ; ⎵[lo]ok⎵[for]
#_0EE7F7: db $75 ; line 2
#_0EE7F8: db $12, $1A, $AE, $2B, $1A, $21, $BA, $41 ; Sa[has]rah[la].
#_0EE800: db $76 ; line 3
#_0EE801: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_0EE806: db $7F ; end of message

;===================================================================================================
; Oh yah, you found Sahasrahla!
; …  …  …
; Good job la la!
;---------------------------------------------------------------------------------------------------
Message_017B:
#_0EE807: db $0E, $21, $59, $32, $1A, $21, $42, $59 ; Oh⎵yah,⎵
#_0EE80F: db $E3, $59, $1F, $C4, $59, $12, $1A, $AE ; [you]⎵f[ound]⎵Sa[has]
#_0EE817: db $2B, $1A, $21, $BA, $3E ; rah[la]!
#_0EE81C: db $75 ; line 2
#_0EE81D: db $43, $8A, $43, $8A, $43 ; …[  ]…[  ]…
#_0EE822: db $76 ; line 3
#_0EE823: db $06, $28, $28, $1D, $59, $23, $28, $1B ; Good⎵job
#_0EE82B: db $59, $BA, $59, $BA, $3E ; ⎵[la]⎵[la]!
#_0EE830: db $7F ; end of message

;===================================================================================================
; I'm sorry, but you don't
; seem to have enough Rupees…
;---------------------------------------------------------------------------------------------------
Message_017C:
#_0EE831: db $08, $51, $26, $59, $D2, $2B, $2B, $32 ; I'm⎵[so]rry
#_0EE839: db $42, $59, $1B, $2E, $2D, $59, $E3, $59 ; ,⎵but⎵[you]⎵
#_0EE841: db $9F, $27, $51, $2D ; [do]n't
#_0EE845: db $75 ; line 2
#_0EE846: db $D0, $1E, $26, $59, $DA, $59, $AD, $59 ; [se]em⎵[to]⎵[have]⎵
#_0EE84E: db $A5, $28, $2E, $20, $21, $59, $11, $DC ; [en]ough⎵R[up]
#_0EE856: db $1E, $1E, $2C, $43 ; ees…
#_0EE85A: db $7F ; end of message

;===================================================================================================
; Cluck cluck…  What?!
; You turned me into a human.
; I can even speak!
; Aha, it must be you who is
; always teasing my friends.
; The Weathercock is always
; watching you harass them.
; Well, this human shape is
; uncomfortable for me.
; Ahhh, I want to be a chicken
; again!  Cluck cluck…
;---------------------------------------------------------------------------------------------------
Message_017D:
#_0EE85B: db $02, $25, $2E, $9C, $59, $1C, $25, $2E ; Clu[ck]⎵clu
#_0EE863: db $9C, $43, $8A, $16, $B1, $2D, $3F, $3E ; [ck]…[  ]W[ha]t?!
#_0EE86B: db $75 ; line 2
#_0EE86C: db $E8, $59, $2D, $2E, $2B, $27, $A4, $BE ; [You]⎵turn[ed ][me]
#_0EE874: db $59, $B4, $DA, $59, $1A, $59, $21, $2E ; ⎵[in][to]⎵a⎵hu
#_0EE87C: db $BC, $41 ; [man].
#_0EE87E: db $76 ; line 3
#_0EE87F: db $08, $59, $99, $A7, $A0, $2C, $29, $1E ; I⎵[can ][ev][en ]spe
#_0EE887: db $1A, $24, $3E ; ak!
#_0EE88A: db $7E ; wait for key
#_0EE88B: db $73 ; scroll text
#_0EE88C: db $00, $B1, $42, $59, $B6, $59, $BF, $D3 ; A[ha],⎵[it]⎵[mu][st]
#_0EE894: db $59, $97, $59, $E3, $59, $E1, $28, $59 ; ⎵[be]⎵[you]⎵[wh]o⎵
#_0EE89C: db $B5 ; [is]
#_0EE89D: db $73 ; scroll text
#_0EE89E: db $1A, $25, $DF, $32, $2C, $59, $2D, $1E ; al[wa]ys⎵te
#_0EE8A6: db $1A, $2C, $B3, $26, $32, $59, $1F, $2B ; as[ing ]my⎵fr
#_0EE8AE: db $22, $A5, $1D, $2C, $41 ; i[en]ds.
#_0EE8B3: db $73 ; scroll text
#_0EE8B4: db $E6, $59, $16, $1E, $94, $AF, $1C, $28 ; [The]⎵We[at][her]co
#_0EE8BC: db $9C, $59, $B5, $59, $1A, $25, $DF, $32 ; [ck]⎵[is]⎵al[wa]y
#_0EE8C4: db $2C ; s
#_0EE8C5: db $7E ; wait for key
#_0EE8C6: db $73 ; scroll text
#_0EE8C7: db $DF, $2D, $1C, $B0, $27, $20, $59, $E3 ; [wa]tc[hi]ng⎵[you]
#_0EE8CF: db $59, $B1, $2B, $1A, $2C, $2C, $59, $D8 ; ⎵[ha]rass⎵[the]
#_0EE8D7: db $26, $41 ; m.
#_0EE8D9: db $73 ; scroll text
#_0EE8DA: db $16, $1E, $25, $25, $42, $59, $D9, $2C ; Well,⎵[thi]s
#_0EE8E2: db $59, $21, $2E, $BC, $59, $D1, $1A, $29 ; ⎵hu[man]⎵[sh]ap
#_0EE8EA: db $1E, $59, $B5 ; e⎵[is]
#_0EE8ED: db $73 ; scroll text
#_0EE8EE: db $2E, $27, $9B, $A8, $2D, $1A, $95, $59 ; un[com][for]ta[ble]⎵
#_0EE8F6: db $A8, $59, $BE, $41 ; [for]⎵[me].
#_0EE8FA: db $7E ; wait for key
#_0EE8FB: db $73 ; scroll text
#_0EE8FC: db $00, $21, $21, $21, $42, $59, $08, $59 ; Ahhh,⎵I⎵
#_0EE904: db $DF, $27, $2D, $59, $DA, $59, $97, $59 ; [wa]nt⎵[to]⎵[be]⎵
#_0EE90C: db $1A, $59, $1C, $B0, $9C, $A5 ; a⎵c[hi][ck][en]
#_0EE912: db $73 ; scroll text
#_0EE913: db $1A, $20, $8F, $3E, $8A, $02, $25, $2E ; ag[ain]![  ]Clu
#_0EE91B: db $9C, $59, $1C, $25, $2E, $9C, $43 ; [ck]⎵clu[ck]…
#_0EE922: db $7F ; end of message

;===================================================================================================
; Pay me 20 Rupees and I'll let
; you open one chest.  You can
; keep what is inside.
; What will you do?
;     >  Open A Chest
;         Escape
;---------------------------------------------------------------------------------------------------
Message_017E:
#_0EE923: db $0F, $1A, $32, $59, $BE, $59, $36, $34 ; Pay⎵[me]⎵20
#_0EE92B: db $59, $11, $DC, $1E, $1E, $2C, $59, $8C ; ⎵R[up]ees⎵[and ]
#_0EE933: db $08, $51, $25, $25, $59, $25, $1E, $2D ; I'll⎵let
#_0EE93B: db $75 ; line 2
#_0EE93C: db $E3, $59, $C3, $59, $C7, $1E, $59, $9A ; [you]⎵[open]⎵[on]e⎵[che]
#_0EE944: db $D3, $41, $8A, $E8, $59, $1C, $93 ; [st].[  ][You]⎵c[an]
#_0EE94B: db $76 ; line 3
#_0EE94C: db $24, $1E, $1E, $29, $59, $E1, $91, $B5 ; keep⎵[wh][at ][is]
#_0EE954: db $59, $B4, $2C, $22, $1D, $1E, $41 ; ⎵[in]side.
#_0EE95B: db $7E ; wait for key
#_0EE95C: db $73 ; scroll text
#_0EE95D: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_0EE965: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_0EE969: db $73 ; scroll text
#_0EE96A: db $88, $44, $8A, $0E, $29, $A0, $00, $59 ; [    ]>[  ]Op[en ]A⎵
#_0EE972: db $02, $21, $1E, $D3 ; Che[st]
#_0EE976: db $73 ; scroll text
#_0EE977: db $88, $88, $04, $2C, $1C, $1A, $29, $1E ; [    ][    ]Escape
#_0EE97F: db $68 ; choose 2 indented
#_0EE980: db $7F ; end of message

;===================================================================================================
; All right!  Open the chest you
; like!
;---------------------------------------------------------------------------------------------------
Message_017F:
#_0EE981: db $00, $25, $25, $59, $2B, $22, $20, $21 ; All⎵righ
#_0EE989: db $2D, $3E, $8A, $0E, $29, $A0, $D8, $59 ; t![  ]Op[en ][the]⎵
#_0EE991: db $9A, $D3, $59, $E3 ; [che][st]⎵[you]
#_0EE995: db $75 ; line 2
#_0EE996: db $25, $22, $24, $1E, $3E ; like!
#_0EE99B: db $7F ; end of message

;===================================================================================================
; Oh, I see…  Too bad.
; Drop by again after collecting
; Rupees.
;---------------------------------------------------------------------------------------------------
Message_0180:
#_0EE99C: db $0E, $21, $42, $59, $08, $59, $D0, $1E ; Oh,⎵I⎵[se]e
#_0EE9A4: db $43, $8A, $13, $28, $28, $59, $96, $1D ; …[  ]Too⎵[ba]d
#_0EE9AC: db $41 ; .
#_0EE9AD: db $75 ; line 2
#_0EE9AE: db $03, $2B, $28, $29, $59, $1B, $32, $59 ; Drop⎵by⎵
#_0EE9B6: db $1A, $20, $8F, $59, $1A, $1F, $D4, $1C ; ag[ain]⎵af[ter ]c
#_0EE9BE: db $28, $25, $25, $1E, $1C, $2D, $B4, $20 ; ollect[in]g
#_0EE9C6: db $76 ; line 3
#_0EE9C7: db $11, $DC, $1E, $1E, $2C, $41 ; R[up]ees.
#_0EE9CD: db $7F ; end of message

;===================================================================================================
; For 100 Rupees, I'll let you
; open one chest and keep the
; treasure that is inside.
; What will you do?
;     >  Open A Chest
;         Escape
;---------------------------------------------------------------------------------------------------
Message_0181:
#_0EE9CE: db $05, $C8, $59, $35, $34, $34, $59, $11 ; F[or]⎵100⎵R
#_0EE9D6: db $DC, $1E, $1E, $2C, $42, $59, $08, $51 ; [up]ees,⎵I'
#_0EE9DE: db $25, $25, $59, $25, $1E, $2D, $59, $E3 ; ll⎵let⎵[you]
#_0EE9E6: db $75 ; line 2
#_0EE9E7: db $C3, $59, $C7, $1E, $59, $9A, $D3, $59 ; [open]⎵[on]e⎵[che][st]⎵
#_0EE9EF: db $8C, $24, $1E, $1E, $29, $59, $D8 ; [and ]keep⎵[the]
#_0EE9F6: db $76 ; line 3
#_0EE9F7: db $DB, $1E, $1A, $2C, $2E, $CD, $D7, $2D ; [tr]easu[re ][tha]t
#_0EE9FF: db $59, $B5, $59, $B4, $2C, $22, $1D, $1E ; ⎵[is]⎵[in]side
#_0EEA07: db $41 ; .
#_0EEA08: db $7E ; wait for key
#_0EEA09: db $73 ; scroll text
#_0EEA0A: db $16, $B1, $2D, $59, $E2, $25, $25, $59 ; W[ha]t⎵[wi]ll⎵
#_0EEA12: db $E3, $59, $9F, $3F ; [you]⎵[do]?
#_0EEA16: db $73 ; scroll text
#_0EEA17: db $88, $44, $8A, $0E, $29, $A0, $00, $59 ; [    ]>[  ]Op[en ]A⎵
#_0EEA1F: db $02, $21, $1E, $D3 ; Che[st]
#_0EEA23: db $73 ; scroll text
#_0EEA24: db $88, $88, $04, $2C, $1C, $1A, $29, $1E ; [    ][    ]Escape
#_0EEA2C: db $68 ; choose 2 indented
#_0EEA2D: db $7F ; end of message

;===================================================================================================
; Hi, [LINK].  Sorry about my
; yard.  It's a little over
; grown.  Thanks for visiting.
; I'm glad to have company to
; talk to.  I will tell you an
; interesting story.
; There is a lake swimming with
; Zoras at the source of the
; river, but it is hard to find.
; The treasure of Zora can turn
; people into fish.  Heh heh heh.
; I'd love to see that.
;---------------------------------------------------------------------------------------------------
Message_0182:
#_0EEA2E: db $07, $22, $42, $59, $6A, $41, $8A, $12 ; Hi,⎵[LINK].[  ]S
#_0EEA36: db $C8, $2B, $32, $59, $1A, $98, $2E, $2D ; [or]ry⎵a[bo]ut
#_0EEA3E: db $59, $26, $32 ; ⎵my
#_0EEA41: db $75 ; line 2
#_0EEA42: db $32, $1A, $2B, $1D, $41, $8A, $08, $2D ; yard.[  ]It
#_0EEA4A: db $8B, $1A, $59, $25, $B6, $2D, $25, $1E ; ['s ]a⎵l[it]tle
#_0EEA52: db $59, $28, $DD ; ⎵o[ver]
#_0EEA55: db $76 ; line 3
#_0EEA56: db $20, $2B, $28, $30, $27, $41, $8A, $E5 ; grown.[  ][Tha]
#_0EEA5E: db $27, $24, $2C, $59, $A8, $59, $2F, $B5 ; nks⎵[for]⎵v[is]
#_0EEA66: db $B6, $B4, $20, $41 ; [it][in]g.
#_0EEA6A: db $7E ; wait for key
#_0EEA6B: db $73 ; scroll text
#_0EEA6C: db $08, $51, $26, $59, $20, $BA, $1D, $59 ; I'm⎵g[la]d⎵
#_0EEA74: db $DA, $59, $AD, $59, $9B, $29, $93, $32 ; [to]⎵[have]⎵[com]p[an]y
#_0EEA7C: db $59, $DA ; ⎵[to]
#_0EEA7E: db $73 ; scroll text
#_0EEA7F: db $2D, $1A, $25, $24, $59, $DA, $41, $8A ; talk⎵[to].[  ]
#_0EEA87: db $08, $59, $E2, $25, $25, $59, $2D, $1E ; I⎵[wi]ll⎵te
#_0EEA8F: db $25, $25, $59, $E3, $59, $93 ; ll⎵[you]⎵[an]
#_0EEA95: db $73 ; scroll text
#_0EEA96: db $B4, $D6, $1E, $D3, $B3, $D3, $C8, $32 ; [in][ter]e[st][ing ][st][or]y
#_0EEA9E: db $41 ; .
#_0EEA9F: db $7E ; wait for key
#_0EEAA0: db $73 ; scroll text
#_0EEAA1: db $E6, $CD, $B5, $59, $1A, $59, $BA, $24 ; [The][re ][is]⎵a⎵[la]k
#_0EEAA9: db $1E, $59, $2C, $E2, $26, $26, $B3, $DE ; e⎵s[wi]mm[ing ][with]
#_0EEAB1: db $73 ; scroll text
#_0EEAB2: db $19, $C8, $1A, $2C, $59, $91, $D8, $59 ; Z[or]as⎵[at ][the]⎵
#_0EEABA: db $D2, $2E, $2B, $1C, $1E, $59, $C6, $59 ; [so]urce⎵[of]⎵
#_0EEAC2: db $D8 ; [the]
#_0EEAC3: db $73 ; scroll text
#_0EEAC4: db $2B, $22, $DD, $42, $59, $1B, $2E, $2D ; ri[ver],⎵but
#_0EEACC: db $59, $B6, $59, $B5, $59, $B1, $2B, $1D ; ⎵[it]⎵[is]⎵[ha]rd
#_0EEAD4: db $59, $DA, $59, $1F, $B4, $1D, $41 ; ⎵[to]⎵f[in]d.
#_0EEADB: db $7E ; wait for key
#_0EEADC: db $73 ; scroll text
#_0EEADD: db $E6, $59, $DB, $1E, $1A, $2C, $2E, $CD ; [The]⎵[tr]easu[re ]
#_0EEAE5: db $C6, $59, $19, $C8, $1A, $59, $99, $2D ; [of]⎵Z[or]a⎵[can ]t
#_0EEAED: db $2E, $2B, $27 ; urn
#_0EEAF0: db $73 ; scroll text
#_0EEAF1: db $29, $1E, $28, $CA, $59, $B4, $DA, $59 ; peo[ple]⎵[in][to]⎵
#_0EEAF9: db $1F, $B5, $21, $41, $8A, $07, $1E, $21 ; f[is]h.[  ]Heh
#_0EEB01: db $59, $21, $1E, $21, $59, $21, $1E, $21 ; ⎵heh⎵heh
#_0EEB09: db $41 ; .
#_0EEB0A: db $73 ; scroll text
#_0EEB0B: db $08, $51, $1D, $59, $BB, $2F, $1E, $59 ; I'd⎵[lo]ve⎵
#_0EEB13: db $DA, $59, $D0, $1E, $59, $D7, $2D, $41 ; [to]⎵[se]e⎵[tha]t.
#_0EEB1B: db $7F ; end of message

;===================================================================================================
; I haven't had a chance to trim
; my hedges recently.  Thanks
; for visiting anyway…
; A while ago, there was a boy in
; this village who could talk to
; animals with his Flute.
; He had a pet bird that flew
; with him everywhere, but
; he went to the mountain and
; never returned.
;---------------------------------------------------------------------------------------------------
Message_0183:
#_0EEB1C: db $08, $59, $AD, $C0, $B1, $1D, $59, $1A ; I⎵[have][n't ][ha]d⎵a
#_0EEB24: db $59, $1C, $B1, $27, $1C, $1E, $59, $DA ; ⎵c[ha]nce⎵[to]
#_0EEB2C: db $59, $DB, $22, $26 ; ⎵[tr]im
#_0EEB30: db $75 ; line 2
#_0EEB31: db $26, $32, $59, $21, $1E, $1D, $20, $1E ; my⎵hedge
#_0EEB39: db $2C, $59, $CE, $1C, $A3, $25, $32, $41 ; s⎵[re]c[ent]ly.
#_0EEB41: db $8A, $E5, $27, $24, $2C ; [  ][Tha]nks
#_0EEB46: db $76 ; line 3
#_0EEB47: db $A8, $59, $2F, $B5, $B6, $B3, $93, $32 ; [for]⎵v[is][it][ing ][an]y
#_0EEB4F: db $DF, $32, $43 ; [wa]y…
#_0EEB52: db $7E ; wait for key
#_0EEB53: db $73 ; scroll text
#_0EEB54: db $00, $59, $E1, $22, $25, $1E, $59, $1A ; A⎵[wh]ile⎵a
#_0EEB5C: db $AC, $42, $59, $D8, $CD, $DF, $2C, $59 ; [go],⎵[the][re ][wa]s⎵
#_0EEB64: db $1A, $59, $98, $32, $59, $B4 ; a⎵[bo]y⎵[in]
#_0EEB6A: db $73 ; scroll text
#_0EEB6B: db $D9, $2C, $59, $2F, $22, $25, $BA, $20 ; [thi]s⎵vil[la]g
#_0EEB73: db $1E, $59, $E1, $28, $59, $1C, $28, $2E ; e⎵[wh]o⎵cou
#_0EEB7B: db $25, $1D, $59, $2D, $1A, $25, $24, $59 ; ld⎵talk⎵
#_0EEB83: db $DA ; [to]
#_0EEB84: db $73 ; scroll text
#_0EEB85: db $93, $22, $BD, $25, $2C, $59, $DE, $59 ; [an]i[ma]ls⎵[with]⎵
#_0EEB8D: db $B0, $2C, $59, $05, $25, $2E, $2D, $1E ; [hi]s⎵Flute
#_0EEB95: db $41 ; .
#_0EEB96: db $7E ; wait for key
#_0EEB97: db $73 ; scroll text
#_0EEB98: db $07, $1E, $59, $B1, $1D, $59, $1A, $59 ; He⎵[ha]d⎵a⎵
#_0EEBA0: db $29, $1E, $2D, $59, $1B, $22, $2B, $1D ; pet⎵bird
#_0EEBA8: db $59, $D7, $2D, $59, $1F, $25, $1E, $30 ; ⎵[tha]t⎵flew
#_0EEBB0: db $73 ; scroll text
#_0EEBB1: db $DE, $59, $B0, $26, $59, $A7, $A6, $32 ; [with]⎵[hi]m⎵[ev][er]y
#_0EEBB9: db $E1, $A6, $1E, $42, $59, $1B, $2E, $2D ; [wh][er]e,⎵but
#_0EEBC1: db $73 ; scroll text
#_0EEBC2: db $21, $1E, $59, $E0, $27, $2D, $59, $DA ; he⎵[we]nt⎵[to]
#_0EEBCA: db $59, $D8, $59, $26, $28, $2E, $27, $2D ; ⎵[the]⎵mount
#_0EEBD2: db $8F, $59, $90 ; [ain]⎵[and]
#_0EEBD5: db $7E ; wait for key
#_0EEBD6: db $73 ; scroll text
#_0EEBD7: db $27, $A7, $A1, $CE, $2D, $2E, $2B, $27 ; n[ev][er ][re]turn
#_0EEBDF: db $1E, $1D, $41 ; ed.
#_0EEBE2: db $7F ; end of message

;===================================================================================================
; >Start From [LINK]'s House
;   Start From Sanctuary
;---------------------------------------------------------------------------------------------------
Message_0184:
#_0EEBE3: db $6D, $00 ; set window position
#_0EEBE5: db $7A, $00 ; set draw speed
#_0EEBE7: db $44, $12, $2D, $1A, $2B, $2D, $59, $05 ; >Start⎵F
#_0EEBEF: db $2B, $28, $26, $59, $6A, $8B, $07, $28 ; rom⎵[LINK]['s ]Ho
#_0EEBF7: db $2E, $D0 ; u[se]
#_0EEBF9: db $75 ; line 2
#_0EEBFA: db $8A, $12, $2D, $1A, $2B, $2D, $59, $05 ; [  ]Start⎵F
#_0EEC02: db $2B, $28, $26, $59, $12, $93, $1C, $2D ; rom⎵S[an]ct
#_0EEC0A: db $2E, $1A, $2B, $32 ; uary
#_0EEC0E: db $72 ; choose 2 high
#_0EEC0F: db $7F ; end of message

;===================================================================================================
; >Start From [LINK]'s House
;   Start From Sanctuary
;   Start From The Mountain Cave
;---------------------------------------------------------------------------------------------------
Message_0185:
#_0EEC10: db $6D, $00 ; set window position
#_0EEC12: db $7A, $00 ; set draw speed
#_0EEC14: db $44, $12, $2D, $1A, $2B, $2D, $59, $05 ; >Start⎵F
#_0EEC1C: db $2B, $28, $26, $59, $6A, $8B, $07, $28 ; rom⎵[LINK]['s ]Ho
#_0EEC24: db $2E, $D0 ; u[se]
#_0EEC26: db $75 ; line 2
#_0EEC27: db $8A, $12, $2D, $1A, $2B, $2D, $59, $05 ; [  ]Start⎵F
#_0EEC2F: db $2B, $28, $26, $59, $12, $93, $1C, $2D ; rom⎵S[an]ct
#_0EEC37: db $2E, $1A, $2B, $32 ; uary
#_0EEC3B: db $76 ; line 3
#_0EEC3C: db $8A, $12, $2D, $1A, $2B, $2D, $59, $05 ; [  ]Start⎵F
#_0EEC44: db $2B, $28, $26, $59, $E6, $59, $0C, $28 ; rom⎵[The]⎵Mo
#_0EEC4C: db $2E, $27, $2D, $8F, $59, $02, $1A, $2F ; unt[ain]⎵Cav
#_0EEC54: db $1E ; e
#_0EEC55: db $71 ; choose 3
#_0EEC56: db $7F ; end of message

;===================================================================================================
; > Continue Game
;    Save and Quit
;---------------------------------------------------------------------------------------------------
Message_0186:
#_0EEC57: db $7A, $00 ; set draw speed
#_0EEC59: db $44, $59, $02, $C7, $2D, $B4, $2E, $1E ; >⎵C[on]t[in]ue
#_0EEC61: db $59, $06, $1A, $BE ; ⎵Ga[me]
#_0EEC65: db $75 ; line 2
#_0EEC66: db $89, $12, $1A, $2F, $1E, $59, $8C, $10 ; [   ]Save⎵[and ]Q
#_0EEC6E: db $2E, $B6 ; u[it]
#_0EEC70: db $72 ; choose 2 high
#_0EEC71: db $7F ; end of message

;===================================================================================================
; Welcome to the treasure field.
; The object is to dig as many
; holes as you can in 30 seconds.
; Any treasures you dig up will
; be yours to keep.
; It's only 80 Rupees to play.
; What do you say?
;     > I want to dig
;        I don't want to dig
;---------------------------------------------------------------------------------------------------
Message_0187:
#_0EEC72: db $16, $1E, $25, $9B, $1E, $59, $DA, $59 ; Wel[com]e⎵[to]⎵
#_0EEC7A: db $D8, $59, $DB, $1E, $1A, $2C, $2E, $CD ; [the]⎵[tr]easu[re ]
#_0EEC82: db $1F, $22, $1E, $25, $1D, $41 ; field.
#_0EEC88: db $75 ; line 2
#_0EEC89: db $E6, $59, $28, $1B, $23, $1E, $1C, $2D ; [The]⎵object
#_0EEC91: db $59, $B5, $59, $DA, $59, $9E, $20, $59 ; ⎵[is]⎵[to]⎵[di]g⎵
#_0EEC99: db $1A, $2C, $59, $BC, $32 ; as⎵[man]y
#_0EEC9E: db $76 ; line 3
#_0EEC9F: db $21, $28, $25, $1E, $2C, $59, $1A, $2C ; holes⎵as
#_0EECA7: db $59, $E3, $59, $99, $B4, $59, $37, $34 ; ⎵[you]⎵[can ][in]⎵30
#_0EECAF: db $59, $D0, $1C, $C7, $1D, $2C, $41 ; ⎵[se]c[on]ds.
#_0EECB6: db $7E ; wait for key
#_0EECB7: db $73 ; scroll text
#_0EECB8: db $00, $27, $32, $59, $DB, $1E, $1A, $2C ; Any⎵[tr]eas
#_0EECC0: db $2E, $CE, $2C, $59, $E3, $59, $9E, $20 ; u[re]s⎵[you]⎵[di]g
#_0EECC8: db $59, $DC, $59, $E2, $25, $25 ; ⎵[up]⎵[wi]ll
#_0EECCE: db $73 ; scroll text
#_0EECCF: db $97, $59, $E3, $2B, $2C, $59, $DA, $59 ; [be]⎵[you]rs⎵[to]⎵
#_0EECD7: db $24, $1E, $1E, $29, $41 ; keep.
#_0EECDC: db $73 ; scroll text
#_0EECDD: db $08, $2D, $8B, $C7, $B9, $3C, $34, $59 ; It['s ][on][ly ]80⎵
#_0EECE5: db $11, $DC, $1E, $1E, $2C, $59, $DA, $59 ; R[up]ees⎵[to]⎵
#_0EECED: db $29, $BA, $32, $41 ; p[la]y.
#_0EECF1: db $7E ; wait for key
#_0EECF2: db $73 ; scroll text
#_0EECF3: db $16, $B1, $2D, $59, $9F, $59, $E3, $59 ; W[ha]t⎵[do]⎵[you]⎵
#_0EECFB: db $2C, $1A, $32, $3F ; say?
#_0EECFF: db $73 ; scroll text
#_0EED00: db $88, $44, $59, $08, $59, $DF, $27, $2D ; [    ]>⎵I⎵[wa]nt
#_0EED08: db $59, $DA, $59, $9E, $20 ; ⎵[to]⎵[di]g
#_0EED0D: db $73 ; scroll text
#_0EED0E: db $88, $89, $08, $59, $9F, $C0, $DF, $27 ; [    ][   ]I⎵[do][n't ][wa]n
#_0EED16: db $2D, $59, $DA, $59, $9E, $20 ; t⎵[to]⎵[di]g
#_0EED1C: db $68 ; choose 2 indented
#_0EED1D: db $7F ; end of message

;===================================================================================================
; Then I will lend you a shovel.
; When you have it in your hand,
; start digging! (Press the
; ⓨ Button to dig.)
;---------------------------------------------------------------------------------------------------
Message_0188:
#_0EED1E: db $E6, $27, $59, $08, $59, $E2, $25, $25 ; [The]n⎵I⎵[wi]ll
#_0EED26: db $59, $25, $A5, $1D, $59, $E3, $59, $1A ; ⎵l[en]d⎵[you]⎵a
#_0EED2E: db $59, $D1, $28, $2F, $1E, $25, $41 ; ⎵[sh]ovel.
#_0EED35: db $75 ; line 2
#_0EED36: db $16, $21, $A0, $E3, $59, $AD, $59, $B6 ; Wh[en ][you]⎵[have]⎵[it]
#_0EED3E: db $59, $B4, $59, $E3, $2B, $59, $B1, $27 ; ⎵[in]⎵[you]r⎵[ha]n
#_0EED46: db $1D, $42 ; d,
#_0EED48: db $76 ; line 3
#_0EED49: db $D3, $1A, $2B, $2D, $59, $9E, $20, $20 ; [st]art⎵[di]gg
#_0EED51: db $B4, $20, $3E, $59, $45, $0F, $CE, $2C ; [in]g!⎵(P[re]s
#_0EED59: db $2C, $59, $D8 ; s⎵[the]
#_0EED5C: db $7E ; wait for key
#_0EED5D: db $73 ; scroll text
#_0EED5E: db $5E, $59, $01, $2E, $2D, $DA, $27, $59 ; ⓨ⎵But[to]n⎵
#_0EED66: db $DA, $59, $9E, $20, $41, $46 ; [to]⎵[di]g.)
#_0EED6C: db $7F ; end of message

;===================================================================================================
; I see.  Then I give up.  Save
; some Rupees and come back.
;---------------------------------------------------------------------------------------------------
Message_0189:
#_0EED6D: db $08, $59, $D0, $1E, $41, $8A, $E6, $27 ; I⎵[se]e.[  ][The]n
#_0EED75: db $59, $08, $59, $AA, $DC, $41, $8A, $12 ; ⎵I⎵[give ][up].[  ]S
#_0EED7D: db $1A, $2F, $1E ; ave
#_0EED80: db $75 ; line 2
#_0EED81: db $CF, $59, $11, $DC, $1E, $1E, $2C, $59 ; [some]⎵R[up]ees⎵
#_0EED89: db $8C, $9B, $1E, $59, $96, $9C, $41 ; [and ][com]e⎵[ba][ck].
#_0EED90: db $7F ; end of message

;===================================================================================================
; OK!  Time's up, game over.
; Come back again.  Good bye…
;---------------------------------------------------------------------------------------------------
Message_018A:
#_0EED91: db $0E, $0A, $3E, $8A, $13, $22, $BE, $8B ; OK![  ]Ti[me]['s ]
#_0EED99: db $DC, $42, $59, $20, $1A, $BE, $59, $28 ; [up],⎵ga[me]⎵o
#_0EEDA1: db $DD, $41 ; [ver].
#_0EEDA3: db $75 ; line 2
#_0EEDA4: db $02, $28, $BE, $59, $96, $9C, $59, $1A ; Co[me]⎵[ba][ck]⎵a
#_0EEDAC: db $20, $8F, $41, $8A, $06, $28, $28, $1D ; g[ain].[  ]Good
#_0EEDB4: db $59, $1B, $32, $1E, $43 ; ⎵bye…
#_0EEDB9: db $7F ; end of message

;===================================================================================================
; Come back again!
; I will be waiting for you.
;---------------------------------------------------------------------------------------------------
Message_018B:
#_0EEDBA: db $02, $28, $BE, $59, $96, $9C, $59, $1A ; Co[me]⎵[ba][ck]⎵a
#_0EEDC2: db $20, $8F, $3E ; g[ain]!
#_0EEDC5: db $75 ; line 2
#_0EEDC6: db $08, $59, $E2, $25, $25, $59, $97, $59 ; I⎵[wi]ll⎵[be]⎵
#_0EEDCE: db $DF, $B6, $B3, $A8, $59, $E3, $41 ; [wa][it][ing ][for]⎵[you].
#_0EEDD5: db $7F ; end of message

;===================================================================================================
; I can't tell you details, but
; it's not a convenient time for
; me now.  Come back here again.
; Sorry.
;---------------------------------------------------------------------------------------------------
Message_018C:
#_0EEDD6: db $08, $59, $1C, $93, $51, $2D, $59, $2D ; I⎵c[an]'t⎵t
#_0EEDDE: db $1E, $25, $25, $59, $E3, $59, $1D, $1E ; ell⎵[you]⎵de
#_0EEDE6: db $2D, $1A, $22, $25, $2C, $42, $59, $1B ; tails,⎵b
#_0EEDEE: db $2E, $2D ; ut
#_0EEDF0: db $75 ; line 2
#_0EEDF1: db $B6, $8B, $C2, $59, $1A, $59, $1C, $C7 ; [it]['s ][not]⎵a⎵c[on]
#_0EEDF9: db $2F, $A5, $22, $A3, $59, $2D, $22, $BE ; v[en]i[ent]⎵ti[me]
#_0EEE01: db $59, $A8 ; ⎵[for]
#_0EEE03: db $76 ; line 3
#_0EEE04: db $BE, $59, $27, $28, $30, $41, $8A, $02 ; [me]⎵now.[  ]C
#_0EEE0C: db $28, $BE, $59, $96, $9C, $59, $AF, $1E ; o[me]⎵[ba][ck]⎵[her]e
#_0EEE14: db $59, $1A, $20, $8F, $41 ; ⎵ag[ain].
#_0EEE19: db $7E ; wait for key
#_0EEE1A: db $73 ; scroll text
#_0EEE1B: db $12, $C8, $2B, $32, $41 ; S[or]ry.
#_0EEE20: db $7F ; end of message

;===================================================================================================
