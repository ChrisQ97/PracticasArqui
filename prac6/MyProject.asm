
_configurar:

;MyProject.c,6 :: 		void configurar()
;MyProject.c,8 :: 		TRISD =   0;                         // Ponemos el puerto D como salida
	CLRF        TRISD+0 
;MyProject.c,9 :: 		PORTD =   0;                         // Inicializamos el puerto D
	CLRF        PORTD+0 
;MyProject.c,12 :: 		TMR1H = 0x22;                        // Valor inicial de TMR1
	MOVLW       34
	MOVWF       TMR1H+0 
;MyProject.c,13 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;MyProject.c,14 :: 		TMR1CS_bit = 0;                      // Utilizamos el contador interno y no uno externo
	BCF         TMR1CS_bit+0, BitPos(TMR1CS_bit+0) 
;MyProject.c,15 :: 		T1CKPS1_bit = T1CKPS0_bit = 1;       // Asignamos una escala de 1:8 poniendo como 1 el bit 5 y 4 de T1CON
	BSF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
	BTFSC       T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
	GOTO        L__configurar9
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
	GOTO        L__configurar10
L__configurar9:
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
L__configurar10:
;MyProject.c,16 :: 		TMR1IE_bit = 1;                      // Habilitamos la interrupcion por OVERFLOW del TMR1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;MyProject.c,17 :: 		INTCON = 0xC0;                       // Habilitamos todas las interrupciones unmasked en el bit 7 y las interrupciones unmasked perifericas en el bit 6
	MOVLW       192
	MOVWF       INTCON+0 
;MyProject.c,18 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;MyProject.c,19 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_interrupt:

;MyProject.c,21 :: 		void interrupt()
;MyProject.c,23 :: 		TMR1ON_bit = 0;                      // Apagamos el timer de TMR1
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;MyProject.c,24 :: 		TMR1IF_bit = 0;                      // Apagamos la bandera de interrupcion por Overflow de TMR1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;MyProject.c,26 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;MyProject.c,27 :: 		TMR1H = 0x00;                        // Reiniciamos el valor de TMR1
	CLRF        TMR1H+0 
;MyProject.c,29 :: 		continuar = 1;                       // Permitimos que el programa se continue ejecutando
	MOVLW       1
	MOVWF       _continuar+0 
	MOVLW       0
	MOVWF       _continuar+1 
;MyProject.c,33 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_encenderApagar:

;MyProject.c,35 :: 		encenderApagar()
;MyProject.c,37 :: 		if(contador<255)
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__encenderApagar14
	MOVLW       255
	SUBWF       _contador+0, 0 
L__encenderApagar14:
	BTFSC       STATUS+0, 0 
	GOTO        L_encenderApagar0
;MyProject.c,38 :: 		{ contador++;}
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
	GOTO        L_encenderApagar1
L_encenderApagar0:
;MyProject.c,39 :: 		else{contador = 0;}
	CLRF        _contador+0 
	CLRF        _contador+1 
L_encenderApagar1:
;MyProject.c,40 :: 		PORTD=contador;
	MOVF        _contador+0, 0 
	MOVWF       PORTD+0 
;MyProject.c,43 :: 		continuar = 0;                       // Inicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;MyProject.c,46 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;MyProject.c,47 :: 		while (continuar == 0);              // Esperamos el retraso de 1 segundo
L_encenderApagar2:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__encenderApagar15
	MOVLW       0
	XORWF       _continuar+0, 0 
L__encenderApagar15:
	BTFSS       STATUS+0, 2 
	GOTO        L_encenderApagar3
	GOTO        L_encenderApagar2
L_encenderApagar3:
;MyProject.c,48 :: 		RD0_bit = 0;                         // Apagamos el led
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;MyProject.c,49 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;MyProject.c,50 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;MyProject.c,51 :: 		while (continuar == 0);              // Esperamos el retraso de 1 segundo
L_encenderApagar4:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__encenderApagar16
	MOVLW       0
	XORWF       _continuar+0, 0 
L__encenderApagar16:
	BTFSS       STATUS+0, 2 
	GOTO        L_encenderApagar5
	GOTO        L_encenderApagar4
L_encenderApagar5:
;MyProject.c,52 :: 		}
L_end_encenderApagar:
	RETURN      0
; end of _encenderApagar

_main:

;MyProject.c,54 :: 		void main() {
;MyProject.c,55 :: 		configurar();
	CALL        _configurar+0, 0
;MyProject.c,56 :: 		while(1)
L_main6:
;MyProject.c,58 :: 		encenderApagar();
	CALL        _encenderApagar+0, 0
;MyProject.c,59 :: 		}
	GOTO        L_main6
;MyProject.c,60 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
