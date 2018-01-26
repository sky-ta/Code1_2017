int screenSelector;
boolean gameStart = false;
PFont sugarvine;
//Buttons:
PImage butPlay;
PImage butInstructions;
PImage butBack;
//Items:
PImage item1; //item 1
float ranItem1 = random (30, 50);
float xItem1 = -ranItem1 *2; //x position of the item
float speedX1 = 10; //speed of item moving across the screen

PImage item2; //item 2
PImage item3; //item 3
//Other:
PImage pageInstructions;
//Health bar:
int health;
float healthX;
float healthY;


//******************************VOID SETUP****************************************************//
void setup() {
  frameRate(25);

  size (1200, 1000);
  screenSelector = 0;
  //Health:
  health = 100;
  //FONTS:
  sugarvine= createFont ("Sugar & Vinegar.ttf", 100);
  //BUTTONS:
  butPlay = loadImage("PLAY.png");
  butInstructions = loadImage("INSTRUCTIONS.png");
  butBack = loadImage ("Back.png"); 
  //Items:
  item1 = loadImage("item1.png");
  item2 = loadImage("item2.png");
  item3 = loadImage("item3.png");
  //other:
  //pageInstructions = loadImage("pageInstructions.png");
}

//******************************VOID DRAW*****************************************************//
void draw() {
  //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);

  //SCREENS:
  if (screenSelector == 0) {
    //Background of the game:
    background(0);
    fill(30, 50, 50);
    textAlign(CENTER);
    textFont(sugarvine);
    text ("Catch 'em" + '\n' + "CANDIES", width/2, height/4);

    //BUTTONS dislayed on the first screen
    //and functions for other screens:
    imageMode(CENTER);
    image (butPlay, width/2, height*2/3);
    image (butInstructions, width/2, height*2/3 + 100);
  } else if (screenSelector == 1) {
    screen1();
  } else if (screenSelector == 2) {
    screen2();
  } else if (screenSelector == 3) {
    screen3();
  }
  //PLAY:  
  if (mousePressed && mouseX >= 409 && mouseX <= 793 && mouseY >= 637 && mouseY <= 696) {
    screenSelector = 1;
  }
  //INSTRUCTIONS:
  if (mousePressed && mouseX >= 409 && mouseX <= 793 && mouseY >= 736 && mouseY <= 793) {
    screenSelector = 2;
  }
}

//******************************SCREEN 1: PLAY************************************************************//
void screen1() {
  background(10);
  //Health:
  println(health);
  healthX = width* health/100;
  healthY = 50;
  if (health <=50 && health >25) {
    fill (255, 255, 0);
  } else if (health <= 25) {
    fill (0, 0, 255);
  } else {
    fill(255, 0, 0);
  }
  rect(0, 0, healthX, healthY);
  //if colision happens then healh -= 5;
  xItem1 += speedX1;
  image(item1, xItem1, width/4, ranItem1, ranItem1);
}


//******************************SCREEN 2: INSTRUCTIONS*******************************************************//
void screen2() {
  //image (pageInstructions, width/2, height/2);
  fill (255);
  rect (width/2 - 400, height/2 - 300, 800, 600);
  //Back to previous screen:
  image (butBack, width/2 + 300, height/2 + 350);
  if (mousePressed && mouseX >= 768 && mouseX <= 1033 && mouseY >= 821 && mouseY <= 879) {
    screenSelector = 0;
  }
}

//******************************SCREEN 3: HIGHSCORE*******************************************************//
void screen3() {
}