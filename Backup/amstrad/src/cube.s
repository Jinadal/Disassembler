.include "cpctelera.h.s"
.include "main.h.s"
.include "cube.h.s"

k_max_num_cube_line = 20
k_cube_size = 7

cubeline1_vector:
DefineNCubeLine1 cubeline1_vector, k_max_num_cube_line
DefineCubeLine1 cubeline1, 0x40, 0x100, 0x04, 0x08, 0x01, 0x0F
DefineCubeLine1 cubedefault, 0x00, 0x40, 0x04, 0x08, 0x01, 0xFF

num_reposition: .db 00
num_cubeline1: .db 00
next_cube: .dw cubeline1_vector
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; REGISTERS A NEW CUBE
;; REGISTERS DESTROYED: AF, HL, BC
;; OUTPUT: HL -> Pointer to the entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_reposition:
    ex      de, hl
    ld      de, #k_cube_size            

    sbc     hl, de

    ld      a, (num_reposition)
    add     (hl)
    ld      (hl), a

    add     a, #5
    ld      (num_reposition),a
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; REGISTERS A NEW CUBE
;; REGISTERS DESTROYED: AF, HL, BC
;; OUTPUT: HL -> Pointer to the entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_new:
    ld      a, (num_cubeline1)  ;;Inc cube num
    inc     a
    ld      (num_cubeline1),a

    ld      hl, (next_cube)     ;; hl = 7 for jumping to next cube
    ld      bc, #k_cube_size
    add     hl, bc              ;; jump to next cube in array
    ld      (next_cube), hl     ;; 
    or      a                   ;;Acarreo = 0
    sbc     hl, bc              ;;Hl -> cube before

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COPY VALUES FROM A CUBE TO ANOTHER
;; REGISTERS DESTROYED: AF, HL, BC
;; INPUT:
;;      HL -> Origen Cube
;;      DE -> Destiny Cube
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_copy:
    ld      bc, #k_cube_size
    ldir

    call    cube_reposition
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  CONTROLS ALL ENTITIES 
;;  INPUT: HL -> Points to method needed 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_doForAll:
    ld      a, (num_cubeline1)
    ld      ix,#cubeline1_vector
    ld      (metodo), hl
buc:
    push    af
    metodo = . + 1
    call    cube_draw
    pop     af
    ld      bc, #k_cube_size
    add     ix, bc

    dec a
    jp nz, buc
    
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW ENTITY
;; REGISTERS DETROYED: AF, BC, DE ,HL
;; INPUT: IX -> Points to entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_draw:
    ld    de, #0xC000       ;;Comienzo memoria de video
    ld     c, c_x(ix)         ;; C = Entity Y
    ld     b, c_y(ix)         ;; B = Entity X
    call cpct_getScreenPtr_asm

    ex    de, hl        ;; DE = Puntero a memoria
    ld  a, c_col(ix)    ;; Color
    ld  b, c_h(ix)      ;; Alto
    ld  c, c_w(ix)      ;; Ancho

    call cpct_drawSolidBox_asm

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BORRA UNA ENTIDAD
;; PARA CUADRADOS UNICAMENTE
;; REGISTERS DESTROYED: AF, AF', BC, DE, HL
;; ENTRADA: IX -> Puntero a entidad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cube_clear:

   ld  a, c_col(ix)
   ex af, af'

   ld  c_col(ix), #0

   call cube_draw
   ex af, af'
   ld c_col(ix), a

   ret
