ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "main.h.s"
                              1 .globl cpct_disableFirmware_asm
                              2 .globl cpct_drawSolidBox_asm
                              3 .globl cpct_getScreenPtr_asm
                              4 .globl cpct_waitVSYNC_asm
                              5 .globl cpct_setVideoMode_asm
                              6 .globl cpct_scanKeyboard_asm
                              7 .globl cpct_isKeyPressed_asm
                              8 .globl cpct_setVideoMemoryPage_asm
                              9 .globl _cpct_memset_f64_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 .include "cube.h.s"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              1 .include "render.h.s"
                              1 
                              2 
                              3 ;;Drawable Entity
                              4 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _col
                              5 _name:
                              6     .db _x, _y
                              7     .db _w, _h
                              8     .db _col
                              9 .endm
                     0001    10 dc_x    = 0     dc_y    = 1
                     0003    11 dc_w    = 2     dc_h    = 3
                     0004    12 dc_col  = 4
                             13 
                             14 .globl ren_clearBackBuffers
                             15 ;;.globl ren_switchBuffers
                             16 .globl render_drawCube
                             17 .globl ren_newScene
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



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
                             36 
                             37 .globl cubeline10
                             38 .globl cubeline11
                             39 .globl cubeline12
                             40 .globl cubeline13
                             41 .globl cubeline14
                             42 .globl cubeline15
                             43 .globl cubeline16
                             44 .globl cubeline17
                             45 .globl cubeline18
                             46 .globl cubeline19
                             47 .globl cubeline110
                             48 .globl cubeline111
                             49 .globl cubeline112
                             50 .globl cubeline113
                             51 .globl cubeline114
                             52 .globl cubeline115
                             53 .globl cubeline116
                             54 .globl cubeline117
                             55 .globl cubeline118
                             56 .globl cubeline119
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                              3 
                     0014     4 k_max_cube_line = 20
                     0007     5 k_cube_size = 7
                              6 
   4029                       7 DefineCubeLine1 cubeline10, 0x00, 0x100, 0x04, 0x08, 0x0F, 0x01
   4029                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x100, 0x04, 0x08, 0x0F
   0000                       1 cubeline10_dw:
   4029 00 00                 2     .db 0x00, 0x100
   402B 04 08                 3     .db 0x04, 0x08
   402D 0F                    4     .db 0x0F
   402E 01                    3     .db     0x01     ;; Hitpoints
   402F                       8 DefineCubeLine1 cubeline11, 0x04, 0x100, 0x04, 0x08, 0xFF, 0x01
   402F                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x100, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   402F 04 00                 2     .db 0x04, 0x100
   4031 04 08                 3     .db 0x04, 0x08
   4033 FF                    4     .db 0xFF
   4034 01                    3     .db     0x01     ;; Hitpoints
   4035                       9 DefineCubeLine1 cubeline12, 0x08, 0x100, 0x04, 0x08, 0x0F, 0x01
   4035                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x100, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   4035 08 00                 2     .db 0x08, 0x100
   4037 04 08                 3     .db 0x04, 0x08
   4039 0F                    4     .db 0x0F
   403A 01                    3     .db     0x01     ;; Hitpoints
   403B                      10 DefineCubeLine1 cubeline13, 0x0C, 0x100, 0x04, 0x08, 0xFF, 0x01
   403B                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x100, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   403B 0C 00                 2     .db 0x0C, 0x100
   403D 04 08                 3     .db 0x04, 0x08
   403F FF                    4     .db 0xFF
   4040 01                    3     .db     0x01     ;; Hitpoints
   4041                      11 DefineCubeLine1 cubeline14, 0x10, 0x100, 0x04, 0x08, 0x0F, 0x01
   4041                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x100, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   4041 10 00                 2     .db 0x10, 0x100
   4043 04 08                 3     .db 0x04, 0x08
   4045 0F                    4     .db 0x0F
   4046 01                    3     .db     0x01     ;; Hitpoints
   4047                      12 DefineCubeLine1 cubeline15, 0x14, 0x100, 0x04, 0x08, 0xFF, 0x01
   4047                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x100, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   4047 14 00                 2     .db 0x14, 0x100
   4049 04 08                 3     .db 0x04, 0x08
   404B FF                    4     .db 0xFF
   404C 01                    3     .db     0x01     ;; Hitpoints
   404D                      13 DefineCubeLine1 cubeline16, 0x18, 0x100, 0x04, 0x08, 0x0F, 0x01
   404D                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x100, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   404D 18 00                 2     .db 0x18, 0x100
   404F 04 08                 3     .db 0x04, 0x08
   4051 0F                    4     .db 0x0F
   4052 01                    3     .db     0x01     ;; Hitpoints
   4053                      14 DefineCubeLine1 cubeline17, 0x1C, 0x100, 0x04, 0x08, 0xFF, 0x01
   4053                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x100, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   4053 1C 00                 2     .db 0x1C, 0x100
   4055 04 08                 3     .db 0x04, 0x08
   4057 FF                    4     .db 0xFF
   4058 01                    3     .db     0x01     ;; Hitpoints
   4059                      15 DefineCubeLine1 cubeline18, 0x20, 0x100, 0x04, 0x08, 0x0F, 0x01
   4059                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x100, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   4059 20 00                 2     .db 0x20, 0x100
   405B 04 08                 3     .db 0x04, 0x08
   405D 0F                    4     .db 0x0F
   405E 01                    3     .db     0x01     ;; Hitpoints
   405F                      16 DefineCubeLine1 cubeline19, 0x24, 0x100, 0x04, 0x08, 0xFF, 0x01
   405F                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x100, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   405F 24 00                 2     .db 0x24, 0x100
   4061 04 08                 3     .db 0x04, 0x08
   4063 FF                    4     .db 0xFF
   4064 01                    3     .db     0x01     ;; Hitpoints
   4065                      17 DefineCubeLine1 cubeline110, 0x28, 0x100, 0x04, 0x08, 0x0F, 0x01
   4065                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x100, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   4065 28 00                 2     .db 0x28, 0x100
   4067 04 08                 3     .db 0x04, 0x08
   4069 0F                    4     .db 0x0F
   406A 01                    3     .db     0x01     ;; Hitpoints
   406B                      18 DefineCubeLine1 cubeline111, 0x2C, 0x100, 0x04, 0x08, 0xFF, 0x01
   406B                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x100, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   406B 2C 00                 2     .db 0x2C, 0x100
   406D 04 08                 3     .db 0x04, 0x08
   406F FF                    4     .db 0xFF
   4070 01                    3     .db     0x01     ;; Hitpoints
   4071                      19 DefineCubeLine1 cubeline112, 0x30, 0x100, 0x04, 0x08, 0x0F, 0x01
   4071                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x100, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4071 30 00                 2     .db 0x30, 0x100
   4073 04 08                 3     .db 0x04, 0x08
   4075 0F                    4     .db 0x0F
   4076 01                    3     .db     0x01     ;; Hitpoints
   4077                      20 DefineCubeLine1 cubeline113, 0x34, 0x100, 0x04, 0x08, 0xFF, 0x01
   4077                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x100, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   4077 34 00                 2     .db 0x34, 0x100
   4079 04 08                 3     .db 0x04, 0x08
   407B FF                    4     .db 0xFF
   407C 01                    3     .db     0x01     ;; Hitpoints
   407D                      21 DefineCubeLine1 cubeline114, 0x38, 0x100, 0x04, 0x08, 0x0F, 0x01
   407D                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x100, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   407D 38 00                 2     .db 0x38, 0x100
   407F 04 08                 3     .db 0x04, 0x08
   4081 0F                    4     .db 0x0F
   4082 01                    3     .db     0x01     ;; Hitpoints
   4083                      22 DefineCubeLine1 cubeline115, 0x3C, 0x100, 0x04, 0x08, 0xFF, 0x01
   4083                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x100, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   4083 3C 00                 2     .db 0x3C, 0x100
   4085 04 08                 3     .db 0x04, 0x08
   4087 FF                    4     .db 0xFF
   4088 01                    3     .db     0x01     ;; Hitpoints
   4089                      23 DefineCubeLine1 cubeline116, 0x40, 0x100, 0x04, 0x08, 0x0F, 0x01
   4089                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x100, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   4089 40 00                 2     .db 0x40, 0x100
   408B 04 08                 3     .db 0x04, 0x08
   408D 0F                    4     .db 0x0F
   408E 01                    3     .db     0x01     ;; Hitpoints
   408F                      24 DefineCubeLine1 cubeline117, 0x44, 0x100, 0x04, 0x08, 0xFF, 0x01
   408F                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x100, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   408F 44 00                 2     .db 0x44, 0x100
   4091 04 08                 3     .db 0x04, 0x08
   4093 FF                    4     .db 0xFF
   4094 01                    3     .db     0x01     ;; Hitpoints
   4095                      25 DefineCubeLine1 cubeline118, 0x48, 0x100, 0x04, 0x08, 0x0F, 0x01
   4095                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x100, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   4095 48 00                 2     .db 0x48, 0x100
   4097 04 08                 3     .db 0x04, 0x08
   4099 0F                    4     .db 0x0F
   409A 01                    3     .db     0x01     ;; Hitpoints
   409B                      26 DefineCubeLine1 cubeline119, 0x4C, 0x100, 0x04, 0x08, 0xFF, 0x01
   409B                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x100, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   409B 4C 00                 2     .db 0x4C, 0x100
   409D 04 08                 3     .db 0x04, 0x08
   409F FF                    4     .db 0xFF
   40A0 01                    3     .db     0x01     ;; Hitpoints
                             27 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   40A1 14                   28 m_num_cube: .db 20
                             29 
   40A2                      30 cube_clear:
   40A2 DD 21 29 40   [14]   31 ld ix,#cubeline10
   40A6 CD BF 41      [17]   32 call cube_clearAll
   40A9 DD 21 2F 40   [14]   33 ld ix,#cubeline11
   40AD CD BF 41      [17]   34 call cube_clearAll
   40B0 DD 21 35 40   [14]   35 ld ix,#cubeline12
   40B4 CD BF 41      [17]   36 call cube_clearAll
   40B7 DD 21 3B 40   [14]   37 ld ix,#cubeline13
   40BB CD BF 41      [17]   38 call cube_clearAll
   40BE DD 21 41 40   [14]   39 ld ix,#cubeline14
   40C2 CD BF 41      [17]   40 call cube_clearAll
   40C5 DD 21 47 40   [14]   41 ld ix,#cubeline15
   40C9 CD BF 41      [17]   42 call cube_clearAll
   40CC DD 21 4D 40   [14]   43 ld ix,#cubeline16
   40D0 CD BF 41      [17]   44 call cube_clearAll
   40D3 DD 21 53 40   [14]   45 ld ix,#cubeline17
   40D7 CD BF 41      [17]   46 call cube_clearAll
   40DA DD 21 59 40   [14]   47 ld ix,#cubeline18
   40DE CD BF 41      [17]   48 call cube_clearAll
   40E1 DD 21 5F 40   [14]   49 ld ix,#cubeline19
   40E5 CD BF 41      [17]   50 call cube_clearAll
   40E8 DD 21 65 40   [14]   51 ld ix,#cubeline110
   40EC CD BF 41      [17]   52 call cube_clearAll
   40EF DD 21 6B 40   [14]   53 ld ix,#cubeline111
   40F3 CD BF 41      [17]   54 call cube_clearAll
   40F6 DD 21 71 40   [14]   55 ld ix,#cubeline112
   40FA CD BF 41      [17]   56 call cube_clearAll
   40FD DD 21 77 40   [14]   57 ld ix,#cubeline113
   4101 CD BF 41      [17]   58 call cube_clearAll
   4104 DD 21 7D 40   [14]   59 ld ix,#cubeline114
   4108 CD BF 41      [17]   60 call cube_clearAll
   410B DD 21 83 40   [14]   61 ld ix,#cubeline115
   410F CD BF 41      [17]   62 call cube_clearAll
   4112 DD 21 89 40   [14]   63 ld ix,#cubeline116
   4116 CD BF 41      [17]   64 call cube_clearAll
   4119 DD 21 8F 40   [14]   65 ld ix,#cubeline117
   411D CD BF 41      [17]   66 call cube_clearAll
   4120 DD 21 95 40   [14]   67 ld ix,#cubeline118
   4124 CD BF 41      [17]   68 call cube_clearAll
   4127 DD 21 9B 40   [14]   69 ld ix,#cubeline119
   412B CD BF 41      [17]   70 call cube_clearAll
   412E C9            [10]   71 ret
                             72 
   412F                      73 cube_draw:
   412F DD 21 29 40   [14]   74 ld ix,#cubeline10
   4133 CD BC 41      [17]   75 call cube_drawAll
   4136 DD 21 2F 40   [14]   76 ld ix,#cubeline11
   413A CD BC 41      [17]   77 call cube_drawAll
   413D DD 21 35 40   [14]   78 ld ix,#cubeline12
   4141 CD BC 41      [17]   79 call cube_drawAll
   4144 DD 21 3B 40   [14]   80 ld ix,#cubeline13
   4148 CD BC 41      [17]   81 call cube_drawAll
   414B DD 21 41 40   [14]   82 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   414F CD BC 41      [17]   83 call cube_drawAll
   4152 DD 21 47 40   [14]   84 ld ix,#cubeline15
   4156 CD BC 41      [17]   85 call cube_drawAll
   4159 DD 21 4D 40   [14]   86 ld ix,#cubeline16
   415D CD BC 41      [17]   87 call cube_drawAll
   4160 DD 21 53 40   [14]   88 ld ix,#cubeline17
   4164 CD BC 41      [17]   89 call cube_drawAll
   4167 DD 21 59 40   [14]   90 ld ix,#cubeline18
   416B CD BC 41      [17]   91 call cube_drawAll
   416E DD 21 5F 40   [14]   92 ld ix,#cubeline19
   4172 CD BC 41      [17]   93 call cube_drawAll
   4175 DD 21 65 40   [14]   94 ld ix,#cubeline110
   4179 CD BC 41      [17]   95 call cube_drawAll
   417C DD 21 6B 40   [14]   96 ld ix,#cubeline111
   4180 CD BC 41      [17]   97 call cube_drawAll
   4183 DD 21 71 40   [14]   98 ld ix,#cubeline112
   4187 CD BC 41      [17]   99 call cube_drawAll
   418A DD 21 77 40   [14]  100 ld ix,#cubeline113
   418E CD BC 41      [17]  101 call cube_drawAll
   4191 DD 21 7D 40   [14]  102 ld ix,#cubeline114
   4195 CD BC 41      [17]  103 call cube_drawAll
   4198 DD 21 83 40   [14]  104 ld ix,#cubeline115
   419C CD BC 41      [17]  105 call cube_drawAll
   419F DD 21 89 40   [14]  106 ld ix,#cubeline116
   41A3 CD BC 41      [17]  107 call cube_drawAll
   41A6 DD 21 8F 40   [14]  108 ld ix,#cubeline117
   41AA CD BC 41      [17]  109 call cube_drawAll
   41AD DD 21 95 40   [14]  110 ld ix,#cubeline118
   41B1 CD BC 41      [17]  111 call cube_drawAll
   41B4 DD 21 9B 40   [14]  112 ld ix,#cubeline119
   41B8 CD BC 41      [17]  113 call cube_drawAll
   41BB C9            [10]  114 ret
                            115 
                            116 
                            117 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            118 ;; DRAW ENTITY
                            119 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            120 ;; INPUT: IX -> Points to entity
                            121 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41BC                     122 cube_drawAll:
   41BC C3 7B 43      [10]  123     jp render_drawCube
                            124    
                            125    
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            127 ;; BORRA UNA ENTIDAD
                            128 ;; PARA CUADRADOS UNICAMENTE
                            129 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            130 ;; ENTRADA: IX -> Puntero a entidad
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41BF                     132 cube_clearAll:
                            133 
   41BF DD 7E 04      [19]  134    ld  a, dc_col(ix)
   41C2 08            [ 4]  135    ex af, af'
                            136 
   41C3 DD 36 04 00   [19]  137    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            138 
   41C7 CD 7B 43      [17]  139    call render_drawCube
   41CA 08            [ 4]  140    ex af, af'
   41CB DD 77 04      [19]  141    ld dc_col(ix), a
                            142 
   41CE C9            [10]  143    ret
