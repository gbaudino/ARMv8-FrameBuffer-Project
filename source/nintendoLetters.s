.include "utilities.s"

createMayusNLetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	// Input values:
	// - x0: 	Color of Base
	// - x1:	y base
	// - x2:	x base

	mov x1, 33
	mov x2, 256
	mov x3, 17
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	mov x3, 5
	mov x4, 2
	bl createVRectangle

	add x1, x1, x3
	sub x1, x1, 1
	add x2, x2, 2
	mov x3, 5
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x1, x1, 1
	add x2, x2, 3
	mov x3, 5
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x1, x1, 1
	add x2, x2, 3
	mov x3, 5
	mov x4, 3
	bl createVRectangle

	sub x1, x1, 12
	add x2, x2, x4
	mov x3, 17
	mov x4, 4
	bl createVRectangle
	
	ldr x30, [sp]
	add sp, sp, 8
	br x30

createILetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	add x2, x2, x4
	add x2, x2, 4
	mov x3, 3
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	add x1, x1, 2
	mov x3, 12
	mov x4, 4
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createNLetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	mov x3, 12
	mov x4, 4
	bl createVRectangle

	add x1, x1, 2
	add x2, x2, x4
	mov x3, 2
	mov x4, 2
	bl createVRectangle

	sub x1, x1, x3
	add x2, x2, x4
	mov x3, 2
	mov x4, 6
	bl createVRectangle

	add x1, x1, x3
	add x2, x2, 3
	mov x3, 10
	mov x4, 4
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createTLetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	sub x1,x1, 7
	add x2, x2, x4
	add x2, x2, 4
	mov x3, 17
	mov x4, 4
	bl createVRectangle
	
	add x1, x1, 2
	sub x2, x2, 3
	mov x3, 2
	mov x4, 10
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30

createELetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	add x1, x1, x3
	add x1, x1, 1
	add x2, x2, x4
	add x2, x2, 5
	mov x3, 1
	mov x4, 5
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 1
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 3
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 5
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 5
	mov x3, 2
	mov x4, 13
	bl createVRectangle

	add x1, x1, x3
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	add x2, x2, 1
	mov x3, 1
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 4
	mov x3, 1
	mov x4, 4
	bl createVRectangle

	sub x1, x1, x3
	add x2, x2, 1
	mov x3, 1
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 4
	mov x3, 3
	mov x4, 8
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createDLetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	sub x1, x1, 2
	add x2, x2, 10
	mov x3, 2
	mov x4, 6
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 1
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	add x2, x2, 1
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	add x2, x2, 2
	mov x3, 2
	mov x4, 6
	bl createVRectangle

	sub x1, x1, 15
	add x2, x2, x4
	mov x3, 17
	mov x4, 4
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30

	
createOLetterLogo:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
	add x1, x1, 5
	add x2, x2, x4
	add x2, x2, 5
	mov x3, 2
	mov x4, 8
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 4
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 4
	mov x3, 2
	mov x4, 3
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 6
	mov x3, 2
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 6
	mov x3, 2
	mov x4, 3
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 6
	mov x3, 2
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 6
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 4
	mov x3, 2
	mov x4, 4
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, x4
	sub x2, x2, 2
	mov x3, 2
	mov x4, 8
	bl createVRectangle

	
	ldr x30, [sp]
	add sp, sp, 8
	br x30


