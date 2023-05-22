			.syntax unified
			.text
			.global dividir_as
			.thumb_func


dividir_as:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			CMP		R0, #9
			BHI		ALA
			
			MOV		R0, #0
			POP 	{PC}   					/* retorno   */
		
ALA:
			ITTTT		HS
			MOVHS 	R1, #10        
			MOVHS 	R3, R0         
			UDIVHS 	R3, R3, R1 
			MOVHS	R0, R3
			POP 	{PC}   					/* retorno   */


		