.globl dynamic
dynamic:

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
	parpadeoPantallaInfinito:
		bl parpadeoRaton
		
		movz x7, 0x00ff, lsl 16
		movk x7, 0xffff, lsl 0
		bl delay

		b parpadeoPantallaInfinito
