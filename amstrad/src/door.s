.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "wall.h.s"
.include "door.h.s"
.include "keys.h.s"

	DefineDoor door0, 100, 150, 3, 50, 0xC0, 0
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
door_draw:
    ld ix,#door0

;;    ld a, d_op(ix)
;;    sub #1

;;    jp nz,prueba

;;    ld a, #0xFF
;;    ld (0xC001),a
;;    ld (0xC002),a
;;    ld (0xC003),a

;;    prueba:
    
;;    ld a, d_op(ix)
;;    sub #1

;;    jp z, not_draw_door

    ld    de, #0xC000       ;;Comienzo memoria de video
    ld     c, w_x(ix)         ;; C = Entity Y
    ld     b, w_y(ix)         ;; B = Entity X
    call cpct_getScreenPtr_asm

    ex    de, hl   ;; DE = Puntero a memoria
    ld  a, w_col(ix)   ;; Color
    ld  b, w_h(ix)   ;; alto
    ld  c, w_w(ix)   ;; Ancho

    call cpct_drawSolidBox_asm

  ;;  not_draw_door:

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
door_clear:
    ld ix,#door0
    ld  a, w_col(ix)
    ex af, af'

    ld  w_col(ix), #0

    call wall_draw
    ex af, af'
    ld w_col(ix), a

    ret


check_door:
    ld ix,#personaje
    ld a, e_key(ix)
    sub #1

    jp nz, no_key

    call open_door

    no_key:

ret

open_door:
    
    ld ix, #door0
    ld a,#1
    ld d_op(ix), a

    
ret