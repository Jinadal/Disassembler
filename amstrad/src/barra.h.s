.globl barra_clear
.globl barra_draw
.globl barra_update
.globl barra_move
.globl barra_moveKeyboard




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineBarra _name, _x, _y, _w, _h, _col, _vx, _vy, _upd
_name: 
	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
 ;  .db    _x, _y     ;; X, Y
  ; .db    _w, _h     ;; W, H
  ; .db   _col        ;; Color
   .db   _vx, _vy    ;; VX, VY
   .dw   _upd        ;; Update 
  
.endm
;b_x = 0
;b_y = 1
;b_w = 2
;b_h = 3
;b_col = 4
b_vx = 5
b_vy = 6
b_up_l = 7
b_up_h = 8
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl barra

