.include "main.h.s"
.include "cube.h.s"
.include "render.h.s"

k_max_cube_line = 20
k_cube_size = 7

DefineCubeLine1 cubeline10, 0x10, 0x20, 0x10, 0x40, 0x0F, 0x01
DefineCubeLine1 cubeline11, 0x04, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline12, 0x08, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline13, 0x0C, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline14, 0x10, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline15, 0x14, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline16, 0x18, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline17, 0x1C, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline18, 0x20, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline19, 0x24, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline110, 0x28, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline111, 0x2C, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline112, 0x30, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline113, 0x34, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline114, 0x38, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline115, 0x3C, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline116, 0x40, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline117, 0x44, 0x00, 0x04, 0x08, 0xFF, 0x01
DefineCubeLine1 cubeline118, 0x48, 0x00, 0x04, 0x08, 0x0F, 0x01
DefineCubeLine1 cubeline119, 0x4C, 0x00, 0x04, 0x08, 0xFF, 0x01

m_num_cube: .db 20

cube_clear:
ld ix,#cubeline10
call cube_clearAll
ld ix,#cubeline11
call cube_clearAll
ld ix,#cubeline12
call cube_clearAll
ld ix,#cubeline13
call cube_clearAll
ld ix,#cubeline14
call cube_clearAll
ld ix,#cubeline15
call cube_clearAll
ld ix,#cubeline16
call cube_clearAll
ld ix,#cubeline17
call cube_clearAll
ld ix,#cubeline18
call cube_clearAll
ld ix,#cubeline19
call cube_clearAll
ld ix,#cubeline110
call cube_clearAll
ld ix,#cubeline111
call cube_clearAll
ld ix,#cubeline112
call cube_clearAll
ld ix,#cubeline113
call cube_clearAll
ld ix,#cubeline114
call cube_clearAll
ld ix,#cubeline115
call cube_clearAll
ld ix,#cubeline116
call cube_clearAll
ld ix,#cubeline117
call cube_clearAll
ld ix,#cubeline118
call cube_clearAll
ld ix,#cubeline119
call cube_clearAll
ret

cube_draw:
ld ix,#cubeline10
call cube_drawAll
ld ix,#cubeline11
call cube_drawAll
ld ix,#cubeline12
call cube_drawAll
ld ix,#cubeline13
call cube_drawAll
ld ix,#cubeline14
call cube_drawAll
ld ix,#cubeline15
call cube_drawAll
ld ix,#cubeline16
call cube_drawAll
ld ix,#cubeline17
call cube_drawAll
ld ix,#cubeline18
call cube_drawAll
ld ix,#cubeline19
call cube_drawAll
ld ix,#cubeline110
call cube_drawAll
ld ix,#cubeline111
call cube_drawAll
ld ix,#cubeline112
call cube_drawAll
ld ix,#cubeline113
call cube_drawAll
ld ix,#cubeline114
call cube_drawAll
ld ix,#cubeline115
call cube_drawAll
ld ix,#cubeline116
call cube_drawAll
ld ix,#cubeline117
call cube_drawAll
ld ix,#cubeline118
call cube_drawAll
ld ix,#cubeline119
call cube_drawAll
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW ENTITY
;; REGISTERS DETROYED: AF, BC, DE ,HL
;; INPUT: IX -> Points to entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_drawAll:
    jp render_drawCube
   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_clearAll:

   ld  a, dc_col(ix)
   ex af, af'

   ld  dc_col(ix), #0

   call render_drawCube
   ex af, af'
   ld dc_col(ix), a

   ret
