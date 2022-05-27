
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480
.equ BITS_PER_PIXEL,  	32
.equ FLOOR_HEIGHT,      120

.globl main
main:
	str x30, [sp]
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	bl createBackground

	bl createFloor

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
	movz x10, 0x0009, lsl 16 
	movk x10, 0x0936, lsl 0

	mov x21, 0 				//Coord del primero en Y
	mov x22, 0				//Coord del primero en X
	mov x5, 360				//Square Height
	mov x6, SCREEN_WIDTH	//Square Width
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
	movz x10, 0x009d, lsl 16 
	movk x10, 0x5a4e, lsl 0

	mov x21, 360 			//Coord del primero en Y
	mov x22, 0 				//Coord del primero en X
	mov x5, FLOOR_HEIGHT	//Square Height
	mov x6, SCREEN_WIDTH	//Square Width
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
	movz x10, 0x0000, lsl 16 
	movk x10, 0x0000, lsl 0

	mov x21, 325 	//Coord del primero en Y
	mov x22, 420 	//Coord del primero en X
	mov x5, 40 		//Square Height
	mov x6, 2 		//Square Width
	bl createRectangle

	//Crear Azul de la Bandera
	//Parametros
	//Color
	movz x10, 0x0021, lsl 16 
	movk x10, 0x96f3, lsl 0

	mov x21, 325 	//Coord del primero en Y
	mov x22, 422 	//Coord del primero en X
	mov x5, 15 		//Square Height
	mov x6, 18 		//Square Width
	bl createRectangle

	//Crear Blanco de la Bandera
	//Parametros
	//Color
	movz x10, 0x00ff, lsl 16 
	movk x10, 0xffff, lsl 0

	mov x21, 330 	//Coord del primero en Y
	mov x22, 422 	//Coord del primero en X
	mov x5, 5 		//Square Height
	mov x6, 18 		//Square Width
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
	movz x10, 0x0000, lsl 16 
	movk x10, 0x0000, lsl 0

	mov x21, 250 	//Coord del primero en Y
	mov x22, 300 	//Coord del primero en X
	mov x5, 50 		//Square Height
	mov x6, 50 		//Square Width
	bl createRectangle

	//Crear Azul de la Capsula
	//Parametros
	//Color
	movz x10, 0x0015, lsl 16 
	movk x10, 0x6ac0, lsl 0
	mov x21, 252 	//Coord del primero en Y
	mov x22, 302 	//Coord del primero en X
	mov x5, 3 		//Square Height
	mov x6, 46 		//Square Width
	bl createRectangle

	//Crear blanco de la Capsula
	//Parametros
	//Color
	movz x10, 0x00ff, lsl 16 
	movk x10, 0xffff, lsl 0

	mov x21, 258 	//Coord del primero en Y
	mov x22, 303 	//Coord del primero en X
	mov x5, 40		//Square Height
	mov x6, 44 		//Square Width
	bl createRectangle

	//Crear Negro del triangulo
	//Parametros
		//Color
	movz x10, 0x0000, lsl 16 
	movk x10, 0x0000, lsl 0
		
	mov x21, 243 	//Coord del primero en Y
	mov x22, 303 	//Coord del primero en X
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
	// - x14: Opcional para triangulos
	// - w10: Color of Square
	// - x21: Coord del primero en Y
	// - x22: Coord del primero en X
	// - x5: Square Height
	// - x6: Square Width

	//Generacion de la coordenada del primero del cuadrado
	//Coord del pixel = Dirección de inicio + 4 * [x + (y * 640)]
	mov x18, SCREEN_WIDTH   // Generacion del 640
	mul x23, x21, x18 		// (y * 640)
	add x23,x23, x22		// + (Coord del primero en x) = [x + (y * 640)]
	lsl x19, x23, 2 		//(4 * [x + (y * 640)])
	add x19,x19,x20 		// Dirección de inicio + 4 * [x + (y * 640)]



	//Generacion de la cantidad de memoria a correr x19 para llevarlo a la siguiente fila
	//(SCREEN_WIDTH - SQUARE_WIDTH)*4
	mov x17, SCREEN_WIDTH
	sub x15, x17, x6
	lsl x15, x15, 2
	add x15,x15,x14 // Opcional para formar un cono

	mov x3, x5 //Set Square Height
	loop2:
	mov x4, x6 //Set and Reset Square Width
	loop3:
		stur w10,[x19]	   	 // Set color of pixel N
		add x19,x19,4	   	 // Next pixel
		sub x4,x4,1	   		 // decrement X counter
		cbnz x4,loop3	   	 // If not end row jump
		add x19, x19, x15	 // Direccion actual + restante para la sig fila = x19 + (SCREEN_WIDTH - FLOOR_WIDTH)*4
		sub x3,x3,1	    	 // Decrement Y counter
		cbnz x3,loop2	   	 // if not last row, jump
	
	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

createTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

		// Input values:
	// - X10: Color of Triangle
	// - x21: Coord del primero en Y
	// - x22: Coord del primero en X
	// - x5: Triangle Height
	// - x6: Triangle Width

	loop_Triang2:
		bl createRectangle
	loop_Triang :
		sub x21, x21, 3  //Disminuyo el tamaño X
		add x22, x22, 3  //Aumento la Tamaño Y
		sub x6, x6, 6	 //Va disminuyendo el ancho de cada escalon
		cmp x6, XZR		// Comparo x6 con 0
		b.GT loop_Triang2 //Me aseguro que el resultado no sea negativo.


	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop

exitProgram:
	.end
