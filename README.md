# PROYECTOASSEMBLY-SPD; PARÁMETROS DE ENTRADA:



mov ah, 01h          ; Servicio de dibujar texto
mov bl, color        ; Color del texto (0-15)
mov cx, pos_x        ; Coordenada X (0-319)
mov dx, pos_y        ; Coordenada Y (0-199)  
mov si, offset texto ; Puntero a cadena terminada en '$'
int 60h              ; Llamar al servicio

; EJEMPLO:
mov ah, 01h
mov bl, 14           ; Amarillo
mov cx, 100          ; X = 100
mov dx, 50           ; Y = 50
mov si, offset mensaje
int 60h
