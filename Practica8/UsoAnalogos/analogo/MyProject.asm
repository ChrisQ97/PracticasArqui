
_configurar:

;MyProject.c,1 :: 		void configurar(){
;MyProject.c,2 :: 		ADCON0 = 0;   //
	CLRF        ADCON0+0 
;MyProject.c,3 :: 		ADCON1 = 0X0E;// -> HABILITO EL CANAL 0
	MOVLW       14
	MOVWF       ADCON1+0 
;MyProject.c,4 :: 		ADCON2 = 0X80;
	MOVLW       128
	MOVWF       ADCON2+0 
;MyProject.c,5 :: 		PIR1   = 0;
	CLRF        PIR1+0 
;MyProject.c,6 :: 		PIE1   = 0X40;
	MOVLW       64
	MOVWF       PIE1+0 
;MyProject.c,7 :: 		IPR1   = 0X40;
	MOVLW       64
	MOVWF       IPR1+0 
;MyProject.c,8 :: 		INTCON = 0XC0;
	MOVLW       192
	MOVWF       INTCON+0 
;MyProject.c,9 :: 		TRISA  = 1;
	MOVLW       1
	MOVWF       TRISA+0 
;MyProject.c,10 :: 		TRISB  = 0;
	CLRF        TRISB+0 
;MyProject.c,11 :: 		TRISD  = 0;
	CLRF        TRISD+0 
;MyProject.c,12 :: 		PORTA  = 0;
	CLRF        PORTA+0 
;MyProject.c,13 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;MyProject.c,14 :: 		PORTB  = 0;
	CLRF        PORTB+0 
;MyProject.c,15 :: 		ADON_bit = 1;
	BSF         ADON_bit+0, BitPos(ADON_bit+0) 
;MyProject.c,16 :: 		GO_DONE_bit = 1;
	BSF         GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
;MyProject.c,17 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_interrupt:

;MyProject.c,18 :: 		void interrupt(){
;MyProject.c,19 :: 		GO_DONE_bit = 0;
	BCF         GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
;MyProject.c,20 :: 		PORTD = ADRESL;
	MOVF        ADRESL+0, 0 
	MOVWF       PORTD+0 
;MyProject.c,21 :: 		PORTB = ADRESH;
	MOVF        ADRESH+0, 0 
	MOVWF       PORTB+0 
;MyProject.c,22 :: 		ADIF_bit = 0;
	BCF         ADIF_bit+0, BitPos(ADIF_bit+0) 
;MyProject.c,23 :: 		GO_DONE_bit = 1;
	BSF         GO_DONE_bit+0, BitPos(GO_DONE_bit+0) 
;MyProject.c,24 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,25 :: 		void main() {
;MyProject.c,26 :: 		configurar();
	CALL        _configurar+0, 0
;MyProject.c,27 :: 		while (1);
L_main0:
	GOTO        L_main0
;MyProject.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
