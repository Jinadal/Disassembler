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
.include "render.h.s"
.include "life.h.s"
.include "main.h.s"

.globl _life_sp

k_max_lifes = 3
k_life_size = 7

    DefineLife defaultlife1, 20, 180, 8, 16, _life_sp,0x01    
    DefineLife defaultlife2, 12, 180, 8, 16, _life_sp,0x01
	DefineLife defaultlife3, 4, 180, 8, 16, _life_sp,0x01

    DefineLife life1, 20, 180, 8, 16, _life_sp,0x01    
    DefineLife life2, 12, 180, 8, 16, _life_sp,0x01
	DefineLife life3, 4, 180, 8, 16, _life_sp,0x01

m_num_life: .db 3



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW THE BARRA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
life_draw:
ld ix,#life1
call decide_to_draw

ld ix,#life2
call decide_to_draw

ld ix,#life3
call decide_to_draw

ret

decide_to_draw:
    ld a,l_hp(ix)			;;IF HP != 1 CHECK AGAIN
	sub #1					;;

	jp nz, ommited

	call draw_three

	ommited:	
ret

draw_three:
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

    call cpct_drawSpriteMasked_asm

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; WE LOOSE A MARK OF LIFE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delete_life:
    ld ix,#life1
    ld a,l_hp(ix)
    sub #1
    ld l_hp(ix),a
    jp z, finish

    ld ix,#life2
    ld a,l_hp(ix)
    sub #1
    ld l_hp(ix),a
    jp z, finish
    
    ld ix,#life3
    ld a,l_hp(ix)
    sub #1
    ld l_hp(ix),a
    jp z, finish
    finish:

    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RESET A LIFE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
reset_life:
    ld ix,#defaultlife1
    ld hl, #life1
    ld b, #20
    ld c, #0

    bucl:

    ld a, b

    ld (hl), a
    sub #8

    ld b,a

    inc hl

    ld a, dc_y(ix)

    ld (hl), a

    inc hl
     ld a, dc_w(ix)

    ld (hl), a

    inc hl

    ld a, dc_h(ix)

    ld (hl), a

    inc hl

    ld a, dc_sp_l(ix)
    ld (hl), a

    inc hl

    ld a, dc_sp_h(ix)
    ld (hl),a

    inc hl  

    ld a, l_hp(ix)
    ld (hl),a

    inc hl




    ld a, c
    add #1
    ld c,a
    sub #3

    jp nz, bucl






    ret