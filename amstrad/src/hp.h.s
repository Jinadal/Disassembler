
.globl hp_clear
.globl hp_draw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineHP _name, _x, _y, _w, _h, _col, _UP
_name: 
   .db    _x, _y     ;; X, Y
   .db    _w, _h     ;; W, H
   .db   _col        ;; Color
   .db   _UP         ;; is up?

.endm
hp_x = 0
hp_y = 1
hp_w = 2
hp_h = 3
hp_col = 4
hp_UP = 5



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl hp1
.globl hp2
.globl hp3

