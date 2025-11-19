.8086
.model small
.stack 100h

.data
opcion1 db "1. JUGAR$"
opcion2 db "2. PUNTUACIONES$" 
opcion3 db "3. SALIR$"
cursor  db ".$"

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    mov ax, 13h
    int 10h
    
    mov ah, 01h
    mov bl, 15       ; Cyan
    mov cx, 100
    mov dx, 60
    mov si, offset opcion1
    int 60h

    mov dx, 80
    mov si, offset opcion2  
    int 60h

    mov dx, 100
    mov si, offset opcion3
    int 60h

; Cursor de selección
    mov bl, 1        ; Amarillo
    mov cx, 80
    mov dx, 60
    mov si, offset cursor
    int 60h
    
    mov ah, 0
    int 16h
    mov ax, 3
    int 10h
    mov ax, 4C00h
    int 21h
main endp
end main
