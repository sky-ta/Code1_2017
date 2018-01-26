//import minim library Sketch\Import Library...\Minim:
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; //Like Arduino arduino (creating a Minim called minim)
AudioPlayer player; //similar to int x (type of thing we are making) annd this is one of the sound
PImage car;
PFont fontfont;

void setup() {
  size(2000,2000);
  
  minim = new Minim(this);
  
  player = minim.loadFile("honk.wav");
  car = loadImage("fastaf.jpg");
  fontfont = createFont("Hamster.otf", 50); //for text ("textfile", size of text) becareful of caps
  player.play(); // to run the sound // if in setup then only played once
  // if in draw then it will loop and creat weird echo
}

void draw() {
  //image(car, 50,50);
  textFont(fontfont);
  text ("BISH!!", 50, 50);
}

void mousePressed(){
  player.rewind();
  player.play();
  image(car, mouseX, mouseY); //if it's put int draw then it will create a line of images

  text ("BISH!!", mouseX, mouseY);

  //image(car, mouseX, mouseY); //if put in here image only apprears once clicked along with sound
  

}