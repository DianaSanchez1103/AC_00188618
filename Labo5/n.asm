org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 10h
    MOV DI, 1d
    MOV CX, 4d
    
    call modotexto
    call movercursor
    call escribircaracter
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado, 03h denota un tamaño de 80x25 (80 columnas, 25 filas)
        INT 10h
        RET

    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 8 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET

    escribircaracter: ;utilizando interrupcion DOS
        MOV AH, 09h
        CMP DI, 1d
        JE cade1
        CMP DI, 2d
        JE cade2
        CMP DI, 3d
        JE cade3
        CMP DI, 4d
        JE cade4
        LOOP escribircaracter
        RET

     cade1:
        ; escribe cadena en pantalla según posición del cursor
        MOV DX, cadena1 ; cadena que vamos a imprimir, debe ir sin corchetes
        INC DI
        INT 21h
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        JMP escribircaracter

     cade2:
        ; escribe cadena en pantalla según posición del cursor
        MOV DX, cadena2 ; cadena que vamos a imprimir, debe ir sin corchetes
        INC DI
        INT 21h
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 12 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        JMP escribircaracter

    cade3:
        ; escribe cadena en pantalla según posición del cursor
        MOV DX, cadena3 ; cadena que vamos a imprimir, debe ir sin corchetes
        INC DI
        INT 21h
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 14 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        JMP escribircaracter

    cade4:
        ; escribe cadena en pantalla según posición del cursor
        MOV DX, cadena4 ; cadena que vamos a imprimir, debe ir sin corchetes
        INC DI
        INT 21h
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 16 ;fila en la que se mostrará el cursor
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        JMP escribircaracter

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret
    exit:
        int 20h

    section .data

    cadena1 DB 'Diana$'
    cadena2 DB 'Cristina$'
    cadena3 DB 'Sanchez$'
    cadena4 DB 'Munoz$'
