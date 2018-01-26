//LIBRARIES:
//for CAPACITY SENSES: For the conductive parts of the plushy to work
#include <CapPin.h> 
#include <CapScroll.h>
#include <CapSlider.h>
#include <CapTouch.h>
//for key and char to work:
#include <Keyboard.h>


/////////////////////////////////////////////////////////////////////////
//Final Project: Singing Shiba 
//Arduino File
//
//My project include a shiba plushy with capacitive touch points (in grey fabrics at shiba'spaws, eyes, nose, and booty.)
//To interact with shiba and make him sing, make sure one of your hand is touching his booty,
//(which is the ground of the Arduino Flora inside shiba and for the circuit to work)
//and--with your other hands--touch other touch points on the shiba to make him sing!!
//
//Parsons School of Design
//Code 1 - Fall 2017
//https://portfolio.newschool.edu/skyta/
//
//Code References:
//1.Ardafruid Console Controller: https://learn.adafruit.com/plush-game-controller/the-code
//
/*
Example code for a Flora game controller with capacitive touch sensing! Full tutorial and video:
 
http://learn.adafruit.com/plush-game-controller/
 
Uses Modern Device's Capacitive Sensing library: https://github.com/moderndevice/CapSense
 
  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!
 
  Written by Limor Fried & Becky Stern for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
  
*/

/////////////////////////////////////////////////////////////////////////

//Introducing which capin will be used and their names:
CapPin cPin_10 = CapPin(10);    // read pin 10 (D10 on Flora) - connect to Paw 4 //(Paws 1 to 4 follow oder left to right when shiba is facing you)
CapPin cPin_9  = CapPin(9);     // read pin 9 (D9 on Flora)   - connect to Paw 3
CapPin cPin_6  = CapPin(6);     // read pin 6 (D6 on Flora)   - connect to Paw 2
CapPin cPin_12 = CapPin(12);    // read pin 12 (D12 on Flora) - connect to Paw 1
CapPin cPin_3  = CapPin(1);     // read pin 1 (TX on Flora)   - connect to Collar
CapPin cPin_2  = CapPin(0);     // read pin 0 (RX on Flora)   - connect to Nose
CapPin cPin_0  = CapPin(2);     // read pin 2 (SDA on Flora)  - connect to Left Ear
CapPin cPin_1  = CapPin(3);     // read pin 3 (SCL on Flora)  - connect to Right Ear

//Creating an array on those Capins to makes keys which will conrespond to them in the next line:
CapPin pins[] = {cPin_10, cPin_9, cPin_6, cPin_12, cPin_1, cPin_0, cPin_2, cPin_3};
 
//Keys related to the capins above by order:
//Link: http://arduino.cc/en/Reference/KeyboardModifiers for more info on other keys to use
char Keys[] =   {  'k',    'j',    'h',     'g',    'f',     'd',    's',    'a'};

//Creating boolean so that when pressing many keys at once, key wouldn't overlap each other so the computer would read them well:
boolean currentPressed[] = {false, false, false, false, false, false, false, false};
 
// Capactive touch threashhold, values indicate how sensitive those pins are
// Change these if they aresensitive or not sensitive enough:
#define THRESH 500
float smoothed[8] = {0,0,0,0,0,0,0,0};

/////////////////////////////////////////////////////////////////////////
void setup(){
  Serial.begin(115200); //Serial number which match with type of Arduino using
  Serial.println("start"); //To check if the Flora is running and if the console window is working
  Keyboard.begin(); //For keyboard library to work
}
 
//For the char keys to work (similar to draw function):
void loop(){ 
  for (int i=0;i<8;i++) { //Pulling out the keys that will be used from array
    delay(1); //Setting a small delay so flora woudn't read too quick and glitch
    long total1 = 0; 
    long start = millis();
    long total =  pins[i].readPin(2000); 
 
    // check if we are sensing that a finger is touching the touch points
    // and that it wasn't already pressed:
    //WHEN PRESSED:
    if ((total > THRESH) && (! currentPressed[i])) {
      Serial.print("Key pressed #"); Serial.print(i);
      Serial.print(" ("); Serial.print(Keys[i]); Serial.println(")");
      currentPressed[i] = true;
 
      Keyboard.press(Keys[i]);
    } 
    //WHEN NOT PRESSED:
    else if ((total <= THRESH) && (currentPressed[i])) {
      // key was released (no touch, and it was pressed before)
      Serial.print("Key released #"); Serial.print(i);
      Serial.print(" ("); Serial.print(Keys[i]); Serial.println(")");
      currentPressed[i] = false;
      
      Keyboard.release(Keys[i]);
    }
    
/*
    // simple lowpass filter to take out some of the jitter
    // change parameter (0 is min, .99 is max) or eliminate to suit
    smoothed[i] = smooth(total, .8, smoothed[i]);   
 
    Serial.print(i); Serial.print(": ");
    Serial.print( millis() - start);      // time to execute in mS
    Serial.print("ms \t");
    Serial.print(total);                  // raw total
    Serial.print("\t->\t");
    Serial.println((int) smoothed[i]);       // smoothed
*/
    delay(5);
  }
}
 
// simple lowpass filter
// requires recycling the output in the "smoothedVal" param
int smooth(int data, float filterVal, float smoothedVal){
 
  if (filterVal > 1){      // check to make sure param's are within range
    filterVal = .999999;
  }
  else if (filterVal <= 0){
    filterVal = 0;
  }
 
  smoothedVal = (data * (1 - filterVal)) + (smoothedVal  *  filterVal);
 
  return (int)smoothedVal;
}



