;###########################################################################
;#### FICHERO: entity.h.s
;###########################################################################
.macro DefineEntity _name, _x, _y, _w, _h, _col
_name:
   .db    _x, _y     ;; X, Y
   .db    _w, _h     ;; W, H
   .db   _col           ;; Color
.endm
.macro DefineEntityDefault _name, _suf
   DefineEntity _name'_suf, 0xAA, 0, 0, 0, 0xFFFF
.endm
.macro DefineNEntities _name, _n
  _c = 0
  .rept _n
     DefineEntityDefault _name, \_c
     _c = _c + 1
  .endm
.endm
e_x = 0
e_y = 1
e_w = 2
e_h = 3
e_col = 4
 
 
.globl ent_draw
.globl ent_clear
.globl ent_copy
.globl ent_new
.globl ent_doForAll
.globl cube_reposition

.globl hero_data
.globl enemy_data
 
 
 