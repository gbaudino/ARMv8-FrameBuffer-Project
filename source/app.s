.include "data.s"
.include "utilities.s"

.globl main
main:
	bl config

program:
	//Generamos el estatico
	bl static

	//Creamos un delay de un corto tiempo para
	//poder apreciar el estatico
	ldr x7, delay_start_dynamic
	bl delay
	
	//Saltamos a la imagen dinamica la cual
	//no retorna debido a que es infinita.
	b dynamic

