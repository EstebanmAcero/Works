
			.syntax unified
			.text
			.global leer_1
			.thumb_func

#define		GPIO_PORTF_DATA_R	R0	

leer_1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			LDR     R1, [R0]
			AND     R1, 0x0C
			MOV		R0, R1
			POP 	{PC}

			
			