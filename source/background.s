.globl createBackground
createBackground:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	//Pared
	movz x0, 0x005f, lsl 16
	movk x0, 0x4d84, lsl 0
	mov x1, 0
	mov x2, 0
	mov x3, 397
	mov x4, x21
	bl createVRectangle

	//Suelo
	movz x0, 0x0079, lsl 16
	movk x0, 0x5548, lsl 0
	mov x1, 397
	mov x2, 0
	mov x3, 83
	mov x4, x21
	bl createVRectangle

	//Cueva raton
	movz x0, 0x0022, lsl 16
	movk x0, 0x2222, lsl 0
	mov x5, 0
	bl createCuevaRaton

	//Cueva raton
	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x5, 2
	bl createCuevaRaton
   	bl createRatonEyes

    //Enchufe Maquina
    movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbb, lsl 0
	mov x1, 310
	mov x2, 585
	mov x3,	18
	mov x4, 27
	bl createVRectangle

	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbb, lsl 0
	mov x1, 306
	mov x2, 589
	mov x3,	26
	mov x4, 19
	bl createVRectangle

   	mov x0, 0
    bl createOffSwitcher
    
    bl createPoster

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret
