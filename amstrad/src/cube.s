.include "main.h.s"
.include "cube.h.s"
.include "render.h.s"
.include "ball.h.s"

.globl _cubeline_sp


k_max_cube_line = 10
k_cube_size = 7


DefineCubeLine1 cubedefault, 0x00, 0x10, 0x04, 0x08, _cubeline_sp, 0x01


DefineCubeLine1 cubeline10, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline11, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline12, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline13, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline14, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline15, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline16, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline17, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline18, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
DefineCubeLine1 cubeline19, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01


m_num_cube: .db 2


cube_clear:
ld ix,#cubeline10
call cube_clearAll
ld ix,#cubeline11
call cube_clearAll
ld ix,#cubeline12
call cube_clearAll
ld ix,#cubeline13
call cube_clearAll
ld ix,#cubeline14
call cube_clearAll
ld ix,#cubeline15
call cube_clearAll
ld ix,#cubeline16
call cube_clearAll
ld ix,#cubeline17
call cube_clearAll
ld ix,#cubeline18
call cube_clearAll
ld ix,#cubeline19
call cube_clearAll
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

	ld a,c_hp(ix)
	sub #1

	jp nz, ommit

	call render_drawCube
	
	ommit:
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
    	
	ld a, dc_sp_l(ix)
	ld (hl),a

	inc hl

	ld a, dc_sp_h(ix)
	ld (hl),a

	inc hl

	ld a, c_hp(ix)
	ld (hl),a
;;    ld a,c
;;    sub #1
;;
;;    jp z, rojo
;;
;;    add #2
;;    ld c,a
;;	
;;	ld a, #15
;;
;;    ld (hl),a
;;
;;    jp colorok
;;    rojo:
;;    ld c,a
;;    
;;    ld a, #255
;;
;;    ld (hl),a
;;
;;    jp colorok
;;  	
;;	colorok:
;;
;;    inc hl
;;
;;    	;;hp
;;    inc hl
;;
;;  	ld a,e
;;  	add #1
;;
;;  	ld e,a

  	sub #k_max_cube_line

    	jr nz, bucl

    	

 ret

destroy_cube:
	ld (hl),#0xFF
	inc hl			;;	Y		
	inc hl			;;	W
	inc hl			;;	H
	inc hl			;;	SP_L
	inc hl			;;	SP_H
	inc hl			;;  HP

	ld (hl),#0

	dec hl			;; SP_H
	dec hl			;; SP_L
	dec hl			;; H 
	dec hl			;; W
	dec hl			;; Y
	dec hl			;; X

	ld a, (m_num_cube)
	sub #1
	ld (m_num_cube),a

	jp z, cube_reset

ret

