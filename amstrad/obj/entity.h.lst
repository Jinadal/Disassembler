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
                             20    .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _col, _upd
                             21 _name: 
                             22    .db    _x, _y     ;; X, Y
                             23    .db   _vx, _vy     ;; VX, VY
                             24    .db    _w, _h     ;; W, H
                             25    .db   _col           ;; Color
                             26    .dw   _upd        ;; Update 
                             27 .endm
                     0000    28 e_x = 0
                     0001    29 e_y = 1
                     0002    30 e_vx = 2
                     0003    31 e_vy = 3
                     0004    32 e_w = 4
                     0005    33 e_h = 5
                     0006    34 e_col = 6
                     0007    35 e_up_l = 7
                     0008    36 e_up_h = 8
                             37 
                             38 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             39 ;;
                             40 ;;OBJETOS CREADOS CON LA MACROS
                             41 ;;
                             42 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             43 
                             44 .globl personaje
                             45 .globl p_a
                             46 .globl p_a1
                             47 
                             48 .globl p_a2
                             49 
