#include <stdio.h>
#include <string.h>

int continuar = 0;
int contador = 0;//agregue esto
void configurar()
{
     TRISD =   0;                         // Ponemos el puerto D como salida
     PORTD =   0;                         // Inicializamos el puerto D

     //CONFIGURACION DEL TIMER 1:
     TMR1H = 0x22;                        // Valor inicial de TMR1
     TMR1L = 0x00;
     TMR1CS_bit = 0;                      // Utilizamos el contador interno y no uno externo
     T1CKPS1_bit = T1CKPS0_bit = 1;       // Asignamos una escala de 1:8 poniendo como 1 el bit 5 y 4 de T1CON
     TMR1IE_bit = 1;                      // Habilitamos la interrupcion por OVERFLOW del TMR1
     INTCON = 0xC0;                       // Habilitamos todas las interrupciones unmasked en el bit 7 y las interrupciones unmasked perifericas en el bit 6
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
}

void interrupt()
{
     TMR1ON_bit = 0;                      // Apagamos el timer de TMR1
     TMR1IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR1

     TMR1L = 0x00;
     TMR1H = 0x00;                        // Reiniciamos el valor de TMR1

     continuar = 1;                       // Permitimos que el programa se continue ejecutando
     //agregue esto

     
}

encenderApagar()
{
     if(contador<255)
     { contador++;}
     else{contador = 0;}
      PORTD=contador;


     continuar = 0;                       // Inicializamos la variable continuar
    // RD0_bit = 1;                         // Encendemos el led

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de 1 segundo
     RD0_bit = 0;                         // Apagamos el led
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de 1 segundo
}

void main() {
     configurar();
     while(1)
     {
          encenderApagar();
     }
}