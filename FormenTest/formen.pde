void rhombendodecaeder(float centerx, float centery, float centerz, float s){
  pushMatrix();
  translate(centerx,centery,centerz);
  PVector a = new PVector(0-s,0-s,0-s);
  PVector b = new PVector(0-s,0+s,0-s);
  PVector c = new PVector(0+s,0+s,0-s);
  PVector d = new PVector(0+s,0-s,0-s);
  PVector e = new PVector(0-s,0-s,0+s);
  PVector f = new PVector(0-s,0+s,0+s);
  PVector g = new PVector(0+s,0+s,0+s);
  PVector h = new PVector(0+s,0-s,0+s);
  drawraute(a,b);
  drawraute(a,d);
  drawraute(a,e);
  drawraute(b,c);
  drawraute(b,f);
  drawraute(c,d);
  drawraute(c,g);
  drawraute(d,h);
  drawraute(e,f);
  drawraute(e,h);
  drawraute(f,g);
  drawraute(g,h);
  popMatrix();
}

void ikosaeder(float centerx, float centery, float centerz, float s){
 pushMatrix();
 translate(centerx,centery,centerz);
 
 popMatrix();
}