#define D_START 2   // 2:from D2
#define D_END 18    // 18:to A4
#define SPEAKER 19  // 19:A5
#define BEAT 200    // [ms]

void setup() {
  // set pin mode
  for(int i=D_START; i <= D_END; i++){
    pinMode(i, OUTPUT);
  }
  Serial.begin(9600);
}

void loop() {
  // read from Serial
  int input;
  input = Serial.read();

  if(-1 == input){
    // no input. nop
  }else if('a' <= input && input <= 'v'){
    // set pin HIGH. a:D0 to n:D13, o:A0 to v:A7
    digitalWrite(input-'a', HIGH);
  }else if('A' <= input && input <= 'V'){
    // set pin LOW. A:D0 to N:D13, O:A0 to V:A7
    digitalWrite(input-'A', LOW);
  }else{
    Serial.print("invalid serial input. ");
    Serial.println(input);
  }
  
//     tone(SPEAKER,262,BEAT) ;  // ド
}
