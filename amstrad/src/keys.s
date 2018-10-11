;;====================================================
;; FUNCTIONS RELATED WITH SOLDIER MOVEMENT AND ACTIONS
;;====================================================

.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "keys.h.s"

;;picked_up: .db 00

DefineEntity keys, 0x02, 0x15, 0x00, 0x00, 0x01,0x04, 0xFF, ent_draw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; IF KEYS COLISION WITH CHARACTER THEY ARE PICKED UP
;; AND CARRIED
;; MODIFIED: HL, A         
;; EXIT: KEYS_X -> PERSONAJE_X
;;       KEYS_Y -> PERSONAJE_Y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pick_keys:
  ld hl, #keys    ;;hl -> array keys
  ld a, e_x(ix)   ;;a = personaje_x
  ld (hl), a      ;;keys_x = a
  ld a, e_y(ix)   ;;a = personaje_y
  inc hl          ;;hl -> keys_y
  ld (hl), a      ;;keys_y = a
  inc hl          ;;
  inc hl          ;;
  inc hl          ;;
  inc hl          ;;
  inc hl          ;;hl -> keys_col
  ld a, #0xF0     ;;
  ld (hl),a       ;;
ret

drop_keys:
  ld hl, #keys
  inc hl
  inc hl
  inc hl
  inc hl
  inc hl
  inc hl
  ld a, #0xFF
  ld (hl),a
ret