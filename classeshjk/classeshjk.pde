
Ball b;

void setup(){
  size (1000,1000);
  b = new Ball();
}

void draw (){
  background (0);
  b.update();
  b.checkEdges();
  b.display();
}