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
                             49 
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
   411A 0A                   28 m_num_cube: .db 10
                             29 
   411B                      30 cube_clear:
   411B DD 21 D4 40   [14]   31 ld ix,#cubeline10
   411F CD AC 41      [17]   32 call cube_clearAll
   4122 DD 21 DB 40   [14]   33 ld ix,#cubeline11
   4126 CD AC 41      [17]   34 call cube_clearAll
   4129 DD 21 E2 40   [14]   35 ld ix,#cubeline12
   412D CD AC 41      [17]   36 call cube_clearAll
   4130 DD 21 E9 40   [14]   37 ld ix,#cubeline13
   4134 CD AC 41      [17]   38 call cube_clearAll
   4137 DD 21 F0 40   [14]   39 ld ix,#cubeline14
   413B CD AC 41      [17]   40 call cube_clearAll
   413E DD 21 F7 40   [14]   41 ld ix,#cubeline15
   4142 CD AC 41      [17]   42 call cube_clearAll
   4145 DD 21 FE 40   [14]   43 ld ix,#cubeline16
   4149 CD AC 41      [17]   44 call cube_clearAll
   414C DD 21 05 41   [14]   45 ld ix,#cubeline17
   4150 CD AC 41      [17]   46 call cube_clearAll
   4153 DD 21 0C 41   [14]   47 ld ix,#cubeline18
   4157 CD AC 41      [17]   48 call cube_clearAll
   415A DD 21 13 41   [14]   49 ld ix,#cubeline19
   415E CD AC 41      [17]   50 call cube_clearAll
   4161 C9            [10]   51 ret
                             52 
   4162                      53 cube_draw:
   4162 DD 21 D4 40   [14]   54 ld ix,#cubeline10
   4166 CD A9 41      [17]   55 call cube_drawAll
   4169 DD 21 DB 40   [14]   56 ld ix,#cubeline11
   416D CD A9 41      [17]   57 call cube_drawAll
   4170 DD 21 E2 40   [14]   58 ld ix,#cubeline12
   4174 CD A9 41      [17]   59 call cube_drawAll
   4177 DD 21 E9 40   [14]   60 ld ix,#cubeline13
   417B CD A9 41      [17]   61 call cube_drawAll
   417E DD 21 F0 40   [14]   62 ld ix,#cubeline14
   4182 CD A9 41      [17]   63 call cube_drawAll
   4185 DD 21 F7 40   [14]   64 ld ix,#cubeline15
   4189 CD A9 41      [17]   65 call cube_drawAll
   418C DD 21 FE 40   [14]   66 ld ix,#cubeline16
   4190 CD A9 41      [17]   67 call cube_drawAll
   4193 DD 21 05 41   [14]   68 ld ix,#cubeline17
   4197 CD A9 41      [17]   69 call cube_drawAll
   419A DD 21 0C 41   [14]   70 ld ix,#cubeline18
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 8.
Hexadecimal [16-Bits]



   419E CD A9 41      [17]   71 call cube_drawAll
   41A1 DD 21 13 41   [14]   72 ld ix,#cubeline19
   41A5 CD A9 41      [17]   73 call cube_drawAll
   41A8 C9            [10]   74 ret
                             75 
                             76 
                             77 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             78 ;; DRAW ENTITY
                             79 ;; REGISTERS DETROYED: AF, BC, DE ,HL
                             80 ;; INPUT: IX -> Points to entity
                             81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41A9                      82 cube_drawAll:
   41A9 C3 D6 43      [10]   83     jp render_drawCube
                             84    
                             85    
                             86 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             87 ;; BORRA UNA ENTIDAD
                             88 ;; PARA CUADRADOS UNICAMENTE
                             89 ;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
                             90 ;; ENTRADA: IX -> Puntero a entidad
                             91 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   41AC                      92 cube_clearAll:
                             93 
                             94 ;;   ld  a, dc_col(ix)
                             95 ;;   ex af, af'
                             96 ;;
                             97 ;;   ld  dc_col(ix), #0
                             98 ;;
                             99 ;;   call render_drawCube
                            100 ;;   ex af, af'
                            101 ;;   ld dc_col(ix), a
                            102 
   41AC C9            [10]  103    ret
                            104 
                            105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            106 ;;
                            107 ;;RESET CUBES TO FIRST STATE
                            108 ;;
                            109 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
   41AD                     110 cube_reset:
                            111 
   41AD CD 5E 43      [17]  112 	call ball_reset
                            113 
   41B0 21 D4 40      [10]  114 	ld hl, #cubeline10
   41B3 1E 00         [ 7]  115 	ld e, #0
   41B5 16 00         [ 7]  116 	ld d, #0
   41B7 0E 00         [ 7]  117 	ld c, #0
   41B9 DD 21 CD 40   [14]  118 	ld ix, #cubedefault
   41BD                     119 	bucl:
                            120 
   41BD 7A            [ 4]  121 	ld a,d 
                            122 
   41BE 77            [ 7]  123 	ld (hl),a
                            124 
   41BF C6 04         [ 7]  125 	add #4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 9.
Hexadecimal [16-Bits]



                            126 
   41C1 57            [ 4]  127 	ld d,a
   41C2 23            [ 6]  128 	inc hl
                            129 
                            130 
   41C3 DD 7E 01      [19]  131 	ld a, dc_y(ix)
   41C6 77            [ 7]  132 	ld (hl),a
                            133 	
   41C7 23            [ 6]  134     	inc hl
                            135 
                            136 
   41C8 DD 7E 02      [19]  137     	ld a, dc_w(ix)
   41CB 77            [ 7]  138 	ld (hl),a
   41CC 23            [ 6]  139     	inc hl
                            140 
                            141 
   41CD DD 7E 03      [19]  142     	ld a, dc_h(ix)
   41D0 77            [ 7]  143 	ld (hl),a
   41D1 23            [ 6]  144     	inc hl
                            145     	
   41D2 79            [ 4]  146     	ld a,c
   41D3 D6 01         [ 7]  147     	sub #1
                            148 
   41D5 CA E1 41      [10]  149     	jp z, rojo
                            150 
   41D8 C6 02         [ 7]  151     	add #2
   41DA 4F            [ 4]  152     	ld c,a
   41DB 3E 0F         [ 7]  153 	ld a, #15
                            154 
   41DD 77            [ 7]  155     	ld (hl),a
                            156 
   41DE C3 E8 41      [10]  157     	jp colorok
   41E1                     158     	rojo:
   41E1 4F            [ 4]  159     	ld c,a
                            160     	
   41E2 3E FF         [ 7]  161     	ld a, #255
                            162 
   41E4 77            [ 7]  163     	ld (hl),a
                            164 
   41E5 C3 E8 41      [10]  165     	jp colorok
                            166   	
   41E8                     167 	colorok:
                            168 
   41E8 23            [ 6]  169     	inc hl
                            170 
                            171     	;;hp
   41E9 23            [ 6]  172     	inc hl
                            173 
   41EA 7B            [ 4]  174   	ld a,e
   41EB C6 01         [ 7]  175   	add #1
                            176 
   41ED 5F            [ 4]  177   	ld e,a
                            178 
   41EE D6 0A         [ 7]  179   	sub #k_max_cube_line
                            180 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 10.
Hexadecimal [16-Bits]



   41F0 20 CB         [12]  181     	jr nz, bucl
                            182 
                            183     	
                            184 
   41F2 C9            [10]  185  ret
                            186 
   41F3                     187 destroy_cube:
   41F3 36 FF         [10]  188 	ld (hl),#0xFF
   41F5 23            [ 6]  189 	inc hl			;;	Y		
   41F6 23            [ 6]  190 	inc hl			;;	W
   41F7 23            [ 6]  191 	inc hl			;;	H
   41F8 23            [ 6]  192 	inc hl			;;	SP_L
   41F9 23            [ 6]  193 	inc hl			;;	SP_H
   41FA 23            [ 6]  194 	inc hl			;;  HP
                            195 
   41FB 36 00         [10]  196 	ld (hl),#0
                            197 
   41FD 2B            [ 6]  198 	dec hl			;; SP_H
   41FE 2B            [ 6]  199 	dec hl			;; SP_L
   41FF 2B            [ 6]  200 	dec hl			;; H 
   4200 2B            [ 6]  201 	dec hl			;; W
   4201 2B            [ 6]  202 	dec hl			;; Y
   4202 2B            [ 6]  203 	dec hl			;; X
                            204 
   4203 3A 1A 41      [13]  205 	ld a, (m_num_cube)
   4206 D6 01         [ 7]  206 	sub #1
   4208 32 1A 41      [13]  207 	ld (m_num_cube),a
                            208 
   420B CA AD 41      [10]  209 	jp z, cube_reset
                            210 
   420E C9            [10]  211 ret
                            212 
