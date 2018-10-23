

;;Drawable Entity
.macro DefineDrawableEntity _name, _x, _y, _w, _h, _col
_name:
    .db _x, _y
    .db _w, _h
    .db _col
.endm
dc_x    = 0     dc_y    = 1
dc_w    = 2     dc_h    = 3
dc_col  = 4

.globl ren_clearBackBuffers
;;.globl ren_switchBuffers
.globl render_drawCube
.globl ren_newScene
.globl m_back_buffer
.globl m_front_buffer
