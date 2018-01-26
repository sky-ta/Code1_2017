float speed = 3;
float x = -10;

void draw (){
  x = x + speed;
  ellipse (x, 50, 20, 20);
  if (x > width + 10){
    x = -10;
  }
}