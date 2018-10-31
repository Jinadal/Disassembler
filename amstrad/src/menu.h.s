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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro DefineSpriteMenu _name, _x, _y, _w, _h, _col
_name:
    DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
.endm
;;.macro DefineCubeLine1Default _name, _suf
;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
;;.endm
;;.macro DefineNCubeLine1 _name, _n

;;    _s = 0
;;    .rept _n
;;        DefineCubeLine1Default _name, \_s

;;        _s = _s + 1
;;    .endm
;;.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;OBJECTS CREATED WITH MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.globl menu_draw

.globl top1
.globl top2
.globl top3
.globl top4
.globl bot1
.globl bot2
.globl bot3
.globl bot4
.globl press