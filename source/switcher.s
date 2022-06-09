switcher:
	// Input values:
		// - x0: Light Key Status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
	cbnz x0, switcherOnStatus
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

	switcherOnStatus:
	ldr x0, [sp]
	add sp, sp, 16
	cbz x0, doneSwitcher
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

	doneSwitcher:
	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createSwitcher
createSwitcher:
	// Input values:
		// - x0: Switcher status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
	//Guardado registro x0
	sub sp, sp, 16
	str x0, [sp]
	

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 117
	mov x2, 86
	mov x3,	54
	mov x4, 35
	bl createVRectangle

	movz x0, 0x00c9, lsl 16
	movk x0, 0xd7da, lsl 0
	mov x1, 118
	mov x2, 87
	mov x3,	52
	mov x4, 33
	bl createVRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 120
	mov x2, 103
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 166
	mov x2, 103
	mov x3,	2
	mov x4, 2
	bl createVRectangle
	
	movz x0, 0x0061, lsl 16
	movk x0, 0x6161, lsl 0
	mov x1, 141
	mov x2, 98
	mov x3,	6
	mov x4, 12
	bl createVRectangle

	ldr x0, [sp]
	add sp, sp, 16
	bl switcher
	
	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createOnSwitcher
createOnSwitcher:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	mov x0, 1
	bl createSwitcher

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createOffSwitcher
createOffSwitcher:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	mov x0, 0
	bl createSwitcher

	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl breakSwitcher
breakSwitcher:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret
