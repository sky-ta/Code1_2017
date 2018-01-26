//Array for names:
String[] names = new String[10];
// Array for scores:
int[] scores = {15000, 9600, 666, 1, -5, 3000, 8400, 0, 2, 13};
//int[] scores = new int[10];

void setup() {
  size (500, 1000);
  background(0);
  textSize(50);
  text("h1gH sC0rE", 50, 55);
  names[0]="Yankees";
  names[1] = "Doggos";
  names[2] = "T-pain"; 
  names[3] = "Sky Ta";
  names[4] = "K-dawg";
  names[5] = "Rozzz";
  names[6] = "Lozzz";
  names[7] = "zzZ";
  names[8] = "Pluffy";
  names[9] = "kingz";
}

void draw() {
 for (int i = 0; i< scores.length; i++){
   //println(i);
   text (names[i]+": "+scores[i], 50, 100+i*50);
}
}