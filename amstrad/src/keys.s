;;====================================================
;; FUNCTIONS RELATED WITH SOLDIER MOVEMENT AND ACTIONS
;;====================================================

.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "keys.h.s"

picked_up: .db #0x00
coloration: .db 1
DefineEntity keys, 0x02, 0x15, 0x00, 0x00, 0x01,0x04, 0xC0,ent_draw, 0x00

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
