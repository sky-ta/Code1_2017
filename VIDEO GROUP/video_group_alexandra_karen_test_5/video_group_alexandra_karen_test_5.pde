//Tuitor help: Harry Slothwiner, Michael Wolf, Sarah Page
import processing.video.*; //Casual stuff about library
Capture video;

//SCREENS changing:
int screenSelector;

//~~~~~~~~~~~~~~~~~~IMAGES
//int that shows what image we have currently chosen:
int chosenImage = 0; 
//Camera button:
PImage camButton;

//~~~~~~Group1 - shibas:
PImage[] stickerGroup1 = new PImage [6];
ArrayList<soey> soeys = new ArrayList<soey>();
//~~~~~~Group2 - food:
PImage[] stickerGroup2 = new PImage [15];
ArrayList<donut> donuts = new ArrayList<donut>();
//~~~~~~Group3 - random:
PImage[] stickerGroup3 = new PImage [14];
ArrayList<hawt> hawts = new ArrayList<hawt>();
//~~~~~~Group4 - animal:
PImage[] stickerGroup4 = new PImage [13];
ArrayList<dawg> dawgs = new ArrayList<dawg>();
//To clear stickers
boolean stickerPressed = false;

//FONTS:
PFont sugarvine;
PFont bocadillo;
PFont shorelines;

//***************************************************************************************************

void setup() {
  noStroke();  
  //fullScreen();
  size(800, 600); 
  screenSelector = 0;
  //FONT:
  sugarvine= createFont ("Sugar & Vinegar.ttf", 100);
  bocadillo = createFont ("DK Bocadillo.otf", 100);
  shorelines = createFont ("Shorelines Script Bold.otf", 100);
  //CamButton:
  camButton = loadImage ("camerapixel.png");

  ///////////VIDEO INFO//////////////////
  String[] cameras = Capture.list();
  //if cameras == null, then tries to use the default camera
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");  
    //VIDEO:
    video = new Capture(this, 320, 180, 15);
    //if there isn't a camera, stop trying to use a camera
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    video = new Capture(this, cameras[7]); 
    // this starts capturing images from the camera
    video.start();
    /////// END CAMERA STUFF /////////////
  }
}

//*******************************************************************************************************
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
}

//******************************************************************

void introScreen() {
  background(0);

  //TiTLE:
  fill(255);
  textAlign(CENTER);
  textFont(bocadillo);
  textSize(width/10);
  text ("- KAWAII -", width/2, height/2 - height/4);
  textSize(width/18);
  text ('\n' + ".. camera ..", width/2, height/2 - height/4);

  //~~~~~~~~~BUTTONS to other Screens:
  //~~~PIC button:
  fill (236, 166, 253);
  rectMode(CENTER);
  rect (width/2, height/2 +height/8, width/4, height/6);
  //"take pic":
  fill(255);
  textFont(shorelines);
  textSize(width/22);
  text ("TAKE PIC", width/2, height/2 + height/6);

  //~~~INSTRUCTIONS button:
  fill (189, 166, 253);
  rect (width/2, height/2 + height/4 + height/20, width/4, height/8);
  //"Instructions":
  fill(255);
  textFont(shorelines);
  textSize(width/30);
  text ("Instructions", width/2, height/2 + height/4 + height/15);

  //to change screens:
  if (mousePressed && mouseX >= (width/2 - width/8) && mouseX <= (width/2 + width/8) && mouseY >= (height/2 + height/30) && mouseY <= (height/2+ height/5)) {
    screenSelector = 1;
  }
  if (mousePressed && mouseX >= (width/2 - width/8) && mouseX <= (width/2 + width/8) && mouseY >= height*3/4 && mouseY <= (height/2 + height/4 + height/9)) {
    screenSelector = 2;
  }
}

//******************************************************************

void instruction() {
  //Screen:
  fill(0);
  rectMode(CORNER);
  rect(0, 0, width, height);

  //Back button:  
  fill (189, 166, 253);
  rectMode(CENTER);
  rect (width/2, height*8/9, width/4, height/9);
  //"back":
  textAlign(CENTER);
  textFont(shorelines);
  textSize(width/33);
  fill(255);
  text ("back", width/2, height*11/12);

  //to go back to introScreen():
  if (mousePressed && mouseX >= (width/2 - width/8) && mouseX <= (width/2 + width/8) && mouseY >= (height*8/9 - height/16) && mouseY <= (height*8/9 + height/16)) {
    delay (200);
    screenSelector = 0;
  }
}

//*******************************************************************************************************

void cameraPlay() {
  background(0);
  /////////////////IMAGES:
  //Group1 - Shibas:
  for (int i = 1; i < stickerGroup1.length; i++) {
    stickerGroup1 [i] = loadImage("1-"+i+".png");
  }
  //Group2 - Food:
  for (int p = 1; p < stickerGroup2.length; p++) {
    stickerGroup2 [p] = loadImage("2-"+p+".png");
  }
  //Group3 - Random:
  for (int m = 1; m < stickerGroup3.length; m++) {
    stickerGroup3 [m] = loadImage("3-"+m+".png");
  }
  //Group4 - Animals:
  for (int n = 1; n < stickerGroup4.length; n++) {
    stickerGroup4 [n] = loadImage("4-"+n+".png");
  }


  /////////// VIDEO STUFF ///////////////
  //this reads whether the camera is true. if it is read whatever is coming from it.
  if (video.available() == true) {
    video.read();
  }
  //image(video, 0, 0, width, height); 
  image(video, width/4, 0, width*3/4, height*3/4);
  //////// END VIDEO STUFF /////////////


  //...........STICKERS....................................:
  //...Group1 - shibas:
  for (int j = 1; j <soeys.size(); j++) {
    soey sticker1 = soeys.get(j);
    image (sticker1.sticker1, sticker1.location1.x, sticker1.location1.y);
  }
  image(stickerGroup1[5], width/16, height/20, 100, 100); //Mini Icon of Stickers on the screen

  //...Group2 - food:
  for (int f = 1; f <donuts.size(); f++) {
    donut sticker2 = donuts.get(f);
    image (sticker2.sticker2, sticker2.location2.x, sticker2.location2.y);
  }
  image(stickerGroup2[1], width/16, height/4 + height/20 +10, 100, 75);

  //...Group3 - Random:
  for (int g = 1; g <hawts.size(); g++) {
    hawt sticker3 = hawts.get(g);
    image (sticker3.sticker3, sticker3.location3.x, sticker3.location3.y);
  }
  image(stickerGroup3[9], width/16, height/2 + height/20 +10, 100, 75);

  //...Group4 - Animals:
  for (int h = 1; h <dawgs.size(); h++) {
    dawg sticker4 = dawgs.get(h);
    image (sticker4.sticker4, sticker4.location4.x, sticker4.location4.y);
  }
  image(stickerGroup4[1], width/16, height*3/4 + height/20, 100, 100);

  //Erase BUTTON:
  fill(255);
  textAlign(CENTER);
  textFont(shorelines);
  textSize(height/15);
  text("Erase", width/4 + width/8, height-height/12);
  
  //CamButton:
  image (camButton, width/2 +10, height*3/4 + height/40, 180, 100);
    fill(255);
  textAlign(CENTER);
  textFont(shorelines);
  textSize(height/30);
  text("click!", width*1.25/2 +10, height- height/50);
  
  //Home button:
  //"Home":
  textAlign(CENTER);
  textFont(shorelines);
  textSize(height/12);
  fill(255);
  text ("Home", width*4.5/6 +width/8, height-height/12);
  if (mousePressed && mouseX >= width*5.2/6 && mouseX <= width*11/12 && mouseY >= (height*3/4 + height/20) && mouseY <= (height - height/20)) {
    screenSelector = 0;
  }

  //...................................................................
  //Save image upon click to screen:
  if (mousePressed == true && mouseX >= (width/2 +10) && mouseX <= (width*3/4-10) && mouseY >= (height*3/4 + height/40) && mouseY <= (height-height/50)){
  PImage partialSave = get(width/4, 0, width*3/4, height*3/4);
  partialSave.save("pic-"+millis()+".jpg");
}
  //...................................................................
  //Grid:
  for (int a = 0; a < width; a = a+100) {
    stroke(255);
    line (a, 0, a, height);
  }
  for (int b = 0; b <height; b = b+150/2) {
    stroke(255);
    line (0, b, width, b);
  }
}

//******************************************************************************* 

void mousePressed() {

  //Group1 - Shibas:
  if (mouseX > width/16 && mouseX < width*3/16 && mouseY > height/20 && mouseY < height/4-20) {
    chosenImage = 1;
    stickerPressed = pointIsInRect(new PVector(width/16, height/20), new PVector(75, 75), new PVector(mouseX, mouseY));
  }

  //Group2 - Food: 
  if (mouseX > width/16 && mouseX < width*3/16 && mouseY > (height/4 + height/20 +10) && mouseY < height/2-20) {
    chosenImage = 2;
    stickerPressed = pointIsInRect(new PVector(width/16, height/4 + height/20 +10), new PVector(75, 75), new PVector(mouseX, mouseY));
  }

  //Group3 - Random: width/16, height/2 + height/20 +10
  if (mouseX > width/16 && mouseX < width*3/16 && mouseY > (height/2 + height/20 +10) && mouseY < height*3/4-20) {
    chosenImage = 3;
    stickerPressed = pointIsInRect(new PVector(width/16, height/2 + height/20 +10), new PVector(75, 75), new PVector(mouseX, mouseY));
  }

  //Group4 - Animals:width/16, height*3/4 + height/20
  if (mouseX > width/16 && mouseX < width*3/16 && mouseY > (height*3/4 + height/20) && mouseY < height -20) {
    chosenImage = 4;
    stickerPressed = pointIsInRect(new PVector(width/16, height*3/4 + height/20), new PVector(75, 75), new PVector(mouseX, mouseY));
  }
}
void mouseReleased() {
  //Group1 - Shibas:
  if (stickerPressed == true && chosenImage == 1) {
    soey melk = new soey();
    melk.location1 = new PVector (mouseX, mouseY);
    melk.sticker1 = stickerGroup1[int(random(1, stickerGroup1.length))];
    soeys.add(melk);
  }

  //Group2 - Food:
  if (stickerPressed == true && chosenImage == 2) {
    donut round = new donut();
    round.location2 = new PVector (mouseX, mouseY);
    round.sticker2 = stickerGroup2[int(random(1, stickerGroup2.length))];
    donuts.add(round);
  }

  //Group3 - Random:
  if (stickerPressed == true && chosenImage == 3) {
    hawt doag = new hawt();
    doag.location3 = new PVector (mouseX, mouseY);
    doag.sticker3 = stickerGroup3[int(random(1, stickerGroup3.length))];
    hawts.add(doag);
  }

  //Group4 - Animals:
  if (stickerPressed == true && chosenImage == 4) {
    dawg fam = new dawg();
    fam.location4 = new PVector (mouseX, mouseY);
    fam.sticker4 = stickerGroup4[int(random(1, stickerGroup4.length))];
    dawgs.add(fam);
  }
}

//******************************************************************
//TO SCREENSHOT UPON ANY KEY PRESS:

void keyPressed() {
  PImage partialSave = get(width/4, 0, width*3/4, height*3/4);
  partialSave.save("pic-"+millis()+".jpg");
}

boolean pointIsInRect(PVector location1, PVector size, PVector mousePoint) {
  if (mousePoint.x > location1.x && mousePoint.x < location1.x + size.x &&
    mousePoint.y > location1.y && mousePoint.y < location1.y + size.y) {
    return true;
  } else {
    return false;
  }
}