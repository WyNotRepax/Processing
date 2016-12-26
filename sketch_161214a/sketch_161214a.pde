
int t;






void setup() {
  fullScreen();
  colorMode(HSB);
  t = 0;
}

void draw() {
  translate(width/2,height/2);
  //rotate((TWO_PI/60)*t);
  float step = TWO_PI/100;
  for(int n = 0; n < 4000; n++){
    strokeWeight(100);
    stroke((n+t)%255,255,255);
    point(sin(step*n)*(n/3),cos(step*n)*(n/3));
  }
  t++;
}











void bezier(PVector p1, PVector p2, PVector p3, int smooth){
  PVector[] points = new PVector[smooth+1];
  float t;
  float x;
  float y;
  float z;
  for(int i = 0; i < points.length; i++){
    t = float(i)/float(smooth);
    x = (pow(1-t,2)*p1.x)+(2*t*(1-t)*p2.x)+(pow(t,2)*p3.x);
    y = (pow(1-t,2)*p1.y)+(2*t*(1-t)*p2.y)+(pow(t,2)*p3.y);
    points[i] = new PVector(x,y);
    println(t + "=" + i + "/" + smooth);
  }
  println("debug");
  for (int i = 1; i < points.length; i++){
    line(points[i-1].x,points[i-1].y,points[i].x,points[i].y);
  }
}