.8086
.model small

.data
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
font_SPACE db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; Espacio
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

sprite_cat db  00000000b,01100110b,11111111b,11111111b,11111111b,01111110b,00111100b,00011000b
alien          db  00111100b,01111110b,11011011b,11111111b,11111111b,01111110b,01100110b,11000011b  
current_x dw 0
char_color db 14

texto_anim db "ESTO ES $"
.code
public draw_char
public draw_text  
public animar_texto_lr 
draw_char proc
    push ax
    push bx
    push cx
    push dx
    push si

    mov bl, al         ; copiar caracter

    ; ----------------------------------
    ; PRIMERO verificar números (0-9)
    ; ----------------------------------
    cmp bl, '0'
    jb no_es_numero
    cmp bl, '9'
    ja no_es_numero
    
    sub bl, '0'
    mov al, 8
    mul bl
    mov si, offset font_0
    add si, ax
    jmp dibujar

no_es_numero:
    ; ----------------------------------
    ; LUEGO verificar letras (A-Z)
    ; ----------------------------------
    cmp bl, 'A'
    jb no_es_letra
    cmp bl, 'Z'
    ja no_es_letra
    
    sub bl, 'A'
    mov al, 8
    mul bl
    mov si, offset font_A
    add si, ax
    jmp dibujar

no_es_letra:
    ; ----------------------------------
    ; FINALMENTE verificar caracteres especiales
    ; ----------------------------------
    
    ; Espacio
    cmp bl, ' '
    jne no_space
    mov si, offset font_SPACE
    jmp dibujar
no_space:

    ; Símbolos de puntuación
    cmp bl, '!'
    jne no_excl
    mov si, offset font_EXCL
    jmp dibujar
no_excl:

    cmp bl, '?'
    jne no_quest
    mov si, offset font_QUEST
    jmp dibujar
no_quest:

    cmp bl, '.'
    jne no_dot
    mov si, offset font_DOT
    jmp dibujar
no_dot:

    cmp bl, ','
    jne no_comma
    mov si, offset font_COMMA
    jmp dibujar
no_comma:

    cmp bl, ':'
    jne no_colon
    mov si, offset font_COLON
    jmp dibujar
no_colon:

    cmp bl, ';'
    jne no_semi
    mov si, offset font_SEMI
    jmp dibujar
no_semi:

    ; Operadores matemáticos
    cmp bl, '+'
    jne no_plus
    mov si, offset font_PLUS
    jmp dibujar
no_plus:

    cmp bl, '-'
    jne no_minus
    mov si, offset font_MINUS
    jmp dibujar
no_minus:

    cmp bl, '*'
    jne no_star
    mov si, offset font_STAR
    jmp dibujar
no_star:

    cmp bl, '/'
    jne no_slash
    mov si, offset font_SLASH
    jmp dibujar
no_slash:

    cmp bl, '='
    jne no_equal
    mov si, offset font_EQUAL
    jmp dibujar
no_equal:

    ; Paréntesis y corchetes
    cmp bl, '('
    jne no_lpar
    mov si, offset font_LPAR
    jmp dibujar
no_lpar:

    cmp bl, ')'
    jne no_rpar
    mov si, offset font_RPAR
    jmp dibujar
no_rpar:

    cmp bl, '['
    jne no_lbrack
    mov si, offset font_LBRACK
    jmp dibujar
no_lbrack:

    cmp bl, ']'
    jne no_rbrack
    mov si, offset font_RBRACK
    jmp dibujar
no_rbrack:

    ; Flechas (usando caracteres especiales)
    cmp bl, 24         ; ↑ (código ASCII 24)
    jne no_arrow_u
    mov si, offset font_ARROW_U
    jmp dibujar
no_arrow_u:

    cmp bl, 25         ; ↓ (código ASCII 25)
    jne no_arrow_d
    mov si, offset font_ARROW_D
    jmp dibujar
no_arrow_d:

    cmp bl, 26         ; → (código ASCII 26)
    jne no_arrow_r
    mov si, offset font_ARROW_R
    jmp dibujar
no_arrow_r:

    cmp bl, 27         ; ← (código ASCII 27)
    jne no_arrow_l
    mov si, offset font_ARROW_L
    jmp dibujar
no_arrow_l:

    ; Si no es ningún caracter conocido, salir
    mov si, offset sprite_cat
    jmp dibujar
    jmp fin

dibujar:
    call draw_font_8x8

fin:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_char endp



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


draw_text proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov bx, cx        ; BX = X actual
    mov di, dx        ; DI = Y actual

next_char:
    mov al, [si]      ; leer caracter
    cmp al, '$'
    je fin_texto

    mov cx, bx        ; CX = X
    mov dx, di        ; DX = Y
    call draw_char

    add bx, 10        ; AVANCE EN X (10 px por letra)
    inc si
    jmp next_char

fin_texto:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_text endp






animar_texto_lr proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; guardo color actual en BL (byte)
    mov bl, [char_color]

    mov di, dx                ; DI = Y fijo (DX pasado por caller)
    mov si, offset texto_anim ; puntero a la cadena
    xor bx, bx                ; BX = X inicial (0)

main_loop:
    ; 1) borrar (poner color negro en la variable que lee draw_font)
    mov byte ptr [char_color], 0

    mov cx, bx
    mov dx, di
    mov si, offset texto_anim
    call draw_text            ; borra en la posición BX,DI

    ; 2) restaurar color real y dibujar
    mov byte ptr [char_color], bl

    mov cx, bx
    mov dx, di
    mov si, offset texto_anim
    call draw_text

    ; 3) avanzar (velocidad)
    add bx, 2                 ; podés cambiar a 1,4,8 según querés velocidad/fluidez

    cmp bx, 300
    jg fin2

    ; 4) delay simple
    mov cx, 40
del_out:
    mov dx, 20000
del_in:
    dec dx
    jnz del_in
    dec cx
    jnz del_out

    jmp main_loop

fin2:
    ; dejar texto final dibujado con color real
    mov byte ptr [char_color], bl
    mov cx, bx
    mov dx, di
    mov si, offset texto_anim
    call draw_text

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
animar_texto_lr endp



end

