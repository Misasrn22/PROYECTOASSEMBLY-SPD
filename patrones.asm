.8086
.model small

.data
    fondoColor db 0
    lineaColor db 0
    color_par   db 1
    color_impar db 3
    puntoColor db 0
    marcoColor db 0

     
.code



public draw_pattern
public draw_cuadricula
public draw_dotted_pattern
public draw_marco
public draw_marco_offset
draw_marco_offset proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov ah, 0Ch      ; función poner pixel
    ; AL = color

    mov si, bx       ; SI = offset
    mov di, bx       ; DI = offset

    ; límites
    mov bp, si
    add bp, cx       ; Xfinal = offset + ancho

    mov bx, di
    add bx, dx       ; Yfinal = offset + alto

; -------------------------
; Línea superior
; -------------------------
    mov dx, di
    mov cx, si
top_line:
    cmp cx, bp
    jge top_done
    int 10h
    inc cx
    jmp top_line
top_done:

; -------------------------
; Línea inferior
; -------------------------
    mov dx, bx
    mov cx, si
bottom_line:
    cmp cx, bp
    jge bottom_done
    int 10h
    inc cx
    jmp bottom_line
bottom_done:

; -------------------------
; Línea izquierda
; -------------------------
    mov cx, si
    mov dx, di
left_line:
    cmp dx, bx
    jge left_done
    int 10h
    inc dx
    jmp left_line
left_done:

; -------------------------
; Línea derecha
; -------------------------
    mov cx, bp
    mov dx, di
right_line:
    cmp dx, bx
    jge right_done
    int 10h
    inc dx
    jmp right_line
right_done:

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_marco_offset endp
draw_marco proc
    push ax
    push bx
    push cx
    push dx

    mov [marcoColor], al    ; guardar color

    ;---------------------------------------------------
    ; 1) Borde superior (y = 0, x va 0..319)
    ;---------------------------------------------------
    mov dx, 0               ; y = 0
    mov cx, 0               ; x = 0
sup_loop:
    cmp cx, 320
    jge sup_done

    mov ah, 0Ch
    mov al, [marcoColor]
    int 10h

    inc cx
    jmp sup_loop
sup_done:


    ;---------------------------------------------------
    ; 2) Borde inferior (y = 199)
    ;---------------------------------------------------
    mov dx, 199
    mov cx, 0
inf_loop:
    cmp cx, 320
    jge inf_done

    mov ah, 0Ch
    mov al, [marcoColor]
    int 10h

    inc cx
    jmp inf_loop
inf_done:


    ;---------------------------------------------------
    ; 3) Borde izquierdo (x = 0, y va 0..199)
    ;---------------------------------------------------
    mov cx, 0
    mov dx, 0
izq_loop:
    cmp dx, 200
    jge izq_done

    mov ah, 0Ch
    mov al, [marcoColor]
    int 10h

    inc dx
    jmp izq_loop
izq_done:


    ;---------------------------------------------------
    ; 4) Borde derecho (x = 319)
    ;---------------------------------------------------
    mov cx, 319
    mov dx, 0
der_loop:
    cmp dx, 200
    jge der_done

    mov ah, 0Ch
    mov al, [marcoColor]
    int 10h

    inc dx
    jmp der_loop
der_done:

    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_marco endp
draw_pattern proc
    push ax
    push bx
    push cx
    push dx

    ; Guardar colores en memoria (como la versión original)
    mov [color_par], al
    mov [color_impar], bl

    mov dx, 0           ; Y = 0

next_row:
    cmp dx, 200
    jge fin2

    mov cx, 0           ; X = 0

next_pixel:
    cmp cx, 320
    jge sig_row

    mov ax, cx
    add ax, dx
    and ax, 1

    cmp ax, 0
    je usar_par

    mov al, [color_impar]
    jmp dibujar2

usar_par:
    mov al, [color_par]

dibujar2:
    mov ah, 0Ch
    int 10h

    inc cx
    jmp next_pixel

sig_row:
    inc dx
    jmp next_row

fin2:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_pattern endp
draw_cuadricula proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; Guardar colores
    mov [fondoColor], al
    mov [lineaColor], bl
    mov si, cx        ; SI = tamaño celda

    ;--------------------------------------------------
    ; Paso 1: pintar fondo completo
    ;--------------------------------------------------
    mov dx, 0
fondo_rows:
    cmp dx, 200
    jge fondo_done

    mov cx, 0
fondo_cols:
    cmp cx, 320
    jge next_fondo_row

    mov ah, 0Ch
    mov al, [fondoColor]
    int 10h

    inc cx
    jmp fondo_cols

next_fondo_row:
    inc dx
    jmp fondo_rows

fondo_done:


    ;--------------------------------------------------
    ; Paso 2: dibujar líneas verticales cada SI píxeles
    ;--------------------------------------------------
    mov cx, 0          ; X = 0
vertical_loop:
    cmp cx, 320
    jge vertical_done

    mov dx, 0
vert_draw:
    cmp dx, 200
    jge vert_inc

    mov ah, 0Ch
    mov al, [lineaColor]
    int 10h

    inc dx
    jmp vert_draw

vert_inc:
    add cx, si         ; avanzar X por tamaño de celda
    jmp vertical_loop

vertical_done:


    ;--------------------------------------------------
    ; Paso 3: dibujar líneas horizontales cada SI píxeles
    ;--------------------------------------------------
    mov dx, 0
horizontal_loop:
    cmp dx, 200
    jge horizontal_done

    mov cx, 0
hori_draw:
    cmp cx, 320
    jge hori_inc

    mov ah, 0Ch
    mov al, [lineaColor]
    int 10h

    inc cx
    jmp hori_draw

hori_inc:
    add dx, si
    jmp horizontal_loop

horizontal_done:

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_cuadricula endp

draw_dotted_pattern proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; Guardar colores en memoria (opcional)
    mov [fondoColor], al
    mov [puntoColor], bl

    ; Convertir CL (byte) -> SI (word)
    xor ax, ax
    mov al, cl        ; AL = CL
    mov si, ax        ; SI = paso horizontal (16 bits)

    ; Convertir CH (byte) -> DI (word)
    xor ax, ax
    mov al, ch        ; AL = CH
    mov di, ax        ; DI = paso vertical (16 bits)

    ; seguridad: si paso == 0 -> poner 1 para evitar loop infinito
    cmp si, 0
    jne ok_h
    mov si, 1
ok_h:
    cmp di, 0
    jne ok_v
    mov di, 1
ok_v:

    ; -------------------------------------------------------
    ; 1) pintar fondo completo
    ; -------------------------------------------------------
    mov dx, 0
fondo_y:
    cmp dx, 200
    jge fondo_fin

    mov cx, 0
fondo_x:
    cmp cx, 320
    jge fondo_next_row

    mov ah, 0Ch
    mov al, [fondoColor]
    int 10h

    inc cx
    jmp fondo_x

fondo_next_row:
    inc dx
    jmp fondo_y

fondo_fin:

    ; -------------------------------------------------------
    ; 2) Dibujar puntos según la malla
    ; -------------------------------------------------------
    mov dx, 0            ; Y = 0

puntos_y:
    cmp dx, 200
    jge puntos_fin

    mov cx, 0            ; X = 0

puntos_x:
    cmp cx, 320
    jge puntos_next_row

    mov ah, 0Ch
    mov al, [puntoColor]
    int 10h              ; dibuja un punto

    add cx, si           ; <-- SI es paso horizontal (16-bit)
    jmp puntos_x

puntos_next_row:
    add dx, di           ; <-- DI es paso vertical (16-bit)
    jmp puntos_y

puntos_fin:

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
draw_dotted_pattern endp
end
