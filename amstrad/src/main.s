.include "cpctelera.h.s"
.include "main.h.s"
.include "cube.h.s"


.area _DATA
.area _CODE

_main::

    call cpct_disableFirmware_asm

    ld c, #0
    call cpct_setVideoMode_asm

    
loop:



call cpct_waitVSYNC_asm

jp loop