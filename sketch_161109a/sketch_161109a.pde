

void setup(){
  size(800,800);
  
}

void draw(){
  noStroke();
  rectMode(CORNER);
  background(255);
  fill(255,255,0);
  rect(0,0,200,800);
  fill(255,0,0);
  rect(200,0,200,800);
  fill(0,255,0);
  rect(400,0,200,800);
  fill(0,0,255);
  rect(600,0,200,800);
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
  
  
}

void keyPressed(){
  println("asdasd");
}