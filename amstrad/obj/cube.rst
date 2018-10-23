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
                             35 .globl destroy_cube
                             36 
                             37 .globl k_max_cube_line	
                             38 
                             39 
                             40 .globl k_max_cube_line	
                             41 
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
                             53 .globl cubeline110
                             54 .globl cubeline111
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             55 .globl cubeline112
                             56 .globl cubeline113
                             57 .globl cubeline114
                             58 .globl cubeline115
                             59 .globl cubeline116
                             60 .globl cubeline117
                             61 .globl cubeline118
                             62 .globl cubeline119
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              3 .include "render.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                              4 
                     0014     5 k_max_cube_line = 20
                     0007     6 k_cube_size = 7
                              7 
   402C                       8 DefineCubeLine1 cubeline10, 0x00, 0x10, 0x04, 0x08, 0x0F, 0x01
   402C                       1 cubeline10:
   0000                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x10, 0x04, 0x08, 0x0F
   0000                       1 cubeline10_dw:
   402C 00 10                 2     .db 0x00, 0x10
   402E 04 08                 3     .db 0x04, 0x08
   4030 0F                    4     .db 0x0F
   4031 01                    3     .db     0x01     ;; Hitpoints
   4032                       9 DefineCubeLine1 cubeline11, 0x04, 0x10, 0x04, 0x08, 0xFF, 0x01
   4032                       1 cubeline11:
   0006                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x10, 0x04, 0x08, 0xFF
   0006                       1 cubeline11_dw:
   4032 04 10                 2     .db 0x04, 0x10
   4034 04 08                 3     .db 0x04, 0x08
   4036 FF                    4     .db 0xFF
   4037 01                    3     .db     0x01     ;; Hitpoints
   4038                      10 DefineCubeLine1 cubeline12, 0x08, 0x10, 0x04, 0x08, 0x0F, 0x01
   4038                       1 cubeline12:
   000C                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x10, 0x04, 0x08, 0x0F
   000C                       1 cubeline12_dw:
   4038 08 10                 2     .db 0x08, 0x10
   403A 04 08                 3     .db 0x04, 0x08
   403C 0F                    4     .db 0x0F
   403D 01                    3     .db     0x01     ;; Hitpoints
   403E                      11 DefineCubeLine1 cubeline13, 0x0C, 0x10, 0x04, 0x08, 0xFF, 0x01
   403E                       1 cubeline13:
   0012                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x10, 0x04, 0x08, 0xFF
   0012                       1 cubeline13_dw:
   403E 0C 10                 2     .db 0x0C, 0x10
   4040 04 08                 3     .db 0x04, 0x08
   4042 FF                    4     .db 0xFF
   4043 01                    3     .db     0x01     ;; Hitpoints
   4044                      12 DefineCubeLine1 cubeline14, 0x10, 0x10, 0x04, 0x08, 0x0F, 0x01
   4044                       1 cubeline14:
   0018                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x10, 0x04, 0x08, 0x0F
   0018                       1 cubeline14_dw:
   4044 10 10                 2     .db 0x10, 0x10
   4046 04 08                 3     .db 0x04, 0x08
   4048 0F                    4     .db 0x0F
   4049 01                    3     .db     0x01     ;; Hitpoints
   404A                      13 DefineCubeLine1 cubeline15, 0x14, 0x10, 0x04, 0x08, 0xFF, 0x01
   404A                       1 cubeline15:
   001E                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x10, 0x04, 0x08, 0xFF
   001E                       1 cubeline15_dw:
   404A 14 10                 2     .db 0x14, 0x10
   404C 04 08                 3     .db 0x04, 0x08
   404E FF                    4     .db 0xFF
   404F 01                    3     .db     0x01     ;; Hitpoints
   4050                      14 DefineCubeLine1 cubeline16, 0x18, 0x10, 0x04, 0x08, 0x0F, 0x01
   4050                       1 cubeline16:
   0024                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x10, 0x04, 0x08, 0x0F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   0024                       1 cubeline16_dw:
   4050 18 10                 2     .db 0x18, 0x10
   4052 04 08                 3     .db 0x04, 0x08
   4054 0F                    4     .db 0x0F
   4055 01                    3     .db     0x01     ;; Hitpoints
   4056                      15 DefineCubeLine1 cubeline17, 0x1C, 0x10, 0x04, 0x08, 0xFF, 0x01
   4056                       1 cubeline17:
   002A                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x10, 0x04, 0x08, 0xFF
   002A                       1 cubeline17_dw:
   4056 1C 10                 2     .db 0x1C, 0x10
   4058 04 08                 3     .db 0x04, 0x08
   405A FF                    4     .db 0xFF
   405B 01                    3     .db     0x01     ;; Hitpoints
   405C                      16 DefineCubeLine1 cubeline18, 0x20, 0x10, 0x04, 0x08, 0x0F, 0x01
   405C                       1 cubeline18:
   0030                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x10, 0x04, 0x08, 0x0F
   0030                       1 cubeline18_dw:
   405C 20 10                 2     .db 0x20, 0x10
   405E 04 08                 3     .db 0x04, 0x08
   4060 0F                    4     .db 0x0F
   4061 01                    3     .db     0x01     ;; Hitpoints
   4062                      17 DefineCubeLine1 cubeline19, 0x24, 0x10, 0x04, 0x08, 0xFF, 0x01
   4062                       1 cubeline19:
   0036                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x10, 0x04, 0x08, 0xFF
   0036                       1 cubeline19_dw:
   4062 24 10                 2     .db 0x24, 0x10
   4064 04 08                 3     .db 0x04, 0x08
   4066 FF                    4     .db 0xFF
   4067 01                    3     .db     0x01     ;; Hitpoints
   4068                      18 DefineCubeLine1 cubeline110, 0x28, 0x10, 0x04, 0x08, 0x0F, 0x01
   4068                       1 cubeline110:
   003C                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x10, 0x04, 0x08, 0x0F
   003C                       1 cubeline110_dw:
   4068 28 10                 2     .db 0x28, 0x10
   406A 04 08                 3     .db 0x04, 0x08
   406C 0F                    4     .db 0x0F
   406D 01                    3     .db     0x01     ;; Hitpoints
   406E                      19 DefineCubeLine1 cubeline111, 0x2C, 0x10, 0x04, 0x08, 0xFF, 0x01
   406E                       1 cubeline111:
   0042                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x10, 0x04, 0x08, 0xFF
   0042                       1 cubeline111_dw:
   406E 2C 10                 2     .db 0x2C, 0x10
   4070 04 08                 3     .db 0x04, 0x08
   4072 FF                    4     .db 0xFF
   4073 01                    3     .db     0x01     ;; Hitpoints
   4074                      20 DefineCubeLine1 cubeline112, 0x30, 0x10, 0x04, 0x08, 0x0F, 0x01
   4074                       1 cubeline112:
   0048                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x10, 0x04, 0x08, 0x0F
   0048                       1 cubeline112_dw:
   4074 30 10                 2     .db 0x30, 0x10
   4076 04 08                 3     .db 0x04, 0x08
   4078 0F                    4     .db 0x0F
   4079 01                    3     .db     0x01     ;; Hitpoints
   407A                      21 DefineCubeLine1 cubeline113, 0x34, 0x10, 0x04, 0x08, 0xFF, 0x01
   407A                       1 cubeline113:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   004E                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x10, 0x04, 0x08, 0xFF
   004E                       1 cubeline113_dw:
   407A 34 10                 2     .db 0x34, 0x10
   407C 04 08                 3     .db 0x04, 0x08
   407E FF                    4     .db 0xFF
   407F 01                    3     .db     0x01     ;; Hitpoints
   4080                      22 DefineCubeLine1 cubeline114, 0x38, 0x10, 0x04, 0x08, 0x0F, 0x01
   4080                       1 cubeline114:
   0054                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x10, 0x04, 0x08, 0x0F
   0054                       1 cubeline114_dw:
   4080 38 10                 2     .db 0x38, 0x10
   4082 04 08                 3     .db 0x04, 0x08
   4084 0F                    4     .db 0x0F
   4085 01                    3     .db     0x01     ;; Hitpoints
   4086                      23 DefineCubeLine1 cubeline115, 0x3C, 0x10, 0x04, 0x08, 0xFF, 0x01
   4086                       1 cubeline115:
   005A                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x10, 0x04, 0x08, 0xFF
   005A                       1 cubeline115_dw:
   4086 3C 10                 2     .db 0x3C, 0x10
   4088 04 08                 3     .db 0x04, 0x08
   408A FF                    4     .db 0xFF
   408B 01                    3     .db     0x01     ;; Hitpoints
   408C                      24 DefineCubeLine1 cubeline116, 0x40, 0x10, 0x04, 0x08, 0x0F, 0x01
   408C                       1 cubeline116:
   0060                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x10, 0x04, 0x08, 0x0F
   0060                       1 cubeline116_dw:
   408C 40 10                 2     .db 0x40, 0x10
   408E 04 08                 3     .db 0x04, 0x08
   4090 0F                    4     .db 0x0F
   4091 01                    3     .db     0x01     ;; Hitpoints
   4092                      25 DefineCubeLine1 cubeline117, 0x44, 0x10, 0x04, 0x08, 0xFF, 0x01
   4092                       1 cubeline117:
   0066                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x10, 0x04, 0x08, 0xFF
   0066                       1 cubeline117_dw:
   4092 44 10                 2     .db 0x44, 0x10
   4094 04 08                 3     .db 0x04, 0x08
   4096 FF                    4     .db 0xFF
   4097 01                    3     .db     0x01     ;; Hitpoints
   4098                      26 DefineCubeLine1 cubeline118, 0x48, 0x10, 0x04, 0x08, 0x0F, 0x01
   4098                       1 cubeline118:
   006C                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x10, 0x04, 0x08, 0x0F
   006C                       1 cubeline118_dw:
   4098 48 10                 2     .db 0x48, 0x10
   409A 04 08                 3     .db 0x04, 0x08
   409C 0F                    4     .db 0x0F
   409D 01                    3     .db     0x01     ;; Hitpoints
   409E                      27 DefineCubeLine1 cubeline119, 0x4C, 0x10, 0x04, 0x08, 0xFF, 0x01
   409E                       1 cubeline119:
   0072                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x10, 0x04, 0x08, 0xFF
   0072                       1 cubeline119_dw:
   409E 4C 10                 2     .db 0x4C, 0x10
   40A0 04 08                 3     .db 0x04, 0x08
   40A2 FF                    4     .db 0xFF
   40A3 01                    3     .db     0x01     ;; Hitpoints
                             28 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   40A4 14                   29 m_num_cube: .db 20
                             30 
   40A5                      31 cube_clear:
   40A5 DD 21 2C 40   [14]   32 ld ix,#cubeline10
   40A9 CD C2 41      [17]   33 call cube_clearAll
   40AC DD 21 32 40   [14]   34 ld ix,#cubeline11
   40B0 CD C2 41      [17]   35 call cube_clearAll
   40B3 DD 21 38 40   [14]   36 ld ix,#cubeline12
   40B7 CD C2 41      [17]   37 call cube_clearAll
   40BA DD 21 3E 40   [14]   38 ld ix,#cubeline13
   40BE CD C2 41      [17]   39 call cube_clearAll
   40C1 DD 21 44 40   [14]   40 ld ix,#cubeline14
   40C5 CD C2 41      [17]   41 call cube_clearAll
   40C8 DD 21 4A 40   [14]   42 ld ix,#cubeline15
   40CC CD C2 41      [17]   43 call cube_clearAll
   40CF DD 21 50 40   [14]   44 ld ix,#cubeline16
   40D3 CD C2 41      [17]   45 call cube_clearAll
   40D6 DD 21 56 40   [14]   46 ld ix,#cubeline17
   40DA CD C2 41      [17]   47 call cube_clearAll
   40DD DD 21 5C 40   [14]   48 ld ix,#cubeline18
   40E1 CD C2 41      [17]   49 call cube_clearAll
   40E4 DD 21 62 40   [14]   50 ld ix,#cubeline19
   40E8 CD C2 41      [17]   51 call cube_clearAll
   40EB DD 21 68 40   [14]   52 ld ix,#cubeline110
   40EF CD C2 41      [17]   53 call cube_clearAll
   40F2 DD 21 6E 40   [14]   54 ld ix,#cubeline111
   40F6 CD C2 41      [17]   55 call cube_clearAll
   40F9 DD 21 74 40   [14]   56 ld ix,#cubeline112
   40FD CD C2 41      [17]   57 call cube_clearAll
   4100 DD 21 7A 40   [14]   58 ld ix,#cubeline113
   4104 CD C2 41      [17]   59 call cube_clearAll
   4107 DD 21 80 40   [14]   60 ld ix,#cubeline114
   410B CD C2 41      [17]   61 call cube_clearAll
   410E DD 21 86 40   [14]   62 ld ix,#cubeline115
   4112 CD C2 41      [17]   63 call cube_clearAll
   4115 DD 21 8C 40   [14]   64 ld ix,#cubeline116
   4119 CD C2 41      [17]   65 call cube_clearAll
   411C DD 21 92 40   [14]   66 ld ix,#cubeline117
   4120 CD C2 41      [17]   67 call cube_clearAll
   4123 DD 21 98 40   [14]   68 ld ix,#cubeline118
   4127 CD C2 41      [17]   69 call cube_clearAll
   412A DD 21 9E 40   [14]   70 ld ix,#cubeline119
   412E CD C2 41      [17]   71 call cube_clearAll
   4131 C9            [10]   72 ret
                             73 
   4132                      74 cube_draw:
   4132 DD 21 2C 40   [14]   75 ld ix,#cubeline10
   4136 CD BF 41      [17]   76 call cube_drawAll
   4139 DD 21 32 40   [14]   77 ld ix,#cubeline11
   413D CD BF 41      [17]   78 call cube_drawAll
   4140 DD 21 38 40   [14]   79 ld ix,#cubeline12
   4144 CD BF 41      [17]   80 call cube_drawAll
   4147 DD 21 3E 40   [14]   81 ld ix,#cubeline13
   414B CD BF 41      [17]   82 call cube_drawAll
   414E DD 21 44 40   [14]   83 ld ix,#cubeline14
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4152 CD BF 41      [17]   84 call cube_drawAll
   4155 DD 21 4A 40   [14]   85 ld ix,#cubeline15
   4159 CD BF 41      [17]   86 call cube_drawAll
   415C DD 21 50 40   [14]   87 ld ix,#cubeline16
   4160 CD BF 41      [17]   88 call cube_drawAll
   4163 DD 21 56 40   [14]   89 ld ix,#cubeline17
   4167 CD BF 41      [17]   90 call cube_drawAll
   416A DD 21 5C 40   [14]   91 ld ix,#cubeline18
   416E CD BF 41      [17]   92 call cube_drawAll
   4171 DD 21 62 40   [14]   93 ld ix,#cubeline19
   4175 CD BF 41      [17]   94 call cube_drawAll
   4178 DD 21 68 40   [14]   95 ld ix,#cubeline110
   417C CD BF 41      [17]   96 call cube_drawAll
   417F DD 21 6E 40   [14]   97 ld ix,#cubeline111
   4183 CD BF 41      [17]   98 call cube_drawAll
   4186 DD 21 74 40   [14]   99 ld ix,#cubeline112
   418A CD BF 41      [17]  100 call cube_drawAll
   418D DD 21 7A 40   [14]  101 ld ix,#cubeline113
   4191 CD BF 41      [17]  102 call cube_drawAll
   4194 DD 21 80 40   [14]  103 ld ix,#cubeline114
   4198 CD BF 41      [17]  104 call cube_drawAll
   419B DD 21 86 40   [14]  105 ld ix,#cubeline115
   419F CD BF 41      [17]  106 call cube_drawAll
   41A2 DD 21 8C 40   [14]  107 ld ix,#cubeline116
   41A6 CD BF 41      [17]  108 call cube_drawAll
   41A9 DD 21 92 40   [14]  109 ld ix,#cubeline117
   41AD CD BF 41      [17]  110 call cube_drawAll
   41B0 DD 21 98 40   [14]  111 ld ix,#cubeline118
   41B4 CD BF 41      [17]  112 call cube_drawAll
   41B7 DD 21 9E 40   [14]  113 ld ix,#cubeline119
   41BB CD BF 41      [17]  114 call cube_drawAll
   41BE C9            [10]  115 ret
                            116 
                            117 
                            118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            119 ;; DRAW ENTITY
                            120 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            121 ;; INPUT: IX -> Points to entity
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41BF                     123 cube_drawAll:
   41BF C3 AB 43      [10]  124     jp render_drawCube
                            125    
                            126    
                            127 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            128 ;; BORRA UNA ENTIDAD
                            129 ;; PARA CUADRADOS UNICAMENTE
                            130 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            131 ;; ENTRADA: IX -> Puntero a entidad
                            132 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41C2                     133 cube_clearAll:
                            134 
   41C2 DD 7E 04      [19]  135    ld  a, dc_col(ix)
   41C5 08            [ 4]  136    ex af, af'
                            137 
   41C6 DD 36 04 00   [19]  138    ld  dc_col(ix), #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            139 
   41CA CD AB 43      [17]  140    call render_drawCube
   41CD 08            [ 4]  141    ex af, af'
   41CE DD 77 04      [19]  142    ld dc_col(ix), a
                            143 
   41D1 C9            [10]  144    ret
                            145 
   41D2                     146 destroy_cube:
   41D2 36 FF         [10]  147 ld (hl),#0xFF
   41D4 23            [ 6]  148 inc hl
   41D5 23            [ 6]  149 inc hl
   41D6 23            [ 6]  150 inc hl
   41D7 23            [ 6]  151 inc hl
                            152 
   41D8 36 00         [10]  153 ld (hl),#0x00
                            154 
   41DA 2B            [ 6]  155 dec hl
   41DB 2B            [ 6]  156 dec hl
   41DC 2B            [ 6]  157 dec hl
   41DD 2B            [ 6]  158 dec hl
                            159 
                            160 
                            161 
   41DE C9            [10]  162 ret
