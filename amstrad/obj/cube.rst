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
                             10 .globl cpct_drawSprite_asm
                             11 .globl cpct_setPalette_asm
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
<<<<<<< HEAD
                             42 .globl cubeline10
                             43 .globl cubeline11
                             44 .globl cubeline12
                             45 .globl cubeline13
                             46 .globl cubeline14
                             47 .globl cubeline15
                             48 .globl cubeline16
                             49 .globl cubeline17
                             50 .globl cubeline18
                             51 .globl cubeline19
=======
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
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



<<<<<<< HEAD
=======
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



>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
                              3 .include "render.h.s"
                              1 
                              2 
                              3 ;;Drawable Entity
                              4 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
                              5 _name:
                              6     .db _x, _y
                              7     .db _w, _h
<<<<<<< HEAD
                              8     .dw _sprite
                              9 
                             10 _name'_size = . - _name
                             11 .endm
                     0001    12 dc_x    = 0     dc_y    = 1
                     0003    13 dc_w    = 2     dc_h    = 3
                     0005    14 dc_sp_l  = 4    dc_sp_h  = 5
                             15 
                             16 .globl ren_clearBackBuffers
                             17 ;;.globl ren_switchBuffers
                             18 .globl render_drawCube
                             19 .globl ren_newScene
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
=======
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
                             18 .globl m_back_buffer
                             19 .globl m_front_buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
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
<<<<<<< HEAD
                             19    .macro DefineBall _name, _x, _y, _w, _h, _sprite,  _vx, _vy,_upd,_hp
                             20 _name: 
                             21 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _sprite
=======
                             19    .macro DefineBall _name, _x, _y, _w, _h, _col,  _vx, _vy,_upd,_hp
                             20 _name: 
                             21 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
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
<<<<<<< HEAD
                     0006    34 bl_vx = 6
                     0007    35 bl_vy = 7
                     0008    36 bl_up_l = 8
                     0009    37 bl_up_h = 9
                     000A    38 bl_hp = 10
=======
                     0005    34 bl_vx = 5
                     0006    35 bl_vy = 6
                     0007    36 bl_up_l = 7
                     0008    37 bl_up_h = 8
                     0009    38 bl_hp = 9
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
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
<<<<<<< HEAD
                             49 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
=======
                             49 .globl screenPointer
                             50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                              5 
                              6 
                     0014     7 k_max_cube_line = 20
                     0007     8 k_cube_size = 7
                              9 
                             10 
   427F                      11 DefineCubeLine1 cubedefault, 0x00, 0x10, 0x04, 0x08, 0x0F, 0x01
   427F                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x10, 0x04, 0x08, 0x0F
   0000                       1 cubedefault_dw:
   427F 00 10                 2     .db 0x00, 0x10
   4281 04 08                 3     .db 0x04, 0x08
   4283 0F                    4     .db 0x0F
   4284 01                    3     .db     0x01     ;; Hitpoints
                             12 
                             13 
                             14 
   4285                      15 DefineCubeLine1 cubeline10, 0x00, 0x10, 0x04, 0x08, 0x0F, 0x01
   4285                       1 cubeline10:
   0006                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x10, 0x04, 0x08, 0x0F
   0006                       1 cubeline10_dw:
   4285 00 10                 2     .db 0x00, 0x10
   4287 04 08                 3     .db 0x04, 0x08
   4289 0F                    4     .db 0x0F
   428A 01                    3     .db     0x01     ;; Hitpoints
   428B                      16 DefineCubeLine1 cubeline11, 0x04, 0x10, 0x04, 0x08, 0xFF, 0x01
   428B                       1 cubeline11:
   000C                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x10, 0x04, 0x08, 0xFF
   000C                       1 cubeline11_dw:
   428B 04 10                 2     .db 0x04, 0x10
   428D 04 08                 3     .db 0x04, 0x08
   428F FF                    4     .db 0xFF
   4290 01                    3     .db     0x01     ;; Hitpoints
   4291                      17 DefineCubeLine1 cubeline12, 0x08, 0x10, 0x04, 0x08, 0x0F, 0x01
   4291                       1 cubeline12:
   0012                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x10, 0x04, 0x08, 0x0F
   0012                       1 cubeline12_dw:
   4291 08 10                 2     .db 0x08, 0x10
   4293 04 08                 3     .db 0x04, 0x08
   4295 0F                    4     .db 0x0F
   4296 01                    3     .db     0x01     ;; Hitpoints
   4297                      18 DefineCubeLine1 cubeline13, 0x0C, 0x10, 0x04, 0x08, 0xFF, 0x01
   4297                       1 cubeline13:
   0018                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x10, 0x04, 0x08, 0xFF
   0018                       1 cubeline13_dw:
   4297 0C 10                 2     .db 0x0C, 0x10
   4299 04 08                 3     .db 0x04, 0x08
   429B FF                    4     .db 0xFF
   429C 01                    3     .db     0x01     ;; Hitpoints
   429D                      19 DefineCubeLine1 cubeline14, 0x10, 0x10, 0x04, 0x08, 0x0F, 0x01
   429D                       1 cubeline14:
   001E                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x10, 0x04, 0x08, 0x0F
   001E                       1 cubeline14_dw:
   429D 10 10                 2     .db 0x10, 0x10
   429F 04 08                 3     .db 0x04, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
                              5 
                              6 .globl _cubeline_sp
                              7 
                              8 
                     000A     9 k_max_cube_line = 10
                     0007    10 k_cube_size = 7
                             11 
                             12 
   40CD                      13 DefineCubeLine1 cubedefault, 0x00, 0x10, 0x04, 0x08, _cubeline_sp, 0x01
   40CD                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x10, 0x04, 0x08, _cubeline_sp
   0000                       1 cubedefault_dw:
   40CD 00 10                 2     .db 0x00, 0x10
   40CF 04 08                 3     .db 0x04, 0x08
   40D1 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   40D3 01                    3     .db     0x01     ;; Hitpoints
                             14 
                             15 
   40D4                      16 DefineCubeLine1 cubeline10, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40D4                       1 cubeline10:
   0007                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0007                       1 cubeline10_dw:
   40D4 00 10                 2     .db 0x00, 0x10
   40D6 08 08                 3     .db 0x08, 0x08
   40D8 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   40DA 01                    3     .db     0x01     ;; Hitpoints
   40DB                      17 DefineCubeLine1 cubeline11, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40DB                       1 cubeline11:
   000E                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   000E                       1 cubeline11_dw:
   40DB 08 10                 2     .db 0x08, 0x10
   40DD 08 08                 3     .db 0x08, 0x08
   40DF 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   40E1 01                    3     .db     0x01     ;; Hitpoints
   40E2                      18 DefineCubeLine1 cubeline12, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40E2                       1 cubeline12:
   0015                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
   0015                       1 cubeline12_dw:
   40E2 10 10                 2     .db 0x10, 0x10
   40E4 08 08                 3     .db 0x08, 0x08
   40E6 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   40E8 01                    3     .db     0x01     ;; Hitpoints
   40E9                      19 DefineCubeLine1 cubeline13, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40E9                       1 cubeline13:
   001C                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   001C                       1 cubeline13_dw:
   40E9 18 10                 2     .db 0x18, 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
=======
   42A1 0F                    4     .db 0x0F
   42A2 01                    3     .db     0x01     ;; Hitpoints
   42A3                      20 DefineCubeLine1 cubeline15, 0x14, 0x10, 0x04, 0x08, 0xFF, 0x01
   42A3                       1 cubeline15:
   0024                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x10, 0x04, 0x08, 0xFF
   0024                       1 cubeline15_dw:
   42A3 14 10                 2     .db 0x14, 0x10
   42A5 04 08                 3     .db 0x04, 0x08
   42A7 FF                    4     .db 0xFF
   42A8 01                    3     .db     0x01     ;; Hitpoints
   42A9                      21 DefineCubeLine1 cubeline16, 0x18, 0x10, 0x04, 0x08, 0x0F, 0x01
   42A9                       1 cubeline16:
   002A                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x10, 0x04, 0x08, 0x0F
   002A                       1 cubeline16_dw:
   42A9 18 10                 2     .db 0x18, 0x10
   42AB 04 08                 3     .db 0x04, 0x08
   42AD 0F                    4     .db 0x0F
   42AE 01                    3     .db     0x01     ;; Hitpoints
   42AF                      22 DefineCubeLine1 cubeline17, 0x1C, 0x10, 0x04, 0x08, 0xFF, 0x01
   42AF                       1 cubeline17:
   0030                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x10, 0x04, 0x08, 0xFF
   0030                       1 cubeline17_dw:
   42AF 1C 10                 2     .db 0x1C, 0x10
   42B1 04 08                 3     .db 0x04, 0x08
   42B3 FF                    4     .db 0xFF
   42B4 01                    3     .db     0x01     ;; Hitpoints
   42B5                      23 DefineCubeLine1 cubeline18, 0x20, 0x10, 0x04, 0x08, 0x0F, 0x01
   42B5                       1 cubeline18:
   0036                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x10, 0x04, 0x08, 0x0F
   0036                       1 cubeline18_dw:
   42B5 20 10                 2     .db 0x20, 0x10
   42B7 04 08                 3     .db 0x04, 0x08
   42B9 0F                    4     .db 0x0F
   42BA 01                    3     .db     0x01     ;; Hitpoints
   42BB                      24 DefineCubeLine1 cubeline19, 0x24, 0x10, 0x04, 0x08, 0xFF, 0x01
   42BB                       1 cubeline19:
   003C                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x10, 0x04, 0x08, 0xFF
   003C                       1 cubeline19_dw:
   42BB 24 10                 2     .db 0x24, 0x10
   42BD 04 08                 3     .db 0x04, 0x08
   42BF FF                    4     .db 0xFF
   42C0 01                    3     .db     0x01     ;; Hitpoints
   42C1                      25 DefineCubeLine1 cubeline110, 0x28, 0x10, 0x04, 0x08, 0x0F, 0x01
   42C1                       1 cubeline110:
   0042                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x10, 0x04, 0x08, 0x0F
   0042                       1 cubeline110_dw:
   42C1 28 10                 2     .db 0x28, 0x10
   42C3 04 08                 3     .db 0x04, 0x08
   42C5 0F                    4     .db 0x0F
   42C6 01                    3     .db     0x01     ;; Hitpoints
   42C7                      26 DefineCubeLine1 cubeline111, 0x2C, 0x10, 0x04, 0x08, 0xFF, 0x01
   42C7                       1 cubeline111:
   0048                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x10, 0x04, 0x08, 0xFF
   0048                       1 cubeline111_dw:
   42C7 2C 10                 2     .db 0x2C, 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
   40EB 08 08                 3     .db 0x08, 0x08
   40ED 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   40EF 01                    3     .db     0x01     ;; Hitpoints
   40F0                      20 DefineCubeLine1 cubeline14, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40F0                       1 cubeline14:
   0023                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   0023                       1 cubeline14_dw:
   40F0 20 10                 2     .db 0x20, 0x10
   40F2 08 08                 3     .db 0x08, 0x08
   40F4 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   40F6 01                    3     .db     0x01     ;; Hitpoints
   40F7                      21 DefineCubeLine1 cubeline15, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40F7                       1 cubeline15:
   002A                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   002A                       1 cubeline15_dw:
   40F7 28 10                 2     .db 0x28, 0x10
   40F9 08 08                 3     .db 0x08, 0x08
   40FB 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   40FD 01                    3     .db     0x01     ;; Hitpoints
   40FE                      22 DefineCubeLine1 cubeline16, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40FE                       1 cubeline16:
   0031                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   0031                       1 cubeline16_dw:
   40FE 30 10                 2     .db 0x30, 0x10
   4100 08 08                 3     .db 0x08, 0x08
   4102 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
   4104 01                    3     .db     0x01     ;; Hitpoints
   4105                      23 DefineCubeLine1 cubeline17, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   4105                       1 cubeline17:
   0038                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   0038                       1 cubeline17_dw:
   4105 38 10                 2     .db 0x38, 0x10
   4107 08 08                 3     .db 0x08, 0x08
   4109 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   410B 01                    3     .db     0x01     ;; Hitpoints
   410C                      24 DefineCubeLine1 cubeline18, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   410C                       1 cubeline18:
   003F                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   003F                       1 cubeline18_dw:
   410C 40 10                 2     .db 0x40, 0x10
   410E 08 08                 3     .db 0x08, 0x08
   4110 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   4112 01                    3     .db     0x01     ;; Hitpoints
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
=======
   42C9 04 08                 3     .db 0x04, 0x08
   42CB FF                    4     .db 0xFF
   42CC 01                    3     .db     0x01     ;; Hitpoints
   42CD                      27 DefineCubeLine1 cubeline112, 0x30, 0x10, 0x04, 0x08, 0x0F, 0x01
   42CD                       1 cubeline112:
   004E                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x10, 0x04, 0x08, 0x0F
   004E                       1 cubeline112_dw:
   42CD 30 10                 2     .db 0x30, 0x10
   42CF 04 08                 3     .db 0x04, 0x08
   42D1 0F                    4     .db 0x0F
   42D2 01                    3     .db     0x01     ;; Hitpoints
   42D3                      28 DefineCubeLine1 cubeline113, 0x34, 0x10, 0x04, 0x08, 0xFF, 0x01
   42D3                       1 cubeline113:
   0054                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x10, 0x04, 0x08, 0xFF
   0054                       1 cubeline113_dw:
   42D3 34 10                 2     .db 0x34, 0x10
   42D5 04 08                 3     .db 0x04, 0x08
   42D7 FF                    4     .db 0xFF
   42D8 01                    3     .db     0x01     ;; Hitpoints
   42D9                      29 DefineCubeLine1 cubeline114, 0x38, 0x10, 0x04, 0x08, 0x0F, 0x01
   42D9                       1 cubeline114:
   005A                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x10, 0x04, 0x08, 0x0F
   005A                       1 cubeline114_dw:
   42D9 38 10                 2     .db 0x38, 0x10
   42DB 04 08                 3     .db 0x04, 0x08
   42DD 0F                    4     .db 0x0F
   42DE 01                    3     .db     0x01     ;; Hitpoints
   42DF                      30 DefineCubeLine1 cubeline115, 0x3C, 0x10, 0x04, 0x08, 0xFF, 0x01
   42DF                       1 cubeline115:
   0060                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x10, 0x04, 0x08, 0xFF
   0060                       1 cubeline115_dw:
   42DF 3C 10                 2     .db 0x3C, 0x10
   42E1 04 08                 3     .db 0x04, 0x08
   42E3 FF                    4     .db 0xFF
   42E4 01                    3     .db     0x01     ;; Hitpoints
   42E5                      31 DefineCubeLine1 cubeline116, 0x40, 0x10, 0x04, 0x08, 0x0F, 0x01
   42E5                       1 cubeline116:
   0066                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x10, 0x04, 0x08, 0x0F
   0066                       1 cubeline116_dw:
   42E5 40 10                 2     .db 0x40, 0x10
   42E7 04 08                 3     .db 0x04, 0x08
   42E9 0F                    4     .db 0x0F
   42EA 01                    3     .db     0x01     ;; Hitpoints
   42EB                      32 DefineCubeLine1 cubeline117, 0x44, 0x10, 0x04, 0x08, 0xFF, 0x01
   42EB                       1 cubeline117:
   006C                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x10, 0x04, 0x08, 0xFF
   006C                       1 cubeline117_dw:
   42EB 44 10                 2     .db 0x44, 0x10
   42ED 04 08                 3     .db 0x04, 0x08
   42EF FF                    4     .db 0xFF
   42F0 01                    3     .db     0x01     ;; Hitpoints
   42F1                      33 DefineCubeLine1 cubeline118, 0x48, 0x10, 0x04, 0x08, 0x0F, 0x01
   42F1                       1 cubeline118:
   0072                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x10, 0x04, 0x08, 0x0F
   0072                       1 cubeline118_dw:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
   4113                      25 DefineCubeLine1 cubeline19, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   4113                       1 cubeline19:
   0046                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   0046                       1 cubeline19_dw:
   4113 48 10                 2     .db 0x48, 0x10
   4115 08 08                 3     .db 0x08, 0x08
   4117 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   4119 01                    3     .db     0x01     ;; Hitpoints
                             26 
                             27 
   411A 0A                   28 m_num_cube: .db 10
                             29 
   411B                      30 cube_clear:
   411B DD 21 D4 40   [14]   31 ld ix,#cubeline10
   411F CD AC 41      [17]   32 call cube_clearAll
   4122 DD 21 DB 40   [14]   33 ld ix,#cubeline11
   4126 CD AC 41      [17]   34 call cube_clearAll
   4129 DD 21 E2 40   [14]   35 ld ix,#cubeline12
   412D CD AC 41      [17]   36 call cube_clearAll
   4130 DD 21 E9 40   [14]   37 ld ix,#cubeline13
   4134 CD AC 41      [17]   38 call cube_clearAll
   4137 DD 21 F0 40   [14]   39 ld ix,#cubeline14
   413B CD AC 41      [17]   40 call cube_clearAll
   413E DD 21 F7 40   [14]   41 ld ix,#cubeline15
   4142 CD AC 41      [17]   42 call cube_clearAll
   4145 DD 21 FE 40   [14]   43 ld ix,#cubeline16
   4149 CD AC 41      [17]   44 call cube_clearAll
   414C DD 21 05 41   [14]   45 ld ix,#cubeline17
   4150 CD AC 41      [17]   46 call cube_clearAll
   4153 DD 21 0C 41   [14]   47 ld ix,#cubeline18
   4157 CD AC 41      [17]   48 call cube_clearAll
   415A DD 21 13 41   [14]   49 ld ix,#cubeline19
   415E CD AC 41      [17]   50 call cube_clearAll
   4161 C9            [10]   51 ret
                             52 
   4162                      53 cube_draw:
   4162 DD 21 D4 40   [14]   54 ld ix,#cubeline10
   4166 CD A9 41      [17]   55 call cube_drawAll
   4169 DD 21 DB 40   [14]   56 ld ix,#cubeline11
   416D CD A9 41      [17]   57 call cube_drawAll
   4170 DD 21 E2 40   [14]   58 ld ix,#cubeline12
   4174 CD A9 41      [17]   59 call cube_drawAll
   4177 DD 21 E9 40   [14]   60 ld ix,#cubeline13
   417B CD A9 41      [17]   61 call cube_drawAll
   417E DD 21 F0 40   [14]   62 ld ix,#cubeline14
   4182 CD A9 41      [17]   63 call cube_drawAll
   4185 DD 21 F7 40   [14]   64 ld ix,#cubeline15
   4189 CD A9 41      [17]   65 call cube_drawAll
   418C DD 21 FE 40   [14]   66 ld ix,#cubeline16
   4190 CD A9 41      [17]   67 call cube_drawAll
   4193 DD 21 05 41   [14]   68 ld ix,#cubeline17
   4197 CD A9 41      [17]   69 call cube_drawAll
   419A DD 21 0C 41   [14]   70 ld ix,#cubeline18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
=======
   42F1 48 10                 2     .db 0x48, 0x10
   42F3 04 08                 3     .db 0x04, 0x08
   42F5 0F                    4     .db 0x0F
   42F6 01                    3     .db     0x01     ;; Hitpoints
   42F7                      34 DefineCubeLine1 cubeline119, 0x4C, 0x10, 0x04, 0x08, 0xFF, 0x01
   42F7                       1 cubeline119:
   0078                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x10, 0x04, 0x08, 0xFF
   0078                       1 cubeline119_dw:
   42F7 4C 10                 2     .db 0x4C, 0x10
   42F9 04 08                 3     .db 0x04, 0x08
   42FB FF                    4     .db 0xFF
   42FC 01                    3     .db     0x01     ;; Hitpoints
                             35 
                             36 
   42FD 14                   37 m_num_cube: .db 20
                             38 
   42FE                      39 cube_clear:
   42FE DD 21 85 42   [14]   40 ld ix,#cubeline10
   4302 CD 1B 44      [17]   41 call cube_clearAll
   4305 DD 21 8B 42   [14]   42 ld ix,#cubeline11
   4309 CD 1B 44      [17]   43 call cube_clearAll
   430C DD 21 91 42   [14]   44 ld ix,#cubeline12
   4310 CD 1B 44      [17]   45 call cube_clearAll
   4313 DD 21 97 42   [14]   46 ld ix,#cubeline13
   4317 CD 1B 44      [17]   47 call cube_clearAll
   431A DD 21 9D 42   [14]   48 ld ix,#cubeline14
   431E CD 1B 44      [17]   49 call cube_clearAll
   4321 DD 21 A3 42   [14]   50 ld ix,#cubeline15
   4325 CD 1B 44      [17]   51 call cube_clearAll
   4328 DD 21 A9 42   [14]   52 ld ix,#cubeline16
   432C CD 1B 44      [17]   53 call cube_clearAll
   432F DD 21 AF 42   [14]   54 ld ix,#cubeline17
   4333 CD 1B 44      [17]   55 call cube_clearAll
   4336 DD 21 B5 42   [14]   56 ld ix,#cubeline18
   433A CD 1B 44      [17]   57 call cube_clearAll
   433D DD 21 BB 42   [14]   58 ld ix,#cubeline19
   4341 CD 1B 44      [17]   59 call cube_clearAll
   4344 DD 21 C1 42   [14]   60 ld ix,#cubeline110
   4348 CD 1B 44      [17]   61 call cube_clearAll
   434B DD 21 C7 42   [14]   62 ld ix,#cubeline111
   434F CD 1B 44      [17]   63 call cube_clearAll
   4352 DD 21 CD 42   [14]   64 ld ix,#cubeline112
   4356 CD 1B 44      [17]   65 call cube_clearAll
   4359 DD 21 D3 42   [14]   66 ld ix,#cubeline113
   435D CD 1B 44      [17]   67 call cube_clearAll
   4360 DD 21 D9 42   [14]   68 ld ix,#cubeline114
   4364 CD 1B 44      [17]   69 call cube_clearAll
   4367 DD 21 DF 42   [14]   70 ld ix,#cubeline115
   436B CD 1B 44      [17]   71 call cube_clearAll
   436E DD 21 E5 42   [14]   72 ld ix,#cubeline116
   4372 CD 1B 44      [17]   73 call cube_clearAll
   4375 DD 21 EB 42   [14]   74 ld ix,#cubeline117
   4379 CD 1B 44      [17]   75 call cube_clearAll
   437C DD 21 F1 42   [14]   76 ld ix,#cubeline118
   4380 CD 1B 44      [17]   77 call cube_clearAll
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
   419E CD A9 41      [17]   71 call cube_drawAll
   41A1 DD 21 13 41   [14]   72 ld ix,#cubeline19
   41A5 CD A9 41      [17]   73 call cube_drawAll
   41A8 C9            [10]   74 ret
                             75 
                             76 
                             77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             78 ;; DRAW ENTITY
                             79 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                             80 ;; INPUT: IX -> Points to entity
                             81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41A9                      82 cube_drawAll:
   41A9 C3 D6 43      [10]   83     jp render_drawCube
                             84    
                             85    
                             86 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             87 ;; BORRA UNA ENTIDAD
                             88 ;; PARA CUADRADOS UNICAMENTE
                             89 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                             90 ;; ENTRADA: IX -> Puntero a entidad
                             91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41AC                      92 cube_clearAll:
                             93 
                             94 ;;   ld  a, dc_col(ix)
                             95 ;;   ex af, af'
                             96 ;;
                             97 ;;   ld  dc_col(ix), #0
                             98 ;;
                             99 ;;   call render_drawCube
                            100 ;;   ex af, af'
                            101 ;;   ld dc_col(ix), a
                            102 
   41AC C9            [10]  103    ret
                            104 
                            105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            106 ;;
                            107 ;;RESET CUBES TO FIRST STATE
                            108 ;;
                            109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   41AD                     110 cube_reset:
                            111 
   41AD CD 5E 43      [17]  112 	call ball_reset
                            113 
   41B0 21 D4 40      [10]  114 	ld hl, #cubeline10
   41B3 1E 00         [ 7]  115 	ld e, #0
   41B5 16 00         [ 7]  116 	ld d, #0
   41B7 0E 00         [ 7]  117 	ld c, #0
   41B9 DD 21 CD 40   [14]  118 	ld ix, #cubedefault
   41BD                     119 	bucl:
                            120 
   41BD 7A            [ 4]  121 	ld a,d 
                            122 
   41BE 77            [ 7]  123 	ld (hl),a
                            124 
   41BF C6 04         [ 7]  125 	add #4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
=======
   4383 DD 21 F7 42   [14]   78 ld ix,#cubeline119
   4387 CD 1B 44      [17]   79 call cube_clearAll
   438A C9            [10]   80 ret
                             81 
   438B                      82 cube_draw:
   438B DD 21 85 42   [14]   83 ld ix,#cubeline10
   438F CD 18 44      [17]   84 call cube_drawAll
   4392 DD 21 8B 42   [14]   85 ld ix,#cubeline11
   4396 CD 18 44      [17]   86 call cube_drawAll
   4399 DD 21 91 42   [14]   87 ld ix,#cubeline12
   439D CD 18 44      [17]   88 call cube_drawAll
   43A0 DD 21 97 42   [14]   89 ld ix,#cubeline13
   43A4 CD 18 44      [17]   90 call cube_drawAll
   43A7 DD 21 9D 42   [14]   91 ld ix,#cubeline14
   43AB CD 18 44      [17]   92 call cube_drawAll
   43AE DD 21 A3 42   [14]   93 ld ix,#cubeline15
   43B2 CD 18 44      [17]   94 call cube_drawAll
   43B5 DD 21 A9 42   [14]   95 ld ix,#cubeline16
   43B9 CD 18 44      [17]   96 call cube_drawAll
   43BC DD 21 AF 42   [14]   97 ld ix,#cubeline17
   43C0 CD 18 44      [17]   98 call cube_drawAll
   43C3 DD 21 B5 42   [14]   99 ld ix,#cubeline18
   43C7 CD 18 44      [17]  100 call cube_drawAll
   43CA DD 21 BB 42   [14]  101 ld ix,#cubeline19
   43CE CD 18 44      [17]  102 call cube_drawAll
   43D1 DD 21 C1 42   [14]  103 ld ix,#cubeline110
   43D5 CD 18 44      [17]  104 call cube_drawAll
   43D8 DD 21 C7 42   [14]  105 ld ix,#cubeline111
   43DC CD 18 44      [17]  106 call cube_drawAll
   43DF DD 21 CD 42   [14]  107 ld ix,#cubeline112
   43E3 CD 18 44      [17]  108 call cube_drawAll
   43E6 DD 21 D3 42   [14]  109 ld ix,#cubeline113
   43EA CD 18 44      [17]  110 call cube_drawAll
   43ED DD 21 D9 42   [14]  111 ld ix,#cubeline114
   43F1 CD 18 44      [17]  112 call cube_drawAll
   43F4 DD 21 DF 42   [14]  113 ld ix,#cubeline115
   43F8 CD 18 44      [17]  114 call cube_drawAll
   43FB DD 21 E5 42   [14]  115 ld ix,#cubeline116
   43FF CD 18 44      [17]  116 call cube_drawAll
   4402 DD 21 EB 42   [14]  117 ld ix,#cubeline117
   4406 CD 18 44      [17]  118 call cube_drawAll
   4409 DD 21 F1 42   [14]  119 ld ix,#cubeline118
   440D CD 18 44      [17]  120 call cube_drawAll
   4410 DD 21 F7 42   [14]  121 ld ix,#cubeline119
   4414 CD 18 44      [17]  122 call cube_drawAll
   4417 C9            [10]  123 ret
                            124 
                            125 
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            127 ;; DRAW ENTITY
                            128 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            129 ;; INPUT: IX -> Points to entity
                            130 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4418                     131 cube_drawAll:
   4418 C3 5A 40      [10]  132     jp render_drawCube
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
                            126 
   41C1 57            [ 4]  127 	ld d,a
   41C2 23            [ 6]  128 	inc hl
                            129 
                            130 
   41C3 DD 7E 01      [19]  131 	ld a, dc_y(ix)
   41C6 77            [ 7]  132 	ld (hl),a
                            133 	
   41C7 23            [ 6]  134     	inc hl
                            135 
                            136 
   41C8 DD 7E 02      [19]  137     	ld a, dc_w(ix)
   41CB 77            [ 7]  138 	ld (hl),a
   41CC 23            [ 6]  139     	inc hl
                            140 
                            141 
   41CD DD 7E 03      [19]  142     	ld a, dc_h(ix)
   41D0 77            [ 7]  143 	ld (hl),a
   41D1 23            [ 6]  144     	inc hl
                            145     	
   41D2 79            [ 4]  146     	ld a,c
   41D3 D6 01         [ 7]  147     	sub #1
                            148 
   41D5 CA E1 41      [10]  149     	jp z, rojo
                            150 
   41D8 C6 02         [ 7]  151     	add #2
   41DA 4F            [ 4]  152     	ld c,a
   41DB 3E 0F         [ 7]  153 	ld a, #15
                            154 
   41DD 77            [ 7]  155     	ld (hl),a
                            156 
   41DE C3 E8 41      [10]  157     	jp colorok
   41E1                     158     	rojo:
   41E1 4F            [ 4]  159     	ld c,a
                            160     	
   41E2 3E FF         [ 7]  161     	ld a, #255
                            162 
   41E4 77            [ 7]  163     	ld (hl),a
                            164 
   41E5 C3 E8 41      [10]  165     	jp colorok
                            166   	
   41E8                     167 	colorok:
                            168 
   41E8 23            [ 6]  169     	inc hl
                            170 
                            171     	;;hp
   41E9 23            [ 6]  172     	inc hl
                            173 
   41EA 7B            [ 4]  174   	ld a,e
   41EB C6 01         [ 7]  175   	add #1
                            176 
   41ED 5F            [ 4]  177   	ld e,a
                            178 
   41EE D6 0A         [ 7]  179   	sub #k_max_cube_line
                            180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
=======
                            133    
                            134    
                            135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            136 ;; BORRA UNA ENTIDAD
                            137 ;; PARA CUADRADOS UNICAMENTE
                            138 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            139 ;; ENTRADA: IX -> Puntero a entidad
                            140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   441B                     141 cube_clearAll:
                            142 
   441B DD 7E 04      [19]  143    ld  a, dc_col(ix)
   441E 08            [ 4]  144    ex af, af'
                            145 
   441F DD 36 04 00   [19]  146    ld  dc_col(ix), #0
                            147 
   4423 CD 5A 40      [17]  148    call render_drawCube
   4426 08            [ 4]  149    ex af, af'
   4427 DD 77 04      [19]  150    ld dc_col(ix), a
                            151 
   442A C9            [10]  152    ret
                            153 
                            154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            155 ;;
                            156 ;;RESET CUBES TO FIRST STATE
                            157 ;;
                            158 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   442B                     159 cube_reset:
                            160 
   442B CD 3A 42      [17]  161 	call ball_reset
                            162 
   442E 21 85 42      [10]  163 	ld hl, #cubeline10
   4431 1E 00         [ 7]  164 	ld e, #0
   4433 16 00         [ 7]  165 	ld d, #0
   4435 0E 00         [ 7]  166 	ld c, #0
   4437 DD 21 7F 42   [14]  167 	ld ix, #cubedefault
   443B                     168 	bucl:
                            169 
   443B 7A            [ 4]  170 	ld a,d 
                            171 
   443C 77            [ 7]  172 	ld (hl),a
                            173 
   443D C6 04         [ 7]  174 	add #4
                            175 
   443F 57            [ 4]  176 	ld d,a
   4440 23            [ 6]  177 	inc hl
                            178 
                            179 
   4441 DD 7E 01      [19]  180 	ld a, dc_y(ix)
   4444 77            [ 7]  181 	ld (hl),a
                            182 	
   4445 23            [ 6]  183     	inc hl
                            184 
                            185 
   4446 DD 7E 02      [19]  186     	ld a, dc_w(ix)
   4449 77            [ 7]  187 	ld (hl),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
Hexadecimal [16-Bits]



<<<<<<< HEAD
   41F0 20 CB         [12]  181     	jr nz, bucl
                            182 
                            183     	
                            184 
   41F2 C9            [10]  185  ret
                            186 
   41F3                     187 destroy_cube:
   41F3 36 FF         [10]  188 	ld (hl),#0xFF
   41F5 23            [ 6]  189 	inc hl			;;	Y		
   41F6 23            [ 6]  190 	inc hl			;;	W
   41F7 23            [ 6]  191 	inc hl			;;	H
   41F8 23            [ 6]  192 	inc hl			;;	SP_L
   41F9 23            [ 6]  193 	inc hl			;;	SP_H
   41FA 23            [ 6]  194 	inc hl			;;  HP
                            195 
   41FB 36 00         [10]  196 	ld (hl),#0
                            197 
   41FD 2B            [ 6]  198 	dec hl			;; SP_H
   41FE 2B            [ 6]  199 	dec hl			;; SP_L
   41FF 2B            [ 6]  200 	dec hl			;; H 
   4200 2B            [ 6]  201 	dec hl			;; W
   4201 2B            [ 6]  202 	dec hl			;; Y
   4202 2B            [ 6]  203 	dec hl			;; X
                            204 
   4203 3A 1A 41      [13]  205 	ld a, (m_num_cube)
   4206 D6 01         [ 7]  206 	sub #1
   4208 32 1A 41      [13]  207 	ld (m_num_cube),a
                            208 
   420B CA AD 41      [10]  209 	jp z, cube_reset
                            210 
   420E C9            [10]  211 ret
                            212 
=======
   444A 23            [ 6]  188     	inc hl
                            189 
                            190 
   444B DD 7E 03      [19]  191     	ld a, dc_h(ix)
   444E 77            [ 7]  192 	ld (hl),a
   444F 23            [ 6]  193     	inc hl
                            194     	
   4450 79            [ 4]  195     	ld a,c
   4451 D6 01         [ 7]  196     	sub #1
                            197 
   4453 CA 5F 44      [10]  198     	jp z, rojo
                            199 
   4456 C6 02         [ 7]  200     	add #2
   4458 4F            [ 4]  201     	ld c,a
   4459 3E 0F         [ 7]  202 	ld a, #15
                            203 
   445B 77            [ 7]  204     	ld (hl),a
                            205 
   445C C3 66 44      [10]  206     	jp colorok
   445F                     207     	rojo:
   445F 4F            [ 4]  208     	ld c,a
                            209     	
   4460 3E FF         [ 7]  210     	ld a, #255
                            211 
   4462 77            [ 7]  212     	ld (hl),a
                            213 
   4463 C3 66 44      [10]  214     	jp colorok
                            215   	
   4466                     216 	colorok:
                            217 
   4466 23            [ 6]  218     	inc hl
                            219 
                            220     	;;hp
   4467 23            [ 6]  221     	inc hl
                            222 
   4468 7B            [ 4]  223   	ld a,e
   4469 C6 01         [ 7]  224   	add #1
                            225 
   446B 5F            [ 4]  226   	ld e,a
                            227 
   446C D6 14         [ 7]  228   	sub #k_max_cube_line
                            229 
   446E 20 CB         [12]  230     	jr nz, bucl
                            231 
                            232     	
                            233 
   4470 C9            [10]  234  ret
                            235 
   4471                     236 destroy_cube:
   4471 36 FF         [10]  237 	ld (hl),#0xFF
   4473 23            [ 6]  238 	inc hl
   4474 23            [ 6]  239 	inc hl
   4475 23            [ 6]  240 	inc hl
   4476 23            [ 6]  241 	inc hl
                            242 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   4477 36 00         [10]  243 	ld (hl),#0x00
                            244 
   4479 2B            [ 6]  245 	dec hl
   447A 2B            [ 6]  246 	dec hl
   447B 2B            [ 6]  247 	dec hl
   447C 2B            [ 6]  248 	dec hl
                            249 
   447D 3A FD 42      [13]  250 	ld a, (m_num_cube)
   4480 D6 01         [ 7]  251 	sub #1
   4482 32 FD 42      [13]  252 	ld (m_num_cube),a
                            253 
   4485 CA 2B 44      [10]  254 	jp z, cube_reset
                            255 
   4488 C9            [10]  256 ret
                            257 
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
