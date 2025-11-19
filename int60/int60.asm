; ==========================================================
; INT60_TSR.ASM — Plantilla .COM (TSR) para INT 60h
; - Instala ISR en INT 60h
; - Queda residente
; - AQUÍ marcás dónde poner tus servicios (AH = xx)
; ==========================================================

.8086
.model tiny
.code
org 100h
start:
   jmp main         ; salto para dejar el bloque residente primero



; ==========================================================
; BLOQUE RESIDENTE (queda en memoria)
; ==========================================================
old60_ofs dw 0
old60_seg dw 0

font_A db 00111100b, 01100110b, 11000011b, 11000011b, 11111111b, 11000011b, 11000011b, 00000000b
font_B db 11111100b, 11000110b, 11000110b, 11111100b, 11000110b, 11000110b, 11111100b, 00000000b
font_C db 00111110b, 01100000b, 11000000b, 11000000b, 11000000b, 01100000b, 00111110b, 00000000b
font_D db 11111100b, 11000110b, 11000011b, 11000011b, 11000011b, 11000110b, 11111100b, 00000000b
font_E db 11111110b, 11000000b, 11000000b, 11111100b, 11000000b, 11000000b, 11111110b, 00000000b
font_F db 11111110b, 11000000b, 11000000b, 11111100b, 11000000b, 11000000b, 11000000b, 00000000b
font_G db 00111110b, 01100000b, 11000000b, 11001110b, 11000011b, 01100011b, 00111110b, 00000000b
font_H db 11000011b, 11000011b, 11000011b, 11111111b, 11000011b, 11000011b, 11000011b, 00000000b
font_I db 01111110b, 00011000b, 00011000b, 00011000b, 00011000b, 00011000b, 01111110b, 00000000b
font_J db 00000110b, 00000110b, 00000110b, 00000110b, 00000110b, 11000110b, 01111100b, 00000000b
font_K db 11000110b, 11001100b, 11011000b, 11110000b, 11011000b, 11001100b, 11000110b, 00000000b
font_L db 11000000b, 11000000b, 11000000b, 11000000b, 11000000b, 11000000b, 11111110b, 00000000b
font_M db 11000011b, 11100111b, 11111111b, 11011011b, 11000011b, 11000011b, 11000011b, 00000000b
font_N db 11000011b, 11100011b, 11110011b, 11011011b, 11001111b, 11000111b, 11000011b, 00000000b
font_O db 00111100b, 01100110b, 11000011b, 11000011b, 11000011b, 01100110b, 00111100b, 00000000b
font_P db 11111100b, 11000110b, 11000110b, 11111100b, 11000000b, 11000000b, 11000000b, 00000000b
font_Q db 00111100b, 01100110b, 11000011b, 11000011b, 11011011b, 01101110b, 00111101b, 00000000b
font_R db 11111100b, 11000110b, 11000110b, 11111100b, 11011000b, 11001100b, 11000110b, 00000000b
font_S db 01111100b, 11000110b, 11000000b, 01111100b, 00000110b, 11000110b, 01111100b, 00000000b
font_T db 11111111b, 00011000b, 00011000b, 00011000b, 00011000b, 00011000b, 00011000b, 00000000b
font_U db 11000011b, 11000011b, 11000011b, 11000011b, 11000011b, 11000011b, 01111110b, 00000000b
font_V db 11000011b, 11000011b, 11000011b, 11000011b, 01100110b, 00111100b, 00011000b, 00000000b
font_W db 11000011b, 11000011b, 11000011b, 11011011b, 11111111b, 11100111b, 11000011b, 00000000b
font_X db 11000011b, 01100110b, 00111100b, 00011000b, 00111100b, 01100110b, 11000011b, 00000000b
font_Y db 11000011b, 01100110b, 00111100b, 00011000b, 00011000b, 00011000b, 00011000b, 00000000b
font_Z db 11111111b, 00000110b, 00001100b, 00011000b, 00110000b, 01100000b, 11111111b, 00000000b
;-----------------------------------------------------------------------------------------------------------;
font_0 db 00111100b, 01100110b, 11001111b, 11011011b, 11110011b, 01100110b, 00111100b, 00000000b
font_1 db 00011000b, 00111000b, 00011000b, 00011000b, 00011000b, 00011000b, 01111110b, 00000000b
font_2 db 01111100b, 11000110b, 00000110b, 00011100b, 00110000b, 11000000b, 11111110b, 00000000b
font_3 db 01111100b, 11000110b, 00000110b, 00011100b, 00000110b, 11000110b, 01111100b, 00000000b
font_4 db 00001100b, 00011100b, 00111100b, 01101100b, 11111110b, 00001100b, 00001100b, 00000000b
font_5 db 11111110b, 11000000b, 11111100b, 00000110b, 00000110b, 11000110b, 01111100b, 00000000b
font_6 db 00111100b, 01100000b, 11000000b, 11111100b, 11000110b, 11000110b, 01111100b, 00000000b
font_7 db 11111110b, 00000110b, 00001100b, 00011000b, 00110000b, 00110000b, 00110000b, 00000000b
font_8 db 01111100b, 11000110b, 11000110b, 01111100b, 11000110b, 11000110b, 01111100b, 00000000b
font_9 db 01111100b, 11000110b, 11000110b, 01111110b, 00000110b, 00001100b, 01111000b, 00000000b

;------------------------------------------------------------------------------------------------------

; Font 8x8 para caracteres especiales

; Símbolos básicos
font_SPACE db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; Espacio, es necesario!!!
font_EXCL  db 00011000b, 00111100b, 00111100b, 00011000b, 00011000b, 00000000b, 00011000b, 00000000b  ; !
font_QUOT  db 01101100b, 01101100b, 01101100b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; "
font_HASH  db 01101100b, 01101100b, 11111110b, 01101100b, 11111110b, 01101100b, 01101100b, 00000000b  ; #
font_DOLAR db 00010000b, 01111100b, 11010000b, 01111000b, 00010110b, 11111000b, 00010000b, 00000000b  ; $
font_PERC  db 01100010b, 01100110b, 00001100b, 00011000b, 00110000b, 01100110b, 11000110b, 00000000b  ; %
font_AMP   db 00111000b, 01101100b, 00111000b, 01110110b, 11011100b, 11001100b, 01110110b, 00000000b  ; &
font_APOS  db 00011000b, 00011000b, 00110000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; '
font_LPAR  db 00001100b, 00011000b, 00110000b, 00110000b, 00110000b, 00011000b, 00001100b, 00000000b  ; (
font_RPAR  db 00110000b, 00011000b, 00001100b, 00001100b, 00001100b, 00011000b, 00110000b, 00000000b  ; )
font_STAR  db 00000000b, 01100110b, 00111100b, 11111111b, 00111100b, 01100110b, 00000000b, 00000000b  ; *
font_PLUS  db 00000000b, 00011000b, 00011000b, 01111110b, 00011000b, 00011000b, 00000000b, 00000000b  ; +
font_COMMA db 00000000b, 00000000b, 00000000b, 00000000b, 00011000b, 00011000b, 00110000b, 00000000b  ; ,
font_MINUS db 00000000b, 00000000b, 00000000b, 01111110b, 00000000b, 00000000b, 00000000b, 00000000b  ; -
font_DOT   db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00011000b, 00011000b, 00000000b  ; .
font_SLASH db 00000000b, 00000110b, 00001100b, 00011000b, 00110000b, 01100000b, 11000000b, 00000000b  ; /

; Símbolos para juegos
font_COLON db 00000000b, 00011000b, 00011000b, 00000000b, 00000000b, 00011000b, 00011000b, 00000000b  ; :
font_SEMI  db 00000000b, 00011000b, 00011000b, 00000000b, 00011000b, 00011000b, 00110000b, 00000000b  ; ;
font_LT    db 00001100b, 00011000b, 00110000b, 01100000b, 00110000b, 00011000b, 00001100b, 00000000b  ; <
font_EQUAL db 00000000b, 00000000b, 01111110b, 00000000b, 01111110b, 00000000b, 00000000b, 00000000b  ; =
font_GT    db 00110000b, 00011000b, 00001100b, 00000110b, 00001100b, 00011000b, 00110000b, 00000000b  ; >
font_QUEST db 01111100b, 11000110b, 00001100b, 00011000b, 00011000b, 00000000b, 00011000b, 00000000b  ; ?
font_AT    db 01111100b, 10000110b, 10111010b, 10101010b, 10111010b, 10000000b, 01111100b, 00000000b  ; @

; Corchetes y llaves
font_LBRACK db 00111100b, 00110000b, 00110000b, 00110000b, 00110000b, 00110000b, 00111100b, 00000000b  ; [
font_BSLASH db 11000000b, 01100000b, 00110000b, 00011000b, 00001100b, 00000110b, 00000010b, 00000000b  ; \
font_RBRACK db 00111100b, 00001100b, 00001100b, 00001100b, 00001100b, 00001100b, 00111100b, 00000000b  ; ]
font_CARET  db 00010000b, 00111000b, 01101100b, 11000110b, 00000000b, 00000000b, 00000000b, 00000000b  ; ^
font_UNDER  db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 11111111b, 00000000b  ; _
font_BQUOT  db 00110000b, 00011000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; `

; Símbolos para puntuación de juegos
font_HEART  db 01101100b, 11111110b, 11111110b, 11111110b, 01111100b, 00111000b, 00010000b, 00000000b  ; ♥
font_DIAMOND db 00010000b, 00111000b, 01111100b, 11111110b, 01111100b, 00111000b, 00010000b, 00000000b ; ♦
font_CLUB   db 00011000b, 00011000b, 01111110b, 11111111b, 11111111b, 01111110b, 00011000b, 00011000b  ; ♣
font_SPADE  db 00011000b, 00111100b, 01111110b, 11111111b, 11111111b, 00100100b, 01100110b, 00000000b  ; ♠

; Flechas para controles
font_ARROW_U db 00011000b, 00111100b, 01111110b, 00011000b, 00011000b, 00011000b, 00011000b, 00000000b ; ↑
font_ARROW_D db 00011000b, 00011000b, 00011000b, 00011000b, 01111110b, 00111100b, 00011000b, 00000000b ; ↓
font_ARROW_L db 00000000b, 00011000b, 00110000b, 01111110b, 00110000b, 00011000b, 00000000b, 00000000b ; ←
font_ARROW_R db 00000000b, 00011000b, 00001100b, 01111110b, 00001100b, 00011000b, 00000000b, 00000000b ; →

titulo_ptr dw 0
char_color db 0      
current_x dw 0        

;=========================================================
; draw_font_8x8
;   Usa SI → puntero al FONT elegido
;   Usa CX,DX → posición
;=========================================================
draw_font_8x8 proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; aseguramos página 0
    xor bh, bh

    ; guardamos X inicial en memoria temporal (word)
    mov [current_x], cx

    mov di, 8          ; filas = 8
fila_loop:
    mov bl, [si]       ; byte de la fila
    mov cx, [current_x] ; restaurar X inicial para esta fila

    push dx            ; guardo Y actual
    mov bp, 8          ; columnas = 8

col_loop:
    test bl, 10000000b
    jz no_pixel
    mov ah, 0Ch
    mov al, [char_color]
    int 10h
no_pixel:
    shl bl,1
    inc cx
    dec bp
    jnz col_loop

    pop dx             ; recupero Y original
    inc dx             ; bajo una fila
    inc si             ; siguiente byte del font
    dec di
    jnz fila_loop

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_font_8x8 endp
;--------------------------------------
;---------FIN DRAW FONT----------------
;--------------------------------------

; ==========================================================
; HANDLER PRINCIPAL (INT 60h)
; ==========================================================
int60_handler proc far
    ; --- salvar registros que vamos a usar ---
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push ds
    push es

    ; asegurar DS apunta al segmento del TSR
    push cs
    pop ds

;;;; ELECCION DE SERVICIOS!!!!!
    cmp ah, 01h
    je servicio_01

  
    ; si no es ninguno de los servicios propios -> encadenar al handler viejo
    jmp encadenar_viejo

;;;; SERVICIOS !!!!
;=========================================================
; SERVICIO 01 – DIBUJAR TEXTO GRANDE 8x8
;---------------------------------------------------------
; Protocolo de llamada desde el MAIN:
;   mov ah, 01h          ; servicio 1
;   mov bl, COLOR        ; color de las letras
;   mov cx, X            ; posición X inicial
;   mov dx, Y            ; posición Y inicial
;   mov si, offset CADENA  ; puntero a cadena terminada en '$'
;   int 60h
;=========================================================

servicio_01:

    mov [char_color], bl      ; color
    mov bx, cx                ; X
    mov di, dx                ; Y

S01_siguiente_caracter:
    mov al, [si]
    cmp al, '$'
    je S01_fin_texto

    mov cx, bx
    mov dx, di
    call S01_draw_char

    add bx, 10        ; avance en X
    inc si
    jmp S01_siguiente_caracter

S01_fin_texto:
    jmp SALIR_SERVICIOS

;=========================================================
; S01_draw_char
;   Dibuja UN carácter usando las tablas de texto 8x8
;   Solo letras, números y símbolos comunes.
;   Si el carácter NO existe → NO dibuja nada.
;=========================================================

S01_draw_char:
    push ax
    push bx
    push cx
    push dx
    push si

    mov bl, al

    ; numeros 0–9
    cmp bl, '0'
    jb S01_try_letter
    cmp bl, '9'
    ja S01_try_letter
    sub bl, '0'
    mov al, 8
    mul bl
    mov si, offset font_0
    add si, ax
    jmp S01_do_draw

S01_try_letter:
    ; letras A–Z
    cmp bl, 'A'
    jb S01_try_special
    cmp bl, 'Z'
    ja S01_try_special
    sub bl, 'A'
    mov al, 8
    mul bl
    mov si, offset font_A
    add si, ax
    jmp S01_do_draw

S01_try_special:
    cmp bl, ' '
    je S01_space
    cmp bl, '!'
    je S01_excl
    cmp bl, '?'
    je S01_quest
    cmp bl, '.'
    je S01_dot
    cmp bl, ','
    je S01_comma
    cmp bl, ':'
    je S01_colon
    cmp bl, ';'
    je S01_semi
    cmp bl, '+'
    je S01_plus
    cmp bl, '-'
    je S01_minus
    cmp bl, '*'
    je S01_star
    cmp bl, '/'
    je S01_slash
    cmp bl, '='
    je S01_equal
    cmp bl, '('
    je S01_lpar
    cmp bl, ')'
    je S01_rpar
    cmp bl, '['
    je S01_lbrack
    cmp bl, ']'
    je S01_rbrack

    ; no coincide -> no dibuja
    jmp S01_fin_char

S01_space:  mov si, offset font_SPACE   ; espacio
            jmp S01_do_draw
S01_excl:   mov si, offset font_EXCL    ; !
            jmp S01_do_draw
S01_quest:  mov si, offset font_QUEST   ; ?
            jmp S01_do_draw
S01_dot:    mov si, offset font_DOT     ; .
            jmp S01_do_draw
S01_comma:  mov si, offset font_COMMA   ; ,
            jmp S01_do_draw
S01_colon:  mov si, offset font_COLON   ; :
            jmp S01_do_draw
S01_semi:   mov si, offset font_SEMI    ; ;
            jmp S01_do_draw
S01_plus:   mov si, offset font_PLUS    ; +
            jmp S01_do_draw
S01_minus:  mov si, offset font_MINUS   ; -
            jmp S01_do_draw
S01_star:   mov si, offset font_STAR    ; *
            jmp S01_do_draw
S01_slash:  mov si, offset font_SLASH   ; /
            jmp S01_do_draw
S01_equal:  mov si, offset font_EQUAL   ; =
            jmp S01_do_draw
S01_lpar:   mov si, offset font_LPAR
            jmp S01_do_draw
S01_rpar:   mov si, offset font_RPAR
            jmp S01_do_draw
S01_lbrack: mov si, offset font_LBRACK
            jmp S01_do_draw
S01_rbrack: mov si, offset font_RBRACK
            jmp S01_do_draw

S01_do_draw:
    call draw_font_8x8
    jmp S01_fin_char

S01_fin_char:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret



;;; ==========================================================
;;; ENCADENAMIENTO: si NO atendemos la petición, llamamos al viejo
;;; ==========================================================
encadenar_viejo:
    pushf
    push word ptr [old60_seg]
    push word ptr [old60_ofs]
    retf
SALIR_SERVICIOS:
salir_handler:

    pop es
    pop ds
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    iret


int60_handler endp

msg db 'INT60 TSR instalado correctamente$'
FinResidente label byte 
; ==========================================================
; MAIN: instalar ISR y dejar residente (TSR)
; ==========================================================
main:
    ; unificar segmentos CS = DS = ES
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; --- guardar vector viejo de INT 60h ---
    mov ax, 3560h
    int 21h
    mov [old60_ofs], bx
    mov [old60_seg], es
    ; --- instalar nuestra ISR ---
    mov dx, offset int60_handler
    mov ax, 2560h    ; AH=25h, AL=60h -> poner vector de INT 60h
    int 21h

    ; --- dejar residente ---
    ; calculo simple del tamaño en bytes desde inicio hasta FinResidente
    mov dx, offset FinResidente
    add dx, 15
    shr dx, 4

    mov ah, 9
    mov dx, offset msg
    int 21h
   
    mov ax, 3100h
    int 21h


end start