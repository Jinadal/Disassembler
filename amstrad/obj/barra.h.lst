ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .globl barra_clear
                              2 .globl barra_draw
                              3 .globl barra_update
                              4 .globl barra_move
                              5 .globl barra_moveKeyboard
                              6 
                              7 
                              8 
                              9 
                             10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             11 ;;
                             12 ;;MACROS
                             13 ;;
                             14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             15 
                             16    .macro DefineBarra _name, _x, _y, _w, _h, _col, _vx, _vy, _upd
                             17 _name: 
                             18 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             19  ;  .db    _x, _y     ;; X, Y
                             20   ; .db    _w, _h     ;; W, H
                             21   ; .db   _col        ;; Color
                             22    .db   _vx, _vy    ;; VX, VY
                             23    .dw   _upd        ;; Update 
                             24   
                             25 .endm
                             26 ;b_x = 0
                             27 ;b_y = 1
                             28 ;b_w = 2
                             29 ;b_h = 3
                             30 ;b_col = 4
                     0005    31 b_vx = 5
                     0006    32 b_vy = 6
                     0007    33 b_up_l = 7
                     0008    34 b_up_h = 8
                             35 	
                             36 
                             37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             38 ;;
                             39 ;;OBJETOS CREADOS CON LA MACROS
                             40 ;;
                             41 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             42 
                             43 .globl barra
                             44 
