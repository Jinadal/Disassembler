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



.globl ball_clear
.globl ball_draw
.globl ball_update
.globl ball_move
.globl ball_reset




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineBall _name, _x, _y, _w, _h, _sprite,  _vx, _vy,_upd,_hp
_name: 
	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _sprite
  ; .db    _x, _y     ;; X, Y
   ;.db    _w, _h     ;; W, H
    ;.db   _col        ;; Color
   .db   _vx, _vy    ;; VX, VY
   .dw   _upd        ;; Update 
   .db _hp
.endm
;bl_x = 0
;bl_y = 1
;bl_w = 2
;bl_h = 3
;bl_col = 4
bl_vx = 6
bl_vy = 7
bl_up_l = 8
bl_up_h = 9
bl_hp = 10
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl ball
.globl balldefault
;.globl screenPointer

