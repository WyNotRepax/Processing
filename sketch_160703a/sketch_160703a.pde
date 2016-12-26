void setup(){size(1280,720);}
void draw(){
  background(255);
  translate(width/2,height/2);
  fill(0,255,0,1);
  stroke(0,255,0,1);
  for(int i = 1; i <= 500; i = i+5){
    ellipse(sin((TWO_PI/3)*0)*mouseX,cos((TWO_PI/3)*0)*mouseX,i,i);
  }
  fill(255,0,0,1);
  stroke(255,0,0,1);
  for(int i = 1; i <= 500; i = i+5){
    ellipse(sin((TWO_PI/3)*1)*mouseX,cos((TWO_PI/3)*1)*mouseX,i,i);
  }
  fill(0,0,255,1);
  stroke(0,0,255,1);
  for(int i = 1; i <= 500; i = i+5){
    ellipse(sin((TWO_PI/3)*2)*mouseX,cos((TWO_PI/3)*2)*mouseX,i,i);
  }
}