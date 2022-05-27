
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	//Set saved values
 	mov x20, x0	            // Save framebuffer base address to x20
    mov x21, SCREEN_WIDTH   // Save Screen Width
    mov x22, SCREEN_HEIGHT  // Save Screen Height

	bl createBackground

	bl createFloor

	//Example of Delay implementation
	mov x7, 0xffffffff
	bl delay

	bl createFlag

	bl createRocket

	bl exitProgram



createBackground:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Create Background
	//Parameters
	//Color:
	movz x0, 0x0009, lsl 16 
	movk x0, 0x0936, lsl 0

	mov x1, 0 				//Coord del primero en Y
	mov x2, 0				//Coord del primero en X
	mov x5, 360				//Rectangle Height
	mov x6, SCREEN_WIDTH	//Rectangle Width
	bl createRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


createFloor:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Create Floor
	//Parameters:
	//Color:
	movz x0, 0x009d, lsl 16 
	movk x0, 0x5a4e, lsl 0

	mov x1, 360 			//Coord del primero en Y
	mov x2, 0 				//Coord del primero en X
	mov x5, 120				//Rectangle Height
	mov x6, SCREEN_WIDTH	//Rectangle Width
	bl createRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


createFlag:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Crear Mastil de la Bandera
	//Parametros
	//Color
	movz x0, 0x0000, lsl 16 
	movk x0, 0x0000, lsl 0

	mov x1, 325 	//Coord del primero en Y
	mov x2, 420 	//Coord del primero en X
	mov x5, 40 		//Rectangle Height
	mov x6, 2 		//Rectangle Width
	bl createRectangle

	//Crear Azul de la Bandera
	//Parametros
	//Color
	movz x0, 0x0021, lsl 16 
	movk x0, 0x96f3, lsl 0

	mov x1, 325 	//Coord del primero en Y
	mov x2, 422 	//Coord del primero en X
	mov x5, 15 		//Rectangle Height
	mov x6, 18 		//Rectangle Width
	bl createRectangle

	//Crear Blanco de la Bandera
	//Parametros
	//Color
	movz x0, 0x00ff, lsl 16 
	movk x0, 0xffff, lsl 0

	mov x1, 330 	//Coord del primero en Y
	mov x2, 422 	//Coord del primero en X
	mov x5, 5 		//Rectangle Height
	mov x6, 18 		//Rectangle Width
	bl createRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


createRocket:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	

	//Crear Negro de la Capsula
	//Parametros
	//Color
	movz x0, 0x0000, lsl 16 
	movk x0, 0x0000, lsl 0

	mov x1, 250 	//Coord del primero en Y
	mov x2, 300 	//Coord del primero en X
	mov x5, 50 		//Rectangle Height
	mov x6, 50 		//Rectangle Width
	bl createRectangle

	//Crear Azul de la Capsula
	//Parametros
	//Color
	movz x0, 0x0015, lsl 16 
	movk x0, 0x6ac0, lsl 0
	mov x1, 252 	//Coord del primero en Y
	mov x2, 302 	//Coord del primero en X
	mov x5, 3 		//Rectangle Height
	mov x6, 46 		//Rectangle Width
	bl createRectangle

	//Crear blanco de la Capsula
	//Parametros
	//Color
	movz x0, 0x00ff, lsl 16 
	movk x0, 0xffff, lsl 0

	mov x1, 258 	//Coord del primero en Y
	mov x2, 303 	//Coord del primero en X
	mov x5, 40		//Rectangle Height
	mov x6, 44 		//Rectangle Width
	bl createRectangle

	//Crear Negro del triangulo
	//Parametros
		//Color
	movz x0, 0x0000, lsl 16 
	movk x0, 0x0000, lsl 0
		
	mov x1, 243 	//Coord del primero en Y
	mov x2, 303 	//Coord del primero en X
	mov x5, 8		//Triangle Height
	mov x6, 44		//Triangle Width

	bl createTriangle

	//Carga del registro de return y devolucion del siguiente
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
        // - x3:    Desplazamiento en y
        // - x4:    Desplazamiento en x
        // - x5:    Alto del rectangulo
        // - x6:    Ancho del rectangulo

    //Temporary values:
		// - x9: 	Temp Base Address of Rectangle
		// - x10:	Temp Calc of sum of memory needed for the next row

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
	sub x10, x10, x6
	lsl x10, x10, 2

	mov x3, x5 //Set Rectangle Height
	resetRectW:
	mov x4, x6 //Set and Reset Rectangle Width
	nxtPixelRect:
		stur x0,[x9]	   	 	// Set color of pixel N
		add x9,x9,4	   			// Next pixel
		sub x4,x4,1	   			// decrement X counter
		cbnz x4,nxtPixelRect   	// If not end row jump
		add x9, x9, x10	 		// Direccion actual + restante para la sig fila = x19 + (SCREEN_WIDTH - FLOOR_WIDTH)*4
		sub x3,x3,1	    	 	// Decrement Y counter
		cbnz x3,resetRectW 		// if not last row, jump
	
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
	// - x5: Triangle Height
	// - x6: Triangle Width

	loop_Triang2:
		bl createRectangle
	loop_Triang :
		sub x1, x1, 3  //Disminuyo el tamaño X
		add x2, x2, 3  //Aumento la Tamaño Y
		sub x6, x6, 6	 //Va disminuyendo el ancho de cada escalon
		cmp x6, XZR		// Comparo x6 con 0
		b.GT loop_Triang2 //Me aseguro que el resultado no sea negativo.


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

//---------------------------------------------------------------
// Infinite Loop 
InfLoop: 
	b InfLoop

exitProgram:
	.end
