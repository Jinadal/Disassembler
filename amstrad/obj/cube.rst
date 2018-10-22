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
   41BE                       7 DefineCubeLine1 cubeline10, 0x00, 0x100, 0x04, 0x08, 0x0F, 0x01
   41BE                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x100, 0x04, 0x08, 0x0F
   0000                       1 cubeline10_dw:
   41BE 00 00                 2     .db 0x00, 0x100
   41C0 04 08                 3     .db 0x04, 0x08
   41C2 0F                    4     .db 0x0F
   41C3 01                    3     .db     0x01     ;; Hitpoints
   41C4                       8 DefineCubeLine1 cubeline11, 0x04, 0x100, 0x04, 0x08, 0xFF, 0x01
   41C4                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x100, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   41C4 04 00                 2     .db 0x04, 0x100
   41C6 04 08                 3     .db 0x04, 0x08
   41C8 FF                    4     .db 0xFF
   41C9 01                    3     .db     0x01     ;; Hitpoints
   41CA                       9 DefineCubeLine1 cubeline12, 0x08, 0x100, 0x04, 0x08, 0x0F, 0x01
   41CA                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x100, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   41CA 08 00                 2     .db 0x08, 0x100
   41CC 04 08                 3     .db 0x04, 0x08
   41CE 0F                    4     .db 0x0F
   41CF 01                    3     .db     0x01     ;; Hitpoints
   41D0                      10 DefineCubeLine1 cubeline13, 0x0C, 0x100, 0x04, 0x08, 0xFF, 0x01
   41D0                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x100, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   41D0 0C 00                 2     .db 0x0C, 0x100
   41D2 04 08                 3     .db 0x04, 0x08
   41D4 FF                    4     .db 0xFF
   41D5 01                    3     .db     0x01     ;; Hitpoints
   41D6                      11 DefineCubeLine1 cubeline14, 0x10, 0x100, 0x04, 0x08, 0x0F, 0x01
   41D6                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x100, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   41D6 10 00                 2     .db 0x10, 0x100
   41D8 04 08                 3     .db 0x04, 0x08
   41DA 0F                    4     .db 0x0F
   41DB 01                    3     .db     0x01     ;; Hitpoints
   41DC                      12 DefineCubeLine1 cubeline15, 0x14, 0x100, 0x04, 0x08, 0xFF, 0x01
   41DC                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x100, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   41DC 14 00                 2     .db 0x14, 0x100
   41DE 04 08                 3     .db 0x04, 0x08
   41E0 FF                    4     .db 0xFF
   41E1 01                    3     .db     0x01     ;; Hitpoints
   41E2                      13 DefineCubeLine1 cubeline16, 0x18, 0x100, 0x04, 0x08, 0x0F, 0x01
   41E2                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x100, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   41E2 18 00                 2     .db 0x18, 0x100
   41E4 04 08                 3     .db 0x04, 0x08
   41E6 0F                    4     .db 0x0F
   41E7 01                    3     .db     0x01     ;; Hitpoints
   41E8                      14 DefineCubeLine1 cubeline17, 0x1C, 0x100, 0x04, 0x08, 0xFF, 0x01
   41E8                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x100, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   41E8 1C 00                 2     .db 0x1C, 0x100
   41EA 04 08                 3     .db 0x04, 0x08
   41EC FF                    4     .db 0xFF
   41ED 01                    3     .db     0x01     ;; Hitpoints
   41EE                      15 DefineCubeLine1 cubeline18, 0x20, 0x100, 0x04, 0x08, 0x0F, 0x01
   41EE                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x100, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   41EE 20 00                 2     .db 0x20, 0x100
   41F0 04 08                 3     .db 0x04, 0x08
   41F2 0F                    4     .db 0x0F
   41F3 01                    3     .db     0x01     ;; Hitpoints
   41F4                      16 DefineCubeLine1 cubeline19, 0x24, 0x100, 0x04, 0x08, 0xFF, 0x01
   41F4                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x100, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   41F4 24 00                 2     .db 0x24, 0x100
   41F6 04 08                 3     .db 0x04, 0x08
   41F8 FF                    4     .db 0xFF
   41F9 01                    3     .db     0x01     ;; Hitpoints
   41FA                      17 DefineCubeLine1 cubeline110, 0x28, 0x100, 0x04, 0x08, 0x0F, 0x01
   41FA                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x100, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   41FA 28 00                 2     .db 0x28, 0x100
   41FC 04 08                 3     .db 0x04, 0x08
   41FE 0F                    4     .db 0x0F
   41FF 01                    3     .db     0x01     ;; Hitpoints
   4200                      18 DefineCubeLine1 cubeline111, 0x2C, 0x100, 0x04, 0x08, 0xFF, 0x01
   4200                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x100, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   4200 2C 00                 2     .db 0x2C, 0x100
   4202 04 08                 3     .db 0x04, 0x08
   4204 FF                    4     .db 0xFF
   4205 01                    3     .db     0x01     ;; Hitpoints
   4206                      19 DefineCubeLine1 cubeline112, 0x30, 0x100, 0x04, 0x08, 0x0F, 0x01
   4206                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x100, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4206 30 00                 2     .db 0x30, 0x100
   4208 04 08                 3     .db 0x04, 0x08
   420A 0F                    4     .db 0x0F
   420B 01                    3     .db     0x01     ;; Hitpoints
   420C                      20 DefineCubeLine1 cubeline113, 0x34, 0x100, 0x04, 0x08, 0xFF, 0x01
   420C                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x100, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   420C 34 00                 2     .db 0x34, 0x100
   420E 04 08                 3     .db 0x04, 0x08
   4210 FF                    4     .db 0xFF
   4211 01                    3     .db     0x01     ;; Hitpoints
   4212                      21 DefineCubeLine1 cubeline114, 0x38, 0x100, 0x04, 0x08, 0x0F, 0x01
   4212                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x100, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   4212 38 00                 2     .db 0x38, 0x100
   4214 04 08                 3     .db 0x04, 0x08
   4216 0F                    4     .db 0x0F
   4217 01                    3     .db     0x01     ;; Hitpoints
   4218                      22 DefineCubeLine1 cubeline115, 0x3C, 0x100, 0x04, 0x08, 0xFF, 0x01
   4218                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x100, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   4218 3C 00                 2     .db 0x3C, 0x100
   421A 04 08                 3     .db 0x04, 0x08
   421C FF                    4     .db 0xFF
   421D 01                    3     .db     0x01     ;; Hitpoints
   421E                      23 DefineCubeLine1 cubeline116, 0x40, 0x100, 0x04, 0x08, 0x0F, 0x01
   421E                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x100, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   421E 40 00                 2     .db 0x40, 0x100
   4220 04 08                 3     .db 0x04, 0x08
   4222 0F                    4     .db 0x0F
   4223 01                    3     .db     0x01     ;; Hitpoints
   4224                      24 DefineCubeLine1 cubeline117, 0x44, 0x100, 0x04, 0x08, 0xFF, 0x01
   4224                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x100, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   4224 44 00                 2     .db 0x44, 0x100
   4226 04 08                 3     .db 0x04, 0x08
   4228 FF                    4     .db 0xFF
   4229 01                    3     .db     0x01     ;; Hitpoints
   422A                      25 DefineCubeLine1 cubeline118, 0x48, 0x100, 0x04, 0x08, 0x0F, 0x01
   422A                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x100, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   422A 48 00                 2     .db 0x48, 0x100
   422C 04 08                 3     .db 0x04, 0x08
   422E 0F                    4     .db 0x0F
   422F 01                    3     .db     0x01     ;; Hitpoints
   4230                      26 DefineCubeLine1 cubeline119, 0x4C, 0x100, 0x04, 0x08, 0xFF, 0x01
   4230                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x100, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   4230 4C 00                 2     .db 0x4C, 0x100
   4232 04 08                 3     .db 0x04, 0x08
   4234 FF                    4     .db 0xFF
   4235 01                    3     .db     0x01     ;; Hitpoints
                             27 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4236 14                   28 m_num_cube: .db 20
                             29 
   4237                      30 cube_clear:
   4237 DD 21 BE 41   [14]   31 ld ix,#cubeline10
   423B CD 54 43      [17]   32 call cube_clearAll
   423E DD 21 C4 41   [14]   33 ld ix,#cubeline11
   4242 CD 54 43      [17]   34 call cube_clearAll
   4245 DD 21 CA 41   [14]   35 ld ix,#cubeline12
   4249 CD 54 43      [17]   36 call cube_clearAll
   424C DD 21 D0 41   [14]   37 ld ix,#cubeline13
   4250 CD 54 43      [17]   38 call cube_clearAll
   4253 DD 21 D6 41   [14]   39 ld ix,#cubeline14
   4257 CD 54 43      [17]   40 call cube_clearAll
   425A DD 21 DC 41   [14]   41 ld ix,#cubeline15
   425E CD 54 43      [17]   42 call cube_clearAll
   4261 DD 21 E2 41   [14]   43 ld ix,#cubeline16
   4265 CD 54 43      [17]   44 call cube_clearAll
   4268 DD 21 E8 41   [14]   45 ld ix,#cubeline17
   426C CD 54 43      [17]   46 call cube_clearAll
   426F DD 21 EE 41   [14]   47 ld ix,#cubeline18
   4273 CD 54 43      [17]   48 call cube_clearAll
   4276 DD 21 F4 41   [14]   49 ld ix,#cubeline19
   427A CD 54 43      [17]   50 call cube_clearAll
   427D DD 21 FA 41   [14]   51 ld ix,#cubeline110
   4281 CD 54 43      [17]   52 call cube_clearAll
   4284 DD 21 00 42   [14]   53 ld ix,#cubeline111
   4288 CD 54 43      [17]   54 call cube_clearAll
   428B DD 21 06 42   [14]   55 ld ix,#cubeline112
   428F CD 54 43      [17]   56 call cube_clearAll
   4292 DD 21 0C 42   [14]   57 ld ix,#cubeline113
   4296 CD 54 43      [17]   58 call cube_clearAll
   4299 DD 21 12 42   [14]   59 ld ix,#cubeline114
   429D CD 54 43      [17]   60 call cube_clearAll
   42A0 DD 21 18 42   [14]   61 ld ix,#cubeline115
   42A4 CD 54 43      [17]   62 call cube_clearAll
   42A7 DD 21 1E 42   [14]   63 ld ix,#cubeline116
   42AB CD 54 43      [17]   64 call cube_clearAll
   42AE DD 21 24 42   [14]   65 ld ix,#cubeline117
   42B2 CD 54 43      [17]   66 call cube_clearAll
   42B5 DD 21 2A 42   [14]   67 ld ix,#cubeline118
   42B9 CD 54 43      [17]   68 call cube_clearAll
   42BC DD 21 30 42   [14]   69 ld ix,#cubeline119
   42C0 CD 54 43      [17]   70 call cube_clearAll
   42C3 C9            [10]   71 ret
                             72 
   42C4                      73 cube_draw:
   42C4 DD 21 BE 41   [14]   74 ld ix,#cubeline10
   42C8 CD 51 43      [17]   75 call cube_drawAll
   42CB DD 21 C4 41   [14]   76 ld ix,#cubeline11
   42CF CD 51 43      [17]   77 call cube_drawAll
   42D2 DD 21 CA 41   [14]   78 ld ix,#cubeline12
   42D6 CD 51 43      [17]   79 call cube_drawAll
   42D9 DD 21 D0 41   [14]   80 ld ix,#cubeline13
   42DD CD 51 43      [17]   81 call cube_drawAll
   42E0 DD 21 D6 41   [14]   82 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   42E4 CD 51 43      [17]   83 call cube_drawAll
   42E7 DD 21 DC 41   [14]   84 ld ix,#cubeline15
   42EB CD 51 43      [17]   85 call cube_drawAll
   42EE DD 21 E2 41   [14]   86 ld ix,#cubeline16
   42F2 CD 51 43      [17]   87 call cube_drawAll
   42F5 DD 21 E8 41   [14]   88 ld ix,#cubeline17
   42F9 CD 51 43      [17]   89 call cube_drawAll
   42FC DD 21 EE 41   [14]   90 ld ix,#cubeline18
   4300 CD 51 43      [17]   91 call cube_drawAll
   4303 DD 21 F4 41   [14]   92 ld ix,#cubeline19
   4307 CD 51 43      [17]   93 call cube_drawAll
   430A DD 21 FA 41   [14]   94 ld ix,#cubeline110
   430E CD 51 43      [17]   95 call cube_drawAll
   4311 DD 21 00 42   [14]   96 ld ix,#cubeline111
   4315 CD 51 43      [17]   97 call cube_drawAll
   4318 DD 21 06 42   [14]   98 ld ix,#cubeline112
   431C CD 51 43      [17]   99 call cube_drawAll
   431F DD 21 0C 42   [14]  100 ld ix,#cubeline113
   4323 CD 51 43      [17]  101 call cube_drawAll
   4326 DD 21 12 42   [14]  102 ld ix,#cubeline114
   432A CD 51 43      [17]  103 call cube_drawAll
   432D DD 21 18 42   [14]  104 ld ix,#cubeline115
   4331 CD 51 43      [17]  105 call cube_drawAll
   4334 DD 21 1E 42   [14]  106 ld ix,#cubeline116
   4338 CD 51 43      [17]  107 call cube_drawAll
   433B DD 21 24 42   [14]  108 ld ix,#cubeline117
   433F CD 51 43      [17]  109 call cube_drawAll
   4342 DD 21 2A 42   [14]  110 ld ix,#cubeline118
   4346 CD 51 43      [17]  111 call cube_drawAll
   4349 DD 21 30 42   [14]  112 ld ix,#cubeline119
   434D CD 51 43      [17]  113 call cube_drawAll
   4350 C9            [10]  114 ret
                            115 
                            116 
                            117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            118 ;; DRAW ENTITY
                            119 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            120 ;; INPUT: IX -> Points to entity
                            121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4351                     122 cube_drawAll:
   4351 C3 57 40      [10]  123     jp render_drawCube
                            124    
                            125    
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            127 ;; BORRA UNA ENTIDAD
                            128 ;; PARA CUADRADOS UNICAMENTE
                            129 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            130 ;; ENTRADA: IX -> Puntero a entidad
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4354                     132 cube_clearAll:
                            133 
   4354 DD 7E 04      [19]  134    ld  a, dc_col(ix)
   4357 08            [ 4]  135    ex af, af'
                            136 
   4358 DD 36 04 00   [19]  137    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            138 
   435C CD 57 40      [17]  139    call render_drawCube
   435F 08            [ 4]  140    ex af, af'
   4360 DD 77 04      [19]  141    ld dc_col(ix), a
                            142 
   4363 C9            [10]  143    ret
