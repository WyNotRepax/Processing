PVector snake;
PVector[] tail;
int thick;
float direc;
PVector direcVec;
boolean right;
boolean left;
float turnrate = TWO_PI / 60;
float speed = 3;
int l;


void setup(){
  fullScreen();
  snake = new PVector(width/2,height/2);
  tail = new PVector[0];
  thick = 10;
  direc = 0;
  l = 500;
}

void draw(){
  strokeWeight(thick);
  if(l != tail.length){
    tail = new PVector[l];
  }
  for(int i = l-1; i > 0; i--){
    if(i == 1){ //<>//
      println(1);
    }
    tail[i] = tail[i-1];
  }
  tail[0] = snake;
  direcVec = new PVector(sin(direc),cos(direc)).mult(speed);
  snake.add(direcVec);
  snake = new PVector(constrain(snake.x,0,width),constrain(snake.y,0,height));
  background(255);
  beginShape(LINES);
  vertex(snake.x,snake.y);
  for(int i = 0; i < tail.length; i++){
    if( tail[i] != null){
      vertex(tail[i].x,tail[i].y);
    }
    else{
      
    }
  }
  endShape();
  direc = direc%TWO_PI;
  if(right){direc -= turnrate;}
  if(left){direc += turnrate;}
} //<>//

void keyPressed() {
  if(key == CODED){
    if(keyCode == LEFT){
      left = true;
    }
    if(keyCode == RIGHT){
      right = true;
    }
  } //<>//
}

void keyReleased() {
  if(key == CODED){
    if(keyCode == LEFT){
      left = false;
    }
    if(keyCode == RIGHT){
      right = false;
    }
  }
}
void TailVertex(int i){
  if( tail[i] != null){
      vertex(tail[i].x,tail[i].y);
    }
    else{
      TailVertex(i-1);
    }
}