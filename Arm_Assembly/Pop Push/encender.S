
			.syntax unified
			.text
			.global encender
			.thumb_func


//extern void encender(int a,volatile unsigned long *R0,int posicion); // se envia el puntero dle gpio del dato sel }


encender:	
			
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			LDR		R12, =0x400243FC	 //E		
			MOV		R9, #0
			STR		R9, [R12]  // QUE ES EL PUERTO E 
			MOV		R9, #5
			
			MOV		R4, R0
			BL		DISPLAY
			MOV		R0, R1
			STR		R0, [R2]
			MOV		R9, #5
			
			POP 	{PC}   				/* retorno   */

FIN:
			POP 	{PC}   				/* retorno   */



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
			STR 	R5, [R3]               
			BX		LR
			
SEG0:
			MOV		R5, #0x40
			STR 	R5, [R3]               
			BX		LR

SEG1:			
			MOV		R5, #0x79
			STR 	R5, [R3]               
			BX		LR

SEG2:		MOV		R5, #0x24
			STR 	R5, [R3]               
			BX		LR

SEG3:		MOV		R5, #0x30
			STR 	R5, [R3]               
			BX		LR

SEG4:		MOV		R5, #0x19
			STR 	R5, [R3]               
			BX		LR

SEG5:		MOV		R5, #0x12
			STR 	R5, [R3]               
			BX		LR

SEG6:		MOV		R5, #0x02
			STR 	R5, [R3]               
			BX		LR

SEG7:		MOV		R5, #0x78
			STR 	R5, [R3]               
			BX		LR

SEG8:		MOV		R5, #0x00
			STR 	R5, [R3]               
			BX		LR

SEG9:		MOV		R5, #0x10
			STR 	R5, [R3]               
			BX		LR
				
	