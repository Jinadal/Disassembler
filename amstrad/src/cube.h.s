
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro DefineCubeLine1 _name, _x, _y, _w, _h, _hp, _col
_name:
    .db     _x, _y  ;; X, Y
    .db     _w, _h  ;; W, H
    .db     _hp     ;; Hitpoints
    .db     _col    ;; Color
.endm
.macro DefineCubeLine1Default _name, _suf
    DefineCubeLine1 _name'_suf, 0, 0, 0, 0, 0, 0xFF
.endm
.macro DefineNCubeLine1 _name, _n

    _s = 0
    .rept _n
        DefineCubeLine1Default _name, \_s

        _s = _s + 1
    .endm
.endm
c_x = 0
c_y = 1
c_w = 2
c_h = 3
c_hp = 4
c_col = 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;OBJECTS CREATED WITH MACROS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.globl cube_clear
.globl cube_draw

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