import cc.arduino.*;
import processing.serial.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim sound;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

int timeElapsed;

void setup() {
  size (1200, 1000);
  sound = new Minim(this);
  player1 = sound.loadFile("Drum5.mp3");
  player2 = sound.loadFile("Footsteps - SOUND EFFECTS - Steps Schritte SOUND.mp3");
  player3 = sound.loadFile("ROMANTIC MUSIC - SUSPENSE MUSIC - Forgotten Romance.mp3");

  //player2 = sound.loadFile("Do.acc");
}

void draw() {
  if (millis() - timeElapsed > 3000) {
    println("3 seconds");
    player1.pause();
  }

  //if (keyReleased == true) {
  //  if (key == 'a' || key == 'A') {
  //    player.rewind();
  //    player.play();
  //  }
  //}
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    player1.rewind();
    player1.play();
    timeElapsed = millis();
    println("typed1");
  }
  if (key == 's' || key == 'S') {
    player2.rewind();
    player2.play();
    timeElapsed = millis();
    println("typed2");
  }
  if (key == 'd' || key == 'D') {
    player3.rewind();
    player3.play();
    timeElapsed = millis();
    println("typed3");
  }
  //  if (key == 'f' || key == 'F'){
  //    player.rewind();
  //    player.play();
  //    timeElapsed = millis();
  //}
  //  if (key == 'g' || key == 'G'){
  //    player.rewind();
  //    player.play();
  //    timeElapsed = millis();
  //}
  //  if (key == 'h' || key == 'H'){
  //    player.rewind();
  //    player.play();
  //    timeElapsed = millis();
  //}
  //  if (key == 'j' || key == 'J'){
  //    player.rewind();
  //    player.play();
  //    timeElapsed = millis();
  //}
  //  if (key == 'k' || key == 'K'){
  //    player.rewind();
  //    player.play();
  //    timeElapsed = millis();
  //}
}
//void keyPressed(){