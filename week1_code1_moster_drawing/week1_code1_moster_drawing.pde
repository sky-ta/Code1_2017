void setup(){
  size(1200,1200);
  background(200, 204, 0);
}  
  
void draw(){
  //Shadow
  noStroke();
  fill(100);
  ellipse(650,950,550,200);
  
  //Horn of the monster
  stroke(0);
  fill(255);
  strokeWeight(15);
  triangle(width/2,100, width/2-50, 350, width/2+50, 350);
  
  //Body of the monster
  strokeWeight(15);
  fill(193,250,247);
  rect(width/2-300,height/2-300,600,500);
  
  //Left hand of the monster
  strokeWeight(15);
  line(width/2+300,height/2-50,1010,550);
  fill(255);
  rect(1010,520,40,40);
  
  //Right hand of the monster
  strokeWeight(15);
  line(width/2-310,height/2-50,170,550);
  fill(255);
  rect(160,520,40,40);
  
  //Eyes of the monster
  noStroke();
  fill (0);
  ellipse(450, 500, 100, 100);
  ellipse(750, 500, 100, 100);
  
  fill(255, 230, 0);
  ellipse(450, 500, 70, 70);
  ellipse(750, 500, 70, 70);
  
  fill (255);
  ellipse(450+20, 470, 30, 30);
  ellipse(750+20, 470, 30, 30);
  
  //Mouth of the monster
  strokeWeight(15);
  fill(0);
  rect(width/2-160,height/2+50, 340,15);
  
  //Tooth
  noStroke();
  fill(255);
  triangle(width/2-160,height/2+50, width/2-140,height/2+20, width/2-120,height/2+50);
  
  //Legs of the monster
  stroke(0);
  line(450,800,450,950);
  line(750,800,750,950);
  rect(450,950, 60,40);
  rect(750,950,60,40);
}