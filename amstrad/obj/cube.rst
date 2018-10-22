ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "main.h.s"
                              1 .globl cpct_disableFirmware_asm
                              2 .globl cpct_drawSolidBox_asm
                              3 .globl cpct_getScreenPtr_asm
                              4 .globl cpct_waitVSYNC_asm
                              5 .globl cpct_setVideoMode_asm
                              6 .globl cpct_scanKeyboard_asm
                              7 .globl cpct_isKeyPressed_asm
                              8 .globl cpct_setVideoMemoryPage_asm
                              9 .globl _cpct_memset_f64_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 .include "cube.h.s"
                              1 
                              2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              3 ;;MACROS
                              4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              5 .macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
                              6 _name:
                              7     DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                              8     .db     _hp     ;; Hitpoints
                              9 .endm
                     0000    10 c_de        = 0
                     0006    11 c_de_size   = 6
                     0006    12 c_hp        = 0 + c_de_size
                             13 ;;.macro DefineCubeLine1Default _name, _suf
                             14 ;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
                             15 ;;.endm
                             16 ;;.macro DefineNCubeLine1 _name, _n
                             17 
                             18 ;;    _s = 0
                             19 ;;    .rept _n
                             20 ;;        DefineCubeLine1Default _name, \_s
                             21 
                             22 ;;        _s = _s + 1
                             23 ;;    .endm
                             24 ;;.endm
                             25 
                             26 
                             27 
                             28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             29 ;;OBJECTS CREATED WITH MACROS
                             30 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             31 .globl cube_clear
                             32 .globl cube_draw
                             33 .globl cube_drawAll
                             34 .globl cube_clearAll
                             35 
                             36 
                             37 .globl cubeline10
                             38 .globl cubeline11
                             39 .globl cubeline12
                             40 .globl cubeline13
                             41 .globl cubeline14
                             42 .globl cubeline15
                             43 .globl cubeline16
                             44 .globl cubeline17
                             45 .globl cubeline18
                             46 .globl cubeline19
                             47 .globl cubeline110
                             48 .globl cubeline111
                             49 .globl cubeline112
                             50 .globl cubeline113
                             51 .globl cubeline114
                             52 .globl cubeline115
                             53 .globl cubeline116
                             54 .globl cubeline117
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl cubeline118
                             56 .globl cubeline119
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              3 .include "render.h.s"
                              1 
                              2 
                              3 ;;Drawable Entity
                              4 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _col
                              5 _name:
                              6     .db _x, _y
                              7     .db _w, _h
                              8     .db _col
                              9 .endm
                     0001    10 dc_x    = 0     dc_y    = 1
                     0003    11 dc_w    = 2     dc_h    = 3
                     0004    12 dc_col  = 4
                             13 
                             14 .globl ren_clearBackBuffers
                             15 ;;.globl ren_switchBuffers
                             16 .globl render_drawCube
                             17 .globl ren_newScene
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                              4 
                     0014     5 k_max_cube_line = 20
                     0007     6 k_cube_size = 7
                              7 
   41C9                       8 DefineCubeLine1 cubeline10, 0x10, 0x20, 0x10, 0x40, 0x0F, 0x01
   41C9                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x10, 0x20, 0x10, 0x40, 0x0F
   0000                       1 cubeline10_dw:
   41C9 10 20                 2     .db 0x10, 0x20
   41CB 10 40                 3     .db 0x10, 0x40
   41CD 0F                    4     .db 0x0F
   41CE 01                    3     .db     0x01     ;; Hitpoints
   41CF                       9 DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
   41CF                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x00, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   41CF 04 00                 2     .db 0x04, 0x00
   41D1 04 08                 3     .db 0x04, 0x08
   41D3 FF                    4     .db 0xFF
   41D4 01                    3     .db     0x01     ;; Hitpoints
   41D5                      10 DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
   41D5                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x00, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   41D5 08 00                 2     .db 0x08, 0x00
   41D7 04 08                 3     .db 0x04, 0x08
   41D9 0F                    4     .db 0x0F
   41DA 01                    3     .db     0x01     ;; Hitpoints
   41DB                      11 DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
   41DB                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x00, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   41DB 0C 00                 2     .db 0x0C, 0x00
   41DD 04 08                 3     .db 0x04, 0x08
   41DF FF                    4     .db 0xFF
   41E0 01                    3     .db     0x01     ;; Hitpoints
   41E1                      12 DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
   41E1                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x00, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   41E1 10 00                 2     .db 0x10, 0x00
   41E3 04 08                 3     .db 0x04, 0x08
   41E5 0F                    4     .db 0x0F
   41E6 01                    3     .db     0x01     ;; Hitpoints
   41E7                      13 DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
   41E7                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x00, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   41E7 14 00                 2     .db 0x14, 0x00
   41E9 04 08                 3     .db 0x04, 0x08
   41EB FF                    4     .db 0xFF
   41EC 01                    3     .db     0x01     ;; Hitpoints
   41ED                      14 DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
   41ED                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x00, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   41ED 18 00                 2     .db 0x18, 0x00
   41EF 04 08                 3     .db 0x04, 0x08
   41F1 0F                    4     .db 0x0F
   41F2 01                    3     .db     0x01     ;; Hitpoints
   41F3                      15 DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
   41F3                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x00, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   41F3 1C 00                 2     .db 0x1C, 0x00
   41F5 04 08                 3     .db 0x04, 0x08
   41F7 FF                    4     .db 0xFF
   41F8 01                    3     .db     0x01     ;; Hitpoints
   41F9                      16 DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
   41F9                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x00, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   41F9 20 00                 2     .db 0x20, 0x00
   41FB 04 08                 3     .db 0x04, 0x08
   41FD 0F                    4     .db 0x0F
   41FE 01                    3     .db     0x01     ;; Hitpoints
   41FF                      17 DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
   41FF                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x00, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   41FF 24 00                 2     .db 0x24, 0x00
   4201 04 08                 3     .db 0x04, 0x08
   4203 FF                    4     .db 0xFF
   4204 01                    3     .db     0x01     ;; Hitpoints
   4205                      18 DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
   4205                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x00, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   4205 28 00                 2     .db 0x28, 0x00
   4207 04 08                 3     .db 0x04, 0x08
   4209 0F                    4     .db 0x0F
   420A 01                    3     .db     0x01     ;; Hitpoints
   420B                      19 DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
   420B                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x00, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   420B 2C 00                 2     .db 0x2C, 0x00
   420D 04 08                 3     .db 0x04, 0x08
   420F FF                    4     .db 0xFF
   4210 01                    3     .db     0x01     ;; Hitpoints
   4211                      20 DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
   4211                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x00, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4211 30 00                 2     .db 0x30, 0x00
   4213 04 08                 3     .db 0x04, 0x08
   4215 0F                    4     .db 0x0F
   4216 01                    3     .db     0x01     ;; Hitpoints
   4217                      21 DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
   4217                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x00, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   4217 34 00                 2     .db 0x34, 0x00
   4219 04 08                 3     .db 0x04, 0x08
   421B FF                    4     .db 0xFF
   421C 01                    3     .db     0x01     ;; Hitpoints
   421D                      22 DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
   421D                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x00, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   421D 38 00                 2     .db 0x38, 0x00
   421F 04 08                 3     .db 0x04, 0x08
   4221 0F                    4     .db 0x0F
   4222 01                    3     .db     0x01     ;; Hitpoints
   4223                      23 DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4223                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x00, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   4223 3C 00                 2     .db 0x3C, 0x00
   4225 04 08                 3     .db 0x04, 0x08
   4227 FF                    4     .db 0xFF
   4228 01                    3     .db     0x01     ;; Hitpoints
   4229                      24 DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
   4229                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x00, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   4229 40 00                 2     .db 0x40, 0x00
   422B 04 08                 3     .db 0x04, 0x08
   422D 0F                    4     .db 0x0F
   422E 01                    3     .db     0x01     ;; Hitpoints
   422F                      25 DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
   422F                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x00, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   422F 44 00                 2     .db 0x44, 0x00
   4231 04 08                 3     .db 0x04, 0x08
   4233 FF                    4     .db 0xFF
   4234 01                    3     .db     0x01     ;; Hitpoints
   4235                      26 DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
   4235                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x00, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   4235 48 00                 2     .db 0x48, 0x00
   4237 04 08                 3     .db 0x04, 0x08
   4239 0F                    4     .db 0x0F
   423A 01                    3     .db     0x01     ;; Hitpoints
   423B                      27 DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01
   423B                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x00, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   423B 4C 00                 2     .db 0x4C, 0x00
   423D 04 08                 3     .db 0x04, 0x08
   423F FF                    4     .db 0xFF
   4240 01                    3     .db     0x01     ;; Hitpoints
                             28 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4241 14                   29 m_num_cube: .db 20
                             30 
   4242                      31 cube_clear:
   4242 DD 21 C9 41   [14]   32 ld ix,#cubeline10
   4246 CD 5F 43      [17]   33 call cube_clearAll
   4249 DD 21 CF 41   [14]   34 ld ix,#cubeline11
   424D CD 5F 43      [17]   35 call cube_clearAll
   4250 DD 21 D5 41   [14]   36 ld ix,#cubeline12
   4254 CD 5F 43      [17]   37 call cube_clearAll
   4257 DD 21 DB 41   [14]   38 ld ix,#cubeline13
   425B CD 5F 43      [17]   39 call cube_clearAll
   425E DD 21 E1 41   [14]   40 ld ix,#cubeline14
   4262 CD 5F 43      [17]   41 call cube_clearAll
   4265 DD 21 E7 41   [14]   42 ld ix,#cubeline15
   4269 CD 5F 43      [17]   43 call cube_clearAll
   426C DD 21 ED 41   [14]   44 ld ix,#cubeline16
   4270 CD 5F 43      [17]   45 call cube_clearAll
   4273 DD 21 F3 41   [14]   46 ld ix,#cubeline17
   4277 CD 5F 43      [17]   47 call cube_clearAll
   427A DD 21 F9 41   [14]   48 ld ix,#cubeline18
   427E CD 5F 43      [17]   49 call cube_clearAll
   4281 DD 21 FF 41   [14]   50 ld ix,#cubeline19
   4285 CD 5F 43      [17]   51 call cube_clearAll
   4288 DD 21 05 42   [14]   52 ld ix,#cubeline110
   428C CD 5F 43      [17]   53 call cube_clearAll
   428F DD 21 0B 42   [14]   54 ld ix,#cubeline111
   4293 CD 5F 43      [17]   55 call cube_clearAll
   4296 DD 21 11 42   [14]   56 ld ix,#cubeline112
   429A CD 5F 43      [17]   57 call cube_clearAll
   429D DD 21 17 42   [14]   58 ld ix,#cubeline113
   42A1 CD 5F 43      [17]   59 call cube_clearAll
   42A4 DD 21 1D 42   [14]   60 ld ix,#cubeline114
   42A8 CD 5F 43      [17]   61 call cube_clearAll
   42AB DD 21 23 42   [14]   62 ld ix,#cubeline115
   42AF CD 5F 43      [17]   63 call cube_clearAll
   42B2 DD 21 29 42   [14]   64 ld ix,#cubeline116
   42B6 CD 5F 43      [17]   65 call cube_clearAll
   42B9 DD 21 2F 42   [14]   66 ld ix,#cubeline117
   42BD CD 5F 43      [17]   67 call cube_clearAll
   42C0 DD 21 35 42   [14]   68 ld ix,#cubeline118
   42C4 CD 5F 43      [17]   69 call cube_clearAll
   42C7 DD 21 3B 42   [14]   70 ld ix,#cubeline119
   42CB CD 5F 43      [17]   71 call cube_clearAll
   42CE C9            [10]   72 ret
                             73 
   42CF                      74 cube_draw:
   42CF DD 21 C9 41   [14]   75 ld ix,#cubeline10
   42D3 CD 5C 43      [17]   76 call cube_drawAll
   42D6 DD 21 CF 41   [14]   77 ld ix,#cubeline11
   42DA CD 5C 43      [17]   78 call cube_drawAll
   42DD DD 21 D5 41   [14]   79 ld ix,#cubeline12
   42E1 CD 5C 43      [17]   80 call cube_drawAll
   42E4 DD 21 DB 41   [14]   81 ld ix,#cubeline13
   42E8 CD 5C 43      [17]   82 call cube_drawAll
   42EB DD 21 E1 41   [14]   83 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   42EF CD 5C 43      [17]   84 call cube_drawAll
   42F2 DD 21 E7 41   [14]   85 ld ix,#cubeline15
   42F6 CD 5C 43      [17]   86 call cube_drawAll
   42F9 DD 21 ED 41   [14]   87 ld ix,#cubeline16
   42FD CD 5C 43      [17]   88 call cube_drawAll
   4300 DD 21 F3 41   [14]   89 ld ix,#cubeline17
   4304 CD 5C 43      [17]   90 call cube_drawAll
   4307 DD 21 F9 41   [14]   91 ld ix,#cubeline18
   430B CD 5C 43      [17]   92 call cube_drawAll
   430E DD 21 FF 41   [14]   93 ld ix,#cubeline19
   4312 CD 5C 43      [17]   94 call cube_drawAll
   4315 DD 21 05 42   [14]   95 ld ix,#cubeline110
   4319 CD 5C 43      [17]   96 call cube_drawAll
   431C DD 21 0B 42   [14]   97 ld ix,#cubeline111
   4320 CD 5C 43      [17]   98 call cube_drawAll
   4323 DD 21 11 42   [14]   99 ld ix,#cubeline112
   4327 CD 5C 43      [17]  100 call cube_drawAll
   432A DD 21 17 42   [14]  101 ld ix,#cubeline113
   432E CD 5C 43      [17]  102 call cube_drawAll
   4331 DD 21 1D 42   [14]  103 ld ix,#cubeline114
   4335 CD 5C 43      [17]  104 call cube_drawAll
   4338 DD 21 23 42   [14]  105 ld ix,#cubeline115
   433C CD 5C 43      [17]  106 call cube_drawAll
   433F DD 21 29 42   [14]  107 ld ix,#cubeline116
   4343 CD 5C 43      [17]  108 call cube_drawAll
   4346 DD 21 2F 42   [14]  109 ld ix,#cubeline117
   434A CD 5C 43      [17]  110 call cube_drawAll
   434D DD 21 35 42   [14]  111 ld ix,#cubeline118
   4351 CD 5C 43      [17]  112 call cube_drawAll
   4354 DD 21 3B 42   [14]  113 ld ix,#cubeline119
   4358 CD 5C 43      [17]  114 call cube_drawAll
   435B C9            [10]  115 ret
                            116 
                            117 
                            118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            119 ;; DRAW ENTITY
                            120 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            121 ;; INPUT: IX -> Points to entity
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   435C                     123 cube_drawAll:
   435C C3 5A 40      [10]  124     jp render_drawCube
                            125    
                            126    
                            127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            128 ;; BORRA UNA ENTIDAD
                            129 ;; PARA CUADRADOS UNICAMENTE
                            130 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            131 ;; ENTRADA: IX -> Puntero a entidad
                            132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   435F                     133 cube_clearAll:
                            134 
   435F DD 7E 04      [19]  135    ld  a, dc_col(ix)
   4362 08            [ 4]  136    ex af, af'
                            137 
   4363 DD 36 04 00   [19]  138    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            139 
   4367 CD 5A 40      [17]  140    call render_drawCube
   436A 08            [ 4]  141    ex af, af'
   436B DD 77 04      [19]  142    ld dc_col(ix), a
                            143 
   436E C9            [10]  144    ret
