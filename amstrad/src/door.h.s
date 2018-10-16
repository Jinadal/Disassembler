
.globl door_draw
.globl door_clear
.globl check_door
.globl open_door





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineDoor _name, _x, _y, _w, _h, _col, _op
_name: 
    .db     _x, _y      ;; X, Y
    .db     _w, _h      ;; W, H
    .db     _col        ;; Color
    .db     _op         ;;Open-close 
.endm
d_x = 0
d_y = 1
d_w = 2
d_h = 3
d_col = 4
d_op = 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl door0
