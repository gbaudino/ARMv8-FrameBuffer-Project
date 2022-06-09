
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480

.globl config
config:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
		// the function does not receive any value

	//Set saved values
 	mov x20, x0	            // Save framebuffer base address to x20
    mov x21, SCREEN_WIDTH   // Save Screen Width
    mov x22, SCREEN_HEIGHT  // Save Screen Height

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

.globl delay
delay:
    //Guardado registro return
    sub sp, sp, 16
	str x30, [sp]

    // Input values:
        // - x7: Limit to repeat

    cont:
        sub x7, x7, 1
        cbnz x7, cont

    ldr x30, [sp]
	add sp, sp, 16
    ret


.globl generateFrstPixelCoord
generateFrstPixelCoord:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

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

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret
    