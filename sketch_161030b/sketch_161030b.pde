void setup(){
  //size(1000,1000);
  fullScreen();
  colorMode(HSB);
  background(0);
}
/*
for(int i = 0; i < 1000; i++){
  fill(random(255),random(255),255,100);
  noStroke();
  float r = random((width+height)/10);
  ellipse(random(width),random(height),r,r);
}
*/
void draw(){
  //background(255,255,255,10);
  for(int i = 0; i < 1; i++){
    fill(random(255),random(255),255,100);
    noStroke();
    float r = random((width+height)/10);
    ellipse(random(width),random(height),r,r);
  }
}