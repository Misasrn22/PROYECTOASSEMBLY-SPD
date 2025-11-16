.8086
.model small
.stack 100h

.data
    db 47h,50h,54h,32h,35h     ; línea obligatoria
    CADENA DB "BOCA JUNIORS",0dh,0ah,24h

.code
extrn draw_letter_A:proc      ; IMPORTAMOS LA FUNCIÓN
extrn draw_letter_C:proc
extrn draw_char:proc

extrn draw_text:proc



main proc
    mov ax, @data
    mov ds, ax

    ; --- Modo gráfico 320x200x256
    mov ah, 00h
    mov al, 13h
    int 10h

    ; Dibujar letra A en (100, 50)
    ;Entrada:
    ;AL = carácter ('A','E','I','O','U' mayúsculas)
    ;CX = pos X
    ;DX = pos Y

    mov cx, 00 ; cx=pos x
    mov dx, 10
    mov al, 'A'
    call draw_char

    mov cx, 96  ; X
    mov dx, 96      ; Y
    mov si,offset cadena  
    call draw_text


    
texto:
    ; Esperar tecla
    mov ah, 00h
    int 16h
    jmp texto
    ; Volver a texto
    mov ah, 00h
    mov al, 03h
    int 10h

    
    mov ax,4C00h
    int 21h
main endp

end main
