.include "data.s"
.include "utilities.s"

.globl glitchScreen
glitchScreen:
	//Guardado registros usados
	sub sp, sp, 16
	str x30, [sp, 8]
	str x1, [sp]

	bl saveTempValues

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

	bl loadTempValues
	
	ldr x1, [sp]
	ldr x30, [sp, 8]
	add sp, sp, 16
	br x30

climber:
    //Guardado registros usados
    sub sp, sp, 8
	str x30, [sp]

    // Input values:
		// - x1:	Altura inicial



    ldr x30, [sp]
    add sp, sp, 8
    br x30

.globl climbingDonkey
climbingDonkey:
    //Guardado registros usados
    sub sp, sp, 16
	str x30, [sp, 8]
	str x7, [sp]

    bl resetScreen

    ldr x0, cream_palm
    mov x1, 89
	mov x2, 275
	mov x3,	100
	mov x4, 2
	bl createVRectangle

    ldr x0, light_brown_palm
	add x2, x2, 2
	bl createVRectangle
	
	/*
    mov x1, 75
    mov x2, 25
    bl randomNumberBetween
    */
	mov x7, 40
	mov x1, 189
	sub x1, x1, x7
	bl climber


	ldr x7, [sp]
    ldr x30, [sp, 8]
    add sp, sp, 16
    br x30
