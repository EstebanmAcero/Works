			.syntax unified
			.text
			.global marcador_set_1
			.thumb_func
// r0 si es 10 set para jugador 1 si es 20 set para jugador 2

#define 	set				0x20000054

marcador_set_1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			MOV		R4, R0
			CMP		R4,#0
			BEQ		FIN
			CMP		R4,#20
			BEQ		GANA_1_CON_6
			LDR		R5, = set
			LDR		R6, [R5]
			MOV		R0,	R6
			POP 	{PC}
GANA_1_CON_6:
			LDR		R5, = set
			LDR		R6, [R5]
			ADD		R6, #1
			STR		R6, [R5]
			MOV		R0,	R6
			B		FIN
FIN:		

			LDR		R5, = set
			LDR		R6, [R5]
			MOV		R0,	R6
			POP 	{PC}
