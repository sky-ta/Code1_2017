float currentX;
float currentY;

float targetX;
float targetY;
float easing = .05;

void setup(){
  size (1000, 1000);
}
void draw(){
  background (50,50,50,244);
 targetX = mouseX;
 targetY = mouseY;
 currentX += (targetX - currentX)*easing;
 currentY += (targetY - currentY)*easing;
 ellipse (currentX, currentY, 66, 66);
 
}