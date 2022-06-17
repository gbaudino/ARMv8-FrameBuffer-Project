.include "data.s"
.include "utilities.s"


logoD:
	//Guardado registro 
	sub sp, sp, 8
	str x30, [sp]


	// Input values:
	    // - x0:    Color Base
		// - x5:	Desplazamiento
	
	//PALO IZQUIERDO
	mov x1, 110
	add x1, x1, x5
	mov x2, 290
	add x2, x2, x5
	mov x3, 35
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//Parte superior D ⁻⁻
	mov x1, 110
	add x1, x1, x5
	mov x2, 298
	mov x3, 11
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	//PARTE INFERIOR D __
	mov x1, 134
	add x1, x1, x5
	mov x2, 298
	mov x3, 11
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle
	//PARTE DEL MEDIO
	mov x1, 120
	add x1, x1, x5
	mov x2, 306
	mov x3, 14
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


logoK:
	//Guardado registro br x30
	sub sp, sp, 8
	str x30, [sp]

	
	//PALO IZQUIERDO |
	mov x1, 110
	add x1, x1, x5
	mov x2, 315
	add x2, x2, x5
	mov x3, 35
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//RAIZ CENTRO
	mov x1,123
	add x1, x1, x5
	mov x3, 16
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 12
	sub x4, x4, x5
	bl createVRectangle

	//RAMITA DE ARRIBA
	mov x1,110
	add x1, x1, x5	
	mov x2, 325
	add x2, x2, x5
	mov x3, 18
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//RAMITA DE ABAJO
	mov x1,129
	add x1, x1, x5	
	mov x3, 16
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30



logoInsertCoin:
	//Guardado registro br x30
	sub sp, sp, 8
	str x30, [sp]

	//INPUT
		//X0 = Color 
		//X5 = Desplazamiento


	//Sombrero I
	mov x1, 170
	add x1, x1, x5
	mov x2, 260
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 6
	sub x4, x4, x5
	bl createHRectangle


	//PALO I
	mov x2, 262
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//BASE I
	mov x1, 180
	add x1, x1, x5
	mov x2, 260
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 6
	sub x4, x4, x5
	bl createHRectangle


	//PALO N
	mov x1, 170
	add x1, x1, x5
	mov x2, 268
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//MEDIO N
	mov x2, 270
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	mov x1, 173
	add x1, x1, x5
	mov x2, 272
	add x2, x2, x5
	bl createVRectangle

	mov x1, 176
	add x1, x1, x5
	mov x2, 274
	add x2, x2, x5
	bl createVRectangle

	//Palo der N
	mov x1, 170
	add x1, x1, x5
	mov x2, 276
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	//sombrerito S
	mov x2, 281
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//sombrerito S
	mov x1, 171
	add x1, x1, x5
	mov x2, 285
	add x2, x2, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//Primer palo S
	mov x1, 172
	add x1, x1, x5
	mov x2, 279
	add x2, x2, x5
	bl createVRectangle

	//Panza S
	mov x1, 175
	add x1, x1, x5
	mov x2, 281
	add x2, x2, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//Segundo palo S
	mov x1, 176
	add x1, x1, x5
	mov x2, 285
	add x2, x2, x5
	mov x3, 6
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle


	//Base S
	mov x1, 180
	add x1, x1, x5
	mov x2, 281
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//Redondeo base S
	mov x1, 179
	add x1, x1, x5
	mov x2, 280
	add x2, x2, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle


	//PALO E
	mov x1, 170
	add x1, x1, x5
	mov x2, 289
	add x2, x2, x5
	mov x3, 12
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	//Primer palo E
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 6
	sub x4, x4, x5
	bl createVRectangle

	//Segundo palo E
	mov x1, 175
	add x1, x1, x5
	bl createVRectangle

	//Tercer palo E
	mov x1, 180
	add x1, x1, x5
	bl createVRectangle



	//Tronco R
	mov x1, 170
	add x1, x1, x5
	mov x2, 297
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//Sombrerito R
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//Palo der R
	mov x2, 303
	add x2, x2, x5
	mov x3, 8
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//Panza R
	mov x1, 176
	add x1, x1, x5
	mov x2, 297
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//PATA R
	mov x1, 177
	add x1, x1, x5
	mov x2, 299
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 178
	add x1, x1, x5
	mov x2, 301
	add x2, x2, x5
	bl createVRectangle

	mov x1, 180
	add x1, x1, x5
	mov x2, 303
	add x2, x2, x5
	bl createVRectangle


	//Sombrero T
	mov x1, 170
	add x1, x1, x5
	mov x2, 307
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 8
	sub x4, x4, x5
	bl createVRectangle

	//Tronco T
	mov x2, 310
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle


	//Tronco C
	mov x2, 324
	add x2, x2, x5
	mov x3, 12
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	//Panza arriba C
	mov x2, 325
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//Redondeo Panza C
	mov x1, 171
	add x1, x1, x5
	mov x2, 329
	add x2, x2, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//Base C
	mov x1, 180
	add x1, x1, x5
	mov x2, 325
	add x2, x2, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//Redondeo base C
	mov x1, 179
	add x1, x1, x5
	mov x2, 329
	add x2, x2, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//Izq O
	mov x1, 171
	add x1, x1, x5
	mov x2, 334
	add x2, x2, x5
	mov x3, 11
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	//Der O
	mov x2, 339
	add x2, x2, x5
	bl createVRectangle

	//Panza arriba O
	mov x1, 170
	add x1, x1, x5
	mov x2, 335
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 5
	sub x4, x4, x5
	bl createVRectangle

	//Base O
	mov x1, 180
	add x1, x1, x5
	bl createVRectangle

	//Sombrero I
	mov x1, 170
	add x1, x1, x5
	mov x2, 343
	add x2, x2, x5
	mov x4, 6
	sub x4, x4, x5
	bl createHRectangle


	//PALO I
	mov x2, 345
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//BASE I
	mov x1, 180
	add x1, x1, x5
	mov x2, 343
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 6
	sub x4, x4, x5
	bl createHRectangle

	//PALO N
	mov x1, 170
	add x1, x1, x5
	mov x2, 351
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	mov x4, 2
	sub x4, x4, x5
	bl createVRectangle

	//MEDIO N
	mov x2, 353
	add x2, x2, x5
	mov x3, 3
	sub x3, x3, x5
	sub x3, x3, x5

	bl createVRectangle

	mov x1, 173
	add x1, x1, x5
	mov x2, 354
	add x2, x2, x5
	bl createVRectangle

	mov x1, 176
	add x1, x1, x5
	mov x2, 356
	add x2, x2, x5
	bl createVRectangle

	//Palo der N
	mov x1, 170
	add x1, x1, x5
	mov x2, 358
	add x2, x2, x5
	mov x3, 13
	sub x3, x3, x5
	sub x3, x3, x5
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl logoDK
logoDK:
		//Guardado registro ret
	sub sp, sp, 8
	str x30, [sp]

	//Creacion fondo
	ldr x0, black
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	//Fondo D
	movz x0, 0x00c4, lsl 16
	movk x0, 0x0424, lsl 0
	mov x5, 0
	bl logoD

	//Capa intermedia D
	movz x0, 0x00ff, lsl 16
	movk x0, 0xc107, lsl 0
	mov x5, 1
	bl logoD

	//Capa superior D
	movz x0, 0x00c4, lsl 16
	movk x0, 0x0424, lsl 0
	mov x5, 2
	bl logoD

	//Fondo K
	movz x0, 0x00c4, lsl 16
	movk x0, 0x0424, lsl 0
	mov x5, 0
	bl logoK

	//Capa intermedia K
	movz x0, 0x00ff, lsl 16
	movk x0, 0xc107, lsl 0
	mov x5, 1
	bl logoK

	//Capa superior K
	movz x0, 0x00c4, lsl 16
	movk x0, 0x0424, lsl 0
	mov x5, 2
	bl logoK

	bl showInsertCoin

	mov x7, 4
	bl insertCoinBlinking

	ldr x30, [sp]
	add sp, sp, 8
	br x30

hideInsertCoin:
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo
	
	ldr x0, black
	mov x1, 170
	mov x2, 260
	mov x3, 20
	mov x4, 100
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30

showInsertCoin:
	sub sp, sp, 8
	str x30, [sp]

	//Fondo InsertCoin
	movz x0, 0x00c4, lsl 16
	movk x0, 0x0424, lsl 0
	mov x5,0
	bl logoInsertCoin

	//Capa superior InsertCoin
	movz x0, 0x00ff, lsl 16
	movk x0, 0xc107, lsl 0
	mov x5,1
	bl logoInsertCoin

	ldr x30, [sp]
	add sp, sp, 8
	br x30


insertCoinBlinking:
	//Guardado registro ret
	sub sp, sp, 16
	str x30, [sp, 8]
	str x9, [sp]

	mov x9, x7

	loop: 
		bl hideInsertCoin
		movz x7, 0x2000, lsl 16
		movk x7, 0x0000, lsl 0
	    bl delay
		bl showInsertCoin
		movz x7, 0x2000, lsl 16
		movk x7, 0x0000, lsl 0
		bl delay
		subs x9, x9, 1
		b.ne loop

	ldr x9, [sp]
	ldr x30, [sp, 8]
	add sp, sp, 16
	br x30

