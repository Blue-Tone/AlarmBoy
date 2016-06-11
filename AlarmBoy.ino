#include "sound.hpp"
#include "define.hpp"

char ledStates[21]; // 'a'(D0) to 'v'(A7) = 21
char blinkState;    // on or off
unsigned long previousMillis = 0;        // will store last time blinkState was updated

void setup() {
  // set pin mode
  for(int i=D_START; i <= D_END; i++){
    pinMode(i, OUTPUT);
  }

  // A3 Button Input Pin
  pinMode(A3, INPUT_PULLUP);

  Serial.begin(9600);
  Serial.print("ver : ");
  Serial.println(VERSION);
}

void loop() {
  // read from Serial
  int input;
  input = Serial.read();

  // dispatch Serial input
  if(-1 == input){
    // nop. no input.
  }else if(A3 == input - 'a' || A3 == input - 'A' ){
    // nop. A3 pin used Button input.
  }else if('t' == input){
    // NG Sound
    PlayNgSounds();
  }else if('T' == input){
    // OK Sound
    PlayOkSounds();    
  }else if('a' <= input && input <= 'v'){
    // set pin HIGH. a:D0 to n:D13, o:A0 to v:A7
    digitalWrite(input-'a', HIGH);
    ledStates[input-'a'] = HIGH;
  }else if('A' <= input && input <= 'V'){
    // set pin LOW. A:D0 to N:D13, O:A0 to V:A7
    digitalWrite(input-'A', LOW);
    ledStates[input-'A'] = LOW;
  }else{
    Serial.print("invalid serial input. ");
    Serial.println(input);
  }

  // if push button then stop LED blink
  if( LOW == digitalRead(A3) ){
    ledStates[2] = LOW;
    ledStates[9] = LOW;
  }
  
  // check blink Sycle
  unsigned long currentMillis = millis();  
  if (currentMillis - previousMillis >= BKINK_INTERVAL) {
    blinkState = blinkState ? LOW : HIGH;
    previousMillis = currentMillis;
  }
  
  // blink LED D2 and D9
  digitalWrite(2, ledStates[2] & blinkState);
  digitalWrite(9, ledStates[9] & blinkState);
}


