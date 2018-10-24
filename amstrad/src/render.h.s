

;;Drawable Entity
.macro DefineDrawableEntity _name, _x, _y, _w, _h, _sprite
_name:
    .db _x, _y
    .db _w, _h
    .dw _sprite

_name'_size = . - _name
.endm
dc_x    = 0     dc_y    = 1
dc_w    = 2     dc_h    = 3
dc_sp_l  = 4    dc_sp_h  = 5

.globl ren_clearBackBuffers
;;.globl ren_switchBuffers
.globl render_drawCube
.globl ren_newScene