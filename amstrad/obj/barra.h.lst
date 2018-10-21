ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 
                              3 .globl barra_clear
                              4 .globl barra_draw
                              5 .globl barra_update
                              6 .globl barra_move
                              7 .globl barra_moveKeyboard
                              8 
                              9 
                             10 
                             11 
                             12 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             13 ;;
                             14 ;;MACROS
                             15 ;;
                             16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             17 
                             18    .macro DefineBarra _name, _x, _y, _w, _h,  _vx, _vy,_col, _upd
                             19 _name: 
                             20    .db    _x, _y     ;; X, Y
                             21    .db    _w, _h     ;; W, H
                             22    .db   _vx, _vy    ;; VX, VY
                             23    .db   _col        ;; Color
                             24    .dw   _upd        ;; Update 
                             25   
                             26 .endm
                     0000    27 b_x = 0
                     0001    28 b_y = 1
                     0002    29 b_w = 2
                     0003    30 b_h = 3
                     0004    31 b_vx = 4
                     0005    32 b_vy = 5
                     0006    33 b_col = 6
                     0007    34 b_up_l = 7
                     0008    35 b_up_h = 8
                             36 	
                             37 
                             38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             39 ;;
                             40 ;;OBJETOS CREADOS CON LA MACROS
                             41 ;;
                             42 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             43 
                             44 .globl barra
                             45 
