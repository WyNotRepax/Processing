ArrayList<circle> c; 
float outr;

void setup(){
  size(900,900);
  colorMode(HSB);
  c = new ArrayList<circle>();
  outr = 300;
  for (int n = 5 ; n < outr ; n = n + 5){
    c.add(new circle(map(n , 5 , outr , 0 , 255), n , map(n , 5 , outr , 0 , TWO_PI)));
  }
  strokeWeight(7);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  for ( circle circ : c) {
    circ.draw();
  }
}

class circle{
  float c;
  float r;
  float t;
  float i;
  float ic;
  float cic;
  
  circle(float col, float radius, float startt){
    c = col;
    r = radius;
    t = startt;
    ic = TWO_PI /100;
    cic = TWO_PI / 500;
  }
  
  void draw(){
    i = (sin(t)+1)*PI/2;
    stroke(c,255,255);
    for (float n = 0 ; n<i ; n = n+cic){
      line(-1*(r*cos(n)),r*sin(n),-1*(r*cos(n+cic)),r*sin(n+cic));
      line(-1*(r*cos(n)),-1*(r*sin(n)),-1*(r*cos(n+cic)),-1*(r*sin(n+cic)));
    }
    t = t+ ic;
  }

}