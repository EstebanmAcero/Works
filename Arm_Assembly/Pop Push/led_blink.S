
			.syntax unified
			.text
			.global led_blink
			.thumb_func


/*
#define GPIO_PORTE_DATA_R      0x400243FC

#define GPIO_PORTD_DATA_R      0x400073FC
#define GPIO_PORTB_DATA_R      0x400053FC
*/
//#define GPIO_PORTF_DATA_R      0x400253FC

led_blink:	
			
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			LDR		R12, =0x400243FC	 //E
			LDR		R11, =0x400073FC     //D
			LDR		R10, =0x400053FC	 //B
			MOV		R6, #0



DIS_VIS:
			MOV		R6, #0 // display visualizacion
			MOV		R7,	LR	
			
LOOPV:		
			MOV		R9, #0
			STR		R9, [R11]  // QUE ES EL PUERTO E 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R4, R2
			BL		DISPLAY
			MOV		R4, #0x20
			STR		R4, [R12]
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R4, R3
			BL		DISPLAY
			MOV		R4, #0x10
			STR		R4, [R12]
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R9, #0
			STR		R9, [R12]  // QUE ES EL PUERTO E 
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R4, R0
			BL		DISPLAY
			MOV		R4, #0x80
			STR		R4, [R11]
			MOV		R9, #7
			BL		DELAY_MS
			
			MOV		R4, R1
			BL		DISPLAY
			MOV		R4, #0x40
			STR		R4, [R11]
			MOV		R9, #7
			BL		DELAY_MS
			
			
			
			ADD		R6, #1
			CMP		R6, #10
			BEQ		FIN
			B		LOOPV
			
		//	POP 	{PC}   				/* retorno   */

FIN:
			MOV		R6, #0
			POP 	{PC}   				/* retorno   */
			
DELAY_MS:	
			MOV		R8, #6000
			SUBS 	R9, R9, #1                 
			BNE 	LOOP_MS
			BX  	LR                         
		
LOOP_MS:
			SUBS 	R8, #1                 
			BNE 	LOOP_MS                    
			B		DELAY_MS
	


DISPLAY:
			CMP 	R4, #0x00
			BEQ 	SEG0
			CMP 	R4, #0x01
			BEQ 	SEG1
			CMP 	R4, #0x02
			BEQ 	SEG2
			CMP 	R4, #0x03
			BEQ 	SEG3
			CMP 	R4, #0x04
			BEQ 	SEG4
			CMP 	R4, #0x05
			BEQ 	SEG5
			CMP 	R4, #0x06
			BEQ 	SEG6
			CMP 	R4, #0x07
			BEQ 	SEG7
			CMP 	R4, #0x08
			BEQ 	SEG8
			CMP 	R4, #0x09
			BEQ 	SEG9
			CMP 	R4, #10
			BEQ 	SEG10
			BX		LR		


SEG10:	
			MOV		R5, #0x40
			STR 	R5, [R10]               
			BX		LR
			
SEG0:
			MOV		R5, #0x40
			STR 	R5, [R10]               
			BX		LR

SEG1:			
			MOV		R5, #0x79
			STR 	R5, [R10]               
			BX		LR

SEG2:		MOV		R5, #0x24
			STR 	R5, [R10]               
			BX		LR

SEG3:		MOV		R5, #0x30
			STR 	R5, [R10]               
			BX		LR

SEG4:		MOV		R5, #0x19
			STR 	R5, [R10]               
			BX		LR

SEG5:		MOV		R5, #0x12
			STR 	R5, [R10]               
			BX		LR

SEG6:		MOV		R5, #0x02
			STR 	R5, [R10]               
			BX		LR

SEG7:		MOV		R5, #0x78
			STR 	R5, [R10]               
			BX		LR

SEG8:		MOV		R5, #0x00
			STR 	R5, [R10]               
			BX		LR

SEG9:		MOV		R5, #0x10
			STR 	R5, [R10]               
			BX		LR
				
	