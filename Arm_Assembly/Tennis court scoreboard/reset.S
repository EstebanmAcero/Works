			.syntax unified
			.text
			.global reset
			.thumb_func

// contador _1
#define 	punto_jugador_1			0x20000000
#define 	punto_jugador_2			0x20000004
#define 	reset_delay				0x20000008

#define 	game_jugador_1			0x2000000C
#define 	game_jugador_2			0x20000010
#define 	set_jugador_1			0x20000014
#define 	set_jugador_2			0x20000018
// unir
#define 	DIG_1					0x20000100
// unir_1
#define 	DIG_2					0x20000104

// obtener_puntos
#define		puntaje_1				0X2000001C
#define		puntaje_2				0X20000020	
#define		game_1					0X20000024
#define		game_2					0X20000028

// reinicio_game
#define 	GAME_1_1				0x2000002C
#define 	GAME_1_2				0x20000030   
#define 	GUARDAR_R0      		0X20000034

// modo_juego
#define 	modo_juego      		0X20000038

// marcador_set
#define 	set						0x20000050

// marcador_set_1
#define 	set_1						0x20000054

reset:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			CMP		R0, #2
			BEQ		CERO_TODO
			
			POP 	{PC}
			
FIN:
			POP 	{PC}
			

CERO_TODO:
			LDR		R11, =punto_jugador_1
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =punto_jugador_2
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =reset_delay
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =game_jugador_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =game_jugador_2
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =set_jugador_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =set_jugador_2
			MOV		R10, #0
			STR		R10, [R11]
			
			
			LDR		R12, =DIG_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =DIG_2
			MOV		R10, #0
			STR		R10, [R11]
			
			
			LDR		R12, =puntaje_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =puntaje_2
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =game_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =game_2
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =GAME_1_1
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =GAME_1_2
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =set
			MOV		R10, #0
			STR		R10, [R12]
			
			LDR		R11, =set_1
			MOV		R10, #0
			STR		R10, [R11]
			
			LDR		R12, =GUARDAR_R0
			MOV		R10, #0
			STR		R10, [R12]
	

			LDR		R11, =modo_juego
			MOV		R10, #0
			STR		R10, [R11]
			
			
			
			
			B		FIN