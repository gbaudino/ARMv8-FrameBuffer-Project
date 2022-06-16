.include "data.s"
.include "utilities.s"

.globl main
main:
	bl config

program:
	bl static

	movz x7, 0x8200, lsl 16
	movk x7, 0x4000, lsl 0
	bl delay
	
	b dynamic

