

	org     100h

	section .text

	mov     word [200h], "D"
	mov     word [201h], "C"
	mov     word [202h], "S"
	mov     word [203h], "M"

	;Direccionamiento Directo
	mov		AX, [200h]

	;Direccionamiento indirecto por registro
	mov		BX, 201h
	mov		CX, [BX]

	;Direccionamiento indirecto por base mas indice
	mov		BX, 203h
	mov		DI, [BX+SI]

	;Direccionamiento relativo por registro
	mov		DX, [SI+100h]

	int	20h