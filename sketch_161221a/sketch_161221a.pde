import processing.video.*;

Capture cam;
PImage p1;
PImage p2;
PImage p3;
PImage p4;


ArrayList<Float> data;


void setup(){
  size(1280,800);
  cam = new Capture(this,Capture.list()[43]);
  cam.start();
  printArray(Capture.list());
  p1 = new PImage(640,400);
  p2 = new PImage(640,400);
  p3 = new PImage(640,400);
  p4 = new PImage(640,400);
}

void draw(){
  if(cam.available()){
    cam.read();
    p1.set(0,0,cam);
    p2.set(0,0,cam);
    p3.set(0,0,cam);
    p4.set(0,0,cam);
    p2.loadPixels();
    p2.pixels = colorshift(p2.pixels,2);
    p2.updatePixels();
    p3.loadPixels();
    for(int i = 0; i < p3.pixels.length; i++){
      p3.pixels[i] = color(red(p3.pixels[i]),0,0);
    }
    p3.loadPixels();
    p4.loadPixels();
    for(int i = 0; i < p4.pixels.length; i++){
      p4.pixels[i] = color(0,green(p4.pixels[i]),0);
    }
    p4.loadPixels();
    
  }
  image(p1,0,0);
  image(p2,640,0);
  image(p3,0,400);
  image(p4,640,400);
}

color[] rauschen(color[] input,int strength){
  color[] output = new color[input.length];
  for(int i = 0; i < input.length; i++){
      output[i] = color((red(input[i])+green(input[i])+blue(input[i]))/3+random(-strength,strength));
    }
  return output;
}

color[] colorshift(color[] input, int mode){
  color[] output = new color[input.length];
  if(mode == 0){
    return input;
  }
  else if(mode == 1){
    for(int i = 0; i < input.length; i++){
      output[i] = color(green(input[i]),blue(input[i]),red(input[i]));
    }
    return output;
  }
  else if(mode == 2){
    for(int i = 0; i < input.length; i++){
      output[i] = color(blue(input[i]),red(input[i]),green(input[i]));
    }
    return output;
  }
  else{
    return null;
  }
}