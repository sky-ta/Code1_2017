import processing.video.*;

//variable to hold camera
Capture cam;

//int that shows what image we have currently chosen
//when chosenImage is 1, rice is selected
//when chosenImage is 2, wallfe is selected
int chosenImage = 0;

//riceImage holds the image of the rice
PImage riceImage;
//isOn1 keeps track of whether the rice is on the screen or not.
//right now, it is not.
boolean isOn1 = false;
//x1 and y1 keep track of the x and y position of the rice image
int x1 = 0;
int y1 = 0;

//waffleImage holds the image of the waffle
PImage waffleImage;
//isOn2 keeps track of whether the waffle is on the screen or not.
//right now, it is not.
boolean isOn2 = false;
//x2 and y2 keep track of the x and y position of the waffle image
int x2 = 0;
int y2 = 0;


void setup() {
  noStroke();  
  //set up the size of the screen
  //this size happens to match with the aspect ratio of my camera
  size(1280, 720);
  //load the rice image and waffle image so they are ready when we want to show them
  riceImage = loadImage("rice.png");
  waffleImage = loadImage("waffle.png");
  
  /////////// CAMERA STUFF ///////////////
  String[] cameras = Capture.list();
  //camera stuff to deal with having some issues with the camera.
  //if cameras == null, then tries to use the default camera
  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 320, 240,30);
    //if there isn't a camera, stop trying to use a camera
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    cam = new Capture(this, cameras[12]); 
    // this starts capturing images from the camera
    cam.start();
  }
  //////// END CAMERA STUFF /////////////
}

void draw() {
  
  /////////// CAMERA STUFF ///////////////
  //this reads whether the camera is true. if it is read whatever is coming from it.
  if (cam.available() == true) {
    cam.read();
  }
  //here, we show the current frame from the camera as an image().
  image(cam, 0, 0, width, height);
  //////// END CAMERA STUFF /////////////
 
  //check to see if the isOn1 boolean is switched to true. 
  //if so, show the image of the rice at the saved x and y position
  if (isOn1 == true) {
    image(riceImage, x1, y1);
  }
  
  //check to see if the isOn2 boolean is switched to true. 
  //if so, show the image of the waffle at the saved x and y position
  if (isOn2 == true) {
    image(waffleImage, x2, y2);
  }
  
  //this makes a black menu bar at the bottom of the screen
  fill(0, 0, 0, 170);
  rect(0, height-100, width, 100);
  
  //this draws a mini rice and a mini waffle in the black menu at the bottom 
  //so you can select the rice or select the waffle
  image(riceImage, 100, height-85, 75, 75);
  image(waffleImage, 300, height-85, 75, 75);
  
  //this draws the word "erase" in the menu at the bottom
  fill(255);
  textSize(45);
  text("erase", 700, height-40);
  
}

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