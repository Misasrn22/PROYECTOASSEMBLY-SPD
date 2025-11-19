.8086
.model small
.stack 100h

.data
CADENA db "HOLA MUNDO$"

.code
start:
    mov ax, @data
    mov ds, ax

    mov ax, 0013h
    int 10h

    ; pasar segmento correcto al TSR
    push cs
    pop es

    mov ah, 01h
    mov bl, 12         ; color
    mov cx, 50         ; X
    mov dx, 100        ; Y
    mov si, offset CADENA
    int 60h

    mov ah, 00h
    int 16h

    mov ax, 0003h
    int 10h

    mov ax, 4C00h
    int 21h
end start