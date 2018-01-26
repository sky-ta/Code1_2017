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
PImage[] stickers = new PImage [10];
ArrayList<soey> soeys = new ArrayList<soey>();
//isOn1 keeps track of whether the images is on the screen or not.
//right now, it is not.
boolean stickerPressed = false;
//x1 and y1 keep track of the x and y position of the image
int x1 = 0;
int y1 = 0;

//****************************************************************
void setup() {
  noStroke();  
  size(900, 600);
  screenSelector = 0;

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

//******************************************************************
void draw() {
  //Cursor location (x,y) on the window's title box
  surface.setTitle (mouseX+","+mouseY);

  //~~~~~~~~~~SCREENS:
  //~~~OPENING SCREEN with instructions:
  if (screenSelector == 0) {
    cameraPlay();
  }
}

//******************************************************************

void cameraPlay() {
  background(0);
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
  image(video, 0, 0, width, height); //if you want to change the sizing to mouse position
  //////// END VIDEO STUFF /////////////

  for (int j = 0; j <soeys.size(); j++) {
    soey sticker = soeys.get(j);
    image (sticker.sticker, sticker.location.x, sticker.location.y);
  }

  image(stickers[5], 100, height-85, 75, 75);
  
  //this draws the word "erase" in the menu at the bottom
  fill(255);
  textSize(45);
  text("erase", 600, height-150);
}
//......................................
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

  stickerPressed = pointIsInRect1(new PVector(100, height-85), new PVector(75, 75), new PVector(mouseX, mouseY));
}
//.....................................
void mouseReleased() {
  if (stickerPressed == true) {
    soey melk = new soey();
    melk.location = new PVector (mouseX, mouseY);
    melk.sticker = stickers[int(random(0, stickers.length))];
    soeys.add(melk);
  }
}
//......................................

void keyPressed() {
  PImage partialSave = get();
  partialSave.save("pic-"+millis()+".jpg");
}

boolean pointIsInRect1(PVector location, PVector size, PVector mousePoint) {
  if (mousePoint.x > location.x && mousePoint.x < location.x + size.x &&
    mousePoint.y > location.y && mousePoint.y < location.y + size.y) {
    return true;
  } else {
    return false;
  }
}