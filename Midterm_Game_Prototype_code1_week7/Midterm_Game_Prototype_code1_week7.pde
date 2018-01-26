float r;
float x = -r*2; //x position of the ellipse/item
float speedX = 10; //
float rectW = width/5;
float rectH = height*1.5/3;
char Keys[] = {' '};
PImage strawberry;
int health;
float rectX;
float rectY = 10;

void setup () {
  frameRate(25);
  size (1000, 1000);
  //rectMode(CORNERS);
  noStroke();

  health = 100;

  strawberry = loadImage("strawberry.png");
  r = random (90, 150);
}

void draw() {
  background(0);
  println(health);
  if (health <=50 && health >25) {
    fill (255, 255, 0);
  } else if (health <= 25) {
    fill (0, 0, 255);
  } else {
    fill(255, 0, 0);
  }
  fill (255);
  rect(0, 0, width * health/100, rectY);
  x+= speedX;
  image(strawberry, x, width/4, r, r);
  rect(width/2, height*2/3, rectW, rectH);
  println (x);
  if (x>= width) {
    r = random (90, 150);
    x = -r*2;
  }
}

void mousePressed ( ) {
  rectH = rectH - 10;
  fill (255);
  rect (width/2, height*2/3, rectW, rectH);
  if (rectH == height*1.5/3) {
    rectH = height*1.5/3;
  }
}