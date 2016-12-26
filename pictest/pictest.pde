PImage i;
boolean inv;
boolean invlast;
int t;

void setup() {
  inv = false;
  size(1280,720);
  i = loadImage("Tobias.jpg");
  i.resize(width,height);
  
  loadPixels();
  for (int x = 0; x < pixels.length; x++){
    pixels[x] = color(red(i.pixels[x]),green(i.pixels[x]),blue(i.pixels[x]));
  }
  updatePixels();
  
}

void draw(){
  translate(width/2,height/2);
loadPixels();
  if(t % 3 == 0){
    for (int x = 0; x < pixels.length; x++){
      pixels[x] = color(255-red(pixels[x]),255-green(pixels[x]),255-blue(pixels[x]));
    }
    invlast = inv;
  }
  updatePixels();
  t++;
}

void mousePressed() {
  inv = !inv;
}