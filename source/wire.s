.include "data.s"
.include "utilities.s"

.globl generateVerticalCurrent
generateVerticalCurrent:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Interior cable vertical
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 333
	mov x2, 527
	mov x3, 1
	mov x4, 4
	loopVCurrent:
		bl createVRectangle
		add x3, x3, 1
		cmp x3, 39
		movz x7, 0x00ff, lsl 16
    	movk x7, 0x0000, lsl 0
        bl delay
		blt loopVCurrent
	
	ldr x30, [sp]
	add sp, sp, 8
	br x30

.globl generateCurveCurrent
generateCurveCurrent:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	movz x7, 0x00ff, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	//Interior cable cuadradito curva
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 371
	mov x2, 523
	mov x3,	4
	mov x4, 4
	bl createVRectangle

	movz x7, 0x00ff, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	ldr x30, [sp]
	add sp, sp, 8
	br x30

.globl generateHorizontalCurrent
generateHorizontalCurrent:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	movz x7, 0x00ff, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	//Interior cable horizontal
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 375
	mov x2, 522
	mov x3,	4
	mov x4, 115
	loopHCurrent:
		bl createVLine
		sub x4, x4, 1
		sub x2, x2, 1
		movz x7, 0x00f0, lsl 16
    	movk x7, 0x0000, lsl 0
        bl delay
		cbnz x4, loopHCurrent

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl generateCurrent
generateCurrent:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	bl generateVerticalCurrent
	bl generateCurveCurrent
	bl generateHorizontalCurrent

	ldr x30, [sp]
	add sp, sp, 8
	br x30


wire:
    // Input values:
		// - x0: Wire status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	cbnz x0, wireOnStatus
	sub sp, sp, 16
	str x0, [sp]

    //Interior cable vertical
	ldr x0, black
	mov x1, 328
	mov x2, 527
	mov x3,	43
	mov x4, 4
	bl createVRectangle

	//Interior cable cuadradito curva
	mov x1, 371
	mov x2, 523
	mov x3,	4
	bl createVRectangle

	//Interior cable horizontal
	mov x1, 375
	mov x2, 404
	mov x4, 119
	bl createVRectangle

    wireOnStatus:
    ldr x0, [sp]
	add sp, sp, 16
	cbz x0, doneWire
	sub sp, sp, 16
	str x0, [sp]

    //Interior cable vertical
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 328
	mov x2, 527
	mov x3,	43
	mov x4, 4
	bl createVRectangle

	//Interior cable cuadradito curva
	mov x1, 371
	mov x2, 523
	mov x3,	4
	bl createVRectangle

	//Interior cable horizontal
	mov x1, 375
	mov x2, 404
	mov x4, 119
	bl createVRectangle
    
    doneWire:
    ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createWire
createWire:
	// Input values:
		// - x0: Wire status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp, #8]
	str x0, [sp]

	ldr x0, black
	mov x1, 310
	mov x2, 523
	mov x3,	18
	mov x4, 12
	bl createVRectangle

	movz x0, 0x0042, lsl 16
	movk x0, 0x4242, lsl 0
	mov x1, 328
	mov x2, 526
	mov x3,	44
	mov x4, 6
	bl createVRectangle

	mov x1, 370
	mov x2, 522
	mov x3,	6
	bl createVRectangle

	mov x1, 374
	mov x2, 404
	mov x4, 120
	bl createVRectangle

    ldr x0, [sp]
    bl wire

	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30

.globl createOnWire
createOnWire:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	mov x0, 1
	bl createWire

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createOffWire
createOffWire:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	mov x0, 0
	bl createWire

	ldr x30, [sp]
	add sp, sp, 8
	br x30
