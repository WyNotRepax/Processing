color[] newpixels;

void setup(){
  size(500,500);
  background(255);
  newpixels = new color[width*height];
  fill(255,0,0);
  //ellipse(width/2,height/2,50,50);
  noStroke();
  ellipse(width/2+100,height/2,20,20);
  fill(0,255,0);
  ellipse(width/2-100,height/2,20,20);
  
}
void draw(){
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      int index = x + y * width;
      color col;
      int[] adjindex = new int[4];
      if (x == 0){
        adjindex[1] = (x+1) + y * width;
        adjindex[3] = -1;
      }
      else if (x == width-1){
        adjindex[1] = -1;
        adjindex[3] = (x-1) + y * width;
      }
      else{
        adjindex[1] = (x+1) + y * width;
        adjindex[3] = (x-1) + y * width;
      }
      if (y == 0){
        adjindex[0] = -1;
        adjindex[2] = x + (y+1) * height;
      }
      else if (y == height-1){
        adjindex[0] = x + (y-1) * height;
        adjindex[2] = -1;
      }
      else{
        adjindex[0] = x + (y-1) * height;
        adjindex[2] = x + (y+1) * height;
      }
      int c = 1;
      float redavg = red(pixels[index]);
      float greenavg = green(pixels[index]);
      float blueavg = blue(pixels[index]);
      for(int adj : adjindex){
        if(adj != -1){
          redavg += red(pixels[adj]);
          greenavg += green(pixels[adj]);
          blueavg += blue(pixels[adj]);
          c++;
        } //<>//
      }
      redavg = redavg / c;
      greenavg = greenavg / c;
      blueavg = blueavg / c;
      col = color(redavg,greenavg,blueavg);
      newpixels[index] = col;
    }
  }
  for(int i = 0; i < pixels.length; i++){
    pixels[i] = newpixels[i];
  }
  println (red(pixels[12365]) + " " + green(pixels[10000]) + " " + blue(pixels[10000]));
  updatePixels();
}