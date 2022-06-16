
.include "utilities.s"
.include "data.s"

.globl dynamic
dynamic:

	bl createOnSwitcher
	
	bl parpadeoRaton
	
	bl generateCurrent
	
	bl parpadeoRaton
	
	bl powerOnScreen
	
	movz x7, 0x1000, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	bl parpadeoRaton
	
	bl transitionToTheGame

	movz x7, 0x1000, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	bl parpadeoRaton

	bl parpadeoRaton
	
	bl breakSwitcher
	
	bl parpadeoRaton
	bl parpadeoRaton
	
	infCycle:
		bl parpadeoRaton
		
		movz x7, 0x00ff, lsl 16
		movk x7, 0xffff, lsl 0
		bl delay

		b infCycle
