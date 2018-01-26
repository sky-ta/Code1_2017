// Nervous Waves 2
// Levente Sandor, 2014


void setup() {
  size(1000, 1000);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  noiseDetail(2, 0.9);
}

void draw() {
  background(255);
  for (int x = 10; x < width; x += 50) {
    for (int y = 10; y < height; y += 50) {
      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(10 * n);
      rect(0, 0, 1, 1);
      popMatrix();
    }
  }
  
}