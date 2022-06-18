.include "data.s"
.include "utilities.s"

.globl dynamic
dynamic:

	bl createOnSwitcher
	
	bl generateCurrent
	
	bl mouseBlinking
	
	bl powerOnScreen
	
	ldr x7, delay_dynamic_short
	bl delay

	bl mouseBlinking
	
	bl transitionToTheGame
	
	bl mouseBlinking

	bl breakSwitcher
	
	mov x5, 27
	mov x9, 126
	infCycle:
		bl glitchScreen

		ldr x7, delay_dynamic_long
		bl delay
		
		bl climbingPalm
		mov x1, x9
		bl climber

		ldr x7, delay_dynamic_medium
		bl delay

		bl glitchScreen

		ldr x7, delay_dynamic_long
		bl delay

		bl climbingPalm
		sub x1, x9, x5
		bl climber

		ldr x7, delay_dynamic_medium
		bl delay

		bl glitchScreen

		ldr x7, delay_dynamic_long
		bl delay

		bl climbingPalm
		add x1, x9, x5
		bl climber

		ldr x7, delay_dynamic_medium
		bl delay

		sub x5, x5, 3
		cmp x5, 6
		bne continue
		reinit:
		mov x5, 27
		continue:

		b infCycle
