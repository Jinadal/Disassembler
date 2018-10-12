ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .globl wall_clear
                              3 .globl wall_draw
                              4 .globl wall_collide
                              5 
                              6 
                              7 
                              8 
                              9 
                             10 
                             11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             12 ;;
                             13 ;;MACROS
                             14 ;;
                             15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             16 
                             17    .macro DefineWall _name, _x, _y, _w, _h, _col
                             18 _name: 
                             19    .db    _x, _y     ;; X, Y
                             20    .db    _w, _h     ;; W, H
                             21    .db   _col        ;; Color
                             22 .endm
                     0000    23 w_x = 0
                     0001    24 w_y = 1
                     0002    25 w_w = 2
                     0003    26 w_h = 3
                     0004    27 w_col = 4
                             28 
                             29 
                             30 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             31 ;;
                             32 ;;OBJETOS CREADOS CON LA MACROS
                             33 ;;
                             34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             35 
                             36 .globl w1
                             37 .globl w2
                             38 .globl w3
                             39 .globl w4
