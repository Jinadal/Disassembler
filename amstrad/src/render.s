.include "render.h.s"
.include "main.h.s"


m_front_buffer: .db 0xC0
m_back_buffer:  .db 0x80


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLEANS AND PREPARES A NEW BUFFER
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ren_newScene:
    call ren_switchBuffers
    call ren_clearBackBuffers
    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLEARS THE BUFFERS
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ren_clearBackBuffers:
    ld      a, (m_back_buffer)
    ld      h, a
    ld      de, #0
    ld      l, e
    ld      bc, #0x4000

    call    _cpct_memset_f64_asm

    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CHANGES BUFFERS
;; REGISTERS DETROYED: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ren_switchBuffers:
    ld      a, (m_back_buffer)
    ld      b,a
    ld      a, (m_front_buffer)
    ld (m_back_buffer), a
    ld      a, b
    ld (m_front_buffer), a

    srl     b
    srl     b
    ld      l, b
    jp    cpct_setVideoMemoryPage_asm

    


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DRAW ENTITY
;; REGISTERS DETROYED: AF, BC, DE ,HL
;; INPUT: IX -> Points to entity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
render_drawCube:
    ld      a, (m_back_buffer)  ;; DE = Back buffer
    ld      d, a
    ld      e, #0
    ld      c, dc_x(ix)         ;; C = Entity Y
    ld      b, dc_y(ix)         ;; B = Entity X
    call cpct_getScreenPtr_asm

    ex      de, hl        ;; DE = Puntero a memoria
    ld      l, dc_sp_l(ix)
    ld      h, dc_sp_h(ix)
    ld      b, dc_h(ix)      ;; Alto
    ld      c, dc_w(ix)      ;; Ancho

    call cpct_drawSprite_asm

    ret
