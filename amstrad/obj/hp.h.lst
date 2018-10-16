ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .globl HP_clear
                              3 .globl HP_draw
                              4 
                              5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                              6 ;;
                              7 ;;MACROS
                              8 ;;
                              9 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             10 
                             11    .macro DefineHP _name, _x, _y, _w, _h, _col, _UP
                             12 _name: 
                             13    .db    _x, _y     ;; X, Y
                             14    .db    _w, _h     ;; W, H
                             15    .db   _col        ;; Color
                             16    .db   _UP         ;; is up?
                             17 
                             18 .endm
                     0000    19 hp_x = 0
                     0001    20 hp_y = 1
                     0002    21 hp_w = 2
                     0003    22 hp_h = 3
                     0004    23 hp_col = 4
                     0005    24 hp_UP = 5
                             25 
                             26 
                             27 
                             28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             29 ;;
                             30 ;;OBJETOS CREADOS CON LA MACROS
                             31 ;;
                             32 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             33 
                             34 .globl hp1
                             35 .globl hp2
                             36 .globl hp3
                             37 
