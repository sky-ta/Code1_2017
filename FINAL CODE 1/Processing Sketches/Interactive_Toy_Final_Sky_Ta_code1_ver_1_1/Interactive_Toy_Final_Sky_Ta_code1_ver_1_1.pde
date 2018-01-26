import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Serial mySerial;
Minim sound;
AudioPlayer player;

//Sensot Vals
int [] sensorValues = {0, 0, 0, 0, 0, 0, 0, 0};
//Val that they pass:
int val1 = 250;
int val2 = 600;
int val3 = 250;
int val4 = 250;
int val5 = 700;
int val6 = 700;
int val7 = 700;
int val8 = 700;

//Sound/movement test jumping:
int rectMoveY = -10;
int rectPosition = height*2/3 ;

////////////////////////////////////////////////////////////////
void setup() {
  size (1200, 1000);
  println(mySerial.list());
  mySerial = new Serial (this, Serial.list()[0], 115200);
  mySerial.bufferUntil('\n') ;
  
  sound = new Minim(this);
  player = sound.loadFile("Drum5.mp3");

  
}

void draw() {
  //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);

  background(0);
  ////println (sensorValues[2]); //Check sensor values

  ////DRAW RECT:
  ////if (sensorValues[3] > 10 && sensorValues[3] > val4) { //should it be vals
  //if (mousePressed){
  //  fill (255);
  //  rect (150, 525, 200, 300);
  //} else {
  //  fill (100);
  //  rect (150, 425, 200, 400);
  //}
  ////println(rectMoveY) ;
  ///*
  //if (sensorValues[2] > 10 && sensorValues[2] < val3) {
  // }
  // if (sensorValues[1] > 10 && sensorValues[1] < val2) {
  // }
  // if (sensorValues[0] > 10 && sensorValues[0] < val1) {
  // }
  // */
}


/////////////////////////////////////////////////////////////////
//For Processing to read the numbers from arduino IDE:
void serialEvent(Serial mySerial) {
  String myData = mySerial.readStringUntil('\n');
  println (myData);

  myData = trim(myData);
  if (myData != null) {
    String[] parsedData = split (myData, ',');
    for (int i = 1; i <= 8; i++) {
      sensorValues[i] = parseInt(parsedData[i]);
    }
  }
}