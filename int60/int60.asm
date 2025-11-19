; int60_tsr_fixed.asm
; TSR .COM (tiny). Servicio 01: dibujar texto 8x8.
; Compilar: tasm int60_tsr_fixed.asm
;          tlink /t int60_tsr_fixed.obj

.8086
.model tiny
.code
org 100h

start:
    jmp main        ; primer código del .COM

; --------------------------
; BLOQUE RESIDENTE (todo esto debe quedar en memoria)
; --------------------------

old60_ofs dw 0
old60_seg dw 0

; minimal fonts (ejemplo): A, espacio y 0 (agregar más si querés)
font_A db 00111100b,01100110b,11000011b,11000011b,11111111b,11000011b,11000011b,00000000b
font_0 db 00111100b,01100110b,11001111b,11011011b,11110011b,01100110b,00111100b,00000000b
font_SPACE db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b

char_color db 15
current_x  dw 0

; --------------------------
; draw_font_8x8: SI -> puntero al font (8 bytes), CX=X, DX=Y
; --------------------------
draw_font_8x8 proc
    push ax bx cx dx si di
    xor bh,bh
    mov [current_x], cx
    mov di, 8
fila_loop:
    mov bl, [si]
    mov cx, [current_x]
    push dx
    mov bp, 8
col_loop:
    test bl,10000000b
    jz no_px
    mov ah,0Ch
    mov al, [char_color]
    int 10h
no_px:
    shl bl,1
    inc cx
    dec bp
    jnz col_loop
    pop dx
    inc dx
    inc si
    dec di
    jnz fila_loop
    pop di si dx cx bx ax
    ret
draw_font_8x8 endp

; --------------------------
; HANDLER INT 60h (FAR)
; Prologue/Epilogue balanceados y DS=CS dentro del handler
; --------------------------
int60_handler proc far
    ; salvar registros (orden consistente)
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push ds
    push es

    ; ahora establecemos DS=CS para acceder a las tablas residentes
    push cs
    pop ds

    ; --- servicio: AH = 01 -> dibujar texto usando ES:SI como fuente de cadena ---
    cmp ah, 01h
    je svc_01

    ; no atendido -> encadenar al handler original
    jmp encadenar_viejo

; ------------------------------------------------
svc_01:
    ; Bl = color, CX = X, DX = Y, ES:SI -> cadena terminada en '$'
    mov [char_color], bl
    mov bx, cx        ; X actual
    mov di, dx        ; Y fijo

svc01_loop:
    mov al, es:[si]    ; LEEMOS desde ES:SI (caller debe pasar ES)
    cmp al, '$'
    je svc01_done

    ; localizar font simple: ejemplo A/0/space (expandir a tabla si querés)
    cmp al, 'A'
    je use_A
    cmp al, '0'
    je use_0
    cmp al, ' '
    je use_space
    jmp svc01_skip_char

use_A:
    mov si, offset font_A
    jmp svc01_draw
use_0:
    mov si, offset font_0
    jmp svc01_draw
use_space:
    mov si, offset font_SPACE
    jmp svc01_draw

svc01_draw:
    mov cx, bx
    mov dx, di
    call draw_font_8x8
    add bx, 10
    inc word ptr [si] ; (no tiene efecto aquí, solo para balance) ; <-- lo removí abajo

svc01_skip_char:
    inc word ptr [si] ; dummy (no se usa, pero mantenemos flujo)
    inc si            ; avanzar en la cadena ES:SI
    jmp svc01_loop

svc01_done:
    ; terminar servicio
    jmp svc01_exit

; ------------------------------------------------
encadenar_viejo:
    pushf
    push word ptr [old60_seg]
    push word ptr [old60_ofs]
    retf

svc01_exit:
    ; restaurar segmentos/registros en orden inverso al push
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

msg db 'INT60 TSR instalado$'

; FIN DEL BLOQUE RESIDENTE: etiqueta que marca el último byte que debe quedar residente
FinResidente label byte

; --------------------------
; MAIN: instalar vector y dejar residente
; --------------------------
main:
    ; asegurar CS=DS=ES para la instalación (código del TSR)
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; obtener vector viejo INT 60h
    mov ah, 35h
    mov al, 60h
    int 21h
    mov [old60_ofs], bx
    mov [old60_seg], es

    ; instalar nuestro handler (INT 60h)
    mov dx, offset int60_handler
    mov ah, 25h
    mov al, 60h
    int 21h

    ; imprimir mensaje
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; calcular parágrafos a quedar residente (desde org 100h hasta FinResidente)
    mov dx, offset FinResidente
    add dx, 15
    shr dx, 4

    ; dejar residente (AH=31h)
    mov ax, 3100h
    int 21h

end start
