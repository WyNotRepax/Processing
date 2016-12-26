class Exhaust{
  ArrayList<ExhaustParticle> exhp;
  float s;
  float m;
  float pspeed;
  Exhaust(float spray, float maxlife, float particlespeed){
    exhp = new ArrayList<ExhaustParticle>();
    s = spray;
    m = maxlife;
    pspeed = particlespeed;
  }
    
    
  void display(boolean isaccel, float direc,PVector pos) {
    if (isaccel){
      exhp.add(new ExhaustParticle(m,direc,s,pos,pspeed));
    }
    for ( int i = 0; i < exhp.size(); i++){
      exhp.get(i).display();
      if(exhp.get(i).alive == false){
        exhp.remove(i);
      }
    }
  };
}

class ExhaustParticle{
  float ml;
  float cl;
  boolean alive;
  PVector pos;
  float size;
  float opac;
  float rot;
  PVector vel;
  
  ExhaustParticle(float maxlife, float direc, float spray, PVector position, float particlespeed){
    ml = maxlife;
    alive = true;
    cl = maxlife;
    pos = position;
    opac = 0;
    size = 3;
    rot = direc + random(spray) -spray/2;
    vel = new PVector(-cos(rot)*particlespeed,-sin(rot)*particlespeed);
    vel.mult(0.5);
  }
  void display(){
    rectMode(CENTER);
    opac = (ml/cl)*255;
    fill(0,0,0,opac);
    rect(pos.x,pos.y,size,size);
    pos.add(vel);
    cl--;
    if (cl < 0){
      alive = false;
    }
  }
}