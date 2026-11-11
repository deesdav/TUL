#define a 7 
#define b 6 
#define c 5 
#define d 11 
#define e 10 
#define f 8
#define g 9 
#define dp 4
#define SHIFT 2
#define TL 3


//   ---a---
//  |       |
//  f       b
//  |       |
//   ---g---
//  |       |
//  e       c
//  |       |
//   ---d---  dp

int state = 0;
unsigned long T = 0;
unsigned long P = 1000;

void setup()
{
  pinMode(SHIFT, INPUT);
  pinMode(TL, INPUT);
   int i;
   for(i=4;i<=11;i++)  
     pinMode(i,OUTPUT);
  
  digitalWrite(a, 1);
  digitalWrite(b, 1);
  digitalWrite(c, 0);
  digitalWrite(d, 0);
  digitalWrite(e, 0);
  digitalWrite(f, 0);
  digitalWrite(g, 0);
  digitalWrite(dp, 0);
  
  T = millis();
}

void loop()
{
  int s = digitalRead(SHIFT);
  int tl = digitalRead(TL);
  
  if (tl == 1) {
    T = millis();
    P = 3000;
  }
  
  if (millis() - T >= P) {
    T = millis();
    P = 1000;
    
    digitalWrite(a, 0);
    digitalWrite(b, 0);
    digitalWrite(c, 0);
    digitalWrite(d, 0);
    digitalWrite(e, 0);
    digitalWrite(f, 0);
  
    switch(state){
    	case 0:
          if (s == 1) {
            digitalWrite(b, 1);
            digitalWrite(c, 1);
            state = 1;
          } else {
            digitalWrite(f, 1);
            digitalWrite(a, 1);
            state = 5;
          }
      	break;
      	case 1:
          if (s == 1) {
            digitalWrite(c, 1);
            digitalWrite(d, 1);
            state = 2;
          } else {
            digitalWrite(a, 1);
            digitalWrite(b, 1);
            state = 0;
          }
      	break;
      	case 2:
          if (s == 1) {
			digitalWrite(d, 1);
            digitalWrite(e, 1);
            state = 3;
          } else {
            digitalWrite(b, 1);
            digitalWrite(c, 1);
            state = 1;
          }
        break;
      	case 3:
          if (s == 1) {
			digitalWrite(e, 1);
            digitalWrite(f, 1);
            state = 4;
          } else {
            digitalWrite(c, 1);
            digitalWrite(d, 1);
            state = 2;
          }
        break;
      	case 4:
          if (s == 1) {
			digitalWrite(f, 1);
            digitalWrite(a, 1);
            state = 5;
          } else {
            digitalWrite(d, 1);
            digitalWrite(e, 1);
            state = 3;
          }
        break;
      	case 5:
          if (s == 1) {
			digitalWrite(a, 1);
            digitalWrite(b, 1);
            state = 0;
          } else {
            digitalWrite(e, 1);
            digitalWrite(f, 1);
            state = 4;
          }
        break;
    }
  }
}