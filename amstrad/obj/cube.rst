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
                             36 .globl cube_reset
                             37 
                             38 .globl destroy_cube
                             39 
                             40 .globl k_max_cube_line	
                             41 
                             42 
                             43 
                             44 .globl k_max_cube_line	
                             45 
                             46 
                             47 .globl cubeline10
                             48 .globl cubeline11
                             49 .globl cubeline12
                             50 .globl cubeline13
                             51 .globl cubeline14
                             52 .globl cubeline15
                             53 .globl cubeline16
                             54 .globl cubeline17
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl cubeline18
                             56 .globl cubeline19
                             57 .globl cubeline110
                             58 .globl cubeline111
                             59 .globl cubeline112
                             60 .globl cubeline113
                             61 .globl cubeline114
                             62 .globl cubeline115
                             63 .globl cubeline116
                             64 .globl cubeline117
                             65 .globl cubeline118
                             66 .globl cubeline119
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



                              4 .include "ball.h.s"
                              1 
                              2 
                              3 
                              4 .globl ball_clear
                              5 .globl ball_draw
                              6 .globl ball_update
                              7 .globl ball_move
                              8 .globl ball_reset
                              9 
                             10 
                             11 
                             12 
                             13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             14 ;;
                             15 ;;MACROS
                             16 ;;
                             17 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             18 
                             19    .macro DefineBall _name, _x, _y, _w, _h, _col,  _vx, _vy,_upd,_hp
                             20 _name: 
                             21 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             22   ; .db    _x, _y     ;; X, Y
                             23    ;.db    _w, _h     ;; W, H
                             24     ;.db   _col        ;; Color
                             25    .db   _vx, _vy    ;; VX, VY
                             26    .dw   _upd        ;; Update 
                             27    .db _hp
                             28 .endm
                             29 ;bl_x = 0
                             30 ;bl_y = 1
                             31 ;bl_w = 2
                             32 ;bl_h = 3
                             33 ;bl_col = 4
                     0005    34 bl_vx = 5
                     0006    35 bl_vy = 6
                     0007    36 bl_up_l = 7
                     0008    37 bl_up_h = 8
                     0009    38 bl_hp = 9
                             39 	
                             40 
                             41 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             42 ;;
                             43 ;;OBJETOS CREADOS CON LA MACROS
                             44 ;;
                             45 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             46 
                             47 .globl ball
                             48 .globl balldefault
                             49 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                              5 
                              6 
                     0014     7 k_max_cube_line = 20
                     0007     8 k_cube_size = 7
                              9 
                             10 
   4236                      11 DefineCubeLine1 cubedefault, 0x00, 0x10, 0x04, 0x08, 0x0F, 0x01
   4236                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x10, 0x04, 0x08, 0x0F
   0000                       1 cubedefault_dw:
   4236 00 10                 2     .db 0x00, 0x10
   4238 04 08                 3     .db 0x04, 0x08
   423A 0F                    4     .db 0x0F
   423B 01                    3     .db     0x01     ;; Hitpoints
                             12 
                             13 
                             14 
   423C                      15 DefineCubeLine1 cubeline10, 0x00, 0x10, 0x04, 0x08, 0x0F, 0x01
   423C                       1 cubeline10:
   0006                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x10, 0x04, 0x08, 0x0F
   0006                       1 cubeline10_dw:
   423C 00 10                 2     .db 0x00, 0x10
   423E 04 08                 3     .db 0x04, 0x08
   4240 0F                    4     .db 0x0F
   4241 01                    3     .db     0x01     ;; Hitpoints
   4242                      16 DefineCubeLine1 cubeline11, 0x04, 0x10, 0x04, 0x08, 0xFF, 0x01
   4242                       1 cubeline11:
   000C                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x10, 0x04, 0x08, 0xFF
   000C                       1 cubeline11_dw:
   4242 04 10                 2     .db 0x04, 0x10
   4244 04 08                 3     .db 0x04, 0x08
   4246 FF                    4     .db 0xFF
   4247 01                    3     .db     0x01     ;; Hitpoints
   4248                      17 DefineCubeLine1 cubeline12, 0x08, 0x10, 0x04, 0x08, 0x0F, 0x01
   4248                       1 cubeline12:
   0012                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x10, 0x04, 0x08, 0x0F
   0012                       1 cubeline12_dw:
   4248 08 10                 2     .db 0x08, 0x10
   424A 04 08                 3     .db 0x04, 0x08
   424C 0F                    4     .db 0x0F
   424D 01                    3     .db     0x01     ;; Hitpoints
   424E                      18 DefineCubeLine1 cubeline13, 0x0C, 0x10, 0x04, 0x08, 0xFF, 0x01
   424E                       1 cubeline13:
   0018                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x10, 0x04, 0x08, 0xFF
   0018                       1 cubeline13_dw:
   424E 0C 10                 2     .db 0x0C, 0x10
   4250 04 08                 3     .db 0x04, 0x08
   4252 FF                    4     .db 0xFF
   4253 01                    3     .db     0x01     ;; Hitpoints
   4254                      19 DefineCubeLine1 cubeline14, 0x10, 0x10, 0x04, 0x08, 0x0F, 0x01
   4254                       1 cubeline14:
   001E                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x10, 0x04, 0x08, 0x0F
   001E                       1 cubeline14_dw:
   4254 10 10                 2     .db 0x10, 0x10
   4256 04 08                 3     .db 0x04, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   4258 0F                    4     .db 0x0F
   4259 01                    3     .db     0x01     ;; Hitpoints
   425A                      20 DefineCubeLine1 cubeline15, 0x14, 0x10, 0x04, 0x08, 0xFF, 0x01
   425A                       1 cubeline15:
   0024                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x10, 0x04, 0x08, 0xFF
   0024                       1 cubeline15_dw:
   425A 14 10                 2     .db 0x14, 0x10
   425C 04 08                 3     .db 0x04, 0x08
   425E FF                    4     .db 0xFF
   425F 01                    3     .db     0x01     ;; Hitpoints
   4260                      21 DefineCubeLine1 cubeline16, 0x18, 0x10, 0x04, 0x08, 0x0F, 0x01
   4260                       1 cubeline16:
   002A                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x10, 0x04, 0x08, 0x0F
   002A                       1 cubeline16_dw:
   4260 18 10                 2     .db 0x18, 0x10
   4262 04 08                 3     .db 0x04, 0x08
   4264 0F                    4     .db 0x0F
   4265 01                    3     .db     0x01     ;; Hitpoints
   4266                      22 DefineCubeLine1 cubeline17, 0x1C, 0x10, 0x04, 0x08, 0xFF, 0x01
   4266                       1 cubeline17:
   0030                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x10, 0x04, 0x08, 0xFF
   0030                       1 cubeline17_dw:
   4266 1C 10                 2     .db 0x1C, 0x10
   4268 04 08                 3     .db 0x04, 0x08
   426A FF                    4     .db 0xFF
   426B 01                    3     .db     0x01     ;; Hitpoints
   426C                      23 DefineCubeLine1 cubeline18, 0x20, 0x10, 0x04, 0x08, 0x0F, 0x01
   426C                       1 cubeline18:
   0036                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x10, 0x04, 0x08, 0x0F
   0036                       1 cubeline18_dw:
   426C 20 10                 2     .db 0x20, 0x10
   426E 04 08                 3     .db 0x04, 0x08
   4270 0F                    4     .db 0x0F
   4271 01                    3     .db     0x01     ;; Hitpoints
   4272                      24 DefineCubeLine1 cubeline19, 0x24, 0x10, 0x04, 0x08, 0xFF, 0x01
   4272                       1 cubeline19:
   003C                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x10, 0x04, 0x08, 0xFF
   003C                       1 cubeline19_dw:
   4272 24 10                 2     .db 0x24, 0x10
   4274 04 08                 3     .db 0x04, 0x08
   4276 FF                    4     .db 0xFF
   4277 01                    3     .db     0x01     ;; Hitpoints
   4278                      25 DefineCubeLine1 cubeline110, 0x28, 0x10, 0x04, 0x08, 0x0F, 0x01
   4278                       1 cubeline110:
   0042                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x10, 0x04, 0x08, 0x0F
   0042                       1 cubeline110_dw:
   4278 28 10                 2     .db 0x28, 0x10
   427A 04 08                 3     .db 0x04, 0x08
   427C 0F                    4     .db 0x0F
   427D 01                    3     .db     0x01     ;; Hitpoints
   427E                      26 DefineCubeLine1 cubeline111, 0x2C, 0x10, 0x04, 0x08, 0xFF, 0x01
   427E                       1 cubeline111:
   0048                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x10, 0x04, 0x08, 0xFF
   0048                       1 cubeline111_dw:
   427E 2C 10                 2     .db 0x2C, 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   4280 04 08                 3     .db 0x04, 0x08
   4282 FF                    4     .db 0xFF
   4283 01                    3     .db     0x01     ;; Hitpoints
   4284                      27 DefineCubeLine1 cubeline112, 0x30, 0x10, 0x04, 0x08, 0x0F, 0x01
   4284                       1 cubeline112:
   004E                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x10, 0x04, 0x08, 0x0F
   004E                       1 cubeline112_dw:
   4284 30 10                 2     .db 0x30, 0x10
   4286 04 08                 3     .db 0x04, 0x08
   4288 0F                    4     .db 0x0F
   4289 01                    3     .db     0x01     ;; Hitpoints
   428A                      28 DefineCubeLine1 cubeline113, 0x34, 0x10, 0x04, 0x08, 0xFF, 0x01
   428A                       1 cubeline113:
   0054                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x10, 0x04, 0x08, 0xFF
   0054                       1 cubeline113_dw:
   428A 34 10                 2     .db 0x34, 0x10
   428C 04 08                 3     .db 0x04, 0x08
   428E FF                    4     .db 0xFF
   428F 01                    3     .db     0x01     ;; Hitpoints
   4290                      29 DefineCubeLine1 cubeline114, 0x38, 0x10, 0x04, 0x08, 0x0F, 0x01
   4290                       1 cubeline114:
   005A                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x10, 0x04, 0x08, 0x0F
   005A                       1 cubeline114_dw:
   4290 38 10                 2     .db 0x38, 0x10
   4292 04 08                 3     .db 0x04, 0x08
   4294 0F                    4     .db 0x0F
   4295 01                    3     .db     0x01     ;; Hitpoints
   4296                      30 DefineCubeLine1 cubeline115, 0x3C, 0x10, 0x04, 0x08, 0xFF, 0x01
   4296                       1 cubeline115:
   0060                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x10, 0x04, 0x08, 0xFF
   0060                       1 cubeline115_dw:
   4296 3C 10                 2     .db 0x3C, 0x10
   4298 04 08                 3     .db 0x04, 0x08
   429A FF                    4     .db 0xFF
   429B 01                    3     .db     0x01     ;; Hitpoints
   429C                      31 DefineCubeLine1 cubeline116, 0x40, 0x10, 0x04, 0x08, 0x0F, 0x01
   429C                       1 cubeline116:
   0066                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x10, 0x04, 0x08, 0x0F
   0066                       1 cubeline116_dw:
   429C 40 10                 2     .db 0x40, 0x10
   429E 04 08                 3     .db 0x04, 0x08
   42A0 0F                    4     .db 0x0F
   42A1 01                    3     .db     0x01     ;; Hitpoints
   42A2                      32 DefineCubeLine1 cubeline117, 0x44, 0x10, 0x04, 0x08, 0xFF, 0x01
   42A2                       1 cubeline117:
   006C                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x10, 0x04, 0x08, 0xFF
   006C                       1 cubeline117_dw:
   42A2 44 10                 2     .db 0x44, 0x10
   42A4 04 08                 3     .db 0x04, 0x08
   42A6 FF                    4     .db 0xFF
   42A7 01                    3     .db     0x01     ;; Hitpoints
   42A8                      33 DefineCubeLine1 cubeline118, 0x48, 0x10, 0x04, 0x08, 0x0F, 0x01
   42A8                       1 cubeline118:
   0072                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x10, 0x04, 0x08, 0x0F
   0072                       1 cubeline118_dw:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   42A8 48 10                 2     .db 0x48, 0x10
   42AA 04 08                 3     .db 0x04, 0x08
   42AC 0F                    4     .db 0x0F
   42AD 01                    3     .db     0x01     ;; Hitpoints
   42AE                      34 DefineCubeLine1 cubeline119, 0x4C, 0x10, 0x04, 0x08, 0xFF, 0x01
   42AE                       1 cubeline119:
   0078                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x10, 0x04, 0x08, 0xFF
   0078                       1 cubeline119_dw:
   42AE 4C 10                 2     .db 0x4C, 0x10
   42B0 04 08                 3     .db 0x04, 0x08
   42B2 FF                    4     .db 0xFF
   42B3 01                    3     .db     0x01     ;; Hitpoints
                             35 
                             36 
   42B4 03                   37 m_num_cube: .db 3
                             38 
   42B5                      39 cube_clear:
   42B5 DD 21 3C 42   [14]   40 ld ix,#cubeline10
   42B9 CD D2 43      [17]   41 call cube_clearAll
   42BC DD 21 42 42   [14]   42 ld ix,#cubeline11
   42C0 CD D2 43      [17]   43 call cube_clearAll
   42C3 DD 21 48 42   [14]   44 ld ix,#cubeline12
   42C7 CD D2 43      [17]   45 call cube_clearAll
   42CA DD 21 4E 42   [14]   46 ld ix,#cubeline13
   42CE CD D2 43      [17]   47 call cube_clearAll
   42D1 DD 21 54 42   [14]   48 ld ix,#cubeline14
   42D5 CD D2 43      [17]   49 call cube_clearAll
   42D8 DD 21 5A 42   [14]   50 ld ix,#cubeline15
   42DC CD D2 43      [17]   51 call cube_clearAll
   42DF DD 21 60 42   [14]   52 ld ix,#cubeline16
   42E3 CD D2 43      [17]   53 call cube_clearAll
   42E6 DD 21 66 42   [14]   54 ld ix,#cubeline17
   42EA CD D2 43      [17]   55 call cube_clearAll
   42ED DD 21 6C 42   [14]   56 ld ix,#cubeline18
   42F1 CD D2 43      [17]   57 call cube_clearAll
   42F4 DD 21 72 42   [14]   58 ld ix,#cubeline19
   42F8 CD D2 43      [17]   59 call cube_clearAll
   42FB DD 21 78 42   [14]   60 ld ix,#cubeline110
   42FF CD D2 43      [17]   61 call cube_clearAll
   4302 DD 21 7E 42   [14]   62 ld ix,#cubeline111
   4306 CD D2 43      [17]   63 call cube_clearAll
   4309 DD 21 84 42   [14]   64 ld ix,#cubeline112
   430D CD D2 43      [17]   65 call cube_clearAll
   4310 DD 21 8A 42   [14]   66 ld ix,#cubeline113
   4314 CD D2 43      [17]   67 call cube_clearAll
   4317 DD 21 90 42   [14]   68 ld ix,#cubeline114
   431B CD D2 43      [17]   69 call cube_clearAll
   431E DD 21 96 42   [14]   70 ld ix,#cubeline115
   4322 CD D2 43      [17]   71 call cube_clearAll
   4325 DD 21 9C 42   [14]   72 ld ix,#cubeline116
   4329 CD D2 43      [17]   73 call cube_clearAll
   432C DD 21 A2 42   [14]   74 ld ix,#cubeline117
   4330 CD D2 43      [17]   75 call cube_clearAll
   4333 DD 21 A8 42   [14]   76 ld ix,#cubeline118
   4337 CD D2 43      [17]   77 call cube_clearAll
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   433A DD 21 AE 42   [14]   78 ld ix,#cubeline119
   433E CD D2 43      [17]   79 call cube_clearAll
   4341 C9            [10]   80 ret
                             81 
   4342                      82 cube_draw:
   4342 DD 21 3C 42   [14]   83 ld ix,#cubeline10
   4346 CD CF 43      [17]   84 call cube_drawAll
   4349 DD 21 42 42   [14]   85 ld ix,#cubeline11
   434D CD CF 43      [17]   86 call cube_drawAll
   4350 DD 21 48 42   [14]   87 ld ix,#cubeline12
   4354 CD CF 43      [17]   88 call cube_drawAll
   4357 DD 21 4E 42   [14]   89 ld ix,#cubeline13
   435B CD CF 43      [17]   90 call cube_drawAll
   435E DD 21 54 42   [14]   91 ld ix,#cubeline14
   4362 CD CF 43      [17]   92 call cube_drawAll
   4365 DD 21 5A 42   [14]   93 ld ix,#cubeline15
   4369 CD CF 43      [17]   94 call cube_drawAll
   436C DD 21 60 42   [14]   95 ld ix,#cubeline16
   4370 CD CF 43      [17]   96 call cube_drawAll
   4373 DD 21 66 42   [14]   97 ld ix,#cubeline17
   4377 CD CF 43      [17]   98 call cube_drawAll
   437A DD 21 6C 42   [14]   99 ld ix,#cubeline18
   437E CD CF 43      [17]  100 call cube_drawAll
   4381 DD 21 72 42   [14]  101 ld ix,#cubeline19
   4385 CD CF 43      [17]  102 call cube_drawAll
   4388 DD 21 78 42   [14]  103 ld ix,#cubeline110
   438C CD CF 43      [17]  104 call cube_drawAll
   438F DD 21 7E 42   [14]  105 ld ix,#cubeline111
   4393 CD CF 43      [17]  106 call cube_drawAll
   4396 DD 21 84 42   [14]  107 ld ix,#cubeline112
   439A CD CF 43      [17]  108 call cube_drawAll
   439D DD 21 8A 42   [14]  109 ld ix,#cubeline113
   43A1 CD CF 43      [17]  110 call cube_drawAll
   43A4 DD 21 90 42   [14]  111 ld ix,#cubeline114
   43A8 CD CF 43      [17]  112 call cube_drawAll
   43AB DD 21 96 42   [14]  113 ld ix,#cubeline115
   43AF CD CF 43      [17]  114 call cube_drawAll
   43B2 DD 21 9C 42   [14]  115 ld ix,#cubeline116
   43B6 CD CF 43      [17]  116 call cube_drawAll
   43B9 DD 21 A2 42   [14]  117 ld ix,#cubeline117
   43BD CD CF 43      [17]  118 call cube_drawAll
   43C0 DD 21 A8 42   [14]  119 ld ix,#cubeline118
   43C4 CD CF 43      [17]  120 call cube_drawAll
   43C7 DD 21 AE 42   [14]  121 ld ix,#cubeline119
   43CB CD CF 43      [17]  122 call cube_drawAll
   43CE C9            [10]  123 ret
                            124 
                            125 
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            127 ;; DRAW ENTITY
                            128 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            129 ;; INPUT: IX -> Points to entity
                            130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43CF                     131 cube_drawAll:
   43CF C3 5A 40      [10]  132     jp render_drawCube
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                            133    
                            134    
                            135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            136 ;; BORRA UNA ENTIDAD
                            137 ;; PARA CUADRADOS UNICAMENTE
                            138 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            139 ;; ENTRADA: IX -> Puntero a entidad
                            140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43D2                     141 cube_clearAll:
                            142 
   43D2 DD 7E 04      [19]  143    ld  a, dc_col(ix)
   43D5 08            [ 4]  144    ex af, af'
                            145 
   43D6 DD 36 04 00   [19]  146    ld  dc_col(ix), #0
                            147 
   43DA CD 5A 40      [17]  148    call render_drawCube
   43DD 08            [ 4]  149    ex af, af'
   43DE DD 77 04      [19]  150    ld dc_col(ix), a
                            151 
   43E1 C9            [10]  152    ret
                            153 
                            154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            155 ;;
                            156 ;;RESET CUBES TO FIRST STATE
                            157 ;;
                            158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   43E2                     159 cube_reset:
                            160 
   43E2 CD F1 41      [17]  161 	call ball_reset
                            162 
   43E5 21 3C 42      [10]  163 	ld hl, #cubeline10
   43E8 1E 00         [ 7]  164 	ld e, #0
   43EA 16 00         [ 7]  165 	ld d, #0
   43EC 0E 00         [ 7]  166 	ld c, #0
   43EE DD 21 36 42   [14]  167 	ld ix, #cubedefault
   43F2                     168 	bucl:
                            169 
   43F2 7A            [ 4]  170 	ld a,d 
                            171 
   43F3 77            [ 7]  172 	ld (hl),a
                            173 
   43F4 C6 04         [ 7]  174 	add #4
                            175 
   43F6 57            [ 4]  176 	ld d,a
   43F7 23            [ 6]  177 	inc hl
                            178 
                            179 
   43F8 DD 7E 01      [19]  180 	ld a, dc_y(ix)
   43FB 77            [ 7]  181 	ld (hl),a
                            182 	
   43FC 23            [ 6]  183     	inc hl
                            184 
                            185 
   43FD DD 7E 02      [19]  186     	ld a, dc_w(ix)
   4400 77            [ 7]  187 	ld (hl),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   4401 23            [ 6]  188     	inc hl
                            189 
                            190 
   4402 DD 7E 03      [19]  191     	ld a, dc_h(ix)
   4405 77            [ 7]  192 	ld (hl),a
   4406 23            [ 6]  193     	inc hl
                            194     	
   4407 79            [ 4]  195     	ld a,c
   4408 D6 01         [ 7]  196     	sub #1
                            197 
   440A CA 16 44      [10]  198     	jp z, rojo
                            199 
   440D C6 02         [ 7]  200     	add #2
   440F 4F            [ 4]  201     	ld c,a
   4410 3E 0F         [ 7]  202 	ld a, #15
                            203 
   4412 77            [ 7]  204     	ld (hl),a
                            205 
   4413 C3 1D 44      [10]  206     	jp colorok
   4416                     207     	rojo:
   4416 4F            [ 4]  208     	ld c,a
                            209     	
   4417 3E FF         [ 7]  210     	ld a, #255
                            211 
   4419 77            [ 7]  212     	ld (hl),a
                            213 
   441A C3 1D 44      [10]  214     	jp colorok
                            215   	
   441D                     216 	colorok:
                            217 
   441D 23            [ 6]  218     	inc hl
                            219 
                            220     	;;hp
   441E 23            [ 6]  221     	inc hl
                            222 
   441F 7B            [ 4]  223   	ld a,e
   4420 C6 01         [ 7]  224   	add #1
                            225 
   4422 5F            [ 4]  226   	ld e,a
                            227 
   4423 D6 14         [ 7]  228   	sub #k_max_cube_line
                            229 
   4425 20 CB         [12]  230     	jr nz, bucl
                            231 
                            232     	
                            233 
   4427 C9            [10]  234  ret
                            235 
   4428                     236 destroy_cube:
   4428 36 FF         [10]  237 	ld (hl),#0xFF
   442A 23            [ 6]  238 	inc hl
   442B 23            [ 6]  239 	inc hl
   442C 23            [ 6]  240 	inc hl
   442D 23            [ 6]  241 	inc hl
                            242 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   442E 36 00         [10]  243 	ld (hl),#0x00
                            244 
   4430 2B            [ 6]  245 	dec hl
   4431 2B            [ 6]  246 	dec hl
   4432 2B            [ 6]  247 	dec hl
   4433 2B            [ 6]  248 	dec hl
                            249 
   4434 3A B4 42      [13]  250 	ld a, (m_num_cube)
   4437 D6 01         [ 7]  251 	sub #1
   4439 32 B4 42      [13]  252 	ld (m_num_cube),a
                            253 
   443C CA E2 43      [10]  254 	jp z, cube_reset
                            255 
   443F C9            [10]  256 ret
                            257 
