class Laser{
  PVector pos;
  PVector vel;
  float direc;
  float speed;
  Laser(Player p){
    pos = new PVector(p.pos.x+sin(p.heading)*p.rad,p.pos.y+-cos(p.heading)*p.rad);
    direc = p.heading;
    speed = p.shotspeed;
    vel = new PVector(sin(direc)*speed,-cos(direc)*speed);
    vel.add(p.vel);
  }
  void update(){
    pos.add(vel);
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(direc);
    line(0,-10,0,10);
    popMatrix();
  }
}