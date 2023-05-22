

			.syntax unified
			.text
			.global dividir_ascendete
			.thumb_func


dividir_ascendete:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			CMP		R0, #10
			BHS		dividir
			MOV		R0, #0
			POP 	{PC}   					/* retorno   */
		
dividir:
			MOV		R3, #10
			UDIV	R0,R0, R3
			POP 	{PC}   					/* retorno   */
			


		