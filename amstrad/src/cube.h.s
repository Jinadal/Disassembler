
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
.globl cube_loses_life
.globl cube_reset

.globl destroy_cube

.globl k_cube_size
.globl k_max_cube_line	

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

.globl cubeline20
.globl cubeline21
.globl cubeline22
.globl cubeline23
.globl cubeline24
.globl cubeline25
.globl cubeline26
.globl cubeline27
.globl cubeline28
.globl cubeline29

.globl cubeline30
.globl cubeline31
.globl cubeline32
.globl cubeline33
.globl cubeline34
.globl cubeline35
.globl cubeline36
.globl cubeline37
.globl cubeline38
.globl cubeline39

.globl cubeline40
.globl cubeline41
.globl cubeline42
.globl cubeline43
.globl cubeline44
.globl cubeline45
.globl cubeline46
.globl cubeline47
.globl cubeline48
.globl cubeline49