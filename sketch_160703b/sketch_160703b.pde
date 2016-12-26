int bright = 10;

void setup(){
  colorMode(HSB,width,height,10,1);
  noStroke();
  size(1280,720);
  background(0);
}
void draw(){};
void mouseClicked(){
  background(0);
  for(int x = 0; x <= width; x++){
    for(int y = 0; y <= height; y++){
      stroke(x,y,bright,1);
      point(x,y);
    }
  }
  bright--;
}