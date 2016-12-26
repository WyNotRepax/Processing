import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;


PeasyCam cam;
ArrayList<Cub> cubs;
Cub s1 = new Cub(0,0,0,650);
void setup(){
  cubs = new ArrayList<Cub>();
  cubs.add(s1);
  size(720,720,P3D);
  cam = new PeasyCam(this,100);
}

void draw(){
  lights();
  background(255);
  for(Cub s : cubs){
    if(s != null ){s.display();}
  }
}

void mouseClicked() {
  ArrayList<Cub> temp = new ArrayList<Cub>();
  for(Cub s : cubs){
    if (s.active()){
      for(Cub c : s.step()){
        temp.add(c);
      }
    }
  }
  for(Cub t : temp){
    cubs.add(t);
  }
}

class Cub{
  float x;
  float y;
  float z;
  float d;
  boolean show;
  
  Cub(float xcord, float ycord, float zcord, float size){
    x = xcord;
    y = ycord;
    z = zcord;
    d = size;
    show = true;
  }
  void display(){
    if(show){
      fill(100);
      noStroke();
      pushMatrix();
      translate(x,y,z);
      box(d);
      popMatrix();
    }
  }
  
  Cub[] step(){
    Cub[] child = new Cub[20];
    child[0] = new Cub(x-d/3,y+d/3,z+d/3,d/3);
    child[1] = new Cub(x    ,y+d/3,z+d/3,d/3);
    child[2] = new Cub(x+d/3,y+d/3,z+d/3,d/3);
    child[3] = new Cub(x-d/3,y    ,z+d/3,d/3);
    child[4] = new Cub(x+d/3,y    ,z+d/3,d/3);
    child[5] = new Cub(x-d/3,y-d/3,z+d/3,d/3);
    child[6] = new Cub(x    ,y-d/3,z+d/3,d/3);
    child[7] = new Cub(x+d/3,y-d/3,z+d/3,d/3);
    
    child[8]  = new Cub(x-d/3,y+d/3,z    ,d/3);
    child[9]  = new Cub(x+d/3,y-d/3,z    ,d/3);
    child[10] = new Cub(x+d/3,y+d/3,z    ,d/3);
    child[11] = new Cub(x-d/3,y-d/3,z    ,d/3);
    
    child[12] = new Cub(x-d/3,y+d/3,z-d/3,d/3);
    child[13] = new Cub(x    ,y+d/3,z-d/3,d/3);
    child[14] = new Cub(x+d/3,y+d/3,z-d/3,d/3);
    child[15] = new Cub(x-d/3,y    ,z-d/3,d/3);
    child[16] = new Cub(x+d/3,y    ,z-d/3,d/3);
    child[17] = new Cub(x-d/3,y-d/3,z-d/3,d/3);
    child[18] = new Cub(x    ,y-d/3,z-d/3,d/3);
    child[19] = new Cub(x+d/3,y-d/3,z-d/3,d/3);
    show = false;
    return child;
  }
  
  boolean active(){return show;}
}