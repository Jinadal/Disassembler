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
                     000A    31 k_cubos_linea = 10
                     0004    32 k_num_line = 4
                             33 
                             34 
                     0007    35 k_cube_size = 7
                             36 
                             37 
   0B1C                      38 DefineCubeLine1 cubedefault, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp, 0x03
   0B1C                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   0000                       1 cubedefault_dw:
   0B1C 00 08                 2     .db 0x00, 0x08
   0B1E 08 08                 3     .db 0x08, 0x08
   0B20 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   0B22 03                    3     .db     0x03     ;; Hitpoints
   0B23                      39 DefineCubeLine1 cubedefault1, 0x00, 0x10, 0x08, 0x08, _cubeline_sp, 0x01
   0B23                       1 cubedefault1:
   0007                       2     DefineDrawableEntity cubedefault1_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0007                       1 cubedefault1_dw:
   0B23 00 10                 2     .db 0x00, 0x10
   0B25 08 08                 3     .db 0x08, 0x08
   0B27 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault1_dw_size = . - cubedefault1_dw
   0B29 01                    3     .db     0x01     ;; Hitpoints
   0B2A                      40 DefineCubeLine1 cubedefault2, 0x00, 0x18, 0x08, 0x08, _cubeline_sp, 0x01
   0B2A                       1 cubedefault2:
   000E                       2     DefineDrawableEntity cubedefault2_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   000E                       1 cubedefault2_dw:
   0B2A 00 18                 2     .db 0x00, 0x18
   0B2C 08 08                 3     .db 0x08, 0x08
   0B2E 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault2_dw_size = . - cubedefault2_dw
   0B30 01                    3     .db     0x01     ;; Hitpoints
   0B31                      41 DefineCubeLine1 cubedefault3, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp, 0x02
   0B31                       1 cubedefault3:
   0015                       2     DefineDrawableEntity cubedefault3_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   0015                       1 cubedefault3_dw:
   0B31 00 20                 2     .db 0x00, 0x20
   0B33 08 08                 3     .db 0x08, 0x08
   0B35 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubedefault3_dw_size = . - cubedefault3_dw
   0B37 02                    3     .db     0x02     ;; Hitpoints
                             42 
                             43 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                             44 
   0B38                      45 DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B38                       1 cubeline10:
   001C                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   001C                       1 cubeline10_dw:
   0B38 00 08                 2     .db 0x00, 0x08
   0B3A 08 08                 3     .db 0x08, 0x08
   0B3C A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   0B3E 03                    3     .db     0x03     ;; Hitpoints
   0B3F                      46 DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B3F                       1 cubeline11:
   0023                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x08, 0x08, 0x08, _cubeline3_sp
   0023                       1 cubeline11_dw:
   0B3F 08 08                 2     .db 0x08, 0x08
   0B41 08 08                 3     .db 0x08, 0x08
   0B43 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   0B45 03                    3     .db     0x03     ;; Hitpoints
   0B46                      47 DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B46                       1 cubeline12:
   002A                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x08, 0x08, 0x08, _cubeline3_sp
   002A                       1 cubeline12_dw:
   0B46 10 08                 2     .db 0x10, 0x08
   0B48 08 08                 3     .db 0x08, 0x08
   0B4A A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   0B4C 03                    3     .db     0x03     ;; Hitpoints
   0B4D                      48 DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B4D                       1 cubeline13:
   0031                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x08, 0x08, 0x08, _cubeline3_sp
   0031                       1 cubeline13_dw:
   0B4D 18 08                 2     .db 0x18, 0x08
   0B4F 08 08                 3     .db 0x08, 0x08
   0B51 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   0B53 03                    3     .db     0x03     ;; Hitpoints
   0B54                      49 DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B54                       1 cubeline14:
   0038                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x08, 0x08, 0x08, _cubeline3_sp
   0038                       1 cubeline14_dw:
   0B54 20 08                 2     .db 0x20, 0x08
   0B56 08 08                 3     .db 0x08, 0x08
   0B58 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   0B5A 03                    3     .db     0x03     ;; Hitpoints
   0B5B                      50 DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B5B                       1 cubeline15:
   003F                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x08, 0x08, 0x08, _cubeline3_sp
   003F                       1 cubeline15_dw:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   0B5B 28 08                 2     .db 0x28, 0x08
   0B5D 08 08                 3     .db 0x08, 0x08
   0B5F A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   0B61 03                    3     .db     0x03     ;; Hitpoints
   0B62                      51 DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B62                       1 cubeline16:
   0046                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x08, 0x08, 0x08, _cubeline3_sp
   0046                       1 cubeline16_dw:
   0B62 30 08                 2     .db 0x30, 0x08
   0B64 08 08                 3     .db 0x08, 0x08
   0B66 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
   0B68 03                    3     .db     0x03     ;; Hitpoints
   0B69                      52 DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B69                       1 cubeline17:
   004D                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x08, 0x08, 0x08, _cubeline3_sp
   004D                       1 cubeline17_dw:
   0B69 38 08                 2     .db 0x38, 0x08
   0B6B 08 08                 3     .db 0x08, 0x08
   0B6D A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   0B6F 03                    3     .db     0x03     ;; Hitpoints
   0B70                      53 DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B70                       1 cubeline18:
   0054                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x08, 0x08, 0x08, _cubeline3_sp
   0054                       1 cubeline18_dw:
   0B70 40 08                 2     .db 0x40, 0x08
   0B72 08 08                 3     .db 0x08, 0x08
   0B74 A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   0B76 03                    3     .db     0x03     ;; Hitpoints
   0B77                      54 DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   0B77                       1 cubeline19:
   005B                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x08, 0x08, 0x08, _cubeline3_sp
   005B                       1 cubeline19_dw:
   0B77 48 08                 2     .db 0x48, 0x08
   0B79 08 08                 3     .db 0x08, 0x08
   0B7B A7 07                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   0B7D 03                    3     .db     0x03     ;; Hitpoints
                             55 
   0B7E                      56 DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0B7E                       1 cubeline20:
   0062                       2     DefineDrawableEntity cubeline20_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0062                       1 cubeline20_dw:
   0B7E 00 10                 2     .db 0x00, 0x10
   0B80 08 08                 3     .db 0x08, 0x08
   0B82 47 08                 4     .dw _cubeline_sp
                              5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                     0006     6 cubeline20_dw_size = . - cubeline20_dw
   0B84 01                    3     .db     0x01     ;; Hitpoints
   0B85                      57 DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0B85                       1 cubeline21:
   0069                       2     DefineDrawableEntity cubeline21_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   0069                       1 cubeline21_dw:
   0B85 08 10                 2     .db 0x08, 0x10
   0B87 08 08                 3     .db 0x08, 0x08
   0B89 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline21_dw_size = . - cubeline21_dw
   0B8B 01                    3     .db     0x01     ;; Hitpoints
   0B8C                      58 DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0B8C                       1 cubeline22:
   0070                       2     DefineDrawableEntity cubeline22_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
   0070                       1 cubeline22_dw:
   0B8C 10 10                 2     .db 0x10, 0x10
   0B8E 08 08                 3     .db 0x08, 0x08
   0B90 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline22_dw_size = . - cubeline22_dw
   0B92 01                    3     .db     0x01     ;; Hitpoints
   0B93                      59 DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0B93                       1 cubeline23:
   0077                       2     DefineDrawableEntity cubeline23_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   0077                       1 cubeline23_dw:
   0B93 18 10                 2     .db 0x18, 0x10
   0B95 08 08                 3     .db 0x08, 0x08
   0B97 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline23_dw_size = . - cubeline23_dw
   0B99 01                    3     .db     0x01     ;; Hitpoints
   0B9A                      60 DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0B9A                       1 cubeline24:
   007E                       2     DefineDrawableEntity cubeline24_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   007E                       1 cubeline24_dw:
   0B9A 20 10                 2     .db 0x20, 0x10
   0B9C 08 08                 3     .db 0x08, 0x08
   0B9E 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline24_dw_size = . - cubeline24_dw
   0BA0 01                    3     .db     0x01     ;; Hitpoints
   0BA1                      61 DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0BA1                       1 cubeline25:
   0085                       2     DefineDrawableEntity cubeline25_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   0085                       1 cubeline25_dw:
   0BA1 28 10                 2     .db 0x28, 0x10
   0BA3 08 08                 3     .db 0x08, 0x08
   0BA5 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline25_dw_size = . - cubeline25_dw
   0BA7 01                    3     .db     0x01     ;; Hitpoints
   0BA8                      62 DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0BA8                       1 cubeline26:
   008C                       2     DefineDrawableEntity cubeline26_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



   008C                       1 cubeline26_dw:
   0BA8 30 10                 2     .db 0x30, 0x10
   0BAA 08 08                 3     .db 0x08, 0x08
   0BAC 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline26_dw_size = . - cubeline26_dw
   0BAE 01                    3     .db     0x01     ;; Hitpoints
   0BAF                      63 DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0BAF                       1 cubeline27:
   0093                       2     DefineDrawableEntity cubeline27_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   0093                       1 cubeline27_dw:
   0BAF 38 10                 2     .db 0x38, 0x10
   0BB1 08 08                 3     .db 0x08, 0x08
   0BB3 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline27_dw_size = . - cubeline27_dw
   0BB5 01                    3     .db     0x01     ;; Hitpoints
   0BB6                      64 DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0BB6                       1 cubeline28:
   009A                       2     DefineDrawableEntity cubeline28_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   009A                       1 cubeline28_dw:
   0BB6 40 10                 2     .db 0x40, 0x10
   0BB8 08 08                 3     .db 0x08, 0x08
   0BBA 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline28_dw_size = . - cubeline28_dw
   0BBC 01                    3     .db     0x01     ;; Hitpoints
   0BBD                      65 DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   0BBD                       1 cubeline29:
   00A1                       2     DefineDrawableEntity cubeline29_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   00A1                       1 cubeline29_dw:
   0BBD 48 10                 2     .db 0x48, 0x10
   0BBF 08 08                 3     .db 0x08, 0x08
   0BC1 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline29_dw_size = . - cubeline29_dw
   0BC3 01                    3     .db     0x01     ;; Hitpoints
                             66 
   0BC4                      67 DefineCubeLine1 cubeline30, 0x00, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BC4                       1 cubeline30:
   00A8                       2     DefineDrawableEntity cubeline30_dw, 0x00, 0x18, 0x08, 0x08, _cubeline_sp
   00A8                       1 cubeline30_dw:
   0BC4 00 18                 2     .db 0x00, 0x18
   0BC6 08 08                 3     .db 0x08, 0x08
   0BC8 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline30_dw_size = . - cubeline30_dw
   0BCA 01                    3     .db     0x01     ;; Hitpoints
   0BCB                      68 DefineCubeLine1 cubeline31, 0x08, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BCB                       1 cubeline31:
   00AF                       2     DefineDrawableEntity cubeline31_dw, 0x08, 0x18, 0x08, 0x08, _cubeline_sp
   00AF                       1 cubeline31_dw:
   0BCB 08 18                 2     .db 0x08, 0x18
   0BCD 08 08                 3     .db 0x08, 0x08
   0BCF 47 08                 4     .dw _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



                              5 
                     0006     6 cubeline31_dw_size = . - cubeline31_dw
   0BD1 01                    3     .db     0x01     ;; Hitpoints
   0BD2                      69 DefineCubeLine1 cubeline32, 0x10, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BD2                       1 cubeline32:
   00B6                       2     DefineDrawableEntity cubeline32_dw, 0x10, 0x18, 0x08, 0x08, _cubeline_sp
   00B6                       1 cubeline32_dw:
   0BD2 10 18                 2     .db 0x10, 0x18
   0BD4 08 08                 3     .db 0x08, 0x08
   0BD6 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline32_dw_size = . - cubeline32_dw
   0BD8 01                    3     .db     0x01     ;; Hitpoints
   0BD9                      70 DefineCubeLine1 cubeline33, 0x18, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BD9                       1 cubeline33:
   00BD                       2     DefineDrawableEntity cubeline33_dw, 0x18, 0x18, 0x08, 0x08, _cubeline_sp
   00BD                       1 cubeline33_dw:
   0BD9 18 18                 2     .db 0x18, 0x18
   0BDB 08 08                 3     .db 0x08, 0x08
   0BDD 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline33_dw_size = . - cubeline33_dw
   0BDF 01                    3     .db     0x01     ;; Hitpoints
   0BE0                      71 DefineCubeLine1 cubeline34, 0x20, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BE0                       1 cubeline34:
   00C4                       2     DefineDrawableEntity cubeline34_dw, 0x20, 0x18, 0x08, 0x08, _cubeline_sp
   00C4                       1 cubeline34_dw:
   0BE0 20 18                 2     .db 0x20, 0x18
   0BE2 08 08                 3     .db 0x08, 0x08
   0BE4 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline34_dw_size = . - cubeline34_dw
   0BE6 01                    3     .db     0x01     ;; Hitpoints
   0BE7                      72 DefineCubeLine1 cubeline35, 0x28, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BE7                       1 cubeline35:
   00CB                       2     DefineDrawableEntity cubeline35_dw, 0x28, 0x18, 0x08, 0x08, _cubeline_sp
   00CB                       1 cubeline35_dw:
   0BE7 28 18                 2     .db 0x28, 0x18
   0BE9 08 08                 3     .db 0x08, 0x08
   0BEB 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline35_dw_size = . - cubeline35_dw
   0BED 01                    3     .db     0x01     ;; Hitpoints
   0BEE                      73 DefineCubeLine1 cubeline36, 0x30, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BEE                       1 cubeline36:
   00D2                       2     DefineDrawableEntity cubeline36_dw, 0x30, 0x18, 0x08, 0x08, _cubeline_sp
   00D2                       1 cubeline36_dw:
   0BEE 30 18                 2     .db 0x30, 0x18
   0BF0 08 08                 3     .db 0x08, 0x08
   0BF2 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline36_dw_size = . - cubeline36_dw
   0BF4 01                    3     .db     0x01     ;; Hitpoints
   0BF5                      74 DefineCubeLine1 cubeline37, 0x38, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BF5                       1 cubeline37:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   00D9                       2     DefineDrawableEntity cubeline37_dw, 0x38, 0x18, 0x08, 0x08, _cubeline_sp
   00D9                       1 cubeline37_dw:
   0BF5 38 18                 2     .db 0x38, 0x18
   0BF7 08 08                 3     .db 0x08, 0x08
   0BF9 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline37_dw_size = . - cubeline37_dw
   0BFB 01                    3     .db     0x01     ;; Hitpoints
   0BFC                      75 DefineCubeLine1 cubeline38, 0x40, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0BFC                       1 cubeline38:
   00E0                       2     DefineDrawableEntity cubeline38_dw, 0x40, 0x18, 0x08, 0x08, _cubeline_sp
   00E0                       1 cubeline38_dw:
   0BFC 40 18                 2     .db 0x40, 0x18
   0BFE 08 08                 3     .db 0x08, 0x08
   0C00 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline38_dw_size = . - cubeline38_dw
   0C02 01                    3     .db     0x01     ;; Hitpoints
   0C03                      76 DefineCubeLine1 cubeline39, 0x48, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
   0C03                       1 cubeline39:
   00E7                       2     DefineDrawableEntity cubeline39_dw, 0x48, 0x18, 0x08, 0x08, _cubeline_sp
   00E7                       1 cubeline39_dw:
   0C03 48 18                 2     .db 0x48, 0x18
   0C05 08 08                 3     .db 0x08, 0x08
   0C07 47 08                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline39_dw_size = . - cubeline39_dw
   0C09 01                    3     .db     0x01     ;; Hitpoints
                             77 ;;
   0C0A                      78 DefineCubeLine1 cubeline40, 0x00, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C0A                       1 cubeline40:
   00EE                       2     DefineDrawableEntity cubeline40_dw, 0x00, 0x20, 0x08, 0x08, _cubeline2_sp
   00EE                       1 cubeline40_dw:
   0C0A 00 20                 2     .db 0x00, 0x20
   0C0C 08 08                 3     .db 0x08, 0x08
   0C0E F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline40_dw_size = . - cubeline40_dw
   0C10 02                    3     .db     0x02     ;; Hitpoints
   0C11                      79 DefineCubeLine1 cubeline41, 0x08, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C11                       1 cubeline41:
   00F5                       2     DefineDrawableEntity cubeline41_dw, 0x08, 0x20, 0x08, 0x08, _cubeline2_sp
   00F5                       1 cubeline41_dw:
   0C11 08 20                 2     .db 0x08, 0x20
   0C13 08 08                 3     .db 0x08, 0x08
   0C15 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline41_dw_size = . - cubeline41_dw
   0C17 02                    3     .db     0x02     ;; Hitpoints
   0C18                      80 DefineCubeLine1 cubeline42, 0x10, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C18                       1 cubeline42:
   00FC                       2     DefineDrawableEntity cubeline42_dw, 0x10, 0x20, 0x08, 0x08, _cubeline2_sp
   00FC                       1 cubeline42_dw:
   0C18 10 20                 2     .db 0x10, 0x20
   0C1A 08 08                 3     .db 0x08, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   0C1C F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline42_dw_size = . - cubeline42_dw
   0C1E 02                    3     .db     0x02     ;; Hitpoints
   0C1F                      81 DefineCubeLine1 cubeline43, 0x18, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C1F                       1 cubeline43:
   0103                       2     DefineDrawableEntity cubeline43_dw, 0x18, 0x20, 0x08, 0x08, _cubeline2_sp
   0103                       1 cubeline43_dw:
   0C1F 18 20                 2     .db 0x18, 0x20
   0C21 08 08                 3     .db 0x08, 0x08
   0C23 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline43_dw_size = . - cubeline43_dw
   0C25 02                    3     .db     0x02     ;; Hitpoints
   0C26                      82 DefineCubeLine1 cubeline44, 0x20, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C26                       1 cubeline44:
   010A                       2     DefineDrawableEntity cubeline44_dw, 0x20, 0x20, 0x08, 0x08, _cubeline2_sp
   010A                       1 cubeline44_dw:
   0C26 20 20                 2     .db 0x20, 0x20
   0C28 08 08                 3     .db 0x08, 0x08
   0C2A F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline44_dw_size = . - cubeline44_dw
   0C2C 02                    3     .db     0x02     ;; Hitpoints
   0C2D                      83 DefineCubeLine1 cubeline45, 0x28, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C2D                       1 cubeline45:
   0111                       2     DefineDrawableEntity cubeline45_dw, 0x28, 0x20, 0x08, 0x08, _cubeline2_sp
   0111                       1 cubeline45_dw:
   0C2D 28 20                 2     .db 0x28, 0x20
   0C2F 08 08                 3     .db 0x08, 0x08
   0C31 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline45_dw_size = . - cubeline45_dw
   0C33 02                    3     .db     0x02     ;; Hitpoints
   0C34                      84 DefineCubeLine1 cubeline46, 0x30, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C34                       1 cubeline46:
   0118                       2     DefineDrawableEntity cubeline46_dw, 0x30, 0x20, 0x08, 0x08, _cubeline2_sp
   0118                       1 cubeline46_dw:
   0C34 30 20                 2     .db 0x30, 0x20
   0C36 08 08                 3     .db 0x08, 0x08
   0C38 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline46_dw_size = . - cubeline46_dw
   0C3A 02                    3     .db     0x02     ;; Hitpoints
   0C3B                      85 DefineCubeLine1 cubeline47, 0x38, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C3B                       1 cubeline47:
   011F                       2     DefineDrawableEntity cubeline47_dw, 0x38, 0x20, 0x08, 0x08, _cubeline2_sp
   011F                       1 cubeline47_dw:
   0C3B 38 20                 2     .db 0x38, 0x20
   0C3D 08 08                 3     .db 0x08, 0x08
   0C3F F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline47_dw_size = . - cubeline47_dw
   0C41 02                    3     .db     0x02     ;; Hitpoints
   0C42                      86 DefineCubeLine1 cubeline48, 0x40, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   0C42                       1 cubeline48:
   0126                       2     DefineDrawableEntity cubeline48_dw, 0x40, 0x20, 0x08, 0x08, _cubeline2_sp
   0126                       1 cubeline48_dw:
   0C42 40 20                 2     .db 0x40, 0x20
   0C44 08 08                 3     .db 0x08, 0x08
   0C46 F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline48_dw_size = . - cubeline48_dw
   0C48 02                    3     .db     0x02     ;; Hitpoints
   0C49                      87 DefineCubeLine1 cubeline49, 0x48, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
   0C49                       1 cubeline49:
   012D                       2     DefineDrawableEntity cubeline49_dw, 0x48, 0x20, 0x08, 0x08, _cubeline2_sp
   012D                       1 cubeline49_dw:
   0C49 48 20                 2     .db 0x48, 0x20
   0C4B 08 08                 3     .db 0x08, 0x08
   0C4D F7 07                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline49_dw_size = . - cubeline49_dw
   0C4F 02                    3     .db     0x02     ;; Hitpoints
                             88 
                             89 
   0C50 28                   90 m_num_cube: .db 40
                             91 
                             92 
   0C51                      93 cube_clear:
                             94 
   0C51 C9            [10]   95 ret
                             96 
   0C52                      97 cube_draw:
   0C52 DD 21 38 0B   [14]   98 ld ix,#cubeline10
   0C56 3E 28         [ 7]   99 ld a,#k_max_cube_line
                            100 
   0C58                     101 rep:
   0C58 F5            [11]  102 push af
   0C59 CD 67 0C      [17]  103 call cube_drawAll
                            104 
   0C5C 11 07 00      [10]  105 ld de,#k_cube_size
   0C5F DD 19         [15]  106 add ix, de
   0C61 F1            [10]  107 pop af
   0C62 3D            [ 4]  108 dec a
                            109 
   0C63 C2 58 0C      [10]  110 jp nz,rep
                            111 
                            112 
   0C66 C9            [10]  113 ret
                            114 
                            115 
                            116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            117 ;; DRAW ENTITY
                            118 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            119 ;; INPUT: IX -> Points to entity
                            120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0C67                     121 cube_drawAll:
                            122 
   0C67 DD 7E 06      [19]  123 	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   0C6A D6 01         [ 7]  124 	sub #1					;;
                            125 
   0C6C C2 73 0C      [10]  126 	jp nz, ommit
                            127 
   0C6F CD 31 09      [17]  128 	call render_drawCube
   0C72 C9            [10]  129 	ret
   0C73                     130 	ommit:					;;IF HP != 2 CHECK AGAIN
   0C73 D6 01         [ 7]  131 	sub #1					;;
                            132 	
   0C75 C2 7B 0C      [10]  133 	jp nz, ommit2
                            134 
   0C78 CD 31 09      [17]  135 	call render_drawCube
                            136 
   0C7B                     137  	ommit2:					;;IF HP != 3 CHECK AGAIN
   0C7B D6 01         [ 7]  138 	sub #1					;;
                            139 	
   0C7D C2 83 0C      [10]  140 	jp nz, ommit3
                            141 
   0C80 CD 31 09      [17]  142 	call render_drawCube
                            143 
   0C83                     144  	ommit3:					;;HP == 0 ;NOT DRAW
   0C83 C9            [10]  145 	ret
                            146 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            147 ;; BORRA UNA ENTIDAD
                            148 ;; PARA CUADRADOS UNICAMENTE
                            149 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            150 ;; ENTRADA: IX -> Puntero a entidad
                            151 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0C84                     152 cube_clearAll:
                            153 
                            154 ;;   ld  a, dc_col(ix)
                            155 ;;   ex af, af'
                            156 ;;
                            157 ;;   ld  dc_col(ix), #0
                            158 ;;
                            159 ;;   call render_drawCube
                            160 ;;   ex af, af'
                            161 ;;   ld dc_col(ix), a
                            162 
   0C84 C9            [10]  163    ret
                            164 
                            165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            166 ;;
                            167 ;;RESET CUBES TO FIRST STATE
                            168 ;;
                            169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   0C85                     170 cube_reset:
                            171 
   0C85 CD D2 0A      [17]  172 	call ball_reset
                            173 
   0C88 21 38 0B      [10]  174 	ld hl, #cubeline10
   0C8B 1E 00         [ 7]  175 	ld e, #0
   0C8D 16 00         [ 7]  176 	ld d, #0
   0C8F 0E 00         [ 7]  177 	ld c, #0
   0C91 DD 21 1C 0B   [14]  178 	ld ix, #cubedefault
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



                            179 
   0C95                     180 	bucl2:
   0C95                     181 	bucl:
                            182 
   0C95 7A            [ 4]  183 	ld a,d 
                            184 
   0C96 77            [ 7]  185 	ld (hl),a
                            186 
   0C97 C6 08         [ 7]  187 	add #8
                            188 
   0C99 57            [ 4]  189 	ld d,a
   0C9A 23            [ 6]  190 	inc hl
                            191 
                            192 
   0C9B DD 7E 01      [19]  193 	ld a, dc_y(ix)
   0C9E 77            [ 7]  194 	ld (hl),a
                            195 	
   0C9F 23            [ 6]  196     inc hl
                            197 
   0CA0 DD 7E 02      [19]  198     ld a, dc_w(ix)
   0CA3 77            [ 7]  199 	ld (hl),a
                            200     
   0CA4 23            [ 6]  201 	inc hl
                            202 
   0CA5 DD 7E 03      [19]  203     ld a, dc_h(ix)
   0CA8 77            [ 7]  204 	ld (hl),a
                            205     	
   0CA9 23            [ 6]  206 	inc hl
                            207     	
   0CAA DD 7E 04      [19]  208    ld a, dc_sp_l(ix)
   0CAD 77            [ 7]  209    ld (hl), a
                            210 
   0CAE 23            [ 6]  211     	inc hl
                            212 
   0CAF DD 7E 05      [19]  213     ld a, dc_sp_h(ix)
   0CB2 77            [ 7]  214     ld (hl),a
                            215 
   0CB3 23            [ 6]  216    	inc hl	
                            217 
   0CB4 DD 7E 06      [19]  218     ld a, c_hp(ix)
   0CB7 77            [ 7]  219     ld (hl),a
                            220 
   0CB8 23            [ 6]  221     	inc hl
                            222 
   0CB9 7B            [ 4]  223   	ld a,e
   0CBA C6 01         [ 7]  224   	add #1
                            225 
   0CBC 5F            [ 4]  226   	ld e,a
                            227 
   0CBD D6 0A         [ 7]  228   	sub #k_cubos_linea
                            229 
   0CBF 20 D4         [12]  230     	jr nz, bucl
                            231 
   0CC1 79            [ 4]  232     	ld a, c
                            233 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   0CC2 C6 01         [ 7]  234     	add #1
                            235 
   0CC4 4F            [ 4]  236     	ld c, a
                            237 
   0CC5 D6 04         [ 7]  238     	sub #k_num_line
                            239 
   0CC7 11 07 00      [10]  240     	ld de, #k_cube_size
   0CCA DD 19         [15]  241 	add ix, de
                            242 
   0CCC 16 00         [ 7]  243 	ld d, #0
   0CCE 1E 00         [ 7]  244 	ld e, #0
                            245 
   0CD0 20 C3         [12]  246     	jr nz, bucl2
                            247 
                            248     	
                            249 
   0CD2 C9            [10]  250  ret
                            251 
                            252 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            253 ;; CUBE LOOSES 1 LIFE
                            254 ;; REGISTERS DESTROYED: DE, AF
                            255 ;; INPUT: HL -> CUBE_X
                            256 ;; OUTPUT : HL -> CUBE_X
                            257 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   0CD3                     258 cube_loses_life:
                            259 	
   0CD3 11 06 00      [10]  260 	ld de, #6			;;DE = 6
   0CD6 19            [11]  261 	add hl,de			;;HL + DE 
                            262 
   0CD7 7E            [ 7]  263 	ld a,(hl)			;;A = C_HP
   0CD8 D6 01         [ 7]  264 	sub #1				
   0CDA 77            [ 7]  265 	ld (hl),a			;;C_HP = C_HP - 1
                            266 
   0CDB CA E3 0C      [10]  267 	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT
                            268 
   0CDE 11 FA FF      [10]  269 	ld de, #-6			;;IF NOT, HL -> DC_X
   0CE1 19            [11]  270 	add hl,de
                            271 
                            272 
   0CE2 C9            [10]  273 ret
                            274 
                            275 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            276 ;; CUBE GETS DESTROYED
                            277 ;; REGISTERS DESTROYED: DE, AF
                            278 ;; INPUT: HL -> CUBE_HP
                            279 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            280 
   0CE3                     281 destroy_cube:
   0CE3 11 FA FF      [10]  282 	ld de, #-6			;; 
   0CE6 19            [11]  283 	add hl,de			;; HL -> DC_X
   0CE7 36 FF         [10]  284 	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
   0CE9 23            [ 6]  285 	inc hl
   0CEA 36 FF         [10]  286 	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
   0CEC 2B            [ 6]  287 	dec hl				;; HL -> DC_X
                            288 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



   0CED 3A 50 0C      [13]  289 	ld a, (m_num_cube)	;;
   0CF0 D6 01         [ 7]  290 	sub #1				;;
   0CF2 32 50 0C      [13]  291 	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1
                            292 
   0CF5 CA 85 0C      [10]  293 	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL
                            294 
   0CF8 C9            [10]  295 ret
                            296 
