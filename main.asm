.8086
.model small
.stack 100h

.data
    
    CADENA DB "2000 >>>>>>",0dh,0ah,24h
    CADENA2 DB "BOCA JUNIORS 200",0dh,0ah,24h

    char_color db 15
    texto_anim db "HOLA$"


    

.code
; IMPORTAMOS LA FUNCIÓN
extrn draw_char:proc
extrn draw_pattern:proc
extrn draw_text:proc
extrn draw_cuadricula:proc
extrn draw_dotted_pattern:proc
extrn draw_marco:proc
extrn draw_marco_offset:proc
extrn animar_texto_lr:proc


main proc
    mov ax, @data
    mov ds, ax

    ; --- Modo gráfico 320x200x256
    mov ah, 00h
    mov al, 13h
    int 10h
;------------------------------------------------------------------------------------------
    jmp draw_dotted_pattern_ ;saltar a la etiqueta de la funcion preferida para la visualizacion
;_--------------------------------------------------------------------------------------------
draw_pattern_:
    mov al, 1      ; color para cuadros pares
    mov bl, 0     ; color para cuadros impares
    call draw_pattern
    jmp finpatron
draw_cuadricula_:
    mov al, 15    ; blanco (fondo)
    mov bl, 14     ; azul claro (líneas)
    mov cl, 4     ; tamaño de cuadrícula
    call draw_cuadricula
    jmp finpatron

draw_dotted_pattern_:
    mov al, 15    ; fondo negro
    mov bl, 15   ; puntos gris claro
    mov cl, 6    ; separación horizontal
    mov ch, 6    ; separación vertical
    call draw_dotted_pattern
    jmp finpatron
draw_marco_:
    mov al, 14         ; rojo claro
    call draw_marco
    jmp finpatron

draw_marco_offset_:
    mov al, 14      ; amarillo
    mov bx, 10      ; distancia al borde
    mov cx, 300     ; ancho max 319
    mov dx, 180     ; alto
    call draw_marco_offset
    jmp finpatron


    ; Dibujar letra A en (100, 50)
    ;Entrada:
    ;AL = carácter ('A','E','I','O','U' mayúsculas)
    ;CX = pos X
    ;DX = pos Y
finpatron:
           ; color amarillo
   ; mov byte ptr [char_color], 12   ; rojo
    ;mov dx, 100                     ; Y = 100
    ;call animar_texto_lr
    
 ;   mov cx, 320 ; cx=pos x
  ;  mov dx, 320
   ; mov al, '0'
    ;call draw_char

    ;_-
    ;


    mov al, 1        ; rojo claro
    call draw_marco
     

    mov al, 1      ; amarillo
    mov bx, 9      ; distancia al borde
    mov cx, 300     ; ancho max 319
    mov dx, 180     ; alto
    call draw_marco_offset




    
    

    mov cx, 70  ; X
    mov dx, 96     ; Y
    mov si,offset cadena  
    call draw_text



   

  


    

    ; Esperar tecla
    mov ah, 00h
    int 16h
    
    ; Volver a texto
    mov ah, 00h
    mov al, 03h
    int 10h

    
    mov ax,4C00h
    int 21h
main endp

end main
