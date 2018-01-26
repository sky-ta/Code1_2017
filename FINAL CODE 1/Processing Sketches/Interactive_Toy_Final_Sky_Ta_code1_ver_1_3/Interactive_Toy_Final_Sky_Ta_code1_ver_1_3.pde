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
//Tuitors: Prof. Sarah Page, DT Tuitor Aaron
//Code References:
//1. Ardafruid Console Controller: https://learn.adafruit.com/plush-game-controller/the-code
//
/////////////////////////////////////////////////////////////////////////
//LIBRARIES: 
//For Arduino to connect to Processing:
import cc.arduino.*;
import processing.serial.*;

//Minim libraries in Processing for sounds:
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim sound; //naming minim
//Declaring sounds will be used: from Do - Do'
AudioPlayer DO1;
AudioPlayer RE;
AudioPlayer MI;
AudioPlayer FA;
AudioPlayer SOL;
AudioPlayer LA;
AudioPlayer SI;
AudioPlayer DO2;

int timeElapsed; //In case we want to cut a sound shorter

void setup() {
  size (1200, 1000);
  sound = new Minim(this); //for minim
  //Assigning and uploading sound files to each sound variables:
  DO1 = sound.loadFile("1-DO.wav");
  RE = sound.loadFile("2-RE.wav");
  MI = sound.loadFile("3-MI.wav");
  FA = sound.loadFile("4-FA.wav");
  SOL = sound.loadFile("5-SOL.wav");
  LA = sound.loadFile("6-LA.wav");
  SI = sound.loadFile("7-SI.wav");
  DO2 = sound.loadFile("8-DO.wav");
}

void draw() {
  //Example code for cutting a sound file shorter
  /* 
   if (millis() - timeElapsed > 3000) {
   println("3 seconds");
   DO1.pause();
   }
   */
}

void keyPressed() {
  if (key == 'a' || key == 'A') { //When pressed on this key, shiba will shing this note
    DO1.rewind();
    DO1.play();
    timeElapsed = millis();
    println("typed1");
  }
  if (key == 's' || key == 'S') {
    RE.rewind();
    RE.play();
    timeElapsed = millis();
    println("typed2");
  }
  if (key == 'd' || key == 'D') {
    MI.rewind();
    MI.play();
    timeElapsed = millis();
    println("typed3");
  }
  if (key == 'f' || key == 'F') {
    FA.rewind();
    FA.play();
    timeElapsed = millis();
    println("typed4");
  }
  if (key == 'g' || key == 'G') {
    SOL.rewind();
    SOL.play();
    timeElapsed = millis();
    println("typed5");
  }
  if (key == 'h' || key == 'H') {
    LA.rewind();
    LA.play();
    timeElapsed = millis();
    println("typed6");
  }
  if (key == 'j' || key == 'J') {
    SI.rewind();
    SI.play();
    timeElapsed = millis();
    println("typed7");
  }
  if (key == 'k' || key == 'K') {
    DO2.rewind();
    DO2.play();
    timeElapsed = millis();
    println("typed8");
  }
}
//void keyPressed(){