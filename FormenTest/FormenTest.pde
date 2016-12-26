import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;
void setup(){
  fullScreen(P3D);
  cam = new PeasyCam(this,100);
  ortho();
}

void draw(){
  background(255);
  fill(100);
  stroke(0);
  strokeWeight(5);
  rhombendodecaeder(0,0,0,100);
}