
.include "utilities.s"

resetScreen:
    //Guardado registro return
	sub sp, sp, 8
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
	add sp, sp, 8
	br x30


.globl powerOffScreen
powerOffScreen:
    //Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

    bl resetScreen

	//Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 101
    mov x2, 258
    mov x3, 36
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
    mov x3, 10
    mov x4, 10
    bl createVRectangle

    //Creacion reflejo del vidrio
    movz x0, 0x0001, lsl 16
    movk x0, 0x2413, lsl 0
    mov x1, 166
    mov x2, 260
    mov x3, 12
    mov x4, 88
    bl createVRectangle

    mov x1, 154
    mov x2, 348
    mov x3, 24
    mov x4, 24
    bl createVRectangle

    mov x1, 115
    mov x2, 360
    mov x3, 39
    mov x4, 12
    bl createVRectangle
	
    ldr x30, [sp]
	add sp, sp, 8
	br x30


screenExpansion:
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
	    // - x0: Color of background
		// - x1: First Y coord for expansion
		// - x2: First X coord for expansion
		// - x3: First height for expansion
		// - x4: First width for expansion
		// - x5: Expansion limit - Factor of 3

	loopScreenExpansion:
		bl createVRectangle
		sub x1, x1, 3
		sub x2, x2, 4
		add x3, x3, 6
		add x4, x4, 8
		cmp x1, x5

		movz x7, 0x0100, lsl 16
        movk x7, 0x0000, lsl 0
        
		bl delay
		bgt loopScreenExpansion


	ldr x30, [sp]
	add sp, sp, 8
	br x30


powerOnEffect:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	movz x0, 0x00ff, lsl 16
	movk x0, 0xffff, lsl 0
	mov x1, 129
	mov x2, 301
	mov x3,	20
	mov x4, 27
	mov x5, 89
	bl screenExpansion

	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl powerOnScreen
powerOnScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	bl resetScreen

	movz x7, 0x0100, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	bl powerOnEffect

	ldr x30, [sp]
	add sp, sp, 8
	br x30


gradientScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Temporary values
		// - x9:	Temp const for the substraction

	bl saveTempValues

	movz x9, 0x0011, lsl 16
	movk x9, 0x1111, lsl 0

	movz x0, 0x00ff, lsl 16
	movk x0, 0xffff, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	gradient:
		bl createVRectangle
		movz x7, 0x0100, lsl 16
		movk x7, 0x0000, lsl 0
		bl delay
		sub x0, x0, x9
		cmp x0, 0x0
		bge gradient
	
	bl loadTempValues

	ldr x30, [sp]
	add sp, sp, 8
	br x30


donkeySplashScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	movz x0, 0x0038, lsl 16
	movk x0, 0x1503, lsl 0
	mov x1, 129
	mov x2, 301
	mov x3,	20
	mov x4, 27
	mov x5, 102
	bl screenExpansion

	ldr x30, [sp, #8]
	add sp, sp, 8
	br x30


donkeyFace:
	sub sp, sp, 8
	str x30, [sp]

	ldr x30, [sp]
	add sp, sp, 8
	br x30


reduceToZeroScreen:
	sub sp, sp, 8
	str x30, [sp]

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl transitionToTheGame
transitionToTheGame:
	//Guardado registros usados
	sub sp, sp, 8
	str x30, [sp]

	bl gradientScreen

	movz x7, 0x4000, lsl 16
	movk x7, 0x0, lsl 0
	bl delay

	bl donkeySplashScreen

	bl donkeyFace

	bl reduceToZeroScreen

	bl loadTempValues

	ldr x30, [sp]
	add sp, sp, 8
	br x30

.globl glitchScreen
glitchScreen:
	//Guardado registros usados
	sub sp, sp, 8
	str x30, [sp]

	ldr x30, [sp]
	add sp, sp, 8
	br x30
