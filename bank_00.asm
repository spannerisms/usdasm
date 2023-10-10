org $008000

;===================================================================================================

Reset:
#_008000: SEI

#_008001: STZ.w NMITIMEN
#_008004: STZ.w HDMAEN
#_008007: STZ.w MDMAEN

#_00800A: STZ.w APUIO0
#_00800D: STZ.w APUIO1
#_008010: STZ.w APUIO2
#_008013: STZ.w APUIO3

#_008016: LDA.b #$80 ; Enable force blank
#_008018: STA.w INIDISP

#_00801B: CLC
#_00801C: XCE

#_00801D: REP #$28

#_00801F: LDA.w #$0000
#_008022: TCD

#_008023: LDA.w #$01FF
#_008026: TCS

#_008027: SEP #$30

#_008029: JSR LoadIntroSongBank
#_00802C: JSR InitializeMemoryAndSRAM

#_00802F: LDA.b #$81 ; enable NMI and auto joypad read
#_008031: STA.w NMITIMEN

;===================================================================================================

MainGameLoop:
#_008034: LDA.b $12
#_008036: BEQ MainGameLoop

#_008038: CLI

#_008039: BRA .do_frame

;---------------------------------------------------------------------------------------------------

.frame_step
#_00803B: LDA.b $F6
#_00803D: AND.b #$20
#_00803F: BEQ .L_not_pressed

#_008041: INC.w $0FD7

.L_not_pressed
#_008044: LDA.b $F6
#_008046: AND.b #$10
#_008048: BNE .do_frame

#_00804A: LDA.w $0FD7
#_00804D: AND.b #$01
#_00804F: BNE .skip_frame

;---------------------------------------------------------------------------------------------------

.do_frame
#_008051: INC.b $1A

#_008053: JSR ClearOAMBuffer
#_008056: JSL Module_MainRouting

.skip_frame
#_00805A: JSR NMI_PrepareSprites

#_00805D: STZ.b $12

#_00805F: BRA MainGameLoop

;===================================================================================================

pool Module_MainRouting

.low
#_008061: db Module00_Intro>>0
#_008062: db Module01_FileSelect>>0
#_008063: db Module02_CopyFile>>0
#_008064: db Module03_KILLFile>>0

#_008065: db Module04_NameFile>>0
#_008066: db Module05_LoadFile>>0
#_008067: db Module06_UnderworldLoad>>0
#_008068: db Module07_Underworld>>0

#_008069: db Module08_OverworldLoad>>0
#_00806A: db Module09_Overworld>>0
#_00806B: db Module0A_OverworldSpecialLoad>>0
#_00806C: db Module0B_OverworldSpecial>>0

#_00806D: db Module0C_Unused>>0
#_00806E: db Module0D_Unused>>0
#_00806F: db Module0E_Interface>>0
#_008070: db Module0F_SpotlightClose>>0

#_008071: db Module10_SpotlightOpen>>0
#_008072: db Module11_UnderworldFallingEntrance>>0
#_008073: db Module12_GameOver>>0
#_008074: db Module13_BossVictory_Pendant>>0

#_008075: db Module14_Attract>>0
#_008076: db Module15_MirrorWarpFromAga>>0
#_008077: db Module16_BossVictory_Crystal>>0
#_008078: db Module17_SaveAndQuit>>0

#_008079: db Module18_GanonEmerges>>0
#_00807A: db Module19_TriforceRoom>>0
#_00807B: db Module1A_Credits>>0
#_00807C: db Module1B_SpawnSelect>>0

;---------------------------------------------------------------------------------------------------

.mid
#_00807D: db Module00_Intro>>8
#_00807E: db Module01_FileSelect>>8
#_00807F: db Module02_CopyFile>>8
#_008080: db Module03_KILLFile>>8

#_008081: db Module04_NameFile>>8
#_008082: db Module05_LoadFile>>8
#_008083: db Module06_UnderworldLoad>>8
#_008084: db Module07_Underworld>>8

#_008085: db Module08_OverworldLoad>>8
#_008086: db Module09_Overworld>>8
#_008087: db Module0A_OverworldSpecialLoad>>8
#_008088: db Module0B_OverworldSpecial>>8

#_008089: db Module0C_Unused>>8
#_00808A: db Module0D_Unused>>8
#_00808B: db Module0E_Interface>>8
#_00808C: db Module0F_SpotlightClose>>8

#_00808D: db Module10_SpotlightOpen>>8
#_00808E: db Module11_UnderworldFallingEntrance>>8
#_00808F: db Module12_GameOver>>8
#_008090: db Module13_BossVictory_Pendant>>8

#_008091: db Module14_Attract>>8
#_008092: db Module15_MirrorWarpFromAga>>8
#_008093: db Module16_BossVictory_Crystal>>8
#_008094: db Module17_SaveAndQuit>>8

#_008095: db Module18_GanonEmerges>>8
#_008096: db Module19_TriforceRoom>>8
#_008097: db Module1A_Credits>>8
#_008098: db Module1B_SpawnSelect>>8

;---------------------------------------------------------------------------------------------------

.bank
#_008099: db Module00_Intro>>16
#_00809A: db Module01_FileSelect>>16
#_00809B: db Module02_CopyFile>>16
#_00809C: db Module03_KILLFile>>16

#_00809D: db Module04_NameFile>>16
#_00809E: db Module05_LoadFile>>16
#_00809F: db Module06_UnderworldLoad>>16
#_0080A0: db Module07_Underworld>>16

#_0080A1: db Module08_OverworldLoad>>16
#_0080A2: db Module09_Overworld>>16
#_0080A3: db Module0A_OverworldSpecialLoad>>16
#_0080A4: db Module0B_OverworldSpecial>>16

#_0080A5: db Module0C_Unused>>16
#_0080A6: db Module0D_Unused>>16
#_0080A7: db Module0E_Interface>>16
#_0080A8: db Module0F_SpotlightClose>>16

#_0080A9: db Module10_SpotlightOpen>>16
#_0080AA: db Module11_UnderworldFallingEntrance>>16
#_0080AB: db Module12_GameOver>>16
#_0080AC: db Module13_BossVictory_Pendant>>16

#_0080AD: db Module14_Attract>>16
#_0080AE: db Module15_MirrorWarpFromAga>>16
#_0080AF: db Module16_BossVictory_Crystal>>16
#_0080B0: db Module17_SaveAndQuit>>16

#_0080B1: db Module18_GanonEmerges>>16
#_0080B2: db Module19_TriforceRoom>>16
#_0080B3: db Module1A_Credits>>16
#_0080B4: db Module1B_SpawnSelect>>16

pool off

;---------------------------------------------------------------------------------------------------

Module_MainRouting:
#_0080B5: LDY.b $10

#_0080B7: LDA.w .low,Y
#_0080BA: STA.b $03

#_0080BC: LDA.w .mid,Y
#_0080BF: STA.b $04

#_0080C1: LDA.w .bank,Y
#_0080C4: STA.b $05

#_0080C6: JML.w [$0003]

;===================================================================================================

Interrupt_NMI:
#_0080C9: SEI
#_0080CA: REP #$30

#_0080CC: PHA
#_0080CD: PHX
#_0080CE: PHY

#_0080CF: PHD
#_0080D0: PHB

#_0080D1: LDA.w #$0000
#_0080D4: TCD

#_0080D5: PHK
#_0080D6: PLB

#_0080D7: SEP #$30

#_0080D9: LDA.w RDNMI

#_0080DC: LDA.w $012C
#_0080DF: BNE .song_input

#_0080E1: LDA.w APUIO0
#_0080E4: CMP.w $0133
#_0080E7: BNE .handle_sfx1

#_0080E9: STZ.w APUIO0

#_0080EC: BRA .handle_sfx1

.song_input
#_0080EE: CMP.w $0133
#_0080F1: BEQ .handle_sfx1

#_0080F3: STA.w APUIO0
#_0080F6: STA.w $0133

#_0080F9: CMP.b #$F2 ; SONG F2 - half volume
#_0080FB: BCS .song_command

#_0080FD: STA.w $0130

.song_command
#_008100: STZ.w $012C

.handle_sfx1
#_008103: LDA.w $012D
#_008106: BNE .new_sfx1

#_008108: LDA.w APUIO1
#_00810B: CMP.w $0131
#_00810E: BNE .handle_SFX23

#_008110: STZ.w APUIO1

#_008113: BRA .handle_SFX23

.new_sfx1
#_008115: STA.w $0131
#_008118: STA.w APUIO1

#_00811B: STZ.w $012D

.handle_SFX23
#_00811E: LDA.w $012E
#_008121: STA.w APUIO2

#_008124: LDA.w $012F
#_008127: STA.w APUIO3

#_00812A: STZ.w $012E
#_00812D: STZ.w $012F

#_008130: LDA.b #$80
#_008132: STA.w INIDISP
#_008135: STZ.w HDMAEN

#_008138: LDA.b $12
#_00813A: BNE .lag_frame

#_00813C: INC.b $12

#_00813E: JSR NMI_DoUpdates
#_008141: JSR NMI_ReadJoypads

.lag_frame
#_008144: LDA.w $012A
#_008147: BEQ NMI_NoIRQThread

#_008149: JMP.w NMI_SwitchThread

;===================================================================================================

NMI_NoIRQThread:
#_00814C: LDA.b $96
#_00814E: STA.w W12SEL

#_008151: LDA.b $97
#_008153: STA.w W34SEL

#_008156: LDA.b $98
#_008158: STA.w WOBJSEL

#_00815B: LDA.b $99
#_00815D: STA.w CGWSEL

#_008160: LDA.b $9A
#_008162: STA.w CGADSUB

#_008165: LDA.b $9C
#_008167: STA.w COLDATA

#_00816A: LDA.b $9D
#_00816C: STA.w COLDATA

#_00816F: LDA.b $9E
#_008171: STA.w COLDATA

#_008174: LDA.b $1C
#_008176: STA.w TM

#_008179: LDA.b $1D
#_00817B: STA.w TS

#_00817E: LDA.b $1E
#_008180: STA.w TMW

#_008183: LDA.b $1F
#_008185: STA.w TSW

#_008188: LDA.w $0120
#_00818B: STA.w BG1HOFS

#_00818E: LDA.w $0121
#_008191: STA.w BG1HOFS

#_008194: LDA.w $0124
#_008197: STA.w BG1VOFS

#_00819A: LDA.w $0125
#_00819D: STA.w BG1VOFS

#_0081A0: LDA.w $011E
#_0081A3: STA.w BG2HOFS

#_0081A6: LDA.w $011F
#_0081A9: STA.w BG2HOFS

#_0081AC: LDA.w $0122
#_0081AF: STA.w BG2VOFS

#_0081B2: LDA.w $0123
#_0081B5: STA.w BG2VOFS

#_0081B8: LDA.b $E4
#_0081BA: STA.w BG3HOFS

#_0081BD: LDA.b $E5
#_0081BF: STA.w BG3HOFS

#_0081C2: LDA.b $EA
#_0081C4: STA.w BG3VOFS

#_0081C7: LDA.b $EB
#_0081C9: STA.w BG3VOFS

#_0081CC: LDA.b $95
#_0081CE: STA.w MOSAIC

;---------------------------------------------------------------------------------------------------

#_0081D1: LDA.b $94
#_0081D3: STA.w BGMODE

#_0081D6: AND.b #$07
#_0081D8: CMP.b #$07
#_0081DA: BNE .not_mode7

#_0081DC: STZ.w M7B
#_0081DF: STZ.w M7B
#_0081E2: STZ.w M7C
#_0081E5: STZ.w M7C

#_0081E8: LDA.w $0638
#_0081EB: STA.w M7X

#_0081EE: LDA.w $0639
#_0081F1: STA.w M7X

#_0081F4: LDA.w $063A
#_0081F7: STA.w M7Y

#_0081FA: LDA.w $063B
#_0081FD: STA.w M7Y

;---------------------------------------------------------------------------------------------------

.not_mode7
#_008200: LDA.w $0128
#_008203: BEQ .IRQ_inactive

#_008205: LDA.w TIMEUP

#_008208: LDA.b #$80
#_00820A: STA.w VTIMEL
#_00820D: STZ.w VTIMEH

#_008210: STZ.w HTIMEL
#_008213: STZ.w HTIMEH

#_008216: LDA.b #$A1
#_008218: STA.w NMITIMEN

;---------------------------------------------------------------------------------------------------

.IRQ_inactive
#_00821B: LDA.b $13
#_00821D: STA.w INIDISP

#_008220: LDA.b $9B
#_008222: STA.w HDMAEN

#_008225: REP #$30

#_008227: PLB
#_008228: PLD

#_008229: PLY
#_00822A: PLX
#_00822B: PLA

;===================================================================================================

Interrupt_Unused:
#_00822C: RTI

;===================================================================================================

NMI_SwitchThread:
#_00822D: JSR NMI_UpdateIRQGFX

#_008230: LDA.b $FF
#_008232: STA.w VTIMEL
#_008235: STZ.w VTIMEH

#_008238: LDA.b #$A1 ; enable NMI, IRQ, auto joypad
#_00823A: STA.w NMITIMEN

#_00823D: LDA.b $96
#_00823F: STA.w W12SEL

#_008242: LDA.b $97
#_008244: STA.w W34SEL

#_008247: LDA.b $98
#_008249: STA.w WOBJSEL

#_00824C: LDA.b $99
#_00824E: STA.w CGWSEL

#_008251: LDA.b $9A
#_008253: STA.w CGADSUB

#_008256: LDA.b $9C
#_008258: STA.w COLDATA

#_00825B: LDA.b $9D
#_00825D: STA.w COLDATA

#_008260: LDA.b $9E
#_008262: STA.w COLDATA

#_008265: LDA.b $1C
#_008267: STA.w TM

#_00826A: LDA.b $1D
#_00826C: STA.w TS

#_00826F: LDA.b $1E
#_008271: STA.w TMW

#_008274: LDA.b $1F
#_008276: STA.w TSW

;---------------------------------------------------------------------------------------------------

#_008279: LDA.w $0120
#_00827C: STA.w BG1HOFS

#_00827F: LDA.w $0121
#_008282: STA.w BG1HOFS

#_008285: LDA.w $0124
#_008288: STA.w BG1VOFS

#_00828B: LDA.w $0125
#_00828E: STA.w BG1VOFS

#_008291: LDA.w $011E
#_008294: STA.w BG2HOFS

#_008297: LDA.w $011F
#_00829A: STA.w BG2HOFS

#_00829D: LDA.w $0122
#_0082A0: STA.w BG2VOFS

#_0082A3: LDA.w $0123
#_0082A6: STA.w BG2VOFS

#_0082A9: LDA.b $E4
#_0082AB: STA.w BG3HOFS

#_0082AE: LDA.b $E5
#_0082B0: STA.w BG3HOFS

#_0082B3: LDA.b $EA
#_0082B5: STA.w BG3VOFS

#_0082B8: LDA.b $EB
#_0082BA: STA.w BG3VOFS

#_0082BD: LDA.b $13
#_0082BF: STA.w INIDISP

#_0082C2: LDA.b $9B
#_0082C4: STA.w HDMAEN

;---------------------------------------------------------------------------------------------------

#_0082C7: REP #$30

#_0082C9: TSC
#_0082CA: TAX

#_0082CB: LDA.w $1F0A
#_0082CE: TCS

#_0082CF: STX.w $1F0A

#_0082D2: PLB
#_0082D3: PLD

#_0082D4: PLY
#_0082D5: PLX
#_0082D6: PLA

#_0082D7: RTI

;===================================================================================================

Interrupt_IRQ:
#_0082D8: SEI
#_0082D9: REP #$30

#_0082DB: PHA
#_0082DC: PHX
#_0082DD: PHY

#_0082DE: PHD
#_0082DF: PHB

#_0082E0: PHK
#_0082E1: PLB

#_0082E2: SEP #$30

#_0082E4: LDA.w $012A
#_0082E7: BNE .polyhedral

#_0082E9: LDA.w TIMEUP
#_0082EC: BPL .exit

#_0082EE: LDA.w $0128
#_0082F1: BEQ .exit

.wait_for_hblank
#_0082F3: BIT.w HVBJOY
#_0082F6: BVC .wait_for_hblank

#_0082F8: LDA.w $0630
#_0082FB: STA.w BG3HOFS

#_0082FE: LDA.w $0631
#_008301: STA.w BG3HOFS

#_008304: STZ.w BG3VOFS
#_008307: STZ.w BG3VOFS

#_00830A: LDA.w $0128
#_00830D: BPL .exit

#_00830F: STZ.w $0128

#_008312: LDA.b #$81
#_008314: STA.w NMITIMEN

.exit
#_008317: REP #$30

#_008319: PLB
#_00831A: PLD

#_00831B: PLY
#_00831C: PLX
#_00831D: PLA

#_00831E: RTI

;---------------------------------------------------------------------------------------------------

.polyhedral
#_00831F: LDA.w TIMEUP

#_008322: REP #$30

#_008324: TSC
#_008325: TAX

#_008326: LDA.w $1F0A
#_008329: TCS

#_00832A: STX.w $1F0A

#_00832D: PLB
#_00832E: PLD

#_00832F: PLY
#_008330: PLX
#_008331: PLA

#_008332: RTI

;===================================================================================================

EraseTilemaps_triforce:
#_008333: REP #$20

#_008335: LDA.w #$00A9
#_008338: STA.b $02

#_00833A: LDA.w #$007F

#_00833D: BRA EraseTilemaps

;---------------------------------------------------------------------------------------------------

EraseTilemaps_dungeonmap:
#_00833F: REP #$20

#_008341: LDA.w #$007F
#_008344: STA.b $02

#_008346: LDA.w #$0300

#_008349: BRA EraseTilemaps

;---------------------------------------------------------------------------------------------------

EraseTilemaps_normal:
#_00834B: REP #$20

#_00834D: LDA.w #$007F
#_008350: STA.b $02

#_008352: LDA.w #$01EC

;---------------------------------------------------------------------------------------------------

EraseTilemaps:
#_008355: STA.b $00

#_008357: STZ.w VMAIN
#_00835A: STZ.w VMADDR

#_00835D: LDA.w #$1808
#_008360: STA.w DMA1MODE

#_008363: STZ.w DMA1ADDRB

#_008366: LDA.w #$0000
#_008369: STA.w DMA1ADDRL

#_00836C: LDA.w #$2000
#_00836F: STA.w DMA1SIZE

#_008372: LDY.b #$02
#_008374: STY.w MDMAEN

#_008377: LDX.b #$80
#_008379: STX.w VMAIN

#_00837C: STZ.w VMADDR

#_00837F: STA.w DMA1SIZE

#_008382: LDA.w #$1908
#_008385: STA.w DMA1MODE

#_008388: LDA.w #$0001
#_00838B: STA.w DMA1ADDRL

#_00838E: STY.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008391: LDA.b $02
#_008393: STA.b $00

#_008395: STZ.w VMAIN

#_008398: LDA.w #$6000 ; VRAM $C000
#_00839B: STA.w VMADDR

#_00839E: LDA.w #$1808
#_0083A1: STA.w DMA1MODE

#_0083A4: LDA.w #$0000
#_0083A7: STA.w DMA1ADDRL

#_0083AA: LDA.w #$0800
#_0083AD: STA.w DMA1SIZE

#_0083B0: STY.w MDMAEN

#_0083B3: STX.w VMAIN
#_0083B6: STA.w DMA1SIZE

#_0083B9: LDA.w #$6000 ; VRAM $C000
#_0083BC: STA.w VMADDR

#_0083BF: LDA.w #$1908
#_0083C2: STA.w DMA1MODE

#_0083C5: LDA.w #$0001
#_0083C8: STA.w DMA1ADDRL

#_0083CB: STY.w MDMAEN

#_0083CE: SEP #$20

#_0083D0: RTL

;===================================================================================================

NMI_ReadJoypads:
#_0083D1: STZ.w JOYPAD

#_0083D4: LDA.w JOY1L
#_0083D7: STA.b $00

#_0083D9: LDA.w JOY1H
#_0083DC: STA.b $01

#_0083DE: LDA.b $00
#_0083E0: STA.b $F2

#_0083E2: TAY

#_0083E3: EOR.b $FA
#_0083E5: AND.b $F2
#_0083E7: STA.b $F6

#_0083E9: STY.b $FA

#_0083EB: LDA.b $01
#_0083ED: STA.b $F0

#_0083EF: TAY

#_0083F0: EOR.b $F8
#_0083F2: AND.b $F0
#_0083F4: STA.b $F4

#_0083F6: STY.b $F8

;===================================================================================================

#Player2JoypadReturn:
#_0083F8: RTS

;---------------------------------------------------------------------------------------------------

#_0083F9: LDA.w JOY2L
#_0083FC: STA.b $00

#_0083FE: LDA.w JOY2H
#_008401: STA.b $01

#_008403: LDA.b $00
#_008405: STA.b $F3

#_008407: TAY

#_008408: EOR.b $FB
#_00840A: AND.b $F3
#_00840C: STA.b $F7

#_00840E: STY.b $FB

#_008410: LDA.b $01
#_008412: STA.b $F1

#_008414: TAY

#_008415: EOR.b $F9
#_008417: AND.b $F1
#_008419: STA.b $F5

#_00841B: STY.b $F9

#_00841D: RTS

;===================================================================================================

ClearOAMBuffer:
#_00841E: LDX.b #$60

.next
#_008420: LDA.b #$F0
#_008422: STA.w $0801,X
#_008425: STA.w $0805,X
#_008428: STA.w $0809,X
#_00842B: STA.w $080D,X

#_00842E: STA.w $0811,X
#_008431: STA.w $0815,X
#_008434: STA.w $0819,X
#_008437: STA.w $081D,X

#_00843A: STA.w $0881,X
#_00843D: STA.w $0885,X
#_008440: STA.w $0889,X
#_008443: STA.w $088D,X

#_008446: STA.w $0891,X
#_008449: STA.w $0895,X
#_00844C: STA.w $0899,X
#_00844F: STA.w $089D,X

#_008452: STA.w $0901,X
#_008455: STA.w $0905,X
#_008458: STA.w $0909,X
#_00845B: STA.w $090D,X

#_00845E: STA.w $0911,X
#_008461: STA.w $0915,X
#_008464: STA.w $0919,X
#_008467: STA.w $091D,X

#_00846A: STA.w $0981,X
#_00846D: STA.w $0985,X
#_008470: STA.w $0989,X
#_008473: STA.w $098D,X

#_008476: STA.w $0991,X
#_008479: STA.w $0995,X
#_00847C: STA.w $0999,X
#_00847F: STA.w $099D,X

#_008482: TXA
#_008483: SEC
#_008484: SBC.b #$20
#_008486: TAX

#_008487: BPL .next

#_008489: RTS

;===================================================================================================

SaveFileOffsets:
#_00848A: dw $700000

;---------------------------------------------------------------------------------------------------

SaveFileCopyOffsets:
#_00848C: dw $700000, $700500
#_008490: dw $700A00, $700F00

;===================================================================================================

DynamicOAM_PushBlockAddresses:
#_008494: dw $7EA480 ; 4/4
#_008496: dw $7EA4C0 ; 3/4
#_008498: dw $7EA500 ; 2/4
#_00849A: dw $7EA540 ; 1/4

;---------------------------------------------------------------------------------------------------

LinkOAM_SwordAddresses:
#_00849C: dw $7E9000, $7E9020, $7E9060, $7E91E0 ; vertical, slash1, left-up, horizontal
#_0084A4: dw $7E90A0, $7E90C0, $7E9100, $7E9140 ; up-left, slash2, slash whiff, slash3

;---------------------------------------------------------------------------------------------------

LinkOAM_ShieldAddresses:
#_0084AC: dw $7E9300 ; down
#_0084AE: dw $7E9340 ; up
#_0084B0: dw $7E9380 ; side

;---------------------------------------------------------------------------------------------------

DynamicOAM_LinkItemAddresses:
#_0084B2: dw $7E9480, $7E94C0, $7E94E0, $7E95C0 ; rod
#_0084BA: dw $7E9500, $7E9520, $7E9540, $7E9480 ; rod
#_0084C2: dw $7E9640, $7E9680, $7E96A0, $7E9780 ; hammer
#_0084CA: dw $7E96C0, $7E96E0, $7E9700, $7E9480 ; hammer

#_0084D2: dw $7E9800, $7E9840, $7E98A0, $7E9480 ; bow
#_0084DA: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_0084E2: dw $7E9AC0, $7E9B00, $7E9480, $7E9480 ; hookshot tip
#_0084EA: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

#_0084F2: dw $7E9BC0, $7E9C00, $7E9C40, $7E9C80 ; net
#_0084FA: dw $7E9CC0, $7E9D00, $7E9D40, $7E9480 ; net
#_008502: dw $7E9F40, $7E9F80, $7E9FC0, $7E9FE0 ; cane
#_00850A: dw $7EA000, $7E9480, $7E9480, $7E9480 ; cane

#_008512: dw $7EA100, $7E9480, $7E9480, $7E9480 ; book
#_00851A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_008522: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00852A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

#_008532: dw $7E98C0, $7E9900, $7E99C0, $7E99E0 ; shovel, ZZzzzz
#_00853A: dw $7E9A00, $7E9A20, $7E9A40, $7E9A60 ; Zzzzz, ♪
#_008542: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00854A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

#_008552: dw $7E9A80, $7E9480, $7E9480, $7E9480 ; null
#_00855A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_008562: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00856A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

#_008572: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00857A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_008582: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00858A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

#_008592: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_00859A: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_0085A2: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
#_0085AA: dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

;---------------------------------------------------------------------------------------------------

.offsets
#_0085B2: dw $00E0, $00E0, $0060, $0080
#_0085BA: dw $01C0, $00E0, $0040, $0000
#_0085C2: dw $0080, $0000, $0040, $0000
#_0085CA: dw $0000, $0000, $0000, $0000

;===================================================================================================

RupeeTile_anim_step:
#_0085D2: dw $000E
#_0085D4: dw $0004
#_0085D6: dw $0006
#_0085D8: dw $0010
#_0085DA: dw $0006
#_0085DC: dw $0008

;---------------------------------------------------------------------------------------------------

RupeeTile_anim_stepOffset:
#_0085DE: dw $0000, $0020, $0040, $0000
#_0085E6: dw $0020, $0040, $0000, $0040
#_0085EE: dw $0080, $0000, $0040, $0080

;===================================================================================================

StarTileOffset:
#_0085F6: dw $7EB340
#_0085F8: dw $7EB400
#_0085FA: dw $7EB4C0

;===================================================================================================

NMI_PrepareSprites:
#_0085FC: LDY.b #$1C

.next_block
#_0085FE: TYA
#_0085FF: ASL A
#_008600: ASL A
#_008601: TAX

#_008602: LDA.w $0A23,X
#_008605: ASL A
#_008606: ASL A

#_008607: ORA.w $0A22,X
#_00860A: ASL A
#_00860B: ASL A

#_00860C: ORA.w $0A21,X
#_00860F: ASL A
#_008610: ASL A

#_008611: ORA.w $0A20,X
#_008614: STA.w $0A00,Y

#_008617: LDA.w $0A27,X
#_00861A: ASL A
#_00861B: ASL A

#_00861C: ORA.w $0A26,X
#_00861F: ASL A
#_008620: ASL A

#_008621: ORA.w $0A25,X
#_008624: ASL A
#_008625: ASL A

#_008626: ORA.w $0A24,X
#_008629: STA.w $0A01,Y

#_00862C: LDA.w $0A2B,X
#_00862F: ASL A
#_008630: ASL A

#_008631: ORA.w $0A2A,X
#_008634: ASL A
#_008635: ASL A

#_008636: ORA.w $0A29,X
#_008639: ASL A
#_00863A: ASL A

#_00863B: ORA.w $0A28,X
#_00863E: STA.w $0A02,Y

#_008641: LDA.w $0A2F,X
#_008644: ASL A
#_008645: ASL A

#_008646: ORA.w $0A2E,X
#_008649: ASL A
#_00864A: ASL A

#_00864B: ORA.w $0A2D,X
#_00864E: ASL A
#_00864F: ASL A

#_008650: ORA.w $0A2C,X
#_008653: STA.w $0A03,Y

#_008656: DEY
#_008657: DEY
#_008658: DEY
#_008659: DEY
#_00865A: BPL .next_block

;---------------------------------------------------------------------------------------------------

#_00865C: REP #$31

#_00865E: LDX.w $0100

#_008661: LDA.w LinkOAM_HeadAddresses,X
#_008664: STA.w $0ACC

#_008667: ADC.w #$0200
#_00866A: STA.w $0ACE

#_00866D: LDA.w LinkOAM_BodyAddresses,X
#_008670: STA.w $0AD0

#_008673: CLC
#_008674: ADC.w #$0200
#_008677: STA.w $0AD2

#_00867A: LDX.w $0102

#_00867D: LDA.w LinkOAM_AuxAddresses,X
#_008680: STA.w $0AD4

#_008683: LDX.w $0104

#_008686: LDA.w LinkOAM_AuxAddresses,X
#_008689: STA.w $0AD6

#_00868C: SEP #$10

#_00868E: LDX.w $0107

#_008691: LDA.w LinkOAM_SwordAddresses,X
#_008694: STA.w $0AC0

#_008697: CLC
#_008698: ADC.w #$0180
#_00869B: STA.w $0AC2

#_00869E: LDX.w $0108

#_0086A1: LDA.w LinkOAM_ShieldAddresses,X
#_0086A4: STA.w $0AC4

#_0086A7: CLC
#_0086A8: ADC.w #$00C0
#_0086AB: STA.w $0AC6

#_0086AE: LDA.w $0109
#_0086B1: AND.w #$00F8
#_0086B4: LSR A
#_0086B5: LSR A
#_0086B6: TAY

#_0086B7: LDA.w $0109
#_0086BA: ASL A
#_0086BB: TAX

#_0086BC: LDA.w DynamicOAM_LinkItemAddresses,X
#_0086BF: STA.w $0AC8

#_0086C2: CLC
#_0086C3: TYX
#_0086C4: ADC.w DynamicOAM_LinkItemAddresses_offsets,X
#_0086C7: STA.w $0ACA

#_0086CA: LDA.w $02C3
#_0086CD: AND.w #$0003
#_0086D0: ASL A
#_0086D1: TAX

#_0086D2: LDA.w DynamicOAM_PushBlockAddresses,X
#_0086D5: STA.w $0AD8

#_0086D8: CLC
#_0086D9: ADC.w #$0100
#_0086DC: STA.w $0ADA

#_0086DF: LDA.l $7EC00D
#_0086E3: DEC A
#_0086E4: STA.l $7EC00D
#_0086E8: BNE .dont_animate_bg

;---------------------------------------------------------------------------------------------------

#_0086EA: LDA.w #$0009

#_0086ED: LDX.b $8C
#_0086EF: CPX.b #$B5 ; OW B5
#_0086F1: BEQ .use_longer_timer

#_0086F3: CPX.b #$BC ; OW BC
#_0086F5: BNE .use_shorter_timer

.use_longer_timer
#_0086F7: LDA.w #$0017

.use_shorter_timer
#_0086FA: STA.l $7EC00D

#_0086FE: LDA.l $7EC00F
#_008702: CLC
#_008703: ADC.w #$0400
#_008706: CMP.w #$0C00
#_008709: BNE .dont_reset_rupees_tiles

#_00870B: LDA.w #$0000

.dont_reset_rupees_tiles
#_00870E: STA.l $7EC00F

#_008712: CLC
#_008713: ADC.w #$7EA680
#_008716: STA.w $0ADC

.dont_animate_bg
#_008719: LDA.l $7EC013
#_00871D: DEC A
#_00871E: STA.l $7EC013
#_008722: BNE .dont_animate_rupee

#_008724: LDA.l $7EC015
#_008728: TAX

#_008729: INX
#_00872A: INX

#_00872B: CPX.b #$0C
#_00872D: BNE .rupee_step_fine

#_00872F: LDX.b #$00

.rupee_step_fine
#_008731: TXA
#_008732: STA.l $7EC015

#_008736: LDA.w RupeeTile_anim_step,X
#_008739: STA.l $7EC013

#_00873D: LDA.w #$7EB280
#_008740: CLC
#_008741: ADC.w RupeeTile_anim_stepOffset,X
#_008744: STA.w $0AE0

#_008747: CLC
#_008748: ADC.w #$0060
#_00874B: STA.w $0AE2

.dont_animate_rupee
#_00874E: LDA.w $0AE8
#_008751: ASL A
#_008752: ADC.w #$7EB940
#_008755: STA.w $0AEC

#_008758: ADC.w #$0200
#_00875B: STA.w $0AEE

#_00875E: LDA.w $0AEA
#_008761: ASL A
#_008762: ADC.w #$7EB940
#_008765: STA.w $0AF0

#_008768: ADC.w #$0200
#_00876B: STA.w $0AF2

#_00876E: LDA.w $0AF4
#_008771: ASL A
#_008772: ADC.w #$7EB540
#_008775: STA.w $0AF6

#_008778: ADC.w #$0200
#_00877B: STA.w $0AF8

#_00877E: SEP #$20

#_008780: RTS

;===================================================================================================

JumpTableLocal:
#_008781: STY.b $03

#_008783: PLY
#_008784: STY.b $00

#_008786: REP #$30

#_008788: AND.w #$00FF
#_00878B: ASL A
#_00878C: TAY

#_00878D: PLA
#_00878E: STA.b $01

#_008790: INY

#_008791: LDA.b [$00],Y
#_008793: STA.b $00

#_008795: SEP #$30

#_008797: LDY.b $03

#_008799: JML.w [$0000]

;===================================================================================================

JumpTableLong:
#_00879C: STY.b $05

#_00879E: PLY
#_00879F: STY.b $02

#_0087A1: REP #$30

#_0087A3: AND.w #$00FF
#_0087A6: STA.b $03

#_0087A8: ASL A
#_0087A9: ADC.b $03
#_0087AB: TAY

#_0087AC: PLA
#_0087AD: STA.b $03

#_0087AF: INY

#_0087B0: LDA.b [$02],Y
#_0087B2: STA.b $00

#_0087B4: INY

#_0087B5: LDA.b [$02],Y
#_0087B7: STA.b $01

#_0087B9: SEP #$30

#_0087BB: LDY.b $05

#_0087BD: JML.w [$0000]

;===================================================================================================

InitializeMemoryAndSRAM:
#_0087C0: REP #$30

#_0087C2: LDY.w $01FE

#_0087C5: LDX.w #$03FE
#_0087C8: LDA.w #$0000

.clear_wram
#_0087CB: STA.w $0000,X
#_0087CE: STA.w $0400,X
#_0087D1: STA.w $0800,X
#_0087D4: STA.w $0C00,X

#_0087D7: STA.w $1000,X
#_0087DA: STA.w $1400,X
#_0087DD: STA.w $1800,X
#_0087E0: STA.w $1C00,X

#_0087E3: DEX
#_0087E4: DEX
#_0087E5: BNE .clear_wram

;---------------------------------------------------------------------------------------------------

#_0087E7: STA.l $7EC500 ; writes RGB: #000000
#_0087EB: STA.l $701FFE ; not selecting any save file

#_0087EF: LDA.l $7003E5
#_0087F3: CMP.w #$55AA
#_0087F6: BEQ .sram1_valid

#_0087F8: LDA.w #$0000
#_0087FB: STA.l $7003E5

.sram1_valid
#_0087FF: LDA.l $7008E5
#_008803: CMP.w #$55AA
#_008806: BEQ .sram2_valid

#_008808: LDA.w #$0000
#_00880B: STA.l $7008E5

.sram2_valid
#_00880F: LDA.l $700DE5
#_008813: CMP.w #$55AA
#_008816: BEQ .sram3_valid

#_008818: LDA.w #$0000
#_00881B: STA.l $700DE5

.sram3_valid
#_00881F: STY.w $01FE

#_008822: STZ.w TMW

#_008825: SEP #$30

#_008827: LDA.b #$80
#_008829: STA.b $13

#_00882B: INC.b $15

#_00882D: RTS

;===================================================================================================

Overworld_GetTileTypeAtLocation:
#_00882E: REP #$30

#_008830: LDA.b $00
#_008832: SEC
#_008833: SBC.w $0708

#_008836: AND.w $070A

#_008839: ASL A
#_00883A: ASL A
#_00883B: ASL A

#_00883C: STA.b $06

#_00883E: LDA.b $02
#_008840: SEC
#_008841: SBC.w $070C

#_008844: AND.w $070E
#_008847: ORA.b $06
#_008849: TAX

#_00884A: LDA.l $7E2000,X
#_00884E: ASL A
#_00884F: ASL A
#_008850: STA.b $06

#_008852: LDA.b $00
#_008854: AND.w #$0008
#_008857: LSR A
#_008858: LSR A
#_008859: TSB.b $06

#_00885B: LDA.b $02
#_00885D: AND.w #$0001
#_008860: ORA.b $06
#_008862: ASL A
#_008863: TAX

#_008864: LDA.l Map16Definitions,X
#_008868: STA.b $06

#_00886A: AND.w #$01FF
#_00886D: TAX

#_00886E: LDA.l OverworldTileTypes,X

;---------------------------------------------------------------------------------------------------

#_008872: SEP #$30

#_008874: CMP.b #$10
#_008876: BCC .exit

#_008878: CMP.b #$1C
#_00887A: BCS .exit

#_00887C: STA.b $06

#_00887E: LDA.b $07
#_008880: AND.b #$40

#_008882: ASL A
#_008883: ROL A
#_008884: ROL A
#_008885: ORA.b $06

.exit
#_008887: RTL

;===================================================================================================

LoadSongBank:
#_008888: PHP

#_008889: REP #$30

#_00888B: LDY.w #$0000
#_00888E: LDA.w #$BBAA

.apu_not_ready
#_008891: CMP.w APUIO0
#_008894: BNE .apu_not_ready

#_008896: SEP #$20

#_008898: LDA.b #$CC
#_00889A: BRA .setup_transfer

;---------------------------------------------------------------------------------------------------

.next_transfer
#_00889C: LDA.b [$00],Y

#_00889E: INY

#_00889F: XBA
#_0088A0: LDA.b #$00
#_0088A2: BRA .write_zero

.next_byte
#_0088A4: XBA
#_0088A5: LDA.b [$00],Y

#_0088A7: INY
#_0088A8: CPY.w #$8000
#_0088AB: BNE .no_bank_wrap

#_0088AD: LDY.w #$0000

#_0088B0: INC.b $02

.no_bank_wrap
#_0088B2: XBA

.wait_for_zero
#_0088B3: CMP.w APUIO0
#_0088B6: BNE .wait_for_zero

#_0088B8: INC A

.write_zero
#_0088B9: REP #$20

#_0088BB: STA.w APUIO0

#_0088BE: SEP #$20

#_0088C0: DEX
#_0088C1: BNE .next_byte

.wait_for_sync
#_0088C3: CMP.w APUIO0
#_0088C6: BNE .wait_for_sync

.make_A_nonzero
#_0088C8: ADC.b #$03
#_0088CA: BEQ .make_A_nonzero

;---------------------------------------------------------------------------------------------------

.setup_transfer
#_0088CC: PHA

#_0088CD: REP #$20

#_0088CF: LDA.b [$00],Y
#_0088D1: INY
#_0088D2: INY
#_0088D3: TAX

#_0088D4: LDA.b [$00],Y
#_0088D6: INY
#_0088D7: INY
#_0088D8: STA.w APUIO2

#_0088DB: SEP #$20

#_0088DD: CPX.w #$0001

#_0088E0: LDA.b #$00
#_0088E2: ROL A
#_0088E3: STA.w APUIO1

#_0088E6: ADC.b #$7F
#_0088E8: PLA
#_0088E9: STA.w APUIO0

.wait_for_sync_2
#_0088EC: CMP.w APUIO0
#_0088EF: BNE .wait_for_sync_2

#_0088F1: BVS .next_transfer

;---------------------------------------------------------------------------------------------------

#_0088F3: STZ.w APUIO0
#_0088F6: STZ.w APUIO1
#_0088F9: STZ.w APUIO2
#_0088FC: STZ.w APUIO3

#_0088FF: PLP

#_008900: RTS

;===================================================================================================

LoadIntroSongBank:
#_008901: LDA.b #SamplePointers>>0
#_008903: STA.b $00

#_008905: LDA.b #SamplePointers>>8
#_008907: STA.b $01

#_008909: LDA.b #SamplePointers>>16
#_00890B: STA.b $02

#_00890D: SEI

#_00890E: JSR LoadSongBank

#_008911: CLI

#_008912: RTS

;===================================================================================================

LoadOverworldSongs:
#_008913: LDA.b #SongBank_Overworld_Main>>0
#_008915: STA.b $00

#_008917: LDA.b #SongBank_Overworld_Main>>8
#_008919: STA.b $01

#_00891B: LDA.b #SongBank_Overworld_Main>>16

;---------------------------------------------------------------------------------------------------

PrepareAPUTransfer:
#_00891D: STA.b $02

#_00891F: SEI

#_008920: JSR LoadSongBank

#_008923: CLI

#_008924: RTL

;===================================================================================================

LoadUnderworldSongs:
#_008925: LDA.b #SongBank_Underworld_Main>>0
#_008927: STA.b $00

#_008929: LDA.b #SongBank_Underworld_Main>>8
#_00892B: STA.b $01

#_00892D: LDA.b #SongBank_Underworld_Main>>16
#_00892F: BRA PrepareAPUTransfer

;===================================================================================================

LoadCreditsSongs:
#_008931: LDA.b #SongBank_Credits_Main>>0
#_008933: STA.b $00

#_008935: LDA.b #SongBank_Credits_Main>>8
#_008937: STA.b $01

#_008939: LDA.b #SongBank_Credits_Main>>16
#_00893B: BRA PrepareAPUTransfer

;===================================================================================================

EnableForceBlank:
#_00893D: LDA.b #$80
#_00893F: STA.w INIDISP
#_008942: STA.b $13

#_008944: STZ.w HDMAEN
#_008947: STZ.b $9B

#_008949: RTL

;===================================================================================================

SaveGameFile:
#_00894A: PHB

#_00894B: LDA.b #$70
#_00894D: PHA
#_00894E: PLB

#_00894F: REP #$30

#_008951: LDX.w $701FFE

#_008954: LDA.l SaveFileOffsets,X
#_008958: TAY

#_008959: PHY

#_00895A: LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.write_save
#_00895D: LDA.l $7EF000,X
#_008961: STA.w $700000,Y
#_008964: STA.w $700F00,Y

#_008967: LDA.l $7EF100,X
#_00896B: STA.w $700100,Y
#_00896E: STA.w $701000,Y

#_008971: LDA.l $7EF200,X
#_008975: STA.w $700200,Y
#_008978: STA.w $701100,Y

#_00897B: LDA.l $7EF300,X
#_00897F: STA.w $700300,Y
#_008982: STA.w $701200,Y

#_008985: LDA.l $7EF400,X
#_008989: STA.w $700400,Y
#_00898C: STA.w $701300,Y

#_00898F: INY
#_008990: INY

#_008991: INX
#_008992: INX

#_008993: CPX.w #$0100
#_008996: BNE .write_save

;---------------------------------------------------------------------------------------------------

#_008998: LDX.w #$0000
#_00899B: TXA

.calc_checksum
#_00899C: CLC
#_00899D: ADC.l $7EF000,X

#_0089A1: INX
#_0089A2: INX
#_0089A3: CPX.w #$04FE
#_0089A6: BNE .calc_checksum

#_0089A8: STA.b $00

#_0089AA: PLY

#_0089AB: LDA.w #$5A5A
#_0089AE: SEC
#_0089AF: SBC.b $00
#_0089B1: STA.l $7EF4FE

#_0089B5: TYX

#_0089B6: STA.l $7004FE,X
#_0089BA: STA.l $7013FE,X

#_0089BE: SEP #$30

#_0089C0: PLB

#_0089C1: RTL

;===================================================================================================
; FREE ROM: 0x1E
;===================================================================================================
NULL_0089C2:
#_0089C2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0089CA: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0089D2: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0089DA: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

NMI_DoUpdates:
#_0089E0: REP #$10

#_0089E2: LDA.b #$80
#_0089E4: STA.w VMAIN

#_0089E7: LDA.w $0710
#_0089EA: BEQ .do_sprite_updates

#_0089EC: JMP.w .skip_sprite_updates

;---------------------------------------------------------------------------------------------------

.do_sprite_updates
#_0089EF: LDX.w #$1801
#_0089F2: STX.w DMA0MODE
#_0089F5: STX.w DMA1MODE
#_0089F8: STX.w DMA2MODE
#_0089FB: STX.w DMA3MODE
#_0089FE: STX.w DMA4MODE

#_008A01: LDA.b #LinkGraphics>>16
#_008A03: STA.w DMA0ADDRB
#_008A06: STA.w DMA1ADDRB
#_008A09: STA.w DMA2ADDRB

#_008A0C: LDY.w #$4100 ; VRAM $8200
#_008A0F: STY.w VMADDR

#_008A12: LDY.w $0ACE
#_008A15: STY.w DMA0ADDRL

#_008A18: LDX.w #$0040
#_008A1B: STX.w DMA0SIZE

#_008A1E: LDY.w $0AD2
#_008A21: STY.w DMA1ADDRL
#_008A24: STX.w DMA1SIZE

#_008A27: LDY.w $0AD6
#_008A2A: STY.w DMA2ADDRL

#_008A2D: LDY.w #$0020
#_008A30: STY.w DMA2SIZE

#_008A33: LDA.b #$07
#_008A35: STA.w MDMAEN

#_008A38: STY.w DMA2SIZE

#_008A3B: LDY.w #$4000 ; VRAM $8000
#_008A3E: STY.w VMADDR

#_008A41: LDY.w $0ACC
#_008A44: STY.w DMA0ADDRL

#_008A47: STX.w DMA0SIZE

#_008A4A: LDY.w $0AD0

#_008A4D: STY.w DMA1ADDRL
#_008A50: STX.w DMA1SIZE

#_008A53: LDY.w $0AD4
#_008A56: STY.w DMA2ADDRL

#_008A59: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008A5C: LDA.b #$7E
#_008A5E: STA.w DMA0ADDRB
#_008A61: STA.w DMA1ADDRB
#_008A64: STA.w DMA2ADDRB
#_008A67: STA.w DMA3ADDRB
#_008A6A: STA.w DMA4ADDRB

#_008A6D: LDY.w $0AC0
#_008A70: STY.w DMA0ADDRL

#_008A73: STX.w DMA0SIZE

#_008A76: LDY.w $0AC4
#_008A79: STY.w DMA1ADDRL

#_008A7C: STX.w DMA1SIZE

#_008A7F: LDY.w $0AC8
#_008A82: STY.w DMA2ADDRL

#_008A85: STX.w DMA2SIZE

#_008A88: LDY.w $0AE0
#_008A8B: STY.w DMA3ADDRL

#_008A8E: LDY.w #$0020
#_008A91: STY.w DMA3SIZE

#_008A94: LDY.w $0AD8
#_008A97: STY.w DMA4ADDRL

#_008A9A: STX.w DMA4SIZE

#_008A9D: LDA.b #$1F
#_008A9F: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008AA2: LDY.w #$4150 ; VRAM $82A0
#_008AA5: STY.w VMADDR

#_008AA8: LDY.w $0AC2
#_008AAB: STY.w DMA0ADDRL

#_008AAE: STX.w DMA0SIZE

#_008AB1: LDY.w $0AC6
#_008AB4: STY.w DMA1ADDRL

#_008AB7: STX.w DMA1SIZE

#_008ABA: LDY.w $0ACA
#_008ABD: STY.w DMA2ADDRL

#_008AC0: STX.w DMA2SIZE

#_008AC3: LDY.w $0AE2
#_008AC6: STY.w DMA3ADDRL

#_008AC9: LDY.w #$0020
#_008ACC: STY.w DMA3SIZE

#_008ACF: LDY.w $0ADA
#_008AD2: STY.w DMA4ADDRL

#_008AD5: STX.w DMA4SIZE

#_008AD8: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008ADB: LDY.w #$4200 ; VRAM $8400
#_008ADE: STY.w VMADDR

#_008AE1: LDY.w $0AEC
#_008AE4: STY.w DMA0ADDRL

#_008AE7: STX.w DMA0SIZE

#_008AEA: LDY.w $0AF0

#_008AED: STY.w DMA1ADDRL
#_008AF0: STX.w DMA1SIZE

#_008AF3: LDY.w #$7EBD40
#_008AF6: STY.w DMA2ADDRL

#_008AF9: STX.w DMA2SIZE

#_008AFC: LDA.b #$07
#_008AFE: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008B01: LDY.w #$4300 ; VRAM $8600
#_008B04: STY.w VMADDR

#_008B07: LDY.w $0AEE
#_008B0A: STY.w DMA0ADDRL

#_008B0D: STX.w DMA0SIZE

#_008B10: LDY.w $0AF2
#_008B13: STY.w DMA1ADDRL

#_008B16: STX.w DMA1SIZE

#_008B19: LDY.w #$7EBD80
#_008B1C: STY.w DMA2ADDRL

#_008B1F: STX.w DMA2SIZE

#_008B22: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008B25: LDA.w $0AF4
#_008B28: BEQ .no_update_swagduck

#_008B2A: LDY.w #$40E0 ; VRAM $81C0
#_008B2D: STY.w VMADDR

#_008B30: LDY.w $0AF6
#_008B33: STY.w DMA0ADDRL

#_008B36: STX.w DMA0SIZE

#_008B39: LDA.b #$01
#_008B3B: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008B3E: LDY.w #$41E0 ; VRAM $83C0
#_008B41: STY.w VMADDR

#_008B44: LDY.w $0AF8
#_008B47: STY.w DMA0ADDRL

#_008B4A: STX.w DMA0SIZE

#_008B4D: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.no_update_swagduck
#_008B50: LDX.w $0ADC
#_008B53: STX.w DMA0ADDRL

#_008B56: LDX.w $0134
#_008B59: STX.w VMADDR

#_008B5C: LDX.w #$0400
#_008B5F: STX.w DMA0SIZE

#_008B62: LDA.b #$01
#_008B64: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_sprite_updates
#_008B67: LDA.b $16
#_008B69: BEQ .skip_BG3

#_008B6B: LDX.w $0219
#_008B6E: STX.w VMADDR

#_008B71: LDX.w #$7EC700>>0
#_008B74: STX.w DMA0ADDRL

#_008B77: LDA.b #$7EC700>>16
#_008B79: STA.w DMA0ADDRB

#_008B7C: LDX.w #$014A
#_008B7F: STX.w DMA0SIZE

#_008B82: LDA.b #$01
#_008B84: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_BG3
#_008B87: LDA.b $15
#_008B89: BEQ .skip_CGRAM

#_008B8B: STZ.w CGADD

#_008B8E: LDY.w #$2200
#_008B91: STY.w DMA1MODE

#_008B94: LDY.w #$7EC500>>0
#_008B97: STY.w DMA1ADDRL

#_008B9A: LDA.b #$7EC500>>16
#_008B9C: STA.w DMA1ADDRB

#_008B9F: LDY.w #$0200
#_008BA2: STY.w DMA1SIZE

#_008BA5: LDA.b #$02
#_008BA7: STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_CGRAM
#_008BAA: REP #$20
#_008BAC: SEP #$10

#_008BAE: STZ.b $15

#_008BB0: STZ.w OAMADDR

#_008BB3: LDA.w #$0400
#_008BB6: STA.w DMA0MODE

#_008BB9: LDA.w #$0800
#_008BBC: STA.w DMA0ADDRL
#_008BBF: STZ.w DMA0ADDRB

#_008BC2: LDA.w #$0220
#_008BC5: STA.w DMA0SIZE

#_008BC8: LDY.b #$01
#_008BCA: STY.w MDMAEN

;---------------------------------------------------------------------------------------------------

#_008BCD: SEP #$30

#_008BCF: LDY.b $14
#_008BD1: BEQ .no_stripes

#_008BD3: LDA.w Stripes14_SourceAddress_low-1,Y
#_008BD6: STA.b $00

#_008BD8: LDA.w Stripes14_SourceAddress_high-1,Y
#_008BDB: STA.b $01

#_008BDD: LDA.w Stripes14_SourceAddress_bank-1,Y
#_008BE0: STA.b $02

#_008BE2: JSR HandleStripes14

#_008BE5: LDA.b $14
#_008BE7: CMP.b #$01
#_008BE9: BNE .leave_stripes_alone

#_008BEB: STZ.w $1000
#_008BEE: STZ.w $1001

.leave_stripes_alone
#_008BF1: STZ.b $14

;---------------------------------------------------------------------------------------------------

.no_stripes
#_008BF3: LDA.b $19
#_008BF5: BEQ .no_incremental_upload

#_008BF7: STA.w VMADDH

#_008BFA: REP #$10

#_008BFC: LDX.w #$0080
#_008BFF: STX.w VMAIN

#_008C02: LDX.w #$1801
#_008C05: STX.w DMA0MODE

#_008C08: LDX.w $0118
#_008C0B: STX.w DMA0ADDRL

#_008C0E: LDA.b #$7F
#_008C10: STA.w DMA0ADDRB

#_008C13: LDX.w #$0200
#_008C16: STX.w DMA0SIZE

#_008C19: LDA.b #$01
#_008C1B: STA.w MDMAEN

#_008C1E: STZ.b $19

#_008C20: SEP #$10

;---------------------------------------------------------------------------------------------------

.no_incremental_upload
#_008C22: LDX.b $18
#_008C24: BEQ .no_arb_dma

#_008C26: STZ.w DMA1ADDRB

#_008C29: REP #$20

#_008C2B: LDA.w #$1801
#_008C2E: STA.w DMA1MODE

#_008C31: REP #$10

#_008C33: LDX.w #$0000

#_008C36: LDA.w $1100,X

.next_chunk
#_008C39: STA.w VMADDR

#_008C3C: TXA
#_008C3D: CLC
#_008C3E: ADC.w #$1104
#_008C41: STA.w DMA1ADDRL

#_008C44: LDA.w $1103,X
#_008C47: AND.w #$00FF
#_008C4A: STA.w DMA1SIZE

#_008C4D: CLC
#_008C4E: ADC.w #$0004
#_008C51: STA.b $00

#_008C53: SEP #$20

#_008C55: LDA.w $1102,X
#_008C58: STA.w VMAIN

#_008C5B: LDA.b #$02
#_008C5D: STA.w MDMAEN

#_008C60: REP #$21

#_008C62: TXA
#_008C63: ADC.b $00
#_008C65: TAX

#_008C66: LDA.w $1100,X
#_008C69: CMP.w #$FFFF
#_008C6C: BNE .next_chunk

#_008C6E: SEP #$30

#_008C70: STZ.b $18
#_008C72: STZ.w $0710

;---------------------------------------------------------------------------------------------------

.no_arb_dma
#_008C75: LDA.b $17
#_008C77: ASL A
#_008C78: TAX

#_008C79: STZ.b $17

#_008C7B: JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
#_008C7E: dw NMI_NoTileUpdates                 ; 0x00
#_008C80: dw NMI_UploadTilemap                 ; 0x01
#_008C82: dw NMI_UploadBG3Text                 ; 0x02
#_008C84: dw NMI_UpdateOWScroll                ; 0x03
#_008C86: dw NMI_UpdateSubscreenOverlay        ; 0x04
#_008C88: dw NMI_UpdateBG1Wall                 ; 0x05
#_008C8A: dw NMI_TilemapNothing                ; 0x06
#_008C8C: dw NMI_UpdateLoadLightWorldMap       ; 0x07
#_008C8E: dw NMI_UpdateBG2Left                 ; 0x08
#_008C90: dw NMI_UpdateBGChar3and4             ; 0x09
#_008C92: dw NMI_UpdateBGChar5and6             ; 0x0A
#_008C94: dw NMI_UpdateBGCharHalf              ; 0x0B
#_008C96: dw NMI_UploadSubscreenOverlayLatter  ; 0x0C
#_008C98: dw NMI_UploadSubscreenOverlayFormer  ; 0x0D
#_008C9A: dw NMI_UpdateBGChar0                 ; 0x0E
#_008C9C: dw NMI_UpdateBGChar1                 ; 0x0F
#_008C9E: dw NMI_UpdateBGChar2                 ; 0x10
#_008CA0: dw NMI_UpdateBGChar3                 ; 0x11
#_008CA2: dw NMI_UpdateObjChar0                ; 0x12
#_008CA4: dw NMI_UpdateObjChar2                ; 0x13
#_008CA6: dw NMI_UpdateObjChar3                ; 0x14
#_008CA8: dw NMI_UploadDarkWorldMap            ; 0x15
#_008CAA: dw NMI_UploadGameOverText            ; 0x16
#_008CAC: dw NMI_UpdatePegTiles                ; 0x17
#_008CAE: dw NMI_UpdateStarTiles               ; 0x18

;===================================================================================================

NMI_UploadTilemap:
#_008CB0: LDX.w $0116

#_008CB3: LDA.w TilemapUpload_HighBytes,X
#_008CB6: STA.w VMADDH

#_008CB9: STZ.w DMA0ADDRB

#_008CBC: REP #$20

#_008CBE: LDA.w #$0080
#_008CC1: STA.w VMAIN

#_008CC4: LDA.w #$1801
#_008CC7: STA.w DMA0MODE

#_008CCA: LDA.w #$7E1000
#_008CCD: STA.w DMA0ADDRL

#_008CD0: LDA.w #$0800
#_008CD3: STA.w DMA0SIZE

#_008CD6: LDY.b #$01
#_008CD8: STY.w MDMAEN

#_008CDB: STZ.w $1000

#_008CDE: SEP #$20

#_008CE0: STZ.w $0710

;===================================================================================================

NMI_NoTileUpdates:
#_008CE3: RTS

;===================================================================================================

NMI_UploadBG3Text:
#_008CE4: REP #$10

#_008CE6: LDA.b #$80
#_008CE8: STA.w VMAIN

#_008CEB: LDX.w #$1801
#_008CEE: STX.w DMA0MODE

#_008CF1: LDY.w #$7C00 ; VRAM $F800
#_008CF4: STY.w VMADDR

#_008CF7: LDY.w #$7F0000
#_008CFA: STY.w DMA0ADDRL

#_008CFD: LDA.b #$7F
#_008CFF: STA.w DMA0ADDRB

#_008D02: LDX.w #$07E0
#_008D05: STX.w DMA0SIZE

#_008D08: LDA.b #$01
#_008D0A: STA.w MDMAEN

#_008D0D: SEP #$10

#_008D0F: STZ.w $0710

#_008D12: RTS

;===================================================================================================

NMI_UpdateOWScroll:
#_008D13: REP #$10

#_008D15: LDX.w #$1801
#_008D18: STX.w DMA0MODE

#_008D1B: STZ.w DMA0ADDRB

#_008D1E: LDA.w $1101
#_008D21: AND.b #$80
#_008D23: ASL A
#_008D24: ROL A
#_008D25: ORA.b #$80
#_008D27: STA.w VMAIN

#_008D2A: REP #$20

#_008D2C: LDA.w $1100
#_008D2F: AND.w #$3FFF
#_008D32: TAX

#_008D33: INC A
#_008D34: INC A
#_008D35: STA.b $02

#_008D37: LDY.w #$0000

.next_transfer
#_008D3A: REP #$21

#_008D3C: LDA.w $1102,Y
#_008D3F: STA.w VMADDR

#_008D42: TYA
#_008D43: ADC.w #$1104
#_008D46: STA.w DMA0ADDRL

#_008D49: TYA
#_008D4A: ADC.b $02
#_008D4C: TAY

#_008D4D: STX.w DMA0SIZE

#_008D50: SEP #$20

#_008D52: LDA.b #$01
#_008D54: STA.w MDMAEN

#_008D57: LDA.w $1103,Y
#_008D5A: BPL .next_transfer

#_008D5C: SEP #$30

#_008D5E: STZ.w $0710

#_008D61: RTS

;===================================================================================================

NMI_UpdateSubscreenOverlay:
#_008D62: LDA.b #$7F
#_008D64: STA.w DMA0ADDRB

#_008D67: LDA.b #$80
#_008D69: STA.w VMAIN

#_008D6C: REP #$31

#_008D6E: LDA.w #$7F2000
#_008D71: STA.w DMA0ADDRL

#_008D74: LDX.w #$0000 ; start at $7F4000
#_008D77: LDA.w #$0080 ; 16 chunks
#_008D7A: BRA NMI_HandleArbitraryTilemap

;===================================================================================================

NMI_UploadSubscreenOverlayFormer:
#_008D7C: LDA.b #$7F
#_008D7E: STA.w DMA0ADDRB

#_008D81: LDA.b #$80
#_008D83: STA.w VMAIN

#_008D86: REP #$31

#_008D88: LDA.w #$7F2000
#_008D8B: STA.w DMA0ADDRL

#_008D8E: LDX.w #$0000 ; start at $7F4000
#_008D91: LDA.w #$0040 ; 8 chunks

#_008D94: BRA NMI_HandleArbitraryTilemap

;===================================================================================================

NMI_UploadSubscreenOverlayLatter:
#_008D96: LDA.b #$7F
#_008D98: STA.w DMA0ADDRB

#_008D9B: LDA.b #$80
#_008D9D: STA.w VMAIN

#_008DA0: REP #$31

#_008DA2: LDA.w #$7F3000
#_008DA5: STA.w DMA0ADDRL

#_008DA8: LDX.w #$0040 ; start at $7F4040
#_008DAB: LDA.w #$0080 ; 16 chunks

;===================================================================================================

NMI_HandleArbitraryTilemap:
#_008DAE: STA.b $02

#_008DB0: LDA.w #$1801
#_008DB3: STA.w DMA0MODE

#_008DB6: LDA.w #$0001
#_008DB9: STA.b $00

#_008DBB: LDY.w #$0080


.next_chunk
#_008DBE: LDA.l $7F4000,X
#_008DC2: STA.w VMADDR

#_008DC5: STY.w DMA0SIZE

#_008DC8: LDA.b $00
#_008DCA: STA.w MDMAEN

#_008DCD: LDA.l $7F4002,X
#_008DD1: STA.w VMADDR

#_008DD4: STY.w DMA0SIZE

#_008DD7: LDA.b $00
#_008DD9: STA.w MDMAEN

#_008DDC: LDA.l $7F4004,X
#_008DE0: STA.w VMADDR

#_008DE3: STY.w DMA0SIZE

#_008DE6: LDA.b $00
#_008DE8: STA.w MDMAEN

#_008DEB: LDA.l $7F4006,X
#_008DEF: STA.w VMADDR

#_008DF2: STY.w DMA0SIZE

#_008DF5: LDA.b $00
#_008DF7: STA.w MDMAEN

#_008DFA: TXA
#_008DFB: ADC.w #$0008
#_008DFE: TAX

#_008DFF: CMP.b $02
#_008E01: BNE .next_chunk

#_008E03: SEP #$30

#_008E05: STZ.w $0710

#_008E08: RTS

;===================================================================================================

NMI_UpdateBG1Wall:
#_008E09: REP #$20

#_008E0B: LDA.w #$1801
#_008E0E: STA.w DMA0MODE

#_008E11: LDA.w $0116
#_008E14: STA.w VMADDR

#_008E17: LDX.b #$81
#_008E19: STX.w VMAIN

#_008E1C: LDX.b #$7EC880>>16
#_008E1E: STX.w DMA0ADDRB

#_008E21: LDA.w #$7EC880>>0
#_008E24: STA.w DMA0ADDRL

#_008E27: LDA.w #$0040
#_008E2A: STA.w DMA0SIZE

#_008E2D: LDY.b #$01
#_008E2F: STY.w MDMAEN

#_008E32: STA.w DMA0SIZE

#_008E35: LDA.w $0116
#_008E38: CLC
#_008E39: ADC.w #$0800
#_008E3C: STA.w VMADDR

#_008E3F: LDA.w #$7EC8C0
#_008E42: STA.w DMA0ADDRL

#_008E45: STY.w MDMAEN

#_008E48: SEP #$20

#_008E4A: RTS

;===================================================================================================

NMI_TilemapNothing:
#_008E4B: RTS

;===================================================================================================

pool NMI_UpdateLoadLightWorldMap

.vram_offset
#_008E4C: dw $0000, $0020, $1000, $1020

pool off

;---------------------------------------------------------------------------------------------------

NMI_UpdateLoadLightWorldMap:
#_008E54: STZ.w VMAIN

#_008E57: LDA.b #WorldMap_LightWorldTilemap>>16
#_008E59: STA.w DMA0ADDRB

#_008E5C: REP #$20

#_008E5E: LDA.w #$1800
#_008E61: STA.w DMA0MODE

#_008E64: STZ.b $04
#_008E66: STZ.b $02

;---------------------------------------------------------------------------------------------------

#_008E68: LDY.b #$01
#_008E6A: LDX.b #$00

.next_quadrant
#_008E6C: LDA.w #$0020
#_008E6F: STA.b $06

#_008E71: LDA.w .vram_offset,X
#_008E74: STA.b $00

.next_row
#_008E76: LDA.b $00
#_008E78: STA.w VMADDR

#_008E7B: CLC
#_008E7C: ADC.w #$0080
#_008E7F: STA.b $00

#_008E81: LDA.b $02
#_008E83: CLC
#_008E84: ADC.w #WorldMap_LightWorldTilemap
#_008E87: STA.w DMA0ADDRL

#_008E8A: LDA.w #$0020
#_008E8D: STA.w DMA0SIZE

#_008E90: STY.w MDMAEN

#_008E93: CLC
#_008E94: ADC.b $02
#_008E96: STA.b $02

#_008E98: DEC.b $06
#_008E9A: BNE .next_row

#_008E9C: INC.b $04
#_008E9E: INC.b $04

#_008EA0: LDX.b $04
#_008EA2: CPX.b #$08
#_008EA4: BNE .next_quadrant

#_008EA6: SEP #$20

#_008EA8: RTS

;===================================================================================================

NMI_UpdateBG2Left:
#_008EA9: LDA.b #$80

#_008EAB: STA.w VMAIN

#_008EAE: REP #$10

#_008EB0: LDY.w #$0000 ; VRAM $0000
#_008EB3: STY.w VMADDR

#_008EB6: LDY.w #$1801
#_008EB9: STY.w DMA1MODE

#_008EBC: LDY.w #$7F0000
#_008EBF: STY.w DMA1ADDRL

#_008EC2: LDA.b #$7F
#_008EC4: STA.w DMA1ADDRB

#_008EC7: LDY.w #$0800
#_008ECA: STY.w DMA1SIZE

#_008ECD: LDA.b #$02
#_008ECF: STA.w MDMAEN

#_008ED2: STY.w DMA1SIZE

#_008ED5: LDY.w #$0800
#_008ED8: STY.w VMADDR

#_008EDB: LDY.w #$7F0800
#_008EDE: STY.w DMA1ADDRL

#_008EE1: STA.w MDMAEN

#_008EE4: SEP #$10

#_008EE6: RTS

;===================================================================================================

NMI_UpdateBGChar3and4:
#_008EE7: REP #$20

#_008EE9: LDA.w #$2C00 ; VRAM $5800
#_008EEC: STA.w VMADDR

#_008EEF: LDY.b #$80
#_008EF1: STY.w VMAIN

#_008EF4: LDA.w #$1801
#_008EF7: STA.w DMA0MODE

#_008EFA: LDA.w #$7F0000
#_008EFD: STA.w DMA0ADDRL

#_008F00: LDY.b #$7F
#_008F02: STY.w DMA0ADDRB

#_008F05: LDA.w #$1000
#_008F08: STA.w DMA0SIZE

#_008F0B: LDY.b #$01
#_008F0D: STY.w MDMAEN

#_008F10: SEP #$20

#_008F12: STZ.w $0710

#_008F15: RTS

;===================================================================================================

NMI_UpdateBGChar5and6:
#_008F16: REP #$20

#_008F18: LDA.w #$3400 ; VRAM $6800
#_008F1B: STA.w VMADDR

#_008F1E: LDY.b #$80
#_008F20: STY.w VMAIN

#_008F23: LDA.w #$1801
#_008F26: STA.w DMA0MODE

#_008F29: LDA.w #$7F1000
#_008F2C: STA.w DMA0ADDRL

#_008F2F: LDY.b #$7F
#_008F31: STY.w DMA0ADDRB

#_008F34: LDA.w #$1000
#_008F37: STA.w DMA0SIZE

#_008F3A: LDY.b #$01
#_008F3C: STY.w MDMAEN

#_008F3F: SEP #$20

#_008F41: STZ.w $0710

#_008F44: RTS

;===================================================================================================

NMI_UpdateBGCharHalf:
#_008F45: LDA.w $0116
#_008F48: STA.w VMADDH

#_008F4B: REP #$10

#_008F4D: LDX.w #$0080
#_008F50: STX.w VMAIN

#_008F53: LDX.w #$1801
#_008F56: STX.w DMA0MODE

#_008F59: LDX.w #$7F1000
#_008F5C: STX.w DMA0ADDRL

#_008F5F: LDA.b #$7F
#_008F61: STA.w DMA0ADDRB

#_008F64: LDX.w #$0400
#_008F67: STX.w DMA0SIZE

#_008F6A: LDA.b #$01
#_008F6C: STA.w MDMAEN

#_008F6F: SEP #$10

#_008F71: RTS

;===================================================================================================

NMI_UpdateBGChar0:
#_008F72: REP #$20

#_008F74: LDA.w #$2000 ; VRAM $4000
#_008F77: BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar1:
#_008F79: REP #$20

#_008F7B: LDA.w #$2800 ; VRAM $5000
#_008F7E: BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar2:
#_008F80: REP #$20

#_008F82: LDA.w #$3000 ; VRAM $6000
#_008F85: BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar3:
#_008F87: REP #$20

#_008F89: LDA.w #$3800 ; VRAM $7000
#_008F8C: BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateObjChar0:
#_008F8E: REP #$20

#_008F90: LDA.w #$4400 ; VRAM $8800
#_008F93: STA.w VMADDR

#_008F96: LDA.w #$7F0000
#_008F99: STA.w DMA0ADDRL

#_008F9C: LDY.b #$80
#_008F9E: STY.w VMAIN

#_008FA1: LDA.w #$1801
#_008FA4: STA.w DMA0MODE

#_008FA7: LDY.b #$7F
#_008FA9: STY.w DMA0ADDRB

#_008FAC: LDA.w #$0800
#_008FAF: STA.w DMA0SIZE

#_008FB2: LDY.b #$01
#_008FB4: STY.w MDMAEN

#_008FB7: SEP #$20

#_008FB9: STZ.w $0710

#_008FBC: RTS

;===================================================================================================

NMI_UpdateObjChar2:
#_008FBD: REP #$20

#_008FBF: LDA.w #$5000 ; VRAM $A000

#_008FC2: BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateObjChar3:
#_008FC4: REP #$20

#_008FC6: LDA.w #$5800 ; VRAM $B000

;===================================================================================================

NMI_RunTilemapUpdateDMA:
#_008FC9: STA.w VMADDR

#_008FCC: LDA.w #$7F0000
#_008FCF: STA.w DMA0ADDRL

#_008FD2: LDY.b #$80
#_008FD4: STY.w VMAIN

#_008FD7: LDA.w #$1801
#_008FDA: STA.w DMA0MODE

#_008FDD: LDY.b #$7F
#_008FDF: STY.w DMA0ADDRB

#_008FE2: LDA.w #$1000
#_008FE5: STA.w DMA0SIZE

#_008FE8: LDY.b #$01
#_008FEA: STY.w MDMAEN

#_008FED: SEP #$20

#_008FEF: STZ.w $0710

#_008FF2: RTS

;===================================================================================================

NMI_UploadDarkWorldMap:
#_008FF3: STZ.w VMAIN

#_008FF6: STZ.w DMA0ADDRB

#_008FF9: REP #$20

#_008FFB: LDA.w #$1800
#_008FFE: STA.w DMA0MODE

#_009001: STZ.b $02

#_009003: LDA.w #$0020
#_009006: STA.b $06

#_009008: LDA.w #$0810 ; VRAM $1020
#_00900B: STA.b $00

#_00900D: LDY.b #$01

;---------------------------------------------------------------------------------------------------

.next_row
#_00900F: LDA.b $00
#_009011: STA.w VMADDR

#_009014: CLC
#_009015: ADC.w #$0080 ; VRAM +$0100
#_009018: STA.b $00

#_00901A: LDA.b $02
#_00901C: CLC
#_00901D: ADC.w #$1000
#_009020: STA.w DMA0ADDRL

#_009023: LDA.w #$0020
#_009026: STA.w DMA0SIZE

#_009029: STY.w MDMAEN

#_00902C: CLC
#_00902D: ADC.b $02
#_00902F: STA.b $02

#_009031: DEC.b $06
#_009033: BNE .next_row

#_009035: SEP #$20

#_009037: RTS

;===================================================================================================

NMI_UploadGameOverText:
#_009038: REP #$20

#_00903A: LDA.w #$7800 ; VRAM $F000
#_00903D: STA.w VMADDR

#_009040: LDA.w #$7E2000
#_009043: STA.w DMA0ADDRL

#_009046: LDY.b #$80
#_009048: STY.w VMAIN

#_00904B: LDA.w #$1801
#_00904E: STA.w DMA0MODE

#_009051: LDY.b #$7E
#_009053: STY.w DMA0ADDRB

#_009056: LDA.w #$0800
#_009059: STA.w DMA0SIZE

#_00905C: LDY.b #$01
#_00905E: STY.w MDMAEN

#_009061: LDA.w #$7D00 ; VRAM $FA00
#_009064: STA.w VMADDR

#_009067: LDA.w #$7E3400
#_00906A: STA.w DMA0ADDRL

#_00906D: LDY.b #$80
#_00906F: STY.w VMAIN

#_009072: LDA.w #$1801
#_009075: STA.w DMA0MODE

#_009078: LDY.b #$7E
#_00907A: STY.w DMA0ADDRB

#_00907D: LDA.w #$0600
#_009080: STA.w DMA0SIZE

#_009083: LDY.b #$01
#_009085: STY.w MDMAEN

#_009088: SEP #$20

#_00908A: RTS

;===================================================================================================

NMI_UpdatePegTiles:
#_00908B: REP #$10

#_00908D: LDX.w #$3D00 ; VRAM $7A00
#_009090: STX.w VMADDR

#_009093: LDA.b #$80
#_009095: STA.w VMAIN

#_009098: LDX.w #$1801
#_00909B: STX.w DMA0MODE

#_00909E: LDX.w #$7F0000
#_0090A1: STX.w DMA0ADDRL

#_0090A4: LDA.b #$7F
#_0090A6: STA.w DMA0ADDRB

#_0090A9: LDX.w #$0100
#_0090AC: STX.w DMA0SIZE

#_0090AF: LDA.b #$01
#_0090B1: STA.w MDMAEN

#_0090B4: SEP #$10

#_0090B6: RTS

;===================================================================================================

NMI_UpdateStarTiles:
#_0090B7: REP #$10

#_0090B9: LDX.w #$3ED0 ; VRAM $7DA0
#_0090BC: STX.w VMADDR

#_0090BF: LDA.b #$80
#_0090C1: STA.w VMAIN

#_0090C4: LDX.w #$1801
#_0090C7: STX.w DMA0MODE

#_0090CA: LDX.w #$7F0000
#_0090CD: STX.w DMA0ADDRL

#_0090D0: LDA.b #$7F
#_0090D2: STA.w DMA0ADDRB

#_0090D5: LDX.w #$0040
#_0090D8: STX.w DMA0SIZE

#_0090DB: LDA.b #$01
#_0090DD: STA.w MDMAEN

#_0090E0: SEP #$10

#_0090E2: RTS

;===================================================================================================

NMI_UploadTilemap_long:
#_0090E3: JSR NMI_UploadTilemap

#_0090E6: RTL

;===================================================================================================

NMI_UpdateOWScroll_long:
#_0090E7: JSR NMI_UpdateOWScroll

#_0090EA: RTL

;===================================================================================================

UNREACHABLE_0090EB:
#_0090EB: STA.b $14

#_0090ED: TAY

#_0090EE: LDA.w Stripes14_SourceAddress_low-1,Y
#_0090F1: STA.b $00

#_0090F3: LDA.w Stripes14_SourceAddress_high-1,Y
#_0090F6: STA.b $01

#_0090F8: LDA.w Stripes14_SourceAddress_bank-1,Y
#_0090FB: STA.b $02

#_0090FD: JSR HandleStripes14

#_009100: LDA.b $14
#_009102: CMP.b #$01
#_009104: BNE .dont_clear

#_009106: STZ.w $1000
#_009109: STZ.w $1001

.dont_clear
#_00910C: STZ.b $14

#_00910E: RTL

;===================================================================================================

UnderworldTilemapQuadrantOffset:
#_00910F: dw $0000, $1000, $0000, $0040
#_009117: dw $0040, $1040, $1000, $1040
#_00911F: dw $1000, $0000, $0040, $0000
#_009127: dw $1040, $0040, $1040, $1000

;---------------------------------------------------------------------------------------------------

UnderworldTilemapQuadrantVRAMIndex:
#_00912F: db $01, $05, $09, $0D
#_009133: db $02, $06, $0A, $0E
#_009137: db $03, $07, $0B, $0F
#_00913B: db $04, $08, $0C, $10

;---------------------------------------------------------------------------------------------------

Underworld_PrepareNextRoomQuadrantUpload:
#_00913F: REP #$31

#_009141: LDA.w $0418
#_009144: AND.w #$000F
#_009147: ADC.w $045C
#_00914A: PHA

#_00914B: ASL A
#_00914C: TAY

#_00914D: LDX.w UnderworldTilemapQuadrantOffset,Y

;---------------------------------------------------------------------------------------------------

#_009150: LDY.w #$0000

.next
#_009153: LDA.l $7E2000,X
#_009157: STA.w $1000,Y

#_00915A: LDA.l $7E2002,X
#_00915E: STA.w $1002,Y

#_009161: LDA.l $7E2080,X
#_009165: STA.w $1040,Y

#_009168: LDA.l $7E2082,X
#_00916C: STA.w $1042,Y

#_00916F: LDA.l $7E2100,X
#_009173: STA.w $1080,Y

#_009176: LDA.l $7E2102,X
#_00917A: STA.w $1082,Y

#_00917D: LDA.l $7E2180,X
#_009181: STA.w $10C0,Y

#_009184: LDA.l $7E2182,X
#_009188: STA.w $10C2,Y

#_00918B: INX
#_00918C: INX
#_00918D: INX
#_00918E: INX

#_00918F: INY
#_009190: INY
#_009191: INY
#_009192: INY

#_009193: TYA
#_009194: AND.w #$003F
#_009197: BNE .next

;---------------------------------------------------------------------------------------------------

#_009199: TYA
#_00919A: CLC
#_00919B: ADC.w #$00C0
#_00919E: TAY

#_00919F: TXA
#_0091A0: CLC
#_0091A1: ADC.w #$01C0
#_0091A4: TAX

#_0091A5: CPY.w #$0800
#_0091A8: BNE .next

#_0091AA: PLX

#_0091AB: SEP #$30

#_0091AD: LDA.w $045C
#_0091B0: CLC
#_0091B1: ADC.b #$04
#_0091B3: STA.w $045C

#_0091B6: LDA.w UnderworldTilemapQuadrantVRAMIndex,X
#_0091B9: STA.w $0116

#_0091BC: LDA.b #$01
#_0091BE: STA.b $17
#_0091C0: STA.w $0710

#_0091C3: RTL

;===================================================================================================

WaterFlood_BuildOneQuadrantForVRAM:
#_0091C4: LDA.b $AE
#_0091C6: CMP.b #$19
#_0091C8: BNE TilemapPrep_NotWaterOnTag

#_0091CA: LDA.w $0405
#_0091CD: AND.l DungeonMask+1
#_0091D1: BEQ WaterFlood_BuildOneQuadrantForVRAM_not_triggered

;===================================================================================================

TilemapPrep_NotWaterOnTag:
#_0091D3: REP #$31

#_0091D5: LDA.w $0418
#_0091D8: AND.w #$000F
#_0091DB: ADC.w $045C
#_0091DE: PHA

#_0091DF: ASL A
#_0091E0: TAY

#_0091E1: LDX.w UnderworldTilemapQuadrantOffset,Y

;---------------------------------------------------------------------------------------------------

#_0091E4: LDY.w #$0000

.next
#_0091E7: LDA.l $7E4000,X
#_0091EB: STA.w $1000,Y

#_0091EE: LDA.l $7E4002,X
#_0091F2: STA.w $1002,Y

#_0091F5: LDA.l $7E4080,X
#_0091F9: STA.w $1040,Y

#_0091FC: LDA.l $7E4082,X
#_009200: STA.w $1042,Y

#_009203: LDA.l $7E4100,X
#_009207: STA.w $1080,Y

#_00920A: LDA.l $7E4102,X
#_00920E: STA.w $1082,Y

#_009211: LDA.l $7E4180,X
#_009215: STA.w $10C0,Y

#_009218: LDA.l $7E4182,X
#_00921C: STA.w $10C2,Y

#_00921F: INX
#_009220: INX
#_009221: INX
#_009222: INX

#_009223: INY
#_009224: INY
#_009225: INY
#_009226: INY

#_009227: TYA
#_009228: AND.w #$003F
#_00922B: BNE .next

#_00922D: TYA
#_00922E: CLC
#_00922F: ADC.w #$00C0
#_009232: TAY

#_009233: TXA
#_009234: CLC
#_009235: ADC.w #$01C0
#_009238: TAX

#_009239: CPY.w #$0800
#_00923C: BNE .next

;---------------------------------------------------------------------------------------------------

#_00923E: PLX

#_00923F: SEP #$30

#_009241: LDA.w UnderworldTilemapQuadrantVRAMIndex,X
#_009244: CLC
#_009245: ADC.b #$10
#_009247: STA.w $0116

#_00924A: LDA.b #$01
#_00924C: STA.b $17
#_00924E: STA.w $0710

#_009251: RTL

;===================================================================================================

WaterFlood_BuildOneQuadrantForVRAM_not_triggered:
#_009252: REP #$31

#_009254: LDX.w #$00F0

#_009257: LDY.w #$0000

.next
#_00925A: LDA.w RoomDrawObjectData,X
#_00925D: STA.w $1000,Y
#_009260: STA.w $1002,Y
#_009263: STA.w $1040,Y
#_009266: STA.w $1042,Y
#_009269: STA.w $1080,Y
#_00926C: STA.w $1082,Y
#_00926F: STA.w $10C0,Y
#_009272: STA.w $10C2,Y

#_009275: INY
#_009276: INY
#_009277: INY
#_009278: INY

#_009279: TYA
#_00927A: AND.w #$003F
#_00927D: BNE .next

#_00927F: TYA
#_009280: CLC
#_009281: ADC.w #$00C0
#_009284: TAY

#_009285: CPY.w #$0800
#_009288: BNE .next

;---------------------------------------------------------------------------------------------------

#_00928A: LDA.w $0418
#_00928D: AND.w #$000F
#_009290: CLC
#_009291: ADC.w $045C
#_009294: TAX

#_009295: SEP #$30

#_009297: LDA.w UnderworldTilemapQuadrantVRAMIndex,X
#_00929A: CLC
#_00929B: ADC.b #$10
#_00929D: STA.w $0116

#_0092A0: RTL


;===================================================================================================

HandleStripes14:
#_0092A1: REP #$10

#_0092A3: STA.w DMA1ADDRB

#_0092A6: STZ.b $06

#_0092A8: LDY.w #$0000

#_0092AB: LDA.b [$00],Y
#_0092AD: BPL .next_stripe

#_0092AF: SEP #$30

#_0092B1: RTS

;---------------------------------------------------------------------------------------------------

.next_stripe
#_0092B2: STA.b $04 ; save high byte of VRAM address

#_0092B4: INY

#_0092B5: LDA.b [$00],Y ; save low byte of VRAM address
#_0092B7: STA.b $03

#_0092B9: INY

#_0092BA: LDA.b [$00],Y ; get 0 or 1 for VMAIN from bit 7
#_0092BC: AND.b #$80
#_0092BE: ASL A
#_0092BF: ROL A
#_0092C0: STA.b $07

#_0092C2: LDA.b [$00],Y ; 0x08 or 0x00 for fixed transfer
#_0092C4: AND.b #$40
#_0092C6: STA.b $05

#_0092C8: LSR A
#_0092C9: LSR A
#_0092CA: LSR A
#_0092CB: ORA.b #$01 ; and set DMA write to mode 1
#_0092CD: STA.w DMA1MODE

#_0092D0: LDA.b #VMDATAL
#_0092D2: STA.w DMA1PORT

#_0092D5: REP #$20

#_0092D7: LDA.b $03
#_0092D9: STA.w VMADDR

#_0092DC: LDA.b [$00],Y ; get size
#_0092DE: XBA
#_0092DF: AND.w #$3FFF ; remove the flags
#_0092E2: TAX

#_0092E3: INX ; +1 to account for size
#_0092E4: STX.w DMA1SIZE

#_0092E7: INY ; get our source address based on our current spot
#_0092E8: INY

#_0092E9: TYA
#_0092EA: CLC
#_0092EB: ADC.b $00 ; move it ahead
#_0092ED: STA.w DMA1ADDRL

#_0092F0: LDA.b $05
#_0092F2: BEQ .not_fixed_transfer

#_0092F4: INX ; move X to the next address

#_0092F5: TXA
#_0092F6: LSR A ; and divide it by 2
#_0092F7: TAX

#_0092F8: STX.w DMA1SIZE ; this is the new DMA size

#_0092FB: SEP #$20

#_0092FD: LDA.b $05 ; sets DMA mode to 0 and uses fixed write
#_0092FF: LSR A ; although, you could have just done LDA.b #$08
#_009300: LSR A
#_009301: LSR A
#_009302: STA.w DMA1MODE

#_009305: LDA.b $07 ; tell VMAIN to increment by 0x32 on $2118 writes
#_009307: STA.w VMAIN

#_00930A: LDA.b #$02 ; enable DMA channel for stripe
#_00930C: STA.w MDMAEN

#_00930F: LDA.b #VMDATAH ; swap to the other port
#_009311: STA.w DMA1PORT

#_009314: REP #$21 ; repoint our source address to the high byte

#_009316: TYA
#_009317: ADC.b $00
#_009319: INC A
#_00931A: STA.w DMA1ADDRL

#_00931D: LDA.b $03 ; restore the old vram address
#_00931F: STA.w VMADDR

#_009322: STX.w DMA1SIZE ; same DMA size

#_009325: LDX.w #$0002 ; use 2 bytes for size to find next stripe

.not_fixed_transfer
#_009328: STX.b $03 ; save last stripe's data size

#_00932A: TYA ; add it to our index to get the next stripe
#_00932B: CLC
#_00932C: ADC.b $03
#_00932E: TAY

#_00932F: SEP #$20

#_009331: LDA.b $07 ; set VMAIN increment based on earlier calculations
#_009333: ORA.b #$80 ; make it increment on writes to $2119
#_009335: STA.w VMAIN

#_009338: LDA.b #$02 ; enable DMA channel for stripe
#_00933A: STA.w MDMAEN

#_00933D: LDA.b [$00],Y
#_00933F: BMI .done

#_009341: JMP.w .next_stripe

;---------------------------------------------------------------------------------------------------

.done
#_009344: SEP #$30

#_009346: RTS

;===================================================================================================

NMI_UpdateIRQGFX:
#_009347: LDA.w $1F0C
#_00934A: BEQ .exit

#_00934C: LDA.b #$80
#_00934E: STA.w VMAIN

#_009351: REP #$20

#_009353: LDA.w #$5800 ; VRAM $B000
#_009356: STA.w VMADDR

#_009359: LDA.w #$1801
#_00935C: STA.w DMA0MODE

#_00935F: LDA.w #$7EE800>>0
#_009362: STA.w DMA0ADDRL

#_009365: LDX.b #$7EE800>>16
#_009367: STX.w DMA0ADDRB

#_00936A: LDA.w #$0800
#_00936D: STA.w DMA0SIZE

#_009370: SEP #$20

#_009372: LDA.b #$01
#_009374: STA.w MDMAEN

#_009377: STZ.w $1F0C

.exit
#_00937A: RTS

;===================================================================================================

Stripes14_SourceAddress:

.low
#_00937B: db $001002>>0
#_00937C: db $001000>>0
#_00937D: db IntroLogoTilemap>>0
#_00937E: db $00021B>>0
#_00937F: db NamePlayerTilemap>>0
#_009380: db FileSelectTilemap>>0
#_009381: db FileSelectCopyFileTilemap>>0
#_009382: db FileSelectKILLFileTilemap>>0
#_009383: db DungeonMap_BG3Tilemap>>0

.high
#_009384: db $001002>>8
#_009385: db $001000>>8
#_009386: db IntroLogoTilemap>>8
#_009387: db $00021B>>8
#_009388: db NamePlayerTilemap>>8
#_009389: db FileSelectTilemap>>8
#_00938A: db FileSelectCopyFileTilemap>>8
#_00938B: db FileSelectKILLFileTilemap>>8
#_00938C: db DungeonMap_BG3Tilemap>>8

.bank
#_00938D: db $001002>>16
#_00938E: db $001000>>16
#_00938F: db IntroLogoTilemap>>16
#_009390: db $00021B>>16
#_009391: db NamePlayerTilemap>>16
#_009392: db FileSelectTilemap>>16
#_009393: db FileSelectCopyFileTilemap>>16
#_009394: db FileSelectKILLFileTilemap>>16
#_009395: db DungeonMap_BG3Tilemap>>16

;===================================================================================================

LinkOAM_HeadAddresses:
#_009396: dw LinkGraphics+$0080 ; 0x000 - $108080
#_009398: dw LinkGraphics+$0080 ; 0x001 - $108080
#_00939A: dw LinkGraphics+$0080 ; 0x002 - $108080
#_00939C: dw LinkGraphics+$0080 ; 0x003 - $108080
#_00939E: dw LinkGraphics+$0080 ; 0x004 - $108080
#_0093A0: dw LinkGraphics+$0040 ; 0x005 - $108040
#_0093A2: dw LinkGraphics+$0040 ; 0x006 - $108040
#_0093A4: dw LinkGraphics+$0040 ; 0x007 - $108040
#_0093A6: dw LinkGraphics+$0040 ; 0x008 - $108040
#_0093A8: dw LinkGraphics+$0040 ; 0x009 - $108040
#_0093AA: dw LinkGraphics+$0000 ; 0x00A - $108000
#_0093AC: dw LinkGraphics+$0000 ; 0x00B - $108000
#_0093AE: dw LinkGraphics+$0000 ; 0x00C - $108000
#_0093B0: dw LinkGraphics+$0000 ; 0x00D - $108000
#_0093B2: dw LinkGraphics+$0000 ; 0x00E - $108000
#_0093B4: dw LinkGraphics+$0000 ; 0x00F - $108000
#_0093B6: dw LinkGraphics+$1440 ; 0x010 - $109440
#_0093B8: dw LinkGraphics+$0080 ; 0x011 - $108080
#_0093BA: dw LinkGraphics+$0080 ; 0x012 - $108080
#_0093BC: dw LinkGraphics+$0080 ; 0x013 - $108080
#_0093BE: dw LinkGraphics+$1400 ; 0x014 - $109400
#_0093C0: dw LinkGraphics+$0040 ; 0x015 - $108040
#_0093C2: dw LinkGraphics+$00C0 ; 0x016 - $1080C0
#_0093C4: dw LinkGraphics+$00C0 ; 0x017 - $1080C0
#_0093C6: dw LinkGraphics+$0000 ; 0x018 - $108000
#_0093C8: dw LinkGraphics+$0000 ; 0x019 - $108000
#_0093CA: dw LinkGraphics+$0000 ; 0x01A - $108000
#_0093CC: dw LinkGraphics+$0000 ; 0x01B - $108000
#_0093CE: dw LinkGraphics+$0000 ; 0x01C - $108000
#_0093D0: dw LinkGraphics+$0000 ; 0x01D - $108000
#_0093D2: dw LinkGraphics+$0000 ; 0x01E - $108000
#_0093D4: dw LinkGraphics+$0000 ; 0x01F - $108000
#_0093D6: dw LinkGraphics+$0080 ; 0x020 - $108080
#_0093D8: dw LinkGraphics+$0080 ; 0x021 - $108080
#_0093DA: dw LinkGraphics+$0080 ; 0x022 - $108080
#_0093DC: dw LinkGraphics+$0080 ; 0x023 - $108080
#_0093DE: dw LinkGraphics+$0080 ; 0x024 - $108080
#_0093E0: dw LinkGraphics+$0040 ; 0x025 - $108040
#_0093E2: dw LinkGraphics+$0040 ; 0x026 - $108040
#_0093E4: dw LinkGraphics+$0040 ; 0x027 - $108040
#_0093E6: dw LinkGraphics+$0040 ; 0x028 - $108040
#_0093E8: dw LinkGraphics+$0040 ; 0x029 - $108040
#_0093EA: dw LinkGraphics+$0000 ; 0x02A - $108000
#_0093EC: dw LinkGraphics+$28C0 ; 0x02B - $10A8C0
#_0093EE: dw LinkGraphics+$2900 ; 0x02C - $10A900
#_0093F0: dw LinkGraphics+$0000 ; 0x02D - $108000
#_0093F2: dw LinkGraphics+$28C0 ; 0x02E - $10A8C0
#_0093F4: dw LinkGraphics+$2900 ; 0x02F - $10A900
#_0093F6: dw LinkGraphics+$1100 ; 0x030 - $109100
#_0093F8: dw LinkGraphics+$0080 ; 0x031 - $108080
#_0093FA: dw LinkGraphics+$0080 ; 0x032 - $108080
#_0093FC: dw LinkGraphics+$10C0 ; 0x033 - $1090C0
#_0093FE: dw LinkGraphics+$0040 ; 0x034 - $108040
#_009400: dw LinkGraphics+$0000 ; 0x035 - $108000
#_009402: dw LinkGraphics+$0000 ; 0x036 - $108000
#_009404: dw LinkGraphics+$0000 ; 0x037 - $108000
#_009406: dw LinkGraphics+$0000 ; 0x038 - $108000
#_009408: dw LinkGraphics+$0000 ; 0x039 - $108000
#_00940A: dw LinkGraphics+$0000 ; 0x03A - $108000
#_00940C: dw LinkGraphics+$1A00 ; 0x03B - $109A00
#_00940E: dw LinkGraphics+$1140 ; 0x03C - $109140
#_009410: dw LinkGraphics+$1180 ; 0x03D - $109180
#_009412: dw LinkGraphics+$0000 ; 0x03E - $108000
#_009414: dw LinkGraphics+$1500 ; 0x03F - $109500
#_009416: dw LinkGraphics+$1480 ; 0x040 - $109480
#_009418: dw LinkGraphics+$14C0 ; 0x041 - $1094C0
#_00941A: dw LinkGraphics+$14C0 ; 0x042 - $1094C0
#_00941C: dw LinkGraphics+$1AE0 ; 0x043 - $109AE0
#_00941E: dw LinkGraphics+$0080 ; 0x044 - $108080
#_009420: dw LinkGraphics+$0080 ; 0x045 - $108080
#_009422: dw LinkGraphics+$1A60 ; 0x046 - $109A60
#_009424: dw LinkGraphics+$00C0 ; 0x047 - $1080C0
#_009426: dw LinkGraphics+$00C0 ; 0x048 - $1080C0
#_009428: dw LinkGraphics+$1AA0 ; 0x049 - $109AA0
#_00942A: dw LinkGraphics+$0000 ; 0x04A - $108000
#_00942C: dw LinkGraphics+$0000 ; 0x04B - $108000
#_00942E: dw LinkGraphics+$1AA0 ; 0x04C - $109AA0
#_009430: dw LinkGraphics+$0000 ; 0x04D - $108000
#_009432: dw LinkGraphics+$0000 ; 0x04E - $108000
#_009434: dw LinkGraphics+$0080 ; 0x04F - $108080
#_009436: dw LinkGraphics+$0080 ; 0x050 - $108080
#_009438: dw LinkGraphics+$0100 ; 0x051 - $108100
#_00943A: dw LinkGraphics+$0100 ; 0x052 - $108100
#_00943C: dw LinkGraphics+$05C0 ; 0x053 - $1085C0
#_00943E: dw LinkGraphics+$0000 ; 0x054 - $108000
#_009440: dw LinkGraphics+$0000 ; 0x055 - $108000
#_009442: dw LinkGraphics+$05C0 ; 0x056 - $1085C0
#_009444: dw LinkGraphics+$0000 ; 0x057 - $108000
#_009446: dw LinkGraphics+$0000 ; 0x058 - $108000
#_009448: dw LinkGraphics+$2DC0 ; 0x059 - $10ADC0
#_00944A: dw LinkGraphics+$2DC0 ; 0x05A - $10ADC0
#_00944C: dw LinkGraphics+$2DC0 ; 0x05B - $10ADC0
#_00944E: dw LinkGraphics+$2DC0 ; 0x05C - $10ADC0
#_009450: dw LinkGraphics+$2DC0 ; 0x05D - $10ADC0
#_009452: dw LinkGraphics+$2D40 ; 0x05E - $10AD40
#_009454: dw LinkGraphics+$2D40 ; 0x05F - $10AD40
#_009456: dw LinkGraphics+$2D40 ; 0x060 - $10AD40
#_009458: dw LinkGraphics+$2D40 ; 0x061 - $10AD40
#_00945A: dw LinkGraphics+$2D40 ; 0x062 - $10AD40
#_00945C: dw LinkGraphics+$2D80 ; 0x063 - $10AD80
#_00945E: dw LinkGraphics+$2D80 ; 0x064 - $10AD80
#_009460: dw LinkGraphics+$2D80 ; 0x065 - $10AD80
#_009462: dw LinkGraphics+$2D80 ; 0x066 - $10AD80
#_009464: dw LinkGraphics+$2D80 ; 0x067 - $10AD80
#_009466: dw LinkGraphics+$2D80 ; 0x068 - $10AD80
#_009468: dw LinkGraphics+$0040 ; 0x069 - $108040
#_00946A: dw LinkGraphics+$1400 ; 0x06A - $109400
#_00946C: dw LinkGraphics+$0040 ; 0x06B - $108040
#_00946E: dw LinkGraphics+$0000 ; 0x06C - $108000
#_009470: dw LinkGraphics+$0080 ; 0x06D - $108080
#_009472: dw LinkGraphics+$0080 ; 0x06E - $108080
#_009474: dw LinkGraphics+$1440 ; 0x06F - $109440
#_009476: dw LinkGraphics+$0000 ; 0x070 - $108000
#_009478: dw LinkGraphics+$0000 ; 0x071 - $108000
#_00947A: dw LinkGraphics+$0000 ; 0x072 - $108000
#_00947C: dw LinkGraphics+$0000 ; 0x073 - $108000
#_00947E: dw LinkGraphics+$0080 ; 0x074 - $108080
#_009480: dw LinkGraphics+$0040 ; 0x075 - $108040
#_009482: dw LinkGraphics+$0040 ; 0x076 - $108040
#_009484: dw LinkGraphics+$0000 ; 0x077 - $108000
#_009486: dw LinkGraphics+$0000 ; 0x078 - $108000
#_009488: dw LinkGraphics+$0000 ; 0x079 - $108000
#_00948A: dw LinkGraphics+$0000 ; 0x07A - $108000
#_00948C: dw LinkGraphics+$0000 ; 0x07B - $108000
#_00948E: dw LinkGraphics+$0000 ; 0x07C - $108000
#_009490: dw LinkGraphics+$4440 ; 0x07D - $10C440
#_009492: dw LinkGraphics+$0140 ; 0x07E - $108140
#_009494: dw LinkGraphics+$0140 ; 0x07F - $108140
#_009496: dw LinkGraphics+$4A40 ; 0x080 - $10CA40
#_009498: dw LinkGraphics+$0000 ; 0x081 - $108000
#_00949A: dw LinkGraphics+$0000 ; 0x082 - $108000
#_00949C: dw LinkGraphics+$0000 ; 0x083 - $108000
#_00949E: dw LinkGraphics+$0000 ; 0x084 - $108000
#_0094A0: dw LinkGraphics+$0000 ; 0x085 - $108000
#_0094A2: dw LinkGraphics+$0000 ; 0x086 - $108000
#_0094A4: dw LinkGraphics+$0040 ; 0x087 - $108040
#_0094A6: dw LinkGraphics+$05C0 ; 0x088 - $1085C0
#_0094A8: dw LinkGraphics+$0040 ; 0x089 - $108040
#_0094AA: dw LinkGraphics+$05C0 ; 0x08A - $1085C0
#_0094AC: dw LinkGraphics+$0100 ; 0x08B - $108100
#_0094AE: dw LinkGraphics+$00C0 ; 0x08C - $1080C0
#_0094B0: dw LinkGraphics+$11C0 ; 0x08D - $1091C0
#_0094B2: dw LinkGraphics+$0080 ; 0x08E - $108080
#_0094B4: dw LinkGraphics+$0080 ; 0x08F - $108080
#_0094B6: dw LinkGraphics+$0040 ; 0x090 - $108040
#_0094B8: dw LinkGraphics+$0040 ; 0x091 - $108040
#_0094BA: dw LinkGraphics+$0000 ; 0x092 - $108000
#_0094BC: dw LinkGraphics+$0000 ; 0x093 - $108000
#_0094BE: dw LinkGraphics+$0000 ; 0x094 - $108000
#_0094C0: dw LinkGraphics+$0000 ; 0x095 - $108000
#_0094C2: dw LinkGraphics+$0080 ; 0x096 - $108080
#_0094C4: dw LinkGraphics+$0080 ; 0x097 - $108080
#_0094C6: dw LinkGraphics+$1100 ; 0x098 - $109100
#_0094C8: dw LinkGraphics+$20C0 ; 0x099 - $10A0C0
#_0094CA: dw LinkGraphics+$2100 ; 0x09A - $10A100
#_0094CC: dw LinkGraphics+$2100 ; 0x09B - $10A100
#_0094CE: dw LinkGraphics+$21C0 ; 0x09C - $10A1C0
#_0094D0: dw LinkGraphics+$2400 ; 0x09D - $10A400
#_0094D2: dw LinkGraphics+$2440 ; 0x09E - $10A440
#_0094D4: dw LinkGraphics+$21C0 ; 0x09F - $10A1C0
#_0094D6: dw LinkGraphics+$2400 ; 0x0A0 - $10A400
#_0094D8: dw LinkGraphics+$2440 ; 0x0A1 - $10A440
#_0094DA: dw LinkGraphics+$0080 ; 0x0A2 - $108080
#_0094DC: dw LinkGraphics+$4480 ; 0x0A3 - $10C480
#_0094DE: dw LinkGraphics+$0080 ; 0x0A4 - $108080
#_0094E0: dw LinkGraphics+$0040 ; 0x0A5 - $108040
#_0094E2: dw LinkGraphics+$0040 ; 0x0A6 - $108040
#_0094E4: dw LinkGraphics+$4A80 ; 0x0A7 - $10CA80
#_0094E6: dw LinkGraphics+$4A80 ; 0x0A8 - $10CA80
#_0094E8: dw LinkGraphics+$4A00 ; 0x0A9 - $10CA00
#_0094EA: dw LinkGraphics+$4400 ; 0x0AA - $10C400
#_0094EC: dw LinkGraphics+$4A00 ; 0x0AB - $10CA00
#_0094EE: dw LinkGraphics+$4400 ; 0x0AC - $10C400
#_0094F0: dw LinkGraphics+$01C0 ; 0x0AD - $1081C0
#_0094F2: dw LinkGraphics+$0080 ; 0x0AE - $108080
#_0094F4: dw LinkGraphics+$0080 ; 0x0AF - $108080
#_0094F6: dw LinkGraphics+$0080 ; 0x0B0 - $108080
#_0094F8: dw LinkGraphics+$0080 ; 0x0B1 - $108080
#_0094FA: dw LinkGraphics+$0080 ; 0x0B2 - $108080
#_0094FC: dw LinkGraphics+$0080 ; 0x0B3 - $108080
#_0094FE: dw LinkGraphics+$0080 ; 0x0B4 - $108080
#_009500: dw LinkGraphics+$0080 ; 0x0B5 - $108080
#_009502: dw LinkGraphics+$0040 ; 0x0B6 - $108040
#_009504: dw LinkGraphics+$0040 ; 0x0B7 - $108040
#_009506: dw LinkGraphics+$0040 ; 0x0B8 - $108040
#_009508: dw LinkGraphics+$0040 ; 0x0B9 - $108040
#_00950A: dw LinkGraphics+$0040 ; 0x0BA - $108040
#_00950C: dw LinkGraphics+$0040 ; 0x0BB - $108040
#_00950E: dw LinkGraphics+$0040 ; 0x0BC - $108040
#_009510: dw LinkGraphics+$0000 ; 0x0BD - $108000
#_009512: dw LinkGraphics+$28C0 ; 0x0BE - $10A8C0
#_009514: dw LinkGraphics+$2900 ; 0x0BF - $10A900
#_009516: dw LinkGraphics+$0000 ; 0x0C0 - $108000
#_009518: dw LinkGraphics+$0000 ; 0x0C1 - $108000
#_00951A: dw LinkGraphics+$28C0 ; 0x0C2 - $10A8C0
#_00951C: dw LinkGraphics+$2900 ; 0x0C3 - $10A900
#_00951E: dw LinkGraphics+$0000 ; 0x0C4 - $108000
#_009520: dw LinkGraphics+$28C0 ; 0x0C5 - $10A8C0
#_009522: dw LinkGraphics+$2900 ; 0x0C6 - $10A900
#_009524: dw LinkGraphics+$0000 ; 0x0C7 - $108000
#_009526: dw LinkGraphics+$0000 ; 0x0C8 - $108000
#_009528: dw LinkGraphics+$28C0 ; 0x0C9 - $10A8C0
#_00952A: dw LinkGraphics+$2900 ; 0x0CA - $10A900
#_00952C: dw LinkGraphics+$0040 ; 0x0CB - $108040
#_00952E: dw LinkGraphics+$0040 ; 0x0CC - $108040
#_009530: dw LinkGraphics+$0040 ; 0x0CD - $108040
#_009532: dw LinkGraphics+$0080 ; 0x0CE - $108080
#_009534: dw LinkGraphics+$0080 ; 0x0CF - $108080
#_009536: dw LinkGraphics+$0040 ; 0x0D0 - $108040
#_009538: dw LinkGraphics+$0040 ; 0x0D1 - $108040
#_00953A: dw LinkGraphics+$0040 ; 0x0D2 - $108040
#_00953C: dw LinkGraphics+$0040 ; 0x0D3 - $108040
#_00953E: dw LinkGraphics+$0000 ; 0x0D4 - $108000
#_009540: dw LinkGraphics+$0000 ; 0x0D5 - $108000
#_009542: dw LinkGraphics+$0000 ; 0x0D6 - $108000
#_009544: dw LinkGraphics+$0000 ; 0x0D7 - $108000
#_009546: dw LinkGraphics+$5080 ; 0x0D8 - $10D080
#_009548: dw LinkGraphics+$0080 ; 0x0D9 - $108080
#_00954A: dw LinkGraphics+$10C0 ; 0x0DA - $1090C0
#_00954C: dw LinkGraphics+$5000 ; 0x0DB - $10D000
#_00954E: dw LinkGraphics+$1080 ; 0x0DC - $109080
#_009550: dw LinkGraphics+$5040 ; 0x0DD - $10D040
#_009552: dw LinkGraphics+$1080 ; 0x0DE - $109080
#_009554: dw LinkGraphics+$5040 ; 0x0DF - $10D040
#_009556: dw LinkGraphics+$5080 ; 0x0E0 - $10D080
#_009558: dw LinkGraphics+$5080 ; 0x0E1 - $10D080
#_00955A: dw LinkGraphics+$5080 ; 0x0E2 - $10D080
#_00955C: dw LinkGraphics+$5080 ; 0x0E3 - $10D080
#_00955E: dw LinkGraphics+$5080 ; 0x0E4 - $10D080
#_009560: dw LinkGraphics+$5000 ; 0x0E5 - $10D000
#_009562: dw LinkGraphics+$5000 ; 0x0E6 - $10D000
#_009564: dw LinkGraphics+$5000 ; 0x0E7 - $10D000
#_009566: dw LinkGraphics+$5000 ; 0x0E8 - $10D000
#_009568: dw LinkGraphics+$5000 ; 0x0E9 - $10D000
#_00956A: dw LinkGraphics+$5040 ; 0x0EA - $10D040
#_00956C: dw LinkGraphics+$5040 ; 0x0EB - $10D040
#_00956E: dw LinkGraphics+$5040 ; 0x0EC - $10D040
#_009570: dw LinkGraphics+$5040 ; 0x0ED - $10D040
#_009572: dw LinkGraphics+$5040 ; 0x0EE - $10D040
#_009574: dw LinkGraphics+$5040 ; 0x0EF - $10D040
#_009576: dw LinkGraphics+$0040 ; 0x0F0 - $108040
#_009578: dw LinkGraphics+$5000 ; 0x0F1 - $10D000
#_00957A: dw LinkGraphics+$05C0 ; 0x0F2 - $1085C0
#_00957C: dw LinkGraphics+$05C0 ; 0x0F3 - $1085C0
#_00957E: dw LinkGraphics+$05C0 ; 0x0F4 - $1085C0
#_009580: dw LinkGraphics+$5C40 ; 0x0F5 - $10DC40
#_009582: dw LinkGraphics+$5C40 ; 0x0F6 - $10DC40
#_009584: dw LinkGraphics+$5C40 ; 0x0F7 - $10DC40
#_009586: dw LinkGraphics+$05C0 ; 0x0F8 - $1085C0
#_009588: dw LinkGraphics+$05C0 ; 0x0F9 - $1085C0
#_00958A: dw LinkGraphics+$05C0 ; 0x0FA - $1085C0
#_00958C: dw LinkGraphics+$5C40 ; 0x0FB - $10DC40
#_00958E: dw LinkGraphics+$5C40 ; 0x0FC - $10DC40
#_009590: dw LinkGraphics+$5C40 ; 0x0FD - $10DC40
#_009592: dw LinkGraphics+$61C0 ; 0x0FE - $10E1C0
#_009594: dw LinkGraphics+$5000 ; 0x0FF - $10D000
#_009596: dw LinkGraphics+$0000 ; 0x100 - $108000
#_009598: dw LinkGraphics+$6400 ; 0x101 - $10E400
#_00959A: dw LinkGraphics+$6400 ; 0x102 - $10E400
#_00959C: dw LinkGraphics+$6440 ; 0x103 - $10E440
#_00959E: dw LinkGraphics+$10C0 ; 0x104 - $1090C0
#_0095A0: dw LinkGraphics+$10C0 ; 0x105 - $1090C0
#_0095A2: dw LinkGraphics+$5000 ; 0x106 - $10D000
#_0095A4: dw LinkGraphics+$0000 ; 0x107 - $108000
#_0095A6: dw LinkGraphics+$0000 ; 0x108 - $108000
#_0095A8: dw LinkGraphics+$5040 ; 0x109 - $10D040
#_0095AA: dw LinkGraphics+$0000 ; 0x10A - $108000
#_0095AC: dw LinkGraphics+$0000 ; 0x10B - $108000
#_0095AE: dw LinkGraphics+$5040 ; 0x10C - $10D040
#_0095B0: dw LinkGraphics+$6400 ; 0x10D - $10E400
#_0095B2: dw LinkGraphics+$6400 ; 0x10E - $10E400
#_0095B4: dw LinkGraphics+$6400 ; 0x10F - $10E400
#_0095B6: dw LinkGraphics+$1080 ; 0x110 - $109080
#_0095B8: dw LinkGraphics+$25C0 ; 0x111 - $10A5C0
#_0095BA: dw LinkGraphics+$2C40 ; 0x112 - $10AC40
#_0095BC: dw LinkGraphics+$6480 ; 0x113 - $10E480
#_0095BE: dw LinkGraphics+$0180 ; 0x114 - $108180
#_0095C0: dw LinkGraphics+$10C0 ; 0x115 - $1090C0
#_0095C2: dw LinkGraphics+$00C0 ; 0x116 - $1080C0
#_0095C4: dw LinkGraphics+$6180 ; 0x117 - $10E180
#_0095C6: dw LinkGraphics+$5000 ; 0x118 - $10D000
#_0095C8: dw LinkGraphics+$64C0 ; 0x119 - $10E4C0
#_0095CA: dw LinkGraphics+$64C0 ; 0x11A - $10E4C0
#_0095CC: dw LinkGraphics+$6840 ; 0x11B - $10E840
#_0095CE: dw LinkGraphics+$6840 ; 0x11C - $10E840
#_0095D0: dw LinkGraphics+$6840 ; 0x11D - $10E840
#_0095D2: dw LinkGraphics+$6540 ; 0x11E - $10E540
#_0095D4: dw LinkGraphics+$6540 ; 0x11F - $10E540
#_0095D6: dw LinkGraphics+$6540 ; 0x120 - $10E540
#_0095D8: dw LinkGraphics+$6900 ; 0x121 - $10E900
#_0095DA: dw LinkGraphics+$6900 ; 0x122 - $10E900
#_0095DC: dw LinkGraphics+$6900 ; 0x123 - $10E900
#_0095DE: dw LinkGraphics+$6900 ; 0x124 - $10E900
#_0095E0: dw LinkGraphics+$0080 ; 0x125 - $108080
#_0095E2: dw LinkGraphics+$0080 ; 0x126 - $108080
#_0095E4: dw LinkGraphics+$0000 ; 0x127 - $108000
#_0095E6: dw LinkGraphics+$29C0 ; 0x128 - $10A9C0
#_0095E8: dw LinkGraphics+$0080 ; 0x129 - $108080
#_0095EA: dw LinkGraphics+$0140 ; 0x12A - $108140
#_0095EC: dw LinkGraphics+$11C0 ; 0x12B - $1091C0
#_0095EE: dw LinkGraphics+$0040 ; 0x12C - $108040
#_0095F0: dw LinkGraphics+$2800 ; 0x12D - $10A800
#_0095F2: dw LinkGraphics+$2840 ; 0x12E - $10A840

;===================================================================================================

LinkOAM_BodyAddresses:
#_0095F4: dw LinkGraphics+$0840 ; 0x000 - $108840
#_0095F6: dw LinkGraphics+$0800 ; 0x001 - $108800
#_0095F8: dw LinkGraphics+$0580 ; 0x002 - $108580
#_0095FA: dw LinkGraphics+$0800 ; 0x003 - $108800
#_0095FC: dw LinkGraphics+$0580 ; 0x004 - $108580
#_0095FE: dw LinkGraphics+$04C0 ; 0x005 - $1084C0
#_009600: dw LinkGraphics+$0500 ; 0x006 - $108500
#_009602: dw LinkGraphics+$0540 ; 0x007 - $108540
#_009604: dw LinkGraphics+$0500 ; 0x008 - $108500
#_009606: dw LinkGraphics+$0540 ; 0x009 - $108540
#_009608: dw LinkGraphics+$0400 ; 0x00A - $108400
#_00960A: dw LinkGraphics+$0440 ; 0x00B - $108440
#_00960C: dw LinkGraphics+$0480 ; 0x00C - $108480
#_00960E: dw LinkGraphics+$0400 ; 0x00D - $108400
#_009610: dw LinkGraphics+$0440 ; 0x00E - $108440
#_009612: dw LinkGraphics+$0480 ; 0x00F - $108480
#_009614: dw LinkGraphics+$1640 ; 0x010 - $109640
#_009616: dw LinkGraphics+$0C40 ; 0x011 - $108C40
#_009618: dw LinkGraphics+$0C80 ; 0x012 - $108C80
#_00961A: dw LinkGraphics+$2D00 ; 0x013 - $10AD00
#_00961C: dw LinkGraphics+$1600 ; 0x014 - $109600
#_00961E: dw LinkGraphics+$0980 ; 0x015 - $108980
#_009620: dw LinkGraphics+$0C00 ; 0x016 - $108C00
#_009622: dw LinkGraphics+$2CC0 ; 0x017 - $10ACC0
#_009624: dw LinkGraphics+$0880 ; 0x018 - $108880
#_009626: dw LinkGraphics+$08C0 ; 0x019 - $1088C0
#_009628: dw LinkGraphics+$0900 ; 0x01A - $108900
#_00962A: dw LinkGraphics+$0940 ; 0x01B - $108940
#_00962C: dw LinkGraphics+$0880 ; 0x01C - $108880
#_00962E: dw LinkGraphics+$08C0 ; 0x01D - $1088C0
#_009630: dw LinkGraphics+$0900 ; 0x01E - $108900
#_009632: dw LinkGraphics+$0940 ; 0x01F - $108940
#_009634: dw LinkGraphics+$30C0 ; 0x020 - $10B0C0
#_009636: dw LinkGraphics+$3100 ; 0x021 - $10B100
#_009638: dw LinkGraphics+$3140 ; 0x022 - $10B140
#_00963A: dw LinkGraphics+$3100 ; 0x023 - $10B100
#_00963C: dw LinkGraphics+$3140 ; 0x024 - $10B140
#_00963E: dw LinkGraphics+$3000 ; 0x025 - $10B000
#_009640: dw LinkGraphics+$3040 ; 0x026 - $10B040
#_009642: dw LinkGraphics+$3080 ; 0x027 - $10B080
#_009644: dw LinkGraphics+$6C80 ; 0x028 - $10EC80
#_009646: dw LinkGraphics+$6CC0 ; 0x029 - $10ECC0
#_009648: dw LinkGraphics+$3180 ; 0x02A - $10B180
#_00964A: dw LinkGraphics+$5440 ; 0x02B - $10D440
#_00964C: dw LinkGraphics+$31C0 ; 0x02C - $10B1C0
#_00964E: dw LinkGraphics+$3180 ; 0x02D - $10B180
#_009650: dw LinkGraphics+$5440 ; 0x02E - $10D440
#_009652: dw LinkGraphics+$31C0 ; 0x02F - $10B1C0
#_009654: dw LinkGraphics+$0C80 ; 0x030 - $108C80
#_009656: dw LinkGraphics+$2D00 ; 0x031 - $10AD00
#_009658: dw LinkGraphics+$15C0 ; 0x032 - $1095C0
#_00965A: dw LinkGraphics+$19C0 ; 0x033 - $1099C0
#_00965C: dw LinkGraphics+$3440 ; 0x034 - $10B440
#_00965E: dw LinkGraphics+$1580 ; 0x035 - $109580
#_009660: dw LinkGraphics+$3480 ; 0x036 - $10B480
#_009662: dw LinkGraphics+$34C0 ; 0x037 - $10B4C0
#_009664: dw LinkGraphics+$1580 ; 0x038 - $109580
#_009666: dw LinkGraphics+$3480 ; 0x039 - $10B480
#_009668: dw LinkGraphics+$34C0 ; 0x03A - $10B4C0
#_00966A: dw LinkGraphics+$1C20 ; 0x03B - $109C20
#_00966C: dw LinkGraphics+$0000 ; 0x03C - $108000
#_00966E: dw LinkGraphics+$0000 ; 0x03D - $108000
#_009670: dw LinkGraphics+$0000 ; 0x03E - $108000
#_009672: dw LinkGraphics+$1700 ; 0x03F - $109700
#_009674: dw LinkGraphics+$1680 ; 0x040 - $109680
#_009676: dw LinkGraphics+$16C0 ; 0x041 - $1096C0
#_009678: dw LinkGraphics+$16C0 ; 0x042 - $1096C0
#_00967A: dw LinkGraphics+$1CE0 ; 0x043 - $109CE0
#_00967C: dw LinkGraphics+$0C80 ; 0x044 - $108C80
#_00967E: dw LinkGraphics+$3540 ; 0x045 - $10B540
#_009680: dw LinkGraphics+$1C60 ; 0x046 - $109C60
#_009682: dw LinkGraphics+$3580 ; 0x047 - $10B580
#_009684: dw LinkGraphics+$0C00 ; 0x048 - $108C00
#_009686: dw LinkGraphics+$1CA0 ; 0x049 - $109CA0
#_009688: dw LinkGraphics+$0900 ; 0x04A - $108900
#_00968A: dw LinkGraphics+$3500 ; 0x04B - $10B500
#_00968C: dw LinkGraphics+$1CA0 ; 0x04C - $109CA0
#_00968E: dw LinkGraphics+$0900 ; 0x04D - $108900
#_009690: dw LinkGraphics+$3500 ; 0x04E - $10B500
#_009692: dw LinkGraphics+$0C40 ; 0x04F - $108C40
#_009694: dw LinkGraphics+$6C40 ; 0x050 - $10EC40
#_009696: dw LinkGraphics+$0C00 ; 0x051 - $108C00
#_009698: dw LinkGraphics+$6C00 ; 0x052 - $10EC00
#_00969A: dw LinkGraphics+$0DC0 ; 0x053 - $108DC0
#_00969C: dw LinkGraphics+$1540 ; 0x054 - $109540
#_00969E: dw LinkGraphics+$09C0 ; 0x055 - $1089C0
#_0096A0: dw LinkGraphics+$0DC0 ; 0x056 - $108DC0
#_0096A2: dw LinkGraphics+$1540 ; 0x057 - $109540
#_0096A4: dw LinkGraphics+$09C0 ; 0x058 - $1089C0
#_0096A6: dw LinkGraphics+$3940 ; 0x059 - $10B940
#_0096A8: dw LinkGraphics+$3980 ; 0x05A - $10B980
#_0096AA: dw LinkGraphics+$39C0 ; 0x05B - $10B9C0
#_0096AC: dw LinkGraphics+$3980 ; 0x05C - $10B980
#_0096AE: dw LinkGraphics+$39C0 ; 0x05D - $10B9C0
#_0096B0: dw LinkGraphics+$35C0 ; 0x05E - $10B5C0
#_0096B2: dw LinkGraphics+$3800 ; 0x05F - $10B800
#_0096B4: dw LinkGraphics+$3840 ; 0x060 - $10B840
#_0096B6: dw LinkGraphics+$3800 ; 0x061 - $10B800
#_0096B8: dw LinkGraphics+$3840 ; 0x062 - $10B840
#_0096BA: dw LinkGraphics+$3880 ; 0x063 - $10B880
#_0096BC: dw LinkGraphics+$38C0 ; 0x064 - $10B8C0
#_0096BE: dw LinkGraphics+$3900 ; 0x065 - $10B900
#_0096C0: dw LinkGraphics+$3880 ; 0x066 - $10B880
#_0096C2: dw LinkGraphics+$38C0 ; 0x067 - $10B8C0
#_0096C4: dw LinkGraphics+$3900 ; 0x068 - $10B900
#_0096C6: dw LinkGraphics+$0980 ; 0x069 - $108980
#_0096C8: dw LinkGraphics+$1600 ; 0x06A - $109600
#_0096CA: dw LinkGraphics+$3CC0 ; 0x06B - $10BCC0
#_0096CC: dw LinkGraphics+$0400 ; 0x06C - $108400
#_0096CE: dw LinkGraphics+$3C80 ; 0x06D - $10BC80
#_0096D0: dw LinkGraphics+$0C40 ; 0x06E - $108C40
#_0096D2: dw LinkGraphics+$1640 ; 0x06F - $109640
#_0096D4: dw LinkGraphics+$2040 ; 0x070 - $10A040
#_0096D6: dw LinkGraphics+$2080 ; 0x071 - $10A080
#_0096D8: dw LinkGraphics+$2000 ; 0x072 - $10A000
#_0096DA: dw LinkGraphics+$3C40 ; 0x073 - $10BC40
#_0096DC: dw LinkGraphics+$3D40 ; 0x074 - $10BD40
#_0096DE: dw LinkGraphics+$0500 ; 0x075 - $108500
#_0096E0: dw LinkGraphics+$3D00 ; 0x076 - $10BD00
#_0096E2: dw LinkGraphics+$3D80 ; 0x077 - $10BD80
#_0096E4: dw LinkGraphics+$3D80 ; 0x078 - $10BD80
#_0096E6: dw LinkGraphics+$08C0 ; 0x079 - $1088C0
#_0096E8: dw LinkGraphics+$0900 ; 0x07A - $108900
#_0096EA: dw LinkGraphics+$69C0 ; 0x07B - $10E9C0
#_0096EC: dw LinkGraphics+$0900 ; 0x07C - $108900
#_0096EE: dw LinkGraphics+$4640 ; 0x07D - $10C640
#_0096F0: dw LinkGraphics+$4040 ; 0x07E - $10C040
#_0096F2: dw LinkGraphics+$4000 ; 0x07F - $10C000
#_0096F4: dw LinkGraphics+$4C40 ; 0x080 - $10CC40
#_0096F6: dw LinkGraphics+$0940 ; 0x081 - $108940
#_0096F8: dw LinkGraphics+$08C0 ; 0x082 - $1088C0
#_0096FA: dw LinkGraphics+$0900 ; 0x083 - $108900
#_0096FC: dw LinkGraphics+$69C0 ; 0x084 - $10E9C0
#_0096FE: dw LinkGraphics+$0900 ; 0x085 - $108900
#_009700: dw LinkGraphics+$0940 ; 0x086 - $108940
#_009702: dw LinkGraphics+$0D40 ; 0x087 - $108D40
#_009704: dw LinkGraphics+$0D80 ; 0x088 - $108D80
#_009706: dw LinkGraphics+$0D40 ; 0x089 - $108D40
#_009708: dw LinkGraphics+$0D80 ; 0x08A - $108D80
#_00970A: dw LinkGraphics+$3D00 ; 0x08B - $10BD00
#_00970C: dw LinkGraphics+$3000 ; 0x08C - $10B000
#_00970E: dw LinkGraphics+$3000 ; 0x08D - $10B000
#_009710: dw LinkGraphics+$2480 ; 0x08E - $10A480
#_009712: dw LinkGraphics+$2480 ; 0x08F - $10A480
#_009714: dw LinkGraphics+$2480 ; 0x090 - $10A480
#_009716: dw LinkGraphics+$2480 ; 0x091 - $10A480
#_009718: dw LinkGraphics+$2C00 ; 0x092 - $10AC00
#_00971A: dw LinkGraphics+$2C00 ; 0x093 - $10AC00
#_00971C: dw LinkGraphics+$2C00 ; 0x094 - $10AC00
#_00971E: dw LinkGraphics+$2C00 ; 0x095 - $10AC00
#_009720: dw LinkGraphics+$2140 ; 0x096 - $10A140
#_009722: dw LinkGraphics+$2180 ; 0x097 - $10A180
#_009724: dw LinkGraphics+$2180 ; 0x098 - $10A180
#_009726: dw LinkGraphics+$24C0 ; 0x099 - $10A4C0
#_009728: dw LinkGraphics+$24C0 ; 0x09A - $10A4C0
#_00972A: dw LinkGraphics+$2500 ; 0x09B - $10A500
#_00972C: dw LinkGraphics+$1D40 ; 0x09C - $109D40
#_00972E: dw LinkGraphics+$1D80 ; 0x09D - $109D80
#_009730: dw LinkGraphics+$1DC0 ; 0x09E - $109DC0
#_009732: dw LinkGraphics+$1D40 ; 0x09F - $109D40
#_009734: dw LinkGraphics+$1D80 ; 0x0A0 - $109D80
#_009736: dw LinkGraphics+$1DC0 ; 0x0A1 - $109DC0
#_009738: dw LinkGraphics+$0D00 ; 0x0A2 - $108D00
#_00973A: dw LinkGraphics+$4680 ; 0x0A3 - $10C680
#_00973C: dw LinkGraphics+$4180 ; 0x0A4 - $10C180
#_00973E: dw LinkGraphics+$4140 ; 0x0A5 - $10C140
#_009740: dw LinkGraphics+$0C00 ; 0x0A6 - $108C00
#_009742: dw LinkGraphics+$4C80 ; 0x0A7 - $10CC80
#_009744: dw LinkGraphics+$4C80 ; 0x0A8 - $10CC80
#_009746: dw LinkGraphics+$4C00 ; 0x0A9 - $10CC00
#_009748: dw LinkGraphics+$4600 ; 0x0AA - $10C600
#_00974A: dw LinkGraphics+$4C00 ; 0x0AB - $10CC00
#_00974C: dw LinkGraphics+$4600 ; 0x0AC - $10C600
#_00974E: dw LinkGraphics+$3D00 ; 0x0AD - $10BD00
#_009750: dw LinkGraphics+$0580 ; 0x0AE - $108580
#_009752: dw LinkGraphics+$0800 ; 0x0AF - $108800
#_009754: dw LinkGraphics+$49C0 ; 0x0B0 - $10C9C0
#_009756: dw LinkGraphics+$4CC0 ; 0x0B1 - $10CCC0
#_009758: dw LinkGraphics+$4DC0 ; 0x0B2 - $10CDC0
#_00975A: dw LinkGraphics+$4D00 ; 0x0B3 - $10CD00
#_00975C: dw LinkGraphics+$4D40 ; 0x0B4 - $10CD40
#_00975E: dw LinkGraphics+$4D80 ; 0x0B5 - $10CD80
#_009760: dw LinkGraphics+$0500 ; 0x0B6 - $108500
#_009762: dw LinkGraphics+$0540 ; 0x0B7 - $108540
#_009764: dw LinkGraphics+$4940 ; 0x0B8 - $10C940
#_009766: dw LinkGraphics+$4980 ; 0x0B9 - $10C980
#_009768: dw LinkGraphics+$0540 ; 0x0BA - $108540
#_00976A: dw LinkGraphics+$4940 ; 0x0BB - $10C940
#_00976C: dw LinkGraphics+$4980 ; 0x0BC - $10C980
#_00976E: dw LinkGraphics+$0440 ; 0x0BD - $108440
#_009770: dw LinkGraphics+$0480 ; 0x0BE - $108480
#_009772: dw LinkGraphics+$41C0 ; 0x0BF - $10C1C0
#_009774: dw LinkGraphics+$4900 ; 0x0C0 - $10C900
#_009776: dw LinkGraphics+$4580 ; 0x0C1 - $10C580
#_009778: dw LinkGraphics+$45C0 ; 0x0C2 - $10C5C0
#_00977A: dw LinkGraphics+$48C0 ; 0x0C3 - $10C8C0
#_00977C: dw LinkGraphics+$0440 ; 0x0C4 - $108440
#_00977E: dw LinkGraphics+$0480 ; 0x0C5 - $108480
#_009780: dw LinkGraphics+$41C0 ; 0x0C6 - $10C1C0
#_009782: dw LinkGraphics+$4900 ; 0x0C7 - $10C900
#_009784: dw LinkGraphics+$4580 ; 0x0C8 - $10C580
#_009786: dw LinkGraphics+$45C0 ; 0x0C9 - $10C5C0
#_009788: dw LinkGraphics+$48C0 ; 0x0CA - $10C8C0
#_00978A: dw LinkGraphics+$3D00 ; 0x0CB - $10BD00
#_00978C: dw LinkGraphics+$2CC0 ; 0x0CC - $10ACC0
#_00978E: dw LinkGraphics+$4040 ; 0x0CD - $10C040
#_009790: dw LinkGraphics+$5540 ; 0x0CE - $10D540
#_009792: dw LinkGraphics+$5580 ; 0x0CF - $10D580
#_009794: dw LinkGraphics+$54C0 ; 0x0D0 - $10D4C0
#_009796: dw LinkGraphics+$5500 ; 0x0D1 - $10D500
#_009798: dw LinkGraphics+$54C0 ; 0x0D2 - $10D4C0
#_00979A: dw LinkGraphics+$5500 ; 0x0D3 - $10D500
#_00979C: dw LinkGraphics+$5440 ; 0x0D4 - $10D440
#_00979E: dw LinkGraphics+$5480 ; 0x0D5 - $10D480
#_0097A0: dw LinkGraphics+$5440 ; 0x0D6 - $10D440
#_0097A2: dw LinkGraphics+$5480 ; 0x0D7 - $10D480
#_0097A4: dw LinkGraphics+$51C0 ; 0x0D8 - $10D1C0
#_0097A6: dw LinkGraphics+$5400 ; 0x0D9 - $10D400
#_0097A8: dw LinkGraphics+$5100 ; 0x0DA - $10D100
#_0097AA: dw LinkGraphics+$5100 ; 0x0DB - $10D100
#_0097AC: dw LinkGraphics+$5140 ; 0x0DC - $10D140
#_0097AE: dw LinkGraphics+$5180 ; 0x0DD - $10D180
#_0097B0: dw LinkGraphics+$5140 ; 0x0DE - $10D140
#_0097B2: dw LinkGraphics+$5180 ; 0x0DF - $10D180
#_0097B4: dw LinkGraphics+$30C0 ; 0x0E0 - $10B0C0
#_0097B6: dw LinkGraphics+$3100 ; 0x0E1 - $10B100
#_0097B8: dw LinkGraphics+$3140 ; 0x0E2 - $10B140
#_0097BA: dw LinkGraphics+$3100 ; 0x0E3 - $10B100
#_0097BC: dw LinkGraphics+$3140 ; 0x0E4 - $10B140
#_0097BE: dw LinkGraphics+$5D40 ; 0x0E5 - $10DD40
#_0097C0: dw LinkGraphics+$5D80 ; 0x0E6 - $10DD80
#_0097C2: dw LinkGraphics+$5DC0 ; 0x0E7 - $10DDC0
#_0097C4: dw LinkGraphics+$5D80 ; 0x0E8 - $10DD80
#_0097C6: dw LinkGraphics+$5DC0 ; 0x0E9 - $10DDC0
#_0097C8: dw LinkGraphics+$5C80 ; 0x0EA - $10DC80
#_0097CA: dw LinkGraphics+$5CC0 ; 0x0EB - $10DCC0
#_0097CC: dw LinkGraphics+$5D00 ; 0x0EC - $10DD00
#_0097CE: dw LinkGraphics+$5C80 ; 0x0ED - $10DC80
#_0097D0: dw LinkGraphics+$5CC0 ; 0x0EE - $10DCC0
#_0097D2: dw LinkGraphics+$5D00 ; 0x0EF - $10DD00
#_0097D4: dw LinkGraphics+$5100 ; 0x0F0 - $10D100
#_0097D6: dw LinkGraphics+$5100 ; 0x0F1 - $10D100
#_0097D8: dw LinkGraphics+$6000 ; 0x0F2 - $10E000
#_0097DA: dw LinkGraphics+$6040 ; 0x0F3 - $10E040
#_0097DC: dw LinkGraphics+$6080 ; 0x0F4 - $10E080
#_0097DE: dw LinkGraphics+$60C0 ; 0x0F5 - $10E0C0
#_0097E0: dw LinkGraphics+$6100 ; 0x0F6 - $10E100
#_0097E2: dw LinkGraphics+$6140 ; 0x0F7 - $10E140
#_0097E4: dw LinkGraphics+$6000 ; 0x0F8 - $10E000
#_0097E6: dw LinkGraphics+$6040 ; 0x0F9 - $10E040
#_0097E8: dw LinkGraphics+$6080 ; 0x0FA - $10E080
#_0097EA: dw LinkGraphics+$60C0 ; 0x0FB - $10E0C0
#_0097EC: dw LinkGraphics+$6100 ; 0x0FC - $10E100
#_0097EE: dw LinkGraphics+$6140 ; 0x0FD - $10E140
#_0097F0: dw LinkGraphics+$0000 ; 0x0FE - $108000
#_0097F2: dw LinkGraphics+$50C0 ; 0x0FF - $10D0C0
#_0097F4: dw LinkGraphics+$0000 ; 0x100 - $108000
#_0097F6: dw LinkGraphics+$3940 ; 0x101 - $10B940
#_0097F8: dw LinkGraphics+$3980 ; 0x102 - $10B980
#_0097FA: dw LinkGraphics+$3940 ; 0x103 - $10B940
#_0097FC: dw LinkGraphics+$5D40 ; 0x104 - $10DD40
#_0097FE: dw LinkGraphics+$5D80 ; 0x105 - $10DD80
#_009800: dw LinkGraphics+$5D40 ; 0x106 - $10DD40
#_009802: dw LinkGraphics+$5C80 ; 0x107 - $10DC80
#_009804: dw LinkGraphics+$5CC0 ; 0x108 - $10DCC0
#_009806: dw LinkGraphics+$40C0 ; 0x109 - $10C0C0
#_009808: dw LinkGraphics+$5C80 ; 0x10A - $10DC80
#_00980A: dw LinkGraphics+$5CC0 ; 0x10B - $10DCC0
#_00980C: dw LinkGraphics+$40C0 ; 0x10C - $10C0C0
#_00980E: dw LinkGraphics+$39C0 ; 0x10D - $10B9C0
#_009810: dw LinkGraphics+$3980 ; 0x10E - $10B980
#_009812: dw LinkGraphics+$39C0 ; 0x10F - $10B9C0
#_009814: dw LinkGraphics+$2560 ; 0x110 - $10A560
#_009816: dw LinkGraphics+$25A0 ; 0x111 - $10A5A0
#_009818: dw LinkGraphics+$2C80 ; 0x112 - $10AC80
#_00981A: dw LinkGraphics+$6D00 ; 0x113 - $10ED00
#_00981C: dw LinkGraphics+$0000 ; 0x114 - $108000
#_00981E: dw LinkGraphics+$0CC0 ; 0x115 - $108CC0
#_009820: dw LinkGraphics+$3D00 ; 0x116 - $10BD00
#_009822: dw LinkGraphics+$6380 ; 0x117 - $10E380
#_009824: dw LinkGraphics+$3DC0 ; 0x118 - $10BDC0
#_009826: dw LinkGraphics+$6500 ; 0x119 - $10E500
#_009828: dw LinkGraphics+$6500 ; 0x11A - $10E500
#_00982A: dw LinkGraphics+$6880 ; 0x11B - $10E880
#_00982C: dw LinkGraphics+$68C0 ; 0x11C - $10E8C0
#_00982E: dw LinkGraphics+$68C0 ; 0x11D - $10E8C0
#_009830: dw LinkGraphics+$6800 ; 0x11E - $10E800
#_009832: dw LinkGraphics+$65C0 ; 0x11F - $10E5C0
#_009834: dw LinkGraphics+$65C0 ; 0x120 - $10E5C0
#_009836: dw LinkGraphics+$6940 ; 0x121 - $10E940
#_009838: dw LinkGraphics+$6980 ; 0x122 - $10E980
#_00983A: dw LinkGraphics+$6940 ; 0x123 - $10E940
#_00983C: dw LinkGraphics+$6980 ; 0x124 - $10E980
#_00983E: dw LinkGraphics+$3D40 ; 0x125 - $10BD40
#_009840: dw LinkGraphics+$0C80 ; 0x126 - $108C80
#_009842: dw LinkGraphics+$2080 ; 0x127 - $10A080
#_009844: dw LinkGraphics+$0000 ; 0x128 - $108000
#_009846: dw LinkGraphics+$2980 ; 0x129 - $10A980
#_009848: dw LinkGraphics+$3D00 ; 0x12A - $10BD00
#_00984A: dw LinkGraphics+$3DC0 ; 0x12B - $10BDC0
#_00984C: dw LinkGraphics+$3400 ; 0x12C - $10B400
#_00984E: dw LinkGraphics+$2880 ; 0x12D - $10A880
#_009850: dw LinkGraphics+$6DC0 ; 0x12E - $10EDC0

;===================================================================================================

LinkOAM_AuxAddresses:
#_009852: dw LinkGraphics+$1A40 ; 0x000 - $109A40
#_009854: dw LinkGraphics+$1E00 ; 0x001 - $109E00
#_009856: dw LinkGraphics+$1D20 ; 0x002 - $109D20
#_009858: dw LinkGraphics+$1F20 ; 0x003 - $109F20
#_00985A: dw LinkGraphics+$1B20 ; 0x004 - $109B20
#_00985C: dw LinkGraphics+$3C20 ; 0x005 - $10BC20
#_00985E: dw LinkGraphics+$3C20 ; 0x006 - $10BC20
#_009860: dw LinkGraphics+$3E20 ; 0x007 - $10BE20
#_009862: dw LinkGraphics+$3E20 ; 0x008 - $10BE20
#_009864: dw LinkGraphics+$3E00 ; 0x009 - $10BE00
#_009866: dw LinkGraphics+$3E00 ; 0x00A - $10BE00
#_009868: dw LinkGraphics+$3E00 ; 0x00B - $10BE00
#_00986A: dw LinkGraphics+$3E00 ; 0x00C - $10BE00
#_00986C: dw LinkGraphics+$2540 ; 0x00D - $10A540
#_00986E: dw LinkGraphics+$2540 ; 0x00E - $10A540
#_009870: dw LinkGraphics+$2540 ; 0x00F - $10A540
#_009872: dw LinkGraphics+$2540 ; 0x010 - $10A540
#_009874: dw LinkGraphics+$3C00 ; 0x011 - $10BC00
#_009876: dw LinkGraphics+$3C00 ; 0x012 - $10BC00
#_009878: dw LinkGraphics+$3C00 ; 0x013 - $10BC00
#_00987A: dw LinkGraphics+$3C00 ; 0x014 - $10BC00
#_00987C: dw LinkGraphics+$2740 ; 0x015 - $10A740
#_00987E: dw LinkGraphics+$2740 ; 0x016 - $10A740
#_009880: dw LinkGraphics+$2740 ; 0x017 - $10A740
#_009882: dw LinkGraphics+$2740 ; 0x018 - $10A740
#_009884: dw LinkGraphics+$6780 ; 0x019 - $10E780
#_009886: dw LinkGraphics+$6780 ; 0x01A - $10E780

;===================================================================================================

TilemapUpload_HighBytes:
#_009888: db $00 ; 0x00 - VRAM $0000>>8
#_009889: db $00 ; 0x01 - VRAM $0000>>8
#_00988A: db $04 ; 0x02 - VRAM $0800>>8
#_00988B: db $08 ; 0x03 - VRAM $1000>>8
#_00988C: db $0C ; 0x04 - VRAM $1800>>8
#_00988D: db $08 ; 0x05 - VRAM $1000>>8
#_00988E: db $0C ; 0x06 - VRAM $1800>>8
#_00988F: db $00 ; 0x07 - VRAM $0000>>8
#_009890: db $04 ; 0x08 - VRAM $0800>>8
#_009891: db $00 ; 0x09 - VRAM $0000>>8
#_009892: db $08 ; 0x0A - VRAM $1000>>8
#_009893: db $04 ; 0x0B - VRAM $0800>>8
#_009894: db $0C ; 0x0C - VRAM $1800>>8
#_009895: db $04 ; 0x0D - VRAM $0800>>8
#_009896: db $0C ; 0x0E - VRAM $1800>>8
#_009897: db $00 ; 0x0F - VRAM $0000>>8
#_009898: db $08 ; 0x10 - VRAM $1000>>8
#_009899: db $10 ; 0x11 - VRAM $2000>>8
#_00989A: db $14 ; 0x12 - VRAM $2800>>8
#_00989B: db $18 ; 0x13 - VRAM $3000>>8
#_00989C: db $1C ; 0x14 - VRAM $3800>>8
#_00989D: db $18 ; 0x15 - VRAM $3000>>8
#_00989E: db $1C ; 0x16 - VRAM $3800>>8
#_00989F: db $10 ; 0x17 - VRAM $2000>>8
#_0098A0: db $14 ; 0x18 - VRAM $2800>>8
#_0098A1: db $10 ; 0x19 - VRAM $2000>>8
#_0098A2: db $18 ; 0x1A - VRAM $3000>>8
#_0098A3: db $14 ; 0x1B - VRAM $2800>>8
#_0098A4: db $1C ; 0x1C - VRAM $3800>>8
#_0098A5: db $14 ; 0x1D - VRAM $2800>>8
#_0098A6: db $1C ; 0x1E - VRAM $3800>>8
#_0098A7: db $10 ; 0x1F - VRAM $2000>>8
#_0098A8: db $18 ; 0x20 - VRAM $3000>>8
#_0098A9: db $60 ; 0x21 - VRAM $C000>>8
#_0098AA: db $68 ; 0x22 - VRAM $D000>>8

;===================================================================================================
; FREE ROM: 0x15
;===================================================================================================
NULL_0098AB:
#_0098AB: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0098B3: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_0098BB: db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

DungeonMask:
#_0098C0: dw $8000 ; Sewers
#_0098C2: dw $4000 ; Hyrule Castle
#_0098C4: dw $2000 ; Eastern Palace
#_0098C6: dw $1000 ; Desert Palace

DoorFlagMasks:
#_0098C8: dw $0800 ; Agahnim's Tower
#_0098CA: dw $0400 ; Swamp Palace
#_0098CC: dw $0200 ; Palace of Darkness
#_0098CE: dw $0100 ; Misery Mire
#_0098D0: dw $0080 ; Skull Woods
#_0098D2: dw $0040 ; Ice Palace
#_0098D4: dw $0020 ; Tower of Hera
#_0098D6: dw $0010 ; Thieves' Town
#_0098D8: dw $0008 ; Turtle Rock
#_0098DA: dw $0004 ; Ganon's Tower
#_0098DC: dw $0002 ; Unused
#_0098DE: dw $0001 ; Unused

DungeonMaskInverted:
#_0098E0: dw $7FFF ; Sewers
#_0098E2: dw $BFFF ; Hyrule Castle
#_0098E4: dw $DFFF ; Eastern Palace
#_0098E6: dw $EFFF ; Desert Palace
#_0098E8: dw $F7FF ; Agahnim's Tower
#_0098EA: dw $FBFF ; Swamp Palace
#_0098EC: dw $FDFF ; Palace of Darkness
#_0098EE: dw $FEFF ; Misery Mire
#_0098F0: dw $FF7F ; Skull Woods
#_0098F2: dw $FFBF ; Ice Palace
#_0098F4: dw $FFDF ; Tower of Hera
#_0098F6: dw $FFEF ; Thieves' Town
#_0098F8: dw $FFF7 ; Turtle Rock
#_0098FA: dw $FFFB ; Ganon's Tower
#_0098FC: dw $FFFD ; Unused
#_0098FE: dw $FFFE ; Unused

;===================================================================================================

RoomFlagMask:
#_009900: dw $0100
#_009902: dw $0200
#_009904: dw $0400
#_009906: dw $0800
#_009908: dw $1000
#_00990A: dw $2000

;===================================================================================================

RoomsWithPitDamage:
#_00990C: dw $0072 ; ROOM 0072
#_00990E: dw $0082 ; ROOM 0082
#_009910: dw $0040 ; ROOM 0040
#_009912: dw $00C0 ; ROOM 00C0
#_009914: dw $0112 ; ROOM 0112
#_009916: dw $0056 ; ROOM 0056
#_009918: dw $0057 ; ROOM 0057
#_00991A: dw $0058 ; ROOM 0058
#_00991C: dw $0067 ; ROOM 0067
#_00991E: dw $0068 ; ROOM 0068
#_009920: dw $0049 ; ROOM 0049
#_009922: dw $0098 ; ROOM 0098
#_009924: dw $00D1 ; ROOM 00D1
#_009926: dw $00C3 ; ROOM 00C3
#_009928: dw $00A3 ; ROOM 00A3
#_00992A: dw $00A2 ; ROOM 00A2
#_00992C: dw $0092 ; ROOM 0092
#_00992E: dw $00A0 ; ROOM 00A0
#_009930: dw $004E ; ROOM 004E
#_009932: dw $007F ; ROOM 007F
#_009934: dw $00AF ; ROOM 00AF
#_009936: dw $00F0 ; ROOM 00F0
#_009938: dw $00F1 ; ROOM 00F1
#_00993A: dw $00E6 ; ROOM 00E6
#_00993C: dw $00E7 ; ROOM 00E7
#_00993E: dw $00C6 ; ROOM 00C6
#_009940: dw $00C7 ; ROOM 00C7
#_009942: dw $00D6 ; ROOM 00D6
#_009944: dw $00B4 ; ROOM 00B4
#_009946: dw $00B5 ; ROOM 00B5
#_009948: dw $00C5 ; ROOM 00C5
#_00994A: dw $0024 ; ROOM 0024
#_00994C: dw $00D5 ; ROOM 00D5
#_00994E: dw $00C9 ; ROOM 00C9
#_009950: dw $002A ; ROOM 002A
#_009952: dw $001A ; ROOM 001A
#_009954: dw $004B ; ROOM 004B
#_009956: dw $00BC ; ROOM 00BC
#_009958: dw $0044 ; ROOM 0044
#_00995A: dw $00FB ; ROOM 00FB
#_00995C: dw $007B ; ROOM 007B
#_00995E: dw $007C ; ROOM 007C
#_009960: dw $008B ; ROOM 008B
#_009962: dw $008D ; ROOM 008D
#_009964: dw $009B ; ROOM 009B
#_009966: dw $009C ; ROOM 009C
#_009968: dw $009D ; ROOM 009D
#_00996A: dw $00A5 ; ROOM 00A5
#_00996C: dw $0095 ; ROOM 0095
#_00996E: dw $001C ; ROOM 001C
#_009970: dw $005C ; ROOM 005C
#_009972: dw $007D ; ROOM 007D
#_009974: dw $004C ; ROOM 004C
#_009976: dw $0096 ; ROOM 0096
#_009978: dw $0120 ; ROOM 0120
#_00997A: dw $003C ; ROOM 003C
#_00997C: dw $0123 ; ROOM 0123

;===================================================================================================

DoorTilemapPositions_NorthWall:
#_00997E: dw $021C
#_009980: dw $023C
#_009982: dw $025C
#_009984: dw $039C
#_009986: dw $03BC
#_009988: dw $03DC

DoorTilemapPositions_NorthMiddle:
#_00998A: dw $121C
#_00998C: dw $123C
#_00998E: dw $125C
#_009990: dw $139C
#_009992: dw $13BC
#_009994: dw $13DC

DoorTilemapPositions_SouthMiddle:
#_009996: dw $0D1C
#_009998: dw $0D3C
#_00999A: dw $0D5C
#_00999C: dw $0B9C
#_00999E: dw $0BBC
#_0099A0: dw $0BDC
#_0099A2: dw $1D1C
#_0099A4: dw $1D3C
#_0099A6: dw $1D5C

DoorTilemapPositions_LowerLayerEntrance:
#_0099A8: dw $1B9C
#_0099AA: dw $1BBC
#_0099AC: dw $1BDC

DoorTilemapPositions_WestWall:
#_0099AE: dw $0784
#_0099B0: dw $0F84
#_0099B2: dw $1784
#_0099B4: dw $078A
#_0099B6: dw $0F8A
#_0099B8: dw $178A

DoorTilemapPositions_WestMiddle:
#_0099BA: dw $07C4
#_0099BC: dw $0FC4
#_0099BE: dw $17C4
#_0099C0: dw $07CA
#_0099C2: dw $0FCA
#_0099C4: dw $17CA

DoorTilemapPositions_EastMiddle:
#_0099C6: dw $07B4
#_0099C8: dw $0FB4
#_0099CA: dw $17B4
#_0099CC: dw $07AE
#_0099CE: dw $0FAE
#_0099D0: dw $17AE

DoorTilemapPositions_EastWall:
#_0099D2: dw $07F4
#_0099D4: dw $0FF4
#_0099D6: dw $17F4
#_0099D8: dw $07EE
#_0099DA: dw $0FEE
#_0099DC: dw $17EE

;===================================================================================================

ExplodingWallTilemapPosition:
#_0099DE: dw $0D8A
#_0099E0: dw $0DAA
#_0099E2: dw $0DCA
#_0099E4: dw $02B6
#_0099E6: dw $0AB6
#_0099E8: dw $12B6

;===================================================================================================

DetectStaircase:

.offset_y
#_0099EA: dw $0007
#_0099EC: dw $0018
#_0099EE: dw $0008
#_0099F0: dw $0008

.offset_x
#_0099F2: dw $0000
#_0099F4: dw $0000
#_0099F6: dw $FFFF
#_0099F8: dw $0011

.index_offset
#_0099FA: dw $0002
#_0099FC: dw $0002
#_0099FE: dw $0080
#_009A00: dw $0080

;===================================================================================================

DoorwayReplacementDoorGFX:
#_009A02: db $00, $00, $02, $00, $00, $00, $00, $00
#_009A0A: db $00, $00, $00, $00, $00, $00, $00, $00
#_009A12: db $00, $00, $12, $00, $00, $00, $00, $00
#_009A1A: db $50, $00, $00, $00, $50, $00, $50, $00
#_009A22: db $60, $00, $62, $00, $64, $00, $66, $00
#_009A2A: db $52, $00, $5A, $00, $50, $00, $52, $00
#_009A32: db $54, $00, $56, $00, $00, $00, $50, $00
#_009A3A: db $50, $00, $00, $00, $00, $00, $00, $00
#_009A42: db $40, $00, $58, $00, $58, $00, $00, $00
#_009A4A: db $58, $00, $58, $00, $00, $00, $00, $00

DoorwayTileProperties:
#_009A52: db $80, $80, $84, $84, $00, $00, $01, $01
#_009A5A: db $84, $84, $8E, $8E, $00, $00, $00, $00
#_009A62: db $88, $88, $8E, $8E, $80, $80, $80, $80
#_009A6A: db $82, $82, $80, $80, $80, $80, $80, $80
#_009A72: db $80, $80, $80, $80, $80, $80, $80, $80
#_009A7A: db $82, $82, $8E, $8E, $80, $80, $82, $82
#_009A82: db $80, $80, $80, $80, $80, $80, $82, $82
#_009A8A: db $82, $82, $80, $80, $80, $80, $80, $80
#_009A92: db $84, $84, $84, $84, $86, $86, $88, $88
#_009A9A: db $86, $86, $86, $86, $80, $80, $80, $80

;===================================================================================================

RoomDraw_DoorPartnerSelfLocation:
#_009AA2: dw $0000, $0010, $0020, $0030, $0040, $0050
#_009AAE: dw $0061, $0071, $0081, $0091, $00A1, $00B1
#_009ABA: dw $0002, $0012, $0022, $0032, $0042, $0052
#_009AC6: dw $0063, $0073, $0083, $0093, $00A3, $00B3

RoomDraw_DoorPartnerLocation:
#_009AD2: dw $0061, $0071, $0081, $0091, $00A1, $00B1
#_009ADE: dw $0000, $0010, $0020, $0030, $0040, $0050
#_009AEA: dw $0063, $0073, $0083, $0093, $00A3, $00B3
#_009AF6: dw $0002, $0012, $0022, $0032, $0042, $0052

;===================================================================================================

RoomDraw_QuadrantDataOffset:
#_009B02: dw $0000
#_009B04: dw $0040
#_009B06: dw $1000
#_009B08: dw $1040

;===================================================================================================

RoomDraw_MovingWallDirection:
#_009B0A: dw $0005
#_009B0C: dw $0007
#_009B0E: dw $000B
#_009B10: dw $000F

;---------------------------------------------------------------------------------------------------

MovingWallObjectCount:
#_009B12: dw $0008
#_009B14: dw $0010
#_009B16: dw $0018
#_009B18: dw $0020

;---------------------------------------------------------------------------------------------------

MovingWallEastBoundaries:
#_009B1A: dw $FFC1
#_009B1C: dw $FF81
#_009B1E: dw $FF41
#_009B20: dw $FF01

#_009B22: dw $FFB9
#_009B24: dw $FF79
#_009B26: dw $FF39
#_009B28: dw $FEF9

;---------------------------------------------------------------------------------------------------

MovingWallWestBoundaries:
#_009B2A: dw $0042
#_009B2C: dw $0082
#_009B2E: dw $00C2
#_009B30: dw $0102

#_009B32: dw $004A
#_009B34: dw $008A
#_009B36: dw $00CA
#_009B38: dw $010A

;===================================================================================================

WaterOverlayHDMAPositionOffset:
#_009B3A: dw $0002
#_009B3C: dw $0003
#_009B3E: dw $0004
#_009B40: dw $0005

WaterOverlayHDMASize:
#_009B42: dw $0020
#_009B44: dw $0030

WaterOverlayObjectCount:
#_009B46: dw $0040
#_009B48: dw $0050

;===================================================================================================

UNREACHABLE_009B4A:
#_009B4A: dw $0003, $0005, $0007, $0009

;===================================================================================================

RoomDrawObjectData:

;---------------------------------------------------------------------------------------------------

#obj0000:
#_009B52: dw $14EE, $14EF, $14EE, $14EF
#_009B5A: dw $14FE, $14FF, $14FE, $14FF

;---------------------------------------------------------------------------------------------------

#obj0010:
#_009B62: dw $0CEE, $0CEF, $0CEE, $0CEF
#_009B6A: dw $0CFE, $0CFF, $0CFE, $0CFF

;---------------------------------------------------------------------------------------------------

#obj0020:
#_009B72: dw $0CEC, $0CED, $0CEC, $0CED
#_009B7A: dw $0CFC, $0CFD, $0CFC, $0CFD

;---------------------------------------------------------------------------------------------------

#obj0030:
#_009B82: dw $14EC, $14ED, $14EC, $14ED
#_009B8A: dw $14FC, $14FD, $14FC, $14FD

;---------------------------------------------------------------------------------------------------

#obj0040:
#_009B92: dw $18EE, $18EF, $18EE, $18EF
#_009B9A: dw $18FE, $18FF, $18FE, $18FF

;---------------------------------------------------------------------------------------------------

#obj0050:
#_009BA2: dw $10EE, $10EF, $10EE, $10EF
#_009BAA: dw $10FE, $10FF, $10FE, $10FF

;---------------------------------------------------------------------------------------------------

#obj0060:
#_009BB2: dw $10EC, $10ED, $10EC, $10ED
#_009BBA: dw $10FC, $10FD, $10FC, $10FD

;---------------------------------------------------------------------------------------------------

#obj0070:
#_009BC2: dw $18EC, $18ED, $18EC, $18ED
#_009BCA: dw $18FC, $18FD, $18FC, $18FD

;---------------------------------------------------------------------------------------------------

#obj0080:
#_009BD2: dw $10C1, $10C1, $10C1, $10C1
#_009BDA: dw $10C1, $10C1, $10C1, $10C1

;---------------------------------------------------------------------------------------------------

#obj0090:
#_009BE2: dw $18CA, $18CB, $18CA, $18CB
#_009BEA: dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

#obj00A0:
#_009BF2: dw $18C9, $18C9, $18C9, $18C9
#_009BFA: dw $18C9, $18C9, $18C9, $18C9

;---------------------------------------------------------------------------------------------------

#obj00B0:
#_009C02: dw $1DB6, $1DB7, $1DB6, $1DB7
#_009C0A: dw $1DB8, $1DB9, $1DB8, $1DB9

;---------------------------------------------------------------------------------------------------

#obj00C0:
#_009C12: dw $1DAE, $1DAF, $1DAE, $1DAF
#_009C1A: dw $1DBE, $1DBF, $1DBE, $1DBF

;---------------------------------------------------------------------------------------------------

#obj00D0:
#_009C22: dw $090C, $490C, $090C, $490C
#_009C2A: dw $890C, $C90C, $890C, $C90C

;---------------------------------------------------------------------------------------------------

#obj00E0:
#_009C32: dw $01EC, $01EC, $01EC, $01EC
#_009C3A: dw $01EC, $01EC, $01EC, $01EC

;---------------------------------------------------------------------------------------------------

#obj00F0:
#_009C42: dw $01EB, $01EB, $01EB, $01EB
#_009C4A: dw $01EB, $01EB, $01EB, $01EB

;---------------------------------------------------------------------------------------------------

#obj0100:
#_009C52: dw $1DBA, $1DBB, $1DBA, $1DBB
#_009C5A: dw $1DBC, $1DBD, $1DBC, $1DBD

;---------------------------------------------------------------------------------------------------

#obj0110:
#_009C62: dw $1DB6, $1DB7, $1DB6, $1DB7
#_009C6A: dw $1DB8, $1DB9, $1DB8, $1DB9

;---------------------------------------------------------------------------------------------------

#obj0120:
#_009C72: dw $1DB0, $1DB1, $1DB0, $1DB1
#_009C7A: dw $9DB0, $9DB1, $9DB0, $9DB1

;---------------------------------------------------------------------------------------------------

#obj0130:
#_009C82: dw $1DBA, $1DBB, $1DBA, $1DBB
#_009C8A: dw $1DBC, $1DBD, $1DBC, $1DBD

;---------------------------------------------------------------------------------------------------

#obj0140:
#_009C92: dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

#obj0148:
#_009C9A: dw $1DA6, $5DA6, $1DA6, $5DA6
#_009CA2: dw $9DA6, $DDA6, $9DA6, $DDA6

;---------------------------------------------------------------------------------------------------

#obj0158:
#_009CAA: dw $08D0, $08D0, $08D0, $08D0
#_009CB2: dw $08D0, $08D0, $08D0, $08D0

;---------------------------------------------------------------------------------------------------

#obj0168:
#_009CBA: dw $18CA, $18CB, $18CA, $18CB
#_009CC2: dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

#obj0178:
#_009CCA: dw $0C62, $0C63, $0C62, $0C63
#_009CD2: dw $0C62, $0C63, $0C62, $0C63

;---------------------------------------------------------------------------------------------------

#obj0188:
#_009CDA: dw $0DCC, $0DCC, $0DCC, $0DCC
#_009CE2: dw $0DCC, $0DCC, $0DCC, $0DCC

;---------------------------------------------------------------------------------------------------

#obj0198:
#_009CEA: dw $090D, $091D, $490D, $491D

;---------------------------------------------------------------------------------------------------

#obj01A0:
#_009CF2: dw $10EC, $10ED, $10EC, $10ED
#_009CFA: dw $10FC, $10FD, $10FC, $10FD

;---------------------------------------------------------------------------------------------------

#obj01B0:
#_009D02: dw $090C, $490C, $090C, $490C
#_009D0A: dw $890C, $C90C, $890C, $C90C

;---------------------------------------------------------------------------------------------------

#obj01C0:
#_009D12: dw $190F, $190F, $190F, $190F
#_009D1A: dw $190F, $190F, $190F, $190F

;---------------------------------------------------------------------------------------------------

#obj01D0:
#_009D22: dw $09BE, $49BE, $09BE, $49BE
#_009D2A: dw $09BE, $49BE, $09BE, $49BE

;---------------------------------------------------------------------------------------------------

#obj01E0:
#_009D32: dw $09BF, $49BF, $09BF, $49BF
#_009D3A: dw $09BF, $49BF, $09BF, $49BF

;---------------------------------------------------------------------------------------------------

#obj01F0:
#_009D42: dw $09B1, $09B1, $09B1, $09B1
#_009D4A: dw $89B1, $89B1, $89B1, $89B1

;---------------------------------------------------------------------------------------------------

#obj0200:
#_009D52: dw $09B0, $09B0, $09B0, $09B0
#_009D5A: dw $89B0, $89B0, $89B0, $89B0

;---------------------------------------------------------------------------------------------------

#obj0210:
#_009D62: dw $0982, $0992, $0983, $0993

;---------------------------------------------------------------------------------------------------

#obj0218:
#_009D6A: dw $4983, $4993, $4982, $4992

;---------------------------------------------------------------------------------------------------

#obj0220:
#_009D72: dw $0CCC, $0CCD, $0CDC, $0CCE

#obj0228:
#_009D7A: dw $0CCC, $0CCF, $0CDC, $0CDD

#obj0230:
#_009D82: dw $0CCC, $0CCD, $0CDE, $0CDD

#obj0238:
#_009D8A: dw $0CDF, $0CCD, $0CDC, $0CDD

#_009D92: dw $0CCC, $0CDC, $0CCD, $0CCE
#_009D9A: dw $0CCC, $0CDC, $0CCF, $0CDD
#_009DA2: dw $0CCC, $0CDE, $0CCD, $0CDD
#_009DAA: dw $0CDF, $0CDC, $0CCD, $0CDD

;---------------------------------------------------------------------------------------------------

#obj0260:
#_009DB2: dw $0CCC, $0CCD, $0CCC, $0CCD
#_009DBA: dw $0CDC, $0CDD, $0CDC, $0CDD
#_009DC2: dw $0CCC, $0CCD, $0CCC, $0CCD
#_009DCA: dw $0CDC, $0CDD, $0CDC, $0CDD

;---------------------------------------------------------------------------------------------------

#obj0280:
#_009DD2: dw $0CCC, $0CDC, $0CCD, $0CDD

;---------------------------------------------------------------------------------------------------

#obj0288:
#_009DDA: dw $1C13, $1C41, $1C13, $1C41
#_009DE2: dw $1C40, $1C42, $1C40, $1C42
#_009DEA: dw $1C13, $1C41, $1C13, $1C41
#_009DF2: dw $1C40, $1C42, $1C40, $1C42

;---------------------------------------------------------------------------------------------------

#obj02A8:
#_009DFA: dw $1576, $1577, $1576, $1577
#_009E02: dw $1578, $1579, $1578, $1579
#_009E0A: dw $1576, $1577, $1576, $1577
#_009E12: dw $1578, $1579, $1578, $1579

;---------------------------------------------------------------------------------------------------

#obj02C8:
#_009E1A: dw $0892, $0898, $08A4, $0CAD
#_009E22: dw $0893, $0899, $08A5, $8CAD

;---------------------------------------------------------------------------------------------------

#obj02D8:
#_009E2A: dw $4CAD, $48A4, $4898, $4892
#_009E32: dw $CCAD, $48A5, $4899, $4893

;---------------------------------------------------------------------------------------------------

#obj02E8:
#_009E3A: dw $0890, $0896, $08A2, $0CAC
#_009E42: dw $0891, $0897, $08A3, $4CAC

;---------------------------------------------------------------------------------------------------

#obj02F8:
#_009E4A: dw $8CAC, $88A2, $8896, $8890
#_009E52: dw $CCAC, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

#obj0308:
#_009E5A: dw $0843, $0844, $0871, $90AD
#_009E62: dw $0853, $0854, $0871, $10AD

;---------------------------------------------------------------------------------------------------

#obj0318:
#_009E6A: dw $D0AD, $4871, $4844, $4843
#_009E72: dw $50AD, $4871, $4854, $4853

;---------------------------------------------------------------------------------------------------

#obj0328:
#_009E7A: dw $0850, $0860, $0870, $50AC
#_009E82: dw $0851, $0861, $0870, $10AC

;---------------------------------------------------------------------------------------------------

#obj0338:
#_009E8A: dw $D0AC, $8870, $8860, $8850
#_009E92: dw $90AC, $8870, $8861, $8851
#_009E9A: dw $1C6B, $1C6B, $1C6B, $1C6B
#_009EA2: dw $1C6C, $1C8D, $5C8D, $5C6C
#_009EAA: dw $5C6B, $5C6B, $5C6B, $5C6B
#_009EB2: dw $1C6A, $1C6A, $1C6A, $1C6A
#_009EBA: dw $1C7A, $1C8E, $9C8E, $9C7A
#_009EC2: dw $9C6A, $9C6A, $9C6A, $9C6A

;---------------------------------------------------------------------------------------------------

#obj0378:
#_009ECA: dw $1C6B, $1C6B, $1C6C, $1C6C

;---------------------------------------------------------------------------------------------------

#obj0380:
#_009ED2: dw $5C6C, $5C6C, $5C6B, $5C6B

;---------------------------------------------------------------------------------------------------

#obj0388:
#_009EDA: dw $1C6A, $1C7A, $1C6A, $1C7A

;---------------------------------------------------------------------------------------------------

#obj0390:
#_009EE2: dw $9C7A, $9C6A, $9C7A, $9C6A

;---------------------------------------------------------------------------------------------------

#obj0398:
#_009EEA: dw $1C7B, $1C6B, $1C6A, $1C45

;---------------------------------------------------------------------------------------------------

#obj03A0:
#_009EF2: dw $1C6B, $9C7B, $9C45, $9C6A

;---------------------------------------------------------------------------------------------------

#obj03A8:
#_009EFA: dw $1C6A, $5C45, $5C7B, $5C6B

;---------------------------------------------------------------------------------------------------

#obj03B0:
#_009F02: dw $DC45, $9C6A, $5C6B, $DC7B

;---------------------------------------------------------------------------------------------------

#obj03B8:
#_009F0A: dw $1C7C, $1C7A, $1C6C, $1C55

;---------------------------------------------------------------------------------------------------

#obj03C0:
#_009F12: dw $9C7A, $9C7C, $9C55, $1C6C

;---------------------------------------------------------------------------------------------------

#obj03C8:
#_009F1A: dw $5C6C, $5C55, $5C7C, $1C7A

;---------------------------------------------------------------------------------------------------

#obj03D0:
#_009F22: dw $DC55, $5C6C, $9C7A, $DC7C

;---------------------------------------------------------------------------------------------------

#obj03D8:
#_009F2A: dw $3C15, $3C15, $3C15, $3C15

;---------------------------------------------------------------------------------------------------

#obj03E0:
#_009F32: dw $0951, $0961, $0941, $0971
#_009F3A: dw $8951, $8961, $8941, $8971

;---------------------------------------------------------------------------------------------------

#obj03F0:
#_009F42: dw $4971, $4941, $4961, $4951
#_009F4A: dw $C971, $C941, $C961, $C951

;---------------------------------------------------------------------------------------------------

#obj0400:
#_009F52: dw $0950, $0960, $0940, $0970
#_009F5A: dw $4950, $4960, $4940, $4970

;---------------------------------------------------------------------------------------------------

#obj0410:
#_009F62: dw $8970, $8940, $8960, $8950
#_009F6A: dw $C970, $C940, $C960, $C950

;---------------------------------------------------------------------------------------------------

#obj0420:
#_009F72: dw $0880, $0881, $089A, $089B
#_009F7A: dw $14AB

;---------------------------------------------------------------------------------------------------

#obj042A:
#_009F7C: dw $94AB, $889B, $889A, $8881
#_009F84: dw $8880

;---------------------------------------------------------------------------------------------------

#obj0434:
#_009F86: dw $4880, $4881, $489A, $489B
#_009F8E: dw $54AB

;---------------------------------------------------------------------------------------------------

#obj043E:
#_009F90: dw $D4AB, $C89B, $C89A, $C881
#_009F98: dw $C880

;---------------------------------------------------------------------------------------------------

#obj0448:
#_009F9A: dw $0880, $0881, $089A, $089B
#_009FA2: dw $0CAB

;---------------------------------------------------------------------------------------------------

#obj0452:
#_009FA4: dw $8CAB, $889B, $889A, $8881
#_009FAC: dw $8880

;---------------------------------------------------------------------------------------------------

#obj045C:
#_009FAE: dw $4880, $4881, $489A, $489B
#_009FB6: dw $4CAB

;---------------------------------------------------------------------------------------------------

#obj0466:
#_009FB8: dw $CCAB, $C89B, $C89A, $C881
#_009FC0: dw $C880

;---------------------------------------------------------------------------------------------------

#obj0470:
#_009FC2: dw $0880, $0881, $089A, $089B
#_009FCA: dw $10AB

;---------------------------------------------------------------------------------------------------

#obj047A:
#_009FCC: dw $90AB, $889B, $889A, $8881
#_009FD4: dw $8880

;---------------------------------------------------------------------------------------------------

#obj0484:
#_009FD6: dw $4880, $4881, $489A, $489B
#_009FDE: dw $50AB

;---------------------------------------------------------------------------------------------------

#obj048E:
#_009FE0: dw $D0AB, $C89B, $C89A, $C881
#_009FE8: dw $C880

;---------------------------------------------------------------------------------------------------

#obj0498:
#_009FEA: dw $0849, $084A, $084B, $089C
#_009FF2: dw $18AB

;---------------------------------------------------------------------------------------------------

#obj04A2:
#_009FF4: dw $98AB, $889C, $884B, $884A
#_009FFC: dw $8849

;---------------------------------------------------------------------------------------------------

#obj04AC:
#_009FFE: dw $4849, $484A, $484B, $489C
#_00A006: dw $58AB

;---------------------------------------------------------------------------------------------------

#obj04B6:
#_00A008: dw $D8AB, $C89C, $C84B, $C84A
#_00A010: dw $C849

;---------------------------------------------------------------------------------------------------

#obj04C0:
#_00A012: dw $0849, $084A, $084B, $089C
#_00A01A: dw $10AB

;---------------------------------------------------------------------------------------------------

#obj04CA:
#_00A01C: dw $90AB, $889C, $884B, $884A
#_00A024: dw $8849

;---------------------------------------------------------------------------------------------------

#obj04D4:
#_00A026: dw $4849, $484A, $484B, $489C
#_00A02E: dw $50AB

;---------------------------------------------------------------------------------------------------

#obj04DE:
#_00A030: dw $D0AB, $C89C, $C84B, $C84A
#_00A038: dw $C849

;---------------------------------------------------------------------------------------------------

#obj04E8:
#_00A03A: dw $0849, $084A, $084B, $089C
#_00A042: dw $10AB

;---------------------------------------------------------------------------------------------------

#obj04F2:
#_00A044: dw $90AB, $889C, $884B, $884A
#_00A04C: dw $8849

;---------------------------------------------------------------------------------------------------

#obj04FC:
#_00A04E: dw $4849, $484A, $484B, $489C
#_00A056: dw $50AB

;---------------------------------------------------------------------------------------------------

#obj0506:
#_00A058: dw $D0AB, $C89C, $C84B, $C84A
#_00A060: dw $C849

;---------------------------------------------------------------------------------------------------

#obj0510:
#_00A062: dw $1DAA, $1DAC, $1DAC, $1D8B
#_00A06A: dw $1DAD, $1D8C, $1D8B, $1DAF
#_00A072: dw $1DA5, $1D8B, $1DAF, $1DA6
#_00A07A: dw $1D8B, $1DAF, $1DA6, $1D8B
#_00A082: dw $1DAF, $5DA5, $1D8B, $5DAD
#_00A08A: dw $5D8C, $5DAA, $5DAC, $5DAC
#_00A092: dw $1DAC, $1D8C, $1DA7, $1DAC
#_00A09A: dw $1D8C, $1DA7, $1DA9, $1DA9
#_00A0A2: dw $1DA9, $1DA9, $5DA7, $5D8C
#_00A0AA: dw $5DAC, $5DA7, $5D8C, $5DAC
#_00A0B2: dw $1DAC, $1DAC, $1DAB, $1D8C
#_00A0BA: dw $1D9C, $1D9B, $9DA5, $1DAE
#_00A0C2: dw $1D9B, $9DA6, $1DAE, $1D9B
#_00A0CA: dw $9DA6, $1DAE, $1D9B, $DDA5
#_00A0D2: dw $1DAE, $1D9B, $5D8C, $5D9C
#_00A0DA: dw $1D9B, $5DAC, $5DAC, $5DAB

;---------------------------------------------------------------------------------------------------

#obj0590:
#_00A0E2: dw $1DA8, $9DA8, $5DA8, $DDA8

;---------------------------------------------------------------------------------------------------

#obj0598:
#_00A0EA: dw $1D9D, $1D8D, $1D8D, $1D72
#_00A0F2: dw $1D72, $1D72, $5D9D, $5D8D
#_00A0FA: dw $5D8D

;---------------------------------------------------------------------------------------------------

#obj05AA:
#_00A0FC: dw $01E9, $01E9, $01E9, $01E9

;---------------------------------------------------------------------------------------------------

#obj05B2:
#_00A104: dw $18C9, $18C9, $18C9, $18C9

;---------------------------------------------------------------------------------------------------

#obj05BA:
#_00A10C: dw $09DA, $09DE, $09DB, $01E9
#_00A114: dw $09DB, $01E9, $49DA, $49DE
#_00A11C: dw $09DE, $09DC, $01E9, $09DD
#_00A124: dw $01E9, $09DD, $49DE, $49DC

;---------------------------------------------------------------------------------------------------

#obj05DA:
#_00A12C: dw $09DB, $01E9, $01E9, $09DD
#_00A134: dw $09DB, $01E9, $01E9, $09DD
#_00A13C: dw $09DB, $01E9, $01E9, $09DD
#_00A144: dw $09DB, $01E9, $01E9, $09DD

;---------------------------------------------------------------------------------------------------

#obj05FA:
#_00A14C: dw $08E1, $08E3, $08E1

;---------------------------------------------------------------------------------------------------

#obj0600:
#_00A152: dw $08E1, $08E2, $08E1

;---------------------------------------------------------------------------------------------------

#obj0606:
#_00A158: dw $08E0, $08F0, $48E0, $48F0
#_00A160: dw $08F3, $48F3, $08E0, $08F1
#_00A168: dw $08E4, $48E0, $48F1, $48E4

;---------------------------------------------------------------------------------------------------

#obj061E:
#_00A170: dw $08E0, $08F1, $08E4, $48E0
#_00A178: dw $48F1, $48E4, $08F4, $08F2
#_00A180: dw $08E5, $08E0, $08F1, $08E4
#_00A188: dw $48E0, $48F1, $48E4

;---------------------------------------------------------------------------------------------------

#obj063C:
#_00A18E: dw $09DA, $09DB, $49DA

;---------------------------------------------------------------------------------------------------

#obj0642:
#_00A194: dw $09DC, $09DD, $49DC

;---------------------------------------------------------------------------------------------------

#obj0648:
#_00A19A: dw $09DE

;---------------------------------------------------------------------------------------------------

#obj064A:
#_00A19C: dw $49DE

;---------------------------------------------------------------------------------------------------

#obj064C:
#_00A19E: dw $09DF, $09DD, $49DF

;---------------------------------------------------------------------------------------------------

#obj0652:
#_00A1A4: dw $89DF, $09DB, $C9DF

;---------------------------------------------------------------------------------------------------

#obj0658:
#_00A1AA: dw $09DF, $09DD, $49DC

;---------------------------------------------------------------------------------------------------

#obj065E:
#_00A1B0: dw $09DC, $09DD, $49DF

;---------------------------------------------------------------------------------------------------

#obj0664:
#_00A1B6: dw $89DF, $09DB, $49DA

;---------------------------------------------------------------------------------------------------

#obj066A:
#_00A1BC: dw $09DA, $09DB, $C9DF

;---------------------------------------------------------------------------------------------------

#obj0670:
#_00A1C2: dw $08E3, $4846, $4843, $4869
#_00A1CA: dw $4853, $C846

;---------------------------------------------------------------------------------------------------

#obj067C:
#_00A1CE: dw $08E3, $0846, $0843, $0869
#_00A1D6: dw $0853, $8846

;---------------------------------------------------------------------------------------------------

#obj0688:
#_00A1DA: dw $08E2, $8846, $8850, $8868
#_00A1E2: dw $8851, $C846

;---------------------------------------------------------------------------------------------------

#obj0694:
#_00A1E6: dw $08E2, $0846, $0850, $0868
#_00A1EE: dw $0851, $4846

;---------------------------------------------------------------------------------------------------

#obj06A0:
#_00A1F2: dw $0852

;---------------------------------------------------------------------------------------------------

#obj06A2:
#_00A1F4: dw $4852

;---------------------------------------------------------------------------------------------------

#obj06A4:
#_00A1F6: dw $085C

;---------------------------------------------------------------------------------------------------

#obj06A6:
#_00A1F8: dw $885C

;---------------------------------------------------------------------------------------------------

#obj06A8:
#_00A1FA: dw $1CC6, $1CC6, $1CC6, $1CC6
#_00A202: dw $1CC6, $1CC6, $1CC6, $1CC6
#_00A20A: dw $1CC6, $1CC6, $1CC6, $1CC6
#_00A212: dw $1CC6, $1CC6, $1CC6, $1CC6

;---------------------------------------------------------------------------------------------------

#obj06C8:
#_00A21A: dw $0973, $28A0, $28A1, $A8A1
#_00A222: dw $A8A0, $0867, $09EF, $09EF
#_00A22A: dw $8867, $0865, $085A, $885A
#_00A232: dw $8865, $4865, $485A, $C85A
#_00A23A: dw $C865, $4867, $09EF, $09EF
#_00A242: dw $C867, $68A0, $68A1, $E8A1
#_00A24A: dw $E8A0, $28A0, $28A1, $A8A1
#_00A252: dw $A8A0, $0867, $09EF, $09EF
#_00A25A: dw $8867, $0865, $085A, $885A
#_00A262: dw $8865, $4865, $485A, $C85A
#_00A26A: dw $C865, $4867, $09EF, $09EF
#_00A272: dw $C867, $68A0, $68A1, $E8A1
#_00A27A: dw $E8A0

;---------------------------------------------------------------------------------------------------

#obj072A:
#_00A27C: dw $294E, $2893, $0892, $01EC
#_00A284: dw $295E, $0898, $01EC, $01EC
#_00A28C: dw $096E, $0893, $0899, $08A5
#_00A294: dw $0892, $0898, $08A4, $0893
#_00A29C: dw $A893, $A94E, $0899, $A95E
#_00A2A4: dw $01EC, $896E, $01EC, $01EC

;---------------------------------------------------------------------------------------------------

#obj075A:
#_00A2AC: dw $01EC, $01EC, $496E, $01EC
#_00A2B4: dw $695E, $4898, $694E, $6893
#_00A2BC: dw $4892, $48A5, $4899, $4893
#_00A2C4: dw $48A4, $4898, $4892, $C96E
#_00A2CC: dw $01EC, $01EC, $4899, $E95E
#_00A2D4: dw $01EC, $4893, $E893, $E94E

;---------------------------------------------------------------------------------------------------

#obj078A:
#_00A2DC: dw $096E, $1148, $1168, $1159
#_00A2E4: dw $496E, $1149, $1169, $5159
#_00A2EC: dw $096E, $5149, $5169, $1159
#_00A2F4: dw $496E, $5148, $5168, $5159

;---------------------------------------------------------------------------------------------------

#obj07AA:
#_00A2FC: dw $097E, $897E, $097E, $897E
#_00A304: dw $11AE, $1146, $9146, $91AE
#_00A30C: dw $11AF, $1166, $9166, $91AF
#_00A314: dw $1156, $9156, $1156, $9156

;---------------------------------------------------------------------------------------------------

#obj07CA:
#_00A31C: dw $5156, $D156, $5156, $D156
#_00A324: dw $51AF, $1167, $9167, $D1AF
#_00A32C: dw $51AE, $1147, $9147, $D1AE
#_00A334: dw $497E, $C97E, $497E, $C97E

;---------------------------------------------------------------------------------------------------

#obj07EA:
#_00A33C: dw $096E, $115E, $1178, $1158
#_00A344: dw $496E, $114E, $1177, $1174
#_00A34C: dw $096E, $114E, $5177, $5174
#_00A354: dw $496E, $515E, $5178, $5158

;---------------------------------------------------------------------------------------------------

#obj080A:
#_00A35C: dw $097E, $897E, $097E, $897E
#_00A364: dw $11AC, $11AD, $11AD, $91AC
#_00A36C: dw $1179, $1176, $9176, $9179
#_00A374: dw $1157, $1175, $9175, $9157

;---------------------------------------------------------------------------------------------------

#obj082A:
#_00A37C: dw $5157, $5175, $D175, $D157
#_00A384: dw $5179, $5176, $D176, $D179
#_00A38C: dw $51AC, $51AD, $51AD, $D1AC
#_00A394: dw $497E, $C97E, $497E, $C97E

;---------------------------------------------------------------------------------------------------

#obj084A:
#_00A39C: dw $28E7, $28F7, $28E6, $08F6
#_00A3A4: dw $68E7, $68F7, $68E6, $48F6

;---------------------------------------------------------------------------------------------------

#obj085A:
#_00A3AC: dw $2DC2, $2DC3, $2D2C, $0D3C
#_00A3B4: dw $6DC2, $6DC3, $6D2C, $4D3C

;---------------------------------------------------------------------------------------------------

#obj086A:
#_00A3BC: dw $0942, $1162, $1152, $0943
#_00A3C4: dw $1163, $1153, $4943, $5163
#_00A3CC: dw $5153, $4942, $5162, $5152

;---------------------------------------------------------------------------------------------------

#obj0882:
#_00A3D4: dw $9152, $9162, $8942, $9153
#_00A3DC: dw $9163, $8943, $D153, $D163
#_00A3E4: dw $C943, $D152, $D162, $C942

;---------------------------------------------------------------------------------------------------

#obj089A:
#_00A3EC: dw $0944, $0954, $8954, $8944
#_00A3F4: dw $1164, $1165, $9165, $9164
#_00A3FC: dw $1145, $1155, $9155, $9145

;---------------------------------------------------------------------------------------------------

#obj08B2:
#_00A404: dw $5145, $5155, $D155, $D145
#_00A40C: dw $5164, $5165, $D165, $D164
#_00A414: dw $4944, $4954, $C954, $C944

;---------------------------------------------------------------------------------------------------

#obj08CA:
#_00A41C: dw $1548, $1549, $5548, $5549
#_00A424: dw $1548, $1549, $5548, $5549

;---------------------------------------------------------------------------------------------------

#obj08DA:
#_00A42C: dw $1587, $1588, $5588, $5587
#_00A434: dw $1597, $1598, $5598, $5597
#_00A43C: dw $1589, $158A, $558A, $5589
#_00A444: dw $1599, $159A, $559A, $5599

;---------------------------------------------------------------------------------------------------

#obj08FA:
#_00A44C: dw $0980, $0990, $4980, $4990

;---------------------------------------------------------------------------------------------------

#obj0902:
#_00A454: dw $8990, $8980, $C990, $C980

;---------------------------------------------------------------------------------------------------

#obj090A:
#_00A45C: dw $0981, $8981, $0991, $8991

;---------------------------------------------------------------------------------------------------

#obj0912:
#_00A464: dw $4991, $C991, $4981, $C981

;---------------------------------------------------------------------------------------------------

#obj091A:
#_00A46C: dw $1DFE, $1DFC, $5DFE

;---------------------------------------------------------------------------------------------------

#obj0920:
#_00A472: dw $9DFE, $9DFC, $DDFE

;---------------------------------------------------------------------------------------------------

#obj0926:
#_00A478: dw $1DFD

;---------------------------------------------------------------------------------------------------

#obj0928:
#_00A47A: dw $5DFD

;---------------------------------------------------------------------------------------------------

#obj092A:
#_00A47C: dw $DDFF, $9DFC, $9DFF

;---------------------------------------------------------------------------------------------------

#obj0930:
#_00A482: dw $5DFF, $1DFC, $1DFF

;---------------------------------------------------------------------------------------------------

#obj0936:
#_00A488: dw $DDFF, $9DFC, $DDFE

;---------------------------------------------------------------------------------------------------

#obj093C:
#_00A48E: dw $9DFE, $9DFC, $9DFF

;---------------------------------------------------------------------------------------------------

#obj0942:
#_00A494: dw $5DFF, $1DFC, $5DFE

;---------------------------------------------------------------------------------------------------

#obj0948:
#_00A49A: dw $1DFE, $1DFC, $1DFF

;---------------------------------------------------------------------------------------------------

#obj094E:
#_00A4A0: dw $1DF7, $1C40, $1C41, $1C42
#_00A4A8: dw $1DB5, $1DB2, $1DB3, $1DB3
#_00A4B0: dw $1DB4, $1DB5, $5DF7, $5C40
#_00A4B8: dw $5C41, $5C42, $5DB5

;---------------------------------------------------------------------------------------------------

#obj096C:
#_00A4BE: dw $1DF7, $1C40, $1DB5, $1DB2
#_00A4C6: dw $1DB3, $1DB5, $5DF7, $5C40
#_00A4CE: dw $5DB5

;---------------------------------------------------------------------------------------------------

#obj097E:
#_00A4D0: dw $0C14, $0C14, $0C14, $0C14
#_00A4D8: dw $8C14, $8C14, $8C14, $8C14

;---------------------------------------------------------------------------------------------------

#obj098E:
#_00A4E0: dw $0C64, $0C66, $0C64, $0C66
#_00A4E8: dw $0C64, $0C66, $0C64, $0C66

;---------------------------------------------------------------------------------------------------

#obj099E:
#_00A4F0: dw $0D46, $0D56, $157E, $0D47
#_00A4F8: dw $0D57, $157F, $4D46, $4D56
#_00A500: dw $557E

;---------------------------------------------------------------------------------------------------

#obj09B0:
#_00A502: dw $0D46, $4D46, $8DAB, $4DAB

;---------------------------------------------------------------------------------------------------

#obj09B8:
#_00A50A: dw $0D46, $0DAB, $0D47, $4DAD

;---------------------------------------------------------------------------------------------------

#obj09C0:
#_00A512: dw $0DAB, $0D56, $4DAC, $0D57

;---------------------------------------------------------------------------------------------------

#obj09C8:
#_00A51A: dw $0D47, $0DAD, $4D46, $4DAB

;---------------------------------------------------------------------------------------------------

#obj09D0:
#_00A522: dw $0DAC, $0D57, $4DAB, $4D56

;---------------------------------------------------------------------------------------------------

#obj09D8:
#_00A52A: dw $0940, $0960, $0950, $0970
#_00A532: dw $0941, $0961, $0951, $0971
#_00A53A: dw $4941, $4961, $4951, $4971
#_00A542: dw $4940, $4960, $4950, $4970

;---------------------------------------------------------------------------------------------------

#obj09F8:
#_00A54A: dw $0D42

;---------------------------------------------------------------------------------------------------

#obj09FA:
#_00A54C: dw $0D52

;---------------------------------------------------------------------------------------------------

#obj09FC:
#_00A54E: dw $0D40

;---------------------------------------------------------------------------------------------------

#obj09FE:
#_00A550: dw $0D50

;---------------------------------------------------------------------------------------------------

#obj0A00:
#_00A552: dw $0D41

;---------------------------------------------------------------------------------------------------

#obj0A02:
#_00A554: dw $0D51

;---------------------------------------------------------------------------------------------------

#obj0A04:
#_00A556: dw $0D8E

;---------------------------------------------------------------------------------------------------

#obj0A06:
#_00A558: dw $0D8F

;---------------------------------------------------------------------------------------------------

#obj0A08:
#_00A55A: dw $0D9E

;---------------------------------------------------------------------------------------------------

#obj0A0A:
#_00A55C: dw $0D9F

;---------------------------------------------------------------------------------------------------

#obj0A0C:
#_00A55E: dw $0D43

;---------------------------------------------------------------------------------------------------

#obj0A0E:
#_00A560: dw $0D53

;---------------------------------------------------------------------------------------------------

#obj0A10:
#_00A562: dw $0DA9

;---------------------------------------------------------------------------------------------------

#obj0A12:
#_00A564: dw $0DA8

;---------------------------------------------------------------------------------------------------

#obj0A14:
#_00A566: dw $09C8, $0DC6, $4DC6, $49C8
#_00A56E: dw $09CA, $0D02, $4D02, $49CA

;---------------------------------------------------------------------------------------------------

#obj0A24:
#_00A576: dw $89CA, $8D02, $CD02, $C9CA
#_00A57E: dw $89C8, $8DC6, $CDC6, $C9C8

;---------------------------------------------------------------------------------------------------

#obj0A34:
#_00A586: dw $09C9, $0DC7, $8DC7, $89C9
#_00A58E: dw $09CB, $0D03, $8D03, $89CB

;---------------------------------------------------------------------------------------------------

#obj0A44:
#_00A596: dw $49CB, $4D03, $CD03, $C9CB
#_00A59E: dw $49C9, $4DC7, $CDC7, $C9C9

;---------------------------------------------------------------------------------------------------

#obj0A54:
#_00A5A6: dw $0944, $0954, $8954, $8944
#_00A5AE: dw $1164, $1165, $9165, $9164
#_00A5B6: dw $1145, $1155, $9155, $9145

;---------------------------------------------------------------------------------------------------

#obj0A6C:
#_00A5BE: dw $5145, $5155, $D155, $D145
#_00A5C6: dw $5164, $5165, $D165, $D164
#_00A5CE: dw $4944, $4954, $C954, $C944

;---------------------------------------------------------------------------------------------------

#obj0A84:
#_00A5D6: dw $1146, $1147, $9147, $9146
#_00A5DE: dw $1166, $1167, $9167, $9166
#_00A5E6: dw $1156, $1157, $9157, $9156

;---------------------------------------------------------------------------------------------------

#obj0A9C:
#_00A5EE: dw $5156, $5157, $D157, $D156
#_00A5F6: dw $5166, $5167, $D167, $D166
#_00A5FE: dw $5146, $5147, $D147, $D146

;---------------------------------------------------------------------------------------------------

#obj0AB4:
#_00A606: dw $098E, $098E, $099E, $1CC6
#_00A60E: dw $1CC6, $099F, $1CC6, $498F
#_00A616: dw $499E, $1CC6, $0972, $0972
#_00A61E: dw $1CC6, $098F, $099E, $1CC6
#_00A626: dw $1CC6, $099F, $498E, $498E
#_00A62E: dw $499E

;---------------------------------------------------------------------------------------------------

#obj0ADE:
#_00A630: dw $0DE6, $0DF6, $4DE6, $4DF6

;---------------------------------------------------------------------------------------------------

#obj0AE6:
#_00A638: dw $1DA9, $1DA9, $1DA9, $1DA9
#_00A640: dw $1DA9, $1DA9, $1DA9, $1DA9
#_00A648: dw $1DA9, $1DA9, $1DA9, $1DA9
#_00A650: dw $1DA9, $1DA9, $1DA9, $1DA9

;---------------------------------------------------------------------------------------------------

#obj0B06:
#_00A658: dw $9DA8, $9DA6, $DDA8

;---------------------------------------------------------------------------------------------------

#obj0B0C:
#_00A65E: dw $1DA8, $1DA6, $5DA8

;---------------------------------------------------------------------------------------------------

#obj0B12:
#_00A664: dw $1DA7

;---------------------------------------------------------------------------------------------------

#obj0B14:
#_00A666: dw $5DA7

;---------------------------------------------------------------------------------------------------

#obj0B16:
#_00A668: dw $4D66, $1D64, $1D44, $1D54
#_00A670: dw $0D66, $5D64, $5D44, $5D54

;---------------------------------------------------------------------------------------------------

#obj0B26:
#_00A678: dw $0946, $0966, $0956, $0CAC
#_00A680: dw $0947, $0967, $0957, $4CAC

;---------------------------------------------------------------------------------------------------

#obj0B36:
#_00A688: dw $8CAC, $8956, $8966, $8946
#_00A690: dw $CCAC, $8957, $8967, $8947

;---------------------------------------------------------------------------------------------------

#obj0B46:
#_00A698: dw $0948, $0968, $0958, $0CAD
#_00A6A0: dw $0949, $0969, $0959, $8CAD

;---------------------------------------------------------------------------------------------------

#obj0B56:
#_00A6A8: dw $4CAD, $4958, $4968, $4948
#_00A6B0: dw $CCAD, $4959, $4969, $4949

;---------------------------------------------------------------------------------------------------

#obj0B66:
#_00A6B8: dw $0894, $0893, $0892, $0893
#_00A6C0: dw $0891, $089E, $0898, $0899
#_00A6C8: dw $0890, $0896, $08A6, $08A5
#_00A6D0: dw $0891, $0897, $08A3, $0CAE

;---------------------------------------------------------------------------------------------------

#obj0B86:
#_00A6D8: dw $0892, $0893, $0892, $8894
#_00A6E0: dw $0898, $0899, $889E, $8891
#_00A6E8: dw $08A4, $88A6, $8896, $8890
#_00A6F0: dw $8CAE, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

#obj0BA6:
#_00A6F8: dw $0890, $0896, $08A2, $4CAE
#_00A700: dw $0891, $0897, $48A6, $48A5
#_00A708: dw $0890, $489E, $4898, $4899
#_00A710: dw $4894, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

#obj0BC6:
#_00A718: dw $CCAE, $88A2, $8896, $8890
#_00A720: dw $48A4, $C8A6, $8897, $8891
#_00A728: dw $4898, $4899, $C89E, $8890
#_00A730: dw $4892, $4893, $4892, $C894

;---------------------------------------------------------------------------------------------------

#obj0BE6:
#_00A738: dw $0846, $0843, $0853, $0843
#_00A740: dw $0850, $0847, $0854, $0844
#_00A748: dw $0851, $0861, $0848, $0871
#_00A750: dw $0850, $0860, $0870, $10AE

;---------------------------------------------------------------------------------------------------

#obj0C06:
#_00A758: dw $0853, $0843, $0853, $8846
#_00A760: dw $0854, $0844, $8847, $8850
#_00A768: dw $0871, $8848, $8861, $8851
#_00A770: dw $90AE, $8870, $8860, $8850

;---------------------------------------------------------------------------------------------------

#obj0C26:
#_00A778: dw $0851, $0861, $0870, $50AE
#_00A780: dw $0850, $0860, $4848, $4871
#_00A788: dw $0851, $4847, $4854, $4844
#_00A790: dw $4846, $4843, $4853, $4843

;---------------------------------------------------------------------------------------------------

#obj0C46:
#_00A798: dw $D0AE, $8870, $8861, $8851
#_00A7A0: dw $4871, $C848, $8860, $8850
#_00A7A8: dw $4854, $4844, $C847, $8851
#_00A7B0: dw $4853, $4843, $4853, $C846

;---------------------------------------------------------------------------------------------------

#obj0C66:
#_00A7B8: dw $0895, $0896, $08A2, $0CAC
#_00A7C0: dw $0898, $089F, $08A3, $4CAC
#_00A7C8: dw $08A4, $08A5, $08A7, $0CAC
#_00A7D0: dw $0CAD, $8CAD, $0CAD, $0CAF

;---------------------------------------------------------------------------------------------------

#obj0C86:
#_00A7D8: dw $8CAC, $88A2, $8896, $8895
#_00A7E0: dw $CCAC, $88A3, $889F, $0899
#_00A7E8: dw $8CAC, $88A7, $08A4, $08A5
#_00A7F0: dw $8CAF, $8CAD, $0CAD, $0CAD

;---------------------------------------------------------------------------------------------------

#obj0CA6:
#_00A7F8: dw $4CAD, $CCAD, $4CAD, $4CAF
#_00A800: dw $48A4, $48A5, $48A7, $4CAC
#_00A808: dw $4898, $489F, $08A2, $0CAC
#_00A810: dw $4895, $0897, $08A3, $4CAC

;---------------------------------------------------------------------------------------------------

#obj0CC6:
#_00A818: dw $CCAF, $CCAD, $4CAD, $CCAD
#_00A820: dw $CCAC, $C8A7, $48A4, $48A5
#_00A828: dw $8CAC, $88A2, $C89F, $4899
#_00A830: dw $CCAC, $88A3, $8897, $C895

;---------------------------------------------------------------------------------------------------

#obj0CE6:
#_00A838: dw $0856, $0861, $0870, $10AC
#_00A840: dw $0854, $0857, $0870, $50AC
#_00A848: dw $0871, $0871, $0858, $10AC
#_00A850: dw $10AD, $90AD, $10AD, $10AF

;---------------------------------------------------------------------------------------------------

#obj0D06:
#_00A858: dw $90AC, $8870, $8861, $8856
#_00A860: dw $D0AC, $8870, $8857, $0844
#_00A868: dw $90AC, $8858, $0871, $0871
#_00A870: dw $90AF, $90AD, $10AD, $90AD

;---------------------------------------------------------------------------------------------------

#obj0D26:
#_00A878: dw $50AD, $D0AD, $50AD, $50AF
#_00A880: dw $4871, $4871, $4858, $50AC
#_00A888: dw $4854, $4857, $0870, $10AC
#_00A890: dw $4856, $0860, $0870, $50AC

;---------------------------------------------------------------------------------------------------

#obj0D46:
#_00A898: dw $D0AF, $D0AD, $50AD, $D0AD
#_00A8A0: dw $D0AC, $C858, $4871, $4871
#_00A8A8: dw $90AC, $8870, $C857, $4844
#_00A8B0: dw $D0AC, $8870, $8860, $C856

;---------------------------------------------------------------------------------------------------

#obj0D66:
#_00A8B8: dw $0861, $0870, $50AE, $50AF
#_00A8C0: dw $0860, $4848, $4858, $10AC
#_00A8C8: dw $4847, $4857, $0870, $50AC

;---------------------------------------------------------------------------------------------------

#obj0D7E:
#_00A8D0: dw $D0AF, $D0AE, $8870, $8861
#_00A8D8: dw $90AC, $C858, $C848, $8860
#_00A8E0: dw $D0AC, $8870, $C857, $C847

;---------------------------------------------------------------------------------------------------

#obj0D96:
#_00A8E8: dw $0847, $0857, $0870, $50AC
#_00A8F0: dw $0861, $0848, $0858, $10AC
#_00A8F8: dw $0860, $0870, $10AE, $10AF

;---------------------------------------------------------------------------------------------------

#obj0DAE:
#_00A900: dw $D0AC, $8870, $8857, $8847
#_00A908: dw $90AC, $8858, $8848, $8861
#_00A910: dw $90AF, $90AE, $8870, $8860

;---------------------------------------------------------------------------------------------------

#obj0DC6:
#_00A918: dw $0854, $0844, $8847, $0871
#_00A920: dw $8848, $8857, $90AE, $8858
#_00A928: dw $0871, $90AF, $90AD, $10AD

;---------------------------------------------------------------------------------------------------

#obj0DDE:
#_00A930: dw $0847, $0854, $0844, $0857
#_00A938: dw $0848, $0871, $0871, $0858
#_00A940: dw $10AE, $90AD, $10AD, $10AF

;---------------------------------------------------------------------------------------------------

#obj0DF6:
#_00A948: dw $D0AF, $D0AD, $50AD, $D0AE
#_00A950: dw $C858, $4871, $4871, $C848
#_00A958: dw $C857, $4854, $4844, $C847

;---------------------------------------------------------------------------------------------------

#obj0E0E:
#_00A960: dw $D0AD, $50AD, $50AF, $4871
#_00A968: dw $4858, $50AE, $4857, $4848
#_00A970: dw $4871, $4847, $4854, $4844

;---------------------------------------------------------------------------------------------------

#obj0E26:
#_00A978: dw $0D00, $0D10, $0D12, $4D00
#_00A980: dw $0D11, $0D13

;---------------------------------------------------------------------------------------------------

#obj0E32:
#_00A984: dw $0D04, $0D14, $0D24, $0D34
#_00A98C: dw $0D05, $0D15, $0D25, $0D35
#_00A994: dw $4D05, $4D15, $4D25, $4D35
#_00A99C: dw $4D04, $4D14, $4D24, $4D34

;---------------------------------------------------------------------------------------------------

#obj0E52:
#_00A9A4: dw $0922, $0932, $0923, $0933

;---------------------------------------------------------------------------------------------------

#obj0E5A:
#_00A9AC: dw $0DE5, $0DF5, $4DE5, $4DF5

;---------------------------------------------------------------------------------------------------

#obj0E62:
#_00A9B4: dw $0DE3, $0DF3, $0DE4, $0DF4

;---------------------------------------------------------------------------------------------------

#obj0E6A:
#_00A9BC: dw $4DE4, $4DF4, $4DE3, $4DF3

;---------------------------------------------------------------------------------------------------

#obj0E72:
#_00A9C4: dw $8DF3, $8DE3, $8DF4, $8DE4

;---------------------------------------------------------------------------------------------------

#obj0E7A:
#_00A9CC: dw $CDF4, $CDE4, $CDF3, $CDE3

;---------------------------------------------------------------------------------------------------

#obj0E82:
#_00A9D4: dw $0D28, $0D38, $4D28, $4D38

;---------------------------------------------------------------------------------------------------

#obj0E8A:
#_00A9DC: dw $0D2A, $0D3A, $0D2B, $0D3B

;---------------------------------------------------------------------------------------------------

#obj0E92:
#_00A9E4: dw $0D01, $0D1C, $4D01, $4D1C

;---------------------------------------------------------------------------------------------------

#obj0E9A:
#_00A9EC: dw $0DEE, $8DEE, $4DEE, $CDEE

;---------------------------------------------------------------------------------------------------

#obj0EA2:
#_00A9F4: dw $0DED, $8DED, $4DED, $CDED

;---------------------------------------------------------------------------------------------------

#obj0EAA:
#_00A9FC: dw $0CD2, $0CEB, $0CD3, $0CFB

;---------------------------------------------------------------------------------------------------

#obj0EB2:
#_00AA04: dw $0CEE, $0CFE, $0CEF, $0CFF

;---------------------------------------------------------------------------------------------------

#obj0EBA:
#_00AA0C: dw $0CD4, $0CD6, $0CD5, $0CD7

;---------------------------------------------------------------------------------------------------

#obj0EC2:
#_00AA14: dw $0DE0, $0DF0, $4DE0, $4DF0

;---------------------------------------------------------------------------------------------------

#obj0ECA:
#_00AA1C: dw $0DC0, $0DC1, $4DC0, $4DC1

;---------------------------------------------------------------------------------------------------

#obj0ED2:
#_00AA24: dw $094D, $095D, $096D, $494D
#_00AA2C: dw $495D, $496D

;---------------------------------------------------------------------------------------------------

#obj0EDE:
#_00AA30: dw $1587, $1589, $1599, $1588
#_00AA38: dw $158A, $159A, $5588, $558A
#_00AA40: dw $559A, $5587, $5589, $5599

;---------------------------------------------------------------------------------------------------

#obj0EF6:
#_00AA48: dw $158C, $158D, $558D, $558C
#_00AA50: dw $159C, $159D, $559D, $559C
#_00AA58: dw $159C, $159D, $559D, $559C
#_00AA60: dw $159C, $159D, $559D, $559C
#_00AA68: dw $158B, $159B, $559B, $558B

;---------------------------------------------------------------------------------------------------

#obj0F1E:
#_00AA70: dw $154A, $155A, $156A, $157A
#_00AA78: dw $154B, $155B, $156B, $157B
#_00AA80: dw $554B, $555B, $556B, $557B
#_00AA88: dw $554A, $555A, $556A, $557A

;---------------------------------------------------------------------------------------------------

#obj0F3E:
#_00AA90: dw $1525, $1563, $1553, $1555
#_00AA98: dw $1526, $1564, $1554, $1556
#_00AAA0: dw $5526, $5564, $5554, $5556
#_00AAA8: dw $5525, $5563, $5553, $5555

;---------------------------------------------------------------------------------------------------

#obj0F5E:
#_00AAB0: dw $151D, $151E, $151F, $551D
#_00AAB8: dw $551E, $551F

;---------------------------------------------------------------------------------------------------

#obj0F6A:
#_00AABC: dw $1548, $1549, $5548, $5549

;---------------------------------------------------------------------------------------------------

#obj0F72:
#_00AAC4: dw $094A, $095A, $096A, $097A
#_00AACC: dw $094B, $095B, $096B, $097B
#_00AAD4: dw $494B, $495B, $496B, $497B
#_00AADC: dw $494A, $495A, $496A, $497A

;---------------------------------------------------------------------------------------------------

#obj0F92:
#_00AAE4: dw $0968, $0969, $4969, $4968
#_00AAEC: dw $0958, $0959, $4959, $4958

;---------------------------------------------------------------------------------------------------

#obj0FA2:
#_00AAF4: dw $1588, $156C, $556C, $5588
#_00AAFC: dw $157D, $157C, $557C, $557D

;---------------------------------------------------------------------------------------------------

#obj0FB2:
#_00AB04: dw $11A0, $11A1, $51A0, $11A2
#_00AB0C: dw $11A3, $51A2, $1194, $1195
#_00AB14: dw $5194

;---------------------------------------------------------------------------------------------------

#obj0FC4:
#_00AB16: dw $094E, $095E, $096E, $09AE
#_00AB1E: dw $094F, $095F, $096F, $09AF
#_00AB26: dw $094F, $095F, $096F, $09AF
#_00AB2E: dw $094F, $095F, $496F, $09AF
#_00AB36: dw $094F, $095F, $096F, $09AF
#_00AB3E: dw $494E, $495E, $496E, $49AE

;---------------------------------------------------------------------------------------------------

#obj0FF4:
#_00AB46: dw $8D84, $0D84, $0976, $8D85
#_00AB4E: dw $0D85, $0977, $0D86, $0D96
#_00AB56: dw $0977, $4D86, $4D96, $4977
#_00AB5E: dw $CD85, $4D85, $4977, $CD84
#_00AB66: dw $4D84, $4976

;---------------------------------------------------------------------------------------------------

#obj1018:
#_00AB6A: dw $0978, $0979, $4978, $4979

;---------------------------------------------------------------------------------------------------

#obj1020:
#_00AB72: dw $0D92, $0DAA, $0D92, $0DAA

;---------------------------------------------------------------------------------------------------

#obj1028:
#_00AB7A: dw $0942, $0982, $0992, $0943
#_00AB82: dw $0983, $0993, $4943, $4983
#_00AB8A: dw $4993, $4942, $4982, $4992

;---------------------------------------------------------------------------------------------------

#obj1040:
#_00AB92: dw $0CEE, $18D8, $0CEE, $0CFE
#_00AB9A: dw $18C8, $18D9, $58D9, $0CFF
#_00ABA2: dw $18C9, $0CFE, $0CEE, $18D9
#_00ABAA: dw $0CEF, $58D9, $58D8, $0CFF

;---------------------------------------------------------------------------------------------------

#obj1060:
#_00ABB2: dw $1197, $1198, $1197, $1198
#_00ABBA: dw $1187, $1188, $1187, $1188

;---------------------------------------------------------------------------------------------------

#obj1070:
#_00ABC2: dw $1D76, $1D77, $5D76, $5D77

;---------------------------------------------------------------------------------------------------

#obj1078:
#_00ABCA: dw $9D77, $9D76, $DD77, $DD76

;---------------------------------------------------------------------------------------------------

#obj1080:
#_00ABD2: dw $5D79, $DD79, $5D78, $DD78

;---------------------------------------------------------------------------------------------------

#obj1088:
#_00ABDA: dw $084C, $085D, $086D, $087D
#_00ABE2: dw $084F, $085E, $086E, $087E
#_00ABEA: dw $484F, $485E, $486E, $487E
#_00ABF2: dw $484C, $485D, $486D, $487D

;---------------------------------------------------------------------------------------------------

#obj10A8:
#_00ABFA: dw $0864, $0866, $0866, $09F8
#_00AC02: dw $085F, $086F, $087F, $09F9
#_00AC0A: dw $485F, $486F, $487F, $49F9
#_00AC12: dw $4864, $4866, $4866, $49F8

;---------------------------------------------------------------------------------------------------

#obj10C8:
#_00AC1A: dw $084D, $085D, $086D, $087D
#_00AC22: dw $084E, $085E, $086E, $087E
#_00AC2A: dw $484E, $485E, $486E, $487E
#_00AC32: dw $484D, $485D, $486D, $487D

;---------------------------------------------------------------------------------------------------

#obj10E8:
#_00AC3A: dw $887D, $886D, $885D, $884D
#_00AC42: dw $887E, $886E, $885E, $884E
#_00AC4A: dw $C87E, $C86E, $C85E, $C84E
#_00AC52: dw $C87D, $C86D, $C85D, $C84D

;---------------------------------------------------------------------------------------------------

#obj1108:
#_00AC5A: dw $0982, $0983, $4983, $4982
#_00AC62: dw $0992, $0993, $4993, $4992
#_00AC6A: dw $08C9, $08F4, $48F4, $48C9
#_00AC72: dw $08CA, $08F5, $48F5, $48CA
#_00AC7A: dw $0841, $0845, $8845, $8841
#_00AC82: dw $0842, $0855, $8845, $8842
#_00AC8A: dw $4842, $4855, $C855, $C842
#_00AC92: dw $4841, $4845, $C845, $C841

;---------------------------------------------------------------------------------------------------

#obj1148:
#_00AC9A: dw $28B8, $2808, $0818, $289D
#_00ACA2: dw $082E, $083E, $689D, $082F
#_00ACAA: dw $083F, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

#obj1160:
#_00ACB2: dw $28B8, $2808, $0818, $28B9
#_00ACBA: dw $09EF, $0819, $68B9, $09EF
#_00ACC2: dw $081A, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

#obj1178:
#_00ACCA: dw $28B5, $2808, $080D, $28B7
#_00ACD2: dw $082E, $083E, $68B7, $082F
#_00ACDA: dw $083F, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

#obj1190:
#_00ACE2: dw $28B5, $2808, $080D, $28B6
#_00ACEA: dw $09EF, $0819, $68B6, $09EF
#_00ACF2: dw $081A, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

#obj11A8:
#_00ACFA: dw $28B8, $0808, $0818, $4CAC
#_00AD02: dw $289D, $0807, $0817, $0CAC
#_00AD0A: dw $689D, $4807, $4817, $4CAC
#_00AD12: dw $68B8, $4808, $4818, $0CAC

;---------------------------------------------------------------------------------------------------

#obj11C8:
#_00AD1A: dw $28B8, $2808, $0818, $4CAC
#_00AD22: dw $28B9, $09EF, $0816, $0CAC
#_00AD2A: dw $68B9, $09EF, $4816, $4CAC
#_00AD32: dw $68B8, $6808, $4818, $0CAC

;---------------------------------------------------------------------------------------------------

#obj11E8:
#_00AD3A: dw $8CAC, $8818, $8808, $A8B8
#_00AD42: dw $CCAC, $8817, $8807, $A89D
#_00AD4A: dw $8CAC, $C817, $C807, $E89D
#_00AD52: dw $CCAC, $C818, $C808, $E8B8

;---------------------------------------------------------------------------------------------------

#obj1208:
#_00AD5A: dw $8CAC, $880D, $8808, $A8B8
#_00AD62: dw $CCAC, $8816, $89EF, $A8B9
#_00AD6A: dw $8CAC, $C816, $C9EF, $E8B9
#_00AD72: dw $CCAC, $C80D, $C808, $E8B8

;---------------------------------------------------------------------------------------------------

#obj1228:
#_00AD7A: dw $28B5, $0808, $080D, $50AC
#_00AD82: dw $28B7, $0807, $0817, $10AC
#_00AD8A: dw $68B7, $4807, $4817, $50AC
#_00AD92: dw $68B5, $4808, $480D, $10AC

;---------------------------------------------------------------------------------------------------

#obj1248:
#_00AD9A: dw $28B5, $0818, $080D, $50AC
#_00ADA2: dw $28B6, $09EF, $0816, $10AC
#_00ADAA: dw $68B6, $09EF, $4816, $50AC
#_00ADB2: dw $68B7, $4810, $480D, $10AC

;---------------------------------------------------------------------------------------------------

#obj1268:
#_00ADBA: dw $90AC, $880D, $8808, $A8B5
#_00ADC2: dw $D0AC, $8817, $8807, $A8B7
#_00ADCA: dw $90AC, $C817, $C807, $E8B7
#_00ADD2: dw $D0AC, $C80D, $C808, $E8B5

;---------------------------------------------------------------------------------------------------

#obj1288:
#_00ADDA: dw $90AC, $880D, $8808, $A8B5
#_00ADE2: dw $D0AC, $8816, $89EF, $A8B6
#_00ADEA: dw $90AC, $C816, $C9EF, $E8B6
#_00ADF2: dw $D0AC, $C80D, $C808, $E8B5

;---------------------------------------------------------------------------------------------------

#obj12A8:
#_00ADFA: dw $0984, $09A7, $0843, $0853
#_00AE02: dw $0984, $09A4, $09A8, $0854
#_00AE0A: dw $0984, $0994, $09A4, $09A8
#_00AE12: dw $0985, $0995, $09A5, $09A9
#_00AE1A: dw $0986, $0996, $09A6, $099C
#_00AE22: dw $4986, $4996, $49A6, $499C
#_00AE2A: dw $4985, $4995, $49A5, $49A9
#_00AE32: dw $4984, $4994, $49A4, $49A8
#_00AE3A: dw $4984, $49A4, $49A8, $4854
#_00AE42: dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

#_00AE4A: dw $0984, $09A7, $0843, $0853
#_00AE52: dw $0984, $0994, $09A8, $0854
#_00AE5A: dw $0985, $0995, $09A5, $09A8
#_00AE62: dw $0986, $0996, $09A6, $099C
#_00AE6A: dw $18CB, $18DB, $18CB, $18DB
#_00AE72: dw $18CA, $18DA, $18CA, $18DA
#_00AE7A: dw $4986, $4996, $49A6, $499C
#_00AE82: dw $4985, $4995, $49A5, $49A8
#_00AE8A: dw $4984, $4994, $49A8, $4854
#_00AE92: dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

#_00AE9A: dw $0984, $09A7, $0843, $0853
#_00AEA2: dw $0985, $0995, $09A8, $0854
#_00AEAA: dw $0986, $0996, $09A6, $09A8
#_00AEB2: dw $18CA, $18DA, $18CA, $18DA
#_00AEBA: dw $18CB, $18DB, $18CB, $18DB
#_00AEC2: dw $18CA, $18DA, $18CA, $18DA
#_00AECA: dw $18CB, $18DB, $18CB, $18DB
#_00AED2: dw $4986, $4996, $49A6, $49A8
#_00AEDA: dw $4985, $4995, $49A8, $4854
#_00AEE2: dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

#_00AEEA: dw $0985, $09A7, $0843, $0853
#_00AEF2: dw $0986, $0996, $09A8, $0854
#_00AEFA: dw $0871, $0871, $098B, $099B
#_00AF02: dw $18CA, $18DA, $18CA, $18DA
#_00AF0A: dw $18CB, $18DB, $18CB, $18DB
#_00AF12: dw $18CA, $18DA, $18CA, $18DA
#_00AF1A: dw $18CB, $18DB, $18CB, $18DB
#_00AF22: dw $4871, $4871, $498B, $499B
#_00AF2A: dw $4986, $4996, $49A8, $4854
#_00AF32: dw $4985, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

#obj13E8:
#_00AF3A: dw $0986, $09A7, $0843, $0853
#_00AF42: dw $0871, $098B, $099B, $0854
#_00AF4A: dw $0871, $0871, $098B, $099B
#_00AF52: dw $18CA, $18DA, $18CA, $18DA
#_00AF5A: dw $18CB, $18DB, $18CB, $18DB
#_00AF62: dw $18CA, $18DA, $18CA, $18DA
#_00AF6A: dw $18CB, $18DB, $18CB, $18DB
#_00AF72: dw $4871, $4871, $498B, $499B
#_00AF7A: dw $4871, $498B, $499B, $4854
#_00AF82: dw $4986, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

#obj1438:
#_00AF8A: dw $18CA, $18CB, $18CA, $18CB
#_00AF92: dw $18DA, $0974, $4974, $18DB
#_00AF9A: dw $18CA, $8974, $C974, $18CB
#_00AFA2: dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

#obj1458:
#_00AFAA: dw $1D48, $1D58, $1568, $1542
#_00AFB2: dw $1562, $1552, $1D49, $1D59
#_00AFBA: dw $1D69, $1D43, $1D63, $1D53
#_00AFC2: dw $1D60, $1D70, $1D78, $1D61
#_00AFCA: dw $1D71, $1D79, $5D61, $5D71
#_00AFD2: dw $5D79, $5D60, $5D70, $5D78

;---------------------------------------------------------------------------------------------------

#obj1488:
#_00AFDA: dw $298D, $298E, $299E, $298F
#_00AFE2: dw $299F, $299D

;---------------------------------------------------------------------------------------------------

#obj1494:
#_00AFE6: dw $09A2, $09A3, $49A2, $49A3

;---------------------------------------------------------------------------------------------------

#obj149C:
#_00AFEE: dw $19E1, $19F1, $59E1, $59F1

;---------------------------------------------------------------------------------------------------

#obj14A4:
#_00AFF6: dw $19E2, $19F2, $59E2, $59F2

;---------------------------------------------------------------------------------------------------

#obj14AC:
#_00AFFE: dw $1920, $1930, $1926, $1921
#_00B006: dw $1931, $1927, $5921, $5931
#_00B00E: dw $5927, $5920, $5930, $5926

;---------------------------------------------------------------------------------------------------

#obj14C4:
#_00B016: dw $1906, $1916, $1926, $1907
#_00B01E: dw $1917, $1927, $5907, $5917
#_00B026: dw $5927, $5906, $5916, $5926

;---------------------------------------------------------------------------------------------------

#obj14DC:
#_00B02E: dw $2980, $0990, $09A0, $2981
#_00B036: dw $0991, $09A1, $2981, $0991
#_00B03E: dw $09A1, $6981, $4991, $49A1
#_00B046: dw $6981, $4991, $49A1, $6980
#_00B04E: dw $4990, $49A1
 
;---------------------------------------------------------------------------------------------------

#obj1500:
#_00B052: dw $89A0, $8990, $A980, $89A1
#_00B05A: dw $8991, $A981, $89A1, $8991
#_00B062: dw $A981, $C9A1, $C991, $E981
#_00B06A: dw $C9A1, $C991, $E981, $C9A0
#_00B072: dw $C990, $E980

;---------------------------------------------------------------------------------------------------

#obj1524:
#_00B076: dw $2982, $0983, $09A2, $2992
#_00B07E: dw $0993, $09A3, $2992, $0993
#_00B086: dw $09A3, $A992, $8993, $89A3
#_00B08E: dw $A992, $8993, $89A3, $A982
#_00B096: dw $8983, $89A2

;---------------------------------------------------------------------------------------------------

#obj1548:
#_00B09A: dw $49A2, $4983, $6982, $49A3
#_00B0A2: dw $4993, $6992, $49A3, $4993
#_00B0AA: dw $6992, $C9A3, $C993, $E992
#_00B0B2: dw $C9A3, $C993, $E992, $C9A2
#_00B0BA: dw $C983, $E982

;---------------------------------------------------------------------------------------------------

#obj156C:
#_00B0BE: dw $2984, $0990, $09A0, $2994
#_00B0C6: dw $0991, $09A1, $2994, $0991
#_00B0CE: dw $09A1, $6994, $4991, $49A1
#_00B0D6: dw $6994, $4991, $49A1, $6984
#_00B0DE: dw $4990, $49A0

;---------------------------------------------------------------------------------------------------

#obj1590:
#_00B0E2: dw $89A0, $8990, $A984, $89A1
#_00B0EA: dw $8991, $A994, $89A1, $8991
#_00B0F2: dw $A994, $C9A1, $C991, $E994
#_00B0FA: dw $C9A1, $C991, $E994, $C9A0
#_00B102: dw $C990, $E984

;---------------------------------------------------------------------------------------------------

#obj15B4:
#_00B106: dw $288A, $288B, $288B, $0809
#_00B10E: dw $09EF, $09EF, $080A, $0879
#_00B116: dw $0879, $288A, $A88B, $A88B
#_00B11E: dw $09EF, $89EF, $8809, $0879
#_00B126: dw $8879, $880A

;---------------------------------------------------------------------------------------------------

#obj15D8:
#_00B12A: dw $480A, $4879, $4879, $4809
#_00B132: dw $49EF, $49EF, $688A, $688B
#_00B13A: dw $688B, $4879, $C879, $C80A
#_00B142: dw $49EF, $C9EF, $C809, $688B
#_00B14A: dw $E88B, $E88A

;---------------------------------------------------------------------------------------------------

#obj15FC:
#_00B14E: dw $880D, $8808, $A82C, $8878
#_00B156: dw $09EF, $A82D, $C878, $09EF
#_00B15E: dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

#obj1614:
#_00B166: dw $0980, $0981, $4981, $4980
#_00B16E: dw $0990, $0991, $4991, $4990
#_00B176: dw $09A0, $09A1, $49A1, $49A0

;---------------------------------------------------------------------------------------------------

#obj162C:
#_00B17E: dw $0980, $0981, $4981, $4980
#_00B186: dw $0990, $0991, $4991, $4990
#_00B18E: dw $09A0, $1DB2, $1DB2, $49A0
#_00B196: dw $1DB3, $1DB3, $1DB3, $1DB3
#_00B19E: dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

#obj1654:
#_00B1A6: dw $2980, $2981, $6981, $6980
#_00B1AE: dw $2990, $2991, $6991, $6990

#_00B1B6: dw $29A0, $3DB2, $3DB2, $69A0
#_00B1BE: dw $3DB3, $3DB3, $3DB3, $3DB3
#_00B1C6: dw $3DB3, $3DB3, $3DB3, $3DB3
#_00B1CE: dw $1DB3, $1DB3, $1DB3, $1DB3
#_00B1D6: dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

#obj168C:
#_00B1DE: dw $09A0, $1DB2, $5DB2, $49A0
#_00B1E6: dw $1DB3, $1DB3, $1DB3, $1DB3
#_00B1EE: dw $1DB3, $1DB3, $1DB3, $1DB3
#_00B1F6: dw $1DB5, $1DB5, $1DB5, $1DB5
#_00B1FE: dw $18CA, $18CB, $18CA, $18CB

;---------------------------------------------------------------------------------------------------

#obj16B4:
#_00B206: dw $09A0, $1DB2, $5DB2, $49A0
#_00B20E: dw $1DB3, $1DB3, $1DB3, $1DB3
#_00B216: dw $1DB5, $1DB5, $1DB5, $1DB5
#_00B21E: dw $0870, $0870, $0870, $0870
#_00B226: dw $18CA, $18CB, $18CA, $18CB

;---------------------------------------------------------------------------------------------------

#obj16DC:
#_00B22E: dw $01EC, $853E, $853F, $853D
#_00B236: dw $853D, $853D, $C53D, $C53D
#_00B23E: dw $C53D, $C53F, $C53E, $01EC
#_00B246: dw $052A, $853D, $853D, $853D
#_00B24E: dw $853D, $853D, $C53D, $C53D
#_00B256: dw $C53D, $C53D, $C53D, $452A
#_00B25E: dw $05E8, $853D, $853D, $852E
#_00B266: dw $852F, $852D, $C52D, $C52F
#_00B26E: dw $C52E, $C53D, $C53D, $45E8
#_00B276: dw $05E7, $853D, $052B, $852D
#_00B27E: dw $852D, $852D, $C52D, $C52D
#_00B286: dw $C52D, $452B, $C53D, $45E7
#_00B28E: dw $05E7, $853D, $053B, $852D
#_00B296: dw $852D, $852D, $C52D, $C52D
#_00B29E: dw $C52D, $453B, $C53D, $45E7
#_00B2A6: dw $85E8, $853D, $853B, $852D
#_00B2AE: dw $852D, $852D, $C52D, $C52D
#_00B2B6: dw $C52D, $C53B, $C53D, $C5E8
#_00B2BE: dw $852A, $853D, $852B, $852D
#_00B2C6: dw $852D, $852D, $C52D, $C52D
#_00B2CE: dw $C52D, $C52B, $C53D, $C52A
#_00B2D6: dw $01EC, $853A, $853D, $853B
#_00B2DE: dw $852D, $852D, $C52D, $C52D
#_00B2E6: dw $C53B, $C53D, $C53A, $01EC
#_00B2EE: dw $01EC, $852A, $853D, $852B
#_00B2F6: dw $852D, $852D, $C52D, $C52D
#_00B2FE: dw $C52B, $C53D, $C52A, $01EC
#_00B306: dw $01EC, $01EC, $853A, $853D
#_00B30E: dw $052E, $052F, $452F, $452E
#_00B316: dw $C53D, $C53A, $01EC, $01EC
#_00B31E: dw $01EC, $01EC, $852A, $853D
#_00B326: dw $853D, $853D, $C53D, $C53D
#_00B32E: dw $C53D, $C52A, $01EC, $01EC
#_00B336: dw $01EC, $01EC, $01EC, $053E
#_00B33E: dw $053F, $853D, $C53D, $453F
#_00B346: dw $453E

;---------------------------------------------------------------------------------------------------

#obj17F6:
#_00B348: dw $01EC, $01EC, $01EC, $853E
#_00B350: dw $853F, $053D, $453D, $C53F
#_00B358: dw $C53E, $01EC, $01EC, $01EC
#_00B360: dw $01EC, $01EC, $052A, $053D
#_00B368: dw $053D, $053D, $453D, $453D
#_00B370: dw $453D, $452A, $01EC, $01EC
#_00B378: dw $01EC, $01EC, $053A, $053D
#_00B380: dw $852E, $852F, $C52F, $C52E
#_00B388: dw $453D, $453A, $01EC, $01EC
#_00B390: dw $01EC, $052A, $053D, $052B
#_00B398: dw $052D, $052D, $452D, $452D
#_00B3A0: dw $452B, $453D, $452A, $01EC
#_00B3A8: dw $01EC, $053A, $053D, $053B
#_00B3B0: dw $052D, $052D, $452D, $452D
#_00B3B8: dw $453B, $453D, $453A, $01EC
#_00B3C0: dw $052A, $053D, $052B, $052D
#_00B3C8: dw $052D, $052D, $452D, $452D
#_00B3D0: dw $452D, $452B, $453D, $452A
#_00B3D8: dw $05E8, $053D, $053B, $052D
#_00B3E0: dw $052D, $052D, $452D, $452D
#_00B3E8: dw $452D, $453B, $453D, $45E8
#_00B3F0: dw $05E7, $053D, $853B, $052D
#_00B3F8: dw $052D, $052D, $452D, $452D
#_00B400: dw $452D, $C53B, $453D, $45E7
#_00B408: dw $05E7, $053D, $852B, $052D
#_00B410: dw $052D, $052D, $452D, $452D
#_00B418: dw $452D, $C52B, $453D, $45E7
#_00B420: dw $85E8, $053D, $053D, $052E
#_00B428: dw $052F, $052D, $452D, $452F
#_00B430: dw $452E, $453D, $453D, $C5E8
#_00B438: dw $852A, $053D, $053D, $053D
#_00B440: dw $053D, $053D, $453D, $453D
#_00B448: dw $453D, $453D, $453D, $C52A
#_00B450: dw $01EC, $053E, $053F, $053D
#_00B458: dw $053D, $053D, $453D, $453D
#_00B460: dw $453D, $453F, $453E

;---------------------------------------------------------------------------------------------------

#obj1914:
#_00B466: dw $01EC, $853E, $853F, $053D
#_00B46E: dw $053D, $C53F, $C53E, $01EC
#_00B476: dw $01EC, $01EC, $01EC, $01EC
#_00B47E: dw $052A, $053D, $053D, $053D
#_00B486: dw $053D, $053D, $053D, $C53F
#_00B48E: dw $C53E, $01EC, $01EC, $01EC
#_00B496: dw $053A, $053D, $053D, $852E
#_00B49E: dw $852F, $C52F, $C52E, $053D
#_00B4A6: dw $053D, $C53F, $C53E, $01EC
#_00B4AE: dw $053D, $053D, $052B, $052D
#_00B4B6: dw $052D, $052D, $852D, $C52F
#_00B4BE: dw $C52E, $053D, $053D, $452A
#_00B4C6: dw $053D, $053D, $053B, $052D
#_00B4CE: dw $052D, $052D, $052D, $052D
#_00B4D6: dw $052D, $452B, $053D, $453A
#_00B4DE: dw $053D, $053D, $052D, $052D
#_00B4E6: dw $052D, $052D, $052D, $052D
#_00B4EE: dw $052D, $453B, $053D, $053D
#_00B4F6: dw $853D, $853D, $852D, $852D
#_00B4FE: dw $852D, $852D, $852D, $852D
#_00B506: dw $852D, $C53B, $853D, $853D
#_00B50E: dw $853D, $853D, $853B, $852D
#_00B516: dw $852D, $852D, $852D, $852D
#_00B51E: dw $852D, $C52B, $853D, $C53A
#_00B526: dw $853D, $853D, $852B, $852D
#_00B52E: dw $852D, $852D, $852D, $452F
#_00B536: dw $452E, $853D, $853D, $C52A
#_00B53E: dw $853A, $853D, $853D, $052E
#_00B546: dw $052F, $452F, $452E, $853D
#_00B54E: dw $853D, $453F, $453E, $01EC
#_00B556: dw $852A, $853D, $853D, $853D
#_00B55E: dw $853D, $853D, $853D, $453F
#_00B566: dw $453E, $01EC, $01EC, $01EC
#_00B56E: dw $01EC, $053E, $053F, $853D
#_00B576: dw $853D, $453F, $453E

;---------------------------------------------------------------------------------------------------

#obj1A2A:
#_00B57C: dw $01EC, $01EC, $01EC, $01EC
#_00B584: dw $01EC, $853E, $853F, $453D
#_00B58C: dw $453D, $C53F, $C53E, $01EC
#_00B594: dw $01EC, $01EC, $01EC, $853E
#_00B59C: dw $853F, $453D, $453D, $453D
#_00B5A4: dw $453D, $453D, $453D, $452A
#_00B5AC: dw $01EC, $853E, $853F, $453D
#_00B5B4: dw $453D, $852E, $852F, $C52F
#_00B5BC: dw $C52E, $453D, $453D, $453A
#_00B5C4: dw $052A, $453D, $453D, $852E
#_00B5CC: dw $852F, $452D, $452D, $452D
#_00B5D4: dw $452D, $452B, $453D, $453D
#_00B5DC: dw $053A, $453D, $052B, $452D
#_00B5E4: dw $452D, $452D, $452D, $452D
#_00B5EC: dw $452D, $453B, $453D, $453D
#_00B5F4: dw $453D, $453D, $053B, $452D
#_00B5FC: dw $452D, $452D, $452D, $452D
#_00B604: dw $452D, $452D, $453D, $453D
#_00B60C: dw $C53D, $C53D, $853B, $C52D
#_00B614: dw $C52D, $C52D, $C52D, $C52D
#_00B61C: dw $C52D, $C52D, $C53D, $C53D
#_00B624: dw $853A, $C53D, $852B, $C52D
#_00B62C: dw $C52D, $C52D, $C52D, $C52D
#_00B634: dw $C52D, $C53B, $C53D, $C53D
#_00B63C: dw $852A, $C53D, $C53D, $052E
#_00B644: dw $052F, $C52D, $C52D, $C52D
#_00B64C: dw $C52D, $C52B, $C53D, $C53D
#_00B654: dw $01EC, $053E, $053F, $C53D
#_00B65C: dw $C53D, $052E, $052F, $452F
#_00B664: dw $452E, $C53D, $C53D, $C53A
#_00B66C: dw $01EC, $01EC, $01EC, $053E
#_00B674: dw $053F, $C53D, $C53D, $C53D
#_00B67C: dw $C53D, $C53D, $C53D, $C52A
#_00B684: dw $01EC, $01EC, $01EC, $01EC
#_00B68C: dw $01EC, $053E, $053F, $C53D
#_00B694: dw $C53D, $453F, $453E, $01EC

;---------------------------------------------------------------------------------------------------

#obj1B4A:
#_00B69C: dw $099D, $098E, $098E, $098E
#_00B6A4: dw $098E, $098E, $098E, $098E
#_00B6AC: dw $098E, $098E, $098E, $098E
#_00B6B4: dw $098E, $099E, $099F, $18C6
#_00B6BC: dw $18C6, $18C6, $18C6, $18C6
#_00B6C4: dw $18C6, $18C6, $18C6, $18C6
#_00B6CC: dw $18C6, $18C6, $18C6, $099F
#_00B6D4: dw $099F, $18C6, $18C6, $18C6
#_00B6DC: dw $18C6, $118A, $119A, $118B
#_00B6E4: dw $119B, $11A0, $18C6, $18C6
#_00B6EC: dw $18C6, $099F, $099F, $18C6
#_00B6F4: dw $18C6, $18C6, $18C6, $1183
#_00B6FC: dw $1193, $1182, $1192, $11A1
#_00B704: dw $18C6, $18C6, $498F, $499E
#_00B70C: dw $099F, $18C6, $18D4, $98D4
#_00B714: dw $18C6, $1189, $1187, $1197
#_00B71C: dw $118C, $11A2, $18C6, $18C6
#_00B724: dw $0972, $0972, $099F, $18D6
#_00B72C: dw $18D5, $98D5, $98D6, $119C
#_00B734: dw $1188, $1198, $118D, $11A3
#_00B73C: dw $18C6, $18C6, $0972, $0972

;---------------------------------------------------------------------------------------------------

#obj1BF2:
#_00B744: dw $0995, $1D99, $0994, $0CAC
#_00B74C: dw $0995, $1D99, $0994, $0CAC
#_00B754: dw $0980, $0990, $0986, $09A6
#_00B75C: dw $4980, $4990, $4986, $49A6
#_00B764: dw $0995, $1D99, $0994, $0CAC
#_00B76C: dw $0995, $1D99, $0994, $0CAC

#obj1C22:
#_00B774: dw $1DA7, $1DA8, $1DA4, $08F5
#_00B77C: dw $0CD8

#obj1C2C:
#_00B77E: dw $0981, $0991, $0985, $09A5
#_00B786: dw $8981, $8991, $8985, $89A5
#_00B78E: dw $0996, $1D99, $0984, $0CAD
#_00B796: dw $0996, $1D99, $0984, $0CAD
#_00B79E: dw $0996, $1D99, $0984, $0CAD
#_00B7A6: dw $0996, $1D99, $0984, $0CAD

#obj1C5C:
#_00B7AE: dw $98D9, $D8C7, $98C7, $D8C7
#_00B7B6: dw $98C8, $14DB, $14CA, $58C8
#_00B7BE: dw $18C7, $58C7, $18C7, $58D9

#obj1C74:
#_00B7C6: dw $58D9, $14CA, $D8C7, $98C8
#_00B7CE: dw $58C7, $18C7, $D8C7, $98C7
#_00B7D6: dw $58C8, $18C7, $14DB, $98D9

#obj1C8C:
#_00B7DE: dw $0CD8, $14CB, $D8C8, $58C8
#_00B7E6: dw $14DB, $14DA, $18D9, $98C7
#_00B7EE: dw $18C7, $98D9, $D8C8, $58C7
#_00B7F6: dw $D8C7, $58C7, $D8D9, $98C8
#_00B7FE: dw $18C7, $98C7, $18C8, $14DA
#_00B806: dw $14DB, $58D9, $D8D9, $14CB
#_00B80E: dw $14DB

;---------------------------------------------------------------------------------------------------

#obj1CBE:
#_00B810: dw $95A6, $958D, $B597, $95A7
#_00B818: dw $959C, $B598, $D5A7, $D59C
#_00B820: dw $F598, $D5A6, $D58D, $F597
#_00B828: dw $B587, $B595, $95A0, $B588
#_00B830: dw $B596, $9586, $F588, $F596
#_00B838: dw $D586, $F587, $F595, $D5A0

;---------------------------------------------------------------------------------------------------

#obj1CEE:
#_00B840: dw $15A0, $3595, $3587, $3586
#_00B848: dw $3596, $3588, $7586, $7596
#_00B850: dw $7588, $55A0, $7595, $7587
#_00B858: dw $3597, $158D, $15A6, $3598
#_00B860: dw $159C, $15A7, $7598, $559C
#_00B868: dw $55A7, $7597, $558D, $55A6

;---------------------------------------------------------------------------------------------------

#obj1D1E:
#_00B870: dw $55A4, $55A5, $D5A5, $D5A4
#_00B878: dw $558C, $559C, $D59C, $D58C
#_00B880: dw $758B, $759B, $F59B, $F58B
#_00B888: dw $758A, $759A, $F59A, $F58A
#_00B890: dw $7589, $7599, $F599, $F589
#_00B898: dw $55A1, $7585, $F585, $D5A1

;---------------------------------------------------------------------------------------------------

#obj1D4E:
#_00B8A0: dw $15A1, $3585, $B585, $95A1
#_00B8A8: dw $3589, $3599, $B599, $B589
#_00B8B0: dw $358A, $359A, $B59A, $B58A
#_00B8B8: dw $358B, $359B, $B59B, $B58B
#_00B8C0: dw $158C, $159C, $959C, $958C
#_00B8C8: dw $15A4, $15A5, $95A5, $95A4

;---------------------------------------------------------------------------------------------------

#obj1D7E:
#_00B8D0: dw $1590, $1590, $5590, $5590

;---------------------------------------------------------------------------------------------------

#obj1D86:
#_00B8D8: dw $1580, $9580, $1580, $9580

;---------------------------------------------------------------------------------------------------

#obj1D8E:
#_00B8E0: dw $1581, $1590, $1580, $1591

;---------------------------------------------------------------------------------------------------

#obj1D96:
#_00B8E8: dw $1590, $1592, $1582, $9580

;---------------------------------------------------------------------------------------------------

#obj1D9E:
#_00B8F0: dw $1580, $1593, $1583, $5590

;---------------------------------------------------------------------------------------------------

#obj1DA6:
#_00B8F8: dw $1584, $9580, $5590, $1594

;---------------------------------------------------------------------------------------------------

#obj1DAE:
#_00B900: dw $15A3, $1590, $55A3, $5590

;---------------------------------------------------------------------------------------------------

#obj1DB6:
#_00B908: dw $1590, $95A3, $5590, $D5A3

;---------------------------------------------------------------------------------------------------

#obj1DBE:
#_00B910: dw $95A2, $15A2, $1580, $9580

;---------------------------------------------------------------------------------------------------

#obj1DC6:
#_00B918: dw $1580, $9580, $D5A2, $55A2

;---------------------------------------------------------------------------------------------------

#obj1DCE:
#_00B920: dw $159D, $959D, $559D, $D59D

;---------------------------------------------------------------------------------------------------

#obj1DD6:
#_00B928: dw $19C4, $19C5

;---------------------------------------------------------------------------------------------------

#obj1DDA:
#_00B92C: dw $0980, $0990, $0981, $0991

;---------------------------------------------------------------------------------------------------

#obj1DE2:
#_00B934: dw $8990, $8980, $8991, $8981

;---------------------------------------------------------------------------------------------------

#obj1DEA:
#_00B93C: dw $0D29, $0D39, $4D29, $4D39

;---------------------------------------------------------------------------------------------------

#obj1DF2:
#_00B944: dw $19CD, $19CE, $59CD, $59CE

;---------------------------------------------------------------------------------------------------

#obj1DFA:
#_00B94C: dw $01EC, $1585, $1586, $1587
#_00B954: dw $1588, $1589, $1578, $5586
#_00B95C: dw $5585, $01EC, $1594, $1595
#_00B964: dw $1596, $1597, $1598, $1599
#_00B96C: dw $1579, $5596, $5595, $5594
#_00B974: dw $158A, $158B, $158C, $158D
#_00B97C: dw $158E, $158F, $1572, $558C
#_00B984: dw $558B, $558A, $159A, $159B
#_00B98C: dw $159C, $159D, $159E, $159F
#_00B994: dw $559D, $559C, $559B, $559A
#_00B99C: dw $15AA, $15AB, $15AC, $15AD
#_00B9A4: dw $15AE, $15AF, $55AD, $55AC
#_00B9AC: dw $55AB, $55AA, $15A0, $15A1
#_00B9B4: dw $15A2, $15A3, $15A4, $15A5
#_00B9BC: dw $55A3, $55A2, $55A1, $55A0
#_00B9C4: dw $15A7, $15A8, $154E, $156E
#_00B9CC: dw $1576, $1577, $556E, $554E
#_00B9D4: dw $55A8, $55A7, $01EC, $15A9
#_00B9DC: dw $155E, $157E, $1574, $1575

#_00B9E4: dw $557E, $555E, $55A9, $01EC

;---------------------------------------------------------------------------------------------------

#obj1E9A:
#_00B9EC: dw $01EC, $31AA, $3161, $3162
#_00B9F4: dw $3163, $7163, $7162, $7161
#_00B9FC: dw $71AA, $01EC, $01EC, $3170
#_00BA04: dw $3171, $3172, $317E, $717E
#_00BA0C: dw $7172, $7171, $7170, $01EC
#_00BA14: dw $3144, $3145, $3146, $3147
#_00BA1C: dw $3148, $7148, $7147, $7146
#_00BA24: dw $7145, $7144, $3154, $3155
#_00BA2C: dw $3156, $3157, $3158, $7158
#_00BA34: dw $7157, $7156, $7155, $7154
#_00BA3C: dw $3164, $3165, $3166, $3167
#_00BA44: dw $3168, $7168, $7167, $7166
#_00BA4C: dw $7165, $7164, $3174, $3175
#_00BA54: dw $3176, $3177, $3178, $7178
#_00BA5C: dw $7177, $7176, $7175, $7174
#_00BA64: dw $3149, $3159, $3169, $3179
#_00BA6C: dw $31AF, $71AF, $7179, $7169
#_00BA74: dw $7159, $7149, $31AA, $31AB
#_00BA7C: dw $31AC, $31AD, $31AE, $71AE
#_00BA84: dw $71AD, $71AC, $71AB, $71AA

;---------------------------------------------------------------------------------------------------

#obj1F3A:
#_00BA8C: dw $0DCF, $8DCF, $4DCF, $CDCF

;---------------------------------------------------------------------------------------------------

#obj1F42:
#_00BA94: dw $0D1F, $8D1F, $4D1F, $CD1F

;---------------------------------------------------------------------------------------------------

#obj1F4A:
#_00BA9C: dw $0D01, $8D01, $4D01, $CD01

;---------------------------------------------------------------------------------------------------

#obj1F52:
#_00BAA4: dw $19D0, $19D2, $19D1, $19D3

;---------------------------------------------------------------------------------------------------

#obj1F5A:
#_00BAAC: dw $0DD4, $0DD6, $0DD5, $0DD7

;---------------------------------------------------------------------------------------------------

#obj1F62:
#_00BAB4: dw $0993, $0D82, $0D84, $0890
#_00BABC: dw $0D83, $0D85, $0890, $0D92
#_00BAC4: dw $0D86, $0890, $4D92, $4D86
#_00BACC: dw $0890, $0D92, $0D86, $0890
#_00BAD4: dw $4D92, $4D86, $0890, $4D83
#_00BADC: dw $4D85, $4993, $4D82, $4D84

;---------------------------------------------------------------------------------------------------

#obj1F92:
#_00BAE4: dw $094A, $094B, $094B, $494B
#_00BAEC: dw $494B, $494A, $094E, $0978
#_00BAF4: dw $0979, $4979, $4978, $494E
#_00BAFC: dw $094E, $094F, $1DB3, $5DB3
#_00BB04: dw $494F, $494E, $094E, $094F
#_00BB0C: dw $1DB4, $5DB4, $494F, $494E
#_00BB14: dw $094E, $094F, $1DB4, $5DB4
#_00BB1C: dw $494F, $494E, $094E, $094F
#_00BB24: dw $9DB3, $DDB3, $494F, $494E
#_00BB2C: dw $096A, $095E, $095F, $495F
#_00BB34: dw $495E, $496A, $097A, $096E
#_00BB3C: dw $096F, $496F, $496E, $497A

;---------------------------------------------------------------------------------------------------

#obj1FF2:
#_00BB44: dw $11A0, $11A2, $1194, $11A1
#_00BB4C: dw $11A3, $1195, $51A1, $51A3
#_00BB54: dw $5195, $11A1, $11A3, $1195
#_00BB5C: dw $51A1, $51A3, $5195, $51A0
#_00BB64: dw $51A2, $5194

;---------------------------------------------------------------------------------------------------

#obj2016:
#_00BB68: dw $0DAA, $0DAC, $0DAE, $0DAB
#_00BB70: dw $0DAD, $0DAF, $4DAB, $4DAD
#_00BB78: dw $4DAF, $4DAA, $4DAC, $4DAE

;---------------------------------------------------------------------------------------------------

#obj202E:
#_00BB80: dw $0D51, $0D66, $1D64, $1D44
#_00BB88: dw $1D54, $1D64, $1D54, $09EF
#_00BB90: dw $0D55, $0D65, $156B, $157B
#_00BB98: dw $158B, $1D40, $19B2, $157C
#_00BBA0: dw $158C, $1D41, $156C, $157D
#_00BBA8: dw $158C, $5D41, $14E4, $14E5
#_00BBB0: dw $158D, $1D41

;---------------------------------------------------------------------------------------------------

#obj2062:
#_00BBB4: dw $1540, $1550, $1576, $1541
#_00BBBC: dw $1551, $1577, $5541, $5551
#_00BBC4: dw $5577, $1541, $1551, $1577
#_00BBCC: dw $5541, $5551, $5577, $5540
#_00BBD4: dw $5550, $5576

;---------------------------------------------------------------------------------------------------

#obj2086:
#_00BBD8: dw $1180, $1190, $1190, $1190
#_00BBE0: dw $1191, $1186, $1196, $1181
#_00BBE8: dw $5190, $5190, $5190, $5191
#_00BBF0: dw $5186, $5196, $1182, $1192
#_00BBF8: dw $1184, $1194, $11A4, $11A4
#_00BC00: dw $11A4, $1183, $1193, $1185
#_00BC08: dw $1195, $11A4, $11A4, $11A4
#_00BC10: dw $5183, $5193, $5185, $5195
#_00BC18: dw $51A4, $51A4, $51A4, $5182
#_00BC20: dw $5192, $5184, $5194, $51A4
#_00BC28: dw $51A4, $51A4, $5181, $1190
#_00BC30: dw $1190, $1190, $1191, $1186
#_00BC38: dw $1196, $5180, $5190, $5190
#_00BC40: dw $5190, $5191, $5186, $5196

;---------------------------------------------------------------------------------------------------

#obj20F6:
#_00BC48: dw $1593, $1580, $1580, $1580
#_00BC50: dw $1580, $1580, $1580, $1580
#_00BC58: dw $1580, $1580, $15A1, $1580
#_00BC60: dw $1580, $1580, $1580, $1580
#_00BC68: dw $1580, $1580, $1580, $1580
#_00BC70: dw $1582, $15A3, $1580, $5583
#_00BC78: dw $5593, $1580, $1580, $1580
#_00BC80: dw $1582, $1592, $1580, $1583
#_00BC88: dw $1596, $1580, $55A1, $D5A1
#_00BC90: dw $1580, $1580, $1580, $1583
#_00BC98: dw $1593, $1580, $1580, $55A1
#_00BCA0: dw $1580, $5582, $5592, $1580
#_00BCA8: dw $1580, $1580, $1580, $1580
#_00BCB0: dw $1580, $1580, $55A0, $1580
#_00BCB8: dw $1580, $1580, $15B4, $15B3
#_00BCC0: dw $95B3, $95B4, $1580, $1580
#_00BCC8: dw $1580, $5591, $1580, $1580
#_00BCD0: dw $15B6, $15B5, $1581, $1581
#_00BCD8: dw $95B5, $95B6, $1580, $1580
#_00BCE0: dw $5590, $95A0, $15B7, $15B5
#_00BCE8: dw $1581, $1581, $1581, $1581
#_00BCF0: dw $95B5, $95B7, $1580, $55A1
#_00BCF8: dw $95A1, $15B8, $1581, $1595
#_00BD00: dw $15A5, $95A5, $9595, $9581
#_00BD08: dw $95B8, $1580, $55A0, $D5A1
#_00BD10: dw $15B9, $1585, $15A4, $15A4
#_00BD18: dw $15A4, $15A4, $9585, $95B9
#_00BD20: dw $1580, $5591, $D5A0, $15B2
#_00BD28: dw $1586, $15A4, $15A4, $15A4
#_00BD30: dw $15A4, $9586, $95B2, $1580
#_00BD38: dw $5590, $1580, $55B2, $5586
#_00BD40: dw $15A4, $15A4, $15A4, $15A4
#_00BD48: dw $D586, $D5B2, $1580, $1590
#_00BD50: dw $1580, $55B9, $5585, $15A4
#_00BD58: dw $15A4, $15A4, $15A4, $D585
#_00BD60: dw $D5B9, $1580, $1591, $1580
#_00BD68: dw $55B8, $5581, $5595, $55A5
#_00BD70: dw $D5A5, $D595, $D581, $D5B8
#_00BD78: dw $1580, $15A0, $1580, $55B7
#_00BD80: dw $55B5, $5581, $5581, $5581
#_00BD88: dw $5581, $D5B5, $D5B7, $1582
#_00BD90: dw $1596, $1580, $1580, $55B6
#_00BD98: dw $55B5, $5581, $5581, $D5B5
#_00BDA0: dw $D5B6, $1580, $1583, $1596
#_00BDA8: dw $95A0, $1580, $1580, $55B4
#_00BDB0: dw $55B3, $D5B3, $D5B4, $1580
#_00BDB8: dw $1580, $1580, $1590, $95A1
#_00BDC0: dw $1580, $1580, $1580, $1580
#_00BDC8: dw $1580, $1580, $1580, $1580
#_00BDD0: dw $1580, $1591, $9590, $1580
#_00BDD8: dw $5583, $5593, $1580, $1582
#_00BDE0: dw $1592, $1580, $1580, $1580
#_00BDE8: dw $15A0, $9591, $1580, $55A1
#_00BDF0: dw $D5A1, $1580, $1583, $1593
#_00BDF8: dw $1580, $1580, $1580, $15A1
#_00BE00: dw $95A0, $1580, $5582, $5592
#_00BE08: dw $1580, $1580, $1580, $1580
#_00BE10: dw $1580, $1580, $1590, $95A1
#_00BE18: dw $1580, $1580, $1580, $1580
#_00BE20: dw $1580, $1580, $1580, $1580
#_00BE28: dw $1580, $1591

;---------------------------------------------------------------------------------------------------

#obj22DA:
#_00BE2C: dw $0CEE, $D594, $1584, $15A3
#_00BE34: dw $5594, $1594

;---------------------------------------------------------------------------------------------------

#obj22E6:
#_00BE38: dw $0D09, $0D19, $4D09, $4D19

;---------------------------------------------------------------------------------------------------

#obj22EE:
#_00BE40: dw $0D0A, $0D1A, $4D0A, $4D1A

;---------------------------------------------------------------------------------------------------

#obj22F6:
#_00BE48: dw $0D4A, $0D5A, $0D6A, $0D7A
#_00BE50: dw $0D4B, $0D5B, $0D6B, $0D7B
#_00BE58: dw $4D4B, $4D5B, $4D6B, $4D7B
#_00BE60: dw $4D4A, $4D5A, $4D6A, $4D7A

;---------------------------------------------------------------------------------------------------

#obj2316:
#_00BE68: dw $0966, $0956, $1D48, $0967
#_00BE70: dw $0957, $1DBE, $4967, $4957
#_00BE78: dw $5DBE, $4966, $4956, $5D48

;---------------------------------------------------------------------------------------------------

#obj232E:
#_00BE80: dw $9D48, $8956, $8966, $9DBE
#_00BE88: dw $8957, $8967, $DDBE, $C957
#_00BE90: dw $C967, $DD48, $C956, $C966

;---------------------------------------------------------------------------------------------------

#obj2346:
#_00BE98: dw $0968, $0969, $8969, $8968
#_00BEA0: dw $0958, $0959, $8959, $8958
#_00BEA8: dw $1D49, $1DBF, $9DBF, $9D49

;---------------------------------------------------------------------------------------------------

#obj235E:
#_00BEB0: dw $5D49, $5DBF, $DDBF, $DD49
#_00BEB8: dw $4958, $4959, $C959, $C958
#_00BEC0: dw $4968, $4969, $C969, $C968

;---------------------------------------------------------------------------------------------------

#obj2376:
#_00BEC8: dw $113D, $113D, $113D, $113D
#_00BED0: dw $113D, $113D, $113D, $113D
#_00BED8: dw $113D, $113D, $113D, $113D
#_00BEE0: dw $113D, $113D, $113D, $113D

#obj2396:
#_00BEE8: dw $1164, $1164, $1164, $1174
#_00BEF0: dw $1165, $1165, $1165, $1175
#_00BEF8: dw $5165, $5165, $5165, $5175
#_00BF00: dw $5164, $5164, $5164, $5174

;---------------------------------------------------------------------------------------------------

#obj23B6:
#_00BF08: dw $1144, $1154, $1154, $1154
#_00BF10: dw $1176, $112D, $112D, $112D
#_00BF18: dw $1145, $1155, $1155, $1155
#_00BF20: dw $1176, $112D, $112D, $112D
#_00BF28: dw $5176, $512D, $512D, $512D
#_00BF30: dw $5145, $5155, $5155, $5155
#_00BF38: dw $5176, $512D, $512D, $512D
#_00BF40: dw $5144, $5154, $5154, $5154
#_00BF48: dw $1154, $1154, $1154, $9144
#_00BF50: dw $112D, $112D, $112D, $9176
#_00BF58: dw $1155, $1155, $1155, $9145
#_00BF60: dw $112D, $112D, $112D, $9176
#_00BF68: dw $512D, $512D, $512D, $D176
#_00BF70: dw $5155, $5155, $5155, $D145
#_00BF78: dw $512D, $512D, $512D, $D176
#_00BF80: dw $5154, $5154, $5154, $D144

;---------------------------------------------------------------------------------------------------

#obj2436:
#_00BF88: dw $09E5, $09F5, $0936, $09FA
#_00BF90: dw $49E5, $09F7, $0937, $09FB
#_00BF98: dw $0000, $0000, $0000, $0CAC
#_00BFA0: dw $0000, $0000, $0000, $4CAC
#_00BFA8: dw $0000, $0000, $0000, $0CAC
#_00BFB0: dw $0000, $0000, $0000, $4CAC
#_00BFB8: dw $09E5, $49F7, $4937, $49FB
#_00BFC0: dw $49E5, $49F5, $4936, $49FA
#_00BFC8: dw $1414, $9414, $1414, $9414
#_00BFD0: dw $5414, $D414, $5414, $D414
#_00BFD8: dw $1414, $14E9, $14F9, $9414
#_00BFE0: dw $5414, $14EA, $14FA, $D414
#_00BFE8: dw $1414, $54EA, $54FA, $9414
#_00BFF0: dw $5414, $54E9, $54F9, $D414
#_00BFF8: dw $1414, $9414, $1414, $9414
#_00C000: dw $5414, $D414, $5414, $D414

;---------------------------------------------------------------------------------------------------

#obj24B6:
#_00C008: dw $2984, $09AC, $0994, $2985
#_00C010: dw $15AD, $1595, $2986, $15AE
#_00C018: dw $1596, $2987, $09AF, $0997
#_00C020: dw $6987, $49AF, $4997, $6986
#_00C028: dw $55AE, $5596, $6985, $55AD
#_00C030: dw $5595, $6984, $49AC, $4994

;---------------------------------------------------------------------------------------------------

#obj24E6:
#_00C038: dw $0980, $0990, $09A0, $0981
#_00C040: dw $0991, $09A1, $0982, $0992
#_00C048: dw $11A2, $1183, $1193, $11A3
#_00C050: dw $5183, $5193, $51A3, $4982
#_00C058: dw $4992, $51A2, $4981, $4991
#_00C060: dw $49A1, $4980, $4990, $49A0

;---------------------------------------------------------------------------------------------------

#obj2516:
#_00C068: dw $490C, $C90C, $099A, $09AA
#_00C070: dw $090C, $098B, $099B, $09AB
#_00C078: dw $490C, $498B, $499B, $49AB
#_00C080: dw $090C, $890C, $499A, $49AA
#_00C088: dw $490C, $09A8, $09A6, $C90C
#_00C090: dw $098A, $09A9, $09A7, $890C
#_00C098: dw $498A, $49A9, $49A7, $C90C
#_00C0A0: dw $090C, $49A8, $49A6, $890C

;---------------------------------------------------------------------------------------------------

#obj2556:
#_00C0A8: dw $09AC, $0994, $1D8C, $01EC
#_00C0B0: dw $15AD, $1595, $1D9C, $01EC
#_00C0B8: dw $15AE, $1596, $1D9C, $01EC
#_00C0C0: dw $09AF, $0997, $1D9C, $01EC
#_00C0C8: dw $49AF, $4997, $1D9C, $01EC
#_00C0D0: dw $55AE, $5596, $1D9C, $01EC
#_00C0D8: dw $55AD, $5595, $1D9C, $01EC
#_00C0E0: dw $49AC, $4994, $5D8C, $01EC

#obj2596:
#_00C0E8: dw $09AC, $0994, $1D8C, $1D8C
#_00C0F0: dw $15AD, $1595, $1D9C, $1D9C
#_00C0F8: dw $15AE, $1596, $1D9C, $1D9C
#_00C100: dw $1D88, $1D98, $1D9C, $1D9C
#_00C108: dw $1D88, $1D98, $1D9C, $1D9C
#_00C110: dw $55AE, $5596, $1D9C, $1D9C
#_00C118: dw $55AD, $5595, $1D9C, $1D9C
#_00C120: dw $49AC, $4994, $5D8C, $5D8C

#obj25D6:
#_00C128: dw $09AC, $0994, $1D8C, $1D8C
#_00C130: dw $15AD, $1595, $1D9C, $1D9C
#_00C138: dw $1D88, $1D98, $1D9C, $1D9C
#_00C140: dw $1D88, $1D98, $1D89, $1D99
#_00C148: dw $1D88, $1D98, $1D89, $1D99
#_00C150: dw $1D88, $1D98, $1D9C, $1D9C
#_00C158: dw $55AD, $5595, $1D9C, $1D9C
#_00C160: dw $49AC, $4994, $5D8C, $5D8C

#obj2616:
#_00C168: dw $09AC, $0994, $1D8C, $1D8C
#_00C170: dw $1D8D, $1D98, $1D89, $1D99
#_00C178: dw $1D88, $1D98, $1D89, $1D99
#_00C180: dw $1D88, $1D98, $1D89, $1D99
#_00C188: dw $1D88, $1D98, $1D89, $1D99
#_00C190: dw $1D88, $1D98, $1D89, $1D99
#_00C198: dw $5D8D, $1D98, $1D89, $1D99
#_00C1A0: dw $49AC, $4994, $5D8C, $5D8C

;---------------------------------------------------------------------------------------------------

#obj2656:
#_00C1A8: dw $08D0, $08D0, $08D0, $08D0
#_00C1B0: dw $08D0, $48D0, $48D0, $48D0
#_00C1B8: dw $48D0, $48D0, $08D0, $14C0
#_00C1C0: dw $14C0, $14C0, $14C0, $54C0
#_00C1C8: dw $54C0, $54C0, $54C0, $48D0
#_00C1D0: dw $08D0, $14C0, $14C0, $14C0
#_00C1D8: dw $14D1, $54D1, $54C0, $54C0
#_00C1E0: dw $54C0, $48D0, $08D0, $14C0
#_00C1E8: dw $14C0, $14C2, $14C3, $54C3
#_00C1F0: dw $54C2, $54C0, $54C0, $48D0
#_00C1F8: dw $097C, $097D, $097F, $14C4
#_00C200: dw $14C5, $54C5, $54C4, $497F
#_00C208: dw $497D, $497C, $096C, $096D
#_00C210: dw $096F, $0908, $14E8, $54E8
#_00C218: dw $4908, $496F, $496D, $496C
#_00C220: dw $095C, $095D, $095F, $0918
#_00C228: dw $14F8, $54F8, $4918, $495F
#_00C230: dw $495D, $495C, $094C, $094D
#_00C238: dw $094F, $A888, $A889, $E889
#_00C240: dw $E888, $494F, $494D, $494C

;---------------------------------------------------------------------------------------------------

#obj26F6:
#_00C248: dw $14C8, $097E, $096E, $295E
#_00C250: dw $14D8, $14C9, $14D9, $294E
#_00C258: dw $54D8, $54C9, $54D9, $694E
#_00C260: dw $54C8, $497E, $496E, $695E

;===================================================================================================

#obj2716:
#_00C268: dw $2888, $0808, $0818, $2889
#_00C270: dw $09EF, $0878, $6889, $09EF
#_00C278: dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

#obj272E:
#_00C280: dw $282C, $0808, $080D, $282D
#_00C288: dw $09EF, $0878, $682D, $09EF
#_00C290: dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

#obj2746:
#_00C298: dw $2888, $0808, $0818, $2889
#_00C2A0: dw $09EF, $0878, $6889, $09EF
#_00C2A8: dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

#obj275E:
#_00C2B0: dw $0882, $0824, $0834, $0883
#_00C2B8: dw $0825, $0835, $4883, $4825
#_00C2C0: dw $4835, $4882, $4824, $4834

;---------------------------------------------------------------------------------------------------

#obj2776:
#_00C2C8: dw $0890, $0896, $08A2, $0891
#_00C2D0: dw $0897, $08A3, $0890, $0896
#_00C2D8: dw $08A2, $0891, $0897, $08A3

;---------------------------------------------------------------------------------------------------

#obj278E:
#_00C2E0: dw $0882, $0800, $0810, $0883
#_00C2E8: dw $0802, $0812, $4883, $4802
#_00C2F0: dw $4812, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

#obj27A6:
#_00C2F8: dw $0882, $0800, $0810, $0883
#_00C300: dw $0801, $0811, $4883, $4801
#_00C308: dw $4811, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

#obj27BE:
#_00C310: dw $0882, $0800, $0810, $0883
#_00C318: dw $0802, $0812, $4883, $4802
#_00C320: dw $4812, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

#obj27D6:
#_00C328: dw $08B0, $0800, $080B, $08B1
#_00C330: dw $0802, $0812, $48B1, $4802
#_00C338: dw $4812, $48B0, $4800, $480B

;---------------------------------------------------------------------------------------------------

#obj27EE:
#_00C340: dw $0890, $08BA, $08A9, $08B4
#_00C348: dw $088C, $088E, $48B4, $088D
#_00C350: dw $088F, $0891, $48BA, $48A9

;---------------------------------------------------------------------------------------------------

#obj2806:
#_00C358: dw $0882, $0800, $0810, $0883
#_00C360: dw $0801, $0811, $4883, $4801
#_00C368: dw $4811, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

#obj281E:
#_00C370: dw $0890, $0896, $08A2, $0891
#_00C378: dw $088C, $088E, $0890, $088D
#_00C380: dw $088F, $0891, $0897, $08A3

;---------------------------------------------------------------------------------------------------

#obj2836:
#_00C388: dw $0882, $0824, $0834, $0883
#_00C390: dw $0825, $0835, $4883, $4825
#_00C398: dw $4835, $4882, $4824, $4834

;---------------------------------------------------------------------------------------------------

#obj284E:
#_00C3A0: dw $2888, $0808, $0818, $2889
#_00C3A8: dw $09EF, $0878, $6889, $09EF
#_00C3B0: dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

#obj2866:
#_00C3B8: dw $282C, $0808, $080D, $282D
#_00C3C0: dw $09EF, $0878, $682D, $09EF
#_00C3C8: dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

#obj287E:
#_00C3D0: dw $08B0, $0800, $080B, $08B1
#_00C3D8: dw $0801, $0811, $48B1, $4801
#_00C3E0: dw $4811, $48B0, $4800, $480B

;---------------------------------------------------------------------------------------------------

#obj2896:
#_00C3E8: dw $08B0, $0824, $080C, $08B1
#_00C3F0: dw $0825, $0835, $48B1, $4825
#_00C3F8: dw $4835, $48B0, $4824, $480C

;---------------------------------------------------------------------------------------------------

#obj28AE:
#_00C400: dw $282C, $0808, $080D, $282D
#_00C408: dw $09EF, $0878, $682D, $09EF
#_00C410: dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

#obj28C6:
#_00C418: dw $08B0, $0824, $080C, $08B1
#_00C420: dw $0825, $0835, $48B1, $4825
#_00C428: dw $4835, $48B0, $4824, $480C

;---------------------------------------------------------------------------------------------------

#obj28DE:
#_00C430: dw $282C, $0808, $080D, $282D
#_00C438: dw $09EF, $0878, $682D, $09EF
#_00C440: dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

#obj28F6:
#_00C448: dw $2882, $0808, $0818, $2883
#_00C450: dw $09EF, $0878, $6883, $09EF
#_00C458: dw $4878, $6882, $4808, $4818

;---------------------------------------------------------------------------------------------------

#obj290E:
#_00C460: dw $2886, $0877, $0875, $2887
#_00C468: dw $09EF, $0859, $6887, $09EF
#_00C470: dw $4859, $6886, $4877, $4875

;---------------------------------------------------------------------------------------------------

#obj2926:
#_00C478: dw $0872, $0872, $0872, $0873
#_00C480: dw $0874, $0875, $0876, $0876
#_00C488: dw $0876, $0876, $0876, $0876
#_00C490: dw $085B, $4876, $4876, $4876
#_00C498: dw $4876, $4876, $4876, $4872
#_00C4A0: dw $4872, $4872, $4873, $4874
#_00C4A8: dw $4875

;---------------------------------------------------------------------------------------------------

#obj2958:
#_00C4AA: dw $296E, $115E, $1178, $1158
#_00C4B2: dw $696E, $09EF, $0878, $1174
#_00C4BA: dw $296E, $49EF, $4878, $5174
#_00C4C2: dw $696E, $515E, $5178, $5158

;---------------------------------------------------------------------------------------------------

#obj2978:
#_00C4CA: dw $28B0, $0808, $080D, $28B1
#_00C4D2: dw $09EF, $0878, $68B1, $09EF
#_00C4DA: dw $4878, $68B0, $4808, $480D

;---------------------------------------------------------------------------------------------------

#obj2990:
#_00C4E2: dw $28B8, $2808, $0818, $289D
#_00C4EA: dw $082E, $083E, $689D, $082F
#_00C4F2: dw $083F, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

#obj29A8:
#_00C4FA: dw $28B8, $2808, $0818, $28B9
#_00C502: dw $09EF, $0819, $68B9, $09EF
#_00C50A: dw $081A, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

#obj29C0:
#_00C512: dw $28B5, $2808, $080D, $28B7
#_00C51A: dw $082E, $083E, $68B7, $082F
#_00C522: dw $083F, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

#obj29D8:
#_00C52A: dw $28B5, $2808, $080D, $28B6
#_00C532: dw $09EF, $0819, $68B6, $09EF
#_00C53A: dw $081A, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

#obj29F0:
#_00C542: dw $8818, $8808, $A888, $8878
#_00C54A: dw $09EF, $A889, $8878, $09EF
#_00C552: dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

#obj2A08:
#_00C55A: dw $880D, $8808, $A82C, $8878
#_00C562: dw $09EF, $A82D, $C878, $09EF
#_00C56A: dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

#obj2A20:
#_00C572: dw $8818, $8808, $A888, $8878
#_00C57A: dw $09EF, $A889, $8878, $09EF
#_00C582: dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

#obj2A38:
#_00C58A: dw $8834, $8824, $8882, $8835
#_00C592: dw $8825, $8883, $C835, $C825
#_00C59A: dw $C883, $C834, $C824, $C882

;---------------------------------------------------------------------------------------------------

#obj2A50:
#_00C5A2: dw $88A2, $8896, $8890, $88A3
#_00C5AA: dw $8897, $8891, $88A2, $8896
#_00C5B2: dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

#obj2A68:
#_00C5BA: dw $8810, $8800, $8882, $8812
#_00C5C2: dw $8802, $8883, $C812, $C802
#_00C5CA: dw $C883, $C810, $C800, $C882

;---------------------------------------------------------------------------------------------------

#obj2A80:
#_00C5D2: dw $8818, $8808, $A888, $8878
#_00C5DA: dw $09EF, $A889, $8878, $09EF
#_00C5E2: dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

#obj2A98:
#_00C5EA: dw $88A9, $88BA, $8890, $888E
#_00C5F2: dw $888C, $88B4, $888F, $888D
#_00C5FA: dw $C8B4, $C8A9, $C8BA, $8891

;---------------------------------------------------------------------------------------------------

#obj2AB0:
#_00C602: dw $88A2, $8896, $8890, $888E
#_00C60A: dw $888C, $8891, $888F, $888D
#_00C612: dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

#obj2AC8:
#_00C61A: dw $8810, $8800, $8882, $8811
#_00C622: dw $8801, $8883, $C811, $C801
#_00C62A: dw $C883, $C810, $C800, $C882

;---------------------------------------------------------------------------------------------------

#obj2AE0:
#_00C632: dw $88A2, $8896, $8890, $888E
#_00C63A: dw $888C, $8891, $888F, $888D
#_00C642: dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

#obj2AF8:
#_00C64A: dw $8818, $8808, $A888, $8878
#_00C652: dw $09EF, $A889, $8878, $09EF
#_00C65A: dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

#obj2B10:
#_00C662: dw $8834, $8824, $8882, $8835
#_00C66A: dw $8825, $8883, $C835, $C825
#_00C672: dw $C883, $C834, $C824, $C882

;---------------------------------------------------------------------------------------------------

#obj2B28:
#_00C67A: dw $880D, $8808, $A82C, $8878
#_00C682: dw $09EF, $A82D, $C878, $09EF
#_00C68A: dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

#obj2B40:
#_00C692: dw $880B, $8800, $88B0, $8811
#_00C69A: dw $8801, $88B1, $C811, $C801
#_00C6A2: dw $C8B1, $C80B, $C800, $C8B0

;---------------------------------------------------------------------------------------------------

#obj2B58:
#_00C6AA: dw $880C, $8824, $88B0, $8835
#_00C6B2: dw $8825, $88B1, $C835, $C825
#_00C6BA: dw $C8B1, $C80C, $C824, $C8B0

;---------------------------------------------------------------------------------------------------

#obj2B70:
#_00C6C2: dw $880D, $8808, $A82C, $8878
#_00C6CA: dw $09EF, $A82D, $C878, $09EF
#_00C6D2: dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

#obj2B88:
#_00C6DA: dw $880D, $8808, $A82C, $8878
#_00C6E2: dw $09EF, $A82D, $C878, $09EF
#_00C6EA: dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

#obj2BA0:
#_00C6F2: dw $880C, $8824, $88B0, $8835
#_00C6FA: dw $8825, $88B1, $C835, $C825
#_00C702: dw $C8B1, $C80C, $C824, $C8B0

;---------------------------------------------------------------------------------------------------

#obj2BB8:
#_00C70A: dw $8818, $8808, $A882, $8878
#_00C712: dw $09EF, $A883, $C878, $09EF
#_00C71A: dw $E883, $C818, $C808, $E882

;---------------------------------------------------------------------------------------------------

#obj2BD0:
#_00C722: dw $8875, $8877, $A886, $8859
#_00C72A: dw $09EF, $A887, $C859, $09EF
#_00C732: dw $E887, $C875, $C877, $E886

;---------------------------------------------------------------------------------------------------

#obj2BE8:
#_00C73A: dw $8875, $8874, $8873, $8872
#_00C742: dw $8872, $8872, $8876, $8876
#_00C74A: dw $8876, $8876, $8876, $8876
#_00C752: dw $085B, $C876, $C876, $C876
#_00C75A: dw $C876, $C876, $C876, $C875
#_00C762: dw $C874, $C873, $C872, $C872
#_00C76A: dw $C872

;---------------------------------------------------------------------------------------------------

#obj2C1A:
#_00C76C: dw $9158, $9178, $915E, $A96E
#_00C774: dw $9174, $8878, $89EF, $E96E
#_00C77C: dw $D174, $C878, $C9EF, $A96E
#_00C784: dw $D158, $D178, $D15E, $E96E

;---------------------------------------------------------------------------------------------------

#obj2C3A:
#_00C78C: dw $880D, $8808, $A8B0, $8878
#_00C794: dw $09EF, $A8B1, $C878, $09EF
#_00C79C: dw $E8B1, $C80D, $C808, $E8B0

;---------------------------------------------------------------------------------------------------

#obj2C52:
#_00C7A4: dw $0960, $296E, $295E, $14C9
#_00C7AC: dw $14D9, $294E, $54C9, $54D9
#_00C7B4: dw $694E, $4960, $696E, $695E

;---------------------------------------------------------------------------------------------------

#obj2C6A:
#_00C7BC: dw $288A, $288B, $A88B, $A88A
#_00C7C4: dw $0809, $09EF, $09EF, $8809
#_00C7CC: dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

#obj2C82:
#_00C7D4: dw $283C, $283D, $A83D, $A83C
#_00C7DC: dw $0809, $09EF, $09EF, $8809
#_00C7E4: dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

#obj2C9A:
#_00C7EC: dw $288A, $288B, $A88B, $A88A
#_00C7F4: dw $0809, $09EF, $09EF, $8809
#_00C7FC: dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

#obj2CB2:
#_00C804: dw $0884, $0885, $8885, $8884
#_00C80C: dw $0826, $0836, $8836, $8826
#_00C814: dw $0827, $0837, $8837, $8827

;---------------------------------------------------------------------------------------------------

#obj2CCA:
#_00C81C: dw $0892, $0893, $0892, $0893
#_00C824: dw $0898, $0899, $0898, $0899
#_00C82C: dw $082D, $083D, $082D, $083D

;---------------------------------------------------------------------------------------------------

#obj2CE2:
#_00C834: dw $0884, $0885, $8885, $8884
#_00C83C: dw $0803, $0805, $8805, $8803
#_00C844: dw $0804, $0806, $8806, $8804

;---------------------------------------------------------------------------------------------------

#obj2CFA:
#_00C84C: dw $0892, $08A8, $88A8, $0893
#_00C854: dw $08BB, $08BC, $08BD, $88BB
#_00C85C: dw $08AA, $08BE, $08BF, $88AA

;---------------------------------------------------------------------------------------------------

#obj2D12:
#_00C864: dw $0884, $0885, $8885, $8884
#_00C86C: dw $0803, $0813, $8813, $8803
#_00C874: dw $0804, $0814, $8814, $8804

;---------------------------------------------------------------------------------------------------

#obj2D2A:
#_00C87C: dw $0892, $0893, $0892, $0893
#_00C884: dw $0898, $08BC, $08BD, $0899
#_00C88C: dw $08A4, $08BE, $08BF, $08A5

;---------------------------------------------------------------------------------------------------

#obj2D42:
#_00C894: dw $0884, $0885, $8885, $8884
#_00C89C: dw $0826, $0836, $8836, $8826
#_00C8A4: dw $0827, $0837, $8837, $8827

;---------------------------------------------------------------------------------------------------

#obj2D5A:
#_00C8AC: dw $288A, $288B, $A88B, $A88A
#_00C8B4: dw $0809, $09EF, $09EF, $8809
#_00C8BC: dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

#obj2D72:
#_00C8C4: dw $283C, $283D, $A83D, $A83C
#_00C8CC: dw $0809, $09EF, $09EF, $8809
#_00C8D4: dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

#obj2D8A:
#_00C8DC: dw $08B2, $08B3, $88B3, $88B2
#_00C8E4: dw $0803, $0813, $8813, $8803
#_00C8EC: dw $081B, $0814, $8814, $881B

;---------------------------------------------------------------------------------------------------

#obj2DA2:
#_00C8F4: dw $08B2, $08B3, $88B3, $88B2
#_00C8FC: dw $0826, $0836, $8836, $8826
#_00C904: dw $081C, $0837, $8837, $881C

;---------------------------------------------------------------------------------------------------

#obj2DBA:
#_00C90C: dw $283C, $283D, $A83D, $A83C
#_00C914: dw $0809, $09EF, $09EF, $8809
#_00C91C: dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

#obj2DD2:
#_00C924: dw $08B2, $08B3, $88B3, $88B2
#_00C92C: dw $0826, $0836, $8836, $8826
#_00C934: dw $081C, $0837, $8837, $881C

;---------------------------------------------------------------------------------------------------

#obj2DEA:
#_00C93C: dw $283C, $283D, $A83D, $A83C
#_00C944: dw $0809, $09EF, $09EF, $8809
#_00C94C: dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

#obj2E02:
#_00C954: dw $2884, $2885, $A885, $A884
#_00C95C: dw $0809, $09EF, $09EF, $8809
#_00C964: dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

#obj2E1A:
#_00C96C: dw $28A0, $28A1, $A8A1, $A8A0
#_00C974: dw $0867, $09EF, $09EF, $8867
#_00C97C: dw $0865, $085A, $885A, $8865

;---------------------------------------------------------------------------------------------------

#obj2E32:
#_00C984: dw $297E, $A97E, $297E, $A97E
#_00C98C: dw $11AC, $09EF, $89EF, $91AC
#_00C994: dw $1179, $0879, $8879, $9179
#_00C99C: dw $1157, $1175, $9175, $9157

;---------------------------------------------------------------------------------------------------

#obj2E52:
#_00C9A4: dw $28B2, $28B3, $A8B3, $A8B2
#_00C9AC: dw $0809, $09EF, $09EF, $8809
#_00C9B4: dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

#obj2E6A:
#_00C9BC: dw $480A, $4879, $C879, $C80A
#_00C9C4: dw $4809, $09EF, $09EF, $C809
#_00C9CC: dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

#obj2E82:
#_00C9D4: dw $481D, $4879, $C879, $C81D
#_00C9DC: dw $4809, $09EF, $09EF, $C809
#_00C9E4: dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

#obj2E9A:
#_00C9EC: dw $480A, $4879, $C879, $C80A
#_00C9F4: dw $4809, $09EF, $09EF, $C809
#_00C9FC: dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

#obj2EB2:
#_00CA04: dw $4827, $4837, $C837, $C827
#_00CA0C: dw $4826, $4836, $C836, $C826
#_00CA14: dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

#obj2ECA:
#_00CA1C: dw $482D, $483D, $482D, $483D
#_00CA24: dw $4898, $4899, $4898, $4899
#_00CA2C: dw $4892, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

#obj2EE2:
#_00CA34: dw $4804, $4806, $C806, $C804
#_00CA3C: dw $4803, $4805, $C805, $C803
#_00CA44: dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

#obj2EFA:
#_00CA4C: dw $48AA, $48BE, $48BF, $C8AA
#_00CA54: dw $48BB, $48BC, $48BD, $C8BB
#_00CA5C: dw $4892, $48A8, $C8A8, $4893

;---------------------------------------------------------------------------------------------------

#obj2F12:
#_00CA64: dw $4804, $4814, $C814, $C804
#_00CA6C: dw $4803, $4813, $C813, $C803
#_00CA74: dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

#obj2F2A:
#_00CA7C: dw $48A4, $48BE, $48BF, $48A5
#_00CA84: dw $4898, $48BC, $48BD, $4899
#_00CA8C: dw $4892, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

#obj2F42:
#_00CA94: dw $480A, $4879, $C879, $C80A
#_00CA9C: dw $4809, $09EF, $09EF, $C809
#_00CAA4: dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

#obj2F5A:
#_00CAAC: dw $4827, $4837, $C837, $C827
#_00CAB4: dw $4826, $4836, $C836, $C826
#_00CABC: dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

#obj2F72:
#_00CAC4: dw $481D, $4879, $C879, $C81D
#_00CACC: dw $4809, $09EF, $09EF, $C809
#_00CAD4: dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

#obj2F8A:
#_00CADC: dw $481B, $4814, $C814, $C81B
#_00CAE4: dw $4803, $4813, $C813, $C803
#_00CAEC: dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

#obj2FA2:
#_00CAF4: dw $481C, $4837, $C837, $C81C
#_00CAFC: dw $4826, $4836, $C836, $C826
#_00CB04: dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

#obj2FBA:
#_00CB0C: dw $481D, $4879, $C879, $C81D
#_00CB14: dw $4809, $09EF, $09EF, $C809
#_00CB1C: dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

#obj2FD2:
#_00CB24: dw $481D, $4879, $C879, $C81D
#_00CB2C: dw $4809, $09EF, $09EF, $C809
#_00CB34: dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

#obj2FEA:
#_00CB3C: dw $481C, $4837, $C837, $C81C
#_00CB44: dw $4826, $4836, $C836, $C826
#_00CB4C: dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

#obj3002:
#_00CB54: dw $480A, $4879, $C879, $C80A
#_00CB5C: dw $4809, $09EF, $09EF, $C809
#_00CB64: dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

#obj301A:
#_00CB6C: dw $4865, $485A, $C85A, $C865
#_00CB74: dw $4867, $09EF, $09EF, $C867
#_00CB7C: dw $68A0, $68A1, $E8A1, $E8A0

;---------------------------------------------------------------------------------------------------

#obj3032:
#_00CB84: dw $5157, $5175, $D175, $D157
#_00CB8C: dw $5179, $4879, $C879, $D179
#_00CB94: dw $51AC, $49EF, $C9EF, $D1AC
#_00CB9C: dw $697E, $E97E, $697E, $E97E

;---------------------------------------------------------------------------------------------------

#obj3052:
#_00CBA4: dw $481D, $4879, $C879, $C81D
#_00CBAC: dw $4809, $09EF, $09EF, $C809
#_00CBB4: dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

#obj306A:
#_00CBBC: dw $2882, $0820, $0830, $2883
#_00CBC4: dw $0821, $0831, $6883, $4821
#_00CBCC: dw $4831, $6882, $4820, $4830

;---------------------------------------------------------------------------------------------------

#obj3082:
#_00CBD4: dw $2882, $0828, $0838, $2883
#_00CBDC: dw $0829, $0839, $6883, $4829
#_00CBE4: dw $4839, $6882, $4828, $4838

;---------------------------------------------------------------------------------------------------

#obj309A:
#_00CBEC: dw $28B0, $0820, $080E, $28B1
#_00CBF4: dw $0821, $0831, $68B1, $4821
#_00CBFC: dw $4831, $68B0, $4820, $480E

;---------------------------------------------------------------------------------------------------

#obj30B2:
#_00CC04: dw $28B0, $0828, $080F, $28B1
#_00CC0C: dw $0829, $0839, $68B1, $4829
#_00CC14: dw $4839, $68B0, $4828, $480F

;---------------------------------------------------------------------------------------------------

#obj30CA:
#_00CC1C: dw $8830, $8820, $A882, $8831
#_00CC24: dw $8821, $A883, $C831, $C821
#_00CC2C: dw $E883, $C830, $C820, $E882

;---------------------------------------------------------------------------------------------------

#obj30E2:
#_00CC34: dw $8838, $8828, $A882, $8839
#_00CC3C: dw $8829, $A883, $C839, $C829
#_00CC44: dw $E883, $C838, $C828, $E882

;---------------------------------------------------------------------------------------------------

#obj30FA:
#_00CC4C: dw $880E, $8820, $A8B0, $8831
#_00CC54: dw $8821, $A8B1, $C831, $C821
#_00CC5C: dw $E8B1, $C80E, $C820, $E8B0

;---------------------------------------------------------------------------------------------------

#obj3112:
#_00CC64: dw $880F, $8828, $A8B0, $8839
#_00CC6C: dw $8829, $A8B1, $C839, $C829
#_00CC74: dw $E8B1, $C80F, $C828, $E8B0

;---------------------------------------------------------------------------------------------------

#obj312A:
#_00CC7C: dw $2884, $2885, $A885, $A884
#_00CC84: dw $0822, $0832, $8832, $8822
#_00CC8C: dw $0823, $0833, $8833, $8823

;---------------------------------------------------------------------------------------------------

#obj3142:
#_00CC94: dw $2884, $2885, $A885, $A884
#_00CC9C: dw $082A, $083A, $883A, $882A
#_00CCA4: dw $082B, $083B, $883B, $882B

;---------------------------------------------------------------------------------------------------

#obj315A:
#_00CCAC: dw $28B2, $28B3, $A8B3, $A8B2
#_00CCB4: dw $0822, $0832, $8832, $8822
#_00CCBC: dw $081E, $0833, $8833, $881E

;---------------------------------------------------------------------------------------------------

#obj3172:
#_00CCC4: dw $28B2, $28B3, $A8B3, $A8B2
#_00CCCC: dw $082A, $083A, $883A, $882A
#_00CCD4: dw $081F, $083B, $883B, $881F

;---------------------------------------------------------------------------------------------------

#obj318A:
#_00CCDC: dw $4823, $4833, $C833, $C823
#_00CCE4: dw $4822, $4832, $C832, $C822
#_00CCEC: dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

#obj31A2:
#_00CCF4: dw $482B, $483B, $C83B, $C82B
#_00CCFC: dw $482A, $483A, $C83A, $C82A
#_00CD04: dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

#obj31BA:
#_00CD0C: dw $481E, $4833, $C833, $C81E
#_00CD14: dw $4822, $4832, $C832, $C822
#_00CD1C: dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

#obj31D2:
#_00CD24: dw $481F, $483B, $C83B, $C81F
#_00CD2C: dw $482A, $483A, $C83A, $C82A
#_00CD34: dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

#obj31EA:
#_00CD3C: dw $8875, $8874, $8873, $8872
#_00CD44: dw $8872, $8872, $0872, $8872
#_00CD4C: dw $8872, $0873, $0874, $0875
#_00CD54: dw $8876, $8876, $8876, $8876
#_00CD5C: dw $8876, $0876, $0876, $0876
#_00CD64: dw $0876, $0876, $0876, $0876
#_00CD6C: dw $085B, $C876, $C876, $C876
#_00CD74: dw $C876, $C876, $4876, $4876
#_00CD7C: dw $4876, $4876, $4876, $4876
#_00CD84: dw $4876, $C875, $C874, $C873
#_00CD8C: dw $C872, $C872, $C872, $4872
#_00CD94: dw $4872, $4872, $4873, $4874
#_00CD9C: dw $4875

;===================================================================================================

DoorGFXDataOffset_North:
#_00CD9E: dw obj2716-RoomDrawObjectData ; 0x00 - Normal door
#_00CDA0: dw obj272E-RoomDrawObjectData ; 0x02 - Normal door (lower layer)
#_00CDA2: dw obj272E-RoomDrawObjectData ; 0x04 - Exit (lower layer)
#_00CDA4: dw obj2746-RoomDrawObjectData ; 0x06 - Unused cave exit (lower layer)
#_00CDA6: dw obj2746-RoomDrawObjectData ; 0x08 - Waterfall door
#_00CDA8: dw obj2746-RoomDrawObjectData ; 0x0A - Fancy dungeon exit
#_00CDAA: dw obj2746-RoomDrawObjectData ; 0x0C - Fancy dungeon exit (lower layer)
#_00CDAC: dw obj2746-RoomDrawObjectData ; 0x0E - Cave exit
#_00CDAE: dw obj2746-RoomDrawObjectData ; 0x10 - Lit cave exit (lower layer)
#_00CDB0: dw obj275E-RoomDrawObjectData ; 0x12 - Exit marker
#_00CDB2: dw obj275E-RoomDrawObjectData ; 0x14 - Dungeon swap marker
#_00CDB4: dw obj275E-RoomDrawObjectData ; 0x16 - Layer swap marker
#_00CDB6: dw obj275E-RoomDrawObjectData ; 0x18 - Double sided shutter door
#_00CDB8: dw obj2776-RoomDrawObjectData ; 0x1A - Eye watch door
#_00CDBA: dw obj278E-RoomDrawObjectData ; 0x1C - Small key door
#_00CDBC: dw obj27A6-RoomDrawObjectData ; 0x1E - Big key door
#_00CDBE: dw obj27BE-RoomDrawObjectData ; 0x20 - Small key stairs (upwards)
#_00CDC0: dw obj27BE-RoomDrawObjectData ; 0x22 - Small key stairs (downwards)
#_00CDC2: dw obj27D6-RoomDrawObjectData ; 0x24 - Small key stairs (lower layer; upwards)
#_00CDC4: dw obj27D6-RoomDrawObjectData ; 0x26 - Small key stairs (lower layer; downwards)
#_00CDC6: dw obj27EE-RoomDrawObjectData ; 0x28 - Dash wall
#_00CDC8: dw obj2806-RoomDrawObjectData ; 0x2A - Bombable cave exit
#_00CDCA: dw obj2806-RoomDrawObjectData ; 0x2C - Unopenable, double-sided big key door
#_00CDCC: dw obj281E-RoomDrawObjectData ; 0x2E - Bombable door
#_00CDCE: dw obj2836-RoomDrawObjectData ; 0x30 - Exploding wall
#_00CDD0: dw obj2836-RoomDrawObjectData ; 0x32 - Curtain door
#_00CDD2: dw obj2836-RoomDrawObjectData ; 0x34 - Unusable bottom-sided shutter door
#_00CDD4: dw obj2836-RoomDrawObjectData ; 0x36 - Bottom-sided shutter door
#_00CDD6: dw obj284E-RoomDrawObjectData ; 0x38 - Top-sided shutter door
#_00CDD8: dw obj2866-RoomDrawObjectData ; 0x3A - Unusable normal door (lower layer)
#_00CDDA: dw obj2866-RoomDrawObjectData ; 0x3C - Unusable normal door (lower layer)
#_00CDDC: dw obj2866-RoomDrawObjectData ; 0x3E - Unusable normal door (lower layer)
#_00CDDE: dw obj2866-RoomDrawObjectData ; 0x40 - Normal door (lower layer; used with one-sided shutters)
#_00CDE0: dw obj287E-RoomDrawObjectData ; 0x42 - Unused double-sided shutter
#_00CDE2: dw obj2896-RoomDrawObjectData ; 0x44 - Double-sided shutter (lower layer)
#_00CDE4: dw obj28AE-RoomDrawObjectData ; 0x46 - Explicit room door
#_00CDE6: dw obj28C6-RoomDrawObjectData ; 0x48 - Bottom-sided shutter door (lower layer)
#_00CDE8: dw obj28DE-RoomDrawObjectData ; 0x4A - Top-sided shutter door (lower layer)
#_00CDEA: dw obj28F6-RoomDrawObjectData ; 0x4C - Unusable normal door (lower layer)
#_00CDEC: dw obj28F6-RoomDrawObjectData ; 0x4E - Unusable normal door (lower layer)
#_00CDEE: dw obj28F6-RoomDrawObjectData ; 0x50 - Unusable normal door (lower layer)
#_00CDF0: dw obj290E-RoomDrawObjectData ; 0x52 - Unusable bombed-open door (lower layer)
#_00CDF2: dw obj2926-RoomDrawObjectData ; 0x54 - Unusable glitchy door (lower layer)
#_00CDF4: dw obj2958-RoomDrawObjectData ; 0x56 - Unusable glitchy door (lower layer)
#_00CDF6: dw obj2978-RoomDrawObjectData ; 0x58 - Unusable normal door (lower layer)
#_00CDF8: dw obj2990-RoomDrawObjectData ; 0x5A - Unusable glitchy/stairs up (lower layer)
#_00CDFA: dw obj2990-RoomDrawObjectData ; 0x5C - Unusable glitchy/stairs up (lower layer)
#_00CDFC: dw obj2990-RoomDrawObjectData ; 0x5E - Unusable glitchy/stairs up (lower layer)
#_00CDFE: dw obj2990-RoomDrawObjectData ; 0x60 - Unusable glitchy/stairs up (lower layer)
#_00CE00: dw obj29A8-RoomDrawObjectData ; 0x62 - Unusable glitchy/stairs down (lower layer)
#_00CE02: dw obj29C0-RoomDrawObjectData ; 0x64 - Unusable glitchy/stairs up (lower layer)
#_00CE04: dw obj29D8-RoomDrawObjectData ; 0x66 - Unusable glitchy/stairs down (lower layer)

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_South:
#_00CE06: dw obj29F0-RoomDrawObjectData
#_00CE08: dw obj2A08-RoomDrawObjectData
#_00CE0A: dw obj2A08-RoomDrawObjectData
#_00CE0C: dw obj2A20-RoomDrawObjectData
#_00CE0E: dw obj2A20-RoomDrawObjectData
#_00CE10: dw obj2A20-RoomDrawObjectData
#_00CE12: dw obj2A20-RoomDrawObjectData
#_00CE14: dw obj2A20-RoomDrawObjectData
#_00CE16: dw obj2A20-RoomDrawObjectData
#_00CE18: dw obj2A38-RoomDrawObjectData
#_00CE1A: dw obj2A38-RoomDrawObjectData
#_00CE1C: dw obj2A38-RoomDrawObjectData
#_00CE1E: dw obj2A38-RoomDrawObjectData
#_00CE20: dw obj2A50-RoomDrawObjectData
#_00CE22: dw obj2A68-RoomDrawObjectData
#_00CE24: dw obj2A80-RoomDrawObjectData
#_00CE26: dw obj2A98-RoomDrawObjectData
#_00CE28: dw obj2A98-RoomDrawObjectData
#_00CE2A: dw obj2A98-RoomDrawObjectData
#_00CE2C: dw obj2A98-RoomDrawObjectData
#_00CE2E: dw obj2A98-RoomDrawObjectData
#_00CE30: dw obj2AB0-RoomDrawObjectData
#_00CE32: dw obj2AC8-RoomDrawObjectData
#_00CE34: dw obj2AE0-RoomDrawObjectData
#_00CE36: dw obj2AF8-RoomDrawObjectData
#_00CE38: dw obj2AF8-RoomDrawObjectData
#_00CE3A: dw obj2AF8-RoomDrawObjectData
#_00CE3C: dw obj2AF8-RoomDrawObjectData
#_00CE3E: dw obj2B10-RoomDrawObjectData
#_00CE40: dw obj2B28-RoomDrawObjectData
#_00CE42: dw obj2B28-RoomDrawObjectData
#_00CE44: dw obj2B28-RoomDrawObjectData
#_00CE46: dw obj2B28-RoomDrawObjectData
#_00CE48: dw obj2B40-RoomDrawObjectData
#_00CE4A: dw obj2B58-RoomDrawObjectData
#_00CE4C: dw obj2B70-RoomDrawObjectData
#_00CE4E: dw obj2B88-RoomDrawObjectData
#_00CE50: dw obj2BA0-RoomDrawObjectData
#_00CE52: dw obj2BB8-RoomDrawObjectData
#_00CE54: dw obj2BB8-RoomDrawObjectData
#_00CE56: dw obj2BB8-RoomDrawObjectData
#_00CE58: dw obj2BD0-RoomDrawObjectData
#_00CE5A: dw obj2BE8-RoomDrawObjectData
#_00CE5C: dw obj2C1A-RoomDrawObjectData
#_00CE5E: dw obj2C3A-RoomDrawObjectData
#_00CE60: dw obj2C52-RoomDrawObjectData
#_00CE62: dw obj2C6A-RoomDrawObjectData
#_00CE64: dw obj2C6A-RoomDrawObjectData

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_West:
#_00CE66: dw obj2C6A-RoomDrawObjectData
#_00CE68: dw obj2C82-RoomDrawObjectData
#_00CE6A: dw obj2C82-RoomDrawObjectData
#_00CE6C: dw obj2C9A-RoomDrawObjectData
#_00CE6E: dw obj2C9A-RoomDrawObjectData
#_00CE70: dw obj2C9A-RoomDrawObjectData
#_00CE72: dw obj2C9A-RoomDrawObjectData
#_00CE74: dw obj2C9A-RoomDrawObjectData
#_00CE76: dw obj2C9A-RoomDrawObjectData
#_00CE78: dw obj2CB2-RoomDrawObjectData
#_00CE7A: dw obj2CB2-RoomDrawObjectData
#_00CE7C: dw obj2CB2-RoomDrawObjectData
#_00CE7E: dw obj2CB2-RoomDrawObjectData
#_00CE80: dw obj2CCA-RoomDrawObjectData
#_00CE82: dw obj2CE2-RoomDrawObjectData
#_00CE84: dw obj2CFA-RoomDrawObjectData
#_00CE86: dw obj2CFA-RoomDrawObjectData
#_00CE88: dw obj2CFA-RoomDrawObjectData
#_00CE8A: dw obj2CFA-RoomDrawObjectData
#_00CE8C: dw obj2CFA-RoomDrawObjectData
#_00CE8E: dw obj2CFA-RoomDrawObjectData
#_00CE90: dw obj2D12-RoomDrawObjectData
#_00CE92: dw obj2D12-RoomDrawObjectData
#_00CE94: dw obj2D2A-RoomDrawObjectData
#_00CE96: dw obj2D42-RoomDrawObjectData
#_00CE98: dw obj2D42-RoomDrawObjectData
#_00CE9A: dw obj2D42-RoomDrawObjectData
#_00CE9C: dw obj2D42-RoomDrawObjectData
#_00CE9E: dw obj2D5A-RoomDrawObjectData
#_00CEA0: dw obj2D72-RoomDrawObjectData
#_00CEA2: dw obj2D72-RoomDrawObjectData
#_00CEA4: dw obj2D72-RoomDrawObjectData
#_00CEA6: dw obj2D72-RoomDrawObjectData
#_00CEA8: dw obj2D8A-RoomDrawObjectData
#_00CEAA: dw obj2DA2-RoomDrawObjectData
#_00CEAC: dw obj2DBA-RoomDrawObjectData
#_00CEAE: dw obj2DD2-RoomDrawObjectData
#_00CEB0: dw obj2DEA-RoomDrawObjectData
#_00CEB2: dw obj2E02-RoomDrawObjectData
#_00CEB4: dw obj2E02-RoomDrawObjectData
#_00CEB6: dw obj2E02-RoomDrawObjectData
#_00CEB8: dw obj2E1A-RoomDrawObjectData
#_00CEBA: dw obj2E32-RoomDrawObjectData
#_00CEBC: dw obj2E32-RoomDrawObjectData
#_00CEBE: dw obj2E52-RoomDrawObjectData
#_00CEC0: dw obj2E6A-RoomDrawObjectData
#_00CEC2: dw obj2E6A-RoomDrawObjectData
#_00CEC4: dw obj2E6A-RoomDrawObjectData

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_East:
#_00CEC6: dw obj2E6A-RoomDrawObjectData
#_00CEC8: dw obj2E82-RoomDrawObjectData
#_00CECA: dw obj2E82-RoomDrawObjectData
#_00CECC: dw obj2E9A-RoomDrawObjectData
#_00CECE: dw obj2E9A-RoomDrawObjectData
#_00CED0: dw obj2E9A-RoomDrawObjectData
#_00CED2: dw obj2E9A-RoomDrawObjectData
#_00CED4: dw obj2E9A-RoomDrawObjectData
#_00CED6: dw obj2E9A-RoomDrawObjectData
#_00CED8: dw obj2EB2-RoomDrawObjectData
#_00CEDA: dw obj2EB2-RoomDrawObjectData
#_00CEDC: dw obj2EB2-RoomDrawObjectData
#_00CEDE: dw obj2EB2-RoomDrawObjectData
#_00CEE0: dw obj2ECA-RoomDrawObjectData
#_00CEE2: dw obj2EE2-RoomDrawObjectData
#_00CEE4: dw obj2EFA-RoomDrawObjectData
#_00CEE6: dw obj2EFA-RoomDrawObjectData
#_00CEE8: dw obj2EFA-RoomDrawObjectData
#_00CEEA: dw obj2EFA-RoomDrawObjectData
#_00CEEC: dw obj2EFA-RoomDrawObjectData
#_00CEEE: dw obj2EFA-RoomDrawObjectData
#_00CEF0: dw obj2F12-RoomDrawObjectData
#_00CEF2: dw obj2F12-RoomDrawObjectData
#_00CEF4: dw obj2F2A-RoomDrawObjectData
#_00CEF6: dw obj2F42-RoomDrawObjectData
#_00CEF8: dw obj2F42-RoomDrawObjectData
#_00CEFA: dw obj2F42-RoomDrawObjectData
#_00CEFC: dw obj2F42-RoomDrawObjectData
#_00CEFE: dw obj2F5A-RoomDrawObjectData
#_00CF00: dw obj2F72-RoomDrawObjectData
#_00CF02: dw obj2F72-RoomDrawObjectData
#_00CF04: dw obj2F72-RoomDrawObjectData
#_00CF06: dw obj2F72-RoomDrawObjectData
#_00CF08: dw obj2F8A-RoomDrawObjectData
#_00CF0A: dw obj2FA2-RoomDrawObjectData
#_00CF0C: dw obj2FBA-RoomDrawObjectData
#_00CF0E: dw obj2FD2-RoomDrawObjectData
#_00CF10: dw obj2FEA-RoomDrawObjectData
#_00CF12: dw obj3002-RoomDrawObjectData
#_00CF14: dw obj3002-RoomDrawObjectData
#_00CF16: dw obj3002-RoomDrawObjectData
#_00CF18: dw obj301A-RoomDrawObjectData
#_00CF1A: dw obj3032-RoomDrawObjectData
#_00CF1C: dw obj3032-RoomDrawObjectData
#_00CF1E: dw obj3052-RoomDrawObjectData
#_00CF20: dw obj306A-RoomDrawObjectData
#_00CF22: dw obj306A-RoomDrawObjectData

;===================================================================================================

DoorAnimGFXDataOffset_North:
#_00CF24: dw obj306A-RoomDrawObjectData ; Lower layer shutter
#_00CF26: dw obj306A-RoomDrawObjectData ; Key doors
#_00CF28: dw obj3082-RoomDrawObjectData ; Shutters
#_00CF2A: dw obj309A-RoomDrawObjectData ; Lower layer key door

DoorAnimGFXDataOffset_South:
#_00CF2C: dw obj30B2-RoomDrawObjectData ; Lower layer shutter
#_00CF2E: dw obj30CA-RoomDrawObjectData ; Key doors
#_00CF30: dw obj30E2-RoomDrawObjectData ; Shutters
#_00CF32: dw obj30FA-RoomDrawObjectData ; Lower layer key door

DoorAnimGFXDataOffset_West:
#_00CF34: dw obj3112-RoomDrawObjectData ; Lower layer shutter
#_00CF36: dw obj312A-RoomDrawObjectData ; Key doors
#_00CF38: dw obj3142-RoomDrawObjectData ; Shutters
#_00CF3A: dw obj315A-RoomDrawObjectData ; Lower layer key door

DoorAnimGFXDataOffset_East:
#_00CF3C: dw obj3172-RoomDrawObjectData ; Lower layer shutter
#_00CF3E: dw obj318A-RoomDrawObjectData ; Key doors
#_00CF40: dw obj31A2-RoomDrawObjectData ; Shutters
#_00CF42: dw obj31BA-RoomDrawObjectData ; Lower layer key door
#_00CF44: dw obj31D2-RoomDrawObjectData ; Unused cool looking shutter

;===================================================================================================
; FREE ROM: 0x3A
;===================================================================================================
NULL_00CF46:
#_00CF46: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF4E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF56: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF5E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF66: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF6E: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF76: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00CF7E: db $FF, $FF

;===================================================================================================

GFXSheetPointers:

.background_bank
#_00CF80: db GFX_00>>16
#_00CF81: db GFX_01>>16
#_00CF82: db GFX_02>>16
#_00CF83: db GFX_03>>16
#_00CF84: db GFX_04>>16
#_00CF85: db GFX_05>>16
#_00CF86: db GFX_06>>16
#_00CF87: db GFX_07>>16
#_00CF88: db GFX_08>>16
#_00CF89: db GFX_09>>16
#_00CF8A: db GFX_0A>>16
#_00CF8B: db GFX_0B>>16
#_00CF8C: db GFX_0C>>16
#_00CF8D: db GFX_0D>>16
#_00CF8E: db GFX_0E>>16
#_00CF8F: db GFX_0F>>16
#_00CF90: db GFX_10>>16
#_00CF91: db GFX_11>>16
#_00CF92: db GFX_12>>16
#_00CF93: db GFX_13>>16
#_00CF94: db GFX_14>>16
#_00CF95: db GFX_15>>16
#_00CF96: db GFX_16>>16
#_00CF97: db GFX_17>>16
#_00CF98: db GFX_18>>16
#_00CF99: db GFX_19>>16
#_00CF9A: db GFX_1A>>16
#_00CF9B: db GFX_1B>>16
#_00CF9C: db GFX_1C>>16
#_00CF9D: db GFX_1D>>16
#_00CF9E: db GFX_1E>>16
#_00CF9F: db GFX_1F>>16
#_00CFA0: db GFX_20>>16
#_00CFA1: db GFX_21>>16
#_00CFA2: db GFX_22>>16
#_00CFA3: db GFX_23>>16
#_00CFA4: db GFX_24>>16
#_00CFA5: db GFX_25>>16
#_00CFA6: db GFX_26>>16
#_00CFA7: db GFX_27>>16
#_00CFA8: db GFX_28>>16
#_00CFA9: db GFX_29>>16
#_00CFAA: db GFX_2A>>16
#_00CFAB: db GFX_2B>>16
#_00CFAC: db GFX_2C>>16
#_00CFAD: db GFX_2D>>16
#_00CFAE: db GFX_2E>>16
#_00CFAF: db GFX_2F>>16
#_00CFB0: db GFX_30>>16
#_00CFB1: db GFX_31>>16
#_00CFB2: db GFX_32>>16
#_00CFB3: db GFX_33>>16
#_00CFB4: db GFX_34>>16
#_00CFB5: db GFX_35>>16
#_00CFB6: db GFX_36>>16
#_00CFB7: db GFX_37>>16
#_00CFB8: db GFX_38>>16
#_00CFB9: db GFX_39>>16
#_00CFBA: db GFX_3A>>16
#_00CFBB: db GFX_3B>>16
#_00CFBC: db GFX_3C>>16
#_00CFBD: db GFX_3D>>16
#_00CFBE: db GFX_3E>>16
#_00CFBF: db GFX_3F>>16
#_00CFC0: db GFX_40>>16
#_00CFC1: db GFX_41>>16
#_00CFC2: db GFX_42>>16
#_00CFC3: db GFX_43>>16
#_00CFC4: db GFX_44>>16
#_00CFC5: db GFX_45>>16
#_00CFC6: db GFX_46>>16
#_00CFC7: db GFX_47>>16
#_00CFC8: db GFX_48>>16
#_00CFC9: db GFX_49>>16
#_00CFCA: db GFX_4A>>16
#_00CFCB: db GFX_4B>>16
#_00CFCC: db GFX_4C>>16
#_00CFCD: db GFX_4D>>16
#_00CFCE: db GFX_4E>>16
#_00CFCF: db GFX_4F>>16
#_00CFD0: db GFX_50>>16
#_00CFD1: db GFX_51>>16
#_00CFD2: db GFX_52>>16
#_00CFD3: db GFX_53>>16
#_00CFD4: db GFX_54>>16
#_00CFD5: db GFX_55>>16
#_00CFD6: db GFX_56>>16
#_00CFD7: db GFX_57>>16
#_00CFD8: db GFX_58>>16
#_00CFD9: db GFX_59>>16
#_00CFDA: db GFX_5A>>16
#_00CFDB: db GFX_5B>>16
#_00CFDC: db GFX_5C>>16
#_00CFDD: db GFX_5D>>16
#_00CFDE: db GFX_5E>>16
#_00CFDF: db GFX_5F>>16
#_00CFE0: db GFX_60>>16
#_00CFE1: db GFX_61>>16
#_00CFE2: db GFX_62>>16
#_00CFE3: db GFX_63>>16
#_00CFE4: db GFX_64>>16
#_00CFE5: db GFX_65>>16
#_00CFE6: db GFX_66>>16
#_00CFE7: db GFX_67>>16
#_00CFE8: db GFX_68>>16
#_00CFE9: db GFX_69>>16
#_00CFEA: db GFX_6A>>16
#_00CFEB: db GFX_6B>>16
#_00CFEC: db GFX_6C>>16
#_00CFED: db GFX_6D>>16
#_00CFEE: db GFX_6E>>16
#_00CFEF: db GFX_6F>>16
#_00CFF0: db GFX_70>>16
#_00CFF1: db GFX_DD>>16
#_00CFF2: db GFX_DE>>16

;---------------------------------------------------------------------------------------------------

.sprite_bank
#_00CFF3: db GFX_73>>16 ; 0x00
#_00CFF4: db GFX_74>>16 ; 0x01
#_00CFF5: db GFX_75>>16 ; 0x02
#_00CFF6: db GFX_76>>16 ; 0x03
#_00CFF7: db GFX_77>>16 ; 0x04
#_00CFF8: db GFX_78>>16 ; 0x05
#_00CFF9: db GFX_79>>16 ; 0x06
#_00CFFA: db GFX_7A>>16 ; 0x07
#_00CFFB: db GFX_7B>>16 ; 0x08
#_00CFFC: db GFX_7C>>16 ; 0x09
#_00CFFD: db GFX_7D>>16 ; 0x0A
#_00CFFE: db GFX_7E>>16 ; 0x0B
#_00CFFF: db GFX_7F>>16 ; 0x0C
#_00D000: db GFX_80>>16 ; 0x0D
#_00D001: db GFX_81>>16 ; 0x0E
#_00D002: db GFX_82>>16 ; 0x0F
#_00D003: db GFX_83>>16 ; 0x10
#_00D004: db GFX_84>>16 ; 0x11
#_00D005: db GFX_85>>16 ; 0x12
#_00D006: db GFX_86>>16 ; 0x13
#_00D007: db GFX_87>>16 ; 0x14
#_00D008: db GFX_88>>16 ; 0x15
#_00D009: db GFX_89>>16 ; 0x16
#_00D00A: db GFX_8A>>16 ; 0x17
#_00D00B: db GFX_8B>>16 ; 0x18
#_00D00C: db GFX_8C>>16 ; 0x19
#_00D00D: db GFX_8D>>16 ; 0x1A
#_00D00E: db GFX_8E>>16 ; 0x1B
#_00D00F: db GFX_8F>>16 ; 0x1C
#_00D010: db GFX_90>>16 ; 0x1D
#_00D011: db GFX_91>>16 ; 0x1E
#_00D012: db GFX_92>>16 ; 0x1F
#_00D013: db GFX_93>>16 ; 0x20
#_00D014: db GFX_94>>16 ; 0x21
#_00D015: db GFX_95>>16 ; 0x22
#_00D016: db GFX_96>>16 ; 0x23
#_00D017: db GFX_97>>16 ; 0x24
#_00D018: db GFX_98>>16 ; 0x25
#_00D019: db GFX_99>>16 ; 0x26
#_00D01A: db GFX_9A>>16 ; 0x27
#_00D01B: db GFX_9B>>16 ; 0x28
#_00D01C: db GFX_9C>>16 ; 0x29
#_00D01D: db GFX_9D>>16 ; 0x2A
#_00D01E: db GFX_9E>>16 ; 0x2B
#_00D01F: db GFX_9F>>16 ; 0x2C
#_00D020: db GFX_A0>>16 ; 0x2D
#_00D021: db GFX_A1>>16 ; 0x2E
#_00D022: db GFX_A2>>16 ; 0x2F
#_00D023: db GFX_A3>>16 ; 0x30
#_00D024: db GFX_A4>>16 ; 0x31
#_00D025: db GFX_A5>>16 ; 0x32
#_00D026: db GFX_A6>>16 ; 0x33
#_00D027: db GFX_A7>>16 ; 0x34
#_00D028: db GFX_A8>>16 ; 0x35
#_00D029: db GFX_A9>>16 ; 0x36
#_00D02A: db GFX_AA>>16 ; 0x37
#_00D02B: db GFX_AB>>16 ; 0x38
#_00D02C: db GFX_AC>>16 ; 0x39
#_00D02D: db GFX_AD>>16 ; 0x3A
#_00D02E: db GFX_AE>>16 ; 0x3B
#_00D02F: db GFX_AF>>16 ; 0x3C
#_00D030: db GFX_B0>>16 ; 0x3D
#_00D031: db GFX_B1>>16 ; 0x3E
#_00D032: db GFX_B2>>16 ; 0x3F
#_00D033: db GFX_B3>>16 ; 0x40
#_00D034: db GFX_B4>>16 ; 0x41
#_00D035: db GFX_B5>>16 ; 0x42
#_00D036: db GFX_B6>>16 ; 0x43
#_00D037: db GFX_B7>>16 ; 0x44
#_00D038: db GFX_B8>>16 ; 0x45
#_00D039: db GFX_B9>>16 ; 0x46
#_00D03A: db GFX_BA>>16 ; 0x47
#_00D03B: db GFX_BB>>16 ; 0x48
#_00D03C: db GFX_BC>>16 ; 0x49
#_00D03D: db GFX_BD>>16 ; 0x4A
#_00D03E: db GFX_BE>>16 ; 0x4B
#_00D03F: db GFX_BF>>16 ; 0x4C
#_00D040: db GFX_C0>>16 ; 0x4D
#_00D041: db GFX_C1>>16 ; 0x4E
#_00D042: db GFX_C2>>16 ; 0x4F
#_00D043: db GFX_C3>>16 ; 0x50
#_00D044: db GFX_C4>>16 ; 0x51
#_00D045: db GFX_C5>>16 ; 0x52
#_00D046: db GFX_C6>>16 ; 0x53
#_00D047: db GFX_C7>>16 ; 0x54
#_00D048: db GFX_C8>>16 ; 0x55
#_00D049: db GFX_C9>>16 ; 0x56
#_00D04A: db GFX_CA>>16 ; 0x57
#_00D04B: db GFX_CB>>16 ; 0x58
#_00D04C: db GFX_CC>>16 ; 0x59
#_00D04D: db GFX_CD>>16 ; 0x5A
#_00D04E: db GFX_CE>>16 ; 0x5B
#_00D04F: db GFX_CF>>16 ; 0x5C
#_00D050: db GFX_D0>>16 ; 0x5D
#_00D051: db GFX_D1>>16 ; 0x5E
#_00D052: db GFX_D2>>16 ; 0x5F
#_00D053: db GFX_D3>>16 ; 0x60
#_00D054: db GFX_D4>>16 ; 0x61
#_00D055: db GFX_D5>>16 ; 0x62
#_00D056: db GFX_D6>>16 ; 0x63
#_00D057: db GFX_D7>>16 ; 0x64
#_00D058: db GFX_D8>>16 ; 0x65
#_00D059: db GFX_D9>>16 ; 0x66
#_00D05A: db GFX_DA>>16 ; 0x67
#_00D05B: db GFX_DB>>16 ; 0x68
#_00D05C: db GFX_DC>>16 ; 0x69
#_00D05D: db GFX_DD>>16 ; 0x6A
#_00D05E: db GFX_DE>>16 ; 0x6B

;---------------------------------------------------------------------------------------------------

.background_high
#_00D05F: db GFX_00>>8
#_00D060: db GFX_01>>8
#_00D061: db GFX_02>>8
#_00D062: db GFX_03>>8
#_00D063: db GFX_04>>8
#_00D064: db GFX_05>>8
#_00D065: db GFX_06>>8
#_00D066: db GFX_07>>8
#_00D067: db GFX_08>>8
#_00D068: db GFX_09>>8
#_00D069: db GFX_0A>>8
#_00D06A: db GFX_0B>>8
#_00D06B: db GFX_0C>>8
#_00D06C: db GFX_0D>>8
#_00D06D: db GFX_0E>>8
#_00D06E: db GFX_0F>>8
#_00D06F: db GFX_10>>8
#_00D070: db GFX_11>>8
#_00D071: db GFX_12>>8
#_00D072: db GFX_13>>8
#_00D073: db GFX_14>>8
#_00D074: db GFX_15>>8
#_00D075: db GFX_16>>8
#_00D076: db GFX_17>>8
#_00D077: db GFX_18>>8
#_00D078: db GFX_19>>8
#_00D079: db GFX_1A>>8
#_00D07A: db GFX_1B>>8
#_00D07B: db GFX_1C>>8
#_00D07C: db GFX_1D>>8
#_00D07D: db GFX_1E>>8
#_00D07E: db GFX_1F>>8
#_00D07F: db GFX_20>>8
#_00D080: db GFX_21>>8
#_00D081: db GFX_22>>8
#_00D082: db GFX_23>>8
#_00D083: db GFX_24>>8
#_00D084: db GFX_25>>8
#_00D085: db GFX_26>>8
#_00D086: db GFX_27>>8
#_00D087: db GFX_28>>8
#_00D088: db GFX_29>>8
#_00D089: db GFX_2A>>8
#_00D08A: db GFX_2B>>8
#_00D08B: db GFX_2C>>8
#_00D08C: db GFX_2D>>8
#_00D08D: db GFX_2E>>8
#_00D08E: db GFX_2F>>8
#_00D08F: db GFX_30>>8
#_00D090: db GFX_31>>8
#_00D091: db GFX_32>>8
#_00D092: db GFX_33>>8
#_00D093: db GFX_34>>8
#_00D094: db GFX_35>>8
#_00D095: db GFX_36>>8
#_00D096: db GFX_37>>8
#_00D097: db GFX_38>>8
#_00D098: db GFX_39>>8
#_00D099: db GFX_3A>>8
#_00D09A: db GFX_3B>>8
#_00D09B: db GFX_3C>>8
#_00D09C: db GFX_3D>>8
#_00D09D: db GFX_3E>>8
#_00D09E: db GFX_3F>>8
#_00D09F: db GFX_40>>8
#_00D0A0: db GFX_41>>8
#_00D0A1: db GFX_42>>8
#_00D0A2: db GFX_43>>8
#_00D0A3: db GFX_44>>8
#_00D0A4: db GFX_45>>8
#_00D0A5: db GFX_46>>8
#_00D0A6: db GFX_47>>8
#_00D0A7: db GFX_48>>8
#_00D0A8: db GFX_49>>8
#_00D0A9: db GFX_4A>>8
#_00D0AA: db GFX_4B>>8
#_00D0AB: db GFX_4C>>8
#_00D0AC: db GFX_4D>>8
#_00D0AD: db GFX_4E>>8
#_00D0AE: db GFX_4F>>8
#_00D0AF: db GFX_50>>8
#_00D0B0: db GFX_51>>8
#_00D0B1: db GFX_52>>8
#_00D0B2: db GFX_53>>8
#_00D0B3: db GFX_54>>8
#_00D0B4: db GFX_55>>8
#_00D0B5: db GFX_56>>8
#_00D0B6: db GFX_57>>8
#_00D0B7: db GFX_58>>8
#_00D0B8: db GFX_59>>8
#_00D0B9: db GFX_5A>>8
#_00D0BA: db GFX_5B>>8
#_00D0BB: db GFX_5C>>8
#_00D0BC: db GFX_5D>>8
#_00D0BD: db GFX_5E>>8
#_00D0BE: db GFX_5F>>8
#_00D0BF: db GFX_60>>8
#_00D0C0: db GFX_61>>8
#_00D0C1: db GFX_62>>8
#_00D0C2: db GFX_63>>8
#_00D0C3: db GFX_64>>8
#_00D0C4: db GFX_65>>8
#_00D0C5: db GFX_66>>8
#_00D0C6: db GFX_67>>8
#_00D0C7: db GFX_68>>8
#_00D0C8: db GFX_69>>8
#_00D0C9: db GFX_6A>>8
#_00D0CA: db GFX_6B>>8
#_00D0CB: db GFX_6C>>8
#_00D0CC: db GFX_6D>>8
#_00D0CD: db GFX_6E>>8
#_00D0CE: db GFX_6F>>8
#_00D0CF: db GFX_70>>8
#_00D0D0: db GFX_DD>>8
#_00D0D1: db GFX_DE>>8

;---------------------------------------------------------------------------------------------------

.sprite_high
#_00D0D2: db GFX_73>>8 ; 0x00
#_00D0D3: db GFX_74>>8 ; 0x01
#_00D0D4: db GFX_75>>8 ; 0x02
#_00D0D5: db GFX_76>>8 ; 0x03
#_00D0D6: db GFX_77>>8 ; 0x04
#_00D0D7: db GFX_78>>8 ; 0x05
#_00D0D8: db GFX_79>>8 ; 0x06
#_00D0D9: db GFX_7A>>8 ; 0x07
#_00D0DA: db GFX_7B>>8 ; 0x08
#_00D0DB: db GFX_7C>>8 ; 0x09
#_00D0DC: db GFX_7D>>8 ; 0x0A
#_00D0DD: db GFX_7E>>8 ; 0x0B
#_00D0DE: db GFX_7F>>8 ; 0x0C
#_00D0DF: db GFX_80>>8 ; 0x0D
#_00D0E0: db GFX_81>>8 ; 0x0E
#_00D0E1: db GFX_82>>8 ; 0x0F
#_00D0E2: db GFX_83>>8 ; 0x10
#_00D0E3: db GFX_84>>8 ; 0x11
#_00D0E4: db GFX_85>>8 ; 0x12
#_00D0E5: db GFX_86>>8 ; 0x13
#_00D0E6: db GFX_87>>8 ; 0x14
#_00D0E7: db GFX_88>>8 ; 0x15
#_00D0E8: db GFX_89>>8 ; 0x16
#_00D0E9: db GFX_8A>>8 ; 0x17
#_00D0EA: db GFX_8B>>8 ; 0x18
#_00D0EB: db GFX_8C>>8 ; 0x19
#_00D0EC: db GFX_8D>>8 ; 0x1A
#_00D0ED: db GFX_8E>>8 ; 0x1B
#_00D0EE: db GFX_8F>>8 ; 0x1C
#_00D0EF: db GFX_90>>8 ; 0x1D
#_00D0F0: db GFX_91>>8 ; 0x1E
#_00D0F1: db GFX_92>>8 ; 0x1F
#_00D0F2: db GFX_93>>8 ; 0x20
#_00D0F3: db GFX_94>>8 ; 0x21
#_00D0F4: db GFX_95>>8 ; 0x22
#_00D0F5: db GFX_96>>8 ; 0x23
#_00D0F6: db GFX_97>>8 ; 0x24
#_00D0F7: db GFX_98>>8 ; 0x25
#_00D0F8: db GFX_99>>8 ; 0x26
#_00D0F9: db GFX_9A>>8 ; 0x27
#_00D0FA: db GFX_9B>>8 ; 0x28
#_00D0FB: db GFX_9C>>8 ; 0x29
#_00D0FC: db GFX_9D>>8 ; 0x2A
#_00D0FD: db GFX_9E>>8 ; 0x2B
#_00D0FE: db GFX_9F>>8 ; 0x2C
#_00D0FF: db GFX_A0>>8 ; 0x2D
#_00D100: db GFX_A1>>8 ; 0x2E
#_00D101: db GFX_A2>>8 ; 0x2F
#_00D102: db GFX_A3>>8 ; 0x30
#_00D103: db GFX_A4>>8 ; 0x31
#_00D104: db GFX_A5>>8 ; 0x32
#_00D105: db GFX_A6>>8 ; 0x33
#_00D106: db GFX_A7>>8 ; 0x34
#_00D107: db GFX_A8>>8 ; 0x35
#_00D108: db GFX_A9>>8 ; 0x36
#_00D109: db GFX_AA>>8 ; 0x37
#_00D10A: db GFX_AB>>8 ; 0x38
#_00D10B: db GFX_AC>>8 ; 0x39
#_00D10C: db GFX_AD>>8 ; 0x3A
#_00D10D: db GFX_AE>>8 ; 0x3B
#_00D10E: db GFX_AF>>8 ; 0x3C
#_00D10F: db GFX_B0>>8 ; 0x3D
#_00D110: db GFX_B1>>8 ; 0x3E
#_00D111: db GFX_B2>>8 ; 0x3F
#_00D112: db GFX_B3>>8 ; 0x40
#_00D113: db GFX_B4>>8 ; 0x41
#_00D114: db GFX_B5>>8 ; 0x42
#_00D115: db GFX_B6>>8 ; 0x43
#_00D116: db GFX_B7>>8 ; 0x44
#_00D117: db GFX_B8>>8 ; 0x45
#_00D118: db GFX_B9>>8 ; 0x46
#_00D119: db GFX_BA>>8 ; 0x47
#_00D11A: db GFX_BB>>8 ; 0x48
#_00D11B: db GFX_BC>>8 ; 0x49
#_00D11C: db GFX_BD>>8 ; 0x4A
#_00D11D: db GFX_BE>>8 ; 0x4B
#_00D11E: db GFX_BF>>8 ; 0x4C
#_00D11F: db GFX_C0>>8 ; 0x4D
#_00D120: db GFX_C1>>8 ; 0x4E
#_00D121: db GFX_C2>>8 ; 0x4F
#_00D122: db GFX_C3>>8 ; 0x50
#_00D123: db GFX_C4>>8 ; 0x51
#_00D124: db GFX_C5>>8 ; 0x52
#_00D125: db GFX_C6>>8 ; 0x53
#_00D126: db GFX_C7>>8 ; 0x54
#_00D127: db GFX_C8>>8 ; 0x55
#_00D128: db GFX_C9>>8 ; 0x56
#_00D129: db GFX_CA>>8 ; 0x57
#_00D12A: db GFX_CB>>8 ; 0x58
#_00D12B: db GFX_CC>>8 ; 0x59
#_00D12C: db GFX_CD>>8 ; 0x5A
#_00D12D: db GFX_CE>>8 ; 0x5B
#_00D12E: db GFX_CF>>8 ; 0x5C
#_00D12F: db GFX_D0>>8 ; 0x5D
#_00D130: db GFX_D1>>8 ; 0x5E
#_00D131: db GFX_D2>>8 ; 0x5F
#_00D132: db GFX_D3>>8 ; 0x60
#_00D133: db GFX_D4>>8 ; 0x61
#_00D134: db GFX_D5>>8 ; 0x62
#_00D135: db GFX_D6>>8 ; 0x63
#_00D136: db GFX_D7>>8 ; 0x64
#_00D137: db GFX_D8>>8 ; 0x65
#_00D138: db GFX_D9>>8 ; 0x66
#_00D139: db GFX_DA>>8 ; 0x67
#_00D13A: db GFX_DB>>8 ; 0x68
#_00D13B: db GFX_DC>>8 ; 0x69
#_00D13C: db GFX_DD>>8 ; 0x6A
#_00D13D: db GFX_DE>>8 ; 0x6B

;---------------------------------------------------------------------------------------------------

.background_low
#_00D13E: db GFX_00>>0
#_00D13F: db GFX_01>>0
#_00D140: db GFX_02>>0
#_00D141: db GFX_03>>0
#_00D142: db GFX_04>>0
#_00D143: db GFX_05>>0
#_00D144: db GFX_06>>0
#_00D145: db GFX_07>>0
#_00D146: db GFX_08>>0
#_00D147: db GFX_09>>0
#_00D148: db GFX_0A>>0
#_00D149: db GFX_0B>>0
#_00D14A: db GFX_0C>>0
#_00D14B: db GFX_0D>>0
#_00D14C: db GFX_0E>>0
#_00D14D: db GFX_0F>>0
#_00D14E: db GFX_10>>0
#_00D14F: db GFX_11>>0
#_00D150: db GFX_12>>0
#_00D151: db GFX_13>>0
#_00D152: db GFX_14>>0
#_00D153: db GFX_15>>0
#_00D154: db GFX_16>>0
#_00D155: db GFX_17>>0
#_00D156: db GFX_18>>0
#_00D157: db GFX_19>>0
#_00D158: db GFX_1A>>0
#_00D159: db GFX_1B>>0
#_00D15A: db GFX_1C>>0
#_00D15B: db GFX_1D>>0
#_00D15C: db GFX_1E>>0
#_00D15D: db GFX_1F>>0
#_00D15E: db GFX_20>>0
#_00D15F: db GFX_21>>0
#_00D160: db GFX_22>>0
#_00D161: db GFX_23>>0
#_00D162: db GFX_24>>0
#_00D163: db GFX_25>>0
#_00D164: db GFX_26>>0
#_00D165: db GFX_27>>0
#_00D166: db GFX_28>>0
#_00D167: db GFX_29>>0
#_00D168: db GFX_2A>>0
#_00D169: db GFX_2B>>0
#_00D16A: db GFX_2C>>0
#_00D16B: db GFX_2D>>0
#_00D16C: db GFX_2E>>0
#_00D16D: db GFX_2F>>0
#_00D16E: db GFX_30>>0
#_00D16F: db GFX_31>>0
#_00D170: db GFX_32>>0
#_00D171: db GFX_33>>0
#_00D172: db GFX_34>>0
#_00D173: db GFX_35>>0
#_00D174: db GFX_36>>0
#_00D175: db GFX_37>>0
#_00D176: db GFX_38>>0
#_00D177: db GFX_39>>0
#_00D178: db GFX_3A>>0
#_00D179: db GFX_3B>>0
#_00D17A: db GFX_3C>>0
#_00D17B: db GFX_3D>>0
#_00D17C: db GFX_3E>>0
#_00D17D: db GFX_3F>>0
#_00D17E: db GFX_40>>0
#_00D17F: db GFX_41>>0
#_00D180: db GFX_42>>0
#_00D181: db GFX_43>>0
#_00D182: db GFX_44>>0
#_00D183: db GFX_45>>0
#_00D184: db GFX_46>>0
#_00D185: db GFX_47>>0
#_00D186: db GFX_48>>0
#_00D187: db GFX_49>>0
#_00D188: db GFX_4A>>0
#_00D189: db GFX_4B>>0
#_00D18A: db GFX_4C>>0
#_00D18B: db GFX_4D>>0
#_00D18C: db GFX_4E>>0
#_00D18D: db GFX_4F>>0
#_00D18E: db GFX_50>>0
#_00D18F: db GFX_51>>0
#_00D190: db GFX_52>>0
#_00D191: db GFX_53>>0
#_00D192: db GFX_54>>0
#_00D193: db GFX_55>>0
#_00D194: db GFX_56>>0
#_00D195: db GFX_57>>0
#_00D196: db GFX_58>>0
#_00D197: db GFX_59>>0
#_00D198: db GFX_5A>>0
#_00D199: db GFX_5B>>0
#_00D19A: db GFX_5C>>0
#_00D19B: db GFX_5D>>0
#_00D19C: db GFX_5E>>0
#_00D19D: db GFX_5F>>0
#_00D19E: db GFX_60>>0
#_00D19F: db GFX_61>>0
#_00D1A0: db GFX_62>>0
#_00D1A1: db GFX_63>>0
#_00D1A2: db GFX_64>>0
#_00D1A3: db GFX_65>>0
#_00D1A4: db GFX_66>>0
#_00D1A5: db GFX_67>>0
#_00D1A6: db GFX_68>>0
#_00D1A7: db GFX_69>>0
#_00D1A8: db GFX_6A>>0
#_00D1A9: db GFX_6B>>0
#_00D1AA: db GFX_6C>>0
#_00D1AB: db GFX_6D>>0
#_00D1AC: db GFX_6E>>0
#_00D1AD: db GFX_6F>>0
#_00D1AE: db GFX_70>>0
#_00D1AF: db GFX_DD>>0
#_00D1B0: db GFX_DE>>0

;---------------------------------------------------------------------------------------------------

.sprite_low
#_00D1B1: db GFX_73>>0 ; 0x00
#_00D1B2: db GFX_74>>0 ; 0x01
#_00D1B3: db GFX_75>>0 ; 0x02
#_00D1B4: db GFX_76>>0 ; 0x03
#_00D1B5: db GFX_77>>0 ; 0x04
#_00D1B6: db GFX_78>>0 ; 0x05
#_00D1B7: db GFX_79>>0 ; 0x06
#_00D1B8: db GFX_7A>>0 ; 0x07
#_00D1B9: db GFX_7B>>0 ; 0x08
#_00D1BA: db GFX_7C>>0 ; 0x09
#_00D1BB: db GFX_7D>>0 ; 0x0A
#_00D1BC: db GFX_7E>>0 ; 0x0B
#_00D1BD: db GFX_7F>>0 ; 0x0C
#_00D1BE: db GFX_80>>0 ; 0x0D
#_00D1BF: db GFX_81>>0 ; 0x0E
#_00D1C0: db GFX_82>>0 ; 0x0F
#_00D1C1: db GFX_83>>0 ; 0x10
#_00D1C2: db GFX_84>>0 ; 0x11
#_00D1C3: db GFX_85>>0 ; 0x12
#_00D1C4: db GFX_86>>0 ; 0x13
#_00D1C5: db GFX_87>>0 ; 0x14
#_00D1C6: db GFX_88>>0 ; 0x15
#_00D1C7: db GFX_89>>0 ; 0x16
#_00D1C8: db GFX_8A>>0 ; 0x17
#_00D1C9: db GFX_8B>>0 ; 0x18
#_00D1CA: db GFX_8C>>0 ; 0x19
#_00D1CB: db GFX_8D>>0 ; 0x1A
#_00D1CC: db GFX_8E>>0 ; 0x1B
#_00D1CD: db GFX_8F>>0 ; 0x1C
#_00D1CE: db GFX_90>>0 ; 0x1D
#_00D1CF: db GFX_91>>0 ; 0x1E
#_00D1D0: db GFX_92>>0 ; 0x1F
#_00D1D1: db GFX_93>>0 ; 0x20
#_00D1D2: db GFX_94>>0 ; 0x21
#_00D1D3: db GFX_95>>0 ; 0x22
#_00D1D4: db GFX_96>>0 ; 0x23
#_00D1D5: db GFX_97>>0 ; 0x24
#_00D1D6: db GFX_98>>0 ; 0x25
#_00D1D7: db GFX_99>>0 ; 0x26
#_00D1D8: db GFX_9A>>0 ; 0x27
#_00D1D9: db GFX_9B>>0 ; 0x28
#_00D1DA: db GFX_9C>>0 ; 0x29
#_00D1DB: db GFX_9D>>0 ; 0x2A
#_00D1DC: db GFX_9E>>0 ; 0x2B
#_00D1DD: db GFX_9F>>0 ; 0x2C
#_00D1DE: db GFX_A0>>0 ; 0x2D
#_00D1DF: db GFX_A1>>0 ; 0x2E
#_00D1E0: db GFX_A2>>0 ; 0x2F
#_00D1E1: db GFX_A3>>0 ; 0x30
#_00D1E2: db GFX_A4>>0 ; 0x31
#_00D1E3: db GFX_A5>>0 ; 0x32
#_00D1E4: db GFX_A6>>0 ; 0x33
#_00D1E5: db GFX_A7>>0 ; 0x34
#_00D1E6: db GFX_A8>>0 ; 0x35
#_00D1E7: db GFX_A9>>0 ; 0x36
#_00D1E8: db GFX_AA>>0 ; 0x37
#_00D1E9: db GFX_AB>>0 ; 0x38
#_00D1EA: db GFX_AC>>0 ; 0x39
#_00D1EB: db GFX_AD>>0 ; 0x3A
#_00D1EC: db GFX_AE>>0 ; 0x3B
#_00D1ED: db GFX_AF>>0 ; 0x3C
#_00D1EE: db GFX_B0>>0 ; 0x3D
#_00D1EF: db GFX_B1>>0 ; 0x3E
#_00D1F0: db GFX_B2>>0 ; 0x3F
#_00D1F1: db GFX_B3>>0 ; 0x40
#_00D1F2: db GFX_B4>>0 ; 0x41
#_00D1F3: db GFX_B5>>0 ; 0x42
#_00D1F4: db GFX_B6>>0 ; 0x43
#_00D1F5: db GFX_B7>>0 ; 0x44
#_00D1F6: db GFX_B8>>0 ; 0x45
#_00D1F7: db GFX_B9>>0 ; 0x46
#_00D1F8: db GFX_BA>>0 ; 0x47
#_00D1F9: db GFX_BB>>0 ; 0x48
#_00D1FA: db GFX_BC>>0 ; 0x49
#_00D1FB: db GFX_BD>>0 ; 0x4A
#_00D1FC: db GFX_BE>>0 ; 0x4B
#_00D1FD: db GFX_BF>>0 ; 0x4C
#_00D1FE: db GFX_C0>>0 ; 0x4D
#_00D1FF: db GFX_C1>>0 ; 0x4E
#_00D200: db GFX_C2>>0 ; 0x4F
#_00D201: db GFX_C3>>0 ; 0x50
#_00D202: db GFX_C4>>0 ; 0x51
#_00D203: db GFX_C5>>0 ; 0x52
#_00D204: db GFX_C6>>0 ; 0x53
#_00D205: db GFX_C7>>0 ; 0x54
#_00D206: db GFX_C8>>0 ; 0x55
#_00D207: db GFX_C9>>0 ; 0x56
#_00D208: db GFX_CA>>0 ; 0x57
#_00D209: db GFX_CB>>0 ; 0x58
#_00D20A: db GFX_CC>>0 ; 0x59
#_00D20B: db GFX_CD>>0 ; 0x5A
#_00D20C: db GFX_CE>>0 ; 0x5B
#_00D20D: db GFX_CF>>0 ; 0x5C
#_00D20E: db GFX_D0>>0 ; 0x5D
#_00D20F: db GFX_D1>>0 ; 0x5E
#_00D210: db GFX_D2>>0 ; 0x5F
#_00D211: db GFX_D3>>0 ; 0x60
#_00D212: db GFX_D4>>0 ; 0x61
#_00D213: db GFX_D5>>0 ; 0x62
#_00D214: db GFX_D6>>0 ; 0x63
#_00D215: db GFX_D7>>0 ; 0x64
#_00D216: db GFX_D8>>0 ; 0x65
#_00D217: db GFX_D9>>0 ; 0x66
#_00D218: db GFX_DA>>0 ; 0x67
#_00D219: db GFX_DB>>0 ; 0x68
#_00D21A: db GFX_DC>>0 ; 0x69
#_00D21B: db GFX_DD>>0 ; 0x6A
#_00D21C: db GFX_DE>>0 ; 0x6B

;===================================================================================================

pool LoadItemGFX

.offset
#_00D21D: dw $0000 ; rods
#_00D21F: dw $0108 ; hammer
#_00D221: dw $00C0 ; bow
#_00D223: dw $0390 ; shovel
#_00D225: dw $03F0 ; Zzz ♪
#_00D227: dw $0438 ; powder dust
#_00D229: dw $0330 ; hookshot
#_00D22B: dw $0048 ; net
#_00D22D: dw $0318 ; cane
#_00D22F: dw $0450 ; book

pool off

;===================================================================================================

LoadItemGFXIntoWRAM4BPPBuffer:
#_00D231: PHB
#_00D232: PHK
#_00D233: PLB

#_00D234: REP #$20

#_00D236: STZ.b $0A
#_00D238: STZ.b $0C

#_00D23A: LDA.w #$0480
#_00D23D: STA.b $06

#_00D23F: SEP #$20

#_00D241: LDA.b #$07
#_00D243: JSR LoadItemGFX_sheet0

#_00D246: LDA.b #$07
#_00D248: JSR LoadItemGFX_sheet0

#_00D24B: LDA.b #$03
#_00D24D: JSR LoadItemGFX_sheet0

#_00D250: LDY.b #$5F
#_00D252: LDA.b #$04
#_00D254: JSR LoadItemGFX_arbitrary_sheet

#_00D257: LDA.b #$03
#_00D259: JSR LoadItemGFX_current_sheet

#_00D25C: LDA.b #$01
#_00D25E: JSR LoadItemGFX_current_sheet

#_00D261: LDA.b #$04
#_00D263: JSR LoadItemGFX_sheet0

#_00D266: LDY.b #$60
#_00D268: LDA.b #$0E
#_00D26A: JSR LoadItemGFX_arbitrary_sheet

#_00D26D: LDA.b #$07
#_00D26F: JSR LoadItemGFX_current_sheet

#_00D272: LDY.b #$5F
#_00D274: LDA.b #$02
#_00D276: JSR LoadItemGFX_arbitrary_sheet

;---------------------------------------------------------------------------------------------------

#_00D279: LDY.b #$54
#_00D27B: JSR Decompress_sprite_low

#_00D27E: REP #$30

#_00D280: LDA.b $00

#_00D282: LDX.w #$1480

#_00D285: PHA

#_00D286: LDY.w #$0008
#_00D289: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D28C: PLA
#_00D28D: CLC
#_00D28E: ADC.w #$0180

#_00D291: LDY.w #$0008
#_00D294: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D297: SEP #$30

#_00D299: LDY.b #$60
#_00D29B: JSR Decompress_sprite_low

#_00D29E: REP #$30

#_00D2A0: LDA.b $00
#_00D2A2: LDX.w #$2280
#_00D2A5: LDY.w #$0003

#_00D2A8: PHA

#_00D2A9: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D2AC: PLA
#_00D2AD: CLC
#_00D2AE: ADC.w #$0180

#_00D2B1: LDY.w #$0003
#_00D2B4: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D2B7: SEP #$30

#_00D2B9: JSR LoadItemGFX_Auxiliary

#_00D2BC: PLB

#_00D2BD: RTL

;===================================================================================================

pool DecompressSwordGraphics

.offset
#_00D2BE: dw $0000 ; none
#_00D2C0: dw $0000 ; fighter sword
#_00D2C2: dw $0120 ; master sword
#_00D2C4: dw $0120 ; tempered sword
#_00D2C6: dw $0120 ; gold sword

pool off

;---------------------------------------------------------------------------------------------------

DecompressSwordGraphics:
#_00D2C8: PHB
#_00D2C9: PHK
#_00D2CA: PLB

#_00D2CB: LDY.b #$5F
#_00D2CD: JSR Decompress_sprite_high

#_00D2D0: LDY.b #$5E
#_00D2D2: JSR Decompress_sprite_low

#_00D2D5: REP #$21

#_00D2D7: LDA.l $7EF359
#_00D2DB: AND.w #$00FF
#_00D2DE: ASL A
#_00D2DF: TAY

#_00D2E0: LDA.b $00
#_00D2E2: ADC.w .offset,Y

#_00D2E5: REP #$10

#_00D2E7: LDX.w #$0000
#_00D2EA: LDY.w #$000C

#_00D2ED: PHA

#_00D2EE: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D2F1: PLA
#_00D2F2: CLC
#_00D2F3: ADC.w #$0180

#_00D2F6: LDY.w #$000C
#_00D2F9: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D2FC: SEP #$30

#_00D2FE: PLB

#_00D2FF: RTL

;===================================================================================================

pool DecompressShieldGraphics

.offset
#_00D300: dw $0660 ; none
#_00D302: dw $0660 ; fighter shield
#_00D304: dw $06F0 ; fire shield
#_00D306: dw $0900 ; mirror shield

pool off

;---------------------------------------------------------------------------------------------------

DecompressShieldGraphics:
#_00D308: PHB
#_00D309: PHK
#_00D30A: PLB

#_00D30B: LDY.b #$5F
#_00D30D: JSR Decompress_sprite_high

#_00D310: LDY.b #$5E
#_00D312: JSR Decompress_sprite_low

#_00D315: REP #$21

#_00D317: LDA.l $7EF35A
#_00D31B: ASL A
#_00D31C: TAY

#_00D31D: LDA.b $00
#_00D31F: ADC.w .offset,Y

#_00D322: REP #$10

#_00D324: LDX.w #$0300

#_00D327: PHA

#_00D328: JSR Do3bppToWRAM4bpp_RightPal

#_00D32B: PLA
#_00D32C: CLC
#_00D32D: ADC.w #$0180
#_00D330: JSR Do3bppToWRAM4bpp_RightPal

#_00D333: SEP #$30

#_00D335: PLB

#_00D336: RTL

;===================================================================================================

DecompressAnimatedUnderworldTiles:
#_00D337: PHB
#_00D338: PHK
#_00D339: PLB

#_00D33A: JSR Decompress_background_low

#_00D33D: REP #$30

#_00D33F: LDA.b $00
#_00D341: LDY.w #$0030
#_00D344: LDX.w #$1680
#_00D347: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D34A: SEP #$30

#_00D34C: LDY.b #$5C
#_00D34E: JSR Decompress_background_low

#_00D351: REP #$30

#_00D353: LDA.b $00
#_00D355: LDY.w #$0030
#_00D358: LDX.w #$1C80
#_00D35B: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D35E: LDX.w #$0000

.next_tile_frame
#_00D361: LDA.l $7EA880,X
#_00D365: PHA

#_00D366: LDA.l $7EAC80,X
#_00D36A: STA.l $7EA880,X

#_00D36E: LDA.l $7EAE80,X
#_00D372: STA.l $7EAC80,X

#_00D376: LDA.l $7EAA80,X
#_00D37A: STA.l $7EAE80,X

#_00D37E: PLA
#_00D37F: STA.l $7EAA80,X

#_00D383: INX
#_00D384: INX
#_00D385: CPX.w #$0200
#_00D388: BNE .next_tile_frame

;---------------------------------------------------------------------------------------------------

#_00D38A: LDA.w #$3B00 ; VRAM $7600
#_00D38D: STA.w $0134

#_00D390: SEP #$30

#_00D392: PLB

#_00D393: RTL

;===================================================================================================

DecompressAnimatedOverworldTiles:
#_00D394: PHB
#_00D395: PHK
#_00D396: PLB

#_00D397: PHY

#_00D398: JSR Decompress_background_low

#_00D39B: REP #$30

#_00D39D: LDA.b $00
#_00D39F: LDY.w #$0040
#_00D3A2: LDX.w #$1680
#_00D3A5: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D3A8: SEP #$30

#_00D3AA: PLY
#_00D3AB: INY

#_00D3AC: JSR Decompress_background_low

#_00D3AF: REP #$30

#_00D3B1: LDA.b $00
#_00D3B3: LDY.w #$0020
#_00D3B6: LDX.w #$1E80
#_00D3B9: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D3BC: LDA.w #$3C00 ; VRAM $7800
#_00D3BF: STA.w $0134

#_00D3C2: SEP #$30

#_00D3C4: PLB

#_00D3C5: RTL

;===================================================================================================

LoadItemGFX_Auxiliary:
#_00D3C6: LDY.b #$0F
#_00D3C8: JSR Decompress_background_low

#_00D3CB: REP #$30

#_00D3CD: LDA.b $00
#_00D3CF: LDY.w #$0010
#_00D3D2: LDX.w #$2340

#_00D3D5: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D3D8: SEP #$30

#_00D3DA: LDY.b #$58
#_00D3DC: JSR Decompress_sprite_low

#_00D3DF: REP #$30

#_00D3E1: LDA.b $00
#_00D3E3: LDY.w #$0020
#_00D3E6: LDX.w #$2540

#_00D3E9: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D3EC: SEP #$30

#_00D3EE: LDY.b #$05
#_00D3F0: JSR Decompress_background_low

#_00D3F3: REP #$30

#_00D3F5: LDA.b $00
#_00D3F7: CLC
#_00D3F8: ADC.w #$0480

#_00D3FB: LDY.w #$0002
#_00D3FE: LDX.w #$2DC0
#_00D401: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D404: SEP #$30

#_00D406: RTS

;===================================================================================================

pool LoadFollowerGraphics

.gfx_offset
#_00D407: dw $0000 ; 0x00 - No follower
#_00D409: dw $0600 ; 0x01 - Zelda
#_00D40B: dw $0300 ; 0x02 - Old man that stops following you
#_00D40D: dw $0300 ; 0x03 - Unused old man
#_00D40F: dw $0300 ; 0x04 - Normal old man
#_00D411: dw $0000 ; 0x05 - Zelda rescue telepathy
#_00D413: dw $0000 ; 0x06 - Blind maiden
#_00D415: dw $0900 ; 0x07 - Frogsmith
#_00D417: dw $0600 ; 0x08 - Smithy
#_00D419: dw $0600 ; 0x09 - Locksmith
#_00D41B: dw $0900 ; 0x0A - Kiki
#_00D41D: dw $0900 ; 0x0B - Unused old man
#_00D41F: dw $0600 ; 0x0C - Purple chest
#_00D421: dw $0900 ; 0x0D - Super bomb

pool off

;---------------------------------------------------------------------------------------------------

LoadFollowerGraphics:
#_00D423: PHB
#_00D424: PHK
#_00D425: PLB

#_00D426: LDY.b #$64
#_00D428: LDA.l $7EF3CC
#_00D42C: CMP.b #$01 ; FOLLOWER 01
#_00D42E: BEQ .start

#_00D430: LDY.b #$66
#_00D432: LDA.l $7EF3CC
#_00D436: CMP.b #$09 ; FOLLOWER 09
#_00D438: BCC .start

#_00D43A: LDY.b #$59
#_00D43C: CMP.b #$0C
#_00D43E: BCC .start

#_00D440: LDY.b #$58

;---------------------------------------------------------------------------------------------------

.start
#_00D442: JSR Decompress_sprite_high

#_00D445: LDY.b #$65
#_00D447: JSR Decompress_sprite_low

#_00D44A: REP #$30

#_00D44C: LDA.l $7EF3CC
#_00D450: AND.w #$00FF
#_00D453: ASL A
#_00D454: TAX

#_00D455: LDA.b $00
#_00D457: CLC
#_00D458: ADC.l .gfx_offset,X

#_00D45C: LDY.w #$0020
#_00D45F: LDX.w #$2940
#_00D462: JSR Do3bppToWRAM4bpp_LeftPal_arbitrary

#_00D465: SEP #$30

#_00D467: PLB

#_00D468: RTL

;===================================================================================================

pool WriteTo4BPPBuffer

.offsets
#_00D469: dw $09C0 ; 0x00 - Full bottle
#_00D46B: dw $0030 ; 0x01 - 3 bombs
#_00D46D: dw $0060 ; 0x02 - 10 arrows
#_00D46F: dw $0090 ; 0x03 - Heart container
#_00D471: dw $00C0 ; 0x04 - Mail
#_00D473: dw $0300 ; 0x05 - Bow
#_00D475: dw $0318 ; 0x06 - Fighter sword
#_00D477: dw $0330 ; 0x07 - Cane
#_00D479: dw $0348 ; 0x08 - Hookshot
#_00D47B: dw $0360 ; 0x09 - Rod
#_00D47D: dw $0378 ; 0x0A - Hammer
#_00D47F: dw $0390 ; 0x0B - Powder
#_00D481: dw $0930 ; 0x0C - Flute
#_00D483: dw $03F0 ; 0x0D - Glove
#_00D485: dw $0420 ; 0x0E - Book
#_00D487: dw $0450 ; 0x0F - Small key
#_00D489: dw $0468 ; 0x10 - Boomerang
#_00D48B: dw $0600 ; 0x11 - Flippers
#_00D48D: dw $0630 ; 0x12 - Mirror
#_00D48F: dw $0660 ; 0x13 - Bomb
#_00D491: dw $0690 ; 0x14 - Lamp
#_00D493: dw $06C0 ; 0x15 - Cape
#_00D495: dw $06F0 ; 0x16 - Compass
#_00D497: dw $0720 ; 0x17 - Pearl
#_00D499: dw $0750 ; 0x18 - Master sword
#_00D49B: dw $0768 ; 0x19 - Shovel
#_00D49D: dw $0900 ; 0x1A - Ether
#_00D49F: dw $0930 ; 0x1B - Bombos
#_00D4A1: dw $0960 ; 0x1C - Quake
#_00D4A3: dw $0990 ; 0x1D - Empty bottle
#_00D4A5: dw $09F0 ; 0x1E - Mushroom
#_00D4A7: dw $0000 ; 0x1F - Cauldron
#_00D4A9: dw $00F0 ; 0x20 - Fire shield
#_00D4AB: dw $0A20 ; 0x21 - Map
#_00D4AD: dw $0A50 ; 0x22 - Big key
#_00D4AF: dw $0660 ; 0x23 - Pendant
#_00D4B1: dw $0600 ; 0x24 - Animated rupee
#_00D4B3: dw $0618 ; 0x25 - Animated rupee
#_00D4B5: dw $0630 ; 0x26 - Animated rupee
#_00D4B7: dw $0648 ; 0x27 - Net
#_00D4B9: dw $0678 ; 0x28 - Crystal
#_00D4BB: dw $06D8 ; 0x29 - Tossed bow
#_00D4BD: dw $06A8 ; 0x2A - Silvers
#_00D4BF: dw $0708 ; 0x2B - Bottle with fairy
#_00D4C1: dw $0738 ; 0x2C - Bottle with bee
#_00D4C3: dw $0768 ; 0x2D - Fighter shield
#_00D4C5: dw $0960 ; 0x2E - Mirror shield
#_00D4C7: dw $0900 ; 0x2F - Heart piece
#_00D4C9: dw $03C0 ; 0x30 - 10 bombs
#_00D4CB: dw $0990 ; 0x31 - Small heart
#_00D4CD: dw $09A8 ; 0x32 - Small magic
#_00D4CF: dw $09C0 ; 0x33 - 1 arrow
#_00D4D1: dw $09D8 ; 0x34 - 100 rupees
#_00D4D3: dw $0A08 ; 0x35 - 50 rupees
#_00D4D5: dw $0A38 ; 0x36 - 300 rupees
#_00D4D7: dw $0600 ; 0x37 - 20 rupees
#_00D4D9: dw $0630 ; 0x38 - Boots

pool off

;===================================================================================================

WriteTo4BPPBuffer_at_7F4000:
#_00D4DB: PHB
#_00D4DC: PHK
#_00D4DD: PLB

#_00D4DE: PHA

#_00D4DF: STZ.b $00

#_00D4E1: LDA.b #$7F4000>>8
#_00D4E3: STA.b $01

#_00D4E5: LDA.b #$7F4000>>16
#_00D4E7: STA.b $02
#_00D4E9: STA.b $05

#_00D4EB: BRA WriteTo4BPPBuffer

;===================================================================================================

WriteTo4BPPBuffer_item_gfx:
#_00D4ED: PHB
#_00D4EE: PHK
#_00D4EF: PLB

#_00D4F0: PHA

#_00D4F1: LDY.b #$5D
#_00D4F3: CMP.b #$23
#_00D4F5: BEQ .set_a

#_00D4F7: CMP.b #$37
#_00D4F9: BCS .set_a

#_00D4FB: LDY.b #$5C
#_00D4FD: CMP.b #$0C
#_00D4FF: BEQ .set_a

#_00D501: CMP.b #$24
#_00D503: BCS .set_a

#_00D505: LDY.b #$5B

.set_a
#_00D507: JSR Decompress_sprite_high

#_00D50A: LDY.b #$5A
#_00D50C: JSR Decompress_sprite_low

;===================================================================================================

WriteTo4BPPBuffer:
#_00D50F: PLA

#_00D510: REP #$21

#_00D512: AND.w #$00FF
#_00D515: ASL A
#_00D516: TAX

#_00D517: LDA.b $00
#_00D519: ADC.w .offsets,X

#_00D51C: REP #$10

#_00D51E: LDX.w #$2D40
#_00D521: LDY.w #$0002

#_00D524: PHA

#_00D525: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D528: PLA
#_00D529: CLC
#_00D52A: ADC.w #$0180

#_00D52D: LDY.w #$0002
#_00D530: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D533: SEP #$30

#_00D535: PLB

#_00D536: RTL

;===================================================================================================

LoadItemGFX_sheet0:
#_00D537: STA.b $0A

#_00D539: LDY.b #$00

#_00D53B: LDA.w GFXSheetPointers_sprite_bank,Y
#_00D53E: STA.b $02
#_00D540: STA.b $05

#_00D542: LDA.w GFXSheetPointers_sprite_high,Y
#_00D545: STA.b $01

#_00D547: LDA.w GFXSheetPointers_sprite_low,Y
#_00D54A: STA.b $00

#_00D54C: BRA LoadItemGFX

;===================================================================================================

LoadItemGFX_arbitrary_sheet:
#_00D54E: PHA

#_00D54F: JSR Decompress_sprite_low

#_00D552: PLA

;===================================================================================================

LoadItemGFX_current_sheet:
#_00D553: STA.b $0A

#_00D555: STZ.b $00

#_00D557: LDA.b #$7F4000>>8
#_00D559: STA.b $01

#_00D55B: LDA.b #$7F4000>>16
#_00D55D: STA.b $02

#_00D55F: STA.b $05

;===================================================================================================

LoadItemGFX:
#_00D561: REP #$31

#_00D563: LDY.b $0C

#_00D565: LDA.b $00
#_00D567: ADC.w .offset,Y

#_00D56A: LDX.b $06
#_00D56C: LDY.b $0A

#_00D56E: PHA

#_00D56F: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D572: PLA
#_00D573: CLC
#_00D574: ADC.w #$0180

#_00D577: LDY.b $0A
#_00D579: JSR Do3bppToWRAM4bpp_RightPal_arbitrary

#_00D57C: INC.b $0C
#_00D57E: INC.b $0C

#_00D580: STX.b $06

#_00D582: SEP #$30

#_00D584: RTS

;===================================================================================================

UNREACHABLE_00D585:
#_00D585: LDY.w #$0008
#_00D588: STY.b $0E

.next_tile
#_00D58A: STA.b $00

#_00D58C: CLC
#_00D58D: ADC.w #$0010
#_00D590: STA.b $03

#_00D592: LDY.w #$0007

.next_word
#_00D595: LDA.b [$00]
#_00D597: STA.l $7E9000,X

#_00D59B: INC.b $00
#_00D59D: INC.b $00

#_00D59F: LDA.b [$03]
#_00D5A1: AND.w #$00FF
#_00D5A4: STA.l $7E9010,X

#_00D5A8: INC.b $03

#_00D5AA: INX
#_00D5AB: INX

#_00D5AC: DEY
#_00D5AD: BPL .next_word

#_00D5AF: TXA
#_00D5B0: CLC
#_00D5B1: ADC.w #$0010
#_00D5B4: TAX

#_00D5B5: LDA.b $03
#_00D5B7: AND.w #$0078
#_00D5BA: BNE .same_row

#_00D5BC: LDA.b $03
#_00D5BE: CLC
#_00D5BF: ADC.w #$0180
#_00D5C2: STA.b $03

.same_row
#_00D5C4: LDA.b $03

#_00D5C6: DEC.b $0E
#_00D5C8: BNE .next_tile

#_00D5CA: RTS

;===================================================================================================

Do3bppToWRAM4bpp_LeftPal:
#_00D5CB: LDY.w #$0008

.arbitrary
#_00D5CE: STY.b $0E

;---------------------------------------------------------------------------------------------------

.next_tile
#_00D5D0: STA.b $00

#_00D5D2: CLC
#_00D5D3: ADC.w #$0010
#_00D5D6: STA.b $03

#_00D5D8: LDY.w #$0003

.next_word
#_00D5DB: LDA.b [$00]
#_00D5DD: STA.l $7E9000,X

#_00D5E1: INC.b $00
#_00D5E3: INC.b $00

#_00D5E5: LDA.b [$03]
#_00D5E7: AND.w #$00FF
#_00D5EA: STA.l $7E9010,X

#_00D5EE: INC.b $03

#_00D5F0: INX
#_00D5F1: INX

#_00D5F2: LDA.b [$00]
#_00D5F4: STA.l $7E9000,X

#_00D5F8: INC.b $00
#_00D5FA: INC.b $00

#_00D5FC: LDA.b [$03]
#_00D5FE: AND.w #$00FF
#_00D601: STA.l $7E9010,X

#_00D605: INC.b $03

#_00D607: INX
#_00D608: INX

#_00D609: DEY
#_00D60A: BPL .next_word

#_00D60C: TXA
#_00D60D: CLC
#_00D60E: ADC.w #$0010
#_00D611: TAX

#_00D612: LDA.b $03

#_00D614: DEC.b $0E
#_00D616: BNE .next_tile

#_00D618: RTS

;===================================================================================================

Do3bppToWRAM4bpp_RightPal:
#_00D619: LDY.w #$0006

.arbitrary
#_00D61C: STY.b $0E

;---------------------------------------------------------------------------------------------------

.next_tile
#_00D61E: STA.b $00

#_00D620: CLC
#_00D621: ADC.w #$0010
#_00D624: STA.b $03

#_00D626: LDY.w #$0007

.next_word
#_00D629: LDA.b [$00]
#_00D62B: STA.l $7E9000,X

#_00D62F: XBA
#_00D630: ORA.b [$00]
#_00D632: AND.w #$00FF
#_00D635: STA.b $08

#_00D637: INC.b $00
#_00D639: INC.b $00

#_00D63B: LDA.b [$03]
#_00D63D: AND.w #$00FF
#_00D640: STA.b $BD

#_00D642: ORA.b $08
#_00D644: XBA
#_00D645: ORA.b $BD
#_00D647: STA.l $7E9010,X

#_00D64B: INC.b $03

#_00D64D: INX
#_00D64E: INX

#_00D64F: DEY
#_00D650: BPL .next_word

;---------------------------------------------------------------------------------------------------

#_00D652: TXA
#_00D653: CLC
#_00D654: ADC.w #$0010
#_00D657: TAX

#_00D658: LDA.b $03
#_00D65A: AND.w #$0078
#_00D65D: BNE .same_row

#_00D65F: LDA.b $03
#_00D661: CLC
#_00D662: ADC.w #$0180
#_00D665: STA.b $03

.same_row
#_00D667: LDA.b $03

#_00D669: DEC.b $0E
#_00D66B: BNE .next_tile

#_00D66D: RTS

;===================================================================================================

LoadTransAuxGFX:
#_00D66E: PHB
#_00D66F: PHK
#_00D670: PLB

#_00D671: STZ.b $00

#_00D673: LDA.b #$7E6000>>8
#_00D675: STA.b $01

#_00D677: LDA.b #$7E6000>>16
#_00D679: STA.b $02

#_00D67B: REP #$30

#_00D67D: LDA.w $0AA2
#_00D680: AND.w #$00FF
#_00D683: ASL A
#_00D684: ASL A
#_00D685: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_00D687: SEP #$20

#_00D689: LDX.b $0E

#_00D68B: LDA.w SheetsTable_AA2+0,X
#_00D68E: BEQ .skip_bg0

#_00D690: STA.l $7EC2F8

#_00D694: SEP #$10

#_00D696: TAY
#_00D697: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg0
#_00D69A: SEP #$10

#_00D69C: LDA.b $01
#_00D69E: CLC
#_00D69F: ADC.b #$06
#_00D6A1: STA.b $01

#_00D6A3: REP #$10

#_00D6A5: LDX.b $0E

#_00D6A7: LDA.w SheetsTable_AA2+1,X
#_00D6AA: BEQ .skip_bg1

#_00D6AC: STA.l $7EC2F9

#_00D6B0: SEP #$10

#_00D6B2: TAY
#_00D6B3: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg1
#_00D6B6: SEP #$10

#_00D6B8: LDA.b $01
#_00D6BA: CLC
#_00D6BB: ADC.b #$06
#_00D6BD: STA.b $01

#_00D6BF: REP #$10

#_00D6C1: LDX.b $0E

#_00D6C3: LDA.w SheetsTable_AA2+2,X
#_00D6C6: BEQ .skip_bg2

#_00D6C8: STA.l $7EC2FA

#_00D6CC: SEP #$10

#_00D6CE: TAY
#_00D6CF: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg2
#_00D6D2: SEP #$10

#_00D6D4: LDA.b $01
#_00D6D6: CLC
#_00D6D7: ADC.b #$06
#_00D6D9: STA.b $01

#_00D6DB: REP #$10

#_00D6DD: LDX.b $0E
#_00D6DF: LDA.w SheetsTable_AA2+3,X
#_00D6E2: BEQ .skip_bg3

#_00D6E4: STA.l $7EC2FB

#_00D6E8: SEP #$10

#_00D6EA: TAY
#_00D6EB: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg3
#_00D6EE: SEP #$10

#_00D6F0: LDA.b $01
#_00D6F2: CLC
#_00D6F3: ADC.b #$06
#_00D6F5: STA.b $01

#_00D6F7: BRA .continue

;===================================================================================================

#LoadTransAuxGFX_sprite:
#_00D6F9: PHB
#_00D6FA: PHK
#_00D6FB: PLB

#_00D6FC: STZ.b $00

#_00D6FE: LDA.b #$7E7800>>8
#_00D700: STA.b $01

#_00D702: LDA.b #$7E7800>>16
#_00D704: STA.b $02

;===================================================================================================

.continue
#_00D706: REP #$30

#_00D708: LDA.w $0AA3
#_00D70B: AND.w #$00FF
#_00D70E: ASL A
#_00D70F: ASL A
#_00D710: STA.b $0E

;---------------------------------------------------------------------------------------------------

#_00D712: SEP #$20

#_00D714: LDX.b $0E
#_00D716: LDA.w SheetsTable_AA3+0,X
#_00D719: BEQ .skip_spr0

#_00D71B: STA.l $7EC2FC

.skip_spr0
#_00D71F: SEP #$10

#_00D721: LDA.l $7EC2FC
#_00D725: TAY

#_00D726: JSR Decompress_sprite_arbitrary

#_00D729: LDA.b $01
#_00D72B: CLC
#_00D72C: ADC.b #$06
#_00D72E: STA.b $01

;---------------------------------------------------------------------------------------------------

#_00D730: REP #$10

#_00D732: LDX.b $0E

#_00D734: LDA.w SheetsTable_AA3+1,X
#_00D737: BEQ .skip_spr1

#_00D739: STA.l $7EC2FD

.skip_spr1
#_00D73D: SEP #$10

#_00D73F: LDA.l $7EC2FD
#_00D743: TAY

#_00D744: JSR Decompress_sprite_arbitrary

#_00D747: LDA.b $01
#_00D749: CLC
#_00D74A: ADC.b #$06
#_00D74C: STA.b $01

;---------------------------------------------------------------------------------------------------

#_00D74E: REP #$10

#_00D750: LDX.b $0E

#_00D752: LDA.w SheetsTable_AA3+2,X
#_00D755: BEQ .skip_spr2

#_00D757: STA.l $7EC2FE

.skip_spr2
#_00D75B: SEP #$10

#_00D75D: LDA.l $7EC2FE
#_00D761: TAY

#_00D762: JSR Decompress_sprite_arbitrary

#_00D765: LDA.b $01
#_00D767: CLC
#_00D768: ADC.b #$06
#_00D76A: STA.b $01

;---------------------------------------------------------------------------------------------------

#_00D76C: REP #$10

#_00D76E: LDX.b $0E

#_00D770: LDA.w SheetsTable_AA3+3,X
#_00D773: BEQ .skip_spr3

#_00D775: STA.l $7EC2FF

.skip_spr3
#_00D779: SEP #$10

#_00D77B: LDA.l $7EC2FF
#_00D77F: TAY

#_00D780: JSR Decompress_sprite_arbitrary

#_00D783: STZ.w $0412

#_00D786: PLB

#_00D787: RTL

;===================================================================================================

ReloadPreviouslyLoadedSheets:
#_00D788: PHB
#_00D789: PHK
#_00D78A: PLB

#_00D78B: STZ.b $00

#_00D78D: LDA.b #$7E6000>>8
#_00D78F: STA.b $01

#_00D791: LDA.b #$7E6000>>16
#_00D793: STA.b $02

#_00D795: LDA.l $7EC2F8
#_00D799: TAY

#_00D79A: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D79D: LDA.b $01
#_00D79F: CLC
#_00D7A0: ADC.b #$06
#_00D7A2: STA.b $01

#_00D7A4: LDA.l $7EC2F9
#_00D7A8: TAY

#_00D7A9: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7AC: LDA.b $01
#_00D7AE: CLC
#_00D7AF: ADC.b #$06
#_00D7B1: STA.b $01

#_00D7B3: LDA.l $7EC2FA
#_00D7B7: TAY

#_00D7B8: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7BB: LDA.b $01
#_00D7BD: CLC
#_00D7BE: ADC.b #$06
#_00D7C0: STA.b $01

#_00D7C2: LDA.l $7EC2FB
#_00D7C6: TAY

#_00D7C7: JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7CA: STZ.b $00

#_00D7CC: LDA.b #$7E7800>>8
#_00D7CE: STA.b $01

#_00D7D0: LDA.b #$7E7800>>16
#_00D7D2: STA.b $02

#_00D7D4: LDA.l $7EC2FC
#_00D7D8: TAY

#_00D7D9: JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7DC: LDA.b $01
#_00D7DE: CLC
#_00D7DF: ADC.b #$06
#_00D7E1: STA.b $01

#_00D7E3: LDA.l $7EC2FD
#_00D7E7: TAY

#_00D7E8: JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7EB: LDA.b $01
#_00D7ED: CLC
#_00D7EE: ADC.b #$06
#_00D7F0: STA.b $01

#_00D7F2: LDA.l $7EC2FE
#_00D7F6: TAY

#_00D7F7: JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D7FA: LDA.b $01
#_00D7FC: CLC
#_00D7FD: ADC.b #$06
#_00D7FF: STA.b $01

#_00D801: LDA.l $7EC2FF
#_00D805: TAY

#_00D806: JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

#_00D809: STZ.w $0412

#_00D80C: PLB

#_00D80D: RTL

;===================================================================================================

Attract_DecompressStoryGFX:
#_00D80E: PHB
#_00D80F: PHK
#_00D810: PLB

#_00D811: STZ.b $00

#_00D813: LDA.b #$7F4000>>8
#_00D815: STA.b $01

#_00D817: LDA.b #$7F4000>>16
#_00D819: STA.b $02
#_00D81B: STA.b $05

#_00D81D: LDA.b #$67
#_00D81F: STA.b $0E

.next
#_00D821: LDY.b $0E

#_00D823: JSR Decompress_sprite_arbitrary

#_00D826: LDA.b $01
#_00D828: CLC
#_00D829: ADC.b #$08
#_00D82B: STA.b $01

#_00D82D: INC.b $0E

#_00D82F: LDA.b $0E
#_00D831: CMP.b #$69
#_00D833: BNE .next

#_00D835: PLB

#_00D836: RTL

;===================================================================================================

pool AnimateMirrorWarp

.vector_low
#_00D837: db AnimateMirrorWarp_LoadPyramidIfAga>>0
#_00D838: db AnimateMirrorWarp_DecompressNewTileSets>>0
#_00D839: db AnimateMirrorWarp_DecompressBackgroundsA>>0
#_00D83A: db AnimateMirrorWarp_DecompressBackgroundsB>>0
#_00D83B: db AnimateMirrorWarp_DecompressBackgroundsC>>0
#_00D83C: db AnimateMirrorWarp_TriggerOverlayA_2>>0
#_00D83D: db AnimateMirrorWarp_TriggerOverlayB>>0
#_00D83E: db AnimateMirrorWarp_DrawDestinationScreen>>0
#_00D83F: db AnimateMirrorWarp_DoSpritesPalettes>>0
#_00D840: db AnimateMirrorWarp_TriggerOverlayB>>0
#_00D841: db AnimateMirrorWarp_DecompressAnimatedTiles>>0
#_00D842: db AnimateMirrorWarp_LoadSubscreen>>0
#_00D843: db AnimateMirrorWarp_DecompressSpritesA>>0
#_00D844: db AnimateMirrorWarp_DecompressSpritesB>>0
#_00D845: db AnimateMirrorWarp_TriggerBGChar0>>0

.vector_high
#_00D846: db AnimateMirrorWarp_LoadPyramidIfAga>>8
#_00D847: db AnimateMirrorWarp_DecompressNewTileSets>>8
#_00D848: db AnimateMirrorWarp_DecompressBackgroundsA>>8
#_00D849: db AnimateMirrorWarp_DecompressBackgroundsB>>8
#_00D84A: db AnimateMirrorWarp_DecompressBackgroundsC>>8
#_00D84B: db AnimateMirrorWarp_TriggerOverlayA_2>>8
#_00D84C: db AnimateMirrorWarp_TriggerOverlayB>>8
#_00D84D: db AnimateMirrorWarp_DrawDestinationScreen>>8
#_00D84E: db AnimateMirrorWarp_DoSpritesPalettes>>8
#_00D84F: db AnimateMirrorWarp_TriggerOverlayB>>8
#_00D850: db AnimateMirrorWarp_DecompressAnimatedTiles>>8
#_00D851: db AnimateMirrorWarp_LoadSubscreen>>8
#_00D852: db AnimateMirrorWarp_DecompressSpritesA>>8
#_00D853: db AnimateMirrorWarp_DecompressSpritesB>>8
#_00D854: db AnimateMirrorWarp_TriggerBGChar0>>8

;---------------------------------------------------------------------------------------------------

.next_tilemap
#_00D855: db $00
#_00D856: db $0E
#_00D857: db $0F
#_00D858: db $10
#_00D859: db $11
#_00D85A: db $00
#_00D85B: db $00
#_00D85C: db $00
#_00D85D: db $00
#_00D85E: db $00
#_00D85F: db $00
#_00D860: db $12
#_00D861: db $13
#_00D862: db $14
#_00D863: db $00

pool off

;---------------------------------------------------------------------------------------------------

AnimateMirrorWarp:
#_00D864: STZ.b $00

#_00D866: LDA.b #$40
#_00D868: STA.b $01

#_00D86A: LDX.w $0200

#_00D86D: LDA.l .next_tilemap,X
#_00D871: STA.b $17
#_00D873: STA.w $0710

#_00D876: LDA.l .vector_low,X
#_00D87A: STA.b $0E

#_00D87C: LDA.l .vector_high,X
#_00D880: STA.b $0F

#_00D882: LDX.b #$00

#_00D884: LDA.b $8A
#_00D886: AND.b #$40
#_00D888: BEQ .light_world

#_00D88A: LDX.b #$08

.light_world
#_00D88C: INC.w $0200

#_00D88F: JMP.w ($000E)

;===================================================================================================

AnimateMirrorWarp_LoadPyramidIfAga:
#_00D892: INC.w $06BA

#_00D895: LDA.w $06BA
#_00D898: CMP.b #$20
#_00D89A: BEQ .continue

#_00D89C: STZ.w $0200

#_00D89F: RTL

.continue
#_00D8A0: JSL SetTargetOverworldWarpToPyramid

#_00D8A4: RTL

;===================================================================================================

AnimateMirrorWarp_TriggerOverlayA_2:
#_00D8A5: JSL MirrorWarp_HandleCastlePyramidSubscreen

#_00D8A9: DEC.b $11

#_00D8AB: LDA.b #$0C
#_00D8AD: STA.b $17
#_00D8AF: STA.w $0710

#_00D8B2: RTL

;===================================================================================================

AnimateMirrorWarp_DrawDestinationScreen:
#_00D8B3: JSL Overworld_DrawScreenAtCurrentMirrorPosition

#_00D8B7: INC.w $0710

#_00D8BA: RTL

;===================================================================================================

AnimateMirrorWarp_DoSpritesPalettes:
#_00D8BB: JSL MirrorWarp_LoadSpritesAndColors

#_00D8BF: LDA.b #$0C
#_00D8C1: STA.b $17
#_00D8C3: STA.w $0710

#_00D8C6: RTL

;===================================================================================================

AnimateMirrorWarp_TriggerOverlayB:
#_00D8C7: LDA.b #$0D
#_00D8C9: STA.b $17
#_00D8CB: STA.w $0710

#_00D8CE: RTL

;===================================================================================================

AnimateMirrorWarp_TriggerBGChar0:
#_00D8CF: LDA.b #$0E
#_00D8D1: STA.w $0200

#_00D8D4: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressAnimatedTiles:
#_00D8D5: LDY.b #$58

#_00D8D7: LDA.b $8A
#_00D8D9: AND.b #$BF
#_00D8DB: CMP.b #$03 ; OW 03, 0W 43
#_00D8DD: BEQ .not_death_mountain

#_00D8DF: CMP.b #$05 ; OW 05, 0W 45
#_00D8E1: BEQ .not_death_mountain

#_00D8E3: CMP.b #$07 ; OW 07, 0W 47
#_00D8E5: BEQ .not_death_mountain

#_00D8E7: LDY.b #$5A

.not_death_mountain
#_00D8E9: JSL DecompressAnimatedOverworldTiles

#_00D8ED: RTL

;===================================================================================================

SheetsTable_Mirror:
#_00D8EE: db $3A
#_00D8EF: db $3B
#_00D8F0: db $3C
#_00D8F1: db $3D
#_00D8F2: db $3E
#_00D8F3: db $5B

;===================================================================================================

SheetsTable_AA4:
#_00D8F4: db $01
#_00D8F5: db $5A
#_00D8F6: db $42
#_00D8F7: db $43
#_00D8F8: db $44
#_00D8F9: db $45
#_00D8FA: db $3F
#_00D8FB: db $59
#_00D8FC: db $0B
#_00D8FD: db $5A

;===================================================================================================

AnimateMirrorWarp_DecompressNewTileSets:
#_00D8FE: PHB
#_00D8FF: PHK
#_00D900: PLB

#_00D901: PHX

#_00D902: REP #$30

#_00D904: LDA.w $0AA1
#_00D907: AND.w #$00FF
#_00D90A: ASL A
#_00D90B: ASL A
#_00D90C: ASL A
#_00D90D: TAX

#_00D90E: LDA.w $0AA2
#_00D911: AND.w #$00FF
#_00D914: ASL A
#_00D915: ASL A
#_00D916: TAY

#_00D917: SEP #$20

#_00D919: LDA.w SheetsTable_AA2+0,Y
#_00D91C: BNE .not_default_a

#_00D91E: LDA.w SheetsTable_AA1+3,X

.not_default_a
#_00D921: STA.l $7EC2F8

#_00D925: LDA.w SheetsTable_AA2+1,Y
#_00D928: BNE .not_default_b

#_00D92A: LDA.w SheetsTable_AA1+4,X

.not_default_b
#_00D92D: STA.l $7EC2F9

#_00D931: LDA.w SheetsTable_AA2+2,Y
#_00D934: BNE .not_default_c

#_00D936: LDA.w SheetsTable_AA1+5,X

.not_default_c
#_00D939: STA.l $7EC2FA

#_00D93D: LDA.w SheetsTable_AA2+3,Y
#_00D940: BNE .not_default_d

#_00D942: LDA.w SheetsTable_AA1+6,X

.not_default_d
#_00D945: STA.l $7EC2FB

;---------------------------------------------------------------------------------------------------

#_00D949: REP #$20

#_00D94B: LDA.w $0AA3
#_00D94E: AND.w #$00FF
#_00D951: ASL A
#_00D952: ASL A
#_00D953: TAY

#_00D954: SEP #$20

#_00D956: LDA.w SheetsTable_AA3+0,Y
#_00D959: BEQ .dont_change_a

#_00D95B: STA.l $7EC2FC

.dont_change_a
#_00D95F: LDA.w SheetsTable_AA3+1,Y
#_00D962: BEQ .dont_change_b

#_00D964: STA.l $7EC2FD

.dont_change_b
#_00D968: LDA.w SheetsTable_AA3+2,Y
#_00D96B: BEQ .dont_change_c

#_00D96D: STA.l $7EC2FE

.dont_change_c
#_00D971: LDA.w SheetsTable_AA3+3,Y
#_00D974: BEQ .dont_change_d

#_00D976: STA.l $7EC2FF

;---------------------------------------------------------------------------------------------------

.dont_change_d
#_00D97A: SEP #$10

#_00D97C: PLX

#_00D97D: LDA.l SheetsTable_Mirror+1,X
#_00D981: STA.b $08

#_00D983: LDA.l SheetsTable_Mirror+0,X
#_00D987: TAY

#_00D988: LDA.b #$7F
#_00D98A: JSR Decompress_background_arbitrary_bank

#_00D98D: LDA.b $01
#_00D98F: CLC
#_00D990: ADC.b #$06
#_00D992: STA.b $01

#_00D994: LDY.b $08
#_00D996: JSR Decompress_background_arbitrary

#_00D999: PLB

#_00D99A: LDA.b #$7F
#_00D99C: STA.b $02
#_00D99E: STA.b $05

#_00D9A0: REP #$31

#_00D9A2: LDX.w #$0000
#_00D9A5: LDY.w #$0040
#_00D9A8: LDA.w #$4000
#_00D9AB: JSR Do3To4High16Bit

#_00D9AE: LDY.w #$0040
#_00D9B1: LDA.b $03
#_00D9B3: JSR Do3To4Low16Bit

#_00D9B6: SEP #$30

#_00D9B8: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsA:
#_00D9B9: PHB
#_00D9BA: PHK
#_00D9BB: PLB

#_00D9BC: LDA.l SheetsTable_Mirror+3,X
#_00D9C0: STA.b $08

#_00D9C2: LDA.l SheetsTable_Mirror+2,X
#_00D9C6: TAY

#_00D9C7: LDA.b #$7F
#_00D9C9: JSR Decompress_background_arbitrary_bank

#_00D9CC: LDA.b $01
#_00D9CE: CLC
#_00D9CF: ADC.b #$06
#_00D9D1: STA.b $01

#_00D9D3: LDY.b $08
#_00D9D5: JSR Decompress_background_arbitrary

#_00D9D8: PLB

#_00D9D9: LDA.b #$7F
#_00D9DB: STA.b $02
#_00D9DD: STA.b $05

#_00D9DF: REP #$31

#_00D9E1: LDX.w #$0000
#_00D9E4: LDY.w #$0040
#_00D9E7: LDA.w #$4000
#_00D9EA: JSR Do3To4Low16Bit

#_00D9ED: LDY.w #$0040
#_00D9F0: LDA.b $03
#_00D9F2: JSR Do3To4High16Bit

#_00D9F5: SEP #$30

#_00D9F7: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsB:
#_00D9F8: PHB
#_00D9F9: PHK
#_00D9FA: PLB

#_00D9FB: LDA.l $7EC2F9
#_00D9FF: TAY

#_00DA00: LDA.b #$7F
#_00DA02: JSR Decompress_background_arbitrary_bank

#_00DA05: LDA.b $01
#_00DA07: CLC
#_00DA08: ADC.b #$06
#_00DA0A: STA.b $01

#_00DA0C: LDA.l $7EC2FA
#_00DA10: TAY
#_00DA11: JSR Decompress_background_arbitrary

#_00DA14: PLB

#_00DA15: LDA.b #$7F
#_00DA17: STA.b $02
#_00DA19: STA.b $05

#_00DA1B: REP #$31

#_00DA1D: LDX.w #$0000
#_00DA20: LDY.w #$0080
#_00DA23: LDA.w #$4000
#_00DA26: JSR Do3To4High16Bit

#_00DA29: SEP #$30

#_00DA2B: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsC:
#_00DA2C: PHB
#_00DA2D: PHK
#_00DA2E: PLB

#_00DA2F: LDA.l SheetsTable_Mirror+5,X
#_00DA33: STA.b $08

#_00DA35: LDA.l SheetsTable_Mirror+4,X
#_00DA39: TAY

#_00DA3A: LDA.b #$7F
#_00DA3C: JSR Decompress_background_arbitrary_bank

#_00DA3F: LDA.b $01
#_00DA41: CLC
#_00DA42: ADC.b #$06
#_00DA44: STA.b $01

#_00DA46: LDY.b $08
#_00DA48: JSR Decompress_background_arbitrary

#_00DA4B: PLB

#_00DA4C: LDA.b #$7F
#_00DA4E: STA.b $02
#_00DA50: STA.b $05

#_00DA52: REP #$31

#_00DA54: LDX.w #$0000
#_00DA57: LDY.w #$0080
#_00DA5A: LDA.w #$4000
#_00DA5D: JSR Do3To4Low16Bit

#_00DA60: SEP #$30

#_00DA62: RTL

;===================================================================================================

AnimateMirrorWarp_LoadSubscreen:
#_00DA63: STZ.b $1D

#_00DA65: LDA.b $8A
#_00DA67: BEQ .subscreen

#_00DA69: CMP.b #$70 ; OW 70
#_00DA6B: BEQ .subscreen

#_00DA6D: CMP.b #$40 ; OW 40
#_00DA6F: BEQ .subscreen

#_00DA71: CMP.b #$5B ; OW 5B
#_00DA73: BEQ .subscreen

#_00DA75: CMP.b #$03 ; OW 03
#_00DA77: BEQ .subscreen

#_00DA79: CMP.b #$05 ; OW 05
#_00DA7B: BEQ .subscreen

#_00DA7D: CMP.b #$07 ; OW 07
#_00DA7F: BEQ .subscreen

#_00DA81: CMP.b #$43 ; OW 43
#_00DA83: BEQ .subscreen

#_00DA85: CMP.b #$45 ; OW 45
#_00DA87: BEQ .subscreen

#_00DA89: CMP.b #$47 ; OW 47
#_00DA8B: BNE .no_subscreen

.subscreen
#_00DA8D: LDA.b #$01
#_00DA8F: STA.b $1D

.no_subscreen
#_00DA91: PHB
#_00DA92: PHK
#_00DA93: PLB

#_00DA94: LDA.l SheetsTable_Mirror+6,X
#_00DA98: TAY

#_00DA99: LDA.w GFXSheetPointers_sprite_low,Y
#_00DA9C: STA.b $00

#_00DA9E: LDA.w GFXSheetPointers_sprite_high,Y
#_00DAA1: STA.b $01

#_00DAA3: LDA.w GFXSheetPointers_sprite_bank,Y
#_00DAA6: STA.b $02
#_00DAA8: STA.b $05

#_00DAAA: PLB

#_00DAAB: REP #$31

#_00DAAD: LDX.w #$0000
#_00DAB0: LDY.w #$0040

#_00DAB3: LDA.b $00
#_00DAB5: JSR Do3To4High16Bit

#_00DAB8: SEP #$30

#_00DABA: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressSpritesA:
#_00DABB: PHB
#_00DABC: PHK
#_00DABD: PLB

#_00DABE: LDA.l $7EC2FC
#_00DAC2: TAY

#_00DAC3: LDA.b #$7F
#_00DAC5: STA.b $02
#_00DAC7: STA.b $05

#_00DAC9: JSR Decompress_sprite_arbitrary

#_00DACC: LDA.b $01
#_00DACE: CLC
#_00DACF: ADC.b #$06
#_00DAD1: STA.b $01

#_00DAD3: LDA.l $7EC2FD
#_00DAD7: TAY
#_00DAD8: JSR Decompress_sprite_arbitrary

#_00DADB: PLB

;---------------------------------------------------------------------------------------------------

#_00DADC: LDA.b #$7F
#_00DADE: STA.b $02
#_00DAE0: STA.b $05

#_00DAE2: REP #$31

#_00DAE4: LDX.w #$0000
#_00DAE7: LDY.w #$0040

#_00DAEA: LDA.l $7EC2FC
#_00DAEE: CMP.w #$0052
#_00DAF1: BEQ .right_side_palette

#_00DAF3: CMP.w #$0053
#_00DAF6: BEQ .right_side_palette

#_00DAF8: CMP.w #$005A
#_00DAFB: BEQ .right_side_palette

#_00DAFD: CMP.w #$005B
#_00DB00: BNE .left_side_palette

.right_side_palette
#_00DB02: LDA.w #$4000
#_00DB05: JSR Do3To4High16Bit

#_00DB08: BRA .done

.left_side_palette
#_00DB0A: LDA.w #$4000
#_00DB0D: JSR Do3To4Low16Bit

.done
#_00DB10: LDY.w #$0040
#_00DB13: LDA.b $03
#_00DB15: JSR Do3To4Low16Bit

#_00DB18: SEP #$30

#_00DB1A: RTL

;===================================================================================================

AnimateMirrorWarp_DecompressSpritesB:
#_00DB1B: PHB
#_00DB1C: PHK
#_00DB1D: PLB

#_00DB1E: LDA.l $7EC2FE
#_00DB22: TAY

#_00DB23: LDA.b #$7F
#_00DB25: STA.b $02
#_00DB27: STA.b $05
#_00DB29: JSR Decompress_sprite_arbitrary

#_00DB2C: LDA.b $01
#_00DB2E: CLC
#_00DB2F: ADC.b #$06
#_00DB31: STA.b $01

#_00DB33: LDA.l $7EC2FF
#_00DB37: TAY
#_00DB38: JSR Decompress_sprite_arbitrary

#_00DB3B: PLB

#_00DB3C: LDA.b #$7F
#_00DB3E: STA.b $02
#_00DB40: STA.b $05

#_00DB42: REP #$31

#_00DB44: LDX.w #$0000
#_00DB47: LDY.w #$0080
#_00DB4A: LDA.w #$7F4000
#_00DB4D: JSR Do3To4Low16Bit

#_00DB50: SEP #$30

#_00DB52: JSL HandleFollowersAfterMirroring

#_00DB56: RTL

;===================================================================================================

SheetsTable_AA3:
#_00DB57: db $00, $49, $00, $00 ; 0x00
#_00DB5B: db $46, $49, $0C, $1D ; 0x01
#_00DB5F: db $48, $49, $13, $1D ; 0x02
#_00DB63: db $46, $49, $13, $0E ; 0x03
#_00DB67: db $48, $49, $0C, $11 ; 0x04
#_00DB6B: db $48, $49, $0C, $10 ; 0x05
#_00DB6F: db $4F, $49, $4A, $50 ; 0x06
#_00DB73: db $0E, $49, $4A, $11 ; 0x07
#_00DB77: db $46, $49, $12, $00 ; 0x08
#_00DB7B: db $00, $49, $00, $50 ; 0x09
#_00DB7F: db $00, $49, $00, $11 ; 0x0A
#_00DB83: db $48, $49, $0C, $00 ; 0x0B
#_00DB87: db $00, $00, $37, $36 ; 0x0C
#_00DB8B: db $48, $49, $4C, $11 ; 0x0D
#_00DB8F: db $5D, $2C, $0C, $44 ; 0x0E
#_00DB93: db $00, $00, $4E, $00 ; 0x0F
#_00DB97: db $0F, $00, $12, $10 ; 0x10
#_00DB9B: db $00, $00, $00, $4C ; 0x11
#_00DB9F: db $00, $0D, $17, $00 ; 0x12
#_00DBA3: db $16, $0D, $17, $1B ; 0x13
#_00DBA7: db $16, $0D, $17, $14 ; 0x14
#_00DBAB: db $15, $0D, $17, $15 ; 0x15
#_00DBAF: db $16, $0D, $18, $19 ; 0x16
#_00DBB3: db $16, $0D, $17, $19 ; 0x17
#_00DBB7: db $16, $0D, $00, $00 ; 0x18
#_00DBBB: db $16, $0D, $18, $1B ; 0x19
#_00DBBF: db $0F, $49, $4A, $11 ; 0x1A
#_00DBC3: db $4B, $2A, $5C, $15 ; 0x1B
#_00DBC7: db $16, $49, $17, $1D ; 0x1C
#_00DBCB: db $00, $00, $00, $15 ; 0x1D
#_00DBCF: db $16, $0D, $17, $10 ; 0x1E
#_00DBD3: db $16, $49, $12, $00 ; 0x1F
#_00DBD7: db $16, $49, $0C, $11 ; 0x20
#_00DBDB: db $00, $00, $12, $10 ; 0x21
#_00DBDF: db $16, $0D, $00, $11 ; 0x22
#_00DBE3: db $16, $49, $0C, $00 ; 0x23
#_00DBE7: db $16, $0D, $4C, $11 ; 0x24
#_00DBEB: db $0E, $0D, $4A, $11 ; 0x25
#_00DBEF: db $16, $1A, $17, $1B ; 0x26
#_00DBF3: db $4F, $34, $4A, $50 ; 0x27
#_00DBF7: db $35, $4D, $65, $36 ; 0x28
#_00DBFB: db $4A, $34, $4E, $00 ; 0x29
#_00DBFF: db $0E, $34, $4A, $11 ; 0x2A
#_00DC03: db $51, $34, $5D, $59 ; 0x2B
#_00DC07: db $4B, $49, $4C, $11 ; 0x2C
#_00DC0B: db $2D, $00, $00, $00 ; 0x2D
#_00DC0F: db $5D, $00, $12, $59 ; 0x2E
#_00DC13: db $00, $00, $00, $00 ; 0x2F
#_00DC17: db $00, $00, $00, $00 ; 0x30
#_00DC1B: db $00, $00, $00, $00 ; 0x31
#_00DC1F: db $00, $00, $00, $00 ; 0x32
#_00DC23: db $00, $00, $00, $00 ; 0x33
#_00DC27: db $00, $00, $00, $00 ; 0x34
#_00DC2B: db $00, $00, $00, $00 ; 0x35
#_00DC2F: db $00, $00, $00, $00 ; 0x36
#_00DC33: db $00, $00, $00, $00 ; 0x37
#_00DC37: db $00, $00, $00, $00 ; 0x38
#_00DC3B: db $00, $00, $00, $00 ; 0x39
#_00DC3F: db $00, $00, $00, $00 ; 0x3A
#_00DC43: db $00, $00, $00, $00 ; 0x3B
#_00DC47: db $00, $00, $00, $00 ; 0x3C
#_00DC4B: db $00, $00, $00, $00 ; 0x3D
#_00DC4F: db $00, $00, $00, $00 ; 0x3E
#_00DC53: db $00, $00, $00, $00 ; 0x3F
#_00DC57: db $47, $49, $2B, $2D ; 0x40 - 0x00 for underworld
#_00DC5B: db $46, $49, $1C, $52 ; 0x41 - 0x01 for underworld
#_00DC5F: db $00, $49, $1C, $52 ; 0x42 - 0x02 for underworld
#_00DC63: db $5D, $49, $00, $52 ; 0x43 - 0x03 for underworld
#_00DC67: db $46, $49, $13, $52 ; 0x44 - 0x04 for underworld
#_00DC6B: db $4B, $4D, $4A, $5A ; 0x45 - 0x05 for underworld
#_00DC6F: db $47, $49, $1C, $52 ; 0x46 - 0x06 for underworld
#_00DC73: db $4B, $4D, $39, $36 ; 0x47 - 0x07 for underworld
#_00DC77: db $1F, $2C, $2E, $52 ; 0x48 - 0x08 for underworld
#_00DC7B: db $1F, $2C, $2E, $1D ; 0x49 - 0x09 for underworld
#_00DC7F: db $2F, $2C, $2E, $52 ; 0x4A - 0x0A for underworld
#_00DC83: db $2F, $2C, $2E, $31 ; 0x4B - 0x0B for underworld
#_00DC87: db $1F, $1E, $30, $52 ; 0x4C - 0x0C for underworld
#_00DC8B: db $51, $49, $13, $00 ; 0x4D - 0x0D for underworld
#_00DC8F: db $4F, $49, $13, $50 ; 0x4E - 0x0E for underworld
#_00DC93: db $4F, $4D, $4A, $50 ; 0x4F - 0x0F for underworld
#_00DC97: db $4B, $49, $4C, $2B ; 0x50 - 0x10 for underworld
#_00DC9B: db $1F, $20, $22, $53 ; 0x51 - 0x11 for underworld
#_00DC9F: db $55, $3D, $42, $43 ; 0x52 - 0x12 for underworld
#_00DCA3: db $1F, $1E, $23, $52 ; 0x53 - 0x13 for underworld
#_00DCA7: db $1F, $1E, $39, $3A ; 0x54 - 0x14 for underworld
#_00DCAB: db $1F, $1E, $3A, $3E ; 0x55 - 0x15 for underworld
#_00DCAF: db $1F, $1E, $3C, $3D ; 0x56 - 0x16 for underworld
#_00DCB3: db $40, $1E, $27, $3F ; 0x57 - 0x17 for underworld
#_00DCB7: db $55, $1A, $42, $43 ; 0x58 - 0x18 for underworld
#_00DCBB: db $1F, $1E, $2A, $52 ; 0x59 - 0x19 for underworld
#_00DCBF: db $1F, $1E, $38, $52 ; 0x5A - 0x1A for underworld
#_00DCC3: db $1F, $20, $28, $52 ; 0x5B - 0x1B for underworld
#_00DCC7: db $1F, $20, $26, $52 ; 0x5C - 0x1C for underworld
#_00DCCB: db $1F, $2C, $25, $52 ; 0x5D - 0x1D for underworld
#_00DCCF: db $1F, $20, $27, $52 ; 0x5E - 0x1E for underworld
#_00DCD3: db $1F, $1E, $29, $52 ; 0x5F - 0x1F for underworld
#_00DCD7: db $1F, $2C, $3B, $52 ; 0x60 - 0x20 for underworld
#_00DCDB: db $46, $49, $24, $52 ; 0x61 - 0x21 for underworld
#_00DCDF: db $21, $41, $45, $33 ; 0x62 - 0x22 for underworld
#_00DCE3: db $1F, $2C, $28, $31 ; 0x63 - 0x23 for underworld
#_00DCE7: db $1F, $0D, $29, $52 ; 0x64 - 0x24 for underworld
#_00DCEB: db $1F, $1E, $27, $52 ; 0x65 - 0x25 for underworld
#_00DCEF: db $1F, $20, $27, $53 ; 0x66 - 0x26 for underworld
#_00DCF3: db $48, $49, $13, $52 ; 0x67 - 0x27 for underworld
#_00DCF7: db $0E, $1E, $4A, $50 ; 0x68 - 0x28 for underworld
#_00DCFB: db $1F, $20, $26, $53 ; 0x69 - 0x29 for underworld
#_00DCFF: db $15, $00, $00, $00 ; 0x6A - 0x2A for underworld
#_00DD03: db $1F, $00, $2A, $52 ; 0x6B - 0x2B for underworld
#_00DD07: db $00, $00, $00, $00 ; 0x6C - 0x2C for underworld
#_00DD0B: db $00, $00, $00, $00 ; 0x6D - 0x2D for underworld
#_00DD0F: db $00, $00, $00, $00 ; 0x6E - 0x2E for underworld
#_00DD13: db $00, $00, $00, $00 ; 0x6F - 0x2F for underworld
#_00DD17: db $00, $00, $00, $00 ; 0x70 - 0x30 for underworld
#_00DD1B: db $00, $00, $00, $00 ; 0x71 - 0x31 for underworld
#_00DD1F: db $00, $00, $00, $00 ; 0x72 - 0x32 for underworld
#_00DD23: db $00, $00, $00, $00 ; 0x73 - 0x33 for underworld
#_00DD27: db $00, $00, $00, $00 ; 0x74 - 0x34 for underworld
#_00DD2B: db $00, $00, $00, $00 ; 0x75 - 0x35 for underworld
#_00DD2F: db $00, $00, $00, $00 ; 0x76 - 0x36 for underworld
#_00DD33: db $00, $00, $00, $00 ; 0x77 - 0x37 for underworld
#_00DD37: db $00, $00, $00, $00 ; 0x78 - 0x38 for underworld
#_00DD3B: db $00, $00, $00, $00 ; 0x79 - 0x39 for underworld
#_00DD3F: db $00, $00, $00, $00 ; 0x7A - 0x3A for underworld
#_00DD43: db $00, $00, $00, $00 ; 0x7B - 0x3B for underworld
#_00DD47: db $00, $00, $00, $00 ; 0x7C - 0x3C for underworld
#_00DD4B: db $32, $00, $00, $08 ; 0x7D - 0x3D for underworld
#_00DD4F: db $5D, $49, $00, $52 ; 0x7E - 0x3E for underworld
#_00DD53: db $55, $49, $42, $43 ; 0x7F - 0x3F for underworld
#_00DD57: db $61, $62, $63, $50 ; 0x80 - 0x40 for underworld
#_00DD5B: db $61, $62, $63, $50 ; 0x81 - 0x41 for underworld
#_00DD5F: db $61, $62, $63, $50 ; 0x82 - 0x42 for underworld
#_00DD63: db $61, $62, $63, $50 ; 0x83 - 0x43 for underworld
#_00DD67: db $61, $62, $63, $50 ; 0x84 - 0x44 for underworld
#_00DD6B: db $61, $62, $63, $50 ; 0x85 - 0x45 for underworld
#_00DD6F: db $61, $56, $57, $50 ; 0x86 - 0x46 for underworld
#_00DD73: db $61, $62, $63, $50 ; 0x87 - 0x47 for underworld
#_00DD77: db $61, $62, $63, $50 ; 0x88 - 0x48 for underworld
#_00DD7B: db $61, $56, $57, $50 ; 0x89 - 0x49 for underworld
#_00DD7F: db $61, $56, $63, $50 ; 0x8A - 0x4A for underworld
#_00DD83: db $61, $56, $57, $50 ; 0x8B - 0x4B for underworld
#_00DD87: db $61, $56, $33, $50 ; 0x8C - 0x4C for underworld
#_00DD8B: db $61, $56, $57, $50 ; 0x8D - 0x4D for underworld
#_00DD8F: db $61, $62, $63, $50 ; 0x8E - 0x4E for underworld
#_00DD93: db $61, $62, $63, $50 ; 0x8F - 0x4F for underworld

;===================================================================================================

SheetsTable_AA2:
#_00DD97: db $06, $00, $1F, $18 ; 0x00
#_00DD9B: db $08, $00, $22, $1B ; 0x01
#_00DD9F: db $06, $00, $1F, $18 ; 0x02
#_00DDA3: db $07, $00, $23, $1C ; 0x03
#_00DDA7: db $07, $00, $21, $18 ; 0x04
#_00DDAB: db $09, $00, $20, $19 ; 0x05
#_00DDAF: db $0B, $00, $21, $1A ; 0x06
#_00DDB3: db $0C, $00, $24, $19 ; 0x07
#_00DDB7: db $08, $00, $22, $1B ; 0x08
#_00DDBB: db $0C, $00, $25, $1B ; 0x09
#_00DDBF: db $0C, $00, $26, $1B ; 0x0A
#_00DDC3: db $0A, $00, $27, $1D ; 0x0B
#_00DDC7: db $0A, $00, $28, $1E ; 0x0C
#_00DDCB: db $0B, $00, $29, $16 ; 0x0D
#_00DDCF: db $0D, $00, $2A, $18 ; 0x0E
#_00DDD3: db $07, $00, $23, $1C ; 0x0F
#_00DDD7: db $07, $00, $04, $05 ; 0x10
#_00DDDB: db $07, $00, $04, $05 ; 0x11
#_00DDDF: db $09, $00, $20, $1B ; 0x12
#_00DDE3: db $09, $00, $2A, $17 ; 0x13
#_00DDE7: db $0B, $00, $21, $1C ; 0x14
#_00DDEB: db $09, $00, $20, $19 ; 0x15
#_00DDEF: db $0B, $00, $21, $1A ; 0x16
#_00DDF3: db $09, $00, $24, $1B ; 0x17
#_00DDF7: db $08, $00, $22, $1B ; 0x18
#_00DDFB: db $09, $00, $25, $1B ; 0x19
#_00DDFF: db $09, $00, $26, $1B ; 0x1A
#_00DE03: db $0A, $00, $27, $1D ; 0x1B
#_00DE07: db $09, $00, $28, $1E ; 0x1C
#_00DE0B: db $0C, $00, $29, $16 ; 0x1D
#_00DE0F: db $0D, $00, $2A, $17 ; 0x1E
#_00DE13: db $72, $00, $2B, $5D ; 0x1F

#_00DE17: db $00, $00, $00, $00 ; 0x20
#_00DE1B: db $00, $57, $4C, $00 ; 0x21
#_00DE1F: db $00, $56, $4F, $00 ; 0x22
#_00DE23: db $00, $53, $4D, $00 ; 0x23
#_00DE27: db $00, $52, $49, $00 ; 0x24
#_00DE2B: db $00, $55, $4A, $00 ; 0x25
#_00DE2F: db $00, $53, $54, $00 ; 0x26
#_00DE33: db $00, $51, $4E, $00 ; 0x27
#_00DE37: db $00, $00, $00, $00 ; 0x28
#_00DE3B: db $00, $50, $4B, $00 ; 0x29
#_00DE3F: db $00, $53, $4D, $00 ; 0x2A
#_00DE43: db $00, $55, $54, $00 ; 0x2B
#_00DE47: db $00, $00, $00, $00 ; 0x2C
#_00DE4B: db $00, $00, $00, $00 ; 0x2D
#_00DE4F: db $00, $00, $00, $00 ; 0x2E
#_00DE53: db $00, $47, $48, $00 ; 0x2F
#_00DE57: db $00, $00, $00, $00 ; 0x30
#_00DE5B: db $00, $57, $4C, $00 ; 0x31
#_00DE5F: db $00, $56, $4F, $00 ; 0x32
#_00DE63: db $00, $53, $4D, $00 ; 0x33
#_00DE67: db $00, $52, $49, $00 ; 0x34
#_00DE6B: db $00, $55, $4A, $00 ; 0x35
#_00DE6F: db $00, $53, $54, $00 ; 0x36
#_00DE73: db $00, $51, $4E, $00 ; 0x37
#_00DE77: db $00, $00, $00, $00 ; 0x38
#_00DE7B: db $00, $50, $4B, $00 ; 0x39
#_00DE7F: db $00, $53, $00, $00 ; 0x3A
#_00DE83: db $00, $35, $36, $00 ; 0x3B
#_00DE87: db $00, $60, $34, $00 ; 0x3C
#_00DE8B: db $00, $2B, $2C, $00 ; 0x3D
#_00DE8F: db $00, $2D, $2E, $00 ; 0x3E
#_00DE93: db $00, $2F, $30, $00 ; 0x3F
#_00DE97: db $00, $37, $38, $00 ; 0x40
#_00DE9B: db $00, $33, $34, $00 ; 0x41
#_00DE9F: db $00, $31, $32, $00 ; 0x42
#_00DEA3: db $00, $00, $00, $00 ; 0x43
#_00DEA7: db $00, $00, $00, $00 ; 0x44
#_00DEAB: db $00, $00, $00, $00 ; 0x45
#_00DEAF: db $00, $00, $00, $00 ; 0x46
#_00DEB3: db $00, $00, $00, $00 ; 0x47
#_00DEB7: db $00, $00, $00, $00 ; 0x48
#_00DEBB: db $00, $00, $00, $00 ; 0x49
#_00DEBF: db $00, $00, $00, $00 ; 0x4A
#_00DEC3: db $00, $00, $00, $00 ; 0x4B
#_00DEC7: db $00, $00, $00, $00 ; 0x4C
#_00DECB: db $00, $00, $00, $00 ; 0x4D
#_00DECF: db $00, $00, $00, $00 ; 0x4E
#_00DED3: db $00, $00, $00, $00 ; 0x4F
#_00DED7: db $72, $71, $72, $71 ; 0x50
#_00DEDB: db $17, $40, $41, $39 ; 0x51

;===================================================================================================

pool Graphics_IncrementalVRAMUpload

.vram_address_high
#_00DEDF: db $50 ; VRAM $A000
#_00DEE0: db $51 ; VRAM $A200
#_00DEE1: db $52 ; VRAM $A400
#_00DEE2: db $53 ; VRAM $A600
#_00DEE3: db $54 ; VRAM $A800
#_00DEE4: db $55 ; VRAM $AA00
#_00DEE5: db $56 ; VRAM $AC00
#_00DEE6: db $57 ; VRAM $AE00
#_00DEE7: db $58 ; VRAM $B000
#_00DEE8: db $59 ; VRAM $B200
#_00DEE9: db $5A ; VRAM $B400
#_00DEEA: db $5B ; VRAM $B600
#_00DEEB: db $5C ; VRAM $B800
#_00DEEC: db $5D ; VRAM $BA00
#_00DEED: db $5E ; VRAM $BC00
#_00DEEE: db $5F ; VRAM $BE00

;---------------------------------------------------------------------------------------------------

.buffer_address_high
#_00DEEF: db $7F0000>>8 ; $50
#_00DEF0: db $7F0200>>8 ; $51
#_00DEF1: db $7F0400>>8 ; $52
#_00DEF2: db $7F0600>>8 ; $53
#_00DEF3: db $7F0800>>8 ; $54
#_00DEF4: db $7F0A00>>8 ; $55
#_00DEF5: db $7F0C00>>8 ; $56
#_00DEF6: db $7F0E00>>8 ; $57
#_00DEF7: db $7F1000>>8 ; $58
#_00DEF8: db $7F1200>>8 ; $59
#_00DEF9: db $7F1400>>8 ; $5A
#_00DEFA: db $7F1600>>8 ; $5B
#_00DEFB: db $7F1800>>8 ; $5C
#_00DEFC: db $7F1A00>>8 ; $5D
#_00DEFD: db $7F1C00>>8 ; $5E
#_00DEFE: db $7F1E00>>8 ; $5F

pool off

;---------------------------------------------------------------------------------------------------

Graphics_IncrementalVRAMUpload:
#_00DEFF: LDX.w $0412
#_00DF02: CPX.b #$10
#_00DF04: BEQ .exit

#_00DF06: LDA.l .vram_address_high,X
#_00DF0A: STA.b $19

#_00DF0C: STZ.w $0118

#_00DF0F: LDA.l .buffer_address_high,X
#_00DF13: STA.w $0119

#_00DF16: INC.w $0412

.exit
#_00DF19: RTL

;===================================================================================================

PrepTransAuxGfx:
#_00DF1A: LDA.b #$7E
#_00DF1C: STA.b $02
#_00DF1E: STA.b $05

#_00DF20: REP #$31

#_00DF22: LDX.w #$0000
#_00DF25: LDY.w #$0040
#_00DF28: LDA.w #$7E6000
#_00DF2B: JSR Do3To4High16Bit

#_00DF2E: LDY.w #$00C0

#_00DF31: LDA.w $0AA2
#_00DF34: AND.w #$00FF
#_00DF37: CMP.w #$0020
#_00DF3A: BCC .left_side_palettes

#_00DF3C: LDY.w #$0080

#_00DF3F: LDA.b $03
#_00DF41: JSR Do3To4High16Bit

#_00DF44: LDY.w #$0040

.left_side_palettes
#_00DF47: LDA.b $03
#_00DF49: JSR Do3To4Low16Bit

#_00DF4C: SEP #$30

#_00DF4E: RTL

;===================================================================================================

Do3To4High16Bit:
#_00DF4F: STY.b $0C

.next_tile
#_00DF51: STA.b $00

#_00DF53: CLC
#_00DF54: ADC.w #$0010
#_00DF57: STA.b $03

#_00DF59: LDY.w #$0003

.next_convert
#_00DF5C: LDA.b [$00]
#_00DF5E: STA.l $7F0000,X

#_00DF62: XBA
#_00DF63: ORA.b [$00]
#_00DF65: AND.w #$00FF
#_00DF68: STA.b $08

#_00DF6A: INC.b $00
#_00DF6C: INC.b $00

#_00DF6E: LDA.b [$03]
#_00DF70: AND.w #$00FF
#_00DF73: STA.b $0A

#_00DF75: ORA.b $08
#_00DF77: XBA
#_00DF78: ORA.b $0A
#_00DF7A: STA.l $7F0010,X

#_00DF7E: INC.b $03

#_00DF80: INX
#_00DF81: INX

#_00DF82: LDA.b [$00]
#_00DF84: STA.l $7F0000,X

#_00DF88: XBA
#_00DF89: ORA.b [$00]
#_00DF8B: AND.w #$00FF
#_00DF8E: STA.b $08

#_00DF90: INC.b $00
#_00DF92: INC.b $00

#_00DF94: LDA.b [$03]
#_00DF96: AND.w #$00FF
#_00DF99: STA.b $0A

#_00DF9B: ORA.b $08
#_00DF9D: XBA
#_00DF9E: ORA.b $0A
#_00DFA0: STA.l $7F0010,X

#_00DFA4: INC.b $03

#_00DFA6: INX
#_00DFA7: INX

#_00DFA8: DEY
#_00DFA9: BPL .next_convert

#_00DFAB: TXA
#_00DFAC: CLC
#_00DFAD: ADC.w #$0010
#_00DFB0: TAX

#_00DFB1: LDA.b $03

#_00DFB3: DEC.b $0C
#_00DFB5: BNE .next_tile

#_00DFB7: RTS

;===================================================================================================

Do3To4Low16Bit:
#_00DFB8: STY.b $0C

.next_tile
#_00DFBA: STA.b $00

#_00DFBC: CLC
#_00DFBD: ADC.w #$0010
#_00DFC0: STA.b $03

#_00DFC2: LDY.w #$0001

.next_convert
#_00DFC5: LDA.b [$00]
#_00DFC7: STA.l $7F0000,X

#_00DFCB: INC.b $00
#_00DFCD: INC.b $00

#_00DFCF: LDA.b [$03]
#_00DFD1: AND.w #$00FF
#_00DFD4: STA.l $7F0010,X

#_00DFD8: INC.b $03

#_00DFDA: INX
#_00DFDB: INX

#_00DFDC: LDA.b [$00]
#_00DFDE: STA.l $7F0000,X

#_00DFE2: INC.b $00
#_00DFE4: INC.b $00

#_00DFE6: LDA.b [$03]
#_00DFE8: AND.w #$00FF
#_00DFEB: STA.l $7F0010,X

#_00DFEF: INC.b $03

#_00DFF1: INX
#_00DFF2: INX

#_00DFF3: LDA.b [$00]
#_00DFF5: STA.l $7F0000,X

#_00DFF9: INC.b $00
#_00DFFB: INC.b $00

#_00DFFD: LDA.b [$03]
#_00DFFF: AND.w #$00FF
#_00E002: STA.l $7F0010,X

#_00E006: INC.b $03

#_00E008: INX
#_00E009: INX

#_00E00A: LDA.b [$00]
#_00E00C: STA.l $7F0000,X

#_00E010: INC.b $00
#_00E012: INC.b $00

#_00E014: LDA.b [$03]
#_00E016: AND.w #$00FF
#_00E019: STA.l $7F0010,X

#_00E01D: INC.b $03

#_00E01F: INX
#_00E020: INX

#_00E021: DEY
#_00E022: BPL .next_convert

#_00E024: TXA
#_00E025: CLC
#_00E026: ADC.w #$0010
#_00E029: TAX

#_00E02A: LDA.b $03

#_00E02C: DEC.b $0C
#_00E02E: BNE .next_tile

#_00E030: RTS

;===================================================================================================

LoadNewSpriteGFXSet:
#_00E031: LDA.b #$7E
#_00E033: STA.b $02
#_00E035: STA.b $05

#_00E037: REP #$31

#_00E039: LDX.w #$0000

#_00E03C: LDA.w #$7E7800
#_00E03F: LDY.w #$00C0
#_00E042: JSR Do3To4Low16Bit

#_00E045: LDY.w #$0040

#_00E048: LDA.l $7EC2FF
#_00E04C: AND.w #$00FF
#_00E04F: CMP.w #$0052
#_00E052: BEQ .right_side

#_00E054: CMP.w #$0053
#_00E057: BEQ .right_side

#_00E059: CMP.w #$005A
#_00E05C: BEQ .right_side

#_00E05E: CMP.w #$005B
#_00E061: BNE .left_side

.right_side
#_00E063: LDA.b $03
#_00E065: JSR Do3To4High16Bit

#_00E068: SEP #$30

#_00E06A: RTL

.left_side
#_00E06B: LDA.b $03
#_00E06D: JSR Do3To4Low16Bit

#_00E070: SEP #$30

#_00E072: RTL

;===================================================================================================

SheetsTable_AA1:
; Underworld
#_00E073: db $00, $01, $10, $06, $0E, $1F, $18, $0F ; 0x00
#_00E07B: db $00, $01, $10, $08, $0E, $22, $1B, $0F ; 0x01
#_00E083: db $00, $01, $10, $06, $0E, $1F, $18, $0F ; 0x02
#_00E08B: db $00, $01, $13, $07, $0E, $23, $1C, $0F ; 0x03
#_00E093: db $00, $01, $10, $07, $0E, $21, $18, $0F ; 0x04
#_00E09B: db $00, $01, $10, $09, $0E, $20, $19, $0F ; 0x05
#_00E0A3: db $02, $03, $12, $0B, $0E, $21, $1A, $0F ; 0x06
#_00E0AB: db $00, $01, $11, $0C, $0E, $24, $1B, $0F ; 0x07
#_00E0B3: db $00, $01, $11, $08, $0E, $22, $1B, $0F ; 0x08
#_00E0BB: db $00, $01, $11, $0C, $0E, $25, $1A, $0F ; 0x09
#_00E0C3: db $00, $01, $11, $0C, $0E, $26, $1B, $0F ; 0x0A
#_00E0CB: db $00, $01, $14, $0A, $0E, $27, $1D, $0F ; 0x0B
#_00E0D3: db $00, $01, $11, $0A, $0E, $28, $1E, $0F ; 0x0C
#_00E0DB: db $02, $03, $12, $0B, $0E, $29, $16, $0F ; 0x0D
#_00E0E3: db $00, $01, $15, $0D, $0E, $2A, $18, $0F ; 0x0E
#_00E0EB: db $00, $01, $10, $07, $0E, $23, $1C, $0F ; 0x0F
#_00E0F3: db $00, $01, $13, $07, $0E, $04, $05, $0F ; 0x10
#_00E0FB: db $00, $01, $13, $07, $0E, $04, $05, $0F ; 0x11
#_00E103: db $00, $01, $10, $09, $0E, $20, $1B, $0F ; 0x12
#_00E10B: db $00, $01, $10, $09, $0E, $2A, $17, $0F ; 0x13
#_00E113: db $02, $03, $12, $0B, $0E, $21, $1C, $0F ; 0x14

#_00E11B: db $00, $08, $11, $1B, $22, $2E, $5D, $5B ; 0x15
#_00E123: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x16
#_00E12B: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x17

; Overworld
#_00E133: db $3A, $3B, $3C, $3D, $53, $4D, $3E, $5B ; 0x18
#_00E13B: db $42, $43, $44, $45, $20, $2B, $3F, $5D ; 0x19
#_00E143: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1A
#_00E14B: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1B
#_00E153: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1C
#_00E15B: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1D
#_00E163: db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1E
#_00E16B: db $71, $72, $71, $72, $20, $2B, $5D, $5B ; 0x1F
#_00E173: db $3A, $3B, $3C, $3D, $53, $4D, $3E, $5B ; 0x20
#_00E17B: db $42, $43, $44, $45, $20, $2B, $3F, $59 ; 0x21
#_00E183: db $00, $72, $71, $72, $20, $2B, $5D, $0F ; 0x22
#_00E18B: db $16, $39, $1D, $17, $40, $41, $39, $1E ; 0x23
#_00E193: db $00, $46, $39, $72, $40, $41, $39, $0F ; 0x24

;===================================================================================================

InitializeTilesets:
#_00E19B: PHB
#_00E19C: PHK
#_00E19D: PLB

#_00E19E: LDA.b #$80
#_00E1A0: STA.w VMAIN

#_00E1A3: STZ.w VMADDL

#_00E1A6: LDA.b #$44 ; VRAM $8800
#_00E1A8: STA.w VMADDH

#_00E1AB: JSR LoadCommonSprites

#_00E1AE: REP #$30

#_00E1B0: LDA.w $0AA3
#_00E1B3: AND.w #$00FF
#_00E1B6: ASL A
#_00E1B7: ASL A
#_00E1B8: TAY

#_00E1B9: SEP #$20

#_00E1BB: LDA.w SheetsTable_AA3+0,Y
#_00E1BE: BEQ .dont_change_a

#_00E1C0: STA.l $7EC2FC

.dont_change_a
#_00E1C4: LDA.l $7EC2FC
#_00E1C8: STA.b $09

#_00E1CA: LDA.w SheetsTable_AA3+1,Y
#_00E1CD: BEQ .dont_change_b

#_00E1CF: STA.l $7EC2FD

.dont_change_b
#_00E1D3: LDA.l $7EC2FD
#_00E1D7: STA.b $08

#_00E1D9: LDA.w SheetsTable_AA3+2,Y
#_00E1DC: BEQ .dont_change_c

#_00E1DE: STA.l $7EC2FE

.dont_change_c
#_00E1E2: LDA.l $7EC2FE
#_00E1E6: STA.b $07

#_00E1E8: LDA.w SheetsTable_AA3+3,Y
#_00E1EB: BEQ .dont_change_d

#_00E1ED: STA.l $7EC2FF

.dont_change_d
#_00E1F1: LDA.l $7EC2FF
#_00E1F5: STA.b $06

;---------------------------------------------------------------------------------------------------

#_00E1F7: SEP #$10

#_00E1F9: LDY.b $09

#_00E1FB: LDA.b #$7E
#_00E1FD: STA.b $02

#_00E1FF: LDX.b #$78
#_00E201: JSR LoadSpriteGraphics

#_00E204: LDY.b $08
#_00E206: LDX.b #$7E
#_00E208: JSR LoadSpriteGraphics

#_00E20B: LDY.b $07
#_00E20D: LDX.b #$84
#_00E20F: JSR LoadSpriteGraphics

#_00E212: LDY.b $06
#_00E214: LDX.b #$8A
#_00E216: JSR LoadSpriteGraphics

#_00E219: REP #$30

#_00E21B: LDA.w #$2000 ; VRAM $4000
#_00E21E: STA.w VMADDR

#_00E221: LDA.w $0AA1
#_00E224: AND.w #$00FF
#_00E227: ASL A
#_00E228: ASL A
#_00E229: ASL A
#_00E22A: TAY

#_00E22B: LDA.w $0AA2
#_00E22E: AND.w #$00FF
#_00E231: ASL A
#_00E232: ASL A
#_00E233: TAX

#_00E234: SEP #$20

#_00E236: LDA.w SheetsTable_AA1+0,Y
#_00E239: STA.b $0D

#_00E23B: LDA.w SheetsTable_AA1+1,Y
#_00E23E: STA.b $0C

#_00E240: LDA.w SheetsTable_AA1+2,Y
#_00E243: STA.b $0B

#_00E245: LDA.w SheetsTable_AA2+0,X
#_00E248: BNE .not_default_a

#_00E24A: LDA.w SheetsTable_AA1+3,Y

.not_default_a
#_00E24D: STA.l $7EC2F8
#_00E251: STA.b $0A

#_00E253: LDA.w SheetsTable_AA2+1,X
#_00E256: BNE .not_default_b

#_00E258: LDA.w SheetsTable_AA1+4,Y

.not_default_b
#_00E25B: STA.l $7EC2F9
#_00E25F: STA.b $09

#_00E261: LDA.w SheetsTable_AA2+2,X
#_00E264: BNE .not_default_c

#_00E266: LDA.w SheetsTable_AA1+5,Y

.not_default_c
#_00E269: STA.l $7EC2FA
#_00E26D: STA.b $08

#_00E26F: LDA.w SheetsTable_AA2+3,X
#_00E272: BNE .not_default_d

#_00E274: LDA.w SheetsTable_AA1+6,Y

.not_default_d
#_00E277: STA.l $7EC2FB
#_00E27B: STA.b $07

;---------------------------------------------------------------------------------------------------

#_00E27D: LDA.w SheetsTable_AA1+7,Y
#_00E280: STA.b $06

#_00E282: SEP #$10

#_00E284: LDA.b #$07
#_00E286: STA.b $0F

#_00E288: LDY.b $0D
#_00E28A: JSR LoadBackgroundGraphics

#_00E28D: DEC.b $0F

#_00E28F: LDY.b $0C
#_00E291: JSR LoadBackgroundGraphics

#_00E294: DEC.b $0F

#_00E296: LDY.b $0B
#_00E298: JSR LoadBackgroundGraphics

#_00E29B: DEC.b $0F

#_00E29D: LDY.b $0A
#_00E29F: LDA.b #$7E
#_00E2A1: LDX.b #$60
#_00E2A3: JSR LoadBackgroundGraphics_arbitrary

#_00E2A6: DEC.b $0F

#_00E2A8: LDY.b $09
#_00E2AA: LDA.b #$7E
#_00E2AC: LDX.b #$66
#_00E2AE: JSR LoadBackgroundGraphics_arbitrary

#_00E2B1: DEC.b $0F

#_00E2B3: LDY.b $08
#_00E2B5: LDA.b #$7E
#_00E2B7: LDX.b #$6C
#_00E2B9: JSR LoadBackgroundGraphics_arbitrary

#_00E2BC: DEC.b $0F

#_00E2BE: LDY.b $07
#_00E2C0: LDA.b #$7E
#_00E2C2: LDX.b #$72
#_00E2C4: JSR LoadBackgroundGraphics_arbitrary

#_00E2C7: DEC.b $0F

#_00E2C9: LDY.b $06
#_00E2CB: JSR LoadBackgroundGraphics

#_00E2CE: PLB

#_00E2CF: RTL

;===================================================================================================

LoadDefaultGraphics:
#_00E2D0: PHB
#_00E2D1: PHK
#_00E2D2: PLB

#_00E2D3: LDA.b #$80
#_00E2D5: STA.w VMAIN

#_00E2D8: LDA.w GFXSheetPointers_sprite_bank
#_00E2DB: STA.b $02

#_00E2DD: LDA.w GFXSheetPointers_sprite_high
#_00E2E0: STA.b $01

#_00E2E2: LDA.w GFXSheetPointers_sprite_low
#_00E2E5: STA.b $00

#_00E2E7: REP #$20

#_00E2E9: LDA.w #$4000 ; VRAM $8000
#_00E2EC: STA.w VMADDR

#_00E2EF: LDY.b #$40

;---------------------------------------------------------------------------------------------------

.next_tile
#_00E2F1: LDX.b #$0E

.next_planes_a
#_00E2F3: LDA.b [$00]
#_00E2F5: STA.w VMDATA

#_00E2F8: XBA
#_00E2F9: ORA.b [$00]
#_00E2FB: AND.w #$00FF
#_00E2FE: STA.b $BF,X

#_00E300: INC.b $00
#_00E302: INC.b $00

#_00E304: DEX
#_00E305: DEX
#_00E306: BPL .next_planes_a

#_00E308: LDX.b #$0E

.next_planes_b
#_00E30A: LDA.b [$00]
#_00E30C: AND.w #$00FF
#_00E30F: STA.b $BD

#_00E311: ORA.b $BF,X
#_00E313: XBA
#_00E314: ORA.b $BD
#_00E316: STA.w VMDATA

#_00E319: INC.b $00

#_00E31B: DEX
#_00E31C: DEX
#_00E31D: BPL .next_planes_b

#_00E31F: DEY
#_00E320: BNE .next_tile

;---------------------------------------------------------------------------------------------------

#_00E322: LDA.w #$7000 ; VRAM $E000
#_00E325: STA.w VMADDR

#_00E328: SEP #$20

#_00E32A: LDY.b #$6A
#_00E32C: JSR DecompressAndCopyManually

#_00E32F: LDY.b #$6B
#_00E331: JSR DecompressAndCopyManually

#_00E334: LDY.b #$69
#_00E336: JSR DecompressAndCopyManually

#_00E339: PLB

#_00E33A: RTL

;===================================================================================================

DecompressAndCopyManually:
#_00E33B: JSR Decompress_sprite_low

#_00E33E: REP #$30

#_00E340: LDX.w #$00FF

.copy_next
#_00E343: LDA.b [$00]
#_00E345: STA.w VMDATA

#_00E348: INC.b $00
#_00E34A: INC.b $00

#_00E34C: LDA.b [$00]
#_00E34E: STA.w VMDATA

#_00E351: INC.b $00
#_00E353: INC.b $00

#_00E355: LDA.b [$00]
#_00E357: STA.w VMDATA

#_00E35A: INC.b $00
#_00E35C: INC.b $00

#_00E35E: LDA.b [$00]
#_00E360: STA.w VMDATA

#_00E363: INC.b $00
#_00E365: INC.b $00

#_00E367: DEX
#_00E368: BPL .copy_next

#_00E36A: SEP #$30

#_00E36C: RTS

;===================================================================================================

Attract_LoadBG3GFX:
#_00E36D: PHB
#_00E36E: PHK
#_00E36F: PLB

#_00E370: LDA.b #$80
#_00E372: STA.w VMAIN
#_00E375: STZ.w VMADDL

#_00E378: LDA.b #$78
#_00E37A: STA.w VMADDH

#_00E37D: LDY.b #$67
#_00E37F: JSR DecompressAndCopyManually

#_00E382: PLB

#_00E383: RTL

;===================================================================================================

LoadCommonSprites_long:
#_00E384: PHB
#_00E385: PHK
#_00E386: PLB

#_00E387: LDA.b #$80
#_00E389: STA.w VMAIN

#_00E38C: STZ.w VMADDL

#_00E38F: LDA.b #$44 ; VRAM $8800
#_00E391: STA.w VMADDH

#_00E394: JSR LoadCommonSprites

#_00E397: PLB

#_00E398: RTL

;===================================================================================================

TransferMode7Characters:
#_00E399: LDA.b #WorldMap_Mode7TileGFX>>16
#_00E39B: STA.b $02

#_00E39D: LDA.b #$80
#_00E39F: STA.w VMAIN

#_00E3A2: STZ.w VMADDL ; VRAM $0000
#_00E3A5: STZ.w VMADDH

#_00E3A8: REP #$10

#_00E3AA: LDY.w #WorldMap_Mode7TileGFX>>0
#_00E3AD: STY.b $00

;---------------------------------------------------------------------------------------------------

#_00E3AF: LDY.w #$0000

.next
#_00E3B2: LDA.b [$00],Y
#_00E3B4: STA.w VMDATAH

#_00E3B7: INY
#_00E3B8: LDA.b [$00],Y
#_00E3BA: STA.w VMDATAH

#_00E3BD: INY
#_00E3BE: LDA.b [$00],Y
#_00E3C0: STA.w VMDATAH

#_00E3C3: INY
#_00E3C4: LDA.b [$00],Y
#_00E3C6: STA.w VMDATAH

#_00E3C9: INY
#_00E3CA: CPY.w #$4000
#_00E3CD: BNE .next

#_00E3CF: SEP #$10

;---------------------------------------------------------------------------------------------------

#EXIT_00E3D1:
#_00E3D1: RTL

;===================================================================================================

pool Graphics_LoadChrHalfSlot

.sheet_id
#_00E3D2: db $01 ; 0x74 - Overworld common
#_00E3D3: db $01 ; 0x74 - Overworld common
#_00E3D4: db $08 ; 0x7B - Intro
#_00E3D5: db $08 ; 0x7B - Intro
#_00E3D6: db $09 ; 0x7C - Unused
#_00E3D7: db $09 ; 0x7C - Unused
#_00E3D8: db $02 ; 0x75 - Ether
#_00E3D9: db $02 ; 0x75 - Ether
#_00E3DA: db $02 ; 0x75 - Ether
#_00E3DB: db $02 ; 0x75 - Ether
#_00E3DC: db $03 ; 0x76 - Bombos
#_00E3DD: db $03 ; 0x76 - Bombos
#_00E3DE: db $04 ; 0x77 - Quake
#_00E3DF: db $04 ; 0x77 - Quake
#_00E3E0: db $05 ; 0x78 - Game over
#_00E3E1: db $05 ; 0x78 - Game over
#_00E3E2: db $08 ; 0x7B - Intro
#_00E3E3: db $08 ; 0x7B - Intro
#_00E3E4: db $08 ; 0x7B - Intro
#_00E3E5: db $08 ; 0x7B - Intro

.palette_id
#_00E3E6: db $0A ; 0x74 - Overworld common
#_00E3E7: db $FF ; 0x74 - Overworld common
#_00E3E8: db $03 ; 0x7B - Intro
#_00E3E9: db $FF ; 0x7B - Intro
#_00E3EA: db $00 ; 0x7C - Unused
#_00E3EB: db $FF ; 0x7C - Unused
#_00E3EC: db $FF ; 0x75 - Ether
#_00E3ED: db $FF ; 0x75 - Ether
#_00E3EE: db $01 ; 0x75 - Ether
#_00E3EF: db $FF ; 0x75 - Ether
#_00E3F0: db $02 ; 0x76 - Bombos
#_00E3F1: db $FF ; 0x76 - Bombos
#_00E3F2: db $00 ; 0x77 - Quake
#_00E3F3: db $FF ; 0x77 - Quake
#_00E3F4: db $FF ; 0x78 - Game over
#_00E3F5: db $FF ; 0x78 - Game over
#_00E3F6: db $FF ; 0x7B - Intro
#_00E3F7: db $FF ; 0x7B - Intro
#_00E3F8: db $FF ; 0x7B - Intro
#_00E3F9: db $FF ; 0x7B - Intro

pool off

;---------------------------------------------------------------------------------------------------

Graphics_LoadChrHalfSlot:
#_00E3FA: LDX.w $0AAA
#_00E3FD: BEQ EXIT_00E3D1

#_00E3FF: PHB
#_00E400: PHK
#_00E401: PLB

#_00E402: LDA.w .palette_id-1,X
#_00E405: BMI .done_palette

#_00E407: STA.w $0AB1

#_00E40A: CPX.b #$01
#_00E40C: BNE .not_sheet_1

#_00E40E: LDA.b #$0A
#_00E410: STA.w $0AB1

#_00E413: LDA.b #$02
#_00E415: STA.w $0AA9

#_00E418: JSL Palettes_Load_SpriteEnvironment

#_00E41C: INC.b $15

#_00E41E: BRA .done_palette

.not_sheet_1
#_00E420: LDA.b #$02
#_00E422: STA.w $0AA9

#_00E425: JSL Palettes_Load_SpriteEnvironment_Underworld

#_00E429: INC.b $15

;---------------------------------------------------------------------------------------------------

.done_palette
#_00E42B: LDX.w $0AAA

#_00E42E: LDY.b #$44

#_00E430: STZ.b $08
#_00E432: STZ.b $09

#_00E434: INC.w $0AAA

#_00E437: LDA.w $0AAA
#_00E43A: LSR A
#_00E43B: BCC .dont_reset_medallion_flags

#_00E43D: STZ.w $0AAA

#_00E440: CPX.b #$12
#_00E442: BEQ .dont_reset_medallion_flags

#_00E444: LDA.b #$03
#_00E446: STA.b $09

#_00E448: LDY.b #$46
#_00E44A: CPX.b #$02
#_00E44C: BNE .dont_reset_medallion_flags

#_00E44E: STZ.w $0112

.dont_reset_medallion_flags
#_00E451: STY.w $0116

#_00E454: LDA.b #$0B
#_00E456: STA.b $17

#_00E458: LDY.w .sheet_id-1,X
#_00E45B: CPY.b #$01
#_00E45D: BNE .dont_reload_from_tileset

#_00E45F: LDY.w $0AA4

.dont_reload_from_tileset
#_00E462: LDA.w GFXSheetPointers_sprite_bank,Y
#_00E465: STA.b $02
#_00E467: STA.b $05

#_00E469: LDA.w GFXSheetPointers_sprite_high,Y
#_00E46C: STA.b $01

#_00E46E: LDA.w GFXSheetPointers_sprite_low,Y
#_00E471: STA.b $00

#_00E473: REP #$31

#_00E475: LDY.w #$0020
#_00E478: STY.b $0C

#_00E47A: LDX.w #$0000

#_00E47D: LDA.b $00
#_00E47F: ADC.b $08

;---------------------------------------------------------------------------------------------------

.next_tile
#_00E481: STA.b $00

#_00E483: CLC
#_00E484: ADC.w #$0010
#_00E487: BNE .no_bank_cross_1

#_00E489: LDA.w #$8000
#_00E48C: INC.b $05

.no_bank_cross_1
#_00E48E: STA.b $03

#_00E490: LDY.w #$0007

.next_plane
#_00E493: LDA.b [$00]
#_00E495: STA.l $7F1000,X

#_00E499: XBA
#_00E49A: ORA.b [$00]
#_00E49C: AND.w #$00FF
#_00E49F: STA.b $08

#_00E4A1: INC.b $00
#_00E4A3: INC.b $00
#_00E4A5: BNE .no_bank_cross_2

#_00E4A7: LDA.b $03
#_00E4A9: INC A
#_00E4AA: STA.b $00

#_00E4AC: INC.b $02

#_00E4AE: LDA.b $02
#_00E4B0: STA.b $05

.no_bank_cross_2
#_00E4B2: LDA.b [$03]
#_00E4B4: AND.w #$00FF
#_00E4B7: STA.b $0A

#_00E4B9: ORA.b $08
#_00E4BB: XBA
#_00E4BC: ORA.b $0A
#_00E4BE: STA.l $7F1010,X

#_00E4C2: INC.b $03
#_00E4C4: BNE .no_bank_cross_3

#_00E4C6: LDA.w #$8000
#_00E4C9: STA.b $00

#_00E4CB: LDA.w #$8010
#_00E4CE: STA.b $03

#_00E4D0: INC.b $02
#_00E4D2: INC.b $05

.no_bank_cross_3
#_00E4D4: INX
#_00E4D5: INX

#_00E4D6: DEY
#_00E4D7: BPL .next_plane

#_00E4D9: TXA
#_00E4DA: CLC
#_00E4DB: ADC.w #$0010
#_00E4DE: TAX

#_00E4DF: LDA.b $03

#_00E4E1: DEC.b $0C
#_00E4E3: BNE .next_tile

#_00E4E5: SEP #$30

#_00E4E7: PLB

#_00E4E8: RTL

;===================================================================================================

LoadFileSelectGraphics:
#_00E4E9: LDA.b #$02
#_00E4EB: STA.w OBSEL

#_00E4EE: LDA.b #$80
#_00E4F0: STA.w VMAIN
#_00E4F3: STZ.w VMADDL

#_00E4F6: LDA.b #$50 ; VRAM $A000
#_00E4F8: STA.w VMADDH

;---------------------------------------------------------------------------------------------------

#_00E4FB: PHB
#_00E4FC: PHK
#_00E4FD: PLB

#_00E4FE: LDY.b #$5E
#_00E500: JSR Decompress_sprite_low

#_00E503: REP #$20

#_00E505: LDY.b #$3F
#_00E507: JSR Do3To4High

#_00E50A: LDY.b #$5F
#_00E50C: JSR Decompress_sprite_low

#_00E50F: REP #$20

#_00E511: LDY.b #$3F
#_00E513: JSR Do3To4High

#_00E516: PLB

;---------------------------------------------------------------------------------------------------

#_00E517: LDA.b #TheFont>>16
#_00E519: STA.b $02

#_00E51B: REP #$30

#_00E51D: LDA.w #$7000 ; VRAM $E000
#_00E520: STA.w VMADDR

#_00E523: LDA.w #TheFont
#_00E526: STA.b $00

#_00E528: LDX.w #(TheFont_end-TheFont)/2-1

.next_a
#_00E52B: LDA.b [$00]
#_00E52D: STA.w VMDATA

#_00E530: INC.b $00
#_00E532: INC.b $00

#_00E534: DEX
#_00E535: BPL .next_a

;---------------------------------------------------------------------------------------------------

#_00E537: SEP #$30

#_00E539: PHB
#_00E53A: PHK
#_00E53B: PLB

#_00E53C: LDY.b #$6B
#_00E53E: JSR Decompress_sprite_low

#_00E541: REP #$30

#_00E543: LDX.w #$02FF

.next_b
#_00E546: LDA.b [$00]
#_00E548: STA.w VMDATA

#_00E54B: INC.b $00
#_00E54D: INC.b $00

#_00E54F: DEX
#_00E550: BPL .next_b

#_00E552: SEP #$30

#_00E554: PLB

#_00E555: RTL

;===================================================================================================

TransferFontToVRAM:
#_00E556: LDA.b #$02
#_00E558: STA.w OBSEL

#_00E55B: LDA.b #$80
#_00E55D: STA.w VMAIN

#_00E560: LDA.b #TheFont>>16
#_00E562: STA.b $02

#_00E564: REP #$30

#_00E566: LDA.w #$7000 ; VRAM $E000
#_00E569: STA.w VMADDR

#_00E56C: LDA.w #TheFont
#_00E56F: STA.b $00

#_00E571: LDX.w #(TheFont_end-TheFont)/2-1

.next
#_00E574: LDA.b [$00]
#_00E576: STA.w VMDATA

#_00E579: INC.b $00
#_00E57B: INC.b $00

#_00E57D: DEX
#_00E57E: BPL .next

#_00E580: SEP #$30

#_00E582: RTL

;===================================================================================================

LoadSpriteGraphics:
#_00E583: STZ.b $00
#_00E585: STX.b $01

#_00E587: PHY

#_00E588: JSR Decompress_sprite_arbitrary

#_00E58B: REP #$20

#_00E58D: LDY.b #$3F

#_00E58F: PLX

#_00E590: CPX.b #$52
#_00E592: BEQ Do3To4High

#_00E594: CPX.b #$53
#_00E596: BEQ Do3To4High

#_00E598: CPX.b #$5A
#_00E59A: BEQ Do3To4High

#_00E59C: CPX.b #$5B
#_00E59E: BEQ Do3To4High

#_00E5A0: CPX.b #$5C
#_00E5A2: BEQ Do3To4High

#_00E5A4: CPX.b #$5E
#_00E5A6: BEQ Do3To4High

#_00E5A8: CPX.b #$5F
#_00E5AA: BEQ Do3To4High

#_00E5AC: JMP.w Do3To4Low

;===================================================================================================

Do3To4High:
.next_tile
#_00E5AF: LDX.b #$0E

.next_planes_a
#_00E5B1: LDA.b [$00]
#_00E5B3: STA.w VMDATA

#_00E5B6: XBA
#_00E5B7: ORA.b [$00]
#_00E5B9: AND.w #$00FF
#_00E5BC: STA.b $BF,X

#_00E5BE: INC.b $00
#_00E5C0: INC.b $00

#_00E5C2: DEX
#_00E5C3: DEX

#_00E5C4: LDA.b [$00]
#_00E5C6: STA.w VMDATA

#_00E5C9: XBA
#_00E5CA: ORA.b [$00]
#_00E5CC: AND.w #$00FF
#_00E5CF: STA.b $BF,X

#_00E5D1: INC.b $00
#_00E5D3: INC.b $00

#_00E5D5: DEX
#_00E5D6: DEX
#_00E5D7: BPL .next_planes_a

;---------------------------------------------------------------------------------------------------

#_00E5D9: LDX.b #$0E

.next_planes_b
#_00E5DB: LDA.b [$00]
#_00E5DD: AND.w #$00FF
#_00E5E0: STA.b $BD

#_00E5E2: ORA.b $BF,X
#_00E5E4: XBA
#_00E5E5: ORA.b $BD
#_00E5E7: STA.w VMDATA
#_00E5EA: INC.b $00

#_00E5EC: DEX
#_00E5ED: DEX

#_00E5EE: LDA.b [$00]
#_00E5F0: AND.w #$00FF
#_00E5F3: STA.b $BD

#_00E5F5: ORA.b $BF,X
#_00E5F7: XBA
#_00E5F8: ORA.b $BD
#_00E5FA: STA.w VMDATA

#_00E5FD: INC.b $00

#_00E5FF: DEX
#_00E600: DEX
#_00E601: BPL .next_planes_b

#_00E603: DEY
#_00E604: BPL .next_tile

#_00E606: SEP #$20

#_00E608: RTS

;===================================================================================================

LoadBackgroundGraphics:
#_00E609: LDA.b #$7F4000>>16
#_00E60B: LDX.b #$7F4000>>8

.arbitrary
#_00E60D: STZ.b $00
#_00E60F: STX.b $01
#_00E611: STA.b $02

#_00E613: JSR Decompress_background_arbitrary

#_00E616: REP #$20

#_00E618: LDY.b #$3F

#_00E61A: LDX.w $0AA1
#_00E61D: CPX.b #$20
#_00E61F: BCC .do_low

#_00E621: LDX.b $0F
#_00E623: CPX.b #$07
#_00E625: BEQ Do3To4High

#_00E627: CPX.b #$02
#_00E629: BEQ Do3To4High

#_00E62B: CPX.b #$04
#_00E62D: BEQ Do3To4High

#_00E62F: CPX.b #$03
#_00E631: BNE Do3To4Low

.nevermind_do_high
#_00E633: JMP.w Do3To4High

.do_low
#_00E636: LDX.b $0F
#_00E638: CPX.b #$04
#_00E63A: BCS .nevermind_do_high

;===================================================================================================

Do3To4Low:

.next_super
#_00E63C: LDA.b [$00]
#_00E63E: STA.w VMDATA

#_00E641: INC.b $00
#_00E643: INC.b $00

#_00E645: LDA.b [$00]
#_00E647: STA.w VMDATA

#_00E64A: INC.b $00
#_00E64C: INC.b $00

#_00E64E: LDA.b [$00]
#_00E650: STA.w VMDATA

#_00E653: INC.b $00
#_00E655: INC.b $00

#_00E657: LDA.b [$00]
#_00E659: STA.w VMDATA

#_00E65C: INC.b $00
#_00E65E: INC.b $00

#_00E660: LDA.b [$00]
#_00E662: STA.w VMDATA

#_00E665: INC.b $00
#_00E667: INC.b $00

#_00E669: LDA.b [$00]
#_00E66B: STA.w VMDATA

#_00E66E: INC.b $00
#_00E670: INC.b $00

#_00E672: LDA.b [$00]
#_00E674: STA.w VMDATA

#_00E677: INC.b $00
#_00E679: INC.b $00

#_00E67B: LDA.b [$00]
#_00E67D: STA.w VMDATA

#_00E680: INC.b $00
#_00E682: INC.b $00

;---------------------------------------------------------------------------------------------------

#_00E684: LDX.b #$01

.next
#_00E686: LDA.b [$00]
#_00E688: AND.w #$00FF
#_00E68B: STA.w VMDATA

#_00E68E: INC.b $00

#_00E690: LDA.b [$00]
#_00E692: AND.w #$00FF
#_00E695: STA.w VMDATA

#_00E698: INC.b $00

#_00E69A: LDA.b [$00]
#_00E69C: AND.w #$00FF
#_00E69F: STA.w VMDATA

#_00E6A2: INC.b $00

#_00E6A4: LDA.b [$00]
#_00E6A6: AND.w #$00FF
#_00E6A9: STA.w VMDATA

#_00E6AC: INC.b $00

#_00E6AE: DEX
#_00E6AF: BPL .next

;---------------------------------------------------------------------------------------------------

#_00E6B1: DEY
#_00E6B2: BPL .next_super

#_00E6B4: SEP #$20

#_00E6B6: RTS

;===================================================================================================

LoadCommonSprites:
#_00E6B7: LDY.w $0AA4

#_00E6BA: LDA.w GFXSheetPointers_sprite_bank,Y
#_00E6BD: STA.b $02

#_00E6BF: LDA.w GFXSheetPointers_sprite_high,Y
#_00E6C2: STA.b $01

#_00E6C4: LDA.w GFXSheetPointers_sprite_low,Y
#_00E6C7: STA.b $00

#_00E6C9: REP #$20

#_00E6CB: LDY.b #$40

;---------------------------------------------------------------------------------------------------

.next_tile
#_00E6CD: LDX.b #$0E

.next_planes_a
#_00E6CF: LDA.b [$00]
#_00E6D1: STA.w VMDATA

#_00E6D4: XBA
#_00E6D5: ORA.b [$00]
#_00E6D7: AND.w #$00FF
#_00E6DA: STA.b $BF,X

#_00E6DC: INC.b $00
#_00E6DE: INC.b $00

#_00E6E0: DEX
#_00E6E1: DEX

#_00E6E2: LDA.b [$00]
#_00E6E4: STA.w VMDATA

#_00E6E7: XBA
#_00E6E8: ORA.b [$00]
#_00E6EA: AND.w #$00FF
#_00E6ED: STA.b $BF,X

#_00E6EF: INC.b $00
#_00E6F1: INC.b $00

#_00E6F3: DEX
#_00E6F4: DEX
#_00E6F5: BPL .next_planes_a

;---------------------------------------------------------------------------------------------------

#_00E6F7: LDX.b #$0E

.next_planes_b
#_00E6F9: LDA.b [$00]
#_00E6FB: AND.w #$00FF
#_00E6FE: STA.b $BD

#_00E700: ORA.b $BF,X
#_00E702: XBA
#_00E703: ORA.b $BD
#_00E705: STA.w VMDATA

#_00E708: INC.b $00

#_00E70A: DEX
#_00E70B: DEX

#_00E70C: LDA.b [$00]
#_00E70E: AND.w #$00FF
#_00E711: STA.b $BD

#_00E713: ORA.b $BF,X
#_00E715: XBA
#_00E716: ORA.b $BD
#_00E718: STA.w VMDATA

#_00E71B: INC.b $00

#_00E71D: DEX
#_00E71E: DEX
#_00E71F: BPL .next_planes_b

#_00E721: DEY
#_00E722: BNE .next_tile

;---------------------------------------------------------------------------------------------------

#_00E724: SEP #$20

#_00E726: LDA.b $10
#_00E728: CMP.b #$01
#_00E72A: BEQ .in_file_select

#_00E72C: LDY.b #$06

#_00E72E: LDA.w GFXSheetPointers_sprite_bank,Y
#_00E731: STA.b $02

#_00E733: LDA.w GFXSheetPointers_sprite_high,Y
#_00E736: STA.b $01

#_00E738: LDA.w GFXSheetPointers_sprite_low,Y
#_00E73B: STA.b $00

#_00E73D: REP #$20

#_00E73F: LDY.b #$7F

#_00E741: JMP.w Do3To4Low

;---------------------------------------------------------------------------------------------------

.in_file_select
#_00E744: STZ.b $0F

#_00E746: LDY.b #$5E
#_00E748: STY.b $06

#_00E74A: LDA.b #$7F
#_00E74C: STA.b $02

#_00E74E: LDX.b #$40

#_00E750: JSR LoadSpriteGraphics

#_00E753: LDY.b #$5F
#_00E755: STY.b $06

#_00E757: LDX.b #$40

#_00E759: JMP.w LoadSpriteGraphics

;===================================================================================================

Decompress_sprite_high:
#_00E75C: STZ.b $00

#_00E75E: LDA.b #$7F4600>>8
#_00E760: STA.b $01

#_00E762: LDA.b #$7F4600>>16
#_00E764: BRA .sprite_set_bank

;===================================================================================================

#Decompress_sprite_low:
#_00E766: STZ.b $00

#_00E768: LDA.b #$40
#_00E76A: STA.b $01

#_00E76C: LDA.b #$7F

;---------------------------------------------------------------------------------------------------

.sprite_set_bank
#_00E76E: STA.b $02
#_00E770: STA.b $05

;===================================================================================================

Decompress_sprite_arbitrary:
#_00E772: LDA.w GFXSheetPointers_sprite_bank,Y
#_00E775: STA.b $CA

#_00E777: LDA.w GFXSheetPointers_sprite_high,Y
#_00E77A: STA.b $C9

#_00E77C: LDA.w GFXSheetPointers_sprite_low,Y
#_00E77F: STA.b $C8

#_00E781: BRA Decompress

;===================================================================================================

Decompress_background_low:
#_00E783: STZ.b $00

#_00E785: LDA.b #$7F4000>>8
#_00E787: STA.b $01

#_00E789: LDA.b #$7F4000>>16

;===================================================================================================

Decompress_background_arbitrary_bank:
#_00E78B: STA.b $02
#_00E78D: STA.b $05

;===================================================================================================

Decompress_background_arbitrary:
#_00E78F: LDA.w GFXSheetPointers_background_bank,Y
#_00E792: STA.b $CA

#_00E794: LDA.w GFXSheetPointers_background_high,Y
#_00E797: STA.b $C9

#_00E799: LDA.w GFXSheetPointers_background_low,Y
#_00E79C: STA.b $C8

;===================================================================================================

Decompress:
#_00E79E: REP #$10

#_00E7A0: LDY.w #$0000

.next_command
#_00E7A3: JSR Decompression_GetNextByte

#_00E7A6: CMP.b #$FF ; stop decompression
#_00E7A8: BNE .continue

#_00E7AA: SEP #$10

#_00E7AC: RTS

;---------------------------------------------------------------------------------------------------

.continue
#_00E7AD: STA.b $CD

#_00E7AF: AND.b #$E0
#_00E7B1: CMP.b #$E0
#_00E7B3: BEQ .expanded

#_00E7B5: PHA

#_00E7B6: LDA.b $CD

#_00E7B8: REP #$20

#_00E7BA: AND.w #$001F

#_00E7BD: BRA .normal

;---------------------------------------------------------------------------------------------------

.expanded
#_00E7BF: LDA.b $CD
#_00E7C1: ASL A
#_00E7C2: ASL A
#_00E7C3: ASL A
#_00E7C4: AND.b #$E0
#_00E7C6: PHA

#_00E7C7: LDA.b $CD
#_00E7C9: AND.b #$03
#_00E7CB: XBA

#_00E7CC: JSR Decompression_GetNextByte

#_00E7CF: REP #$20

;---------------------------------------------------------------------------------------------------

.normal
#_00E7D1: INC A
#_00E7D2: STA.b $CB

#_00E7D4: SEP #$20

#_00E7D6: PLA

#_00E7D7: BEQ .nonrepeating
#_00E7D9: BMI .copy_past

#_00E7DB: ASL A
#_00E7DC: BPL .repeating_byte

#_00E7DE: ASL A
#_00E7DF: BPL .repeating_word

;---------------------------------------------------------------------------------------------------

.incremental
#_00E7E1: JSR Decompression_GetNextByte

#_00E7E4: LDX.b $CB

.next_incremental
#_00E7E6: STA.b [$00],Y

#_00E7E8: INC A

#_00E7E9: INY

#_00E7EA: DEX
#_00E7EB: BNE .next_incremental

#_00E7ED: BRA .next_command

;---------------------------------------------------------------------------------------------------

.nonrepeating
#_00E7EF: JSR Decompression_GetNextByte
#_00E7F2: STA.b [$00],Y

#_00E7F4: INY

#_00E7F5: LDX.b $CB
#_00E7F7: DEX
#_00E7F8: STX.b $CB

#_00E7FA: BNE .nonrepeating

#_00E7FC: BRA .next_command

;---------------------------------------------------------------------------------------------------

.repeating_byte
#_00E7FE: JSR Decompression_GetNextByte

#_00E801: LDX.b $CB

.next_repeating
#_00E803: STA.b [$00],Y

#_00E805: INY

#_00E806: DEX

#_00E807: BNE .next_repeating

#_00E809: BRA .next_command

;---------------------------------------------------------------------------------------------------

.repeating_word
#_00E80B: JSR Decompression_GetNextByte
#_00E80E: XBA
#_00E80F: JSR Decompression_GetNextByte

#_00E812: LDX.b $CB

.next_word
#_00E814: XBA
#_00E815: STA.b [$00],Y

#_00E817: INY

#_00E818: DEX
#_00E819: BEQ .done_words

#_00E81B: XBA
#_00E81C: STA.b [$00],Y

#_00E81E: INY

#_00E81F: DEX

#_00E820: BNE .next_word

.done_words
#_00E822: JMP.w .next_command

;---------------------------------------------------------------------------------------------------

.copy_past
#_00E825: JSR Decompression_GetNextByte
#_00E828: XBA

#_00E829: JSR Decompression_GetNextByte
#_00E82C: XBA

#_00E82D: TAX

.next_copy
#_00E82E: PHY
#_00E82F: TXY

#_00E830: LDA.b [$00],Y

#_00E832: TYX
#_00E833: PLY

#_00E834: STA.b [$00],Y

#_00E836: INY
#_00E837: INX

#_00E838: REP #$20

#_00E83A: DEC.b $CB

#_00E83C: SEP #$20

#_00E83E: BNE .next_copy

#_00E840: JMP.w .next_command

;===================================================================================================

Decompression_GetNextByte:
#_00E843: LDA.b [$C8]

#_00E845: LDX.b $C8
#_00E847: INX
#_00E848: BNE .no_bank_wrap

#_00E84A: LDX.w #$8000
#_00E84D: INC.b $CA

.no_bank_wrap
#_00E84F: STX.b $C8

#_00E851: RTS

;===================================================================================================
; FREE ROM: 0x2E
;===================================================================================================
NULL_00E852:
#_00E852: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00E85A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00E862: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00E86A: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00E872: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00E87A: db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

PaletteFilterColorAdd:
#_00E880: dw $FFFF, $0001
#_00E884: dw $FFE0, $0020
#_00E888: dw $FC00, $0400

PaletteFilterColorMasks:
#_00E88C: dw $FFFF, $FFFF, $FFFE, $FFFF
#_00E894: dw $7FFF, $7FFF, $7FDF, $FBFF
#_00E89C: dw $7F7F, $7F7F, $7DF7, $EFBF
#_00E8A4: dw $7BDF, $7BDF, $77BB, $DDEF
#_00E8AC: dw $7777, $7777, $6EDD, $BB77
#_00E8B4: dw $6DB7, $6DB7, $5B6D, $B6DB
#_00E8BC: dw $5B5B, $5B5B, $56B6, $AD6B
#_00E8C4: dw $5555, $AD6B, $5555, $AAAB
#_00E8CC: dw $5555, $5555, $2A55, $5555
#_00E8D4: dw $2A55, $2A55, $294A, $5295
#_00E8DC: dw $2525, $2525, $2492, $4925
#_00E8E4: dw $1249, $1249, $1122, $4489
#_00E8EC: dw $1111, $1111, $0844, $2211
#_00E8F4: dw $0421, $0421, $0208, $1041
#_00E8FC: dw $0101, $0101, $0020, $0401
#_00E904: dw $0001, $0001, $0000, $0001

;===================================================================================================

PaletteFilter:
#_00E90C: SEP #$20

#_00E90E: LDA.b $1A
#_00E910: LSR A
#_00E911: BCC ApplyPaletteFilter

#_00E913: RTL

;===================================================================================================

ApplyPaletteFilter:
#_00E914: REP #$30

#_00E916: LDX.w #PaletteFilterColorAdd+12

#_00E919: LDA.l $7EC007
#_00E91D: CMP.w #$0010
#_00E920: BCC .first_half

#_00E922: INX
#_00E923: INX

.first_half
#_00E924: STX.b $B7

#_00E926: AND.w #$000F
#_00E929: ASL A
#_00E92A: TAX

#_00E92B: LDA.w DungeonMask,X
#_00E92E: STA.b $0C

;---------------------------------------------------------------------------------------------------

#_00E930: PHB
#_00E931: PHK
#_00E932: PLB

#_00E933: LDA.l $7EC009
#_00E937: TAX

#_00E938: LDA.w PaletteFilterColorAdd+0,X
#_00E93B: STA.b $06

#_00E93D: LDA.w PaletteFilterColorAdd+4,X
#_00E940: STA.b $08

#_00E942: LDA.w PaletteFilterColorAdd+8,X
#_00E945: STA.b $0A

#_00E947: LDX.w #$0040
#_00E94A: JSR PaletteFilter_FilterColors

#_00E94D: LDA.l $7EC500
#_00E951: STA.b $04

;---------------------------------------------------------------------------------------------------

#_00E953: LDA.l $7EC300
#_00E957: AND.w #$001F
#_00E95A: ASL A
#_00E95B: ASL A
#_00E95C: TAY

#_00E95D: LDA.b ($B7),Y
#_00E95F: AND.b $0C
#_00E961: BNE .no_red

#_00E963: LDA.b $04
#_00E965: ADC.b $06
#_00E967: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_red
#_00E969: LDA.l $7EC300
#_00E96D: AND.w #$03E0
#_00E970: LSR A
#_00E971: LSR A
#_00E972: LSR A
#_00E973: TAY

#_00E974: LDA.b ($B7),Y
#_00E976: AND.b $0C
#_00E978: BNE .no_green

#_00E97A: LDA.b $04
#_00E97C: ADC.b $08
#_00E97E: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_green
#_00E980: LDA.l $7EC301
#_00E984: AND.w #$007C
#_00E987: TAY

#_00E988: LDA.b ($B7),Y
#_00E98A: AND.b $0C
#_00E98C: BNE .no_blue

#_00E98E: LDA.b $04
#_00E990: CLC
#_00E991: ADC.b $0A
#_00E993: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_blue
#_00E995: LDA.b $04
#_00E997: STA.l $7EC500

#_00E99B: PLB

#_00E99C: LDA.l $7EC009
#_00E9A0: BNE .lightening

#_00E9A2: LDA.l $7EC007
#_00E9A6: INC A
#_00E9A7: STA.l $7EC007

#_00E9AB: CMP.l $7EC00B
#_00E9AF: BNE .continue_filtering

.swap
#_00E9B1: LDA.l $7EC009
#_00E9B5: EOR.w #$0002
#_00E9B8: STA.l $7EC009

#_00E9BC: LDA.w #$0000
#_00E9BF: STA.l $7EC007

#_00E9C3: SEP #$20

#_00E9C5: INC.b $B0

.continue_filtering
#_00E9C7: SEP #$30

#_00E9C9: INC.b $15

#_00E9CB: RTL

;---------------------------------------------------------------------------------------------------

.lightening
#_00E9CC: LDA.l $7EC007
#_00E9D0: CMP.l $7EC00B
#_00E9D4: BEQ .swap

#_00E9D6: LDA.l $7EC007
#_00E9DA: DEC A
#_00E9DB: STA.l $7EC007

#_00E9DF: SEP #$30

#_00E9E1: INC.b $15

#_00E9E3: RTL

;===================================================================================================

PaletteFilter_FilterColors:
.next_color
#_00E9E4: LDA.l $7EC500,X
#_00E9E8: STA.b $04

#_00E9EA: LDA.l $7EC300,X
#_00E9EE: BEQ .color_is_black

;---------------------------------------------------------------------------------------------------

#_00E9F0: AND.w #$001F
#_00E9F3: ASL A
#_00E9F4: ASL A
#_00E9F5: TAY

#_00E9F6: LDA.b ($B7),Y
#_00E9F8: AND.b $0C
#_00E9FA: BNE .no_red

#_00E9FC: LDA.b $04
#_00E9FE: ADC.b $06
#_00EA00: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_red
#_00EA02: LDA.l $7EC300,X
#_00EA06: AND.w #$03E0
#_00EA09: LSR A
#_00EA0A: LSR A
#_00EA0B: LSR A
#_00EA0C: TAY

#_00EA0D: LDA.b ($B7),Y
#_00EA0F: AND.b $0C
#_00EA11: BNE .no_green

#_00EA13: LDA.b $04
#_00EA15: ADC.b $08
#_00EA17: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_green
#_00EA19: LDA.l $7EC301,X
#_00EA1D: AND.w #$007C
#_00EA20: TAY

#_00EA21: LDA.b ($B7),Y
#_00EA23: AND.b $0C
#_00EA25: BNE .no_blue

#_00EA27: LDA.b $04
#_00EA29: CLC
#_00EA2A: ADC.b $0A
#_00EA2C: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_blue
#_00EA2E: LDA.b $04
#_00EA30: STA.l $7EC500,X

.color_is_black
#_00EA34: INX
#_00EA35: INX
#_00EA36: CPX.w #$01B0
#_00EA39: BCC .next_color

#_00EA3B: BNE .dont_skip_palette_5

#_00EA3D: TXA
#_00EA3E: CLC
#_00EA3F: ADC.w #$0010
#_00EA42: TAX

;---------------------------------------------------------------------------------------------------

.dont_skip_palette_5
#_00EA43: CPX.w #$01E0
#_00EA46: BNE .next_color

#_00EA48: RTS

;===================================================================================================

UNREACHABLE_00EA49:
#_00EA49: REP #$30

#_00EA4B: LDX.w #PaletteFilterColorAdd+12

#_00EA4E: LDA.l $7EC007
#_00EA52: CMP.w #$0010
#_00EA55: BCC .first_half

#_00EA57: INX
#_00EA58: INX

.first_half
#_00EA59: STX.b $B7

#_00EA5B: AND.w #$000F
#_00EA5E: ASL A
#_00EA5F: TAX

#_00EA60: LDA.w DungeonMask,X
#_00EA63: STA.b $0C

#_00EA65: PHB
#_00EA66: PHK
#_00EA67: PLB

#_00EA68: LDA.l $7EC009
#_00EA6C: TAX

#_00EA6D: LDA.w PaletteFilterColorAdd+0,X
#_00EA70: STA.b $06

#_00EA72: LDA.w PaletteFilterColorAdd+4,X
#_00EA75: STA.b $08

#_00EA77: LDA.w PaletteFilterColorAdd+8,X
#_00EA7A: STA.b $0A

#_00EA7C: LDX.w #$0040
#_00EA7F: LDA.w #$0200
#_00EA82: JSR FilterColorsEndpoint

#_00EA85: PLB

;---------------------------------------------------------------------------------------------------

#_00EA86: LDA.l $7EC009
#_00EA8A: BNE .lightening

#_00EA8C: LDA.l $7EC007
#_00EA90: INC A
#_00EA91: STA.l $7EC007

#_00EA95: CMP.l $7EC00B
#_00EA99: BNE .continue_filtering

;---------------------------------------------------------------------------------------------------

.swap
#_00EA9B: LDA.l $7EC009
#_00EA9F: EOR.w #$0002
#_00EAA2: STA.l $7EC009

#_00EAA6: LDA.w #$0000
#_00EAA9: STA.l $7EC007

#_00EAAD: SEP #$20

#_00EAAF: INC.b $B0

;---------------------------------------------------------------------------------------------------

.continue_filtering
#_00EAB1: SEP #$30

#_00EAB3: INC.b $15

#_00EAB5: RTL

;---------------------------------------------------------------------------------------------------

.lightening
#_00EAB6: LDA.l $7EC007
#_00EABA: CMP.l $7EC00B
#_00EABE: BEQ .swap

#_00EAC0: LDA.l $7EC007
#_00EAC4: DEC A
#_00EAC5: STA.l $7EC007

#_00EAC9: SEP #$30

#_00EACB: INC.b $15

#_00EACD: RTL

;===================================================================================================

FilterColorsEndpoint:
#_00EACE: STA.b $0E

.next_color
#_00EAD0: LDA.l $7EC500,X
#_00EAD4: STA.b $04

#_00EAD6: LDA.l $7EC300,X
#_00EADA: BEQ .skip_color

#_00EADC: AND.w #$001F
#_00EADF: ASL A
#_00EAE0: ASL A
#_00EAE1: TAY

#_00EAE2: LDA.b ($B7),Y
#_00EAE4: AND.b $0C
#_00EAE6: BNE .no_red

#_00EAE8: LDA.b $04
#_00EAEA: CLC
#_00EAEB: ADC.b $06
#_00EAED: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_red
#_00EAEF: LDA.l $7EC300,X
#_00EAF3: AND.w #$03E0
#_00EAF6: LSR A
#_00EAF7: LSR A
#_00EAF8: LSR A
#_00EAF9: TAY

#_00EAFA: LDA.b ($B7),Y
#_00EAFC: AND.b $0C
#_00EAFE: BNE .no_green

#_00EB00: LDA.b $04
#_00EB02: CLC
#_00EB03: ADC.b $08
#_00EB05: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_green
#_00EB07: LDA.l $7EC301,X
#_00EB0B: AND.w #$007C
#_00EB0E: TAY

#_00EB0F: LDA.b ($B7),Y
#_00EB11: AND.b $0C
#_00EB13: BNE .no_blue

#_00EB15: LDA.b $04
#_00EB17: CLC
#_00EB18: ADC.b $0A
#_00EB1A: STA.b $04

;---------------------------------------------------------------------------------------------------

.no_blue
#_00EB1C: LDA.b $04
#_00EB1E: STA.l $7EC500,X

;---------------------------------------------------------------------------------------------------

.skip_color
#_00EB22: INX
#_00EB23: INX
#_00EB24: CPX.b $0E
#_00EB26: BNE .next_color

#_00EB28: RTS

;===================================================================================================

ResetHUDPalettes4and5:
#_00EB29: REP #$20

#_00EB2B: LDA.w #$0000 ; RGB: #000000

#_00EB2E: STA.l $7EC520
#_00EB32: STA.l $7EC522
#_00EB36: STA.l $7EC524
#_00EB3A: STA.l $7EC526
#_00EB3E: STA.l $7EC528
#_00EB42: STA.l $7EC52A
#_00EB46: STA.l $7EC52C
#_00EB4A: STA.l $7EC52E

#_00EB4E: STA.l $7EC007 ; reset mosaic control

#_00EB52: LDA.w #$0002 ; lightening screen
#_00EB55: STA.l $7EC009

#_00EB59: SEP #$20

#_00EB5B: INC.b $15

#_00EB5D: RTL

;===================================================================================================

PaletteFilterHistory:
#_00EB5E: REP #$30

#_00EB60: LDX.w #PaletteFilterColorAdd+12

#_00EB63: LDA.l $7EC007
#_00EB67: CMP.w #$0010
#_00EB6A: BCC .first_half

#_00EB6C: INX
#_00EB6D: INX

.first_half
#_00EB6E: STX.b $B7

#_00EB70: AND.w #$000F
#_00EB73: ASL A
#_00EB74: TAX

#_00EB75: LDA.l DungeonMask,X
#_00EB79: STA.b $0C

#_00EB7B: PHB
#_00EB7C: PHK
#_00EB7D: PLB

#_00EB7E: LDA.l $7EC009
#_00EB82: TAX

#_00EB83: LDA.w PaletteFilterColorAdd+0,X
#_00EB86: STA.b $06

#_00EB88: LDA.w PaletteFilterColorAdd+4,X
#_00EB8B: STA.b $08

#_00EB8D: LDA.w PaletteFilterColorAdd+8,X
#_00EB90: STA.b $0A

#_00EB92: LDX.w #$0020
#_00EB95: LDA.w #$0030

;===================================================================================================

#PaletteFilterHistory_do_filtering:
#_00EB98: JSR FilterColorsEndpoint

#_00EB9B: PLB

#_00EB9C: LDA.l $7EC007
#_00EBA0: INC A
#_00EBA1: STA.l $7EC007

#_00EBA5: CMP.w #$001F
#_00EBA8: BNE .still_filtering

#_00EBAA: LDA.w #$0000
#_00EBAD: STA.l $7EC007

#_00EBB1: LDA.l $7EC009
#_00EBB5: EOR.w #$0002
#_00EBB8: STA.l $7EC009
#_00EBBC: BEQ .still_filtering

#_00EBBE: INC.b $27

.still_filtering
#_00EBC0: SEP #$30

#_00EBC2: INC.b $15

#_00EBC4: RTL

;===================================================================================================

PaletteFilter_WishPonds:
#_00EBC5: LDA.b #$02
#_00EBC7: STA.b $1D

#_00EBC9: LDA.b #$30
#_00EBCB: STA.b $9A

#_00EBCD: BRA .start

;===================================================================================================

#PaletteFilter_Crystal:
#_00EBCF: LDA.b #$01
#_00EBD1: STA.b $1D

;===================================================================================================

#PaletteFilter_TheEndSprite:
.start
#_00EBD3: REP #$20

#_00EBD5: LDX.b #$0E
#_00EBD7: LDA.w #$0000 ; RGB: #000000

.next_black
#_00EBDA: STA.l $7EC6A0,X

#_00EBDE: DEX
#_00EBDF: DEX
#_00EBE0: BPL .next_black

;---------------------------------------------------------------------------------------------------

#_00EBE2: STA.l $7EC007

#_00EBE6: LDA.w #$0002
#_00EBE9: STA.l $7EC009

#_00EBED: SEP #$20

#_00EBEF: INC.b $15

#_00EBF1: RTL

;===================================================================================================

PaletteFilter_RestoreSP5F:
#_00EBF2: REP #$20

#_00EBF4: LDX.b #$0E

.next_color
#_00EBF6: LDA.l $7EC4A0,X
#_00EBFA: STA.l $7EC6A0,X

#_00EBFE: DEX
#_00EBFF: DEX
#_00EC00: BPL .next_color

#_00EC02: SEP #$20

#_00EC04: STZ.b $1D

#_00EC06: LDA.b #$20
#_00EC08: STA.b $9A

#_00EC0A: INC.b $15

;---------------------------------------------------------------------------------------------------

#EXIT_00EC0C:
#_00EC0C: RTL

;===================================================================================================

PaletteFilter_SP5F:
#_00EC0D: JSL .filter

#_00EC11: LDA.l $7EC007
#_00EC15: BEQ EXIT_00EC0C

;---------------------------------------------------------------------------------------------------

.filter
#_00EC17: REP #$30

#_00EC19: LDX.w #PaletteFilterColorAdd+12

#_00EC1C: LDA.l $7EC007
#_00EC20: CMP.w #$0010
#_00EC23: BCC .first_half

#_00EC25: INX
#_00EC26: INX

.first_half
#_00EC27: STX.b $B7

#_00EC29: AND.w #$000F
#_00EC2C: ASL A
#_00EC2D: TAX

#_00EC2E: LDA.l DungeonMask,X
#_00EC32: STA.b $0C

#_00EC34: PHB
#_00EC35: PHK
#_00EC36: PLB

#_00EC37: LDA.l $7EC009
#_00EC3B: TAX

#_00EC3C: LDA.w PaletteFilterColorAdd+0,X
#_00EC3F: STA.b $06

#_00EC41: LDA.w PaletteFilterColorAdd+4,X
#_00EC44: STA.b $08

#_00EC46: LDA.w PaletteFilterColorAdd+8,X
#_00EC49: STA.b $0A

#_00EC4B: LDX.w #$01A0
#_00EC4E: LDA.w #$01B0
#_00EC51: JMP.w PaletteFilterHistory_do_filtering

;===================================================================================================

PaletteFilter_KholdstareShell_init:
#_00EC54: REP #$20

#_00EC56: LDX.b #$0E

.next_color
#_00EC58: LDA.l $7EC380,X
#_00EC5C: STA.l $7EC580,X

#_00EC60: DEX
#_00EC61: DEX
#_00EC62: BPL .next_color

;---------------------------------------------------------------------------------------------------

#_00EC64: LDA.w #$0000
#_00EC67: STA.l $7EC007
#_00EC6B: STA.l $7EC009

#_00EC6F: SEP #$20

#_00EC71: INC.b $15

#_00EC73: INC.b $B0

#_00EC75: RTL

;===================================================================================================

PaletteFilter_KholdstareShell_disable_subscreen:
#_00EC76: STZ.b $1D

#_00EC78: RTL

;===================================================================================================

PaletteFilter_KholdstareShell:
#_00EC79: LDA.b $B0
#_00EC7B: BEQ PaletteFilter_KholdstareShell_init

#_00EC7D: JSL .filter

#_00EC81: LDA.l $7EC007
#_00EC85: BEQ PaletteFilter_KholdstareShell_disable_subscreen

;---------------------------------------------------------------------------------------------------

.filter
#_00EC87: REP #$30

#_00EC89: LDX.w #PaletteFilterColorAdd+12

#_00EC8C: LDA.l $7EC007
#_00EC90: CMP.w #$0010
#_00EC93: BCC .first_half

#_00EC95: INX
#_00EC96: INX

.first_half
#_00EC97: STX.b $B7

#_00EC99: AND.w #$000F
#_00EC9C: ASL A
#_00EC9D: TAX

#_00EC9E: LDA.l DungeonMask,X
#_00ECA2: STA.b $0C

#_00ECA4: PHB
#_00ECA5: PHK
#_00ECA6: PLB

#_00ECA7: LDA.l $7EC009
#_00ECAB: TAX

#_00ECAC: LDA.w PaletteFilterColorAdd+0,X
#_00ECAF: STA.b $06

#_00ECB1: LDA.w PaletteFilterColorAdd+4,X
#_00ECB4: STA.b $08

#_00ECB6: LDA.w PaletteFilterColorAdd+8,X
#_00ECB9: STA.b $0A

#_00ECBB: LDX.w #$0080
#_00ECBE: LDA.w #$0090
#_00ECC1: JMP.w PaletteFilterHistory_do_filtering

;===================================================================================================

pool AgahnimWarpShadowFilter

.palette_offset
#_00ECC4: dw $0160
#_00ECC6: dw $0180
#_00ECC8: dw $01A0

pool off

;---------------------------------------------------------------------------------------------------

AgahnimWarpShadowFilter:
#_00ECCA: PHX

#_00ECCB: TXA
#_00ECCC: ASL A
#_00ECCD: TAX

#_00ECCE: REP #$20

#_00ECD0: LDA.l $7EC019,X
#_00ECD4: STA.l $7EC007

#_00ECD8: LDA.l $7EC01F,X
#_00ECDC: STA.l $7EC009

#_00ECE0: LDA.l .palette_offset,X
#_00ECE4: STA.b $00

#_00ECE6: CLC
#_00ECE7: ADC.w #$0010
#_00ECEA: STA.b $02

#_00ECEC: REP #$10

#_00ECEE: JSR AgahnimWarpShadowFilter_filter_one

#_00ECF1: LDA.l $7EC007
#_00ECF5: BEQ .done

#_00ECF7: JSR AgahnimWarpShadowFilter_filter_one

;---------------------------------------------------------------------------------------------------

.done
#_00ECFA: SEP #$30

#_00ECFC: PLX
#_00ECFD: PHX

#_00ECFE: TXA
#_00ECFF: ASL A
#_00ED00: TAX

#_00ED01: REP #$20

#_00ED03: LDA.l $7EC007
#_00ED07: STA.l $7EC019,X

#_00ED0B: LDA.l $7EC009
#_00ED0F: STA.l $7EC01F,X

#_00ED13: SEP #$20

#_00ED15: PLX

#_00ED16: INC.b $15

#_00ED18: RTL

;===================================================================================================

AgahnimWarpShadowFilter_filter_one:
#_00ED19: LDY.w #PaletteFilterColorAdd+12

#_00ED1C: LDA.l $7EC007
#_00ED20: CMP.w #$0010
#_00ED23: BCC .first_half

#_00ED25: INY
#_00ED26: INY

.first_half
#_00ED27: STY.b $B7

#_00ED29: AND.w #$000F
#_00ED2C: ASL A
#_00ED2D: TAX

#_00ED2E: LDA.l DungeonMask,X
#_00ED32: STA.b $0C

;---------------------------------------------------------------------------------------------------

#_00ED34: PHB
#_00ED35: PHK
#_00ED36: PLB

#_00ED37: LDA.l $7EC009
#_00ED3B: TAX

#_00ED3C: LDA.w PaletteFilterColorAdd+0,X
#_00ED3F: STA.b $06

#_00ED41: LDA.w PaletteFilterColorAdd+4,X
#_00ED44: STA.b $08

#_00ED46: LDA.w PaletteFilterColorAdd+8,X
#_00ED49: STA.b $0A

;---------------------------------------------------------------------------------------------------

#_00ED4B: LDX.b $00
#_00ED4D: PHX

#_00ED4E: LDA.b $02
#_00ED50: PHA

#_00ED51: JSR FilterColorsEndpoint

#_00ED54: PLA
#_00ED55: STA.b $02

#_00ED57: PLX
#_00ED58: STX.b $00

#_00ED5A: PLB

#_00ED5B: LDA.l $7EC007
#_00ED5F: INC A
#_00ED60: STA.l $7EC007

#_00ED64: CMP.w #$001F
#_00ED67: BNE .exit

#_00ED69: LDA.w #$0000
#_00ED6C: STA.l $7EC007

#_00ED70: LDA.l $7EC009
#_00ED74: EOR.w #$0002
#_00ED77: STA.l $7EC009

.exit
#_00ED7B: RTS

;===================================================================================================

IntroLogoPaletteFadeIn:
#_00ED7C: REP #$30

#_00ED7E: LDX.w #$0100
#_00ED81: LDA.w #$01A0
#_00ED84: JSR PaletteFilter_RestoreAdditive

#_00ED87: LDX.w #$00C0
#_00ED8A: LDA.w #$0100
#_00ED8D: BRA .finish

;---------------------------------------------------------------------------------------------------

#IntroTitleCardPaletteFadeIn:
#_00ED8F: REP #$30

#_00ED91: LDX.w #$0040
#_00ED94: LDA.w #$00C0
#_00ED97: JSR PaletteFilter_RestoreAdditive

#_00ED9A: LDX.w #$0040
#_00ED9D: LDA.w #$00C0

;---------------------------------------------------------------------------------------------------

.finish
#_00EDA0: JSR PaletteFilter_RestoreAdditive

#_00EDA3: SEP #$30

#_00EDA5: LDA.l $7EC007
#_00EDA9: DEC A
#_00EDAA: STA.l $7EC007

#_00EDAE: INC.b $15

#_00EDB0: RTL

;===================================================================================================

PaletteFilter_Restore:
#_00EDB1: REP #$30

#_00EDB3: LDX.w #$00B0
#_00EDB6: LDA.w #$00C0
#_00EDB9: JSR PaletteFilter_RestoreAdditive

#_00EDBC: LDX.w #$00D0
#_00EDBF: LDA.w #$00E0
#_00EDC2: JSR PaletteFilter_RestoreSubtractive

#_00EDC5: SEP #$30

#_00EDC7: INC.b $15

#_00EDC9: RTL

;===================================================================================================

PaletteFilter_RestoreAdditive:
#_00EDCA: STA.b $0E

.next_color
#_00EDCC: LDA.l $7EC500,X
#_00EDD0: TAY

#_00EDD1: AND.w #$001F
#_00EDD4: STA.b $08

#_00EDD6: TYA
#_00EDD7: AND.w #$03E0
#_00EDDA: STA.b $0A

#_00EDDC: TYA
#_00EDDD: AND.w #$7C00
#_00EDE0: STA.b $0C

#_00EDE2: LDA.l $7EC300,X
#_00EDE6: AND.w #$001F
#_00EDE9: CMP.b $08
#_00EDEB: BEQ .red_equal

#_00EDED: TYA
#_00EDEE: CLC
#_00EDEF: ADC.w #$0001
#_00EDF2: TAY

.red_equal
#_00EDF3: LDA.l $7EC300,X
#_00EDF7: AND.w #$03E0
#_00EDFA: CMP.b $0A
#_00EDFC: BEQ .green_equal

#_00EDFE: TYA
#_00EDFF: CLC
#_00EE00: ADC.w #$0020
#_00EE03: TAY

.green_equal
#_00EE04: LDA.l $7EC300,X
#_00EE08: AND.w #$7C00
#_00EE0B: CMP.b $0C
#_00EE0D: BEQ .blue_equal

#_00EE0F: TYA
#_00EE10: CLC
#_00EE11: ADC.w #$0400
#_00EE14: TAY

.blue_equal
#_00EE15: TYA
#_00EE16: STA.l $7EC500,X

#_00EE1A: INX
#_00EE1B: INX
#_00EE1C: CPX.b $0E
#_00EE1E: BNE .next_color

#_00EE20: RTS

;===================================================================================================

PaletteFilter_RestoreSubtractive:
#_00EE21: STA.b $0E

.next_color
#_00EE23: LDA.l $7EC500,X
#_00EE27: TAY

#_00EE28: AND.w #$001F
#_00EE2B: STA.b $08

#_00EE2D: TYA
#_00EE2E: AND.w #$03E0
#_00EE31: STA.b $0A

#_00EE33: TYA
#_00EE34: AND.w #$7C00
#_00EE37: STA.b $0C

#_00EE39: LDA.l $7EC300,X
#_00EE3D: AND.w #$001F
#_00EE40: CMP.b $08
#_00EE42: BEQ .red_equal

#_00EE44: TYA
#_00EE45: SEC
#_00EE46: SBC.w #$0001
#_00EE49: TAY

.red_equal
#_00EE4A: LDA.l $7EC300,X
#_00EE4E: AND.w #$03E0
#_00EE51: CMP.b $0A
#_00EE53: BEQ .green_equal

#_00EE55: TYA
#_00EE56: SEC
#_00EE57: SBC.w #$0020
#_00EE5A: TAY

.green_equal
#_00EE5B: LDA.l $7EC300,X
#_00EE5F: AND.w #$7C00
#_00EE62: CMP.b $0C
#_00EE64: BEQ .blue_equal

#_00EE66: TYA
#_00EE67: SEC
#_00EE68: SBC.w #$0400
#_00EE6B: TAY

.blue_equal
#_00EE6C: TYA
#_00EE6D: STA.l $7EC500,X

#_00EE71: INX
#_00EE72: INX
#_00EE73: CPX.b $0E
#_00EE75: BNE .next_color

#_00EE77: RTS

;===================================================================================================

PaletteFilter_InitializeWhiteFilter:
#_00EE78: REP #$20

#_00EE7A: LDX.b #$00

#_00EE7C: LDA.w #$7FFF ; RGB: #F8F8F8

.next_white
#_00EE7F: STA.l $7EC300,X
#_00EE83: STA.l $7EC340,X
#_00EE87: STA.l $7EC380,X
#_00EE8B: STA.l $7EC3C0,X

#_00EE8F: STA.l $7EC400,X
#_00EE93: STA.l $7EC440,X
#_00EE97: STA.l $7EC480,X
#_00EE9B: STA.l $7EC4C0,X

#_00EE9F: INX
#_00EEA0: INX
#_00EEA1: CPX.b #$40
#_00EEA3: BNE .next_white

;---------------------------------------------------------------------------------------------------

#_00EEA5: LDA.l $7EC500
#_00EEA9: STA.l $7EC540

#_00EEAD: LDA.w #$0000
#_00EEB0: STA.l $7EC007

#_00EEB4: LDA.w #$0002
#_00EEB7: STA.l $7EC009

#_00EEBB: LDA.b $8A
#_00EEBD: CMP.w #$001B ; OW 1B
#_00EEC0: BNE .not_hyrule_castle

#_00EEC2: LDA.w #$0000 ; RGB: #000000
#_00EEC5: STA.l $7EC300
#_00EEC9: STA.l $7EC340
#_00EECD: STA.l $7EC500
#_00EED1: STA.l $7EC540

.not_hyrule_castle
#_00EED5: SEP #$20

#_00EED7: LDA.b #$08
#_00EED9: STA.w $06BB
#_00EEDC: STZ.w $06BA

#_00EEDF: RTL

;===================================================================================================

MirrorWarp_GoToSubmodules:
#_00EEE0: JSL AnimateMirrorWarp

;---------------------------------------------------------------------------------------------------

#EXIT_00EEE4:
#_00EEE4: SEP #$30

#_00EEE6: RTL

;---------------------------------------------------------------------------------------------------

MirrorWarp_RunAnimationSubmodules:
#_00EEE7: DEC.w $06BB
#_00EEEA: BNE MirrorWarp_GoToSubmodules

#_00EEEC: LDA.b #$02
#_00EEEE: STA.w $06BB

;===================================================================================================

PaletteFilter_BlindingWhite:
#_00EEF1: REP #$30

#_00EEF3: LDA.l $7EC009
#_00EEF7: CMP.w #$00FF
#_00EEFA: BEQ EXIT_00EEE4

#_00EEFC: CMP.w #$0002
#_00EEFF: BNE .restore_subtractive

#_00EF01: LDX.w #$0040
#_00EF04: LDA.w #$01B0
#_00EF07: JSR PaletteFilter_RestoreAdditive

#_00EF0A: LDX.w #$01C0
#_00EF0D: LDA.w #$01E0
#_00EF10: JSR PaletteFilter_RestoreAdditive

#_00EF13: BRA PaletteFilter_StartBlindingWhite

.restore_subtractive
#_00EF15: LDX.w #$0040
#_00EF18: LDA.w #$01B0
#_00EF1B: JSR PaletteFilter_RestoreSubtractive

#_00EF1E: LDX.w #$01C0
#_00EF21: LDA.w #$01E0
#_00EF24: JSR PaletteFilter_RestoreSubtractive

;===================================================================================================

PaletteFilter_StartBlindingWhite:
#_00EF27: LDA.l $7EC540
#_00EF2B: STA.l $7EC500

#_00EF2F: LDA.l $7EC009
#_00EF33: BNE .check_shorter

#_00EF35: LDA.l $7EC007
#_00EF39: INC A
#_00EF3A: STA.l $7EC007

#_00EF3E: CMP.w #$0042
#_00EF41: BNE .trigger_update

#_00EF43: LDA.w #$00FF
#_00EF46: STA.l $7EC009

#_00EF4A: SEP #$20

#_00EF4C: LDA.b #$20
#_00EF4E: STA.w $06BB

.trigger_update
#_00EF51: SEP #$30

#_00EF53: INC.b $15

#_00EF55: RTL

;---------------------------------------------------------------------------------------------------

.check_shorter
#_00EF56: LDA.l $7EC007
#_00EF5A: INC A
#_00EF5B: STA.l $7EC007

#_00EF5F: CMP.w #$001F
#_00EF62: BNE .trigger_update

#_00EF64: LDA.l $7EC009
#_00EF68: EOR.w #$0002
#_00EF6B: STA.l $7EC009

#_00EF6F: SEP #$30

#_00EF71: LDA.b $10
#_00EF73: CMP.b #$15
#_00EF75: BNE .exit

#_00EF77: STZ.w HDMAEN
#_00EF7A: STZ.b $9B

#_00EF7C: REP #$20

#_00EF7E: LDX.b #$3E
#_00EF80: LDA.w #$0778
#_00EF83: JSL InitializeHDMATable

#_00EF87: INC.b $15

.exit
#_00EF89: RTL

;===================================================================================================

PaletteFilter_BlindingWhiteTriforce:
#_00EF8A: REP #$30

#_00EF8C: LDX.w #$0040
#_00EF8F: LDA.w #$0200
#_00EF92: JSR PaletteFilter_RestoreAdditive

#_00EF95: BRA PaletteFilter_StartBlindingWhite

;===================================================================================================

PaletteFilter_WhirlpoolBlue:
#_00EF97: LDA.b $1A
#_00EF99: LSR A
#_00EF9A: BCC .skip

#_00EF9C: REP #$30

#_00EF9E: PHB
#_00EF9F: PHK
#_00EFA0: PLB

;---------------------------------------------------------------------------------------------------

#_00EFA1: LDX.w #$0040

.next_color
#_00EFA4: LDA.l $7EC500,X
#_00EFA8: TAY

#_00EFA9: AND.w #$7C00
#_00EFAC: CMP.w #$7C00
#_00EFAF: BEQ .max_blue

#_00EFB1: TYA
#_00EFB2: CLC
#_00EFB3: ADC.w #$0400
#_00EFB6: TAY

.max_blue
#_00EFB7: TYA
#_00EFB8: STA.l $7EC500,X

#_00EFBC: INX
#_00EFBD: INX
#_00EFBE: CPX.w #$0200
#_00EFC1: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_00EFC3: LDA.l $7EC540
#_00EFC7: STA.l $7EC500

#_00EFCB: PLB

#_00EFCC: SEP #$20

#_00EFCE: LDA.l $7EC007
#_00EFD2: LSR A
#_00EFD3: BCS .no_mosaic_increment

#_00EFD5: LDA.l $7EC011
#_00EFD9: CLC
#_00EFDA: ADC.b #$10
#_00EFDC: STA.l $7EC011

.no_mosaic_increment
#_00EFE0: LDA.l $7EC007
#_00EFE4: INC A
#_00EFE5: STA.l $7EC007

#_00EFE9: CMP.b #$1F
#_00EFEB: BNE .skip

#_00EFED: LDA.b #$00
#_00EFEF: STA.l $7EC007

#_00EFF3: INC.b $B0

#_00EFF5: LDA.b #$F0
#_00EFF7: STA.l $7EC011

;---------------------------------------------------------------------------------------------------

.skip
#_00EFFB: SEP #$30

#_00EFFD: LDA.b #$09
#_00EFFF: STA.b $94

#_00F001: LDA.l $7EC011
#_00F005: ORA.b #$03
#_00F007: STA.b $95

#_00F009: INC.b $15

#_00F00B: RTL

;===================================================================================================

PaletteFilter_IsolateWhirlpoolBlue:
#_00F00C: REP #$30

#_00F00E: PHB
#_00F00F: PHK
#_00F010: PLB

#_00F011: LDX.w #$0040

.next_color_isolated
#_00F014: LDA.l $7EC500,X
#_00F018: TAY

#_00F019: AND.w #$03E0
#_00F01C: BEQ .no_green

#_00F01E: TYA
#_00F01F: SEC
#_00F020: SBC.w #$0020
#_00F023: TAY

.no_green
#_00F024: TYA
#_00F025: AND.w #$001F
#_00F028: BEQ .no_red

#_00F02A: TYA
#_00F02B: SEC
#_00F02C: SBC.w #$0001
#_00F02F: TAY

.no_red
#_00F030: TYA
#_00F031: STA.l $7EC500,X

#_00F035: INX
#_00F036: INX
#_00F037: CPX.w #$0200
#_00F03A: BNE .next_color_isolated

;---------------------------------------------------------------------------------------------------

#_00F03C: LDA.l $7EC540
#_00F040: STA.l $7EC500

#_00F044: PLB

#_00F045: SEP #$20

#_00F047: JMP.w PaletteFilter_WhirlpoolBlue_no_mosaic_increment

;===================================================================================================

PaletteFilter_WhirlpoolRestoreBlue:
#_00F04A: LDA.b $1A
#_00F04C: LSR A
#_00F04D: BCC .skip

#_00F04F: REP #$30

#_00F051: PHB
#_00F052: PHK
#_00F053: PLB

#_00F054: LDX.w #$0040

.next_color
#_00F057: LDA.l $7EC300,X
#_00F05B: AND.w #$7C00
#_00F05E: STA.b $00

#_00F060: LDA.l $7EC500,X
#_00F064: TAY

#_00F065: AND.w #$7C00
#_00F068: CMP.b $00
#_00F06A: BEQ .blue_equal

#_00F06C: TYA
#_00F06D: SEC
#_00F06E: SBC.w #$0400
#_00F071: TAY

.blue_equal
#_00F072: TYA
#_00F073: STA.l $7EC500,X

#_00F077: INX
#_00F078: INX
#_00F079: CPX.w #$0200
#_00F07C: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_00F07E: LDA.l $7EC540
#_00F082: STA.l $7EC500

#_00F086: PLB

#_00F087: SEP #$20

#_00F089: LDA.l $7EC007
#_00F08D: LSR A
#_00F08E: BCS .no_mosaic_decrement

#_00F090: LDA.l $7EC011
#_00F094: BEQ .no_mosaic_decrement

#_00F096: SEC
#_00F097: SBC.b #$10
#_00F099: STA.l $7EC011

.no_mosaic_decrement
#_00F09D: LDA.l $7EC007
#_00F0A1: INC A
#_00F0A2: STA.l $7EC007

#_00F0A6: CMP.b #$1F
#_00F0A8: BNE .skip

#_00F0AA: LDA.b #$00
#_00F0AC: STA.l $7EC007
#_00F0B0: STA.l $7EC011

#_00F0B4: INC.b $B0

;---------------------------------------------------------------------------------------------------

.skip
#_00F0B6: SEP #$30

#_00F0B8: LDA.b #$09
#_00F0BA: STA.b $94

#_00F0BC: LDA.l $7EC011
#_00F0C0: ORA.b #$03
#_00F0C2: STA.b $95

#_00F0C4: INC.b $15

#_00F0C6: RTL

;===================================================================================================

PaletteFilter_WhirlpoolRestoreRedGreen:
#_00F0C7: REP #$30

#_00F0C9: PHB
#_00F0CA: PHK
#_00F0CB: PLB

#_00F0CC: LDX.w #$0040

.next_color
#_00F0CF: LDA.l $7EC300,X
#_00F0D3: AND.w #$03E0
#_00F0D6: STA.b $00

#_00F0D8: LDA.l $7EC300,X
#_00F0DC: AND.w #$001F
#_00F0DF: STA.b $02

#_00F0E1: LDA.l $7EC500,X
#_00F0E5: TAY

#_00F0E6: AND.w #$03E0
#_00F0E9: CMP.b $00
#_00F0EB: BEQ .green_equal

#_00F0ED: TYA
#_00F0EE: CLC
#_00F0EF: ADC.w #$0020
#_00F0F2: TAY

.green_equal
#_00F0F3: TYA
#_00F0F4: AND.w #$001F
#_00F0F7: CMP.b $02
#_00F0F9: BEQ .red_equal

#_00F0FB: TYA
#_00F0FC: CLC
#_00F0FD: ADC.w #$0001
#_00F100: TAY

.red_equal
#_00F101: TYA
#_00F102: STA.l $7EC500,X

#_00F106: INX
#_00F107: INX
#_00F108: CPX.w #$0200
#_00F10B: BNE .next_color

;---------------------------------------------------------------------------------------------------

#_00F10D: LDA.l $7EC540
#_00F111: STA.l $7EC500

#_00F115: PLB

#_00F116: SEP #$20

#_00F118: LDA.l $7EC007

#_00F11C: INC A
#_00F11D: STA.l $7EC007

#_00F121: CMP.b #$1F
#_00F123: BNE .still_going

#_00F125: LDA.b #$00
#_00F127: STA.l $7EC007

#_00F12B: INC.b $B0

.still_going
#_00F12D: SEP #$30

#_00F12F: INC.b $15

#_00F131: RTL

;---------------------------------------------------------------------------------------------------

#EXIT_00F132:
#_00F132: SEP #$30

#_00F134: RTL

;===================================================================================================

PaletteFilter_RestoreBGSubstractiveStrict:
#_00F135: REP #$30

#_00F137: LDA.l $7EC009
#_00F13B: CMP.w #$00FF
#_00F13E: BEQ EXIT_00F132

#_00F140: PHB
#_00F141: PHK
#_00F142: PLB

#_00F143: LDX.w #$0040
#_00F146: LDA.w #$0100
#_00F149: JSR PaletteFilter_RestoreSubtractive

#_00F14C: PLB

#_00F14D: LDA.l $7EC007
#_00F151: INC A
#_00F152: STA.l $7EC007

#_00F156: CMP.w #$0020
#_00F159: BNE .still_going

#_00F15B: LDA.w #$00FF
#_00F15E: STA.l $7EC009

#_00F162: STZ.b $1D

.still_going
#_00F164: SEP #$30

#_00F166: INC.b $15

#_00F168: RTL

;===================================================================================================

PaletteFilter_RestoreBGAdditiveStrict:
#_00F169: REP #$30

#_00F16B: PHB
#_00F16C: PHK
#_00F16D: PLB

#_00F16E: LDX.w #$0040
#_00F171: LDA.w #$0100
#_00F174: JSR PaletteFilter_RestoreAdditive

#_00F177: PLB

#_00F178: LDA.l $7EC007
#_00F17C: INC A
#_00F17D: STA.l $7EC007

#_00F181: BRA PaletteFilter_RestoreBGSubstractiveStrict_still_going

;===================================================================================================

Trinexx_FlashShellPalette_Red:
#_00F183: LDA.w $04BE
#_00F186: BNE TrinexxFilterRed_tick_timer

#_00F188: REP #$20

#_00F18A: LDX.b #$00

.next_color
#_00F18C: LDA.l $7EC582,X
#_00F190: AND.w #$001F
#_00F193: CMP.w #$001F
#_00F196: BEQ .red_equal

#_00F198: CLC
#_00F199: ADC.w #$0001

.red_equal
#_00F19C: STA.b $00

#_00F19E: LDA.l $7EC582,X
#_00F1A2: AND.w #$FFE0
#_00F1A5: ORA.b $00
#_00F1A7: STA.l $7EC582,X

#_00F1AB: INX
#_00F1AC: INX
#_00F1AD: CPX.b #$0E
#_00F1AF: BNE .next_color

;---------------------------------------------------------------------------------------------------

#TrinexxFilterRed_continue:
#_00F1B1: SEP #$20

#_00F1B3: INC.b $15

#_00F1B5: INC.w $04C0

#_00F1B8: LDA.w $04C0
#_00F1BB: CMP.b #$0C
#_00F1BD: BCS .done

#_00F1BF: LDA.b #$03
#_00F1C1: STA.w $04BE

;---------------------------------------------------------------------------------------------------

#TrinexxFilterRed_tick_timer:
#_00F1C4: DEC.w $04BE

#_00F1C7: RTL

;---------------------------------------------------------------------------------------------------

.done
#_00F1C8: STZ.w $04BE
#_00F1CB: STZ.w $04C0

#_00F1CE: RTL

;===================================================================================================

Trinexx_UnflashShellPalette_Red:
#_00F1CF: LDA.w $04BE
#_00F1D2: BNE TrinexxFilterRed_tick_timer

#_00F1D4: REP #$20

#_00F1D6: LDX.b #$00

.next_color
#_00F1D8: LDA.l $7EC382,X
#_00F1DC: AND.w #$001F
#_00F1DF: STA.b $0C

#_00F1E1: LDA.l $7EC582,X
#_00F1E5: AND.w #$001F
#_00F1E8: CMP.b $0C
#_00F1EA: BEQ .red_equal

#_00F1EC: SEC
#_00F1ED: SBC.w #$0001

.red_equal
#_00F1F0: STA.b $00

#_00F1F2: LDA.l $7EC582,X
#_00F1F6: AND.w #$FFE0
#_00F1F9: ORA.b $00
#_00F1FB: STA.l $7EC582,X

#_00F1FF: INX
#_00F200: INX
#_00F201: CPX.b #$0E
#_00F203: BNE .next_color

#_00F205: BRA TrinexxFilterRed_continue

;===================================================================================================

Trinexx_FlashShellPalette_Blue:
#_00F207: LDA.w $04BF
#_00F20A: BNE TrinexxFilterBlue_tick_timer

#_00F20C: REP #$20

#_00F20E: LDX.b #$00

.next_color
#_00F210: LDA.l $7EC582,X
#_00F214: AND.w #$7C00
#_00F217: CMP.w #$7C00
#_00F21A: BEQ .blue_equal

#_00F21C: CLC
#_00F21D: ADC.w #$0400

.blue_equal
#_00F220: STA.b $00

#_00F222: LDA.l $7EC582,X
#_00F226: AND.w #$83FF
#_00F229: ORA.b $00
#_00F22B: STA.l $7EC582,X

#_00F22F: INX
#_00F230: INX
#_00F231: CPX.b #$0E
#_00F233: BNE .next_color

;---------------------------------------------------------------------------------------------------

#TrinexxFilterBlue_continue:
#_00F235: SEP #$20

#_00F237: INC.b $15

#_00F239: INC.w $04C1

#_00F23C: LDA.w $04C1
#_00F23F: CMP.b #$0C
#_00F241: BCS .done

#_00F243: LDA.b #$03
#_00F245: STA.w $04BF

;---------------------------------------------------------------------------------------------------

#TrinexxFilterBlue_tick_timer:
#_00F248: DEC.w $04BF

#_00F24B: RTL

;---------------------------------------------------------------------------------------------------

.done
#_00F24C: STZ.w $04BF
#_00F24F: STZ.w $04C1

#_00F252: RTL

;===================================================================================================

Trinexx_UnflashShellPalette_Blue:
#_00F253: LDA.w $04BF
#_00F256: BNE TrinexxFilterBlue_tick_timer

#_00F258: REP #$20

#_00F25A: LDX.b #$00

.next_color
#_00F25C: LDA.l $7EC382,X
#_00F260: AND.w #$7C00
#_00F263: STA.b $0C

#_00F265: LDA.l $7EC582,X
#_00F269: AND.w #$7C00
#_00F26C: CMP.b $0C
#_00F26E: BEQ .blue_equal

#_00F270: SEC
#_00F271: SBC.w #$0400

.blue_equal
#_00F274: STA.b $00

#_00F276: LDA.l $7EC582,X
#_00F27A: AND.w #$83FF
#_00F27D: ORA.b $00
#_00F27F: STA.l $7EC582,X

#_00F283: INX
#_00F284: INX
#_00F285: CPX.b #$0E
#_00F287: BNE .next_color

#_00F289: BRA TrinexxFilterBlue_continue

;===================================================================================================

IrisSpotlight_close:
#_00F28B: REP #$10

#_00F28D: LDY.w #$0000
#_00F290: LDX.w #$007E

#_00F293: BRA .continue

;===================================================================================================

#IrisSpotlight_open:
#_00F295: REP #$10

#_00F297: LDY.w #$0002
#_00F29A: LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.continue
#_00F29D: STY.w $067E

#_00F2A0: STX.w $067C

#_00F2A3: STZ.w HDMAEN

#_00F2A6: LDX.w #$2641
#_00F2A9: STX.w DMA6MODE
#_00F2AC: STX.w DMA7MODE

#_00F2AF: LDX.w #.hdma_table>>0
#_00F2B2: STX.w DMA6ADDRL
#_00F2B5: STX.w DMA7ADDRL

#_00F2B8: LDA.b #.hdma_table>>16
#_00F2BA: STA.w DMA6ADDRB
#_00F2BD: STA.w DMA7ADDRB

#_00F2C0: LDA.b #$00
#_00F2C2: STA.w HDMA6INDIRECTB
#_00F2C5: STA.w HDMA7INDIRECTB

;---------------------------------------------------------------------------------------------------

#_00F2C8: LDA.b #$33
#_00F2CA: STA.b $96

#_00F2CC: LDA.b #$03
#_00F2CE: STA.b $97

#_00F2D0: LDA.b #$33
#_00F2D2: STA.b $98

#_00F2D4: LDA.b $1C
#_00F2D6: STA.b $1E

#_00F2D8: LDA.b $1D
#_00F2DA: STA.b $1F

#_00F2DC: LDA.b $1B
#_00F2DE: BNE .indoors

#_00F2E0: LDA.b #$20 ; Fixed color RGB: #000000
#_00F2E2: STA.b $9C

#_00F2E4: LDA.b #$40
#_00F2E6: STA.b $9D

#_00F2E8: LDA.b #$80
#_00F2EA: STA.b $9E

;---------------------------------------------------------------------------------------------------

.indoors
#_00F2EC: SEP #$10

#_00F2EE: JSL IrisSpotlight_ConfigureTable

#_00F2F2: LDA.b #$80
#_00F2F4: STA.b $9B

#_00F2F6: LDA.b #$0F
#_00F2F8: STA.b $13

#_00F2FA: RTL

;---------------------------------------------------------------------------------------------------

.hdma_table
#_00F2FB: db $F8 : dw $1B00 ; 120 lines continuous
#_00F2FE: db $F8 : dw $1BF0 ; 120 lines continuous
#_00F301: db $00 ; end

;===================================================================================================

pool IrisSpotlight_ConfigureTable

.delta
#_00F302: dw -7
#_00F304: dw  7
#_00F306: dw  7
#_00F308: dw  7

.target
#_00F30A: dw $0000
#_00F30C: dw $007E
#_00F30E: dw $0023
#_00F310: dw $007E

pool off

;---------------------------------------------------------------------------------------------------

IrisSpotlight_ConfigureTable:
#_00F312: PHB
#_00F313: PHK
#_00F314: PLB

#_00F315: REP #$30

#_00F317: LDA.b $20
#_00F319: SEC
#_00F31A: SBC.b $E8

#_00F31C: CLC
#_00F31D: ADC.w #$000C
#_00F320: STA.b $0E

#_00F322: SEC
#_00F323: SBC.w $067C
#_00F326: STA.w $0674

#_00F329: LDA.b $0E
#_00F32B: CLC
#_00F32C: ADC.w $067C
#_00F32F: STA.w $0676

;---------------------------------------------------------------------------------------------------

#_00F332: LDA.b $22
#_00F334: SEC
#_00F335: SBC.b $E2

#_00F337: CLC
#_00F338: ADC.w #$0008
#_00F33B: STA.w $0670

#_00F33E: LDA.w $067C
#_00F341: STA.w $067A

#_00F344: LDA.b $0E
#_00F346: ASL A
#_00F347: STA.b $06

;---------------------------------------------------------------------------------------------------

#_00F349: CMP.w #$00E0
#_00F34C: BCS .big_enough

#_00F34E: LDA.w #$00E0
#_00F351: STA.b $06

.big_enough
#_00F353: LDA.b $06
#_00F355: SEC
#_00F356: SBC.b $0E
#_00F358: STA.b $0A

#_00F35A: LDA.b $0E
#_00F35C: SEC
#_00F35D: SBC.b $0A
#_00F35F: STA.b $04

;---------------------------------------------------------------------------------------------------

.next_check
#_00F361: LDA.w #$00FF
#_00F364: STA.b $08

#_00F366: LDA.b $06
#_00F368: CMP.w $0676
#_00F36B: BCS .past_calced_size

#_00F36D: LDA.w $067A
#_00F370: BEQ .at_zero

#_00F372: DEC.w $067A

.at_zero
#_00F375: JSR IrisSpotlight_CalculateCircleValue

.past_calced_size
#_00F378: LDA.b $04
#_00F37A: ASL A
#_00F37B: CMP.w #$01C0
#_00F37E: BCS .skip_update_a

#_00F380: TAX

#_00F381: LDA.b $08
#_00F383: STA.l $7F7000,X

.skip_update_a
#_00F387: LDA.b $06
#_00F389: ASL A
#_00F38A: CMP.w #$01C0
#_00F38D: BCS .skip_update_b

#_00F38F: TAX

#_00F390: LDA.b $08
#_00F392: STA.l $7F7000,X

.skip_update_b
#_00F396: LDA.b $0E
#_00F398: CMP.b $04
#_00F39A: BEQ .wait_for_scanline

#_00F39C: INC.b $04

#_00F39E: DEC.b $06

#_00F3A0: JMP.w .next_check

;---------------------------------------------------------------------------------------------------

.wait_for_scanline
#_00F3A3: LDA.w SLVH
#_00F3A6: LDA.w STAT78

#_00F3A9: LDA.w OPVCT
#_00F3AC: AND.w #$00FF
#_00F3AF: CMP.w #$00C0
#_00F3B2: BCC .wait_for_scanline

#_00F3B4: LDX.w #$0000

.copy_table
#_00F3B7: LDA.l $7F7000,X
#_00F3BB: STA.w $1B00,X

#_00F3BE: INX
#_00F3BF: INX
#_00F3C0: CPX.w #$01C0
#_00F3C3: BCC .copy_table

;---------------------------------------------------------------------------------------------------

#_00F3C5: LDX.w $067E

#_00F3C8: LDA.w $067C
#_00F3CB: CLC
#_00F3CC: ADC.w .delta,X
#_00F3CF: STA.w $067C

#_00F3D2: CMP.w .target,X
#_00F3D5: BNE .exit

#_00F3D7: SEP #$20

#_00F3D9: LDA.w $067E
#_00F3DC: BNE .reset_table

#_00F3DE: LDA.b #$80
#_00F3E0: STA.b $13
#_00F3E2: STA.w INIDISP

#_00F3E5: BRA .continue

;---------------------------------------------------------------------------------------------------

.reset_table
#_00F3E7: JSL IrisSpotlight_ResetTable

.continue
#_00F3EB: SEP #$30

#_00F3ED: STZ.b $B0
#_00F3EF: STZ.b $11

#_00F3F1: LDA.b $10
#_00F3F3: CMP.b #$07
#_00F3F5: BEQ .underworld

#_00F3F7: CMP.b #$10
#_00F3F9: BNE .not_opening

.underworld
#_00F3FB: LDA.b $1B
#_00F3FD: BNE .check_music_command

#_00F3FF: LDX.b $8A
#_00F401: LDA.l $7F5B00,X
#_00F405: LSR A
#_00F406: LSR A
#_00F407: LSR A
#_00F408: LSR A
#_00F409: STA.w $012D

.check_music_command
#_00F40C: LDA.w $0132
#_00F40F: CMP.b #$FF ; SONG FF - transfer
#_00F411: BEQ .not_opening

#_00F413: STA.w $012C

.not_opening
#_00F416: LDA.w $010C
#_00F419: STA.b $10

#_00F41B: CMP.b #$06
#_00F41D: BNE .exit

#_00F41F: JSL Sprite_ResetAll

.exit
#_00F423: SEP #$30

#_00F425: PLB

#_00F426: RTL

;===================================================================================================

IrisSpotlight_ResetTable:
#_00F427: REP #$30

#_00F429: LDX.w #$003E
#_00F42C: LDA.w #$FF00

.next
#_00F42F: STA.w $1B00,X
#_00F432: STA.w $1B40,X
#_00F435: STA.w $1B80,X
#_00F438: STA.w $1BC0,X
#_00F43B: STA.w $1C00,X
#_00F43E: STA.w $1C40,X
#_00F441: STA.w $1C80,X

#_00F444: DEX
#_00F445: DEX
#_00F446: BPL .next

#_00F448: SEP #$30

#_00F44A: RTL

;===================================================================================================

pool IrisSpotlight_CalculateCircleValue

.multiplicand
#_00F44B: db 255, 255, 255, 255, 255, 255, 255, 255
#_00F453: db 255, 255, 255, 255, 254, 254, 254, 254
#_00F45B: db 253, 253, 253, 253, 252, 252, 252, 251
#_00F463: db 251, 251, 250, 250, 249, 249, 248, 248
#_00F46B: db 247, 247, 246, 246, 245, 245, 244, 243
#_00F473: db 243, 242, 241, 241, 240, 239, 238, 238
#_00F47B: db 237, 236, 235, 234, 233, 233, 232, 231
#_00F483: db 230, 229, 228, 227, 226, 225, 223, 222
#_00F48B: db 221, 220, 219, 218, 216, 215, 214, 213
#_00F493: db 211, 210, 208, 207, 205, 204, 202, 201
#_00F49B: db 199, 198, 196, 194, 193, 191, 189, 187
#_00F4A3: db 185, 183, 182, 180, 177, 175, 173, 171
#_00F4AB: db 169, 167, 164, 162, 159, 157, 154, 151
#_00F4B3: db 149, 146, 143, 140, 137, 134, 130, 127
#_00F4BB: db 123, 120, 116, 112, 108, 103,  99,  94
#_00F4C3: db  89,  83,  77,  70,  63,  55,  45,  31
#_00F4CB: db   0

pool off

;---------------------------------------------------------------------------------------------------

IrisSpotlight_CalculateCircleValue:
#_00F4CC: SEP #$30

#_00F4CE: STA.w WRDIVH
#_00F4D1: STZ.w WRDIVL

#_00F4D4: LDA.w $067C
#_00F4D7: STA.w WRDIVB

#_00F4DA: NOP
#_00F4DB: NOP
#_00F4DC: NOP
#_00F4DD: NOP
#_00F4DE: NOP
#_00F4DF: NOP

#_00F4E0: REP #$20

#_00F4E2: LDA.w RDDIV
#_00F4E5: LSR A

#_00F4E6: SEP #$20

#_00F4E8: TAX

#_00F4E9: LDY.w .multiplicand,X
#_00F4EC: STY.b $0A
#_00F4EE: STY.w WRMPYA

#_00F4F1: LDA.w $067C
#_00F4F4: STA.w WRMPYB

#_00F4F7: NOP
#_00F4F8: NOP

#_00F4F9: STZ.b $01
#_00F4FB: STZ.b $0B

#_00F4FD: LDA.w RDMPYH
#_00F500: STA.b $00

#_00F502: REP #$30

#_00F504: ASL.b $00
#_00F506: LDA.b $0A
#_00F508: BEQ .exit

#_00F50A: LDA.b $00
#_00F50C: CLC
#_00F50D: ADC.w $0670
#_00F510: STA.b $02

#_00F512: LDA.w $0670
#_00F515: SEC
#_00F516: SBC.b $00

#_00F518: STZ.b $00

#_00F51A: BMI .positive

#_00F51C: BIT.w #$FF00
#_00F51F: BEQ .zero_high_a

#_00F521: LDA.w #$00FF

.zero_high_a
#_00F524: STA.b $00

.positive
#_00F526: LDA.b $02
#_00F528: BIT.w #$FF00
#_00F52B: BEQ .zero_high_b

#_00F52D: LDA.w #$00FF

.zero_high_b
#_00F530: XBA
#_00F531: ORA.b $00
#_00F533: CMP.w #$FFFF
#_00F536: BNE .keep

#_00F538: LDA.w #$00FF

.keep
#_00F53B: STA.b $08

.exit
#_00F53D: RTS

;===================================================================================================

pool OrientVerticalLampCone OrientHorizontalLampCone

.horizontal
#_00F53E: dw $0000, $0100, $0000, $0100

.vertical
#_00F546: dw $0000, $0000, $0100, $0100

.adjust
#_00F54E: dw $0034, $FFFE, $0038, $0006

.margin
#_00F556: dw $0040, $0040, $0052, $FF50

.max
#_00F55E: dw $0080, $0180, $00A0, $00A0

pool off

;---------------------------------------------------------------------------------------------------

#EXIT_00F566:
#_00F566: RTL

;---------------------------------------------------------------------------------------------------

OrientLampLightCone:
#_00F567: LDA.w $0458
#_00F56A: BEQ EXIT_00F566

#_00F56C: LDA.b $11
#_00F56E: CMP.b #$14
#_00F570: BEQ EXIT_00F566

#_00F572: REP #$30

#_00F574: LDA.b $2F
#_00F576: AND.w #$00FF
#_00F579: STA.b $00

#_00F57B: TAX

#_00F57C: LDA.b $6C
#_00F57E: AND.w #$00FF
#_00F581: BEQ .not_in_doorway

#_00F583: AND.w #$00FE
#_00F586: ASL A
#_00F587: TAX
#_00F588: BEQ .vertical_doorway

#_00F58A: LDA.b $00
#_00F58C: CMP.w #$0004
#_00F58F: BCS .facing_horizontal

#_00F591: LDA.b $22
#_00F593: CLC
#_00F594: ADC.w #$0008
#_00F597: AND.w #$00FF

#_00F59A: BRA .doorway_continue

.facing_horizontal
#_00F59C: TAX

#_00F59D: BRA .not_in_doorway

;---------------------------------------------------------------------------------------------------

.vertical_doorway
#_00F59F: LDA.b $00
#_00F5A1: CMP.w #$0004
#_00F5A4: BCC .facing_horizontal

#_00F5A6: LDA.b $20
#_00F5A8: AND.w #$00FF

;---------------------------------------------------------------------------------------------------

.doorway_continue
#_00F5AB: CMP.w #$0080
#_00F5AE: BCC .not_in_doorway

#_00F5B0: INX
#_00F5B1: INX

.not_in_doorway
#_00F5B2: CPX.w #$0004
#_00F5B5: BCS OrientHorizontalLampCone

;===================================================================================================

OrientVerticalLampCone:
#_00F5B7: LDA.b $22
#_00F5B9: SEC
#_00F5BA: SBC.w #$0077
#_00F5BD: STA.b $00

#_00F5BF: LDA.b $E2
#_00F5C1: SEC
#_00F5C2: SBC.b $00

#_00F5C4: CLC
#_00F5C5: ADC.l .horizontal,X
#_00F5C9: STA.b $E0

#_00F5CB: LDA.b $20
#_00F5CD: SEC
#_00F5CE: SBC.w #$0058
#_00F5D1: STA.b $00

;---------------------------------------------------------------------------------------------------

#_00F5D3: LDA.b $E8
#_00F5D5: SEC
#_00F5D6: SBC.b $00

#_00F5D8: CLC
#_00F5D9: ADC.l .vertical,X

#_00F5DD: CLC
#_00F5DE: ADC.l .adjust,X

#_00F5E2: CLC
#_00F5E3: ADC.l .margin,X

#_00F5E7: BPL .lower_in_bounds

#_00F5E9: LDA.w #$0000

.lower_in_bounds
#_00F5EC: CMP.l .max,X
#_00F5F0: BCC .upper_in_bounds

#_00F5F2: LDA.l .max,X

.upper_in_bounds
#_00F5F6: SEC
#_00F5F7: SBC.l .margin,X
#_00F5FB: STA.b $E6

#_00F5FD: SEP #$30

#_00F5FF: RTL

;===================================================================================================

OrientHorizontalLampCone:
#_00F600: LDA.b $20
#_00F602: SEC
#_00F603: SBC.w #$0072
#_00F606: STA.b $00

#_00F608: LDA.b $E8
#_00F60A: SEC
#_00F60B: SBC.b $00

#_00F60D: CLC
#_00F60E: ADC.l .vertical,X
#_00F612: STA.b $E6

#_00F614: LDA.b $22
#_00F616: SEC
#_00F617: SBC.w #$0058
#_00F61A: STA.b $00

;---------------------------------------------------------------------------------------------------

#_00F61C: LDA.b $E2
#_00F61E: SEC
#_00F61F: SBC.b $00

#_00F621: CLC
#_00F622: ADC.l .horizontal,X

#_00F626: CLC
#_00F627: ADC.l .adjust,X

#_00F62B: CLC
#_00F62C: ADC.l .margin,X

#_00F630: BPL .lower_in_bounds

#_00F632: LDA.w #$0000

.lower_in_bounds
#_00F635: CMP.l .max,X
#_00F639: BCC .upper_in_bounds

#_00F63B: LDA.l .max,X

.upper_in_bounds
#_00F63F: SEC
#_00F640: SBC.l .margin,X
#_00F644: STA.b $E0

#_00F646: SEP #$30

#_00F648: RTL

;===================================================================================================

AdjustWaterHDMAWindow:
#_00F649: REP #$30

#_00F64B: LDA.w $0682
#_00F64E: SEC
#_00F64F: SBC.b $E8
#_00F651: STA.b $0A

#_00F653: SEC
#_00F654: SBC.w $0684
#_00F657: STA.w $0674

#_00F65A: LDA.b $0A
#_00F65C: CLC
#_00F65D: ADC.w $0684

;===================================================================================================

AdjustWaterHDMAWindow_Horizontal:
#_00F660: STA.w $0676

#_00F663: LDA.w $0680
#_00F666: SEC
#_00F667: SBC.b $E2
#_00F669: STA.w $0670

#_00F66C: LDA.w $0686
#_00F66F: BEQ .horizontal_zero

#_00F671: DEC A

.horizontal_zero
#_00F672: STA.b $0C

#_00F674: CLC
#_00F675: ADC.w $0670
#_00F678: STA.b $02

#_00F67A: LDA.w $0670
#_00F67D: SEC
#_00F67E: SBC.b $0C
#_00F680: STA.b $00

#_00F682: LDY.w #$0000
#_00F685: BMI .positive_a

#_00F687: TAY

#_00F688: AND.w #$FF00
#_00F68B: BEQ .positive_a

#_00F68D: LDY.w #$00FF

.positive_a
#_00F690: TYA
#_00F691: AND.w #$00FF
#_00F694: STA.b $00

#_00F696: LDA.b $02
#_00F698: TAY

#_00F699: AND.w #$FF00
#_00F69C: BEQ .positive_b

#_00F69E: LDY.w #$00FF

.positive_b
#_00F6A1: TYA
#_00F6A2: AND.w #$00FF
#_00F6A5: XBA
#_00F6A6: ORA.b $00
#_00F6A8: STA.b $0C

#_00F6AA: LDA.b $0A
#_00F6AC: ASL A
#_00F6AD: STA.b $06

#_00F6AF: CMP.w #$00E0
#_00F6B2: BCS .not_too_far

#_00F6B4: LDA.w #$00E0
#_00F6B7: STA.b $06

.not_too_far
#_00F6B9: LDA.b $06
#_00F6BB: SEC
#_00F6BC: SBC.b $0A
#_00F6BE: STA.b $08

#_00F6C0: LDA.b $0A
#_00F6C2: SEC
#_00F6C3: SBC.b $08
#_00F6C5: STA.b $04

#_00F6C7: BRA .start

;---------------------------------------------------------------------------------------------------

.next
#_00F6C9: INC.b $04

#_00F6CB: DEC.b $06

.start
#_00F6CD: LDA.b $04
#_00F6CF: BMI .dont_add_to_hdma_y

#_00F6D1: LDA.w $0674
#_00F6D4: BMI .no_new_line_y

#_00F6D6: LDA.b $04
#_00F6D8: CMP.w $0674
#_00F6DB: BCS .no_new_line_y

#_00F6DD: ASL A
#_00F6DE: TAX

#_00F6DF: LDA.w #$00FF

#_00F6E2: BRA .check_for_entry_y

.no_new_line_y
#_00F6E4: LDA.b $04
#_00F6E6: ASL A
#_00F6E7: TAX

#_00F6E8: LDA.b $0C

.check_for_entry_y
#_00F6EA: CPX.w #$01C0
#_00F6ED: BCS .dont_add_to_hdma_y

#_00F6EF: CMP.w #$FFFF
#_00F6F2: BNE .not_end_y

#_00F6F4: LDA.w #$00FF

.not_end_y
#_00F6F7: STA.w $1B00,X

.dont_add_to_hdma_y
#_00F6FA: LDA.b $06
#_00F6FC: CMP.w $0676
#_00F6FF: BCC .no_new_line_x

#_00F701: ASL A
#_00F702: TAX

#_00F703: LDA.w #$00FF
#_00F706: BRA .check_for_entry_x

.no_new_line_x
#_00F708: CMP.w #$00E1
#_00F70B: BCC .dont_change_boundary_x

#_00F70D: LDA.w $0678
#_00F710: BEQ .dont_change_boundary_x

#_00F712: DEC.w $0678

.dont_change_boundary_x
#_00F715: LDA.b $06
#_00F717: ASL A
#_00F718: TAX

#_00F719: LDA.b $0C

.check_for_entry_x
#_00F71B: CPX.w #$01C0
#_00F71E: BCS .dont_add_to_hdma_x

#_00F720: CMP.w #$FFFF
#_00F723: BNE .not_end_x

#_00F725: LDA.w #$00FF

.not_end_x
#_00F728: STA.w $1B00,X

.dont_add_to_hdma_x
#_00F72B: LDA.b $0A
#_00F72D: CMP.b $04
#_00F72F: BNE .next

#_00F731: SEP #$30

#_00F733: RTL

;===================================================================================================

FloodDam_PrepFloodHDMA:
#_00F734: REP #$30

#_00F736: STZ.b $04

#_00F738: LDA.w $0682
#_00F73B: SEC
#_00F73C: SBC.b $E8
#_00F73E: STA.w $0674

#_00F741: LDA.w $0680
#_00F744: SEC
#_00F745: SBC.b $E2
#_00F747: STA.w $0670

#_00F74A: LDA.w $0686
#_00F74D: EOR.w #$0001
#_00F750: STA.b $0E

#_00F752: CLC
#_00F753: ADC.w $0670
#_00F756: STA.b $02

#_00F758: LDA.w $0670
#_00F75B: SEC
#_00F75C: SBC.b $0E
#_00F75E: AND.w #$00FF
#_00F761: STA.b $00

#_00F763: LDA.b $02
#_00F765: AND.w #$00FF
#_00F768: XBA
#_00F769: ORA.b $00
#_00F76B: STA.b $0C

;---------------------------------------------------------------------------------------------------

.next_a
#_00F76D: LDA.b $04
#_00F76F: ASL A
#_00F770: TAX

#_00F771: LDA.w #$FF00
#_00F774: STA.w $1B00,X

#_00F777: INC.b $04

#_00F779: LDA.b $04
#_00F77B: CMP.w $0676
#_00F77E: BNE .next_a

;---------------------------------------------------------------------------------------------------

#_00F780: LDA.b $0E
#_00F782: SEC
#_00F783: SBC.w #$0007
#_00F786: CLC
#_00F787: ADC.w #$0008
#_00F78A: STA.b $0C

#_00F78C: CLC
#_00F78D: ADC.w $0670
#_00F790: STA.b $02

#_00F792: LDA.w $0670
#_00F795: SEC
#_00F796: SBC.b $0C
#_00F798: AND.w #$00FF
#_00F79B: STA.b $00

#_00F79D: LDA.b $02
#_00F79F: AND.w #$00FF
#_00F7A2: XBA
#_00F7A3: ORA.b $00
#_00F7A5: STA.b $0C

#_00F7A7: LDA.w $0676
#_00F7AA: CLC
#_00F7AB: ADC.w $0684
#_00F7AE: EOR.w #$0001
#_00F7B1: STA.b $0A

;---------------------------------------------------------------------------------------------------

.next_b
#_00F7B3: LDA.b $04
#_00F7B5: CMP.b $0A
#_00F7B7: BCC .shift_in_bounds

#_00F7B9: ASL A
#_00F7BA: TAX

#_00F7BB: LDA.w #$00FF

#_00F7BE: BRA .continue

.shift_in_bounds
#_00F7C0: ASL A

#_00F7C1: TAX
#_00F7C2: CPX.w #$01C0
#_00F7C5: BCS .shift_in_bounds

#_00F7C7: LDA.b $0C

.continue
#_00F7C9: CMP.w #$FFFF
#_00F7CC: BNE .not_neg1

#_00F7CE: LDA.w #$00FF

.not_neg1
#_00F7D1: STA.w $1B00,X

#_00F7D4: INC.b $04

#_00F7D6: LDA.b $04
#_00F7D8: CMP.w #$00E1
#_00F7DB: BCC .next_b

#_00F7DD: SEP #$30

#_00F7DF: RTL

;===================================================================================================
; FREE ROM: 0x20
;===================================================================================================
NULL_00F7E0:
#_00F7E0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00F7E8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00F7F0: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
#_00F7F8: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_Interface:
#_00F800: LDA.b $1B
#_00F802: BEQ .outdoors

#_00F804: LDA.b $11
#_00F806: CMP.b #$03
#_00F808: BNE .not_dungeon_map

#_00F80A: LDA.w $0200
#_00F80D: BEQ .continue

#_00F80F: CMP.b #$07
#_00F811: BEQ .continue

#_00F813: BRA .skip_core

;---------------------------------------------------------------------------------------------------

.not_dungeon_map
#_00F815: JSL PushBlock_Handler

#_00F819: BRA .continue

;---------------------------------------------------------------------------------------------------

.outdoors
#_00F81B: LDA.b $11
#_00F81D: CMP.b #$07
#_00F81F: BEQ .overworld_map

#_00F821: CMP.b #$0A ; duck
#_00F823: BNE .continue

.overworld_map
#_00F825: LDA.w $0200
#_00F828: BNE .skip_core

;---------------------------------------------------------------------------------------------------

.continue
#_00F82A: JSL Sprite_Main
#_00F82E: JSL LinkOAM_Main

#_00F832: LDA.b $1B
#_00F834: BNE .indoors

#_00F836: JSL OverworldOverlay_HandleRain

.indoors
#_00F83A: JSL RefillLogic_long

#_00F83E: LDA.b $11
#_00F840: CMP.b #$02
#_00F842: BEQ .skip_core

#_00F844: JSL OrientLampLightCone

;---------------------------------------------------------------------------------------------------

.skip_core
#_00F848: SEP #$30

#_00F84A: JSL RunInterface

#_00F84E: REP #$21

#_00F850: LDA.b $E2
#_00F852: ADC.w $011A
#_00F855: STA.w $011E

#_00F858: LDA.b $E8
#_00F85A: CLC
#_00F85B: ADC.w $011C
#_00F85E: STA.w $0122

#_00F861: LDA.b $E0
#_00F863: CLC
#_00F864: ADC.w $011A
#_00F867: STA.w $0120

#_00F86A: LDA.b $E6
#_00F86C: CLC
#_00F86D: ADC.w $011C
#_00F870: STA.w $0124

#_00F873: SEP #$20

;===================================================================================================

Module0E_00_Nothing:
#_00F875: RTL

;===================================================================================================

pool RunInterface

.low
#_00F876: db Module0E_00_Nothing>>0
#_00F877: db Module0E_01_ItemMenu>>0
#_00F878: db Module0E_02_RenderText>>0
#_00F879: db Module0E_03_UnderworldMap>>0
#_00F87A: db Module0E_04_RedPotion>>0
#_00F87B: db Module0E_05_DesertPrayer>>0
#_00F87C: db Module0E_06_Unused>>0
#_00F87D: db Module0E_07_OverworldMap>>0
#_00F87E: db Module0E_08_GreenPotion>>0
#_00F87F: db Module0E_09_BluePotion>>0
#_00F880: db Module0E_0A_FluteMenu>>0
#_00F881: db Module0E_0B_SaveMenu>>0

;---------------------------------------------------------------------------------------------------

.high
#_00F882: db Module0E_00_Nothing>>8
#_00F883: db Module0E_01_ItemMenu>>8
#_00F884: db Module0E_02_RenderText>>8
#_00F885: db Module0E_03_UnderworldMap>>8
#_00F886: db Module0E_04_RedPotion>>8
#_00F887: db Module0E_05_DesertPrayer>>8
#_00F888: db Module0E_06_Unused>>8
#_00F889: db Module0E_07_OverworldMap>>8
#_00F88A: db Module0E_08_GreenPotion>>8
#_00F88B: db Module0E_09_BluePotion>>8
#_00F88C: db Module0E_0A_FluteMenu>>8
#_00F88D: db Module0E_0B_SaveMenu>>8

;---------------------------------------------------------------------------------------------------

.bank
#_00F88E: db Module0E_00_Nothing>>16
#_00F88F: db Module0E_01_ItemMenu>>16
#_00F890: db Module0E_02_RenderText>>16
#_00F891: db Module0E_03_UnderworldMap>>16
#_00F892: db Module0E_04_RedPotion>>16
#_00F893: db Module0E_05_DesertPrayer>>16
#_00F894: db Module0E_06_Unused>>16
#_00F895: db Module0E_07_OverworldMap>>16
#_00F896: db Module0E_08_GreenPotion>>16
#_00F897: db Module0E_09_BluePotion>>16
#_00F898: db Module0E_0A_FluteMenu>>16
#_00F899: db Module0E_0B_SaveMenu>>16

pool off

;---------------------------------------------------------------------------------------------------

RunInterface:
#_00F89A: LDX.b $11

#_00F89C: LDA.l .low,X
#_00F8A0: STA.b $00

#_00F8A2: LDA.l .high,X
#_00F8A6: STA.b $01

#_00F8A8: LDA.l .bank,X
#_00F8AC: STA.b $02

#_00F8AE: JML.w [$0000]

;===================================================================================================

Module0E_05_DesertPrayer:
#_00F8B1: LDA.b $B0
#_00F8B3: JSL JumpTableLong
#_00F8B7: dl ResetTransitionPropsAndAdvance_ResetInterface_long
#_00F8BA: dl ApplyPaletteFilter
#_00F8BD: dl DesertPrayer_InitializeCutscene
#_00F8C0: dl DesertPrayer_FadeScene
#_00F8C3: dl DesertPrayer_WaitForInput

;===================================================================================================

DesertPrayer_InitializeCutscene:
#_00F8C6: JSL DesertPrayer_InitializeIrisHDMA

#_00F8CA: LDA.l $7EC00B
#_00F8CE: DEC A
#_00F8CF: STA.l $7EC007

#_00F8D3: LDA.b #$00
#_00F8D5: STA.l $7EC00B

#_00F8D9: LDA.b #$02
#_00F8DB: STA.l $7EC009

#_00F8DF: RTL

;===================================================================================================

DesertPrayer_FadeScene:
#_00F8E0: JSL ApplyPaletteFilter

;===================================================================================================

DesertPrayer_WaitForInput:
#_00F8E4: JSL DesertPrayer_BuildIrisHDMATable

#_00F8E8: RTL

;===================================================================================================

Module0E_06_Unused:
#_00F8E9: LDA.b $B0
#_00F8EB: JSL JumpTableLong
#_00F8EF: dl ResetTransitionPropsAndAdvance_ResetInterface_long
#_00F8F2: dl ApplyPaletteFilter
#_00F8F5: dl Underworld_HandleTranslucencyAndPalettes_long
#_00F8F8: dl UnusedInterfacePaletteRecovery_long

;===================================================================================================

Module0E_04_RedPotion:
#_00F8FB: JSL AnimatedRefill_Health
#_00F8FF: BCC .exit

;===================================================================================================

#Module0E_Interface_RestoreModeFromPotion:
#_00F901: LDA.b $3A
#_00F903: AND.b #$BF
#_00F905: STA.b $3A

#_00F907: INC.b $16

#_00F909: STZ.b $11

#_00F90B: LDA.w $010C
#_00F90E: STA.b $10

.exit
#_00F910: RTL

;===================================================================================================

Module0E_08_GreenPotion:
#_00F911: JSL AnimatedRefill_Magic
#_00F915: BCS Module0E_Interface_RestoreModeFromPotion

#_00F917: RTL

;===================================================================================================

Module0E_09_BluePotion:
#_00F918: JSL AnimatedRefill_Health
#_00F91C: BCC .health_full

#_00F91E: LDA.b #$08
#_00F920: STA.b $11

.health_full
#_00F922: JSL AnimatedRefill_Magic
#_00F926: BCC .magic_full

#_00F928: LDA.b #$04
#_00F92A: STA.b $11

.magic_full
#_00F92C: RTL

;===================================================================================================

pool PrepareDungeonExitFromBossFight

.boss_room
#_00F92D: db $C8 ; ROOM 00C8 - Armos→Eastern lobby
#_00F92E: db $33 ; ROOM 0033 - Lanmolas→Desert 3
#_00F92F: db $07 ; ROOM 0007 - Moldorm→Hera lobby
#_00F930: db $20 ; ROOM 0020 - Agahnim→self
#_00F931: db $06 ; ROOM 0006 - Arrghus→Swamp lobby
#_00F932: db $5A ; ROOM 005A - Helmasaur→PoD lobby
#_00F933: db $29 ; ROOM 0029 - Mothula→Skull 3
#_00F934: db $90 ; ROOM 0090 - Vitreous→Mire foyer
#_00F935: db $DE ; ROOM 00DE - Kholdstare→Ice 1
#_00F936: db $A4 ; ROOM 00A4 - Trinexx→TR foyer
#_00F937: db $AC ; ROOM 00AC - Blind→Thieves' lobby
#_00F938: db $0D ; ROOM 000D - Agahnim 2→self

.exit_room
#_00F939: db $C9 ; ROOM C9 - Armos→Eastern lobby
#_00F93A: db $63 ; ROOM 63 - Lanmolas→Desert 3
#_00F93B: db $77 ; ROOM 77 - Moldorm→Hera lobby
#_00F93C: db $20 ; ROOM 20 - Agahnim→self
#_00F93D: db $28 ; ROOM 28 - Arrghus→Swamp lobby
#_00F93E: db $4A ; ROOM 4A - Helmasaur→PoD lobby
#_00F93F: db $59 ; ROOM 59 - Mothula→Skull 3
#_00F940: db $98 ; ROOM 98 - Vitreous→Mire foyer
#_00F941: db $0E ; ROOM 0E - Kholdstare→Ice 1
#_00F942: db $D6 ; ROOM D6 - Trinexx→TR foyer
#_00F943: db $DB ; ROOM DB - Blind→Thieves' lobby
#_00F944: db $0D ; ROOM 0D - Agahnim 2→self

pool off

;---------------------------------------------------------------------------------------------------

PrepareDungeonExitFromBossFight:
#_00F945: JSL SaveDeathCount
#_00F949: JSL SaveDungeonKeys

#_00F94D: LDA.w $0403
#_00F950: ORA.b #$80
#_00F952: STA.w $0403

#_00F955: JSL Underworld_FlagRoomData_Quadrants

#_00F959: LDX.b #$0C

#_00F95B: LDA.b $A0

.check_next
#_00F95D: DEX

#_00F95E: CMP.l .boss_room,X
#_00F962: BNE .check_next

#_00F964: LDA.l .exit_room,X
#_00F968: STA.b $A0

#_00F96A: CMP.b #$20
#_00F96C: BNE .not_aga1

;---------------------------------------------------------------------------------------------------

#_00F96E: LDA.b #$03
#_00F970: STA.l $7EF3C5

#_00F974: LDA.l $7EF282
#_00F978: ORA.b #$20
#_00F97A: STA.l $7EF282

#_00F97E: LDA.l $7EF3CA
#_00F982: EOR.b #$40
#_00F984: STA.l $7EF3CA

#_00F988: JSL Sprite_LoadGraphicsProperties_light_world_only
#_00F98C: JSL Ancilla_TerminateSelectInteractives

#_00F990: STZ.w $037B

#_00F993: STZ.b $3C
#_00F995: STZ.b $3A

#_00F997: STZ.w $03EF

#_00F99A: LDA.b #$01
#_00F99C: STA.w $02E4

#_00F99F: LDA.b #$08
#_00F9A1: STA.w $010C

#_00F9A4: LDA.b #$15
#_00F9A6: STA.b $10

#_00F9A8: STZ.b $11
#_00F9AA: STZ.b $B0

#_00F9AC: RTL

;---------------------------------------------------------------------------------------------------

.not_aga1
#_00F9AD: CMP.b #$0D
#_00F9AF: BNE .not_aga2

#_00F9B1: LDA.b #$18
#_00F9B3: STA.b $10

#_00F9B5: STZ.b $11

#_00F9B7: STZ.w $0200

#_00F9BA: LDA.b #$20
#_00F9BC: STA.b $9A

#_00F9BE: RTL

;---------------------------------------------------------------------------------------------------

.not_aga2
#_00F9BF: CPX.b #$03
#_00F9C1: BCC .light_world_dungeon

#_00F9C3: LDA.b #$F1 ; SONG F1 - fade
#_00F9C5: STA.w $012C
#_00F9C8: STA.w $0130

#_00F9CB: LDA.b #$16
#_00F9CD: BRA .set_module

.light_world_dungeon
#_00F9CF: LDA.b #$13

.set_module
#_00F9D1: STA.b $10

#_00F9D3: LDA.b #$08
#_00F9D5: STA.w $010C

#_00F9D8: STZ.b $11
#_00F9DA: STZ.b $B0

#_00F9DC: RTL

;===================================================================================================

SaveDeathCount:
#_00F9DD: PHX

#_00F9DE: REP #$20

#_00F9E0: LDX.w $040C

#_00F9E3: LDA.l $7EF403
#_00F9E7: STA.l $7EF3E7,X

#_00F9EB: CPX.b #$08 ; DUNGEON 08
#_00F9ED: BEQ .aga_tower

#_00F9EF: LDA.w #$0000
#_00F9F2: STA.l $7EF403

.aga_tower
#_00F9F6: SEP #$20
#_00F9F8: PLX

#_00F9F9: RTL

;===================================================================================================

Module0E_0B_SaveMenu:
#_00F9FA: LDA.b $1B
#_00F9FC: BNE .indoors

#_00F9FE: JSL FlashGanonTowerPalette

.indoors
#_00FA02: JSL RenderText

#_00FA06: STZ.b $16
#_00FA08: STZ.w $0710

#_00FA0B: LDA.b $B0
#_00FA0D: CMP.b #$03
#_00FA0F: BCS .done_text_sub

#_00FA11: INC.b $B0

#_00FA13: BRA .continue

.done_text_sub
#_00FA15: STZ.b $14

.continue
#_00FA17: LDA.b $11
#_00FA19: BNE .exit

#_00FA1B: STZ.b $B0

#_00FA1D: LDA.b #$01
#_00FA1F: STA.b $14

#_00FA21: LDA.w $1CE8
#_00FA24: BEQ .dont_save

#_00FA26: LDA.b #$0F ; SFX1.0F
#_00FA28: STA.w $012D

#_00FA2B: LDA.b #$17
#_00FA2D: STA.b $10

#_00FA2F: LDA.b #$01
#_00FA31: STA.b $11

#_00FA33: STZ.w $05FC
#_00FA36: STZ.w $05FD

#_00FA39: RTL

.dont_save
#_00FA3A: LDA.w $1CF4
#_00FA3D: STA.w $1CE8

.exit
#_00FA40: RTL

;===================================================================================================

pool Sprite_LoadGraphicsProperties

.sprite_set
#_00FA41: db $00, $00, $00, $00, $00, $00, $00, $00
#_00FA49: db $00, $00, $00, $00, $00, $00, $00, $00
#_00FA51: db $00, $00, $00, $00, $00, $00, $00, $00
#_00FA59: db $00, $00, $00, $02, $02, $00, $00, $00
#_00FA61: db $00, $00, $00, $02, $02, $00, $00, $00
#_00FA69: db $00, $00, $00, $02, $02, $00, $00, $00
#_00FA71: db $00, $00, $00, $00, $00, $00, $00, $00
#_00FA79: db $00, $00, $00, $00, $00, $00, $00, $00

#_00FA81: db $07, $07, $07, $10, $10, $10, $10, $10
#_00FA89: db $07, $07, $07, $10, $10, $10, $10, $04
#_00FA91: db $06, $06, $00, $03, $03, $00, $0D, $0A
#_00FA99: db $06, $06, $01, $01, $01, $04, $05, $05
#_00FAA1: db $06, $06, $06, $01, $01, $04, $05, $05
#_00FAA9: db $06, $09, $0F, $00, $00, $0B, $0B, $05
#_00FAB1: db $08, $08, $0A, $04, $04, $04, $04, $04
#_00FAB9: db $08, $08, $0A, $04, $04, $04, $04, $04

#_00FAC1: db $07, $07, $1A, $10, $10, $10, $10, $10
#_00FAC9: db $07, $07, $1A, $10, $10, $10, $10, $04
#_00FAD1: db $06, $06, $00, $03, $03, $00, $0D, $0A
#_00FAD9: db $06, $06, $1C, $1C, $1C, $02, $05, $05
#_00FAE1: db $06, $06, $06, $1C, $1C, $00, $05, $05
#_00FAE9: db $06, $00, $0F, $00, $00, $23, $23, $05
#_00FAF1: db $1F, $1F, $0A, $20, $20, $20, $20, $20
#_00FAF9: db $1F, $1F, $0A, $20, $20, $20, $20, $20

#_00FB01: db $13, $13, $17, $14, $14, $14, $14, $14
#_00FB09: db $13, $13, $17, $14, $14, $14, $14, $16
#_00FB11: db $15, $15, $12, $13, $13, $18, $16, $16
#_00FB19: db $15, $15, $13, $26, $26, $13, $17, $17
#_00FB21: db $15, $15, $15, $26, $26, $13, $17, $17
#_00FB29: db $1B, $1D, $11, $13, $13, $18, $18, $17
#_00FB31: db $16, $16, $13, $13, $13, $19, $19, $19
#_00FB39: db $16, $16, $18, $13, $18, $19, $19, $19

.palette
#_00FB41: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB49: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB51: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB59: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB61: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB69: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB71: db $01, $01, $01, $01, $01, $01, $01, $01
#_00FB79: db $01, $01, $01, $01, $01, $01, $01, $01

#_00FB81: db $05, $05, $06, $09, $09, $09, $09, $09
#_00FB89: db $05, $05, $06, $09, $09, $09, $09, $03
#_00FB91: db $01, $01, $00, $02, $02, $00, $06, $03
#_00FB99: db $01, $01, $01, $03, $03, $03, $07, $07
#_00FBA1: db $01, $01, $01, $03, $03, $03, $07, $07
#_00FBA9: db $01, $00, $01, $00, $00, $03, $03, $07
#_00FBB1: db $04, $04, $00, $03, $03, $03, $03, $03
#_00FBB9: db $04, $04, $00, $03, $03, $03, $03, $03

#_00FBC1: db $05, $05, $06, $09, $09, $09, $09, $09
#_00FBC9: db $05, $05, $06, $09, $09, $09, $09, $03
#_00FBD1: db $01, $01, $00, $02, $02, $00, $06, $03
#_00FBD9: db $01, $01, $01, $01, $01, $03, $07, $07
#_00FBE1: db $01, $01, $01, $01, $01, $03, $07, $07
#_00FBE9: db $01, $00, $01, $00, $00, $03, $03, $07
#_00FBF1: db $04, $04, $00, $03, $03, $03, $03, $03
#_00FBF9: db $04, $04, $00, $03, $03, $03, $03, $03

#_00FC01: db $0E, $0E, $10, $0C, $0C, $0C, $0C, $0C
#_00FC09: db $0E, $0E, $10, $0C, $0C, $0C, $0C, $0A
#_00FC11: db $10, $10, $00, $0E, $0E, $00, $0D, $0A
#_00FC19: db $10, $10, $10, $0E, $0E, $0E, $0D, $0D
#_00FC21: db $10, $10, $10, $0E, $0E, $0E, $0D, $0D
#_00FC29: db $12, $00, $0B, $0E, $0E, $0E, $0E, $0D
#_00FC31: db $0F, $0F, $00, $0E, $0E, $0E, $0E, $0E
#_00FC39: db $0F, $0F, $00, $0E, $0E, $0E, $0E, $0E

pool off

;---------------------------------------------------------------------------------------------------

Sprite_LoadGraphicsProperties:
#_00FC41: PHB
#_00FC42: PHK
#_00FC43: PLB

#_00FC44: REP #$30

#_00FC46: LDY.w #$00FE
#_00FC49: LDX.w #$003E

.next_a
#_00FC4C: LDA.w .sprite_set,Y
#_00FC4F: STA.l $7EFD00,X

#_00FC53: LDA.w .palette,Y
#_00FC56: STA.l $7EFD80,X

#_00FC5A: DEY
#_00FC5B: DEY

#_00FC5C: DEX
#_00FC5D: DEX
#_00FC5E: BPL .next_a

#_00FC60: BRA .continue

;===================================================================================================

#Sprite_LoadGraphicsProperties_light_world_only:
#_00FC62: PHB
#_00FC63: PHK
#_00FC64: PLB

#_00FC65: REP #$30

.continue
#_00FC67: LDY.w #$003E

#_00FC6A: LDA.l $7EF3C5
#_00FC6E: AND.w #$00FF
#_00FC71: CMP.w #$0002
#_00FC74: BCC .start_lw

#_00FC76: LDY.w #$007E
#_00FC79: CMP.w #$0003
#_00FC7C: BNE .start_lw

#_00FC7E: LDY.w #$00BE

;---------------------------------------------------------------------------------------------------

.start_lw
#_00FC81: LDX.w #$003E

.next_b
#_00FC84: LDA.w .sprite_set,Y
#_00FC87: STA.l $7EFCC0,X

#_00FC8B: LDA.w .palette,Y
#_00FC8E: STA.l $7EFD40,X

#_00FC92: DEY
#_00FC93: DEY

#_00FC94: DEX
#_00FC95: DEX
#_00FC96: BPL .next_b

;---------------------------------------------------------------------------------------------------

#_00FC98: SEP #$30

#_00FC9A: PLB

#_00FC9B: RTL

;===================================================================================================

GFXAA2ValsOW:
#_00FC9C: db $21, $21, $21, $22, $22, $22, $22, $22
#_00FCA4: db $21, $21, $21, $22, $22, $22, $22, $27
#_00FCAC: db $23, $23, $20, $29, $29, $20, $29, $29
#_00FCB4: db $23, $23, $20, $24, $24, $27, $25, $25
#_00FCBC: db $23, $23, $23, $24, $24, $20, $25, $25
#_00FCC4: db $23, $2A, $21, $20, $20, $27, $20, $25
#_00FCCC: db $2B, $2B, $20, $27, $27, $27, $27, $27
#_00FCD4: db $2B, $2B, $20, $27, $27, $27, $27, $27
#_00FCDC: db $3E, $3E, $3E, $41, $41, $41, $41, $3C
#_00FCE4: db $3E, $3E, $3E, $41, $41, $41, $41, $40
#_00FCEC: db $3F, $3F, $30, $40, $40, $30, $40, $30
#_00FCF4: db $3F, $3F, $30, $3B, $3B, $40, $3D, $3D
#_00FCFC: db $3F, $3F, $3F, $3B, $3B, $30, $3D, $3D
#_00FD04: db $3F, $3F, $30, $30, $30, $40, $30, $3D
#_00FD0C: db $42, $42, $30, $40, $40, $42, $42, $40
#_00FD14: db $42, $42, $30, $40, $40, $42, $42, $30

;===================================================================================================

OverworldPalettesScreenToSet:
#_00FD1C: db $06, $06, $08, $07, $07, $07, $07, $07
#_00FD24: db $06, $06, $08, $07, $07, $07, $07, $04
#_00FD2C: db $08, $08, $00, $01, $01, $00, $09, $00
#_00FD34: db $08, $08, $00, $02, $02, $04, $09, $09
#_00FD3C: db $08, $08, $08, $02, $02, $00, $09, $09
#_00FD44: db $08, $08, $01, $00, $00, $04, $00, $09
#_00FD4C: db $09, $00, $00, $04, $04, $04, $04, $04
#_00FD54: db $09, $09, $00, $04, $04, $04, $04, $04
#_00FD5C: db $1B, $1B, $1E, $17, $17, $17, $17, $18
#_00FD64: db $1B, $1B, $1E, $17, $17, $17, $17, $1D
#_00FD6C: db $1E, $1E, $10, $1E, $1E, $10, $1E, $10
#_00FD74: db $1E, $1E, $10, $12, $12, $10, $1A, $1A
#_00FD7C: db $1E, $1E, $1E, $12, $12, $10, $1A, $1A
#_00FD84: db $1E, $10, $12, $10, $10, $1D, $10, $1A
#_00FD8C: db $1C, $1C, $10, $1D, $1D, $1C, $1C, $1D
#_00FD94: db $1C, $1C, $10, $1D, $1D, $1C, $1C, $10
#_00FD9C: db $0A, $0A, $0A, $0A, $02, $02, $02, $0A

;===================================================================================================

ResetStarTileGraphics:
#_00FDA4: STZ.w $04BC

;===================================================================================================

ToggleStarTileGraphics:
#_00FDA7: REP #$10

#_00FDA9: LDX.w #$0000
#_00FDAC: LDY.w #$0020

#_00FDAF: LDA.w $04BC
#_00FDB2: BEQ .already_zero

#_00FDB4: TYX
#_00FDB5: LDY.w #$0000

.already_zero
#_00FDB8: STY.b $0E

#_00FDBA: PHB

#_00FDBB: LDA.b #$7F
#_00FDBD: PHA
#_00FDBE: PLB

;---------------------------------------------------------------------------------------------------

#_00FDBF: REP #$20

#_00FDC1: LDY.w #$0000

.next_a
#_00FDC4: LDA.l $7EBDC0,X
#_00FDC8: STA.w $7F0000,Y

#_00FDCB: INX
#_00FDCC: INX

#_00FDCD: INY
#_00FDCE: INY

#_00FDCF: CPY.w #$0020
#_00FDD2: BNE .next_a

;---------------------------------------------------------------------------------------------------

#_00FDD4: LDX.b $0E

.next_b
#_00FDD6: LDA.l $7EBDC0,X
#_00FDDA: STA.w $7F0000,Y

#_00FDDD: INX
#_00FDDE: INX

#_00FDDF: INY
#_00FDE0: INY

#_00FDE1: CPY.w #$0040
#_00FDE4: BNE .next_b

;---------------------------------------------------------------------------------------------------

#_00FDE6: SEP #$30

#_00FDE8: PLB

#_00FDE9: LDA.b #$18
#_00FDEB: STA.b $17

#_00FDED: RTL

;===================================================================================================

InitializeMirrorHDMA:
#_00FDEE: STZ.b $9B

#_00FDF0: REP #$20

#_00FDF2: STZ.w $06A0
#_00FDF5: STZ.w $06AC
#_00FDF8: STZ.w $06AA
#_00FDFB: STZ.w $06AE
#_00FDFE: STZ.w $06B0

#_00FE01: LDA.w #$0008
#_00FE04: STA.w $06B4
#_00FE07: STA.w $06B6

#_00FE0A: LDA.w #$0015
#_00FE0D: STA.w $06B2

#_00FE10: LDA.w #$FFC0
#_00FE13: STA.w $06A6

#_00FE16: LDA.w #$0040
#_00FE19: STA.w $06A8

#_00FE1C: LDA.w #$FE00
#_00FE1F: STA.w $06A2

#_00FE22: LDA.w #$0200
#_00FE25: STA.w $06A4

#_00FE28: STZ.w $06AC
#_00FE2B: STZ.w $06AE

#_00FE2E: LDA.w #$0F42
#_00FE31: STA.w DMA7MODE

#_00FE34: LDA.w #$0D42
#_00FE37: STA.w DMA6MODE

#_00FE3A: LDX.b #$3E

#_00FE3C: LDA.b $E2

;===================================================================================================

InitializeHDMATable:
.next
#_00FE3E: STA.w $1B00,X
#_00FE41: STA.w $1B40,X
#_00FE44: STA.w $1B80,X
#_00FE47: STA.w $1BC0,X
#_00FE4A: STA.w $1C00,X
#_00FE4D: STA.w $1C40,X
#_00FE50: STA.w $1C80,X

#_00FE53: DEX
#_00FE54: DEX
#_00FE55: BPL .next

#_00FE57: SEP #$20

#_00FE59: LDA.b #$C0
#_00FE5B: STA.b $9B

;---------------------------------------------------------------------------------------------------

#EXIT_00FE5D:
#_00FE5D: RTL

;===================================================================================================

MirrorWarp_BuildAndEnableHDMATable:
#_00FE5E: INC.b $B0

#_00FE60: LDA.b #$C0
#_00FE62: STA.b $9B

;===================================================================================================

MirrorWarp_BuildWavingHDMATable:
#_00FE64: JSL MirrorWarp_RunAnimationSubmodules

#_00FE68: LDA.b $1A
#_00FE6A: LSR A
#_00FE6B: BCS EXIT_00FE5D

#_00FE6D: REP #$30

#_00FE6F: LDX.w #$01A0
#_00FE72: LDY.w #$01B0

#_00FE75: LDA.w #$0002
#_00FE78: STA.b $00

#_00FE7A: LDA.w #$0003
#_00FE7D: STA.b $02

;---------------------------------------------------------------------------------------------------

.next
#_00FE7F: LDA.w $1B00,X
#_00FE82: STA.w $1B00,Y
#_00FE85: STA.w $1B04,Y
#_00FE88: STA.w $1B08,Y
#_00FE8B: STA.w $1B0C,Y

#_00FE8E: TXA
#_00FE8F: SEC
#_00FE90: SBC.w #$0010
#_00FE93: TAX

#_00FE94: DEC.b $00
#_00FE96: BNE .dont_reset_a

#_00FE98: LDA.w #$0008
#_00FE9B: STA.b $00

.dont_reset_a
#_00FE9D: TYA
#_00FE9E: SEC
#_00FE9F: SBC.w #$0010
#_00FEA2: TAY

#_00FEA3: DEC.b $02
#_00FEA5: BNE .dont_reset_b

#_00FEA7: LDA.w #$0008
#_00FEAA: STA.b $02

.dont_reset_b
#_00FEAC: CPY.w #$0000
#_00FEAF: BNE .next

;---------------------------------------------------------------------------------------------------

#_00FEB1: LDX.w $06A0

#_00FEB4: LDA.w $06AC
#_00FEB7: CLC
#_00FEB8: ADC.w $06A6,X
#_00FEBB: PHA

#_00FEBC: SEC
#_00FEBD: SBC.w $06A2,X
#_00FEC0: EOR.w $06A2,X
#_00FEC3: BMI .negative

#_00FEC5: STZ.w $06AA
#_00FEC8: STZ.w $06AE

#_00FECB: LDA.w $06A0
#_00FECE: EOR.w #$0002
#_00FED1: STA.w $06A0

#_00FED4: PLA
#_00FED5: LDA.w $06A2,X

#_00FED8: PHA

.negative
#_00FED9: PLA
#_00FEDA: STA.w $06AC

#_00FEDD: CLC
#_00FEDE: ADC.w $06AE
#_00FEE1: PHA

#_00FEE2: AND.w #$00FF
#_00FEE5: STA.w $06AE

;---------------------------------------------------------------------------------------------------

#_00FEE8: PLA
#_00FEE9: BPL .positive

#_00FEEB: ORA.w #$00FF
#_00FEEE: BRA .continue_with_sign

.positive
#_00FEF0: AND.w #$FF00

.continue_with_sign
#_00FEF3: XBA
#_00FEF4: CLC
#_00FEF5: ADC.w $06AA
#_00FEF8: STA.w $06AA

#_00FEFB: TAX

#_00FEFC: LDA.l $7EC007
#_00FF00: CMP.w #$0030
#_00FF03: BCC .dont_advance

#_00FF05: TXA
#_00FF06: AND.w #$FFF8
#_00FF09: BNE .dont_advance

#_00FF0B: LDA.w #$FF00
#_00FF0E: STA.w $06A2

#_00FF11: LDA.w #$0100
#_00FF14: STA.w $06A4

#_00FF17: LDX.w #$0000

#_00FF1A: INC.b $B0

;---------------------------------------------------------------------------------------------------

.dont_advance
#_00FF1C: TXA
#_00FF1D: CLC
#_00FF1E: ADC.b $E2
#_00FF20: STA.w $1B00
#_00FF23: STA.w $1B04
#_00FF26: STA.w $1B08
#_00FF29: STA.w $1B0C

#_00FF2C: SEP #$30

;---------------------------------------------------------------------------------------------------

#EXIT_00FF2E:
#_00FF2E: RTL

;===================================================================================================

MirrorWarp_BuildDewavingHDMATable:
#_00FF2F: JSL MirrorWarp_RunAnimationSubmodules

#_00FF33: LDA.b $1A
#_00FF35: LSR A
#_00FF36: BCS EXIT_00FF2E

#_00FF38: REP #$30

#_00FF3A: LDX.w #$01A0
#_00FF3D: LDY.w #$01B0

#_00FF40: LDA.w #$0002
#_00FF43: STA.b $00

#_00FF45: LDA.w #$0003
#_00FF48: STA.b $02

;---------------------------------------------------------------------------------------------------

.next
#_00FF4A: LDA.w $1B00,X
#_00FF4D: STA.w $1B00,Y
#_00FF50: STA.w $1B04,Y
#_00FF53: STA.w $1B08,Y
#_00FF56: STA.w $1B0C,Y

#_00FF59: TXA
#_00FF5A: SEC
#_00FF5B: SBC.w #$0010
#_00FF5E: TAX

#_00FF5F: DEC.b $00
#_00FF61: BNE .dont_reset_a

#_00FF63: LDA.w #$0008
#_00FF66: STA.b $00

.dont_reset_a
#_00FF68: TYA
#_00FF69: SEC
#_00FF6A: SBC.w #$0010
#_00FF6D: TAY

#_00FF6E: DEC.b $02
#_00FF70: BNE .dont_reset_b

#_00FF72: LDA.w #$0008
#_00FF75: STA.b $02

.dont_reset_b
#_00FF77: CPY.w #$0000
#_00FF7A: BNE .next

;---------------------------------------------------------------------------------------------------

#_00FF7C: LDA.w $1C80
#_00FF7F: ORA.w $1C90
#_00FF82: ORA.w $1CA0
#_00FF85: ORA.w $1CB0

#_00FF88: CMP.b $E2
#_00FF8A: BNE .exit

#_00FF8C: SEP #$20

#_00FF8E: STZ.b $9B

#_00FF90: INC.b $B0

#_00FF92: JSL Overworld_SetFixedColAndScroll

#_00FF96: LDA.b $8A
#_00FF98: AND.b #$3F
#_00FF9A: CMP.b #$1B ; OW 1B, OW 5B
#_00FF9C: BEQ .exit

#_00FF9E: REP #$20

#_00FFA0: LDA.b $E2
#_00FFA2: STA.b $E0
#_00FFA4: STA.w $0120
#_00FFA7: STA.w $011E

#_00FFAA: LDA.b $E8
#_00FFAC: STA.b $E6
#_00FFAE: STA.w $0122
#_00FFB1: STA.w $0124

.exit
#_00FFB4: SEP #$30

#_00FFB6: RTL

;===================================================================================================
; FREE ROM: 0x09
;===================================================================================================
NULL_00FFB7:
#_00FFB7: db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

InternalROMHeader:
#_00FFC0: db "THE LEGEND OF ZELDA  "

#_00FFD5: db $20 ; ROM mapping: lorom
#_00FFD6: db $02 ; Cartridge: ROM+RAM+battery
#_00FFD7: db $0A ; ROM size: 1MB
#_00FFD8: db $03 ; RAM size: 8kB

#_00FFD9: db $01 ; Region: North America (U)
#_00FFDA: db $01 ; Header type: v2
#_00FFDB: db $00 ; Version: 1.0

#_00FFDC: dw $50F2 ; complement
#_00FFDE: dw $AF0D ; checksum

#_00FFE0: dw $FFFF ; Unused
#_00FFE2: dw $FFFF ; Unused
#_00FFE4: dw Interrupt_Unused
#_00FFE6: dw $FFFF ; BRK
#_00FFE8: dw Interrupt_Unused
#_00FFEA: dw Interrupt_NMI
#_00FFEC: dw Reset
#_00FFEE: dw Interrupt_IRQ

#_00FFF0: dw $FFFF ; Unused
#_00FFF2: dw $FFFF ; Unused
#_00FFF4: dw Interrupt_Unused
#_00FFF6: dw Interrupt_Unused
#_00FFF8: dw Interrupt_Unused
#_00FFFA: dw Interrupt_Unused
#_00FFFC: dw Reset
#_00FFFE: dw Interrupt_IRQ

;===================================================================================================
