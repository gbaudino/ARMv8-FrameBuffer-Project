.arch armv8.5-a+rng

.globl dynamic
dynamic:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]
	bl createOnSwitcher
	bl parpadeoRaton
	bl generateCurrent
	bl parpadeoRaton
	bl powerOnScreen
	bl parpadeoRaton
	bl transitionToTheGame
	bl parpadeoRaton
	bl breakSwitcher
	bl parpadeoRaton
	bl parpadeoRaton

	ldr x30, [sp]
	add sp, sp, 16
	ret
