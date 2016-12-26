import peasy.*; //<>// //<>//
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;
float i = 0;
PVector p1 = new PVector(0,0);
PVector p2 = new PVector(0,0);
PVector p3 = new PVector(0,0);
ArrayList<PVector> points2 = new ArrayList<PVector>();
ArrayList<PVector> points3 = new ArrayList<PVector>();
void setup(){
  cam = new PeasyCam(this, 100);
  size(1000,1000,P3D);
  lights();
}







void draw(){
  background(255);
  p2 = new PVector(sin(i/400),0,cos(i/400));
  p2 = p2.mult(150);
  p2 = p2.add(p1);
  
  p3 = new PVector(sin(i/95),cos(i/95));
  p3 = p3.mult(200);
  p3 = p3.add(p2);
  i = i+(TWO_PI);
  points2.add(p2);
  points3.add(p3);
  fill(100);
  /*pushMatrix();
  translate(p1.x,p1.y,p1.z);
  sphere(25);
  popMatrix();
  //ellipse(p1.x,p1.y,25,25);
  pushMatrix();
  translate(p2.x,p2.y,p2.z);
  sphere(15);
  popMatrix();
  //ellipse(p2.x,p2.y,15,15);
  pushMatrix();
  translate(p3.x,p3.y,p3.z);
  sphere(10);
  popMatrix();
  //ellipse(p3.x,p3.y,10,10);
  rectMode(CORNERS);
  noFill();
  */
  for (int n=0;n<points3.size();n++){
    stroke(255,0,0);
    //rect(points2.get(n).x,points2.get(n).y,points3.get(n).x,points3.get(n).y);
    stroke(0,255,0);
    line(points2.get(n).x,points2.get(n).y,points2.get(n).z,points3.get(n).x,points3.get(n).y,points3.get(n).z);
  }
}