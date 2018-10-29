ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                              2 ;;  This file is part of Amstrad CPC videogame "DisAssembler"
                              3 ;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
                              4 ;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              5 ;;
                              6 ;;  This program is free software: you can redistribute it and/or modify
                              7 ;;  it under the terms of the GNU Lesser General Public License as published by
                              8 ;;  the Free Software Foundation, either version 3 of the License, or
                              9 ;;  (at your option) any later version.
                             10 ;;
                             11 ;;  This program is distributed in the hope that it will be useful,
                             12 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             13 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             14 ;;  GNU Lesser General Public License for more details.
                             15 ;;
                             16 ;;  You should have received a copy of the GNU Lesser General Public License
                             17 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             18 ;;-----------------------------LICENSE NOTICE-----------------------------------------------------
                             19 
                             20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             21 ;;MACROS
                             22 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             23 .macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
                             24 _name:
                             25     DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
                             26     .db     _hp     ;; Hitpoints
                             27 .endm
                     0000    28 c_de        = 0
                     0006    29 c_de_size   = 6
                     0006    30 c_hp        = 0 + c_de_size
                             31 ;;.macro DefineCubeLine1Default _name, _suf
                             32 ;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
                             33 ;;.endm
                             34 ;;.macro DefineNCubeLine1 _name, _n
                             35 
                             36 ;;    _s = 0
                             37 ;;    .rept _n
                             38 ;;        DefineCubeLine1Default _name, \_s
                             39 
                             40 ;;        _s = _s + 1
                             41 ;;    .endm
                             42 ;;.endm
                             43 
                             44 
                             45 
                             46 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             47 ;;OBJECTS CREATED WITH MACROS
                             48 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             49 .globl cube_clear
                             50 .globl cube_draw
                             51 .globl cube_drawAll
                             52 .globl cube_clearAll
                             53 .globl cube_loses_life
                             54 .globl cube_reset
                             55 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 .globl destroy_cube
                             57 
                             58 .globl k_cube_size
                             59 .globl k_max_cube_line	
                             60 
                             61 .globl cubeline10
                             62 .globl cubeline11
                             63 .globl cubeline12
                             64 .globl cubeline13
                             65 .globl cubeline14
                             66 .globl cubeline15
                             67 .globl cubeline16
                             68 .globl cubeline17
                             69 .globl cubeline18
                             70 .globl cubeline19
                             71 
                             72 .globl cubeline20
                             73 .globl cubeline21
                             74 .globl cubeline22
                             75 .globl cubeline23
                             76 .globl cubeline24
                             77 .globl cubeline25
                             78 .globl cubeline26
                             79 .globl cubeline27
                             80 .globl cubeline28
                             81 .globl cubeline29
                             82 
                             83 .globl cubeline30
                             84 .globl cubeline31
                             85 .globl cubeline32
                             86 .globl cubeline33
                             87 .globl cubeline34
                             88 .globl cubeline35
                             89 .globl cubeline36
                             90 .globl cubeline37
                             91 .globl cubeline38
                             92 .globl cubeline39
                             93 
                             94 .globl cubeline40
                             95 .globl cubeline41
                             96 .globl cubeline42
                             97 .globl cubeline43
                             98 .globl cubeline44
                             99 .globl cubeline45
                            100 .globl cubeline46
                            101 .globl cubeline47
                            102 .globl cubeline48
                            103 .globl cubeline49
