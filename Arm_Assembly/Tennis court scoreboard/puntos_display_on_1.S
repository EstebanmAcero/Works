
			.syntax unified
			.text
			.global puntos_display_on_1
			.thumb_func


#define DELYA      		0X20000194
#define GUARDAR_R0      0X200001A0
#define GUARDAR_R1      0X200001A4
#define GUARDAR_R2    	0X200001A8
#define GUARDAR_R3      0X200001AC
#define GUARDAR_R4      0X200001B0
#define GUARDAR_R5      0X200001B4
#define GUARDAR_R6    	0X200001B8
#define GUARDAR_R7      0X200001BC
#define GUARDAR_R10     0X200001C0
#define GUARDAR_R20     0X200001C4
#define GUARDAR_R30    	0X200001C8
#define GUARDAR_R40     0X200001CC

puntos_display_on_1:
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
		/*	
			CMP		R0, #0
			IT		EQ
			MOVEQ	R3, R3
		*/	
			CMP		R3, #99
			ITTTT		EQ	
			MOVEQ	R0, #11 
			MOVEQ	R1, #11
			MOVEQ	R2, #11
			MOVEQ	R3, #11
			
			CMP		R3, #88
			ITTTt		EQ	
			MOVEQ	R0, #22 
			MOVEQ	R1, #22
			MOVEQ	R2, #22
			MOVEQ	R3, #22

			MOV		R9 , R0
			LDR		R10, =GUARDAR_R0
			STR		R9 , [R10]
			
			MOV		R9 , R1
			LDR		R10, =GUARDAR_R1
			STR		R9 , [R10]
			
			MOV		R9 , R2
			LDR		R10, =GUARDAR_R2
			STR		R9 , [R10]
			
			MOV		R9 , R3
			LDR		R10, =GUARDAR_R3
			STR		R9 , [R10]
			
DIVIDIR_1:
			CMP		R0 ,#10
			BHS		DIVIDIR_R0
			MOV		R0, R0
			MOV		R4, #0
			
DIVIDIR_2:			
			CMP		R1 ,#10
			BHS		DIVIDIR_R1
			MOV		R1, R1
			MOV		R5, #0

DIVIDIR_3:
			CMP		R2 ,#10
			BHS		DIVIDIR_R2
			MOV		R2, R2
			MOV		R6, #0

DIVIDIR_4:
			CMP		R3 ,#10
			BHS		DIVIDIR_R3
			MOV		R3, R3
			MOV		R7, #0
		
LOOPV:	
			MOV		R8, #0
			BL		REGISTROS_DIGITOS // R9 A R12
			STR		R8, [R10]  // QUE ES EL PUERTO E 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R4
			BL		REGISTROS_DIGITOS
			BL		DISPLAY_1
			MOV		R8, #0x80
			BL		REGISTROS_DIGITOS
			STR		R8, [R11] // QUE ES EL PUERTO D 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R0
			BL		REGISTROS_DIGITOS
			BL		DISPLAY_1
			MOV		R8, #0x40
			BL		REGISTROS_DIGITOS
			STR		R8, [R11] // QUE ES EL PUERTO D 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, #0
			BL		REGISTROS_DIGITOS
			STR		R8, [R11] // QUE ES EL PUERTO D 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R5
			BL		REGISTROS_DIGITOS
			BL		DISPLAY_1
			MOV		R8, #0x20
			BL		REGISTROS_DIGITOS
			STR		R8, [R10] // QUE ES EL PUERTO E
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R1
			BL		REGISTROS_DIGITOS
			BL		DISPLAY_1
			MOV		R8, #0x10
			BL		REGISTROS_DIGITOS
			STR		R8, [R10] // QUE ES EL PUERTO E
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, #0x00
			BL		REGISTROS_DIGITOS
			STR		R8, [R10] // QUE ES EL PUERTO E
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R6
			BL		DISPLAY
			MOV		R8, #0x04
			BL		REGISTROS_DIGITOS
			STR		R8, [R12] // QUE ES EL PUERTO A
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R2
			BL		DISPLAY
			MOV		R8, #0x08
			BL		REGISTROS_DIGITOS
			STR		R8, [R12] // QUE ES EL PUERTO A
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R7
			BL		DISPLAY
			MOV		R8, #0x10
			BL		REGISTROS_DIGITOS
			STR		R8, [R12] // QUE ES EL PUERTO A
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, R3
			BL		DISPLAY
			MOV		R8, #0x20
			BL		REGISTROS_DIGITOS
			STR		R8, [R12] // QUE ES EL PUERTO A
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R8, #0x00
			BL		REGISTROS_DIGITOS
			STR		R8, [R12] // QUE ES EL PUERTO A
			MOV		R9, #7
			BL		DELAY_MS
			
			LDR		R10, = DELYA
			LDR		R11, [R10]
			ADD		R11, #1
			STR		R11, [R10]
			MOV		R12, #50
			CMP		R11, R12
			ITTT	EQ
			MOVEQ	R11, #0
			STREQ	R11, [R10]
			BEQ		FIN
			B		LOOPV
			POP 	{ PC}  		
			
			
			
		//	POP 	{PC}   				/* retorno   */

FIN:

			POP 	{PC}   				/* retorno   */
			
DELAY_MS:	
			MOV		R8, #1000
			SUBS 	R9, R9, #1                 
			BNE 	LOOP_MS
			BX  	LR                         
		
LOOP_MS:
			SUBS 	R8, #1                 
			BNE 	LOOP_MS                    
			B		DELAY_MS
	
REGISTROS_DIGITOS:
			LDR		R9 , =0x400053FC	 //B
			LDR		R10, =0x400243FC	 //E
			LDR		R11, =0x400073FC     //D
			LDR		R12, =0x400043FC	 //A 	
			BX		LR
TRAER_1:				// ESTO SE HACE PARA TRAER DE R0 A R3 Y LOGRAR SACAR LA DECENA DE CADA NUMERO
			LDR		R10, =GUARDAR_R0
			LDR		R11, [R10]
			MOV		R4 , R11
			
			BX		LR

TRAER_2:			
			LDR		R10, =GUARDAR_R1
			LDR		R11, [R10]
			MOV		R5 , R11
			
			BX		LR
TRAER_3:
			LDR		R10, =GUARDAR_R2
			LDR		R11, [R10]
			MOV		R6 , R11
			
			BX		LR
TRAER_4:
			LDR		R10, =GUARDAR_R3
			LDR		R11, [R10]
			MOV		R7 , R11
			
			BX		LR

DIVIDIR_R0:
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R4 , R0, R10		// R0 = UNIDADES DE JUGADOR 1
			MUL		R4 , R4, R10		
			SUB		R0 , R4
			LDR		R10, =GUARDAR_R10
			STR		R0 , [R10]
			
			BL		TRAER_1
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R4 , R4, R10		// R4 = DECENAS
			LDR		R10, =GUARDAR_R4
			STR		R4 , [R10]
			
			B		DIVIDIR_2

DIVIDIR_R1:
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R5 , R1, R10		// R1 = UNIDADES DE JUGADOR 2
			MUL		R5 , R5, R10		
			SUB		R1 , R5
			LDR		R10, =GUARDAR_R20
			STR		R1 , [R10]
			
			BL		TRAER_2
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R5 , R5, R10		// R5 = DECENAS
			LDR		R10, =GUARDAR_R5
			STR		R5 , [R10]
			
			B		DIVIDIR_3
DIVIDIR_R2:
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R6 , R2, R10		// R2 =  GAMES DE JUGADOR 1
			MUL		R6 , R6, R10		
			SUB		R2 , R6
			LDR		R10, =GUARDAR_R30
			STR		R2 , [R10]
			
			BL		TRAER_3
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R6 , R6, R10		// R6 =  GAMES DE JUGADOR 2
			LDR		R10, =GUARDAR_R6
			STR		R6 , [R10]
			
			B		DIVIDIR_4
DIVIDIR_R3:
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R7 , R3, R10		// R3 =  SET DE JUGADOR 1
			MUL		R7 , R7, R10		
			SUB		R3 , R7
			LDR		R10, =GUARDAR_R40
			STR		R3 , [R10]
			
			BL		TRAER_4
			MOV		R10, #10			// DIVISION DE UNIDADES Y DECENAS 
			UDIV  	R7 , R7, R10		// R7 =  SET DE JUGADOR 2
			LDR		R10, =GUARDAR_R7
			STR		R7 , [R10]
			
			B		LOOPV

DISPLAY:
			CMP 	R8, #0x00
			BEQ 	SEG0
			CMP 	R8, #0x01
			BEQ 	SEG1
			CMP 	R8, #0x02
			BEQ 	SEG2
			CMP 	R8, #0x03
			BEQ 	SEG3
			CMP 	R8, #0x04
			BEQ 	SEG4
			CMP 	R8, #0x05
			BEQ 	SEG5
			CMP 	R8, #0x06
			BEQ 	SEG6
			CMP 	R8, #0x07
			BEQ 	SEG7
			CMP 	R8, #0x08
			BEQ 	SEG8
			CMP 	R8, #0x09
			BEQ 	SEG9
			CMP 	R8, #10
			BEQ 	SEG10
			BX		LR		


SEG10:	
			MOV		R8, #0x00
			STR 	R8, [R10]  
			MOV		R8, #0x00
			STR 	R8, [R11] 			
			BX		LR
			
SEG0:
			MOV		R8, #0x02
			STR 	R8, [R10]  
			MOV		R8, #0x00
			STR 	R8, [R11]              
			BX		LR

SEG1:			
			MOV		R8, #0x0E
			STR 	R8, [R10]  
			MOV		R8, #0x09
			STR 	R8, [R11]               
			BX		LR

SEG2:		MOV		R8, #0x04
			STR 	R8, [R10]  
			MOV		R8, #0x02
			STR 	R8, [R11]              
			BX		LR

SEG3:		MOV		R8, #0x0C   // este funciona
			STR 	R8, [R10]  
			MOV		R8, #0x00
			STR 	R8, [R11]              
			BX		LR

SEG4:		MOV		R8, #0x08
			STR 	R8, [R10]  
			MOV		R8, #0x09
			STR 	R8, [R11]              
			BX		LR

SEG5:		MOV		R8, #0x08
			STR 	R8, [R10]  
			MOV		R8, #0x04
			STR 	R8, [R11]               
			BX		LR

SEG6:		MOV		R8, #0x00
			STR 	R8, [R10]  
			MOV		R8, #0x04
			STR 	R8, [R11]               
			BX		LR

SEG7:		MOV		R8, #0x0E
			STR 	R8, [R10]  
			MOV		R8, #0x01
			STR 	R8, [R11]              
			BX		LR

SEG8:		MOV		R8, #0x00
			STR 	R8, [R10]  
			MOV		R8, #0x00
			STR 	R8, [R11]               
			BX		LR

SEG9:		MOV		R8, #0x08		// este funciona
			STR 	R8, [R10]  
			MOV		R8, #0x00
			STR 	R8, [R11]              
			BX		LR


DISPLAY_1:
			CMP 	R8, #0x00
			BEQ 	SEG0_1
			CMP 	R8, #0x01
			BEQ 	SEG1_1
			CMP 	R8, #0x02
			BEQ 	SEG2_1
			CMP 	R8, #0x03
			BEQ 	SEG3_1
			CMP 	R8, #0x04
			BEQ 	SEG4_1
			CMP 	R8, #0x05
			BEQ 	SEG5_1
			CMP 	R8, #0x06
			BEQ 	SEG6_1
			CMP 	R8, #0x07
			BEQ 	SEG7_1
			CMP 	R8, #0x08
			BEQ 	SEG8_1
			CMP 	R8, #0x09
			BEQ 	SEG9_1
			CMP 	R8, #10
			BEQ 	SEG10_1
			BX		LR		


SEG10_1:	
			MOV		R8, #0x40
			STR 	R8, [R9]               
			BX		LR
			
SEG0_1:
			MOV		R8, #0x40
			STR 	R8, [R9]               
			BX		LR

SEG1_1:			
			MOV		R8, #0x79
			STR 	R8, [R9]               
			BX		LR

SEG2_1:		MOV		R8, #0x24
			STR 	R8, [R9]               
			BX		LR

SEG3_1:		MOV		R8, #0x30
			STR 	R8, [R9]               
			BX		LR

SEG4_1:		MOV		R8, #0x19
			STR 	R8, [R9]               
			BX		LR

SEG5_1:		MOV		R8, #0x12
			STR 	R8, [R9]               
			BX		LR

SEG6_1:		MOV		R8, #0x02
			STR 	R8, [R9]               
			BX		LR

SEG7_1:		MOV		R8, #0x78
			STR 	R8, [R9]               
			BX		LR

SEG8_1:		MOV		R8, #0x00
			STR 	R8, [R9]               
			BX		LR

SEG9_1:		MOV		R8, #0x10
			STR 	R8, [R9]               
			BX		LR
