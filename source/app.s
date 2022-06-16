.include "data.s"
.include "utilities.s"

.globl main
main:
	bl config

program:
	bl static

	ldr x7, delay_start_dynamic
	bl delay
	
	b dynamic

