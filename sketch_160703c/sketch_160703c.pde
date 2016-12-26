import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;



void setup(){
  size(1250,720,P3D);
  cam = new PeasyCam(this,100);
}

void draw(){
  background(255);
  for(int x = -10; x<=10; x++){
    for(int y = -10; y<=10; y++){
      for(int z = -10; z<=10; z++){
        float r = map(x,-10,10,0,255);
        float g = map(y,-10,10,0,255);
        float b = map(z,-10,10,0,255);
        noStroke();
        fill(r,g,b);
        pushMatrix();
        translate(x*5,y*5,z*5);
        box(2);
        popMatrix();
        point(x*5,y*5,z*5);
      }
    }
  }
}