float xPos = 300;//Location x and y of snow
float yPos;
float speedX = 10; //change of speed of the snow (left right)
float speedY = 9; //down direction

int colorSpeed = 100; //change of snow gradient

void setup() {
  size(1200, 1000);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  //Snow falling:
    background (0);
    println(colorSpeed);
    
//for (int i = 0; i <=100; i = i + width/10){ //suppose to create many snowflakes falling
 // xPos = xPos + i;
      if (mousePressed) {
      xPos+= random(-speedX, speedX);
      yPos+= speedY;

      colorSpeed = constrain(colorSpeed, 0, 255) + 15;
    } else {
      colorSpeed = colorSpeed - 10;
     }
     fill (255, 255, 255, colorSpeed); //suppose to make the snow dim down color after mousere leasec

     ellipse (xPos+30, yPos, 40, 40);
    if (yPos >= 1000) {
      yPos = 0;
    }
  }
//}