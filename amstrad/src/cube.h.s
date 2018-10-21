.include "render.h.s"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro DefineCubeLine1 _name, _x, _y, _w, _h, _col, _hp
_name:
    DefineDrawableEntity _name'_dw, _x, _y, _w, _h, _col
    .db     _hp     ;; Hitpoints
.endm
c_de        = 0
c_de_size   = 6
c_hp        = 0 + c_de_size
;;.macro DefineCubeLine1Default _name, _suf
;;    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0xFF, 0
;;.endm
;;.macro DefineNCubeLine1 _name, _n

;;    _s = 0
;;    .rept _n
;;        DefineCubeLine1Default _name, \_s

;;        _s = _s + 1
;;    .endm
;;.endm



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;OBJECTS CREATED WITH MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.globl cube_clear
.globl cube_draw
.globl cube_drawAll
.globl cube_clearAll


.globl cubeline10
.globl cubeline11
.globl cubeline12
.globl cubeline13
.globl cubeline14
.globl cubeline15
.globl cubeline16
.globl cubeline17
.globl cubeline18
.globl cubeline19
.globl cubeline110
.globl cubeline111
.globl cubeline112
.globl cubeline113
.globl cubeline114
.globl cubeline115
.globl cubeline116
.globl cubeline117
.globl cubeline118
.globl cubeline119