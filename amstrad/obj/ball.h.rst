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
                     0009    55 bl_up_h = 9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



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
