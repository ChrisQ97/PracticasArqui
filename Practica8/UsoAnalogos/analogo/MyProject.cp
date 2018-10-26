#line 1 "C:/Users/chr/Desktop/analogo/MyProject.c"
void configurar(){
 ADCON0 = 0;
 ADCON1 = 0X0E;
 ADCON2 = 0X80;
 PIR1 = 0;
 PIE1 = 0X40;
 IPR1 = 0X40;
 INTCON = 0XC0;
 TRISA = 1;
 TRISB = 0;
 TRISD = 0;
 PORTA = 0;
 PORTD = 0;
 PORTB = 0;
 ADON_bit = 1;
 GO_DONE_bit = 1;
}
void interrupt(){
 GO_DONE_bit = 0;
 PORTD = ADRESL;
 PORTB = ADRESH;
 ADIF_bit = 0;
 GO_DONE_bit = 1;
}
void main() {
 configurar();
 while (1);
}
