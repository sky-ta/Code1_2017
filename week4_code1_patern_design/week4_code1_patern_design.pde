float xoff = 0.0; //Introduce xoff as the location of the line (moved by the noise)

void setup() {
  size (1600, 1600);
  noLoop(); //So that there is no action on screen when no key is pressed
}

void draw () {
  //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);

  //Moving VERTICLE line by noise
  //background(0);
  xoff = xoff +.01;
  float n = noise (xoff)*width;
  float Ranxoff = random(40);
  strokeWeight(Ranxoff);
  line(n, 0, n, height);

  //Moving HORIZONTAL lines by mouse position:
  for (int i = 0; i < 1600; i++) {
    println("Zap!!");
    float r = random(50);
    stroke(r*5);
    line(mouseX+r, i, mouseY+r, i);
  }
}

void mousePressed(){
  loop(); //Setting when the loop will start
}

void mouseReleased() {
  noLoop();
}

void keyPressed(){
  float RBackground = (255);
  float GBackground = (255);
  float BBackground = (255);
  background(RBackground, GBackground, BBackground);
}