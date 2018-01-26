PImage[] stickers = new PImage [48];
boolean isOn1 = true;
boolean isOn2 = false; 
int x1 = 0;
int y1 = 0;

//float angle; 
//float randos;

void setup() {
}  
void draw() {
}

void mousePressed() {

  for (int i = 0; i < stickers.length; i++) {
    stickers [i] = loadImage("stickers"+i+".jpg");
  }
    //int index = int(random(0, stickers.length));
 
  if (isOn1 == true) {
    int index = int(random(0, stickers.length));
    image (stickers[index], x1, y1); 
    //angle = angle + randos;
    //float c = cos(angle);
    //translate(width/2, height/2);
    //rotate(c);
  }
}


//thanks to The Coding Train <3 
//for help with programming PImage into an array
//https://www.youtube.com/watch?v=DPFJROWdkQ8