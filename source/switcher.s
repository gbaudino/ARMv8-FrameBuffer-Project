.include "data.s"
.include "utilities.s"

switcher:
	// Input values:
		// - x0: Light Key Status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp, #8]
	str x0, [sp]

	cbnz x0, switcherOnStatus

	ldr x0, black
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	movz x0, 0x00d5, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 147
	bl createVRectangle

	switcherOnStatus:
	ldr x0, [sp]
	cbz x0, doneSwitcher

	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	ldr x0, black
	mov x1, 147
	bl createVRectangle

	doneSwitcher:
	ldr x0, [sp]
	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30


.globl createSwitcher
createSwitcher:
	// Input values:
		// - x0: Switcher status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp, #8]
	str x0, [sp]
	
	ldr x0, black
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

	ldr x0, black
	mov x1, 120
	mov x2, 103
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	mov x1, 166
	bl createVRectangle
	
	movz x0, 0x0061, lsl 16
	movk x0, 0x6161, lsl 0
	mov x1, 141
	mov x2, 98
	mov x3,	6
	mov x4, 12
	bl createVRectangle

	ldr x0, [sp]
	add sp, sp, 8
	bl switcher
	
	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createOnSwitcher
createOnSwitcher:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	mov x0, 1
	bl createSwitcher

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createOffSwitcher
createOffSwitcher:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	mov x0, 0
	bl createSwitcher

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl breakSwitcher
breakSwitcher:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	bl saveTempValues

	mov x9, 3
	movz x7, 0x100, lsl 16
	movk x7, 0x0000, lsl 0

	repeatBreak:
		bl createOffSwitcher
		movz x7, 0xA00, lsl 16
		movk x7, 0x0000, lsl 0
		bl delay

		bl createOnSwitcher
		movz x7, 0xA00, lsl 16
		movk x7, 0x0000, lsl 0
		bl delay
		
		sub x9, x9, 1
		cbnz x9, repeatBreak

	ldr x0, black
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createVRectangle

	bl loadTempValues

	ldr x30, [sp]
	add sp, sp, 8
	br x30
