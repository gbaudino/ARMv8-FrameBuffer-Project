.include "data.s"
.include "utilities.s"

.globl glitchScreen
glitchScreen:
	//Guardado registros usados
	sub sp, sp, 16
	str x30, [sp, 8]
	str x1, [sp]


	ldr x0, black
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle
	ldr x0, pink_glitch_screen
	repeatGlitch:
		bl createHLine
		add x1, x1, 1
		bl createHLine
		add x1, x1, 3
		cmp x1, 189
		blt repeatGlitch
    sub x1, x1, 1
	bl createHLine

	
	ldr x1, [sp]
	ldr x30, [sp, 8]
	add sp, sp, 16
	br x30

.globl climber
climber:
    //Guardado registros usados
    sub sp, sp, 8
	str x30, [sp]
	
    // Input values:
		// - x1:	Altura inicial

	ldr x0, light_pink_donkey
	mov x2, 273
	mov x3,	5
	mov x4, 10
	bl createVRectangle

	add x1, x1, x3
	mov x3,	3
	mov x4, 8
	bl createVRectangle

	ldr x0, brown_donkey
	sub x1, x1, 3
	add x2, x2, 2
	mov x3,	3
	mov x4, 3
	bl createVRectangle

	sub x1, x1, 8
	add x2, x2, 15
	mov x3,	2
	mov x4, 13
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3,	6
	mov x4, 17
	bl createVRectangle

	ldr x0, light_pink_donkey
	add x1, x1, 3
	add x2, x2, x4
	mov x3,	5
	mov x4, 2
	bl createVRectangle

	add x1, x1, 3
	sub x2, x2, 17
	mov x3,	2
	mov x4, 17
	bl createVRectangle

	sub x1, x1, 3
	sub x2, x2, 2
	mov x3,	5
	mov x4, 2
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 2
	mov x3,	3
	mov x4, 3
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 7
	mov x3,	3
	mov x4, 3
	bl createVRectangle

	sub x1, x1, 2
	sub x2, x2, 7
	mov x3,	2
	mov x4, 7
	bl createVRectangle

	ldr x0, donkey_white
	add x1, x1, x3
	mov x3,	3
	mov x4, 7
	bl createVRectangle

	add x1, x1, x3
	sub x1, x1, 3
	sub x2, x2, 3
	mov x3,	2
	mov x4, 13
	bl createVRectangle

	ldr x0, black
	sub x1, x1, 1
	add x2, x2, 4
	mov x3,	3
	mov x4, 2
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 1
	mov x3,	3
	mov x4, 2
	bl createVRectangle

	ldr x0, brown_donkey
	add x1, x1, 2
	sub x2, x2, x4
	sub x2, x2, 12
	mov x3,	2
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3,	3
	mov x4, 7
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 5
	mov x3,	3
	mov x4, 7
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 5
	mov x3,	3
	mov x4, 2
	bl createVRectangle

	ldr x0, light_pink_donkey
	sub x2, x2, 5
	mov x3,	3
	mov x4, 5
	bl createVRectangle

	sub x2, x2, 12
	mov x3,	3
	mov x4, 5
	bl createVRectangle

	ldr x0, brown_donkey
	add x1, x1, x3
	sub x2, x2, 9
	mov x3,	2
	mov x4, 4
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 5
	mov x3,	2
	mov x4, 5
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 7
	mov x3,	2
	mov x4, 5
	bl createVRectangle

	ldr x0, light_pink_donkey
	add x2, x2, x4
	mov x3,	2 
	mov x4, 4 //revisar
	bl createVRectangle

	sub x2, x2, 12
	mov x3,	2
	mov x4, 7
	bl createVRectangle

	sub x2, x2, 10
	mov x3,	2
	mov x4, 5
	bl createVRectangle

	add x1, x1, x3
	mov x3,	6       //big rectangle
	mov x4, 26
	bl createVRectangle

	ldr x0, brown_donkey

	add x2, x2, 3
	mov x3,	3
	mov x4, 2
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 17
	mov x3,	3
	mov x4, 2
	bl createVRectangle

	add x1, x1, 1
	add x2, x2, x4
	add x2, x2, 2
	mov x3,	7
	mov x4, 2
	bl createVRectangle

	add x1, x1, 5
	sub x2, x2, 2
	mov x3,	4
	mov x4, 2
	bl createVRectangle

	sub x2, x2, x4
	sub x2, x2, 24
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 3
	mov x3,	2
	mov x4, 30
	bl createVRectangle

	add x1, x1, x3
	mov x3,	3
	mov x4, 28     
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 3
	mov x3,	2
	mov x4, 25
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 6
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 2
	mov x3,	2
	mov x4, 19
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 4
	mov x3,	3
	mov x4, 23
	bl createVRectangle

	add x1, x1, x3
	mov x3,	3
	mov x4, 21
	bl createVRectangle

	add x1, x1, x3
	add x2, x2, 2
	mov x3,	2
	mov x4, 5
	bl createVRectangle

	ldr x0, light_pink_donkey
	sub x2, x2, 2
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	sub x1, x1, 8
	sub x2, x2, 2
	mov x3,	8
	mov x4, 2
	bl createVRectangle

	add x2, x2, x4
	add x2, x2, 14
	mov x3,	2
	mov x4, 5
	bl createVRectangle

	sub x1, x1, x3
	sub x2, x2, 2
	mov x3,	2
	mov x4, 2
	bl createVRectangle

	sub x1, x1, 5
	sub x2, x2, 10
	mov x3,	2
	mov x4, 7
	bl createVRectangle

	sub x1, x1, 5
	mov x3,	5
	mov x4, 10
	bl createVRectangle

	add x1, x1, 3
	add x2, x2, x4
	add x2, x2, 4
	mov x3,	2
	mov x4, 23
	bl createVRectangle

	ldr x0, brown_donkey
	sub x1, x1, 1
	sub x2, x2, 10
	mov x3,	3
	mov x4, 3
	bl createVRectangle

	ldr x0, donkey_white
	add x1, x1, x3
	add x1, x1, 2
	add x2, x2, 31
	mov x3,	3
	mov x4, 3
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 7
	mov x3,	2
	mov x4, 10
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 8
	mov x3,	1
	mov x4, 18
	bl createVRectangle

	add x1, x1, x3
	mov x3,	2
	mov x4, 16
	bl createVRectangle

	add x1, x1, x3
	mov x3,	2
	mov x4, 14
	bl createVRectangle

	add x1, x1, x3
	sub x2, x2, 2
	mov x3,	1
	mov x4, 16
	bl createVRectangle

	add x1, x1, x3
	mov x3,	2
	mov x4, 13
	bl createVRectangle

	add x1, x1, x3
	mov x3,	2
	mov x4, 8
	bl createVRectangle

    ldr x30, [sp]
    add sp, sp, 8
    br x30

.globl climbingPalm
climbingPalm:
    //Guardado registros usados
    sub sp, sp, 8
	str x30, [sp]

    bl resetScreen

    ldr x0, cream_palm
    mov x1, 89
	mov x2, 275
	mov x3,	100
	mov x4, 3
	bl createVRectangle

    ldr x0, light_brown_palm
	add x2, x2, 2
	bl createVRectangle

    ldr x30, [sp]
    add sp, sp, 8
    br x30
