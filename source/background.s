.include "data.s"
.include "utilities.s"

.globl createBackground
createBackground:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Pared
	ldr x0, purple_wall
	mov x1, 0
	mov x2, 0
	mov x3, 397
	mov x4, x21
	bl createVRectangle

	//Suelo
	ldr x0, light_brown_floor
	mov x1, x3
	mov x3, 83
	bl createVRectangle

	//Cueva raton
	ldr x0, dark_grey_cave
	mov x5, 0
	bl createMouseCave

	//Cueva raton
	ldr x0, black
	mov x5, 2
	bl createMouseCave
   	bl createMouseEyes

    //Enchufe Maquina
    ldr x0, light_grey_socket
	mov x1, 310
	mov x2, 515
	mov x3,	18
	mov x4, 27
	bl createVRectangle

	mov x1, 306
	mov x2, 519
	mov x3,	26
	mov x4, 19
	bl createVRectangle

   	mov x0, 0
    bl createOffSwitcher
    
    bl createPoster

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 8
	br x30
