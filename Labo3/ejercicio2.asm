
        org 100h

        section .text

        MOV CL, 5d ;asignamos el valor del factorial
        MOV AH, 00 ;registro acumulado
        MOV AL, 01 ;acumulador
        CMP CL, 00 ;comparacion si cl  ha llegado a 0, si es asi, guarda el resultado
        jz result
factorial:
        MUL CX ;realiza la multiplicacion
        LOOP factorial ; realiza el loop para el factorial
result: 
        MOV [20Bh],AL ;guarda en 20bh, el dato guardado en el acumulador


        int 20h