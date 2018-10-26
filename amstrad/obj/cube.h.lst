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
                             35 .globl cube_loses_life
                             36 .globl cube_reset
                             37 
                             38 .globl destroy_cube
                             39 
                             40 .globl k_cube_size
                             41 .globl k_max_cube_line	
                             42 
                             43 .globl cubeline10
                             44 .globl cubeline11
                             45 .globl cubeline12
                             46 .globl cubeline13
                             47 .globl cubeline14
                             48 .globl cubeline15
                             49 .globl cubeline16
                             50 .globl cubeline17
                             51 .globl cubeline18
                             52 .globl cubeline19
                             53 
                             54 .globl cubeline20
                             55 .globl cubeline21
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 .globl cubeline22
                             57 .globl cubeline23
                             58 .globl cubeline24
                             59 .globl cubeline25
                             60 .globl cubeline26
                             61 .globl cubeline27
                             62 .globl cubeline28
                             63 .globl cubeline29
                             64 
                             65 .globl cubeline30
                             66 .globl cubeline31
                             67 .globl cubeline32
                             68 .globl cubeline33
                             69 .globl cubeline34
                             70 .globl cubeline35
                             71 .globl cubeline36
                             72 .globl cubeline37
                             73 .globl cubeline38
                             74 .globl cubeline39
                             75 
                             76 .globl cubeline40
                             77 .globl cubeline41
                             78 .globl cubeline42
                             79 .globl cubeline43
                             80 .globl cubeline44
                             81 .globl cubeline45
                             82 .globl cubeline46
                             83 .globl cubeline47
                             84 .globl cubeline48
                             85 .globl cubeline49
