.globl createLightKey
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


.globl createBackground
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
   	bl createRatonEyes


	//Semicirculo cueva raton
	

    //Enchufe Maquina
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

   	mov x0, 0
    bl createLightKey
    
    bl createPoster

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret
