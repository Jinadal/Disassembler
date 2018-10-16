ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .globl ent_clear
                              3 .globl ent_draw
                              4 .globl ent_update
                              5 .globl ent_move
                              6 .globl ent_move2
                              7 .globl ent_moveKeyboard
                              8 .globl ent_collide
                              9 
                             10 
                             11 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             12 ;;
                             13 ;;MACROS
                             14 ;;
                             15 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             16 
                             17    .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _col, _upd, _key,_hp
                             18 _name: 
                             19    .db    _x, _y     ;; X, Y
                             20    .db   _vx, _vy    ;; VX, VY
                             21    .db    _w, _h     ;; W, H
                             22    .db   _col        ;; Color
                             23    .dw   _upd        ;; Update 
                             24    .db   _key        ;; Key   
                             25    .db 	 _hp         ;; HP
                             26 .endm
                     0000    27 e_x = 0
                     0001    28 e_y = 1
                     0002    29 e_vx = 2
                     0003    30 e_vy = 3
                     0004    31 e_w = 4
                     0005    32 e_h = 5
                     0006    33 e_col = 6
                     0007    34 e_up_l = 7
                     0008    35 e_up_h = 8
                     0009    36 e_key = 9
                     000A    37 e_hp = 10	
                             38 
                             39 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             40 ;;
                             41 ;;OBJETOS CREADOS CON LA MACROS
                             42 ;;
                             43 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             44 
                             45 .globl personaje
                             46 
