Player p;
EnemyRock e;

void setup() {
  size(1280,720);
  p = new Player();
  e = new EnemyRock(new PVector(15,15),10);
}

void draw() {
  background(255);
  translate(-p.pos.x+(width/2),-p.pos.y+(height/2));
  p.update();
  e.update();
  ellipse(0,0,10,10);
}

void keyPressed(){
  dokey(true);
}

void keyReleased(){
  dokey(false); //<>//
}

void dokey(boolean pr){
    if (key == 'w'){
    p.isaccel = pr;
    
  }
  else if (key == 's'){
    p.isdecel = pr;
  }
  else if (key == 'd'){
    p.rotright = pr;
  }
  else if (key == 'a'){
    p.rotleft = pr;
  }
}