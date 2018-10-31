.include "main.h.s"
.include "menu.h.s"
.include "render.h.s"

.globl _menu11_sp
.globl _menu12_sp
.globl _menu13_sp
.globl _menu14_sp
.globl _menu21_sp
.globl _menu22_sp
.globl _menu23_sp
.globl _menu24_sp
.globl _press_sp


k_max_menu_line = 40
k_menu_size = 6

DefineSpriteMenu top1, 0, 0x00, 20,40, _menu11_sp
DefineSpriteMenu top2, 20, 0x00, 20,40, _menu12_sp
DefineSpriteMenu top3, 40, 0x00, 20,40, _menu13_sp
DefineSpriteMenu top4, 60, 0x00, 20,40, _menu14_sp
DefineSpriteMenu bot1, 0, 40, 20,40, _menu21_sp
DefineSpriteMenu bot2, 20,40, 20,40, _menu22_sp
DefineSpriteMenu bot3, 40,40, 20,40, _menu23_sp
DefineSpriteMenu bot4, 60,40, 20,40, _menu24_sp
DefineSpriteMenu press, 20,100, 40,40, _press_sp

menu_draw:
ld ix,#top1
call render_drawCube
ld ix,#top2
call render_drawCube
ld ix,#top3
call render_drawCube
ld ix,#top4
call render_drawCube
ld ix,#bot1
call render_drawCube
ld ix,#bot2
call render_drawCube
ld ix,#bot3
call render_drawCube
ld ix,#bot4
call render_drawCube
ld ix,#press
call render_drawCube
ret