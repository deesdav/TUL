// C++ code
//

#define TL 2
#define ML 11
#define MP 12
#define LED 13

int state = 0;

void setup()
{
  Serial.begin(9600);

  pinMode(TL, INPUT);
  pinMode(ML, OUTPUT);
  pinMode(MP, OUTPUT);
  pinMode(LED, OUTPUT);

  digitalWrite(ML, 0);
  digitalWrite(MP, 0);
  digitalWrite(LED, 0);
}

void loop()
{  
  int tl = digitalRead(TL);
  char z = 0;

  if (Serial.available() > 0) {
    z = Serial.read();
  }
  
  switch(state){
    case 0:
      if(z == 'r' || z == 'R'){
        digitalWrite(ML, 1);
        digitalWrite(MP, 1);
        state = 1;
      } else if(z == 'p' || z == 'P'){
        digitalWrite(ML, 1);
        digitalWrite(MP, 0);
        state = 4;
      } else if(z == 'l'|| z == 'L'){
        digitalWrite(ML, 0);
        digitalWrite(MP, 1);
        state = 6;
      }
    break;
    case 1:
      if((z == 's' || z == 'S') && tl == 0){
        digitalWrite(ML, 1);
        digitalWrite(MP, 1);
        state = 2;
      } else if(tl == 1){
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);
        digitalWrite(LED, 1);
        state = 3;
      }
    break;
    case 2:
      if (tl == 1) {
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);
        digitalWrite(LED, 1);
        state = 3;
      } else if (z == 'r' || z == 'R') {
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);
        state = 0;
      } else if (z != 0 && z != 's' && z != 'S') {
        digitalWrite(ML, 1);
        digitalWrite(MP, 1);
        state = 1;
      }
    break;
    case 3:
      if(tl == 0){
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);
        digitalWrite(LED, 0);
        state = 0;
      }
    break;
    case 4:
      if(z == 's' || z == 'S'){
        digitalWrite(ML, 1);
        digitalWrite(MP, 0);
        state = 5;
      }
    break;
    case 5:
      if(z == 'p' || z == 'P'){
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);	
        state = 0;
      } else if(z != 0 && z != 's' && z != 'S'){
        digitalWrite(ML, 1);
        digitalWrite(MP, 0);
        state = 4;
      }
    break;
    case 6:
      if(z == 's' || z == 'S'){
        digitalWrite(ML, 0);
        digitalWrite(MP, 1);
        state = 7;
      }
    break;
    case 7:
      if(z == 'l' || z == 'L'){
        digitalWrite(ML, 0);
        digitalWrite(MP, 0);	
        state = 0;
      } else if(z != 0 && z != 's' && z != 'S'){
        digitalWrite(ML, 0);
        digitalWrite(MP, 1);
        state = 6;
      }
    break;
  }
}