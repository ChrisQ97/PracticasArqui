unsigned long tiempoInicio;  
unsigned long tiempoActual;
const unsigned long segundo = 500;  
int led = 2;
bool ida = 1;
int proyecto = 0;
int contador = 1;   

void setup() {
    for (led = 2; led <= 9; led++)
    {
      pinMode(led, OUTPUT);
    }
    led = 2;
    attachInterrupt(digitalPinToInterrupt(19),incrementar,RISING);
    tiempoInicio = millis();
}


void incrementar()
{
    if (proyecto < 5)
    { 
        apagar();
        led = 2;
        proyecto++;
        ida = 1;
        contador = 0;
        tiempoInicio = millis();
    }
    else
    {
        led = 2;
        proyecto = 0;
        ida = 1;
        contador = 1;
        tiempoInicio = millis();
    }
}

void blinkLed()
{
    tiempoActual = millis();
    if (tiempoActual - tiempoInicio >= segundo)
    {
        digitalWrite(2, !digitalRead(2));
        tiempoInicio = millis();
    }
}

void corrimientoBits()
{
    tiempoActual = millis();
    if ((tiempoActual - tiempoInicio >= segundo) && led < 10 && ida == 1)
    {
        Serial.println(led);
        digitalWrite(led, !digitalRead(led));
        if (led - 1 >= 2)
        {
            digitalWrite(led-1, !digitalRead(led-1));
        }
        led++;
        tiempoInicio = millis();
    }
    else if (led == 10 && ida == 1)
    {
        led = 9;
        ida = 0;
        tiempoInicio = millis();
    }
    else if ((tiempoActual - tiempoInicio >= segundo) && led > 2 && ida == 0)
    {
        Serial.println(led);
        digitalWrite(led, !digitalRead(led));
        led--;
        digitalWrite(led, !digitalRead(led));
        tiempoInicio = millis();
    }
    else if (led == 2 && ida == 0)
    {
        led = 3;
        ida = 1;
    }
}

void basculacionConIncremento()
{
    tiempoActual = millis();
    if ((tiempoActual - tiempoInicio >= segundo) && led < 10)
    {
        if (contador < 5)
        {
            digitalWrite(led, !digitalRead(led));
            contador++;
            tiempoInicio = millis();
        }
        else if (contador == 5)
        {         
            led++;
            contador = 0;
        }    
    }
    else if (led == 10)
    {
        for (led = 9; led >= 2; led--)
        {
          digitalWrite(led, LOW);
        }
        led = 2;
        tiempoInicio = millis();
    }
}

void contador20()
{
    tiempoActual = millis();
  if ((tiempoActual - tiempoInicio >= segundo) && contador < 21)
  {
       for (led = 2; led <= 8; led++)
       {
          digitalWrite(led, LOW);
       }
       switch (contador)
       {
       case 1:
          digitalWrite(2, HIGH);
       break;
       case 2:
          digitalWrite(3, HIGH);
       break;
       case 3:
          digitalWrite(2, HIGH);
          digitalWrite(3, HIGH);
       break;
       case 4:
          digitalWrite(4, HIGH);
       break;
       case 5:
          digitalWrite(4, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 6:
          digitalWrite(4, HIGH);
          digitalWrite(3, HIGH);
       break;
       case 7:
          digitalWrite(4, HIGH);
          digitalWrite(3, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 8:
          digitalWrite(5, HIGH);
       break;
       case 9:
          digitalWrite(5, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 10:
          digitalWrite(5, HIGH);
          digitalWrite(3, HIGH);
       break;
       case 11:
          digitalWrite(5, HIGH);
          digitalWrite(3, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 12:
          digitalWrite(5, HIGH);
          digitalWrite(4, HIGH);
       break;
       case 13:
          digitalWrite(5, HIGH);
          digitalWrite(4, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 14:
          digitalWrite(5, HIGH);
          digitalWrite(4, HIGH);
          digitalWrite(3, HIGH);
       break;
       case 15:
          digitalWrite(5, HIGH);
          digitalWrite(4, HIGH);
          digitalWrite(3, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 16:
          digitalWrite(6, HIGH);
       break;
       case 17:
          digitalWrite(6, HIGH);
          digitalWrite(2, HIGH);
       break;
       case 18:
          digitalWrite(6, HIGH);
          digitalWrite(3, HIGH);
       break;
       case 19:
          digitalWrite(6, HIGH);
          digitalWrite(3, HIGH);
          digitalWrite(2, HIGH);
       break;
       case (20):
          digitalWrite(6, HIGH);
          digitalWrite(4, HIGH);
       break;
       }
       
       contador++;
       tiempoInicio = millis();  
  }
  else if (contador == 21)
  {
      for (led = 2; led <= 8; led++)
      {
        digitalWrite(led, LOW);
      }
      contador = 1;
      tiempoInicio = millis();
  }
}

void paresImpares()
{
  tiempoActual = millis();
  if ((tiempoActual - tiempoInicio >= segundo) && led < 9 && ida == 1)
  {
       digitalWrite(led, !digitalRead(led));
       if (led - 2 >= 2)
       {
          digitalWrite(led-2, !digitalRead(led-2));
       }
       led++;
       led++;
       tiempoInicio = millis();
  }
  else if ((tiempoActual - tiempoInicio >= segundo) && led == 10 && ida == 1)
  {
      digitalWrite(8, !digitalRead(8));
      digitalWrite(9, !digitalRead(9));
      ida = 0;
      led = 9;
      tiempoInicio = millis();
  }
  else if ((tiempoActual - tiempoInicio >= segundo) && led > 3 && ida == 0)
  {
      digitalWrite(led, !digitalRead(led));
      led--;
      led--;
      digitalWrite(led, !digitalRead(led));
      tiempoInicio = millis();   
  }
  else if ((tiempoActual - tiempoInicio >= segundo && led == 3 && ida == 0))
  {
      digitalWrite(3, !digitalRead(3));
      digitalWrite(2, !digitalRead(2));
      ida = 1;
      led = 4;
      tiempoInicio = millis();
  }
}

void apagar()
{
  for (led = 2; led <= 9; led++)
  {
     digitalWrite(led, LOW);
  }
  
}

void loop() {
  switch (proyecto)
  {
      case 0:
        apagar();
      break;
      
      case 1:
        blinkLed();
      break;
      
      case 2:
        basculacionConIncremento();
      break;
      
      case 3:
        corrimientoBits();
      break;
      
      case 4:
        contador20();
      break;
      
      case 5:
        paresImpares();
      break; 
  }
}
