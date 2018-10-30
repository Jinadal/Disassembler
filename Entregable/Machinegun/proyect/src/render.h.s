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


;;Drawable Entity
.macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
_name:
    .db _x, _y
    .db _w, _h
    .dw _sprite

_name'_size = . - _name
.endm
dc_x    = 0     dc_y    = 1
dc_w    = 2     dc_h    = 3
dc_sp_l  = 4    dc_sp_h  = 5

.globl ren_clearBackBuffers
;;.globl ren_switchBuffers
.globl render_drawCube
.globl ren_newScene
.globl m_back_buffer
.globl m_front_buffer
