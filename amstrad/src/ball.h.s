


.globl ball_clear
.globl ball_draw
.globl ball_update
.globl ball_move





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineBall _name, _x, _y, _w, _h,  _vx, _vy,_col, _upd
_name: 
   .db    _x, _y     ;; X, Y
   .db    _w, _h     ;; W, H
   .db   _vx, _vy    ;; VX, VY
   .db   _col        ;; Color
   .dw   _upd        ;; Update 
  
.endm
bl_x = 0
bl_y = 1
bl_w = 2
bl_h = 3
bl_vx = 4
bl_vy = 5
bl_col = 6
bl_up_l = 7
bl_up_h = 8
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl ball

