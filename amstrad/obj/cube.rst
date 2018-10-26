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
                             10 .globl cpct_drawSprite_asm
                             11 .globl cpct_setPalette_asm
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
                             35 
                             36 .globl cube_reset
                             37 
                             38 .globl destroy_cube
                             39 
                             40 .globl k_max_cube_line	
                             41 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              3 .include "render.h.s"
                              1 
                              2 
                              3 ;;Drawable Entity
                              4 .macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
                              5 _name:
                              6     .db _x, _y
                              7     .db _w, _h
                              8     .dw _sprite
                              9 
                             10 _name'_size = . - _name
                             11 .endm
                     0001    12 dc_x    = 0     dc_y    = 1
                     0003    13 dc_w    = 2     dc_h    = 3
                     0005    14 dc_sp_l  = 4    dc_sp_h  = 5
                             15 
                             16 .globl ren_clearBackBuffers
                             17 ;;.globl ren_switchBuffers
                             18 .globl render_drawCube
                             19 .globl ren_newScene
                             20 .globl m_back_buffer
                             21 .globl m_front_buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              4 .include "ball.h.s"
                              1 
                              2 
                              3 
                              4 .globl ball_clear
                              5 .globl ball_draw
                              6 .globl ball_update
                              7 .globl ball_move
                              8 .globl ball_reset
                              9 
                             10 
                             11 
                             12 
                             13 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
                             14 ;;
                             15 ;;MACROS
                             16 ;;
                             17 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             18 
                             19    .macro DefineBall _name, _x, _y, _w, _h, _sprite,  _vx, _vy,_upd,_hp
                             20 _name: 
                             21 	DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _sprite
                             22   ; .db    _x, _y     ;; X, Y
                             23    ;.db    _w, _h     ;; W, H
                             24     ;.db   _col        ;; Color
                             25    .db   _vx, _vy    ;; VX, VY
                             26    .dw   _upd        ;; Update 
                             27    .db _hp
                             28 .endm
                             29 ;bl_x = 0
                             30 ;bl_y = 1
                             31 ;bl_w = 2
                             32 ;bl_h = 3
                             33 ;bl_col = 4
                     0006    34 bl_vx = 6
                     0007    35 bl_vy = 7
                     0008    36 bl_up_l = 8
                     0009    37 bl_up_h = 9
                     000A    38 bl_hp = 10
                             39 	
                             40 
                             41 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             42 ;;
                             43 ;;OBJETOS CREADOS CON LA MACROS
                             44 ;;
                             45 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             46 
                             47 .globl ball
                             48 .globl balldefault
                             49 ;.globl screenPointer
                             50 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                              5 
                              6 .globl _cubeline_sp
                              7 
                              8 
                     000A     9 k_max_cube_line = 10
                     0007    10 k_cube_size = 7
                             11 
                             12 
   40CD                      13 DefineCubeLine1 cubedefault, 0x00, 0x10, 0x04, 0x08, _cubeline_sp, 0x01
   40CD                       1 cubedefault:
   0000                       2     DefineDrawableEntity cubedefault_dw, 0x00, 0x10, 0x04, 0x08, _cubeline_sp
   0000                       1 cubedefault_dw:
   40CD 00 10                 2     .db 0x00, 0x10
   40CF 04 08                 3     .db 0x04, 0x08
   40D1 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubedefault_dw_size = . - cubedefault_dw
   40D3 01                    3     .db     0x01     ;; Hitpoints
                             14 
                             15 
   40D4                      16 DefineCubeLine1 cubeline10, 0x00, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40D4                       1 cubeline10:
   0007                       2     DefineDrawableEntity cubeline10_dw, 0x00, 0x10, 0x08, 0x08, _cubeline_sp
   0007                       1 cubeline10_dw:
   40D4 00 10                 2     .db 0x00, 0x10
   40D6 08 08                 3     .db 0x08, 0x08
   40D8 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline10_dw_size = . - cubeline10_dw
   40DA 01                    3     .db     0x01     ;; Hitpoints
   40DB                      17 DefineCubeLine1 cubeline11, 0x08, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40DB                       1 cubeline11:
   000E                       2     DefineDrawableEntity cubeline11_dw, 0x08, 0x10, 0x08, 0x08, _cubeline_sp
   000E                       1 cubeline11_dw:
   40DB 08 10                 2     .db 0x08, 0x10
   40DD 08 08                 3     .db 0x08, 0x08
   40DF 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline11_dw_size = . - cubeline11_dw
   40E1 01                    3     .db     0x01     ;; Hitpoints
   40E2                      18 DefineCubeLine1 cubeline12, 0x10, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40E2                       1 cubeline12:
   0015                       2     DefineDrawableEntity cubeline12_dw, 0x10, 0x10, 0x08, 0x08, _cubeline_sp
   0015                       1 cubeline12_dw:
   40E2 10 10                 2     .db 0x10, 0x10
   40E4 08 08                 3     .db 0x08, 0x08
   40E6 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline12_dw_size = . - cubeline12_dw
   40E8 01                    3     .db     0x01     ;; Hitpoints
   40E9                      19 DefineCubeLine1 cubeline13, 0x18, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40E9                       1 cubeline13:
   001C                       2     DefineDrawableEntity cubeline13_dw, 0x18, 0x10, 0x08, 0x08, _cubeline_sp
   001C                       1 cubeline13_dw:
   40E9 18 10                 2     .db 0x18, 0x10
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



   40EB 08 08                 3     .db 0x08, 0x08
   40ED 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline13_dw_size = . - cubeline13_dw
   40EF 01                    3     .db     0x01     ;; Hitpoints
   40F0                      20 DefineCubeLine1 cubeline14, 0x20, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40F0                       1 cubeline14:
   0023                       2     DefineDrawableEntity cubeline14_dw, 0x20, 0x10, 0x08, 0x08, _cubeline_sp
   0023                       1 cubeline14_dw:
   40F0 20 10                 2     .db 0x20, 0x10
   40F2 08 08                 3     .db 0x08, 0x08
   40F4 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline14_dw_size = . - cubeline14_dw
   40F6 01                    3     .db     0x01     ;; Hitpoints
   40F7                      21 DefineCubeLine1 cubeline15, 0x28, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40F7                       1 cubeline15:
   002A                       2     DefineDrawableEntity cubeline15_dw, 0x28, 0x10, 0x08, 0x08, _cubeline_sp
   002A                       1 cubeline15_dw:
   40F7 28 10                 2     .db 0x28, 0x10
   40F9 08 08                 3     .db 0x08, 0x08
   40FB 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline15_dw_size = . - cubeline15_dw
   40FD 01                    3     .db     0x01     ;; Hitpoints
   40FE                      22 DefineCubeLine1 cubeline16, 0x30, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   40FE                       1 cubeline16:
   0031                       2     DefineDrawableEntity cubeline16_dw, 0x30, 0x10, 0x08, 0x08, _cubeline_sp
   0031                       1 cubeline16_dw:
   40FE 30 10                 2     .db 0x30, 0x10
   4100 08 08                 3     .db 0x08, 0x08
   4102 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline16_dw_size = . - cubeline16_dw
   4104 01                    3     .db     0x01     ;; Hitpoints
   4105                      23 DefineCubeLine1 cubeline17, 0x38, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   4105                       1 cubeline17:
   0038                       2     DefineDrawableEntity cubeline17_dw, 0x38, 0x10, 0x08, 0x08, _cubeline_sp
   0038                       1 cubeline17_dw:
   4105 38 10                 2     .db 0x38, 0x10
   4107 08 08                 3     .db 0x08, 0x08
   4109 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline17_dw_size = . - cubeline17_dw
   410B 01                    3     .db     0x01     ;; Hitpoints
   410C                      24 DefineCubeLine1 cubeline18, 0x40, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   410C                       1 cubeline18:
   003F                       2     DefineDrawableEntity cubeline18_dw, 0x40, 0x10, 0x08, 0x08, _cubeline_sp
   003F                       1 cubeline18_dw:
   410C 40 10                 2     .db 0x40, 0x10
   410E 08 08                 3     .db 0x08, 0x08
   4110 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline18_dw_size = . - cubeline18_dw
   4112 01                    3     .db     0x01     ;; Hitpoints
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



   4113                      25 DefineCubeLine1 cubeline19, 0x48, 0x10, 0x08, 0x08,_cubeline_sp, 0x01
   4113                       1 cubeline19:
   0046                       2     DefineDrawableEntity cubeline19_dw, 0x48, 0x10, 0x08, 0x08, _cubeline_sp
   0046                       1 cubeline19_dw:
   4113 48 10                 2     .db 0x48, 0x10
   4115 08 08                 3     .db 0x08, 0x08
   4117 28 40                 4     .dw _cubeline_sp
                              5 
                     0006     6 cubeline19_dw_size = . - cubeline19_dw
   4119 01                    3     .db     0x01     ;; Hitpoints
                             26 
                             27 
   411A 02                   28 m_num_cube: .db 2
                             29 
                             30 
   411B                      31 cube_clear:
   411B DD 21 D4 40   [14]   32 ld ix,#cubeline10
   411F CD 83 41      [17]   33 call cube_clearAll
   4122 DD 21 DB 40   [14]   34 ld ix,#cubeline11
   4126 CD 83 41      [17]   35 call cube_clearAll
   4129 DD 21 E2 40   [14]   36 ld ix,#cubeline12
   412D CD 83 41      [17]   37 call cube_clearAll
   4130 DD 21 E9 40   [14]   38 ld ix,#cubeline13
   4134 CD 83 41      [17]   39 call cube_clearAll
   4137 DD 21 F0 40   [14]   40 ld ix,#cubeline14
   413B CD 83 41      [17]   41 call cube_clearAll
   413E DD 21 F7 40   [14]   42 ld ix,#cubeline15
   4142 CD 83 41      [17]   43 call cube_clearAll
   4145 DD 21 FE 40   [14]   44 ld ix,#cubeline16
   4149 CD 83 41      [17]   45 call cube_clearAll
   414C DD 21 05 41   [14]   46 ld ix,#cubeline17
   4150 CD 83 41      [17]   47 call cube_clearAll
   4153 DD 21 0C 41   [14]   48 ld ix,#cubeline18
   4157 CD 83 41      [17]   49 call cube_clearAll
   415A DD 21 13 41   [14]   50 ld ix,#cubeline19
   415E CD 83 41      [17]   51 call cube_clearAll
   4161 C9            [10]   52 ret
                             53 
   4162                      54 cube_draw:
   4162 DD 21 D4 40   [14]   55 ld ix,#cubeline10
   4166 3E 0A         [ 7]   56 ld a,#k_max_cube_line
                             57 
   4168                      58 rep:
   4168 F5            [11]   59 push af
   4169 CD 77 41      [17]   60 call cube_drawAll
                             61 
   416C 11 07 00      [10]   62 ld de,#k_cube_size
   416F DD 19         [15]   63 add ix, de
   4171 F1            [10]   64 pop af
   4172 3D            [ 4]   65 dec a
                             66 
   4173 C2 68 41      [10]   67 jp nz,rep
                             68 
                             69 
   4176 C9            [10]   70 ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



                             71 
                             72 
                             73 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             74 ;; DRAW ENTITY
                             75 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                             76 ;; INPUT: IX -> Points to entity
                             77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4177                      78 cube_drawAll:
                             79 
   4177 DD 7E 06      [19]   80 	ld a,c_hp(ix)
   417A D6 01         [ 7]   81 	sub #1
                             82 
   417C C2 82 41      [10]   83 	jp nz, ommit
                             84 
   417F CD 9F 43      [17]   85 	call render_drawCube
                             86 	
   4182                      87 	ommit:
   4182 C9            [10]   88    	ret
                             89 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             90 ;; BORRA UNA ENTIDAD
                             91 ;; PARA CUADRADOS UNICAMENTE
                             92 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                             93 ;; ENTRADA: IX -> Puntero a entidad
                             94 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   4183                      95 cube_clearAll:
                             96 
                             97 ;;   ld  a, dc_col(ix)
                             98 ;;   ex af, af'
                             99 ;;
                            100 ;;   ld  dc_col(ix), #0
                            101 ;;
                            102 ;;   call render_drawCube
                            103 ;;   ex af, af'
                            104 ;;   ld dc_col(ix), a
                            105 
   4183 C9            [10]  106    ret
                            107 
                            108 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            109 ;;
                            110 ;;RESET CUBES TO FIRST STATE
                            111 ;;
                            112 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   4184                     113 cube_reset:
                            114 
   4184 CD 27 43      [17]  115 	call ball_reset
                            116 
   4187 21 D4 40      [10]  117 	ld hl, #cubeline10
   418A 1E 00         [ 7]  118 	ld e, #0
   418C 16 00         [ 7]  119 	ld d, #0
   418E 0E 00         [ 7]  120 	ld c, #0
   4190 DD 21 CD 40   [14]  121 	ld ix, #cubedefault
   4194                     122 	bucl:
                            123 
   4194 7A            [ 4]  124 	ld a,d 
                            125 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



   4195 77            [ 7]  126 	ld (hl),a
                            127 
   4196 C6 04         [ 7]  128 	add #4
                            129 
   4198 57            [ 4]  130 	ld d,a
   4199 23            [ 6]  131 	inc hl
                            132 
                            133 
   419A DD 7E 01      [19]  134 	ld a, dc_y(ix)
   419D 77            [ 7]  135 	ld (hl),a
                            136 	
   419E 23            [ 6]  137     inc hl
                            138 
   419F DD 7E 02      [19]  139     ld a, dc_w(ix)
   41A2 77            [ 7]  140 	ld (hl),a
                            141     
   41A3 23            [ 6]  142 	inc hl
                            143 
   41A4 DD 7E 03      [19]  144     ld a, dc_h(ix)
   41A7 77            [ 7]  145 	ld (hl),a
                            146     	
   41A8 23            [ 6]  147 	inc hl
                            148     	
   41A9 DD 7E 04      [19]  149 	ld a, dc_sp_l(ix)
   41AC 77            [ 7]  150 	ld (hl),a
                            151 
   41AD 23            [ 6]  152 	inc hl
                            153 
   41AE DD 7E 05      [19]  154 	ld a, dc_sp_h(ix)
   41B1 77            [ 7]  155 	ld (hl),a
                            156 
   41B2 23            [ 6]  157 	inc hl
                            158 
   41B3 DD 7E 06      [19]  159 	ld a, c_hp(ix)
   41B6 77            [ 7]  160 	ld (hl),a
                            161 ;;    ld a,c
                            162 ;;    sub #1
                            163 ;;
                            164 ;;    jp z, rojo
                            165 ;;
                            166 ;;    add #2
                            167 ;;    ld c,a
                            168 ;;	
                            169 ;;	ld a, #15
                            170 ;;
                            171 ;;    ld (hl),a
                            172 ;;
                            173 ;;    jp colorok
                            174 ;;    rojo:
                            175 ;;    ld c,a
                            176 ;;    
                            177 ;;    ld a, #255
                            178 ;;
                            179 ;;    ld (hl),a
                            180 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



                            181 ;;    jp colorok
                            182 ;;  	
                            183 ;;	colorok:
                            184 ;;
                            185 ;;    inc hl
                            186 ;;
                            187 ;;    	;;hp
                            188 ;;    inc hl
                            189 ;;
                            190 ;;  	ld a,e
                            191 ;;  	add #1
                            192 ;;
                            193 ;;  	ld e,a
                            194 
   41B7 D6 0A         [ 7]  195   	sub #k_max_cube_line
                            196 
   41B9 20 D9         [12]  197     	jr nz, bucl
                            198 
                            199     	
                            200 
   41BB C9            [10]  201  ret
                            202 
   41BC                     203 destroy_cube:
   41BC 36 FF         [10]  204 	ld (hl),#0xFF
   41BE 23            [ 6]  205 	inc hl			;;	Y		
   41BF 23            [ 6]  206 	inc hl			;;	W
   41C0 23            [ 6]  207 	inc hl			;;	H
   41C1 23            [ 6]  208 	inc hl			;;	SP_L
   41C2 23            [ 6]  209 	inc hl			;;	SP_H
   41C3 23            [ 6]  210 	inc hl			;;  HP
                            211 
   41C4 36 00         [10]  212 	ld (hl),#0
                            213 
   41C6 2B            [ 6]  214 	dec hl			;; SP_H
   41C7 2B            [ 6]  215 	dec hl			;; SP_L
   41C8 2B            [ 6]  216 	dec hl			;; H 
   41C9 2B            [ 6]  217 	dec hl			;; W
   41CA 2B            [ 6]  218 	dec hl			;; Y
   41CB 2B            [ 6]  219 	dec hl			;; X
                            220 
   41CC 3A 1A 41      [13]  221 	ld a, (m_num_cube)
   41CF D6 01         [ 7]  222 	sub #1
   41D1 32 1A 41      [13]  223 	ld (m_num_cube),a
                            224 
   41D4 CA 84 41      [10]  225 	jp z, cube_reset
                            226 
   41D7 C9            [10]  227 ret
                            228 
