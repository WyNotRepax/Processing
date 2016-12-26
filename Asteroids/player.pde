class Player{
  PVector pos;
  PVector vel;
  boolean isaccel;
  boolean rotright;
  boolean rotleft;
  float rotspeed;
  float rad;
  float heading;
  float speed;
  boolean breaking;
  ArrayList<Laser> lasers;
  float shotspeed;
  int shotcd;
  float firerate;
  boolean fireing;
  
  Player(float xpos, float ypos, float r){
    pos = new PVector(xpos,ypos);
    rad = r;
    heading = 0;
    speed = 0.5;
    isaccel = false;
    vel = new PVector(0,0);
    rotspeed = 0.09;
    breaking = false;
    lasers = new ArrayList<Laser>();
    shotspeed = 10;
    shotcd = 0;
    firerate = 5;
  }
  
  void update(){
    for(/*int i = 0; i < lasers.size(); i++*/Laser l : lasers){
      //lasers.get(i).update();
      l.update();
    }
    if(rotright){
      heading += rotspeed;
    }
    if(rotleft){
      heading -= rotspeed;
    }
    if(isaccel){
      vel.add(new PVector(sin(heading)*speed,-cos(heading)*speed));
    }
    pos.add(vel);
    if(breaking){
      vel.mult(0.9);
    }
    vel.mult(0.97);
    if(pos.x > width+rad){
      pos.x = -rad;
    }
    else if(pos.x < -rad){
      pos.x = width+rad;
    }
    if(pos.y > height+rad){
      pos.y = -rad;
    }
    else if(pos.y < -rad){
      pos.y = height+rad;
    }
    if(shotcd > 0){
      shotcd--;
    }
    if(fireing){
      this.fire();
    }
    for(int i = 0; i < lasers.size(); i++){
      if(PVector.dist(pos,lasers.get(i).pos) > width+height){
        lasers.remove(i);
      }
    }
  }
  
  void display(){
    pushMatrix();
    stroke(255);
    noFill();;
    translate(pos.x,pos.y);
    rotate(heading);
    beginShape();
    triangle(0,-rad,rad,rad,-rad,rad);
    popMatrix();
    for(Laser l : lasers){
      l.display();
    }
  }
  
  void fire(){
    if(shotcd == 0){
      lasers.add(new Laser(this));
      shotcd = int(frameRate / firerate);
    }
  }
  
  Asteroid[] hitUpdate(Asteroid[] asteroids){
    int afterarraysize = asteroids.length;
    ArrayList<Integer> gotHit = new ArrayList<Integer>();
    for(int i = 0; i < asteroids.length; i++){
      for(int n = 0; n < lasers.size(); n++){
        if(asteroids[i].hits(lasers.get(n))){
          gotHit.add(n);
          afterarraysize++;
          lasers.remove(n);
          break;
        }
      }
    }
    Asteroid[] returnarray = new Asteroid[afterarraysize];
    ArrayList<Asteroid> shittoadd = new ArrayList<Asteroid>();
    for(int i = 0; i < returnarray.length; i++){
      boolean hit = false;
      for(int n : gotHit){
        if(i == n){
          hit = true;
        }
      }
      if(hit){
        Asteroid[] temp = asteroids[i].split();
        shittoadd.add(temp[0]);
        shittoadd.add(temp[1]);
      }
      else{
        returnarray[i] = asteroids[i];
      }
    }
    for(int i = 0; i < shittoadd.size(); i++){
      for(int n = 0; n < returnarray.length; n++){
        if(returnarray[n] == null){
          returnarray[n] = shittoadd.get(i);
          shittoadd.remove(i);
          break;
        }
      }
    }
    return returnarray;
  }
  
}