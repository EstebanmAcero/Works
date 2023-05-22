			.syntax unified
			.text
			.global contador_1
			.thumb_func

#define 	punto_jugador_1			0x20000000
#define 	punto_jugador_2			0x20000004
#define 	reset_delay				0x20000008

#define 	game_jugador_1			0x2000000C
#define 	game_jugador_2			0x20000010
#define 	set_jugador_1			0x20000014
#define 	set_jugador_2			0x20000018

contador_1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
// RESET PARA LOS GAMES
			CMP		R1, #10
			BEQ		REINICIO_GAMES
			CMP		R1, #20
			BEQ		REINICIO_GAMES
			CMP		R1, #30
			BEQ		GAMES_66
			
			LDR		R12, =reset_delay
			LDR		R10, [R12]
			CMP		R10, #1
			BEQ		RESET_1
			
			
			
			BL		es_41_41
			
JA:			
			CMP		R0, #4
			BEQ		jugador_uno
			
			CMP		R0, #8
			BEQ		jugador_dos
			
			BL		mandar_valor
			POP 	{PC}
FIN:		
			POP 	{PC}
jugador_uno:
			LDR		R3, =punto_jugador_1
			LDR		R2, [R3]
			B		sumar
jugador_dos:
			LDR		R3, =punto_jugador_2
			LDR		R2, [R3]
			B		sumar
sumar:			
			CMP		R2, #0
			ITTT		EQ
			ADDEQ	R2, #15
			STREQ	R2, [R3]
			BEQ		comparar
			
			CMP		R2, #15
			ITTT		EQ
			ADDEQ	R2, #15
			STREQ	R2, [R3]
			BEQ		comparar
			
			CMP		R2, #30
			ITTT		EQ
			ADDEQ	R2, #10
			STREQ	R2, [R3]
			BEQ		comparar
			
			CMP		R2, #40
			ITTT		EQ
			ADDEQ	R2, #1
			STREQ	R2, [R3]
			BEQ		comparar
			
			CMP		R2, #41
			ITTT		EQ
			ADDEQ	R2, #1
			STREQ	R2, [R3]
			BEQ		comparar
			
			MOV		R0, R2
			STR		R2, [R3]
			B		FIN
comparar:
			LDR		R3, =punto_jugador_1
			LDR		R2, [R3]
			LDR		R4, =punto_jugador_2
			LDR		R5, [R4]
	
			CMP		R2, #42
			BEQ		gana_o_no_42

			CMP		R5, #42
			BEQ		gana_o_no_1_42
			
			CMP		R2, #41
			BEQ		gana_o_no_41

			CMP		R5, #41
			BEQ		gana_o_no_1_41
			
			CMP		R2, #40
			BEQ		gana_o_no

			CMP		R5, #40
			BEQ		gana_o_no_1	
			
			BL		mandar_valor
			B		FIN

gana_o_no_42:			
			CMP		R5, #40
			BEQ		GANA_1
			
gana_o_no_1_42:			
			CMP		R2, #40
			BEQ		GANA_2
			
			
gana_o_no_41:
			CMP		R5, #30
			BEQ		GANA_1					// aca es el condicional para ver si gana por lo que tiene que ganar por 2 puntos
			CMP		R5, #40
			BEQ		puntos_40
			CMP		R5, #41
			BEQ		puntos_40
			
gana_o_no_1_41:
			CMP		R2, #30
			BEQ		GANA_2					// aca es el condicional para ver si gana por lo que tiene que ganar por 2 puntos
			CMP		R2, #40
			BEQ		puntos_40
			CMP		R2, #41
			BEQ		puntos_40
			
GANA_1:		
			LDR		R12, =game_jugador_1
			LDR		R11, [R12]
			MOVW	R9, #0X00
			MOVT    R9, #0X01
			ADD		R11, R9
			STR		R11, [R12]
			
			LDR		R12, =game_jugador_2
			LDR		R10, [R12]
			ADD		R11, R10
			MOV		R0, R11

			BEQ		RESET
GANA_2:			
			LDR		R12, =game_jugador_2
			LDR		R11, [R12]
			MOVW	R9, #0X00
			MOVT    R9, #0X10
			ADD		R11, R9
			STR		R11, [R12]
			
			LDR		R12, =game_jugador_1
			LDR		R10, [R12]
			ADD		R11, R10
			MOV		R0 , R11
			
		 // ACA LE PONEMOS 1 Y LUEGO CERO PARA QUE SE ALCANCE A VISUALIZAR LOS NUNERO 
		 // COMO MOV 1 MOSTRAR LUEGO ARRIBA LOS MANDAMOS ACA PERO CON UN CERO PARA RESETEAR Y VOLVER A COMENZAR

			BEQ		RESET

gana_o_no:
			CMP		R5, #0
			IT		EQ	// esta situacion es porque gana
			BEQ		GANA_1

			CMP		R5, #15
			IT		EQ	// esta situacion es porque gana
			BEQ		GANA_1
			
			CMP		R5, #30
			BEQ		puntos_30	// aca es el condicional para ver si gana por lo que tiene que ganar por 2 puntos
			
			CMP		R5, #40
			BEQ		puntos_40
			
			CMP		R5, #42
			BEQ		puntos_40
			
gana_o_no_1:
			CMP		R2, #0
			IT		EQ	// esta situacion es porque gana
			BEQ		GANA_2

			CMP		R2, #15
			IT		EQ	// esta situacion es porque gana
			BEQ		GANA_2
			
			CMP		R2, #30
			BEQ		puntos_30					// aca es el condicional para ver si gana por lo que tiene que ganar por 2 puntos
			
			CMP		R2, #40
			BEQ		puntos_40
			
			CMP		R2, #42
			BEQ		puntos_40
			// toca aca crear la condicion cuando r2 es 42 
			// o no permitir que pase aca 
puntos_30:
			BL		mandar_valor
			B		FIN
			
puntos_40:
			BL		mandar_valor
			B		FIN
RESET:
			LDR		R12, =reset_delay
			MOV		R9 , #1
			STR		R9 , [R12]
			
			BL		mandar_valor		
			BEQ		FIN
			
RESET_1:
			LDR		R12, =reset_delay
			MOV		R9 , #0
			STR		R9 , [R12]
			
			LDR		R12, =game_jugador_1
			LDR		R11, [R12]
			LDR		R9 , =game_jugador_2
			LDR		R10, [R9]
			ADD		R11, R10
			
			LDR		R3 , =punto_jugador_1
			MOV		R4 , #0
			STR		R4 , [R3]
			LDR		R4 , =punto_jugador_2
			MOV		R2 , #0
			STR		R2 , [R4]
			
			
			ADD		R0 , R11
			BEQ		FIN
			
mandar_valor:
			//algo que me toca hacer aca es que tambien mande los games de cada jugador y los set 
			//para eso necesito mas posiciones de memorias
			LDR		R12, =game_jugador_1
			LDR		R11, [R12]
			LDR		R9, =game_jugador_2
			LDR		R10, [R9]
			ADD		R11, R10
			LDR		R3 , =punto_jugador_1
			LDR		R2 , [R3]
			LDR		R4 , =punto_jugador_2
			LDR		R5 , [R4]
			MOV		R1 , R2
			MOV 	R0 , R1, LSL #8      // Desplaza el registro R1 hacia la izquierda 8 bits
			ADD		R0 , R5
			ADD		R0 , R11
			
			BX		LR
			
			
es_41_41:			
			LDR		R3, =punto_jugador_1
			LDR		R2, [R3]
			LDR		R4, =punto_jugador_2
			LDR		R5, [R4]
			
			CMP		R2, #41
			BEQ		es_41_42
			CMP		R5, #41
			BEQ		es_41_43
			
			BX		LR

es_41_42:
			CMP		R5, #41
			ITTTT		EQ
			MOVEQ	R9, #40
			STREQ	R9, [R3]
			STREQ	R9, [R4]
			BEQ		mandar_valor
			B		JA
			
es_41_43:
			CMP		R2, #41
			ITTTT		EQ
			MOVEQ	R9, #40
			STREQ	R9, [R3]
			STREQ	R9, [R4]
			BEQ		mandar_valor
			B		JA

/*
mandar_valor_1:
			//algo que me toca hacer aca es que tambien mande los games de cada jugador y los set 
			//para eso necesito mas posiciones de memorias
			LDR		R12, =game_jugador_1
			LDR		R11, [R12]
			LDR		R9, =game_jugador_2
			LDR		R10, [R9]
			ADD		R11, R10
			LDR		R3 , =punto_jugador_1
			LDR		R2 , [R3]
			LDR		R4 , =punto_jugador_2
			LDR		R5 , [R4]
			MOV		R1 , R2
			MOV 	R0 , R1, LSL #8      // Desplaza el registro R1 hacia la izquierda 8 bits
			ADD		R0 , R5
			ADD		R0 , R11
			
			BX		LR
*/
REINICIO_GAMES:
			LDR		R12, =game_jugador_1
			MOVW	R9, #0X00
			MOVT    R9, #0X00
			STR		R9, [R12]
			
			LDR		R12, =game_jugador_2
			MOVW	R9, #0X00
			MOVT    R9, #0X00
			STR		R9, [R12]
			MOV		R0, #0
			BEQ		RESET_1
			
GAMES_66:
			LDR		R12, =game_jugador_1
			MOVW	R9, #0X00
			MOVT    R9, #0X06
			STR		R9, [R12]
			
			LDR		R12, =game_jugador_2
			MOVW	R11, #0X00
			MOVT    R11, #0X60
			STR		R11, [R12]
			
			ADD		R11, R11, R9
			MOV		R0 , R11
			BEQ		RESET_2

RESET_2:
			LDR		R12, =reset_delay
			MOV		R9 , #0
			STR		R9 , [R12]
			
			LDR		R3 , =punto_jugador_1
			MOV		R4 , #0
			STR		R4 , [R3]
			LDR		R4 , =punto_jugador_2
			MOV		R2 , #0
			STR		R2 , [R4]
			
			BEQ		FIN