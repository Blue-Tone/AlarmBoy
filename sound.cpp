#include "Arduino.h"
#include "define.hpp"
#include "pitches.h"
#include "sound.hpp"

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
