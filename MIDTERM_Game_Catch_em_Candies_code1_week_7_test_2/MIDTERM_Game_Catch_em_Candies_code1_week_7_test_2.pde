//Tuitors: Vivian, Aaron, Dylan
//FUCTIONS:
//Link of help Jumping object: https://www.openprocessing.org/sketch/92234
//Link of help Gravity effect: http://learningprocessing.com/examples/chp05/example-05-09-gravity
//IMAGES:
//Link of Item Images: https://weheartit.com/entry/195877539
//Link of Thesaurus Image: https://www.tenstickers.co.uk/stickers/pixel-dinosaur-wall-sticker-9227
//Link of Background Image: https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwi2osTb_YvXAhXHOyYKHZlvAUAQjhwIBQ&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F399201954440401876%2F&psig=AOvVaw3vskFxWC6mZUbAugeVSD1C&ust=1509028028100392

int screenSelector; //Changing screens
//Naming types of fonts to be used:
PFont sugarvine;
PFont kroe;
PFont fipps;
PFont Bfont;

//Buttons: 
PImage butPlay; //calling out names of the button images to be uploaded (play button, instruction button, etc)
PImage butInstructions;
PImage butBack;

//Items:............................................
//Item 1: 
PImage item1; //item 1 image
float ranSizeItem1; //randomsizing of the item whenever it goes off the screen and come back
float xItem1; //width of item 1
float yItem1; //height of item 1
float speedX1 = 10; //speed of item moving across the screen
float ranValItem; //intially was made for the first attemp of decreasing health, which didn't work
boolean changeSize = false; //seeting this boolean so that the item only change in size once it passes the screen, not while it still going through the screen 
//Without the changeSize boolean, item glitches in size when it's going through the screen
boolean item1On = true; //setting this boolean so the item would dissapear when the collision happens

//Item 2:
PImage item2; //item 2
float ranSizeItem2;
float xItem2;//width of item 2
float yItem2;//height of item 2
float speedX2 = 15; //speed of item moving across the screen
boolean item2On = true; //setting this boolean so the item would dissapear when the collision happens

//Item 3:
PImage item3; //item 3float ranSizeItem3;
float ranSizeItem3;
float xItem3;//width of item 3
float yItem3;//height of item 3
float speedX3 = 18; //speed of item moving across the screen
boolean item3On = true; //setting this boolean so the item would dissapear when the collision happens

//Item 4:
PImage item4; //item 3float ranSizeItem3;
float ranSizeItem4;
float xItem4;//width of item 3
float yItem4;//height of item 3
float speedX4 = 19; //speed of item moving across the screen
boolean item4On = true; //setting this boolean so the item would dissapear when the collision happens

//Health bar:
int health; //value of health, initially was 100 and decrease as the theSaurus collide with bad item
float healthX; //the length of the health bar, decrease with the health
float healthY; //stay the same

//*********************************Your thesaurus:*************************************
//float xThesaurus = width/3;
//float yThesaurus;

class theJump
{
  PImage image; //calling the theSaurus image name
  PVector position; //x and y of the theSaurus
  float direction; //theSaurus moving to direction left or right
  PVector velocity; //velocity of the theSaurus
  float jumpSpeed; // velocity of theSaurus going up
  float walkSpeed; //  velocity of theSaurus going side to side
}

// GLOBAL VARIABLES:

theJump theSaurus;
float left;
float right;
float up;
float down;

// half a pixel per frame gravity.
float gravity = 0.5; //Create a gravity effect when the theSaurus jump and fall

// Y coordinate of ground
float ground = 700;
//******************************************************************************************

//Other:
//PImage pageInstructions;
PImage backGround; 


//******************************VOID SETUP****************************************************//
void setup() {
  frameRate(50); //how fast or smooth the sketch will run
  backGround = loadImage("background.png"); //assign which png file to be used for background

  size (1200, 1000);
  screenSelector = 0; //assign an initial val for screenSelector

  //Health:
  health = 100; //assign Health val
  //FONTS:
  sugarvine= createFont ("Sugar & Vinegar.ttf", 100); //uploading fonts
  kroe = createFont ("kroe0555.ttf", 50);
  fipps = createFont ("Fipps-Regular.otf", 70);
  Bfont = createFont("04B_30__.TTF", 100);

  //BUTTONS:
  butPlay = loadImage("PLAY.png"); //uploading images for buttons
  butInstructions = loadImage("INSTRUCTIONS.png");
  butBack = loadImage ("Back.png"); 
  //Items: assigning the png file that each item will be
  item1 = loadImage("item1.png"); //uploading images for items
  item2 = loadImage("item2.png");
  item3 = loadImage("item3.png");
  item4 = loadImage("item4.png");


  //Items vals:
  ranSizeItem1 = random (50, 150); //Randomizing size of Items
  ranSizeItem2 = random (60, 90); 
  ranSizeItem3 = random (70, 180);
  ranSizeItem4 = random (50, 100);

  xItem1 = 0; //initial xPos of item 1
  speedX1 = 10; //speed of item1

  //THESAURUS:
  theSaurus = new theJump(); //making a class for theSaurus moving variables
  theSaurus.image = loadImage("thesaurus.png");  //Image to be used for the theSaurus
  theSaurus.position = new PVector(width/2, ground); //x and y of theSaurus
  theSaurus.direction = 1; //
  theSaurus.velocity = new PVector(0, 0);
  theSaurus.jumpSpeed = 20;
  theSaurus.walkSpeed = 4;

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
    image (backGround, width/2, height/2, 1200, 1000);
    fill(255);
    textAlign(CENTER);
    textFont(sugarvine);
    text ("Catch 'em" + '\n' + "CANDIES", width/2, height/4+50);

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

  if (changeSize == true) {
    drawPizza();
  }
}

//******************************SCREEN 1: PLAY************************************************************//
void screen1() {
  image (backGround, width/2, height/2, 1200, 1000);

  //Health:
  //println(health);
  healthX = width* health/100;  //how health bar is displayed on the sceen (will descrease when eat theSaurus eat bad item)
  healthY = 30; 

  if (health <=50 && health >25) { //coloring healthbar
    fill (255, 255, 0);
  } else if (health <= 25) {
    fill (0, 0, 255);
  } else {
    fill(255, 0, 0);
  }
  rect(0, 0, healthX, healthY); //display of healthbar on top of sceen in form of long rectangle

  //if colision happens then healh -= 5;
  //ranValItem = constrain(xItem1, 20, 70);
  //if (xItem1+ranValItem == theSaurus.position.x && yItem1 + ranValItem == theSaurus.position.x) {
  //  health -=5;
  //}


  //ITEMS:
  //..............ITEM1..............:
  yItem1 = width/5; //yPos of item

  if (item1On == true) {
    image(item1, xItem1, yItem1, ranSizeItem1, ranSizeItem1); //(image, xPos, yPos, xSize, ySize)
    if (xItem1 > width) { //Equation so that item come back after going off the screen
      changeSize = true;
      xItem1 = - 100;
    }
  }
  xItem1 += speedX1;
  //  println(ranSizeItem1);
  //  println(changeSize);

  //ITEM1 COLLISION: ................
  float dis1 = dist(xItem1, yItem1, theSaurus.position.x, theSaurus.position.x); //equation which calculate the distance between a point of the item's image and the theSaurus

  if (dis1 < 120) { //when distance between the item and the theSaurus smaller than this valuable
    item1On = false; // the item won't be drawn (theSaurus ate the item)

    xItem1 = - 300; // re-stating item1 equation so that the item appear at the beggining of the screen again
    xItem1 += speedX1;
    image(item1, xItem1, yItem1, ranSizeItem1, ranSizeItem1);
  } 
  item1On = true; // item1 is drawn again

  //..............ITEM2..............:
  yItem2 = width/4; //

  if (item2On == true) {
    image(item2, xItem2, yItem2, ranSizeItem2, ranSizeItem2); //(image, xPos, yPos, xSize, ySize)
    if (xItem2 > width) {
      changeSize = true;
      xItem2 = - 100;
    }
  }
  xItem2 += speedX2;

  //...............ITEM2 COLLISION: ................
  float dis2 = dist(xItem2, yItem2, theSaurus.position.x, theSaurus.position.x); //equation which calculate the distance between a point of the item's image and the theSaurus

  if (dis2 < 140) { //when distance between the item and the theSaurus smaller than this valuable
    item2On = false; // the item won't be drawn (theSaurus ate the item)

    xItem2 = - 100; // re-stating item1 equation so that the item appear at the beggining of the screen again
    xItem2 += speedX2;
    image(item2, xItem2, yItem2, ranSizeItem2, ranSizeItem2);
  } 
  item2On = true; // item is drawn again

  //..............ITEM3..............:
  yItem3 = width/2.5; //

  if (item3On == true) {
    image(item3, xItem3, yItem3, ranSizeItem3, ranSizeItem3); //(image, xPos, yPos, xSize, ySize)
    if (xItem3 > width) {
      changeSize = true;
      xItem3 = - 100;
    }
  }
  xItem3 += speedX3;

  //...............ITEM3 COLLISION: ................
  float dis3 = dist(xItem3, yItem3, theSaurus.position.x, theSaurus.position.x); //equation which calculate the distance between a point of the item's image and the theSaurus

  if (dis3 < 140) { //when distance between the item and the theSaurus smaller than this valuable
    item3On = false; // the item won't be drawn (theSaurus ate the item)

    xItem3 = - 400; // re-stating item1 equation so that the item appear at the beggining of the screen again
    xItem3 += speedX3;
    image(item3, xItem3, yItem3, ranSizeItem3, ranSizeItem3);
  } 
  item3On = true; // item is drawn again

  //..............ITEM4..............:
  yItem4 = width/3; //

  if (item4On == true) {
    image(item4, xItem4, yItem4, ranSizeItem4, ranSizeItem4); //(image, xPos, yPos, xSize, ySize)
    if (xItem4 > width) {
      changeSize = true;
      xItem4 = - 500;
    }
  }
  xItem4 += speedX4;

  //...............ITEM4 COLLISION: ................
  float dis4 = dist(xItem4, yItem4, theSaurus.position.x, theSaurus.position.x); //equation which calculate the distance between a point of the item's image and the theSaurus

  if (dis4 < 135) { //when distance between the item and the theSaurus smaller than this valuable
    item4On = false; // the item won't be drawn (theSaurus ate the item)

    xItem4 = - 100; // re-stating item1 equation so that the item appear at the beggining of the screen again
    xItem4 += speedX4;
    image(item4, xItem4, yItem4, ranSizeItem4, ranSizeItem4);
    health -=5;
  } 
  item4On = true; // item is drawn again



  println(dis1);
  println(item1On);

  //***********************THESAURUS:******************//
  // Only apply gravity if the theSaurus is flying above ground (since y positive is down we use < ground)
  if (theSaurus.position.y < ground) {
    theSaurus.velocity.y += gravity;
  } else {
    theSaurus.velocity.y = 0;
  }

  // If on the ground and "jump" keyy is pressed set my upward velocity to the jump speed!
  if (theSaurus.position.y >= ground && up != 0) {
    theSaurus.velocity.y = -theSaurus.jumpSpeed;
  }

  // Walk left and right.
  theSaurus.velocity.x = theSaurus.walkSpeed * (left + right);

  // We check the nextPosition before actually setting the position so we can
  // not move the if he's colliding.
  PVector nextPosition = new PVector(theSaurus.position.x, theSaurus.position.y);
  nextPosition.add(theSaurus.velocity);

  // Check collision with edge of screen and don't move if at the edge
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset)) {
    theSaurus.position.x = nextPosition.x;
  } 
  if (nextPosition.y > offset && nextPosition.y < (height - offset)) {
    theSaurus.position.y = nextPosition.y;
  } 

  // See car example for more detail here.
  pushMatrix();

  translate(theSaurus.position.x, theSaurus.position.y);

  // We're using theSaurus.direction because a -1 scale flips the image in that direction.
  scale(theSaurus.direction, 1);

  imageMode(CENTER);
  image(theSaurus.image, 0, 0, 200, 200);

  popMatrix();
}


void keyPressed() {
  if (key == 'd' || key == 'D') {
    right = 2;
    theSaurus.direction = -1;
  }
  if (key == 'a' || key == 'A') {
    left = -2;
    theSaurus.direction = 1;
  }
  if (key == 'w' || key == 'W') {
    up = -2;
  }
  if (key == 's' || key == 'S') {
    down = 5;
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    right = 0;
  }
  if (key == 'a' || key == 'A') {
    left = 0;
  }
  if (key == 'w' || key == 'W') {
    up = 0;
  }
  if (key == 's' || key == 'S') {
    down = 0;
  }
}
//................................Draw Item1 Function..................
void drawPizza() {
  image(item1, xItem1, yItem1, random(50, 150), random(50, 150));
  changeSize = false; //setting as false so item is drawn
}
//******************************SCREEN 2: INSTRUCTIONS*******************************************************//
void screen2() {
  //image (pageInstructions, width/2, height/2);
  fill (249, 255, 223);
  rect (width/2 - 400, height/2 - 300, 800, 600);

  //Text:
  fill(30, 50, 50);
  textAlign(CORNER);
  textFont(fipps);
  text ("A", 272, 407);
  text ("W", 272, 407 + 100);
  text ("S", 272, 407 + 100*2); 
  text ("D", 272, 407 + 100*3);

  textFont(kroe);
  text ("= move left", 378, 385);
  text ("= jump", 385, 385 + 100);
  text ("= move down", 378, 385 + 100*2);
  text ("= move right", 378, 385 + 100*3);


  //Illustration:
  image (theSaurus.image, width*2/3 + 30, height/2+10, 180, 180);

  //Back to previous screen:
  image (butBack, width/2 + 300, height/2 + 350);
  if (mousePressed && mouseX >= 768 && mouseX <= 1033 && mouseY >= 821 && mouseY <= 879) {
    screenSelector = 0;
  }
}

//******************************SCREEN 3: HIGHSCORE*******************************************************//
void screen3() {
}