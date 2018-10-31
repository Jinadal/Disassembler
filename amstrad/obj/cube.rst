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
   464B                      40 DefineCubeLine1 cubedefault, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp, 0x03
   464B                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   0000                       1 cubedefault_dw:
   464B 00 08                 2     .db 0x00, 0x08
   464D 08 08                 3     .db 0x08, 0x08
   464F 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   4651 03                    3     .db     0x03     ;; Hitpoints
   4652                      41 DefineCubeLine1 cubedefault1, 0x00, 0x10, 0x08, 0x08, _cubeline_sp, 0x01
   4652                       1 cubedefault1:
   0007                       2     DefineDrawableEntity cubedefault1_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0007                       1 cubedefault1_dw:
   4652 00 10                 2     .db 0x00, 0x10
   4654 08 08                 3     .db 0x08, 0x08
   4656 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault1_dw_size = . - cubedefault1_dw
   4658 01                    3     .db     0x01     ;; Hitpoints
   4659                      42 DefineCubeLine1 cubedefault2, 0x00, 0x20, 0x08, 0x08, _cubeline_sp, 0x01
   4659                       1 cubedefault2:
   000E                       2     DefineDrawableEntity cubedefault2_dw, 0x00, 0x20, 0x08, 0x08, _cubeline_sp
   000E                       1 cubedefault2_dw:
   4659 00 20                 2     .db 0x00, 0x20
   465B 08 08                 3     .db 0x08, 0x08
   465D 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault2_dw_size = . - cubedefault2_dw
   465F 01                    3     .db     0x01     ;; Hitpoints
   4660                      43 DefineCubeLine1 cubedefault3, 0x00, 0x18, 0x08, 0x08, _cubeline2_sp, 0x02
   4660                       1 cubedefault3:
   0015                       2     DefineDrawableEntity cubedefault3_dw, 0x00, 0x18, 0x08, 0x08, _cubeline2_sp
   0015                       1 cubedefault3_dw:
   4660 00 18                 2     .db 0x00, 0x18
   4662 08 08                 3     .db 0x08, 0x08
   4664 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubedefault3_dw_size = . - cubedefault3_dw
   4666 02                    3     .db     0x02     ;; Hitpoints
                             44 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                             45 
                             46 
   4667                      47 DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4667                       1 cubeline10:
   001C                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x08, 0x08, 0x08, _cubeline3_sp
   001C                       1 cubeline10_dw:
   4667 00 08                 2     .db 0x00, 0x08
   4669 08 08                 3     .db 0x08, 0x08
   466B 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   466D 03                    3     .db     0x03     ;; Hitpoints
   466E                      48 DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   466E                       1 cubeline11:
   0023                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x08, 0x08, 0x08, _cubeline3_sp
   0023                       1 cubeline11_dw:
   466E 08 08                 2     .db 0x08, 0x08
   4670 08 08                 3     .db 0x08, 0x08
   4672 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   4674 03                    3     .db     0x03     ;; Hitpoints
   4675                      49 DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4675                       1 cubeline12:
   002A                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x08, 0x08, 0x08, _cubeline3_sp
   002A                       1 cubeline12_dw:
   4675 10 08                 2     .db 0x10, 0x08
   4677 08 08                 3     .db 0x08, 0x08
   4679 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   467B 03                    3     .db     0x03     ;; Hitpoints
   467C                      50 DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   467C                       1 cubeline13:
   0031                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x08, 0x08, 0x08, _cubeline3_sp
   0031                       1 cubeline13_dw:
   467C 18 08                 2     .db 0x18, 0x08
   467E 08 08                 3     .db 0x08, 0x08
   4680 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   4682 03                    3     .db     0x03     ;; Hitpoints
   4683                      51 DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4683                       1 cubeline14:
   0038                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x08, 0x08, 0x08, _cubeline3_sp
   0038                       1 cubeline14_dw:
   4683 20 08                 2     .db 0x20, 0x08
   4685 08 08                 3     .db 0x08, 0x08
   4687 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   4689 03                    3     .db     0x03     ;; Hitpoints
   468A                      52 DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   468A                       1 cubeline15:
   003F                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x08, 0x08, 0x08, _cubeline3_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



   003F                       1 cubeline15_dw:
   468A 28 08                 2     .db 0x28, 0x08
   468C 08 08                 3     .db 0x08, 0x08
   468E 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   4690 03                    3     .db     0x03     ;; Hitpoints
   4691                      53 DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4691                       1 cubeline16:
   0046                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x08, 0x08, 0x08, _cubeline3_sp
   0046                       1 cubeline16_dw:
   4691 30 08                 2     .db 0x30, 0x08
   4693 08 08                 3     .db 0x08, 0x08
   4695 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
   4697 03                    3     .db     0x03     ;; Hitpoints
   4698                      54 DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   4698                       1 cubeline17:
   004D                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x08, 0x08, 0x08, _cubeline3_sp
   004D                       1 cubeline17_dw:
   4698 38 08                 2     .db 0x38, 0x08
   469A 08 08                 3     .db 0x08, 0x08
   469C 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   469E 03                    3     .db     0x03     ;; Hitpoints
   469F                      55 DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   469F                       1 cubeline18:
   0054                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x08, 0x08, 0x08, _cubeline3_sp
   0054                       1 cubeline18_dw:
   469F 40 08                 2     .db 0x40, 0x08
   46A1 08 08                 3     .db 0x08, 0x08
   46A3 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   46A5 03                    3     .db     0x03     ;; Hitpoints
   46A6                      56 DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
   46A6                       1 cubeline19:
   005B                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x08, 0x08, 0x08, _cubeline3_sp
   005B                       1 cubeline19_dw:
   46A6 48 08                 2     .db 0x48, 0x08
   46A8 08 08                 3     .db 0x08, 0x08
   46AA 87 28                 4     .dw _cubeline3_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   46AC 03                    3     .db     0x03     ;; Hitpoints
                             57 
   46AD                      58 DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46AD                       1 cubeline20:
   0062                       2     DefineDrawableEntity cubeline20_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0062                       1 cubeline20_dw:
   46AD 00 10                 2     .db 0x00, 0x10
   46AF 08 08                 3     .db 0x08, 0x08
   46B1 27 29                 4     .dw _cubeline_sp
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 12.
Hexadecimal [16-Bits]



                              5 
                     0006     6 cubeline20_dw_size = . - cubeline20_dw
   46B3 01                    3     .db     0x01     ;; Hitpoints
   46B4                      59 DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46B4                       1 cubeline21:
   0069                       2     DefineDrawableEntity cubeline21_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   0069                       1 cubeline21_dw:
   46B4 08 10                 2     .db 0x08, 0x10
   46B6 08 08                 3     .db 0x08, 0x08
   46B8 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline21_dw_size = . - cubeline21_dw
   46BA 01                    3     .db     0x01     ;; Hitpoints
   46BB                      60 DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46BB                       1 cubeline22:
   0070                       2     DefineDrawableEntity cubeline22_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
   0070                       1 cubeline22_dw:
   46BB 10 10                 2     .db 0x10, 0x10
   46BD 08 08                 3     .db 0x08, 0x08
   46BF 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline22_dw_size = . - cubeline22_dw
   46C1 01                    3     .db     0x01     ;; Hitpoints
   46C2                      61 DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46C2                       1 cubeline23:
   0077                       2     DefineDrawableEntity cubeline23_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   0077                       1 cubeline23_dw:
   46C2 18 10                 2     .db 0x18, 0x10
   46C4 08 08                 3     .db 0x08, 0x08
   46C6 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline23_dw_size = . - cubeline23_dw
   46C8 01                    3     .db     0x01     ;; Hitpoints
   46C9                      62 DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46C9                       1 cubeline24:
   007E                       2     DefineDrawableEntity cubeline24_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   007E                       1 cubeline24_dw:
   46C9 20 10                 2     .db 0x20, 0x10
   46CB 08 08                 3     .db 0x08, 0x08
   46CD 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline24_dw_size = . - cubeline24_dw
   46CF 01                    3     .db     0x01     ;; Hitpoints
   46D0                      63 DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46D0                       1 cubeline25:
   0085                       2     DefineDrawableEntity cubeline25_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   0085                       1 cubeline25_dw:
   46D0 28 10                 2     .db 0x28, 0x10
   46D2 08 08                 3     .db 0x08, 0x08
   46D4 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline25_dw_size = . - cubeline25_dw
   46D6 01                    3     .db     0x01     ;; Hitpoints
   46D7                      64 DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46D7                       1 cubeline26:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 13.
Hexadecimal [16-Bits]



   008C                       2     DefineDrawableEntity cubeline26_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   008C                       1 cubeline26_dw:
   46D7 30 10                 2     .db 0x30, 0x10
   46D9 08 08                 3     .db 0x08, 0x08
   46DB 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline26_dw_size = . - cubeline26_dw
   46DD 01                    3     .db     0x01     ;; Hitpoints
   46DE                      65 DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46DE                       1 cubeline27:
   0093                       2     DefineDrawableEntity cubeline27_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   0093                       1 cubeline27_dw:
   46DE 38 10                 2     .db 0x38, 0x10
   46E0 08 08                 3     .db 0x08, 0x08
   46E2 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline27_dw_size = . - cubeline27_dw
   46E4 01                    3     .db     0x01     ;; Hitpoints
   46E5                      66 DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46E5                       1 cubeline28:
   009A                       2     DefineDrawableEntity cubeline28_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   009A                       1 cubeline28_dw:
   46E5 40 10                 2     .db 0x40, 0x10
   46E7 08 08                 3     .db 0x08, 0x08
   46E9 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline28_dw_size = . - cubeline28_dw
   46EB 01                    3     .db     0x01     ;; Hitpoints
   46EC                      67 DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   46EC                       1 cubeline29:
   00A1                       2     DefineDrawableEntity cubeline29_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   00A1                       1 cubeline29_dw:
   46EC 48 10                 2     .db 0x48, 0x10
   46EE 08 08                 3     .db 0x08, 0x08
   46F0 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline29_dw_size = . - cubeline29_dw
   46F2 01                    3     .db     0x01     ;; Hitpoints
                             68 
   46F3                      69 DefineCubeLine1 cubeline30, 0x00, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   46F3                       1 cubeline30:
   00A8                       2     DefineDrawableEntity cubeline30_dw, 0x00, 0x20, 0x08, 0x08, _cubeline_sp
   00A8                       1 cubeline30_dw:
   46F3 00 20                 2     .db 0x00, 0x20
   46F5 08 08                 3     .db 0x08, 0x08
   46F7 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline30_dw_size = . - cubeline30_dw
   46F9 01                    3     .db     0x01     ;; Hitpoints
   46FA                      70 DefineCubeLine1 cubeline31, 0x08, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   46FA                       1 cubeline31:
   00AF                       2     DefineDrawableEntity cubeline31_dw, 0x08, 0x20, 0x08, 0x08, _cubeline_sp
   00AF                       1 cubeline31_dw:
   46FA 08 20                 2     .db 0x08, 0x20
   46FC 08 08                 3     .db 0x08, 0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 14.
Hexadecimal [16-Bits]



   46FE 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline31_dw_size = . - cubeline31_dw
   4700 01                    3     .db     0x01     ;; Hitpoints
   4701                      71 DefineCubeLine1 cubeline32, 0x10, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   4701                       1 cubeline32:
   00B6                       2     DefineDrawableEntity cubeline32_dw, 0x10, 0x20, 0x08, 0x08, _cubeline_sp
   00B6                       1 cubeline32_dw:
   4701 10 20                 2     .db 0x10, 0x20
   4703 08 08                 3     .db 0x08, 0x08
   4705 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline32_dw_size = . - cubeline32_dw
   4707 01                    3     .db     0x01     ;; Hitpoints
   4708                      72 DefineCubeLine1 cubeline33, 0x18, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   4708                       1 cubeline33:
   00BD                       2     DefineDrawableEntity cubeline33_dw, 0x18, 0x20, 0x08, 0x08, _cubeline_sp
   00BD                       1 cubeline33_dw:
   4708 18 20                 2     .db 0x18, 0x20
   470A 08 08                 3     .db 0x08, 0x08
   470C 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline33_dw_size = . - cubeline33_dw
   470E 01                    3     .db     0x01     ;; Hitpoints
   470F                      73 DefineCubeLine1 cubeline34, 0x20, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   470F                       1 cubeline34:
   00C4                       2     DefineDrawableEntity cubeline34_dw, 0x20, 0x20, 0x08, 0x08, _cubeline_sp
   00C4                       1 cubeline34_dw:
   470F 20 20                 2     .db 0x20, 0x20
   4711 08 08                 3     .db 0x08, 0x08
   4713 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline34_dw_size = . - cubeline34_dw
   4715 01                    3     .db     0x01     ;; Hitpoints
   4716                      74 DefineCubeLine1 cubeline35, 0x28, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   4716                       1 cubeline35:
   00CB                       2     DefineDrawableEntity cubeline35_dw, 0x28, 0x20, 0x08, 0x08, _cubeline_sp
   00CB                       1 cubeline35_dw:
   4716 28 20                 2     .db 0x28, 0x20
   4718 08 08                 3     .db 0x08, 0x08
   471A 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline35_dw_size = . - cubeline35_dw
   471C 01                    3     .db     0x01     ;; Hitpoints
   471D                      75 DefineCubeLine1 cubeline36, 0x30, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   471D                       1 cubeline36:
   00D2                       2     DefineDrawableEntity cubeline36_dw, 0x30, 0x20, 0x08, 0x08, _cubeline_sp
   00D2                       1 cubeline36_dw:
   471D 30 20                 2     .db 0x30, 0x20
   471F 08 08                 3     .db 0x08, 0x08
   4721 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline36_dw_size = . - cubeline36_dw
   4723 01                    3     .db     0x01     ;; Hitpoints
   4724                      76 DefineCubeLine1 cubeline37, 0x38, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 15.
Hexadecimal [16-Bits]



   4724                       1 cubeline37:
   00D9                       2     DefineDrawableEntity cubeline37_dw, 0x38, 0x20, 0x08, 0x08, _cubeline_sp
   00D9                       1 cubeline37_dw:
   4724 38 20                 2     .db 0x38, 0x20
   4726 08 08                 3     .db 0x08, 0x08
   4728 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline37_dw_size = . - cubeline37_dw
   472A 01                    3     .db     0x01     ;; Hitpoints
   472B                      77 DefineCubeLine1 cubeline38, 0x40, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   472B                       1 cubeline38:
   00E0                       2     DefineDrawableEntity cubeline38_dw, 0x40, 0x20, 0x08, 0x08, _cubeline_sp
   00E0                       1 cubeline38_dw:
   472B 40 20                 2     .db 0x40, 0x20
   472D 08 08                 3     .db 0x08, 0x08
   472F 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline38_dw_size = . - cubeline38_dw
   4731 01                    3     .db     0x01     ;; Hitpoints
   4732                      78 DefineCubeLine1 cubeline39, 0x48, 0x20, 0x08, 0x08,_cubeline_sp, 0x01
   4732                       1 cubeline39:
   00E7                       2     DefineDrawableEntity cubeline39_dw, 0x48, 0x20, 0x08, 0x08, _cubeline_sp
   00E7                       1 cubeline39_dw:
   4732 48 20                 2     .db 0x48, 0x20
   4734 08 08                 3     .db 0x08, 0x08
   4736 27 29                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline39_dw_size = . - cubeline39_dw
   4738 01                    3     .db     0x01     ;; Hitpoints
                             79 
   4739                      80 DefineCubeLine1 cubeline40, 0x00, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4739                       1 cubeline40:
   00EE                       2     DefineDrawableEntity cubeline40_dw, 0x00, 0x18, 0x08, 0x08, _cubeline2_sp
   00EE                       1 cubeline40_dw:
   4739 00 18                 2     .db 0x00, 0x18
   473B 08 08                 3     .db 0x08, 0x08
   473D D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline40_dw_size = . - cubeline40_dw
   473F 02                    3     .db     0x02     ;; Hitpoints
   4740                      81 DefineCubeLine1 cubeline41, 0x08, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4740                       1 cubeline41:
   00F5                       2     DefineDrawableEntity cubeline41_dw, 0x08, 0x18, 0x08, 0x08, _cubeline2_sp
   00F5                       1 cubeline41_dw:
   4740 08 18                 2     .db 0x08, 0x18
   4742 08 08                 3     .db 0x08, 0x08
   4744 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline41_dw_size = . - cubeline41_dw
   4746 02                    3     .db     0x02     ;; Hitpoints
   4747                      82 DefineCubeLine1 cubeline42, 0x10, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4747                       1 cubeline42:
   00FC                       2     DefineDrawableEntity cubeline42_dw, 0x10, 0x18, 0x08, 0x08, _cubeline2_sp
   00FC                       1 cubeline42_dw:
   4747 10 18                 2     .db 0x10, 0x18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 16.
Hexadecimal [16-Bits]



   4749 08 08                 3     .db 0x08, 0x08
   474B D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline42_dw_size = . - cubeline42_dw
   474D 02                    3     .db     0x02     ;; Hitpoints
   474E                      83 DefineCubeLine1 cubeline43, 0x18, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   474E                       1 cubeline43:
   0103                       2     DefineDrawableEntity cubeline43_dw, 0x18, 0x18, 0x08, 0x08, _cubeline2_sp
   0103                       1 cubeline43_dw:
   474E 18 18                 2     .db 0x18, 0x18
   4750 08 08                 3     .db 0x08, 0x08
   4752 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline43_dw_size = . - cubeline43_dw
   4754 02                    3     .db     0x02     ;; Hitpoints
   4755                      84 DefineCubeLine1 cubeline44, 0x20, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4755                       1 cubeline44:
   010A                       2     DefineDrawableEntity cubeline44_dw, 0x20, 0x18, 0x08, 0x08, _cubeline2_sp
   010A                       1 cubeline44_dw:
   4755 20 18                 2     .db 0x20, 0x18
   4757 08 08                 3     .db 0x08, 0x08
   4759 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline44_dw_size = . - cubeline44_dw
   475B 02                    3     .db     0x02     ;; Hitpoints
   475C                      85 DefineCubeLine1 cubeline45, 0x28, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   475C                       1 cubeline45:
   0111                       2     DefineDrawableEntity cubeline45_dw, 0x28, 0x18, 0x08, 0x08, _cubeline2_sp
   0111                       1 cubeline45_dw:
   475C 28 18                 2     .db 0x28, 0x18
   475E 08 08                 3     .db 0x08, 0x08
   4760 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline45_dw_size = . - cubeline45_dw
   4762 02                    3     .db     0x02     ;; Hitpoints
   4763                      86 DefineCubeLine1 cubeline46, 0x30, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4763                       1 cubeline46:
   0118                       2     DefineDrawableEntity cubeline46_dw, 0x30, 0x18, 0x08, 0x08, _cubeline2_sp
   0118                       1 cubeline46_dw:
   4763 30 18                 2     .db 0x30, 0x18
   4765 08 08                 3     .db 0x08, 0x08
   4767 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline46_dw_size = . - cubeline46_dw
   4769 02                    3     .db     0x02     ;; Hitpoints
   476A                      87 DefineCubeLine1 cubeline47, 0x38, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   476A                       1 cubeline47:
   011F                       2     DefineDrawableEntity cubeline47_dw, 0x38, 0x18, 0x08, 0x08, _cubeline2_sp
   011F                       1 cubeline47_dw:
   476A 38 18                 2     .db 0x38, 0x18
   476C 08 08                 3     .db 0x08, 0x08
   476E D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline47_dw_size = . - cubeline47_dw
   4770 02                    3     .db     0x02     ;; Hitpoints
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 17.
Hexadecimal [16-Bits]



   4771                      88 DefineCubeLine1 cubeline48, 0x40, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4771                       1 cubeline48:
   0126                       2     DefineDrawableEntity cubeline48_dw, 0x40, 0x18, 0x08, 0x08, _cubeline2_sp
   0126                       1 cubeline48_dw:
   4771 40 18                 2     .db 0x40, 0x18
   4773 08 08                 3     .db 0x08, 0x08
   4775 D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline48_dw_size = . - cubeline48_dw
   4777 02                    3     .db     0x02     ;; Hitpoints
   4778                      89 DefineCubeLine1 cubeline49, 0x48, 0x18, 0x08, 0x08,_cubeline2_sp, 0x02
   4778                       1 cubeline49:
   012D                       2     DefineDrawableEntity cubeline49_dw, 0x48, 0x18, 0x08, 0x08, _cubeline2_sp
   012D                       1 cubeline49_dw:
   4778 48 18                 2     .db 0x48, 0x18
   477A 08 08                 3     .db 0x08, 0x08
   477C D7 28                 4     .dw _cubeline2_sp
                              5 
                     0006     6 cubeline49_dw_size = . - cubeline49_dw
   477E 02                    3     .db     0x02     ;; Hitpoints
                             90 ;;
                             91 
                             92 
                             93 
   477F 28                   94 m_num_cube: .db 40
                             95 
                             96 
   4780                      97 cube_clear:
                             98 
   4780 C9            [10]   99 ret
                            100 
   4781                     101 cube_draw:
   4781 DD 21 67 46   [14]  102 ld ix,#cubeline10
   4785 3E 28         [ 7]  103 ld a,#k_max_cube_line
                            104 
   4787                     105 rep:
   4787 F5            [11]  106 push af
   4788 CD 96 47      [17]  107 call cube_drawAll
                            108 
   478B 11 07 00      [10]  109 ld de,#k_cube_size
   478E DD 19         [15]  110 add ix, de
   4790 F1            [10]  111 pop af
   4791 3D            [ 4]  112 dec a
                            113 
   4792 C2 87 47      [10]  114 jp nz,rep
                            115 
                            116 
   4795 C9            [10]  117 ret
                            118 
                            119 
                            120 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            121 ;; DRAW ENTITY
                            122 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            123 ;; INPUT: IX -> Points to entity
                            124 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 18.
Hexadecimal [16-Bits]



   4796                     125 cube_drawAll:
                            126 
   4796 DD 7E 06      [19]  127 	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
   4799 D6 01         [ 7]  128 	sub #1					;;
                            129 
   479B C2 A2 47      [10]  130 	jp nz, ommit
                            131 
   479E CD 0F 4B      [17]  132 	call render_drawCube
   47A1 C9            [10]  133 	ret
   47A2                     134 	ommit:					;;IF HP != 2 CHECK AGAIN
   47A2 D6 01         [ 7]  135 	sub #1					;;
                            136 	
   47A4 C2 AA 47      [10]  137 	jp nz, ommit2
                            138 
   47A7 CD 0F 4B      [17]  139 	call render_drawCube
                            140 
   47AA                     141  	ommit2:					;;IF HP != 3 CHECK AGAIN
   47AA D6 01         [ 7]  142 	sub #1					;;
                            143 	
   47AC C2 B2 47      [10]  144 	jp nz, ommit3
                            145 
   47AF CD 0F 4B      [17]  146 	call render_drawCube
                            147 
   47B2                     148  	ommit3:					;;HP == 0 ;NOT DRAW
   47B2 C9            [10]  149 	ret
                            150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            151 ;; BORRA UNA ENTIDAD
                            152 ;; PARA CUADRADOS UNICAMENTE
                            153 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            154 ;; ENTRADA: IX -> Puntero a entidad
                            155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   47B3                     156 cube_clearAll:
                            157 
                            158 ;;   ld  a, dc_col(ix)
                            159 ;;   ex af, af'
                            160 ;;
                            161 ;;   ld  dc_col(ix), #0
                            162 ;;
                            163 ;;   call render_drawCube
                            164 ;;   ex af, af'
                            165 ;;   ld dc_col(ix), a
                            166 
   47B3 C9            [10]  167    ret
                            168 
                            169 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            170 ;;
                            171 ;;RESET CUBES TO FIRST STATE
                            172 ;;
                            173 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   47B4                     174 cube_reset:
                            175 
   47B4 CD 90 4A      [17]  176 	call ball_reset
                            177 
   47B7 21 67 46      [10]  178 	ld hl, #cubeline10
   47BA 1E 00         [ 7]  179 	ld e, #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 19.
Hexadecimal [16-Bits]



   47BC 16 00         [ 7]  180 	ld d, #0
   47BE 0E 00         [ 7]  181 	ld c, #0
   47C0 DD 21 4B 46   [14]  182 	ld ix, #cubedefault
                            183 
   47C4                     184 	bucl2:
   47C4                     185 	bucl:
                            186 
   47C4 7A            [ 4]  187 	ld a,d 
                            188 
   47C5 77            [ 7]  189 	ld (hl),a
                            190 
   47C6 C6 08         [ 7]  191 	add #8
                            192 
   47C8 57            [ 4]  193 	ld d,a
   47C9 23            [ 6]  194 	inc hl
                            195 
                            196 
   47CA DD 7E 01      [19]  197 	ld a, dc_y(ix)
   47CD 77            [ 7]  198 	ld (hl),a
                            199 	
   47CE 23            [ 6]  200     inc hl
                            201 
   47CF DD 7E 02      [19]  202     ld a, dc_w(ix)
   47D2 77            [ 7]  203 	ld (hl),a
                            204     
   47D3 23            [ 6]  205 	inc hl
                            206 
   47D4 DD 7E 03      [19]  207     ld a, dc_h(ix)
   47D7 77            [ 7]  208 	ld (hl),a
                            209     	
   47D8 23            [ 6]  210 	inc hl
                            211     	
   47D9 DD 7E 04      [19]  212    ld a, dc_sp_l(ix)
   47DC 77            [ 7]  213    ld (hl), a
                            214 
   47DD 23            [ 6]  215     	inc hl
                            216 
   47DE DD 7E 05      [19]  217     ld a, dc_sp_h(ix)
   47E1 77            [ 7]  218     ld (hl),a
                            219 
   47E2 23            [ 6]  220    	inc hl	
                            221 
   47E3 DD 7E 06      [19]  222     ld a, c_hp(ix)
   47E6 77            [ 7]  223     ld (hl),a
                            224 
   47E7 23            [ 6]  225     	inc hl
                            226 
   47E8 7B            [ 4]  227   	ld a,e
   47E9 C6 01         [ 7]  228   	add #1
                            229 
   47EB 5F            [ 4]  230   	ld e,a
                            231 
   47EC D6 0A         [ 7]  232   	sub #k_cubos_linea
                            233 
   47EE 20 D4         [12]  234     	jr nz, bucl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 20.
Hexadecimal [16-Bits]



                            235 
   47F0 79            [ 4]  236     	ld a, c
                            237 
   47F1 C6 01         [ 7]  238     	add #1
                            239 
   47F3 4F            [ 4]  240     	ld c, a
                            241 
   47F4 D6 04         [ 7]  242     	sub #k_num_line
                            243 
   47F6 11 07 00      [10]  244     	ld de, #k_cube_size
   47F9 DD 19         [15]  245 	add ix, de
                            246 
   47FB 16 00         [ 7]  247 	ld d, #0
   47FD 1E 00         [ 7]  248 	ld e, #0
                            249 
   47FF 20 C3         [12]  250     	jr nz, bucl2
                            251 
                            252 
                            253 
   4801 CD CE 48      [17]  254 	call reset_life
   4804 3A 4A 46      [13]  255 	ld a, (state)
   4807 D6 01         [ 7]  256 	sub #1
   4809 32 4A 46      [13]  257 	ld (state), a
                            258     	
                            259 
   480C C9            [10]  260  ret
                            261 
                            262 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            263 ;; CUBE LOOSES 1 LIFE
                            264 ;; REGISTERS DESTROYED: DE, AF
                            265 ;; INPUT: HL -> CUBE_X
                            266 ;; OUTPUT : HL -> CUBE_X
                            267 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   480D                     268 cube_loses_life:
                            269 	
   480D 11 06 00      [10]  270 	ld de, #6			;;DE = 6
   4810 19            [11]  271 	add hl,de			;;HL + DE 
                            272 
   4811 7E            [ 7]  273 	ld a,(hl)			;;A = C_HP
   4812 D6 01         [ 7]  274 	sub #1				
   4814 77            [ 7]  275 	ld (hl),a			;;C_HP = C_HP - 1
                            276 
   4815 CA 1D 48      [10]  277 	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT
                            278 
   4818 11 FA FF      [10]  279 	ld de, #-6			;;IF NOT, HL -> DC_X
   481B 19            [11]  280 	add hl,de
                            281 
                            282 
   481C C9            [10]  283 ret
                            284 
                            285 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            286 ;; CUBE GETS DESTROYED
                            287 ;; REGISTERS DESTROYED: DE, AF
                            288 ;; INPUT: HL -> CUBE_HP
                            289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 21.
Hexadecimal [16-Bits]



                            290 
   481D                     291 destroy_cube:
   481D 11 FA FF      [10]  292 	ld de, #-6			;; 
   4820 19            [11]  293 	add hl,de			;; HL -> DC_X
   4821 36 FF         [10]  294 	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
   4823 23            [ 6]  295 	inc hl
   4824 36 FF         [10]  296 	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
   4826 2B            [ 6]  297 	dec hl				;; HL -> DC_X
                            298 
   4827 3A 7F 47      [13]  299 	ld a, (m_num_cube)	;;
   482A D6 01         [ 7]  300 	sub #1				;;
   482C 32 7F 47      [13]  301 	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1
                            302 
   482F CA B4 47      [10]  303 	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL
                            304 	
                            305 
   4832 C9            [10]  306 ret
                            307 
