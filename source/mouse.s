.include "data.s"
.include "utilities.s"

.globl createCuevaRaton
createCuevaRaton:
	//Guardado registro return
	sub sp, sp, 8
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
	add sp, sp, 8
	br x30


.globl createRatonEyes
createRatonEyes:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp] 

	movz x0, 0xdddd, lsl 16
	movk x0, 0xdddd, lsl 0
	mov x1, 384
	mov x2, 124
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	mov x2, 129
	bl createVRectangle

	ldr x0, frequent_red
	mov x1, 386
	mov x2, 125
	mov x3, 2
	mov x4, 2
	bl createVRectangle

	mov x2, 130
	bl createVRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl genParpadoRaton
genParpadoRaton:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
	// - x5: 	Variación Y
	
    ldr x0, black
    mov x1, 384
    add x1, x1, x5
    mov x2, 124
    mov x4, 3
    bl createHLine


    mov x2, 129
    bl createHLine

    movz x7, 0x00ff, lsl 16
    movk x7, 0xf000, lsl 0
    bl delay

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl parpadeoRaton
parpadeoRaton:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
    mov x5,0
	repParpadeo:
        bl genParpadoRaton
        movz x7, 0x00fa, lsl 16
        movk x7, 0x0000, lsl 0
        bl delay
        add x5 , x5, 1
        cmp x5, 4
        bne repParpadeo
    
    movz x7, 0x00ff, lsl 16
    movk x7, 0xff00, lsl 0
    bl delay
	
    bl createRatonEyes

	movz x7, 0x0fff, lsl 16
    movk x7, 0xf000, lsl 0
    bl delay

	ldr x30, [sp]
	add sp, sp, 8
	br x30
