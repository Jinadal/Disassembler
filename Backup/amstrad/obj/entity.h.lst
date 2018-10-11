ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .globl ent_clear
                              3 .globl ent_draw
                              4 .globl ent_update
                              5 .globl ent_move
                              6 .globl ent_moveKeyboard
                              7 .globl ent_collide
                              8 
                              9 
                             10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             11 ;;
                             12 ;;MACROS
                             13 ;;
                             14 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             15 
                             16    .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _col, _upd
                             17 _name: 
                             18    .db    _x, _y     ;; X, Y
                             19    .db   _vx, _vy    ;; VX, VY
                             20    .db    _w, _h     ;; W, H
                             21    .db   _col        ;; Color
                             22    .dw   _upd        ;; Update 
                             23 .endm
                     0000    24 e_x = 0
                     0001    25 e_y = 1
                     0002    26 e_vx = 2
                     0003    27 e_vy = 3
                     0004    28 e_w = 4
                     0005    29 e_h = 5
                     0006    30 e_col = 6
                     0007    31 e_up_l = 7
                     0008    32 e_up_h = 8
                             33 
                             34 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             35 ;;
                             36 ;;OBJETOS CREADOS CON LA MACROS
                             37 ;;
                             38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             39 
                             40 .globl personaje
                             41 .globl p_a
                             42 .globl p_a1
                             43 
                             44 .globl p_a2
                             45 
                             46 .globl llave
