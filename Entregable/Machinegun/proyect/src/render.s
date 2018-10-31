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


.include "render.h.s"
.include "main.h.s"


m_front_buffer: .db 0xC0
m_back_buffer:  .db 0x80


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLEANS AND PREPARES A NEW BUFFER
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ren_newScene:
    call ren_switchBuffers
    call ren_clearBackBuffers
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLEARS THE BUFFERS
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ren_clearBackBuffers:
    ld      a, (m_back_buffer)
    ld      h, a
    ld      de, #0
    ld      l, e
    ld      bc, #0x4000

    call    _cpct_memset_f64_asm

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CHANGES BUFFERS
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ren_switchBuffers:
    ld      a, (m_back_buffer)
    ld      b,a
    ld      a, (m_front_buffer)
    ld (m_back_buffer), a
    ld      a, b
    ld (m_front_buffer), a

    srl     b
    srl     b
    ld      l, b
    jp    cpct_setVideoMemoryPage_asm

    


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW ENTITY
;; REGISTERS DETROYED: AF, BC, DE ,HL
;; INPUT: IX -> Points to entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
render_drawCube:
    ld      a, (m_back_buffer)  ;; DE = Back buffer
    ld      d, a
    ld      e, #0
    ld      c, dc_x(ix)         ;; C = Entity Y
    ld      b, dc_y(ix)         ;; B = Entity X
    call cpct_getScreenPtr_asm

    ex      de, hl        ;; DE = Puntero a memoria
    ld      l, dc_sp_l(ix)
    ld      h, dc_sp_h(ix)
    ld      b, dc_h(ix)      ;; Alto
    ld      c, dc_w(ix)      ;; Ancho

    call cpct_drawSprite_asm

    ret
