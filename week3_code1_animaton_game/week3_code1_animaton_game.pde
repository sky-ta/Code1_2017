int xPos = 0;
int yPos = 800;
PImage img;

void setup() {
  size(1500, 1500);
  background(153);
}

void draw() {
  size(1500, 1500);
  background(30);

  //FAST:
  if (mousePressed==true) {
    //Background:
    size(1500, 1500);
    background(200);
    
    //Monster:
    xPos =xPos+10;
    fill(192,250,105);
    stroke(255);
    strokeWeight(5);
    rect(xPos, yPos, 150, 85);
    //eye:
    fill(255);
    rect(xPos+80, yPos-30, 60, 60);
    fill(0);
    rect(xPos+110, yPos-30, 30, 30);
    //blush:
    //
    
    //Dot:
    noStroke();
    fill(255,51,51);
    ellipse(xPos+200, yPos-70, 10,10);
    
    //Text running on console:
    println("Laser light is on-... SONIC IS THAT U???");
    //Text runnin g on screen:
    fill(255,204,204);
    textSize(100);
    text("OMG \n PLSSSSSS!",width/2-200, height/2 - 350);

    //SLOOOWWWW:
  } else {
    //Background:
    size(1500, 1500);
    background(30);
    
    //Monster:
    xPos =xPos+1;
    //noStroke();
    stroke(255);
    strokeWeight(2);
    fill(192,250,190);
    rect(xPos, yPos-30, 100, 100);
    //eye:
    fill(255);
    rect(xPos+60, yPos-20, 60, 60);
    fill(0);
    rect(xPos+70, yPos-16, 50, 50);
    
    //Text running on console:
    println("Laser light is off.");
    //Text runnin g on screen:
    fill(255);
    textSize(100);
    text(".....",width/2-100, height/2 - 350);
  }

  if (xPos>width) {
    xPos= 0;
  }
}