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
<<<<<<< HEAD
                             35 .globl cube_reset
=======
                             35 .globl destroy_cube
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
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
<<<<<<< HEAD
   422D                       8 DefineCubeLine1 cubedefault, 0x00, 0x00, 0x04, 0x08, 0x0F, 0x01
   422D                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x00, 0x04, 0x08, 0x0F
   0000                       1 cubedefault_dw:
   422D 00 00                 2     .db 0x00, 0x00
   422F 04 08                 3     .db 0x04, 0x08
   4231 0F                    4     .db 0x0F
   4232 01                    3     .db     0x01     ;; Hitpoints
                              9 
                             10 
                             11 
   4233                      12 DefineCubeLine1 cubeline10, 0x00, 0x00, 0x04, 0x08, 0x0F, 0x01
   4233                       1 cubeline10:
   0006                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x00, 0x04, 0x08, 0x0F
   0006                       1 cubeline10_dw:
   4233 00 00                 2     .db 0x00, 0x00
   4235 04 08                 3     .db 0x04, 0x08
   4237 0F                    4     .db 0x0F
   4238 01                    3     .db     0x01     ;; Hitpoints
   4239                      13 DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
   4239                       1 cubeline11:
   000C                       2     DefineDrawableEntity cubeline11_dw, 0x04, 0x00, 0x04, 0x08, 0xFF
   000C                       1 cubeline11_dw:
   4239 04 00                 2     .db 0x04, 0x00
   423B 04 08                 3     .db 0x04, 0x08
   423D FF                    4     .db 0xFF
   423E 01                    3     .db     0x01     ;; Hitpoints
   423F                      14 DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
   423F                       1 cubeline12:
   0012                       2     DefineDrawableEntity cubeline12_dw, 0x08, 0x00, 0x04, 0x08, 0x0F
   0012                       1 cubeline12_dw:
   423F 08 00                 2     .db 0x08, 0x00
   4241 04 08                 3     .db 0x04, 0x08
   4243 0F                    4     .db 0x0F
   4244 01                    3     .db     0x01     ;; Hitpoints
   4245                      15 DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4245                       1 cubeline13:
   0018                       2     DefineDrawableEntity cubeline13_dw, 0x0C, 0x00, 0x04, 0x08, 0xFF
   0018                       1 cubeline13_dw:
   4245 0C 00                 2     .db 0x0C, 0x00
   4247 04 08                 3     .db 0x04, 0x08
   4249 FF                    4     .db 0xFF
   424A 01                    3     .db     0x01     ;; Hitpoints
   424B                      16 DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
   424B                       1 cubeline14:
   001E                       2     DefineDrawableEntity cubeline14_dw, 0x10, 0x00, 0x04, 0x08, 0x0F
   001E                       1 cubeline14_dw:
   424B 10 00                 2     .db 0x10, 0x00
   424D 04 08                 3     .db 0x04, 0x08
   424F 0F                    4     .db 0x0F
   4250 01                    3     .db     0x01     ;; Hitpoints
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



<<<<<<< HEAD
   4251                      17 DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
   4251                       1 cubeline15:
   0024                       2     DefineDrawableEntity cubeline15_dw, 0x14, 0x00, 0x04, 0x08, 0xFF
   0024                       1 cubeline15_dw:
   4251 14 00                 2     .db 0x14, 0x00
   4253 04 08                 3     .db 0x04, 0x08
   4255 FF                    4     .db 0xFF
   4256 01                    3     .db     0x01     ;; Hitpoints
   4257                      18 DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
   4257                       1 cubeline16:
   002A                       2     DefineDrawableEntity cubeline16_dw, 0x18, 0x00, 0x04, 0x08, 0x0F
   002A                       1 cubeline16_dw:
   4257 18 00                 2     .db 0x18, 0x00
   4259 04 08                 3     .db 0x04, 0x08
   425B 0F                    4     .db 0x0F
   425C 01                    3     .db     0x01     ;; Hitpoints
   425D                      19 DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
   425D                       1 cubeline17:
   0030                       2     DefineDrawableEntity cubeline17_dw, 0x1C, 0x00, 0x04, 0x08, 0xFF
   0030                       1 cubeline17_dw:
   425D 1C 00                 2     .db 0x1C, 0x00
   425F 04 08                 3     .db 0x04, 0x08
   4261 FF                    4     .db 0xFF
   4262 01                    3     .db     0x01     ;; Hitpoints
   4263                      20 DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
   4263                       1 cubeline18:
   0036                       2     DefineDrawableEntity cubeline18_dw, 0x20, 0x00, 0x04, 0x08, 0x0F
   0036                       1 cubeline18_dw:
   4263 20 00                 2     .db 0x20, 0x00
   4265 04 08                 3     .db 0x04, 0x08
   4267 0F                    4     .db 0x0F
   4268 01                    3     .db     0x01     ;; Hitpoints
   4269                      21 DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
   4269                       1 cubeline19:
   003C                       2     DefineDrawableEntity cubeline19_dw, 0x24, 0x00, 0x04, 0x08, 0xFF
   003C                       1 cubeline19_dw:
   4269 24 00                 2     .db 0x24, 0x00
   426B 04 08                 3     .db 0x04, 0x08
   426D FF                    4     .db 0xFF
   426E 01                    3     .db     0x01     ;; Hitpoints
   426F                      22 DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
   426F                       1 cubeline110:
   0042                       2     DefineDrawableEntity cubeline110_dw, 0x28, 0x00, 0x04, 0x08, 0x0F
   0042                       1 cubeline110_dw:
   426F 28 00                 2     .db 0x28, 0x00
   4271 04 08                 3     .db 0x04, 0x08
   4273 0F                    4     .db 0x0F
   4274 01                    3     .db     0x01     ;; Hitpoints
   4275                      23 DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
   4275                       1 cubeline111:
   0048                       2     DefineDrawableEntity cubeline111_dw, 0x2C, 0x00, 0x04, 0x08, 0xFF
   0048                       1 cubeline111_dw:
   4275 2C 00                 2     .db 0x2C, 0x00
   4277 04 08                 3     .db 0x04, 0x08
   4279 FF                    4     .db 0xFF
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



<<<<<<< HEAD
   427A 01                    3     .db     0x01     ;; Hitpoints
   427B                      24 DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
   427B                       1 cubeline112:
   004E                       2     DefineDrawableEntity cubeline112_dw, 0x30, 0x00, 0x04, 0x08, 0x0F
   004E                       1 cubeline112_dw:
   427B 30 00                 2     .db 0x30, 0x00
   427D 04 08                 3     .db 0x04, 0x08
   427F 0F                    4     .db 0x0F
   4280 01                    3     .db     0x01     ;; Hitpoints
   4281                      25 DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
   4281                       1 cubeline113:
   0054                       2     DefineDrawableEntity cubeline113_dw, 0x34, 0x00, 0x04, 0x08, 0xFF
   0054                       1 cubeline113_dw:
   4281 34 00                 2     .db 0x34, 0x00
   4283 04 08                 3     .db 0x04, 0x08
   4285 FF                    4     .db 0xFF
   4286 01                    3     .db     0x01     ;; Hitpoints
   4287                      26 DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
   4287                       1 cubeline114:
   005A                       2     DefineDrawableEntity cubeline114_dw, 0x38, 0x00, 0x04, 0x08, 0x0F
   005A                       1 cubeline114_dw:
   4287 38 00                 2     .db 0x38, 0x00
   4289 04 08                 3     .db 0x04, 0x08
   428B 0F                    4     .db 0x0F
   428C 01                    3     .db     0x01     ;; Hitpoints
   428D                      27 DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
   428D                       1 cubeline115:
   0060                       2     DefineDrawableEntity cubeline115_dw, 0x3C, 0x00, 0x04, 0x08, 0xFF
   0060                       1 cubeline115_dw:
   428D 3C 00                 2     .db 0x3C, 0x00
   428F 04 08                 3     .db 0x04, 0x08
   4291 FF                    4     .db 0xFF
   4292 01                    3     .db     0x01     ;; Hitpoints
   4293                      28 DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
   4293                       1 cubeline116:
   0066                       2     DefineDrawableEntity cubeline116_dw, 0x40, 0x00, 0x04, 0x08, 0x0F
   0066                       1 cubeline116_dw:
   4293 40 00                 2     .db 0x40, 0x00
   4295 04 08                 3     .db 0x04, 0x08
   4297 0F                    4     .db 0x0F
   4298 01                    3     .db     0x01     ;; Hitpoints
   4299                      29 DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
   4299                       1 cubeline117:
   006C                       2     DefineDrawableEntity cubeline117_dw, 0x44, 0x00, 0x04, 0x08, 0xFF
   006C                       1 cubeline117_dw:
   4299 44 00                 2     .db 0x44, 0x00
   429B 04 08                 3     .db 0x04, 0x08
   429D FF                    4     .db 0xFF
   429E 01                    3     .db     0x01     ;; Hitpoints
   429F                      30 DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
   429F                       1 cubeline118:
   0072                       2     DefineDrawableEntity cubeline118_dw, 0x48, 0x00, 0x04, 0x08, 0x0F
   0072                       1 cubeline118_dw:
   429F 48 00                 2     .db 0x48, 0x00
   42A1 04 08                 3     .db 0x04, 0x08
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



<<<<<<< HEAD
   42A3 0F                    4     .db 0x0F
   42A4 01                    3     .db     0x01     ;; Hitpoints
   42A5                      31 DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01
   42A5                       1 cubeline119:
   0078                       2     DefineDrawableEntity cubeline119_dw, 0x4C, 0x00, 0x04, 0x08, 0xFF
   0078                       1 cubeline119_dw:
   42A5 4C 00                 2     .db 0x4C, 0x00
   42A7 04 08                 3     .db 0x04, 0x08
   42A9 FF                    4     .db 0xFF
   42AA 01                    3     .db     0x01     ;; Hitpoints
                             32 
   42AB 14                   33 m_num_cube: .db 20
                             34 
   42AC                      35 cube_clear:
   42AC DD 21 33 42   [14]   36 ld ix,#cubeline10
   42B0 CD C9 43      [17]   37 call cube_clearAll
   42B3 DD 21 39 42   [14]   38 ld ix,#cubeline11
   42B7 CD C9 43      [17]   39 call cube_clearAll
   42BA DD 21 3F 42   [14]   40 ld ix,#cubeline12
   42BE CD C9 43      [17]   41 call cube_clearAll
   42C1 DD 21 45 42   [14]   42 ld ix,#cubeline13
   42C5 CD C9 43      [17]   43 call cube_clearAll
   42C8 DD 21 4B 42   [14]   44 ld ix,#cubeline14
   42CC CD C9 43      [17]   45 call cube_clearAll
   42CF DD 21 51 42   [14]   46 ld ix,#cubeline15
   42D3 CD C9 43      [17]   47 call cube_clearAll
   42D6 DD 21 57 42   [14]   48 ld ix,#cubeline16
   42DA CD C9 43      [17]   49 call cube_clearAll
   42DD DD 21 5D 42   [14]   50 ld ix,#cubeline17
   42E1 CD C9 43      [17]   51 call cube_clearAll
   42E4 DD 21 63 42   [14]   52 ld ix,#cubeline18
   42E8 CD C9 43      [17]   53 call cube_clearAll
   42EB DD 21 69 42   [14]   54 ld ix,#cubeline19
   42EF CD C9 43      [17]   55 call cube_clearAll
   42F2 DD 21 6F 42   [14]   56 ld ix,#cubeline110
   42F6 CD C9 43      [17]   57 call cube_clearAll
   42F9 DD 21 75 42   [14]   58 ld ix,#cubeline111
   42FD CD C9 43      [17]   59 call cube_clearAll
   4300 DD 21 7B 42   [14]   60 ld ix,#cubeline112
   4304 CD C9 43      [17]   61 call cube_clearAll
   4307 DD 21 81 42   [14]   62 ld ix,#cubeline113
   430B CD C9 43      [17]   63 call cube_clearAll
   430E DD 21 87 42   [14]   64 ld ix,#cubeline114
   4312 CD C9 43      [17]   65 call cube_clearAll
   4315 DD 21 8D 42   [14]   66 ld ix,#cubeline115
   4319 CD C9 43      [17]   67 call cube_clearAll
   431C DD 21 93 42   [14]   68 ld ix,#cubeline116
   4320 CD C9 43      [17]   69 call cube_clearAll
   4323 DD 21 99 42   [14]   70 ld ix,#cubeline117
   4327 CD C9 43      [17]   71 call cube_clearAll
   432A DD 21 9F 42   [14]   72 ld ix,#cubeline118
   432E CD C9 43      [17]   73 call cube_clearAll
   4331 DD 21 A5 42   [14]   74 ld ix,#cubeline119
   4335 CD C9 43      [17]   75 call cube_clearAll
   4338 C9            [10]   76 ret
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



<<<<<<< HEAD
                             77 
   4339                      78 cube_draw:
   4339 DD 21 33 42   [14]   79 ld ix,#cubeline10
   433D CD C6 43      [17]   80 call cube_drawAll
   4340 DD 21 39 42   [14]   81 ld ix,#cubeline11
   4344 CD C6 43      [17]   82 call cube_drawAll
   4347 DD 21 3F 42   [14]   83 ld ix,#cubeline12
   434B CD C6 43      [17]   84 call cube_drawAll
   434E DD 21 45 42   [14]   85 ld ix,#cubeline13
   4352 CD C6 43      [17]   86 call cube_drawAll
   4355 DD 21 4B 42   [14]   87 ld ix,#cubeline14
   4359 CD C6 43      [17]   88 call cube_drawAll
   435C DD 21 51 42   [14]   89 ld ix,#cubeline15
   4360 CD C6 43      [17]   90 call cube_drawAll
   4363 DD 21 57 42   [14]   91 ld ix,#cubeline16
   4367 CD C6 43      [17]   92 call cube_drawAll
   436A DD 21 5D 42   [14]   93 ld ix,#cubeline17
   436E CD C6 43      [17]   94 call cube_drawAll
   4371 DD 21 63 42   [14]   95 ld ix,#cubeline18
   4375 CD C6 43      [17]   96 call cube_drawAll
   4378 DD 21 69 42   [14]   97 ld ix,#cubeline19
   437C CD C6 43      [17]   98 call cube_drawAll
   437F DD 21 6F 42   [14]   99 ld ix,#cubeline110
   4383 CD C6 43      [17]  100 call cube_drawAll
   4386 DD 21 75 42   [14]  101 ld ix,#cubeline111
   438A CD C6 43      [17]  102 call cube_drawAll
   438D DD 21 7B 42   [14]  103 ld ix,#cubeline112
   4391 CD C6 43      [17]  104 call cube_drawAll
   4394 DD 21 81 42   [14]  105 ld ix,#cubeline113
   4398 CD C6 43      [17]  106 call cube_drawAll
   439B DD 21 87 42   [14]  107 ld ix,#cubeline114
   439F CD C6 43      [17]  108 call cube_drawAll
   43A2 DD 21 8D 42   [14]  109 ld ix,#cubeline115
   43A6 CD C6 43      [17]  110 call cube_drawAll
   43A9 DD 21 93 42   [14]  111 ld ix,#cubeline116
   43AD CD C6 43      [17]  112 call cube_drawAll
   43B0 DD 21 99 42   [14]  113 ld ix,#cubeline117
   43B4 CD C6 43      [17]  114 call cube_drawAll
   43B7 DD 21 9F 42   [14]  115 ld ix,#cubeline118
   43BB CD C6 43      [17]  116 call cube_drawAll
   43BE DD 21 A5 42   [14]  117 ld ix,#cubeline119
   43C2 CD C6 43      [17]  118 call cube_drawAll
   43C5 C9            [10]  119 ret
                            120 
                            121 
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            123 ;; DRAW ENTITY
                            124 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                            125 ;; INPUT: IX -> Points to entity
                            126 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43C6                     127 cube_drawAll:
   43C6 C3 5A 40      [10]  128     jp render_drawCube
                            129    
                            130    
                            131 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



<<<<<<< HEAD
                            132 ;; BORRA UNA ENTIDAD
                            133 ;; PARA CUADRADOS UNICAMENTE
                            134 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                            135 ;; ENTRADA: IX -> Puntero a entidad
                            136 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   43C9                     137 cube_clearAll:
                            138 
   43C9 DD 7E 04      [19]  139    ld  a, dc_col(ix)
   43CC 08            [ 4]  140    ex af, af'
                            141 
   43CD DD 36 04 00   [19]  142    ld  dc_col(ix), #0
                            143 
   43D1 CD 5A 40      [17]  144    call render_drawCube
   43D4 08            [ 4]  145    ex af, af'
   43D5 DD 77 04      [19]  146    ld dc_col(ix), a
                            147 
   43D8 C9            [10]  148    ret
                            149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            150 ;;
                            151 ;;RESET CUBES TO FIRST STATE
                            152 ;;
                            153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   43D9                     154 cube_reset:
                            155 
   43D9 21 33 42      [10]  156 	ld hl, #cubeline10
   43DC 1E 00         [ 7]  157 	ld e, #0
   43DE 16 00         [ 7]  158 	ld d, #0
   43E0 0E 00         [ 7]  159 	ld c, #0
   43E2 DD 21 2D 42   [14]  160 	ld ix, #cubedefault
   43E6                     161 	bucl:
                            162 
   43E6 7A            [ 4]  163 	ld a,d 
                            164 
   43E7 77            [ 7]  165 	ld (hl),a
                            166 
   43E8 C6 04         [ 7]  167 	add #4
                            168 
   43EA 57            [ 4]  169 	ld d,a
   43EB 23            [ 6]  170 	inc hl
                            171 
                            172 
   43EC DD 7E 01      [19]  173 	ld a, dc_y(ix)
   43EF 77            [ 7]  174 	ld (hl),a
                            175 	
   43F0 23            [ 6]  176     	inc hl
                            177 
                            178 
   43F1 DD 7E 02      [19]  179     	ld a, dc_w(ix)
   43F4 77            [ 7]  180 	ld (hl),a
   43F5 23            [ 6]  181     	inc hl
                            182 
                            183 
   43F6 DD 7E 03      [19]  184     	ld a, dc_h(ix)
   43F9 77            [ 7]  185 	ld (hl),a
   43FA 23            [ 6]  186     	inc hl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 11.
Hexadecimal [16-Bits]



                            187     	
   43FB 79            [ 4]  188     	ld a,c
   43FC D6 01         [ 7]  189     	sub #1
                            190 
   43FE CA 0A 44      [10]  191     	jp z, rojo
                            192 
   4401 C6 02         [ 7]  193     	add #2
   4403 4F            [ 4]  194     	ld c,a
   4404 3E 0F         [ 7]  195 	ld a, #15
                            196 
   4406 77            [ 7]  197     	ld (hl),a
                            198 
   4407 C3 11 44      [10]  199     	jp colorok
   440A                     200     	rojo:
   440A 4F            [ 4]  201     	ld c,a
                            202     	
   440B 3E FF         [ 7]  203     	ld a, #255
                            204 
   440D 77            [ 7]  205     	ld (hl),a
                            206 
   440E C3 11 44      [10]  207     	jp colorok
                            208   	
   4411                     209 	colorok:
                            210 
   4411 23            [ 6]  211     	inc hl
                            212 
                            213     	;;hp
   4412 23            [ 6]  214     	inc hl
                            215 
   4413 7B            [ 4]  216   	ld a,e
   4414 C6 01         [ 7]  217   	add #1
                            218 
   4416 5F            [ 4]  219   	ld e,a
                            220 
   4417 D6 14         [ 7]  221   	sub #k_max_cube_line
                            222 
   4419 20 CB         [12]  223     	jr nz, bucl
                            224 
                            225 
                            226 
   441B C9            [10]  227  ret
=======
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
>>>>>>> b2df6abdeacb155e0d7cd4ebd90172ae9204ddc4
