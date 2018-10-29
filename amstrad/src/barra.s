;;-----------------------------LICENSE NOTICE-----------------------------------------------------
;;  This file is part of Amstrad CPC videogame "DisAssembler"
;;  Copyright (C) 2018 Machinegun / Jose Ignacio Nadal Sanchez / Diego Carcamo Porres
;;  Copyright (C) 2015-2016 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
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
;;-----------------------------LICENSE NOTICE-----------------------------------------------------


.include "cpctelera.h.s"
.include "render.h.s"
.include "barra.h.s"
.include "main.h.s"

.globl _bar_sp


	DefineBarra barra, 40, 190, 8, 4,_bar_sp, 0, 0,  barra_moveKeyboard 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW THE BARRA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
barra_draw:
      ld ix,#barra
	jp render_drawCube
  

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
barra_clear:
  ld ix,#barra
  ;;
  ;;ld  a, dc_col(ix)
  ;;ex af, af'
  ;;
  ;;ld  dc_col(ix), #0
  ;;
  ;;call barra_draw
  ;;ex af, af'
  ;;ld dc_col(ix), a
  ;;
  ;;ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTUALIZAR UNA ENTIDAD
;; LLAMA A SU FUNCION DIFERENCIATIVA
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
barra_update:
  ld ix,#barra
 jp barra_moveKeyboard 
   ;; ld     h, b_up_h(ix)
    ;ld     l, b_up_l(ix)
    ;jp    (hl)  



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; MOVIENTO MEDIANTE TECLADO
;;          W(ARRIBA)
;; A (IZDA) S(ABAJO) D(DERECHA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
barra_moveKeyboard:
    call cpct_scanKeyboard_asm
      
   ld hl, #Key_A ;;O
    call cpct_isKeyPressed_asm
    jr z, a_no_pulsada
    
    ld b_vx(ix), #-2
    
 a_no_pulsada:   
    
    
      ld hl, #Key_D ;;P
    call cpct_isKeyPressed_asm
    jr z, d_no_pulsada
    
    ld b_vx(ix), #2
    
 d_no_pulsada:
    
    

    call barra_move
    
    ret
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MOVER UNA ENTIDAD
;; 
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

barra_move:
	ld b, dc_x(ix) ;; save current x position in b




  	ld    a, dc_x(ix) ;;
  	add   b_vx(ix)   ;;
   	ld    dc_x(ix), a ;; next "x" postion = current "x" + velocity

    	ld b_vx(ix), #0;;
   

;; CHECK MAX AND MIN SCREEN X AND PREVENT PLAYER TO GO FURTHER

 	ld    a, dc_x(ix)
 	add dc_w(ix)     ;; Since screen max x is79
  	sub  #78           ;; check if is going to move further or outta screen
                      ;; if true we will go to the reassingnament part
 	jr z, colisionX       ;;



  	ld    a, dc_x(ix)  ;; Same as before but now with the leftest position
  	sub #0            ;;
                    ;;
    	jr z, colisionX  ;;

;;  END MAX MIN X CHECK
	ret
 colisionX:
   
     
    ld dc_x(ix), b
   
   ret
