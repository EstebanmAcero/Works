			.syntax unified
			.text
			.global unir_1
			.thumb_func


#define 	DIG_2										0x20000104

unir_1:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			CMP		R2, #0
			BEQ		DOS_DE_TRES
			CMP		R2, #3
			BEQ		TRES_DE_CINCO
			
			POP 	{PC}
			
FIN:
			POP 	{PC}
			
			
DOS_DE_TRES:			
			LDR		R7, =DIG_2
			LDR		R8, [R7]
			CMP		R8, #20
			BEQ		GANO_1
			CMP		R8, #21
			BEQ		GANO_1
			CMP		R8, #02
			BEQ		GANO_2
			CMP		R8, #12
			BEQ		GANO_2
			MOV		R5, #10
			MUL		R4, R0, R5
			ADD		R4, R1
			STR		R4, [R7]
			MOV		R0, R4
		/*	CMP		R0, #0
			IT		EQ
			MOVEQ	R0, R2 */
			POP 	{PC}
GANO_1:
			MOV		R0, #99
			B		FIN
			
GANO_2:
			MOV		R0, #88
			B		FIN
			
TRES_DE_CINCO:			
			LDR		R7, =DIG_2
			LDR		R8, [R7]
			CMP		R8, #30
			BEQ		GANO_1_1
			CMP		R8, #31
			BEQ		GANO_1_1
			CMP		R8, #32
			BEQ		GANO_1_1
			CMP		R8, #03
			BEQ		GANO_2_2
			CMP		R8, #13
			BEQ		GANO_2_2
			CMP		R8, #23
			BEQ		GANO_2_2
			MOV		R5, #10
			MUL		R4, R0, R5
			ADD		R4, R1
			STR		R4, [R7]
			MOV		R0, R4
		/*	CMP		R0, #0
			IT		EQ
			MOVEQ	R0, R2 */
			POP 	{PC}
GANO_1_1:
			MOV		R0, #99
			B		FIN
			
GANO_2_2:
			MOV		R0, #88
			B		FIN