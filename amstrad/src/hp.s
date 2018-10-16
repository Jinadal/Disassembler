.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "hp.h.s"


	DefineHP hp1, 0, 0, 2,4,0xFF, 0x01
	DefineHP hp2, 4, 0, 2,4,0xFF, 0x01
	DefineHP hp3, 8, 0, 2,4,0xFF, 0x01



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA VIDA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HP_draw:

	;;; MIRA AQUI UN REGISTRO PARA GUARDAR EL CONTADOR DE PAREDES
; ld e' , #num_walls
 ; ld ix, #w1

 ;bucl:
	
   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, hp_x(ix)         ;; C = Entity Y
   ld     b, hp_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, hp_col(ix)   ;; Color
   ld  b, hp_h(ix)   ;; alto
   ld  c, hp_w(ix)   ;; Ancho

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
;; BORRA UNA VIDA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HP_clear:
	
   ld  a, hp_col(ix)
   ex af, af'

   ld  hp_col(ix), #0

   call HP_draw
   ex af, af'
   ld hp_col(ix), a

   ret


