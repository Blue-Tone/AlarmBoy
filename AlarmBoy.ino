#include "pitches.h"

#define D_START 2   // 2:from D2
#define D_END 18    // 18:to A4
#define SPEAKER 19  // 19:A5
#define BEAT 150    // [ms]
#define VERSION "00.01_160606" // varsion
#define BKINK_INTERVAL 1000 // LED switching on/off time

char ledStates[22]; // a to v = 22
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
  unsigned long currentMillis = millis();  
  
  // read from Serial
  int input;
  input = Serial.read();

  // dispatch Serial input
  if(-1 == input){
    // no input. nop
  }else if(A3 == input - 'a' || A3 == input - 'A' ){
    // A3 pin used Button input. nop
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

  // if button on then stop LED blink
  if( LOW == digitalRead(A3) ){
    ledStates[2] = LOW;
    ledStates[9] = LOW;
  }

  // blink LED D2 and D9
  if (currentMillis - previousMillis >= BKINK_INTERVAL) {
    blinkState = blinkState ? LOW : HIGH;
    previousMillis = currentMillis;
  }
  digitalWrite(2, ledStates[2] & blinkState);
  digitalWrite(9, ledStates[9] & blinkState);
}

// Play OK sounds
void PlayOkSounds(){
  // Marios coin sound
//    tone(SPEAKER,NOTE_A5,200);
//    delay(200);
//    tone(SPEAKER,NOTE_C6,500);
    
  // Marios 1up sound
  tone(SPEAKER,NOTE_E5,BEAT);
  delay(BEAT);
  tone(SPEAKER,NOTE_G5,BEAT);
  delay(BEAT);
  tone(SPEAKER,NOTE_E5,BEAT);
  delay(BEAT);
  tone(SPEAKER,NOTE_C6,BEAT);
  delay(BEAT);
  tone(SPEAKER,NOTE_D6,BEAT);
  delay(BEAT);
  tone(SPEAKER,NOTE_G6,BEAT);
  delay(BEAT);
}

// Play NG sounds
void PlayNgSounds(){
  tone(SPEAKER,NOTE_A3,700);  
}

