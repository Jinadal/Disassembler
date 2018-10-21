ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              3 ;;MACROS
                              4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              5 .macro DefineCubeLine1 _name, _x, _y, _w, _h, _hp, _col
                              6 _name:
                              7     .db     _x, _y  ;; X, Y
                              8     .db     _w, _h  ;; W, H
                              9     .db     _hp     ;; Hitpoints
                             10     .db     _col    ;; Color
                             11 .endm
                             12 .macro DefineCubeLine1Default _name, _suf
                             13     DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0, 0xFF
                             14 .endm
                             15 .macro DefineNCubeLine1 _name, _n
                             16 
                             17     _s = 0
                             18     .rept _n
                             19         DefineCubeLine1Default _name, \_s
                             20 
                             21         _s = _s + 1
                             22     .endm
                             23 .endm
                     0000    24 c_x = 0
                     0001    25 c_y = 1
                     0002    26 c_w = 2
                     0003    27 c_h = 3
                     0004    28 c_hp = 4
                     0005    29 c_col = 5
                             30 
                             31 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             32 ;;OBJECTS CREATED WITH MACROS
                             33 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             34 .globl cube_clear
                             35 .globl cube_draw
                             36 .globl cube_drawAll
                             37 .globl cube_clearAll
                             38 
                             39 
                             40 .globl cubeline10
                             41 .globl cubeline11
                             42 .globl cubeline12
                             43 .globl cubeline13
                             44 .globl cubeline14
                             45 .globl cubeline15
                             46 .globl cubeline16
                             47 .globl cubeline17
                             48 .globl cubeline18
                             49 .globl cubeline19
                             50 .globl cubeline110
                             51 .globl cubeline111
                             52 .globl cubeline112
                             53 .globl cubeline113
                             54 .globl cubeline114
                             55 .globl cubeline115
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 .globl cubeline116
                             57 .globl cubeline117
                             58 .globl cubeline118
                             59 .globl cubeline119
