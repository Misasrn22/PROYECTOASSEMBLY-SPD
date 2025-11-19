.8086
.model tiny
.code
org 100h

start:
    jmp instalar

; TABLA COMPLETA DE FONTS (A-Z, 0-9, símbolos)
fonts:
; A-Z
db 00111100b, 01000010b, 01000010b, 01111110b, 01000010b, 01000010b, 01000010b, 00000000b  ; A
db 01111100b, 01000010b, 01000010b, 01111100b, 01000010b, 01000010b, 01111100b, 00000000b  ; B  
db 00111100b, 01000010b, 01000000b, 01000000b, 01000000b, 01000010b, 00111100b, 00000000b  ; C
db 01111100b, 01000010b, 01000010b, 01000010b, 01000010b, 01000010b, 01111100b, 00000000b  ; D
db 01111110b, 01000000b, 01000000b, 01111100b, 01000000b, 01000000b, 01111110b, 00000000b  ; E
db 01111110b, 01000000b, 01000000b, 01111100b, 01000000b, 01000000b, 01000000b, 00000000b  ; F
db 00111100b, 01000010b, 01000000b, 01001110b, 01000010b, 01000010b, 00111100b, 00000000b  ; G
db 01000010b, 01000010b, 01000010b, 01111110b, 01000010b, 01000010b, 01000010b, 00000000b  ; H
db 01111100b, 00010000b, 00010000b, 00010000b, 00010000b, 00010000b, 01111100b, 00000000b  ; I
db 00000110b, 00000010b, 00000010b, 00000010b, 01000010b, 01000010b, 00111100b, 00000000b  ; J
db 01000010b, 01000100b, 01001000b, 01110000b, 01001000b, 01000100b, 01000010b, 00000000b  ; K
db 01000000b, 01000000b, 01000000b, 01000000b, 01000000b, 01000000b, 01111110b, 00000000b  ; L
db 01000010b, 01100110b, 01011010b, 01000010b, 01000010b, 01000010b, 01000010b, 00000000b  ; M
db 01000010b, 01100010b, 01010010b, 01001010b, 01000110b, 01000010b, 01000010b, 00000000b  ; N
db 00111100b, 01000010b, 01000010b, 01000010b, 01000010b, 01000010b, 00111100b, 00000000b  ; O
db 01111100b, 01000010b, 01000010b, 01111100b, 01000000b, 01000000b, 01000000b, 00000000b  ; P
db 00111100b, 01000010b, 01000010b, 01000010b, 01001010b, 01000100b, 00111010b, 00000000b  ; Q
db 01111100b, 01000010b, 01000010b, 01111100b, 01001000b, 01000100b, 01000010b, 00000000b  ; R
db 00111100b, 01000010b, 01000000b, 00111100b, 00000010b, 01000010b, 00111100b, 00000000b  ; S
db 01111111b, 00001000b, 00001000b, 00001000b, 00001000b, 00001000b, 00001000b, 00000000b  ; T
db 01000010b, 01000010b, 01000010b, 01000010b, 01000010b, 01000010b, 00111100b, 00000000b  ; U
db 01000010b, 01000010b, 01000010b, 01000010b, 00100100b, 00011000b, 00000000b, 00000000b  ; V
db 01000010b, 01000010b, 01000010b, 01000010b, 01011010b, 01100110b, 01000010b, 00000000b  ; W
db 01000010b, 00100100b, 00011000b, 00011000b, 00100100b, 01000010b, 01000010b, 00000000b  ; X
db 01000010b, 00100100b, 00011000b, 00001000b, 00001000b, 00001000b, 00001000b, 00000000b  ; Y
db 01111110b, 00000100b, 00001000b, 00010000b, 00100000b, 01000000b, 01111110b, 00000000b  ; Z

; 0-9
db 00111100b, 01000110b, 01001010b, 01010010b, 01100010b, 01000010b, 00111100b, 00000000b  ; 0
db 00011000b, 00111000b, 00011000b, 00011000b, 00011000b, 00011000b, 01111110b, 00000000b  ; 1
db 00111100b, 01000010b, 00000010b, 00011100b, 00100000b, 01000000b, 01111110b, 00000000b  ; 2
db 00111100b, 01000010b, 00000010b, 00011100b, 00000010b, 01000010b, 00111100b, 00000000b  ; 3
db 00000100b, 00001100b, 00010100b, 00100100b, 01111110b, 00000100b, 00000100b, 00000000b  ; 4
db 01111110b, 01000000b, 01111100b, 00000010b, 00000010b, 01000010b, 00111100b, 00000000b  ; 5
db 00111100b, 01000000b, 01000000b, 01111100b, 01000010b, 01000010b, 00111100b, 00000000b  ; 6
db 01111110b, 00000010b, 00000100b, 00001000b, 00010000b, 00010000b, 00010000b, 00000000b  ; 7
db 00111100b, 01000010b, 01000010b, 00111100b, 01000010b, 01000010b, 00111100b, 00000000b  ; 8
db 00111100b, 01000010b, 01000010b, 00111110b, 00000010b, 00000010b, 00111100b, 00000000b  ; 9

; Símbolos (índices 36+)
db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00000000b  ; espacio (36)
db 00000000b, 00000000b, 00000000b, 00000000b, 00000000b, 00011000b, 00011000b, 00000000b  ; . (37)
db 00011000b, 00011000b, 00011000b, 00011000b, 00000000b, 00011000b, 00011000b, 00000000b  ; ! (38)

old_int60_offset dw 0
old_int60_segment dw 0
color_actual db 15

; TABLA DE BÚSQUEDA RÁPIDA
char_table db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 .!'

; HANDLER INT 60h - CON BÚSQUEDA EN TABLA
int60_handler proc far
    cmp ah, 01h
    jne chain_old
    
    push es ds si di bp bx cx dx ax
    push cs
    pop ds
    
    mov [color_actual], bl
    mov bp, cx
    mov di, dx
    
bucle_caracteres:
    mov al, es:[si]
    cmp al, '$'
    je fin_texto
    
    ; BÚSQUEDA EN TABLA - SIN SALTOS LARGOS
    mov bx, offset char_table
    mov cx, 39  ; Total de caracteres en la tabla
    
buscar_en_tabla:
    cmp al, [bx]
    je encontrado
    inc bx
    loop buscar_en_tabla
    jmp siguiente_car  ; No encontrado
    
encontrado:
    ; Calcular offset del font
    mov ax, 39         ; Total caracteres
    sub ax, cx         ; AX = índice encontrado
    mov bl, 8
    mul bl            ; AX = índice * 8
    mov bx, offset fonts
    add bx, ax        ; BX apunta al font

dibujar_car:
    push si
    mov si, bx
    mov cx, bp
    mov dx, di
    call dibujar_font
    pop si
    
siguiente_car:
    add bp, 9
    inc si
    jmp bucle_caracteres

fin_texto:
    pop ax dx cx bx bp di si ds es
    iret

chain_old:
    pushf
    call dword ptr cs:[old_int60_offset]
    iret

; FUNCIÓN DIBUJAR FONT
dibujar_font proc
    push ax bx cx dx si di
    mov di, 8
    mov bh, 0
    
bucle_filas:
    mov bl, [si]
    mov cx, bp
    push di
    mov di, 8
    
bucle_columnas:
    test bl, 10000000b
    jz no_pixel
    mov ah, 0Ch
    mov al, [color_actual]
    int 10h
no_pixel:
    shl bl, 1
    inc cx
    dec di
    jnz bucle_columnas
    pop di
    inc dx
    inc si
    dec di
    jnz bucle_filas
    pop di si dx cx bx ax
    ret
dibujar_font endp

int60_handler endp

msg db 'TSR instalado!$'

; INSTALACIÓN
instalar:
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ah, 35h
    mov al, 60h
    int 21h
    mov [old_int60_offset], bx
    mov [old_int60_segment], es
    mov dx, offset int60_handler
    mov ah, 25h
    mov al, 60h
    int 21h
    mov ah, 9
    mov dx, offset msg
    int 21h
    mov dx, offset instalar
    add dx, 15
    shr dx, 4
    mov ax, 3100h
    int 21h

end start
