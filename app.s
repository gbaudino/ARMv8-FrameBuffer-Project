
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	bl config

	bl static

	movz x7, 0x0200
	movk x7, 0x4000
	bl delay

	b dynamic


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


createRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord prim en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo

    //Temporary values:
		// - x9: 	Temp Base Address of Rectangle
		// - x10:	Temp Calc of sum of memory needed for the next row
		// - x11: 	Temp actual row
		// - x12: 	Temp actual column

	//Saved values used:
		// - x20:	Framebuffer Base Address
		// - x21:	Screen Width
		// - x22:	Screen Height

	
	//Generacion de la coordenada del primero del cuadrado
	//Coord del pixel = Dirección de inicio + 4 * [x + (y * 640)]
	mul x9, x1, x21 		// (y * 640)
	add x9,x9, x2		// + (Coord del primero en x) = [x + (y * 640)]
	lsl x9, x9, 2 		//(4 * [x + (y * 640)])
	add x9,x9,x20 		// Dirección de inicio + 4 * [x + (y * 640)]



	//Generacion de la cantidad de memoria a correr x9 para llevarlo a la siguiente fila
	//(SCREEN_WIDTH - SQUARE_WIDTH)*4
	mov x10, x21
	sub x10, x10, x4
	lsl x10, x10, 2

	mov x12, x3 //Set Rectangle Height
	resetRectW:
	mov x11, x4 //Set and Reset Rectangle Width
	nxtPixelRect:
		stur x0,[x9]	   	 	// Set color of pixel N
		add x9,x9,4	   			// Next pixel
		sub x11,x11,1	   			// decrement X counter
		cbnz x11,nxtPixelRect   	// If not end row jump
		add x9, x9, x10	 		// Direccion actual + restante para la sig fila = x19 + (SCREEN_WIDTH - FLOOR_WIDTH)*4
		sub x12,x12,1	    	 	// Decrement Y counter
		cbnz x12,resetRectW 		// if not last row, jump
	
	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

createTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp] 

	// Input values:
		// - x0: Color of Triangle
		// - x1: Coord del primero en Y
		// - x2: Coord del primero en X
		// - x3: Alto Escalon
		// - x4: Ancho Escalon
		// - x5: Reduccion Alto Escalon
		// - x6: Reduccion Ancho Escalon
		// - x7: Cantidad de escalones

	//Temporary values:
		// - x9:  Contador escalon

	mov x9, 0
	loop_Triang2:
		bl createRectangle
		sub x7, x7, 1
		loop_Triang :

			sub x3, x3, x5	// Va disminuyendo el alto del escalon.
			sub x4, x4, x6	 //Va disminuyendo el ancho de cada escalon, añadir reduccion de ancho (x6), cambiar variables
			sub x1, x1, x3  //Disminuyo el tamaño Y

			add x2, x2,x5  //Aumento la Tamaño X
			
			cmp x7, xzr		//Veo si no llegue al limite de escalones
			b.eq done		//Si llegamos al limite de escalones cerramos
			cmp x4, XZR		// Comparo x4 con 0
			b.GT loop_Triang2 //Me aseguro que el resultado no sea negativo.
	done:

	//Despues probar forma alternativa del loop

	// Input values Rectangle:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord prim en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo


	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


static:
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x00FF, lsl 16
	movz x0, 0xFFFF, lsl 0


	mov x1, 0
	mov x2, 0	
    // - x3:    Alto del rectangulo
    // - x4:    Ancho del rectangulo
	mov x3, 480
	mov x4, 640
	bl createRectangle


	// Input values:
		movz x0, 0x0000, lsl 16
		movz x0, 0x0000, lsl 0
		mov x1, 240
		mov x2, 320
		// - x3: Alto Escalon
		mov x3, 8
		// - x4: Ancho Escalon
		mov x4, 80
		// - x5: Reduccion Alto Escalon
		mov x5, 1
		// - x6: Reduccion Ancho Escalon
		mov x6, 18
		// - x7: Cantidad de escalones
		mov x7, 7
	bl createTriangle


	ldr x30, [sp]
	add sp, sp, 16
	ret


dynamic:

	b dynamic

