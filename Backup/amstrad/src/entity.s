;###########################################################################
;#### FICHERO: entity.s
;###########################################################################
.include "cpctelera.h.s"
.include "entity.h.s"
.include "main.h.s"
 
k_max_num_ent = 10
k_entity_size = 6

entity_vector:
DefineNEntities entity_vector, k_max_num_ent
DefineEntity hero_data, 0x14, 0x21, 0x02, 0x08, 0x0F
DefineEntity enemy_data, 0x00, 0x01, 0x02, 0x08, 0xFF

num_reposition: .db 00
m_num_ent:      .db 00
m_next_entity:  .dw entity_vector

cube_reposition:
    ex      de, hl
    ld      de, #k_entity_size

    or      a
    sbc     hl, de

    ld      a, (num_reposition)
    add     (hl)
    ld      (hl), a

    add     a, #3
    ld      (num_reposition),a
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; REGISTRIS UNA NUEVA ENTIDAD
;; REGISTROS DESTRUIDOS: AF, HL, BC
;; SALIDA: HL -> Puntero a la entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_new:
    ld      a,(m_num_ent)
    inc     a
    ld      (m_num_ent), a

    ld      hl, (m_next_entity)
    ld      bc, #k_entity_size
    add     hl, bc
    ld (m_next_entity), hl
    
    or      a
    sbc     hl,bc


    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COPIAR LOS VALORES DE UNA NUEVA ENTIDAD
;; REGISTROS DESTRUIDOS: 
;; ENTRADA: 
;;      HL -> Entidad Origen
;;      DE -> Entidad Destino
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_copy:
    ld      bc, #k_entity_size
    ldir

    call    cube_reposition

    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR TODAS LAS ENTIDADES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ent_doForAll:
    ld  a, (m_num_ent)
    ld ix, #entity_vector
    ld (metodo), hl
buc:
    push af
    metodo = . + 1
    call ent_draw
    pop  af
    ld   bc, #k_entity_size
    add  ix, bc

    dec a
    jr  nz, buc

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DIBUJAR UNA ENTIDAD
;; REGISTROS DESTRUIDOS: AF, BC, DE, HL
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
;; REGISTROS DESTRUIDOS: AF, BC, DE, HL
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
;; REGISTROS DESTRUIDOS:
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MOVER UNA ENTIDAD CON TECLADO
;; REGISTROS DESTRUIDOS:
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MOVER UNA ENTIDAD
;; REGISTROS DESTRUIDOS:
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
