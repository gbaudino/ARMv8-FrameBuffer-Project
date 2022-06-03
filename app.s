
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	bl config

	bl program


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

createCuevaRaton:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	// - x0: 	Color of Base
	// - x5:	Variacion tamano

	mov x1, 380
	mov x2, 120
	add x2, x2, x5
	mov x3, 18
	sub x3, x3, x5
	mov x4, 16
	sub x4, x4, x5
	bl createRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

createBackground:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	//Pared
	movz x0, 0x005f, lsl 16
	movk x0, 0x4d84, lsl 0
	mov x1, 0
	mov x2, 0
	mov x3, 397
	mov x4, x21
	bl createRectangle

	//Suelo
	movz x0, 0x0079, lsl 16
	movk x0, 0x5548, lsl 0
	mov x1, 397
	mov x2, 0
	mov x3, 83
	mov x4, x21
	bl createRectangle

	//Cueva raton
	movz x0, 0x0022, lsl 16
	movk x0, 0x2222, lsl 0
	mov x5, 0
	bl createCuevaRaton

	//Cueva raton
	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x5, 2
	bl createCuevaRaton

	//Semicirculo cueva raton
	

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

lightSwitcher:
	// Input values:
		// - x0: Light Key Status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
	//Guardado registro x0
	sub sp, sp, 16
	str x0, [sp]
	
	ldr x0, [sp]
	add sp, sp, 16
	cbnz x0, onStatus
	sub sp, sp, 16
	str x0, [sp]

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createRectangle

	movz x0, 0x00d5, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 147
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createRectangle

	onStatus:
	ldr x0, [sp]
	add sp, sp, 16
	cbz x0, doneLightKey
	sub sp, sp, 16
	str x0, [sp]

	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 129
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 147
	mov x2, 98
	mov x3,	12
	mov x4, 12
	bl createRectangle

	doneLightKey:
	ldr x30, [sp]
	add sp, sp, 16
	ret

createLightKey:
	// Input values:
		// - x0: Light Key Status: 0 - Off, otherwise - On
		
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	
	//Guardado registro x0
	sub sp, sp, 16
	str x0, [sp]
	


	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 117
	mov x2, 86
	mov x3,	54
	mov x4, 35
	bl createRectangle

	movz x0, 0x00c9, lsl 16
	movk x0, 0xd7da, lsl 0
	mov x1, 118
	mov x2, 87
	mov x3,	52
	mov x4, 33
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 120
	mov x2, 103
	mov x3,	2
	mov x4, 2
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 166
	mov x2, 103
	mov x3,	2
	mov x4, 2
	bl createRectangle
	
	movz x0, 0x0061, lsl 16
	movk x0, 0x6161, lsl 0
	mov x1, 141
	mov x2, 98
	mov x3,	6
	mov x4, 12
	bl createRectangle

	ldr x0, [sp]
	add sp, sp, 16
	bl lightSwitcher
	
	ldr x30, [sp]
	add sp, sp, 16
	ret


createCable:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbb, lsl 0
	mov x1, 310
	mov x2, 585
	mov x3,	18
	mov x4, 27
	bl createRectangle

	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbb, lsl 0
	mov x1, 306
	mov x2, 589
	mov x3,	26
	mov x4, 19
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 310
	mov x2, 593
	mov x3,	18
	mov x4, 12
	bl createRectangle

	movz x0, 0x0042, lsl 16
	movk x0, 0x4242, lsl 0
	mov x1, 328
	mov x2, 596
	mov x3,	44
	mov x4, 6
	bl createRectangle

	movz x0, 0x0042, lsl 16
	movk x0, 0x4242, lsl 0
	mov x1, 370
	mov x2, 592
	mov x3,	6
	mov x4, 6
	bl createRectangle

	movz x0, 0x0042, lsl 16
	movk x0, 0x4242, lsl 0
	mov x1, 374
	mov x2, 404
	mov x3,	6
	mov x4, 190
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 328
	mov x2, 597
	mov x3,	43
	mov x4, 4
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 371
	mov x2, 593
	mov x3,	4
	mov x4, 4
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 375
	mov x2, 404
	mov x3,	4
	mov x4, 189
	bl createRectangle


	ldr x30, [sp]
	add sp, sp, 16
	ret


createMonkey:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creación de la parte marrón
	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 103
	mov x2, 539
	mov x3,	4
	mov x4, 19
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 107
	mov x2, 539
	mov x3,	1
	mov x4, 14
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 108
	mov x2, 534
	mov x3,	5
	mov x4, 19
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 113
	mov x2, 529
	mov x3,	5
	mov x4, 35
	bl createRectangle
	
	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 118
	mov x2, 514
	mov x3,	5
	mov x4, 40
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 123
	mov x2, 509
	mov x3,	5
	mov x4, 30
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 128
	mov x2, 504
	mov x3,	5
	mov x4, 35
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 133
	mov x2, 499
	mov x3,	5
	mov x4, 45
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 138
	mov x2, 499
	mov x3,	5
	mov x4, 40
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 143
	mov x2, 494
	mov x3,	5
	mov x4, 40
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 148
	mov x2, 494
	mov x3,	11
	mov x4, 50
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 159
	mov x2, 488
	mov x3,	15
	mov x4, 51
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 174
	mov x2, 494
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 179
	mov x2, 488
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 174
	mov x2, 519
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 179
	mov x2, 529
	mov x3,	5
	mov x4, 10
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 163
	mov x2, 554
	mov x3,	15
	mov x4, 10
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 174
	mov x2, 559
	mov x3,	10
	mov x4, 10
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 122
	mov x2, 549
	mov x3,	11
	mov x4, 5
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 133
	mov x2, 564
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x0052, lsl 16
	movk x0, 0x2f1b, lsl 0
	mov x1, 154
	mov x2, 514
	mov x3,	15
	mov x4, 5
	bl createRectangle

	movz x0, 0x0052, lsl 16
	movk x0, 0x2f1b, lsl 0
	mov x1, 164
	mov x2, 509
	mov x3,	5
	mov x4, 5
	bl createRectangle

	//Creación parte rosa

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 184
	mov x2, 560
	mov x3,	5
	mov x4, 9
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 184
	mov x2, 519
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 184
	mov x2, 488
	mov x3,	5
	mov x4, 26
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 179
	mov x2, 524
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 169
	mov x2, 514
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 169
	mov x2, 534
	mov x3,	4
	mov x4, 10
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 159
	mov x2, 539
	mov x3,	10
	mov x4, 5
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 158
	mov x2, 549
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 148
	mov x2, 544
	mov x3,	10
	mov x4, 30
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 138
	mov x2, 539
	mov x3,	10
	mov x4, 40
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 133
	mov x2, 544
	mov x3,	5
	mov x4, 20
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 133
	mov x2, 569
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 123
	mov x2, 539
	mov x3,	10
	mov x4, 10
	bl createRectangle

	movz x0, 0x00e9, lsl 16
	movk x0, 0xc8a5, lsl 0
	mov x1, 118
	mov x2, 554
	mov x3,	4
	mov x4, 15
	bl createRectangle

	//Creación corbata

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 118
	mov x2, 524
	mov x3,	15
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 133
	mov x2, 529
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 138
	mov x2, 534
	mov x3,	10
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 148
	mov x2, 539
	mov x3,	5
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 158
	mov x2, 544
	mov x3,	21
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 163
	mov x2, 549
	mov x3,	26
	mov x4, 5
	bl createRectangle

	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x1, 176
	mov x2, 554
	mov x3,	6
	mov x4, 5
	bl createRectangle

	//Creación de ojos y boca

	movz x0, 0x00ec, lsl 16
	movk x0, 0xecec, lsl 0
	mov x1, 122
	mov x2, 554
	mov x3,	11
	mov x4, 6
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 122
	mov x2, 560
	mov x3,	11
	mov x4, 4
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 144
	mov x2, 549
	mov x3,	4
	mov x4, 5
	bl createRectangle

	movz x0, 0x0000, lsl 16
	movk x0, 0x0000, lsl 0
	mov x1, 148
	mov x2, 554
	mov x3,	5
	mov x4, 20
	bl createRectangle


	ldr x30, [sp]
	add sp, sp, 16
	ret


createPoster:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x00f0, lsl 16
	movk x0, 0xac14, lsl 0
	mov x1, 88
	mov x2, 470
	mov x3,	116
	mov x4, 127
	bl createRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0xfcf9, lsl 0
	mov x1, 85
	mov x2, 465
	mov x3,	4
	mov x4, 138
	bl createRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0xfcf9, lsl 0
	mov x1, 202
	mov x2, 465
	mov x3,	4
	mov x4, 138
	bl createRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0xfcf9, lsl 0
	mov x1, 82
	mov x2, 468
	mov x3,	127
	mov x4, 4
	bl createRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0xfcf9, lsl 0
	mov x1, 82
	mov x2, 596
	mov x3,	127
	mov x4, 4
	bl createRectangle
	
	bl createMonkey

	ldr x30, [sp]
	add sp, sp, 16
	ret



// ------------------------
// Creacion maquina arcade
// ------------------------

createArcadeBase:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	// - x0: 	Color of Base
	// - x5:	Variacion tamano
	mov x1, 405
	add x1, x1, x5
	mov x2, 204
	add x2, x2, x5
	mov x3,	20
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 222
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 393
	add x1, x1, x5
	mov x2, 216
	add x2, x2, x5
	mov x3,	4
	mov x4, 198
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 397
	add x1, x1, x5
	mov x2, 212
	add x2, x2, x5
	mov x3,	4
	mov x4, 206
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 401
	add x1, x1, x5
	mov x2, 208
	add x2, x2, x5
	mov x3,	4
	mov x4, 214
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 425
	sub x1, x1, x5
	mov x2, 208
	add x2, x2, x5
	mov x3,	4
	mov x4, 214
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 429
	sub x1, x1, x5
	mov x2, 212
	add x2, x2, x5
	mov x3,	4
	mov x4, 206
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 433
	sub x1, x1, x5
	mov x2, 216
	add x2, x2, x5
	mov x3,	4
	mov x4, 198
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret


createArcadeCase:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion triang1 borde blanco maq
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 24
	mov x2, 221
	mov x3,	4
	mov x4, 12
	mov x5, 1
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle
	

	//Creacion triang2 borde cyan maq
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 24
	mov x2, 225
	mov x3,	4
	mov x4, 8
	mov x5, 1
	mov x6, 4
	mov x7, 2
	bl createRectangleTriangle

	//Creacion triang3 borde blanco maq
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 24
	mov x2, 396
	mov x3,	4
	mov x4, 12
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle
	

	//Creacion triang4 borde cyan maq
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 24
	mov x2, 396
	mov x3,	4
	mov x4, 8
	mov x5, 0
	mov x6, 4
	mov x7, 2
	bl createRectangleTriangle

	//Creacion bordes blancos maq
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 16
	mov x2, 233
	mov x3,	13
	mov x4, 163
	bl createRectangle

	//Creacion bordes blancos maq
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 28
	mov x2, 221
	mov x3, 408
	mov x4, 187
	bl createRectangle

	//Creacion bordes blancos panel
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 229
	mov x2, 201
	mov x3, 4
	mov x4, 228
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0

	mov x1, 233
	mov x2, 197
	mov x3, 22
	mov x4, 236
	bl createRectangle

	//Creacion bordes cyan panel
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 233
	mov x2, 201
	mov x3, 4
	mov x4, 227
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	//Creacion cuadrado  cyan panel
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 233
	mov x2, 201
	mov x3, 22
	mov x4, 228
	bl createRectangle

	//Añadimos borde para terminar el detalle (izq)
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 255
	mov x2, 197
	mov x3, 4
	mov x4, 28
	bl createRectangle

	//Añadimos borde para terminar el detalle (der)
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x1, 255
	mov x2, 404
	mov x3, 4
	mov x4, 28
	bl createRectangle

	//Fix
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 213
	mov x2, 221
	mov x3, 5
	mov x4, 187
	bl createRectangle

	//Creacion blanco abajo
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x5, 0
	bl createArcadeBase

	//Creacion gris abajo
	movz x0, 0x00be, lsl 16
	movk x0, 0xbebe, lsl 0
	mov x5, 4
	bl createArcadeBase

	//Creacion interior cyan maq
	movz x0, 0x0064, lsl 16
	movk x0, 0xdefe, lsl 0
	mov x1, 28
	mov x2, 225
	mov x3,	387
	mov x4, 179
	bl createRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret

createNintendoLogo:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	// - x0: 	Color of Base
	// - x5:	Variacion tamano
	mov x1, 32
	add x1, x1, x5
	mov x2, 242
	add x2, x2, x5
	mov x3,	20
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 144
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 30
	add x1, x1, x5
	mov x2, 244
	add x2, x2, x5
	mov x3,	2
	mov x4, 140
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 28
	add x1, x1, x5
	mov x2, 246
	add x2, x2, x5
	mov x3,	2
	mov x4, 136
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 26
	add x1, x1, x5
	mov x2, 248
	add x2, x2, x5
	mov x3,	2
	mov x4, 132
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 52
	sub x1, x1, x5
	mov x2, 244
	add x2, x2, x5
	mov x3,	2
	mov x4, 140
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 54
	sub x1, x1, x5
	mov x2, 246
	add x2, x2, x5
	mov x3,	2
	mov x4, 136
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	mov x1, 56
	sub x1, x1, x5
	mov x2, 248
	add x2, x2, x5
	mov x3,	2
	mov x4, 132
	sub x4, x4, x5
	sub x4, x4, x5
	bl createRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret

createNLetterLogo:
	// Input values:
	// - x0: 	Color of Base
	// - x1: 	Coord inicial Y
	// - x2: 	Coord inicial X

createArcadeTop:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion interior amarillo claro maq
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 19
	mov x2, 233
	mov x3,	185
	mov x4, 163
	bl createRectangle

	//Creacion interior amarillo oscuro maq
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 64
	mov x2, 233
	mov x3,	22
	mov x4, 163
	bl createRectangle

	//Creacion interior triang1 amarillo oscuro maq
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 82
	mov x2, 233
	mov x3,	4
	mov x4, 12
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle

	//Creacion interior triang2 amarillo oscuro maq
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 82
	mov x2, 384
	mov x3,	4
	mov x4, 12
	mov x5, 1
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle

	//Creacion interior amarillo oscuro maq
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 191
	mov x2, 245
	mov x3,	13
	mov x4, 139
	bl createRectangle

	//Creacion interior triang3 amarillo oscuro maq
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 200
	mov x2, 237
	mov x3,	4
	mov x4, 24
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createTriangle

	//Creacion interior triang4 amarillo oscuro maq
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 204
	mov x2, 372
	mov x3,	4
	mov x4, 24
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createTriangle

	//Creacion interior amarillo oscuro maq
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 204
	mov x2, 233
	mov x3,	9
	mov x4, 163
	bl createRectangle

	//Parte blanca logo nintendo
	movz x0, 0x00f6, lsl 16
	movk x0, 0x1b26, lsl 0
	mov x5, 0
	bl createNintendoLogo

	//Parte roja logo nintendo
	movz x0, 0x00f9, lsl 16
	movk x0, 0xfaf5, lsl 0
	mov x5, 2
	bl createNintendoLogo

	

	ldr x30, [sp]
	add sp, sp, 16
	ret


createArcadePanel:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion panel
	movz x0, 0x0026, lsl 16
	movk x0, 0x3b59, lsl 0
	mov x1, 229
	mov x2, 214
	mov x3, 4
	mov x4, 202
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	//Creacion cuadrado amarillo panel
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 233
	mov x2, 210
	mov x3, 22
	mov x4, 210
	bl createRectangle

	//Aca empiezan los detalles del panel
	//INICIO BOTONES AZULES
	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 218
	mov x2, 238
	mov x3, 4
	mov x4, 20
	bl createRectangle

	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 222
	mov x2, 235
	mov x3, 4
	mov x4, 20
	bl createRectangle
	//FIN BOTONES AZULES

	//INICIO BOTONES ROJOS
	movz x0, 0x00ec, lsl 16
	movk x0, 0x4738, lsl 0
	mov x1, 218
	mov x2, 266
	mov x3, 4
	mov x4, 20
	bl createRectangle

	movz x0, 0x00ec, lsl 16
	movk x0, 0x4738, lsl 0
	mov x1, 222
	mov x2, 262
	mov x3, 4
	mov x4, 20
	bl createRectangle
	//FIN BOTONES ROJOS

	//INICIO BASE CONTROLADOR
	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 213
	mov x2, 308
	mov x3, 13
	mov x4, 20
	bl createRectangle

	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 217
	mov x2, 305
	mov x3, 4
	mov x4, 3
	bl createRectangle

	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 217
	mov x2, 328
	mov x3, 4
	mov x4, 3
	bl createRectangle
	//FIN BASE DEL CONTROLADOR

	//INICIO PAlANCA
	movz x0, 0x00ec, lsl 16
	movk x0, 0xfbef, lsl 0
	mov x1, 207
	mov x2, 317
	mov x3, 13
	mov x4, 3
	bl createRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0x3e41, lsl 0
	mov x1, 200
	mov x2, 313
	mov x3, 7
	mov x4, 12
	bl createRectangle
	//FIN PALANCA

	//BOTONES DERECHA
	movz x0, 0x00fb, lsl 16
	movk x0, 0x3e41, lsl 0
	mov x1, 221
	mov x2, 365
	mov x3, 4
	mov x4, 9
	bl createRectangle

	movz x0, 0x0029, lsl 16
	movk x0, 0x62ff, lsl 0
	mov x1, 221
	mov x2, 380
	mov x3, 4
	mov x4, 9
	bl createRectangle

	//FIN BOTONES



	ldr x30, [sp]
	add sp, sp, 16
	ret


createArcadeBottom:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion amarillo oscuro
	movz x0, 0x00ff, lsl 16
	movk x0, 0xa200, lsl 0
	mov x1, 255
	mov x2, 233
	mov x3,	160
	mov x4, 163
	bl createRectangle

	//Creacion linea abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 384
	mov x2, 233
	mov x3,	4
	mov x4, 163
	bl createRectangle

	//Creacion linea abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 275
	mov x2, 248
	mov x3,	109
	mov x4, 4
	bl createRectangle

	//Creacion linea abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 275
	mov x2, 376
	mov x3,	109
	mov x4, 4
	bl createRectangle

	//Creacion linea abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 267
	mov x2, 256
	mov x3,	4
	mov x4, 116
	bl createRectangle

	//Creacion triangulo abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 271
	mov x2, 252
	mov x3,	4
	mov x4, 4
	bl createRectangle

	//Creacion triangulo abajo amarillo claro
	movz x0, 0x00fe, lsl 16
	movk x0, 0xea64, lsl 0
	mov x1, 271
	mov x2, 372
	mov x3,	4
	mov x4, 4
	bl createRectangle

	//Creacion llave puerta
	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbf, lsl 0
	mov x1, 300
	mov x2, 347
	mov x3, 20
	mov x4, 12
	bl createRectangle

	//Creacion llave puerta
	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbf, lsl 0
	mov x1, 304
	mov x2, 343
	mov x3, 12
	mov x4, 20
	bl createRectangle

	//Creacion llave puerta
	movz x0, 0x0077, lsl 16
	movk x0, 0x7777, lsl 0
	mov x1, 304
	mov x2, 351
	mov x3, 12
	mov x4, 4
	bl createRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret


createArcadeScreen:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	//Creacion bordes negros
	movz x0, 0x0051, lsl 16
	movk x0, 0x4621, lsl 0
	mov x1, 86
	mov x2, 245
	mov x3,	106
	mov x4, 139
	bl createRectangle

	//Creacion bordes negros
	movz x0, 0x0072, lsl 16
	movk x0, 0x4526, lsl 0
	mov x1, 86
	mov x2, 246
	mov x3,	106
	mov x4, 137
	bl createRectangle

	//Creacion borde negro
	movz x0, 0x0042, lsl 16
	movk x0, 0x2d42, lsl 0
	mov x1, 87
	mov x2, 246
	mov x3,	104
	mov x4, 137
	bl createRectangle

	//Creacion parte del vidrio
	movz x0, 0x001d, lsl 16
	movk x0, 0xe9b6, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createRectangle

	//Creacion reflejo del vidrio
	movz x0, 0x009f, lsl 16
	movk x0, 0xedb8, lsl 0
	mov x1, 101
	mov x2, 258
	mov x3,	36
	mov x4, 36
	bl createRectangle

	//Creacion triangulo reflejo del vidrio
	movz x0, 0x001d, lsl 16
	movk x0, 0xe9b6, lsl 0
	mov x1, 125
	mov x2, 270
	mov x3, 12
	mov x4, 48
	mov x5, 0
	mov x6, 12
	mov x7, 2
	bl createTriangle

	//Creacion reflejo del vidrio
	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 101
	mov x2, 258
	mov x3,	10
	mov x4, 10
	bl createRectangle

	//Creacion reflejo del vidrio
	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 166
	mov x2, 260
	mov x3,	12
	mov x4, 88
	bl createRectangle

	//Creacion reflejo del vidrio
	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 154
	mov x2, 348
	mov x3,	24
	mov x4, 24
	bl createRectangle

	//Creacion reflejo del vidrio
	movz x0, 0x0021, lsl 16
	movk x0, 0xc59b, lsl 0
	mov x1, 115
	mov x2, 360
	mov x3,	39
	mov x4, 12
	bl createRectangle

	ldr x30, [sp]
	add sp, sp, 16
	ret


createArcade:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	bl createArcadeCase	
	bl createArcadeTop
	bl createArcadePanel
	bl createArcadeBottom
	bl createArcadeScreen

	ldr x30, [sp]
	add sp, sp, 16
	ret


static:
	sub sp, sp, 16
	str x30, [sp]

	bl createBackground
	mov x0, 0
	bl createLightKey
	bl createCable
	bl createPoster
	bl createArcade

	ldr x30, [sp]
	add sp, sp, 16
	ret

program:
	bl static

	movz x7, 0x8200, lsl 16
	movk x7, 0x4000, lsl 0
	bl delay

	dynamic:
		mov x0, 1
		bl createLightKey

		movz x7, 0x8200, lsl 16
		movk x7, 0x4000, lsl 0
		bl delay

		b program

