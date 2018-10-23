#line 1 "C:/Users/chr/Desktop/TimerP6/MyProject.c"
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
#line 4 "C:/Users/chr/Desktop/TimerP6/MyProject.c"
int continuar = 0;
int contador = 0;
void configurar()
{
 TRISD = 0;
 PORTD = 0;


 TMR1H = 0x22;
 TMR1L = 0x00;
 TMR1CS_bit = 0;
 T1CKPS1_bit = T1CKPS0_bit = 1;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
 TMR1ON_bit = 1;
}

void interrupt()
{
 TMR1ON_bit = 0;
 TMR1IF_bit = 0;

 TMR1L = 0x00;
 TMR1H = 0x00;

 continuar = 1;



}

encenderApagar()
{
 if(contador<255)
 { contador++;}
 else{contador = 0;}
 PORTD=contador;


 continuar = 0;


 TMR1ON_bit = 1;
 while (continuar == 0);
 RD0_bit = 0;
 continuar = 0;
 TMR1ON_bit = 1;
 while (continuar == 0);
}

void main() {
 configurar();
 while(1)
 {
 encenderApagar();
 }
}
