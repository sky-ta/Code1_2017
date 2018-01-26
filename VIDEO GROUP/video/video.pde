//Link: https://processing.org/tutorials/video/\
//Tuitors: Dylan and Vivian
import processing.video.*; //Casual stuff about library
Capture video;

//****************************************************************
void setup() {
  size(1200, 900);
  video = new Capture(this, 320, 240, 30);
  //video = loadCapture();

  video.start();
}

//void mousePressed(){
//  video.read();
//}
void captureEvent(Capture video) {
  video.read();
}

//******************************************************************
void draw() {
  //if(video.available()){
  // video.read(); 
  //}
  background(0);
  image(video, 0, 0, width, height); //if you want to change the sizing to mouse position
  image(video, 0, 0, mouseX, mouseY); //comment out one of the line above
}






//video.loadPixels();
//if(showVideo){
//  image(video, 0, 0);  
//} else {
// background(0); 
//}

//if(video.available()) {
//  //captureEvent(Capture video);
//}
//image(video, 0, 0, width, height);