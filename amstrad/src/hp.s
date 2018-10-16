.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "hp.h.s"


	DefineHP hp1, 0, 0, 2,4,0xFF, 0x01
	DefineHP hp2, 4, 0, 2,4,0xFF, 0x01
	DefineHP hp3, 8, 0, 2,4,0xFF, 0x01



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR LAS PAREDES
;; PARA CUADRADOS UNICAMENTE
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hp_draw:

	ld ix, #hp1
	call hp_draw_single

	ld ix, #hp2
	call hp_draw_single

	ld ix, #hp3
	call hp_draw_single
	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hp_draw_single:

	
   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, hp_x(ix)         ;; C = X
   ld     b, hp_y(ix)         ;; B = Y
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, hp_col(ix)   ;; Color
   ld  b, hp_h(ix)   ;; alto
   ld  c, hp_w(ix)   ;; Ancho

   call cpct_drawSolidBox_asm


  

   ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRAR LAS PAREDES
;; PARA CUADRADOS UNICAMENTE
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hp_clear:

	ld ix, #hp1
	call hp_clear_single

	ld ix, #hp2
	call hp_clear_single

	ld ix, #hp3
	call hp_clear_single
	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UN MURO
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hp_clear_single:
	
   ld  a, hp_col(ix)
   ex af, af'

   ld  hp_col(ix), #0

   call hp_draw_single
   ex af, af'
   ld hp_col(ix), a

   ret




 