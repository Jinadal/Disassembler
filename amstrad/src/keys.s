;;====================================================
;; FUNCTIONS RELATED WITH SOLDIER MOVEMENT AND ACTIONS
;;====================================================

.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "keys.h.s"

DefineEntity keys, 0x02, 0x15, 0x00, 0x00, 0x01,0x04, 0xC0,ent_move, 0x00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; IF KEYS COLISION WITH CHARACTER THEY ARE PICKED UP
;; AND CARRIED
;; MODIFIED: HL, A         
;; EXIT: KEYS_X -> PERSONAJE_X
;;       KEYS_Y -> PERSONAJE_Y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pick_keys:
  ld a,#1
  ld e_key(ix), a
ret

drop_keys:
  
ret

key_draw:

  ld ix,#personaje
  ld a, e_key(ix)
  sub #1

  jp z, not_draw_key

    ld ix,#keys
    ld    de, #0xC000       ;;Comienzo memoria de video
    ld     c, e_x(ix)         ;; C = Entity Y
    ld     b, e_y(ix)         ;; B = Entity X
    call cpct_getScreenPtr_asm

    ex    de, hl   ;; DE = Puntero a memoria
    ld  a, e_col(ix)   ;; Color
    ld  b, e_h(ix)   ;; alto
    ld  c, e_w(ix)   ;; Ancho

    call cpct_drawSolidBox_asm
  
  not_draw_key:
  ld ix,#keys
ret

key_update:
  ld ix,#keys
  ld     h, e_up_h(ix)
  ld     l, e_up_l(ix)
jp    (hl)  

key_clear:
  ld ix,#keys
  ld  a, e_col(ix)
  ex af, af'

  ld  e_col(ix), #0

  call key_draw
  ex af, af'
  ld e_col(ix), a

ret