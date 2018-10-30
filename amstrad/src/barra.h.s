;;-----------------------------LICENSE NOTICE-----------------------------------------------------
;;  This file is part of Amstrad CPC videogame "DisAssembler"
;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;-----------------------------LICENSE NOTICE-----------------------------------------------------

.globl barra_clear
.globl barra_draw
.globl barra_update
.globl barra_move
.globl barra_moveKeyboard


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineBarra _name, _x, _y, _w, _h, _col, _vx, _vy, _upd
_name: 
	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
 ;  .db    _x, _y     ;; X, Y
  ; .db    _w, _h     ;; W, H
  ; .db   _col        ;; Color
   .db   _vx, _vy    ;; VX, VY
   .dw   _upd        ;; Update 
  
.endm
;b_x = 0
;b_y = 1
;b_w = 2
;b_h = 3
;b_col = 4
b_vx = 6
b_vy = 7
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl barra

