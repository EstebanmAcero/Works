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





extern void init_PORT(int puer,int io,int lk,int clk); //
extern int obtener_puntos_1 (int puntaje, int dato_a_eliminar ); 

extern int leer(volatile unsigned long *R0); // aca se manda el puntero de leer 
//extern int leer_1(volatile unsigned long *R0); // aca se manda el puntero de leer 
extern int contador_1				(int jugador, int reinicio_games); //
extern void puntos_display_on_1(int puntos_player_1,int puntos_player_12,int puntos_player_21,int puntos_player_22); //
extern int quien_gano			(int modo_juego,int set_1, int set_2); //
extern int reinicio_games_6	(int total_game); // reinicio del los games

extern int unir   (int numero,int numero1); //
extern int unir_1 (int numero,int numero1, int yu); //
extern int marcador_set	 		(int games); //
extern int marcador_set_1	 		(int games); //
extern int reset   (int pulsador); //
extern int modo_juego   (int pulsador); //
extern void prender_modo(int puer, int rest); //

int main (void)
{	
	int x,y,b,k,l,unir_set,a,c,d,e,f,g,unir_games,h = 0;
	init_PORT(puertoA,SALIDA,		OFF,0x01);
	init_PORT(puertoB,SALIDA,		OFF,0x02);
	init_PORT(puertoD,SALIDA,	 LOCK,0x08);
	init_PORT(puertoE,SALIDA,		OFF,0x10);
	init_PORT(puertoF,ENTRADA, LOCK,0x20);
	
	

	while(1)
	{
			x= leer  (&GPIO_PORTF_DATA_R);
			y = modo_juego(x);
			a = leer  (&GPIO_PORTF_DATA_R);
			b = reset (a);
			c = contador_1(a,h );  // este lo que va a decidir es quiense queda con el game
			d = obtener_puntos_1(c,0x000000FF);  // se guarda el puntaje del primer  jugador
			e = obtener_puntos_1(c,0x0000FF00);  // se guarda el puntaje del segundo jugador
			f = obtener_puntos_1(c,0x000F0000);  // se guarda el game del jugador 1 
			g = obtener_puntos_1(c,0x00F00000);  // se guarda el game del jugador 2


			unir_games=unir(f,g);    // Se guardar los games
			h = reinicio_games_6(unir_games);
		  k	= marcador_set    (h);
			l	= marcador_set_1  (h);
			unir_set=unir_1 (l,k,y);  // Se guardan los sets
			prender_modo(y,a);

			puntos_display_on_1 (e,d,unir_games,unir_set);
			// Solucionado Falta el 6 a 6 reset cuando se van a ocho puntos tambien 
			// Solucionado mostrar los sets, 
		  // solucionado falta el ganador, 
		  // solucionado falta escoger si 2 de 3 o 3 de 5 y 
			// solucionado falta con la condicion de 8 games en el jugador 1 hay un problema
			// Solucionado falta quitat del display cuando se presiona 
			// un boton
			// Solucionado falta un boton de reset
			// Solucionado que no se veo el boton que se presiona cuando se da el punto
			// marica pero ya se logro que los dos display actuen al mismo tiempo, que no falle los pulsadores
			// ademas la secuencia debe ser pulida no mas
			// Solucionado ahora si hay un problema que el 41 y 41 no se cumple sino que suma a ambos games
		
	}
}

