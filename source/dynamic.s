.include "data.s"
.include "utilities.s"

.globl dynamic
dynamic:

	bl createOnSwitcher
	
	bl mouseBlinking
	
	bl generateCurrent
	
	bl mouseBlinking
	
	bl powerOnScreen
	
	movz x7, 0x1000, lsl 16
	movk x7, 0x0000, lsl 0
	bl delay

	bl mouseBlinking
	
	bl transitionToTheGame
	
	bl breakSwitcher

	bl mouseBlinking
	
	mov x5, 27
	mov x9, 126
	infCycle:
		bl glitchScreen

		movz x7, 0x4000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay
		
		bl climbingPalm
		mov x1, x9
		bl climber

		movz x7, 0x2000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		bl glitchScreen

		movz x7, 0x4000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		bl climbingPalm
		sub x1, x9, x5
		bl climber

		movz x7, 0x2000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		bl glitchScreen

		movz x7, 0x4000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		bl climbingPalm
		add x1, x9, x5
		bl climber

		movz x7, 0x2000, lsl 16
		movk x7, 0x0, lsl 0
		bl delay

		sub x5, x5, 3
		cmp x5, 6
		bne continue
		reinit:
		mov x5, 27
		continue:
		

		b infCycle
