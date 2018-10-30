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
                             20 .globl barra_clear
                             21 .globl barra_draw
                             22 .globl barra_update
                             23 .globl barra_move
                             24 .globl barra_moveKeyboard
                             25 
                             26 
                             27 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             28 ;;
                             29 ;;MACROS
                             30 ;;
                             31 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             32 
                             33    .macro DefineBarra _name, _x, _y, _w, _h, _col, _vx, _vy, _upd
                             34 _name: 
                             35 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             36  ;  .db    _x, _y     ;; X, Y
                             37   ; .db    _w, _h     ;; W, H
                             38   ; .db   _col        ;; Color
                             39    .db   _vx, _vy    ;; VX, VY
                             40    .dw   _upd        ;; Update 
                             41   
                             42 .endm
                             43 ;b_x = 0
                             44 ;b_y = 1
                             45 ;b_w = 2
                             46 ;b_h = 3
                             47 ;b_col = 4
                     0006    48 b_vx = 6
                     0007    49 b_vy = 7
                             50 	
                             51 
                             52 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             53 ;;
                             54 ;;OBJETOS CREADOS CON LA MACROS
                             55 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             57 
                             58 .globl barra
                             59 
