class GravField{
  PVector p1;
  PVector p2;
  PVector d;
  float a;
  color c;
  GravField(PVector pos1, PVector pos2,PVector direc, float acc){
    p1 = pos1;
    p2 = pos2;
    a = acc;
    d = direc;
    d.limit(1);
    c = color(0,0,0);
  }
  GravField(PVector pos1, PVector pos2,PVector direc, float acc, color tint){
    p1 = pos1;
    p2 = pos2;
    a = acc;
    d = direc;
    d.limit(1);
    c = tint;
  }
  void show(){
     fill(c);
     noStroke();
     rect(p1.x,p1.y,p2.x,p2.y);
  }
}