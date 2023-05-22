			.syntax unified
			.text
			.global obtener_puntos_1
			.thumb_func
//extern int obtener_puntaje_1( int puntaje, int dato_a_eliminar, int posicion ); // 14 y 2t

#define		puntaje_1	0X2000001C
#define		puntaje_2	0X20000020	
#define		game_1		0X20000024
#define		game_2		0X20000028

obtener_puntos_1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			LDR		R4, =puntaje_1
			LDR		R5, =puntaje_2
			LDR		R6, =game_1
			LDR		R7, =game_2
			AND     R0, R1
			CMP		R1, 0X0000FF
			BEQ		FIN
			CMP		R1, 0X00FF00
			BEQ		correr_a_la_derecha_puntos
			CMP		R1, 0X0F0000
			BEQ		correr_a_la_derecha_game_1
			CMP		R1, 0XF00000
			BEQ		correr_a_la_derecha_game_2
		
			POP 	{PC}
		
FIN:		
			CMP		R0, #4
			IT		EQ
			MOVEQ	R0, #0
			CMP		R0, #8
			IT		EQ
			MOVEQ	R0, #0
			STR		R0, [R4]
			
			POP 	{PC}
			
correr_a_la_derecha_puntos:
			MOV 	R1, R0, LSR #8      // Desplaza el registro R1 hacia la izquierda 16 bits
			MOV		R0, R1
			STR		R0, [R5]
			POP		{PC}
			
correr_a_la_derecha_game_1:
			MOV 	R1, R0, LSR #16      // Desplaza el registro R1 hacia la izquierda 16 bits
			MOV		R0, R1
			STR		R0, [R6]
			POP		{PC}
			
correr_a_la_derecha_game_2:
			MOV 	R1, R0, LSR #20      // Desplaza el registro R1 hacia la izquierda 16 bits
			MOV		R0, R1
			STR		R0, [R7]
			POP		{PC}
				