ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 
                              3 
                              4 
                              5 .globl ent_clear
                              6 .globl ent_draw
                              7 .globl ent_update
                              8 .globl ent_move
                              9 .globl ent_moveKeyboard
                             10 .globl ent_collide
                             11 
                             12 
                             13 
                             14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             15 ;;
                             16 ;;MACROS
                             17 ;;
                             18 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             19 
                             20    .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _col, _upd, _key
                             21 _name: 
                             22    .db    _x, _y     ;; X, Y
                             23    .db   _vx, _vy    ;; VX, VY
                             24    .db    _w, _h     ;; W, H
                             25    .db   _col        ;; Color
                             26    .dw   _upd        ;; Update 
                             27    .db   _key        ;; Key   
                             28 .endm
                     0000    29 e_x = 0
                     0001    30 e_y = 1
                     0002    31 e_vx = 2
                     0003    32 e_vy = 3
                     0004    33 e_w = 4
                     0005    34 e_h = 5
                     0006    35 e_col = 6
                     0007    36 e_up_l = 7
                     0008    37 e_up_h = 8
                     0009    38 e_key = 9
                             39 
                             40 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             41 ;;
                             42 ;;OBJETOS CREADOS CON LA MACROS
                             43 ;;
                             44 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             45 
                             46 .globl personaje
                             47 .globl p_a
                             48 .globl p_a1
                             49 
                             50 .globl p_a2
                             51 
