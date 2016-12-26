import processing.video.*;
Capture video;
PImage[] lastFrames;
PImage output;
int stripesize = 2;




void setup(){
  size(640,400);
  video = new Capture(this,640,400,30);
  video.start();
  lastFrames = new PImage[int(height/stripesize)];
  for(int i = 0; i < lastFrames.length; i++){
    lastFrames[i] = new PImage(width,height,RGB);
  }
  output = new PImage(width,height,RGB);
}

void draw(){
  if(video.available()){
    video.read();
    lastFrames[0].set(0,0,video);
  }
  for(int i = lastFrames.length - 1; i > 0; i--){
    lastFrames[i].set(0,0,lastFrames[i-1]);
  }   
  for(int y = 0; y < height; y++){
    output.set(0,y,lastFrames[int(y/stripesize)].get(0,y,width,stripesize));
  }
  
  image(output,0,0); 
  println(frameRate);
}