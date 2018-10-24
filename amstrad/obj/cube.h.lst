ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              3 ;;MACROS
                              4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              5 .macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
                              6 _name:
                              7     DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                              8     .db     _hp     ;; Hitpoints
                              9 .endm
                     0000    10 c_de        = 0
                     0006    11 c_de_size   = 6
                     0006    12 c_hp        = 0 + c_de_size
                             13 ;;.macro DefineCubeLine1Default _name, _suf
                             14 ;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
                             15 ;;.endm
                             16 ;;.macro DefineNCubeLine1 _name, _n
                             17 
                             18 ;;    _s = 0
                             19 ;;    .rept _n
                             20 ;;        DefineCubeLine1Default _name, \_s
                             21 
                             22 ;;        _s = _s + 1
                             23 ;;    .endm
                             24 ;;.endm
                             25 
                             26 
                             27 
                             28 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             29 ;;OBJECTS CREATED WITH MACROS
                             30 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             31 .globl cube_clear
                             32 .globl cube_draw
                             33 .globl cube_drawAll
                             34 .globl cube_clearAll
                             35 
                             36 .globl cube_reset
                             37 
                             38 .globl destroy_cube
                             39 
                             40 .globl k_max_cube_line	
                             41 
<<<<<<< HEAD
                             42 .globl cubeline10
                             43 .globl cubeline11
                             44 .globl cubeline12
                             45 .globl cubeline13
                             46 .globl cubeline14
                             47 .globl cubeline15
                             48 .globl cubeline16
                             49 .globl cubeline17
                             50 .globl cubeline18
                             51 .globl cubeline19
=======
                             42 
                             43 
                             44 .globl k_max_cube_line	
                             45 
                             46 
                             47 .globl cubeline10
                             48 .globl cubeline11
                             49 .globl cubeline12
                             50 .globl cubeline13
                             51 .globl cubeline14
                             52 .globl cubeline15
                             53 .globl cubeline16
                             54 .globl cubeline17
                             55 .globl cubeline18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 .globl cubeline19
                             57 .globl cubeline110
                             58 .globl cubeline111
                             59 .globl cubeline112
                             60 .globl cubeline113
                             61 .globl cubeline114
                             62 .globl cubeline115
                             63 .globl cubeline116
                             64 .globl cubeline117
                             65 .globl cubeline118
                             66 .globl cubeline119
>>>>>>> 57a80898dd8c9252894ecb236b019674046fa86e
