GravField g;

void setup(){
  size(500,500);
  colorMode(HSB);
  g = new GravField(new PVector(0,0),new PVector(100,100),new PVector(0,1),10,color(100,100,255));
}

void draw(){
  background(255);
  g.show();
}