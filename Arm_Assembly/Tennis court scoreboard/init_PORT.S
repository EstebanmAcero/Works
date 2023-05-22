			.syntax unified
			.text
			.global init_PORT
			
			.thumb_func

#define 	PORT 		R4
#define 	IO 			R5
#define 	LK 			R6
#define 	CLK 	    R7

init_PORT:	
			
			MOV		PORT,	R0
			MOV		IO,		R1
			MOV     LK,     R2
			MOV     CLK,    R3 
			
			/*
			 Configuracion del puerto F
			 SYSCTL_RCGCGPIO_R EQU	0x400FE608
			 SYSCTL_RCGC2_R = SYSCTL_RCGC2_R or 0x20	
			*/
			
			LDR		R0, =0x400FE108	
			LDR		R1, [R0]
			ORR		R1, R1, CLK														
			STR		R1, [R0]				
			NOP								
			NOP								
			NOP								
			
			CMP 	LK, #1 
			BEQ 	lock_p
			
			

			/*
			 GPIO_PORTF_CR_R = 0xFF
			 Habilita la escritura en los registros del PORTF		
			 GPIO_PORTF_CR_R	EQU 0x40025524
			*/
			
			ADD		R0, PORT, #0x524 
			MOV		R1, #0xFF
			STR		R1, [R0] 	
			
			/*
			 GPIO_PORTF_AMSEL_R = 0x00
			 No activa el modo analogo en PORTF
			 GPIO_PORTF_AMSEL_R 		EQU 	0x40025528
			*/
			
			ADD		R0, PORT, #0x528 
			MOV		R1, #0x00
			STR		R1, [R0] 	
			
			/*
			 GPIO_PORTF_PCTL_R = 0x00000000
			 No activa los perifericos en PORTF
			 GPIO_PORTF_PCTL_R EQU	0x4002552C
			*/
			
			ADD		R0, PORT, #0x52C 
			MOV		R1, #0x00000000
			STR		R1, [R0] 	
			
			/*
			 GPIO_PORTF_DIR_R = 0x00000000
			 Configura entrada y salidas I/O en PORTF
			 GPIO_PORTF_DIR_R EQU 0x40025400
			 PF4 -   PF3 -   PF2 -   PF1 - PF0
			 SW2 - LED_G - LED_B - LED_R - SW1	
			   0 -     1 -     1 -     1 -   0  = 0x0E 
			
			 0 = ENTRADA
			 1 = SALIDA
			*/
			
			ADD		R0, PORT, #0x400 
			MOV		R1, IO
			STR		R1, [R0] 	
			
			/*
			 GPIO_PORTF_AFSEL_R = 0x00
			 No configura perifericos en el PORTF
			 GPIO_PORTF_AFSEL_R EQU 0x40025420
			*/
			
			ADD		R0, PORT, #0x420 
			MOV		R1, #0x00
			STR		R1, [R0] 
			
			/*
			 GPIO_PORTF_PUR_R = 0x11
			 Habilita las pull-up para PF0 y PF4
			 GPIO_PORTF_PUR_R EQU 0x40025510
			*/
			
			ADD		R0, PORT, #0x510 
			MOV		R1, #0x00
			STR		R1, [R0] 
		
		    /*
			 GPIO_PORTF_DEN_R = 0x1F
			 Habilita modo digital para PF0 a PF4
			 GPIO_PORTF_DEN_R EQU 0x4002551C
			*/
			
			ADD		R0, PORT, #0x51C
			MOV		R1, #0xFF
			STR		R1, [R0] 
			
			BX		LR
			 				/* retorno   */
			
lock_p:	
			/*
			 GPIO_PORTF_LOCK_R = GPIO_LOCK_KEY
			 GPIO_LOCK_KEY EQU 0x4C4F434B  ; Unlocks the GPIO_CR register
			*/
			ADD		R0, PORT, #0x520 
			LDR		R1, =0x4C4F434B
			STR		R1, [R0] 
			
			MOV		R0,	PORT	
			MOV		R1,	IO		
			MOV     R2,	#0  // es el cero para darle la siguiente vuleta al lock     
			MOV     R3,	CLK     
			
			B  		init_PORT