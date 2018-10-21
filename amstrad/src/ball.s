.include "cpctelera.h.s"
.include "barra.h.s"
.include "main.h.s"
.include "ball.h.s"




	DefineBall ball, 40,40,1,4,1,1,0xC0, ball_move



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW THE BARRA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_draw:
      ld ix,#ball

   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, bl_x(ix)         ;; C = Entity Y
   ld     b, bl_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, bl_col(ix)   ;; Color
   ld  b, bl_h(ix)   ;; alto
   ld  c, bl_w(ix)   ;; Ancho

   call cpct_drawSolidBox_asm

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_clear:
  ld ix,#ball

   ld  a, bl_col(ix)
   ex af, af'

   ld  bl_col(ix), #0

   call ball_draw
   ex af, af'
   ld bl_col(ix), a

   ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTUALIZAR UNA ENTIDAD
;; LLAMA A SU FUNCION DIFERENCIATIVA
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_update:
  ld ix,#ball

    ld     h, bl_up_h(ix)
    ld     l, bl_up_l(ix)
    jp    (hl)  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;MOVE FOR BALL
;;FIRST VERSION
;;IX -> Ball
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ball_move:
	 ld b, bl_x(ix) ;; save current x position in b
    ld c, bl_y(ix) ;; save current y position in c



   ld    a, bl_x(ix) ;;
   add   bl_vx(ix)   ;;
   ld    bl_x(ix), a ;; next "x" postion = current "x" + velocity

    
   ld    a, bl_y(ix) ;;
   add   bl_vy(ix)   ;;
   ld    bl_y(ix), a ;; next "y" postion = current "y" + velocity

   

;; CHECK MAX AND MIN SCREEN X AND PREVENT PLAYER TO GO FURTHER

 ld    a, bl_x(ix)     ;; Since screen max x is79
  sub  #77            ;; check if is going to move further or outta screen
                      ;; if true we will go to the reassingnament part
 jr z, colisionX       ;;



  ld    a, bl_x(ix)  ;; Same as before but now with the leftest position
  sub #1            ;;
                    ;;
    jr z, colisionX  ;;

;;  END MAX MIN X CHECK



   





;; CHECK MAX AND MIN SCREEN Y AND PREVENT PLAYER TO GO FURTHER

ld    a, bl_y(ix)     ;; Since screen max x is79
  sub  #77            ;; check if is going to move further or outta screen
                      ;; if true we will go to the reassingnament part
 ;jr z, colisionY1       

 

 ld    a, bl_y(ix)  ;; Same as before but now with the leftest position
  sub #1            ;;
                    ;;
    jr z, colisionY2  ;;

;;  END MAX MIN Y CHECK

	; ld bl_col(ix),#192
	ld hl, #barra
	ld d, #1

	call ball_collide
	ld a,d          ;;d is changed in collide if a collision happened 
    	sub #1              ;;holding a 0 otherwise it will be a 1
    
    
    
    	jr nz, colisionY2  ;; if there is a 0 in D we will go to the reassingnament part
  

	ret

	colisionY1:
	 ld a,#0  
	 sub bl_vy(ix) 
	 

	 
	 ld bl_vy(ix),a
	 

	 ld bl_col(ix),#255

	 ret
	 colisionY2:
	 ld a,#0  
	 sub bl_vy(ix) 
	 

	 
	 ld bl_vy(ix),a
	 

	 ld bl_col(ix),#200

	 ret

	 colisionX:
		
	 ld a,#0  
	 sub bl_vx(ix) 
	 

	 
	 ld bl_vx(ix),a
	 

	 ld bl_col(ix),#15


	ret
	goodYcolision:
 	ld a,#0  
	 sub bl_vy(ix) 
	 

	 
	 ld bl_vy(ix),a

	ld bl_x(ix), b
    	ld bl_y(ix), c

	ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; COMPROBACION COLISIONES BOUNDING BOXES
;; COMPRUEBA PROYECCION 1D EN X EN Y DE         
;; LA BOLA Y LA BARRA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ball_collide:


  ;; COMPRUEBA EN X SI LE OBJETO ESTA A LA DERECHA O A LA IZDA
   
                  ;;Comprobacion de colision por la DERECHA if(hero_X + obs_W - heroX <= 0)
   ld a, bl_x(ix)  ;; A = hero_X
   add bl_w(ix)    ;; A + hero_W
   sub (hl)       ;; A - obs_X 
   
   jr z, no_coll  ;; hero_X + hero_W - obs_X = 0
   jp m, no_coll  ;; hero_X + hero_W - obs_X < 0

                  ;;Comprobacion de colision por la IZQUIERDA if(obs_X + obs_W - hero_X <= 0)
    ld a ,(hl)    ;; A = hl -> obs_X
    inc hl        ;;
   
    inc hl        ;; hl + 2 -> obs_W

    add (hl)      ;; A + obs_W
                  ;;
    sub bl_x(ix)   ;; A - hero_X

    dec hl        ;;
    dec hl        ;; return to the first item in the object


    jr z, no_coll ;; obs_X + obs_W - hero_X = 0
    jp m, no_coll ;; obs_X + obs_W - hero_X < 0
  


;; COMPRUEBA EN Y SI EL OBJETO ESTA ARRIBA  O ABAJO
                  ;;Comprobacion de colision ABAJO if(hero__Y + hero__H - obs_Y <= 0)
    inc hl        ;; Puntero hl -> barra_Y

  

   ld a, bl_y(ix)  ;; A = ball__Y
   add bl_h(ix)    ;; A + ball__H
   sub (hl)       ;; A - barra_Y
   
   

   jr nz, no_coll  ;; ball__Y + ball__H - barra_Y = 0
   jp m, no_coll  ;; ball__Y + ball__H - barra_Y < 0


   ld a ,(hl)     ;; A = obs_Y
   inc hl         ;;

   inc hl         ;; hl + 2 -> obs_H

   add (hl)       ;; A + obs_H
   sub bl_y(ix)    ;; A - hero_Y

    dec hl        ;;
    dec hl        ;;
    dec hl        ;;  return to the first item in the object

    jr z, no_coll ;; obs_Y + obs_H - hero__Y = 0
    jp m, no_coll ;; obs_Y + obs_H - hero__Y < 0

   


    ld d, #0     ;; if we make it here, it means a collision happened so we charge a 0 in D
 
    ret

no_coll:

ret

