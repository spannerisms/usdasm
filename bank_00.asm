org $008000

;===================================================================================================

Reset:
|008000| SEI

|008001| STZ.w NMITIMEN
|008004| STZ.w HDMAEN
|008007| STZ.w MDMAEN

|00800A| STZ.w APUIO0
|00800D| STZ.w APUIO1
|008010| STZ.w APUIO2
|008013| STZ.w APUIO3

|008016| LDA.b #$80
|008018| STA.w INIDISP

|00801B| CLC
|00801C| XCE

|00801D| REP #$28

|00801F| LDA.w #$0000
|008022| TCD

|008023| LDA.w #$01FF
|008026| TCS

|008027| SEP #$30

|008029| JSR LoadIntroSongBank
|00802C| JSR InitializeMemoryAndSRAM

|00802F| LDA.b #$81 ; enable NMI and auto joypad read
|008031| STA.w NMITIMEN

;===================================================================================================

MainGameLoop:
|008034| LDA.b $12
|008036| BEQ MainGameLoop

|008038| CLI

|008039| BRA .do_frame

;---------------------------------------------------------------------------------------------------

.frame_step
|00803B| LDA.b $F6
|00803D| AND.b #$20
|00803F| BEQ .L_not_pressed

|008041| INC.w $0FD7

.L_not_pressed
|008044| LDA.b $F6
|008046| AND.b #$10
|008048| BNE .do_frame

|00804A| LDA.w $0FD7
|00804D| AND.b #$01
|00804F| BNE .skip_frame

;---------------------------------------------------------------------------------------------------

.do_frame
|008051| INC.b $1A

|008053| JSR ClearOAMBuffer
|008056| JSL RunModule

.skip_frame
|00805A| JSR PrepareOAMForTransfer

|00805D| STZ.b $12

|00805F| BRA MainGameLoop

;===================================================================================================

pool RunModule

.low
|008061| db <Module00_Intro
|008062| db <Module01_FileSelect
|008063| db <Module02_CopyFile
|008064| db <Module03_KILLFile

|008065| db <Module04_NameFile
|008066| db <Module05_LoadFile
|008067| db <Module06_UnderworldLoad
|008068| db <Module07_Underworld

|008069| db <Module08_OverworldLoad
|00806A| db <Module09_Overworld
|00806B| db <Module0A_OverworldSpecialLoad
|00806C| db <Module0B_OverworldSpecial

|00806D| db <Module0C_Unused
|00806E| db <Module0D_Unused
|00806F| db <Module0E_Interface
|008070| db <Module0F_SpotlightClose

|008071| db <Module10_SpotlightOpen
|008072| db <Module11_UnderworldFallingEntrance
|008073| db <Module12_GameOver
|008074| db <Module13_PendantBossVictory

|008075| db <Module14_Attract
|008076| db <Module15_MirrorWarpFromAga
|008077| db <Module16_CrystalBossVictory
|008078| db <Module17_SaveAndQuit

|008079| db <Module18_GanonEmerges
|00807A| db <Module19_TriforceRoom
|00807B| db <Module1A_Credits
|00807C| db <Module1B_SpawnSelect

;---------------------------------------------------------------------------------------------------

.high
|00807D| db >Module00_Intro
|00807E| db >Module01_FileSelect
|00807F| db >Module02_CopyFile
|008080| db >Module03_KILLFile

|008081| db >Module04_NameFile
|008082| db >Module05_LoadFile
|008083| db >Module06_UnderworldLoad
|008084| db >Module07_Underworld

|008085| db >Module08_OverworldLoad
|008086| db >Module09_Overworld
|008087| db >Module0A_OverworldSpecialLoad
|008088| db >Module0B_OverworldSpecial

|008089| db >Module0C_Unused
|00808A| db >Module0D_Unused
|00808B| db >Module0E_Interface
|00808C| db >Module0F_SpotlightClose

|00808D| db >Module10_SpotlightOpen
|00808E| db >Module11_UnderworldFallingEntrance
|00808F| db >Module12_GameOver
|008090| db >Module13_PendantBossVictory

|008091| db >Module14_Attract
|008092| db >Module15_MirrorWarpFromAga
|008093| db >Module16_CrystalBossVictory
|008094| db >Module17_SaveAndQuit

|008095| db >Module18_GanonEmerges
|008096| db >Module19_TriforceRoom
|008097| db >Module1A_Credits
|008098| db >Module1B_SpawnSelect

;---------------------------------------------------------------------------------------------------

.bank
|008099| db ^Module00_Intro
|00809A| db ^Module01_FileSelect
|00809B| db ^Module02_CopyFile
|00809C| db ^Module03_KILLFile

|00809D| db ^Module04_NameFile
|00809E| db ^Module05_LoadFile
|00809F| db ^Module06_UnderworldLoad
|0080A0| db ^Module07_Underworld

|0080A1| db ^Module08_OverworldLoad
|0080A2| db ^Module09_Overworld
|0080A3| db ^Module0A_OverworldSpecialLoad
|0080A4| db ^Module0B_OverworldSpecial

|0080A5| db ^Module0C_Unused
|0080A6| db ^Module0D_Unused
|0080A7| db ^Module0E_Interface
|0080A8| db ^Module0F_SpotlightClose

|0080A9| db ^Module10_SpotlightOpen
|0080AA| db ^Module11_UnderworldFallingEntrance
|0080AB| db ^Module12_GameOver
|0080AC| db ^Module13_PendantBossVictory

|0080AD| db ^Module14_Attract
|0080AE| db ^Module15_MirrorWarpFromAga
|0080AF| db ^Module16_CrystalBossVictory
|0080B0| db ^Module17_SaveAndQuit

|0080B1| db ^Module18_GanonEmerges
|0080B2| db ^Module19_TriforceRoom
|0080B3| db ^Module1A_Credits
|0080B4| db ^Module1B_SpawnSelect

endpool

;---------------------------------------------------------------------------------------------------

RunModule:
|0080B5| LDY.b $10

|0080B7| LDA.w .low,Y
|0080BA| STA.b $03

|0080BC| LDA.w .high,Y
|0080BF| STA.b $04

|0080C1| LDA.w .bank,Y
|0080C4| STA.b $05

|0080C6| JML.w [$0003]

;===================================================================================================

NMI:
|0080C9| SEI
|0080CA| REP #$30

|0080CC| PHA
|0080CD| PHX
|0080CE| PHY

|0080CF| PHD
|0080D0| PHB

|0080D1| LDA.w #$0000
|0080D4| TCD

|0080D5| PHK
|0080D6| PLB

|0080D7| SEP #$30

|0080D9| LDA.w RDNMI

|0080DC| LDA.w $012C
|0080DF| BNE .song_input

|0080E1| LDA.w APUIO0
|0080E4| CMP.w $0133
|0080E7| BNE .handle_sfx1

|0080E9| STZ.w APUIO0

|0080EC| BRA .handle_sfx1

.song_input
|0080EE| CMP.w $0133
|0080F1| BEQ .handle_sfx1

|0080F3| STA.w APUIO0
|0080F6| STA.w $0133

|0080F9| CMP.b #$F2 ; SONG F2 - half volume
|0080FB| BCS .song_command

|0080FD| STA.w $0130

.song_command
|008100| STZ.w $012C

.handle_sfx1
|008103| LDA.w $012D
|008106| BNE .new_sfx1

|008108| LDA.w APUIO1
|00810B| CMP.w $0131
|00810E| BNE .handle_SFX23

|008110| STZ.w APUIO1

|008113| BRA .handle_SFX23

.new_sfx1
|008115| STA.w $0131
|008118| STA.w APUIO1

|00811B| STZ.w $012D

.handle_SFX23
|00811E| LDA.w $012E
|008121| STA.w APUIO2

|008124| LDA.w $012F
|008127| STA.w APUIO3

|00812A| STZ.w $012E
|00812D| STZ.w $012F

|008130| LDA.b #$80
|008132| STA.w INIDISP
|008135| STZ.w HDMAEN

|008138| LDA.b $12
|00813A| BNE .lag_frame

|00813C| INC.b $12

|00813E| JSR DoNMIUpdates
|008141| JSR ReadJoypad

.lag_frame
|008144| LDA.w $012A
|008147| BEQ NoIRQThread

|008149| JMP.w SwitchThread

;===================================================================================================

NoIRQThread:
|00814C| LDA.b $96
|00814E| STA.w W12SEL

|008151| LDA.b $97
|008153| STA.w W34SEL

|008156| LDA.b $98
|008158| STA.w WOBJSEL

|00815B| LDA.b $99
|00815D| STA.w CGWSEL

|008160| LDA.b $9A
|008162| STA.w CGADSUB

|008165| LDA.b $9C
|008167| STA.w COLDATA

|00816A| LDA.b $9D
|00816C| STA.w COLDATA

|00816F| LDA.b $9E
|008171| STA.w COLDATA

|008174| LDA.b $1C
|008176| STA.w TM

|008179| LDA.b $1D
|00817B| STA.w TS

|00817E| LDA.b $1E
|008180| STA.w TMW

|008183| LDA.b $1F
|008185| STA.w TSW

|008188| LDA.w $0120
|00818B| STA.w BG1HOFS

|00818E| LDA.w $0121
|008191| STA.w BG1HOFS

|008194| LDA.w $0124
|008197| STA.w BG1VOFS

|00819A| LDA.w $0125
|00819D| STA.w BG1VOFS

|0081A0| LDA.w $011E
|0081A3| STA.w BG2HOFS

|0081A6| LDA.w $011F
|0081A9| STA.w BG2HOFS

|0081AC| LDA.w $0122
|0081AF| STA.w BG2VOFS

|0081B2| LDA.w $0123
|0081B5| STA.w BG2VOFS

|0081B8| LDA.b $E4
|0081BA| STA.w BG3HOFS

|0081BD| LDA.b $E5
|0081BF| STA.w BG3HOFS

|0081C2| LDA.b $EA
|0081C4| STA.w BG3VOFS

|0081C7| LDA.b $EB
|0081C9| STA.w BG3VOFS

|0081CC| LDA.b $95
|0081CE| STA.w MOSAIC

;---------------------------------------------------------------------------------------------------

|0081D1| LDA.b $94
|0081D3| STA.w BGMODE

|0081D6| AND.b #$07
|0081D8| CMP.b #$07
|0081DA| BNE .not_mode7

|0081DC| STZ.w M7B
|0081DF| STZ.w M7B
|0081E2| STZ.w M7C
|0081E5| STZ.w M7C

|0081E8| LDA.w $0638
|0081EB| STA.w M7X

|0081EE| LDA.w $0639
|0081F1| STA.w M7X

|0081F4| LDA.w $063A
|0081F7| STA.w M7Y

|0081FA| LDA.w $063B
|0081FD| STA.w M7Y

;---------------------------------------------------------------------------------------------------

.not_mode7
|008200| LDA.w $0128
|008203| BEQ .IRQ_inactive

|008205| LDA.w TIMEUP

|008208| LDA.b #$80
|00820A| STA.w VTIMEL
|00820D| STZ.w VTIMEH

|008210| STZ.w HTIMEL
|008213| STZ.w HTIMEH

|008216| LDA.b #$A1
|008218| STA.w NMITIMEN

;---------------------------------------------------------------------------------------------------

.IRQ_inactive
|00821B| LDA.b $13
|00821D| STA.w INIDISP

|008220| LDA.b $9B
|008222| STA.w HDMAEN

|008225| REP #$30

|008227| PLB
|008228| PLD

|008229| PLY
|00822A| PLX
|00822B| PLA

;===================================================================================================

Interrupt_Unused:
|00822C| RTI

;===================================================================================================

SwitchThread:
|00822D| JSR UpdateIRQGFX

|008230| LDA.b $FF
|008232| STA.w VTIMEL
|008235| STZ.w VTIMEH

|008238| LDA.b #$A1 ; enable NMI, IRQ, auto joypad
|00823A| STA.w NMITIMEN

|00823D| LDA.b $96
|00823F| STA.w W12SEL

|008242| LDA.b $97
|008244| STA.w W34SEL

|008247| LDA.b $98
|008249| STA.w WOBJSEL

|00824C| LDA.b $99
|00824E| STA.w CGWSEL

|008251| LDA.b $9A
|008253| STA.w CGADSUB

|008256| LDA.b $9C
|008258| STA.w COLDATA

|00825B| LDA.b $9D
|00825D| STA.w COLDATA

|008260| LDA.b $9E
|008262| STA.w COLDATA

|008265| LDA.b $1C
|008267| STA.w TM

|00826A| LDA.b $1D
|00826C| STA.w TS

|00826F| LDA.b $1E
|008271| STA.w TMW

|008274| LDA.b $1F
|008276| STA.w TSW

;---------------------------------------------------------------------------------------------------

|008279| LDA.w $0120
|00827C| STA.w BG1HOFS

|00827F| LDA.w $0121
|008282| STA.w BG1HOFS

|008285| LDA.w $0124
|008288| STA.w BG1VOFS

|00828B| LDA.w $0125
|00828E| STA.w BG1VOFS

|008291| LDA.w $011E
|008294| STA.w BG2HOFS

|008297| LDA.w $011F
|00829A| STA.w BG2HOFS

|00829D| LDA.w $0122
|0082A0| STA.w BG2VOFS

|0082A3| LDA.w $0123
|0082A6| STA.w BG2VOFS

|0082A9| LDA.b $E4
|0082AB| STA.w BG3HOFS

|0082AE| LDA.b $E5
|0082B0| STA.w BG3HOFS

|0082B3| LDA.b $EA
|0082B5| STA.w BG3VOFS

|0082B8| LDA.b $EB
|0082BA| STA.w BG3VOFS

|0082BD| LDA.b $13
|0082BF| STA.w INIDISP

|0082C2| LDA.b $9B
|0082C4| STA.w HDMAEN

;---------------------------------------------------------------------------------------------------

|0082C7| REP #$30

|0082C9| TSC
|0082CA| TAX

|0082CB| LDA.w $1F0A
|0082CE| TCS

|0082CF| STX.w $1F0A

|0082D2| PLB
|0082D3| PLD

|0082D4| PLY
|0082D5| PLX
|0082D6| PLA

|0082D7| RTI

;===================================================================================================

IRQ:
|0082D8| SEI
|0082D9| REP #$30

|0082DB| PHA
|0082DC| PHX
|0082DD| PHY

|0082DE| PHD
|0082DF| PHB

|0082E0| PHK
|0082E1| PLB

|0082E2| SEP #$30

|0082E4| LDA.w $012A
|0082E7| BNE .polyhedral

|0082E9| LDA.w TIMEUP
|0082EC| BPL .exit

|0082EE| LDA.w $0128
|0082F1| BEQ .exit

.wait_for_hblank
|0082F3| BIT.w HVBJOY
|0082F6| BVC .wait_for_hblank

|0082F8| LDA.w $0630
|0082FB| STA.w BG3HOFS

|0082FE| LDA.w $0631
|008301| STA.w BG3HOFS

|008304| STZ.w BG3VOFS
|008307| STZ.w BG3VOFS

|00830A| LDA.w $0128
|00830D| BPL .exit

|00830F| STZ.w $0128

|008312| LDA.b #$81
|008314| STA.w NMITIMEN

.exit
|008317| REP #$30

|008319| PLB
|00831A| PLD

|00831B| PLY
|00831C| PLX
|00831D| PLA

|00831E| RTI

;---------------------------------------------------------------------------------------------------

.polyhedral
|00831F| LDA.w TIMEUP

|008322| REP #$30

|008324| TSC
|008325| TAX

|008326| LDA.w $1F0A
|008329| TCS

|00832A| STX.w $1F0A

|00832D| PLB
|00832E| PLD

|00832F| PLY
|008330| PLX
|008331| PLA

|008332| RTI

;===================================================================================================

EraseTilemaps_bg3:
|008333| REP #$20

|008335| LDA.w #$00A9
|008338| STA.b $02

|00833A| LDA.w #$007F

|00833D| BRA EraseTilemaps

;---------------------------------------------------------------------------------------------------

EraseTilemaps_dungeonmap:
|00833F| REP #$20

|008341| LDA.w #$007F
|008344| STA.b $02

|008346| LDA.w #$0300

|008349| BRA EraseTilemaps

;---------------------------------------------------------------------------------------------------

EraseTilemaps_normal:
|00834B| REP #$20

|00834D| LDA.w #$007F
|008350| STA.b $02

|008352| LDA.w #$01EC

;---------------------------------------------------------------------------------------------------

EraseTilemaps:
|008355| STA.b $00

|008357| STZ.w VMAIN
|00835A| STZ.w VMADDR

|00835D| LDA.w #$1808
|008360| STA.w DMA1MODE

|008363| STZ.w DMA1ADDRB

|008366| LDA.w #$0000
|008369| STA.w DMA1ADDRL

|00836C| LDA.w #$2000
|00836F| STA.w DMA1SIZE

|008372| LDY.b #$02
|008374| STY.w MDMAEN

|008377| LDX.b #$80
|008379| STX.w VMAIN

|00837C| STZ.w VMADDR

|00837F| STA.w DMA1SIZE

|008382| LDA.w #$1908
|008385| STA.w DMA1MODE

|008388| LDA.w #$0001
|00838B| STA.w DMA1ADDRL

|00838E| STY.w MDMAEN

;---------------------------------------------------------------------------------------------------

|008391| LDA.b $02
|008393| STA.b $00

|008395| STZ.w VMAIN

|008398| LDA.w #$6000 ; VRAM $C000
|00839B| STA.w VMADDR

|00839E| LDA.w #$1808
|0083A1| STA.w DMA1MODE

|0083A4| LDA.w #$0000
|0083A7| STA.w DMA1ADDRL

|0083AA| LDA.w #$0800
|0083AD| STA.w DMA1SIZE

|0083B0| STY.w MDMAEN

|0083B3| STX.w VMAIN
|0083B6| STA.w DMA1SIZE

|0083B9| LDA.w #$6000 ; VRAM $C000
|0083BC| STA.w VMADDR

|0083BF| LDA.w #$1908
|0083C2| STA.w DMA1MODE

|0083C5| LDA.w #$0001
|0083C8| STA.w DMA1ADDRL

|0083CB| STY.w MDMAEN

|0083CE| SEP #$20

|0083D0| RTL

;===================================================================================================

ReadJoypad:
|0083D1| STZ.w JOYPAD

|0083D4| LDA.w JOY1L
|0083D7| STA.b $00

|0083D9| LDA.w JOY1H
|0083DC| STA.b $01

|0083DE| LDA.b $00
|0083E0| STA.b $F2

|0083E2| TAY

|0083E3| EOR.b $FA
|0083E5| AND.b $F2
|0083E7| STA.b $F6

|0083E9| STY.b $FA

|0083EB| LDA.b $01
|0083ED| STA.b $F0

|0083EF| TAY

|0083F0| EOR.b $F8
|0083F2| AND.b $F0
|0083F4| STA.b $F4

|0083F6| STY.b $F8

;===================================================================================================

#Player2JoypadReturn:
|0083F8| RTS

;---------------------------------------------------------------------------------------------------

|0083F9| LDA.w JOY2L
|0083FC| STA.b $00

|0083FE| LDA.w JOY2H
|008401| STA.b $01

|008403| LDA.b $00
|008405| STA.b $F3

|008407| TAY

|008408| EOR.b $FB
|00840A| AND.b $F3
|00840C| STA.b $F7

|00840E| STY.b $FB

|008410| LDA.b $01
|008412| STA.b $F1

|008414| TAY

|008415| EOR.b $F9
|008417| AND.b $F1
|008419| STA.b $F5

|00841B| STY.b $F9

|00841D| RTS

;===================================================================================================

ClearOAMBuffer:
|00841E| LDX.b #$60

.next
|008420| LDA.b #$F0
|008422| STA.w $0801,X
|008425| STA.w $0805,X
|008428| STA.w $0809,X
|00842B| STA.w $080D,X

|00842E| STA.w $0811,X
|008431| STA.w $0815,X
|008434| STA.w $0819,X
|008437| STA.w $081D,X

|00843A| STA.w $0881,X
|00843D| STA.w $0885,X
|008440| STA.w $0889,X
|008443| STA.w $088D,X

|008446| STA.w $0891,X
|008449| STA.w $0895,X
|00844C| STA.w $0899,X
|00844F| STA.w $089D,X

|008452| STA.w $0901,X
|008455| STA.w $0905,X
|008458| STA.w $0909,X
|00845B| STA.w $090D,X

|00845E| STA.w $0911,X
|008461| STA.w $0915,X
|008464| STA.w $0919,X
|008467| STA.w $091D,X

|00846A| STA.w $0981,X
|00846D| STA.w $0985,X
|008470| STA.w $0989,X
|008473| STA.w $098D,X

|008476| STA.w $0991,X
|008479| STA.w $0995,X
|00847C| STA.w $0999,X
|00847F| STA.w $099D,X

|008482| TXA
|008483| SEC
|008484| SBC.b #$20
|008486| TAX

|008487| BPL .next

|008489| RTS

;===================================================================================================

SaveFileOffsets:
|00848A| dw $700000

;---------------------------------------------------------------------------------------------------

SaveFileCopyOffsets:
|00848C| dw $700000, $700500
|008490| dw $700A00, $700F00

;===================================================================================================

PushblockGfxPointers:
|008494| dw $7EA480 ; 4/4
|008496| dw $7EA4C0 ; 3/4
|008498| dw $7EA500 ; 2/4
|00849A| dw $7EA540 ; 1/4

;---------------------------------------------------------------------------------------------------

SwordGfxPointers:
|00849C| dw $7E9000, $7E9020, $7E9060, $7E91E0 ; vertical, slash1, left-up, horizontal
|0084A4| dw $7E90A0, $7E90C0, $7E9100, $7E9140 ; up-left, slash2, slash whiff, slash3

;---------------------------------------------------------------------------------------------------

ShieldGfxPointers:
|0084AC| dw $7E9300 ; down
|0084AE| dw $7E9340 ; up
|0084B0| dw $7E9380 ; side

;---------------------------------------------------------------------------------------------------

LinkItemGfxPointers:
|0084B2| dw $7E9480, $7E94C0, $7E94E0, $7E95C0 ; rod
|0084BA| dw $7E9500, $7E9520, $7E9540, $7E9480 ; rod
|0084C2| dw $7E9640, $7E9680, $7E96A0, $7E9780 ; hammer
|0084CA| dw $7E96C0, $7E96E0, $7E9700, $7E9480 ; hammer

|0084D2| dw $7E9800, $7E9840, $7E98A0, $7E9480 ; bow
|0084DA| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|0084E2| dw $7E9AC0, $7E9B00, $7E9480, $7E9480 ; hookshot tip
|0084EA| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

|0084F2| dw $7E9BC0, $7E9C00, $7E9C40, $7E9C80 ; net
|0084FA| dw $7E9CC0, $7E9D00, $7E9D40, $7E9480 ; net
|008502| dw $7E9F40, $7E9F80, $7E9FC0, $7E9FE0 ; cane
|00850A| dw $7EA000, $7E9480, $7E9480, $7E9480 ; cane

|008512| dw $7EA100, $7E9480, $7E9480, $7E9480 ; book
|00851A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|008522| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00852A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

|008532| dw $7E98C0, $7E9900, $7E99C0, $7E99E0 ; shovel, ZZzzzz
|00853A| dw $7E9A00, $7E9A20, $7E9A40, $7E9A60 ; Zzzzz, ♪
|008542| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00854A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

|008552| dw $7E9A80, $7E9480, $7E9480, $7E9480 ; sprinkles
|00855A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|008562| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00856A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

|008572| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00857A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|008582| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00858A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

|008592| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|00859A| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|0085A2| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null
|0085AA| dw $7E9480, $7E9480, $7E9480, $7E9480 ; null

;---------------------------------------------------------------------------------------------------

.offsets
|0085B2| dw $00E0, $00E0, $0060, $0080
|0085BA| dw $01C0, $00E0, $0040, $0000
|0085C2| dw $0080, $0000, $0040, $0000
|0085CA| dw $0000, $0000, $0000, $0000

;===================================================================================================

RupeeTile:

.step
|0085D2| dw $000E
|0085D4| dw $0004
|0085D6| dw $0006
|0085D8| dw $0010
|0085DA| dw $0006
|0085DC| dw $0008

.offset
|0085DE| dw $0000, $0020, $0040, $0000
|0085E6| dw $0020, $0040, $0000, $0040
|0085EE| dw $0080, $0000, $0040, $0080

;===================================================================================================

StarTileOffset:
|0085F6| dw $7EB340
|0085F8| dw $7EB400
|0085FA| dw $7EB4C0

;===================================================================================================

PrepareOAMForTransfer:
|0085FC| LDY.b #$1C

.next_block
|0085FE| TYA
|0085FF| ASL A
|008600| ASL A
|008601| TAX

|008602| LDA.w $0A23,X
|008605| ASL A
|008606| ASL A

|008607| ORA.w $0A22,X
|00860A| ASL A
|00860B| ASL A

|00860C| ORA.w $0A21,X
|00860F| ASL A
|008610| ASL A

|008611| ORA.w $0A20,X
|008614| STA.w $0A00,Y

|008617| LDA.w $0A27,X
|00861A| ASL A
|00861B| ASL A

|00861C| ORA.w $0A26,X
|00861F| ASL A
|008620| ASL A

|008621| ORA.w $0A25,X
|008624| ASL A
|008625| ASL A

|008626| ORA.w $0A24,X
|008629| STA.w $0A01,Y

|00862C| LDA.w $0A2B,X
|00862F| ASL A
|008630| ASL A

|008631| ORA.w $0A2A,X
|008634| ASL A
|008635| ASL A

|008636| ORA.w $0A29,X
|008639| ASL A
|00863A| ASL A

|00863B| ORA.w $0A28,X
|00863E| STA.w $0A02,Y

|008641| LDA.w $0A2F,X
|008644| ASL A
|008645| ASL A

|008646| ORA.w $0A2E,X
|008649| ASL A
|00864A| ASL A

|00864B| ORA.w $0A2D,X
|00864E| ASL A
|00864F| ASL A

|008650| ORA.w $0A2C,X
|008653| STA.w $0A03,Y

|008656| DEY
|008657| DEY
|008658| DEY
|008659| DEY
|00865A| BPL .next_block

;---------------------------------------------------------------------------------------------------

|00865C| REP #$31

|00865E| LDX.w $0100

|008661| LDA.w LinkOAM_HeadAddresses,X
|008664| STA.w $0ACC

|008667| ADC.w #$0200
|00866A| STA.w $0ACE

|00866D| LDA.w LinkOAM_BodyAddresses,X
|008670| STA.w $0AD0

|008673| CLC
|008674| ADC.w #$0200
|008677| STA.w $0AD2

|00867A| LDX.w $0102

|00867D| LDA.w LinkOAM_AuxAddresses,X
|008680| STA.w $0AD4

|008683| LDX.w $0104

|008686| LDA.w LinkOAM_AuxAddresses,X
|008689| STA.w $0AD6

|00868C| SEP #$10

|00868E| LDX.w $0107

|008691| LDA.w SwordGfxPointers,X
|008694| STA.w $0AC0

|008697| CLC
|008698| ADC.w #$0180
|00869B| STA.w $0AC2

|00869E| LDX.w $0108

|0086A1| LDA.w ShieldGfxPointers,X
|0086A4| STA.w $0AC4

|0086A7| CLC
|0086A8| ADC.w #$00C0
|0086AB| STA.w $0AC6

|0086AE| LDA.w $0109
|0086B1| AND.w #$00F8
|0086B4| LSR A
|0086B5| LSR A
|0086B6| TAY

|0086B7| LDA.w $0109
|0086BA| ASL A
|0086BB| TAX

|0086BC| LDA.w LinkItemGfxPointers,X
|0086BF| STA.w $0AC8

|0086C2| CLC
|0086C3| TYX
|0086C4| ADC.w LinkItemGfxPointers.offsets,X
|0086C7| STA.w $0ACA

|0086CA| LDA.w $02C3
|0086CD| AND.w #$0003
|0086D0| ASL A
|0086D1| TAX

|0086D2| LDA.w PushblockGfxPointers,X
|0086D5| STA.w $0AD8

|0086D8| CLC
|0086D9| ADC.w #$0100
|0086DC| STA.w $0ADA

;---------------------------------------------------------------------------------------------------

|0086DF| LDA.l $7EC00D
|0086E3| DEC A
|0086E4| STA.l $7EC00D
|0086E8| BNE .dont_animate_bg

|0086EA| LDA.w #$0009

|0086ED| LDX.b $8C
|0086EF| CPX.b #$B5 ; OW B5
|0086F1| BEQ .use_longer_timer

|0086F3| CPX.b #$BC ; OW BC
|0086F5| BNE .use_shorter_timer

.use_longer_timer
|0086F7| LDA.w #$0017

.use_shorter_timer
|0086FA| STA.l $7EC00D

|0086FE| LDA.l $7EC00F
|008702| CLC
|008703| ADC.w #$0400
|008706| CMP.w #$0C00
|008709| BNE .dont_reset_rupees_tiles

|00870B| LDA.w #$0000

.dont_reset_rupees_tiles
|00870E| STA.l $7EC00F

|008712| CLC
|008713| ADC.w #$7EA680
|008716| STA.w $0ADC

.dont_animate_bg
|008719| LDA.l $7EC013
|00871D| DEC A
|00871E| STA.l $7EC013
|008722| BNE .dont_animate_rupee

|008724| LDA.l $7EC015
|008728| TAX

|008729| INX
|00872A| INX

|00872B| CPX.b #$0C
|00872D| BNE .rupee_step_fine

|00872F| LDX.b #$00

.rupee_step_fine
|008731| TXA
|008732| STA.l $7EC015

|008736| LDA.w RupeeTile.step,X
|008739| STA.l $7EC013

|00873D| LDA.w #$7EB280
|008740| CLC
|008741| ADC.w RupeeTile.offset,X
|008744| STA.w $0AE0

|008747| CLC
|008748| ADC.w #$0060
|00874B| STA.w $0AE2

.dont_animate_rupee
|00874E| LDA.w $0AE8
|008751| ASL A
|008752| ADC.w #$7EB940
|008755| STA.w $0AEC

|008758| ADC.w #$0200
|00875B| STA.w $0AEE

|00875E| LDA.w $0AEA
|008761| ASL A
|008762| ADC.w #$7EB940
|008765| STA.w $0AF0

|008768| ADC.w #$0200
|00876B| STA.w $0AF2

|00876E| LDA.w $0AF4
|008771| ASL A
|008772| ADC.w #$7EB540
|008775| STA.w $0AF6

|008778| ADC.w #$0200
|00877B| STA.w $0AF8

|00877E| SEP #$20

|008780| RTS

;===================================================================================================

JumpTableLocal:
|008781| STY.b $03

|008783| PLY
|008784| STY.b $00

|008786| REP #$30

|008788| AND.w #$00FF
|00878B| ASL A
|00878C| TAY

|00878D| PLA
|00878E| STA.b $01

|008790| INY

|008791| LDA.b [$00],Y
|008793| STA.b $00

|008795| SEP #$30

|008797| LDY.b $03

|008799| JML.w [$0000]

;===================================================================================================

JumpTableLong:
|00879C| STY.b $05

|00879E| PLY
|00879F| STY.b $02

|0087A1| REP #$30

|0087A3| AND.w #$00FF
|0087A6| STA.b $03

|0087A8| ASL A
|0087A9| ADC.b $03
|0087AB| TAY

|0087AC| PLA
|0087AD| STA.b $03

|0087AF| INY

|0087B0| LDA.b [$02],Y
|0087B2| STA.b $00

|0087B4| INY

|0087B5| LDA.b [$02],Y
|0087B7| STA.b $01

|0087B9| SEP #$30

|0087BB| LDY.b $05

|0087BD| JML.w [$0000]

;===================================================================================================

InitializeMemoryAndSRAM:
|0087C0| REP #$30

|0087C2| LDY.w $01FE

|0087C5| LDX.w #$03FE
|0087C8| LDA.w #$0000

.clear_wram
|0087CB| STA.w $0000,X
|0087CE| STA.w $0400,X
|0087D1| STA.w $0800,X
|0087D4| STA.w $0C00,X

|0087D7| STA.w $1000,X
|0087DA| STA.w $1400,X
|0087DD| STA.w $1800,X
|0087E0| STA.w $1C00,X

|0087E3| DEX
|0087E4| DEX
|0087E5| BNE .clear_wram

;---------------------------------------------------------------------------------------------------

|0087E7| STA.l $7EC500 ; writes RGB: #000000
|0087EB| STA.l $701FFE ; not selecting any save file

|0087EF| LDA.l $7003E5
|0087F3| CMP.w #$55AA
|0087F6| BEQ .sram1_valid

|0087F8| LDA.w #$0000
|0087FB| STA.l $7003E5

.sram1_valid
|0087FF| LDA.l $7008E5
|008803| CMP.w #$55AA
|008806| BEQ .sram2_valid

|008808| LDA.w #$0000
|00880B| STA.l $7008E5

.sram2_valid
|00880F| LDA.l $700DE5
|008813| CMP.w #$55AA
|008816| BEQ .sram3_valid

|008818| LDA.w #$0000
|00881B| STA.l $700DE5

.sram3_valid
|00881F| STY.w $01FE

|008822| STZ.w TMW

|008825| SEP #$30

|008827| LDA.b #$80
|008829| STA.b $13

|00882B| INC.b $15

|00882D| RTS

;===================================================================================================

GetOverworldTileType:
|00882E| REP #$30

|008830| LDA.b $00
|008832| SEC
|008833| SBC.w $0708
|008836| AND.w $070A

|008839| ASL A
|00883A| ASL A
|00883B| ASL A

|00883C| STA.b $06

|00883E| LDA.b $02
|008840| SEC
|008841| SBC.w $070C
|008844| AND.w $070E
|008847| ORA.b $06
|008849| TAX

|00884A| LDA.l $7E2000,X
|00884E| ASL A
|00884F| ASL A
|008850| STA.b $06

|008852| LDA.b $00
|008854| AND.w #$0008
|008857| LSR A
|008858| LSR A
|008859| TSB.b $06

|00885B| LDA.b $02
|00885D| AND.w #$0001
|008860| ORA.b $06
|008862| ASL A
|008863| TAX

|008864| LDA.l Map16Definitions,X
|008868| STA.b $06

|00886A| AND.w #$01FF
|00886D| TAX

|00886E| LDA.l OverworldTileTypes,X

;---------------------------------------------------------------------------------------------------

|008872| SEP #$30

|008874| CMP.b #$10
|008876| BCC .exit

|008878| CMP.b #$1C
|00887A| BCS .exit

|00887C| STA.b $06

|00887E| LDA.b $07
|008880| AND.b #$40

|008882| ASL A
|008883| ROL A
|008884| ROL A
|008885| ORA.b $06

.exit
|008887| RTL

;===================================================================================================

LoadSongBank:
|008888| PHP

|008889| REP #$30

|00888B| LDY.w #$0000
|00888E| LDA.w #$BBAA

.apu_not_ready
|008891| CMP.w APUIO0
|008894| BNE .apu_not_ready

|008896| SEP #$20

|008898| LDA.b #$CC
|00889A| BRA .setup_transfer

;---------------------------------------------------------------------------------------------------

.next_transfer
|00889C| LDA.b [$00],Y

|00889E| INY

|00889F| XBA
|0088A0| LDA.b #$00
|0088A2| BRA .write_zero

.next_byte
|0088A4| XBA
|0088A5| LDA.b [$00],Y

|0088A7| INY
|0088A8| CPY.w #$8000
|0088AB| BNE .no_bank_wrap

|0088AD| LDY.w #$0000

|0088B0| INC.b $02

.no_bank_wrap
|0088B2| XBA

.wait_for_sync_a
|0088B3| CMP.w APUIO0
|0088B6| BNE .wait_for_sync_a

|0088B8| INC A

.write_zero
|0088B9| REP #$20

|0088BB| STA.w APUIO0

|0088BE| SEP #$20

|0088C0| DEX
|0088C1| BNE .next_byte

.wait_for_sync_b
|0088C3| CMP.w APUIO0
|0088C6| BNE .wait_for_sync_b

.make_A_nonzero
|0088C8| ADC.b #$03
|0088CA| BEQ .make_A_nonzero

;---------------------------------------------------------------------------------------------------

.setup_transfer
|0088CC| PHA

|0088CD| REP #$20

|0088CF| LDA.b [$00],Y
|0088D1| INY
|0088D2| INY
|0088D3| TAX

|0088D4| LDA.b [$00],Y
|0088D6| INY
|0088D7| INY
|0088D8| STA.w APUIO2

|0088DB| SEP #$20

|0088DD| CPX.w #$0001

|0088E0| LDA.b #$00
|0088E2| ROL A
|0088E3| STA.w APUIO1

|0088E6| ADC.b #$7F
|0088E8| PLA
|0088E9| STA.w APUIO0

.wait_for_sync_c
|0088EC| CMP.w APUIO0
|0088EF| BNE .wait_for_sync_c

|0088F1| BVS .next_transfer

;---------------------------------------------------------------------------------------------------

|0088F3| STZ.w APUIO0
|0088F6| STZ.w APUIO1
|0088F9| STZ.w APUIO2
|0088FC| STZ.w APUIO3

|0088FF| PLP

|008900| RTS

;===================================================================================================

LoadIntroSongBank:
|008901| LDA.b #SamplePointers
|008903| STA.b $00

|008905| LDA.b #>SamplePointers
|008907| STA.b $01

|008909| LDA.b #^SamplePointers
|00890B| STA.b $02

|00890D| SEI

|00890E| JSR LoadSongBank

|008911| CLI

|008912| RTS

;===================================================================================================

LoadOverworldSongs:
|008913| LDA.b #SongBank_Overworld_Main
|008915| STA.b $00

|008917| LDA.b #>SongBank_Overworld_Main
|008919| STA.b $01

|00891B| LDA.b #^SongBank_Overworld_Main

;---------------------------------------------------------------------------------------------------

PrepareAPUTransfer:
|00891D| STA.b $02

|00891F| SEI

|008920| JSR LoadSongBank

|008923| CLI

|008924| RTL

;===================================================================================================

LoadUnderworldSongs:
|008925| LDA.b #SongBank_Underworld_Main
|008927| STA.b $00

|008929| LDA.b #>SongBank_Underworld_Main
|00892B| STA.b $01

|00892D| LDA.b #^SongBank_Underworld_Main
|00892F| BRA PrepareAPUTransfer

;===================================================================================================

LoadCreditsSongs:
|008931| LDA.b #SongBank_Credits_Main
|008933| STA.b $00

|008935| LDA.b #>SongBank_Credits_Main
|008937| STA.b $01

|008939| LDA.b #^SongBank_Credits_Main
|00893B| BRA PrepareAPUTransfer

;===================================================================================================

EnableForceBlank:
|00893D| LDA.b #$80
|00893F| STA.w INIDISP
|008942| STA.b $13

|008944| STZ.w HDMAEN
|008947| STZ.b $9B

|008949| RTL

;===================================================================================================

SaveGameFile:
|00894A| PHB

|00894B| LDA.b #$70
|00894D| PHA
|00894E| PLB

|00894F| REP #$30

|008951| LDX.w $701FFE

|008954| LDA.l SaveFileOffsets,X
|008958| TAY

|008959| PHY

|00895A| LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.write_save
|00895D| LDA.l $7EF000,X
|008961| STA.w $700000,Y
|008964| STA.w $700F00,Y

|008967| LDA.l $7EF100,X
|00896B| STA.w $700100,Y
|00896E| STA.w $701000,Y

|008971| LDA.l $7EF200,X
|008975| STA.w $700200,Y
|008978| STA.w $701100,Y

|00897B| LDA.l $7EF300,X
|00897F| STA.w $700300,Y
|008982| STA.w $701200,Y

|008985| LDA.l $7EF400,X
|008989| STA.w $700400,Y
|00898C| STA.w $701300,Y

|00898F| INY
|008990| INY

|008991| INX
|008992| INX

|008993| CPX.w #$0100
|008996| BNE .write_save

;---------------------------------------------------------------------------------------------------

|008998| LDX.w #$0000
|00899B| TXA

.calc_checksum
|00899C| CLC
|00899D| ADC.l $7EF000,X

|0089A1| INX
|0089A2| INX
|0089A3| CPX.w #$04FE
|0089A6| BNE .calc_checksum

|0089A8| STA.b $00

|0089AA| PLY

|0089AB| LDA.w #$5A5A
|0089AE| SEC
|0089AF| SBC.b $00
|0089B1| STA.l $7EF4FE

|0089B5| TYX

|0089B6| STA.l $7004FE,X
|0089BA| STA.l $7013FE,X

|0089BE| SEP #$30

|0089C0| PLB

|0089C1| RTL

;===================================================================================================
; FREE ROM: 0x1E
;===================================================================================================
NULL_0089C2:
|0089C2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0089CA| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0089D2| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0089DA| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

DoNMIUpdates:
|0089E0| REP #$10

|0089E2| LDA.b #$80
|0089E4| STA.w VMAIN

|0089E7| LDA.w $0710
|0089EA| BEQ .do_sprite_updates

|0089EC| JMP.w .skip_sprite_updates

;---------------------------------------------------------------------------------------------------

.do_sprite_updates
|0089EF| LDX.w #$1801
|0089F2| STX.w DMA0MODE
|0089F5| STX.w DMA1MODE
|0089F8| STX.w DMA2MODE
|0089FB| STX.w DMA3MODE
|0089FE| STX.w DMA4MODE

|008A01| LDA.b #^LinkGraphics
|008A03| STA.w DMA0ADDRB
|008A06| STA.w DMA1ADDRB
|008A09| STA.w DMA2ADDRB

|008A0C| LDY.w #$4100 ; VRAM $8200
|008A0F| STY.w VMADDR

|008A12| LDY.w $0ACE
|008A15| STY.w DMA0ADDRL

|008A18| LDX.w #$0040
|008A1B| STX.w DMA0SIZE

|008A1E| LDY.w $0AD2
|008A21| STY.w DMA1ADDRL
|008A24| STX.w DMA1SIZE

|008A27| LDY.w $0AD6
|008A2A| STY.w DMA2ADDRL

|008A2D| LDY.w #$0020
|008A30| STY.w DMA2SIZE

|008A33| LDA.b #$07
|008A35| STA.w MDMAEN

|008A38| STY.w DMA2SIZE

|008A3B| LDY.w #$4000 ; VRAM $8000
|008A3E| STY.w VMADDR

|008A41| LDY.w $0ACC
|008A44| STY.w DMA0ADDRL
|008A47| STX.w DMA0SIZE

|008A4A| LDY.w $0AD0
|008A4D| STY.w DMA1ADDRL
|008A50| STX.w DMA1SIZE

|008A53| LDY.w $0AD4
|008A56| STY.w DMA2ADDRL

|008A59| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

|008A5C| LDA.b #$7E
|008A5E| STA.w DMA0ADDRB
|008A61| STA.w DMA1ADDRB
|008A64| STA.w DMA2ADDRB
|008A67| STA.w DMA3ADDRB
|008A6A| STA.w DMA4ADDRB

|008A6D| LDY.w $0AC0
|008A70| STY.w DMA0ADDRL
|008A73| STX.w DMA0SIZE

|008A76| LDY.w $0AC4
|008A79| STY.w DMA1ADDRL
|008A7C| STX.w DMA1SIZE

|008A7F| LDY.w $0AC8
|008A82| STY.w DMA2ADDRL
|008A85| STX.w DMA2SIZE

|008A88| LDY.w $0AE0
|008A8B| STY.w DMA3ADDRL

|008A8E| LDY.w #$0020
|008A91| STY.w DMA3SIZE

|008A94| LDY.w $0AD8
|008A97| STY.w DMA4ADDRL
|008A9A| STX.w DMA4SIZE

|008A9D| LDA.b #$1F
|008A9F| STA.w MDMAEN

|008AA2| LDY.w #$4150 ; VRAM $82A0
|008AA5| STY.w VMADDR

|008AA8| LDY.w $0AC2
|008AAB| STY.w DMA0ADDRL
|008AAE| STX.w DMA0SIZE

|008AB1| LDY.w $0AC6
|008AB4| STY.w DMA1ADDRL
|008AB7| STX.w DMA1SIZE

|008ABA| LDY.w $0ACA
|008ABD| STY.w DMA2ADDRL
|008AC0| STX.w DMA2SIZE

|008AC3| LDY.w $0AE2
|008AC6| STY.w DMA3ADDRL

|008AC9| LDY.w #$0020
|008ACC| STY.w DMA3SIZE

|008ACF| LDY.w $0ADA
|008AD2| STY.w DMA4ADDRL
|008AD5| STX.w DMA4SIZE

|008AD8| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

|008ADB| LDY.w #$4200 ; VRAM $8400
|008ADE| STY.w VMADDR

|008AE1| LDY.w $0AEC
|008AE4| STY.w DMA0ADDRL
|008AE7| STX.w DMA0SIZE

|008AEA| LDY.w $0AF0
|008AED| STY.w DMA1ADDRL
|008AF0| STX.w DMA1SIZE

|008AF3| LDY.w #$7EBD40
|008AF6| STY.w DMA2ADDRL
|008AF9| STX.w DMA2SIZE

|008AFC| LDA.b #$07
|008AFE| STA.w MDMAEN

|008B01| LDY.w #$4300 ; VRAM $8600
|008B04| STY.w VMADDR

|008B07| LDY.w $0AEE
|008B0A| STY.w DMA0ADDRL
|008B0D| STX.w DMA0SIZE

|008B10| LDY.w $0AF2
|008B13| STY.w DMA1ADDRL
|008B16| STX.w DMA1SIZE

|008B19| LDY.w #$7EBD80
|008B1C| STY.w DMA2ADDRL
|008B1F| STX.w DMA2SIZE

|008B22| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

|008B25| LDA.w $0AF4
|008B28| BEQ .no_update_swagduck

|008B2A| LDY.w #$40E0 ; VRAM $81C0
|008B2D| STY.w VMADDR

|008B30| LDY.w $0AF6
|008B33| STY.w DMA0ADDRL
|008B36| STX.w DMA0SIZE

|008B39| LDA.b #$01
|008B3B| STA.w MDMAEN

|008B3E| LDY.w #$41E0 ; VRAM $83C0
|008B41| STY.w VMADDR

|008B44| LDY.w $0AF8
|008B47| STY.w DMA0ADDRL
|008B4A| STX.w DMA0SIZE

|008B4D| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.no_update_swagduck
|008B50| LDX.w $0ADC
|008B53| STX.w DMA0ADDRL

|008B56| LDX.w $0134
|008B59| STX.w VMADDR

|008B5C| LDX.w #$0400
|008B5F| STX.w DMA0SIZE

|008B62| LDA.b #$01
|008B64| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_sprite_updates
|008B67| LDA.b $16
|008B69| BEQ .skip_BG3

|008B6B| LDX.w $0219
|008B6E| STX.w VMADDR

|008B71| LDX.w #$7EC700
|008B74| STX.w DMA0ADDRL

|008B77| LDA.b #^$7EC700
|008B79| STA.w DMA0ADDRB

|008B7C| LDX.w #$014A
|008B7F| STX.w DMA0SIZE

|008B82| LDA.b #$01
|008B84| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_BG3
|008B87| LDA.b $15
|008B89| BEQ .skip_CGRAM

|008B8B| STZ.w CGADD

|008B8E| LDY.w #$2200
|008B91| STY.w DMA1MODE

|008B94| LDY.w #$7EC500
|008B97| STY.w DMA1ADDRL

|008B9A| LDA.b #^$7EC500
|008B9C| STA.w DMA1ADDRB

|008B9F| LDY.w #$0200
|008BA2| STY.w DMA1SIZE

|008BA5| LDA.b #$02
|008BA7| STA.w MDMAEN

;---------------------------------------------------------------------------------------------------

.skip_CGRAM
|008BAA| REP #$20
|008BAC| SEP #$10

|008BAE| STZ.b $15

|008BB0| STZ.w OAMADDR

|008BB3| LDA.w #$0400
|008BB6| STA.w DMA0MODE

|008BB9| LDA.w #$0800
|008BBC| STA.w DMA0ADDRL
|008BBF| STZ.w DMA0ADDRB

|008BC2| LDA.w #$0220
|008BC5| STA.w DMA0SIZE

|008BC8| LDY.b #$01
|008BCA| STY.w MDMAEN

;---------------------------------------------------------------------------------------------------

|008BCD| SEP #$30

|008BCF| LDY.b $14
|008BD1| BEQ .no_stripes

|008BD3| LDA.w StripesSource.low-1,Y
|008BD6| STA.b $00

|008BD8| LDA.w StripesSource.high-1,Y
|008BDB| STA.b $01

|008BDD| LDA.w StripesSource.bank-1,Y
|008BE0| STA.b $02

|008BE2| JSR HandleStripes14

|008BE5| LDA.b $14
|008BE7| CMP.b #$01
|008BE9| BNE .leave_stripes_alone

|008BEB| STZ.w $1000
|008BEE| STZ.w $1001

.leave_stripes_alone
|008BF1| STZ.b $14

;---------------------------------------------------------------------------------------------------

.no_stripes
|008BF3| LDA.b $19
|008BF5| BEQ .no_incremental_upload

|008BF7| STA.w VMADDH

|008BFA| REP #$10

|008BFC| LDX.w #$0080
|008BFF| STX.w VMAIN

|008C02| LDX.w #$1801
|008C05| STX.w DMA0MODE

|008C08| LDX.w $0118
|008C0B| STX.w DMA0ADDRL

|008C0E| LDA.b #$7F
|008C10| STA.w DMA0ADDRB

|008C13| LDX.w #$0200
|008C16| STX.w DMA0SIZE

|008C19| LDA.b #$01
|008C1B| STA.w MDMAEN

|008C1E| STZ.b $19

|008C20| SEP #$10

;---------------------------------------------------------------------------------------------------

.no_incremental_upload
|008C22| LDX.b $18
|008C24| BEQ .no_arb_dma

|008C26| STZ.w DMA1ADDRB

|008C29| REP #$20

|008C2B| LDA.w #$1801
|008C2E| STA.w DMA1MODE

|008C31| REP #$10

|008C33| LDX.w #$0000

|008C36| LDA.w $1100,X

.next_chunk
|008C39| STA.w VMADDR

|008C3C| TXA
|008C3D| CLC
|008C3E| ADC.w #$1104
|008C41| STA.w DMA1ADDRL

|008C44| LDA.w $1103,X
|008C47| AND.w #$00FF
|008C4A| STA.w DMA1SIZE

|008C4D| CLC
|008C4E| ADC.w #$0004
|008C51| STA.b $00

|008C53| SEP #$20

|008C55| LDA.w $1102,X
|008C58| STA.w VMAIN

|008C5B| LDA.b #$02
|008C5D| STA.w MDMAEN

|008C60| REP #$21

|008C62| TXA
|008C63| ADC.b $00
|008C65| TAX

|008C66| LDA.w $1100,X
|008C69| CMP.w #$FFFF
|008C6C| BNE .next_chunk

|008C6E| SEP #$30

|008C70| STZ.b $18
|008C72| STZ.w $0710

;---------------------------------------------------------------------------------------------------

.no_arb_dma
|008C75| LDA.b $17
|008C77| ASL A
|008C78| TAX

|008C79| STZ.b $17

|008C7B| JMP.w (.vectors,X)

;---------------------------------------------------------------------------------------------------

.vectors
|008C7E| dw NMI_NoTileUpdates                 ; 0x00
|008C80| dw NMI_UploadTilemap                 ; 0x01
|008C82| dw NMI_UploadBG3Text                 ; 0x02
|008C84| dw NMI_UpdateOWScroll                ; 0x03
|008C86| dw NMI_UpdateSubscreenOverlay        ; 0x04
|008C88| dw NMI_UpdateBG1Wall                 ; 0x05
|008C8A| dw NMI_TilemapNothing                ; 0x06
|008C8C| dw NMI_UpdateLoadLightWorldMap       ; 0x07
|008C8E| dw NMI_UpdateBG2Left                 ; 0x08
|008C90| dw NMI_UpdateBGChar3and4             ; 0x09
|008C92| dw NMI_UpdateBGChar5and6             ; 0x0A
|008C94| dw NMI_UpdateBGCharHalf              ; 0x0B
|008C96| dw NMI_UploadSubscreenOverlayLatter  ; 0x0C
|008C98| dw NMI_UploadSubscreenOverlayFormer  ; 0x0D
|008C9A| dw NMI_UpdateBGChar0                 ; 0x0E
|008C9C| dw NMI_UpdateBGChar1                 ; 0x0F
|008C9E| dw NMI_UpdateBGChar2                 ; 0x10
|008CA0| dw NMI_UpdateBGChar3                 ; 0x11
|008CA2| dw NMI_UpdateObjChar0                ; 0x12
|008CA4| dw NMI_UpdateObjChar2                ; 0x13
|008CA6| dw NMI_UpdateObjChar3                ; 0x14
|008CA8| dw NMI_UploadDarkWorldMap            ; 0x15
|008CAA| dw NMI_UploadGameOverText            ; 0x16
|008CAC| dw NMI_UpdatePegTiles                ; 0x17
|008CAE| dw NMI_UpdateStarTiles               ; 0x18

;===================================================================================================

NMI_UploadTilemap:
|008CB0| LDX.w $0116

|008CB3| LDA.w TilemapUpload_HighBytes,X
|008CB6| STA.w VMADDH

|008CB9| STZ.w DMA0ADDRB

|008CBC| REP #$20

|008CBE| LDA.w #$0080
|008CC1| STA.w VMAIN

|008CC4| LDA.w #$1801
|008CC7| STA.w DMA0MODE

|008CCA| LDA.w #$7E1000
|008CCD| STA.w DMA0ADDRL

|008CD0| LDA.w #$0800
|008CD3| STA.w DMA0SIZE

|008CD6| LDY.b #$01
|008CD8| STY.w MDMAEN

|008CDB| STZ.w $1000

|008CDE| SEP #$20

|008CE0| STZ.w $0710

;===================================================================================================

NMI_NoTileUpdates:
|008CE3| RTS

;===================================================================================================

NMI_UploadBG3Text:
|008CE4| REP #$10

|008CE6| LDA.b #$80
|008CE8| STA.w VMAIN

|008CEB| LDX.w #$1801
|008CEE| STX.w DMA0MODE

|008CF1| LDY.w #$7C00 ; VRAM $F800
|008CF4| STY.w VMADDR

|008CF7| LDY.w #$7F0000
|008CFA| STY.w DMA0ADDRL

|008CFD| LDA.b #$7F
|008CFF| STA.w DMA0ADDRB

|008D02| LDX.w #$07E0
|008D05| STX.w DMA0SIZE

|008D08| LDA.b #$01
|008D0A| STA.w MDMAEN

|008D0D| SEP #$10

|008D0F| STZ.w $0710

|008D12| RTS

;===================================================================================================

NMI_UpdateOWScroll:
|008D13| REP #$10

|008D15| LDX.w #$1801
|008D18| STX.w DMA0MODE

|008D1B| STZ.w DMA0ADDRB

|008D1E| LDA.w $1101
|008D21| AND.b #$80
|008D23| ASL A
|008D24| ROL A
|008D25| ORA.b #$80
|008D27| STA.w VMAIN

|008D2A| REP #$20

|008D2C| LDA.w $1100
|008D2F| AND.w #$3FFF
|008D32| TAX

|008D33| INC A
|008D34| INC A
|008D35| STA.b $02

|008D37| LDY.w #$0000

.next_transfer
|008D3A| REP #$21

|008D3C| LDA.w $1102,Y
|008D3F| STA.w VMADDR

|008D42| TYA
|008D43| ADC.w #$1104
|008D46| STA.w DMA0ADDRL

|008D49| TYA
|008D4A| ADC.b $02
|008D4C| TAY

|008D4D| STX.w DMA0SIZE

|008D50| SEP #$20

|008D52| LDA.b #$01
|008D54| STA.w MDMAEN

|008D57| LDA.w $1103,Y
|008D5A| BPL .next_transfer

|008D5C| SEP #$30

|008D5E| STZ.w $0710

|008D61| RTS

;===================================================================================================

NMI_UpdateSubscreenOverlay:
|008D62| LDA.b #$7F
|008D64| STA.w DMA0ADDRB

|008D67| LDA.b #$80
|008D69| STA.w VMAIN

|008D6C| REP #$31

|008D6E| LDA.w #$7F2000
|008D71| STA.w DMA0ADDRL

|008D74| LDX.w #$0000 ; start at $7F4000
|008D77| LDA.w #$0080 ; 16 chunks
|008D7A| BRA NMI_HandleArbitraryTilemap

;===================================================================================================

NMI_UploadSubscreenOverlayFormer:
|008D7C| LDA.b #$7F
|008D7E| STA.w DMA0ADDRB

|008D81| LDA.b #$80
|008D83| STA.w VMAIN

|008D86| REP #$31

|008D88| LDA.w #$7F2000
|008D8B| STA.w DMA0ADDRL

|008D8E| LDX.w #$0000 ; start at $7F4000
|008D91| LDA.w #$0040 ; 8 chunks

|008D94| BRA NMI_HandleArbitraryTilemap

;===================================================================================================

NMI_UploadSubscreenOverlayLatter:
|008D96| LDA.b #$7F
|008D98| STA.w DMA0ADDRB

|008D9B| LDA.b #$80
|008D9D| STA.w VMAIN

|008DA0| REP #$31

|008DA2| LDA.w #$7F3000
|008DA5| STA.w DMA0ADDRL

|008DA8| LDX.w #$0040 ; start at $7F4040
|008DAB| LDA.w #$0080 ; 16 chunks

;===================================================================================================

NMI_HandleArbitraryTilemap:
|008DAE| STA.b $02

|008DB0| LDA.w #$1801
|008DB3| STA.w DMA0MODE

|008DB6| LDA.w #$0001
|008DB9| STA.b $00

|008DBB| LDY.w #$0080

.next_chunk
|008DBE| LDA.l $7F4000,X
|008DC2| STA.w VMADDR

|008DC5| STY.w DMA0SIZE

|008DC8| LDA.b $00
|008DCA| STA.w MDMAEN

|008DCD| LDA.l $7F4002,X
|008DD1| STA.w VMADDR

|008DD4| STY.w DMA0SIZE

|008DD7| LDA.b $00
|008DD9| STA.w MDMAEN

|008DDC| LDA.l $7F4004,X
|008DE0| STA.w VMADDR

|008DE3| STY.w DMA0SIZE

|008DE6| LDA.b $00
|008DE8| STA.w MDMAEN

|008DEB| LDA.l $7F4006,X
|008DEF| STA.w VMADDR

|008DF2| STY.w DMA0SIZE

|008DF5| LDA.b $00
|008DF7| STA.w MDMAEN

|008DFA| TXA
|008DFB| ADC.w #$0008
|008DFE| TAX

|008DFF| CMP.b $02
|008E01| BNE .next_chunk

|008E03| SEP #$30

|008E05| STZ.w $0710

|008E08| RTS

;===================================================================================================

NMI_UpdateBG1Wall:
|008E09| REP #$20

|008E0B| LDA.w #$1801
|008E0E| STA.w DMA0MODE

|008E11| LDA.w $0116
|008E14| STA.w VMADDR

|008E17| LDX.b #$81
|008E19| STX.w VMAIN

|008E1C| LDX.b #^$7EC880
|008E1E| STX.w DMA0ADDRB

|008E21| LDA.w #$7EC880
|008E24| STA.w DMA0ADDRL

|008E27| LDA.w #$0040
|008E2A| STA.w DMA0SIZE

|008E2D| LDY.b #$01
|008E2F| STY.w MDMAEN

|008E32| STA.w DMA0SIZE

|008E35| LDA.w $0116
|008E38| CLC
|008E39| ADC.w #$0800
|008E3C| STA.w VMADDR

|008E3F| LDA.w #$7EC8C0
|008E42| STA.w DMA0ADDRL

|008E45| STY.w MDMAEN

|008E48| SEP #$20

|008E4A| RTS

;===================================================================================================

NMI_TilemapNothing:
|008E4B| RTS

;===================================================================================================

pool NMI_UpdateLoadLightWorldMap

.vram_offset
|008E4C| dw $0000, $0020, $1000, $1020

endpool

;---------------------------------------------------------------------------------------------------

NMI_UpdateLoadLightWorldMap:
|008E54| STZ.w VMAIN

|008E57| LDA.b #^WorldMap_LightWorldTilemap
|008E59| STA.w DMA0ADDRB

|008E5C| REP #$20

|008E5E| LDA.w #$1800
|008E61| STA.w DMA0MODE

|008E64| STZ.b $04
|008E66| STZ.b $02

;---------------------------------------------------------------------------------------------------

|008E68| LDY.b #$01
|008E6A| LDX.b #$00

.next_quadrant
|008E6C| LDA.w #$0020
|008E6F| STA.b $06

|008E71| LDA.w .vram_offset,X
|008E74| STA.b $00

.next_row
|008E76| LDA.b $00
|008E78| STA.w VMADDR

|008E7B| CLC
|008E7C| ADC.w #$0080
|008E7F| STA.b $00

|008E81| LDA.b $02
|008E83| CLC
|008E84| ADC.w #WorldMap_LightWorldTilemap
|008E87| STA.w DMA0ADDRL

|008E8A| LDA.w #$0020
|008E8D| STA.w DMA0SIZE

|008E90| STY.w MDMAEN

|008E93| CLC
|008E94| ADC.b $02
|008E96| STA.b $02

|008E98| DEC.b $06
|008E9A| BNE .next_row

|008E9C| INC.b $04
|008E9E| INC.b $04

|008EA0| LDX.b $04
|008EA2| CPX.b #$08
|008EA4| BNE .next_quadrant

|008EA6| SEP #$20

|008EA8| RTS

;===================================================================================================

NMI_UpdateBG2Left:
|008EA9| LDA.b #$80
|008EAB| STA.w VMAIN

|008EAE| REP #$10

|008EB0| LDY.w #$0000 ; VRAM $0000
|008EB3| STY.w VMADDR

|008EB6| LDY.w #$1801
|008EB9| STY.w DMA1MODE

|008EBC| LDY.w #$7F0000
|008EBF| STY.w DMA1ADDRL

|008EC2| LDA.b #$7F
|008EC4| STA.w DMA1ADDRB

|008EC7| LDY.w #$0800 ; VRAM $1000
|008ECA| STY.w DMA1SIZE

|008ECD| LDA.b #$02
|008ECF| STA.w MDMAEN

|008ED2| STY.w DMA1SIZE

|008ED5| LDY.w #$0800
|008ED8| STY.w VMADDR

|008EDB| LDY.w #$7F0800
|008EDE| STY.w DMA1ADDRL

|008EE1| STA.w MDMAEN

|008EE4| SEP #$10

|008EE6| RTS

;===================================================================================================

NMI_UpdateBGChar3and4:
|008EE7| REP #$20

|008EE9| LDA.w #$2C00 ; VRAM $5800
|008EEC| STA.w VMADDR

|008EEF| LDY.b #$80
|008EF1| STY.w VMAIN

|008EF4| LDA.w #$1801
|008EF7| STA.w DMA0MODE

|008EFA| LDA.w #$7F0000
|008EFD| STA.w DMA0ADDRL

|008F00| LDY.b #$7F
|008F02| STY.w DMA0ADDRB

|008F05| LDA.w #$1000
|008F08| STA.w DMA0SIZE

|008F0B| LDY.b #$01
|008F0D| STY.w MDMAEN

|008F10| SEP #$20

|008F12| STZ.w $0710

|008F15| RTS

;===================================================================================================

NMI_UpdateBGChar5and6:
|008F16| REP #$20

|008F18| LDA.w #$3400 ; VRAM $6800
|008F1B| STA.w VMADDR

|008F1E| LDY.b #$80
|008F20| STY.w VMAIN

|008F23| LDA.w #$1801
|008F26| STA.w DMA0MODE

|008F29| LDA.w #$7F1000
|008F2C| STA.w DMA0ADDRL

|008F2F| LDY.b #$7F
|008F31| STY.w DMA0ADDRB

|008F34| LDA.w #$1000
|008F37| STA.w DMA0SIZE

|008F3A| LDY.b #$01
|008F3C| STY.w MDMAEN

|008F3F| SEP #$20

|008F41| STZ.w $0710

|008F44| RTS

;===================================================================================================

NMI_UpdateBGCharHalf:
|008F45| LDA.w $0116
|008F48| STA.w VMADDH

|008F4B| REP #$10

|008F4D| LDX.w #$0080
|008F50| STX.w VMAIN

|008F53| LDX.w #$1801
|008F56| STX.w DMA0MODE

|008F59| LDX.w #$7F1000
|008F5C| STX.w DMA0ADDRL

|008F5F| LDA.b #$7F
|008F61| STA.w DMA0ADDRB

|008F64| LDX.w #$0400
|008F67| STX.w DMA0SIZE

|008F6A| LDA.b #$01
|008F6C| STA.w MDMAEN

|008F6F| SEP #$10

|008F71| RTS

;===================================================================================================

NMI_UpdateBGChar0:
|008F72| REP #$20

|008F74| LDA.w #$2000 ; VRAM $4000
|008F77| BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar1:
|008F79| REP #$20

|008F7B| LDA.w #$2800 ; VRAM $5000
|008F7E| BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar2:
|008F80| REP #$20

|008F82| LDA.w #$3000 ; VRAM $6000
|008F85| BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateBGChar3:
|008F87| REP #$20

|008F89| LDA.w #$3800 ; VRAM $7000
|008F8C| BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateObjChar0:
|008F8E| REP #$20

|008F90| LDA.w #$4400 ; VRAM $8800
|008F93| STA.w VMADDR

|008F96| LDA.w #$7F0000
|008F99| STA.w DMA0ADDRL

|008F9C| LDY.b #$80
|008F9E| STY.w VMAIN

|008FA1| LDA.w #$1801
|008FA4| STA.w DMA0MODE

|008FA7| LDY.b #$7F
|008FA9| STY.w DMA0ADDRB

|008FAC| LDA.w #$0800
|008FAF| STA.w DMA0SIZE

|008FB2| LDY.b #$01
|008FB4| STY.w MDMAEN

|008FB7| SEP #$20

|008FB9| STZ.w $0710

|008FBC| RTS

;===================================================================================================

NMI_UpdateObjChar2:
|008FBD| REP #$20

|008FBF| LDA.w #$5000 ; VRAM $A000

|008FC2| BRA NMI_RunTilemapUpdateDMA

;===================================================================================================

NMI_UpdateObjChar3:
|008FC4| REP #$20

|008FC6| LDA.w #$5800 ; VRAM $B000

;===================================================================================================

NMI_RunTilemapUpdateDMA:
|008FC9| STA.w VMADDR

|008FCC| LDA.w #$7F0000
|008FCF| STA.w DMA0ADDRL

|008FD2| LDY.b #$80
|008FD4| STY.w VMAIN

|008FD7| LDA.w #$1801
|008FDA| STA.w DMA0MODE

|008FDD| LDY.b #$7F
|008FDF| STY.w DMA0ADDRB

|008FE2| LDA.w #$1000
|008FE5| STA.w DMA0SIZE

|008FE8| LDY.b #$01
|008FEA| STY.w MDMAEN

|008FED| SEP #$20

|008FEF| STZ.w $0710

|008FF2| RTS

;===================================================================================================

NMI_UploadDarkWorldMap:
|008FF3| STZ.w VMAIN

|008FF6| STZ.w DMA0ADDRB

|008FF9| REP #$20

|008FFB| LDA.w #$1800
|008FFE| STA.w DMA0MODE

|009001| STZ.b $02

|009003| LDA.w #$0020
|009006| STA.b $06

|009008| LDA.w #$0810 ; VRAM $1020
|00900B| STA.b $00

|00900D| LDY.b #$01

;---------------------------------------------------------------------------------------------------

.next_row
|00900F| LDA.b $00
|009011| STA.w VMADDR

|009014| CLC
|009015| ADC.w #$0080 ; VRAM +$0100
|009018| STA.b $00

|00901A| LDA.b $02
|00901C| CLC
|00901D| ADC.w #$1000
|009020| STA.w DMA0ADDRL

|009023| LDA.w #$0020
|009026| STA.w DMA0SIZE

|009029| STY.w MDMAEN

|00902C| CLC
|00902D| ADC.b $02
|00902F| STA.b $02

|009031| DEC.b $06
|009033| BNE .next_row

|009035| SEP #$20

|009037| RTS

;===================================================================================================

NMI_UploadGameOverText:
|009038| REP #$20

|00903A| LDA.w #$7800 ; VRAM $F000
|00903D| STA.w VMADDR

|009040| LDA.w #$7E2000
|009043| STA.w DMA0ADDRL

|009046| LDY.b #$80
|009048| STY.w VMAIN

|00904B| LDA.w #$1801
|00904E| STA.w DMA0MODE

|009051| LDY.b #$7E
|009053| STY.w DMA0ADDRB

|009056| LDA.w #$0800
|009059| STA.w DMA0SIZE

|00905C| LDY.b #$01
|00905E| STY.w MDMAEN

|009061| LDA.w #$7D00 ; VRAM $FA00
|009064| STA.w VMADDR

|009067| LDA.w #$7E3400
|00906A| STA.w DMA0ADDRL

|00906D| LDY.b #$80
|00906F| STY.w VMAIN

|009072| LDA.w #$1801
|009075| STA.w DMA0MODE

|009078| LDY.b #$7E
|00907A| STY.w DMA0ADDRB

|00907D| LDA.w #$0600
|009080| STA.w DMA0SIZE

|009083| LDY.b #$01
|009085| STY.w MDMAEN

|009088| SEP #$20

|00908A| RTS

;===================================================================================================

NMI_UpdatePegTiles:
|00908B| REP #$10

|00908D| LDX.w #$3D00 ; VRAM $7A00
|009090| STX.w VMADDR

|009093| LDA.b #$80
|009095| STA.w VMAIN

|009098| LDX.w #$1801
|00909B| STX.w DMA0MODE

|00909E| LDX.w #$7F0000
|0090A1| STX.w DMA0ADDRL

|0090A4| LDA.b #$7F
|0090A6| STA.w DMA0ADDRB

|0090A9| LDX.w #$0100
|0090AC| STX.w DMA0SIZE

|0090AF| LDA.b #$01
|0090B1| STA.w MDMAEN

|0090B4| SEP #$10

|0090B6| RTS

;===================================================================================================

NMI_UpdateStarTiles:
|0090B7| REP #$10

|0090B9| LDX.w #$3ED0 ; VRAM $7DA0
|0090BC| STX.w VMADDR

|0090BF| LDA.b #$80
|0090C1| STA.w VMAIN

|0090C4| LDX.w #$1801
|0090C7| STX.w DMA0MODE

|0090CA| LDX.w #$7F0000
|0090CD| STX.w DMA0ADDRL

|0090D0| LDA.b #$7F
|0090D2| STA.w DMA0ADDRB

|0090D5| LDX.w #$0040
|0090D8| STX.w DMA0SIZE

|0090DB| LDA.b #$01
|0090DD| STA.w MDMAEN

|0090E0| SEP #$10

|0090E2| RTS

;===================================================================================================

NMI_UploadTilemap_long:
|0090E3| JSR NMI_UploadTilemap

|0090E6| RTL

;===================================================================================================

NMI_UpdateOWScroll_long:
|0090E7| JSR NMI_UpdateOWScroll

|0090EA| RTL

;===================================================================================================

UNREACHABLE_0090EB:
|0090EB| STA.b $14

|0090ED| TAY

|0090EE| LDA.w StripesSource.low-1,Y
|0090F1| STA.b $00

|0090F3| LDA.w StripesSource.high-1,Y
|0090F6| STA.b $01

|0090F8| LDA.w StripesSource.bank-1,Y
|0090FB| STA.b $02

|0090FD| JSR HandleStripes14

|009100| LDA.b $14
|009102| CMP.b #$01
|009104| BNE .dont_clear

|009106| STZ.w $1000
|009109| STZ.w $1001

.dont_clear
|00910C| STZ.b $14

|00910E| RTL

;===================================================================================================

UnderworldTilemapQuadrantOffset:
|00910F| dw $0000, $1000, $0000, $0040
|009117| dw $0040, $1040, $1000, $1040
|00911F| dw $1000, $0000, $0040, $0000
|009127| dw $1040, $0040, $1040, $1000

;---------------------------------------------------------------------------------------------------

UnderworldTilemapQuadrantVRAMIndex:
|00912F| db $01, $05, $09, $0D
|009133| db $02, $06, $0A, $0E
|009137| db $03, $07, $0B, $0F
|00913B| db $04, $08, $0C, $10

;---------------------------------------------------------------------------------------------------

BuildBG2QuadrantForUpload:
|00913F| REP #$31

|009141| LDA.w $0418
|009144| AND.w #$000F
|009147| ADC.w $045C
|00914A| PHA

|00914B| ASL A
|00914C| TAY

|00914D| LDX.w UnderworldTilemapQuadrantOffset,Y

;---------------------------------------------------------------------------------------------------

|009150| LDY.w #$0000

.next
|009153| LDA.l $7E2000,X
|009157| STA.w $1000,Y

|00915A| LDA.l $7E2002,X
|00915E| STA.w $1002,Y

|009161| LDA.l $7E2080,X
|009165| STA.w $1040,Y

|009168| LDA.l $7E2082,X
|00916C| STA.w $1042,Y

|00916F| LDA.l $7E2100,X
|009173| STA.w $1080,Y

|009176| LDA.l $7E2102,X
|00917A| STA.w $1082,Y

|00917D| LDA.l $7E2180,X
|009181| STA.w $10C0,Y

|009184| LDA.l $7E2182,X
|009188| STA.w $10C2,Y

|00918B| INX
|00918C| INX
|00918D| INX
|00918E| INX

|00918F| INY
|009190| INY
|009191| INY
|009192| INY

|009193| TYA
|009194| AND.w #$003F
|009197| BNE .next

;---------------------------------------------------------------------------------------------------

|009199| TYA
|00919A| CLC
|00919B| ADC.w #$00C0
|00919E| TAY

|00919F| TXA
|0091A0| CLC
|0091A1| ADC.w #$01C0
|0091A4| TAX

|0091A5| CPY.w #$0800
|0091A8| BNE .next

|0091AA| PLX

|0091AB| SEP #$30

|0091AD| LDA.w $045C
|0091B0| CLC
|0091B1| ADC.b #$04
|0091B3| STA.w $045C

|0091B6| LDA.w UnderworldTilemapQuadrantVRAMIndex,X
|0091B9| STA.w $0116

|0091BC| LDA.b #$01
|0091BE| STA.b $17
|0091C0| STA.w $0710

|0091C3| RTL

;===================================================================================================

BuildBG1QuadrantForUpload:
|0091C4| LDA.b $AE
|0091C6| CMP.b #$19
|0091C8| BNE TilemapPrep_NotWaterOnTag

|0091CA| LDA.w $0405
|0091CD| AND.l BitMasks+1
|0091D1| BEQ BuildBG1QuadrantForUpload_not_triggered

;===================================================================================================

TilemapPrep_NotWaterOnTag:
|0091D3| REP #$31

|0091D5| LDA.w $0418
|0091D8| AND.w #$000F
|0091DB| ADC.w $045C
|0091DE| PHA

|0091DF| ASL A
|0091E0| TAY

|0091E1| LDX.w UnderworldTilemapQuadrantOffset,Y

;---------------------------------------------------------------------------------------------------

|0091E4| LDY.w #$0000

.next
|0091E7| LDA.l $7E4000,X
|0091EB| STA.w $1000,Y

|0091EE| LDA.l $7E4002,X
|0091F2| STA.w $1002,Y

|0091F5| LDA.l $7E4080,X
|0091F9| STA.w $1040,Y

|0091FC| LDA.l $7E4082,X
|009200| STA.w $1042,Y

|009203| LDA.l $7E4100,X
|009207| STA.w $1080,Y

|00920A| LDA.l $7E4102,X
|00920E| STA.w $1082,Y

|009211| LDA.l $7E4180,X
|009215| STA.w $10C0,Y

|009218| LDA.l $7E4182,X
|00921C| STA.w $10C2,Y

|00921F| INX
|009220| INX
|009221| INX
|009222| INX

|009223| INY
|009224| INY
|009225| INY
|009226| INY

|009227| TYA
|009228| AND.w #$003F
|00922B| BNE .next

|00922D| TYA
|00922E| CLC
|00922F| ADC.w #$00C0
|009232| TAY

|009233| TXA
|009234| CLC
|009235| ADC.w #$01C0
|009238| TAX

|009239| CPY.w #$0800
|00923C| BNE .next

;---------------------------------------------------------------------------------------------------

|00923E| PLX

|00923F| SEP #$30

|009241| LDA.w UnderworldTilemapQuadrantVRAMIndex,X
|009244| CLC
|009245| ADC.b #$10
|009247| STA.w $0116

|00924A| LDA.b #$01
|00924C| STA.b $17
|00924E| STA.w $0710

|009251| RTL

;===================================================================================================

BuildBG1QuadrantForUpload_not_triggered:
|009252| REP #$31

|009254| LDX.w #$00F0

|009257| LDY.w #$0000

.next
|00925A| LDA.w RoomDrawObjectData,X
|00925D| STA.w $1000,Y
|009260| STA.w $1002,Y
|009263| STA.w $1040,Y
|009266| STA.w $1042,Y
|009269| STA.w $1080,Y
|00926C| STA.w $1082,Y
|00926F| STA.w $10C0,Y
|009272| STA.w $10C2,Y

|009275| INY
|009276| INY
|009277| INY
|009278| INY

|009279| TYA
|00927A| AND.w #$003F
|00927D| BNE .next

|00927F| TYA
|009280| CLC
|009281| ADC.w #$00C0
|009284| TAY

|009285| CPY.w #$0800
|009288| BNE .next

;---------------------------------------------------------------------------------------------------

|00928A| LDA.w $0418
|00928D| AND.w #$000F
|009290| CLC
|009291| ADC.w $045C
|009294| TAX

|009295| SEP #$30

|009297| LDA.w UnderworldTilemapQuadrantVRAMIndex,X
|00929A| CLC
|00929B| ADC.b #$10
|00929D| STA.w $0116

|0092A0| RTL

;===================================================================================================

HandleStripes14:
|0092A1| REP #$10

|0092A3| STA.w DMA1ADDRB

|0092A6| STZ.b $06

|0092A8| LDY.w #$0000

|0092AB| LDA.b [$00],Y
|0092AD| BPL .next_stripe

|0092AF| SEP #$30

|0092B1| RTS

;---------------------------------------------------------------------------------------------------

.next_stripe
|0092B2| STA.b $04 ; save high byte of VRAM address

|0092B4| INY

|0092B5| LDA.b [$00],Y ; save low byte of VRAM address
|0092B7| STA.b $03

|0092B9| INY

|0092BA| LDA.b [$00],Y ; get 0 or 1 for VMAIN from bit 7
|0092BC| AND.b #$80
|0092BE| ASL A
|0092BF| ROL A
|0092C0| STA.b $07

|0092C2| LDA.b [$00],Y ; 0x08 or 0x00 for fixed transfer
|0092C4| AND.b #$40
|0092C6| STA.b $05

|0092C8| LSR A
|0092C9| LSR A
|0092CA| LSR A
|0092CB| ORA.b #$01 ; and set DMA write to mode 1
|0092CD| STA.w DMA1MODE

|0092D0| LDA.b #VMDATAL
|0092D2| STA.w DMA1PORT

|0092D5| REP #$20

|0092D7| LDA.b $03
|0092D9| STA.w VMADDR

|0092DC| LDA.b [$00],Y ; get size
|0092DE| XBA
|0092DF| AND.w #$3FFF ; remove the flags
|0092E2| TAX

|0092E3| INX ; +1 to account for size
|0092E4| STX.w DMA1SIZE

|0092E7| INY ; get our source address based on our current spot
|0092E8| INY

|0092E9| TYA
|0092EA| CLC
|0092EB| ADC.b $00 ; move it ahead
|0092ED| STA.w DMA1ADDRL

|0092F0| LDA.b $05
|0092F2| BEQ .not_fixed_transfer

|0092F4| INX ; +1 for division

|0092F5| TXA
|0092F6| LSR A ; and divide it by 2
|0092F7| TAX

|0092F8| STX.w DMA1SIZE ; this is the new DMA size

|0092FB| SEP #$20

|0092FD| LDA.b $05 ; sets DMA mode to 0 and uses fixed write
|0092FF| LSR A ; although, you could have just done LDA.b #$08
|009300| LSR A
|009301| LSR A
|009302| STA.w DMA1MODE

|009305| LDA.b $07 ; get increment size
|009307| STA.w VMAIN

|00930A| LDA.b #$02 ; enable DMA channel for stripe
|00930C| STA.w MDMAEN

|00930F| LDA.b #VMDATAH ; swap to the other port
|009311| STA.w DMA1PORT

|009314| REP #$21 ; repoint our source address to the high byte

|009316| TYA
|009317| ADC.b $00
|009319| INC A
|00931A| STA.w DMA1ADDRL

|00931D| LDA.b $03 ; restore the old vram address
|00931F| STA.w VMADDR

|009322| STX.w DMA1SIZE ; same DMA size

|009325| LDX.w #$0002 ; use 2 bytes for size to find next stripe

.not_fixed_transfer
|009328| STX.b $03 ; save last stripe's data size

|00932A| TYA ; add it to our index to get the next stripe
|00932B| CLC
|00932C| ADC.b $03
|00932E| TAY

|00932F| SEP #$20

|009331| LDA.b $07 ; set VMAIN increment based on earlier calculations
|009333| ORA.b #$80 ; make it increment on writes to $2119
|009335| STA.w VMAIN

|009338| LDA.b #$02 ; enable DMA channel for stripe
|00933A| STA.w MDMAEN

|00933D| LDA.b [$00],Y
|00933F| BMI .done

|009341| JMP.w .next_stripe

;---------------------------------------------------------------------------------------------------

.done
|009344| SEP #$30

|009346| RTS

;===================================================================================================

UpdateIRQGFX:
|009347| LDA.w $1F0C
|00934A| BEQ .exit

|00934C| LDA.b #$80
|00934E| STA.w VMAIN

|009351| REP #$20

|009353| LDA.w #$5800 ; VRAM $B000
|009356| STA.w VMADDR

|009359| LDA.w #$1801
|00935C| STA.w DMA0MODE

|00935F| LDA.w #$7EE800
|009362| STA.w DMA0ADDRL

|009365| LDX.b #^$7EE800
|009367| STX.w DMA0ADDRB

|00936A| LDA.w #$0800
|00936D| STA.w DMA0SIZE

|009370| SEP #$20

|009372| LDA.b #$01
|009374| STA.w MDMAEN

|009377| STZ.w $1F0C

.exit
|00937A| RTS

;===================================================================================================

StripesSource:

.low
|00937B| db $001002
|00937C| db $001000
|00937D| db IntroLogoTilemap
|00937E| db $00021B
|00937F| db NamePlayerTilemap
|009380| db FileSelectTilemap
|009381| db FileSelectCopyFileTilemap
|009382| db FileSelectKILLFileTilemap
|009383| db DungeonMap_BG3Tilemap

.high
|009384| db >$001002
|009385| db >$001000
|009386| db >IntroLogoTilemap
|009387| db >$00021B
|009388| db >NamePlayerTilemap
|009389| db >FileSelectTilemap
|00938A| db >FileSelectCopyFileTilemap
|00938B| db >FileSelectKILLFileTilemap
|00938C| db >DungeonMap_BG3Tilemap

.bank
|00938D| db ^$001002
|00938E| db ^$001000
|00938F| db ^IntroLogoTilemap
|009390| db ^$00021B
|009391| db ^NamePlayerTilemap
|009392| db ^FileSelectTilemap
|009393| db ^FileSelectCopyFileTilemap
|009394| db ^FileSelectKILLFileTilemap
|009395| db ^DungeonMap_BG3Tilemap

;===================================================================================================

LinkOAM_HeadAddresses:
|009396| dw LinkGraphics+$0080 ; 0x000 - $108080
|009398| dw LinkGraphics+$0080 ; 0x001 - $108080
|00939A| dw LinkGraphics+$0080 ; 0x002 - $108080
|00939C| dw LinkGraphics+$0080 ; 0x003 - $108080
|00939E| dw LinkGraphics+$0080 ; 0x004 - $108080
|0093A0| dw LinkGraphics+$0040 ; 0x005 - $108040
|0093A2| dw LinkGraphics+$0040 ; 0x006 - $108040
|0093A4| dw LinkGraphics+$0040 ; 0x007 - $108040
|0093A6| dw LinkGraphics+$0040 ; 0x008 - $108040
|0093A8| dw LinkGraphics+$0040 ; 0x009 - $108040
|0093AA| dw LinkGraphics+$0000 ; 0x00A - $108000
|0093AC| dw LinkGraphics+$0000 ; 0x00B - $108000
|0093AE| dw LinkGraphics+$0000 ; 0x00C - $108000
|0093B0| dw LinkGraphics+$0000 ; 0x00D - $108000
|0093B2| dw LinkGraphics+$0000 ; 0x00E - $108000
|0093B4| dw LinkGraphics+$0000 ; 0x00F - $108000
|0093B6| dw LinkGraphics+$1440 ; 0x010 - $109440
|0093B8| dw LinkGraphics+$0080 ; 0x011 - $108080
|0093BA| dw LinkGraphics+$0080 ; 0x012 - $108080
|0093BC| dw LinkGraphics+$0080 ; 0x013 - $108080
|0093BE| dw LinkGraphics+$1400 ; 0x014 - $109400
|0093C0| dw LinkGraphics+$0040 ; 0x015 - $108040
|0093C2| dw LinkGraphics+$00C0 ; 0x016 - $1080C0
|0093C4| dw LinkGraphics+$00C0 ; 0x017 - $1080C0
|0093C6| dw LinkGraphics+$0000 ; 0x018 - $108000
|0093C8| dw LinkGraphics+$0000 ; 0x019 - $108000
|0093CA| dw LinkGraphics+$0000 ; 0x01A - $108000
|0093CC| dw LinkGraphics+$0000 ; 0x01B - $108000
|0093CE| dw LinkGraphics+$0000 ; 0x01C - $108000
|0093D0| dw LinkGraphics+$0000 ; 0x01D - $108000
|0093D2| dw LinkGraphics+$0000 ; 0x01E - $108000
|0093D4| dw LinkGraphics+$0000 ; 0x01F - $108000
|0093D6| dw LinkGraphics+$0080 ; 0x020 - $108080
|0093D8| dw LinkGraphics+$0080 ; 0x021 - $108080
|0093DA| dw LinkGraphics+$0080 ; 0x022 - $108080
|0093DC| dw LinkGraphics+$0080 ; 0x023 - $108080
|0093DE| dw LinkGraphics+$0080 ; 0x024 - $108080
|0093E0| dw LinkGraphics+$0040 ; 0x025 - $108040
|0093E2| dw LinkGraphics+$0040 ; 0x026 - $108040
|0093E4| dw LinkGraphics+$0040 ; 0x027 - $108040
|0093E6| dw LinkGraphics+$0040 ; 0x028 - $108040
|0093E8| dw LinkGraphics+$0040 ; 0x029 - $108040
|0093EA| dw LinkGraphics+$0000 ; 0x02A - $108000
|0093EC| dw LinkGraphics+$28C0 ; 0x02B - $10A8C0
|0093EE| dw LinkGraphics+$2900 ; 0x02C - $10A900
|0093F0| dw LinkGraphics+$0000 ; 0x02D - $108000
|0093F2| dw LinkGraphics+$28C0 ; 0x02E - $10A8C0
|0093F4| dw LinkGraphics+$2900 ; 0x02F - $10A900
|0093F6| dw LinkGraphics+$1100 ; 0x030 - $109100
|0093F8| dw LinkGraphics+$0080 ; 0x031 - $108080
|0093FA| dw LinkGraphics+$0080 ; 0x032 - $108080
|0093FC| dw LinkGraphics+$10C0 ; 0x033 - $1090C0
|0093FE| dw LinkGraphics+$0040 ; 0x034 - $108040
|009400| dw LinkGraphics+$0000 ; 0x035 - $108000
|009402| dw LinkGraphics+$0000 ; 0x036 - $108000
|009404| dw LinkGraphics+$0000 ; 0x037 - $108000
|009406| dw LinkGraphics+$0000 ; 0x038 - $108000
|009408| dw LinkGraphics+$0000 ; 0x039 - $108000
|00940A| dw LinkGraphics+$0000 ; 0x03A - $108000
|00940C| dw LinkGraphics+$1A00 ; 0x03B - $109A00
|00940E| dw LinkGraphics+$1140 ; 0x03C - $109140
|009410| dw LinkGraphics+$1180 ; 0x03D - $109180
|009412| dw LinkGraphics+$0000 ; 0x03E - $108000
|009414| dw LinkGraphics+$1500 ; 0x03F - $109500
|009416| dw LinkGraphics+$1480 ; 0x040 - $109480
|009418| dw LinkGraphics+$14C0 ; 0x041 - $1094C0
|00941A| dw LinkGraphics+$14C0 ; 0x042 - $1094C0
|00941C| dw LinkGraphics+$1AE0 ; 0x043 - $109AE0
|00941E| dw LinkGraphics+$0080 ; 0x044 - $108080
|009420| dw LinkGraphics+$0080 ; 0x045 - $108080
|009422| dw LinkGraphics+$1A60 ; 0x046 - $109A60
|009424| dw LinkGraphics+$00C0 ; 0x047 - $1080C0
|009426| dw LinkGraphics+$00C0 ; 0x048 - $1080C0
|009428| dw LinkGraphics+$1AA0 ; 0x049 - $109AA0
|00942A| dw LinkGraphics+$0000 ; 0x04A - $108000
|00942C| dw LinkGraphics+$0000 ; 0x04B - $108000
|00942E| dw LinkGraphics+$1AA0 ; 0x04C - $109AA0
|009430| dw LinkGraphics+$0000 ; 0x04D - $108000
|009432| dw LinkGraphics+$0000 ; 0x04E - $108000
|009434| dw LinkGraphics+$0080 ; 0x04F - $108080
|009436| dw LinkGraphics+$0080 ; 0x050 - $108080
|009438| dw LinkGraphics+$0100 ; 0x051 - $108100
|00943A| dw LinkGraphics+$0100 ; 0x052 - $108100
|00943C| dw LinkGraphics+$05C0 ; 0x053 - $1085C0
|00943E| dw LinkGraphics+$0000 ; 0x054 - $108000
|009440| dw LinkGraphics+$0000 ; 0x055 - $108000
|009442| dw LinkGraphics+$05C0 ; 0x056 - $1085C0
|009444| dw LinkGraphics+$0000 ; 0x057 - $108000
|009446| dw LinkGraphics+$0000 ; 0x058 - $108000
|009448| dw LinkGraphics+$2DC0 ; 0x059 - $10ADC0
|00944A| dw LinkGraphics+$2DC0 ; 0x05A - $10ADC0
|00944C| dw LinkGraphics+$2DC0 ; 0x05B - $10ADC0
|00944E| dw LinkGraphics+$2DC0 ; 0x05C - $10ADC0
|009450| dw LinkGraphics+$2DC0 ; 0x05D - $10ADC0
|009452| dw LinkGraphics+$2D40 ; 0x05E - $10AD40
|009454| dw LinkGraphics+$2D40 ; 0x05F - $10AD40
|009456| dw LinkGraphics+$2D40 ; 0x060 - $10AD40
|009458| dw LinkGraphics+$2D40 ; 0x061 - $10AD40
|00945A| dw LinkGraphics+$2D40 ; 0x062 - $10AD40
|00945C| dw LinkGraphics+$2D80 ; 0x063 - $10AD80
|00945E| dw LinkGraphics+$2D80 ; 0x064 - $10AD80
|009460| dw LinkGraphics+$2D80 ; 0x065 - $10AD80
|009462| dw LinkGraphics+$2D80 ; 0x066 - $10AD80
|009464| dw LinkGraphics+$2D80 ; 0x067 - $10AD80
|009466| dw LinkGraphics+$2D80 ; 0x068 - $10AD80
|009468| dw LinkGraphics+$0040 ; 0x069 - $108040
|00946A| dw LinkGraphics+$1400 ; 0x06A - $109400
|00946C| dw LinkGraphics+$0040 ; 0x06B - $108040
|00946E| dw LinkGraphics+$0000 ; 0x06C - $108000
|009470| dw LinkGraphics+$0080 ; 0x06D - $108080
|009472| dw LinkGraphics+$0080 ; 0x06E - $108080
|009474| dw LinkGraphics+$1440 ; 0x06F - $109440
|009476| dw LinkGraphics+$0000 ; 0x070 - $108000
|009478| dw LinkGraphics+$0000 ; 0x071 - $108000
|00947A| dw LinkGraphics+$0000 ; 0x072 - $108000
|00947C| dw LinkGraphics+$0000 ; 0x073 - $108000
|00947E| dw LinkGraphics+$0080 ; 0x074 - $108080
|009480| dw LinkGraphics+$0040 ; 0x075 - $108040
|009482| dw LinkGraphics+$0040 ; 0x076 - $108040
|009484| dw LinkGraphics+$0000 ; 0x077 - $108000
|009486| dw LinkGraphics+$0000 ; 0x078 - $108000
|009488| dw LinkGraphics+$0000 ; 0x079 - $108000
|00948A| dw LinkGraphics+$0000 ; 0x07A - $108000
|00948C| dw LinkGraphics+$0000 ; 0x07B - $108000
|00948E| dw LinkGraphics+$0000 ; 0x07C - $108000
|009490| dw LinkGraphics+$4440 ; 0x07D - $10C440
|009492| dw LinkGraphics+$0140 ; 0x07E - $108140
|009494| dw LinkGraphics+$0140 ; 0x07F - $108140
|009496| dw LinkGraphics+$4A40 ; 0x080 - $10CA40
|009498| dw LinkGraphics+$0000 ; 0x081 - $108000
|00949A| dw LinkGraphics+$0000 ; 0x082 - $108000
|00949C| dw LinkGraphics+$0000 ; 0x083 - $108000
|00949E| dw LinkGraphics+$0000 ; 0x084 - $108000
|0094A0| dw LinkGraphics+$0000 ; 0x085 - $108000
|0094A2| dw LinkGraphics+$0000 ; 0x086 - $108000
|0094A4| dw LinkGraphics+$0040 ; 0x087 - $108040
|0094A6| dw LinkGraphics+$05C0 ; 0x088 - $1085C0
|0094A8| dw LinkGraphics+$0040 ; 0x089 - $108040
|0094AA| dw LinkGraphics+$05C0 ; 0x08A - $1085C0
|0094AC| dw LinkGraphics+$0100 ; 0x08B - $108100
|0094AE| dw LinkGraphics+$00C0 ; 0x08C - $1080C0
|0094B0| dw LinkGraphics+$11C0 ; 0x08D - $1091C0
|0094B2| dw LinkGraphics+$0080 ; 0x08E - $108080
|0094B4| dw LinkGraphics+$0080 ; 0x08F - $108080
|0094B6| dw LinkGraphics+$0040 ; 0x090 - $108040
|0094B8| dw LinkGraphics+$0040 ; 0x091 - $108040
|0094BA| dw LinkGraphics+$0000 ; 0x092 - $108000
|0094BC| dw LinkGraphics+$0000 ; 0x093 - $108000
|0094BE| dw LinkGraphics+$0000 ; 0x094 - $108000
|0094C0| dw LinkGraphics+$0000 ; 0x095 - $108000
|0094C2| dw LinkGraphics+$0080 ; 0x096 - $108080
|0094C4| dw LinkGraphics+$0080 ; 0x097 - $108080
|0094C6| dw LinkGraphics+$1100 ; 0x098 - $109100
|0094C8| dw LinkGraphics+$20C0 ; 0x099 - $10A0C0
|0094CA| dw LinkGraphics+$2100 ; 0x09A - $10A100
|0094CC| dw LinkGraphics+$2100 ; 0x09B - $10A100
|0094CE| dw LinkGraphics+$21C0 ; 0x09C - $10A1C0
|0094D0| dw LinkGraphics+$2400 ; 0x09D - $10A400
|0094D2| dw LinkGraphics+$2440 ; 0x09E - $10A440
|0094D4| dw LinkGraphics+$21C0 ; 0x09F - $10A1C0
|0094D6| dw LinkGraphics+$2400 ; 0x0A0 - $10A400
|0094D8| dw LinkGraphics+$2440 ; 0x0A1 - $10A440
|0094DA| dw LinkGraphics+$0080 ; 0x0A2 - $108080
|0094DC| dw LinkGraphics+$4480 ; 0x0A3 - $10C480
|0094DE| dw LinkGraphics+$0080 ; 0x0A4 - $108080
|0094E0| dw LinkGraphics+$0040 ; 0x0A5 - $108040
|0094E2| dw LinkGraphics+$0040 ; 0x0A6 - $108040
|0094E4| dw LinkGraphics+$4A80 ; 0x0A7 - $10CA80
|0094E6| dw LinkGraphics+$4A80 ; 0x0A8 - $10CA80
|0094E8| dw LinkGraphics+$4A00 ; 0x0A9 - $10CA00
|0094EA| dw LinkGraphics+$4400 ; 0x0AA - $10C400
|0094EC| dw LinkGraphics+$4A00 ; 0x0AB - $10CA00
|0094EE| dw LinkGraphics+$4400 ; 0x0AC - $10C400
|0094F0| dw LinkGraphics+$01C0 ; 0x0AD - $1081C0
|0094F2| dw LinkGraphics+$0080 ; 0x0AE - $108080
|0094F4| dw LinkGraphics+$0080 ; 0x0AF - $108080
|0094F6| dw LinkGraphics+$0080 ; 0x0B0 - $108080
|0094F8| dw LinkGraphics+$0080 ; 0x0B1 - $108080
|0094FA| dw LinkGraphics+$0080 ; 0x0B2 - $108080
|0094FC| dw LinkGraphics+$0080 ; 0x0B3 - $108080
|0094FE| dw LinkGraphics+$0080 ; 0x0B4 - $108080
|009500| dw LinkGraphics+$0080 ; 0x0B5 - $108080
|009502| dw LinkGraphics+$0040 ; 0x0B6 - $108040
|009504| dw LinkGraphics+$0040 ; 0x0B7 - $108040
|009506| dw LinkGraphics+$0040 ; 0x0B8 - $108040
|009508| dw LinkGraphics+$0040 ; 0x0B9 - $108040
|00950A| dw LinkGraphics+$0040 ; 0x0BA - $108040
|00950C| dw LinkGraphics+$0040 ; 0x0BB - $108040
|00950E| dw LinkGraphics+$0040 ; 0x0BC - $108040
|009510| dw LinkGraphics+$0000 ; 0x0BD - $108000
|009512| dw LinkGraphics+$28C0 ; 0x0BE - $10A8C0
|009514| dw LinkGraphics+$2900 ; 0x0BF - $10A900
|009516| dw LinkGraphics+$0000 ; 0x0C0 - $108000
|009518| dw LinkGraphics+$0000 ; 0x0C1 - $108000
|00951A| dw LinkGraphics+$28C0 ; 0x0C2 - $10A8C0
|00951C| dw LinkGraphics+$2900 ; 0x0C3 - $10A900
|00951E| dw LinkGraphics+$0000 ; 0x0C4 - $108000
|009520| dw LinkGraphics+$28C0 ; 0x0C5 - $10A8C0
|009522| dw LinkGraphics+$2900 ; 0x0C6 - $10A900
|009524| dw LinkGraphics+$0000 ; 0x0C7 - $108000
|009526| dw LinkGraphics+$0000 ; 0x0C8 - $108000
|009528| dw LinkGraphics+$28C0 ; 0x0C9 - $10A8C0
|00952A| dw LinkGraphics+$2900 ; 0x0CA - $10A900
|00952C| dw LinkGraphics+$0040 ; 0x0CB - $108040
|00952E| dw LinkGraphics+$0040 ; 0x0CC - $108040
|009530| dw LinkGraphics+$0040 ; 0x0CD - $108040
|009532| dw LinkGraphics+$0080 ; 0x0CE - $108080
|009534| dw LinkGraphics+$0080 ; 0x0CF - $108080
|009536| dw LinkGraphics+$0040 ; 0x0D0 - $108040
|009538| dw LinkGraphics+$0040 ; 0x0D1 - $108040
|00953A| dw LinkGraphics+$0040 ; 0x0D2 - $108040
|00953C| dw LinkGraphics+$0040 ; 0x0D3 - $108040
|00953E| dw LinkGraphics+$0000 ; 0x0D4 - $108000
|009540| dw LinkGraphics+$0000 ; 0x0D5 - $108000
|009542| dw LinkGraphics+$0000 ; 0x0D6 - $108000
|009544| dw LinkGraphics+$0000 ; 0x0D7 - $108000
|009546| dw LinkGraphics+$5080 ; 0x0D8 - $10D080
|009548| dw LinkGraphics+$0080 ; 0x0D9 - $108080
|00954A| dw LinkGraphics+$10C0 ; 0x0DA - $1090C0
|00954C| dw LinkGraphics+$5000 ; 0x0DB - $10D000
|00954E| dw LinkGraphics+$1080 ; 0x0DC - $109080
|009550| dw LinkGraphics+$5040 ; 0x0DD - $10D040
|009552| dw LinkGraphics+$1080 ; 0x0DE - $109080
|009554| dw LinkGraphics+$5040 ; 0x0DF - $10D040
|009556| dw LinkGraphics+$5080 ; 0x0E0 - $10D080
|009558| dw LinkGraphics+$5080 ; 0x0E1 - $10D080
|00955A| dw LinkGraphics+$5080 ; 0x0E2 - $10D080
|00955C| dw LinkGraphics+$5080 ; 0x0E3 - $10D080
|00955E| dw LinkGraphics+$5080 ; 0x0E4 - $10D080
|009560| dw LinkGraphics+$5000 ; 0x0E5 - $10D000
|009562| dw LinkGraphics+$5000 ; 0x0E6 - $10D000
|009564| dw LinkGraphics+$5000 ; 0x0E7 - $10D000
|009566| dw LinkGraphics+$5000 ; 0x0E8 - $10D000
|009568| dw LinkGraphics+$5000 ; 0x0E9 - $10D000
|00956A| dw LinkGraphics+$5040 ; 0x0EA - $10D040
|00956C| dw LinkGraphics+$5040 ; 0x0EB - $10D040
|00956E| dw LinkGraphics+$5040 ; 0x0EC - $10D040
|009570| dw LinkGraphics+$5040 ; 0x0ED - $10D040
|009572| dw LinkGraphics+$5040 ; 0x0EE - $10D040
|009574| dw LinkGraphics+$5040 ; 0x0EF - $10D040
|009576| dw LinkGraphics+$0040 ; 0x0F0 - $108040
|009578| dw LinkGraphics+$5000 ; 0x0F1 - $10D000
|00957A| dw LinkGraphics+$05C0 ; 0x0F2 - $1085C0
|00957C| dw LinkGraphics+$05C0 ; 0x0F3 - $1085C0
|00957E| dw LinkGraphics+$05C0 ; 0x0F4 - $1085C0
|009580| dw LinkGraphics+$5C40 ; 0x0F5 - $10DC40
|009582| dw LinkGraphics+$5C40 ; 0x0F6 - $10DC40
|009584| dw LinkGraphics+$5C40 ; 0x0F7 - $10DC40
|009586| dw LinkGraphics+$05C0 ; 0x0F8 - $1085C0
|009588| dw LinkGraphics+$05C0 ; 0x0F9 - $1085C0
|00958A| dw LinkGraphics+$05C0 ; 0x0FA - $1085C0
|00958C| dw LinkGraphics+$5C40 ; 0x0FB - $10DC40
|00958E| dw LinkGraphics+$5C40 ; 0x0FC - $10DC40
|009590| dw LinkGraphics+$5C40 ; 0x0FD - $10DC40
|009592| dw LinkGraphics+$61C0 ; 0x0FE - $10E1C0
|009594| dw LinkGraphics+$5000 ; 0x0FF - $10D000
|009596| dw LinkGraphics+$0000 ; 0x100 - $108000
|009598| dw LinkGraphics+$6400 ; 0x101 - $10E400
|00959A| dw LinkGraphics+$6400 ; 0x102 - $10E400
|00959C| dw LinkGraphics+$6440 ; 0x103 - $10E440
|00959E| dw LinkGraphics+$10C0 ; 0x104 - $1090C0
|0095A0| dw LinkGraphics+$10C0 ; 0x105 - $1090C0
|0095A2| dw LinkGraphics+$5000 ; 0x106 - $10D000
|0095A4| dw LinkGraphics+$0000 ; 0x107 - $108000
|0095A6| dw LinkGraphics+$0000 ; 0x108 - $108000
|0095A8| dw LinkGraphics+$5040 ; 0x109 - $10D040
|0095AA| dw LinkGraphics+$0000 ; 0x10A - $108000
|0095AC| dw LinkGraphics+$0000 ; 0x10B - $108000
|0095AE| dw LinkGraphics+$5040 ; 0x10C - $10D040
|0095B0| dw LinkGraphics+$6400 ; 0x10D - $10E400
|0095B2| dw LinkGraphics+$6400 ; 0x10E - $10E400
|0095B4| dw LinkGraphics+$6400 ; 0x10F - $10E400
|0095B6| dw LinkGraphics+$1080 ; 0x110 - $109080
|0095B8| dw LinkGraphics+$25C0 ; 0x111 - $10A5C0
|0095BA| dw LinkGraphics+$2C40 ; 0x112 - $10AC40
|0095BC| dw LinkGraphics+$6480 ; 0x113 - $10E480
|0095BE| dw LinkGraphics+$0180 ; 0x114 - $108180
|0095C0| dw LinkGraphics+$10C0 ; 0x115 - $1090C0
|0095C2| dw LinkGraphics+$00C0 ; 0x116 - $1080C0
|0095C4| dw LinkGraphics+$6180 ; 0x117 - $10E180
|0095C6| dw LinkGraphics+$5000 ; 0x118 - $10D000
|0095C8| dw LinkGraphics+$64C0 ; 0x119 - $10E4C0
|0095CA| dw LinkGraphics+$64C0 ; 0x11A - $10E4C0
|0095CC| dw LinkGraphics+$6840 ; 0x11B - $10E840
|0095CE| dw LinkGraphics+$6840 ; 0x11C - $10E840
|0095D0| dw LinkGraphics+$6840 ; 0x11D - $10E840
|0095D2| dw LinkGraphics+$6540 ; 0x11E - $10E540
|0095D4| dw LinkGraphics+$6540 ; 0x11F - $10E540
|0095D6| dw LinkGraphics+$6540 ; 0x120 - $10E540
|0095D8| dw LinkGraphics+$6900 ; 0x121 - $10E900
|0095DA| dw LinkGraphics+$6900 ; 0x122 - $10E900
|0095DC| dw LinkGraphics+$6900 ; 0x123 - $10E900
|0095DE| dw LinkGraphics+$6900 ; 0x124 - $10E900
|0095E0| dw LinkGraphics+$0080 ; 0x125 - $108080
|0095E2| dw LinkGraphics+$0080 ; 0x126 - $108080
|0095E4| dw LinkGraphics+$0000 ; 0x127 - $108000
|0095E6| dw LinkGraphics+$29C0 ; 0x128 - $10A9C0
|0095E8| dw LinkGraphics+$0080 ; 0x129 - $108080
|0095EA| dw LinkGraphics+$0140 ; 0x12A - $108140
|0095EC| dw LinkGraphics+$11C0 ; 0x12B - $1091C0
|0095EE| dw LinkGraphics+$0040 ; 0x12C - $108040
|0095F0| dw LinkGraphics+$2800 ; 0x12D - $10A800
|0095F2| dw LinkGraphics+$2840 ; 0x12E - $10A840

;===================================================================================================

LinkOAM_BodyAddresses:
|0095F4| dw LinkGraphics+$0840 ; 0x000 - $108840
|0095F6| dw LinkGraphics+$0800 ; 0x001 - $108800
|0095F8| dw LinkGraphics+$0580 ; 0x002 - $108580
|0095FA| dw LinkGraphics+$0800 ; 0x003 - $108800
|0095FC| dw LinkGraphics+$0580 ; 0x004 - $108580
|0095FE| dw LinkGraphics+$04C0 ; 0x005 - $1084C0
|009600| dw LinkGraphics+$0500 ; 0x006 - $108500
|009602| dw LinkGraphics+$0540 ; 0x007 - $108540
|009604| dw LinkGraphics+$0500 ; 0x008 - $108500
|009606| dw LinkGraphics+$0540 ; 0x009 - $108540
|009608| dw LinkGraphics+$0400 ; 0x00A - $108400
|00960A| dw LinkGraphics+$0440 ; 0x00B - $108440
|00960C| dw LinkGraphics+$0480 ; 0x00C - $108480
|00960E| dw LinkGraphics+$0400 ; 0x00D - $108400
|009610| dw LinkGraphics+$0440 ; 0x00E - $108440
|009612| dw LinkGraphics+$0480 ; 0x00F - $108480
|009614| dw LinkGraphics+$1640 ; 0x010 - $109640
|009616| dw LinkGraphics+$0C40 ; 0x011 - $108C40
|009618| dw LinkGraphics+$0C80 ; 0x012 - $108C80
|00961A| dw LinkGraphics+$2D00 ; 0x013 - $10AD00
|00961C| dw LinkGraphics+$1600 ; 0x014 - $109600
|00961E| dw LinkGraphics+$0980 ; 0x015 - $108980
|009620| dw LinkGraphics+$0C00 ; 0x016 - $108C00
|009622| dw LinkGraphics+$2CC0 ; 0x017 - $10ACC0
|009624| dw LinkGraphics+$0880 ; 0x018 - $108880
|009626| dw LinkGraphics+$08C0 ; 0x019 - $1088C0
|009628| dw LinkGraphics+$0900 ; 0x01A - $108900
|00962A| dw LinkGraphics+$0940 ; 0x01B - $108940
|00962C| dw LinkGraphics+$0880 ; 0x01C - $108880
|00962E| dw LinkGraphics+$08C0 ; 0x01D - $1088C0
|009630| dw LinkGraphics+$0900 ; 0x01E - $108900
|009632| dw LinkGraphics+$0940 ; 0x01F - $108940
|009634| dw LinkGraphics+$30C0 ; 0x020 - $10B0C0
|009636| dw LinkGraphics+$3100 ; 0x021 - $10B100
|009638| dw LinkGraphics+$3140 ; 0x022 - $10B140
|00963A| dw LinkGraphics+$3100 ; 0x023 - $10B100
|00963C| dw LinkGraphics+$3140 ; 0x024 - $10B140
|00963E| dw LinkGraphics+$3000 ; 0x025 - $10B000
|009640| dw LinkGraphics+$3040 ; 0x026 - $10B040
|009642| dw LinkGraphics+$3080 ; 0x027 - $10B080
|009644| dw LinkGraphics+$6C80 ; 0x028 - $10EC80
|009646| dw LinkGraphics+$6CC0 ; 0x029 - $10ECC0
|009648| dw LinkGraphics+$3180 ; 0x02A - $10B180
|00964A| dw LinkGraphics+$5440 ; 0x02B - $10D440
|00964C| dw LinkGraphics+$31C0 ; 0x02C - $10B1C0
|00964E| dw LinkGraphics+$3180 ; 0x02D - $10B180
|009650| dw LinkGraphics+$5440 ; 0x02E - $10D440
|009652| dw LinkGraphics+$31C0 ; 0x02F - $10B1C0
|009654| dw LinkGraphics+$0C80 ; 0x030 - $108C80
|009656| dw LinkGraphics+$2D00 ; 0x031 - $10AD00
|009658| dw LinkGraphics+$15C0 ; 0x032 - $1095C0
|00965A| dw LinkGraphics+$19C0 ; 0x033 - $1099C0
|00965C| dw LinkGraphics+$3440 ; 0x034 - $10B440
|00965E| dw LinkGraphics+$1580 ; 0x035 - $109580
|009660| dw LinkGraphics+$3480 ; 0x036 - $10B480
|009662| dw LinkGraphics+$34C0 ; 0x037 - $10B4C0
|009664| dw LinkGraphics+$1580 ; 0x038 - $109580
|009666| dw LinkGraphics+$3480 ; 0x039 - $10B480
|009668| dw LinkGraphics+$34C0 ; 0x03A - $10B4C0
|00966A| dw LinkGraphics+$1C20 ; 0x03B - $109C20
|00966C| dw LinkGraphics+$0000 ; 0x03C - $108000
|00966E| dw LinkGraphics+$0000 ; 0x03D - $108000
|009670| dw LinkGraphics+$0000 ; 0x03E - $108000
|009672| dw LinkGraphics+$1700 ; 0x03F - $109700
|009674| dw LinkGraphics+$1680 ; 0x040 - $109680
|009676| dw LinkGraphics+$16C0 ; 0x041 - $1096C0
|009678| dw LinkGraphics+$16C0 ; 0x042 - $1096C0
|00967A| dw LinkGraphics+$1CE0 ; 0x043 - $109CE0
|00967C| dw LinkGraphics+$0C80 ; 0x044 - $108C80
|00967E| dw LinkGraphics+$3540 ; 0x045 - $10B540
|009680| dw LinkGraphics+$1C60 ; 0x046 - $109C60
|009682| dw LinkGraphics+$3580 ; 0x047 - $10B580
|009684| dw LinkGraphics+$0C00 ; 0x048 - $108C00
|009686| dw LinkGraphics+$1CA0 ; 0x049 - $109CA0
|009688| dw LinkGraphics+$0900 ; 0x04A - $108900
|00968A| dw LinkGraphics+$3500 ; 0x04B - $10B500
|00968C| dw LinkGraphics+$1CA0 ; 0x04C - $109CA0
|00968E| dw LinkGraphics+$0900 ; 0x04D - $108900
|009690| dw LinkGraphics+$3500 ; 0x04E - $10B500
|009692| dw LinkGraphics+$0C40 ; 0x04F - $108C40
|009694| dw LinkGraphics+$6C40 ; 0x050 - $10EC40
|009696| dw LinkGraphics+$0C00 ; 0x051 - $108C00
|009698| dw LinkGraphics+$6C00 ; 0x052 - $10EC00
|00969A| dw LinkGraphics+$0DC0 ; 0x053 - $108DC0
|00969C| dw LinkGraphics+$1540 ; 0x054 - $109540
|00969E| dw LinkGraphics+$09C0 ; 0x055 - $1089C0
|0096A0| dw LinkGraphics+$0DC0 ; 0x056 - $108DC0
|0096A2| dw LinkGraphics+$1540 ; 0x057 - $109540
|0096A4| dw LinkGraphics+$09C0 ; 0x058 - $1089C0
|0096A6| dw LinkGraphics+$3940 ; 0x059 - $10B940
|0096A8| dw LinkGraphics+$3980 ; 0x05A - $10B980
|0096AA| dw LinkGraphics+$39C0 ; 0x05B - $10B9C0
|0096AC| dw LinkGraphics+$3980 ; 0x05C - $10B980
|0096AE| dw LinkGraphics+$39C0 ; 0x05D - $10B9C0
|0096B0| dw LinkGraphics+$35C0 ; 0x05E - $10B5C0
|0096B2| dw LinkGraphics+$3800 ; 0x05F - $10B800
|0096B4| dw LinkGraphics+$3840 ; 0x060 - $10B840
|0096B6| dw LinkGraphics+$3800 ; 0x061 - $10B800
|0096B8| dw LinkGraphics+$3840 ; 0x062 - $10B840
|0096BA| dw LinkGraphics+$3880 ; 0x063 - $10B880
|0096BC| dw LinkGraphics+$38C0 ; 0x064 - $10B8C0
|0096BE| dw LinkGraphics+$3900 ; 0x065 - $10B900
|0096C0| dw LinkGraphics+$3880 ; 0x066 - $10B880
|0096C2| dw LinkGraphics+$38C0 ; 0x067 - $10B8C0
|0096C4| dw LinkGraphics+$3900 ; 0x068 - $10B900
|0096C6| dw LinkGraphics+$0980 ; 0x069 - $108980
|0096C8| dw LinkGraphics+$1600 ; 0x06A - $109600
|0096CA| dw LinkGraphics+$3CC0 ; 0x06B - $10BCC0
|0096CC| dw LinkGraphics+$0400 ; 0x06C - $108400
|0096CE| dw LinkGraphics+$3C80 ; 0x06D - $10BC80
|0096D0| dw LinkGraphics+$0C40 ; 0x06E - $108C40
|0096D2| dw LinkGraphics+$1640 ; 0x06F - $109640
|0096D4| dw LinkGraphics+$2040 ; 0x070 - $10A040
|0096D6| dw LinkGraphics+$2080 ; 0x071 - $10A080
|0096D8| dw LinkGraphics+$2000 ; 0x072 - $10A000
|0096DA| dw LinkGraphics+$3C40 ; 0x073 - $10BC40
|0096DC| dw LinkGraphics+$3D40 ; 0x074 - $10BD40
|0096DE| dw LinkGraphics+$0500 ; 0x075 - $108500
|0096E0| dw LinkGraphics+$3D00 ; 0x076 - $10BD00
|0096E2| dw LinkGraphics+$3D80 ; 0x077 - $10BD80
|0096E4| dw LinkGraphics+$3D80 ; 0x078 - $10BD80
|0096E6| dw LinkGraphics+$08C0 ; 0x079 - $1088C0
|0096E8| dw LinkGraphics+$0900 ; 0x07A - $108900
|0096EA| dw LinkGraphics+$69C0 ; 0x07B - $10E9C0
|0096EC| dw LinkGraphics+$0900 ; 0x07C - $108900
|0096EE| dw LinkGraphics+$4640 ; 0x07D - $10C640
|0096F0| dw LinkGraphics+$4040 ; 0x07E - $10C040
|0096F2| dw LinkGraphics+$4000 ; 0x07F - $10C000
|0096F4| dw LinkGraphics+$4C40 ; 0x080 - $10CC40
|0096F6| dw LinkGraphics+$0940 ; 0x081 - $108940
|0096F8| dw LinkGraphics+$08C0 ; 0x082 - $1088C0
|0096FA| dw LinkGraphics+$0900 ; 0x083 - $108900
|0096FC| dw LinkGraphics+$69C0 ; 0x084 - $10E9C0
|0096FE| dw LinkGraphics+$0900 ; 0x085 - $108900
|009700| dw LinkGraphics+$0940 ; 0x086 - $108940
|009702| dw LinkGraphics+$0D40 ; 0x087 - $108D40
|009704| dw LinkGraphics+$0D80 ; 0x088 - $108D80
|009706| dw LinkGraphics+$0D40 ; 0x089 - $108D40
|009708| dw LinkGraphics+$0D80 ; 0x08A - $108D80
|00970A| dw LinkGraphics+$3D00 ; 0x08B - $10BD00
|00970C| dw LinkGraphics+$3000 ; 0x08C - $10B000
|00970E| dw LinkGraphics+$3000 ; 0x08D - $10B000
|009710| dw LinkGraphics+$2480 ; 0x08E - $10A480
|009712| dw LinkGraphics+$2480 ; 0x08F - $10A480
|009714| dw LinkGraphics+$2480 ; 0x090 - $10A480
|009716| dw LinkGraphics+$2480 ; 0x091 - $10A480
|009718| dw LinkGraphics+$2C00 ; 0x092 - $10AC00
|00971A| dw LinkGraphics+$2C00 ; 0x093 - $10AC00
|00971C| dw LinkGraphics+$2C00 ; 0x094 - $10AC00
|00971E| dw LinkGraphics+$2C00 ; 0x095 - $10AC00
|009720| dw LinkGraphics+$2140 ; 0x096 - $10A140
|009722| dw LinkGraphics+$2180 ; 0x097 - $10A180
|009724| dw LinkGraphics+$2180 ; 0x098 - $10A180
|009726| dw LinkGraphics+$24C0 ; 0x099 - $10A4C0
|009728| dw LinkGraphics+$24C0 ; 0x09A - $10A4C0
|00972A| dw LinkGraphics+$2500 ; 0x09B - $10A500
|00972C| dw LinkGraphics+$1D40 ; 0x09C - $109D40
|00972E| dw LinkGraphics+$1D80 ; 0x09D - $109D80
|009730| dw LinkGraphics+$1DC0 ; 0x09E - $109DC0
|009732| dw LinkGraphics+$1D40 ; 0x09F - $109D40
|009734| dw LinkGraphics+$1D80 ; 0x0A0 - $109D80
|009736| dw LinkGraphics+$1DC0 ; 0x0A1 - $109DC0
|009738| dw LinkGraphics+$0D00 ; 0x0A2 - $108D00
|00973A| dw LinkGraphics+$4680 ; 0x0A3 - $10C680
|00973C| dw LinkGraphics+$4180 ; 0x0A4 - $10C180
|00973E| dw LinkGraphics+$4140 ; 0x0A5 - $10C140
|009740| dw LinkGraphics+$0C00 ; 0x0A6 - $108C00
|009742| dw LinkGraphics+$4C80 ; 0x0A7 - $10CC80
|009744| dw LinkGraphics+$4C80 ; 0x0A8 - $10CC80
|009746| dw LinkGraphics+$4C00 ; 0x0A9 - $10CC00
|009748| dw LinkGraphics+$4600 ; 0x0AA - $10C600
|00974A| dw LinkGraphics+$4C00 ; 0x0AB - $10CC00
|00974C| dw LinkGraphics+$4600 ; 0x0AC - $10C600
|00974E| dw LinkGraphics+$3D00 ; 0x0AD - $10BD00
|009750| dw LinkGraphics+$0580 ; 0x0AE - $108580
|009752| dw LinkGraphics+$0800 ; 0x0AF - $108800
|009754| dw LinkGraphics+$49C0 ; 0x0B0 - $10C9C0
|009756| dw LinkGraphics+$4CC0 ; 0x0B1 - $10CCC0
|009758| dw LinkGraphics+$4DC0 ; 0x0B2 - $10CDC0
|00975A| dw LinkGraphics+$4D00 ; 0x0B3 - $10CD00
|00975C| dw LinkGraphics+$4D40 ; 0x0B4 - $10CD40
|00975E| dw LinkGraphics+$4D80 ; 0x0B5 - $10CD80
|009760| dw LinkGraphics+$0500 ; 0x0B6 - $108500
|009762| dw LinkGraphics+$0540 ; 0x0B7 - $108540
|009764| dw LinkGraphics+$4940 ; 0x0B8 - $10C940
|009766| dw LinkGraphics+$4980 ; 0x0B9 - $10C980
|009768| dw LinkGraphics+$0540 ; 0x0BA - $108540
|00976A| dw LinkGraphics+$4940 ; 0x0BB - $10C940
|00976C| dw LinkGraphics+$4980 ; 0x0BC - $10C980
|00976E| dw LinkGraphics+$0440 ; 0x0BD - $108440
|009770| dw LinkGraphics+$0480 ; 0x0BE - $108480
|009772| dw LinkGraphics+$41C0 ; 0x0BF - $10C1C0
|009774| dw LinkGraphics+$4900 ; 0x0C0 - $10C900
|009776| dw LinkGraphics+$4580 ; 0x0C1 - $10C580
|009778| dw LinkGraphics+$45C0 ; 0x0C2 - $10C5C0
|00977A| dw LinkGraphics+$48C0 ; 0x0C3 - $10C8C0
|00977C| dw LinkGraphics+$0440 ; 0x0C4 - $108440
|00977E| dw LinkGraphics+$0480 ; 0x0C5 - $108480
|009780| dw LinkGraphics+$41C0 ; 0x0C6 - $10C1C0
|009782| dw LinkGraphics+$4900 ; 0x0C7 - $10C900
|009784| dw LinkGraphics+$4580 ; 0x0C8 - $10C580
|009786| dw LinkGraphics+$45C0 ; 0x0C9 - $10C5C0
|009788| dw LinkGraphics+$48C0 ; 0x0CA - $10C8C0
|00978A| dw LinkGraphics+$3D00 ; 0x0CB - $10BD00
|00978C| dw LinkGraphics+$2CC0 ; 0x0CC - $10ACC0
|00978E| dw LinkGraphics+$4040 ; 0x0CD - $10C040
|009790| dw LinkGraphics+$5540 ; 0x0CE - $10D540
|009792| dw LinkGraphics+$5580 ; 0x0CF - $10D580
|009794| dw LinkGraphics+$54C0 ; 0x0D0 - $10D4C0
|009796| dw LinkGraphics+$5500 ; 0x0D1 - $10D500
|009798| dw LinkGraphics+$54C0 ; 0x0D2 - $10D4C0
|00979A| dw LinkGraphics+$5500 ; 0x0D3 - $10D500
|00979C| dw LinkGraphics+$5440 ; 0x0D4 - $10D440
|00979E| dw LinkGraphics+$5480 ; 0x0D5 - $10D480
|0097A0| dw LinkGraphics+$5440 ; 0x0D6 - $10D440
|0097A2| dw LinkGraphics+$5480 ; 0x0D7 - $10D480
|0097A4| dw LinkGraphics+$51C0 ; 0x0D8 - $10D1C0
|0097A6| dw LinkGraphics+$5400 ; 0x0D9 - $10D400
|0097A8| dw LinkGraphics+$5100 ; 0x0DA - $10D100
|0097AA| dw LinkGraphics+$5100 ; 0x0DB - $10D100
|0097AC| dw LinkGraphics+$5140 ; 0x0DC - $10D140
|0097AE| dw LinkGraphics+$5180 ; 0x0DD - $10D180
|0097B0| dw LinkGraphics+$5140 ; 0x0DE - $10D140
|0097B2| dw LinkGraphics+$5180 ; 0x0DF - $10D180
|0097B4| dw LinkGraphics+$30C0 ; 0x0E0 - $10B0C0
|0097B6| dw LinkGraphics+$3100 ; 0x0E1 - $10B100
|0097B8| dw LinkGraphics+$3140 ; 0x0E2 - $10B140
|0097BA| dw LinkGraphics+$3100 ; 0x0E3 - $10B100
|0097BC| dw LinkGraphics+$3140 ; 0x0E4 - $10B140
|0097BE| dw LinkGraphics+$5D40 ; 0x0E5 - $10DD40
|0097C0| dw LinkGraphics+$5D80 ; 0x0E6 - $10DD80
|0097C2| dw LinkGraphics+$5DC0 ; 0x0E7 - $10DDC0
|0097C4| dw LinkGraphics+$5D80 ; 0x0E8 - $10DD80
|0097C6| dw LinkGraphics+$5DC0 ; 0x0E9 - $10DDC0
|0097C8| dw LinkGraphics+$5C80 ; 0x0EA - $10DC80
|0097CA| dw LinkGraphics+$5CC0 ; 0x0EB - $10DCC0
|0097CC| dw LinkGraphics+$5D00 ; 0x0EC - $10DD00
|0097CE| dw LinkGraphics+$5C80 ; 0x0ED - $10DC80
|0097D0| dw LinkGraphics+$5CC0 ; 0x0EE - $10DCC0
|0097D2| dw LinkGraphics+$5D00 ; 0x0EF - $10DD00
|0097D4| dw LinkGraphics+$5100 ; 0x0F0 - $10D100
|0097D6| dw LinkGraphics+$5100 ; 0x0F1 - $10D100
|0097D8| dw LinkGraphics+$6000 ; 0x0F2 - $10E000
|0097DA| dw LinkGraphics+$6040 ; 0x0F3 - $10E040
|0097DC| dw LinkGraphics+$6080 ; 0x0F4 - $10E080
|0097DE| dw LinkGraphics+$60C0 ; 0x0F5 - $10E0C0
|0097E0| dw LinkGraphics+$6100 ; 0x0F6 - $10E100
|0097E2| dw LinkGraphics+$6140 ; 0x0F7 - $10E140
|0097E4| dw LinkGraphics+$6000 ; 0x0F8 - $10E000
|0097E6| dw LinkGraphics+$6040 ; 0x0F9 - $10E040
|0097E8| dw LinkGraphics+$6080 ; 0x0FA - $10E080
|0097EA| dw LinkGraphics+$60C0 ; 0x0FB - $10E0C0
|0097EC| dw LinkGraphics+$6100 ; 0x0FC - $10E100
|0097EE| dw LinkGraphics+$6140 ; 0x0FD - $10E140
|0097F0| dw LinkGraphics+$0000 ; 0x0FE - $108000
|0097F2| dw LinkGraphics+$50C0 ; 0x0FF - $10D0C0
|0097F4| dw LinkGraphics+$0000 ; 0x100 - $108000
|0097F6| dw LinkGraphics+$3940 ; 0x101 - $10B940
|0097F8| dw LinkGraphics+$3980 ; 0x102 - $10B980
|0097FA| dw LinkGraphics+$3940 ; 0x103 - $10B940
|0097FC| dw LinkGraphics+$5D40 ; 0x104 - $10DD40
|0097FE| dw LinkGraphics+$5D80 ; 0x105 - $10DD80
|009800| dw LinkGraphics+$5D40 ; 0x106 - $10DD40
|009802| dw LinkGraphics+$5C80 ; 0x107 - $10DC80
|009804| dw LinkGraphics+$5CC0 ; 0x108 - $10DCC0
|009806| dw LinkGraphics+$40C0 ; 0x109 - $10C0C0
|009808| dw LinkGraphics+$5C80 ; 0x10A - $10DC80
|00980A| dw LinkGraphics+$5CC0 ; 0x10B - $10DCC0
|00980C| dw LinkGraphics+$40C0 ; 0x10C - $10C0C0
|00980E| dw LinkGraphics+$39C0 ; 0x10D - $10B9C0
|009810| dw LinkGraphics+$3980 ; 0x10E - $10B980
|009812| dw LinkGraphics+$39C0 ; 0x10F - $10B9C0
|009814| dw LinkGraphics+$2560 ; 0x110 - $10A560
|009816| dw LinkGraphics+$25A0 ; 0x111 - $10A5A0
|009818| dw LinkGraphics+$2C80 ; 0x112 - $10AC80
|00981A| dw LinkGraphics+$6D00 ; 0x113 - $10ED00
|00981C| dw LinkGraphics+$0000 ; 0x114 - $108000
|00981E| dw LinkGraphics+$0CC0 ; 0x115 - $108CC0
|009820| dw LinkGraphics+$3D00 ; 0x116 - $10BD00
|009822| dw LinkGraphics+$6380 ; 0x117 - $10E380
|009824| dw LinkGraphics+$3DC0 ; 0x118 - $10BDC0
|009826| dw LinkGraphics+$6500 ; 0x119 - $10E500
|009828| dw LinkGraphics+$6500 ; 0x11A - $10E500
|00982A| dw LinkGraphics+$6880 ; 0x11B - $10E880
|00982C| dw LinkGraphics+$68C0 ; 0x11C - $10E8C0
|00982E| dw LinkGraphics+$68C0 ; 0x11D - $10E8C0
|009830| dw LinkGraphics+$6800 ; 0x11E - $10E800
|009832| dw LinkGraphics+$65C0 ; 0x11F - $10E5C0
|009834| dw LinkGraphics+$65C0 ; 0x120 - $10E5C0
|009836| dw LinkGraphics+$6940 ; 0x121 - $10E940
|009838| dw LinkGraphics+$6980 ; 0x122 - $10E980
|00983A| dw LinkGraphics+$6940 ; 0x123 - $10E940
|00983C| dw LinkGraphics+$6980 ; 0x124 - $10E980
|00983E| dw LinkGraphics+$3D40 ; 0x125 - $10BD40
|009840| dw LinkGraphics+$0C80 ; 0x126 - $108C80
|009842| dw LinkGraphics+$2080 ; 0x127 - $10A080
|009844| dw LinkGraphics+$0000 ; 0x128 - $108000
|009846| dw LinkGraphics+$2980 ; 0x129 - $10A980
|009848| dw LinkGraphics+$3D00 ; 0x12A - $10BD00
|00984A| dw LinkGraphics+$3DC0 ; 0x12B - $10BDC0
|00984C| dw LinkGraphics+$3400 ; 0x12C - $10B400
|00984E| dw LinkGraphics+$2880 ; 0x12D - $10A880
|009850| dw LinkGraphics+$6DC0 ; 0x12E - $10EDC0

;===================================================================================================

LinkOAM_AuxAddresses:
|009852| dw LinkGraphics+$1A40 ; 0x000 - $109A40
|009854| dw LinkGraphics+$1E00 ; 0x001 - $109E00
|009856| dw LinkGraphics+$1D20 ; 0x002 - $109D20
|009858| dw LinkGraphics+$1F20 ; 0x003 - $109F20
|00985A| dw LinkGraphics+$1B20 ; 0x004 - $109B20
|00985C| dw LinkGraphics+$3C20 ; 0x005 - $10BC20
|00985E| dw LinkGraphics+$3C20 ; 0x006 - $10BC20
|009860| dw LinkGraphics+$3E20 ; 0x007 - $10BE20
|009862| dw LinkGraphics+$3E20 ; 0x008 - $10BE20
|009864| dw LinkGraphics+$3E00 ; 0x009 - $10BE00
|009866| dw LinkGraphics+$3E00 ; 0x00A - $10BE00
|009868| dw LinkGraphics+$3E00 ; 0x00B - $10BE00
|00986A| dw LinkGraphics+$3E00 ; 0x00C - $10BE00
|00986C| dw LinkGraphics+$2540 ; 0x00D - $10A540
|00986E| dw LinkGraphics+$2540 ; 0x00E - $10A540
|009870| dw LinkGraphics+$2540 ; 0x00F - $10A540
|009872| dw LinkGraphics+$2540 ; 0x010 - $10A540
|009874| dw LinkGraphics+$3C00 ; 0x011 - $10BC00
|009876| dw LinkGraphics+$3C00 ; 0x012 - $10BC00
|009878| dw LinkGraphics+$3C00 ; 0x013 - $10BC00
|00987A| dw LinkGraphics+$3C00 ; 0x014 - $10BC00
|00987C| dw LinkGraphics+$2740 ; 0x015 - $10A740
|00987E| dw LinkGraphics+$2740 ; 0x016 - $10A740
|009880| dw LinkGraphics+$2740 ; 0x017 - $10A740
|009882| dw LinkGraphics+$2740 ; 0x018 - $10A740
|009884| dw LinkGraphics+$6780 ; 0x019 - $10E780
|009886| dw LinkGraphics+$6780 ; 0x01A - $10E780

;===================================================================================================

TilemapUpload_HighBytes:
|009888| db $00 ; 0x00 - VRAM $0000
|009889| db $00 ; 0x01 - VRAM $0000
|00988A| db $04 ; 0x02 - VRAM $0800
|00988B| db $08 ; 0x03 - VRAM $1000
|00988C| db $0C ; 0x04 - VRAM $1800
|00988D| db $08 ; 0x05 - VRAM $1000
|00988E| db $0C ; 0x06 - VRAM $1800
|00988F| db $00 ; 0x07 - VRAM $0000
|009890| db $04 ; 0x08 - VRAM $0800
|009891| db $00 ; 0x09 - VRAM $0000
|009892| db $08 ; 0x0A - VRAM $1000
|009893| db $04 ; 0x0B - VRAM $0800
|009894| db $0C ; 0x0C - VRAM $1800
|009895| db $04 ; 0x0D - VRAM $0800
|009896| db $0C ; 0x0E - VRAM $1800
|009897| db $00 ; 0x0F - VRAM $0000
|009898| db $08 ; 0x10 - VRAM $1000
|009899| db $10 ; 0x11 - VRAM $2000
|00989A| db $14 ; 0x12 - VRAM $2800
|00989B| db $18 ; 0x13 - VRAM $3000
|00989C| db $1C ; 0x14 - VRAM $3800
|00989D| db $18 ; 0x15 - VRAM $3000
|00989E| db $1C ; 0x16 - VRAM $3800
|00989F| db $10 ; 0x17 - VRAM $2000
|0098A0| db $14 ; 0x18 - VRAM $2800
|0098A1| db $10 ; 0x19 - VRAM $2000
|0098A2| db $18 ; 0x1A - VRAM $3000
|0098A3| db $14 ; 0x1B - VRAM $2800
|0098A4| db $1C ; 0x1C - VRAM $3800
|0098A5| db $14 ; 0x1D - VRAM $2800
|0098A6| db $1C ; 0x1E - VRAM $3800
|0098A7| db $10 ; 0x1F - VRAM $2000
|0098A8| db $18 ; 0x20 - VRAM $3000
|0098A9| db $60 ; 0x21 - VRAM $C000
|0098AA| db $68 ; 0x22 - VRAM $D000

;===================================================================================================
; FREE ROM: 0x15
;===================================================================================================
NULL_0098AB:
|0098AB| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0098B3| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|0098BB| db $FF, $FF, $FF, $FF, $FF

;===================================================================================================

BitMasks:
|0098C0| dw $8000 ; Sewers
|0098C2| dw $4000 ; Hyrule Castle
|0098C4| dw $2000 ; Eastern Palace
|0098C6| dw $1000 ; Desert Palace

DoorFlagMasks:
|0098C8| dw $0800 ; Agahnim's Tower
|0098CA| dw $0400 ; Swamp Palace
|0098CC| dw $0200 ; Palace of Darkness
|0098CE| dw $0100 ; Misery Mire
|0098D0| dw $0080 ; Skull Woods
|0098D2| dw $0040 ; Ice Palace
|0098D4| dw $0020 ; Tower of Hera
|0098D6| dw $0010 ; Thieves' Town
|0098D8| dw $0008 ; Turtle Rock
|0098DA| dw $0004 ; Ganon's Tower
|0098DC| dw $0002
|0098DE| dw $0001

BitMasksInverted:
|0098E0| dw $7FFF ; Sewers
|0098E2| dw $BFFF ; Hyrule Castle
|0098E4| dw $DFFF ; Eastern Palace
|0098E6| dw $EFFF ; Desert Palace
|0098E8| dw $F7FF ; Agahnim's Tower
|0098EA| dw $FBFF ; Swamp Palace
|0098EC| dw $FDFF ; Palace of Darkness
|0098EE| dw $FEFF ; Misery Mire
|0098F0| dw $FF7F ; Skull Woods
|0098F2| dw $FFBF ; Ice Palace
|0098F4| dw $FFDF ; Tower of Hera
|0098F6| dw $FFEF ; Thieves' Town
|0098F8| dw $FFF7 ; Turtle Rock
|0098FA| dw $FFFB ; Ganon's Tower
|0098FC| dw $FFFD
|0098FE| dw $FFFE

;===================================================================================================

RoomFlagMask:
|009900| dw $0100
|009902| dw $0200
|009904| dw $0400
|009906| dw $0800
|009908| dw $1000
|00990A| dw $2000

;===================================================================================================

RoomsWithPitDamage:
|00990C| dw $0072 ; ROOM 0072
|00990E| dw $0082 ; ROOM 0082
|009910| dw $0040 ; ROOM 0040
|009912| dw $00C0 ; ROOM 00C0
|009914| dw $0112 ; ROOM 0112
|009916| dw $0056 ; ROOM 0056
|009918| dw $0057 ; ROOM 0057
|00991A| dw $0058 ; ROOM 0058
|00991C| dw $0067 ; ROOM 0067
|00991E| dw $0068 ; ROOM 0068
|009920| dw $0049 ; ROOM 0049
|009922| dw $0098 ; ROOM 0098
|009924| dw $00D1 ; ROOM 00D1
|009926| dw $00C3 ; ROOM 00C3
|009928| dw $00A3 ; ROOM 00A3
|00992A| dw $00A2 ; ROOM 00A2
|00992C| dw $0092 ; ROOM 0092
|00992E| dw $00A0 ; ROOM 00A0
|009930| dw $004E ; ROOM 004E
|009932| dw $007F ; ROOM 007F
|009934| dw $00AF ; ROOM 00AF
|009936| dw $00F0 ; ROOM 00F0
|009938| dw $00F1 ; ROOM 00F1
|00993A| dw $00E6 ; ROOM 00E6
|00993C| dw $00E7 ; ROOM 00E7
|00993E| dw $00C6 ; ROOM 00C6
|009940| dw $00C7 ; ROOM 00C7
|009942| dw $00D6 ; ROOM 00D6
|009944| dw $00B4 ; ROOM 00B4
|009946| dw $00B5 ; ROOM 00B5
|009948| dw $00C5 ; ROOM 00C5
|00994A| dw $0024 ; ROOM 0024
|00994C| dw $00D5 ; ROOM 00D5
|00994E| dw $00C9 ; ROOM 00C9
|009950| dw $002A ; ROOM 002A
|009952| dw $001A ; ROOM 001A
|009954| dw $004B ; ROOM 004B
|009956| dw $00BC ; ROOM 00BC
|009958| dw $0044 ; ROOM 0044
|00995A| dw $00FB ; ROOM 00FB
|00995C| dw $007B ; ROOM 007B
|00995E| dw $007C ; ROOM 007C
|009960| dw $008B ; ROOM 008B
|009962| dw $008D ; ROOM 008D
|009964| dw $009B ; ROOM 009B
|009966| dw $009C ; ROOM 009C
|009968| dw $009D ; ROOM 009D
|00996A| dw $00A5 ; ROOM 00A5
|00996C| dw $0095 ; ROOM 0095
|00996E| dw $001C ; ROOM 001C
|009970| dw $005C ; ROOM 005C
|009972| dw $007D ; ROOM 007D
|009974| dw $004C ; ROOM 004C
|009976| dw $0096 ; ROOM 0096
|009978| dw $0120 ; ROOM 0120
|00997A| dw $003C ; ROOM 003C
|00997C| dw $0123 ; ROOM 0123

;===================================================================================================

DoorTilemapPositions_NorthWall:
|00997E| dw $021C
|009980| dw $023C
|009982| dw $025C
|009984| dw $039C
|009986| dw $03BC
|009988| dw $03DC

DoorTilemapPositions_NorthMiddle:
|00998A| dw $121C
|00998C| dw $123C
|00998E| dw $125C
|009990| dw $139C
|009992| dw $13BC
|009994| dw $13DC

DoorTilemapPositions_SouthMiddle:
|009996| dw $0D1C
|009998| dw $0D3C
|00999A| dw $0D5C
|00999C| dw $0B9C
|00999E| dw $0BBC
|0099A0| dw $0BDC
|0099A2| dw $1D1C
|0099A4| dw $1D3C
|0099A6| dw $1D5C

DoorTilemapPositions_LowerLayerEntrance:
|0099A8| dw $1B9C
|0099AA| dw $1BBC
|0099AC| dw $1BDC

DoorTilemapPositions_WestWall:
|0099AE| dw $0784
|0099B0| dw $0F84
|0099B2| dw $1784
|0099B4| dw $078A
|0099B6| dw $0F8A
|0099B8| dw $178A

DoorTilemapPositions_WestMiddle:
|0099BA| dw $07C4
|0099BC| dw $0FC4
|0099BE| dw $17C4
|0099C0| dw $07CA
|0099C2| dw $0FCA
|0099C4| dw $17CA

DoorTilemapPositions_EastMiddle:
|0099C6| dw $07B4
|0099C8| dw $0FB4
|0099CA| dw $17B4
|0099CC| dw $07AE
|0099CE| dw $0FAE
|0099D0| dw $17AE

DoorTilemapPositions_EastWall:
|0099D2| dw $07F4
|0099D4| dw $0FF4
|0099D6| dw $17F4
|0099D8| dw $07EE
|0099DA| dw $0FEE
|0099DC| dw $17EE

;===================================================================================================

ExplodingWallTilemapPosition:
|0099DE| dw $0D8A
|0099E0| dw $0DAA
|0099E2| dw $0DCA
|0099E4| dw $02B6
|0099E6| dw $0AB6
|0099E8| dw $12B6

;===================================================================================================

StaircaseFinder:

.offset_y
|0099EA| dw $0007
|0099EC| dw $0018
|0099EE| dw $0008
|0099F0| dw $0008

.offset_x
|0099F2| dw $0000
|0099F4| dw $0000
|0099F6| dw $FFFF
|0099F8| dw $0011

.index_offset
|0099FA| dw $0002
|0099FC| dw $0002
|0099FE| dw $0080
|009A00| dw $0080

;===================================================================================================

DoorwayReplacementDoorGFX:
|009A02| dw $0000 ; DOORTYPE 00 => DOORTYPE 00
|009A04| dw $0002 ; DOORTYPE 02 => DOORTYPE 02
|009A06| dw $0000 ; DOORTYPE 04 => DOORTYPE 00
|009A08| dw $0000 ; DOORTYPE 06 => DOORTYPE 00
|009A0A| dw $0000 ; DOORTYPE 08 => DOORTYPE 00
|009A0C| dw $0000 ; DOORTYPE 0A => DOORTYPE 00
|009A0E| dw $0000 ; DOORTYPE 0C => DOORTYPE 00
|009A10| dw $0000 ; DOORTYPE 0E => DOORTYPE 00
|009A12| dw $0000 ; DOORTYPE 10 => DOORTYPE 00
|009A14| dw $0012 ; DOORTYPE 12 => DOORTYPE 12
|009A16| dw $0000 ; DOORTYPE 14 => DOORTYPE 00
|009A18| dw $0000 ; DOORTYPE 16 => DOORTYPE 00
|009A1A| dw $0050 ; DOORTYPE 18 => DOORTYPE 50
|009A1C| dw $0000 ; DOORTYPE 1A => DOORTYPE 00
|009A1E| dw $0050 ; DOORTYPE 1C => DOORTYPE 50
|009A20| dw $0050 ; DOORTYPE 1E => DOORTYPE 50
|009A22| dw $0060 ; DOORTYPE 20 => DOORTYPE 60
|009A24| dw $0062 ; DOORTYPE 22 => DOORTYPE 62
|009A26| dw $0064 ; DOORTYPE 24 => DOORTYPE 64
|009A28| dw $0066 ; DOORTYPE 26 => DOORTYPE 66
|009A2A| dw $0052 ; DOORTYPE 28 => DOORTYPE 52
|009A2C| dw $005A ; DOORTYPE 2A => DOORTYPE 5A
|009A2E| dw $0050 ; DOORTYPE 2C => DOORTYPE 50
|009A30| dw $0052 ; DOORTYPE 2E => DOORTYPE 52
|009A32| dw $0054 ; DOORTYPE 30 => DOORTYPE 54
|009A34| dw $0056 ; DOORTYPE 32 => DOORTYPE 56
|009A36| dw $0000 ; DOORTYPE 34 => DOORTYPE 00
|009A38| dw $0050 ; DOORTYPE 36 => DOORTYPE 50
|009A3A| dw $0050 ; DOORTYPE 38 => DOORTYPE 50
|009A3C| dw $0000 ; DOORTYPE 3A => DOORTYPE 00
|009A3E| dw $0000 ; DOORTYPE 3C => DOORTYPE 00
|009A40| dw $0000 ; DOORTYPE 3E => DOORTYPE 00
|009A42| dw $0040 ; DOORTYPE 40 => DOORTYPE 40
|009A44| dw $0058 ; DOORTYPE 42 => DOORTYPE 58
|009A46| dw $0058 ; DOORTYPE 44 => DOORTYPE 58
|009A48| dw $0000 ; DOORTYPE 46 => DOORTYPE 00
|009A4A| dw $0058 ; DOORTYPE 48 => DOORTYPE 58
|009A4C| dw $0058 ; DOORTYPE 4A => DOORTYPE 58
|009A4E| dw $0000 ; DOORTYPE 4C => DOORTYPE 00
|009A50| dw $0000 ; DOORTYPE 4E => DOORTYPE 00

;---------------------------------------------------------------------------------------------------

DoorwayTileProperties:
|009A52| dw $8080 ; DOORTYPE 00 => TILETYPE 80
|009A54| dw $8484 ; DOORTYPE 02 => TILETYPE 84
|009A56| dw $0000 ; DOORTYPE 04 => TILETYPE 00
|009A58| dw $0101 ; DOORTYPE 06 => TILETYPE 01
|009A5A| dw $8484 ; DOORTYPE 08 => TILETYPE 84
|009A5C| dw $8E8E ; DOORTYPE 0A => TILETYPE 8E
|009A5E| dw $0000 ; DOORTYPE 0C => TILETYPE 00
|009A60| dw $0000 ; DOORTYPE 0E => TILETYPE 00
|009A62| dw $8888 ; DOORTYPE 10 => TILETYPE 88
|009A64| dw $8E8E ; DOORTYPE 12 => TILETYPE 8E
|009A66| dw $8080 ; DOORTYPE 14 => TILETYPE 80
|009A68| dw $8080 ; DOORTYPE 16 => TILETYPE 80
|009A6A| dw $8282 ; DOORTYPE 18 => TILETYPE 82
|009A6C| dw $8080 ; DOORTYPE 1A => TILETYPE 80
|009A6E| dw $8080 ; DOORTYPE 1C => TILETYPE 80
|009A70| dw $8080 ; DOORTYPE 1E => TILETYPE 80
|009A72| dw $8080 ; DOORTYPE 20 => TILETYPE 80
|009A74| dw $8080 ; DOORTYPE 22 => TILETYPE 80
|009A76| dw $8080 ; DOORTYPE 24 => TILETYPE 80
|009A78| dw $8080 ; DOORTYPE 26 => TILETYPE 80
|009A7A| dw $8282 ; DOORTYPE 28 => TILETYPE 82
|009A7C| dw $8E8E ; DOORTYPE 2A => TILETYPE 8E
|009A7E| dw $8080 ; DOORTYPE 2C => TILETYPE 80
|009A80| dw $8282 ; DOORTYPE 2E => TILETYPE 82
|009A82| dw $8080 ; DOORTYPE 30 => TILETYPE 80
|009A84| dw $8080 ; DOORTYPE 32 => TILETYPE 80
|009A86| dw $8080 ; DOORTYPE 34 => TILETYPE 80
|009A88| dw $8282 ; DOORTYPE 36 => TILETYPE 82
|009A8A| dw $8282 ; DOORTYPE 38 => TILETYPE 82
|009A8C| dw $8080 ; DOORTYPE 3A => TILETYPE 80
|009A8E| dw $8080 ; DOORTYPE 3C => TILETYPE 80
|009A90| dw $8080 ; DOORTYPE 3E => TILETYPE 80
|009A92| dw $8484 ; DOORTYPE 40 => TILETYPE 84
|009A94| dw $8484 ; DOORTYPE 42 => TILETYPE 84
|009A96| dw $8686 ; DOORTYPE 44 => TILETYPE 86
|009A98| dw $8888 ; DOORTYPE 46 => TILETYPE 88
|009A9A| dw $8686 ; DOORTYPE 48 => TILETYPE 86
|009A9C| dw $8686 ; DOORTYPE 4A => TILETYPE 86
|009A9E| dw $8080 ; DOORTYPE 4C => TILETYPE 80
|009AA0| dw $8080 ; DOORTYPE 4E => TILETYPE 80

;===================================================================================================

PartnerDoorSelfLocation:
|009AA2| dw $0000, $0010, $0020, $0030, $0040, $0050 ; North
|009AAE| dw $0061, $0071, $0081, $0091, $00A1, $00B1 ; South
|009ABA| dw $0002, $0012, $0022, $0032, $0042, $0052 ; East
|009AC6| dw $0063, $0073, $0083, $0093, $00A3, $00B3 ; West

PartnerDoorLocation:
|009AD2| dw $0061, $0071, $0081, $0091, $00A1, $00B1 ; North
|009ADE| dw $0000, $0010, $0020, $0030, $0040, $0050 ; South
|009AEA| dw $0063, $0073, $0083, $0093, $00A3, $00B3 ; East
|009AF6| dw $0002, $0012, $0022, $0032, $0042, $0052 ; West

;===================================================================================================

RoomQuadrantDataOffset:
|009B02| dw $0000
|009B04| dw $0040
|009B06| dw $1000
|009B08| dw $1040

;===================================================================================================

MovingWallDirection:
|009B0A| dw $0005
|009B0C| dw $0007
|009B0E| dw $000B
|009B10| dw $000F

;---------------------------------------------------------------------------------------------------

MovingWallObjectCount:
|009B12| dw $0008
|009B14| dw $0010
|009B16| dw $0018
|009B18| dw $0020

;---------------------------------------------------------------------------------------------------

MovingWallEastBoundaries:
|009B1A| dw $FFC1
|009B1C| dw $FF81
|009B1E| dw $FF41
|009B20| dw $FF01

|009B22| dw $FFB9
|009B24| dw $FF79
|009B26| dw $FF39
|009B28| dw $FEF9

;---------------------------------------------------------------------------------------------------

MovingWallWestBoundaries:
|009B2A| dw $0042
|009B2C| dw $0082
|009B2E| dw $00C2
|009B30| dw $0102

|009B32| dw $004A
|009B34| dw $008A
|009B36| dw $00CA
|009B38| dw $010A

;===================================================================================================

WaterOverlayHDMAPositionOffset:
|009B3A| dw $0002
|009B3C| dw $0003
|009B3E| dw $0004
|009B40| dw $0005

WaterOverlayHDMASize:
|009B42| dw $0020
|009B44| dw $0030

WaterOverlayObjectCount:
|009B46| dw $0040
|009B48| dw $0050

;===================================================================================================

UNREACHABLE_009B4A:
|009B4A| dw $0003, $0005, $0007, $0009

;===================================================================================================

RoomDrawObjectData:

;---------------------------------------------------------------------------------------------------

^.obj0000
|009B52| dw $14EE, $14EF, $14EE, $14EF
|009B5A| dw $14FE, $14FF, $14FE, $14FF

;---------------------------------------------------------------------------------------------------

^.obj0010
|009B62| dw $0CEE, $0CEF, $0CEE, $0CEF
|009B6A| dw $0CFE, $0CFF, $0CFE, $0CFF

;---------------------------------------------------------------------------------------------------

^.obj0020
|009B72| dw $0CEC, $0CED, $0CEC, $0CED
|009B7A| dw $0CFC, $0CFD, $0CFC, $0CFD

;---------------------------------------------------------------------------------------------------

^.obj0030
|009B82| dw $14EC, $14ED, $14EC, $14ED
|009B8A| dw $14FC, $14FD, $14FC, $14FD

;---------------------------------------------------------------------------------------------------

^.obj0040
|009B92| dw $18EE, $18EF, $18EE, $18EF
|009B9A| dw $18FE, $18FF, $18FE, $18FF

;---------------------------------------------------------------------------------------------------

^.obj0050
|009BA2| dw $10EE, $10EF, $10EE, $10EF
|009BAA| dw $10FE, $10FF, $10FE, $10FF

;---------------------------------------------------------------------------------------------------

^.obj0060
|009BB2| dw $10EC, $10ED, $10EC, $10ED
|009BBA| dw $10FC, $10FD, $10FC, $10FD

;---------------------------------------------------------------------------------------------------

^.obj0070
|009BC2| dw $18EC, $18ED, $18EC, $18ED
|009BCA| dw $18FC, $18FD, $18FC, $18FD

;---------------------------------------------------------------------------------------------------

^.obj0080
|009BD2| dw $10C1, $10C1, $10C1, $10C1
|009BDA| dw $10C1, $10C1, $10C1, $10C1

;---------------------------------------------------------------------------------------------------

^.obj0090
|009BE2| dw $18CA, $18CB, $18CA, $18CB
|009BEA| dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

^.obj00A0
|009BF2| dw $18C9, $18C9, $18C9, $18C9
|009BFA| dw $18C9, $18C9, $18C9, $18C9

;---------------------------------------------------------------------------------------------------

^.obj00B0
|009C02| dw $1DB6, $1DB7, $1DB6, $1DB7
|009C0A| dw $1DB8, $1DB9, $1DB8, $1DB9

;---------------------------------------------------------------------------------------------------

^.obj00C0
|009C12| dw $1DAE, $1DAF, $1DAE, $1DAF
|009C1A| dw $1DBE, $1DBF, $1DBE, $1DBF

;---------------------------------------------------------------------------------------------------

^.obj00D0
|009C22| dw $090C, $490C, $090C, $490C
|009C2A| dw $890C, $C90C, $890C, $C90C

;---------------------------------------------------------------------------------------------------

^.obj00E0
|009C32| dw $01EC, $01EC, $01EC, $01EC
|009C3A| dw $01EC, $01EC, $01EC, $01EC

;---------------------------------------------------------------------------------------------------

^.obj00F0
|009C42| dw $01EB, $01EB, $01EB, $01EB
|009C4A| dw $01EB, $01EB, $01EB, $01EB

;---------------------------------------------------------------------------------------------------

^.obj0100
|009C52| dw $1DBA, $1DBB, $1DBA, $1DBB
|009C5A| dw $1DBC, $1DBD, $1DBC, $1DBD

;---------------------------------------------------------------------------------------------------

^.obj0110
|009C62| dw $1DB6, $1DB7, $1DB6, $1DB7
|009C6A| dw $1DB8, $1DB9, $1DB8, $1DB9

;---------------------------------------------------------------------------------------------------

^.obj0120
|009C72| dw $1DB0, $1DB1, $1DB0, $1DB1
|009C7A| dw $9DB0, $9DB1, $9DB0, $9DB1

;---------------------------------------------------------------------------------------------------

^.obj0130
|009C82| dw $1DBA, $1DBB, $1DBA, $1DBB
|009C8A| dw $1DBC, $1DBD, $1DBC, $1DBD

;---------------------------------------------------------------------------------------------------

^.obj0140
|009C92| dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

^.obj0148
|009C9A| dw $1DA6, $5DA6, $1DA6, $5DA6
|009CA2| dw $9DA6, $DDA6, $9DA6, $DDA6

;---------------------------------------------------------------------------------------------------

^.obj0158
|009CAA| dw $08D0, $08D0, $08D0, $08D0
|009CB2| dw $08D0, $08D0, $08D0, $08D0

;---------------------------------------------------------------------------------------------------

^.obj0168
|009CBA| dw $18CA, $18CB, $18CA, $18CB
|009CC2| dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

^.obj0178
|009CCA| dw $0C62, $0C63, $0C62, $0C63
|009CD2| dw $0C62, $0C63, $0C62, $0C63

;---------------------------------------------------------------------------------------------------

^.obj0188
|009CDA| dw $0DCC, $0DCC, $0DCC, $0DCC
|009CE2| dw $0DCC, $0DCC, $0DCC, $0DCC

;---------------------------------------------------------------------------------------------------

^.obj0198
|009CEA| dw $090D, $091D, $490D, $491D

;---------------------------------------------------------------------------------------------------

^.obj01A0
|009CF2| dw $10EC, $10ED, $10EC, $10ED
|009CFA| dw $10FC, $10FD, $10FC, $10FD

;---------------------------------------------------------------------------------------------------

^.obj01B0
|009D02| dw $090C, $490C, $090C, $490C
|009D0A| dw $890C, $C90C, $890C, $C90C

;---------------------------------------------------------------------------------------------------

^.obj01C0
|009D12| dw $190F, $190F, $190F, $190F
|009D1A| dw $190F, $190F, $190F, $190F

;---------------------------------------------------------------------------------------------------

^.obj01D0
|009D22| dw $09BE, $49BE, $09BE, $49BE
|009D2A| dw $09BE, $49BE, $09BE, $49BE

;---------------------------------------------------------------------------------------------------

^.obj01E0
|009D32| dw $09BF, $49BF, $09BF, $49BF
|009D3A| dw $09BF, $49BF, $09BF, $49BF

;---------------------------------------------------------------------------------------------------

^.obj01F0
|009D42| dw $09B1, $09B1, $09B1, $09B1
|009D4A| dw $89B1, $89B1, $89B1, $89B1

;---------------------------------------------------------------------------------------------------

^.obj0200
|009D52| dw $09B0, $09B0, $09B0, $09B0
|009D5A| dw $89B0, $89B0, $89B0, $89B0

;---------------------------------------------------------------------------------------------------

^.obj0210
|009D62| dw $0982, $0992, $0983, $0993

;---------------------------------------------------------------------------------------------------

^.obj0218
|009D6A| dw $4983, $4993, $4982, $4992

;---------------------------------------------------------------------------------------------------

^.obj0220
|009D72| dw $0CCC, $0CCD, $0CDC, $0CCE

^.obj0228
|009D7A| dw $0CCC, $0CCF, $0CDC, $0CDD

^.obj0230
|009D82| dw $0CCC, $0CCD, $0CDE, $0CDD

^.obj0238
|009D8A| dw $0CDF, $0CCD, $0CDC, $0CDD

|009D92| dw $0CCC, $0CDC, $0CCD, $0CCE
|009D9A| dw $0CCC, $0CDC, $0CCF, $0CDD
|009DA2| dw $0CCC, $0CDE, $0CCD, $0CDD
|009DAA| dw $0CDF, $0CDC, $0CCD, $0CDD

;---------------------------------------------------------------------------------------------------

^.obj0260
|009DB2| dw $0CCC, $0CCD, $0CCC, $0CCD
|009DBA| dw $0CDC, $0CDD, $0CDC, $0CDD
|009DC2| dw $0CCC, $0CCD, $0CCC, $0CCD
|009DCA| dw $0CDC, $0CDD, $0CDC, $0CDD

;---------------------------------------------------------------------------------------------------

^.obj0280
|009DD2| dw $0CCC, $0CDC, $0CCD, $0CDD

;---------------------------------------------------------------------------------------------------

^.obj0288
|009DDA| dw $1C13, $1C41, $1C13, $1C41
|009DE2| dw $1C40, $1C42, $1C40, $1C42
|009DEA| dw $1C13, $1C41, $1C13, $1C41
|009DF2| dw $1C40, $1C42, $1C40, $1C42

;---------------------------------------------------------------------------------------------------

^.obj02A8
|009DFA| dw $1576, $1577, $1576, $1577
|009E02| dw $1578, $1579, $1578, $1579
|009E0A| dw $1576, $1577, $1576, $1577
|009E12| dw $1578, $1579, $1578, $1579

;---------------------------------------------------------------------------------------------------

^.obj02C8
|009E1A| dw $0892, $0898, $08A4, $0CAD
|009E22| dw $0893, $0899, $08A5, $8CAD

;---------------------------------------------------------------------------------------------------

^.obj02D8
|009E2A| dw $4CAD, $48A4, $4898, $4892
|009E32| dw $CCAD, $48A5, $4899, $4893

;---------------------------------------------------------------------------------------------------

^.obj02E8
|009E3A| dw $0890, $0896, $08A2, $0CAC
|009E42| dw $0891, $0897, $08A3, $4CAC

;---------------------------------------------------------------------------------------------------

^.obj02F8
|009E4A| dw $8CAC, $88A2, $8896, $8890
|009E52| dw $CCAC, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

^.obj0308
|009E5A| dw $0843, $0844, $0871, $90AD
|009E62| dw $0853, $0854, $0871, $10AD

;---------------------------------------------------------------------------------------------------

^.obj0318
|009E6A| dw $D0AD, $4871, $4844, $4843
|009E72| dw $50AD, $4871, $4854, $4853

;---------------------------------------------------------------------------------------------------

^.obj0328
|009E7A| dw $0850, $0860, $0870, $50AC
|009E82| dw $0851, $0861, $0870, $10AC

;---------------------------------------------------------------------------------------------------

^.obj0338
|009E8A| dw $D0AC, $8870, $8860, $8850
|009E92| dw $90AC, $8870, $8861, $8851
|009E9A| dw $1C6B, $1C6B, $1C6B, $1C6B
|009EA2| dw $1C6C, $1C8D, $5C8D, $5C6C
|009EAA| dw $5C6B, $5C6B, $5C6B, $5C6B
|009EB2| dw $1C6A, $1C6A, $1C6A, $1C6A
|009EBA| dw $1C7A, $1C8E, $9C8E, $9C7A
|009EC2| dw $9C6A, $9C6A, $9C6A, $9C6A

;---------------------------------------------------------------------------------------------------

^.obj0378
|009ECA| dw $1C6B, $1C6B, $1C6C, $1C6C

;---------------------------------------------------------------------------------------------------

^.obj0380
|009ED2| dw $5C6C, $5C6C, $5C6B, $5C6B

;---------------------------------------------------------------------------------------------------

^.obj0388
|009EDA| dw $1C6A, $1C7A, $1C6A, $1C7A

;---------------------------------------------------------------------------------------------------

^.obj0390
|009EE2| dw $9C7A, $9C6A, $9C7A, $9C6A

;---------------------------------------------------------------------------------------------------

^.obj0398
|009EEA| dw $1C7B, $1C6B, $1C6A, $1C45

;---------------------------------------------------------------------------------------------------

^.obj03A0
|009EF2| dw $1C6B, $9C7B, $9C45, $9C6A

;---------------------------------------------------------------------------------------------------

^.obj03A8
|009EFA| dw $1C6A, $5C45, $5C7B, $5C6B

;---------------------------------------------------------------------------------------------------

^.obj03B0
|009F02| dw $DC45, $9C6A, $5C6B, $DC7B

;---------------------------------------------------------------------------------------------------

^.obj03B8
|009F0A| dw $1C7C, $1C7A, $1C6C, $1C55

;---------------------------------------------------------------------------------------------------

^.obj03C0
|009F12| dw $9C7A, $9C7C, $9C55, $1C6C

;---------------------------------------------------------------------------------------------------

^.obj03C8
|009F1A| dw $5C6C, $5C55, $5C7C, $1C7A

;---------------------------------------------------------------------------------------------------

^.obj03D0
|009F22| dw $DC55, $5C6C, $9C7A, $DC7C

;---------------------------------------------------------------------------------------------------

^.obj03D8
|009F2A| dw $3C15, $3C15, $3C15, $3C15

;---------------------------------------------------------------------------------------------------

^.obj03E0
|009F32| dw $0951, $0961, $0941, $0971
|009F3A| dw $8951, $8961, $8941, $8971

;---------------------------------------------------------------------------------------------------

^.obj03F0
|009F42| dw $4971, $4941, $4961, $4951
|009F4A| dw $C971, $C941, $C961, $C951

;---------------------------------------------------------------------------------------------------

^.obj0400
|009F52| dw $0950, $0960, $0940, $0970
|009F5A| dw $4950, $4960, $4940, $4970

;---------------------------------------------------------------------------------------------------

^.obj0410
|009F62| dw $8970, $8940, $8960, $8950
|009F6A| dw $C970, $C940, $C960, $C950

;---------------------------------------------------------------------------------------------------

^.obj0420
|009F72| dw $0880, $0881, $089A, $089B
|009F7A| dw $14AB

;---------------------------------------------------------------------------------------------------

^.obj042A
|009F7C| dw $94AB, $889B, $889A, $8881
|009F84| dw $8880

;---------------------------------------------------------------------------------------------------

^.obj0434
|009F86| dw $4880, $4881, $489A, $489B
|009F8E| dw $54AB

;---------------------------------------------------------------------------------------------------

^.obj043E
|009F90| dw $D4AB, $C89B, $C89A, $C881
|009F98| dw $C880

;---------------------------------------------------------------------------------------------------

^.obj0448
|009F9A| dw $0880, $0881, $089A, $089B
|009FA2| dw $0CAB

;---------------------------------------------------------------------------------------------------

^.obj0452
|009FA4| dw $8CAB, $889B, $889A, $8881
|009FAC| dw $8880

;---------------------------------------------------------------------------------------------------

^.obj045C
|009FAE| dw $4880, $4881, $489A, $489B
|009FB6| dw $4CAB

;---------------------------------------------------------------------------------------------------

^.obj0466
|009FB8| dw $CCAB, $C89B, $C89A, $C881
|009FC0| dw $C880

;---------------------------------------------------------------------------------------------------

^.obj0470
|009FC2| dw $0880, $0881, $089A, $089B
|009FCA| dw $10AB

;---------------------------------------------------------------------------------------------------

^.obj047A
|009FCC| dw $90AB, $889B, $889A, $8881
|009FD4| dw $8880

;---------------------------------------------------------------------------------------------------

^.obj0484
|009FD6| dw $4880, $4881, $489A, $489B
|009FDE| dw $50AB

;---------------------------------------------------------------------------------------------------

^.obj048E
|009FE0| dw $D0AB, $C89B, $C89A, $C881
|009FE8| dw $C880

;---------------------------------------------------------------------------------------------------

^.obj0498
|009FEA| dw $0849, $084A, $084B, $089C
|009FF2| dw $18AB

;---------------------------------------------------------------------------------------------------

^.obj04A2
|009FF4| dw $98AB, $889C, $884B, $884A
|009FFC| dw $8849

;---------------------------------------------------------------------------------------------------

^.obj04AC
|009FFE| dw $4849, $484A, $484B, $489C
|00A006| dw $58AB

;---------------------------------------------------------------------------------------------------

^.obj04B6
|00A008| dw $D8AB, $C89C, $C84B, $C84A
|00A010| dw $C849

;---------------------------------------------------------------------------------------------------

^.obj04C0
|00A012| dw $0849, $084A, $084B, $089C
|00A01A| dw $10AB

;---------------------------------------------------------------------------------------------------

^.obj04CA
|00A01C| dw $90AB, $889C, $884B, $884A
|00A024| dw $8849

;---------------------------------------------------------------------------------------------------

^.obj04D4
|00A026| dw $4849, $484A, $484B, $489C
|00A02E| dw $50AB

;---------------------------------------------------------------------------------------------------

^.obj04DE
|00A030| dw $D0AB, $C89C, $C84B, $C84A
|00A038| dw $C849

;---------------------------------------------------------------------------------------------------

^.obj04E8
|00A03A| dw $0849, $084A, $084B, $089C
|00A042| dw $10AB

;---------------------------------------------------------------------------------------------------

^.obj04F2
|00A044| dw $90AB, $889C, $884B, $884A
|00A04C| dw $8849

;---------------------------------------------------------------------------------------------------

^.obj04FC
|00A04E| dw $4849, $484A, $484B, $489C
|00A056| dw $50AB

;---------------------------------------------------------------------------------------------------

^.obj0506
|00A058| dw $D0AB, $C89C, $C84B, $C84A
|00A060| dw $C849

;---------------------------------------------------------------------------------------------------

^.obj0510
|00A062| dw $1DAA, $1DAC, $1DAC, $1D8B
|00A06A| dw $1DAD, $1D8C, $1D8B, $1DAF
|00A072| dw $1DA5, $1D8B, $1DAF, $1DA6
|00A07A| dw $1D8B, $1DAF, $1DA6, $1D8B
|00A082| dw $1DAF, $5DA5, $1D8B, $5DAD
|00A08A| dw $5D8C, $5DAA, $5DAC, $5DAC
|00A092| dw $1DAC, $1D8C, $1DA7, $1DAC
|00A09A| dw $1D8C, $1DA7, $1DA9, $1DA9
|00A0A2| dw $1DA9, $1DA9, $5DA7, $5D8C
|00A0AA| dw $5DAC, $5DA7, $5D8C, $5DAC
|00A0B2| dw $1DAC, $1DAC, $1DAB, $1D8C
|00A0BA| dw $1D9C, $1D9B, $9DA5, $1DAE
|00A0C2| dw $1D9B, $9DA6, $1DAE, $1D9B
|00A0CA| dw $9DA6, $1DAE, $1D9B, $DDA5
|00A0D2| dw $1DAE, $1D9B, $5D8C, $5D9C
|00A0DA| dw $1D9B, $5DAC, $5DAC, $5DAB

;---------------------------------------------------------------------------------------------------

^.obj0590
|00A0E2| dw $1DA8, $9DA8, $5DA8, $DDA8

;---------------------------------------------------------------------------------------------------

^.obj0598
|00A0EA| dw $1D9D, $1D8D, $1D8D, $1D72
|00A0F2| dw $1D72, $1D72, $5D9D, $5D8D
|00A0FA| dw $5D8D

;---------------------------------------------------------------------------------------------------

^.obj05AA
|00A0FC| dw $01E9, $01E9, $01E9, $01E9

;---------------------------------------------------------------------------------------------------

^.obj05B2
|00A104| dw $18C9, $18C9, $18C9, $18C9

;---------------------------------------------------------------------------------------------------

^.obj05BA
|00A10C| dw $09DA, $09DE, $09DB, $01E9
|00A114| dw $09DB, $01E9, $49DA, $49DE
|00A11C| dw $09DE, $09DC, $01E9, $09DD
|00A124| dw $01E9, $09DD, $49DE, $49DC

;---------------------------------------------------------------------------------------------------

^.obj05DA
|00A12C| dw $09DB, $01E9, $01E9, $09DD
|00A134| dw $09DB, $01E9, $01E9, $09DD
|00A13C| dw $09DB, $01E9, $01E9, $09DD
|00A144| dw $09DB, $01E9, $01E9, $09DD

;---------------------------------------------------------------------------------------------------

^.obj05FA
|00A14C| dw $08E1, $08E3, $08E1

;---------------------------------------------------------------------------------------------------

^.obj0600
|00A152| dw $08E1, $08E2, $08E1

;---------------------------------------------------------------------------------------------------

^.obj0606
|00A158| dw $08E0, $08F0, $48E0, $48F0
|00A160| dw $08F3, $48F3, $08E0, $08F1
|00A168| dw $08E4, $48E0, $48F1, $48E4

;---------------------------------------------------------------------------------------------------

^.obj061E
|00A170| dw $08E0, $08F1, $08E4, $48E0
|00A178| dw $48F1, $48E4, $08F4, $08F2
|00A180| dw $08E5, $08E0, $08F1, $08E4
|00A188| dw $48E0, $48F1, $48E4

;---------------------------------------------------------------------------------------------------

^.obj063C
|00A18E| dw $09DA, $09DB, $49DA

;---------------------------------------------------------------------------------------------------

^.obj0642
|00A194| dw $09DC, $09DD, $49DC

;---------------------------------------------------------------------------------------------------

^.obj0648
|00A19A| dw $09DE

;---------------------------------------------------------------------------------------------------

^.obj064A
|00A19C| dw $49DE

;---------------------------------------------------------------------------------------------------

^.obj064C
|00A19E| dw $09DF, $09DD, $49DF

;---------------------------------------------------------------------------------------------------

^.obj0652
|00A1A4| dw $89DF, $09DB, $C9DF

;---------------------------------------------------------------------------------------------------

^.obj0658
|00A1AA| dw $09DF, $09DD, $49DC

;---------------------------------------------------------------------------------------------------

^.obj065E
|00A1B0| dw $09DC, $09DD, $49DF

;---------------------------------------------------------------------------------------------------

^.obj0664
|00A1B6| dw $89DF, $09DB, $49DA

;---------------------------------------------------------------------------------------------------

^.obj066A
|00A1BC| dw $09DA, $09DB, $C9DF

;---------------------------------------------------------------------------------------------------

^.obj0670
|00A1C2| dw $08E3, $4846, $4843, $4869
|00A1CA| dw $4853, $C846

;---------------------------------------------------------------------------------------------------

^.obj067C
|00A1CE| dw $08E3, $0846, $0843, $0869
|00A1D6| dw $0853, $8846

;---------------------------------------------------------------------------------------------------

^.obj0688
|00A1DA| dw $08E2, $8846, $8850, $8868
|00A1E2| dw $8851, $C846

;---------------------------------------------------------------------------------------------------

^.obj0694
|00A1E6| dw $08E2, $0846, $0850, $0868
|00A1EE| dw $0851, $4846

;---------------------------------------------------------------------------------------------------

^.obj06A0
|00A1F2| dw $0852

;---------------------------------------------------------------------------------------------------

^.obj06A2
|00A1F4| dw $4852

;---------------------------------------------------------------------------------------------------

^.obj06A4
|00A1F6| dw $085C

;---------------------------------------------------------------------------------------------------

^.obj06A6
|00A1F8| dw $885C

;---------------------------------------------------------------------------------------------------

^.obj06A8
|00A1FA| dw $1CC6, $1CC6, $1CC6, $1CC6
|00A202| dw $1CC6, $1CC6, $1CC6, $1CC6
|00A20A| dw $1CC6, $1CC6, $1CC6, $1CC6
|00A212| dw $1CC6, $1CC6, $1CC6, $1CC6

;---------------------------------------------------------------------------------------------------

^.obj06C8
|00A21A| dw $0973, $28A0, $28A1, $A8A1
|00A222| dw $A8A0, $0867, $09EF, $09EF
|00A22A| dw $8867, $0865, $085A, $885A
|00A232| dw $8865, $4865, $485A, $C85A
|00A23A| dw $C865, $4867, $09EF, $09EF
|00A242| dw $C867, $68A0, $68A1, $E8A1
|00A24A| dw $E8A0, $28A0, $28A1, $A8A1
|00A252| dw $A8A0, $0867, $09EF, $09EF
|00A25A| dw $8867, $0865, $085A, $885A
|00A262| dw $8865, $4865, $485A, $C85A
|00A26A| dw $C865, $4867, $09EF, $09EF
|00A272| dw $C867, $68A0, $68A1, $E8A1
|00A27A| dw $E8A0

;---------------------------------------------------------------------------------------------------

^.obj072A
|00A27C| dw $294E, $2893, $0892, $01EC
|00A284| dw $295E, $0898, $01EC, $01EC
|00A28C| dw $096E, $0893, $0899, $08A5
|00A294| dw $0892, $0898, $08A4, $0893
|00A29C| dw $A893, $A94E, $0899, $A95E
|00A2A4| dw $01EC, $896E, $01EC, $01EC

;---------------------------------------------------------------------------------------------------

^.obj075A
|00A2AC| dw $01EC, $01EC, $496E, $01EC
|00A2B4| dw $695E, $4898, $694E, $6893
|00A2BC| dw $4892, $48A5, $4899, $4893
|00A2C4| dw $48A4, $4898, $4892, $C96E
|00A2CC| dw $01EC, $01EC, $4899, $E95E
|00A2D4| dw $01EC, $4893, $E893, $E94E

;---------------------------------------------------------------------------------------------------

^.obj078A
|00A2DC| dw $096E, $1148, $1168, $1159
|00A2E4| dw $496E, $1149, $1169, $5159
|00A2EC| dw $096E, $5149, $5169, $1159
|00A2F4| dw $496E, $5148, $5168, $5159

;---------------------------------------------------------------------------------------------------

^.obj07AA
|00A2FC| dw $097E, $897E, $097E, $897E
|00A304| dw $11AE, $1146, $9146, $91AE
|00A30C| dw $11AF, $1166, $9166, $91AF
|00A314| dw $1156, $9156, $1156, $9156

;---------------------------------------------------------------------------------------------------

^.obj07CA
|00A31C| dw $5156, $D156, $5156, $D156
|00A324| dw $51AF, $1167, $9167, $D1AF
|00A32C| dw $51AE, $1147, $9147, $D1AE
|00A334| dw $497E, $C97E, $497E, $C97E

;---------------------------------------------------------------------------------------------------

^.obj07EA
|00A33C| dw $096E, $115E, $1178, $1158
|00A344| dw $496E, $114E, $1177, $1174
|00A34C| dw $096E, $114E, $5177, $5174
|00A354| dw $496E, $515E, $5178, $5158

;---------------------------------------------------------------------------------------------------

^.obj080A
|00A35C| dw $097E, $897E, $097E, $897E
|00A364| dw $11AC, $11AD, $11AD, $91AC
|00A36C| dw $1179, $1176, $9176, $9179
|00A374| dw $1157, $1175, $9175, $9157

;---------------------------------------------------------------------------------------------------

^.obj082A
|00A37C| dw $5157, $5175, $D175, $D157
|00A384| dw $5179, $5176, $D176, $D179
|00A38C| dw $51AC, $51AD, $51AD, $D1AC
|00A394| dw $497E, $C97E, $497E, $C97E

;---------------------------------------------------------------------------------------------------

^.obj084A
|00A39C| dw $28E7, $28F7, $28E6, $08F6
|00A3A4| dw $68E7, $68F7, $68E6, $48F6

;---------------------------------------------------------------------------------------------------

^.obj085A
|00A3AC| dw $2DC2, $2DC3, $2D2C, $0D3C
|00A3B4| dw $6DC2, $6DC3, $6D2C, $4D3C

;---------------------------------------------------------------------------------------------------

^.obj086A
|00A3BC| dw $0942, $1162, $1152, $0943
|00A3C4| dw $1163, $1153, $4943, $5163
|00A3CC| dw $5153, $4942, $5162, $5152

;---------------------------------------------------------------------------------------------------

^.obj0882
|00A3D4| dw $9152, $9162, $8942, $9153
|00A3DC| dw $9163, $8943, $D153, $D163
|00A3E4| dw $C943, $D152, $D162, $C942

;---------------------------------------------------------------------------------------------------

^.obj089A
|00A3EC| dw $0944, $0954, $8954, $8944
|00A3F4| dw $1164, $1165, $9165, $9164
|00A3FC| dw $1145, $1155, $9155, $9145

;---------------------------------------------------------------------------------------------------

^.obj08B2
|00A404| dw $5145, $5155, $D155, $D145
|00A40C| dw $5164, $5165, $D165, $D164
|00A414| dw $4944, $4954, $C954, $C944

;---------------------------------------------------------------------------------------------------

^.obj08CA
|00A41C| dw $1548, $1549, $5548, $5549
|00A424| dw $1548, $1549, $5548, $5549

;---------------------------------------------------------------------------------------------------

^.obj08DA
|00A42C| dw $1587, $1588, $5588, $5587
|00A434| dw $1597, $1598, $5598, $5597
|00A43C| dw $1589, $158A, $558A, $5589
|00A444| dw $1599, $159A, $559A, $5599

;---------------------------------------------------------------------------------------------------

^.obj08FA
|00A44C| dw $0980, $0990, $4980, $4990

;---------------------------------------------------------------------------------------------------

^.obj0902
|00A454| dw $8990, $8980, $C990, $C980

;---------------------------------------------------------------------------------------------------

^.obj090A
|00A45C| dw $0981, $8981, $0991, $8991

;---------------------------------------------------------------------------------------------------

^.obj0912
|00A464| dw $4991, $C991, $4981, $C981

;---------------------------------------------------------------------------------------------------

^.obj091A
|00A46C| dw $1DFE, $1DFC, $5DFE

;---------------------------------------------------------------------------------------------------

^.obj0920
|00A472| dw $9DFE, $9DFC, $DDFE

;---------------------------------------------------------------------------------------------------

^.obj0926
|00A478| dw $1DFD

;---------------------------------------------------------------------------------------------------

^.obj0928
|00A47A| dw $5DFD

;---------------------------------------------------------------------------------------------------

^.obj092A
|00A47C| dw $DDFF, $9DFC, $9DFF

;---------------------------------------------------------------------------------------------------

^.obj0930
|00A482| dw $5DFF, $1DFC, $1DFF

;---------------------------------------------------------------------------------------------------

^.obj0936
|00A488| dw $DDFF, $9DFC, $DDFE

;---------------------------------------------------------------------------------------------------

^.obj093C
|00A48E| dw $9DFE, $9DFC, $9DFF

;---------------------------------------------------------------------------------------------------

^.obj0942
|00A494| dw $5DFF, $1DFC, $5DFE

;---------------------------------------------------------------------------------------------------

^.obj0948
|00A49A| dw $1DFE, $1DFC, $1DFF

;---------------------------------------------------------------------------------------------------

^.obj094E
|00A4A0| dw $1DF7, $1C40, $1C41, $1C42
|00A4A8| dw $1DB5, $1DB2, $1DB3, $1DB3
|00A4B0| dw $1DB4, $1DB5, $5DF7, $5C40
|00A4B8| dw $5C41, $5C42, $5DB5

;---------------------------------------------------------------------------------------------------

^.obj096C
|00A4BE| dw $1DF7, $1C40, $1DB5, $1DB2
|00A4C6| dw $1DB3, $1DB5, $5DF7, $5C40
|00A4CE| dw $5DB5

;---------------------------------------------------------------------------------------------------

^.obj097E
|00A4D0| dw $0C14, $0C14, $0C14, $0C14
|00A4D8| dw $8C14, $8C14, $8C14, $8C14

;---------------------------------------------------------------------------------------------------

^.obj098E
|00A4E0| dw $0C64, $0C66, $0C64, $0C66
|00A4E8| dw $0C64, $0C66, $0C64, $0C66

;---------------------------------------------------------------------------------------------------

^.obj099E
|00A4F0| dw $0D46, $0D56, $157E, $0D47
|00A4F8| dw $0D57, $157F, $4D46, $4D56
|00A500| dw $557E

;---------------------------------------------------------------------------------------------------

^.obj09B0
|00A502| dw $0D46, $4D46, $8DAB, $4DAB

;---------------------------------------------------------------------------------------------------

^.obj09B8
|00A50A| dw $0D46, $0DAB, $0D47, $4DAD

;---------------------------------------------------------------------------------------------------

^.obj09C0
|00A512| dw $0DAB, $0D56, $4DAC, $0D57

;---------------------------------------------------------------------------------------------------

^.obj09C8
|00A51A| dw $0D47, $0DAD, $4D46, $4DAB

;---------------------------------------------------------------------------------------------------

^.obj09D0
|00A522| dw $0DAC, $0D57, $4DAB, $4D56

;---------------------------------------------------------------------------------------------------

^.obj09D8
|00A52A| dw $0940, $0960, $0950, $0970
|00A532| dw $0941, $0961, $0951, $0971
|00A53A| dw $4941, $4961, $4951, $4971
|00A542| dw $4940, $4960, $4950, $4970

;---------------------------------------------------------------------------------------------------

^.obj09F8
|00A54A| dw $0D42

;---------------------------------------------------------------------------------------------------

^.obj09FA
|00A54C| dw $0D52

;---------------------------------------------------------------------------------------------------

^.obj09FC
|00A54E| dw $0D40

;---------------------------------------------------------------------------------------------------

^.obj09FE
|00A550| dw $0D50

;---------------------------------------------------------------------------------------------------

^.obj0A00
|00A552| dw $0D41

;---------------------------------------------------------------------------------------------------

^.obj0A02
|00A554| dw $0D51

;---------------------------------------------------------------------------------------------------

^.obj0A04
|00A556| dw $0D8E

;---------------------------------------------------------------------------------------------------

^.obj0A06
|00A558| dw $0D8F

;---------------------------------------------------------------------------------------------------

^.obj0A08
|00A55A| dw $0D9E

;---------------------------------------------------------------------------------------------------

^.obj0A0A
|00A55C| dw $0D9F

;---------------------------------------------------------------------------------------------------

^.obj0A0C
|00A55E| dw $0D43

;---------------------------------------------------------------------------------------------------

^.obj0A0E
|00A560| dw $0D53

;---------------------------------------------------------------------------------------------------

^.obj0A10
|00A562| dw $0DA9

;---------------------------------------------------------------------------------------------------

^.obj0A12
|00A564| dw $0DA8

;---------------------------------------------------------------------------------------------------

^.obj0A14
|00A566| dw $09C8, $0DC6, $4DC6, $49C8
|00A56E| dw $09CA, $0D02, $4D02, $49CA

;---------------------------------------------------------------------------------------------------

^.obj0A24
|00A576| dw $89CA, $8D02, $CD02, $C9CA
|00A57E| dw $89C8, $8DC6, $CDC6, $C9C8

;---------------------------------------------------------------------------------------------------

^.obj0A34
|00A586| dw $09C9, $0DC7, $8DC7, $89C9
|00A58E| dw $09CB, $0D03, $8D03, $89CB

;---------------------------------------------------------------------------------------------------

^.obj0A44
|00A596| dw $49CB, $4D03, $CD03, $C9CB
|00A59E| dw $49C9, $4DC7, $CDC7, $C9C9

;---------------------------------------------------------------------------------------------------

^.obj0A54
|00A5A6| dw $0944, $0954, $8954, $8944
|00A5AE| dw $1164, $1165, $9165, $9164
|00A5B6| dw $1145, $1155, $9155, $9145

;---------------------------------------------------------------------------------------------------

^.obj0A6C
|00A5BE| dw $5145, $5155, $D155, $D145
|00A5C6| dw $5164, $5165, $D165, $D164
|00A5CE| dw $4944, $4954, $C954, $C944

;---------------------------------------------------------------------------------------------------

^.obj0A84
|00A5D6| dw $1146, $1147, $9147, $9146
|00A5DE| dw $1166, $1167, $9167, $9166
|00A5E6| dw $1156, $1157, $9157, $9156

;---------------------------------------------------------------------------------------------------

^.obj0A9C
|00A5EE| dw $5156, $5157, $D157, $D156
|00A5F6| dw $5166, $5167, $D167, $D166
|00A5FE| dw $5146, $5147, $D147, $D146

;---------------------------------------------------------------------------------------------------

^.obj0AB4
|00A606| dw $098E, $098E, $099E, $1CC6
|00A60E| dw $1CC6, $099F, $1CC6, $498F
|00A616| dw $499E, $1CC6, $0972, $0972
|00A61E| dw $1CC6, $098F, $099E, $1CC6
|00A626| dw $1CC6, $099F, $498E, $498E
|00A62E| dw $499E

;---------------------------------------------------------------------------------------------------

^.obj0ADE
|00A630| dw $0DE6, $0DF6, $4DE6, $4DF6

;---------------------------------------------------------------------------------------------------

^.obj0AE6
|00A638| dw $1DA9, $1DA9, $1DA9, $1DA9
|00A640| dw $1DA9, $1DA9, $1DA9, $1DA9
|00A648| dw $1DA9, $1DA9, $1DA9, $1DA9
|00A650| dw $1DA9, $1DA9, $1DA9, $1DA9

;---------------------------------------------------------------------------------------------------

^.obj0B06
|00A658| dw $9DA8, $9DA6, $DDA8

;---------------------------------------------------------------------------------------------------

^.obj0B0C
|00A65E| dw $1DA8, $1DA6, $5DA8

;---------------------------------------------------------------------------------------------------

^.obj0B12
|00A664| dw $1DA7

;---------------------------------------------------------------------------------------------------

^.obj0B14
|00A666| dw $5DA7

;---------------------------------------------------------------------------------------------------

^.obj0B16
|00A668| dw $4D66, $1D64, $1D44, $1D54
|00A670| dw $0D66, $5D64, $5D44, $5D54

;---------------------------------------------------------------------------------------------------

^.obj0B26
|00A678| dw $0946, $0966, $0956, $0CAC
|00A680| dw $0947, $0967, $0957, $4CAC

;---------------------------------------------------------------------------------------------------

^.obj0B36
|00A688| dw $8CAC, $8956, $8966, $8946
|00A690| dw $CCAC, $8957, $8967, $8947

;---------------------------------------------------------------------------------------------------

^.obj0B46
|00A698| dw $0948, $0968, $0958, $0CAD
|00A6A0| dw $0949, $0969, $0959, $8CAD

;---------------------------------------------------------------------------------------------------

^.obj0B56
|00A6A8| dw $4CAD, $4958, $4968, $4948
|00A6B0| dw $CCAD, $4959, $4969, $4949

;---------------------------------------------------------------------------------------------------

^.obj0B66
|00A6B8| dw $0894, $0893, $0892, $0893
|00A6C0| dw $0891, $089E, $0898, $0899
|00A6C8| dw $0890, $0896, $08A6, $08A5
|00A6D0| dw $0891, $0897, $08A3, $0CAE

;---------------------------------------------------------------------------------------------------

^.obj0B86
|00A6D8| dw $0892, $0893, $0892, $8894
|00A6E0| dw $0898, $0899, $889E, $8891
|00A6E8| dw $08A4, $88A6, $8896, $8890
|00A6F0| dw $8CAE, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

^.obj0BA6
|00A6F8| dw $0890, $0896, $08A2, $4CAE
|00A700| dw $0891, $0897, $48A6, $48A5
|00A708| dw $0890, $489E, $4898, $4899
|00A710| dw $4894, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

^.obj0BC6
|00A718| dw $CCAE, $88A2, $8896, $8890
|00A720| dw $48A4, $C8A6, $8897, $8891
|00A728| dw $4898, $4899, $C89E, $8890
|00A730| dw $4892, $4893, $4892, $C894

;---------------------------------------------------------------------------------------------------

^.obj0BE6
|00A738| dw $0846, $0843, $0853, $0843
|00A740| dw $0850, $0847, $0854, $0844
|00A748| dw $0851, $0861, $0848, $0871
|00A750| dw $0850, $0860, $0870, $10AE

;---------------------------------------------------------------------------------------------------

^.obj0C06
|00A758| dw $0853, $0843, $0853, $8846
|00A760| dw $0854, $0844, $8847, $8850
|00A768| dw $0871, $8848, $8861, $8851
|00A770| dw $90AE, $8870, $8860, $8850

;---------------------------------------------------------------------------------------------------

^.obj0C26
|00A778| dw $0851, $0861, $0870, $50AE
|00A780| dw $0850, $0860, $4848, $4871
|00A788| dw $0851, $4847, $4854, $4844
|00A790| dw $4846, $4843, $4853, $4843

;---------------------------------------------------------------------------------------------------

^.obj0C46
|00A798| dw $D0AE, $8870, $8861, $8851
|00A7A0| dw $4871, $C848, $8860, $8850
|00A7A8| dw $4854, $4844, $C847, $8851
|00A7B0| dw $4853, $4843, $4853, $C846

;---------------------------------------------------------------------------------------------------

^.obj0C66
|00A7B8| dw $0895, $0896, $08A2, $0CAC
|00A7C0| dw $0898, $089F, $08A3, $4CAC
|00A7C8| dw $08A4, $08A5, $08A7, $0CAC
|00A7D0| dw $0CAD, $8CAD, $0CAD, $0CAF

;---------------------------------------------------------------------------------------------------

^.obj0C86
|00A7D8| dw $8CAC, $88A2, $8896, $8895
|00A7E0| dw $CCAC, $88A3, $889F, $0899
|00A7E8| dw $8CAC, $88A7, $08A4, $08A5
|00A7F0| dw $8CAF, $8CAD, $0CAD, $0CAD

;---------------------------------------------------------------------------------------------------

^.obj0CA6
|00A7F8| dw $4CAD, $CCAD, $4CAD, $4CAF
|00A800| dw $48A4, $48A5, $48A7, $4CAC
|00A808| dw $4898, $489F, $08A2, $0CAC
|00A810| dw $4895, $0897, $08A3, $4CAC

;---------------------------------------------------------------------------------------------------

^.obj0CC6
|00A818| dw $CCAF, $CCAD, $4CAD, $CCAD
|00A820| dw $CCAC, $C8A7, $48A4, $48A5
|00A828| dw $8CAC, $88A2, $C89F, $4899
|00A830| dw $CCAC, $88A3, $8897, $C895

;---------------------------------------------------------------------------------------------------

^.obj0CE6
|00A838| dw $0856, $0861, $0870, $10AC
|00A840| dw $0854, $0857, $0870, $50AC
|00A848| dw $0871, $0871, $0858, $10AC
|00A850| dw $10AD, $90AD, $10AD, $10AF

;---------------------------------------------------------------------------------------------------

^.obj0D06
|00A858| dw $90AC, $8870, $8861, $8856
|00A860| dw $D0AC, $8870, $8857, $0844
|00A868| dw $90AC, $8858, $0871, $0871
|00A870| dw $90AF, $90AD, $10AD, $90AD

;---------------------------------------------------------------------------------------------------

^.obj0D26
|00A878| dw $50AD, $D0AD, $50AD, $50AF
|00A880| dw $4871, $4871, $4858, $50AC
|00A888| dw $4854, $4857, $0870, $10AC
|00A890| dw $4856, $0860, $0870, $50AC

;---------------------------------------------------------------------------------------------------

^.obj0D46
|00A898| dw $D0AF, $D0AD, $50AD, $D0AD
|00A8A0| dw $D0AC, $C858, $4871, $4871
|00A8A8| dw $90AC, $8870, $C857, $4844
|00A8B0| dw $D0AC, $8870, $8860, $C856

;---------------------------------------------------------------------------------------------------

^.obj0D66
|00A8B8| dw $0861, $0870, $50AE, $50AF
|00A8C0| dw $0860, $4848, $4858, $10AC
|00A8C8| dw $4847, $4857, $0870, $50AC

;---------------------------------------------------------------------------------------------------

^.obj0D7E
|00A8D0| dw $D0AF, $D0AE, $8870, $8861
|00A8D8| dw $90AC, $C858, $C848, $8860
|00A8E0| dw $D0AC, $8870, $C857, $C847

;---------------------------------------------------------------------------------------------------

^.obj0D96
|00A8E8| dw $0847, $0857, $0870, $50AC
|00A8F0| dw $0861, $0848, $0858, $10AC
|00A8F8| dw $0860, $0870, $10AE, $10AF

;---------------------------------------------------------------------------------------------------

^.obj0DAE
|00A900| dw $D0AC, $8870, $8857, $8847
|00A908| dw $90AC, $8858, $8848, $8861
|00A910| dw $90AF, $90AE, $8870, $8860

;---------------------------------------------------------------------------------------------------

^.obj0DC6
|00A918| dw $0854, $0844, $8847, $0871
|00A920| dw $8848, $8857, $90AE, $8858
|00A928| dw $0871, $90AF, $90AD, $10AD

;---------------------------------------------------------------------------------------------------

^.obj0DDE
|00A930| dw $0847, $0854, $0844, $0857
|00A938| dw $0848, $0871, $0871, $0858
|00A940| dw $10AE, $90AD, $10AD, $10AF

;---------------------------------------------------------------------------------------------------

^.obj0DF6
|00A948| dw $D0AF, $D0AD, $50AD, $D0AE
|00A950| dw $C858, $4871, $4871, $C848
|00A958| dw $C857, $4854, $4844, $C847

;---------------------------------------------------------------------------------------------------

^.obj0E0E
|00A960| dw $D0AD, $50AD, $50AF, $4871
|00A968| dw $4858, $50AE, $4857, $4848
|00A970| dw $4871, $4847, $4854, $4844

;---------------------------------------------------------------------------------------------------

^.obj0E26
|00A978| dw $0D00, $0D10, $0D12, $4D00
|00A980| dw $0D11, $0D13

;---------------------------------------------------------------------------------------------------

^.obj0E32
|00A984| dw $0D04, $0D14, $0D24, $0D34
|00A98C| dw $0D05, $0D15, $0D25, $0D35
|00A994| dw $4D05, $4D15, $4D25, $4D35
|00A99C| dw $4D04, $4D14, $4D24, $4D34

;---------------------------------------------------------------------------------------------------

^.obj0E52
|00A9A4| dw $0922, $0932, $0923, $0933

;---------------------------------------------------------------------------------------------------

^.obj0E5A
|00A9AC| dw $0DE5, $0DF5, $4DE5, $4DF5

;---------------------------------------------------------------------------------------------------

^.obj0E62
|00A9B4| dw $0DE3, $0DF3, $0DE4, $0DF4

;---------------------------------------------------------------------------------------------------

^.obj0E6A
|00A9BC| dw $4DE4, $4DF4, $4DE3, $4DF3

;---------------------------------------------------------------------------------------------------

^.obj0E72
|00A9C4| dw $8DF3, $8DE3, $8DF4, $8DE4

;---------------------------------------------------------------------------------------------------

^.obj0E7A
|00A9CC| dw $CDF4, $CDE4, $CDF3, $CDE3

;---------------------------------------------------------------------------------------------------

^.obj0E82
|00A9D4| dw $0D28, $0D38, $4D28, $4D38

;---------------------------------------------------------------------------------------------------

^.obj0E8A
|00A9DC| dw $0D2A, $0D3A, $0D2B, $0D3B

;---------------------------------------------------------------------------------------------------

^.obj0E92
|00A9E4| dw $0D01, $0D1C, $4D01, $4D1C

;---------------------------------------------------------------------------------------------------

^.obj0E9A
|00A9EC| dw $0DEE, $8DEE, $4DEE, $CDEE

;---------------------------------------------------------------------------------------------------

^.obj0EA2
|00A9F4| dw $0DED, $8DED, $4DED, $CDED

;---------------------------------------------------------------------------------------------------

^.obj0EAA
|00A9FC| dw $0CD2, $0CEB, $0CD3, $0CFB

;---------------------------------------------------------------------------------------------------

^.obj0EB2
|00AA04| dw $0CEE, $0CFE, $0CEF, $0CFF

;---------------------------------------------------------------------------------------------------

^.obj0EBA
|00AA0C| dw $0CD4, $0CD6, $0CD5, $0CD7

;---------------------------------------------------------------------------------------------------

^.obj0EC2
|00AA14| dw $0DE0, $0DF0, $4DE0, $4DF0

;---------------------------------------------------------------------------------------------------

^.obj0ECA
|00AA1C| dw $0DC0, $0DC1, $4DC0, $4DC1

;---------------------------------------------------------------------------------------------------

^.obj0ED2
|00AA24| dw $094D, $095D, $096D, $494D
|00AA2C| dw $495D, $496D

;---------------------------------------------------------------------------------------------------

^.obj0EDE
|00AA30| dw $1587, $1589, $1599, $1588
|00AA38| dw $158A, $159A, $5588, $558A
|00AA40| dw $559A, $5587, $5589, $5599

;---------------------------------------------------------------------------------------------------

^.obj0EF6
|00AA48| dw $158C, $158D, $558D, $558C
|00AA50| dw $159C, $159D, $559D, $559C
|00AA58| dw $159C, $159D, $559D, $559C
|00AA60| dw $159C, $159D, $559D, $559C
|00AA68| dw $158B, $159B, $559B, $558B

;---------------------------------------------------------------------------------------------------

^.obj0F1E
|00AA70| dw $154A, $155A, $156A, $157A
|00AA78| dw $154B, $155B, $156B, $157B
|00AA80| dw $554B, $555B, $556B, $557B
|00AA88| dw $554A, $555A, $556A, $557A

;---------------------------------------------------------------------------------------------------

^.obj0F3E
|00AA90| dw $1525, $1563, $1553, $1555
|00AA98| dw $1526, $1564, $1554, $1556
|00AAA0| dw $5526, $5564, $5554, $5556
|00AAA8| dw $5525, $5563, $5553, $5555

;---------------------------------------------------------------------------------------------------

^.obj0F5E
|00AAB0| dw $151D, $151E, $151F, $551D
|00AAB8| dw $551E, $551F

;---------------------------------------------------------------------------------------------------

^.obj0F6A
|00AABC| dw $1548, $1549, $5548, $5549

;---------------------------------------------------------------------------------------------------

^.obj0F72
|00AAC4| dw $094A, $095A, $096A, $097A
|00AACC| dw $094B, $095B, $096B, $097B
|00AAD4| dw $494B, $495B, $496B, $497B
|00AADC| dw $494A, $495A, $496A, $497A

;---------------------------------------------------------------------------------------------------

^.obj0F92
|00AAE4| dw $0968, $0969, $4969, $4968
|00AAEC| dw $0958, $0959, $4959, $4958

;---------------------------------------------------------------------------------------------------

^.obj0FA2
|00AAF4| dw $1588, $156C, $556C, $5588
|00AAFC| dw $157D, $157C, $557C, $557D

;---------------------------------------------------------------------------------------------------

^.obj0FB2
|00AB04| dw $11A0, $11A1, $51A0, $11A2
|00AB0C| dw $11A3, $51A2, $1194, $1195
|00AB14| dw $5194

;---------------------------------------------------------------------------------------------------

^.obj0FC4
|00AB16| dw $094E, $095E, $096E, $09AE
|00AB1E| dw $094F, $095F, $096F, $09AF
|00AB26| dw $094F, $095F, $096F, $09AF
|00AB2E| dw $094F, $095F, $496F, $09AF
|00AB36| dw $094F, $095F, $096F, $09AF
|00AB3E| dw $494E, $495E, $496E, $49AE

;---------------------------------------------------------------------------------------------------

^.obj0FF4
|00AB46| dw $8D84, $0D84, $0976, $8D85
|00AB4E| dw $0D85, $0977, $0D86, $0D96
|00AB56| dw $0977, $4D86, $4D96, $4977
|00AB5E| dw $CD85, $4D85, $4977, $CD84
|00AB66| dw $4D84, $4976

;---------------------------------------------------------------------------------------------------

^.obj1018
|00AB6A| dw $0978, $0979, $4978, $4979

;---------------------------------------------------------------------------------------------------

^.obj1020
|00AB72| dw $0D92, $0DAA, $0D92, $0DAA

;---------------------------------------------------------------------------------------------------

^.obj1028
|00AB7A| dw $0942, $0982, $0992, $0943
|00AB82| dw $0983, $0993, $4943, $4983
|00AB8A| dw $4993, $4942, $4982, $4992

;---------------------------------------------------------------------------------------------------

^.obj1040
|00AB92| dw $0CEE, $18D8, $0CEE, $0CFE
|00AB9A| dw $18C8, $18D9, $58D9, $0CFF
|00ABA2| dw $18C9, $0CFE, $0CEE, $18D9
|00ABAA| dw $0CEF, $58D9, $58D8, $0CFF

;---------------------------------------------------------------------------------------------------

^.obj1060
|00ABB2| dw $1197, $1198, $1197, $1198
|00ABBA| dw $1187, $1188, $1187, $1188

;---------------------------------------------------------------------------------------------------

^.obj1070
|00ABC2| dw $1D76, $1D77, $5D76, $5D77

;---------------------------------------------------------------------------------------------------

^.obj1078
|00ABCA| dw $9D77, $9D76, $DD77, $DD76

;---------------------------------------------------------------------------------------------------

^.obj1080
|00ABD2| dw $5D79, $DD79, $5D78, $DD78

;---------------------------------------------------------------------------------------------------

^.obj1088
|00ABDA| dw $084C, $085D, $086D, $087D
|00ABE2| dw $084F, $085E, $086E, $087E
|00ABEA| dw $484F, $485E, $486E, $487E
|00ABF2| dw $484C, $485D, $486D, $487D

;---------------------------------------------------------------------------------------------------

^.obj10A8
|00ABFA| dw $0864, $0866, $0866, $09F8
|00AC02| dw $085F, $086F, $087F, $09F9
|00AC0A| dw $485F, $486F, $487F, $49F9
|00AC12| dw $4864, $4866, $4866, $49F8

;---------------------------------------------------------------------------------------------------

^.obj10C8
|00AC1A| dw $084D, $085D, $086D, $087D
|00AC22| dw $084E, $085E, $086E, $087E
|00AC2A| dw $484E, $485E, $486E, $487E
|00AC32| dw $484D, $485D, $486D, $487D

;---------------------------------------------------------------------------------------------------

^.obj10E8
|00AC3A| dw $887D, $886D, $885D, $884D
|00AC42| dw $887E, $886E, $885E, $884E
|00AC4A| dw $C87E, $C86E, $C85E, $C84E
|00AC52| dw $C87D, $C86D, $C85D, $C84D

;---------------------------------------------------------------------------------------------------

^.obj1108
|00AC5A| dw $0982, $0983, $4983, $4982
|00AC62| dw $0992, $0993, $4993, $4992
|00AC6A| dw $08C9, $08F4, $48F4, $48C9
|00AC72| dw $08CA, $08F5, $48F5, $48CA
|00AC7A| dw $0841, $0845, $8845, $8841
|00AC82| dw $0842, $0855, $8845, $8842
|00AC8A| dw $4842, $4855, $C855, $C842
|00AC92| dw $4841, $4845, $C845, $C841

;---------------------------------------------------------------------------------------------------

^.obj1148
|00AC9A| dw $28B8, $2808, $0818, $289D
|00ACA2| dw $082E, $083E, $689D, $082F
|00ACAA| dw $083F, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

^.obj1160
|00ACB2| dw $28B8, $2808, $0818, $28B9
|00ACBA| dw $09EF, $0819, $68B9, $09EF
|00ACC2| dw $081A, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

^.obj1178
|00ACCA| dw $28B5, $2808, $080D, $28B7
|00ACD2| dw $082E, $083E, $68B7, $082F
|00ACDA| dw $083F, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

^.obj1190
|00ACE2| dw $28B5, $2808, $080D, $28B6
|00ACEA| dw $09EF, $0819, $68B6, $09EF
|00ACF2| dw $081A, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

^.obj11A8
|00ACFA| dw $28B8, $0808, $0818, $4CAC
|00AD02| dw $289D, $0807, $0817, $0CAC
|00AD0A| dw $689D, $4807, $4817, $4CAC
|00AD12| dw $68B8, $4808, $4818, $0CAC

;---------------------------------------------------------------------------------------------------

^.obj11C8
|00AD1A| dw $28B8, $2808, $0818, $4CAC
|00AD22| dw $28B9, $09EF, $0816, $0CAC
|00AD2A| dw $68B9, $09EF, $4816, $4CAC
|00AD32| dw $68B8, $6808, $4818, $0CAC

;---------------------------------------------------------------------------------------------------

^.obj11E8
|00AD3A| dw $8CAC, $8818, $8808, $A8B8
|00AD42| dw $CCAC, $8817, $8807, $A89D
|00AD4A| dw $8CAC, $C817, $C807, $E89D
|00AD52| dw $CCAC, $C818, $C808, $E8B8

;---------------------------------------------------------------------------------------------------

^.obj1208
|00AD5A| dw $8CAC, $880D, $8808, $A8B8
|00AD62| dw $CCAC, $8816, $89EF, $A8B9
|00AD6A| dw $8CAC, $C816, $C9EF, $E8B9
|00AD72| dw $CCAC, $C80D, $C808, $E8B8

;---------------------------------------------------------------------------------------------------

^.obj1228
|00AD7A| dw $28B5, $0808, $080D, $50AC
|00AD82| dw $28B7, $0807, $0817, $10AC
|00AD8A| dw $68B7, $4807, $4817, $50AC
|00AD92| dw $68B5, $4808, $480D, $10AC

;---------------------------------------------------------------------------------------------------

^.obj1248
|00AD9A| dw $28B5, $0818, $080D, $50AC
|00ADA2| dw $28B6, $09EF, $0816, $10AC
|00ADAA| dw $68B6, $09EF, $4816, $50AC
|00ADB2| dw $68B7, $4810, $480D, $10AC

;---------------------------------------------------------------------------------------------------

^.obj1268
|00ADBA| dw $90AC, $880D, $8808, $A8B5
|00ADC2| dw $D0AC, $8817, $8807, $A8B7
|00ADCA| dw $90AC, $C817, $C807, $E8B7
|00ADD2| dw $D0AC, $C80D, $C808, $E8B5

;---------------------------------------------------------------------------------------------------

^.obj1288
|00ADDA| dw $90AC, $880D, $8808, $A8B5
|00ADE2| dw $D0AC, $8816, $89EF, $A8B6
|00ADEA| dw $90AC, $C816, $C9EF, $E8B6
|00ADF2| dw $D0AC, $C80D, $C808, $E8B5

;---------------------------------------------------------------------------------------------------

^.obj12A8
|00ADFA| dw $0984, $09A7, $0843, $0853
|00AE02| dw $0984, $09A4, $09A8, $0854
|00AE0A| dw $0984, $0994, $09A4, $09A8
|00AE12| dw $0985, $0995, $09A5, $09A9
|00AE1A| dw $0986, $0996, $09A6, $099C
|00AE22| dw $4986, $4996, $49A6, $499C
|00AE2A| dw $4985, $4995, $49A5, $49A9
|00AE32| dw $4984, $4994, $49A4, $49A8
|00AE3A| dw $4984, $49A4, $49A8, $4854
|00AE42| dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

|00AE4A| dw $0984, $09A7, $0843, $0853
|00AE52| dw $0984, $0994, $09A8, $0854
|00AE5A| dw $0985, $0995, $09A5, $09A8
|00AE62| dw $0986, $0996, $09A6, $099C
|00AE6A| dw $18CB, $18DB, $18CB, $18DB
|00AE72| dw $18CA, $18DA, $18CA, $18DA
|00AE7A| dw $4986, $4996, $49A6, $499C
|00AE82| dw $4985, $4995, $49A5, $49A8
|00AE8A| dw $4984, $4994, $49A8, $4854
|00AE92| dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

|00AE9A| dw $0984, $09A7, $0843, $0853
|00AEA2| dw $0985, $0995, $09A8, $0854
|00AEAA| dw $0986, $0996, $09A6, $09A8
|00AEB2| dw $18CA, $18DA, $18CA, $18DA
|00AEBA| dw $18CB, $18DB, $18CB, $18DB
|00AEC2| dw $18CA, $18DA, $18CA, $18DA
|00AECA| dw $18CB, $18DB, $18CB, $18DB
|00AED2| dw $4986, $4996, $49A6, $49A8
|00AEDA| dw $4985, $4995, $49A8, $4854
|00AEE2| dw $4984, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

|00AEEA| dw $0985, $09A7, $0843, $0853
|00AEF2| dw $0986, $0996, $09A8, $0854
|00AEFA| dw $0871, $0871, $098B, $099B
|00AF02| dw $18CA, $18DA, $18CA, $18DA
|00AF0A| dw $18CB, $18DB, $18CB, $18DB
|00AF12| dw $18CA, $18DA, $18CA, $18DA
|00AF1A| dw $18CB, $18DB, $18CB, $18DB
|00AF22| dw $4871, $4871, $498B, $499B
|00AF2A| dw $4986, $4996, $49A8, $4854
|00AF32| dw $4985, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

^.obj13E8
|00AF3A| dw $0986, $09A7, $0843, $0853
|00AF42| dw $0871, $098B, $099B, $0854
|00AF4A| dw $0871, $0871, $098B, $099B
|00AF52| dw $18CA, $18DA, $18CA, $18DA
|00AF5A| dw $18CB, $18DB, $18CB, $18DB
|00AF62| dw $18CA, $18DA, $18CA, $18DA
|00AF6A| dw $18CB, $18DB, $18CB, $18DB
|00AF72| dw $4871, $4871, $498B, $499B
|00AF7A| dw $4871, $498B, $499B, $4854
|00AF82| dw $4986, $49A7, $4843, $4853

;---------------------------------------------------------------------------------------------------

^.obj1438
|00AF8A| dw $18CA, $18CB, $18CA, $18CB
|00AF92| dw $18DA, $0974, $4974, $18DB
|00AF9A| dw $18CA, $8974, $C974, $18CB
|00AFA2| dw $18DA, $18DB, $18DA, $18DB

;---------------------------------------------------------------------------------------------------

^.obj1458
|00AFAA| dw $1D48, $1D58, $1568, $1542
|00AFB2| dw $1562, $1552, $1D49, $1D59
|00AFBA| dw $1D69, $1D43, $1D63, $1D53
|00AFC2| dw $1D60, $1D70, $1D78, $1D61
|00AFCA| dw $1D71, $1D79, $5D61, $5D71
|00AFD2| dw $5D79, $5D60, $5D70, $5D78

;---------------------------------------------------------------------------------------------------

^.obj1488
|00AFDA| dw $298D, $298E, $299E, $298F
|00AFE2| dw $299F, $299D

;---------------------------------------------------------------------------------------------------

^.obj1494
|00AFE6| dw $09A2, $09A3, $49A2, $49A3

;---------------------------------------------------------------------------------------------------

^.obj149C
|00AFEE| dw $19E1, $19F1, $59E1, $59F1

;---------------------------------------------------------------------------------------------------

^.obj14A4
|00AFF6| dw $19E2, $19F2, $59E2, $59F2

;---------------------------------------------------------------------------------------------------

^.obj14AC
|00AFFE| dw $1920, $1930, $1926, $1921
|00B006| dw $1931, $1927, $5921, $5931
|00B00E| dw $5927, $5920, $5930, $5926

;---------------------------------------------------------------------------------------------------

^.obj14C4
|00B016| dw $1906, $1916, $1926, $1907
|00B01E| dw $1917, $1927, $5907, $5917
|00B026| dw $5927, $5906, $5916, $5926

;---------------------------------------------------------------------------------------------------

^.obj14DC
|00B02E| dw $2980, $0990, $09A0, $2981
|00B036| dw $0991, $09A1, $2981, $0991
|00B03E| dw $09A1, $6981, $4991, $49A1
|00B046| dw $6981, $4991, $49A1, $6980
|00B04E| dw $4990, $49A1
 
;---------------------------------------------------------------------------------------------------

^.obj1500
|00B052| dw $89A0, $8990, $A980, $89A1
|00B05A| dw $8991, $A981, $89A1, $8991
|00B062| dw $A981, $C9A1, $C991, $E981
|00B06A| dw $C9A1, $C991, $E981, $C9A0
|00B072| dw $C990, $E980

;---------------------------------------------------------------------------------------------------

^.obj1524
|00B076| dw $2982, $0983, $09A2, $2992
|00B07E| dw $0993, $09A3, $2992, $0993
|00B086| dw $09A3, $A992, $8993, $89A3
|00B08E| dw $A992, $8993, $89A3, $A982
|00B096| dw $8983, $89A2

;---------------------------------------------------------------------------------------------------

^.obj1548
|00B09A| dw $49A2, $4983, $6982, $49A3
|00B0A2| dw $4993, $6992, $49A3, $4993
|00B0AA| dw $6992, $C9A3, $C993, $E992
|00B0B2| dw $C9A3, $C993, $E992, $C9A2
|00B0BA| dw $C983, $E982

;---------------------------------------------------------------------------------------------------

^.obj156C
|00B0BE| dw $2984, $0990, $09A0, $2994
|00B0C6| dw $0991, $09A1, $2994, $0991
|00B0CE| dw $09A1, $6994, $4991, $49A1
|00B0D6| dw $6994, $4991, $49A1, $6984
|00B0DE| dw $4990, $49A0

;---------------------------------------------------------------------------------------------------

^.obj1590
|00B0E2| dw $89A0, $8990, $A984, $89A1
|00B0EA| dw $8991, $A994, $89A1, $8991
|00B0F2| dw $A994, $C9A1, $C991, $E994
|00B0FA| dw $C9A1, $C991, $E994, $C9A0
|00B102| dw $C990, $E984

;---------------------------------------------------------------------------------------------------

^.obj15B4
|00B106| dw $288A, $288B, $288B, $0809
|00B10E| dw $09EF, $09EF, $080A, $0879
|00B116| dw $0879, $288A, $A88B, $A88B
|00B11E| dw $09EF, $89EF, $8809, $0879
|00B126| dw $8879, $880A

;---------------------------------------------------------------------------------------------------

^.obj15D8
|00B12A| dw $480A, $4879, $4879, $4809
|00B132| dw $49EF, $49EF, $688A, $688B
|00B13A| dw $688B, $4879, $C879, $C80A
|00B142| dw $49EF, $C9EF, $C809, $688B
|00B14A| dw $E88B, $E88A

;---------------------------------------------------------------------------------------------------

^.obj15FC
|00B14E| dw $880D, $8808, $A82C, $8878
|00B156| dw $09EF, $A82D, $C878, $09EF
|00B15E| dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

^.obj1614
|00B166| dw $0980, $0981, $4981, $4980
|00B16E| dw $0990, $0991, $4991, $4990
|00B176| dw $09A0, $09A1, $49A1, $49A0

;---------------------------------------------------------------------------------------------------

^.obj162C
|00B17E| dw $0980, $0981, $4981, $4980
|00B186| dw $0990, $0991, $4991, $4990
|00B18E| dw $09A0, $1DB2, $1DB2, $49A0
|00B196| dw $1DB3, $1DB3, $1DB3, $1DB3
|00B19E| dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

^.obj1654
|00B1A6| dw $2980, $2981, $6981, $6980
|00B1AE| dw $2990, $2991, $6991, $6990

|00B1B6| dw $29A0, $3DB2, $3DB2, $69A0
|00B1BE| dw $3DB3, $3DB3, $3DB3, $3DB3
|00B1C6| dw $3DB3, $3DB3, $3DB3, $3DB3
|00B1CE| dw $1DB3, $1DB3, $1DB3, $1DB3
|00B1D6| dw $1DB5, $1DB5, $1DB5, $1DB5

;---------------------------------------------------------------------------------------------------

^.obj168C
|00B1DE| dw $09A0, $1DB2, $5DB2, $49A0
|00B1E6| dw $1DB3, $1DB3, $1DB3, $1DB3
|00B1EE| dw $1DB3, $1DB3, $1DB3, $1DB3
|00B1F6| dw $1DB5, $1DB5, $1DB5, $1DB5
|00B1FE| dw $18CA, $18CB, $18CA, $18CB

;---------------------------------------------------------------------------------------------------

^.obj16B4
|00B206| dw $09A0, $1DB2, $5DB2, $49A0
|00B20E| dw $1DB3, $1DB3, $1DB3, $1DB3
|00B216| dw $1DB5, $1DB5, $1DB5, $1DB5
|00B21E| dw $0870, $0870, $0870, $0870
|00B226| dw $18CA, $18CB, $18CA, $18CB

;---------------------------------------------------------------------------------------------------

^.obj16DC
|00B22E| dw $01EC, $853E, $853F, $853D
|00B236| dw $853D, $853D, $C53D, $C53D
|00B23E| dw $C53D, $C53F, $C53E, $01EC
|00B246| dw $052A, $853D, $853D, $853D
|00B24E| dw $853D, $853D, $C53D, $C53D
|00B256| dw $C53D, $C53D, $C53D, $452A
|00B25E| dw $05E8, $853D, $853D, $852E
|00B266| dw $852F, $852D, $C52D, $C52F
|00B26E| dw $C52E, $C53D, $C53D, $45E8
|00B276| dw $05E7, $853D, $052B, $852D
|00B27E| dw $852D, $852D, $C52D, $C52D
|00B286| dw $C52D, $452B, $C53D, $45E7
|00B28E| dw $05E7, $853D, $053B, $852D
|00B296| dw $852D, $852D, $C52D, $C52D
|00B29E| dw $C52D, $453B, $C53D, $45E7
|00B2A6| dw $85E8, $853D, $853B, $852D
|00B2AE| dw $852D, $852D, $C52D, $C52D
|00B2B6| dw $C52D, $C53B, $C53D, $C5E8
|00B2BE| dw $852A, $853D, $852B, $852D
|00B2C6| dw $852D, $852D, $C52D, $C52D
|00B2CE| dw $C52D, $C52B, $C53D, $C52A
|00B2D6| dw $01EC, $853A, $853D, $853B
|00B2DE| dw $852D, $852D, $C52D, $C52D
|00B2E6| dw $C53B, $C53D, $C53A, $01EC
|00B2EE| dw $01EC, $852A, $853D, $852B
|00B2F6| dw $852D, $852D, $C52D, $C52D
|00B2FE| dw $C52B, $C53D, $C52A, $01EC
|00B306| dw $01EC, $01EC, $853A, $853D
|00B30E| dw $052E, $052F, $452F, $452E
|00B316| dw $C53D, $C53A, $01EC, $01EC
|00B31E| dw $01EC, $01EC, $852A, $853D
|00B326| dw $853D, $853D, $C53D, $C53D
|00B32E| dw $C53D, $C52A, $01EC, $01EC
|00B336| dw $01EC, $01EC, $01EC, $053E
|00B33E| dw $053F, $853D, $C53D, $453F
|00B346| dw $453E

;---------------------------------------------------------------------------------------------------

^.obj17F6
|00B348| dw $01EC, $01EC, $01EC, $853E
|00B350| dw $853F, $053D, $453D, $C53F
|00B358| dw $C53E, $01EC, $01EC, $01EC
|00B360| dw $01EC, $01EC, $052A, $053D
|00B368| dw $053D, $053D, $453D, $453D
|00B370| dw $453D, $452A, $01EC, $01EC
|00B378| dw $01EC, $01EC, $053A, $053D
|00B380| dw $852E, $852F, $C52F, $C52E
|00B388| dw $453D, $453A, $01EC, $01EC
|00B390| dw $01EC, $052A, $053D, $052B
|00B398| dw $052D, $052D, $452D, $452D
|00B3A0| dw $452B, $453D, $452A, $01EC
|00B3A8| dw $01EC, $053A, $053D, $053B
|00B3B0| dw $052D, $052D, $452D, $452D
|00B3B8| dw $453B, $453D, $453A, $01EC
|00B3C0| dw $052A, $053D, $052B, $052D
|00B3C8| dw $052D, $052D, $452D, $452D
|00B3D0| dw $452D, $452B, $453D, $452A
|00B3D8| dw $05E8, $053D, $053B, $052D
|00B3E0| dw $052D, $052D, $452D, $452D
|00B3E8| dw $452D, $453B, $453D, $45E8
|00B3F0| dw $05E7, $053D, $853B, $052D
|00B3F8| dw $052D, $052D, $452D, $452D
|00B400| dw $452D, $C53B, $453D, $45E7
|00B408| dw $05E7, $053D, $852B, $052D
|00B410| dw $052D, $052D, $452D, $452D
|00B418| dw $452D, $C52B, $453D, $45E7
|00B420| dw $85E8, $053D, $053D, $052E
|00B428| dw $052F, $052D, $452D, $452F
|00B430| dw $452E, $453D, $453D, $C5E8
|00B438| dw $852A, $053D, $053D, $053D
|00B440| dw $053D, $053D, $453D, $453D
|00B448| dw $453D, $453D, $453D, $C52A
|00B450| dw $01EC, $053E, $053F, $053D
|00B458| dw $053D, $053D, $453D, $453D
|00B460| dw $453D, $453F, $453E

;---------------------------------------------------------------------------------------------------

^.obj1914
|00B466| dw $01EC, $853E, $853F, $053D
|00B46E| dw $053D, $C53F, $C53E, $01EC
|00B476| dw $01EC, $01EC, $01EC, $01EC
|00B47E| dw $052A, $053D, $053D, $053D
|00B486| dw $053D, $053D, $053D, $C53F
|00B48E| dw $C53E, $01EC, $01EC, $01EC
|00B496| dw $053A, $053D, $053D, $852E
|00B49E| dw $852F, $C52F, $C52E, $053D
|00B4A6| dw $053D, $C53F, $C53E, $01EC
|00B4AE| dw $053D, $053D, $052B, $052D
|00B4B6| dw $052D, $052D, $852D, $C52F
|00B4BE| dw $C52E, $053D, $053D, $452A
|00B4C6| dw $053D, $053D, $053B, $052D
|00B4CE| dw $052D, $052D, $052D, $052D
|00B4D6| dw $052D, $452B, $053D, $453A
|00B4DE| dw $053D, $053D, $052D, $052D
|00B4E6| dw $052D, $052D, $052D, $052D
|00B4EE| dw $052D, $453B, $053D, $053D
|00B4F6| dw $853D, $853D, $852D, $852D
|00B4FE| dw $852D, $852D, $852D, $852D
|00B506| dw $852D, $C53B, $853D, $853D
|00B50E| dw $853D, $853D, $853B, $852D
|00B516| dw $852D, $852D, $852D, $852D
|00B51E| dw $852D, $C52B, $853D, $C53A
|00B526| dw $853D, $853D, $852B, $852D
|00B52E| dw $852D, $852D, $852D, $452F
|00B536| dw $452E, $853D, $853D, $C52A
|00B53E| dw $853A, $853D, $853D, $052E
|00B546| dw $052F, $452F, $452E, $853D
|00B54E| dw $853D, $453F, $453E, $01EC
|00B556| dw $852A, $853D, $853D, $853D
|00B55E| dw $853D, $853D, $853D, $453F
|00B566| dw $453E, $01EC, $01EC, $01EC
|00B56E| dw $01EC, $053E, $053F, $853D
|00B576| dw $853D, $453F, $453E

;---------------------------------------------------------------------------------------------------

^.obj1A2A
|00B57C| dw $01EC, $01EC, $01EC, $01EC
|00B584| dw $01EC, $853E, $853F, $453D
|00B58C| dw $453D, $C53F, $C53E, $01EC
|00B594| dw $01EC, $01EC, $01EC, $853E
|00B59C| dw $853F, $453D, $453D, $453D
|00B5A4| dw $453D, $453D, $453D, $452A
|00B5AC| dw $01EC, $853E, $853F, $453D
|00B5B4| dw $453D, $852E, $852F, $C52F
|00B5BC| dw $C52E, $453D, $453D, $453A
|00B5C4| dw $052A, $453D, $453D, $852E
|00B5CC| dw $852F, $452D, $452D, $452D
|00B5D4| dw $452D, $452B, $453D, $453D
|00B5DC| dw $053A, $453D, $052B, $452D
|00B5E4| dw $452D, $452D, $452D, $452D
|00B5EC| dw $452D, $453B, $453D, $453D
|00B5F4| dw $453D, $453D, $053B, $452D
|00B5FC| dw $452D, $452D, $452D, $452D
|00B604| dw $452D, $452D, $453D, $453D
|00B60C| dw $C53D, $C53D, $853B, $C52D
|00B614| dw $C52D, $C52D, $C52D, $C52D
|00B61C| dw $C52D, $C52D, $C53D, $C53D
|00B624| dw $853A, $C53D, $852B, $C52D
|00B62C| dw $C52D, $C52D, $C52D, $C52D
|00B634| dw $C52D, $C53B, $C53D, $C53D
|00B63C| dw $852A, $C53D, $C53D, $052E
|00B644| dw $052F, $C52D, $C52D, $C52D
|00B64C| dw $C52D, $C52B, $C53D, $C53D
|00B654| dw $01EC, $053E, $053F, $C53D
|00B65C| dw $C53D, $052E, $052F, $452F
|00B664| dw $452E, $C53D, $C53D, $C53A
|00B66C| dw $01EC, $01EC, $01EC, $053E
|00B674| dw $053F, $C53D, $C53D, $C53D
|00B67C| dw $C53D, $C53D, $C53D, $C52A
|00B684| dw $01EC, $01EC, $01EC, $01EC
|00B68C| dw $01EC, $053E, $053F, $C53D
|00B694| dw $C53D, $453F, $453E, $01EC

;---------------------------------------------------------------------------------------------------

^.obj1B4A
|00B69C| dw $099D, $098E, $098E, $098E
|00B6A4| dw $098E, $098E, $098E, $098E
|00B6AC| dw $098E, $098E, $098E, $098E
|00B6B4| dw $098E, $099E, $099F, $18C6
|00B6BC| dw $18C6, $18C6, $18C6, $18C6
|00B6C4| dw $18C6, $18C6, $18C6, $18C6
|00B6CC| dw $18C6, $18C6, $18C6, $099F
|00B6D4| dw $099F, $18C6, $18C6, $18C6
|00B6DC| dw $18C6, $118A, $119A, $118B
|00B6E4| dw $119B, $11A0, $18C6, $18C6
|00B6EC| dw $18C6, $099F, $099F, $18C6
|00B6F4| dw $18C6, $18C6, $18C6, $1183
|00B6FC| dw $1193, $1182, $1192, $11A1
|00B704| dw $18C6, $18C6, $498F, $499E
|00B70C| dw $099F, $18C6, $18D4, $98D4
|00B714| dw $18C6, $1189, $1187, $1197
|00B71C| dw $118C, $11A2, $18C6, $18C6
|00B724| dw $0972, $0972, $099F, $18D6
|00B72C| dw $18D5, $98D5, $98D6, $119C
|00B734| dw $1188, $1198, $118D, $11A3
|00B73C| dw $18C6, $18C6, $0972, $0972

;---------------------------------------------------------------------------------------------------

^.obj1BF2
|00B744| dw $0995, $1D99, $0994, $0CAC
|00B74C| dw $0995, $1D99, $0994, $0CAC
|00B754| dw $0980, $0990, $0986, $09A6
|00B75C| dw $4980, $4990, $4986, $49A6
|00B764| dw $0995, $1D99, $0994, $0CAC
|00B76C| dw $0995, $1D99, $0994, $0CAC

^.obj1C22
|00B774| dw $1DA7, $1DA8, $1DA4, $08F5
|00B77C| dw $0CD8

^.obj1C2C
|00B77E| dw $0981, $0991, $0985, $09A5
|00B786| dw $8981, $8991, $8985, $89A5
|00B78E| dw $0996, $1D99, $0984, $0CAD
|00B796| dw $0996, $1D99, $0984, $0CAD
|00B79E| dw $0996, $1D99, $0984, $0CAD
|00B7A6| dw $0996, $1D99, $0984, $0CAD

^.obj1C5C
|00B7AE| dw $98D9, $D8C7, $98C7, $D8C7
|00B7B6| dw $98C8, $14DB, $14CA, $58C8
|00B7BE| dw $18C7, $58C7, $18C7, $58D9

^.obj1C74
|00B7C6| dw $58D9, $14CA, $D8C7, $98C8
|00B7CE| dw $58C7, $18C7, $D8C7, $98C7
|00B7D6| dw $58C8, $18C7, $14DB, $98D9

^.obj1C8C
|00B7DE| dw $0CD8, $14CB, $D8C8, $58C8
|00B7E6| dw $14DB, $14DA, $18D9, $98C7
|00B7EE| dw $18C7, $98D9, $D8C8, $58C7
|00B7F6| dw $D8C7, $58C7, $D8D9, $98C8
|00B7FE| dw $18C7, $98C7, $18C8, $14DA
|00B806| dw $14DB, $58D9, $D8D9, $14CB
|00B80E| dw $14DB

;---------------------------------------------------------------------------------------------------

^.obj1CBE
|00B810| dw $95A6, $958D, $B597, $95A7
|00B818| dw $959C, $B598, $D5A7, $D59C
|00B820| dw $F598, $D5A6, $D58D, $F597
|00B828| dw $B587, $B595, $95A0, $B588
|00B830| dw $B596, $9586, $F588, $F596
|00B838| dw $D586, $F587, $F595, $D5A0

;---------------------------------------------------------------------------------------------------

^.obj1CEE
|00B840| dw $15A0, $3595, $3587, $3586
|00B848| dw $3596, $3588, $7586, $7596
|00B850| dw $7588, $55A0, $7595, $7587
|00B858| dw $3597, $158D, $15A6, $3598
|00B860| dw $159C, $15A7, $7598, $559C
|00B868| dw $55A7, $7597, $558D, $55A6

;---------------------------------------------------------------------------------------------------

^.obj1D1E
|00B870| dw $55A4, $55A5, $D5A5, $D5A4
|00B878| dw $558C, $559C, $D59C, $D58C
|00B880| dw $758B, $759B, $F59B, $F58B
|00B888| dw $758A, $759A, $F59A, $F58A
|00B890| dw $7589, $7599, $F599, $F589
|00B898| dw $55A1, $7585, $F585, $D5A1

;---------------------------------------------------------------------------------------------------

^.obj1D4E
|00B8A0| dw $15A1, $3585, $B585, $95A1
|00B8A8| dw $3589, $3599, $B599, $B589
|00B8B0| dw $358A, $359A, $B59A, $B58A
|00B8B8| dw $358B, $359B, $B59B, $B58B
|00B8C0| dw $158C, $159C, $959C, $958C
|00B8C8| dw $15A4, $15A5, $95A5, $95A4

;---------------------------------------------------------------------------------------------------

^.obj1D7E
|00B8D0| dw $1590, $1590, $5590, $5590

;---------------------------------------------------------------------------------------------------

^.obj1D86
|00B8D8| dw $1580, $9580, $1580, $9580

;---------------------------------------------------------------------------------------------------

^.obj1D8E
|00B8E0| dw $1581, $1590, $1580, $1591

;---------------------------------------------------------------------------------------------------

^.obj1D96
|00B8E8| dw $1590, $1592, $1582, $9580

;---------------------------------------------------------------------------------------------------

^.obj1D9E
|00B8F0| dw $1580, $1593, $1583, $5590

;---------------------------------------------------------------------------------------------------

^.obj1DA6
|00B8F8| dw $1584, $9580, $5590, $1594

;---------------------------------------------------------------------------------------------------

^.obj1DAE
|00B900| dw $15A3, $1590, $55A3, $5590

;---------------------------------------------------------------------------------------------------

^.obj1DB6
|00B908| dw $1590, $95A3, $5590, $D5A3

;---------------------------------------------------------------------------------------------------

^.obj1DBE
|00B910| dw $95A2, $15A2, $1580, $9580

;---------------------------------------------------------------------------------------------------

^.obj1DC6
|00B918| dw $1580, $9580, $D5A2, $55A2

;---------------------------------------------------------------------------------------------------

^.obj1DCE
|00B920| dw $159D, $959D, $559D, $D59D

;---------------------------------------------------------------------------------------------------

^.obj1DD6
|00B928| dw $19C4, $19C5

;---------------------------------------------------------------------------------------------------

^.obj1DDA
|00B92C| dw $0980, $0990, $0981, $0991

;---------------------------------------------------------------------------------------------------

^.obj1DE2
|00B934| dw $8990, $8980, $8991, $8981

;---------------------------------------------------------------------------------------------------

^.obj1DEA
|00B93C| dw $0D29, $0D39, $4D29, $4D39

;---------------------------------------------------------------------------------------------------

^.obj1DF2
|00B944| dw $19CD, $19CE, $59CD, $59CE

;---------------------------------------------------------------------------------------------------

^.obj1DFA
|00B94C| dw $01EC, $1585, $1586, $1587
|00B954| dw $1588, $1589, $1578, $5586
|00B95C| dw $5585, $01EC, $1594, $1595
|00B964| dw $1596, $1597, $1598, $1599
|00B96C| dw $1579, $5596, $5595, $5594
|00B974| dw $158A, $158B, $158C, $158D
|00B97C| dw $158E, $158F, $1572, $558C
|00B984| dw $558B, $558A, $159A, $159B
|00B98C| dw $159C, $159D, $159E, $159F
|00B994| dw $559D, $559C, $559B, $559A
|00B99C| dw $15AA, $15AB, $15AC, $15AD
|00B9A4| dw $15AE, $15AF, $55AD, $55AC
|00B9AC| dw $55AB, $55AA, $15A0, $15A1
|00B9B4| dw $15A2, $15A3, $15A4, $15A5
|00B9BC| dw $55A3, $55A2, $55A1, $55A0
|00B9C4| dw $15A7, $15A8, $154E, $156E
|00B9CC| dw $1576, $1577, $556E, $554E
|00B9D4| dw $55A8, $55A7, $01EC, $15A9
|00B9DC| dw $155E, $157E, $1574, $1575

|00B9E4| dw $557E, $555E, $55A9, $01EC

;---------------------------------------------------------------------------------------------------

^.obj1E9A
|00B9EC| dw $01EC, $31AA, $3161, $3162
|00B9F4| dw $3163, $7163, $7162, $7161
|00B9FC| dw $71AA, $01EC, $01EC, $3170
|00BA04| dw $3171, $3172, $317E, $717E
|00BA0C| dw $7172, $7171, $7170, $01EC
|00BA14| dw $3144, $3145, $3146, $3147
|00BA1C| dw $3148, $7148, $7147, $7146
|00BA24| dw $7145, $7144, $3154, $3155
|00BA2C| dw $3156, $3157, $3158, $7158
|00BA34| dw $7157, $7156, $7155, $7154
|00BA3C| dw $3164, $3165, $3166, $3167
|00BA44| dw $3168, $7168, $7167, $7166
|00BA4C| dw $7165, $7164, $3174, $3175
|00BA54| dw $3176, $3177, $3178, $7178
|00BA5C| dw $7177, $7176, $7175, $7174
|00BA64| dw $3149, $3159, $3169, $3179
|00BA6C| dw $31AF, $71AF, $7179, $7169
|00BA74| dw $7159, $7149, $31AA, $31AB
|00BA7C| dw $31AC, $31AD, $31AE, $71AE
|00BA84| dw $71AD, $71AC, $71AB, $71AA

;---------------------------------------------------------------------------------------------------

^.obj1F3A
|00BA8C| dw $0DCF, $8DCF, $4DCF, $CDCF

;---------------------------------------------------------------------------------------------------

^.obj1F42
|00BA94| dw $0D1F, $8D1F, $4D1F, $CD1F

;---------------------------------------------------------------------------------------------------

^.obj1F4A
|00BA9C| dw $0D01, $8D01, $4D01, $CD01

;---------------------------------------------------------------------------------------------------

^.obj1F52
|00BAA4| dw $19D0, $19D2, $19D1, $19D3

;---------------------------------------------------------------------------------------------------

^.obj1F5A
|00BAAC| dw $0DD4, $0DD6, $0DD5, $0DD7

;---------------------------------------------------------------------------------------------------

^.obj1F62
|00BAB4| dw $0993, $0D82, $0D84, $0890
|00BABC| dw $0D83, $0D85, $0890, $0D92
|00BAC4| dw $0D86, $0890, $4D92, $4D86
|00BACC| dw $0890, $0D92, $0D86, $0890
|00BAD4| dw $4D92, $4D86, $0890, $4D83
|00BADC| dw $4D85, $4993, $4D82, $4D84

;---------------------------------------------------------------------------------------------------

^.obj1F92
|00BAE4| dw $094A, $094B, $094B, $494B
|00BAEC| dw $494B, $494A, $094E, $0978
|00BAF4| dw $0979, $4979, $4978, $494E
|00BAFC| dw $094E, $094F, $1DB3, $5DB3
|00BB04| dw $494F, $494E, $094E, $094F
|00BB0C| dw $1DB4, $5DB4, $494F, $494E
|00BB14| dw $094E, $094F, $1DB4, $5DB4
|00BB1C| dw $494F, $494E, $094E, $094F
|00BB24| dw $9DB3, $DDB3, $494F, $494E
|00BB2C| dw $096A, $095E, $095F, $495F
|00BB34| dw $495E, $496A, $097A, $096E
|00BB3C| dw $096F, $496F, $496E, $497A

;---------------------------------------------------------------------------------------------------

^.obj1FF2
|00BB44| dw $11A0, $11A2, $1194, $11A1
|00BB4C| dw $11A3, $1195, $51A1, $51A3
|00BB54| dw $5195, $11A1, $11A3, $1195
|00BB5C| dw $51A1, $51A3, $5195, $51A0
|00BB64| dw $51A2, $5194

;---------------------------------------------------------------------------------------------------

^.obj2016
|00BB68| dw $0DAA, $0DAC, $0DAE, $0DAB
|00BB70| dw $0DAD, $0DAF, $4DAB, $4DAD
|00BB78| dw $4DAF, $4DAA, $4DAC, $4DAE

;---------------------------------------------------------------------------------------------------

^.obj202E
|00BB80| dw $0D51, $0D66, $1D64, $1D44
|00BB88| dw $1D54, $1D64, $1D54, $09EF
|00BB90| dw $0D55, $0D65, $156B, $157B
|00BB98| dw $158B, $1D40, $19B2, $157C
|00BBA0| dw $158C, $1D41, $156C, $157D
|00BBA8| dw $158C, $5D41, $14E4, $14E5
|00BBB0| dw $158D, $1D41

;---------------------------------------------------------------------------------------------------

^.obj2062
|00BBB4| dw $1540, $1550, $1576, $1541
|00BBBC| dw $1551, $1577, $5541, $5551
|00BBC4| dw $5577, $1541, $1551, $1577
|00BBCC| dw $5541, $5551, $5577, $5540
|00BBD4| dw $5550, $5576

;---------------------------------------------------------------------------------------------------

^.obj2086
|00BBD8| dw $1180, $1190, $1190, $1190
|00BBE0| dw $1191, $1186, $1196, $1181
|00BBE8| dw $5190, $5190, $5190, $5191
|00BBF0| dw $5186, $5196, $1182, $1192
|00BBF8| dw $1184, $1194, $11A4, $11A4
|00BC00| dw $11A4, $1183, $1193, $1185
|00BC08| dw $1195, $11A4, $11A4, $11A4
|00BC10| dw $5183, $5193, $5185, $5195
|00BC18| dw $51A4, $51A4, $51A4, $5182
|00BC20| dw $5192, $5184, $5194, $51A4
|00BC28| dw $51A4, $51A4, $5181, $1190
|00BC30| dw $1190, $1190, $1191, $1186
|00BC38| dw $1196, $5180, $5190, $5190
|00BC40| dw $5190, $5191, $5186, $5196

;---------------------------------------------------------------------------------------------------

^.obj20F6
|00BC48| dw $1593, $1580, $1580, $1580
|00BC50| dw $1580, $1580, $1580, $1580
|00BC58| dw $1580, $1580, $15A1, $1580
|00BC60| dw $1580, $1580, $1580, $1580
|00BC68| dw $1580, $1580, $1580, $1580
|00BC70| dw $1582, $15A3, $1580, $5583
|00BC78| dw $5593, $1580, $1580, $1580
|00BC80| dw $1582, $1592, $1580, $1583
|00BC88| dw $1596, $1580, $55A1, $D5A1
|00BC90| dw $1580, $1580, $1580, $1583
|00BC98| dw $1593, $1580, $1580, $55A1
|00BCA0| dw $1580, $5582, $5592, $1580
|00BCA8| dw $1580, $1580, $1580, $1580
|00BCB0| dw $1580, $1580, $55A0, $1580
|00BCB8| dw $1580, $1580, $15B4, $15B3
|00BCC0| dw $95B3, $95B4, $1580, $1580
|00BCC8| dw $1580, $5591, $1580, $1580
|00BCD0| dw $15B6, $15B5, $1581, $1581
|00BCD8| dw $95B5, $95B6, $1580, $1580
|00BCE0| dw $5590, $95A0, $15B7, $15B5
|00BCE8| dw $1581, $1581, $1581, $1581
|00BCF0| dw $95B5, $95B7, $1580, $55A1
|00BCF8| dw $95A1, $15B8, $1581, $1595
|00BD00| dw $15A5, $95A5, $9595, $9581
|00BD08| dw $95B8, $1580, $55A0, $D5A1
|00BD10| dw $15B9, $1585, $15A4, $15A4
|00BD18| dw $15A4, $15A4, $9585, $95B9
|00BD20| dw $1580, $5591, $D5A0, $15B2
|00BD28| dw $1586, $15A4, $15A4, $15A4
|00BD30| dw $15A4, $9586, $95B2, $1580
|00BD38| dw $5590, $1580, $55B2, $5586
|00BD40| dw $15A4, $15A4, $15A4, $15A4
|00BD48| dw $D586, $D5B2, $1580, $1590
|00BD50| dw $1580, $55B9, $5585, $15A4
|00BD58| dw $15A4, $15A4, $15A4, $D585
|00BD60| dw $D5B9, $1580, $1591, $1580
|00BD68| dw $55B8, $5581, $5595, $55A5
|00BD70| dw $D5A5, $D595, $D581, $D5B8
|00BD78| dw $1580, $15A0, $1580, $55B7
|00BD80| dw $55B5, $5581, $5581, $5581
|00BD88| dw $5581, $D5B5, $D5B7, $1582
|00BD90| dw $1596, $1580, $1580, $55B6
|00BD98| dw $55B5, $5581, $5581, $D5B5
|00BDA0| dw $D5B6, $1580, $1583, $1596
|00BDA8| dw $95A0, $1580, $1580, $55B4
|00BDB0| dw $55B3, $D5B3, $D5B4, $1580
|00BDB8| dw $1580, $1580, $1590, $95A1
|00BDC0| dw $1580, $1580, $1580, $1580
|00BDC8| dw $1580, $1580, $1580, $1580
|00BDD0| dw $1580, $1591, $9590, $1580
|00BDD8| dw $5583, $5593, $1580, $1582
|00BDE0| dw $1592, $1580, $1580, $1580
|00BDE8| dw $15A0, $9591, $1580, $55A1
|00BDF0| dw $D5A1, $1580, $1583, $1593
|00BDF8| dw $1580, $1580, $1580, $15A1
|00BE00| dw $95A0, $1580, $5582, $5592
|00BE08| dw $1580, $1580, $1580, $1580
|00BE10| dw $1580, $1580, $1590, $95A1
|00BE18| dw $1580, $1580, $1580, $1580
|00BE20| dw $1580, $1580, $1580, $1580
|00BE28| dw $1580, $1591

;---------------------------------------------------------------------------------------------------

^.obj22DA
|00BE2C| dw $0CEE, $D594, $1584, $15A3
|00BE34| dw $5594, $1594

;---------------------------------------------------------------------------------------------------

^.obj22E6
|00BE38| dw $0D09, $0D19, $4D09, $4D19

;---------------------------------------------------------------------------------------------------

^.obj22EE
|00BE40| dw $0D0A, $0D1A, $4D0A, $4D1A

;---------------------------------------------------------------------------------------------------

^.obj22F6
|00BE48| dw $0D4A, $0D5A, $0D6A, $0D7A
|00BE50| dw $0D4B, $0D5B, $0D6B, $0D7B
|00BE58| dw $4D4B, $4D5B, $4D6B, $4D7B
|00BE60| dw $4D4A, $4D5A, $4D6A, $4D7A

;---------------------------------------------------------------------------------------------------

^.obj2316
|00BE68| dw $0966, $0956, $1D48, $0967
|00BE70| dw $0957, $1DBE, $4967, $4957
|00BE78| dw $5DBE, $4966, $4956, $5D48

;---------------------------------------------------------------------------------------------------

^.obj232E
|00BE80| dw $9D48, $8956, $8966, $9DBE
|00BE88| dw $8957, $8967, $DDBE, $C957
|00BE90| dw $C967, $DD48, $C956, $C966

;---------------------------------------------------------------------------------------------------

^.obj2346
|00BE98| dw $0968, $0969, $8969, $8968
|00BEA0| dw $0958, $0959, $8959, $8958
|00BEA8| dw $1D49, $1DBF, $9DBF, $9D49

;---------------------------------------------------------------------------------------------------

^.obj235E
|00BEB0| dw $5D49, $5DBF, $DDBF, $DD49
|00BEB8| dw $4958, $4959, $C959, $C958
|00BEC0| dw $4968, $4969, $C969, $C968

;---------------------------------------------------------------------------------------------------

^.obj2376
|00BEC8| dw $113D, $113D, $113D, $113D
|00BED0| dw $113D, $113D, $113D, $113D
|00BED8| dw $113D, $113D, $113D, $113D
|00BEE0| dw $113D, $113D, $113D, $113D

^.obj2396
|00BEE8| dw $1164, $1164, $1164, $1174
|00BEF0| dw $1165, $1165, $1165, $1175
|00BEF8| dw $5165, $5165, $5165, $5175
|00BF00| dw $5164, $5164, $5164, $5174

;---------------------------------------------------------------------------------------------------

^.obj23B6
|00BF08| dw $1144, $1154, $1154, $1154
|00BF10| dw $1176, $112D, $112D, $112D
|00BF18| dw $1145, $1155, $1155, $1155
|00BF20| dw $1176, $112D, $112D, $112D
|00BF28| dw $5176, $512D, $512D, $512D
|00BF30| dw $5145, $5155, $5155, $5155
|00BF38| dw $5176, $512D, $512D, $512D
|00BF40| dw $5144, $5154, $5154, $5154
|00BF48| dw $1154, $1154, $1154, $9144
|00BF50| dw $112D, $112D, $112D, $9176
|00BF58| dw $1155, $1155, $1155, $9145
|00BF60| dw $112D, $112D, $112D, $9176
|00BF68| dw $512D, $512D, $512D, $D176
|00BF70| dw $5155, $5155, $5155, $D145
|00BF78| dw $512D, $512D, $512D, $D176
|00BF80| dw $5154, $5154, $5154, $D144

;---------------------------------------------------------------------------------------------------

^.obj2436
|00BF88| dw $09E5, $09F5, $0936, $09FA
|00BF90| dw $49E5, $09F7, $0937, $09FB
|00BF98| dw $0000, $0000, $0000, $0CAC
|00BFA0| dw $0000, $0000, $0000, $4CAC
|00BFA8| dw $0000, $0000, $0000, $0CAC
|00BFB0| dw $0000, $0000, $0000, $4CAC
|00BFB8| dw $09E5, $49F7, $4937, $49FB
|00BFC0| dw $49E5, $49F5, $4936, $49FA
|00BFC8| dw $1414, $9414, $1414, $9414
|00BFD0| dw $5414, $D414, $5414, $D414
|00BFD8| dw $1414, $14E9, $14F9, $9414
|00BFE0| dw $5414, $14EA, $14FA, $D414
|00BFE8| dw $1414, $54EA, $54FA, $9414
|00BFF0| dw $5414, $54E9, $54F9, $D414
|00BFF8| dw $1414, $9414, $1414, $9414
|00C000| dw $5414, $D414, $5414, $D414

;---------------------------------------------------------------------------------------------------

^.obj24B6
|00C008| dw $2984, $09AC, $0994, $2985
|00C010| dw $15AD, $1595, $2986, $15AE
|00C018| dw $1596, $2987, $09AF, $0997
|00C020| dw $6987, $49AF, $4997, $6986
|00C028| dw $55AE, $5596, $6985, $55AD
|00C030| dw $5595, $6984, $49AC, $4994

;---------------------------------------------------------------------------------------------------

^.obj24E6
|00C038| dw $0980, $0990, $09A0, $0981
|00C040| dw $0991, $09A1, $0982, $0992
|00C048| dw $11A2, $1183, $1193, $11A3
|00C050| dw $5183, $5193, $51A3, $4982
|00C058| dw $4992, $51A2, $4981, $4991
|00C060| dw $49A1, $4980, $4990, $49A0

;---------------------------------------------------------------------------------------------------

^.obj2516
|00C068| dw $490C, $C90C, $099A, $09AA
|00C070| dw $090C, $098B, $099B, $09AB
|00C078| dw $490C, $498B, $499B, $49AB
|00C080| dw $090C, $890C, $499A, $49AA
|00C088| dw $490C, $09A8, $09A6, $C90C
|00C090| dw $098A, $09A9, $09A7, $890C
|00C098| dw $498A, $49A9, $49A7, $C90C
|00C0A0| dw $090C, $49A8, $49A6, $890C

;---------------------------------------------------------------------------------------------------

^.obj2556
|00C0A8| dw $09AC, $0994, $1D8C, $01EC
|00C0B0| dw $15AD, $1595, $1D9C, $01EC
|00C0B8| dw $15AE, $1596, $1D9C, $01EC
|00C0C0| dw $09AF, $0997, $1D9C, $01EC
|00C0C8| dw $49AF, $4997, $1D9C, $01EC
|00C0D0| dw $55AE, $5596, $1D9C, $01EC
|00C0D8| dw $55AD, $5595, $1D9C, $01EC
|00C0E0| dw $49AC, $4994, $5D8C, $01EC

^.obj2596
|00C0E8| dw $09AC, $0994, $1D8C, $1D8C
|00C0F0| dw $15AD, $1595, $1D9C, $1D9C
|00C0F8| dw $15AE, $1596, $1D9C, $1D9C
|00C100| dw $1D88, $1D98, $1D9C, $1D9C
|00C108| dw $1D88, $1D98, $1D9C, $1D9C
|00C110| dw $55AE, $5596, $1D9C, $1D9C
|00C118| dw $55AD, $5595, $1D9C, $1D9C
|00C120| dw $49AC, $4994, $5D8C, $5D8C

^.obj25D6
|00C128| dw $09AC, $0994, $1D8C, $1D8C
|00C130| dw $15AD, $1595, $1D9C, $1D9C
|00C138| dw $1D88, $1D98, $1D9C, $1D9C
|00C140| dw $1D88, $1D98, $1D89, $1D99
|00C148| dw $1D88, $1D98, $1D89, $1D99
|00C150| dw $1D88, $1D98, $1D9C, $1D9C
|00C158| dw $55AD, $5595, $1D9C, $1D9C
|00C160| dw $49AC, $4994, $5D8C, $5D8C

^.obj2616
|00C168| dw $09AC, $0994, $1D8C, $1D8C
|00C170| dw $1D8D, $1D98, $1D89, $1D99
|00C178| dw $1D88, $1D98, $1D89, $1D99
|00C180| dw $1D88, $1D98, $1D89, $1D99
|00C188| dw $1D88, $1D98, $1D89, $1D99
|00C190| dw $1D88, $1D98, $1D89, $1D99
|00C198| dw $5D8D, $1D98, $1D89, $1D99
|00C1A0| dw $49AC, $4994, $5D8C, $5D8C

;---------------------------------------------------------------------------------------------------

^.obj2656
|00C1A8| dw $08D0, $08D0, $08D0, $08D0
|00C1B0| dw $08D0, $48D0, $48D0, $48D0
|00C1B8| dw $48D0, $48D0, $08D0, $14C0
|00C1C0| dw $14C0, $14C0, $14C0, $54C0
|00C1C8| dw $54C0, $54C0, $54C0, $48D0
|00C1D0| dw $08D0, $14C0, $14C0, $14C0
|00C1D8| dw $14D1, $54D1, $54C0, $54C0
|00C1E0| dw $54C0, $48D0, $08D0, $14C0
|00C1E8| dw $14C0, $14C2, $14C3, $54C3
|00C1F0| dw $54C2, $54C0, $54C0, $48D0
|00C1F8| dw $097C, $097D, $097F, $14C4
|00C200| dw $14C5, $54C5, $54C4, $497F
|00C208| dw $497D, $497C, $096C, $096D
|00C210| dw $096F, $0908, $14E8, $54E8
|00C218| dw $4908, $496F, $496D, $496C
|00C220| dw $095C, $095D, $095F, $0918
|00C228| dw $14F8, $54F8, $4918, $495F
|00C230| dw $495D, $495C, $094C, $094D
|00C238| dw $094F, $A888, $A889, $E889
|00C240| dw $E888, $494F, $494D, $494C

;---------------------------------------------------------------------------------------------------

^.obj26F6
|00C248| dw $14C8, $097E, $096E, $295E
|00C250| dw $14D8, $14C9, $14D9, $294E
|00C258| dw $54D8, $54C9, $54D9, $694E
|00C260| dw $54C8, $497E, $496E, $695E

;===================================================================================================

^.obj2716
|00C268| dw $2888, $0808, $0818, $2889
|00C270| dw $09EF, $0878, $6889, $09EF
|00C278| dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

^.obj272E
|00C280| dw $282C, $0808, $080D, $282D
|00C288| dw $09EF, $0878, $682D, $09EF
|00C290| dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

^.obj2746
|00C298| dw $2888, $0808, $0818, $2889
|00C2A0| dw $09EF, $0878, $6889, $09EF
|00C2A8| dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

^.obj275E
|00C2B0| dw $0882, $0824, $0834, $0883
|00C2B8| dw $0825, $0835, $4883, $4825
|00C2C0| dw $4835, $4882, $4824, $4834

;---------------------------------------------------------------------------------------------------

^.obj2776
|00C2C8| dw $0890, $0896, $08A2, $0891
|00C2D0| dw $0897, $08A3, $0890, $0896
|00C2D8| dw $08A2, $0891, $0897, $08A3

;---------------------------------------------------------------------------------------------------

^.obj278E
|00C2E0| dw $0882, $0800, $0810, $0883
|00C2E8| dw $0802, $0812, $4883, $4802
|00C2F0| dw $4812, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

^.obj27A6
|00C2F8| dw $0882, $0800, $0810, $0883
|00C300| dw $0801, $0811, $4883, $4801
|00C308| dw $4811, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

^.obj27BE
|00C310| dw $0882, $0800, $0810, $0883
|00C318| dw $0802, $0812, $4883, $4802
|00C320| dw $4812, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

^.obj27D6
|00C328| dw $08B0, $0800, $080B, $08B1
|00C330| dw $0802, $0812, $48B1, $4802
|00C338| dw $4812, $48B0, $4800, $480B

;---------------------------------------------------------------------------------------------------

^.obj27EE
|00C340| dw $0890, $08BA, $08A9, $08B4
|00C348| dw $088C, $088E, $48B4, $088D
|00C350| dw $088F, $0891, $48BA, $48A9

;---------------------------------------------------------------------------------------------------

^.obj2806
|00C358| dw $0882, $0800, $0810, $0883
|00C360| dw $0801, $0811, $4883, $4801
|00C368| dw $4811, $4882, $4800, $4810

;---------------------------------------------------------------------------------------------------

^.obj281E
|00C370| dw $0890, $0896, $08A2, $0891
|00C378| dw $088C, $088E, $0890, $088D
|00C380| dw $088F, $0891, $0897, $08A3

;---------------------------------------------------------------------------------------------------

^.obj2836
|00C388| dw $0882, $0824, $0834, $0883
|00C390| dw $0825, $0835, $4883, $4825
|00C398| dw $4835, $4882, $4824, $4834

;---------------------------------------------------------------------------------------------------

^.obj284E
|00C3A0| dw $2888, $0808, $0818, $2889
|00C3A8| dw $09EF, $0878, $6889, $09EF
|00C3B0| dw $4878, $6888, $4808, $4818

;---------------------------------------------------------------------------------------------------

^.obj2866
|00C3B8| dw $282C, $0808, $080D, $282D
|00C3C0| dw $09EF, $0878, $682D, $09EF
|00C3C8| dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

^.obj287E
|00C3D0| dw $08B0, $0800, $080B, $08B1
|00C3D8| dw $0801, $0811, $48B1, $4801
|00C3E0| dw $4811, $48B0, $4800, $480B

;---------------------------------------------------------------------------------------------------

^.obj2896
|00C3E8| dw $08B0, $0824, $080C, $08B1
|00C3F0| dw $0825, $0835, $48B1, $4825
|00C3F8| dw $4835, $48B0, $4824, $480C

;---------------------------------------------------------------------------------------------------

^.obj28AE
|00C400| dw $282C, $0808, $080D, $282D
|00C408| dw $09EF, $0878, $682D, $09EF
|00C410| dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

^.obj28C6
|00C418| dw $08B0, $0824, $080C, $08B1
|00C420| dw $0825, $0835, $48B1, $4825
|00C428| dw $4835, $48B0, $4824, $480C

;---------------------------------------------------------------------------------------------------

^.obj28DE
|00C430| dw $282C, $0808, $080D, $282D
|00C438| dw $09EF, $0878, $682D, $09EF
|00C440| dw $4878, $682C, $4808, $480D

;---------------------------------------------------------------------------------------------------

^.obj28F6
|00C448| dw $2882, $0808, $0818, $2883
|00C450| dw $09EF, $0878, $6883, $09EF
|00C458| dw $4878, $6882, $4808, $4818

;---------------------------------------------------------------------------------------------------

^.obj290E
|00C460| dw $2886, $0877, $0875, $2887
|00C468| dw $09EF, $0859, $6887, $09EF
|00C470| dw $4859, $6886, $4877, $4875

;---------------------------------------------------------------------------------------------------

^.obj2926
|00C478| dw $0872, $0872, $0872, $0873
|00C480| dw $0874, $0875, $0876, $0876
|00C488| dw $0876, $0876, $0876, $0876
|00C490| dw $085B, $4876, $4876, $4876
|00C498| dw $4876, $4876, $4876, $4872
|00C4A0| dw $4872, $4872, $4873, $4874
|00C4A8| dw $4875

;---------------------------------------------------------------------------------------------------

^.obj2958
|00C4AA| dw $296E, $115E, $1178, $1158
|00C4B2| dw $696E, $09EF, $0878, $1174
|00C4BA| dw $296E, $49EF, $4878, $5174
|00C4C2| dw $696E, $515E, $5178, $5158

;---------------------------------------------------------------------------------------------------

^.obj2978
|00C4CA| dw $28B0, $0808, $080D, $28B1
|00C4D2| dw $09EF, $0878, $68B1, $09EF
|00C4DA| dw $4878, $68B0, $4808, $480D

;---------------------------------------------------------------------------------------------------

^.obj2990
|00C4E2| dw $28B8, $2808, $0818, $289D
|00C4EA| dw $082E, $083E, $689D, $082F
|00C4F2| dw $083F, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

^.obj29A8
|00C4FA| dw $28B8, $2808, $0818, $28B9
|00C502| dw $09EF, $0819, $68B9, $09EF
|00C50A| dw $081A, $68B8, $6808, $4818

;---------------------------------------------------------------------------------------------------

^.obj29C0
|00C512| dw $28B5, $2808, $080D, $28B7
|00C51A| dw $082E, $083E, $68B7, $082F
|00C522| dw $083F, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

^.obj29D8
|00C52A| dw $28B5, $2808, $080D, $28B6
|00C532| dw $09EF, $0819, $68B6, $09EF
|00C53A| dw $081A, $68B5, $6808, $480D

;---------------------------------------------------------------------------------------------------

^.obj29F0
|00C542| dw $8818, $8808, $A888, $8878
|00C54A| dw $09EF, $A889, $8878, $09EF
|00C552| dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

^.obj2A08
|00C55A| dw $880D, $8808, $A82C, $8878
|00C562| dw $09EF, $A82D, $C878, $09EF
|00C56A| dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

^.obj2A20
|00C572| dw $8818, $8808, $A888, $8878
|00C57A| dw $09EF, $A889, $8878, $09EF
|00C582| dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

^.obj2A38
|00C58A| dw $8834, $8824, $8882, $8835
|00C592| dw $8825, $8883, $C835, $C825
|00C59A| dw $C883, $C834, $C824, $C882

;---------------------------------------------------------------------------------------------------

^.obj2A50
|00C5A2| dw $88A2, $8896, $8890, $88A3
|00C5AA| dw $8897, $8891, $88A2, $8896
|00C5B2| dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

^.obj2A68
|00C5BA| dw $8810, $8800, $8882, $8812
|00C5C2| dw $8802, $8883, $C812, $C802
|00C5CA| dw $C883, $C810, $C800, $C882

;---------------------------------------------------------------------------------------------------

^.obj2A80
|00C5D2| dw $8818, $8808, $A888, $8878
|00C5DA| dw $09EF, $A889, $8878, $09EF
|00C5E2| dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

^.obj2A98
|00C5EA| dw $88A9, $88BA, $8890, $888E
|00C5F2| dw $888C, $88B4, $888F, $888D
|00C5FA| dw $C8B4, $C8A9, $C8BA, $8891

;---------------------------------------------------------------------------------------------------

^.obj2AB0
|00C602| dw $88A2, $8896, $8890, $888E
|00C60A| dw $888C, $8891, $888F, $888D
|00C612| dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

^.obj2AC8
|00C61A| dw $8810, $8800, $8882, $8811
|00C622| dw $8801, $8883, $C811, $C801
|00C62A| dw $C883, $C810, $C800, $C882

;---------------------------------------------------------------------------------------------------

^.obj2AE0
|00C632| dw $88A2, $8896, $8890, $888E
|00C63A| dw $888C, $8891, $888F, $888D
|00C642| dw $8890, $88A3, $8897, $8891

;---------------------------------------------------------------------------------------------------

^.obj2AF8
|00C64A| dw $8818, $8808, $A888, $8878
|00C652| dw $09EF, $A889, $8878, $09EF
|00C65A| dw $E889, $C818, $C808, $E888

;---------------------------------------------------------------------------------------------------

^.obj2B10
|00C662| dw $8834, $8824, $8882, $8835
|00C66A| dw $8825, $8883, $C835, $C825
|00C672| dw $C883, $C834, $C824, $C882

;---------------------------------------------------------------------------------------------------

^.obj2B28
|00C67A| dw $880D, $8808, $A82C, $8878
|00C682| dw $09EF, $A82D, $C878, $09EF
|00C68A| dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

^.obj2B40
|00C692| dw $880B, $8800, $88B0, $8811
|00C69A| dw $8801, $88B1, $C811, $C801
|00C6A2| dw $C8B1, $C80B, $C800, $C8B0

;---------------------------------------------------------------------------------------------------

^.obj2B58
|00C6AA| dw $880C, $8824, $88B0, $8835
|00C6B2| dw $8825, $88B1, $C835, $C825
|00C6BA| dw $C8B1, $C80C, $C824, $C8B0

;---------------------------------------------------------------------------------------------------

^.obj2B70
|00C6C2| dw $880D, $8808, $A82C, $8878
|00C6CA| dw $09EF, $A82D, $C878, $09EF
|00C6D2| dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

^.obj2B88
|00C6DA| dw $880D, $8808, $A82C, $8878
|00C6E2| dw $09EF, $A82D, $C878, $09EF
|00C6EA| dw $E82D, $C80D, $C808, $E82C

;---------------------------------------------------------------------------------------------------

^.obj2BA0
|00C6F2| dw $880C, $8824, $88B0, $8835
|00C6FA| dw $8825, $88B1, $C835, $C825
|00C702| dw $C8B1, $C80C, $C824, $C8B0

;---------------------------------------------------------------------------------------------------

^.obj2BB8
|00C70A| dw $8818, $8808, $A882, $8878
|00C712| dw $09EF, $A883, $C878, $09EF
|00C71A| dw $E883, $C818, $C808, $E882

;---------------------------------------------------------------------------------------------------

^.obj2BD0
|00C722| dw $8875, $8877, $A886, $8859
|00C72A| dw $09EF, $A887, $C859, $09EF
|00C732| dw $E887, $C875, $C877, $E886

;---------------------------------------------------------------------------------------------------

^.obj2BE8
|00C73A| dw $8875, $8874, $8873, $8872
|00C742| dw $8872, $8872, $8876, $8876
|00C74A| dw $8876, $8876, $8876, $8876
|00C752| dw $085B, $C876, $C876, $C876
|00C75A| dw $C876, $C876, $C876, $C875
|00C762| dw $C874, $C873, $C872, $C872
|00C76A| dw $C872

;---------------------------------------------------------------------------------------------------

^.obj2C1A
|00C76C| dw $9158, $9178, $915E, $A96E
|00C774| dw $9174, $8878, $89EF, $E96E
|00C77C| dw $D174, $C878, $C9EF, $A96E
|00C784| dw $D158, $D178, $D15E, $E96E

;---------------------------------------------------------------------------------------------------

^.obj2C3A
|00C78C| dw $880D, $8808, $A8B0, $8878
|00C794| dw $09EF, $A8B1, $C878, $09EF
|00C79C| dw $E8B1, $C80D, $C808, $E8B0

;---------------------------------------------------------------------------------------------------

^.obj2C52
|00C7A4| dw $0960, $296E, $295E, $14C9
|00C7AC| dw $14D9, $294E, $54C9, $54D9
|00C7B4| dw $694E, $4960, $696E, $695E

;---------------------------------------------------------------------------------------------------

^.obj2C6A
|00C7BC| dw $288A, $288B, $A88B, $A88A
|00C7C4| dw $0809, $09EF, $09EF, $8809
|00C7CC| dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

^.obj2C82
|00C7D4| dw $283C, $283D, $A83D, $A83C
|00C7DC| dw $0809, $09EF, $09EF, $8809
|00C7E4| dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

^.obj2C9A
|00C7EC| dw $288A, $288B, $A88B, $A88A
|00C7F4| dw $0809, $09EF, $09EF, $8809
|00C7FC| dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

^.obj2CB2
|00C804| dw $0884, $0885, $8885, $8884
|00C80C| dw $0826, $0836, $8836, $8826
|00C814| dw $0827, $0837, $8837, $8827

;---------------------------------------------------------------------------------------------------

^.obj2CCA
|00C81C| dw $0892, $0893, $0892, $0893
|00C824| dw $0898, $0899, $0898, $0899
|00C82C| dw $082D, $083D, $082D, $083D

;---------------------------------------------------------------------------------------------------

^.obj2CE2
|00C834| dw $0884, $0885, $8885, $8884
|00C83C| dw $0803, $0805, $8805, $8803
|00C844| dw $0804, $0806, $8806, $8804

;---------------------------------------------------------------------------------------------------

^.obj2CFA
|00C84C| dw $0892, $08A8, $88A8, $0893
|00C854| dw $08BB, $08BC, $08BD, $88BB
|00C85C| dw $08AA, $08BE, $08BF, $88AA

;---------------------------------------------------------------------------------------------------

^.obj2D12
|00C864| dw $0884, $0885, $8885, $8884
|00C86C| dw $0803, $0813, $8813, $8803
|00C874| dw $0804, $0814, $8814, $8804

;---------------------------------------------------------------------------------------------------

^.obj2D2A
|00C87C| dw $0892, $0893, $0892, $0893
|00C884| dw $0898, $08BC, $08BD, $0899
|00C88C| dw $08A4, $08BE, $08BF, $08A5

;---------------------------------------------------------------------------------------------------

^.obj2D42
|00C894| dw $0884, $0885, $8885, $8884
|00C89C| dw $0826, $0836, $8836, $8826
|00C8A4| dw $0827, $0837, $8837, $8827

;---------------------------------------------------------------------------------------------------

^.obj2D5A
|00C8AC| dw $288A, $288B, $A88B, $A88A
|00C8B4| dw $0809, $09EF, $09EF, $8809
|00C8BC| dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

^.obj2D72
|00C8C4| dw $283C, $283D, $A83D, $A83C
|00C8CC| dw $0809, $09EF, $09EF, $8809
|00C8D4| dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

^.obj2D8A
|00C8DC| dw $08B2, $08B3, $88B3, $88B2
|00C8E4| dw $0803, $0813, $8813, $8803
|00C8EC| dw $081B, $0814, $8814, $881B

;---------------------------------------------------------------------------------------------------

^.obj2DA2
|00C8F4| dw $08B2, $08B3, $88B3, $88B2
|00C8FC| dw $0826, $0836, $8836, $8826
|00C904| dw $081C, $0837, $8837, $881C

;---------------------------------------------------------------------------------------------------

^.obj2DBA
|00C90C| dw $283C, $283D, $A83D, $A83C
|00C914| dw $0809, $09EF, $09EF, $8809
|00C91C| dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

^.obj2DD2
|00C924| dw $08B2, $08B3, $88B3, $88B2
|00C92C| dw $0826, $0836, $8836, $8826
|00C934| dw $081C, $0837, $8837, $881C

;---------------------------------------------------------------------------------------------------

^.obj2DEA
|00C93C| dw $283C, $283D, $A83D, $A83C
|00C944| dw $0809, $09EF, $09EF, $8809
|00C94C| dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

^.obj2E02
|00C954| dw $2884, $2885, $A885, $A884
|00C95C| dw $0809, $09EF, $09EF, $8809
|00C964| dw $080A, $0879, $8879, $880A

;---------------------------------------------------------------------------------------------------

^.obj2E1A
|00C96C| dw $28A0, $28A1, $A8A1, $A8A0
|00C974| dw $0867, $09EF, $09EF, $8867
|00C97C| dw $0865, $085A, $885A, $8865

;---------------------------------------------------------------------------------------------------

^.obj2E32
|00C984| dw $297E, $A97E, $297E, $A97E
|00C98C| dw $11AC, $09EF, $89EF, $91AC
|00C994| dw $1179, $0879, $8879, $9179
|00C99C| dw $1157, $1175, $9175, $9157

;---------------------------------------------------------------------------------------------------

^.obj2E52
|00C9A4| dw $28B2, $28B3, $A8B3, $A8B2
|00C9AC| dw $0809, $09EF, $09EF, $8809
|00C9B4| dw $081D, $0879, $8879, $881D

;---------------------------------------------------------------------------------------------------

^.obj2E6A
|00C9BC| dw $480A, $4879, $C879, $C80A
|00C9C4| dw $4809, $09EF, $09EF, $C809
|00C9CC| dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

^.obj2E82
|00C9D4| dw $481D, $4879, $C879, $C81D
|00C9DC| dw $4809, $09EF, $09EF, $C809
|00C9E4| dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

^.obj2E9A
|00C9EC| dw $480A, $4879, $C879, $C80A
|00C9F4| dw $4809, $09EF, $09EF, $C809
|00C9FC| dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

^.obj2EB2
|00CA04| dw $4827, $4837, $C837, $C827
|00CA0C| dw $4826, $4836, $C836, $C826
|00CA14| dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

^.obj2ECA
|00CA1C| dw $482D, $483D, $482D, $483D
|00CA24| dw $4898, $4899, $4898, $4899
|00CA2C| dw $4892, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

^.obj2EE2
|00CA34| dw $4804, $4806, $C806, $C804
|00CA3C| dw $4803, $4805, $C805, $C803
|00CA44| dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

^.obj2EFA
|00CA4C| dw $48AA, $48BE, $48BF, $C8AA
|00CA54| dw $48BB, $48BC, $48BD, $C8BB
|00CA5C| dw $4892, $48A8, $C8A8, $4893

;---------------------------------------------------------------------------------------------------

^.obj2F12
|00CA64| dw $4804, $4814, $C814, $C804
|00CA6C| dw $4803, $4813, $C813, $C803
|00CA74| dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

^.obj2F2A
|00CA7C| dw $48A4, $48BE, $48BF, $48A5
|00CA84| dw $4898, $48BC, $48BD, $4899
|00CA8C| dw $4892, $4893, $4892, $4893

;---------------------------------------------------------------------------------------------------

^.obj2F42
|00CA94| dw $480A, $4879, $C879, $C80A
|00CA9C| dw $4809, $09EF, $09EF, $C809
|00CAA4| dw $688A, $688B, $E88B, $E88A

;---------------------------------------------------------------------------------------------------

^.obj2F5A
|00CAAC| dw $4827, $4837, $C837, $C827
|00CAB4| dw $4826, $4836, $C836, $C826
|00CABC| dw $4884, $4885, $C885, $C884

;---------------------------------------------------------------------------------------------------

^.obj2F72
|00CAC4| dw $481D, $4879, $C879, $C81D
|00CACC| dw $4809, $09EF, $09EF, $C809
|00CAD4| dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

^.obj2F8A
|00CADC| dw $481B, $4814, $C814, $C81B
|00CAE4| dw $4803, $4813, $C813, $C803
|00CAEC| dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

^.obj2FA2
|00CAF4| dw $481C, $4837, $C837, $C81C
|00CAFC| dw $4826, $4836, $C836, $C826
|00CB04| dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

^.obj2FBA
|00CB0C| dw $481D, $4879, $C879, $C81D
|00CB14| dw $4809, $09EF, $09EF, $C809
|00CB1C| dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

^.obj2FD2
|00CB24| dw $481D, $4879, $C879, $C81D
|00CB2C| dw $4809, $09EF, $09EF, $C809
|00CB34| dw $683C, $683D, $E83D, $E83C

;---------------------------------------------------------------------------------------------------

^.obj2FEA
|00CB3C| dw $481C, $4837, $C837, $C81C
|00CB44| dw $4826, $4836, $C836, $C826
|00CB4C| dw $48B2, $48B3, $C8B3, $C8B2

;---------------------------------------------------------------------------------------------------

^.obj3002
|00CB54| dw $480A, $4879, $C879, $C80A
|00CB5C| dw $4809, $09EF, $09EF, $C809
|00CB64| dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

^.obj301A
|00CB6C| dw $4865, $485A, $C85A, $C865
|00CB74| dw $4867, $09EF, $09EF, $C867
|00CB7C| dw $68A0, $68A1, $E8A1, $E8A0

;---------------------------------------------------------------------------------------------------

^.obj3032
|00CB84| dw $5157, $5175, $D175, $D157
|00CB8C| dw $5179, $4879, $C879, $D179
|00CB94| dw $51AC, $49EF, $C9EF, $D1AC
|00CB9C| dw $697E, $E97E, $697E, $E97E

;---------------------------------------------------------------------------------------------------

^.obj3052
|00CBA4| dw $481D, $4879, $C879, $C81D
|00CBAC| dw $4809, $09EF, $09EF, $C809
|00CBB4| dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

^.obj306A
|00CBBC| dw $2882, $0820, $0830, $2883
|00CBC4| dw $0821, $0831, $6883, $4821
|00CBCC| dw $4831, $6882, $4820, $4830

;---------------------------------------------------------------------------------------------------

^.obj3082
|00CBD4| dw $2882, $0828, $0838, $2883
|00CBDC| dw $0829, $0839, $6883, $4829
|00CBE4| dw $4839, $6882, $4828, $4838

;---------------------------------------------------------------------------------------------------

^.obj309A
|00CBEC| dw $28B0, $0820, $080E, $28B1
|00CBF4| dw $0821, $0831, $68B1, $4821
|00CBFC| dw $4831, $68B0, $4820, $480E

;---------------------------------------------------------------------------------------------------

^.obj30B2
|00CC04| dw $28B0, $0828, $080F, $28B1
|00CC0C| dw $0829, $0839, $68B1, $4829
|00CC14| dw $4839, $68B0, $4828, $480F

;---------------------------------------------------------------------------------------------------

^.obj30CA
|00CC1C| dw $8830, $8820, $A882, $8831
|00CC24| dw $8821, $A883, $C831, $C821
|00CC2C| dw $E883, $C830, $C820, $E882

;---------------------------------------------------------------------------------------------------

^.obj30E2
|00CC34| dw $8838, $8828, $A882, $8839
|00CC3C| dw $8829, $A883, $C839, $C829
|00CC44| dw $E883, $C838, $C828, $E882

;---------------------------------------------------------------------------------------------------

^.obj30FA
|00CC4C| dw $880E, $8820, $A8B0, $8831
|00CC54| dw $8821, $A8B1, $C831, $C821
|00CC5C| dw $E8B1, $C80E, $C820, $E8B0

;---------------------------------------------------------------------------------------------------

^.obj3112
|00CC64| dw $880F, $8828, $A8B0, $8839
|00CC6C| dw $8829, $A8B1, $C839, $C829
|00CC74| dw $E8B1, $C80F, $C828, $E8B0

;---------------------------------------------------------------------------------------------------

^.obj312A
|00CC7C| dw $2884, $2885, $A885, $A884
|00CC84| dw $0822, $0832, $8832, $8822
|00CC8C| dw $0823, $0833, $8833, $8823

;---------------------------------------------------------------------------------------------------

^.obj3142
|00CC94| dw $2884, $2885, $A885, $A884
|00CC9C| dw $082A, $083A, $883A, $882A
|00CCA4| dw $082B, $083B, $883B, $882B

;---------------------------------------------------------------------------------------------------

^.obj315A
|00CCAC| dw $28B2, $28B3, $A8B3, $A8B2
|00CCB4| dw $0822, $0832, $8832, $8822
|00CCBC| dw $081E, $0833, $8833, $881E

;---------------------------------------------------------------------------------------------------

^.obj3172
|00CCC4| dw $28B2, $28B3, $A8B3, $A8B2
|00CCCC| dw $082A, $083A, $883A, $882A
|00CCD4| dw $081F, $083B, $883B, $881F

;---------------------------------------------------------------------------------------------------

^.obj318A
|00CCDC| dw $4823, $4833, $C833, $C823
|00CCE4| dw $4822, $4832, $C832, $C822
|00CCEC| dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

^.obj31A2
|00CCF4| dw $482B, $483B, $C83B, $C82B
|00CCFC| dw $482A, $483A, $C83A, $C82A
|00CD04| dw $6884, $6885, $E885, $E884

;---------------------------------------------------------------------------------------------------

^.obj31BA
|00CD0C| dw $481E, $4833, $C833, $C81E
|00CD14| dw $4822, $4832, $C832, $C822
|00CD1C| dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

^.obj31D2
|00CD24| dw $481F, $483B, $C83B, $C81F
|00CD2C| dw $482A, $483A, $C83A, $C82A
|00CD34| dw $68B2, $68B3, $E8B3, $E8B2

;---------------------------------------------------------------------------------------------------

^.obj31EA
|00CD3C| dw $8875, $8874, $8873, $8872
|00CD44| dw $8872, $8872, $0872, $8872
|00CD4C| dw $8872, $0873, $0874, $0875
|00CD54| dw $8876, $8876, $8876, $8876
|00CD5C| dw $8876, $0876, $0876, $0876
|00CD64| dw $0876, $0876, $0876, $0876
|00CD6C| dw $085B, $C876, $C876, $C876
|00CD74| dw $C876, $C876, $4876, $4876
|00CD7C| dw $4876, $4876, $4876, $4876
|00CD84| dw $4876, $C875, $C874, $C873
|00CD8C| dw $C872, $C872, $C872, $4872
|00CD94| dw $4872, $4872, $4873, $4874
|00CD9C| dw $4875

;===================================================================================================

DoorGFXDataOffset_North:
|00CD9E| dw RoomDrawObjectData.obj2716 ; 0x00 - Normal door
|00CDA0| dw RoomDrawObjectData.obj272E ; 0x02 - Normal door (lower layer)
|00CDA2| dw RoomDrawObjectData.obj272E ; 0x04 - Exit (lower layer)
|00CDA4| dw RoomDrawObjectData.obj2746 ; 0x06 - Unused cave exit (lower layer)
|00CDA6| dw RoomDrawObjectData.obj2746 ; 0x08 - Waterfall door
|00CDA8| dw RoomDrawObjectData.obj2746 ; 0x0A - Fancy dungeon exit
|00CDAA| dw RoomDrawObjectData.obj2746 ; 0x0C - Fancy dungeon exit (lower layer)
|00CDAC| dw RoomDrawObjectData.obj2746 ; 0x0E - Cave exit
|00CDAE| dw RoomDrawObjectData.obj2746 ; 0x10 - Lit cave exit (lower layer)
|00CDB0| dw RoomDrawObjectData.obj275E ; 0x12 - Exit marker
|00CDB2| dw RoomDrawObjectData.obj275E ; 0x14 - Dungeon swap marker
|00CDB4| dw RoomDrawObjectData.obj275E ; 0x16 - Layer swap marker
|00CDB6| dw RoomDrawObjectData.obj275E ; 0x18 - Double sided shutter door
|00CDB8| dw RoomDrawObjectData.obj2776 ; 0x1A - Eye watch door
|00CDBA| dw RoomDrawObjectData.obj278E ; 0x1C - Small key door
|00CDBC| dw RoomDrawObjectData.obj27A6 ; 0x1E - Big key door
|00CDBE| dw RoomDrawObjectData.obj27BE ; 0x20 - Small key stairs (upwards)
|00CDC0| dw RoomDrawObjectData.obj27BE ; 0x22 - Small key stairs (downwards)
|00CDC2| dw RoomDrawObjectData.obj27D6 ; 0x24 - Small key stairs (lower layer; upwards)
|00CDC4| dw RoomDrawObjectData.obj27D6 ; 0x26 - Small key stairs (lower layer; downwards)
|00CDC6| dw RoomDrawObjectData.obj27EE ; 0x28 - Dash wall
|00CDC8| dw RoomDrawObjectData.obj2806 ; 0x2A - Bombable cave exit
|00CDCA| dw RoomDrawObjectData.obj2806 ; 0x2C - Unopenable, double-sided big key door
|00CDCC| dw RoomDrawObjectData.obj281E ; 0x2E - Bombable door
|00CDCE| dw RoomDrawObjectData.obj2836 ; 0x30 - Exploding wall
|00CDD0| dw RoomDrawObjectData.obj2836 ; 0x32 - Curtain door
|00CDD2| dw RoomDrawObjectData.obj2836 ; 0x34 - Unusable bottom-sided shutter door
|00CDD4| dw RoomDrawObjectData.obj2836 ; 0x36 - Bottom-sided shutter door
|00CDD6| dw RoomDrawObjectData.obj284E ; 0x38 - Top-sided shutter door
|00CDD8| dw RoomDrawObjectData.obj2866 ; 0x3A - Unusable normal door (lower layer)
|00CDDA| dw RoomDrawObjectData.obj2866 ; 0x3C - Unusable normal door (lower layer)
|00CDDC| dw RoomDrawObjectData.obj2866 ; 0x3E - Unusable normal door (lower layer)
|00CDDE| dw RoomDrawObjectData.obj2866 ; 0x40 - Normal door (lower layer; used with one-sided shutters)
|00CDE0| dw RoomDrawObjectData.obj287E ; 0x42 - Unused double-sided shutter
|00CDE2| dw RoomDrawObjectData.obj2896 ; 0x44 - Double-sided shutter (lower layer)
|00CDE4| dw RoomDrawObjectData.obj28AE ; 0x46 - Explicit room door
|00CDE6| dw RoomDrawObjectData.obj28C6 ; 0x48 - Bottom-sided shutter door (lower layer)
|00CDE8| dw RoomDrawObjectData.obj28DE ; 0x4A - Top-sided shutter door (lower layer)
|00CDEA| dw RoomDrawObjectData.obj28F6 ; 0x4C - Unusable normal door (lower layer)
|00CDEC| dw RoomDrawObjectData.obj28F6 ; 0x4E - Unusable normal door (lower layer)
|00CDEE| dw RoomDrawObjectData.obj28F6 ; 0x50 - Unusable normal door (lower layer)
|00CDF0| dw RoomDrawObjectData.obj290E ; 0x52 - Unusable bombed-open door (lower layer)
|00CDF2| dw RoomDrawObjectData.obj2926 ; 0x54 - Unusable glitchy door (lower layer)
|00CDF4| dw RoomDrawObjectData.obj2958 ; 0x56 - Unusable glitchy door (lower layer)
|00CDF6| dw RoomDrawObjectData.obj2978 ; 0x58 - Unusable normal door (lower layer)
|00CDF8| dw RoomDrawObjectData.obj2990 ; 0x5A - Unusable glitchy/stairs up (lower layer)
|00CDFA| dw RoomDrawObjectData.obj2990 ; 0x5C - Unusable glitchy/stairs up (lower layer)
|00CDFC| dw RoomDrawObjectData.obj2990 ; 0x5E - Unusable glitchy/stairs up (lower layer)
|00CDFE| dw RoomDrawObjectData.obj2990 ; 0x60 - Unusable glitchy/stairs up (lower layer)
|00CE00| dw RoomDrawObjectData.obj29A8 ; 0x62 - Unusable glitchy/stairs down (lower layer)
|00CE02| dw RoomDrawObjectData.obj29C0 ; 0x64 - Unusable glitchy/stairs up (lower layer)
|00CE04| dw RoomDrawObjectData.obj29D8 ; 0x66 - Unusable glitchy/stairs down (lower layer)

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_South:
|00CE06| dw RoomDrawObjectData.obj29F0
|00CE08| dw RoomDrawObjectData.obj2A08
|00CE0A| dw RoomDrawObjectData.obj2A08
|00CE0C| dw RoomDrawObjectData.obj2A20
|00CE0E| dw RoomDrawObjectData.obj2A20
|00CE10| dw RoomDrawObjectData.obj2A20
|00CE12| dw RoomDrawObjectData.obj2A20
|00CE14| dw RoomDrawObjectData.obj2A20
|00CE16| dw RoomDrawObjectData.obj2A20
|00CE18| dw RoomDrawObjectData.obj2A38
|00CE1A| dw RoomDrawObjectData.obj2A38
|00CE1C| dw RoomDrawObjectData.obj2A38
|00CE1E| dw RoomDrawObjectData.obj2A38
|00CE20| dw RoomDrawObjectData.obj2A50
|00CE22| dw RoomDrawObjectData.obj2A68
|00CE24| dw RoomDrawObjectData.obj2A80
|00CE26| dw RoomDrawObjectData.obj2A98
|00CE28| dw RoomDrawObjectData.obj2A98
|00CE2A| dw RoomDrawObjectData.obj2A98
|00CE2C| dw RoomDrawObjectData.obj2A98
|00CE2E| dw RoomDrawObjectData.obj2A98
|00CE30| dw RoomDrawObjectData.obj2AB0
|00CE32| dw RoomDrawObjectData.obj2AC8
|00CE34| dw RoomDrawObjectData.obj2AE0
|00CE36| dw RoomDrawObjectData.obj2AF8
|00CE38| dw RoomDrawObjectData.obj2AF8
|00CE3A| dw RoomDrawObjectData.obj2AF8
|00CE3C| dw RoomDrawObjectData.obj2AF8
|00CE3E| dw RoomDrawObjectData.obj2B10
|00CE40| dw RoomDrawObjectData.obj2B28
|00CE42| dw RoomDrawObjectData.obj2B28
|00CE44| dw RoomDrawObjectData.obj2B28
|00CE46| dw RoomDrawObjectData.obj2B28
|00CE48| dw RoomDrawObjectData.obj2B40
|00CE4A| dw RoomDrawObjectData.obj2B58
|00CE4C| dw RoomDrawObjectData.obj2B70
|00CE4E| dw RoomDrawObjectData.obj2B88
|00CE50| dw RoomDrawObjectData.obj2BA0
|00CE52| dw RoomDrawObjectData.obj2BB8
|00CE54| dw RoomDrawObjectData.obj2BB8
|00CE56| dw RoomDrawObjectData.obj2BB8
|00CE58| dw RoomDrawObjectData.obj2BD0
|00CE5A| dw RoomDrawObjectData.obj2BE8
|00CE5C| dw RoomDrawObjectData.obj2C1A
|00CE5E| dw RoomDrawObjectData.obj2C3A
|00CE60| dw RoomDrawObjectData.obj2C52
|00CE62| dw RoomDrawObjectData.obj2C6A
|00CE64| dw RoomDrawObjectData.obj2C6A

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_West:
|00CE66| dw RoomDrawObjectData.obj2C6A
|00CE68| dw RoomDrawObjectData.obj2C82
|00CE6A| dw RoomDrawObjectData.obj2C82
|00CE6C| dw RoomDrawObjectData.obj2C9A
|00CE6E| dw RoomDrawObjectData.obj2C9A
|00CE70| dw RoomDrawObjectData.obj2C9A
|00CE72| dw RoomDrawObjectData.obj2C9A
|00CE74| dw RoomDrawObjectData.obj2C9A
|00CE76| dw RoomDrawObjectData.obj2C9A
|00CE78| dw RoomDrawObjectData.obj2CB2
|00CE7A| dw RoomDrawObjectData.obj2CB2
|00CE7C| dw RoomDrawObjectData.obj2CB2
|00CE7E| dw RoomDrawObjectData.obj2CB2
|00CE80| dw RoomDrawObjectData.obj2CCA
|00CE82| dw RoomDrawObjectData.obj2CE2
|00CE84| dw RoomDrawObjectData.obj2CFA
|00CE86| dw RoomDrawObjectData.obj2CFA
|00CE88| dw RoomDrawObjectData.obj2CFA
|00CE8A| dw RoomDrawObjectData.obj2CFA
|00CE8C| dw RoomDrawObjectData.obj2CFA
|00CE8E| dw RoomDrawObjectData.obj2CFA
|00CE90| dw RoomDrawObjectData.obj2D12
|00CE92| dw RoomDrawObjectData.obj2D12
|00CE94| dw RoomDrawObjectData.obj2D2A
|00CE96| dw RoomDrawObjectData.obj2D42
|00CE98| dw RoomDrawObjectData.obj2D42
|00CE9A| dw RoomDrawObjectData.obj2D42
|00CE9C| dw RoomDrawObjectData.obj2D42
|00CE9E| dw RoomDrawObjectData.obj2D5A
|00CEA0| dw RoomDrawObjectData.obj2D72
|00CEA2| dw RoomDrawObjectData.obj2D72
|00CEA4| dw RoomDrawObjectData.obj2D72
|00CEA6| dw RoomDrawObjectData.obj2D72
|00CEA8| dw RoomDrawObjectData.obj2D8A
|00CEAA| dw RoomDrawObjectData.obj2DA2
|00CEAC| dw RoomDrawObjectData.obj2DBA
|00CEAE| dw RoomDrawObjectData.obj2DD2
|00CEB0| dw RoomDrawObjectData.obj2DEA
|00CEB2| dw RoomDrawObjectData.obj2E02
|00CEB4| dw RoomDrawObjectData.obj2E02
|00CEB6| dw RoomDrawObjectData.obj2E02
|00CEB8| dw RoomDrawObjectData.obj2E1A
|00CEBA| dw RoomDrawObjectData.obj2E32
|00CEBC| dw RoomDrawObjectData.obj2E32
|00CEBE| dw RoomDrawObjectData.obj2E52
|00CEC0| dw RoomDrawObjectData.obj2E6A
|00CEC2| dw RoomDrawObjectData.obj2E6A
|00CEC4| dw RoomDrawObjectData.obj2E6A

;---------------------------------------------------------------------------------------------------

DoorGFXDataOffset_East:
|00CEC6| dw RoomDrawObjectData.obj2E6A
|00CEC8| dw RoomDrawObjectData.obj2E82
|00CECA| dw RoomDrawObjectData.obj2E82
|00CECC| dw RoomDrawObjectData.obj2E9A
|00CECE| dw RoomDrawObjectData.obj2E9A
|00CED0| dw RoomDrawObjectData.obj2E9A
|00CED2| dw RoomDrawObjectData.obj2E9A
|00CED4| dw RoomDrawObjectData.obj2E9A
|00CED6| dw RoomDrawObjectData.obj2E9A
|00CED8| dw RoomDrawObjectData.obj2EB2
|00CEDA| dw RoomDrawObjectData.obj2EB2
|00CEDC| dw RoomDrawObjectData.obj2EB2
|00CEDE| dw RoomDrawObjectData.obj2EB2
|00CEE0| dw RoomDrawObjectData.obj2ECA
|00CEE2| dw RoomDrawObjectData.obj2EE2
|00CEE4| dw RoomDrawObjectData.obj2EFA
|00CEE6| dw RoomDrawObjectData.obj2EFA
|00CEE8| dw RoomDrawObjectData.obj2EFA
|00CEEA| dw RoomDrawObjectData.obj2EFA
|00CEEC| dw RoomDrawObjectData.obj2EFA
|00CEEE| dw RoomDrawObjectData.obj2EFA
|00CEF0| dw RoomDrawObjectData.obj2F12
|00CEF2| dw RoomDrawObjectData.obj2F12
|00CEF4| dw RoomDrawObjectData.obj2F2A
|00CEF6| dw RoomDrawObjectData.obj2F42
|00CEF8| dw RoomDrawObjectData.obj2F42
|00CEFA| dw RoomDrawObjectData.obj2F42
|00CEFC| dw RoomDrawObjectData.obj2F42
|00CEFE| dw RoomDrawObjectData.obj2F5A
|00CF00| dw RoomDrawObjectData.obj2F72
|00CF02| dw RoomDrawObjectData.obj2F72
|00CF04| dw RoomDrawObjectData.obj2F72
|00CF06| dw RoomDrawObjectData.obj2F72
|00CF08| dw RoomDrawObjectData.obj2F8A
|00CF0A| dw RoomDrawObjectData.obj2FA2
|00CF0C| dw RoomDrawObjectData.obj2FBA
|00CF0E| dw RoomDrawObjectData.obj2FD2
|00CF10| dw RoomDrawObjectData.obj2FEA
|00CF12| dw RoomDrawObjectData.obj3002
|00CF14| dw RoomDrawObjectData.obj3002
|00CF16| dw RoomDrawObjectData.obj3002
|00CF18| dw RoomDrawObjectData.obj301A
|00CF1A| dw RoomDrawObjectData.obj3032
|00CF1C| dw RoomDrawObjectData.obj3032
|00CF1E| dw RoomDrawObjectData.obj3052
|00CF20| dw RoomDrawObjectData.obj306A
|00CF22| dw RoomDrawObjectData.obj306A

;===================================================================================================

DoorAnimGFXDataOffset_North:
|00CF24| dw RoomDrawObjectData.obj306A ; Lower layer shutter
|00CF26| dw RoomDrawObjectData.obj306A ; Key doors
|00CF28| dw RoomDrawObjectData.obj3082 ; Shutters
|00CF2A| dw RoomDrawObjectData.obj309A ; Lower layer key door

DoorAnimGFXDataOffset_South:
|00CF2C| dw RoomDrawObjectData.obj30B2 ; Lower layer shutter
|00CF2E| dw RoomDrawObjectData.obj30CA ; Key doors
|00CF30| dw RoomDrawObjectData.obj30E2 ; Shutters
|00CF32| dw RoomDrawObjectData.obj30FA ; Lower layer key door

DoorAnimGFXDataOffset_West:
|00CF34| dw RoomDrawObjectData.obj3112 ; Lower layer shutter
|00CF36| dw RoomDrawObjectData.obj312A ; Key doors
|00CF38| dw RoomDrawObjectData.obj3142 ; Shutters
|00CF3A| dw RoomDrawObjectData.obj315A ; Lower layer key door

DoorAnimGFXDataOffset_East:
|00CF3C| dw RoomDrawObjectData.obj3172 ; Lower layer shutter
|00CF3E| dw RoomDrawObjectData.obj318A ; Key doors
|00CF40| dw RoomDrawObjectData.obj31A2 ; Shutters
|00CF42| dw RoomDrawObjectData.obj31BA ; Lower layer key door
|00CF44| dw RoomDrawObjectData.obj31D2 ; Unused cool looking shutter

;===================================================================================================
; FREE ROM: 0x3A
;===================================================================================================
NULL_00CF46:
|00CF46| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF4E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF56| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF5E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF66| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF6E| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF76| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00CF7E| db $FF, $FF

;===================================================================================================

GFXSheetPointers:

.background_bank
|00CF80| db ^GFX_00
|00CF81| db ^GFX_01
|00CF82| db ^GFX_02
|00CF83| db ^GFX_03
|00CF84| db ^GFX_04
|00CF85| db ^GFX_05
|00CF86| db ^GFX_06
|00CF87| db ^GFX_07
|00CF88| db ^GFX_08
|00CF89| db ^GFX_09
|00CF8A| db ^GFX_0A
|00CF8B| db ^GFX_0B
|00CF8C| db ^GFX_0C
|00CF8D| db ^GFX_0D
|00CF8E| db ^GFX_0E
|00CF8F| db ^GFX_0F
|00CF90| db ^GFX_10
|00CF91| db ^GFX_11
|00CF92| db ^GFX_12
|00CF93| db ^GFX_13
|00CF94| db ^GFX_14
|00CF95| db ^GFX_15
|00CF96| db ^GFX_16
|00CF97| db ^GFX_17
|00CF98| db ^GFX_18
|00CF99| db ^GFX_19
|00CF9A| db ^GFX_1A
|00CF9B| db ^GFX_1B
|00CF9C| db ^GFX_1C
|00CF9D| db ^GFX_1D
|00CF9E| db ^GFX_1E
|00CF9F| db ^GFX_1F
|00CFA0| db ^GFX_20
|00CFA1| db ^GFX_21
|00CFA2| db ^GFX_22
|00CFA3| db ^GFX_23
|00CFA4| db ^GFX_24
|00CFA5| db ^GFX_25
|00CFA6| db ^GFX_26
|00CFA7| db ^GFX_27
|00CFA8| db ^GFX_28
|00CFA9| db ^GFX_29
|00CFAA| db ^GFX_2A
|00CFAB| db ^GFX_2B
|00CFAC| db ^GFX_2C
|00CFAD| db ^GFX_2D
|00CFAE| db ^GFX_2E
|00CFAF| db ^GFX_2F
|00CFB0| db ^GFX_30
|00CFB1| db ^GFX_31
|00CFB2| db ^GFX_32
|00CFB3| db ^GFX_33
|00CFB4| db ^GFX_34
|00CFB5| db ^GFX_35
|00CFB6| db ^GFX_36
|00CFB7| db ^GFX_37
|00CFB8| db ^GFX_38
|00CFB9| db ^GFX_39
|00CFBA| db ^GFX_3A
|00CFBB| db ^GFX_3B
|00CFBC| db ^GFX_3C
|00CFBD| db ^GFX_3D
|00CFBE| db ^GFX_3E
|00CFBF| db ^GFX_3F
|00CFC0| db ^GFX_40
|00CFC1| db ^GFX_41
|00CFC2| db ^GFX_42
|00CFC3| db ^GFX_43
|00CFC4| db ^GFX_44
|00CFC5| db ^GFX_45
|00CFC6| db ^GFX_46
|00CFC7| db ^GFX_47
|00CFC8| db ^GFX_48
|00CFC9| db ^GFX_49
|00CFCA| db ^GFX_4A
|00CFCB| db ^GFX_4B
|00CFCC| db ^GFX_4C
|00CFCD| db ^GFX_4D
|00CFCE| db ^GFX_4E
|00CFCF| db ^GFX_4F
|00CFD0| db ^GFX_50
|00CFD1| db ^GFX_51
|00CFD2| db ^GFX_52
|00CFD3| db ^GFX_53
|00CFD4| db ^GFX_54
|00CFD5| db ^GFX_55
|00CFD6| db ^GFX_56
|00CFD7| db ^GFX_57
|00CFD8| db ^GFX_58
|00CFD9| db ^GFX_59
|00CFDA| db ^GFX_5A
|00CFDB| db ^GFX_5B
|00CFDC| db ^GFX_5C
|00CFDD| db ^GFX_5D
|00CFDE| db ^GFX_5E
|00CFDF| db ^GFX_5F
|00CFE0| db ^GFX_60
|00CFE1| db ^GFX_61
|00CFE2| db ^GFX_62
|00CFE3| db ^GFX_63
|00CFE4| db ^GFX_64
|00CFE5| db ^GFX_65
|00CFE6| db ^GFX_66
|00CFE7| db ^GFX_67
|00CFE8| db ^GFX_68
|00CFE9| db ^GFX_69
|00CFEA| db ^GFX_6A
|00CFEB| db ^GFX_6B
|00CFEC| db ^GFX_6C
|00CFED| db ^GFX_6D
|00CFEE| db ^GFX_6E
|00CFEF| db ^GFX_6F
|00CFF0| db ^GFX_70
|00CFF1| db ^GFX_DD
|00CFF2| db ^GFX_DE

;---------------------------------------------------------------------------------------------------

.sprite_bank
|00CFF3| db ^GFX_73 ; 0x00
|00CFF4| db ^GFX_74 ; 0x01
|00CFF5| db ^GFX_75 ; 0x02
|00CFF6| db ^GFX_76 ; 0x03
|00CFF7| db ^GFX_77 ; 0x04
|00CFF8| db ^GFX_78 ; 0x05
|00CFF9| db ^GFX_79 ; 0x06
|00CFFA| db ^GFX_7A ; 0x07
|00CFFB| db ^GFX_7B ; 0x08
|00CFFC| db ^GFX_7C ; 0x09
|00CFFD| db ^GFX_7D ; 0x0A
|00CFFE| db ^GFX_7E ; 0x0B
|00CFFF| db ^GFX_7F ; 0x0C
|00D000| db ^GFX_80 ; 0x0D
|00D001| db ^GFX_81 ; 0x0E
|00D002| db ^GFX_82 ; 0x0F
|00D003| db ^GFX_83 ; 0x10
|00D004| db ^GFX_84 ; 0x11
|00D005| db ^GFX_85 ; 0x12
|00D006| db ^GFX_86 ; 0x13
|00D007| db ^GFX_87 ; 0x14
|00D008| db ^GFX_88 ; 0x15
|00D009| db ^GFX_89 ; 0x16
|00D00A| db ^GFX_8A ; 0x17
|00D00B| db ^GFX_8B ; 0x18
|00D00C| db ^GFX_8C ; 0x19
|00D00D| db ^GFX_8D ; 0x1A
|00D00E| db ^GFX_8E ; 0x1B
|00D00F| db ^GFX_8F ; 0x1C
|00D010| db ^GFX_90 ; 0x1D
|00D011| db ^GFX_91 ; 0x1E
|00D012| db ^GFX_92 ; 0x1F
|00D013| db ^GFX_93 ; 0x20
|00D014| db ^GFX_94 ; 0x21
|00D015| db ^GFX_95 ; 0x22
|00D016| db ^GFX_96 ; 0x23
|00D017| db ^GFX_97 ; 0x24
|00D018| db ^GFX_98 ; 0x25
|00D019| db ^GFX_99 ; 0x26
|00D01A| db ^GFX_9A ; 0x27
|00D01B| db ^GFX_9B ; 0x28
|00D01C| db ^GFX_9C ; 0x29
|00D01D| db ^GFX_9D ; 0x2A
|00D01E| db ^GFX_9E ; 0x2B
|00D01F| db ^GFX_9F ; 0x2C
|00D020| db ^GFX_A0 ; 0x2D
|00D021| db ^GFX_A1 ; 0x2E
|00D022| db ^GFX_A2 ; 0x2F
|00D023| db ^GFX_A3 ; 0x30
|00D024| db ^GFX_A4 ; 0x31
|00D025| db ^GFX_A5 ; 0x32
|00D026| db ^GFX_A6 ; 0x33
|00D027| db ^GFX_A7 ; 0x34
|00D028| db ^GFX_A8 ; 0x35
|00D029| db ^GFX_A9 ; 0x36
|00D02A| db ^GFX_AA ; 0x37
|00D02B| db ^GFX_AB ; 0x38
|00D02C| db ^GFX_AC ; 0x39
|00D02D| db ^GFX_AD ; 0x3A
|00D02E| db ^GFX_AE ; 0x3B
|00D02F| db ^GFX_AF ; 0x3C
|00D030| db ^GFX_B0 ; 0x3D
|00D031| db ^GFX_B1 ; 0x3E
|00D032| db ^GFX_B2 ; 0x3F
|00D033| db ^GFX_B3 ; 0x40
|00D034| db ^GFX_B4 ; 0x41
|00D035| db ^GFX_B5 ; 0x42
|00D036| db ^GFX_B6 ; 0x43
|00D037| db ^GFX_B7 ; 0x44
|00D038| db ^GFX_B8 ; 0x45
|00D039| db ^GFX_B9 ; 0x46
|00D03A| db ^GFX_BA ; 0x47
|00D03B| db ^GFX_BB ; 0x48
|00D03C| db ^GFX_BC ; 0x49
|00D03D| db ^GFX_BD ; 0x4A
|00D03E| db ^GFX_BE ; 0x4B
|00D03F| db ^GFX_BF ; 0x4C
|00D040| db ^GFX_C0 ; 0x4D
|00D041| db ^GFX_C1 ; 0x4E
|00D042| db ^GFX_C2 ; 0x4F
|00D043| db ^GFX_C3 ; 0x50
|00D044| db ^GFX_C4 ; 0x51
|00D045| db ^GFX_C5 ; 0x52
|00D046| db ^GFX_C6 ; 0x53
|00D047| db ^GFX_C7 ; 0x54
|00D048| db ^GFX_C8 ; 0x55
|00D049| db ^GFX_C9 ; 0x56
|00D04A| db ^GFX_CA ; 0x57
|00D04B| db ^GFX_CB ; 0x58
|00D04C| db ^GFX_CC ; 0x59
|00D04D| db ^GFX_CD ; 0x5A
|00D04E| db ^GFX_CE ; 0x5B
|00D04F| db ^GFX_CF ; 0x5C
|00D050| db ^GFX_D0 ; 0x5D
|00D051| db ^GFX_D1 ; 0x5E
|00D052| db ^GFX_D2 ; 0x5F
|00D053| db ^GFX_D3 ; 0x60
|00D054| db ^GFX_D4 ; 0x61
|00D055| db ^GFX_D5 ; 0x62
|00D056| db ^GFX_D6 ; 0x63
|00D057| db ^GFX_D7 ; 0x64
|00D058| db ^GFX_D8 ; 0x65
|00D059| db ^GFX_D9 ; 0x66
|00D05A| db ^GFX_DA ; 0x67
|00D05B| db ^GFX_DB ; 0x68
|00D05C| db ^GFX_DC ; 0x69
|00D05D| db ^GFX_DD ; 0x6A
|00D05E| db ^GFX_DE ; 0x6B

;---------------------------------------------------------------------------------------------------

.background_high
|00D05F| db >GFX_00
|00D060| db >GFX_01
|00D061| db >GFX_02
|00D062| db >GFX_03
|00D063| db >GFX_04
|00D064| db >GFX_05
|00D065| db >GFX_06
|00D066| db >GFX_07
|00D067| db >GFX_08
|00D068| db >GFX_09
|00D069| db >GFX_0A
|00D06A| db >GFX_0B
|00D06B| db >GFX_0C
|00D06C| db >GFX_0D
|00D06D| db >GFX_0E
|00D06E| db >GFX_0F
|00D06F| db >GFX_10
|00D070| db >GFX_11
|00D071| db >GFX_12
|00D072| db >GFX_13
|00D073| db >GFX_14
|00D074| db >GFX_15
|00D075| db >GFX_16
|00D076| db >GFX_17
|00D077| db >GFX_18
|00D078| db >GFX_19
|00D079| db >GFX_1A
|00D07A| db >GFX_1B
|00D07B| db >GFX_1C
|00D07C| db >GFX_1D
|00D07D| db >GFX_1E
|00D07E| db >GFX_1F
|00D07F| db >GFX_20
|00D080| db >GFX_21
|00D081| db >GFX_22
|00D082| db >GFX_23
|00D083| db >GFX_24
|00D084| db >GFX_25
|00D085| db >GFX_26
|00D086| db >GFX_27
|00D087| db >GFX_28
|00D088| db >GFX_29
|00D089| db >GFX_2A
|00D08A| db >GFX_2B
|00D08B| db >GFX_2C
|00D08C| db >GFX_2D
|00D08D| db >GFX_2E
|00D08E| db >GFX_2F
|00D08F| db >GFX_30
|00D090| db >GFX_31
|00D091| db >GFX_32
|00D092| db >GFX_33
|00D093| db >GFX_34
|00D094| db >GFX_35
|00D095| db >GFX_36
|00D096| db >GFX_37
|00D097| db >GFX_38
|00D098| db >GFX_39
|00D099| db >GFX_3A
|00D09A| db >GFX_3B
|00D09B| db >GFX_3C
|00D09C| db >GFX_3D
|00D09D| db >GFX_3E
|00D09E| db >GFX_3F
|00D09F| db >GFX_40
|00D0A0| db >GFX_41
|00D0A1| db >GFX_42
|00D0A2| db >GFX_43
|00D0A3| db >GFX_44
|00D0A4| db >GFX_45
|00D0A5| db >GFX_46
|00D0A6| db >GFX_47
|00D0A7| db >GFX_48
|00D0A8| db >GFX_49
|00D0A9| db >GFX_4A
|00D0AA| db >GFX_4B
|00D0AB| db >GFX_4C
|00D0AC| db >GFX_4D
|00D0AD| db >GFX_4E
|00D0AE| db >GFX_4F
|00D0AF| db >GFX_50
|00D0B0| db >GFX_51
|00D0B1| db >GFX_52
|00D0B2| db >GFX_53
|00D0B3| db >GFX_54
|00D0B4| db >GFX_55
|00D0B5| db >GFX_56
|00D0B6| db >GFX_57
|00D0B7| db >GFX_58
|00D0B8| db >GFX_59
|00D0B9| db >GFX_5A
|00D0BA| db >GFX_5B
|00D0BB| db >GFX_5C
|00D0BC| db >GFX_5D
|00D0BD| db >GFX_5E
|00D0BE| db >GFX_5F
|00D0BF| db >GFX_60
|00D0C0| db >GFX_61
|00D0C1| db >GFX_62
|00D0C2| db >GFX_63
|00D0C3| db >GFX_64
|00D0C4| db >GFX_65
|00D0C5| db >GFX_66
|00D0C6| db >GFX_67
|00D0C7| db >GFX_68
|00D0C8| db >GFX_69
|00D0C9| db >GFX_6A
|00D0CA| db >GFX_6B
|00D0CB| db >GFX_6C
|00D0CC| db >GFX_6D
|00D0CD| db >GFX_6E
|00D0CE| db >GFX_6F
|00D0CF| db >GFX_70
|00D0D0| db >GFX_DD
|00D0D1| db >GFX_DE

;---------------------------------------------------------------------------------------------------

.sprite_high
|00D0D2| db >GFX_73 ; 0x00
|00D0D3| db >GFX_74 ; 0x01
|00D0D4| db >GFX_75 ; 0x02
|00D0D5| db >GFX_76 ; 0x03
|00D0D6| db >GFX_77 ; 0x04
|00D0D7| db >GFX_78 ; 0x05
|00D0D8| db >GFX_79 ; 0x06
|00D0D9| db >GFX_7A ; 0x07
|00D0DA| db >GFX_7B ; 0x08
|00D0DB| db >GFX_7C ; 0x09
|00D0DC| db >GFX_7D ; 0x0A
|00D0DD| db >GFX_7E ; 0x0B
|00D0DE| db >GFX_7F ; 0x0C
|00D0DF| db >GFX_80 ; 0x0D
|00D0E0| db >GFX_81 ; 0x0E
|00D0E1| db >GFX_82 ; 0x0F
|00D0E2| db >GFX_83 ; 0x10
|00D0E3| db >GFX_84 ; 0x11
|00D0E4| db >GFX_85 ; 0x12
|00D0E5| db >GFX_86 ; 0x13
|00D0E6| db >GFX_87 ; 0x14
|00D0E7| db >GFX_88 ; 0x15
|00D0E8| db >GFX_89 ; 0x16
|00D0E9| db >GFX_8A ; 0x17
|00D0EA| db >GFX_8B ; 0x18
|00D0EB| db >GFX_8C ; 0x19
|00D0EC| db >GFX_8D ; 0x1A
|00D0ED| db >GFX_8E ; 0x1B
|00D0EE| db >GFX_8F ; 0x1C
|00D0EF| db >GFX_90 ; 0x1D
|00D0F0| db >GFX_91 ; 0x1E
|00D0F1| db >GFX_92 ; 0x1F
|00D0F2| db >GFX_93 ; 0x20
|00D0F3| db >GFX_94 ; 0x21
|00D0F4| db >GFX_95 ; 0x22
|00D0F5| db >GFX_96 ; 0x23
|00D0F6| db >GFX_97 ; 0x24
|00D0F7| db >GFX_98 ; 0x25
|00D0F8| db >GFX_99 ; 0x26
|00D0F9| db >GFX_9A ; 0x27
|00D0FA| db >GFX_9B ; 0x28
|00D0FB| db >GFX_9C ; 0x29
|00D0FC| db >GFX_9D ; 0x2A
|00D0FD| db >GFX_9E ; 0x2B
|00D0FE| db >GFX_9F ; 0x2C
|00D0FF| db >GFX_A0 ; 0x2D
|00D100| db >GFX_A1 ; 0x2E
|00D101| db >GFX_A2 ; 0x2F
|00D102| db >GFX_A3 ; 0x30
|00D103| db >GFX_A4 ; 0x31
|00D104| db >GFX_A5 ; 0x32
|00D105| db >GFX_A6 ; 0x33
|00D106| db >GFX_A7 ; 0x34
|00D107| db >GFX_A8 ; 0x35
|00D108| db >GFX_A9 ; 0x36
|00D109| db >GFX_AA ; 0x37
|00D10A| db >GFX_AB ; 0x38
|00D10B| db >GFX_AC ; 0x39
|00D10C| db >GFX_AD ; 0x3A
|00D10D| db >GFX_AE ; 0x3B
|00D10E| db >GFX_AF ; 0x3C
|00D10F| db >GFX_B0 ; 0x3D
|00D110| db >GFX_B1 ; 0x3E
|00D111| db >GFX_B2 ; 0x3F
|00D112| db >GFX_B3 ; 0x40
|00D113| db >GFX_B4 ; 0x41
|00D114| db >GFX_B5 ; 0x42
|00D115| db >GFX_B6 ; 0x43
|00D116| db >GFX_B7 ; 0x44
|00D117| db >GFX_B8 ; 0x45
|00D118| db >GFX_B9 ; 0x46
|00D119| db >GFX_BA ; 0x47
|00D11A| db >GFX_BB ; 0x48
|00D11B| db >GFX_BC ; 0x49
|00D11C| db >GFX_BD ; 0x4A
|00D11D| db >GFX_BE ; 0x4B
|00D11E| db >GFX_BF ; 0x4C
|00D11F| db >GFX_C0 ; 0x4D
|00D120| db >GFX_C1 ; 0x4E
|00D121| db >GFX_C2 ; 0x4F
|00D122| db >GFX_C3 ; 0x50
|00D123| db >GFX_C4 ; 0x51
|00D124| db >GFX_C5 ; 0x52
|00D125| db >GFX_C6 ; 0x53
|00D126| db >GFX_C7 ; 0x54
|00D127| db >GFX_C8 ; 0x55
|00D128| db >GFX_C9 ; 0x56
|00D129| db >GFX_CA ; 0x57
|00D12A| db >GFX_CB ; 0x58
|00D12B| db >GFX_CC ; 0x59
|00D12C| db >GFX_CD ; 0x5A
|00D12D| db >GFX_CE ; 0x5B
|00D12E| db >GFX_CF ; 0x5C
|00D12F| db >GFX_D0 ; 0x5D
|00D130| db >GFX_D1 ; 0x5E
|00D131| db >GFX_D2 ; 0x5F
|00D132| db >GFX_D3 ; 0x60
|00D133| db >GFX_D4 ; 0x61
|00D134| db >GFX_D5 ; 0x62
|00D135| db >GFX_D6 ; 0x63
|00D136| db >GFX_D7 ; 0x64
|00D137| db >GFX_D8 ; 0x65
|00D138| db >GFX_D9 ; 0x66
|00D139| db >GFX_DA ; 0x67
|00D13A| db >GFX_DB ; 0x68
|00D13B| db >GFX_DC ; 0x69
|00D13C| db >GFX_DD ; 0x6A
|00D13D| db >GFX_DE ; 0x6B

;---------------------------------------------------------------------------------------------------

.background_low
|00D13E| db <GFX_00
|00D13F| db <GFX_01
|00D140| db <GFX_02
|00D141| db <GFX_03
|00D142| db <GFX_04
|00D143| db <GFX_05
|00D144| db <GFX_06
|00D145| db <GFX_07
|00D146| db <GFX_08
|00D147| db <GFX_09
|00D148| db <GFX_0A
|00D149| db <GFX_0B
|00D14A| db <GFX_0C
|00D14B| db <GFX_0D
|00D14C| db <GFX_0E
|00D14D| db <GFX_0F
|00D14E| db <GFX_10
|00D14F| db <GFX_11
|00D150| db <GFX_12
|00D151| db <GFX_13
|00D152| db <GFX_14
|00D153| db <GFX_15
|00D154| db <GFX_16
|00D155| db <GFX_17
|00D156| db <GFX_18
|00D157| db <GFX_19
|00D158| db <GFX_1A
|00D159| db <GFX_1B
|00D15A| db <GFX_1C
|00D15B| db <GFX_1D
|00D15C| db <GFX_1E
|00D15D| db <GFX_1F
|00D15E| db <GFX_20
|00D15F| db <GFX_21
|00D160| db <GFX_22
|00D161| db <GFX_23
|00D162| db <GFX_24
|00D163| db <GFX_25
|00D164| db <GFX_26
|00D165| db <GFX_27
|00D166| db <GFX_28
|00D167| db <GFX_29
|00D168| db <GFX_2A
|00D169| db <GFX_2B
|00D16A| db <GFX_2C
|00D16B| db <GFX_2D
|00D16C| db <GFX_2E
|00D16D| db <GFX_2F
|00D16E| db <GFX_30
|00D16F| db <GFX_31
|00D170| db <GFX_32
|00D171| db <GFX_33
|00D172| db <GFX_34
|00D173| db <GFX_35
|00D174| db <GFX_36
|00D175| db <GFX_37
|00D176| db <GFX_38
|00D177| db <GFX_39
|00D178| db <GFX_3A
|00D179| db <GFX_3B
|00D17A| db <GFX_3C
|00D17B| db <GFX_3D
|00D17C| db <GFX_3E
|00D17D| db <GFX_3F
|00D17E| db <GFX_40
|00D17F| db <GFX_41
|00D180| db <GFX_42
|00D181| db <GFX_43
|00D182| db <GFX_44
|00D183| db <GFX_45
|00D184| db <GFX_46
|00D185| db <GFX_47
|00D186| db <GFX_48
|00D187| db <GFX_49
|00D188| db <GFX_4A
|00D189| db <GFX_4B
|00D18A| db <GFX_4C
|00D18B| db <GFX_4D
|00D18C| db <GFX_4E
|00D18D| db <GFX_4F
|00D18E| db <GFX_50
|00D18F| db <GFX_51
|00D190| db <GFX_52
|00D191| db <GFX_53
|00D192| db <GFX_54
|00D193| db <GFX_55
|00D194| db <GFX_56
|00D195| db <GFX_57
|00D196| db <GFX_58
|00D197| db <GFX_59
|00D198| db <GFX_5A
|00D199| db <GFX_5B
|00D19A| db <GFX_5C
|00D19B| db <GFX_5D
|00D19C| db <GFX_5E
|00D19D| db <GFX_5F
|00D19E| db <GFX_60
|00D19F| db <GFX_61
|00D1A0| db <GFX_62
|00D1A1| db <GFX_63
|00D1A2| db <GFX_64
|00D1A3| db <GFX_65
|00D1A4| db <GFX_66
|00D1A5| db <GFX_67
|00D1A6| db <GFX_68
|00D1A7| db <GFX_69
|00D1A8| db <GFX_6A
|00D1A9| db <GFX_6B
|00D1AA| db <GFX_6C
|00D1AB| db <GFX_6D
|00D1AC| db <GFX_6E
|00D1AD| db <GFX_6F
|00D1AE| db <GFX_70
|00D1AF| db <GFX_DD
|00D1B0| db <GFX_DE

;---------------------------------------------------------------------------------------------------

.sprite_low
|00D1B1| db <GFX_73 ; 0x00
|00D1B2| db <GFX_74 ; 0x01
|00D1B3| db <GFX_75 ; 0x02
|00D1B4| db <GFX_76 ; 0x03
|00D1B5| db <GFX_77 ; 0x04
|00D1B6| db <GFX_78 ; 0x05
|00D1B7| db <GFX_79 ; 0x06
|00D1B8| db <GFX_7A ; 0x07
|00D1B9| db <GFX_7B ; 0x08
|00D1BA| db <GFX_7C ; 0x09
|00D1BB| db <GFX_7D ; 0x0A
|00D1BC| db <GFX_7E ; 0x0B
|00D1BD| db <GFX_7F ; 0x0C
|00D1BE| db <GFX_80 ; 0x0D
|00D1BF| db <GFX_81 ; 0x0E
|00D1C0| db <GFX_82 ; 0x0F
|00D1C1| db <GFX_83 ; 0x10
|00D1C2| db <GFX_84 ; 0x11
|00D1C3| db <GFX_85 ; 0x12
|00D1C4| db <GFX_86 ; 0x13
|00D1C5| db <GFX_87 ; 0x14
|00D1C6| db <GFX_88 ; 0x15
|00D1C7| db <GFX_89 ; 0x16
|00D1C8| db <GFX_8A ; 0x17
|00D1C9| db <GFX_8B ; 0x18
|00D1CA| db <GFX_8C ; 0x19
|00D1CB| db <GFX_8D ; 0x1A
|00D1CC| db <GFX_8E ; 0x1B
|00D1CD| db <GFX_8F ; 0x1C
|00D1CE| db <GFX_90 ; 0x1D
|00D1CF| db <GFX_91 ; 0x1E
|00D1D0| db <GFX_92 ; 0x1F
|00D1D1| db <GFX_93 ; 0x20
|00D1D2| db <GFX_94 ; 0x21
|00D1D3| db <GFX_95 ; 0x22
|00D1D4| db <GFX_96 ; 0x23
|00D1D5| db <GFX_97 ; 0x24
|00D1D6| db <GFX_98 ; 0x25
|00D1D7| db <GFX_99 ; 0x26
|00D1D8| db <GFX_9A ; 0x27
|00D1D9| db <GFX_9B ; 0x28
|00D1DA| db <GFX_9C ; 0x29
|00D1DB| db <GFX_9D ; 0x2A
|00D1DC| db <GFX_9E ; 0x2B
|00D1DD| db <GFX_9F ; 0x2C
|00D1DE| db <GFX_A0 ; 0x2D
|00D1DF| db <GFX_A1 ; 0x2E
|00D1E0| db <GFX_A2 ; 0x2F
|00D1E1| db <GFX_A3 ; 0x30
|00D1E2| db <GFX_A4 ; 0x31
|00D1E3| db <GFX_A5 ; 0x32
|00D1E4| db <GFX_A6 ; 0x33
|00D1E5| db <GFX_A7 ; 0x34
|00D1E6| db <GFX_A8 ; 0x35
|00D1E7| db <GFX_A9 ; 0x36
|00D1E8| db <GFX_AA ; 0x37
|00D1E9| db <GFX_AB ; 0x38
|00D1EA| db <GFX_AC ; 0x39
|00D1EB| db <GFX_AD ; 0x3A
|00D1EC| db <GFX_AE ; 0x3B
|00D1ED| db <GFX_AF ; 0x3C
|00D1EE| db <GFX_B0 ; 0x3D
|00D1EF| db <GFX_B1 ; 0x3E
|00D1F0| db <GFX_B2 ; 0x3F
|00D1F1| db <GFX_B3 ; 0x40
|00D1F2| db <GFX_B4 ; 0x41
|00D1F3| db <GFX_B5 ; 0x42
|00D1F4| db <GFX_B6 ; 0x43
|00D1F5| db <GFX_B7 ; 0x44
|00D1F6| db <GFX_B8 ; 0x45
|00D1F7| db <GFX_B9 ; 0x46
|00D1F8| db <GFX_BA ; 0x47
|00D1F9| db <GFX_BB ; 0x48
|00D1FA| db <GFX_BC ; 0x49
|00D1FB| db <GFX_BD ; 0x4A
|00D1FC| db <GFX_BE ; 0x4B
|00D1FD| db <GFX_BF ; 0x4C
|00D1FE| db <GFX_C0 ; 0x4D
|00D1FF| db <GFX_C1 ; 0x4E
|00D200| db <GFX_C2 ; 0x4F
|00D201| db <GFX_C3 ; 0x50
|00D202| db <GFX_C4 ; 0x51
|00D203| db <GFX_C5 ; 0x52
|00D204| db <GFX_C6 ; 0x53
|00D205| db <GFX_C7 ; 0x54
|00D206| db <GFX_C8 ; 0x55
|00D207| db <GFX_C9 ; 0x56
|00D208| db <GFX_CA ; 0x57
|00D209| db <GFX_CB ; 0x58
|00D20A| db <GFX_CC ; 0x59
|00D20B| db <GFX_CD ; 0x5A
|00D20C| db <GFX_CE ; 0x5B
|00D20D| db <GFX_CF ; 0x5C
|00D20E| db <GFX_D0 ; 0x5D
|00D20F| db <GFX_D1 ; 0x5E
|00D210| db <GFX_D2 ; 0x5F
|00D211| db <GFX_D3 ; 0x60
|00D212| db <GFX_D4 ; 0x61
|00D213| db <GFX_D5 ; 0x62
|00D214| db <GFX_D6 ; 0x63
|00D215| db <GFX_D7 ; 0x64
|00D216| db <GFX_D8 ; 0x65
|00D217| db <GFX_D9 ; 0x66
|00D218| db <GFX_DA ; 0x67
|00D219| db <GFX_DB ; 0x68
|00D21A| db <GFX_DC ; 0x69
|00D21B| db <GFX_DD ; 0x6A
|00D21C| db <GFX_DE ; 0x6B

;===================================================================================================

pool LoadItemGFX

.offset
|00D21D| dw $0000 ; rods
|00D21F| dw $0108 ; hammer
|00D221| dw $00C0 ; bow
|00D223| dw $0390 ; shovel
|00D225| dw $03F0 ; Zzz ♪
|00D227| dw $0438 ; powder dust
|00D229| dw $0330 ; hookshot
|00D22B| dw $0048 ; net
|00D22D| dw $0318 ; cane
|00D22F| dw $0450 ; book

endpool

;===================================================================================================

LoadItemGFXIntoWRAM4BPPBuffer:
|00D231| PHB
|00D232| PHK
|00D233| PLB

|00D234| REP #$20

|00D236| STZ.b $0A
|00D238| STZ.b $0C

|00D23A| LDA.w #$0480
|00D23D| STA.b $06

|00D23F| SEP #$20

|00D241| LDA.b #$07
|00D243| JSR LoadItemGFX_sheet0

|00D246| LDA.b #$07
|00D248| JSR LoadItemGFX_sheet0

|00D24B| LDA.b #$03
|00D24D| JSR LoadItemGFX_sheet0

|00D250| LDY.b #$5F
|00D252| LDA.b #$04
|00D254| JSR LoadItemGFX_arbitrary_sheet

|00D257| LDA.b #$03
|00D259| JSR LoadItemGFX_current_sheet

|00D25C| LDA.b #$01
|00D25E| JSR LoadItemGFX_current_sheet

|00D261| LDA.b #$04
|00D263| JSR LoadItemGFX_sheet0

|00D266| LDY.b #$60
|00D268| LDA.b #$0E
|00D26A| JSR LoadItemGFX_arbitrary_sheet

|00D26D| LDA.b #$07
|00D26F| JSR LoadItemGFX_current_sheet

|00D272| LDY.b #$5F
|00D274| LDA.b #$02
|00D276| JSR LoadItemGFX_arbitrary_sheet

;---------------------------------------------------------------------------------------------------

|00D279| LDY.b #$54
|00D27B| JSR Decompress_sprite_low

|00D27E| REP #$30

|00D280| LDA.b $00

|00D282| LDX.w #$1480

|00D285| PHA

|00D286| LDY.w #$0008
|00D289| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D28C| PLA
|00D28D| CLC
|00D28E| ADC.w #$0180

|00D291| LDY.w #$0008
|00D294| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

;---------------------------------------------------------------------------------------------------

|00D297| SEP #$30

|00D299| LDY.b #$60
|00D29B| JSR Decompress_sprite_low

|00D29E| REP #$30

|00D2A0| LDA.b $00
|00D2A2| LDX.w #$2280
|00D2A5| LDY.w #$0003

|00D2A8| PHA

|00D2A9| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D2AC| PLA
|00D2AD| CLC
|00D2AE| ADC.w #$0180

|00D2B1| LDY.w #$0003
|00D2B4| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D2B7| SEP #$30

|00D2B9| JSR LoadAuxiliaryWRAMGraphics

|00D2BC| PLB

|00D2BD| RTL

;===================================================================================================

pool DecompressSwordGraphics

.offset
|00D2BE| dw $0000 ; none
|00D2C0| dw $0000 ; fighter sword
|00D2C2| dw $0120 ; master sword
|00D2C4| dw $0120 ; tempered sword
|00D2C6| dw $0120 ; gold sword

endpool

;---------------------------------------------------------------------------------------------------

DecompressSwordGraphics:
|00D2C8| PHB
|00D2C9| PHK
|00D2CA| PLB

|00D2CB| LDY.b #$5F
|00D2CD| JSR Decompress_sprite_high

|00D2D0| LDY.b #$5E
|00D2D2| JSR Decompress_sprite_low

|00D2D5| REP #$21

|00D2D7| LDA.l $7EF359
|00D2DB| AND.w #$00FF
|00D2DE| ASL A
|00D2DF| TAY

|00D2E0| LDA.b $00
|00D2E2| ADC.w .offset,Y

|00D2E5| REP #$10

|00D2E7| LDX.w #$0000
|00D2EA| LDY.w #$000C

|00D2ED| PHA

|00D2EE| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D2F1| PLA
|00D2F2| CLC
|00D2F3| ADC.w #$0180

|00D2F6| LDY.w #$000C
|00D2F9| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D2FC| SEP #$30

|00D2FE| PLB

|00D2FF| RTL

;===================================================================================================

pool DecompressShieldGraphics

.offset
|00D300| dw $0660 ; none
|00D302| dw $0660 ; fighter shield
|00D304| dw $06F0 ; fire shield
|00D306| dw $0900 ; mirror shield

endpool

;---------------------------------------------------------------------------------------------------

DecompressShieldGraphics:
|00D308| PHB
|00D309| PHK
|00D30A| PLB

|00D30B| LDY.b #$5F
|00D30D| JSR Decompress_sprite_high

|00D310| LDY.b #$5E
|00D312| JSR Decompress_sprite_low

|00D315| REP #$21

|00D317| LDA.l $7EF35A
|00D31B| ASL A
|00D31C| TAY

|00D31D| LDA.b $00
|00D31F| ADC.w .offset,Y

|00D322| REP #$10

|00D324| LDX.w #$0300

|00D327| PHA

|00D328| JSR Do3bppToWRAM4bpp_RightPal

|00D32B| PLA
|00D32C| CLC
|00D32D| ADC.w #$0180
|00D330| JSR Do3bppToWRAM4bpp_RightPal

|00D333| SEP #$30

|00D335| PLB

|00D336| RTL

;===================================================================================================

DecompressAnimatedUnderworldTiles:
|00D337| PHB
|00D338| PHK
|00D339| PLB

|00D33A| JSR Decompress_background_low

|00D33D| REP #$30

|00D33F| LDA.b $00
|00D341| LDY.w #$0030
|00D344| LDX.w #$1680
|00D347| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D34A| SEP #$30

|00D34C| LDY.b #$5C
|00D34E| JSR Decompress_background_low

|00D351| REP #$30

|00D353| LDA.b $00
|00D355| LDY.w #$0030
|00D358| LDX.w #$1C80
|00D35B| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

;---------------------------------------------------------------------------------------------------

|00D35E| LDX.w #$0000

.next_tile_frame
|00D361| LDA.l $7EA880,X
|00D365| PHA

|00D366| LDA.l $7EAC80,X
|00D36A| STA.l $7EA880,X

|00D36E| LDA.l $7EAE80,X
|00D372| STA.l $7EAC80,X

|00D376| LDA.l $7EAA80,X
|00D37A| STA.l $7EAE80,X

|00D37E| PLA
|00D37F| STA.l $7EAA80,X

|00D383| INX
|00D384| INX
|00D385| CPX.w #$0200
|00D388| BNE .next_tile_frame

;---------------------------------------------------------------------------------------------------

|00D38A| LDA.w #$3B00 ; VRAM $7600
|00D38D| STA.w $0134

|00D390| SEP #$30

|00D392| PLB

|00D393| RTL

;===================================================================================================

DecompressAnimatedOverworldTiles:
|00D394| PHB
|00D395| PHK
|00D396| PLB

|00D397| PHY

|00D398| JSR Decompress_background_low

|00D39B| REP #$30

|00D39D| LDA.b $00
|00D39F| LDY.w #$0040
|00D3A2| LDX.w #$1680
|00D3A5| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D3A8| SEP #$30

|00D3AA| PLY
|00D3AB| INY

|00D3AC| JSR Decompress_background_low

|00D3AF| REP #$30

|00D3B1| LDA.b $00
|00D3B3| LDY.w #$0020
|00D3B6| LDX.w #$1E80
|00D3B9| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D3BC| LDA.w #$3C00 ; VRAM $7800
|00D3BF| STA.w $0134

|00D3C2| SEP #$30

|00D3C4| PLB

|00D3C5| RTL

;===================================================================================================

LoadAuxiliaryWRAMGraphics:
|00D3C6| LDY.b #$0F
|00D3C8| JSR Decompress_background_low

|00D3CB| REP #$30

|00D3CD| LDA.b $00
|00D3CF| LDY.w #$0010
|00D3D2| LDX.w #$2340

|00D3D5| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D3D8| SEP #$30

|00D3DA| LDY.b #$58
|00D3DC| JSR Decompress_sprite_low

|00D3DF| REP #$30

|00D3E1| LDA.b $00
|00D3E3| LDY.w #$0020
|00D3E6| LDX.w #$2540

|00D3E9| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D3EC| SEP #$30

|00D3EE| LDY.b #$05
|00D3F0| JSR Decompress_background_low

|00D3F3| REP #$30

|00D3F5| LDA.b $00
|00D3F7| CLC
|00D3F8| ADC.w #$0480

|00D3FB| LDY.w #$0002
|00D3FE| LDX.w #$2DC0
|00D401| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D404| SEP #$30

|00D406| RTS

;===================================================================================================

pool LoadFollowerGraphics

.gfx_offset
|00D407| dw $0000 ; 0x00 - No follower
|00D409| dw $0600 ; 0x01 - Zelda
|00D40B| dw $0300 ; 0x02 - Old man that stops following you
|00D40D| dw $0300 ; 0x03 - Unused old man
|00D40F| dw $0300 ; 0x04 - Normal old man
|00D411| dw $0000 ; 0x05 - Zelda rescue telepathy
|00D413| dw $0000 ; 0x06 - Blind maiden
|00D415| dw $0900 ; 0x07 - Frogsmith
|00D417| dw $0600 ; 0x08 - Smithy
|00D419| dw $0600 ; 0x09 - Locksmith
|00D41B| dw $0900 ; 0x0A - Kiki
|00D41D| dw $0900 ; 0x0B - Unused old man
|00D41F| dw $0600 ; 0x0C - Purple chest
|00D421| dw $0900 ; 0x0D - Super bomb

endpool

;---------------------------------------------------------------------------------------------------

LoadFollowerGraphics:
|00D423| PHB
|00D424| PHK
|00D425| PLB

|00D426| LDY.b #$64
|00D428| LDA.l $7EF3CC
|00D42C| CMP.b #$01 ; FOLLOWER 01
|00D42E| BEQ .start

|00D430| LDY.b #$66
|00D432| LDA.l $7EF3CC
|00D436| CMP.b #$09 ; FOLLOWER 09
|00D438| BCC .start

|00D43A| LDY.b #$59
|00D43C| CMP.b #$0C
|00D43E| BCC .start

|00D440| LDY.b #$58

;---------------------------------------------------------------------------------------------------

.start
|00D442| JSR Decompress_sprite_high

|00D445| LDY.b #$65
|00D447| JSR Decompress_sprite_low

|00D44A| REP #$30

|00D44C| LDA.l $7EF3CC
|00D450| AND.w #$00FF
|00D453| ASL A
|00D454| TAX

|00D455| LDA.b $00
|00D457| CLC
|00D458| ADC.l .gfx_offset,X

|00D45C| LDY.w #$0020
|00D45F| LDX.w #$2940
|00D462| JSR Do3bppToWRAM4bpp_LeftPal.arbitrary

|00D465| SEP #$30

|00D467| PLB

|00D468| RTL

;===================================================================================================

pool WriteTo4BPPBuffer

.offsets
|00D469| dw $09C0 ; 0x00 - Full bottle
|00D46B| dw $0030 ; 0x01 - 3 bombs
|00D46D| dw $0060 ; 0x02 - 10 arrows
|00D46F| dw $0090 ; 0x03 - Heart container
|00D471| dw $00C0 ; 0x04 - Mail
|00D473| dw $0300 ; 0x05 - Bow
|00D475| dw $0318 ; 0x06 - Fighter sword
|00D477| dw $0330 ; 0x07 - Cane
|00D479| dw $0348 ; 0x08 - Hookshot
|00D47B| dw $0360 ; 0x09 - Rod
|00D47D| dw $0378 ; 0x0A - Hammer
|00D47F| dw $0390 ; 0x0B - Powder
|00D481| dw $0930 ; 0x0C - Flute
|00D483| dw $03F0 ; 0x0D - Glove
|00D485| dw $0420 ; 0x0E - Book
|00D487| dw $0450 ; 0x0F - Small key
|00D489| dw $0468 ; 0x10 - Boomerang
|00D48B| dw $0600 ; 0x11 - Flippers
|00D48D| dw $0630 ; 0x12 - Mirror
|00D48F| dw $0660 ; 0x13 - Bomb
|00D491| dw $0690 ; 0x14 - Lamp
|00D493| dw $06C0 ; 0x15 - Cape
|00D495| dw $06F0 ; 0x16 - Compass
|00D497| dw $0720 ; 0x17 - Pearl
|00D499| dw $0750 ; 0x18 - Master sword
|00D49B| dw $0768 ; 0x19 - Shovel
|00D49D| dw $0900 ; 0x1A - Ether
|00D49F| dw $0930 ; 0x1B - Bombos
|00D4A1| dw $0960 ; 0x1C - Quake
|00D4A3| dw $0990 ; 0x1D - Empty bottle
|00D4A5| dw $09F0 ; 0x1E - Mushroom
|00D4A7| dw $0000 ; 0x1F - Cauldron
|00D4A9| dw $00F0 ; 0x20 - Fire shield
|00D4AB| dw $0A20 ; 0x21 - Map
|00D4AD| dw $0A50 ; 0x22 - Big key
|00D4AF| dw $0660 ; 0x23 - Pendant
|00D4B1| dw $0600 ; 0x24 - Animated rupee
|00D4B3| dw $0618 ; 0x25 - Animated rupee
|00D4B5| dw $0630 ; 0x26 - Animated rupee
|00D4B7| dw $0648 ; 0x27 - Net
|00D4B9| dw $0678 ; 0x28 - Crystal
|00D4BB| dw $06D8 ; 0x29 - Tossed bow
|00D4BD| dw $06A8 ; 0x2A - Silvers
|00D4BF| dw $0708 ; 0x2B - Bottle with fairy
|00D4C1| dw $0738 ; 0x2C - Bottle with bee
|00D4C3| dw $0768 ; 0x2D - Fighter shield
|00D4C5| dw $0960 ; 0x2E - Mirror shield
|00D4C7| dw $0900 ; 0x2F - Heart piece
|00D4C9| dw $03C0 ; 0x30 - 10 bombs
|00D4CB| dw $0990 ; 0x31 - Small heart
|00D4CD| dw $09A8 ; 0x32 - Small magic
|00D4CF| dw $09C0 ; 0x33 - 1 arrow
|00D4D1| dw $09D8 ; 0x34 - 100 rupees
|00D4D3| dw $0A08 ; 0x35 - 50 rupees
|00D4D5| dw $0A38 ; 0x36 - 300 rupees
|00D4D7| dw $0600 ; 0x37 - 20 rupees
|00D4D9| dw $0630 ; 0x38 - Boots

endpool

;===================================================================================================

WriteTo4BPPBuffer_at_7F4000:
|00D4DB| PHB
|00D4DC| PHK
|00D4DD| PLB

|00D4DE| PHA

|00D4DF| STZ.b $00

|00D4E1| LDA.b #>$7F4000
|00D4E3| STA.b $01

|00D4E5| LDA.b #^$7F4000
|00D4E7| STA.b $02
|00D4E9| STA.b $05

|00D4EB| BRA WriteTo4BPPBuffer

;===================================================================================================

WriteTo4BPPBuffer_item_gfx:
|00D4ED| PHB
|00D4EE| PHK
|00D4EF| PLB

|00D4F0| PHA

|00D4F1| LDY.b #$5D
|00D4F3| CMP.b #$23
|00D4F5| BEQ .set_a

|00D4F7| CMP.b #$37
|00D4F9| BCS .set_a

|00D4FB| LDY.b #$5C
|00D4FD| CMP.b #$0C
|00D4FF| BEQ .set_a

|00D501| CMP.b #$24
|00D503| BCS .set_a

|00D505| LDY.b #$5B

.set_a
|00D507| JSR Decompress_sprite_high

|00D50A| LDY.b #$5A
|00D50C| JSR Decompress_sprite_low

;===================================================================================================

WriteTo4BPPBuffer:
|00D50F| PLA

|00D510| REP #$21

|00D512| AND.w #$00FF
|00D515| ASL A
|00D516| TAX

|00D517| LDA.b $00
|00D519| ADC.w .offsets,X

|00D51C| REP #$10

|00D51E| LDX.w #$2D40
|00D521| LDY.w #$0002

|00D524| PHA

|00D525| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D528| PLA
|00D529| CLC
|00D52A| ADC.w #$0180

|00D52D| LDY.w #$0002
|00D530| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D533| SEP #$30

|00D535| PLB

|00D536| RTL

;===================================================================================================

LoadItemGFX_sheet0:
|00D537| STA.b $0A

|00D539| LDY.b #$00

|00D53B| LDA.w GFXSheetPointers.sprite_bank,Y
|00D53E| STA.b $02
|00D540| STA.b $05

|00D542| LDA.w GFXSheetPointers.sprite_high,Y
|00D545| STA.b $01

|00D547| LDA.w GFXSheetPointers.sprite_low,Y
|00D54A| STA.b $00

|00D54C| BRA LoadItemGFX

;===================================================================================================

LoadItemGFX_arbitrary_sheet:
|00D54E| PHA

|00D54F| JSR Decompress_sprite_low

|00D552| PLA

;===================================================================================================

LoadItemGFX_current_sheet:
|00D553| STA.b $0A

|00D555| STZ.b $00

|00D557| LDA.b #>$7F4000
|00D559| STA.b $01

|00D55B| LDA.b #^$7F4000
|00D55D| STA.b $02

|00D55F| STA.b $05

;===================================================================================================

LoadItemGFX:
|00D561| REP #$31

|00D563| LDY.b $0C

|00D565| LDA.b $00
|00D567| ADC.w .offset,Y

|00D56A| LDX.b $06
|00D56C| LDY.b $0A

|00D56E| PHA

|00D56F| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D572| PLA
|00D573| CLC
|00D574| ADC.w #$0180

|00D577| LDY.b $0A
|00D579| JSR Do3bppToWRAM4bpp_RightPal.arbitrary

|00D57C| INC.b $0C
|00D57E| INC.b $0C

|00D580| STX.b $06

|00D582| SEP #$30

|00D584| RTS

;===================================================================================================

UNREACHABLE_00D585:
|00D585| LDY.w #$0008
|00D588| STY.b $0E

.next_tile
|00D58A| STA.b $00

|00D58C| CLC
|00D58D| ADC.w #$0010
|00D590| STA.b $03

|00D592| LDY.w #$0007

.next_word
|00D595| LDA.b [$00]
|00D597| STA.l $7E9000,X

|00D59B| INC.b $00
|00D59D| INC.b $00

|00D59F| LDA.b [$03]
|00D5A1| AND.w #$00FF
|00D5A4| STA.l $7E9010,X

|00D5A8| INC.b $03

|00D5AA| INX
|00D5AB| INX

|00D5AC| DEY
|00D5AD| BPL .next_word

|00D5AF| TXA
|00D5B0| CLC
|00D5B1| ADC.w #$0010
|00D5B4| TAX

|00D5B5| LDA.b $03
|00D5B7| AND.w #$0078
|00D5BA| BNE .same_row

|00D5BC| LDA.b $03
|00D5BE| CLC
|00D5BF| ADC.w #$0180
|00D5C2| STA.b $03

.same_row
|00D5C4| LDA.b $03

|00D5C6| DEC.b $0E
|00D5C8| BNE .next_tile

|00D5CA| RTS

;===================================================================================================

Do3bppToWRAM4bpp_LeftPal:
|00D5CB| LDY.w #$0008

.arbitrary
|00D5CE| STY.b $0E

;---------------------------------------------------------------------------------------------------

.next_tile
|00D5D0| STA.b $00

|00D5D2| CLC
|00D5D3| ADC.w #$0010
|00D5D6| STA.b $03

|00D5D8| LDY.w #$0003

.next_word
|00D5DB| LDA.b [$00]
|00D5DD| STA.l $7E9000,X

|00D5E1| INC.b $00
|00D5E3| INC.b $00

|00D5E5| LDA.b [$03]
|00D5E7| AND.w #$00FF
|00D5EA| STA.l $7E9010,X

|00D5EE| INC.b $03

|00D5F0| INX
|00D5F1| INX

|00D5F2| LDA.b [$00]
|00D5F4| STA.l $7E9000,X

|00D5F8| INC.b $00
|00D5FA| INC.b $00

|00D5FC| LDA.b [$03]
|00D5FE| AND.w #$00FF
|00D601| STA.l $7E9010,X

|00D605| INC.b $03

|00D607| INX
|00D608| INX

|00D609| DEY
|00D60A| BPL .next_word

|00D60C| TXA
|00D60D| CLC
|00D60E| ADC.w #$0010
|00D611| TAX

|00D612| LDA.b $03

|00D614| DEC.b $0E
|00D616| BNE .next_tile

|00D618| RTS

;===================================================================================================

Do3bppToWRAM4bpp_RightPal:
|00D619| LDY.w #$0006

.arbitrary
|00D61C| STY.b $0E

;---------------------------------------------------------------------------------------------------

.next_tile
|00D61E| STA.b $00

|00D620| CLC
|00D621| ADC.w #$0010
|00D624| STA.b $03

|00D626| LDY.w #$0007

.next_word
|00D629| LDA.b [$00]
|00D62B| STA.l $7E9000,X

|00D62F| XBA
|00D630| ORA.b [$00]
|00D632| AND.w #$00FF
|00D635| STA.b $08

|00D637| INC.b $00
|00D639| INC.b $00

|00D63B| LDA.b [$03]
|00D63D| AND.w #$00FF
|00D640| STA.b $BD

|00D642| ORA.b $08
|00D644| XBA
|00D645| ORA.b $BD
|00D647| STA.l $7E9010,X

|00D64B| INC.b $03

|00D64D| INX
|00D64E| INX

|00D64F| DEY
|00D650| BPL .next_word

;---------------------------------------------------------------------------------------------------

|00D652| TXA
|00D653| CLC
|00D654| ADC.w #$0010
|00D657| TAX

|00D658| LDA.b $03
|00D65A| AND.w #$0078
|00D65D| BNE .same_row

|00D65F| LDA.b $03
|00D661| CLC
|00D662| ADC.w #$0180
|00D665| STA.b $03

.same_row
|00D667| LDA.b $03

|00D669| DEC.b $0E
|00D66B| BNE .next_tile

|00D66D| RTS

;===================================================================================================

LoadTransAuxGFX:
|00D66E| PHB
|00D66F| PHK
|00D670| PLB

|00D671| STZ.b $00

|00D673| LDA.b #>$7E6000
|00D675| STA.b $01

|00D677| LDA.b #^$7E6000
|00D679| STA.b $02

|00D67B| REP #$30

|00D67D| LDA.w $0AA2
|00D680| AND.w #$00FF
|00D683| ASL A
|00D684| ASL A
|00D685| STA.b $0E

;---------------------------------------------------------------------------------------------------

|00D687| SEP #$20

|00D689| LDX.b $0E

|00D68B| LDA.w SheetsTable_AA2+0,X
|00D68E| BEQ .skip_bg0

|00D690| STA.l $7EC2F8

|00D694| SEP #$10

|00D696| TAY
|00D697| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg0
|00D69A| SEP #$10

|00D69C| LDA.b $01
|00D69E| CLC
|00D69F| ADC.b #$06
|00D6A1| STA.b $01

|00D6A3| REP #$10

|00D6A5| LDX.b $0E

|00D6A7| LDA.w SheetsTable_AA2+1,X
|00D6AA| BEQ .skip_bg1

|00D6AC| STA.l $7EC2F9

|00D6B0| SEP #$10

|00D6B2| TAY
|00D6B3| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg1
|00D6B6| SEP #$10

|00D6B8| LDA.b $01
|00D6BA| CLC
|00D6BB| ADC.b #$06
|00D6BD| STA.b $01

|00D6BF| REP #$10

|00D6C1| LDX.b $0E

|00D6C3| LDA.w SheetsTable_AA2+2,X
|00D6C6| BEQ .skip_bg2

|00D6C8| STA.l $7EC2FA

|00D6CC| SEP #$10

|00D6CE| TAY
|00D6CF| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg2
|00D6D2| SEP #$10

|00D6D4| LDA.b $01
|00D6D6| CLC
|00D6D7| ADC.b #$06
|00D6D9| STA.b $01

|00D6DB| REP #$10

|00D6DD| LDX.b $0E
|00D6DF| LDA.w SheetsTable_AA2+3,X
|00D6E2| BEQ .skip_bg3

|00D6E4| STA.l $7EC2FB

|00D6E8| SEP #$10

|00D6EA| TAY
|00D6EB| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

.skip_bg3
|00D6EE| SEP #$10

|00D6F0| LDA.b $01
|00D6F2| CLC
|00D6F3| ADC.b #$06
|00D6F5| STA.b $01

|00D6F7| BRA .continue

;===================================================================================================

#LoadTransAuxGFX_sprite:
|00D6F9| PHB
|00D6FA| PHK
|00D6FB| PLB

|00D6FC| STZ.b $00

|00D6FE| LDA.b #>$7E7800
|00D700| STA.b $01

|00D702| LDA.b #^$7E7800
|00D704| STA.b $02

;===================================================================================================

.continue
|00D706| REP #$30

|00D708| LDA.w $0AA3
|00D70B| AND.w #$00FF
|00D70E| ASL A
|00D70F| ASL A
|00D710| STA.b $0E

;---------------------------------------------------------------------------------------------------

|00D712| SEP #$20

|00D714| LDX.b $0E
|00D716| LDA.w SheetsTable_AA3+0,X
|00D719| BEQ .skip_spr0

|00D71B| STA.l $7EC2FC

.skip_spr0
|00D71F| SEP #$10

|00D721| LDA.l $7EC2FC
|00D725| TAY

|00D726| JSR Decompress_sprite_arbitrary

|00D729| LDA.b $01
|00D72B| CLC
|00D72C| ADC.b #$06
|00D72E| STA.b $01

;---------------------------------------------------------------------------------------------------

|00D730| REP #$10

|00D732| LDX.b $0E

|00D734| LDA.w SheetsTable_AA3+1,X
|00D737| BEQ .skip_spr1

|00D739| STA.l $7EC2FD

.skip_spr1
|00D73D| SEP #$10

|00D73F| LDA.l $7EC2FD
|00D743| TAY

|00D744| JSR Decompress_sprite_arbitrary

|00D747| LDA.b $01
|00D749| CLC
|00D74A| ADC.b #$06
|00D74C| STA.b $01

;---------------------------------------------------------------------------------------------------

|00D74E| REP #$10

|00D750| LDX.b $0E

|00D752| LDA.w SheetsTable_AA3+2,X
|00D755| BEQ .skip_spr2

|00D757| STA.l $7EC2FE

.skip_spr2
|00D75B| SEP #$10

|00D75D| LDA.l $7EC2FE
|00D761| TAY

|00D762| JSR Decompress_sprite_arbitrary

|00D765| LDA.b $01
|00D767| CLC
|00D768| ADC.b #$06
|00D76A| STA.b $01

;---------------------------------------------------------------------------------------------------

|00D76C| REP #$10

|00D76E| LDX.b $0E

|00D770| LDA.w SheetsTable_AA3+3,X
|00D773| BEQ .skip_spr3

|00D775| STA.l $7EC2FF

.skip_spr3
|00D779| SEP #$10

|00D77B| LDA.l $7EC2FF
|00D77F| TAY

|00D780| JSR Decompress_sprite_arbitrary

|00D783| STZ.w $0412

|00D786| PLB

|00D787| RTL

;===================================================================================================

ReloadPreviouslyLoadedSheets:
|00D788| PHB
|00D789| PHK
|00D78A| PLB

|00D78B| STZ.b $00

|00D78D| LDA.b #>$7E6000
|00D78F| STA.b $01

|00D791| LDA.b #^$7E6000
|00D793| STA.b $02

|00D795| LDA.l $7EC2F8
|00D799| TAY

|00D79A| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

|00D79D| LDA.b $01
|00D79F| CLC
|00D7A0| ADC.b #$06
|00D7A2| STA.b $01

|00D7A4| LDA.l $7EC2F9
|00D7A8| TAY

|00D7A9| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7AC| LDA.b $01
|00D7AE| CLC
|00D7AF| ADC.b #$06
|00D7B1| STA.b $01

|00D7B3| LDA.l $7EC2FA
|00D7B7| TAY

|00D7B8| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7BB| LDA.b $01
|00D7BD| CLC
|00D7BE| ADC.b #$06
|00D7C0| STA.b $01

|00D7C2| LDA.l $7EC2FB
|00D7C6| TAY

|00D7C7| JSR Decompress_background_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7CA| STZ.b $00

|00D7CC| LDA.b #>$7E7800
|00D7CE| STA.b $01

|00D7D0| LDA.b #^$7E7800
|00D7D2| STA.b $02

|00D7D4| LDA.l $7EC2FC
|00D7D8| TAY

|00D7D9| JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7DC| LDA.b $01
|00D7DE| CLC
|00D7DF| ADC.b #$06
|00D7E1| STA.b $01

|00D7E3| LDA.l $7EC2FD
|00D7E7| TAY

|00D7E8| JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7EB| LDA.b $01
|00D7ED| CLC
|00D7EE| ADC.b #$06
|00D7F0| STA.b $01

|00D7F2| LDA.l $7EC2FE
|00D7F6| TAY

|00D7F7| JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

|00D7FA| LDA.b $01
|00D7FC| CLC
|00D7FD| ADC.b #$06
|00D7FF| STA.b $01

|00D801| LDA.l $7EC2FF
|00D805| TAY

|00D806| JSR Decompress_sprite_arbitrary

;---------------------------------------------------------------------------------------------------

|00D809| STZ.w $0412

|00D80C| PLB

|00D80D| RTL

;===================================================================================================

DecompressAttractPlaques:
|00D80E| PHB
|00D80F| PHK
|00D810| PLB

|00D811| STZ.b $00

|00D813| LDA.b #>$7F4000
|00D815| STA.b $01

|00D817| LDA.b #^$7F4000
|00D819| STA.b $02
|00D81B| STA.b $05

|00D81D| LDA.b #$67
|00D81F| STA.b $0E

.next
|00D821| LDY.b $0E

|00D823| JSR Decompress_sprite_arbitrary

|00D826| LDA.b $01
|00D828| CLC
|00D829| ADC.b #$08
|00D82B| STA.b $01

|00D82D| INC.b $0E

|00D82F| LDA.b $0E
|00D831| CMP.b #$69
|00D833| BNE .next

|00D835| PLB

|00D836| RTL

;===================================================================================================

pool AnimateMirrorWarp

.vector_low
|00D837| db AnimateMirrorWarp_LoadPyramidIfAga
|00D838| db AnimateMirrorWarp_DecompressNewTileSets
|00D839| db AnimateMirrorWarp_DecompressBackgroundsA
|00D83A| db AnimateMirrorWarp_DecompressBackgroundsB
|00D83B| db AnimateMirrorWarp_DecompressBackgroundsC
|00D83C| db AnimateMirrorWarp_TriggerOverlayA_2
|00D83D| db AnimateMirrorWarp_TriggerOverlayB
|00D83E| db AnimateMirrorWarp_DrawDestinationScreen
|00D83F| db AnimateMirrorWarp_DoSpritesPalettes
|00D840| db AnimateMirrorWarp_TriggerOverlayB
|00D841| db AnimateMirrorWarp_DecompressAnimatedTiles
|00D842| db AnimateMirrorWarp_LoadSubscreen
|00D843| db AnimateMirrorWarp_DecompressSpritesA
|00D844| db AnimateMirrorWarp_DecompressSpritesB
|00D845| db AnimateMirrorWarp_TriggerBGChar0

.vector_high
|00D846| db >AnimateMirrorWarp_LoadPyramidIfAga
|00D847| db >AnimateMirrorWarp_DecompressNewTileSets
|00D848| db >AnimateMirrorWarp_DecompressBackgroundsA
|00D849| db >AnimateMirrorWarp_DecompressBackgroundsB
|00D84A| db >AnimateMirrorWarp_DecompressBackgroundsC
|00D84B| db >AnimateMirrorWarp_TriggerOverlayA_2
|00D84C| db >AnimateMirrorWarp_TriggerOverlayB
|00D84D| db >AnimateMirrorWarp_DrawDestinationScreen
|00D84E| db >AnimateMirrorWarp_DoSpritesPalettes
|00D84F| db >AnimateMirrorWarp_TriggerOverlayB
|00D850| db >AnimateMirrorWarp_DecompressAnimatedTiles
|00D851| db >AnimateMirrorWarp_LoadSubscreen
|00D852| db >AnimateMirrorWarp_DecompressSpritesA
|00D853| db >AnimateMirrorWarp_DecompressSpritesB
|00D854| db >AnimateMirrorWarp_TriggerBGChar0

;---------------------------------------------------------------------------------------------------

.next_tilemap
|00D855| db $00
|00D856| db $0E
|00D857| db $0F
|00D858| db $10
|00D859| db $11
|00D85A| db $00
|00D85B| db $00
|00D85C| db $00
|00D85D| db $00
|00D85E| db $00
|00D85F| db $00
|00D860| db $12
|00D861| db $13
|00D862| db $14
|00D863| db $00

endpool

;---------------------------------------------------------------------------------------------------

AnimateMirrorWarp:
|00D864| STZ.b $00

|00D866| LDA.b #$40
|00D868| STA.b $01

|00D86A| LDX.w $0200

|00D86D| LDA.l .next_tilemap,X
|00D871| STA.b $17
|00D873| STA.w $0710

|00D876| LDA.l .vector_low,X
|00D87A| STA.b $0E

|00D87C| LDA.l .vector_high,X
|00D880| STA.b $0F

|00D882| LDX.b #$00

|00D884| LDA.b $8A
|00D886| AND.b #$40
|00D888| BEQ .light_world

|00D88A| LDX.b #$08

.light_world
|00D88C| INC.w $0200

|00D88F| JMP.w ($000E)

;===================================================================================================

AnimateMirrorWarp_LoadPyramidIfAga:
|00D892| INC.w $06BA

|00D895| LDA.w $06BA
|00D898| CMP.b #$20
|00D89A| BEQ .continue

|00D89C| STZ.w $0200

|00D89F| RTL

.continue
|00D8A0| JSL SetTargetOverworldWarpToPyramid

|00D8A4| RTL

;===================================================================================================

AnimateMirrorWarp_TriggerOverlayA_2:
|00D8A5| JSL MirrorWarp_HandleCastlePyramidSubscreen

|00D8A9| DEC.b $11

|00D8AB| LDA.b #$0C
|00D8AD| STA.b $17
|00D8AF| STA.w $0710

|00D8B2| RTL

;===================================================================================================

AnimateMirrorWarp_DrawDestinationScreen:
|00D8B3| JSL DrawScreenAtCurrentMirrorPosition

|00D8B7| INC.w $0710

|00D8BA| RTL

;===================================================================================================

AnimateMirrorWarp_DoSpritesPalettes:
|00D8BB| JSL MirrorWarp_LoadSpritesAndColors

|00D8BF| LDA.b #$0C
|00D8C1| STA.b $17
|00D8C3| STA.w $0710

|00D8C6| RTL

;===================================================================================================

AnimateMirrorWarp_TriggerOverlayB:
|00D8C7| LDA.b #$0D
|00D8C9| STA.b $17
|00D8CB| STA.w $0710

|00D8CE| RTL

;===================================================================================================

AnimateMirrorWarp_TriggerBGChar0:
|00D8CF| LDA.b #$0E
|00D8D1| STA.w $0200

|00D8D4| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressAnimatedTiles:
|00D8D5| LDY.b #$58

|00D8D7| LDA.b $8A
|00D8D9| AND.b #$BF
|00D8DB| CMP.b #$03 ; OW 03, OW 43
|00D8DD| BEQ .not_death_mountain

|00D8DF| CMP.b #$05 ; OW 05, OW 45
|00D8E1| BEQ .not_death_mountain

|00D8E3| CMP.b #$07 ; OW 07, OW 47
|00D8E5| BEQ .not_death_mountain

|00D8E7| LDY.b #$5A

.not_death_mountain
|00D8E9| JSL DecompressAnimatedOverworldTiles

|00D8ED| RTL

;===================================================================================================

SheetsTable_Mirror:
|00D8EE| db $3A
|00D8EF| db $3B
|00D8F0| db $3C
|00D8F1| db $3D
|00D8F2| db $3E
|00D8F3| db $5B

;===================================================================================================

SheetsTable_AA4:
|00D8F4| db $01
|00D8F5| db $5A
|00D8F6| db $42
|00D8F7| db $43
|00D8F8| db $44
|00D8F9| db $45
|00D8FA| db $3F
|00D8FB| db $59
|00D8FC| db $0B
|00D8FD| db $5A

;===================================================================================================

AnimateMirrorWarp_DecompressNewTileSets:
|00D8FE| PHB
|00D8FF| PHK
|00D900| PLB

|00D901| PHX

|00D902| REP #$30

|00D904| LDA.w $0AA1
|00D907| AND.w #$00FF
|00D90A| ASL A
|00D90B| ASL A
|00D90C| ASL A
|00D90D| TAX

|00D90E| LDA.w $0AA2
|00D911| AND.w #$00FF
|00D914| ASL A
|00D915| ASL A
|00D916| TAY

|00D917| SEP #$20

|00D919| LDA.w SheetsTable_AA2+0,Y
|00D91C| BNE .not_default_a

|00D91E| LDA.w SheetsTable_AA1+3,X

.not_default_a
|00D921| STA.l $7EC2F8

|00D925| LDA.w SheetsTable_AA2+1,Y
|00D928| BNE .not_default_b

|00D92A| LDA.w SheetsTable_AA1+4,X

.not_default_b
|00D92D| STA.l $7EC2F9

|00D931| LDA.w SheetsTable_AA2+2,Y
|00D934| BNE .not_default_c

|00D936| LDA.w SheetsTable_AA1+5,X

.not_default_c
|00D939| STA.l $7EC2FA

|00D93D| LDA.w SheetsTable_AA2+3,Y
|00D940| BNE .not_default_d

|00D942| LDA.w SheetsTable_AA1+6,X

.not_default_d
|00D945| STA.l $7EC2FB

;---------------------------------------------------------------------------------------------------

|00D949| REP #$20

|00D94B| LDA.w $0AA3
|00D94E| AND.w #$00FF
|00D951| ASL A
|00D952| ASL A
|00D953| TAY

|00D954| SEP #$20

|00D956| LDA.w SheetsTable_AA3+0,Y
|00D959| BEQ .dont_change_a

|00D95B| STA.l $7EC2FC

.dont_change_a
|00D95F| LDA.w SheetsTable_AA3+1,Y
|00D962| BEQ .dont_change_b

|00D964| STA.l $7EC2FD

.dont_change_b
|00D968| LDA.w SheetsTable_AA3+2,Y
|00D96B| BEQ .dont_change_c

|00D96D| STA.l $7EC2FE

.dont_change_c
|00D971| LDA.w SheetsTable_AA3+3,Y
|00D974| BEQ .dont_change_d

|00D976| STA.l $7EC2FF

;---------------------------------------------------------------------------------------------------

.dont_change_d
|00D97A| SEP #$10

|00D97C| PLX

|00D97D| LDA.l SheetsTable_Mirror+1,X
|00D981| STA.b $08

|00D983| LDA.l SheetsTable_Mirror+0,X
|00D987| TAY

|00D988| LDA.b #$7F
|00D98A| JSR Decompress_background_arbitrary_bank

|00D98D| LDA.b $01
|00D98F| CLC
|00D990| ADC.b #$06
|00D992| STA.b $01

|00D994| LDY.b $08
|00D996| JSR Decompress_background_arbitrary

|00D999| PLB

|00D99A| LDA.b #$7F
|00D99C| STA.b $02
|00D99E| STA.b $05

|00D9A0| REP #$31

|00D9A2| LDX.w #$0000
|00D9A5| LDY.w #$0040
|00D9A8| LDA.w #$4000
|00D9AB| JSR Expand3bppToBuffer_RightPalette

|00D9AE| LDY.w #$0040
|00D9B1| LDA.b $03
|00D9B3| JSR Expand3bppToBuffer_LeftPalette

|00D9B6| SEP #$30

|00D9B8| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsA:
|00D9B9| PHB
|00D9BA| PHK
|00D9BB| PLB

|00D9BC| LDA.l SheetsTable_Mirror+3,X
|00D9C0| STA.b $08

|00D9C2| LDA.l SheetsTable_Mirror+2,X
|00D9C6| TAY

|00D9C7| LDA.b #$7F
|00D9C9| JSR Decompress_background_arbitrary_bank

|00D9CC| LDA.b $01
|00D9CE| CLC
|00D9CF| ADC.b #$06
|00D9D1| STA.b $01

|00D9D3| LDY.b $08
|00D9D5| JSR Decompress_background_arbitrary

|00D9D8| PLB

|00D9D9| LDA.b #$7F
|00D9DB| STA.b $02
|00D9DD| STA.b $05

|00D9DF| REP #$31

|00D9E1| LDX.w #$0000
|00D9E4| LDY.w #$0040
|00D9E7| LDA.w #$4000
|00D9EA| JSR Expand3bppToBuffer_LeftPalette

|00D9ED| LDY.w #$0040
|00D9F0| LDA.b $03
|00D9F2| JSR Expand3bppToBuffer_RightPalette

|00D9F5| SEP #$30

|00D9F7| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsB:
|00D9F8| PHB
|00D9F9| PHK
|00D9FA| PLB

|00D9FB| LDA.l $7EC2F9
|00D9FF| TAY

|00DA00| LDA.b #$7F
|00DA02| JSR Decompress_background_arbitrary_bank

|00DA05| LDA.b $01
|00DA07| CLC
|00DA08| ADC.b #$06
|00DA0A| STA.b $01

|00DA0C| LDA.l $7EC2FA
|00DA10| TAY
|00DA11| JSR Decompress_background_arbitrary

|00DA14| PLB

|00DA15| LDA.b #$7F
|00DA17| STA.b $02
|00DA19| STA.b $05

|00DA1B| REP #$31

|00DA1D| LDX.w #$0000
|00DA20| LDY.w #$0080
|00DA23| LDA.w #$4000
|00DA26| JSR Expand3bppToBuffer_RightPalette

|00DA29| SEP #$30

|00DA2B| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressBackgroundsC:
|00DA2C| PHB
|00DA2D| PHK
|00DA2E| PLB

|00DA2F| LDA.l SheetsTable_Mirror+5,X
|00DA33| STA.b $08

|00DA35| LDA.l SheetsTable_Mirror+4,X
|00DA39| TAY

|00DA3A| LDA.b #$7F
|00DA3C| JSR Decompress_background_arbitrary_bank

|00DA3F| LDA.b $01
|00DA41| CLC
|00DA42| ADC.b #$06
|00DA44| STA.b $01

|00DA46| LDY.b $08
|00DA48| JSR Decompress_background_arbitrary

|00DA4B| PLB

|00DA4C| LDA.b #$7F
|00DA4E| STA.b $02
|00DA50| STA.b $05

|00DA52| REP #$31

|00DA54| LDX.w #$0000
|00DA57| LDY.w #$0080
|00DA5A| LDA.w #$4000
|00DA5D| JSR Expand3bppToBuffer_LeftPalette

|00DA60| SEP #$30

|00DA62| RTL

;===================================================================================================

AnimateMirrorWarp_LoadSubscreen:
|00DA63| STZ.b $1D

|00DA65| LDA.b $8A
|00DA67| BEQ .subscreen

|00DA69| CMP.b #$70 ; OW 70
|00DA6B| BEQ .subscreen

|00DA6D| CMP.b #$40 ; OW 40
|00DA6F| BEQ .subscreen

|00DA71| CMP.b #$5B ; OW 5B
|00DA73| BEQ .subscreen

|00DA75| CMP.b #$03 ; OW 03
|00DA77| BEQ .subscreen

|00DA79| CMP.b #$05 ; OW 05
|00DA7B| BEQ .subscreen

|00DA7D| CMP.b #$07 ; OW 07
|00DA7F| BEQ .subscreen

|00DA81| CMP.b #$43 ; OW 43
|00DA83| BEQ .subscreen

|00DA85| CMP.b #$45 ; OW 45
|00DA87| BEQ .subscreen

|00DA89| CMP.b #$47 ; OW 47
|00DA8B| BNE .no_subscreen

.subscreen
|00DA8D| LDA.b #$01
|00DA8F| STA.b $1D

.no_subscreen
|00DA91| PHB
|00DA92| PHK
|00DA93| PLB

|00DA94| LDA.l SheetsTable_Mirror+6,X
|00DA98| TAY

|00DA99| LDA.w GFXSheetPointers.sprite_low,Y
|00DA9C| STA.b $00

|00DA9E| LDA.w GFXSheetPointers.sprite_high,Y
|00DAA1| STA.b $01

|00DAA3| LDA.w GFXSheetPointers.sprite_bank,Y
|00DAA6| STA.b $02
|00DAA8| STA.b $05

|00DAAA| PLB

|00DAAB| REP #$31

|00DAAD| LDX.w #$0000
|00DAB0| LDY.w #$0040

|00DAB3| LDA.b $00
|00DAB5| JSR Expand3bppToBuffer_RightPalette

|00DAB8| SEP #$30

|00DABA| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressSpritesA:
|00DABB| PHB
|00DABC| PHK
|00DABD| PLB

|00DABE| LDA.l $7EC2FC
|00DAC2| TAY

|00DAC3| LDA.b #$7F
|00DAC5| STA.b $02
|00DAC7| STA.b $05

|00DAC9| JSR Decompress_sprite_arbitrary

|00DACC| LDA.b $01
|00DACE| CLC
|00DACF| ADC.b #$06
|00DAD1| STA.b $01

|00DAD3| LDA.l $7EC2FD
|00DAD7| TAY
|00DAD8| JSR Decompress_sprite_arbitrary

|00DADB| PLB

;---------------------------------------------------------------------------------------------------

|00DADC| LDA.b #$7F
|00DADE| STA.b $02
|00DAE0| STA.b $05

|00DAE2| REP #$31

|00DAE4| LDX.w #$0000
|00DAE7| LDY.w #$0040

|00DAEA| LDA.l $7EC2FC
|00DAEE| CMP.w #$0052
|00DAF1| BEQ .right_side_palette

|00DAF3| CMP.w #$0053
|00DAF6| BEQ .right_side_palette

|00DAF8| CMP.w #$005A
|00DAFB| BEQ .right_side_palette

|00DAFD| CMP.w #$005B
|00DB00| BNE .left_side_palette

.right_side_palette
|00DB02| LDA.w #$4000
|00DB05| JSR Expand3bppToBuffer_RightPalette

|00DB08| BRA .done

.left_side_palette
|00DB0A| LDA.w #$4000
|00DB0D| JSR Expand3bppToBuffer_LeftPalette

.done
|00DB10| LDY.w #$0040
|00DB13| LDA.b $03
|00DB15| JSR Expand3bppToBuffer_LeftPalette

|00DB18| SEP #$30

|00DB1A| RTL

;===================================================================================================

AnimateMirrorWarp_DecompressSpritesB:
|00DB1B| PHB
|00DB1C| PHK
|00DB1D| PLB

|00DB1E| LDA.l $7EC2FE
|00DB22| TAY

|00DB23| LDA.b #$7F
|00DB25| STA.b $02
|00DB27| STA.b $05
|00DB29| JSR Decompress_sprite_arbitrary

|00DB2C| LDA.b $01
|00DB2E| CLC
|00DB2F| ADC.b #$06
|00DB31| STA.b $01

|00DB33| LDA.l $7EC2FF
|00DB37| TAY
|00DB38| JSR Decompress_sprite_arbitrary

|00DB3B| PLB

|00DB3C| LDA.b #$7F
|00DB3E| STA.b $02
|00DB40| STA.b $05

|00DB42| REP #$31

|00DB44| LDX.w #$0000
|00DB47| LDY.w #$0080
|00DB4A| LDA.w #$7F4000
|00DB4D| JSR Expand3bppToBuffer_LeftPalette

|00DB50| SEP #$30

|00DB52| JSL HandleFollowersAfterMirroring

|00DB56| RTL

;===================================================================================================

SheetsTable_AA3:
|00DB57| db $00, $49, $00, $00 ; 0x00
|00DB5B| db $46, $49, $0C, $1D ; 0x01
|00DB5F| db $48, $49, $13, $1D ; 0x02
|00DB63| db $46, $49, $13, $0E ; 0x03
|00DB67| db $48, $49, $0C, $11 ; 0x04
|00DB6B| db $48, $49, $0C, $10 ; 0x05
|00DB6F| db $4F, $49, $4A, $50 ; 0x06
|00DB73| db $0E, $49, $4A, $11 ; 0x07
|00DB77| db $46, $49, $12, $00 ; 0x08
|00DB7B| db $00, $49, $00, $50 ; 0x09
|00DB7F| db $00, $49, $00, $11 ; 0x0A
|00DB83| db $48, $49, $0C, $00 ; 0x0B
|00DB87| db $00, $00, $37, $36 ; 0x0C
|00DB8B| db $48, $49, $4C, $11 ; 0x0D
|00DB8F| db $5D, $2C, $0C, $44 ; 0x0E
|00DB93| db $00, $00, $4E, $00 ; 0x0F
|00DB97| db $0F, $00, $12, $10 ; 0x10
|00DB9B| db $00, $00, $00, $4C ; 0x11
|00DB9F| db $00, $0D, $17, $00 ; 0x12
|00DBA3| db $16, $0D, $17, $1B ; 0x13
|00DBA7| db $16, $0D, $17, $14 ; 0x14
|00DBAB| db $15, $0D, $17, $15 ; 0x15
|00DBAF| db $16, $0D, $18, $19 ; 0x16
|00DBB3| db $16, $0D, $17, $19 ; 0x17
|00DBB7| db $16, $0D, $00, $00 ; 0x18
|00DBBB| db $16, $0D, $18, $1B ; 0x19
|00DBBF| db $0F, $49, $4A, $11 ; 0x1A
|00DBC3| db $4B, $2A, $5C, $15 ; 0x1B
|00DBC7| db $16, $49, $17, $1D ; 0x1C
|00DBCB| db $00, $00, $00, $15 ; 0x1D
|00DBCF| db $16, $0D, $17, $10 ; 0x1E
|00DBD3| db $16, $49, $12, $00 ; 0x1F
|00DBD7| db $16, $49, $0C, $11 ; 0x20
|00DBDB| db $00, $00, $12, $10 ; 0x21
|00DBDF| db $16, $0D, $00, $11 ; 0x22
|00DBE3| db $16, $49, $0C, $00 ; 0x23
|00DBE7| db $16, $0D, $4C, $11 ; 0x24
|00DBEB| db $0E, $0D, $4A, $11 ; 0x25
|00DBEF| db $16, $1A, $17, $1B ; 0x26
|00DBF3| db $4F, $34, $4A, $50 ; 0x27
|00DBF7| db $35, $4D, $65, $36 ; 0x28
|00DBFB| db $4A, $34, $4E, $00 ; 0x29
|00DBFF| db $0E, $34, $4A, $11 ; 0x2A
|00DC03| db $51, $34, $5D, $59 ; 0x2B
|00DC07| db $4B, $49, $4C, $11 ; 0x2C
|00DC0B| db $2D, $00, $00, $00 ; 0x2D
|00DC0F| db $5D, $00, $12, $59 ; 0x2E
|00DC13| db $00, $00, $00, $00 ; 0x2F
|00DC17| db $00, $00, $00, $00 ; 0x30
|00DC1B| db $00, $00, $00, $00 ; 0x31
|00DC1F| db $00, $00, $00, $00 ; 0x32
|00DC23| db $00, $00, $00, $00 ; 0x33
|00DC27| db $00, $00, $00, $00 ; 0x34
|00DC2B| db $00, $00, $00, $00 ; 0x35
|00DC2F| db $00, $00, $00, $00 ; 0x36
|00DC33| db $00, $00, $00, $00 ; 0x37
|00DC37| db $00, $00, $00, $00 ; 0x38
|00DC3B| db $00, $00, $00, $00 ; 0x39
|00DC3F| db $00, $00, $00, $00 ; 0x3A
|00DC43| db $00, $00, $00, $00 ; 0x3B
|00DC47| db $00, $00, $00, $00 ; 0x3C
|00DC4B| db $00, $00, $00, $00 ; 0x3D
|00DC4F| db $00, $00, $00, $00 ; 0x3E
|00DC53| db $00, $00, $00, $00 ; 0x3F
|00DC57| db $47, $49, $2B, $2D ; 0x40 - 0x00 for underworld
|00DC5B| db $46, $49, $1C, $52 ; 0x41 - 0x01 for underworld
|00DC5F| db $00, $49, $1C, $52 ; 0x42 - 0x02 for underworld
|00DC63| db $5D, $49, $00, $52 ; 0x43 - 0x03 for underworld
|00DC67| db $46, $49, $13, $52 ; 0x44 - 0x04 for underworld
|00DC6B| db $4B, $4D, $4A, $5A ; 0x45 - 0x05 for underworld
|00DC6F| db $47, $49, $1C, $52 ; 0x46 - 0x06 for underworld
|00DC73| db $4B, $4D, $39, $36 ; 0x47 - 0x07 for underworld
|00DC77| db $1F, $2C, $2E, $52 ; 0x48 - 0x08 for underworld
|00DC7B| db $1F, $2C, $2E, $1D ; 0x49 - 0x09 for underworld
|00DC7F| db $2F, $2C, $2E, $52 ; 0x4A - 0x0A for underworld
|00DC83| db $2F, $2C, $2E, $31 ; 0x4B - 0x0B for underworld
|00DC87| db $1F, $1E, $30, $52 ; 0x4C - 0x0C for underworld
|00DC8B| db $51, $49, $13, $00 ; 0x4D - 0x0D for underworld
|00DC8F| db $4F, $49, $13, $50 ; 0x4E - 0x0E for underworld
|00DC93| db $4F, $4D, $4A, $50 ; 0x4F - 0x0F for underworld
|00DC97| db $4B, $49, $4C, $2B ; 0x50 - 0x10 for underworld
|00DC9B| db $1F, $20, $22, $53 ; 0x51 - 0x11 for underworld
|00DC9F| db $55, $3D, $42, $43 ; 0x52 - 0x12 for underworld
|00DCA3| db $1F, $1E, $23, $52 ; 0x53 - 0x13 for underworld
|00DCA7| db $1F, $1E, $39, $3A ; 0x54 - 0x14 for underworld
|00DCAB| db $1F, $1E, $3A, $3E ; 0x55 - 0x15 for underworld
|00DCAF| db $1F, $1E, $3C, $3D ; 0x56 - 0x16 for underworld
|00DCB3| db $40, $1E, $27, $3F ; 0x57 - 0x17 for underworld
|00DCB7| db $55, $1A, $42, $43 ; 0x58 - 0x18 for underworld
|00DCBB| db $1F, $1E, $2A, $52 ; 0x59 - 0x19 for underworld
|00DCBF| db $1F, $1E, $38, $52 ; 0x5A - 0x1A for underworld
|00DCC3| db $1F, $20, $28, $52 ; 0x5B - 0x1B for underworld
|00DCC7| db $1F, $20, $26, $52 ; 0x5C - 0x1C for underworld
|00DCCB| db $1F, $2C, $25, $52 ; 0x5D - 0x1D for underworld
|00DCCF| db $1F, $20, $27, $52 ; 0x5E - 0x1E for underworld
|00DCD3| db $1F, $1E, $29, $52 ; 0x5F - 0x1F for underworld
|00DCD7| db $1F, $2C, $3B, $52 ; 0x60 - 0x20 for underworld
|00DCDB| db $46, $49, $24, $52 ; 0x61 - 0x21 for underworld
|00DCDF| db $21, $41, $45, $33 ; 0x62 - 0x22 for underworld
|00DCE3| db $1F, $2C, $28, $31 ; 0x63 - 0x23 for underworld
|00DCE7| db $1F, $0D, $29, $52 ; 0x64 - 0x24 for underworld
|00DCEB| db $1F, $1E, $27, $52 ; 0x65 - 0x25 for underworld
|00DCEF| db $1F, $20, $27, $53 ; 0x66 - 0x26 for underworld
|00DCF3| db $48, $49, $13, $52 ; 0x67 - 0x27 for underworld
|00DCF7| db $0E, $1E, $4A, $50 ; 0x68 - 0x28 for underworld
|00DCFB| db $1F, $20, $26, $53 ; 0x69 - 0x29 for underworld
|00DCFF| db $15, $00, $00, $00 ; 0x6A - 0x2A for underworld
|00DD03| db $1F, $00, $2A, $52 ; 0x6B - 0x2B for underworld
|00DD07| db $00, $00, $00, $00 ; 0x6C - 0x2C for underworld
|00DD0B| db $00, $00, $00, $00 ; 0x6D - 0x2D for underworld
|00DD0F| db $00, $00, $00, $00 ; 0x6E - 0x2E for underworld
|00DD13| db $00, $00, $00, $00 ; 0x6F - 0x2F for underworld
|00DD17| db $00, $00, $00, $00 ; 0x70 - 0x30 for underworld
|00DD1B| db $00, $00, $00, $00 ; 0x71 - 0x31 for underworld
|00DD1F| db $00, $00, $00, $00 ; 0x72 - 0x32 for underworld
|00DD23| db $00, $00, $00, $00 ; 0x73 - 0x33 for underworld
|00DD27| db $00, $00, $00, $00 ; 0x74 - 0x34 for underworld
|00DD2B| db $00, $00, $00, $00 ; 0x75 - 0x35 for underworld
|00DD2F| db $00, $00, $00, $00 ; 0x76 - 0x36 for underworld
|00DD33| db $00, $00, $00, $00 ; 0x77 - 0x37 for underworld
|00DD37| db $00, $00, $00, $00 ; 0x78 - 0x38 for underworld
|00DD3B| db $00, $00, $00, $00 ; 0x79 - 0x39 for underworld
|00DD3F| db $00, $00, $00, $00 ; 0x7A - 0x3A for underworld
|00DD43| db $00, $00, $00, $00 ; 0x7B - 0x3B for underworld
|00DD47| db $00, $00, $00, $00 ; 0x7C - 0x3C for underworld
|00DD4B| db $32, $00, $00, $08 ; 0x7D - 0x3D for underworld
|00DD4F| db $5D, $49, $00, $52 ; 0x7E - 0x3E for underworld
|00DD53| db $55, $49, $42, $43 ; 0x7F - 0x3F for underworld
|00DD57| db $61, $62, $63, $50 ; 0x80 - 0x40 for underworld
|00DD5B| db $61, $62, $63, $50 ; 0x81 - 0x41 for underworld
|00DD5F| db $61, $62, $63, $50 ; 0x82 - 0x42 for underworld
|00DD63| db $61, $62, $63, $50 ; 0x83 - 0x43 for underworld
|00DD67| db $61, $62, $63, $50 ; 0x84 - 0x44 for underworld
|00DD6B| db $61, $62, $63, $50 ; 0x85 - 0x45 for underworld
|00DD6F| db $61, $56, $57, $50 ; 0x86 - 0x46 for underworld
|00DD73| db $61, $62, $63, $50 ; 0x87 - 0x47 for underworld
|00DD77| db $61, $62, $63, $50 ; 0x88 - 0x48 for underworld
|00DD7B| db $61, $56, $57, $50 ; 0x89 - 0x49 for underworld
|00DD7F| db $61, $56, $63, $50 ; 0x8A - 0x4A for underworld
|00DD83| db $61, $56, $57, $50 ; 0x8B - 0x4B for underworld
|00DD87| db $61, $56, $33, $50 ; 0x8C - 0x4C for underworld
|00DD8B| db $61, $56, $57, $50 ; 0x8D - 0x4D for underworld
|00DD8F| db $61, $62, $63, $50 ; 0x8E - 0x4E for underworld
|00DD93| db $61, $62, $63, $50 ; 0x8F - 0x4F for underworld

;===================================================================================================

SheetsTable_AA2:
|00DD97| db $06, $00, $1F, $18 ; 0x00
|00DD9B| db $08, $00, $22, $1B ; 0x01
|00DD9F| db $06, $00, $1F, $18 ; 0x02
|00DDA3| db $07, $00, $23, $1C ; 0x03
|00DDA7| db $07, $00, $21, $18 ; 0x04
|00DDAB| db $09, $00, $20, $19 ; 0x05
|00DDAF| db $0B, $00, $21, $1A ; 0x06
|00DDB3| db $0C, $00, $24, $19 ; 0x07
|00DDB7| db $08, $00, $22, $1B ; 0x08
|00DDBB| db $0C, $00, $25, $1B ; 0x09
|00DDBF| db $0C, $00, $26, $1B ; 0x0A
|00DDC3| db $0A, $00, $27, $1D ; 0x0B
|00DDC7| db $0A, $00, $28, $1E ; 0x0C
|00DDCB| db $0B, $00, $29, $16 ; 0x0D
|00DDCF| db $0D, $00, $2A, $18 ; 0x0E
|00DDD3| db $07, $00, $23, $1C ; 0x0F
|00DDD7| db $07, $00, $04, $05 ; 0x10
|00DDDB| db $07, $00, $04, $05 ; 0x11
|00DDDF| db $09, $00, $20, $1B ; 0x12
|00DDE3| db $09, $00, $2A, $17 ; 0x13
|00DDE7| db $0B, $00, $21, $1C ; 0x14
|00DDEB| db $09, $00, $20, $19 ; 0x15
|00DDEF| db $0B, $00, $21, $1A ; 0x16
|00DDF3| db $09, $00, $24, $1B ; 0x17
|00DDF7| db $08, $00, $22, $1B ; 0x18
|00DDFB| db $09, $00, $25, $1B ; 0x19
|00DDFF| db $09, $00, $26, $1B ; 0x1A
|00DE03| db $0A, $00, $27, $1D ; 0x1B
|00DE07| db $09, $00, $28, $1E ; 0x1C
|00DE0B| db $0C, $00, $29, $16 ; 0x1D
|00DE0F| db $0D, $00, $2A, $17 ; 0x1E
|00DE13| db $72, $00, $2B, $5D ; 0x1F

|00DE17| db $00, $00, $00, $00 ; 0x20
|00DE1B| db $00, $57, $4C, $00 ; 0x21
|00DE1F| db $00, $56, $4F, $00 ; 0x22
|00DE23| db $00, $53, $4D, $00 ; 0x23
|00DE27| db $00, $52, $49, $00 ; 0x24
|00DE2B| db $00, $55, $4A, $00 ; 0x25
|00DE2F| db $00, $53, $54, $00 ; 0x26
|00DE33| db $00, $51, $4E, $00 ; 0x27
|00DE37| db $00, $00, $00, $00 ; 0x28
|00DE3B| db $00, $50, $4B, $00 ; 0x29
|00DE3F| db $00, $53, $4D, $00 ; 0x2A
|00DE43| db $00, $55, $54, $00 ; 0x2B
|00DE47| db $00, $00, $00, $00 ; 0x2C
|00DE4B| db $00, $00, $00, $00 ; 0x2D
|00DE4F| db $00, $00, $00, $00 ; 0x2E
|00DE53| db $00, $47, $48, $00 ; 0x2F
|00DE57| db $00, $00, $00, $00 ; 0x30
|00DE5B| db $00, $57, $4C, $00 ; 0x31
|00DE5F| db $00, $56, $4F, $00 ; 0x32
|00DE63| db $00, $53, $4D, $00 ; 0x33
|00DE67| db $00, $52, $49, $00 ; 0x34
|00DE6B| db $00, $55, $4A, $00 ; 0x35
|00DE6F| db $00, $53, $54, $00 ; 0x36
|00DE73| db $00, $51, $4E, $00 ; 0x37
|00DE77| db $00, $00, $00, $00 ; 0x38
|00DE7B| db $00, $50, $4B, $00 ; 0x39
|00DE7F| db $00, $53, $00, $00 ; 0x3A
|00DE83| db $00, $35, $36, $00 ; 0x3B
|00DE87| db $00, $60, $34, $00 ; 0x3C
|00DE8B| db $00, $2B, $2C, $00 ; 0x3D
|00DE8F| db $00, $2D, $2E, $00 ; 0x3E
|00DE93| db $00, $2F, $30, $00 ; 0x3F
|00DE97| db $00, $37, $38, $00 ; 0x40
|00DE9B| db $00, $33, $34, $00 ; 0x41
|00DE9F| db $00, $31, $32, $00 ; 0x42
|00DEA3| db $00, $00, $00, $00 ; 0x43
|00DEA7| db $00, $00, $00, $00 ; 0x44
|00DEAB| db $00, $00, $00, $00 ; 0x45
|00DEAF| db $00, $00, $00, $00 ; 0x46
|00DEB3| db $00, $00, $00, $00 ; 0x47
|00DEB7| db $00, $00, $00, $00 ; 0x48
|00DEBB| db $00, $00, $00, $00 ; 0x49
|00DEBF| db $00, $00, $00, $00 ; 0x4A
|00DEC3| db $00, $00, $00, $00 ; 0x4B
|00DEC7| db $00, $00, $00, $00 ; 0x4C
|00DECB| db $00, $00, $00, $00 ; 0x4D
|00DECF| db $00, $00, $00, $00 ; 0x4E
|00DED3| db $00, $00, $00, $00 ; 0x4F
|00DED7| db $72, $71, $72, $71 ; 0x50
|00DEDB| db $17, $40, $41, $39 ; 0x51

;===================================================================================================

pool IncrementalVRAMUpload

.vram_address_high
|00DEDF| db $50 ; VRAM $A000
|00DEE0| db $51 ; VRAM $A200
|00DEE1| db $52 ; VRAM $A400
|00DEE2| db $53 ; VRAM $A600
|00DEE3| db $54 ; VRAM $A800
|00DEE4| db $55 ; VRAM $AA00
|00DEE5| db $56 ; VRAM $AC00
|00DEE6| db $57 ; VRAM $AE00
|00DEE7| db $58 ; VRAM $B000
|00DEE8| db $59 ; VRAM $B200
|00DEE9| db $5A ; VRAM $B400
|00DEEA| db $5B ; VRAM $B600
|00DEEB| db $5C ; VRAM $B800
|00DEEC| db $5D ; VRAM $BA00
|00DEED| db $5E ; VRAM $BC00
|00DEEE| db $5F ; VRAM $BE00

;---------------------------------------------------------------------------------------------------

.buffer_address_high
|00DEEF| db >$7F0000 ; $50
|00DEF0| db >$7F0200 ; $51
|00DEF1| db >$7F0400 ; $52
|00DEF2| db >$7F0600 ; $53
|00DEF3| db >$7F0800 ; $54
|00DEF4| db >$7F0A00 ; $55
|00DEF5| db >$7F0C00 ; $56
|00DEF6| db >$7F0E00 ; $57
|00DEF7| db >$7F1000 ; $58
|00DEF8| db >$7F1200 ; $59
|00DEF9| db >$7F1400 ; $5A
|00DEFA| db >$7F1600 ; $5B
|00DEFB| db >$7F1800 ; $5C
|00DEFC| db >$7F1A00 ; $5D
|00DEFD| db >$7F1C00 ; $5E
|00DEFE| db >$7F1E00 ; $5F

endpool

;---------------------------------------------------------------------------------------------------

IncrementalVRAMUpload:
|00DEFF| LDX.w $0412
|00DF02| CPX.b #$10
|00DF04| BEQ .exit

|00DF06| LDA.l .vram_address_high,X
|00DF0A| STA.b $19

|00DF0C| STZ.w $0118

|00DF0F| LDA.l .buffer_address_high,X
|00DF13| STA.w $0119

|00DF16| INC.w $0412

.exit
|00DF19| RTL

;===================================================================================================

PrepTransAuxGfx:
|00DF1A| LDA.b #$7E
|00DF1C| STA.b $02
|00DF1E| STA.b $05

|00DF20| REP #$31

|00DF22| LDX.w #$0000
|00DF25| LDY.w #$0040
|00DF28| LDA.w #$7E6000
|00DF2B| JSR Expand3bppToBuffer_RightPalette

|00DF2E| LDY.w #$00C0

|00DF31| LDA.w $0AA2
|00DF34| AND.w #$00FF
|00DF37| CMP.w #$0020
|00DF3A| BCC .left_side_palettes

|00DF3C| LDY.w #$0080

|00DF3F| LDA.b $03
|00DF41| JSR Expand3bppToBuffer_RightPalette

|00DF44| LDY.w #$0040

.left_side_palettes
|00DF47| LDA.b $03
|00DF49| JSR Expand3bppToBuffer_LeftPalette

|00DF4C| SEP #$30

|00DF4E| RTL

;===================================================================================================

Expand3bppToBuffer_RightPalette:
|00DF4F| STY.b $0C

.next_tile
|00DF51| STA.b $00

|00DF53| CLC
|00DF54| ADC.w #$0010
|00DF57| STA.b $03

|00DF59| LDY.w #$0003

.next_convert
|00DF5C| LDA.b [$00]
|00DF5E| STA.l $7F0000,X

|00DF62| XBA
|00DF63| ORA.b [$00]
|00DF65| AND.w #$00FF
|00DF68| STA.b $08

|00DF6A| INC.b $00
|00DF6C| INC.b $00

|00DF6E| LDA.b [$03]
|00DF70| AND.w #$00FF
|00DF73| STA.b $0A

|00DF75| ORA.b $08
|00DF77| XBA
|00DF78| ORA.b $0A
|00DF7A| STA.l $7F0010,X

|00DF7E| INC.b $03

|00DF80| INX
|00DF81| INX

|00DF82| LDA.b [$00]
|00DF84| STA.l $7F0000,X

|00DF88| XBA
|00DF89| ORA.b [$00]
|00DF8B| AND.w #$00FF
|00DF8E| STA.b $08

|00DF90| INC.b $00
|00DF92| INC.b $00

|00DF94| LDA.b [$03]
|00DF96| AND.w #$00FF
|00DF99| STA.b $0A

|00DF9B| ORA.b $08
|00DF9D| XBA
|00DF9E| ORA.b $0A
|00DFA0| STA.l $7F0010,X

|00DFA4| INC.b $03

|00DFA6| INX
|00DFA7| INX

|00DFA8| DEY
|00DFA9| BPL .next_convert

|00DFAB| TXA
|00DFAC| CLC
|00DFAD| ADC.w #$0010
|00DFB0| TAX

|00DFB1| LDA.b $03

|00DFB3| DEC.b $0C
|00DFB5| BNE .next_tile

|00DFB7| RTS

;===================================================================================================

Expand3bppToBuffer_LeftPalette:
|00DFB8| STY.b $0C

.next_tile
|00DFBA| STA.b $00

|00DFBC| CLC
|00DFBD| ADC.w #$0010
|00DFC0| STA.b $03

|00DFC2| LDY.w #$0001

.next_convert
|00DFC5| LDA.b [$00]
|00DFC7| STA.l $7F0000,X

|00DFCB| INC.b $00
|00DFCD| INC.b $00

|00DFCF| LDA.b [$03]
|00DFD1| AND.w #$00FF
|00DFD4| STA.l $7F0010,X

|00DFD8| INC.b $03

|00DFDA| INX
|00DFDB| INX

|00DFDC| LDA.b [$00]
|00DFDE| STA.l $7F0000,X

|00DFE2| INC.b $00
|00DFE4| INC.b $00

|00DFE6| LDA.b [$03]
|00DFE8| AND.w #$00FF
|00DFEB| STA.l $7F0010,X

|00DFEF| INC.b $03

|00DFF1| INX
|00DFF2| INX

|00DFF3| LDA.b [$00]
|00DFF5| STA.l $7F0000,X

|00DFF9| INC.b $00
|00DFFB| INC.b $00

|00DFFD| LDA.b [$03]
|00DFFF| AND.w #$00FF
|00E002| STA.l $7F0010,X

|00E006| INC.b $03

|00E008| INX
|00E009| INX

|00E00A| LDA.b [$00]
|00E00C| STA.l $7F0000,X

|00E010| INC.b $00
|00E012| INC.b $00

|00E014| LDA.b [$03]
|00E016| AND.w #$00FF
|00E019| STA.l $7F0010,X

|00E01D| INC.b $03

|00E01F| INX
|00E020| INX

|00E021| DEY
|00E022| BPL .next_convert

|00E024| TXA
|00E025| CLC
|00E026| ADC.w #$0010
|00E029| TAX

|00E02A| LDA.b $03

|00E02C| DEC.b $0C
|00E02E| BNE .next_tile

|00E030| RTS

;===================================================================================================

LoadNewSpriteGFXSet:
|00E031| LDA.b #$7E
|00E033| STA.b $02
|00E035| STA.b $05

|00E037| REP #$31

|00E039| LDX.w #$0000

|00E03C| LDA.w #$7E7800
|00E03F| LDY.w #$00C0
|00E042| JSR Expand3bppToBuffer_LeftPalette

|00E045| LDY.w #$0040

|00E048| LDA.l $7EC2FF
|00E04C| AND.w #$00FF
|00E04F| CMP.w #$0052
|00E052| BEQ .right_side

|00E054| CMP.w #$0053
|00E057| BEQ .right_side

|00E059| CMP.w #$005A
|00E05C| BEQ .right_side

|00E05E| CMP.w #$005B
|00E061| BNE .left_side

.right_side
|00E063| LDA.b $03
|00E065| JSR Expand3bppToBuffer_RightPalette

|00E068| SEP #$30

|00E06A| RTL

.left_side
|00E06B| LDA.b $03
|00E06D| JSR Expand3bppToBuffer_LeftPalette

|00E070| SEP #$30

|00E072| RTL

;===================================================================================================

SheetsTable_AA1:
; Underworld
|00E073| db $00, $01, $10, $06, $0E, $1F, $18, $0F ; 0x00
|00E07B| db $00, $01, $10, $08, $0E, $22, $1B, $0F ; 0x01
|00E083| db $00, $01, $10, $06, $0E, $1F, $18, $0F ; 0x02
|00E08B| db $00, $01, $13, $07, $0E, $23, $1C, $0F ; 0x03
|00E093| db $00, $01, $10, $07, $0E, $21, $18, $0F ; 0x04
|00E09B| db $00, $01, $10, $09, $0E, $20, $19, $0F ; 0x05
|00E0A3| db $02, $03, $12, $0B, $0E, $21, $1A, $0F ; 0x06
|00E0AB| db $00, $01, $11, $0C, $0E, $24, $1B, $0F ; 0x07
|00E0B3| db $00, $01, $11, $08, $0E, $22, $1B, $0F ; 0x08
|00E0BB| db $00, $01, $11, $0C, $0E, $25, $1A, $0F ; 0x09
|00E0C3| db $00, $01, $11, $0C, $0E, $26, $1B, $0F ; 0x0A
|00E0CB| db $00, $01, $14, $0A, $0E, $27, $1D, $0F ; 0x0B
|00E0D3| db $00, $01, $11, $0A, $0E, $28, $1E, $0F ; 0x0C
|00E0DB| db $02, $03, $12, $0B, $0E, $29, $16, $0F ; 0x0D
|00E0E3| db $00, $01, $15, $0D, $0E, $2A, $18, $0F ; 0x0E
|00E0EB| db $00, $01, $10, $07, $0E, $23, $1C, $0F ; 0x0F
|00E0F3| db $00, $01, $13, $07, $0E, $04, $05, $0F ; 0x10
|00E0FB| db $00, $01, $13, $07, $0E, $04, $05, $0F ; 0x11
|00E103| db $00, $01, $10, $09, $0E, $20, $1B, $0F ; 0x12
|00E10B| db $00, $01, $10, $09, $0E, $2A, $17, $0F ; 0x13
|00E113| db $02, $03, $12, $0B, $0E, $21, $1C, $0F ; 0x14

|00E11B| db $00, $08, $11, $1B, $22, $2E, $5D, $5B ; 0x15
|00E123| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x16
|00E12B| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x17

; Overworld
|00E133| db $3A, $3B, $3C, $3D, $53, $4D, $3E, $5B ; 0x18
|00E13B| db $42, $43, $44, $45, $20, $2B, $3F, $5D ; 0x19
|00E143| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1A
|00E14B| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1B
|00E153| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1C
|00E15B| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1D
|00E163| db $00, $08, $10, $18, $20, $2B, $5D, $5B ; 0x1E
|00E16B| db $71, $72, $71, $72, $20, $2B, $5D, $5B ; 0x1F
|00E173| db $3A, $3B, $3C, $3D, $53, $4D, $3E, $5B ; 0x20
|00E17B| db $42, $43, $44, $45, $20, $2B, $3F, $59 ; 0x21
|00E183| db $00, $72, $71, $72, $20, $2B, $5D, $0F ; 0x22
|00E18B| db $16, $39, $1D, $17, $40, $41, $39, $1E ; 0x23
|00E193| db $00, $46, $39, $72, $40, $41, $39, $0F ; 0x24

;===================================================================================================

InitializeTilesets:
|00E19B| PHB
|00E19C| PHK
|00E19D| PLB

|00E19E| LDA.b #$80
|00E1A0| STA.w VMAIN

|00E1A3| STZ.w VMADDL

|00E1A6| LDA.b #$44 ; VRAM $8800
|00E1A8| STA.w VMADDH

|00E1AB| JSR LoadCommonSprites

|00E1AE| REP #$30

|00E1B0| LDA.w $0AA3
|00E1B3| AND.w #$00FF
|00E1B6| ASL A
|00E1B7| ASL A
|00E1B8| TAY

|00E1B9| SEP #$20

|00E1BB| LDA.w SheetsTable_AA3+0,Y
|00E1BE| BEQ .dont_change_a

|00E1C0| STA.l $7EC2FC

.dont_change_a
|00E1C4| LDA.l $7EC2FC
|00E1C8| STA.b $09

|00E1CA| LDA.w SheetsTable_AA3+1,Y
|00E1CD| BEQ .dont_change_b

|00E1CF| STA.l $7EC2FD

.dont_change_b
|00E1D3| LDA.l $7EC2FD
|00E1D7| STA.b $08

|00E1D9| LDA.w SheetsTable_AA3+2,Y
|00E1DC| BEQ .dont_change_c

|00E1DE| STA.l $7EC2FE

.dont_change_c
|00E1E2| LDA.l $7EC2FE
|00E1E6| STA.b $07

|00E1E8| LDA.w SheetsTable_AA3+3,Y
|00E1EB| BEQ .dont_change_d

|00E1ED| STA.l $7EC2FF

.dont_change_d
|00E1F1| LDA.l $7EC2FF
|00E1F5| STA.b $06

|00E1F7| SEP #$10

|00E1F9| LDY.b $09

|00E1FB| LDA.b #$7E
|00E1FD| STA.b $02

|00E1FF| LDX.b #$78
|00E201| JSR LoadSpriteGraphics

|00E204| LDY.b $08
|00E206| LDX.b #$7E
|00E208| JSR LoadSpriteGraphics

|00E20B| LDY.b $07
|00E20D| LDX.b #$84
|00E20F| JSR LoadSpriteGraphics

|00E212| LDY.b $06
|00E214| LDX.b #$8A
|00E216| JSR LoadSpriteGraphics

;---------------------------------------------------------------------------------------------------

|00E219| REP #$30

|00E21B| LDA.w #$2000 ; VRAM $4000
|00E21E| STA.w VMADDR

|00E221| LDA.w $0AA1
|00E224| AND.w #$00FF
|00E227| ASL A
|00E228| ASL A
|00E229| ASL A
|00E22A| TAY

|00E22B| LDA.w $0AA2
|00E22E| AND.w #$00FF
|00E231| ASL A
|00E232| ASL A
|00E233| TAX

|00E234| SEP #$20

|00E236| LDA.w SheetsTable_AA1+0,Y
|00E239| STA.b $0D

|00E23B| LDA.w SheetsTable_AA1+1,Y
|00E23E| STA.b $0C

|00E240| LDA.w SheetsTable_AA1+2,Y
|00E243| STA.b $0B

|00E245| LDA.w SheetsTable_AA2+0,X
|00E248| BNE .not_default_a

|00E24A| LDA.w SheetsTable_AA1+3,Y

.not_default_a
|00E24D| STA.l $7EC2F8
|00E251| STA.b $0A

|00E253| LDA.w SheetsTable_AA2+1,X
|00E256| BNE .not_default_b

|00E258| LDA.w SheetsTable_AA1+4,Y

.not_default_b
|00E25B| STA.l $7EC2F9
|00E25F| STA.b $09

|00E261| LDA.w SheetsTable_AA2+2,X
|00E264| BNE .not_default_c

|00E266| LDA.w SheetsTable_AA1+5,Y

.not_default_c
|00E269| STA.l $7EC2FA
|00E26D| STA.b $08

|00E26F| LDA.w SheetsTable_AA2+3,X
|00E272| BNE .not_default_d

|00E274| LDA.w SheetsTable_AA1+6,Y

.not_default_d
|00E277| STA.l $7EC2FB
|00E27B| STA.b $07

|00E27D| LDA.w SheetsTable_AA1+7,Y
|00E280| STA.b $06

|00E282| SEP #$10

|00E284| LDA.b #$07
|00E286| STA.b $0F

|00E288| LDY.b $0D
|00E28A| JSR LoadBackgroundGraphics

|00E28D| DEC.b $0F

|00E28F| LDY.b $0C
|00E291| JSR LoadBackgroundGraphics

|00E294| DEC.b $0F

|00E296| LDY.b $0B
|00E298| JSR LoadBackgroundGraphics

|00E29B| DEC.b $0F

|00E29D| LDY.b $0A
|00E29F| LDA.b #$7E
|00E2A1| LDX.b #$60
|00E2A3| JSR LoadBackgroundGraphics.arbitrary

|00E2A6| DEC.b $0F

|00E2A8| LDY.b $09
|00E2AA| LDA.b #$7E
|00E2AC| LDX.b #$66
|00E2AE| JSR LoadBackgroundGraphics.arbitrary

|00E2B1| DEC.b $0F

|00E2B3| LDY.b $08
|00E2B5| LDA.b #$7E
|00E2B7| LDX.b #$6C
|00E2B9| JSR LoadBackgroundGraphics.arbitrary

|00E2BC| DEC.b $0F

|00E2BE| LDY.b $07
|00E2C0| LDA.b #$7E
|00E2C2| LDX.b #$72
|00E2C4| JSR LoadBackgroundGraphics.arbitrary

|00E2C7| DEC.b $0F

|00E2C9| LDY.b $06
|00E2CB| JSR LoadBackgroundGraphics

|00E2CE| PLB

|00E2CF| RTL

;===================================================================================================

LoadDefaultGraphics:
|00E2D0| PHB
|00E2D1| PHK
|00E2D2| PLB

|00E2D3| LDA.b #$80
|00E2D5| STA.w VMAIN

|00E2D8| LDA.w GFXSheetPointers.sprite_bank
|00E2DB| STA.b $02

|00E2DD| LDA.w GFXSheetPointers.sprite_high
|00E2E0| STA.b $01

|00E2E2| LDA.w GFXSheetPointers.sprite_low
|00E2E5| STA.b $00

|00E2E7| REP #$20

|00E2E9| LDA.w #$4000 ; VRAM $8000
|00E2EC| STA.w VMADDR

|00E2EF| LDY.b #$40

;---------------------------------------------------------------------------------------------------

.next_tile
|00E2F1| LDX.b #$0E

.next_planes_a
|00E2F3| LDA.b [$00]
|00E2F5| STA.w VMDATA

|00E2F8| XBA
|00E2F9| ORA.b [$00]
|00E2FB| AND.w #$00FF
|00E2FE| STA.b $BF,X

|00E300| INC.b $00
|00E302| INC.b $00

|00E304| DEX
|00E305| DEX
|00E306| BPL .next_planes_a

|00E308| LDX.b #$0E

.next_planes_b
|00E30A| LDA.b [$00]
|00E30C| AND.w #$00FF
|00E30F| STA.b $BD

|00E311| ORA.b $BF,X
|00E313| XBA
|00E314| ORA.b $BD
|00E316| STA.w VMDATA

|00E319| INC.b $00

|00E31B| DEX
|00E31C| DEX
|00E31D| BPL .next_planes_b

|00E31F| DEY
|00E320| BNE .next_tile

;---------------------------------------------------------------------------------------------------

|00E322| LDA.w #$7000 ; VRAM $E000
|00E325| STA.w VMADDR

|00E328| SEP #$20

|00E32A| LDY.b #$6A
|00E32C| JSR DecompressAndCopyManually

|00E32F| LDY.b #$6B
|00E331| JSR DecompressAndCopyManually

|00E334| LDY.b #$69
|00E336| JSR DecompressAndCopyManually

|00E339| PLB

|00E33A| RTL

;===================================================================================================

DecompressAndCopyManually:
|00E33B| JSR Decompress_sprite_low

|00E33E| REP #$30

|00E340| LDX.w #$00FF

.copy_next
|00E343| LDA.b [$00]
|00E345| STA.w VMDATA

|00E348| INC.b $00
|00E34A| INC.b $00

|00E34C| LDA.b [$00]
|00E34E| STA.w VMDATA

|00E351| INC.b $00
|00E353| INC.b $00

|00E355| LDA.b [$00]
|00E357| STA.w VMDATA

|00E35A| INC.b $00
|00E35C| INC.b $00

|00E35E| LDA.b [$00]
|00E360| STA.w VMDATA

|00E363| INC.b $00
|00E365| INC.b $00

|00E367| DEX
|00E368| BPL .copy_next

|00E36A| SEP #$30

|00E36C| RTS

;===================================================================================================

TransferAttractPlaques:
|00E36D| PHB
|00E36E| PHK
|00E36F| PLB

|00E370| LDA.b #$80
|00E372| STA.w VMAIN
|00E375| STZ.w VMADDL

|00E378| LDA.b #$78 ; VRAM $F000
|00E37A| STA.w VMADDH

|00E37D| LDY.b #$67
|00E37F| JSR DecompressAndCopyManually

|00E382| PLB

|00E383| RTL

;===================================================================================================

LoadCommonSprites_long:
|00E384| PHB
|00E385| PHK
|00E386| PLB

|00E387| LDA.b #$80
|00E389| STA.w VMAIN

|00E38C| STZ.w VMADDL

|00E38F| LDA.b #$44 ; VRAM $8800
|00E391| STA.w VMADDH

|00E394| JSR LoadCommonSprites

|00E397| PLB

|00E398| RTL

;===================================================================================================

TransferMode7Characters:
|00E399| LDA.b #^WorldMap_Mode7TileGFX
|00E39B| STA.b $02

|00E39D| LDA.b #$80
|00E39F| STA.w VMAIN

|00E3A2| STZ.w VMADDL ; VRAM $0000
|00E3A5| STZ.w VMADDH

|00E3A8| REP #$10

|00E3AA| LDY.w #WorldMap_Mode7TileGFX
|00E3AD| STY.b $00

;---------------------------------------------------------------------------------------------------

|00E3AF| LDY.w #$0000

.next
|00E3B2| LDA.b [$00],Y
|00E3B4| STA.w VMDATAH

|00E3B7| INY
|00E3B8| LDA.b [$00],Y
|00E3BA| STA.w VMDATAH

|00E3BD| INY
|00E3BE| LDA.b [$00],Y
|00E3C0| STA.w VMDATAH

|00E3C3| INY
|00E3C4| LDA.b [$00],Y
|00E3C6| STA.w VMDATAH

|00E3C9| INY
|00E3CA| CPY.w #$4000
|00E3CD| BNE .next

|00E3CF| SEP #$10

;---------------------------------------------------------------------------------------------------

#EXIT_00E3D1:
|00E3D1| RTL

;===================================================================================================

pool LoadChrHalfSlot

.sheet_id
|00E3D2| db $01 ; 0x74 - Overworld common
|00E3D3| db $01 ; 0x74 - Overworld common
|00E3D4| db $08 ; 0x7B - Intro
|00E3D5| db $08 ; 0x7B - Intro
|00E3D6| db $09 ; 0x7C - Unused
|00E3D7| db $09 ; 0x7C - Unused
|00E3D8| db $02 ; 0x75 - Ether
|00E3D9| db $02 ; 0x75 - Ether
|00E3DA| db $02 ; 0x75 - Ether
|00E3DB| db $02 ; 0x75 - Ether
|00E3DC| db $03 ; 0x76 - Bombos
|00E3DD| db $03 ; 0x76 - Bombos
|00E3DE| db $04 ; 0x77 - Quake
|00E3DF| db $04 ; 0x77 - Quake
|00E3E0| db $05 ; 0x78 - Game over
|00E3E1| db $05 ; 0x78 - Game over
|00E3E2| db $08 ; 0x7B - Intro
|00E3E3| db $08 ; 0x7B - Intro
|00E3E4| db $08 ; 0x7B - Intro
|00E3E5| db $08 ; 0x7B - Intro

.palette_id
|00E3E6| db $0A ; 0x74 - Overworld common
|00E3E7| db $FF ; 0x74 - Overworld common
|00E3E8| db $03 ; 0x7B - Intro
|00E3E9| db $FF ; 0x7B - Intro
|00E3EA| db $00 ; 0x7C - Unused
|00E3EB| db $FF ; 0x7C - Unused
|00E3EC| db $FF ; 0x75 - Ether
|00E3ED| db $FF ; 0x75 - Ether
|00E3EE| db $01 ; 0x75 - Ether
|00E3EF| db $FF ; 0x75 - Ether
|00E3F0| db $02 ; 0x76 - Bombos
|00E3F1| db $FF ; 0x76 - Bombos
|00E3F2| db $00 ; 0x77 - Quake
|00E3F3| db $FF ; 0x77 - Quake
|00E3F4| db $FF ; 0x78 - Game over
|00E3F5| db $FF ; 0x78 - Game over
|00E3F6| db $FF ; 0x7B - Intro
|00E3F7| db $FF ; 0x7B - Intro
|00E3F8| db $FF ; 0x7B - Intro
|00E3F9| db $FF ; 0x7B - Intro

endpool

;---------------------------------------------------------------------------------------------------

LoadChrHalfSlot:
|00E3FA| LDX.w $0AAA
|00E3FD| BEQ EXIT_00E3D1

|00E3FF| PHB
|00E400| PHK
|00E401| PLB

|00E402| LDA.w .palette_id-1,X
|00E405| BMI .done_palette

|00E407| STA.w $0AB1

|00E40A| CPX.b #$01
|00E40C| BNE .not_sheet_1

|00E40E| LDA.b #$0A
|00E410| STA.w $0AB1

|00E413| LDA.b #$02
|00E415| STA.w $0AA9

|00E418| JSL PaletteLoad_SpriteEnvironment

|00E41C| INC.b $15

|00E41E| BRA .done_palette

.not_sheet_1
|00E420| LDA.b #$02
|00E422| STA.w $0AA9

|00E425| JSL PaletteLoad_SpriteEnvironment_Underworld

|00E429| INC.b $15

;---------------------------------------------------------------------------------------------------

.done_palette
|00E42B| LDX.w $0AAA

|00E42E| LDY.b #$44

|00E430| STZ.b $08
|00E432| STZ.b $09

|00E434| INC.w $0AAA

|00E437| LDA.w $0AAA
|00E43A| LSR A
|00E43B| BCC .dont_reset_medallion_flags

|00E43D| STZ.w $0AAA

|00E440| CPX.b #$12
|00E442| BEQ .dont_reset_medallion_flags

|00E444| LDA.b #$03
|00E446| STA.b $09

|00E448| LDY.b #$46
|00E44A| CPX.b #$02
|00E44C| BNE .dont_reset_medallion_flags

|00E44E| STZ.w $0112

.dont_reset_medallion_flags
|00E451| STY.w $0116

|00E454| LDA.b #$0B
|00E456| STA.b $17

|00E458| LDY.w .sheet_id-1,X
|00E45B| CPY.b #$01
|00E45D| BNE .dont_reload_from_tileset

|00E45F| LDY.w $0AA4

.dont_reload_from_tileset
|00E462| LDA.w GFXSheetPointers.sprite_bank,Y
|00E465| STA.b $02
|00E467| STA.b $05

|00E469| LDA.w GFXSheetPointers.sprite_high,Y
|00E46C| STA.b $01

|00E46E| LDA.w GFXSheetPointers.sprite_low,Y
|00E471| STA.b $00

|00E473| REP #$31

|00E475| LDY.w #$0020
|00E478| STY.b $0C

|00E47A| LDX.w #$0000

|00E47D| LDA.b $00
|00E47F| ADC.b $08

;---------------------------------------------------------------------------------------------------

.next_tile
|00E481| STA.b $00

|00E483| CLC
|00E484| ADC.w #$0010
|00E487| BNE .no_bank_cross_1

|00E489| LDA.w #$8000
|00E48C| INC.b $05

.no_bank_cross_1
|00E48E| STA.b $03

|00E490| LDY.w #$0007

.next_plane
|00E493| LDA.b [$00]
|00E495| STA.l $7F1000,X

|00E499| XBA
|00E49A| ORA.b [$00]
|00E49C| AND.w #$00FF
|00E49F| STA.b $08

|00E4A1| INC.b $00
|00E4A3| INC.b $00
|00E4A5| BNE .no_bank_cross_2

|00E4A7| LDA.b $03
|00E4A9| INC A
|00E4AA| STA.b $00

|00E4AC| INC.b $02

|00E4AE| LDA.b $02
|00E4B0| STA.b $05

.no_bank_cross_2
|00E4B2| LDA.b [$03]
|00E4B4| AND.w #$00FF
|00E4B7| STA.b $0A

|00E4B9| ORA.b $08
|00E4BB| XBA
|00E4BC| ORA.b $0A
|00E4BE| STA.l $7F1010,X

|00E4C2| INC.b $03
|00E4C4| BNE .no_bank_cross_3

|00E4C6| LDA.w #$8000
|00E4C9| STA.b $00

|00E4CB| LDA.w #$8010
|00E4CE| STA.b $03

|00E4D0| INC.b $02
|00E4D2| INC.b $05

.no_bank_cross_3
|00E4D4| INX
|00E4D5| INX

|00E4D6| DEY
|00E4D7| BPL .next_plane

|00E4D9| TXA
|00E4DA| CLC
|00E4DB| ADC.w #$0010
|00E4DE| TAX

|00E4DF| LDA.b $03

|00E4E1| DEC.b $0C
|00E4E3| BNE .next_tile

|00E4E5| SEP #$30

|00E4E7| PLB

|00E4E8| RTL

;===================================================================================================

LoadFileSelectGraphics:
|00E4E9| LDA.b #$02
|00E4EB| STA.w OBSEL

|00E4EE| LDA.b #$80
|00E4F0| STA.w VMAIN
|00E4F3| STZ.w VMADDL

|00E4F6| LDA.b #$50 ; VRAM $A000
|00E4F8| STA.w VMADDH

;---------------------------------------------------------------------------------------------------

|00E4FB| PHB
|00E4FC| PHK
|00E4FD| PLB

|00E4FE| LDY.b #$5E
|00E500| JSR Decompress_sprite_low

|00E503| REP #$20

|00E505| LDY.b #$3F
|00E507| JSR Expand3bppToVRAM_RightPalette

|00E50A| LDY.b #$5F
|00E50C| JSR Decompress_sprite_low

|00E50F| REP #$20

|00E511| LDY.b #$3F
|00E513| JSR Expand3bppToVRAM_RightPalette

|00E516| PLB

;---------------------------------------------------------------------------------------------------

|00E517| LDA.b #^TheFont
|00E519| STA.b $02

|00E51B| REP #$30

|00E51D| LDA.w #$7000 ; VRAM $E000
|00E520| STA.w VMADDR

|00E523| LDA.w #TheFont
|00E526| STA.b $00

|00E528| LDX.w #(TheFont.size)/2-1

.next_a
|00E52B| LDA.b [$00]
|00E52D| STA.w VMDATA

|00E530| INC.b $00
|00E532| INC.b $00

|00E534| DEX
|00E535| BPL .next_a

;---------------------------------------------------------------------------------------------------

|00E537| SEP #$30

|00E539| PHB
|00E53A| PHK
|00E53B| PLB

|00E53C| LDY.b #$6B
|00E53E| JSR Decompress_sprite_low

|00E541| REP #$30

|00E543| LDX.w #$02FF

.next_b
|00E546| LDA.b [$00]
|00E548| STA.w VMDATA

|00E54B| INC.b $00
|00E54D| INC.b $00

|00E54F| DEX
|00E550| BPL .next_b

|00E552| SEP #$30

|00E554| PLB

|00E555| RTL

;===================================================================================================

TransferFontToVRAM:
|00E556| LDA.b #$02
|00E558| STA.w OBSEL

|00E55B| LDA.b #$80
|00E55D| STA.w VMAIN

|00E560| LDA.b #^TheFont
|00E562| STA.b $02

|00E564| REP #$30

|00E566| LDA.w #$7000 ; VRAM $E000
|00E569| STA.w VMADDR

|00E56C| LDA.w #TheFont
|00E56F| STA.b $00

|00E571| LDX.w #(TheFont.size)/2-1

.next
|00E574| LDA.b [$00]
|00E576| STA.w VMDATA

|00E579| INC.b $00
|00E57B| INC.b $00

|00E57D| DEX
|00E57E| BPL .next

|00E580| SEP #$30

|00E582| RTL

;===================================================================================================

LoadSpriteGraphics:
|00E583| STZ.b $00
|00E585| STX.b $01

|00E587| PHY

|00E588| JSR Decompress_sprite_arbitrary

|00E58B| REP #$20

|00E58D| LDY.b #$3F

|00E58F| PLX

|00E590| CPX.b #$52
|00E592| BEQ Expand3bppToVRAM_RightPalette

|00E594| CPX.b #$53
|00E596| BEQ Expand3bppToVRAM_RightPalette

|00E598| CPX.b #$5A
|00E59A| BEQ Expand3bppToVRAM_RightPalette

|00E59C| CPX.b #$5B
|00E59E| BEQ Expand3bppToVRAM_RightPalette

|00E5A0| CPX.b #$5C
|00E5A2| BEQ Expand3bppToVRAM_RightPalette

|00E5A4| CPX.b #$5E
|00E5A6| BEQ Expand3bppToVRAM_RightPalette

|00E5A8| CPX.b #$5F
|00E5AA| BEQ Expand3bppToVRAM_RightPalette

|00E5AC| JMP.w Expand3bppToVRAM_LeftPalette

;===================================================================================================

Expand3bppToVRAM_RightPalette:
.next_tile
|00E5AF| LDX.b #$0E

.next_planes_a
|00E5B1| LDA.b [$00]
|00E5B3| STA.w VMDATA

|00E5B6| XBA
|00E5B7| ORA.b [$00]
|00E5B9| AND.w #$00FF
|00E5BC| STA.b $BF,X

|00E5BE| INC.b $00
|00E5C0| INC.b $00

|00E5C2| DEX
|00E5C3| DEX

|00E5C4| LDA.b [$00]
|00E5C6| STA.w VMDATA

|00E5C9| XBA
|00E5CA| ORA.b [$00]
|00E5CC| AND.w #$00FF
|00E5CF| STA.b $BF,X

|00E5D1| INC.b $00
|00E5D3| INC.b $00

|00E5D5| DEX
|00E5D6| DEX
|00E5D7| BPL .next_planes_a

;---------------------------------------------------------------------------------------------------

|00E5D9| LDX.b #$0E

.next_planes_b
|00E5DB| LDA.b [$00]
|00E5DD| AND.w #$00FF
|00E5E0| STA.b $BD

|00E5E2| ORA.b $BF,X
|00E5E4| XBA
|00E5E5| ORA.b $BD
|00E5E7| STA.w VMDATA
|00E5EA| INC.b $00

|00E5EC| DEX
|00E5ED| DEX

|00E5EE| LDA.b [$00]
|00E5F0| AND.w #$00FF
|00E5F3| STA.b $BD

|00E5F5| ORA.b $BF,X
|00E5F7| XBA
|00E5F8| ORA.b $BD
|00E5FA| STA.w VMDATA

|00E5FD| INC.b $00

|00E5FF| DEX
|00E600| DEX
|00E601| BPL .next_planes_b

|00E603| DEY
|00E604| BPL .next_tile

|00E606| SEP #$20

|00E608| RTS

;===================================================================================================

LoadBackgroundGraphics:
|00E609| LDA.b #^$7F4000
|00E60B| LDX.b #>$7F4000

.arbitrary
|00E60D| STZ.b $00
|00E60F| STX.b $01
|00E611| STA.b $02

|00E613| JSR Decompress_background_arbitrary

|00E616| REP #$20

|00E618| LDY.b #$3F

|00E61A| LDX.w $0AA1
|00E61D| CPX.b #$20
|00E61F| BCC .do_low

|00E621| LDX.b $0F
|00E623| CPX.b #$07
|00E625| BEQ Expand3bppToVRAM_RightPalette

|00E627| CPX.b #$02
|00E629| BEQ Expand3bppToVRAM_RightPalette

|00E62B| CPX.b #$04
|00E62D| BEQ Expand3bppToVRAM_RightPalette

|00E62F| CPX.b #$03
|00E631| BNE Expand3bppToVRAM_LeftPalette

.nevermind_do_high
|00E633| JMP.w Expand3bppToVRAM_RightPalette

.do_low
|00E636| LDX.b $0F
|00E638| CPX.b #$04
|00E63A| BCS .nevermind_do_high

;===================================================================================================

Expand3bppToVRAM_LeftPalette:

.next_super
|00E63C| LDA.b [$00]
|00E63E| STA.w VMDATA

|00E641| INC.b $00
|00E643| INC.b $00

|00E645| LDA.b [$00]
|00E647| STA.w VMDATA

|00E64A| INC.b $00
|00E64C| INC.b $00

|00E64E| LDA.b [$00]
|00E650| STA.w VMDATA

|00E653| INC.b $00
|00E655| INC.b $00

|00E657| LDA.b [$00]
|00E659| STA.w VMDATA

|00E65C| INC.b $00
|00E65E| INC.b $00

|00E660| LDA.b [$00]
|00E662| STA.w VMDATA

|00E665| INC.b $00
|00E667| INC.b $00

|00E669| LDA.b [$00]
|00E66B| STA.w VMDATA

|00E66E| INC.b $00
|00E670| INC.b $00

|00E672| LDA.b [$00]
|00E674| STA.w VMDATA

|00E677| INC.b $00
|00E679| INC.b $00

|00E67B| LDA.b [$00]
|00E67D| STA.w VMDATA

|00E680| INC.b $00
|00E682| INC.b $00

;---------------------------------------------------------------------------------------------------

|00E684| LDX.b #$01

.next
|00E686| LDA.b [$00]
|00E688| AND.w #$00FF
|00E68B| STA.w VMDATA

|00E68E| INC.b $00

|00E690| LDA.b [$00]
|00E692| AND.w #$00FF
|00E695| STA.w VMDATA

|00E698| INC.b $00

|00E69A| LDA.b [$00]
|00E69C| AND.w #$00FF
|00E69F| STA.w VMDATA

|00E6A2| INC.b $00

|00E6A4| LDA.b [$00]
|00E6A6| AND.w #$00FF
|00E6A9| STA.w VMDATA

|00E6AC| INC.b $00

|00E6AE| DEX
|00E6AF| BPL .next

;---------------------------------------------------------------------------------------------------

|00E6B1| DEY
|00E6B2| BPL .next_super

|00E6B4| SEP #$20

|00E6B6| RTS

;===================================================================================================

LoadCommonSprites:
|00E6B7| LDY.w $0AA4

|00E6BA| LDA.w GFXSheetPointers.sprite_bank,Y
|00E6BD| STA.b $02

|00E6BF| LDA.w GFXSheetPointers.sprite_high,Y
|00E6C2| STA.b $01

|00E6C4| LDA.w GFXSheetPointers.sprite_low,Y
|00E6C7| STA.b $00

|00E6C9| REP #$20

|00E6CB| LDY.b #$40

;---------------------------------------------------------------------------------------------------

.next_tile
|00E6CD| LDX.b #$0E

.next_planes_a
|00E6CF| LDA.b [$00]
|00E6D1| STA.w VMDATA

|00E6D4| XBA
|00E6D5| ORA.b [$00]
|00E6D7| AND.w #$00FF
|00E6DA| STA.b $BF,X

|00E6DC| INC.b $00
|00E6DE| INC.b $00

|00E6E0| DEX
|00E6E1| DEX

|00E6E2| LDA.b [$00]
|00E6E4| STA.w VMDATA

|00E6E7| XBA
|00E6E8| ORA.b [$00]
|00E6EA| AND.w #$00FF
|00E6ED| STA.b $BF,X

|00E6EF| INC.b $00
|00E6F1| INC.b $00

|00E6F3| DEX
|00E6F4| DEX
|00E6F5| BPL .next_planes_a

;---------------------------------------------------------------------------------------------------

|00E6F7| LDX.b #$0E

.next_planes_b
|00E6F9| LDA.b [$00]
|00E6FB| AND.w #$00FF
|00E6FE| STA.b $BD

|00E700| ORA.b $BF,X
|00E702| XBA
|00E703| ORA.b $BD
|00E705| STA.w VMDATA

|00E708| INC.b $00

|00E70A| DEX
|00E70B| DEX

|00E70C| LDA.b [$00]
|00E70E| AND.w #$00FF
|00E711| STA.b $BD

|00E713| ORA.b $BF,X
|00E715| XBA
|00E716| ORA.b $BD
|00E718| STA.w VMDATA

|00E71B| INC.b $00

|00E71D| DEX
|00E71E| DEX
|00E71F| BPL .next_planes_b

|00E721| DEY
|00E722| BNE .next_tile

;---------------------------------------------------------------------------------------------------

|00E724| SEP #$20

|00E726| LDA.b $10
|00E728| CMP.b #$01
|00E72A| BEQ .in_file_select

|00E72C| LDY.b #$06

|00E72E| LDA.w GFXSheetPointers.sprite_bank,Y
|00E731| STA.b $02

|00E733| LDA.w GFXSheetPointers.sprite_high,Y
|00E736| STA.b $01

|00E738| LDA.w GFXSheetPointers.sprite_low,Y
|00E73B| STA.b $00

|00E73D| REP #$20

|00E73F| LDY.b #$7F

|00E741| JMP.w Expand3bppToVRAM_LeftPalette

;---------------------------------------------------------------------------------------------------

.in_file_select
|00E744| STZ.b $0F

|00E746| LDY.b #$5E
|00E748| STY.b $06

|00E74A| LDA.b #$7F
|00E74C| STA.b $02

|00E74E| LDX.b #$40

|00E750| JSR LoadSpriteGraphics

|00E753| LDY.b #$5F
|00E755| STY.b $06

|00E757| LDX.b #$40

|00E759| JMP.w LoadSpriteGraphics

;===================================================================================================

Decompress_sprite_high:
|00E75C| STZ.b $00

|00E75E| LDA.b #>$7F4600
|00E760| STA.b $01

|00E762| LDA.b #^$7F4600
|00E764| BRA .sprite_set_bank

;===================================================================================================

#Decompress_sprite_low:
|00E766| STZ.b $00

|00E768| LDA.b #$40
|00E76A| STA.b $01

|00E76C| LDA.b #$7F

;---------------------------------------------------------------------------------------------------

.sprite_set_bank
|00E76E| STA.b $02
|00E770| STA.b $05

;===================================================================================================

Decompress_sprite_arbitrary:
|00E772| LDA.w GFXSheetPointers.sprite_bank,Y
|00E775| STA.b $CA

|00E777| LDA.w GFXSheetPointers.sprite_high,Y
|00E77A| STA.b $C9

|00E77C| LDA.w GFXSheetPointers.sprite_low,Y
|00E77F| STA.b $C8

|00E781| BRA Decompress

;===================================================================================================

Decompress_background_low:
|00E783| STZ.b $00

|00E785| LDA.b #>$7F4000
|00E787| STA.b $01

|00E789| LDA.b #^$7F4000

;===================================================================================================

Decompress_background_arbitrary_bank:
|00E78B| STA.b $02
|00E78D| STA.b $05

;===================================================================================================

Decompress_background_arbitrary:
|00E78F| LDA.w GFXSheetPointers.background_bank,Y
|00E792| STA.b $CA

|00E794| LDA.w GFXSheetPointers.background_high,Y
|00E797| STA.b $C9

|00E799| LDA.w GFXSheetPointers.background_low,Y
|00E79C| STA.b $C8

;===================================================================================================

Decompress:
|00E79E| REP #$10

|00E7A0| LDY.w #$0000

.next_command
|00E7A3| JSR GetNextByte

|00E7A6| CMP.b #$FF ; stop decompression
|00E7A8| BNE .continue

|00E7AA| SEP #$10

|00E7AC| RTS

;---------------------------------------------------------------------------------------------------

.continue
|00E7AD| STA.b $CD

|00E7AF| AND.b #$E0
|00E7B1| CMP.b #$E0
|00E7B3| BEQ .expanded

|00E7B5| PHA

|00E7B6| LDA.b $CD

|00E7B8| REP #$20

|00E7BA| AND.w #$001F

|00E7BD| BRA .normal

;---------------------------------------------------------------------------------------------------

.expanded
|00E7BF| LDA.b $CD
|00E7C1| ASL A
|00E7C2| ASL A
|00E7C3| ASL A
|00E7C4| AND.b #$E0
|00E7C6| PHA

|00E7C7| LDA.b $CD
|00E7C9| AND.b #$03
|00E7CB| XBA

|00E7CC| JSR GetNextByte

|00E7CF| REP #$20

;---------------------------------------------------------------------------------------------------

.normal
|00E7D1| INC A
|00E7D2| STA.b $CB

|00E7D4| SEP #$20

|00E7D6| PLA

|00E7D7| BEQ .raw_copy
|00E7D9| BMI .copy_past

|00E7DB| ASL A
|00E7DC| BPL .repeating_byte

|00E7DE| ASL A
|00E7DF| BPL .repeating_word

;---------------------------------------------------------------------------------------------------

.incremental
|00E7E1| JSR GetNextByte

|00E7E4| LDX.b $CB

.next_incremental
|00E7E6| STA.b [$00],Y

|00E7E8| INC A

|00E7E9| INY

|00E7EA| DEX
|00E7EB| BNE .next_incremental

|00E7ED| BRA .next_command

;---------------------------------------------------------------------------------------------------

.raw_copy
|00E7EF| JSR GetNextByte
|00E7F2| STA.b [$00],Y

|00E7F4| INY

|00E7F5| LDX.b $CB
|00E7F7| DEX
|00E7F8| STX.b $CB

|00E7FA| BNE .raw_copy

|00E7FC| BRA .next_command

;---------------------------------------------------------------------------------------------------

.repeating_byte
|00E7FE| JSR GetNextByte

|00E801| LDX.b $CB

.next_repeating
|00E803| STA.b [$00],Y

|00E805| INY

|00E806| DEX

|00E807| BNE .next_repeating

|00E809| BRA .next_command

;---------------------------------------------------------------------------------------------------

.repeating_word
|00E80B| JSR GetNextByte
|00E80E| XBA
|00E80F| JSR GetNextByte

|00E812| LDX.b $CB

.next_word
|00E814| XBA
|00E815| STA.b [$00],Y

|00E817| INY

|00E818| DEX
|00E819| BEQ .done_words

|00E81B| XBA
|00E81C| STA.b [$00],Y

|00E81E| INY

|00E81F| DEX

|00E820| BNE .next_word

.done_words
|00E822| JMP.w .next_command

;---------------------------------------------------------------------------------------------------

.copy_past
|00E825| JSR GetNextByte
|00E828| XBA

|00E829| JSR GetNextByte
|00E82C| XBA

|00E82D| TAX

.next_copy
|00E82E| PHY
|00E82F| TXY

|00E830| LDA.b [$00],Y

|00E832| TYX
|00E833| PLY

|00E834| STA.b [$00],Y

|00E836| INY
|00E837| INX

|00E838| REP #$20

|00E83A| DEC.b $CB

|00E83C| SEP #$20

|00E83E| BNE .next_copy

|00E840| JMP.w .next_command

;===================================================================================================

GetNextByte:
|00E843| LDA.b [$C8]

|00E845| LDX.b $C8
|00E847| INX
|00E848| BNE .no_bank_wrap

|00E84A| LDX.w #$8000
|00E84D| INC.b $CA

.no_bank_wrap
|00E84F| STX.b $C8

|00E851| RTS

;===================================================================================================
; FREE ROM: 0x2E
;===================================================================================================
NULL_00E852:
|00E852| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00E85A| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00E862| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00E86A| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00E872| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00E87A| db $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

PaletteFilterColorAdd:
|00E880| dw $FFFF, $0001
|00E884| dw $FFE0, $0020
|00E888| dw $FC00, $0400

PaletteFilterColorMasks:
|00E88C| dw $FFFF, $FFFF, $FFFE, $FFFF
|00E894| dw $7FFF, $7FFF, $7FDF, $FBFF
|00E89C| dw $7F7F, $7F7F, $7DF7, $EFBF
|00E8A4| dw $7BDF, $7BDF, $77BB, $DDEF
|00E8AC| dw $7777, $7777, $6EDD, $BB77
|00E8B4| dw $6DB7, $6DB7, $5B6D, $B6DB
|00E8BC| dw $5B5B, $5B5B, $56B6, $AD6B
|00E8C4| dw $5555, $AD6B, $5555, $AAAB
|00E8CC| dw $5555, $5555, $2A55, $5555
|00E8D4| dw $2A55, $2A55, $294A, $5295
|00E8DC| dw $2525, $2525, $2492, $4925
|00E8E4| dw $1249, $1249, $1122, $4489
|00E8EC| dw $1111, $1111, $0844, $2211
|00E8F4| dw $0421, $0421, $0208, $1041
|00E8FC| dw $0101, $0101, $0020, $0401
|00E904| dw $0001, $0001, $0000, $0001

;===================================================================================================

PaletteFilter:
|00E90C| SEP #$20

|00E90E| LDA.b $1A
|00E910| LSR A
|00E911| BCC ApplyPaletteFilter

|00E913| RTL

;===================================================================================================

ApplyPaletteFilter:
|00E914| REP #$30

|00E916| LDX.w #PaletteFilterColorMasks

|00E919| LDA.l $7EC007
|00E91D| CMP.w #$0010
|00E920| BCC .darken_color

|00E922| INX
|00E923| INX

.darken_color
|00E924| STX.b $B7

|00E926| AND.w #$000F
|00E929| ASL A
|00E92A| TAX

|00E92B| LDA.w BitMasks,X
|00E92E| STA.b $0C

|00E930| PHB
|00E931| PHK
|00E932| PLB

|00E933| LDA.l $7EC009
|00E937| TAX

|00E938| LDA.w PaletteFilterColorAdd+0,X
|00E93B| STA.b $06

|00E93D| LDA.w PaletteFilterColorAdd+4,X
|00E940| STA.b $08

|00E942| LDA.w PaletteFilterColorAdd+8,X
|00E945| STA.b $0A

|00E947| LDX.w #$0040
|00E94A| JSR PaletteFilter_FilterColors

|00E94D| LDA.l $7EC500
|00E951| STA.b $04

;---------------------------------------------------------------------------------------------------

|00E953| LDA.l $7EC300
|00E957| AND.w #$001F
|00E95A| ASL A
|00E95B| ASL A
|00E95C| TAY

|00E95D| LDA.b ($B7),Y
|00E95F| AND.b $0C
|00E961| BNE .no_red

|00E963| LDA.b $04
|00E965| ADC.b $06
|00E967| STA.b $04

.no_red
|00E969| LDA.l $7EC300
|00E96D| AND.w #$03E0
|00E970| LSR A
|00E971| LSR A
|00E972| LSR A
|00E973| TAY

|00E974| LDA.b ($B7),Y
|00E976| AND.b $0C
|00E978| BNE .no_green

|00E97A| LDA.b $04
|00E97C| ADC.b $08
|00E97E| STA.b $04

.no_green
|00E980| LDA.l $7EC301
|00E984| AND.w #$007C
|00E987| TAY

|00E988| LDA.b ($B7),Y
|00E98A| AND.b $0C
|00E98C| BNE .no_blue

|00E98E| LDA.b $04
|00E990| CLC
|00E991| ADC.b $0A
|00E993| STA.b $04

;---------------------------------------------------------------------------------------------------

.no_blue
|00E995| LDA.b $04
|00E997| STA.l $7EC500

|00E99B| PLB

|00E99C| LDA.l $7EC009
|00E9A0| BNE .lightening

|00E9A2| LDA.l $7EC007
|00E9A6| INC A
|00E9A7| STA.l $7EC007

|00E9AB| CMP.l $7EC00B
|00E9AF| BNE .continue_filtering

.swap
|00E9B1| LDA.l $7EC009
|00E9B5| EOR.w #$0002
|00E9B8| STA.l $7EC009

|00E9BC| LDA.w #$0000
|00E9BF| STA.l $7EC007

|00E9C3| SEP #$20

|00E9C5| INC.b $B0

.continue_filtering
|00E9C7| SEP #$30

|00E9C9| INC.b $15

|00E9CB| RTL

;---------------------------------------------------------------------------------------------------

.lightening
|00E9CC| LDA.l $7EC007
|00E9D0| CMP.l $7EC00B
|00E9D4| BEQ .swap

|00E9D6| LDA.l $7EC007
|00E9DA| DEC A
|00E9DB| STA.l $7EC007

|00E9DF| SEP #$30

|00E9E1| INC.b $15

|00E9E3| RTL

;===================================================================================================

PaletteFilter_FilterColors:
.next_color
|00E9E4| LDA.l $7EC500,X
|00E9E8| STA.b $04

|00E9EA| LDA.l $7EC300,X
|00E9EE| BEQ .color_is_black

|00E9F0| AND.w #$001F
|00E9F3| ASL A
|00E9F4| ASL A
|00E9F5| TAY

|00E9F6| LDA.b ($B7),Y
|00E9F8| AND.b $0C
|00E9FA| BNE .no_red

|00E9FC| LDA.b $04
|00E9FE| ADC.b $06
|00EA00| STA.b $04

.no_red
|00EA02| LDA.l $7EC300,X
|00EA06| AND.w #$03E0
|00EA09| LSR A
|00EA0A| LSR A
|00EA0B| LSR A
|00EA0C| TAY

|00EA0D| LDA.b ($B7),Y
|00EA0F| AND.b $0C
|00EA11| BNE .no_green

|00EA13| LDA.b $04
|00EA15| ADC.b $08
|00EA17| STA.b $04

.no_green
|00EA19| LDA.l $7EC301,X
|00EA1D| AND.w #$007C
|00EA20| TAY

|00EA21| LDA.b ($B7),Y
|00EA23| AND.b $0C
|00EA25| BNE .no_blue

|00EA27| LDA.b $04
|00EA29| CLC
|00EA2A| ADC.b $0A
|00EA2C| STA.b $04

.no_blue
|00EA2E| LDA.b $04
|00EA30| STA.l $7EC500,X

.color_is_black
|00EA34| INX
|00EA35| INX
|00EA36| CPX.w #$01B0
|00EA39| BCC .next_color

|00EA3B| BNE .dont_skip_palette_5

|00EA3D| TXA
|00EA3E| CLC
|00EA3F| ADC.w #$0010
|00EA42| TAX

.dont_skip_palette_5
|00EA43| CPX.w #$01E0
|00EA46| BNE .next_color

|00EA48| RTS

;===================================================================================================

UNREACHABLE_00EA49:
|00EA49| REP #$30

|00EA4B| LDX.w #PaletteFilterColorMasks

|00EA4E| LDA.l $7EC007
|00EA52| CMP.w #$0010
|00EA55| BCC .darken_color

|00EA57| INX
|00EA58| INX

.darken_color
|00EA59| STX.b $B7

|00EA5B| AND.w #$000F
|00EA5E| ASL A
|00EA5F| TAX

|00EA60| LDA.w BitMasks,X
|00EA63| STA.b $0C

|00EA65| PHB
|00EA66| PHK
|00EA67| PLB

|00EA68| LDA.l $7EC009
|00EA6C| TAX

|00EA6D| LDA.w PaletteFilterColorAdd+0,X
|00EA70| STA.b $06

|00EA72| LDA.w PaletteFilterColorAdd+4,X
|00EA75| STA.b $08

|00EA77| LDA.w PaletteFilterColorAdd+8,X
|00EA7A| STA.b $0A

|00EA7C| LDX.w #$0040
|00EA7F| LDA.w #$0200
|00EA82| JSR FilterColorsInRange

|00EA85| PLB

;---------------------------------------------------------------------------------------------------

|00EA86| LDA.l $7EC009
|00EA8A| BNE .lightening

|00EA8C| LDA.l $7EC007
|00EA90| INC A
|00EA91| STA.l $7EC007

|00EA95| CMP.l $7EC00B
|00EA99| BNE .continue_filtering

;---------------------------------------------------------------------------------------------------

.swap
|00EA9B| LDA.l $7EC009
|00EA9F| EOR.w #$0002
|00EAA2| STA.l $7EC009

|00EAA6| LDA.w #$0000
|00EAA9| STA.l $7EC007

|00EAAD| SEP #$20

|00EAAF| INC.b $B0

;---------------------------------------------------------------------------------------------------

.continue_filtering
|00EAB1| SEP #$30

|00EAB3| INC.b $15

|00EAB5| RTL

;---------------------------------------------------------------------------------------------------

.lightening
|00EAB6| LDA.l $7EC007
|00EABA| CMP.l $7EC00B
|00EABE| BEQ .swap

|00EAC0| LDA.l $7EC007
|00EAC4| DEC A
|00EAC5| STA.l $7EC007

|00EAC9| SEP #$30

|00EACB| INC.b $15

|00EACD| RTL

;===================================================================================================

FilterColorsInRange:
|00EACE| STA.b $0E

.next_color
|00EAD0| LDA.l $7EC500,X
|00EAD4| STA.b $04

|00EAD6| LDA.l $7EC300,X
|00EADA| BEQ .skip_color

|00EADC| AND.w #$001F
|00EADF| ASL A
|00EAE0| ASL A
|00EAE1| TAY

|00EAE2| LDA.b ($B7),Y
|00EAE4| AND.b $0C
|00EAE6| BNE .no_red

|00EAE8| LDA.b $04
|00EAEA| CLC
|00EAEB| ADC.b $06
|00EAED| STA.b $04

;---------------------------------------------------------------------------------------------------

.no_red
|00EAEF| LDA.l $7EC300,X
|00EAF3| AND.w #$03E0
|00EAF6| LSR A
|00EAF7| LSR A
|00EAF8| LSR A
|00EAF9| TAY

|00EAFA| LDA.b ($B7),Y
|00EAFC| AND.b $0C
|00EAFE| BNE .no_green

|00EB00| LDA.b $04
|00EB02| CLC
|00EB03| ADC.b $08
|00EB05| STA.b $04

;---------------------------------------------------------------------------------------------------

.no_green
|00EB07| LDA.l $7EC301,X
|00EB0B| AND.w #$007C
|00EB0E| TAY

|00EB0F| LDA.b ($B7),Y
|00EB11| AND.b $0C
|00EB13| BNE .no_blue

|00EB15| LDA.b $04
|00EB17| CLC
|00EB18| ADC.b $0A
|00EB1A| STA.b $04

;---------------------------------------------------------------------------------------------------

.no_blue
|00EB1C| LDA.b $04
|00EB1E| STA.l $7EC500,X

;---------------------------------------------------------------------------------------------------

.skip_color
|00EB22| INX
|00EB23| INX
|00EB24| CPX.b $0E
|00EB26| BNE .next_color

|00EB28| RTS

;===================================================================================================

ResetHUDPalettes4and5:
|00EB29| REP #$20

|00EB2B| LDA.w #$0000 ; RGB: #000000

|00EB2E| STA.l $7EC520
|00EB32| STA.l $7EC522
|00EB36| STA.l $7EC524
|00EB3A| STA.l $7EC526
|00EB3E| STA.l $7EC528
|00EB42| STA.l $7EC52A
|00EB46| STA.l $7EC52C
|00EB4A| STA.l $7EC52E

|00EB4E| STA.l $7EC007

|00EB52| LDA.w #$0002 ; lightening screen
|00EB55| STA.l $7EC009

|00EB59| SEP #$20

|00EB5B| INC.b $15

|00EB5D| RTL

;===================================================================================================

PaletteFilter_AttractPlaque:
|00EB5E| REP #$30

|00EB60| LDX.w #PaletteFilterColorMasks

|00EB63| LDA.l $7EC007
|00EB67| CMP.w #$0010
|00EB6A| BCC .darken_color

|00EB6C| INX
|00EB6D| INX

.darken_color
|00EB6E| STX.b $B7

|00EB70| AND.w #$000F
|00EB73| ASL A
|00EB74| TAX

|00EB75| LDA.l BitMasks,X
|00EB79| STA.b $0C

|00EB7B| PHB
|00EB7C| PHK
|00EB7D| PLB

|00EB7E| LDA.l $7EC009
|00EB82| TAX

|00EB83| LDA.w PaletteFilterColorAdd+0,X
|00EB86| STA.b $06

|00EB88| LDA.w PaletteFilterColorAdd+4,X
|00EB8B| STA.b $08

|00EB8D| LDA.w PaletteFilterColorAdd+8,X
|00EB90| STA.b $0A

|00EB92| LDX.w #$0020
|00EB95| LDA.w #$0030

;===================================================================================================

#PaletteFilter_AttractPlaque_do_filtering:
|00EB98| JSR FilterColorsInRange

|00EB9B| PLB

|00EB9C| LDA.l $7EC007
|00EBA0| INC A
|00EBA1| STA.l $7EC007

|00EBA5| CMP.w #$001F
|00EBA8| BNE .still_filtering

|00EBAA| LDA.w #$0000
|00EBAD| STA.l $7EC007

|00EBB1| LDA.l $7EC009
|00EBB5| EOR.w #$0002
|00EBB8| STA.l $7EC009
|00EBBC| BEQ .still_filtering

|00EBBE| INC.b $27

.still_filtering
|00EBC0| SEP #$30

|00EBC2| INC.b $15

|00EBC4| RTL

;===================================================================================================

PaletteFilter_WishPonds:
|00EBC5| LDA.b #$02
|00EBC7| STA.b $1D

|00EBC9| LDA.b #$30
|00EBCB| STA.b $9A

|00EBCD| BRA .start

;===================================================================================================

#PaletteFilter_Crystal:
|00EBCF| LDA.b #$01
|00EBD1| STA.b $1D

;===================================================================================================

#PaletteFilter_TheEndSprite:
.start
|00EBD3| REP #$20

|00EBD5| LDX.b #$0E
|00EBD7| LDA.w #$0000 ; RGB: #000000

.next_black
|00EBDA| STA.l $7EC6A0,X

|00EBDE| DEX
|00EBDF| DEX
|00EBE0| BPL .next_black

;---------------------------------------------------------------------------------------------------

|00EBE2| STA.l $7EC007

|00EBE6| LDA.w #$0002
|00EBE9| STA.l $7EC009

|00EBED| SEP #$20

|00EBEF| INC.b $15

|00EBF1| RTL

;===================================================================================================

PaletteFilter_RestoreSprite5Left:
|00EBF2| REP #$20

|00EBF4| LDX.b #$0E

.next_color
|00EBF6| LDA.l $7EC4A0,X
|00EBFA| STA.l $7EC6A0,X

|00EBFE| DEX
|00EBFF| DEX
|00EC00| BPL .next_color

|00EC02| SEP #$20

|00EC04| STZ.b $1D

|00EC06| LDA.b #$20
|00EC08| STA.b $9A

|00EC0A| INC.b $15

;---------------------------------------------------------------------------------------------------

#EXIT_00EC0C:
|00EC0C| RTL

;===================================================================================================

PaletteFilter_Sprite5Left:
|00EC0D| JSL .filter

|00EC11| LDA.l $7EC007
|00EC15| BEQ EXIT_00EC0C

;---------------------------------------------------------------------------------------------------

.filter
|00EC17| REP #$30

|00EC19| LDX.w #PaletteFilterColorMasks

|00EC1C| LDA.l $7EC007
|00EC20| CMP.w #$0010
|00EC23| BCC .darken_color

|00EC25| INX
|00EC26| INX

.darken_color
|00EC27| STX.b $B7

|00EC29| AND.w #$000F
|00EC2C| ASL A
|00EC2D| TAX

|00EC2E| LDA.l BitMasks,X
|00EC32| STA.b $0C

|00EC34| PHB
|00EC35| PHK
|00EC36| PLB

|00EC37| LDA.l $7EC009
|00EC3B| TAX

|00EC3C| LDA.w PaletteFilterColorAdd+0,X
|00EC3F| STA.b $06

|00EC41| LDA.w PaletteFilterColorAdd+4,X
|00EC44| STA.b $08

|00EC46| LDA.w PaletteFilterColorAdd+8,X
|00EC49| STA.b $0A

|00EC4B| LDX.w #$01A0
|00EC4E| LDA.w #$01B0
|00EC51| JMP.w PaletteFilter_AttractPlaque_do_filtering

;===================================================================================================

PaletteFilter_KholdstareShell_init:
|00EC54| REP #$20

|00EC56| LDX.b #$0E

.next_color
|00EC58| LDA.l $7EC380,X
|00EC5C| STA.l $7EC580,X

|00EC60| DEX
|00EC61| DEX
|00EC62| BPL .next_color

;---------------------------------------------------------------------------------------------------

|00EC64| LDA.w #$0000
|00EC67| STA.l $7EC007
|00EC6B| STA.l $7EC009

|00EC6F| SEP #$20

|00EC71| INC.b $15

|00EC73| INC.b $B0

|00EC75| RTL

;===================================================================================================

PaletteFilter_KholdstareShell_disable_subscreen:
|00EC76| STZ.b $1D

|00EC78| RTL

;===================================================================================================

PaletteFilter_KholdstareShell:
|00EC79| LDA.b $B0
|00EC7B| BEQ PaletteFilter_KholdstareShell_init

|00EC7D| JSL .filter

|00EC81| LDA.l $7EC007
|00EC85| BEQ PaletteFilter_KholdstareShell_disable_subscreen

;---------------------------------------------------------------------------------------------------

.filter
|00EC87| REP #$30

|00EC89| LDX.w #PaletteFilterColorMasks

|00EC8C| LDA.l $7EC007
|00EC90| CMP.w #$0010
|00EC93| BCC .darken_color

|00EC95| INX
|00EC96| INX

.darken_color
|00EC97| STX.b $B7

|00EC99| AND.w #$000F
|00EC9C| ASL A
|00EC9D| TAX

|00EC9E| LDA.l BitMasks,X
|00ECA2| STA.b $0C

|00ECA4| PHB
|00ECA5| PHK
|00ECA6| PLB

|00ECA7| LDA.l $7EC009
|00ECAB| TAX

|00ECAC| LDA.w PaletteFilterColorAdd+0,X
|00ECAF| STA.b $06

|00ECB1| LDA.w PaletteFilterColorAdd+4,X
|00ECB4| STA.b $08

|00ECB6| LDA.w PaletteFilterColorAdd+8,X
|00ECB9| STA.b $0A

|00ECBB| LDX.w #$0080
|00ECBE| LDA.w #$0090
|00ECC1| JMP.w PaletteFilter_AttractPlaque_do_filtering

;===================================================================================================

pool AgahnimWarpShadowFilter

.palette_offset
|00ECC4| dw $0160
|00ECC6| dw $0180
|00ECC8| dw $01A0

endpool

;---------------------------------------------------------------------------------------------------

AgahnimWarpShadowFilter:
|00ECCA| PHX

|00ECCB| TXA
|00ECCC| ASL A
|00ECCD| TAX

|00ECCE| REP #$20

|00ECD0| LDA.l $7EC019,X
|00ECD4| STA.l $7EC007

|00ECD8| LDA.l $7EC01F,X
|00ECDC| STA.l $7EC009

|00ECE0| LDA.l .palette_offset,X
|00ECE4| STA.b $00

|00ECE6| CLC
|00ECE7| ADC.w #$0010
|00ECEA| STA.b $02

|00ECEC| REP #$10

|00ECEE| JSR AgahnimWarpShadowFilter_filter_one

|00ECF1| LDA.l $7EC007
|00ECF5| BEQ .done

|00ECF7| JSR AgahnimWarpShadowFilter_filter_one

;---------------------------------------------------------------------------------------------------

.done
|00ECFA| SEP #$30

|00ECFC| PLX
|00ECFD| PHX

|00ECFE| TXA
|00ECFF| ASL A
|00ED00| TAX

|00ED01| REP #$20

|00ED03| LDA.l $7EC007
|00ED07| STA.l $7EC019,X

|00ED0B| LDA.l $7EC009
|00ED0F| STA.l $7EC01F,X

|00ED13| SEP #$20

|00ED15| PLX

|00ED16| INC.b $15

|00ED18| RTL

;===================================================================================================

AgahnimWarpShadowFilter_filter_one:
|00ED19| LDY.w #PaletteFilterColorMasks

|00ED1C| LDA.l $7EC007
|00ED20| CMP.w #$0010
|00ED23| BCC .darken_color

|00ED25| INY
|00ED26| INY

.darken_color
|00ED27| STY.b $B7

|00ED29| AND.w #$000F
|00ED2C| ASL A
|00ED2D| TAX

|00ED2E| LDA.l BitMasks,X
|00ED32| STA.b $0C

;---------------------------------------------------------------------------------------------------

|00ED34| PHB
|00ED35| PHK
|00ED36| PLB

|00ED37| LDA.l $7EC009
|00ED3B| TAX

|00ED3C| LDA.w PaletteFilterColorAdd+0,X
|00ED3F| STA.b $06

|00ED41| LDA.w PaletteFilterColorAdd+4,X
|00ED44| STA.b $08

|00ED46| LDA.w PaletteFilterColorAdd+8,X
|00ED49| STA.b $0A

;---------------------------------------------------------------------------------------------------

|00ED4B| LDX.b $00
|00ED4D| PHX

|00ED4E| LDA.b $02
|00ED50| PHA

|00ED51| JSR FilterColorsInRange

|00ED54| PLA
|00ED55| STA.b $02

|00ED57| PLX
|00ED58| STX.b $00

|00ED5A| PLB

|00ED5B| LDA.l $7EC007
|00ED5F| INC A
|00ED60| STA.l $7EC007

|00ED64| CMP.w #$001F
|00ED67| BNE .exit

|00ED69| LDA.w #$0000
|00ED6C| STA.l $7EC007

|00ED70| LDA.l $7EC009
|00ED74| EOR.w #$0002
|00ED77| STA.l $7EC009

.exit
|00ED7B| RTS

;===================================================================================================

IntroLogoPaletteFadeIn:
|00ED7C| REP #$30

|00ED7E| LDX.w #$0100
|00ED81| LDA.w #$01A0
|00ED84| JSR PaletteFilter_RestoreAdditive

|00ED87| LDX.w #$00C0
|00ED8A| LDA.w #$0100
|00ED8D| BRA .finish

;---------------------------------------------------------------------------------------------------

#IntroTitleCardPaletteFadeIn:
|00ED8F| REP #$30

|00ED91| LDX.w #$0040
|00ED94| LDA.w #$00C0
|00ED97| JSR PaletteFilter_RestoreAdditive

|00ED9A| LDX.w #$0040
|00ED9D| LDA.w #$00C0

;---------------------------------------------------------------------------------------------------

.finish
|00EDA0| JSR PaletteFilter_RestoreAdditive

|00EDA3| SEP #$30

|00EDA5| LDA.l $7EC007
|00EDA9| DEC A
|00EDAA| STA.l $7EC007

|00EDAE| INC.b $15

|00EDB0| RTL

;===================================================================================================

PaletteFilter_RestoreTRock:
|00EDB1| REP #$30

|00EDB3| LDX.w #$00B0
|00EDB6| LDA.w #$00C0
|00EDB9| JSR PaletteFilter_RestoreAdditive

|00EDBC| LDX.w #$00D0
|00EDBF| LDA.w #$00E0
|00EDC2| JSR PaletteFilter_RestoreSubtractive

|00EDC5| SEP #$30

|00EDC7| INC.b $15

|00EDC9| RTL

;===================================================================================================

PaletteFilter_RestoreAdditive:
|00EDCA| STA.b $0E

.next_color
|00EDCC| LDA.l $7EC500,X
|00EDD0| TAY

|00EDD1| AND.w #$001F
|00EDD4| STA.b $08

|00EDD6| TYA
|00EDD7| AND.w #$03E0
|00EDDA| STA.b $0A

|00EDDC| TYA
|00EDDD| AND.w #$7C00
|00EDE0| STA.b $0C

|00EDE2| LDA.l $7EC300,X
|00EDE6| AND.w #$001F
|00EDE9| CMP.b $08
|00EDEB| BEQ .red_equal

|00EDED| TYA
|00EDEE| CLC
|00EDEF| ADC.w #$0001
|00EDF2| TAY

.red_equal
|00EDF3| LDA.l $7EC300,X
|00EDF7| AND.w #$03E0
|00EDFA| CMP.b $0A
|00EDFC| BEQ .green_equal

|00EDFE| TYA
|00EDFF| CLC
|00EE00| ADC.w #$0020
|00EE03| TAY

.green_equal
|00EE04| LDA.l $7EC300,X
|00EE08| AND.w #$7C00
|00EE0B| CMP.b $0C
|00EE0D| BEQ .blue_equal

|00EE0F| TYA
|00EE10| CLC
|00EE11| ADC.w #$0400
|00EE14| TAY

.blue_equal
|00EE15| TYA
|00EE16| STA.l $7EC500,X

|00EE1A| INX
|00EE1B| INX
|00EE1C| CPX.b $0E
|00EE1E| BNE .next_color

|00EE20| RTS

;===================================================================================================

PaletteFilter_RestoreSubtractive:
|00EE21| STA.b $0E

.next_color
|00EE23| LDA.l $7EC500,X
|00EE27| TAY

|00EE28| AND.w #$001F
|00EE2B| STA.b $08

|00EE2D| TYA
|00EE2E| AND.w #$03E0
|00EE31| STA.b $0A

|00EE33| TYA
|00EE34| AND.w #$7C00
|00EE37| STA.b $0C

|00EE39| LDA.l $7EC300,X
|00EE3D| AND.w #$001F
|00EE40| CMP.b $08
|00EE42| BEQ .red_equal

|00EE44| TYA
|00EE45| SEC
|00EE46| SBC.w #$0001
|00EE49| TAY

.red_equal
|00EE4A| LDA.l $7EC300,X
|00EE4E| AND.w #$03E0
|00EE51| CMP.b $0A
|00EE53| BEQ .green_equal

|00EE55| TYA
|00EE56| SEC
|00EE57| SBC.w #$0020
|00EE5A| TAY

.green_equal
|00EE5B| LDA.l $7EC300,X
|00EE5F| AND.w #$7C00
|00EE62| CMP.b $0C
|00EE64| BEQ .blue_equal

|00EE66| TYA
|00EE67| SEC
|00EE68| SBC.w #$0400
|00EE6B| TAY

.blue_equal
|00EE6C| TYA
|00EE6D| STA.l $7EC500,X

|00EE71| INX
|00EE72| INX
|00EE73| CPX.b $0E
|00EE75| BNE .next_color

|00EE77| RTS

;===================================================================================================

PaletteFilter_InitializeWhiteFilter:
|00EE78| REP #$20

|00EE7A| LDX.b #$00

|00EE7C| LDA.w #$7FFF ; RGB: #F8F8F8

.next_white
|00EE7F| STA.l $7EC300,X
|00EE83| STA.l $7EC340,X
|00EE87| STA.l $7EC380,X
|00EE8B| STA.l $7EC3C0,X

|00EE8F| STA.l $7EC400,X
|00EE93| STA.l $7EC440,X
|00EE97| STA.l $7EC480,X
|00EE9B| STA.l $7EC4C0,X

|00EE9F| INX
|00EEA0| INX
|00EEA1| CPX.b #$40
|00EEA3| BNE .next_white

;---------------------------------------------------------------------------------------------------

|00EEA5| LDA.l $7EC500
|00EEA9| STA.l $7EC540

|00EEAD| LDA.w #$0000
|00EEB0| STA.l $7EC007

|00EEB4| LDA.w #$0002
|00EEB7| STA.l $7EC009

|00EEBB| LDA.b $8A
|00EEBD| CMP.w #$001B ; OW 1B
|00EEC0| BNE .not_hyrule_castle

|00EEC2| LDA.w #$0000 ; RGB: #000000
|00EEC5| STA.l $7EC300
|00EEC9| STA.l $7EC340
|00EECD| STA.l $7EC500
|00EED1| STA.l $7EC540

.not_hyrule_castle
|00EED5| SEP #$20

|00EED7| LDA.b #$08
|00EED9| STA.w $06BB
|00EEDC| STZ.w $06BA

|00EEDF| RTL

;===================================================================================================

MirrorWarp_GoToSubmodules:
|00EEE0| JSL AnimateMirrorWarp

;---------------------------------------------------------------------------------------------------

#EXIT_00EEE4:
|00EEE4| SEP #$30

|00EEE6| RTL

;---------------------------------------------------------------------------------------------------

MirrorWarp_RunAnimationSubmodules:
|00EEE7| DEC.w $06BB
|00EEEA| BNE MirrorWarp_GoToSubmodules

|00EEEC| LDA.b #$02
|00EEEE| STA.w $06BB

;===================================================================================================

PaletteFilter_BlindingWhite:
|00EEF1| REP #$30

|00EEF3| LDA.l $7EC009
|00EEF7| CMP.w #$00FF
|00EEFA| BEQ EXIT_00EEE4

|00EEFC| CMP.w #$0002
|00EEFF| BNE .restore_subtractive

|00EF01| LDX.w #$0040
|00EF04| LDA.w #$01B0
|00EF07| JSR PaletteFilter_RestoreAdditive

|00EF0A| LDX.w #$01C0
|00EF0D| LDA.w #$01E0
|00EF10| JSR PaletteFilter_RestoreAdditive

|00EF13| BRA PaletteFilter_StartBlindingWhite

.restore_subtractive
|00EF15| LDX.w #$0040
|00EF18| LDA.w #$01B0
|00EF1B| JSR PaletteFilter_RestoreSubtractive

|00EF1E| LDX.w #$01C0
|00EF21| LDA.w #$01E0
|00EF24| JSR PaletteFilter_RestoreSubtractive

;===================================================================================================

PaletteFilter_StartBlindingWhite:
|00EF27| LDA.l $7EC540
|00EF2B| STA.l $7EC500

|00EF2F| LDA.l $7EC009
|00EF33| BNE .check_shorter

|00EF35| LDA.l $7EC007
|00EF39| INC A
|00EF3A| STA.l $7EC007

|00EF3E| CMP.w #$0042
|00EF41| BNE .trigger_update

|00EF43| LDA.w #$00FF
|00EF46| STA.l $7EC009

|00EF4A| SEP #$20

|00EF4C| LDA.b #$20
|00EF4E| STA.w $06BB

.trigger_update
|00EF51| SEP #$30

|00EF53| INC.b $15

|00EF55| RTL

;---------------------------------------------------------------------------------------------------

.check_shorter
|00EF56| LDA.l $7EC007
|00EF5A| INC A
|00EF5B| STA.l $7EC007

|00EF5F| CMP.w #$001F
|00EF62| BNE .trigger_update

|00EF64| LDA.l $7EC009
|00EF68| EOR.w #$0002
|00EF6B| STA.l $7EC009

|00EF6F| SEP #$30

|00EF71| LDA.b $10
|00EF73| CMP.b #$15
|00EF75| BNE .exit

|00EF77| STZ.w HDMAEN
|00EF7A| STZ.b $9B

|00EF7C| REP #$20

|00EF7E| LDX.b #$3E
|00EF80| LDA.w #$0778
|00EF83| JSL InitializeHDMATable

|00EF87| INC.b $15

.exit
|00EF89| RTL

;===================================================================================================

PaletteFilter_BlindingWhiteTriforce:
|00EF8A| REP #$30

|00EF8C| LDX.w #$0040
|00EF8F| LDA.w #$0200
|00EF92| JSR PaletteFilter_RestoreAdditive

|00EF95| BRA PaletteFilter_StartBlindingWhite

;===================================================================================================

PaletteFilter_WhirlpoolBlue:
|00EF97| LDA.b $1A
|00EF99| LSR A
|00EF9A| BCC .skip

|00EF9C| REP #$30

|00EF9E| PHB
|00EF9F| PHK
|00EFA0| PLB

;---------------------------------------------------------------------------------------------------

|00EFA1| LDX.w #$0040

.next_color
|00EFA4| LDA.l $7EC500,X
|00EFA8| TAY

|00EFA9| AND.w #$7C00
|00EFAC| CMP.w #$7C00
|00EFAF| BEQ .max_blue

|00EFB1| TYA
|00EFB2| CLC
|00EFB3| ADC.w #$0400
|00EFB6| TAY

.max_blue
|00EFB7| TYA
|00EFB8| STA.l $7EC500,X

|00EFBC| INX
|00EFBD| INX
|00EFBE| CPX.w #$0200
|00EFC1| BNE .next_color

;---------------------------------------------------------------------------------------------------

|00EFC3| LDA.l $7EC540
|00EFC7| STA.l $7EC500

|00EFCB| PLB

|00EFCC| SEP #$20

|00EFCE| LDA.l $7EC007
|00EFD2| LSR A
|00EFD3| BCS .no_mosaic_increment

|00EFD5| LDA.l $7EC011
|00EFD9| CLC
|00EFDA| ADC.b #$10
|00EFDC| STA.l $7EC011

.no_mosaic_increment
|00EFE0| LDA.l $7EC007
|00EFE4| INC A
|00EFE5| STA.l $7EC007

|00EFE9| CMP.b #$1F
|00EFEB| BNE .skip

|00EFED| LDA.b #$00
|00EFEF| STA.l $7EC007

|00EFF3| INC.b $B0

|00EFF5| LDA.b #$F0
|00EFF7| STA.l $7EC011

;---------------------------------------------------------------------------------------------------

.skip
|00EFFB| SEP #$30

|00EFFD| LDA.b #$09
|00EFFF| STA.b $94

|00F001| LDA.l $7EC011
|00F005| ORA.b #$03
|00F007| STA.b $95

|00F009| INC.b $15

|00F00B| RTL

;===================================================================================================

PaletteFilter_IsolateWhirlpoolBlue:
|00F00C| REP #$30

|00F00E| PHB
|00F00F| PHK
|00F010| PLB

|00F011| LDX.w #$0040

.next_color_isolated
|00F014| LDA.l $7EC500,X
|00F018| TAY

|00F019| AND.w #$03E0
|00F01C| BEQ .no_green

|00F01E| TYA
|00F01F| SEC
|00F020| SBC.w #$0020
|00F023| TAY

.no_green
|00F024| TYA
|00F025| AND.w #$001F
|00F028| BEQ .no_red

|00F02A| TYA
|00F02B| SEC
|00F02C| SBC.w #$0001
|00F02F| TAY

.no_red
|00F030| TYA
|00F031| STA.l $7EC500,X

|00F035| INX
|00F036| INX
|00F037| CPX.w #$0200
|00F03A| BNE .next_color_isolated

;---------------------------------------------------------------------------------------------------

|00F03C| LDA.l $7EC540
|00F040| STA.l $7EC500

|00F044| PLB

|00F045| SEP #$20

|00F047| JMP.w PaletteFilter_WhirlpoolBlue.no_mosaic_increment

;===================================================================================================

PaletteFilter_WhirlpoolRestoreBlue:
|00F04A| LDA.b $1A
|00F04C| LSR A
|00F04D| BCC .skip

|00F04F| REP #$30

|00F051| PHB
|00F052| PHK
|00F053| PLB

|00F054| LDX.w #$0040

.next_color
|00F057| LDA.l $7EC300,X
|00F05B| AND.w #$7C00
|00F05E| STA.b $00

|00F060| LDA.l $7EC500,X
|00F064| TAY

|00F065| AND.w #$7C00
|00F068| CMP.b $00
|00F06A| BEQ .blue_equal

|00F06C| TYA
|00F06D| SEC
|00F06E| SBC.w #$0400
|00F071| TAY

.blue_equal
|00F072| TYA
|00F073| STA.l $7EC500,X

|00F077| INX
|00F078| INX
|00F079| CPX.w #$0200
|00F07C| BNE .next_color

;---------------------------------------------------------------------------------------------------

|00F07E| LDA.l $7EC540
|00F082| STA.l $7EC500

|00F086| PLB

|00F087| SEP #$20

|00F089| LDA.l $7EC007
|00F08D| LSR A
|00F08E| BCS .no_mosaic_decrement

|00F090| LDA.l $7EC011
|00F094| BEQ .no_mosaic_decrement

|00F096| SEC
|00F097| SBC.b #$10
|00F099| STA.l $7EC011

.no_mosaic_decrement
|00F09D| LDA.l $7EC007
|00F0A1| INC A
|00F0A2| STA.l $7EC007

|00F0A6| CMP.b #$1F
|00F0A8| BNE .skip

|00F0AA| LDA.b #$00
|00F0AC| STA.l $7EC007
|00F0B0| STA.l $7EC011

|00F0B4| INC.b $B0

;---------------------------------------------------------------------------------------------------

.skip
|00F0B6| SEP #$30

|00F0B8| LDA.b #$09
|00F0BA| STA.b $94

|00F0BC| LDA.l $7EC011
|00F0C0| ORA.b #$03
|00F0C2| STA.b $95

|00F0C4| INC.b $15

|00F0C6| RTL

;===================================================================================================

PaletteFilter_WhirlpoolRestoreRedGreen:
|00F0C7| REP #$30

|00F0C9| PHB
|00F0CA| PHK
|00F0CB| PLB

|00F0CC| LDX.w #$0040

.next_color
|00F0CF| LDA.l $7EC300,X
|00F0D3| AND.w #$03E0
|00F0D6| STA.b $00

|00F0D8| LDA.l $7EC300,X
|00F0DC| AND.w #$001F
|00F0DF| STA.b $02

|00F0E1| LDA.l $7EC500,X
|00F0E5| TAY

|00F0E6| AND.w #$03E0
|00F0E9| CMP.b $00
|00F0EB| BEQ .green_equal

|00F0ED| TYA
|00F0EE| CLC
|00F0EF| ADC.w #$0020
|00F0F2| TAY

.green_equal
|00F0F3| TYA
|00F0F4| AND.w #$001F
|00F0F7| CMP.b $02
|00F0F9| BEQ .red_equal

|00F0FB| TYA
|00F0FC| CLC
|00F0FD| ADC.w #$0001
|00F100| TAY

.red_equal
|00F101| TYA
|00F102| STA.l $7EC500,X

|00F106| INX
|00F107| INX
|00F108| CPX.w #$0200
|00F10B| BNE .next_color

;---------------------------------------------------------------------------------------------------

|00F10D| LDA.l $7EC540
|00F111| STA.l $7EC500

|00F115| PLB

|00F116| SEP #$20

|00F118| LDA.l $7EC007

|00F11C| INC A
|00F11D| STA.l $7EC007

|00F121| CMP.b #$1F
|00F123| BNE .still_going

|00F125| LDA.b #$00
|00F127| STA.l $7EC007

|00F12B| INC.b $B0

.still_going
|00F12D| SEP #$30

|00F12F| INC.b $15

|00F131| RTL

;---------------------------------------------------------------------------------------------------

#EXIT_00F132:
|00F132| SEP #$30

|00F134| RTL

;===================================================================================================

PaletteFilter_RestoreBGSubstractiveStrict:
|00F135| REP #$30

|00F137| LDA.l $7EC009
|00F13B| CMP.w #$00FF
|00F13E| BEQ EXIT_00F132

|00F140| PHB
|00F141| PHK
|00F142| PLB

|00F143| LDX.w #$0040
|00F146| LDA.w #$0100
|00F149| JSR PaletteFilter_RestoreSubtractive

|00F14C| PLB

|00F14D| LDA.l $7EC007
|00F151| INC A
|00F152| STA.l $7EC007

|00F156| CMP.w #$0020
|00F159| BNE .still_going

|00F15B| LDA.w #$00FF
|00F15E| STA.l $7EC009

|00F162| STZ.b $1D

.still_going
|00F164| SEP #$30

|00F166| INC.b $15

|00F168| RTL

;===================================================================================================

PaletteFilter_RestoreBGAdditiveStrict:
|00F169| REP #$30

|00F16B| PHB
|00F16C| PHK
|00F16D| PLB

|00F16E| LDX.w #$0040
|00F171| LDA.w #$0100
|00F174| JSR PaletteFilter_RestoreAdditive

|00F177| PLB

|00F178| LDA.l $7EC007
|00F17C| INC A
|00F17D| STA.l $7EC007

|00F181| BRA PaletteFilter_RestoreBGSubstractiveStrict.still_going

;===================================================================================================

FlashTrinexxShellRed:
|00F183| LDA.w $04BE
|00F186| BNE TrinexxFilterRed_tick_timer

|00F188| REP #$20

|00F18A| LDX.b #$00

.next_color
|00F18C| LDA.l $7EC582,X
|00F190| AND.w #$001F
|00F193| CMP.w #$001F
|00F196| BEQ .red_equal

|00F198| CLC
|00F199| ADC.w #$0001

.red_equal
|00F19C| STA.b $00

|00F19E| LDA.l $7EC582,X
|00F1A2| AND.w #$FFE0
|00F1A5| ORA.b $00
|00F1A7| STA.l $7EC582,X

|00F1AB| INX
|00F1AC| INX
|00F1AD| CPX.b #$0E
|00F1AF| BNE .next_color

;---------------------------------------------------------------------------------------------------

#TrinexxFilterRed_continue:
|00F1B1| SEP #$20

|00F1B3| INC.b $15

|00F1B5| INC.w $04C0

|00F1B8| LDA.w $04C0
|00F1BB| CMP.b #$0C
|00F1BD| BCS .done

|00F1BF| LDA.b #$03
|00F1C1| STA.w $04BE

;---------------------------------------------------------------------------------------------------

#TrinexxFilterRed_tick_timer:
|00F1C4| DEC.w $04BE

|00F1C7| RTL

;---------------------------------------------------------------------------------------------------

.done
|00F1C8| STZ.w $04BE
|00F1CB| STZ.w $04C0

|00F1CE| RTL

;===================================================================================================

UnflashTrinexxShellRed:
|00F1CF| LDA.w $04BE
|00F1D2| BNE TrinexxFilterRed_tick_timer

|00F1D4| REP #$20

|00F1D6| LDX.b #$00

.next_color
|00F1D8| LDA.l $7EC382,X
|00F1DC| AND.w #$001F
|00F1DF| STA.b $0C

|00F1E1| LDA.l $7EC582,X
|00F1E5| AND.w #$001F
|00F1E8| CMP.b $0C
|00F1EA| BEQ .red_equal

|00F1EC| SEC
|00F1ED| SBC.w #$0001

.red_equal
|00F1F0| STA.b $00

|00F1F2| LDA.l $7EC582,X
|00F1F6| AND.w #$FFE0
|00F1F9| ORA.b $00
|00F1FB| STA.l $7EC582,X

|00F1FF| INX
|00F200| INX
|00F201| CPX.b #$0E
|00F203| BNE .next_color

|00F205| BRA TrinexxFilterRed_continue

;===================================================================================================

FlashTrinexxShellBlue:
|00F207| LDA.w $04BF
|00F20A| BNE TrinexxFilterBlue_tick_timer

|00F20C| REP #$20

|00F20E| LDX.b #$00

.next_color
|00F210| LDA.l $7EC582,X
|00F214| AND.w #$7C00
|00F217| CMP.w #$7C00
|00F21A| BEQ .blue_equal

|00F21C| CLC
|00F21D| ADC.w #$0400

.blue_equal
|00F220| STA.b $00

|00F222| LDA.l $7EC582,X
|00F226| AND.w #$83FF
|00F229| ORA.b $00
|00F22B| STA.l $7EC582,X

|00F22F| INX
|00F230| INX
|00F231| CPX.b #$0E
|00F233| BNE .next_color

;---------------------------------------------------------------------------------------------------

#TrinexxFilterBlue_continue:
|00F235| SEP #$20

|00F237| INC.b $15

|00F239| INC.w $04C1

|00F23C| LDA.w $04C1
|00F23F| CMP.b #$0C
|00F241| BCS .done

|00F243| LDA.b #$03
|00F245| STA.w $04BF

;---------------------------------------------------------------------------------------------------

#TrinexxFilterBlue_tick_timer:
|00F248| DEC.w $04BF

|00F24B| RTL

;---------------------------------------------------------------------------------------------------

.done
|00F24C| STZ.w $04BF
|00F24F| STZ.w $04C1

|00F252| RTL

;===================================================================================================

UnflashTrinexxShellBlue:
|00F253| LDA.w $04BF
|00F256| BNE TrinexxFilterBlue_tick_timer

|00F258| REP #$20

|00F25A| LDX.b #$00

.next_color
|00F25C| LDA.l $7EC382,X
|00F260| AND.w #$7C00
|00F263| STA.b $0C

|00F265| LDA.l $7EC582,X
|00F269| AND.w #$7C00
|00F26C| CMP.b $0C
|00F26E| BEQ .blue_equal

|00F270| SEC
|00F271| SBC.w #$0400

.blue_equal
|00F274| STA.b $00

|00F276| LDA.l $7EC582,X
|00F27A| AND.w #$83FF
|00F27D| ORA.b $00
|00F27F| STA.l $7EC582,X

|00F283| INX
|00F284| INX
|00F285| CPX.b #$0E
|00F287| BNE .next_color

|00F289| BRA TrinexxFilterBlue_continue

;===================================================================================================

IrisSpotlight_close:
|00F28B| REP #$10

|00F28D| LDY.w #$0000
|00F290| LDX.w #$007E

|00F293| BRA .continue

;===================================================================================================

#IrisSpotlight_open:
|00F295| REP #$10

|00F297| LDY.w #$0002
|00F29A| LDX.w #$0000

;---------------------------------------------------------------------------------------------------

.continue
|00F29D| STY.w $067E

|00F2A0| STX.w $067C

|00F2A3| STZ.w HDMAEN

|00F2A6| LDX.w #$2641
|00F2A9| STX.w DMA6MODE
|00F2AC| STX.w DMA7MODE

|00F2AF| LDX.w #.hdma_table
|00F2B2| STX.w DMA6ADDRL
|00F2B5| STX.w DMA7ADDRL

|00F2B8| LDA.b #^.hdma_table
|00F2BA| STA.w DMA6ADDRB
|00F2BD| STA.w DMA7ADDRB

|00F2C0| LDA.b #$00
|00F2C2| STA.w HDMA6ITBLB
|00F2C5| STA.w HDMA7ITBLB

;---------------------------------------------------------------------------------------------------

|00F2C8| LDA.b #$33
|00F2CA| STA.b $96

|00F2CC| LDA.b #$03
|00F2CE| STA.b $97

|00F2D0| LDA.b #$33
|00F2D2| STA.b $98

|00F2D4| LDA.b $1C
|00F2D6| STA.b $1E

|00F2D8| LDA.b $1D
|00F2DA| STA.b $1F

|00F2DC| LDA.b $1B
|00F2DE| BNE .indoors

|00F2E0| LDA.b #$20 ; Fixed color RGB: #000000
|00F2E2| STA.b $9C

|00F2E4| LDA.b #$40
|00F2E6| STA.b $9D

|00F2E8| LDA.b #$80
|00F2EA| STA.b $9E

;---------------------------------------------------------------------------------------------------

.indoors
|00F2EC| SEP #$10

|00F2EE| JSL IrisSpotlight_ConfigureTable

|00F2F2| LDA.b #$80
|00F2F4| STA.b $9B

|00F2F6| LDA.b #$0F
|00F2F8| STA.b $13

|00F2FA| RTL

;---------------------------------------------------------------------------------------------------

.hdma_table
|00F2FB| db $F8 : dw $1B00 ; 120 lines continuous
|00F2FE| db $F8 : dw $1BF0 ; 120 lines continuous
|00F301| db $00 ; end

;===================================================================================================

pool IrisSpotlight_ConfigureTable

.delta
|00F302| dw -7
|00F304| dw  7
|00F306| dw  7
|00F308| dw  7

.target
|00F30A| dw $0000
|00F30C| dw $007E
|00F30E| dw $0023
|00F310| dw $007E

endpool

;---------------------------------------------------------------------------------------------------

IrisSpotlight_ConfigureTable:
|00F312| PHB
|00F313| PHK
|00F314| PLB

|00F315| REP #$30

|00F317| LDA.b $20
|00F319| SEC
|00F31A| SBC.b $E8
|00F31C| CLC
|00F31D| ADC.w #$000C
|00F320| STA.b $0E

|00F322| SEC
|00F323| SBC.w $067C
|00F326| STA.w $0674

|00F329| LDA.b $0E
|00F32B| CLC
|00F32C| ADC.w $067C
|00F32F| STA.w $0676

;---------------------------------------------------------------------------------------------------

|00F332| LDA.b $22
|00F334| SEC
|00F335| SBC.b $E2
|00F337| CLC
|00F338| ADC.w #$0008
|00F33B| STA.w $0670

|00F33E| LDA.w $067C
|00F341| STA.w $067A

|00F344| LDA.b $0E
|00F346| ASL A
|00F347| STA.b $06

;---------------------------------------------------------------------------------------------------

|00F349| CMP.w #$00E0
|00F34C| BCS .big_enough

|00F34E| LDA.w #$00E0
|00F351| STA.b $06

.big_enough
|00F353| LDA.b $06
|00F355| SEC
|00F356| SBC.b $0E
|00F358| STA.b $0A

|00F35A| LDA.b $0E
|00F35C| SEC
|00F35D| SBC.b $0A
|00F35F| STA.b $04

;---------------------------------------------------------------------------------------------------

.next_check
|00F361| LDA.w #$00FF
|00F364| STA.b $08

|00F366| LDA.b $06
|00F368| CMP.w $0676
|00F36B| BCS .past_calced_size

|00F36D| LDA.w $067A
|00F370| BEQ .at_zero

|00F372| DEC.w $067A

.at_zero
|00F375| JSR IrisSpotlight_CalculateCircleValue

.past_calced_size
|00F378| LDA.b $04
|00F37A| ASL A
|00F37B| CMP.w #$01C0
|00F37E| BCS .skip_update_a

|00F380| TAX

|00F381| LDA.b $08
|00F383| STA.l $7F7000,X

.skip_update_a
|00F387| LDA.b $06
|00F389| ASL A
|00F38A| CMP.w #$01C0
|00F38D| BCS .skip_update_b

|00F38F| TAX

|00F390| LDA.b $08
|00F392| STA.l $7F7000,X

.skip_update_b
|00F396| LDA.b $0E
|00F398| CMP.b $04
|00F39A| BEQ .wait_for_scanline

|00F39C| INC.b $04

|00F39E| DEC.b $06

|00F3A0| JMP.w .next_check

;---------------------------------------------------------------------------------------------------

.wait_for_scanline
|00F3A3| LDA.w SLVH
|00F3A6| LDA.w STAT78

|00F3A9| LDA.w OPVCT
|00F3AC| AND.w #$00FF
|00F3AF| CMP.w #$00C0
|00F3B2| BCC .wait_for_scanline

|00F3B4| LDX.w #$0000

.copy_table
|00F3B7| LDA.l $7F7000,X
|00F3BB| STA.w $1B00,X

|00F3BE| INX
|00F3BF| INX
|00F3C0| CPX.w #$01C0
|00F3C3| BCC .copy_table

;---------------------------------------------------------------------------------------------------

|00F3C5| LDX.w $067E

|00F3C8| LDA.w $067C
|00F3CB| CLC
|00F3CC| ADC.w .delta,X
|00F3CF| STA.w $067C

|00F3D2| CMP.w .target,X
|00F3D5| BNE .exit

|00F3D7| SEP #$20

|00F3D9| LDA.w $067E
|00F3DC| BNE .reset_table

|00F3DE| LDA.b #$80
|00F3E0| STA.b $13
|00F3E2| STA.w INIDISP

|00F3E5| BRA .continue

;---------------------------------------------------------------------------------------------------

.reset_table
|00F3E7| JSL IrisSpotlight_ResetTable

.continue
|00F3EB| SEP #$30

|00F3ED| STZ.b $B0
|00F3EF| STZ.b $11

|00F3F1| LDA.b $10
|00F3F3| CMP.b #$07
|00F3F5| BEQ .underworld

|00F3F7| CMP.b #$10
|00F3F9| BNE .not_opening

.underworld
|00F3FB| LDA.b $1B
|00F3FD| BNE .check_music_command

|00F3FF| LDX.b $8A
|00F401| LDA.l $7F5B00,X
|00F405| LSR A
|00F406| LSR A
|00F407| LSR A
|00F408| LSR A
|00F409| STA.w $012D

.check_music_command
|00F40C| LDA.w $0132
|00F40F| CMP.b #$FF ; SONG FF - transfer
|00F411| BEQ .not_opening

|00F413| STA.w $012C

.not_opening
|00F416| LDA.w $010C
|00F419| STA.b $10

|00F41B| CMP.b #$06
|00F41D| BNE .exit

|00F41F| JSL ResetAllSprites

.exit
|00F423| SEP #$30

|00F425| PLB

|00F426| RTL

;===================================================================================================

IrisSpotlight_ResetTable:
|00F427| REP #$30

|00F429| LDX.w #$003E
|00F42C| LDA.w #$FF00

.next
|00F42F| STA.w $1B00,X
|00F432| STA.w $1B40,X
|00F435| STA.w $1B80,X
|00F438| STA.w $1BC0,X
|00F43B| STA.w $1C00,X
|00F43E| STA.w $1C40,X
|00F441| STA.w $1C80,X

|00F444| DEX
|00F445| DEX
|00F446| BPL .next

|00F448| SEP #$30

|00F44A| RTL

;===================================================================================================

pool IrisSpotlight_CalculateCircleValue

.multiplicand
|00F44B| db 255, 255, 255, 255, 255, 255, 255, 255
|00F453| db 255, 255, 255, 255, 254, 254, 254, 254
|00F45B| db 253, 253, 253, 253, 252, 252, 252, 251
|00F463| db 251, 251, 250, 250, 249, 249, 248, 248
|00F46B| db 247, 247, 246, 246, 245, 245, 244, 243
|00F473| db 243, 242, 241, 241, 240, 239, 238, 238
|00F47B| db 237, 236, 235, 234, 233, 233, 232, 231
|00F483| db 230, 229, 228, 227, 226, 225, 223, 222
|00F48B| db 221, 220, 219, 218, 216, 215, 214, 213
|00F493| db 211, 210, 208, 207, 205, 204, 202, 201
|00F49B| db 199, 198, 196, 194, 193, 191, 189, 187
|00F4A3| db 185, 183, 182, 180, 177, 175, 173, 171
|00F4AB| db 169, 167, 164, 162, 159, 157, 154, 151
|00F4B3| db 149, 146, 143, 140, 137, 134, 130, 127
|00F4BB| db 123, 120, 116, 112, 108, 103,  99,  94
|00F4C3| db  89,  83,  77,  70,  63,  55,  45,  31
|00F4CB| db   0

endpool

;---------------------------------------------------------------------------------------------------

IrisSpotlight_CalculateCircleValue:
|00F4CC| SEP #$30

|00F4CE| STA.w WRDIVH
|00F4D1| STZ.w WRDIVL

|00F4D4| LDA.w $067C
|00F4D7| STA.w WRDIVB

|00F4DA| NOP
|00F4DB| NOP
|00F4DC| NOP
|00F4DD| NOP
|00F4DE| NOP
|00F4DF| NOP

|00F4E0| REP #$20

|00F4E2| LDA.w RDDIV
|00F4E5| LSR A

|00F4E6| SEP #$20

|00F4E8| TAX

|00F4E9| LDY.w .multiplicand,X
|00F4EC| STY.b $0A
|00F4EE| STY.w WRMPYA

|00F4F1| LDA.w $067C
|00F4F4| STA.w WRMPYB

|00F4F7| NOP
|00F4F8| NOP

|00F4F9| STZ.b $01
|00F4FB| STZ.b $0B

|00F4FD| LDA.w RDMPYH
|00F500| STA.b $00

|00F502| REP #$30

|00F504| ASL.b $00
|00F506| LDA.b $0A
|00F508| BEQ .exit

|00F50A| LDA.b $00
|00F50C| CLC
|00F50D| ADC.w $0670
|00F510| STA.b $02

|00F512| LDA.w $0670
|00F515| SEC
|00F516| SBC.b $00

|00F518| STZ.b $00

|00F51A| BMI .positive

|00F51C| BIT.w #$FF00
|00F51F| BEQ .zero_high_a

|00F521| LDA.w #$00FF

.zero_high_a
|00F524| STA.b $00

.positive
|00F526| LDA.b $02
|00F528| BIT.w #$FF00
|00F52B| BEQ .zero_high_b

|00F52D| LDA.w #$00FF

.zero_high_b
|00F530| XBA
|00F531| ORA.b $00
|00F533| CMP.w #$FFFF
|00F536| BNE .keep

|00F538| LDA.w #$00FF

.keep
|00F53B| STA.b $08

.exit
|00F53D| RTS

;===================================================================================================

pool OrientVerticalLampCone OrientHorizontalLampCone

.horizontal
|00F53E| dw $0000, $0100, $0000, $0100

.vertical
|00F546| dw $0000, $0000, $0100, $0100

.adjust
|00F54E| dw $0034, $FFFE, $0038, $0006

.margin
|00F556| dw $0040, $0040, $0052, $FF50

.max
|00F55E| dw $0080, $0180, $00A0, $00A0

endpool

;---------------------------------------------------------------------------------------------------

#EXIT_00F566:
|00F566| RTL

;---------------------------------------------------------------------------------------------------

OrientLampLightCone:
|00F567| LDA.w $0458
|00F56A| BEQ EXIT_00F566

|00F56C| LDA.b $11
|00F56E| CMP.b #$14
|00F570| BEQ EXIT_00F566

|00F572| REP #$30

|00F574| LDA.b $2F
|00F576| AND.w #$00FF
|00F579| STA.b $00

|00F57B| TAX

|00F57C| LDA.b $6C
|00F57E| AND.w #$00FF
|00F581| BEQ .not_in_doorway

|00F583| AND.w #$00FE
|00F586| ASL A
|00F587| TAX
|00F588| BEQ .vertical_doorway

|00F58A| LDA.b $00
|00F58C| CMP.w #$0004
|00F58F| BCS .facing_horizontal

|00F591| LDA.b $22
|00F593| CLC
|00F594| ADC.w #$0008
|00F597| AND.w #$00FF

|00F59A| BRA .doorway_continue

.facing_horizontal
|00F59C| TAX

|00F59D| BRA .not_in_doorway

;---------------------------------------------------------------------------------------------------

.vertical_doorway
|00F59F| LDA.b $00
|00F5A1| CMP.w #$0004
|00F5A4| BCC .facing_horizontal

|00F5A6| LDA.b $20
|00F5A8| AND.w #$00FF

;---------------------------------------------------------------------------------------------------

.doorway_continue
|00F5AB| CMP.w #$0080
|00F5AE| BCC .not_in_doorway

|00F5B0| INX
|00F5B1| INX

.not_in_doorway
|00F5B2| CPX.w #$0004
|00F5B5| BCS OrientHorizontalLampCone

;===================================================================================================

OrientVerticalLampCone:
|00F5B7| LDA.b $22
|00F5B9| SEC
|00F5BA| SBC.w #$0077
|00F5BD| STA.b $00

|00F5BF| LDA.b $E2
|00F5C1| SEC
|00F5C2| SBC.b $00

|00F5C4| CLC
|00F5C5| ADC.l .horizontal,X
|00F5C9| STA.b $E0

|00F5CB| LDA.b $20
|00F5CD| SEC
|00F5CE| SBC.w #$0058
|00F5D1| STA.b $00

;---------------------------------------------------------------------------------------------------

|00F5D3| LDA.b $E8
|00F5D5| SEC
|00F5D6| SBC.b $00

|00F5D8| CLC
|00F5D9| ADC.l .vertical,X

|00F5DD| CLC
|00F5DE| ADC.l .adjust,X

|00F5E2| CLC
|00F5E3| ADC.l .margin,X

|00F5E7| BPL .lower_in_bounds

|00F5E9| LDA.w #$0000

.lower_in_bounds
|00F5EC| CMP.l .max,X
|00F5F0| BCC .upper_in_bounds

|00F5F2| LDA.l .max,X

.upper_in_bounds
|00F5F6| SEC
|00F5F7| SBC.l .margin,X
|00F5FB| STA.b $E6

|00F5FD| SEP #$30

|00F5FF| RTL

;===================================================================================================

OrientHorizontalLampCone:
|00F600| LDA.b $20
|00F602| SEC
|00F603| SBC.w #$0072
|00F606| STA.b $00

|00F608| LDA.b $E8
|00F60A| SEC
|00F60B| SBC.b $00

|00F60D| CLC
|00F60E| ADC.l .vertical,X
|00F612| STA.b $E6

|00F614| LDA.b $22
|00F616| SEC
|00F617| SBC.w #$0058
|00F61A| STA.b $00

;---------------------------------------------------------------------------------------------------

|00F61C| LDA.b $E2
|00F61E| SEC
|00F61F| SBC.b $00

|00F621| CLC
|00F622| ADC.l .horizontal,X

|00F626| CLC
|00F627| ADC.l .adjust,X

|00F62B| CLC
|00F62C| ADC.l .margin,X

|00F630| BPL .lower_in_bounds

|00F632| LDA.w #$0000

.lower_in_bounds
|00F635| CMP.l .max,X
|00F639| BCC .upper_in_bounds

|00F63B| LDA.l .max,X

.upper_in_bounds
|00F63F| SEC
|00F640| SBC.l .margin,X
|00F644| STA.b $E0

|00F646| SEP #$30

|00F648| RTL

;===================================================================================================

AdjustWaterHDMAWindow:
|00F649| REP #$30

|00F64B| LDA.w $0682
|00F64E| SEC
|00F64F| SBC.b $E8
|00F651| STA.b $0A

|00F653| SEC
|00F654| SBC.w $0684
|00F657| STA.w $0674

|00F65A| LDA.b $0A
|00F65C| CLC
|00F65D| ADC.w $0684

;===================================================================================================

AdjustWaterHDMAWindow_Horizontal:
|00F660| STA.w $0676

|00F663| LDA.w $0680
|00F666| SEC
|00F667| SBC.b $E2
|00F669| STA.w $0670

|00F66C| LDA.w $0686
|00F66F| BEQ .horizontal_zero

|00F671| DEC A

.horizontal_zero
|00F672| STA.b $0C

|00F674| CLC
|00F675| ADC.w $0670
|00F678| STA.b $02

|00F67A| LDA.w $0670
|00F67D| SEC
|00F67E| SBC.b $0C
|00F680| STA.b $00

|00F682| LDY.w #$0000
|00F685| BMI .positive_a

|00F687| TAY

|00F688| AND.w #$FF00
|00F68B| BEQ .positive_a

|00F68D| LDY.w #$00FF

.positive_a
|00F690| TYA
|00F691| AND.w #$00FF
|00F694| STA.b $00

|00F696| LDA.b $02
|00F698| TAY

|00F699| AND.w #$FF00
|00F69C| BEQ .positive_b

|00F69E| LDY.w #$00FF

.positive_b
|00F6A1| TYA
|00F6A2| AND.w #$00FF
|00F6A5| XBA
|00F6A6| ORA.b $00
|00F6A8| STA.b $0C

|00F6AA| LDA.b $0A
|00F6AC| ASL A
|00F6AD| STA.b $06

|00F6AF| CMP.w #$00E0
|00F6B2| BCS .not_too_far

|00F6B4| LDA.w #$00E0
|00F6B7| STA.b $06

.not_too_far
|00F6B9| LDA.b $06
|00F6BB| SEC
|00F6BC| SBC.b $0A
|00F6BE| STA.b $08

|00F6C0| LDA.b $0A
|00F6C2| SEC
|00F6C3| SBC.b $08
|00F6C5| STA.b $04

|00F6C7| BRA .start

;---------------------------------------------------------------------------------------------------

.next
|00F6C9| INC.b $04

|00F6CB| DEC.b $06

.start
|00F6CD| LDA.b $04
|00F6CF| BMI .dont_add_to_hdma_y

|00F6D1| LDA.w $0674
|00F6D4| BMI .no_new_line_y

|00F6D6| LDA.b $04
|00F6D8| CMP.w $0674
|00F6DB| BCS .no_new_line_y

|00F6DD| ASL A
|00F6DE| TAX

|00F6DF| LDA.w #$00FF

|00F6E2| BRA .check_for_entry_y

.no_new_line_y
|00F6E4| LDA.b $04
|00F6E6| ASL A
|00F6E7| TAX

|00F6E8| LDA.b $0C

.check_for_entry_y
|00F6EA| CPX.w #$01C0
|00F6ED| BCS .dont_add_to_hdma_y

|00F6EF| CMP.w #$FFFF
|00F6F2| BNE .not_end_y

|00F6F4| LDA.w #$00FF

.not_end_y
|00F6F7| STA.w $1B00,X

.dont_add_to_hdma_y
|00F6FA| LDA.b $06
|00F6FC| CMP.w $0676
|00F6FF| BCC .no_new_line_x

|00F701| ASL A
|00F702| TAX

|00F703| LDA.w #$00FF
|00F706| BRA .check_for_entry_x

.no_new_line_x
|00F708| CMP.w #$00E1
|00F70B| BCC .dont_change_boundary_x

|00F70D| LDA.w $0678
|00F710| BEQ .dont_change_boundary_x

|00F712| DEC.w $0678

.dont_change_boundary_x
|00F715| LDA.b $06
|00F717| ASL A
|00F718| TAX

|00F719| LDA.b $0C

.check_for_entry_x
|00F71B| CPX.w #$01C0
|00F71E| BCS .dont_add_to_hdma_x

|00F720| CMP.w #$FFFF
|00F723| BNE .not_end_x

|00F725| LDA.w #$00FF

.not_end_x
|00F728| STA.w $1B00,X

.dont_add_to_hdma_x
|00F72B| LDA.b $0A
|00F72D| CMP.b $04
|00F72F| BNE .next

|00F731| SEP #$30

|00F733| RTL

;===================================================================================================

PrepDamFloodHDMA:
|00F734| REP #$30

|00F736| STZ.b $04

|00F738| LDA.w $0682
|00F73B| SEC
|00F73C| SBC.b $E8
|00F73E| STA.w $0674

|00F741| LDA.w $0680
|00F744| SEC
|00F745| SBC.b $E2
|00F747| STA.w $0670

|00F74A| LDA.w $0686
|00F74D| EOR.w #$0001
|00F750| STA.b $0E

|00F752| CLC
|00F753| ADC.w $0670
|00F756| STA.b $02

|00F758| LDA.w $0670
|00F75B| SEC
|00F75C| SBC.b $0E
|00F75E| AND.w #$00FF
|00F761| STA.b $00

|00F763| LDA.b $02
|00F765| AND.w #$00FF
|00F768| XBA
|00F769| ORA.b $00
|00F76B| STA.b $0C

;---------------------------------------------------------------------------------------------------

.next_a
|00F76D| LDA.b $04
|00F76F| ASL A
|00F770| TAX

|00F771| LDA.w #$FF00
|00F774| STA.w $1B00,X

|00F777| INC.b $04

|00F779| LDA.b $04
|00F77B| CMP.w $0676
|00F77E| BNE .next_a

;---------------------------------------------------------------------------------------------------

|00F780| LDA.b $0E
|00F782| SEC
|00F783| SBC.w #$0007
|00F786| CLC
|00F787| ADC.w #$0008
|00F78A| STA.b $0C

|00F78C| CLC
|00F78D| ADC.w $0670
|00F790| STA.b $02

|00F792| LDA.w $0670
|00F795| SEC
|00F796| SBC.b $0C
|00F798| AND.w #$00FF
|00F79B| STA.b $00

|00F79D| LDA.b $02
|00F79F| AND.w #$00FF
|00F7A2| XBA
|00F7A3| ORA.b $00
|00F7A5| STA.b $0C

|00F7A7| LDA.w $0676
|00F7AA| CLC
|00F7AB| ADC.w $0684
|00F7AE| EOR.w #$0001
|00F7B1| STA.b $0A

;---------------------------------------------------------------------------------------------------

.next_b
|00F7B3| LDA.b $04
|00F7B5| CMP.b $0A
|00F7B7| BCC .shift_in_bounds

|00F7B9| ASL A
|00F7BA| TAX

|00F7BB| LDA.w #$00FF

|00F7BE| BRA .continue

.shift_in_bounds
|00F7C0| ASL A

|00F7C1| TAX
|00F7C2| CPX.w #$01C0
|00F7C5| BCS .shift_in_bounds

|00F7C7| LDA.b $0C

.continue
|00F7C9| CMP.w #$FFFF
|00F7CC| BNE .not_neg1

|00F7CE| LDA.w #$00FF

.not_neg1
|00F7D1| STA.w $1B00,X

|00F7D4| INC.b $04

|00F7D6| LDA.b $04
|00F7D8| CMP.w #$00E1
|00F7DB| BCC .next_b

|00F7DD| SEP #$30

|00F7DF| RTL

;===================================================================================================
; FREE ROM: 0x20
;===================================================================================================
NULL_00F7E0:
|00F7E0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00F7E8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00F7F0| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
|00F7F8| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

Module0E_Interface:
|00F800| LDA.b $1B
|00F802| BEQ .outdoors

|00F804| LDA.b $11
|00F806| CMP.b #$03
|00F808| BNE .not_dungeon_map

|00F80A| LDA.w $0200
|00F80D| BEQ .continue

|00F80F| CMP.b #$07
|00F811| BEQ .continue

|00F813| BRA .skip_core

;---------------------------------------------------------------------------------------------------

.not_dungeon_map
|00F815| JSL PushBlock_Handler

|00F819| BRA .continue

;---------------------------------------------------------------------------------------------------

.outdoors
|00F81B| LDA.b $11
|00F81D| CMP.b #$07
|00F81F| BEQ .overworld_map

|00F821| CMP.b #$0A ; duck
|00F823| BNE .continue

.overworld_map
|00F825| LDA.w $0200
|00F828| BNE .skip_core

;---------------------------------------------------------------------------------------------------

.continue
|00F82A| JSL HandleAllSprites
|00F82E| JSL DrawLink

|00F832| LDA.b $1B
|00F834| BNE .indoors

|00F836| JSL OverworldOverlay_HandleRain

.indoors
|00F83A| JSL HandleItemRefills

|00F83E| LDA.b $11
|00F840| CMP.b #$02
|00F842| BEQ .skip_core

|00F844| JSL OrientLampLightCone

;---------------------------------------------------------------------------------------------------

.skip_core
|00F848| SEP #$30

|00F84A| JSL RunInterface

|00F84E| REP #$21

|00F850| LDA.b $E2
|00F852| ADC.w $011A
|00F855| STA.w $011E

|00F858| LDA.b $E8
|00F85A| CLC
|00F85B| ADC.w $011C
|00F85E| STA.w $0122

|00F861| LDA.b $E0
|00F863| CLC
|00F864| ADC.w $011A
|00F867| STA.w $0120

|00F86A| LDA.b $E6
|00F86C| CLC
|00F86D| ADC.w $011C
|00F870| STA.w $0124

|00F873| SEP #$20

;===================================================================================================

Module0E_00_Nothing:
|00F875| RTL

;===================================================================================================

pool RunInterface

.low
|00F876| db Module0E_00_Nothing
|00F877| db Module0E_01_ItemMenu
|00F878| db Module0E_02_RenderText
|00F879| db Module0E_03_UnderworldMap
|00F87A| db Module0E_04_RedPotion
|00F87B| db Module0E_05_DesertPrayer
|00F87C| db Module0E_06_Unused
|00F87D| db Module0E_07_OverworldMap
|00F87E| db Module0E_08_GreenPotion
|00F87F| db Module0E_09_BluePotion
|00F880| db Module0E_0A_FluteMenu
|00F881| db Module0E_0B_SaveMenu

;---------------------------------------------------------------------------------------------------

.high
|00F882| db >Module0E_00_Nothing
|00F883| db >Module0E_01_ItemMenu
|00F884| db >Module0E_02_RenderText
|00F885| db >Module0E_03_UnderworldMap
|00F886| db >Module0E_04_RedPotion
|00F887| db >Module0E_05_DesertPrayer
|00F888| db >Module0E_06_Unused
|00F889| db >Module0E_07_OverworldMap
|00F88A| db >Module0E_08_GreenPotion
|00F88B| db >Module0E_09_BluePotion
|00F88C| db >Module0E_0A_FluteMenu
|00F88D| db >Module0E_0B_SaveMenu

;---------------------------------------------------------------------------------------------------

.bank
|00F88E| db ^Module0E_00_Nothing
|00F88F| db ^Module0E_01_ItemMenu
|00F890| db ^Module0E_02_RenderText
|00F891| db ^Module0E_03_UnderworldMap
|00F892| db ^Module0E_04_RedPotion
|00F893| db ^Module0E_05_DesertPrayer
|00F894| db ^Module0E_06_Unused
|00F895| db ^Module0E_07_OverworldMap
|00F896| db ^Module0E_08_GreenPotion
|00F897| db ^Module0E_09_BluePotion
|00F898| db ^Module0E_0A_FluteMenu
|00F899| db ^Module0E_0B_SaveMenu

endpool

;---------------------------------------------------------------------------------------------------

RunInterface:
|00F89A| LDX.b $11

|00F89C| LDA.l .low,X
|00F8A0| STA.b $00

|00F8A2| LDA.l .high,X
|00F8A6| STA.b $01

|00F8A8| LDA.l .bank,X
|00F8AC| STA.b $02

|00F8AE| JML.w [$0000]

;===================================================================================================

Module0E_05_DesertPrayer:
|00F8B1| LDA.b $B0
|00F8B3| JSL JumpTableLong
|00F8B7| dl ResetTransitionPropsAndAdvance_ResetInterface_long
|00F8BA| dl ApplyPaletteFilter
|00F8BD| dl DesertPrayer_InitializeCutscene
|00F8C0| dl DesertPrayer_FadeScene
|00F8C3| dl DesertPrayer_WaitForInput

;===================================================================================================

DesertPrayer_InitializeCutscene:
|00F8C6| JSL InitializePrayerIris

|00F8CA| LDA.l $7EC00B
|00F8CE| DEC A
|00F8CF| STA.l $7EC007

|00F8D3| LDA.b #$00
|00F8D5| STA.l $7EC00B

|00F8D9| LDA.b #$02
|00F8DB| STA.l $7EC009

|00F8DF| RTL

;===================================================================================================

DesertPrayer_FadeScene:
|00F8E0| JSL ApplyPaletteFilter

;===================================================================================================

DesertPrayer_WaitForInput:
|00F8E4| JSL BuildPrayerHDMATable

|00F8E8| RTL

;===================================================================================================

Module0E_06_Unused:
|00F8E9| LDA.b $B0
|00F8EB| JSL JumpTableLong
|00F8EF| dl ResetTransitionPropsAndAdvance_ResetInterface_long
|00F8F2| dl ApplyPaletteFilter
|00F8F5| dl HandleRoomTranslucencyAndPalettes_long
|00F8F8| dl UnusedInterfacePaletteRecovery_long

;===================================================================================================

Module0E_04_RedPotion:
|00F8FB| JSL FullyRefillHealth
|00F8FF| BCC .exit

;===================================================================================================

#Module0E_Interface_RestoreModeFromPotion:
|00F901| LDA.b $3A
|00F903| AND.b #$BF
|00F905| STA.b $3A

|00F907| INC.b $16

|00F909| STZ.b $11

|00F90B| LDA.w $010C
|00F90E| STA.b $10

.exit
|00F910| RTL

;===================================================================================================

Module0E_08_GreenPotion:
|00F911| JSL FullyRefillMagic
|00F915| BCS Module0E_Interface_RestoreModeFromPotion

|00F917| RTL

;===================================================================================================

Module0E_09_BluePotion:
|00F918| JSL FullyRefillHealth
|00F91C| BCC .health_full

|00F91E| LDA.b #$08
|00F920| STA.b $11

.health_full
|00F922| JSL FullyRefillMagic
|00F926| BCC .magic_full

|00F928| LDA.b #$04
|00F92A| STA.b $11

.magic_full
|00F92C| RTL

;===================================================================================================

pool PrepareDungeonExitFromBossFight

.boss_room
|00F92D| db $C8 ; ROOM 00C8 - Armos→Eastern lobby
|00F92E| db $33 ; ROOM 0033 - Lanmolas→Desert 3
|00F92F| db $07 ; ROOM 0007 - Moldorm→Hera lobby
|00F930| db $20 ; ROOM 0020 - Agahnim→self
|00F931| db $06 ; ROOM 0006 - Arrghus→Swamp lobby
|00F932| db $5A ; ROOM 005A - Helmasaur→PoD lobby
|00F933| db $29 ; ROOM 0029 - Mothula→Skull 3
|00F934| db $90 ; ROOM 0090 - Vitreous→Mire foyer
|00F935| db $DE ; ROOM 00DE - Kholdstare→Ice 1
|00F936| db $A4 ; ROOM 00A4 - Trinexx→TR foyer
|00F937| db $AC ; ROOM 00AC - Blind→Thieves' lobby
|00F938| db $0D ; ROOM 000D - Agahnim 2→self

.exit_room
|00F939| db $C9 ; ROOM 00C9 - Armos→Eastern lobby
|00F93A| db $63 ; ROOM 0063 - Lanmolas→Desert 3
|00F93B| db $77 ; ROOM 0077 - Moldorm→Hera lobby
|00F93C| db $20 ; ROOM 0020 - Agahnim→self
|00F93D| db $28 ; ROOM 0028 - Arrghus→Swamp lobby
|00F93E| db $4A ; ROOM 004A - Helmasaur→PoD lobby
|00F93F| db $59 ; ROOM 0059 - Mothula→Skull 3
|00F940| db $98 ; ROOM 0098 - Vitreous→Mire foyer
|00F941| db $0E ; ROOM 000E - Kholdstare→Ice 1
|00F942| db $D6 ; ROOM 00D6 - Trinexx→TR foyer
|00F943| db $DB ; ROOM 00DB - Blind→Thieves' lobby
|00F944| db $0D ; ROOM 000D - Agahnim 2→self

endpool

;---------------------------------------------------------------------------------------------------

PrepareDungeonExitFromBossFight:
|00F945| JSL SaveDeathCount
|00F949| JSL SaveDungeonKeys

|00F94D| LDA.w $0403
|00F950| ORA.b #$80
|00F952| STA.w $0403

|00F955| JSL FullyUpdateRoomFlags

|00F959| LDX.b #$0C

|00F95B| LDA.b $A0

.check_next
|00F95D| DEX

|00F95E| CMP.l .boss_room,X
|00F962| BNE .check_next

|00F964| LDA.l .exit_room,X
|00F968| STA.b $A0

|00F96A| CMP.b #$20
|00F96C| BNE .not_aga1

;---------------------------------------------------------------------------------------------------

|00F96E| LDA.b #$03
|00F970| STA.l $7EF3C5

|00F974| LDA.l $7EF282
|00F978| ORA.b #$20
|00F97A| STA.l $7EF282

|00F97E| LDA.l $7EF3CA
|00F982| EOR.b #$40
|00F984| STA.l $7EF3CA

|00F988| JSL Sprite_LoadGraphicsProperties_light_world_only
|00F98C| JSL TerminateSelectInteractives

|00F990| STZ.w $037B

|00F993| STZ.b $3C
|00F995| STZ.b $3A

|00F997| STZ.w $03EF

|00F99A| LDA.b #$01
|00F99C| STA.w $02E4

|00F99F| LDA.b #$08
|00F9A1| STA.w $010C

|00F9A4| LDA.b #$15
|00F9A6| STA.b $10

|00F9A8| STZ.b $11
|00F9AA| STZ.b $B0

|00F9AC| RTL

;---------------------------------------------------------------------------------------------------

.not_aga1
|00F9AD| CMP.b #$0D
|00F9AF| BNE .not_aga2

|00F9B1| LDA.b #$18
|00F9B3| STA.b $10

|00F9B5| STZ.b $11

|00F9B7| STZ.w $0200

|00F9BA| LDA.b #$20
|00F9BC| STA.b $9A

|00F9BE| RTL

;---------------------------------------------------------------------------------------------------

.not_aga2
|00F9BF| CPX.b #$03
|00F9C1| BCC .light_world_dungeon

|00F9C3| LDA.b #$F1 ; SONG F1 - fade
|00F9C5| STA.w $012C
|00F9C8| STA.w $0130

|00F9CB| LDA.b #$16
|00F9CD| BRA .set_module

.light_world_dungeon
|00F9CF| LDA.b #$13

.set_module
|00F9D1| STA.b $10

|00F9D3| LDA.b #$08
|00F9D5| STA.w $010C

|00F9D8| STZ.b $11
|00F9DA| STZ.b $B0

|00F9DC| RTL

;===================================================================================================

SaveDeathCount:
|00F9DD| PHX

|00F9DE| REP #$20

|00F9E0| LDX.w $040C

|00F9E3| LDA.l $7EF403
|00F9E7| STA.l $7EF3E7,X

|00F9EB| CPX.b #$08 ; DUNGEON 08
|00F9ED| BEQ .aga_tower

|00F9EF| LDA.w #$0000
|00F9F2| STA.l $7EF403

.aga_tower
|00F9F6| SEP #$20
|00F9F8| PLX

|00F9F9| RTL

;===================================================================================================

Module0E_0B_SaveMenu:
|00F9FA| LDA.b $1B
|00F9FC| BNE .indoors

|00F9FE| JSL FlashGanonTowerPalette

.indoors
|00FA02| JSL RenderText

|00FA06| STZ.b $16
|00FA08| STZ.w $0710

|00FA0B| LDA.b $B0
|00FA0D| CMP.b #$03
|00FA0F| BCS .done_text_sub

|00FA11| INC.b $B0

|00FA13| BRA .continue

.done_text_sub
|00FA15| STZ.b $14

.continue
|00FA17| LDA.b $11
|00FA19| BNE .exit

|00FA1B| STZ.b $B0

|00FA1D| LDA.b #$01
|00FA1F| STA.b $14

|00FA21| LDA.w $1CE8
|00FA24| BEQ .dont_save

|00FA26| LDA.b #$0F ; SFX1.0F
|00FA28| STA.w $012D

|00FA2B| LDA.b #$17
|00FA2D| STA.b $10

|00FA2F| LDA.b #$01
|00FA31| STA.b $11

|00FA33| STZ.w $05FC
|00FA36| STZ.w $05FD

|00FA39| RTL

.dont_save
|00FA3A| LDA.w $1CF4
|00FA3D| STA.w $1CE8

.exit
|00FA40| RTL

;===================================================================================================

pool Sprite_LoadGraphicsProperties

.sprite_set
|00FA41| db $00, $00, $00, $00, $00, $00, $00, $00
|00FA49| db $00, $00, $00, $00, $00, $00, $00, $00
|00FA51| db $00, $00, $00, $00, $00, $00, $00, $00
|00FA59| db $00, $00, $00, $02, $02, $00, $00, $00
|00FA61| db $00, $00, $00, $02, $02, $00, $00, $00
|00FA69| db $00, $00, $00, $02, $02, $00, $00, $00
|00FA71| db $00, $00, $00, $00, $00, $00, $00, $00
|00FA79| db $00, $00, $00, $00, $00, $00, $00, $00

|00FA81| db $07, $07, $07, $10, $10, $10, $10, $10
|00FA89| db $07, $07, $07, $10, $10, $10, $10, $04
|00FA91| db $06, $06, $00, $03, $03, $00, $0D, $0A
|00FA99| db $06, $06, $01, $01, $01, $04, $05, $05
|00FAA1| db $06, $06, $06, $01, $01, $04, $05, $05
|00FAA9| db $06, $09, $0F, $00, $00, $0B, $0B, $05
|00FAB1| db $08, $08, $0A, $04, $04, $04, $04, $04
|00FAB9| db $08, $08, $0A, $04, $04, $04, $04, $04

|00FAC1| db $07, $07, $1A, $10, $10, $10, $10, $10
|00FAC9| db $07, $07, $1A, $10, $10, $10, $10, $04
|00FAD1| db $06, $06, $00, $03, $03, $00, $0D, $0A
|00FAD9| db $06, $06, $1C, $1C, $1C, $02, $05, $05
|00FAE1| db $06, $06, $06, $1C, $1C, $00, $05, $05
|00FAE9| db $06, $00, $0F, $00, $00, $23, $23, $05
|00FAF1| db $1F, $1F, $0A, $20, $20, $20, $20, $20
|00FAF9| db $1F, $1F, $0A, $20, $20, $20, $20, $20

|00FB01| db $13, $13, $17, $14, $14, $14, $14, $14
|00FB09| db $13, $13, $17, $14, $14, $14, $14, $16
|00FB11| db $15, $15, $12, $13, $13, $18, $16, $16
|00FB19| db $15, $15, $13, $26, $26, $13, $17, $17
|00FB21| db $15, $15, $15, $26, $26, $13, $17, $17
|00FB29| db $1B, $1D, $11, $13, $13, $18, $18, $17
|00FB31| db $16, $16, $13, $13, $13, $19, $19, $19
|00FB39| db $16, $16, $18, $13, $18, $19, $19, $19

.palette
|00FB41| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB49| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB51| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB59| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB61| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB69| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB71| db $01, $01, $01, $01, $01, $01, $01, $01
|00FB79| db $01, $01, $01, $01, $01, $01, $01, $01

|00FB81| db $05, $05, $06, $09, $09, $09, $09, $09
|00FB89| db $05, $05, $06, $09, $09, $09, $09, $03
|00FB91| db $01, $01, $00, $02, $02, $00, $06, $03
|00FB99| db $01, $01, $01, $03, $03, $03, $07, $07
|00FBA1| db $01, $01, $01, $03, $03, $03, $07, $07
|00FBA9| db $01, $00, $01, $00, $00, $03, $03, $07
|00FBB1| db $04, $04, $00, $03, $03, $03, $03, $03
|00FBB9| db $04, $04, $00, $03, $03, $03, $03, $03

|00FBC1| db $05, $05, $06, $09, $09, $09, $09, $09
|00FBC9| db $05, $05, $06, $09, $09, $09, $09, $03
|00FBD1| db $01, $01, $00, $02, $02, $00, $06, $03
|00FBD9| db $01, $01, $01, $01, $01, $03, $07, $07
|00FBE1| db $01, $01, $01, $01, $01, $03, $07, $07
|00FBE9| db $01, $00, $01, $00, $00, $03, $03, $07
|00FBF1| db $04, $04, $00, $03, $03, $03, $03, $03
|00FBF9| db $04, $04, $00, $03, $03, $03, $03, $03

|00FC01| db $0E, $0E, $10, $0C, $0C, $0C, $0C, $0C
|00FC09| db $0E, $0E, $10, $0C, $0C, $0C, $0C, $0A
|00FC11| db $10, $10, $00, $0E, $0E, $00, $0D, $0A
|00FC19| db $10, $10, $10, $0E, $0E, $0E, $0D, $0D
|00FC21| db $10, $10, $10, $0E, $0E, $0E, $0D, $0D
|00FC29| db $12, $00, $0B, $0E, $0E, $0E, $0E, $0D
|00FC31| db $0F, $0F, $00, $0E, $0E, $0E, $0E, $0E
|00FC39| db $0F, $0F, $00, $0E, $0E, $0E, $0E, $0E

endpool

;---------------------------------------------------------------------------------------------------

Sprite_LoadGraphicsProperties:
|00FC41| PHB
|00FC42| PHK
|00FC43| PLB

|00FC44| REP #$30

|00FC46| LDY.w #$00FE
|00FC49| LDX.w #$003E

.next_a
|00FC4C| LDA.w .sprite_set,Y
|00FC4F| STA.l $7EFD00,X

|00FC53| LDA.w .palette,Y
|00FC56| STA.l $7EFD80,X

|00FC5A| DEY
|00FC5B| DEY

|00FC5C| DEX
|00FC5D| DEX
|00FC5E| BPL .next_a

|00FC60| BRA .continue

;===================================================================================================

#Sprite_LoadGraphicsProperties_light_world_only:
|00FC62| PHB
|00FC63| PHK
|00FC64| PLB

|00FC65| REP #$30

.continue
|00FC67| LDY.w #$003E

|00FC6A| LDA.l $7EF3C5
|00FC6E| AND.w #$00FF
|00FC71| CMP.w #$0002
|00FC74| BCC .start_lw

|00FC76| LDY.w #$007E
|00FC79| CMP.w #$0003
|00FC7C| BNE .start_lw

|00FC7E| LDY.w #$00BE

;---------------------------------------------------------------------------------------------------

.start_lw
|00FC81| LDX.w #$003E

.next_b
|00FC84| LDA.w .sprite_set,Y
|00FC87| STA.l $7EFCC0,X

|00FC8B| LDA.w .palette,Y
|00FC8E| STA.l $7EFD40,X

|00FC92| DEY
|00FC93| DEY

|00FC94| DEX
|00FC95| DEX
|00FC96| BPL .next_b

;---------------------------------------------------------------------------------------------------

|00FC98| SEP #$30

|00FC9A| PLB

|00FC9B| RTL

;===================================================================================================

GFXAA2ValsOW:
|00FC9C| db $21, $21, $21, $22, $22, $22, $22, $22
|00FCA4| db $21, $21, $21, $22, $22, $22, $22, $27
|00FCAC| db $23, $23, $20, $29, $29, $20, $29, $29
|00FCB4| db $23, $23, $20, $24, $24, $27, $25, $25
|00FCBC| db $23, $23, $23, $24, $24, $20, $25, $25
|00FCC4| db $23, $2A, $21, $20, $20, $27, $20, $25
|00FCCC| db $2B, $2B, $20, $27, $27, $27, $27, $27
|00FCD4| db $2B, $2B, $20, $27, $27, $27, $27, $27
|00FCDC| db $3E, $3E, $3E, $41, $41, $41, $41, $3C
|00FCE4| db $3E, $3E, $3E, $41, $41, $41, $41, $40
|00FCEC| db $3F, $3F, $30, $40, $40, $30, $40, $30
|00FCF4| db $3F, $3F, $30, $3B, $3B, $40, $3D, $3D
|00FCFC| db $3F, $3F, $3F, $3B, $3B, $30, $3D, $3D
|00FD04| db $3F, $3F, $30, $30, $30, $40, $30, $3D
|00FD0C| db $42, $42, $30, $40, $40, $42, $42, $40
|00FD14| db $42, $42, $30, $40, $40, $42, $42, $30

;===================================================================================================

OverworldPalettesScreenToSet:
|00FD1C| db $06, $06, $08, $07, $07, $07, $07, $07
|00FD24| db $06, $06, $08, $07, $07, $07, $07, $04
|00FD2C| db $08, $08, $00, $01, $01, $00, $09, $00
|00FD34| db $08, $08, $00, $02, $02, $04, $09, $09
|00FD3C| db $08, $08, $08, $02, $02, $00, $09, $09
|00FD44| db $08, $08, $01, $00, $00, $04, $00, $09
|00FD4C| db $09, $00, $00, $04, $04, $04, $04, $04
|00FD54| db $09, $09, $00, $04, $04, $04, $04, $04
|00FD5C| db $1B, $1B, $1E, $17, $17, $17, $17, $18
|00FD64| db $1B, $1B, $1E, $17, $17, $17, $17, $1D
|00FD6C| db $1E, $1E, $10, $1E, $1E, $10, $1E, $10
|00FD74| db $1E, $1E, $10, $12, $12, $10, $1A, $1A
|00FD7C| db $1E, $1E, $1E, $12, $12, $10, $1A, $1A
|00FD84| db $1E, $10, $12, $10, $10, $1D, $10, $1A
|00FD8C| db $1C, $1C, $10, $1D, $1D, $1C, $1C, $1D
|00FD94| db $1C, $1C, $10, $1D, $1D, $1C, $1C, $10
|00FD9C| db $0A, $0A, $0A, $0A, $02, $02, $02, $0A

;===================================================================================================

ResetStarTileGraphics:
|00FDA4| STZ.w $04BC

;===================================================================================================

ToggleStarTileGraphics:
|00FDA7| REP #$10

|00FDA9| LDX.w #$0000
|00FDAC| LDY.w #$0020

|00FDAF| LDA.w $04BC
|00FDB2| BEQ .flipped

|00FDB4| TYX
|00FDB5| LDY.w #$0000

.flipped
|00FDB8| STY.b $0E

|00FDBA| PHB

|00FDBB| LDA.b #$7F
|00FDBD| PHA
|00FDBE| PLB

;---------------------------------------------------------------------------------------------------

|00FDBF| REP #$20

|00FDC1| LDY.w #$0000

.next_a
|00FDC4| LDA.l $7EBDC0,X
|00FDC8| STA.w $7F0000,Y

|00FDCB| INX
|00FDCC| INX

|00FDCD| INY
|00FDCE| INY

|00FDCF| CPY.w #$0020
|00FDD2| BNE .next_a

;---------------------------------------------------------------------------------------------------

|00FDD4| LDX.b $0E

.next_b
|00FDD6| LDA.l $7EBDC0,X
|00FDDA| STA.w $7F0000,Y

|00FDDD| INX
|00FDDE| INX

|00FDDF| INY
|00FDE0| INY

|00FDE1| CPY.w #$0040
|00FDE4| BNE .next_b

;---------------------------------------------------------------------------------------------------

|00FDE6| SEP #$30

|00FDE8| PLB

|00FDE9| LDA.b #$18
|00FDEB| STA.b $17

|00FDED| RTL

;===================================================================================================

InitializeMirrorHDMA:
|00FDEE| STZ.b $9B

|00FDF0| REP #$20

|00FDF2| STZ.w $06A0
|00FDF5| STZ.w $06AC
|00FDF8| STZ.w $06AA
|00FDFB| STZ.w $06AE
|00FDFE| STZ.w $06B0

|00FE01| LDA.w #$0008
|00FE04| STA.w $06B4
|00FE07| STA.w $06B6

|00FE0A| LDA.w #$0015
|00FE0D| STA.w $06B2

|00FE10| LDA.w #$FFC0
|00FE13| STA.w $06A6

|00FE16| LDA.w #$0040
|00FE19| STA.w $06A8

|00FE1C| LDA.w #$FE00
|00FE1F| STA.w $06A2

|00FE22| LDA.w #$0200
|00FE25| STA.w $06A4

|00FE28| STZ.w $06AC
|00FE2B| STZ.w $06AE

|00FE2E| LDA.w #$0F42
|00FE31| STA.w DMA7MODE

|00FE34| LDA.w #$0D42
|00FE37| STA.w DMA6MODE

|00FE3A| LDX.b #$3E

|00FE3C| LDA.b $E2

;===================================================================================================

InitializeHDMATable:
.next
|00FE3E| STA.w $1B00,X
|00FE41| STA.w $1B40,X
|00FE44| STA.w $1B80,X
|00FE47| STA.w $1BC0,X
|00FE4A| STA.w $1C00,X
|00FE4D| STA.w $1C40,X
|00FE50| STA.w $1C80,X

|00FE53| DEX
|00FE54| DEX
|00FE55| BPL .next

|00FE57| SEP #$20

|00FE59| LDA.b #$C0
|00FE5B| STA.b $9B

;---------------------------------------------------------------------------------------------------

#EXIT_00FE5D:
|00FE5D| RTL

;===================================================================================================

MirrorWarp_BuildAndEnableHDMATable:
|00FE5E| INC.b $B0

|00FE60| LDA.b #$C0
|00FE62| STA.b $9B

;===================================================================================================

MirrorWarp_BuildWavingHDMATable:
|00FE64| JSL MirrorWarp_RunAnimationSubmodules

|00FE68| LDA.b $1A
|00FE6A| LSR A
|00FE6B| BCS EXIT_00FE5D

|00FE6D| REP #$30

|00FE6F| LDX.w #$01A0
|00FE72| LDY.w #$01B0

|00FE75| LDA.w #$0002
|00FE78| STA.b $00

|00FE7A| LDA.w #$0003
|00FE7D| STA.b $02

;---------------------------------------------------------------------------------------------------

.next
|00FE7F| LDA.w $1B00,X
|00FE82| STA.w $1B00,Y
|00FE85| STA.w $1B04,Y
|00FE88| STA.w $1B08,Y
|00FE8B| STA.w $1B0C,Y

|00FE8E| TXA
|00FE8F| SEC
|00FE90| SBC.w #$0010
|00FE93| TAX

|00FE94| DEC.b $00
|00FE96| BNE .dont_reset_a

|00FE98| LDA.w #$0008
|00FE9B| STA.b $00

.dont_reset_a
|00FE9D| TYA
|00FE9E| SEC
|00FE9F| SBC.w #$0010
|00FEA2| TAY

|00FEA3| DEC.b $02
|00FEA5| BNE .dont_reset_b

|00FEA7| LDA.w #$0008
|00FEAA| STA.b $02

.dont_reset_b
|00FEAC| CPY.w #$0000
|00FEAF| BNE .next

;---------------------------------------------------------------------------------------------------

|00FEB1| LDX.w $06A0

|00FEB4| LDA.w $06AC
|00FEB7| CLC
|00FEB8| ADC.w $06A6,X
|00FEBB| PHA

|00FEBC| SEC
|00FEBD| SBC.w $06A2,X
|00FEC0| EOR.w $06A2,X
|00FEC3| BMI .negative

|00FEC5| STZ.w $06AA
|00FEC8| STZ.w $06AE

|00FECB| LDA.w $06A0
|00FECE| EOR.w #$0002
|00FED1| STA.w $06A0

|00FED4| PLA
|00FED5| LDA.w $06A2,X

|00FED8| PHA

.negative
|00FED9| PLA
|00FEDA| STA.w $06AC

|00FEDD| CLC
|00FEDE| ADC.w $06AE
|00FEE1| PHA

|00FEE2| AND.w #$00FF
|00FEE5| STA.w $06AE

;---------------------------------------------------------------------------------------------------

|00FEE8| PLA
|00FEE9| BPL .positive

|00FEEB| ORA.w #$00FF
|00FEEE| BRA .continue_with_sign

.positive
|00FEF0| AND.w #$FF00

.continue_with_sign
|00FEF3| XBA
|00FEF4| CLC
|00FEF5| ADC.w $06AA
|00FEF8| STA.w $06AA

|00FEFB| TAX

|00FEFC| LDA.l $7EC007
|00FF00| CMP.w #$0030
|00FF03| BCC .dont_advance

|00FF05| TXA
|00FF06| AND.w #$FFF8
|00FF09| BNE .dont_advance

|00FF0B| LDA.w #$FF00
|00FF0E| STA.w $06A2

|00FF11| LDA.w #$0100
|00FF14| STA.w $06A4

|00FF17| LDX.w #$0000

|00FF1A| INC.b $B0

;---------------------------------------------------------------------------------------------------

.dont_advance
|00FF1C| TXA
|00FF1D| CLC
|00FF1E| ADC.b $E2
|00FF20| STA.w $1B00
|00FF23| STA.w $1B04
|00FF26| STA.w $1B08
|00FF29| STA.w $1B0C

|00FF2C| SEP #$30

;---------------------------------------------------------------------------------------------------

#EXIT_00FF2E:
|00FF2E| RTL

;===================================================================================================

MirrorWarp_BuildDewavingHDMATable:
|00FF2F| JSL MirrorWarp_RunAnimationSubmodules

|00FF33| LDA.b $1A
|00FF35| LSR A
|00FF36| BCS EXIT_00FF2E

|00FF38| REP #$30

|00FF3A| LDX.w #$01A0
|00FF3D| LDY.w #$01B0

|00FF40| LDA.w #$0002
|00FF43| STA.b $00

|00FF45| LDA.w #$0003
|00FF48| STA.b $02

;---------------------------------------------------------------------------------------------------

.next
|00FF4A| LDA.w $1B00,X
|00FF4D| STA.w $1B00,Y
|00FF50| STA.w $1B04,Y
|00FF53| STA.w $1B08,Y
|00FF56| STA.w $1B0C,Y

|00FF59| TXA
|00FF5A| SEC
|00FF5B| SBC.w #$0010
|00FF5E| TAX

|00FF5F| DEC.b $00
|00FF61| BNE .dont_reset_a

|00FF63| LDA.w #$0008
|00FF66| STA.b $00

.dont_reset_a
|00FF68| TYA
|00FF69| SEC
|00FF6A| SBC.w #$0010
|00FF6D| TAY

|00FF6E| DEC.b $02
|00FF70| BNE .dont_reset_b

|00FF72| LDA.w #$0008
|00FF75| STA.b $02

.dont_reset_b
|00FF77| CPY.w #$0000
|00FF7A| BNE .next

;---------------------------------------------------------------------------------------------------

|00FF7C| LDA.w $1C80
|00FF7F| ORA.w $1C90
|00FF82| ORA.w $1CA0
|00FF85| ORA.w $1CB0

|00FF88| CMP.b $E2
|00FF8A| BNE .exit

|00FF8C| SEP #$20

|00FF8E| STZ.b $9B

|00FF90| INC.b $B0

|00FF92| JSL Overworld_SetFixedColAndScroll

|00FF96| LDA.b $8A
|00FF98| AND.b #$3F
|00FF9A| CMP.b #$1B ; OW 1B, OW 5B
|00FF9C| BEQ .exit

|00FF9E| REP #$20

|00FFA0| LDA.b $E2
|00FFA2| STA.b $E0
|00FFA4| STA.w $0120
|00FFA7| STA.w $011E

|00FFAA| LDA.b $E8
|00FFAC| STA.b $E6
|00FFAE| STA.w $0122
|00FFB1| STA.w $0124

.exit
|00FFB4| SEP #$30

|00FFB6| RTL

;===================================================================================================
; FREE ROM: 0x09
;===================================================================================================
NULL_00FFB7:
|00FFB7| db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

;===================================================================================================

InternalROMHeader:
|00FFC0| db "THE LEGEND OF ZELDA  "

|00FFD5| db $20 ; ROM mapping: lorom
|00FFD6| db $02 ; Cartridge: ROM+RAM+battery
|00FFD7| db $0A ; ROM size: 1MB
|00FFD8| db $03 ; RAM size: 8kB

|00FFD9| db $01 ; Region: North America (U)
|00FFDA| db $01 ; Header type: v2
|00FFDB| db $00 ; Version: 1.0

|00FFDC| dw $50F2 ; complement
|00FFDE| dw $AF0D ; checksum

|00FFE0| dw $FFFF ; Unused
|00FFE2| dw $FFFF ; Unused
|00FFE4| dw Interrupt_Unused
|00FFE6| dw $FFFF ; BRK
|00FFE8| dw Interrupt_Unused
|00FFEA| dw NMI
|00FFEC| dw Reset
|00FFEE| dw IRQ

|00FFF0| dw $FFFF ; Unused
|00FFF2| dw $FFFF ; Unused
|00FFF4| dw Interrupt_Unused
|00FFF6| dw Interrupt_Unused
|00FFF8| dw Interrupt_Unused
|00FFFA| dw Interrupt_Unused
|00FFFC| dw Reset
|00FFFE| dw IRQ

;===================================================================================================
