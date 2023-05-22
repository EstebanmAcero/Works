			.syntax unified
			.text
			.global unir
			.thumb_func


#define 	DIG_1										0x20000100

unir:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			LDR		R7, =DIG_1
			MOV		R5, #10
			MUL		R4, R0, R5
			ADD		R4, R1
			STR		R4, [R7]
			MOV		R0, R4
			POP 	{PC}
			
			POP 	{PC}
			