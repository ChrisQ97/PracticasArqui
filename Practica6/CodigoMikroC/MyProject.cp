#line 1 "C:/Users/chr/Desktop/p6mikro/MyProject.c"
int contador;
int ejecuta;
int var;
void configurar()
{
 ADCON1 = 0xFF;
 TRISB = 0xFF;
 TRISD =0;
 PORTD=0;
 PORTB = 0;


 INTCON = 0xF0;
 INTCON2 = 0xF4;


 T0CON = 0X03;
 TMR0L = 0xDB;
 TMR0H = 0x0B;
 contador =0;
 ejecuta =0;
 T0IE_bit = 1;
 TMR0ON_bit = 1;
}
void interrupt(){
 if(INT0IF_bit==1){
 INT0IF_bit = 0;
 if(ejecuta==0) ejecuta=1;
 else ejecuta = 0;

 }

}
void main() {
 configurar();

 do{


 while(ejecuta){

 PORTD=contador;
 if (contador<=255) contador++;
 else contador =0;
 for(var =0;var<5000;var++){
 }
 }

 }while(1);

}
