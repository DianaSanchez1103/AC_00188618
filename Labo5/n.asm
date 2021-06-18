org 100h

    section .text

    MOV SI, 10h
    MOV DI, 0d
    MOV CX, 4d
    
    call modotexto
    call movercursor
    call escribircaracter
    call esperartecla
    call exit

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET

    movercursor:
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DH, 10  ; fila en la que se mostrará el cursor
        MOV DL, 20 ; columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        RET

    escribircaracter: 
        MOV AH, 09h
        INC DI ; incremento de DI
        CMP DI, 1d ;Compara si DI(contador el ciclo el cual llega hasta 4(los 4 nombres)) es 1
        JE cade1
        CMP DI, 2d ;Compara si DI es 2
        JE cade2
        CMP DI, 3d ;Compara si DI es 3
        JE cade3
        CMP DI, 4d ;Compara si DI es 4
        JE cade4
        LOOP escribircaracter ;Salta a la funcion escribir caracter
        RET

    cade1:
        MOV DX, cadena1 ; cadena que vamos a imprimir
        INT 21h
        MOV DH, 12 ;Fila en la cual se ubica el texto
        JMP incremento

    cade2:
        MOV DX, cadena2 ; cadena que vamos a imprimir
        INT 21h
        MOV DH, 14 ;Fila en la cual se ubica el texto
        JMP incremento

    cade3:
        MOV DX, cadena3 ; cadena que vamos a imprimir
        INT 21h
        MOV DH, 16 ;Fila en la cual se ubica el texto
        JMP incremento

    cade4:
        MOV DX, cadena4 ; cadena que vamos a imprimir
        INT 21h
        MOV DH, 18 ;Fila en la cual se ubica el texto
        JMP incremento

    esperartecla:
        MOV AH, 00h ; espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h

        ret

    incremento: ;funcion para ubicar en la columna adecadua cada cadena de texto
        MOV AH, 02h ; posiciona el cursor en pantalla.
        MOV DL, 20 ;columna en la que se mostrará el cursor
        MOV BH, 0h ; número de página
        INT 10h
        JMP escribircaracter


    exit:
        int 20h

    section .data

    cadena1 DB 'Diana$' ;Primer nombre
    cadena2 DB 'Cristina$' ;Segundo nombre
    cadena3 DB 'Sanchez$' ;Primero apellido
    cadena4 DB 'Munoz$' ;Segundo apellido
