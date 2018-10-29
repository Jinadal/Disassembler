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
                             35 .globl cube_loses_life
                             36 .globl cube_reset
                             37 
                             38 .globl destroy_cube
                             39 
                             40 .globl k_cube_size
                             41 .globl k_max_cube_line	
                             42 
                             43 .globl cubeline10
                             44 .globl cubeline11
                             45 .globl cubeline12
                             46 .globl cubeline13
                             47 .globl cubeline14
                             48 .globl cubeline15
                             49 .globl cubeline16
                             50 .globl cubeline17
                             51 .globl cubeline18
                             52 .globl cubeline19
                             53 
                             54 .globl cubeline20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl cubeline21
                             56 .globl cubeline22
                             57 .globl cubeline23
                             58 .globl cubeline24
                             59 .globl cubeline25
                             60 .globl cubeline26
                             61 .globl cubeline27
                             62 .globl cubeline28
                             63 .globl cubeline29
                             64 
                             65 .globl cubeline30
                             66 .globl cubeline31
                             67 .globl cubeline32
                             68 .globl cubeline33
                             69 .globl cubeline34
                             70 .globl cubeline35
                             71 .globl cubeline36
                             72 .globl cubeline37
                             73 .globl cubeline38
                             74 .globl cubeline39
                             75 
                             76 .globl cubeline40
                             77 .globl cubeline41
                             78 .globl cubeline42
                             79 .globl cubeline43
                             80 .globl cubeline44
                             81 .globl cubeline45
                             82 .globl cubeline46
                             83 .globl cubeline47
                             84 .globl cubeline48
                             85 .globl cubeline49
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              3 .include "render.h.s"
                              1 
                              2 
                              3 ;;Drawable Entity
                              4 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
                              5 _name:
                              6     .db _x, _y
                              7     .db _w, _h
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
                             20 .globl m_back_buffer
                             21 .globl m_front_buffer
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
                             19    .macro DefineBall _name, _x, _y, _w, _h, _sprite,  _vx, _vy,_upd,_hp
                             20 _name: 
                             21 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _sprite
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
                     0006    34 bl_vx = 6
                     0007    35 bl_vy = 7
                     0008    36 bl_up_l = 8
                     0009    37 bl_up_h = 9
                     000A    38 bl_hp = 10
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
                             49 ;.globl screenPointer
                             50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                              5 
                              6 .globl _cubeline_sp
                              7 .globl _cubeline2_sp
                              8 .globl _cubeline3_sp
                              9 
                     0028    10 k_max_cube_line = 40
                     0007    11 k_cube_size = 7
                             12 
                             13 
   416A                      14 DefineCubeLine1 cubedefault, 0x00, 0x28, 0x04, 0x08, _cubeline_sp, 0x01
   416A                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x28, 0x04, 0x08, _cubeline_sp
   0000                       1 cubedefault_dw:
   416A 00 28                 2     .db 0x00, 0x28
   416C 04 08                 3     .db 0x04, 0x08
   416E C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   4170 01                    3     .db     0x01     ;; Hitpoints
   4171                      15 DefineCubeLine1 cubedefault1, 0x00, 0x18, 0x04, 0x08, _cubeline_sp, 0x01
   4171                       1 cubedefault1:
   0007                       2     DefineDrawableEntity cubedefault1_dw, 0x00, 0x18, 0x04, 0x08, _cubeline_sp
   0007                       1 cubedefault1_dw:
   4171 00 18                 2     .db 0x00, 0x18
   4173 04 08                 3     .db 0x04, 0x08
   4175 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault1_dw_size = . - cubedefault1_dw
   4177 01                    3     .db     0x01     ;; Hitpoints
   4178                      16 DefineCubeLine1 cubedefault2, 0x00, 0x10, 0x04, 0x08, _cubeline2_sp, 0x01
   4178                       1 cubedefault2:
   000E                       2     DefineDrawableEntity cubedefault2_dw, 0x00, 0x10, 0x04, 0x08, _cubeline2_sp
   000E                       1 cubedefault2_dw:
   4178 00 10                 2     .db 0x00, 0x10
   417A 04 08                 3     .db 0x04, 0x08
   417C 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubedefault2_dw_size = . - cubedefault2_dw
   417E 01                    3     .db     0x01     ;; Hitpoints
                             17 
                             18 
   417F                      19 DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   417F                       1 cubeline10:
   0015                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   0015                       1 cubeline10_dw:
   417F 00 08                 2     .db 0x00, 0x08
   4181 08 08                 3     .db 0x08, 0x08
   4183 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   4185 03                    3     .db     0x03     ;; Hitpoints
   4186                      20 DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4186                       1 cubeline11:
   001C                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x08, 0x08, 0x08, _cubeline3_sp
   001C                       1 cubeline11_dw:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   4186 08 08                 2     .db 0x08, 0x08
   4188 08 08                 3     .db 0x08, 0x08
   418A 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   418C 03                    3     .db     0x03     ;; Hitpoints
   418D                      21 DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   418D                       1 cubeline12:
   0023                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x08, 0x08, 0x08, _cubeline3_sp
   0023                       1 cubeline12_dw:
   418D 10 08                 2     .db 0x10, 0x08
   418F 08 08                 3     .db 0x08, 0x08
   4191 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   4193 03                    3     .db     0x03     ;; Hitpoints
   4194                      22 DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4194                       1 cubeline13:
   002A                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x08, 0x08, 0x08, _cubeline3_sp
   002A                       1 cubeline13_dw:
   4194 18 08                 2     .db 0x18, 0x08
   4196 08 08                 3     .db 0x08, 0x08
   4198 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   419A 03                    3     .db     0x03     ;; Hitpoints
   419B                      23 DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   419B                       1 cubeline14:
   0031                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x08, 0x08, 0x08, _cubeline3_sp
   0031                       1 cubeline14_dw:
   419B 20 08                 2     .db 0x20, 0x08
   419D 08 08                 3     .db 0x08, 0x08
   419F 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   41A1 03                    3     .db     0x03     ;; Hitpoints
   41A2                      24 DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   41A2                       1 cubeline15:
   0038                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x08, 0x08, 0x08, _cubeline3_sp
   0038                       1 cubeline15_dw:
   41A2 28 08                 2     .db 0x28, 0x08
   41A4 08 08                 3     .db 0x08, 0x08
   41A6 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   41A8 03                    3     .db     0x03     ;; Hitpoints
   41A9                      25 DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   41A9                       1 cubeline16:
   003F                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x08, 0x08, 0x08, _cubeline3_sp
   003F                       1 cubeline16_dw:
   41A9 30 08                 2     .db 0x30, 0x08
   41AB 08 08                 3     .db 0x08, 0x08
   41AD 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   41AF 03                    3     .db     0x03     ;; Hitpoints
   41B0                      26 DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   41B0                       1 cubeline17:
   0046                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x08, 0x08, 0x08, _cubeline3_sp
   0046                       1 cubeline17_dw:
   41B0 38 08                 2     .db 0x38, 0x08
   41B2 08 08                 3     .db 0x08, 0x08
   41B4 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   41B6 03                    3     .db     0x03     ;; Hitpoints
   41B7                      27 DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   41B7                       1 cubeline18:
   004D                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x08, 0x08, 0x08, _cubeline3_sp
   004D                       1 cubeline18_dw:
   41B7 40 08                 2     .db 0x40, 0x08
   41B9 08 08                 3     .db 0x08, 0x08
   41BB 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   41BD 03                    3     .db     0x03     ;; Hitpoints
   41BE                      28 DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   41BE                       1 cubeline19:
   0054                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x08, 0x08, 0x08, _cubeline3_sp
   0054                       1 cubeline19_dw:
   41BE 48 08                 2     .db 0x48, 0x08
   41C0 08 08                 3     .db 0x08, 0x08
   41C2 28 40                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   41C4 03                    3     .db     0x03     ;; Hitpoints
                             29 
   41C5                      30 DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41C5                       1 cubeline20:
   005B                       2     DefineDrawableEntity cubeline20_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   005B                       1 cubeline20_dw:
   41C5 00 10                 2     .db 0x00, 0x10
   41C7 08 08                 3     .db 0x08, 0x08
   41C9 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline20_dw_size = . - cubeline20_dw
   41CB 01                    3     .db     0x01     ;; Hitpoints
   41CC                      31 DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41CC                       1 cubeline21:
   0062                       2     DefineDrawableEntity cubeline21_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   0062                       1 cubeline21_dw:
   41CC 08 10                 2     .db 0x08, 0x10
   41CE 08 08                 3     .db 0x08, 0x08
   41D0 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline21_dw_size = . - cubeline21_dw
   41D2 01                    3     .db     0x01     ;; Hitpoints
   41D3                      32 DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41D3                       1 cubeline22:
   0069                       2     DefineDrawableEntity cubeline22_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   0069                       1 cubeline22_dw:
   41D3 10 10                 2     .db 0x10, 0x10
   41D5 08 08                 3     .db 0x08, 0x08
   41D7 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline22_dw_size = . - cubeline22_dw
   41D9 01                    3     .db     0x01     ;; Hitpoints
   41DA                      33 DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41DA                       1 cubeline23:
   0070                       2     DefineDrawableEntity cubeline23_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   0070                       1 cubeline23_dw:
   41DA 18 10                 2     .db 0x18, 0x10
   41DC 08 08                 3     .db 0x08, 0x08
   41DE C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline23_dw_size = . - cubeline23_dw
   41E0 01                    3     .db     0x01     ;; Hitpoints
   41E1                      34 DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41E1                       1 cubeline24:
   0077                       2     DefineDrawableEntity cubeline24_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   0077                       1 cubeline24_dw:
   41E1 20 10                 2     .db 0x20, 0x10
   41E3 08 08                 3     .db 0x08, 0x08
   41E5 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline24_dw_size = . - cubeline24_dw
   41E7 01                    3     .db     0x01     ;; Hitpoints
   41E8                      35 DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41E8                       1 cubeline25:
   007E                       2     DefineDrawableEntity cubeline25_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   007E                       1 cubeline25_dw:
   41E8 28 10                 2     .db 0x28, 0x10
   41EA 08 08                 3     .db 0x08, 0x08
   41EC C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline25_dw_size = . - cubeline25_dw
   41EE 01                    3     .db     0x01     ;; Hitpoints
   41EF                      36 DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41EF                       1 cubeline26:
   0085                       2     DefineDrawableEntity cubeline26_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   0085                       1 cubeline26_dw:
   41EF 30 10                 2     .db 0x30, 0x10
   41F1 08 08                 3     .db 0x08, 0x08
   41F3 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline26_dw_size = . - cubeline26_dw
   41F5 01                    3     .db     0x01     ;; Hitpoints
   41F6                      37 DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41F6                       1 cubeline27:
   008C                       2     DefineDrawableEntity cubeline27_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   008C                       1 cubeline27_dw:
   41F6 38 10                 2     .db 0x38, 0x10
   41F8 08 08                 3     .db 0x08, 0x08
   41FA C8 40                 4     .dw _cubeline_sp
                              5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                     0006     6 cubeline27_dw_size = . - cubeline27_dw
   41FC 01                    3     .db     0x01     ;; Hitpoints
   41FD                      38 DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   41FD                       1 cubeline28:
   0093                       2     DefineDrawableEntity cubeline28_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   0093                       1 cubeline28_dw:
   41FD 40 10                 2     .db 0x40, 0x10
   41FF 08 08                 3     .db 0x08, 0x08
   4201 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline28_dw_size = . - cubeline28_dw
   4203 01                    3     .db     0x01     ;; Hitpoints
   4204                      39 DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   4204                       1 cubeline29:
   009A                       2     DefineDrawableEntity cubeline29_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   009A                       1 cubeline29_dw:
   4204 48 10                 2     .db 0x48, 0x10
   4206 08 08                 3     .db 0x08, 0x08
   4208 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline29_dw_size = . - cubeline29_dw
   420A 01                    3     .db     0x01     ;; Hitpoints
                             40 
   420B                      41 DefineCubeLine1 cubeline30, 0x00, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   420B                       1 cubeline30:
   00A1                       2     DefineDrawableEntity cubeline30_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   00A1                       1 cubeline30_dw:
   420B 00 18                 2     .db 0x00, 0x18
   420D 08 08                 3     .db 0x08, 0x08
   420F C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline30_dw_size = . - cubeline30_dw
   4211 01                    3     .db     0x01     ;; Hitpoints
   4212                      42 DefineCubeLine1 cubeline31, 0x08, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4212                       1 cubeline31:
   00A8                       2     DefineDrawableEntity cubeline31_dw, 0x08, 0x18, 0x08, 0x08, _cubeline_sp
   00A8                       1 cubeline31_dw:
   4212 08 18                 2     .db 0x08, 0x18
   4214 08 08                 3     .db 0x08, 0x08
   4216 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline31_dw_size = . - cubeline31_dw
   4218 01                    3     .db     0x01     ;; Hitpoints
   4219                      43 DefineCubeLine1 cubeline32, 0x10, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4219                       1 cubeline32:
   00AF                       2     DefineDrawableEntity cubeline32_dw, 0x10, 0x18, 0x08, 0x08, _cubeline_sp
   00AF                       1 cubeline32_dw:
   4219 10 18                 2     .db 0x10, 0x18
   421B 08 08                 3     .db 0x08, 0x08
   421D C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline32_dw_size = . - cubeline32_dw
   421F 01                    3     .db     0x01     ;; Hitpoints
   4220                      44 DefineCubeLine1 cubeline33, 0x18, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4220                       1 cubeline33:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   00B6                       2     DefineDrawableEntity cubeline33_dw, 0x18, 0x18, 0x08, 0x08, _cubeline_sp
   00B6                       1 cubeline33_dw:
   4220 18 18                 2     .db 0x18, 0x18
   4222 08 08                 3     .db 0x08, 0x08
   4224 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline33_dw_size = . - cubeline33_dw
   4226 01                    3     .db     0x01     ;; Hitpoints
   4227                      45 DefineCubeLine1 cubeline34, 0x20, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4227                       1 cubeline34:
   00BD                       2     DefineDrawableEntity cubeline34_dw, 0x20, 0x18, 0x08, 0x08, _cubeline_sp
   00BD                       1 cubeline34_dw:
   4227 20 18                 2     .db 0x20, 0x18
   4229 08 08                 3     .db 0x08, 0x08
   422B C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline34_dw_size = . - cubeline34_dw
   422D 01                    3     .db     0x01     ;; Hitpoints
   422E                      46 DefineCubeLine1 cubeline35, 0x28, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   422E                       1 cubeline35:
   00C4                       2     DefineDrawableEntity cubeline35_dw, 0x28, 0x18, 0x08, 0x08, _cubeline_sp
   00C4                       1 cubeline35_dw:
   422E 28 18                 2     .db 0x28, 0x18
   4230 08 08                 3     .db 0x08, 0x08
   4232 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline35_dw_size = . - cubeline35_dw
   4234 01                    3     .db     0x01     ;; Hitpoints
   4235                      47 DefineCubeLine1 cubeline36, 0x30, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4235                       1 cubeline36:
   00CB                       2     DefineDrawableEntity cubeline36_dw, 0x30, 0x18, 0x08, 0x08, _cubeline_sp
   00CB                       1 cubeline36_dw:
   4235 30 18                 2     .db 0x30, 0x18
   4237 08 08                 3     .db 0x08, 0x08
   4239 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline36_dw_size = . - cubeline36_dw
   423B 01                    3     .db     0x01     ;; Hitpoints
   423C                      48 DefineCubeLine1 cubeline37, 0x38, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   423C                       1 cubeline37:
   00D2                       2     DefineDrawableEntity cubeline37_dw, 0x38, 0x18, 0x08, 0x08, _cubeline_sp
   00D2                       1 cubeline37_dw:
   423C 38 18                 2     .db 0x38, 0x18
   423E 08 08                 3     .db 0x08, 0x08
   4240 C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline37_dw_size = . - cubeline37_dw
   4242 01                    3     .db     0x01     ;; Hitpoints
   4243                      49 DefineCubeLine1 cubeline38, 0x40, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   4243                       1 cubeline38:
   00D9                       2     DefineDrawableEntity cubeline38_dw, 0x40, 0x18, 0x08, 0x08, _cubeline_sp
   00D9                       1 cubeline38_dw:
   4243 40 18                 2     .db 0x40, 0x18
   4245 08 08                 3     .db 0x08, 0x08
   4247 C8 40                 4     .dw _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                              5 
                     0006     6 cubeline38_dw_size = . - cubeline38_dw
   4249 01                    3     .db     0x01     ;; Hitpoints
   424A                      50 DefineCubeLine1 cubeline39, 0x48, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   424A                       1 cubeline39:
   00E0                       2     DefineDrawableEntity cubeline39_dw, 0x48, 0x18, 0x08, 0x08, _cubeline_sp
   00E0                       1 cubeline39_dw:
   424A 48 18                 2     .db 0x48, 0x18
   424C 08 08                 3     .db 0x08, 0x08
   424E C8 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline39_dw_size = . - cubeline39_dw
   4250 01                    3     .db     0x01     ;; Hitpoints
                             51 ;;
   4251                      52 DefineCubeLine1 cubeline40, 0x00, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4251                       1 cubeline40:
   00E7                       2     DefineDrawableEntity cubeline40_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   00E7                       1 cubeline40_dw:
   4251 00 20                 2     .db 0x00, 0x20
   4253 08 08                 3     .db 0x08, 0x08
   4255 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline40_dw_size = . - cubeline40_dw
   4257 02                    3     .db     0x02     ;; Hitpoints
   4258                      53 DefineCubeLine1 cubeline41, 0x08, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4258                       1 cubeline41:
   00EE                       2     DefineDrawableEntity cubeline41_dw, 0x08, 0x20, 0x08, 0x08, _cubeline2_sp
   00EE                       1 cubeline41_dw:
   4258 08 20                 2     .db 0x08, 0x20
   425A 08 08                 3     .db 0x08, 0x08
   425C 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline41_dw_size = . - cubeline41_dw
   425E 02                    3     .db     0x02     ;; Hitpoints
   425F                      54 DefineCubeLine1 cubeline42, 0x10, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   425F                       1 cubeline42:
   00F5                       2     DefineDrawableEntity cubeline42_dw, 0x10, 0x20, 0x08, 0x08, _cubeline2_sp
   00F5                       1 cubeline42_dw:
   425F 10 20                 2     .db 0x10, 0x20
   4261 08 08                 3     .db 0x08, 0x08
   4263 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline42_dw_size = . - cubeline42_dw
   4265 02                    3     .db     0x02     ;; Hitpoints
   4266                      55 DefineCubeLine1 cubeline43, 0x18, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4266                       1 cubeline43:
   00FC                       2     DefineDrawableEntity cubeline43_dw, 0x18, 0x20, 0x08, 0x08, _cubeline2_sp
   00FC                       1 cubeline43_dw:
   4266 18 20                 2     .db 0x18, 0x20
   4268 08 08                 3     .db 0x08, 0x08
   426A 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline43_dw_size = . - cubeline43_dw
   426C 02                    3     .db     0x02     ;; Hitpoints
   426D                      56 DefineCubeLine1 cubeline44, 0x20, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   426D                       1 cubeline44:
   0103                       2     DefineDrawableEntity cubeline44_dw, 0x20, 0x20, 0x08, 0x08, _cubeline2_sp
   0103                       1 cubeline44_dw:
   426D 20 20                 2     .db 0x20, 0x20
   426F 08 08                 3     .db 0x08, 0x08
   4271 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline44_dw_size = . - cubeline44_dw
   4273 02                    3     .db     0x02     ;; Hitpoints
   4274                      57 DefineCubeLine1 cubeline45, 0x28, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4274                       1 cubeline45:
   010A                       2     DefineDrawableEntity cubeline45_dw, 0x28, 0x20, 0x08, 0x08, _cubeline2_sp
   010A                       1 cubeline45_dw:
   4274 28 20                 2     .db 0x28, 0x20
   4276 08 08                 3     .db 0x08, 0x08
   4278 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline45_dw_size = . - cubeline45_dw
   427A 02                    3     .db     0x02     ;; Hitpoints
   427B                      58 DefineCubeLine1 cubeline46, 0x30, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   427B                       1 cubeline46:
   0111                       2     DefineDrawableEntity cubeline46_dw, 0x30, 0x20, 0x08, 0x08, _cubeline2_sp
   0111                       1 cubeline46_dw:
   427B 30 20                 2     .db 0x30, 0x20
   427D 08 08                 3     .db 0x08, 0x08
   427F 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline46_dw_size = . - cubeline46_dw
   4281 02                    3     .db     0x02     ;; Hitpoints
   4282                      59 DefineCubeLine1 cubeline47, 0x38, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4282                       1 cubeline47:
   0118                       2     DefineDrawableEntity cubeline47_dw, 0x38, 0x20, 0x08, 0x08, _cubeline2_sp
   0118                       1 cubeline47_dw:
   4282 38 20                 2     .db 0x38, 0x20
   4284 08 08                 3     .db 0x08, 0x08
   4286 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline47_dw_size = . - cubeline47_dw
   4288 02                    3     .db     0x02     ;; Hitpoints
   4289                      60 DefineCubeLine1 cubeline48, 0x40, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4289                       1 cubeline48:
   011F                       2     DefineDrawableEntity cubeline48_dw, 0x40, 0x20, 0x08, 0x08, _cubeline2_sp
   011F                       1 cubeline48_dw:
   4289 40 20                 2     .db 0x40, 0x20
   428B 08 08                 3     .db 0x08, 0x08
   428D 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline48_dw_size = . - cubeline48_dw
   428F 02                    3     .db     0x02     ;; Hitpoints
   4290                      61 DefineCubeLine1 cubeline49, 0x48, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   4290                       1 cubeline49:
   0126                       2     DefineDrawableEntity cubeline49_dw, 0x48, 0x20, 0x08, 0x08, _cubeline2_sp
   0126                       1 cubeline49_dw:
   4290 48 20                 2     .db 0x48, 0x20
   4292 08 08                 3     .db 0x08, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   4294 78 40                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline49_dw_size = . - cubeline49_dw
   4296 02                    3     .db     0x02     ;; Hitpoints
                             62 
                             63 
   4297 28                   64 m_num_cube: .db 40
                             65 
                             66 
   4298                      67 cube_clear:
                             68 
   4298 C9            [10]   69 ret
                             70 
   4299                      71 cube_draw:
   4299 DD 21 7F 41   [14]   72 ld ix,#cubeline10
   429D 3E 28         [ 7]   73 ld a,#k_max_cube_line
                             74 
   429F                      75 rep:
   429F F5            [11]   76 push af
   42A0 CD AE 42      [17]   77 call cube_drawAll
                             78 
   42A3 11 07 00      [10]   79 ld de,#k_cube_size
   42A6 DD 19         [15]   80 add ix, de
   42A8 F1            [10]   81 pop af
   42A9 3D            [ 4]   82 dec a
                             83 
   42AA C2 9F 42      [10]   84 jp nz,rep
                             85 
                             86 
   42AD C9            [10]   87 ret
                             88 
                             89 
                             90 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             91 ;; DRAW ENTITY
                             92 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                             93 ;; INPUT: IX -> Points to entity
                             94 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   42AE                      95 cube_drawAll:
                             96 
   42AE DD 7E 06      [19]   97 	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
   42B1 D6 01         [ 7]   98 	sub #1					;;
                             99 
   42B3 C2 BA 42      [10]  100 	jp nz, ommit
                            101 
   42B6 CD 31 45      [17]  102 	call render_drawCube
   42B9 C9            [10]  103 	ret
   42BA                     104 	ommit:					;;IF HP != 2 CHECK AGAIN
   42BA D6 01         [ 7]  105 	sub #1					;;
                            106 	
   42BC C2 C2 42      [10]  107 	jp nz, ommit2
                            108 
   42BF CD 31 45      [17]  109 	call render_drawCube
                            110 
   42C2                     111  	ommit2:					;;IF HP != 3 CHECK AGAIN
   42C2 D6 01         [ 7]  112 	sub #1					;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



                            113 	
   42C4 C2 CA 42      [10]  114 	jp nz, ommit3
                            115 
   42C7 CD 31 45      [17]  116 	call render_drawCube
                            117 
   42CA                     118  	ommit3:					;;HP == 0 ;NOT DRAW
   42CA C9            [10]  119 	ret
                            120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            121 ;; BORRA UNA ENTIDAD
                            122 ;; PARA CUADRADOS UNICAMENTE
                            123 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            124 ;; ENTRADA: IX -> Puntero a entidad
                            125 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   42CB                     126 cube_clearAll:
                            127 
                            128 ;;   ld  a, dc_col(ix)
                            129 ;;   ex af, af'
                            130 ;;
                            131 ;;   ld  dc_col(ix), #0
                            132 ;;
                            133 ;;   call render_drawCube
                            134 ;;   ex af, af'
                            135 ;;   ld dc_col(ix), a
                            136 
   42CB C9            [10]  137    ret
                            138 
                            139 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            140 ;;
                            141 ;;RESET CUBES TO FIRST STATE
                            142 ;;
                            143 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   42CC                     144 cube_reset:
                            145 
   42CC CD B9 44      [17]  146 	call ball_reset
                            147 
   42CF 21 7F 41      [10]  148 	ld hl, #cubeline10
   42D2 1E 00         [ 7]  149 	ld e, #0
   42D4 16 00         [ 7]  150 	ld d, #0
   42D6 0E 00         [ 7]  151 	ld c, #0
   42D8 DD 21 6A 41   [14]  152 	ld ix, #cubedefault
   42DC                     153 	bucl:
                            154 
   42DC 7A            [ 4]  155 	ld a,d 
                            156 
   42DD 77            [ 7]  157 	ld (hl),a
                            158 
   42DE C6 04         [ 7]  159 	add #4
                            160 
   42E0 57            [ 4]  161 	ld d,a
   42E1 23            [ 6]  162 	inc hl
                            163 
                            164 
   42E2 DD 7E 01      [19]  165 	ld a, dc_y(ix)
   42E5 77            [ 7]  166 	ld (hl),a
                            167 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   42E6 23            [ 6]  168     inc hl
                            169 
   42E7 DD 7E 02      [19]  170     ld a, dc_w(ix)
   42EA 77            [ 7]  171 	ld (hl),a
                            172     
   42EB 23            [ 6]  173 	inc hl
                            174 
   42EC DD 7E 03      [19]  175     ld a, dc_h(ix)
   42EF 77            [ 7]  176 	ld (hl),a
                            177     	
   42F0 23            [ 6]  178 	inc hl
                            179     	
   42F1 79            [ 4]  180     ld a,c
   42F2 D6 01         [ 7]  181     sub #1
                            182 
   42F4 CA 00 43      [10]  183     jp z, rojo
                            184 
   42F7 C6 02         [ 7]  185     add #2
   42F9 4F            [ 4]  186     ld c,a
                            187 	
   42FA 3E 0F         [ 7]  188 	ld a, #15
                            189 
   42FC 77            [ 7]  190     ld (hl),a
                            191 
   42FD C3 07 43      [10]  192     jp colorok
   4300                     193     rojo:
   4300 4F            [ 4]  194     	ld c,a
                            195     	
   4301 3E FF         [ 7]  196     	ld a, #255
                            197 
   4303 77            [ 7]  198     	ld (hl),a
                            199 
   4304 C3 07 43      [10]  200     	jp colorok
                            201   	
   4307                     202 	colorok:
                            203 
   4307 23            [ 6]  204     	inc hl
                            205 
                            206     	;;hp
   4308 23            [ 6]  207     	inc hl
                            208 
   4309 7B            [ 4]  209   	ld a,e
   430A C6 01         [ 7]  210   	add #1
                            211 
   430C 5F            [ 4]  212   	ld e,a
                            213 
   430D D6 28         [ 7]  214   	sub #k_max_cube_line
                            215 
   430F 20 CB         [12]  216     	jr nz, bucl
                            217 
                            218     	
                            219 
   4311 C9            [10]  220  ret
                            221 
                            222 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                            223 ;; CUBE LOOSES 1 LIFE
                            224 ;; REGISTERS DESTROYED: DE, AF
                            225 ;; INPUT: HL -> CUBE_X
                            226 ;; OUTPUT : HL -> CUBE_X
                            227 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4312                     228 cube_loses_life:
                            229 	
   4312 11 06 00      [10]  230 	ld de, #6			;;DE = 6
   4315 19            [11]  231 	add hl,de			;;HL + DE 
                            232 
   4316 7E            [ 7]  233 	ld a,(hl)			;;A = C_HP
   4317 D6 01         [ 7]  234 	sub #1				
   4319 77            [ 7]  235 	ld (hl),a			;;C_HP = C_HP - 1
                            236 
   431A CA 22 43      [10]  237 	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT
                            238 
   431D 11 FA FF      [10]  239 	ld de, #-6			;;IF NOT, HL -> DC_X
   4320 19            [11]  240 	add hl,de
                            241 
                            242 
   4321 C9            [10]  243 ret
                            244 
                            245 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            246 ;; CUBE GETS DESTROYED
                            247 ;; REGISTERS DESTROYED: DE, AF
                            248 ;; INPUT: HL -> CUBE_HP
                            249 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            250 
   4322                     251 destroy_cube:
   4322 11 FA FF      [10]  252 	ld de, #-6			;; 
   4325 19            [11]  253 	add hl,de			;; HL -> DC_X
   4326 36 FF         [10]  254 	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
   4328 23            [ 6]  255 	inc hl
   4329 36 FF         [10]  256 	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
   432B 2B            [ 6]  257 	dec hl				;; HL -> DC_X
                            258 
   432C 3A 97 42      [13]  259 	ld a, (m_num_cube)	;;
   432F D6 01         [ 7]  260 	sub #1				;;
   4331 32 97 42      [13]  261 	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1
                            262 
   4334 CA CC 42      [10]  263 	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL
                            264 
   4337 C9            [10]  265 ret
                            266 
