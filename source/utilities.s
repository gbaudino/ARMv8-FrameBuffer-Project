
.ifndef utilities_s
.equ utilities_s, 1

.include "data.s"

config:
	// Input values:
		// the function does not receive any value

	//Set saved values
 	mov x20, x0	            // Save framebuffer base address to x20
    mov x21, SCREEN_WIDTH   // Save Screen Width
    mov x22, SCREEN_HEIGHT  // Save Screen Height

	br x30

delay:
    // Input values:
        // - x7: Limit to repeat

    cont:
        sub x7, x7, 1
        cbnz x7, cont

    br x30


generateFrstPixelCoord:
	// Input values:
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
	
	// Output values:
		// - x7: 	First pixel coord

	//Saved values used:
		// - x20:	Framebuffer Base Address
		// - x21:	Screen Width

	//Generacion de la coordenada del primero
	//Coord del pixel = Dirección de inicio + 4 * [x + (y * 640)]
	mul x7, x1, x21 		// (y * 640)
	add x7,x7, x2		// + (Coord del primero en x) = [x + (y * 640)]
	lsl x7, x7, 2 		//(4 * [x + (y * 640)])
	add x7, x7, x20 		// Dirección de inicio + 4 * [x + (y * 640)]

	br x30


saveTempValues:
	sub sp, sp, 56
	str x9, [sp, #48]
	str x10, [sp, #40]
	str x11, [sp, #32]
	str x12, [sp, #24]
	str x13, [sp, #16]
	str x14, [sp, #8]
	str x15, [sp]
	br x30

loadTempValues:
	ldr x15, [sp]
	ldr x14, [sp, #8]
	ldr x13, [sp, #16]
	ldr x12, [sp, #24]
	ldr x11, [sp, #32]
	ldr x10, [sp, #40]
	ldr x9, [sp, #48]
	add sp, sp, 56
	br x30

generateRandomNumber:
	//Guardado registro temporal x9
	sub sp, sp, 8
	str x9, [sp]

    cmp x7, #0
    csinc x7, x7, xzr, ne
    eor x9, x7, x7, lsr #2
    eor x9, x9, x7, lsr #3
    eor x9, x9, x7, lsr #5
    lsl x9, x9, #15
    orr x7, x9, x7, lsr #1

	ldr x9, [sp]
	add sp, sp, 8
	
	br x30
	
.endif
