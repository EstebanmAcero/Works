
			.syntax unified
			.text
			.global leer
			.thumb_func

#define		GPIO_PORTF_DATA_R	R0	

leer:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
		/*	LDR     R1, [R0]
			AND     R1, 0x03
			MOV		R0, R1  // esta mov lo que manda es el dato que se guardo en r1 por lo que sin este se manda es la posicion de r0
			//STR		R2, [R0] 
			POP 	{PC}
			*/
			LDR     R1, [R0]
			AND     R1, 0x03
			MOV		R0, R1
			POP 	{PC}
			
			

			
		