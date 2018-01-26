void setup (){
  size (1000, 1000);
  noStroke();
  smooth();
  //fullScreen();
}

void draw(){
  if (mousePressed){
  for (int i = 0; i<1000; i+=100){
  for (int j = 0; j<1000; j+=100){
  fill(0);
  ellipse (i+50, j+50, 50, 50);
  }
  }
  for (int a = 0; a<1000; a+=100){
  for (int b = 0; b<1000; b+=100){
    float r = random(255);
  fill(r, r+30,r+50,r+3);
  ellipse (a+50, b+50, a, b);
  }
  }
  }
}