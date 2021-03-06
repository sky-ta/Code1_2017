//Link: https://processing.org/tutorials/video/\
//Tuitors: Dylan and Vivian
import processing.video.*; //Casual stuff about library
Capture video;
int x = 0;

//****************************************************************
void setup() {
  size(1600, 1200);
  video = new Capture(this, 320, 240, 30);
  //video = loadCapture();

  video.start();
}

//void mousePressed(){
//  video.read();

void captureEvent(Capture video) {
  video.read();
}

//******************************************************************
void draw() {
  //if(video.available()){
  // video.read(); 
  //}
  background(0);
  image(video, 400, 0, width-400, height-300); //if you want to change the sizing to mouse position
  //image(video, 0, 0, mouseX, mouseY); //comment out one of the line above

  //.........Boxes____:
  fill(255);
  noStroke();
  rect(0, 0, 400, 300);
  rect(0, 300, 400, 300);
  rect(0, 600, 400, 300);
  rect(0, 900, 400, 300);
  //.........Boxes|||:
  rect(400, 900, 400, 300);
  rect(800, 900, 400, 300);
  rect(1200, 900, 400, 300);
}


//**********SAVE VIDEO UPON MOUSE CLICK*******************
void mousePressed() {
  if (x < 100) {
    line(x, 0, x, 100);
    x = x + 1;
  } else {
    noLoop();
  }
  // Saves each frame as line-000001.png, line-000002.png, etc.
  saveFrame("pic-######.png");
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