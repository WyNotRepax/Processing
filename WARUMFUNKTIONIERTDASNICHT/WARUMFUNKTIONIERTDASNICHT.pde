import processing.video.*;
PImage frame = new PImage();
PImage lastframe = new PImage();
PImage output = new PImage();
Capture video;

void setup(){
  size(640,400);
  printArray(Capture.list());
  video = new Capture(this,640,400,30);
  video.start();
  output = new PImage();
  lastframe = new PImage();
  frame = new PImage();
}

void draw(){
  //println("debug");
  if(video.available()){
    doshit();
    image(output,0,0);
  }
}

void doshit() {
  lastframe.set(0,0,frame);
  //video.read();
  frame.set(0,0,video);;
  output = createImage(640,400,RGB);
  lastframe.loadPixels();
  if(lastframe.pixels.length == 0){
    lastframe = createImage(640,400,RGB);
    lastframe.loadPixels();
    println("fucku");
  }
  frame.loadPixels();
  output.loadPixels();
  for(int i = 0; i < frame.pixels.length; i++){
    float reddif = abs( red(frame.pixels[i]) - red(lastframe.pixels[i]) );
    float greendif = abs( green(frame.pixels[i]) - green(lastframe.pixels[i]) );
    float bluedif = abs( blue(frame.pixels[i]) - blue(lastframe.pixels[i]) );
    float dif = reddif + greendif + bluedif;
    if(dif < 500){
      output.pixels[i] = frame.pixels[i];
      print("wy");
    }
    else{
      output.pixels[i] = lastframe.pixels[i]; //<>//
    }
  }
  output.updatePixels();
}