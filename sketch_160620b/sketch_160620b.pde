ArrayList<ArrayList<PVector>> lines;
boolean mouseclick = false;
int linenum = 1;

void setup(){
  size(1280,720);
}

void draw(){
  if(mouseclick){
    lines.get(linenum).add(new PVector(mouseX, mouseY));
    background(255);
    stroke(100);
    noFill();
    beginShape();
    for (PVector p : lines.get(linenum)){
      vertex(p.x,p.y);
    }
    endShape();
  }
  print(lines);
  
  
}

void mouseClicked(){
  if(mouseclick){
    lines.add(new ArrayList<PVector>());
    mouseclick = false;
  }
  else{
    mouseclick = true;
  }
}