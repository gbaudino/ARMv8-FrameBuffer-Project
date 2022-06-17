.include "data.s"
.include "utilities.s"

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
	
	bl breakSwitcher

	bl parpadeoRaton
	
	
	
	infCycle:
		bl glitchScreen

		movz x7, 0x4000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		bl climbingDonkey

		bl parpadeoRaton
		
		

		b infCycle
