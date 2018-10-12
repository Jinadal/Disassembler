



.globl ent_clear
.globl ent_draw
.globl ent_update
.globl ent_move
.globl ent_moveKeyboard
.globl ent_collide



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _col, _upd, _key
_name: 
   .db    _x, _y     ;; X, Y
   .db   _vx, _vy    ;; VX, VY
   .db    _w, _h     ;; W, H
   .db   _col        ;; Color
   .dw   _upd        ;; Update 
   .db   _key        ;; Key   
.endm
e_x = 0
e_y = 1
e_vx = 2
e_vy = 3
e_w = 4
e_h = 5
e_col = 6
e_up_l = 7
e_up_h = 8
e_key = 9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl personaje
.globl p_a
.globl p_a1

.globl p_a2

