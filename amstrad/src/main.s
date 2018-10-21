.include "cpctelera.h.s"
<<<<<<< HEAD
.include "barra.h.s"
.include "ball.h.s"
.include "main.h.s"

=======
.include "main.h.s"
.include "cube.h.s"
>>>>>>> 9ad3b97408364c46a86906c5e19301660045d6b1


.area _DATA
.area _CODE

_main::
<<<<<<< HEAD
   ;; Disable firmware to prevent it from interfering with string drawing
      call cpct_disableFirmware_asm

   ld    c, #0
   call cpct_setVideoMode_asm


loop:

   call barra_clear
   call ball_clear


   call barra_update
   call ball_update


   call barra_draw
   call ball_draw





   call cpct_waitVSYNC_asm
   ;; Loop forever
   jr    loop
=======

    call cpct_disableFirmware_asm

    ld c, #0
    call cpct_setVideoMode_asm

    
loop:
;;ld ix,#cubeline1
;;call cube_clear
;;call cube_draw

ld    ix, #cubeline10
call cube_clear
call cube_draw

ld    ix, #cubeline11
call cube_clear
call cube_draw
ld    ix, #cubeline12
call cube_clear
call cube_draw
ld    ix, #cubeline13
call cube_clear
call cube_draw
ld    ix, #cubeline14
call cube_clear
call cube_draw
ld    ix, #cubeline15
call cube_clear
call cube_draw
ld    ix, #cubeline16
call cube_clear
call cube_draw
ld    ix, #cubeline17
call cube_clear
call cube_draw
ld    ix, #cubeline18
call cube_clear
call cube_draw
ld    ix, #cubeline19
call cube_clear
call cube_draw
ld    ix, #cubeline110
call cube_clear
call cube_draw
ld    ix, #cubeline111
call cube_clear
call cube_draw
ld    ix, #cubeline112
call cube_clear
call cube_draw
ld    ix, #cubeline113
call cube_clear
call cube_draw
ld    ix, #cubeline114
call cube_clear
call cube_draw
ld    ix, #cubeline115
call cube_clear
call cube_draw
ld    ix, #cubeline116
call cube_clear
call cube_draw
ld    ix, #cubeline117
call cube_clear
call cube_draw
ld    ix, #cubeline118
call cube_clear
call cube_draw
ld    ix, #cubeline119
call cube_clear
call cube_draw



call cpct_waitVSYNC_asm

jp loop
>>>>>>> 9ad3b97408364c46a86906c5e19301660045d6b1
