class Player{
  PVector pos;
  PVector vel;
  float rot;
  PVector derec;
  boolean show;
  Exhaust ex;
  
  
  boolean isaccel;
  boolean isdecel;
  boolean rotright;
  boolean rotleft;
  
  
  float rotspeed;
  float accel;
  float damp;
  
  
  Player(){
    pos = new PVector(0,0);
    vel = new PVector(0,0);
    rot = 0;
    derec = new PVector(1,0);
    isaccel = false;
    isdecel = false;
    rotright = false;
    rotleft = false;
    rotspeed = TWO_PI/60;
    show = true;
    accel = 0.25;
    damp = 0.95;
    ex = new Exhaust(TWO_PI/5, 100, 1);
  }
  
  
  
  void update(){
    this.movupdate();
    if (show){
      this.display();
      ex.display(isaccel,rot,new PVector(cos(rot + PI)*7+pos.x, sin(rot + PI)*7+pos.y));
    }
  }
  
  
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rot);
    noStroke();
    fill(0);
    beginShape();
    vertex(10,0);
    vertex(-5,+5);
    vertex(-5,-5);
    endShape();
    popMatrix();
  }
  void movupdate(){
    derec = new PVector(cos(rot),sin(rot));
    if (isaccel){
      vel.add(derec.mult(accel));
    }
    if (isdecel){
      vel.add(derec.mult(-accel));
    }
    if (rotright){
      rot += rotspeed;
    }
    if (rotleft){
      rot -= rotspeed;
    }
    pos.add(vel);
    vel.mult(damp);
    println(vel.x);
  }
}