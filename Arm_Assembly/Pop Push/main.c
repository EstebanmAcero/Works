
#include "tm4c123gh6pm.h"


#define		puertoA			0x40004000
#define		puertoB			0x40005000
#define		puertoC			0x40006000
#define		puertoD			0x40007000
#define		puertoE			0x40024000
#define		puertoF			0x40025000
#define		ENTRADA			0x00
#define		SALIDA			0xFF
#define		LOCK				0x01
#define		OFF					0x00


#define 	CONT				0x20000000 // esto es como el equ

extern void init_PORTF(int puer,int io,int lk,int clk); //
extern void delay_ms(volatile unsigned long R0);  // esto es porque se manda un dato y no un puntero con la posicion
// los otros colores
extern int leer(volatile unsigned long *R0); // aca se manda el puntero de ller 
extern int leer_1(volatile unsigned long *R0); // aca se manda el puntero de ller 
extern int Guardar_a_diferente_de_cero(int a);
extern int Guardar_b_diferente_de_cero(int b);
extern int contador(int a); //
extern int contado1(int a); //
extern int dividir_ascendete(int e); //
extern int dividir_unidades(int e); //
extern int dividir_as(int e); //

//extern void led_blink(volatile unsigned long *GPIO,int e, volatile unsigned long *GPIO1,volatile unsigned long *GPIO2, int f ); // se envia el puntero dle gpio del dato sel }
extern void led_blink(int aaaa,int b,int c, int d ); // se envia el puntero dle gpio del dato sel }
extern void encender(int a,volatile unsigned long *R0,int posicion,volatile unsigned long *R1); // se envia el puntero dle gpio del dato sel }


int main (void)
{	
	int a,b,c,d,e,f,g,i,h,j = 0;

	init_PORTF(puertoB,SALIDA,OFF,0x02);
	
	init_PORTF(puertoD,SALIDA,LOCK,0x08);
	
	init_PORTF(puertoE,SALIDA,OFF,0x10);
	
	init_PORTF(puertoF,ENTRADA,LOCK,0x20);

	while(1)
	{
		// antes toca hacer una funcion que guarde lo valores y vea que solo hasta que cambie
		a = leer  (&GPIO_PORTF_DATA_R);
		b = leer_1(&GPIO_PORTF_DATA_R);
		c= Guardar_a_diferente_de_cero(a);
		d =Guardar_b_diferente_de_cero(b);

		e=contador (c); // este es el contador ascendente
		f=contado1 (d); // este es el contador descendente
		
		g=dividir_as(e);// se obtiene las decenas ascendentes
		i=dividir_unidades(e);// se obtiene las unidades ascendentes

		h=dividir_ascendete(f);// se obtiene las decenas descendentes
		j=dividir_unidades(f);// se obtiene las unidades descendentes
		
//		encender(g,&GPIO_PORTD_DATA_R,0x80,&GPIO_PORTB_DATA_R);

		led_blink(g,i,h,j);

		//led_blink(&GPIO_PORTE_DATA_R,e,&GPIO_PORTD_DATA_R,&GPIO_PORTB_DATA_R,f );
		//delay_ms(500);
				
	}
	
}
