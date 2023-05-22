
			.syntax unified
			.text
			.global contador
			.thumb_func

#define		aa			R0	
#define		bb			R1	
#define 	Valor_ascedente			0x20000008


contador:	
			PUSH 	{LR}  					/* guardamos la direccion de retorno en la pila */
			
			LDR		R3, =Valor_ascedente
			LDR		R2, [R3]
			
			CMP		R2, #53
			ITTT		HS
			MOVHS	R2, #0
			STRHS	R2, [R3]
			BHS		FIN
			
			CMP		R0, #1
			ITTTT	EQ
			ADDEQ	R2, #1
			MOVEQ	R0, R2
			STREQ	R0, [R3]
			BEQ		FIN
			
			CMP		R0, #2
			BEQ		PAR
			

			POP 	{PC}

FIN:		
			POP 	{PC}
			
PAR:		
			//CMP		R2, #10
			//IT		HS
			//SUBHS	R7,R2, #10
			CMP		R2, #1
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #3
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #5
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #7
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #9
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #11
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #13
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #15
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #17
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #19
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #21
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #23
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #25
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #27
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #29
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #31
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #33
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #35
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #37
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #39
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #41
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #43
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #45
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #47
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #49
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #51
			IT		EQ
			SUBEQ	R2, #1
			
			CMP		R2, #53
			IT		EQ
			SUBEQ	R2, #1
			
			
			
			CMP		R0, #2
			ITTT		EQ
			ADDEQ	R2, #2
			MOVEQ	R0, R2
			STREQ	R0, [R3]			
			B		FIN
