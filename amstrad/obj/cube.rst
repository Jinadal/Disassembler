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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              1 .include "render.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



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
                             55 .globl cubeline118
                             56 .globl cubeline119
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                              3 
                     0014     4 k_max_cube_line = 20
                     0007     5 k_cube_size = 7
                              6 
   41C1                       7 DefineCubeLine1 cubeline10, 0x00, 0x00, 0x04, 0x08, 0x0F, 0x01
   41C1                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x00, 0x04, 0x08, 0x0F
   0000                       1 cubeline10_dw:
   41C1 00 00                 2     .db 0x00, 0x00
   41C3 04 08                 3     .db 0x04, 0x08
   41C5 0F                    4     .db 0x0F
   41C6 01                    3     .db     0x01     ;; Hitpoints
   41C7                       8 DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
   41C7                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x00, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   41C7 04 00                 2     .db 0x04, 0x00
   41C9 04 08                 3     .db 0x04, 0x08
   41CB FF                    4     .db 0xFF
   41CC 01                    3     .db     0x01     ;; Hitpoints
   41CD                       9 DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
   41CD                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x00, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   41CD 08 00                 2     .db 0x08, 0x00
   41CF 04 08                 3     .db 0x04, 0x08
   41D1 0F                    4     .db 0x0F
   41D2 01                    3     .db     0x01     ;; Hitpoints
   41D3                      10 DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
   41D3                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x00, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   41D3 0C 00                 2     .db 0x0C, 0x00
   41D5 04 08                 3     .db 0x04, 0x08
   41D7 FF                    4     .db 0xFF
   41D8 01                    3     .db     0x01     ;; Hitpoints
   41D9                      11 DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
   41D9                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x00, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   41D9 10 00                 2     .db 0x10, 0x00
   41DB 04 08                 3     .db 0x04, 0x08
   41DD 0F                    4     .db 0x0F
   41DE 01                    3     .db     0x01     ;; Hitpoints
   41DF                      12 DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
   41DF                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x00, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   41DF 14 00                 2     .db 0x14, 0x00
   41E1 04 08                 3     .db 0x04, 0x08
   41E3 FF                    4     .db 0xFF
   41E4 01                    3     .db     0x01     ;; Hitpoints
   41E5                      13 DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
   41E5                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x00, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   41E5 18 00                 2     .db 0x18, 0x00
   41E7 04 08                 3     .db 0x04, 0x08
   41E9 0F                    4     .db 0x0F
   41EA 01                    3     .db     0x01     ;; Hitpoints
   41EB                      14 DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
   41EB                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x00, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   41EB 1C 00                 2     .db 0x1C, 0x00
   41ED 04 08                 3     .db 0x04, 0x08
   41EF FF                    4     .db 0xFF
   41F0 01                    3     .db     0x01     ;; Hitpoints
   41F1                      15 DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
   41F1                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x00, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   41F1 20 00                 2     .db 0x20, 0x00
   41F3 04 08                 3     .db 0x04, 0x08
   41F5 0F                    4     .db 0x0F
   41F6 01                    3     .db     0x01     ;; Hitpoints
   41F7                      16 DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
   41F7                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x00, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   41F7 24 00                 2     .db 0x24, 0x00
   41F9 04 08                 3     .db 0x04, 0x08
   41FB FF                    4     .db 0xFF
   41FC 01                    3     .db     0x01     ;; Hitpoints
   41FD                      17 DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
   41FD                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x00, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   41FD 28 00                 2     .db 0x28, 0x00
   41FF 04 08                 3     .db 0x04, 0x08
   4201 0F                    4     .db 0x0F
   4202 01                    3     .db     0x01     ;; Hitpoints
   4203                      18 DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4203                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x00, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   4203 2C 00                 2     .db 0x2C, 0x00
   4205 04 08                 3     .db 0x04, 0x08
   4207 FF                    4     .db 0xFF
   4208 01                    3     .db     0x01     ;; Hitpoints
   4209                      19 DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
   4209                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x00, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4209 30 00                 2     .db 0x30, 0x00
   420B 04 08                 3     .db 0x04, 0x08
   420D 0F                    4     .db 0x0F
   420E 01                    3     .db     0x01     ;; Hitpoints
   420F                      20 DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
   420F                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x00, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   420F 34 00                 2     .db 0x34, 0x00
   4211 04 08                 3     .db 0x04, 0x08
   4213 FF                    4     .db 0xFF
   4214 01                    3     .db     0x01     ;; Hitpoints
   4215                      21 DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
   4215                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x00, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   4215 38 00                 2     .db 0x38, 0x00
   4217 04 08                 3     .db 0x04, 0x08
   4219 0F                    4     .db 0x0F
   421A 01                    3     .db     0x01     ;; Hitpoints
   421B                      22 DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
   421B                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x00, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   421B 3C 00                 2     .db 0x3C, 0x00
   421D 04 08                 3     .db 0x04, 0x08
   421F FF                    4     .db 0xFF
   4220 01                    3     .db     0x01     ;; Hitpoints
   4221                      23 DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
   4221                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x00, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   4221 40 00                 2     .db 0x40, 0x00
   4223 04 08                 3     .db 0x04, 0x08
   4225 0F                    4     .db 0x0F
   4226 01                    3     .db     0x01     ;; Hitpoints
   4227                      24 DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
   4227                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x00, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   4227 44 00                 2     .db 0x44, 0x00
   4229 04 08                 3     .db 0x04, 0x08
   422B FF                    4     .db 0xFF
   422C 01                    3     .db     0x01     ;; Hitpoints
   422D                      25 DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
   422D                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x00, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   422D 48 00                 2     .db 0x48, 0x00
   422F 04 08                 3     .db 0x04, 0x08
   4231 0F                    4     .db 0x0F
   4232 01                    3     .db     0x01     ;; Hitpoints
   4233                      26 DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4233                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x00, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   4233 4C 00                 2     .db 0x4C, 0x00
   4235 04 08                 3     .db 0x04, 0x08
   4237 FF                    4     .db 0xFF
   4238 01                    3     .db     0x01     ;; Hitpoints
                             27 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4239 14                   28 m_num_cube: .db 20
                             29 
   423A                      30 cube_clear:
   423A DD 21 C1 41   [14]   31 ld ix,#cubeline10
   423E CD 57 43      [17]   32 call cube_clearAll
   4241 DD 21 C7 41   [14]   33 ld ix,#cubeline11
   4245 CD 57 43      [17]   34 call cube_clearAll
   4248 DD 21 CD 41   [14]   35 ld ix,#cubeline12
   424C CD 57 43      [17]   36 call cube_clearAll
   424F DD 21 D3 41   [14]   37 ld ix,#cubeline13
   4253 CD 57 43      [17]   38 call cube_clearAll
   4256 DD 21 D9 41   [14]   39 ld ix,#cubeline14
   425A CD 57 43      [17]   40 call cube_clearAll
   425D DD 21 DF 41   [14]   41 ld ix,#cubeline15
   4261 CD 57 43      [17]   42 call cube_clearAll
   4264 DD 21 E5 41   [14]   43 ld ix,#cubeline16
   4268 CD 57 43      [17]   44 call cube_clearAll
   426B DD 21 EB 41   [14]   45 ld ix,#cubeline17
   426F CD 57 43      [17]   46 call cube_clearAll
   4272 DD 21 F1 41   [14]   47 ld ix,#cubeline18
   4276 CD 57 43      [17]   48 call cube_clearAll
   4279 DD 21 F7 41   [14]   49 ld ix,#cubeline19
   427D CD 57 43      [17]   50 call cube_clearAll
   4280 DD 21 FD 41   [14]   51 ld ix,#cubeline110
   4284 CD 57 43      [17]   52 call cube_clearAll
   4287 DD 21 03 42   [14]   53 ld ix,#cubeline111
   428B CD 57 43      [17]   54 call cube_clearAll
   428E DD 21 09 42   [14]   55 ld ix,#cubeline112
   4292 CD 57 43      [17]   56 call cube_clearAll
   4295 DD 21 0F 42   [14]   57 ld ix,#cubeline113
   4299 CD 57 43      [17]   58 call cube_clearAll
   429C DD 21 15 42   [14]   59 ld ix,#cubeline114
   42A0 CD 57 43      [17]   60 call cube_clearAll
   42A3 DD 21 1B 42   [14]   61 ld ix,#cubeline115
   42A7 CD 57 43      [17]   62 call cube_clearAll
   42AA DD 21 21 42   [14]   63 ld ix,#cubeline116
   42AE CD 57 43      [17]   64 call cube_clearAll
   42B1 DD 21 27 42   [14]   65 ld ix,#cubeline117
   42B5 CD 57 43      [17]   66 call cube_clearAll
   42B8 DD 21 2D 42   [14]   67 ld ix,#cubeline118
   42BC CD 57 43      [17]   68 call cube_clearAll
   42BF DD 21 33 42   [14]   69 ld ix,#cubeline119
   42C3 CD 57 43      [17]   70 call cube_clearAll
   42C6 C9            [10]   71 ret
                             72 
   42C7                      73 cube_draw:
   42C7 DD 21 C1 41   [14]   74 ld ix,#cubeline10
   42CB CD 54 43      [17]   75 call cube_drawAll
   42CE DD 21 C7 41   [14]   76 ld ix,#cubeline11
   42D2 CD 54 43      [17]   77 call cube_drawAll
   42D5 DD 21 CD 41   [14]   78 ld ix,#cubeline12
   42D9 CD 54 43      [17]   79 call cube_drawAll
   42DC DD 21 D3 41   [14]   80 ld ix,#cubeline13
   42E0 CD 54 43      [17]   81 call cube_drawAll
   42E3 DD 21 D9 41   [14]   82 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   42E7 CD 54 43      [17]   83 call cube_drawAll
   42EA DD 21 DF 41   [14]   84 ld ix,#cubeline15
   42EE CD 54 43      [17]   85 call cube_drawAll
   42F1 DD 21 E5 41   [14]   86 ld ix,#cubeline16
   42F5 CD 54 43      [17]   87 call cube_drawAll
   42F8 DD 21 EB 41   [14]   88 ld ix,#cubeline17
   42FC CD 54 43      [17]   89 call cube_drawAll
   42FF DD 21 F1 41   [14]   90 ld ix,#cubeline18
   4303 CD 54 43      [17]   91 call cube_drawAll
   4306 DD 21 F7 41   [14]   92 ld ix,#cubeline19
   430A CD 54 43      [17]   93 call cube_drawAll
   430D DD 21 FD 41   [14]   94 ld ix,#cubeline110
   4311 CD 54 43      [17]   95 call cube_drawAll
   4314 DD 21 03 42   [14]   96 ld ix,#cubeline111
   4318 CD 54 43      [17]   97 call cube_drawAll
   431B DD 21 09 42   [14]   98 ld ix,#cubeline112
   431F CD 54 43      [17]   99 call cube_drawAll
   4322 DD 21 0F 42   [14]  100 ld ix,#cubeline113
   4326 CD 54 43      [17]  101 call cube_drawAll
   4329 DD 21 15 42   [14]  102 ld ix,#cubeline114
   432D CD 54 43      [17]  103 call cube_drawAll
   4330 DD 21 1B 42   [14]  104 ld ix,#cubeline115
   4334 CD 54 43      [17]  105 call cube_drawAll
   4337 DD 21 21 42   [14]  106 ld ix,#cubeline116
   433B CD 54 43      [17]  107 call cube_drawAll
   433E DD 21 27 42   [14]  108 ld ix,#cubeline117
   4342 CD 54 43      [17]  109 call cube_drawAll
   4345 DD 21 2D 42   [14]  110 ld ix,#cubeline118
   4349 CD 54 43      [17]  111 call cube_drawAll
   434C DD 21 33 42   [14]  112 ld ix,#cubeline119
   4350 CD 54 43      [17]  113 call cube_drawAll
   4353 C9            [10]  114 ret
                            115 
                            116 
                            117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            118 ;; DRAW ENTITY
                            119 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            120 ;; INPUT: IX -> Points to entity
                            121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4354                     122 cube_drawAll:
   4354 C3 5A 40      [10]  123     jp render_drawCube
                            124    
                            125    
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            127 ;; BORRA UNA ENTIDAD
                            128 ;; PARA CUADRADOS UNICAMENTE
                            129 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            130 ;; ENTRADA: IX -> Puntero a entidad
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4357                     132 cube_clearAll:
                            133 
   4357 DD 7E 04      [19]  134    ld  a, dc_col(ix)
   435A 08            [ 4]  135    ex af, af'
                            136 
   435B DD 36 04 00   [19]  137    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            138 
   435F CD 5A 40      [17]  139    call render_drawCube
   4362 08            [ 4]  140    ex af, af'
   4363 DD 77 04      [19]  141    ld dc_col(ix), a
                            142 
   4366 C9            [10]  143    ret
