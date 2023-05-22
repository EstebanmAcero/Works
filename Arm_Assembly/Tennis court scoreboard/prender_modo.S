//0x400043FC	 //A 	

			.syntax unified
			.text
			.global prender_modo
			.thumb_func


prender_modo:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			CMP		R1, #2
			BEQ		RESET
			MOV		R2, R0
			CMP		R2, #0
			BEQ		FIN2
			CMP		R2, #3
			BEQ		LED
			POP 	{PC}
		
FIN:			
			POP 	{PC}

RESET: 		
			LDR		R10, =0x400043FC	 //A
			MOV		R4 , #0X00
			STR		R4, [R10]
			B		FIN		
			
FIN2:			
			LDR		R10, =0x400043FC	 //A
			MOV		R4 , #0X00
			STR		R4, [R10]
			B		FIN
LED: 		
			LDR		R10, =0x400043FC	 //A
			MOV		R4 , #0X40
			STR		R4, [R10]
			B		FIN
	
		