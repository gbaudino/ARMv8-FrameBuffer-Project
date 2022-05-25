
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.equ FLOOR_WIDTH,      320
.equ FLOOR_HEIGHT,     240

.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	//0x
	movz x10, 0x0009, lsl 16 
	movk x10, 0x0936, lsl 0

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump


//Generacion de la coordenada del primero del cuadrado
//Coord del pixel = Dirección de inicio + 4 * [x + (y * 640)]
mov x19, 120 			// Coord del primero en y
mov x18, SCREEN_WIDTH   // Generacion del 640
mul x22, x19, x18 		// (y * 640)
add x22,x22, 160 		// (Coord del primero en x)
mov x19, 4 				//inmutable (Creacion del 4 para mult)
mul x21, x22, x19 		// (4 * [x + (y * 640)])
add x21,x21,x20 		// Dirección de inicio + 4 * [x + (y * 640)]

//Generacion del color a pintar el cuadrado
movz x10, 0x009d, lsl 16 
movk x10, 0x5a4e, lsl 0

//Generacion de la cantidad de memoria a correr x21 para llevarlo a la siguiente fila
//(SCREEN_WIDTH - FLOOR_WIDTH)*4
mov x17, SCREEN_WIDTH
mov x16, FLOOR_WIDTH
sub x15, x17, x16
add x15,x15,0
lsl x15, x15, 2

mov x3, FLOOR_HEIGHT
loop2:
mov x4, FLOOR_WIDTH
loop3:
	stur w10,[x21]	   	 // Set color of pixel N
	add x21,x21,4	   	 // Next pixel
	sub x4,x4,1	   		 // decrement X counter
	cbnz x4,loop3	   	 // If not end row jump
	add x21, x21, x15	 // Direccion actual + restante para la sig fila = x21 + (SCREEN_WIDTH - FLOOR_WIDTH)*4
	sub x3,x3,1	    	 // Decrement Y counter
	cbnz x3,loop2	   	 // if not last row, jump


	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop
