
.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
   


DefineEntity personaje, 0x09, 0x47, 0x00, 0x00, 0x02, 0x08, 0x0F, ent_moveKeyboard

DefineEntity p_a, 0x08, 0x40, 0x00, 0x00, 0x02, 0x08, 0x0C, ent_draw
DefineEntity p_a1, 0x12, 0x80, 0x00, 0x01, 0x02, 0x08, 0xFF, ent_move

DefineEntity p_a2, 0x02, 0x65, 0x00, 0x00, 0x02, 0x08, 0xC0, ent_draw



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_draw:
   ld    de, #0xC000       ;;Comienzo memoria de video
   ld     c, e_x(ix)         ;; C = Entity Y
   ld     b, e_y(ix)         ;; B = Entity X
   call cpct_getScreenPtr_asm

   ex    de, hl   ;; DE = Puntero a memoria
   ld  a, e_col(ix)   ;; Color
   ld  b, e_h(ix)   ;; alto
   ld  c, e_w(ix)   ;; Ancho

   call cpct_drawSolidBox_asm

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_clear:
   ld  a, e_col(ix)
   ex af, af'

   ld  e_col(ix), #0

   call ent_draw
   ex af, af'
   ld e_col(ix), a

   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ACTUALIZAR UNA ENTIDAD
;; LLAMA A SU FUNCION DIFERENCIATIVA
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_update:
   ld     h, e_up_h(ix)
   ld     l, e_up_l(ix)
   jp    (hl)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MOVER UNA ENTIDAD
;; 
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_move:
   ld    a, e_x(ix) 
   add   e_vx(ix)
   ld    e_x(ix), a

   ld    a, e_y(ix) 
   add   e_vy(ix)
   ld    e_y(ix), a

   
   ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VERSION ACTUALIZADA DEL MOVE PARA EL PERSONAJE
;;  
;; ENTRADA: IX -> Puntero al personaje
;; HL IS USED TO POINT THE COLLISIONABLE ENTITIES
;; SUMMONS COLLIDE FOR EVERY COLLISIONABLE ENTITY 
;; 
;; Saves current position
;; Calculates next position with its velocity
;; If no colition detected with collide, continues normaly
;; If colition detected, next position will be overwritten with the previously saved 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_move2:   
    ld b, e_x(ix) ;; save current x position in b
    ld c, e_y(ix) ;; save current y position in c

   ld    a, e_x(ix) ;;
   add   e_vx(ix)   ;;
   ld    e_x(ix), a ;; next "x" postion = current "x" + velocity

   ld    a, e_y(ix) ;;
   add   e_vy(ix)   ;;
   ld    e_y(ix), a ;; next "y" postion = current "y" + velocity


       ld e_vx(ix), #0;;
    ld e_vy(ix), #0   ;; reset both velocities since they only are modified in ent_moveKeyboard


 ;; FIRST OBJECT ;;

    ld d, #1          ;; Prepare check flag by sacing a 1 in d
    ld hl, #p_a       ;; Save wall pointer in hl
    call ent_collide  ;; check collision

        ld a,d          ;;d is changed in collide if a collision happened 
    sub #1              ;;holding a 0 otherwise it will be a 1
    jr nz, colision  ;;and if it is a 0 we will go to the reassingnament part

   
 ;; SECOND OBJECT ;;

    ld d, #1
    ld hl, #p_a1
    call ent_collide

        ld a,d
    sub #1

    jr nz, colision

    ld d, #1

     ;; THIRD OBJECT ;;

     ld hl, #p_a2
    call ent_collide

        ld a,d
    sub #1

    jr nz, colision

   

    

 ret
    colision:
   
        ; ld  e_col(ix), #2
 ld e_x(ix), b
    ld e_y(ix), c
   

   
   ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; COMPROBACION COLISIONES BOUNDING BOXES
;; COMPRUEBA PROYECCION 1D EN X EN Y DE         
;; LA CAJA Y EL PERSONAJE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ent_collide:

  ;; cambiar donde pone el controlo p_a

      

  ;; COMPRUEBA EN X SI LE OBJETO ESTA A LA DERECHA O A LA IZDA
   ld a, e_x(ix)
   add e_w(ix)
   sub (hl)
   
   jr z, no_coll
   jp m, no_coll


  ld a ,(hl)
   inc hl
   inc hl
   inc hl
   inc hl

   add (hl)
 
   sub e_x(ix)

    jr z, no_coll
    jp m, no_coll


;; COMPRUEBA EN Y SI EL OBJETO ESTA ARRIBA  O ABAJO
    dec hl
    dec hl
    dec hl
  

   ld a, e_y(ix)
   add e_h(ix)
   sub (hl)
   
   jr z, no_coll
   jp m, no_coll


   ld a ,(hl)
   inc hl
   inc hl
   inc hl
   inc hl

   add (hl)
   sub e_y(ix)

    jr z, no_coll
    jp m, no_coll

    dec hl
    dec hl
    dec hl




  
  ld d, #0 
  ;ld (0xC000), a
  ;ld (0xC001), a
  ;ld (0xC002), a
  ;ld b, #1




ret
   

   no_coll:




ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;; MOVIENTO MEDIANTE TECLADO
;;          W(ARRIBA)
;; A (IZDA) S(ABAJO) D(DERECHA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_moveKeyboard:
    call cpct_scanKeyboard_asm
      
   ld hl, #Key_A ;;O
    call cpct_isKeyPressed_asm
    jr z, o_no_pulsada
    
    ld e_vx(ix), #-1
    
 o_no_pulsada:   
    
    
      ld hl, #Key_D ;;P
    call cpct_isKeyPressed_asm
    jr z, p_no_pulsada
    
    ld e_vx(ix), #1
    
 p_no_pulsada:

   ld hl, #Key_W;;Q
   call cpct_isKeyPressed_asm
   jr z, q_no_pulsada

   ld e_vy(ix), #-3

 q_no_pulsada:
    ld hl, #Key_S ;;W
    call cpct_isKeyPressed_asm
    jr z, w_no_pulsada

    ld e_vy(ix), #3

 w_no_pulsada:
    
    
    call ent_move2
    




  

 ;    ld a, #0x00
 ;ld (0xC000), a
 ; ld (0xC001), a
  ;ld (0xC002), a
    






   ret