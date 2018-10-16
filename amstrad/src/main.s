;;-----------------------------LICENSE NOTICE------------------------------------
;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
;;
;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Lesser General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.
;;
;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Lesser General Public License for more details.
;;
;;  You should have received a copy of the GNU Lesser General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;-------------------------------------------------------------------------------

;; Include all CPCtelera constant definitions, macros and variables
.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
.include "keys.h.s"
.include "hp.h.s"
.include "wall.h.s"
.include "door.h.s"

;;

;; Start of _DATA area 
;;  SDCC requires at least _DATA and _CODE areas to be declared, but you may use
;;  any one of them for any purpose. Usually, compiler puts _DATA area contents
;;  right after _CODE area contents.
;;
.area _DATA

.area _CODE

;;
;; MAIN function. This is the entry point of the application.
;;    _main:: global symbol is required for correctly compiling and linking
;;
_main::
   ;; Disable firmware to prevent it from interfering with string drawing
      call cpct_disableFirmware_asm

   ld    c, #0
   call cpct_setVideoMode_asm


loop:

  
  call key_clear
  call ent_clear
  call door_clear
    ld ix, #w1
  call wall_clear
  ld ix, #w2
  call wall_clear
  call key_update
  call ent_update
  call key_draw
  call ent_draw
  call door_draw
    ld ix, #w1
  call wall_draw
  ld ix, #w2
  call wall_draw

       ld ix, #hp1
  call HP_draw
  ld ix, #hp2
  call HP_draw
    ld ix, #hp3
  call HP_draw

  
  ;;  ld    ix, #p_a
  ;; call ent_clear
  ;; call ent_update
  ;; call ent_draw

  ;;  ld    ix, #p_a1
  ;; call ent_clear
  ;; call ent_update
  ;; call ent_draw


  ;;  ld    ix, #p_a2
  ;; call ent_clear
  ;; call ent_update
  ;; call ent_draw

    






   call cpct_waitVSYNC_asm
   ;; Loop forever
   jr    loop
