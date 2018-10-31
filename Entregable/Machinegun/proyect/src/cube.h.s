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
.macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
_name:
    DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
    .db     _hp     ;; Hitpoints
.endm
c_de        = 0
c_de_size   = 6
c_hp        = 0 + c_de_size
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
.globl cube_clear
.globl cube_draw
.globl cube_drawAll
.globl cube_clearAll
.globl cube_loses_life
.globl cube_reset

.globl destroy_cube

.globl k_cube_size
.globl k_max_cube_line	

.globl cubeline10
.globl cubeline11
.globl cubeline12
.globl cubeline13
.globl cubeline14
.globl cubeline15
.globl cubeline16
.globl cubeline17
.globl cubeline18
.globl cubeline19

.globl cubeline20
.globl cubeline21
.globl cubeline22
.globl cubeline23
.globl cubeline24
.globl cubeline25
.globl cubeline26
.globl cubeline27
.globl cubeline28
.globl cubeline29

.globl cubeline30
.globl cubeline31
.globl cubeline32
.globl cubeline33
.globl cubeline34
.globl cubeline35
.globl cubeline36
.globl cubeline37
.globl cubeline38
.globl cubeline39

.globl cubeline40
.globl cubeline41
.globl cubeline42
.globl cubeline43
.globl cubeline44
.globl cubeline45
.globl cubeline46
.globl cubeline47
.globl cubeline48
.globl cubeline49