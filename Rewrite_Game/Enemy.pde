class EnemyRock{
  PVector pos;
  PVector vel;
  boolean show;
  PVector accel;
  float r;
  
  
  EnemyRock(PVector startpos,float size){
    pos = startpos;
    vel = new PVector(0,0);
    show = true;
    r = size;
    
  }
  
  void update() {
    movupdate();
  }
  
  void update(Player target) {
    movupdate();
    accel = target.pos.sub(pos).limit(1);
    vel.add(accel);
  }
  
  void display() {
    fill(0);
    beginShape();
    for (int n = 0; n < 5 ; n+= TWO_PI/5){
      vertex(sin(n)*r,cos(n)*r);
    }
    endShape();
  }
  
  void movupdate() {
    pos.add(vel);
  }
}