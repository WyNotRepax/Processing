import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;


PeasyCam cam;
float phi= 0;
float incrot = TWO_PI/50;
float incheight = 0.5;
ArrayList<PVector> points;

void setup(){
  points = new ArrayList<PVector>();
  cam = new PeasyCam(this,100);
  size(500,500,P3D);
  generatePoints();
}

void draw(){
  background(255); //<>//
  drawPoints();
}

void generatePoints(){
  for (float z = 0; z <=100; z = z+incheight){
    points.add(new PVector(sin(phi)*10,cos(phi)*10,z));
    phi = phi+incrot;
  }
}
void drawPoints(){
  noFill();
  beginShape();
  for( PVector p : points){
    vertex(p.x,p.y,p.z);
  }
  endShape();
}