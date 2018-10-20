ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;###########################################################################
                              2 ;#### FICHERO: entity.h.s
                              3 ;###########################################################################
                              4 .macro DefineEntity _name, _x, _y, _w, _h, _col
                              5 _name:
                              6    .db    _x, _y     ;; X, Y
                              7    .db    _w, _h     ;; W, H
                              8    .db   _col           ;; Color
                              9 .endm
                             10 .macro DefineEntityDefault _name, _suf
                             11    DefineEntity _name'_suf, 0xAA, 0, 0, 0, 0xFFFF
                             12 .endm
                             13 .macro DefineNEntities _name, _n
                             14   _c = 0
                             15   .rept _n
                             16      DefineEntityDefault _name, \_c
                             17      _c = _c + 1
                             18   .endm
                             19 .endm
                     0000    20 e_x = 0
                     0001    21 e_y = 1
                     0002    22 e_w = 2
                     0003    23 e_h = 3
                     0004    24 e_col = 4
                             25  
                             26  
                             27 .globl ent_draw
                             28 .globl ent_clear
                             29 .globl ent_copy
                             30 .globl ent_new
                             31 .globl ent_doForAll
                             32 .globl cube_reposition
                             33 
                             34 .globl hero_data
                             35 .globl enemy_data
                             36  
                             37  
                             38  
