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
;; DIBUJAR LAS PAREDES
;; PARA CUADRADOS UNICAMENTE
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

wall_draw:

	ld ix, #w1
	call wall_draw_single

	ld ix, #w2
	call wall_draw_single
	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wall_draw_single:

	
   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, w_x(ix)         ;; C = Entity Y
   ld     b, w_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, w_col(ix)   ;; Color
   ld  b, w_h(ix)   ;; alto
   ld  c, w_w(ix)   ;; Ancho

   call cpct_drawSolidBox_asm


  

   ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRAR LAS PAREDES
;; PARA CUADRADOS UNICAMENTE
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

wall_clear:

	ld ix, #w1
	call wall_clear_single

	ld ix, #w2
	call wall_clear_single
	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UN MURO
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
wall_clear_single:
	
   ld  a, w_col(ix)
   ex af, af'

   ld  w_col(ix), #0

   call wall_draw_single
   ex af, af'
   ld w_col(ix), a

   ret




 