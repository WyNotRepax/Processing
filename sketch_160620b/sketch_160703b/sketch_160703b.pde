int phi;
int r = 100;
float inc;
ArrayList<PVector> points;
int size = 10;

void setup(){
  size(400,400);
  makePoints();
}

void draw(){
  background(0);
  translate(width/2,height/2);
  drawPoints();
  drawLines();
} //<>// //<>//

void makePoints(){
  points = new ArrayList<PVector>();
  inc = TWO_PI / 5;
  for (float a = 0; a < TWO_PI; a+= inc){
    PVector point  = new PVector(cos(a), sin(a));
    point.mult(r);
    points.add(point);
  }
}

void drawPoints(){
  for (PVector p : points) {
    fill(255,0,0);
    ellipse(p.x,p.y,size,size);
  }
}

void drawLines(){
  strokeWeight(4);
    for (int i = 0; i < points.size(); i++) {
      if(i+1 < points.size()){
        stroke(0,255,0);
        line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).x);
      }
    }
  }