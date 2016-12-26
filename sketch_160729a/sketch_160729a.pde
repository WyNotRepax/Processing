Player player;
Player player2;
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
Enemy enemy4;
Enemy enemy5;

void setup() {
  player = new Player(new PVector(width/2 ,height/2),0);
  player.damp = true;
  player2 = new Player(new PVector(width/2 +50,height/2),0);
  player2.damp = true;
  enemy1 = new Enemy(new PVector(300 ,300),10);
  enemy1.damp = true;
  enemy2 = new Enemy(new PVector(width-300 ,300),10);
  enemy2.damp = true;
  enemy3 = new Enemy(new PVector(width-300 ,height-300),10);
  enemy3.damp = true;
  enemy4 = new Enemy(new PVector(300 ,height-300),10);
  enemy4.damp = true;
  //fullScreen();
  size(1000,1000);
}

void draw() {
  background(255);
  enemy1.show();
  enemy1.chase(player);
  enemy1.tick();
  enemy2.show();
  enemy2.chase(player);
  enemy2.tick();
  enemy3.show();
  enemy3.chase(player);
  enemy3.tick();
  enemy4.show();
  enemy4.chase(player);
  enemy4.tick();
  player.show();
  player.tick();
  player2.show();
  player2.tick();
  //println(" player1: " + player.pos.x + ", " + player.pos.y + " player2: " + player2.pos.x + ", " + player2.pos.y);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.rightrot = true;
    }
    if (keyCode == LEFT) {
      player.leftrot = true;
    } 
    if (keyCode == UP) {
      player.accel = true;
    }
    if (keyCode == DOWN) {
      player.decel = true;
    }
  }
  else {
    if (key == 'd') {
      player2.rightrot = true;
    }
    if (key == 'a') {
      player2.leftrot = true;
    } 
    if (key == 'w') {
      player2.accel = true;
    }
    if (key == 's') {
      player2.decel = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.rightrot = false;
    } 
    else if (keyCode == LEFT) {
      player.leftrot = false;
    }  
    else if (keyCode == UP) {
      player.accel = false;
    }
    else if (keyCode == DOWN) {
      player.decel = false;
    }
  }
  else {
    if (key == 'd') {
      player2.rightrot = false;
    }
    if (key == 'a') {
      player2.leftrot = false;
    } 
    if (key == 'w') {
      player2.accel = false;
    }
    if (key == 's') {
      player2.decel = false;
    }
  }
}

class Player {
  PVector pos;
  PVector velo = new PVector(0,0);
  float rot = 0;
  
  boolean leftrot;
  boolean rightrot;
  boolean accel;
  boolean decel;
  boolean damp = false;
  
  Player(PVector position,float rotation) {
    pos = position;
    rot = rotation;
  }
  void show() {
    pushMatrix();
    translate(pos.x ,pos.y);
    rotate(rot);
    fill(0);
    beginShape();
    vertex(-6, 6);
    vertex(-6, -6);
    vertex(8, 0);
    endShape();
    //rect(0, 0, 30, 30);
    //line(0, 0, 40, 0);
    popMatrix();
  }
  
  void tick() {
    if (leftrot) {
      rot = rot - TWO_PI/60;
    }
    if (rightrot) {
      rot = rot + TWO_PI/60;
    }
    if (accel) {
      velo = velo.add(new PVector(cos(rot)*0.1,sin(rot)*0.1));
    }
    if (decel) {
      velo = velo.add(new PVector(cos(rot)*-0.1,sin(rot)*-0.1));
    }
    if (pos.x > width) {
      velo = new PVector(-velo.x,velo.y);
    }
    else if (pos.x < 0) {
      velo = new PVector(-velo.x,velo.y);
    }
    if (pos.y > height) {
      velo = new PVector(velo.x,-velo.y);
    }
    else if (pos.y < 0) {
      velo = new PVector(velo.x,-velo.y);
    }
    pos = pos.add(velo);
    if (damp) {
      velo = velo.mult(0.99);
    }
  }
}

class Enemy {
  PVector pos;
  PVector velo = new PVector(0,0);
  float rad;
  
  boolean accel;
  boolean decel;
  boolean damp = false;
  
  Enemy(PVector position,float size) {
    pos = position;
    rad = size;
  }
  void show() {
    pushMatrix();
    translate(pos.x ,pos.y);
    fill(0);
    beginShape();
    vertex((sin(0*TWO_PI/5)*rad) ,cos(0*TWO_PI/5)*rad);
    vertex((sin(1*TWO_PI/5)*rad) ,cos(1*TWO_PI/5)*rad);
    vertex((sin(2*TWO_PI/5)*rad) ,cos(2*TWO_PI/5)*rad);
    vertex((sin(3*TWO_PI/5)*rad) ,cos(3*TWO_PI/5)*rad);
    vertex((sin(4*TWO_PI/5)*rad) ,cos(4*TWO_PI/5)*rad);
    endShape();
    popMatrix();
  }
  void tick() {
    if (pos.x > width) {
      velo = new PVector(-velo.x,velo.y);
    }
    else if (pos.x < 0) {
      velo = new PVector(-velo.x,velo.y);
    }
    if (pos.y > height) {
      velo = new PVector(velo.x,-velo.y);
    }
    else if (pos.y < 0) {
      velo = new PVector(velo.x,-velo.y);
    }
    pos = pos.add(velo);
    if (damp) {
      velo = velo.mult(0.99);
    }
  }
  void chase(Player player) {
    velo = velo.add( new PVector((player.pos.x - pos.x)/pow(pow( pos.x - player.pos.x ,2) + pow( pos.y - player.pos.y ,2) ,0.5) ,(player.pos.y - pos.y)/pow(pow( pos.x - player.pos.x ,2) + pow( pos.y - player.pos.y ,2) ,0.5) ).mult(0.1));
  }
}