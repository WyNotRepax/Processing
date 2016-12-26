void setup(){
  size(700,700);
  colorMode(HSB);
}

void draw(){
  translate(width/2,height/2);
  strokeWeight(7);
  for(int h = 0; h < 255; h++){
    for(int b = 0; b < 255; b++){
      stroke(h,255,b);
      point(sin((TWO_PI/255)*h)*b,cos((TWO_PI/255)*h)*b);
    }
  }
}