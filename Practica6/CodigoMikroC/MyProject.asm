
_configurar:

;MyProject.c,4 :: 		void configurar()
;MyProject.c,6 :: 		ADCON1 = 0xFF;
	MOVLW       255
	MOVWF       ADCON1+0 
;MyProject.c,7 :: 		TRISB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;MyProject.c,8 :: 		TRISD =0;
	CLRF        TRISD+0 
;MyProject.c,9 :: 		PORTD=0;
	CLRF        PORTD+0 
;MyProject.c,10 :: 		PORTB = 0;
	CLRF        PORTB+0 
;MyProject.c,13 :: 		INTCON = 0xF0;
	MOVLW       240
	MOVWF       INTCON+0 
;MyProject.c,14 :: 		INTCON2 = 0xF4;
	MOVLW       244
	MOVWF       INTCON2+0 
;MyProject.c,17 :: 		T0CON = 0X03;
	MOVLW       3
	MOVWF       T0CON+0 
;MyProject.c,18 :: 		TMR0L = 0xDB;
	MOVLW       219
	MOVWF       TMR0L+0 
;MyProject.c,19 :: 		TMR0H = 0x0B;
	MOVLW       11
	MOVWF       TMR0H+0 
;MyProject.c,20 :: 		contador =0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;MyProject.c,21 :: 		ejecuta =0;
	CLRF        _ejecuta+0 
	CLRF        _ejecuta+1 
;MyProject.c,22 :: 		T0IE_bit = 1;
	BSF         T0IE_bit+0, BitPos(T0IE_bit+0) 
;MyProject.c,23 :: 		TMR0ON_bit = 1;
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;MyProject.c,24 :: 		}
L_end_configurar:
	RETURN      0
; end of _configurar

_interrupt:

;MyProject.c,25 :: 		void interrupt(){
;MyProject.c,26 :: 		if(INT0IF_bit==1){
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt0
;MyProject.c,27 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,28 :: 		if(ejecuta==0) ejecuta=1;
	MOVLW       0
	XORWF       _ejecuta+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt16
	MOVLW       0
	XORWF       _ejecuta+0, 0 
L__interrupt16:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
	MOVLW       1
	MOVWF       _ejecuta+0 
	MOVLW       0
	MOVWF       _ejecuta+1 
	GOTO        L_interrupt2
L_interrupt1:
;MyProject.c,29 :: 		else  ejecuta = 0;
	CLRF        _ejecuta+0 
	CLRF        _ejecuta+1 
L_interrupt2:
;MyProject.c,31 :: 		}
L_interrupt0:
;MyProject.c,33 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,34 :: 		void main() {
;MyProject.c,35 :: 		configurar();
	CALL        _configurar+0, 0
;MyProject.c,37 :: 		do{
L_main3:
;MyProject.c,40 :: 		while(ejecuta){
L_main6:
	MOVF        _ejecuta+0, 0 
	IORWF       _ejecuta+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;MyProject.c,42 :: 		PORTD=contador;
	MOVF        _contador+0, 0 
	MOVWF       PORTD+0 
;MyProject.c,43 :: 		if (contador<=255) contador++;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _contador+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVF        _contador+0, 0 
	SUBLW       255
L__main18:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
	GOTO        L_main9
L_main8:
;MyProject.c,44 :: 		else contador =0;
	CLRF        _contador+0 
	CLRF        _contador+1 
L_main9:
;MyProject.c,45 :: 		for(var =0;var<5000;var++){
	CLRF        _var+0 
	CLRF        _var+1 
L_main10:
	MOVLW       128
	XORWF       _var+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       19
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       136
	SUBWF       _var+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
	INFSNZ      _var+0, 1 
	INCF        _var+1, 1 
;MyProject.c,46 :: 		}
	GOTO        L_main10
L_main11:
;MyProject.c,47 :: 		}
	GOTO        L_main6
L_main7:
;MyProject.c,49 :: 		}while(1);
	GOTO        L_main3
;MyProject.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
