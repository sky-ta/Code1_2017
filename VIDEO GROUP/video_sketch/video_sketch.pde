//Link: https://processing.org/tutorials/video/\
//Tuitors: Dylan and Vivian
import processing.video.*;
Capture video;
int x = 0;

void setup() {
  size(1600,1200);
  
  //fullScreen();
  video = new Capture(this, 320, 240, 30); 
  //video = loadCapture();
  
  video.start();
  
}

//void mousePressed(){
//  video.read();

void captureEvent(Capture video){
    video.read();
}

void draw() {
    //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);
  //if(video.available()){
  // video.read(); 
  //}
  background(0);
  image(video, 400, 0, width-400, height-300);
 
}

void mousePressed(){
  if (x < 100) {
    line(x, 0, x, 100);
    x = x + 1;
  } else {
    noLoop();
  }
  // Saves each frame as line-000001.png, line-000002.png, etc.
  saveFrame("line-######.png");
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