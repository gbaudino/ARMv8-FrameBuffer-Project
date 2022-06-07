.globl createRectangle
createRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
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
		stur w0,[x9]	   	 	// Set color of pixel N
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

.globl createTriangle
createTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp] 

	// Input values:
		// - x0: Color of Triangle
		// - x1: Coord del primero en Y
		// - x2: Coord del primero en X
		// - x3: Alto Escalon
		// - x4: Ancho Triangulo
		// - x5: Reduccion Alto Escalon
		// - x6: Reduccion Ancho Escalon
		// - x7: Cantidad de escalones
	
	// Temporary values:
		// - x9: Temp red ancho escalon
	add x9, x6, x6
	loop_Triang2:
		bl createRectangle
		sub x7, x7, 1
		loop_Triang:
			sub x1, x1, x3
			add x1, x1, x5
			add x2, x2, x6
			sub x4, x4, x6
			sub x4, x4, x6
			sub x3, x3, x5
			cbz x7, doneTriang
			cmp x4, x9
			blt loop_Triang2
	doneTriang:


	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createRectangleTriangle
createRectangleTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp] 

	// Input values:
		// - x0: Color of Triangle
		// - x1: Coord del primero en Y
		// - x2: Coord del primero en X
		// - x3: Alto Escalon
		// - x5: Alignment: 0 - izq, otherwise - der
		// - x4: Ancho Triangulo
		// - x6: Reduccion Ancho Escalon
		// - x7: Cantidad de escalones
	
	// Temporary values:
		// - x9: Temp red ancho escalon
	add x9, x6, x6
	loop_RectangleTriang2:
		bl createRectangle
		sub x7, x7, 1
		loop_RectangleTriang:
			sub x1, x1, x3
			cbnz x5, right
			sub x4, x4, x6
			right:
			cbz x5, left
			add x2, x2, x6
			sub x4, x4, x6
			left:
			cbz x7, doneRectTriang
			cmp x4, x9
			blt loop_RectangleTriang2
	doneRectTriang:


	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret
