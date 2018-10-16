ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .globl door_draw
                              3 .globl door_clear
                              4 .globl check_door
                              5 .globl open_door
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
                             17    .macro DefineDoor _name, _x, _y, _w, _h, _col, _op
                             18 _name: 
                             19     .db     _x, _y      ;; X, Y
                             20     .db     _w, _h      ;; W, H
                             21     .db     _col        ;; Color
                             22     .db     _op         ;;Open-close 
                             23 .endm
                     0000    24 d_x = 0
                     0001    25 d_y = 1
                     0002    26 d_w = 2
                     0003    27 d_h = 3
                     0004    28 d_col = 4
                     0005    29 d_op = 5
                             30 
                             31 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             32 ;;
                             33 ;;OBJETOS CREADOS CON LA MACROS
                             34 ;;
                             35 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             36 
                             37 .globl door0
