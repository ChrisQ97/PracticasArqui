list p = 18f4550
#include <p18f4550>
    org		    0x00
    goto	    inicio
    org		    0x20
    contador	    EQU 0x00
    continuar	    EQU 0x00
inicio:
   ;configurar
    clrf	    TRISD   ;TRISD =   0;                         // Ponemos el puerto D como salida
    clrf	    PORTD   ;PORTD =   0;                         // Inicializamos el puerto D

			    ; //CONFIGURACION DEL TIMER 1:

			    ; TMR1H = 0x22;                        // Valor inicial de TMR1
    MOVLW	    0x22
    MOVWF	    TMR1H
    clrf	    TMR1L   ; TMR1L = 0x00;
			    ;cs es la posicion 1 del byte
    BCF		    TMR1, 1 ; TMR1CS_bit = 0;                      // Utilizamos el contador interno y no uno externo
			    ; T1CKPS1_bit = T1CKPS0_bit = 1;       // Asignamos una escala de 1:8 poniendo como 1 el bit 5 y 4 de T1CON
    BSF		    TMR1, 4
    BSF		    TMR1, 5
    
			    ; TMR1IE_bit = 1;                      // Habilitamos la interrupcion por OVERFLOW del TMR1
    BSF		    PIE1,0
			    ; INTCON = 0xC0;                       // Habilitamos todas las interrupciones unmasked en el bit 7 y las interrupciones unmasked perifericas en el bit 6
    MOVLW	    0xC0
    MOVWF	    INTCON			     
			    ; TMR1ON_bit = 1;    
    BSF		    TMR1,0 
interrupt:
			    ;TMR1ON_bit = 0;                      // Apagamos el timer de TMR1
    BCF		    TMR1, 0	
			    ;TMR1IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR1
    BCF		    PIE1,0
			    ;TMR1L = 0x00;
    clrf	    TMR1L
			    ;TMR1H = 0x00;                        // Reiniciamos el valor de TMR1
    clrf	    TMR1H		    
			    ;continuar = 1;   
    MOVLW	    0x00
    MOVWF	    continuar
    
    
encenderApagar:
    
    ; if(contador<255)
    ; { contador++;}
    ; else{contador = 0;}
    
      ;me falta esto del if y ver ests movimientos del contador
      
    ;  PORTD=contador;
  
    
    MOVLW	    contador
    MOVWF	    PORTD
    ; continuar = 0;                       // Inicializamos la variable continuar
    MOVLW	    0x00
    MOVWF	    0x00
    
    ; TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
    BSF		    TMR1, 0
    
    
    ; me falta este while
    
    ; while (continuar == 0);              // Esperamos el retraso de 1 segundo
    
    ; RD0_bit = 0;                         // Apagamos el led
    MOVLW	    0x00
    MOVWF	    PORTD
    ; continuar = 0;                       // Reinicializamos la variable continuar
    MOVLW	    0x00
    MOVWF	    PORTD
    
    
    BSF; TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
    ; while (continuar == 0);  
    
    
    
main:
    
  
     ;configurar();
     ;while(1)
     ;{
     ;     encenderApagar();
     ;}
end