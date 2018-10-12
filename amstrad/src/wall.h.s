
.globl wall_clear
.globl wall_draw
.globl wall_collide






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineWall _name, _x, _y, _w, _h, _col
_name: 
   .db    _x, _y     ;; X, Y
   .db    _w, _h     ;; W, H
   .db   _col        ;; Color
.endm
w_x = 0
w_y = 1
w_w = 2
w_h = 3
w_col = 4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl w1
.globl w2
.globl w3
.globl w4
