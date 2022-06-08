.globl lightSwitcher
lightSwitcher:
	// Input values:
		// - x0: Light Key Status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
	//Guardado registro x0
	sub sp, sp, 16
	str x0, [sp]
	
	ldr x0, [sp]
	add sp, sp, 16
	cbnz x0, onStatus
	sub sp, sp, 16
	str x0, [sp]

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	movz x0, 0x00d5, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 147
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	onStatus:
	ldr x0, [sp]
	add sp, sp, 16
	cbz x0, doneLightKey
	sub sp, sp, 16
	str x0, [sp]

	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 147
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	doneLightKey:
	ldr x30, [sp]
	add sp, sp, 16
	ret


lineaNegra:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	// - x5: 	Variación Y

	
    movz x0, 0x0000, lsl 16
    movk x0, 0x0000, lsl 0
    mov x1, 384
    add x1, x1, x5
    mov x2, 124
    mov x3, 1
    mov x4, 3
    bl createVRectangle

    movz x0, 0x0000, lsl 16
    movk x0, 0x0000, lsl 0
    mov x1, 384
    add x1, x1, x5
    mov x2, 129
    mov x3, 1
    mov x4, 3
    bl createVRectangle

    movz x7, 0x00fe, lsl 16
    movk x7, 0x0000, lsl 0
    bl delay

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl parpadeoRaton
parpadeoRaton:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
    mov x5,0
	repParpadeo:
        bl lineaNegra
        movz x7, 0x00fa, lsl 16
        movk x7, 0x0000, lsl 0
        bl delay
        add x5 , x5, 1
        cmp x5, 4
        bne repParpadeo
    
    movz x7, 0x00ff, lsl 16
    movk x7, 0xf000, lsl 0
    bl delay
	
    bl createRatonEyes

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl generateCurrent
generateCurrent:
	