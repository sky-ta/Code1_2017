float speed = 10;
float x = -10;
float r = 20;
int direction = 1;

void setup (){
  size(500, 500);
}

void draw (){
  background (0);
  x = x + speed*direction;
  ellipse(x, height/ 2, r, r);
  
  //if (x > width + r){
  //  x = -10;
  
    if ((x > width - r)|| (x < 0)){
    //x = x + direction;
  
    direction = - direction;
    //x = x*direction;
  }
    

}