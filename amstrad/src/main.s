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


.include "cpctelera.h.s"
.include "barra.h.s"
.include "ball.h.s"
.include "main.h.s"
.include "cube.h.s"
.include "render.h.s"

.globl _bar_pal

.area _DATA
.area _CODE

_main::
    ld  sp, #0x8000

    ;; Disable firmware to prevent it from interfering with string drawing
    call cpct_disableFirmware_asm

    ld    c, #0
    call cpct_setVideoMode_asm

    ld   hl, #_bar_pal
    ld   de, #16
    call cpct_setPalette_asm
loop:
   ;; call cube_clear

    call barra_clear
    call ball_clear

    
    call barra_update
    call ball_update

    call cube_draw

    call barra_draw
    call ball_draw

    call cpct_waitVSYNC_asm
    ;;call ren_switchBuffers
    call ren_newScene
    
   ;; Loop forever
   jp    loop

   
