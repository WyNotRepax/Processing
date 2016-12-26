int t;
float T;
float lamda;
ArrayList<PVector> points;
void setup(){
  size(1280,720);
  lamda = 0;
  T = 1;
}

void draw(){
  lamda = map( mouseX, 0, width, 0, 500);
  T = map( mouseY, 0, height, 0.1, 60);
  points = new ArrayList<PVector>();
  background(255);
  translate(0,height/2);
  for(int x = 0 ; x < width ; x++){
    points.add(getpoint(t,x,T,lamda));
  }
  for(int x = 0 ; x < width-1 ; x++){
    line(points.get(x).x,points.get(x).y,points.get(x+1).x,points.get(x+1).y);
  }
  t++;
}

PVector getpoint(float t, float x, float period, float lamda){
  return new PVector(x, pow(2,-(x/500))*300*sin(TWO_PI*((t/period)-(x/lamda))));
}