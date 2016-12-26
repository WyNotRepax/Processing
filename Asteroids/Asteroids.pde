import java.util.Iterator;

Player p;
Asteroid[] asteroids;

void setup(){
  size(1000,800);
  p = new Player(width/2,height/2,15);
  asteroids = new Asteroid[20];
  for (int i = 0; i < asteroids.length; i++){
    asteroids[i] = spawnOnBorder();
  }
  
}


void draw(){
  background(0);
  p.update();
  p.display();
  for (int i = 0; i < asteroids.length; i++){
    if(asteroids[i].outOfBounds()){
      asteroids[i] = spawnOnBorder();
    }
    asteroids[i].update();
    asteroids[i].display();
  }
  //asteroids = p.hitUpdate(asteroids);
} //<>//

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      p.isaccel = true;
    }
    else if(keyCode == RIGHT){
      p.rotright = true;
    }
    else if(keyCode == LEFT){
      p.rotleft = true;
    }
    else if(keyCode == DOWN){
      p.breaking = true;
    }
  }
  else if(key == ' '){
    p.fireing = true;
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == UP){
      p.isaccel = false;
    }
    else if(keyCode == RIGHT){
      p.rotright = false;
    }
    else if(keyCode == LEFT){
      p.rotleft = false;
    }
    else if(keyCode == DOWN){
      p.breaking = false;
    }
  }
  else if(key == ' '){
    p.fireing = false;
  }
}

Asteroid spawnOnBorder(){
  int temp = int(random(3));
  if(temp == 0){
    return new Asteroid(random(width),0);
  }
  else if( temp == 1){
    return new Asteroid(random(width),height);
  }
  else if( temp == 2){
    return new Asteroid(0,random(height));
  }
  else{
    return new Asteroid(width,random(height));
  }
}