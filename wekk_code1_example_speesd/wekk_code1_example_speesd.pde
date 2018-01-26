float angle = 0.0;
float offset = 500;
float scallar = 100;
float speed = 0.01;
float a = random(255);
float b = random(255);
float c = random(255);

void setup() {
  size (1000, 1000);
}

void draw() {
  fill (random(255), random(255), random(255));
  float cosval = offset + cos (angle) * scallar;
  float sinval = offset + sin (angle) * scallar;
  ellipse (cosval, sinval, 300, 300);
  angle += speed;
}