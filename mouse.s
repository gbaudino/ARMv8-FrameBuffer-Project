.globl createRatonEyes
createRatonEyes:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp] 

	movz x0, 0xdddd, lsl 16
	movk x0, 0xdddd, lsl 0
	mov x1, 384
	mov x2, 124
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	movz x0, 0x00ec, lsl 16
	movk x0, 0x4738, lsl 0
	mov x1, 386
	mov x2, 125
	mov x3, 2
	mov x4, 2
	bl createVRectangle

	movz x0, 0xdddd, lsl 16
	movk x0, 0xdddd, lsl 0
	mov x1, 384
	mov x2, 129
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	movz x0, 0x00ec, lsl 16
	movk x0, 0x4738, lsl 0
	mov x1, 386
	mov x2, 130
	mov x3, 2
	mov x4, 2
	bl createVRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

.globl createCuevaRaton
createCuevaRaton:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	// - x0: 	Color of Base
	// - x5:	Variacion tamano

	mov x1, 379
	mov x2, 120
	add x2, x2, x5
	mov x3, 18
	sub x3, x3, x5
	mov x4, 16
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 378
	mov x2, 121
	add x2, x2, x5
	mov x3, 1
	mov x4, 14
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 377
	mov x2, 122
	add x2, x2, x5
	mov x3, 1
	mov x4, 12
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 376
	mov x2, 123
	add x2, x2, x5
	mov x3, 1
	mov x4, 10
	sub x4, x4, x5
	bl createVRectangle
	
	mov x1, 375
	mov x2, 124
	add x2, x2, x5
	mov x3, 1
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret
