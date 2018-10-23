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
   4200                       8 DefineCubeLine1 cubeline10, 0x10, 0x20, 0x10, 0x40, 0x0F, 0x01
   4200                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x10, 0x20, 0x10, 0x40, 0x0F
   0000                       1 cubeline10_dw:
   4200 10 20                 2     .db 0x10, 0x20
   4202 10 40                 3     .db 0x10, 0x40
   4204 0F                    4     .db 0x0F
   4205 01                    3     .db     0x01     ;; Hitpoints
   4206                       9 DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
   4206                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x00, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   4206 04 00                 2     .db 0x04, 0x00
   4208 04 08                 3     .db 0x04, 0x08
   420A FF                    4     .db 0xFF
   420B 01                    3     .db     0x01     ;; Hitpoints
   420C                      10 DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
   420C                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x00, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   420C 08 00                 2     .db 0x08, 0x00
   420E 04 08                 3     .db 0x04, 0x08
   4210 0F                    4     .db 0x0F
   4211 01                    3     .db     0x01     ;; Hitpoints
   4212                      11 DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4212                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x00, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   4212 0C 00                 2     .db 0x0C, 0x00
   4214 04 08                 3     .db 0x04, 0x08
   4216 FF                    4     .db 0xFF
   4217 01                    3     .db     0x01     ;; Hitpoints
   4218                      12 DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
   4218                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x00, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   4218 10 00                 2     .db 0x10, 0x00
   421A 04 08                 3     .db 0x04, 0x08
   421C 0F                    4     .db 0x0F
   421D 01                    3     .db     0x01     ;; Hitpoints
   421E                      13 DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
   421E                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x00, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   421E 14 00                 2     .db 0x14, 0x00
   4220 04 08                 3     .db 0x04, 0x08
   4222 FF                    4     .db 0xFF
   4223 01                    3     .db     0x01     ;; Hitpoints
   4224                      14 DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
   4224                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x00, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   4224 18 00                 2     .db 0x18, 0x00
   4226 04 08                 3     .db 0x04, 0x08
   4228 0F                    4     .db 0x0F
   4229 01                    3     .db     0x01     ;; Hitpoints
   422A                      15 DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
   422A                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x00, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   422A 1C 00                 2     .db 0x1C, 0x00
   422C 04 08                 3     .db 0x04, 0x08
   422E FF                    4     .db 0xFF
   422F 01                    3     .db     0x01     ;; Hitpoints
   4230                      16 DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
   4230                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x00, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   4230 20 00                 2     .db 0x20, 0x00
   4232 04 08                 3     .db 0x04, 0x08
   4234 0F                    4     .db 0x0F
   4235 01                    3     .db     0x01     ;; Hitpoints
   4236                      17 DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
   4236                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x00, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   4236 24 00                 2     .db 0x24, 0x00
   4238 04 08                 3     .db 0x04, 0x08
   423A FF                    4     .db 0xFF
   423B 01                    3     .db     0x01     ;; Hitpoints
   423C                      18 DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
   423C                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x00, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   423C 28 00                 2     .db 0x28, 0x00
   423E 04 08                 3     .db 0x04, 0x08
   4240 0F                    4     .db 0x0F
   4241 01                    3     .db     0x01     ;; Hitpoints
   4242                      19 DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4242                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x00, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   4242 2C 00                 2     .db 0x2C, 0x00
   4244 04 08                 3     .db 0x04, 0x08
   4246 FF                    4     .db 0xFF
   4247 01                    3     .db     0x01     ;; Hitpoints
   4248                      20 DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
   4248                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x00, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4248 30 00                 2     .db 0x30, 0x00
   424A 04 08                 3     .db 0x04, 0x08
   424C 0F                    4     .db 0x0F
   424D 01                    3     .db     0x01     ;; Hitpoints
   424E                      21 DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
   424E                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x00, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   424E 34 00                 2     .db 0x34, 0x00
   4250 04 08                 3     .db 0x04, 0x08
   4252 FF                    4     .db 0xFF
   4253 01                    3     .db     0x01     ;; Hitpoints
   4254                      22 DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
   4254                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x00, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   4254 38 00                 2     .db 0x38, 0x00
   4256 04 08                 3     .db 0x04, 0x08
   4258 0F                    4     .db 0x0F
   4259 01                    3     .db     0x01     ;; Hitpoints
   425A                      23 DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
   425A                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x00, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   425A 3C 00                 2     .db 0x3C, 0x00
   425C 04 08                 3     .db 0x04, 0x08
   425E FF                    4     .db 0xFF
   425F 01                    3     .db     0x01     ;; Hitpoints
   4260                      24 DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
   4260                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x00, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   4260 40 00                 2     .db 0x40, 0x00
   4262 04 08                 3     .db 0x04, 0x08
   4264 0F                    4     .db 0x0F
   4265 01                    3     .db     0x01     ;; Hitpoints
   4266                      25 DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
   4266                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x00, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   4266 44 00                 2     .db 0x44, 0x00
   4268 04 08                 3     .db 0x04, 0x08
   426A FF                    4     .db 0xFF
   426B 01                    3     .db     0x01     ;; Hitpoints
   426C                      26 DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
   426C                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x00, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   426C 48 00                 2     .db 0x48, 0x00
   426E 04 08                 3     .db 0x04, 0x08
   4270 0F                    4     .db 0x0F
   4271 01                    3     .db     0x01     ;; Hitpoints
   4272                      27 DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4272                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x00, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   4272 4C 00                 2     .db 0x4C, 0x00
   4274 04 08                 3     .db 0x04, 0x08
   4276 FF                    4     .db 0xFF
   4277 01                    3     .db     0x01     ;; Hitpoints
                             28 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4278 14                   29 m_num_cube: .db 20
                             30 
   4279                      31 cube_clear:
   4279 DD 21 00 42   [14]   32 ld ix,#cubeline10
   427D CD 96 43      [17]   33 call cube_clearAll
   4280 DD 21 06 42   [14]   34 ld ix,#cubeline11
   4284 CD 96 43      [17]   35 call cube_clearAll
   4287 DD 21 0C 42   [14]   36 ld ix,#cubeline12
   428B CD 96 43      [17]   37 call cube_clearAll
   428E DD 21 12 42   [14]   38 ld ix,#cubeline13
   4292 CD 96 43      [17]   39 call cube_clearAll
   4295 DD 21 18 42   [14]   40 ld ix,#cubeline14
   4299 CD 96 43      [17]   41 call cube_clearAll
   429C DD 21 1E 42   [14]   42 ld ix,#cubeline15
   42A0 CD 96 43      [17]   43 call cube_clearAll
   42A3 DD 21 24 42   [14]   44 ld ix,#cubeline16
   42A7 CD 96 43      [17]   45 call cube_clearAll
   42AA DD 21 2A 42   [14]   46 ld ix,#cubeline17
   42AE CD 96 43      [17]   47 call cube_clearAll
   42B1 DD 21 30 42   [14]   48 ld ix,#cubeline18
   42B5 CD 96 43      [17]   49 call cube_clearAll
   42B8 DD 21 36 42   [14]   50 ld ix,#cubeline19
   42BC CD 96 43      [17]   51 call cube_clearAll
   42BF DD 21 3C 42   [14]   52 ld ix,#cubeline110
   42C3 CD 96 43      [17]   53 call cube_clearAll
   42C6 DD 21 42 42   [14]   54 ld ix,#cubeline111
   42CA CD 96 43      [17]   55 call cube_clearAll
   42CD DD 21 48 42   [14]   56 ld ix,#cubeline112
   42D1 CD 96 43      [17]   57 call cube_clearAll
   42D4 DD 21 4E 42   [14]   58 ld ix,#cubeline113
   42D8 CD 96 43      [17]   59 call cube_clearAll
   42DB DD 21 54 42   [14]   60 ld ix,#cubeline114
   42DF CD 96 43      [17]   61 call cube_clearAll
   42E2 DD 21 5A 42   [14]   62 ld ix,#cubeline115
   42E6 CD 96 43      [17]   63 call cube_clearAll
   42E9 DD 21 60 42   [14]   64 ld ix,#cubeline116
   42ED CD 96 43      [17]   65 call cube_clearAll
   42F0 DD 21 66 42   [14]   66 ld ix,#cubeline117
   42F4 CD 96 43      [17]   67 call cube_clearAll
   42F7 DD 21 6C 42   [14]   68 ld ix,#cubeline118
   42FB CD 96 43      [17]   69 call cube_clearAll
   42FE DD 21 72 42   [14]   70 ld ix,#cubeline119
   4302 CD 96 43      [17]   71 call cube_clearAll
   4305 C9            [10]   72 ret
                             73 
   4306                      74 cube_draw:
   4306 DD 21 00 42   [14]   75 ld ix,#cubeline10
   430A CD 93 43      [17]   76 call cube_drawAll
   430D DD 21 06 42   [14]   77 ld ix,#cubeline11
   4311 CD 93 43      [17]   78 call cube_drawAll
   4314 DD 21 0C 42   [14]   79 ld ix,#cubeline12
   4318 CD 93 43      [17]   80 call cube_drawAll
   431B DD 21 12 42   [14]   81 ld ix,#cubeline13
   431F CD 93 43      [17]   82 call cube_drawAll
   4322 DD 21 18 42   [14]   83 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4326 CD 93 43      [17]   84 call cube_drawAll
   4329 DD 21 1E 42   [14]   85 ld ix,#cubeline15
   432D CD 93 43      [17]   86 call cube_drawAll
   4330 DD 21 24 42   [14]   87 ld ix,#cubeline16
   4334 CD 93 43      [17]   88 call cube_drawAll
   4337 DD 21 2A 42   [14]   89 ld ix,#cubeline17
   433B CD 93 43      [17]   90 call cube_drawAll
   433E DD 21 30 42   [14]   91 ld ix,#cubeline18
   4342 CD 93 43      [17]   92 call cube_drawAll
   4345 DD 21 36 42   [14]   93 ld ix,#cubeline19
   4349 CD 93 43      [17]   94 call cube_drawAll
   434C DD 21 3C 42   [14]   95 ld ix,#cubeline110
   4350 CD 93 43      [17]   96 call cube_drawAll
   4353 DD 21 42 42   [14]   97 ld ix,#cubeline111
   4357 CD 93 43      [17]   98 call cube_drawAll
   435A DD 21 48 42   [14]   99 ld ix,#cubeline112
   435E CD 93 43      [17]  100 call cube_drawAll
   4361 DD 21 4E 42   [14]  101 ld ix,#cubeline113
   4365 CD 93 43      [17]  102 call cube_drawAll
   4368 DD 21 54 42   [14]  103 ld ix,#cubeline114
   436C CD 93 43      [17]  104 call cube_drawAll
   436F DD 21 5A 42   [14]  105 ld ix,#cubeline115
   4373 CD 93 43      [17]  106 call cube_drawAll
   4376 DD 21 60 42   [14]  107 ld ix,#cubeline116
   437A CD 93 43      [17]  108 call cube_drawAll
   437D DD 21 66 42   [14]  109 ld ix,#cubeline117
   4381 CD 93 43      [17]  110 call cube_drawAll
   4384 DD 21 6C 42   [14]  111 ld ix,#cubeline118
   4388 CD 93 43      [17]  112 call cube_drawAll
   438B DD 21 72 42   [14]  113 ld ix,#cubeline119
   438F CD 93 43      [17]  114 call cube_drawAll
   4392 C9            [10]  115 ret
                            116 
                            117 
                            118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            119 ;; DRAW ENTITY
                            120 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            121 ;; INPUT: IX -> Points to entity
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4393                     123 cube_drawAll:
   4393 C3 5A 40      [10]  124     jp render_drawCube
                            125    
                            126    
                            127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            128 ;; BORRA UNA ENTIDAD
                            129 ;; PARA CUADRADOS UNICAMENTE
                            130 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            131 ;; ENTRADA: IX -> Puntero a entidad
                            132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4396                     133 cube_clearAll:
                            134 
   4396 DD 7E 04      [19]  135    ld  a, dc_col(ix)
   4399 08            [ 4]  136    ex af, af'
                            137 
   439A DD 36 04 00   [19]  138    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            139 
   439E CD 5A 40      [17]  140    call render_drawCube
   43A1 08            [ 4]  141    ex af, af'
   43A2 DD 77 04      [19]  142    ld dc_col(ix), a
                            143 
   43A5 C9            [10]  144    ret
