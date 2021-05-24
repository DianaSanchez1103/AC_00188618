

        org 100h

        section .text

        XOR SI, SI ; contador auxiliar para recorrer el arreglo
        XOR DI, DI ;COntador para las posiciones de los pares
        XOR BP, BP ;COntador para las posiciones de los impares
        MOV BX, 2d ;Dato divisor, ayuda para el modulo

        CALL while ;Llamando a la funcion

        int 20h

while: 
        MOV byte AL, [array+SI] ;Agregamos a AL(dividendo) el dato en una posicion del arreglo
        cmp AL, 0xA ;comparamos que no lleguee al final del arreglo
        je end ;salto para cuando este en el ultimo dato del arreglo

        DIV BX ;realizando division

        cmp DX, 0d ; comparando si tiene residuo 0
        je par ;salto para la funcion par

        cmp DX, 1d ;comparando si tiene residuo 1
        je impar ;salto para la funcion impar

end: 
        RET ;regresa al main

par:
        MOV CX, [array+SI];agrega el dato en la posicion indicada del arreglo
        MOV [300h+DI], CX ;agregando el valor del arreglo en la posicion 300h+un valor
        INC DI ;DI++
        INC SI ;SI++
        JMP while ;regresamos a la funcion principal
        
impar:
        MOV CX, [array+SI] ;agrega el dato en la posicion indicada del arreglo
        MOV [320h+BP], CX ;agregando el valor del arreglo en la posicion 300h+un valor
        INC BP ;BP++
        INC SI ;SI++
        JMP while ;regresamos a la funcion principal

        section .data
        ;ARREGLO DE NUMEROS
        array db 5,7,3,8,5,1,4,2,9,6,0xA