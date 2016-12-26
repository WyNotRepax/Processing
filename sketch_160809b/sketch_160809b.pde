PImage I;
int t;

void setup(){
  size(1280,720);
  I = loadImage("Tobias.jpg");
  t = 0;
  image(I,0,0,1280,720);
}


void draw(){
  loadPixels();
  for(int n = 0; n < pixels.length; n++){
    pixels[n] = color((10+red(pixels[n]))%255,(10+green(pixels[n]))%255,(10+blue(pixels[n]))%255);
  }
  updatePixels();
}