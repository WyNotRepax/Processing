import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PVector[][] points = new PVector[100][100];
PeasyCam cam;

float getz(int x, int y){
  float z;
  z = (sin((x)/TWO_PI)*cos(y/TWO_PI))*10;
  return z;
}
void setup(){
  noSmooth();
  lights();
  for (int x = -50; x <= 49; x++){
    for(int y = -50; y<= 49; y++){
      points[x+50][y+50] = new PVector(x,y,getz(x,y));
    }
  }
  size(500,500,P3D);
  cam = new PeasyCam(this, 100);
}

void draw(){
  background(255);
  for(PVector[] p1 : points){
    for(PVector p : p1){
      point(p.x,p.y,p.z);
      
      /*
      pushMatrix();
      stroke(255,0,0);
      box(10);
      translate(p.x,p.x,p.z);
      popMatrix();
      */
    }
  }
}