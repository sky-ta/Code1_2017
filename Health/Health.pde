int health;
float rectX;
float rectY = 10;

void setup() {
  size (1000, 1000);
  health = 100;
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

  rect(0, 0, width * health/100, rectY);
}

void mousePressed() {
  health -= 5;
}