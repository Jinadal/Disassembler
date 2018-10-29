ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             21 .include "main.h.s"
                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 .globl cpct_disableFirmware_asm
                             21 .globl cpct_drawSolidBox_asm
                             22 .globl cpct_getScreenPtr_asm
                             23 .globl cpct_waitVSYNC_asm
                             24 .globl cpct_setVideoMode_asm
                             25 .globl cpct_scanKeyboard_asm
                             26 .globl cpct_isKeyPressed_asm
                             27 .globl cpct_setVideoMemoryPage_asm
                             28 .globl _cpct_memset_f64_asm
                             29 .globl cpct_drawSprite_asm
                             30 .globl cpct_setPalette_asm
                             31 .globl cpct_akp_musicInit_asm
                             32 .globl cpct_akp_musicPlay_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             22 .include "cube.h.s"
                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             21 ;;MACROS
                             22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             23 .macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
                             24 _name:
                             25     DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             26     .db     _hp     ;; Hitpoints
                             27 .endm
                     0000    28 c_de        = 0
                     0006    29 c_de_size   = 6
                     0006    30 c_hp        = 0 + c_de_size
                             31 ;;.macro DefineCubeLine1Default _name, _suf
                             32 ;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
                             33 ;;.endm
                             34 ;;.macro DefineNCubeLine1 _name, _n
                             35 
                             36 ;;    _s = 0
                             37 ;;    .rept _n
                             38 ;;        DefineCubeLine1Default _name, \_s
                             39 
                             40 ;;        _s = _s + 1
                             41 ;;    .endm
                             42 ;;.endm
                             43 
                             44 
                             45 
                             46 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             47 ;;OBJECTS CREATED WITH MACROS
                             48 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             49 .globl cube_clear
                             50 .globl cube_draw
                             51 .globl cube_drawAll
                             52 .globl cube_clearAll
                             53 .globl cube_loses_life
                             54 .globl cube_reset
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             55 
                             56 .globl destroy_cube
                             57 
                             58 .globl k_cube_size
                             59 .globl k_max_cube_line	
                             60 
                             61 .globl cubeline10
                             62 .globl cubeline11
                             63 .globl cubeline12
                             64 .globl cubeline13
                             65 .globl cubeline14
                             66 .globl cubeline15
                             67 .globl cubeline16
                             68 .globl cubeline17
                             69 .globl cubeline18
                             70 .globl cubeline19
                             71 
                             72 .globl cubeline20
                             73 .globl cubeline21
                             74 .globl cubeline22
                             75 .globl cubeline23
                             76 .globl cubeline24
                             77 .globl cubeline25
                             78 .globl cubeline26
                             79 .globl cubeline27
                             80 .globl cubeline28
                             81 .globl cubeline29
                             82 
                             83 .globl cubeline30
                             84 .globl cubeline31
                             85 .globl cubeline32
                             86 .globl cubeline33
                             87 .globl cubeline34
                             88 .globl cubeline35
                             89 .globl cubeline36
                             90 .globl cubeline37
                             91 .globl cubeline38
                             92 .globl cubeline39
                             93 
                             94 .globl cubeline40
                             95 .globl cubeline41
                             96 .globl cubeline42
                             97 .globl cubeline43
                             98 .globl cubeline44
                             99 .globl cubeline45
                            100 .globl cubeline46
                            101 .globl cubeline47
                            102 .globl cubeline48
                            103 .globl cubeline49
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             23 .include "render.h.s"
                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 
                             21 ;;Drawable Entity
                             22 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
                             23 _name:
                             24     .db _x, _y
                             25     .db _w, _h
                             26     .dw _sprite
                             27 
                             28 _name'_size = . - _name
                             29 .endm
                     0001    30 dc_x    = 0     dc_y    = 1
                     0003    31 dc_w    = 2     dc_h    = 3
                     0005    32 dc_sp_l  = 4    dc_sp_h  = 5
                             33 
                             34 .globl ren_clearBackBuffers
                             35 ;;.globl ren_switchBuffers
                             36 .globl render_drawCube
                             37 .globl ren_newScene
                             38 .globl m_back_buffer
                             39 .globl m_front_buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                             24 .include "ball.h.s"
                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 
                             21 
                             22 .globl ball_clear
                             23 .globl ball_draw
                             24 .globl ball_update
                             25 .globl ball_move
                             26 .globl ball_reset
                             27 
                             28 
                             29 
                             30 
                             31 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             32 ;;
                             33 ;;MACROS
                             34 ;;
                             35 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             36 
                             37    .macro DefineBall _name, _x, _y, _w, _h, _sprite,  _vx, _vy,_upd,_hp
                             38 _name: 
                             39 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _sprite
                             40   ; .db    _x, _y     ;; X, Y
                             41    ;.db    _w, _h     ;; W, H
                             42     ;.db   _col        ;; Color
                             43    .db   _vx, _vy    ;; VX, VY
                             44    .dw   _upd        ;; Update 
                             45    .db _hp
                             46 .endm
                             47 ;bl_x = 0
                             48 ;bl_y = 1
                             49 ;bl_w = 2
                             50 ;bl_h = 3
                             51 ;bl_col = 4
                     0006    52 bl_vx = 6
                     0007    53 bl_vy = 7
                     0008    54 bl_up_l = 8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                     0009    55 bl_up_h = 9
                     000A    56 bl_hp = 10
                             57 	
                             58 
                             59 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             60 ;;
                             61 ;;OBJETOS CREADOS CON LA MACROS
                             62 ;;
                             63 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             64 
                             65 .globl ball
                             66 .globl balldefault
                             67 ;.globl screenPointer
                             68 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             25 
                             26 .globl _cubeline_sp
                             27 .globl _cubeline2_sp
                             28 .globl _cubeline3_sp
                             29 
                     0028    30 k_max_cube_line = 40
                     0007    31 k_cube_size = 7
                             32 
                             33 
   0903                      34 DefineCubeLine1 cubedefault, 0x00, 0x28, 0x04, 0x08, _cubeline_sp, 0x01
   0903                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x28, 0x04, 0x08, _cubeline_sp
   0000                       1 cubedefault_dw:
   0903 00 28                 2     .db 0x00, 0x28
   0905 04 08                 3     .db 0x04, 0x08
   0907 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   0909 01                    3     .db     0x01     ;; Hitpoints
   090A                      35 DefineCubeLine1 cubedefault1, 0x00, 0x18, 0x04, 0x08, _cubeline_sp, 0x01
   090A                       1 cubedefault1:
   0007                       2     DefineDrawableEntity cubedefault1_dw, 0x00, 0x18, 0x04, 0x08, _cubeline_sp
   0007                       1 cubedefault1_dw:
   090A 00 18                 2     .db 0x00, 0x18
   090C 04 08                 3     .db 0x04, 0x08
   090E 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault1_dw_size = . - cubedefault1_dw
   0910 01                    3     .db     0x01     ;; Hitpoints
   0911                      36 DefineCubeLine1 cubedefault2, 0x00, 0x10, 0x04, 0x08, _cubeline2_sp, 0x01
   0911                       1 cubedefault2:
   000E                       2     DefineDrawableEntity cubedefault2_dw, 0x00, 0x10, 0x04, 0x08, _cubeline2_sp
   000E                       1 cubedefault2_dw:
   0911 00 10                 2     .db 0x00, 0x10
   0913 04 08                 3     .db 0x04, 0x08
   0915 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubedefault2_dw_size = . - cubedefault2_dw
   0917 01                    3     .db     0x01     ;; Hitpoints
                             37 
                             38 
   0918                      39 DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0918                       1 cubeline10:
   0015                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   0015                       1 cubeline10_dw:
   0918 00 08                 2     .db 0x00, 0x08
   091A 08 08                 3     .db 0x08, 0x08
   091C A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   091E 03                    3     .db     0x03     ;; Hitpoints
   091F                      40 DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   091F                       1 cubeline11:
   001C                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x08, 0x08, 0x08, _cubeline3_sp
   001C                       1 cubeline11_dw:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   091F 08 08                 2     .db 0x08, 0x08
   0921 08 08                 3     .db 0x08, 0x08
   0923 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   0925 03                    3     .db     0x03     ;; Hitpoints
   0926                      41 DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0926                       1 cubeline12:
   0023                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x08, 0x08, 0x08, _cubeline3_sp
   0023                       1 cubeline12_dw:
   0926 10 08                 2     .db 0x10, 0x08
   0928 08 08                 3     .db 0x08, 0x08
   092A A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   092C 03                    3     .db     0x03     ;; Hitpoints
   092D                      42 DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   092D                       1 cubeline13:
   002A                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x08, 0x08, 0x08, _cubeline3_sp
   002A                       1 cubeline13_dw:
   092D 18 08                 2     .db 0x18, 0x08
   092F 08 08                 3     .db 0x08, 0x08
   0931 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   0933 03                    3     .db     0x03     ;; Hitpoints
   0934                      43 DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0934                       1 cubeline14:
   0031                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x08, 0x08, 0x08, _cubeline3_sp
   0031                       1 cubeline14_dw:
   0934 20 08                 2     .db 0x20, 0x08
   0936 08 08                 3     .db 0x08, 0x08
   0938 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   093A 03                    3     .db     0x03     ;; Hitpoints
   093B                      44 DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   093B                       1 cubeline15:
   0038                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x08, 0x08, 0x08, _cubeline3_sp
   0038                       1 cubeline15_dw:
   093B 28 08                 2     .db 0x28, 0x08
   093D 08 08                 3     .db 0x08, 0x08
   093F A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   0941 03                    3     .db     0x03     ;; Hitpoints
   0942                      45 DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0942                       1 cubeline16:
   003F                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x08, 0x08, 0x08, _cubeline3_sp
   003F                       1 cubeline16_dw:
   0942 30 08                 2     .db 0x30, 0x08
   0944 08 08                 3     .db 0x08, 0x08
   0946 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   0948 03                    3     .db     0x03     ;; Hitpoints
   0949                      46 DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0949                       1 cubeline17:
   0046                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x08, 0x08, 0x08, _cubeline3_sp
   0046                       1 cubeline17_dw:
   0949 38 08                 2     .db 0x38, 0x08
   094B 08 08                 3     .db 0x08, 0x08
   094D A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   094F 03                    3     .db     0x03     ;; Hitpoints
   0950                      47 DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0950                       1 cubeline18:
   004D                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x08, 0x08, 0x08, _cubeline3_sp
   004D                       1 cubeline18_dw:
   0950 40 08                 2     .db 0x40, 0x08
   0952 08 08                 3     .db 0x08, 0x08
   0954 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   0956 03                    3     .db     0x03     ;; Hitpoints
   0957                      48 DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0957                       1 cubeline19:
   0054                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x08, 0x08, 0x08, _cubeline3_sp
   0054                       1 cubeline19_dw:
   0957 48 08                 2     .db 0x48, 0x08
   0959 08 08                 3     .db 0x08, 0x08
   095B A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   095D 03                    3     .db     0x03     ;; Hitpoints
                             49 
   095E                      50 DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   095E                       1 cubeline20:
   005B                       2     DefineDrawableEntity cubeline20_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   005B                       1 cubeline20_dw:
   095E 00 10                 2     .db 0x00, 0x10
   0960 08 08                 3     .db 0x08, 0x08
   0962 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline20_dw_size = . - cubeline20_dw
   0964 01                    3     .db     0x01     ;; Hitpoints
   0965                      51 DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0965                       1 cubeline21:
   0062                       2     DefineDrawableEntity cubeline21_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   0062                       1 cubeline21_dw:
   0965 08 10                 2     .db 0x08, 0x10
   0967 08 08                 3     .db 0x08, 0x08
   0969 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline21_dw_size = . - cubeline21_dw
   096B 01                    3     .db     0x01     ;; Hitpoints
   096C                      52 DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   096C                       1 cubeline22:
   0069                       2     DefineDrawableEntity cubeline22_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   0069                       1 cubeline22_dw:
   096C 10 10                 2     .db 0x10, 0x10
   096E 08 08                 3     .db 0x08, 0x08
   0970 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline22_dw_size = . - cubeline22_dw
   0972 01                    3     .db     0x01     ;; Hitpoints
   0973                      53 DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0973                       1 cubeline23:
   0070                       2     DefineDrawableEntity cubeline23_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   0070                       1 cubeline23_dw:
   0973 18 10                 2     .db 0x18, 0x10
   0975 08 08                 3     .db 0x08, 0x08
   0977 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline23_dw_size = . - cubeline23_dw
   0979 01                    3     .db     0x01     ;; Hitpoints
   097A                      54 DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   097A                       1 cubeline24:
   0077                       2     DefineDrawableEntity cubeline24_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   0077                       1 cubeline24_dw:
   097A 20 10                 2     .db 0x20, 0x10
   097C 08 08                 3     .db 0x08, 0x08
   097E 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline24_dw_size = . - cubeline24_dw
   0980 01                    3     .db     0x01     ;; Hitpoints
   0981                      55 DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0981                       1 cubeline25:
   007E                       2     DefineDrawableEntity cubeline25_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   007E                       1 cubeline25_dw:
   0981 28 10                 2     .db 0x28, 0x10
   0983 08 08                 3     .db 0x08, 0x08
   0985 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline25_dw_size = . - cubeline25_dw
   0987 01                    3     .db     0x01     ;; Hitpoints
   0988                      56 DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0988                       1 cubeline26:
   0085                       2     DefineDrawableEntity cubeline26_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   0085                       1 cubeline26_dw:
   0988 30 10                 2     .db 0x30, 0x10
   098A 08 08                 3     .db 0x08, 0x08
   098C 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline26_dw_size = . - cubeline26_dw
   098E 01                    3     .db     0x01     ;; Hitpoints
   098F                      57 DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   098F                       1 cubeline27:
   008C                       2     DefineDrawableEntity cubeline27_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   008C                       1 cubeline27_dw:
   098F 38 10                 2     .db 0x38, 0x10
   0991 08 08                 3     .db 0x08, 0x08
   0993 47 08                 4     .dw _cubeline_sp
                              5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                     0006     6 cubeline27_dw_size = . - cubeline27_dw
   0995 01                    3     .db     0x01     ;; Hitpoints
   0996                      58 DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0996                       1 cubeline28:
   0093                       2     DefineDrawableEntity cubeline28_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   0093                       1 cubeline28_dw:
   0996 40 10                 2     .db 0x40, 0x10
   0998 08 08                 3     .db 0x08, 0x08
   099A 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline28_dw_size = . - cubeline28_dw
   099C 01                    3     .db     0x01     ;; Hitpoints
   099D                      59 DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   099D                       1 cubeline29:
   009A                       2     DefineDrawableEntity cubeline29_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   009A                       1 cubeline29_dw:
   099D 48 10                 2     .db 0x48, 0x10
   099F 08 08                 3     .db 0x08, 0x08
   09A1 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline29_dw_size = . - cubeline29_dw
   09A3 01                    3     .db     0x01     ;; Hitpoints
                             60 
   09A4                      61 DefineCubeLine1 cubeline30, 0x00, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09A4                       1 cubeline30:
   00A1                       2     DefineDrawableEntity cubeline30_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   00A1                       1 cubeline30_dw:
   09A4 00 18                 2     .db 0x00, 0x18
   09A6 08 08                 3     .db 0x08, 0x08
   09A8 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline30_dw_size = . - cubeline30_dw
   09AA 01                    3     .db     0x01     ;; Hitpoints
   09AB                      62 DefineCubeLine1 cubeline31, 0x08, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09AB                       1 cubeline31:
   00A8                       2     DefineDrawableEntity cubeline31_dw, 0x08, 0x18, 0x08, 0x08, _cubeline_sp
   00A8                       1 cubeline31_dw:
   09AB 08 18                 2     .db 0x08, 0x18
   09AD 08 08                 3     .db 0x08, 0x08
   09AF 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline31_dw_size = . - cubeline31_dw
   09B1 01                    3     .db     0x01     ;; Hitpoints
   09B2                      63 DefineCubeLine1 cubeline32, 0x10, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09B2                       1 cubeline32:
   00AF                       2     DefineDrawableEntity cubeline32_dw, 0x10, 0x18, 0x08, 0x08, _cubeline_sp
   00AF                       1 cubeline32_dw:
   09B2 10 18                 2     .db 0x10, 0x18
   09B4 08 08                 3     .db 0x08, 0x08
   09B6 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline32_dw_size = . - cubeline32_dw
   09B8 01                    3     .db     0x01     ;; Hitpoints
   09B9                      64 DefineCubeLine1 cubeline33, 0x18, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09B9                       1 cubeline33:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   00B6                       2     DefineDrawableEntity cubeline33_dw, 0x18, 0x18, 0x08, 0x08, _cubeline_sp
   00B6                       1 cubeline33_dw:
   09B9 18 18                 2     .db 0x18, 0x18
   09BB 08 08                 3     .db 0x08, 0x08
   09BD 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline33_dw_size = . - cubeline33_dw
   09BF 01                    3     .db     0x01     ;; Hitpoints
   09C0                      65 DefineCubeLine1 cubeline34, 0x20, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09C0                       1 cubeline34:
   00BD                       2     DefineDrawableEntity cubeline34_dw, 0x20, 0x18, 0x08, 0x08, _cubeline_sp
   00BD                       1 cubeline34_dw:
   09C0 20 18                 2     .db 0x20, 0x18
   09C2 08 08                 3     .db 0x08, 0x08
   09C4 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline34_dw_size = . - cubeline34_dw
   09C6 01                    3     .db     0x01     ;; Hitpoints
   09C7                      66 DefineCubeLine1 cubeline35, 0x28, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09C7                       1 cubeline35:
   00C4                       2     DefineDrawableEntity cubeline35_dw, 0x28, 0x18, 0x08, 0x08, _cubeline_sp
   00C4                       1 cubeline35_dw:
   09C7 28 18                 2     .db 0x28, 0x18
   09C9 08 08                 3     .db 0x08, 0x08
   09CB 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline35_dw_size = . - cubeline35_dw
   09CD 01                    3     .db     0x01     ;; Hitpoints
   09CE                      67 DefineCubeLine1 cubeline36, 0x30, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09CE                       1 cubeline36:
   00CB                       2     DefineDrawableEntity cubeline36_dw, 0x30, 0x18, 0x08, 0x08, _cubeline_sp
   00CB                       1 cubeline36_dw:
   09CE 30 18                 2     .db 0x30, 0x18
   09D0 08 08                 3     .db 0x08, 0x08
   09D2 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline36_dw_size = . - cubeline36_dw
   09D4 01                    3     .db     0x01     ;; Hitpoints
   09D5                      68 DefineCubeLine1 cubeline37, 0x38, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09D5                       1 cubeline37:
   00D2                       2     DefineDrawableEntity cubeline37_dw, 0x38, 0x18, 0x08, 0x08, _cubeline_sp
   00D2                       1 cubeline37_dw:
   09D5 38 18                 2     .db 0x38, 0x18
   09D7 08 08                 3     .db 0x08, 0x08
   09D9 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline37_dw_size = . - cubeline37_dw
   09DB 01                    3     .db     0x01     ;; Hitpoints
   09DC                      69 DefineCubeLine1 cubeline38, 0x40, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09DC                       1 cubeline38:
   00D9                       2     DefineDrawableEntity cubeline38_dw, 0x40, 0x18, 0x08, 0x08, _cubeline_sp
   00D9                       1 cubeline38_dw:
   09DC 40 18                 2     .db 0x40, 0x18
   09DE 08 08                 3     .db 0x08, 0x08
   09E0 47 08                 4     .dw _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



                              5 
                     0006     6 cubeline38_dw_size = . - cubeline38_dw
   09E2 01                    3     .db     0x01     ;; Hitpoints
   09E3                      70 DefineCubeLine1 cubeline39, 0x48, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   09E3                       1 cubeline39:
   00E0                       2     DefineDrawableEntity cubeline39_dw, 0x48, 0x18, 0x08, 0x08, _cubeline_sp
   00E0                       1 cubeline39_dw:
   09E3 48 18                 2     .db 0x48, 0x18
   09E5 08 08                 3     .db 0x08, 0x08
   09E7 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline39_dw_size = . - cubeline39_dw
   09E9 01                    3     .db     0x01     ;; Hitpoints
                             71 ;;
   09EA                      72 DefineCubeLine1 cubeline40, 0x00, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   09EA                       1 cubeline40:
   00E7                       2     DefineDrawableEntity cubeline40_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   00E7                       1 cubeline40_dw:
   09EA 00 20                 2     .db 0x00, 0x20
   09EC 08 08                 3     .db 0x08, 0x08
   09EE F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline40_dw_size = . - cubeline40_dw
   09F0 02                    3     .db     0x02     ;; Hitpoints
   09F1                      73 DefineCubeLine1 cubeline41, 0x08, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   09F1                       1 cubeline41:
   00EE                       2     DefineDrawableEntity cubeline41_dw, 0x08, 0x20, 0x08, 0x08, _cubeline2_sp
   00EE                       1 cubeline41_dw:
   09F1 08 20                 2     .db 0x08, 0x20
   09F3 08 08                 3     .db 0x08, 0x08
   09F5 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline41_dw_size = . - cubeline41_dw
   09F7 02                    3     .db     0x02     ;; Hitpoints
   09F8                      74 DefineCubeLine1 cubeline42, 0x10, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   09F8                       1 cubeline42:
   00F5                       2     DefineDrawableEntity cubeline42_dw, 0x10, 0x20, 0x08, 0x08, _cubeline2_sp
   00F5                       1 cubeline42_dw:
   09F8 10 20                 2     .db 0x10, 0x20
   09FA 08 08                 3     .db 0x08, 0x08
   09FC F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline42_dw_size = . - cubeline42_dw
   09FE 02                    3     .db     0x02     ;; Hitpoints
   09FF                      75 DefineCubeLine1 cubeline43, 0x18, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   09FF                       1 cubeline43:
   00FC                       2     DefineDrawableEntity cubeline43_dw, 0x18, 0x20, 0x08, 0x08, _cubeline2_sp
   00FC                       1 cubeline43_dw:
   09FF 18 20                 2     .db 0x18, 0x20
   0A01 08 08                 3     .db 0x08, 0x08
   0A03 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline43_dw_size = . - cubeline43_dw
   0A05 02                    3     .db     0x02     ;; Hitpoints
   0A06                      76 DefineCubeLine1 cubeline44, 0x20, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   0A06                       1 cubeline44:
   0103                       2     DefineDrawableEntity cubeline44_dw, 0x20, 0x20, 0x08, 0x08, _cubeline2_sp
   0103                       1 cubeline44_dw:
   0A06 20 20                 2     .db 0x20, 0x20
   0A08 08 08                 3     .db 0x08, 0x08
   0A0A F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline44_dw_size = . - cubeline44_dw
   0A0C 02                    3     .db     0x02     ;; Hitpoints
   0A0D                      77 DefineCubeLine1 cubeline45, 0x28, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0A0D                       1 cubeline45:
   010A                       2     DefineDrawableEntity cubeline45_dw, 0x28, 0x20, 0x08, 0x08, _cubeline2_sp
   010A                       1 cubeline45_dw:
   0A0D 28 20                 2     .db 0x28, 0x20
   0A0F 08 08                 3     .db 0x08, 0x08
   0A11 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline45_dw_size = . - cubeline45_dw
   0A13 02                    3     .db     0x02     ;; Hitpoints
   0A14                      78 DefineCubeLine1 cubeline46, 0x30, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0A14                       1 cubeline46:
   0111                       2     DefineDrawableEntity cubeline46_dw, 0x30, 0x20, 0x08, 0x08, _cubeline2_sp
   0111                       1 cubeline46_dw:
   0A14 30 20                 2     .db 0x30, 0x20
   0A16 08 08                 3     .db 0x08, 0x08
   0A18 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline46_dw_size = . - cubeline46_dw
   0A1A 02                    3     .db     0x02     ;; Hitpoints
   0A1B                      79 DefineCubeLine1 cubeline47, 0x38, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0A1B                       1 cubeline47:
   0118                       2     DefineDrawableEntity cubeline47_dw, 0x38, 0x20, 0x08, 0x08, _cubeline2_sp
   0118                       1 cubeline47_dw:
   0A1B 38 20                 2     .db 0x38, 0x20
   0A1D 08 08                 3     .db 0x08, 0x08
   0A1F F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline47_dw_size = . - cubeline47_dw
   0A21 02                    3     .db     0x02     ;; Hitpoints
   0A22                      80 DefineCubeLine1 cubeline48, 0x40, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0A22                       1 cubeline48:
   011F                       2     DefineDrawableEntity cubeline48_dw, 0x40, 0x20, 0x08, 0x08, _cubeline2_sp
   011F                       1 cubeline48_dw:
   0A22 40 20                 2     .db 0x40, 0x20
   0A24 08 08                 3     .db 0x08, 0x08
   0A26 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline48_dw_size = . - cubeline48_dw
   0A28 02                    3     .db     0x02     ;; Hitpoints
   0A29                      81 DefineCubeLine1 cubeline49, 0x48, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0A29                       1 cubeline49:
   0126                       2     DefineDrawableEntity cubeline49_dw, 0x48, 0x20, 0x08, 0x08, _cubeline2_sp
   0126                       1 cubeline49_dw:
   0A29 48 20                 2     .db 0x48, 0x20
   0A2B 08 08                 3     .db 0x08, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   0A2D F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline49_dw_size = . - cubeline49_dw
   0A2F 02                    3     .db     0x02     ;; Hitpoints
                             82 
                             83 
   0A30 28                   84 m_num_cube: .db 40
                             85 
                             86 
   0A31                      87 cube_clear:
                             88 
   0A31 C9            [10]   89 ret
                             90 
   0A32                      91 cube_draw:
   0A32 DD 21 18 09   [14]   92 ld ix,#cubeline10
   0A36 3E 28         [ 7]   93 ld a,#k_max_cube_line
                             94 
   0A38                      95 rep:
   0A38 F5            [11]   96 push af
   0A39 CD 47 0A      [17]   97 call cube_drawAll
                             98 
   0A3C 11 07 00      [10]   99 ld de,#k_cube_size
   0A3F DD 19         [15]  100 add ix, de
   0A41 F1            [10]  101 pop af
   0A42 3D            [ 4]  102 dec a
                            103 
   0A43 C2 38 0A      [10]  104 jp nz,rep
                            105 
                            106 
   0A46 C9            [10]  107 ret
                            108 
                            109 
                            110 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            111 ;; DRAW ENTITY
                            112 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            113 ;; INPUT: IX -> Points to entity
                            114 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0A47                     115 cube_drawAll:
                            116 
   0A47 DD 7E 06      [19]  117 	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
   0A4A D6 01         [ 7]  118 	sub #1					;;
                            119 
   0A4C C2 53 0A      [10]  120 	jp nz, ommit
                            121 
   0A4F CD CA 0C      [17]  122 	call render_drawCube
   0A52 C9            [10]  123 	ret
   0A53                     124 	ommit:					;;IF HP != 2 CHECK AGAIN
   0A53 D6 01         [ 7]  125 	sub #1					;;
                            126 	
   0A55 C2 5B 0A      [10]  127 	jp nz, ommit2
                            128 
   0A58 CD CA 0C      [17]  129 	call render_drawCube
                            130 
   0A5B                     131  	ommit2:					;;IF HP != 3 CHECK AGAIN
   0A5B D6 01         [ 7]  132 	sub #1					;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



                            133 	
   0A5D C2 63 0A      [10]  134 	jp nz, ommit3
                            135 
   0A60 CD CA 0C      [17]  136 	call render_drawCube
                            137 
   0A63                     138  	ommit3:					;;HP == 0 ;NOT DRAW
   0A63 C9            [10]  139 	ret
                            140 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            141 ;; BORRA UNA ENTIDAD
                            142 ;; PARA CUADRADOS UNICAMENTE
                            143 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            144 ;; ENTRADA: IX -> Puntero a entidad
                            145 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0A64                     146 cube_clearAll:
                            147 
                            148 ;;   ld  a, dc_col(ix)
                            149 ;;   ex af, af'
                            150 ;;
                            151 ;;   ld  dc_col(ix), #0
                            152 ;;
                            153 ;;   call render_drawCube
                            154 ;;   ex af, af'
                            155 ;;   ld dc_col(ix), a
                            156 
   0A64 C9            [10]  157    ret
                            158 
                            159 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            160 ;;
                            161 ;;RESET CUBES TO FIRST STATE
                            162 ;;
                            163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   0A65                     164 cube_reset:
                            165 
   0A65 CD 52 0C      [17]  166 	call ball_reset
                            167 
   0A68 21 18 09      [10]  168 	ld hl, #cubeline10
   0A6B 1E 00         [ 7]  169 	ld e, #0
   0A6D 16 00         [ 7]  170 	ld d, #0
   0A6F 0E 00         [ 7]  171 	ld c, #0
   0A71 DD 21 03 09   [14]  172 	ld ix, #cubedefault
   0A75                     173 	bucl:
                            174 
   0A75 7A            [ 4]  175 	ld a,d 
                            176 
   0A76 77            [ 7]  177 	ld (hl),a
                            178 
   0A77 C6 04         [ 7]  179 	add #4
                            180 
   0A79 57            [ 4]  181 	ld d,a
   0A7A 23            [ 6]  182 	inc hl
                            183 
                            184 
   0A7B DD 7E 01      [19]  185 	ld a, dc_y(ix)
   0A7E 77            [ 7]  186 	ld (hl),a
                            187 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   0A7F 23            [ 6]  188     inc hl
                            189 
   0A80 DD 7E 02      [19]  190     ld a, dc_w(ix)
   0A83 77            [ 7]  191 	ld (hl),a
                            192     
   0A84 23            [ 6]  193 	inc hl
                            194 
   0A85 DD 7E 03      [19]  195     ld a, dc_h(ix)
   0A88 77            [ 7]  196 	ld (hl),a
                            197     	
   0A89 23            [ 6]  198 	inc hl
                            199     	
   0A8A 79            [ 4]  200     ld a,c
   0A8B D6 01         [ 7]  201     sub #1
                            202 
   0A8D CA 99 0A      [10]  203     jp z, rojo
                            204 
   0A90 C6 02         [ 7]  205     add #2
   0A92 4F            [ 4]  206     ld c,a
                            207 	
   0A93 3E 0F         [ 7]  208 	ld a, #15
                            209 
   0A95 77            [ 7]  210     ld (hl),a
                            211 
   0A96 C3 A0 0A      [10]  212     jp colorok
   0A99                     213     rojo:
   0A99 4F            [ 4]  214     	ld c,a
                            215     	
   0A9A 3E FF         [ 7]  216     	ld a, #255
                            217 
   0A9C 77            [ 7]  218     	ld (hl),a
                            219 
   0A9D C3 A0 0A      [10]  220     	jp colorok
                            221   	
   0AA0                     222 	colorok:
                            223 
   0AA0 23            [ 6]  224     	inc hl
                            225 
                            226     	;;hp
   0AA1 23            [ 6]  227     	inc hl
                            228 
   0AA2 7B            [ 4]  229   	ld a,e
   0AA3 C6 01         [ 7]  230   	add #1
                            231 
   0AA5 5F            [ 4]  232   	ld e,a
                            233 
   0AA6 D6 28         [ 7]  234   	sub #k_max_cube_line
                            235 
   0AA8 20 CB         [12]  236     	jr nz, bucl
                            237 
                            238     	
                            239 
   0AAA C9            [10]  240  ret
                            241 
                            242 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



                            243 ;; CUBE LOOSES 1 LIFE
                            244 ;; REGISTERS DESTROYED: DE, AF
                            245 ;; INPUT: HL -> CUBE_X
                            246 ;; OUTPUT : HL -> CUBE_X
                            247 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0AAB                     248 cube_loses_life:
                            249 	
   0AAB 11 06 00      [10]  250 	ld de, #6			;;DE = 6
   0AAE 19            [11]  251 	add hl,de			;;HL + DE 
                            252 
   0AAF 7E            [ 7]  253 	ld a,(hl)			;;A = C_HP
   0AB0 D6 01         [ 7]  254 	sub #1				
   0AB2 77            [ 7]  255 	ld (hl),a			;;C_HP = C_HP - 1
                            256 
   0AB3 CA BB 0A      [10]  257 	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT
                            258 
   0AB6 11 FA FF      [10]  259 	ld de, #-6			;;IF NOT, HL -> DC_X
   0AB9 19            [11]  260 	add hl,de
                            261 
                            262 
   0ABA C9            [10]  263 ret
                            264 
                            265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            266 ;; CUBE GETS DESTROYED
                            267 ;; REGISTERS DESTROYED: DE, AF
                            268 ;; INPUT: HL -> CUBE_HP
                            269 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            270 
   0ABB                     271 destroy_cube:
   0ABB 11 FA FF      [10]  272 	ld de, #-6			;; 
   0ABE 19            [11]  273 	add hl,de			;; HL -> DC_X
   0ABF 36 FF         [10]  274 	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
   0AC1 23            [ 6]  275 	inc hl
   0AC2 36 FF         [10]  276 	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
   0AC4 2B            [ 6]  277 	dec hl				;; HL -> DC_X
                            278 
   0AC5 3A 30 0A      [13]  279 	ld a, (m_num_cube)	;;
   0AC8 D6 01         [ 7]  280 	sub #1				;;
   0ACA 32 30 0A      [13]  281 	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1
                            282 
   0ACD CA 65 0A      [10]  283 	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL
                            284 
   0AD0 C9            [10]  285 ret
                            286 
