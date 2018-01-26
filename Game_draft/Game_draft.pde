int health;
float healthX;
float healthY = 10;

void setup() {
  size (2000, 1600);
  health = 100;
}

void draw() {
  background(0); //change to the image u want
  int xp = constrain (health, 0, 100);
  println(xp);
  healthX = width * health/100;

  if (health <=50 && health >15) { //change of color when the health decreases
    fill (255, 255, 0);
  } else if (health <= 15) {
    fill (0, 0, 255);
  } else {
    fill(255, 0, 0);
  }
  //healthY = constrain (healthY, 0 , 100) + 10;
  rect(0, 0, healthX, healthY);
}

void mousePressed() {
  health -= 5;
}