.globl static
static:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	bl createBackground
	bl createArcade

	ldr x30, [sp]
	add sp, sp, 16
	ret
