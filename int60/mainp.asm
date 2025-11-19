.8086
.model small
.stack 100h

.data
CADENA db "AAAAA0 A0$"    

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax        ; IMPORTANTE para el TSR

    ; modo gráfico 13h
    mov ax, 0013h
    int 10h

    ; llamar INT 60h
    mov ah, 01h
    mov bl, 12        ; color
    mov cx, 0        ; X
    mov dx, 60        ; Y
    mov si, offset CADENA
    int 60h

    ; esperar tecla
    mov ah, 00h
    int 16h

    ; volver a modo texto
    mov ax, 0003h
    int 10h

    mov ax, 4C00h
    int 21h
main endp
end main
