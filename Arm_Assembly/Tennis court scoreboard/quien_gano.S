			.syntax unified
			.text
			.global quien_gano
			.thumb_func
// k, l,modo_juego
quien_gano:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			MOV		R5, R0
			MOV		R6, R1
			MOV		R7, R2
			
			CMP		R5, #0
			BEQ		juego_dos_de_tres
			CMP		R5, #1
			BEQ		juego_tres_de_cinco
			
			POP 	{PC}
		

FIN:
			POP 	{PC}
juego_dos_de_tres:
			CMP		R6, #2
			BEQ		GANO_1
			CMP		R7, #2
			BEQ		GANO_2
			B		FIN
juego_tres_de_cinco:
			CMP		R7, #3
			BEQ		GANO_11
			CMP		R7, #3
			BEQ		GANO_22
			B		FIN
			
GANO_1:
			CMP		R7, #0
			ITT		EQ	
			MOVEQ	R0, #1
			BEQ		FIN
			CMP		R7, #1
			ITT		EQ	
			MOVEQ	R0, #1
			BEQ		FIN		
GANO_2:
			CMP		R6, #0
			ITT		EQ	
			MOVEQ	R0, #1
			BEQ		FIN
			CMP		R6, #1
			ITT		EQ	
			MOVEQ	R0, #1
			BEQ		FIN
			
GANO_11:
			CMP		R7, #0
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN
			CMP		R7, #1
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN	
			CMP		R7, #2
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN				
GANO_22:
			CMP		R6, #0
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN
			CMP		R6, #1
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN
			CMP		R7, #2
			ITT		EQ	
			MOVEQ	R0, #2
			BEQ		FIN	