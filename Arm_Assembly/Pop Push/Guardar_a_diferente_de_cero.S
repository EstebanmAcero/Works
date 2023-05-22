
			.syntax unified
			.text
			.global Guardar_a_diferente_de_cero
			.thumb_func

#define		A		R0	
#define 	yu		0x20000000
Guardar_a_diferente_de_cero:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			LDR		R1, =yu
			LDR		R2, [R1]
			CMP		R0, #0
			BEQ		FIN
			CMP		R0, R2
			BEQ		FIN
			BNE		GUARDAR
		
			
FIN:		
			LDR		R1, =yu
			LDR		R2, [R1]
			MOV		R0,R2
			POP 	{PC}

GUARDAR:	
			AND     R0, 0x03
			STR		R0, [R1]
			//MOV		R0, R1  ESTO TOCA GUARDARLO EN UNA POSICION DE MEMORIA PARA QUE PUEDA SER INTERPRETADO Y LEDIO
			POP 	{PC}
			

			
		