

	org     100h

	section .text

	mov     word [200h], "D"
	mov     word [201h], "C"
	mov     word [202h], "S"
	mov     word [203h], "M"

	mov	AX, [200h]
	mov	CX, [201h]
	mov	DI, [203h]
	mov	DX, [202h]

	int	20h