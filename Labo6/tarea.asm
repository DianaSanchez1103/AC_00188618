	org 	100h

	;Datos

	section	.data

	msg1	db	"Ingresa una frase: ", "$" ;frase que saldra para pedir el texto
	msg2 	db 	"Bienvenido","$" ;frase de exito
	msg3	db	"Incorrecto","$" ;frase de fracaso
	clave	db  "diana","$" ;contrase;a
	frase 	times 	20  	db	" " ;donde guardaremos la frase	



	section	.text

	mov 	DX, msg1	;mover a la direccion DX, lo que esta en msg1(solo es un mensaje para que se vea mas estetico)
	call  	EscribirCadena ;llama a escribir cadena, para imprimir lo que se encuentra en dx

	mov 	BP, frase ;mueve a BP(registro donde se guardara la frase que se ingrese) lo que esta en este momento en frase
	call  	LeerCadena ;llama a la funcion escribir cadena

	MOV DI,	0 ;ponemos en DI un contador para ir avanzando palabra por palabra
	MOV CX, 5d ;agregamos a cx un 5, para que repita el ciclo de comparar
	jmp	comparar ;saltamos a comparar

	call	EsperarTecla ;para que termine el programa cuando ingresemos una tecla

	int 	20h

;FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

; Leer cadena de texto desde el teclado
LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret

; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Escribe lo que esta en DX
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret

;Funcion que se va a imprimir "Incorrecto" cuando no coincida algun caracter
noigual:
	mov 	DX, msg3
	jmp EscribirCadena

;Funcion que va a imprimir "Bienvenido" cuando llegue al ultimo lugar
igual:
	mov 	DX, msg2
	jmp EscribirCadena

comparar:
	MOV BL, [clave+DI] ;guardamos la posicion que indica DI de clave, en BL
	MOV CL, [frase+DI] ;guardamos la posicion que indica DI de frase, en BL
	INC DI ;Incrementamos DI para ir avanzando en cada frase
	cmp BL, CL ;compramos si los caracteres no son iguales, para llamar a noigual
	JNE noigual

	;comparamos si la posicion es 5d, ya que es la ultima posicion
	;esto pasa ya que si es la ultima y anterior a esta comparacion se comprueba 
	;si no es igual el ultimo caracter, entonces son iguales
	cmp DI, 5d
	JE igual
	;Para respetir el ciclo
	LOOP comparar
