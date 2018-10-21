ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 
                              3 
                              4 .globl ball_clear
                              5 .globl ball_draw
                              6 .globl ball_update
                              7 .globl ball_move
                              8 
                              9 
                             10 
                             11 
                             12 
                             13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             14 ;;
                             15 ;;MACROS
                             16 ;;
                             17 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             18 
                             19    .macro DefineBall _name, _x, _y, _w, _h,  _vx, _vy,_col, _upd
                             20 _name: 
                             21    .db    _x, _y     ;; X, Y
                             22    .db    _w, _h     ;; W, H
                             23    .db   _vx, _vy    ;; VX, VY
                             24    .db   _col        ;; Color
                             25    .dw   _upd        ;; Update 
                             26   
                             27 .endm
                     0000    28 bl_x = 0
                     0001    29 bl_y = 1
                     0002    30 bl_w = 2
                     0003    31 bl_h = 3
                     0004    32 bl_vx = 4
                     0005    33 bl_vy = 5
                     0006    34 bl_col = 6
                     0007    35 bl_up_l = 7
                     0008    36 bl_up_h = 8
                             37 	
                             38 
                             39 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             40 ;;
                             41 ;;OBJETOS CREADOS CON LA MACROS
                             42 ;;
                             43 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             44 
                             45 .globl ball
                             46 
