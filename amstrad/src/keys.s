;;====================================================
;; FUNCTIONS RELATED WITH SOLDIER MOVEMENT AND ACTIONS
;;====================================================

.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "keys.h.s"

picked_up: .db 00

DefineEntity llave, 0x02, 0x15, 0x00, 0x00, 0x01,0x04, 0xFF, keys_picked

keys_picked:
  call ent_collide
  ;;ex af,af'
  ;;jp z, not_picked ;; obs_X + obs_W - hero_X = 0
  ;;jp m, not_picked
  
  ;;ld (hl),#0xFF
  ;;ex af,af' 
  not_picked:
ret