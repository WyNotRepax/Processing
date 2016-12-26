
void quad3d(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4){
  beginShape();
  vertex(x1,y1,z1);
  vertex(x2,y2,z2);
  vertex(x3,y3,z3);
  vertex(x4,y4,z4);
  vertex(x1,y1,z1);
  endShape();
}
void vecquad3d(PVector p1,PVector p2, PVector p3, PVector p4){
  beginShape();
  vertex(p1.x,p1.y,p1.z);
  vertex(p2.x,p2.y,p2.z);
  vertex(p3.x,p3.y,p3.z);
  vertex(p4.x,p4.y,p4.z);
  vertex(p1.x,p1.y,p1.z);
  endShape();
}

void vecPoint(PVector p){
  point(p.x,p.y,p.z);
}

void alllines(PVector[] points){
  if(points.length > 1){
    PVector current = points[points.length-1];
    PVector[] rest = new PVector[points.length-1];
    for(int i = points.length-2;i >= 0; i--){
      rest[i] = points[i];
    }
    for(PVector p : rest){
      line(current.x,current.y,current.z,p.x,p.y,p.z);
    }
    alllines(rest);
  }
  
  
}

void drawraute(PVector p1, PVector p2){
  PVector s1 = new PVector(0,0,0);
  PVector s2 = new PVector(0,0,0);
  if(p1.x == p2.x){
    s1 = new PVector(2*p1.x,0,0);;
  }
  if(p1.y == p2.y){
    if(s1.mag() == 0){
      s1 = new PVector(0,2*p1.y,0);
    }
    else{
      s2 = new PVector(0,2*p1.y,0);
    }
  }
  if(p1.z == p2.z){
    s2 = new PVector(0,0,2*p1.z);
  }
  vecquad3d(p1,s1,p2,s2);
}