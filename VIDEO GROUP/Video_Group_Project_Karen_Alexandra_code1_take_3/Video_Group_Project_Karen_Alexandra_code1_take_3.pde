//Link: https://processing.org/tutorials/video/
//Tuitors: Dylan and Vivian

import processing.video.*; //Casual stuff about library
Capture video;
//Int x to SCREENSHOT:
int x = 0;

//SCREENS changing:
int screenSelector;

//~~~~~~~~~~~~~~~~~~IMAGES
//int that shows what image we have currently chosen:
int chosenImage = 0; 
//~~~~~~~~~~~~~~Set 1:
//PImage [] picGroup1 = new PImage [6];
PImage[] stickers = new PImage [50];
//isOn1 keeps track of whether the images is on the screen or not.
//right now, it is not.
boolean isOn1 = false;
//x1 and y1 keep track of the x and y position of the image
int x1 = 0;
int y1 = 0;

//~~~~~~~~~~~~~~Set 2:
PImage anImage2;
//isOn2 keeps track of whether the waffle is on the screen or not.
//right now, it is not.
boolean isOn2 = false;
//x2 and y2 keep track of the x and y position of the waffle image
int x2 = 0;
int y2 = 0;

//~~~~~~~~~~~~~~Set 3:
PImage anImage3;
//isOn2 keeps track of whether the waffle is on the screen or not.
//right now, it is not.
boolean isOn3 = false;
//x2 and y2 keep track of the x and y position of the waffle image
int x3 = 0;
int y3 = 0;


//Background:
PImage backGround;

//FONTS:
PFont sugarvine;

//PImage partialSave = get(400,0,1200,900);


//****************************************************************
void setup() {
  noStroke();  
  size(1600, 1200);
  screenSelector = 0;
  backGround = loadImage("background.png");

  //FONT:
  sugarvine= createFont ("Sugar & Vinegar.ttf", 100);

  //IMAGES:
  //Group 1: Shibas
  //picGroup1[0] = loadImage ("shiba 1.png");
  //picGroup1[1] = loadImage ("shiba 2.png");
  //picGroup1[2] = loadImage ("shiba 3.png");
  //picGroup1[3] = loadImage ("shiba 4.png");
  //picGroup1[4] = loadImage ("shiba 5.png");
  //picGroup1[5] = loadImage ("shiba 6.png");
  anImage2 = loadImage("image2.png");
  anImage3 = loadImage("image3.png");

  ///////////VIDEO INFO//////////////////
  String[] cameras = Capture.list();
  //if cameras == null, then tries to use the default camera
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");  
    //VIDEO:
    video = new Capture(this, 320, 240, 30);
    //if there isn't a camera, stop trying to use a camera
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    video = new Capture(this, cameras[12]); 
    // this starts capturing images from the camera
    video.start();
    /////// END CAMERA STUFF /////////////
  }
}

//******************************************************************
void draw() {
  //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);

  //~~~~~~~~~~SCREENS:
  //~~~OPENING SCREEN with instructions:
  if (screenSelector == 0) {
    introScreen();
  } else if (screenSelector == 1) {
    cameraPlay();
  } else if (screenSelector == 2) {
    instruction();
  }
  //} else if (screenSelector == 3) {
  //  // screen3();
}
//******************************************************************

void introScreen() {
  //loop();
  //image (backGround, width/2, height/2, 1200, 1000);
  background(0);

  //TiTLE:
  fill(255);
  textAlign(CENTER);
  textFont(sugarvine);
  textSize(100);
  text ("KAWAII" + '\n' + "camera", width/2, height/4 + 40);

  //~~~~~~~~~Buttons to other Screens:
  //~~~PIC button:
  fill (40, 90, 40);
  rect (width/2 - 250, height/2, 500, 200);
  //"take pic":
  fill(255);
  textFont(sugarvine);
  textSize(50);
  text ("TAKE PIC", width/2, height/2 +120);
  //~~~INSTRUCTIONS button:
  fill (40, 90, 40);
  rect (width/2 - 250, height/2 + 250, 500, 100);
  //"Instructions":
  fill(255);
  textFont(sugarvine);
  textSize(50);
  text ("Instructions", width/2, height/2 +310);

  //to change screens:
  if (mousePressed && mouseX >= 550 && mouseX <= 1050 && mouseY >= 600 && mouseY <= 800) {
    screenSelector = 1;
  }
  if (mousePressed && mouseX >= 550 && mouseX <= 1050 && mouseY >= 850 && mouseY <= 950) {
    screenSelector = 2;
  }
}

//******************************************************************

void instruction() {
  fill(200, 200, 60);
  rect(0, 0, width, height);

  //Back button:  
  fill (250);
  rect (width/2 - 250, height/2 - 500, 500, 100);
  //"back":
  textAlign(CENTER);
  textFont(sugarvine);
  textSize(50);
  fill(0, 102, 153);
  text ("back", width/2, height/2 - 430);

  //to go back to introScreen():
  if (mousePressed && mouseX >= 550 && mouseX <= 1050 && mouseY >= 100 && mouseY <= 200) {
    screenSelector = 0;
  }
}






//******************************************************************

void cameraPlay() {
  background(0);
  //.........Boxes____: //These are just to see the devision of the sections (not so important)
  noStroke();
  fill (255, 255, 255);
  rect(0, 0, 400, 300);
  fill(240);
  rect(0, 300, 400, 300);
  fill(225);
  rect(0, 600, 400, 300);
  fill(210);
  rect(0, 900, 400, 300);
  //.........Boxes|||:
  fill(255, 204, 255);
  rect(400, 900, 400, 300);
  fill(179, 255, 230);
  rect(800, 900, 400, 300);
  fill(204, 235, 255);
  rect(1200, 900, 400, 300);

  /////////////////IMAGES:
  noLoop();
  for (int i = 0; i < stickers.length; i++) {
    stickers [i] = loadImage(i+".png");
  }
  loop();
  /////////// VIDEO STUFF ///////////////
  //this reads whether the camera is true. if it is read whatever is coming from it.
  if (video.available() == true) {
    video.read();
  }
  image(video, 400, 0, width-400, height-300); //if you want to change the sizing to mouse position
  //image(video, 0, 0, mouseX, mouseY); //comment out one of the line above
  //////// END VIDEO STUFF /////////////

  //check to see if the isOn1 boolean is switched to true. 
  //if so, show the image of the rice at the saved x and y position
  if (isOn1 == true) {
    noLoop();
    int index = int(random(0, stickers.length));
    loop();
    image (stickers[index], x1, y1);
  }

  //check to see if the isOn2 boolean is switched to true. 
  //if so, show the image of the waffle at the saved x and y position
  if (isOn2 == true) {
    image(anImage2, x2, y2);
  }

  ////this makes a black menu bar at the bottom of the screen
  //fill(0, 0, 0, 170);
  //rect(0, height-100, width, 100);

  //this draws a mini rice and a mini waffle in the black menu at the bottom 
  //so you can select the rice or select the waffle
  image(stickers[1], 100, height-85, 75, 75);
  //image(anImage2, 300, height-85, 75, 75);

  //this draws the word "erase" in the menu at the bottom
  fill(255);
  textSize(45);
  text("erase", 600, height-150);

  //Home button:
  //"Home":
  textAlign(CENTER);
  textFont(sugarvine);
  textSize(50);
  fill(255);
  text ("Home", 1200 +200, 900+150);

  if (mousePressed && mouseX >= 1200 && mouseX <= 1600 && mouseY >= 900 && mouseY <= 1200) {
    screenSelector = 0;
  }
}


//**********PUTTING ON STICKERS WITH MOUSE*******************

void mousePressed() {

  //here we check to see if you click on the rice image in the black menu bar
  //if you do click there, we set the chosenImage variable to 1 (which means we have chosen rice)
  if (mouseX > 100 && mouseX < 200 && mouseY > height-100) {
    chosenImage = 1;
  }

  //and here we check to see if you click on the waffle image in the black menu bar
  //if you do click there, we set the chosenImage variable to 2 (which means we have chosen the waffle)
  if (mouseX > 300 && mouseX < 400 && mouseY > height-100) {
    chosenImage = 2;
  }

  // here, if we are clicking anywhere on the camera screen (aka anywhere above the menu bar)
  // and if chosenImage is 1 (meaning we have chosen rice),
  // we set isOn1 (which is a boolean that keeps track of whether the rice is on the screen or not) to true 
  // and we capture the current x and y position of the mouse so we can place the rice at that specific spot
  if (mouseY < height-100 && chosenImage == 1) {
    isOn1 = true;
    // we use mouseX-100 because we want it to be positioned a bit better.
    x1 = mouseX-100;
    y1 = mouseY-100;
  }

  // ...and we do the same for the waffle here.
  // if we click anywhere on the camera screen (aka anywhere above the menu bar)
  // and if chosenImage is 2 (meaning we have chosen the waffle),
  // we set isOn2 (which is a boolean that keeps track of whether the waffle is on the screen or not) to true 
  // and we capture the current x and y position of the mouse so we can place the waffle at that specific spot
  if (mouseY < height-100 && chosenImage == 2) {
    isOn2 = true; 
    x2 = mouseX-100;
    y2 = mouseY-100;
  }

  //here is where we erase them! 
  //If we click on "erase," we set everything to false, so it doesn't show.
  //because, up in draw(), we only show the images if our isOn1 and isOn2 booleans are true.
  if (mouseY > height-100 && mouseX > 700 && mouseX < 800) {
    isOn1 = false;
    isOn2 = false;
  }
}

//**********SAVE VIDEO  (PIC) UPON SPACE IS PRESSED*******************

void keyPressed() {
  if (keyPressed == true && key == ' ' && x < 100) {
    //line(x, 0, x, 100);
    x = x + 1;
  } else {
    noLoop();
  }
  // Saves each frame as line-000001.png, line-000002.png, etc.
  // saveFrame("pic-######.jpeg");
  PImage partialSave = get(400, 0, 1200, 900);
  partialSave.save("pic-######.jpg");
  //void keyPressed() {
  //if (keyPressed == true && key == ' ' && x < 100) {
  //  line(x, 0, x, 100);
  //  x = x + 1;
  //} else {
  //  noLoop();
  //}
  //// Saves each frame as line-000001.png, line-000002.png, etc.
  //// saveFrame("pic-######.jpeg");
  //PImage partialSave = get(400, 0, 1200, 900);
  //partialSave.save("pic-######.jpg");
}