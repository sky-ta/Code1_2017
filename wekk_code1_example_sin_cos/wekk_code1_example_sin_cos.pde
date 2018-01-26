float angle;
float sinval;
float cosval;

void setup(){
  size (1000, 1000);
}

void draw() {
  sinval = sin(angle);
  cosval = cos(angle);
  noStroke();
  float gray = map (sinval, -1, 1, 0, 255);
  background(gray);
  float gray2  = map (cosval, -1, 1, 0, 255);
  fill (gray2, 255 - gray2, gray2);
  ellipse (width/2, height/2, 300, 300);
  println(sinval +", "+ cosval+", "+gray);
  angle += 0.25;
}