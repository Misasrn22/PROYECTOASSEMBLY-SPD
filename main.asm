.8086
.model small
.stack 100h

.data
    CADENA DB "BOCA JUNIORS",0dh,0ah,24h

.code
extrn draw_char:proc
extrn draw_sprites:proc
extrn draw_text:proc
extrn sprite_cat:byte
extrn sprite_alien:byte 
extrn sprite_hearth:byte
extrn sprite_bomb:byte
extrn sprite_space_invader:byte
extrn sprite_pac:byte
extrn sprite_ghost:byte
extrn sprite_mushroom:byte

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 00h
    mov al, 13h
    int 10h

    ; Dibujar texto
    mov cx, 96
    mov dx, 96
    mov si, offset CADENA
    call draw_text

    ; REINICIALIZAR DESPUÉS DE DRAW_TEXT
    mov ax, @data
    mov ds, ax

    ; Dibujar corazón (sprite_hearth, no sprite_heart)
    mov si, offset sprite_hearth
    mov cx, 50
    mov dx, 50
    mov al, 12
    call draw_sprites


texto:
    mov ah, 00h
    int 16h
    jmp texto

    mov ah, 00h
    mov al, 03h
    int 10h

    mov ax, 4C00h
    int 21h
main endp

end main
