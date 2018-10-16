.include "cpctelera.h.s"
.include "main.h.s"

.area_DATA

.area_CODE

_main::

    call cpct_disableFirware_asm

    ld c, #0
    call cpct_setVideoMode_asm

loop:
;;call clear_player
;;call clear_ball
;;call clear_cube

;;call update_player
;;call update_ball

;;call draw_player
;;call draw_ball
;;call draw_cube


call cpct_waitVSYNC_asm

jr loop