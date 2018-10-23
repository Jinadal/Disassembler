


.globl ball_clear
.globl ball_draw
.globl ball_update
.globl ball_move
.globl ball_reset




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;
;;MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   .macro DefineBall _name, _x, _y, _w, _h, _col,  _vx, _vy,_upd
_name: 
	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
  ; .db    _x, _y     ;; X, Y
   ;.db    _w, _h     ;; W, H
    ;.db   _col        ;; Color
   .db   _vx, _vy    ;; VX, VY
     .dw   _upd        ;; Update 
  
.endm
;bl_x = 0
;bl_y = 1
;bl_w = 2
;bl_h = 3
;bl_col = 4
bl_vx = 5
bl_vy = 6
bl_up_l = 7
bl_up_h = 8
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;OBJETOS CREADOS CON LA MACROS
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.globl ball
.globl balldefault

