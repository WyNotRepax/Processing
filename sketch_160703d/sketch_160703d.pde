ArrayList<Lineseg> linesegs = new ArrayList<Lineseg>();
Lineseg initialline = new Lineseg(new PVector(50,300),new PVector(750,550));
void setup(){
  size(800,800,P2D);
  linesegs.add(initialline);
}

void draw(){
  background(255); //<>// //<>//
  for (Lineseg l : linesegs){ //<>// //<>//
    l.display();
  }
}
void mousePressed(){
  ArrayList<Lineseg> temp = new ArrayList<Lineseg>();
  for(Lineseg l : linesegs){
      for(Lineseg ll : l.step()) {
       temp.add(ll); 
      }
  }
  for (int i = linesegs.size() - 1; i >= 0; i--) {
    Lineseg l = linesegs.get(i);
    linesegs.remove(i);
  }
  for (Lineseg l : temp){
    linesegs.add(l);
  }
}

class Lineseg {
  
  PVector pos1;
  PVector pos2;
  
  Lineseg(PVector start,PVector end) {
    pos1 = start;
    pos2 = end;
  }
  void display() {
    stroke(0);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    fill(255,0,0);
    ellipse(pos1.x,pos1.y,10,10);
    ellipse(pos2.x,pos2.y,10,10);
  }
  ArrayList<Lineseg> step(){
    ArrayList<Lineseg> childList = new ArrayList<Lineseg>();
    PVector p1 = pos1;
    PVector p2 = new PVector((pos2.x - pos1.x)/3+pos1.x,(pos2.y - pos1.y)/3+pos1.y);
    PVector p4 = new PVector((pos2.x - pos1.x)*2/3+pos1.x,(pos2.y - pos1.y)*2/3+pos1.y);
    PVector p5 = pos2;
    float dist = pow(pow(pos2.x-pos1.x,2)+pow(pos2.y-pos1.y,2),0.5);
    float h = tan(TWO_PI/15)*(dist/2);
    float angl = atan((pos1.y-pos2.y)/(pos1.x-pos2.x))-TWO_PI/12;
    float pos1p3 = pow(pow(dist/2,2)+pow(h,2),0.5);
    PVector p3 = new PVector(pos1.x+cos(angl)*pos1p3,pos1.y+sin(angl)*pos1p3);
    childList.add(new Lineseg(p1,p2));
    childList.add(new Lineseg(p2,p3));
    childList.add(new Lineseg(p3,p4));
    childList.add(new Lineseg(p4,p5));
    println(Math.toDegrees(Math.atan((pos1.y-pos2.y)/(pos1.x-pos2.x))));
    return childList;
  }
}