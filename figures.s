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


.globl createVRectangle
createVRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Guardado registro usado
	sub sp, sp, 16
	str x1, [sp]

	//Guardado registros temporales usados
	sub sp, sp, 16
	str x9, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo

    //Temporary values:
		// - x9: 	Temp fila actual del rectangulo

	mov x9, 0
	genVRectangle:
		bl createHLine
		add x1, x1, 1
		add x9, x9, 1
		cmp x9, x3
		bne genVRectangle
	
	//Carga de registros temporales usados
	ldr x9, [sp]
	add sp, sp, 16

	//Carga de registros usados
	ldr x1, [sp]
	add sp, sp, 16

	//Carga del registro de return y return
	ldr x30, [sp]
	add sp, sp, 16
	ret

.globl createHRectangle
createHRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Guardado registros temporales usados
	sub sp, sp, 16
	str x9, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo

    //Temporary values:
		// - x9: 	Temp copia del ancho del rectangulo

	mov x9, x4
	mov x4, 0
	genHRectangle:
		bl createVLine
		add x2, x2, 1
		add x4, x4, 1
		cmp x4, x9
		bne genHRectangle

	//Carga de registros temporales usados
	ldr x9, [sp]
	add sp, sp, 16

	//Carga del registro de return y return
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
		// - x6: Reduccion Ancho Escalon
		// - x7: Cantidad de escalones

	loop_Triang2:
		bl createVRectangle
		sub x7, x7, 1
		loop_Triang:
			sub x1, x1, x3
			add x2, x2, x6
			sub x4, x4, x6
			sub x4, x4, x6
			cbnz x7, loop_Triang2
	doneTriang:

	//Carga del registro de return y return
	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createRectangleTriangle
createRectangleTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Guardado registros temporales usados
	sub sp, sp, 16
	str x9, [sp]

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
		// - x9: Temp reduccion ancho escalon
	
	add x9, x6, x6
	loop_RectangleTriang2:
		bl createVRectangle
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
			cbnz x7, loop_RectangleTriang2
	doneRectTriang:

	//Carga de registros temporales usados
	ldr x9, [sp]
	add sp, sp, 16

	//Carga del registro de return y return
	ldr x30, [sp]
	add sp, sp, 16
	ret


.globl createHLine
createHLine:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	//Guardado registros temporales usados
	sub sp, sp, 16
	str x9, [sp]

	sub sp, sp, 16
	str x10, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x4:    Largo (Horizontal) de la linea

    //Temporary values:
		// - x9: 	Temp Base Address of Line
		// - x10:	Temp Largo actual

	
	//Guardado registros usados
	sub sp, sp, 16
	str x7, [sp]

	bl generateFrstPixelCoord
	mov x9, x7

	mov x10, x4 //Set Line Width
	nxtPixelHLine:
		stur w0,[x9]	   	 		// Set color of pixel N
		add x9,x9,4	   				// Next pixel
		sub x10,x10,1	   			// decrement X counter
		cbnz x10,nxtPixelHLine   	// If not end row jump

	//Carga de registros usados
	ldr x7, [sp]
	add sp, sp, 16
	
	//Carga de registros temporales usados
	ldr x10, [sp]
	add sp, sp, 16

	ldr x9, [sp]
	add sp, sp, 16

	//Carga del registro de return y return
	ldr x30, [sp]
	add sp, sp, 16
	ret



.globl createVLine
createVLine:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Guardado registros temporales usados
	sub sp, sp, 16
	str x9, [sp]

	sub sp, sp, 16
	str x10, [sp]

	sub sp, sp, 16
	str x11, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Largo (Vertical)

    //Temporary values:
		// - x9: 	Temp Base Address of Line
		// - x10:	Temp Calc of sum of memory needed for the next row
		// - x11:	Temp Largo actual


	//Guardado registros usados
	sub sp, sp, 16
	str x7, [sp]

	bl generateFrstPixelCoord
	mov x9, x7

	//Carga de registros usados
	ldr x7, [sp]
	add sp, sp, 16


	//Generacion de la cantidad de memoria a correr x9 para llevarlo a la siguiente fila
	//(SCREEN_WIDTH - LINE_WIDTH)*4
	mov x10, x21
	lsl x10, x10, 2

	mov x11, x3
	DrawVLine:
		stur w0,[x9]	   	 	// Set color of pixel N
		add x9, x9, x10			//NextLine
		sub x11,x11,1	   		// decrement X counter
		cbnz x11,DrawVLine   	// If not end row jump
	
	//Carga de registros temporales usados
	ldr x11, [sp]
	add sp, sp, 16

	ldr x10, [sp]
	add sp, sp, 16

	ldr x9, [sp]
	add sp, sp, 16

	//Carga del registro de return y return
	ldr x30, [sp]
	add sp, sp, 16
	ret
