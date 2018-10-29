ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl barra_clear
                              2 .globl barra_draw
                              3 .globl barra_update
                              4 .globl barra_move
                              5 .globl barra_moveKeyboard
                              6 
                              7 
                              8 
                              9 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             10 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                             11 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                             12 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                             13 ;;
                             14 ;;  This program is free software: you can redistribute it and/or modify
                             15 ;;  it under the terms of the GNU Lesser General Public License as published by
                             16 ;;  the Free Software Foundation, either version 3 of the License, or
                             17 ;;  (at your option) any later version.
                             18 ;;
                             19 ;;  This program is distributed in the hope that it will be useful,
                             20 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             21 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             22 ;;  GNU Lesser General Public License for more details.
                             23 ;;
                             24 ;;  You should have received a copy of the GNU Lesser General Public License
                             25 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             26 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             27 
                             28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             29 ;;
                             30 ;;MACROS
                             31 ;;
                             32 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             33 
                             34    .macro DefineBarra _name, _x, _y, _w, _h, _col, _vx, _vy, _upd
                             35 _name: 
                             36 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             37  ;  .db    _x, _y     ;; X, Y
                             38   ; .db    _w, _h     ;; W, H
                             39   ; .db   _col        ;; Color
                             40    .db   _vx, _vy    ;; VX, VY
                             41    .dw   _upd        ;; Update 
                             42   
                             43 .endm
                             44 ;b_x = 0
                             45 ;b_y = 1
                             46 ;b_w = 2
                             47 ;b_h = 3
                             48 ;b_col = 4
                     0006    49 b_vx = 6
                     0007    50 b_vy = 7
                             51 	
                             52 
                             53 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             54 ;;
                             55 ;;OBJETOS CREADOS CON LA MACROS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 ;;
                             57 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             58 
                             59 .globl barra
                             60 
