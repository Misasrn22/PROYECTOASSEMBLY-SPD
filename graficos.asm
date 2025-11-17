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
sprite_cat db 00011100b,00111110b,01110111b,01111111b,01111111b,01111111b,00111110b,00000000b
sprite_hearth db 00000000b,01100110b,11111111b,11111111b,11111111b,01111110b,00111100b,00011000b
sprite_alien db 00111100b,01111110b,11011011b,11111111b,11111111b,01111110b,01100110b,11000011b
sprite_bomb db 00011000b,00011000b,01111110b,11111111b,11111111b,01111110b,00011000b,00011000b
sprite_space_invader db 00111100b,01000010b,10100101b,11111111b,11111111b,01111110b,01000010b,10100101b
sprite_pac db 00111100b,01111110b,11111111b,11111000b,11111111b,01111110b,00111100b,00000000b
sprite_ghost db 01111110b,11111111b,11111111b,11111111b,11111111b,10100101b,10100101b,10100101b
sprite_mushroom db 00111100b,01111110b,11111111b,11111111b,01111110b,00111100b,00011000b,00011000b

current_x dw 0
char_color db 14
saved_color db 0
tempX dw ?
tempY dw ?
.code
public draw_char
public draw_text
public draw_sprites  
public sprite_cat
public sprite_alien
public sprite_hearth
public sprite_bomb
public sprite_space_invader
public sprite_pac
public sprite_ghost
public sprite_mushroom


draw_char proc
    push ax
    push bx
    push cx
    push dx
    push si

    mov bl, al         ; copiar caracter

    ;-----------------------------------
    ; Seleccionar fuente según BL
    ;-----------------------------------
    cmp bl, 'A'
    jne no_A
    mov si, offset font_A
    jmp dibujar
no_A:
    cmp bl, 'B'
    jne no_B
    mov si, offset font_B
    jmp dibujar
no_B:
    cmp bl, 'C'
    jne no_C
    mov si, offset font_C
    jmp dibujar
no_C:
    cmp bl, 'D'
    jne no_D
    mov si, offset font_D
    jmp dibujar
no_D:
    cmp bl, 'E'
    jne no_E
    mov si, offset font_E
    jmp dibujar
no_E:
    cmp bl, 'F'
    jne no_F
    mov si, offset font_F
    jmp dibujar
no_F:
    cmp bl, 'G'
    jne no_G
    mov si, offset font_G
    jmp dibujar
no_G:
    cmp bl, 'H'
    jne no_H
    mov si, offset font_H
    jmp dibujar
no_H:
    cmp bl, 'I'
    jne no_I
    mov si, offset font_I
    jmp dibujar
no_I:
    cmp bl, 'J'
    jne no_J
    mov si, offset font_J
    jmp dibujar
no_J:
    cmp bl, 'K'
    jne no_K
    mov si, offset font_K
    jmp dibujar
no_K:
    cmp bl, 'L'
    jne no_L
    mov si, offset font_L
    jmp dibujar
no_L:
    cmp bl, 'M'
    jne no_M
    mov si, offset font_M
    jmp dibujar
no_M:
    cmp bl, 'N'
    jne no_N
    mov si, offset font_N
    jmp dibujar
no_N:
    cmp bl, 'O'
    jne no_O
    mov si, offset font_O
    jmp dibujar
no_O:
    cmp bl, 'P'
    jne no_P
    mov si, offset font_P
    jmp dibujar
no_P:
    cmp bl, 'Q'
    jne no_Q
    mov si, offset font_Q
    jmp dibujar
no_Q:
    cmp bl, 'R'
    jne no_R
    mov si, offset font_R
    jmp dibujar
no_R:
    cmp bl, 'S'
    jne no_S
    mov si, offset font_S
    jmp dibujar
no_S:
    cmp bl, 'T'
    jne no_T
    mov si, offset font_T
    jmp dibujar
no_T:
    cmp bl, 'U'
    jne no_U
    mov si, offset font_U
    jmp dibujar
no_U:
    cmp bl, 'V'
    jne no_V
    mov si, offset font_V
    jmp dibujar
no_V:
    cmp bl, 'W'
    jne no_W
    mov si, offset font_W
    jmp dibujar
no_W:
    cmp bl, 'X'
    jne no_X
    mov si, offset font_X
    jmp dibujar
no_X:
    cmp bl, 'Y'
    jne no_Y
    mov si, offset font_Y
    jmp dibujar
no_Y:
    cmp bl, 'Z'
    jne fin
    mov si, offset font_Z
    jmp dibujar

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
; draw_font_8x8/16x16
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

    mov [current_x], cx    ; guardo X inicial en memoria

    mov di, 8              ; contador de filas (8 filas)
fila_loop:
    mov bl, [si]           ; BL = byte de la fila actual
    mov cx, [current_x]    ; CX = X inicial para esta fila
    xor bh, bh             ; BH = 0 (page 0)

    mov bp, 8              ; contador de columnas (8 bits)
col_loop:
    test bl, 10000000b     ; testea el MSB (bit más alto)
    jz no_pixel
        mov ah, 0Ch
        mov al, [char_color]
        int 10h
no_pixel:
    shl bl, 1              ; correr bit
    inc cx                 ; siguiente columna (X+1)
    dec bp
    jnz col_loop

    inc si                 ; siguiente fila en el sprite
    inc dx                 ; bajar 1 pixel (Y + 1)
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
public draw_text

draw_text proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push ds

    ; ENTRADA:
    ; SI → puntero a cadena
    ; CX → X inicial
    ; DX → Y inicial

    mov bx, cx        ; BX = X actual
    mov di, dx        ; DI = Y actual

next_char:
    mov al, [si]      ; leer caracter
    cmp al, '$'
    je fin_texto

    ; dibujar caracter en AL
    mov cx, bx        ; CX = X
    mov dx, di        ; DX = Y
    call draw_char

    add bx, 10        ; avance en X
    inc si            ; siguiente caracter
    jmp next_char

fin_texto:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    pop ds
    ret
draw_text endp

draw_sprites proc

    ; Guardar coordenadas
    mov ax, cx
    mov [tempX], ax
    mov ax, dx
    mov [tempY], ax

    ; Guardar color actual
    mov ah, [char_color]
    mov [saved_color], ah

    ; Usar color recibido en AL
    mov [char_color], al

    ; Dibujar sprite
    call draw_sprite_8x8

    ; Restaurar color anterior
    mov ah, [saved_color]
    mov [char_color], ah

    ret
draw_sprites endp

draw_sprite_8x8 proc
    push ax
    push si
    push di

    mov di, 8                ; 8 filas
    mov ax, [tempX]          ; AX = X inicial
    mov dx, [tempY]          ; DX = Y inicial

sprite_fila_loop:
    mov bl, [si]             ; BL = byte de la fila actual
    mov cx, ax               ; CX = X actual
    mov bp, 8                ; 8 columnas

sprite_col_loop:
    test bl, 10000000b
    jz sprite_no_pixel
    mov ah, 0Ch
    mov al, [char_color]
    int 10h
sprite_no_pixel:
    shl bl, 1
    inc cx
    dec bp
    jnz sprite_col_loop

    inc si
    inc dx                   ; siguiente fila (Y + 1)
    dec di
    jnz sprite_fila_loop

    pop di
    pop si
    pop ax
    ret
draw_sprite_8x8 endp
end
