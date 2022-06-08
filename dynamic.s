.globl dynamic
dynamic:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	mov x0, 1
	bl createLightKey
	bl parpadeoRaton
	movz x7, 0x8200, lsl 16
	movk x7, 0x4000, lsl 0
	bl delay
	bl parpadeoRaton

	ldr x30, [sp]
	add sp, sp, 16
	ret
