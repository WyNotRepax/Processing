PVector p1 = new PVector(10,10);
PVector p2 = new PVector(490,10);
PVector p3 = new PVector(490,490);
int n = 0;

void setup(){
  size(500,500);
  bezier(p1,p2,p3,500);
  bezier(p2,p3,p1,500);
  bezier(p3,p1,p2,500);
  ellipse(p1.x,p1.y,10,10);
  ellipse(p2.x,p2.y,10,10);
  ellipse(p3.x,p3.y,10,10);
}

void draw(){
  
}


void mousePressed(){
  if(n%3 == 0){
    p1.set(mouseX,mouseY);
  }
  else if(n%3 == 1){
    p2.set(mouseX,mouseY);
  }
  else if(n%3 == 2){
    p3.set(mouseX,mouseY);
  }
  background(255);
  bezier(p1,p2,p3,500);
  bezier(p2,p3,p1,500);
  bezier(p3,p1,p2,500);
  ellipse(p1.x,p1.y,10,10);
  ellipse(p2.x,p2.y,10,10);
  ellipse(p3.x,p3.y,10,10);
  n++;
}

void line(PVector[] points){
  for (int i = 1; i < points.length; i++){
    line(points[i-1].x,points[i-1].y,points[i].x,points[i].y);
  }
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
  println("debug"); //<>//
  line(points);
}