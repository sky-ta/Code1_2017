int okay; //to introduct x position
int yPos;
void setup(){
  size(500,500);
  background(100,90,200);
  okay = 50;
  yPos = 100;
}
void draw(){
  //stroke(255);                            //to create a grid which helps finding x and y
  //for(int i = 0; i <50; i++){
  //  rect(i*10,0,1,height);
  //  rect(0,i*10,width,1);
  //}
  println("mouse position: "+ mouseX +", " + mouseY +);
  
  
  
  fill (255,255,0);
  rect (okay,yPos,100,100);
  if((mouseX > okay)&&(mouseX <okay +100)&&(mouseY>yPos)&&(mouseY<yPos+100)&&mousePressed){
    println("CHOO CHOO MOTHAFAKAAA");
    fill(255,0,0);
}
rect (okay,yPos,100,100);
}