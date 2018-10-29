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


.include "main.h.s"
.include "cube.h.s"
.include "render.h.s"
.include "ball.h.s"

.globl _cubeline_sp
.globl _cubeline2_sp
.globl _cubeline3_sp

k_max_cube_line = 40
k_cube_size = 7


DefineCubeLine1 cubedefault, 0x00, 0x28, 0x04, 0x08, _cubeline_sp, 0x01
DefineCubeLine1 cubedefault1, 0x00, 0x18, 0x04, 0x08, _cubeline_sp, 0x01
DefineCubeLine1 cubedefault2, 0x00, 0x10, 0x04, 0x08, _cubeline2_sp, 0x01


DefineCubeLine1 cubeline10, 0x00, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline11, 0x08, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline12, 0x10, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline13, 0x18, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline14, 0x20, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline15, 0x28, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline16, 0x30, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline17, 0x38, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline18, 0x40, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03
DefineCubeLine1 cubeline19, 0x48, 0x08, 0x08, 0x08,_cubeline3_sp, 0x03

DefineCubeLine1 cubeline20, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline21, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline22, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline23, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline24, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline25, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline26, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline27, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline28, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline29, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01

DefineCubeLine1 cubeline30, 0x00, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline31, 0x08, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline32, 0x10, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline33, 0x18, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline34, 0x20, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline35, 0x28, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline36, 0x30, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline37, 0x38, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline38, 0x40, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline39, 0x48, 0x18, 0x08, 0x08,_cubeline_sp, 0x01
;;
DefineCubeLine1 cubeline40, 0x00, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline41, 0x08, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline42, 0x10, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline43, 0x18, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline44, 0x20, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline45, 0x28, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline46, 0x30, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline47, 0x38, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline48, 0x40, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02
DefineCubeLine1 cubeline49, 0x48, 0x20, 0x08, 0x08,_cubeline2_sp, 0x02


m_num_cube: .db 40


cube_clear:

ret

cube_draw:
ld ix,#cubeline10
ld a,#k_max_cube_line

rep:
push af
call cube_drawAll

ld de,#k_cube_size
add ix, de
pop af
dec a

jp nz,rep


ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW ENTITY
;; REGISTERS DETROYED: AF, BC, DE ,HL
;; INPUT: IX -> Points to entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_drawAll:

	ld a,c_hp(ix)			;;IF HP != 1 CHECK AGAIN
	sub #1					;;

	jp nz, ommit

	call render_drawCube
	ret
	ommit:					;;IF HP != 2 CHECK AGAIN
	sub #1					;;
	
	jp nz, ommit2

	call render_drawCube

 	ommit2:					;;IF HP != 3 CHECK AGAIN
	sub #1					;;
	
	jp nz, ommit3

	call render_drawCube

 	ommit3:					;;HP == 0 ;NOT DRAW
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_clearAll:

;;   ld  a, dc_col(ix)
;;   ex af, af'
;;
;;   ld  dc_col(ix), #0
;;
;;   call render_drawCube
;;   ex af, af'
;;   ld dc_col(ix), a

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;RESET CUBES TO FIRST STATE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
cube_reset:

	call ball_reset

	ld hl, #cubeline10
	ld e, #0
	ld d, #0
	ld c, #0
	ld ix, #cubedefault
	bucl:

	ld a,d 

	ld (hl),a

	add #4

	ld d,a
	inc hl


	ld a, dc_y(ix)
	ld (hl),a
	
    inc hl

    ld a, dc_w(ix)
	ld (hl),a
    
	inc hl

    ld a, dc_h(ix)
	ld (hl),a
    	
	inc hl
    	
    ld a,c
    sub #1

    jp z, rojo

    add #2
    ld c,a
	
	ld a, #15

    ld (hl),a

    jp colorok
    rojo:
    	ld c,a
    	
    	ld a, #255

    	ld (hl),a

    	jp colorok
  	
	colorok:

    	inc hl

    	;;hp
    	inc hl

  	ld a,e
  	add #1

  	ld e,a

  	sub #k_max_cube_line

    	jr nz, bucl

    	

 ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUBE LOOSES 1 LIFE
;; REGISTERS DESTROYED: DE, AF
;; INPUT: HL -> CUBE_X
;; OUTPUT : HL -> CUBE_X
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_loses_life:
	
	ld de, #6			;;DE = 6
	add hl,de			;;HL + DE 

	ld a,(hl)			;;A = C_HP
	sub #1				
	ld (hl),a			;;C_HP = C_HP - 1

	jp z,destroy_cube	;;IF C_HP = 0 DESTROY IT

	ld de, #-6			;;IF NOT, HL -> DC_X
	add hl,de


ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUBE GETS DESTROYED
;; REGISTERS DESTROYED: DE, AF
;; INPUT: HL -> CUBE_HP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

destroy_cube:
	ld de, #-6			;; 
	add hl,de			;; HL -> DC_X
	ld 	(hl),#0xFF		;; DC_X = 0xFF OUT OF SCREEN
	inc hl
	ld	(hl),#0xFF		;; DC_Y = 0xFF OUT OF SCREEN
	dec hl				;; HL -> DC_X

	ld a, (m_num_cube)	;;
	sub #1				;;
	ld (m_num_cube),a	;; m_num_cube = m_num_cube - 1

	jp z, cube_reset	;; IF m_num_cube == 0, END GAME, RESET ALL

ret

