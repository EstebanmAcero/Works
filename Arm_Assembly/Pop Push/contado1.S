
			.syntax unified
			.text
			.global contado1
			.thumb_func

#define		aa			R0	
#define 	Valor_descedente		0x2000000C
#define 	Arranque				0x20000010

//#define 	inicio		 // 53 en decimal
			MOV		R4, #0

contado1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			LDR		R7, =Valor_descedente
			LDR		R6, [R7]
			CMP		R6, #53
			ITT		HS
			MOVHS	R6, #0
			STRHS	R6, [R7]
			
			
			CMP		R0, #4			
			BEQ		NORMAL
			
			CMP		R0, #8			
			BEQ		IMPAR
			
			POP 	{PC}

FIN:		
			POP 	{PC}

NORMAL:
			MOV		R5, #54
			LDR		R7, =Valor_descedente
			LDR		R6, [R7]
			ADD		R6, #1
			STR		R6, [R7]

			CMP		R0, #4
			ITTTT		EQ
			SUBEQ	R5, R6
			MOVEQ	R0, R5
			STREQ	R6, [R7] //R6
			BEQ		FIN

IMPAR:
			MOV		R5, #53
			LDR		R7, =Valor_descedente
			LDR		R6, [R7]
			
			BL		EMPAREJAR_50

			CMP		R0, #8
			ITTTT		EQ
			SUBEQ	R5, R6
			MOVEQ	R0, R5
			STREQ	R6, [R7] //R6
			BEQ		FIN
			
			B		FIN
			
			
EMPAREJAR_50:
			
			// Hagamos una cosa que si es modulo de 2 entonces le suma do sino que le sume uno
			MOV 	R8, R6        // número a verificar (cambiar según sea necesario)
			AND 	R1, R8, #1     // verificar LSB
			CMP 	R1, #0         // comparar con cero
			ITE		EQ
			ADDEQ	R6, #2
			ADDNE	R6, #1

			BX		LR
			
