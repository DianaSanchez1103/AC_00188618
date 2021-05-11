
        org     100h

        section .text

        XOR DI, DI ;Limpiamos DI, que sirve para guardar el dato de cada celda del array
        XOR SI, SI ;Limpiamos SI, que sirve para ir avanzanado en el array
        MOV CX, 8d ;Creamos un loop, que llegara hasta 8
        JMP interar ;entramos a interar

interar:
        MOV DI, [carnet+SI] ;Asignamos a DI, el valor en la posicion SI de carnet
        ADD [20Ah], DI ;sumanos lo quee esta n 20ah, con lo que esta en di
        INC SI ; avanzamos un espacion en el carnet
        LOOP interar ;iniciamos el loop

exit:

        MOV AX, [20Ah] ;asignamos la suma final que estan en 20ah a ax, que es el dividendo
        MOV BX, 8d ;asignamos el valor a dividir
        DIV BX ; hacemos la division
        MOV [20Ah],AL ;el cociente, encontrado en al, lo asignamos en 20ah

        int 20h

section .data
carnet db 0,0,1,8,8,6,1,8 ; array del carnet