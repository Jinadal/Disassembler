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
                             33 .globl cpct_akp_stop_asm
                             34 .globl cpct_drawSpriteMasked_asm
                             35 .globl menu
                             36 .globl state
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



                             25 .include "life.h.s"
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
                             20 ;;.globl life_clear
                             21 .globl life_draw
                             22 .globl delete_life
                             23 .globl reset_life
                             24 ;;.globl life_update
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             27 ;;
                             28 ;;MACROS
                             29 ;;
                             30 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             31 .macro DefineLife _name, _x, _y, _w, _h, _col,_hp
                             32 _name:
                             33     DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             34         .db     _hp     ;; Hitpoints
                             35 .endm
                     0000    36 l_de        = 0
                     0006    37 l_hp        = 6
                             38 
                             39 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             40 ;;
                             41 ;;OBJETOS CREADOS CON LA MACROS
                             42 ;;
                             43 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             44 
                             45 .globl life1
                             46 .globl life2
                             47 .globl life3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             26 
                             27 
                             28 .globl _cubeline_sp
                             29 .globl _cubeline2_sp
                             30 .globl _cubeline3_sp
                             31 
                     0028    32 k_max_cube_line = 40
                     000A    33 k_cubos_linea = 10
                     0004    34 k_num_line = 4
                             35 
                             36 
                     0007    37 k_cube_size = 7
                             38 
                             39 
   1059                      40 DefineCubeLine1 cubedefault, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp, 0x03
   1059                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   0000                       1 cubedefault_dw:
   1059 00 08                 2     .db 0x00, 0x08
   105B 08 08                 3     .db 0x08, 0x08
   105D B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   105F 03                    3     .db     0x03     ;; Hitpoints
   1060                      41 DefineCubeLine1 cubedefault1, 0x00, 0x10, 0x08, 0x08, _cubeline_sp, 0x01
   1060                       1 cubedefault1:
   0007                       2     DefineDrawableEntity cubedefault1_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0007                       1 cubedefault1_dw:
   1060 00 10                 2     .db 0x00, 0x10
   1062 08 08                 3     .db 0x08, 0x08
   1064 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault1_dw_size = . - cubedefault1_dw
   1066 01                    3     .db     0x01     ;; Hitpoints
   1067                      42 DefineCubeLine1 cubedefault2, 0x00, 0x18, 0x08, 0x08, _cubeline_sp, 0x01
   1067                       1 cubedefault2:
   000E                       2     DefineDrawableEntity cubedefault2_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   000E                       1 cubedefault2_dw:
   1067 00 18                 2     .db 0x00, 0x18
   1069 08 08                 3     .db 0x08, 0x08
   106B 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault2_dw_size = . - cubedefault2_dw
   106D 01                    3     .db     0x01     ;; Hitpoints
   106E                      43 DefineCubeLine1 cubedefault3, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp, 0x02
   106E                       1 cubedefault3:
   0015                       2     DefineDrawableEntity cubedefault3_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   0015                       1 cubedefault3_dw:
   106E 00 20                 2     .db 0x00, 0x20
   1070 08 08                 3     .db 0x08, 0x08
   1072 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubedefault3_dw_size = . - cubedefault3_dw
   1074 02                    3     .db     0x02     ;; Hitpoints
                             44 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                             45 
                             46 
   1075                      47 DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   1075                       1 cubeline10:
   001C                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   001C                       1 cubeline10_dw:
   1075 00 08                 2     .db 0x00, 0x08
   1077 08 08                 3     .db 0x08, 0x08
   1079 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   107B 03                    3     .db     0x03     ;; Hitpoints
   107C                      48 DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   107C                       1 cubeline11:
   0023                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x08, 0x08, 0x08, _cubeline3_sp
   0023                       1 cubeline11_dw:
   107C 08 08                 2     .db 0x08, 0x08
   107E 08 08                 3     .db 0x08, 0x08
   1080 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   1082 03                    3     .db     0x03     ;; Hitpoints
   1083                      49 DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   1083                       1 cubeline12:
   002A                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x08, 0x08, 0x08, _cubeline3_sp
   002A                       1 cubeline12_dw:
   1083 10 08                 2     .db 0x10, 0x08
   1085 08 08                 3     .db 0x08, 0x08
   1087 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   1089 03                    3     .db     0x03     ;; Hitpoints
   108A                      50 DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   108A                       1 cubeline13:
   0031                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x08, 0x08, 0x08, _cubeline3_sp
   0031                       1 cubeline13_dw:
   108A 18 08                 2     .db 0x18, 0x08
   108C 08 08                 3     .db 0x08, 0x08
   108E B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   1090 03                    3     .db     0x03     ;; Hitpoints
   1091                      51 DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   1091                       1 cubeline14:
   0038                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x08, 0x08, 0x08, _cubeline3_sp
   0038                       1 cubeline14_dw:
   1091 20 08                 2     .db 0x20, 0x08
   1093 08 08                 3     .db 0x08, 0x08
   1095 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   1097 03                    3     .db     0x03     ;; Hitpoints
   1098                      52 DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   1098                       1 cubeline15:
   003F                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x08, 0x08, 0x08, _cubeline3_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   003F                       1 cubeline15_dw:
   1098 28 08                 2     .db 0x28, 0x08
   109A 08 08                 3     .db 0x08, 0x08
   109C B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   109E 03                    3     .db     0x03     ;; Hitpoints
   109F                      53 DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   109F                       1 cubeline16:
   0046                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x08, 0x08, 0x08, _cubeline3_sp
   0046                       1 cubeline16_dw:
   109F 30 08                 2     .db 0x30, 0x08
   10A1 08 08                 3     .db 0x08, 0x08
   10A3 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
   10A5 03                    3     .db     0x03     ;; Hitpoints
   10A6                      54 DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   10A6                       1 cubeline17:
   004D                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x08, 0x08, 0x08, _cubeline3_sp
   004D                       1 cubeline17_dw:
   10A6 38 08                 2     .db 0x38, 0x08
   10A8 08 08                 3     .db 0x08, 0x08
   10AA B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   10AC 03                    3     .db     0x03     ;; Hitpoints
   10AD                      55 DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   10AD                       1 cubeline18:
   0054                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x08, 0x08, 0x08, _cubeline3_sp
   0054                       1 cubeline18_dw:
   10AD 40 08                 2     .db 0x40, 0x08
   10AF 08 08                 3     .db 0x08, 0x08
   10B1 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   10B3 03                    3     .db     0x03     ;; Hitpoints
   10B4                      56 DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   10B4                       1 cubeline19:
   005B                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x08, 0x08, 0x08, _cubeline3_sp
   005B                       1 cubeline19_dw:
   10B4 48 08                 2     .db 0x48, 0x08
   10B6 08 08                 3     .db 0x08, 0x08
   10B8 B7 08                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   10BA 03                    3     .db     0x03     ;; Hitpoints
                             57 
   10BB                      58 DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10BB                       1 cubeline20:
   0062                       2     DefineDrawableEntity cubeline20_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0062                       1 cubeline20_dw:
   10BB 00 10                 2     .db 0x00, 0x10
   10BD 08 08                 3     .db 0x08, 0x08
   10BF 57 09                 4     .dw _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                              5 
                     0006     6 cubeline20_dw_size = . - cubeline20_dw
   10C1 01                    3     .db     0x01     ;; Hitpoints
   10C2                      59 DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10C2                       1 cubeline21:
   0069                       2     DefineDrawableEntity cubeline21_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   0069                       1 cubeline21_dw:
   10C2 08 10                 2     .db 0x08, 0x10
   10C4 08 08                 3     .db 0x08, 0x08
   10C6 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline21_dw_size = . - cubeline21_dw
   10C8 01                    3     .db     0x01     ;; Hitpoints
   10C9                      60 DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10C9                       1 cubeline22:
   0070                       2     DefineDrawableEntity cubeline22_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
   0070                       1 cubeline22_dw:
   10C9 10 10                 2     .db 0x10, 0x10
   10CB 08 08                 3     .db 0x08, 0x08
   10CD 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline22_dw_size = . - cubeline22_dw
   10CF 01                    3     .db     0x01     ;; Hitpoints
   10D0                      61 DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10D0                       1 cubeline23:
   0077                       2     DefineDrawableEntity cubeline23_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   0077                       1 cubeline23_dw:
   10D0 18 10                 2     .db 0x18, 0x10
   10D2 08 08                 3     .db 0x08, 0x08
   10D4 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline23_dw_size = . - cubeline23_dw
   10D6 01                    3     .db     0x01     ;; Hitpoints
   10D7                      62 DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10D7                       1 cubeline24:
   007E                       2     DefineDrawableEntity cubeline24_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   007E                       1 cubeline24_dw:
   10D7 20 10                 2     .db 0x20, 0x10
   10D9 08 08                 3     .db 0x08, 0x08
   10DB 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline24_dw_size = . - cubeline24_dw
   10DD 01                    3     .db     0x01     ;; Hitpoints
   10DE                      63 DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10DE                       1 cubeline25:
   0085                       2     DefineDrawableEntity cubeline25_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   0085                       1 cubeline25_dw:
   10DE 28 10                 2     .db 0x28, 0x10
   10E0 08 08                 3     .db 0x08, 0x08
   10E2 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline25_dw_size = . - cubeline25_dw
   10E4 01                    3     .db     0x01     ;; Hitpoints
   10E5                      64 DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10E5                       1 cubeline26:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   008C                       2     DefineDrawableEntity cubeline26_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   008C                       1 cubeline26_dw:
   10E5 30 10                 2     .db 0x30, 0x10
   10E7 08 08                 3     .db 0x08, 0x08
   10E9 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline26_dw_size = . - cubeline26_dw
   10EB 01                    3     .db     0x01     ;; Hitpoints
   10EC                      65 DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10EC                       1 cubeline27:
   0093                       2     DefineDrawableEntity cubeline27_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   0093                       1 cubeline27_dw:
   10EC 38 10                 2     .db 0x38, 0x10
   10EE 08 08                 3     .db 0x08, 0x08
   10F0 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline27_dw_size = . - cubeline27_dw
   10F2 01                    3     .db     0x01     ;; Hitpoints
   10F3                      66 DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10F3                       1 cubeline28:
   009A                       2     DefineDrawableEntity cubeline28_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   009A                       1 cubeline28_dw:
   10F3 40 10                 2     .db 0x40, 0x10
   10F5 08 08                 3     .db 0x08, 0x08
   10F7 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline28_dw_size = . - cubeline28_dw
   10F9 01                    3     .db     0x01     ;; Hitpoints
   10FA                      67 DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   10FA                       1 cubeline29:
   00A1                       2     DefineDrawableEntity cubeline29_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   00A1                       1 cubeline29_dw:
   10FA 48 10                 2     .db 0x48, 0x10
   10FC 08 08                 3     .db 0x08, 0x08
   10FE 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline29_dw_size = . - cubeline29_dw
   1100 01                    3     .db     0x01     ;; Hitpoints
                             68 
   1101                      69 DefineCubeLine1 cubeline30, 0x00, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1101                       1 cubeline30:
   00A8                       2     DefineDrawableEntity cubeline30_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   00A8                       1 cubeline30_dw:
   1101 00 18                 2     .db 0x00, 0x18
   1103 08 08                 3     .db 0x08, 0x08
   1105 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline30_dw_size = . - cubeline30_dw
   1107 01                    3     .db     0x01     ;; Hitpoints
   1108                      70 DefineCubeLine1 cubeline31, 0x08, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1108                       1 cubeline31:
   00AF                       2     DefineDrawableEntity cubeline31_dw, 0x08, 0x18, 0x08, 0x08, _cubeline_sp
   00AF                       1 cubeline31_dw:
   1108 08 18                 2     .db 0x08, 0x18
   110A 08 08                 3     .db 0x08, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   110C 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline31_dw_size = . - cubeline31_dw
   110E 01                    3     .db     0x01     ;; Hitpoints
   110F                      71 DefineCubeLine1 cubeline32, 0x10, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   110F                       1 cubeline32:
   00B6                       2     DefineDrawableEntity cubeline32_dw, 0x10, 0x18, 0x08, 0x08, _cubeline_sp
   00B6                       1 cubeline32_dw:
   110F 10 18                 2     .db 0x10, 0x18
   1111 08 08                 3     .db 0x08, 0x08
   1113 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline32_dw_size = . - cubeline32_dw
   1115 01                    3     .db     0x01     ;; Hitpoints
   1116                      72 DefineCubeLine1 cubeline33, 0x18, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1116                       1 cubeline33:
   00BD                       2     DefineDrawableEntity cubeline33_dw, 0x18, 0x18, 0x08, 0x08, _cubeline_sp
   00BD                       1 cubeline33_dw:
   1116 18 18                 2     .db 0x18, 0x18
   1118 08 08                 3     .db 0x08, 0x08
   111A 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline33_dw_size = . - cubeline33_dw
   111C 01                    3     .db     0x01     ;; Hitpoints
   111D                      73 DefineCubeLine1 cubeline34, 0x20, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   111D                       1 cubeline34:
   00C4                       2     DefineDrawableEntity cubeline34_dw, 0x20, 0x18, 0x08, 0x08, _cubeline_sp
   00C4                       1 cubeline34_dw:
   111D 20 18                 2     .db 0x20, 0x18
   111F 08 08                 3     .db 0x08, 0x08
   1121 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline34_dw_size = . - cubeline34_dw
   1123 01                    3     .db     0x01     ;; Hitpoints
   1124                      74 DefineCubeLine1 cubeline35, 0x28, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1124                       1 cubeline35:
   00CB                       2     DefineDrawableEntity cubeline35_dw, 0x28, 0x18, 0x08, 0x08, _cubeline_sp
   00CB                       1 cubeline35_dw:
   1124 28 18                 2     .db 0x28, 0x18
   1126 08 08                 3     .db 0x08, 0x08
   1128 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline35_dw_size = . - cubeline35_dw
   112A 01                    3     .db     0x01     ;; Hitpoints
   112B                      75 DefineCubeLine1 cubeline36, 0x30, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   112B                       1 cubeline36:
   00D2                       2     DefineDrawableEntity cubeline36_dw, 0x30, 0x18, 0x08, 0x08, _cubeline_sp
   00D2                       1 cubeline36_dw:
   112B 30 18                 2     .db 0x30, 0x18
   112D 08 08                 3     .db 0x08, 0x08
   112F 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline36_dw_size = . - cubeline36_dw
   1131 01                    3     .db     0x01     ;; Hitpoints
   1132                      76 DefineCubeLine1 cubeline37, 0x38, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   1132                       1 cubeline37:
   00D9                       2     DefineDrawableEntity cubeline37_dw, 0x38, 0x18, 0x08, 0x08, _cubeline_sp
   00D9                       1 cubeline37_dw:
   1132 38 18                 2     .db 0x38, 0x18
   1134 08 08                 3     .db 0x08, 0x08
   1136 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline37_dw_size = . - cubeline37_dw
   1138 01                    3     .db     0x01     ;; Hitpoints
   1139                      77 DefineCubeLine1 cubeline38, 0x40, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1139                       1 cubeline38:
   00E0                       2     DefineDrawableEntity cubeline38_dw, 0x40, 0x18, 0x08, 0x08, _cubeline_sp
   00E0                       1 cubeline38_dw:
   1139 40 18                 2     .db 0x40, 0x18
   113B 08 08                 3     .db 0x08, 0x08
   113D 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline38_dw_size = . - cubeline38_dw
   113F 01                    3     .db     0x01     ;; Hitpoints
   1140                      78 DefineCubeLine1 cubeline39, 0x48, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   1140                       1 cubeline39:
   00E7                       2     DefineDrawableEntity cubeline39_dw, 0x48, 0x18, 0x08, 0x08, _cubeline_sp
   00E7                       1 cubeline39_dw:
   1140 48 18                 2     .db 0x48, 0x18
   1142 08 08                 3     .db 0x08, 0x08
   1144 57 09                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline39_dw_size = . - cubeline39_dw
   1146 01                    3     .db     0x01     ;; Hitpoints
                             79 ;;
   1147                      80 DefineCubeLine1 cubeline40, 0x00, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1147                       1 cubeline40:
   00EE                       2     DefineDrawableEntity cubeline40_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   00EE                       1 cubeline40_dw:
   1147 00 20                 2     .db 0x00, 0x20
   1149 08 08                 3     .db 0x08, 0x08
   114B 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline40_dw_size = . - cubeline40_dw
   114D 02                    3     .db     0x02     ;; Hitpoints
   114E                      81 DefineCubeLine1 cubeline41, 0x08, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   114E                       1 cubeline41:
   00F5                       2     DefineDrawableEntity cubeline41_dw, 0x08, 0x20, 0x08, 0x08, _cubeline2_sp
   00F5                       1 cubeline41_dw:
   114E 08 20                 2     .db 0x08, 0x20
   1150 08 08                 3     .db 0x08, 0x08
   1152 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline41_dw_size = . - cubeline41_dw
   1154 02                    3     .db     0x02     ;; Hitpoints
   1155                      82 DefineCubeLine1 cubeline42, 0x10, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1155                       1 cubeline42:
   00FC                       2     DefineDrawableEntity cubeline42_dw, 0x10, 0x20, 0x08, 0x08, _cubeline2_sp
   00FC                       1 cubeline42_dw:
   1155 10 20                 2     .db 0x10, 0x20
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   1157 08 08                 3     .db 0x08, 0x08
   1159 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline42_dw_size = . - cubeline42_dw
   115B 02                    3     .db     0x02     ;; Hitpoints
   115C                      83 DefineCubeLine1 cubeline43, 0x18, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   115C                       1 cubeline43:
   0103                       2     DefineDrawableEntity cubeline43_dw, 0x18, 0x20, 0x08, 0x08, _cubeline2_sp
   0103                       1 cubeline43_dw:
   115C 18 20                 2     .db 0x18, 0x20
   115E 08 08                 3     .db 0x08, 0x08
   1160 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline43_dw_size = . - cubeline43_dw
   1162 02                    3     .db     0x02     ;; Hitpoints
   1163                      84 DefineCubeLine1 cubeline44, 0x20, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1163                       1 cubeline44:
   010A                       2     DefineDrawableEntity cubeline44_dw, 0x20, 0x20, 0x08, 0x08, _cubeline2_sp
   010A                       1 cubeline44_dw:
   1163 20 20                 2     .db 0x20, 0x20
   1165 08 08                 3     .db 0x08, 0x08
   1167 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline44_dw_size = . - cubeline44_dw
   1169 02                    3     .db     0x02     ;; Hitpoints
   116A                      85 DefineCubeLine1 cubeline45, 0x28, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   116A                       1 cubeline45:
   0111                       2     DefineDrawableEntity cubeline45_dw, 0x28, 0x20, 0x08, 0x08, _cubeline2_sp
   0111                       1 cubeline45_dw:
   116A 28 20                 2     .db 0x28, 0x20
   116C 08 08                 3     .db 0x08, 0x08
   116E 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline45_dw_size = . - cubeline45_dw
   1170 02                    3     .db     0x02     ;; Hitpoints
   1171                      86 DefineCubeLine1 cubeline46, 0x30, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1171                       1 cubeline46:
   0118                       2     DefineDrawableEntity cubeline46_dw, 0x30, 0x20, 0x08, 0x08, _cubeline2_sp
   0118                       1 cubeline46_dw:
   1171 30 20                 2     .db 0x30, 0x20
   1173 08 08                 3     .db 0x08, 0x08
   1175 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline46_dw_size = . - cubeline46_dw
   1177 02                    3     .db     0x02     ;; Hitpoints
   1178                      87 DefineCubeLine1 cubeline47, 0x38, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1178                       1 cubeline47:
   011F                       2     DefineDrawableEntity cubeline47_dw, 0x38, 0x20, 0x08, 0x08, _cubeline2_sp
   011F                       1 cubeline47_dw:
   1178 38 20                 2     .db 0x38, 0x20
   117A 08 08                 3     .db 0x08, 0x08
   117C 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline47_dw_size = . - cubeline47_dw
   117E 02                    3     .db     0x02     ;; Hitpoints
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   117F                      88 DefineCubeLine1 cubeline48, 0x40, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   117F                       1 cubeline48:
   0126                       2     DefineDrawableEntity cubeline48_dw, 0x40, 0x20, 0x08, 0x08, _cubeline2_sp
   0126                       1 cubeline48_dw:
   117F 40 20                 2     .db 0x40, 0x20
   1181 08 08                 3     .db 0x08, 0x08
   1183 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline48_dw_size = . - cubeline48_dw
   1185 02                    3     .db     0x02     ;; Hitpoints
   1186                      89 DefineCubeLine1 cubeline49, 0x48, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   1186                       1 cubeline49:
   012D                       2     DefineDrawableEntity cubeline49_dw, 0x48, 0x20, 0x08, 0x08, _cubeline2_sp
   012D                       1 cubeline49_dw:
   1186 48 20                 2     .db 0x48, 0x20
   1188 08 08                 3     .db 0x08, 0x08
   118A 07 09                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline49_dw_size = . - cubeline49_dw
   118C 02                    3     .db     0x02     ;; Hitpoints
                             90 
                             91 
   118D 28                   92 m_num_cube: .db 40
                             93 
                             94 
   118E                      95 cube_clear:
                             96 
   118E C9            [10]   97 ret
                             98 
   118F                      99 cube_draw:
   118F DD 21 75 10   [14]  100 ld ix,#cubeline10
   1193 3E 28         [ 7]  101 ld a,#k_max_cube_line
                            102 
   1195                     103 rep:
   1195 F5            [11]  104 push af
   1196 CD A4 11      [17]  105 call cube_drawAll
                            106 
   1199 11 07 00      [10]  107 ld de,#k_cube_size
   119C DD 19         [15]  108 add ix, de
   119E F1            [10]  109 pop af
   119F 3D            [ 4]  110 dec a
                            111 
   11A0 C2 95 11      [10]  112 jp nz,rep
                            113 
                            114 
   11A3 C9            [10]  115 ret
                            116 
                            117 
                            118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            119 ;; DRAW ENTITY
                            120 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            121 ;; INPUT: IX -> Points to entity
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   11A4                     123 cube_drawAll:
                            124 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   11A4 DD 7E 06      [19]  125 	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
   11A7 D6 01         [ 7]  126 	sub #1					;;
                            127 
   11A9 C2 B0 11      [10]  128 	jp nz, ommit
                            129 
   11AC CD 93 0D      [17]  130 	call render_drawCube
   11AF C9            [10]  131 	ret
   11B0                     132 	ommit:					;;IF HP != 2 CHECK AGAIN
   11B0 D6 01         [ 7]  133 	sub #1					;;
                            134 	
   11B2 C2 B8 11      [10]  135 	jp nz, ommit2
                            136 
   11B5 CD 93 0D      [17]  137 	call render_drawCube
                            138 
   11B8                     139  	ommit2:					;;IF HP != 3 CHECK AGAIN
   11B8 D6 01         [ 7]  140 	sub #1					;;
                            141 	
   11BA C2 C0 11      [10]  142 	jp nz, ommit3
                            143 
   11BD CD 93 0D      [17]  144 	call render_drawCube
                            145 
   11C0                     146  	ommit3:					;;HP == 0 ;NOT DRAW
   11C0 C9            [10]  147 	ret
                            148 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            149 ;; BORRA UNA ENTIDAD
                            150 ;; PARA CUADRADOS UNICAMENTE
                            151 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            152 ;; ENTRADA: IX -> Puntero a entidad
                            153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   11C1                     154 cube_clearAll:
                            155 
                            156 ;;   ld  a, dc_col(ix)
                            157 ;;   ex af, af'
                            158 ;;
                            159 ;;   ld  dc_col(ix), #0
                            160 ;;
                            161 ;;   call render_drawCube
                            162 ;;   ex af, af'
                            163 ;;   ld dc_col(ix), a
                            164 
   11C1 C9            [10]  165    ret
                            166 
                            167 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            168 ;;
                            169 ;;RESET CUBES TO FIRST STATE
                            170 ;;
                            171 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   11C2                     172 cube_reset:
                            173 
   11C2 CD 08 10      [17]  174 	call ball_reset
                            175 
   11C5 21 75 10      [10]  176 	ld hl, #cubeline10
   11C8 1E 00         [ 7]  177 	ld e, #0
   11CA 16 00         [ 7]  178 	ld d, #0
   11CC 0E 00         [ 7]  179 	ld c, #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   11CE DD 21 59 10   [14]  180 	ld ix, #cubedefault
                            181 
   11D2                     182 	bucl2:
   11D2                     183 	bucl:
                            184 
   11D2 7A            [ 4]  185 	ld a,d 
                            186 
   11D3 77            [ 7]  187 	ld (hl),a
                            188 
   11D4 C6 08         [ 7]  189 	add #8
                            190 
   11D6 57            [ 4]  191 	ld d,a
   11D7 23            [ 6]  192 	inc hl
                            193 
                            194 
   11D8 DD 7E 01      [19]  195 	ld a, dc_y(ix)
   11DB 77            [ 7]  196 	ld (hl),a
                            197 	
   11DC 23            [ 6]  198     inc hl
                            199 
   11DD DD 7E 02      [19]  200     ld a, dc_w(ix)
   11E0 77            [ 7]  201 	ld (hl),a
                            202     
   11E1 23            [ 6]  203 	inc hl
                            204 
   11E2 DD 7E 03      [19]  205     ld a, dc_h(ix)
   11E5 77            [ 7]  206 	ld (hl),a
                            207     	
   11E6 23            [ 6]  208 	inc hl
                            209     	
   11E7 DD 7E 04      [19]  210    ld a, dc_sp_l(ix)
   11EA 77            [ 7]  211    ld (hl), a
                            212 
   11EB 23            [ 6]  213     	inc hl
                            214 
   11EC DD 7E 05      [19]  215     ld a, dc_sp_h(ix)
   11EF 77            [ 7]  216     ld (hl),a
                            217 
   11F0 23            [ 6]  218    	inc hl	
                            219 
   11F1 DD 7E 06      [19]  220     ld a, c_hp(ix)
   11F4 77            [ 7]  221     ld (hl),a
                            222 
   11F5 23            [ 6]  223     	inc hl
                            224 
   11F6 7B            [ 4]  225   	ld a,e
   11F7 C6 01         [ 7]  226   	add #1
                            227 
   11F9 5F            [ 4]  228   	ld e,a
                            229 
   11FA D6 0A         [ 7]  230   	sub #k_cubos_linea
                            231 
   11FC 20 D4         [12]  232     	jr nz, bucl
                            233 
   11FE 79            [ 4]  234     	ld a, c
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            235 
   11FF C6 01         [ 7]  236     	add #1
                            237 
   1201 4F            [ 4]  238     	ld c, a
                            239 
   1202 D6 04         [ 7]  240     	sub #k_num_line
                            241 
   1204 11 07 00      [10]  242     	ld de, #k_cube_size
   1207 DD 19         [15]  243 	add ix, de
                            244 
   1209 16 00         [ 7]  245 	ld d, #0
   120B 1E 00         [ 7]  246 	ld e, #0
                            247 
   120D 20 C3         [12]  248     	jr nz, bucl2
                            249 
                            250 
                            251 
   120F CD 4E 0E      [17]  252 	call reset_life
   1212 3A 64 0D      [13]  253 	ld a, (state)
   1215 D6 01         [ 7]  254 	sub #1
   1217 32 64 0D      [13]  255 	ld (state), a
                            256     	
                            257 
   121A C9            [10]  258  ret
                            259 
                            260 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            261 ;; CUBE LOOSES 1 LIFE
                            262 ;; REGISTERS DESTROYED: DE, AF
                            263 ;; INPUT: HL -> CUBE_X
                            264 ;; OUTPUT : HL -> CUBE_X
                            265 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   121B                     266 cube_loses_life:
                            267 	
   121B 11 06 00      [10]  268 	ld de, #6			;;DE = 6
   121E 19            [11]  269 	add hl,de			;;HL + DE 
                            270 
   121F 7E            [ 7]  271 	ld a,(hl)			;;A = C_HP
   1220 D6 01         [ 7]  272 	sub #1				
   1222 77            [ 7]  273 	ld (hl),a			;;C_HP = C_HP - 1
                            274 
   1223 CA 2B 12      [10]  275 	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT
                            276 
   1226 11 FA FF      [10]  277 	ld de, #-6			;;IF NOT, HL -> DC_X
   1229 19            [11]  278 	add hl,de
                            279 
                            280 
   122A C9            [10]  281 ret
                            282 
                            283 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            284 ;; CUBE GETS DESTROYED
                            285 ;; REGISTERS DESTROYED: DE, AF
                            286 ;; INPUT: HL -> CUBE_HP
                            287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            288 
   122B                     289 destroy_cube:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



   122B 11 FA FF      [10]  290 	ld de, #-6			;; 
   122E 19            [11]  291 	add hl,de			;; HL -> DC_X
   122F 36 FF         [10]  292 	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
   1231 23            [ 6]  293 	inc hl
   1232 36 FF         [10]  294 	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
   1234 2B            [ 6]  295 	dec hl				;; HL -> DC_X
                            296 
   1235 3A 8D 11      [13]  297 	ld a, (m_num_cube)	;;
   1238 D6 01         [ 7]  298 	sub #1				;;
   123A 32 8D 11      [13]  299 	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1
                            300 
   123D CA C2 11      [10]  301 	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL
                            302 	
                            303 
   1240 C9            [10]  304 ret
                            305 
