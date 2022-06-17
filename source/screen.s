
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

	ldr x0, white
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

	movz x9, 0x1111, lsl 16
	movk x9, 0x1111, lsl 0

	ldr x0, white
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

	ldr x30, [sp]
	add sp, sp, 8
	br x30


donkeyFace:
	sub sp, sp, 8
	str x30, [sp]

	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo

	//eyes
	ldr x0, light_pink_monkey
	mov x1, 114
	mov x2, 300
	mov x3, 4
	mov x4, 8
	bl createVRectangle

	mov x2, 322
	bl createVRectangle

	mov x1, 118
	mov x2, 295
	mov x3, 5
	mov x4, 18
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	mov x1, 123
	mov x2, 291
	mov x4, 47
	bl createVRectangle

	mov x1, 128
	mov x2, 295
	mov x3, 8
	mov x4, 39
	bl createVRectangle

	//mouth
	mov x1, 136
	mov x2, 282
	mov x3, 4
	mov x4, 26
	bl createVRectangle

	mov x2, 321
	bl createVRectangle

	mov x1, 140
	mov x2, 278
	mov x3, 5
	mov x4, 73
	bl createVRectangle


	ldr x30, [sp]
	add sp, sp, 8
	br x30


reduceToZeroScreen:
	sub sp, sp, 40
	str x30, [sp, 32]
	str x4, [sp, 24]
	str x3, [sp, 16]
	str x2, [sp, 8]
	str x1, [sp]

	// Temporary values
		// - x9: 	Temp save Y
		// - x10: 	Temp save X
		// - x11: 	Temp Line
	
	ldr x0, black
	mov x3, 100
	mov x4, 135
	mov x9, 89
	mov x10, 247
	mov x11, 0
	repeatReduce:
		mov x1, x9
		mov x2, x10
		add x2, x2, x11
		bl createVLine
		mov x2, x10
		add x2, x2, x4
		sub x2, x2, x11
		bl createVLine
		mov x2, x10
		mov x1, x9
		add x1, x1, x11
		bl createHLine
		mov x1, x9
		add x1, x1, x3
		sub x1, x1, x11	
		bl createHLine
		add x11, x11, 1
		cmp x11, 68
		movz x7, 0x2f0, lsl 16
		movk x7, 0x0, lsl 0
		bl delay
		ble repeatReduce
	
	ldr x30, [sp, 32]
	add sp, sp, 40
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

	bl logoDK

	ldr x30, [sp]
	add sp, sp, 8
	br x30

.globl glitchScreen
glitchScreen:
	//Guardado registros usados
	sub sp, sp, 8
	str x30, [sp]

	bl saveTempValues

	//Temporary Values
		// - x9: 	Temp Line

	ldr x0, black
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle
	mov x9, x1
	ldr x0, pink_glitch_screen
	repeatGlitch:
		bl createHLine
		add x9, x9, 1
		bl createHLine
		add x9, x9, 3
		cmp x9, 189
		blt repeatGlitch
	bl createHLine

	bl loadTempValues

	ldr x30, [sp]
	add sp, sp, 8
	br x30
