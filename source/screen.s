.globl resetScreen
resetScreen:
    //Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

    //Creacion parte del vidrio (Verde oscuro)
	movz x0, 0x0000, lsl 16
	movk x0, 0x1a0d, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

    ldr x30, [sp]
	add sp, sp, 16
	ret


.globl powerOffScreen
powerOffScreen:
    //Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

    //Creacion parte del vidrio
	movz x0, 0x0000, lsl 16
	movk x0, 0x1a0d, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	//Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 101
    mov x2, 258
    mov x3,    36
    mov x4, 36
    bl createVRectangle

    //Creacion triangulo reflejo del vidrio
    movz x0, 0x0000, lsl 16
    movk x0, 0x1a0d, lsl 0
    mov x1, 125
    mov x2, 270
    mov x3, 12
    mov x4, 48
    mov x5, 0
    mov x6, 12
    mov x7, 2
    bl createTriangle

    //Creacion reflejo del vidrio
    movz x0, 0x0000, lsl 16
    movk x0, 0x542a, lsl 0 
    mov x1, 101
    mov x2, 258
    mov x3,    10
    mov x4, 10
    bl createVRectangle

    //Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 166
    mov x2, 260
    mov x3,    12
    mov x4, 88
    bl createVRectangle

    //Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 154
    mov x2, 348
    mov x3,    24
    mov x4, 24
    bl createVRectangle

    //Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 115
    mov x2, 360
    mov x3,    39
    mov x4, 12
    bl createVRectangle
	
    ldr x30, [sp]
	add sp, sp, 16
	ret


screenPowerEffect:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion parte del vidrio(Blanco)
	movz x0, 0x00ff, lsl 16
	movk x0, 0xffff, lsl 0
	mov x1, 129
	mov x2, 301
	mov x3,	20
	mov x4, 27
	loopPowerOnScreen:
		bl createVRectangle
		sub x1, x1, 3
		sub x2, x2, 4
		add x3, x3, 6
		add x4, x4, 8
		cmp x1, 89
		movz x7, 0x00ff, lsl 16
        movk x7, 0xffff, lsl 0
        bl delay
		bgt loopPowerOnScreen

	//Creacion parte del vidrio (Blanco)
	movz x0, 0x00ff, lsl 16
	movk x0, 0xffff, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl powerOnScreen
powerOnScreen:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	bl resetScreen

	movz x7, 0x0100, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	bl screenPowerEffect

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl transitionToTheGame
transitionToTheGame:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Guardado registro x9
	sub sp, sp, 16
	str x9, [sp]

	//Temporary values
		// - x9:	Temp const for the substraction

	movz x9, 0x0011, lsl 16
	movk x9, 0x1111, lsl 0

	//Creacion parte del vidrio (Blanco)
	movz x0, 0x00ff, lsl 16
	movk x0, 0xffff, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	transitionate:
		bl createVRectangle
		movz x7, 0x0100, lsl 16
		movk x7, 0x0000, lsl 0
		bl delay
		sub x0, x0, x9
		cmp x0, 0x000000
		bge transitionate

	movz x7, 0x00ff, lsl 16
	movk x7, 0xff00, lsl 0
	bl delay

	ldr x9, [sp]
	add sp, sp, 16

	ldr x30, [sp]
	add sp, sp, 16
	ret
