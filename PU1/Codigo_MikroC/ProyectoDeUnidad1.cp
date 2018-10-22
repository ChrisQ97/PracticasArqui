#line 1 "C:/Users/juand/Documents/MicroCProyectos/PRIMER PROYECTO DE UNIDAD/ProyectoDeUnidad1.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 4 "C:/Users/juand/Documents/MicroCProyectos/PRIMER PROYECTO DE UNIDAD/ProyectoDeUnidad1.c"
int continuar = 0;
int proceso = 0;

void configurar()
{
 IPEN_bit = 1;

 TRISD = 0;
 PORTD = 0;

 TRISA = 0xFF;
 PORTA = 0;

 INTCON = 0xC0;


 TMR0IP_bit = 1;
 T0CON = 0x68;
 TMR0L = 0xFF;
 TMR0IE_bit = 1;
 TMR0ON_bit = 1;


 TMR1IP_bit = 0;
 TMR1H = 0x0A;
 TMR1L = 0xFF;
 TMR1CS_bit = 0;
 T1CKPS1_bit = T1CKPS0_bit = 1;
 TMR1IE_bit = 1;
 TMR1ON_bit = 1;
}

EncenderApagar()
{
 int repetir = 0;
 while (repetir == 0)
 {
 continuar = 0;
 RD0_bit = 1;
 TMR1ON_bit = 1;
 while (continuar == 0);
 RD0_bit = 0;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
}

void BasculacionConIncremento()
{
 int repetir = 0;
 while (repetir == 0)
 {
 int repeticiones;
 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP0_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP0_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP0_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP1_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP1_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP1_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP2_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP2_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP2_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP3_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP3_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP3_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP4_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP4_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP4_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP5_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP5_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP5_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP6_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP6_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP6_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 for (repeticiones = 0; repeticiones < 2; repeticiones ++)
 {
 SPP7_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);

 SPP7_bit = 0;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
 SPP7_bit = 1;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);


 SPP0_bit = 0;
 SPP1_bit = 0;
 SPP2_bit = 0;
 SPP3_bit = 0;
 SPP4_bit = 0;
 SPP5_bit = 0;
 SPP6_bit = 0;
 SPP7_bit = 0;


 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
 }
}

void CorrimientoDeLedsDeIzquierdaADerecha()
{
 int repetir = 0;
 while (repetir == 0)
 {
 SPP0_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP0_bit = 0;
 SPP1_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP1_bit = 0;
 SPP2_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP2_bit = 0;
 SPP3_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP3_bit = 0;
 SPP4_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP4_bit = 0;
 SPP5_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP5_bit = 0;
 SPP6_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP6_bit = 0;
 SPP7_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP7_bit = 0;
 SPP6_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}


 SPP6_bit = 0;
 SPP5_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP5_bit = 0;
 SPP4_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP4_bit = 0;
 SPP3_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP3_bit = 0;
 SPP2_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP2_bit = 0;
 SPP1_bit = 1;
 continuar = 0;

 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP1_bit = 0;
 }
}

void ContadorAutomaticoHasta20()
{
 int repetir = 0;
 while (repetir == 0)
 {
 int numero;
 for (numero = 1; numero <= 20; numero++)
 {
 PORTD = numero;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}
 }
 }
}

void CorrimientoImparRegresoPar()
{
 int repetir = 0;
 while (repetir == 0)
 {
 SPP0_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP0_bit = 0;
 SPP2_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP2_bit = 0;
 SPP4_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP4_bit = 0;
 SPP6_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP6_bit = 0;
 SPP7_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP7_bit = 0;
 SPP5_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP5_bit = 0;
 SPP3_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP3_bit = 0;
 SPP1_bit = 1;

 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0){}

 SPP1_bit = 0;
 }
}

ApagarLeds()
{
 SPP0_bit = 0;
 SPP1_bit = 0;
 SPP2_bit = 0;
 SPP3_bit = 0;
 SPP4_bit = 0;
 SPP5_bit = 0;
 SPP6_bit = 0;
 SPP7_bit = 0;
}

void ElegirProceso()
{
 switch (proceso)
 {
 case 1:
 EncenderApagar();
 break;

 case 2:
 ApagarLeds();
 BasculacionConIncremento();
 break;

 case 3:
 ApagarLeds();
 CorrimientoDeLedsDeIzquierdaADerecha();
 break;

 case 4:
 ApagarLeds();
 ContadorAutomaticoHasta20();
 break;

 case 5:
 ApagarLeds();
 CorrimientoImparRegresoPar();
 break;

 case 6:
 ApagarLeds();
 proceso = 0;
 break;
 }
}

void interrupt(void)
{
 GIE_bit = 0;
 TMR0ON_bit = 0;
 TMR0IF_bit = 0;

 TMR0L = 0xFF;

 ApagarLeds();

 proceso++;
 PORTD = 0;


 TMR1ON_bit = 0;
 TMR1IF_bit = 0;
 TMR1L = 0x00;
 TMR1H = 0x00;

 TMR0ON_bit = 1;
 GIE_bit = 1;

 ElegirProceso();
}

void interrupt_low(void)
{
 TMR1ON_bit = 0;
 TMR1IF_bit = 0;
 TMR1L = 0x00;
 TMR1H = 0x00;

 continuar = 1;
}

void main() {
 configurar();
 do{if (PORTA == 0x01);}
 while (1);
}
