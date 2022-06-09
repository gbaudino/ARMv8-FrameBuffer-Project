.globl dynamic
dynamic:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	mov x0, 1
	bl createLightKey
	bl parpadeoRaton
	bl generateCurrent
	bl parpadeoRaton
	bl powerOnScreen
	

	ldr x30, [sp]
	add sp, sp, 16
	ret
