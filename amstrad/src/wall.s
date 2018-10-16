.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
 .include "wall.h.s"


	;DefineWall w1, 78, 2, 2,190,0x0A
	;DefineWall w2, 2, 8, 77,8,0x0A
	;DefineWall w3, 0, 0, 2,190,0x0A
	;DefineWall w4, 0, 190, 77,8,0x0A

	num_walls = 2
	wall_size = 5

	DefineWall w1, 20, 20, 2,20,0x0A
	DefineWall w2, 25, 40, 10,8,0x0A
	;DefineWall w3, 0, 0, 2,190,0x0A
	;DefineWall w4, 0, 190, 77,8,0x0A



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wall_draw:

	;;; MIRA AQUI UN REGISTRO PARA GUARDAR EL CONTADOR DE PAREDES
; ld e' , #num_walls
 ; ld ix, #w1

 ;bucl:
	
   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, w_x(ix)         ;; C = Entity Y
   ld     b, w_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, w_col(ix)   ;; Color
   ld  b, w_h(ix)   ;; alto
   ld  c, w_w(ix)   ;; Ancho

   call cpct_drawSolidBox_asm


  ;  inc ix
   ; inc ix
    ;inc ix
    ;inc ix
    ;inc ix


    ;ld a,e'
    ;sub #1
    ;ld e',a
    ;jr nz , bucl

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wall_clear:
	
   ld  a, w_col(ix)
   ex af, af'

   ld  w_col(ix), #0

   call wall_draw
   ex af, af'
   ld w_col(ix), a

   ret




 