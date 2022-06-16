
.include "utilities.s"
.include "data.s"

createArcadeBase:
	//Guardado registro return
	sub sp, sp, 8
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
	mov x4, 221
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 393
	add x1, x1, x5
	mov x2, 216
	add x2, x2, x5
	mov x3,	4
	mov x4, 197
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 397
	add x1, x1, x5
	mov x2, 212
	add x2, x2, x5
	mov x4, 205
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 401
	add x1, x1, x5
	mov x2, 208
	add x2, x2, x5
	mov x4, 213
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 425
	sub x1, x1, x5
	bl createVRectangle

	mov x1, 429
	sub x1, x1, x5
	mov x2, 212
	add x2, x2, x5
	mov x4, 205
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 433
	sub x1, x1, x5
	mov x2, 216
	add x2, x2, x5
	mov x4, 197
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createArcadeCase:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creacion triang1 borde blanco maq
	ldr x0, machine_white
	mov x1, 24
	mov x2, 221
	mov x3,	4
	mov x4, 12
	mov x5, 1
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle
	

	//Creacion triang2 borde cyan maq
	ldr x0, machine_cyan
	mov x2, 225
	mov x4, 8
	mov x7, 2
	bl createRectangleTriangle

	//Creacion triang3 borde blanco maq
	ldr x0, machine_white
	mov x2, 396
	mov x4, 12
	mov x5, 0
	mov x7, 3
	bl createRectangleTriangle
	

	//Creacion triang4 borde cyan maq
	ldr x0, machine_cyan
	mov x4, 8
	mov x7, 2
	bl createRectangleTriangle

	//Creacion bordes blancos maq
	ldr x0, machine_white
	mov x1, 16
	mov x2, 233
	mov x3,	13
	mov x4, 163
	bl createVRectangle

	//Creacion bordes blancos maq
	mov x1, 28
	mov x2, 221
	mov x3, 408
	mov x4, 187
	bl createVRectangle

	//Creacion bordes blancos panel
	mov x1, 229
	mov x2, 201
	mov x3, 4
	mov x4, 228
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	mov x1, 233
	mov x2, 197
	mov x3, 22
	mov x4, 236
	bl createVRectangle

	//Creacion bordes cyan panel
	ldr x0, machine_cyan
	mov x2, 201
	mov x3, 4
	mov x4, 228
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	//Creacion cuadrado  cyan panel
	mov x3, 22
	bl createVRectangle

	//Añadimos borde para terminar el detalle (izq)
	ldr x0, machine_white
	mov x1, 255
	mov x2, 197
	mov x3, 4
	mov x4, 28
	bl createVRectangle

	//Añadimos borde para terminar el detalle (der)
	mov x2, 405
	bl createVRectangle

	//Fix
	ldr x0, machine_cyan
	mov x1, 213
	mov x2, 221
	mov x3, 5
	mov x4, 187
	bl createVRectangle

	//Creacion blanco abajo
	ldr x0, machine_white
	mov x5, 0
	bl createArcadeBase

	//Creacion gris abajo
	ldr x0, machine_grey
	mov x5, 4
	bl createArcadeBase

	//Creacion interior cyan maq
	ldr x0, machine_cyan
	mov x1, 28
	mov x2, 225
	mov x3,	387
	mov x4, 179
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createNintendoLogo:
	//Guardado registro return
	sub sp, sp, 8
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
	bl createVRectangle

	mov x1, 30
	add x1, x1, x5
	mov x2, 244
	add x2, x2, x5
	mov x3,	2
	mov x4, 140
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 28
	add x1, x1, x5
	mov x2, 246
	add x2, x2, x5
	mov x3,	2
	mov x4, 136
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 26
	add x1, x1, x5
	mov x2, 248
	add x2, x2, x5
	mov x3,	2
	mov x4, 132
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 52
	sub x1, x1, x5
	mov x2, 244
	add x2, x2, x5
	mov x3,	2
	mov x4, 140
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 54
	sub x1, x1, x5
	mov x2, 246
	add x2, x2, x5
	mov x3,	2
	mov x4, 136
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	mov x1, 56
	sub x1, x1, x5
	mov x2, 248
	add x2, x2, x5
	mov x3,	2
	mov x4, 132
	sub x4, x4, x5
	sub x4, x4, x5
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createArcadeTop:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creacion interior amarillo claro maq
	ldr x0, machine_light_yellow
	mov x1, 19
	mov x2, 233
	mov x3,	185
	mov x4, 163
	bl createVRectangle

	//Creacion interior amarillo oscuro maq
	ldr x0, machine_dark_yellow
	mov x1, 64
	mov x3,	22
	bl createVRectangle

	//Creacion interior triang1 amarillo oscuro maq
	ldr x0, machine_light_yellow
	mov x1, 82
	mov x3,	4
	mov x4, 12
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createRectangleTriangle

	//Creacion interior triang2 amarillo oscuro maq
	mov x2, 384
	mov x5, 1
	bl createRectangleTriangle

	//Creacion interior amarillo oscuro maq
	ldr x0, machine_dark_yellow
	mov x1, 191
	mov x2, 245
	mov x3,	13
	mov x4, 139
	bl createVRectangle

	//Creacion interior triang3 amarillo oscuro maq
	mov x1, 200
	mov x2, 237
	mov x3,	4
	mov x4, 24
	mov x5, 0
	mov x6, 4
	mov x7, 3
	bl createTriangle

	//Creacion interior triang4 amarillo oscuro maq
	mov x1, 204
	mov x2, 372
	bl createTriangle

	//Creacion interior amarillo oscuro maq
	mov x2, 233
	mov x3,	9
	mov x4, 163
	bl createVRectangle

	//Parte roja logo nintendo
	ldr x0, frequent_red
	bl createNintendoLogo

	//Parte blanca logo nintendo
	ldr x0, machine_white
	mov x5, 2
	bl createNintendoLogo
	
	ldr x30, [sp]
	add sp, sp, 8
	br x30


createArcadePanel:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creacion panel
	movz x0, 0x0026, lsl 16
	movk x0, 0x3b59, lsl 0
	mov x1, 229
	mov x2, 213
	mov x3, 4
	mov x4, 203
	mov x5, 0
	mov x6, 4
	mov x7, 5
	bl createTriangle

	//Creacion cuadrado amarillo panel
	ldr x0, machine_light_yellow
	mov x1, 233
	mov x2, 209
	mov x3, 22
	mov x4, 212
	bl createVRectangle

	//Aca empiezan los detalles del panel
	//INICIO BOTONES AZULES
	ldr x0, panel_blue
	mov x1, 218
	mov x2, 238
	mov x3, 4
	mov x4, 20
	bl createVRectangle

	mov x1, 222
	mov x2, 235
	bl createVRectangle
	//FIN BOTONES AZULES

	//INICIO BOTONES ROJOS
	ldr x0, frequent_red
	mov x1, 218
	mov x2, 266
	bl createVRectangle

	mov x1, 222
	mov x2, 262
	bl createVRectangle
	//FIN BOTONES ROJOS

	//INICIO BASE CONTROLADOR
	ldr x0, panel_blue
	mov x1, 213
	mov x2, 308
	mov x3, 13
	mov x4, 20
	bl createVRectangle

	mov x1, 217
	mov x2, 305
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	mov x2, 328
	bl createVRectangle
	//FIN BASE DEL CONTROLADOR

	//INICIO PAlANCA
	movz x0, 0x00ec, lsl 16
	movk x0, 0xfbef, lsl 0
	mov x1, 207
	mov x2, 317
	mov x3, 13
	bl createVRectangle

	movz x0, 0x00fb, lsl 16
	movk x0, 0x3e41, lsl 0
	mov x1, 200
	mov x2, 313
	mov x3, 7
	mov x4, 12
	bl createVRectangle
	//FIN PALANCA

	//BOTONES DERECHA
	mov x1, 221
	mov x2, 365
	mov x3, 4
	mov x4, 9
	bl createVRectangle

	ldr x0, panel_blue
	mov x2, 380
	bl createVRectangle

	//FIN BOTONES
	
	movz x0, 0x005f, lsl 16
	movk x0, 0x4d84, lsl 0
	mov x1, 213
	mov x2, 412
	bl createVLine


	ldr x30, [sp]
	add sp, sp, 8
	br x30


createArcadeBottom:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creacion amarillo oscuro
	ldr x0, machine_dark_yellow
	mov x1, 255
	mov x2, 233
	mov x3,	160
	mov x4, 163
	bl createVRectangle

	//Creacion linea abajo amarillo claro
	ldr x0, machine_light_yellow
	mov x1, 384
	mov x3,	4
	bl createVRectangle

	//Creacion linea abajo amarillo claro
	mov x1, 275
	mov x2, 248
	mov x3,	109
	mov x4, 4
	bl createVRectangle

	//Creacion linea abajo amarillo claro
	mov x2, 376
	bl createVRectangle

	//Creacion linea abajo amarillo claro
	mov x1, 267
	mov x2, 256
	mov x3,	4
	mov x4, 116
	bl createVRectangle

	//Creacion triangulo abajo amarillo claro
	mov x1, 271
	mov x2, 252
	mov x4, 4
	bl createVRectangle

	//Creacion triangulo abajo amarillo claro
	mov x2, 372
	bl createVRectangle

	//Creacion llave puerta
	movz x0, 0x00bf, lsl 16
	movk x0, 0xbfbf, lsl 0
	mov x1, 300
	mov x2, 347
	mov x3, 20
	mov x4, 12
	bl createVRectangle

	//Creacion llave puerta
	mov x1, 304
	mov x2, 343
	mov x3, 12
	mov x4, 20
	bl createVRectangle

	//Creacion llave puerta
	movz x0, 0x0077, lsl 16
	movk x0, 0x7777, lsl 0
	mov x2, 351
	mov x4, 4
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


createArcadeScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creacion bordes negros
	movz x0, 0x0051, lsl 16
	movk x0, 0x4621, lsl 0
	mov x1, 86
	mov x2, 245
	mov x3,	106
	mov x4, 139
	bl createVRectangle

	//Creacion bordes negros
	movz x0, 0x0072, lsl 16
	movk x0, 0x4526, lsl 0
	mov x2, 246
	mov x4, 137
	bl createVRectangle

	//Creacion borde negro
	movz x0, 0x0042, lsl 16
	movk x0, 0x2d42, lsl 0
	mov x1, 87
	mov x3,	104
	bl createVRectangle

	bl powerOffScreen

	ldr x30, [sp]
	add sp, sp, 8
	br x30

.globl createArcade
createArcade:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

    bl createOffWire
	bl createArcadeCase	
	bl createArcadeTop
	bl createArcadePanel
	bl createArcadeBottom
	bl createArcadeScreen

	ldr x30, [sp]
	add sp, sp, 8
	br x30
