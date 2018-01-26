// simple and fast Voronoi diagram with Hoff's algorithm
// sandorlevi, 2016

float r;
int n = 30;
Cell cells[] = new Cell[n];

//void setup() {
//  size(1000,1000, P3D);
//  colorMode(HSB, 1);
//  noStroke();
//  r = dist(0, 0, width, height);
//  ortho(-width / 2, width / 2, -height / 2, height / 2, 0, r);
//  for (int i = 0; i < n; i++) {
//    cells[i] = new Cell(
//      random(width), random(height), 
//      random(-1, 1), random(-1, 1));
//  }
//}

//void draw() {
//  for (int i = 0; i < n; i++) {
//    fill(0.15 * float(i) / n, 1, 1);

//    cells[i].show();
//    cells[i].advance();
//  }
//  fill(0.7, 1, 1);
//  Cell cell = new Cell(mouseX, mouseY, 0, 0);
//  cell.show();
//}

class Cell {
  float x, y, sx, sy;

  Cell(float x, float y, float sx, float sy) {
    this.x = x;
    this.y = y; 
    this.sx = sx; 
    this.sy = sy;
  }

  void show() {
    pushMatrix();
    translate(this.x, this.y, 0);
    float a = 0;
    float s = 30;
    float p = TWO_PI / s;
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i <= s; i++) {
      vertex(0, 0, 0);
      vertex(r * cos(a), r * sin(a), -r);
      vertex(r * cos(a + p), r * sin(a + p), -r);

      a += p;
    }
    endShape();


    fill(0);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  void advance() {
    this.x += this.sx;
    this.y += this.sy;
    if (this.x < 0 || this.x > width) {
      this.sx = -this.sx;
    }     
    if (this.y < 0 || this.y > height) {
      this.sy = -this.sy;
    }
  }
}