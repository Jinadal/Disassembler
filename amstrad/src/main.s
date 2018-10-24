.include "cpctelera.h.s"
.include "barra.h.s"
.include "ball.h.s"
.include "main.h.s"
.include "cube.h.s"
.include "render.h.s"

.globl _bar_pal

.area _DATA
.area _CODE

_main::
    ld  sp, #0x8000

    ;; Disable firmware to prevent it from interfering with string drawing
    call cpct_disableFirmware_asm

    ld    c, #0
    call cpct_setVideoMode_asm

    ld   hl, #_bar_pal
    ld   de, #16
    call cpct_setPalette_asm
loop:
    call cube_clear

    call barra_clear
    call ball_clear

    
    call barra_update
    call ball_update

    call cube_draw

    call barra_draw
    call ball_draw

    call cpct_waitVSYNC_asm
    ;;call ren_switchBuffers
    call ren_newScene
    
   ;; Loop forever
   jp    loop

   
