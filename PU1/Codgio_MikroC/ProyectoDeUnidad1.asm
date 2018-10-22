
_configurar:

;ProyectoDeUnidad1.c,7 :: 		void configurar()
;ProyectoDeUnidad1.c,9 :: 		IPEN_bit = 1;                         // Activa las interrupciones de alto y bajo nivel
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;ProyectoDeUnidad1.c,11 :: 		TRISD =   0;                          // Colocamos todo el puerto D de salida
	CLRF        TRISD+0 
;ProyectoDeUnidad1.c,12 :: 		PORTD =   0;                          // Inicializamos el puerto D
	CLRF        PORTD+0 
;ProyectoDeUnidad1.c,14 :: 		TRISA =   0xFF;                       // Colocamos todo el puerto A como entrada
	MOVLW       255
	MOVWF       TRISA+0 
;ProyectoDeUnidad1.c,15 :: 		PORTA =   0;                          // Inicializamos el puerto A
	CLRF        PORTA+0 
;ProyectoDeUnidad1.c,17 :: 		INTCON =  0xC0;                       // Habilitamos todas las interrupciones unmasked en el bit 7 y las interrupciones unmasked perifericas en el bit 6
	MOVLW       192
	MOVWF       INTCON+0 
;ProyectoDeUnidad1.c,20 :: 		TMR0IP_bit = 1;                       // Activamos el timer 0 como una interrupcion de alto nivel
	BSF         TMR0IP_bit+0, BitPos(TMR0IP_bit+0) 
;ProyectoDeUnidad1.c,21 :: 		T0CON = 0x68;                         // Encendemos el bit 6, 5 y 3 en el TMR0. 6 = Contador de 8 bits. 5 = Se ubica externamente en el pin T0CKI. 3 = NO usa valores de prescala
	MOVLW       104
	MOVWF       T0CON+0 
;ProyectoDeUnidad1.c,22 :: 		TMR0L = 0xFF;                         // Colocamos el timer con un valor inicial de 255 para que asi solo cuente 1 hasta llegar al desbordamiento en 256
	MOVLW       255
	MOVWF       TMR0L+0 
;ProyectoDeUnidad1.c,23 :: 		TMR0IE_bit = 1;                       // Activamos la opcion de que se sea permitido llamar la interrupcion por overflow
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;ProyectoDeUnidad1.c,24 :: 		TMR0ON_bit = 1;                       // Encendemos el timer
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;ProyectoDeUnidad1.c,27 :: 		TMR1IP_bit = 0;                      // Activamos el timer 1 como una interrucion de bajo nivel
	BCF         TMR1IP_bit+0, BitPos(TMR1IP_bit+0) 
;ProyectoDeUnidad1.c,28 :: 		TMR1H = 0x0A;                        // Valor inicial de TMR1
	MOVLW       10
	MOVWF       TMR1H+0 
;ProyectoDeUnidad1.c,29 :: 		TMR1L = 0xFF;
	MOVLW       255
	MOVWF       TMR1L+0 
;ProyectoDeUnidad1.c,30 :: 		TMR1CS_bit = 0;                      // Utilizamos el contador interno y no uno externo
	BCF         TMR1CS_bit+0, BitPos(TMR1CS_bit+0) 
;ProyectoDeUnidad1.c,31 :: 		T1CKPS1_bit = T1CKPS0_bit = 1;       // Asignamos una escala de 1:8 poniendo como 1 el bit 5 y 4 de T1CON
	BSF         T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
	BTFSC       T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0) 
	GOTO        L__configurar150
	BCF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
	GOTO        L__configurar151
L__configurar150:
	BSF         T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0) 
L__configurar151:
;ProyectoDeUnidad1.c,32 :: 		TMR1IE_bit = 1;                      // Habilitamos la interrupcion por OVERFLOW del TMR1
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;ProyectoDeUnidad1.c,33 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,34 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_EncenderApagar:

;ProyectoDeUnidad1.c,36 :: 		EncenderApagar()
;ProyectoDeUnidad1.c,38 :: 		int repetir = 0;
	CLRF        EncenderApagar_repetir_L0+0 
	CLRF        EncenderApagar_repetir_L0+1 
;ProyectoDeUnidad1.c,39 :: 		while (repetir == 0)
L_EncenderApagar0:
	MOVLW       0
	XORWF       EncenderApagar_repetir_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__EncenderApagar153
	MOVLW       0
	XORWF       EncenderApagar_repetir_L0+0, 0 
L__EncenderApagar153:
	BTFSS       STATUS+0, 2 
	GOTO        L_EncenderApagar1
;ProyectoDeUnidad1.c,41 :: 		continuar = 0;                       // Inicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,42 :: 		RD0_bit = 1;                         // Encendemos el led
	BSF         RD0_bit+0, BitPos(RD0_bit+0) 
;ProyectoDeUnidad1.c,43 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,44 :: 		while (continuar == 0);              // Esperamos el retraso de 1 segundo
L_EncenderApagar2:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__EncenderApagar154
	MOVLW       0
	XORWF       _continuar+0, 0 
L__EncenderApagar154:
	BTFSS       STATUS+0, 2 
	GOTO        L_EncenderApagar3
	GOTO        L_EncenderApagar2
L_EncenderApagar3:
;ProyectoDeUnidad1.c,45 :: 		RD0_bit = 0;                         // Apagamos el led
	BCF         RD0_bit+0, BitPos(RD0_bit+0) 
;ProyectoDeUnidad1.c,46 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,47 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,48 :: 		while (continuar == 0);              // Esperamos el retraso de 1 segundo
L_EncenderApagar4:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__EncenderApagar155
	MOVLW       0
	XORWF       _continuar+0, 0 
L__EncenderApagar155:
	BTFSS       STATUS+0, 2 
	GOTO        L_EncenderApagar5
	GOTO        L_EncenderApagar4
L_EncenderApagar5:
;ProyectoDeUnidad1.c,49 :: 		}
	GOTO        L_EncenderApagar0
L_EncenderApagar1:
;ProyectoDeUnidad1.c,50 :: 		}
L_end_EncenderApagar:
	RETURN      0
; end of _EncenderApagar

_BasculacionConIncremento:

;ProyectoDeUnidad1.c,52 :: 		void BasculacionConIncremento()
;ProyectoDeUnidad1.c,54 :: 		int repetir = 0;
	CLRF        BasculacionConIncremento_repetir_L0+0 
	CLRF        BasculacionConIncremento_repetir_L0+1 
;ProyectoDeUnidad1.c,55 :: 		while (repetir == 0)
L_BasculacionConIncremento6:
	MOVLW       0
	XORWF       BasculacionConIncremento_repetir_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento157
	MOVLW       0
	XORWF       BasculacionConIncremento_repetir_L0+0, 0 
L__BasculacionConIncremento157:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento7
;ProyectoDeUnidad1.c,58 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento8:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento158
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento158:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento9
;ProyectoDeUnidad1.c,60 :: 		SPP0_bit = 1;                        // Encendemos el led
	BSF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,62 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,63 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,64 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento11:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento159
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento159:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento12
	GOTO        L_BasculacionConIncremento11
L_BasculacionConIncremento12:
;ProyectoDeUnidad1.c,66 :: 		SPP0_bit = 0;                        // Apagamos el led
	BCF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,68 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,69 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,70 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento13:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento160
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento160:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento14
	GOTO        L_BasculacionConIncremento13
L_BasculacionConIncremento14:
;ProyectoDeUnidad1.c,58 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,71 :: 		}
	GOTO        L_BasculacionConIncremento8
L_BasculacionConIncremento9:
;ProyectoDeUnidad1.c,72 :: 		SPP0_bit = 1;                             // Encendemos el led
	BSF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,73 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,74 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,75 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento15:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento161
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento161:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento16
	GOTO        L_BasculacionConIncremento15
L_BasculacionConIncremento16:
;ProyectoDeUnidad1.c,77 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento17:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento162
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento162:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento18
;ProyectoDeUnidad1.c,79 :: 		SPP1_bit = 1;                        // Encendemos el led
	BSF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,81 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,82 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,83 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento20:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento163
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento163:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento21
	GOTO        L_BasculacionConIncremento20
L_BasculacionConIncremento21:
;ProyectoDeUnidad1.c,85 :: 		SPP1_bit = 0;                        // Apagamos el led
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,87 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,88 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,89 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento22:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento164
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento164:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento23
	GOTO        L_BasculacionConIncremento22
L_BasculacionConIncremento23:
;ProyectoDeUnidad1.c,77 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,90 :: 		}
	GOTO        L_BasculacionConIncremento17
L_BasculacionConIncremento18:
;ProyectoDeUnidad1.c,91 :: 		SPP1_bit = 1;                             // Encendemos el led
	BSF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,92 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,93 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,94 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento24:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento165
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento165:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento25
	GOTO        L_BasculacionConIncremento24
L_BasculacionConIncremento25:
;ProyectoDeUnidad1.c,96 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento26:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento166
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento166:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento27
;ProyectoDeUnidad1.c,98 :: 		SPP2_bit = 1;                        // Encendemos el led
	BSF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,100 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,101 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,102 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento29:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento167
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento167:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento30
	GOTO        L_BasculacionConIncremento29
L_BasculacionConIncremento30:
;ProyectoDeUnidad1.c,104 :: 		SPP2_bit = 0;                        // Apagamos el led
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,106 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,107 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,108 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento31:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento168
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento168:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento32
	GOTO        L_BasculacionConIncremento31
L_BasculacionConIncremento32:
;ProyectoDeUnidad1.c,96 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,109 :: 		}
	GOTO        L_BasculacionConIncremento26
L_BasculacionConIncremento27:
;ProyectoDeUnidad1.c,110 :: 		SPP2_bit = 1;                             // Encendemos el led
	BSF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,111 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,112 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,113 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento33:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento169
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento169:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento34
	GOTO        L_BasculacionConIncremento33
L_BasculacionConIncremento34:
;ProyectoDeUnidad1.c,115 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento35:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento170
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento170:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento36
;ProyectoDeUnidad1.c,117 :: 		SPP3_bit = 1;                        // Encendemos el led
	BSF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,119 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,120 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,121 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento38:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento171
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento171:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento39
	GOTO        L_BasculacionConIncremento38
L_BasculacionConIncremento39:
;ProyectoDeUnidad1.c,123 :: 		SPP3_bit = 0;                        // Apagamos el led
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,125 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,126 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,127 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento40:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento172
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento172:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento41
	GOTO        L_BasculacionConIncremento40
L_BasculacionConIncremento41:
;ProyectoDeUnidad1.c,115 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,128 :: 		}
	GOTO        L_BasculacionConIncremento35
L_BasculacionConIncremento36:
;ProyectoDeUnidad1.c,129 :: 		SPP3_bit = 1;                             // Encendemos el led
	BSF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,130 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,131 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,132 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento42:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento173
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento173:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento43
	GOTO        L_BasculacionConIncremento42
L_BasculacionConIncremento43:
;ProyectoDeUnidad1.c,134 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento44:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento174
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento174:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento45
;ProyectoDeUnidad1.c,136 :: 		SPP4_bit = 1;                        // Encendemos el led
	BSF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,138 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,139 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,140 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento47:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento175
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento175:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento48
	GOTO        L_BasculacionConIncremento47
L_BasculacionConIncremento48:
;ProyectoDeUnidad1.c,142 :: 		SPP4_bit = 0;                        // Apagamos el led
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,144 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,145 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,146 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento49:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento176
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento176:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento50
	GOTO        L_BasculacionConIncremento49
L_BasculacionConIncremento50:
;ProyectoDeUnidad1.c,134 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,147 :: 		}
	GOTO        L_BasculacionConIncremento44
L_BasculacionConIncremento45:
;ProyectoDeUnidad1.c,148 :: 		SPP4_bit = 1;                             // Encendemos el led
	BSF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,149 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,150 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,151 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento51:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento177
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento177:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento52
	GOTO        L_BasculacionConIncremento51
L_BasculacionConIncremento52:
;ProyectoDeUnidad1.c,153 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento53:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento178
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento178:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento54
;ProyectoDeUnidad1.c,155 :: 		SPP5_bit = 1;                        // Encendemos el led
	BSF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,157 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,158 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,159 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento56:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento179
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento179:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento57
	GOTO        L_BasculacionConIncremento56
L_BasculacionConIncremento57:
;ProyectoDeUnidad1.c,161 :: 		SPP5_bit = 0;                        // Apagamos el led
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,163 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,164 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,165 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento58:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento180
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento180:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento59
	GOTO        L_BasculacionConIncremento58
L_BasculacionConIncremento59:
;ProyectoDeUnidad1.c,153 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,166 :: 		}
	GOTO        L_BasculacionConIncremento53
L_BasculacionConIncremento54:
;ProyectoDeUnidad1.c,167 :: 		SPP5_bit = 1;                             // Encendemos el led
	BSF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,168 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,169 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,170 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento60:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento181
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento181:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento61
	GOTO        L_BasculacionConIncremento60
L_BasculacionConIncremento61:
;ProyectoDeUnidad1.c,172 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento62:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento182
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento182:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento63
;ProyectoDeUnidad1.c,174 :: 		SPP6_bit = 1;                        // Encendemos el led
	BSF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,176 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,177 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,178 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento65:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento183
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento183:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento66
	GOTO        L_BasculacionConIncremento65
L_BasculacionConIncremento66:
;ProyectoDeUnidad1.c,180 :: 		SPP6_bit = 0;                        // Apagamos el led
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,182 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,183 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,184 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento67:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento184
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento184:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento68
	GOTO        L_BasculacionConIncremento67
L_BasculacionConIncremento68:
;ProyectoDeUnidad1.c,172 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,185 :: 		}
	GOTO        L_BasculacionConIncremento62
L_BasculacionConIncremento63:
;ProyectoDeUnidad1.c,186 :: 		SPP6_bit = 1;                             // Encendemos el led
	BSF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,187 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,188 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,189 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento69:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento185
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento185:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento70
	GOTO        L_BasculacionConIncremento69
L_BasculacionConIncremento70:
;ProyectoDeUnidad1.c,191 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	CLRF        R1 
	CLRF        R2 
L_BasculacionConIncremento71:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento186
	MOVLW       2
	SUBWF       R1, 0 
L__BasculacionConIncremento186:
	BTFSC       STATUS+0, 0 
	GOTO        L_BasculacionConIncremento72
;ProyectoDeUnidad1.c,193 :: 		SPP7_bit = 1;                        // Encendemos el led
	BSF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,195 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,196 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,197 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento74:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento187
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento187:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento75
	GOTO        L_BasculacionConIncremento74
L_BasculacionConIncremento75:
;ProyectoDeUnidad1.c,199 :: 		SPP7_bit = 0;                        // Apagamos el led
	BCF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,201 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,202 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,203 :: 		while (continuar == 0);              // Esperamos el retraso de un segundo
L_BasculacionConIncremento76:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento188
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento188:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento77
	GOTO        L_BasculacionConIncremento76
L_BasculacionConIncremento77:
;ProyectoDeUnidad1.c,191 :: 		for (repeticiones = 0; repeticiones < 2; repeticiones ++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,204 :: 		}
	GOTO        L_BasculacionConIncremento71
L_BasculacionConIncremento72:
;ProyectoDeUnidad1.c,205 :: 		SPP7_bit = 1;                             // Encendemos el led
	BSF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,206 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,207 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,208 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento78:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento189
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento189:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento79
	GOTO        L_BasculacionConIncremento78
L_BasculacionConIncremento79:
;ProyectoDeUnidad1.c,211 :: 		SPP0_bit = 0;
	BCF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,212 :: 		SPP1_bit = 0;
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,213 :: 		SPP2_bit = 0;
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,214 :: 		SPP3_bit = 0;
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,215 :: 		SPP4_bit = 0;
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,216 :: 		SPP5_bit = 0;
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,217 :: 		SPP6_bit = 0;
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,218 :: 		SPP7_bit = 0;
	BCF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,221 :: 		continuar = 0;                            // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,222 :: 		TMR1ON_bit = 1;                           // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,223 :: 		while (continuar == 0);                   // Esperamos el retraso de un segundo
L_BasculacionConIncremento80:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__BasculacionConIncremento190
	MOVLW       0
	XORWF       _continuar+0, 0 
L__BasculacionConIncremento190:
	BTFSS       STATUS+0, 2 
	GOTO        L_BasculacionConIncremento81
	GOTO        L_BasculacionConIncremento80
L_BasculacionConIncremento81:
;ProyectoDeUnidad1.c,224 :: 		}
	GOTO        L_BasculacionConIncremento6
L_BasculacionConIncremento7:
;ProyectoDeUnidad1.c,225 :: 		}
L_end_BasculacionConIncremento:
	RETURN      0
; end of _BasculacionConIncremento

_CorrimientoDeLedsDeIzquierdaADerecha:

;ProyectoDeUnidad1.c,227 :: 		void CorrimientoDeLedsDeIzquierdaADerecha()
;ProyectoDeUnidad1.c,229 :: 		int repetir = 0;
	CLRF        CorrimientoDeLedsDeIzquierdaADerecha_repetir_L0+0 
	CLRF        CorrimientoDeLedsDeIzquierdaADerecha_repetir_L0+1 
;ProyectoDeUnidad1.c,230 :: 		while (repetir == 0)
L_CorrimientoDeLedsDeIzquierdaADerecha82:
	MOVLW       0
	XORWF       CorrimientoDeLedsDeIzquierdaADerecha_repetir_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha192
	MOVLW       0
	XORWF       CorrimientoDeLedsDeIzquierdaADerecha_repetir_L0+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha192:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha83
;ProyectoDeUnidad1.c,232 :: 		SPP0_bit = 1;
	BSF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,233 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,235 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,236 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha84:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha193
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha193:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha85
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha84
L_CorrimientoDeLedsDeIzquierdaADerecha85:
;ProyectoDeUnidad1.c,238 :: 		SPP0_bit = 0;
	BCF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,239 :: 		SPP1_bit = 1;
	BSF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,240 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,242 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,243 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha86:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha194
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha194:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha87
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha86
L_CorrimientoDeLedsDeIzquierdaADerecha87:
;ProyectoDeUnidad1.c,245 :: 		SPP1_bit = 0;
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,246 :: 		SPP2_bit = 1;
	BSF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,247 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,249 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,250 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha88:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha195
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha195:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha89
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha88
L_CorrimientoDeLedsDeIzquierdaADerecha89:
;ProyectoDeUnidad1.c,252 :: 		SPP2_bit = 0;
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,253 :: 		SPP3_bit = 1;
	BSF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,254 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,256 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,257 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha90:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha196
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha196:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha91
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha90
L_CorrimientoDeLedsDeIzquierdaADerecha91:
;ProyectoDeUnidad1.c,259 :: 		SPP3_bit = 0;
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,260 :: 		SPP4_bit = 1;
	BSF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,261 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,263 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,264 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha92:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha197
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha197:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha93
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha92
L_CorrimientoDeLedsDeIzquierdaADerecha93:
;ProyectoDeUnidad1.c,266 :: 		SPP4_bit = 0;
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,267 :: 		SPP5_bit = 1;
	BSF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,268 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,270 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,271 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha94:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha198
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha198:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha95
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha94
L_CorrimientoDeLedsDeIzquierdaADerecha95:
;ProyectoDeUnidad1.c,273 :: 		SPP5_bit = 0;
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,274 :: 		SPP6_bit = 1;
	BSF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,275 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,277 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,278 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha96:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha199
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha199:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha97
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha96
L_CorrimientoDeLedsDeIzquierdaADerecha97:
;ProyectoDeUnidad1.c,280 :: 		SPP6_bit = 0;
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,281 :: 		SPP7_bit = 1;
	BSF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,282 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,284 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,285 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha98:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha200
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha200:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha99
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha98
L_CorrimientoDeLedsDeIzquierdaADerecha99:
;ProyectoDeUnidad1.c,287 :: 		SPP7_bit = 0;
	BCF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,288 :: 		SPP6_bit = 1;
	BSF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,289 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,291 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,292 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha100:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha201
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha201:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha101
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha100
L_CorrimientoDeLedsDeIzquierdaADerecha101:
;ProyectoDeUnidad1.c,295 :: 		SPP6_bit = 0;
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,296 :: 		SPP5_bit = 1;
	BSF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,297 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,299 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,300 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha102:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha202
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha202:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha103
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha102
L_CorrimientoDeLedsDeIzquierdaADerecha103:
;ProyectoDeUnidad1.c,302 :: 		SPP5_bit = 0;
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,303 :: 		SPP4_bit = 1;
	BSF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,304 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,306 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,307 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha104:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha203
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha203:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha105
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha104
L_CorrimientoDeLedsDeIzquierdaADerecha105:
;ProyectoDeUnidad1.c,309 :: 		SPP4_bit = 0;
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,310 :: 		SPP3_bit = 1;
	BSF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,311 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,313 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,314 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha106:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha204
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha204:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha107
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha106
L_CorrimientoDeLedsDeIzquierdaADerecha107:
;ProyectoDeUnidad1.c,316 :: 		SPP3_bit = 0;
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,317 :: 		SPP2_bit = 1;
	BSF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,318 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,320 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,321 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha108:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha205
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha205:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha109
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha108
L_CorrimientoDeLedsDeIzquierdaADerecha109:
;ProyectoDeUnidad1.c,323 :: 		SPP2_bit = 0;
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,324 :: 		SPP1_bit = 1;
	BSF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,325 :: 		continuar = 0;
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,327 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,328 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoDeLedsDeIzquierdaADerecha110:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoDeLedsDeIzquierdaADerecha206
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoDeLedsDeIzquierdaADerecha206:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha111
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha110
L_CorrimientoDeLedsDeIzquierdaADerecha111:
;ProyectoDeUnidad1.c,330 :: 		SPP1_bit = 0;
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,331 :: 		}
	GOTO        L_CorrimientoDeLedsDeIzquierdaADerecha82
L_CorrimientoDeLedsDeIzquierdaADerecha83:
;ProyectoDeUnidad1.c,332 :: 		}
L_end_CorrimientoDeLedsDeIzquierdaADerecha:
	RETURN      0
; end of _CorrimientoDeLedsDeIzquierdaADerecha

_ContadorAutomaticoHasta20:

;ProyectoDeUnidad1.c,334 :: 		void ContadorAutomaticoHasta20()
;ProyectoDeUnidad1.c,336 :: 		int repetir = 0;
	CLRF        ContadorAutomaticoHasta20_repetir_L0+0 
	CLRF        ContadorAutomaticoHasta20_repetir_L0+1 
;ProyectoDeUnidad1.c,337 :: 		while (repetir == 0)
L_ContadorAutomaticoHasta20112:
	MOVLW       0
	XORWF       ContadorAutomaticoHasta20_repetir_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ContadorAutomaticoHasta20208
	MOVLW       0
	XORWF       ContadorAutomaticoHasta20_repetir_L0+0, 0 
L__ContadorAutomaticoHasta20208:
	BTFSS       STATUS+0, 2 
	GOTO        L_ContadorAutomaticoHasta20113
;ProyectoDeUnidad1.c,340 :: 		for (numero = 1; numero <= 20; numero++)
	MOVLW       1
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
L_ContadorAutomaticoHasta20114:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ContadorAutomaticoHasta20209
	MOVF        R1, 0 
	SUBLW       20
L__ContadorAutomaticoHasta20209:
	BTFSS       STATUS+0, 0 
	GOTO        L_ContadorAutomaticoHasta20115
;ProyectoDeUnidad1.c,342 :: 		PORTD = numero;
	MOVF        R1, 0 
	MOVWF       PORTD+0 
;ProyectoDeUnidad1.c,343 :: 		continuar = 0;                       // Reinicializamos la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,344 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,345 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_ContadorAutomaticoHasta20117:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ContadorAutomaticoHasta20210
	MOVLW       0
	XORWF       _continuar+0, 0 
L__ContadorAutomaticoHasta20210:
	BTFSS       STATUS+0, 2 
	GOTO        L_ContadorAutomaticoHasta20118
	GOTO        L_ContadorAutomaticoHasta20117
L_ContadorAutomaticoHasta20118:
;ProyectoDeUnidad1.c,340 :: 		for (numero = 1; numero <= 20; numero++)
	INFSNZ      R1, 1 
	INCF        R2, 1 
;ProyectoDeUnidad1.c,346 :: 		}
	GOTO        L_ContadorAutomaticoHasta20114
L_ContadorAutomaticoHasta20115:
;ProyectoDeUnidad1.c,347 :: 		}
	GOTO        L_ContadorAutomaticoHasta20112
L_ContadorAutomaticoHasta20113:
;ProyectoDeUnidad1.c,348 :: 		}
L_end_ContadorAutomaticoHasta20:
	RETURN      0
; end of _ContadorAutomaticoHasta20

_CorrimientoImparRegresoPar:

;ProyectoDeUnidad1.c,350 :: 		void CorrimientoImparRegresoPar()
;ProyectoDeUnidad1.c,352 :: 		int repetir = 0;
	CLRF        CorrimientoImparRegresoPar_repetir_L0+0 
	CLRF        CorrimientoImparRegresoPar_repetir_L0+1 
;ProyectoDeUnidad1.c,353 :: 		while (repetir == 0)
L_CorrimientoImparRegresoPar119:
	MOVLW       0
	XORWF       CorrimientoImparRegresoPar_repetir_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar212
	MOVLW       0
	XORWF       CorrimientoImparRegresoPar_repetir_L0+0, 0 
L__CorrimientoImparRegresoPar212:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar120
;ProyectoDeUnidad1.c,355 :: 		SPP0_bit = 1;                        // Encendemos el led
	BSF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,357 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,358 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,359 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar121:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar213
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar213:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar122
	GOTO        L_CorrimientoImparRegresoPar121
L_CorrimientoImparRegresoPar122:
;ProyectoDeUnidad1.c,361 :: 		SPP0_bit = 0;                        // Apagamos el led
	BCF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,362 :: 		SPP2_bit = 1;                        // Encendemos el led
	BSF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,364 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,365 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,366 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar123:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar214
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar214:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar124
	GOTO        L_CorrimientoImparRegresoPar123
L_CorrimientoImparRegresoPar124:
;ProyectoDeUnidad1.c,368 :: 		SPP2_bit = 0;                        // Apagamos el led
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,369 :: 		SPP4_bit = 1;                        // Encendemos el led
	BSF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,371 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,372 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,373 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar125:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar215
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar215:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar126
	GOTO        L_CorrimientoImparRegresoPar125
L_CorrimientoImparRegresoPar126:
;ProyectoDeUnidad1.c,375 :: 		SPP4_bit = 0;                        // Apagamos el led
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,376 :: 		SPP6_bit = 1;                        // Encendemos el led
	BSF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,378 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,379 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,380 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar127:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar216
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar216:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar128
	GOTO        L_CorrimientoImparRegresoPar127
L_CorrimientoImparRegresoPar128:
;ProyectoDeUnidad1.c,382 :: 		SPP6_bit = 0;                        // Apagamos el led
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,383 :: 		SPP7_bit = 1;                        // Encendemos el led
	BSF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,385 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,386 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,387 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar129:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar217
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar217:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar130
	GOTO        L_CorrimientoImparRegresoPar129
L_CorrimientoImparRegresoPar130:
;ProyectoDeUnidad1.c,389 :: 		SPP7_bit = 0;                        // Apagamos el led
	BCF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,390 :: 		SPP5_bit = 1;                        // Encendemos el led
	BSF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,392 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,393 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,394 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar131:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar218
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar218:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar132
	GOTO        L_CorrimientoImparRegresoPar131
L_CorrimientoImparRegresoPar132:
;ProyectoDeUnidad1.c,396 :: 		SPP5_bit = 0;                        // Apagamos el led
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,397 :: 		SPP3_bit = 1;                        // Encendemos el led
	BSF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,399 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,400 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,401 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar133:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar219
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar219:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar134
	GOTO        L_CorrimientoImparRegresoPar133
L_CorrimientoImparRegresoPar134:
;ProyectoDeUnidad1.c,403 :: 		SPP3_bit = 0;                        // Apagamos el led
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,404 :: 		SPP1_bit = 1;                        // Encendemos el led
	BSF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,406 :: 		continuar = 0;                       // Inicializamos el valor de la variable continuar
	CLRF        _continuar+0 
	CLRF        _continuar+1 
;ProyectoDeUnidad1.c,407 :: 		TMR1ON_bit = 1;                      // Encendemos el timer de TMR1
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,408 :: 		while (continuar == 0){}             // Esperamos el retraso de un segundo
L_CorrimientoImparRegresoPar135:
	MOVLW       0
	XORWF       _continuar+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CorrimientoImparRegresoPar220
	MOVLW       0
	XORWF       _continuar+0, 0 
L__CorrimientoImparRegresoPar220:
	BTFSS       STATUS+0, 2 
	GOTO        L_CorrimientoImparRegresoPar136
	GOTO        L_CorrimientoImparRegresoPar135
L_CorrimientoImparRegresoPar136:
;ProyectoDeUnidad1.c,410 :: 		SPP1_bit = 0;                        // Apagamos el led
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,411 :: 		}
	GOTO        L_CorrimientoImparRegresoPar119
L_CorrimientoImparRegresoPar120:
;ProyectoDeUnidad1.c,412 :: 		}
L_end_CorrimientoImparRegresoPar:
	RETURN      0
; end of _CorrimientoImparRegresoPar

_ApagarLeds:

;ProyectoDeUnidad1.c,414 :: 		ApagarLeds()
;ProyectoDeUnidad1.c,416 :: 		SPP0_bit = 0;
	BCF         SPP0_bit+0, BitPos(SPP0_bit+0) 
;ProyectoDeUnidad1.c,417 :: 		SPP1_bit = 0;
	BCF         SPP1_bit+0, BitPos(SPP1_bit+0) 
;ProyectoDeUnidad1.c,418 :: 		SPP2_bit = 0;
	BCF         SPP2_bit+0, BitPos(SPP2_bit+0) 
;ProyectoDeUnidad1.c,419 :: 		SPP3_bit = 0;
	BCF         SPP3_bit+0, BitPos(SPP3_bit+0) 
;ProyectoDeUnidad1.c,420 :: 		SPP4_bit = 0;
	BCF         SPP4_bit+0, BitPos(SPP4_bit+0) 
;ProyectoDeUnidad1.c,421 :: 		SPP5_bit = 0;
	BCF         SPP5_bit+0, BitPos(SPP5_bit+0) 
;ProyectoDeUnidad1.c,422 :: 		SPP6_bit = 0;
	BCF         SPP6_bit+0, BitPos(SPP6_bit+0) 
;ProyectoDeUnidad1.c,423 :: 		SPP7_bit = 0;
	BCF         SPP7_bit+0, BitPos(SPP7_bit+0) 
;ProyectoDeUnidad1.c,424 :: 		}
L_end_ApagarLeds:
	RETURN      0
; end of _ApagarLeds

_ElegirProceso:

;ProyectoDeUnidad1.c,426 :: 		void ElegirProceso()
;ProyectoDeUnidad1.c,428 :: 		switch (proceso)
	GOTO        L_ElegirProceso137
;ProyectoDeUnidad1.c,430 :: 		case 1:
L_ElegirProceso139:
;ProyectoDeUnidad1.c,431 :: 		EncenderApagar();
	CALL        _EncenderApagar+0, 0
;ProyectoDeUnidad1.c,432 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,434 :: 		case 2:
L_ElegirProceso140:
;ProyectoDeUnidad1.c,435 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,436 :: 		BasculacionConIncremento();
	CALL        _BasculacionConIncremento+0, 0
;ProyectoDeUnidad1.c,437 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,439 :: 		case 3:
L_ElegirProceso141:
;ProyectoDeUnidad1.c,440 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,441 :: 		CorrimientoDeLedsDeIzquierdaADerecha();
	CALL        _CorrimientoDeLedsDeIzquierdaADerecha+0, 0
;ProyectoDeUnidad1.c,442 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,444 :: 		case 4:
L_ElegirProceso142:
;ProyectoDeUnidad1.c,445 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,446 :: 		ContadorAutomaticoHasta20();
	CALL        _ContadorAutomaticoHasta20+0, 0
;ProyectoDeUnidad1.c,447 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,449 :: 		case 5:
L_ElegirProceso143:
;ProyectoDeUnidad1.c,450 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,451 :: 		CorrimientoImparRegresoPar();
	CALL        _CorrimientoImparRegresoPar+0, 0
;ProyectoDeUnidad1.c,452 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,454 :: 		case 6:
L_ElegirProceso144:
;ProyectoDeUnidad1.c,455 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,456 :: 		proceso = 0;
	CLRF        _proceso+0 
	CLRF        _proceso+1 
;ProyectoDeUnidad1.c,457 :: 		break;
	GOTO        L_ElegirProceso138
;ProyectoDeUnidad1.c,458 :: 		}
L_ElegirProceso137:
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso223
	MOVLW       1
	XORWF       _proceso+0, 0 
L__ElegirProceso223:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso139
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso224
	MOVLW       2
	XORWF       _proceso+0, 0 
L__ElegirProceso224:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso140
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso225
	MOVLW       3
	XORWF       _proceso+0, 0 
L__ElegirProceso225:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso141
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso226
	MOVLW       4
	XORWF       _proceso+0, 0 
L__ElegirProceso226:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso142
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso227
	MOVLW       5
	XORWF       _proceso+0, 0 
L__ElegirProceso227:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso143
	MOVLW       0
	XORWF       _proceso+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ElegirProceso228
	MOVLW       6
	XORWF       _proceso+0, 0 
L__ElegirProceso228:
	BTFSC       STATUS+0, 2 
	GOTO        L_ElegirProceso144
L_ElegirProceso138:
;ProyectoDeUnidad1.c,459 :: 		}
L_end_ElegirProceso:
	RETURN      0
; end of _ElegirProceso

_interrupt:

;ProyectoDeUnidad1.c,461 :: 		void interrupt(void) //Interrupcion de alto nivel (TMR0)
;ProyectoDeUnidad1.c,463 :: 		GIE_bit = 0;                       // Deshabilitamos todas las interrupciones globales
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;ProyectoDeUnidad1.c,464 :: 		TMR0ON_bit = 0;                    // Apagamos el timer de TMR0
	BCF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;ProyectoDeUnidad1.c,465 :: 		TMR0IF_bit = 0;                    // Apagamos la bandera de interrupcion por Overflow de TMR0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;ProyectoDeUnidad1.c,467 :: 		TMR0L = 0xFF;                      // Reiniciamos el valor de TMR0
	MOVLW       255
	MOVWF       TMR0L+0 
;ProyectoDeUnidad1.c,469 :: 		ApagarLeds();
	CALL        _ApagarLeds+0, 0
;ProyectoDeUnidad1.c,471 :: 		proceso++;                         // Cambiamos de proceso
	INFSNZ      _proceso+0, 1 
	INCF        _proceso+1, 1 
;ProyectoDeUnidad1.c,472 :: 		PORTD = 0;                         // Reiniciamos el PORTD
	CLRF        PORTD+0 
;ProyectoDeUnidad1.c,475 :: 		TMR1ON_bit = 0;                     // Apagamos el timer de TMR1
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,476 :: 		TMR1IF_bit = 0;                     // Apagamos la bandera de interrupcion por Overflow de TMR1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;ProyectoDeUnidad1.c,477 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;ProyectoDeUnidad1.c,478 :: 		TMR1H = 0x00;                       // Reiniciamos el valor de TMR1
	CLRF        TMR1H+0 
;ProyectoDeUnidad1.c,480 :: 		TMR0ON_bit = 1;                    // Volvemos a encender el TMR0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;ProyectoDeUnidad1.c,481 :: 		GIE_bit = 1;                       // Volvemos a habilitar todas las interrupciones globales
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;ProyectoDeUnidad1.c,483 :: 		ElegirProceso();                   // Volvemos a ver que proceso debe ejecturar
	CALL        _ElegirProceso+0, 0
;ProyectoDeUnidad1.c,484 :: 		}
L_end_interrupt:
L__interrupt230:
	RETFIE      1
; end of _interrupt

_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;ProyectoDeUnidad1.c,486 :: 		void interrupt_low(void)  //Interrupcion de bajo nivel (TMR1)
;ProyectoDeUnidad1.c,488 :: 		TMR1ON_bit = 0;                     // Apagamos el timer de TMR1
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;ProyectoDeUnidad1.c,489 :: 		TMR1IF_bit = 0;                     // Apagamos la bandera de interrupcion por Overflow de TMR1
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;ProyectoDeUnidad1.c,490 :: 		TMR1L = 0x00;
	CLRF        TMR1L+0 
;ProyectoDeUnidad1.c,491 :: 		TMR1H = 0x00;                       // Reiniciamos el valor de TMR1
	CLRF        TMR1H+0 
;ProyectoDeUnidad1.c,493 :: 		continuar = 1;                      // Permitimos que el programa se continue ejecutando
	MOVLW       1
	MOVWF       _continuar+0 
	MOVLW       0
	MOVWF       _continuar+1 
;ProyectoDeUnidad1.c,494 :: 		}
L_end_interrupt_low:
L__interrupt_low232:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_main:

;ProyectoDeUnidad1.c,496 :: 		void main() {
;ProyectoDeUnidad1.c,497 :: 		configurar();
	CALL        _configurar+0, 0
;ProyectoDeUnidad1.c,498 :: 		do{if (PORTA == 0x01);}
L_main145:
	MOVF        PORTA+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main148
L_main148:
;ProyectoDeUnidad1.c,499 :: 		while (1);
	GOTO        L_main145
;ProyectoDeUnidad1.c,500 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
