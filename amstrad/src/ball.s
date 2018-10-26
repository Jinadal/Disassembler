.include "cpctelera.h.s"
.include "render.h.s"
.include "barra.h.s"
.include "main.h.s"
.include "ball.h.s"
.include "cube.h.s"

.globl _ball_sp


	DefineBall ball, 40,78,1,4,_ball_sp,1,2, ball_move, 3
	DefineBall balldefault, 40,78,1,4,_ball_sp,1,2, ball_move,3



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW THE BARRA
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_draw:
      ld ix,#ball
jp render_drawCube


   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_clear:
 ;; ld ix,#ball
;;
 ;;  ld  a, dc_col(ix)
 ;;  ex af, af'
;;
 ;;  ld  dc_col(ix), #0
;;
 ;;  call ball_draw
 ;;  ex af, af'
 ;;  ld dc_col(ix), a

   ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTUALIZAR UNA ENTIDAD
;; LLAMA A SU FUNCION DIFERENCIATIVA
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ball_update:
  ld ix,#ball
	jp ball_move


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;MOVE FOR BALL
;;FIRST VERSION
;;IX -> Ball
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ball_move:
	 ld b, dc_x(ix) ;; save current x position in b
    ld c, dc_y(ix) ;; save current y position in c



   ld    a, dc_x(ix) ;;
   add   bl_vx(ix)   ;;
   ld    dc_x(ix), a ;; next "x" postion = current "x" + velocity

    
   ld    a, dc_y(ix) ;;
   add   bl_vy(ix)   ;;
   ld    dc_y(ix), a ;; next "y" postion = current "y" + velocity

   

;; CHECK MAX AND MIN SCREEN X AND PREVENT PLAYER TO GO FURTHER

 ld    a, dc_x(ix)     ;; Since screen max x is79
  sub  #77            ;; check if is going to move further or outta screen
                      ;; if true we will go to the reassingnament part
 jr z, colisionX       ;;



  ld    a, dc_x(ix)  ;; Same as before but now with the leftest position
  sub #1            ;;
                    ;;
    jr z, colisionX  ;;

;;  END MAX MIN X CHECK



   





;; CHECK MAX AND MIN SCREEN Y AND PREVENT PLAYER TO GO FURTHER

ld    a, dc_y(ix)     ;; Since screen max x is79
  sub  # 190           ;; check if is going to move further or outta screen
                      ;; if true we will go to the reassingnament part
 jr z, resetTheBall       

 

 ld    a, dc_y(ix)  ;; Same as before but now with the leftest position
  sub #2            ;;
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
  




	ld hl, #cubeline10
	

	ld e, #k_max_cube_line


	bucl:


	ld d, #1

	call ball_collide
	ld a,d          ;;d is changed in collide if a collision happened 
    sub #1              ;;holding a 0 otherwise it will be a 1
    	


    
	
    jr nz, colisionY1  ;; if there is a 0 in D we will go to the reassingnament part
  	

    	inc hl
    	inc hl
    	inc hl
    	inc hl
    	inc hl
    	inc hl
		inc hl

  	ld a,e
  	sub #1

  	ld e,a

    	jr nz, bucl





	ret

	colisionY1:

;; COMPROBAR POR DONDE ME ENTRA LA COLISION

;; MIRAR CON RESPECTO AL OBSTACULO SI LAS YS DE LA BOLA ESTAN DENTRO DE LAS DEL OBSTACULO Y QUE LAS X Y MANEJAR LOS 2 CASOS
	

	
	; si la x(bola) > x(caja) -> entro por la derecha


	ld ix,#ball
	ld a,#0  
	sub bl_vy(ix) 

	ld bl_vy(ix),a
	call colisionX

	;; ld dc_col(ix),#255

    call cube_loses_life

	 ret




	 colisionY2:
	 ld a,#0  
	 sub bl_vy(ix) 
	 

	 
	 ld bl_vy(ix),a
	 

	;; ld dc_col(ix),#200

	 ret

	 colisionX:
		
	 ld a,#0  
	 sub bl_vx(ix) 
	 

	 
	 ld bl_vx(ix),a
	 

	;; ld dc_col(ix),#15


	ret
	goodYcolision:
 	ld a,#0  
	 sub bl_vy(ix) 
	 

	 
	 ld bl_vy(ix),a

	ld dc_x(ix), b
    	ld dc_y(ix), c

	ret


	resetTheBall:

	call ball_fall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; COMPROBACION COLISIONES BOUNDING BOXES
;; COMPRUEBA PROYECCION 1D EN X EN Y DE         
;; LA BOLA Y LA BARRA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ball_collide:


  ;; COMPRUEBA EN X SI LE OBJETO ESTA A LA DERECHA O A LA IZDA
   
                  ;;Comprobacion de colision por la DERECHA if(hero_X + obs_W - heroX <= 0)
   ld a, dc_x(ix)  ;; A = hero_X
   add dc_w(ix)    ;; A + hero_W
   sub (hl)       ;; A - obs_X 
   
   ;jr z, no_coll  ;; hero_X + hero_W - obs_X = 0
   jp m, no_coll  ;; hero_X + hero_W - obs_X < 0

                  ;;Comprobacion de colision por la IZQUIERDA if(obs_X + obs_W - hero_X <= 0)
    ld a ,(hl)    ;; A = hl -> obs_X
    inc hl        ;;
   
    inc hl        ;; hl + 2 -> obs_W

    add (hl)      ;; A + obs_W
                  ;;
    sub dc_x(ix)   ;; A - hero_X

    dec hl        ;;
    dec hl        ;; return to the first item in the object


    ;jr z, no_coll ;; obs_X + obs_W - hero_X = 0
    jp m, no_coll ;; obs_X + obs_W - hero_X < 0
  


;; COMPRUEBA EN Y SI EL OBJETO ESTA ARRIBA  O ABAJO
                  ;;Comprobacion de colision ABAJO if(hero__Y + hero__H - obs_Y <= 0)
    inc hl        ;; Puntero hl -> barra_Y

  

   ld a, dc_y(ix)  ;; A = ball__Y
   add dc_h(ix)    ;; A + ball__H
   sub (hl)       ;; A - barra_Y
   
   

  ; jr z, no_coll  ;; ball__Y + ball__H - barra_Y = 0
   jp m, no_coll  ;; ball__Y + ball__H - barra_Y < 0


   ld a ,(hl)     ;; A = obs_Y
   inc hl         ;;

   inc hl         ;; hl + 2 -> obs_H

   add (hl)       ;; A + obs_H
   sub dc_y(ix)    ;; A - hero_Y

    dec hl        ;;
    dec hl        ;;
    dec hl        ;;  return to the first item in the object

    ;jr z, no_coll ;; obs_Y + obs_H - hero__Y = 0
    jp m, no_coll ;; obs_Y + obs_H - hero__Y < 0

   


    ld d, #0     ;; if we make it here, it means a collision happened so we charge a 0 in D
 
    ret

no_coll:

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;RESET BALL TO FIRST STATE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
ball_reset:

	ld hl, #balldefault
 
 	ld a, (hl)
	ld dc_x(ix), a

	inc hl

	ld a, (hl)
	ld dc_y(ix), a

	inc hl

	ld a, (hl)
	ld dc_w(ix), a

	inc hl
	ld a, (hl)
	ld dc_h(ix), a

	inc hl

	ld a, (hl)
	ld dc_sp_l(ix), a
;;	ld dc_col(ix), a

	inc hl

	ld a, (hl)
	ld dc_sp_h(ix), a

	inc hl

	ld a, (hl)
	ld bl_vx(ix), a

	inc hl

	ld a, (hl)
	ld bl_vy(ix), a

	inc hl

	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;MINUS 1 LIFE FOR BALL
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,

	ball_fall:

	;ld hl, #balldefault
	call ball_reset
	ld a, bl_hp(ix)
	sub #1

	ld bl_hp(ix), a

	jp z, restart
	call ball_reset
	ret
	restart:
	ld a, bl_hp(ix)
	add #3

	ld bl_hp(ix), a

	;ld a, #50
	;ld dc_col(ix), a
	call cube_reset

	

	ret