
			.syntax unified
			.text
			.global dividir_unidades
			.thumb_func


dividir_unidades:	
			PUSH 	{LR}  					/* guaRdamos la diReccion de RetoRno en la pila */
			CMP		R0, #9
			BLS		salto
			B		unidades
			POP 	{PC}   					/* RetoRno   */
		
salto:
			
			POP 	{PC}   					/* RetoRno   */
			
unidades:
			MOV 	R1, #10        
			MOV 	R2, #0        
			MOV 	R3, R0         
			UDIV 	R3, R3, R1    
			MUL 	R2, R3, R1     
			SUB 	R0, R0, R2    
			B		salto