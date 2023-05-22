			.syntax unified
			.text
			.global reinicio_games_6
			.thumb_func
// r0 el player 1
// r1 es player 2
#define 	GAME			0x2000002C
#define 	GAME_1			0x20000030   
#define 	GUARDAR_R0      0X20000034

reinicio_games_6:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			// Aca lo que hace falta es las condiciones para que se gane con 2 putnos de difernecia
			// toca revisar bien lo que es refernte con los games ya despues se envia a otra varible para almacenar 
			// sets
			
			LDR		R10, =GUARDAR_R0
			STR		R0 , [R10]
			
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R4 , R0, R10		// R0 = UNIDADES DE JUGADOR 1
			MUL		R4 , R4, R10		
			SUB		R0 , R4
			
			LDR		R10, =GAME			// SE GUARDAN LOS GAMES DE JUGADOR 1
			STR		R0 , [R10]
			
			LDR		R9 , =GUARDAR_R0  	// SE VUELVEN A CARGAR LO QUE VENIA DE LA FUNCION EN C
			LDR		R8 , [R9]
			MOV		R1 , R8
			
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R1 , R1, R10		// R4 = DECENAS
			LDR		R10, =GAME_1
			STR		R1 , [R10]
			
			
			MOV		R4, R0
			MOV		R5, R1

			CMP		R4,#6
			BHS		GANA_1_CON_6
			CMP		R5,#6
			BHS		GANA_2_CON_6
			POP 	{PC}
		
GANA_1_CON_6:
			CMP		R5, #4
			BHI		GANA_1_CON_8
			
			CMP		R5,#4
			IT		LS
			MOVLS	R0, #10
			B		FIN

GANA_2_CON_6:

			CMP		R4, #4
			BHI		GANA_2_CON_8
			
			CMP		R4,#4
			IT		LS
			MOVLS	R0, #20
			B		FIN
FIN:
			POP 	{PC}


GANA_1_CON_8:
			CMP		R4, #8
			BEQ		GANA_1_CON_8_1
			CMP		R4, #7
			BEQ		GANA_1_CON_8_2
			CMP		R4, #6
			BEQ		GANA_1_CON_8_0
			B		FIN

GANA_1_CON_8_1:
			CMP		R5,#6
			IT		LS
			MOVLS	R0, #10
			B		FIN
			
GANA_1_CON_8_2:
			CMP		R5,#5
			ITT		LS
			MOVLS	R0, #10
			BLS		FIN
			CMP		R5,#6
			ITT		EQ
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R5,#7   // ACA TOCA HACER LA CONDICION DEL RESET
			ITT		EQ
			MOVEQ	R0, #30
			BEQ		FIN
			
GANA_1_CON_8_0:
			CMP		R5,#5			// recordar que esto se da porque no lleva dos puntos de ventaja y es lo
									// necesario para ganar
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R5,#6
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R5,#7
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R5,#8
			ITT		EQ	
			MOVEQ	R0, #20
			BEQ		FIN

			

			

			
GANA_2_CON_8:
			CMP		R5, #8
			BEQ		GANA_2_CON_8_1
			CMP		R5, #7
			BEQ		GANA_2_CON_8_2
			CMP		R5, #6
			BEQ		GANA_2_CON_8_0
			B		FIN
GANA_2_CON_8_0:
			CMP		R4,#5
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R4,#6
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R4,#7
			ITT		EQ	
			MOVEQ	R0, #00
			BEQ		FIN
			CMP		R4,#8
			ITT		EQ	
			MOVEQ	R0, #10
			BEQ		FIN
GANA_2_CON_8_2:
			CMP		R4,#5
			ITT		LS
			MOVLS	R0, #20
			BLS		FIN
			CMP		R4,#6
			ITT		LS
			MOVLS	R0, #00
			BLS		FIN
			CMP		R4,#7
			ITT		LS
			MOVLS	R0, #30
			BLS		FIN

GANA_2_CON_8_1:
			CMP		R4,#6
			IT		LS
			MOVLS	R0, #20
			B		FIN