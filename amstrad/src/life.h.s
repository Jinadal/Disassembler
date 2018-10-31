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

;;.globl life_clear
.globl life_draw
.globl delete_life
.globl reset_life
;;.globl life_update

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro DefineLife _name, _x, _y, _w, _h, _col,_hp
_name:
    DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
        .db     _hp     ;; Hitpoints
.endm
l_de        = 0
l_hp        = 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl life1
.globl life2
.globl life3
