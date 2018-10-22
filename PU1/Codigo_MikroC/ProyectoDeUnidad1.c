#include <stdio.h>
#include <string.h>

int continuar = 0;
int proceso = 0;

void configurar()
{
     IPEN_bit = 1;                        // Activa las interrupciones de alto y bajo nivel

     TRISD =   0;                         // Colocamos todo el puerto D de salida
     PORTD =   0;                         // Inicializamos el puerto D

     TRISA =   0xFF;                      // Colocamos todo el puerto A como entrada
     PORTA =   0;                         // Inicializamos el puerto A

     INTCON =  0xC0;                      // Habilitamos las interrupciones de alto nivel en el bit 7 y las interrupciones de bajo nivel perifericas en el bit 6

     //CONFIGURACION DEL TIMER0 (Entrada externa):
     TMR0IP_bit = 1;                      // Activamos el timer 0 como una interrupcion de ALTO nivel
     T0CON = 0x68;                        // Encendemos el bit 6, 5 y 3 en el TMR0. 6 = Contador de 8 bits. 5 = Se ubica externamente en el pin T0CKI. 3 = NO usa valores de prescala
     TMR0L = 0xFF;                        // Colocamos el timer con un valor inicial de 255 para que asi solo cuente 1 hasta llegar al desbordamiento en 256
     TMR0IE_bit = 1;                      // Activamos la opcion de que se sea permitido llamar la interrupcion por overflow
     TMR0ON_bit = 1;                      // Encendemos el timer
     
     //CONFIGURACION DEL TIMER1 (Contador interno):
     TMR1IP_bit = 0;                      // Activamos el timer 1 como una interrucion de BAJO nivel
     TMR1H = 0x0A;                        // Valor inicial de TMR1
     TMR1L = 0xFF;
     TMR1CS_bit = 0;                      // Utilizamos el contador interno y no uno externo
     T1CKPS1_bit = T1CKPS0_bit = 1;       // Asignamos una escala de 1:8 poniendo como 1 el bit 5 y 4 de T1CON
     TMR1IE_bit = 1;                      // Habilitamos la interrupcion por OVERFLOW del TMR1
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
}

EncenderApagar()
{
     int repetir = 0;
     while (repetir == 0)
     {
           continuar = 0;                       // Inicializamos la variable continuar
           RD0_bit = 1;                         // Encendemos el led
           TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
           while (continuar == 0);              // Esperamos el retraso de 1 segundo
           RD0_bit = 0;                         // Apagamos el led
           continuar = 0;                       // Reinicializamos la variable continuar
           TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
           while (continuar == 0);              // Esperamos el retraso de 1 segundo
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
          SPP0_bit = 1;                        // Encendemos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo

          SPP0_bit = 0;                        // Apagamos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo
     }
     SPP0_bit = 1;                             // Encendemos el led
     continuar = 0;                            // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
     while (continuar == 0);                   // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP1_bit = 1;                        // Encendemos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo

          SPP1_bit = 0;                        // Apagamos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo
     }
     SPP1_bit = 1;                             // Encendemos el led
     continuar = 0;                            // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
     while (continuar == 0);                   // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP2_bit = 1;                        // Encendemos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo

          SPP2_bit = 0;                        // Apagamos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo
     }
     SPP2_bit = 1;                             // Encendemos el led
     continuar = 0;                            // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
     while (continuar == 0);                   // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP3_bit = 1;                        // Encendemos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo

          SPP3_bit = 0;                        // Apagamos el led

          continuar = 0;                       // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
          while (continuar == 0);              // Esperamos el retraso de un segundo
     }
     SPP3_bit = 1;                             // Encendemos el led
     continuar = 0;                            // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
     while (continuar == 0);                   // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP4_bit = 1;                   // Encendemos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo

          SPP4_bit = 0;                   // Apagamos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo
     }
     SPP4_bit = 1;                        // Encendemos el led
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP5_bit = 1;                   // Encendemos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo

          SPP5_bit = 0;                   // Apagamos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo
     }
     SPP5_bit = 1;                        // Encendemos el led
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP6_bit = 1;                   // Encendemos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo

          SPP6_bit = 0;                   // Apagamos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo
     }
     SPP6_bit = 1;                        // Encendemos el led
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de un segundo

     for (repeticiones = 0; repeticiones < 2; repeticiones ++)
     {
          SPP7_bit = 1;                   // Encendemos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo

          SPP7_bit = 0;                   // Apagamos el led

          continuar = 0;                  // Reinicializamos la variable continuar
          TMR1ON_bit = 1;                 // Encendemos el timer de TMR1
          while (continuar == 0);         // Esperamos el retraso de un segundo
     }
     SPP7_bit = 1;                        // Encendemos el led
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de un segundo

     //APAGAMOS TODOS LOS LEDS:
     SPP0_bit = 0;
     SPP1_bit = 0;
     SPP2_bit = 0;
     SPP3_bit = 0;
     SPP4_bit = 0;
     SPP5_bit = 0;
     SPP6_bit = 0;
     SPP7_bit = 0;

     //DAMOS UN ULTIMO RETRASO:
     continuar = 0;                       // Reinicializamos la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0);              // Esperamos el retraso de un segundo
     }
}

void CorrimientoDeLedsDeIzquierdaADerecha()
{
     int repetir = 0;
     while (repetir == 0)
     {
     SPP0_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP0_bit = 0;
     SPP1_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP1_bit = 0;
     SPP2_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP2_bit = 0;
     SPP3_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP3_bit = 0;
     SPP4_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP4_bit = 0;
     SPP5_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP5_bit = 0;
     SPP6_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP6_bit = 0;
     SPP7_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP7_bit = 0;
     SPP6_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo


     SPP6_bit = 0;
     SPP5_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP5_bit = 0;
     SPP4_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP4_bit = 0;
     SPP3_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP3_bit = 0;
     SPP2_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP2_bit = 0;
     SPP1_bit = 1;
     continuar = 0;

     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

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
         continuar = 0;                       // Reinicializamos la variable continuar
         TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
         while (continuar == 0){}             // Esperamos el retraso de un segundo
     }
     }
}

void CorrimientoImparRegresoPar()
{
     int repetir = 0;
     while (repetir == 0)
     {
     SPP0_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP0_bit = 0;                        // Apagamos el led
     SPP2_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP2_bit = 0;                        // Apagamos el led
     SPP4_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP4_bit = 0;                        // Apagamos el led
     SPP6_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP6_bit = 0;                        // Apagamos el led
     SPP7_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP7_bit = 0;                        // Apagamos el led
     SPP5_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP5_bit = 0;                        // Apagamos el led
     SPP3_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP3_bit = 0;                        // Apagamos el led
     SPP1_bit = 1;                        // Encendemos el led

     continuar = 0;                       // Inicializamos el valor de la variable continuar
     TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
     while (continuar == 0){}             // Esperamos el retraso de un segundo

     SPP1_bit = 0;                        // Apagamos el led
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

void interrupt(void) //Interrupcion de alto nivel (TMR0)
{
     GIE_bit = 0;                         // Deshabilitamos todas las interrupciones globales
     TMR0ON_bit = 0;                      // Apagamos el timer de TMR0
     TMR0IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR0

     TMR0L = 0xFF;                        // Reiniciamos el valor de TMR0

     ApagarLeds();

     proceso++;                           // Cambiamos de proceso
     PORTD = 0;                           // Reiniciamos el PORTD
     
     //Reiniciamos Timer 1 y lo apagamos:
     TMR1ON_bit = 0;                      // Apagamos el timer de TMR1
     TMR1IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR1
     TMR1L = 0x00;
     TMR1H = 0x00;                        // Reiniciamos el valor de TMR1
     
     TMR0ON_bit = 1;                      // Volvemos a encender el TMR0
     GIE_bit = 1;                         // Volvemos a habilitar todas las interrupciones globales
     
     ElegirProceso();                     // Volvemos a ver que proceso debe ejecturar
}

void interrupt_low(void)  //Interrupcion de bajo nivel (TMR1)
{
     TMR1ON_bit = 0;                      // Apagamos el timer de TMR1
     TMR1IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR1
     TMR1L = 0x00;
     TMR1H = 0x00;                        // Reiniciamos el valor de TMR1

     continuar = 1;                       // Permitimos que el programa se continue ejecutando
}

void main() {
     configurar();
     do{if (PORTA == 0x01);}
     while (1);
}