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
                             37 .globl k_max_cube_line	
                             38 
                             39 
                             40 .globl cubeline10
                             41 .globl cubeline11
                             42 .globl cubeline12
                             43 .globl cubeline13
                             44 .globl cubeline14
                             45 .globl cubeline15
                             46 .globl cubeline16
                             47 .globl cubeline17
                             48 .globl cubeline18
                             49 .globl cubeline19
                             50 .globl cubeline110
                             51 .globl cubeline111
                             52 .globl cubeline112
                             53 .globl cubeline113
                             54 .globl cubeline114
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl cubeline115
                             56 .globl cubeline116
                             57 .globl cubeline117
                             58 .globl cubeline118
                             59 .globl cubeline119
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
   420E                       8 DefineCubeLine1 cubeline10, 0x00, 0x00, 0x04, 0x08, 0x0F, 0x01
   420E                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x00, 0x04, 0x08, 0x0F
   0000                       1 cubeline10_dw:
   420E 00 00                 2     .db 0x00, 0x00
   4210 04 08                 3     .db 0x04, 0x08
   4212 0F                    4     .db 0x0F
   4213 01                    3     .db     0x01     ;; Hitpoints
   4214                       9 DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
   4214                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x00, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   4214 04 00                 2     .db 0x04, 0x00
   4216 04 08                 3     .db 0x04, 0x08
   4218 FF                    4     .db 0xFF
   4219 01                    3     .db     0x01     ;; Hitpoints
   421A                      10 DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
   421A                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x00, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   421A 08 00                 2     .db 0x08, 0x00
   421C 04 08                 3     .db 0x04, 0x08
   421E 0F                    4     .db 0x0F
   421F 01                    3     .db     0x01     ;; Hitpoints
   4220                      11 DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4220                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x00, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   4220 0C 00                 2     .db 0x0C, 0x00
   4222 04 08                 3     .db 0x04, 0x08
   4224 FF                    4     .db 0xFF
   4225 01                    3     .db     0x01     ;; Hitpoints
   4226                      12 DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
   4226                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x00, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   4226 10 00                 2     .db 0x10, 0x00
   4228 04 08                 3     .db 0x04, 0x08
   422A 0F                    4     .db 0x0F
   422B 01                    3     .db     0x01     ;; Hitpoints
   422C                      13 DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
   422C                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x00, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   422C 14 00                 2     .db 0x14, 0x00
   422E 04 08                 3     .db 0x04, 0x08
   4230 FF                    4     .db 0xFF
   4231 01                    3     .db     0x01     ;; Hitpoints
   4232                      14 DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
   4232                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x00, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   4232 18 00                 2     .db 0x18, 0x00
   4234 04 08                 3     .db 0x04, 0x08
   4236 0F                    4     .db 0x0F
   4237 01                    3     .db     0x01     ;; Hitpoints
   4238                      15 DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4238                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x00, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   4238 1C 00                 2     .db 0x1C, 0x00
   423A 04 08                 3     .db 0x04, 0x08
   423C FF                    4     .db 0xFF
   423D 01                    3     .db     0x01     ;; Hitpoints
   423E                      16 DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
   423E                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x00, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   423E 20 00                 2     .db 0x20, 0x00
   4240 04 08                 3     .db 0x04, 0x08
   4242 0F                    4     .db 0x0F
   4243 01                    3     .db     0x01     ;; Hitpoints
   4244                      17 DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
   4244                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x00, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   4244 24 00                 2     .db 0x24, 0x00
   4246 04 08                 3     .db 0x04, 0x08
   4248 FF                    4     .db 0xFF
   4249 01                    3     .db     0x01     ;; Hitpoints
   424A                      18 DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
   424A                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x00, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   424A 28 00                 2     .db 0x28, 0x00
   424C 04 08                 3     .db 0x04, 0x08
   424E 0F                    4     .db 0x0F
   424F 01                    3     .db     0x01     ;; Hitpoints
   4250                      19 DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4250                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x00, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   4250 2C 00                 2     .db 0x2C, 0x00
   4252 04 08                 3     .db 0x04, 0x08
   4254 FF                    4     .db 0xFF
   4255 01                    3     .db     0x01     ;; Hitpoints
   4256                      20 DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
   4256                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x00, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4256 30 00                 2     .db 0x30, 0x00
   4258 04 08                 3     .db 0x04, 0x08
   425A 0F                    4     .db 0x0F
   425B 01                    3     .db     0x01     ;; Hitpoints
   425C                      21 DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
   425C                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x00, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   425C 34 00                 2     .db 0x34, 0x00
   425E 04 08                 3     .db 0x04, 0x08
   4260 FF                    4     .db 0xFF
   4261 01                    3     .db     0x01     ;; Hitpoints
   4262                      22 DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
   4262                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x00, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   4262 38 00                 2     .db 0x38, 0x00
   4264 04 08                 3     .db 0x04, 0x08
   4266 0F                    4     .db 0x0F
   4267 01                    3     .db     0x01     ;; Hitpoints
   4268                      23 DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4268                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x00, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   4268 3C 00                 2     .db 0x3C, 0x00
   426A 04 08                 3     .db 0x04, 0x08
   426C FF                    4     .db 0xFF
   426D 01                    3     .db     0x01     ;; Hitpoints
   426E                      24 DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
   426E                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x00, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   426E 40 00                 2     .db 0x40, 0x00
   4270 04 08                 3     .db 0x04, 0x08
   4272 0F                    4     .db 0x0F
   4273 01                    3     .db     0x01     ;; Hitpoints
   4274                      25 DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
   4274                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x00, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   4274 44 00                 2     .db 0x44, 0x00
   4276 04 08                 3     .db 0x04, 0x08
   4278 FF                    4     .db 0xFF
   4279 01                    3     .db     0x01     ;; Hitpoints
   427A                      26 DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
   427A                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x00, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   427A 48 00                 2     .db 0x48, 0x00
   427C 04 08                 3     .db 0x04, 0x08
   427E 0F                    4     .db 0x0F
   427F 01                    3     .db     0x01     ;; Hitpoints
   4280                      27 DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4280                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x00, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   4280 4C 00                 2     .db 0x4C, 0x00
   4282 04 08                 3     .db 0x04, 0x08
   4284 FF                    4     .db 0xFF
   4285 01                    3     .db     0x01     ;; Hitpoints
                             28 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4286 14                   29 m_num_cube: .db 20
                             30 
   4287                      31 cube_clear:
   4287 DD 21 0E 42   [14]   32 ld ix,#cubeline10
   428B CD A4 43      [17]   33 call cube_clearAll
   428E DD 21 14 42   [14]   34 ld ix,#cubeline11
   4292 CD A4 43      [17]   35 call cube_clearAll
   4295 DD 21 1A 42   [14]   36 ld ix,#cubeline12
   4299 CD A4 43      [17]   37 call cube_clearAll
   429C DD 21 20 42   [14]   38 ld ix,#cubeline13
   42A0 CD A4 43      [17]   39 call cube_clearAll
   42A3 DD 21 26 42   [14]   40 ld ix,#cubeline14
   42A7 CD A4 43      [17]   41 call cube_clearAll
   42AA DD 21 2C 42   [14]   42 ld ix,#cubeline15
   42AE CD A4 43      [17]   43 call cube_clearAll
   42B1 DD 21 32 42   [14]   44 ld ix,#cubeline16
   42B5 CD A4 43      [17]   45 call cube_clearAll
   42B8 DD 21 38 42   [14]   46 ld ix,#cubeline17
   42BC CD A4 43      [17]   47 call cube_clearAll
   42BF DD 21 3E 42   [14]   48 ld ix,#cubeline18
   42C3 CD A4 43      [17]   49 call cube_clearAll
   42C6 DD 21 44 42   [14]   50 ld ix,#cubeline19
   42CA CD A4 43      [17]   51 call cube_clearAll
   42CD DD 21 4A 42   [14]   52 ld ix,#cubeline110
   42D1 CD A4 43      [17]   53 call cube_clearAll
   42D4 DD 21 50 42   [14]   54 ld ix,#cubeline111
   42D8 CD A4 43      [17]   55 call cube_clearAll
   42DB DD 21 56 42   [14]   56 ld ix,#cubeline112
   42DF CD A4 43      [17]   57 call cube_clearAll
   42E2 DD 21 5C 42   [14]   58 ld ix,#cubeline113
   42E6 CD A4 43      [17]   59 call cube_clearAll
   42E9 DD 21 62 42   [14]   60 ld ix,#cubeline114
   42ED CD A4 43      [17]   61 call cube_clearAll
   42F0 DD 21 68 42   [14]   62 ld ix,#cubeline115
   42F4 CD A4 43      [17]   63 call cube_clearAll
   42F7 DD 21 6E 42   [14]   64 ld ix,#cubeline116
   42FB CD A4 43      [17]   65 call cube_clearAll
   42FE DD 21 74 42   [14]   66 ld ix,#cubeline117
   4302 CD A4 43      [17]   67 call cube_clearAll
   4305 DD 21 7A 42   [14]   68 ld ix,#cubeline118
   4309 CD A4 43      [17]   69 call cube_clearAll
   430C DD 21 80 42   [14]   70 ld ix,#cubeline119
   4310 CD A4 43      [17]   71 call cube_clearAll
   4313 C9            [10]   72 ret
                             73 
   4314                      74 cube_draw:
   4314 DD 21 0E 42   [14]   75 ld ix,#cubeline10
   4318 CD A1 43      [17]   76 call cube_drawAll
   431B DD 21 14 42   [14]   77 ld ix,#cubeline11
   431F CD A1 43      [17]   78 call cube_drawAll
   4322 DD 21 1A 42   [14]   79 ld ix,#cubeline12
   4326 CD A1 43      [17]   80 call cube_drawAll
   4329 DD 21 20 42   [14]   81 ld ix,#cubeline13
   432D CD A1 43      [17]   82 call cube_drawAll
   4330 DD 21 26 42   [14]   83 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4334 CD A1 43      [17]   84 call cube_drawAll
   4337 DD 21 2C 42   [14]   85 ld ix,#cubeline15
   433B CD A1 43      [17]   86 call cube_drawAll
   433E DD 21 32 42   [14]   87 ld ix,#cubeline16
   4342 CD A1 43      [17]   88 call cube_drawAll
   4345 DD 21 38 42   [14]   89 ld ix,#cubeline17
   4349 CD A1 43      [17]   90 call cube_drawAll
   434C DD 21 3E 42   [14]   91 ld ix,#cubeline18
   4350 CD A1 43      [17]   92 call cube_drawAll
   4353 DD 21 44 42   [14]   93 ld ix,#cubeline19
   4357 CD A1 43      [17]   94 call cube_drawAll
   435A DD 21 4A 42   [14]   95 ld ix,#cubeline110
   435E CD A1 43      [17]   96 call cube_drawAll
   4361 DD 21 50 42   [14]   97 ld ix,#cubeline111
   4365 CD A1 43      [17]   98 call cube_drawAll
   4368 DD 21 56 42   [14]   99 ld ix,#cubeline112
   436C CD A1 43      [17]  100 call cube_drawAll
   436F DD 21 5C 42   [14]  101 ld ix,#cubeline113
   4373 CD A1 43      [17]  102 call cube_drawAll
   4376 DD 21 62 42   [14]  103 ld ix,#cubeline114
   437A CD A1 43      [17]  104 call cube_drawAll
   437D DD 21 68 42   [14]  105 ld ix,#cubeline115
   4381 CD A1 43      [17]  106 call cube_drawAll
   4384 DD 21 6E 42   [14]  107 ld ix,#cubeline116
   4388 CD A1 43      [17]  108 call cube_drawAll
   438B DD 21 74 42   [14]  109 ld ix,#cubeline117
   438F CD A1 43      [17]  110 call cube_drawAll
   4392 DD 21 7A 42   [14]  111 ld ix,#cubeline118
   4396 CD A1 43      [17]  112 call cube_drawAll
   4399 DD 21 80 42   [14]  113 ld ix,#cubeline119
   439D CD A1 43      [17]  114 call cube_drawAll
   43A0 C9            [10]  115 ret
                            116 
                            117 
                            118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            119 ;; DRAW ENTITY
                            120 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            121 ;; INPUT: IX -> Points to entity
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43A1                     123 cube_drawAll:
   43A1 C3 5A 40      [10]  124     jp render_drawCube
                            125    
                            126    
                            127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            128 ;; BORRA UNA ENTIDAD
                            129 ;; PARA CUADRADOS UNICAMENTE
                            130 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            131 ;; ENTRADA: IX -> Puntero a entidad
                            132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43A4                     133 cube_clearAll:
                            134 
   43A4 DD 7E 04      [19]  135    ld  a, dc_col(ix)
   43A7 08            [ 4]  136    ex af, af'
                            137 
   43A8 DD 36 04 00   [19]  138    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            139 
   43AC CD 5A 40      [17]  140    call render_drawCube
   43AF 08            [ 4]  141    ex af, af'
   43B0 DD 77 04      [19]  142    ld dc_col(ix), a
                            143 
   43B3 C9            [10]  144    ret
