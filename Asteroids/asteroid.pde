class Asteroid{
  PVector pos;
  PVector vel;
  float[] offset;
  float direc;
  float rotspeed;
  float r;
  Asteroid(float xpos, float ypos){
    pos = new PVector(xpos, ypos);
    vel = PVector.random2D();
    vel.mult(random(1,2));
    rotspeed = random(-TWO_PI/120,TWO_PI/120);;
    direc = 0;
    r = random(10,50);
    offset = new float[10];
    for(int i = 0; i < offset.length; i++){
      offset[i] = random(-r*0.5,r*0.5);
    }
  }
  
  Asteroid(float xpos, float ypos, float radius){
    pos = new PVector(xpos, ypos);
    vel = PVector.random2D();
    vel.mult(random(1,2));
    rotspeed = random(-TWO_PI/120,TWO_PI/120);;
    direc = 0;
    r = radius;
    offset = new float[10];
    for(int i = 0; i < offset.length; i++){
      offset[i] = random(-r*0.5,r*0.5);
    }
  }
  
  void update(){
    pos.add(vel);
    direc += rotspeed;
  }
  
  void display(){
    pushMatrix();
    stroke(255);
    noFill();
    translate(pos.x,pos.y);
    rotate(direc);
    beginShape();
    for(int i = 0; i < offset.length; i++){
      vertex(sin(TWO_PI/10*i)*(r+offset[i]),cos(TWO_PI/10*i)*(r+offset[i]));
    }
    vertex(sin(TWO_PI/10*0)*(r+offset[0]),cos(TWO_PI/10*0)*(r+offset[0]));
    endShape();
    popMatrix();
  }
  
  boolean outOfBounds(){
    if(pos.x - (1.5*r) > width){
      return true;
    }
    else if(pos.x + (1.5*r) < 0){
      return true;
    }
    else if(pos.y - (1.5*r) > height){
      return true;
    }
    else if(pos.y + (1.5*r) < 0){
      return true;
    }
    else{
      return false;
    }
  }
  
  Asteroid[] split(){
    Asteroid[] returnval = {new Asteroid(pos.x,pos.y,r/2) , new Asteroid(pos.x,pos.y,r/2)};
    return returnval;
  }
  
  boolean hits(Laser l){
    if(PVector.dist(l.pos,pos) < r){
      println("hit");
    }
    return PVector.dist(l.pos,pos) < r;
  }
}