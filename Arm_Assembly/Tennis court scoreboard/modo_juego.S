			.syntax unified
			.text
			.global modo_juego
			.thumb_func

#define 	modo_juego_k    		0X20000038



modo_juego:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			CMP		R0, #0
			BEQ		FIN
			CMP		R0, #1
			BEQ		GANA_3_DE_5
			CMP		R0, #2
			BEQ		FIN
			CMP		R0, #4
			BEQ		FIN
			CMP		R0, #8
			BEQ		FIN
			/*
			LDR		R12, =modo_juego_k
			MOV		R11, #2
			STR		R11, [R12]
			MOV		R0 , R11
*/
			POP 	{PC}
			
FIN:
			LDR		R12, =modo_juego_k
			LDR		R11, [R12]
			MOV		R0 , R11
			POP 	{PC}
			
GANA_3_DE_5:

			LDR		R12, =modo_juego_k
			MOV		R11, #3
			STR		R11, [R12]
			MOV		R0 , R11
			B		FIN