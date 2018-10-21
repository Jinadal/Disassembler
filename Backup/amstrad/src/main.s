.include "cpctelera.h.s"
.include "main.h.s"
.include "cube.h.s"


.area _DATA
.area _CODE

_main::

    call cpct_disableFirmware_asm

    ld c, #0
    call cpct_setVideoMode_asm

  

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy
    
    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy
    
    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy
    
    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy


    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy

    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy
    
    call cube_new
    ex   de, hl
    ld   hl, #cubedefault
    call cube_copy
    
loop:
;;ld ix,#cubeline1
;;call cube_clear
;;call cube_draw

;;ld    ix, #cubeline1
;;call cube_clear
;;call cube_draw

ld      hl, #cube_clear
call    cube_doForAll

ld      hl, #cube_draw
call    cube_doForAll




call cpct_waitVSYNC_asm

jp loop