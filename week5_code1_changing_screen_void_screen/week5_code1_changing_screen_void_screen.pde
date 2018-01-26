int screenSelector;   // so that you wont have to mention screen1 screen 2 so much

void setup() {
  size (1200, 1200);
  screenSelector = 0;
}

void draw () { //come back after screen 1 and screen 2 are made, comment out 1 of the 2 screen to see how they appear
              //screen1();
              //screen2();
              //screen3();
            
              //Press to screen to open:
              //screen1();
              //if (mousePressed){
              //  screen2();
              //}
  if(screenSelector == 0){
    background(0);
  } else if (screenSelector == 1){
    screen1();
    } else if (screenSelector == 1){
    screen2();
    } else if (screenSelector == 1){
    screen3();
    }
    
  screen1();
  if (keyPressed) {
    //if (key == 'a') {   if only want 1 key
      if (key == 'a'|| key == 'A') {
        screenSelector = 1;
        //screen1();
      } else if (key == 's'|| key == 'S'){
        screenSelector = 2;
        //screen2();
      } else if (key == 'd'|| key == 'D'){
        screenSelector = 3;
        //screen3();
      }
      println (screenSelector);
    }
  }


void screen1() { //When you want to create many screen
  background (255, 105, 180);
  text ("FIRST SCREEN", width/2, height/2); //(text you want to put on screen, x axis of where the text is, and it y axis)
}

void screen2() {
  background (127, 255, 0);
  text ("SECOND SCREEN", width/2, height/2);
}

void screen3() {
  background (218, 243, 255);
  text ("THIRD SCREEN", width/2, height/2);
}