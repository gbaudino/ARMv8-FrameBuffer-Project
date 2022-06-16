
.include "utilities.s"

.globl createVRectangle
createVRectangle:
	//Guardado registros a usar
	sub sp, sp, 16
	str x30, [sp, #8]
	str x1, [sp]

	bl saveTempValues

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
	
	bl loadTempValues

	//Carga de registros usados
	ldr x1, [sp]
	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30

.globl createHRectangle
createHRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp, #8]
	str x2, [sp]

	bl saveTempValues

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

	bl loadTempValues

	//Carga del registro de return y return
	ldr x2, [sp]
	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30


.globl createTriangle
createTriangle: 
	//Guardado registro return
	sub sp, sp, 40
	str x30, [sp, #32]
	str x7 , [sp, #24]
	str x4, [sp, #16]
	str x2, [sp, #8]
	str x1, [sp]

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
	ldr x1, [sp]
	ldr x2, [sp, #8]
	ldr x4, [sp, #16]
	ldr x7, [sp, #24]
	ldr x30, [sp, #32]
	add sp, sp, 40
	br x30


.globl createRectangleTriangle
createRectangleTriangle: 
	//Guardado registro return
	sub sp, sp, 40
	str x30, [sp, #32]
	str x7 , [sp, #24]
	str x4, [sp, #16]
	str x2, [sp, #8]
	str x1, [sp]
	
	bl saveTempValues

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

	bl loadTempValues

	//Carga del registro de return y return
	ldr x1, [sp]
	ldr x2, [sp, #8]
	ldr x4, [sp, #16]
	ldr x7, [sp, #24]
	ldr x30, [sp, #32]
	add sp, sp, 40
	br x30


.globl createHLine
createHLine:
	//Guardado de registros a usar
	sub sp, sp, 16
	str x30, [sp, #8]
	str x7, [sp]
	
	bl saveTempValues

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x4:    Largo (Horizontal) de la linea

    //Temporary values:
		// - x9: 	Temp Base Address of Line
		// - x10:	Temp Largo actual

	bl generateFrstPixelCoord
	mov x9, x7

	mov x10, x4 //Set Line Width
	nxtPixelHLine:
		stur w0,[x9]	   	 		// Set color of pixel N
		add x9,x9,4	   				// Next pixel
		sub x10,x10,1	   			// decrement X counter
		cbnz x10,nxtPixelHLine   	// If not end row jump

	
	bl loadTempValues

	//Carga de registros usados
	ldr x7, [sp]
	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30

.globl createVLine
createVLine:
	//Guardado de registros a usar
	sub sp, sp, 16
	str x30, [sp, #8]
	str x7, [sp]
	
	bl saveTempValues

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
	bl generateFrstPixelCoord
	mov x9, x7

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
	

	bl loadTempValues

	//Carga de registros usados
	ldr x7, [sp]
	ldr x30, [sp, #8]
	add sp, sp, 16
	br x30
