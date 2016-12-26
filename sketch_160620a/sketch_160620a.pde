ArrayList<PVector> points;
ArrayList<PVector> points2;
int inc;

void setup() {
  inc = 1;
  size(600, 600);
  makeCircle();
}

void draw() {
  background(50);
  translate(width/2, height/2);
  drawPoints();
}

void drawPoints(){
  stroke(255);
  beginShape();
  for (PVector v : points) {
    vertex(v.x, v.y);
  }
  endShape();
}
void mousePressed() {
  makeCircle();
}
void makeCircle(){
  points = new ArrayList<PVector>();
  points2 = new ArrayList<PVector>();
  for (float a = 0; a < TWO_PI; a+= inc){
    float r = 200;
    PVector point  = new PVector(cos(a), sin(a));
    point.mult(r);
    points2.add(point);
  }
  points = points2;
  inc = inc/2;
}