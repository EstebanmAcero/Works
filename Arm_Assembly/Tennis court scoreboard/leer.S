
			.syntax unified
			.text
			.global leer
			.thumb_func

#define		GPIO_PORTF_DATA_R	R0	

leer:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			LDR     R2, [R0]
			MOV		R0, R2
			POP 	{PC}
		
			
			

			
		