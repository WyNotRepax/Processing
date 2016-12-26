import peasy.*; //<>// //<>//
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;


PeasyCam cam;
ArrayList<Sqr> sqrs;
Sqr s1 = new Sqr(0,0,650);
void setup(){
  sqrs = new ArrayList<Sqr>();
  sqrs.add(s1);
  size(720,720,P3D);
  cam = new PeasyCam(this,100);
}

void draw(){
  background(255);
  for(Sqr s : sqrs){
    if(s != null ){s.display();}
  }
}

void mouseClicked() {
  ArrayList<Sqr> temp = new ArrayList<Sqr>();
  for(Sqr s : sqrs){
    if (s.active()){
      for(Sqr c : s.step()){
        temp.add(c);
      }
    }
  }
  for(Sqr t : temp){
    sqrs.add(t);
  }
}












class Sqr{
  float x;
  float y;
  float d;
  boolean show;
  
  Sqr(float xcord, float ycord, float size){
    x = xcord;
    y = ycord;
    d = size;
    show = true;
  }
  void display(){
    if(show){
      fill(0);
      stroke(0);
      /*
      pushMatrix();
      translate(c.x,c.y);
      box(d);
      */
      rectMode(CENTER);
      rect(x,y,d,d);
    }
  }
  
  Sqr[] step(){
    Sqr[] child = new Sqr[8];
    child[0] = new Sqr(x-d/3,y+d/3,d/3);
    child[1] = new Sqr(x    ,y+d/3,d/3);
    child[2] = new Sqr(x+d/3,y+d/3,d/3);
    child[3] = new Sqr(x-d/3,y    ,d/3);
    child[4] = new Sqr(x+d/3,y    ,d/3);
    child[5] = new Sqr(x-d/3,y-d/3,d/3);
    child[6] = new Sqr(x    ,y-d/3,d/3);
    child[7] = new Sqr(x+d/3,y-d/3,d/3);
    show = false;
    return child;
  }
  
  boolean active(){return show;}
}